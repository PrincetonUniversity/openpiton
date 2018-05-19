// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: bug3584.s
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
   random seed:	435913085
   Jal stb8_18.j:	
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
	setx  0xd0df4ab0b9a809d5, %r1, %r11
	setx  0xf6bc2d1090ad22f6, %r1, %r12
	setx  0x54c3fae6e19041c9, %r1, %r13
	setx  0x641adbd4f0daae26, %r1, %r14
	setx  0x2f7d14d54f2b5906, %r1, %r15
	setx  0xd46811ea7ec58731, %r1, %r16
	setx  0x5021a72488933eb6, %r1, %r17
	setx  0x04ac673f4813f7e1, %r1, %r18
	setx  0x133f6103801908fd, %r1, %r19
	setx  0x96d92e7f4253cb68, %r1, %r20
	setx  0xcaebccd469c72bfb, %r1, %r21
	setx  0x0e4be77644ffc54d, %r1, %r22
	setx  0x4f63c708afddd424, %r1, %r23
	setx  0x187ac8e6613e9ce8, %r1, %r24
	setx  0x4e2444511c70ba08, %r1, %r25
	setx  0x8d3bbe1e18fd9c31, %r1, %r26
	setx  0x2202e0a792518494, %r1, %r27
	setx  0xe8730d41ad5793d9, %r1, %r28
	setx  0xf854ecbda16ef163, %r1, %r29
	setx  0x67fe1c08fe94020a, %r1, %r30
	setx  0x46b32aa51e1d9f47, %r1, %r31
	setx  0x0000000000000060, %r1, %r5
	setx  0x80, %r2, %r1
	wr  %r1, %r0, %asi
	ta T_CHANGE_HPRIV !To allow ASI writes to D-I caches
	setx MAIN_BASE_DATA_VA, %r1, %r2
	setx MAIN_BASE_DATA_VA, %r1, %r3
	setx MAIN_BASE_DATA_VA, %r1, %r4
	setx MAIN_BASE_DATA_VA, %r1, %r6
	setx MAIN_BASE_DATA_VA, %r1, %r7
	setx MAIN_BASE_DATA_VA, %r1, %r8
	setx MAIN_BASE_DATA_VA, %r1, %r9
	setx MAIN_BASE_DATA_VA, %r1, %r10
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
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr0_loop_0:
	.word 0xb4108005  ! 9: OR_R	or 	%r2, %r5, %r26
	.word 0x9a01c005  ! 9: ADD_R	add 	%r7, %r5, %r13
	.word 0xa211c005  ! 9: OR_R	or 	%r7, %r5, %r17
	.word 0xae108005  ! 9: OR_R	or 	%r2, %r5, %r23
	.word 0xb409e959  ! 9: AND_I	and 	%r7, 0x0959, %r26
	.word 0xbe110005  ! 9: OR_R	or 	%r4, %r5, %r31
	.word 0xa0090005  ! 9: AND_R	and 	%r4, %r5, %r16
	.word 0xaa1128fa  ! 9: OR_I	or 	%r4, 0x08fa, %r21
	.word 0x9e092faa  ! 9: AND_I	and 	%r4, 0x0faa, %r15
	.word 0xb011266d  ! 9: OR_I	or 	%r4, 0x066d, %r24
	.word 0xbe11a13d  ! 9: OR_I	or 	%r6, 0x013d, %r31
	.word 0xba088005  ! 9: AND_R	and 	%r2, %r5, %r29
	.word 0xbe08c005  ! 9: AND_R	and 	%r3, %r5, %r31
	.word 0xae008005  ! 9: ADD_R	add 	%r2, %r5, %r23
	.word 0xb4018005  ! 9: ADD_R	add 	%r6, %r5, %r26
	.word 0xbe110005  ! 9: OR_R	or 	%r4, %r5, %r31
	.word 0x9c00ab10  ! 9: ADD_I	add 	%r2, 0x0b10, %r14
	.word 0x9a10e627  ! 9: OR_I	or 	%r3, 0x0627, %r13
	.word 0xb2098005  ! 9: AND_R	and 	%r6, %r5, %r25
	.word 0xb409c005  ! 9: AND_R	and 	%r7, %r5, %r26
	.word 0x9c08e3fd  ! 9: AND_I	and 	%r3, 0x03fd, %r14
	.word 0xac092cdf  ! 9: AND_I	and 	%r4, 0x0cdf, %r22
	.word 0xa8110005  ! 9: OR_R	or 	%r4, %r5, %r20
	.word 0xa6088005  ! 9: AND_R	and 	%r2, %r5, %r19
	.word 0x9a008005  ! 9: ADD_R	add 	%r2, %r5, %r13
	.word 0xa0012112  ! 9: ADD_I	add 	%r4, 0x0112, %r16
	.word 0xac018005  ! 9: ADD_R	add 	%r6, %r5, %r22
	.word 0x9c10ea41  ! 9: OR_I	or 	%r3, 0x0a41, %r14
	.word 0x9a110005  ! 9: OR_R	or 	%r4, %r5, %r13
	.word 0x9c09ae5d  ! 9: AND_I	and 	%r6, 0x0e5d, %r14
	.word 0x9c10c005  ! 9: OR_R	or 	%r3, %r5, %r14
	.word 0xb2018005  ! 9: ADD_R	add 	%r6, %r5, %r25
	.word 0xb811298a  ! 9: OR_I	or 	%r4, 0x098a, %r28
	.word 0x9a098005  ! 9: AND_R	and 	%r6, %r5, %r13
	.word 0xbe008005  ! 9: ADD_R	add 	%r2, %r5, %r31
	.word 0xa0110005  ! 9: OR_R	or 	%r4, %r5, %r16
	.word 0xa001a425  ! 9: ADD_I	add 	%r6, 0x0425, %r16
	.word 0xb6008005  ! 9: ADD_R	add 	%r2, %r5, %r27
	.word 0xa200c005  ! 9: ADD_R	add 	%r3, %r5, %r17
	.word 0xa609efa9  ! 9: AND_I	and 	%r7, 0x0fa9, %r19
	.word 0x9a09a82c  ! 9: AND_I	and 	%r6, 0x082c, %r13
	.word 0xa000e6b5  ! 9: ADD_I	add 	%r3, 0x06b5, %r16
	.word 0x9c110005  ! 9: OR_R	or 	%r4, %r5, %r14
	.word 0xbe088005  ! 9: AND_R	and 	%r2, %r5, %r31
	.word 0xb4118005  ! 9: OR_R	or 	%r6, %r5, %r26
	.word 0x9e112248  ! 9: OR_I	or 	%r4, 0x0248, %r15
	.word 0xa6088005  ! 9: AND_R	and 	%r2, %r5, %r19
	.word 0xa809c005  ! 9: AND_R	and 	%r7, %r5, %r20
	.word 0x9e088005  ! 9: AND_R	and 	%r2, %r5, %r15
	.word 0xae110005  ! 9: OR_R	or 	%r4, %r5, %r23
	.word 0xaa098005  ! 9: AND_R	and 	%r6, %r5, %r21
	.word 0xb6110005  ! 9: OR_R	or 	%r4, %r5, %r27
	.word 0x9a08aea8  ! 9: AND_I	and 	%r2, 0x0ea8, %r13
	.word 0xbe108005  ! 9: OR_R	or 	%r2, %r5, %r31
	.word 0xac00ad3c  ! 9: ADD_I	add 	%r2, 0x0d3c, %r22
	.word 0xa0108005  ! 9: OR_R	or 	%r2, %r5, %r16
	.word 0xb601211d  ! 9: ADD_I	add 	%r4, 0x011d, %r27
	.word 0xbc09eef1  ! 9: AND_I	and 	%r7, 0x0ef1, %r30
	.word 0xa009ed73  ! 9: AND_I	and 	%r7, 0x0d73, %r16
	.word 0x9a10a273  ! 9: OR_I	or 	%r2, 0x0273, %r13
	.word 0xb000a008  ! 9: ADD_I	add 	%r2, 0x0008, %r24
	.word 0xac012401  ! 9: ADD_I	add 	%r4, 0x0401, %r22
	.word 0xb209ee2d  ! 9: AND_I	and 	%r7, 0x0e2d, %r25
	.word 0xbe018005  ! 9: ADD_R	add 	%r6, %r5, %r31
	.word 0x9c01e6fd  ! 9: ADD_I	add 	%r7, 0x06fd, %r14
	.word 0xb200c005  ! 9: ADD_R	add 	%r3, %r5, %r25
	.word 0xac088005  ! 9: AND_R	and 	%r2, %r5, %r22
	.word 0xa208a07d  ! 9: AND_I	and 	%r2, 0x007d, %r17
	.word 0xa608a389  ! 9: AND_I	and 	%r2, 0x0389, %r19
	.word 0x9c088005  ! 9: AND_R	and 	%r2, %r5, %r14
	.word 0xb6090005  ! 9: AND_R	and 	%r4, %r5, %r27
	.word 0xa410af81  ! 9: OR_I	or 	%r2, 0x0f81, %r18
	.word 0xbc010005  ! 9: ADD_R	add 	%r4, %r5, %r30
	.word 0xb0008005  ! 9: ADD_R	add 	%r2, %r5, %r24
	.word 0xb6090005  ! 9: AND_R	and 	%r4, %r5, %r27
	.word 0xb011ac0a  ! 9: OR_I	or 	%r6, 0x0c0a, %r24
	.word 0xa6110005  ! 9: OR_R	or 	%r4, %r5, %r19
	.word 0x9a08a5b9  ! 9: AND_I	and 	%r2, 0x05b9, %r13
	.word 0xba088005  ! 9: AND_R	and 	%r2, %r5, %r29
	.word 0xbe01293a  ! 9: ADD_I	add 	%r4, 0x093a, %r31
	.word 0x9c012031  ! 9: ADD_I	add 	%r4, 0x0031, %r14
	.word 0xac0124eb  ! 9: ADD_I	add 	%r4, 0x04eb, %r22
	.word 0xb009c005  ! 9: AND_R	and 	%r7, %r5, %r24
	.word 0xb400e0fc  ! 9: ADD_I	add 	%r3, 0x00fc, %r26
	.word 0xb209a422  ! 9: AND_I	and 	%r6, 0x0422, %r25
	.word 0xa8008005  ! 9: ADD_R	add 	%r2, %r5, %r20
	.word 0xa209e1f0  ! 9: AND_I	and 	%r7, 0x01f0, %r17
	.word 0x9a098005  ! 9: AND_R	and 	%r6, %r5, %r13
	.word 0x9c11c005  ! 9: OR_R	or 	%r7, %r5, %r14
	.word 0xae090005  ! 9: AND_R	and 	%r4, %r5, %r23
	.word 0xb409add7  ! 9: AND_I	and 	%r6, 0x0dd7, %r26
	.word 0x9c088005  ! 9: AND_R	and 	%r2, %r5, %r14
	.word 0xa6098005  ! 9: AND_R	and 	%r6, %r5, %r19
	.word 0xb408c005  ! 9: AND_R	and 	%r3, %r5, %r26
	.word 0xb411e393  ! 9: OR_I	or 	%r7, 0x0393, %r26
	.word 0xac112230  ! 9: OR_I	or 	%r4, 0x0230, %r22
	.word 0xbe11a5f0  ! 9: OR_I	or 	%r6, 0x05f0, %r31
	.word 0xa6010005  ! 9: ADD_R	add 	%r4, %r5, %r19
	.word 0xb609c005  ! 9: AND_R	and 	%r7, %r5, %r27
	.word 0xb811ee3b  ! 9: OR_I	or 	%r7, 0x0e3b, %r28
	.word 0x9e09ec20  ! 9: AND_I	and 	%r7, 0x0c20, %r15
	.word 0xb8010005  ! 9: ADD_R	add 	%r4, %r5, %r28
	.word 0x9a08a69f  ! 9: AND_I	and 	%r2, 0x069f, %r13
	.word 0xa000c005  ! 9: ADD_R	add 	%r3, %r5, %r16
	.word 0xb809c005  ! 9: AND_R	and 	%r7, %r5, %r28
	.word 0x9a008005  ! 9: ADD_R	add 	%r2, %r5, %r13
	.word 0xa8110005  ! 9: OR_R	or 	%r4, %r5, %r20
	.word 0xac088005  ! 9: AND_R	and 	%r2, %r5, %r22
	.word 0xa400a5b0  ! 9: ADD_I	add 	%r2, 0x05b0, %r18
	.word 0xaa08aa12  ! 9: AND_I	and 	%r2, 0x0a12, %r21
	.word 0xbc108005  ! 9: OR_R	or 	%r2, %r5, %r30
	.word 0xaa00e55c  ! 9: ADD_I	add 	%r3, 0x055c, %r21
	.word 0xb400a665  ! 9: ADD_I	add 	%r2, 0x0665, %r26
	.word 0xa4118005  ! 9: OR_R	or 	%r6, %r5, %r18
	.word 0xa011a34f  ! 9: OR_I	or 	%r6, 0x034f, %r16
	.word 0xba08a750  ! 9: AND_I	and 	%r2, 0x0750, %r29
	.word 0xbe11c005  ! 9: OR_R	or 	%r7, %r5, %r31
	.word 0x9a11c005  ! 9: OR_R	or 	%r7, %r5, %r13
	.word 0x9c10a2fe  ! 9: OR_I	or 	%r2, 0x02fe, %r14
	.word 0x9e088005  ! 9: AND_R	and 	%r2, %r5, %r15
	.word 0xbc10a561  ! 9: OR_I	or 	%r2, 0x0561, %r30
	.word 0x9a00ae22  ! 9: ADD_I	add 	%r2, 0x0e22, %r13
	.word 0xa200a1ac  ! 9: ADD_I	add 	%r2, 0x01ac, %r17
	.word 0x9c00a3c9  ! 9: ADD_I	add 	%r2, 0x03c9, %r14
	.word 0xb6088005  ! 9: AND_R	and 	%r2, %r5, %r27
	.word 0xa6012d27  ! 9: ADD_I	add 	%r4, 0x0d27, %r19
	.word 0xa611e59a  ! 9: OR_I	or 	%r7, 0x059a, %r19
	.word 0xac00c005  ! 9: ADD_R	add 	%r3, %r5, %r22
	.word 0xbc00ef39  ! 9: ADD_I	add 	%r3, 0x0f39, %r30
	.word 0xa4098005  ! 9: AND_R	and 	%r6, %r5, %r18
	.word 0xac010005  ! 9: ADD_R	add 	%r4, %r5, %r22
	.word 0xb600efb7  ! 9: ADD_I	add 	%r3, 0x0fb7, %r27
	.word 0xb801c005  ! 9: ADD_R	add 	%r7, %r5, %r28
	.word 0xb008e803  ! 9: AND_I	and 	%r3, 0x0803, %r24
	.word 0x9e008005  ! 9: ADD_R	add 	%r2, %r5, %r15
	.word 0xb808a663  ! 9: AND_I	and 	%r2, 0x0663, %r28
	.word 0xaa118005  ! 9: OR_R	or 	%r6, %r5, %r21
	.word 0xb208a282  ! 9: AND_I	and 	%r2, 0x0282, %r25
	.word 0xba012a16  ! 9: ADD_I	add 	%r4, 0x0a16, %r29
	.word 0xb8010005  ! 9: ADD_R	add 	%r4, %r5, %r28
	.word 0xae09aaf4  ! 9: AND_I	and 	%r6, 0x0af4, %r23
	.word 0x9a010005  ! 9: ADD_R	add 	%r4, %r5, %r13
	.word 0xb8112c2c  ! 9: OR_I	or 	%r4, 0x0c2c, %r28
	.word 0xba088005  ! 9: AND_R	and 	%r2, %r5, %r29
	.word 0x9e00e319  ! 9: ADD_I	add 	%r3, 0x0319, %r15
	.word 0xb200e129  ! 9: ADD_I	add 	%r3, 0x0129, %r25
	.word 0xb801ac02  ! 9: ADD_I	add 	%r6, 0x0c02, %r28
	.word 0x9a09a501  ! 9: AND_I	and 	%r6, 0x0501, %r13
	.word 0xaa008005  ! 9: ADD_R	add 	%r2, %r5, %r21
	.word 0xae112168  ! 9: OR_I	or 	%r4, 0x0168, %r23
	.word 0xa8108005  ! 9: OR_R	or 	%r2, %r5, %r20
	.word 0xaa088005  ! 9: AND_R	and 	%r2, %r5, %r21
	.word 0x9e08c005  ! 9: AND_R	and 	%r3, %r5, %r15
	.word 0xbe00a7f2  ! 9: ADD_I	add 	%r2, 0x07f2, %r31
	.word 0xbc108005  ! 9: OR_R	or 	%r2, %r5, %r30
	.word 0x9a09a818  ! 9: AND_I	and 	%r6, 0x0818, %r13
	.word 0xbc10a6d4  ! 9: OR_I	or 	%r2, 0x06d4, %r30
	.word 0xae00a562  ! 9: ADD_I	add 	%r2, 0x0562, %r23
	.word 0xb009c005  ! 9: AND_R	and 	%r7, %r5, %r24
	.word 0xae108005  ! 9: OR_R	or 	%r2, %r5, %r23
	.word 0x9e1124f6  ! 9: OR_I	or 	%r4, 0x04f6, %r15
	.word 0xa6088005  ! 9: AND_R	and 	%r2, %r5, %r19
	.word 0x9a11e896  ! 9: OR_I	or 	%r7, 0x0896, %r13
	.word 0x9e08c005  ! 9: AND_R	and 	%r3, %r5, %r15
	.word 0xbc090005  ! 9: AND_R	and 	%r4, %r5, %r30
	.word 0x9a108005  ! 9: OR_R	or 	%r2, %r5, %r13
	.word 0xa2098005  ! 9: AND_R	and 	%r6, %r5, %r17
	.word 0xb411a7cf  ! 9: OR_I	or 	%r6, 0x07cf, %r26
	.word 0x9c008005  ! 9: ADD_R	add 	%r2, %r5, %r14
	.word 0xa200e2c5  ! 9: ADD_I	add 	%r3, 0x02c5, %r17
	.word 0xae090005  ! 9: AND_R	and 	%r4, %r5, %r23
	.word 0x9e108005  ! 9: OR_R	or 	%r2, %r5, %r15
	.word 0xbe098005  ! 9: AND_R	and 	%r6, %r5, %r31
	.word 0xaa010005  ! 9: ADD_R	add 	%r4, %r5, %r21
	.word 0xac00c005  ! 9: ADD_R	add 	%r3, %r5, %r22
	.word 0xac00c005  ! 9: ADD_R	add 	%r3, %r5, %r22
	.word 0xae00a012  ! 9: ADD_I	add 	%r2, 0x0012, %r23
	.word 0xa001e41b  ! 9: ADD_I	add 	%r7, 0x041b, %r16
	.word 0xba092e59  ! 9: AND_I	and 	%r4, 0x0e59, %r29
	.word 0xb010c005  ! 9: OR_R	or 	%r3, %r5, %r24
	.word 0xae01ef71  ! 9: ADD_I	add 	%r7, 0x0f71, %r23
	.word 0xbc08aaa0  ! 9: AND_I	and 	%r2, 0x0aa0, %r30
	.word 0xa8118005  ! 9: OR_R	or 	%r6, %r5, %r20
	.word 0xbe00ae93  ! 9: ADD_I	add 	%r2, 0x0e93, %r31
	.word 0x9e10a240  ! 9: OR_I	or 	%r2, 0x0240, %r15
	.word 0xb611c005  ! 9: OR_R	or 	%r7, %r5, %r27
	.word 0xa0112c6d  ! 9: OR_I	or 	%r4, 0x0c6d, %r16
	.word 0x9a09c005  ! 9: AND_R	and 	%r7, %r5, %r13
	.word 0xbc01aaed  ! 9: ADD_I	add 	%r6, 0x0aed, %r30
	.word 0xb411aa1a  ! 9: OR_I	or 	%r6, 0x0a1a, %r26
	.word 0xa2112eb1  ! 9: OR_I	or 	%r4, 0x0eb1, %r17
	.word 0xba012a96  ! 9: ADD_I	add 	%r4, 0x0a96, %r29
	.word 0xb0008005  ! 9: ADD_R	add 	%r2, %r5, %r24
	.word 0x9c10e079  ! 9: OR_I	or 	%r3, 0x0079, %r14
	.word 0xae09a856  ! 9: AND_I	and 	%r6, 0x0856, %r23
	.word 0xaa090005  ! 9: AND_R	and 	%r4, %r5, %r21
	.word 0xa008a62e  ! 9: AND_I	and 	%r2, 0x062e, %r16
	.word 0xa4110005  ! 9: OR_R	or 	%r4, %r5, %r18
	.word 0x9c108005  ! 9: OR_R	or 	%r2, %r5, %r14
	.word 0xa600c005  ! 9: ADD_R	add 	%r3, %r5, %r19
	.word 0xf021aa50  ! 9: STW_I	stw	%r24, [%r6 + 0x0a50]
	.word 0xdc31ade0  ! 9: STH_I	sth	%r14, [%r6 + 0x0de0]
	.word 0xe2712650  ! 9: STX_I	stx	%r17, [%r4 + 0x0650]
	.word 0xe870e060  ! 9: STX_I	stx	%r20, [%r3 + 0x0060]
IRF_CE_0:
!$EV error(0,expr(@VA(.MAIN.IRF_CE_0), 16, 16), 1,IRF,ce,27,x, x,x,x, x,x,x)
!$EV error(0,expr(@VA(.MAIN.IRF_CE_0), 16, 16), 3,IRF,ce,53,x, x,x,x, x,x,x)
	.word 0xda21ea0c  ! 9: STW_I	stw	%r13, [%r7 + 0x0a0c]
	.word 0xf028a847  ! 9: STB_I	stb	%r24, [%r2 + 0x0847]
	.word 0xf629ae6e  ! 9: STB_I	stb	%r27, [%r6 + 0x0e6e]
	.word 0xece8d005  ! 9: LDSTUBA_R	ldstuba	%r22, [%r3 + %r5] 0x80
	.word 0xb6090005  ! 9: AND_R	and 	%r4, %r5, %r27
	.word 0x9e00c005  ! 9: ADD_R	add 	%r3, %r5, %r15
	bne thr0_loop_0
	subcc %g1, 0x1, %g1
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr0_loop_1:
	.word 0xa000a526  ! 16: ADD_I	add 	%r2, 0x0526, %r16
	.word 0xb001c005  ! 16: ADD_R	add 	%r7, %r5, %r24
	.word 0xbc118005  ! 16: OR_R	or 	%r6, %r5, %r30
	.word 0x9c018005  ! 16: ADD_R	add 	%r6, %r5, %r14
	.word 0x9a01ac91  ! 16: ADD_I	add 	%r6, 0x0c91, %r13
	.word 0xbc01c005  ! 16: ADD_R	add 	%r7, %r5, %r30
	.word 0xb610a22c  ! 16: OR_I	or 	%r2, 0x022c, %r27
	.word 0xa2110005  ! 16: OR_R	or 	%r4, %r5, %r17
	.word 0xb609e47c  ! 16: AND_I	and 	%r7, 0x047c, %r27
	.word 0xb810aad8  ! 16: OR_I	or 	%r2, 0x0ad8, %r28
	.word 0xba10aeb0  ! 16: OR_I	or 	%r2, 0x0eb0, %r29
	.word 0xa608a163  ! 16: AND_I	and 	%r2, 0x0163, %r19
	.word 0xb409e369  ! 16: AND_I	and 	%r7, 0x0369, %r26
	.word 0xa201a79e  ! 16: ADD_I	add 	%r6, 0x079e, %r17
	.word 0xa2090005  ! 16: AND_R	and 	%r4, %r5, %r17
	.word 0xba00a2c7  ! 16: ADD_I	add 	%r2, 0x02c7, %r29
	.word 0xa211c005  ! 16: OR_R	or 	%r7, %r5, %r17
	.word 0xba11c005  ! 16: OR_R	or 	%r7, %r5, %r29
	.word 0x9c108005  ! 16: OR_R	or 	%r2, %r5, %r14
	.word 0xa0108005  ! 16: OR_R	or 	%r2, %r5, %r16
	.word 0x9e00adee  ! 16: ADD_I	add 	%r2, 0x0dee, %r15
	.word 0xb410e23d  ! 16: OR_I	or 	%r3, 0x023d, %r26
	.word 0xb20927da  ! 16: AND_I	and 	%r4, 0x07da, %r25
	.word 0xbe092f45  ! 16: AND_I	and 	%r4, 0x0f45, %r31
	.word 0xac08aedb  ! 16: AND_I	and 	%r2, 0x0edb, %r22
	.word 0xa4010005  ! 16: ADD_R	add 	%r4, %r5, %r18
	.word 0xbe092039  ! 16: AND_I	and 	%r4, 0x0039, %r31
	.word 0xb600a6e1  ! 16: ADD_I	add 	%r2, 0x06e1, %r27
	.word 0xae08aad8  ! 16: AND_I	and 	%r2, 0x0ad8, %r23
	.word 0xba09af74  ! 16: AND_I	and 	%r6, 0x0f74, %r29
	.word 0xaa01a67e  ! 16: ADD_I	add 	%r6, 0x067e, %r21
	.word 0xbe018005  ! 16: ADD_R	add 	%r6, %r5, %r31
	.word 0x9a09e8fe  ! 16: AND_I	and 	%r7, 0x08fe, %r13
	.word 0xa8018005  ! 16: ADD_R	add 	%r6, %r5, %r20
	.word 0xae00e4f3  ! 16: ADD_I	add 	%r3, 0x04f3, %r23
	.word 0xa201c005  ! 16: ADD_R	add 	%r7, %r5, %r17
	.word 0xae108005  ! 16: OR_R	or 	%r2, %r5, %r23
	.word 0x9e108005  ! 16: OR_R	or 	%r2, %r5, %r15
	.word 0xa208ab4b  ! 16: AND_I	and 	%r2, 0x0b4b, %r17
	.word 0xb8108005  ! 16: OR_R	or 	%r2, %r5, %r28
	.word 0xb011c005  ! 16: OR_R	or 	%r7, %r5, %r24
	.word 0xb809ea77  ! 16: AND_I	and 	%r7, 0x0a77, %r28
	.word 0x9c01c005  ! 16: ADD_R	add 	%r7, %r5, %r14
	.word 0xbe00aece  ! 16: ADD_I	add 	%r2, 0x0ece, %r31
	.word 0x9e008005  ! 16: ADD_R	add 	%r2, %r5, %r15
	.word 0xa210a082  ! 16: OR_I	or 	%r2, 0x0082, %r17
	.word 0x9e00c005  ! 16: ADD_R	add 	%r3, %r5, %r15
	.word 0x9e01afbc  ! 16: ADD_I	add 	%r6, 0x0fbc, %r15
	.word 0xa810ecea  ! 16: OR_I	or 	%r3, 0x0cea, %r20
	.word 0xa408c005  ! 16: AND_R	and 	%r3, %r5, %r18
	.word 0xac008005  ! 16: ADD_R	add 	%r2, %r5, %r22
	.word 0xa208a9c1  ! 16: AND_I	and 	%r2, 0x09c1, %r17
	.word 0x9a098005  ! 16: AND_R	and 	%r6, %r5, %r13
	.word 0xbc00c005  ! 16: ADD_R	add 	%r3, %r5, %r30
	.word 0xa81123c7  ! 16: OR_I	or 	%r4, 0x03c7, %r20
	.word 0xa0090005  ! 16: AND_R	and 	%r4, %r5, %r16
	.word 0xa811e692  ! 16: OR_I	or 	%r7, 0x0692, %r20
	.word 0xb8108005  ! 16: OR_R	or 	%r2, %r5, %r28
	.word 0xae11aa81  ! 16: OR_I	or 	%r6, 0x0a81, %r23
	.word 0xae01c005  ! 16: ADD_R	add 	%r7, %r5, %r23
	.word 0xa008ebbb  ! 16: AND_I	and 	%r3, 0x0bbb, %r16
	.word 0xa608ad17  ! 16: AND_I	and 	%r2, 0x0d17, %r19
	.word 0xa209c005  ! 16: AND_R	and 	%r7, %r5, %r17
	.word 0x9c008005  ! 16: ADD_R	add 	%r2, %r5, %r14
	.word 0xb2098005  ! 16: AND_R	and 	%r6, %r5, %r25
	.word 0xa808a80b  ! 16: AND_I	and 	%r2, 0x080b, %r20
	.word 0xa809232c  ! 16: AND_I	and 	%r4, 0x032c, %r20
	.word 0xb811e5e8  ! 16: OR_I	or 	%r7, 0x05e8, %r28
	.word 0xa611ed8d  ! 16: OR_I	or 	%r7, 0x0d8d, %r19
	.word 0xb4098005  ! 16: AND_R	and 	%r6, %r5, %r26
	.word 0xbe10c005  ! 16: OR_R	or 	%r3, %r5, %r31
	.word 0xb00120b9  ! 16: ADD_I	add 	%r4, 0x00b9, %r24
	.word 0xb601ab6f  ! 16: ADD_I	add 	%r6, 0x0b6f, %r27
	.word 0x9a10a606  ! 16: OR_I	or 	%r2, 0x0606, %r13
	.word 0xa6098005  ! 16: AND_R	and 	%r6, %r5, %r19
	.word 0xb409e3fa  ! 16: AND_I	and 	%r7, 0x03fa, %r26
	.word 0xa408c005  ! 16: AND_R	and 	%r3, %r5, %r18
	.word 0xa4008005  ! 16: ADD_R	add 	%r2, %r5, %r18
	.word 0xb6008005  ! 16: ADD_R	add 	%r2, %r5, %r27
	.word 0xbc00a0fd  ! 16: ADD_I	add 	%r2, 0x00fd, %r30
	.word 0xbe108005  ! 16: OR_R	or 	%r2, %r5, %r31
	.word 0xaa01c005  ! 16: ADD_R	add 	%r7, %r5, %r21
	.word 0xaa10c005  ! 16: OR_R	or 	%r3, %r5, %r21
	.word 0xa008acfd  ! 16: AND_I	and 	%r2, 0x0cfd, %r16
	.word 0xb411a32d  ! 16: OR_I	or 	%r6, 0x032d, %r26
	.word 0xa608e846  ! 16: AND_I	and 	%r3, 0x0846, %r19
	.word 0xba01e286  ! 16: ADD_I	add 	%r7, 0x0286, %r29
	.word 0xb408a4c4  ! 16: AND_I	and 	%r2, 0x04c4, %r26
	.word 0xb000af47  ! 16: ADD_I	add 	%r2, 0x0f47, %r24
	.word 0xbc01a2c8  ! 16: ADD_I	add 	%r6, 0x02c8, %r30
	.word 0xa800e6e2  ! 16: ADD_I	add 	%r3, 0x06e2, %r20
	.word 0xa600c005  ! 16: ADD_R	add 	%r3, %r5, %r19
	.word 0xb20126bf  ! 16: ADD_I	add 	%r4, 0x06bf, %r25
	.word 0xba08a22d  ! 16: AND_I	and 	%r2, 0x022d, %r29
	.word 0xae1126ef  ! 16: OR_I	or 	%r4, 0x06ef, %r23
	.word 0xbe110005  ! 16: OR_R	or 	%r4, %r5, %r31
	.word 0xbe010005  ! 16: ADD_R	add 	%r4, %r5, %r31
	.word 0xba00e497  ! 16: ADD_I	add 	%r3, 0x0497, %r29
	.word 0xa40929b5  ! 16: AND_I	and 	%r4, 0x09b5, %r18
	.word 0xa009c005  ! 16: AND_R	and 	%r7, %r5, %r16
	.word 0xb410a596  ! 16: OR_I	or 	%r2, 0x0596, %r26
	.word 0xbe00e583  ! 16: ADD_I	add 	%r3, 0x0583, %r31
	.word 0x9e010005  ! 16: ADD_R	add 	%r4, %r5, %r15
	.word 0xac088005  ! 16: AND_R	and 	%r2, %r5, %r22
	.word 0xbc08ad60  ! 16: AND_I	and 	%r2, 0x0d60, %r30
	.word 0xbc01c005  ! 16: ADD_R	add 	%r7, %r5, %r30
	.word 0xaa0924c6  ! 16: AND_I	and 	%r4, 0x04c6, %r21
	.word 0xb4018005  ! 16: ADD_R	add 	%r6, %r5, %r26
	.word 0xa001ab91  ! 16: ADD_I	add 	%r6, 0x0b91, %r16
	.word 0xa80125ed  ! 16: ADD_I	add 	%r4, 0x05ed, %r20
	.word 0xb2010005  ! 16: ADD_R	add 	%r4, %r5, %r25
	.word 0xb6118005  ! 16: OR_R	or 	%r6, %r5, %r27
	.word 0xb2008005  ! 16: ADD_R	add 	%r2, %r5, %r25
	.word 0xb010c005  ! 16: OR_R	or 	%r3, %r5, %r24
	.word 0x9e01c005  ! 16: ADD_R	add 	%r7, %r5, %r15
	.word 0xa601c005  ! 16: ADD_R	add 	%r7, %r5, %r19
	.word 0xaa11e516  ! 16: OR_I	or 	%r7, 0x0516, %r21
	.word 0x9e118005  ! 16: OR_R	or 	%r6, %r5, %r15
	.word 0x9e11e4c4  ! 16: OR_I	or 	%r7, 0x04c4, %r15
	.word 0xaa08ae71  ! 16: AND_I	and 	%r2, 0x0e71, %r21
	.word 0xb808e678  ! 16: AND_I	and 	%r3, 0x0678, %r28
	.word 0x9c090005  ! 16: AND_R	and 	%r4, %r5, %r14
	.word 0xb010c005  ! 16: OR_R	or 	%r3, %r5, %r24
	.word 0xa6118005  ! 16: OR_R	or 	%r6, %r5, %r19
	.word 0xac090005  ! 16: AND_R	and 	%r4, %r5, %r22
	.word 0xb2098005  ! 16: AND_R	and 	%r6, %r5, %r25
	.word 0xbc09a319  ! 16: AND_I	and 	%r6, 0x0319, %r30
	.word 0xa611e17e  ! 16: OR_I	or 	%r7, 0x017e, %r19
	.word 0xf820acec  ! 16: STW_I	stw	%r28, [%r2 + 0x0cec]
	.word 0xe429a81d  ! 16: STB_I	stb	%r18, [%r6 + 0x081d]
	.word 0xf628a543  ! 16: STB_I	stb	%r27, [%r2 + 0x0543]
	.word 0xe031a580  ! 16: STH_I	sth	%r16, [%r6 + 0x0580]
IRF_CE_4:
!$EV error(0,expr(@VA(.MAIN.IRF_CE_4), 16, 16), 1,IRF,ce,6,x, x,x,x, x,x,x)
!$EV error(0,expr(@VA(.MAIN.IRF_CE_4), 16, 16), 3,IRF,ce,35,x, x,x,x, x,x,x)
	.word 0xf470e0b8  ! 16: STX_I	stx	%r26, [%r3 + 0x00b8]
	.word 0xec71a670  ! 16: STX_I	stx	%r22, [%r6 + 0x0670]
	.word 0xf830e908  ! 16: STH_I	sth	%r28, [%r3 + 0x0908]
	.word 0xe0788005  ! 16: SWAP_R	swap	%r16, [%r2 + %r5]
	.word 0xb0108005  ! 16: OR_R	or 	%r2, %r5, %r24
	.word 0xb4088005  ! 16: AND_R	and 	%r2, %r5, %r26
	bne thr0_loop_1
	subcc %g1, 0x1, %g1
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr0_loop_2:
	.word 0xaa00ed05  ! 23: ADD_I	add 	%r3, 0x0d05, %r21
	.word 0xac11c005  ! 23: OR_R	or 	%r7, %r5, %r22
	.word 0xac01aa7f  ! 23: ADD_I	add 	%r6, 0x0a7f, %r22
	.word 0xb408c005  ! 23: AND_R	and 	%r3, %r5, %r26
	.word 0x9c10c005  ! 23: OR_R	or 	%r3, %r5, %r14
	.word 0xa208e690  ! 23: AND_I	and 	%r3, 0x0690, %r17
	.word 0xb8018005  ! 23: ADD_R	add 	%r6, %r5, %r28
	.word 0xb2012446  ! 23: ADD_I	add 	%r4, 0x0446, %r25
	.word 0x9e108005  ! 23: OR_R	or 	%r2, %r5, %r15
	.word 0xb008c005  ! 23: AND_R	and 	%r3, %r5, %r24
	.word 0xa4008005  ! 23: ADD_R	add 	%r2, %r5, %r18
	.word 0xaa110005  ! 23: OR_R	or 	%r4, %r5, %r21
	.word 0xac010005  ! 23: ADD_R	add 	%r4, %r5, %r22
	.word 0xb2008005  ! 23: ADD_R	add 	%r2, %r5, %r25
	.word 0xb811c005  ! 23: OR_R	or 	%r7, %r5, %r28
	.word 0xb608e8e3  ! 23: AND_I	and 	%r3, 0x08e3, %r27
	.word 0xa808a8d5  ! 23: AND_I	and 	%r2, 0x08d5, %r20
	.word 0xa2088005  ! 23: AND_R	and 	%r2, %r5, %r17
	.word 0xae08ed17  ! 23: AND_I	and 	%r3, 0x0d17, %r23
	.word 0xb401e591  ! 23: ADD_I	add 	%r7, 0x0591, %r26
	.word 0xa200e80d  ! 23: ADD_I	add 	%r3, 0x080d, %r17
	.word 0xa411ed8e  ! 23: OR_I	or 	%r7, 0x0d8e, %r18
	.word 0xb208ac07  ! 23: AND_I	and 	%r2, 0x0c07, %r25
	.word 0xb601eb2d  ! 23: ADD_I	add 	%r7, 0x0b2d, %r27
	.word 0xaa088005  ! 23: AND_R	and 	%r2, %r5, %r21
	.word 0xaa00e15c  ! 23: ADD_I	add 	%r3, 0x015c, %r21
	.word 0xae088005  ! 23: AND_R	and 	%r2, %r5, %r23
	.word 0x9a11aa66  ! 23: OR_I	or 	%r6, 0x0a66, %r13
	.word 0x9e10a987  ! 23: OR_I	or 	%r2, 0x0987, %r15
	.word 0xa809e6e4  ! 23: AND_I	and 	%r7, 0x06e4, %r20
	.word 0xb610e6af  ! 23: OR_I	or 	%r3, 0x06af, %r27
	.word 0xb011e5bf  ! 23: OR_I	or 	%r7, 0x05bf, %r24
	.word 0xa0010005  ! 23: ADD_R	add 	%r4, %r5, %r16
	.word 0xba088005  ! 23: AND_R	and 	%r2, %r5, %r29
	.word 0xac108005  ! 23: OR_R	or 	%r2, %r5, %r22
	.word 0xac112d7c  ! 23: OR_I	or 	%r4, 0x0d7c, %r22
	.word 0xb600a777  ! 23: ADD_I	add 	%r2, 0x0777, %r27
	.word 0xa409c005  ! 23: AND_R	and 	%r7, %r5, %r18
	.word 0xa0110005  ! 23: OR_R	or 	%r4, %r5, %r16
	.word 0x9a10ad48  ! 23: OR_I	or 	%r2, 0x0d48, %r13
	.word 0xaa09c005  ! 23: AND_R	and 	%r7, %r5, %r21
	.word 0xbc08a4e2  ! 23: AND_I	and 	%r2, 0x04e2, %r30
	.word 0xa600c005  ! 23: ADD_R	add 	%r3, %r5, %r19
	.word 0xa6008005  ! 23: ADD_R	add 	%r2, %r5, %r19
	.word 0xb4110005  ! 23: OR_R	or 	%r4, %r5, %r26
	.word 0xb4088005  ! 23: AND_R	and 	%r2, %r5, %r26
	.word 0xb610ae40  ! 23: OR_I	or 	%r2, 0x0e40, %r27
	.word 0x9a11c005  ! 23: OR_R	or 	%r7, %r5, %r13
	.word 0xbc08a514  ! 23: AND_I	and 	%r2, 0x0514, %r30
	.word 0xbc09c005  ! 23: AND_R	and 	%r7, %r5, %r30
	.word 0x9e01ebe0  ! 23: ADD_I	add 	%r7, 0x0be0, %r15
	.word 0xb010a4b7  ! 23: OR_I	or 	%r2, 0x04b7, %r24
	.word 0xbc11a60a  ! 23: OR_I	or 	%r6, 0x060a, %r30
	.word 0x9c11ebc9  ! 23: OR_I	or 	%r7, 0x0bc9, %r14
	.word 0xba108005  ! 23: OR_R	or 	%r2, %r5, %r29
	.word 0xac1124a1  ! 23: OR_I	or 	%r4, 0x04a1, %r22
	.word 0xb4110005  ! 23: OR_R	or 	%r4, %r5, %r26
	.word 0xb208e122  ! 23: AND_I	and 	%r3, 0x0122, %r25
	.word 0xbe098005  ! 23: AND_R	and 	%r6, %r5, %r31
	.word 0xac108005  ! 23: OR_R	or 	%r2, %r5, %r22
	.word 0xbe08ac9a  ! 23: AND_I	and 	%r2, 0x0c9a, %r31
	.word 0xbc00a8d1  ! 23: ADD_I	add 	%r2, 0x08d1, %r30
	.word 0xb601c005  ! 23: ADD_R	add 	%r7, %r5, %r27
	.word 0xb6112dcc  ! 23: OR_I	or 	%r4, 0x0dcc, %r27
	.word 0xa011a253  ! 23: OR_I	or 	%r6, 0x0253, %r16
	.word 0xa4098005  ! 23: AND_R	and 	%r6, %r5, %r18
	.word 0xbc112470  ! 23: OR_I	or 	%r4, 0x0470, %r30
	.word 0xb2018005  ! 23: ADD_R	add 	%r6, %r5, %r25
	.word 0xaa08a319  ! 23: AND_I	and 	%r2, 0x0319, %r21
	.word 0xaa112001  ! 23: OR_I	or 	%r4, 0x0001, %r21
	.word 0xa808a6a5  ! 23: AND_I	and 	%r2, 0x06a5, %r20
	.word 0xa8098005  ! 23: AND_R	and 	%r6, %r5, %r20
	.word 0xb6012dae  ! 23: ADD_I	add 	%r4, 0x0dae, %r27
	.word 0xac00e3d9  ! 23: ADD_I	add 	%r3, 0x03d9, %r22
	.word 0xb6008005  ! 23: ADD_R	add 	%r2, %r5, %r27
	.word 0xa0090005  ! 23: AND_R	and 	%r4, %r5, %r16
	.word 0xb001af86  ! 23: ADD_I	add 	%r6, 0x0f86, %r24
	.word 0xba088005  ! 23: AND_R	and 	%r2, %r5, %r29
	.word 0xa2088005  ! 23: AND_R	and 	%r2, %r5, %r17
	.word 0xba008005  ! 23: ADD_R	add 	%r2, %r5, %r29
	.word 0xac00c005  ! 23: ADD_R	add 	%r3, %r5, %r22
	.word 0xbe08a71b  ! 23: AND_I	and 	%r2, 0x071b, %r31
	.word 0x9c00e65a  ! 23: ADD_I	add 	%r3, 0x065a, %r14
	.word 0x9e01c005  ! 23: ADD_R	add 	%r7, %r5, %r15
	.word 0xa2108005  ! 23: OR_R	or 	%r2, %r5, %r17
	.word 0xb409ad27  ! 23: AND_I	and 	%r6, 0x0d27, %r26
	.word 0x9c110005  ! 23: OR_R	or 	%r4, %r5, %r14
	.word 0xb201a0dc  ! 23: ADD_I	add 	%r6, 0x00dc, %r25
	.word 0xa8090005  ! 23: AND_R	and 	%r4, %r5, %r20
	.word 0xbe108005  ! 23: OR_R	or 	%r2, %r5, %r31
	.word 0xba018005  ! 23: ADD_R	add 	%r6, %r5, %r29
	.word 0xbc00aa99  ! 23: ADD_I	add 	%r2, 0x0a99, %r30
	.word 0x9c110005  ! 23: OR_R	or 	%r4, %r5, %r14
	.word 0xbe012b47  ! 23: ADD_I	add 	%r4, 0x0b47, %r31
	.word 0xbe10a959  ! 23: OR_I	or 	%r2, 0x0959, %r31
	.word 0xb810a02f  ! 23: OR_I	or 	%r2, 0x002f, %r28
	.word 0xb611e5f9  ! 23: OR_I	or 	%r7, 0x05f9, %r27
	.word 0xa209aa2e  ! 23: AND_I	and 	%r6, 0x0a2e, %r17
	.word 0xa2012790  ! 23: ADD_I	add 	%r4, 0x0790, %r17
	.word 0xb808e731  ! 23: AND_I	and 	%r3, 0x0731, %r28
	.word 0xac10a7e5  ! 23: OR_I	or 	%r2, 0x07e5, %r22
	.word 0xb0110005  ! 23: OR_R	or 	%r4, %r5, %r24
	.word 0xa010efed  ! 23: OR_I	or 	%r3, 0x0fed, %r16
	.word 0xba11c005  ! 23: OR_R	or 	%r7, %r5, %r29
	.word 0xb2110005  ! 23: OR_R	or 	%r4, %r5, %r25
	.word 0xb40120e2  ! 23: ADD_I	add 	%r4, 0x00e2, %r26
	.word 0x9e11a981  ! 23: OR_I	or 	%r6, 0x0981, %r15
	.word 0xb2088005  ! 23: AND_R	and 	%r2, %r5, %r25
	.word 0xba090005  ! 23: AND_R	and 	%r4, %r5, %r29
	.word 0xb8008005  ! 23: ADD_R	add 	%r2, %r5, %r28
	.word 0xa610e8d1  ! 23: OR_I	or 	%r3, 0x08d1, %r19
	.word 0x9a00e9dd  ! 23: ADD_I	add 	%r3, 0x09dd, %r13
	.word 0xbe09e8cf  ! 23: AND_I	and 	%r7, 0x08cf, %r31
	.word 0xba108005  ! 23: OR_R	or 	%r2, %r5, %r29
	.word 0xba01ea88  ! 23: ADD_I	add 	%r7, 0x0a88, %r29
	.word 0xb00924f0  ! 23: AND_I	and 	%r4, 0x04f0, %r24
	.word 0xba010005  ! 23: ADD_R	add 	%r4, %r5, %r29
	.word 0xb2010005  ! 23: ADD_R	add 	%r4, %r5, %r25
	.word 0x9c00a9df  ! 23: ADD_I	add 	%r2, 0x09df, %r14
	.word 0xbe00c005  ! 23: ADD_R	add 	%r3, %r5, %r31
	.word 0xba09a0a2  ! 23: AND_I	and 	%r6, 0x00a2, %r29
	.word 0xaa01c005  ! 23: ADD_R	add 	%r7, %r5, %r21
	.word 0xaa09ade4  ! 23: AND_I	and 	%r6, 0x0de4, %r21
	.word 0x9e010005  ! 23: ADD_R	add 	%r4, %r5, %r15
	.word 0xb2012201  ! 23: ADD_I	add 	%r4, 0x0201, %r25
	.word 0xbe088005  ! 23: AND_R	and 	%r2, %r5, %r31
	.word 0x9e10a7c2  ! 23: OR_I	or 	%r2, 0x07c2, %r15
	.word 0xac110005  ! 23: OR_R	or 	%r4, %r5, %r22
	.word 0x9c018005  ! 23: ADD_R	add 	%r6, %r5, %r14
	.word 0xb608c005  ! 23: AND_R	and 	%r3, %r5, %r27
	.word 0xa010a9c6  ! 23: OR_I	or 	%r2, 0x09c6, %r16
	.word 0xae08a7cb  ! 23: AND_I	and 	%r2, 0x07cb, %r23
	.word 0x9a08c005  ! 23: AND_R	and 	%r3, %r5, %r13
	.word 0xa2012031  ! 23: ADD_I	add 	%r4, 0x0031, %r17
	.word 0xaa108005  ! 23: OR_R	or 	%r2, %r5, %r21
	.word 0xa2008005  ! 23: ADD_R	add 	%r2, %r5, %r17
	.word 0x9c08a761  ! 23: AND_I	and 	%r2, 0x0761, %r14
	.word 0xac09ee40  ! 23: AND_I	and 	%r7, 0x0e40, %r22
	.word 0xac118005  ! 23: OR_R	or 	%r6, %r5, %r22
	.word 0xb201a2be  ! 23: ADD_I	add 	%r6, 0x02be, %r25
	.word 0xa009ecd3  ! 23: AND_I	and 	%r7, 0x0cd3, %r16
	.word 0xa0108005  ! 23: OR_R	or 	%r2, %r5, %r16
	.word 0xb600e1ae  ! 23: ADD_I	add 	%r3, 0x01ae, %r27
	.word 0xb2110005  ! 23: OR_R	or 	%r4, %r5, %r25
	.word 0x9c110005  ! 23: OR_R	or 	%r4, %r5, %r14
	.word 0xbe118005  ! 23: OR_R	or 	%r6, %r5, %r31
	.word 0xbc090005  ! 23: AND_R	and 	%r4, %r5, %r30
	.word 0x9a01c005  ! 23: ADD_R	add 	%r7, %r5, %r13
	.word 0xa209c005  ! 23: AND_R	and 	%r7, %r5, %r17
	.word 0xb810e837  ! 23: OR_I	or 	%r3, 0x0837, %r28
	.word 0xa610ad0a  ! 23: OR_I	or 	%r2, 0x0d0a, %r19
	.word 0x9e01249b  ! 23: ADD_I	add 	%r4, 0x049b, %r15
	.word 0xb4110005  ! 23: OR_R	or 	%r4, %r5, %r26
	.word 0xba118005  ! 23: OR_R	or 	%r6, %r5, %r29
	.word 0x9c08a17c  ! 23: AND_I	and 	%r2, 0x017c, %r14
	.word 0xa811e433  ! 23: OR_I	or 	%r7, 0x0433, %r20
	.word 0x9e098005  ! 23: AND_R	and 	%r6, %r5, %r15
	.word 0x9c0926a8  ! 23: AND_I	and 	%r4, 0x06a8, %r14
	.word 0xb211aa11  ! 23: OR_I	or 	%r6, 0x0a11, %r25
	.word 0xac090005  ! 23: AND_R	and 	%r4, %r5, %r22
	.word 0xba10c005  ! 23: OR_R	or 	%r3, %r5, %r29
	.word 0xa610a65c  ! 23: OR_I	or 	%r2, 0x065c, %r19
	.word 0xa8008005  ! 23: ADD_R	add 	%r2, %r5, %r20
	.word 0xb801af70  ! 23: ADD_I	add 	%r6, 0x0f70, %r28
	.word 0xac00e865  ! 23: ADD_I	add 	%r3, 0x0865, %r22
	.word 0x9c008005  ! 23: ADD_R	add 	%r2, %r5, %r14
	.word 0xae0126c6  ! 23: ADD_I	add 	%r4, 0x06c6, %r23
	.word 0xbc08aa36  ! 23: AND_I	and 	%r2, 0x0a36, %r30
	.word 0xbc108005  ! 23: OR_R	or 	%r2, %r5, %r30
	.word 0x9c108005  ! 23: OR_R	or 	%r2, %r5, %r14
	.word 0xb001ed4a  ! 23: ADD_I	add 	%r7, 0x0d4a, %r24
	.word 0xac00a7f2  ! 23: ADD_I	add 	%r2, 0x07f2, %r22
	.word 0xa8012b57  ! 23: ADD_I	add 	%r4, 0x0b57, %r20
	.word 0xb809aad1  ! 23: AND_I	and 	%r6, 0x0ad1, %r28
	.word 0xb601ecb0  ! 23: ADD_I	add 	%r7, 0x0cb0, %r27
	.word 0xae018005  ! 23: ADD_R	add 	%r6, %r5, %r23
	.word 0xae01e825  ! 23: ADD_I	add 	%r7, 0x0825, %r23
	.word 0x9a08c005  ! 23: AND_R	and 	%r3, %r5, %r13
	.word 0xac110005  ! 23: OR_R	or 	%r4, %r5, %r22
	.word 0xb0008005  ! 23: ADD_R	add 	%r2, %r5, %r24
	.word 0x9a088005  ! 23: AND_R	and 	%r2, %r5, %r13
	.word 0xae090005  ! 23: AND_R	and 	%r4, %r5, %r23
	.word 0xb200e08e  ! 23: ADD_I	add 	%r3, 0x008e, %r25
	.word 0x9a01af7b  ! 23: ADD_I	add 	%r6, 0x0f7b, %r13
	.word 0xb600e3ae  ! 23: ADD_I	add 	%r3, 0x03ae, %r27
	.word 0xae08a873  ! 23: AND_I	and 	%r2, 0x0873, %r23
	.word 0xa0098005  ! 23: AND_R	and 	%r6, %r5, %r16
	.word 0x9a08c005  ! 23: AND_R	and 	%r3, %r5, %r13
	.word 0xba09c005  ! 23: AND_R	and 	%r7, %r5, %r29
	.word 0xb000a878  ! 23: ADD_I	add 	%r2, 0x0878, %r24
	.word 0xa8108005  ! 23: OR_R	or 	%r2, %r5, %r20
	.word 0xb009a544  ! 23: AND_I	and 	%r6, 0x0544, %r24
	.word 0xa210c005  ! 23: OR_R	or 	%r3, %r5, %r17
	.word 0x9a01aca7  ! 23: ADD_I	add 	%r6, 0x0ca7, %r13
	.word 0xbc012cf8  ! 23: ADD_I	add 	%r4, 0x0cf8, %r30
	.word 0xa209a1d8  ! 23: AND_I	and 	%r6, 0x01d8, %r17
	.word 0x9c008005  ! 23: ADD_R	add 	%r2, %r5, %r14
	.word 0xba09266e  ! 23: AND_I	and 	%r4, 0x066e, %r29
	.word 0xa810c005  ! 23: OR_R	or 	%r3, %r5, %r20
	.word 0xae110005  ! 23: OR_R	or 	%r4, %r5, %r23
	.word 0xb008c005  ! 23: AND_R	and 	%r3, %r5, %r24
	.word 0xba01c005  ! 23: ADD_R	add 	%r7, %r5, %r29
	.word 0xae01e6d2  ! 23: ADD_I	add 	%r7, 0x06d2, %r23
	.word 0xb6088005  ! 23: AND_R	and 	%r2, %r5, %r27
	.word 0xa611a231  ! 23: OR_I	or 	%r6, 0x0231, %r19
	.word 0xb0008005  ! 23: ADD_R	add 	%r2, %r5, %r24
	.word 0xa4012924  ! 23: ADD_I	add 	%r4, 0x0924, %r18
	.word 0xa609e747  ! 23: AND_I	and 	%r7, 0x0747, %r19
	.word 0xb809c005  ! 23: AND_R	and 	%r7, %r5, %r28
	.word 0xba090005  ! 23: AND_R	and 	%r4, %r5, %r29
	.word 0xbc11c005  ! 23: OR_R	or 	%r7, %r5, %r30
	.word 0xa6008005  ! 23: ADD_R	add 	%r2, %r5, %r19
	.word 0xb409291a  ! 23: AND_I	and 	%r4, 0x091a, %r26
	.word 0xa6088005  ! 23: AND_R	and 	%r2, %r5, %r19
	.word 0xba01c005  ! 23: ADD_R	add 	%r7, %r5, %r29
	.word 0xa208c005  ! 23: AND_R	and 	%r3, %r5, %r17
	.word 0xb409ed50  ! 23: AND_I	and 	%r7, 0x0d50, %r26
	.word 0xbc118005  ! 23: OR_R	or 	%r6, %r5, %r30
	.word 0xac11276d  ! 23: OR_I	or 	%r4, 0x076d, %r22
	.word 0xb811ec59  ! 23: OR_I	or 	%r7, 0x0c59, %r28
	.word 0xa011c005  ! 23: OR_R	or 	%r7, %r5, %r16
	.word 0xb4088005  ! 23: AND_R	and 	%r2, %r5, %r26
	.word 0xbe10eee0  ! 23: OR_I	or 	%r3, 0x0ee0, %r31
	.word 0xb0008005  ! 23: ADD_R	add 	%r2, %r5, %r24
	.word 0xa210a944  ! 23: OR_I	or 	%r2, 0x0944, %r17
	.word 0xac10efff  ! 23: OR_I	or 	%r3, 0x0fff, %r22
	.word 0x9a00a7dd  ! 23: ADD_I	add 	%r2, 0x07dd, %r13
	.word 0xa4008005  ! 23: ADD_R	add 	%r2, %r5, %r18
	.word 0xbc018005  ! 23: ADD_R	add 	%r6, %r5, %r30
	.word 0xb410e671  ! 23: OR_I	or 	%r3, 0x0671, %r26
	.word 0x9c108005  ! 23: OR_R	or 	%r2, %r5, %r14
	.word 0xaa09c005  ! 23: AND_R	and 	%r7, %r5, %r21
	.word 0xf421aa08  ! 23: STW_I	stw	%r26, [%r6 + 0x0a08]
	.word 0xfa21ab74  ! 23: STW_I	stw	%r29, [%r6 + 0x0b74]
	.word 0xea30e788  ! 23: STH_I	sth	%r21, [%r3 + 0x0788]
	.word 0xf028e106  ! 23: STB_I	stb	%r24, [%r3 + 0x0106]
IRF_CE_8:
!$EV error(0,expr(@VA(.MAIN.IRF_CE_8), 16, 16), 1,IRF,ce,11,x, x,x,x, x,x,x)
!$EV error(0,expr(@VA(.MAIN.IRF_CE_8), 16, 16), 3,IRF,ce,13,x, x,x,x, x,x,x)
	.word 0xe230e408  ! 23: STH_I	sth	%r17, [%r3 + 0x0408]
	.word 0xfc30aca6  ! 23: STH_I	sth	%r30, [%r2 + 0x0ca6]
	.word 0xec21a8ec  ! 23: STW_I	stw	%r22, [%r6 + 0x08ec]
	.word 0xeaf89005  ! 23: SWAPA_R	swapa	%r21, [%r2 + %r5] 0x80
	.word 0xb009e75b  ! 23: AND_I	and 	%r7, 0x075b, %r24
	.word 0xa0118005  ! 23: OR_R	or 	%r6, %r5, %r16
	bne thr0_loop_2
	subcc %g1, 0x1, %g1
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr0_loop_3:
	.word 0x9c090005  ! 30: AND_R	and 	%r4, %r5, %r14
	.word 0xa2118005  ! 30: OR_R	or 	%r6, %r5, %r17
	.word 0xb2108005  ! 30: OR_R	or 	%r2, %r5, %r25
	.word 0xbc0121c4  ! 30: ADD_I	add 	%r4, 0x01c4, %r30
	.word 0xb2088005  ! 30: AND_R	and 	%r2, %r5, %r25
	.word 0x9a09ae4a  ! 30: AND_I	and 	%r6, 0x0e4a, %r13
	.word 0xa4090005  ! 30: AND_R	and 	%r4, %r5, %r18
	.word 0x9a08ad89  ! 30: AND_I	and 	%r2, 0x0d89, %r13
	.word 0xa211e3d4  ! 30: OR_I	or 	%r7, 0x03d4, %r17
	.word 0xaa11c005  ! 30: OR_R	or 	%r7, %r5, %r21
	.word 0xbc00c005  ! 30: ADD_R	add 	%r3, %r5, %r30
	.word 0xa008eb2c  ! 30: AND_I	and 	%r3, 0x0b2c, %r16
	.word 0x9e10a539  ! 30: OR_I	or 	%r2, 0x0539, %r15
	.word 0xba088005  ! 30: AND_R	and 	%r2, %r5, %r29
	.word 0xa000a793  ! 30: ADD_I	add 	%r2, 0x0793, %r16
	.word 0xae11c005  ! 30: OR_R	or 	%r7, %r5, %r23
	.word 0xa2088005  ! 30: AND_R	and 	%r2, %r5, %r17
	.word 0xbe008005  ! 30: ADD_R	add 	%r2, %r5, %r31
	.word 0xbc108005  ! 30: OR_R	or 	%r2, %r5, %r30
	.word 0xbe10a0dd  ! 30: OR_I	or 	%r2, 0x00dd, %r31
	.word 0xa608a075  ! 30: AND_I	and 	%r2, 0x0075, %r19
	.word 0xae01e0f2  ! 30: ADD_I	add 	%r7, 0x00f2, %r23
	.word 0xa4118005  ! 30: OR_R	or 	%r6, %r5, %r18
	.word 0xb2010005  ! 30: ADD_R	add 	%r4, %r5, %r25
	.word 0xba11a395  ! 30: OR_I	or 	%r6, 0x0395, %r29
	.word 0xac00a2c2  ! 30: ADD_I	add 	%r2, 0x02c2, %r22
	.word 0x9e088005  ! 30: AND_R	and 	%r2, %r5, %r15
	.word 0xb8112100  ! 30: OR_I	or 	%r4, 0x0100, %r28
	.word 0xa601ac6c  ! 30: ADD_I	add 	%r6, 0x0c6c, %r19
	.word 0x9c098005  ! 30: AND_R	and 	%r6, %r5, %r14
	.word 0xa2018005  ! 30: ADD_R	add 	%r6, %r5, %r17
	.word 0xb608aa80  ! 30: AND_I	and 	%r2, 0x0a80, %r27
	.word 0xb009ab8b  ! 30: AND_I	and 	%r6, 0x0b8b, %r24
	.word 0xb408af6b  ! 30: AND_I	and 	%r2, 0x0f6b, %r26
	.word 0xac08add5  ! 30: AND_I	and 	%r2, 0x0dd5, %r22
	.word 0x9e09c005  ! 30: AND_R	and 	%r7, %r5, %r15
	.word 0xac01a936  ! 30: ADD_I	add 	%r6, 0x0936, %r22
	.word 0xa400e3e3  ! 30: ADD_I	add 	%r3, 0x03e3, %r18
	.word 0xb2018005  ! 30: ADD_R	add 	%r6, %r5, %r25
	.word 0x9c01a6de  ! 30: ADD_I	add 	%r6, 0x06de, %r14
	.word 0x9a00a8df  ! 30: ADD_I	add 	%r2, 0x08df, %r13
	.word 0x9c012a53  ! 30: ADD_I	add 	%r4, 0x0a53, %r14
	.word 0xb808a31b  ! 30: AND_I	and 	%r2, 0x031b, %r28
	.word 0x9e118005  ! 30: OR_R	or 	%r6, %r5, %r15
	.word 0x9a008005  ! 30: ADD_R	add 	%r2, %r5, %r13
	.word 0xa4090005  ! 30: AND_R	and 	%r4, %r5, %r18
	.word 0xa609c005  ! 30: AND_R	and 	%r7, %r5, %r19
	.word 0xa609e44b  ! 30: AND_I	and 	%r7, 0x044b, %r19
	.word 0xbc08a248  ! 30: AND_I	and 	%r2, 0x0248, %r30
	.word 0xa0008005  ! 30: ADD_R	add 	%r2, %r5, %r16
	.word 0xba008005  ! 30: ADD_R	add 	%r2, %r5, %r29
	.word 0xaa11afad  ! 30: OR_I	or 	%r6, 0x0fad, %r21
	.word 0xb600a0af  ! 30: ADD_I	add 	%r2, 0x00af, %r27
	.word 0xa80925db  ! 30: AND_I	and 	%r4, 0x05db, %r20
	.word 0xb000afbb  ! 30: ADD_I	add 	%r2, 0x0fbb, %r24
	.word 0xac108005  ! 30: OR_R	or 	%r2, %r5, %r22
	.word 0xbc008005  ! 30: ADD_R	add 	%r2, %r5, %r30
	.word 0xbe01217e  ! 30: ADD_I	add 	%r4, 0x017e, %r31
	.word 0xb8018005  ! 30: ADD_R	add 	%r6, %r5, %r28
	.word 0xb208e860  ! 30: AND_I	and 	%r3, 0x0860, %r25
	.word 0xb201c005  ! 30: ADD_R	add 	%r7, %r5, %r25
	.word 0xb008ac58  ! 30: AND_I	and 	%r2, 0x0c58, %r24
	.word 0xba11c005  ! 30: OR_R	or 	%r7, %r5, %r29
	.word 0x9e08ec8e  ! 30: AND_I	and 	%r3, 0x0c8e, %r15
	.word 0xac018005  ! 30: ADD_R	add 	%r6, %r5, %r22
	.word 0xa008c005  ! 30: AND_R	and 	%r3, %r5, %r16
	.word 0xb8092ab7  ! 30: AND_I	and 	%r4, 0x0ab7, %r28
	.word 0x9e08a33f  ! 30: AND_I	and 	%r2, 0x033f, %r15
	.word 0xbc08ad73  ! 30: AND_I	and 	%r2, 0x0d73, %r30
	.word 0x9a10a5f5  ! 30: OR_I	or 	%r2, 0x05f5, %r13
	.word 0xae10ae69  ! 30: OR_I	or 	%r2, 0x0e69, %r23
	.word 0xa810c005  ! 30: OR_R	or 	%r3, %r5, %r20
	.word 0xb4008005  ! 30: ADD_R	add 	%r2, %r5, %r26
	.word 0x9e090005  ! 30: AND_R	and 	%r4, %r5, %r15
	.word 0xa4012d48  ! 30: ADD_I	add 	%r4, 0x0d48, %r18
	.word 0xb201c005  ! 30: ADD_R	add 	%r7, %r5, %r25
	.word 0xb0092379  ! 30: AND_I	and 	%r4, 0x0379, %r24
	.word 0x9c11e014  ! 30: OR_I	or 	%r7, 0x0014, %r14
	.word 0xb009abc2  ! 30: AND_I	and 	%r6, 0x0bc2, %r24
	.word 0xa0090005  ! 30: AND_R	and 	%r4, %r5, %r16
	.word 0xa409e7a7  ! 30: AND_I	and 	%r7, 0x07a7, %r18
	.word 0xb8088005  ! 30: AND_R	and 	%r2, %r5, %r28
	.word 0xb008ae23  ! 30: AND_I	and 	%r2, 0x0e23, %r24
	.word 0xa811e679  ! 30: OR_I	or 	%r7, 0x0679, %r20
	.word 0xb4098005  ! 30: AND_R	and 	%r6, %r5, %r26
	.word 0xb4110005  ! 30: OR_R	or 	%r4, %r5, %r26
	.word 0xb0008005  ! 30: ADD_R	add 	%r2, %r5, %r24
	.word 0xb6118005  ! 30: OR_R	or 	%r6, %r5, %r27
	.word 0xa211e5a9  ! 30: OR_I	or 	%r7, 0x05a9, %r17
	.word 0xaa10ab85  ! 30: OR_I	or 	%r2, 0x0b85, %r21
	.word 0xa000ee99  ! 30: ADD_I	add 	%r3, 0x0e99, %r16
	.word 0xae010005  ! 30: ADD_R	add 	%r4, %r5, %r23
	.word 0xb4118005  ! 30: OR_R	or 	%r6, %r5, %r26
	.word 0x9e09af4b  ! 30: AND_I	and 	%r6, 0x0f4b, %r15
	.word 0xbc11a7d2  ! 30: OR_I	or 	%r6, 0x07d2, %r30
	.word 0xb010c005  ! 30: OR_R	or 	%r3, %r5, %r24
	.word 0xbe11e62e  ! 30: OR_I	or 	%r7, 0x062e, %r31
	.word 0xb611c005  ! 30: OR_R	or 	%r7, %r5, %r27
	.word 0xbe09ea28  ! 30: AND_I	and 	%r7, 0x0a28, %r31
	.word 0xbc088005  ! 30: AND_R	and 	%r2, %r5, %r30
	.word 0xb608e35c  ! 30: AND_I	and 	%r3, 0x035c, %r27
	.word 0xb4110005  ! 30: OR_R	or 	%r4, %r5, %r26
	.word 0xbe10eb9c  ! 30: OR_I	or 	%r3, 0x0b9c, %r31
	.word 0xa8008005  ! 30: ADD_R	add 	%r2, %r5, %r20
	.word 0xa800a508  ! 30: ADD_I	add 	%r2, 0x0508, %r20
	.word 0x9c10a5f9  ! 30: OR_I	or 	%r2, 0x05f9, %r14
	.word 0xbc110005  ! 30: OR_R	or 	%r4, %r5, %r30
	.word 0x9e09ed26  ! 30: AND_I	and 	%r7, 0x0d26, %r15
	.word 0xb011ebfe  ! 30: OR_I	or 	%r7, 0x0bfe, %r24
	.word 0xb811252f  ! 30: OR_I	or 	%r4, 0x052f, %r28
	.word 0xa6118005  ! 30: OR_R	or 	%r6, %r5, %r19
	.word 0xa009c005  ! 30: AND_R	and 	%r7, %r5, %r16
	.word 0xaa00af00  ! 30: ADD_I	add 	%r2, 0x0f00, %r21
	.word 0xb608a5df  ! 30: AND_I	and 	%r2, 0x05df, %r27
	.word 0xb0008005  ! 30: ADD_R	add 	%r2, %r5, %r24
	.word 0xa4090005  ! 30: AND_R	and 	%r4, %r5, %r18
	.word 0xa2108005  ! 30: OR_R	or 	%r2, %r5, %r17
	.word 0x9a108005  ! 30: OR_R	or 	%r2, %r5, %r13
	.word 0xac00a551  ! 30: ADD_I	add 	%r2, 0x0551, %r22
	.word 0x9e11eef3  ! 30: OR_I	or 	%r7, 0x0ef3, %r15
	.word 0xbc110005  ! 30: OR_R	or 	%r4, %r5, %r30
	.word 0xac012b83  ! 30: ADD_I	add 	%r4, 0x0b83, %r22
	.word 0xa601c005  ! 30: ADD_R	add 	%r7, %r5, %r19
	.word 0xa801ec6a  ! 30: ADD_I	add 	%r7, 0x0c6a, %r20
	.word 0x9a118005  ! 30: OR_R	or 	%r6, %r5, %r13
	.word 0xb6010005  ! 30: ADD_R	add 	%r4, %r5, %r27
	.word 0xbc008005  ! 30: ADD_R	add 	%r2, %r5, %r30
	.word 0xb8110005  ! 30: OR_R	or 	%r4, %r5, %r28
	.word 0xa801ed46  ! 30: ADD_I	add 	%r7, 0x0d46, %r20
	.word 0xaa09c005  ! 30: AND_R	and 	%r7, %r5, %r21
	.word 0xb80927a0  ! 30: AND_I	and 	%r4, 0x07a0, %r28
	.word 0xa801e95a  ! 30: ADD_I	add 	%r7, 0x095a, %r20
	.word 0xb211a7ff  ! 30: OR_I	or 	%r6, 0x07ff, %r25
	.word 0xb611c005  ! 30: OR_R	or 	%r7, %r5, %r27
	.word 0xaa112ee4  ! 30: OR_I	or 	%r4, 0x0ee4, %r21
	.word 0xa6088005  ! 30: AND_R	and 	%r2, %r5, %r19
	.word 0x9a08c005  ! 30: AND_R	and 	%r3, %r5, %r13
	.word 0xa611c005  ! 30: OR_R	or 	%r7, %r5, %r19
	.word 0xa4108005  ! 30: OR_R	or 	%r2, %r5, %r18
	.word 0xa609e6ab  ! 30: AND_I	and 	%r7, 0x06ab, %r19
	.word 0xb410a748  ! 30: OR_I	or 	%r2, 0x0748, %r26
	.word 0x9e008005  ! 30: ADD_R	add 	%r2, %r5, %r15
	.word 0xa211e13f  ! 30: OR_I	or 	%r7, 0x013f, %r17
	.word 0xb6088005  ! 30: AND_R	and 	%r2, %r5, %r27
	.word 0x9e00e9f1  ! 30: ADD_I	add 	%r3, 0x09f1, %r15
	.word 0xb0088005  ! 30: AND_R	and 	%r2, %r5, %r24
	.word 0xb8110005  ! 30: OR_R	or 	%r4, %r5, %r28
	.word 0xb2110005  ! 30: OR_R	or 	%r4, %r5, %r25
	.word 0xbe09c005  ! 30: AND_R	and 	%r7, %r5, %r31
	.word 0x9c090005  ! 30: AND_R	and 	%r4, %r5, %r14
	.word 0xa001e258  ! 30: ADD_I	add 	%r7, 0x0258, %r16
	.word 0xb609aefe  ! 30: AND_I	and 	%r6, 0x0efe, %r27
	.word 0xa600a5eb  ! 30: ADD_I	add 	%r2, 0x05eb, %r19
	.word 0xae00c005  ! 30: ADD_R	add 	%r3, %r5, %r23
	.word 0xb0092c96  ! 30: AND_I	and 	%r4, 0x0c96, %r24
	.word 0xbe11a36d  ! 30: OR_I	or 	%r6, 0x036d, %r31
	.word 0xb008ac11  ! 30: AND_I	and 	%r2, 0x0c11, %r24
	.word 0xa808c005  ! 30: AND_R	and 	%r3, %r5, %r20
	.word 0xa210c005  ! 30: OR_R	or 	%r3, %r5, %r17
	.word 0xac00a0aa  ! 30: ADD_I	add 	%r2, 0x00aa, %r22
	.word 0xa411c005  ! 30: OR_R	or 	%r7, %r5, %r18
	.word 0x9c08ef89  ! 30: AND_I	and 	%r3, 0x0f89, %r14
	.word 0xaa11ec3d  ! 30: OR_I	or 	%r7, 0x0c3d, %r21
	.word 0xbc108005  ! 30: OR_R	or 	%r2, %r5, %r30
	.word 0xa610e83a  ! 30: OR_I	or 	%r3, 0x083a, %r19
	.word 0xb0108005  ! 30: OR_R	or 	%r2, %r5, %r24
	.word 0xa8088005  ! 30: AND_R	and 	%r2, %r5, %r20
	.word 0xb208a97d  ! 30: AND_I	and 	%r2, 0x097d, %r25
	.word 0xaa11e508  ! 30: OR_I	or 	%r7, 0x0508, %r21
	.word 0xbe10abab  ! 30: OR_I	or 	%r2, 0x0bab, %r31
	.word 0xbc08ab18  ! 30: AND_I	and 	%r2, 0x0b18, %r30
	.word 0xa4112c49  ! 30: OR_I	or 	%r4, 0x0c49, %r18
	.word 0xaa11a6c1  ! 30: OR_I	or 	%r6, 0x06c1, %r21
	.word 0xb0108005  ! 30: OR_R	or 	%r2, %r5, %r24
	.word 0xa2112ccd  ! 30: OR_I	or 	%r4, 0x0ccd, %r17
	.word 0xa210e41d  ! 30: OR_I	or 	%r3, 0x041d, %r17
	.word 0xa6108005  ! 30: OR_R	or 	%r2, %r5, %r19
	.word 0xac098005  ! 30: AND_R	and 	%r6, %r5, %r22
	.word 0xae00a141  ! 30: ADD_I	add 	%r2, 0x0141, %r23
	.word 0xac08c005  ! 30: AND_R	and 	%r3, %r5, %r22
	.word 0xa6108005  ! 30: OR_R	or 	%r2, %r5, %r19
	.word 0xba00e5b1  ! 30: ADD_I	add 	%r3, 0x05b1, %r29
	.word 0xb6118005  ! 30: OR_R	or 	%r6, %r5, %r27
	.word 0xa409a0bf  ! 30: AND_I	and 	%r6, 0x00bf, %r18
	.word 0xa400e7ae  ! 30: ADD_I	add 	%r3, 0x07ae, %r18
	.word 0xb41126ac  ! 30: OR_I	or 	%r4, 0x06ac, %r26
	.word 0xa2008005  ! 30: ADD_R	add 	%r2, %r5, %r17
	.word 0x9e09a490  ! 30: AND_I	and 	%r6, 0x0490, %r15
	.word 0x9a008005  ! 30: ADD_R	add 	%r2, %r5, %r13
	.word 0xa801c005  ! 30: ADD_R	add 	%r7, %r5, %r20
	.word 0xa000acd2  ! 30: ADD_I	add 	%r2, 0x0cd2, %r16
	.word 0x9a01256f  ! 30: ADD_I	add 	%r4, 0x056f, %r13
	.word 0xec21a3f0  ! 30: STW_I	stw	%r22, [%r6 + 0x03f0]
	.word 0xf471e798  ! 30: STX_I	stx	%r26, [%r7 + 0x0798]
	.word 0xf020a984  ! 30: STW_I	stw	%r24, [%r2 + 0x0984]
	.word 0xf270aa80  ! 30: STX_I	stx	%r25, [%r2 + 0x0a80]
IRF_CE_12:
!$EV error(0,expr(@VA(.MAIN.IRF_CE_12), 16, 16), 1,IRF,ce,4,x, x,x,x, x,x,x)
!$EV error(0,expr(@VA(.MAIN.IRF_CE_12), 16, 16), 3,IRF,ce,35,x, x,x,x, x,x,x)
	.word 0xee20ae90  ! 30: STW_I	stw	%r23, [%r2 + 0x0e90]
	.word 0xf830ebe2  ! 30: STH_I	sth	%r28, [%r3 + 0x0be2]
	.word 0xe430a782  ! 30: STH_I	sth	%r18, [%r2 + 0x0782]
	.word 0xeae91005  ! 30: LDSTUBA_R	ldstuba	%r21, [%r4 + %r5] 0x80
	.word 0xb208e19e  ! 30: AND_I	and 	%r3, 0x019e, %r25
	.word 0xbe10c005  ! 30: OR_R	or 	%r3, %r5, %r31
	bne thr0_loop_3
	subcc %g1, 0x1, %g1
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr0_loop_4:
	.word 0xba08a379  ! 37: AND_I	and 	%r2, 0x0379, %r29
	.word 0xa801a489  ! 37: ADD_I	add 	%r6, 0x0489, %r20
	.word 0xbc118005  ! 37: OR_R	or 	%r6, %r5, %r30
	.word 0xb2008005  ! 37: ADD_R	add 	%r2, %r5, %r25
	.word 0xb409210d  ! 37: AND_I	and 	%r4, 0x010d, %r26
	.word 0xa2110005  ! 37: OR_R	or 	%r4, %r5, %r17
	.word 0xae09ed90  ! 37: AND_I	and 	%r7, 0x0d90, %r23
	.word 0xa411c005  ! 37: OR_R	or 	%r7, %r5, %r18
	.word 0xb408a9be  ! 37: AND_I	and 	%r2, 0x09be, %r26
	.word 0xb811eb36  ! 37: OR_I	or 	%r7, 0x0b36, %r28
	.word 0x9c108005  ! 37: OR_R	or 	%r2, %r5, %r14
	.word 0x9e08e6e5  ! 37: AND_I	and 	%r3, 0x06e5, %r15
	.word 0xb810a761  ! 37: OR_I	or 	%r2, 0x0761, %r28
	.word 0xb6098005  ! 37: AND_R	and 	%r6, %r5, %r27
	.word 0xa4108005  ! 37: OR_R	or 	%r2, %r5, %r18
	.word 0xac112194  ! 37: OR_I	or 	%r4, 0x0194, %r22
	.word 0xbe10e22a  ! 37: OR_I	or 	%r3, 0x022a, %r31
	.word 0x9e00c005  ! 37: ADD_R	add 	%r3, %r5, %r15
	.word 0xb609241b  ! 37: AND_I	and 	%r4, 0x041b, %r27
	.word 0xa8008005  ! 37: ADD_R	add 	%r2, %r5, %r20
	.word 0x9e09ee97  ! 37: AND_I	and 	%r7, 0x0e97, %r15
	.word 0xb0110005  ! 37: OR_R	or 	%r4, %r5, %r24
	.word 0xba110005  ! 37: OR_R	or 	%r4, %r5, %r29
	.word 0x9a08a13b  ! 37: AND_I	and 	%r2, 0x013b, %r13
	.word 0x9c10a4cb  ! 37: OR_I	or 	%r2, 0x04cb, %r14
	.word 0xa800a19b  ! 37: ADD_I	add 	%r2, 0x019b, %r20
	.word 0xac118005  ! 37: OR_R	or 	%r6, %r5, %r22
	.word 0xb008a1cf  ! 37: AND_I	and 	%r2, 0x01cf, %r24
	.word 0xaa008005  ! 37: ADD_R	add 	%r2, %r5, %r21
	.word 0xa010ad43  ! 37: OR_I	or 	%r2, 0x0d43, %r16
	.word 0xb601eda2  ! 37: ADD_I	add 	%r7, 0x0da2, %r27
	.word 0xb8108005  ! 37: OR_R	or 	%r2, %r5, %r28
	.word 0x9c10afca  ! 37: OR_I	or 	%r2, 0x0fca, %r14
	.word 0xa2092355  ! 37: AND_I	and 	%r4, 0x0355, %r17
	.word 0xb410a30b  ! 37: OR_I	or 	%r2, 0x030b, %r26
	.word 0x9a01a3ee  ! 37: ADD_I	add 	%r6, 0x03ee, %r13
	.word 0xa0008005  ! 37: ADD_R	add 	%r2, %r5, %r16
	.word 0xb8112b83  ! 37: OR_I	or 	%r4, 0x0b83, %r28
	.word 0xa0018005  ! 37: ADD_R	add 	%r6, %r5, %r16
	.word 0x9e018005  ! 37: ADD_R	add 	%r6, %r5, %r15
	.word 0x9c090005  ! 37: AND_R	and 	%r4, %r5, %r14
	.word 0xa410e398  ! 37: OR_I	or 	%r3, 0x0398, %r18
	.word 0xa009e061  ! 37: AND_I	and 	%r7, 0x0061, %r16
	.word 0xa6092b27  ! 37: AND_I	and 	%r4, 0x0b27, %r19
	.word 0xaa09eb15  ! 37: AND_I	and 	%r7, 0x0b15, %r21
	.word 0xb200af51  ! 37: ADD_I	add 	%r2, 0x0f51, %r25
	.word 0x9e008005  ! 37: ADD_R	add 	%r2, %r5, %r15
	.word 0xba11ee98  ! 37: OR_I	or 	%r7, 0x0e98, %r29
	.word 0xa210aaf5  ! 37: OR_I	or 	%r2, 0x0af5, %r17
	.word 0x9c01a05b  ! 37: ADD_I	add 	%r6, 0x005b, %r14
	.word 0xb610a6a9  ! 37: OR_I	or 	%r2, 0x06a9, %r27
	.word 0xa4018005  ! 37: ADD_R	add 	%r6, %r5, %r18
	.word 0xaa08e7bc  ! 37: AND_I	and 	%r3, 0x07bc, %r21
	.word 0xa608a8fb  ! 37: AND_I	and 	%r2, 0x08fb, %r19
	.word 0xa410a894  ! 37: OR_I	or 	%r2, 0x0894, %r18
	.word 0xac10ec31  ! 37: OR_I	or 	%r3, 0x0c31, %r22
	.word 0xac00c005  ! 37: ADD_R	add 	%r3, %r5, %r22
	.word 0xa8088005  ! 37: AND_R	and 	%r2, %r5, %r20
	.word 0xb600c005  ! 37: ADD_R	add 	%r3, %r5, %r27
	.word 0xb4110005  ! 37: OR_R	or 	%r4, %r5, %r26
	.word 0xb4092d49  ! 37: AND_I	and 	%r4, 0x0d49, %r26
	.word 0xba10ea7d  ! 37: OR_I	or 	%r3, 0x0a7d, %r29
	.word 0xbc118005  ! 37: OR_R	or 	%r6, %r5, %r30
	.word 0xb810a431  ! 37: OR_I	or 	%r2, 0x0431, %r28
	.word 0xb808c005  ! 37: AND_R	and 	%r3, %r5, %r28
	.word 0x9c1123c4  ! 37: OR_I	or 	%r4, 0x03c4, %r14
	.word 0x9e090005  ! 37: AND_R	and 	%r4, %r5, %r15
	.word 0xae108005  ! 37: OR_R	or 	%r2, %r5, %r23
	.word 0xa211e4f4  ! 37: OR_I	or 	%r7, 0x04f4, %r17
	.word 0xac018005  ! 37: ADD_R	add 	%r6, %r5, %r22
	.word 0xae11c005  ! 37: OR_R	or 	%r7, %r5, %r23
	.word 0xbe08ef04  ! 37: AND_I	and 	%r3, 0x0f04, %r31
	.word 0xba110005  ! 37: OR_R	or 	%r4, %r5, %r29
	.word 0xbe00a9ab  ! 37: ADD_I	add 	%r2, 0x09ab, %r31
	.word 0xb6010005  ! 37: ADD_R	add 	%r4, %r5, %r27
	.word 0xba108005  ! 37: OR_R	or 	%r2, %r5, %r29
	.word 0xb408a30f  ! 37: AND_I	and 	%r2, 0x030f, %r26
	.word 0xa6092317  ! 37: AND_I	and 	%r4, 0x0317, %r19
	.word 0xb010e741  ! 37: OR_I	or 	%r3, 0x0741, %r24
	.word 0xa6010005  ! 37: ADD_R	add 	%r4, %r5, %r19
	.word 0xaa01abaf  ! 37: ADD_I	add 	%r6, 0x0baf, %r21
	.word 0xbe10ac85  ! 37: OR_I	or 	%r2, 0x0c85, %r31
	.word 0xac09ec96  ! 37: AND_I	and 	%r7, 0x0c96, %r22
	.word 0x9a00afcf  ! 37: ADD_I	add 	%r2, 0x0fcf, %r13
	.word 0xb808c005  ! 37: AND_R	and 	%r3, %r5, %r28
	.word 0xbe09ab10  ! 37: AND_I	and 	%r6, 0x0b10, %r31
	.word 0x9a010005  ! 37: ADD_R	add 	%r4, %r5, %r13
	.word 0xa0088005  ! 37: AND_R	and 	%r2, %r5, %r16
	.word 0xae0128ed  ! 37: ADD_I	add 	%r4, 0x08ed, %r23
	.word 0xa6090005  ! 37: AND_R	and 	%r4, %r5, %r19
	.word 0xa0110005  ! 37: OR_R	or 	%r4, %r5, %r16
	.word 0xa81125d4  ! 37: OR_I	or 	%r4, 0x05d4, %r20
	.word 0x9e09ec5a  ! 37: AND_I	and 	%r7, 0x0c5a, %r15
	.word 0xa008a474  ! 37: AND_I	and 	%r2, 0x0474, %r16
	.word 0xb400c005  ! 37: ADD_R	add 	%r3, %r5, %r26
	.word 0x9a11a418  ! 37: OR_I	or 	%r6, 0x0418, %r13
	.word 0xac09aa6b  ! 37: AND_I	and 	%r6, 0x0a6b, %r22
	.word 0xaa090005  ! 37: AND_R	and 	%r4, %r5, %r21
	.word 0xbe08e7bb  ! 37: AND_I	and 	%r3, 0x07bb, %r31
	.word 0xb6008005  ! 37: ADD_R	add 	%r2, %r5, %r27
	.word 0xa0010005  ! 37: ADD_R	add 	%r4, %r5, %r16
	.word 0xbe00c005  ! 37: ADD_R	add 	%r3, %r5, %r31
	.word 0x9a09a7a0  ! 37: AND_I	and 	%r6, 0x07a0, %r13
	.word 0xa600adba  ! 37: ADD_I	add 	%r2, 0x0dba, %r19
	.word 0x9c018005  ! 37: ADD_R	add 	%r6, %r5, %r14
	.word 0xb209a063  ! 37: AND_I	and 	%r6, 0x0063, %r25
	.word 0x9a11e1a0  ! 37: OR_I	or 	%r7, 0x01a0, %r13
	.word 0xb200a6bc  ! 37: ADD_I	add 	%r2, 0x06bc, %r25
	.word 0xa8012ec1  ! 37: ADD_I	add 	%r4, 0x0ec1, %r20
	.word 0xbc090005  ! 37: AND_R	and 	%r4, %r5, %r30
	.word 0xbe110005  ! 37: OR_R	or 	%r4, %r5, %r31
	.word 0xa4092c00  ! 37: AND_I	and 	%r4, 0x0c00, %r18
	.word 0x9c08c005  ! 37: AND_R	and 	%r3, %r5, %r14
	.word 0xa6088005  ! 37: AND_R	and 	%r2, %r5, %r19
	.word 0x9e11e42f  ! 37: OR_I	or 	%r7, 0x042f, %r15
	.word 0xa0008005  ! 37: ADD_R	add 	%r2, %r5, %r16
	.word 0xb6090005  ! 37: AND_R	and 	%r4, %r5, %r27
	.word 0xa010ad92  ! 37: OR_I	or 	%r2, 0x0d92, %r16
	.word 0xae008005  ! 37: ADD_R	add 	%r2, %r5, %r23
	.word 0xb400c005  ! 37: ADD_R	add 	%r3, %r5, %r26
	.word 0xa411a148  ! 37: OR_I	or 	%r6, 0x0148, %r18
	.word 0x9e09a927  ! 37: AND_I	and 	%r6, 0x0927, %r15
	.word 0x9a00e89a  ! 37: ADD_I	add 	%r3, 0x089a, %r13
	.word 0xb010e754  ! 37: OR_I	or 	%r3, 0x0754, %r24
	.word 0xac09e642  ! 37: AND_I	and 	%r7, 0x0642, %r22
	.word 0xb4118005  ! 37: OR_R	or 	%r6, %r5, %r26
	.word 0xa8012c73  ! 37: ADD_I	add 	%r4, 0x0c73, %r20
	.word 0xa401254c  ! 37: ADD_I	add 	%r4, 0x054c, %r18
	.word 0xaa0928a2  ! 37: AND_I	and 	%r4, 0x08a2, %r21
	.word 0x9c00a866  ! 37: ADD_I	add 	%r2, 0x0866, %r14
	.word 0xa8090005  ! 37: AND_R	and 	%r4, %r5, %r20
	.word 0xb608a169  ! 37: AND_I	and 	%r2, 0x0169, %r27
	.word 0xb208c005  ! 37: AND_R	and 	%r3, %r5, %r25
	.word 0xa400c005  ! 37: ADD_R	add 	%r3, %r5, %r18
	.word 0x9e10affa  ! 37: OR_I	or 	%r2, 0x0ffa, %r15
	.word 0xa4108005  ! 37: OR_R	or 	%r2, %r5, %r18
	.word 0xf820af28  ! 37: STW_I	stw	%r28, [%r2 + 0x0f28]
	.word 0xe621acb8  ! 37: STW_I	stw	%r19, [%r6 + 0x0cb8]
	.word 0xda31aa7a  ! 37: STH_I	sth	%r13, [%r6 + 0x0a7a]
	.word 0xe4712f38  ! 37: STX_I	stx	%r18, [%r4 + 0x0f38]
IRF_CE_16:
!$EV error(0,expr(@VA(.MAIN.IRF_CE_16), 16, 16), 1,IRF,ce,1,x, x,x,x, x,x,x)
!$EV error(0,expr(@VA(.MAIN.IRF_CE_16), 16, 16), 3,IRF,ce,20,x, x,x,x, x,x,x)
	.word 0xea70a8c8  ! 37: STX_I	stx	%r21, [%r2 + 0x08c8]
	.word 0xde70e430  ! 37: STX_I	stx	%r15, [%r3 + 0x0430]
	.word 0xe670ee88  ! 37: STX_I	stx	%r19, [%r3 + 0x0e88]
	.word 0xee21e95c  ! 37: STW_I	stw	%r23, [%r7 + 0x095c]
	.word 0xb210e1e1  ! 37: OR_I	or 	%r3, 0x01e1, %r25
	.word 0xac09c005  ! 37: AND_R	and 	%r7, %r5, %r22
	bne thr0_loop_4
	subcc %g1, 0x1, %g1
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr0_loop_5:
	.word 0xa011ebb0  ! 44: OR_I	or 	%r7, 0x0bb0, %r16
	.word 0xb2098005  ! 44: AND_R	and 	%r6, %r5, %r25
	.word 0xa601c005  ! 44: ADD_R	add 	%r7, %r5, %r19
	.word 0x9c01a580  ! 44: ADD_I	add 	%r6, 0x0580, %r14
	.word 0xbc008005  ! 44: ADD_R	add 	%r2, %r5, %r30
	.word 0xa608e97b  ! 44: AND_I	and 	%r3, 0x097b, %r19
	.word 0xb8108005  ! 44: OR_R	or 	%r2, %r5, %r28
	.word 0xac0921d3  ! 44: AND_I	and 	%r4, 0x01d3, %r22
	.word 0xb201c005  ! 44: ADD_R	add 	%r7, %r5, %r25
	.word 0x9a09e0b5  ! 44: AND_I	and 	%r7, 0x00b5, %r13
	.word 0xb4018005  ! 44: ADD_R	add 	%r6, %r5, %r26
	.word 0xa8098005  ! 44: AND_R	and 	%r6, %r5, %r20
	.word 0xa000a70a  ! 44: ADD_I	add 	%r2, 0x070a, %r16
	.word 0xb2010005  ! 44: ADD_R	add 	%r4, %r5, %r25
	.word 0x9e088005  ! 44: AND_R	and 	%r2, %r5, %r15
	.word 0xae008005  ! 44: ADD_R	add 	%r2, %r5, %r23
	.word 0x9a09e8cb  ! 44: AND_I	and 	%r7, 0x08cb, %r13
	.word 0xba01ead5  ! 44: ADD_I	add 	%r7, 0x0ad5, %r29
	.word 0xbe01abc3  ! 44: ADD_I	add 	%r6, 0x0bc3, %r31
	.word 0x9a110005  ! 44: OR_R	or 	%r4, %r5, %r13
	.word 0xae00a68b  ! 44: ADD_I	add 	%r2, 0x068b, %r23
	.word 0xb000a65e  ! 44: ADD_I	add 	%r2, 0x065e, %r24
	.word 0xb6110005  ! 44: OR_R	or 	%r4, %r5, %r27
	.word 0x9c10a0a6  ! 44: OR_I	or 	%r2, 0x00a6, %r14
	.word 0x9c08e499  ! 44: AND_I	and 	%r3, 0x0499, %r14
	.word 0xa0088005  ! 44: AND_R	and 	%r2, %r5, %r16
	.word 0xbe118005  ! 44: OR_R	or 	%r6, %r5, %r31
	.word 0xb4090005  ! 44: AND_R	and 	%r4, %r5, %r26
	.word 0xa2118005  ! 44: OR_R	or 	%r6, %r5, %r17
	.word 0xbc00ada2  ! 44: ADD_I	add 	%r2, 0x0da2, %r30
	.word 0x9c010005  ! 44: ADD_R	add 	%r4, %r5, %r14
	.word 0xb4108005  ! 44: OR_R	or 	%r2, %r5, %r26
	.word 0xb810a40e  ! 44: OR_I	or 	%r2, 0x040e, %r28
	.word 0x9c08e1b4  ! 44: AND_I	and 	%r3, 0x01b4, %r14
	.word 0xa208c005  ! 44: AND_R	and 	%r3, %r5, %r17
	.word 0xa8088005  ! 44: AND_R	and 	%r2, %r5, %r20
	.word 0xb4008005  ! 44: ADD_R	add 	%r2, %r5, %r26
	.word 0xb80925d2  ! 44: AND_I	and 	%r4, 0x05d2, %r28
	.word 0xa000a4ba  ! 44: ADD_I	add 	%r2, 0x04ba, %r16
	.word 0xa8108005  ! 44: OR_R	or 	%r2, %r5, %r20
	.word 0xbc092427  ! 44: AND_I	and 	%r4, 0x0427, %r30
	.word 0xbe00afe3  ! 44: ADD_I	add 	%r2, 0x0fe3, %r31
	.word 0xba08a7cc  ! 44: AND_I	and 	%r2, 0x07cc, %r29
	.word 0xa001af90  ! 44: ADD_I	add 	%r6, 0x0f90, %r16
	.word 0xba008005  ! 44: ADD_R	add 	%r2, %r5, %r29
	.word 0xbc08a029  ! 44: AND_I	and 	%r2, 0x0029, %r30
	.word 0xba112075  ! 44: OR_I	or 	%r4, 0x0075, %r29
	.word 0xa810e3df  ! 44: OR_I	or 	%r3, 0x03df, %r20
	.word 0xaa018005  ! 44: ADD_R	add 	%r6, %r5, %r21
	.word 0xbc018005  ! 44: ADD_R	add 	%r6, %r5, %r30
	.word 0xb0118005  ! 44: OR_R	or 	%r6, %r5, %r24
	.word 0xb0008005  ! 44: ADD_R	add 	%r2, %r5, %r24
	.word 0xb010abe9  ! 44: OR_I	or 	%r2, 0x0be9, %r24
	.word 0xba112887  ! 44: OR_I	or 	%r4, 0x0887, %r29
	.word 0x9c08e6ff  ! 44: AND_I	and 	%r3, 0x06ff, %r14
	.word 0xa210ac7a  ! 44: OR_I	or 	%r2, 0x0c7a, %r17
	.word 0xae11ec5a  ! 44: OR_I	or 	%r7, 0x0c5a, %r23
	.word 0xb0098005  ! 44: AND_R	and 	%r6, %r5, %r24
	.word 0xbc108005  ! 44: OR_R	or 	%r2, %r5, %r30
	.word 0xa6108005  ! 44: OR_R	or 	%r2, %r5, %r19
	.word 0xaa01c005  ! 44: ADD_R	add 	%r7, %r5, %r21
	.word 0xb8108005  ! 44: OR_R	or 	%r2, %r5, %r28
	.word 0x9a11c005  ! 44: OR_R	or 	%r7, %r5, %r13
	.word 0xae11a2e3  ! 44: OR_I	or 	%r6, 0x02e3, %r23
	.word 0xbc112d6d  ! 44: OR_I	or 	%r4, 0x0d6d, %r30
	.word 0xba10c005  ! 44: OR_R	or 	%r3, %r5, %r29
	.word 0xb208ee6f  ! 44: AND_I	and 	%r3, 0x0e6f, %r25
	.word 0xa411e3cf  ! 44: OR_I	or 	%r7, 0x03cf, %r18
	.word 0xa201c005  ! 44: ADD_R	add 	%r7, %r5, %r17
	.word 0xb201e2f4  ! 44: ADD_I	add 	%r7, 0x02f4, %r25
	.word 0x9a08a5c9  ! 44: AND_I	and 	%r2, 0x05c9, %r13
	.word 0xba110005  ! 44: OR_R	or 	%r4, %r5, %r29
	.word 0x9e00a007  ! 44: ADD_I	add 	%r2, 0x0007, %r15
	.word 0xb011ecbd  ! 44: OR_I	or 	%r7, 0x0cbd, %r24
	.word 0xb009aed0  ! 44: AND_I	and 	%r6, 0x0ed0, %r24
	.word 0xa600aa14  ! 44: ADD_I	add 	%r2, 0x0a14, %r19
	.word 0xae090005  ! 44: AND_R	and 	%r4, %r5, %r23
	.word 0x9a010005  ! 44: ADD_R	add 	%r4, %r5, %r13
	.word 0xa800a229  ! 44: ADD_I	add 	%r2, 0x0229, %r20
	.word 0x9a08c005  ! 44: AND_R	and 	%r3, %r5, %r13
	.word 0xb4018005  ! 44: ADD_R	add 	%r6, %r5, %r26
	.word 0x9e098005  ! 44: AND_R	and 	%r6, %r5, %r15
	.word 0x9e012f78  ! 44: ADD_I	add 	%r4, 0x0f78, %r15
	.word 0xb410e177  ! 44: OR_I	or 	%r3, 0x0177, %r26
	.word 0xb800e7e0  ! 44: ADD_I	add 	%r3, 0x07e0, %r28
	.word 0xa8110005  ! 44: OR_R	or 	%r4, %r5, %r20
	.word 0x9a09ea01  ! 44: AND_I	and 	%r7, 0x0a01, %r13
	.word 0x9e08a372  ! 44: AND_I	and 	%r2, 0x0372, %r15
	.word 0xb8090005  ! 44: AND_R	and 	%r4, %r5, %r28
	.word 0xa0010005  ! 44: ADD_R	add 	%r4, %r5, %r16
	.word 0xb208ac91  ! 44: AND_I	and 	%r2, 0x0c91, %r25
	.word 0xb601ad03  ! 44: ADD_I	add 	%r6, 0x0d03, %r27
	.word 0xa000c005  ! 44: ADD_R	add 	%r3, %r5, %r16
	.word 0xae00c005  ! 44: ADD_R	add 	%r3, %r5, %r23
	.word 0xa608a362  ! 44: AND_I	and 	%r2, 0x0362, %r19
	.word 0xb411aa99  ! 44: OR_I	or 	%r6, 0x0a99, %r26
	.word 0xaa09243e  ! 44: AND_I	and 	%r4, 0x043e, %r21
	.word 0x9e088005  ! 44: AND_R	and 	%r2, %r5, %r15
	.word 0xaa00e196  ! 44: ADD_I	add 	%r3, 0x0196, %r21
	.word 0xa601c005  ! 44: ADD_R	add 	%r7, %r5, %r19
	.word 0xac118005  ! 44: OR_R	or 	%r6, %r5, %r22
	.word 0x9e00ec10  ! 44: ADD_I	add 	%r3, 0x0c10, %r15
	.word 0xbe11c005  ! 44: OR_R	or 	%r7, %r5, %r31
	.word 0xba01c005  ! 44: ADD_R	add 	%r7, %r5, %r29
	.word 0xba08e803  ! 44: AND_I	and 	%r3, 0x0803, %r29
	.word 0x9a10e2a4  ! 44: OR_I	or 	%r3, 0x02a4, %r13
	.word 0xa4008005  ! 44: ADD_R	add 	%r2, %r5, %r18
	.word 0xb6018005  ! 44: ADD_R	add 	%r6, %r5, %r27
	.word 0xa6018005  ! 44: ADD_R	add 	%r6, %r5, %r19
	.word 0xb4112c26  ! 44: OR_I	or 	%r4, 0x0c26, %r26
	.word 0xb408adc2  ! 44: AND_I	and 	%r2, 0x0dc2, %r26
	.word 0xa400adf2  ! 44: ADD_I	add 	%r2, 0x0df2, %r18
	.word 0xa81126c3  ! 44: OR_I	or 	%r4, 0x06c3, %r20
	.word 0x9a092500  ! 44: AND_I	and 	%r4, 0x0500, %r13
	.word 0x9e09c005  ! 44: AND_R	and 	%r7, %r5, %r15
	.word 0xa8108005  ! 44: OR_R	or 	%r2, %r5, %r20
	.word 0xa600c005  ! 44: ADD_R	add 	%r3, %r5, %r19
	.word 0xbc110005  ! 44: OR_R	or 	%r4, %r5, %r30
	.word 0xaa10ac46  ! 44: OR_I	or 	%r2, 0x0c46, %r21
	.word 0xbe08a47f  ! 44: AND_I	and 	%r2, 0x047f, %r31
	.word 0xba09aceb  ! 44: AND_I	and 	%r6, 0x0ceb, %r29
	.word 0xb8090005  ! 44: AND_R	and 	%r4, %r5, %r28
	.word 0xb600ae8d  ! 44: ADD_I	add 	%r2, 0x0e8d, %r27
	.word 0x9a088005  ! 44: AND_R	and 	%r2, %r5, %r13
	.word 0xb0098005  ! 44: AND_R	and 	%r6, %r5, %r24
	.word 0xb210a43a  ! 44: OR_I	or 	%r2, 0x043a, %r25
	.word 0xbc10a268  ! 44: OR_I	or 	%r2, 0x0268, %r30
	.word 0xb0112945  ! 44: OR_I	or 	%r4, 0x0945, %r24
	.word 0xa800c005  ! 44: ADD_R	add 	%r3, %r5, %r20
	.word 0xa009c005  ! 44: AND_R	and 	%r7, %r5, %r16
	.word 0xb008a7f0  ! 44: AND_I	and 	%r2, 0x07f0, %r24
	.word 0xb400ebca  ! 44: ADD_I	add 	%r3, 0x0bca, %r26
	.word 0xaa09affb  ! 44: AND_I	and 	%r6, 0x0ffb, %r21
	.word 0x9e0926c0  ! 44: AND_I	and 	%r4, 0x06c0, %r15
	.word 0x9c00a169  ! 44: ADD_I	add 	%r2, 0x0169, %r14
	.word 0xaa098005  ! 44: AND_R	and 	%r6, %r5, %r21
	.word 0xbe090005  ! 44: AND_R	and 	%r4, %r5, %r31
	.word 0xbe00c005  ! 44: ADD_R	add 	%r3, %r5, %r31
	.word 0xb2098005  ! 44: AND_R	and 	%r6, %r5, %r25
	.word 0xb008a8fb  ! 44: AND_I	and 	%r2, 0x08fb, %r24
	.word 0xac112a44  ! 44: OR_I	or 	%r4, 0x0a44, %r22
	.word 0xb210e90a  ! 44: OR_I	or 	%r3, 0x090a, %r25
	.word 0xb400e6ce  ! 44: ADD_I	add 	%r3, 0x06ce, %r26
	.word 0x9e088005  ! 44: AND_R	and 	%r2, %r5, %r15
	.word 0xb009c005  ! 44: AND_R	and 	%r7, %r5, %r24
	.word 0xa8110005  ! 44: OR_R	or 	%r4, %r5, %r20
	.word 0x9c10a439  ! 44: OR_I	or 	%r2, 0x0439, %r14
	.word 0xa0088005  ! 44: AND_R	and 	%r2, %r5, %r16
	.word 0x9c10a28c  ! 44: OR_I	or 	%r2, 0x028c, %r14
	.word 0xa408ee12  ! 44: AND_I	and 	%r3, 0x0e12, %r18
	.word 0xac108005  ! 44: OR_R	or 	%r2, %r5, %r22
	.word 0xa20923ef  ! 44: AND_I	and 	%r4, 0x03ef, %r17
	.word 0xac01a659  ! 44: ADD_I	add 	%r6, 0x0659, %r22
	.word 0xb408eab1  ! 44: AND_I	and 	%r3, 0x0ab1, %r26
	.word 0x9e012e48  ! 44: ADD_I	add 	%r4, 0x0e48, %r15
	.word 0xae08a6c8  ! 44: AND_I	and 	%r2, 0x06c8, %r23
	.word 0xb4098005  ! 44: AND_R	and 	%r6, %r5, %r26
	.word 0xbe00e13f  ! 44: ADD_I	add 	%r3, 0x013f, %r31
	.word 0xba10a5d9  ! 44: OR_I	or 	%r2, 0x05d9, %r29
	.word 0xbe01eab4  ! 44: ADD_I	add 	%r7, 0x0ab4, %r31
	.word 0xa809c005  ! 44: AND_R	and 	%r7, %r5, %r20
	.word 0xa0008005  ! 44: ADD_R	add 	%r2, %r5, %r16
	.word 0xa4018005  ! 44: ADD_R	add 	%r6, %r5, %r18
	.word 0xac10af95  ! 44: OR_I	or 	%r2, 0x0f95, %r22
	.word 0xb4088005  ! 44: AND_R	and 	%r2, %r5, %r26
	.word 0xb200c005  ! 44: ADD_R	add 	%r3, %r5, %r25
	.word 0xba008005  ! 44: ADD_R	add 	%r2, %r5, %r29
	.word 0xac110005  ! 44: OR_R	or 	%r4, %r5, %r22
	.word 0xbc09c005  ! 44: AND_R	and 	%r7, %r5, %r30
	.word 0xb2108005  ! 44: OR_R	or 	%r2, %r5, %r25
	.word 0xba10c005  ! 44: OR_R	or 	%r3, %r5, %r29
	.word 0xa810a884  ! 44: OR_I	or 	%r2, 0x0884, %r20
	.word 0xb201ef67  ! 44: ADD_I	add 	%r7, 0x0f67, %r25
	.word 0x9c11c005  ! 44: OR_R	or 	%r7, %r5, %r14
	.word 0xb011246d  ! 44: OR_I	or 	%r4, 0x046d, %r24
	.word 0xae00efee  ! 44: ADD_I	add 	%r3, 0x0fee, %r23
	.word 0xa0018005  ! 44: ADD_R	add 	%r6, %r5, %r16
	.word 0xb4108005  ! 44: OR_R	or 	%r2, %r5, %r26
	.word 0xa601e3fe  ! 44: ADD_I	add 	%r7, 0x03fe, %r19
	.word 0xb210c005  ! 44: OR_R	or 	%r3, %r5, %r25
	.word 0xa008a75f  ! 44: AND_I	and 	%r2, 0x075f, %r16
	.word 0x9a08e559  ! 44: AND_I	and 	%r3, 0x0559, %r13
	.word 0xae108005  ! 44: OR_R	or 	%r2, %r5, %r23
	.word 0xa808a54c  ! 44: AND_I	and 	%r2, 0x054c, %r20
	.word 0xa4018005  ! 44: ADD_R	add 	%r6, %r5, %r18
	.word 0xb21126df  ! 44: OR_I	or 	%r4, 0x06df, %r25
	.word 0xa208edd6  ! 44: AND_I	and 	%r3, 0x0dd6, %r17
	.word 0xa2090005  ! 44: AND_R	and 	%r4, %r5, %r17
	.word 0xae118005  ! 44: OR_R	or 	%r6, %r5, %r23
	.word 0xbc10c005  ! 44: OR_R	or 	%r3, %r5, %r30
	.word 0xa4098005  ! 44: AND_R	and 	%r6, %r5, %r18
	.word 0x9a01e71c  ! 44: ADD_I	add 	%r7, 0x071c, %r13
	.word 0xb801c005  ! 44: ADD_R	add 	%r7, %r5, %r28
	.word 0x9e10a77d  ! 44: OR_I	or 	%r2, 0x077d, %r15
	.word 0xa401a856  ! 44: ADD_I	add 	%r6, 0x0856, %r18
	.word 0x9a108005  ! 44: OR_R	or 	%r2, %r5, %r13
	.word 0xae018005  ! 44: ADD_R	add 	%r6, %r5, %r23
	.word 0x9e11eb1c  ! 44: OR_I	or 	%r7, 0x0b1c, %r15
	.word 0xac118005  ! 44: OR_R	or 	%r6, %r5, %r22
	.word 0xb611e991  ! 44: OR_I	or 	%r7, 0x0991, %r27
	.word 0x9e11c005  ! 44: OR_R	or 	%r7, %r5, %r15
	.word 0xb609e0a8  ! 44: AND_I	and 	%r7, 0x00a8, %r27
	.word 0xa210aa84  ! 44: OR_I	or 	%r2, 0x0a84, %r17
	.word 0xb0098005  ! 44: AND_R	and 	%r6, %r5, %r24
	.word 0x9a110005  ! 44: OR_R	or 	%r4, %r5, %r13
	.word 0xba10ed57  ! 44: OR_I	or 	%r3, 0x0d57, %r29
	.word 0xb210c005  ! 44: OR_R	or 	%r3, %r5, %r25
	.word 0xbc08c005  ! 44: AND_R	and 	%r3, %r5, %r30
	.word 0xe821e7e0  ! 44: STW_I	stw	%r20, [%r7 + 0x07e0]
	.word 0xe231af6a  ! 44: STH_I	sth	%r17, [%r6 + 0x0f6a]
	.word 0xda20a5d8  ! 44: STW_I	stw	%r13, [%r2 + 0x05d8]
	.word 0xe030a5bc  ! 44: STH_I	sth	%r16, [%r2 + 0x05bc]
IRF_CE_20:
!$EV error(0,expr(@VA(.MAIN.IRF_CE_20), 16, 16), 1,IRF,ce,2,x, x,x,x, x,x,x)
!$EV error(0,expr(@VA(.MAIN.IRF_CE_20), 16, 16), 3,IRF,ce,37,x, x,x,x, x,x,x)
	.word 0xec31aab8  ! 44: STH_I	sth	%r22, [%r6 + 0x0ab8]
	.word 0xdc28a7b4  ! 44: STB_I	stb	%r14, [%r2 + 0x07b4]
	.word 0xfe712fa0  ! 44: STX_I	stx	%r31, [%r4 + 0x0fa0]
	.word 0xe9388005  ! 44: STDF_R	std	%f20, [%r5, %r2]
	.word 0xa8088005  ! 44: AND_R	and 	%r2, %r5, %r20
	.word 0xb2018005  ! 44: ADD_R	add 	%r6, %r5, %r25
	bne thr0_loop_5
	subcc %g1, 0x1, %g1
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr0_loop_6:
	.word 0xa809aba0  ! 51: AND_I	and 	%r6, 0x0ba0, %r20
	.word 0xa2108005  ! 51: OR_R	or 	%r2, %r5, %r17
	.word 0xae008005  ! 51: ADD_R	add 	%r2, %r5, %r23
	.word 0xb6088005  ! 51: AND_R	and 	%r2, %r5, %r27
	.word 0x9e108005  ! 51: OR_R	or 	%r2, %r5, %r15
	.word 0xba010005  ! 51: ADD_R	add 	%r4, %r5, %r29
	.word 0xb8018005  ! 51: ADD_R	add 	%r6, %r5, %r28
	.word 0xa009aade  ! 51: AND_I	and 	%r6, 0x0ade, %r16
	.word 0xbe00ea3b  ! 51: ADD_I	add 	%r3, 0x0a3b, %r31
	.word 0xa8008005  ! 51: ADD_R	add 	%r2, %r5, %r20
	.word 0xa610e988  ! 51: OR_I	or 	%r3, 0x0988, %r19
	.word 0xb600c005  ! 51: ADD_R	add 	%r3, %r5, %r27
	.word 0xa610a68c  ! 51: OR_I	or 	%r2, 0x068c, %r19
	.word 0xa001c005  ! 51: ADD_R	add 	%r7, %r5, %r16
	.word 0xaa090005  ! 51: AND_R	and 	%r4, %r5, %r21
	.word 0xae01aaae  ! 51: ADD_I	add 	%r6, 0x0aae, %r23
	.word 0xac008005  ! 51: ADD_R	add 	%r2, %r5, %r22
	.word 0x9a08a897  ! 51: AND_I	and 	%r2, 0x0897, %r13
	.word 0xb009e0c0  ! 51: AND_I	and 	%r7, 0x00c0, %r24
	.word 0xa6108005  ! 51: OR_R	or 	%r2, %r5, %r19
	.word 0xb4108005  ! 51: OR_R	or 	%r2, %r5, %r26
	.word 0xb800a3d8  ! 51: ADD_I	add 	%r2, 0x03d8, %r28
	.word 0x9c11ecf6  ! 51: OR_I	or 	%r7, 0x0cf6, %r14
	.word 0xb6090005  ! 51: AND_R	and 	%r4, %r5, %r27
	.word 0xb210a48e  ! 51: OR_I	or 	%r2, 0x048e, %r25
	.word 0xb209e3f7  ! 51: AND_I	and 	%r7, 0x03f7, %r25
	.word 0xa600c005  ! 51: ADD_R	add 	%r3, %r5, %r19
	.word 0xbe118005  ! 51: OR_R	or 	%r6, %r5, %r31
	.word 0xb6108005  ! 51: OR_R	or 	%r2, %r5, %r27
	.word 0xa8108005  ! 51: OR_R	or 	%r2, %r5, %r20
	.word 0xa0018005  ! 51: ADD_R	add 	%r6, %r5, %r16
	.word 0xa011e83a  ! 51: OR_I	or 	%r7, 0x083a, %r16
	.word 0xbe10e461  ! 51: OR_I	or 	%r3, 0x0461, %r31
	.word 0x9a008005  ! 51: ADD_R	add 	%r2, %r5, %r13
	.word 0xa2108005  ! 51: OR_R	or 	%r2, %r5, %r17
	.word 0xb6008005  ! 51: ADD_R	add 	%r2, %r5, %r27
	.word 0xba008005  ! 51: ADD_R	add 	%r2, %r5, %r29
	.word 0xa810af53  ! 51: OR_I	or 	%r2, 0x0f53, %r20
	.word 0xba01243d  ! 51: ADD_I	add 	%r4, 0x043d, %r29
	.word 0x9a118005  ! 51: OR_R	or 	%r6, %r5, %r13
	.word 0xaa090005  ! 51: AND_R	and 	%r4, %r5, %r21
	.word 0xa0118005  ! 51: OR_R	or 	%r6, %r5, %r16
	.word 0xb209c005  ! 51: AND_R	and 	%r7, %r5, %r25
	.word 0xa8008005  ! 51: ADD_R	add 	%r2, %r5, %r20
	.word 0xa60925f1  ! 51: AND_I	and 	%r4, 0x05f1, %r19
	.word 0xb801e416  ! 51: ADD_I	add 	%r7, 0x0416, %r28
	.word 0xa600a276  ! 51: ADD_I	add 	%r2, 0x0276, %r19
	.word 0xa6108005  ! 51: OR_R	or 	%r2, %r5, %r19
	.word 0xb010e2b7  ! 51: OR_I	or 	%r3, 0x02b7, %r24
	.word 0xa411c005  ! 51: OR_R	or 	%r7, %r5, %r18
	.word 0xb6098005  ! 51: AND_R	and 	%r6, %r5, %r27
	.word 0x9e09a3d7  ! 51: AND_I	and 	%r6, 0x03d7, %r15
	.word 0xaa08c005  ! 51: AND_R	and 	%r3, %r5, %r21
	.word 0xa608ea67  ! 51: AND_I	and 	%r3, 0x0a67, %r19
	.word 0xb001c005  ! 51: ADD_R	add 	%r7, %r5, %r24
	.word 0x9e00e8af  ! 51: ADD_I	add 	%r3, 0x08af, %r15
	.word 0xae01a161  ! 51: ADD_I	add 	%r6, 0x0161, %r23
	.word 0xba10a495  ! 51: OR_I	or 	%r2, 0x0495, %r29
	.word 0xb2010005  ! 51: ADD_R	add 	%r4, %r5, %r25
	.word 0x9c01e30f  ! 51: ADD_I	add 	%r7, 0x030f, %r14
	.word 0x9c092d3c  ! 51: AND_I	and 	%r4, 0x0d3c, %r14
	.word 0xa0118005  ! 51: OR_R	or 	%r6, %r5, %r16
	.word 0xbe09e592  ! 51: AND_I	and 	%r7, 0x0592, %r31
	.word 0xb611c005  ! 51: OR_R	or 	%r7, %r5, %r27
	.word 0x9c10a997  ! 51: OR_I	or 	%r2, 0x0997, %r14
	.word 0xb400afec  ! 51: ADD_I	add 	%r2, 0x0fec, %r26
	.word 0x9c108005  ! 51: OR_R	or 	%r2, %r5, %r14
	.word 0xac10a113  ! 51: OR_I	or 	%r2, 0x0113, %r22
	.word 0xac008005  ! 51: ADD_R	add 	%r2, %r5, %r22
	.word 0xa0112cf4  ! 51: OR_I	or 	%r4, 0x0cf4, %r16
	.word 0xa011acac  ! 51: OR_I	or 	%r6, 0x0cac, %r16
	.word 0x9c11a003  ! 51: OR_I	or 	%r6, 0x0003, %r14
	.word 0xa210a6e3  ! 51: OR_I	or 	%r2, 0x06e3, %r17
	.word 0xb809a720  ! 51: AND_I	and 	%r6, 0x0720, %r28
	.word 0xa610a37e  ! 51: OR_I	or 	%r2, 0x037e, %r19
	.word 0xb009ac25  ! 51: AND_I	and 	%r6, 0x0c25, %r24
	.word 0xac11ed7c  ! 51: OR_I	or 	%r7, 0x0d7c, %r22
	.word 0xae00a1de  ! 51: ADD_I	add 	%r2, 0x01de, %r23
	.word 0xa8090005  ! 51: AND_R	and 	%r4, %r5, %r20
	.word 0xa2110005  ! 51: OR_R	or 	%r4, %r5, %r17
	.word 0xa0092c1c  ! 51: AND_I	and 	%r4, 0x0c1c, %r16
	.word 0x9e098005  ! 51: AND_R	and 	%r6, %r5, %r15
	.word 0xba09ee57  ! 51: AND_I	and 	%r7, 0x0e57, %r29
	.word 0x9a01ebf2  ! 51: ADD_I	add 	%r7, 0x0bf2, %r13
	.word 0x9e08acc6  ! 51: AND_I	and 	%r2, 0x0cc6, %r15
	.word 0xac012366  ! 51: ADD_I	add 	%r4, 0x0366, %r22
	.word 0x9c018005  ! 51: ADD_R	add 	%r6, %r5, %r14
	.word 0xa401aa9b  ! 51: ADD_I	add 	%r6, 0x0a9b, %r18
	.word 0x9a00add4  ! 51: ADD_I	add 	%r2, 0x0dd4, %r13
	.word 0xbe00eb4a  ! 51: ADD_I	add 	%r3, 0x0b4a, %r31
	.word 0xaa08c005  ! 51: AND_R	and 	%r3, %r5, %r21
	.word 0xbe11c005  ! 51: OR_R	or 	%r7, %r5, %r31
	.word 0x9c108005  ! 51: OR_R	or 	%r2, %r5, %r14
	.word 0x9a08c005  ! 51: AND_R	and 	%r3, %r5, %r13
	.word 0xa409a5a7  ! 51: AND_I	and 	%r6, 0x05a7, %r18
	.word 0xa209e416  ! 51: AND_I	and 	%r7, 0x0416, %r17
	.word 0xb600a583  ! 51: ADD_I	add 	%r2, 0x0583, %r27
	.word 0xb0110005  ! 51: OR_R	or 	%r4, %r5, %r24
	.word 0xb400acbf  ! 51: ADD_I	add 	%r2, 0x0cbf, %r26
	.word 0x9a08aa89  ! 51: AND_I	and 	%r2, 0x0a89, %r13
	.word 0xbe00c005  ! 51: ADD_R	add 	%r3, %r5, %r31
	.word 0x9e08c005  ! 51: AND_R	and 	%r3, %r5, %r15
	.word 0xb0010005  ! 51: ADD_R	add 	%r4, %r5, %r24
	.word 0xae10a5c6  ! 51: OR_I	or 	%r2, 0x05c6, %r23
	.word 0xb810c005  ! 51: OR_R	or 	%r3, %r5, %r28
	.word 0xa209edc7  ! 51: AND_I	and 	%r7, 0x0dc7, %r17
	.word 0xb010efef  ! 51: OR_I	or 	%r3, 0x0fef, %r24
	.word 0xba09e61d  ! 51: AND_I	and 	%r7, 0x061d, %r29
	.word 0xa608e51e  ! 51: AND_I	and 	%r3, 0x051e, %r19
	.word 0xba00af83  ! 51: ADD_I	add 	%r2, 0x0f83, %r29
	.word 0xb400c005  ! 51: ADD_R	add 	%r3, %r5, %r26
	.word 0x9e088005  ! 51: AND_R	and 	%r2, %r5, %r15
	.word 0xb209ae41  ! 51: AND_I	and 	%r6, 0x0e41, %r25
	.word 0xa200e571  ! 51: ADD_I	add 	%r3, 0x0571, %r17
	.word 0xa6010005  ! 51: ADD_R	add 	%r4, %r5, %r19
	.word 0xae108005  ! 51: OR_R	or 	%r2, %r5, %r23
	.word 0x9e09284b  ! 51: AND_I	and 	%r4, 0x084b, %r15
	.word 0xb6018005  ! 51: ADD_R	add 	%r6, %r5, %r27
	.word 0xb610a5dd  ! 51: OR_I	or 	%r2, 0x05dd, %r27
	.word 0xa200c005  ! 51: ADD_R	add 	%r3, %r5, %r17
	.word 0xb808a6db  ! 51: AND_I	and 	%r2, 0x06db, %r28
	.word 0xb400a787  ! 51: ADD_I	add 	%r2, 0x0787, %r26
	.word 0xbc108005  ! 51: OR_R	or 	%r2, %r5, %r30
	.word 0xa411274b  ! 51: OR_I	or 	%r4, 0x074b, %r18
	.word 0xba09c005  ! 51: AND_R	and 	%r7, %r5, %r29
	.word 0x9a012e3b  ! 51: ADD_I	add 	%r4, 0x0e3b, %r13
	.word 0x9a01e0bc  ! 51: ADD_I	add 	%r7, 0x00bc, %r13
	.word 0xb610ed6d  ! 51: OR_I	or 	%r3, 0x0d6d, %r27
	.word 0xb41129e0  ! 51: OR_I	or 	%r4, 0x09e0, %r26
	.word 0xb200a761  ! 51: ADD_I	add 	%r2, 0x0761, %r25
	.word 0xa601c005  ! 51: ADD_R	add 	%r7, %r5, %r19
	.word 0xb4108005  ! 51: OR_R	or 	%r2, %r5, %r26
	.word 0x9c10a08c  ! 51: OR_I	or 	%r2, 0x008c, %r14
	.word 0xa0010005  ! 51: ADD_R	add 	%r4, %r5, %r16
	.word 0xa211e62c  ! 51: OR_I	or 	%r7, 0x062c, %r17
	.word 0xb611c005  ! 51: OR_R	or 	%r7, %r5, %r27
	.word 0x9a00efdb  ! 51: ADD_I	add 	%r3, 0x0fdb, %r13
	.word 0xa201c005  ! 51: ADD_R	add 	%r7, %r5, %r17
	.word 0xac00e938  ! 51: ADD_I	add 	%r3, 0x0938, %r22
	.word 0xbc018005  ! 51: ADD_R	add 	%r6, %r5, %r30
	.word 0x9e088005  ! 51: AND_R	and 	%r2, %r5, %r15
	.word 0xa401a2b6  ! 51: ADD_I	add 	%r6, 0x02b6, %r18
	.word 0x9c11ed00  ! 51: OR_I	or 	%r7, 0x0d00, %r14
	.word 0xb2108005  ! 51: OR_R	or 	%r2, %r5, %r25
	.word 0xac118005  ! 51: OR_R	or 	%r6, %r5, %r22
	.word 0x9c10e5e2  ! 51: OR_I	or 	%r3, 0x05e2, %r14
	.word 0xa4018005  ! 51: ADD_R	add 	%r6, %r5, %r18
	.word 0x9c018005  ! 51: ADD_R	add 	%r6, %r5, %r14
	.word 0xba11c005  ! 51: OR_R	or 	%r7, %r5, %r29
	.word 0xb809aa53  ! 51: AND_I	and 	%r6, 0x0a53, %r28
	.word 0xb6088005  ! 51: AND_R	and 	%r2, %r5, %r27
	.word 0xaa08e64b  ! 51: AND_I	and 	%r3, 0x064b, %r21
	.word 0x9e08a2fb  ! 51: AND_I	and 	%r2, 0x02fb, %r15
	.word 0xba00eca9  ! 51: ADD_I	add 	%r3, 0x0ca9, %r29
	.word 0xa801e415  ! 51: ADD_I	add 	%r7, 0x0415, %r20
	.word 0xbc09c005  ! 51: AND_R	and 	%r7, %r5, %r30
	.word 0x9e018005  ! 51: ADD_R	add 	%r6, %r5, %r15
	.word 0xb009c005  ! 51: AND_R	and 	%r7, %r5, %r24
	.word 0xb208ea63  ! 51: AND_I	and 	%r3, 0x0a63, %r25
	.word 0xbe00ae05  ! 51: ADD_I	add 	%r2, 0x0e05, %r31
	.word 0x9c10c005  ! 51: OR_R	or 	%r3, %r5, %r14
	.word 0xbc008005  ! 51: ADD_R	add 	%r2, %r5, %r30
	.word 0xbc018005  ! 51: ADD_R	add 	%r6, %r5, %r30
	.word 0xba08ac62  ! 51: AND_I	and 	%r2, 0x0c62, %r29
	.word 0xb4008005  ! 51: ADD_R	add 	%r2, %r5, %r26
	.word 0x9c018005  ! 51: ADD_R	add 	%r6, %r5, %r14
	.word 0xb2118005  ! 51: OR_R	or 	%r6, %r5, %r25
	.word 0x9a08acc7  ! 51: AND_I	and 	%r2, 0x0cc7, %r13
	.word 0xbc10a683  ! 51: OR_I	or 	%r2, 0x0683, %r30
	.word 0xa800e7d6  ! 51: ADD_I	add 	%r3, 0x07d6, %r20
	.word 0xa210aef8  ! 51: OR_I	or 	%r2, 0x0ef8, %r17
	.word 0xbc0924b1  ! 51: AND_I	and 	%r4, 0x04b1, %r30
	.word 0xa0118005  ! 51: OR_R	or 	%r6, %r5, %r16
	.word 0x9c08e050  ! 51: AND_I	and 	%r3, 0x0050, %r14
	.word 0xa610ed15  ! 51: OR_I	or 	%r3, 0x0d15, %r19
	.word 0xa2112a7f  ! 51: OR_I	or 	%r4, 0x0a7f, %r17
	.word 0xb8088005  ! 51: AND_R	and 	%r2, %r5, %r28
	.word 0xba112fdc  ! 51: OR_I	or 	%r4, 0x0fdc, %r29
	.word 0xbc11e8c2  ! 51: OR_I	or 	%r7, 0x08c2, %r30
	.word 0xac10c005  ! 51: OR_R	or 	%r3, %r5, %r22
	.word 0xb809c005  ! 51: AND_R	and 	%r7, %r5, %r28
	.word 0x9a088005  ! 51: AND_R	and 	%r2, %r5, %r13
	.word 0xa600ae0e  ! 51: ADD_I	add 	%r2, 0x0e0e, %r19
	.word 0xba00a8b9  ! 51: ADD_I	add 	%r2, 0x08b9, %r29
	.word 0xa401c005  ! 51: ADD_R	add 	%r7, %r5, %r18
	.word 0xb4092525  ! 51: AND_I	and 	%r4, 0x0525, %r26
	.word 0x9e11a7a5  ! 51: OR_I	or 	%r6, 0x07a5, %r15
	.word 0xbc118005  ! 51: OR_R	or 	%r6, %r5, %r30
	.word 0xb210a11d  ! 51: OR_I	or 	%r2, 0x011d, %r25
	.word 0xbe010005  ! 51: ADD_R	add 	%r4, %r5, %r31
	.word 0x9c10a252  ! 51: OR_I	or 	%r2, 0x0252, %r14
	.word 0xbc00af59  ! 51: ADD_I	add 	%r2, 0x0f59, %r30
	.word 0xa801abba  ! 51: ADD_I	add 	%r6, 0x0bba, %r20
	.word 0xb8018005  ! 51: ADD_R	add 	%r6, %r5, %r28
	.word 0xb400c005  ! 51: ADD_R	add 	%r3, %r5, %r26
	.word 0xa610a575  ! 51: OR_I	or 	%r2, 0x0575, %r19
	.word 0xb6110005  ! 51: OR_R	or 	%r4, %r5, %r27
	.word 0xbe00a898  ! 51: ADD_I	add 	%r2, 0x0898, %r31
	.word 0xb208a646  ! 51: AND_I	and 	%r2, 0x0646, %r25
	.word 0xae008005  ! 51: ADD_R	add 	%r2, %r5, %r23
	.word 0xb2118005  ! 51: OR_R	or 	%r6, %r5, %r25
	.word 0xa8090005  ! 51: AND_R	and 	%r4, %r5, %r20
	.word 0x9c01a840  ! 51: ADD_I	add 	%r6, 0x0840, %r14
	.word 0xba010005  ! 51: ADD_R	add 	%r4, %r5, %r29
	.word 0xa0010005  ! 51: ADD_R	add 	%r4, %r5, %r16
	.word 0xb8010005  ! 51: ADD_R	add 	%r4, %r5, %r28
	.word 0x9a008005  ! 51: ADD_R	add 	%r2, %r5, %r13
	.word 0xbe108005  ! 51: OR_R	or 	%r2, %r5, %r31
	.word 0xac10acc5  ! 51: OR_I	or 	%r2, 0x0cc5, %r22
	.word 0xbc018005  ! 51: ADD_R	add 	%r6, %r5, %r30
	.word 0xb4008005  ! 51: ADD_R	add 	%r2, %r5, %r26
	.word 0x9c012faa  ! 51: ADD_I	add 	%r4, 0x0faa, %r14
	.word 0xbe08a6e1  ! 51: AND_I	and 	%r2, 0x06e1, %r31
	.word 0xa40125fc  ! 51: ADD_I	add 	%r4, 0x05fc, %r18
	.word 0xa209e2bc  ! 51: AND_I	and 	%r7, 0x02bc, %r17
	.word 0x9c08c005  ! 51: AND_R	and 	%r3, %r5, %r14
	.word 0xaa09a575  ! 51: AND_I	and 	%r6, 0x0575, %r21
	.word 0xa210abe3  ! 51: OR_I	or 	%r2, 0x0be3, %r17
	.word 0x9c11e310  ! 51: OR_I	or 	%r7, 0x0310, %r14
	.word 0xa60120b3  ! 51: ADD_I	add 	%r4, 0x00b3, %r19
	.word 0xb201ea7f  ! 51: ADD_I	add 	%r7, 0x0a7f, %r25
	.word 0xa001c005  ! 51: ADD_R	add 	%r7, %r5, %r16
	.word 0xa001e06d  ! 51: ADD_I	add 	%r7, 0x006d, %r16
	.word 0xb400c005  ! 51: ADD_R	add 	%r3, %r5, %r26
	.word 0xa400a3c0  ! 51: ADD_I	add 	%r2, 0x03c0, %r18
	.word 0xa401c005  ! 51: ADD_R	add 	%r7, %r5, %r18
	.word 0xb60129e8  ! 51: ADD_I	add 	%r4, 0x09e8, %r27
	.word 0x9a09c005  ! 51: AND_R	and 	%r7, %r5, %r13
	.word 0xa008aba1  ! 51: AND_I	and 	%r2, 0x0ba1, %r16
	.word 0xbc09c005  ! 51: AND_R	and 	%r7, %r5, %r30
	.word 0xaa008005  ! 51: ADD_R	add 	%r2, %r5, %r21
	.word 0xb211a9d3  ! 51: OR_I	or 	%r6, 0x09d3, %r25
	.word 0xf2212d3c  ! 51: STW_I	stw	%r25, [%r4 + 0x0d3c]
	.word 0xfa312ea0  ! 51: STH_I	sth	%r29, [%r4 + 0x0ea0]
	.word 0xe420a740  ! 51: STW_I	stw	%r18, [%r2 + 0x0740]
	.word 0xe628eb9f  ! 51: STB_I	stb	%r19, [%r3 + 0x0b9f]
IRF_CE_24:
!$EV error(0,expr(@VA(.MAIN.IRF_CE_24), 16, 16), 1,IRF,ce,4,x, x,x,x, x,x,x)
!$EV error(0,expr(@VA(.MAIN.IRF_CE_24), 16, 16), 3,IRF,ce,15,x, x,x,x, x,x,x)
	.word 0xe831ed5a  ! 51: STH_I	sth	%r20, [%r7 + 0x0d5a]
	.word 0xf631a634  ! 51: STH_I	sth	%r27, [%r6 + 0x0634]
	.word 0xec2120ec  ! 51: STW_I	stw	%r22, [%r4 + 0x00ec]
	.word 0xddf12005  ! 51: CASXA_R	casxa	[%r4]%asi, %r5, %r14
	.word 0x9e108005  ! 51: OR_R	or 	%r2, %r5, %r15
	.word 0xbe10a71e  ! 51: OR_I	or 	%r2, 0x071e, %r31
	bne thr0_loop_6
	subcc %g1, 0x1, %g1
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr0_loop_7:
	.word 0xa209c005  ! 59: AND_R	and 	%r7, %r5, %r17
	.word 0xb00123d3  ! 59: ADD_I	add 	%r4, 0x03d3, %r24
	.word 0xa4112332  ! 59: OR_I	or 	%r4, 0x0332, %r18
	.word 0xb0118005  ! 59: OR_R	or 	%r6, %r5, %r24
	.word 0xae11254c  ! 59: OR_I	or 	%r4, 0x054c, %r23
	.word 0xa4010005  ! 59: ADD_R	add 	%r4, %r5, %r18
	.word 0xbe10a6e7  ! 59: OR_I	or 	%r2, 0x06e7, %r31
	.word 0x9a11ee92  ! 59: OR_I	or 	%r7, 0x0e92, %r13
	.word 0xa0018005  ! 59: ADD_R	add 	%r6, %r5, %r16
	.word 0xac09e0b1  ! 59: AND_I	and 	%r7, 0x00b1, %r22
	.word 0x9e01c005  ! 59: ADD_R	add 	%r7, %r5, %r15
	.word 0xa611e598  ! 59: OR_I	or 	%r7, 0x0598, %r19
	.word 0xb009c005  ! 59: AND_R	and 	%r7, %r5, %r24
	.word 0xae00eb3b  ! 59: ADD_I	add 	%r3, 0x0b3b, %r23
	.word 0xbe118005  ! 59: OR_R	or 	%r6, %r5, %r31
	.word 0xa409c005  ! 59: AND_R	and 	%r7, %r5, %r18
	.word 0xa600e0d9  ! 59: ADD_I	add 	%r3, 0x00d9, %r19
	.word 0xb8098005  ! 59: AND_R	and 	%r6, %r5, %r28
	.word 0xb6108005  ! 59: OR_R	or 	%r2, %r5, %r27
	.word 0x9a08c005  ! 59: AND_R	and 	%r3, %r5, %r13
	.word 0xa008afc9  ! 59: AND_I	and 	%r2, 0x0fc9, %r16
	.word 0xa011e683  ! 59: OR_I	or 	%r7, 0x0683, %r16
	.word 0xb609c005  ! 59: AND_R	and 	%r7, %r5, %r27
	.word 0xba088005  ! 59: AND_R	and 	%r2, %r5, %r29
	.word 0xb001c005  ! 59: ADD_R	add 	%r7, %r5, %r24
	.word 0xaa012e9d  ! 59: ADD_I	add 	%r4, 0x0e9d, %r21
	.word 0xb8008005  ! 59: ADD_R	add 	%r2, %r5, %r28
	.word 0xaa110005  ! 59: OR_R	or 	%r4, %r5, %r21
	.word 0xa001a70d  ! 59: ADD_I	add 	%r6, 0x070d, %r16
	.word 0xb011c005  ! 59: OR_R	or 	%r7, %r5, %r24
	.word 0xb011ec66  ! 59: OR_I	or 	%r7, 0x0c66, %r24
	.word 0xa8108005  ! 59: OR_R	or 	%r2, %r5, %r20
	.word 0xac00e64f  ! 59: ADD_I	add 	%r3, 0x064f, %r22
	.word 0x9a110005  ! 59: OR_R	or 	%r4, %r5, %r13
	.word 0xb610a171  ! 59: OR_I	or 	%r2, 0x0171, %r27
	.word 0xb000a736  ! 59: ADD_I	add 	%r2, 0x0736, %r24
	.word 0xba08c005  ! 59: AND_R	and 	%r3, %r5, %r29
	.word 0xb8098005  ! 59: AND_R	and 	%r6, %r5, %r28
	.word 0xa209c005  ! 59: AND_R	and 	%r7, %r5, %r17
	.word 0xbc118005  ! 59: OR_R	or 	%r6, %r5, %r30
	.word 0xaa01c005  ! 59: ADD_R	add 	%r7, %r5, %r21
	.word 0xb209c005  ! 59: AND_R	and 	%r7, %r5, %r25
	.word 0xb208e13b  ! 59: AND_I	and 	%r3, 0x013b, %r25
	.word 0x9c08ae1b  ! 59: AND_I	and 	%r2, 0x0e1b, %r14
	.word 0x9a11c005  ! 59: OR_R	or 	%r7, %r5, %r13
	.word 0xb401c005  ! 59: ADD_R	add 	%r7, %r5, %r26
	.word 0xac08ea43  ! 59: AND_I	and 	%r3, 0x0a43, %r22
	.word 0xb201a059  ! 59: ADD_I	add 	%r6, 0x0059, %r25
	.word 0xa2090005  ! 59: AND_R	and 	%r4, %r5, %r17
	.word 0xbe11e0d0  ! 59: OR_I	or 	%r7, 0x00d0, %r31
	.word 0xb4090005  ! 59: AND_R	and 	%r4, %r5, %r26
	.word 0x9c018005  ! 59: ADD_R	add 	%r6, %r5, %r14
	.word 0xa210ad04  ! 59: OR_I	or 	%r2, 0x0d04, %r17
	.word 0xbe118005  ! 59: OR_R	or 	%r6, %r5, %r31
	.word 0xa600a03c  ! 59: ADD_I	add 	%r2, 0x003c, %r19
	.word 0x9e108005  ! 59: OR_R	or 	%r2, %r5, %r15
	.word 0xbe08e28c  ! 59: AND_I	and 	%r3, 0x028c, %r31
	.word 0xaa09a6c4  ! 59: AND_I	and 	%r6, 0x06c4, %r21
	.word 0xa209c005  ! 59: AND_R	and 	%r7, %r5, %r17
	.word 0xb810c005  ! 59: OR_R	or 	%r3, %r5, %r28
	.word 0xa401aed6  ! 59: ADD_I	add 	%r6, 0x0ed6, %r18
	.word 0xba108005  ! 59: OR_R	or 	%r2, %r5, %r29
	.word 0xbc09a7d4  ! 59: AND_I	and 	%r6, 0x07d4, %r30
	.word 0xa2088005  ! 59: AND_R	and 	%r2, %r5, %r17
	.word 0xaa110005  ! 59: OR_R	or 	%r4, %r5, %r21
	.word 0xb811ace1  ! 59: OR_I	or 	%r6, 0x0ce1, %r28
	.word 0xac01ef09  ! 59: ADD_I	add 	%r7, 0x0f09, %r22
	.word 0xa811c005  ! 59: OR_R	or 	%r7, %r5, %r20
	.word 0xa208a854  ! 59: AND_I	and 	%r2, 0x0854, %r17
	.word 0x9e09e4ff  ! 59: AND_I	and 	%r7, 0x04ff, %r15
	.word 0xb2010005  ! 59: ADD_R	add 	%r4, %r5, %r25
	.word 0xb201ed91  ! 59: ADD_I	add 	%r7, 0x0d91, %r25
	.word 0xb800c005  ! 59: ADD_R	add 	%r3, %r5, %r28
	.word 0xb000a280  ! 59: ADD_I	add 	%r2, 0x0280, %r24
	.word 0xba018005  ! 59: ADD_R	add 	%r6, %r5, %r29
	.word 0x9c092c9d  ! 59: AND_I	and 	%r4, 0x0c9d, %r14
	.word 0xa408c005  ! 59: AND_R	and 	%r3, %r5, %r18
	.word 0x9e10c005  ! 59: OR_R	or 	%r3, %r5, %r15
	.word 0xb2088005  ! 59: AND_R	and 	%r2, %r5, %r25
	.word 0xaa00c005  ! 59: ADD_R	add 	%r3, %r5, %r21
	.word 0xa208a6a5  ! 59: AND_I	and 	%r2, 0x06a5, %r17
	.word 0x9a11c005  ! 59: OR_R	or 	%r7, %r5, %r13
	.word 0xb601ee34  ! 59: ADD_I	add 	%r7, 0x0e34, %r27
	.word 0xae01c005  ! 59: ADD_R	add 	%r7, %r5, %r23
	.word 0xba08af5f  ! 59: AND_I	and 	%r2, 0x0f5f, %r29
	.word 0xa609aa9e  ! 59: AND_I	and 	%r6, 0x0a9e, %r19
	.word 0x9e0929d1  ! 59: AND_I	and 	%r4, 0x09d1, %r15
	.word 0xbe09e384  ! 59: AND_I	and 	%r7, 0x0384, %r31
	.word 0xb610c005  ! 59: OR_R	or 	%r3, %r5, %r27
	.word 0xba10a2d7  ! 59: OR_I	or 	%r2, 0x02d7, %r29
	.word 0xb0010005  ! 59: ADD_R	add 	%r4, %r5, %r24
	.word 0x9e108005  ! 59: OR_R	or 	%r2, %r5, %r15
	.word 0xb8108005  ! 59: OR_R	or 	%r2, %r5, %r28
	.word 0xa408ef1f  ! 59: AND_I	and 	%r3, 0x0f1f, %r18
	.word 0xaa10e20c  ! 59: OR_I	or 	%r3, 0x020c, %r21
	.word 0x9e012ff8  ! 59: ADD_I	add 	%r4, 0x0ff8, %r15
	.word 0xae00c005  ! 59: ADD_R	add 	%r3, %r5, %r23
	.word 0xa800e8a5  ! 59: ADD_I	add 	%r3, 0x08a5, %r20
	.word 0x9a10ade1  ! 59: OR_I	or 	%r2, 0x0de1, %r13
	.word 0xb608a688  ! 59: AND_I	and 	%r2, 0x0688, %r27
	.word 0xaa09e8d9  ! 59: AND_I	and 	%r7, 0x08d9, %r21
	.word 0x9a010005  ! 59: ADD_R	add 	%r4, %r5, %r13
	.word 0x9c088005  ! 59: AND_R	and 	%r2, %r5, %r14
	.word 0xae09ea40  ! 59: AND_I	and 	%r7, 0x0a40, %r23
	.word 0xbc08e4c4  ! 59: AND_I	and 	%r3, 0x04c4, %r30
	.word 0xa6108005  ! 59: OR_R	or 	%r2, %r5, %r19
	.word 0xae108005  ! 59: OR_R	or 	%r2, %r5, %r23
	.word 0xaa008005  ! 59: ADD_R	add 	%r2, %r5, %r21
	.word 0xa008a3c5  ! 59: AND_I	and 	%r2, 0x03c5, %r16
	.word 0x9a10a0fd  ! 59: OR_I	or 	%r2, 0x00fd, %r13
	.word 0xa608af0d  ! 59: AND_I	and 	%r2, 0x0f0d, %r19
	.word 0x9c098005  ! 59: AND_R	and 	%r6, %r5, %r14
	.word 0xa6118005  ! 59: OR_R	or 	%r6, %r5, %r19
	.word 0xa810a036  ! 59: OR_I	or 	%r2, 0x0036, %r20
	.word 0xa6090005  ! 59: AND_R	and 	%r4, %r5, %r19
	.word 0xb000e4e5  ! 59: ADD_I	add 	%r3, 0x04e5, %r24
	.word 0xb409e921  ! 59: AND_I	and 	%r7, 0x0921, %r26
	.word 0xbe010005  ! 59: ADD_R	add 	%r4, %r5, %r31
	.word 0xb810ae72  ! 59: OR_I	or 	%r2, 0x0e72, %r28
	.word 0xa201c005  ! 59: ADD_R	add 	%r7, %r5, %r17
	.word 0xb8018005  ! 59: ADD_R	add 	%r6, %r5, %r28
	.word 0xaa088005  ! 59: AND_R	and 	%r2, %r5, %r21
	.word 0xbc00e639  ! 59: ADD_I	add 	%r3, 0x0639, %r30
	.word 0x9a01c005  ! 59: ADD_R	add 	%r7, %r5, %r13
	.word 0xaa08a13a  ! 59: AND_I	and 	%r2, 0x013a, %r21
	.word 0xaa00ad77  ! 59: ADD_I	add 	%r2, 0x0d77, %r21
	.word 0xae01262e  ! 59: ADD_I	add 	%r4, 0x062e, %r23
	.word 0xb200c005  ! 59: ADD_R	add 	%r3, %r5, %r25
	.word 0xbc00ae67  ! 59: ADD_I	add 	%r2, 0x0e67, %r30
	.word 0xb4018005  ! 59: ADD_R	add 	%r6, %r5, %r26
	.word 0xb600a692  ! 59: ADD_I	add 	%r2, 0x0692, %r27
	.word 0xa2088005  ! 59: AND_R	and 	%r2, %r5, %r17
	.word 0xbc10ee6f  ! 59: OR_I	or 	%r3, 0x0e6f, %r30
	.word 0xb2110005  ! 59: OR_R	or 	%r4, %r5, %r25
	.word 0x9a00a41f  ! 59: ADD_I	add 	%r2, 0x041f, %r13
	.word 0xb200a582  ! 59: ADD_I	add 	%r2, 0x0582, %r25
	.word 0xbe090005  ! 59: AND_R	and 	%r4, %r5, %r31
	.word 0xa001c005  ! 59: ADD_R	add 	%r7, %r5, %r16
	.word 0xb209c005  ! 59: AND_R	and 	%r7, %r5, %r25
	.word 0xb610c005  ! 59: OR_R	or 	%r3, %r5, %r27
	.word 0xb801aa34  ! 59: ADD_I	add 	%r6, 0x0a34, %r28
	.word 0xbe01ee6e  ! 59: ADD_I	add 	%r7, 0x0e6e, %r31
	.word 0xbc00ab8e  ! 59: ADD_I	add 	%r2, 0x0b8e, %r30
	.word 0xbc08c005  ! 59: AND_R	and 	%r3, %r5, %r30
	.word 0xb2098005  ! 59: AND_R	and 	%r6, %r5, %r25
	.word 0xbc118005  ! 59: OR_R	or 	%r6, %r5, %r30
	.word 0xae11e27d  ! 59: OR_I	or 	%r7, 0x027d, %r23
	.word 0xbc108005  ! 59: OR_R	or 	%r2, %r5, %r30
	.word 0xb0118005  ! 59: OR_R	or 	%r6, %r5, %r24
	.word 0x9c1127e0  ! 59: OR_I	or 	%r4, 0x07e0, %r14
	.word 0xbc00af1d  ! 59: ADD_I	add 	%r2, 0x0f1d, %r30
	.word 0xba00ad05  ! 59: ADD_I	add 	%r2, 0x0d05, %r29
	.word 0xa209c005  ! 59: AND_R	and 	%r7, %r5, %r17
	.word 0xb4118005  ! 59: OR_R	or 	%r6, %r5, %r26
	.word 0xa208e27f  ! 59: AND_I	and 	%r3, 0x027f, %r17
	.word 0xb000edfd  ! 59: ADD_I	add 	%r3, 0x0dfd, %r24
	.word 0xb6108005  ! 59: OR_R	or 	%r2, %r5, %r27
	.word 0xb0112210  ! 59: OR_I	or 	%r4, 0x0210, %r24
	.word 0xb600ad00  ! 59: ADD_I	add 	%r2, 0x0d00, %r27
	.word 0xbc10eaba  ! 59: OR_I	or 	%r3, 0x0aba, %r30
	.word 0xbe10c005  ! 59: OR_R	or 	%r3, %r5, %r31
	.word 0xa6008005  ! 59: ADD_R	add 	%r2, %r5, %r19
	.word 0xb6018005  ! 59: ADD_R	add 	%r6, %r5, %r27
	.word 0xb208c005  ! 59: AND_R	and 	%r3, %r5, %r25
	.word 0xb409abed  ! 59: AND_I	and 	%r6, 0x0bed, %r26
	.word 0x9a01e1f3  ! 59: ADD_I	add 	%r7, 0x01f3, %r13
	.word 0xb21127df  ! 59: OR_I	or 	%r4, 0x07df, %r25
	.word 0xbe09e43c  ! 59: AND_I	and 	%r7, 0x043c, %r31
	.word 0xbe01e332  ! 59: ADD_I	add 	%r7, 0x0332, %r31
	.word 0xa010c005  ! 59: OR_R	or 	%r3, %r5, %r16
	.word 0xac00a731  ! 59: ADD_I	add 	%r2, 0x0731, %r22
	.word 0xac098005  ! 59: AND_R	and 	%r6, %r5, %r22
	.word 0xa600a76b  ! 59: ADD_I	add 	%r2, 0x076b, %r19
	.word 0xb4098005  ! 59: AND_R	and 	%r6, %r5, %r26
	.word 0x9a01e0ff  ! 59: ADD_I	add 	%r7, 0x00ff, %r13
	.word 0x9c118005  ! 59: OR_R	or 	%r6, %r5, %r14
	.word 0xbe10eac9  ! 59: OR_I	or 	%r3, 0x0ac9, %r31
	.word 0xb6018005  ! 59: ADD_R	add 	%r6, %r5, %r27
	.word 0xbe012660  ! 59: ADD_I	add 	%r4, 0x0660, %r31
	.word 0xb000c005  ! 59: ADD_R	add 	%r3, %r5, %r24
	.word 0xb8098005  ! 59: AND_R	and 	%r6, %r5, %r28
	.word 0xa61123c8  ! 59: OR_I	or 	%r4, 0x03c8, %r19
	.word 0xb210a634  ! 59: OR_I	or 	%r2, 0x0634, %r25
	.word 0xb210c005  ! 59: OR_R	or 	%r3, %r5, %r25
	.word 0xae012cc3  ! 59: ADD_I	add 	%r4, 0x0cc3, %r23
	.word 0xb808ab72  ! 59: AND_I	and 	%r2, 0x0b72, %r28
	.word 0xbe088005  ! 59: AND_R	and 	%r2, %r5, %r31
	.word 0xba09eeaa  ! 59: AND_I	and 	%r7, 0x0eaa, %r29
	.word 0xa2118005  ! 59: OR_R	or 	%r6, %r5, %r17
	.word 0xb008a30c  ! 59: AND_I	and 	%r2, 0x030c, %r24
	.word 0xac098005  ! 59: AND_R	and 	%r6, %r5, %r22
	.word 0xb8098005  ! 59: AND_R	and 	%r6, %r5, %r28
	.word 0xec20af40  ! 59: STW_I	stw	%r22, [%r2 + 0x0f40]
	.word 0xe831a284  ! 59: STH_I	sth	%r20, [%r6 + 0x0284]
	.word 0xe230ed94  ! 59: STH_I	sth	%r17, [%r3 + 0x0d94]
	.word 0xe021a4b4  ! 59: STW_I	stw	%r16, [%r6 + 0x04b4]
IRF_CE_28:
!$EV error(0,expr(@VA(.MAIN.IRF_CE_28), 16, 16), 1,IRF,ce,50,x, x,x,x, x,x,x)
!$EV error(0,expr(@VA(.MAIN.IRF_CE_28), 16, 16), 3,IRF,ce,57,x, x,x,x, x,x,x)
	.word 0xe620e298  ! 59: STW_I	stw	%r19, [%r3 + 0x0298]
	.word 0xe229e175  ! 59: STB_I	stb	%r17, [%r7 + 0x0175]
	.word 0xe230a420  ! 59: STH_I	sth	%r17, [%r2 + 0x0420]
	.word 0xd8f20989  ! 59: STXA_R	stxa	%r12, [%r8 + %r9] 0x4c
	.word 0xb608c005  ! 59: AND_R	and 	%r3, %r5, %r27
	.word 0xae08ae93  ! 59: AND_I	and 	%r2, 0x0e93, %r23
	bne thr0_loop_7
	subcc %g1, 0x1, %g1
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr0_loop_8:
	.word 0xa009a837  ! 66: AND_I	and 	%r6, 0x0837, %r16
	.word 0x9c09aad8  ! 66: AND_I	and 	%r6, 0x0ad8, %r14
	.word 0xae01a701  ! 66: ADD_I	add 	%r6, 0x0701, %r23
	.word 0xb009abb2  ! 66: AND_I	and 	%r6, 0x0bb2, %r24
	.word 0xa610e72d  ! 66: OR_I	or 	%r3, 0x072d, %r19
	.word 0xb811ee1a  ! 66: OR_I	or 	%r7, 0x0e1a, %r28
	.word 0x9a01223b  ! 66: ADD_I	add 	%r4, 0x023b, %r13
	.word 0xb000a449  ! 66: ADD_I	add 	%r2, 0x0449, %r24
	.word 0xae008005  ! 66: ADD_R	add 	%r2, %r5, %r23
	.word 0xae118005  ! 66: OR_R	or 	%r6, %r5, %r23
	.word 0xbe10ab76  ! 66: OR_I	or 	%r2, 0x0b76, %r31
	.word 0xa209e8e0  ! 66: AND_I	and 	%r7, 0x08e0, %r17
	.word 0xbe08c005  ! 66: AND_R	and 	%r3, %r5, %r31
	.word 0xb000a472  ! 66: ADD_I	add 	%r2, 0x0472, %r24
	.word 0xbc09e030  ! 66: AND_I	and 	%r7, 0x0030, %r30
	.word 0x9e01aaef  ! 66: ADD_I	add 	%r6, 0x0aef, %r15
	.word 0xbe108005  ! 66: OR_R	or 	%r2, %r5, %r31
	.word 0xa2008005  ! 66: ADD_R	add 	%r2, %r5, %r17
	.word 0xbe11ad3a  ! 66: OR_I	or 	%r6, 0x0d3a, %r31
	.word 0xaa11acd5  ! 66: OR_I	or 	%r6, 0x0cd5, %r21
	.word 0xba018005  ! 66: ADD_R	add 	%r6, %r5, %r29
	.word 0xae092370  ! 66: AND_I	and 	%r4, 0x0370, %r23
	.word 0xac008005  ! 66: ADD_R	add 	%r2, %r5, %r22
	.word 0xbe00e845  ! 66: ADD_I	add 	%r3, 0x0845, %r31
	.word 0xa611a9ce  ! 66: OR_I	or 	%r6, 0x09ce, %r19
	.word 0xa009ed9a  ! 66: AND_I	and 	%r7, 0x0d9a, %r16
	.word 0xb0012f97  ! 66: ADD_I	add 	%r4, 0x0f97, %r24
	.word 0xa4112f81  ! 66: OR_I	or 	%r4, 0x0f81, %r18
	.word 0xac10ab02  ! 66: OR_I	or 	%r2, 0x0b02, %r22
	.word 0xac11e871  ! 66: OR_I	or 	%r7, 0x0871, %r22
	.word 0xac09c005  ! 66: AND_R	and 	%r7, %r5, %r22
	.word 0xa0108005  ! 66: OR_R	or 	%r2, %r5, %r16
	.word 0xa0110005  ! 66: OR_R	or 	%r4, %r5, %r16
	.word 0xba11ed49  ! 66: OR_I	or 	%r7, 0x0d49, %r29
	.word 0xa809e79f  ! 66: AND_I	and 	%r7, 0x079f, %r20
	.word 0xb8088005  ! 66: AND_R	and 	%r2, %r5, %r28
	.word 0x9c118005  ! 66: OR_R	or 	%r6, %r5, %r14
	.word 0xb008ad7d  ! 66: AND_I	and 	%r2, 0x0d7d, %r24
	.word 0xa801c005  ! 66: ADD_R	add 	%r7, %r5, %r20
	.word 0xbc09afa4  ! 66: AND_I	and 	%r6, 0x0fa4, %r30
	.word 0xa411a7c0  ! 66: OR_I	or 	%r6, 0x07c0, %r18
	.word 0x9e092ff5  ! 66: AND_I	and 	%r4, 0x0ff5, %r15
	.word 0xb610a295  ! 66: OR_I	or 	%r2, 0x0295, %r27
	.word 0xb8118005  ! 66: OR_R	or 	%r6, %r5, %r28
	.word 0xbe10c005  ! 66: OR_R	or 	%r3, %r5, %r31
	.word 0xb8012197  ! 66: ADD_I	add 	%r4, 0x0197, %r28
	.word 0xa210a853  ! 66: OR_I	or 	%r2, 0x0853, %r17
	.word 0xae11c005  ! 66: OR_R	or 	%r7, %r5, %r23
	.word 0xac10a38b  ! 66: OR_I	or 	%r2, 0x038b, %r22
	.word 0x9a090005  ! 66: AND_R	and 	%r4, %r5, %r13
	.word 0xae10c005  ! 66: OR_R	or 	%r3, %r5, %r23
	.word 0xa808c005  ! 66: AND_R	and 	%r3, %r5, %r20
	.word 0x9e10e399  ! 66: OR_I	or 	%r3, 0x0399, %r15
	.word 0xb201eb9f  ! 66: ADD_I	add 	%r7, 0x0b9f, %r25
	.word 0xa000aa5a  ! 66: ADD_I	add 	%r2, 0x0a5a, %r16
	.word 0xa800a655  ! 66: ADD_I	add 	%r2, 0x0655, %r20
	.word 0xb8008005  ! 66: ADD_R	add 	%r2, %r5, %r28
	.word 0x9c008005  ! 66: ADD_R	add 	%r2, %r5, %r14
	.word 0xa211c005  ! 66: OR_R	or 	%r7, %r5, %r17
	.word 0xa0010005  ! 66: ADD_R	add 	%r4, %r5, %r16
	.word 0xac108005  ! 66: OR_R	or 	%r2, %r5, %r22
	.word 0xa6008005  ! 66: ADD_R	add 	%r2, %r5, %r19
	.word 0xb209ad0b  ! 66: AND_I	and 	%r6, 0x0d0b, %r25
	.word 0xb0110005  ! 66: OR_R	or 	%r4, %r5, %r24
	.word 0xb8098005  ! 66: AND_R	and 	%r6, %r5, %r28
	.word 0x9c01c005  ! 66: ADD_R	add 	%r7, %r5, %r14
	.word 0xbe10e48a  ! 66: OR_I	or 	%r3, 0x048a, %r31
	.word 0xbc11c005  ! 66: OR_R	or 	%r7, %r5, %r30
	.word 0xaa088005  ! 66: AND_R	and 	%r2, %r5, %r21
	.word 0xb808a330  ! 66: AND_I	and 	%r2, 0x0330, %r28
	.word 0xa0110005  ! 66: OR_R	or 	%r4, %r5, %r16
	.word 0xaa008005  ! 66: ADD_R	add 	%r2, %r5, %r21
	.word 0xb600ede1  ! 66: ADD_I	add 	%r3, 0x0de1, %r27
	.word 0xa000c005  ! 66: ADD_R	add 	%r3, %r5, %r16
	.word 0xa4012135  ! 66: ADD_I	add 	%r4, 0x0135, %r18
	.word 0xa4112973  ! 66: OR_I	or 	%r4, 0x0973, %r18
	.word 0xac09e2e0  ! 66: AND_I	and 	%r7, 0x02e0, %r22
	.word 0x9e090005  ! 66: AND_R	and 	%r4, %r5, %r15
	.word 0xac108005  ! 66: OR_R	or 	%r2, %r5, %r22
	.word 0xb611ebda  ! 66: OR_I	or 	%r7, 0x0bda, %r27
	.word 0xb6008005  ! 66: ADD_R	add 	%r2, %r5, %r27
	.word 0x9c00c005  ! 66: ADD_R	add 	%r3, %r5, %r14
	.word 0xbe08c005  ! 66: AND_R	and 	%r3, %r5, %r31
	.word 0xa210e149  ! 66: OR_I	or 	%r3, 0x0149, %r17
	.word 0xb4008005  ! 66: ADD_R	add 	%r2, %r5, %r26
	.word 0x9a090005  ! 66: AND_R	and 	%r4, %r5, %r13
	.word 0xb0088005  ! 66: AND_R	and 	%r2, %r5, %r24
	.word 0xb2090005  ! 66: AND_R	and 	%r4, %r5, %r25
	.word 0x9a09e983  ! 66: AND_I	and 	%r7, 0x0983, %r13
	.word 0xb200eef4  ! 66: ADD_I	add 	%r3, 0x0ef4, %r25
	.word 0x9a11291a  ! 66: OR_I	or 	%r4, 0x091a, %r13
	.word 0xaa008005  ! 66: ADD_R	add 	%r2, %r5, %r21
	.word 0x9e09ed2e  ! 66: AND_I	and 	%r7, 0x0d2e, %r15
	.word 0xb0008005  ! 66: ADD_R	add 	%r2, %r5, %r24
	.word 0xa810a02c  ! 66: OR_I	or 	%r2, 0x002c, %r20
	.word 0x9c00a62c  ! 66: ADD_I	add 	%r2, 0x062c, %r14
	.word 0xa610e0a0  ! 66: OR_I	or 	%r3, 0x00a0, %r19
	.word 0xbe10e2f6  ! 66: OR_I	or 	%r3, 0x02f6, %r31
	.word 0xba09a020  ! 66: AND_I	and 	%r6, 0x0020, %r29
	.word 0xae008005  ! 66: ADD_R	add 	%r2, %r5, %r23
	.word 0xae088005  ! 66: AND_R	and 	%r2, %r5, %r23
	.word 0xa400c005  ! 66: ADD_R	add 	%r3, %r5, %r18
	.word 0xbc00ebe0  ! 66: ADD_I	add 	%r3, 0x0be0, %r30
	.word 0xba1129cb  ! 66: OR_I	or 	%r4, 0x09cb, %r29
	.word 0xb000a19c  ! 66: ADD_I	add 	%r2, 0x019c, %r24
	.word 0xb0118005  ! 66: OR_R	or 	%r6, %r5, %r24
	.word 0xb600a12c  ! 66: ADD_I	add 	%r2, 0x012c, %r27
	.word 0xac110005  ! 66: OR_R	or 	%r4, %r5, %r22
	.word 0x9a118005  ! 66: OR_R	or 	%r6, %r5, %r13
	.word 0xbe10c005  ! 66: OR_R	or 	%r3, %r5, %r31
	.word 0xa011ad3d  ! 66: OR_I	or 	%r6, 0x0d3d, %r16
	.word 0xb800a08a  ! 66: ADD_I	add 	%r2, 0x008a, %r28
	.word 0xb808a055  ! 66: AND_I	and 	%r2, 0x0055, %r28
	.word 0xa009e263  ! 66: AND_I	and 	%r7, 0x0263, %r16
	.word 0xae11ec3f  ! 66: OR_I	or 	%r7, 0x0c3f, %r23
	.word 0xaa11e8c7  ! 66: OR_I	or 	%r7, 0x08c7, %r21
	.word 0x9c00ab7d  ! 66: ADD_I	add 	%r2, 0x0b7d, %r14
	.word 0xaa008005  ! 66: ADD_R	add 	%r2, %r5, %r21
	.word 0xae01a110  ! 66: ADD_I	add 	%r6, 0x0110, %r23
	.word 0xbc110005  ! 66: OR_R	or 	%r4, %r5, %r30
	.word 0x9c09afa1  ! 66: AND_I	and 	%r6, 0x0fa1, %r14
	.word 0xae088005  ! 66: AND_R	and 	%r2, %r5, %r23
	.word 0x9a10abad  ! 66: OR_I	or 	%r2, 0x0bad, %r13
	.word 0xa600ef2b  ! 66: ADD_I	add 	%r3, 0x0f2b, %r19
	.word 0x9e118005  ! 66: OR_R	or 	%r6, %r5, %r15
	.word 0xb611c005  ! 66: OR_R	or 	%r7, %r5, %r27
	.word 0xb811263d  ! 66: OR_I	or 	%r4, 0x063d, %r28
	.word 0xb210e005  ! 66: OR_I	or 	%r3, 0x0005, %r25
	.word 0xb2008005  ! 66: ADD_R	add 	%r2, %r5, %r25
	.word 0xb809e2b7  ! 66: AND_I	and 	%r7, 0x02b7, %r28
	.word 0xb600a56a  ! 66: ADD_I	add 	%r2, 0x056a, %r27
	.word 0x9e08ac4c  ! 66: AND_I	and 	%r2, 0x0c4c, %r15
	.word 0xaa08c005  ! 66: AND_R	and 	%r3, %r5, %r21
	.word 0xa609af1c  ! 66: AND_I	and 	%r6, 0x0f1c, %r19
	.word 0xae108005  ! 66: OR_R	or 	%r2, %r5, %r23
	.word 0xa411ec18  ! 66: OR_I	or 	%r7, 0x0c18, %r18
	.word 0xea21abf0  ! 66: STW_I	stw	%r21, [%r6 + 0x0bf0]
	.word 0xe271e728  ! 66: STX_I	stx	%r17, [%r7 + 0x0728]
	.word 0xda28ae54  ! 66: STB_I	stb	%r13, [%r2 + 0x0e54]
	.word 0xde20eaac  ! 66: STW_I	stw	%r15, [%r3 + 0x0aac]
IRF_CE_32:
!$EV error(0,expr(@VA(.MAIN.IRF_CE_32), 16, 16), 1,IRF,ce,56,x, x,x,x, x,x,x)
!$EV error(0,expr(@VA(.MAIN.IRF_CE_32), 16, 16), 3,IRF,ce,51,x, x,x,x, x,x,x)
	.word 0xe429a891  ! 66: STB_I	stb	%r18, [%r6 + 0x0891]
	.word 0xea20e1ac  ! 66: STW_I	stw	%r21, [%r3 + 0x01ac]
	.word 0xdc2122f4  ! 66: STW_I	stw	%r14, [%r4 + 0x02f4]
	.word 0xf938c005  ! 66: STDF_R	std	%f28, [%r5, %r3]
	.word 0xb6008005  ! 66: ADD_R	add 	%r2, %r5, %r27
	.word 0xb800e290  ! 66: ADD_I	add 	%r3, 0x0290, %r28
	bne thr0_loop_8
	subcc %g1, 0x1, %g1
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr0_loop_9:
	.word 0xae10a341  ! 73: OR_I	or 	%r2, 0x0341, %r23
	.word 0xbc00c005  ! 73: ADD_R	add 	%r3, %r5, %r30
	.word 0xb2008005  ! 73: ADD_R	add 	%r2, %r5, %r25
	.word 0xa609e846  ! 73: AND_I	and 	%r7, 0x0846, %r19
	.word 0x9a10acf0  ! 73: OR_I	or 	%r2, 0x0cf0, %r13
	.word 0xb609e39b  ! 73: AND_I	and 	%r7, 0x039b, %r27
	.word 0xac018005  ! 73: ADD_R	add 	%r6, %r5, %r22
	.word 0xbc11c005  ! 73: OR_R	or 	%r7, %r5, %r30
	.word 0xbc09ec29  ! 73: AND_I	and 	%r7, 0x0c29, %r30
	.word 0xa401ad3f  ! 73: ADD_I	add 	%r6, 0x0d3f, %r18
	.word 0xb209c005  ! 73: AND_R	and 	%r7, %r5, %r25
	.word 0xae09ef6b  ! 73: AND_I	and 	%r7, 0x0f6b, %r23
	.word 0xa0098005  ! 73: AND_R	and 	%r6, %r5, %r16
	.word 0xb0108005  ! 73: OR_R	or 	%r2, %r5, %r24
	.word 0xac08eb35  ! 73: AND_I	and 	%r3, 0x0b35, %r22
	.word 0xa809c005  ! 73: AND_R	and 	%r7, %r5, %r20
	.word 0xae108005  ! 73: OR_R	or 	%r2, %r5, %r23
	.word 0xa808a987  ! 73: AND_I	and 	%r2, 0x0987, %r20
	.word 0xbe108005  ! 73: OR_R	or 	%r2, %r5, %r31
	.word 0xae092c03  ! 73: AND_I	and 	%r4, 0x0c03, %r23
	.word 0xaa00c005  ! 73: ADD_R	add 	%r3, %r5, %r21
	.word 0x9c010005  ! 73: ADD_R	add 	%r4, %r5, %r14
	.word 0xa0092eac  ! 73: AND_I	and 	%r4, 0x0eac, %r16
	.word 0xaa01c005  ! 73: ADD_R	add 	%r7, %r5, %r21
	.word 0xb010ad95  ! 73: OR_I	or 	%r2, 0x0d95, %r24
	.word 0x9e11c005  ! 73: OR_R	or 	%r7, %r5, %r15
	.word 0xa808aedc  ! 73: AND_I	and 	%r2, 0x0edc, %r20
	.word 0xae00a7fd  ! 73: ADD_I	add 	%r2, 0x07fd, %r23
	.word 0xa408c005  ! 73: AND_R	and 	%r3, %r5, %r18
	.word 0xb409af32  ! 73: AND_I	and 	%r6, 0x0f32, %r26
	.word 0xb0110005  ! 73: OR_R	or 	%r4, %r5, %r24
	.word 0x9c108005  ! 73: OR_R	or 	%r2, %r5, %r14
	.word 0x9e00afa4  ! 73: ADD_I	add 	%r2, 0x0fa4, %r15
	.word 0xa008edcc  ! 73: AND_I	and 	%r3, 0x0dcc, %r16
	.word 0xa211c005  ! 73: OR_R	or 	%r7, %r5, %r17
	.word 0xb4088005  ! 73: AND_R	and 	%r2, %r5, %r26
	.word 0xb208ab7a  ! 73: AND_I	and 	%r2, 0x0b7a, %r25
	.word 0x9c110005  ! 73: OR_R	or 	%r4, %r5, %r14
	.word 0xba090005  ! 73: AND_R	and 	%r4, %r5, %r29
	.word 0xb4088005  ! 73: AND_R	and 	%r2, %r5, %r26
	.word 0xa010e068  ! 73: OR_I	or 	%r3, 0x0068, %r16
	.word 0xac0124a9  ! 73: ADD_I	add 	%r4, 0x04a9, %r22
	.word 0xa2112a98  ! 73: OR_I	or 	%r4, 0x0a98, %r17
	.word 0xbc01c005  ! 73: ADD_R	add 	%r7, %r5, %r30
	.word 0xbe09c005  ! 73: AND_R	and 	%r7, %r5, %r31
	.word 0xb6118005  ! 73: OR_R	or 	%r6, %r5, %r27
	.word 0xbe088005  ! 73: AND_R	and 	%r2, %r5, %r31
	.word 0xb801c005  ! 73: ADD_R	add 	%r7, %r5, %r28
	.word 0xae00e60d  ! 73: ADD_I	add 	%r3, 0x060d, %r23
	.word 0x9a008005  ! 73: ADD_R	add 	%r2, %r5, %r13
	.word 0x9a00eeca  ! 73: ADD_I	add 	%r3, 0x0eca, %r13
	.word 0xbc09a11a  ! 73: AND_I	and 	%r6, 0x011a, %r30
	.word 0xb601c005  ! 73: ADD_R	add 	%r7, %r5, %r27
	.word 0xb6008005  ! 73: ADD_R	add 	%r2, %r5, %r27
	.word 0xa6108005  ! 73: OR_R	or 	%r2, %r5, %r19
	.word 0xa010ef5c  ! 73: OR_I	or 	%r3, 0x0f5c, %r16
	.word 0xa4088005  ! 73: AND_R	and 	%r2, %r5, %r18
	.word 0xb6008005  ! 73: ADD_R	add 	%r2, %r5, %r27
	.word 0xac090005  ! 73: AND_R	and 	%r4, %r5, %r22
	.word 0xa210c005  ! 73: OR_R	or 	%r3, %r5, %r17
	.word 0xa8110005  ! 73: OR_R	or 	%r4, %r5, %r20
	.word 0xb400aadc  ! 73: ADD_I	add 	%r2, 0x0adc, %r26
	.word 0xb000c005  ! 73: ADD_R	add 	%r3, %r5, %r24
	.word 0x9e00ab3e  ! 73: ADD_I	add 	%r2, 0x0b3e, %r15
	.word 0xb409c005  ! 73: AND_R	and 	%r7, %r5, %r26
	.word 0xb4110005  ! 73: OR_R	or 	%r4, %r5, %r26
	.word 0xa6092aff  ! 73: AND_I	and 	%r4, 0x0aff, %r19
	.word 0xb2110005  ! 73: OR_R	or 	%r4, %r5, %r25
	.word 0xb0110005  ! 73: OR_R	or 	%r4, %r5, %r24
	.word 0xa6088005  ! 73: AND_R	and 	%r2, %r5, %r19
	.word 0xa601c005  ! 73: ADD_R	add 	%r7, %r5, %r19
	.word 0xa601c005  ! 73: ADD_R	add 	%r7, %r5, %r19
	.word 0xbe01e85d  ! 73: ADD_I	add 	%r7, 0x085d, %r31
	.word 0xaa01c005  ! 73: ADD_R	add 	%r7, %r5, %r21
	.word 0x9c00ab31  ! 73: ADD_I	add 	%r2, 0x0b31, %r14
	.word 0x9e10a816  ! 73: OR_I	or 	%r2, 0x0816, %r15
	.word 0xac08aca6  ! 73: AND_I	and 	%r2, 0x0ca6, %r22
	.word 0xa8088005  ! 73: AND_R	and 	%r2, %r5, %r20
	.word 0xba01ac7b  ! 73: ADD_I	add 	%r6, 0x0c7b, %r29
	.word 0xb600e202  ! 73: ADD_I	add 	%r3, 0x0202, %r27
	.word 0xae00a72e  ! 73: ADD_I	add 	%r2, 0x072e, %r23
	.word 0xa208a332  ! 73: AND_I	and 	%r2, 0x0332, %r17
	.word 0xb2012544  ! 73: ADD_I	add 	%r4, 0x0544, %r25
	.word 0xb208e3c8  ! 73: AND_I	and 	%r3, 0x03c8, %r25
	.word 0xa610c005  ! 73: OR_R	or 	%r3, %r5, %r19
	.word 0xa6008005  ! 73: ADD_R	add 	%r2, %r5, %r19
	.word 0xa6008005  ! 73: ADD_R	add 	%r2, %r5, %r19
	.word 0xae11a2e1  ! 73: OR_I	or 	%r6, 0x02e1, %r23
	.word 0xbe10edc9  ! 73: OR_I	or 	%r3, 0x0dc9, %r31
	.word 0xb400c005  ! 73: ADD_R	add 	%r3, %r5, %r26
	.word 0xba00c005  ! 73: ADD_R	add 	%r3, %r5, %r29
	.word 0x9e090005  ! 73: AND_R	and 	%r4, %r5, %r15
	.word 0xb6092c30  ! 73: AND_I	and 	%r4, 0x0c30, %r27
	.word 0xa6108005  ! 73: OR_R	or 	%r2, %r5, %r19
	.word 0xbe108005  ! 73: OR_R	or 	%r2, %r5, %r31
	.word 0x9c11291e  ! 73: OR_I	or 	%r4, 0x091e, %r14
	.word 0xae012f33  ! 73: ADD_I	add 	%r4, 0x0f33, %r23
	.word 0x9e01224d  ! 73: ADD_I	add 	%r4, 0x024d, %r15
	.word 0xa2092bcf  ! 73: AND_I	and 	%r4, 0x0bcf, %r17
	.word 0xb600e176  ! 73: ADD_I	add 	%r3, 0x0176, %r27
	.word 0x9e1123d5  ! 73: OR_I	or 	%r4, 0x03d5, %r15
	.word 0xa010af01  ! 73: OR_I	or 	%r2, 0x0f01, %r16
	.word 0xa4008005  ! 73: ADD_R	add 	%r2, %r5, %r18
	.word 0xaa01c005  ! 73: ADD_R	add 	%r7, %r5, %r21
	.word 0xb400e211  ! 73: ADD_I	add 	%r3, 0x0211, %r26
	.word 0xac008005  ! 73: ADD_R	add 	%r2, %r5, %r22
	.word 0xac10c005  ! 73: OR_R	or 	%r3, %r5, %r22
	.word 0xae01ea76  ! 73: ADD_I	add 	%r7, 0x0a76, %r23
	.word 0x9a10a516  ! 73: OR_I	or 	%r2, 0x0516, %r13
	.word 0xb8098005  ! 73: AND_R	and 	%r6, %r5, %r28
	.word 0x9c08a519  ! 73: AND_I	and 	%r2, 0x0519, %r14
	.word 0xa4008005  ! 73: ADD_R	add 	%r2, %r5, %r18
	.word 0x9c112eaa  ! 73: OR_I	or 	%r4, 0x0eaa, %r14
	.word 0xa408af25  ! 73: AND_I	and 	%r2, 0x0f25, %r18
	.word 0xa611c005  ! 73: OR_R	or 	%r7, %r5, %r19
	.word 0xb8008005  ! 73: ADD_R	add 	%r2, %r5, %r28
	.word 0xa200a818  ! 73: ADD_I	add 	%r2, 0x0818, %r17
	.word 0xba00a5eb  ! 73: ADD_I	add 	%r2, 0x05eb, %r29
	.word 0xaa11a05c  ! 73: OR_I	or 	%r6, 0x005c, %r21
	.word 0x9c098005  ! 73: AND_R	and 	%r6, %r5, %r14
	.word 0xb200a832  ! 73: ADD_I	add 	%r2, 0x0832, %r25
	.word 0xa010c005  ! 73: OR_R	or 	%r3, %r5, %r16
	.word 0x9e01efb3  ! 73: ADD_I	add 	%r7, 0x0fb3, %r15
	.word 0xb401c005  ! 73: ADD_R	add 	%r7, %r5, %r26
	.word 0xbe11c005  ! 73: OR_R	or 	%r7, %r5, %r31
	.word 0xbe008005  ! 73: ADD_R	add 	%r2, %r5, %r31
	.word 0xb608ea38  ! 73: AND_I	and 	%r3, 0x0a38, %r27
	.word 0xb400aaf5  ! 73: ADD_I	add 	%r2, 0x0af5, %r26
	.word 0xbe008005  ! 73: ADD_R	add 	%r2, %r5, %r31
	.word 0xac01c005  ! 73: ADD_R	add 	%r7, %r5, %r22
	.word 0xbe09eabc  ! 73: AND_I	and 	%r7, 0x0abc, %r31
	.word 0x9c08a679  ! 73: AND_I	and 	%r2, 0x0679, %r14
	.word 0xb201c005  ! 73: ADD_R	add 	%r7, %r5, %r25
	.word 0x9c01c005  ! 73: ADD_R	add 	%r7, %r5, %r14
	.word 0xa6090005  ! 73: AND_R	and 	%r4, %r5, %r19
	.word 0xb401aecc  ! 73: ADD_I	add 	%r6, 0x0ecc, %r26
	.word 0xe820ad34  ! 73: STW_I	stw	%r20, [%r2 + 0x0d34]
	.word 0xe430ebc4  ! 73: STH_I	sth	%r18, [%r3 + 0x0bc4]
	.word 0xfe20a5ac  ! 73: STW_I	stw	%r31, [%r2 + 0x05ac]
	.word 0xe071e118  ! 73: STX_I	stx	%r16, [%r7 + 0x0118]
IRF_CE_36:
!$EV error(0,expr(@VA(.MAIN.IRF_CE_36), 16, 16), 1,IRF,ce,43,x, x,x,x, x,x,x)
!$EV error(0,expr(@VA(.MAIN.IRF_CE_36), 16, 16), 3,IRF,ce,52,x, x,x,x, x,x,x)
	.word 0xda292c95  ! 73: STB_I	stb	%r13, [%r4 + 0x0c95]
	.word 0xea21e158  ! 73: STW_I	stw	%r21, [%r7 + 0x0158]
	.word 0xf871e828  ! 73: STX_I	stx	%r28, [%r7 + 0x0828]
	.word 0xfb218005  ! 73: STF_R	st	%f29, [%r5, %r6]
	.word 0xba108005  ! 73: OR_R	or 	%r2, %r5, %r29
	.word 0xb6098005  ! 73: AND_R	and 	%r6, %r5, %r27
	bne thr0_loop_9
	subcc %g1, 0x1, %g1
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr0_loop_10:
	.word 0xbe088005  ! 80: AND_R	and 	%r2, %r5, %r31
	.word 0x9e10a8f8  ! 80: OR_I	or 	%r2, 0x08f8, %r15
	.word 0xb801e922  ! 80: ADD_I	add 	%r7, 0x0922, %r28
	.word 0xae10a28d  ! 80: OR_I	or 	%r2, 0x028d, %r23
	.word 0xa6088005  ! 80: AND_R	and 	%r2, %r5, %r19
	.word 0xb409aca4  ! 80: AND_I	and 	%r6, 0x0ca4, %r26
	.word 0xbe09ecb3  ! 80: AND_I	and 	%r7, 0x0cb3, %r31
	.word 0xa401ad75  ! 80: ADD_I	add 	%r6, 0x0d75, %r18
	.word 0xa200a8a7  ! 80: ADD_I	add 	%r2, 0x08a7, %r17
	.word 0xb610efed  ! 80: OR_I	or 	%r3, 0x0fed, %r27
	.word 0xb408a338  ! 80: AND_I	and 	%r2, 0x0338, %r26
	.word 0xa808eee3  ! 80: AND_I	and 	%r3, 0x0ee3, %r20
	.word 0x9a01c005  ! 80: ADD_R	add 	%r7, %r5, %r13
	.word 0xa808a2eb  ! 80: AND_I	and 	%r2, 0x02eb, %r20
	.word 0xae00a2b8  ! 80: ADD_I	add 	%r2, 0x02b8, %r23
	.word 0xb010e310  ! 80: OR_I	or 	%r3, 0x0310, %r24
	.word 0xa4112660  ! 80: OR_I	or 	%r4, 0x0660, %r18
	.word 0xbe10ebc7  ! 80: OR_I	or 	%r3, 0x0bc7, %r31
	.word 0xb010c005  ! 80: OR_R	or 	%r3, %r5, %r24
	.word 0xb408a946  ! 80: AND_I	and 	%r2, 0x0946, %r26
	.word 0xba108005  ! 80: OR_R	or 	%r2, %r5, %r29
	.word 0x9e018005  ! 80: ADD_R	add 	%r6, %r5, %r15
	.word 0x9c10c005  ! 80: OR_R	or 	%r3, %r5, %r14
	.word 0xa6118005  ! 80: OR_R	or 	%r6, %r5, %r19
	.word 0xb011ef5c  ! 80: OR_I	or 	%r7, 0x0f5c, %r24
	.word 0xba08aebd  ! 80: AND_I	and 	%r2, 0x0ebd, %r29
	.word 0xba088005  ! 80: AND_R	and 	%r2, %r5, %r29
	.word 0x9e01c005  ! 80: ADD_R	add 	%r7, %r5, %r15
	.word 0xb800a9d2  ! 80: ADD_I	add 	%r2, 0x09d2, %r28
	.word 0xa210c005  ! 80: OR_R	or 	%r3, %r5, %r17
	.word 0xb800a5f4  ! 80: ADD_I	add 	%r2, 0x05f4, %r28
	.word 0xbc09a290  ! 80: AND_I	and 	%r6, 0x0290, %r30
	.word 0xb608c005  ! 80: AND_R	and 	%r3, %r5, %r27
	.word 0xba012b5b  ! 80: ADD_I	add 	%r4, 0x0b5b, %r29
	.word 0xb410e556  ! 80: OR_I	or 	%r3, 0x0556, %r26
	.word 0xa809c005  ! 80: AND_R	and 	%r7, %r5, %r20
	.word 0xb610ab97  ! 80: OR_I	or 	%r2, 0x0b97, %r27
	.word 0xb209e160  ! 80: AND_I	and 	%r7, 0x0160, %r25
	.word 0xb810a23b  ! 80: OR_I	or 	%r2, 0x023b, %r28
	.word 0x9a018005  ! 80: ADD_R	add 	%r6, %r5, %r13
	.word 0xa4112342  ! 80: OR_I	or 	%r4, 0x0342, %r18
	.word 0xae092018  ! 80: AND_I	and 	%r4, 0x0018, %r23
	.word 0xaa108005  ! 80: OR_R	or 	%r2, %r5, %r21
	.word 0xae0122eb  ! 80: ADD_I	add 	%r4, 0x02eb, %r23
	.word 0xaa090005  ! 80: AND_R	and 	%r4, %r5, %r21
	.word 0x9c110005  ! 80: OR_R	or 	%r4, %r5, %r14
	.word 0xaa110005  ! 80: OR_R	or 	%r4, %r5, %r21
	.word 0x9e10c005  ! 80: OR_R	or 	%r3, %r5, %r15
	.word 0xa0098005  ! 80: AND_R	and 	%r6, %r5, %r16
	.word 0xa000af47  ! 80: ADD_I	add 	%r2, 0x0f47, %r16
	.word 0x9a110005  ! 80: OR_R	or 	%r4, %r5, %r13
	.word 0xa209ebbc  ! 80: AND_I	and 	%r7, 0x0bbc, %r17
	.word 0xa0108005  ! 80: OR_R	or 	%r2, %r5, %r16
	.word 0xb400afc5  ! 80: ADD_I	add 	%r2, 0x0fc5, %r26
	.word 0xb410afef  ! 80: OR_I	or 	%r2, 0x0fef, %r26
	.word 0xb411c005  ! 80: OR_R	or 	%r7, %r5, %r26
	.word 0x9a090005  ! 80: AND_R	and 	%r4, %r5, %r13
	.word 0xac01e646  ! 80: ADD_I	add 	%r7, 0x0646, %r22
	.word 0xb609abf3  ! 80: AND_I	and 	%r6, 0x0bf3, %r27
	.word 0xa000e61e  ! 80: ADD_I	add 	%r3, 0x061e, %r16
	.word 0xa00129ed  ! 80: ADD_I	add 	%r4, 0x09ed, %r16
	.word 0x9e012118  ! 80: ADD_I	add 	%r4, 0x0118, %r15
	.word 0xbc01a423  ! 80: ADD_I	add 	%r6, 0x0423, %r30
	.word 0xb211c005  ! 80: OR_R	or 	%r7, %r5, %r25
	.word 0xb410c005  ! 80: OR_R	or 	%r3, %r5, %r26
	.word 0x9e118005  ! 80: OR_R	or 	%r6, %r5, %r15
	.word 0xae090005  ! 80: AND_R	and 	%r4, %r5, %r23
	.word 0x9e11c005  ! 80: OR_R	or 	%r7, %r5, %r15
	.word 0xbc00e172  ! 80: ADD_I	add 	%r3, 0x0172, %r30
	.word 0x9e088005  ! 80: AND_R	and 	%r2, %r5, %r15
	.word 0xb808a542  ! 80: AND_I	and 	%r2, 0x0542, %r28
	.word 0xa611e747  ! 80: OR_I	or 	%r7, 0x0747, %r19
	.word 0xa011c005  ! 80: OR_R	or 	%r7, %r5, %r16
	.word 0xa000a2e7  ! 80: ADD_I	add 	%r2, 0x02e7, %r16
	.word 0xa8108005  ! 80: OR_R	or 	%r2, %r5, %r20
	.word 0xac108005  ! 80: OR_R	or 	%r2, %r5, %r22
	.word 0xa2018005  ! 80: ADD_R	add 	%r6, %r5, %r17
	.word 0xae00e73f  ! 80: ADD_I	add 	%r3, 0x073f, %r23
	.word 0xba110005  ! 80: OR_R	or 	%r4, %r5, %r29
	.word 0x9c08a1b0  ! 80: AND_I	and 	%r2, 0x01b0, %r14
	.word 0xa809a21d  ! 80: AND_I	and 	%r6, 0x021d, %r20
	.word 0xa2112be6  ! 80: OR_I	or 	%r4, 0x0be6, %r17
	.word 0xb4088005  ! 80: AND_R	and 	%r2, %r5, %r26
	.word 0x9c0121e4  ! 80: ADD_I	add 	%r4, 0x01e4, %r14
	.word 0xba10e670  ! 80: OR_I	or 	%r3, 0x0670, %r29
	.word 0xb4008005  ! 80: ADD_R	add 	%r2, %r5, %r26
	.word 0xb610a3d7  ! 80: OR_I	or 	%r2, 0x03d7, %r27
	.word 0xa410ed8a  ! 80: OR_I	or 	%r3, 0x0d8a, %r18
	.word 0xb010ece8  ! 80: OR_I	or 	%r3, 0x0ce8, %r24
	.word 0xb009c005  ! 80: AND_R	and 	%r7, %r5, %r24
	.word 0xac00a3de  ! 80: ADD_I	add 	%r2, 0x03de, %r22
	.word 0x9c00c005  ! 80: ADD_R	add 	%r3, %r5, %r14
	.word 0x9c088005  ! 80: AND_R	and 	%r2, %r5, %r14
	.word 0x9a08eb28  ! 80: AND_I	and 	%r3, 0x0b28, %r13
	.word 0xb609ed85  ! 80: AND_I	and 	%r7, 0x0d85, %r27
	.word 0xb2108005  ! 80: OR_R	or 	%r2, %r5, %r25
	.word 0x9a08e1bf  ! 80: AND_I	and 	%r3, 0x01bf, %r13
	.word 0xa00121da  ! 80: ADD_I	add 	%r4, 0x01da, %r16
	.word 0xa400a7f8  ! 80: ADD_I	add 	%r2, 0x07f8, %r18
	.word 0xb6012bde  ! 80: ADD_I	add 	%r4, 0x0bde, %r27
	.word 0xa6110005  ! 80: OR_R	or 	%r4, %r5, %r19
	.word 0xba08a57e  ! 80: AND_I	and 	%r2, 0x057e, %r29
	.word 0xbe01c005  ! 80: ADD_R	add 	%r7, %r5, %r31
	.word 0x9a08edaf  ! 80: AND_I	and 	%r3, 0x0daf, %r13
	.word 0xa4018005  ! 80: ADD_R	add 	%r6, %r5, %r18
	.word 0xa2118005  ! 80: OR_R	or 	%r6, %r5, %r17
	.word 0x9c108005  ! 80: OR_R	or 	%r2, %r5, %r14
	.word 0xba008005  ! 80: ADD_R	add 	%r2, %r5, %r29
	.word 0xac008005  ! 80: ADD_R	add 	%r2, %r5, %r22
	.word 0xa008abfe  ! 80: AND_I	and 	%r2, 0x0bfe, %r16
	.word 0x9a118005  ! 80: OR_R	or 	%r6, %r5, %r13
	.word 0xb208c005  ! 80: AND_R	and 	%r3, %r5, %r25
	.word 0xac108005  ! 80: OR_R	or 	%r2, %r5, %r22
	.word 0xbe018005  ! 80: ADD_R	add 	%r6, %r5, %r31
	.word 0xbc010005  ! 80: ADD_R	add 	%r4, %r5, %r30
	.word 0xac118005  ! 80: OR_R	or 	%r6, %r5, %r22
	.word 0xb0110005  ! 80: OR_R	or 	%r4, %r5, %r24
	.word 0xac088005  ! 80: AND_R	and 	%r2, %r5, %r22
	.word 0xa808a86f  ! 80: AND_I	and 	%r2, 0x086f, %r20
	.word 0xa410ea42  ! 80: OR_I	or 	%r3, 0x0a42, %r18
	.word 0xa2010005  ! 80: ADD_R	add 	%r4, %r5, %r17
	.word 0xac11afc7  ! 80: OR_I	or 	%r6, 0x0fc7, %r22
	.word 0xa4118005  ! 80: OR_R	or 	%r6, %r5, %r18
	.word 0x9e0924e8  ! 80: AND_I	and 	%r4, 0x04e8, %r15
	.word 0x9e10a138  ! 80: OR_I	or 	%r2, 0x0138, %r15
	.word 0xbe112fb3  ! 80: OR_I	or 	%r4, 0x0fb3, %r31
	.word 0x9e008005  ! 80: ADD_R	add 	%r2, %r5, %r15
	.word 0x9e01a366  ! 80: ADD_I	add 	%r6, 0x0366, %r15
	.word 0xae088005  ! 80: AND_R	and 	%r2, %r5, %r23
	.word 0xaa098005  ! 80: AND_R	and 	%r6, %r5, %r21
	.word 0xb009ae27  ! 80: AND_I	and 	%r6, 0x0e27, %r24
	.word 0x9c09e86e  ! 80: AND_I	and 	%r7, 0x086e, %r14
	.word 0xbe108005  ! 80: OR_R	or 	%r2, %r5, %r31
	.word 0xaa08adc0  ! 80: AND_I	and 	%r2, 0x0dc0, %r21
	.word 0xb409c005  ! 80: AND_R	and 	%r7, %r5, %r26
	.word 0xac008005  ! 80: ADD_R	add 	%r2, %r5, %r22
	.word 0xa6088005  ! 80: AND_R	and 	%r2, %r5, %r19
	.word 0x9e09a075  ! 80: AND_I	and 	%r6, 0x0075, %r15
	.word 0xba11a020  ! 80: OR_I	or 	%r6, 0x0020, %r29
	.word 0x9c098005  ! 80: AND_R	and 	%r6, %r5, %r14
	.word 0xa211a812  ! 80: OR_I	or 	%r6, 0x0812, %r17
	.word 0x9c110005  ! 80: OR_R	or 	%r4, %r5, %r14
	.word 0xa2088005  ! 80: AND_R	and 	%r2, %r5, %r17
	.word 0x9e10aa5f  ! 80: OR_I	or 	%r2, 0x0a5f, %r15
	.word 0xb6110005  ! 80: OR_R	or 	%r4, %r5, %r27
	.word 0x9c010005  ! 80: ADD_R	add 	%r4, %r5, %r14
	.word 0xa800c005  ! 80: ADD_R	add 	%r3, %r5, %r20
	.word 0xb4118005  ! 80: OR_R	or 	%r6, %r5, %r26
	.word 0x9c098005  ! 80: AND_R	and 	%r6, %r5, %r14
	.word 0xae08a084  ! 80: AND_I	and 	%r2, 0x0084, %r23
	.word 0xae08a042  ! 80: AND_I	and 	%r2, 0x0042, %r23
	.word 0xa011a572  ! 80: OR_I	or 	%r6, 0x0572, %r16
	.word 0xe220ab74  ! 80: STW_I	stw	%r17, [%r2 + 0x0b74]
	.word 0xda70e5d0  ! 80: STX_I	stx	%r13, [%r3 + 0x05d0]
	.word 0xee29ec3f  ! 80: STB_I	stb	%r23, [%r7 + 0x0c3f]
	.word 0xdc31e79a  ! 80: STH_I	sth	%r14, [%r7 + 0x079a]
IRF_CE_40:
!$EV error(0,expr(@VA(.MAIN.IRF_CE_40), 16, 16), 1,IRF,ce,42,x, x,x,x, x,x,x)
!$EV error(0,expr(@VA(.MAIN.IRF_CE_40), 16, 16), 3,IRF,ce,61,x, x,x,x, x,x,x)
	.word 0xf821ece8  ! 80: STW_I	stw	%r28, [%r7 + 0x0ce8]
	.word 0xee71e660  ! 80: STX_I	stx	%r23, [%r7 + 0x0660]
	.word 0xe271ee78  ! 80: STX_I	stx	%r17, [%r7 + 0x0e78]
	.word 0xfe78c005  ! 80: SWAP_R	swap	%r31, [%r3 + %r5]
	.word 0x9e00e4a0  ! 80: ADD_I	add 	%r3, 0x04a0, %r15
	.word 0xa8018005  ! 80: ADD_R	add 	%r6, %r5, %r20
	bne thr0_loop_10
	subcc %g1, 0x1, %g1
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr0_loop_11:
	.word 0xbe09c005  ! 88: AND_R	and 	%r7, %r5, %r31
	.word 0xa400a6d8  ! 88: ADD_I	add 	%r2, 0x06d8, %r18
	.word 0xa8098005  ! 88: AND_R	and 	%r6, %r5, %r20
	.word 0xbc10e81c  ! 88: OR_I	or 	%r3, 0x081c, %r30
	.word 0xa009acdf  ! 88: AND_I	and 	%r6, 0x0cdf, %r16
	.word 0xb800c005  ! 88: ADD_R	add 	%r3, %r5, %r28
	.word 0xb411e00b  ! 88: OR_I	or 	%r7, 0x000b, %r26
	.word 0xbc09c005  ! 88: AND_R	and 	%r7, %r5, %r30
	.word 0x9e01e6c7  ! 88: ADD_I	add 	%r7, 0x06c7, %r15
	.word 0xa609a292  ! 88: AND_I	and 	%r6, 0x0292, %r19
	.word 0xae088005  ! 88: AND_R	and 	%r2, %r5, %r23
	.word 0xb4008005  ! 88: ADD_R	add 	%r2, %r5, %r26
	.word 0xbc01ef7b  ! 88: ADD_I	add 	%r7, 0x0f7b, %r30
	.word 0xb008c005  ! 88: AND_R	and 	%r3, %r5, %r24
	.word 0xa4018005  ! 88: ADD_R	add 	%r6, %r5, %r18
	.word 0x9c10a279  ! 88: OR_I	or 	%r2, 0x0279, %r14
	.word 0xa6090005  ! 88: AND_R	and 	%r4, %r5, %r19
	.word 0xb009efd2  ! 88: AND_I	and 	%r7, 0x0fd2, %r24
	.word 0xbc11eaaf  ! 88: OR_I	or 	%r7, 0x0aaf, %r30
	.word 0xba010005  ! 88: ADD_R	add 	%r4, %r5, %r29
	.word 0xa8018005  ! 88: ADD_R	add 	%r6, %r5, %r20
	.word 0x9e09e774  ! 88: AND_I	and 	%r7, 0x0774, %r15
	.word 0xaa00aee7  ! 88: ADD_I	add 	%r2, 0x0ee7, %r21
	.word 0xb200ad28  ! 88: ADD_I	add 	%r2, 0x0d28, %r25
	.word 0xa0008005  ! 88: ADD_R	add 	%r2, %r5, %r16
	.word 0x9e110005  ! 88: OR_R	or 	%r4, %r5, %r15
	.word 0x9e098005  ! 88: AND_R	and 	%r6, %r5, %r15
	.word 0xaa092bff  ! 88: AND_I	and 	%r4, 0x0bff, %r21
	.word 0xa010abfa  ! 88: OR_I	or 	%r2, 0x0bfa, %r16
	.word 0xa211ad69  ! 88: OR_I	or 	%r6, 0x0d69, %r17
	.word 0xa611aba0  ! 88: OR_I	or 	%r6, 0x0ba0, %r19
	.word 0x9a10c005  ! 88: OR_R	or 	%r3, %r5, %r13
	.word 0xb000e022  ! 88: ADD_I	add 	%r3, 0x0022, %r24
	.word 0xa610adcc  ! 88: OR_I	or 	%r2, 0x0dcc, %r19
	.word 0xa400acc0  ! 88: ADD_I	add 	%r2, 0x0cc0, %r18
	.word 0x9a10a0a2  ! 88: OR_I	or 	%r2, 0x00a2, %r13
	.word 0xb0110005  ! 88: OR_R	or 	%r4, %r5, %r24
	.word 0xbc088005  ! 88: AND_R	and 	%r2, %r5, %r30
	.word 0xb40120ac  ! 88: ADD_I	add 	%r4, 0x00ac, %r26
	.word 0xac09e7dd  ! 88: AND_I	and 	%r7, 0x07dd, %r22
	.word 0xb601c005  ! 88: ADD_R	add 	%r7, %r5, %r27
	.word 0xa810c005  ! 88: OR_R	or 	%r3, %r5, %r20
	.word 0xb811e98f  ! 88: OR_I	or 	%r7, 0x098f, %r28
	.word 0xa210ef5a  ! 88: OR_I	or 	%r3, 0x0f5a, %r17
	.word 0xb601e274  ! 88: ADD_I	add 	%r7, 0x0274, %r27
	.word 0xba1125f8  ! 88: OR_I	or 	%r4, 0x05f8, %r29
	.word 0xb808ad89  ! 88: AND_I	and 	%r2, 0x0d89, %r28
	.word 0x9a108005  ! 88: OR_R	or 	%r2, %r5, %r13
	.word 0xa2088005  ! 88: AND_R	and 	%r2, %r5, %r17
	.word 0xac012384  ! 88: ADD_I	add 	%r4, 0x0384, %r22
	.word 0xb600acc6  ! 88: ADD_I	add 	%r2, 0x0cc6, %r27
	.word 0xb2112e42  ! 88: OR_I	or 	%r4, 0x0e42, %r25
	.word 0x9c110005  ! 88: OR_R	or 	%r4, %r5, %r14
	.word 0xa810a2b2  ! 88: OR_I	or 	%r2, 0x02b2, %r20
	.word 0xb011c005  ! 88: OR_R	or 	%r7, %r5, %r24
	.word 0xaa10ae49  ! 88: OR_I	or 	%r2, 0x0e49, %r21
	.word 0xb411c005  ! 88: OR_R	or 	%r7, %r5, %r26
	.word 0xba08a330  ! 88: AND_I	and 	%r2, 0x0330, %r29
	.word 0xbc08c005  ! 88: AND_R	and 	%r3, %r5, %r30
	.word 0xae092dcf  ! 88: AND_I	and 	%r4, 0x0dcf, %r23
	.word 0xaa088005  ! 88: AND_R	and 	%r2, %r5, %r21
	.word 0xaa098005  ! 88: AND_R	and 	%r6, %r5, %r21
	.word 0xaa09c005  ! 88: AND_R	and 	%r7, %r5, %r21
	.word 0xa010a7fb  ! 88: OR_I	or 	%r2, 0x07fb, %r16
	.word 0xac090005  ! 88: AND_R	and 	%r4, %r5, %r22
	.word 0xa008a6b9  ! 88: AND_I	and 	%r2, 0x06b9, %r16
	.word 0xba11efd5  ! 88: OR_I	or 	%r7, 0x0fd5, %r29
	.word 0xb609a073  ! 88: AND_I	and 	%r6, 0x0073, %r27
	.word 0x9c11250d  ! 88: OR_I	or 	%r4, 0x050d, %r14
	.word 0x9c10c005  ! 88: OR_R	or 	%r3, %r5, %r14
	.word 0xb409c005  ! 88: AND_R	and 	%r7, %r5, %r26
	.word 0xae09a9ab  ! 88: AND_I	and 	%r6, 0x09ab, %r23
	.word 0xb800a325  ! 88: ADD_I	add 	%r2, 0x0325, %r28
	.word 0xbe01ae63  ! 88: ADD_I	add 	%r6, 0x0e63, %r31
	.word 0xb6088005  ! 88: AND_R	and 	%r2, %r5, %r27
	.word 0xa210a861  ! 88: OR_I	or 	%r2, 0x0861, %r17
	.word 0xba01a1de  ! 88: ADD_I	add 	%r6, 0x01de, %r29
	.word 0xaa00a611  ! 88: ADD_I	add 	%r2, 0x0611, %r21
	.word 0xa601acef  ! 88: ADD_I	add 	%r6, 0x0cef, %r19
	.word 0x9a008005  ! 88: ADD_R	add 	%r2, %r5, %r13
	.word 0xa401c005  ! 88: ADD_R	add 	%r7, %r5, %r18
	.word 0xac10a2b4  ! 88: OR_I	or 	%r2, 0x02b4, %r22
	.word 0xbc11eeaa  ! 88: OR_I	or 	%r7, 0x0eaa, %r30
	.word 0xba098005  ! 88: AND_R	and 	%r6, %r5, %r29
	.word 0xb4088005  ! 88: AND_R	and 	%r2, %r5, %r26
	.word 0x9c10c005  ! 88: OR_R	or 	%r3, %r5, %r14
	.word 0xa811e2e6  ! 88: OR_I	or 	%r7, 0x02e6, %r20
	.word 0xb801e58d  ! 88: ADD_I	add 	%r7, 0x058d, %r28
	.word 0x9a08ef7a  ! 88: AND_I	and 	%r3, 0x0f7a, %r13
	.word 0xac11c005  ! 88: OR_R	or 	%r7, %r5, %r22
	.word 0xb009a03d  ! 88: AND_I	and 	%r6, 0x003d, %r24
	.word 0xa200a83d  ! 88: ADD_I	add 	%r2, 0x083d, %r17
	.word 0xa6088005  ! 88: AND_R	and 	%r2, %r5, %r19
	.word 0xb409af5e  ! 88: AND_I	and 	%r6, 0x0f5e, %r26
	.word 0xac08a4d7  ! 88: AND_I	and 	%r2, 0x04d7, %r22
	.word 0xb600a50d  ! 88: ADD_I	add 	%r2, 0x050d, %r27
	.word 0x9e08ed1a  ! 88: AND_I	and 	%r3, 0x0d1a, %r15
	.word 0xb00924b9  ! 88: AND_I	and 	%r4, 0x04b9, %r24
	.word 0xa8118005  ! 88: OR_R	or 	%r6, %r5, %r20
	.word 0xbe10c005  ! 88: OR_R	or 	%r3, %r5, %r31
	.word 0xb600e35f  ! 88: ADD_I	add 	%r3, 0x035f, %r27
	.word 0xb400c005  ! 88: ADD_R	add 	%r3, %r5, %r26
	.word 0xa208a2c9  ! 88: AND_I	and 	%r2, 0x02c9, %r17
	.word 0xae118005  ! 88: OR_R	or 	%r6, %r5, %r23
	.word 0xba10a645  ! 88: OR_I	or 	%r2, 0x0645, %r29
	.word 0xac09c005  ! 88: AND_R	and 	%r7, %r5, %r22
	.word 0xbe112492  ! 88: OR_I	or 	%r4, 0x0492, %r31
	.word 0xa411c005  ! 88: OR_R	or 	%r7, %r5, %r18
	.word 0xb001e6e3  ! 88: ADD_I	add 	%r7, 0x06e3, %r24
	.word 0xb209c005  ! 88: AND_R	and 	%r7, %r5, %r25
	.word 0x9e088005  ! 88: AND_R	and 	%r2, %r5, %r15
	.word 0x9a10a2cb  ! 88: OR_I	or 	%r2, 0x02cb, %r13
	.word 0xa209ef65  ! 88: AND_I	and 	%r7, 0x0f65, %r17
	.word 0x9e092ec5  ! 88: AND_I	and 	%r4, 0x0ec5, %r15
	.word 0xa600c005  ! 88: ADD_R	add 	%r3, %r5, %r19
	.word 0xa6008005  ! 88: ADD_R	add 	%r2, %r5, %r19
	.word 0xae08ad3e  ! 88: AND_I	and 	%r2, 0x0d3e, %r23
	.word 0xb011c005  ! 88: OR_R	or 	%r7, %r5, %r24
	.word 0xb009e59d  ! 88: AND_I	and 	%r7, 0x059d, %r24
	.word 0xae10ed5a  ! 88: OR_I	or 	%r3, 0x0d5a, %r23
	.word 0xaa09ece4  ! 88: AND_I	and 	%r7, 0x0ce4, %r21
	.word 0xb808e6be  ! 88: AND_I	and 	%r3, 0x06be, %r28
	.word 0xae118005  ! 88: OR_R	or 	%r6, %r5, %r23
	.word 0xb010c005  ! 88: OR_R	or 	%r3, %r5, %r24
	.word 0x9a008005  ! 88: ADD_R	add 	%r2, %r5, %r13
	.word 0xbc108005  ! 88: OR_R	or 	%r2, %r5, %r30
	.word 0xbe08a4ea  ! 88: AND_I	and 	%r2, 0x04ea, %r31
	.word 0xbe09ab2c  ! 88: AND_I	and 	%r6, 0x0b2c, %r31
	.word 0xba10a090  ! 88: OR_I	or 	%r2, 0x0090, %r29
	.word 0xba00c005  ! 88: ADD_R	add 	%r3, %r5, %r29
	.word 0xac00a19d  ! 88: ADD_I	add 	%r2, 0x019d, %r22
	.word 0xa8118005  ! 88: OR_R	or 	%r6, %r5, %r20
	.word 0x9a090005  ! 88: AND_R	and 	%r4, %r5, %r13
	.word 0xa809c005  ! 88: AND_R	and 	%r7, %r5, %r20
	.word 0xb4108005  ! 88: OR_R	or 	%r2, %r5, %r26
	.word 0xb601272f  ! 88: ADD_I	add 	%r4, 0x072f, %r27
	.word 0xa6098005  ! 88: AND_R	and 	%r6, %r5, %r19
	.word 0xae088005  ! 88: AND_R	and 	%r2, %r5, %r23
	.word 0xbc108005  ! 88: OR_R	or 	%r2, %r5, %r30
	.word 0x9a098005  ! 88: AND_R	and 	%r6, %r5, %r13
	.word 0xbe088005  ! 88: AND_R	and 	%r2, %r5, %r31
	.word 0xb40925b0  ! 88: AND_I	and 	%r4, 0x05b0, %r26
	.word 0xba018005  ! 88: ADD_R	add 	%r6, %r5, %r29
	.word 0xa0118005  ! 88: OR_R	or 	%r6, %r5, %r16
	.word 0x9e008005  ! 88: ADD_R	add 	%r2, %r5, %r15
	.word 0x9c08ae2a  ! 88: AND_I	and 	%r2, 0x0e2a, %r14
	.word 0xb0018005  ! 88: ADD_R	add 	%r6, %r5, %r24
	.word 0xb2108005  ! 88: OR_R	or 	%r2, %r5, %r25
	.word 0x9e08c005  ! 88: AND_R	and 	%r3, %r5, %r15
	.word 0xb4088005  ! 88: AND_R	and 	%r2, %r5, %r26
	.word 0xb2088005  ! 88: AND_R	and 	%r2, %r5, %r25
	.word 0x9a118005  ! 88: OR_R	or 	%r6, %r5, %r13
	.word 0x9e10e945  ! 88: OR_I	or 	%r3, 0x0945, %r15
	.word 0xb010ae16  ! 88: OR_I	or 	%r2, 0x0e16, %r24
	.word 0xa8108005  ! 88: OR_R	or 	%r2, %r5, %r20
	.word 0x9e0122d1  ! 88: ADD_I	add 	%r4, 0x02d1, %r15
	.word 0xa8090005  ! 88: AND_R	and 	%r4, %r5, %r20
	.word 0x9c08e9f5  ! 88: AND_I	and 	%r3, 0x09f5, %r14
	.word 0xa6088005  ! 88: AND_R	and 	%r2, %r5, %r19
	.word 0xbc09c005  ! 88: AND_R	and 	%r7, %r5, %r30
	.word 0xa611c005  ! 88: OR_R	or 	%r7, %r5, %r19
	.word 0xb611c005  ! 88: OR_R	or 	%r7, %r5, %r27
	.word 0x9e11a6ed  ! 88: OR_I	or 	%r6, 0x06ed, %r15
	.word 0x9c10a649  ! 88: OR_I	or 	%r2, 0x0649, %r14
	.word 0xa2090005  ! 88: AND_R	and 	%r4, %r5, %r17
	.word 0xb2018005  ! 88: ADD_R	add 	%r6, %r5, %r25
	.word 0xac008005  ! 88: ADD_R	add 	%r2, %r5, %r22
	.word 0xb008ab81  ! 88: AND_I	and 	%r2, 0x0b81, %r24
	.word 0xb6112caa  ! 88: OR_I	or 	%r4, 0x0caa, %r27
	.word 0x9c09a80c  ! 88: AND_I	and 	%r6, 0x080c, %r14
	.word 0xac11a90d  ! 88: OR_I	or 	%r6, 0x090d, %r22
	.word 0xac09ef17  ! 88: AND_I	and 	%r7, 0x0f17, %r22
	.word 0xb409a447  ! 88: AND_I	and 	%r6, 0x0447, %r26
	.word 0xb611ef9a  ! 88: OR_I	or 	%r7, 0x0f9a, %r27
	.word 0xbe09e808  ! 88: AND_I	and 	%r7, 0x0808, %r31
	.word 0xbc018005  ! 88: ADD_R	add 	%r6, %r5, %r30
	.word 0xba11c005  ! 88: OR_R	or 	%r7, %r5, %r29
	.word 0xb001c005  ! 88: ADD_R	add 	%r7, %r5, %r24
	.word 0xa0108005  ! 88: OR_R	or 	%r2, %r5, %r16
	.word 0xb608a583  ! 88: AND_I	and 	%r2, 0x0583, %r27
	.word 0xbe08c005  ! 88: AND_R	and 	%r3, %r5, %r31
	.word 0xb809c005  ! 88: AND_R	and 	%r7, %r5, %r28
	.word 0xba110005  ! 88: OR_R	or 	%r4, %r5, %r29
	.word 0xaa10ef7b  ! 88: OR_I	or 	%r3, 0x0f7b, %r21
	.word 0xdc20ad54  ! 88: STW_I	stw	%r14, [%r2 + 0x0d54]
	.word 0xf070ae00  ! 88: STX_I	stx	%r24, [%r2 + 0x0e00]
	.word 0xe0292c4d  ! 88: STB_I	stb	%r16, [%r4 + 0x0c4d]
	.word 0xe028ac8a  ! 88: STB_I	stb	%r16, [%r2 + 0x0c8a]
IRF_CE_44:
!$EV error(0,expr(@VA(.MAIN.IRF_CE_44), 16, 16), 1,IRF,ce,9,x, x,x,x, x,x,x)
!$EV error(0,expr(@VA(.MAIN.IRF_CE_44), 16, 16), 3,IRF,ce,38,x, x,x,x, x,x,x)
	.word 0xde31a648  ! 88: STH_I	sth	%r15, [%r6 + 0x0648]
	.word 0xf070aa98  ! 88: STX_I	stx	%r24, [%r2 + 0x0a98]
	.word 0xec7123e0  ! 88: STX_I	stx	%r22, [%r4 + 0x03e0]
	.word 0xd6f24cea  ! 88: STXA_R	stxa	%r11, [%r9 + %r10] 0x67
	.word 0xb211aaf8  ! 88: OR_I	or 	%r6, 0x0af8, %r25
	.word 0x9c010005  ! 88: ADD_R	add 	%r4, %r5, %r14
	bne thr0_loop_11
	subcc %g1, 0x1, %g1
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr0_loop_12:
	.word 0xa210ae43  ! 95: OR_I	or 	%r2, 0x0e43, %r17
	.word 0xa6118005  ! 95: OR_R	or 	%r6, %r5, %r19
	.word 0xbe090005  ! 95: AND_R	and 	%r4, %r5, %r31
	.word 0xac008005  ! 95: ADD_R	add 	%r2, %r5, %r22
	.word 0x9c108005  ! 95: OR_R	or 	%r2, %r5, %r14
	.word 0xbe118005  ! 95: OR_R	or 	%r6, %r5, %r31
	.word 0x9a098005  ! 95: AND_R	and 	%r6, %r5, %r13
	.word 0x9c10c005  ! 95: OR_R	or 	%r3, %r5, %r14
	.word 0xa609ab8d  ! 95: AND_I	and 	%r6, 0x0b8d, %r19
	.word 0xa210ac8e  ! 95: OR_I	or 	%r2, 0x0c8e, %r17
	.word 0x9a00c005  ! 95: ADD_R	add 	%r3, %r5, %r13
	.word 0xb008aad6  ! 95: AND_I	and 	%r2, 0x0ad6, %r24
	.word 0xaa010005  ! 95: ADD_R	add 	%r4, %r5, %r21
	.word 0xae09c005  ! 95: AND_R	and 	%r7, %r5, %r23
	.word 0xb4098005  ! 95: AND_R	and 	%r6, %r5, %r26
	.word 0xa2012103  ! 95: ADD_I	add 	%r4, 0x0103, %r17
	.word 0xb4088005  ! 95: AND_R	and 	%r2, %r5, %r26
	.word 0xb8018005  ! 95: ADD_R	add 	%r6, %r5, %r28
	.word 0xb8090005  ! 95: AND_R	and 	%r4, %r5, %r28
	.word 0xb4088005  ! 95: AND_R	and 	%r2, %r5, %r26
	.word 0xa200a4d7  ! 95: ADD_I	add 	%r2, 0x04d7, %r17
	.word 0xb409afc1  ! 95: AND_I	and 	%r6, 0x0fc1, %r26
	.word 0xa2008005  ! 95: ADD_R	add 	%r2, %r5, %r17
	.word 0xa2008005  ! 95: ADD_R	add 	%r2, %r5, %r17
	.word 0xb211202e  ! 95: OR_I	or 	%r4, 0x002e, %r25
	.word 0xa809ac30  ! 95: AND_I	and 	%r6, 0x0c30, %r20
	.word 0xb608ea1f  ! 95: AND_I	and 	%r3, 0x0a1f, %r27
	.word 0xae08a7d8  ! 95: AND_I	and 	%r2, 0x07d8, %r23
	.word 0xb811c005  ! 95: OR_R	or 	%r7, %r5, %r28
	.word 0xba112873  ! 95: OR_I	or 	%r4, 0x0873, %r29
	.word 0x9e008005  ! 95: ADD_R	add 	%r2, %r5, %r15
	.word 0xba08ec3c  ! 95: AND_I	and 	%r3, 0x0c3c, %r29
	.word 0xac092238  ! 95: AND_I	and 	%r4, 0x0238, %r22
	.word 0xbc09e068  ! 95: AND_I	and 	%r7, 0x0068, %r30
	.word 0x9e11ec2f  ! 95: OR_I	or 	%r7, 0x0c2f, %r15
	.word 0x9e01c005  ! 95: ADD_R	add 	%r7, %r5, %r15
	.word 0xa001c005  ! 95: ADD_R	add 	%r7, %r5, %r16
	.word 0x9a01242a  ! 95: ADD_I	add 	%r4, 0x042a, %r13
	.word 0xac098005  ! 95: AND_R	and 	%r6, %r5, %r22
	.word 0xbc00a0db  ! 95: ADD_I	add 	%r2, 0x00db, %r30
	.word 0xa609e8b1  ! 95: AND_I	and 	%r7, 0x08b1, %r19
	.word 0x9a008005  ! 95: ADD_R	add 	%r2, %r5, %r13
	.word 0xa411c005  ! 95: OR_R	or 	%r7, %r5, %r18
	.word 0xba008005  ! 95: ADD_R	add 	%r2, %r5, %r29
	.word 0xbc112fc2  ! 95: OR_I	or 	%r4, 0x0fc2, %r30
	.word 0xaa00c005  ! 95: ADD_R	add 	%r3, %r5, %r21
	.word 0xa6018005  ! 95: ADD_R	add 	%r6, %r5, %r19
	.word 0xae0927bb  ! 95: AND_I	and 	%r4, 0x07bb, %r23
	.word 0xa209c005  ! 95: AND_R	and 	%r7, %r5, %r17
	.word 0xbc098005  ! 95: AND_R	and 	%r6, %r5, %r30
	.word 0xaa08e6eb  ! 95: AND_I	and 	%r3, 0x06eb, %r21
	.word 0xb8010005  ! 95: ADD_R	add 	%r4, %r5, %r28
	.word 0xac00aeb3  ! 95: ADD_I	add 	%r2, 0x0eb3, %r22
	.word 0xb20120db  ! 95: ADD_I	add 	%r4, 0x00db, %r25
	.word 0xb4108005  ! 95: OR_R	or 	%r2, %r5, %r26
	.word 0x9e01c005  ! 95: ADD_R	add 	%r7, %r5, %r15
	.word 0xa611c005  ! 95: OR_R	or 	%r7, %r5, %r19
	.word 0xa010c005  ! 95: OR_R	or 	%r3, %r5, %r16
	.word 0xa411c005  ! 95: OR_R	or 	%r7, %r5, %r18
	.word 0xa2090005  ! 95: AND_R	and 	%r4, %r5, %r17
	.word 0xba00c005  ! 95: ADD_R	add 	%r3, %r5, %r29
	.word 0xa410c005  ! 95: OR_R	or 	%r3, %r5, %r18
	.word 0x9c00aa75  ! 95: ADD_I	add 	%r2, 0x0a75, %r14
	.word 0xa4008005  ! 95: ADD_R	add 	%r2, %r5, %r18
	.word 0xb2088005  ! 95: AND_R	and 	%r2, %r5, %r25
	.word 0xb8098005  ! 95: AND_R	and 	%r6, %r5, %r28
	.word 0xbe09abc3  ! 95: AND_I	and 	%r6, 0x0bc3, %r31
	.word 0x9e09c005  ! 95: AND_R	and 	%r7, %r5, %r15
	.word 0x9e00a332  ! 95: ADD_I	add 	%r2, 0x0332, %r15
	.word 0xaa110005  ! 95: OR_R	or 	%r4, %r5, %r21
	.word 0xb4008005  ! 95: ADD_R	add 	%r2, %r5, %r26
	.word 0xb4108005  ! 95: OR_R	or 	%r2, %r5, %r26
	.word 0xbc118005  ! 95: OR_R	or 	%r6, %r5, %r30
	.word 0xb410e50b  ! 95: OR_I	or 	%r3, 0x050b, %r26
	.word 0xa608c005  ! 95: AND_R	and 	%r3, %r5, %r19
	.word 0xaa018005  ! 95: ADD_R	add 	%r6, %r5, %r21
	.word 0xb4098005  ! 95: AND_R	and 	%r6, %r5, %r26
	.word 0xae10c005  ! 95: OR_R	or 	%r3, %r5, %r23
	.word 0x9a00a8e4  ! 95: ADD_I	add 	%r2, 0x08e4, %r13
	.word 0xa0098005  ! 95: AND_R	and 	%r6, %r5, %r16
	.word 0xb4118005  ! 95: OR_R	or 	%r6, %r5, %r26
	.word 0xb4012d56  ! 95: ADD_I	add 	%r4, 0x0d56, %r26
	.word 0xb4008005  ! 95: ADD_R	add 	%r2, %r5, %r26
	.word 0xbc08efc4  ! 95: AND_I	and 	%r3, 0x0fc4, %r30
	.word 0x9c09edf7  ! 95: AND_I	and 	%r7, 0x0df7, %r14
	.word 0xba00a409  ! 95: ADD_I	add 	%r2, 0x0409, %r29
	.word 0xb4088005  ! 95: AND_R	and 	%r2, %r5, %r26
	.word 0xbc01e970  ! 95: ADD_I	add 	%r7, 0x0970, %r30
	.word 0xac088005  ! 95: AND_R	and 	%r2, %r5, %r22
	.word 0xbc00e996  ! 95: ADD_I	add 	%r3, 0x0996, %r30
	.word 0xb601aeeb  ! 95: ADD_I	add 	%r6, 0x0eeb, %r27
	.word 0x9c00ef36  ! 95: ADD_I	add 	%r3, 0x0f36, %r14
	.word 0xa408c005  ! 95: AND_R	and 	%r3, %r5, %r18
	.word 0xaa092769  ! 95: AND_I	and 	%r4, 0x0769, %r21
	.word 0xa0108005  ! 95: OR_R	or 	%r2, %r5, %r16
	.word 0xba08e89d  ! 95: AND_I	and 	%r3, 0x089d, %r29
	.word 0xa611ea61  ! 95: OR_I	or 	%r7, 0x0a61, %r19
	.word 0xb211e2d3  ! 95: OR_I	or 	%r7, 0x02d3, %r25
	.word 0xbe01a1c2  ! 95: ADD_I	add 	%r6, 0x01c2, %r31
	.word 0xb8098005  ! 95: AND_R	and 	%r6, %r5, %r28
	.word 0xa011ea80  ! 95: OR_I	or 	%r7, 0x0a80, %r16
	.word 0xa811ee7f  ! 95: OR_I	or 	%r7, 0x0e7f, %r20
	.word 0xbc08aaff  ! 95: AND_I	and 	%r2, 0x0aff, %r30
	.word 0x9a118005  ! 95: OR_R	or 	%r6, %r5, %r13
	.word 0x9e008005  ! 95: ADD_R	add 	%r2, %r5, %r15
	.word 0xbc090005  ! 95: AND_R	and 	%r4, %r5, %r30
	.word 0xa409e9d0  ! 95: AND_I	and 	%r7, 0x09d0, %r18
	.word 0xb411c005  ! 95: OR_R	or 	%r7, %r5, %r26
	.word 0xbc09e20d  ! 95: AND_I	and 	%r7, 0x020d, %r30
	.word 0xbe00a707  ! 95: ADD_I	add 	%r2, 0x0707, %r31
	.word 0x9c108005  ! 95: OR_R	or 	%r2, %r5, %r14
	.word 0xac11a082  ! 95: OR_I	or 	%r6, 0x0082, %r22
	.word 0xb801e34e  ! 95: ADD_I	add 	%r7, 0x034e, %r28
	.word 0x9a008005  ! 95: ADD_R	add 	%r2, %r5, %r13
	.word 0xae11e272  ! 95: OR_I	or 	%r7, 0x0272, %r23
	.word 0xa408af02  ! 95: AND_I	and 	%r2, 0x0f02, %r18
	.word 0xbc09c005  ! 95: AND_R	and 	%r7, %r5, %r30
	.word 0xb000aa75  ! 95: ADD_I	add 	%r2, 0x0a75, %r24
	.word 0xa0010005  ! 95: ADD_R	add 	%r4, %r5, %r16
	.word 0xb810ecf6  ! 95: OR_I	or 	%r3, 0x0cf6, %r28
	.word 0xac092c33  ! 95: AND_I	and 	%r4, 0x0c33, %r22
	.word 0xbe11af7d  ! 95: OR_I	or 	%r6, 0x0f7d, %r31
	.word 0xb610aad2  ! 95: OR_I	or 	%r2, 0x0ad2, %r27
	.word 0xb409c005  ! 95: AND_R	and 	%r7, %r5, %r26
	.word 0xb01128dd  ! 95: OR_I	or 	%r4, 0x08dd, %r24
	.word 0xb6018005  ! 95: ADD_R	add 	%r6, %r5, %r27
	.word 0xb21125d3  ! 95: OR_I	or 	%r4, 0x05d3, %r25
	.word 0x9c01ad30  ! 95: ADD_I	add 	%r6, 0x0d30, %r14
	.word 0xba08a925  ! 95: AND_I	and 	%r2, 0x0925, %r29
	.word 0xa2010005  ! 95: ADD_R	add 	%r4, %r5, %r17
	.word 0xa6008005  ! 95: ADD_R	add 	%r2, %r5, %r19
	.word 0x9e090005  ! 95: AND_R	and 	%r4, %r5, %r15
	.word 0x9a08a33c  ! 95: AND_I	and 	%r2, 0x033c, %r13
	.word 0xb201adfd  ! 95: ADD_I	add 	%r6, 0x0dfd, %r25
	.word 0xb8108005  ! 95: OR_R	or 	%r2, %r5, %r28
	.word 0xaa088005  ! 95: AND_R	and 	%r2, %r5, %r21
	.word 0xa6008005  ! 95: ADD_R	add 	%r2, %r5, %r19
	.word 0xa600c005  ! 95: ADD_R	add 	%r3, %r5, %r19
	.word 0xa408abd8  ! 95: AND_I	and 	%r2, 0x0bd8, %r18
	.word 0xae088005  ! 95: AND_R	and 	%r2, %r5, %r23
	.word 0xa2110005  ! 95: OR_R	or 	%r4, %r5, %r17
	.word 0x9c090005  ! 95: AND_R	and 	%r4, %r5, %r14
	.word 0xb208a12e  ! 95: AND_I	and 	%r2, 0x012e, %r25
	.word 0x9e018005  ! 95: ADD_R	add 	%r6, %r5, %r15
	.word 0xbc012c74  ! 95: ADD_I	add 	%r4, 0x0c74, %r30
	.word 0xb601a46b  ! 95: ADD_I	add 	%r6, 0x046b, %r27
	.word 0xae008005  ! 95: ADD_R	add 	%r2, %r5, %r23
	.word 0xbe088005  ! 95: AND_R	and 	%r2, %r5, %r31
	.word 0xbe09c005  ! 95: AND_R	and 	%r7, %r5, %r31
	.word 0xb4108005  ! 95: OR_R	or 	%r2, %r5, %r26
	.word 0xaa09c005  ! 95: AND_R	and 	%r7, %r5, %r21
	.word 0x9a108005  ! 95: OR_R	or 	%r2, %r5, %r13
	.word 0x9c09c005  ! 95: AND_R	and 	%r7, %r5, %r14
	.word 0xae10a3a9  ! 95: OR_I	or 	%r2, 0x03a9, %r23
	.word 0x9a09a946  ! 95: AND_I	and 	%r6, 0x0946, %r13
	.word 0xa401e738  ! 95: ADD_I	add 	%r7, 0x0738, %r18
	.word 0xa200a470  ! 95: ADD_I	add 	%r2, 0x0470, %r17
	.word 0xb211e2fb  ! 95: OR_I	or 	%r7, 0x02fb, %r25
	.word 0xb0108005  ! 95: OR_R	or 	%r2, %r5, %r24
	.word 0xa401204a  ! 95: ADD_I	add 	%r4, 0x004a, %r18
	.word 0xac00ee07  ! 95: ADD_I	add 	%r3, 0x0e07, %r22
	.word 0xb210a1e1  ! 95: OR_I	or 	%r2, 0x01e1, %r25
	.word 0x9c10a0b4  ! 95: OR_I	or 	%r2, 0x00b4, %r14
	.word 0xa810eb91  ! 95: OR_I	or 	%r3, 0x0b91, %r20
	.word 0x9e098005  ! 95: AND_R	and 	%r6, %r5, %r15
	.word 0xb8008005  ! 95: ADD_R	add 	%r2, %r5, %r28
	.word 0xb008eae8  ! 95: AND_I	and 	%r3, 0x0ae8, %r24
	.word 0xba10e855  ! 95: OR_I	or 	%r3, 0x0855, %r29
	.word 0xb0098005  ! 95: AND_R	and 	%r6, %r5, %r24
	.word 0xb611c005  ! 95: OR_R	or 	%r7, %r5, %r27
	.word 0x9e08c005  ! 95: AND_R	and 	%r3, %r5, %r15
	.word 0xb211efeb  ! 95: OR_I	or 	%r7, 0x0feb, %r25
	.word 0xa810c005  ! 95: OR_R	or 	%r3, %r5, %r20
	.word 0xa409acb1  ! 95: AND_I	and 	%r6, 0x0cb1, %r18
	.word 0x9e10ab2c  ! 95: OR_I	or 	%r2, 0x0b2c, %r15
	.word 0xa000a3cd  ! 95: ADD_I	add 	%r2, 0x03cd, %r16
	.word 0xb00127e4  ! 95: ADD_I	add 	%r4, 0x07e4, %r24
	.word 0xac00a9da  ! 95: ADD_I	add 	%r2, 0x09da, %r22
	.word 0xb008a672  ! 95: AND_I	and 	%r2, 0x0672, %r24
	.word 0xbe008005  ! 95: ADD_R	add 	%r2, %r5, %r31
	.word 0xb411ea8d  ! 95: OR_I	or 	%r7, 0x0a8d, %r26
	.word 0xac08c005  ! 95: AND_R	and 	%r3, %r5, %r22
	.word 0xa408e6dc  ! 95: AND_I	and 	%r3, 0x06dc, %r18
	.word 0x9e11efc2  ! 95: OR_I	or 	%r7, 0x0fc2, %r15
	.word 0xf421e4c8  ! 95: STW_I	stw	%r26, [%r7 + 0x04c8]
	.word 0xf630e962  ! 95: STH_I	sth	%r27, [%r3 + 0x0962]
	.word 0xf62924d5  ! 95: STB_I	stb	%r27, [%r4 + 0x04d5]
	.word 0xf028a619  ! 95: STB_I	stb	%r24, [%r2 + 0x0619]
IRF_CE_48:
!$EV error(0,expr(@VA(.MAIN.IRF_CE_48), 16, 16), 1,IRF,ce,16,x, x,x,x, x,x,x)
!$EV error(0,expr(@VA(.MAIN.IRF_CE_48), 16, 16), 3,IRF,ce,7,x, x,x,x, x,x,x)
	.word 0xe421eab0  ! 95: STW_I	stw	%r18, [%r7 + 0x0ab0]
	.word 0xf831ace4  ! 95: STH_I	sth	%r28, [%r6 + 0x0ce4]
	.word 0xf230edae  ! 95: STH_I	sth	%r25, [%r3 + 0x0dae]
	.word 0xf029ec42  ! 95: STB_I	stb	%r24, [%r7 + 0x0c42]
	.word 0xb201c005  ! 95: ADD_R	add 	%r7, %r5, %r25
	.word 0xb409c005  ! 95: AND_R	and 	%r7, %r5, %r26
	bne thr0_loop_12
	subcc %g1, 0x1, %g1
	ba	join_lbl_0_0
	nop
fork_lbl_0_3:
	setx  0x0c144ef0bd4f472c, %r1, %r11
	setx  0xd7483b004898d647, %r1, %r12
	setx  0xed501a0e169b4761, %r1, %r13
	setx  0x2fe422a5ca954de4, %r1, %r14
	setx  0x1a1ae13130e27003, %r1, %r15
	setx  0x7fb56285c844ff0c, %r1, %r16
	setx  0x29e379c5a1810741, %r1, %r17
	setx  0xd9350869d78d4f69, %r1, %r18
	setx  0x46179174130af750, %r1, %r19
	setx  0x1ca6d1920f65b3d5, %r1, %r20
	setx  0x4c0e73a4e9814843, %r1, %r21
	setx  0xc9428068ae20e71c, %r1, %r22
	setx  0x5a5892d17c863b62, %r1, %r23
	setx  0x5ff5a6bd2407e054, %r1, %r24
	setx  0xf5815dd76f50033e, %r1, %r25
	setx  0x2b27d205b55cfdb9, %r1, %r26
	setx  0x7d018dfe18f59f30, %r1, %r27
	setx  0x9f3b10f514f03cc6, %r1, %r28
	setx  0x1f6b8ebc05a21a1d, %r1, %r29
	setx  0x4d74b5815d478dc3, %r1, %r30
	setx  0x391595b9554be735, %r1, %r31
	setx  0x00000000000006b0, %r1, %r5
	setx  0x80, %r2, %r1
	wr  %r1, %r0, %asi
	ta T_CHANGE_HPRIV !To allow ASI writes to D-I caches
	setx MAIN_BASE_DATA_VA, %r1, %r2
	setx MAIN_BASE_DATA_VA, %r1, %r3
	setx MAIN_BASE_DATA_VA, %r1, %r4
	setx MAIN_BASE_DATA_VA, %r1, %r6
	setx MAIN_BASE_DATA_VA, %r1, %r7
	setx MAIN_BASE_DATA_VA, %r1, %r8
	setx MAIN_BASE_DATA_VA, %r1, %r9
	setx MAIN_BASE_DATA_VA, %r1, %r10
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
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr3_loop_0:
	.word 0x9a10c005  ! 9: OR_R	or 	%r3, %r5, %r13
	.word 0xba008005  ! 9: ADD_R	add 	%r2, %r5, %r29
	.word 0xb8108005  ! 9: OR_R	or 	%r2, %r5, %r28
	.word 0xa4108005  ! 9: OR_R	or 	%r2, %r5, %r18
	.word 0xae08a099  ! 9: AND_I	and 	%r2, 0x0099, %r23
	.word 0xa2118005  ! 9: OR_R	or 	%r6, %r5, %r17
	.word 0xb808c005  ! 9: AND_R	and 	%r3, %r5, %r28
	.word 0xb211e8b6  ! 9: OR_I	or 	%r7, 0x08b6, %r25
	.word 0xa008a436  ! 9: AND_I	and 	%r2, 0x0436, %r16
	.word 0xaa10a382  ! 9: OR_I	or 	%r2, 0x0382, %r21
	.word 0xb210ab86  ! 9: OR_I	or 	%r2, 0x0b86, %r25
	.word 0xb0088005  ! 9: AND_R	and 	%r2, %r5, %r24
	.word 0xa8098005  ! 9: AND_R	and 	%r6, %r5, %r20
	.word 0xb8010005  ! 9: ADD_R	add 	%r4, %r5, %r28
	.word 0xb8010005  ! 9: ADD_R	add 	%r4, %r5, %r28
	.word 0x9e108005  ! 9: OR_R	or 	%r2, %r5, %r15
	.word 0xb000a5f1  ! 9: ADD_I	add 	%r2, 0x05f1, %r24
	.word 0xbe112acf  ! 9: OR_I	or 	%r4, 0x0acf, %r31
	.word 0xa2098005  ! 9: AND_R	and 	%r6, %r5, %r17
	.word 0xa8088005  ! 9: AND_R	and 	%r2, %r5, %r20
	.word 0xba09e7ad  ! 9: AND_I	and 	%r7, 0x07ad, %r29
	.word 0xb0092090  ! 9: AND_I	and 	%r4, 0x0090, %r24
	.word 0xb610c005  ! 9: OR_R	or 	%r3, %r5, %r27
	.word 0xa209c005  ! 9: AND_R	and 	%r7, %r5, %r17
	.word 0xbe01c005  ! 9: ADD_R	add 	%r7, %r5, %r31
	.word 0xb200e982  ! 9: ADD_I	add 	%r3, 0x0982, %r25
	.word 0xba008005  ! 9: ADD_R	add 	%r2, %r5, %r29
	.word 0x9c112a62  ! 9: OR_I	or 	%r4, 0x0a62, %r14
	.word 0xa0118005  ! 9: OR_R	or 	%r6, %r5, %r16
	.word 0xb409edf2  ! 9: AND_I	and 	%r7, 0x0df2, %r26
	.word 0xac118005  ! 9: OR_R	or 	%r6, %r5, %r22
	.word 0xba008005  ! 9: ADD_R	add 	%r2, %r5, %r29
	.word 0xac11e057  ! 9: OR_I	or 	%r7, 0x0057, %r22
	.word 0x9c088005  ! 9: AND_R	and 	%r2, %r5, %r14
	.word 0xa401c005  ! 9: ADD_R	add 	%r7, %r5, %r18
	.word 0xac10c005  ! 9: OR_R	or 	%r3, %r5, %r22
	.word 0xa401ac3c  ! 9: ADD_I	add 	%r6, 0x0c3c, %r18
	.word 0xae008005  ! 9: ADD_R	add 	%r2, %r5, %r23
	.word 0xa6008005  ! 9: ADD_R	add 	%r2, %r5, %r19
	.word 0x9e08a9de  ! 9: AND_I	and 	%r2, 0x09de, %r15
	.word 0xac08a179  ! 9: AND_I	and 	%r2, 0x0179, %r22
	.word 0xa8012059  ! 9: ADD_I	add 	%r4, 0x0059, %r20
	.word 0xb211c005  ! 9: OR_R	or 	%r7, %r5, %r25
	.word 0xbc09c005  ! 9: AND_R	and 	%r7, %r5, %r30
	.word 0xa8110005  ! 9: OR_R	or 	%r4, %r5, %r20
	.word 0xac10a5a6  ! 9: OR_I	or 	%r2, 0x05a6, %r22
	.word 0xaa08c005  ! 9: AND_R	and 	%r3, %r5, %r21
	.word 0xa2090005  ! 9: AND_R	and 	%r4, %r5, %r17
	.word 0xac09c005  ! 9: AND_R	and 	%r7, %r5, %r22
	.word 0x9e108005  ! 9: OR_R	or 	%r2, %r5, %r15
	.word 0xa2090005  ! 9: AND_R	and 	%r4, %r5, %r17
	.word 0xb0108005  ! 9: OR_R	or 	%r2, %r5, %r24
	.word 0xa409e0c1  ! 9: AND_I	and 	%r7, 0x00c1, %r18
	.word 0xae108005  ! 9: OR_R	or 	%r2, %r5, %r23
	.word 0xba00acd7  ! 9: ADD_I	add 	%r2, 0x0cd7, %r29
	.word 0xaa108005  ! 9: OR_R	or 	%r2, %r5, %r21
	.word 0xba00a1bf  ! 9: ADD_I	add 	%r2, 0x01bf, %r29
	.word 0xae09e144  ! 9: AND_I	and 	%r7, 0x0144, %r23
	.word 0xb808e76c  ! 9: AND_I	and 	%r3, 0x076c, %r28
	.word 0xbe10a2de  ! 9: OR_I	or 	%r2, 0x02de, %r31
	.word 0xa201aa77  ! 9: ADD_I	add 	%r6, 0x0a77, %r17
	.word 0x9a00acef  ! 9: ADD_I	add 	%r2, 0x0cef, %r13
	.word 0xac08a4fd  ! 9: AND_I	and 	%r2, 0x04fd, %r22
	.word 0xbe008005  ! 9: ADD_R	add 	%r2, %r5, %r31
	.word 0xa000a30b  ! 9: ADD_I	add 	%r2, 0x030b, %r16
	.word 0xa800c005  ! 9: ADD_R	add 	%r3, %r5, %r20
	.word 0xa6098005  ! 9: AND_R	and 	%r6, %r5, %r19
	.word 0xae08a9d8  ! 9: AND_I	and 	%r2, 0x09d8, %r23
	.word 0xac08e0e2  ! 9: AND_I	and 	%r3, 0x00e2, %r22
	.word 0xbe098005  ! 9: AND_R	and 	%r6, %r5, %r31
	.word 0xb4090005  ! 9: AND_R	and 	%r4, %r5, %r26
	.word 0x9a10ed17  ! 9: OR_I	or 	%r3, 0x0d17, %r13
	.word 0xa000c005  ! 9: ADD_R	add 	%r3, %r5, %r16
	.word 0xba00c005  ! 9: ADD_R	add 	%r3, %r5, %r29
	.word 0xb609c005  ! 9: AND_R	and 	%r7, %r5, %r27
	.word 0xaa10e5c0  ! 9: OR_I	or 	%r3, 0x05c0, %r21
	.word 0xa8108005  ! 9: OR_R	or 	%r2, %r5, %r20
	.word 0xbe092179  ! 9: AND_I	and 	%r4, 0x0179, %r31
	.word 0xbc09c005  ! 9: AND_R	and 	%r7, %r5, %r30
	.word 0xb401ed13  ! 9: ADD_I	add 	%r7, 0x0d13, %r26
	.word 0xa600a244  ! 9: ADD_I	add 	%r2, 0x0244, %r19
	.word 0xa800a294  ! 9: ADD_I	add 	%r2, 0x0294, %r20
	.word 0xa608c005  ! 9: AND_R	and 	%r3, %r5, %r19
	.word 0xb401ed31  ! 9: ADD_I	add 	%r7, 0x0d31, %r26
	.word 0xa208a1d2  ! 9: AND_I	and 	%r2, 0x01d2, %r17
	.word 0xae008005  ! 9: ADD_R	add 	%r2, %r5, %r23
	.word 0xb409e3e8  ! 9: AND_I	and 	%r7, 0x03e8, %r26
	.word 0xba088005  ! 9: AND_R	and 	%r2, %r5, %r29
	.word 0xb6108005  ! 9: OR_R	or 	%r2, %r5, %r27
	.word 0xa0090005  ! 9: AND_R	and 	%r4, %r5, %r16
	.word 0xa0092fec  ! 9: AND_I	and 	%r4, 0x0fec, %r16
	.word 0xb4088005  ! 9: AND_R	and 	%r2, %r5, %r26
	.word 0xbe098005  ! 9: AND_R	and 	%r6, %r5, %r31
	.word 0xac088005  ! 9: AND_R	and 	%r2, %r5, %r22
	.word 0x9c11e419  ! 9: OR_I	or 	%r7, 0x0419, %r14
	.word 0xb611e0f9  ! 9: OR_I	or 	%r7, 0x00f9, %r27
	.word 0xbc10a5c4  ! 9: OR_I	or 	%r2, 0x05c4, %r30
	.word 0xa4018005  ! 9: ADD_R	add 	%r6, %r5, %r18
	.word 0x9e088005  ! 9: AND_R	and 	%r2, %r5, %r15
	.word 0xbc112523  ! 9: OR_I	or 	%r4, 0x0523, %r30
	.word 0x9e08aef9  ! 9: AND_I	and 	%r2, 0x0ef9, %r15
	.word 0xba008005  ! 9: ADD_R	add 	%r2, %r5, %r29
	.word 0xa208ada3  ! 9: AND_I	and 	%r2, 0x0da3, %r17
	.word 0xae008005  ! 9: ADD_R	add 	%r2, %r5, %r23
	.word 0xbe08c005  ! 9: AND_R	and 	%r3, %r5, %r31
	.word 0xb400c005  ! 9: ADD_R	add 	%r3, %r5, %r26
	.word 0xb6118005  ! 9: OR_R	or 	%r6, %r5, %r27
	.word 0xb6098005  ! 9: AND_R	and 	%r6, %r5, %r27
	.word 0xb001ac73  ! 9: ADD_I	add 	%r6, 0x0c73, %r24
	.word 0x9a09e37e  ! 9: AND_I	and 	%r7, 0x037e, %r13
	.word 0xba108005  ! 9: OR_R	or 	%r2, %r5, %r29
	.word 0xa801e4f0  ! 9: ADD_I	add 	%r7, 0x04f0, %r20
	.word 0x9c012346  ! 9: ADD_I	add 	%r4, 0x0346, %r14
	.word 0x9e108005  ! 9: OR_R	or 	%r2, %r5, %r15
	.word 0xae112490  ! 9: OR_I	or 	%r4, 0x0490, %r23
	.word 0xae09ee35  ! 9: AND_I	and 	%r7, 0x0e35, %r23
	.word 0x9a108005  ! 9: OR_R	or 	%r2, %r5, %r13
	.word 0xba108005  ! 9: OR_R	or 	%r2, %r5, %r29
	.word 0xa6112ced  ! 9: OR_I	or 	%r4, 0x0ced, %r19
	.word 0xa209c005  ! 9: AND_R	and 	%r7, %r5, %r17
	.word 0xaa10e697  ! 9: OR_I	or 	%r3, 0x0697, %r21
	.word 0xa800a09a  ! 9: ADD_I	add 	%r2, 0x009a, %r20
	.word 0xae01214b  ! 9: ADD_I	add 	%r4, 0x014b, %r23
	.word 0xb6012e5b  ! 9: ADD_I	add 	%r4, 0x0e5b, %r27
	.word 0xac08c005  ! 9: AND_R	and 	%r3, %r5, %r22
	.word 0xa201e678  ! 9: ADD_I	add 	%r7, 0x0678, %r17
	.word 0x9c10aafc  ! 9: OR_I	or 	%r2, 0x0afc, %r14
	.word 0xa2010005  ! 9: ADD_R	add 	%r4, %r5, %r17
	.word 0x9a00e7fb  ! 9: ADD_I	add 	%r3, 0x07fb, %r13
	.word 0xbe09c005  ! 9: AND_R	and 	%r7, %r5, %r31
	.word 0xa6008005  ! 9: ADD_R	add 	%r2, %r5, %r19
	.word 0x9c00abcd  ! 9: ADD_I	add 	%r2, 0x0bcd, %r14
	.word 0xbe01c005  ! 9: ADD_R	add 	%r7, %r5, %r31
	.word 0x9e08eb99  ! 9: AND_I	and 	%r3, 0x0b99, %r15
	.word 0xa2008005  ! 9: ADD_R	add 	%r2, %r5, %r17
	.word 0xac09eb37  ! 9: AND_I	and 	%r7, 0x0b37, %r22
	.word 0xb6108005  ! 9: OR_R	or 	%r2, %r5, %r27
	.word 0xa208ed8c  ! 9: AND_I	and 	%r3, 0x0d8c, %r17
	.word 0x9c01e47b  ! 9: ADD_I	add 	%r7, 0x047b, %r14
	.word 0xbc010005  ! 9: ADD_R	add 	%r4, %r5, %r30
	.word 0xae08a49a  ! 9: AND_I	and 	%r2, 0x049a, %r23
	.word 0xae00c005  ! 9: ADD_R	add 	%r3, %r5, %r23
	.word 0xba11edcf  ! 9: OR_I	or 	%r7, 0x0dcf, %r29
	.word 0xa8088005  ! 9: AND_R	and 	%r2, %r5, %r20
	.word 0xac01abe1  ! 9: ADD_I	add 	%r6, 0x0be1, %r22
	.word 0xbc00a496  ! 9: ADD_I	add 	%r2, 0x0496, %r30
	.word 0xa801e690  ! 9: ADD_I	add 	%r7, 0x0690, %r20
	.word 0xb008e0ea  ! 9: AND_I	and 	%r3, 0x00ea, %r24
	.word 0xb6010005  ! 9: ADD_R	add 	%r4, %r5, %r27
	.word 0xae10a899  ! 9: OR_I	or 	%r2, 0x0899, %r23
	.word 0xa8108005  ! 9: OR_R	or 	%r2, %r5, %r20
	.word 0xb6098005  ! 9: AND_R	and 	%r6, %r5, %r27
	.word 0xa4088005  ! 9: AND_R	and 	%r2, %r5, %r18
	.word 0x9a00a9a8  ! 9: ADD_I	add 	%r2, 0x09a8, %r13
	.word 0xaa110005  ! 9: OR_R	or 	%r4, %r5, %r21
	.word 0xa408e3b7  ! 9: AND_I	and 	%r3, 0x03b7, %r18
	.word 0xbe10a18d  ! 9: OR_I	or 	%r2, 0x018d, %r31
	.word 0xa601ad8a  ! 9: ADD_I	add 	%r6, 0x0d8a, %r19
	.word 0xae090005  ! 9: AND_R	and 	%r4, %r5, %r23
	.word 0xb8110005  ! 9: OR_R	or 	%r4, %r5, %r28
	.word 0xa611e7c0  ! 9: OR_I	or 	%r7, 0x07c0, %r19
	.word 0x9c08c005  ! 9: AND_R	and 	%r3, %r5, %r14
	.word 0xb411e4ff  ! 9: OR_I	or 	%r7, 0x04ff, %r26
	.word 0xb0088005  ! 9: AND_R	and 	%r2, %r5, %r24
	.word 0xbe090005  ! 9: AND_R	and 	%r4, %r5, %r31
	.word 0x9a11c005  ! 9: OR_R	or 	%r7, %r5, %r13
	.word 0xaa08c005  ! 9: AND_R	and 	%r3, %r5, %r21
	.word 0xae11e1f9  ! 9: OR_I	or 	%r7, 0x01f9, %r23
	.word 0xbc008005  ! 9: ADD_R	add 	%r2, %r5, %r30
	.word 0xa2012720  ! 9: ADD_I	add 	%r4, 0x0720, %r17
	.word 0xb408c005  ! 9: AND_R	and 	%r3, %r5, %r26
	.word 0xb6110005  ! 9: OR_R	or 	%r4, %r5, %r27
	.word 0xb4088005  ! 9: AND_R	and 	%r2, %r5, %r26
	.word 0xac01c005  ! 9: ADD_R	add 	%r7, %r5, %r22
	.word 0xb001c005  ! 9: ADD_R	add 	%r7, %r5, %r24
	.word 0xaa018005  ! 9: ADD_R	add 	%r6, %r5, %r21
	.word 0xa200a8ef  ! 9: ADD_I	add 	%r2, 0x08ef, %r17
	.word 0xb001e99e  ! 9: ADD_I	add 	%r7, 0x099e, %r24
	.word 0xb808abea  ! 9: AND_I	and 	%r2, 0x0bea, %r28
	.word 0x9e108005  ! 9: OR_R	or 	%r2, %r5, %r15
	.word 0x9e01eded  ! 9: ADD_I	add 	%r7, 0x0ded, %r15
	.word 0x9e08adc7  ! 9: AND_I	and 	%r2, 0x0dc7, %r15
	.word 0xa0118005  ! 9: OR_R	or 	%r6, %r5, %r16
	.word 0x9a01e93b  ! 9: ADD_I	add 	%r7, 0x093b, %r13
	.word 0x9e11ea98  ! 9: OR_I	or 	%r7, 0x0a98, %r15
	.word 0xae118005  ! 9: OR_R	or 	%r6, %r5, %r23
	.word 0xa0112086  ! 9: OR_I	or 	%r4, 0x0086, %r16
	.word 0xb0088005  ! 9: AND_R	and 	%r2, %r5, %r24
	.word 0xae01e4ff  ! 9: ADD_I	add 	%r7, 0x04ff, %r23
	.word 0xbe11a2f7  ! 9: OR_I	or 	%r6, 0x02f7, %r31
	.word 0xa411ad08  ! 9: OR_I	or 	%r6, 0x0d08, %r18
	.word 0x9c00adf0  ! 9: ADD_I	add 	%r2, 0x0df0, %r14
	.word 0xb800c005  ! 9: ADD_R	add 	%r3, %r5, %r28
	.word 0xaa11e89e  ! 9: OR_I	or 	%r7, 0x089e, %r21
	.word 0xa808ab2a  ! 9: AND_I	and 	%r2, 0x0b2a, %r20
	.word 0xaa088005  ! 9: AND_R	and 	%r2, %r5, %r21
	.word 0xac08a13a  ! 9: AND_I	and 	%r2, 0x013a, %r22
	.word 0xa2118005  ! 9: OR_R	or 	%r6, %r5, %r17
	.word 0xbe108005  ! 9: OR_R	or 	%r2, %r5, %r31
	.word 0xb800c005  ! 9: ADD_R	add 	%r3, %r5, %r28
	.word 0xee20a64c  ! 9: STW_I	stw	%r23, [%r2 + 0x064c]
	.word 0xfc31aed4  ! 9: STH_I	sth	%r30, [%r6 + 0x0ed4]
	.word 0xfa71aea0  ! 9: STX_I	stx	%r29, [%r6 + 0x0ea0]
	.word 0xe470a9e8  ! 9: STX_I	stx	%r18, [%r2 + 0x09e8]
IRF_CE_3:
!$EV error(3,expr(@VA(.MAIN.IRF_CE_3), 16, 16), 1,IRF,ce,58,x, x,x,x, x,x,x)
!$EV error(3,expr(@VA(.MAIN.IRF_CE_3), 16, 16), 3,IRF,ce,13,x, x,x,x, x,x,x)
	.word 0xe021ad08  ! 9: STW_I	stw	%r16, [%r6 + 0x0d08]
	.word 0xde29ae57  ! 9: STB_I	stb	%r15, [%r6 + 0x0e57]
	.word 0xdc28adb4  ! 9: STB_I	stb	%r14, [%r2 + 0x0db4]
	.word 0xf6e8d005  ! 9: LDSTUBA_R	ldstuba	%r27, [%r3 + %r5] 0x80
	.word 0xac088005  ! 9: AND_R	and 	%r2, %r5, %r22
	.word 0xa600c005  ! 9: ADD_R	add 	%r3, %r5, %r19
	bne thr3_loop_0
	subcc %g1, 0x1, %g1
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr3_loop_1:
	.word 0x9c01a55c  ! 16: ADD_I	add 	%r6, 0x055c, %r14
	.word 0xbc008005  ! 16: ADD_R	add 	%r2, %r5, %r30
	.word 0x9e108005  ! 16: OR_R	or 	%r2, %r5, %r15
	.word 0xae00c005  ! 16: ADD_R	add 	%r3, %r5, %r23
	.word 0xa600ab61  ! 16: ADD_I	add 	%r2, 0x0b61, %r19
	.word 0xba010005  ! 16: ADD_R	add 	%r4, %r5, %r29
	.word 0xac11a869  ! 16: OR_I	or 	%r6, 0x0869, %r22
	.word 0xa0108005  ! 16: OR_R	or 	%r2, %r5, %r16
	.word 0xb808a0f6  ! 16: AND_I	and 	%r2, 0x00f6, %r28
	.word 0xa010a5e6  ! 16: OR_I	or 	%r2, 0x05e6, %r16
	.word 0x9e11a47d  ! 16: OR_I	or 	%r6, 0x047d, %r15
	.word 0xb8092f6e  ! 16: AND_I	and 	%r4, 0x0f6e, %r28
	.word 0xa2092528  ! 16: AND_I	and 	%r4, 0x0528, %r17
	.word 0xbe01a77c  ! 16: ADD_I	add 	%r6, 0x077c, %r31
	.word 0xb208c005  ! 16: AND_R	and 	%r3, %r5, %r25
	.word 0xb000aa57  ! 16: ADD_I	add 	%r2, 0x0a57, %r24
	.word 0x9a10c005  ! 16: OR_R	or 	%r3, %r5, %r13
	.word 0xaa108005  ! 16: OR_R	or 	%r2, %r5, %r21
	.word 0xa8108005  ! 16: OR_R	or 	%r2, %r5, %r20
	.word 0x9a11c005  ! 16: OR_R	or 	%r7, %r5, %r13
	.word 0xb200e673  ! 16: ADD_I	add 	%r3, 0x0673, %r25
	.word 0xb210aa81  ! 16: OR_I	or 	%r2, 0x0a81, %r25
	.word 0xba092940  ! 16: AND_I	and 	%r4, 0x0940, %r29
	.word 0xa209a867  ! 16: AND_I	and 	%r6, 0x0867, %r17
	.word 0xb40921bf  ! 16: AND_I	and 	%r4, 0x01bf, %r26
	.word 0x9e018005  ! 16: ADD_R	add 	%r6, %r5, %r15
	.word 0xbc08ed8c  ! 16: AND_I	and 	%r3, 0x0d8c, %r30
	.word 0xa400af94  ! 16: ADD_I	add 	%r2, 0x0f94, %r18
	.word 0xbc09ac86  ! 16: AND_I	and 	%r6, 0x0c86, %r30
	.word 0xaa09e431  ! 16: AND_I	and 	%r7, 0x0431, %r21
	.word 0xb400a70c  ! 16: ADD_I	add 	%r2, 0x070c, %r26
	.word 0xb8008005  ! 16: ADD_R	add 	%r2, %r5, %r28
	.word 0xb408a1ef  ! 16: AND_I	and 	%r2, 0x01ef, %r26
	.word 0xa6018005  ! 16: ADD_R	add 	%r6, %r5, %r19
	.word 0xae01aad1  ! 16: ADD_I	add 	%r6, 0x0ad1, %r23
	.word 0xb8008005  ! 16: ADD_R	add 	%r2, %r5, %r28
	.word 0xa6110005  ! 16: OR_R	or 	%r4, %r5, %r19
	.word 0xbe110005  ! 16: OR_R	or 	%r4, %r5, %r31
	.word 0xb209e3de  ! 16: AND_I	and 	%r7, 0x03de, %r25
	.word 0xb4118005  ! 16: OR_R	or 	%r6, %r5, %r26
	.word 0xaa110005  ! 16: OR_R	or 	%r4, %r5, %r21
	.word 0xa209e1c5  ! 16: AND_I	and 	%r7, 0x01c5, %r17
	.word 0xa8010005  ! 16: ADD_R	add 	%r4, %r5, %r20
	.word 0xb400a3eb  ! 16: ADD_I	add 	%r2, 0x03eb, %r26
	.word 0xa6018005  ! 16: ADD_R	add 	%r6, %r5, %r19
	.word 0xb010e013  ! 16: OR_I	or 	%r3, 0x0013, %r24
	.word 0xaa00c005  ! 16: ADD_R	add 	%r3, %r5, %r21
	.word 0x9a00e69d  ! 16: ADD_I	add 	%r3, 0x069d, %r13
	.word 0xae10a74d  ! 16: OR_I	or 	%r2, 0x074d, %r23
	.word 0xb009c005  ! 16: AND_R	and 	%r7, %r5, %r24
	.word 0xaa010005  ! 16: ADD_R	add 	%r4, %r5, %r21
	.word 0xaa09e57a  ! 16: AND_I	and 	%r7, 0x057a, %r21
	.word 0xba088005  ! 16: AND_R	and 	%r2, %r5, %r29
	.word 0xb001c005  ! 16: ADD_R	add 	%r7, %r5, %r24
	.word 0xa811229c  ! 16: OR_I	or 	%r4, 0x029c, %r20
	.word 0xae08c005  ! 16: AND_R	and 	%r3, %r5, %r23
	.word 0x9a1124dc  ! 16: OR_I	or 	%r4, 0x04dc, %r13
	.word 0xb2108005  ! 16: OR_R	or 	%r2, %r5, %r25
	.word 0xb810ecbc  ! 16: OR_I	or 	%r3, 0x0cbc, %r28
	.word 0xb8008005  ! 16: ADD_R	add 	%r2, %r5, %r28
	.word 0xb408a0f9  ! 16: AND_I	and 	%r2, 0x00f9, %r26
	.word 0xa208adaa  ! 16: AND_I	and 	%r2, 0x0daa, %r17
	.word 0xb408c005  ! 16: AND_R	and 	%r3, %r5, %r26
	.word 0x9a010005  ! 16: ADD_R	add 	%r4, %r5, %r13
	.word 0xb8088005  ! 16: AND_R	and 	%r2, %r5, %r28
	.word 0xba08e7f0  ! 16: AND_I	and 	%r3, 0x07f0, %r29
	.word 0xbe08efab  ! 16: AND_I	and 	%r3, 0x0fab, %r31
	.word 0xa810e92a  ! 16: OR_I	or 	%r3, 0x092a, %r20
	.word 0xaa112bb1  ! 16: OR_I	or 	%r4, 0x0bb1, %r21
	.word 0x9a090005  ! 16: AND_R	and 	%r4, %r5, %r13
	.word 0x9a10c005  ! 16: OR_R	or 	%r3, %r5, %r13
	.word 0xac00e344  ! 16: ADD_I	add 	%r3, 0x0344, %r22
	.word 0xbe01a76b  ! 16: ADD_I	add 	%r6, 0x076b, %r31
	.word 0xa21123ea  ! 16: OR_I	or 	%r4, 0x03ea, %r17
	.word 0x9e088005  ! 16: AND_R	and 	%r2, %r5, %r15
	.word 0xbe08a2fe  ! 16: AND_I	and 	%r2, 0x02fe, %r31
	.word 0xac088005  ! 16: AND_R	and 	%r2, %r5, %r22
	.word 0xa0008005  ! 16: ADD_R	add 	%r2, %r5, %r16
	.word 0xb201c005  ! 16: ADD_R	add 	%r7, %r5, %r25
	.word 0xb600e01c  ! 16: ADD_I	add 	%r3, 0x001c, %r27
	.word 0xb610c005  ! 16: OR_R	or 	%r3, %r5, %r27
	.word 0x9e008005  ! 16: ADD_R	add 	%r2, %r5, %r15
	.word 0xa4108005  ! 16: OR_R	or 	%r2, %r5, %r18
	.word 0xa00920a1  ! 16: AND_I	and 	%r4, 0x00a1, %r16
	.word 0xac11a830  ! 16: OR_I	or 	%r6, 0x0830, %r22
	.word 0xb609a38a  ! 16: AND_I	and 	%r6, 0x038a, %r27
	.word 0x9e012482  ! 16: ADD_I	add 	%r4, 0x0482, %r15
	.word 0xac08af77  ! 16: AND_I	and 	%r2, 0x0f77, %r22
	.word 0xbe01eaa8  ! 16: ADD_I	add 	%r7, 0x0aa8, %r31
	.word 0xb400ed64  ! 16: ADD_I	add 	%r3, 0x0d64, %r26
	.word 0x9c01a6cd  ! 16: ADD_I	add 	%r6, 0x06cd, %r14
	.word 0xb2008005  ! 16: ADD_R	add 	%r2, %r5, %r25
	.word 0xaa00e8c2  ! 16: ADD_I	add 	%r3, 0x08c2, %r21
	.word 0xb208ac32  ! 16: AND_I	and 	%r2, 0x0c32, %r25
	.word 0xba11aa45  ! 16: OR_I	or 	%r6, 0x0a45, %r29
	.word 0x9c108005  ! 16: OR_R	or 	%r2, %r5, %r14
	.word 0xa2018005  ! 16: ADD_R	add 	%r6, %r5, %r17
	.word 0xbe01e170  ! 16: ADD_I	add 	%r7, 0x0170, %r31
	.word 0xb809a794  ! 16: AND_I	and 	%r6, 0x0794, %r28
	.word 0xb008c005  ! 16: AND_R	and 	%r3, %r5, %r24
	.word 0xae11ef9e  ! 16: OR_I	or 	%r7, 0x0f9e, %r23
	.word 0xa401e9de  ! 16: ADD_I	add 	%r7, 0x09de, %r18
	.word 0xa001c005  ! 16: ADD_R	add 	%r7, %r5, %r16
	.word 0xb8090005  ! 16: AND_R	and 	%r4, %r5, %r28
	.word 0xbc08ab97  ! 16: AND_I	and 	%r2, 0x0b97, %r30
	.word 0xb0008005  ! 16: ADD_R	add 	%r2, %r5, %r24
	.word 0xb408e1b5  ! 16: AND_I	and 	%r3, 0x01b5, %r26
	.word 0xa2010005  ! 16: ADD_R	add 	%r4, %r5, %r17
	.word 0x9c01ace9  ! 16: ADD_I	add 	%r6, 0x0ce9, %r14
	.word 0xae01e558  ! 16: ADD_I	add 	%r7, 0x0558, %r23
	.word 0xb400c005  ! 16: ADD_R	add 	%r3, %r5, %r26
	.word 0xa8118005  ! 16: OR_R	or 	%r6, %r5, %r20
	.word 0xbc00c005  ! 16: ADD_R	add 	%r3, %r5, %r30
	.word 0xb8108005  ! 16: OR_R	or 	%r2, %r5, %r28
	.word 0xae01c005  ! 16: ADD_R	add 	%r7, %r5, %r23
	.word 0xbe01c005  ! 16: ADD_R	add 	%r7, %r5, %r31
	.word 0xae11e2c0  ! 16: OR_I	or 	%r7, 0x02c0, %r23
	.word 0xa6118005  ! 16: OR_R	or 	%r6, %r5, %r19
	.word 0xa210e48a  ! 16: OR_I	or 	%r3, 0x048a, %r17
	.word 0xa809ecee  ! 16: AND_I	and 	%r7, 0x0cee, %r20
	.word 0xbc0921f8  ! 16: AND_I	and 	%r4, 0x01f8, %r30
	.word 0xa4098005  ! 16: AND_R	and 	%r6, %r5, %r18
	.word 0xae108005  ! 16: OR_R	or 	%r2, %r5, %r23
	.word 0x9c108005  ! 16: OR_R	or 	%r2, %r5, %r14
	.word 0xac090005  ! 16: AND_R	and 	%r4, %r5, %r22
	.word 0xae08c005  ! 16: AND_R	and 	%r3, %r5, %r23
	.word 0xbe08a129  ! 16: AND_I	and 	%r2, 0x0129, %r31
	.word 0x9c10aae0  ! 16: OR_I	or 	%r2, 0x0ae0, %r14
	.word 0xfa20a1d0  ! 16: STW_I	stw	%r29, [%r2 + 0x01d0]
	.word 0xe629a74e  ! 16: STB_I	stb	%r19, [%r6 + 0x074e]
	.word 0xf429223d  ! 16: STB_I	stb	%r26, [%r4 + 0x023d]
	.word 0xf830a0c8  ! 16: STH_I	sth	%r28, [%r2 + 0x00c8]
IRF_CE_7:
!$EV error(3,expr(@VA(.MAIN.IRF_CE_7), 16, 16), 1,IRF,ce,54,x, x,x,x, x,x,x)
!$EV error(3,expr(@VA(.MAIN.IRF_CE_7), 16, 16), 3,IRF,ce,49,x, x,x,x, x,x,x)
	.word 0xf870a678  ! 16: STX_I	stx	%r28, [%r2 + 0x0678]
	.word 0xf071ac40  ! 16: STX_I	stx	%r24, [%r6 + 0x0c40]
	.word 0xda30ea70  ! 16: STH_I	sth	%r13, [%r3 + 0x0a70]
	.word 0xe6788005  ! 16: SWAP_R	swap	%r19, [%r2 + %r5]
	.word 0xa2110005  ! 16: OR_R	or 	%r4, %r5, %r17
	.word 0x9a088005  ! 16: AND_R	and 	%r2, %r5, %r13
	bne thr3_loop_1
	subcc %g1, 0x1, %g1
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr3_loop_2:
	.word 0xb600aafe  ! 23: ADD_I	add 	%r2, 0x0afe, %r27
	.word 0x9c11c005  ! 23: OR_R	or 	%r7, %r5, %r14
	.word 0xa000ac9e  ! 23: ADD_I	add 	%r2, 0x0c9e, %r16
	.word 0xba088005  ! 23: AND_R	and 	%r2, %r5, %r29
	.word 0xb4108005  ! 23: OR_R	or 	%r2, %r5, %r26
	.word 0xaa08eec4  ! 23: AND_I	and 	%r3, 0x0ec4, %r21
	.word 0xb801c005  ! 23: ADD_R	add 	%r7, %r5, %r28
	.word 0xaa00a863  ! 23: ADD_I	add 	%r2, 0x0863, %r21
	.word 0xae108005  ! 23: OR_R	or 	%r2, %r5, %r23
	.word 0xb2088005  ! 23: AND_R	and 	%r2, %r5, %r25
	.word 0xac008005  ! 23: ADD_R	add 	%r2, %r5, %r22
	.word 0xb6110005  ! 23: OR_R	or 	%r4, %r5, %r27
	.word 0xa800c005  ! 23: ADD_R	add 	%r3, %r5, %r20
	.word 0xb0018005  ! 23: ADD_R	add 	%r6, %r5, %r24
	.word 0xb8108005  ! 23: OR_R	or 	%r2, %r5, %r28
	.word 0xaa08a5b4  ! 23: AND_I	and 	%r2, 0x05b4, %r21
	.word 0xa008eb51  ! 23: AND_I	and 	%r3, 0x0b51, %r16
	.word 0xa008c005  ! 23: AND_R	and 	%r3, %r5, %r16
	.word 0xaa092375  ! 23: AND_I	and 	%r4, 0x0375, %r21
	.word 0xbe01aec3  ! 23: ADD_I	add 	%r6, 0x0ec3, %r31
	.word 0xbe0126f1  ! 23: ADD_I	add 	%r4, 0x06f1, %r31
	.word 0xa010a262  ! 23: OR_I	or 	%r2, 0x0262, %r16
	.word 0x9e09aa43  ! 23: AND_I	and 	%r6, 0x0a43, %r15
	.word 0xa200ab8b  ! 23: ADD_I	add 	%r2, 0x0b8b, %r17
	.word 0xa208c005  ! 23: AND_R	and 	%r3, %r5, %r17
	.word 0xb401edd2  ! 23: ADD_I	add 	%r7, 0x0dd2, %r26
	.word 0xb6088005  ! 23: AND_R	and 	%r2, %r5, %r27
	.word 0xae10e0a0  ! 23: OR_I	or 	%r3, 0x00a0, %r23
	.word 0x9a11e78c  ! 23: OR_I	or 	%r7, 0x078c, %r13
	.word 0xb8092cfc  ! 23: AND_I	and 	%r4, 0x0cfc, %r28
	.word 0xbc10a42b  ! 23: OR_I	or 	%r2, 0x042b, %r30
	.word 0xb211a87c  ! 23: OR_I	or 	%r6, 0x087c, %r25
	.word 0xac018005  ! 23: ADD_R	add 	%r6, %r5, %r22
	.word 0x9a088005  ! 23: AND_R	and 	%r2, %r5, %r13
	.word 0xa6110005  ! 23: OR_R	or 	%r4, %r5, %r19
	.word 0xae10a796  ! 23: OR_I	or 	%r2, 0x0796, %r23
	.word 0xb8012ab8  ! 23: ADD_I	add 	%r4, 0x0ab8, %r28
	.word 0xa6098005  ! 23: AND_R	and 	%r6, %r5, %r19
	.word 0xa0108005  ! 23: OR_R	or 	%r2, %r5, %r16
	.word 0xb610a8a7  ! 23: OR_I	or 	%r2, 0x08a7, %r27
	.word 0xa208c005  ! 23: AND_R	and 	%r3, %r5, %r17
	.word 0x9a09a43a  ! 23: AND_I	and 	%r6, 0x043a, %r13
	.word 0xa6010005  ! 23: ADD_R	add 	%r4, %r5, %r19
	.word 0xac00c005  ! 23: ADD_R	add 	%r3, %r5, %r22
	.word 0xbe108005  ! 23: OR_R	or 	%r2, %r5, %r31
	.word 0xbe088005  ! 23: AND_R	and 	%r2, %r5, %r31
	.word 0xa410a7d8  ! 23: OR_I	or 	%r2, 0x07d8, %r18
	.word 0xb2108005  ! 23: OR_R	or 	%r2, %r5, %r25
	.word 0xac08ee03  ! 23: AND_I	and 	%r3, 0x0e03, %r22
	.word 0x9a088005  ! 23: AND_R	and 	%r2, %r5, %r13
	.word 0xaa0129af  ! 23: ADD_I	add 	%r4, 0x09af, %r21
	.word 0xa610acf8  ! 23: OR_I	or 	%r2, 0x0cf8, %r19
	.word 0xa410af68  ! 23: OR_I	or 	%r2, 0x0f68, %r18
	.word 0xaa112615  ! 23: OR_I	or 	%r4, 0x0615, %r21
	.word 0xba118005  ! 23: OR_R	or 	%r6, %r5, %r29
	.word 0xae10a9db  ! 23: OR_I	or 	%r2, 0x09db, %r23
	.word 0xbc110005  ! 23: OR_R	or 	%r4, %r5, %r30
	.word 0x9e0923f7  ! 23: AND_I	and 	%r4, 0x03f7, %r15
	.word 0xa4088005  ! 23: AND_R	and 	%r2, %r5, %r18
	.word 0xb6110005  ! 23: OR_R	or 	%r4, %r5, %r27
	.word 0xb009e7ba  ! 23: AND_I	and 	%r7, 0x07ba, %r24
	.word 0xaa012e22  ! 23: ADD_I	add 	%r4, 0x0e22, %r21
	.word 0xaa008005  ! 23: ADD_R	add 	%r2, %r5, %r21
	.word 0xb21126d9  ! 23: OR_I	or 	%r4, 0x06d9, %r25
	.word 0x9a11e69b  ! 23: OR_I	or 	%r7, 0x069b, %r13
	.word 0xb4090005  ! 23: AND_R	and 	%r4, %r5, %r26
	.word 0xa8112898  ! 23: OR_I	or 	%r4, 0x0898, %r20
	.word 0x9e018005  ! 23: ADD_R	add 	%r6, %r5, %r15
	.word 0xbe0920ba  ! 23: AND_I	and 	%r4, 0x00ba, %r31
	.word 0xb0112966  ! 23: OR_I	or 	%r4, 0x0966, %r24
	.word 0xaa0925b2  ! 23: AND_I	and 	%r4, 0x05b2, %r21
	.word 0xb4088005  ! 23: AND_R	and 	%r2, %r5, %r26
	.word 0xb601a27e  ! 23: ADD_I	add 	%r6, 0x027e, %r27
	.word 0xa601ecdb  ! 23: ADD_I	add 	%r7, 0x0cdb, %r19
	.word 0x9c018005  ! 23: ADD_R	add 	%r6, %r5, %r14
	.word 0xa0088005  ! 23: AND_R	and 	%r2, %r5, %r16
	.word 0xaa01ed19  ! 23: ADD_I	add 	%r7, 0x0d19, %r21
	.word 0xa4088005  ! 23: AND_R	and 	%r2, %r5, %r18
	.word 0x9c09c005  ! 23: AND_R	and 	%r7, %r5, %r14
	.word 0xb6008005  ! 23: ADD_R	add 	%r2, %r5, %r27
	.word 0xbc008005  ! 23: ADD_R	add 	%r2, %r5, %r30
	.word 0xa408a540  ! 23: AND_I	and 	%r2, 0x0540, %r18
	.word 0xb601a924  ! 23: ADD_I	add 	%r6, 0x0924, %r27
	.word 0xb6008005  ! 23: ADD_R	add 	%r2, %r5, %r27
	.word 0xa0108005  ! 23: OR_R	or 	%r2, %r5, %r16
	.word 0xa008eb69  ! 23: AND_I	and 	%r3, 0x0b69, %r16
	.word 0xb2108005  ! 23: OR_R	or 	%r2, %r5, %r25
	.word 0xa201e84b  ! 23: ADD_I	add 	%r7, 0x084b, %r17
	.word 0xa4098005  ! 23: AND_R	and 	%r6, %r5, %r18
	.word 0xac110005  ! 23: OR_R	or 	%r4, %r5, %r22
	.word 0xb0010005  ! 23: ADD_R	add 	%r4, %r5, %r24
	.word 0x9c00eeaf  ! 23: ADD_I	add 	%r3, 0x0eaf, %r14
	.word 0xbc11c005  ! 23: OR_R	or 	%r7, %r5, %r30
	.word 0xb400a025  ! 23: ADD_I	add 	%r2, 0x0025, %r26
	.word 0xa411eaae  ! 23: OR_I	or 	%r7, 0x0aae, %r18
	.word 0xa41122dd  ! 23: OR_I	or 	%r4, 0x02dd, %r18
	.word 0x9c1129e9  ! 23: OR_I	or 	%r4, 0x09e9, %r14
	.word 0xa208a6ed  ! 23: AND_I	and 	%r2, 0x06ed, %r17
	.word 0xb001abad  ! 23: ADD_I	add 	%r6, 0x0bad, %r24
	.word 0xb408a471  ! 23: AND_I	and 	%r2, 0x0471, %r26
	.word 0xbc1125b8  ! 23: OR_I	or 	%r4, 0x05b8, %r30
	.word 0xa8118005  ! 23: OR_R	or 	%r6, %r5, %r20
	.word 0xb411e49b  ! 23: OR_I	or 	%r7, 0x049b, %r26
	.word 0xa2108005  ! 23: OR_R	or 	%r2, %r5, %r17
	.word 0xaa10c005  ! 23: OR_R	or 	%r3, %r5, %r21
	.word 0xb000e49b  ! 23: ADD_I	add 	%r3, 0x049b, %r24
	.word 0x9a10ee90  ! 23: OR_I	or 	%r3, 0x0e90, %r13
	.word 0xba090005  ! 23: AND_R	and 	%r4, %r5, %r29
	.word 0xb0088005  ! 23: AND_R	and 	%r2, %r5, %r24
	.word 0xa0008005  ! 23: ADD_R	add 	%r2, %r5, %r16
	.word 0xa61128ed  ! 23: OR_I	or 	%r4, 0x08ed, %r19
	.word 0x9c00a1f1  ! 23: ADD_I	add 	%r2, 0x01f1, %r14
	.word 0x9c092d12  ! 23: AND_I	and 	%r4, 0x0d12, %r14
	.word 0xac110005  ! 23: OR_R	or 	%r4, %r5, %r22
	.word 0xac00a9f3  ! 23: ADD_I	add 	%r2, 0x09f3, %r22
	.word 0xb208abc5  ! 23: AND_I	and 	%r2, 0x0bc5, %r25
	.word 0xb8008005  ! 23: ADD_R	add 	%r2, %r5, %r28
	.word 0xae018005  ! 23: ADD_R	add 	%r6, %r5, %r23
	.word 0xa800ecbc  ! 23: ADD_I	add 	%r3, 0x0cbc, %r20
	.word 0xa4010005  ! 23: ADD_R	add 	%r4, %r5, %r18
	.word 0xb809a704  ! 23: AND_I	and 	%r6, 0x0704, %r28
	.word 0xb6008005  ! 23: ADD_R	add 	%r2, %r5, %r27
	.word 0xb808a528  ! 23: AND_I	and 	%r2, 0x0528, %r28
	.word 0xac00c005  ! 23: ADD_R	add 	%r3, %r5, %r22
	.word 0xbe00ab47  ! 23: ADD_I	add 	%r2, 0x0b47, %r31
	.word 0x9e090005  ! 23: AND_R	and 	%r4, %r5, %r15
	.word 0xb611e82a  ! 23: OR_I	or 	%r7, 0x082a, %r27
	.word 0xbe110005  ! 23: OR_R	or 	%r4, %r5, %r31
	.word 0xaa00c005  ! 23: ADD_R	add 	%r3, %r5, %r21
	.word 0xae098005  ! 23: AND_R	and 	%r6, %r5, %r23
	.word 0xba10a6ea  ! 23: OR_I	or 	%r2, 0x06ea, %r29
	.word 0xb408aa5a  ! 23: AND_I	and 	%r2, 0x0a5a, %r26
	.word 0xb208c005  ! 23: AND_R	and 	%r3, %r5, %r25
	.word 0xba00a779  ! 23: ADD_I	add 	%r2, 0x0779, %r29
	.word 0xa810c005  ! 23: OR_R	or 	%r3, %r5, %r20
	.word 0xae008005  ! 23: ADD_R	add 	%r2, %r5, %r23
	.word 0xbe08a7e7  ! 23: AND_I	and 	%r2, 0x07e7, %r31
	.word 0xa809e8a3  ! 23: AND_I	and 	%r7, 0x08a3, %r20
	.word 0xac108005  ! 23: OR_R	or 	%r2, %r5, %r22
	.word 0xa400a199  ! 23: ADD_I	add 	%r2, 0x0199, %r18
	.word 0xac09a4f6  ! 23: AND_I	and 	%r6, 0x04f6, %r22
	.word 0xb4108005  ! 23: OR_R	or 	%r2, %r5, %r26
	.word 0x9a00a241  ! 23: ADD_I	add 	%r2, 0x0241, %r13
	.word 0xb611c005  ! 23: OR_R	or 	%r7, %r5, %r27
	.word 0xac10c005  ! 23: OR_R	or 	%r3, %r5, %r22
	.word 0xa6118005  ! 23: OR_R	or 	%r6, %r5, %r19
	.word 0xa408c005  ! 23: AND_R	and 	%r3, %r5, %r18
	.word 0xa201c005  ! 23: ADD_R	add 	%r7, %r5, %r17
	.word 0xb008c005  ! 23: AND_R	and 	%r3, %r5, %r24
	.word 0xa410a74f  ! 23: OR_I	or 	%r2, 0x074f, %r18
	.word 0xba10af88  ! 23: OR_I	or 	%r2, 0x0f88, %r29
	.word 0x9e012429  ! 23: ADD_I	add 	%r4, 0x0429, %r15
	.word 0x9a108005  ! 23: OR_R	or 	%r2, %r5, %r13
	.word 0xae110005  ! 23: OR_R	or 	%r4, %r5, %r23
	.word 0xbc09a4a5  ! 23: AND_I	and 	%r6, 0x04a5, %r30
	.word 0xa811acfb  ! 23: OR_I	or 	%r6, 0x0cfb, %r20
	.word 0xa2098005  ! 23: AND_R	and 	%r6, %r5, %r17
	.word 0xaa08a58a  ! 23: AND_I	and 	%r2, 0x058a, %r21
	.word 0x9a11acd7  ! 23: OR_I	or 	%r6, 0x0cd7, %r13
	.word 0xa808c005  ! 23: AND_R	and 	%r3, %r5, %r20
	.word 0xae11c005  ! 23: OR_R	or 	%r7, %r5, %r23
	.word 0xa411e3b4  ! 23: OR_I	or 	%r7, 0x03b4, %r18
	.word 0x9e018005  ! 23: ADD_R	add 	%r6, %r5, %r15
	.word 0xb601e5a9  ! 23: ADD_I	add 	%r7, 0x05a9, %r27
	.word 0xb400a1b7  ! 23: ADD_I	add 	%r2, 0x01b7, %r26
	.word 0xb2010005  ! 23: ADD_R	add 	%r4, %r5, %r25
	.word 0xaa01e2b5  ! 23: ADD_I	add 	%r7, 0x02b5, %r21
	.word 0xac0920f5  ! 23: AND_I	and 	%r4, 0x00f5, %r22
	.word 0xa2110005  ! 23: OR_R	or 	%r4, %r5, %r17
	.word 0xb4108005  ! 23: OR_R	or 	%r2, %r5, %r26
	.word 0xb201a647  ! 23: ADD_I	add 	%r6, 0x0647, %r25
	.word 0xae012cd0  ! 23: ADD_I	add 	%r4, 0x0cd0, %r23
	.word 0xb600ebb1  ! 23: ADD_I	add 	%r3, 0x0bb1, %r27
	.word 0xac09a8b1  ! 23: AND_I	and 	%r6, 0x08b1, %r22
	.word 0xa601ae24  ! 23: ADD_I	add 	%r6, 0x0e24, %r19
	.word 0xb8008005  ! 23: ADD_R	add 	%r2, %r5, %r28
	.word 0xb200ac97  ! 23: ADD_I	add 	%r2, 0x0c97, %r25
	.word 0xb0088005  ! 23: AND_R	and 	%r2, %r5, %r24
	.word 0xb011c005  ! 23: OR_R	or 	%r7, %r5, %r24
	.word 0xa6008005  ! 23: ADD_R	add 	%r2, %r5, %r19
	.word 0xa609c005  ! 23: AND_R	and 	%r7, %r5, %r19
	.word 0xb4088005  ! 23: AND_R	and 	%r2, %r5, %r26
	.word 0xb000ea60  ! 23: ADD_I	add 	%r3, 0x0a60, %r24
	.word 0xb001aa62  ! 23: ADD_I	add 	%r6, 0x0a62, %r24
	.word 0xbc01e7c0  ! 23: ADD_I	add 	%r7, 0x07c0, %r30
	.word 0x9a092626  ! 23: AND_I	and 	%r4, 0x0626, %r13
	.word 0xac088005  ! 23: AND_R	and 	%r2, %r5, %r22
	.word 0x9c088005  ! 23: AND_R	and 	%r2, %r5, %r14
	.word 0xa6090005  ! 23: AND_R	and 	%r4, %r5, %r19
	.word 0xa4012349  ! 23: ADD_I	add 	%r4, 0x0349, %r18
	.word 0xa610c005  ! 23: OR_R	or 	%r3, %r5, %r19
	.word 0x9c08aabf  ! 23: AND_I	and 	%r2, 0x0abf, %r14
	.word 0xb4108005  ! 23: OR_R	or 	%r2, %r5, %r26
	.word 0xa2012fa5  ! 23: ADD_I	add 	%r4, 0x0fa5, %r17
	.word 0xa600a9ba  ! 23: ADD_I	add 	%r2, 0x09ba, %r19
	.word 0xaa09aa67  ! 23: AND_I	and 	%r6, 0x0a67, %r21
	.word 0xbc00c005  ! 23: ADD_R	add 	%r3, %r5, %r30
	.word 0xac08a80c  ! 23: AND_I	and 	%r2, 0x080c, %r22
	.word 0xaa108005  ! 23: OR_R	or 	%r2, %r5, %r21
	.word 0xa0108005  ! 23: OR_R	or 	%r2, %r5, %r16
	.word 0xa2088005  ! 23: AND_R	and 	%r2, %r5, %r17
	.word 0xb2018005  ! 23: ADD_R	add 	%r6, %r5, %r25
	.word 0xba012bff  ! 23: ADD_I	add 	%r4, 0x0bff, %r29
	.word 0xb2090005  ! 23: AND_R	and 	%r4, %r5, %r25
	.word 0xba11278f  ! 23: OR_I	or 	%r4, 0x078f, %r29
	.word 0xb8010005  ! 23: ADD_R	add 	%r4, %r5, %r28
	.word 0xbe01aab6  ! 23: ADD_I	add 	%r6, 0x0ab6, %r31
	.word 0x9e08af3f  ! 23: AND_I	and 	%r2, 0x0f3f, %r15
	.word 0xb008c005  ! 23: AND_R	and 	%r3, %r5, %r24
	.word 0xba088005  ! 23: AND_R	and 	%r2, %r5, %r29
	.word 0xaa108005  ! 23: OR_R	or 	%r2, %r5, %r21
	.word 0x9a008005  ! 23: ADD_R	add 	%r2, %r5, %r13
	.word 0xac09a3c2  ! 23: AND_I	and 	%r6, 0x03c2, %r22
	.word 0xa8088005  ! 23: AND_R	and 	%r2, %r5, %r20
	.word 0xa8010005  ! 23: ADD_R	add 	%r4, %r5, %r20
	.word 0x9a098005  ! 23: AND_R	and 	%r6, %r5, %r13
	.word 0xae08e65f  ! 23: AND_I	and 	%r3, 0x065f, %r23
	.word 0x9e108005  ! 23: OR_R	or 	%r2, %r5, %r15
	.word 0xae112f74  ! 23: OR_I	or 	%r4, 0x0f74, %r23
	.word 0xb410afca  ! 23: OR_I	or 	%r2, 0x0fca, %r26
	.word 0xbe10c005  ! 23: OR_R	or 	%r3, %r5, %r31
	.word 0xa4088005  ! 23: AND_R	and 	%r2, %r5, %r18
	.word 0xb410e58b  ! 23: OR_I	or 	%r3, 0x058b, %r26
	.word 0xa4018005  ! 23: ADD_R	add 	%r6, %r5, %r18
	.word 0xa010a400  ! 23: OR_I	or 	%r2, 0x0400, %r16
	.word 0xb011ae3c  ! 23: OR_I	or 	%r6, 0x0e3c, %r24
	.word 0xa801ee43  ! 23: ADD_I	add 	%r7, 0x0e43, %r20
	.word 0xac018005  ! 23: ADD_R	add 	%r6, %r5, %r22
	.word 0xb0010005  ! 23: ADD_R	add 	%r4, %r5, %r24
	.word 0x9c11a8a8  ! 23: OR_I	or 	%r6, 0x08a8, %r14
	.word 0xbc108005  ! 23: OR_R	or 	%r2, %r5, %r30
	.word 0x9e088005  ! 23: AND_R	and 	%r2, %r5, %r15
	.word 0xfa212148  ! 23: STW_I	stw	%r29, [%r4 + 0x0148]
	.word 0xf820a408  ! 23: STW_I	stw	%r28, [%r2 + 0x0408]
	.word 0xf430e986  ! 23: STH_I	sth	%r26, [%r3 + 0x0986]
	.word 0xee29e07b  ! 23: STB_I	stb	%r23, [%r7 + 0x007b]
IRF_CE_11:
!$EV error(3,expr(@VA(.MAIN.IRF_CE_11), 16, 16), 1,IRF,ce,26,x, x,x,x, x,x,x)
!$EV error(3,expr(@VA(.MAIN.IRF_CE_11), 16, 16), 3,IRF,ce,11,x, x,x,x, x,x,x)
	.word 0xf0312db4  ! 23: STH_I	sth	%r24, [%r4 + 0x0db4]
	.word 0xf230efaa  ! 23: STH_I	sth	%r25, [%r3 + 0x0faa]
	.word 0xf821abd0  ! 23: STW_I	stw	%r28, [%r6 + 0x0bd0]
	.word 0xe6f9d005  ! 23: SWAPA_R	swapa	%r19, [%r7 + %r5] 0x80
	.word 0x9a09a681  ! 23: AND_I	and 	%r6, 0x0681, %r13
	.word 0x9c108005  ! 23: OR_R	or 	%r2, %r5, %r14
	bne thr3_loop_2
	subcc %g1, 0x1, %g1
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr3_loop_3:
	.word 0xae088005  ! 30: AND_R	and 	%r2, %r5, %r23
	.word 0xa8118005  ! 30: OR_R	or 	%r6, %r5, %r20
	.word 0x9c10c005  ! 30: OR_R	or 	%r3, %r5, %r14
	.word 0xb800a751  ! 30: ADD_I	add 	%r2, 0x0751, %r28
	.word 0xbe098005  ! 30: AND_R	and 	%r6, %r5, %r31
	.word 0xbc08a298  ! 30: AND_I	and 	%r2, 0x0298, %r30
	.word 0xa8088005  ! 30: AND_R	and 	%r2, %r5, %r20
	.word 0xa40923bf  ! 30: AND_I	and 	%r4, 0x03bf, %r18
	.word 0x9a10a5d0  ! 30: OR_I	or 	%r2, 0x05d0, %r13
	.word 0xa2108005  ! 30: OR_R	or 	%r2, %r5, %r17
	.word 0xac008005  ! 30: ADD_R	add 	%r2, %r5, %r22
	.word 0xba08e2d5  ! 30: AND_I	and 	%r3, 0x02d5, %r29
	.word 0xbe11e86e  ! 30: OR_I	or 	%r7, 0x086e, %r31
	.word 0xbc088005  ! 30: AND_R	and 	%r2, %r5, %r30
	.word 0x9c01a46e  ! 30: ADD_I	add 	%r6, 0x046e, %r14
	.word 0xae118005  ! 30: OR_R	or 	%r6, %r5, %r23
	.word 0xb2088005  ! 30: AND_R	and 	%r2, %r5, %r25
	.word 0xac00c005  ! 30: ADD_R	add 	%r3, %r5, %r22
	.word 0xba108005  ! 30: OR_R	or 	%r2, %r5, %r29
	.word 0xbc10e1fd  ! 30: OR_I	or 	%r3, 0x01fd, %r30
	.word 0xb808e5a1  ! 30: AND_I	and 	%r3, 0x05a1, %r28
	.word 0xba00aaac  ! 30: ADD_I	add 	%r2, 0x0aac, %r29
	.word 0xa210c005  ! 30: OR_R	or 	%r3, %r5, %r17
	.word 0xa8008005  ! 30: ADD_R	add 	%r2, %r5, %r20
	.word 0xb610a423  ! 30: OR_I	or 	%r2, 0x0423, %r27
	.word 0xb200a097  ! 30: ADD_I	add 	%r2, 0x0097, %r25
	.word 0xb2090005  ! 30: AND_R	and 	%r4, %r5, %r25
	.word 0xb011a916  ! 30: OR_I	or 	%r6, 0x0916, %r24
	.word 0x9c012b93  ! 30: ADD_I	add 	%r4, 0x0b93, %r14
	.word 0xb008c005  ! 30: AND_R	and 	%r3, %r5, %r24
	.word 0xb8010005  ! 30: ADD_R	add 	%r4, %r5, %r28
	.word 0xbe09e2be  ! 30: AND_I	and 	%r7, 0x02be, %r31
	.word 0xba092dc1  ! 30: AND_I	and 	%r4, 0x0dc1, %r29
	.word 0xb009a708  ! 30: AND_I	and 	%r6, 0x0708, %r24
	.word 0x9a08e5ea  ! 30: AND_I	and 	%r3, 0x05ea, %r13
	.word 0xb808c005  ! 30: AND_R	and 	%r3, %r5, %r28
	.word 0xaa012f60  ! 30: ADD_I	add 	%r4, 0x0f60, %r21
	.word 0xa401282d  ! 30: ADD_I	add 	%r4, 0x082d, %r18
	.word 0xa400c005  ! 30: ADD_R	add 	%r3, %r5, %r18
	.word 0xb600e51d  ! 30: ADD_I	add 	%r3, 0x051d, %r27
	.word 0xa400ec24  ! 30: ADD_I	add 	%r3, 0x0c24, %r18
	.word 0xbc01e441  ! 30: ADD_I	add 	%r7, 0x0441, %r30
	.word 0xb409eb47  ! 30: AND_I	and 	%r7, 0x0b47, %r26
	.word 0xb410c005  ! 30: OR_R	or 	%r3, %r5, %r26
	.word 0xaa00c005  ! 30: ADD_R	add 	%r3, %r5, %r21
	.word 0xa408c005  ! 30: AND_R	and 	%r3, %r5, %r18
	.word 0xa6088005  ! 30: AND_R	and 	%r2, %r5, %r19
	.word 0x9e08aaff  ! 30: AND_I	and 	%r2, 0x0aff, %r15
	.word 0xb609a586  ! 30: AND_I	and 	%r6, 0x0586, %r27
	.word 0xbc010005  ! 30: ADD_R	add 	%r4, %r5, %r30
	.word 0xaa008005  ! 30: ADD_R	add 	%r2, %r5, %r21
	.word 0x9a10a25f  ! 30: OR_I	or 	%r2, 0x025f, %r13
	.word 0xb601e331  ! 30: ADD_I	add 	%r7, 0x0331, %r27
	.word 0xac08a824  ! 30: AND_I	and 	%r2, 0x0824, %r22
	.word 0xa000af31  ! 30: ADD_I	add 	%r2, 0x0f31, %r16
	.word 0x9c11c005  ! 30: OR_R	or 	%r7, %r5, %r14
	.word 0xa6018005  ! 30: ADD_R	add 	%r6, %r5, %r19
	.word 0xb800a186  ! 30: ADD_I	add 	%r2, 0x0186, %r28
	.word 0xa400c005  ! 30: ADD_R	add 	%r3, %r5, %r18
	.word 0xb008e0d8  ! 30: AND_I	and 	%r3, 0x00d8, %r24
	.word 0x9c010005  ! 30: ADD_R	add 	%r4, %r5, %r14
	.word 0xa408ea04  ! 30: AND_I	and 	%r3, 0x0a04, %r18
	.word 0xa4110005  ! 30: OR_R	or 	%r4, %r5, %r18
	.word 0x9c09a309  ! 30: AND_I	and 	%r6, 0x0309, %r14
	.word 0x9e008005  ! 30: ADD_R	add 	%r2, %r5, %r15
	.word 0xa409c005  ! 30: AND_R	and 	%r7, %r5, %r18
	.word 0xb009ed81  ! 30: AND_I	and 	%r7, 0x0d81, %r24
	.word 0xb009acdc  ! 30: AND_I	and 	%r6, 0x0cdc, %r24
	.word 0xa609a37b  ! 30: AND_I	and 	%r6, 0x037b, %r19
	.word 0xa410a378  ! 30: OR_I	or 	%r2, 0x0378, %r18
	.word 0xa611e2a3  ! 30: OR_I	or 	%r7, 0x02a3, %r19
	.word 0xac118005  ! 30: OR_R	or 	%r6, %r5, %r22
	.word 0xb601c005  ! 30: ADD_R	add 	%r7, %r5, %r27
	.word 0xb8098005  ! 30: AND_R	and 	%r6, %r5, %r28
	.word 0xac00a901  ! 30: ADD_I	add 	%r2, 0x0901, %r22
	.word 0xa801c005  ! 30: ADD_R	add 	%r7, %r5, %r20
	.word 0xba0923e0  ! 30: AND_I	and 	%r4, 0x03e0, %r29
	.word 0xa610a26e  ! 30: OR_I	or 	%r2, 0x026e, %r19
	.word 0xa808abd6  ! 30: AND_I	and 	%r2, 0x0bd6, %r20
	.word 0xb208c005  ! 30: AND_R	and 	%r3, %r5, %r25
	.word 0x9e08a242  ! 30: AND_I	and 	%r2, 0x0242, %r15
	.word 0xa0088005  ! 30: AND_R	and 	%r2, %r5, %r16
	.word 0xb208abf1  ! 30: AND_I	and 	%r2, 0x0bf1, %r25
	.word 0xa610adce  ! 30: OR_I	or 	%r2, 0x0dce, %r19
	.word 0xbc088005  ! 30: AND_R	and 	%r2, %r5, %r30
	.word 0xba118005  ! 30: OR_R	or 	%r6, %r5, %r29
	.word 0x9e008005  ! 30: ADD_R	add 	%r2, %r5, %r15
	.word 0xb4108005  ! 30: OR_R	or 	%r2, %r5, %r26
	.word 0xaa11a473  ! 30: OR_I	or 	%r6, 0x0473, %r21
	.word 0xb611ab45  ! 30: OR_I	or 	%r6, 0x0b45, %r27
	.word 0x9c00a62c  ! 30: ADD_I	add 	%r2, 0x062c, %r14
	.word 0xbe00c005  ! 30: ADD_R	add 	%r3, %r5, %r31
	.word 0xaa11c005  ! 30: OR_R	or 	%r7, %r5, %r21
	.word 0xae08e075  ! 30: AND_I	and 	%r3, 0x0075, %r23
	.word 0xb2112c06  ! 30: OR_I	or 	%r4, 0x0c06, %r25
	.word 0xbe11c005  ! 30: OR_R	or 	%r7, %r5, %r31
	.word 0xa011eaa2  ! 30: OR_I	or 	%r7, 0x0aa2, %r16
	.word 0xbe110005  ! 30: OR_R	or 	%r4, %r5, %r31
	.word 0xa208e918  ! 30: AND_I	and 	%r3, 0x0918, %r17
	.word 0xbc088005  ! 30: AND_R	and 	%r2, %r5, %r30
	.word 0xb809ee0a  ! 30: AND_I	and 	%r7, 0x0e0a, %r28
	.word 0xa4108005  ! 30: OR_R	or 	%r2, %r5, %r18
	.word 0xbe10aba6  ! 30: OR_I	or 	%r2, 0x0ba6, %r31
	.word 0xbc010005  ! 30: ADD_R	add 	%r4, %r5, %r30
	.word 0xbe01ebbb  ! 30: ADD_I	add 	%r7, 0x0bbb, %r31
	.word 0xbc10ab61  ! 30: OR_I	or 	%r2, 0x0b61, %r30
	.word 0x9e11c005  ! 30: OR_R	or 	%r7, %r5, %r15
	.word 0x9e08a7c8  ! 30: AND_I	and 	%r2, 0x07c8, %r15
	.word 0xaa11ad92  ! 30: OR_I	or 	%r6, 0x0d92, %r21
	.word 0xb610eae4  ! 30: OR_I	or 	%r3, 0x0ae4, %r27
	.word 0xa810c005  ! 30: OR_R	or 	%r3, %r5, %r20
	.word 0xbe09c005  ! 30: AND_R	and 	%r7, %r5, %r31
	.word 0xb400a534  ! 30: ADD_I	add 	%r2, 0x0534, %r26
	.word 0xb609aed7  ! 30: AND_I	and 	%r6, 0x0ed7, %r27
	.word 0xa000c005  ! 30: ADD_R	add 	%r3, %r5, %r16
	.word 0xb8090005  ! 30: AND_R	and 	%r4, %r5, %r28
	.word 0xa011c005  ! 30: OR_R	or 	%r7, %r5, %r16
	.word 0xa4110005  ! 30: OR_R	or 	%r4, %r5, %r18
	.word 0xa201ac39  ! 30: ADD_I	add 	%r6, 0x0c39, %r17
	.word 0xb410a06b  ! 30: OR_I	or 	%r2, 0x006b, %r26
	.word 0xac110005  ! 30: OR_R	or 	%r4, %r5, %r22
	.word 0xae00a26a  ! 30: ADD_I	add 	%r2, 0x026a, %r23
	.word 0xb801c005  ! 30: ADD_R	add 	%r7, %r5, %r28
	.word 0x9e012f57  ! 30: ADD_I	add 	%r4, 0x0f57, %r15
	.word 0x9c108005  ! 30: OR_R	or 	%r2, %r5, %r14
	.word 0xa4008005  ! 30: ADD_R	add 	%r2, %r5, %r18
	.word 0xaa00c005  ! 30: ADD_R	add 	%r3, %r5, %r21
	.word 0xa611c005  ! 30: OR_R	or 	%r7, %r5, %r19
	.word 0x9c012fcd  ! 30: ADD_I	add 	%r4, 0x0fcd, %r14
	.word 0xae09c005  ! 30: AND_R	and 	%r7, %r5, %r23
	.word 0xb608ae68  ! 30: AND_I	and 	%r2, 0x0e68, %r27
	.word 0xb4012c79  ! 30: ADD_I	add 	%r4, 0x0c79, %r26
	.word 0xac10e8dd  ! 30: OR_I	or 	%r3, 0x08dd, %r22
	.word 0xac108005  ! 30: OR_R	or 	%r2, %r5, %r22
	.word 0xa810e00f  ! 30: OR_I	or 	%r3, 0x000f, %r20
	.word 0xb6090005  ! 30: AND_R	and 	%r4, %r5, %r27
	.word 0x9c090005  ! 30: AND_R	and 	%r4, %r5, %r14
	.word 0xb8108005  ! 30: OR_R	or 	%r2, %r5, %r28
	.word 0xa0118005  ! 30: OR_R	or 	%r6, %r5, %r16
	.word 0xa208af4c  ! 30: AND_I	and 	%r2, 0x0f4c, %r17
	.word 0xb41124a9  ! 30: OR_I	or 	%r4, 0x04a9, %r26
	.word 0xa2008005  ! 30: ADD_R	add 	%r2, %r5, %r17
	.word 0x9e10afdd  ! 30: OR_I	or 	%r2, 0x0fdd, %r15
	.word 0xb809c005  ! 30: AND_R	and 	%r7, %r5, %r28
	.word 0xb600a1c8  ! 30: ADD_I	add 	%r2, 0x01c8, %r27
	.word 0xae098005  ! 30: AND_R	and 	%r6, %r5, %r23
	.word 0xb2108005  ! 30: OR_R	or 	%r2, %r5, %r25
	.word 0xbe108005  ! 30: OR_R	or 	%r2, %r5, %r31
	.word 0xbc088005  ! 30: AND_R	and 	%r2, %r5, %r30
	.word 0xb608c005  ! 30: AND_R	and 	%r3, %r5, %r27
	.word 0xb401ec72  ! 30: ADD_I	add 	%r7, 0x0c72, %r26
	.word 0xba09e6da  ! 30: AND_I	and 	%r7, 0x06da, %r29
	.word 0xba00e686  ! 30: ADD_I	add 	%r3, 0x0686, %r29
	.word 0xac008005  ! 30: ADD_R	add 	%r2, %r5, %r22
	.word 0xb608ec5d  ! 30: AND_I	and 	%r3, 0x0c5d, %r27
	.word 0xae11e721  ! 30: OR_I	or 	%r7, 0x0721, %r23
	.word 0xb4092fb4  ! 30: AND_I	and 	%r4, 0x0fb4, %r26
	.word 0xbc088005  ! 30: AND_R	and 	%r2, %r5, %r30
	.word 0xa4118005  ! 30: OR_R	or 	%r6, %r5, %r18
	.word 0xac00a488  ! 30: ADD_I	add 	%r2, 0x0488, %r22
	.word 0x9e108005  ! 30: OR_R	or 	%r2, %r5, %r15
	.word 0xa408e075  ! 30: AND_I	and 	%r3, 0x0075, %r18
	.word 0xa811ea54  ! 30: OR_I	or 	%r7, 0x0a54, %r20
	.word 0xa410c005  ! 30: OR_R	or 	%r3, %r5, %r18
	.word 0xa0112a80  ! 30: OR_I	or 	%r4, 0x0a80, %r16
	.word 0xa810c005  ! 30: OR_R	or 	%r3, %r5, %r20
	.word 0xb4088005  ! 30: AND_R	and 	%r2, %r5, %r26
	.word 0x9e08a5cd  ! 30: AND_I	and 	%r2, 0x05cd, %r15
	.word 0x9a1123ac  ! 30: OR_I	or 	%r4, 0x03ac, %r13
	.word 0xb411a59b  ! 30: OR_I	or 	%r6, 0x059b, %r26
	.word 0xb608aaa3  ! 30: AND_I	and 	%r2, 0x0aa3, %r27
	.word 0xac11ee41  ! 30: OR_I	or 	%r7, 0x0e41, %r22
	.word 0x9e11e5ea  ! 30: OR_I	or 	%r7, 0x05ea, %r15
	.word 0xa0118005  ! 30: OR_R	or 	%r6, %r5, %r16
	.word 0xb611eb66  ! 30: OR_I	or 	%r7, 0x0b66, %r27
	.word 0x9e11a6d9  ! 30: OR_I	or 	%r6, 0x06d9, %r15
	.word 0xaa108005  ! 30: OR_R	or 	%r2, %r5, %r21
	.word 0x9e08c005  ! 30: AND_R	and 	%r3, %r5, %r15
	.word 0xba0123ad  ! 30: ADD_I	add 	%r4, 0x03ad, %r29
	.word 0xae088005  ! 30: AND_R	and 	%r2, %r5, %r23
	.word 0xa4110005  ! 30: OR_R	or 	%r4, %r5, %r18
	.word 0xb00125ed  ! 30: ADD_I	add 	%r4, 0x05ed, %r24
	.word 0xb4108005  ! 30: OR_R	or 	%r2, %r5, %r26
	.word 0xa20920c6  ! 30: AND_I	and 	%r4, 0x00c6, %r17
	.word 0xa000a0f6  ! 30: ADD_I	add 	%r2, 0x00f6, %r16
	.word 0xa810ab44  ! 30: OR_I	or 	%r2, 0x0b44, %r20
	.word 0x9e008005  ! 30: ADD_R	add 	%r2, %r5, %r15
	.word 0xa409e9d3  ! 30: AND_I	and 	%r7, 0x09d3, %r18
	.word 0xaa00c005  ! 30: ADD_R	add 	%r3, %r5, %r21
	.word 0x9a00c005  ! 30: ADD_R	add 	%r3, %r5, %r13
	.word 0x9c00a4cb  ! 30: ADD_I	add 	%r2, 0x04cb, %r14
	.word 0xbe0126ea  ! 30: ADD_I	add 	%r4, 0x06ea, %r31
	.word 0xe420eee0  ! 30: STW_I	stw	%r18, [%r3 + 0x0ee0]
	.word 0xec71a578  ! 30: STX_I	stx	%r22, [%r6 + 0x0578]
	.word 0xe420e1b8  ! 30: STW_I	stw	%r18, [%r3 + 0x01b8]
	.word 0xf471e478  ! 30: STX_I	stx	%r26, [%r7 + 0x0478]
IRF_CE_15:
!$EV error(3,expr(@VA(.MAIN.IRF_CE_15), 16, 16), 1,IRF,ce,19,x, x,x,x, x,x,x)
!$EV error(3,expr(@VA(.MAIN.IRF_CE_15), 16, 16), 3,IRF,ce,63,x, x,x,x, x,x,x)
	.word 0xee21a918  ! 30: STW_I	stw	%r23, [%r6 + 0x0918]
	.word 0xee31ab42  ! 30: STH_I	sth	%r23, [%r6 + 0x0b42]
	.word 0xda30a09e  ! 30: STH_I	sth	%r13, [%r2 + 0x009e]
	.word 0xe6e8d005  ! 30: LDSTUBA_R	ldstuba	%r19, [%r3 + %r5] 0x80
	.word 0xb809a0a5  ! 30: AND_I	and 	%r6, 0x00a5, %r28
	.word 0x9c11c005  ! 30: OR_R	or 	%r7, %r5, %r14
	bne thr3_loop_3
	subcc %g1, 0x1, %g1
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr3_loop_4:
	.word 0xa408e66c  ! 37: AND_I	and 	%r3, 0x066c, %r18
	.word 0xae00a118  ! 37: ADD_I	add 	%r2, 0x0118, %r23
	.word 0xbe108005  ! 37: OR_R	or 	%r2, %r5, %r31
	.word 0xa0018005  ! 37: ADD_R	add 	%r6, %r5, %r16
	.word 0xba09e16a  ! 37: AND_I	and 	%r7, 0x016a, %r29
	.word 0x9e110005  ! 37: OR_R	or 	%r4, %r5, %r15
	.word 0xa009edfd  ! 37: AND_I	and 	%r7, 0x0dfd, %r16
	.word 0x9e118005  ! 37: OR_R	or 	%r6, %r5, %r15
	.word 0xa808a75f  ! 37: AND_I	and 	%r2, 0x075f, %r20
	.word 0x9e10add6  ! 37: OR_I	or 	%r2, 0x0dd6, %r15
	.word 0xb8108005  ! 37: OR_R	or 	%r2, %r5, %r28
	.word 0xb008ea2b  ! 37: AND_I	and 	%r3, 0x0a2b, %r24
	.word 0xae10a110  ! 37: OR_I	or 	%r2, 0x0110, %r23
	.word 0x9e088005  ! 37: AND_R	and 	%r2, %r5, %r15
	.word 0xa810c005  ! 37: OR_R	or 	%r3, %r5, %r20
	.word 0xac11ab74  ! 37: OR_I	or 	%r6, 0x0b74, %r22
	.word 0xa410ad4a  ! 37: OR_I	or 	%r2, 0x0d4a, %r18
	.word 0xac008005  ! 37: ADD_R	add 	%r2, %r5, %r22
	.word 0xaa08a485  ! 37: AND_I	and 	%r2, 0x0485, %r21
	.word 0x9e018005  ! 37: ADD_R	add 	%r6, %r5, %r15
	.word 0xaa09eb0c  ! 37: AND_I	and 	%r7, 0x0b0c, %r21
	.word 0x9e11c005  ! 37: OR_R	or 	%r7, %r5, %r15
	.word 0xbc110005  ! 37: OR_R	or 	%r4, %r5, %r30
	.word 0xa408ac39  ! 37: AND_I	and 	%r2, 0x0c39, %r18
	.word 0xb6112f84  ! 37: OR_I	or 	%r4, 0x0f84, %r27
	.word 0xb800eb7c  ! 37: ADD_I	add 	%r3, 0x0b7c, %r28
	.word 0xae108005  ! 37: OR_R	or 	%r2, %r5, %r23
	.word 0xb409ab67  ! 37: AND_I	and 	%r6, 0x0b67, %r26
	.word 0xa600c005  ! 37: ADD_R	add 	%r3, %r5, %r19
	.word 0xb210ab29  ! 37: OR_I	or 	%r2, 0x0b29, %r25
	.word 0xb600eb18  ! 37: ADD_I	add 	%r3, 0x0b18, %r27
	.word 0xb0108005  ! 37: OR_R	or 	%r2, %r5, %r24
	.word 0xb210a115  ! 37: OR_I	or 	%r2, 0x0115, %r25
	.word 0xa409a343  ! 37: AND_I	and 	%r6, 0x0343, %r18
	.word 0xbc10a910  ! 37: OR_I	or 	%r2, 0x0910, %r30
	.word 0xb201abfa  ! 37: ADD_I	add 	%r6, 0x0bfa, %r25
	.word 0xa8010005  ! 37: ADD_R	add 	%r4, %r5, %r20
	.word 0xaa112f5f  ! 37: OR_I	or 	%r4, 0x0f5f, %r21
	.word 0xbe00c005  ! 37: ADD_R	add 	%r3, %r5, %r31
	.word 0xb4010005  ! 37: ADD_R	add 	%r4, %r5, %r26
	.word 0xbe088005  ! 37: AND_R	and 	%r2, %r5, %r31
	.word 0x9c10e27d  ! 37: OR_I	or 	%r3, 0x027d, %r14
	.word 0xb608afc9  ! 37: AND_I	and 	%r2, 0x0fc9, %r27
	.word 0xb408ed8b  ! 37: AND_I	and 	%r3, 0x0d8b, %r26
	.word 0x9e09ecd6  ! 37: AND_I	and 	%r7, 0x0cd6, %r15
	.word 0xbc00a309  ! 37: ADD_I	add 	%r2, 0x0309, %r30
	.word 0xb4010005  ! 37: ADD_R	add 	%r4, %r5, %r26
	.word 0xb610ac06  ! 37: OR_I	or 	%r2, 0x0c06, %r27
	.word 0xb610ab21  ! 37: OR_I	or 	%r2, 0x0b21, %r27
	.word 0x9e01a450  ! 37: ADD_I	add 	%r6, 0x0450, %r15
	.word 0xaa112a3b  ! 37: OR_I	or 	%r4, 0x0a3b, %r21
	.word 0xa200c005  ! 37: ADD_R	add 	%r3, %r5, %r17
	.word 0xb80923d6  ! 37: AND_I	and 	%r4, 0x03d6, %r28
	.word 0xb809216c  ! 37: AND_I	and 	%r4, 0x016c, %r28
	.word 0xb810ae01  ! 37: OR_I	or 	%r2, 0x0e01, %r28
	.word 0xa010e644  ! 37: OR_I	or 	%r3, 0x0644, %r16
	.word 0xa000c005  ! 37: ADD_R	add 	%r3, %r5, %r16
	.word 0xbe08c005  ! 37: AND_R	and 	%r3, %r5, %r31
	.word 0xaa010005  ! 37: ADD_R	add 	%r4, %r5, %r21
	.word 0xa4108005  ! 37: OR_R	or 	%r2, %r5, %r18
	.word 0x9c09241e  ! 37: AND_I	and 	%r4, 0x041e, %r14
	.word 0xb0112c39  ! 37: OR_I	or 	%r4, 0x0c39, %r24
	.word 0xae108005  ! 37: OR_R	or 	%r2, %r5, %r23
	.word 0xb011ea8f  ! 37: OR_I	or 	%r7, 0x0a8f, %r24
	.word 0xb608c005  ! 37: AND_R	and 	%r3, %r5, %r27
	.word 0xa811e3b1  ! 37: OR_I	or 	%r7, 0x03b1, %r20
	.word 0xbc098005  ! 37: AND_R	and 	%r6, %r5, %r30
	.word 0xa0108005  ! 37: OR_R	or 	%r2, %r5, %r16
	.word 0xa011e238  ! 37: OR_I	or 	%r7, 0x0238, %r16
	.word 0xb801c005  ! 37: ADD_R	add 	%r7, %r5, %r28
	.word 0xbc11c005  ! 37: OR_R	or 	%r7, %r5, %r30
	.word 0xbc08e5f7  ! 37: AND_I	and 	%r3, 0x05f7, %r30
	.word 0xa410c005  ! 37: OR_R	or 	%r3, %r5, %r18
	.word 0xbc00ed6c  ! 37: ADD_I	add 	%r3, 0x0d6c, %r30
	.word 0x9e008005  ! 37: ADD_R	add 	%r2, %r5, %r15
	.word 0xbe118005  ! 37: OR_R	or 	%r6, %r5, %r31
	.word 0xb2092b02  ! 37: AND_I	and 	%r4, 0x0b02, %r25
	.word 0xaa08a7f5  ! 37: AND_I	and 	%r2, 0x07f5, %r21
	.word 0x9e10e15c  ! 37: OR_I	or 	%r3, 0x015c, %r15
	.word 0xa4008005  ! 37: ADD_R	add 	%r2, %r5, %r18
	.word 0xa400aaec  ! 37: ADD_I	add 	%r2, 0x0aec, %r18
	.word 0xa811e82c  ! 37: OR_I	or 	%r7, 0x082c, %r20
	.word 0xa608e8cb  ! 37: AND_I	and 	%r3, 0x08cb, %r19
	.word 0x9a0123e2  ! 37: ADD_I	add 	%r4, 0x03e2, %r13
	.word 0xba090005  ! 37: AND_R	and 	%r4, %r5, %r29
	.word 0xbc08aad3  ! 37: AND_I	and 	%r2, 0x0ad3, %r30
	.word 0xb201c005  ! 37: ADD_R	add 	%r7, %r5, %r25
	.word 0x9a08c005  ! 37: AND_R	and 	%r3, %r5, %r13
	.word 0x9c01abe3  ! 37: ADD_I	add 	%r6, 0x0be3, %r14
	.word 0x9a088005  ! 37: AND_R	and 	%r2, %r5, %r13
	.word 0xbc118005  ! 37: OR_R	or 	%r6, %r5, %r30
	.word 0xae10a181  ! 37: OR_I	or 	%r2, 0x0181, %r23
	.word 0xb209a0f7  ! 37: AND_I	and 	%r6, 0x00f7, %r25
	.word 0xa208e4ce  ! 37: AND_I	and 	%r3, 0x04ce, %r17
	.word 0x9c01c005  ! 37: ADD_R	add 	%r7, %r5, %r14
	.word 0xb411a4cd  ! 37: OR_I	or 	%r6, 0x04cd, %r26
	.word 0xb608e2f5  ! 37: AND_I	and 	%r3, 0x02f5, %r27
	.word 0xba088005  ! 37: AND_R	and 	%r2, %r5, %r29
	.word 0xac08e7b2  ! 37: AND_I	and 	%r3, 0x07b2, %r22
	.word 0x9a00c005  ! 37: ADD_R	add 	%r3, %r5, %r13
	.word 0x9c008005  ! 37: ADD_R	add 	%r2, %r5, %r14
	.word 0xb4018005  ! 37: ADD_R	add 	%r6, %r5, %r26
	.word 0xba09e3df  ! 37: AND_I	and 	%r7, 0x03df, %r29
	.word 0xb401abfd  ! 37: ADD_I	add 	%r6, 0x0bfd, %r26
	.word 0xbe01c005  ! 37: ADD_R	add 	%r7, %r5, %r31
	.word 0xa408ea41  ! 37: AND_I	and 	%r3, 0x0a41, %r18
	.word 0xb211abf9  ! 37: OR_I	or 	%r6, 0x0bf9, %r25
	.word 0x9e00ec11  ! 37: ADD_I	add 	%r3, 0x0c11, %r15
	.word 0xbc00ae61  ! 37: ADD_I	add 	%r2, 0x0e61, %r30
	.word 0x9c088005  ! 37: AND_R	and 	%r2, %r5, %r14
	.word 0xa8110005  ! 37: OR_R	or 	%r4, %r5, %r20
	.word 0x9e09eb4c  ! 37: AND_I	and 	%r7, 0x0b4c, %r15
	.word 0xb409c005  ! 37: AND_R	and 	%r7, %r5, %r26
	.word 0xa2098005  ! 37: AND_R	and 	%r6, %r5, %r17
	.word 0xbc11e6a8  ! 37: OR_I	or 	%r7, 0x06a8, %r30
	.word 0xba018005  ! 37: ADD_R	add 	%r6, %r5, %r29
	.word 0xae090005  ! 37: AND_R	and 	%r4, %r5, %r23
	.word 0xba10a8db  ! 37: OR_I	or 	%r2, 0x08db, %r29
	.word 0xac01c005  ! 37: ADD_R	add 	%r7, %r5, %r22
	.word 0xb8008005  ! 37: ADD_R	add 	%r2, %r5, %r28
	.word 0xb810a3a0  ! 37: OR_I	or 	%r2, 0x03a0, %r28
	.word 0xaa08aa43  ! 37: AND_I	and 	%r2, 0x0a43, %r21
	.word 0xae01a987  ! 37: ADD_I	add 	%r6, 0x0987, %r23
	.word 0xba112cab  ! 37: OR_I	or 	%r4, 0x0cab, %r29
	.word 0xa009e678  ! 37: AND_I	and 	%r7, 0x0678, %r16
	.word 0x9a118005  ! 37: OR_R	or 	%r6, %r5, %r13
	.word 0xa4012e63  ! 37: ADD_I	add 	%r4, 0x0e63, %r18
	.word 0xac00ac11  ! 37: ADD_I	add 	%r2, 0x0c11, %r22
	.word 0x9a08ac03  ! 37: AND_I	and 	%r2, 0x0c03, %r13
	.word 0xb401abd0  ! 37: ADD_I	add 	%r6, 0x0bd0, %r26
	.word 0xa0098005  ! 37: AND_R	and 	%r6, %r5, %r16
	.word 0xba08a346  ! 37: AND_I	and 	%r2, 0x0346, %r29
	.word 0xb6098005  ! 37: AND_R	and 	%r6, %r5, %r27
	.word 0xa0010005  ! 37: ADD_R	add 	%r4, %r5, %r16
	.word 0xa611ecf5  ! 37: OR_I	or 	%r7, 0x0cf5, %r19
	.word 0xac110005  ! 37: OR_R	or 	%r4, %r5, %r22
	.word 0xfc20a160  ! 37: STW_I	stw	%r30, [%r2 + 0x0160]
	.word 0xe621e084  ! 37: STW_I	stw	%r19, [%r7 + 0x0084]
	.word 0xf6312d00  ! 37: STH_I	sth	%r27, [%r4 + 0x0d00]
	.word 0xe470a300  ! 37: STX_I	stx	%r18, [%r2 + 0x0300]
IRF_CE_19:
!$EV error(3,expr(@VA(.MAIN.IRF_CE_19), 16, 16), 1,IRF,ce,28,x, x,x,x, x,x,x)
!$EV error(3,expr(@VA(.MAIN.IRF_CE_19), 16, 16), 3,IRF,ce,16,x, x,x,x, x,x,x)
	.word 0xf271ec60  ! 37: STX_I	stx	%r25, [%r7 + 0x0c60]
	.word 0xe870a8a0  ! 37: STX_I	stx	%r20, [%r2 + 0x08a0]
	.word 0xe270a680  ! 37: STX_I	stx	%r17, [%r2 + 0x0680]
	.word 0xe42124fc  ! 37: STW_I	stw	%r18, [%r4 + 0x04fc]
	.word 0xb011a416  ! 37: OR_I	or 	%r6, 0x0416, %r24
	.word 0x9a08c005  ! 37: AND_R	and 	%r3, %r5, %r13
	bne thr3_loop_4
	subcc %g1, 0x1, %g1
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr3_loop_5:
	.word 0xae11e31c  ! 44: OR_I	or 	%r7, 0x031c, %r23
	.word 0xb0090005  ! 44: AND_R	and 	%r4, %r5, %r24
	.word 0xb6010005  ! 44: ADD_R	add 	%r4, %r5, %r27
	.word 0xa001e864  ! 44: ADD_I	add 	%r7, 0x0864, %r16
	.word 0xb8008005  ! 44: ADD_R	add 	%r2, %r5, %r28
	.word 0xb808accc  ! 44: AND_I	and 	%r2, 0x0ccc, %r28
	.word 0x9c108005  ! 44: OR_R	or 	%r2, %r5, %r14
	.word 0xae09a4a5  ! 44: AND_I	and 	%r6, 0x04a5, %r23
	.word 0xba010005  ! 44: ADD_R	add 	%r4, %r5, %r29
	.word 0xa809a0cc  ! 44: AND_I	and 	%r6, 0x00cc, %r20
	.word 0x9e01c005  ! 44: ADD_R	add 	%r7, %r5, %r15
	.word 0xba09c005  ! 44: AND_R	and 	%r7, %r5, %r29
	.word 0xac01ea5c  ! 44: ADD_I	add 	%r7, 0x0a5c, %r22
	.word 0xb600c005  ! 44: ADD_R	add 	%r3, %r5, %r27
	.word 0xa609c005  ! 44: AND_R	and 	%r7, %r5, %r19
	.word 0xaa008005  ! 44: ADD_R	add 	%r2, %r5, %r21
	.word 0x9c09288e  ! 44: AND_I	and 	%r4, 0x088e, %r14
	.word 0x9e00ad62  ! 44: ADD_I	add 	%r2, 0x0d62, %r15
	.word 0x9c01e6a8  ! 44: ADD_I	add 	%r7, 0x06a8, %r14
	.word 0xae108005  ! 44: OR_R	or 	%r2, %r5, %r23
	.word 0xa200a232  ! 44: ADD_I	add 	%r2, 0x0232, %r17
	.word 0xa600e418  ! 44: ADD_I	add 	%r3, 0x0418, %r19
	.word 0xb4108005  ! 44: OR_R	or 	%r2, %r5, %r26
	.word 0x9c11aea8  ! 44: OR_I	or 	%r6, 0x0ea8, %r14
	.word 0x9e09efb9  ! 44: AND_I	and 	%r7, 0x0fb9, %r15
	.word 0x9c088005  ! 44: AND_R	and 	%r2, %r5, %r14
	.word 0xa010c005  ! 44: OR_R	or 	%r3, %r5, %r16
	.word 0xaa088005  ! 44: AND_R	and 	%r2, %r5, %r21
	.word 0xa8118005  ! 44: OR_R	or 	%r6, %r5, %r20
	.word 0xb20120c9  ! 44: ADD_I	add 	%r4, 0x00c9, %r25
	.word 0x9a018005  ! 44: ADD_R	add 	%r6, %r5, %r13
	.word 0xb2110005  ! 44: OR_R	or 	%r4, %r5, %r25
	.word 0xa811a776  ! 44: OR_I	or 	%r6, 0x0776, %r20
	.word 0xa008aef1  ! 44: AND_I	and 	%r2, 0x0ef1, %r16
	.word 0xbc09c005  ! 44: AND_R	and 	%r7, %r5, %r30
	.word 0xa4090005  ! 44: AND_R	and 	%r4, %r5, %r18
	.word 0xa6008005  ! 44: ADD_R	add 	%r2, %r5, %r19
	.word 0xb608ae60  ! 44: AND_I	and 	%r2, 0x0e60, %r27
	.word 0xa800a208  ! 44: ADD_I	add 	%r2, 0x0208, %r20
	.word 0xbc11c005  ! 44: OR_R	or 	%r7, %r5, %r30
	.word 0xaa09a31a  ! 44: AND_I	and 	%r6, 0x031a, %r21
	.word 0xb800a041  ! 44: ADD_I	add 	%r2, 0x0041, %r28
	.word 0xa809eba0  ! 44: AND_I	and 	%r7, 0x0ba0, %r20
	.word 0xbc012cd9  ! 44: ADD_I	add 	%r4, 0x0cd9, %r30
	.word 0xb201c005  ! 44: ADD_R	add 	%r7, %r5, %r25
	.word 0xb209a01d  ! 44: AND_I	and 	%r6, 0x001d, %r25
	.word 0xa810a989  ! 44: OR_I	or 	%r2, 0x0989, %r20
	.word 0xaa11e71d  ! 44: OR_I	or 	%r7, 0x071d, %r21
	.word 0xb8010005  ! 44: ADD_R	add 	%r4, %r5, %r28
	.word 0xbe018005  ! 44: ADD_R	add 	%r6, %r5, %r31
	.word 0x9c108005  ! 44: OR_R	or 	%r2, %r5, %r14
	.word 0xb2010005  ! 44: ADD_R	add 	%r4, %r5, %r25
	.word 0xa411ece3  ! 44: OR_I	or 	%r7, 0x0ce3, %r18
	.word 0xbc10a612  ! 44: OR_I	or 	%r2, 0x0612, %r30
	.word 0xa608a5ef  ! 44: AND_I	and 	%r2, 0x05ef, %r19
	.word 0x9e112b70  ! 44: OR_I	or 	%r4, 0x0b70, %r15
	.word 0xac11e7ef  ! 44: OR_I	or 	%r7, 0x07ef, %r22
	.word 0xa2098005  ! 44: AND_R	and 	%r6, %r5, %r17
	.word 0xa0118005  ! 44: OR_R	or 	%r6, %r5, %r16
	.word 0x9a10c005  ! 44: OR_R	or 	%r3, %r5, %r13
	.word 0x9c008005  ! 44: ADD_R	add 	%r2, %r5, %r14
	.word 0xa2110005  ! 44: OR_R	or 	%r4, %r5, %r17
	.word 0xbc108005  ! 44: OR_R	or 	%r2, %r5, %r30
	.word 0xba11a9d8  ! 44: OR_I	or 	%r6, 0x09d8, %r29
	.word 0xbe11a9d8  ! 44: OR_I	or 	%r6, 0x09d8, %r31
	.word 0xbc10c005  ! 44: OR_R	or 	%r3, %r5, %r30
	.word 0xac09efc7  ! 44: AND_I	and 	%r7, 0x0fc7, %r22
	.word 0xa611a9cb  ! 44: OR_I	or 	%r6, 0x09cb, %r19
	.word 0xb2008005  ! 44: ADD_R	add 	%r2, %r5, %r25
	.word 0xa000a6f2  ! 44: ADD_I	add 	%r2, 0x06f2, %r16
	.word 0xa408a4a9  ! 44: AND_I	and 	%r2, 0x04a9, %r18
	.word 0x9e118005  ! 44: OR_R	or 	%r6, %r5, %r15
	.word 0xb201ec14  ! 44: ADD_I	add 	%r7, 0x0c14, %r25
	.word 0xa810a2de  ! 44: OR_I	or 	%r2, 0x02de, %r20
	.word 0xb009e5bf  ! 44: AND_I	and 	%r7, 0x05bf, %r24
	.word 0xa200ae72  ! 44: ADD_I	add 	%r2, 0x0e72, %r17
	.word 0xac09c005  ! 44: AND_R	and 	%r7, %r5, %r22
	.word 0xb8010005  ! 44: ADD_R	add 	%r4, %r5, %r28
	.word 0xb601e3c7  ! 44: ADD_I	add 	%r7, 0x03c7, %r27
	.word 0xb2088005  ! 44: AND_R	and 	%r2, %r5, %r25
	.word 0xb801c005  ! 44: ADD_R	add 	%r7, %r5, %r28
	.word 0xbe088005  ! 44: AND_R	and 	%r2, %r5, %r31
	.word 0xb800a043  ! 44: ADD_I	add 	%r2, 0x0043, %r28
	.word 0xa811a11e  ! 44: OR_I	or 	%r6, 0x011e, %r20
	.word 0xb601a6ed  ! 44: ADD_I	add 	%r6, 0x06ed, %r27
	.word 0xb0118005  ! 44: OR_R	or 	%r6, %r5, %r24
	.word 0xa6092a17  ! 44: AND_I	and 	%r4, 0x0a17, %r19
	.word 0xb408a016  ! 44: AND_I	and 	%r2, 0x0016, %r26
	.word 0xba09c005  ! 44: AND_R	and 	%r7, %r5, %r29
	.word 0xb2010005  ! 44: ADD_R	add 	%r4, %r5, %r25
	.word 0xbc092889  ! 44: AND_I	and 	%r4, 0x0889, %r30
	.word 0xa401e75f  ! 44: ADD_I	add 	%r7, 0x075f, %r18
	.word 0xb0010005  ! 44: ADD_R	add 	%r4, %r5, %r24
	.word 0xbc01c005  ! 44: ADD_R	add 	%r7, %r5, %r30
	.word 0xaa08a1e5  ! 44: AND_I	and 	%r2, 0x01e5, %r21
	.word 0xa011ef66  ! 44: OR_I	or 	%r7, 0x0f66, %r16
	.word 0xa80928cb  ! 44: AND_I	and 	%r4, 0x08cb, %r20
	.word 0xac08c005  ! 44: AND_R	and 	%r3, %r5, %r22
	.word 0xa601e9d7  ! 44: ADD_I	add 	%r7, 0x09d7, %r19
	.word 0xac00c005  ! 44: ADD_R	add 	%r3, %r5, %r22
	.word 0xbe108005  ! 44: OR_R	or 	%r2, %r5, %r31
	.word 0xb000af28  ! 44: ADD_I	add 	%r2, 0x0f28, %r24
	.word 0xbe108005  ! 44: OR_R	or 	%r2, %r5, %r31
	.word 0xba018005  ! 44: ADD_R	add 	%r6, %r5, %r29
	.word 0xb208a2e4  ! 44: AND_I	and 	%r2, 0x02e4, %r25
	.word 0xb410a2a8  ! 44: OR_I	or 	%r2, 0x02a8, %r26
	.word 0xb801c005  ! 44: ADD_R	add 	%r7, %r5, %r28
	.word 0xbe010005  ! 44: ADD_R	add 	%r4, %r5, %r31
	.word 0xbc008005  ! 44: ADD_R	add 	%r2, %r5, %r30
	.word 0xb210ae47  ! 44: OR_I	or 	%r2, 0x0e47, %r25
	.word 0xa408a875  ! 44: AND_I	and 	%r2, 0x0875, %r18
	.word 0xa200ef88  ! 44: ADD_I	add 	%r3, 0x0f88, %r17
	.word 0xb811e383  ! 44: OR_I	or 	%r7, 0x0383, %r28
	.word 0xae09a850  ! 44: AND_I	and 	%r6, 0x0850, %r23
	.word 0x9e09c005  ! 44: AND_R	and 	%r7, %r5, %r15
	.word 0xa8108005  ! 44: OR_R	or 	%r2, %r5, %r20
	.word 0xaa01c005  ! 44: ADD_R	add 	%r7, %r5, %r21
	.word 0x9c110005  ! 44: OR_R	or 	%r4, %r5, %r14
	.word 0xa011e176  ! 44: OR_I	or 	%r7, 0x0176, %r16
	.word 0xb008ace7  ! 44: AND_I	and 	%r2, 0x0ce7, %r24
	.word 0xba09240e  ! 44: AND_I	and 	%r4, 0x040e, %r29
	.word 0xa808c005  ! 44: AND_R	and 	%r3, %r5, %r20
	.word 0xac01eb9e  ! 44: ADD_I	add 	%r7, 0x0b9e, %r22
	.word 0xb0088005  ! 44: AND_R	and 	%r2, %r5, %r24
	.word 0xa609c005  ! 44: AND_R	and 	%r7, %r5, %r19
	.word 0xa6112e36  ! 44: OR_I	or 	%r4, 0x0e36, %r19
	.word 0xb410aa78  ! 44: OR_I	or 	%r2, 0x0a78, %r26
	.word 0xb011afd4  ! 44: OR_I	or 	%r6, 0x0fd4, %r24
	.word 0xb000c005  ! 44: ADD_R	add 	%r3, %r5, %r24
	.word 0xbc088005  ! 44: AND_R	and 	%r2, %r5, %r30
	.word 0xa008e65a  ! 44: AND_I	and 	%r3, 0x065a, %r16
	.word 0x9a01a689  ! 44: ADD_I	add 	%r6, 0x0689, %r13
	.word 0xbc08aa3f  ! 44: AND_I	and 	%r2, 0x0a3f, %r30
	.word 0xb6092169  ! 44: AND_I	and 	%r4, 0x0169, %r27
	.word 0xb8012436  ! 44: ADD_I	add 	%r4, 0x0436, %r28
	.word 0x9c088005  ! 44: AND_R	and 	%r2, %r5, %r14
	.word 0xac08c005  ! 44: AND_R	and 	%r3, %r5, %r22
	.word 0xae008005  ! 44: ADD_R	add 	%r2, %r5, %r23
	.word 0xa009c005  ! 44: AND_R	and 	%r7, %r5, %r16
	.word 0xaa08a888  ! 44: AND_I	and 	%r2, 0x0888, %r21
	.word 0xba10a7c3  ! 44: OR_I	or 	%r2, 0x07c3, %r29
	.word 0xb010e5e1  ! 44: OR_I	or 	%r3, 0x05e1, %r24
	.word 0xac01e5d3  ! 44: ADD_I	add 	%r7, 0x05d3, %r22
	.word 0xaa088005  ! 44: AND_R	and 	%r2, %r5, %r21
	.word 0xb208c005  ! 44: AND_R	and 	%r3, %r5, %r25
	.word 0xba108005  ! 44: OR_R	or 	%r2, %r5, %r29
	.word 0xb611eda8  ! 44: OR_I	or 	%r7, 0x0da8, %r27
	.word 0xae08c005  ! 44: AND_R	and 	%r3, %r5, %r23
	.word 0xa410a086  ! 44: OR_I	or 	%r2, 0x0086, %r18
	.word 0xa808a705  ! 44: AND_I	and 	%r2, 0x0705, %r20
	.word 0xaa118005  ! 44: OR_R	or 	%r6, %r5, %r21
	.word 0xac08a8d7  ! 44: AND_I	and 	%r2, 0x08d7, %r22
	.word 0x9c01ebb2  ! 44: ADD_I	add 	%r7, 0x0bb2, %r14
	.word 0xa209ed1b  ! 44: AND_I	and 	%r7, 0x0d1b, %r17
	.word 0xba012f9c  ! 44: ADD_I	add 	%r4, 0x0f9c, %r29
	.word 0xb608a1a8  ! 44: AND_I	and 	%r2, 0x01a8, %r27
	.word 0x9c09c005  ! 44: AND_R	and 	%r7, %r5, %r14
	.word 0xa601295f  ! 44: ADD_I	add 	%r4, 0x095f, %r19
	.word 0xae11abd1  ! 44: OR_I	or 	%r6, 0x0bd1, %r23
	.word 0xb200a874  ! 44: ADD_I	add 	%r2, 0x0874, %r25
	.word 0xaa088005  ! 44: AND_R	and 	%r2, %r5, %r21
	.word 0xb601c005  ! 44: ADD_R	add 	%r7, %r5, %r27
	.word 0xaa01c005  ! 44: ADD_R	add 	%r7, %r5, %r21
	.word 0xac10a449  ! 44: OR_I	or 	%r2, 0x0449, %r22
	.word 0x9c088005  ! 44: AND_R	and 	%r2, %r5, %r14
	.word 0xb601c005  ! 44: ADD_R	add 	%r7, %r5, %r27
	.word 0x9a008005  ! 44: ADD_R	add 	%r2, %r5, %r13
	.word 0xb6118005  ! 44: OR_R	or 	%r6, %r5, %r27
	.word 0xa2088005  ! 44: AND_R	and 	%r2, %r5, %r17
	.word 0xb010c005  ! 44: OR_R	or 	%r3, %r5, %r24
	.word 0xbe110005  ! 44: OR_R	or 	%r4, %r5, %r31
	.word 0xa2112b0f  ! 44: OR_I	or 	%r4, 0x0b0f, %r17
	.word 0xa4012579  ! 44: ADD_I	add 	%r4, 0x0579, %r18
	.word 0x9c108005  ! 44: OR_R	or 	%r2, %r5, %r14
	.word 0xb811e10f  ! 44: OR_I	or 	%r7, 0x010f, %r28
	.word 0xa600a386  ! 44: ADD_I	add 	%r2, 0x0386, %r19
	.word 0xa0008005  ! 44: ADD_R	add 	%r2, %r5, %r16
	.word 0xb8118005  ! 44: OR_R	or 	%r6, %r5, %r28
	.word 0xb800ab2f  ! 44: ADD_I	add 	%r2, 0x0b2f, %r28
	.word 0xa0108005  ! 44: OR_R	or 	%r2, %r5, %r16
	.word 0xa8092240  ! 44: AND_I	and 	%r4, 0x0240, %r20
	.word 0xa408edce  ! 44: AND_I	and 	%r3, 0x0dce, %r18
	.word 0xac118005  ! 44: OR_R	or 	%r6, %r5, %r22
	.word 0x9c09ab2e  ! 44: AND_I	and 	%r6, 0x0b2e, %r14
	.word 0xaa018005  ! 44: ADD_R	add 	%r6, %r5, %r21
	.word 0xb811a5da  ! 44: OR_I	or 	%r6, 0x05da, %r28
	.word 0xb609ef4e  ! 44: AND_I	and 	%r7, 0x0f4e, %r27
	.word 0x9a08c005  ! 44: AND_R	and 	%r3, %r5, %r13
	.word 0xbc108005  ! 44: OR_R	or 	%r2, %r5, %r30
	.word 0x9e11c005  ! 44: OR_R	or 	%r7, %r5, %r15
	.word 0xa209c005  ! 44: AND_R	and 	%r7, %r5, %r17
	.word 0x9c00a7d1  ! 44: ADD_I	add 	%r2, 0x07d1, %r14
	.word 0x9c008005  ! 44: ADD_R	add 	%r2, %r5, %r14
	.word 0xbc10ee6a  ! 44: OR_I	or 	%r3, 0x0e6a, %r30
	.word 0xaa012473  ! 44: ADD_I	add 	%r4, 0x0473, %r21
	.word 0xa0108005  ! 44: OR_R	or 	%r2, %r5, %r16
	.word 0xae008005  ! 44: ADD_R	add 	%r2, %r5, %r23
	.word 0x9c112275  ! 44: OR_I	or 	%r4, 0x0275, %r14
	.word 0xa4118005  ! 44: OR_R	or 	%r6, %r5, %r18
	.word 0xb810ae9d  ! 44: OR_I	or 	%r2, 0x0e9d, %r28
	.word 0x9c108005  ! 44: OR_R	or 	%r2, %r5, %r14
	.word 0xaa09eace  ! 44: AND_I	and 	%r7, 0x0ace, %r21
	.word 0x9e10a7a3  ! 44: OR_I	or 	%r2, 0x07a3, %r15
	.word 0xba088005  ! 44: AND_R	and 	%r2, %r5, %r29
	.word 0xac11c005  ! 44: OR_R	or 	%r7, %r5, %r22
	.word 0xb811eb0d  ! 44: OR_I	or 	%r7, 0x0b0d, %r28
	.word 0xbc10c005  ! 44: OR_R	or 	%r3, %r5, %r30
	.word 0xbe088005  ! 44: AND_R	and 	%r2, %r5, %r31
	.word 0xfe21a820  ! 44: STW_I	stw	%r31, [%r6 + 0x0820]
	.word 0xf03128e0  ! 44: STH_I	sth	%r24, [%r4 + 0x08e0]
	.word 0xfc20aed4  ! 44: STW_I	stw	%r30, [%r2 + 0x0ed4]
	.word 0xe031eb64  ! 44: STH_I	sth	%r16, [%r7 + 0x0b64]
IRF_CE_23:
!$EV error(3,expr(@VA(.MAIN.IRF_CE_23), 16, 16), 1,IRF,ce,71,x, x,x,x, x,x,x)
!$EV error(3,expr(@VA(.MAIN.IRF_CE_23), 16, 16), 3,IRF,ce,31,x, x,x,x, x,x,x)
	.word 0xec30ea48  ! 44: STH_I	sth	%r22, [%r3 + 0x0a48]
	.word 0xdc28a1c3  ! 44: STB_I	stb	%r14, [%r2 + 0x01c3]
	.word 0xe471e058  ! 44: STX_I	stx	%r18, [%r7 + 0x0058]
	.word 0xdd38c005  ! 44: STDF_R	std	%f14, [%r5, %r3]
	.word 0x9c088005  ! 44: AND_R	and 	%r2, %r5, %r14
	.word 0xb8018005  ! 44: ADD_R	add 	%r6, %r5, %r28
	bne thr3_loop_5
	subcc %g1, 0x1, %g1
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr3_loop_6:
	.word 0xb209a91c  ! 51: AND_I	and 	%r6, 0x091c, %r25
	.word 0xa0108005  ! 51: OR_R	or 	%r2, %r5, %r16
	.word 0xb8008005  ! 51: ADD_R	add 	%r2, %r5, %r28
	.word 0xbc09c005  ! 51: AND_R	and 	%r7, %r5, %r30
	.word 0xbc118005  ! 51: OR_R	or 	%r6, %r5, %r30
	.word 0xa800c005  ! 51: ADD_R	add 	%r3, %r5, %r20
	.word 0xae008005  ! 51: ADD_R	add 	%r2, %r5, %r23
	.word 0xae092f70  ! 51: AND_I	and 	%r4, 0x0f70, %r23
	.word 0xa600a4a3  ! 51: ADD_I	add 	%r2, 0x04a3, %r19
	.word 0xbe018005  ! 51: ADD_R	add 	%r6, %r5, %r31
	.word 0xbc112076  ! 51: OR_I	or 	%r4, 0x0076, %r30
	.word 0xac008005  ! 51: ADD_R	add 	%r2, %r5, %r22
	.word 0xa410eae5  ! 51: OR_I	or 	%r3, 0x0ae5, %r18
	.word 0x9c008005  ! 51: ADD_R	add 	%r2, %r5, %r14
	.word 0xb609c005  ! 51: AND_R	and 	%r7, %r5, %r27
	.word 0x9e00aded  ! 51: ADD_I	add 	%r2, 0x0ded, %r15
	.word 0x9c008005  ! 51: ADD_R	add 	%r2, %r5, %r14
	.word 0xbe09aa98  ! 51: AND_I	and 	%r6, 0x0a98, %r31
	.word 0x9e08abe3  ! 51: AND_I	and 	%r2, 0x0be3, %r15
	.word 0xb2108005  ! 51: OR_R	or 	%r2, %r5, %r25
	.word 0xbe108005  ! 51: OR_R	or 	%r2, %r5, %r31
	.word 0xb401eddc  ! 51: ADD_I	add 	%r7, 0x0ddc, %r26
	.word 0x9a11acb3  ! 51: OR_I	or 	%r6, 0x0cb3, %r13
	.word 0xae088005  ! 51: AND_R	and 	%r2, %r5, %r23
	.word 0xbc10e354  ! 51: OR_I	or 	%r3, 0x0354, %r30
	.word 0xa408e89d  ! 51: AND_I	and 	%r3, 0x089d, %r18
	.word 0xa0008005  ! 51: ADD_R	add 	%r2, %r5, %r16
	.word 0xa4108005  ! 51: OR_R	or 	%r2, %r5, %r18
	.word 0xbc110005  ! 51: OR_R	or 	%r4, %r5, %r30
	.word 0xb8110005  ! 51: OR_R	or 	%r4, %r5, %r28
	.word 0xaa018005  ! 51: ADD_R	add 	%r6, %r5, %r21
	.word 0xaa10a290  ! 51: OR_I	or 	%r2, 0x0290, %r21
	.word 0x9e11a98d  ! 51: OR_I	or 	%r6, 0x098d, %r15
	.word 0x9a01c005  ! 51: ADD_R	add 	%r7, %r5, %r13
	.word 0x9e110005  ! 51: OR_R	or 	%r4, %r5, %r15
	.word 0x9c010005  ! 51: ADD_R	add 	%r4, %r5, %r14
	.word 0xa4008005  ! 51: ADD_R	add 	%r2, %r5, %r18
	.word 0xb011a566  ! 51: OR_I	or 	%r6, 0x0566, %r24
	.word 0xb600a447  ! 51: ADD_I	add 	%r2, 0x0447, %r27
	.word 0xaa108005  ! 51: OR_R	or 	%r2, %r5, %r21
	.word 0xac09c005  ! 51: AND_R	and 	%r7, %r5, %r22
	.word 0xb8118005  ! 51: OR_R	or 	%r6, %r5, %r28
	.word 0xa009c005  ! 51: AND_R	and 	%r7, %r5, %r16
	.word 0xac010005  ! 51: ADD_R	add 	%r4, %r5, %r22
	.word 0xaa09a1ab  ! 51: AND_I	and 	%r6, 0x01ab, %r21
	.word 0xae00a70b  ! 51: ADD_I	add 	%r2, 0x070b, %r23
	.word 0xa001e603  ! 51: ADD_I	add 	%r7, 0x0603, %r16
	.word 0xb810c005  ! 51: OR_R	or 	%r3, %r5, %r28
	.word 0xa811e0c4  ! 51: OR_I	or 	%r7, 0x00c4, %r20
	.word 0xa4118005  ! 51: OR_R	or 	%r6, %r5, %r18
	.word 0xba09c005  ! 51: AND_R	and 	%r7, %r5, %r29
	.word 0xb008adac  ! 51: AND_I	and 	%r2, 0x0dac, %r24
	.word 0xa608c005  ! 51: AND_R	and 	%r3, %r5, %r19
	.word 0xae08eae2  ! 51: AND_I	and 	%r3, 0x0ae2, %r23
	.word 0xa4008005  ! 51: ADD_R	add 	%r2, %r5, %r18
	.word 0xb400ae1d  ! 51: ADD_I	add 	%r2, 0x0e1d, %r26
	.word 0xbc00aa8a  ! 51: ADD_I	add 	%r2, 0x0a8a, %r30
	.word 0xa411eea7  ! 51: OR_I	or 	%r7, 0x0ea7, %r18
	.word 0xbc01c005  ! 51: ADD_R	add 	%r7, %r5, %r30
	.word 0xbe01efd1  ! 51: ADD_I	add 	%r7, 0x0fd1, %r31
	.word 0xba09256d  ! 51: AND_I	and 	%r4, 0x056d, %r29
	.word 0xb8118005  ! 51: OR_R	or 	%r6, %r5, %r28
	.word 0xaa09e90c  ! 51: AND_I	and 	%r7, 0x090c, %r21
	.word 0x9a110005  ! 51: OR_R	or 	%r4, %r5, %r13
	.word 0x9c10efc7  ! 51: OR_I	or 	%r3, 0x0fc7, %r14
	.word 0xa001a338  ! 51: ADD_I	add 	%r6, 0x0338, %r16
	.word 0xbc11c005  ! 51: OR_R	or 	%r7, %r5, %r30
	.word 0x9a10a3c0  ! 51: OR_I	or 	%r2, 0x03c0, %r13
	.word 0xb0008005  ! 51: ADD_R	add 	%r2, %r5, %r24
	.word 0xb010aa8f  ! 51: OR_I	or 	%r2, 0x0a8f, %r24
	.word 0xbe1129e6  ! 51: OR_I	or 	%r4, 0x09e6, %r31
	.word 0xbc10ee6c  ! 51: OR_I	or 	%r3, 0x0e6c, %r30
	.word 0xb010e109  ! 51: OR_I	or 	%r3, 0x0109, %r24
	.word 0xb809e633  ! 51: AND_I	and 	%r7, 0x0633, %r28
	.word 0xa010e0e6  ! 51: OR_I	or 	%r3, 0x00e6, %r16
	.word 0xb808afc4  ! 51: AND_I	and 	%r2, 0x0fc4, %r28
	.word 0xb811eda8  ! 51: OR_I	or 	%r7, 0x0da8, %r28
	.word 0xaa012281  ! 51: ADD_I	add 	%r4, 0x0281, %r21
	.word 0xba090005  ! 51: AND_R	and 	%r4, %r5, %r29
	.word 0xaa11c005  ! 51: OR_R	or 	%r7, %r5, %r21
	.word 0xac08a5f5  ! 51: AND_I	and 	%r2, 0x05f5, %r22
	.word 0xba090005  ! 51: AND_R	and 	%r4, %r5, %r29
	.word 0xae09e5f6  ! 51: AND_I	and 	%r7, 0x05f6, %r23
	.word 0xa401a24e  ! 51: ADD_I	add 	%r6, 0x024e, %r18
	.word 0xaa08afe3  ! 51: AND_I	and 	%r2, 0x0fe3, %r21
	.word 0xa001a4c9  ! 51: ADD_I	add 	%r6, 0x04c9, %r16
	.word 0xaa010005  ! 51: ADD_R	add 	%r4, %r5, %r21
	.word 0xa200a20c  ! 51: ADD_I	add 	%r2, 0x020c, %r17
	.word 0xb600e8a6  ! 51: ADD_I	add 	%r3, 0x08a6, %r27
	.word 0xb000a697  ! 51: ADD_I	add 	%r2, 0x0697, %r24
	.word 0xba090005  ! 51: AND_R	and 	%r4, %r5, %r29
	.word 0xb0110005  ! 51: OR_R	or 	%r4, %r5, %r24
	.word 0xb8108005  ! 51: OR_R	or 	%r2, %r5, %r28
	.word 0xb809c005  ! 51: AND_R	and 	%r7, %r5, %r28
	.word 0xa408a3de  ! 51: AND_I	and 	%r2, 0x03de, %r18
	.word 0xa408a25f  ! 51: AND_I	and 	%r2, 0x025f, %r18
	.word 0xba00afe6  ! 51: ADD_I	add 	%r2, 0x0fe6, %r29
	.word 0x9e110005  ! 51: OR_R	or 	%r4, %r5, %r15
	.word 0xae01e4ed  ! 51: ADD_I	add 	%r7, 0x04ed, %r23
	.word 0xa609a94c  ! 51: AND_I	and 	%r6, 0x094c, %r19
	.word 0xa2018005  ! 51: ADD_R	add 	%r6, %r5, %r17
	.word 0xa4090005  ! 51: AND_R	and 	%r4, %r5, %r18
	.word 0xb2008005  ! 51: ADD_R	add 	%r2, %r5, %r25
	.word 0xbe10ae1a  ! 51: OR_I	or 	%r2, 0x0e1a, %r31
	.word 0xb2110005  ! 51: OR_R	or 	%r4, %r5, %r25
	.word 0x9e09a438  ! 51: AND_I	and 	%r6, 0x0438, %r15
	.word 0xb610eea7  ! 51: OR_I	or 	%r3, 0x0ea7, %r27
	.word 0xa008e704  ! 51: AND_I	and 	%r3, 0x0704, %r16
	.word 0xa808a486  ! 51: AND_I	and 	%r2, 0x0486, %r20
	.word 0xae00af24  ! 51: ADD_I	add 	%r2, 0x0f24, %r23
	.word 0xa6018005  ! 51: ADD_R	add 	%r6, %r5, %r19
	.word 0xba08c005  ! 51: AND_R	and 	%r3, %r5, %r29
	.word 0xa009a8e7  ! 51: AND_I	and 	%r6, 0x08e7, %r16
	.word 0xbe012070  ! 51: ADD_I	add 	%r4, 0x0070, %r31
	.word 0xaa008005  ! 51: ADD_R	add 	%r2, %r5, %r21
	.word 0x9c108005  ! 51: OR_R	or 	%r2, %r5, %r14
	.word 0xa808a444  ! 51: AND_I	and 	%r2, 0x0444, %r20
	.word 0xb201c005  ! 51: ADD_R	add 	%r7, %r5, %r25
	.word 0xa211e7c1  ! 51: OR_I	or 	%r7, 0x07c1, %r17
	.word 0xac018005  ! 51: ADD_R	add 	%r6, %r5, %r22
	.word 0xae092310  ! 51: AND_I	and 	%r4, 0x0310, %r23
	.word 0xb400a4fd  ! 51: ADD_I	add 	%r2, 0x04fd, %r26
	.word 0xbe108005  ! 51: OR_R	or 	%r2, %r5, %r31
	.word 0xb41120b1  ! 51: OR_I	or 	%r4, 0x00b1, %r26
	.word 0xac088005  ! 51: AND_R	and 	%r2, %r5, %r22
	.word 0xba01eed7  ! 51: ADD_I	add 	%r7, 0x0ed7, %r29
	.word 0x9e00ecf9  ! 51: ADD_I	add 	%r3, 0x0cf9, %r15
	.word 0xa0112107  ! 51: OR_I	or 	%r4, 0x0107, %r16
	.word 0xb410a818  ! 51: OR_I	or 	%r2, 0x0818, %r26
	.word 0xa0012f6d  ! 51: ADD_I	add 	%r4, 0x0f6d, %r16
	.word 0xbe018005  ! 51: ADD_R	add 	%r6, %r5, %r31
	.word 0xb0110005  ! 51: OR_R	or 	%r4, %r5, %r24
	.word 0xa810aa64  ! 51: OR_I	or 	%r2, 0x0a64, %r20
	.word 0xb8010005  ! 51: ADD_R	add 	%r4, %r5, %r28
	.word 0xb8112995  ! 51: OR_I	or 	%r4, 0x0995, %r28
	.word 0xb0118005  ! 51: OR_R	or 	%r6, %r5, %r24
	.word 0xa401a077  ! 51: ADD_I	add 	%r6, 0x0077, %r18
	.word 0xae010005  ! 51: ADD_R	add 	%r4, %r5, %r23
	.word 0xb4012a3b  ! 51: ADD_I	add 	%r4, 0x0a3b, %r26
	.word 0xa4018005  ! 51: ADD_R	add 	%r6, %r5, %r18
	.word 0xae08c005  ! 51: AND_R	and 	%r3, %r5, %r23
	.word 0x9a00e0aa  ! 51: ADD_I	add 	%r3, 0x00aa, %r13
	.word 0xb011e01c  ! 51: OR_I	or 	%r7, 0x001c, %r24
	.word 0xae108005  ! 51: OR_R	or 	%r2, %r5, %r23
	.word 0xb0110005  ! 51: OR_R	or 	%r4, %r5, %r24
	.word 0x9e11e132  ! 51: OR_I	or 	%r7, 0x0132, %r15
	.word 0xbe00c005  ! 51: ADD_R	add 	%r3, %r5, %r31
	.word 0x9e010005  ! 51: ADD_R	add 	%r4, %r5, %r15
	.word 0xbc11c005  ! 51: OR_R	or 	%r7, %r5, %r30
	.word 0xae0929d1  ! 51: AND_I	and 	%r4, 0x09d1, %r23
	.word 0xa4090005  ! 51: AND_R	and 	%r4, %r5, %r18
	.word 0x9e09207b  ! 51: AND_I	and 	%r4, 0x007b, %r15
	.word 0x9c092f52  ! 51: AND_I	and 	%r4, 0x0f52, %r14
	.word 0xbe012b18  ! 51: ADD_I	add 	%r4, 0x0b18, %r31
	.word 0xbe01e04f  ! 51: ADD_I	add 	%r7, 0x004f, %r31
	.word 0xb209c005  ! 51: AND_R	and 	%r7, %r5, %r25
	.word 0xae010005  ! 51: ADD_R	add 	%r4, %r5, %r23
	.word 0xb6088005  ! 51: AND_R	and 	%r2, %r5, %r27
	.word 0xa409add4  ! 51: AND_I	and 	%r6, 0x0dd4, %r18
	.word 0xbe00a35f  ! 51: ADD_I	add 	%r2, 0x035f, %r31
	.word 0xb8108005  ! 51: OR_R	or 	%r2, %r5, %r28
	.word 0x9a008005  ! 51: ADD_R	add 	%r2, %r5, %r13
	.word 0xb2008005  ! 51: ADD_R	add 	%r2, %r5, %r25
	.word 0xbc0920ca  ! 51: AND_I	and 	%r4, 0x00ca, %r30
	.word 0xb0010005  ! 51: ADD_R	add 	%r4, %r5, %r24
	.word 0xbc00c005  ! 51: ADD_R	add 	%r3, %r5, %r30
	.word 0xa210c005  ! 51: OR_R	or 	%r3, %r5, %r17
	.word 0xb8092a8c  ! 51: AND_I	and 	%r4, 0x0a8c, %r28
	.word 0xb810a863  ! 51: OR_I	or 	%r2, 0x0863, %r28
	.word 0xa200eaf7  ! 51: ADD_I	add 	%r3, 0x0af7, %r17
	.word 0xa210a18c  ! 51: OR_I	or 	%r2, 0x018c, %r17
	.word 0xac092342  ! 51: AND_I	and 	%r4, 0x0342, %r22
	.word 0xa0108005  ! 51: OR_R	or 	%r2, %r5, %r16
	.word 0xb609ee21  ! 51: AND_I	and 	%r7, 0x0e21, %r27
	.word 0xb211e923  ! 51: OR_I	or 	%r7, 0x0923, %r25
	.word 0xb410a9d6  ! 51: OR_I	or 	%r2, 0x09d6, %r26
	.word 0xa0088005  ! 51: AND_R	and 	%r2, %r5, %r16
	.word 0xa011edea  ! 51: OR_I	or 	%r7, 0x0dea, %r16
	.word 0xbc11e5fb  ! 51: OR_I	or 	%r7, 0x05fb, %r30
	.word 0xb8108005  ! 51: OR_R	or 	%r2, %r5, %r28
	.word 0xb609c005  ! 51: AND_R	and 	%r7, %r5, %r27
	.word 0x9c09c005  ! 51: AND_R	and 	%r7, %r5, %r14
	.word 0xb401e4fd  ! 51: ADD_I	add 	%r7, 0x04fd, %r26
	.word 0xb800e327  ! 51: ADD_I	add 	%r3, 0x0327, %r28
	.word 0xb8010005  ! 51: ADD_R	add 	%r4, %r5, %r28
	.word 0x9a09a4be  ! 51: AND_I	and 	%r6, 0x04be, %r13
	.word 0xbc1127dd  ! 51: OR_I	or 	%r4, 0x07dd, %r30
	.word 0xbe108005  ! 51: OR_R	or 	%r2, %r5, %r31
	.word 0x9e10a4e0  ! 51: OR_I	or 	%r2, 0x04e0, %r15
	.word 0xa4008005  ! 51: ADD_R	add 	%r2, %r5, %r18
	.word 0x9c112035  ! 51: OR_I	or 	%r4, 0x0035, %r14
	.word 0xae01aebe  ! 51: ADD_I	add 	%r6, 0x0ebe, %r23
	.word 0xbe00a2c5  ! 51: ADD_I	add 	%r2, 0x02c5, %r31
	.word 0xbe010005  ! 51: ADD_R	add 	%r4, %r5, %r31
	.word 0x9e008005  ! 51: ADD_R	add 	%r2, %r5, %r15
	.word 0x9e1121b3  ! 51: OR_I	or 	%r4, 0x01b3, %r15
	.word 0xb8108005  ! 51: OR_R	or 	%r2, %r5, %r28
	.word 0xa601e75b  ! 51: ADD_I	add 	%r7, 0x075b, %r19
	.word 0xac09ac75  ! 51: AND_I	and 	%r6, 0x0c75, %r22
	.word 0xa6018005  ! 51: ADD_R	add 	%r6, %r5, %r19
	.word 0x9c10c005  ! 51: OR_R	or 	%r3, %r5, %r14
	.word 0xb608c005  ! 51: AND_R	and 	%r3, %r5, %r27
	.word 0xbc01a306  ! 51: ADD_I	add 	%r6, 0x0306, %r30
	.word 0xa8010005  ! 51: ADD_R	add 	%r4, %r5, %r20
	.word 0xaa00c005  ! 51: ADD_R	add 	%r3, %r5, %r21
	.word 0xa400c005  ! 51: ADD_R	add 	%r3, %r5, %r18
	.word 0xba008005  ! 51: ADD_R	add 	%r2, %r5, %r29
	.word 0xb010c005  ! 51: OR_R	or 	%r3, %r5, %r24
	.word 0x9c10af29  ! 51: OR_I	or 	%r2, 0x0f29, %r14
	.word 0xba008005  ! 51: ADD_R	add 	%r2, %r5, %r29
	.word 0xb0018005  ! 51: ADD_R	add 	%r6, %r5, %r24
	.word 0xa600e20a  ! 51: ADD_I	add 	%r3, 0x020a, %r19
	.word 0xa409eaec  ! 51: AND_I	and 	%r7, 0x0aec, %r18
	.word 0xa800e351  ! 51: ADD_I	add 	%r3, 0x0351, %r20
	.word 0xb808a7a8  ! 51: AND_I	and 	%r2, 0x07a8, %r28
	.word 0x9c088005  ! 51: AND_R	and 	%r2, %r5, %r14
	.word 0xac09e204  ! 51: AND_I	and 	%r7, 0x0204, %r22
	.word 0xa811aeb0  ! 51: OR_I	or 	%r6, 0x0eb0, %r20
	.word 0x9a11a57b  ! 51: OR_I	or 	%r6, 0x057b, %r13
	.word 0xac00a35f  ! 51: ADD_I	add 	%r2, 0x035f, %r22
	.word 0x9c00adeb  ! 51: ADD_I	add 	%r2, 0x0deb, %r14
	.word 0xb2018005  ! 51: ADD_R	add 	%r6, %r5, %r25
	.word 0xae01edb3  ! 51: ADD_I	add 	%r7, 0x0db3, %r23
	.word 0xb400c005  ! 51: ADD_R	add 	%r3, %r5, %r26
	.word 0xa601e725  ! 51: ADD_I	add 	%r7, 0x0725, %r19
	.word 0xb8018005  ! 51: ADD_R	add 	%r6, %r5, %r28
	.word 0xa200af5d  ! 51: ADD_I	add 	%r2, 0x0f5d, %r17
	.word 0xa0088005  ! 51: AND_R	and 	%r2, %r5, %r16
	.word 0xb808ebff  ! 51: AND_I	and 	%r3, 0x0bff, %r28
	.word 0xb8090005  ! 51: AND_R	and 	%r4, %r5, %r28
	.word 0xbe00c005  ! 51: ADD_R	add 	%r3, %r5, %r31
	.word 0xa411e30a  ! 51: OR_I	or 	%r7, 0x030a, %r18
	.word 0xe62129fc  ! 51: STW_I	stw	%r19, [%r4 + 0x09fc]
	.word 0xde3126fc  ! 51: STH_I	sth	%r15, [%r4 + 0x06fc]
	.word 0xde20e458  ! 51: STW_I	stw	%r15, [%r3 + 0x0458]
	.word 0xf428a706  ! 51: STB_I	stb	%r26, [%r2 + 0x0706]
IRF_CE_27:
!$EV error(3,expr(@VA(.MAIN.IRF_CE_27), 16, 16), 1,IRF,ce,64,x, x,x,x, x,x,x)
!$EV error(3,expr(@VA(.MAIN.IRF_CE_27), 16, 16), 3,IRF,ce,61,x, x,x,x, x,x,x)
	.word 0xdc30a184  ! 51: STH_I	sth	%r14, [%r2 + 0x0184]
	.word 0xe230a306  ! 51: STH_I	sth	%r17, [%r2 + 0x0306]
	.word 0xdc2125a4  ! 51: STW_I	stw	%r14, [%r4 + 0x05a4]
	.word 0xdbf0a005  ! 51: CASXA_R	casxa	[%r2]%asi, %r5, %r13
	.word 0xa4108005  ! 51: OR_R	or 	%r2, %r5, %r18
	.word 0xae10a01b  ! 51: OR_I	or 	%r2, 0x001b, %r23
	bne thr3_loop_6
	subcc %g1, 0x1, %g1
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr3_loop_7:
	.word 0xb208c005  ! 59: AND_R	and 	%r3, %r5, %r25
	.word 0xa601ebef  ! 59: ADD_I	add 	%r7, 0x0bef, %r19
	.word 0xb611ea4a  ! 59: OR_I	or 	%r7, 0x0a4a, %r27
	.word 0xa8108005  ! 59: OR_R	or 	%r2, %r5, %r20
	.word 0x9c10ee1c  ! 59: OR_I	or 	%r3, 0x0e1c, %r14
	.word 0xb4018005  ! 59: ADD_R	add 	%r6, %r5, %r26
	.word 0xaa10a313  ! 59: OR_I	or 	%r2, 0x0313, %r21
	.word 0xba10e0cd  ! 59: OR_I	or 	%r3, 0x00cd, %r29
	.word 0xb601c005  ! 59: ADD_R	add 	%r7, %r5, %r27
	.word 0xac08abf8  ! 59: AND_I	and 	%r2, 0x0bf8, %r22
	.word 0xa8018005  ! 59: ADD_R	add 	%r6, %r5, %r20
	.word 0x9e10ee80  ! 59: OR_I	or 	%r3, 0x0e80, %r15
	.word 0xa2098005  ! 59: AND_R	and 	%r6, %r5, %r17
	.word 0xb000a989  ! 59: ADD_I	add 	%r2, 0x0989, %r24
	.word 0xb8110005  ! 59: OR_R	or 	%r4, %r5, %r28
	.word 0xbc088005  ! 59: AND_R	and 	%r2, %r5, %r30
	.word 0x9a012308  ! 59: ADD_I	add 	%r4, 0x0308, %r13
	.word 0xa0090005  ! 59: AND_R	and 	%r4, %r5, %r16
	.word 0xa8118005  ! 59: OR_R	or 	%r6, %r5, %r20
	.word 0xba088005  ! 59: AND_R	and 	%r2, %r5, %r29
	.word 0x9e09aac9  ! 59: AND_I	and 	%r6, 0x0ac9, %r15
	.word 0xbe10aad1  ! 59: OR_I	or 	%r2, 0x0ad1, %r31
	.word 0xb009c005  ! 59: AND_R	and 	%r7, %r5, %r24
	.word 0xae098005  ! 59: AND_R	and 	%r6, %r5, %r23
	.word 0x9a008005  ! 59: ADD_R	add 	%r2, %r5, %r13
	.word 0xb001a93d  ! 59: ADD_I	add 	%r6, 0x093d, %r24
	.word 0x9a010005  ! 59: ADD_R	add 	%r4, %r5, %r13
	.word 0xa8110005  ! 59: OR_R	or 	%r4, %r5, %r20
	.word 0xaa00a757  ! 59: ADD_I	add 	%r2, 0x0757, %r21
	.word 0xa211c005  ! 59: OR_R	or 	%r7, %r5, %r17
	.word 0xa011a34b  ! 59: OR_I	or 	%r6, 0x034b, %r16
	.word 0x9e11c005  ! 59: OR_R	or 	%r7, %r5, %r15
	.word 0xb000af77  ! 59: ADD_I	add 	%r2, 0x0f77, %r24
	.word 0xb4108005  ! 59: OR_R	or 	%r2, %r5, %r26
	.word 0x9e10e759  ! 59: OR_I	or 	%r3, 0x0759, %r15
	.word 0xa600e5d1  ! 59: ADD_I	add 	%r3, 0x05d1, %r19
	.word 0xb808c005  ! 59: AND_R	and 	%r3, %r5, %r28
	.word 0x9e098005  ! 59: AND_R	and 	%r6, %r5, %r15
	.word 0xa4088005  ! 59: AND_R	and 	%r2, %r5, %r18
	.word 0xa4108005  ! 59: OR_R	or 	%r2, %r5, %r18
	.word 0xb0010005  ! 59: ADD_R	add 	%r4, %r5, %r24
	.word 0xac098005  ! 59: AND_R	and 	%r6, %r5, %r22
	.word 0xbc08a0e2  ! 59: AND_I	and 	%r2, 0x00e2, %r30
	.word 0xa009a361  ! 59: AND_I	and 	%r6, 0x0361, %r16
	.word 0xa4118005  ! 59: OR_R	or 	%r6, %r5, %r18
	.word 0xbc008005  ! 59: ADD_R	add 	%r2, %r5, %r30
	.word 0xb0092da2  ! 59: AND_I	and 	%r4, 0x0da2, %r24
	.word 0xae00aeca  ! 59: ADD_I	add 	%r2, 0x0eca, %r23
	.word 0xa609c005  ! 59: AND_R	and 	%r7, %r5, %r19
	.word 0xa211a794  ! 59: OR_I	or 	%r6, 0x0794, %r17
	.word 0xa809c005  ! 59: AND_R	and 	%r7, %r5, %r20
	.word 0xb4010005  ! 59: ADD_R	add 	%r4, %r5, %r26
	.word 0xbc10e123  ! 59: OR_I	or 	%r3, 0x0123, %r30
	.word 0x9e118005  ! 59: OR_R	or 	%r6, %r5, %r15
	.word 0xb600ea96  ! 59: ADD_I	add 	%r3, 0x0a96, %r27
	.word 0xa2110005  ! 59: OR_R	or 	%r4, %r5, %r17
	.word 0xa608a730  ! 59: AND_I	and 	%r2, 0x0730, %r19
	.word 0xac08a8f0  ! 59: AND_I	and 	%r2, 0x08f0, %r22
	.word 0xa008c005  ! 59: AND_R	and 	%r3, %r5, %r16
	.word 0xa0110005  ! 59: OR_R	or 	%r4, %r5, %r16
	.word 0x9e00e4d1  ! 59: ADD_I	add 	%r3, 0x04d1, %r15
	.word 0xb4110005  ! 59: OR_R	or 	%r4, %r5, %r26
	.word 0xb008e900  ! 59: AND_I	and 	%r3, 0x0900, %r24
	.word 0xaa08c005  ! 59: AND_R	and 	%r3, %r5, %r21
	.word 0xac11c005  ! 59: OR_R	or 	%r7, %r5, %r22
	.word 0xb611afcd  ! 59: OR_I	or 	%r6, 0x0fcd, %r27
	.word 0xae00e460  ! 59: ADD_I	add 	%r3, 0x0460, %r23
	.word 0x9a118005  ! 59: OR_R	or 	%r6, %r5, %r13
	.word 0xa2092d90  ! 59: AND_I	and 	%r4, 0x0d90, %r17
	.word 0xae08a675  ! 59: AND_I	and 	%r2, 0x0675, %r23
	.word 0xa000c005  ! 59: ADD_R	add 	%r3, %r5, %r16
	.word 0xb401a904  ! 59: ADD_I	add 	%r6, 0x0904, %r26
	.word 0xbe018005  ! 59: ADD_R	add 	%r6, %r5, %r31
	.word 0xae01e51a  ! 59: ADD_I	add 	%r7, 0x051a, %r23
	.word 0xa4008005  ! 59: ADD_R	add 	%r2, %r5, %r18
	.word 0xaa08abc5  ! 59: AND_I	and 	%r2, 0x0bc5, %r21
	.word 0xa4088005  ! 59: AND_R	and 	%r2, %r5, %r18
	.word 0xba118005  ! 59: OR_R	or 	%r6, %r5, %r29
	.word 0xb0088005  ! 59: AND_R	and 	%r2, %r5, %r24
	.word 0xaa00c005  ! 59: ADD_R	add 	%r3, %r5, %r21
	.word 0x9a09e165  ! 59: AND_I	and 	%r7, 0x0165, %r13
	.word 0xb810c005  ! 59: OR_R	or 	%r3, %r5, %r28
	.word 0xb001e382  ! 59: ADD_I	add 	%r7, 0x0382, %r24
	.word 0xb4018005  ! 59: ADD_R	add 	%r6, %r5, %r26
	.word 0xb008a1ff  ! 59: AND_I	and 	%r2, 0x01ff, %r24
	.word 0x9e092e03  ! 59: AND_I	and 	%r4, 0x0e03, %r15
	.word 0x9c08ef3a  ! 59: AND_I	and 	%r3, 0x0f3a, %r14
	.word 0xbc08a451  ! 59: AND_I	and 	%r2, 0x0451, %r30
	.word 0xbe10c005  ! 59: OR_R	or 	%r3, %r5, %r31
	.word 0xb6112629  ! 59: OR_I	or 	%r4, 0x0629, %r27
	.word 0xb2008005  ! 59: ADD_R	add 	%r2, %r5, %r25
	.word 0xae11c005  ! 59: OR_R	or 	%r7, %r5, %r23
	.word 0xbc10c005  ! 59: OR_R	or 	%r3, %r5, %r30
	.word 0xa009a60c  ! 59: AND_I	and 	%r6, 0x060c, %r16
	.word 0xa610afc9  ! 59: OR_I	or 	%r2, 0x0fc9, %r19
	.word 0xac0123c1  ! 59: ADD_I	add 	%r4, 0x03c1, %r22
	.word 0xba010005  ! 59: ADD_R	add 	%r4, %r5, %r29
	.word 0xbe00a446  ! 59: ADD_I	add 	%r2, 0x0446, %r31
	.word 0xa6112618  ! 59: OR_I	or 	%r4, 0x0618, %r19
	.word 0x9c09e2f7  ! 59: AND_I	and 	%r7, 0x02f7, %r14
	.word 0xa609ec2c  ! 59: AND_I	and 	%r7, 0x0c2c, %r19
	.word 0xa4008005  ! 59: ADD_R	add 	%r2, %r5, %r18
	.word 0xaa08c005  ! 59: AND_R	and 	%r3, %r5, %r21
	.word 0xb009af0f  ! 59: AND_I	and 	%r6, 0x0f0f, %r24
	.word 0xac092397  ! 59: AND_I	and 	%r4, 0x0397, %r22
	.word 0xba108005  ! 59: OR_R	or 	%r2, %r5, %r29
	.word 0xa2108005  ! 59: OR_R	or 	%r2, %r5, %r17
	.word 0xa6010005  ! 59: ADD_R	add 	%r4, %r5, %r19
	.word 0xb009ac54  ! 59: AND_I	and 	%r6, 0x0c54, %r24
	.word 0xb010e129  ! 59: OR_I	or 	%r3, 0x0129, %r24
	.word 0xb608e6bf  ! 59: AND_I	and 	%r3, 0x06bf, %r27
	.word 0xa4090005  ! 59: AND_R	and 	%r4, %r5, %r18
	.word 0x9a108005  ! 59: OR_R	or 	%r2, %r5, %r13
	.word 0x9a10a82a  ! 59: OR_I	or 	%r2, 0x082a, %r13
	.word 0xba09c005  ! 59: AND_R	and 	%r7, %r5, %r29
	.word 0xb601a081  ! 59: ADD_I	add 	%r6, 0x0081, %r27
	.word 0xb608ac32  ! 59: AND_I	and 	%r2, 0x0c32, %r27
	.word 0xb001c005  ! 59: ADD_R	add 	%r7, %r5, %r24
	.word 0xa610a781  ! 59: OR_I	or 	%r2, 0x0781, %r19
	.word 0xa0010005  ! 59: ADD_R	add 	%r4, %r5, %r16
	.word 0xa001c005  ! 59: ADD_R	add 	%r7, %r5, %r16
	.word 0xbe098005  ! 59: AND_R	and 	%r6, %r5, %r31
	.word 0xac012a80  ! 59: ADD_I	add 	%r4, 0x0a80, %r22
	.word 0xb001c005  ! 59: ADD_R	add 	%r7, %r5, %r24
	.word 0xbe09ec29  ! 59: AND_I	and 	%r7, 0x0c29, %r31
	.word 0xa201e3ec  ! 59: ADD_I	add 	%r7, 0x03ec, %r17
	.word 0xae01e75f  ! 59: ADD_I	add 	%r7, 0x075f, %r23
	.word 0xac01c005  ! 59: ADD_R	add 	%r7, %r5, %r22
	.word 0xb000e295  ! 59: ADD_I	add 	%r3, 0x0295, %r24
	.word 0xba008005  ! 59: ADD_R	add 	%r2, %r5, %r29
	.word 0xbe012b94  ! 59: ADD_I	add 	%r4, 0x0b94, %r31
	.word 0xac098005  ! 59: AND_R	and 	%r6, %r5, %r22
	.word 0xba11e5e5  ! 59: OR_I	or 	%r7, 0x05e5, %r29
	.word 0xb410c005  ! 59: OR_R	or 	%r3, %r5, %r26
	.word 0xa6012f3f  ! 59: ADD_I	add 	%r4, 0x0f3f, %r19
	.word 0xa400a972  ! 59: ADD_I	add 	%r2, 0x0972, %r18
	.word 0xb2088005  ! 59: AND_R	and 	%r2, %r5, %r25
	.word 0xbc018005  ! 59: ADD_R	add 	%r6, %r5, %r30
	.word 0xb008c005  ! 59: AND_R	and 	%r3, %r5, %r24
	.word 0xbe10c005  ! 59: OR_R	or 	%r3, %r5, %r31
	.word 0xb400a45b  ! 59: ADD_I	add 	%r2, 0x045b, %r26
	.word 0xac01e4d7  ! 59: ADD_I	add 	%r7, 0x04d7, %r22
	.word 0xa001a90a  ! 59: ADD_I	add 	%r6, 0x090a, %r16
	.word 0xa808c005  ! 59: AND_R	and 	%r3, %r5, %r20
	.word 0x9e098005  ! 59: AND_R	and 	%r6, %r5, %r15
	.word 0xa0108005  ! 59: OR_R	or 	%r2, %r5, %r16
	.word 0xa4112f20  ! 59: OR_I	or 	%r4, 0x0f20, %r18
	.word 0xa2108005  ! 59: OR_R	or 	%r2, %r5, %r17
	.word 0xb4108005  ! 59: OR_R	or 	%r2, %r5, %r26
	.word 0xa211e89a  ! 59: OR_I	or 	%r7, 0x089a, %r17
	.word 0xa800a1f0  ! 59: ADD_I	add 	%r2, 0x01f0, %r20
	.word 0xa2012234  ! 59: ADD_I	add 	%r4, 0x0234, %r17
	.word 0xa2088005  ! 59: AND_R	and 	%r2, %r5, %r17
	.word 0x9e108005  ! 59: OR_R	or 	%r2, %r5, %r15
	.word 0xa608a33c  ! 59: AND_I	and 	%r2, 0x033c, %r19
	.word 0xbc00e6ad  ! 59: ADD_I	add 	%r3, 0x06ad, %r30
	.word 0xbc108005  ! 59: OR_R	or 	%r2, %r5, %r30
	.word 0xbc11a4d4  ! 59: OR_I	or 	%r6, 0x04d4, %r30
	.word 0xba00a7e1  ! 59: ADD_I	add 	%r2, 0x07e1, %r29
	.word 0xa611e389  ! 59: OR_I	or 	%r7, 0x0389, %r19
	.word 0xa8108005  ! 59: OR_R	or 	%r2, %r5, %r20
	.word 0xb2010005  ! 59: ADD_R	add 	%r4, %r5, %r25
	.word 0xa8018005  ! 59: ADD_R	add 	%r6, %r5, %r20
	.word 0xac09c005  ! 59: AND_R	and 	%r7, %r5, %r22
	.word 0xb609a92c  ! 59: AND_I	and 	%r6, 0x092c, %r27
	.word 0x9e00e674  ! 59: ADD_I	add 	%r3, 0x0674, %r15
	.word 0xa410ead9  ! 59: OR_I	or 	%r3, 0x0ad9, %r18
	.word 0x9a08ebb4  ! 59: AND_I	and 	%r3, 0x0bb4, %r13
	.word 0xb800a21e  ! 59: ADD_I	add 	%r2, 0x021e, %r28
	.word 0xac108005  ! 59: OR_R	or 	%r2, %r5, %r22
	.word 0xb400a280  ! 59: ADD_I	add 	%r2, 0x0280, %r26
	.word 0xb0098005  ! 59: AND_R	and 	%r6, %r5, %r24
	.word 0xac01ebec  ! 59: ADD_I	add 	%r7, 0x0bec, %r22
	.word 0xba098005  ! 59: AND_R	and 	%r6, %r5, %r29
	.word 0xbe01abf7  ! 59: ADD_I	add 	%r6, 0x0bf7, %r31
	.word 0xa6110005  ! 59: OR_R	or 	%r4, %r5, %r19
	.word 0xa011a629  ! 59: OR_I	or 	%r6, 0x0629, %r16
	.word 0xb0018005  ! 59: ADD_R	add 	%r6, %r5, %r24
	.word 0xb8012be5  ! 59: ADD_I	add 	%r4, 0x0be5, %r28
	.word 0xa401c005  ! 59: ADD_R	add 	%r7, %r5, %r18
	.word 0x9c090005  ! 59: AND_R	and 	%r4, %r5, %r14
	.word 0xb61126b2  ! 59: OR_I	or 	%r4, 0x06b2, %r27
	.word 0xa410ad94  ! 59: OR_I	or 	%r2, 0x0d94, %r18
	.word 0xbe108005  ! 59: OR_R	or 	%r2, %r5, %r31
	.word 0x9c00a7ce  ! 59: ADD_I	add 	%r2, 0x07ce, %r14
	.word 0xb4092af7  ! 59: AND_I	and 	%r4, 0x0af7, %r26
	.word 0xb0088005  ! 59: AND_R	and 	%r2, %r5, %r24
	.word 0x9e08e724  ! 59: AND_I	and 	%r3, 0x0724, %r15
	.word 0x9a110005  ! 59: OR_R	or 	%r4, %r5, %r13
	.word 0xbe09a7f1  ! 59: AND_I	and 	%r6, 0x07f1, %r31
	.word 0xac088005  ! 59: AND_R	and 	%r2, %r5, %r22
	.word 0xa6098005  ! 59: AND_R	and 	%r6, %r5, %r19
	.word 0xee20a454  ! 59: STW_I	stw	%r23, [%r2 + 0x0454]
	.word 0xfc30a7ae  ! 59: STH_I	sth	%r30, [%r2 + 0x07ae]
	.word 0xf2312eca  ! 59: STH_I	sth	%r25, [%r4 + 0x0eca]
	.word 0xe820e8b0  ! 59: STW_I	stw	%r20, [%r3 + 0x08b0]
IRF_CE_31:
!$EV error(3,expr(@VA(.MAIN.IRF_CE_31), 16, 16), 1,IRF,ce,61,x, x,x,x, x,x,x)
!$EV error(3,expr(@VA(.MAIN.IRF_CE_31), 16, 16), 3,IRF,ce,9,x, x,x,x, x,x,x)
	.word 0xe020afec  ! 59: STW_I	stw	%r16, [%r2 + 0x0fec]
	.word 0xf42925de  ! 59: STB_I	stb	%r26, [%r4 + 0x05de]
	.word 0xf630ae04  ! 59: STH_I	sth	%r27, [%r2 + 0x0e04]
	.word 0xd6f28988  ! 59: STXA_R	stxa	%r11, [%r10 + %r8] 0x4c
	.word 0xb8098005  ! 59: AND_R	and 	%r6, %r5, %r28
	.word 0x9c09e473  ! 59: AND_I	and 	%r7, 0x0473, %r14
	bne thr3_loop_7
	subcc %g1, 0x1, %g1
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr3_loop_8:
	.word 0xae092e03  ! 66: AND_I	and 	%r4, 0x0e03, %r23
	.word 0xba08e6e1  ! 66: AND_I	and 	%r3, 0x06e1, %r29
	.word 0xa601e3f2  ! 66: ADD_I	add 	%r7, 0x03f2, %r19
	.word 0x9a08aad3  ! 66: AND_I	and 	%r2, 0x0ad3, %r13
	.word 0xaa10a376  ! 66: OR_I	or 	%r2, 0x0376, %r21
	.word 0xb811efb6  ! 66: OR_I	or 	%r7, 0x0fb6, %r28
	.word 0xb200e16d  ! 66: ADD_I	add 	%r3, 0x016d, %r25
	.word 0xac00a46b  ! 66: ADD_I	add 	%r2, 0x046b, %r22
	.word 0xaa018005  ! 66: ADD_R	add 	%r6, %r5, %r21
	.word 0xa8108005  ! 66: OR_R	or 	%r2, %r5, %r20
	.word 0xb011a60b  ! 66: OR_I	or 	%r6, 0x060b, %r24
	.word 0xac092e3e  ! 66: AND_I	and 	%r4, 0x0e3e, %r22
	.word 0xa0088005  ! 66: AND_R	and 	%r2, %r5, %r16
	.word 0xa600a17d  ! 66: ADD_I	add 	%r2, 0x017d, %r19
	.word 0xaa09a4bc  ! 66: AND_I	and 	%r6, 0x04bc, %r21
	.word 0x9e01a1c9  ! 66: ADD_I	add 	%r6, 0x01c9, %r15
	.word 0xbc11c005  ! 66: OR_R	or 	%r7, %r5, %r30
	.word 0xb8018005  ! 66: ADD_R	add 	%r6, %r5, %r28
	.word 0xae112589  ! 66: OR_I	or 	%r4, 0x0589, %r23
	.word 0xa010ece9  ! 66: OR_I	or 	%r3, 0x0ce9, %r16
	.word 0xb2018005  ! 66: ADD_R	add 	%r6, %r5, %r25
	.word 0xa609240f  ! 66: AND_I	and 	%r4, 0x040f, %r19
	.word 0xba008005  ! 66: ADD_R	add 	%r2, %r5, %r29
	.word 0xb8012a85  ! 66: ADD_I	add 	%r4, 0x0a85, %r28
	.word 0xbc112265  ! 66: OR_I	or 	%r4, 0x0265, %r30
	.word 0xaa09a874  ! 66: AND_I	and 	%r6, 0x0874, %r21
	.word 0x9c00edd1  ! 66: ADD_I	add 	%r3, 0x0dd1, %r14
	.word 0x9c10aa4f  ! 66: OR_I	or 	%r2, 0x0a4f, %r14
	.word 0xb611a12d  ! 66: OR_I	or 	%r6, 0x012d, %r27
	.word 0xb210a4b4  ! 66: OR_I	or 	%r2, 0x04b4, %r25
	.word 0xa009c005  ! 66: AND_R	and 	%r7, %r5, %r16
	.word 0xa811c005  ! 66: OR_R	or 	%r7, %r5, %r20
	.word 0xb4110005  ! 66: OR_R	or 	%r4, %r5, %r26
	.word 0xb211e1d3  ! 66: OR_I	or 	%r7, 0x01d3, %r25
	.word 0xbc08ed62  ! 66: AND_I	and 	%r3, 0x0d62, %r30
	.word 0xbe08c005  ! 66: AND_R	and 	%r3, %r5, %r31
	.word 0xa211c005  ! 66: OR_R	or 	%r7, %r5, %r17
	.word 0x9a08a730  ! 66: AND_I	and 	%r2, 0x0730, %r13
	.word 0xa0008005  ! 66: ADD_R	add 	%r2, %r5, %r16
	.word 0x9e08e081  ! 66: AND_I	and 	%r3, 0x0081, %r15
	.word 0xa211a447  ! 66: OR_I	or 	%r6, 0x0447, %r17
	.word 0xae09e789  ! 66: AND_I	and 	%r7, 0x0789, %r23
	.word 0xa0112ddc  ! 66: OR_I	or 	%r4, 0x0ddc, %r16
	.word 0xbe108005  ! 66: OR_R	or 	%r2, %r5, %r31
	.word 0xbe108005  ! 66: OR_R	or 	%r2, %r5, %r31
	.word 0xa4012ee7  ! 66: ADD_I	add 	%r4, 0x0ee7, %r18
	.word 0xba11a04c  ! 66: OR_I	or 	%r6, 0x004c, %r29
	.word 0xaa108005  ! 66: OR_R	or 	%r2, %r5, %r21
	.word 0xa011e49f  ! 66: OR_I	or 	%r7, 0x049f, %r16
	.word 0x9a098005  ! 66: AND_R	and 	%r6, %r5, %r13
	.word 0xaa108005  ! 66: OR_R	or 	%r2, %r5, %r21
	.word 0xae088005  ! 66: AND_R	and 	%r2, %r5, %r23
	.word 0xa210e6f1  ! 66: OR_I	or 	%r3, 0x06f1, %r17
	.word 0xa2012bb6  ! 66: ADD_I	add 	%r4, 0x0bb6, %r17
	.word 0x9a01e22b  ! 66: ADD_I	add 	%r7, 0x022b, %r13
	.word 0xae0121bf  ! 66: ADD_I	add 	%r4, 0x01bf, %r23
	.word 0xb000c005  ! 66: ADD_R	add 	%r3, %r5, %r24
	.word 0xb200c005  ! 66: ADD_R	add 	%r3, %r5, %r25
	.word 0xa6110005  ! 66: OR_R	or 	%r4, %r5, %r19
	.word 0xba018005  ! 66: ADD_R	add 	%r6, %r5, %r29
	.word 0xb6118005  ! 66: OR_R	or 	%r6, %r5, %r27
	.word 0xb4010005  ! 66: ADD_R	add 	%r4, %r5, %r26
	.word 0xa208e258  ! 66: AND_I	and 	%r3, 0x0258, %r17
	.word 0xac11c005  ! 66: OR_R	or 	%r7, %r5, %r22
	.word 0xb208c005  ! 66: AND_R	and 	%r3, %r5, %r25
	.word 0xac010005  ! 66: ADD_R	add 	%r4, %r5, %r22
	.word 0xba1121ee  ! 66: OR_I	or 	%r4, 0x01ee, %r29
	.word 0xa8108005  ! 66: OR_R	or 	%r2, %r5, %r20
	.word 0xb408c005  ! 66: AND_R	and 	%r3, %r5, %r26
	.word 0x9a08af36  ! 66: AND_I	and 	%r2, 0x0f36, %r13
	.word 0xa4118005  ! 66: OR_R	or 	%r6, %r5, %r18
	.word 0xa2008005  ! 66: ADD_R	add 	%r2, %r5, %r17
	.word 0x9e00abe5  ! 66: ADD_I	add 	%r2, 0x0be5, %r15
	.word 0xaa00c005  ! 66: ADD_R	add 	%r3, %r5, %r21
	.word 0xa001a4a5  ! 66: ADD_I	add 	%r6, 0x04a5, %r16
	.word 0xa610ac36  ! 66: OR_I	or 	%r2, 0x0c36, %r19
	.word 0xba09a1ce  ! 66: AND_I	and 	%r6, 0x01ce, %r29
	.word 0xa8098005  ! 66: AND_R	and 	%r6, %r5, %r20
	.word 0xbe118005  ! 66: OR_R	or 	%r6, %r5, %r31
	.word 0xb010e788  ! 66: OR_I	or 	%r3, 0x0788, %r24
	.word 0xb0010005  ! 66: ADD_R	add 	%r4, %r5, %r24
	.word 0xa4008005  ! 66: ADD_R	add 	%r2, %r5, %r18
	.word 0xba098005  ! 66: AND_R	and 	%r6, %r5, %r29
	.word 0xae10e1e4  ! 66: OR_I	or 	%r3, 0x01e4, %r23
	.word 0xa8008005  ! 66: ADD_R	add 	%r2, %r5, %r20
	.word 0xa0090005  ! 66: AND_R	and 	%r4, %r5, %r16
	.word 0xa209c005  ! 66: AND_R	and 	%r7, %r5, %r17
	.word 0x9c088005  ! 66: AND_R	and 	%r2, %r5, %r14
	.word 0xac09e427  ! 66: AND_I	and 	%r7, 0x0427, %r22
	.word 0xb200a0dc  ! 66: ADD_I	add 	%r2, 0x00dc, %r25
	.word 0xb210ec96  ! 66: OR_I	or 	%r3, 0x0c96, %r25
	.word 0xb000c005  ! 66: ADD_R	add 	%r3, %r5, %r24
	.word 0xba09ebb9  ! 66: AND_I	and 	%r7, 0x0bb9, %r29
	.word 0xb4008005  ! 66: ADD_R	add 	%r2, %r5, %r26
	.word 0xb0112ae8  ! 66: OR_I	or 	%r4, 0x0ae8, %r24
	.word 0xbc0128d3  ! 66: ADD_I	add 	%r4, 0x08d3, %r30
	.word 0xbc11a93e  ! 66: OR_I	or 	%r6, 0x093e, %r30
	.word 0xa810ef23  ! 66: OR_I	or 	%r3, 0x0f23, %r20
	.word 0xb208a2b8  ! 66: AND_I	and 	%r2, 0x02b8, %r25
	.word 0xba01c005  ! 66: ADD_R	add 	%r7, %r5, %r29
	.word 0x9a08c005  ! 66: AND_R	and 	%r3, %r5, %r13
	.word 0xb6008005  ! 66: ADD_R	add 	%r2, %r5, %r27
	.word 0xb601e66e  ! 66: ADD_I	add 	%r7, 0x066e, %r27
	.word 0xaa11ea43  ! 66: OR_I	or 	%r7, 0x0a43, %r21
	.word 0xa000a25f  ! 66: ADD_I	add 	%r2, 0x025f, %r16
	.word 0x9e108005  ! 66: OR_R	or 	%r2, %r5, %r15
	.word 0x9c00a048  ! 66: ADD_I	add 	%r2, 0x0048, %r14
	.word 0xa8118005  ! 66: OR_R	or 	%r6, %r5, %r20
	.word 0x9c108005  ! 66: OR_R	or 	%r2, %r5, %r14
	.word 0xaa118005  ! 66: OR_R	or 	%r6, %r5, %r21
	.word 0xbe11ac68  ! 66: OR_I	or 	%r6, 0x0c68, %r31
	.word 0xba012d3d  ! 66: ADD_I	add 	%r4, 0x0d3d, %r29
	.word 0xbc08a6f8  ! 66: AND_I	and 	%r2, 0x06f8, %r30
	.word 0xa008e030  ! 66: AND_I	and 	%r3, 0x0030, %r16
	.word 0xbe11a77a  ! 66: OR_I	or 	%r6, 0x077a, %r31
	.word 0xae10e570  ! 66: OR_I	or 	%r3, 0x0570, %r23
	.word 0x9a00a5d6  ! 66: ADD_I	add 	%r2, 0x05d6, %r13
	.word 0xb8018005  ! 66: ADD_R	add 	%r6, %r5, %r28
	.word 0xb201a78e  ! 66: ADD_I	add 	%r6, 0x078e, %r25
	.word 0xa8118005  ! 66: OR_R	or 	%r6, %r5, %r20
	.word 0xb208aa8f  ! 66: AND_I	and 	%r2, 0x0a8f, %r25
	.word 0xb6098005  ! 66: AND_R	and 	%r6, %r5, %r27
	.word 0xa010ada3  ! 66: OR_I	or 	%r2, 0x0da3, %r16
	.word 0xb40123e9  ! 66: ADD_I	add 	%r4, 0x03e9, %r26
	.word 0xaa108005  ! 66: OR_R	or 	%r2, %r5, %r21
	.word 0xb2108005  ! 66: OR_R	or 	%r2, %r5, %r25
	.word 0x9e10efae  ! 66: OR_I	or 	%r3, 0x0fae, %r15
	.word 0xac10af78  ! 66: OR_I	or 	%r2, 0x0f78, %r22
	.word 0xa4008005  ! 66: ADD_R	add 	%r2, %r5, %r18
	.word 0xa009a69a  ! 66: AND_I	and 	%r6, 0x069a, %r16
	.word 0xbe01ebe9  ! 66: ADD_I	add 	%r7, 0x0be9, %r31
	.word 0xbe09a734  ! 66: AND_I	and 	%r6, 0x0734, %r31
	.word 0xa409c005  ! 66: AND_R	and 	%r7, %r5, %r18
	.word 0xa409ef07  ! 66: AND_I	and 	%r7, 0x0f07, %r18
	.word 0xa811c005  ! 66: OR_R	or 	%r7, %r5, %r20
	.word 0xb21125e0  ! 66: OR_I	or 	%r4, 0x05e0, %r25
	.word 0xda21e9cc  ! 66: STW_I	stw	%r13, [%r7 + 0x09cc]
	.word 0xf271ec20  ! 66: STX_I	stx	%r25, [%r7 + 0x0c20]
	.word 0xe62925b6  ! 66: STB_I	stb	%r19, [%r4 + 0x05b6]
	.word 0xfa21aee4  ! 66: STW_I	stw	%r29, [%r6 + 0x0ee4]
IRF_CE_35:
!$EV error(3,expr(@VA(.MAIN.IRF_CE_35), 16, 16), 1,IRF,ce,55,x, x,x,x, x,x,x)
!$EV error(3,expr(@VA(.MAIN.IRF_CE_35), 16, 16), 3,IRF,ce,50,x, x,x,x, x,x,x)
	.word 0xfe29ef6b  ! 66: STB_I	stb	%r31, [%r7 + 0x0f6b]
	.word 0xfa20a0bc  ! 66: STW_I	stw	%r29, [%r2 + 0x00bc]
	.word 0xe820a0bc  ! 66: STW_I	stw	%r20, [%r2 + 0x00bc]
	.word 0xe9388005  ! 66: STDF_R	std	%f20, [%r5, %r2]
	.word 0xba00c005  ! 66: ADD_R	add 	%r3, %r5, %r29
	.word 0xba00ae08  ! 66: ADD_I	add 	%r2, 0x0e08, %r29
	bne thr3_loop_8
	subcc %g1, 0x1, %g1
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr3_loop_9:
	.word 0xa011eb90  ! 73: OR_I	or 	%r7, 0x0b90, %r16
	.word 0xa0008005  ! 73: ADD_R	add 	%r2, %r5, %r16
	.word 0x9a018005  ! 73: ADD_R	add 	%r6, %r5, %r13
	.word 0xbe08a5e9  ! 73: AND_I	and 	%r2, 0x05e9, %r31
	.word 0xac10a8b5  ! 73: OR_I	or 	%r2, 0x08b5, %r22
	.word 0xac08a52e  ! 73: AND_I	and 	%r2, 0x052e, %r22
	.word 0xb201c005  ! 73: ADD_R	add 	%r7, %r5, %r25
	.word 0xb0110005  ! 73: OR_R	or 	%r4, %r5, %r24
	.word 0xb009eb89  ! 73: AND_I	and 	%r7, 0x0b89, %r24
	.word 0xb2012716  ! 73: ADD_I	add 	%r4, 0x0716, %r25
	.word 0xb4090005  ! 73: AND_R	and 	%r4, %r5, %r26
	.word 0x9a08e66a  ! 73: AND_I	and 	%r3, 0x066a, %r13
	.word 0x9a08c005  ! 73: AND_R	and 	%r3, %r5, %r13
	.word 0x9a108005  ! 73: OR_R	or 	%r2, %r5, %r13
	.word 0xb608a768  ! 73: AND_I	and 	%r2, 0x0768, %r27
	.word 0xb208c005  ! 73: AND_R	and 	%r3, %r5, %r25
	.word 0xb010c005  ! 73: OR_R	or 	%r3, %r5, %r24
	.word 0xac0922fe  ! 73: AND_I	and 	%r4, 0x02fe, %r22
	.word 0xb4108005  ! 73: OR_R	or 	%r2, %r5, %r26
	.word 0xa809a88a  ! 73: AND_I	and 	%r6, 0x088a, %r20
	.word 0x9c01c005  ! 73: ADD_R	add 	%r7, %r5, %r14
	.word 0xb6008005  ! 73: ADD_R	add 	%r2, %r5, %r27
	.word 0x9c08ebc2  ! 73: AND_I	and 	%r3, 0x0bc2, %r14
	.word 0xae010005  ! 73: ADD_R	add 	%r4, %r5, %r23
	.word 0xae10e9e8  ! 73: OR_I	or 	%r3, 0x09e8, %r23
	.word 0xb6108005  ! 73: OR_R	or 	%r2, %r5, %r27
	.word 0x9a09a812  ! 73: AND_I	and 	%r6, 0x0812, %r13
	.word 0xaa00ea75  ! 73: ADD_I	add 	%r3, 0x0a75, %r21
	.word 0x9e098005  ! 73: AND_R	and 	%r6, %r5, %r15
	.word 0xb208a0f2  ! 73: AND_I	and 	%r2, 0x00f2, %r25
	.word 0xa010c005  ! 73: OR_R	or 	%r3, %r5, %r16
	.word 0xb011c005  ! 73: OR_R	or 	%r7, %r5, %r24
	.word 0xa001ebe6  ! 73: ADD_I	add 	%r7, 0x0be6, %r16
	.word 0xa008ec45  ! 73: AND_I	and 	%r3, 0x0c45, %r16
	.word 0x9e11c005  ! 73: OR_R	or 	%r7, %r5, %r15
	.word 0xb4098005  ! 73: AND_R	and 	%r6, %r5, %r26
	.word 0x9c09a420  ! 73: AND_I	and 	%r6, 0x0420, %r14
	.word 0xbe10c005  ! 73: OR_R	or 	%r3, %r5, %r31
	.word 0x9a09c005  ! 73: AND_R	and 	%r7, %r5, %r13
	.word 0xa408c005  ! 73: AND_R	and 	%r3, %r5, %r18
	.word 0xbe11a6cf  ! 73: OR_I	or 	%r6, 0x06cf, %r31
	.word 0xb800a8cf  ! 73: ADD_I	add 	%r2, 0x08cf, %r28
	.word 0xaa11eb82  ! 73: OR_I	or 	%r7, 0x0b82, %r21
	.word 0xa2008005  ! 73: ADD_R	add 	%r2, %r5, %r17
	.word 0x9c088005  ! 73: AND_R	and 	%r2, %r5, %r14
	.word 0xae118005  ! 73: OR_R	or 	%r6, %r5, %r23
	.word 0xba098005  ! 73: AND_R	and 	%r6, %r5, %r29
	.word 0x9c010005  ! 73: ADD_R	add 	%r4, %r5, %r14
	.word 0xa400eaf6  ! 73: ADD_I	add 	%r3, 0x0af6, %r18
	.word 0xac018005  ! 73: ADD_R	add 	%r6, %r5, %r22
	.word 0xa600ac46  ! 73: ADD_I	add 	%r2, 0x0c46, %r19
	.word 0xb408e824  ! 73: AND_I	and 	%r3, 0x0824, %r26
	.word 0xa6018005  ! 73: ADD_R	add 	%r6, %r5, %r19
	.word 0xa2018005  ! 73: ADD_R	add 	%r6, %r5, %r17
	.word 0xb410c005  ! 73: OR_R	or 	%r3, %r5, %r26
	.word 0xb210ab02  ! 73: OR_I	or 	%r2, 0x0b02, %r25
	.word 0xa2090005  ! 73: AND_R	and 	%r4, %r5, %r17
	.word 0xa001c005  ! 73: ADD_R	add 	%r7, %r5, %r16
	.word 0xa2088005  ! 73: AND_R	and 	%r2, %r5, %r17
	.word 0xa4110005  ! 73: OR_R	or 	%r4, %r5, %r18
	.word 0x9c10c005  ! 73: OR_R	or 	%r3, %r5, %r14
	.word 0xac01e962  ! 73: ADD_I	add 	%r7, 0x0962, %r22
	.word 0xa401c005  ! 73: ADD_R	add 	%r7, %r5, %r18
	.word 0x9a00acd4  ! 73: ADD_I	add 	%r2, 0x0cd4, %r13
	.word 0xa2088005  ! 73: AND_R	and 	%r2, %r5, %r17
	.word 0xae118005  ! 73: OR_R	or 	%r6, %r5, %r23
	.word 0xa8092c5a  ! 73: AND_I	and 	%r4, 0x0c5a, %r20
	.word 0xa4108005  ! 73: OR_R	or 	%r2, %r5, %r18
	.word 0xb0118005  ! 73: OR_R	or 	%r6, %r5, %r24
	.word 0xbe098005  ! 73: AND_R	and 	%r6, %r5, %r31
	.word 0xaa01c005  ! 73: ADD_R	add 	%r7, %r5, %r21
	.word 0xbe01c005  ! 73: ADD_R	add 	%r7, %r5, %r31
	.word 0xa001ef2b  ! 73: ADD_I	add 	%r7, 0x0f2b, %r16
	.word 0xa2008005  ! 73: ADD_R	add 	%r2, %r5, %r17
	.word 0xa000ecc5  ! 73: ADD_I	add 	%r3, 0x0cc5, %r16
	.word 0xb610a3f1  ! 73: OR_I	or 	%r2, 0x03f1, %r27
	.word 0xa208e0e0  ! 73: AND_I	and 	%r3, 0x00e0, %r17
	.word 0x9e08c005  ! 73: AND_R	and 	%r3, %r5, %r15
	.word 0xa401aa35  ! 73: ADD_I	add 	%r6, 0x0a35, %r18
	.word 0x9c0122fc  ! 73: ADD_I	add 	%r4, 0x02fc, %r14
	.word 0xb800a3b7  ! 73: ADD_I	add 	%r2, 0x03b7, %r28
	.word 0xbc08a3cf  ! 73: AND_I	and 	%r2, 0x03cf, %r30
	.word 0xbe00a10a  ! 73: ADD_I	add 	%r2, 0x010a, %r31
	.word 0xbe08e616  ! 73: AND_I	and 	%r3, 0x0616, %r31
	.word 0xae110005  ! 73: OR_R	or 	%r4, %r5, %r23
	.word 0xae008005  ! 73: ADD_R	add 	%r2, %r5, %r23
	.word 0xb0008005  ! 73: ADD_R	add 	%r2, %r5, %r24
	.word 0xa4112e96  ! 73: OR_I	or 	%r4, 0x0e96, %r18
	.word 0xbe11e3b5  ! 73: OR_I	or 	%r7, 0x03b5, %r31
	.word 0x9c008005  ! 73: ADD_R	add 	%r2, %r5, %r14
	.word 0xa8010005  ! 73: ADD_R	add 	%r4, %r5, %r20
	.word 0xa4088005  ! 73: AND_R	and 	%r2, %r5, %r18
	.word 0xa0092c5d  ! 73: AND_I	and 	%r4, 0x0c5d, %r16
	.word 0xa6108005  ! 73: OR_R	or 	%r2, %r5, %r19
	.word 0x9e10c005  ! 73: OR_R	or 	%r3, %r5, %r15
	.word 0xbc10adb7  ! 73: OR_I	or 	%r2, 0x0db7, %r30
	.word 0xa201e3c5  ! 73: ADD_I	add 	%r7, 0x03c5, %r17
	.word 0xa200a92e  ! 73: ADD_I	add 	%r2, 0x092e, %r17
	.word 0x9c09e1d0  ! 73: AND_I	and 	%r7, 0x01d0, %r14
	.word 0xb200ad94  ! 73: ADD_I	add 	%r2, 0x0d94, %r25
	.word 0xb810a872  ! 73: OR_I	or 	%r2, 0x0872, %r28
	.word 0xa010aac8  ! 73: OR_I	or 	%r2, 0x0ac8, %r16
	.word 0xb8010005  ! 73: ADD_R	add 	%r4, %r5, %r28
	.word 0xbe01c005  ! 73: ADD_R	add 	%r7, %r5, %r31
	.word 0xaa01af44  ! 73: ADD_I	add 	%r6, 0x0f44, %r21
	.word 0xb401c005  ! 73: ADD_R	add 	%r7, %r5, %r26
	.word 0x9c108005  ! 73: OR_R	or 	%r2, %r5, %r14
	.word 0x9c00a5ec  ! 73: ADD_I	add 	%r2, 0x05ec, %r14
	.word 0xb410a72a  ! 73: OR_I	or 	%r2, 0x072a, %r26
	.word 0xac098005  ! 73: AND_R	and 	%r6, %r5, %r22
	.word 0xb80926f2  ! 73: AND_I	and 	%r4, 0x06f2, %r28
	.word 0x9c008005  ! 73: ADD_R	add 	%r2, %r5, %r14
	.word 0xb011e9e9  ! 73: OR_I	or 	%r7, 0x09e9, %r24
	.word 0xb608a021  ! 73: AND_I	and 	%r2, 0x0021, %r27
	.word 0xbc108005  ! 73: OR_R	or 	%r2, %r5, %r30
	.word 0xae00c005  ! 73: ADD_R	add 	%r3, %r5, %r23
	.word 0xb600ec8d  ! 73: ADD_I	add 	%r3, 0x0c8d, %r27
	.word 0x9a00ea3c  ! 73: ADD_I	add 	%r3, 0x0a3c, %r13
	.word 0xac112d99  ! 73: OR_I	or 	%r4, 0x0d99, %r22
	.word 0xbc088005  ! 73: AND_R	and 	%r2, %r5, %r30
	.word 0x9c0122a7  ! 73: ADD_I	add 	%r4, 0x02a7, %r14
	.word 0x9e118005  ! 73: OR_R	or 	%r6, %r5, %r15
	.word 0x9c01aef0  ! 73: ADD_I	add 	%r6, 0x0ef0, %r14
	.word 0xa600c005  ! 73: ADD_R	add 	%r3, %r5, %r19
	.word 0xb4108005  ! 73: OR_R	or 	%r2, %r5, %r26
	.word 0xb8010005  ! 73: ADD_R	add 	%r4, %r5, %r28
	.word 0xbe08aef1  ! 73: AND_I	and 	%r2, 0x0ef1, %r31
	.word 0x9a01a42b  ! 73: ADD_I	add 	%r6, 0x042b, %r13
	.word 0xa2018005  ! 73: ADD_R	add 	%r6, %r5, %r17
	.word 0xbc008005  ! 73: ADD_R	add 	%r2, %r5, %r30
	.word 0xb609ac53  ! 73: AND_I	and 	%r6, 0x0c53, %r27
	.word 0x9a09e1e7  ! 73: AND_I	and 	%r7, 0x01e7, %r13
	.word 0xb800c005  ! 73: ADD_R	add 	%r3, %r5, %r28
	.word 0xb4008005  ! 73: ADD_R	add 	%r2, %r5, %r26
	.word 0x9e098005  ! 73: AND_R	and 	%r6, %r5, %r15
	.word 0xb200a52e  ! 73: ADD_I	add 	%r2, 0x052e, %r25
	.word 0xf4212400  ! 73: STW_I	stw	%r26, [%r4 + 0x0400]
	.word 0xf031efde  ! 73: STH_I	sth	%r24, [%r7 + 0x0fde]
	.word 0xf0212268  ! 73: STW_I	stw	%r24, [%r4 + 0x0268]
	.word 0xee71a598  ! 73: STX_I	stx	%r23, [%r6 + 0x0598]
IRF_CE_39:
!$EV error(3,expr(@VA(.MAIN.IRF_CE_39), 16, 16), 1,IRF,ce,41,x, x,x,x, x,x,x)
!$EV error(3,expr(@VA(.MAIN.IRF_CE_39), 16, 16), 3,IRF,ce,40,x, x,x,x, x,x,x)
	.word 0xdc28a489  ! 73: STB_I	stb	%r14, [%r2 + 0x0489]
	.word 0xea21e91c  ! 73: STW_I	stw	%r21, [%r7 + 0x091c]
	.word 0xfc70aff8  ! 73: STX_I	stx	%r30, [%r2 + 0x0ff8]
	.word 0xef21c005  ! 73: STF_R	st	%f23, [%r5, %r7]
	.word 0xa2108005  ! 73: OR_R	or 	%r2, %r5, %r17
	.word 0x9e08c005  ! 73: AND_R	and 	%r3, %r5, %r15
	bne thr3_loop_9
	subcc %g1, 0x1, %g1
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr3_loop_10:
	.word 0xb808c005  ! 80: AND_R	and 	%r3, %r5, %r28
	.word 0xb611230b  ! 80: OR_I	or 	%r4, 0x030b, %r27
	.word 0xbe01e8f7  ! 80: ADD_I	add 	%r7, 0x08f7, %r31
	.word 0xba10ac7b  ! 80: OR_I	or 	%r2, 0x0c7b, %r29
	.word 0xa2088005  ! 80: AND_R	and 	%r2, %r5, %r17
	.word 0xa009230d  ! 80: AND_I	and 	%r4, 0x030d, %r16
	.word 0xb409a1f1  ! 80: AND_I	and 	%r6, 0x01f1, %r26
	.word 0xba00eb71  ! 80: ADD_I	add 	%r3, 0x0b71, %r29
	.word 0xb2012b3d  ! 80: ADD_I	add 	%r4, 0x0b3d, %r25
	.word 0xb411225f  ! 80: OR_I	or 	%r4, 0x025f, %r26
	.word 0xac09252c  ! 80: AND_I	and 	%r4, 0x052c, %r22
	.word 0xb2092bce  ! 80: AND_I	and 	%r4, 0x0bce, %r25
	.word 0x9e008005  ! 80: ADD_R	add 	%r2, %r5, %r15
	.word 0xb608e757  ! 80: AND_I	and 	%r3, 0x0757, %r27
	.word 0x9e00e70a  ! 80: ADD_I	add 	%r3, 0x070a, %r15
	.word 0xa210e778  ! 80: OR_I	or 	%r3, 0x0778, %r17
	.word 0xb010ee58  ! 80: OR_I	or 	%r3, 0x0e58, %r24
	.word 0xa611e988  ! 80: OR_I	or 	%r7, 0x0988, %r19
	.word 0xbe108005  ! 80: OR_R	or 	%r2, %r5, %r31
	.word 0xb209a0d3  ! 80: AND_I	and 	%r6, 0x00d3, %r25
	.word 0x9e11c005  ! 80: OR_R	or 	%r7, %r5, %r15
	.word 0x9c00c005  ! 80: ADD_R	add 	%r3, %r5, %r14
	.word 0xa6108005  ! 80: OR_R	or 	%r2, %r5, %r19
	.word 0xbc10c005  ! 80: OR_R	or 	%r3, %r5, %r30
	.word 0x9c10ab40  ! 80: OR_I	or 	%r2, 0x0b40, %r14
	.word 0xb609298d  ! 80: AND_I	and 	%r4, 0x098d, %r27
	.word 0xa6088005  ! 80: AND_R	and 	%r2, %r5, %r19
	.word 0xac00c005  ! 80: ADD_R	add 	%r3, %r5, %r22
	.word 0xae01ea83  ! 80: ADD_I	add 	%r7, 0x0a83, %r23
	.word 0xb0108005  ! 80: OR_R	or 	%r2, %r5, %r24
	.word 0xb200eb8d  ! 80: ADD_I	add 	%r3, 0x0b8d, %r25
	.word 0xa008ad4a  ! 80: AND_I	and 	%r2, 0x0d4a, %r16
	.word 0xae098005  ! 80: AND_R	and 	%r6, %r5, %r23
	.word 0xb800aaa0  ! 80: ADD_I	add 	%r2, 0x0aa0, %r28
	.word 0xae11a21b  ! 80: OR_I	or 	%r6, 0x021b, %r23
	.word 0xb2088005  ! 80: AND_R	and 	%r2, %r5, %r25
	.word 0xba11a847  ! 80: OR_I	or 	%r6, 0x0847, %r29
	.word 0x9a092fa0  ! 80: AND_I	and 	%r4, 0x0fa0, %r13
	.word 0xb010afaa  ! 80: OR_I	or 	%r2, 0x0faa, %r24
	.word 0xa800c005  ! 80: ADD_R	add 	%r3, %r5, %r20
	.word 0xbc10ad48  ! 80: OR_I	or 	%r2, 0x0d48, %r30
	.word 0x9e09e295  ! 80: AND_I	and 	%r7, 0x0295, %r15
	.word 0xb210c005  ! 80: OR_R	or 	%r3, %r5, %r25
	.word 0xa8012c5f  ! 80: ADD_I	add 	%r4, 0x0c5f, %r20
	.word 0xb2088005  ! 80: AND_R	and 	%r2, %r5, %r25
	.word 0x9c108005  ! 80: OR_R	or 	%r2, %r5, %r14
	.word 0xa8108005  ! 80: OR_R	or 	%r2, %r5, %r20
	.word 0xb4108005  ! 80: OR_R	or 	%r2, %r5, %r26
	.word 0x9a08c005  ! 80: AND_R	and 	%r3, %r5, %r13
	.word 0xba00ae00  ! 80: ADD_I	add 	%r2, 0x0e00, %r29
	.word 0xb8108005  ! 80: OR_R	or 	%r2, %r5, %r28
	.word 0xb208aa24  ! 80: AND_I	and 	%r2, 0x0a24, %r25
	.word 0xa6110005  ! 80: OR_R	or 	%r4, %r5, %r19
	.word 0xb401ea9c  ! 80: ADD_I	add 	%r7, 0x0a9c, %r26
	.word 0xae10e771  ! 80: OR_I	or 	%r3, 0x0771, %r23
	.word 0xa2110005  ! 80: OR_R	or 	%r4, %r5, %r17
	.word 0x9e088005  ! 80: AND_R	and 	%r2, %r5, %r15
	.word 0xb600a1c1  ! 80: ADD_I	add 	%r2, 0x01c1, %r27
	.word 0x9a092a57  ! 80: AND_I	and 	%r4, 0x0a57, %r13
	.word 0xb800ae72  ! 80: ADD_I	add 	%r2, 0x0e72, %r28
	.word 0xb201214f  ! 80: ADD_I	add 	%r4, 0x014f, %r25
	.word 0x9c00abdc  ! 80: ADD_I	add 	%r2, 0x0bdc, %r14
	.word 0xb201e7ff  ! 80: ADD_I	add 	%r7, 0x07ff, %r25
	.word 0xb6118005  ! 80: OR_R	or 	%r6, %r5, %r27
	.word 0xa0108005  ! 80: OR_R	or 	%r2, %r5, %r16
	.word 0xb4108005  ! 80: OR_R	or 	%r2, %r5, %r26
	.word 0x9a090005  ! 80: AND_R	and 	%r4, %r5, %r13
	.word 0x9a108005  ! 80: OR_R	or 	%r2, %r5, %r13
	.word 0x9a00e1f4  ! 80: ADD_I	add 	%r3, 0x01f4, %r13
	.word 0xac090005  ! 80: AND_R	and 	%r4, %r5, %r22
	.word 0x9a09e78b  ! 80: AND_I	and 	%r7, 0x078b, %r13
	.word 0xb411af08  ! 80: OR_I	or 	%r6, 0x0f08, %r26
	.word 0xbe108005  ! 80: OR_R	or 	%r2, %r5, %r31
	.word 0xaa01e7cf  ! 80: ADD_I	add 	%r7, 0x07cf, %r21
	.word 0x9c10c005  ! 80: OR_R	or 	%r3, %r5, %r14
	.word 0xb010c005  ! 80: OR_R	or 	%r3, %r5, %r24
	.word 0xae008005  ! 80: ADD_R	add 	%r2, %r5, %r23
	.word 0xb600e7aa  ! 80: ADD_I	add 	%r3, 0x07aa, %r27
	.word 0x9a11c005  ! 80: OR_R	or 	%r7, %r5, %r13
	.word 0xae09aded  ! 80: AND_I	and 	%r6, 0x0ded, %r23
	.word 0xba08ad68  ! 80: AND_I	and 	%r2, 0x0d68, %r29
	.word 0xa811e058  ! 80: OR_I	or 	%r7, 0x0058, %r20
	.word 0xac088005  ! 80: AND_R	and 	%r2, %r5, %r22
	.word 0xb001ac8b  ! 80: ADD_I	add 	%r6, 0x0c8b, %r24
	.word 0xac10e069  ! 80: OR_I	or 	%r3, 0x0069, %r22
	.word 0x9e01c005  ! 80: ADD_R	add 	%r7, %r5, %r15
	.word 0xb610ef2b  ! 80: OR_I	or 	%r3, 0x0f2b, %r27
	.word 0xb611a979  ! 80: OR_I	or 	%r6, 0x0979, %r27
	.word 0xaa10a90a  ! 80: OR_I	or 	%r2, 0x090a, %r21
	.word 0xa0098005  ! 80: AND_R	and 	%r6, %r5, %r16
	.word 0xb000e577  ! 80: ADD_I	add 	%r3, 0x0577, %r24
	.word 0xae010005  ! 80: ADD_R	add 	%r4, %r5, %r23
	.word 0xa8098005  ! 80: AND_R	and 	%r6, %r5, %r20
	.word 0xa808aa2a  ! 80: AND_I	and 	%r2, 0x0a2a, %r20
	.word 0xac08a48f  ! 80: AND_I	and 	%r2, 0x048f, %r22
	.word 0xa4108005  ! 80: OR_R	or 	%r2, %r5, %r18
	.word 0xa009e938  ! 80: AND_I	and 	%r7, 0x0938, %r16
	.word 0xa800a0d4  ! 80: ADD_I	add 	%r2, 0x00d4, %r20
	.word 0xa80121e8  ! 80: ADD_I	add 	%r4, 0x01e8, %r20
	.word 0xa600eba0  ! 80: ADD_I	add 	%r3, 0x0ba0, %r19
	.word 0xa010c005  ! 80: OR_R	or 	%r3, %r5, %r16
	.word 0xb408a08c  ! 80: AND_I	and 	%r2, 0x008c, %r26
	.word 0xa0018005  ! 80: ADD_R	add 	%r6, %r5, %r16
	.word 0xbc08a79a  ! 80: AND_I	and 	%r2, 0x079a, %r30
	.word 0xb0010005  ! 80: ADD_R	add 	%r4, %r5, %r24
	.word 0xa6110005  ! 80: OR_R	or 	%r4, %r5, %r19
	.word 0xba118005  ! 80: OR_R	or 	%r6, %r5, %r29
	.word 0xaa010005  ! 80: ADD_R	add 	%r4, %r5, %r21
	.word 0x9c008005  ! 80: ADD_R	add 	%r2, %r5, %r14
	.word 0xb208a889  ! 80: AND_I	and 	%r2, 0x0889, %r25
	.word 0xa011c005  ! 80: OR_R	or 	%r7, %r5, %r16
	.word 0xac09c005  ! 80: AND_R	and 	%r7, %r5, %r22
	.word 0xa210c005  ! 80: OR_R	or 	%r3, %r5, %r17
	.word 0x9c008005  ! 80: ADD_R	add 	%r2, %r5, %r14
	.word 0xb001c005  ! 80: ADD_R	add 	%r7, %r5, %r24
	.word 0xb611c005  ! 80: OR_R	or 	%r7, %r5, %r27
	.word 0xba11c005  ! 80: OR_R	or 	%r7, %r5, %r29
	.word 0xac08c005  ! 80: AND_R	and 	%r3, %r5, %r22
	.word 0xa409218c  ! 80: AND_I	and 	%r4, 0x018c, %r18
	.word 0xb811af3b  ! 80: OR_I	or 	%r6, 0x0f3b, %r28
	.word 0xaa01c005  ! 80: ADD_R	add 	%r7, %r5, %r21
	.word 0xa0112cd9  ! 80: OR_I	or 	%r4, 0x0cd9, %r16
	.word 0xac108005  ! 80: OR_R	or 	%r2, %r5, %r22
	.word 0xae09ea7f  ! 80: AND_I	and 	%r7, 0x0a7f, %r23
	.word 0xb011e2bf  ! 80: OR_I	or 	%r7, 0x02bf, %r24
	.word 0xb6112462  ! 80: OR_I	or 	%r4, 0x0462, %r27
	.word 0xbe00c005  ! 80: ADD_R	add 	%r3, %r5, %r31
	.word 0xbc01e162  ! 80: ADD_I	add 	%r7, 0x0162, %r30
	.word 0xb2088005  ! 80: AND_R	and 	%r2, %r5, %r25
	.word 0xa8098005  ! 80: AND_R	and 	%r6, %r5, %r20
	.word 0xae08a678  ! 80: AND_I	and 	%r2, 0x0678, %r23
	.word 0xa609abd8  ! 80: AND_I	and 	%r6, 0x0bd8, %r19
	.word 0xba108005  ! 80: OR_R	or 	%r2, %r5, %r29
	.word 0xa409a8f2  ! 80: AND_I	and 	%r6, 0x08f2, %r18
	.word 0xb008c005  ! 80: AND_R	and 	%r3, %r5, %r24
	.word 0xb2008005  ! 80: ADD_R	add 	%r2, %r5, %r25
	.word 0xac09c005  ! 80: AND_R	and 	%r7, %r5, %r22
	.word 0xa409e3ac  ! 80: AND_I	and 	%r7, 0x03ac, %r18
	.word 0x9e10a644  ! 80: OR_I	or 	%r2, 0x0644, %r15
	.word 0xbe098005  ! 80: AND_R	and 	%r6, %r5, %r31
	.word 0xa61128ae  ! 80: OR_I	or 	%r4, 0x08ae, %r19
	.word 0x9a108005  ! 80: OR_R	or 	%r2, %r5, %r13
	.word 0xb6088005  ! 80: AND_R	and 	%r2, %r5, %r27
	.word 0xba10a61e  ! 80: OR_I	or 	%r2, 0x061e, %r29
	.word 0xba110005  ! 80: OR_R	or 	%r4, %r5, %r29
	.word 0xac01c005  ! 80: ADD_R	add 	%r7, %r5, %r22
	.word 0x9c00c005  ! 80: ADD_R	add 	%r3, %r5, %r14
	.word 0xba110005  ! 80: OR_R	or 	%r4, %r5, %r29
	.word 0xa8088005  ! 80: AND_R	and 	%r2, %r5, %r20
	.word 0xb809aedf  ! 80: AND_I	and 	%r6, 0x0edf, %r28
	.word 0xae08aeef  ! 80: AND_I	and 	%r2, 0x0eef, %r23
	.word 0xa611e2f4  ! 80: OR_I	or 	%r7, 0x02f4, %r19
	.word 0xf421ec14  ! 80: STW_I	stw	%r26, [%r7 + 0x0c14]
	.word 0xdc70aa70  ! 80: STX_I	stx	%r14, [%r2 + 0x0a70]
	.word 0xde29e86c  ! 80: STB_I	stb	%r15, [%r7 + 0x086c]
	.word 0xf030aebe  ! 80: STH_I	sth	%r24, [%r2 + 0x0ebe]
IRF_CE_43:
!$EV error(3,expr(@VA(.MAIN.IRF_CE_43), 16, 16), 1,IRF,ce,9,x, x,x,x, x,x,x)
!$EV error(3,expr(@VA(.MAIN.IRF_CE_43), 16, 16), 3,IRF,ce,26,x, x,x,x, x,x,x)
	.word 0xea21ebf8  ! 80: STW_I	stw	%r21, [%r7 + 0x0bf8]
	.word 0xee71af68  ! 80: STX_I	stx	%r23, [%r6 + 0x0f68]
	.word 0xf270aca0  ! 80: STX_I	stx	%r25, [%r2 + 0x0ca0]
	.word 0xee788005  ! 80: SWAP_R	swap	%r23, [%r2 + %r5]
	.word 0xb600a71f  ! 80: ADD_I	add 	%r2, 0x071f, %r27
	.word 0xa2018005  ! 80: ADD_R	add 	%r6, %r5, %r17
	bne thr3_loop_10
	subcc %g1, 0x1, %g1
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr3_loop_11:
	.word 0x9e088005  ! 88: AND_R	and 	%r2, %r5, %r15
	.word 0xa200a341  ! 88: ADD_I	add 	%r2, 0x0341, %r17
	.word 0xbc098005  ! 88: AND_R	and 	%r6, %r5, %r30
	.word 0xba10e0f2  ! 88: OR_I	or 	%r3, 0x00f2, %r29
	.word 0xb809acfa  ! 88: AND_I	and 	%r6, 0x0cfa, %r28
	.word 0xa4008005  ! 88: ADD_R	add 	%r2, %r5, %r18
	.word 0x9e10e09f  ! 88: OR_I	or 	%r3, 0x009f, %r15
	.word 0xbe08c005  ! 88: AND_R	and 	%r3, %r5, %r31
	.word 0xa600e22f  ! 88: ADD_I	add 	%r3, 0x022f, %r19
	.word 0xb609a96c  ! 88: AND_I	and 	%r6, 0x096c, %r27
	.word 0xa6088005  ! 88: AND_R	and 	%r2, %r5, %r19
	.word 0xa2008005  ! 88: ADD_R	add 	%r2, %r5, %r17
	.word 0xac012afd  ! 88: ADD_I	add 	%r4, 0x0afd, %r22
	.word 0xae09c005  ! 88: AND_R	and 	%r7, %r5, %r23
	.word 0xa801c005  ! 88: ADD_R	add 	%r7, %r5, %r20
	.word 0x9e11e968  ! 88: OR_I	or 	%r7, 0x0968, %r15
	.word 0xb2090005  ! 88: AND_R	and 	%r4, %r5, %r25
	.word 0xa2092b24  ! 88: AND_I	and 	%r4, 0x0b24, %r17
	.word 0xa611adec  ! 88: OR_I	or 	%r6, 0x0dec, %r19
	.word 0x9c01c005  ! 88: ADD_R	add 	%r7, %r5, %r14
	.word 0xa801c005  ! 88: ADD_R	add 	%r7, %r5, %r20
	.word 0xae08ae28  ! 88: AND_I	and 	%r2, 0x0e28, %r23
	.word 0xa201e929  ! 88: ADD_I	add 	%r7, 0x0929, %r17
	.word 0xb001abee  ! 88: ADD_I	add 	%r6, 0x0bee, %r24
	.word 0xbe010005  ! 88: ADD_R	add 	%r4, %r5, %r31
	.word 0xbe118005  ! 88: OR_R	or 	%r6, %r5, %r31
	.word 0x9a098005  ! 88: AND_R	and 	%r6, %r5, %r13
	.word 0xb408a368  ! 88: AND_I	and 	%r2, 0x0368, %r26
	.word 0xbe10a48a  ! 88: OR_I	or 	%r2, 0x048a, %r31
	.word 0xa410ad88  ! 88: OR_I	or 	%r2, 0x0d88, %r18
	.word 0xae10a08e  ! 88: OR_I	or 	%r2, 0x008e, %r23
	.word 0xb0118005  ! 88: OR_R	or 	%r6, %r5, %r24
	.word 0xac01eb0d  ! 88: ADD_I	add 	%r7, 0x0b0d, %r22
	.word 0xb010a08b  ! 88: OR_I	or 	%r2, 0x008b, %r24
	.word 0xae00a1cf  ! 88: ADD_I	add 	%r2, 0x01cf, %r23
	.word 0xbc10abd5  ! 88: OR_I	or 	%r2, 0x0bd5, %r30
	.word 0xbc110005  ! 88: OR_R	or 	%r4, %r5, %r30
	.word 0xb8088005  ! 88: AND_R	and 	%r2, %r5, %r28
	.word 0x9a012eb5  ! 88: ADD_I	add 	%r4, 0x0eb5, %r13
	.word 0xba09ee25  ! 88: AND_I	and 	%r7, 0x0e25, %r29
	.word 0xb6008005  ! 88: ADD_R	add 	%r2, %r5, %r27
	.word 0xbe11c005  ! 88: OR_R	or 	%r7, %r5, %r31
	.word 0xb210e245  ! 88: OR_I	or 	%r3, 0x0245, %r25
	.word 0xae10a3bf  ! 88: OR_I	or 	%r2, 0x03bf, %r23
	.word 0xbc0121a3  ! 88: ADD_I	add 	%r4, 0x01a3, %r30
	.word 0x9e10e07a  ! 88: OR_I	or 	%r3, 0x007a, %r15
	.word 0xb809e786  ! 88: AND_I	and 	%r7, 0x0786, %r28
	.word 0x9e108005  ! 88: OR_R	or 	%r2, %r5, %r15
	.word 0xb4090005  ! 88: AND_R	and 	%r4, %r5, %r26
	.word 0xb200a83f  ! 88: ADD_I	add 	%r2, 0x083f, %r25
	.word 0xac01acf1  ! 88: ADD_I	add 	%r6, 0x0cf1, %r22
	.word 0xac11a014  ! 88: OR_I	or 	%r6, 0x0014, %r22
	.word 0x9c11c005  ! 88: OR_R	or 	%r7, %r5, %r14
	.word 0xb810e21a  ! 88: OR_I	or 	%r3, 0x021a, %r28
	.word 0x9a10c005  ! 88: OR_R	or 	%r3, %r5, %r13
	.word 0xac11ea7b  ! 88: OR_I	or 	%r7, 0x0a7b, %r22
	.word 0xa6108005  ! 88: OR_R	or 	%r2, %r5, %r19
	.word 0xac0929e0  ! 88: AND_I	and 	%r4, 0x09e0, %r22
	.word 0xa2098005  ! 88: AND_R	and 	%r6, %r5, %r17
	.word 0xae09e2f3  ! 88: AND_I	and 	%r7, 0x02f3, %r23
	.word 0x9e08c005  ! 88: AND_R	and 	%r3, %r5, %r15
	.word 0xb4088005  ! 88: AND_R	and 	%r2, %r5, %r26
	.word 0xba090005  ! 88: AND_R	and 	%r4, %r5, %r29
	.word 0xb0112265  ! 88: OR_I	or 	%r4, 0x0265, %r24
	.word 0xa808c005  ! 88: AND_R	and 	%r3, %r5, %r20
	.word 0xb808aff2  ! 88: AND_I	and 	%r2, 0x0ff2, %r28
	.word 0xac11290b  ! 88: OR_I	or 	%r4, 0x090b, %r22
	.word 0xa008e3ae  ! 88: AND_I	and 	%r3, 0x03ae, %r16
	.word 0x9e1125db  ! 88: OR_I	or 	%r4, 0x05db, %r15
	.word 0xaa108005  ! 88: OR_R	or 	%r2, %r5, %r21
	.word 0xb6090005  ! 88: AND_R	and 	%r4, %r5, %r27
	.word 0xb209a14e  ! 88: AND_I	and 	%r6, 0x014e, %r25
	.word 0x9e00e74a  ! 88: ADD_I	add 	%r3, 0x074a, %r15
	.word 0xbe01aa3a  ! 88: ADD_I	add 	%r6, 0x0a3a, %r31
	.word 0xb809c005  ! 88: AND_R	and 	%r7, %r5, %r28
	.word 0xb010a112  ! 88: OR_I	or 	%r2, 0x0112, %r24
	.word 0xba01ac95  ! 88: ADD_I	add 	%r6, 0x0c95, %r29
	.word 0xa000e788  ! 88: ADD_I	add 	%r3, 0x0788, %r16
	.word 0xae00adc8  ! 88: ADD_I	add 	%r2, 0x0dc8, %r23
	.word 0xa6018005  ! 88: ADD_R	add 	%r6, %r5, %r19
	.word 0xae018005  ! 88: ADD_R	add 	%r6, %r5, %r23
	.word 0xb811aebf  ! 88: OR_I	or 	%r6, 0x0ebf, %r28
	.word 0x9e11a29c  ! 88: OR_I	or 	%r6, 0x029c, %r15
	.word 0xa609c005  ! 88: AND_R	and 	%r7, %r5, %r19
	.word 0xb808c005  ! 88: AND_R	and 	%r3, %r5, %r28
	.word 0x9e10c005  ! 88: OR_R	or 	%r3, %r5, %r15
	.word 0xb410a08a  ! 88: OR_I	or 	%r2, 0x008a, %r26
	.word 0xb800a531  ! 88: ADD_I	add 	%r2, 0x0531, %r28
	.word 0xba08a131  ! 88: AND_I	and 	%r2, 0x0131, %r29
	.word 0xb4118005  ! 88: OR_R	or 	%r6, %r5, %r26
	.word 0xa009e1ed  ! 88: AND_I	and 	%r7, 0x01ed, %r16
	.word 0xbc012a5e  ! 88: ADD_I	add 	%r4, 0x0a5e, %r30
	.word 0xae088005  ! 88: AND_R	and 	%r2, %r5, %r23
	.word 0x9c08eb42  ! 88: AND_I	and 	%r3, 0x0b42, %r14
	.word 0xac08ed20  ! 88: AND_I	and 	%r3, 0x0d20, %r22
	.word 0xb601e024  ! 88: ADD_I	add 	%r7, 0x0024, %r27
	.word 0xb208e4ad  ! 88: AND_I	and 	%r3, 0x04ad, %r25
	.word 0xb009e098  ! 88: AND_I	and 	%r7, 0x0098, %r24
	.word 0xaa11c005  ! 88: OR_R	or 	%r7, %r5, %r21
	.word 0xb0110005  ! 88: OR_R	or 	%r4, %r5, %r24
	.word 0xac00eeab  ! 88: ADD_I	add 	%r3, 0x0eab, %r22
	.word 0xbe008005  ! 88: ADD_R	add 	%r2, %r5, %r31
	.word 0xac0928fa  ! 88: AND_I	and 	%r4, 0x08fa, %r22
	.word 0xa0108005  ! 88: OR_R	or 	%r2, %r5, %r16
	.word 0xa210ad44  ! 88: OR_I	or 	%r2, 0x0d44, %r17
	.word 0xba09c005  ! 88: AND_R	and 	%r7, %r5, %r29
	.word 0xae11e8cf  ! 88: OR_I	or 	%r7, 0x08cf, %r23
	.word 0xa211c005  ! 88: OR_R	or 	%r7, %r5, %r17
	.word 0xa201efb1  ! 88: ADD_I	add 	%r7, 0x0fb1, %r17
	.word 0xaa088005  ! 88: AND_R	and 	%r2, %r5, %r21
	.word 0xa4088005  ! 88: AND_R	and 	%r2, %r5, %r18
	.word 0xb210eb42  ! 88: OR_I	or 	%r3, 0x0b42, %r25
	.word 0x9a08a520  ! 88: AND_I	and 	%r2, 0x0520, %r13
	.word 0xb809e544  ! 88: AND_I	and 	%r7, 0x0544, %r28
	.word 0x9e00c005  ! 88: ADD_R	add 	%r3, %r5, %r15
	.word 0xba010005  ! 88: ADD_R	add 	%r4, %r5, %r29
	.word 0xba092283  ! 88: AND_I	and 	%r4, 0x0283, %r29
	.word 0x9a110005  ! 88: OR_R	or 	%r4, %r5, %r13
	.word 0xa608e5fa  ! 88: AND_I	and 	%r3, 0x05fa, %r19
	.word 0xb010a8ad  ! 88: OR_I	or 	%r2, 0x08ad, %r24
	.word 0xaa08a41f  ! 88: AND_I	and 	%r2, 0x041f, %r21
	.word 0xa0092705  ! 88: AND_I	and 	%r4, 0x0705, %r16
	.word 0x9c11c005  ! 88: OR_R	or 	%r7, %r5, %r14
	.word 0xa0108005  ! 88: OR_R	or 	%r2, %r5, %r16
	.word 0xae008005  ! 88: ADD_R	add 	%r2, %r5, %r23
	.word 0xbc108005  ! 88: OR_R	or 	%r2, %r5, %r30
	.word 0xb40927ed  ! 88: AND_I	and 	%r4, 0x07ed, %r26
	.word 0xb209e024  ! 88: AND_I	and 	%r7, 0x0024, %r25
	.word 0x9e10a3fb  ! 88: OR_I	or 	%r2, 0x03fb, %r15
	.word 0x9a01c005  ! 88: ADD_R	add 	%r7, %r5, %r13
	.word 0xac00add8  ! 88: ADD_I	add 	%r2, 0x0dd8, %r22
	.word 0xa410c005  ! 88: OR_R	or 	%r3, %r5, %r18
	.word 0xbe090005  ! 88: AND_R	and 	%r4, %r5, %r31
	.word 0xbc088005  ! 88: AND_R	and 	%r2, %r5, %r30
	.word 0xb610c005  ! 88: OR_R	or 	%r3, %r5, %r27
	.word 0xa600a3a6  ! 88: ADD_I	add 	%r2, 0x03a6, %r19
	.word 0xb2098005  ! 88: AND_R	and 	%r6, %r5, %r25
	.word 0xae088005  ! 88: AND_R	and 	%r2, %r5, %r23
	.word 0x9e11c005  ! 88: OR_R	or 	%r7, %r5, %r15
	.word 0xa0090005  ! 88: AND_R	and 	%r4, %r5, %r16
	.word 0xb6090005  ! 88: AND_R	and 	%r4, %r5, %r27
	.word 0xb808e646  ! 88: AND_I	and 	%r3, 0x0646, %r28
	.word 0xba00c005  ! 88: ADD_R	add 	%r3, %r5, %r29
	.word 0xae110005  ! 88: OR_R	or 	%r4, %r5, %r23
	.word 0xa4008005  ! 88: ADD_R	add 	%r2, %r5, %r18
	.word 0xa408a0d5  ! 88: AND_I	and 	%r2, 0x00d5, %r18
	.word 0xb8018005  ! 88: ADD_R	add 	%r6, %r5, %r28
	.word 0xac11c005  ! 88: OR_R	or 	%r7, %r5, %r22
	.word 0xaa08c005  ! 88: AND_R	and 	%r3, %r5, %r21
	.word 0xa0098005  ! 88: AND_R	and 	%r6, %r5, %r16
	.word 0xb6098005  ! 88: AND_R	and 	%r6, %r5, %r27
	.word 0xa8108005  ! 88: OR_R	or 	%r2, %r5, %r20
	.word 0x9c11a1b3  ! 88: OR_I	or 	%r6, 0x01b3, %r14
	.word 0xb2112a3e  ! 88: OR_I	or 	%r4, 0x0a3e, %r25
	.word 0xa2110005  ! 88: OR_R	or 	%r4, %r5, %r17
	.word 0xb800af51  ! 88: ADD_I	add 	%r2, 0x0f51, %r28
	.word 0xbc088005  ! 88: AND_R	and 	%r2, %r5, %r30
	.word 0xb408e7c8  ! 88: AND_I	and 	%r3, 0x07c8, %r26
	.word 0xb4098005  ! 88: AND_R	and 	%r6, %r5, %r26
	.word 0xb8098005  ! 88: AND_R	and 	%r6, %r5, %r28
	.word 0xb4110005  ! 88: OR_R	or 	%r4, %r5, %r26
	.word 0x9c118005  ! 88: OR_R	or 	%r6, %r5, %r14
	.word 0xb210a97a  ! 88: OR_I	or 	%r2, 0x097a, %r25
	.word 0xaa112a9c  ! 88: OR_I	or 	%r4, 0x0a9c, %r21
	.word 0xac090005  ! 88: AND_R	and 	%r4, %r5, %r22
	.word 0xb4008005  ! 88: ADD_R	add 	%r2, %r5, %r26
	.word 0xa2008005  ! 88: ADD_R	add 	%r2, %r5, %r17
	.word 0x9c09ac18  ! 88: AND_I	and 	%r6, 0x0c18, %r14
	.word 0xbc10e7ce  ! 88: OR_I	or 	%r3, 0x07ce, %r30
	.word 0xb808e216  ! 88: AND_I	and 	%r3, 0x0216, %r28
	.word 0x9c10adce  ! 88: OR_I	or 	%r2, 0x0dce, %r14
	.word 0xae09ecf4  ! 88: AND_I	and 	%r7, 0x0cf4, %r23
	.word 0xb6092a61  ! 88: AND_I	and 	%r4, 0x0a61, %r27
	.word 0xb411e501  ! 88: OR_I	or 	%r7, 0x0501, %r26
	.word 0xb808e1ef  ! 88: AND_I	and 	%r3, 0x01ef, %r28
	.word 0xa2010005  ! 88: ADD_R	add 	%r4, %r5, %r17
	.word 0x9e10c005  ! 88: OR_R	or 	%r3, %r5, %r15
	.word 0xa8008005  ! 88: ADD_R	add 	%r2, %r5, %r20
	.word 0xbc11c005  ! 88: OR_R	or 	%r7, %r5, %r30
	.word 0xb4092a65  ! 88: AND_I	and 	%r4, 0x0a65, %r26
	.word 0x9c08c005  ! 88: AND_R	and 	%r3, %r5, %r14
	.word 0xa8090005  ! 88: AND_R	and 	%r4, %r5, %r20
	.word 0xb211c005  ! 88: OR_R	or 	%r7, %r5, %r25
	.word 0xaa10aa8e  ! 88: OR_I	or 	%r2, 0x0a8e, %r21
	.word 0xe42126f4  ! 88: STW_I	stw	%r18, [%r4 + 0x06f4]
	.word 0xfa70aaa8  ! 88: STX_I	stx	%r29, [%r2 + 0x0aa8]
	.word 0xee29ac36  ! 88: STB_I	stb	%r23, [%r6 + 0x0c36]
	.word 0xe428a443  ! 88: STB_I	stb	%r18, [%r2 + 0x0443]
IRF_CE_47:
!$EV error(3,expr(@VA(.MAIN.IRF_CE_47), 16, 16), 1,IRF,ce,36,x, x,x,x, x,x,x)
!$EV error(3,expr(@VA(.MAIN.IRF_CE_47), 16, 16), 3,IRF,ce,50,x, x,x,x, x,x,x)
	.word 0xf030a71a  ! 88: STH_I	sth	%r24, [%r2 + 0x071a]
	.word 0xfa70ef98  ! 88: STX_I	stx	%r29, [%r3 + 0x0f98]
	.word 0xf070edf8  ! 88: STX_I	stx	%r24, [%r3 + 0x0df8]
	.word 0xd6f28ce8  ! 88: STXA_R	stxa	%r11, [%r10 + %r8] 0x67
	.word 0x9c112f92  ! 88: OR_I	or 	%r4, 0x0f92, %r14
	.word 0xbc018005  ! 88: ADD_R	add 	%r6, %r5, %r30
	bne thr3_loop_11
	subcc %g1, 0x1, %g1
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr3_loop_12:
	.word 0xa410ad17  ! 95: OR_I	or 	%r2, 0x0d17, %r18
	.word 0xaa118005  ! 95: OR_R	or 	%r6, %r5, %r21
	.word 0xaa088005  ! 95: AND_R	and 	%r2, %r5, %r21
	.word 0xa2018005  ! 95: ADD_R	add 	%r6, %r5, %r17
	.word 0xa011c005  ! 95: OR_R	or 	%r7, %r5, %r16
	.word 0xac108005  ! 95: OR_R	or 	%r2, %r5, %r22
	.word 0xba088005  ! 95: AND_R	and 	%r2, %r5, %r29
	.word 0xb4118005  ! 95: OR_R	or 	%r6, %r5, %r26
	.word 0xa009efc0  ! 95: AND_I	and 	%r7, 0x0fc0, %r16
	.word 0xb411ac0b  ! 95: OR_I	or 	%r6, 0x0c0b, %r26
	.word 0xa4010005  ! 95: ADD_R	add 	%r4, %r5, %r18
	.word 0xa609a6f1  ! 95: AND_I	and 	%r6, 0x06f1, %r19
	.word 0xbc008005  ! 95: ADD_R	add 	%r2, %r5, %r30
	.word 0xbe08c005  ! 95: AND_R	and 	%r3, %r5, %r31
	.word 0xae090005  ! 95: AND_R	and 	%r4, %r5, %r23
	.word 0x9a01a661  ! 95: ADD_I	add 	%r6, 0x0661, %r13
	.word 0xb6088005  ! 95: AND_R	and 	%r2, %r5, %r27
	.word 0xaa01c005  ! 95: ADD_R	add 	%r7, %r5, %r21
	.word 0x9e098005  ! 95: AND_R	and 	%r6, %r5, %r15
	.word 0xb609c005  ! 95: AND_R	and 	%r7, %r5, %r27
	.word 0xbc01206a  ! 95: ADD_I	add 	%r4, 0x006a, %r30
	.word 0xbe09af75  ! 95: AND_I	and 	%r6, 0x0f75, %r31
	.word 0x9a00c005  ! 95: ADD_R	add 	%r3, %r5, %r13
	.word 0xa6008005  ! 95: ADD_R	add 	%r2, %r5, %r19
	.word 0xb010ad64  ! 95: OR_I	or 	%r2, 0x0d64, %r24
	.word 0xa609ec1e  ! 95: AND_I	and 	%r7, 0x0c1e, %r19
	.word 0xbe092ab8  ! 95: AND_I	and 	%r4, 0x0ab8, %r31
	.word 0x9a092192  ! 95: AND_I	and 	%r4, 0x0192, %r13
	.word 0xa011c005  ! 95: OR_R	or 	%r7, %r5, %r16
	.word 0xbc10a380  ! 95: OR_I	or 	%r2, 0x0380, %r30
	.word 0x9e010005  ! 95: ADD_R	add 	%r4, %r5, %r15
	.word 0xac092d88  ! 95: AND_I	and 	%r4, 0x0d88, %r22
	.word 0x9c08e05e  ! 95: AND_I	and 	%r3, 0x005e, %r14
	.word 0xa408af37  ! 95: AND_I	and 	%r2, 0x0f37, %r18
	.word 0x9c112be3  ! 95: OR_I	or 	%r4, 0x0be3, %r14
	.word 0x9a008005  ! 95: ADD_R	add 	%r2, %r5, %r13
	.word 0xba00c005  ! 95: ADD_R	add 	%r3, %r5, %r29
	.word 0xbc012dc6  ! 95: ADD_I	add 	%r4, 0x0dc6, %r30
	.word 0xae098005  ! 95: AND_R	and 	%r6, %r5, %r23
	.word 0x9a01ebc4  ! 95: ADD_I	add 	%r7, 0x0bc4, %r13
	.word 0xb408a437  ! 95: AND_I	and 	%r2, 0x0437, %r26
	.word 0xb4010005  ! 95: ADD_R	add 	%r4, %r5, %r26
	.word 0xb2110005  ! 95: OR_R	or 	%r4, %r5, %r25
	.word 0xa8018005  ! 95: ADD_R	add 	%r6, %r5, %r20
	.word 0xba10af02  ! 95: OR_I	or 	%r2, 0x0f02, %r29
	.word 0xb8018005  ! 95: ADD_R	add 	%r6, %r5, %r28
	.word 0x9e00c005  ! 95: ADD_R	add 	%r3, %r5, %r15
	.word 0xb208a2fb  ! 95: AND_I	and 	%r2, 0x02fb, %r25
	.word 0xa6090005  ! 95: AND_R	and 	%r4, %r5, %r19
	.word 0xb6088005  ! 95: AND_R	and 	%r2, %r5, %r27
	.word 0xb409a5af  ! 95: AND_I	and 	%r6, 0x05af, %r26
	.word 0xaa01c005  ! 95: ADD_R	add 	%r7, %r5, %r21
	.word 0xbc00a58a  ! 95: ADD_I	add 	%r2, 0x058a, %r30
	.word 0xb001a40f  ! 95: ADD_I	add 	%r6, 0x040f, %r24
	.word 0xa411c005  ! 95: OR_R	or 	%r7, %r5, %r18
	.word 0xb6010005  ! 95: ADD_R	add 	%r4, %r5, %r27
	.word 0xb810c005  ! 95: OR_R	or 	%r3, %r5, %r28
	.word 0xa811c005  ! 95: OR_R	or 	%r7, %r5, %r20
	.word 0xa2110005  ! 95: OR_R	or 	%r4, %r5, %r17
	.word 0xae090005  ! 95: AND_R	and 	%r4, %r5, %r23
	.word 0xa2008005  ! 95: ADD_R	add 	%r2, %r5, %r17
	.word 0x9e11c005  ! 95: OR_R	or 	%r7, %r5, %r15
	.word 0xba00a4b6  ! 95: ADD_I	add 	%r2, 0x04b6, %r29
	.word 0xb001c005  ! 95: ADD_R	add 	%r7, %r5, %r24
	.word 0xba088005  ! 95: AND_R	and 	%r2, %r5, %r29
	.word 0xbe08c005  ! 95: AND_R	and 	%r3, %r5, %r31
	.word 0xb009a16f  ! 95: AND_I	and 	%r6, 0x016f, %r24
	.word 0x9a088005  ! 95: AND_R	and 	%r2, %r5, %r13
	.word 0xba00e2e3  ! 95: ADD_I	add 	%r3, 0x02e3, %r29
	.word 0xa0108005  ! 95: OR_R	or 	%r2, %r5, %r16
	.word 0xba008005  ! 95: ADD_R	add 	%r2, %r5, %r29
	.word 0xaa108005  ! 95: OR_R	or 	%r2, %r5, %r21
	.word 0xbe108005  ! 95: OR_R	or 	%r2, %r5, %r31
	.word 0xb810ea9b  ! 95: OR_I	or 	%r3, 0x0a9b, %r28
	.word 0xba08c005  ! 95: AND_R	and 	%r3, %r5, %r29
	.word 0xa6008005  ! 95: ADD_R	add 	%r2, %r5, %r19
	.word 0xa609c005  ! 95: AND_R	and 	%r7, %r5, %r19
	.word 0x9a10c005  ! 95: OR_R	or 	%r3, %r5, %r13
	.word 0xa001abd2  ! 95: ADD_I	add 	%r6, 0x0bd2, %r16
	.word 0xa208c005  ! 95: AND_R	and 	%r3, %r5, %r17
	.word 0xa6108005  ! 95: OR_R	or 	%r2, %r5, %r19
	.word 0xaa01a25b  ! 95: ADD_I	add 	%r6, 0x025b, %r21
	.word 0xb2018005  ! 95: ADD_R	add 	%r6, %r5, %r25
	.word 0xbe08ac6d  ! 95: AND_I	and 	%r2, 0x0c6d, %r31
	.word 0xae08ac9e  ! 95: AND_I	and 	%r2, 0x0c9e, %r23
	.word 0xb400afca  ! 95: ADD_I	add 	%r2, 0x0fca, %r26
	.word 0xa0088005  ! 95: AND_R	and 	%r2, %r5, %r16
	.word 0xa400a275  ! 95: ADD_I	add 	%r2, 0x0275, %r18
	.word 0xbc098005  ! 95: AND_R	and 	%r6, %r5, %r30
	.word 0xba00e66b  ! 95: ADD_I	add 	%r3, 0x066b, %r29
	.word 0x9c01e931  ! 95: ADD_I	add 	%r7, 0x0931, %r14
	.word 0xb000e0b9  ! 95: ADD_I	add 	%r3, 0x00b9, %r24
	.word 0xa2090005  ! 95: AND_R	and 	%r4, %r5, %r17
	.word 0x9c08eb4a  ! 95: AND_I	and 	%r3, 0x0b4a, %r14
	.word 0xb611c005  ! 95: OR_R	or 	%r7, %r5, %r27
	.word 0xbe08af5e  ! 95: AND_I	and 	%r2, 0x0f5e, %r31
	.word 0xba10a3c1  ! 95: OR_I	or 	%r2, 0x03c1, %r29
	.word 0xa410adc3  ! 95: OR_I	or 	%r2, 0x0dc3, %r18
	.word 0xae01a064  ! 95: ADD_I	add 	%r6, 0x0064, %r23
	.word 0xbe08c005  ! 95: AND_R	and 	%r3, %r5, %r31
	.word 0xb4112ceb  ! 95: OR_I	or 	%r4, 0x0ceb, %r26
	.word 0xae10ebef  ! 95: OR_I	or 	%r3, 0x0bef, %r23
	.word 0xba092219  ! 95: AND_I	and 	%r4, 0x0219, %r29
	.word 0xa611c005  ! 95: OR_R	or 	%r7, %r5, %r19
	.word 0xa6010005  ! 95: ADD_R	add 	%r4, %r5, %r19
	.word 0xaa08c005  ! 95: AND_R	and 	%r3, %r5, %r21
	.word 0xb408e71f  ! 95: AND_I	and 	%r3, 0x071f, %r26
	.word 0xae108005  ! 95: OR_R	or 	%r2, %r5, %r23
	.word 0xb609aaa0  ! 95: AND_I	and 	%r6, 0x0aa0, %r27
	.word 0xa001aa04  ! 95: ADD_I	add 	%r6, 0x0a04, %r16
	.word 0xa2108005  ! 95: OR_R	or 	%r2, %r5, %r17
	.word 0xb411e229  ! 95: OR_I	or 	%r7, 0x0229, %r26
	.word 0xac012868  ! 95: ADD_I	add 	%r4, 0x0868, %r22
	.word 0xb801c005  ! 95: ADD_R	add 	%r7, %r5, %r28
	.word 0xbc1125eb  ! 95: OR_I	or 	%r4, 0x05eb, %r30
	.word 0xa408e785  ! 95: AND_I	and 	%r3, 0x0785, %r18
	.word 0xba090005  ! 95: AND_R	and 	%r4, %r5, %r29
	.word 0xae01a5bb  ! 95: ADD_I	add 	%r6, 0x05bb, %r23
	.word 0xb8018005  ! 95: ADD_R	add 	%r6, %r5, %r28
	.word 0xb610e71a  ! 95: OR_I	or 	%r3, 0x071a, %r27
	.word 0xb809242b  ! 95: AND_I	and 	%r4, 0x042b, %r28
	.word 0x9a11a701  ! 95: OR_I	or 	%r6, 0x0701, %r13
	.word 0xb210aa5c  ! 95: OR_I	or 	%r2, 0x0a5c, %r25
	.word 0xb8098005  ! 95: AND_R	and 	%r6, %r5, %r28
	.word 0xac11ab8a  ! 95: OR_I	or 	%r6, 0x0b8a, %r22
	.word 0xbc01c005  ! 95: ADD_R	add 	%r7, %r5, %r30
	.word 0xac11209e  ! 95: OR_I	or 	%r4, 0x009e, %r22
	.word 0xb200ae30  ! 95: ADD_I	add 	%r2, 0x0e30, %r25
	.word 0xb808e856  ! 95: AND_I	and 	%r3, 0x0856, %r28
	.word 0xb4018005  ! 95: ADD_R	add 	%r6, %r5, %r26
	.word 0xb2018005  ! 95: ADD_R	add 	%r6, %r5, %r25
	.word 0xb8088005  ! 95: AND_R	and 	%r2, %r5, %r28
	.word 0xba08a9ca  ! 95: AND_I	and 	%r2, 0x09ca, %r29
	.word 0xb600a9d4  ! 95: ADD_I	add 	%r2, 0x09d4, %r27
	.word 0xa2108005  ! 95: OR_R	or 	%r2, %r5, %r17
	.word 0xae09c005  ! 95: AND_R	and 	%r7, %r5, %r23
	.word 0xb8018005  ! 95: ADD_R	add 	%r6, %r5, %r28
	.word 0x9a008005  ! 95: ADD_R	add 	%r2, %r5, %r13
	.word 0xbc09e5b1  ! 95: AND_I	and 	%r7, 0x05b1, %r30
	.word 0xa4088005  ! 95: AND_R	and 	%r2, %r5, %r18
	.word 0xba11c005  ! 95: OR_R	or 	%r7, %r5, %r29
	.word 0xbc09c005  ! 95: AND_R	and 	%r7, %r5, %r30
	.word 0xa0092c27  ! 95: AND_I	and 	%r4, 0x0c27, %r16
	.word 0xae008005  ! 95: ADD_R	add 	%r2, %r5, %r23
	.word 0xb000e118  ! 95: ADD_I	add 	%r3, 0x0118, %r24
	.word 0xa200a057  ! 95: ADD_I	add 	%r2, 0x0057, %r17
	.word 0x9a01c005  ! 95: ADD_R	add 	%r7, %r5, %r13
	.word 0xb408c005  ! 95: AND_R	and 	%r3, %r5, %r26
	.word 0xae088005  ! 95: AND_R	and 	%r2, %r5, %r23
	.word 0xa2108005  ! 95: OR_R	or 	%r2, %r5, %r17
	.word 0xa0098005  ! 95: AND_R	and 	%r6, %r5, %r16
	.word 0xb8118005  ! 95: OR_R	or 	%r6, %r5, %r28
	.word 0x9c09c005  ! 95: AND_R	and 	%r7, %r5, %r14
	.word 0x9c11e7cd  ! 95: OR_I	or 	%r7, 0x07cd, %r14
	.word 0xba09a4d1  ! 95: AND_I	and 	%r6, 0x04d1, %r29
	.word 0xa201e090  ! 95: ADD_I	add 	%r7, 0x0090, %r17
	.word 0xb801a3a7  ! 95: ADD_I	add 	%r6, 0x03a7, %r28
	.word 0xa810a21f  ! 95: OR_I	or 	%r2, 0x021f, %r20
	.word 0xb810c005  ! 95: OR_R	or 	%r3, %r5, %r28
	.word 0xac012cd2  ! 95: ADD_I	add 	%r4, 0x0cd2, %r22
	.word 0xbc00a4cb  ! 95: ADD_I	add 	%r2, 0x04cb, %r30
	.word 0xb410a42d  ! 95: OR_I	or 	%r2, 0x042d, %r26
	.word 0xaa10e566  ! 95: OR_I	or 	%r3, 0x0566, %r21
	.word 0xa011e135  ! 95: OR_I	or 	%r7, 0x0135, %r16
	.word 0xbc09c005  ! 95: AND_R	and 	%r7, %r5, %r30
	.word 0x9a018005  ! 95: ADD_R	add 	%r6, %r5, %r13
	.word 0xbc092ad0  ! 95: AND_I	and 	%r4, 0x0ad0, %r30
	.word 0xaa1124f9  ! 95: OR_I	or 	%r4, 0x04f9, %r21
	.word 0x9c088005  ! 95: AND_R	and 	%r2, %r5, %r14
	.word 0xb811c005  ! 95: OR_R	or 	%r7, %r5, %r28
	.word 0xaa088005  ! 95: AND_R	and 	%r2, %r5, %r21
	.word 0xae112588  ! 95: OR_I	or 	%r4, 0x0588, %r23
	.word 0xa410c005  ! 95: OR_R	or 	%r3, %r5, %r18
	.word 0xb808e0ac  ! 95: AND_I	and 	%r3, 0x00ac, %r28
	.word 0x9c10a527  ! 95: OR_I	or 	%r2, 0x0527, %r14
	.word 0x9c00a5f8  ! 95: ADD_I	add 	%r2, 0x05f8, %r14
	.word 0xb200ae47  ! 95: ADD_I	add 	%r2, 0x0e47, %r25
	.word 0xae0124e0  ! 95: ADD_I	add 	%r4, 0x04e0, %r23
	.word 0xa809a18a  ! 95: AND_I	and 	%r6, 0x018a, %r20
	.word 0xa6008005  ! 95: ADD_R	add 	%r2, %r5, %r19
	.word 0xa210abbd  ! 95: OR_I	or 	%r2, 0x0bbd, %r17
	.word 0xb4098005  ! 95: AND_R	and 	%r6, %r5, %r26
	.word 0xbc09a0cc  ! 95: AND_I	and 	%r6, 0x00cc, %r30
	.word 0xa010a79e  ! 95: OR_I	or 	%r2, 0x079e, %r16
	.word 0xe220ece8  ! 95: STW_I	stw	%r17, [%r3 + 0x0ce8]
	.word 0xe23128c8  ! 95: STH_I	sth	%r17, [%r4 + 0x08c8]
	.word 0xda28e1ec  ! 95: STB_I	stb	%r13, [%r3 + 0x01ec]
	.word 0xee29e982  ! 95: STB_I	stb	%r23, [%r7 + 0x0982]
IRF_CE_51:
!$EV error(3,expr(@VA(.MAIN.IRF_CE_51), 16, 16), 1,IRF,ce,31,x, x,x,x, x,x,x)
!$EV error(3,expr(@VA(.MAIN.IRF_CE_51), 16, 16), 3,IRF,ce,30,x, x,x,x, x,x,x)
	.word 0xea20af3c  ! 95: STW_I	stw	%r21, [%r2 + 0x0f3c]
	.word 0xe431e754  ! 95: STH_I	sth	%r18, [%r7 + 0x0754]
	.word 0xe8312fcc  ! 95: STH_I	sth	%r20, [%r4 + 0x0fcc]
	.word 0xee28ae58  ! 95: STB_I	stb	%r23, [%r2 + 0x0e58]
	.word 0x9a018005  ! 95: ADD_R	add 	%r6, %r5, %r13
	.word 0xb808c005  ! 95: AND_R	and 	%r3, %r5, %r28
	bne thr3_loop_12
	subcc %g1, 0x1, %g1
	ba	join_lbl_0_0
	nop
fork_lbl_0_2:
	setx  0x3bdb535019e719cc, %r1, %r11
	setx  0xf5b7abd06260fb24, %r1, %r12
	setx  0xd383f0d2a6e9dacc, %r1, %r13
	setx  0xe0879b87b824bc7e, %r1, %r14
	setx  0xa425b140867ee6ee, %r1, %r15
	setx  0xbc26eb9c51c7c5bd, %r1, %r16
	setx  0xe4e60eec2586e521, %r1, %r17
	setx  0xcd86fcb2d7ceb5f9, %r1, %r18
	setx  0x423f62f52490c05e, %r1, %r19
	setx  0xb578f40b768dc57f, %r1, %r20
	setx  0xc48e443ded6de540, %r1, %r21
	setx  0x9cbf2385584699e4, %r1, %r22
	setx  0x008c94882be623db, %r1, %r23
	setx  0xdc7185004b5564bb, %r1, %r24
	setx  0xee8cc168f458e0da, %r1, %r25
	setx  0xb50c5eedce3c6a35, %r1, %r26
	setx  0xb6faae8ccdfa5a35, %r1, %r27
	setx  0xf541ec7425c4a4c8, %r1, %r28
	setx  0x5f40832a1c831cb4, %r1, %r29
	setx  0x21e22ae5eb49c7c9, %r1, %r30
	setx  0x1c5b1670fe7248af, %r1, %r31
	setx  0x0000000000000b60, %r1, %r5
	setx  0x80, %r2, %r1
	wr  %r1, %r0, %asi
	ta T_CHANGE_HPRIV !To allow ASI writes to D-I caches
	setx MAIN_BASE_DATA_VA, %r1, %r2
	setx MAIN_BASE_DATA_VA, %r1, %r3
	setx MAIN_BASE_DATA_VA, %r1, %r4
	setx MAIN_BASE_DATA_VA, %r1, %r6
	setx MAIN_BASE_DATA_VA, %r1, %r7
	setx MAIN_BASE_DATA_VA, %r1, %r8
	setx MAIN_BASE_DATA_VA, %r1, %r9
	setx MAIN_BASE_DATA_VA, %r1, %r10
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
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr2_loop_0:
	.word 0x9c118005  ! 9: OR_R	or 	%r6, %r5, %r14
	.word 0x9e01c005  ! 9: ADD_R	add 	%r7, %r5, %r15
	.word 0x9c110005  ! 9: OR_R	or 	%r4, %r5, %r14
	.word 0xb8108005  ! 9: OR_R	or 	%r2, %r5, %r28
	.word 0xb209a301  ! 9: AND_I	and 	%r6, 0x0301, %r25
	.word 0x9e11c005  ! 9: OR_R	or 	%r7, %r5, %r15
	.word 0xb4088005  ! 9: AND_R	and 	%r2, %r5, %r26
	.word 0xb811e9e3  ! 9: OR_I	or 	%r7, 0x09e3, %r28
	.word 0xa80928df  ! 9: AND_I	and 	%r4, 0x08df, %r20
	.word 0xa410ac9a  ! 9: OR_I	or 	%r2, 0x0c9a, %r18
	.word 0xae10ee96  ! 9: OR_I	or 	%r3, 0x0e96, %r23
	.word 0xbc088005  ! 9: AND_R	and 	%r2, %r5, %r30
	.word 0xb008c005  ! 9: AND_R	and 	%r3, %r5, %r24
	.word 0xa2008005  ! 9: ADD_R	add 	%r2, %r5, %r17
	.word 0xae010005  ! 9: ADD_R	add 	%r4, %r5, %r23
	.word 0x9e108005  ! 9: OR_R	or 	%r2, %r5, %r15
	.word 0xb401e8a6  ! 9: ADD_I	add 	%r7, 0x08a6, %r26
	.word 0xae10a3e5  ! 9: OR_I	or 	%r2, 0x03e5, %r23
	.word 0xb8090005  ! 9: AND_R	and 	%r4, %r5, %r28
	.word 0xb0098005  ! 9: AND_R	and 	%r6, %r5, %r24
	.word 0xa008a377  ! 9: AND_I	and 	%r2, 0x0377, %r16
	.word 0xbe09ed4f  ! 9: AND_I	and 	%r7, 0x0d4f, %r31
	.word 0xae110005  ! 9: OR_R	or 	%r4, %r5, %r23
	.word 0xa8088005  ! 9: AND_R	and 	%r2, %r5, %r20
	.word 0xba008005  ! 9: ADD_R	add 	%r2, %r5, %r29
	.word 0xa400a4a8  ! 9: ADD_I	add 	%r2, 0x04a8, %r18
	.word 0x9e010005  ! 9: ADD_R	add 	%r4, %r5, %r15
	.word 0xbe10a502  ! 9: OR_I	or 	%r2, 0x0502, %r31
	.word 0xa8108005  ! 9: OR_R	or 	%r2, %r5, %r20
	.word 0xbe08e705  ! 9: AND_I	and 	%r3, 0x0705, %r31
	.word 0xaa108005  ! 9: OR_R	or 	%r2, %r5, %r21
	.word 0xb000c005  ! 9: ADD_R	add 	%r3, %r5, %r24
	.word 0xa610eb8a  ! 9: OR_I	or 	%r3, 0x0b8a, %r19
	.word 0xb6098005  ! 9: AND_R	and 	%r6, %r5, %r27
	.word 0xaa010005  ! 9: ADD_R	add 	%r4, %r5, %r21
	.word 0x9e10c005  ! 9: OR_R	or 	%r3, %r5, %r15
	.word 0x9c00e768  ! 9: ADD_I	add 	%r3, 0x0768, %r14
	.word 0xa0018005  ! 9: ADD_R	add 	%r6, %r5, %r16
	.word 0xb8010005  ! 9: ADD_R	add 	%r4, %r5, %r28
	.word 0xa809a3ad  ! 9: AND_I	and 	%r6, 0x03ad, %r20
	.word 0xb808ac6f  ! 9: AND_I	and 	%r2, 0x0c6f, %r28
	.word 0xa000ad3e  ! 9: ADD_I	add 	%r2, 0x0d3e, %r16
	.word 0xac11c005  ! 9: OR_R	or 	%r7, %r5, %r22
	.word 0xae088005  ! 9: AND_R	and 	%r2, %r5, %r23
	.word 0xb211c005  ! 9: OR_R	or 	%r7, %r5, %r25
	.word 0xb611a5f8  ! 9: OR_I	or 	%r6, 0x05f8, %r27
	.word 0xac08c005  ! 9: AND_R	and 	%r3, %r5, %r22
	.word 0xb2098005  ! 9: AND_R	and 	%r6, %r5, %r25
	.word 0xba09c005  ! 9: AND_R	and 	%r7, %r5, %r29
	.word 0x9e118005  ! 9: OR_R	or 	%r6, %r5, %r15
	.word 0x9e09c005  ! 9: AND_R	and 	%r7, %r5, %r15
	.word 0xb2118005  ! 9: OR_R	or 	%r6, %r5, %r25
	.word 0xb408eb36  ! 9: AND_I	and 	%r3, 0x0b36, %r26
	.word 0xba110005  ! 9: OR_R	or 	%r4, %r5, %r29
	.word 0xb0012ff6  ! 9: ADD_I	add 	%r4, 0x0ff6, %r24
	.word 0xbc108005  ! 9: OR_R	or 	%r2, %r5, %r30
	.word 0xbc01a78a  ! 9: ADD_I	add 	%r6, 0x078a, %r30
	.word 0xb408ec99  ! 9: AND_I	and 	%r3, 0x0c99, %r26
	.word 0xae09a8d9  ! 9: AND_I	and 	%r6, 0x08d9, %r23
	.word 0xb61128f8  ! 9: OR_I	or 	%r4, 0x08f8, %r27
	.word 0xa600ad2a  ! 9: ADD_I	add 	%r2, 0x0d2a, %r19
	.word 0xb000ab91  ! 9: ADD_I	add 	%r2, 0x0b91, %r24
	.word 0xba09a63d  ! 9: AND_I	and 	%r6, 0x063d, %r29
	.word 0xb200c005  ! 9: ADD_R	add 	%r3, %r5, %r25
	.word 0xb001a190  ! 9: ADD_I	add 	%r6, 0x0190, %r24
	.word 0xa201c005  ! 9: ADD_R	add 	%r7, %r5, %r17
	.word 0xa208c005  ! 9: AND_R	and 	%r3, %r5, %r17
	.word 0xba092896  ! 9: AND_I	and 	%r4, 0x0896, %r29
	.word 0xa808a054  ! 9: AND_I	and 	%r2, 0x0054, %r20
	.word 0xa8088005  ! 9: AND_R	and 	%r2, %r5, %r20
	.word 0xa2088005  ! 9: AND_R	and 	%r2, %r5, %r17
	.word 0xa011e928  ! 9: OR_I	or 	%r7, 0x0928, %r16
	.word 0xa6010005  ! 9: ADD_R	add 	%r4, %r5, %r19
	.word 0xaa00c005  ! 9: ADD_R	add 	%r3, %r5, %r21
	.word 0x9a090005  ! 9: AND_R	and 	%r4, %r5, %r13
	.word 0xb211ab2c  ! 9: OR_I	or 	%r6, 0x0b2c, %r25
	.word 0xa8110005  ! 9: OR_R	or 	%r4, %r5, %r20
	.word 0xbc09e0ca  ! 9: AND_I	and 	%r7, 0x00ca, %r30
	.word 0xba088005  ! 9: AND_R	and 	%r2, %r5, %r29
	.word 0xae00a055  ! 9: ADD_I	add 	%r2, 0x0055, %r23
	.word 0xbc00a4e0  ! 9: ADD_I	add 	%r2, 0x04e0, %r30
	.word 0xb201e48a  ! 9: ADD_I	add 	%r7, 0x048a, %r25
	.word 0xb2098005  ! 9: AND_R	and 	%r6, %r5, %r25
	.word 0x9e01abf3  ! 9: ADD_I	add 	%r6, 0x0bf3, %r15
	.word 0xb609ef58  ! 9: AND_I	and 	%r7, 0x0f58, %r27
	.word 0xba00c005  ! 9: ADD_R	add 	%r3, %r5, %r29
	.word 0xac08abc1  ! 9: AND_I	and 	%r2, 0x0bc1, %r22
	.word 0xb0088005  ! 9: AND_R	and 	%r2, %r5, %r24
	.word 0xba11c005  ! 9: OR_R	or 	%r7, %r5, %r29
	.word 0xa6088005  ! 9: AND_R	and 	%r2, %r5, %r19
	.word 0xbc08a653  ! 9: AND_I	and 	%r2, 0x0653, %r30
	.word 0xb0090005  ! 9: AND_R	and 	%r4, %r5, %r24
	.word 0xb808c005  ! 9: AND_R	and 	%r3, %r5, %r28
	.word 0xbc090005  ! 9: AND_R	and 	%r4, %r5, %r30
	.word 0xa411243b  ! 9: OR_I	or 	%r4, 0x043b, %r18
	.word 0xae11ab1f  ! 9: OR_I	or 	%r6, 0x0b1f, %r23
	.word 0xba1123eb  ! 9: OR_I	or 	%r4, 0x03eb, %r29
	.word 0xbc010005  ! 9: ADD_R	add 	%r4, %r5, %r30
	.word 0xa0090005  ! 9: AND_R	and 	%r4, %r5, %r16
	.word 0xb410ea1a  ! 9: OR_I	or 	%r3, 0x0a1a, %r26
	.word 0xb808e5c0  ! 9: AND_I	and 	%r3, 0x05c0, %r28
	.word 0xa8010005  ! 9: ADD_R	add 	%r4, %r5, %r20
	.word 0xa409a1ff  ! 9: AND_I	and 	%r6, 0x01ff, %r18
	.word 0x9a01c005  ! 9: ADD_R	add 	%r7, %r5, %r13
	.word 0xbc088005  ! 9: AND_R	and 	%r2, %r5, %r30
	.word 0xb6008005  ! 9: ADD_R	add 	%r2, %r5, %r27
	.word 0xb4118005  ! 9: OR_R	or 	%r6, %r5, %r26
	.word 0xac098005  ! 9: AND_R	and 	%r6, %r5, %r22
	.word 0x9a00e644  ! 9: ADD_I	add 	%r3, 0x0644, %r13
	.word 0xbe08a4f3  ! 9: AND_I	and 	%r2, 0x04f3, %r31
	.word 0xb2110005  ! 9: OR_R	or 	%r4, %r5, %r25
	.word 0x9a00a037  ! 9: ADD_I	add 	%r2, 0x0037, %r13
	.word 0x9e01ebcf  ! 9: ADD_I	add 	%r7, 0x0bcf, %r15
	.word 0xa6118005  ! 9: OR_R	or 	%r6, %r5, %r19
	.word 0xbc10a8c9  ! 9: OR_I	or 	%r2, 0x08c9, %r30
	.word 0xb208ae86  ! 9: AND_I	and 	%r2, 0x0e86, %r25
	.word 0xa4118005  ! 9: OR_R	or 	%r6, %r5, %r18
	.word 0xbe11c005  ! 9: OR_R	or 	%r7, %r5, %r31
	.word 0xb411ec02  ! 9: OR_I	or 	%r7, 0x0c02, %r26
	.word 0xba088005  ! 9: AND_R	and 	%r2, %r5, %r29
	.word 0xb610ef20  ! 9: OR_I	or 	%r3, 0x0f20, %r27
	.word 0x9a00ed98  ! 9: ADD_I	add 	%r3, 0x0d98, %r13
	.word 0xa000a7e9  ! 9: ADD_I	add 	%r2, 0x07e9, %r16
	.word 0xbe01a819  ! 9: ADD_I	add 	%r6, 0x0819, %r31
	.word 0x9e088005  ! 9: AND_R	and 	%r2, %r5, %r15
	.word 0xb600a81c  ! 9: ADD_I	add 	%r2, 0x081c, %r27
	.word 0xa4112bb5  ! 9: OR_I	or 	%r4, 0x0bb5, %r18
	.word 0xa601c005  ! 9: ADD_R	add 	%r7, %r5, %r19
	.word 0xa800ac8b  ! 9: ADD_I	add 	%r2, 0x0c8b, %r20
	.word 0xa6088005  ! 9: AND_R	and 	%r2, %r5, %r19
	.word 0xa2008005  ! 9: ADD_R	add 	%r2, %r5, %r17
	.word 0xb201eafe  ! 9: ADD_I	add 	%r7, 0x0afe, %r25
	.word 0x9c008005  ! 9: ADD_R	add 	%r2, %r5, %r14
	.word 0x9e08eabb  ! 9: AND_I	and 	%r3, 0x0abb, %r15
	.word 0xb4010005  ! 9: ADD_R	add 	%r4, %r5, %r26
	.word 0xa408a3df  ! 9: AND_I	and 	%r2, 0x03df, %r18
	.word 0xb2110005  ! 9: OR_R	or 	%r4, %r5, %r25
	.word 0xb8092553  ! 9: AND_I	and 	%r4, 0x0553, %r28
	.word 0xbc01adb3  ! 9: ADD_I	add 	%r6, 0x0db3, %r30
	.word 0xaa018005  ! 9: ADD_R	add 	%r6, %r5, %r21
	.word 0xb608a6f3  ! 9: AND_I	and 	%r2, 0x06f3, %r27
	.word 0xb6018005  ! 9: ADD_R	add 	%r6, %r5, %r27
	.word 0x9e11edd1  ! 9: OR_I	or 	%r7, 0x0dd1, %r15
	.word 0xbe090005  ! 9: AND_R	and 	%r4, %r5, %r31
	.word 0xb401210e  ! 9: ADD_I	add 	%r4, 0x010e, %r26
	.word 0x9c00a834  ! 9: ADD_I	add 	%r2, 0x0834, %r14
	.word 0xbe01adaa  ! 9: ADD_I	add 	%r6, 0x0daa, %r31
	.word 0xa409a95d  ! 9: AND_I	and 	%r6, 0x095d, %r18
	.word 0x9a01c005  ! 9: ADD_R	add 	%r7, %r5, %r13
	.word 0x9e10ac95  ! 9: OR_I	or 	%r2, 0x0c95, %r15
	.word 0xaa10c005  ! 9: OR_R	or 	%r3, %r5, %r21
	.word 0xa6088005  ! 9: AND_R	and 	%r2, %r5, %r19
	.word 0xac088005  ! 9: AND_R	and 	%r2, %r5, %r22
	.word 0xb600e2c9  ! 9: ADD_I	add 	%r3, 0x02c9, %r27
	.word 0xbe108005  ! 9: OR_R	or 	%r2, %r5, %r31
	.word 0xb8092e7b  ! 9: AND_I	and 	%r4, 0x0e7b, %r28
	.word 0x9c10a1cb  ! 9: OR_I	or 	%r2, 0x01cb, %r14
	.word 0xb8012a23  ! 9: ADD_I	add 	%r4, 0x0a23, %r28
	.word 0xb2098005  ! 9: AND_R	and 	%r6, %r5, %r25
	.word 0xac108005  ! 9: OR_R	or 	%r2, %r5, %r22
	.word 0xba10adf0  ! 9: OR_I	or 	%r2, 0x0df0, %r29
	.word 0xbe088005  ! 9: AND_R	and 	%r2, %r5, %r31
	.word 0xb011e02a  ! 9: OR_I	or 	%r7, 0x002a, %r24
	.word 0xac088005  ! 9: AND_R	and 	%r2, %r5, %r22
	.word 0x9c090005  ! 9: AND_R	and 	%r4, %r5, %r14
	.word 0xa610c005  ! 9: OR_R	or 	%r3, %r5, %r19
	.word 0xb609c005  ! 9: AND_R	and 	%r7, %r5, %r27
	.word 0xb610ab47  ! 9: OR_I	or 	%r2, 0x0b47, %r27
	.word 0xa400c005  ! 9: ADD_R	add 	%r3, %r5, %r18
	.word 0xb4012d1b  ! 9: ADD_I	add 	%r4, 0x0d1b, %r26
	.word 0xae09c005  ! 9: AND_R	and 	%r7, %r5, %r23
	.word 0xa8110005  ! 9: OR_R	or 	%r4, %r5, %r20
	.word 0x9a098005  ! 9: AND_R	and 	%r6, %r5, %r13
	.word 0xb2018005  ! 9: ADD_R	add 	%r6, %r5, %r25
	.word 0xb4018005  ! 9: ADD_R	add 	%r6, %r5, %r26
	.word 0x9a01c005  ! 9: ADD_R	add 	%r7, %r5, %r13
	.word 0xa800ef83  ! 9: ADD_I	add 	%r3, 0x0f83, %r20
	.word 0xaa00abff  ! 9: ADD_I	add 	%r2, 0x0bff, %r21
	.word 0x9e09a93a  ! 9: AND_I	and 	%r6, 0x093a, %r15
	.word 0xa6108005  ! 9: OR_R	or 	%r2, %r5, %r19
	.word 0xa000af01  ! 9: ADD_I	add 	%r2, 0x0f01, %r16
	.word 0xae09aa9a  ! 9: AND_I	and 	%r6, 0x0a9a, %r23
	.word 0xae108005  ! 9: OR_R	or 	%r2, %r5, %r23
	.word 0xa600ec4b  ! 9: ADD_I	add 	%r3, 0x0c4b, %r19
	.word 0xba10af62  ! 9: OR_I	or 	%r2, 0x0f62, %r29
	.word 0xb0108005  ! 9: OR_R	or 	%r2, %r5, %r24
	.word 0xac10eedb  ! 9: OR_I	or 	%r3, 0x0edb, %r22
	.word 0x9e09c005  ! 9: AND_R	and 	%r7, %r5, %r15
	.word 0xa4012040  ! 9: ADD_I	add 	%r4, 0x0040, %r18
	.word 0xbe10afc2  ! 9: OR_I	or 	%r2, 0x0fc2, %r31
	.word 0xac11a133  ! 9: OR_I	or 	%r6, 0x0133, %r22
	.word 0xbc00a921  ! 9: ADD_I	add 	%r2, 0x0921, %r30
	.word 0xb8010005  ! 9: ADD_R	add 	%r4, %r5, %r28
	.word 0xac10a4a2  ! 9: OR_I	or 	%r2, 0x04a2, %r22
	.word 0x9e08a854  ! 9: AND_I	and 	%r2, 0x0854, %r15
	.word 0x9a088005  ! 9: AND_R	and 	%r2, %r5, %r13
	.word 0xba09231d  ! 9: AND_I	and 	%r4, 0x031d, %r29
	.word 0xa6118005  ! 9: OR_R	or 	%r6, %r5, %r19
	.word 0xba108005  ! 9: OR_R	or 	%r2, %r5, %r29
	.word 0x9c00c005  ! 9: ADD_R	add 	%r3, %r5, %r14
	.word 0xea2121bc  ! 9: STW_I	stw	%r21, [%r4 + 0x01bc]
	.word 0xf031ec66  ! 9: STH_I	sth	%r24, [%r7 + 0x0c66]
	.word 0xec70a6f8  ! 9: STX_I	stx	%r22, [%r2 + 0x06f8]
	.word 0xde70e028  ! 9: STX_I	stx	%r15, [%r3 + 0x0028]
IRF_CE_2:
!$EV error(2,expr(@VA(.MAIN.IRF_CE_2), 16, 16), 1,IRF,ce,21,x, x,x,x, x,x,x)
!$EV error(2,expr(@VA(.MAIN.IRF_CE_2), 16, 16), 3,IRF,ce,51,x, x,x,x, x,x,x)
	.word 0xfc20aef8  ! 9: STW_I	stw	%r30, [%r2 + 0x0ef8]
	.word 0xec28a414  ! 9: STB_I	stb	%r22, [%r2 + 0x0414]
	.word 0xee28a554  ! 9: STB_I	stb	%r23, [%r2 + 0x0554]
	.word 0xfee9d005  ! 9: LDSTUBA_R	ldstuba	%r31, [%r7 + %r5] 0x80
	.word 0xbe090005  ! 9: AND_R	and 	%r4, %r5, %r31
	.word 0xa4018005  ! 9: ADD_R	add 	%r6, %r5, %r18
	bne thr2_loop_0
	subcc %g1, 0x1, %g1
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr2_loop_1:
	.word 0xa801aa9a  ! 16: ADD_I	add 	%r6, 0x0a9a, %r20
	.word 0xa000c005  ! 16: ADD_R	add 	%r3, %r5, %r16
	.word 0xb8110005  ! 16: OR_R	or 	%r4, %r5, %r28
	.word 0xb8018005  ! 16: ADD_R	add 	%r6, %r5, %r28
	.word 0xa001239a  ! 16: ADD_I	add 	%r4, 0x039a, %r16
	.word 0xb4010005  ! 16: ADD_R	add 	%r4, %r5, %r26
	.word 0xb010ee9e  ! 16: OR_I	or 	%r3, 0x0e9e, %r24
	.word 0xb8108005  ! 16: OR_R	or 	%r2, %r5, %r28
	.word 0xaa0920ea  ! 16: AND_I	and 	%r4, 0x00ea, %r21
	.word 0xb211e5c0  ! 16: OR_I	or 	%r7, 0x05c0, %r25
	.word 0xbc112264  ! 16: OR_I	or 	%r4, 0x0264, %r30
	.word 0x9e08a5f8  ! 16: AND_I	and 	%r2, 0x05f8, %r15
	.word 0xa608acfb  ! 16: AND_I	and 	%r2, 0x0cfb, %r19
	.word 0xa00123ad  ! 16: ADD_I	add 	%r4, 0x03ad, %r16
	.word 0xb4088005  ! 16: AND_R	and 	%r2, %r5, %r26
	.word 0xa801ae57  ! 16: ADD_I	add 	%r6, 0x0e57, %r20
	.word 0xac118005  ! 16: OR_R	or 	%r6, %r5, %r22
	.word 0xba118005  ! 16: OR_R	or 	%r6, %r5, %r29
	.word 0xa8110005  ! 16: OR_R	or 	%r4, %r5, %r20
	.word 0x9a11c005  ! 16: OR_R	or 	%r7, %r5, %r13
	.word 0x9e00ae40  ! 16: ADD_I	add 	%r2, 0x0e40, %r15
	.word 0xae11a082  ! 16: OR_I	or 	%r6, 0x0082, %r23
	.word 0xac08a564  ! 16: AND_I	and 	%r2, 0x0564, %r22
	.word 0xb209a6a6  ! 16: AND_I	and 	%r6, 0x06a6, %r25
	.word 0xb608a292  ! 16: AND_I	and 	%r2, 0x0292, %r27
	.word 0xac018005  ! 16: ADD_R	add 	%r6, %r5, %r22
	.word 0xa608ea6a  ! 16: AND_I	and 	%r3, 0x0a6a, %r19
	.word 0xac012716  ! 16: ADD_I	add 	%r4, 0x0716, %r22
	.word 0xb209ef0b  ! 16: AND_I	and 	%r7, 0x0f0b, %r25
	.word 0xae08e794  ! 16: AND_I	and 	%r3, 0x0794, %r23
	.word 0xbe00a04a  ! 16: ADD_I	add 	%r2, 0x004a, %r31
	.word 0xb601c005  ! 16: ADD_R	add 	%r7, %r5, %r27
	.word 0xac08af2a  ! 16: AND_I	and 	%r2, 0x0f2a, %r22
	.word 0xa600c005  ! 16: ADD_R	add 	%r3, %r5, %r19
	.word 0xbe00a85a  ! 16: ADD_I	add 	%r2, 0x085a, %r31
	.word 0xb6008005  ! 16: ADD_R	add 	%r2, %r5, %r27
	.word 0xbc11c005  ! 16: OR_R	or 	%r7, %r5, %r30
	.word 0xb4110005  ! 16: OR_R	or 	%r4, %r5, %r26
	.word 0xa809e3e9  ! 16: AND_I	and 	%r7, 0x03e9, %r20
	.word 0xac11c005  ! 16: OR_R	or 	%r7, %r5, %r22
	.word 0xb2118005  ! 16: OR_R	or 	%r6, %r5, %r25
	.word 0xba08e3ea  ! 16: AND_I	and 	%r3, 0x03ea, %r29
	.word 0xb4018005  ! 16: ADD_R	add 	%r6, %r5, %r26
	.word 0x9c01e53c  ! 16: ADD_I	add 	%r7, 0x053c, %r14
	.word 0xac01c005  ! 16: ADD_R	add 	%r7, %r5, %r22
	.word 0xaa10a79f  ! 16: OR_I	or 	%r2, 0x079f, %r21
	.word 0x9c010005  ! 16: ADD_R	add 	%r4, %r5, %r14
	.word 0xac00e6d5  ! 16: ADD_I	add 	%r3, 0x06d5, %r22
	.word 0xb211e6a8  ! 16: OR_I	or 	%r7, 0x06a8, %r25
	.word 0xb0090005  ! 16: AND_R	and 	%r4, %r5, %r24
	.word 0x9c01c005  ! 16: ADD_R	add 	%r7, %r5, %r14
	.word 0xa609e969  ! 16: AND_I	and 	%r7, 0x0969, %r19
	.word 0xb0098005  ! 16: AND_R	and 	%r6, %r5, %r24
	.word 0xb4010005  ! 16: ADD_R	add 	%r4, %r5, %r26
	.word 0xb811e68c  ! 16: OR_I	or 	%r7, 0x068c, %r28
	.word 0xbe098005  ! 16: AND_R	and 	%r6, %r5, %r31
	.word 0xba10edb1  ! 16: OR_I	or 	%r3, 0x0db1, %r29
	.word 0x9a11c005  ! 16: OR_R	or 	%r7, %r5, %r13
	.word 0xba11ee48  ! 16: OR_I	or 	%r7, 0x0e48, %r29
	.word 0xa2008005  ! 16: ADD_R	add 	%r2, %r5, %r17
	.word 0xb208aeef  ! 16: AND_I	and 	%r2, 0x0eef, %r25
	.word 0xba09e022  ! 16: AND_I	and 	%r7, 0x0022, %r29
	.word 0x9e088005  ! 16: AND_R	and 	%r2, %r5, %r15
	.word 0xb2018005  ! 16: ADD_R	add 	%r6, %r5, %r25
	.word 0x9e098005  ! 16: AND_R	and 	%r6, %r5, %r15
	.word 0xa809ac4d  ! 16: AND_I	and 	%r6, 0x0c4d, %r20
	.word 0xbe08e973  ! 16: AND_I	and 	%r3, 0x0973, %r31
	.word 0xb810aca9  ! 16: OR_I	or 	%r2, 0x0ca9, %r28
	.word 0x9e11add8  ! 16: OR_I	or 	%r6, 0x0dd8, %r15
	.word 0xba088005  ! 16: AND_R	and 	%r2, %r5, %r29
	.word 0xba110005  ! 16: OR_R	or 	%r4, %r5, %r29
	.word 0x9e01a31f  ! 16: ADD_I	add 	%r6, 0x031f, %r15
	.word 0xba00afa9  ! 16: ADD_I	add 	%r2, 0x0fa9, %r29
	.word 0x9e11a7c9  ! 16: OR_I	or 	%r6, 0x07c9, %r15
	.word 0xb408c005  ! 16: AND_R	and 	%r3, %r5, %r26
	.word 0xa608aeff  ! 16: AND_I	and 	%r2, 0x0eff, %r19
	.word 0x9e08c005  ! 16: AND_R	and 	%r3, %r5, %r15
	.word 0xb601c005  ! 16: ADD_R	add 	%r7, %r5, %r27
	.word 0xb0018005  ! 16: ADD_R	add 	%r6, %r5, %r24
	.word 0xa401ebce  ! 16: ADD_I	add 	%r7, 0x0bce, %r18
	.word 0xba108005  ! 16: OR_R	or 	%r2, %r5, %r29
	.word 0x9e018005  ! 16: ADD_R	add 	%r6, %r5, %r15
	.word 0xa210c005  ! 16: OR_R	or 	%r3, %r5, %r17
	.word 0xa0092d68  ! 16: AND_I	and 	%r4, 0x0d68, %r16
	.word 0xa411e7aa  ! 16: OR_I	or 	%r7, 0x07aa, %r18
	.word 0x9e08a5e1  ! 16: AND_I	and 	%r2, 0x05e1, %r15
	.word 0x9a00e713  ! 16: ADD_I	add 	%r3, 0x0713, %r13
	.word 0x9a08ab9d  ! 16: AND_I	and 	%r2, 0x0b9d, %r13
	.word 0xb800e2d5  ! 16: ADD_I	add 	%r3, 0x02d5, %r28
	.word 0xbc00ad10  ! 16: ADD_I	add 	%r2, 0x0d10, %r30
	.word 0x9e01e724  ! 16: ADD_I	add 	%r7, 0x0724, %r15
	.word 0xa2010005  ! 16: ADD_R	add 	%r4, %r5, %r17
	.word 0xb601a8d5  ! 16: ADD_I	add 	%r6, 0x08d5, %r27
	.word 0xba08a7b4  ! 16: AND_I	and 	%r2, 0x07b4, %r29
	.word 0x9a1127ea  ! 16: OR_I	or 	%r4, 0x07ea, %r13
	.word 0xa6118005  ! 16: OR_R	or 	%r6, %r5, %r19
	.word 0xb6010005  ! 16: ADD_R	add 	%r4, %r5, %r27
	.word 0xb200e817  ! 16: ADD_I	add 	%r3, 0x0817, %r25
	.word 0x9e09243d  ! 16: AND_I	and 	%r4, 0x043d, %r15
	.word 0xba088005  ! 16: AND_R	and 	%r2, %r5, %r29
	.word 0xb210a195  ! 16: OR_I	or 	%r2, 0x0195, %r25
	.word 0xb400a23d  ! 16: ADD_I	add 	%r2, 0x023d, %r26
	.word 0x9a01c005  ! 16: ADD_R	add 	%r7, %r5, %r13
	.word 0xbe088005  ! 16: AND_R	and 	%r2, %r5, %r31
	.word 0x9e08aa03  ! 16: AND_I	and 	%r2, 0x0a03, %r15
	.word 0xa6018005  ! 16: ADD_R	add 	%r6, %r5, %r19
	.word 0xba08a555  ! 16: AND_I	and 	%r2, 0x0555, %r29
	.word 0x9c008005  ! 16: ADD_R	add 	%r2, %r5, %r14
	.word 0xbc00a3d1  ! 16: ADD_I	add 	%r2, 0x03d1, %r30
	.word 0xa6012e1e  ! 16: ADD_I	add 	%r4, 0x0e1e, %r19
	.word 0xb200c005  ! 16: ADD_R	add 	%r3, %r5, %r25
	.word 0x9e110005  ! 16: OR_R	or 	%r4, %r5, %r15
	.word 0xa8008005  ! 16: ADD_R	add 	%r2, %r5, %r20
	.word 0x9c11c005  ! 16: OR_R	or 	%r7, %r5, %r14
	.word 0xba008005  ! 16: ADD_R	add 	%r2, %r5, %r29
	.word 0xa201c005  ! 16: ADD_R	add 	%r7, %r5, %r17
	.word 0x9a10e718  ! 16: OR_I	or 	%r3, 0x0718, %r13
	.word 0x9e11c005  ! 16: OR_R	or 	%r7, %r5, %r15
	.word 0xba11a752  ! 16: OR_I	or 	%r6, 0x0752, %r29
	.word 0xb2092b26  ! 16: AND_I	and 	%r4, 0x0b26, %r25
	.word 0xb408ef10  ! 16: AND_I	and 	%r3, 0x0f10, %r26
	.word 0xbe088005  ! 16: AND_R	and 	%r2, %r5, %r31
	.word 0x9e110005  ! 16: OR_R	or 	%r4, %r5, %r15
	.word 0xae118005  ! 16: OR_R	or 	%r6, %r5, %r23
	.word 0xaa09c005  ! 16: AND_R	and 	%r7, %r5, %r21
	.word 0xae088005  ! 16: AND_R	and 	%r2, %r5, %r23
	.word 0xb009ec3f  ! 16: AND_I	and 	%r7, 0x0c3f, %r24
	.word 0x9a10e183  ! 16: OR_I	or 	%r3, 0x0183, %r13
	.word 0xe821a028  ! 16: STW_I	stw	%r20, [%r6 + 0x0028]
	.word 0xf8292619  ! 16: STB_I	stb	%r28, [%r4 + 0x0619]
	.word 0xe828a19d  ! 16: STB_I	stb	%r20, [%r2 + 0x019d]
	.word 0xee31ab0e  ! 16: STH_I	sth	%r23, [%r6 + 0x0b0e]
IRF_CE_6:
!$EV error(2,expr(@VA(.MAIN.IRF_CE_6), 16, 16), 1,IRF,ce,34,x, x,x,x, x,x,x)
!$EV error(2,expr(@VA(.MAIN.IRF_CE_6), 16, 16), 3,IRF,ce,27,x, x,x,x, x,x,x)
	.word 0xf871a000  ! 16: STX_I	stx	%r28, [%r6 + 0x0000]
	.word 0xfa70a340  ! 16: STX_I	stx	%r29, [%r2 + 0x0340]
	.word 0xe63129a4  ! 16: STH_I	sth	%r19, [%r4 + 0x09a4]
	.word 0xea798005  ! 16: SWAP_R	swap	%r21, [%r6 + %r5]
	.word 0xac110005  ! 16: OR_R	or 	%r4, %r5, %r22
	.word 0xb0090005  ! 16: AND_R	and 	%r4, %r5, %r24
	bne thr2_loop_1
	subcc %g1, 0x1, %g1
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr2_loop_2:
	.word 0xba00e489  ! 23: ADD_I	add 	%r3, 0x0489, %r29
	.word 0xa8108005  ! 23: OR_R	or 	%r2, %r5, %r20
	.word 0xba00abb7  ! 23: ADD_I	add 	%r2, 0x0bb7, %r29
	.word 0xa0088005  ! 23: AND_R	and 	%r2, %r5, %r16
	.word 0xb0110005  ! 23: OR_R	or 	%r4, %r5, %r24
	.word 0xb609a3aa  ! 23: AND_I	and 	%r6, 0x03aa, %r27
	.word 0xaa01c005  ! 23: ADD_R	add 	%r7, %r5, %r21
	.word 0xa400a555  ! 23: ADD_I	add 	%r2, 0x0555, %r18
	.word 0x9e118005  ! 23: OR_R	or 	%r6, %r5, %r15
	.word 0xbe088005  ! 23: AND_R	and 	%r2, %r5, %r31
	.word 0xbc01c005  ! 23: ADD_R	add 	%r7, %r5, %r30
	.word 0xb210c005  ! 23: OR_R	or 	%r3, %r5, %r25
	.word 0xac00c005  ! 23: ADD_R	add 	%r3, %r5, %r22
	.word 0xa801c005  ! 23: ADD_R	add 	%r7, %r5, %r20
	.word 0xa8118005  ! 23: OR_R	or 	%r6, %r5, %r20
	.word 0x9e09aad0  ! 23: AND_I	and 	%r6, 0x0ad0, %r15
	.word 0xa809e838  ! 23: AND_I	and 	%r7, 0x0838, %r20
	.word 0xbe08c005  ! 23: AND_R	and 	%r3, %r5, %r31
	.word 0xa008aae8  ! 23: AND_I	and 	%r2, 0x0ae8, %r16
	.word 0xba012209  ! 23: ADD_I	add 	%r4, 0x0209, %r29
	.word 0xbc00a737  ! 23: ADD_I	add 	%r2, 0x0737, %r30
	.word 0xb010af89  ! 23: OR_I	or 	%r2, 0x0f89, %r24
	.word 0x9e092b2f  ! 23: AND_I	and 	%r4, 0x0b2f, %r15
	.word 0xa000a964  ! 23: ADD_I	add 	%r2, 0x0964, %r16
	.word 0xa008c005  ! 23: AND_R	and 	%r3, %r5, %r16
	.word 0x9c00e970  ! 23: ADD_I	add 	%r3, 0x0970, %r14
	.word 0xa409c005  ! 23: AND_R	and 	%r7, %r5, %r18
	.word 0xaa11ad7e  ! 23: OR_I	or 	%r6, 0x0d7e, %r21
	.word 0xbe10e645  ! 23: OR_I	or 	%r3, 0x0645, %r31
	.word 0x9a092911  ! 23: AND_I	and 	%r4, 0x0911, %r13
	.word 0x9e10adbc  ! 23: OR_I	or 	%r2, 0x0dbc, %r15
	.word 0xac11aee8  ! 23: OR_I	or 	%r6, 0x0ee8, %r22
	.word 0xb200c005  ! 23: ADD_R	add 	%r3, %r5, %r25
	.word 0xaa08c005  ! 23: AND_R	and 	%r3, %r5, %r21
	.word 0xa2108005  ! 23: OR_R	or 	%r2, %r5, %r17
	.word 0xa410e762  ! 23: OR_I	or 	%r3, 0x0762, %r18
	.word 0xae00a28b  ! 23: ADD_I	add 	%r2, 0x028b, %r23
	.word 0xb2090005  ! 23: AND_R	and 	%r4, %r5, %r25
	.word 0xba10c005  ! 23: OR_R	or 	%r3, %r5, %r29
	.word 0xb010eddb  ! 23: OR_I	or 	%r3, 0x0ddb, %r24
	.word 0xa0088005  ! 23: AND_R	and 	%r2, %r5, %r16
	.word 0xa4092b19  ! 23: AND_I	and 	%r4, 0x0b19, %r18
	.word 0xa8008005  ! 23: ADD_R	add 	%r2, %r5, %r20
	.word 0xae008005  ! 23: ADD_R	add 	%r2, %r5, %r23
	.word 0xa2108005  ! 23: OR_R	or 	%r2, %r5, %r17
	.word 0x9c09c005  ! 23: AND_R	and 	%r7, %r5, %r14
	.word 0x9e11e30b  ! 23: OR_I	or 	%r7, 0x030b, %r15
	.word 0xa0108005  ! 23: OR_R	or 	%r2, %r5, %r16
	.word 0xbe09ebc9  ! 23: AND_I	and 	%r7, 0x0bc9, %r31
	.word 0xb8098005  ! 23: AND_R	and 	%r6, %r5, %r28
	.word 0xb401e87b  ! 23: ADD_I	add 	%r7, 0x087b, %r26
	.word 0x9c10e771  ! 23: OR_I	or 	%r3, 0x0771, %r14
	.word 0xa011efee  ! 23: OR_I	or 	%r7, 0x0fee, %r16
	.word 0xa811e1a5  ! 23: OR_I	or 	%r7, 0x01a5, %r20
	.word 0xba110005  ! 23: OR_R	or 	%r4, %r5, %r29
	.word 0x9a10ece0  ! 23: OR_I	or 	%r3, 0x0ce0, %r13
	.word 0xbc110005  ! 23: OR_R	or 	%r4, %r5, %r30
	.word 0x9a08a089  ! 23: AND_I	and 	%r2, 0x0089, %r13
	.word 0xaa098005  ! 23: AND_R	and 	%r6, %r5, %r21
	.word 0xa0110005  ! 23: OR_R	or 	%r4, %r5, %r16
	.word 0xb208ecaf  ! 23: AND_I	and 	%r3, 0x0caf, %r25
	.word 0xb001ac81  ! 23: ADD_I	add 	%r6, 0x0c81, %r24
	.word 0xbc01c005  ! 23: ADD_R	add 	%r7, %r5, %r30
	.word 0xa811e3c1  ! 23: OR_I	or 	%r7, 0x03c1, %r20
	.word 0xa411a119  ! 23: OR_I	or 	%r6, 0x0119, %r18
	.word 0xba08c005  ! 23: AND_R	and 	%r3, %r5, %r29
	.word 0xb811247b  ! 23: OR_I	or 	%r4, 0x047b, %r28
	.word 0x9a010005  ! 23: ADD_R	add 	%r4, %r5, %r13
	.word 0xae09e8a2  ! 23: AND_I	and 	%r7, 0x08a2, %r23
	.word 0x9a11e2be  ! 23: OR_I	or 	%r7, 0x02be, %r13
	.word 0xb209e6e9  ! 23: AND_I	and 	%r7, 0x06e9, %r25
	.word 0xae088005  ! 23: AND_R	and 	%r2, %r5, %r23
	.word 0x9a01e414  ! 23: ADD_I	add 	%r7, 0x0414, %r13
	.word 0xa400ae86  ! 23: ADD_I	add 	%r2, 0x0e86, %r18
	.word 0x9c01c005  ! 23: ADD_R	add 	%r7, %r5, %r14
	.word 0xb6090005  ! 23: AND_R	and 	%r4, %r5, %r27
	.word 0xba01a1f3  ! 23: ADD_I	add 	%r6, 0x01f3, %r29
	.word 0xb4088005  ! 23: AND_R	and 	%r2, %r5, %r26
	.word 0x9e088005  ! 23: AND_R	and 	%r2, %r5, %r15
	.word 0xb2018005  ! 23: ADD_R	add 	%r6, %r5, %r25
	.word 0xa401c005  ! 23: ADD_R	add 	%r7, %r5, %r18
	.word 0x9a08e68b  ! 23: AND_I	and 	%r3, 0x068b, %r13
	.word 0xb601a1b3  ! 23: ADD_I	add 	%r6, 0x01b3, %r27
	.word 0x9e008005  ! 23: ADD_R	add 	%r2, %r5, %r15
	.word 0xa8118005  ! 23: OR_R	or 	%r6, %r5, %r20
	.word 0xac08e50a  ! 23: AND_I	and 	%r3, 0x050a, %r22
	.word 0xa0108005  ! 23: OR_R	or 	%r2, %r5, %r16
	.word 0xa401acff  ! 23: ADD_I	add 	%r6, 0x0cff, %r18
	.word 0x9e098005  ! 23: AND_R	and 	%r6, %r5, %r15
	.word 0xa011c005  ! 23: OR_R	or 	%r7, %r5, %r16
	.word 0xa4018005  ! 23: ADD_R	add 	%r6, %r5, %r18
	.word 0xb801aaa7  ! 23: ADD_I	add 	%r6, 0x0aa7, %r28
	.word 0xbe108005  ! 23: OR_R	or 	%r2, %r5, %r31
	.word 0xb4012601  ! 23: ADD_I	add 	%r4, 0x0601, %r26
	.word 0xa810e1bc  ! 23: OR_I	or 	%r3, 0x01bc, %r20
	.word 0xbe10eba6  ! 23: OR_I	or 	%r3, 0x0ba6, %r31
	.word 0xbc11ae45  ! 23: OR_I	or 	%r6, 0x0e45, %r30
	.word 0xa209ab0b  ! 23: AND_I	and 	%r6, 0x0b0b, %r17
	.word 0xbe00e344  ! 23: ADD_I	add 	%r3, 0x0344, %r31
	.word 0xa208abcf  ! 23: AND_I	and 	%r2, 0x0bcf, %r17
	.word 0xb41123d8  ! 23: OR_I	or 	%r4, 0x03d8, %r26
	.word 0xa8118005  ! 23: OR_R	or 	%r6, %r5, %r20
	.word 0xae11e71e  ! 23: OR_I	or 	%r7, 0x071e, %r23
	.word 0xb2108005  ! 23: OR_R	or 	%r2, %r5, %r25
	.word 0xaa108005  ! 23: OR_R	or 	%r2, %r5, %r21
	.word 0xb201aab5  ! 23: ADD_I	add 	%r6, 0x0ab5, %r25
	.word 0xbe112da2  ! 23: OR_I	or 	%r4, 0x0da2, %r31
	.word 0xa808c005  ! 23: AND_R	and 	%r3, %r5, %r20
	.word 0xaa09c005  ! 23: AND_R	and 	%r7, %r5, %r21
	.word 0xb6008005  ! 23: ADD_R	add 	%r2, %r5, %r27
	.word 0xa8112f4e  ! 23: OR_I	or 	%r4, 0x0f4e, %r20
	.word 0xb800aa91  ! 23: ADD_I	add 	%r2, 0x0a91, %r28
	.word 0xb608ee00  ! 23: AND_I	and 	%r3, 0x0e00, %r27
	.word 0x9e11c005  ! 23: OR_R	or 	%r7, %r5, %r15
	.word 0xa201a55f  ! 23: ADD_I	add 	%r6, 0x055f, %r17
	.word 0xa209e222  ! 23: AND_I	and 	%r7, 0x0222, %r17
	.word 0xb2018005  ! 23: ADD_R	add 	%r6, %r5, %r25
	.word 0xa2018005  ! 23: ADD_R	add 	%r6, %r5, %r17
	.word 0xb801e266  ! 23: ADD_I	add 	%r7, 0x0266, %r28
	.word 0xbc010005  ! 23: ADD_R	add 	%r4, %r5, %r30
	.word 0xb608ac4b  ! 23: AND_I	and 	%r2, 0x0c4b, %r27
	.word 0xbc010005  ! 23: ADD_R	add 	%r4, %r5, %r30
	.word 0xa609a04e  ! 23: AND_I	and 	%r6, 0x004e, %r19
	.word 0xb6008005  ! 23: ADD_R	add 	%r2, %r5, %r27
	.word 0xac01efc8  ! 23: ADD_I	add 	%r7, 0x0fc8, %r22
	.word 0xbc090005  ! 23: AND_R	and 	%r4, %r5, %r30
	.word 0xa010e692  ! 23: OR_I	or 	%r3, 0x0692, %r16
	.word 0x9a118005  ! 23: OR_R	or 	%r6, %r5, %r13
	.word 0xa200c005  ! 23: ADD_R	add 	%r3, %r5, %r17
	.word 0x9e098005  ! 23: AND_R	and 	%r6, %r5, %r15
	.word 0xa010af7f  ! 23: OR_I	or 	%r2, 0x0f7f, %r16
	.word 0xa609a963  ! 23: AND_I	and 	%r6, 0x0963, %r19
	.word 0xa808c005  ! 23: AND_R	and 	%r3, %r5, %r20
	.word 0xa401a3ff  ! 23: ADD_I	add 	%r6, 0x03ff, %r18
	.word 0xbe108005  ! 23: OR_R	or 	%r2, %r5, %r31
	.word 0xa801c005  ! 23: ADD_R	add 	%r7, %r5, %r20
	.word 0xae09e424  ! 23: AND_I	and 	%r7, 0x0424, %r23
	.word 0x9a09ad0a  ! 23: AND_I	and 	%r6, 0x0d0a, %r13
	.word 0xb810c005  ! 23: OR_R	or 	%r3, %r5, %r28
	.word 0xae012171  ! 23: ADD_I	add 	%r4, 0x0171, %r23
	.word 0xb008ab5e  ! 23: AND_I	and 	%r2, 0x0b5e, %r24
	.word 0xac10c005  ! 23: OR_R	or 	%r3, %r5, %r22
	.word 0xb800a9e5  ! 23: ADD_I	add 	%r2, 0x09e5, %r28
	.word 0xb2118005  ! 23: OR_R	or 	%r6, %r5, %r25
	.word 0xa411c005  ! 23: OR_R	or 	%r7, %r5, %r18
	.word 0xa4108005  ! 23: OR_R	or 	%r2, %r5, %r18
	.word 0xa2088005  ! 23: AND_R	and 	%r2, %r5, %r17
	.word 0xb8018005  ! 23: ADD_R	add 	%r6, %r5, %r28
	.word 0xa409c005  ! 23: AND_R	and 	%r7, %r5, %r18
	.word 0xa011e733  ! 23: OR_I	or 	%r7, 0x0733, %r16
	.word 0xba11eb9e  ! 23: OR_I	or 	%r7, 0x0b9e, %r29
	.word 0xb400efed  ! 23: ADD_I	add 	%r3, 0x0fed, %r26
	.word 0x9c118005  ! 23: OR_R	or 	%r6, %r5, %r14
	.word 0x9e11c005  ! 23: OR_R	or 	%r7, %r5, %r15
	.word 0xa608aa1b  ! 23: AND_I	and 	%r2, 0x0a1b, %r19
	.word 0xae11a5ee  ! 23: OR_I	or 	%r6, 0x05ee, %r23
	.word 0xa6088005  ! 23: AND_R	and 	%r2, %r5, %r19
	.word 0xbc092a5a  ! 23: AND_I	and 	%r4, 0x0a5a, %r30
	.word 0xac11e72f  ! 23: OR_I	or 	%r7, 0x072f, %r22
	.word 0xac088005  ! 23: AND_R	and 	%r2, %r5, %r22
	.word 0xaa10c005  ! 23: OR_R	or 	%r3, %r5, %r21
	.word 0xa810e591  ! 23: OR_I	or 	%r3, 0x0591, %r20
	.word 0xa8010005  ! 23: ADD_R	add 	%r4, %r5, %r20
	.word 0xa800e9ef  ! 23: ADD_I	add 	%r3, 0x09ef, %r20
	.word 0xaa01e80c  ! 23: ADD_I	add 	%r7, 0x080c, %r21
	.word 0xb600c005  ! 23: ADD_R	add 	%r3, %r5, %r27
	.word 0xb400a148  ! 23: ADD_I	add 	%r2, 0x0148, %r26
	.word 0x9a09aca9  ! 23: AND_I	and 	%r6, 0x0ca9, %r13
	.word 0xba10c005  ! 23: OR_R	or 	%r3, %r5, %r29
	.word 0xa610c005  ! 23: OR_R	or 	%r3, %r5, %r19
	.word 0xaa00a60b  ! 23: ADD_I	add 	%r2, 0x060b, %r21
	.word 0xa000a6de  ! 23: ADD_I	add 	%r2, 0x06de, %r16
	.word 0xb600ab86  ! 23: ADD_I	add 	%r2, 0x0b86, %r27
	.word 0x9c09e2b7  ! 23: AND_I	and 	%r7, 0x02b7, %r14
	.word 0xae00ee7e  ! 23: ADD_I	add 	%r3, 0x0e7e, %r23
	.word 0x9c00c005  ! 23: ADD_R	add 	%r3, %r5, %r14
	.word 0xb401e106  ! 23: ADD_I	add 	%r7, 0x0106, %r26
	.word 0xae098005  ! 23: AND_R	and 	%r6, %r5, %r23
	.word 0xac11c005  ! 23: OR_R	or 	%r7, %r5, %r22
	.word 0xac008005  ! 23: ADD_R	add 	%r2, %r5, %r22
	.word 0xba090005  ! 23: AND_R	and 	%r4, %r5, %r29
	.word 0x9e09c005  ! 23: AND_R	and 	%r7, %r5, %r15
	.word 0xb401ad0e  ! 23: ADD_I	add 	%r6, 0x0d0e, %r26
	.word 0xa800a50f  ! 23: ADD_I	add 	%r2, 0x050f, %r20
	.word 0xb20121bd  ! 23: ADD_I	add 	%r4, 0x01bd, %r25
	.word 0xb009afc6  ! 23: AND_I	and 	%r6, 0x0fc6, %r24
	.word 0xa008c005  ! 23: AND_R	and 	%r3, %r5, %r16
	.word 0xa4088005  ! 23: AND_R	and 	%r2, %r5, %r18
	.word 0x9c088005  ! 23: AND_R	and 	%r2, %r5, %r14
	.word 0xb800ed98  ! 23: ADD_I	add 	%r3, 0x0d98, %r28
	.word 0xba118005  ! 23: OR_R	or 	%r6, %r5, %r29
	.word 0xb808ed15  ! 23: AND_I	and 	%r3, 0x0d15, %r28
	.word 0xbe108005  ! 23: OR_R	or 	%r2, %r5, %r31
	.word 0xbe012d67  ! 23: ADD_I	add 	%r4, 0x0d67, %r31
	.word 0xba00a15f  ! 23: ADD_I	add 	%r2, 0x015f, %r29
	.word 0xa20928d9  ! 23: AND_I	and 	%r4, 0x08d9, %r17
	.word 0xbc01c005  ! 23: ADD_R	add 	%r7, %r5, %r30
	.word 0xb208eb9f  ! 23: AND_I	and 	%r3, 0x0b9f, %r25
	.word 0xb4108005  ! 23: OR_R	or 	%r2, %r5, %r26
	.word 0xba11c005  ! 23: OR_R	or 	%r7, %r5, %r29
	.word 0xb4088005  ! 23: AND_R	and 	%r2, %r5, %r26
	.word 0xb2008005  ! 23: ADD_R	add 	%r2, %r5, %r25
	.word 0xa800e0e0  ! 23: ADD_I	add 	%r3, 0x00e0, %r20
	.word 0xba088005  ! 23: AND_R	and 	%r2, %r5, %r29
	.word 0xb210ed6c  ! 23: OR_I	or 	%r3, 0x0d6c, %r25
	.word 0xa4008005  ! 23: ADD_R	add 	%r2, %r5, %r18
	.word 0xbe01adcd  ! 23: ADD_I	add 	%r6, 0x0dcd, %r31
	.word 0xb809e016  ! 23: AND_I	and 	%r7, 0x0016, %r28
	.word 0xb8098005  ! 23: AND_R	and 	%r6, %r5, %r28
	.word 0xa608c005  ! 23: AND_R	and 	%r3, %r5, %r19
	.word 0xa610c005  ! 23: OR_R	or 	%r3, %r5, %r19
	.word 0xa801c005  ! 23: ADD_R	add 	%r7, %r5, %r20
	.word 0xac08af06  ! 23: AND_I	and 	%r2, 0x0f06, %r22
	.word 0xac09c005  ! 23: AND_R	and 	%r7, %r5, %r22
	.word 0xaa01c005  ! 23: ADD_R	add 	%r7, %r5, %r21
	.word 0xbc090005  ! 23: AND_R	and 	%r4, %r5, %r30
	.word 0xb408e40e  ! 23: AND_I	and 	%r3, 0x040e, %r26
	.word 0xb0108005  ! 23: OR_R	or 	%r2, %r5, %r24
	.word 0xb611e9f2  ! 23: OR_I	or 	%r7, 0x09f2, %r27
	.word 0x9c11ee1b  ! 23: OR_I	or 	%r7, 0x0e1b, %r14
	.word 0xae11c005  ! 23: OR_R	or 	%r7, %r5, %r23
	.word 0xa4088005  ! 23: AND_R	and 	%r2, %r5, %r18
	.word 0xac1120c9  ! 23: OR_I	or 	%r4, 0x00c9, %r22
	.word 0xb000c005  ! 23: ADD_R	add 	%r3, %r5, %r24
	.word 0xa411ae9c  ! 23: OR_I	or 	%r6, 0x0e9c, %r18
	.word 0xbe11acaf  ! 23: OR_I	or 	%r6, 0x0caf, %r31
	.word 0x9c00ad61  ! 23: ADD_I	add 	%r2, 0x0d61, %r14
	.word 0xb6018005  ! 23: ADD_R	add 	%r6, %r5, %r27
	.word 0xae008005  ! 23: ADD_R	add 	%r2, %r5, %r23
	.word 0x9e11aad9  ! 23: OR_I	or 	%r6, 0x0ad9, %r15
	.word 0xa011c005  ! 23: OR_R	or 	%r7, %r5, %r16
	.word 0xba088005  ! 23: AND_R	and 	%r2, %r5, %r29
	.word 0xf020a0d8  ! 23: STW_I	stw	%r24, [%r2 + 0x00d8]
	.word 0xe021a9f4  ! 23: STW_I	stw	%r16, [%r6 + 0x09f4]
	.word 0xda31e642  ! 23: STH_I	sth	%r13, [%r7 + 0x0642]
	.word 0xfc28a0e2  ! 23: STB_I	stb	%r30, [%r2 + 0x00e2]
IRF_CE_10:
!$EV error(2,expr(@VA(.MAIN.IRF_CE_10), 16, 16), 1,IRF,ce,33,x, x,x,x, x,x,x)
!$EV error(2,expr(@VA(.MAIN.IRF_CE_10), 16, 16), 3,IRF,ce,35,x, x,x,x, x,x,x)
	.word 0xf630a25c  ! 23: STH_I	sth	%r27, [%r2 + 0x025c]
	.word 0xdc30aed4  ! 23: STH_I	sth	%r14, [%r2 + 0x0ed4]
	.word 0xfa21a088  ! 23: STW_I	stw	%r29, [%r6 + 0x0088]
	.word 0xe4f8d005  ! 23: SWAPA_R	swapa	%r18, [%r3 + %r5] 0x80
	.word 0xb0092cb3  ! 23: AND_I	and 	%r4, 0x0cb3, %r24
	.word 0xbc110005  ! 23: OR_R	or 	%r4, %r5, %r30
	bne thr2_loop_2
	subcc %g1, 0x1, %g1
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr2_loop_3:
	.word 0xb2098005  ! 30: AND_R	and 	%r6, %r5, %r25
	.word 0x9c108005  ! 30: OR_R	or 	%r2, %r5, %r14
	.word 0x9a110005  ! 30: OR_R	or 	%r4, %r5, %r13
	.word 0xaa01e4ea  ! 30: ADD_I	add 	%r7, 0x04ea, %r21
	.word 0xa408c005  ! 30: AND_R	and 	%r3, %r5, %r18
	.word 0xb609e7ac  ! 30: AND_I	and 	%r7, 0x07ac, %r27
	.word 0x9e09c005  ! 30: AND_R	and 	%r7, %r5, %r15
	.word 0x9e09e91a  ! 30: AND_I	and 	%r7, 0x091a, %r15
	.word 0xa0112a37  ! 30: OR_I	or 	%r4, 0x0a37, %r16
	.word 0xb210c005  ! 30: OR_R	or 	%r3, %r5, %r25
	.word 0xa6018005  ! 30: ADD_R	add 	%r6, %r5, %r19
	.word 0xaa09e580  ! 30: AND_I	and 	%r7, 0x0580, %r21
	.word 0x9c11a2bb  ! 30: OR_I	or 	%r6, 0x02bb, %r14
	.word 0xb2088005  ! 30: AND_R	and 	%r2, %r5, %r25
	.word 0xaa012c5c  ! 30: ADD_I	add 	%r4, 0x0c5c, %r21
	.word 0xb2118005  ! 30: OR_R	or 	%r6, %r5, %r25
	.word 0xb209c005  ! 30: AND_R	and 	%r7, %r5, %r25
	.word 0xb4018005  ! 30: ADD_R	add 	%r6, %r5, %r26
	.word 0xa0110005  ! 30: OR_R	or 	%r4, %r5, %r16
	.word 0xa411e114  ! 30: OR_I	or 	%r7, 0x0114, %r18
	.word 0xbe08a0e4  ! 30: AND_I	and 	%r2, 0x00e4, %r31
	.word 0xb800a4f9  ! 30: ADD_I	add 	%r2, 0x04f9, %r28
	.word 0xaa118005  ! 30: OR_R	or 	%r6, %r5, %r21
	.word 0xba008005  ! 30: ADD_R	add 	%r2, %r5, %r29
	.word 0xac10a43d  ! 30: OR_I	or 	%r2, 0x043d, %r22
	.word 0x9a01af64  ! 30: ADD_I	add 	%r6, 0x0f64, %r13
	.word 0xb0090005  ! 30: AND_R	and 	%r4, %r5, %r24
	.word 0xb011e1af  ! 30: OR_I	or 	%r7, 0x01af, %r24
	.word 0xa000a3e6  ! 30: ADD_I	add 	%r2, 0x03e6, %r16
	.word 0xba088005  ! 30: AND_R	and 	%r2, %r5, %r29
	.word 0xa600c005  ! 30: ADD_R	add 	%r3, %r5, %r19
	.word 0xb008eb04  ! 30: AND_I	and 	%r3, 0x0b04, %r24
	.word 0xa608e85a  ! 30: AND_I	and 	%r3, 0x085a, %r19
	.word 0xa409a403  ! 30: AND_I	and 	%r6, 0x0403, %r18
	.word 0x9a09ec23  ! 30: AND_I	and 	%r7, 0x0c23, %r13
	.word 0xba08c005  ! 30: AND_R	and 	%r3, %r5, %r29
	.word 0xa20120b3  ! 30: ADD_I	add 	%r4, 0x00b3, %r17
	.word 0x9a012813  ! 30: ADD_I	add 	%r4, 0x0813, %r13
	.word 0xaa010005  ! 30: ADD_R	add 	%r4, %r5, %r21
	.word 0xae00ac14  ! 30: ADD_I	add 	%r2, 0x0c14, %r23
	.word 0xa800a779  ! 30: ADD_I	add 	%r2, 0x0779, %r20
	.word 0xa600e082  ! 30: ADD_I	add 	%r3, 0x0082, %r19
	.word 0xb608a2e9  ! 30: AND_I	and 	%r2, 0x02e9, %r27
	.word 0xa6118005  ! 30: OR_R	or 	%r6, %r5, %r19
	.word 0xb4008005  ! 30: ADD_R	add 	%r2, %r5, %r26
	.word 0xa408c005  ! 30: AND_R	and 	%r3, %r5, %r18
	.word 0xae088005  ! 30: AND_R	and 	%r2, %r5, %r23
	.word 0xae09e846  ! 30: AND_I	and 	%r7, 0x0846, %r23
	.word 0xa209a32b  ! 30: AND_I	and 	%r6, 0x032b, %r17
	.word 0x9c01c005  ! 30: ADD_R	add 	%r7, %r5, %r14
	.word 0xa401c005  ! 30: ADD_R	add 	%r7, %r5, %r18
	.word 0xa611aded  ! 30: OR_I	or 	%r6, 0x0ded, %r19
	.word 0xa001a865  ! 30: ADD_I	add 	%r6, 0x0865, %r16
	.word 0xbc08ab74  ! 30: AND_I	and 	%r2, 0x0b74, %r30
	.word 0x9a00eff0  ! 30: ADD_I	add 	%r3, 0x0ff0, %r13
	.word 0xb4110005  ! 30: OR_R	or 	%r4, %r5, %r26
	.word 0x9a008005  ! 30: ADD_R	add 	%r2, %r5, %r13
	.word 0xa40127e9  ! 30: ADD_I	add 	%r4, 0x07e9, %r18
	.word 0xa001c005  ! 30: ADD_R	add 	%r7, %r5, %r16
	.word 0xba09af6a  ! 30: AND_I	and 	%r6, 0x0f6a, %r29
	.word 0xbc00c005  ! 30: ADD_R	add 	%r3, %r5, %r30
	.word 0xbe09eea0  ! 30: AND_I	and 	%r7, 0x0ea0, %r31
	.word 0x9a110005  ! 30: OR_R	or 	%r4, %r5, %r13
	.word 0xa609a962  ! 30: AND_I	and 	%r6, 0x0962, %r19
	.word 0xbc008005  ! 30: ADD_R	add 	%r2, %r5, %r30
	.word 0x9a08c005  ! 30: AND_R	and 	%r3, %r5, %r13
	.word 0xb0092aab  ! 30: AND_I	and 	%r4, 0x0aab, %r24
	.word 0xba0921fd  ! 30: AND_I	and 	%r4, 0x01fd, %r29
	.word 0xb209ea0a  ! 30: AND_I	and 	%r7, 0x0a0a, %r25
	.word 0x9a10a9a5  ! 30: OR_I	or 	%r2, 0x09a5, %r13
	.word 0x9e10ec4c  ! 30: OR_I	or 	%r3, 0x0c4c, %r15
	.word 0x9a118005  ! 30: OR_R	or 	%r6, %r5, %r13
	.word 0x9c008005  ! 30: ADD_R	add 	%r2, %r5, %r14
	.word 0xb8090005  ! 30: AND_R	and 	%r4, %r5, %r28
	.word 0x9c00ec42  ! 30: ADD_I	add 	%r3, 0x0c42, %r14
	.word 0x9a010005  ! 30: ADD_R	add 	%r4, %r5, %r13
	.word 0xba08ae3f  ! 30: AND_I	and 	%r2, 0x0e3f, %r29
	.word 0xa210a801  ! 30: OR_I	or 	%r2, 0x0801, %r17
	.word 0xa4092262  ! 30: AND_I	and 	%r4, 0x0262, %r18
	.word 0xbc090005  ! 30: AND_R	and 	%r4, %r5, %r30
	.word 0xa009ead2  ! 30: AND_I	and 	%r7, 0x0ad2, %r16
	.word 0xbc08c005  ! 30: AND_R	and 	%r3, %r5, %r30
	.word 0xa609ea08  ! 30: AND_I	and 	%r7, 0x0a08, %r19
	.word 0xaa11aa94  ! 30: OR_I	or 	%r6, 0x0a94, %r21
	.word 0x9e090005  ! 30: AND_R	and 	%r4, %r5, %r15
	.word 0xb4110005  ! 30: OR_R	or 	%r4, %r5, %r26
	.word 0xb200c005  ! 30: ADD_R	add 	%r3, %r5, %r25
	.word 0xa4110005  ! 30: OR_R	or 	%r4, %r5, %r18
	.word 0x9e10ecbe  ! 30: OR_I	or 	%r3, 0x0cbe, %r15
	.word 0xb011aab0  ! 30: OR_I	or 	%r6, 0x0ab0, %r24
	.word 0xb601ecd7  ! 30: ADD_I	add 	%r7, 0x0cd7, %r27
	.word 0xbe008005  ! 30: ADD_R	add 	%r2, %r5, %r31
	.word 0xb010c005  ! 30: OR_R	or 	%r3, %r5, %r24
	.word 0xb608a20c  ! 30: AND_I	and 	%r2, 0x020c, %r27
	.word 0xbe11e058  ! 30: OR_I	or 	%r7, 0x0058, %r31
	.word 0xac108005  ! 30: OR_R	or 	%r2, %r5, %r22
	.word 0xa410a69c  ! 30: OR_I	or 	%r2, 0x069c, %r18
	.word 0xb6108005  ! 30: OR_R	or 	%r2, %r5, %r27
	.word 0x9c08e8f9  ! 30: AND_I	and 	%r3, 0x08f9, %r14
	.word 0xae09c005  ! 30: AND_R	and 	%r7, %r5, %r23
	.word 0x9a08a29d  ! 30: AND_I	and 	%r2, 0x029d, %r13
	.word 0xae110005  ! 30: OR_R	or 	%r4, %r5, %r23
	.word 0xa810a6c2  ! 30: OR_I	or 	%r2, 0x06c2, %r20
	.word 0xb0008005  ! 30: ADD_R	add 	%r2, %r5, %r24
	.word 0x9a00a282  ! 30: ADD_I	add 	%r2, 0x0282, %r13
	.word 0xae11ee77  ! 30: OR_I	or 	%r7, 0x0e77, %r23
	.word 0xbc108005  ! 30: OR_R	or 	%r2, %r5, %r30
	.word 0x9c08a2cb  ! 30: AND_I	and 	%r2, 0x02cb, %r14
	.word 0xaa11a0bf  ! 30: OR_I	or 	%r6, 0x00bf, %r21
	.word 0xaa10ea0f  ! 30: OR_I	or 	%r3, 0x0a0f, %r21
	.word 0xbc110005  ! 30: OR_R	or 	%r4, %r5, %r30
	.word 0xa609c005  ! 30: AND_R	and 	%r7, %r5, %r19
	.word 0x9e00aa36  ! 30: ADD_I	add 	%r2, 0x0a36, %r15
	.word 0x9c08e89d  ! 30: AND_I	and 	%r3, 0x089d, %r14
	.word 0xa000c005  ! 30: ADD_R	add 	%r3, %r5, %r16
	.word 0xac088005  ! 30: AND_R	and 	%r2, %r5, %r22
	.word 0xbc10c005  ! 30: OR_R	or 	%r3, %r5, %r30
	.word 0xba10c005  ! 30: OR_R	or 	%r3, %r5, %r29
	.word 0xbe00ac8b  ! 30: ADD_I	add 	%r2, 0x0c8b, %r31
	.word 0x9a10aabc  ! 30: OR_I	or 	%r2, 0x0abc, %r13
	.word 0xa4110005  ! 30: OR_R	or 	%r4, %r5, %r18
	.word 0xb400adda  ! 30: ADD_I	add 	%r2, 0x0dda, %r26
	.word 0xa0008005  ! 30: ADD_R	add 	%r2, %r5, %r16
	.word 0xa20127b4  ! 30: ADD_I	add 	%r4, 0x07b4, %r17
	.word 0xba11c005  ! 30: OR_R	or 	%r7, %r5, %r29
	.word 0xaa008005  ! 30: ADD_R	add 	%r2, %r5, %r21
	.word 0xac010005  ! 30: ADD_R	add 	%r4, %r5, %r22
	.word 0xa4108005  ! 30: OR_R	or 	%r2, %r5, %r18
	.word 0x9c00a2bf  ! 30: ADD_I	add 	%r2, 0x02bf, %r14
	.word 0xa4088005  ! 30: AND_R	and 	%r2, %r5, %r18
	.word 0xae092d18  ! 30: AND_I	and 	%r4, 0x0d18, %r23
	.word 0xbc01e7d8  ! 30: ADD_I	add 	%r7, 0x07d8, %r30
	.word 0x9a10eb50  ! 30: OR_I	or 	%r3, 0x0b50, %r13
	.word 0xa8108005  ! 30: OR_R	or 	%r2, %r5, %r20
	.word 0x9e11a5de  ! 30: OR_I	or 	%r6, 0x05de, %r15
	.word 0xaa088005  ! 30: AND_R	and 	%r2, %r5, %r21
	.word 0xa6088005  ! 30: AND_R	and 	%r2, %r5, %r19
	.word 0xbc110005  ! 30: OR_R	or 	%r4, %r5, %r30
	.word 0xbc108005  ! 30: OR_R	or 	%r2, %r5, %r30
	.word 0xa2092376  ! 30: AND_I	and 	%r4, 0x0376, %r17
	.word 0x9c1122c6  ! 30: OR_I	or 	%r4, 0x02c6, %r14
	.word 0xb6010005  ! 30: ADD_R	add 	%r4, %r5, %r27
	.word 0xbe1122fe  ! 30: OR_I	or 	%r4, 0x02fe, %r31
	.word 0xa0090005  ! 30: AND_R	and 	%r4, %r5, %r16
	.word 0x9e01ab16  ! 30: ADD_I	add 	%r6, 0x0b16, %r15
	.word 0xbe088005  ! 30: AND_R	and 	%r2, %r5, %r31
	.word 0x9e118005  ! 30: OR_R	or 	%r6, %r5, %r15
	.word 0x9a108005  ! 30: OR_R	or 	%r2, %r5, %r13
	.word 0xb6088005  ! 30: AND_R	and 	%r2, %r5, %r27
	.word 0xaa090005  ! 30: AND_R	and 	%r4, %r5, %r21
	.word 0xb400ee93  ! 30: ADD_I	add 	%r3, 0x0e93, %r26
	.word 0xb608a671  ! 30: AND_I	and 	%r2, 0x0671, %r27
	.word 0xaa00eeb4  ! 30: ADD_I	add 	%r3, 0x0eb4, %r21
	.word 0xb6008005  ! 30: ADD_R	add 	%r2, %r5, %r27
	.word 0x9c09ad68  ! 30: AND_I	and 	%r6, 0x0d68, %r14
	.word 0xbc10ab9a  ! 30: OR_I	or 	%r2, 0x0b9a, %r30
	.word 0xac08a5b8  ! 30: AND_I	and 	%r2, 0x05b8, %r22
	.word 0xbc09c005  ! 30: AND_R	and 	%r7, %r5, %r30
	.word 0xb0108005  ! 30: OR_R	or 	%r2, %r5, %r24
	.word 0x9e00a72a  ! 30: ADD_I	add 	%r2, 0x072a, %r15
	.word 0x9e108005  ! 30: OR_R	or 	%r2, %r5, %r15
	.word 0xba08e324  ! 30: AND_I	and 	%r3, 0x0324, %r29
	.word 0xb810a0b5  ! 30: OR_I	or 	%r2, 0x00b5, %r28
	.word 0xb0108005  ! 30: OR_R	or 	%r2, %r5, %r24
	.word 0xa011adfb  ! 30: OR_I	or 	%r6, 0x0dfb, %r16
	.word 0xb4108005  ! 30: OR_R	or 	%r2, %r5, %r26
	.word 0xb0098005  ! 30: AND_R	and 	%r6, %r5, %r24
	.word 0xb408aace  ! 30: AND_I	and 	%r2, 0x0ace, %r26
	.word 0xb411ab61  ! 30: OR_I	or 	%r6, 0x0b61, %r26
	.word 0xa810ae16  ! 30: OR_I	or 	%r2, 0x0e16, %r20
	.word 0xb808a9f3  ! 30: AND_I	and 	%r2, 0x09f3, %r28
	.word 0xac10afc9  ! 30: OR_I	or 	%r2, 0x0fc9, %r22
	.word 0x9e10e717  ! 30: OR_I	or 	%r3, 0x0717, %r15
	.word 0xaa108005  ! 30: OR_R	or 	%r2, %r5, %r21
	.word 0x9e11efe5  ! 30: OR_I	or 	%r7, 0x0fe5, %r15
	.word 0x9e11a8df  ! 30: OR_I	or 	%r6, 0x08df, %r15
	.word 0xb810c005  ! 30: OR_R	or 	%r3, %r5, %r28
	.word 0xa6098005  ! 30: AND_R	and 	%r6, %r5, %r19
	.word 0xa2012d4a  ! 30: ADD_I	add 	%r4, 0x0d4a, %r17
	.word 0xb0098005  ! 30: AND_R	and 	%r6, %r5, %r24
	.word 0xae108005  ! 30: OR_R	or 	%r2, %r5, %r23
	.word 0xa601ec7a  ! 30: ADD_I	add 	%r7, 0x0c7a, %r19
	.word 0xa4118005  ! 30: OR_R	or 	%r6, %r5, %r18
	.word 0xa408a07e  ! 30: AND_I	and 	%r2, 0x007e, %r18
	.word 0xb600a512  ! 30: ADD_I	add 	%r2, 0x0512, %r27
	.word 0xa8112a34  ! 30: OR_I	or 	%r4, 0x0a34, %r20
	.word 0x9e01c005  ! 30: ADD_R	add 	%r7, %r5, %r15
	.word 0xa808af9f  ! 30: AND_I	and 	%r2, 0x0f9f, %r20
	.word 0xb600c005  ! 30: ADD_R	add 	%r3, %r5, %r27
	.word 0xbe00c005  ! 30: ADD_R	add 	%r3, %r5, %r31
	.word 0xb201e866  ! 30: ADD_I	add 	%r7, 0x0866, %r25
	.word 0xb400ab3c  ! 30: ADD_I	add 	%r2, 0x0b3c, %r26
	.word 0xea20a5b0  ! 30: STW_I	stw	%r21, [%r2 + 0x05b0]
	.word 0xfa7121a8  ! 30: STX_I	stx	%r29, [%r4 + 0x01a8]
	.word 0xe021e9a4  ! 30: STW_I	stw	%r16, [%r7 + 0x09a4]
	.word 0xf671a078  ! 30: STX_I	stx	%r27, [%r6 + 0x0078]
IRF_CE_14:
!$EV error(2,expr(@VA(.MAIN.IRF_CE_14), 16, 16), 1,IRF,ce,68,x, x,x,x, x,x,x)
!$EV error(2,expr(@VA(.MAIN.IRF_CE_14), 16, 16), 3,IRF,ce,24,x, x,x,x, x,x,x)
	.word 0xf621a31c  ! 30: STW_I	stw	%r27, [%r6 + 0x031c]
	.word 0xf4312f60  ! 30: STH_I	sth	%r26, [%r4 + 0x0f60]
	.word 0xfe30ac20  ! 30: STH_I	sth	%r31, [%r2 + 0x0c20]
	.word 0xfee8d005  ! 30: LDSTUBA_R	ldstuba	%r31, [%r3 + %r5] 0x80
	.word 0xb409e947  ! 30: AND_I	and 	%r7, 0x0947, %r26
	.word 0xb0108005  ! 30: OR_R	or 	%r2, %r5, %r24
	bne thr2_loop_3
	subcc %g1, 0x1, %g1
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr2_loop_4:
	.word 0xa008e59a  ! 37: AND_I	and 	%r3, 0x059a, %r16
	.word 0xa200e076  ! 37: ADD_I	add 	%r3, 0x0076, %r17
	.word 0xa810c005  ! 37: OR_R	or 	%r3, %r5, %r20
	.word 0xa6008005  ! 37: ADD_R	add 	%r2, %r5, %r19
	.word 0xa808a271  ! 37: AND_I	and 	%r2, 0x0271, %r20
	.word 0xac108005  ! 37: OR_R	or 	%r2, %r5, %r22
	.word 0xb008e037  ! 37: AND_I	and 	%r3, 0x0037, %r24
	.word 0xb6108005  ! 37: OR_R	or 	%r2, %r5, %r27
	.word 0xa608a577  ! 37: AND_I	and 	%r2, 0x0577, %r19
	.word 0xba11ad64  ! 37: OR_I	or 	%r6, 0x0d64, %r29
	.word 0xb4110005  ! 37: OR_R	or 	%r4, %r5, %r26
	.word 0xb008a0e6  ! 37: AND_I	and 	%r2, 0x00e6, %r24
	.word 0xae112245  ! 37: OR_I	or 	%r4, 0x0245, %r23
	.word 0xac09c005  ! 37: AND_R	and 	%r7, %r5, %r22
	.word 0xba110005  ! 37: OR_R	or 	%r4, %r5, %r29
	.word 0xba10e44a  ! 37: OR_I	or 	%r3, 0x044a, %r29
	.word 0x9a10a2c2  ! 37: OR_I	or 	%r2, 0x02c2, %r13
	.word 0xbc010005  ! 37: ADD_R	add 	%r4, %r5, %r30
	.word 0xb609ef02  ! 37: AND_I	and 	%r7, 0x0f02, %r27
	.word 0x9c00c005  ! 37: ADD_R	add 	%r3, %r5, %r14
	.word 0xb809a793  ! 37: AND_I	and 	%r6, 0x0793, %r28
	.word 0x9a10c005  ! 37: OR_R	or 	%r3, %r5, %r13
	.word 0xb810c005  ! 37: OR_R	or 	%r3, %r5, %r28
	.word 0xa809a1ed  ! 37: AND_I	and 	%r6, 0x01ed, %r20
	.word 0xb410e478  ! 37: OR_I	or 	%r3, 0x0478, %r26
	.word 0x9c00acd0  ! 37: ADD_I	add 	%r2, 0x0cd0, %r14
	.word 0x9e110005  ! 37: OR_R	or 	%r4, %r5, %r15
	.word 0xb408ae8b  ! 37: AND_I	and 	%r2, 0x0e8b, %r26
	.word 0xb4008005  ! 37: ADD_R	add 	%r2, %r5, %r26
	.word 0xbc10ed34  ! 37: OR_I	or 	%r3, 0x0d34, %r30
	.word 0xb001a469  ! 37: ADD_I	add 	%r6, 0x0469, %r24
	.word 0xa4108005  ! 37: OR_R	or 	%r2, %r5, %r18
	.word 0xbe10ace4  ! 37: OR_I	or 	%r2, 0x0ce4, %r31
	.word 0xa2092147  ! 37: AND_I	and 	%r4, 0x0147, %r17
	.word 0xb011e80c  ! 37: OR_I	or 	%r7, 0x080c, %r24
	.word 0xae01206b  ! 37: ADD_I	add 	%r4, 0x006b, %r23
	.word 0xa2018005  ! 37: ADD_R	add 	%r6, %r5, %r17
	.word 0xb011a952  ! 37: OR_I	or 	%r6, 0x0952, %r24
	.word 0xb4018005  ! 37: ADD_R	add 	%r6, %r5, %r26
	.word 0xa0008005  ! 37: ADD_R	add 	%r2, %r5, %r16
	.word 0xb6088005  ! 37: AND_R	and 	%r2, %r5, %r27
	.word 0xb410a65f  ! 37: OR_I	or 	%r2, 0x065f, %r26
	.word 0xb209e611  ! 37: AND_I	and 	%r7, 0x0611, %r25
	.word 0xa009acd6  ! 37: AND_I	and 	%r6, 0x0cd6, %r16
	.word 0xa609ab9f  ! 37: AND_I	and 	%r6, 0x0b9f, %r19
	.word 0x9e012cbe  ! 37: ADD_I	add 	%r4, 0x0cbe, %r15
	.word 0xba01c005  ! 37: ADD_R	add 	%r7, %r5, %r29
	.word 0xaa10a9b0  ! 37: OR_I	or 	%r2, 0x09b0, %r21
	.word 0xac11e3f7  ! 37: OR_I	or 	%r7, 0x03f7, %r22
	.word 0xa601a8d3  ! 37: ADD_I	add 	%r6, 0x08d3, %r19
	.word 0xa810a815  ! 37: OR_I	or 	%r2, 0x0815, %r20
	.word 0x9c01c005  ! 37: ADD_R	add 	%r7, %r5, %r14
	.word 0xae09a34f  ! 37: AND_I	and 	%r6, 0x034f, %r23
	.word 0xbe09e56d  ! 37: AND_I	and 	%r7, 0x056d, %r31
	.word 0xbc11aecb  ! 37: OR_I	or 	%r6, 0x0ecb, %r30
	.word 0xb610e73c  ! 37: OR_I	or 	%r3, 0x073c, %r27
	.word 0xb4010005  ! 37: ADD_R	add 	%r4, %r5, %r26
	.word 0xb209c005  ! 37: AND_R	and 	%r7, %r5, %r25
	.word 0x9e00c005  ! 37: ADD_R	add 	%r3, %r5, %r15
	.word 0xb810c005  ! 37: OR_R	or 	%r3, %r5, %r28
	.word 0xaa09205f  ! 37: AND_I	and 	%r4, 0x005f, %r21
	.word 0xbe10a600  ! 37: OR_I	or 	%r2, 0x0600, %r31
	.word 0xbe11c005  ! 37: OR_R	or 	%r7, %r5, %r31
	.word 0xb610ab7c  ! 37: OR_I	or 	%r2, 0x0b7c, %r27
	.word 0xac098005  ! 37: AND_R	and 	%r6, %r5, %r22
	.word 0xac11a096  ! 37: OR_I	or 	%r6, 0x0096, %r22
	.word 0xa608c005  ! 37: AND_R	and 	%r3, %r5, %r19
	.word 0xae108005  ! 37: OR_R	or 	%r2, %r5, %r23
	.word 0xa211e389  ! 37: OR_I	or 	%r7, 0x0389, %r17
	.word 0xa2008005  ! 37: ADD_R	add 	%r2, %r5, %r17
	.word 0xaa108005  ! 37: OR_R	or 	%r2, %r5, %r21
	.word 0xb808ede6  ! 37: AND_I	and 	%r3, 0x0de6, %r28
	.word 0xae108005  ! 37: OR_R	or 	%r2, %r5, %r23
	.word 0xb0012897  ! 37: ADD_I	add 	%r4, 0x0897, %r24
	.word 0x9c01c005  ! 37: ADD_R	add 	%r7, %r5, %r14
	.word 0xa411c005  ! 37: OR_R	or 	%r7, %r5, %r18
	.word 0x9e092b2b  ! 37: AND_I	and 	%r4, 0x0b2b, %r15
	.word 0xa2092503  ! 37: AND_I	and 	%r4, 0x0503, %r17
	.word 0xbc112a17  ! 37: OR_I	or 	%r4, 0x0a17, %r30
	.word 0xaa018005  ! 37: ADD_R	add 	%r6, %r5, %r21
	.word 0x9a01ec54  ! 37: ADD_I	add 	%r7, 0x0c54, %r13
	.word 0xb211a57b  ! 37: OR_I	or 	%r6, 0x057b, %r25
	.word 0xa0092eee  ! 37: AND_I	and 	%r4, 0x0eee, %r16
	.word 0x9a012419  ! 37: ADD_I	add 	%r4, 0x0419, %r13
	.word 0xa208c005  ! 37: AND_R	and 	%r3, %r5, %r17
	.word 0x9c09a962  ! 37: AND_I	and 	%r6, 0x0962, %r14
	.word 0x9c008005  ! 37: ADD_R	add 	%r2, %r5, %r14
	.word 0xaa088005  ! 37: AND_R	and 	%r2, %r5, %r21
	.word 0xb000a0fd  ! 37: ADD_I	add 	%r2, 0x00fd, %r24
	.word 0xa2098005  ! 37: AND_R	and 	%r6, %r5, %r17
	.word 0xb211c005  ! 37: OR_R	or 	%r7, %r5, %r25
	.word 0xbe11a968  ! 37: OR_I	or 	%r6, 0x0968, %r31
	.word 0xb208acd5  ! 37: AND_I	and 	%r2, 0x0cd5, %r25
	.word 0x9a09acb2  ! 37: AND_I	and 	%r6, 0x0cb2, %r13
	.word 0x9c008005  ! 37: ADD_R	add 	%r2, %r5, %r14
	.word 0x9e11e94b  ! 37: OR_I	or 	%r7, 0x094b, %r15
	.word 0xa20928d0  ! 37: AND_I	and 	%r4, 0x08d0, %r17
	.word 0xb8088005  ! 37: AND_R	and 	%r2, %r5, %r28
	.word 0xae08a2f6  ! 37: AND_I	and 	%r2, 0x02f6, %r23
	.word 0xb4008005  ! 37: ADD_R	add 	%r2, %r5, %r26
	.word 0xac01c005  ! 37: ADD_R	add 	%r7, %r5, %r22
	.word 0xae018005  ! 37: ADD_R	add 	%r6, %r5, %r23
	.word 0xa808e969  ! 37: AND_I	and 	%r3, 0x0969, %r20
	.word 0xac00add2  ! 37: ADD_I	add 	%r2, 0x0dd2, %r22
	.word 0xa0008005  ! 37: ADD_R	add 	%r2, %r5, %r16
	.word 0xac08a3d0  ! 37: AND_I	and 	%r2, 0x03d0, %r22
	.word 0x9e11ed20  ! 37: OR_I	or 	%r7, 0x0d20, %r15
	.word 0xb800a4d5  ! 37: ADD_I	add 	%r2, 0x04d5, %r28
	.word 0xa200a739  ! 37: ADD_I	add 	%r2, 0x0739, %r17
	.word 0xbc088005  ! 37: AND_R	and 	%r2, %r5, %r30
	.word 0xbe110005  ! 37: OR_R	or 	%r4, %r5, %r31
	.word 0xa208ae43  ! 37: AND_I	and 	%r2, 0x0e43, %r17
	.word 0x9e098005  ! 37: AND_R	and 	%r6, %r5, %r15
	.word 0x9a088005  ! 37: AND_R	and 	%r2, %r5, %r13
	.word 0xb211ee60  ! 37: OR_I	or 	%r7, 0x0e60, %r25
	.word 0xbe008005  ! 37: ADD_R	add 	%r2, %r5, %r31
	.word 0xac090005  ! 37: AND_R	and 	%r4, %r5, %r22
	.word 0xb410ee64  ! 37: OR_I	or 	%r3, 0x0e64, %r26
	.word 0xa0018005  ! 37: ADD_R	add 	%r6, %r5, %r16
	.word 0xa4008005  ! 37: ADD_R	add 	%r2, %r5, %r18
	.word 0xa011231d  ! 37: OR_I	or 	%r4, 0x031d, %r16
	.word 0x9a08a177  ! 37: AND_I	and 	%r2, 0x0177, %r13
	.word 0xbc01e3ff  ! 37: ADD_I	add 	%r7, 0x03ff, %r30
	.word 0xba11e728  ! 37: OR_I	or 	%r7, 0x0728, %r29
	.word 0xa209e654  ! 37: AND_I	and 	%r7, 0x0654, %r17
	.word 0xbe10c005  ! 37: OR_R	or 	%r3, %r5, %r31
	.word 0xb600e7cf  ! 37: ADD_I	add 	%r3, 0x07cf, %r27
	.word 0xbc00a9bd  ! 37: ADD_I	add 	%r2, 0x09bd, %r30
	.word 0xae08a564  ! 37: AND_I	and 	%r2, 0x0564, %r23
	.word 0x9a01a5dc  ! 37: ADD_I	add 	%r6, 0x05dc, %r13
	.word 0xb4088005  ! 37: AND_R	and 	%r2, %r5, %r26
	.word 0x9e09a3d2  ! 37: AND_I	and 	%r6, 0x03d2, %r15
	.word 0xa8098005  ! 37: AND_R	and 	%r6, %r5, %r20
	.word 0xa600c005  ! 37: ADD_R	add 	%r3, %r5, %r19
	.word 0xa211e124  ! 37: OR_I	or 	%r7, 0x0124, %r17
	.word 0xa4118005  ! 37: OR_R	or 	%r6, %r5, %r18
	.word 0xf821a9c0  ! 37: STW_I	stw	%r28, [%r6 + 0x09c0]
	.word 0xf2212548  ! 37: STW_I	stw	%r25, [%r4 + 0x0548]
	.word 0xe031ec0a  ! 37: STH_I	sth	%r16, [%r7 + 0x0c0a]
	.word 0xea712890  ! 37: STX_I	stx	%r21, [%r4 + 0x0890]
IRF_CE_18:
!$EV error(2,expr(@VA(.MAIN.IRF_CE_18), 16, 16), 1,IRF,ce,56,x, x,x,x, x,x,x)
!$EV error(2,expr(@VA(.MAIN.IRF_CE_18), 16, 16), 3,IRF,ce,49,x, x,x,x, x,x,x)
	.word 0xfa71a380  ! 37: STX_I	stx	%r29, [%r6 + 0x0380]
	.word 0xf071ab38  ! 37: STX_I	stx	%r24, [%r6 + 0x0b38]
	.word 0xde7121e8  ! 37: STX_I	stx	%r15, [%r4 + 0x01e8]
	.word 0xec20a2f0  ! 37: STW_I	stw	%r22, [%r2 + 0x02f0]
	.word 0xae10a570  ! 37: OR_I	or 	%r2, 0x0570, %r23
	.word 0xa6088005  ! 37: AND_R	and 	%r2, %r5, %r19
	bne thr2_loop_4
	subcc %g1, 0x1, %g1
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr2_loop_5:
	.word 0xbc10e8c5  ! 44: OR_I	or 	%r3, 0x08c5, %r30
	.word 0x9a098005  ! 44: AND_R	and 	%r6, %r5, %r13
	.word 0xb2018005  ! 44: ADD_R	add 	%r6, %r5, %r25
	.word 0xac012451  ! 44: ADD_I	add 	%r4, 0x0451, %r22
	.word 0xbc018005  ! 44: ADD_R	add 	%r6, %r5, %r30
	.word 0xbc08adb2  ! 44: AND_I	and 	%r2, 0x0db2, %r30
	.word 0xa0108005  ! 44: OR_R	or 	%r2, %r5, %r16
	.word 0xbc09e7fe  ! 44: AND_I	and 	%r7, 0x07fe, %r30
	.word 0xa8008005  ! 44: ADD_R	add 	%r2, %r5, %r20
	.word 0xba08afe7  ! 44: AND_I	and 	%r2, 0x0fe7, %r29
	.word 0xa6008005  ! 44: ADD_R	add 	%r2, %r5, %r19
	.word 0xaa09c005  ! 44: AND_R	and 	%r7, %r5, %r21
	.word 0x9e012f4c  ! 44: ADD_I	add 	%r4, 0x0f4c, %r15
	.word 0x9e008005  ! 44: ADD_R	add 	%r2, %r5, %r15
	.word 0xae088005  ! 44: AND_R	and 	%r2, %r5, %r23
	.word 0xb801c005  ! 44: ADD_R	add 	%r7, %r5, %r28
	.word 0xb608a70a  ! 44: AND_I	and 	%r2, 0x070a, %r27
	.word 0xb200e31f  ! 44: ADD_I	add 	%r3, 0x031f, %r25
	.word 0x9c01a9f1  ! 44: ADD_I	add 	%r6, 0x09f1, %r14
	.word 0xa6108005  ! 44: OR_R	or 	%r2, %r5, %r19
	.word 0xbe01ab9a  ! 44: ADD_I	add 	%r6, 0x0b9a, %r31
	.word 0xaa00e166  ! 44: ADD_I	add 	%r3, 0x0166, %r21
	.word 0xbc108005  ! 44: OR_R	or 	%r2, %r5, %r30
	.word 0xae10a07b  ! 44: OR_I	or 	%r2, 0x007b, %r23
	.word 0xae09ec5c  ! 44: AND_I	and 	%r7, 0x0c5c, %r23
	.word 0x9c088005  ! 44: AND_R	and 	%r2, %r5, %r14
	.word 0xb6110005  ! 44: OR_R	or 	%r4, %r5, %r27
	.word 0xa2090005  ! 44: AND_R	and 	%r4, %r5, %r17
	.word 0xa0108005  ! 44: OR_R	or 	%r2, %r5, %r16
	.word 0x9c01a1f1  ! 44: ADD_I	add 	%r6, 0x01f1, %r14
	.word 0xba010005  ! 44: ADD_R	add 	%r4, %r5, %r29
	.word 0xbe110005  ! 44: OR_R	or 	%r4, %r5, %r31
	.word 0xac10e0d4  ! 44: OR_I	or 	%r3, 0x00d4, %r22
	.word 0xa408a90c  ! 44: AND_I	and 	%r2, 0x090c, %r18
	.word 0x9e088005  ! 44: AND_R	and 	%r2, %r5, %r15
	.word 0xae098005  ! 44: AND_R	and 	%r6, %r5, %r23
	.word 0x9e018005  ! 44: ADD_R	add 	%r6, %r5, %r15
	.word 0xa209e4ef  ! 44: AND_I	and 	%r7, 0x04ef, %r17
	.word 0x9a00e7ad  ! 44: ADD_I	add 	%r3, 0x07ad, %r13
	.word 0x9e110005  ! 44: OR_R	or 	%r4, %r5, %r15
	.word 0xa208a2a6  ! 44: AND_I	and 	%r2, 0x02a6, %r17
	.word 0xb000a71a  ! 44: ADD_I	add 	%r2, 0x071a, %r24
	.word 0xa808af55  ! 44: AND_I	and 	%r2, 0x0f55, %r20
	.word 0xb201a6e1  ! 44: ADD_I	add 	%r6, 0x06e1, %r25
	.word 0xac00c005  ! 44: ADD_R	add 	%r3, %r5, %r22
	.word 0x9c08adf2  ! 44: AND_I	and 	%r2, 0x0df2, %r14
	.word 0xbe10a49e  ! 44: OR_I	or 	%r2, 0x049e, %r31
	.word 0xa811a55c  ! 44: OR_I	or 	%r6, 0x055c, %r20
	.word 0xae008005  ! 44: ADD_R	add 	%r2, %r5, %r23
	.word 0xb8010005  ! 44: ADD_R	add 	%r4, %r5, %r28
	.word 0xa6110005  ! 44: OR_R	or 	%r4, %r5, %r19
	.word 0xa401c005  ! 44: ADD_R	add 	%r7, %r5, %r18
	.word 0xa410aeab  ! 44: OR_I	or 	%r2, 0x0eab, %r18
	.word 0xb810ec42  ! 44: OR_I	or 	%r3, 0x0c42, %r28
	.word 0xa408a81a  ! 44: AND_I	and 	%r2, 0x081a, %r18
	.word 0xb811a74e  ! 44: OR_I	or 	%r6, 0x074e, %r28
	.word 0xbc11ae50  ! 44: OR_I	or 	%r6, 0x0e50, %r30
	.word 0xb8090005  ! 44: AND_R	and 	%r4, %r5, %r28
	.word 0x9c10c005  ! 44: OR_R	or 	%r3, %r5, %r14
	.word 0x9c108005  ! 44: OR_R	or 	%r2, %r5, %r14
	.word 0xb0008005  ! 44: ADD_R	add 	%r2, %r5, %r24
	.word 0xa6118005  ! 44: OR_R	or 	%r6, %r5, %r19
	.word 0xb610c005  ! 44: OR_R	or 	%r3, %r5, %r27
	.word 0x9c10e57c  ! 44: OR_I	or 	%r3, 0x057c, %r14
	.word 0xba10aad3  ! 44: OR_I	or 	%r2, 0x0ad3, %r29
	.word 0xb6118005  ! 44: OR_R	or 	%r6, %r5, %r27
	.word 0xb809e523  ! 44: AND_I	and 	%r7, 0x0523, %r28
	.word 0x9e10aff9  ! 44: OR_I	or 	%r2, 0x0ff9, %r15
	.word 0xaa018005  ! 44: ADD_R	add 	%r6, %r5, %r21
	.word 0xa4012dea  ! 44: ADD_I	add 	%r4, 0x0dea, %r18
	.word 0xb4092c00  ! 44: AND_I	and 	%r4, 0x0c00, %r26
	.word 0xa2108005  ! 44: OR_R	or 	%r2, %r5, %r17
	.word 0xa800e3df  ! 44: ADD_I	add 	%r3, 0x03df, %r20
	.word 0xbe11ab6f  ! 44: OR_I	or 	%r6, 0x0b6f, %r31
	.word 0xa008e94d  ! 44: AND_I	and 	%r3, 0x094d, %r16
	.word 0x9e00abae  ! 44: ADD_I	add 	%r2, 0x0bae, %r15
	.word 0xa0088005  ! 44: AND_R	and 	%r2, %r5, %r16
	.word 0x9a01c005  ! 44: ADD_R	add 	%r7, %r5, %r13
	.word 0x9e01e72c  ! 44: ADD_I	add 	%r7, 0x072c, %r15
	.word 0xb608c005  ! 44: AND_R	and 	%r3, %r5, %r27
	.word 0xae008005  ! 44: ADD_R	add 	%r2, %r5, %r23
	.word 0xa009c005  ! 44: AND_R	and 	%r7, %r5, %r16
	.word 0xba00a1d0  ! 44: ADD_I	add 	%r2, 0x01d0, %r29
	.word 0xb610a0bd  ! 44: OR_I	or 	%r2, 0x00bd, %r27
	.word 0xa4012ebe  ! 44: ADD_I	add 	%r4, 0x0ebe, %r18
	.word 0xa6108005  ! 44: OR_R	or 	%r2, %r5, %r19
	.word 0xaa08a4da  ! 44: AND_I	and 	%r2, 0x04da, %r21
	.word 0x9e08efbc  ! 44: AND_I	and 	%r3, 0x0fbc, %r15
	.word 0xb6090005  ! 44: AND_R	and 	%r4, %r5, %r27
	.word 0xb2010005  ! 44: ADD_R	add 	%r4, %r5, %r25
	.word 0xa4092cf3  ! 44: AND_I	and 	%r4, 0x0cf3, %r18
	.word 0xbe00e422  ! 44: ADD_I	add 	%r3, 0x0422, %r31
	.word 0xa400c005  ! 44: ADD_R	add 	%r3, %r5, %r18
	.word 0xb8008005  ! 44: ADD_R	add 	%r2, %r5, %r28
	.word 0x9c08ef9c  ! 44: AND_I	and 	%r3, 0x0f9c, %r14
	.word 0xb4112dc8  ! 44: OR_I	or 	%r4, 0x0dc8, %r26
	.word 0xae09e09f  ! 44: AND_I	and 	%r7, 0x009f, %r23
	.word 0xb009c005  ! 44: AND_R	and 	%r7, %r5, %r24
	.word 0xb601e039  ! 44: ADD_I	add 	%r7, 0x0039, %r27
	.word 0xa0008005  ! 44: ADD_R	add 	%r2, %r5, %r16
	.word 0xaa108005  ! 44: OR_R	or 	%r2, %r5, %r21
	.word 0xa800a9c5  ! 44: ADD_I	add 	%r2, 0x09c5, %r20
	.word 0x9c10c005  ! 44: OR_R	or 	%r3, %r5, %r14
	.word 0x9e010005  ! 44: ADD_R	add 	%r4, %r5, %r15
	.word 0xaa09a611  ! 44: AND_I	and 	%r6, 0x0611, %r21
	.word 0x9c11e5a2  ! 44: OR_I	or 	%r7, 0x05a2, %r14
	.word 0xbe010005  ! 44: ADD_R	add 	%r4, %r5, %r31
	.word 0xa4008005  ! 44: ADD_R	add 	%r2, %r5, %r18
	.word 0xa2008005  ! 44: ADD_R	add 	%r2, %r5, %r17
	.word 0xb811ad1b  ! 44: OR_I	or 	%r6, 0x0d1b, %r28
	.word 0xaa09e9d1  ! 44: AND_I	and 	%r7, 0x09d1, %r21
	.word 0xaa00e374  ! 44: ADD_I	add 	%r3, 0x0374, %r21
	.word 0xb211e1c7  ! 44: OR_I	or 	%r7, 0x01c7, %r25
	.word 0x9e09a0f8  ! 44: AND_I	and 	%r6, 0x00f8, %r15
	.word 0xbe088005  ! 44: AND_R	and 	%r2, %r5, %r31
	.word 0xbc118005  ! 44: OR_R	or 	%r6, %r5, %r30
	.word 0xa400c005  ! 44: ADD_R	add 	%r3, %r5, %r18
	.word 0xa0110005  ! 44: OR_R	or 	%r4, %r5, %r16
	.word 0xb811e937  ! 44: OR_I	or 	%r7, 0x0937, %r28
	.word 0xa808a30b  ! 44: AND_I	and 	%r2, 0x030b, %r20
	.word 0xaa08ab91  ! 44: AND_I	and 	%r2, 0x0b91, %r21
	.word 0xa8088005  ! 44: AND_R	and 	%r2, %r5, %r20
	.word 0xa401efe3  ! 44: ADD_I	add 	%r7, 0x0fe3, %r18
	.word 0xbe088005  ! 44: AND_R	and 	%r2, %r5, %r31
	.word 0xa4088005  ! 44: AND_R	and 	%r2, %r5, %r18
	.word 0xa610aeac  ! 44: OR_I	or 	%r2, 0x0eac, %r19
	.word 0xaa112787  ! 44: OR_I	or 	%r4, 0x0787, %r21
	.word 0xb411eb63  ! 44: OR_I	or 	%r7, 0x0b63, %r26
	.word 0x9a008005  ! 44: ADD_R	add 	%r2, %r5, %r13
	.word 0x9a090005  ! 44: AND_R	and 	%r4, %r5, %r13
	.word 0xa408a896  ! 44: AND_I	and 	%r2, 0x0896, %r18
	.word 0xa600ef2d  ! 44: ADD_I	add 	%r3, 0x0f2d, %r19
	.word 0xa2092f1e  ! 44: AND_I	and 	%r4, 0x0f1e, %r17
	.word 0xbe092f20  ! 44: AND_I	and 	%r4, 0x0f20, %r31
	.word 0xb4012609  ! 44: ADD_I	add 	%r4, 0x0609, %r26
	.word 0xb0090005  ! 44: AND_R	and 	%r4, %r5, %r24
	.word 0xa008c005  ! 44: AND_R	and 	%r3, %r5, %r16
	.word 0xa0008005  ! 44: ADD_R	add 	%r2, %r5, %r16
	.word 0xaa08c005  ! 44: AND_R	and 	%r3, %r5, %r21
	.word 0xba09eb2b  ! 44: AND_I	and 	%r7, 0x0b2b, %r29
	.word 0x9e11a14a  ! 44: OR_I	or 	%r6, 0x014a, %r15
	.word 0xa0112392  ! 44: OR_I	or 	%r4, 0x0392, %r16
	.word 0xaa01a34d  ! 44: ADD_I	add 	%r6, 0x034d, %r21
	.word 0xb008c005  ! 44: AND_R	and 	%r3, %r5, %r24
	.word 0xb8098005  ! 44: AND_R	and 	%r6, %r5, %r28
	.word 0xa6118005  ! 44: OR_R	or 	%r6, %r5, %r19
	.word 0xb411a281  ! 44: OR_I	or 	%r6, 0x0281, %r26
	.word 0x9c088005  ! 44: AND_R	and 	%r2, %r5, %r14
	.word 0xac11e6b4  ! 44: OR_I	or 	%r7, 0x06b4, %r22
	.word 0x9e09ac1c  ! 44: AND_I	and 	%r6, 0x0c1c, %r15
	.word 0xa810c005  ! 44: OR_R	or 	%r3, %r5, %r20
	.word 0xa60929a0  ! 44: AND_I	and 	%r4, 0x09a0, %r19
	.word 0xb401ab78  ! 44: ADD_I	add 	%r6, 0x0b78, %r26
	.word 0xbc08ec2b  ! 44: AND_I	and 	%r3, 0x0c2b, %r30
	.word 0xae00e035  ! 44: ADD_I	add 	%r3, 0x0035, %r23
	.word 0xa608aec8  ! 44: AND_I	and 	%r2, 0x0ec8, %r19
	.word 0xb409c005  ! 44: AND_R	and 	%r7, %r5, %r26
	.word 0xb801e8af  ! 44: ADD_I	add 	%r7, 0x08af, %r28
	.word 0xa010a570  ! 44: OR_I	or 	%r2, 0x0570, %r16
	.word 0xa8012374  ! 44: ADD_I	add 	%r4, 0x0374, %r20
	.word 0x9c088005  ! 44: AND_R	and 	%r2, %r5, %r14
	.word 0xbc010005  ! 44: ADD_R	add 	%r4, %r5, %r30
	.word 0xa601c005  ! 44: ADD_R	add 	%r7, %r5, %r19
	.word 0xba11e856  ! 44: OR_I	or 	%r7, 0x0856, %r29
	.word 0x9a09c005  ! 44: AND_R	and 	%r7, %r5, %r13
	.word 0xaa010005  ! 44: ADD_R	add 	%r4, %r5, %r21
	.word 0xbc00c005  ! 44: ADD_R	add 	%r3, %r5, %r30
	.word 0xaa108005  ! 44: OR_R	or 	%r2, %r5, %r21
	.word 0xbc088005  ! 44: AND_R	and 	%r2, %r5, %r30
	.word 0xb4118005  ! 44: OR_R	or 	%r6, %r5, %r26
	.word 0xa8118005  ! 44: OR_R	or 	%r6, %r5, %r20
	.word 0xb810e935  ! 44: OR_I	or 	%r3, 0x0935, %r28
	.word 0xb800a4b9  ! 44: ADD_I	add 	%r2, 0x04b9, %r28
	.word 0xbe10c005  ! 44: OR_R	or 	%r3, %r5, %r31
	.word 0x9c10a5e7  ! 44: OR_I	or 	%r2, 0x05e7, %r14
	.word 0xa201a7ef  ! 44: ADD_I	add 	%r6, 0x07ef, %r17
	.word 0xb801c005  ! 44: ADD_R	add 	%r7, %r5, %r28
	.word 0xb610c005  ! 44: OR_R	or 	%r3, %r5, %r27
	.word 0xb6012936  ! 44: ADD_I	add 	%r4, 0x0936, %r27
	.word 0xba11c005  ! 44: OR_R	or 	%r7, %r5, %r29
	.word 0x9c09afb5  ! 44: AND_I	and 	%r6, 0x0fb5, %r14
	.word 0xb809adab  ! 44: AND_I	and 	%r6, 0x0dab, %r28
	.word 0xba11c005  ! 44: OR_R	or 	%r7, %r5, %r29
	.word 0xb408a43b  ! 44: AND_I	and 	%r2, 0x043b, %r26
	.word 0xae01c005  ! 44: ADD_R	add 	%r7, %r5, %r23
	.word 0xa6112c7f  ! 44: OR_I	or 	%r4, 0x0c7f, %r19
	.word 0xa4092dd2  ! 44: AND_I	and 	%r4, 0x0dd2, %r18
	.word 0xa209c005  ! 44: AND_R	and 	%r7, %r5, %r17
	.word 0xa4108005  ! 44: OR_R	or 	%r2, %r5, %r18
	.word 0xba108005  ! 44: OR_R	or 	%r2, %r5, %r29
	.word 0xae088005  ! 44: AND_R	and 	%r2, %r5, %r23
	.word 0xba012624  ! 44: ADD_I	add 	%r4, 0x0624, %r29
	.word 0xb6008005  ! 44: ADD_R	add 	%r2, %r5, %r27
	.word 0xbe10a9fe  ! 44: OR_I	or 	%r2, 0x09fe, %r31
	.word 0xb001a481  ! 44: ADD_I	add 	%r6, 0x0481, %r24
	.word 0xb0118005  ! 44: OR_R	or 	%r6, %r5, %r24
	.word 0xbe008005  ! 44: ADD_R	add 	%r2, %r5, %r31
	.word 0x9a10e0f2  ! 44: OR_I	or 	%r3, 0x00f2, %r13
	.word 0xba108005  ! 44: OR_R	or 	%r2, %r5, %r29
	.word 0xb611a34a  ! 44: OR_I	or 	%r6, 0x034a, %r27
	.word 0xaa110005  ! 44: OR_R	or 	%r4, %r5, %r21
	.word 0x9c092b68  ! 44: AND_I	and 	%r4, 0x0b68, %r14
	.word 0xb010e449  ! 44: OR_I	or 	%r3, 0x0449, %r24
	.word 0xbe088005  ! 44: AND_R	and 	%r2, %r5, %r31
	.word 0xaa110005  ! 44: OR_R	or 	%r4, %r5, %r21
	.word 0xa410a001  ! 44: OR_I	or 	%r2, 0x0001, %r18
	.word 0x9a108005  ! 44: OR_R	or 	%r2, %r5, %r13
	.word 0xa208c005  ! 44: AND_R	and 	%r3, %r5, %r17
	.word 0xec20ab7c  ! 44: STW_I	stw	%r22, [%r2 + 0x0b7c]
	.word 0xe230a17e  ! 44: STH_I	sth	%r17, [%r2 + 0x017e]
	.word 0xe220ac74  ! 44: STW_I	stw	%r17, [%r2 + 0x0c74]
	.word 0xec30a11a  ! 44: STH_I	sth	%r22, [%r2 + 0x011a]
IRF_CE_22:
!$EV error(2,expr(@VA(.MAIN.IRF_CE_22), 16, 16), 1,IRF,ce,12,x, x,x,x, x,x,x)
!$EV error(2,expr(@VA(.MAIN.IRF_CE_22), 16, 16), 3,IRF,ce,56,x, x,x,x, x,x,x)
	.word 0xea30aa8c  ! 44: STH_I	sth	%r21, [%r2 + 0x0a8c]
	.word 0xfa29a05b  ! 44: STB_I	stb	%r29, [%r6 + 0x005b]
	.word 0xee70e4d8  ! 44: STX_I	stx	%r23, [%r3 + 0x04d8]
	.word 0xdd388005  ! 44: STDF_R	std	%f14, [%r5, %r2]
	.word 0x9c098005  ! 44: AND_R	and 	%r6, %r5, %r14
	.word 0xa801c005  ! 44: ADD_R	add 	%r7, %r5, %r20
	bne thr2_loop_5
	subcc %g1, 0x1, %g1
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr2_loop_6:
	.word 0xb409a341  ! 51: AND_I	and 	%r6, 0x0341, %r26
	.word 0xa2108005  ! 51: OR_R	or 	%r2, %r5, %r17
	.word 0xba008005  ! 51: ADD_R	add 	%r2, %r5, %r29
	.word 0xb4098005  ! 51: AND_R	and 	%r6, %r5, %r26
	.word 0xb210c005  ! 51: OR_R	or 	%r3, %r5, %r25
	.word 0xa0008005  ! 51: ADD_R	add 	%r2, %r5, %r16
	.word 0xa0008005  ! 51: ADD_R	add 	%r2, %r5, %r16
	.word 0xb608e4f9  ! 51: AND_I	and 	%r3, 0x04f9, %r27
	.word 0xb600ec3d  ! 51: ADD_I	add 	%r3, 0x0c3d, %r27
	.word 0x9e010005  ! 51: ADD_R	add 	%r4, %r5, %r15
	.word 0xa811e7ac  ! 51: OR_I	or 	%r7, 0x07ac, %r20
	.word 0xa000c005  ! 51: ADD_R	add 	%r3, %r5, %r16
	.word 0xbe112fab  ! 51: OR_I	or 	%r4, 0x0fab, %r31
	.word 0xba01c005  ! 51: ADD_R	add 	%r7, %r5, %r29
	.word 0xb408c005  ! 51: AND_R	and 	%r3, %r5, %r26
	.word 0xae00e183  ! 51: ADD_I	add 	%r3, 0x0183, %r23
	.word 0xa6008005  ! 51: ADD_R	add 	%r2, %r5, %r19
	.word 0xb808a32c  ! 51: AND_I	and 	%r2, 0x032c, %r28
	.word 0x9a092b4d  ! 51: AND_I	and 	%r4, 0x0b4d, %r13
	.word 0xaa108005  ! 51: OR_R	or 	%r2, %r5, %r21
	.word 0xa811c005  ! 51: OR_R	or 	%r7, %r5, %r20
	.word 0xbc00afe6  ! 51: ADD_I	add 	%r2, 0x0fe6, %r30
	.word 0xac11e404  ! 51: OR_I	or 	%r7, 0x0404, %r22
	.word 0xb4098005  ! 51: AND_R	and 	%r6, %r5, %r26
	.word 0xb210e748  ! 51: OR_I	or 	%r3, 0x0748, %r25
	.word 0xbe09ac4e  ! 51: AND_I	and 	%r6, 0x0c4e, %r31
	.word 0xa0010005  ! 51: ADD_R	add 	%r4, %r5, %r16
	.word 0xa610c005  ! 51: OR_R	or 	%r3, %r5, %r19
	.word 0xa2118005  ! 51: OR_R	or 	%r6, %r5, %r17
	.word 0x9a108005  ! 51: OR_R	or 	%r2, %r5, %r13
	.word 0xbc008005  ! 51: ADD_R	add 	%r2, %r5, %r30
	.word 0xae10e7f1  ! 51: OR_I	or 	%r3, 0x07f1, %r23
	.word 0xaa11265e  ! 51: OR_I	or 	%r4, 0x065e, %r21
	.word 0xba008005  ! 51: ADD_R	add 	%r2, %r5, %r29
	.word 0xb810c005  ! 51: OR_R	or 	%r3, %r5, %r28
	.word 0xb8018005  ! 51: ADD_R	add 	%r6, %r5, %r28
	.word 0xbc00c005  ! 51: ADD_R	add 	%r3, %r5, %r30
	.word 0xbc10af2d  ! 51: OR_I	or 	%r2, 0x0f2d, %r30
	.word 0xbc00e793  ! 51: ADD_I	add 	%r3, 0x0793, %r30
	.word 0xa8108005  ! 51: OR_R	or 	%r2, %r5, %r20
	.word 0xb8098005  ! 51: AND_R	and 	%r6, %r5, %r28
	.word 0xb210c005  ! 51: OR_R	or 	%r3, %r5, %r25
	.word 0xa4090005  ! 51: AND_R	and 	%r4, %r5, %r18
	.word 0xa0018005  ! 51: ADD_R	add 	%r6, %r5, %r16
	.word 0x9e09af39  ! 51: AND_I	and 	%r6, 0x0f39, %r15
	.word 0xae00a685  ! 51: ADD_I	add 	%r2, 0x0685, %r23
	.word 0xa800aae7  ! 51: ADD_I	add 	%r2, 0x0ae7, %r20
	.word 0xa810c005  ! 51: OR_R	or 	%r3, %r5, %r20
	.word 0x9c10ac26  ! 51: OR_I	or 	%r2, 0x0c26, %r14
	.word 0x9a11c005  ! 51: OR_R	or 	%r7, %r5, %r13
	.word 0xba098005  ! 51: AND_R	and 	%r6, %r5, %r29
	.word 0xb409a350  ! 51: AND_I	and 	%r6, 0x0350, %r26
	.word 0xa4098005  ! 51: AND_R	and 	%r6, %r5, %r18
	.word 0xa208a8b3  ! 51: AND_I	and 	%r2, 0x08b3, %r17
	.word 0xb6008005  ! 51: ADD_R	add 	%r2, %r5, %r27
	.word 0xa400efb8  ! 51: ADD_I	add 	%r3, 0x0fb8, %r18
	.word 0x9c00ad32  ! 51: ADD_I	add 	%r2, 0x0d32, %r14
	.word 0x9a10a884  ! 51: OR_I	or 	%r2, 0x0884, %r13
	.word 0xbc010005  ! 51: ADD_R	add 	%r4, %r5, %r30
	.word 0xa601a277  ! 51: ADD_I	add 	%r6, 0x0277, %r19
	.word 0xba08a0fb  ! 51: AND_I	and 	%r2, 0x00fb, %r29
	.word 0x9a108005  ! 51: OR_R	or 	%r2, %r5, %r13
	.word 0xaa08a072  ! 51: AND_I	and 	%r2, 0x0072, %r21
	.word 0xae108005  ! 51: OR_R	or 	%r2, %r5, %r23
	.word 0x9c10affa  ! 51: OR_I	or 	%r2, 0x0ffa, %r14
	.word 0x9e012418  ! 51: ADD_I	add 	%r4, 0x0418, %r15
	.word 0xa4108005  ! 51: OR_R	or 	%r2, %r5, %r18
	.word 0xb011ebb1  ! 51: OR_I	or 	%r7, 0x0bb1, %r24
	.word 0xa8008005  ! 51: ADD_R	add 	%r2, %r5, %r20
	.word 0xae10e310  ! 51: OR_I	or 	%r3, 0x0310, %r23
	.word 0xa410a47c  ! 51: OR_I	or 	%r2, 0x047c, %r18
	.word 0xba11e4e4  ! 51: OR_I	or 	%r7, 0x04e4, %r29
	.word 0x9a11a13d  ! 51: OR_I	or 	%r6, 0x013d, %r13
	.word 0xa809259b  ! 51: AND_I	and 	%r4, 0x059b, %r20
	.word 0xa011e188  ! 51: OR_I	or 	%r7, 0x0188, %r16
	.word 0x9e08e85b  ! 51: AND_I	and 	%r3, 0x085b, %r15
	.word 0xa21121ba  ! 51: OR_I	or 	%r4, 0x01ba, %r17
	.word 0xa401241a  ! 51: ADD_I	add 	%r4, 0x041a, %r18
	.word 0xb609c005  ! 51: AND_R	and 	%r7, %r5, %r27
	.word 0xa011c005  ! 51: OR_R	or 	%r7, %r5, %r16
	.word 0xba092998  ! 51: AND_I	and 	%r4, 0x0998, %r29
	.word 0xb8090005  ! 51: AND_R	and 	%r4, %r5, %r28
	.word 0xac09ef95  ! 51: AND_I	and 	%r7, 0x0f95, %r22
	.word 0xb201a68f  ! 51: ADD_I	add 	%r6, 0x068f, %r25
	.word 0x9a08ed0c  ! 51: AND_I	and 	%r3, 0x0d0c, %r13
	.word 0xa601aa9b  ! 51: ADD_I	add 	%r6, 0x0a9b, %r19
	.word 0x9a01c005  ! 51: ADD_R	add 	%r7, %r5, %r13
	.word 0xac01e2df  ! 51: ADD_I	add 	%r7, 0x02df, %r22
	.word 0x9a01a862  ! 51: ADD_I	add 	%r6, 0x0862, %r13
	.word 0xaa00af19  ! 51: ADD_I	add 	%r2, 0x0f19, %r21
	.word 0xbe088005  ! 51: AND_R	and 	%r2, %r5, %r31
	.word 0xa011c005  ! 51: OR_R	or 	%r7, %r5, %r16
	.word 0xb4108005  ! 51: OR_R	or 	%r2, %r5, %r26
	.word 0xb8090005  ! 51: AND_R	and 	%r4, %r5, %r28
	.word 0xba09ab2b  ! 51: AND_I	and 	%r6, 0x0b2b, %r29
	.word 0xbe09a971  ! 51: AND_I	and 	%r6, 0x0971, %r31
	.word 0xbe00a89f  ! 51: ADD_I	add 	%r2, 0x089f, %r31
	.word 0xae11c005  ! 51: OR_R	or 	%r7, %r5, %r23
	.word 0xa201a8b1  ! 51: ADD_I	add 	%r6, 0x08b1, %r17
	.word 0xa208e394  ! 51: AND_I	and 	%r3, 0x0394, %r17
	.word 0xb0008005  ! 51: ADD_R	add 	%r2, %r5, %r24
	.word 0xa2088005  ! 51: AND_R	and 	%r2, %r5, %r17
	.word 0xa0008005  ! 51: ADD_R	add 	%r2, %r5, %r16
	.word 0xa811e788  ! 51: OR_I	or 	%r7, 0x0788, %r20
	.word 0xb8118005  ! 51: OR_R	or 	%r6, %r5, %r28
	.word 0xba09af59  ! 51: AND_I	and 	%r6, 0x0f59, %r29
	.word 0xb811a0cc  ! 51: OR_I	or 	%r6, 0x00cc, %r28
	.word 0xb409a7b4  ! 51: AND_I	and 	%r6, 0x07b4, %r26
	.word 0xb6092979  ! 51: AND_I	and 	%r4, 0x0979, %r27
	.word 0xa200e397  ! 51: ADD_I	add 	%r3, 0x0397, %r17
	.word 0xb2018005  ! 51: ADD_R	add 	%r6, %r5, %r25
	.word 0xa2088005  ! 51: AND_R	and 	%r2, %r5, %r17
	.word 0xb209aa02  ! 51: AND_I	and 	%r6, 0x0a02, %r25
	.word 0xa801a869  ! 51: ADD_I	add 	%r6, 0x0869, %r20
	.word 0xbc018005  ! 51: ADD_R	add 	%r6, %r5, %r30
	.word 0x9e11c005  ! 51: OR_R	or 	%r7, %r5, %r15
	.word 0xa4092e15  ! 51: AND_I	and 	%r4, 0x0e15, %r18
	.word 0xa001c005  ! 51: ADD_R	add 	%r7, %r5, %r16
	.word 0xb210a03b  ! 51: OR_I	or 	%r2, 0x003b, %r25
	.word 0xa600c005  ! 51: ADD_R	add 	%r3, %r5, %r19
	.word 0xa409e3c9  ! 51: AND_I	and 	%r7, 0x03c9, %r18
	.word 0xa400a763  ! 51: ADD_I	add 	%r2, 0x0763, %r18
	.word 0xbc11c005  ! 51: OR_R	or 	%r7, %r5, %r30
	.word 0xa010aaae  ! 51: OR_I	or 	%r2, 0x0aae, %r16
	.word 0x9c088005  ! 51: AND_R	and 	%r2, %r5, %r14
	.word 0xa000a986  ! 51: ADD_I	add 	%r2, 0x0986, %r16
	.word 0xa400a970  ! 51: ADD_I	add 	%r2, 0x0970, %r18
	.word 0xb010a8f1  ! 51: OR_I	or 	%r2, 0x08f1, %r24
	.word 0xa410e1f6  ! 51: OR_I	or 	%r3, 0x01f6, %r18
	.word 0xa800a789  ! 51: ADD_I	add 	%r2, 0x0789, %r20
	.word 0xa000c005  ! 51: ADD_R	add 	%r3, %r5, %r16
	.word 0x9c110005  ! 51: OR_R	or 	%r4, %r5, %r14
	.word 0x9a10ada3  ! 51: OR_I	or 	%r2, 0x0da3, %r13
	.word 0xb4008005  ! 51: ADD_R	add 	%r2, %r5, %r26
	.word 0xa810a473  ! 51: OR_I	or 	%r2, 0x0473, %r20
	.word 0xb810c005  ! 51: OR_R	or 	%r3, %r5, %r28
	.word 0xb200a4f8  ! 51: ADD_I	add 	%r2, 0x04f8, %r25
	.word 0xa6018005  ! 51: ADD_R	add 	%r6, %r5, %r19
	.word 0xb200a3eb  ! 51: ADD_I	add 	%r2, 0x03eb, %r25
	.word 0xba008005  ! 51: ADD_R	add 	%r2, %r5, %r29
	.word 0xa809c005  ! 51: AND_R	and 	%r7, %r5, %r20
	.word 0xa801a00d  ! 51: ADD_I	add 	%r6, 0x000d, %r20
	.word 0xae10a6c8  ! 51: OR_I	or 	%r2, 0x06c8, %r23
	.word 0xbe10c005  ! 51: OR_R	or 	%r3, %r5, %r31
	.word 0xb611c005  ! 51: OR_R	or 	%r7, %r5, %r27
	.word 0xb6112daf  ! 51: OR_I	or 	%r4, 0x0daf, %r27
	.word 0xa4018005  ! 51: ADD_R	add 	%r6, %r5, %r18
	.word 0x9a018005  ! 51: ADD_R	add 	%r6, %r5, %r13
	.word 0xbc108005  ! 51: OR_R	or 	%r2, %r5, %r30
	.word 0x9e08a0ba  ! 51: AND_I	and 	%r2, 0x00ba, %r15
	.word 0xbe088005  ! 51: AND_R	and 	%r2, %r5, %r31
	.word 0xbc08e442  ! 51: AND_I	and 	%r3, 0x0442, %r30
	.word 0xa008e964  ! 51: AND_I	and 	%r3, 0x0964, %r16
	.word 0xb0012c10  ! 51: ADD_I	add 	%r4, 0x0c10, %r24
	.word 0xb2012f65  ! 51: ADD_I	add 	%r4, 0x0f65, %r25
	.word 0x9e098005  ! 51: AND_R	and 	%r6, %r5, %r15
	.word 0xb6018005  ! 51: ADD_R	add 	%r6, %r5, %r27
	.word 0xb0088005  ! 51: AND_R	and 	%r2, %r5, %r24
	.word 0xa408e145  ! 51: AND_I	and 	%r3, 0x0145, %r18
	.word 0xa400eca2  ! 51: ADD_I	add 	%r3, 0x0ca2, %r18
	.word 0x9e10c005  ! 51: OR_R	or 	%r3, %r5, %r15
	.word 0xac00c005  ! 51: ADD_R	add 	%r3, %r5, %r22
	.word 0xb2008005  ! 51: ADD_R	add 	%r2, %r5, %r25
	.word 0x9c08ac8d  ! 51: AND_I	and 	%r2, 0x0c8d, %r14
	.word 0xaa010005  ! 51: ADD_R	add 	%r4, %r5, %r21
	.word 0xb0018005  ! 51: ADD_R	add 	%r6, %r5, %r24
	.word 0xa610c005  ! 51: OR_R	or 	%r3, %r5, %r19
	.word 0xa608a297  ! 51: AND_I	and 	%r2, 0x0297, %r19
	.word 0xb810a9fb  ! 51: OR_I	or 	%r2, 0x09fb, %r28
	.word 0xa800a21b  ! 51: ADD_I	add 	%r2, 0x021b, %r20
	.word 0x9e10a313  ! 51: OR_I	or 	%r2, 0x0313, %r15
	.word 0x9c09a221  ! 51: AND_I	and 	%r6, 0x0221, %r14
	.word 0x9a108005  ! 51: OR_R	or 	%r2, %r5, %r13
	.word 0xba09e3f0  ! 51: AND_I	and 	%r7, 0x03f0, %r29
	.word 0xb411a4ba  ! 51: OR_I	or 	%r6, 0x04ba, %r26
	.word 0x9a10a418  ! 51: OR_I	or 	%r2, 0x0418, %r13
	.word 0xae09c005  ! 51: AND_R	and 	%r7, %r5, %r23
	.word 0xb010a514  ! 51: OR_I	or 	%r2, 0x0514, %r24
	.word 0xac10ac4d  ! 51: OR_I	or 	%r2, 0x0c4d, %r22
	.word 0xb8118005  ! 51: OR_R	or 	%r6, %r5, %r28
	.word 0xb4090005  ! 51: AND_R	and 	%r4, %r5, %r26
	.word 0xbc098005  ! 51: AND_R	and 	%r6, %r5, %r30
	.word 0xa800a0fd  ! 51: ADD_I	add 	%r2, 0x00fd, %r20
	.word 0xa201e160  ! 51: ADD_I	add 	%r7, 0x0160, %r17
	.word 0xb6008005  ! 51: ADD_R	add 	%r2, %r5, %r27
	.word 0xbc08e5e3  ! 51: AND_I	and 	%r3, 0x05e3, %r30
	.word 0xb21124f4  ! 51: OR_I	or 	%r4, 0x04f4, %r25
	.word 0xa6110005  ! 51: OR_R	or 	%r4, %r5, %r19
	.word 0x9a10a78b  ! 51: OR_I	or 	%r2, 0x078b, %r13
	.word 0xba01c005  ! 51: ADD_R	add 	%r7, %r5, %r29
	.word 0x9c10ac72  ! 51: OR_I	or 	%r2, 0x0c72, %r14
	.word 0x9e01ecb6  ! 51: ADD_I	add 	%r7, 0x0cb6, %r15
	.word 0xb601e39e  ! 51: ADD_I	add 	%r7, 0x039e, %r27
	.word 0xb4008005  ! 51: ADD_R	add 	%r2, %r5, %r26
	.word 0xb6018005  ! 51: ADD_R	add 	%r6, %r5, %r27
	.word 0x9c10a90b  ! 51: OR_I	or 	%r2, 0x090b, %r14
	.word 0x9a108005  ! 51: OR_R	or 	%r2, %r5, %r13
	.word 0xb401e3da  ! 51: ADD_I	add 	%r7, 0x03da, %r26
	.word 0x9c09a410  ! 51: AND_I	and 	%r6, 0x0410, %r14
	.word 0xa4010005  ! 51: ADD_R	add 	%r4, %r5, %r18
	.word 0xbe10c005  ! 51: OR_R	or 	%r3, %r5, %r31
	.word 0xb809c005  ! 51: AND_R	and 	%r7, %r5, %r28
	.word 0x9c00e029  ! 51: ADD_I	add 	%r3, 0x0029, %r14
	.word 0xbc008005  ! 51: ADD_R	add 	%r2, %r5, %r30
	.word 0xbe010005  ! 51: ADD_R	add 	%r4, %r5, %r31
	.word 0xba018005  ! 51: ADD_R	add 	%r6, %r5, %r29
	.word 0xa2018005  ! 51: ADD_R	add 	%r6, %r5, %r17
	.word 0xbc118005  ! 51: OR_R	or 	%r6, %r5, %r30
	.word 0xac11e95e  ! 51: OR_I	or 	%r7, 0x095e, %r22
	.word 0xba010005  ! 51: ADD_R	add 	%r4, %r5, %r29
	.word 0x9c008005  ! 51: ADD_R	add 	%r2, %r5, %r14
	.word 0x9c00a3ce  ! 51: ADD_I	add 	%r2, 0x03ce, %r14
	.word 0xb409e15c  ! 51: AND_I	and 	%r7, 0x015c, %r26
	.word 0x9a0124b0  ! 51: ADD_I	add 	%r4, 0x04b0, %r13
	.word 0xbc09a4d2  ! 51: AND_I	and 	%r6, 0x04d2, %r30
	.word 0x9c09c005  ! 51: AND_R	and 	%r7, %r5, %r14
	.word 0xb409aba7  ! 51: AND_I	and 	%r6, 0x0ba7, %r26
	.word 0x9c10e737  ! 51: OR_I	or 	%r3, 0x0737, %r14
	.word 0xa410e330  ! 51: OR_I	or 	%r3, 0x0330, %r18
	.word 0xa200e1b0  ! 51: ADD_I	add 	%r3, 0x01b0, %r17
	.word 0xbc00ee86  ! 51: ADD_I	add 	%r3, 0x0e86, %r30
	.word 0x9a010005  ! 51: ADD_R	add 	%r4, %r5, %r13
	.word 0xa000ab68  ! 51: ADD_I	add 	%r2, 0x0b68, %r16
	.word 0xa401c005  ! 51: ADD_R	add 	%r7, %r5, %r18
	.word 0xae01a23f  ! 51: ADD_I	add 	%r6, 0x023f, %r23
	.word 0x9c01c005  ! 51: ADD_R	add 	%r7, %r5, %r14
	.word 0xb201210b  ! 51: ADD_I	add 	%r4, 0x010b, %r25
	.word 0xb408c005  ! 51: AND_R	and 	%r3, %r5, %r26
	.word 0x9a09edb1  ! 51: AND_I	and 	%r7, 0x0db1, %r13
	.word 0xa409c005  ! 51: AND_R	and 	%r7, %r5, %r18
	.word 0xa201c005  ! 51: ADD_R	add 	%r7, %r5, %r17
	.word 0xbc11a8f2  ! 51: OR_I	or 	%r6, 0x08f2, %r30
	.word 0xfa20e6c4  ! 51: STW_I	stw	%r29, [%r3 + 0x06c4]
	.word 0xe231a054  ! 51: STH_I	sth	%r17, [%r6 + 0x0054]
	.word 0xe821ec54  ! 51: STW_I	stw	%r20, [%r7 + 0x0c54]
	.word 0xf828e3df  ! 51: STB_I	stb	%r28, [%r3 + 0x03df]
IRF_CE_26:
!$EV error(2,expr(@VA(.MAIN.IRF_CE_26), 16, 16), 1,IRF,ce,14,x, x,x,x, x,x,x)
!$EV error(2,expr(@VA(.MAIN.IRF_CE_26), 16, 16), 3,IRF,ce,19,x, x,x,x, x,x,x)
	.word 0xf830aa92  ! 51: STH_I	sth	%r28, [%r2 + 0x0a92]
	.word 0xe430affa  ! 51: STH_I	sth	%r18, [%r2 + 0x0ffa]
	.word 0xda20a060  ! 51: STW_I	stw	%r13, [%r2 + 0x0060]
	.word 0xf5f0e005  ! 51: CASXA_R	casxa	[%r3]%asi, %r5, %r26
	.word 0xa8108005  ! 51: OR_R	or 	%r2, %r5, %r20
	.word 0xaa11e807  ! 51: OR_I	or 	%r7, 0x0807, %r21
	bne thr2_loop_6
	subcc %g1, 0x1, %g1
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr2_loop_7:
	.word 0xaa088005  ! 59: AND_R	and 	%r2, %r5, %r21
	.word 0xa8012d39  ! 59: ADD_I	add 	%r4, 0x0d39, %r20
	.word 0xbe10aa8c  ! 59: OR_I	or 	%r2, 0x0a8c, %r31
	.word 0x9c10c005  ! 59: OR_R	or 	%r3, %r5, %r14
	.word 0xb210a9be  ! 59: OR_I	or 	%r2, 0x09be, %r25
	.word 0x9c018005  ! 59: ADD_R	add 	%r6, %r5, %r14
	.word 0xa411268d  ! 59: OR_I	or 	%r4, 0x068d, %r18
	.word 0xae11eeb8  ! 59: OR_I	or 	%r7, 0x0eb8, %r23
	.word 0xae008005  ! 59: ADD_R	add 	%r2, %r5, %r23
	.word 0xb609ad2a  ! 59: AND_I	and 	%r6, 0x0d2a, %r27
	.word 0x9e010005  ! 59: ADD_R	add 	%r4, %r5, %r15
	.word 0xb411ecf7  ! 59: OR_I	or 	%r7, 0x0cf7, %r26
	.word 0xb808c005  ! 59: AND_R	and 	%r3, %r5, %r28
	.word 0xac00e96c  ! 59: ADD_I	add 	%r3, 0x096c, %r22
	.word 0xa4108005  ! 59: OR_R	or 	%r2, %r5, %r18
	.word 0xb608c005  ! 59: AND_R	and 	%r3, %r5, %r27
	.word 0x9e00e7b0  ! 59: ADD_I	add 	%r3, 0x07b0, %r15
	.word 0xba08c005  ! 59: AND_R	and 	%r3, %r5, %r29
	.word 0xa8108005  ! 59: OR_R	or 	%r2, %r5, %r20
	.word 0xaa09c005  ! 59: AND_R	and 	%r7, %r5, %r21
	.word 0xaa09e813  ! 59: AND_I	and 	%r7, 0x0813, %r21
	.word 0xa411e26a  ! 59: OR_I	or 	%r7, 0x026a, %r18
	.word 0xba090005  ! 59: AND_R	and 	%r4, %r5, %r29
	.word 0xac088005  ! 59: AND_R	and 	%r2, %r5, %r22
	.word 0xb600c005  ! 59: ADD_R	add 	%r3, %r5, %r27
	.word 0x9c012826  ! 59: ADD_I	add 	%r4, 0x0826, %r14
	.word 0x9a00c005  ! 59: ADD_R	add 	%r3, %r5, %r13
	.word 0xb8110005  ! 59: OR_R	or 	%r4, %r5, %r28
	.word 0xb000a725  ! 59: ADD_I	add 	%r2, 0x0725, %r24
	.word 0xa2118005  ! 59: OR_R	or 	%r6, %r5, %r17
	.word 0xbc10a651  ! 59: OR_I	or 	%r2, 0x0651, %r30
	.word 0xaa108005  ! 59: OR_R	or 	%r2, %r5, %r21
	.word 0xbe012db9  ! 59: ADD_I	add 	%r4, 0x0db9, %r31
	.word 0x9c110005  ! 59: OR_R	or 	%r4, %r5, %r14
	.word 0xbe11a187  ! 59: OR_I	or 	%r6, 0x0187, %r31
	.word 0x9c00a595  ! 59: ADD_I	add 	%r2, 0x0595, %r14
	.word 0xae090005  ! 59: AND_R	and 	%r4, %r5, %r23
	.word 0x9c090005  ! 59: AND_R	and 	%r4, %r5, %r14
	.word 0xbc090005  ! 59: AND_R	and 	%r4, %r5, %r30
	.word 0x9c108005  ! 59: OR_R	or 	%r2, %r5, %r14
	.word 0xa001c005  ! 59: ADD_R	add 	%r7, %r5, %r16
	.word 0xb409c005  ! 59: AND_R	and 	%r7, %r5, %r26
	.word 0x9e08a4c0  ! 59: AND_I	and 	%r2, 0x04c0, %r15
	.word 0xac09a5c7  ! 59: AND_I	and 	%r6, 0x05c7, %r22
	.word 0xae10c005  ! 59: OR_R	or 	%r3, %r5, %r23
	.word 0xba00c005  ! 59: ADD_R	add 	%r3, %r5, %r29
	.word 0xb409e83a  ! 59: AND_I	and 	%r7, 0x083a, %r26
	.word 0xa001ae34  ! 59: ADD_I	add 	%r6, 0x0e34, %r16
	.word 0xa6090005  ! 59: AND_R	and 	%r4, %r5, %r19
	.word 0xa811e4c3  ! 59: OR_I	or 	%r7, 0x04c3, %r20
	.word 0xba088005  ! 59: AND_R	and 	%r2, %r5, %r29
	.word 0xb4018005  ! 59: ADD_R	add 	%r6, %r5, %r26
	.word 0xaa11abb2  ! 59: OR_I	or 	%r6, 0x0bb2, %r21
	.word 0xb210c005  ! 59: OR_R	or 	%r3, %r5, %r25
	.word 0x9a00ad67  ! 59: ADD_I	add 	%r2, 0x0d67, %r13
	.word 0xac108005  ! 59: OR_R	or 	%r2, %r5, %r22
	.word 0xa20920d7  ! 59: AND_I	and 	%r4, 0x00d7, %r17
	.word 0xb209a8cd  ! 59: AND_I	and 	%r6, 0x08cd, %r25
	.word 0xa8098005  ! 59: AND_R	and 	%r6, %r5, %r20
	.word 0xac108005  ! 59: OR_R	or 	%r2, %r5, %r22
	.word 0xbe01a189  ! 59: ADD_I	add 	%r6, 0x0189, %r31
	.word 0x9e10c005  ! 59: OR_R	or 	%r3, %r5, %r15
	.word 0xa608a479  ! 59: AND_I	and 	%r2, 0x0479, %r19
	.word 0xb0090005  ! 59: AND_R	and 	%r4, %r5, %r24
	.word 0xa8110005  ! 59: OR_R	or 	%r4, %r5, %r20
	.word 0xb610e317  ! 59: OR_I	or 	%r3, 0x0317, %r27
	.word 0xb201232b  ! 59: ADD_I	add 	%r4, 0x032b, %r25
	.word 0xbc110005  ! 59: OR_R	or 	%r4, %r5, %r30
	.word 0xb609e79a  ! 59: AND_I	and 	%r7, 0x079a, %r27
	.word 0xb609e508  ! 59: AND_I	and 	%r7, 0x0508, %r27
	.word 0xac008005  ! 59: ADD_R	add 	%r2, %r5, %r22
	.word 0xa400a30e  ! 59: ADD_I	add 	%r2, 0x030e, %r18
	.word 0xbc010005  ! 59: ADD_R	add 	%r4, %r5, %r30
	.word 0xb400aa7b  ! 59: ADD_I	add 	%r2, 0x0a7b, %r26
	.word 0xba008005  ! 59: ADD_R	add 	%r2, %r5, %r29
	.word 0xa409e5d5  ! 59: AND_I	and 	%r7, 0x05d5, %r18
	.word 0xa4088005  ! 59: AND_R	and 	%r2, %r5, %r18
	.word 0xac108005  ! 59: OR_R	or 	%r2, %r5, %r22
	.word 0x9a098005  ! 59: AND_R	and 	%r6, %r5, %r13
	.word 0x9a008005  ! 59: ADD_R	add 	%r2, %r5, %r13
	.word 0xa208ac0b  ! 59: AND_I	and 	%r2, 0x0c0b, %r17
	.word 0xba110005  ! 59: OR_R	or 	%r4, %r5, %r29
	.word 0xae01acce  ! 59: ADD_I	add 	%r6, 0x0cce, %r23
	.word 0x9a018005  ! 59: ADD_R	add 	%r6, %r5, %r13
	.word 0xb608ac4f  ! 59: AND_I	and 	%r2, 0x0c4f, %r27
	.word 0xac08adb4  ! 59: AND_I	and 	%r2, 0x0db4, %r22
	.word 0xa008a878  ! 59: AND_I	and 	%r2, 0x0878, %r16
	.word 0xb008afa3  ! 59: AND_I	and 	%r2, 0x0fa3, %r24
	.word 0xa810c005  ! 59: OR_R	or 	%r3, %r5, %r20
	.word 0xb210af16  ! 59: OR_I	or 	%r2, 0x0f16, %r25
	.word 0xac018005  ! 59: ADD_R	add 	%r6, %r5, %r22
	.word 0xaa108005  ! 59: OR_R	or 	%r2, %r5, %r21
	.word 0xae108005  ! 59: OR_R	or 	%r2, %r5, %r23
	.word 0x9e08e66f  ! 59: AND_I	and 	%r3, 0x066f, %r15
	.word 0xbe11a334  ! 59: OR_I	or 	%r6, 0x0334, %r31
	.word 0xac01a864  ! 59: ADD_I	add 	%r6, 0x0864, %r22
	.word 0xa2008005  ! 59: ADD_R	add 	%r2, %r5, %r17
	.word 0xac012ac5  ! 59: ADD_I	add 	%r4, 0x0ac5, %r22
	.word 0xb811eea2  ! 59: OR_I	or 	%r7, 0x0ea2, %r28
	.word 0xbe08a21d  ! 59: AND_I	and 	%r2, 0x021d, %r31
	.word 0xa409a54c  ! 59: AND_I	and 	%r6, 0x054c, %r18
	.word 0x9e010005  ! 59: ADD_R	add 	%r4, %r5, %r15
	.word 0xa008c005  ! 59: AND_R	and 	%r3, %r5, %r16
	.word 0x9a09a197  ! 59: AND_I	and 	%r6, 0x0197, %r13
	.word 0xb609ef84  ! 59: AND_I	and 	%r7, 0x0f84, %r27
	.word 0xa0108005  ! 59: OR_R	or 	%r2, %r5, %r16
	.word 0x9e108005  ! 59: OR_R	or 	%r2, %r5, %r15
	.word 0xb2010005  ! 59: ADD_R	add 	%r4, %r5, %r25
	.word 0x9c09ed82  ! 59: AND_I	and 	%r7, 0x0d82, %r14
	.word 0xb811ab85  ! 59: OR_I	or 	%r6, 0x0b85, %r28
	.word 0x9c092d85  ! 59: AND_I	and 	%r4, 0x0d85, %r14
	.word 0xb4098005  ! 59: AND_R	and 	%r6, %r5, %r26
	.word 0xaa10c005  ! 59: OR_R	or 	%r3, %r5, %r21
	.word 0xb010a1d2  ! 59: OR_I	or 	%r2, 0x01d2, %r24
	.word 0xa208c005  ! 59: AND_R	and 	%r3, %r5, %r17
	.word 0xa001a98a  ! 59: ADD_I	add 	%r6, 0x098a, %r16
	.word 0xb009e788  ! 59: AND_I	and 	%r7, 0x0788, %r24
	.word 0xac00c005  ! 59: ADD_R	add 	%r3, %r5, %r22
	.word 0x9c1126a9  ! 59: OR_I	or 	%r4, 0x06a9, %r14
	.word 0xa8018005  ! 59: ADD_R	add 	%r6, %r5, %r20
	.word 0x9e010005  ! 59: ADD_R	add 	%r4, %r5, %r15
	.word 0x9e090005  ! 59: AND_R	and 	%r4, %r5, %r15
	.word 0xbc01a664  ! 59: ADD_I	add 	%r6, 0x0664, %r30
	.word 0xb2010005  ! 59: ADD_R	add 	%r4, %r5, %r25
	.word 0xa009ed03  ! 59: AND_I	and 	%r7, 0x0d03, %r16
	.word 0x9e00ad70  ! 59: ADD_I	add 	%r2, 0x0d70, %r15
	.word 0xba01a186  ! 59: ADD_I	add 	%r6, 0x0186, %r29
	.word 0xb4008005  ! 59: ADD_R	add 	%r2, %r5, %r26
	.word 0xbc012034  ! 59: ADD_I	add 	%r4, 0x0034, %r30
	.word 0xb4008005  ! 59: ADD_R	add 	%r2, %r5, %r26
	.word 0xac012e83  ! 59: ADD_I	add 	%r4, 0x0e83, %r22
	.word 0xb8088005  ! 59: AND_R	and 	%r2, %r5, %r28
	.word 0xb21122db  ! 59: OR_I	or 	%r4, 0x02db, %r25
	.word 0xb8118005  ! 59: OR_R	or 	%r6, %r5, %r28
	.word 0xb801e1c3  ! 59: ADD_I	add 	%r7, 0x01c3, %r28
	.word 0xb800e8e3  ! 59: ADD_I	add 	%r3, 0x08e3, %r28
	.word 0x9a088005  ! 59: AND_R	and 	%r2, %r5, %r13
	.word 0xb8018005  ! 59: ADD_R	add 	%r6, %r5, %r28
	.word 0x9c08c005  ! 59: AND_R	and 	%r3, %r5, %r14
	.word 0xbe10c005  ! 59: OR_R	or 	%r3, %r5, %r31
	.word 0xa201e627  ! 59: ADD_I	add 	%r7, 0x0627, %r17
	.word 0xa400acb5  ! 59: ADD_I	add 	%r2, 0x0cb5, %r18
	.word 0xac00e4b0  ! 59: ADD_I	add 	%r3, 0x04b0, %r22
	.word 0xb2090005  ! 59: AND_R	and 	%r4, %r5, %r25
	.word 0xb008c005  ! 59: AND_R	and 	%r3, %r5, %r24
	.word 0x9e10c005  ! 59: OR_R	or 	%r3, %r5, %r15
	.word 0xa211a6c9  ! 59: OR_I	or 	%r6, 0x06c9, %r17
	.word 0x9a11c005  ! 59: OR_R	or 	%r7, %r5, %r13
	.word 0xae11c005  ! 59: OR_R	or 	%r7, %r5, %r23
	.word 0xa410ef01  ! 59: OR_I	or 	%r3, 0x0f01, %r18
	.word 0xba00a20b  ! 59: ADD_I	add 	%r2, 0x020b, %r29
	.word 0xb401a28c  ! 59: ADD_I	add 	%r6, 0x028c, %r26
	.word 0x9e09c005  ! 59: AND_R	and 	%r7, %r5, %r15
	.word 0xac110005  ! 59: OR_R	or 	%r4, %r5, %r22
	.word 0xba092c99  ! 59: AND_I	and 	%r4, 0x0c99, %r29
	.word 0xa801271c  ! 59: ADD_I	add 	%r4, 0x071c, %r20
	.word 0xb211c005  ! 59: OR_R	or 	%r7, %r5, %r25
	.word 0xac10e536  ! 59: OR_I	or 	%r3, 0x0536, %r22
	.word 0xb0012ce0  ! 59: ADD_I	add 	%r4, 0x0ce0, %r24
	.word 0xb410a8ab  ! 59: OR_I	or 	%r2, 0x08ab, %r26
	.word 0x9e118005  ! 59: OR_R	or 	%r6, %r5, %r15
	.word 0xa6018005  ! 59: ADD_R	add 	%r6, %r5, %r19
	.word 0xb2010005  ! 59: ADD_R	add 	%r4, %r5, %r25
	.word 0xb608c005  ! 59: AND_R	and 	%r3, %r5, %r27
	.word 0xbe08a2de  ! 59: AND_I	and 	%r2, 0x02de, %r31
	.word 0xb4012c1f  ! 59: ADD_I	add 	%r4, 0x0c1f, %r26
	.word 0xae10a877  ! 59: OR_I	or 	%r2, 0x0877, %r23
	.word 0x9c09a330  ! 59: AND_I	and 	%r6, 0x0330, %r14
	.word 0xbe00ad3c  ! 59: ADD_I	add 	%r2, 0x0d3c, %r31
	.word 0xa0110005  ! 59: OR_R	or 	%r4, %r5, %r16
	.word 0x9c00e0e0  ! 59: ADD_I	add 	%r3, 0x00e0, %r14
	.word 0xaa088005  ! 59: AND_R	and 	%r2, %r5, %r21
	.word 0xbc01e5ce  ! 59: ADD_I	add 	%r7, 0x05ce, %r30
	.word 0xa4090005  ! 59: AND_R	and 	%r4, %r5, %r18
	.word 0xa400a4e3  ! 59: ADD_I	add 	%r2, 0x04e3, %r18
	.word 0x9c108005  ! 59: OR_R	or 	%r2, %r5, %r14
	.word 0x9c10ab61  ! 59: OR_I	or 	%r2, 0x0b61, %r14
	.word 0xbe00c005  ! 59: ADD_R	add 	%r3, %r5, %r31
	.word 0xac00a2fd  ! 59: ADD_I	add 	%r2, 0x02fd, %r22
	.word 0xbc00c005  ! 59: ADD_R	add 	%r3, %r5, %r30
	.word 0xbe098005  ! 59: AND_R	and 	%r6, %r5, %r31
	.word 0xb810a351  ! 59: OR_I	or 	%r2, 0x0351, %r28
	.word 0xb4112cf3  ! 59: OR_I	or 	%r4, 0x0cf3, %r26
	.word 0xb2118005  ! 59: OR_R	or 	%r6, %r5, %r25
	.word 0xa801e791  ! 59: ADD_I	add 	%r7, 0x0791, %r20
	.word 0xae09ef26  ! 59: AND_I	and 	%r7, 0x0f26, %r23
	.word 0xac098005  ! 59: AND_R	and 	%r6, %r5, %r22
	.word 0xa2092ca8  ! 59: AND_I	and 	%r4, 0x0ca8, %r17
	.word 0xb0118005  ! 59: OR_R	or 	%r6, %r5, %r24
	.word 0xae09e9d7  ! 59: AND_I	and 	%r7, 0x09d7, %r23
	.word 0xac09c005  ! 59: AND_R	and 	%r7, %r5, %r22
	.word 0xb0088005  ! 59: AND_R	and 	%r2, %r5, %r24
	.word 0xf220eb74  ! 59: STW_I	stw	%r25, [%r3 + 0x0b74]
	.word 0xec30a85a  ! 59: STH_I	sth	%r22, [%r2 + 0x085a]
	.word 0xf6312aa4  ! 59: STH_I	sth	%r27, [%r4 + 0x0aa4]
	.word 0xe221e128  ! 59: STW_I	stw	%r17, [%r7 + 0x0128]
IRF_CE_30:
!$EV error(2,expr(@VA(.MAIN.IRF_CE_30), 16, 16), 1,IRF,ce,49,x, x,x,x, x,x,x)
!$EV error(2,expr(@VA(.MAIN.IRF_CE_30), 16, 16), 3,IRF,ce,69,x, x,x,x, x,x,x)
	.word 0xea212128  ! 59: STW_I	stw	%r21, [%r4 + 0x0128]
	.word 0xe829a897  ! 59: STB_I	stb	%r20, [%r6 + 0x0897]
	.word 0xe031a4ae  ! 59: STH_I	sth	%r16, [%r6 + 0x04ae]
	.word 0xd6f20cea  ! 59: STXA_R	stxa	%r11, [%r8 + %r10] 0x67
	.word 0x9e088005  ! 59: AND_R	and 	%r2, %r5, %r15
	.word 0xbc09a47d  ! 59: AND_I	and 	%r6, 0x047d, %r30
	bne thr2_loop_7
	subcc %g1, 0x1, %g1
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr2_loop_8:
	.word 0xac09e475  ! 66: AND_I	and 	%r7, 0x0475, %r22
	.word 0xaa09e8b8  ! 66: AND_I	and 	%r7, 0x08b8, %r21
	.word 0x9e01eb4e  ! 66: ADD_I	add 	%r7, 0x0b4e, %r15
	.word 0x9e092de5  ! 66: AND_I	and 	%r4, 0x0de5, %r15
	.word 0x9c11ae82  ! 66: OR_I	or 	%r6, 0x0e82, %r14
	.word 0xa210aaab  ! 66: OR_I	or 	%r2, 0x0aab, %r17
	.word 0x9e00ebb9  ! 66: ADD_I	add 	%r3, 0x0bb9, %r15
	.word 0xae00a6c5  ! 66: ADD_I	add 	%r2, 0x06c5, %r23
	.word 0xa6008005  ! 66: ADD_R	add 	%r2, %r5, %r19
	.word 0xb011c005  ! 66: OR_R	or 	%r7, %r5, %r24
	.word 0xaa11ad9f  ! 66: OR_I	or 	%r6, 0x0d9f, %r21
	.word 0xb408a1f2  ! 66: AND_I	and 	%r2, 0x01f2, %r26
	.word 0xbe090005  ! 66: AND_R	and 	%r4, %r5, %r31
	.word 0x9c01a3fc  ! 66: ADD_I	add 	%r6, 0x03fc, %r14
	.word 0x9c08e1a6  ! 66: AND_I	and 	%r3, 0x01a6, %r14
	.word 0xb600a716  ! 66: ADD_I	add 	%r2, 0x0716, %r27
	.word 0xb4108005  ! 66: OR_R	or 	%r2, %r5, %r26
	.word 0xb000c005  ! 66: ADD_R	add 	%r3, %r5, %r24
	.word 0x9c11aac7  ! 66: OR_I	or 	%r6, 0x0ac7, %r14
	.word 0xb610a2c5  ! 66: OR_I	or 	%r2, 0x02c5, %r27
	.word 0xa400c005  ! 66: ADD_R	add 	%r3, %r5, %r18
	.word 0xac08ac95  ! 66: AND_I	and 	%r2, 0x0c95, %r22
	.word 0xb0008005  ! 66: ADD_R	add 	%r2, %r5, %r24
	.word 0xb400ae5d  ! 66: ADD_I	add 	%r2, 0x0e5d, %r26
	.word 0xba10a75b  ! 66: OR_I	or 	%r2, 0x075b, %r29
	.word 0xb408ad3c  ! 66: AND_I	and 	%r2, 0x0d3c, %r26
	.word 0xbe01e864  ! 66: ADD_I	add 	%r7, 0x0864, %r31
	.word 0xa410a828  ! 66: OR_I	or 	%r2, 0x0828, %r18
	.word 0xa611e43b  ! 66: OR_I	or 	%r7, 0x043b, %r19
	.word 0x9c10e4b9  ! 66: OR_I	or 	%r3, 0x04b9, %r14
	.word 0xbe098005  ! 66: AND_R	and 	%r6, %r5, %r31
	.word 0xb4108005  ! 66: OR_R	or 	%r2, %r5, %r26
	.word 0xb4118005  ! 66: OR_R	or 	%r6, %r5, %r26
	.word 0xaa1120de  ! 66: OR_I	or 	%r4, 0x00de, %r21
	.word 0xa008a75d  ! 66: AND_I	and 	%r2, 0x075d, %r16
	.word 0xaa090005  ! 66: AND_R	and 	%r4, %r5, %r21
	.word 0x9c118005  ! 66: OR_R	or 	%r6, %r5, %r14
	.word 0xa408a138  ! 66: AND_I	and 	%r2, 0x0138, %r18
	.word 0xb4008005  ! 66: ADD_R	add 	%r2, %r5, %r26
	.word 0xac09a58a  ! 66: AND_I	and 	%r6, 0x058a, %r22
	.word 0xbc10ad1b  ! 66: OR_I	or 	%r2, 0x0d1b, %r30
	.word 0xaa08a1f4  ! 66: AND_I	and 	%r2, 0x01f4, %r21
	.word 0xae11a7c2  ! 66: OR_I	or 	%r6, 0x07c2, %r23
	.word 0xa0108005  ! 66: OR_R	or 	%r2, %r5, %r16
	.word 0xaa118005  ! 66: OR_R	or 	%r6, %r5, %r21
	.word 0xb4012f03  ! 66: ADD_I	add 	%r4, 0x0f03, %r26
	.word 0xb610a5ac  ! 66: OR_I	or 	%r2, 0x05ac, %r27
	.word 0xa8108005  ! 66: OR_R	or 	%r2, %r5, %r20
	.word 0xbe112556  ! 66: OR_I	or 	%r4, 0x0556, %r31
	.word 0x9e090005  ! 66: AND_R	and 	%r4, %r5, %r15
	.word 0x9a118005  ! 66: OR_R	or 	%r6, %r5, %r13
	.word 0xbe088005  ! 66: AND_R	and 	%r2, %r5, %r31
	.word 0xbc10a5bb  ! 66: OR_I	or 	%r2, 0x05bb, %r30
	.word 0xb800ac2a  ! 66: ADD_I	add 	%r2, 0x0c2a, %r28
	.word 0xae00e636  ! 66: ADD_I	add 	%r3, 0x0636, %r23
	.word 0x9e00a843  ! 66: ADD_I	add 	%r2, 0x0843, %r15
	.word 0xba01c005  ! 66: ADD_R	add 	%r7, %r5, %r29
	.word 0xa601c005  ! 66: ADD_R	add 	%r7, %r5, %r19
	.word 0x9c118005  ! 66: OR_R	or 	%r6, %r5, %r14
	.word 0xb4010005  ! 66: ADD_R	add 	%r4, %r5, %r26
	.word 0xae108005  ! 66: OR_R	or 	%r2, %r5, %r23
	.word 0xb6010005  ! 66: ADD_R	add 	%r4, %r5, %r27
	.word 0xb608a396  ! 66: AND_I	and 	%r2, 0x0396, %r27
	.word 0xa2110005  ! 66: OR_R	or 	%r4, %r5, %r17
	.word 0xb608c005  ! 66: AND_R	and 	%r3, %r5, %r27
	.word 0xb401c005  ! 66: ADD_R	add 	%r7, %r5, %r26
	.word 0x9c10e394  ! 66: OR_I	or 	%r3, 0x0394, %r14
	.word 0xb210c005  ! 66: OR_R	or 	%r3, %r5, %r25
	.word 0xa6088005  ! 66: AND_R	and 	%r2, %r5, %r19
	.word 0xa008aab5  ! 66: AND_I	and 	%r2, 0x0ab5, %r16
	.word 0x9a108005  ! 66: OR_R	or 	%r2, %r5, %r13
	.word 0x9c008005  ! 66: ADD_R	add 	%r2, %r5, %r14
	.word 0xa8012a90  ! 66: ADD_I	add 	%r4, 0x0a90, %r20
	.word 0xbc008005  ! 66: ADD_R	add 	%r2, %r5, %r30
	.word 0x9c012214  ! 66: ADD_I	add 	%r4, 0x0214, %r14
	.word 0xb810ea9a  ! 66: OR_I	or 	%r3, 0x0a9a, %r28
	.word 0xaa08a2d2  ! 66: AND_I	and 	%r2, 0x02d2, %r21
	.word 0xba098005  ! 66: AND_R	and 	%r6, %r5, %r29
	.word 0xb6108005  ! 66: OR_R	or 	%r2, %r5, %r27
	.word 0xba10a609  ! 66: OR_I	or 	%r2, 0x0609, %r29
	.word 0xaa010005  ! 66: ADD_R	add 	%r4, %r5, %r21
	.word 0xb2008005  ! 66: ADD_R	add 	%r2, %r5, %r25
	.word 0x9c08c005  ! 66: AND_R	and 	%r3, %r5, %r14
	.word 0xb811e905  ! 66: OR_I	or 	%r7, 0x0905, %r28
	.word 0xaa008005  ! 66: ADD_R	add 	%r2, %r5, %r21
	.word 0x9c090005  ! 66: AND_R	and 	%r4, %r5, %r14
	.word 0xae098005  ! 66: AND_R	and 	%r6, %r5, %r23
	.word 0xac098005  ! 66: AND_R	and 	%r6, %r5, %r22
	.word 0x9e08a77e  ! 66: AND_I	and 	%r2, 0x077e, %r15
	.word 0xbe00a80e  ! 66: ADD_I	add 	%r2, 0x080e, %r31
	.word 0xac10ab0a  ! 66: OR_I	or 	%r2, 0x0b0a, %r22
	.word 0xa8010005  ! 66: ADD_R	add 	%r4, %r5, %r20
	.word 0x9c09e4a1  ! 66: AND_I	and 	%r7, 0x04a1, %r14
	.word 0xb8008005  ! 66: ADD_R	add 	%r2, %r5, %r28
	.word 0xa810e17d  ! 66: OR_I	or 	%r3, 0x017d, %r20
	.word 0xa001a192  ! 66: ADD_I	add 	%r6, 0x0192, %r16
	.word 0xa810ab99  ! 66: OR_I	or 	%r2, 0x0b99, %r20
	.word 0xb211e353  ! 66: OR_I	or 	%r7, 0x0353, %r25
	.word 0x9a08af99  ! 66: AND_I	and 	%r2, 0x0f99, %r13
	.word 0xac010005  ! 66: ADD_R	add 	%r4, %r5, %r22
	.word 0xac09c005  ! 66: AND_R	and 	%r7, %r5, %r22
	.word 0xba008005  ! 66: ADD_R	add 	%r2, %r5, %r29
	.word 0xa400e798  ! 66: ADD_I	add 	%r3, 0x0798, %r18
	.word 0xa410aca1  ! 66: OR_I	or 	%r2, 0x0ca1, %r18
	.word 0xa601e9f8  ! 66: ADD_I	add 	%r7, 0x09f8, %r19
	.word 0x9a108005  ! 66: OR_R	or 	%r2, %r5, %r13
	.word 0xb401a22f  ! 66: ADD_I	add 	%r6, 0x022f, %r26
	.word 0xb4108005  ! 66: OR_R	or 	%r2, %r5, %r26
	.word 0xa6110005  ! 66: OR_R	or 	%r4, %r5, %r19
	.word 0x9c108005  ! 66: OR_R	or 	%r2, %r5, %r14
	.word 0x9e11e442  ! 66: OR_I	or 	%r7, 0x0442, %r15
	.word 0xbc012099  ! 66: ADD_I	add 	%r4, 0x0099, %r30
	.word 0xbc08a48e  ! 66: AND_I	and 	%r2, 0x048e, %r30
	.word 0xb408a80b  ! 66: AND_I	and 	%r2, 0x080b, %r26
	.word 0xa010e893  ! 66: OR_I	or 	%r3, 0x0893, %r16
	.word 0xb810ac4f  ! 66: OR_I	or 	%r2, 0x0c4f, %r28
	.word 0x9c00e918  ! 66: ADD_I	add 	%r3, 0x0918, %r14
	.word 0xb4008005  ! 66: ADD_R	add 	%r2, %r5, %r26
	.word 0xbc01e9fe  ! 66: ADD_I	add 	%r7, 0x09fe, %r30
	.word 0xae108005  ! 66: OR_R	or 	%r2, %r5, %r23
	.word 0x9a09e4a0  ! 66: AND_I	and 	%r7, 0x04a0, %r13
	.word 0xa409c005  ! 66: AND_R	and 	%r7, %r5, %r18
	.word 0xb210e4d1  ! 66: OR_I	or 	%r3, 0x04d1, %r25
	.word 0xb400e84a  ! 66: ADD_I	add 	%r3, 0x084a, %r26
	.word 0xa611c005  ! 66: OR_R	or 	%r7, %r5, %r19
	.word 0xb2110005  ! 66: OR_R	or 	%r4, %r5, %r25
	.word 0xb011a4ce  ! 66: OR_I	or 	%r6, 0x04ce, %r24
	.word 0x9c112d28  ! 66: OR_I	or 	%r4, 0x0d28, %r14
	.word 0xa001c005  ! 66: ADD_R	add 	%r7, %r5, %r16
	.word 0xba08a200  ! 66: AND_I	and 	%r2, 0x0200, %r29
	.word 0xb400a298  ! 66: ADD_I	add 	%r2, 0x0298, %r26
	.word 0xb2092a54  ! 66: AND_I	and 	%r4, 0x0a54, %r25
	.word 0xa408c005  ! 66: AND_R	and 	%r3, %r5, %r18
	.word 0xb009ae35  ! 66: AND_I	and 	%r6, 0x0e35, %r24
	.word 0xbe118005  ! 66: OR_R	or 	%r6, %r5, %r31
	.word 0xa0112e24  ! 66: OR_I	or 	%r4, 0x0e24, %r16
	.word 0xf820ab40  ! 66: STW_I	stw	%r28, [%r2 + 0x0b40]
	.word 0xec71e700  ! 66: STX_I	stx	%r22, [%r7 + 0x0700]
	.word 0xf228a785  ! 66: STB_I	stb	%r25, [%r2 + 0x0785]
	.word 0xf220a214  ! 66: STW_I	stw	%r25, [%r2 + 0x0214]
IRF_CE_34:
!$EV error(2,expr(@VA(.MAIN.IRF_CE_34), 16, 16), 1,IRF,ce,52,x, x,x,x, x,x,x)
!$EV error(2,expr(@VA(.MAIN.IRF_CE_34), 16, 16), 3,IRF,ce,69,x, x,x,x, x,x,x)
	.word 0xfe28e52c  ! 66: STB_I	stb	%r31, [%r3 + 0x052c]
	.word 0xf421ee84  ! 66: STW_I	stw	%r26, [%r7 + 0x0e84]
	.word 0xee20ee80  ! 66: STW_I	stw	%r23, [%r3 + 0x0e80]
	.word 0xdd388005  ! 66: STDF_R	std	%f14, [%r5, %r2]
	.word 0xa6010005  ! 66: ADD_R	add 	%r4, %r5, %r19
	.word 0x9e012f1c  ! 66: ADD_I	add 	%r4, 0x0f1c, %r15
	bne thr2_loop_8
	subcc %g1, 0x1, %g1
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr2_loop_9:
	.word 0xba11245a  ! 73: OR_I	or 	%r4, 0x045a, %r29
	.word 0x9e010005  ! 73: ADD_R	add 	%r4, %r5, %r15
	.word 0xba008005  ! 73: ADD_R	add 	%r2, %r5, %r29
	.word 0xa608ead1  ! 73: AND_I	and 	%r3, 0x0ad1, %r19
	.word 0xb810a180  ! 73: OR_I	or 	%r2, 0x0180, %r28
	.word 0x9e0926fc  ! 73: AND_I	and 	%r4, 0x06fc, %r15
	.word 0xb200c005  ! 73: ADD_R	add 	%r3, %r5, %r25
	.word 0xb8110005  ! 73: OR_R	or 	%r4, %r5, %r28
	.word 0xa809238b  ! 73: AND_I	and 	%r4, 0x038b, %r20
	.word 0xae00a12a  ! 73: ADD_I	add 	%r2, 0x012a, %r23
	.word 0xb6088005  ! 73: AND_R	and 	%r2, %r5, %r27
	.word 0xb408ec59  ! 73: AND_I	and 	%r3, 0x0c59, %r26
	.word 0xae088005  ! 73: AND_R	and 	%r2, %r5, %r23
	.word 0xb2110005  ! 73: OR_R	or 	%r4, %r5, %r25
	.word 0xa6092cdc  ! 73: AND_I	and 	%r4, 0x0cdc, %r19
	.word 0x9c090005  ! 73: AND_R	and 	%r4, %r5, %r14
	.word 0x9c108005  ! 73: OR_R	or 	%r2, %r5, %r14
	.word 0x9e09ee5f  ! 73: AND_I	and 	%r7, 0x0e5f, %r15
	.word 0xbc108005  ! 73: OR_R	or 	%r2, %r5, %r30
	.word 0xa208e5ea  ! 73: AND_I	and 	%r3, 0x05ea, %r17
	.word 0xb001c005  ! 73: ADD_R	add 	%r7, %r5, %r24
	.word 0xaa018005  ! 73: ADD_R	add 	%r6, %r5, %r21
	.word 0xa409eb4c  ! 73: AND_I	and 	%r7, 0x0b4c, %r18
	.word 0xb2008005  ! 73: ADD_R	add 	%r2, %r5, %r25
	.word 0xbc10a0ec  ! 73: OR_I	or 	%r2, 0x00ec, %r30
	.word 0xb211c005  ! 73: OR_R	or 	%r7, %r5, %r25
	.word 0xb609e836  ! 73: AND_I	and 	%r7, 0x0836, %r27
	.word 0xb201a8a5  ! 73: ADD_I	add 	%r6, 0x08a5, %r25
	.word 0xa8088005  ! 73: AND_R	and 	%r2, %r5, %r20
	.word 0xb009e32a  ! 73: AND_I	and 	%r7, 0x032a, %r24
	.word 0x9a108005  ! 73: OR_R	or 	%r2, %r5, %r13
	.word 0x9e108005  ! 73: OR_R	or 	%r2, %r5, %r15
	.word 0xae00e344  ! 73: ADD_I	add 	%r3, 0x0344, %r23
	.word 0xb20928e4  ! 73: AND_I	and 	%r4, 0x08e4, %r25
	.word 0xbc11c005  ! 73: OR_R	or 	%r7, %r5, %r30
	.word 0xaa09c005  ! 73: AND_R	and 	%r7, %r5, %r21
	.word 0x9a09a3c4  ! 73: AND_I	and 	%r6, 0x03c4, %r13
	.word 0xbc110005  ! 73: OR_R	or 	%r4, %r5, %r30
	.word 0xbe088005  ! 73: AND_R	and 	%r2, %r5, %r31
	.word 0xaa088005  ! 73: AND_R	and 	%r2, %r5, %r21
	.word 0xb010e1b3  ! 73: OR_I	or 	%r3, 0x01b3, %r24
	.word 0xb801e42e  ! 73: ADD_I	add 	%r7, 0x042e, %r28
	.word 0xb010afa3  ! 73: OR_I	or 	%r2, 0x0fa3, %r24
	.word 0xa200c005  ! 73: ADD_R	add 	%r3, %r5, %r17
	.word 0xa2088005  ! 73: AND_R	and 	%r2, %r5, %r17
	.word 0xaa110005  ! 73: OR_R	or 	%r4, %r5, %r21
	.word 0xb2090005  ! 73: AND_R	and 	%r4, %r5, %r25
	.word 0xb2010005  ! 73: ADD_R	add 	%r4, %r5, %r25
	.word 0xa400a6b8  ! 73: ADD_I	add 	%r2, 0x06b8, %r18
	.word 0xaa008005  ! 73: ADD_R	add 	%r2, %r5, %r21
	.word 0xa200e4d1  ! 73: ADD_I	add 	%r3, 0x04d1, %r17
	.word 0xb2092b08  ! 73: AND_I	and 	%r4, 0x0b08, %r25
	.word 0xbc008005  ! 73: ADD_R	add 	%r2, %r5, %r30
	.word 0xaa010005  ! 73: ADD_R	add 	%r4, %r5, %r21
	.word 0xa2108005  ! 73: OR_R	or 	%r2, %r5, %r17
	.word 0xb411a98e  ! 73: OR_I	or 	%r6, 0x098e, %r26
	.word 0xb8098005  ! 73: AND_R	and 	%r6, %r5, %r28
	.word 0xbc00c005  ! 73: ADD_R	add 	%r3, %r5, %r30
	.word 0x9e090005  ! 73: AND_R	and 	%r4, %r5, %r15
	.word 0xb2118005  ! 73: OR_R	or 	%r6, %r5, %r25
	.word 0xbc11c005  ! 73: OR_R	or 	%r7, %r5, %r30
	.word 0xa6012892  ! 73: ADD_I	add 	%r4, 0x0892, %r19
	.word 0x9a018005  ! 73: ADD_R	add 	%r6, %r5, %r13
	.word 0xa000ee57  ! 73: ADD_I	add 	%r3, 0x0e57, %r16
	.word 0xa409c005  ! 73: AND_R	and 	%r7, %r5, %r18
	.word 0xa6108005  ! 73: OR_R	or 	%r2, %r5, %r19
	.word 0xb408a25d  ! 73: AND_I	and 	%r2, 0x025d, %r26
	.word 0xa411c005  ! 73: OR_R	or 	%r7, %r5, %r18
	.word 0xb210c005  ! 73: OR_R	or 	%r3, %r5, %r25
	.word 0xa209c005  ! 73: AND_R	and 	%r7, %r5, %r17
	.word 0xb001c005  ! 73: ADD_R	add 	%r7, %r5, %r24
	.word 0xa8008005  ! 73: ADD_R	add 	%r2, %r5, %r20
	.word 0xa200a36b  ! 73: ADD_I	add 	%r2, 0x036b, %r17
	.word 0xba01c005  ! 73: ADD_R	add 	%r7, %r5, %r29
	.word 0x9c012a55  ! 73: ADD_I	add 	%r4, 0x0a55, %r14
	.word 0xae11ee8d  ! 73: OR_I	or 	%r7, 0x0e8d, %r23
	.word 0xa009ea32  ! 73: AND_I	and 	%r7, 0x0a32, %r16
	.word 0xbe08c005  ! 73: AND_R	and 	%r3, %r5, %r31
	.word 0x9a01e4f4  ! 73: ADD_I	add 	%r7, 0x04f4, %r13
	.word 0xa200e943  ! 73: ADD_I	add 	%r3, 0x0943, %r17
	.word 0x9a0122ce  ! 73: ADD_I	add 	%r4, 0x02ce, %r13
	.word 0xa808ab3e  ! 73: AND_I	and 	%r2, 0x0b3e, %r20
	.word 0xbc01a8e1  ! 73: ADD_I	add 	%r6, 0x08e1, %r30
	.word 0xaa09a7ef  ! 73: AND_I	and 	%r6, 0x07ef, %r21
	.word 0xb0108005  ! 73: OR_R	or 	%r2, %r5, %r24
	.word 0xb6008005  ! 73: ADD_R	add 	%r2, %r5, %r27
	.word 0xbc018005  ! 73: ADD_R	add 	%r6, %r5, %r30
	.word 0x9c11224f  ! 73: OR_I	or 	%r4, 0x024f, %r14
	.word 0xaa10ed7a  ! 73: OR_I	or 	%r3, 0x0d7a, %r21
	.word 0xa4008005  ! 73: ADD_R	add 	%r2, %r5, %r18
	.word 0xa4018005  ! 73: ADD_R	add 	%r6, %r5, %r18
	.word 0xae090005  ! 73: AND_R	and 	%r4, %r5, %r23
	.word 0x9c08a736  ! 73: AND_I	and 	%r2, 0x0736, %r14
	.word 0xae110005  ! 73: OR_R	or 	%r4, %r5, %r23
	.word 0x9e108005  ! 73: OR_R	or 	%r2, %r5, %r15
	.word 0xaa11246f  ! 73: OR_I	or 	%r4, 0x046f, %r21
	.word 0xb400a564  ! 73: ADD_I	add 	%r2, 0x0564, %r26
	.word 0xb400e387  ! 73: ADD_I	add 	%r3, 0x0387, %r26
	.word 0xb009e3f0  ! 73: AND_I	and 	%r7, 0x03f0, %r24
	.word 0xac00e2d7  ! 73: ADD_I	add 	%r3, 0x02d7, %r22
	.word 0xaa1122ef  ! 73: OR_I	or 	%r4, 0x02ef, %r21
	.word 0xa810a26e  ! 73: OR_I	or 	%r2, 0x026e, %r20
	.word 0xb8008005  ! 73: ADD_R	add 	%r2, %r5, %r28
	.word 0xae008005  ! 73: ADD_R	add 	%r2, %r5, %r23
	.word 0x9c00af85  ! 73: ADD_I	add 	%r2, 0x0f85, %r14
	.word 0xa0018005  ! 73: ADD_R	add 	%r6, %r5, %r16
	.word 0xac110005  ! 73: OR_R	or 	%r4, %r5, %r22
	.word 0xa801e37c  ! 73: ADD_I	add 	%r7, 0x037c, %r20
	.word 0xb211a428  ! 73: OR_I	or 	%r6, 0x0428, %r25
	.word 0xae09c005  ! 73: AND_R	and 	%r7, %r5, %r23
	.word 0xae08ab56  ! 73: AND_I	and 	%r2, 0x0b56, %r23
	.word 0xa6018005  ! 73: ADD_R	add 	%r6, %r5, %r19
	.word 0xac1120de  ! 73: OR_I	or 	%r4, 0x00de, %r22
	.word 0xb408ee3b  ! 73: AND_I	and 	%r3, 0x0e3b, %r26
	.word 0xb0110005  ! 73: OR_R	or 	%r4, %r5, %r24
	.word 0xb2008005  ! 73: ADD_R	add 	%r2, %r5, %r25
	.word 0xb60123f5  ! 73: ADD_I	add 	%r4, 0x03f5, %r27
	.word 0xb600eca7  ! 73: ADD_I	add 	%r3, 0x0ca7, %r27
	.word 0xa810aa72  ! 73: OR_I	or 	%r2, 0x0a72, %r20
	.word 0xa6090005  ! 73: AND_R	and 	%r4, %r5, %r19
	.word 0xba00e2eb  ! 73: ADD_I	add 	%r3, 0x02eb, %r29
	.word 0xbc118005  ! 73: OR_R	or 	%r6, %r5, %r30
	.word 0xa601242d  ! 73: ADD_I	add 	%r4, 0x042d, %r19
	.word 0xb200c005  ! 73: ADD_R	add 	%r3, %r5, %r25
	.word 0xa0108005  ! 73: OR_R	or 	%r2, %r5, %r16
	.word 0x9a00c005  ! 73: ADD_R	add 	%r3, %r5, %r13
	.word 0xaa092e69  ! 73: AND_I	and 	%r4, 0x0e69, %r21
	.word 0xb800a519  ! 73: ADD_I	add 	%r2, 0x0519, %r28
	.word 0x9c008005  ! 73: ADD_R	add 	%r2, %r5, %r14
	.word 0xb200c005  ! 73: ADD_R	add 	%r3, %r5, %r25
	.word 0xb208a9ad  ! 73: AND_I	and 	%r2, 0x09ad, %r25
	.word 0x9e09e99f  ! 73: AND_I	and 	%r7, 0x099f, %r15
	.word 0xbe018005  ! 73: ADD_R	add 	%r6, %r5, %r31
	.word 0xa8018005  ! 73: ADD_R	add 	%r6, %r5, %r20
	.word 0x9a08c005  ! 73: AND_R	and 	%r3, %r5, %r13
	.word 0xb001aa2b  ! 73: ADD_I	add 	%r6, 0x0a2b, %r24
	.word 0xf421a808  ! 73: STW_I	stw	%r26, [%r6 + 0x0808]
	.word 0xf631e824  ! 73: STH_I	sth	%r27, [%r7 + 0x0824]
	.word 0xf620ab98  ! 73: STW_I	stw	%r27, [%r2 + 0x0b98]
	.word 0xe470a310  ! 73: STX_I	stx	%r18, [%r2 + 0x0310]
IRF_CE_38:
!$EV error(2,expr(@VA(.MAIN.IRF_CE_38), 16, 16), 1,IRF,ce,29,x, x,x,x, x,x,x)
!$EV error(2,expr(@VA(.MAIN.IRF_CE_38), 16, 16), 3,IRF,ce,19,x, x,x,x, x,x,x)
	.word 0xec28a144  ! 73: STB_I	stb	%r22, [%r2 + 0x0144]
	.word 0xe621e3bc  ! 73: STW_I	stw	%r19, [%r7 + 0x03bc]
	.word 0xe470a228  ! 73: STX_I	stx	%r18, [%r2 + 0x0228]
	.word 0xe121c005  ! 73: STF_R	st	%f16, [%r5, %r7]
	.word 0xaa11c005  ! 73: OR_R	or 	%r7, %r5, %r21
	.word 0xb009c005  ! 73: AND_R	and 	%r7, %r5, %r24
	bne thr2_loop_9
	subcc %g1, 0x1, %g1
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr2_loop_10:
	.word 0xb4088005  ! 80: AND_R	and 	%r2, %r5, %r26
	.word 0xa410e17b  ! 80: OR_I	or 	%r3, 0x017b, %r18
	.word 0xb000a2e5  ! 80: ADD_I	add 	%r2, 0x02e5, %r24
	.word 0xba10e3ac  ! 80: OR_I	or 	%r3, 0x03ac, %r29
	.word 0x9c09c005  ! 80: AND_R	and 	%r7, %r5, %r14
	.word 0xb609a4f6  ! 80: AND_I	and 	%r6, 0x04f6, %r27
	.word 0xa008e594  ! 80: AND_I	and 	%r3, 0x0594, %r16
	.word 0xb401e6ae  ! 80: ADD_I	add 	%r7, 0x06ae, %r26
	.word 0xbc012ed2  ! 80: ADD_I	add 	%r4, 0x0ed2, %r30
	.word 0xae11eb02  ! 80: OR_I	or 	%r7, 0x0b02, %r23
	.word 0x9a08a245  ! 80: AND_I	and 	%r2, 0x0245, %r13
	.word 0xb808ea35  ! 80: AND_I	and 	%r3, 0x0a35, %r28
	.word 0x9c008005  ! 80: ADD_R	add 	%r2, %r5, %r14
	.word 0xac0922bf  ! 80: AND_I	and 	%r4, 0x02bf, %r22
	.word 0xac00aca9  ! 80: ADD_I	add 	%r2, 0x0ca9, %r22
	.word 0xb611243e  ! 80: OR_I	or 	%r4, 0x043e, %r27
	.word 0x9c10a5fa  ! 80: OR_I	or 	%r2, 0x05fa, %r14
	.word 0xba10ab80  ! 80: OR_I	or 	%r2, 0x0b80, %r29
	.word 0xba11c005  ! 80: OR_R	or 	%r7, %r5, %r29
	.word 0xa808a124  ! 80: AND_I	and 	%r2, 0x0124, %r20
	.word 0x9c10c005  ! 80: OR_R	or 	%r3, %r5, %r14
	.word 0xb4010005  ! 80: ADD_R	add 	%r4, %r5, %r26
	.word 0xba11c005  ! 80: OR_R	or 	%r7, %r5, %r29
	.word 0x9a108005  ! 80: OR_R	or 	%r2, %r5, %r13
	.word 0xa2112e3c  ! 80: OR_I	or 	%r4, 0x0e3c, %r17
	.word 0xa809ae6e  ! 80: AND_I	and 	%r6, 0x0e6e, %r20
	.word 0xb409c005  ! 80: AND_R	and 	%r7, %r5, %r26
	.word 0xa6008005  ! 80: ADD_R	add 	%r2, %r5, %r19
	.word 0xb00121b7  ! 80: ADD_I	add 	%r4, 0x01b7, %r24
	.word 0xbe11c005  ! 80: OR_R	or 	%r7, %r5, %r31
	.word 0xaa01a3db  ! 80: ADD_I	add 	%r6, 0x03db, %r21
	.word 0x9c092cb8  ! 80: AND_I	and 	%r4, 0x0cb8, %r14
	.word 0xa2088005  ! 80: AND_R	and 	%r2, %r5, %r17
	.word 0xa600af23  ! 80: ADD_I	add 	%r2, 0x0f23, %r19
	.word 0xaa11a640  ! 80: OR_I	or 	%r6, 0x0640, %r21
	.word 0xb4088005  ! 80: AND_R	and 	%r2, %r5, %r26
	.word 0x9e11e9a1  ! 80: OR_I	or 	%r7, 0x09a1, %r15
	.word 0xac09a33e  ! 80: AND_I	and 	%r6, 0x033e, %r22
	.word 0x9c10a976  ! 80: OR_I	or 	%r2, 0x0976, %r14
	.word 0xb801c005  ! 80: ADD_R	add 	%r7, %r5, %r28
	.word 0x9e112ac6  ! 80: OR_I	or 	%r4, 0x0ac6, %r15
	.word 0xb608ea3a  ! 80: AND_I	and 	%r3, 0x0a3a, %r27
	.word 0xb810c005  ! 80: OR_R	or 	%r3, %r5, %r28
	.word 0xa001e1a4  ! 80: ADD_I	add 	%r7, 0x01a4, %r16
	.word 0x9a09c005  ! 80: AND_R	and 	%r7, %r5, %r13
	.word 0xb811c005  ! 80: OR_R	or 	%r7, %r5, %r28
	.word 0xb810c005  ! 80: OR_R	or 	%r3, %r5, %r28
	.word 0xa0108005  ! 80: OR_R	or 	%r2, %r5, %r16
	.word 0xba090005  ! 80: AND_R	and 	%r4, %r5, %r29
	.word 0xb601e09b  ! 80: ADD_I	add 	%r7, 0x009b, %r27
	.word 0xa6108005  ! 80: OR_R	or 	%r2, %r5, %r19
	.word 0xb609a428  ! 80: AND_I	and 	%r6, 0x0428, %r27
	.word 0xb6108005  ! 80: OR_R	or 	%r2, %r5, %r27
	.word 0xa401aa78  ! 80: ADD_I	add 	%r6, 0x0a78, %r18
	.word 0xb411a6bd  ! 80: OR_I	or 	%r6, 0x06bd, %r26
	.word 0xaa108005  ! 80: OR_R	or 	%r2, %r5, %r21
	.word 0xa8098005  ! 80: AND_R	and 	%r6, %r5, %r20
	.word 0x9c00ecab  ! 80: ADD_I	add 	%r3, 0x0cab, %r14
	.word 0xa8092512  ! 80: AND_I	and 	%r4, 0x0512, %r20
	.word 0xbe00e9c9  ! 80: ADD_I	add 	%r3, 0x09c9, %r31
	.word 0x9a01aefe  ! 80: ADD_I	add 	%r6, 0x0efe, %r13
	.word 0xa601e054  ! 80: ADD_I	add 	%r7, 0x0054, %r19
	.word 0xae01a2d4  ! 80: ADD_I	add 	%r6, 0x02d4, %r23
	.word 0x9a118005  ! 80: OR_R	or 	%r6, %r5, %r13
	.word 0xa8118005  ! 80: OR_R	or 	%r6, %r5, %r20
	.word 0xbe108005  ! 80: OR_R	or 	%r2, %r5, %r31
	.word 0xa809c005  ! 80: AND_R	and 	%r7, %r5, %r20
	.word 0xa611c005  ! 80: OR_R	or 	%r7, %r5, %r19
	.word 0xa400a494  ! 80: ADD_I	add 	%r2, 0x0494, %r18
	.word 0xb8088005  ! 80: AND_R	and 	%r2, %r5, %r28
	.word 0xb809ae8a  ! 80: AND_I	and 	%r6, 0x0e8a, %r28
	.word 0x9a11a882  ! 80: OR_I	or 	%r6, 0x0882, %r13
	.word 0xb6110005  ! 80: OR_R	or 	%r4, %r5, %r27
	.word 0xa600e9a8  ! 80: ADD_I	add 	%r3, 0x09a8, %r19
	.word 0xa8108005  ! 80: OR_R	or 	%r2, %r5, %r20
	.word 0xba108005  ! 80: OR_R	or 	%r2, %r5, %r29
	.word 0xa6010005  ! 80: ADD_R	add 	%r4, %r5, %r19
	.word 0xbc00ae64  ! 80: ADD_I	add 	%r2, 0x0e64, %r30
	.word 0x9e110005  ! 80: OR_R	or 	%r4, %r5, %r15
	.word 0xa408adb0  ! 80: AND_I	and 	%r2, 0x0db0, %r18
	.word 0x9e09e0f7  ! 80: AND_I	and 	%r7, 0x00f7, %r15
	.word 0xa41121da  ! 80: OR_I	or 	%r4, 0x01da, %r18
	.word 0x9c088005  ! 80: AND_R	and 	%r2, %r5, %r14
	.word 0x9c01a06c  ! 80: ADD_I	add 	%r6, 0x006c, %r14
	.word 0x9e11e7d9  ! 80: OR_I	or 	%r7, 0x07d9, %r15
	.word 0x9e008005  ! 80: ADD_R	add 	%r2, %r5, %r15
	.word 0xb610a1b4  ! 80: OR_I	or 	%r2, 0x01b4, %r27
	.word 0x9a10a8f6  ! 80: OR_I	or 	%r2, 0x08f6, %r13
	.word 0xb811abe6  ! 80: OR_I	or 	%r6, 0x0be6, %r28
	.word 0xb008c005  ! 80: AND_R	and 	%r3, %r5, %r24
	.word 0xa201ab1b  ! 80: ADD_I	add 	%r6, 0x0b1b, %r17
	.word 0xa2008005  ! 80: ADD_R	add 	%r2, %r5, %r17
	.word 0xb0088005  ! 80: AND_R	and 	%r2, %r5, %r24
	.word 0xbe08e374  ! 80: AND_I	and 	%r3, 0x0374, %r31
	.word 0xa009aa19  ! 80: AND_I	and 	%r6, 0x0a19, %r16
	.word 0xaa108005  ! 80: OR_R	or 	%r2, %r5, %r21
	.word 0xa008e2b8  ! 80: AND_I	and 	%r3, 0x02b8, %r16
	.word 0xb600e544  ! 80: ADD_I	add 	%r3, 0x0544, %r27
	.word 0x9c00a5f5  ! 80: ADD_I	add 	%r2, 0x05f5, %r14
	.word 0x9e01e10b  ! 80: ADD_I	add 	%r7, 0x010b, %r15
	.word 0x9e10c005  ! 80: OR_R	or 	%r3, %r5, %r15
	.word 0xba09ea06  ! 80: AND_I	and 	%r7, 0x0a06, %r29
	.word 0xa000c005  ! 80: ADD_R	add 	%r3, %r5, %r16
	.word 0x9e08a35d  ! 80: AND_I	and 	%r2, 0x035d, %r15
	.word 0x9e00c005  ! 80: ADD_R	add 	%r3, %r5, %r15
	.word 0xbc110005  ! 80: OR_R	or 	%r4, %r5, %r30
	.word 0xb210c005  ! 80: OR_R	or 	%r3, %r5, %r25
	.word 0xa6008005  ! 80: ADD_R	add 	%r2, %r5, %r19
	.word 0x9e01c005  ! 80: ADD_R	add 	%r7, %r5, %r15
	.word 0x9e08e17b  ! 80: AND_I	and 	%r3, 0x017b, %r15
	.word 0xaa11c005  ! 80: OR_R	or 	%r7, %r5, %r21
	.word 0xa808c005  ! 80: AND_R	and 	%r3, %r5, %r20
	.word 0x9a108005  ! 80: OR_R	or 	%r2, %r5, %r13
	.word 0xb8010005  ! 80: ADD_R	add 	%r4, %r5, %r28
	.word 0xa600c005  ! 80: ADD_R	add 	%r3, %r5, %r19
	.word 0xb0108005  ! 80: OR_R	or 	%r2, %r5, %r24
	.word 0xba108005  ! 80: OR_R	or 	%r2, %r5, %r29
	.word 0x9c09c005  ! 80: AND_R	and 	%r7, %r5, %r14
	.word 0x9a09e705  ! 80: AND_I	and 	%r7, 0x0705, %r13
	.word 0xbe10a000  ! 80: OR_I	or 	%r2, 0x0000, %r31
	.word 0xa6018005  ! 80: ADD_R	add 	%r6, %r5, %r19
	.word 0x9c11ee42  ! 80: OR_I	or 	%r7, 0x0e42, %r14
	.word 0x9c11c005  ! 80: OR_R	or 	%r7, %r5, %r14
	.word 0xa808e442  ! 80: AND_I	and 	%r3, 0x0442, %r20
	.word 0xba11afbc  ! 80: OR_I	or 	%r6, 0x0fbc, %r29
	.word 0xaa10e461  ! 80: OR_I	or 	%r3, 0x0461, %r21
	.word 0xac00c005  ! 80: ADD_R	add 	%r3, %r5, %r22
	.word 0xa200aacd  ! 80: ADD_I	add 	%r2, 0x0acd, %r17
	.word 0xb2098005  ! 80: AND_R	and 	%r6, %r5, %r25
	.word 0xa6088005  ! 80: AND_R	and 	%r2, %r5, %r19
	.word 0xa408e578  ! 80: AND_I	and 	%r3, 0x0578, %r18
	.word 0xb6092b9d  ! 80: AND_I	and 	%r4, 0x0b9d, %r27
	.word 0x9e108005  ! 80: OR_R	or 	%r2, %r5, %r15
	.word 0xa2092e14  ! 80: AND_I	and 	%r4, 0x0e14, %r17
	.word 0xa8088005  ! 80: AND_R	and 	%r2, %r5, %r20
	.word 0xa0008005  ! 80: ADD_R	add 	%r2, %r5, %r16
	.word 0xa4090005  ! 80: AND_R	and 	%r4, %r5, %r18
	.word 0xae08a0e3  ! 80: AND_I	and 	%r2, 0x00e3, %r23
	.word 0x9a10a4e3  ! 80: OR_I	or 	%r2, 0x04e3, %r13
	.word 0xbe08c005  ! 80: AND_R	and 	%r3, %r5, %r31
	.word 0x9e10ea0a  ! 80: OR_I	or 	%r3, 0x0a0a, %r15
	.word 0x9a108005  ! 80: OR_R	or 	%r2, %r5, %r13
	.word 0xa6090005  ! 80: AND_R	and 	%r4, %r5, %r19
	.word 0xbe10e34a  ! 80: OR_I	or 	%r3, 0x034a, %r31
	.word 0xbc108005  ! 80: OR_R	or 	%r2, %r5, %r30
	.word 0xb0008005  ! 80: ADD_R	add 	%r2, %r5, %r24
	.word 0xba018005  ! 80: ADD_R	add 	%r6, %r5, %r29
	.word 0xa4118005  ! 80: OR_R	or 	%r6, %r5, %r18
	.word 0x9a090005  ! 80: AND_R	and 	%r4, %r5, %r13
	.word 0xa808eb29  ! 80: AND_I	and 	%r3, 0x0b29, %r20
	.word 0xb609abb2  ! 80: AND_I	and 	%r6, 0x0bb2, %r27
	.word 0x9a11ee9e  ! 80: OR_I	or 	%r7, 0x0e9e, %r13
	.word 0xfc21e180  ! 80: STW_I	stw	%r30, [%r7 + 0x0180]
	.word 0xee71ed10  ! 80: STX_I	stx	%r23, [%r7 + 0x0d10]
	.word 0xea28a1e0  ! 80: STB_I	stb	%r21, [%r2 + 0x01e0]
	.word 0xe630ef90  ! 80: STH_I	sth	%r19, [%r3 + 0x0f90]
IRF_CE_42:
!$EV error(2,expr(@VA(.MAIN.IRF_CE_42), 16, 16), 1,IRF,ce,49,x, x,x,x, x,x,x)
!$EV error(2,expr(@VA(.MAIN.IRF_CE_42), 16, 16), 3,IRF,ce,45,x, x,x,x, x,x,x)
	.word 0xf420a43c  ! 80: STW_I	stw	%r26, [%r2 + 0x043c]
	.word 0xf870ee88  ! 80: STX_I	stx	%r28, [%r3 + 0x0e88]
	.word 0xdc70ec98  ! 80: STX_I	stx	%r14, [%r3 + 0x0c98]
	.word 0xfc788005  ! 80: SWAP_R	swap	%r30, [%r2 + %r5]
	.word 0xac00a45c  ! 80: ADD_I	add 	%r2, 0x045c, %r22
	.word 0xa2008005  ! 80: ADD_R	add 	%r2, %r5, %r17
	bne thr2_loop_10
	subcc %g1, 0x1, %g1
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr2_loop_11:
	.word 0xa6088005  ! 88: AND_R	and 	%r2, %r5, %r19
	.word 0xbc00aa4c  ! 88: ADD_I	add 	%r2, 0x0a4c, %r30
	.word 0xa0090005  ! 88: AND_R	and 	%r4, %r5, %r16
	.word 0xba11e658  ! 88: OR_I	or 	%r7, 0x0658, %r29
	.word 0xbc08a635  ! 88: AND_I	and 	%r2, 0x0635, %r30
	.word 0xb6008005  ! 88: ADD_R	add 	%r2, %r5, %r27
	.word 0xb410ab37  ! 88: OR_I	or 	%r2, 0x0b37, %r26
	.word 0xb2088005  ! 88: AND_R	and 	%r2, %r5, %r25
	.word 0xb600ae31  ! 88: ADD_I	add 	%r2, 0x0e31, %r27
	.word 0xa608ab34  ! 88: AND_I	and 	%r2, 0x0b34, %r19
	.word 0x9a09c005  ! 88: AND_R	and 	%r7, %r5, %r13
	.word 0xa0018005  ! 88: ADD_R	add 	%r6, %r5, %r16
	.word 0x9c01225b  ! 88: ADD_I	add 	%r4, 0x025b, %r14
	.word 0x9a088005  ! 88: AND_R	and 	%r2, %r5, %r13
	.word 0xa6008005  ! 88: ADD_R	add 	%r2, %r5, %r19
	.word 0xae10ab7e  ! 88: OR_I	or 	%r2, 0x0b7e, %r23
	.word 0x9e09c005  ! 88: AND_R	and 	%r7, %r5, %r15
	.word 0xbc09ab45  ! 88: AND_I	and 	%r6, 0x0b45, %r30
	.word 0xaa10a8f6  ! 88: OR_I	or 	%r2, 0x08f6, %r21
	.word 0x9a01c005  ! 88: ADD_R	add 	%r7, %r5, %r13
	.word 0xbc018005  ! 88: ADD_R	add 	%r6, %r5, %r30
	.word 0xb008a49a  ! 88: AND_I	and 	%r2, 0x049a, %r24
	.word 0xbe012713  ! 88: ADD_I	add 	%r4, 0x0713, %r31
	.word 0xa201a290  ! 88: ADD_I	add 	%r6, 0x0290, %r17
	.word 0xa4010005  ! 88: ADD_R	add 	%r4, %r5, %r18
	.word 0xa8108005  ! 88: OR_R	or 	%r2, %r5, %r20
	.word 0xa2088005  ! 88: AND_R	and 	%r2, %r5, %r17
	.word 0xac09acaa  ! 88: AND_I	and 	%r6, 0x0caa, %r22
	.word 0xaa11207e  ! 88: OR_I	or 	%r4, 0x007e, %r21
	.word 0xbe11e8c7  ! 88: OR_I	or 	%r7, 0x08c7, %r31
	.word 0xbe11af85  ! 88: OR_I	or 	%r6, 0x0f85, %r31
	.word 0xae108005  ! 88: OR_R	or 	%r2, %r5, %r23
	.word 0xac01e5ca  ! 88: ADD_I	add 	%r7, 0x05ca, %r22
	.word 0xa411edd6  ! 88: OR_I	or 	%r7, 0x0dd6, %r18
	.word 0x9e012040  ! 88: ADD_I	add 	%r4, 0x0040, %r15
	.word 0x9e10ab5f  ! 88: OR_I	or 	%r2, 0x0b5f, %r15
	.word 0x9a11c005  ! 88: OR_R	or 	%r7, %r5, %r13
	.word 0xb4090005  ! 88: AND_R	and 	%r4, %r5, %r26
	.word 0xba00abaa  ! 88: ADD_I	add 	%r2, 0x0baa, %r29
	.word 0x9a09e5c5  ! 88: AND_I	and 	%r7, 0x05c5, %r13
	.word 0x9a018005  ! 88: ADD_R	add 	%r6, %r5, %r13
	.word 0xb0110005  ! 88: OR_R	or 	%r4, %r5, %r24
	.word 0xba10a638  ! 88: OR_I	or 	%r2, 0x0638, %r29
	.word 0xa011a100  ! 88: OR_I	or 	%r6, 0x0100, %r16
	.word 0x9e00ef6f  ! 88: ADD_I	add 	%r3, 0x0f6f, %r15
	.word 0xb011ec62  ! 88: OR_I	or 	%r7, 0x0c62, %r24
	.word 0xb609ed67  ! 88: AND_I	and 	%r7, 0x0d67, %r27
	.word 0xbc108005  ! 88: OR_R	or 	%r2, %r5, %r30
	.word 0xae088005  ! 88: AND_R	and 	%r2, %r5, %r23
	.word 0xae00a9c0  ! 88: ADD_I	add 	%r2, 0x09c0, %r23
	.word 0xba0121c0  ! 88: ADD_I	add 	%r4, 0x01c0, %r29
	.word 0x9a10e752  ! 88: OR_I	or 	%r3, 0x0752, %r13
	.word 0xbc11c005  ! 88: OR_R	or 	%r7, %r5, %r30
	.word 0xa010aa63  ! 88: OR_I	or 	%r2, 0x0a63, %r16
	.word 0x9e108005  ! 88: OR_R	or 	%r2, %r5, %r15
	.word 0x9e10a185  ! 88: OR_I	or 	%r2, 0x0185, %r15
	.word 0xb4110005  ! 88: OR_R	or 	%r4, %r5, %r26
	.word 0xaa08a482  ! 88: AND_I	and 	%r2, 0x0482, %r21
	.word 0xa4088005  ! 88: AND_R	and 	%r2, %r5, %r18
	.word 0xa208a4f1  ! 88: AND_I	and 	%r2, 0x04f1, %r17
	.word 0xb4090005  ! 88: AND_R	and 	%r4, %r5, %r26
	.word 0xa009c005  ! 88: AND_R	and 	%r7, %r5, %r16
	.word 0xa008c005  ! 88: AND_R	and 	%r3, %r5, %r16
	.word 0xb810a329  ! 88: OR_I	or 	%r2, 0x0329, %r28
	.word 0xb2088005  ! 88: AND_R	and 	%r2, %r5, %r25
	.word 0x9e09a98f  ! 88: AND_I	and 	%r6, 0x098f, %r15
	.word 0x9e10a2ff  ! 88: OR_I	or 	%r2, 0x02ff, %r15
	.word 0xae09e6c2  ! 88: AND_I	and 	%r7, 0x06c2, %r23
	.word 0xb410a8ae  ! 88: OR_I	or 	%r2, 0x08ae, %r26
	.word 0xa6110005  ! 88: OR_R	or 	%r4, %r5, %r19
	.word 0x9c09c005  ! 88: AND_R	and 	%r7, %r5, %r14
	.word 0xb409e570  ! 88: AND_I	and 	%r7, 0x0570, %r26
	.word 0xa4012cb3  ! 88: ADD_I	add 	%r4, 0x0cb3, %r18
	.word 0xb601a6ce  ! 88: ADD_I	add 	%r6, 0x06ce, %r27
	.word 0xbe090005  ! 88: AND_R	and 	%r4, %r5, %r31
	.word 0x9e11a12a  ! 88: OR_I	or 	%r6, 0x012a, %r15
	.word 0xb6012000  ! 88: ADD_I	add 	%r4, 0x0000, %r27
	.word 0xb600a940  ! 88: ADD_I	add 	%r2, 0x0940, %r27
	.word 0xb000ab51  ! 88: ADD_I	add 	%r2, 0x0b51, %r24
	.word 0xa801c005  ! 88: ADD_R	add 	%r7, %r5, %r20
	.word 0xa801c005  ! 88: ADD_R	add 	%r7, %r5, %r20
	.word 0x9e11e7db  ! 88: OR_I	or 	%r7, 0x07db, %r15
	.word 0x9a10e354  ! 88: OR_I	or 	%r3, 0x0354, %r13
	.word 0xa0090005  ! 88: AND_R	and 	%r4, %r5, %r16
	.word 0xb8088005  ! 88: AND_R	and 	%r2, %r5, %r28
	.word 0xac11c005  ! 88: OR_R	or 	%r7, %r5, %r22
	.word 0xae11e22c  ! 88: OR_I	or 	%r7, 0x022c, %r23
	.word 0xa601af67  ! 88: ADD_I	add 	%r6, 0x0f67, %r19
	.word 0xa409a4f7  ! 88: AND_I	and 	%r6, 0x04f7, %r18
	.word 0xbe110005  ! 88: OR_R	or 	%r4, %r5, %r31
	.word 0xb008af9f  ! 88: AND_I	and 	%r2, 0x0f9f, %r24
	.word 0xb8012f72  ! 88: ADD_I	add 	%r4, 0x0f72, %r28
	.word 0xa0090005  ! 88: AND_R	and 	%r4, %r5, %r16
	.word 0xba08ad6d  ! 88: AND_I	and 	%r2, 0x0d6d, %r29
	.word 0xa6092813  ! 88: AND_I	and 	%r4, 0x0813, %r19
	.word 0xb200a807  ! 88: ADD_I	add 	%r2, 0x0807, %r25
	.word 0xba09a44d  ! 88: AND_I	and 	%r6, 0x044d, %r29
	.word 0xbe08efac  ! 88: AND_I	and 	%r3, 0x0fac, %r31
	.word 0xa2108005  ! 88: OR_R	or 	%r2, %r5, %r17
	.word 0xba11c005  ! 88: OR_R	or 	%r7, %r5, %r29
	.word 0xa801a3e1  ! 88: ADD_I	add 	%r6, 0x03e1, %r20
	.word 0xbc018005  ! 88: ADD_R	add 	%r6, %r5, %r30
	.word 0x9c09a6d6  ! 88: AND_I	and 	%r6, 0x06d6, %r14
	.word 0xb2108005  ! 88: OR_R	or 	%r2, %r5, %r25
	.word 0xb410a781  ! 88: OR_I	or 	%r2, 0x0781, %r26
	.word 0xb8088005  ! 88: AND_R	and 	%r2, %r5, %r28
	.word 0xba112964  ! 88: OR_I	or 	%r4, 0x0964, %r29
	.word 0x9c11c005  ! 88: OR_R	or 	%r7, %r5, %r14
	.word 0xaa00abe6  ! 88: ADD_I	add 	%r2, 0x0be6, %r21
	.word 0xb209c005  ! 88: AND_R	and 	%r7, %r5, %r25
	.word 0xa2088005  ! 88: AND_R	and 	%r2, %r5, %r17
	.word 0x9c11a9be  ! 88: OR_I	or 	%r6, 0x09be, %r14
	.word 0xbe092c4d  ! 88: AND_I	and 	%r4, 0x0c4d, %r31
	.word 0x9c092463  ! 88: AND_I	and 	%r4, 0x0463, %r14
	.word 0xae010005  ! 88: ADD_R	add 	%r4, %r5, %r23
	.word 0xa601c005  ! 88: ADD_R	add 	%r7, %r5, %r19
	.word 0xb208eea6  ! 88: AND_I	and 	%r3, 0x0ea6, %r25
	.word 0xa2118005  ! 88: OR_R	or 	%r6, %r5, %r17
	.word 0x9e09eb55  ! 88: AND_I	and 	%r7, 0x0b55, %r15
	.word 0xae10aab3  ! 88: OR_I	or 	%r2, 0x0ab3, %r23
	.word 0xa808af0e  ! 88: AND_I	and 	%r2, 0x0f0e, %r20
	.word 0xb409a539  ! 88: AND_I	and 	%r6, 0x0539, %r26
	.word 0xb610c005  ! 88: OR_R	or 	%r3, %r5, %r27
	.word 0xac11c005  ! 88: OR_R	or 	%r7, %r5, %r22
	.word 0xbe018005  ! 88: ADD_R	add 	%r6, %r5, %r31
	.word 0x9c108005  ! 88: OR_R	or 	%r2, %r5, %r14
	.word 0xae0929da  ! 88: AND_I	and 	%r4, 0x09da, %r23
	.word 0x9e08aebb  ! 88: AND_I	and 	%r2, 0x0ebb, %r15
	.word 0xac11ac26  ! 88: OR_I	or 	%r6, 0x0c26, %r22
	.word 0xa2018005  ! 88: ADD_R	add 	%r6, %r5, %r17
	.word 0xac01a25a  ! 88: ADD_I	add 	%r6, 0x025a, %r22
	.word 0xb8110005  ! 88: OR_R	or 	%r4, %r5, %r28
	.word 0xb6088005  ! 88: AND_R	and 	%r2, %r5, %r27
	.word 0xbc088005  ! 88: AND_R	and 	%r2, %r5, %r30
	.word 0xa0108005  ! 88: OR_R	or 	%r2, %r5, %r16
	.word 0xb000a747  ! 88: ADD_I	add 	%r2, 0x0747, %r24
	.word 0x9a098005  ! 88: AND_R	and 	%r6, %r5, %r13
	.word 0xac088005  ! 88: AND_R	and 	%r2, %r5, %r22
	.word 0xaa118005  ! 88: OR_R	or 	%r6, %r5, %r21
	.word 0xb0098005  ! 88: AND_R	and 	%r6, %r5, %r24
	.word 0xb2088005  ! 88: AND_R	and 	%r2, %r5, %r25
	.word 0xa408e6ce  ! 88: AND_I	and 	%r3, 0x06ce, %r18
	.word 0xae01c005  ! 88: ADD_R	add 	%r7, %r5, %r23
	.word 0xaa110005  ! 88: OR_R	or 	%r4, %r5, %r21
	.word 0x9a00c005  ! 88: ADD_R	add 	%r3, %r5, %r13
	.word 0xb008a70b  ! 88: AND_I	and 	%r2, 0x070b, %r24
	.word 0xa8008005  ! 88: ADD_R	add 	%r2, %r5, %r20
	.word 0xb0110005  ! 88: OR_R	or 	%r4, %r5, %r24
	.word 0xae090005  ! 88: AND_R	and 	%r4, %r5, %r23
	.word 0xa809c005  ! 88: AND_R	and 	%r7, %r5, %r20
	.word 0xac098005  ! 88: AND_R	and 	%r6, %r5, %r22
	.word 0xb410c005  ! 88: OR_R	or 	%r3, %r5, %r26
	.word 0xa01122e6  ! 88: OR_I	or 	%r4, 0x02e6, %r16
	.word 0x9c112a94  ! 88: OR_I	or 	%r4, 0x0a94, %r14
	.word 0xb4108005  ! 88: OR_R	or 	%r2, %r5, %r26
	.word 0xa600a484  ! 88: ADD_I	add 	%r2, 0x0484, %r19
	.word 0xa008c005  ! 88: AND_R	and 	%r3, %r5, %r16
	.word 0xb0092cb3  ! 88: AND_I	and 	%r4, 0x0cb3, %r24
	.word 0xac09c005  ! 88: AND_R	and 	%r7, %r5, %r22
	.word 0xae088005  ! 88: AND_R	and 	%r2, %r5, %r23
	.word 0x9a118005  ! 88: OR_R	or 	%r6, %r5, %r13
	.word 0xb6118005  ! 88: OR_R	or 	%r6, %r5, %r27
	.word 0xa81120f2  ! 88: OR_I	or 	%r4, 0x00f2, %r20
	.word 0xb8112df7  ! 88: OR_I	or 	%r4, 0x0df7, %r28
	.word 0x9e088005  ! 88: AND_R	and 	%r2, %r5, %r15
	.word 0xbe00c005  ! 88: ADD_R	add 	%r3, %r5, %r31
	.word 0xb4008005  ! 88: ADD_R	add 	%r2, %r5, %r26
	.word 0xa608ac5a  ! 88: AND_I	and 	%r2, 0x0c5a, %r19
	.word 0xb610e135  ! 88: OR_I	or 	%r3, 0x0135, %r27
	.word 0xac092b19  ! 88: AND_I	and 	%r4, 0x0b19, %r22
	.word 0xb411ee35  ! 88: OR_I	or 	%r7, 0x0e35, %r26
	.word 0xba09211a  ! 88: AND_I	and 	%r4, 0x011a, %r29
	.word 0xb008e507  ! 88: AND_I	and 	%r3, 0x0507, %r24
	.word 0xbc10ef60  ! 88: OR_I	or 	%r3, 0x0f60, %r30
	.word 0xa408a0fc  ! 88: AND_I	and 	%r2, 0x00fc, %r18
	.word 0xae010005  ! 88: ADD_R	add 	%r4, %r5, %r23
	.word 0xac10c005  ! 88: OR_R	or 	%r3, %r5, %r22
	.word 0xa2010005  ! 88: ADD_R	add 	%r4, %r5, %r17
	.word 0xa0108005  ! 88: OR_R	or 	%r2, %r5, %r16
	.word 0x9c08a145  ! 88: AND_I	and 	%r2, 0x0145, %r14
	.word 0xba090005  ! 88: AND_R	and 	%r4, %r5, %r29
	.word 0xbe090005  ! 88: AND_R	and 	%r4, %r5, %r31
	.word 0xb611c005  ! 88: OR_R	or 	%r7, %r5, %r27
	.word 0xbe11ad1c  ! 88: OR_I	or 	%r6, 0x0d1c, %r31
	.word 0xde212058  ! 88: STW_I	stw	%r15, [%r4 + 0x0058]
	.word 0xe271adc8  ! 88: STX_I	stx	%r17, [%r6 + 0x0dc8]
	.word 0xf228e030  ! 88: STB_I	stb	%r25, [%r3 + 0x0030]
	.word 0xea28a46a  ! 88: STB_I	stb	%r21, [%r2 + 0x046a]
IRF_CE_46:
!$EV error(2,expr(@VA(.MAIN.IRF_CE_46), 16, 16), 1,IRF,ce,24,x, x,x,x, x,x,x)
!$EV error(2,expr(@VA(.MAIN.IRF_CE_46), 16, 16), 3,IRF,ce,14,x, x,x,x, x,x,x)
	.word 0xe031e90c  ! 88: STH_I	sth	%r16, [%r7 + 0x090c]
	.word 0xf271a270  ! 88: STX_I	stx	%r25, [%r6 + 0x0270]
	.word 0xf6712af8  ! 88: STX_I	stx	%r27, [%r4 + 0x0af8]
	.word 0xd6f20ce8  ! 88: STXA_R	stxa	%r11, [%r8 + %r8] 0x67
	.word 0x9e11e4cb  ! 88: OR_I	or 	%r7, 0x04cb, %r15
	.word 0xb201c005  ! 88: ADD_R	add 	%r7, %r5, %r25
	bne thr2_loop_11
	subcc %g1, 0x1, %g1
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr2_loop_12:
	.word 0xae112696  ! 95: OR_I	or 	%r4, 0x0696, %r23
	.word 0xbc108005  ! 95: OR_R	or 	%r2, %r5, %r30
	.word 0xa209c005  ! 95: AND_R	and 	%r7, %r5, %r17
	.word 0xba018005  ! 95: ADD_R	add 	%r6, %r5, %r29
	.word 0xa411c005  ! 95: OR_R	or 	%r7, %r5, %r18
	.word 0xb4108005  ! 95: OR_R	or 	%r2, %r5, %r26
	.word 0xb0098005  ! 95: AND_R	and 	%r6, %r5, %r24
	.word 0xae10c005  ! 95: OR_R	or 	%r3, %r5, %r23
	.word 0xb009a279  ! 95: AND_I	and 	%r6, 0x0279, %r24
	.word 0xa610a547  ! 95: OR_I	or 	%r2, 0x0547, %r19
	.word 0x9e010005  ! 95: ADD_R	add 	%r4, %r5, %r15
	.word 0xb8092273  ! 95: AND_I	and 	%r4, 0x0273, %r28
	.word 0xb401c005  ! 95: ADD_R	add 	%r7, %r5, %r26
	.word 0xac09c005  ! 95: AND_R	and 	%r7, %r5, %r22
	.word 0xac09c005  ! 95: AND_R	and 	%r7, %r5, %r22
	.word 0x9e01a3ec  ! 95: ADD_I	add 	%r6, 0x03ec, %r15
	.word 0xaa090005  ! 95: AND_R	and 	%r4, %r5, %r21
	.word 0xa2008005  ! 95: ADD_R	add 	%r2, %r5, %r17
	.word 0xb008c005  ! 95: AND_R	and 	%r3, %r5, %r24
	.word 0xa209c005  ! 95: AND_R	and 	%r7, %r5, %r17
	.word 0xa201a68c  ! 95: ADD_I	add 	%r6, 0x068c, %r17
	.word 0xa808ef10  ! 95: AND_I	and 	%r3, 0x0f10, %r20
	.word 0xa6008005  ! 95: ADD_R	add 	%r2, %r5, %r19
	.word 0xae01c005  ! 95: ADD_R	add 	%r7, %r5, %r23
	.word 0x9a11eb8d  ! 95: OR_I	or 	%r7, 0x0b8d, %r13
	.word 0xb809ed72  ! 95: AND_I	and 	%r7, 0x0d72, %r28
	.word 0xa6092c0e  ! 95: AND_I	and 	%r4, 0x0c0e, %r19
	.word 0xae08e4e4  ! 95: AND_I	and 	%r3, 0x04e4, %r23
	.word 0xac10c005  ! 95: OR_R	or 	%r3, %r5, %r22
	.word 0xac1120cc  ! 95: OR_I	or 	%r4, 0x00cc, %r22
	.word 0xaa008005  ! 95: ADD_R	add 	%r2, %r5, %r21
	.word 0xac09e1c3  ! 95: AND_I	and 	%r7, 0x01c3, %r22
	.word 0xa808a8f6  ! 95: AND_I	and 	%r2, 0x08f6, %r20
	.word 0xba08a1c0  ! 95: AND_I	and 	%r2, 0x01c0, %r29
	.word 0xaa11aadb  ! 95: OR_I	or 	%r6, 0x0adb, %r21
	.word 0xb0010005  ! 95: ADD_R	add 	%r4, %r5, %r24
	.word 0xa6008005  ! 95: ADD_R	add 	%r2, %r5, %r19
	.word 0xa80127f6  ! 95: ADD_I	add 	%r4, 0x07f6, %r20
	.word 0xb0088005  ! 95: AND_R	and 	%r2, %r5, %r24
	.word 0xb801ab7f  ! 95: ADD_I	add 	%r6, 0x0b7f, %r28
	.word 0xaa08af3f  ! 95: AND_I	and 	%r2, 0x0f3f, %r21
	.word 0xae018005  ! 95: ADD_R	add 	%r6, %r5, %r23
	.word 0xa211c005  ! 95: OR_R	or 	%r7, %r5, %r17
	.word 0xaa008005  ! 95: ADD_R	add 	%r2, %r5, %r21
	.word 0xa611e6af  ! 95: OR_I	or 	%r7, 0x06af, %r19
	.word 0xb6010005  ! 95: ADD_R	add 	%r4, %r5, %r27
	.word 0xba008005  ! 95: ADD_R	add 	%r2, %r5, %r29
	.word 0xb809a4b5  ! 95: AND_I	and 	%r6, 0x04b5, %r28
	.word 0xa6088005  ! 95: AND_R	and 	%r2, %r5, %r19
	.word 0xbe090005  ! 95: AND_R	and 	%r4, %r5, %r31
	.word 0xbe092c31  ! 95: AND_I	and 	%r4, 0x0c31, %r31
	.word 0xa2008005  ! 95: ADD_R	add 	%r2, %r5, %r17
	.word 0xbe00e85a  ! 95: ADD_I	add 	%r3, 0x085a, %r31
	.word 0xa001af6a  ! 95: ADD_I	add 	%r6, 0x0f6a, %r16
	.word 0xae108005  ! 95: OR_R	or 	%r2, %r5, %r23
	.word 0xa0018005  ! 95: ADD_R	add 	%r6, %r5, %r16
	.word 0xbc108005  ! 95: OR_R	or 	%r2, %r5, %r30
	.word 0xaa108005  ! 95: OR_R	or 	%r2, %r5, %r21
	.word 0xaa118005  ! 95: OR_R	or 	%r6, %r5, %r21
	.word 0xb008c005  ! 95: AND_R	and 	%r3, %r5, %r24
	.word 0xbc010005  ! 95: ADD_R	add 	%r4, %r5, %r30
	.word 0xa8108005  ! 95: OR_R	or 	%r2, %r5, %r20
	.word 0xb800a8fe  ! 95: ADD_I	add 	%r2, 0x08fe, %r28
	.word 0xa0010005  ! 95: ADD_R	add 	%r4, %r5, %r16
	.word 0xb4090005  ! 95: AND_R	and 	%r4, %r5, %r26
	.word 0xa8088005  ! 95: AND_R	and 	%r2, %r5, %r20
	.word 0xae09ab04  ! 95: AND_I	and 	%r6, 0x0b04, %r23
	.word 0xaa09c005  ! 95: AND_R	and 	%r7, %r5, %r21
	.word 0xbe00af43  ! 95: ADD_I	add 	%r2, 0x0f43, %r31
	.word 0xa611c005  ! 95: OR_R	or 	%r7, %r5, %r19
	.word 0xb6018005  ! 95: ADD_R	add 	%r6, %r5, %r27
	.word 0xac11c005  ! 95: OR_R	or 	%r7, %r5, %r22
	.word 0xaa108005  ! 95: OR_R	or 	%r2, %r5, %r21
	.word 0xa610e091  ! 95: OR_I	or 	%r3, 0x0091, %r19
	.word 0x9e088005  ! 95: AND_R	and 	%r2, %r5, %r15
	.word 0xa401c005  ! 95: ADD_R	add 	%r7, %r5, %r18
	.word 0x9c088005  ! 95: AND_R	and 	%r2, %r5, %r14
	.word 0xb611c005  ! 95: OR_R	or 	%r7, %r5, %r27
	.word 0xac00aed7  ! 95: ADD_I	add 	%r2, 0x0ed7, %r22
	.word 0x9e098005  ! 95: AND_R	and 	%r6, %r5, %r15
	.word 0xa6108005  ! 95: OR_R	or 	%r2, %r5, %r19
	.word 0xb201aaba  ! 95: ADD_I	add 	%r6, 0x0aba, %r25
	.word 0xaa00c005  ! 95: ADD_R	add 	%r3, %r5, %r21
	.word 0xb209a23c  ! 95: AND_I	and 	%r6, 0x023c, %r25
	.word 0xac08e5a4  ! 95: AND_I	and 	%r3, 0x05a4, %r22
	.word 0xbc01a09a  ! 95: ADD_I	add 	%r6, 0x009a, %r30
	.word 0xb209c005  ! 95: AND_R	and 	%r7, %r5, %r25
	.word 0xaa0129d8  ! 95: ADD_I	add 	%r4, 0x09d8, %r21
	.word 0xb409c005  ! 95: AND_R	and 	%r7, %r5, %r26
	.word 0xbc00a6c2  ! 95: ADD_I	add 	%r2, 0x06c2, %r30
	.word 0xa6012287  ! 95: ADD_I	add 	%r4, 0x0287, %r19
	.word 0xb000a8f2  ! 95: ADD_I	add 	%r2, 0x08f2, %r24
	.word 0x9c090005  ! 95: AND_R	and 	%r4, %r5, %r14
	.word 0xaa08ac0e  ! 95: AND_I	and 	%r2, 0x0c0e, %r21
	.word 0xa8118005  ! 95: OR_R	or 	%r6, %r5, %r20
	.word 0xa008ad58  ! 95: AND_I	and 	%r2, 0x0d58, %r16
	.word 0x9c11e812  ! 95: OR_I	or 	%r7, 0x0812, %r14
	.word 0x9c11289c  ! 95: OR_I	or 	%r4, 0x089c, %r14
	.word 0xa401e2c5  ! 95: ADD_I	add 	%r7, 0x02c5, %r18
	.word 0xbc09c005  ! 95: AND_R	and 	%r7, %r5, %r30
	.word 0xae10a148  ! 95: OR_I	or 	%r2, 0x0148, %r23
	.word 0x9e11a182  ! 95: OR_I	or 	%r6, 0x0182, %r15
	.word 0xbc09a09a  ! 95: AND_I	and 	%r6, 0x009a, %r30
	.word 0xa8108005  ! 95: OR_R	or 	%r2, %r5, %r20
	.word 0xa400c005  ! 95: ADD_R	add 	%r3, %r5, %r18
	.word 0xb8088005  ! 95: AND_R	and 	%r2, %r5, %r28
	.word 0x9c08a3ab  ! 95: AND_I	and 	%r2, 0x03ab, %r14
	.word 0xa211c005  ! 95: OR_R	or 	%r7, %r5, %r17
	.word 0xb609e611  ! 95: AND_I	and 	%r7, 0x0611, %r27
	.word 0x9c01e44e  ! 95: ADD_I	add 	%r7, 0x044e, %r14
	.word 0xac11c005  ! 95: OR_R	or 	%r7, %r5, %r22
	.word 0xb2112222  ! 95: OR_I	or 	%r4, 0x0222, %r25
	.word 0xae00ecf6  ! 95: ADD_I	add 	%r3, 0x0cf6, %r23
	.word 0xb6010005  ! 95: ADD_R	add 	%r4, %r5, %r27
	.word 0xa4112793  ! 95: OR_I	or 	%r4, 0x0793, %r18
	.word 0xa808aff1  ! 95: AND_I	and 	%r2, 0x0ff1, %r20
	.word 0xaa090005  ! 95: AND_R	and 	%r4, %r5, %r21
	.word 0xb400aed2  ! 95: ADD_I	add 	%r2, 0x0ed2, %r26
	.word 0xa8008005  ! 95: ADD_R	add 	%r2, %r5, %r20
	.word 0xac11278d  ! 95: OR_I	or 	%r4, 0x078d, %r22
	.word 0x9c08a39d  ! 95: AND_I	and 	%r2, 0x039d, %r14
	.word 0xac10e4e3  ! 95: OR_I	or 	%r3, 0x04e3, %r22
	.word 0xb810eb80  ! 95: OR_I	or 	%r3, 0x0b80, %r28
	.word 0xa208c005  ! 95: AND_R	and 	%r3, %r5, %r17
	.word 0xb610e240  ! 95: OR_I	or 	%r3, 0x0240, %r27
	.word 0xb601c005  ! 95: ADD_R	add 	%r7, %r5, %r27
	.word 0x9a10a2ed  ! 95: OR_I	or 	%r2, 0x02ed, %r13
	.word 0xbc01a342  ! 95: ADD_I	add 	%r6, 0x0342, %r30
	.word 0xac08eff0  ! 95: AND_I	and 	%r3, 0x0ff0, %r22
	.word 0xb2010005  ! 95: ADD_R	add 	%r4, %r5, %r25
	.word 0xbe008005  ! 95: ADD_R	add 	%r2, %r5, %r31
	.word 0xb008c005  ! 95: AND_R	and 	%r3, %r5, %r24
	.word 0xa808e061  ! 95: AND_I	and 	%r3, 0x0061, %r20
	.word 0xa401ee7a  ! 95: ADD_I	add 	%r7, 0x0e7a, %r18
	.word 0xb010c005  ! 95: OR_R	or 	%r3, %r5, %r24
	.word 0xb2088005  ! 95: AND_R	and 	%r2, %r5, %r25
	.word 0x9a010005  ! 95: ADD_R	add 	%r4, %r5, %r13
	.word 0xb2008005  ! 95: ADD_R	add 	%r2, %r5, %r25
	.word 0x9e09a176  ! 95: AND_I	and 	%r6, 0x0176, %r15
	.word 0xac090005  ! 95: AND_R	and 	%r4, %r5, %r22
	.word 0xa211c005  ! 95: OR_R	or 	%r7, %r5, %r17
	.word 0xb008c005  ! 95: AND_R	and 	%r3, %r5, %r24
	.word 0xa209a0c1  ! 95: AND_I	and 	%r6, 0x00c1, %r17
	.word 0xb401c005  ! 95: ADD_R	add 	%r7, %r5, %r26
	.word 0xa600e5f0  ! 95: ADD_I	add 	%r3, 0x05f0, %r19
	.word 0xbe0125c4  ! 95: ADD_I	add 	%r4, 0x05c4, %r31
	.word 0xa601c005  ! 95: ADD_R	add 	%r7, %r5, %r19
	.word 0xbe088005  ! 95: AND_R	and 	%r2, %r5, %r31
	.word 0x9a09c005  ! 95: AND_R	and 	%r7, %r5, %r13
	.word 0xaa11c005  ! 95: OR_R	or 	%r7, %r5, %r21
	.word 0xb8090005  ! 95: AND_R	and 	%r4, %r5, %r28
	.word 0x9c110005  ! 95: OR_R	or 	%r4, %r5, %r14
	.word 0xae09c005  ! 95: AND_R	and 	%r7, %r5, %r23
	.word 0x9a10e9da  ! 95: OR_I	or 	%r3, 0x09da, %r13
	.word 0xb009a9af  ! 95: AND_I	and 	%r6, 0x09af, %r24
	.word 0x9a00a97f  ! 95: ADD_I	add 	%r2, 0x097f, %r13
	.word 0xa800a3a0  ! 95: ADD_I	add 	%r2, 0x03a0, %r20
	.word 0xaa10aedf  ! 95: OR_I	or 	%r2, 0x0edf, %r21
	.word 0xac108005  ! 95: OR_R	or 	%r2, %r5, %r22
	.word 0x9e01e875  ! 95: ADD_I	add 	%r7, 0x0875, %r15
	.word 0xbc00a0c5  ! 95: ADD_I	add 	%r2, 0x00c5, %r30
	.word 0xa610af75  ! 95: OR_I	or 	%r2, 0x0f75, %r19
	.word 0xa610ec58  ! 95: OR_I	or 	%r3, 0x0c58, %r19
	.word 0xac11e049  ! 95: OR_I	or 	%r7, 0x0049, %r22
	.word 0xb809c005  ! 95: AND_R	and 	%r7, %r5, %r28
	.word 0x9a010005  ! 95: ADD_R	add 	%r4, %r5, %r13
	.word 0x9e09e40d  ! 95: AND_I	and 	%r7, 0x040d, %r15
	.word 0xaa10ab38  ! 95: OR_I	or 	%r2, 0x0b38, %r21
	.word 0xac09c005  ! 95: AND_R	and 	%r7, %r5, %r22
	.word 0xaa108005  ! 95: OR_R	or 	%r2, %r5, %r21
	.word 0xa0088005  ! 95: AND_R	and 	%r2, %r5, %r16
	.word 0x9e112455  ! 95: OR_I	or 	%r4, 0x0455, %r15
	.word 0xba10c005  ! 95: OR_R	or 	%r3, %r5, %r29
	.word 0xaa09232e  ! 95: AND_I	and 	%r4, 0x032e, %r21
	.word 0xac11e1ac  ! 95: OR_I	or 	%r7, 0x01ac, %r22
	.word 0xb201ee1a  ! 95: ADD_I	add 	%r7, 0x0e1a, %r25
	.word 0xbc00a863  ! 95: ADD_I	add 	%r2, 0x0863, %r30
	.word 0xb000aa4b  ! 95: ADD_I	add 	%r2, 0x0a4b, %r24
	.word 0xac08ebe0  ! 95: AND_I	and 	%r3, 0x0be0, %r22
	.word 0xae008005  ! 95: ADD_R	add 	%r2, %r5, %r23
	.word 0xa411ade4  ! 95: OR_I	or 	%r6, 0x0de4, %r18
	.word 0xa4090005  ! 95: AND_R	and 	%r4, %r5, %r18
	.word 0xa408a581  ! 95: AND_I	and 	%r2, 0x0581, %r18
	.word 0xb8112684  ! 95: OR_I	or 	%r4, 0x0684, %r28
	.word 0xe42127f4  ! 95: STW_I	stw	%r18, [%r4 + 0x07f4]
	.word 0xf631adce  ! 95: STH_I	sth	%r27, [%r6 + 0x0dce]
	.word 0xe429e0c1  ! 95: STB_I	stb	%r18, [%r7 + 0x00c1]
	.word 0xec28adb1  ! 95: STB_I	stb	%r22, [%r2 + 0x0db1]
IRF_CE_50:
!$EV error(2,expr(@VA(.MAIN.IRF_CE_50), 16, 16), 1,IRF,ce,4,x, x,x,x, x,x,x)
!$EV error(2,expr(@VA(.MAIN.IRF_CE_50), 16, 16), 3,IRF,ce,63,x, x,x,x, x,x,x)
	.word 0xdc20e5b0  ! 95: STW_I	stw	%r14, [%r3 + 0x05b0]
	.word 0xf430a15c  ! 95: STH_I	sth	%r26, [%r2 + 0x015c]
	.word 0xee30a12c  ! 95: STH_I	sth	%r23, [%r2 + 0x012c]
	.word 0xde29ed05  ! 95: STB_I	stb	%r15, [%r7 + 0x0d05]
	.word 0xaa018005  ! 95: ADD_R	add 	%r6, %r5, %r21
	.word 0xb209c005  ! 95: AND_R	and 	%r7, %r5, %r25
	bne thr2_loop_12
	subcc %g1, 0x1, %g1
	ba	join_lbl_0_0
	nop
fork_lbl_0_1:
	setx  0x2ba871b0a9055649, %r1, %r11
	setx  0xe57915a0a1871594, %r1, %r12
	setx  0xa04517df12e0e69c, %r1, %r13
	setx  0x8d203c70ddb2de0e, %r1, %r14
	setx  0x7a6e62d13dfe9f3e, %r1, %r15
	setx  0x23c3c73ebf23aa93, %r1, %r16
	setx  0x180df84860501755, %r1, %r17
	setx  0x473f13b0a635602f, %r1, %r18
	setx  0xd230a535f3b2e1b6, %r1, %r19
	setx  0xdaab41ce43f0b08f, %r1, %r20
	setx  0xf5bc975b5ce69a8d, %r1, %r21
	setx  0x3b6d7aeafe16ef3a, %r1, %r22
	setx  0x60cfc2c9e846571c, %r1, %r23
	setx  0x1d31f3b55d360ed8, %r1, %r24
	setx  0x68c59722f793f1cf, %r1, %r25
	setx  0x47cd2666b67132e2, %r1, %r26
	setx  0xfe6e767183fd0815, %r1, %r27
	setx  0x1a883d19ed25d9a3, %r1, %r28
	setx  0xd90eeec66ba3a95e, %r1, %r29
	setx  0x9bbbf024d82b523e, %r1, %r30
	setx  0x4f3d3a504a786f17, %r1, %r31
	setx  0x0000000000000ee0, %r1, %r5
	setx  0x80, %r2, %r1
	wr  %r1, %r0, %asi
	ta T_CHANGE_HPRIV !To allow ASI writes to D-I caches
	setx MAIN_BASE_DATA_VA, %r1, %r2
	setx MAIN_BASE_DATA_VA, %r1, %r3
	setx MAIN_BASE_DATA_VA, %r1, %r4
	setx MAIN_BASE_DATA_VA, %r1, %r6
	setx MAIN_BASE_DATA_VA, %r1, %r7
	setx MAIN_BASE_DATA_VA, %r1, %r8
	setx MAIN_BASE_DATA_VA, %r1, %r9
	setx MAIN_BASE_DATA_VA, %r1, %r10
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
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr1_loop_0:
	.word 0xac108005  ! 9: OR_R	or 	%r2, %r5, %r22
	.word 0xb0008005  ! 9: ADD_R	add 	%r2, %r5, %r24
	.word 0xb4110005  ! 9: OR_R	or 	%r4, %r5, %r26
	.word 0xb6118005  ! 9: OR_R	or 	%r6, %r5, %r27
	.word 0x9a09e45b  ! 9: AND_I	and 	%r7, 0x045b, %r13
	.word 0xbe108005  ! 9: OR_R	or 	%r2, %r5, %r31
	.word 0x9a088005  ! 9: AND_R	and 	%r2, %r5, %r13
	.word 0xba10a08f  ! 9: OR_I	or 	%r2, 0x008f, %r29
	.word 0xbe08a6e4  ! 9: AND_I	and 	%r2, 0x06e4, %r31
	.word 0xb411abbf  ! 9: OR_I	or 	%r6, 0x0bbf, %r26
	.word 0x9c11e33c  ! 9: OR_I	or 	%r7, 0x033c, %r14
	.word 0xbe090005  ! 9: AND_R	and 	%r4, %r5, %r31
	.word 0xb0090005  ! 9: AND_R	and 	%r4, %r5, %r24
	.word 0x9c008005  ! 9: ADD_R	add 	%r2, %r5, %r14
	.word 0xa800c005  ! 9: ADD_R	add 	%r3, %r5, %r20
	.word 0xb211c005  ! 9: OR_R	or 	%r7, %r5, %r25
	.word 0xa0012caa  ! 9: ADD_I	add 	%r4, 0x0caa, %r16
	.word 0xbc11e2fe  ! 9: OR_I	or 	%r7, 0x02fe, %r30
	.word 0xb808c005  ! 9: AND_R	and 	%r3, %r5, %r28
	.word 0xae088005  ! 9: AND_R	and 	%r2, %r5, %r23
	.word 0xac08e204  ! 9: AND_I	and 	%r3, 0x0204, %r22
	.word 0xb608aca1  ! 9: AND_I	and 	%r2, 0x0ca1, %r27
	.word 0xb611c005  ! 9: OR_R	or 	%r7, %r5, %r27
	.word 0xbc08c005  ! 9: AND_R	and 	%r3, %r5, %r30
	.word 0xa0018005  ! 9: ADD_R	add 	%r6, %r5, %r16
	.word 0xb801a777  ! 9: ADD_I	add 	%r6, 0x0777, %r28
	.word 0x9e010005  ! 9: ADD_R	add 	%r4, %r5, %r15
	.word 0xae10a011  ! 9: OR_I	or 	%r2, 0x0011, %r23
	.word 0xb0108005  ! 9: OR_R	or 	%r2, %r5, %r24
	.word 0x9a092ed0  ! 9: AND_I	and 	%r4, 0x0ed0, %r13
	.word 0x9e108005  ! 9: OR_R	or 	%r2, %r5, %r15
	.word 0xb400c005  ! 9: ADD_R	add 	%r3, %r5, %r26
	.word 0xac11a908  ! 9: OR_I	or 	%r6, 0x0908, %r22
	.word 0xba09c005  ! 9: AND_R	and 	%r7, %r5, %r29
	.word 0xba018005  ! 9: ADD_R	add 	%r6, %r5, %r29
	.word 0xb610c005  ! 9: OR_R	or 	%r3, %r5, %r27
	.word 0xac012c60  ! 9: ADD_I	add 	%r4, 0x0c60, %r22
	.word 0xaa008005  ! 9: ADD_R	add 	%r2, %r5, %r21
	.word 0xb4018005  ! 9: ADD_R	add 	%r6, %r5, %r26
	.word 0xa008a736  ! 9: AND_I	and 	%r2, 0x0736, %r16
	.word 0xbe09afed  ! 9: AND_I	and 	%r6, 0x0fed, %r31
	.word 0xa401ac17  ! 9: ADD_I	add 	%r6, 0x0c17, %r18
	.word 0xa210c005  ! 9: OR_R	or 	%r3, %r5, %r17
	.word 0xa0088005  ! 9: AND_R	and 	%r2, %r5, %r16
	.word 0xb611c005  ! 9: OR_R	or 	%r7, %r5, %r27
	.word 0x9a10e46b  ! 9: OR_I	or 	%r3, 0x046b, %r13
	.word 0x9c088005  ! 9: AND_R	and 	%r2, %r5, %r14
	.word 0xa2090005  ! 9: AND_R	and 	%r4, %r5, %r17
	.word 0xbc088005  ! 9: AND_R	and 	%r2, %r5, %r30
	.word 0xa4108005  ! 9: OR_R	or 	%r2, %r5, %r18
	.word 0xa0090005  ! 9: AND_R	and 	%r4, %r5, %r16
	.word 0xa610c005  ! 9: OR_R	or 	%r3, %r5, %r19
	.word 0xa808ac22  ! 9: AND_I	and 	%r2, 0x0c22, %r20
	.word 0xbc10c005  ! 9: OR_R	or 	%r3, %r5, %r30
	.word 0xa001a239  ! 9: ADD_I	add 	%r6, 0x0239, %r16
	.word 0xb2118005  ! 9: OR_R	or 	%r6, %r5, %r25
	.word 0x9e01a2c8  ! 9: ADD_I	add 	%r6, 0x02c8, %r15
	.word 0xba092e63  ! 9: AND_I	and 	%r4, 0x0e63, %r29
	.word 0xb609a11b  ! 9: AND_I	and 	%r6, 0x011b, %r27
	.word 0xaa11e5a8  ! 9: OR_I	or 	%r7, 0x05a8, %r21
	.word 0xb600a999  ! 9: ADD_I	add 	%r2, 0x0999, %r27
	.word 0xb401e606  ! 9: ADD_I	add 	%r7, 0x0606, %r26
	.word 0x9e08a05c  ! 9: AND_I	and 	%r2, 0x005c, %r15
	.word 0xaa018005  ! 9: ADD_R	add 	%r6, %r5, %r21
	.word 0xa801e52a  ! 9: ADD_I	add 	%r7, 0x052a, %r20
	.word 0xa4008005  ! 9: ADD_R	add 	%r2, %r5, %r18
	.word 0xaa088005  ! 9: AND_R	and 	%r2, %r5, %r21
	.word 0xba09e309  ! 9: AND_I	and 	%r7, 0x0309, %r29
	.word 0xb009ac68  ! 9: AND_I	and 	%r6, 0x0c68, %r24
	.word 0xaa098005  ! 9: AND_R	and 	%r6, %r5, %r21
	.word 0xbe09c005  ! 9: AND_R	and 	%r7, %r5, %r31
	.word 0xb010a3b0  ! 9: OR_I	or 	%r2, 0x03b0, %r24
	.word 0xa8008005  ! 9: ADD_R	add 	%r2, %r5, %r20
	.word 0xa400c005  ! 9: ADD_R	add 	%r3, %r5, %r18
	.word 0xb2098005  ! 9: AND_R	and 	%r6, %r5, %r25
	.word 0xbc11abf3  ! 9: OR_I	or 	%r6, 0x0bf3, %r30
	.word 0xb2108005  ! 9: OR_R	or 	%r2, %r5, %r25
	.word 0xba09e42d  ! 9: AND_I	and 	%r7, 0x042d, %r29
	.word 0xb0088005  ! 9: AND_R	and 	%r2, %r5, %r24
	.word 0xbc00a3fa  ! 9: ADD_I	add 	%r2, 0x03fa, %r30
	.word 0xbe00efe2  ! 9: ADD_I	add 	%r3, 0x0fe2, %r31
	.word 0xa80127fe  ! 9: ADD_I	add 	%r4, 0x07fe, %r20
	.word 0xa6088005  ! 9: AND_R	and 	%r2, %r5, %r19
	.word 0xb001ae03  ! 9: ADD_I	add 	%r6, 0x0e03, %r24
	.word 0xa0092a53  ! 9: AND_I	and 	%r4, 0x0a53, %r16
	.word 0xac018005  ! 9: ADD_R	add 	%r6, %r5, %r22
	.word 0xb008ab9b  ! 9: AND_I	and 	%r2, 0x0b9b, %r24
	.word 0xa4088005  ! 9: AND_R	and 	%r2, %r5, %r18
	.word 0xac11c005  ! 9: OR_R	or 	%r7, %r5, %r22
	.word 0xbc09c005  ! 9: AND_R	and 	%r7, %r5, %r30
	.word 0xa409a30c  ! 9: AND_I	and 	%r6, 0x030c, %r18
	.word 0xa4098005  ! 9: AND_R	and 	%r6, %r5, %r18
	.word 0xba08c005  ! 9: AND_R	and 	%r3, %r5, %r29
	.word 0xb4088005  ! 9: AND_R	and 	%r2, %r5, %r26
	.word 0xb010e9d5  ! 9: OR_I	or 	%r3, 0x09d5, %r24
	.word 0xb210acbc  ! 9: OR_I	or 	%r2, 0x0cbc, %r25
	.word 0xb010ae85  ! 9: OR_I	or 	%r2, 0x0e85, %r24
	.word 0xb8008005  ! 9: ADD_R	add 	%r2, %r5, %r28
	.word 0x9e090005  ! 9: AND_R	and 	%r4, %r5, %r15
	.word 0xba10a69d  ! 9: OR_I	or 	%r2, 0x069d, %r29
	.word 0xa208eef9  ! 9: AND_I	and 	%r3, 0x0ef9, %r17
	.word 0xa601c005  ! 9: ADD_R	add 	%r7, %r5, %r19
	.word 0xa808aacd  ! 9: AND_I	and 	%r2, 0x0acd, %r20
	.word 0x9e00c005  ! 9: ADD_R	add 	%r3, %r5, %r15
	.word 0xae088005  ! 9: AND_R	and 	%r2, %r5, %r23
	.word 0xa800c005  ! 9: ADD_R	add 	%r3, %r5, %r20
	.word 0xb811c005  ! 9: OR_R	or 	%r7, %r5, %r28
	.word 0xa2088005  ! 9: AND_R	and 	%r2, %r5, %r17
	.word 0xa401a116  ! 9: ADD_I	add 	%r6, 0x0116, %r18
	.word 0x9a09e536  ! 9: AND_I	and 	%r7, 0x0536, %r13
	.word 0x9e118005  ! 9: OR_R	or 	%r6, %r5, %r15
	.word 0xae00e25c  ! 9: ADD_I	add 	%r3, 0x025c, %r23
	.word 0x9c012bcc  ! 9: ADD_I	add 	%r4, 0x0bcc, %r14
	.word 0xa6110005  ! 9: OR_R	or 	%r4, %r5, %r19
	.word 0xbe11a607  ! 9: OR_I	or 	%r6, 0x0607, %r31
	.word 0xac08eac4  ! 9: AND_I	and 	%r3, 0x0ac4, %r22
	.word 0xac118005  ! 9: OR_R	or 	%r6, %r5, %r22
	.word 0x9c118005  ! 9: OR_R	or 	%r6, %r5, %r14
	.word 0xa410a3a9  ! 9: OR_I	or 	%r2, 0x03a9, %r18
	.word 0x9c088005  ! 9: AND_R	and 	%r2, %r5, %r14
	.word 0xba11acfc  ! 9: OR_I	or 	%r6, 0x0cfc, %r29
	.word 0xba01a65e  ! 9: ADD_I	add 	%r6, 0x065e, %r29
	.word 0xa800e6b2  ! 9: ADD_I	add 	%r3, 0x06b2, %r20
	.word 0xb800a378  ! 9: ADD_I	add 	%r2, 0x0378, %r28
	.word 0xb0088005  ! 9: AND_R	and 	%r2, %r5, %r24
	.word 0xb0012c75  ! 9: ADD_I	add 	%r4, 0x0c75, %r24
	.word 0xb610ac4f  ! 9: OR_I	or 	%r2, 0x0c4f, %r27
	.word 0xb2008005  ! 9: ADD_R	add 	%r2, %r5, %r25
	.word 0xb800e56b  ! 9: ADD_I	add 	%r3, 0x056b, %r28
	.word 0xa2098005  ! 9: AND_R	and 	%r6, %r5, %r17
	.word 0xb0010005  ! 9: ADD_R	add 	%r4, %r5, %r24
	.word 0xbe00a0a2  ! 9: ADD_I	add 	%r2, 0x00a2, %r31
	.word 0xa800c005  ! 9: ADD_R	add 	%r3, %r5, %r20
	.word 0xb009a27a  ! 9: AND_I	and 	%r6, 0x027a, %r24
	.word 0xb8008005  ! 9: ADD_R	add 	%r2, %r5, %r28
	.word 0xac09e79d  ! 9: AND_I	and 	%r7, 0x079d, %r22
	.word 0xaa118005  ! 9: OR_R	or 	%r6, %r5, %r21
	.word 0xb809e140  ! 9: AND_I	and 	%r7, 0x0140, %r28
	.word 0x9a00a6ea  ! 9: ADD_I	add 	%r2, 0x06ea, %r13
	.word 0xae010005  ! 9: ADD_R	add 	%r4, %r5, %r23
	.word 0xa4092374  ! 9: AND_I	and 	%r4, 0x0374, %r18
	.word 0xac008005  ! 9: ADD_R	add 	%r2, %r5, %r22
	.word 0x9e10aa11  ! 9: OR_I	or 	%r2, 0x0a11, %r15
	.word 0xaa088005  ! 9: AND_R	and 	%r2, %r5, %r21
	.word 0xa6012609  ! 9: ADD_I	add 	%r4, 0x0609, %r19
	.word 0xba00aef6  ! 9: ADD_I	add 	%r2, 0x0ef6, %r29
	.word 0xa800a7fa  ! 9: ADD_I	add 	%r2, 0x07fa, %r20
	.word 0xaa08ae7c  ! 9: AND_I	and 	%r2, 0x0e7c, %r21
	.word 0xbe01c005  ! 9: ADD_R	add 	%r7, %r5, %r31
	.word 0x9a10ad8d  ! 9: OR_I	or 	%r2, 0x0d8d, %r13
	.word 0x9e108005  ! 9: OR_R	or 	%r2, %r5, %r15
	.word 0x9c08c005  ! 9: AND_R	and 	%r3, %r5, %r14
	.word 0xa408c005  ! 9: AND_R	and 	%r3, %r5, %r18
	.word 0xb400af00  ! 9: ADD_I	add 	%r2, 0x0f00, %r26
	.word 0xa6108005  ! 9: OR_R	or 	%r2, %r5, %r19
	.word 0xb208a379  ! 9: AND_I	and 	%r2, 0x0379, %r25
	.word 0xb210e3b9  ! 9: OR_I	or 	%r3, 0x03b9, %r25
	.word 0x9e00a1e3  ! 9: ADD_I	add 	%r2, 0x01e3, %r15
	.word 0x9c08c005  ! 9: AND_R	and 	%r3, %r5, %r14
	.word 0xb6108005  ! 9: OR_R	or 	%r2, %r5, %r27
	.word 0xa411e6c6  ! 9: OR_I	or 	%r7, 0x06c6, %r18
	.word 0xbc090005  ! 9: AND_R	and 	%r4, %r5, %r30
	.word 0xba10eb1d  ! 9: OR_I	or 	%r3, 0x0b1d, %r29
	.word 0xbc090005  ! 9: AND_R	and 	%r4, %r5, %r30
	.word 0xb609c005  ! 9: AND_R	and 	%r7, %r5, %r27
	.word 0xa410c005  ! 9: OR_R	or 	%r3, %r5, %r18
	.word 0xb0098005  ! 9: AND_R	and 	%r6, %r5, %r24
	.word 0xa011e8cd  ! 9: OR_I	or 	%r7, 0x08cd, %r16
	.word 0xb0018005  ! 9: ADD_R	add 	%r6, %r5, %r24
	.word 0xb200a8f8  ! 9: ADD_I	add 	%r2, 0x08f8, %r25
	.word 0xa4088005  ! 9: AND_R	and 	%r2, %r5, %r18
	.word 0xb0110005  ! 9: OR_R	or 	%r4, %r5, %r24
	.word 0xa6090005  ! 9: AND_R	and 	%r4, %r5, %r19
	.word 0xb401c005  ! 9: ADD_R	add 	%r7, %r5, %r26
	.word 0xa4018005  ! 9: ADD_R	add 	%r6, %r5, %r18
	.word 0xb8008005  ! 9: ADD_R	add 	%r2, %r5, %r28
	.word 0xa200a03f  ! 9: ADD_I	add 	%r2, 0x003f, %r17
	.word 0xbe01a08d  ! 9: ADD_I	add 	%r6, 0x008d, %r31
	.word 0xb208a2e6  ! 9: AND_I	and 	%r2, 0x02e6, %r25
	.word 0x9e108005  ! 9: OR_R	or 	%r2, %r5, %r15
	.word 0xa201267e  ! 9: ADD_I	add 	%r4, 0x067e, %r17
	.word 0xa408a89e  ! 9: AND_I	and 	%r2, 0x089e, %r18
	.word 0x9a118005  ! 9: OR_R	or 	%r6, %r5, %r13
	.word 0xae01ebcb  ! 9: ADD_I	add 	%r7, 0x0bcb, %r23
	.word 0xb610a549  ! 9: OR_I	or 	%r2, 0x0549, %r27
	.word 0xbe118005  ! 9: OR_R	or 	%r6, %r5, %r31
	.word 0x9a10eba5  ! 9: OR_I	or 	%r3, 0x0ba5, %r13
	.word 0xb4098005  ! 9: AND_R	and 	%r6, %r5, %r26
	.word 0xb000a3d1  ! 9: ADD_I	add 	%r2, 0x03d1, %r24
	.word 0xb411233f  ! 9: OR_I	or 	%r4, 0x033f, %r26
	.word 0xb411e3e3  ! 9: OR_I	or 	%r7, 0x03e3, %r26
	.word 0xaa012953  ! 9: ADD_I	add 	%r4, 0x0953, %r21
	.word 0x9c01c005  ! 9: ADD_R	add 	%r7, %r5, %r14
	.word 0xae11a96b  ! 9: OR_I	or 	%r6, 0x096b, %r23
	.word 0x9e09afec  ! 9: AND_I	and 	%r6, 0x0fec, %r15
	.word 0xaa088005  ! 9: AND_R	and 	%r2, %r5, %r21
	.word 0xbc09adf3  ! 9: AND_I	and 	%r6, 0x0df3, %r30
	.word 0xb6118005  ! 9: OR_R	or 	%r6, %r5, %r27
	.word 0xb810c005  ! 9: OR_R	or 	%r3, %r5, %r28
	.word 0xb800c005  ! 9: ADD_R	add 	%r3, %r5, %r28
	.word 0xea20e784  ! 9: STW_I	stw	%r21, [%r3 + 0x0784]
	.word 0xee31ed04  ! 9: STH_I	sth	%r23, [%r7 + 0x0d04]
	.word 0xfc70efb8  ! 9: STX_I	stx	%r30, [%r3 + 0x0fb8]
	.word 0xfe70acc8  ! 9: STX_I	stx	%r31, [%r2 + 0x0cc8]
IRF_CE_1:
!$EV error(1,expr(@VA(.MAIN.IRF_CE_1), 16, 16), 1,IRF,ce,64,x, x,x,x, x,x,x)
!$EV error(1,expr(@VA(.MAIN.IRF_CE_1), 16, 16), 3,IRF,ce,50,x, x,x,x, x,x,x)
	.word 0xee20a498  ! 9: STW_I	stw	%r23, [%r2 + 0x0498]
	.word 0xda28a3f0  ! 9: STB_I	stb	%r13, [%r2 + 0x03f0]
	.word 0xe228a71c  ! 9: STB_I	stb	%r17, [%r2 + 0x071c]
	.word 0xfce89005  ! 9: LDSTUBA_R	ldstuba	%r30, [%r2 + %r5] 0x80
	.word 0xa4088005  ! 9: AND_R	and 	%r2, %r5, %r18
	.word 0xb2008005  ! 9: ADD_R	add 	%r2, %r5, %r25
	bne thr1_loop_0
	subcc %g1, 0x1, %g1
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr1_loop_1:
	.word 0xa800e2db  ! 16: ADD_I	add 	%r3, 0x02db, %r20
	.word 0xb2008005  ! 16: ADD_R	add 	%r2, %r5, %r25
	.word 0xa2108005  ! 16: OR_R	or 	%r2, %r5, %r17
	.word 0xb4018005  ! 16: ADD_R	add 	%r6, %r5, %r26
	.word 0xa400a9ee  ! 16: ADD_I	add 	%r2, 0x09ee, %r18
	.word 0xa600c005  ! 16: ADD_R	add 	%r3, %r5, %r19
	.word 0xa21125c2  ! 16: OR_I	or 	%r4, 0x05c2, %r17
	.word 0xb6118005  ! 16: OR_R	or 	%r6, %r5, %r27
	.word 0xaa08a4d2  ! 16: AND_I	and 	%r2, 0x04d2, %r21
	.word 0xbc112e8d  ! 16: OR_I	or 	%r4, 0x0e8d, %r30
	.word 0xaa11af5c  ! 16: OR_I	or 	%r6, 0x0f5c, %r21
	.word 0xa608e191  ! 16: AND_I	and 	%r3, 0x0191, %r19
	.word 0xbc09e60f  ! 16: AND_I	and 	%r7, 0x060f, %r30
	.word 0x9a00a013  ! 16: ADD_I	add 	%r2, 0x0013, %r13
	.word 0xa809c005  ! 16: AND_R	and 	%r7, %r5, %r20
	.word 0xae012ef6  ! 16: ADD_I	add 	%r4, 0x0ef6, %r23
	.word 0xaa108005  ! 16: OR_R	or 	%r2, %r5, %r21
	.word 0xb2118005  ! 16: OR_R	or 	%r6, %r5, %r25
	.word 0xa6108005  ! 16: OR_R	or 	%r2, %r5, %r19
	.word 0xba118005  ! 16: OR_R	or 	%r6, %r5, %r29
	.word 0xba01ebf6  ! 16: ADD_I	add 	%r7, 0x0bf6, %r29
	.word 0x9a10a7e9  ! 16: OR_I	or 	%r2, 0x07e9, %r13
	.word 0xba08a61e  ! 16: AND_I	and 	%r2, 0x061e, %r29
	.word 0xb409af05  ! 16: AND_I	and 	%r6, 0x0f05, %r26
	.word 0xb808a666  ! 16: AND_I	and 	%r2, 0x0666, %r28
	.word 0x9a008005  ! 16: ADD_R	add 	%r2, %r5, %r13
	.word 0xb208a390  ! 16: AND_I	and 	%r2, 0x0390, %r25
	.word 0xae01eae0  ! 16: ADD_I	add 	%r7, 0x0ae0, %r23
	.word 0xba09aa6b  ! 16: AND_I	and 	%r6, 0x0a6b, %r29
	.word 0xb209e4e3  ! 16: AND_I	and 	%r7, 0x04e3, %r25
	.word 0xb601edcb  ! 16: ADD_I	add 	%r7, 0x0dcb, %r27
	.word 0x9a018005  ! 16: ADD_R	add 	%r6, %r5, %r13
	.word 0xa209e466  ! 16: AND_I	and 	%r7, 0x0466, %r17
	.word 0xa201c005  ! 16: ADD_R	add 	%r7, %r5, %r17
	.word 0xb801ec13  ! 16: ADD_I	add 	%r7, 0x0c13, %r28
	.word 0xae00c005  ! 16: ADD_R	add 	%r3, %r5, %r23
	.word 0xb810c005  ! 16: OR_R	or 	%r3, %r5, %r28
	.word 0xac118005  ! 16: OR_R	or 	%r6, %r5, %r22
	.word 0xaa09ea48  ! 16: AND_I	and 	%r7, 0x0a48, %r21
	.word 0xb2110005  ! 16: OR_R	or 	%r4, %r5, %r25
	.word 0xae108005  ! 16: OR_R	or 	%r2, %r5, %r23
	.word 0x9e08a332  ! 16: AND_I	and 	%r2, 0x0332, %r15
	.word 0xa0008005  ! 16: ADD_R	add 	%r2, %r5, %r16
	.word 0xb800a0d9  ! 16: ADD_I	add 	%r2, 0x00d9, %r28
	.word 0xac00c005  ! 16: ADD_R	add 	%r3, %r5, %r22
	.word 0xb611a17f  ! 16: OR_I	or 	%r6, 0x017f, %r27
	.word 0xae018005  ! 16: ADD_R	add 	%r6, %r5, %r23
	.word 0xba01e724  ! 16: ADD_I	add 	%r7, 0x0724, %r29
	.word 0xa81125b2  ! 16: OR_I	or 	%r4, 0x05b2, %r20
	.word 0x9a09c005  ! 16: AND_R	and 	%r7, %r5, %r13
	.word 0xa800c005  ! 16: ADD_R	add 	%r3, %r5, %r20
	.word 0xac08ae15  ! 16: AND_I	and 	%r2, 0x0e15, %r22
	.word 0xb809c005  ! 16: AND_R	and 	%r7, %r5, %r28
	.word 0xb2008005  ! 16: ADD_R	add 	%r2, %r5, %r25
	.word 0xb611a1fb  ! 16: OR_I	or 	%r6, 0x01fb, %r27
	.word 0xb009c005  ! 16: AND_R	and 	%r7, %r5, %r24
	.word 0xa210a041  ! 16: OR_I	or 	%r2, 0x0041, %r17
	.word 0x9c110005  ! 16: OR_R	or 	%r4, %r5, %r14
	.word 0x9c11ac3f  ! 16: OR_I	or 	%r6, 0x0c3f, %r14
	.word 0xb800c005  ! 16: ADD_R	add 	%r3, %r5, %r28
	.word 0xb008e370  ! 16: AND_I	and 	%r3, 0x0370, %r24
	.word 0xb808aa4a  ! 16: AND_I	and 	%r2, 0x0a4a, %r28
	.word 0xaa09c005  ! 16: AND_R	and 	%r7, %r5, %r21
	.word 0xa2008005  ! 16: ADD_R	add 	%r2, %r5, %r17
	.word 0xaa09c005  ! 16: AND_R	and 	%r7, %r5, %r21
	.word 0xb609e9f0  ! 16: AND_I	and 	%r7, 0x09f0, %r27
	.word 0xbe09afd5  ! 16: AND_I	and 	%r6, 0x0fd5, %r31
	.word 0xb410ae15  ! 16: OR_I	or 	%r2, 0x0e15, %r26
	.word 0xaa11eadb  ! 16: OR_I	or 	%r7, 0x0adb, %r21
	.word 0xae08c005  ! 16: AND_R	and 	%r3, %r5, %r23
	.word 0xb0108005  ! 16: OR_R	or 	%r2, %r5, %r24
	.word 0xb200aeec  ! 16: ADD_I	add 	%r2, 0x0eec, %r25
	.word 0xb2012055  ! 16: ADD_I	add 	%r4, 0x0055, %r25
	.word 0xac112b15  ! 16: OR_I	or 	%r4, 0x0b15, %r22
	.word 0x9e090005  ! 16: AND_R	and 	%r4, %r5, %r15
	.word 0x9a09a37a  ! 16: AND_I	and 	%r6, 0x037a, %r13
	.word 0xba088005  ! 16: AND_R	and 	%r2, %r5, %r29
	.word 0xb2008005  ! 16: ADD_R	add 	%r2, %r5, %r25
	.word 0xa601c005  ! 16: ADD_R	add 	%r7, %r5, %r19
	.word 0xb401e7cb  ! 16: ADD_I	add 	%r7, 0x07cb, %r26
	.word 0x9c108005  ! 16: OR_R	or 	%r2, %r5, %r14
	.word 0xa6008005  ! 16: ADD_R	add 	%r2, %r5, %r19
	.word 0xa6108005  ! 16: OR_R	or 	%r2, %r5, %r19
	.word 0xbc08aa77  ! 16: AND_I	and 	%r2, 0x0a77, %r30
	.word 0x9a10a8c5  ! 16: OR_I	or 	%r2, 0x08c5, %r13
	.word 0xa00925b9  ! 16: AND_I	and 	%r4, 0x05b9, %r16
	.word 0xb600a463  ! 16: ADD_I	add 	%r2, 0x0463, %r27
	.word 0xa809a176  ! 16: AND_I	and 	%r6, 0x0176, %r20
	.word 0xa600e467  ! 16: ADD_I	add 	%r3, 0x0467, %r19
	.word 0xa8012730  ! 16: ADD_I	add 	%r4, 0x0730, %r20
	.word 0xa601eec1  ! 16: ADD_I	add 	%r7, 0x0ec1, %r19
	.word 0xa4008005  ! 16: ADD_R	add 	%r2, %r5, %r18
	.word 0xa601e144  ! 16: ADD_I	add 	%r7, 0x0144, %r19
	.word 0xb808e27f  ! 16: AND_I	and 	%r3, 0x027f, %r28
	.word 0x9c11a90a  ! 16: OR_I	or 	%r6, 0x090a, %r14
	.word 0xa4118005  ! 16: OR_R	or 	%r6, %r5, %r18
	.word 0xaa018005  ! 16: ADD_R	add 	%r6, %r5, %r21
	.word 0xbc0123f9  ! 16: ADD_I	add 	%r4, 0x03f9, %r30
	.word 0xa808a7bd  ! 16: AND_I	and 	%r2, 0x07bd, %r20
	.word 0xa2090005  ! 16: AND_R	and 	%r4, %r5, %r17
	.word 0xb611a65e  ! 16: OR_I	or 	%r6, 0x065e, %r27
	.word 0xa800e794  ! 16: ADD_I	add 	%r3, 0x0794, %r20
	.word 0xbe00c005  ! 16: ADD_R	add 	%r3, %r5, %r31
	.word 0xbc098005  ! 16: AND_R	and 	%r6, %r5, %r30
	.word 0xb609ef4b  ! 16: AND_I	and 	%r7, 0x0f4b, %r27
	.word 0xaa008005  ! 16: ADD_R	add 	%r2, %r5, %r21
	.word 0xa408e393  ! 16: AND_I	and 	%r3, 0x0393, %r18
	.word 0xb4008005  ! 16: ADD_R	add 	%r2, %r5, %r26
	.word 0xae00e028  ! 16: ADD_I	add 	%r3, 0x0028, %r23
	.word 0xa4012f6b  ! 16: ADD_I	add 	%r4, 0x0f6b, %r18
	.word 0x9a01c005  ! 16: ADD_R	add 	%r7, %r5, %r13
	.word 0xa4108005  ! 16: OR_R	or 	%r2, %r5, %r18
	.word 0x9a01c005  ! 16: ADD_R	add 	%r7, %r5, %r13
	.word 0xa2110005  ! 16: OR_R	or 	%r4, %r5, %r17
	.word 0xa8018005  ! 16: ADD_R	add 	%r6, %r5, %r20
	.word 0xba008005  ! 16: ADD_R	add 	%r2, %r5, %r29
	.word 0x9a11ecfa  ! 16: OR_I	or 	%r7, 0x0cfa, %r13
	.word 0xaa110005  ! 16: OR_R	or 	%r4, %r5, %r21
	.word 0xac11e27a  ! 16: OR_I	or 	%r7, 0x027a, %r22
	.word 0xb60925bb  ! 16: AND_I	and 	%r4, 0x05bb, %r27
	.word 0xa208aa5f  ! 16: AND_I	and 	%r2, 0x0a5f, %r17
	.word 0xb2088005  ! 16: AND_R	and 	%r2, %r5, %r25
	.word 0xa810c005  ! 16: OR_R	or 	%r3, %r5, %r20
	.word 0x9c10c005  ! 16: OR_R	or 	%r3, %r5, %r14
	.word 0xb609c005  ! 16: AND_R	and 	%r7, %r5, %r27
	.word 0xa8090005  ! 16: AND_R	and 	%r4, %r5, %r20
	.word 0xa408a17c  ! 16: AND_I	and 	%r2, 0x017c, %r18
	.word 0xb611e758  ! 16: OR_I	or 	%r7, 0x0758, %r27
	.word 0xe820a7e8  ! 16: STW_I	stw	%r20, [%r2 + 0x07e8]
	.word 0xfe29e136  ! 16: STB_I	stb	%r31, [%r7 + 0x0136]
	.word 0xf829edb3  ! 16: STB_I	stb	%r28, [%r7 + 0x0db3]
	.word 0xea31ac04  ! 16: STH_I	sth	%r21, [%r6 + 0x0c04]
IRF_CE_5:
!$EV error(1,expr(@VA(.MAIN.IRF_CE_5), 16, 16), 1,IRF,ce,67,x, x,x,x, x,x,x)
!$EV error(1,expr(@VA(.MAIN.IRF_CE_5), 16, 16), 3,IRF,ce,26,x, x,x,x, x,x,x)
	.word 0xea70e6b0  ! 16: STX_I	stx	%r21, [%r3 + 0x06b0]
	.word 0xea71a950  ! 16: STX_I	stx	%r21, [%r6 + 0x0950]
	.word 0xde30a3ec  ! 16: STH_I	sth	%r15, [%r2 + 0x03ec]
	.word 0xda78c005  ! 16: SWAP_R	swap	%r13, [%r3 + %r5]
	.word 0xb411c005  ! 16: OR_R	or 	%r7, %r5, %r26
	.word 0xa409c005  ! 16: AND_R	and 	%r7, %r5, %r18
	bne thr1_loop_1
	subcc %g1, 0x1, %g1
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr1_loop_2:
	.word 0xbe00ad39  ! 23: ADD_I	add 	%r2, 0x0d39, %r31
	.word 0x9e108005  ! 23: OR_R	or 	%r2, %r5, %r15
	.word 0x9a01ed3c  ! 23: ADD_I	add 	%r7, 0x0d3c, %r13
	.word 0x9c088005  ! 23: AND_R	and 	%r2, %r5, %r14
	.word 0xb8108005  ! 23: OR_R	or 	%r2, %r5, %r28
	.word 0xac08a610  ! 23: AND_I	and 	%r2, 0x0610, %r22
	.word 0x9a01c005  ! 23: ADD_R	add 	%r7, %r5, %r13
	.word 0xb2012457  ! 23: ADD_I	add 	%r4, 0x0457, %r25
	.word 0xb0108005  ! 23: OR_R	or 	%r2, %r5, %r24
	.word 0xba098005  ! 23: AND_R	and 	%r6, %r5, %r29
	.word 0xb2008005  ! 23: ADD_R	add 	%r2, %r5, %r25
	.word 0xb010c005  ! 23: OR_R	or 	%r3, %r5, %r24
	.word 0x9e010005  ! 23: ADD_R	add 	%r4, %r5, %r15
	.word 0xae008005  ! 23: ADD_R	add 	%r2, %r5, %r23
	.word 0xaa11c005  ! 23: OR_R	or 	%r7, %r5, %r21
	.word 0xb808ec3f  ! 23: AND_I	and 	%r3, 0x0c3f, %r28
	.word 0xa608a189  ! 23: AND_I	and 	%r2, 0x0189, %r19
	.word 0x9e09c005  ! 23: AND_R	and 	%r7, %r5, %r15
	.word 0x9e08e14a  ! 23: AND_I	and 	%r3, 0x014a, %r15
	.word 0xa800a261  ! 23: ADD_I	add 	%r2, 0x0261, %r20
	.word 0xae00a880  ! 23: ADD_I	add 	%r2, 0x0880, %r23
	.word 0xb811e52e  ! 23: OR_I	or 	%r7, 0x052e, %r28
	.word 0xb809a763  ! 23: AND_I	and 	%r6, 0x0763, %r28
	.word 0xb00123ce  ! 23: ADD_I	add 	%r4, 0x03ce, %r24
	.word 0xa0090005  ! 23: AND_R	and 	%r4, %r5, %r16
	.word 0xb600a356  ! 23: ADD_I	add 	%r2, 0x0356, %r27
	.word 0xb6098005  ! 23: AND_R	and 	%r6, %r5, %r27
	.word 0xaa112796  ! 23: OR_I	or 	%r4, 0x0796, %r21
	.word 0x9e11291f  ! 23: OR_I	or 	%r4, 0x091f, %r15
	.word 0xb609ec53  ! 23: AND_I	and 	%r7, 0x0c53, %r27
	.word 0xa610a8aa  ! 23: OR_I	or 	%r2, 0x08aa, %r19
	.word 0xb411adee  ! 23: OR_I	or 	%r6, 0x0dee, %r26
	.word 0x9c008005  ! 23: ADD_R	add 	%r2, %r5, %r14
	.word 0xa4088005  ! 23: AND_R	and 	%r2, %r5, %r18
	.word 0xba108005  ! 23: OR_R	or 	%r2, %r5, %r29
	.word 0xa410a15e  ! 23: OR_I	or 	%r2, 0x015e, %r18
	.word 0xb200a952  ! 23: ADD_I	add 	%r2, 0x0952, %r25
	.word 0xbe090005  ! 23: AND_R	and 	%r4, %r5, %r31
	.word 0xae118005  ! 23: OR_R	or 	%r6, %r5, %r23
	.word 0xa2112c2b  ! 23: OR_I	or 	%r4, 0x0c2b, %r17
	.word 0xae09c005  ! 23: AND_R	and 	%r7, %r5, %r23
	.word 0xa8092b34  ! 23: AND_I	and 	%r4, 0x0b34, %r20
	.word 0xba008005  ! 23: ADD_R	add 	%r2, %r5, %r29
	.word 0xbe010005  ! 23: ADD_R	add 	%r4, %r5, %r31
	.word 0xa4118005  ! 23: OR_R	or 	%r6, %r5, %r18
	.word 0xa8098005  ! 23: AND_R	and 	%r6, %r5, %r20
	.word 0xbe10e214  ! 23: OR_I	or 	%r3, 0x0214, %r31
	.word 0xbe11c005  ! 23: OR_R	or 	%r7, %r5, %r31
	.word 0xb409e010  ! 23: AND_I	and 	%r7, 0x0010, %r26
	.word 0xb4088005  ! 23: AND_R	and 	%r2, %r5, %r26
	.word 0xb200a5c0  ! 23: ADD_I	add 	%r2, 0x05c0, %r25
	.word 0xb410e292  ! 23: OR_I	or 	%r3, 0x0292, %r26
	.word 0xb010ab05  ! 23: OR_I	or 	%r2, 0x0b05, %r24
	.word 0xac10eaad  ! 23: OR_I	or 	%r3, 0x0aad, %r22
	.word 0xa410c005  ! 23: OR_R	or 	%r3, %r5, %r18
	.word 0xa810a8fa  ! 23: OR_I	or 	%r2, 0x08fa, %r20
	.word 0xb011c005  ! 23: OR_R	or 	%r7, %r5, %r24
	.word 0xac09ef6d  ! 23: AND_I	and 	%r7, 0x0f6d, %r22
	.word 0xb8088005  ! 23: AND_R	and 	%r2, %r5, %r28
	.word 0xb8118005  ! 23: OR_R	or 	%r6, %r5, %r28
	.word 0xae09e884  ! 23: AND_I	and 	%r7, 0x0884, %r23
	.word 0xaa01ad2b  ! 23: ADD_I	add 	%r6, 0x0d2b, %r21
	.word 0xba008005  ! 23: ADD_R	add 	%r2, %r5, %r29
	.word 0xbc10ef75  ! 23: OR_I	or 	%r3, 0x0f75, %r30
	.word 0x9e112004  ! 23: OR_I	or 	%r4, 0x0004, %r15
	.word 0xb4088005  ! 23: AND_R	and 	%r2, %r5, %r26
	.word 0xa810a1a6  ! 23: OR_I	or 	%r2, 0x01a6, %r20
	.word 0xbc00c005  ! 23: ADD_R	add 	%r3, %r5, %r30
	.word 0xbe08e71e  ! 23: AND_I	and 	%r3, 0x071e, %r31
	.word 0xb610a518  ! 23: OR_I	or 	%r2, 0x0518, %r27
	.word 0xbe08aab1  ! 23: AND_I	and 	%r2, 0x0ab1, %r31
	.word 0xa609c005  ! 23: AND_R	and 	%r7, %r5, %r19
	.word 0xa200a573  ! 23: ADD_I	add 	%r2, 0x0573, %r17
	.word 0xa001a5be  ! 23: ADD_I	add 	%r6, 0x05be, %r16
	.word 0xae00c005  ! 23: ADD_R	add 	%r3, %r5, %r23
	.word 0xb8090005  ! 23: AND_R	and 	%r4, %r5, %r28
	.word 0xb200e22a  ! 23: ADD_I	add 	%r3, 0x022a, %r25
	.word 0xa4088005  ! 23: AND_R	and 	%r2, %r5, %r18
	.word 0xba09c005  ! 23: AND_R	and 	%r7, %r5, %r29
	.word 0xa6018005  ! 23: ADD_R	add 	%r6, %r5, %r19
	.word 0xa000c005  ! 23: ADD_R	add 	%r3, %r5, %r16
	.word 0x9a09ec97  ! 23: AND_I	and 	%r7, 0x0c97, %r13
	.word 0xbc01e536  ! 23: ADD_I	add 	%r7, 0x0536, %r30
	.word 0xb600c005  ! 23: ADD_R	add 	%r3, %r5, %r27
	.word 0xb411c005  ! 23: OR_R	or 	%r7, %r5, %r26
	.word 0xa409a3e2  ! 23: AND_I	and 	%r6, 0x03e2, %r18
	.word 0xae108005  ! 23: OR_R	or 	%r2, %r5, %r23
	.word 0xa6012eac  ! 23: ADD_I	add 	%r4, 0x0eac, %r19
	.word 0x9e08c005  ! 23: AND_R	and 	%r3, %r5, %r15
	.word 0xb8110005  ! 23: OR_R	or 	%r4, %r5, %r28
	.word 0xa0010005  ! 23: ADD_R	add 	%r4, %r5, %r16
	.word 0xba01223a  ! 23: ADD_I	add 	%r4, 0x023a, %r29
	.word 0xbe10c005  ! 23: OR_R	or 	%r3, %r5, %r31
	.word 0xa000a483  ! 23: ADD_I	add 	%r2, 0x0483, %r16
	.word 0xb411ab7d  ! 23: OR_I	or 	%r6, 0x0b7d, %r26
	.word 0xbc112798  ! 23: OR_I	or 	%r4, 0x0798, %r30
	.word 0x9c10e226  ! 23: OR_I	or 	%r3, 0x0226, %r14
	.word 0xba09adb5  ! 23: AND_I	and 	%r6, 0x0db5, %r29
	.word 0xa001ed6f  ! 23: ADD_I	add 	%r7, 0x0d6f, %r16
	.word 0xaa08adfd  ! 23: AND_I	and 	%r2, 0x0dfd, %r21
	.word 0xba11a482  ! 23: OR_I	or 	%r6, 0x0482, %r29
	.word 0x9c108005  ! 23: OR_R	or 	%r2, %r5, %r14
	.word 0xb010eb01  ! 23: OR_I	or 	%r3, 0x0b01, %r24
	.word 0xa611c005  ! 23: OR_R	or 	%r7, %r5, %r19
	.word 0xbe10c005  ! 23: OR_R	or 	%r3, %r5, %r31
	.word 0xa800a017  ! 23: ADD_I	add 	%r2, 0x0017, %r20
	.word 0xa010ae9e  ! 23: OR_I	or 	%r2, 0x0e9e, %r16
	.word 0x9c090005  ! 23: AND_R	and 	%r4, %r5, %r14
	.word 0xa0088005  ! 23: AND_R	and 	%r2, %r5, %r16
	.word 0xbe00c005  ! 23: ADD_R	add 	%r3, %r5, %r31
	.word 0xbe11ef9a  ! 23: OR_I	or 	%r7, 0x0f9a, %r31
	.word 0xba01a46e  ! 23: ADD_I	add 	%r6, 0x046e, %r29
	.word 0xaa08ad5c  ! 23: AND_I	and 	%r2, 0x0d5c, %r21
	.word 0xbe108005  ! 23: OR_R	or 	%r2, %r5, %r31
	.word 0xac00ef72  ! 23: ADD_I	add 	%r3, 0x0f72, %r22
	.word 0xbc09efb1  ! 23: AND_I	and 	%r7, 0x0fb1, %r30
	.word 0xb4008005  ! 23: ADD_R	add 	%r2, %r5, %r26
	.word 0x9a01c005  ! 23: ADD_R	add 	%r7, %r5, %r13
	.word 0xa800e2ce  ! 23: ADD_I	add 	%r3, 0x02ce, %r20
	.word 0xbe010005  ! 23: ADD_R	add 	%r4, %r5, %r31
	.word 0xb808eaab  ! 23: AND_I	and 	%r3, 0x0aab, %r28
	.word 0x9c008005  ! 23: ADD_R	add 	%r2, %r5, %r14
	.word 0xa208ed57  ! 23: AND_I	and 	%r3, 0x0d57, %r17
	.word 0xb4010005  ! 23: ADD_R	add 	%r4, %r5, %r26
	.word 0xaa01e25e  ! 23: ADD_I	add 	%r7, 0x025e, %r21
	.word 0xa6090005  ! 23: AND_R	and 	%r4, %r5, %r19
	.word 0x9a11ef58  ! 23: OR_I	or 	%r7, 0x0f58, %r13
	.word 0xb8110005  ! 23: OR_R	or 	%r4, %r5, %r28
	.word 0xb0008005  ! 23: ADD_R	add 	%r2, %r5, %r24
	.word 0xbe088005  ! 23: AND_R	and 	%r2, %r5, %r31
	.word 0xae10ed60  ! 23: OR_I	or 	%r3, 0x0d60, %r23
	.word 0xb608a4b2  ! 23: AND_I	and 	%r2, 0x04b2, %r27
	.word 0xb6088005  ! 23: AND_R	and 	%r2, %r5, %r27
	.word 0x9a00ead5  ! 23: ADD_I	add 	%r3, 0x0ad5, %r13
	.word 0xbc110005  ! 23: OR_R	or 	%r4, %r5, %r30
	.word 0x9e018005  ! 23: ADD_R	add 	%r6, %r5, %r15
	.word 0xb009e943  ! 23: AND_I	and 	%r7, 0x0943, %r24
	.word 0x9a09afb7  ! 23: AND_I	and 	%r6, 0x0fb7, %r13
	.word 0xba108005  ! 23: OR_R	or 	%r2, %r5, %r29
	.word 0xb400afd1  ! 23: ADD_I	add 	%r2, 0x0fd1, %r26
	.word 0xa808ac06  ! 23: AND_I	and 	%r2, 0x0c06, %r20
	.word 0xb611c005  ! 23: OR_R	or 	%r7, %r5, %r27
	.word 0xa6012d80  ! 23: ADD_I	add 	%r4, 0x0d80, %r19
	.word 0x9e10c005  ! 23: OR_R	or 	%r3, %r5, %r15
	.word 0x9a11c005  ! 23: OR_R	or 	%r7, %r5, %r13
	.word 0xa610c005  ! 23: OR_R	or 	%r3, %r5, %r19
	.word 0xac08c005  ! 23: AND_R	and 	%r3, %r5, %r22
	.word 0xa600c005  ! 23: ADD_R	add 	%r3, %r5, %r19
	.word 0x9e088005  ! 23: AND_R	and 	%r2, %r5, %r15
	.word 0xbe10e7fd  ! 23: OR_I	or 	%r3, 0x07fd, %r31
	.word 0xa010ef9a  ! 23: OR_I	or 	%r3, 0x0f9a, %r16
	.word 0x9c01e158  ! 23: ADD_I	add 	%r7, 0x0158, %r14
	.word 0xac10c005  ! 23: OR_R	or 	%r3, %r5, %r22
	.word 0xa8118005  ! 23: OR_R	or 	%r6, %r5, %r20
	.word 0xbe08a014  ! 23: AND_I	and 	%r2, 0x0014, %r31
	.word 0xa41121fd  ! 23: OR_I	or 	%r4, 0x01fd, %r18
	.word 0xbe088005  ! 23: AND_R	and 	%r2, %r5, %r31
	.word 0xaa08a972  ! 23: AND_I	and 	%r2, 0x0972, %r21
	.word 0xbe10ac93  ! 23: OR_I	or 	%r2, 0x0c93, %r31
	.word 0xac090005  ! 23: AND_R	and 	%r4, %r5, %r22
	.word 0xaa108005  ! 23: OR_R	or 	%r2, %r5, %r21
	.word 0xb210e891  ! 23: OR_I	or 	%r3, 0x0891, %r25
	.word 0xbc01c005  ! 23: ADD_R	add 	%r7, %r5, %r30
	.word 0xbc00ac5b  ! 23: ADD_I	add 	%r2, 0x0c5b, %r30
	.word 0xb600e2e6  ! 23: ADD_I	add 	%r3, 0x02e6, %r27
	.word 0xb000c005  ! 23: ADD_R	add 	%r3, %r5, %r24
	.word 0xa200e58f  ! 23: ADD_I	add 	%r3, 0x058f, %r17
	.word 0xae092e9b  ! 23: AND_I	and 	%r4, 0x0e9b, %r23
	.word 0xba11c005  ! 23: OR_R	or 	%r7, %r5, %r29
	.word 0xa6110005  ! 23: OR_R	or 	%r4, %r5, %r19
	.word 0x9a00ab27  ! 23: ADD_I	add 	%r2, 0x0b27, %r13
	.word 0xa200a449  ! 23: ADD_I	add 	%r2, 0x0449, %r17
	.word 0xa601a4fa  ! 23: ADD_I	add 	%r6, 0x04fa, %r19
	.word 0xb6092f85  ! 23: AND_I	and 	%r4, 0x0f85, %r27
	.word 0x9e00eef8  ! 23: ADD_I	add 	%r3, 0x0ef8, %r15
	.word 0xae010005  ! 23: ADD_R	add 	%r4, %r5, %r23
	.word 0xba01eaab  ! 23: ADD_I	add 	%r7, 0x0aab, %r29
	.word 0xb0098005  ! 23: AND_R	and 	%r6, %r5, %r24
	.word 0xa6108005  ! 23: OR_R	or 	%r2, %r5, %r19
	.word 0x9c010005  ! 23: ADD_R	add 	%r4, %r5, %r14
	.word 0xae088005  ! 23: AND_R	and 	%r2, %r5, %r23
	.word 0xac088005  ! 23: AND_R	and 	%r2, %r5, %r22
	.word 0xa6012c74  ! 23: ADD_I	add 	%r4, 0x0c74, %r19
	.word 0xbe01e82d  ! 23: ADD_I	add 	%r7, 0x082d, %r31
	.word 0xae00ad9b  ! 23: ADD_I	add 	%r2, 0x0d9b, %r23
	.word 0xa609e0e1  ! 23: AND_I	and 	%r7, 0x00e1, %r19
	.word 0xa808c005  ! 23: AND_R	and 	%r3, %r5, %r20
	.word 0xa6098005  ! 23: AND_R	and 	%r6, %r5, %r19
	.word 0xb0088005  ! 23: AND_R	and 	%r2, %r5, %r24
	.word 0xaa01ad0e  ! 23: ADD_I	add 	%r6, 0x0d0e, %r21
	.word 0xa210c005  ! 23: OR_R	or 	%r3, %r5, %r17
	.word 0x9e09e932  ! 23: AND_I	and 	%r7, 0x0932, %r15
	.word 0xbe10c005  ! 23: OR_R	or 	%r3, %r5, %r31
	.word 0xb4012ca9  ! 23: ADD_I	add 	%r4, 0x0ca9, %r26
	.word 0xaa01ecb9  ! 23: ADD_I	add 	%r7, 0x0cb9, %r21
	.word 0xbe09a4f6  ! 23: AND_I	and 	%r6, 0x04f6, %r31
	.word 0x9a00c005  ! 23: ADD_R	add 	%r3, %r5, %r13
	.word 0x9c08e866  ! 23: AND_I	and 	%r3, 0x0866, %r14
	.word 0xb2108005  ! 23: OR_R	or 	%r2, %r5, %r25
	.word 0xa6118005  ! 23: OR_R	or 	%r6, %r5, %r19
	.word 0xb0090005  ! 23: AND_R	and 	%r4, %r5, %r24
	.word 0xb201c005  ! 23: ADD_R	add 	%r7, %r5, %r25
	.word 0xb2012037  ! 23: ADD_I	add 	%r4, 0x0037, %r25
	.word 0xaa098005  ! 23: AND_R	and 	%r6, %r5, %r21
	.word 0xaa11e817  ! 23: OR_I	or 	%r7, 0x0817, %r21
	.word 0xa6018005  ! 23: ADD_R	add 	%r6, %r5, %r19
	.word 0xaa0127dc  ! 23: ADD_I	add 	%r4, 0x07dc, %r21
	.word 0xa4092820  ! 23: AND_I	and 	%r4, 0x0820, %r18
	.word 0xb8098005  ! 23: AND_R	and 	%r6, %r5, %r28
	.word 0xaa090005  ! 23: AND_R	and 	%r4, %r5, %r21
	.word 0xa4108005  ! 23: OR_R	or 	%r2, %r5, %r18
	.word 0x9a008005  ! 23: ADD_R	add 	%r2, %r5, %r13
	.word 0x9a09a798  ! 23: AND_I	and 	%r6, 0x0798, %r13
	.word 0xa6090005  ! 23: AND_R	and 	%r4, %r5, %r19
	.word 0xaa00c005  ! 23: ADD_R	add 	%r3, %r5, %r21
	.word 0xa6098005  ! 23: AND_R	and 	%r6, %r5, %r19
	.word 0xaa092d39  ! 23: AND_I	and 	%r4, 0x0d39, %r21
	.word 0xbe10c005  ! 23: OR_R	or 	%r3, %r5, %r31
	.word 0xa410a7eb  ! 23: OR_I	or 	%r2, 0x07eb, %r18
	.word 0xb011e7dd  ! 23: OR_I	or 	%r7, 0x07dd, %r24
	.word 0x9c10c005  ! 23: OR_R	or 	%r3, %r5, %r14
	.word 0x9c09c005  ! 23: AND_R	and 	%r7, %r5, %r14
	.word 0xa010eb03  ! 23: OR_I	or 	%r3, 0x0b03, %r16
	.word 0xbe008005  ! 23: ADD_R	add 	%r2, %r5, %r31
	.word 0xbe10e099  ! 23: OR_I	or 	%r3, 0x0099, %r31
	.word 0x9e10a98d  ! 23: OR_I	or 	%r2, 0x098d, %r15
	.word 0xa801227c  ! 23: ADD_I	add 	%r4, 0x027c, %r20
	.word 0xb6008005  ! 23: ADD_R	add 	%r2, %r5, %r27
	.word 0xb4018005  ! 23: ADD_R	add 	%r6, %r5, %r26
	.word 0xb411a751  ! 23: OR_I	or 	%r6, 0x0751, %r26
	.word 0x9a10c005  ! 23: OR_R	or 	%r3, %r5, %r13
	.word 0xac088005  ! 23: AND_R	and 	%r2, %r5, %r22
	.word 0xf420ef20  ! 23: STW_I	stw	%r26, [%r3 + 0x0f20]
	.word 0xde20a784  ! 23: STW_I	stw	%r15, [%r2 + 0x0784]
	.word 0xe631a95a  ! 23: STH_I	sth	%r19, [%r6 + 0x095a]
	.word 0xda29e950  ! 23: STB_I	stb	%r13, [%r7 + 0x0950]
IRF_CE_9:
!$EV error(1,expr(@VA(.MAIN.IRF_CE_9), 16, 16), 1,IRF,ce,5,x, x,x,x, x,x,x)
!$EV error(1,expr(@VA(.MAIN.IRF_CE_9), 16, 16), 3,IRF,ce,49,x, x,x,x, x,x,x)
	.word 0xea31aee8  ! 23: STH_I	sth	%r21, [%r6 + 0x0ee8]
	.word 0xe0312ea2  ! 23: STH_I	sth	%r16, [%r4 + 0x0ea2]
	.word 0xfc212604  ! 23: STW_I	stw	%r30, [%r4 + 0x0604]
	.word 0xeef89005  ! 23: SWAPA_R	swapa	%r23, [%r2 + %r5] 0x80
	.word 0xae08ab58  ! 23: AND_I	and 	%r2, 0x0b58, %r23
	.word 0xb611c005  ! 23: OR_R	or 	%r7, %r5, %r27
	bne thr1_loop_2
	subcc %g1, 0x1, %g1
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr1_loop_3:
	.word 0xaa088005  ! 30: AND_R	and 	%r2, %r5, %r21
	.word 0xb811c005  ! 30: OR_R	or 	%r7, %r5, %r28
	.word 0xb811c005  ! 30: OR_R	or 	%r7, %r5, %r28
	.word 0xb4012d57  ! 30: ADD_I	add 	%r4, 0x0d57, %r26
	.word 0xb0088005  ! 30: AND_R	and 	%r2, %r5, %r24
	.word 0x9e09e426  ! 30: AND_I	and 	%r7, 0x0426, %r15
	.word 0xb8098005  ! 30: AND_R	and 	%r6, %r5, %r28
	.word 0xaa08ae83  ! 30: AND_I	and 	%r2, 0x0e83, %r21
	.word 0xbc10a060  ! 30: OR_I	or 	%r2, 0x0060, %r30
	.word 0xb610c005  ! 30: OR_R	or 	%r3, %r5, %r27
	.word 0xa4008005  ! 30: ADD_R	add 	%r2, %r5, %r18
	.word 0xa208a2db  ! 30: AND_I	and 	%r2, 0x02db, %r17
	.word 0xa411269e  ! 30: OR_I	or 	%r4, 0x069e, %r18
	.word 0xaa08c005  ! 30: AND_R	and 	%r3, %r5, %r21
	.word 0xb000eab0  ! 30: ADD_I	add 	%r3, 0x0ab0, %r24
	.word 0xae11c005  ! 30: OR_R	or 	%r7, %r5, %r23
	.word 0xb8088005  ! 30: AND_R	and 	%r2, %r5, %r28
	.word 0xa801c005  ! 30: ADD_R	add 	%r7, %r5, %r20
	.word 0xb0108005  ! 30: OR_R	or 	%r2, %r5, %r24
	.word 0x9c10e32a  ! 30: OR_I	or 	%r3, 0x032a, %r14
	.word 0xb409e709  ! 30: AND_I	and 	%r7, 0x0709, %r26
	.word 0xba01ef51  ! 30: ADD_I	add 	%r7, 0x0f51, %r29
	.word 0xba118005  ! 30: OR_R	or 	%r6, %r5, %r29
	.word 0xb4008005  ! 30: ADD_R	add 	%r2, %r5, %r26
	.word 0xae11a390  ! 30: OR_I	or 	%r6, 0x0390, %r23
	.word 0xa400adfe  ! 30: ADD_I	add 	%r2, 0x0dfe, %r18
	.word 0xac09c005  ! 30: AND_R	and 	%r7, %r5, %r22
	.word 0xbc112be4  ! 30: OR_I	or 	%r4, 0x0be4, %r30
	.word 0xb401af0b  ! 30: ADD_I	add 	%r6, 0x0f0b, %r26
	.word 0x9e09c005  ! 30: AND_R	and 	%r7, %r5, %r15
	.word 0xbc01c005  ! 30: ADD_R	add 	%r7, %r5, %r30
	.word 0xb20921a7  ! 30: AND_I	and 	%r4, 0x01a7, %r25
	.word 0xb409a630  ! 30: AND_I	and 	%r6, 0x0630, %r26
	.word 0xbc08a667  ! 30: AND_I	and 	%r2, 0x0667, %r30
	.word 0x9a09e872  ! 30: AND_I	and 	%r7, 0x0872, %r13
	.word 0x9c090005  ! 30: AND_R	and 	%r4, %r5, %r14
	.word 0xb600abb0  ! 30: ADD_I	add 	%r2, 0x0bb0, %r27
	.word 0xb001a257  ! 30: ADD_I	add 	%r6, 0x0257, %r24
	.word 0xa601c005  ! 30: ADD_R	add 	%r7, %r5, %r19
	.word 0xbc00abc4  ! 30: ADD_I	add 	%r2, 0x0bc4, %r30
	.word 0xbe00ad5f  ! 30: ADD_I	add 	%r2, 0x0d5f, %r31
	.word 0xbe00ebf1  ! 30: ADD_I	add 	%r3, 0x0bf1, %r31
	.word 0x9a09a4b1  ! 30: AND_I	and 	%r6, 0x04b1, %r13
	.word 0xb411c005  ! 30: OR_R	or 	%r7, %r5, %r26
	.word 0xb2008005  ! 30: ADD_R	add 	%r2, %r5, %r25
	.word 0xaa09c005  ! 30: AND_R	and 	%r7, %r5, %r21
	.word 0xa409c005  ! 30: AND_R	and 	%r7, %r5, %r18
	.word 0x9e08ead8  ! 30: AND_I	and 	%r3, 0x0ad8, %r15
	.word 0xba09e581  ! 30: AND_I	and 	%r7, 0x0581, %r29
	.word 0xbc008005  ! 30: ADD_R	add 	%r2, %r5, %r30
	.word 0xa0008005  ! 30: ADD_R	add 	%r2, %r5, %r16
	.word 0xb210e061  ! 30: OR_I	or 	%r3, 0x0061, %r25
	.word 0xb000adab  ! 30: ADD_I	add 	%r2, 0x0dab, %r24
	.word 0xb409e285  ! 30: AND_I	and 	%r7, 0x0285, %r26
	.word 0xa000e547  ! 30: ADD_I	add 	%r3, 0x0547, %r16
	.word 0x9e108005  ! 30: OR_R	or 	%r2, %r5, %r15
	.word 0xb001c005  ! 30: ADD_R	add 	%r7, %r5, %r24
	.word 0x9e00ae86  ! 30: ADD_I	add 	%r2, 0x0e86, %r15
	.word 0xaa01c005  ! 30: ADD_R	add 	%r7, %r5, %r21
	.word 0xb80926ec  ! 30: AND_I	and 	%r4, 0x06ec, %r28
	.word 0xaa010005  ! 30: ADD_R	add 	%r4, %r5, %r21
	.word 0xa208a6cb  ! 30: AND_I	and 	%r2, 0x06cb, %r17
	.word 0xa011c005  ! 30: OR_R	or 	%r7, %r5, %r16
	.word 0x9c092245  ! 30: AND_I	and 	%r4, 0x0245, %r14
	.word 0xa0010005  ! 30: ADD_R	add 	%r4, %r5, %r16
	.word 0xb008c005  ! 30: AND_R	and 	%r3, %r5, %r24
	.word 0xb60921dd  ! 30: AND_I	and 	%r4, 0x01dd, %r27
	.word 0xac08aeff  ! 30: AND_I	and 	%r2, 0x0eff, %r22
	.word 0xbe09a135  ! 30: AND_I	and 	%r6, 0x0135, %r31
	.word 0xa0112540  ! 30: OR_I	or 	%r4, 0x0540, %r16
	.word 0xa010ac66  ! 30: OR_I	or 	%r2, 0x0c66, %r16
	.word 0xbe108005  ! 30: OR_R	or 	%r2, %r5, %r31
	.word 0xa601c005  ! 30: ADD_R	add 	%r7, %r5, %r19
	.word 0x9c098005  ! 30: AND_R	and 	%r6, %r5, %r14
	.word 0x9c00a99e  ! 30: ADD_I	add 	%r2, 0x099e, %r14
	.word 0xbc008005  ! 30: ADD_R	add 	%r2, %r5, %r30
	.word 0xa608a551  ! 30: AND_I	and 	%r2, 0x0551, %r19
	.word 0xb810aa18  ! 30: OR_I	or 	%r2, 0x0a18, %r28
	.word 0x9a092753  ! 30: AND_I	and 	%r4, 0x0753, %r13
	.word 0xaa08c005  ! 30: AND_R	and 	%r3, %r5, %r21
	.word 0xa208e7bd  ! 30: AND_I	and 	%r3, 0x07bd, %r17
	.word 0xbc090005  ! 30: AND_R	and 	%r4, %r5, %r30
	.word 0xa009ab54  ! 30: AND_I	and 	%r6, 0x0b54, %r16
	.word 0xba10af33  ! 30: OR_I	or 	%r2, 0x0f33, %r29
	.word 0xaa088005  ! 30: AND_R	and 	%r2, %r5, %r21
	.word 0xb810c005  ! 30: OR_R	or 	%r3, %r5, %r28
	.word 0xb0008005  ! 30: ADD_R	add 	%r2, %r5, %r24
	.word 0xac108005  ! 30: OR_R	or 	%r2, %r5, %r22
	.word 0xb610e1c4  ! 30: OR_I	or 	%r3, 0x01c4, %r27
	.word 0x9a11ef5f  ! 30: OR_I	or 	%r7, 0x0f5f, %r13
	.word 0xba00a491  ! 30: ADD_I	add 	%r2, 0x0491, %r29
	.word 0xae008005  ! 30: ADD_R	add 	%r2, %r5, %r23
	.word 0xb6108005  ! 30: OR_R	or 	%r2, %r5, %r27
	.word 0xb608a42f  ! 30: AND_I	and 	%r2, 0x042f, %r27
	.word 0xa210a110  ! 30: OR_I	or 	%r2, 0x0110, %r17
	.word 0xbc10c005  ! 30: OR_R	or 	%r3, %r5, %r30
	.word 0xb810a2cf  ! 30: OR_I	or 	%r2, 0x02cf, %r28
	.word 0xac110005  ! 30: OR_R	or 	%r4, %r5, %r22
	.word 0xae08e6de  ! 30: AND_I	and 	%r3, 0x06de, %r23
	.word 0xa408c005  ! 30: AND_R	and 	%r3, %r5, %r18
	.word 0xaa09ec8a  ! 30: AND_I	and 	%r7, 0x0c8a, %r21
	.word 0xb411c005  ! 30: OR_R	or 	%r7, %r5, %r26
	.word 0xb410a35b  ! 30: OR_I	or 	%r2, 0x035b, %r26
	.word 0xb801c005  ! 30: ADD_R	add 	%r7, %r5, %r28
	.word 0x9a01e104  ! 30: ADD_I	add 	%r7, 0x0104, %r13
	.word 0xa6112a5e  ! 30: OR_I	or 	%r4, 0x0a5e, %r19
	.word 0xb0108005  ! 30: OR_R	or 	%r2, %r5, %r24
	.word 0xbe09aa64  ! 30: AND_I	and 	%r6, 0x0a64, %r31
	.word 0xb211ed43  ! 30: OR_I	or 	%r7, 0x0d43, %r25
	.word 0xaa11e7ca  ! 30: OR_I	or 	%r7, 0x07ca, %r21
	.word 0xa4110005  ! 30: OR_R	or 	%r4, %r5, %r18
	.word 0xae088005  ! 30: AND_R	and 	%r2, %r5, %r23
	.word 0xb800ab1b  ! 30: ADD_I	add 	%r2, 0x0b1b, %r28
	.word 0xa809a500  ! 30: AND_I	and 	%r6, 0x0500, %r20
	.word 0xb400c005  ! 30: ADD_R	add 	%r3, %r5, %r26
	.word 0xa2088005  ! 30: AND_R	and 	%r2, %r5, %r17
	.word 0xae11c005  ! 30: OR_R	or 	%r7, %r5, %r23
	.word 0x9e118005  ! 30: OR_R	or 	%r6, %r5, %r15
	.word 0x9e01efad  ! 30: ADD_I	add 	%r7, 0x0fad, %r15
	.word 0xaa10ece5  ! 30: OR_I	or 	%r3, 0x0ce5, %r21
	.word 0xa8108005  ! 30: OR_R	or 	%r2, %r5, %r20
	.word 0xba00adb4  ! 30: ADD_I	add 	%r2, 0x0db4, %r29
	.word 0x9c01c005  ! 30: ADD_R	add 	%r7, %r5, %r14
	.word 0xa001ab08  ! 30: ADD_I	add 	%r6, 0x0b08, %r16
	.word 0xbc110005  ! 30: OR_R	or 	%r4, %r5, %r30
	.word 0xb6008005  ! 30: ADD_R	add 	%r2, %r5, %r27
	.word 0xa0018005  ! 30: ADD_R	add 	%r6, %r5, %r16
	.word 0x9e110005  ! 30: OR_R	or 	%r4, %r5, %r15
	.word 0x9c0123a9  ! 30: ADD_I	add 	%r4, 0x03a9, %r14
	.word 0xaa090005  ! 30: AND_R	and 	%r4, %r5, %r21
	.word 0xb608e7e1  ! 30: AND_I	and 	%r3, 0x07e1, %r27
	.word 0xa800aaac  ! 30: ADD_I	add 	%r2, 0x0aac, %r20
	.word 0xb611a288  ! 30: OR_I	or 	%r6, 0x0288, %r27
	.word 0xae11c005  ! 30: OR_R	or 	%r7, %r5, %r23
	.word 0x9e11efff  ! 30: OR_I	or 	%r7, 0x0fff, %r15
	.word 0xac098005  ! 30: AND_R	and 	%r6, %r5, %r22
	.word 0xb0098005  ! 30: AND_R	and 	%r6, %r5, %r24
	.word 0x9a11c005  ! 30: OR_R	or 	%r7, %r5, %r13
	.word 0x9c118005  ! 30: OR_R	or 	%r6, %r5, %r14
	.word 0xa0092d3b  ! 30: AND_I	and 	%r4, 0x0d3b, %r16
	.word 0xb210a738  ! 30: OR_I	or 	%r2, 0x0738, %r25
	.word 0xac00c005  ! 30: ADD_R	add 	%r3, %r5, %r22
	.word 0xac10aa70  ! 30: OR_I	or 	%r2, 0x0a70, %r22
	.word 0x9e088005  ! 30: AND_R	and 	%r2, %r5, %r15
	.word 0xa601a42b  ! 30: ADD_I	add 	%r6, 0x042b, %r19
	.word 0x9a088005  ! 30: AND_R	and 	%r2, %r5, %r13
	.word 0x9c118005  ! 30: OR_R	or 	%r6, %r5, %r14
	.word 0x9e110005  ! 30: OR_R	or 	%r4, %r5, %r15
	.word 0x9c09c005  ! 30: AND_R	and 	%r7, %r5, %r14
	.word 0xbc090005  ! 30: AND_R	and 	%r4, %r5, %r30
	.word 0xbc00ee86  ! 30: ADD_I	add 	%r3, 0x0e86, %r30
	.word 0xb609abbb  ! 30: AND_I	and 	%r6, 0x0bbb, %r27
	.word 0xb600ee51  ! 30: ADD_I	add 	%r3, 0x0e51, %r27
	.word 0xac00c005  ! 30: ADD_R	add 	%r3, %r5, %r22
	.word 0x9c0926f7  ! 30: AND_I	and 	%r4, 0x06f7, %r14
	.word 0xa411ec1c  ! 30: OR_I	or 	%r7, 0x0c1c, %r18
	.word 0xb008a1ac  ! 30: AND_I	and 	%r2, 0x01ac, %r24
	.word 0xac090005  ! 30: AND_R	and 	%r4, %r5, %r22
	.word 0xb0108005  ! 30: OR_R	or 	%r2, %r5, %r24
	.word 0xb600a0ac  ! 30: ADD_I	add 	%r2, 0x00ac, %r27
	.word 0xb0108005  ! 30: OR_R	or 	%r2, %r5, %r24
	.word 0xb208a910  ! 30: AND_I	and 	%r2, 0x0910, %r25
	.word 0xb61120a5  ! 30: OR_I	or 	%r4, 0x00a5, %r27
	.word 0xb611c005  ! 30: OR_R	or 	%r7, %r5, %r27
	.word 0xba10a2ca  ! 30: OR_I	or 	%r2, 0x02ca, %r29
	.word 0xba110005  ! 30: OR_R	or 	%r4, %r5, %r29
	.word 0xb4088005  ! 30: AND_R	and 	%r2, %r5, %r26
	.word 0x9c09e0f7  ! 30: AND_I	and 	%r7, 0x00f7, %r14
	.word 0xa610a8d5  ! 30: OR_I	or 	%r2, 0x08d5, %r19
	.word 0xaa10a22c  ! 30: OR_I	or 	%r2, 0x022c, %r21
	.word 0xbe08ea66  ! 30: AND_I	and 	%r3, 0x0a66, %r31
	.word 0xae10a7e1  ! 30: OR_I	or 	%r2, 0x07e1, %r23
	.word 0xa4112de6  ! 30: OR_I	or 	%r4, 0x0de6, %r18
	.word 0xa610c005  ! 30: OR_R	or 	%r3, %r5, %r19
	.word 0xac11e8ed  ! 30: OR_I	or 	%r7, 0x08ed, %r22
	.word 0xae10a22c  ! 30: OR_I	or 	%r2, 0x022c, %r23
	.word 0x9a11c005  ! 30: OR_R	or 	%r7, %r5, %r13
	.word 0xb009c005  ! 30: AND_R	and 	%r7, %r5, %r24
	.word 0xa400a5a3  ! 30: ADD_I	add 	%r2, 0x05a3, %r18
	.word 0xaa088005  ! 30: AND_R	and 	%r2, %r5, %r21
	.word 0xa0118005  ! 30: OR_R	or 	%r6, %r5, %r16
	.word 0xaa01e787  ! 30: ADD_I	add 	%r7, 0x0787, %r21
	.word 0x9e110005  ! 30: OR_R	or 	%r4, %r5, %r15
	.word 0xbc08ea6e  ! 30: AND_I	and 	%r3, 0x0a6e, %r30
	.word 0xa2012c7f  ! 30: ADD_I	add 	%r4, 0x0c7f, %r17
	.word 0xa010a275  ! 30: OR_I	or 	%r2, 0x0275, %r16
	.word 0xa2018005  ! 30: ADD_R	add 	%r6, %r5, %r17
	.word 0xbc08af8d  ! 30: AND_I	and 	%r2, 0x0f8d, %r30
	.word 0xa4010005  ! 30: ADD_R	add 	%r4, %r5, %r18
	.word 0xb801c005  ! 30: ADD_R	add 	%r7, %r5, %r28
	.word 0xae00ea20  ! 30: ADD_I	add 	%r3, 0x0a20, %r23
	.word 0xa80128d5  ! 30: ADD_I	add 	%r4, 0x08d5, %r20
	.word 0xf6212ab4  ! 30: STW_I	stw	%r27, [%r4 + 0x0ab4]
	.word 0xdc712900  ! 30: STX_I	stx	%r14, [%r4 + 0x0900]
	.word 0xf620a878  ! 30: STW_I	stw	%r27, [%r2 + 0x0878]
	.word 0xf070a608  ! 30: STX_I	stx	%r24, [%r2 + 0x0608]
IRF_CE_13:
!$EV error(1,expr(@VA(.MAIN.IRF_CE_13), 16, 16), 1,IRF,ce,0,x, x,x,x, x,x,x)
!$EV error(1,expr(@VA(.MAIN.IRF_CE_13), 16, 16), 3,IRF,ce,64,x, x,x,x, x,x,x)
	.word 0xf4212930  ! 30: STW_I	stw	%r26, [%r4 + 0x0930]
	.word 0xda312b26  ! 30: STH_I	sth	%r13, [%r4 + 0x0b26]
	.word 0xfe31a496  ! 30: STH_I	sth	%r31, [%r6 + 0x0496]
	.word 0xf6e8d005  ! 30: LDSTUBA_R	ldstuba	%r27, [%r3 + %r5] 0x80
	.word 0xba08a24a  ! 30: AND_I	and 	%r2, 0x024a, %r29
	.word 0xac118005  ! 30: OR_R	or 	%r6, %r5, %r22
	bne thr1_loop_3
	subcc %g1, 0x1, %g1
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr1_loop_4:
	.word 0x9e08e676  ! 37: AND_I	and 	%r3, 0x0676, %r15
	.word 0xba01e79c  ! 37: ADD_I	add 	%r7, 0x079c, %r29
	.word 0xae108005  ! 37: OR_R	or 	%r2, %r5, %r23
	.word 0xa0010005  ! 37: ADD_R	add 	%r4, %r5, %r16
	.word 0xa809e353  ! 37: AND_I	and 	%r7, 0x0353, %r20
	.word 0xae118005  ! 37: OR_R	or 	%r6, %r5, %r23
	.word 0xa409ae75  ! 37: AND_I	and 	%r6, 0x0e75, %r18
	.word 0x9a118005  ! 37: OR_R	or 	%r6, %r5, %r13
	.word 0xa609af47  ! 37: AND_I	and 	%r6, 0x0f47, %r19
	.word 0xb610ebea  ! 37: OR_I	or 	%r3, 0x0bea, %r27
	.word 0xbe108005  ! 37: OR_R	or 	%r2, %r5, %r31
	.word 0xac08a08d  ! 37: AND_I	and 	%r2, 0x008d, %r22
	.word 0xbc112f85  ! 37: OR_I	or 	%r4, 0x0f85, %r30
	.word 0xae088005  ! 37: AND_R	and 	%r2, %r5, %r23
	.word 0xb211c005  ! 37: OR_R	or 	%r7, %r5, %r25
	.word 0xbc11272f  ! 37: OR_I	or 	%r4, 0x072f, %r30
	.word 0xa010a855  ! 37: OR_I	or 	%r2, 0x0855, %r16
	.word 0xa601c005  ! 37: ADD_R	add 	%r7, %r5, %r19
	.word 0xb408a2e6  ! 37: AND_I	and 	%r2, 0x02e6, %r26
	.word 0xb401c005  ! 37: ADD_R	add 	%r7, %r5, %r26
	.word 0xbc08e0ae  ! 37: AND_I	and 	%r3, 0x00ae, %r30
	.word 0xae108005  ! 37: OR_R	or 	%r2, %r5, %r23
	.word 0xaa110005  ! 37: OR_R	or 	%r4, %r5, %r21
	.word 0xae08a761  ! 37: AND_I	and 	%r2, 0x0761, %r23
	.word 0xba10ef43  ! 37: OR_I	or 	%r3, 0x0f43, %r29
	.word 0xb201a74d  ! 37: ADD_I	add 	%r6, 0x074d, %r25
	.word 0x9e110005  ! 37: OR_R	or 	%r4, %r5, %r15
	.word 0xa808a5ae  ! 37: AND_I	and 	%r2, 0x05ae, %r20
	.word 0xb200c005  ! 37: ADD_R	add 	%r3, %r5, %r25
	.word 0xbe11aa38  ! 37: OR_I	or 	%r6, 0x0a38, %r31
	.word 0xae01a915  ! 37: ADD_I	add 	%r6, 0x0915, %r23
	.word 0xa0108005  ! 37: OR_R	or 	%r2, %r5, %r16
	.word 0xbe11ab09  ! 37: OR_I	or 	%r6, 0x0b09, %r31
	.word 0xb0092e00  ! 37: AND_I	and 	%r4, 0x0e00, %r24
	.word 0xbc11ab1f  ! 37: OR_I	or 	%r6, 0x0b1f, %r30
	.word 0xac01ae2b  ! 37: ADD_I	add 	%r6, 0x0e2b, %r22
	.word 0xa000c005  ! 37: ADD_R	add 	%r3, %r5, %r16
	.word 0xa6112627  ! 37: OR_I	or 	%r4, 0x0627, %r19
	.word 0xa800c005  ! 37: ADD_R	add 	%r3, %r5, %r20
	.word 0xb4008005  ! 37: ADD_R	add 	%r2, %r5, %r26
	.word 0xb2090005  ! 37: AND_R	and 	%r4, %r5, %r25
	.word 0xa410aa3d  ! 37: OR_I	or 	%r2, 0x0a3d, %r18
	.word 0xae09a5cf  ! 37: AND_I	and 	%r6, 0x05cf, %r23
	.word 0xbc09a291  ! 37: AND_I	and 	%r6, 0x0291, %r30
	.word 0xb209a72c  ! 37: AND_I	and 	%r6, 0x072c, %r25
	.word 0xba0122a7  ! 37: ADD_I	add 	%r4, 0x02a7, %r29
	.word 0xbe01c005  ! 37: ADD_R	add 	%r7, %r5, %r31
	.word 0xb4112848  ! 37: OR_I	or 	%r4, 0x0848, %r26
	.word 0xa61126b8  ! 37: OR_I	or 	%r4, 0x06b8, %r19
	.word 0xa000aac7  ! 37: ADD_I	add 	%r2, 0x0ac7, %r16
	.word 0x9e11e0e5  ! 37: OR_I	or 	%r7, 0x00e5, %r15
	.word 0xac01c005  ! 37: ADD_R	add 	%r7, %r5, %r22
	.word 0xb208e696  ! 37: AND_I	and 	%r3, 0x0696, %r25
	.word 0xa208ebf4  ! 37: AND_I	and 	%r3, 0x0bf4, %r17
	.word 0xb8112cdc  ! 37: OR_I	or 	%r4, 0x0cdc, %r28
	.word 0xa410a496  ! 37: OR_I	or 	%r2, 0x0496, %r18
	.word 0xb4008005  ! 37: ADD_R	add 	%r2, %r5, %r26
	.word 0xa0088005  ! 37: AND_R	and 	%r2, %r5, %r16
	.word 0xb400c005  ! 37: ADD_R	add 	%r3, %r5, %r26
	.word 0xa6118005  ! 37: OR_R	or 	%r6, %r5, %r19
	.word 0xb409e8e3  ! 37: AND_I	and 	%r7, 0x08e3, %r26
	.word 0xbe112919  ! 37: OR_I	or 	%r4, 0x0919, %r31
	.word 0xa0108005  ! 37: OR_R	or 	%r2, %r5, %r16
	.word 0xb011ec32  ! 37: OR_I	or 	%r7, 0x0c32, %r24
	.word 0xb009c005  ! 37: AND_R	and 	%r7, %r5, %r24
	.word 0xa011e0fc  ! 37: OR_I	or 	%r7, 0x00fc, %r16
	.word 0xa6090005  ! 37: AND_R	and 	%r4, %r5, %r19
	.word 0x9c108005  ! 37: OR_R	or 	%r2, %r5, %r14
	.word 0xa411e2c0  ! 37: OR_I	or 	%r7, 0x02c0, %r18
	.word 0xb800c005  ! 37: ADD_R	add 	%r3, %r5, %r28
	.word 0x9a110005  ! 37: OR_R	or 	%r4, %r5, %r13
	.word 0xac08ea3c  ! 37: AND_I	and 	%r3, 0x0a3c, %r22
	.word 0xb211c005  ! 37: OR_R	or 	%r7, %r5, %r25
	.word 0x9c01eb53  ! 37: ADD_I	add 	%r7, 0x0b53, %r14
	.word 0xa4008005  ! 37: ADD_R	add 	%r2, %r5, %r18
	.word 0x9a10c005  ! 37: OR_R	or 	%r3, %r5, %r13
	.word 0xb008add4  ! 37: AND_I	and 	%r2, 0x0dd4, %r24
	.word 0x9a09a8ef  ! 37: AND_I	and 	%r6, 0x08ef, %r13
	.word 0xa210ad2f  ! 37: OR_I	or 	%r2, 0x0d2f, %r17
	.word 0xa8008005  ! 37: ADD_R	add 	%r2, %r5, %r20
	.word 0xba01e5d1  ! 37: ADD_I	add 	%r7, 0x05d1, %r29
	.word 0xb410e09f  ! 37: OR_I	or 	%r3, 0x009f, %r26
	.word 0x9e08ade1  ! 37: AND_I	and 	%r2, 0x0de1, %r15
	.word 0xa400a622  ! 37: ADD_I	add 	%r2, 0x0622, %r18
	.word 0xbe098005  ! 37: AND_R	and 	%r6, %r5, %r31
	.word 0xa408a6ef  ! 37: AND_I	and 	%r2, 0x06ef, %r18
	.word 0xac008005  ! 37: ADD_R	add 	%r2, %r5, %r22
	.word 0xa6088005  ! 37: AND_R	and 	%r2, %r5, %r19
	.word 0xae01a6e0  ! 37: ADD_I	add 	%r6, 0x06e0, %r23
	.word 0xa4088005  ! 37: AND_R	and 	%r2, %r5, %r18
	.word 0xa6108005  ! 37: OR_R	or 	%r2, %r5, %r19
	.word 0xa8112711  ! 37: OR_I	or 	%r4, 0x0711, %r20
	.word 0x9a092b3f  ! 37: AND_I	and 	%r4, 0x0b3f, %r13
	.word 0xb009e48e  ! 37: AND_I	and 	%r7, 0x048e, %r24
	.word 0xa6008005  ! 37: ADD_R	add 	%r2, %r5, %r19
	.word 0xbe10a78b  ! 37: OR_I	or 	%r2, 0x078b, %r31
	.word 0xb8092f7f  ! 37: AND_I	and 	%r4, 0x0f7f, %r28
	.word 0xb6088005  ! 37: AND_R	and 	%r2, %r5, %r27
	.word 0xa409a843  ! 37: AND_I	and 	%r6, 0x0843, %r18
	.word 0xa4008005  ! 37: ADD_R	add 	%r2, %r5, %r18
	.word 0xa000c005  ! 37: ADD_R	add 	%r3, %r5, %r16
	.word 0x9e010005  ! 37: ADD_R	add 	%r4, %r5, %r15
	.word 0xae08a379  ! 37: AND_I	and 	%r2, 0x0379, %r23
	.word 0xba012d56  ! 37: ADD_I	add 	%r4, 0x0d56, %r29
	.word 0xae00c005  ! 37: ADD_R	add 	%r3, %r5, %r23
	.word 0xae08a8fa  ! 37: AND_I	and 	%r2, 0x08fa, %r23
	.word 0xbc10ad96  ! 37: OR_I	or 	%r2, 0x0d96, %r30
	.word 0xb401ab60  ! 37: ADD_I	add 	%r6, 0x0b60, %r26
	.word 0xb601e633  ! 37: ADD_I	add 	%r7, 0x0633, %r27
	.word 0xa2090005  ! 37: AND_R	and 	%r4, %r5, %r17
	.word 0xb410c005  ! 37: OR_R	or 	%r3, %r5, %r26
	.word 0xac09a136  ! 37: AND_I	and 	%r6, 0x0136, %r22
	.word 0xba098005  ! 37: AND_R	and 	%r6, %r5, %r29
	.word 0xbe09c005  ! 37: AND_R	and 	%r7, %r5, %r31
	.word 0xae11a08e  ! 37: OR_I	or 	%r6, 0x008e, %r23
	.word 0xb6008005  ! 37: ADD_R	add 	%r2, %r5, %r27
	.word 0xaa08c005  ! 37: AND_R	and 	%r3, %r5, %r21
	.word 0xa411a4c9  ! 37: OR_I	or 	%r6, 0x04c9, %r18
	.word 0xb0008005  ! 37: ADD_R	add 	%r2, %r5, %r24
	.word 0x9e008005  ! 37: ADD_R	add 	%r2, %r5, %r15
	.word 0xa811a48b  ! 37: OR_I	or 	%r6, 0x048b, %r20
	.word 0xaa09a8c1  ! 37: AND_I	and 	%r6, 0x08c1, %r21
	.word 0xa801ec51  ! 37: ADD_I	add 	%r7, 0x0c51, %r20
	.word 0x9e11ed08  ! 37: OR_I	or 	%r7, 0x0d08, %r15
	.word 0xb608a09a  ! 37: AND_I	and 	%r2, 0x009a, %r27
	.word 0xae108005  ! 37: OR_R	or 	%r2, %r5, %r23
	.word 0x9a01a8b2  ! 37: ADD_I	add 	%r6, 0x08b2, %r13
	.word 0xac00a180  ! 37: ADD_I	add 	%r2, 0x0180, %r22
	.word 0xb009ed5c  ! 37: AND_I	and 	%r7, 0x0d5c, %r24
	.word 0xbe00a362  ! 37: ADD_I	add 	%r2, 0x0362, %r31
	.word 0xae088005  ! 37: AND_R	and 	%r2, %r5, %r23
	.word 0xbc09ed9f  ! 37: AND_I	and 	%r7, 0x0d9f, %r30
	.word 0x9e08c005  ! 37: AND_R	and 	%r3, %r5, %r15
	.word 0xac008005  ! 37: ADD_R	add 	%r2, %r5, %r22
	.word 0xbc10a745  ! 37: OR_I	or 	%r2, 0x0745, %r30
	.word 0xae11c005  ! 37: OR_R	or 	%r7, %r5, %r23
	.word 0xf821eb90  ! 37: STW_I	stw	%r28, [%r7 + 0x0b90]
	.word 0xe421a4c0  ! 37: STW_I	stw	%r18, [%r6 + 0x04c0]
	.word 0xf2312e80  ! 37: STH_I	sth	%r25, [%r4 + 0x0e80]
	.word 0xe0712458  ! 37: STX_I	stx	%r16, [%r4 + 0x0458]
IRF_CE_17:
!$EV error(1,expr(@VA(.MAIN.IRF_CE_17), 16, 16), 1,IRF,ce,41,x, x,x,x, x,x,x)
!$EV error(1,expr(@VA(.MAIN.IRF_CE_17), 16, 16), 3,IRF,ce,23,x, x,x,x, x,x,x)
	.word 0xf470e3d0  ! 37: STX_I	stx	%r26, [%r3 + 0x03d0]
	.word 0xe6712c78  ! 37: STX_I	stx	%r19, [%r4 + 0x0c78]
	.word 0xe271acf8  ! 37: STX_I	stx	%r17, [%r6 + 0x0cf8]
	.word 0xee20e424  ! 37: STW_I	stw	%r23, [%r3 + 0x0424]
	.word 0xa210a2af  ! 37: OR_I	or 	%r2, 0x02af, %r17
	.word 0xb209c005  ! 37: AND_R	and 	%r7, %r5, %r25
	bne thr1_loop_4
	subcc %g1, 0x1, %g1
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr1_loop_5:
	.word 0xb010a914  ! 44: OR_I	or 	%r2, 0x0914, %r24
	.word 0xaa08c005  ! 44: AND_R	and 	%r3, %r5, %r21
	.word 0xae008005  ! 44: ADD_R	add 	%r2, %r5, %r23
	.word 0xa0012041  ! 44: ADD_I	add 	%r4, 0x0041, %r16
	.word 0x9c008005  ! 44: ADD_R	add 	%r2, %r5, %r14
	.word 0xae09a423  ! 44: AND_I	and 	%r6, 0x0423, %r23
	.word 0xba108005  ! 44: OR_R	or 	%r2, %r5, %r29
	.word 0xae08ee18  ! 44: AND_I	and 	%r3, 0x0e18, %r23
	.word 0xb8008005  ! 44: ADD_R	add 	%r2, %r5, %r28
	.word 0xa609e06e  ! 44: AND_I	and 	%r7, 0x006e, %r19
	.word 0xb600c005  ! 44: ADD_R	add 	%r3, %r5, %r27
	.word 0xb6090005  ! 44: AND_R	and 	%r4, %r5, %r27
	.word 0xaa01a7cc  ! 44: ADD_I	add 	%r6, 0x07cc, %r21
	.word 0xb8010005  ! 44: ADD_R	add 	%r4, %r5, %r28
	.word 0x9c088005  ! 44: AND_R	and 	%r2, %r5, %r14
	.word 0x9c010005  ! 44: ADD_R	add 	%r4, %r5, %r14
	.word 0x9c08ae9d  ! 44: AND_I	and 	%r2, 0x0e9d, %r14
	.word 0xbe01a3a4  ! 44: ADD_I	add 	%r6, 0x03a4, %r31
	.word 0x9c01e648  ! 44: ADD_I	add 	%r7, 0x0648, %r14
	.word 0x9e10c005  ! 44: OR_R	or 	%r3, %r5, %r15
	.word 0xb600e86c  ! 44: ADD_I	add 	%r3, 0x086c, %r27
	.word 0xb2012a4a  ! 44: ADD_I	add 	%r4, 0x0a4a, %r25
	.word 0xb811c005  ! 44: OR_R	or 	%r7, %r5, %r28
	.word 0xb210aee9  ! 44: OR_I	or 	%r2, 0x0ee9, %r25
	.word 0xb008a366  ! 44: AND_I	and 	%r2, 0x0366, %r24
	.word 0xb4088005  ! 44: AND_R	and 	%r2, %r5, %r26
	.word 0xaa118005  ! 44: OR_R	or 	%r6, %r5, %r21
	.word 0xa008c005  ! 44: AND_R	and 	%r3, %r5, %r16
	.word 0xaa11c005  ! 44: OR_R	or 	%r7, %r5, %r21
	.word 0xba01ecb2  ! 44: ADD_I	add 	%r7, 0x0cb2, %r29
	.word 0xb0018005  ! 44: ADD_R	add 	%r6, %r5, %r24
	.word 0x9e10c005  ! 44: OR_R	or 	%r3, %r5, %r15
	.word 0xbe11ec12  ! 44: OR_I	or 	%r7, 0x0c12, %r31
	.word 0xac0923f8  ! 44: AND_I	and 	%r4, 0x03f8, %r22
	.word 0xaa088005  ! 44: AND_R	and 	%r2, %r5, %r21
	.word 0xaa08c005  ! 44: AND_R	and 	%r3, %r5, %r21
	.word 0xa201c005  ! 44: ADD_R	add 	%r7, %r5, %r17
	.word 0xb609eac6  ! 44: AND_I	and 	%r7, 0x0ac6, %r27
	.word 0xbe00a102  ! 44: ADD_I	add 	%r2, 0x0102, %r31
	.word 0xb4108005  ! 44: OR_R	or 	%r2, %r5, %r26
	.word 0xa408eb34  ! 44: AND_I	and 	%r3, 0x0b34, %r18
	.word 0xa201a01e  ! 44: ADD_I	add 	%r6, 0x001e, %r17
	.word 0xbc092d64  ! 44: AND_I	and 	%r4, 0x0d64, %r30
	.word 0x9c01a13a  ! 44: ADD_I	add 	%r6, 0x013a, %r14
	.word 0x9a00c005  ! 44: ADD_R	add 	%r3, %r5, %r13
	.word 0xba08a5c4  ! 44: AND_I	and 	%r2, 0x05c4, %r29
	.word 0xa610a008  ! 44: OR_I	or 	%r2, 0x0008, %r19
	.word 0xa010ecda  ! 44: OR_I	or 	%r3, 0x0cda, %r16
	.word 0xa6018005  ! 44: ADD_R	add 	%r6, %r5, %r19
	.word 0xa0010005  ! 44: ADD_R	add 	%r4, %r5, %r16
	.word 0xaa118005  ! 44: OR_R	or 	%r6, %r5, %r21
	.word 0xbc010005  ! 44: ADD_R	add 	%r4, %r5, %r30
	.word 0xbc10eaca  ! 44: OR_I	or 	%r3, 0x0aca, %r30
	.word 0xba11ecad  ! 44: OR_I	or 	%r7, 0x0cad, %r29
	.word 0xb409e39b  ! 44: AND_I	and 	%r7, 0x039b, %r26
	.word 0xa611211b  ! 44: OR_I	or 	%r4, 0x011b, %r19
	.word 0x9c10a488  ! 44: OR_I	or 	%r2, 0x0488, %r14
	.word 0x9a090005  ! 44: AND_R	and 	%r4, %r5, %r13
	.word 0xbe118005  ! 44: OR_R	or 	%r6, %r5, %r31
	.word 0xa2110005  ! 44: OR_R	or 	%r4, %r5, %r17
	.word 0xb0008005  ! 44: ADD_R	add 	%r2, %r5, %r24
	.word 0xb2108005  ! 44: OR_R	or 	%r2, %r5, %r25
	.word 0xa011c005  ! 44: OR_R	or 	%r7, %r5, %r16
	.word 0xa210af50  ! 44: OR_I	or 	%r2, 0x0f50, %r17
	.word 0xba11afae  ! 44: OR_I	or 	%r6, 0x0fae, %r29
	.word 0xa0110005  ! 44: OR_R	or 	%r4, %r5, %r16
	.word 0x9e08a781  ! 44: AND_I	and 	%r2, 0x0781, %r15
	.word 0xae11aafb  ! 44: OR_I	or 	%r6, 0x0afb, %r23
	.word 0xa8008005  ! 44: ADD_R	add 	%r2, %r5, %r20
	.word 0xb800af66  ! 44: ADD_I	add 	%r2, 0x0f66, %r28
	.word 0xa40922ab  ! 44: AND_I	and 	%r4, 0x02ab, %r18
	.word 0xba11c005  ! 44: OR_R	or 	%r7, %r5, %r29
	.word 0xae00e74f  ! 44: ADD_I	add 	%r3, 0x074f, %r23
	.word 0xba11e6dc  ! 44: OR_I	or 	%r7, 0x06dc, %r29
	.word 0xa208aa64  ! 44: AND_I	and 	%r2, 0x0a64, %r17
	.word 0x9a00a59b  ! 44: ADD_I	add 	%r2, 0x059b, %r13
	.word 0x9e09c005  ! 44: AND_R	and 	%r7, %r5, %r15
	.word 0x9c018005  ! 44: ADD_R	add 	%r6, %r5, %r14
	.word 0x9c01299a  ! 44: ADD_I	add 	%r4, 0x099a, %r14
	.word 0xaa09c005  ! 44: AND_R	and 	%r7, %r5, %r21
	.word 0x9c01c005  ! 44: ADD_R	add 	%r7, %r5, %r14
	.word 0xa6090005  ! 44: AND_R	and 	%r4, %r5, %r19
	.word 0xac00aee8  ! 44: ADD_I	add 	%r2, 0x0ee8, %r22
	.word 0xbc10a3f8  ! 44: OR_I	or 	%r2, 0x03f8, %r30
	.word 0xaa00e085  ! 44: ADD_I	add 	%r3, 0x0085, %r21
	.word 0xba108005  ! 44: OR_R	or 	%r2, %r5, %r29
	.word 0xbc08e76b  ! 44: AND_I	and 	%r3, 0x076b, %r30
	.word 0xb0092e38  ! 44: AND_I	and 	%r4, 0x0e38, %r24
	.word 0xb8098005  ! 44: AND_R	and 	%r6, %r5, %r28
	.word 0xa000c005  ! 44: ADD_R	add 	%r3, %r5, %r16
	.word 0xb408a296  ! 44: AND_I	and 	%r2, 0x0296, %r26
	.word 0xa400e970  ! 44: ADD_I	add 	%r3, 0x0970, %r18
	.word 0xb4010005  ! 44: ADD_R	add 	%r4, %r5, %r26
	.word 0xbc00c005  ! 44: ADD_R	add 	%r3, %r5, %r30
	.word 0xb208e03f  ! 44: AND_I	and 	%r3, 0x003f, %r25
	.word 0xb210a401  ! 44: OR_I	or 	%r2, 0x0401, %r25
	.word 0xac09e83b  ! 44: AND_I	and 	%r7, 0x083b, %r22
	.word 0xb0090005  ! 44: AND_R	and 	%r4, %r5, %r24
	.word 0x9a012a1b  ! 44: ADD_I	add 	%r4, 0x0a1b, %r13
	.word 0x9c01c005  ! 44: ADD_R	add 	%r7, %r5, %r14
	.word 0xbe110005  ! 44: OR_R	or 	%r4, %r5, %r31
	.word 0x9c012164  ! 44: ADD_I	add 	%r4, 0x0164, %r14
	.word 0xbc110005  ! 44: OR_R	or 	%r4, %r5, %r30
	.word 0xae01c005  ! 44: ADD_R	add 	%r7, %r5, %r23
	.word 0xaa09aeab  ! 44: AND_I	and 	%r6, 0x0eab, %r21
	.word 0xae10af59  ! 44: OR_I	or 	%r2, 0x0f59, %r23
	.word 0xa2008005  ! 44: ADD_R	add 	%r2, %r5, %r17
	.word 0xa4018005  ! 44: ADD_R	add 	%r6, %r5, %r18
	.word 0xbc008005  ! 44: ADD_R	add 	%r2, %r5, %r30
	.word 0xbc10a5fe  ! 44: OR_I	or 	%r2, 0x05fe, %r30
	.word 0xaa08affc  ! 44: AND_I	and 	%r2, 0x0ffc, %r21
	.word 0x9c00a89f  ! 44: ADD_I	add 	%r2, 0x089f, %r14
	.word 0xa010acf4  ! 44: OR_I	or 	%r2, 0x0cf4, %r16
	.word 0xa208eb7c  ! 44: AND_I	and 	%r3, 0x0b7c, %r17
	.word 0x9a088005  ! 44: AND_R	and 	%r2, %r5, %r13
	.word 0xac110005  ! 44: OR_R	or 	%r4, %r5, %r22
	.word 0xa6010005  ! 44: ADD_R	add 	%r4, %r5, %r19
	.word 0xb410c005  ! 44: OR_R	or 	%r3, %r5, %r26
	.word 0x9e11aff8  ! 44: OR_I	or 	%r6, 0x0ff8, %r15
	.word 0xbc09ee2c  ! 44: AND_I	and 	%r7, 0x0e2c, %r30
	.word 0xb208aa73  ! 44: AND_I	and 	%r2, 0x0a73, %r25
	.word 0xbe09c005  ! 44: AND_R	and 	%r7, %r5, %r31
	.word 0xbc01226b  ! 44: ADD_I	add 	%r4, 0x026b, %r30
	.word 0x9e09c005  ! 44: AND_R	and 	%r7, %r5, %r15
	.word 0xb809c005  ! 44: AND_R	and 	%r7, %r5, %r28
	.word 0xb411af97  ! 44: OR_I	or 	%r6, 0x0f97, %r26
	.word 0xba10a631  ! 44: OR_I	or 	%r2, 0x0631, %r29
	.word 0xae11a052  ! 44: OR_I	or 	%r6, 0x0052, %r23
	.word 0xa8018005  ! 44: ADD_R	add 	%r6, %r5, %r20
	.word 0xaa088005  ! 44: AND_R	and 	%r2, %r5, %r21
	.word 0xac09e378  ! 44: AND_I	and 	%r7, 0x0378, %r22
	.word 0x9e00a98f  ! 44: ADD_I	add 	%r2, 0x098f, %r15
	.word 0xb809a363  ! 44: AND_I	and 	%r6, 0x0363, %r28
	.word 0xa609a68b  ! 44: AND_I	and 	%r6, 0x068b, %r19
	.word 0x9e00e238  ! 44: ADD_I	add 	%r3, 0x0238, %r15
	.word 0xb2098005  ! 44: AND_R	and 	%r6, %r5, %r25
	.word 0xbc09c005  ! 44: AND_R	and 	%r7, %r5, %r30
	.word 0xbe018005  ! 44: ADD_R	add 	%r6, %r5, %r31
	.word 0xba088005  ! 44: AND_R	and 	%r2, %r5, %r29
	.word 0xb208a9af  ! 44: AND_I	and 	%r2, 0x09af, %r25
	.word 0xa210a47d  ! 44: OR_I	or 	%r2, 0x047d, %r17
	.word 0xb411e1ac  ! 44: OR_I	or 	%r7, 0x01ac, %r26
	.word 0x9c01e9dd  ! 44: ADD_I	add 	%r7, 0x09dd, %r14
	.word 0xae098005  ! 44: AND_R	and 	%r6, %r5, %r23
	.word 0xae088005  ! 44: AND_R	and 	%r2, %r5, %r23
	.word 0x9e108005  ! 44: OR_R	or 	%r2, %r5, %r15
	.word 0xac10eca8  ! 44: OR_I	or 	%r3, 0x0ca8, %r22
	.word 0xb208c005  ! 44: AND_R	and 	%r3, %r5, %r25
	.word 0xb411ed89  ! 44: OR_I	or 	%r7, 0x0d89, %r26
	.word 0x9a092d3a  ! 44: AND_I	and 	%r4, 0x0d3a, %r13
	.word 0xa210c005  ! 44: OR_R	or 	%r3, %r5, %r17
	.word 0xae09e7af  ! 44: AND_I	and 	%r7, 0x07af, %r23
	.word 0xa801e5fb  ! 44: ADD_I	add 	%r7, 0x05fb, %r20
	.word 0x9a08ab37  ! 44: AND_I	and 	%r2, 0x0b37, %r13
	.word 0xa6012743  ! 44: ADD_I	add 	%r4, 0x0743, %r19
	.word 0xac09a741  ! 44: AND_I	and 	%r6, 0x0741, %r22
	.word 0xac088005  ! 44: AND_R	and 	%r2, %r5, %r22
	.word 0xbc00aa0e  ! 44: ADD_I	add 	%r2, 0x0a0e, %r30
	.word 0xa210e737  ! 44: OR_I	or 	%r3, 0x0737, %r17
	.word 0xbc01e15b  ! 44: ADD_I	add 	%r7, 0x015b, %r30
	.word 0xb609c005  ! 44: AND_R	and 	%r7, %r5, %r27
	.word 0x9c018005  ! 44: ADD_R	add 	%r6, %r5, %r14
	.word 0xa6008005  ! 44: ADD_R	add 	%r2, %r5, %r19
	.word 0xa010aa1a  ! 44: OR_I	or 	%r2, 0x0a1a, %r16
	.word 0xa8088005  ! 44: AND_R	and 	%r2, %r5, %r20
	.word 0xba00c005  ! 44: ADD_R	add 	%r3, %r5, %r29
	.word 0xb2008005  ! 44: ADD_R	add 	%r2, %r5, %r25
	.word 0xa6108005  ! 44: OR_R	or 	%r2, %r5, %r19
	.word 0xb008c005  ! 44: AND_R	and 	%r3, %r5, %r24
	.word 0xaa11c005  ! 44: OR_R	or 	%r7, %r5, %r21
	.word 0xa2110005  ! 44: OR_R	or 	%r4, %r5, %r17
	.word 0x9e11a343  ! 44: OR_I	or 	%r6, 0x0343, %r15
	.word 0xa000a46a  ! 44: ADD_I	add 	%r2, 0x046a, %r16
	.word 0xac108005  ! 44: OR_R	or 	%r2, %r5, %r22
	.word 0xa61125e9  ! 44: OR_I	or 	%r4, 0x05e9, %r19
	.word 0xb601ac41  ! 44: ADD_I	add 	%r6, 0x0c41, %r27
	.word 0xa8018005  ! 44: ADD_R	add 	%r6, %r5, %r20
	.word 0xa8110005  ! 44: OR_R	or 	%r4, %r5, %r20
	.word 0xa600e4cb  ! 44: ADD_I	add 	%r3, 0x04cb, %r19
	.word 0xac11c005  ! 44: OR_R	or 	%r7, %r5, %r22
	.word 0xb009a34f  ! 44: AND_I	and 	%r6, 0x034f, %r24
	.word 0xa209e8e3  ! 44: AND_I	and 	%r7, 0x08e3, %r17
	.word 0xb0110005  ! 44: OR_R	or 	%r4, %r5, %r24
	.word 0xa009a417  ! 44: AND_I	and 	%r6, 0x0417, %r16
	.word 0xb6008005  ! 44: ADD_R	add 	%r2, %r5, %r27
	.word 0x9e10eb05  ! 44: OR_I	or 	%r3, 0x0b05, %r15
	.word 0xae08adda  ! 44: AND_I	and 	%r2, 0x0dda, %r23
	.word 0xac098005  ! 44: AND_R	and 	%r6, %r5, %r22
	.word 0x9c110005  ! 44: OR_R	or 	%r4, %r5, %r14
	.word 0xac108005  ! 44: OR_R	or 	%r2, %r5, %r22
	.word 0x9e08c005  ! 44: AND_R	and 	%r3, %r5, %r15
	.word 0x9a00a2a4  ! 44: ADD_I	add 	%r2, 0x02a4, %r13
	.word 0xaa008005  ! 44: ADD_R	add 	%r2, %r5, %r21
	.word 0xb610af3b  ! 44: OR_I	or 	%r2, 0x0f3b, %r27
	.word 0xbc00ae3e  ! 44: ADD_I	add 	%r2, 0x0e3e, %r30
	.word 0xbe108005  ! 44: OR_R	or 	%r2, %r5, %r31
	.word 0xae008005  ! 44: ADD_R	add 	%r2, %r5, %r23
	.word 0xb010ae41  ! 44: OR_I	or 	%r2, 0x0e41, %r24
	.word 0xb2108005  ! 44: OR_R	or 	%r2, %r5, %r25
	.word 0xac11ef28  ! 44: OR_I	or 	%r7, 0x0f28, %r22
	.word 0xbc10c005  ! 44: OR_R	or 	%r3, %r5, %r30
	.word 0xb2092743  ! 44: AND_I	and 	%r4, 0x0743, %r25
	.word 0xa010a95c  ! 44: OR_I	or 	%r2, 0x095c, %r16
	.word 0xae098005  ! 44: AND_R	and 	%r6, %r5, %r23
	.word 0xba110005  ! 44: OR_R	or 	%r4, %r5, %r29
	.word 0xa210e64e  ! 44: OR_I	or 	%r3, 0x064e, %r17
	.word 0xbc108005  ! 44: OR_R	or 	%r2, %r5, %r30
	.word 0xbc08c005  ! 44: AND_R	and 	%r3, %r5, %r30
	.word 0xfa21aca8  ! 44: STW_I	stw	%r29, [%r6 + 0x0ca8]
	.word 0xf8312774  ! 44: STH_I	sth	%r28, [%r4 + 0x0774]
	.word 0xe221ec80  ! 44: STW_I	stw	%r17, [%r7 + 0x0c80]
	.word 0xfe31a6ea  ! 44: STH_I	sth	%r31, [%r6 + 0x06ea]
IRF_CE_21:
!$EV error(1,expr(@VA(.MAIN.IRF_CE_21), 16, 16), 1,IRF,ce,32,x, x,x,x, x,x,x)
!$EV error(1,expr(@VA(.MAIN.IRF_CE_21), 16, 16), 3,IRF,ce,56,x, x,x,x, x,x,x)
	.word 0xf231e112  ! 44: STH_I	sth	%r25, [%r7 + 0x0112]
	.word 0xf228a0b5  ! 44: STB_I	stb	%r25, [%r2 + 0x00b5]
	.word 0xdc712ea0  ! 44: STX_I	stx	%r14, [%r4 + 0x0ea0]
	.word 0xdb388005  ! 44: STDF_R	std	%f13, [%r5, %r2]
	.word 0xa209c005  ! 44: AND_R	and 	%r7, %r5, %r17
	.word 0xbc010005  ! 44: ADD_R	add 	%r4, %r5, %r30
	bne thr1_loop_5
	subcc %g1, 0x1, %g1
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr1_loop_6:
	.word 0x9e0922bc  ! 51: AND_I	and 	%r4, 0x02bc, %r15
	.word 0xa6118005  ! 51: OR_R	or 	%r6, %r5, %r19
	.word 0xa6008005  ! 51: ADD_R	add 	%r2, %r5, %r19
	.word 0xaa088005  ! 51: AND_R	and 	%r2, %r5, %r21
	.word 0x9e110005  ! 51: OR_R	or 	%r4, %r5, %r15
	.word 0xa401c005  ! 51: ADD_R	add 	%r7, %r5, %r18
	.word 0xb2008005  ! 51: ADD_R	add 	%r2, %r5, %r25
	.word 0xb608ae1d  ! 51: AND_I	and 	%r2, 0x0e1d, %r27
	.word 0xb001204a  ! 51: ADD_I	add 	%r4, 0x004a, %r24
	.word 0x9c008005  ! 51: ADD_R	add 	%r2, %r5, %r14
	.word 0xba10e4b6  ! 51: OR_I	or 	%r3, 0x04b6, %r29
	.word 0xa6010005  ! 51: ADD_R	add 	%r4, %r5, %r19
	.word 0xa410e81b  ! 51: OR_I	or 	%r3, 0x081b, %r18
	.word 0xa600c005  ! 51: ADD_R	add 	%r3, %r5, %r19
	.word 0xb009c005  ! 51: AND_R	and 	%r7, %r5, %r24
	.word 0xb000aaab  ! 51: ADD_I	add 	%r2, 0x0aab, %r24
	.word 0xa0010005  ! 51: ADD_R	add 	%r4, %r5, %r16
	.word 0xb609ef3c  ! 51: AND_I	and 	%r7, 0x0f3c, %r27
	.word 0xa6092c24  ! 51: AND_I	and 	%r4, 0x0c24, %r19
	.word 0xb611c005  ! 51: OR_R	or 	%r7, %r5, %r27
	.word 0xb6110005  ! 51: OR_R	or 	%r4, %r5, %r27
	.word 0xa201a027  ! 51: ADD_I	add 	%r6, 0x0027, %r17
	.word 0xba10a09d  ! 51: OR_I	or 	%r2, 0x009d, %r29
	.word 0xa2088005  ! 51: AND_R	and 	%r2, %r5, %r17
	.word 0xb810e7c1  ! 51: OR_I	or 	%r3, 0x07c1, %r28
	.word 0xb208aac2  ! 51: AND_I	and 	%r2, 0x0ac2, %r25
	.word 0xbe008005  ! 51: ADD_R	add 	%r2, %r5, %r31
	.word 0xb4118005  ! 51: OR_R	or 	%r6, %r5, %r26
	.word 0xbc118005  ! 51: OR_R	or 	%r6, %r5, %r30
	.word 0x9e110005  ! 51: OR_R	or 	%r4, %r5, %r15
	.word 0xa6018005  ! 51: ADD_R	add 	%r6, %r5, %r19
	.word 0xba112597  ! 51: OR_I	or 	%r4, 0x0597, %r29
	.word 0xbc11a46a  ! 51: OR_I	or 	%r6, 0x046a, %r30
	.word 0xbe008005  ! 51: ADD_R	add 	%r2, %r5, %r31
	.word 0xb010c005  ! 51: OR_R	or 	%r3, %r5, %r24
	.word 0x9e00c005  ! 51: ADD_R	add 	%r3, %r5, %r15
	.word 0xbe010005  ! 51: ADD_R	add 	%r4, %r5, %r31
	.word 0xa410a8c6  ! 51: OR_I	or 	%r2, 0x08c6, %r18
	.word 0x9a01aaeb  ! 51: ADD_I	add 	%r6, 0x0aeb, %r13
	.word 0xac110005  ! 51: OR_R	or 	%r4, %r5, %r22
	.word 0x9e09c005  ! 51: AND_R	and 	%r7, %r5, %r15
	.word 0xa0108005  ! 51: OR_R	or 	%r2, %r5, %r16
	.word 0xa8098005  ! 51: AND_R	and 	%r6, %r5, %r20
	.word 0x9a018005  ! 51: ADD_R	add 	%r6, %r5, %r13
	.word 0xbe092da8  ! 51: AND_I	and 	%r4, 0x0da8, %r31
	.word 0x9a00e6c4  ! 51: ADD_I	add 	%r3, 0x06c4, %r13
	.word 0xaa012521  ! 51: ADD_I	add 	%r4, 0x0521, %r21
	.word 0xa0110005  ! 51: OR_R	or 	%r4, %r5, %r16
	.word 0xba112e67  ! 51: OR_I	or 	%r4, 0x0e67, %r29
	.word 0x9e11c005  ! 51: OR_R	or 	%r7, %r5, %r15
	.word 0xa8088005  ! 51: AND_R	and 	%r2, %r5, %r20
	.word 0xb80928f9  ! 51: AND_I	and 	%r4, 0x08f9, %r28
	.word 0xa409c005  ! 51: AND_R	and 	%r7, %r5, %r18
	.word 0xa609a582  ! 51: AND_I	and 	%r6, 0x0582, %r19
	.word 0xb8008005  ! 51: ADD_R	add 	%r2, %r5, %r28
	.word 0xb001a7b7  ! 51: ADD_I	add 	%r6, 0x07b7, %r24
	.word 0x9c01ea7d  ! 51: ADD_I	add 	%r7, 0x0a7d, %r14
	.word 0xac1123f8  ! 51: OR_I	or 	%r4, 0x03f8, %r22
	.word 0xb8018005  ! 51: ADD_R	add 	%r6, %r5, %r28
	.word 0xb8012c9d  ! 51: ADD_I	add 	%r4, 0x0c9d, %r28
	.word 0xac08a1f4  ! 51: AND_I	and 	%r2, 0x01f4, %r22
	.word 0xbe110005  ! 51: OR_R	or 	%r4, %r5, %r31
	.word 0xb008e6fd  ! 51: AND_I	and 	%r3, 0x06fd, %r24
	.word 0xa4110005  ! 51: OR_R	or 	%r4, %r5, %r18
	.word 0xb011aa79  ! 51: OR_I	or 	%r6, 0x0a79, %r24
	.word 0xbe00a279  ! 51: ADD_I	add 	%r2, 0x0279, %r31
	.word 0xbc108005  ! 51: OR_R	or 	%r2, %r5, %r30
	.word 0xac10a461  ! 51: OR_I	or 	%r2, 0x0461, %r22
	.word 0xac00c005  ! 51: ADD_R	add 	%r3, %r5, %r22
	.word 0xaa11eca9  ! 51: OR_I	or 	%r7, 0x0ca9, %r21
	.word 0xbe112f13  ! 51: OR_I	or 	%r4, 0x0f13, %r31
	.word 0xa211ae77  ! 51: OR_I	or 	%r6, 0x0e77, %r17
	.word 0xbe11ec68  ! 51: OR_I	or 	%r7, 0x0c68, %r31
	.word 0xa409e3d7  ! 51: AND_I	and 	%r7, 0x03d7, %r18
	.word 0xa810e93b  ! 51: OR_I	or 	%r3, 0x093b, %r20
	.word 0xac09ab1e  ! 51: AND_I	and 	%r6, 0x0b1e, %r22
	.word 0xba1120f7  ! 51: OR_I	or 	%r4, 0x00f7, %r29
	.word 0x9c00a8b9  ! 51: ADD_I	add 	%r2, 0x08b9, %r14
	.word 0xae09c005  ! 51: AND_R	and 	%r7, %r5, %r23
	.word 0xb2110005  ! 51: OR_R	or 	%r4, %r5, %r25
	.word 0xb60924f0  ! 51: AND_I	and 	%r4, 0x04f0, %r27
	.word 0xbc098005  ! 51: AND_R	and 	%r6, %r5, %r30
	.word 0xbc092c00  ! 51: AND_I	and 	%r4, 0x0c00, %r30
	.word 0xac00a249  ! 51: ADD_I	add 	%r2, 0x0249, %r22
	.word 0xac09ee06  ! 51: AND_I	and 	%r7, 0x0e06, %r22
	.word 0xba00ad1f  ! 51: ADD_I	add 	%r2, 0x0d1f, %r29
	.word 0xaa018005  ! 51: ADD_R	add 	%r6, %r5, %r21
	.word 0xa800e00c  ! 51: ADD_I	add 	%r3, 0x000c, %r20
	.word 0x9e00e08c  ! 51: ADD_I	add 	%r3, 0x008c, %r15
	.word 0xba01e2a9  ! 51: ADD_I	add 	%r7, 0x02a9, %r29
	.word 0xa0090005  ! 51: AND_R	and 	%r4, %r5, %r16
	.word 0xbc10c005  ! 51: OR_R	or 	%r3, %r5, %r30
	.word 0xb0118005  ! 51: OR_R	or 	%r6, %r5, %r24
	.word 0xac098005  ! 51: AND_R	and 	%r6, %r5, %r22
	.word 0xb208ab68  ! 51: AND_I	and 	%r2, 0x0b68, %r25
	.word 0xb409ae9f  ! 51: AND_I	and 	%r6, 0x0e9f, %r26
	.word 0xb000a900  ! 51: ADD_I	add 	%r2, 0x0900, %r24
	.word 0x9c108005  ! 51: OR_R	or 	%r2, %r5, %r14
	.word 0xb601e8f2  ! 51: ADD_I	add 	%r7, 0x08f2, %r27
	.word 0xae092e88  ! 51: AND_I	and 	%r4, 0x0e88, %r23
	.word 0xa8010005  ! 51: ADD_R	add 	%r4, %r5, %r20
	.word 0xac09c005  ! 51: AND_R	and 	%r7, %r5, %r22
	.word 0xbc010005  ! 51: ADD_R	add 	%r4, %r5, %r30
	.word 0xa611a453  ! 51: OR_I	or 	%r6, 0x0453, %r19
	.word 0x9e108005  ! 51: OR_R	or 	%r2, %r5, %r15
	.word 0xaa08ac0f  ! 51: AND_I	and 	%r2, 0x0c0f, %r21
	.word 0x9c10e2a5  ! 51: OR_I	or 	%r3, 0x02a5, %r14
	.word 0xbc09aa9f  ! 51: AND_I	and 	%r6, 0x0a9f, %r30
	.word 0xb808a1fb  ! 51: AND_I	and 	%r2, 0x01fb, %r28
	.word 0x9c00a0fd  ! 51: ADD_I	add 	%r2, 0x00fd, %r14
	.word 0xbe01c005  ! 51: ADD_R	add 	%r7, %r5, %r31
	.word 0xae08c005  ! 51: AND_R	and 	%r3, %r5, %r23
	.word 0x9c08aad5  ! 51: AND_I	and 	%r2, 0x0ad5, %r14
	.word 0xa200e9bb  ! 51: ADD_I	add 	%r3, 0x09bb, %r17
	.word 0x9c010005  ! 51: ADD_R	add 	%r4, %r5, %r14
	.word 0xa6108005  ! 51: OR_R	or 	%r2, %r5, %r19
	.word 0xaa08af35  ! 51: AND_I	and 	%r2, 0x0f35, %r21
	.word 0x9c008005  ! 51: ADD_R	add 	%r2, %r5, %r14
	.word 0xbe10a418  ! 51: OR_I	or 	%r2, 0x0418, %r31
	.word 0xa0010005  ! 51: ADD_R	add 	%r4, %r5, %r16
	.word 0xae09acf9  ! 51: AND_I	and 	%r6, 0x0cf9, %r23
	.word 0xb401ec69  ! 51: ADD_I	add 	%r7, 0x0c69, %r26
	.word 0xb2118005  ! 51: OR_R	or 	%r6, %r5, %r25
	.word 0xa010a86f  ! 51: OR_I	or 	%r2, 0x086f, %r16
	.word 0xa0088005  ! 51: AND_R	and 	%r2, %r5, %r16
	.word 0xa801ed06  ! 51: ADD_I	add 	%r7, 0x0d06, %r20
	.word 0xa601e3f2  ! 51: ADD_I	add 	%r7, 0x03f2, %r19
	.word 0xb211222e  ! 51: OR_I	or 	%r4, 0x022e, %r25
	.word 0xb010a469  ! 51: OR_I	or 	%r2, 0x0469, %r24
	.word 0x9a00a42c  ! 51: ADD_I	add 	%r2, 0x042c, %r13
	.word 0xae008005  ! 51: ADD_R	add 	%r2, %r5, %r23
	.word 0xac11c005  ! 51: OR_R	or 	%r7, %r5, %r22
	.word 0xbc10a849  ! 51: OR_I	or 	%r2, 0x0849, %r30
	.word 0xb001c005  ! 51: ADD_R	add 	%r7, %r5, %r24
	.word 0x9c10aacf  ! 51: OR_I	or 	%r2, 0x0acf, %r14
	.word 0xaa118005  ! 51: OR_R	or 	%r6, %r5, %r21
	.word 0xac012844  ! 51: ADD_I	add 	%r4, 0x0844, %r22
	.word 0x9e010005  ! 51: ADD_R	add 	%r4, %r5, %r15
	.word 0xb600a1cc  ! 51: ADD_I	add 	%r2, 0x01cc, %r27
	.word 0xb6008005  ! 51: ADD_R	add 	%r2, %r5, %r27
	.word 0xa608c005  ! 51: AND_R	and 	%r3, %r5, %r19
	.word 0xac012eb2  ! 51: ADD_I	add 	%r4, 0x0eb2, %r22
	.word 0xa410ea75  ! 51: OR_I	or 	%r3, 0x0a75, %r18
	.word 0xb8108005  ! 51: OR_R	or 	%r2, %r5, %r28
	.word 0xb6118005  ! 51: OR_R	or 	%r6, %r5, %r27
	.word 0xbe10eb7a  ! 51: OR_I	or 	%r3, 0x0b7a, %r31
	.word 0xba01c005  ! 51: ADD_R	add 	%r7, %r5, %r29
	.word 0xaa008005  ! 51: ADD_R	add 	%r2, %r5, %r21
	.word 0xb6110005  ! 51: OR_R	or 	%r4, %r5, %r27
	.word 0xa809a258  ! 51: AND_I	and 	%r6, 0x0258, %r20
	.word 0xb0088005  ! 51: AND_R	and 	%r2, %r5, %r24
	.word 0xa208af5d  ! 51: AND_I	and 	%r2, 0x0f5d, %r17
	.word 0xb2092c06  ! 51: AND_I	and 	%r4, 0x0c06, %r25
	.word 0xa60129cb  ! 51: ADD_I	add 	%r4, 0x09cb, %r19
	.word 0x9e012624  ! 51: ADD_I	add 	%r4, 0x0624, %r15
	.word 0xb8090005  ! 51: AND_R	and 	%r4, %r5, %r28
	.word 0xa4008005  ! 51: ADD_R	add 	%r2, %r5, %r18
	.word 0xaa088005  ! 51: AND_R	and 	%r2, %r5, %r21
	.word 0xb009296a  ! 51: AND_I	and 	%r4, 0x096a, %r24
	.word 0xb200a15e  ! 51: ADD_I	add 	%r2, 0x015e, %r25
	.word 0x9c118005  ! 51: OR_R	or 	%r6, %r5, %r14
	.word 0xbe00c005  ! 51: ADD_R	add 	%r3, %r5, %r31
	.word 0xa2008005  ! 51: ADD_R	add 	%r2, %r5, %r17
	.word 0xa608a81c  ! 51: AND_I	and 	%r2, 0x081c, %r19
	.word 0x9e01c005  ! 51: ADD_R	add 	%r7, %r5, %r15
	.word 0xb601c005  ! 51: ADD_R	add 	%r7, %r5, %r27
	.word 0xb0110005  ! 51: OR_R	or 	%r4, %r5, %r24
	.word 0xb209e224  ! 51: AND_I	and 	%r7, 0x0224, %r25
	.word 0xa611ad20  ! 51: OR_I	or 	%r6, 0x0d20, %r19
	.word 0xa2012de0  ! 51: ADD_I	add 	%r4, 0x0de0, %r17
	.word 0xba10ec27  ! 51: OR_I	or 	%r3, 0x0c27, %r29
	.word 0x9c08ec1b  ! 51: AND_I	and 	%r3, 0x0c1b, %r14
	.word 0x9c108005  ! 51: OR_R	or 	%r2, %r5, %r14
	.word 0xaa08aa26  ! 51: AND_I	and 	%r2, 0x0a26, %r21
	.word 0x9e11a2e5  ! 51: OR_I	or 	%r6, 0x02e5, %r15
	.word 0xb211e8b0  ! 51: OR_I	or 	%r7, 0x08b0, %r25
	.word 0x9a09c005  ! 51: AND_R	and 	%r7, %r5, %r13
	.word 0xa6112934  ! 51: OR_I	or 	%r4, 0x0934, %r19
	.word 0xbe11ae15  ! 51: OR_I	or 	%r6, 0x0e15, %r31
	.word 0xb811c005  ! 51: OR_R	or 	%r7, %r5, %r28
	.word 0xa609c005  ! 51: AND_R	and 	%r7, %r5, %r19
	.word 0x9a098005  ! 51: AND_R	and 	%r6, %r5, %r13
	.word 0xb600a715  ! 51: ADD_I	add 	%r2, 0x0715, %r27
	.word 0xa601e7a1  ! 51: ADD_I	add 	%r7, 0x07a1, %r19
	.word 0xb400c005  ! 51: ADD_R	add 	%r3, %r5, %r26
	.word 0x9c09ac28  ! 51: AND_I	and 	%r6, 0x0c28, %r14
	.word 0xae112eba  ! 51: OR_I	or 	%r4, 0x0eba, %r23
	.word 0xb8118005  ! 51: OR_R	or 	%r6, %r5, %r28
	.word 0xb010a2b4  ! 51: OR_I	or 	%r2, 0x02b4, %r24
	.word 0xb000c005  ! 51: ADD_R	add 	%r3, %r5, %r24
	.word 0xac11af5b  ! 51: OR_I	or 	%r6, 0x0f5b, %r22
	.word 0xae01a336  ! 51: ADD_I	add 	%r6, 0x0336, %r23
	.word 0xa200eb35  ! 51: ADD_I	add 	%r3, 0x0b35, %r17
	.word 0xa401c005  ! 51: ADD_R	add 	%r7, %r5, %r18
	.word 0x9c018005  ! 51: ADD_R	add 	%r6, %r5, %r14
	.word 0xa811e022  ! 51: OR_I	or 	%r7, 0x0022, %r20
	.word 0xbc108005  ! 51: OR_R	or 	%r2, %r5, %r30
	.word 0xaa00e1ca  ! 51: ADD_I	add 	%r3, 0x01ca, %r21
	.word 0xae08a8b9  ! 51: AND_I	and 	%r2, 0x08b9, %r23
	.word 0xa8018005  ! 51: ADD_R	add 	%r6, %r5, %r20
	.word 0xb6110005  ! 51: OR_R	or 	%r4, %r5, %r27
	.word 0xac090005  ! 51: AND_R	and 	%r4, %r5, %r22
	.word 0xb800a69a  ! 51: ADD_I	add 	%r2, 0x069a, %r28
	.word 0xbc018005  ! 51: ADD_R	add 	%r6, %r5, %r30
	.word 0xbe008005  ! 51: ADD_R	add 	%r2, %r5, %r31
	.word 0xae018005  ! 51: ADD_R	add 	%r6, %r5, %r23
	.word 0xb401c005  ! 51: ADD_R	add 	%r7, %r5, %r26
	.word 0xa010c005  ! 51: OR_R	or 	%r3, %r5, %r16
	.word 0xae10e78b  ! 51: OR_I	or 	%r3, 0x078b, %r23
	.word 0xaa01c005  ! 51: ADD_R	add 	%r7, %r5, %r21
	.word 0xba01c005  ! 51: ADD_R	add 	%r7, %r5, %r29
	.word 0xac00e453  ! 51: ADD_I	add 	%r3, 0x0453, %r22
	.word 0xba092fac  ! 51: AND_I	and 	%r4, 0x0fac, %r29
	.word 0xac01e0b3  ! 51: ADD_I	add 	%r7, 0x00b3, %r22
	.word 0x9a08e343  ! 51: AND_I	and 	%r3, 0x0343, %r13
	.word 0x9e08c005  ! 51: AND_R	and 	%r3, %r5, %r15
	.word 0xb409e18b  ! 51: AND_I	and 	%r7, 0x018b, %r26
	.word 0xb810ae85  ! 51: OR_I	or 	%r2, 0x0e85, %r28
	.word 0xb811a1a2  ! 51: OR_I	or 	%r6, 0x01a2, %r28
	.word 0x9e01ab8a  ! 51: ADD_I	add 	%r6, 0x0b8a, %r15
	.word 0x9a00e5df  ! 51: ADD_I	add 	%r3, 0x05df, %r13
	.word 0xa2010005  ! 51: ADD_R	add 	%r4, %r5, %r17
	.word 0xaa00ac61  ! 51: ADD_I	add 	%r2, 0x0c61, %r21
	.word 0xb2010005  ! 51: ADD_R	add 	%r4, %r5, %r25
	.word 0xa800a497  ! 51: ADD_I	add 	%r2, 0x0497, %r20
	.word 0x9c010005  ! 51: ADD_R	add 	%r4, %r5, %r14
	.word 0xba00a0ff  ! 51: ADD_I	add 	%r2, 0x00ff, %r29
	.word 0xa209c005  ! 51: AND_R	and 	%r7, %r5, %r17
	.word 0xba08aa68  ! 51: AND_I	and 	%r2, 0x0a68, %r29
	.word 0x9a088005  ! 51: AND_R	and 	%r2, %r5, %r13
	.word 0xae018005  ! 51: ADD_R	add 	%r6, %r5, %r23
	.word 0xaa11e5bd  ! 51: OR_I	or 	%r7, 0x05bd, %r21
	.word 0xec212530  ! 51: STW_I	stw	%r22, [%r4 + 0x0530]
	.word 0xe431e05c  ! 51: STH_I	sth	%r18, [%r7 + 0x005c]
	.word 0xf221edb8  ! 51: STW_I	stw	%r25, [%r7 + 0x0db8]
	.word 0xde28ea3f  ! 51: STB_I	stb	%r15, [%r3 + 0x0a3f]
IRF_CE_25:
!$EV error(1,expr(@VA(.MAIN.IRF_CE_25), 16, 16), 1,IRF,ce,3,x, x,x,x, x,x,x)
!$EV error(1,expr(@VA(.MAIN.IRF_CE_25), 16, 16), 3,IRF,ce,43,x, x,x,x, x,x,x)
	.word 0xe631aefc  ! 51: STH_I	sth	%r19, [%r6 + 0x0efc]
	.word 0xda31abce  ! 51: STH_I	sth	%r13, [%r6 + 0x0bce]
	.word 0xfc20edc8  ! 51: STW_I	stw	%r30, [%r3 + 0x0dc8]
	.word 0xe5f1a005  ! 51: CASXA_R	casxa	[%r6]%asi, %r5, %r18
	.word 0xa2110005  ! 51: OR_R	or 	%r4, %r5, %r17
	.word 0xae10e570  ! 51: OR_I	or 	%r3, 0x0570, %r23
	bne thr1_loop_6
	subcc %g1, 0x1, %g1
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr1_loop_7:
	.word 0xaa090005  ! 59: AND_R	and 	%r4, %r5, %r21
	.word 0xa001ac57  ! 59: ADD_I	add 	%r6, 0x0c57, %r16
	.word 0xa210a7d8  ! 59: OR_I	or 	%r2, 0x07d8, %r17
	.word 0xb8108005  ! 59: OR_R	or 	%r2, %r5, %r28
	.word 0xaa112983  ! 59: OR_I	or 	%r4, 0x0983, %r21
	.word 0x9e01c005  ! 59: ADD_R	add 	%r7, %r5, %r15
	.word 0x9e10e3a9  ! 59: OR_I	or 	%r3, 0x03a9, %r15
	.word 0xa610a778  ! 59: OR_I	or 	%r2, 0x0778, %r19
	.word 0x9a008005  ! 59: ADD_R	add 	%r2, %r5, %r13
	.word 0xa808a035  ! 59: AND_I	and 	%r2, 0x0035, %r20
	.word 0xa4008005  ! 59: ADD_R	add 	%r2, %r5, %r18
	.word 0x9c11e4fd  ! 59: OR_I	or 	%r7, 0x04fd, %r14
	.word 0xbc090005  ! 59: AND_R	and 	%r4, %r5, %r30
	.word 0xb401e483  ! 59: ADD_I	add 	%r7, 0x0483, %r26
	.word 0xa8108005  ! 59: OR_R	or 	%r2, %r5, %r20
	.word 0xac088005  ! 59: AND_R	and 	%r2, %r5, %r22
	.word 0xb600a2d7  ! 59: ADD_I	add 	%r2, 0x02d7, %r27
	.word 0xb4088005  ! 59: AND_R	and 	%r2, %r5, %r26
	.word 0xac10c005  ! 59: OR_R	or 	%r3, %r5, %r22
	.word 0xa808c005  ! 59: AND_R	and 	%r3, %r5, %r20
	.word 0xae09ab19  ! 59: AND_I	and 	%r6, 0x0b19, %r23
	.word 0xa011e384  ! 59: OR_I	or 	%r7, 0x0384, %r16
	.word 0xbe088005  ! 59: AND_R	and 	%r2, %r5, %r31
	.word 0xa0088005  ! 59: AND_R	and 	%r2, %r5, %r16
	.word 0x9e008005  ! 59: ADD_R	add 	%r2, %r5, %r15
	.word 0x9e00ebe0  ! 59: ADD_I	add 	%r3, 0x0be0, %r15
	.word 0xb2018005  ! 59: ADD_R	add 	%r6, %r5, %r25
	.word 0xbc118005  ! 59: OR_R	or 	%r6, %r5, %r30
	.word 0xa401ed29  ! 59: ADD_I	add 	%r7, 0x0d29, %r18
	.word 0xa810c005  ! 59: OR_R	or 	%r3, %r5, %r20
	.word 0xa210ae99  ! 59: OR_I	or 	%r2, 0x0e99, %r17
	.word 0xb4118005  ! 59: OR_R	or 	%r6, %r5, %r26
	.word 0xa600e142  ! 59: ADD_I	add 	%r3, 0x0142, %r19
	.word 0xa6110005  ! 59: OR_R	or 	%r4, %r5, %r19
	.word 0x9c112df8  ! 59: OR_I	or 	%r4, 0x0df8, %r14
	.word 0xb600a5e6  ! 59: ADD_I	add 	%r2, 0x05e6, %r27
	.word 0xb8088005  ! 59: AND_R	and 	%r2, %r5, %r28
	.word 0xb009c005  ! 59: AND_R	and 	%r7, %r5, %r24
	.word 0xac088005  ! 59: AND_R	and 	%r2, %r5, %r22
	.word 0xa0108005  ! 59: OR_R	or 	%r2, %r5, %r16
	.word 0xa601c005  ! 59: ADD_R	add 	%r7, %r5, %r19
	.word 0xb8098005  ! 59: AND_R	and 	%r6, %r5, %r28
	.word 0xbc08ed28  ! 59: AND_I	and 	%r3, 0x0d28, %r30
	.word 0xa608a981  ! 59: AND_I	and 	%r2, 0x0981, %r19
	.word 0xa4108005  ! 59: OR_R	or 	%r2, %r5, %r18
	.word 0xba010005  ! 59: ADD_R	add 	%r4, %r5, %r29
	.word 0xa808ab8b  ! 59: AND_I	and 	%r2, 0x0b8b, %r20
	.word 0xac00ad5f  ! 59: ADD_I	add 	%r2, 0x0d5f, %r22
	.word 0xba098005  ! 59: AND_R	and 	%r6, %r5, %r29
	.word 0xa411ae02  ! 59: OR_I	or 	%r6, 0x0e02, %r18
	.word 0xa609c005  ! 59: AND_R	and 	%r7, %r5, %r19
	.word 0xb4018005  ! 59: ADD_R	add 	%r6, %r5, %r26
	.word 0xa61124a3  ! 59: OR_I	or 	%r4, 0x04a3, %r19
	.word 0xac108005  ! 59: OR_R	or 	%r2, %r5, %r22
	.word 0x9a00efad  ! 59: ADD_I	add 	%r3, 0x0fad, %r13
	.word 0xb8108005  ! 59: OR_R	or 	%r2, %r5, %r28
	.word 0xae09237e  ! 59: AND_I	and 	%r4, 0x037e, %r23
	.word 0xb009a06f  ! 59: AND_I	and 	%r6, 0x006f, %r24
	.word 0xa008c005  ! 59: AND_R	and 	%r3, %r5, %r16
	.word 0xaa110005  ! 59: OR_R	or 	%r4, %r5, %r21
	.word 0xba00e465  ! 59: ADD_I	add 	%r3, 0x0465, %r29
	.word 0xaa108005  ! 59: OR_R	or 	%r2, %r5, %r21
	.word 0xb408a257  ! 59: AND_I	and 	%r2, 0x0257, %r26
	.word 0xbe098005  ! 59: AND_R	and 	%r6, %r5, %r31
	.word 0xbc110005  ! 59: OR_R	or 	%r4, %r5, %r30
	.word 0x9e11ad39  ! 59: OR_I	or 	%r6, 0x0d39, %r15
	.word 0xa400afd6  ! 59: ADD_I	add 	%r2, 0x0fd6, %r18
	.word 0xac118005  ! 59: OR_R	or 	%r6, %r5, %r22
	.word 0x9a09a52d  ! 59: AND_I	and 	%r6, 0x052d, %r13
	.word 0xb808a9bf  ! 59: AND_I	and 	%r2, 0x09bf, %r28
	.word 0xa0008005  ! 59: ADD_R	add 	%r2, %r5, %r16
	.word 0xb200a3ef  ! 59: ADD_I	add 	%r2, 0x03ef, %r25
	.word 0xb600c005  ! 59: ADD_R	add 	%r3, %r5, %r27
	.word 0x9c01a3be  ! 59: ADD_I	add 	%r6, 0x03be, %r14
	.word 0x9a00c005  ! 59: ADD_R	add 	%r3, %r5, %r13
	.word 0xac08a151  ! 59: AND_I	and 	%r2, 0x0151, %r22
	.word 0xbc088005  ! 59: AND_R	and 	%r2, %r5, %r30
	.word 0x9e118005  ! 59: OR_R	or 	%r6, %r5, %r15
	.word 0xa0098005  ! 59: AND_R	and 	%r6, %r5, %r16
	.word 0xb200c005  ! 59: ADD_R	add 	%r3, %r5, %r25
	.word 0xbe09a700  ! 59: AND_I	and 	%r6, 0x0700, %r31
	.word 0xb610c005  ! 59: OR_R	or 	%r3, %r5, %r27
	.word 0x9c01e9cd  ! 59: ADD_I	add 	%r7, 0x09cd, %r14
	.word 0xae01c005  ! 59: ADD_R	add 	%r7, %r5, %r23
	.word 0xb409a91a  ! 59: AND_I	and 	%r6, 0x091a, %r26
	.word 0xb209eb45  ! 59: AND_I	and 	%r7, 0x0b45, %r25
	.word 0xb4092164  ! 59: AND_I	and 	%r4, 0x0164, %r26
	.word 0x9c092f20  ! 59: AND_I	and 	%r4, 0x0f20, %r14
	.word 0xa8110005  ! 59: OR_R	or 	%r4, %r5, %r20
	.word 0xa811e310  ! 59: OR_I	or 	%r7, 0x0310, %r20
	.word 0xa401c005  ! 59: ADD_R	add 	%r7, %r5, %r18
	.word 0xb2108005  ! 59: OR_R	or 	%r2, %r5, %r25
	.word 0xb411c005  ! 59: OR_R	or 	%r7, %r5, %r26
	.word 0xb808ac51  ! 59: AND_I	and 	%r2, 0x0c51, %r28
	.word 0xb211a5a3  ! 59: OR_I	or 	%r6, 0x05a3, %r25
	.word 0xba00ab33  ! 59: ADD_I	add 	%r2, 0x0b33, %r29
	.word 0xa601c005  ! 59: ADD_R	add 	%r7, %r5, %r19
	.word 0xa400ae51  ! 59: ADD_I	add 	%r2, 0x0e51, %r18
	.word 0xb410ecaf  ! 59: OR_I	or 	%r3, 0x0caf, %r26
	.word 0xa4092da1  ! 59: AND_I	and 	%r4, 0x0da1, %r18
	.word 0xa408a211  ! 59: AND_I	and 	%r2, 0x0211, %r18
	.word 0xac010005  ! 59: ADD_R	add 	%r4, %r5, %r22
	.word 0xb4098005  ! 59: AND_R	and 	%r6, %r5, %r26
	.word 0xa20926a4  ! 59: AND_I	and 	%r4, 0x06a4, %r17
	.word 0xba092339  ! 59: AND_I	and 	%r4, 0x0339, %r29
	.word 0xa8110005  ! 59: OR_R	or 	%r4, %r5, %r20
	.word 0xa0108005  ! 59: OR_R	or 	%r2, %r5, %r16
	.word 0x9c010005  ! 59: ADD_R	add 	%r4, %r5, %r14
	.word 0xa608ab8b  ! 59: AND_I	and 	%r2, 0x0b8b, %r19
	.word 0xa410e8ac  ! 59: OR_I	or 	%r3, 0x08ac, %r18
	.word 0xac09e08b  ! 59: AND_I	and 	%r7, 0x008b, %r22
	.word 0xac090005  ! 59: AND_R	and 	%r4, %r5, %r22
	.word 0xbc11c005  ! 59: OR_R	or 	%r7, %r5, %r30
	.word 0xb611256a  ! 59: OR_I	or 	%r4, 0x056a, %r27
	.word 0xbe090005  ! 59: AND_R	and 	%r4, %r5, %r31
	.word 0xb201efc8  ! 59: ADD_I	add 	%r7, 0x0fc8, %r25
	.word 0xa408ec59  ! 59: AND_I	and 	%r3, 0x0c59, %r18
	.word 0xba008005  ! 59: ADD_R	add 	%r2, %r5, %r29
	.word 0xa210aff2  ! 59: OR_I	or 	%r2, 0x0ff2, %r17
	.word 0x9a018005  ! 59: ADD_R	add 	%r6, %r5, %r13
	.word 0xa001c005  ! 59: ADD_R	add 	%r7, %r5, %r16
	.word 0xaa090005  ! 59: AND_R	and 	%r4, %r5, %r21
	.word 0xaa00e19a  ! 59: ADD_I	add 	%r3, 0x019a, %r21
	.word 0xa200c005  ! 59: ADD_R	add 	%r3, %r5, %r17
	.word 0xba09e373  ! 59: AND_I	and 	%r7, 0x0373, %r29
	.word 0xa2012f27  ! 59: ADD_I	add 	%r4, 0x0f27, %r17
	.word 0xba00a5e1  ! 59: ADD_I	add 	%r2, 0x05e1, %r29
	.word 0xbe008005  ! 59: ADD_R	add 	%r2, %r5, %r31
	.word 0xb001e713  ! 59: ADD_I	add 	%r7, 0x0713, %r24
	.word 0x9c00c005  ! 59: ADD_R	add 	%r3, %r5, %r14
	.word 0xa201af0a  ! 59: ADD_I	add 	%r6, 0x0f0a, %r17
	.word 0xac088005  ! 59: AND_R	and 	%r2, %r5, %r22
	.word 0x9a10a673  ! 59: OR_I	or 	%r2, 0x0673, %r13
	.word 0xae118005  ! 59: OR_R	or 	%r6, %r5, %r23
	.word 0xb60123fd  ! 59: ADD_I	add 	%r4, 0x03fd, %r27
	.word 0xa401a700  ! 59: ADD_I	add 	%r6, 0x0700, %r18
	.word 0xb408c005  ! 59: AND_R	and 	%r3, %r5, %r26
	.word 0xb8008005  ! 59: ADD_R	add 	%r2, %r5, %r28
	.word 0xb4090005  ! 59: AND_R	and 	%r4, %r5, %r26
	.word 0xaa108005  ! 59: OR_R	or 	%r2, %r5, %r21
	.word 0xae012ec8  ! 59: ADD_I	add 	%r4, 0x0ec8, %r23
	.word 0xb601e2d8  ! 59: ADD_I	add 	%r7, 0x02d8, %r27
	.word 0xa600a728  ! 59: ADD_I	add 	%r2, 0x0728, %r19
	.word 0xa4088005  ! 59: AND_R	and 	%r2, %r5, %r18
	.word 0xba090005  ! 59: AND_R	and 	%r4, %r5, %r29
	.word 0xb2108005  ! 59: OR_R	or 	%r2, %r5, %r25
	.word 0xbc11ad36  ! 59: OR_I	or 	%r6, 0x0d36, %r30
	.word 0x9a118005  ! 59: OR_R	or 	%r6, %r5, %r13
	.word 0xa2118005  ! 59: OR_R	or 	%r6, %r5, %r17
	.word 0xbc11236c  ! 59: OR_I	or 	%r4, 0x036c, %r30
	.word 0x9c01ef58  ! 59: ADD_I	add 	%r7, 0x0f58, %r14
	.word 0x9c01ee96  ! 59: ADD_I	add 	%r7, 0x0e96, %r14
	.word 0x9c090005  ! 59: AND_R	and 	%r4, %r5, %r14
	.word 0xba108005  ! 59: OR_R	or 	%r2, %r5, %r29
	.word 0x9c08a7d9  ! 59: AND_I	and 	%r2, 0x07d9, %r14
	.word 0xae01e508  ! 59: ADD_I	add 	%r7, 0x0508, %r23
	.word 0xa2108005  ! 59: OR_R	or 	%r2, %r5, %r17
	.word 0x9c10a811  ! 59: OR_I	or 	%r2, 0x0811, %r14
	.word 0xba012dd0  ! 59: ADD_I	add 	%r4, 0x0dd0, %r29
	.word 0xba10aa76  ! 59: OR_I	or 	%r2, 0x0a76, %r29
	.word 0xba110005  ! 59: OR_R	or 	%r4, %r5, %r29
	.word 0x9c018005  ! 59: ADD_R	add 	%r6, %r5, %r14
	.word 0xa200c005  ! 59: ADD_R	add 	%r3, %r5, %r17
	.word 0xba088005  ! 59: AND_R	and 	%r2, %r5, %r29
	.word 0xb209a795  ! 59: AND_I	and 	%r6, 0x0795, %r25
	.word 0x9c00e697  ! 59: ADD_I	add 	%r3, 0x0697, %r14
	.word 0xa011a0e9  ! 59: OR_I	or 	%r6, 0x00e9, %r16
	.word 0xb808a61e  ! 59: AND_I	and 	%r2, 0x061e, %r28
	.word 0xba00ae00  ! 59: ADD_I	add 	%r2, 0x0e00, %r29
	.word 0xac108005  ! 59: OR_R	or 	%r2, %r5, %r22
	.word 0xb000ecf3  ! 59: ADD_I	add 	%r3, 0x0cf3, %r24
	.word 0xa008c005  ! 59: AND_R	and 	%r3, %r5, %r16
	.word 0xaa00a818  ! 59: ADD_I	add 	%r2, 0x0818, %r21
	.word 0xb2090005  ! 59: AND_R	and 	%r4, %r5, %r25
	.word 0xb801abfd  ! 59: ADD_I	add 	%r6, 0x0bfd, %r28
	.word 0x9a108005  ! 59: OR_R	or 	%r2, %r5, %r13
	.word 0xa211a6db  ! 59: OR_I	or 	%r6, 0x06db, %r17
	.word 0xb0008005  ! 59: ADD_R	add 	%r2, %r5, %r24
	.word 0xa001ae59  ! 59: ADD_I	add 	%r6, 0x0e59, %r16
	.word 0xb4008005  ! 59: ADD_R	add 	%r2, %r5, %r26
	.word 0xb8088005  ! 59: AND_R	and 	%r2, %r5, %r28
	.word 0xb211e4ca  ! 59: OR_I	or 	%r7, 0x04ca, %r25
	.word 0xb410aad2  ! 59: OR_I	or 	%r2, 0x0ad2, %r26
	.word 0xa6108005  ! 59: OR_R	or 	%r2, %r5, %r19
	.word 0xbc00e542  ! 59: ADD_I	add 	%r3, 0x0542, %r30
	.word 0x9a09e0c7  ! 59: AND_I	and 	%r7, 0x00c7, %r13
	.word 0xb0090005  ! 59: AND_R	and 	%r4, %r5, %r24
	.word 0xb80921f0  ! 59: AND_I	and 	%r4, 0x01f0, %r28
	.word 0xb6110005  ! 59: OR_R	or 	%r4, %r5, %r27
	.word 0xb408a321  ! 59: AND_I	and 	%r2, 0x0321, %r26
	.word 0x9a088005  ! 59: AND_R	and 	%r2, %r5, %r13
	.word 0xb8090005  ! 59: AND_R	and 	%r4, %r5, %r28
	.word 0xde21a9f4  ! 59: STW_I	stw	%r15, [%r6 + 0x09f4]
	.word 0xe030aab0  ! 59: STH_I	sth	%r16, [%r2 + 0x0ab0]
	.word 0xec3120b8  ! 59: STH_I	sth	%r22, [%r4 + 0x00b8]
	.word 0xfa21ea08  ! 59: STW_I	stw	%r29, [%r7 + 0x0a08]
IRF_CE_29:
!$EV error(1,expr(@VA(.MAIN.IRF_CE_29), 16, 16), 1,IRF,ce,58,x, x,x,x, x,x,x)
!$EV error(1,expr(@VA(.MAIN.IRF_CE_29), 16, 16), 3,IRF,ce,5,x, x,x,x, x,x,x)
	.word 0xfa20a1f4  ! 59: STW_I	stw	%r29, [%r2 + 0x01f4]
	.word 0xde29e68a  ! 59: STB_I	stb	%r15, [%r7 + 0x068a]
	.word 0xf631e18a  ! 59: STH_I	sth	%r27, [%r7 + 0x018a]
	.word 0xd6f24988  ! 59: STXA_R	stxa	%r11, [%r9 + %r8] 0x4c
	.word 0xa4088005  ! 59: AND_R	and 	%r2, %r5, %r18
	.word 0xae092ad0  ! 59: AND_I	and 	%r4, 0x0ad0, %r23
	bne thr1_loop_7
	subcc %g1, 0x1, %g1
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr1_loop_8:
	.word 0x9c08a2fd  ! 66: AND_I	and 	%r2, 0x02fd, %r14
	.word 0xb809a205  ! 66: AND_I	and 	%r6, 0x0205, %r28
	.word 0xbe01eb76  ! 66: ADD_I	add 	%r7, 0x0b76, %r31
	.word 0xa808e39d  ! 66: AND_I	and 	%r3, 0x039d, %r20
	.word 0x9c1129a8  ! 66: OR_I	or 	%r4, 0x09a8, %r14
	.word 0xb810a129  ! 66: OR_I	or 	%r2, 0x0129, %r28
	.word 0xba00ef01  ! 66: ADD_I	add 	%r3, 0x0f01, %r29
	.word 0xb001e3a2  ! 66: ADD_I	add 	%r7, 0x03a2, %r24
	.word 0xb600c005  ! 66: ADD_R	add 	%r3, %r5, %r27
	.word 0xb6110005  ! 66: OR_R	or 	%r4, %r5, %r27
	.word 0xb610e801  ! 66: OR_I	or 	%r3, 0x0801, %r27
	.word 0xa2092112  ! 66: AND_I	and 	%r4, 0x0112, %r17
	.word 0x9a08c005  ! 66: AND_R	and 	%r3, %r5, %r13
	.word 0xb000a9b9  ! 66: ADD_I	add 	%r2, 0x09b9, %r24
	.word 0xa609e8c0  ! 66: AND_I	and 	%r7, 0x08c0, %r19
	.word 0xae00e2e6  ! 66: ADD_I	add 	%r3, 0x02e6, %r23
	.word 0xb610c005  ! 66: OR_R	or 	%r3, %r5, %r27
	.word 0x9c01c005  ! 66: ADD_R	add 	%r7, %r5, %r14
	.word 0xbe11eeb3  ! 66: OR_I	or 	%r7, 0x0eb3, %r31
	.word 0xb211ed7a  ! 66: OR_I	or 	%r7, 0x0d7a, %r25
	.word 0xb000c005  ! 66: ADD_R	add 	%r3, %r5, %r24
	.word 0xb409ae5e  ! 66: AND_I	and 	%r6, 0x0e5e, %r26
	.word 0xbc008005  ! 66: ADD_R	add 	%r2, %r5, %r30
	.word 0xba012312  ! 66: ADD_I	add 	%r4, 0x0312, %r29
	.word 0xbe10aef4  ! 66: OR_I	or 	%r2, 0x0ef4, %r31
	.word 0x9e09aebe  ! 66: AND_I	and 	%r6, 0x0ebe, %r15
	.word 0xba00e30a  ! 66: ADD_I	add 	%r3, 0x030a, %r29
	.word 0xa010efe6  ! 66: OR_I	or 	%r3, 0x0fe6, %r16
	.word 0xb610a82c  ! 66: OR_I	or 	%r2, 0x082c, %r27
	.word 0xba10abd4  ! 66: OR_I	or 	%r2, 0x0bd4, %r29
	.word 0xac098005  ! 66: AND_R	and 	%r6, %r5, %r22
	.word 0xae11c005  ! 66: OR_R	or 	%r7, %r5, %r23
	.word 0x9a108005  ! 66: OR_R	or 	%r2, %r5, %r13
	.word 0xbc10a2a5  ! 66: OR_I	or 	%r2, 0x02a5, %r30
	.word 0xb00921a2  ! 66: AND_I	and 	%r4, 0x01a2, %r24
	.word 0x9a088005  ! 66: AND_R	and 	%r2, %r5, %r13
	.word 0x9a108005  ! 66: OR_R	or 	%r2, %r5, %r13
	.word 0xa208a796  ! 66: AND_I	and 	%r2, 0x0796, %r17
	.word 0xa8008005  ! 66: ADD_R	add 	%r2, %r5, %r20
	.word 0xa008ad67  ! 66: AND_I	and 	%r2, 0x0d67, %r16
	.word 0x9c10aaa9  ! 66: OR_I	or 	%r2, 0x0aa9, %r14
	.word 0xb609e435  ! 66: AND_I	and 	%r7, 0x0435, %r27
	.word 0x9a10edc0  ! 66: OR_I	or 	%r3, 0x0dc0, %r13
	.word 0x9a108005  ! 66: OR_R	or 	%r2, %r5, %r13
	.word 0xaa118005  ! 66: OR_R	or 	%r6, %r5, %r21
	.word 0xac01ae10  ! 66: ADD_I	add 	%r6, 0x0e10, %r22
	.word 0x9c10e26c  ! 66: OR_I	or 	%r3, 0x026c, %r14
	.word 0xb0108005  ! 66: OR_R	or 	%r2, %r5, %r24
	.word 0x9c10a8b9  ! 66: OR_I	or 	%r2, 0x08b9, %r14
	.word 0xa2088005  ! 66: AND_R	and 	%r2, %r5, %r17
	.word 0xa810c005  ! 66: OR_R	or 	%r3, %r5, %r20
	.word 0xa6090005  ! 66: AND_R	and 	%r4, %r5, %r19
	.word 0xa410a5a5  ! 66: OR_I	or 	%r2, 0x05a5, %r18
	.word 0xb600e130  ! 66: ADD_I	add 	%r3, 0x0130, %r27
	.word 0xb601ab3e  ! 66: ADD_I	add 	%r6, 0x0b3e, %r27
	.word 0xb201affc  ! 66: ADD_I	add 	%r6, 0x0ffc, %r25
	.word 0xae008005  ! 66: ADD_R	add 	%r2, %r5, %r23
	.word 0xae008005  ! 66: ADD_R	add 	%r2, %r5, %r23
	.word 0xa4108005  ! 66: OR_R	or 	%r2, %r5, %r18
	.word 0xae00c005  ! 66: ADD_R	add 	%r3, %r5, %r23
	.word 0xba110005  ! 66: OR_R	or 	%r4, %r5, %r29
	.word 0xaa008005  ! 66: ADD_R	add 	%r2, %r5, %r21
	.word 0x9a08e774  ! 66: AND_I	and 	%r3, 0x0774, %r13
	.word 0x9a108005  ! 66: OR_R	or 	%r2, %r5, %r13
	.word 0xa4088005  ! 66: AND_R	and 	%r2, %r5, %r18
	.word 0x9c018005  ! 66: ADD_R	add 	%r6, %r5, %r14
	.word 0xae10afdb  ! 66: OR_I	or 	%r2, 0x0fdb, %r23
	.word 0xae108005  ! 66: OR_R	or 	%r2, %r5, %r23
	.word 0xa6098005  ! 66: AND_R	and 	%r6, %r5, %r19
	.word 0xbc08af95  ! 66: AND_I	and 	%r2, 0x0f95, %r30
	.word 0xb411c005  ! 66: OR_R	or 	%r7, %r5, %r26
	.word 0xae008005  ! 66: ADD_R	add 	%r2, %r5, %r23
	.word 0xbe00a292  ! 66: ADD_I	add 	%r2, 0x0292, %r31
	.word 0xa0008005  ! 66: ADD_R	add 	%r2, %r5, %r16
	.word 0xba00a268  ! 66: ADD_I	add 	%r2, 0x0268, %r29
	.word 0xac10aa4c  ! 66: OR_I	or 	%r2, 0x0a4c, %r22
	.word 0x9a092107  ! 66: AND_I	and 	%r4, 0x0107, %r13
	.word 0x9e088005  ! 66: AND_R	and 	%r2, %r5, %r15
	.word 0xb6108005  ! 66: OR_R	or 	%r2, %r5, %r27
	.word 0xa411ae07  ! 66: OR_I	or 	%r6, 0x0e07, %r18
	.word 0xb2018005  ! 66: ADD_R	add 	%r6, %r5, %r25
	.word 0x9c010005  ! 66: ADD_R	add 	%r4, %r5, %r14
	.word 0xa6098005  ! 66: AND_R	and 	%r6, %r5, %r19
	.word 0xb810a13f  ! 66: OR_I	or 	%r2, 0x013f, %r28
	.word 0xb400c005  ! 66: ADD_R	add 	%r3, %r5, %r26
	.word 0xa4090005  ! 66: AND_R	and 	%r4, %r5, %r18
	.word 0xa008c005  ! 66: AND_R	and 	%r3, %r5, %r16
	.word 0xae090005  ! 66: AND_R	and 	%r4, %r5, %r23
	.word 0x9c09218d  ! 66: AND_I	and 	%r4, 0x018d, %r14
	.word 0xba012fb0  ! 66: ADD_I	add 	%r4, 0x0fb0, %r29
	.word 0xa411a89d  ! 66: OR_I	or 	%r6, 0x089d, %r18
	.word 0xa0008005  ! 66: ADD_R	add 	%r2, %r5, %r16
	.word 0xb6092e3a  ! 66: AND_I	and 	%r4, 0x0e3a, %r27
	.word 0xb0008005  ! 66: ADD_R	add 	%r2, %r5, %r24
	.word 0xa2112079  ! 66: OR_I	or 	%r4, 0x0079, %r17
	.word 0xba01ade8  ! 66: ADD_I	add 	%r6, 0x0de8, %r29
	.word 0xb610a5dd  ! 66: OR_I	or 	%r2, 0x05dd, %r27
	.word 0xa210ec31  ! 66: OR_I	or 	%r3, 0x0c31, %r17
	.word 0xb009afa2  ! 66: AND_I	and 	%r6, 0x0fa2, %r24
	.word 0xb201c005  ! 66: ADD_R	add 	%r7, %r5, %r25
	.word 0xb009c005  ! 66: AND_R	and 	%r7, %r5, %r24
	.word 0xaa00c005  ! 66: ADD_R	add 	%r3, %r5, %r21
	.word 0xa601e3e0  ! 66: ADD_I	add 	%r7, 0x03e0, %r19
	.word 0x9c11a252  ! 66: OR_I	or 	%r6, 0x0252, %r14
	.word 0xa200abb1  ! 66: ADD_I	add 	%r2, 0x0bb1, %r17
	.word 0xa4108005  ! 66: OR_R	or 	%r2, %r5, %r18
	.word 0xb000e38f  ! 66: ADD_I	add 	%r3, 0x038f, %r24
	.word 0xa4110005  ! 66: OR_R	or 	%r4, %r5, %r18
	.word 0xa4118005  ! 66: OR_R	or 	%r6, %r5, %r18
	.word 0xa2110005  ! 66: OR_R	or 	%r4, %r5, %r17
	.word 0xb410a1f7  ! 66: OR_I	or 	%r2, 0x01f7, %r26
	.word 0xa200a8b8  ! 66: ADD_I	add 	%r2, 0x08b8, %r17
	.word 0xae09a668  ! 66: AND_I	and 	%r6, 0x0668, %r23
	.word 0xac09e285  ! 66: AND_I	and 	%r7, 0x0285, %r22
	.word 0x9c11e794  ! 66: OR_I	or 	%r7, 0x0794, %r14
	.word 0xae10a3b0  ! 66: OR_I	or 	%r2, 0x03b0, %r23
	.word 0x9c01216f  ! 66: ADD_I	add 	%r4, 0x016f, %r14
	.word 0xb400c005  ! 66: ADD_R	add 	%r3, %r5, %r26
	.word 0xae00e3f5  ! 66: ADD_I	add 	%r3, 0x03f5, %r23
	.word 0xaa108005  ! 66: OR_R	or 	%r2, %r5, %r21
	.word 0xb209ae52  ! 66: AND_I	and 	%r6, 0x0e52, %r25
	.word 0xb2088005  ! 66: AND_R	and 	%r2, %r5, %r25
	.word 0xac10ea96  ! 66: OR_I	or 	%r3, 0x0a96, %r22
	.word 0xa800a1f8  ! 66: ADD_I	add 	%r2, 0x01f8, %r20
	.word 0xb0108005  ! 66: OR_R	or 	%r2, %r5, %r24
	.word 0xb8108005  ! 66: OR_R	or 	%r2, %r5, %r28
	.word 0xb41123a4  ! 66: OR_I	or 	%r4, 0x03a4, %r26
	.word 0xb210ac29  ! 66: OR_I	or 	%r2, 0x0c29, %r25
	.word 0xba010005  ! 66: ADD_R	add 	%r4, %r5, %r29
	.word 0x9a08ee3a  ! 66: AND_I	and 	%r3, 0x0e3a, %r13
	.word 0xb600add8  ! 66: ADD_I	add 	%r2, 0x0dd8, %r27
	.word 0xbe08ebbd  ! 66: AND_I	and 	%r3, 0x0bbd, %r31
	.word 0xbe08c005  ! 66: AND_R	and 	%r3, %r5, %r31
	.word 0xb209e0f1  ! 66: AND_I	and 	%r7, 0x00f1, %r25
	.word 0xa4108005  ! 66: OR_R	or 	%r2, %r5, %r18
	.word 0xbc10a7b9  ! 66: OR_I	or 	%r2, 0x07b9, %r30
	.word 0xe421227c  ! 66: STW_I	stw	%r18, [%r4 + 0x027c]
	.word 0xf670ec50  ! 66: STX_I	stx	%r27, [%r3 + 0x0c50]
	.word 0xf029a081  ! 66: STB_I	stb	%r24, [%r6 + 0x0081]
	.word 0xe820a6ec  ! 66: STW_I	stw	%r20, [%r2 + 0x06ec]
IRF_CE_33:
!$EV error(1,expr(@VA(.MAIN.IRF_CE_33), 16, 16), 1,IRF,ce,9,x, x,x,x, x,x,x)
!$EV error(1,expr(@VA(.MAIN.IRF_CE_33), 16, 16), 3,IRF,ce,40,x, x,x,x, x,x,x)
	.word 0xfa28aaf5  ! 66: STB_I	stb	%r29, [%r2 + 0x0af5]
	.word 0xf621aa88  ! 66: STW_I	stw	%r27, [%r6 + 0x0a88]
	.word 0xf621a554  ! 66: STW_I	stw	%r27, [%r6 + 0x0554]
	.word 0xe7388005  ! 66: STDF_R	std	%f19, [%r5, %r2]
	.word 0xbe00c005  ! 66: ADD_R	add 	%r3, %r5, %r31
	.word 0xb201ea69  ! 66: ADD_I	add 	%r7, 0x0a69, %r25
	bne thr1_loop_8
	subcc %g1, 0x1, %g1
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr1_loop_9:
	.word 0xaa112339  ! 73: OR_I	or 	%r4, 0x0339, %r21
	.word 0xbe010005  ! 73: ADD_R	add 	%r4, %r5, %r31
	.word 0xa601c005  ! 73: ADD_R	add 	%r7, %r5, %r19
	.word 0x9a09a2f4  ! 73: AND_I	and 	%r6, 0x02f4, %r13
	.word 0x9c10a014  ! 73: OR_I	or 	%r2, 0x0014, %r14
	.word 0xa609eb84  ! 73: AND_I	and 	%r7, 0x0b84, %r19
	.word 0x9e00c005  ! 73: ADD_R	add 	%r3, %r5, %r15
	.word 0xb8108005  ! 73: OR_R	or 	%r2, %r5, %r28
	.word 0x9e08a8c2  ! 73: AND_I	and 	%r2, 0x08c2, %r15
	.word 0xae00a07d  ! 73: ADD_I	add 	%r2, 0x007d, %r23
	.word 0xa4090005  ! 73: AND_R	and 	%r4, %r5, %r18
	.word 0xbe08ed7a  ! 73: AND_I	and 	%r3, 0x0d7a, %r31
	.word 0xbe098005  ! 73: AND_R	and 	%r6, %r5, %r31
	.word 0xae108005  ! 73: OR_R	or 	%r2, %r5, %r23
	.word 0x9a08e643  ! 73: AND_I	and 	%r3, 0x0643, %r13
	.word 0xa0098005  ! 73: AND_R	and 	%r6, %r5, %r16
	.word 0xa0118005  ! 73: OR_R	or 	%r6, %r5, %r16
	.word 0xa608af42  ! 73: AND_I	and 	%r2, 0x0f42, %r19
	.word 0xa410c005  ! 73: OR_R	or 	%r3, %r5, %r18
	.word 0xae08af3a  ! 73: AND_I	and 	%r2, 0x0f3a, %r23
	.word 0xb8008005  ! 73: ADD_R	add 	%r2, %r5, %r28
	.word 0xa6008005  ! 73: ADD_R	add 	%r2, %r5, %r19
	.word 0xac09ef8b  ! 73: AND_I	and 	%r7, 0x0f8b, %r22
	.word 0xbe008005  ! 73: ADD_R	add 	%r2, %r5, %r31
	.word 0x9e11eb9d  ! 73: OR_I	or 	%r7, 0x0b9d, %r15
	.word 0x9c110005  ! 73: OR_R	or 	%r4, %r5, %r14
	.word 0xbc092808  ! 73: AND_I	and 	%r4, 0x0808, %r30
	.word 0xa401e3a3  ! 73: ADD_I	add 	%r7, 0x03a3, %r18
	.word 0x9e09c005  ! 73: AND_R	and 	%r7, %r5, %r15
	.word 0xa009a8ae  ! 73: AND_I	and 	%r6, 0x08ae, %r16
	.word 0xa0118005  ! 73: OR_R	or 	%r6, %r5, %r16
	.word 0x9c108005  ! 73: OR_R	or 	%r2, %r5, %r14
	.word 0xac012d3f  ! 73: ADD_I	add 	%r4, 0x0d3f, %r22
	.word 0xba08ef84  ! 73: AND_I	and 	%r3, 0x0f84, %r29
	.word 0xa2108005  ! 73: OR_R	or 	%r2, %r5, %r17
	.word 0xa609c005  ! 73: AND_R	and 	%r7, %r5, %r19
	.word 0xaa092a56  ! 73: AND_I	and 	%r4, 0x0a56, %r21
	.word 0xb810c005  ! 73: OR_R	or 	%r3, %r5, %r28
	.word 0xaa098005  ! 73: AND_R	and 	%r6, %r5, %r21
	.word 0xb0090005  ! 73: AND_R	and 	%r4, %r5, %r24
	.word 0xb810adef  ! 73: OR_I	or 	%r2, 0x0def, %r28
	.word 0xb001eb52  ! 73: ADD_I	add 	%r7, 0x0b52, %r24
	.word 0xba10ad77  ! 73: OR_I	or 	%r2, 0x0d77, %r29
	.word 0xb601c005  ! 73: ADD_R	add 	%r7, %r5, %r27
	.word 0xb8088005  ! 73: AND_R	and 	%r2, %r5, %r28
	.word 0xa6110005  ! 73: OR_R	or 	%r4, %r5, %r19
	.word 0xb6090005  ! 73: AND_R	and 	%r4, %r5, %r27
	.word 0xb001c005  ! 73: ADD_R	add 	%r7, %r5, %r24
	.word 0xbe00a19a  ! 73: ADD_I	add 	%r2, 0x019a, %r31
	.word 0xa0008005  ! 73: ADD_R	add 	%r2, %r5, %r16
	.word 0x9e01ad3b  ! 73: ADD_I	add 	%r6, 0x0d3b, %r15
	.word 0xa808ab00  ! 73: AND_I	and 	%r2, 0x0b00, %r20
	.word 0xb8008005  ! 73: ADD_R	add 	%r2, %r5, %r28
	.word 0xbc010005  ! 73: ADD_R	add 	%r4, %r5, %r30
	.word 0x9a108005  ! 73: OR_R	or 	%r2, %r5, %r13
	.word 0xa41121c8  ! 73: OR_I	or 	%r4, 0x01c8, %r18
	.word 0xae088005  ! 73: AND_R	and 	%r2, %r5, %r23
	.word 0xa801c005  ! 73: ADD_R	add 	%r7, %r5, %r20
	.word 0xac09c005  ! 73: AND_R	and 	%r7, %r5, %r22
	.word 0xa6118005  ! 73: OR_R	or 	%r6, %r5, %r19
	.word 0xa2118005  ! 73: OR_R	or 	%r6, %r5, %r17
	.word 0xb600aa0c  ! 73: ADD_I	add 	%r2, 0x0a0c, %r27
	.word 0xb8008005  ! 73: ADD_R	add 	%r2, %r5, %r28
	.word 0x9a00e8b6  ! 73: ADD_I	add 	%r3, 0x08b6, %r13
	.word 0xa6088005  ! 73: AND_R	and 	%r2, %r5, %r19
	.word 0xbe108005  ! 73: OR_R	or 	%r2, %r5, %r31
	.word 0xaa08eb3e  ! 73: AND_I	and 	%r3, 0x0b3e, %r21
	.word 0xae110005  ! 73: OR_R	or 	%r4, %r5, %r23
	.word 0xb810c005  ! 73: OR_R	or 	%r3, %r5, %r28
	.word 0xaa088005  ! 73: AND_R	and 	%r2, %r5, %r21
	.word 0xbe01c005  ! 73: ADD_R	add 	%r7, %r5, %r31
	.word 0xb2018005  ! 73: ADD_R	add 	%r6, %r5, %r25
	.word 0xae01ed40  ! 73: ADD_I	add 	%r7, 0x0d40, %r23
	.word 0xb200c005  ! 73: ADD_R	add 	%r3, %r5, %r25
	.word 0xb60126fd  ! 73: ADD_I	add 	%r4, 0x06fd, %r27
	.word 0xba10edff  ! 73: OR_I	or 	%r3, 0x0dff, %r29
	.word 0xae09252b  ! 73: AND_I	and 	%r4, 0x052b, %r23
	.word 0xac088005  ! 73: AND_R	and 	%r2, %r5, %r22
	.word 0x9a01e4f1  ! 73: ADD_I	add 	%r7, 0x04f1, %r13
	.word 0xbc01a0bd  ! 73: ADD_I	add 	%r6, 0x00bd, %r30
	.word 0xa400aea3  ! 73: ADD_I	add 	%r2, 0x0ea3, %r18
	.word 0xa208a4e7  ! 73: AND_I	and 	%r2, 0x04e7, %r17
	.word 0xa6012b71  ! 73: ADD_I	add 	%r4, 0x0b71, %r19
	.word 0xa408a35f  ! 73: AND_I	and 	%r2, 0x035f, %r18
	.word 0x9a110005  ! 73: OR_R	or 	%r4, %r5, %r13
	.word 0xa6010005  ! 73: ADD_R	add 	%r4, %r5, %r19
	.word 0xa201c005  ! 73: ADD_R	add 	%r7, %r5, %r17
	.word 0xa610af4a  ! 73: OR_I	or 	%r2, 0x0f4a, %r19
	.word 0xa611a281  ! 73: OR_I	or 	%r6, 0x0281, %r19
	.word 0xa6008005  ! 73: ADD_R	add 	%r2, %r5, %r19
	.word 0xb4018005  ! 73: ADD_R	add 	%r6, %r5, %r26
	.word 0x9e088005  ! 73: AND_R	and 	%r2, %r5, %r15
	.word 0xa809e7b4  ! 73: AND_I	and 	%r7, 0x07b4, %r20
	.word 0xb4110005  ! 73: OR_R	or 	%r4, %r5, %r26
	.word 0xac118005  ! 73: OR_R	or 	%r6, %r5, %r22
	.word 0xa810e69f  ! 73: OR_I	or 	%r3, 0x069f, %r20
	.word 0xb401aa20  ! 73: ADD_I	add 	%r6, 0x0a20, %r26
	.word 0x9e00a8f1  ! 73: ADD_I	add 	%r2, 0x08f1, %r15
	.word 0xa209ace1  ! 73: AND_I	and 	%r6, 0x0ce1, %r17
	.word 0xa20122ce  ! 73: ADD_I	add 	%r4, 0x02ce, %r17
	.word 0xb211aea7  ! 73: OR_I	or 	%r6, 0x0ea7, %r25
	.word 0xa410a2b7  ! 73: OR_I	or 	%r2, 0x02b7, %r18
	.word 0xb001c005  ! 73: ADD_R	add 	%r7, %r5, %r24
	.word 0xa001c005  ! 73: ADD_R	add 	%r7, %r5, %r16
	.word 0x9a01205a  ! 73: ADD_I	add 	%r4, 0x005a, %r13
	.word 0xaa010005  ! 73: ADD_R	add 	%r4, %r5, %r21
	.word 0xbc10c005  ! 73: OR_R	or 	%r3, %r5, %r30
	.word 0xb601ac01  ! 73: ADD_I	add 	%r6, 0x0c01, %r27
	.word 0x9a11aae8  ! 73: OR_I	or 	%r6, 0x0ae8, %r13
	.word 0xa6088005  ! 73: AND_R	and 	%r2, %r5, %r19
	.word 0xbe09a452  ! 73: AND_I	and 	%r6, 0x0452, %r31
	.word 0xba008005  ! 73: ADD_R	add 	%r2, %r5, %r29
	.word 0x9e10a700  ! 73: OR_I	or 	%r2, 0x0700, %r15
	.word 0xa208eae4  ! 73: AND_I	and 	%r3, 0x0ae4, %r17
	.word 0xac110005  ! 73: OR_R	or 	%r4, %r5, %r22
	.word 0xb600c005  ! 73: ADD_R	add 	%r3, %r5, %r27
	.word 0x9e012b8f  ! 73: ADD_I	add 	%r4, 0x0b8f, %r15
	.word 0xac012bf6  ! 73: ADD_I	add 	%r4, 0x0bf6, %r22
	.word 0xa010ed57  ! 73: OR_I	or 	%r3, 0x0d57, %r16
	.word 0xa4090005  ! 73: AND_R	and 	%r4, %r5, %r18
	.word 0xaa0124c8  ! 73: ADD_I	add 	%r4, 0x04c8, %r21
	.word 0xa4110005  ! 73: OR_R	or 	%r4, %r5, %r18
	.word 0xaa00eb91  ! 73: ADD_I	add 	%r3, 0x0b91, %r21
	.word 0xbe00c005  ! 73: ADD_R	add 	%r3, %r5, %r31
	.word 0xb4118005  ! 73: OR_R	or 	%r6, %r5, %r26
	.word 0x9a010005  ! 73: ADD_R	add 	%r4, %r5, %r13
	.word 0xa60920c0  ! 73: AND_I	and 	%r4, 0x00c0, %r19
	.word 0xac00e294  ! 73: ADD_I	add 	%r3, 0x0294, %r22
	.word 0xa0008005  ! 73: ADD_R	add 	%r2, %r5, %r16
	.word 0xb2010005  ! 73: ADD_R	add 	%r4, %r5, %r25
	.word 0xb408ace1  ! 73: AND_I	and 	%r2, 0x0ce1, %r26
	.word 0xae08a678  ! 73: AND_I	and 	%r2, 0x0678, %r23
	.word 0xa2008005  ! 73: ADD_R	add 	%r2, %r5, %r17
	.word 0xb0008005  ! 73: ADD_R	add 	%r2, %r5, %r24
	.word 0xa4088005  ! 73: AND_R	and 	%r2, %r5, %r18
	.word 0xa001e1e6  ! 73: ADD_I	add 	%r7, 0x01e6, %r16
	.word 0xfe21a4a4  ! 73: STW_I	stw	%r31, [%r6 + 0x04a4]
	.word 0xde30ac06  ! 73: STH_I	sth	%r15, [%r2 + 0x0c06]
	.word 0xf420ea94  ! 73: STW_I	stw	%r26, [%r3 + 0x0a94]
	.word 0xee712e68  ! 73: STX_I	stx	%r23, [%r4 + 0x0e68]
IRF_CE_37:
!$EV error(1,expr(@VA(.MAIN.IRF_CE_37), 16, 16), 1,IRF,ce,25,x, x,x,x, x,x,x)
!$EV error(1,expr(@VA(.MAIN.IRF_CE_37), 16, 16), 3,IRF,ce,46,x, x,x,x, x,x,x)
	.word 0xf229ad06  ! 73: STB_I	stb	%r25, [%r6 + 0x0d06]
	.word 0xdc21ab50  ! 73: STW_I	stw	%r14, [%r6 + 0x0b50]
	.word 0xe071a660  ! 73: STX_I	stx	%r16, [%r6 + 0x0660]
	.word 0xf3208005  ! 73: STF_R	st	%f25, [%r5, %r2]
	.word 0xb4108005  ! 73: OR_R	or 	%r2, %r5, %r26
	.word 0xa608c005  ! 73: AND_R	and 	%r3, %r5, %r19
	bne thr1_loop_9
	subcc %g1, 0x1, %g1
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr1_loop_10:
	.word 0xb8090005  ! 80: AND_R	and 	%r4, %r5, %r28
	.word 0xae10a319  ! 80: OR_I	or 	%r2, 0x0319, %r23
	.word 0xb200ab4d  ! 80: ADD_I	add 	%r2, 0x0b4d, %r25
	.word 0xae10a38e  ! 80: OR_I	or 	%r2, 0x038e, %r23
	.word 0xb2098005  ! 80: AND_R	and 	%r6, %r5, %r25
	.word 0xb808e57d  ! 80: AND_I	and 	%r3, 0x057d, %r28
	.word 0xa6092546  ! 80: AND_I	and 	%r4, 0x0546, %r19
	.word 0xac00ab60  ! 80: ADD_I	add 	%r2, 0x0b60, %r22
	.word 0xb201e835  ! 80: ADD_I	add 	%r7, 0x0835, %r25
	.word 0x9c11e337  ! 80: OR_I	or 	%r7, 0x0337, %r14
	.word 0xa808e4c5  ! 80: AND_I	and 	%r3, 0x04c5, %r20
	.word 0x9c08e7ad  ! 80: AND_I	and 	%r3, 0x07ad, %r14
	.word 0xb6008005  ! 80: ADD_R	add 	%r2, %r5, %r27
	.word 0xb008e959  ! 80: AND_I	and 	%r3, 0x0959, %r24
	.word 0xa401235f  ! 80: ADD_I	add 	%r4, 0x035f, %r18
	.word 0xb211e024  ! 80: OR_I	or 	%r7, 0x0024, %r25
	.word 0xa210e302  ! 80: OR_I	or 	%r3, 0x0302, %r17
	.word 0xa011e3b7  ! 80: OR_I	or 	%r7, 0x03b7, %r16
	.word 0x9a108005  ! 80: OR_R	or 	%r2, %r5, %r13
	.word 0x9a08a60a  ! 80: AND_I	and 	%r2, 0x060a, %r13
	.word 0xb410c005  ! 80: OR_R	or 	%r3, %r5, %r26
	.word 0xa0008005  ! 80: ADD_R	add 	%r2, %r5, %r16
	.word 0x9a108005  ! 80: OR_R	or 	%r2, %r5, %r13
	.word 0xb6118005  ! 80: OR_R	or 	%r6, %r5, %r27
	.word 0xba11e6c7  ! 80: OR_I	or 	%r7, 0x06c7, %r29
	.word 0xa809a2d4  ! 80: AND_I	and 	%r6, 0x02d4, %r20
	.word 0xa8098005  ! 80: AND_R	and 	%r6, %r5, %r20
	.word 0xb2008005  ! 80: ADD_R	add 	%r2, %r5, %r25
	.word 0xbe01af2b  ! 80: ADD_I	add 	%r6, 0x0f2b, %r31
	.word 0xba10c005  ! 80: OR_R	or 	%r3, %r5, %r29
	.word 0xa0012a1c  ! 80: ADD_I	add 	%r4, 0x0a1c, %r16
	.word 0xac08ee55  ! 80: AND_I	and 	%r3, 0x0e55, %r22
	.word 0xaa08c005  ! 80: AND_R	and 	%r3, %r5, %r21
	.word 0xb8012da6  ! 80: ADD_I	add 	%r4, 0x0da6, %r28
	.word 0xa810ac1c  ! 80: OR_I	or 	%r2, 0x0c1c, %r20
	.word 0xbe090005  ! 80: AND_R	and 	%r4, %r5, %r31
	.word 0xb410e7f8  ! 80: OR_I	or 	%r3, 0x07f8, %r26
	.word 0xba08ace7  ! 80: AND_I	and 	%r2, 0x0ce7, %r29
	.word 0x9c10e0c5  ! 80: OR_I	or 	%r3, 0x00c5, %r14
	.word 0xba018005  ! 80: ADD_R	add 	%r6, %r5, %r29
	.word 0xbe10ef3a  ! 80: OR_I	or 	%r3, 0x0f3a, %r31
	.word 0xae0928ee  ! 80: AND_I	and 	%r4, 0x08ee, %r23
	.word 0xb2108005  ! 80: OR_R	or 	%r2, %r5, %r25
	.word 0xa801230d  ! 80: ADD_I	add 	%r4, 0x030d, %r20
	.word 0xa8088005  ! 80: AND_R	and 	%r2, %r5, %r20
	.word 0xb0110005  ! 80: OR_R	or 	%r4, %r5, %r24
	.word 0xb810c005  ! 80: OR_R	or 	%r3, %r5, %r28
	.word 0xb810c005  ! 80: OR_R	or 	%r3, %r5, %r28
	.word 0x9c09c005  ! 80: AND_R	and 	%r7, %r5, %r14
	.word 0xb000e08a  ! 80: ADD_I	add 	%r3, 0x008a, %r24
	.word 0x9a108005  ! 80: OR_R	or 	%r2, %r5, %r13
	.word 0xa209efe4  ! 80: AND_I	and 	%r7, 0x0fe4, %r17
	.word 0xac118005  ! 80: OR_R	or 	%r6, %r5, %r22
	.word 0xb601a287  ! 80: ADD_I	add 	%r6, 0x0287, %r27
	.word 0xa810af4c  ! 80: OR_I	or 	%r2, 0x0f4c, %r20
	.word 0x9e108005  ! 80: OR_R	or 	%r2, %r5, %r15
	.word 0xac088005  ! 80: AND_R	and 	%r2, %r5, %r22
	.word 0xa401e808  ! 80: ADD_I	add 	%r7, 0x0808, %r18
	.word 0x9c092f2e  ! 80: AND_I	and 	%r4, 0x0f2e, %r14
	.word 0xa401abd5  ! 80: ADD_I	add 	%r6, 0x0bd5, %r18
	.word 0xa800e0bf  ! 80: ADD_I	add 	%r3, 0x00bf, %r20
	.word 0xac01e3d0  ! 80: ADD_I	add 	%r7, 0x03d0, %r22
	.word 0xac00a07e  ! 80: ADD_I	add 	%r2, 0x007e, %r22
	.word 0xb0110005  ! 80: OR_R	or 	%r4, %r5, %r24
	.word 0xb2110005  ! 80: OR_R	or 	%r4, %r5, %r25
	.word 0x9a110005  ! 80: OR_R	or 	%r4, %r5, %r13
	.word 0xaa090005  ! 80: AND_R	and 	%r4, %r5, %r21
	.word 0xba108005  ! 80: OR_R	or 	%r2, %r5, %r29
	.word 0x9e012e41  ! 80: ADD_I	add 	%r4, 0x0e41, %r15
	.word 0xae08c005  ! 80: AND_R	and 	%r3, %r5, %r23
	.word 0xa209e11c  ! 80: AND_I	and 	%r7, 0x011c, %r17
	.word 0xba11acc7  ! 80: OR_I	or 	%r6, 0x0cc7, %r29
	.word 0xb4108005  ! 80: OR_R	or 	%r2, %r5, %r26
	.word 0xbc00a3a7  ! 80: ADD_I	add 	%r2, 0x03a7, %r30
	.word 0xaa108005  ! 80: OR_R	or 	%r2, %r5, %r21
	.word 0xb2108005  ! 80: OR_R	or 	%r2, %r5, %r25
	.word 0xa6008005  ! 80: ADD_R	add 	%r2, %r5, %r19
	.word 0xba00afcb  ! 80: ADD_I	add 	%r2, 0x0fcb, %r29
	.word 0xb4108005  ! 80: OR_R	or 	%r2, %r5, %r26
	.word 0xbc09aa4f  ! 80: AND_I	and 	%r6, 0x0a4f, %r30
	.word 0xa009ee19  ! 80: AND_I	and 	%r7, 0x0e19, %r16
	.word 0xba11e694  ! 80: OR_I	or 	%r7, 0x0694, %r29
	.word 0xb8088005  ! 80: AND_R	and 	%r2, %r5, %r28
	.word 0xbc01ad12  ! 80: ADD_I	add 	%r6, 0x0d12, %r30
	.word 0xa210a26d  ! 80: OR_I	or 	%r2, 0x026d, %r17
	.word 0xb2018005  ! 80: ADD_R	add 	%r6, %r5, %r25
	.word 0xb011a6f3  ! 80: OR_I	or 	%r6, 0x06f3, %r24
	.word 0xa810a000  ! 80: OR_I	or 	%r2, 0x0000, %r20
	.word 0xb210ad71  ! 80: OR_I	or 	%r2, 0x0d71, %r25
	.word 0xba09c005  ! 80: AND_R	and 	%r7, %r5, %r29
	.word 0xa600a719  ! 80: ADD_I	add 	%r2, 0x0719, %r19
	.word 0xa8008005  ! 80: ADD_R	add 	%r2, %r5, %r20
	.word 0x9c08c005  ! 80: AND_R	and 	%r3, %r5, %r14
	.word 0xae08e696  ! 80: AND_I	and 	%r3, 0x0696, %r23
	.word 0xb009a686  ! 80: AND_I	and 	%r6, 0x0686, %r24
	.word 0xae11c005  ! 80: OR_R	or 	%r7, %r5, %r23
	.word 0xba08a534  ! 80: AND_I	and 	%r2, 0x0534, %r29
	.word 0xb600ab2b  ! 80: ADD_I	add 	%r2, 0x0b2b, %r27
	.word 0x9c00ea27  ! 80: ADD_I	add 	%r3, 0x0a27, %r14
	.word 0xbc0120d1  ! 80: ADD_I	add 	%r4, 0x00d1, %r30
	.word 0xa4110005  ! 80: OR_R	or 	%r4, %r5, %r18
	.word 0xb008a88f  ! 80: AND_I	and 	%r2, 0x088f, %r24
	.word 0xb801c005  ! 80: ADD_R	add 	%r7, %r5, %r28
	.word 0xaa09a479  ! 80: AND_I	and 	%r6, 0x0479, %r21
	.word 0xa0008005  ! 80: ADD_R	add 	%r2, %r5, %r16
	.word 0xa010c005  ! 80: OR_R	or 	%r3, %r5, %r16
	.word 0x9c110005  ! 80: OR_R	or 	%r4, %r5, %r14
	.word 0x9e00c005  ! 80: ADD_R	add 	%r3, %r5, %r15
	.word 0xb400c005  ! 80: ADD_R	add 	%r3, %r5, %r26
	.word 0x9c09a931  ! 80: AND_I	and 	%r6, 0x0931, %r14
	.word 0x9c10c005  ! 80: OR_R	or 	%r3, %r5, %r14
	.word 0xa4088005  ! 80: AND_R	and 	%r2, %r5, %r18
	.word 0xa0110005  ! 80: OR_R	or 	%r4, %r5, %r16
	.word 0x9c008005  ! 80: ADD_R	add 	%r2, %r5, %r14
	.word 0xa800c005  ! 80: ADD_R	add 	%r3, %r5, %r20
	.word 0xbc108005  ! 80: OR_R	or 	%r2, %r5, %r30
	.word 0x9a108005  ! 80: OR_R	or 	%r2, %r5, %r13
	.word 0xa209c005  ! 80: AND_R	and 	%r7, %r5, %r17
	.word 0xbe08ecfc  ! 80: AND_I	and 	%r3, 0x0cfc, %r31
	.word 0xac112c79  ! 80: OR_I	or 	%r4, 0x0c79, %r22
	.word 0xaa010005  ! 80: ADD_R	add 	%r4, %r5, %r21
	.word 0xb410a996  ! 80: OR_I	or 	%r2, 0x0996, %r26
	.word 0xac108005  ! 80: OR_R	or 	%r2, %r5, %r22
	.word 0xa608ac63  ! 80: AND_I	and 	%r2, 0x0c63, %r19
	.word 0xa210ed2a  ! 80: OR_I	or 	%r3, 0x0d2a, %r17
	.word 0x9a10e3e1  ! 80: OR_I	or 	%r3, 0x03e1, %r13
	.word 0x9c01c005  ! 80: ADD_R	add 	%r7, %r5, %r14
	.word 0xb400a6b1  ! 80: ADD_I	add 	%r2, 0x06b1, %r26
	.word 0x9a08c005  ! 80: AND_R	and 	%r3, %r5, %r13
	.word 0xa808c005  ! 80: AND_R	and 	%r3, %r5, %r20
	.word 0xb008a583  ! 80: AND_I	and 	%r2, 0x0583, %r24
	.word 0xbe08a9ac  ! 80: AND_I	and 	%r2, 0x09ac, %r31
	.word 0x9e11c005  ! 80: OR_R	or 	%r7, %r5, %r15
	.word 0xa809e5ff  ! 80: AND_I	and 	%r7, 0x05ff, %r20
	.word 0xa0090005  ! 80: AND_R	and 	%r4, %r5, %r16
	.word 0xac01c005  ! 80: ADD_R	add 	%r7, %r5, %r22
	.word 0xa4090005  ! 80: AND_R	and 	%r4, %r5, %r18
	.word 0xb609ef0f  ! 80: AND_I	and 	%r7, 0x0f0f, %r27
	.word 0xae10ad9b  ! 80: OR_I	or 	%r2, 0x0d9b, %r23
	.word 0xb209c005  ! 80: AND_R	and 	%r7, %r5, %r25
	.word 0xae112bb3  ! 80: OR_I	or 	%r4, 0x0bb3, %r23
	.word 0x9c118005  ! 80: OR_R	or 	%r6, %r5, %r14
	.word 0xa6098005  ! 80: AND_R	and 	%r6, %r5, %r19
	.word 0xbc10e321  ! 80: OR_I	or 	%r3, 0x0321, %r30
	.word 0xba108005  ! 80: OR_R	or 	%r2, %r5, %r29
	.word 0xac008005  ! 80: ADD_R	add 	%r2, %r5, %r22
	.word 0xaa010005  ! 80: ADD_R	add 	%r4, %r5, %r21
	.word 0xb2118005  ! 80: OR_R	or 	%r6, %r5, %r25
	.word 0xac09c005  ! 80: AND_R	and 	%r7, %r5, %r22
	.word 0x9a08ec08  ! 80: AND_I	and 	%r3, 0x0c08, %r13
	.word 0xa409e0b7  ! 80: AND_I	and 	%r7, 0x00b7, %r18
	.word 0xa411272d  ! 80: OR_I	or 	%r4, 0x072d, %r18
	.word 0xde20a0a4  ! 80: STW_I	stw	%r15, [%r2 + 0x00a4]
	.word 0xe67125f0  ! 80: STX_I	stx	%r19, [%r4 + 0x05f0]
	.word 0xf429e0a1  ! 80: STB_I	stb	%r26, [%r7 + 0x00a1]
	.word 0xf230e8d4  ! 80: STH_I	sth	%r25, [%r3 + 0x08d4]
IRF_CE_41:
!$EV error(1,expr(@VA(.MAIN.IRF_CE_41), 16, 16), 1,IRF,ce,25,x, x,x,x, x,x,x)
!$EV error(1,expr(@VA(.MAIN.IRF_CE_41), 16, 16), 3,IRF,ce,66,x, x,x,x, x,x,x)
	.word 0xf620e2c8  ! 80: STW_I	stw	%r27, [%r3 + 0x02c8]
	.word 0xe870e518  ! 80: STX_I	stx	%r20, [%r3 + 0x0518]
	.word 0xe870a918  ! 80: STX_I	stx	%r20, [%r2 + 0x0918]
	.word 0xec788005  ! 80: SWAP_R	swap	%r22, [%r2 + %r5]
	.word 0xb400a37c  ! 80: ADD_I	add 	%r2, 0x037c, %r26
	.word 0xb001c005  ! 80: ADD_R	add 	%r7, %r5, %r24
	bne thr1_loop_10
	subcc %g1, 0x1, %g1
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr1_loop_11:
	.word 0xa609c005  ! 88: AND_R	and 	%r7, %r5, %r19
	.word 0xba00e794  ! 88: ADD_I	add 	%r3, 0x0794, %r29
	.word 0x9e088005  ! 88: AND_R	and 	%r2, %r5, %r15
	.word 0xa610adc1  ! 88: OR_I	or 	%r2, 0x0dc1, %r19
	.word 0xb008a8cd  ! 88: AND_I	and 	%r2, 0x08cd, %r24
	.word 0xb401c005  ! 88: ADD_R	add 	%r7, %r5, %r26
	.word 0xb811a5f8  ! 88: OR_I	or 	%r6, 0x05f8, %r28
	.word 0x9c098005  ! 88: AND_R	and 	%r6, %r5, %r14
	.word 0x9c01aa7f  ! 88: ADD_I	add 	%r6, 0x0a7f, %r14
	.word 0xba09a633  ! 88: AND_I	and 	%r6, 0x0633, %r29
	.word 0x9c088005  ! 88: AND_R	and 	%r2, %r5, %r14
	.word 0xbc010005  ! 88: ADD_R	add 	%r4, %r5, %r30
	.word 0xa400e3ee  ! 88: ADD_I	add 	%r3, 0x03ee, %r18
	.word 0x9c090005  ! 88: AND_R	and 	%r4, %r5, %r14
	.word 0xac01c005  ! 88: ADD_R	add 	%r7, %r5, %r22
	.word 0x9c11aff2  ! 88: OR_I	or 	%r6, 0x0ff2, %r14
	.word 0xac098005  ! 88: AND_R	and 	%r6, %r5, %r22
	.word 0xac09a362  ! 88: AND_I	and 	%r6, 0x0362, %r22
	.word 0xa410e37a  ! 88: OR_I	or 	%r3, 0x037a, %r18
	.word 0xa6008005  ! 88: ADD_R	add 	%r2, %r5, %r19
	.word 0xb0018005  ! 88: ADD_R	add 	%r6, %r5, %r24
	.word 0xa808e613  ! 88: AND_I	and 	%r3, 0x0613, %r20
	.word 0x9c00af9d  ! 88: ADD_I	add 	%r2, 0x0f9d, %r14
	.word 0xa201aaeb  ! 88: ADD_I	add 	%r6, 0x0aeb, %r17
	.word 0xb2008005  ! 88: ADD_R	add 	%r2, %r5, %r25
	.word 0xaa11c005  ! 88: OR_R	or 	%r7, %r5, %r21
	.word 0xb0098005  ! 88: AND_R	and 	%r6, %r5, %r24
	.word 0xbc0923ba  ! 88: AND_I	and 	%r4, 0x03ba, %r30
	.word 0xa2112672  ! 88: OR_I	or 	%r4, 0x0672, %r17
	.word 0xac10ecee  ! 88: OR_I	or 	%r3, 0x0cee, %r22
	.word 0xba11a733  ! 88: OR_I	or 	%r6, 0x0733, %r29
	.word 0x9e118005  ! 88: OR_R	or 	%r6, %r5, %r15
	.word 0xb6012d19  ! 88: ADD_I	add 	%r4, 0x0d19, %r27
	.word 0xb210a271  ! 88: OR_I	or 	%r2, 0x0271, %r25
	.word 0xa001e096  ! 88: ADD_I	add 	%r7, 0x0096, %r16
	.word 0xa410e6e5  ! 88: OR_I	or 	%r3, 0x06e5, %r18
	.word 0xb811c005  ! 88: OR_R	or 	%r7, %r5, %r28
	.word 0xa2090005  ! 88: AND_R	and 	%r4, %r5, %r17
	.word 0x9e00ad04  ! 88: ADD_I	add 	%r2, 0x0d04, %r15
	.word 0xa408abe5  ! 88: AND_I	and 	%r2, 0x0be5, %r18
	.word 0xbe008005  ! 88: ADD_R	add 	%r2, %r5, %r31
	.word 0xa0108005  ! 88: OR_R	or 	%r2, %r5, %r16
	.word 0xbc11a005  ! 88: OR_I	or 	%r6, 0x0005, %r30
	.word 0xb410eb3a  ! 88: OR_I	or 	%r3, 0x0b3a, %r26
	.word 0xba01ece3  ! 88: ADD_I	add 	%r7, 0x0ce3, %r29
	.word 0x9e11217e  ! 88: OR_I	or 	%r4, 0x017e, %r15
	.word 0xae09e2ce  ! 88: AND_I	and 	%r7, 0x02ce, %r23
	.word 0x9a110005  ! 88: OR_R	or 	%r4, %r5, %r13
	.word 0xb0088005  ! 88: AND_R	and 	%r2, %r5, %r24
	.word 0xba01a556  ! 88: ADD_I	add 	%r6, 0x0556, %r29
	.word 0xbe00eca7  ! 88: ADD_I	add 	%r3, 0x0ca7, %r31
	.word 0xac10aca7  ! 88: OR_I	or 	%r2, 0x0ca7, %r22
	.word 0xb4118005  ! 88: OR_R	or 	%r6, %r5, %r26
	.word 0xac10a9a4  ! 88: OR_I	or 	%r2, 0x09a4, %r22
	.word 0xb2108005  ! 88: OR_R	or 	%r2, %r5, %r25
	.word 0xb611e148  ! 88: OR_I	or 	%r7, 0x0148, %r27
	.word 0xae110005  ! 88: OR_R	or 	%r4, %r5, %r23
	.word 0xac09a569  ! 88: AND_I	and 	%r6, 0x0569, %r22
	.word 0xa4090005  ! 88: AND_R	and 	%r4, %r5, %r18
	.word 0xb808af36  ! 88: AND_I	and 	%r2, 0x0f36, %r28
	.word 0xa208c005  ! 88: AND_R	and 	%r3, %r5, %r17
	.word 0xae08c005  ! 88: AND_R	and 	%r3, %r5, %r23
	.word 0xac08c005  ! 88: AND_R	and 	%r3, %r5, %r22
	.word 0xa611a712  ! 88: OR_I	or 	%r6, 0x0712, %r19
	.word 0xa4088005  ! 88: AND_R	and 	%r2, %r5, %r18
	.word 0xa209ed73  ! 88: AND_I	and 	%r7, 0x0d73, %r17
	.word 0xb010e54a  ! 88: OR_I	or 	%r3, 0x054a, %r24
	.word 0xb208ea62  ! 88: AND_I	and 	%r3, 0x0a62, %r25
	.word 0xbc10a79d  ! 88: OR_I	or 	%r2, 0x079d, %r30
	.word 0xb6110005  ! 88: OR_R	or 	%r4, %r5, %r27
	.word 0xba098005  ! 88: AND_R	and 	%r6, %r5, %r29
	.word 0xac08ab00  ! 88: AND_I	and 	%r2, 0x0b00, %r22
	.word 0xa401ad4d  ! 88: ADD_I	add 	%r6, 0x0d4d, %r18
	.word 0xb400a75c  ! 88: ADD_I	add 	%r2, 0x075c, %r26
	.word 0xb4098005  ! 88: AND_R	and 	%r6, %r5, %r26
	.word 0x9e10acdb  ! 88: OR_I	or 	%r2, 0x0cdb, %r15
	.word 0x9e00e09c  ! 88: ADD_I	add 	%r3, 0x009c, %r15
	.word 0xac012d22  ! 88: ADD_I	add 	%r4, 0x0d22, %r22
	.word 0xba01af40  ! 88: ADD_I	add 	%r6, 0x0f40, %r29
	.word 0xa0010005  ! 88: ADD_R	add 	%r4, %r5, %r16
	.word 0xa2008005  ! 88: ADD_R	add 	%r2, %r5, %r17
	.word 0xae10a765  ! 88: OR_I	or 	%r2, 0x0765, %r23
	.word 0x9e10e819  ! 88: OR_I	or 	%r3, 0x0819, %r15
	.word 0xac088005  ! 88: AND_R	and 	%r2, %r5, %r22
	.word 0xae098005  ! 88: AND_R	and 	%r6, %r5, %r23
	.word 0x9e118005  ! 88: OR_R	or 	%r6, %r5, %r15
	.word 0xac10a795  ! 88: OR_I	or 	%r2, 0x0795, %r22
	.word 0xa200a153  ! 88: ADD_I	add 	%r2, 0x0153, %r17
	.word 0xac08e23e  ! 88: AND_I	and 	%r3, 0x023e, %r22
	.word 0xbc108005  ! 88: OR_R	or 	%r2, %r5, %r30
	.word 0xa608a4a2  ! 88: AND_I	and 	%r2, 0x04a2, %r19
	.word 0xb800aa23  ! 88: ADD_I	add 	%r2, 0x0a23, %r28
	.word 0xbc090005  ! 88: AND_R	and 	%r4, %r5, %r30
	.word 0xac09ed74  ! 88: AND_I	and 	%r7, 0x0d74, %r22
	.word 0xbc08a0a1  ! 88: AND_I	and 	%r2, 0x00a1, %r30
	.word 0xb200a6a0  ! 88: ADD_I	add 	%r2, 0x06a0, %r25
	.word 0xa808ac44  ! 88: AND_I	and 	%r2, 0x0c44, %r20
	.word 0x9a08ac87  ! 88: AND_I	and 	%r2, 0x0c87, %r13
	.word 0xbe110005  ! 88: OR_R	or 	%r4, %r5, %r31
	.word 0xaa118005  ! 88: OR_R	or 	%r6, %r5, %r21
	.word 0xb000aa81  ! 88: ADD_I	add 	%r2, 0x0a81, %r24
	.word 0xb0010005  ! 88: ADD_R	add 	%r4, %r5, %r24
	.word 0xa409a564  ! 88: AND_I	and 	%r6, 0x0564, %r18
	.word 0xa8110005  ! 88: OR_R	or 	%r4, %r5, %r20
	.word 0xbc10a15c  ! 88: OR_I	or 	%r2, 0x015c, %r30
	.word 0xb808c005  ! 88: AND_R	and 	%r3, %r5, %r28
	.word 0xa610ab6b  ! 88: OR_I	or 	%r2, 0x0b6b, %r19
	.word 0xa4110005  ! 88: OR_R	or 	%r4, %r5, %r18
	.word 0xb600e217  ! 88: ADD_I	add 	%r3, 0x0217, %r27
	.word 0xa4090005  ! 88: AND_R	and 	%r4, %r5, %r18
	.word 0xaa088005  ! 88: AND_R	and 	%r2, %r5, %r21
	.word 0xa610a46d  ! 88: OR_I	or 	%r2, 0x046d, %r19
	.word 0x9a08e356  ! 88: AND_I	and 	%r3, 0x0356, %r13
	.word 0xa208aaec  ! 88: AND_I	and 	%r2, 0x0aec, %r17
	.word 0xbe008005  ! 88: ADD_R	add 	%r2, %r5, %r31
	.word 0x9a008005  ! 88: ADD_R	add 	%r2, %r5, %r13
	.word 0xb008a552  ! 88: AND_I	and 	%r2, 0x0552, %r24
	.word 0xbe108005  ! 88: OR_R	or 	%r2, %r5, %r31
	.word 0xb008a9ce  ! 88: AND_I	and 	%r2, 0x09ce, %r24
	.word 0xa010a998  ! 88: OR_I	or 	%r2, 0x0998, %r16
	.word 0xae09e03a  ! 88: AND_I	and 	%r7, 0x003a, %r23
	.word 0x9e08aa11  ! 88: AND_I	and 	%r2, 0x0a11, %r15
	.word 0xb410c005  ! 88: OR_R	or 	%r3, %r5, %r26
	.word 0xb610c005  ! 88: OR_R	or 	%r3, %r5, %r27
	.word 0xb6008005  ! 88: ADD_R	add 	%r2, %r5, %r27
	.word 0xa0118005  ! 88: OR_R	or 	%r6, %r5, %r16
	.word 0xb409242e  ! 88: AND_I	and 	%r4, 0x042e, %r26
	.word 0xba09e035  ! 88: AND_I	and 	%r7, 0x0035, %r29
	.word 0xa6112270  ! 88: OR_I	or 	%r4, 0x0270, %r19
	.word 0xa8008005  ! 88: ADD_R	add 	%r2, %r5, %r20
	.word 0xa60123b0  ! 88: ADD_I	add 	%r4, 0x03b0, %r19
	.word 0xa011c005  ! 88: OR_R	or 	%r7, %r5, %r16
	.word 0xa2088005  ! 88: AND_R	and 	%r2, %r5, %r17
	.word 0xbc098005  ! 88: AND_R	and 	%r6, %r5, %r30
	.word 0xa6118005  ! 88: OR_R	or 	%r6, %r5, %r19
	.word 0x9e00e868  ! 88: ADD_I	add 	%r3, 0x0868, %r15
	.word 0xb2088005  ! 88: AND_R	and 	%r2, %r5, %r25
	.word 0xac08c005  ! 88: AND_R	and 	%r3, %r5, %r22
	.word 0x9c11c005  ! 88: OR_R	or 	%r7, %r5, %r14
	.word 0xba09c005  ! 88: AND_R	and 	%r7, %r5, %r29
	.word 0xa209c005  ! 88: AND_R	and 	%r7, %r5, %r17
	.word 0xb208e8f5  ! 88: AND_I	and 	%r3, 0x08f5, %r25
	.word 0xb2010005  ! 88: ADD_R	add 	%r4, %r5, %r25
	.word 0xa8110005  ! 88: OR_R	or 	%r4, %r5, %r20
	.word 0xbe01c005  ! 88: ADD_R	add 	%r7, %r5, %r31
	.word 0xae09aa0d  ! 88: AND_I	and 	%r6, 0x0a0d, %r23
	.word 0xbe008005  ! 88: ADD_R	add 	%r2, %r5, %r31
	.word 0xaa11c005  ! 88: OR_R	or 	%r7, %r5, %r21
	.word 0xa8088005  ! 88: AND_R	and 	%r2, %r5, %r20
	.word 0xa6098005  ! 88: AND_R	and 	%r6, %r5, %r19
	.word 0xb8088005  ! 88: AND_R	and 	%r2, %r5, %r28
	.word 0xb8108005  ! 88: OR_R	or 	%r2, %r5, %r28
	.word 0xb0112443  ! 88: OR_I	or 	%r4, 0x0443, %r24
	.word 0xac10e20c  ! 88: OR_I	or 	%r3, 0x020c, %r22
	.word 0xa2108005  ! 88: OR_R	or 	%r2, %r5, %r17
	.word 0x9e00a631  ! 88: ADD_I	add 	%r2, 0x0631, %r15
	.word 0xb809c005  ! 88: AND_R	and 	%r7, %r5, %r28
	.word 0xbc09a06b  ! 88: AND_I	and 	%r6, 0x006b, %r30
	.word 0xa0088005  ! 88: AND_R	and 	%r2, %r5, %r16
	.word 0x9a088005  ! 88: AND_R	and 	%r2, %r5, %r13
	.word 0x9a110005  ! 88: OR_R	or 	%r4, %r5, %r13
	.word 0xbc108005  ! 88: OR_R	or 	%r2, %r5, %r30
	.word 0xaa10eb6e  ! 88: OR_I	or 	%r3, 0x0b6e, %r21
	.word 0x9e112418  ! 88: OR_I	or 	%r4, 0x0418, %r15
	.word 0xa6088005  ! 88: AND_R	and 	%r2, %r5, %r19
	.word 0xbc00c005  ! 88: ADD_R	add 	%r3, %r5, %r30
	.word 0xaa010005  ! 88: ADD_R	add 	%r4, %r5, %r21
	.word 0xbc08e74c  ! 88: AND_I	and 	%r3, 0x074c, %r30
	.word 0xa611a5ae  ! 88: OR_I	or 	%r6, 0x05ae, %r19
	.word 0x9e08aa81  ! 88: AND_I	and 	%r2, 0x0a81, %r15
	.word 0xae11ea3e  ! 88: OR_I	or 	%r7, 0x0a3e, %r23
	.word 0xa809e8d5  ! 88: AND_I	and 	%r7, 0x08d5, %r20
	.word 0x9e09200c  ! 88: AND_I	and 	%r4, 0x000c, %r15
	.word 0xb010a306  ! 88: OR_I	or 	%r2, 0x0306, %r24
	.word 0xb008aacf  ! 88: AND_I	and 	%r2, 0x0acf, %r24
	.word 0xbe01c005  ! 88: ADD_R	add 	%r7, %r5, %r31
	.word 0x9a108005  ! 88: OR_R	or 	%r2, %r5, %r13
	.word 0x9c008005  ! 88: ADD_R	add 	%r2, %r5, %r14
	.word 0xb211c005  ! 88: OR_R	or 	%r7, %r5, %r25
	.word 0xb208af94  ! 88: AND_I	and 	%r2, 0x0f94, %r25
	.word 0x9e088005  ! 88: AND_R	and 	%r2, %r5, %r15
	.word 0xbe088005  ! 88: AND_R	and 	%r2, %r5, %r31
	.word 0xa0110005  ! 88: OR_R	or 	%r4, %r5, %r16
	.word 0xb81126d2  ! 88: OR_I	or 	%r4, 0x06d2, %r28
	.word 0xf820afac  ! 88: STW_I	stw	%r28, [%r2 + 0x0fac]
	.word 0xf871a740  ! 88: STX_I	stx	%r28, [%r6 + 0x0740]
	.word 0xfc28a268  ! 88: STB_I	stb	%r30, [%r2 + 0x0268]
	.word 0xec292681  ! 88: STB_I	stb	%r22, [%r4 + 0x0681]
IRF_CE_45:
!$EV error(1,expr(@VA(.MAIN.IRF_CE_45), 16, 16), 1,IRF,ce,66,x, x,x,x, x,x,x)
!$EV error(1,expr(@VA(.MAIN.IRF_CE_45), 16, 16), 3,IRF,ce,14,x, x,x,x, x,x,x)
	.word 0xf830a41c  ! 88: STH_I	sth	%r28, [%r2 + 0x041c]
	.word 0xe870e608  ! 88: STX_I	stx	%r20, [%r3 + 0x0608]
	.word 0xe470acb8  ! 88: STX_I	stx	%r18, [%r2 + 0x0cb8]
	.word 0xd6f24ce8  ! 88: STXA_R	stxa	%r11, [%r9 + %r8] 0x67
	.word 0xaa10a6be  ! 88: OR_I	or 	%r2, 0x06be, %r21
	.word 0xbe01c005  ! 88: ADD_R	add 	%r7, %r5, %r31
	bne thr1_loop_11
	subcc %g1, 0x1, %g1
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr1_loop_12:
	.word 0xa811ab39  ! 95: OR_I	or 	%r6, 0x0b39, %r20
	.word 0xb410c005  ! 95: OR_R	or 	%r3, %r5, %r26
	.word 0xae088005  ! 95: AND_R	and 	%r2, %r5, %r23
	.word 0xac008005  ! 95: ADD_R	add 	%r2, %r5, %r22
	.word 0x9c108005  ! 95: OR_R	or 	%r2, %r5, %r14
	.word 0xa4118005  ! 95: OR_R	or 	%r6, %r5, %r18
	.word 0xa4088005  ! 95: AND_R	and 	%r2, %r5, %r18
	.word 0xba11c005  ! 95: OR_R	or 	%r7, %r5, %r29
	.word 0xb608ae64  ! 95: AND_I	and 	%r2, 0x0e64, %r27
	.word 0xac11e7ca  ! 95: OR_I	or 	%r7, 0x07ca, %r22
	.word 0xac018005  ! 95: ADD_R	add 	%r6, %r5, %r22
	.word 0xb608a164  ! 95: AND_I	and 	%r2, 0x0164, %r27
	.word 0xba008005  ! 95: ADD_R	add 	%r2, %r5, %r29
	.word 0xa2088005  ! 95: AND_R	and 	%r2, %r5, %r17
	.word 0xaa088005  ! 95: AND_R	and 	%r2, %r5, %r21
	.word 0xae012711  ! 95: ADD_I	add 	%r4, 0x0711, %r23
	.word 0xa0088005  ! 95: AND_R	and 	%r2, %r5, %r16
	.word 0xae00c005  ! 95: ADD_R	add 	%r3, %r5, %r23
	.word 0x9a088005  ! 95: AND_R	and 	%r2, %r5, %r13
	.word 0xa2098005  ! 95: AND_R	and 	%r6, %r5, %r17
	.word 0xb401e1c2  ! 95: ADD_I	add 	%r7, 0x01c2, %r26
	.word 0xac08e167  ! 95: AND_I	and 	%r3, 0x0167, %r22
	.word 0xbc008005  ! 95: ADD_R	add 	%r2, %r5, %r30
	.word 0xb0008005  ! 95: ADD_R	add 	%r2, %r5, %r24
	.word 0xba11a1f0  ! 95: OR_I	or 	%r6, 0x01f0, %r29
	.word 0xae08aca3  ! 95: AND_I	and 	%r2, 0x0ca3, %r23
	.word 0xb608e3d3  ! 95: AND_I	and 	%r3, 0x03d3, %r27
	.word 0xbc08e622  ! 95: AND_I	and 	%r3, 0x0622, %r30
	.word 0xac110005  ! 95: OR_R	or 	%r4, %r5, %r22
	.word 0xa210aa09  ! 95: OR_I	or 	%r2, 0x0a09, %r17
	.word 0xb2018005  ! 95: ADD_R	add 	%r6, %r5, %r25
	.word 0xae0921fc  ! 95: AND_I	and 	%r4, 0x01fc, %r23
	.word 0xbe08a54a  ! 95: AND_I	and 	%r2, 0x054a, %r31
	.word 0xac09a75a  ! 95: AND_I	and 	%r6, 0x075a, %r22
	.word 0xb810a9d8  ! 95: OR_I	or 	%r2, 0x09d8, %r28
	.word 0xb2008005  ! 95: ADD_R	add 	%r2, %r5, %r25
	.word 0xa2008005  ! 95: ADD_R	add 	%r2, %r5, %r17
	.word 0xaa00aaf9  ! 95: ADD_I	add 	%r2, 0x0af9, %r21
	.word 0xb008c005  ! 95: AND_R	and 	%r3, %r5, %r24
	.word 0xb400ae8e  ! 95: ADD_I	add 	%r2, 0x0e8e, %r26
	.word 0xaa08aabd  ! 95: AND_I	and 	%r2, 0x0abd, %r21
	.word 0xb8010005  ! 95: ADD_R	add 	%r4, %r5, %r28
	.word 0xae110005  ! 95: OR_R	or 	%r4, %r5, %r23
	.word 0xa001c005  ! 95: ADD_R	add 	%r7, %r5, %r16
	.word 0xa810ac95  ! 95: OR_I	or 	%r2, 0x0c95, %r20
	.word 0xb800c005  ! 95: ADD_R	add 	%r3, %r5, %r28
	.word 0xac010005  ! 95: ADD_R	add 	%r4, %r5, %r22
	.word 0xba08af75  ! 95: AND_I	and 	%r2, 0x0f75, %r29
	.word 0xbe088005  ! 95: AND_R	and 	%r2, %r5, %r31
	.word 0xb209c005  ! 95: AND_R	and 	%r7, %r5, %r25
	.word 0x9c09a900  ! 95: AND_I	and 	%r6, 0x0900, %r14
	.word 0xb6018005  ! 95: ADD_R	add 	%r6, %r5, %r27
	.word 0xb801ea7d  ! 95: ADD_I	add 	%r7, 0x0a7d, %r28
	.word 0x9a00e555  ! 95: ADD_I	add 	%r3, 0x0555, %r13
	.word 0xac10c005  ! 95: OR_R	or 	%r3, %r5, %r22
	.word 0xac008005  ! 95: ADD_R	add 	%r2, %r5, %r22
	.word 0xb0108005  ! 95: OR_R	or 	%r2, %r5, %r24
	.word 0xb810c005  ! 95: OR_R	or 	%r3, %r5, %r28
	.word 0xa2118005  ! 95: OR_R	or 	%r6, %r5, %r17
	.word 0xb208c005  ! 95: AND_R	and 	%r3, %r5, %r25
	.word 0xb4008005  ! 95: ADD_R	add 	%r2, %r5, %r26
	.word 0xa010c005  ! 95: OR_R	or 	%r3, %r5, %r16
	.word 0xae012676  ! 95: ADD_I	add 	%r4, 0x0676, %r23
	.word 0xa8018005  ! 95: ADD_R	add 	%r6, %r5, %r20
	.word 0xac088005  ! 95: AND_R	and 	%r2, %r5, %r22
	.word 0xb008c005  ! 95: AND_R	and 	%r3, %r5, %r24
	.word 0xba08a62b  ! 95: AND_I	and 	%r2, 0x062b, %r29
	.word 0x9c08c005  ! 95: AND_R	and 	%r3, %r5, %r14
	.word 0xb600e8c6  ! 95: ADD_I	add 	%r3, 0x08c6, %r27
	.word 0xaa118005  ! 95: OR_R	or 	%r6, %r5, %r21
	.word 0xa200c005  ! 95: ADD_R	add 	%r3, %r5, %r17
	.word 0xba108005  ! 95: OR_R	or 	%r2, %r5, %r29
	.word 0xaa110005  ! 95: OR_R	or 	%r4, %r5, %r21
	.word 0x9e11ec3d  ! 95: OR_I	or 	%r7, 0x0c3d, %r15
	.word 0x9e088005  ! 95: AND_R	and 	%r2, %r5, %r15
	.word 0xbe00c005  ! 95: ADD_R	add 	%r3, %r5, %r31
	.word 0xba090005  ! 95: AND_R	and 	%r4, %r5, %r29
	.word 0x9c110005  ! 95: OR_R	or 	%r4, %r5, %r14
	.word 0xa400ac20  ! 95: ADD_I	add 	%r2, 0x0c20, %r18
	.word 0xbe09c005  ! 95: AND_R	and 	%r7, %r5, %r31
	.word 0xb8110005  ! 95: OR_R	or 	%r4, %r5, %r28
	.word 0xae01227d  ! 95: ADD_I	add 	%r4, 0x027d, %r23
	.word 0xbc010005  ! 95: ADD_R	add 	%r4, %r5, %r30
	.word 0xb608a48d  ! 95: AND_I	and 	%r2, 0x048d, %r27
	.word 0xb608e99b  ! 95: AND_I	and 	%r3, 0x099b, %r27
	.word 0xb400aff0  ! 95: ADD_I	add 	%r2, 0x0ff0, %r26
	.word 0xaa09c005  ! 95: AND_R	and 	%r7, %r5, %r21
	.word 0x9e00a796  ! 95: ADD_I	add 	%r2, 0x0796, %r15
	.word 0xb808c005  ! 95: AND_R	and 	%r3, %r5, %r28
	.word 0xac012969  ! 95: ADD_I	add 	%r4, 0x0969, %r22
	.word 0xa800e4fc  ! 95: ADD_I	add 	%r3, 0x04fc, %r20
	.word 0xac00a10e  ! 95: ADD_I	add 	%r2, 0x010e, %r22
	.word 0xa4088005  ! 95: AND_R	and 	%r2, %r5, %r18
	.word 0xa408a9ec  ! 95: AND_I	and 	%r2, 0x09ec, %r18
	.word 0xa6118005  ! 95: OR_R	or 	%r6, %r5, %r19
	.word 0xb8092822  ! 95: AND_I	and 	%r4, 0x0822, %r28
	.word 0xac11a0fa  ! 95: OR_I	or 	%r6, 0x00fa, %r22
	.word 0xa811ef4b  ! 95: OR_I	or 	%r7, 0x0f4b, %r20
	.word 0xbe00a08b  ! 95: ADD_I	add 	%r2, 0x008b, %r31
	.word 0xbc088005  ! 95: AND_R	and 	%r2, %r5, %r30
	.word 0xa211e5fc  ! 95: OR_I	or 	%r7, 0x05fc, %r17
	.word 0xae11e26a  ! 95: OR_I	or 	%r7, 0x026a, %r23
	.word 0xb4092e8b  ! 95: AND_I	and 	%r4, 0x0e8b, %r26
	.word 0xa411c005  ! 95: OR_R	or 	%r7, %r5, %r18
	.word 0x9a00c005  ! 95: ADD_R	add 	%r3, %r5, %r13
	.word 0x9c09c005  ! 95: AND_R	and 	%r7, %r5, %r14
	.word 0xba09ed5b  ! 95: AND_I	and 	%r7, 0x0d5b, %r29
	.word 0xb211c005  ! 95: OR_R	or 	%r7, %r5, %r25
	.word 0xbc08ea9c  ! 95: AND_I	and 	%r3, 0x0a9c, %r30
	.word 0x9e01eff9  ! 95: ADD_I	add 	%r7, 0x0ff9, %r15
	.word 0xa6118005  ! 95: OR_R	or 	%r6, %r5, %r19
	.word 0xba10a57f  ! 95: OR_I	or 	%r2, 0x057f, %r29
	.word 0xb800ab68  ! 95: ADD_I	add 	%r2, 0x0b68, %r28
	.word 0xaa008005  ! 95: ADD_R	add 	%r2, %r5, %r21
	.word 0xae10a09b  ! 95: OR_I	or 	%r2, 0x009b, %r23
	.word 0xba08edc3  ! 95: AND_I	and 	%r3, 0x0dc3, %r29
	.word 0x9e098005  ! 95: AND_R	and 	%r6, %r5, %r15
	.word 0xbc01e4a7  ! 95: ADD_I	add 	%r7, 0x04a7, %r30
	.word 0x9e00c005  ! 95: ADD_R	add 	%r3, %r5, %r15
	.word 0xbc11abb2  ! 95: OR_I	or 	%r6, 0x0bb2, %r30
	.word 0xba08eafd  ! 95: AND_I	and 	%r3, 0x0afd, %r29
	.word 0x9e10a7f6  ! 95: OR_I	or 	%r2, 0x07f6, %r15
	.word 0xa010a715  ! 95: OR_I	or 	%r2, 0x0715, %r16
	.word 0xbe09c005  ! 95: AND_R	and 	%r7, %r5, %r31
	.word 0xa610a2bb  ! 95: OR_I	or 	%r2, 0x02bb, %r19
	.word 0xa6010005  ! 95: ADD_R	add 	%r4, %r5, %r19
	.word 0xae11ae57  ! 95: OR_I	or 	%r6, 0x0e57, %r23
	.word 0xa400aaf0  ! 95: ADD_I	add 	%r2, 0x0af0, %r18
	.word 0xbc09238f  ! 95: AND_I	and 	%r4, 0x038f, %r30
	.word 0xac008005  ! 95: ADD_R	add 	%r2, %r5, %r22
	.word 0xa601c005  ! 95: ADD_R	add 	%r7, %r5, %r19
	.word 0xae098005  ! 95: AND_R	and 	%r6, %r5, %r23
	.word 0xba08e467  ! 95: AND_I	and 	%r3, 0x0467, %r29
	.word 0xb000aa54  ! 95: ADD_I	add 	%r2, 0x0a54, %r24
	.word 0xb0118005  ! 95: OR_R	or 	%r6, %r5, %r24
	.word 0xb008c005  ! 95: AND_R	and 	%r3, %r5, %r24
	.word 0xb6008005  ! 95: ADD_R	add 	%r2, %r5, %r27
	.word 0xb800c005  ! 95: ADD_R	add 	%r3, %r5, %r28
	.word 0xae0924f0  ! 95: AND_I	and 	%r4, 0x04f0, %r23
	.word 0xa608c005  ! 95: AND_R	and 	%r3, %r5, %r19
	.word 0xaa108005  ! 95: OR_R	or 	%r2, %r5, %r21
	.word 0xa008c005  ! 95: AND_R	and 	%r3, %r5, %r16
	.word 0xa809208f  ! 95: AND_I	and 	%r4, 0x008f, %r20
	.word 0x9a00c005  ! 95: ADD_R	add 	%r3, %r5, %r13
	.word 0xa600a08a  ! 95: ADD_I	add 	%r2, 0x008a, %r19
	.word 0xa401edbe  ! 95: ADD_I	add 	%r7, 0x0dbe, %r18
	.word 0xac018005  ! 95: ADD_R	add 	%r6, %r5, %r22
	.word 0xb6088005  ! 95: AND_R	and 	%r2, %r5, %r27
	.word 0xae090005  ! 95: AND_R	and 	%r4, %r5, %r23
	.word 0xba110005  ! 95: OR_R	or 	%r4, %r5, %r29
	.word 0xb208c005  ! 95: AND_R	and 	%r3, %r5, %r25
	.word 0xaa10c005  ! 95: OR_R	or 	%r3, %r5, %r21
	.word 0xb8098005  ! 95: AND_R	and 	%r6, %r5, %r28
	.word 0xa611acd3  ! 95: OR_I	or 	%r6, 0x0cd3, %r19
	.word 0xb80926a4  ! 95: AND_I	and 	%r4, 0x06a4, %r28
	.word 0x9e00eb9d  ! 95: ADD_I	add 	%r3, 0x0b9d, %r15
	.word 0xa400a156  ! 95: ADD_I	add 	%r2, 0x0156, %r18
	.word 0x9c11e9ac  ! 95: OR_I	or 	%r7, 0x09ac, %r14
	.word 0xb811c005  ! 95: OR_R	or 	%r7, %r5, %r28
	.word 0xbe00a62c  ! 95: ADD_I	add 	%r2, 0x062c, %r31
	.word 0xba00a9fc  ! 95: ADD_I	add 	%r2, 0x09fc, %r29
	.word 0x9a10eee6  ! 95: OR_I	or 	%r3, 0x0ee6, %r13
	.word 0xb2112c27  ! 95: OR_I	or 	%r4, 0x0c27, %r25
	.word 0xb211ed5d  ! 95: OR_I	or 	%r7, 0x0d5d, %r25
	.word 0xba09c005  ! 95: AND_R	and 	%r7, %r5, %r29
	.word 0xb0008005  ! 95: ADD_R	add 	%r2, %r5, %r24
	.word 0xa808a258  ! 95: AND_I	and 	%r2, 0x0258, %r20
	.word 0xac10a1fc  ! 95: OR_I	or 	%r2, 0x01fc, %r22
	.word 0xb209c005  ! 95: AND_R	and 	%r7, %r5, %r25
	.word 0xa6108005  ! 95: OR_R	or 	%r2, %r5, %r19
	.word 0xa6090005  ! 95: AND_R	and 	%r4, %r5, %r19
	.word 0xb610a7f5  ! 95: OR_I	or 	%r2, 0x07f5, %r27
	.word 0xac11c005  ! 95: OR_R	or 	%r7, %r5, %r22
	.word 0xb009adab  ! 95: AND_I	and 	%r6, 0x0dab, %r24
	.word 0xba10ec60  ! 95: OR_I	or 	%r3, 0x0c60, %r29
	.word 0xb200e909  ! 95: ADD_I	add 	%r3, 0x0909, %r25
	.word 0xbe01213d  ! 95: ADD_I	add 	%r4, 0x013d, %r31
	.word 0xb200e432  ! 95: ADD_I	add 	%r3, 0x0432, %r25
	.word 0x9e09a8cb  ! 95: AND_I	and 	%r6, 0x08cb, %r15
	.word 0xba008005  ! 95: ADD_R	add 	%r2, %r5, %r29
	.word 0xa2112bd5  ! 95: OR_I	or 	%r4, 0x0bd5, %r17
	.word 0xba09c005  ! 95: AND_R	and 	%r7, %r5, %r29
	.word 0x9a08ad2d  ! 95: AND_I	and 	%r2, 0x0d2d, %r13
	.word 0xbc10af98  ! 95: OR_I	or 	%r2, 0x0f98, %r30
	.word 0xec20a738  ! 95: STW_I	stw	%r22, [%r2 + 0x0738]
	.word 0xf630e318  ! 95: STH_I	sth	%r27, [%r3 + 0x0318]
	.word 0xe828ac0b  ! 95: STB_I	stb	%r20, [%r2 + 0x0c0b]
	.word 0xf629e689  ! 95: STB_I	stb	%r27, [%r7 + 0x0689]
IRF_CE_49:
!$EV error(1,expr(@VA(.MAIN.IRF_CE_49), 16, 16), 1,IRF,ce,2,x, x,x,x, x,x,x)
!$EV error(1,expr(@VA(.MAIN.IRF_CE_49), 16, 16), 3,IRF,ce,27,x, x,x,x, x,x,x)
	.word 0xea20add4  ! 95: STW_I	stw	%r21, [%r2 + 0x0dd4]
	.word 0xf0312ee6  ! 95: STH_I	sth	%r24, [%r4 + 0x0ee6]
	.word 0xf630ee6c  ! 95: STH_I	sth	%r27, [%r3 + 0x0e6c]
	.word 0xee29a3f2  ! 95: STB_I	stb	%r23, [%r6 + 0x03f2]
	.word 0xae008005  ! 95: ADD_R	add 	%r2, %r5, %r23
	.word 0xb6098005  ! 95: AND_R	and 	%r6, %r5, %r27
	bne thr1_loop_12
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
	.word  0x0dad33b6,0x9c62482d,0x7bc717ac,0x123ff044
	.word  0x29a42d50,0x45d51aec,0xf048649b,0xdc5d2b61
	.word  0x02fd0af7,0x2f4f7084,0xc4b8c144,0xdea09257
	.word  0x6b3d01bc,0xf0fb4a50,0x349bb766,0x4049b439
	.word  0xfaa13f5c,0x7332324b,0xcc3fffde,0xbe1d7485
	.word  0x8d612c79,0xd61cc4c4,0xf381b2c4,0x5497f5e3
	.word  0x6ba56ad1,0xfb74be30,0x44299833,0x8d74cf8b
	.word  0x490f57ed,0x239caac9,0x4d91423a,0x7b318bed
	.word  0x84553ab8,0x03eacb51,0xfbec56ce,0x4dfd03fe
	.word  0x9ce3392a,0xf65a1f8e,0x8c1767c8,0x7b242011
	.word  0xfdadc841,0xafe4afd9,0x4139d977,0x3442bfda
	.word  0xb370d98c,0xc2ccd108,0x1ff87c41,0xbae6ab4b
	.word  0xf5c1a81a,0x8358d618,0x9b11e4eb,0xc166b73e
	.word  0x05dcbec3,0x0c0ebe57,0x7ae6b770,0xd0e2d53a
	.word  0xf12d5223,0x09376f8e,0x11707f23,0xee6ce3d5
	.word  0xf5b4b7c7,0x4fd3fefa,0x04bac07e,0x7f352425
	.word  0x15c4f7f3,0x7a199f4c,0x3dc90820,0x4aedcfaf
	.word  0xeed106cf,0x1b0398ee,0x66c0a91a,0x0d2a0d34
	.word  0x61fa980b,0x1bb4e4de,0xc3273e7c,0xbfc24673
	.word  0x4dc47e22,0xbd8d5a01,0xd0fe40f6,0x52654b88
	.word  0x1213ed93,0xe1eedaa0,0x82f46216,0xfa4fd267
	.word  0x6c574c72,0x6457fc46,0xd82cf71c,0x8ee10571
	.word  0x4b35b2b7,0xac9a9491,0x08743d5b,0x859a1269
	.word  0x69c206f6,0x2106490e,0x14fab4ac,0x89997d1d
	.word  0x4b7ceba8,0x96ce9f9c,0x8b13058f,0x1e761cc2
	.word  0xaf20124b,0x616dfb15,0xc1515f72,0x50209b7b
	.word  0x9a0f6e65,0xbefa3d91,0x60c16873,0xc95905e8
	.word  0xd3343634,0x57e78fd5,0x75fd01e5,0xe6bbdf27
	.word  0x0e9cd0e9,0x95ca56f0,0x3138275b,0xa7e083c5
	.word  0xb5f9110e,0x4e489693,0x0b7b9944,0xeee78d99
	.word  0x503a18dd,0x8db83bfe,0x93091cd0,0x84e4f794
	.word  0x63b7cd34,0x43c7cbdc,0xd548e82f,0xce6ad4a5
	.word  0xfe7abdc8,0xb6c588f4,0xe8b20f0c,0xf6b1e92d
	.word  0xbdb143c7,0x01c5fbb8,0x78a24bc3,0xebd01160
	.word  0xc3284007,0x34378bbb,0xabe385fa,0x71d660bf
	.word  0x5952c2f5,0xdfa463ce,0xcf8b441a,0x18875e03
	.word  0x63094eff,0x5173a9a2,0xed8aceac,0x3c3eabb6
	.word  0xcf43ce22,0x3a15d616,0x63220874,0x7190c5e2
	.word  0x4164f411,0x267d552c,0x2c5c7687,0x563e5283
	.word  0xb8fdfa10,0x23e6198e,0x066937a7,0x29620eb1
	.word  0x13bb3bb5,0xb72743f3,0x30977b3a,0x3a5e22a5
	.word  0xd1053250,0x42a27bf3,0x9cdac1c7,0x0d960f8a
	.word  0x3d758db5,0x91a1ed06,0x609e33ec,0xd62917da
	.word  0x8f61b8eb,0xda625649,0x2fff1bf6,0x6cb06e0a
	.word  0x2e3393e3,0xcb93f2ee,0xcc02dad5,0xd5246c5a
	.word  0xecc1d367,0x6563a22b,0x33bad827,0x04609adb
	.word  0xedab5054,0xcab7fe12,0xe68ff68b,0x25b3d7fa
	.word  0xd32fa4a0,0xc5a2568a,0x1c36d62b,0x7a3702d3
	.word  0x7fb874f9,0xfc278f3e,0x0b39ba4c,0xf6247c17
	.word  0x01f90238,0x1bc0bcfe,0xf102fbf2,0xee664627
	.word  0x3b4d2961,0x280329ba,0x50f3b417,0x4393b390
	.word  0xf34fbbc2,0x42b6c0bc,0x9b0dfdc2,0x34ab0cf0
	.word  0x1bdd0266,0x8470a194,0xf11b147f,0x9d257c5d
	.word  0xc832d94a,0xe886767e,0x51de9ea7,0x98ea18ab
	.word  0xf5af23d8,0xe7741c62,0xe20d1081,0xdf3aac70
	.word  0xe364c618,0xc0731fe9,0x14661982,0x25d6d991
	.word  0x3780a9ea,0xdbf8357e,0x6697c39d,0x34c91684
	.word  0x2aaa0d38,0x42dd6132,0x906abad7,0x9aaf487b
	.word  0x4e3d9f06,0x372ea9d4,0x59ed165d,0x5dc73b9a
	.word  0xffc6e372,0x4383b8b9,0xa12421c2,0x49d5b6af
	.word  0x306bce74,0x92c7d426,0x526a4d4c,0x97742271
	.word  0x5aa8efa5,0x4a9f6be6,0xf1a776dd,0xb912dcb6
	.word  0xefb61bff,0xa5ee4518,0xe4ca88e7,0x4f531b82
	.word  0x0a970c75,0xfff199a4,0x99e87baf,0x3be3b963
	.word  0xdf18a8ed,0x93741aa1,0xe0b0c300,0x8cdc45ec
	.word  0x472546ff,0xcdb36a45,0x4f90707b,0xc49b3534
	.word  0x418dbaec,0x2fedc7bb,0xa6702218,0x4f358913
	.word  0xe0ac4fe8,0xc798a434,0x792dbe8e,0x4ef812e4
	.word  0x22a8e839,0x72f902dd,0x9eacfd19,0x57b25646
	.word  0x4ba0a1c2,0x5680d980,0x93c21429,0x64f62192
	.word  0xbbea6d21,0xb85dd79e,0x1ede472d,0x893d661c
	.word  0xeab8cd98,0x36ce238a,0xf0f4cc1e,0x7386e80e
	.word  0x12dc940a,0x37bb982a,0x24972b1f,0xf221e949
	.word  0x858ff039,0x916930fb,0x862afd39,0x86cf15d7
	.word  0x4eafbe6e,0xba7f2ee8,0x85fb1781,0xd4de1587
	.word  0xfcc29a8d,0x3cb36bc7,0xdc19a205,0xabd34e1e
	.word  0x6c60b8f7,0x989cc115,0xbd8f32c0,0xf5bc43b7
	.word  0xf1b0f653,0x00c39b9a,0xcb4683f9,0x0d982e64
	.word  0x159327b4,0x58622160,0x6bbe80db,0x06e6bcbf
	.word  0xea05287f,0x19c76924,0x2e89441c,0xab2f8dc0
	.word  0x7f9b6695,0x983fc8d7,0x64a221d0,0xc5f9dc70
	.word  0x3004cb83,0xfc433278,0x0b3c3ec8,0x42eb5106
	.word  0x8d333895,0xe51d57e8,0xe73d4be6,0xfabea771
	.word  0x30b8cdda,0x84667012,0xd785d05d,0x9e573d6b
	.word  0x39645bc9,0xab1b9d98,0xcd23819e,0x1952034b
	.word  0x28204bc9,0x29c2da22,0x1b9d3b4a,0x60232ac8
	.word  0xb4ab74e3,0x3a2171ab,0xe402915d,0x1f08fe48
	.word  0x5040bfdf,0xeb10e2f3,0xf9d105ea,0x870361d4
	.word  0xb3e193b8,0x74a421a3,0xf9b8c31b,0x1234b3a6
	.word  0xac7cde5c,0x16835fe4,0xbb4757e9,0x9ea7ce67
	.word  0xf339932c,0xc8a216e5,0x1ad0a689,0x6fb7be21
	.word  0xfd6a605c,0x13acab42,0x60e2ea59,0x67892564
	.word  0x40d10d76,0xcde998d4,0x94ca7e8a,0xc4d8f47a
	.word  0x092d1cdf,0x42ce4a5e,0x3f2a7f84,0x7050f244
	.word  0xdbf9ae0a,0xe0f0add9,0xa0806151,0xd77cf26e
	.word  0x0a99e76d,0x35639dbb,0x78d9b873,0xbf604251
	.word  0x29f6c23a,0x25f0cc89,0x71ba8c41,0x9e545d8f
	.word  0x3cbd773d,0x0ac98269,0x0f0cbb05,0x793fb231
	.word  0x71a1cfcf,0x2a9a02a2,0x40900bad,0x39ecfcbd
	.word  0x652cabbb,0xfdf9e6aa,0xebabd61a,0xb8a46eec
	.word  0xdeef4043,0xa192e1db,0x1ab9513c,0x51d0f36b
	.word  0x5a5f6afb,0xb65d2290,0xd20cc20f,0x62990261
	.word  0x20f6c9e1,0x85255dce,0x08ea2870,0xacb3bbb4
	.word  0x549e4aec,0xca544e46,0x4bca5f84,0xeb2b5669
	.word  0xbd714c81,0x4d6c53ca,0x17e74cf4,0x673b6034
	.word  0x76e0f7b3,0xa17484e8,0x1a92cc1f,0xaf926a57
	.word  0x68738b21,0x2e0617c5,0xa14c7b8f,0x7bb4eb43
	.word  0xbe882958,0x29965061,0x902b6c7d,0xfb57da09
	.word  0x5691f104,0x2c202705,0xa8d4d628,0xa74f66ee
	.word  0x9fd114d9,0x3df31580,0x1845402f,0x3912a89f
	.word  0xd39e3cf2,0x9467b827,0x533e1103,0x80160b9e
	.word  0x4d4e61d0,0x4fa924af,0xbdec2282,0x5476e26e
	.word  0x1bcccc26,0xd795e1c1,0x240b7169,0x26357ac6
	.word  0x72bd7c2b,0xb5418181,0xae3b68d3,0xe40014de
	.word  0x157deedc,0xf51a340f,0xabfc70e7,0x3b285867
	.word  0xbc411e42,0xd775bc6f,0xe6aa8639,0xb72dc0b5
	.word  0x2f053e90,0x75cf043d,0x43eedcda,0xcaa79658
	.word  0x99d8b332,0xcb0adb29,0xb5b101ef,0x8eb3a25d
	.word  0xccf3b254,0xba8d60d6,0x50fef2df,0x47d66c4f
	.word  0x30134c28,0xea205c61,0x0b43bdcd,0xbd1cccb3
	.word  0x179166a0,0xd679dc9d,0xa4845666,0xe67f3da0
	.word  0xe9fb0c22,0x8aade05d,0xb8ff7efa,0x77a09314
	.word  0x26e28074,0xa1e2752c,0x83894dec,0xfcf40e44
	.word  0x6196b995,0x1d6b3bfb,0x7ba0e5d6,0x295bcbcf
	.word  0x06750af7,0xae21452b,0x4d5153c1,0xc50bfb79
	.word  0x5f12d4e7,0xe1d75002,0x7fbc8f70,0x8c17f466
	.word  0xb8d8f26b,0x7612b3f9,0x93bc2453,0x267d1229
	.word  0xb845b370,0xd98501ea,0x05929907,0xe394bc31
	.word  0xa0a11a04,0xd92a3892,0xf9ce23c0,0xeca88293
	.word  0x935f9479,0xde291116,0x61233082,0xa4ea8dd3
	.word  0xecd6c0d2,0x4e924cd2,0x64b48df3,0xe956ec99
	.word  0xa95fda0f,0xd7279fa2,0x76a37369,0x78198d16
	.word  0x1ee6e81a,0x122676a2,0x201de0b4,0x02063c4d
	.word  0x68f6a575,0xa69fd3b8,0xc11aa796,0x790050fc
	.word  0xf3a4fe07,0xaedc190a,0xcd06302b,0x153d66e0
	.word  0xe177d743,0x2fdf3e2f,0x5e98758c,0x82de52fb
	.word  0x41972eea,0x5563d853,0x72a4ec57,0x056a1b7e
	.word  0x75b3bb65,0xc55491c1,0xc8aff176,0xae24bf44
	.word  0xdb98b167,0xd997d1fe,0xc674f517,0xefe3f88d
	.word  0x8bbf43e2,0xec2e147f,0xc94db66e,0xaaa353fe
	.word  0x93e7b02c,0xffaf489a,0x86ee669a,0xab321c56
	.word  0x96ad7951,0x35134701,0x909b40d7,0xbacadbc6
	.word  0x9d724236,0x304df8e5,0x1966d89a,0x998acef6
	.word  0x2a7bde61,0x32785396,0x4f2d4fe7,0xdcd48155
	.word  0x2190e509,0xe6acb19c,0x64452238,0xc689a957
	.word  0xc1a521c8,0x1216aae8,0x82c193be,0x08fefa3d
	.word  0x0768c9cd,0x6f556eea,0x35bb379b,0x04e80178
	.word  0xcb161391,0x001b5dd1,0x76376bca,0xaf50fbb4
	.word  0xa51fce1b,0x7146ee78,0x927ae9a1,0x647036cc
	.word  0x228e9576,0xa68620d5,0x71f80f05,0xa96a75c8
	.word  0x54df89f9,0x17d95e7f,0xed9246a8,0xfb9357fa
	.word  0x6d63b99e,0xdac47338,0x400e6f65,0x71396151
	.word  0xfafe5fe7,0x52138ffc,0x3a79beb8,0xa2aec835
	.word  0x20072735,0x7feeac06,0x36d50bd7,0x19f61bb2
	.word  0x8ebae6f5,0xd0d1fb0c,0xae521cd7,0x6c9b8f6b
	.word  0x2cffbfd3,0x300b65c5,0xc3fde5f8,0xc5522c79
	.word  0x4d58d8f5,0xf2f2b3e9,0xaa0ec715,0xd0a3adb8
	.word  0x942fd307,0x551d4266,0x87cf7cc9,0x1aa9ac55
	.word  0x3597219e,0xda20fd77,0xc4509ec0,0x209229c3
	.word  0xce21a3be,0xe13a69e4,0x0f2f8d7e,0xd7f5a247
	.word  0x9761e6c2,0x55a374cd,0x9b88a3d8,0xb2e4c852
	.word  0x6b5da973,0xc4c261df,0x141a4313,0x1e0b4d68
	.word  0xd1701caa,0x0f0327cf,0x2f22df3d,0xcc8f89f5
	.word  0x554cc939,0x6f70143d,0x2cce2d0d,0x56871987
	.word  0x8b235ef6,0xf161688d,0x718f9a69,0x9056013b
	.word  0xbf49b621,0xaad2f8fd,0x5ad0a248,0xaa21c3b6
	.word  0x033b4252,0xa3734cf8,0x055bdcaf,0xd3b90791
	.word  0xbddb96ac,0x72bef03c,0x77ab3c7b,0x36543473
	.word  0x717afd9f,0xd4174bcf,0x5ee02e46,0x19c0868c
	.word  0xa871e8b2,0x2b29b98c,0x85d89c5b,0x43b8c78b
	.word  0x6b2949f7,0xbec1588a,0xcfb4c4d0,0xc268a725
	.word  0xe505e99e,0xe0c9c540,0x0f6cfe5e,0x1f3f7e92
	.word  0xde703c98,0xdf184aff,0xecedb041,0x0f8538de
	.word  0x766b9c7b,0x776e9069,0xb5f2ba44,0x523bb201
	.word  0x8f1fa14a,0x5209be91,0x7952eee8,0xf2304598
	.word  0xa1f05b97,0xa30e3153,0xfaa4c44a,0x4dd6b6ce
	.word  0x4305e7aa,0xff42d38c,0x4aa31421,0x79be75cc
	.word  0x2cf4adc8,0xc4f86dd3,0x68ab2006,0x3bd503cb
	.word  0xa4936ccb,0xa1f3e1bc,0xe5c99995,0x3763f337
	.word  0x23ecdc6e,0xa863b9c6,0x1c7b5abd,0x1c443994
	.word  0xa0dd4880,0xd428bc2e,0x375e09fd,0x5d4cd2f2
	.word  0xb7280073,0x4325b7dc,0xd366465a,0x19e2e009
	.word  0x269beb2f,0x575d67ab,0x27f8919f,0xea3ac33f
	.word  0x7c3d41f0,0x41611986,0x5a16b53d,0xbd9e1888
	.word  0x2397d0d3,0x29f6b8b5,0xf53674aa,0x4ab01257
	.word  0x588adffa,0x9f435ece,0xc9845e83,0x71df394c
	.word  0x59647986,0x8670e4fd,0xc6cb1b2c,0xfb78d67a
	.word  0x25e49c98,0x8d9fe37a,0x9d589b65,0xf6742f83
	.word  0x92f633d5,0xfdbabb55,0x3f42dfe7,0x1080ba39
	.word  0xd5bec20e,0x96fc8902,0xec61778c,0xbf5bccdc
	.word  0xce2e60b7,0x269bb3ff,0x65157187,0x43b58e52
	.word  0x9ec3194a,0xdc018d75,0xb3744f6c,0xa6a608e4
	.word  0xa8594286,0x5f8551d9,0x1f35382a,0x245588b3
	.word  0x72aadf90,0xf19bebb1,0xb74fa2e9,0xc6334413
	.word  0x9944d4ec,0xaef57ee8,0xad2d39c0,0xbb5f490c
	.word  0x49d2377e,0xafabd4d8,0xd01a3412,0xdd69ae54
	.word  0xa7c342b8,0x1d591c0a,0x12c8b2b3,0x30c75c3a
	.word  0xdaaa7f6a,0x56946376,0xe3f7bbe9,0xfb989729
	.word  0x98fe12e9,0x6c2f4e1f,0x79a92323,0x92abb0ab
	.word  0x5ac94ccb,0x393bc992,0x084fc52e,0x95399231
	.word  0x2fe62259,0x8e0d2d5e,0x582c2c48,0x4688557c
	.word  0x4f9afbb1,0x3297d95b,0x46b0af17,0x1e92c54c
	.word  0xc73dcb04,0x1b616f4e,0x2aac7f67,0xeaf85417
	.word  0x0e077913,0xc4f77aa3,0x9b777741,0x6212ff53
	.word  0x678ba5a8,0x4d98e739,0x2d190e21,0xeb38c8fb
	.word  0xe29f51df,0x2d0d1499,0x15c282dd,0x51fcd374
	.word  0x104b081a,0xa81e7d20,0xdddcdf58,0x4254a4a3
	.word  0x0170a029,0x26a150b2,0x52c9e57f,0xa0a4df7f
	.word  0x458f1b5a,0x667b31d3,0x90ffe7b7,0xbd8ec790
	.word  0x0669607f,0x343bbcc2,0xc76445ec,0x5c9eb53a
	.word  0x15bfce07,0x56381362,0xdd8a8750,0xdf491f47
	.word  0x62334102,0x2cd6de3b,0x295a399b,0xdd9d302e
	.word  0x7d88b058,0x4ae31c95,0x622253ae,0x5a0b20f7
	.word  0xe703fca2,0x893f699d,0x6d98b61c,0x98bd0bbf
	.word  0x39fadfd4,0x8c26c247,0xff1699cc,0x59896683
	.word  0xc834cebb,0xfc0c25cd,0xaaffc521,0x36ee944a
	.word  0x4f8d56d3,0x59abe9bf,0x60fa968d,0xd28f8bd2
	.word  0x0f998808,0xe5dfda14,0x18aef637,0x83dd64c6
	.word  0x34b0c778,0x2ce75372,0x34b7f71e,0xcfa7e111
	.word  0xd59966a3,0xf0f8815a,0xc33cc9d2,0xdc9f7a02
	.word  0xc4ff61be,0x52cb3ad8,0x83b8c78b,0x09c82d2a
	.word  0x5a298c68,0x35347d36,0x8f148416,0x7ebaa9bb
	.word  0xf4eaf757,0xf4a53b2d,0x0837469e,0x3508ee33
	.word  0x2cf22782,0x842922db,0x8ccbb628,0x644c6ce4
	.word  0x52288434,0x66f87a84,0x8708b881,0x7f688a7a
	.word  0xee64d8c9,0x46154dfe,0xda872316,0x7fd62e4d
	.word  0x70fb7520,0x718cbd94,0xf0e5685c,0x2b4b4481
	.word  0xfb775737,0x9f29046c,0x4bb1cd34,0x3832a8fd
	.word  0x323f2465,0x4acf6313,0x9b49608a,0x5d9f7ae1
	.word  0x690e5470,0xa68621e8,0x8c2edaef,0x9a8d8c21
	.word  0x017edc79,0x218dc985,0xfe6494f4,0xea7308db
	.word  0xaa5be245,0x88213524,0xdab51e26,0xb3057e5c
	.word  0xc0195228,0x2194e789,0xd4d4c0df,0xcf32925a
	.word  0xcbaa60db,0xdae3fb47,0x3d4f20f0,0xe48ee3e0
	.word  0xcbdfcead,0x3abb90e0,0x25e7bc6c,0xff3c4347
	.word  0x26d735df,0xe10faf99,0x716a6bfb,0x04e4aa38
	.word  0x9bc0793a,0xdceaa9fe,0xad386745,0x331e2226
	.word  0x651371b8,0x93076187,0x3654d225,0x63950f88
	.word  0xddb3921e,0x3a6c449b,0xc9be98ce,0x957c9a8e
	.word  0x62ab7d1c,0x90f341d2,0xffb2f384,0x4ec98299
	.word  0xffa34c63,0x2f5ac216,0xc18827c1,0x8eebd457
	.word  0x27ca54f7,0x702b67e0,0xcdef4ab2,0xfdc2ed6c
	.word  0xb7fa3c4e,0xb983c84f,0x81cc0d0a,0xd24ffb46
	.word  0xae96a212,0xd0c53d78,0x1c2378af,0x4d3b91f8
	.word  0xb514225e,0xba7da299,0x9954c537,0x21787fd0
	.word  0x806899c4,0x70bdfc6b,0x92e6f014,0x68426145
	.word  0x0416028c,0x0b4b1d42,0xf0adc049,0x7fca1197
	.word  0x348ffa85,0x86c0ec6d,0xa5c626ec,0x9623e5d2
	.word  0x94d748ef,0xab336943,0xb069dff9,0x22c20ca5
	.word  0x5fe756e4,0x7077d0e3,0xe10a6b67,0x2b49ce32
	.word  0x4fa3c5cb,0xc9a182d7,0x499f21d1,0x9d826514
	.word  0xf5145bd1,0x2d1df212,0x0da2838f,0x17344fb9
	.word  0x34ef3e36,0x32c090b5,0x868a55fe,0x0d57664e
	.word  0x59abfc4b,0x487cbbd3,0x1031519b,0x4077eb05
	.word  0xbd85f20e,0x8df7a949,0x9aa274e9,0xc6917a06
	.word  0xd31532e8,0x36eee4f2,0xa1c3f292,0xe2d5569a



#if 0
!!# /************************************************************
!!# /**
!!# *
!!# * File:         stb8_18.j
!!# *
!!# * Description:  
!!# * Covers the following concurrently with a correctable IRF 
!!# * error in the W-stage:
!!# * 		
!!# * - An integer store in the 8th slot (D-stage)
!!# * - A non-integer long latency store in the 8th slot (D-stage)
!!# * - Both of the above with an imiss (S-stage)
!!# * 	
!!# * These translate to the following coverage conditions
!!# * - stb8_rfew
!!# * - stb8_swcd_rfew
!!# * - stb8_rfew_imss 
!!# * - stb8_rfew_swcd_imss
!!# **************************************************************/
!!# 
!!# template main ();
!!# 
!!# %%section c_declarations
!!# 
!!#   int i = 0;
!!#   int label_cnt = 0;
!!#   int err_cnt = 0;
!!#   int bitnum = 0;
!!# 
!!# %%section init
!!# 
!!#   printf ("**********************************\n");
!!# 
!!#   IJ_set_ropr_fld (ijdefault, Ft_Rs1, "{2,3,4,6,7}");
!!#   IJ_set_ropr_fld (ijdefault, Ft_Rs2, "{5}");
!!#   IJ_set_ropr_fld (ijdefault, Ft_Rd, "{13..31}");
!!#   IJ_set_ropr_fld (ijdefault, Ft_Simm13, "13'b0rrrrrrrrrrrr");
!!#   IJ_set_ropr_fld (ijdefault, Fm_align_Simm13, "3'b111");
!!#   IJ_set_ropr_fld (ijdefault, Fm_align_Rd, "1'b1");
!!#   IJ_set_ropr_fld (ijdefault, Ft_Imm_Asi, "{0x80}");
!!# 
!!#   IJ_set_ropr_fld (Ro_int_asi, Ft_Rs1, "{8..10}");
!!#   IJ_set_ropr_fld (Ro_int_asi, Ft_Rs2, "{8..10}");
!!#   IJ_set_ropr_fld (Ro_int_asi, Ft_Rd, "{11,12}");
!!#   IJ_set_ropr_fld (Ro_int_asi, Ft_Imm_Asi, "{0x67,0x4c,0x4b}");
!!# 
!!#   IJ_bind_thread_group(th_0, 0x1);
!!#   IJ_bind_thread_group(th_1, 0x2);
!!#   IJ_bind_thread_group(th_2, 0x4);
!!#   IJ_bind_thread_group(th_3, 0x8);
!!#   IJ_bind_thread_group(th_all, 0xf);
!!# 
!!#   IJ_th_fork (0x2, 0x4, 0x8);
!!# 
!!#   IJ_set_rvar (reg_rand_init, "28'hrrrrrrr,4'b0000,32'hrrrrrrrr");
!!#   for (i = 11; i < 13; i++) {
!!#      IJ_printf (th_all, "\tsetx  0x%016llrx, %%r1, %%r%d\n", reg_rand_init, i);
!!#   }
!!#   
!!#   IJ_set_rvar (reg_rand_init, "64'hrrrrrrrr rrrrrrrr");
!!#   for (i = 13; i < 32; i++) {
!!#      IJ_printf (th_all, "\tsetx  0x%016llrx, %%r1, %%r%d\n", reg_rand_init, i);
!!#   }
!!# 
!!#   IJ_set_rvar (reg_rand_init, "64'h0000000000000rr0");
!!#   IJ_printf (th_all, "\tsetx  0x%016llrx, %%r1, %%r5\n", reg_rand_init);
!!# 
!!#   IJ_printf (th_all, "\tsetx  0x80, %%r2, %%r1\n");
!!#   IJ_printf (th_all, "\twr  %%r1, %%r0, %%asi\n");
!!# 
!!#   IJ_printf (th_all, "\tta T_CHANGE_HPRIV !To allow ASI writes to D-I caches\n");
!!# 
!!#   for (i = 2; i < 11; i++) {
!!#      if (i == 5) continue;
!!#      IJ_printf (th_all, "\tsetx MAIN_BASE_DATA_VA, %%r1, %%r%d\n", i);
!!#   }
!!# 
!!#   IJ_printf (th_all, "\twr %%r0, 0x4, %%fprs\n");
!!#   IJ_init_fp_regs (th_all, 4);
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
!!# store8: st_fp | store_atomic | st_int_asi | st_ext_asi | store_i
!!# ;
!!# 
!!# inst_type: store_i store_i store_i store_i store_i  store_i  store_i store8
!!# {
!!#      IJ_printf (th_all, "\tset 0x2, %%g1\n");
!!#      IJ_printf (th_all, "\tsubcc %%g1, 0x1, %%g1\n");
!!#      IJ_printf (th_all, ".align 0x20\n");
!!#      IJ_printf (th_0, "thr0_loop_%d:\n",label_cnt);
!!#      IJ_printf (th_1, "thr1_loop_%d:\n",label_cnt);
!!#      IJ_printf (th_2, "thr2_loop_%d:\n",label_cnt);
!!#      IJ_printf (th_3, "thr3_loop_%d:\n",label_cnt);
!!#      i = (random() % 20 + 10)*8;  
!!#      IJ_generate_from_token (i, th_all, ijdefault, tADD_R, tADD_I, tAND_R, tAND_I, tOR_R, tOR_I, NULL); 
!!#      IJ_generate_va (th_all, $1, $2, $3, $4);
!!#      IJ_printf (th_0, "IRF_CE_%d:\n", err_cnt);
!!#      bitnum = random () % 72;
!!#      IJ_printf (th_0, "!$EV error(0,expr(@VA(.MAIN.IRF_CE_%d), 16, 16), 1,IRF,ce,%d,x, x,x,x, x,x,x)\n", err_cnt, bitnum);
!!#      bitnum = random () % 72;
!!#      IJ_printf (th_0, "!$EV error(0,expr(@VA(.MAIN.IRF_CE_%d), 16, 16), 3,IRF,ce,%d,x, x,x,x, x,x,x)\n", err_cnt, bitnum);
!!#      err_cnt++;
!!#      IJ_printf (th_1, "IRF_CE_%d:\n", err_cnt);
!!#      bitnum = random () % 72;
!!#      IJ_printf (th_1, "!$EV error(1,expr(@VA(.MAIN.IRF_CE_%d), 16, 16), 1,IRF,ce,%d,x, x,x,x, x,x,x)\n", err_cnt, bitnum);
!!#      bitnum = random () % 72;
!!#      IJ_printf (th_1, "!$EV error(1,expr(@VA(.MAIN.IRF_CE_%d), 16, 16), 3,IRF,ce,%d,x, x,x,x, x,x,x)\n", err_cnt, bitnum);
!!#      err_cnt++;
!!#      IJ_printf (th_2, "IRF_CE_%d:\n", err_cnt);
!!#      bitnum = random () % 72;
!!#      IJ_printf (th_2, "!$EV error(2,expr(@VA(.MAIN.IRF_CE_%d), 16, 16), 1,IRF,ce,%d,x, x,x,x, x,x,x)\n", err_cnt, bitnum);
!!#      bitnum = random () % 72;
!!#      IJ_printf (th_2, "!$EV error(2,expr(@VA(.MAIN.IRF_CE_%d), 16, 16), 3,IRF,ce,%d,x, x,x,x, x,x,x)\n", err_cnt, bitnum);
!!#      err_cnt++;
!!#      IJ_printf (th_3, "IRF_CE_%d:\n", err_cnt);
!!#      bitnum = random () % 72;
!!#      IJ_printf (th_3, "!$EV error(3,expr(@VA(.MAIN.IRF_CE_%d), 16, 16), 1,IRF,ce,%d,x, x,x,x, x,x,x)\n", err_cnt, bitnum);
!!#      bitnum = random () % 72;
!!#      IJ_printf (th_3, "!$EV error(3,expr(@VA(.MAIN.IRF_CE_%d), 16, 16), 3,IRF,ce,%d,x, x,x,x, x,x,x)\n", err_cnt, bitnum);
!!#      err_cnt++;
!!#      IJ_generate_va (th_all, $5, $6, $7, $8);
!!#      IJ_generate_from_token (2, th_all, ijdefault, tADD_R, tADD_I, tAND_R, tAND_I, tOR_R, tOR_I, NULL); 
!!#      IJ_printf (th_0, "\tbne thr0_loop_%d\n",label_cnt);
!!#      IJ_printf (th_1, "\tbne thr1_loop_%d\n",label_cnt);
!!#      IJ_printf (th_2, "\tbne thr2_loop_%d\n",label_cnt);
!!#      IJ_printf (th_3, "\tbne thr3_loop_%d\n",label_cnt);
!!#      IJ_printf (th_all, "\tsubcc %%g1, 0x1, %%g1\n");
!!#      label_cnt++;
!!# }
!!# ;
!!# 
!!# st_fp: tSTF_R | tSTDF_R
!!# ;
!!# 
!!# store_i: tSTB_I | tSTH_I | tSTW_I | tSTX_I 
!!# ;
!!# 
!!# store_atomic: tCASA_R | tCASXA_R | tLDSTUBA_R | tSWAP_R | tSWAPA_R
!!# ;
!!# 
!!# st_ext_asi: tSTBA_R | tSTHA_R | tSTWA_R | tSTXA_R | tSTDA_R 
!!# ;
!!# 
!!# st_int_asi: d0 tSTXA_R %ropr Ro_int_asi 
!!# {$$ = $2}
!!# ;
!!# 
!!# //Rules for disambiguating the grammar
!!# 
!!# d0: mMETA0
!!# ;
!!# 
!!# alu: tADD_R | tADD_I | tADDcc_R | tADDcc_I | tADDC_R | tADDC_I | tADDCcc_R | tADDCcc_I | tAND_R | tAND_I | tANDcc_R | tANDcc_I | tANDN_R | tANDN_I | tANDNcc_R | tANDNcc_I | tOR_R | tOR_I | tORcc_R | tORcc_I | tORN_R | tORN_I | tORNcc_R | tORNcc_I | tXOR_R | tXOR_I | tXORcc_R | tXORcc_I | tXNOR_R | tXNOR_I | tXNORcc_R | tXNORcc_I | tMOVcc_R | tMOVcc_I | tMOVR_R | tMOVR_I | tSLL_R | tSLL_I | tSRL_R | tSRL_I | tSRA_R | tSRA_I | tSLLX_R | tSLLX_I | tSRLX_R | tSRLX_I | tSRAX_R | tSRAX_I | tSUB_R | tSUB_I | tSUBcc_R | tSUBcc_I | tSUBC_R | tSUBC_I | tSUBCcc_R | tSUBCcc_R | tSUBCcc_I
!!# ;
!!# %%
!!# endtemplate
!! Token Generation Statistics
!! ---------------------------------
!! 
!! Rule   1 (line  129), Count:   100  inst_block           -> inst_type 
!! Rule   2 (line  130), Count:   100  inst_block           -> inst_block inst_type 
!! Rule   3 (line  133), Count:     2  store8               -> st_fp 
!! Rule   4 (line  133), Count:     5  store8               -> store_atomic 
!! Rule   5 (line  133), Count:     3  store8               -> st_int_asi 
!! Rule   7 (line  133), Count:    87  store8               -> store_i 
!! Rule   8 (line  136), Count:   100  inst_type            -> store_i store_i store_i store_i store_i store_i store_i store8 
!! Rule   9 (line  183), Count:     0  st_fp                -> tSTF_R 
!! Rule  10 (line  183), Count:     1  st_fp                -> tSTDF_R 
!! Rule  11 (line  186), Count:    17  store_i              -> tSTB_I 
!! Rule  12 (line  186), Count:    24  store_i              -> tSTH_I 
!! Rule  13 (line  186), Count:    20  store_i              -> tSTW_I 
!! Rule  14 (line  186), Count:    23  store_i              -> tSTX_I 
!! Rule  16 (line  189), Count:     0  store_atomic         -> tCASXA_R 
!! Rule  17 (line  189), Count:     1  store_atomic         -> tLDSTUBA_R 
!! Rule  18 (line  189), Count:     1  store_atomic         -> tSWAP_R 
!! Rule  19 (line  189), Count:     0  store_atomic         -> tSWAPA_R 
!! Rule  25 (line  195), Count:     3  st_int_asi           -> d0 tSTXA_R 
!! Rule  26 (line  201), Count:     1  d0                   -> mMETA0 
!! 
!!   257: Token tADD_R	Count = 0
!!   258: Token tADD_I	Count = 0
!!   259: Token tAND_R	Count = 0
!!   260: Token tAND_I	Count = 0
!!   261: Token tOR_R	Count = 0
!!   262: Token tOR_I	Count = 0
!!   263: Token tSTF_R	Count = 1
!!   264: Token tSTDF_R	Count = 2
!!   265: Token tSTB_I	Count = 18
!!   266: Token tSTH_I	Count = 25
!!   267: Token tSTW_I	Count = 21
!!   268: Token tSTX_I	Count = 24
!!   269: Token tCASA_R	Count = 0
!!   270: Token tCASXA_R	Count = 1
!!   271: Token tLDSTUBA_R	Count = 2
!!   272: Token tSWAP_R	Count = 2
!!   273: Token tSWAPA_R	Count = 1
!!   274: Token tSTBA_R	Count = 0
!!   275: Token tSTHA_R	Count = 0
!!   276: Token tSTWA_R	Count = 0
!!   277: Token tSTXA_R	Count = 2
!!   278: Token tSTDA_R	Count = 0
!!   279: Token mMETA0	Count = 2
!!   280: Token tADDcc_R	Count = 0
!!   281: Token tADDcc_I	Count = 0
!!   282: Token tADDC_R	Count = 0
!!   283: Token tADDC_I	Count = 0
!!   284: Token tADDCcc_R	Count = 0
!!   285: Token tADDCcc_I	Count = 0
!!   286: Token tANDcc_R	Count = 0
!!   287: Token tANDcc_I	Count = 0
!!   288: Token tANDN_R	Count = 0
!!   289: Token tANDN_I	Count = 0
!!   290: Token tANDNcc_R	Count = 0
!!   291: Token tANDNcc_I	Count = 0
!!   292: Token tORcc_R	Count = 0
!!   293: Token tORcc_I	Count = 0
!!   294: Token tORN_R	Count = 0
!!   295: Token tORN_I	Count = 0
!!   296: Token tORNcc_R	Count = 0
!!   297: Token tORNcc_I	Count = 0
!!   298: Token tXOR_R	Count = 0
!!   299: Token tXOR_I	Count = 0
!!   300: Token tXORcc_R	Count = 0
!!   301: Token tXORcc_I	Count = 0
!!   302: Token tXNOR_R	Count = 0
!!   303: Token tXNOR_I	Count = 0
!!   304: Token tXNORcc_R	Count = 0
!!   305: Token tXNORcc_I	Count = 0
!!   306: Token tMOVcc_R	Count = 0
!!   307: Token tMOVcc_I	Count = 0
!!   308: Token tMOVR_R	Count = 0
!!   309: Token tMOVR_I	Count = 0
!!   310: Token tSLL_R	Count = 0
!!   311: Token tSLL_I	Count = 0
!!   312: Token tSRL_R	Count = 0
!!   313: Token tSRL_I	Count = 0
!!   314: Token tSRA_R	Count = 0
!!   315: Token tSRA_I	Count = 0
!!   316: Token tSLLX_R	Count = 0
!!   317: Token tSLLX_I	Count = 0
!!   318: Token tSRLX_R	Count = 0
!!   319: Token tSRLX_I	Count = 0
!!   320: Token tSRAX_R	Count = 0
!!   321: Token tSRAX_I	Count = 0
!!   322: Token tSUB_R	Count = 0
!!   323: Token tSUB_I	Count = 0
!!   324: Token tSUBcc_R	Count = 0
!!   325: Token tSUBcc_I	Count = 0
!!   326: Token tSUBC_R	Count = 0
!!   327: Token tSUBC_I	Count = 0
!!   328: Token tSUBCcc_R	Count = 0
!!   329: Token tSUBCcc_I	Count = 0
!! 
!! 
!! +++ finish +++
#endif

