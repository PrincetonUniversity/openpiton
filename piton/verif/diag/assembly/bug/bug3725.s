// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: bug3725.s
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
   random seed:	207183837
   Jal stb8c.j:	
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
	setx  0x4e475676b004f27e, %r16, %r17
	setx  0x1e283ee9fe868642, %r16, %r18
	setx  0x60c09613db62ec64, %r16, %r19
	setx  0x2fc023bdd63116c4, %r16, %r20
	setx  0xdd82e47adb18b8ed, %r16, %r21
	setx  0xd9dd162035079658, %r16, %r22
	setx  0x87d797030f637121, %r16, %r23
	setx  0x4cbc08141297cd83, %r16, %r24
	setx  0x70d732f3652d2a6a, %r16, %r25
	setx  0x61a2b5a3b3f73b4c, %r16, %r26
	setx  0xfa8a27db3c67f830, %r16, %r27
	setx  0x6d779ba5a3a57c7e, %r16, %r28
	setx  0x7c688afcca3f002e, %r16, %r29
	setx  0x032f8deb2241b0cc, %r16, %r30
	setx  0xf294da190fe89e77, %r16, %r31
	setx  0x0000000000000ad0, %r16, %r9
	setx  0x00000000000008a0, %r16, %r10
	setx  0x00000000000007e0, %r16, %r11
	setx  0x00000000000001b0, %r16, %r12
	setx  0x0000000000000660, %r16, %r13
	setx  0x0000000000000a20, %r16, %r14
	setx  0x0000000000000c40, %r16, %r15
	setx MAIN_BASE_DATA_VA, %r16, %r3
	setx MAIN_BASE_DATA_VA, %r16, %r4
	setx MAIN_BASE_DATA_VA, %r16, %r5
	setx MAIN_BASE_DATA_VA, %r16, %r6
	setx MAIN_BASE_DATA_VA, %r16, %r7
	setx MAIN_BASE_DATA_VA, %r16, %r8
	setx  0x0000000000000241, %r16, %r2
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
!Generating store_chunk_1
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr0_loop_0:
	.word 0xac00e688  ! 6: ADD_I	add 	%r3, 0x0688, %r22
	.word 0xbc0166f1  ! 6: ADD_I	add 	%r5, 0x06f1, %r30
	.word 0xa2122a76  ! 6: OR_I	or 	%r8, 0x0a76, %r17
	.word 0xb211e539  ! 6: OR_I	or 	%r7, 0x0539, %r25
	.word 0xac122f9a  ! 6: OR_I	or 	%r8, 0x0f9a, %r22
	.word 0xa808c00f  ! 6: AND_R	and 	%r3, %r15, %r20
	.word 0xaa01c00a  ! 6: ADD_R	add 	%r7, %r10, %r21
	.word 0xb4092fd4  ! 6: AND_I	and 	%r4, 0x0fd4, %r26
	.word 0xbe00c00e  ! 6: ADD_R	add 	%r3, %r14, %r31
	.word 0xa60222cc  ! 6: ADD_I	add 	%r8, 0x02cc, %r19
	.word 0xbe08ef40  ! 6: AND_I	and 	%r3, 0x0f40, %r31
	.word 0xa211c00e  ! 6: OR_R	or 	%r7, %r14, %r17
	.word 0xa209400a  ! 6: AND_R	and 	%r5, %r10, %r17
	.word 0xa410c00e  ! 6: OR_R	or 	%r3, %r14, %r18
	.word 0xb409000c  ! 6: AND_R	and 	%r4, %r12, %r26
	.word 0xa209a00b  ! 6: AND_I	and 	%r6, 0x000b, %r17
	.word 0xaa11000c  ! 6: OR_R	or 	%r4, %r12, %r21
	.word 0xac09800c  ! 6: AND_R	and 	%r6, %r12, %r22
	.word 0xbc01000d  ! 6: ADD_R	add 	%r4, %r13, %r30
	.word 0xac11a75c  ! 6: OR_I	or 	%r6, 0x075c, %r22
	.word 0xba09e23f  ! 6: AND_I	and 	%r7, 0x023f, %r29
	.word 0xaa0969b9  ! 6: AND_I	and 	%r5, 0x09b9, %r21
	.word 0xb409c00f  ! 6: AND_R	and 	%r7, %r15, %r26
	.word 0xa6122719  ! 6: OR_I	or 	%r8, 0x0719, %r19
	.word 0xaa014009  ! 6: ADD_R	add 	%r5, %r9, %r21
	.word 0xa201400f  ! 6: ADD_R	add 	%r5, %r15, %r17
	.word 0xa401000e  ! 6: ADD_R	add 	%r4, %r14, %r18
	.word 0xa408c00f  ! 6: AND_R	and 	%r3, %r15, %r18
	.word 0xb001000a  ! 6: ADD_R	add 	%r4, %r10, %r24
	.word 0xb6092e63  ! 6: AND_I	and 	%r4, 0x0e63, %r27
	.word 0xb610c009  ! 6: OR_R	or 	%r3, %r9, %r27
	.word 0xae08c00c  ! 6: AND_R	and 	%r3, %r12, %r23
	.word 0xac016c3f  ! 6: ADD_I	add 	%r5, 0x0c3f, %r22
	.word 0xa40a000a  ! 6: AND_R	and 	%r8, %r10, %r18
	.word 0xbe11c00c  ! 6: OR_R	or 	%r7, %r12, %r31
	.word 0xaa092a08  ! 6: AND_I	and 	%r4, 0x0a08, %r21
	.word 0xb00a22ce  ! 6: AND_I	and 	%r8, 0x02ce, %r24
	.word 0xbe09000d  ! 6: AND_R	and 	%r4, %r13, %r31
	.word 0xa412266d  ! 6: OR_I	or 	%r8, 0x066d, %r18
	.word 0xac08e679  ! 6: AND_I	and 	%r3, 0x0679, %r22
	.word 0xb612000c  ! 6: OR_R	or 	%r8, %r12, %r27
	.word 0xaa10ee68  ! 6: OR_I	or 	%r3, 0x0e68, %r21
	.word 0xa61120c6  ! 6: OR_I	or 	%r4, 0x00c6, %r19
	.word 0xa602000c  ! 6: ADD_R	add 	%r8, %r12, %r19
	.word 0xbc08e7d8  ! 6: AND_I	and 	%r3, 0x07d8, %r30
	.word 0xa809c00b  ! 6: AND_R	and 	%r7, %r11, %r20
	.word 0xb411ebfb  ! 6: OR_I	or 	%r7, 0x0bfb, %r26
	.word 0xbc020009  ! 6: ADD_R	add 	%r8, %r9, %r30
	.word 0xb409c00f  ! 6: AND_R	and 	%r7, %r15, %r26
	.word 0xae11ed76  ! 6: OR_I	or 	%r7, 0x0d76, %r23
	.word 0xbe112296  ! 6: OR_I	or 	%r4, 0x0296, %r31
	.word 0xb802000b  ! 6: ADD_R	add 	%r8, %r11, %r28
	.word 0xa4022a50  ! 6: ADD_I	add 	%r8, 0x0a50, %r18
	.word 0xa810e6bf  ! 6: OR_I	or 	%r3, 0x06bf, %r20
	.word 0xbc11000e  ! 6: OR_R	or 	%r4, %r14, %r30
	.word 0xb609a1d2  ! 6: AND_I	and 	%r6, 0x01d2, %r27
	.word 0xb810e5ef  ! 6: OR_I	or 	%r3, 0x05ef, %r28
	.word 0xbe0164ea  ! 6: ADD_I	add 	%r5, 0x04ea, %r31
	.word 0xb011c00d  ! 6: OR_R	or 	%r7, %r13, %r24
	.word 0xbe11c00b  ! 6: OR_R	or 	%r7, %r11, %r31
	.word 0xac10ea82  ! 6: OR_I	or 	%r3, 0x0a82, %r22
	.word 0xb8016bf9  ! 6: ADD_I	add 	%r5, 0x0bf9, %r28
	.word 0xbc10e01f  ! 6: OR_I	or 	%r3, 0x001f, %r30
	.word 0xa609aad5  ! 6: AND_I	and 	%r6, 0x0ad5, %r19
	.word 0xae11a2d2  ! 6: OR_I	or 	%r6, 0x02d2, %r23
	.word 0xae09221d  ! 6: AND_I	and 	%r4, 0x021d, %r23
	.word 0xa811c00c  ! 6: OR_R	or 	%r7, %r12, %r20
	.word 0xb812000d  ! 6: OR_R	or 	%r8, %r13, %r28
	.word 0xbc08e48a  ! 6: AND_I	and 	%r3, 0x048a, %r30
	.word 0xa801e6f7  ! 6: ADD_I	add 	%r7, 0x06f7, %r20
	.word 0xbc01400b  ! 6: ADD_R	add 	%r5, %r11, %r30
	.word 0xb600e511  ! 6: ADD_I	add 	%r3, 0x0511, %r27
	.word 0xa200e388  ! 6: ADD_I	add 	%r3, 0x0388, %r17
	.word 0xae01eae3  ! 6: ADD_I	add 	%r7, 0x0ae3, %r23
	.word 0xba09c00e  ! 6: AND_R	and 	%r7, %r14, %r29
	.word 0xbc112a28  ! 6: OR_I	or 	%r4, 0x0a28, %r30
	.word 0xb001800b  ! 6: ADD_R	add 	%r6, %r11, %r24
	.word 0xa801000b  ! 6: ADD_R	add 	%r4, %r11, %r20
	.word 0xb811400f  ! 6: OR_R	or 	%r5, %r15, %r28
	.word 0xba08c00f  ! 6: AND_R	and 	%r3, %r15, %r29
	.word 0xbe11c00f  ! 6: OR_R	or 	%r7, %r15, %r31
	.word 0xbe012085  ! 6: ADD_I	add 	%r4, 0x0085, %r31
	.word 0xbe1168be  ! 6: OR_I	or 	%r5, 0x08be, %r31
	.word 0xb611e6ba  ! 6: OR_I	or 	%r7, 0x06ba, %r27
	.word 0xb602000e  ! 6: ADD_R	add 	%r8, %r14, %r27
	.word 0xb809ef84  ! 6: AND_I	and 	%r7, 0x0f84, %r28
	.word 0xae09e7c9  ! 6: AND_I	and 	%r7, 0x07c9, %r23
	.word 0xbe11e3b1  ! 6: OR_I	or 	%r7, 0x03b1, %r31
	.word 0xa411a698  ! 6: OR_I	or 	%r6, 0x0698, %r18
	.word 0xb209ee04  ! 6: AND_I	and 	%r7, 0x0e04, %r25
	.word 0xac096f97  ! 6: AND_I	and 	%r5, 0x0f97, %r22
	.word 0xbe01400c  ! 6: ADD_R	add 	%r5, %r12, %r31
	.word 0xb009800f  ! 6: AND_R	and 	%r6, %r15, %r24
	.word 0xa610c00b  ! 6: OR_R	or 	%r3, %r11, %r19
	.word 0xb609000f  ! 6: AND_R	and 	%r4, %r15, %r27
	.word 0xa411ae82  ! 6: OR_I	or 	%r6, 0x0e82, %r18
	.word 0xa60968b2  ! 6: AND_I	and 	%r5, 0x08b2, %r19
	.word 0xb8116de8  ! 6: OR_I	or 	%r5, 0x0de8, %r28
	.word 0xb000c009  ! 6: ADD_R	add 	%r3, %r9, %r24
	.word 0xbe09c00c  ! 6: AND_R	and 	%r7, %r12, %r31
	.word 0xb409000b  ! 6: AND_R	and 	%r4, %r11, %r26
	.word 0xac11e7b4  ! 6: OR_I	or 	%r7, 0x07b4, %r22
	.word 0xa801800c  ! 6: ADD_R	add 	%r6, %r12, %r20
	.word 0xa812000d  ! 6: OR_R	or 	%r8, %r13, %r20
	.word 0xaa10e485  ! 6: OR_I	or 	%r3, 0x0485, %r21
	.word 0xaa11689a  ! 6: OR_I	or 	%r5, 0x089a, %r21
	.word 0xbe08e98e  ! 6: AND_I	and 	%r3, 0x098e, %r31
	.word 0xa401800f  ! 6: ADD_R	add 	%r6, %r15, %r18
	.word 0xbc09800a  ! 6: AND_R	and 	%r6, %r10, %r30
	.word 0xac12000f  ! 6: OR_R	or 	%r8, %r15, %r22
	.word 0xba122edd  ! 6: OR_I	or 	%r8, 0x0edd, %r29
	.word 0xb2016374  ! 6: ADD_I	add 	%r5, 0x0374, %r25
	.word 0xb801ef6c  ! 6: ADD_I	add 	%r7, 0x0f6c, %r28
	.word 0xb010e53c  ! 6: OR_I	or 	%r3, 0x053c, %r24
	.word 0xa602000d  ! 6: ADD_R	add 	%r8, %r13, %r19
	.word 0xba0a26de  ! 6: AND_I	and 	%r8, 0x06de, %r29
	.word 0xa8098009  ! 6: AND_R	and 	%r6, %r9, %r20
	.word 0xa209800d  ! 6: AND_R	and 	%r6, %r13, %r17
	.word 0xba01400f  ! 6: ADD_R	add 	%r5, %r15, %r29
	.word 0xa609400d  ! 6: AND_R	and 	%r5, %r13, %r19
	.word 0xa211000d  ! 6: OR_R	or 	%r4, %r13, %r17
	.word 0xa6112ebd  ! 6: OR_I	or 	%r4, 0x0ebd, %r19
	.word 0xb611000c  ! 6: OR_R	or 	%r4, %r12, %r27
	.word 0xb009e4ea  ! 6: AND_I	and 	%r7, 0x04ea, %r24
	.word 0xa801e2b8  ! 6: ADD_I	add 	%r7, 0x02b8, %r20
	.word 0xa211400b  ! 6: OR_R	or 	%r5, %r11, %r17
	.word 0xbe016f74  ! 6: ADD_I	add 	%r5, 0x0f74, %r31
	.word 0xea32212e  ! 6: STH_I	sth	%r21, [%r8 + 0x012e]
	.word 0xf8296a21  ! 6: STB_I	stb	%r28, [%r5 + 0x0a21]
	.word 0xe2716f20  ! 6: STX_I	stx	%r17, [%r5 + 0x0f20]
	.word 0xfe29afd9  ! 6: STB_I	stb	%r31, [%r6 + 0x0fd9]
	.word 0xec31e626  ! 6: STH_I	sth	%r22, [%r7 + 0x0626]
thr0_irf_ce_0:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_0), 16, 16),2,IRF,ce,43,x, x,x,x, x,x,x)
	.word 0xec29eca7  ! 9: STB_I	stb	%r22, [%r7 + 0x0ca7]
!Illinst: trpm_alu
	.word 0xb3297d21  ! 11: SLLX_I	sllx	%r5, 0x0021, %r25
	.word 0xfc29e0bb  ! 12: STB_I	stb	%r30, [%r7 + 0x00bb]
	.word 0xc0f008e2  ! 14: STXA_R	stxa	%r0, [%r0 + %r2] 0x47
thr0_ic_err_0:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_0), 16, 16),4,IC_DATA,IR,3,x)
	.word 0xe8c9d00c  ! 17: LDSBA_R	ldsba	[%r7, %r12] 0x80, %r20
	.word 0xa408e7c2  ! 17: AND_I	and 	%r3, 0x07c2, %r18
	.word 0xb210c00b  ! 17: OR_R	or 	%r3, %r11, %r25
	.word 0xb208c009  ! 17: AND_R	and 	%r3, %r9, %r25
	bne thr0_loop_0
	subcc %g1, 0x1, %g1
!Generating store_chunk_3
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr0_loop_1:
	.word 0xb801800f  ! 26: ADD_R	add 	%r6, %r15, %r28
	.word 0xbc10c00d  ! 26: OR_R	or 	%r3, %r13, %r30
	.word 0xb012000c  ! 26: OR_R	or 	%r8, %r12, %r24
	.word 0xa611a652  ! 26: OR_I	or 	%r6, 0x0652, %r19
	.word 0xaa0a2e59  ! 26: AND_I	and 	%r8, 0x0e59, %r21
	.word 0xa2012038  ! 26: ADD_I	add 	%r4, 0x0038, %r17
	.word 0xac09e6ff  ! 26: AND_I	and 	%r7, 0x06ff, %r22
	.word 0xba0a000b  ! 26: AND_R	and 	%r8, %r11, %r29
	.word 0xa81164e8  ! 26: OR_I	or 	%r5, 0x04e8, %r20
	.word 0xa20121ca  ! 26: ADD_I	add 	%r4, 0x01ca, %r17
	.word 0xa60a27d9  ! 26: AND_I	and 	%r8, 0x07d9, %r19
	.word 0xa409e626  ! 26: AND_I	and 	%r7, 0x0626, %r18
	.word 0xa409400c  ! 26: AND_R	and 	%r5, %r12, %r18
	.word 0xa6012f50  ! 26: ADD_I	add 	%r4, 0x0f50, %r19
	.word 0xb609000d  ! 26: AND_R	and 	%r4, %r13, %r27
	.word 0xb809400e  ! 26: AND_R	and 	%r5, %r14, %r28
	.word 0xa800c00f  ! 26: ADD_R	add 	%r3, %r15, %r20
	.word 0xa80a2a5f  ! 26: AND_I	and 	%r8, 0x0a5f, %r20
	.word 0xa608c00a  ! 26: AND_R	and 	%r3, %r10, %r19
	.word 0xb801800e  ! 26: ADD_R	add 	%r6, %r14, %r28
	.word 0xba0a2dfe  ! 26: AND_I	and 	%r8, 0x0dfe, %r29
	.word 0xba09a761  ! 26: AND_I	and 	%r6, 0x0761, %r29
	.word 0xa211800b  ! 26: OR_R	or 	%r6, %r11, %r17
	.word 0xac01e7a8  ! 26: ADD_I	add 	%r7, 0x07a8, %r22
	.word 0xb810e9de  ! 26: OR_I	or 	%r3, 0x09de, %r28
	.word 0xba016ec9  ! 26: ADD_I	add 	%r5, 0x0ec9, %r29
	.word 0xb401a2a9  ! 26: ADD_I	add 	%r6, 0x02a9, %r26
	.word 0xb209a932  ! 26: AND_I	and 	%r6, 0x0932, %r25
	.word 0xb402000c  ! 26: ADD_R	add 	%r8, %r12, %r26
	.word 0xa209abe2  ! 26: AND_I	and 	%r6, 0x0be2, %r17
	.word 0xbe08e452  ! 26: AND_I	and 	%r3, 0x0452, %r31
	.word 0xbe122968  ! 26: OR_I	or 	%r8, 0x0968, %r31
	.word 0xba09eff6  ! 26: AND_I	and 	%r7, 0x0ff6, %r29
	.word 0xae08e0bb  ! 26: AND_I	and 	%r3, 0x00bb, %r23
	.word 0xbe012f76  ! 26: ADD_I	add 	%r4, 0x0f76, %r31
	.word 0xa2116a21  ! 26: OR_I	or 	%r5, 0x0a21, %r17
	.word 0xa8022b29  ! 26: ADD_I	add 	%r8, 0x0b29, %r20
	.word 0xa2012612  ! 26: ADD_I	add 	%r4, 0x0612, %r17
	.word 0xb4112d6d  ! 26: OR_I	or 	%r4, 0x0d6d, %r26
	.word 0xae0a278f  ! 26: AND_I	and 	%r8, 0x078f, %r23
	.word 0xa611af1b  ! 26: OR_I	or 	%r6, 0x0f1b, %r19
	.word 0xa801c00d  ! 26: ADD_R	add 	%r7, %r13, %r20
	.word 0xb80962b0  ! 26: AND_I	and 	%r5, 0x02b0, %r28
	.word 0xa600e883  ! 26: ADD_I	add 	%r3, 0x0883, %r19
	.word 0xa20a2918  ! 26: AND_I	and 	%r8, 0x0918, %r17
	.word 0xa611a50c  ! 26: OR_I	or 	%r6, 0x050c, %r19
	.word 0xa601000f  ! 26: ADD_R	add 	%r4, %r15, %r19
	.word 0xba020009  ! 26: ADD_R	add 	%r8, %r9, %r29
	.word 0xa200ea46  ! 26: ADD_I	add 	%r3, 0x0a46, %r17
	.word 0xae112c7c  ! 26: OR_I	or 	%r4, 0x0c7c, %r23
	.word 0xb8022212  ! 26: ADD_I	add 	%r8, 0x0212, %r28
	.word 0xbc016a58  ! 26: ADD_I	add 	%r5, 0x0a58, %r30
	.word 0xb008eb95  ! 26: AND_I	and 	%r3, 0x0b95, %r24
	.word 0xb009000f  ! 26: AND_R	and 	%r4, %r15, %r24
	.word 0xae00e71c  ! 26: ADD_I	add 	%r3, 0x071c, %r23
	.word 0xba11000e  ! 26: OR_R	or 	%r4, %r14, %r29
	.word 0xa209e831  ! 26: AND_I	and 	%r7, 0x0831, %r17
	.word 0xbe00c00a  ! 26: ADD_R	add 	%r3, %r10, %r31
	.word 0xaa08e971  ! 26: AND_I	and 	%r3, 0x0971, %r21
	.word 0xa612000d  ! 26: OR_R	or 	%r8, %r13, %r19
	.word 0xaa11400d  ! 26: OR_R	or 	%r5, %r13, %r21
	.word 0xb211c00a  ! 26: OR_R	or 	%r7, %r10, %r25
	.word 0xb401e342  ! 26: ADD_I	add 	%r7, 0x0342, %r26
	.word 0xa401e3d7  ! 26: ADD_I	add 	%r7, 0x03d7, %r18
	.word 0xb211a818  ! 26: OR_I	or 	%r6, 0x0818, %r25
	.word 0xbe11c00a  ! 26: OR_R	or 	%r7, %r10, %r31
	.word 0xb002238f  ! 26: ADD_I	add 	%r8, 0x038f, %r24
	.word 0xb201000b  ! 26: ADD_R	add 	%r4, %r11, %r25
	.word 0xa2122193  ! 26: OR_I	or 	%r8, 0x0193, %r17
	.word 0xbc02000b  ! 26: ADD_R	add 	%r8, %r11, %r30
	.word 0xa201000b  ! 26: ADD_R	add 	%r4, %r11, %r17
	.word 0xae01ae87  ! 26: ADD_I	add 	%r6, 0x0e87, %r23
	.word 0xa600c00e  ! 26: ADD_R	add 	%r3, %r14, %r19
	.word 0xa602000d  ! 26: ADD_R	add 	%r8, %r13, %r19
	.word 0xa2122609  ! 26: OR_I	or 	%r8, 0x0609, %r17
	.word 0xa80a2fea  ! 26: AND_I	and 	%r8, 0x0fea, %r20
	.word 0xb611eb3e  ! 26: OR_I	or 	%r7, 0x0b3e, %r27
	.word 0xaa11800e  ! 26: OR_R	or 	%r6, %r14, %r21
	.word 0xbc08c00b  ! 26: AND_R	and 	%r3, %r11, %r30
	.word 0xb600c00b  ! 26: ADD_R	add 	%r3, %r11, %r27
	.word 0xa8122ce3  ! 26: OR_I	or 	%r8, 0x0ce3, %r20
	.word 0xb011ef46  ! 26: OR_I	or 	%r7, 0x0f46, %r24
	.word 0xbc01400e  ! 26: ADD_R	add 	%r5, %r14, %r30
	.word 0xb21221ed  ! 26: OR_I	or 	%r8, 0x01ed, %r25
	.word 0xa811adc6  ! 26: OR_I	or 	%r6, 0x0dc6, %r20
	.word 0xbe12000f  ! 26: OR_R	or 	%r8, %r15, %r31
	.word 0xa209800a  ! 26: AND_R	and 	%r6, %r10, %r17
	.word 0xbe11c00f  ! 26: OR_R	or 	%r7, %r15, %r31
	.word 0xb60a28e5  ! 26: AND_I	and 	%r8, 0x08e5, %r27
	.word 0xbe01c00e  ! 26: ADD_R	add 	%r7, %r14, %r31
	.word 0xae01400a  ! 26: ADD_R	add 	%r5, %r10, %r23
	.word 0xb402000d  ! 26: ADD_R	add 	%r8, %r13, %r26
	.word 0xac0a2acf  ! 26: AND_I	and 	%r8, 0x0acf, %r22
	.word 0xbe10e630  ! 26: OR_I	or 	%r3, 0x0630, %r31
	.word 0xba022a09  ! 26: ADD_I	add 	%r8, 0x0a09, %r29
	.word 0xa411000b  ! 26: OR_R	or 	%r4, %r11, %r18
	.word 0xb210c00f  ! 26: OR_R	or 	%r3, %r15, %r25
	.word 0xb200c00c  ! 26: ADD_R	add 	%r3, %r12, %r25
	.word 0xa610c00e  ! 26: OR_R	or 	%r3, %r14, %r19
	.word 0xa8116594  ! 26: OR_I	or 	%r5, 0x0594, %r20
	.word 0xb401e43e  ! 26: ADD_I	add 	%r7, 0x043e, %r26
	.word 0xbe11e866  ! 26: OR_I	or 	%r7, 0x0866, %r31
	.word 0xa609c00e  ! 26: AND_R	and 	%r7, %r14, %r19
	.word 0xa608ea32  ! 26: AND_I	and 	%r3, 0x0a32, %r19
	.word 0xba09c009  ! 26: AND_R	and 	%r7, %r9, %r29
	.word 0xb201c00c  ! 26: ADD_R	add 	%r7, %r12, %r25
	.word 0xbc01800b  ! 26: ADD_R	add 	%r6, %r11, %r30
	.word 0xa601000e  ! 26: ADD_R	add 	%r4, %r14, %r19
	.word 0xb001a7c0  ! 26: ADD_I	add 	%r6, 0x07c0, %r24
	.word 0xb001c00c  ! 26: ADD_R	add 	%r7, %r12, %r24
	.word 0xae09ea09  ! 26: AND_I	and 	%r7, 0x0a09, %r23
	.word 0xb601c00e  ! 26: ADD_R	add 	%r7, %r14, %r27
	.word 0xbc10e671  ! 26: OR_I	or 	%r3, 0x0671, %r30
	.word 0xbc11000b  ! 26: OR_R	or 	%r4, %r11, %r30
	.word 0xb611eb4d  ! 26: OR_I	or 	%r7, 0x0b4d, %r27
	.word 0xb201800b  ! 26: ADD_R	add 	%r6, %r11, %r25
	.word 0xb809ea72  ! 26: AND_I	and 	%r7, 0x0a72, %r28
	.word 0xaa012511  ! 26: ADD_I	add 	%r4, 0x0511, %r21
	.word 0xa611800e  ! 26: OR_R	or 	%r6, %r14, %r19
	.word 0xa4092158  ! 26: AND_I	and 	%r4, 0x0158, %r18
	.word 0xba09800b  ! 26: AND_R	and 	%r6, %r11, %r29
	.word 0xb810c00e  ! 26: OR_R	or 	%r3, %r14, %r28
	.word 0xa400c00d  ! 26: ADD_R	add 	%r3, %r13, %r18
	.word 0xb601000f  ! 26: ADD_R	add 	%r4, %r15, %r27
	.word 0xa611688b  ! 26: OR_I	or 	%r5, 0x088b, %r19
	.word 0xb409ebc6  ! 26: AND_I	and 	%r7, 0x0bc6, %r26
	.word 0xa812000a  ! 26: OR_R	or 	%r8, %r10, %r20
	.word 0xaa01400a  ! 26: ADD_R	add 	%r5, %r10, %r21
	.word 0xbe12000d  ! 26: OR_R	or 	%r8, %r13, %r31
	.word 0xac01c00a  ! 26: ADD_R	add 	%r7, %r10, %r22
	.word 0xa401aa7e  ! 26: ADD_I	add 	%r6, 0x0a7e, %r18
	.word 0xa8122eaa  ! 26: OR_I	or 	%r8, 0x0eaa, %r20
	.word 0xb4016281  ! 26: ADD_I	add 	%r5, 0x0281, %r26
	.word 0xba08c00b  ! 26: AND_R	and 	%r3, %r11, %r29
	.word 0xb609000d  ! 26: AND_R	and 	%r4, %r13, %r27
	.word 0xb409a292  ! 26: AND_I	and 	%r6, 0x0292, %r26
	.word 0xae10eb29  ! 26: OR_I	or 	%r3, 0x0b29, %r23
	.word 0xbe09800c  ! 26: AND_R	and 	%r6, %r12, %r31
	.word 0xac12295b  ! 26: OR_I	or 	%r8, 0x095b, %r22
	.word 0xaa00c00f  ! 26: ADD_R	add 	%r3, %r15, %r21
	.word 0xa809800d  ! 26: AND_R	and 	%r6, %r13, %r20
	.word 0xb400ebfc  ! 26: ADD_I	add 	%r3, 0x0bfc, %r26
	.word 0xae00e023  ! 26: ADD_I	add 	%r3, 0x0023, %r23
	.word 0xa801800e  ! 26: ADD_R	add 	%r6, %r14, %r20
	.word 0xa4112dd0  ! 26: OR_I	or 	%r4, 0x0dd0, %r18
	.word 0xaa11000d  ! 26: OR_R	or 	%r4, %r13, %r21
	.word 0xa808e743  ! 26: AND_I	and 	%r3, 0x0743, %r20
	.word 0xb411800f  ! 26: OR_R	or 	%r6, %r15, %r26
	.word 0xb009283f  ! 26: AND_I	and 	%r4, 0x083f, %r24
	.word 0xae00c00f  ! 26: ADD_R	add 	%r3, %r15, %r23
	.word 0xa609400f  ! 26: AND_R	and 	%r5, %r15, %r19
	.word 0xba01400c  ! 26: ADD_R	add 	%r5, %r12, %r29
	.word 0xa401400f  ! 26: ADD_R	add 	%r5, %r15, %r18
	.word 0xb61229e8  ! 26: OR_I	or 	%r8, 0x09e8, %r27
	.word 0xa209000d  ! 26: AND_R	and 	%r4, %r13, %r17
	.word 0xb200e98d  ! 26: ADD_I	add 	%r3, 0x098d, %r25
	.word 0xb201000d  ! 26: ADD_R	add 	%r4, %r13, %r25
	.word 0xa209a110  ! 26: AND_I	and 	%r6, 0x0110, %r17
	.word 0xbe11a922  ! 26: OR_I	or 	%r6, 0x0922, %r31
	.word 0xbc12000d  ! 26: OR_R	or 	%r8, %r13, %r30
	.word 0xba09a7f5  ! 26: AND_I	and 	%r6, 0x07f5, %r29
	.word 0xac11c00b  ! 26: OR_R	or 	%r7, %r11, %r22
	.word 0xb211000e  ! 26: OR_R	or 	%r4, %r14, %r25
	.word 0xaa09400a  ! 26: AND_R	and 	%r5, %r10, %r21
	.word 0xac08e3a6  ! 26: AND_I	and 	%r3, 0x03a6, %r22
	.word 0xa6096eb2  ! 26: AND_I	and 	%r5, 0x0eb2, %r19
	.word 0xae01000f  ! 26: ADD_R	add 	%r4, %r15, %r23
	.word 0xb409ea3b  ! 26: AND_I	and 	%r7, 0x0a3b, %r26
	.word 0xa6096b20  ! 26: AND_I	and 	%r5, 0x0b20, %r19
	.word 0xb411a955  ! 26: OR_I	or 	%r6, 0x0955, %r26
	.word 0xb8022bcb  ! 26: ADD_I	add 	%r8, 0x0bcb, %r28
	.word 0xac01c00c  ! 26: ADD_R	add 	%r7, %r12, %r22
	.word 0xae09000c  ! 26: AND_R	and 	%r4, %r12, %r23
	.word 0xb411000d  ! 26: OR_R	or 	%r4, %r13, %r26
	.word 0xb609800b  ! 26: AND_R	and 	%r6, %r11, %r27
	.word 0xf029e2c4  ! 26: STB_I	stb	%r24, [%r7 + 0x02c4]
	.word 0xf621a08c  ! 26: STW_I	stw	%r27, [%r6 + 0x008c]
	.word 0xf2222288  ! 26: STW_I	stw	%r25, [%r8 + 0x0288]
	.word 0xf420ec10  ! 26: STW_I	stw	%r26, [%r3 + 0x0c10]
	.word 0xfe2963f0  ! 26: STB_I	stb	%r31, [%r5 + 0x03f0]
	.word 0xf828e48b  ! 26: STB_I	stb	%r28, [%r3 + 0x048b]
	.word 0xfa21e6fc  ! 26: STW_I	stw	%r29, [%r7 + 0x06fc]
	.word 0xfa49c009  ! 26: LDSB_R	ldsb	[%r7 + %r9], %r29
	.word 0xc0f00982  ! 28: STXA_R	stxa	%r0, [%r0 + %r2] 0x4c
thr0_ic_err_1:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_1), 16, 16),2,IC_DATA,IR,10,x)
	setx  0x0000000000000170, %r16, %r14
	setx  0x0000000000000303, %r16, %r2
	.word 0xa212000c  ! 31: OR_R	or 	%r8, %r12, %r17
	.word 0xb412000f  ! 31: OR_R	or 	%r8, %r15, %r26
	setx  0x0000000000000d70, %r16, %r9
	bne thr0_loop_1
	subcc %g1, 0x1, %g1
!Generating store_chunk_1
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr0_loop_2:
	.word 0xa410efa6  ! 37: OR_I	or 	%r3, 0x0fa6, %r18
	.word 0xb20a000c  ! 37: AND_R	and 	%r8, %r12, %r25
	.word 0xb201e781  ! 37: ADD_I	add 	%r7, 0x0781, %r25
	.word 0xb601000a  ! 37: ADD_R	add 	%r4, %r10, %r27
	.word 0xb001400e  ! 37: ADD_R	add 	%r5, %r14, %r24
	.word 0xb6014009  ! 37: ADD_R	add 	%r5, %r9, %r27
	.word 0xae0929c1  ! 37: AND_I	and 	%r4, 0x09c1, %r23
	.word 0xaa09aaea  ! 37: AND_I	and 	%r6, 0x0aea, %r21
	.word 0xae01800f  ! 37: ADD_R	add 	%r6, %r15, %r23
	.word 0xbc01a209  ! 37: ADD_I	add 	%r6, 0x0209, %r30
	.word 0xbe0a0009  ! 37: AND_R	and 	%r8, %r9, %r31
	.word 0xb801400e  ! 37: ADD_R	add 	%r5, %r14, %r28
	.word 0xae016d55  ! 37: ADD_I	add 	%r5, 0x0d55, %r23
	.word 0xa409800e  ! 37: AND_R	and 	%r6, %r14, %r18
	.word 0xac10e31e  ! 37: OR_I	or 	%r3, 0x031e, %r22
	.word 0xb608c009  ! 37: AND_R	and 	%r3, %r9, %r27
	.word 0xae09a8ec  ! 37: AND_I	and 	%r6, 0x08ec, %r23
	.word 0xb401800c  ! 37: ADD_R	add 	%r6, %r12, %r26
	.word 0xbc11235e  ! 37: OR_I	or 	%r4, 0x035e, %r30
	.word 0xb411800c  ! 37: OR_R	or 	%r6, %r12, %r26
	.word 0xb000c009  ! 37: ADD_R	add 	%r3, %r9, %r24
	.word 0xba1167c0  ! 37: OR_I	or 	%r5, 0x07c0, %r29
	.word 0xbc0a000f  ! 37: AND_R	and 	%r8, %r15, %r30
	.word 0xa412232f  ! 37: OR_I	or 	%r8, 0x032f, %r18
	.word 0xae01c00c  ! 37: ADD_R	add 	%r7, %r12, %r23
	.word 0xa80a2d6a  ! 37: AND_I	and 	%r8, 0x0d6a, %r20
	.word 0xb401400f  ! 37: ADD_R	add 	%r5, %r15, %r26
	.word 0xb80168c9  ! 37: ADD_I	add 	%r5, 0x08c9, %r28
	.word 0xa608c00a  ! 37: AND_R	and 	%r3, %r10, %r19
	.word 0xb4020009  ! 37: ADD_R	add 	%r8, %r9, %r26
	.word 0xa202000d  ! 37: ADD_R	add 	%r8, %r13, %r17
	.word 0xba00c009  ! 37: ADD_R	add 	%r3, %r9, %r29
	.word 0xb608c00f  ! 37: AND_R	and 	%r3, %r15, %r27
	.word 0xae01c009  ! 37: ADD_R	add 	%r7, %r9, %r23
	.word 0xaa092472  ! 37: AND_I	and 	%r4, 0x0472, %r21
	.word 0xae01abad  ! 37: ADD_I	add 	%r6, 0x0bad, %r23
	.word 0xbc09000b  ! 37: AND_R	and 	%r4, %r11, %r30
	.word 0xbe10c00b  ! 37: OR_R	or 	%r3, %r11, %r31
	.word 0xaa11c00c  ! 37: OR_R	or 	%r7, %r12, %r21
	.word 0xb801000b  ! 37: ADD_R	add 	%r4, %r11, %r28
	.word 0xaa11ea60  ! 37: OR_I	or 	%r7, 0x0a60, %r21
	.word 0xb209a1a0  ! 37: AND_I	and 	%r6, 0x01a0, %r25
	.word 0xa2112b1e  ! 37: OR_I	or 	%r4, 0x0b1e, %r17
	.word 0xb209800f  ! 37: AND_R	and 	%r6, %r15, %r25
	.word 0xb611800a  ! 37: OR_R	or 	%r6, %r10, %r27
	.word 0xb6112c19  ! 37: OR_I	or 	%r4, 0x0c19, %r27
	.word 0xb6012712  ! 37: ADD_I	add 	%r4, 0x0712, %r27
	.word 0xaa012d9c  ! 37: ADD_I	add 	%r4, 0x0d9c, %r21
	.word 0xbe08c00e  ! 37: AND_R	and 	%r3, %r14, %r31
	.word 0xba09667a  ! 37: AND_I	and 	%r5, 0x067a, %r29
	.word 0xb2020009  ! 37: ADD_R	add 	%r8, %r9, %r25
	.word 0xac12000a  ! 37: OR_R	or 	%r8, %r10, %r22
	.word 0xbe09a144  ! 37: AND_I	and 	%r6, 0x0144, %r31
	.word 0xb401000d  ! 37: ADD_R	add 	%r4, %r13, %r26
	.word 0xa201800e  ! 37: ADD_R	add 	%r6, %r14, %r17
	.word 0xbc09a20f  ! 37: AND_I	and 	%r6, 0x020f, %r30
	.word 0xb80929a4  ! 37: AND_I	and 	%r4, 0x09a4, %r28
	.word 0xb810e7cc  ! 37: OR_I	or 	%r3, 0x07cc, %r28
	.word 0xb401c00f  ! 37: ADD_R	add 	%r7, %r15, %r26
	.word 0xa811ed7e  ! 37: OR_I	or 	%r7, 0x0d7e, %r20
	.word 0xb400c00c  ! 37: ADD_R	add 	%r3, %r12, %r26
	.word 0xba10ee76  ! 37: OR_I	or 	%r3, 0x0e76, %r29
	.word 0xb4022470  ! 37: ADD_I	add 	%r8, 0x0470, %r26
	.word 0xb401800b  ! 37: ADD_R	add 	%r6, %r11, %r26
	.word 0xae09ede6  ! 37: AND_I	and 	%r7, 0x0de6, %r23
	.word 0xa409c00b  ! 37: AND_R	and 	%r7, %r11, %r18
	.word 0xae11ef4f  ! 37: OR_I	or 	%r7, 0x0f4f, %r23
	.word 0xac01ed96  ! 37: ADD_I	add 	%r7, 0x0d96, %r22
	.word 0xb011694b  ! 37: OR_I	or 	%r5, 0x094b, %r24
	.word 0xa602000a  ! 37: ADD_R	add 	%r8, %r10, %r19
	.word 0xaa08e484  ! 37: AND_I	and 	%r3, 0x0484, %r21
	.word 0xa609a9ea  ! 37: AND_I	and 	%r6, 0x09ea, %r19
	.word 0xbc01000a  ! 37: ADD_R	add 	%r4, %r10, %r30
	.word 0xa4114009  ! 37: OR_R	or 	%r5, %r9, %r18
	.word 0xb200e1de  ! 37: ADD_I	add 	%r3, 0x01de, %r25
	.word 0xac11ef98  ! 37: OR_I	or 	%r7, 0x0f98, %r22
	.word 0xa401ae6f  ! 37: ADD_I	add 	%r6, 0x0e6f, %r18
	.word 0xb609ece5  ! 37: AND_I	and 	%r7, 0x0ce5, %r27
	.word 0xbe09400c  ! 37: AND_R	and 	%r5, %r12, %r31
	.word 0xf82a2407  ! 37: STB_I	stb	%r28, [%r8 + 0x0407]
	.word 0xfa21ab3c  ! 37: STW_I	stw	%r29, [%r6 + 0x0b3c]
	.word 0xfa2223a4  ! 37: STW_I	stw	%r29, [%r8 + 0x03a4]
	.word 0xfe2924f6  ! 37: STB_I	stb	%r31, [%r4 + 0x04f6]
	.word 0xfc31ef7a  ! 37: STH_I	sth	%r30, [%r7 + 0x0f7a]
thr0_irf_ce_1:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_1), 16, 16),2,IRF,ce,65,x, x,x,x, x,x,x)
	.word 0xfc21ec89  ! 40: STW_I	stw	%r30, [%r7 + 0x0c89]
!Illinst: trpm_alu
	.word 0xa639aff8  ! 42: XNOR_I	xnor 	%r6, 0x0ff8, %r19
	.word 0xec29ab3c  ! 43: STB_I	stb	%r22, [%r6 + 0x0b3c]
	.word 0xc0f008e2  ! 45: STXA_R	stxa	%r0, [%r0 + %r2] 0x47
	.word 0xff21800c  ! 47: STF_R	st	%f31, [%r12, %r6]
	.word 0xac11400b  ! 47: OR_R	or 	%r5, %r11, %r22
	.word 0xa809c00c  ! 47: AND_R	and 	%r7, %r12, %r20
	.word 0xb2116c04  ! 47: OR_I	or 	%r5, 0x0c04, %r25
	bne thr0_loop_2
	subcc %g1, 0x1, %g1
!Generating store_chunk_2
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr0_loop_3:
	.word 0xa601c00a  ! 55: ADD_R	add 	%r7, %r10, %r19
	.word 0xaa112b1d  ! 55: OR_I	or 	%r4, 0x0b1d, %r21
	.word 0xb601c00d  ! 55: ADD_R	add 	%r7, %r13, %r27
	.word 0xb00169d1  ! 55: ADD_I	add 	%r5, 0x09d1, %r24
	.word 0xa209800e  ! 55: AND_R	and 	%r6, %r14, %r17
	.word 0xa209800a  ! 55: AND_R	and 	%r6, %r10, %r17
	.word 0xa811800a  ! 55: OR_R	or 	%r6, %r10, %r20
	.word 0xb209ee17  ! 55: AND_I	and 	%r7, 0x0e17, %r25
	.word 0xac11a401  ! 55: OR_I	or 	%r6, 0x0401, %r22
	.word 0xbc01c00f  ! 55: ADD_R	add 	%r7, %r15, %r30
	.word 0xac09ac37  ! 55: AND_I	and 	%r6, 0x0c37, %r22
	.word 0xaa01800f  ! 55: ADD_R	add 	%r6, %r15, %r21
	.word 0xac02000d  ! 55: ADD_R	add 	%r8, %r13, %r22
	.word 0xac11400b  ! 55: OR_R	or 	%r5, %r11, %r22
	.word 0xa809af0a  ! 55: AND_I	and 	%r6, 0x0f0a, %r20
	.word 0xa6016610  ! 55: ADD_I	add 	%r5, 0x0610, %r19
	.word 0xa61123ea  ! 55: OR_I	or 	%r4, 0x03ea, %r19
	.word 0xac0a296c  ! 55: AND_I	and 	%r8, 0x096c, %r22
	.word 0xb60162f1  ! 55: ADD_I	add 	%r5, 0x02f1, %r27
	.word 0xb0096213  ! 55: AND_I	and 	%r5, 0x0213, %r24
	.word 0xbe092e6a  ! 55: AND_I	and 	%r4, 0x0e6a, %r31
	.word 0xb40a27a0  ! 55: AND_I	and 	%r8, 0x07a0, %r26
	.word 0xba01000b  ! 55: ADD_R	add 	%r4, %r11, %r29
	.word 0xb4020009  ! 55: ADD_R	add 	%r8, %r9, %r26
	.word 0xb400e8a0  ! 55: ADD_I	add 	%r3, 0x08a0, %r26
	.word 0xb210ec80  ! 55: OR_I	or 	%r3, 0x0c80, %r25
	.word 0xb410e862  ! 55: OR_I	or 	%r3, 0x0862, %r26
	.word 0xae122d57  ! 55: OR_I	or 	%r8, 0x0d57, %r23
	.word 0xae00e550  ! 55: ADD_I	add 	%r3, 0x0550, %r23
	.word 0xb201400e  ! 55: ADD_R	add 	%r5, %r14, %r25
	.word 0xa20a000e  ! 55: AND_R	and 	%r8, %r14, %r17
	.word 0xbc10c00d  ! 55: OR_R	or 	%r3, %r13, %r30
	.word 0xb801800a  ! 55: ADD_R	add 	%r6, %r10, %r28
	.word 0xa409c00b  ! 55: AND_R	and 	%r7, %r11, %r18
	.word 0xb210c00e  ! 55: OR_R	or 	%r3, %r14, %r25
	.word 0xbc11000d  ! 55: OR_R	or 	%r4, %r13, %r30
	.word 0xba08c00c  ! 55: AND_R	and 	%r3, %r12, %r29
	.word 0xb600e689  ! 55: ADD_I	add 	%r3, 0x0689, %r27
	.word 0xb210e03d  ! 55: OR_I	or 	%r3, 0x003d, %r25
	.word 0xa4090009  ! 55: AND_R	and 	%r4, %r9, %r18
	.word 0xaa022632  ! 55: ADD_I	add 	%r8, 0x0632, %r21
	.word 0xac018009  ! 55: ADD_R	add 	%r6, %r9, %r22
	.word 0xb4118009  ! 55: OR_R	or 	%r6, %r9, %r26
	.word 0xa411c00f  ! 55: OR_R	or 	%r7, %r15, %r18
	.word 0xaa0922a8  ! 55: AND_I	and 	%r4, 0x02a8, %r21
	.word 0xb201000f  ! 55: ADD_R	add 	%r4, %r15, %r25
	.word 0xb008c00a  ! 55: AND_R	and 	%r3, %r10, %r24
	.word 0xb409269b  ! 55: AND_I	and 	%r4, 0x069b, %r26
	.word 0xb8016e0c  ! 55: ADD_I	add 	%r5, 0x0e0c, %r28
	.word 0xa801000a  ! 55: ADD_R	add 	%r4, %r10, %r20
	.word 0xb20a000f  ! 55: AND_R	and 	%r8, %r15, %r25
	.word 0xbc096a3c  ! 55: AND_I	and 	%r5, 0x0a3c, %r30
	.word 0xa2012e59  ! 55: ADD_I	add 	%r4, 0x0e59, %r17
	.word 0xb0098009  ! 55: AND_R	and 	%r6, %r9, %r24
	.word 0xae11c00b  ! 55: OR_R	or 	%r7, %r11, %r23
	.word 0xaa110009  ! 55: OR_R	or 	%r4, %r9, %r21
	.word 0xa209800b  ! 55: AND_R	and 	%r6, %r11, %r17
	.word 0xa810ef93  ! 55: OR_I	or 	%r3, 0x0f93, %r20
	.word 0xb411000b  ! 55: OR_R	or 	%r4, %r11, %r26
	.word 0xac11800d  ! 55: OR_R	or 	%r6, %r13, %r22
	.word 0xbc09a6e0  ! 55: AND_I	and 	%r6, 0x06e0, %r30
	.word 0xaa11000c  ! 55: OR_R	or 	%r4, %r12, %r21
	.word 0xb601e42a  ! 55: ADD_I	add 	%r7, 0x042a, %r27
	.word 0xb410e056  ! 55: OR_I	or 	%r3, 0x0056, %r26
	.word 0xb8022988  ! 55: ADD_I	add 	%r8, 0x0988, %r28
	.word 0xae10e107  ! 55: OR_I	or 	%r3, 0x0107, %r23
	.word 0xa211800f  ! 55: OR_R	or 	%r6, %r15, %r17
	.word 0xba118009  ! 55: OR_R	or 	%r6, %r9, %r29
	.word 0xa211c00d  ! 55: OR_R	or 	%r7, %r13, %r17
	.word 0xa809e6a6  ! 55: AND_I	and 	%r7, 0x06a6, %r20
	.word 0xb811ae84  ! 55: OR_I	or 	%r6, 0x0e84, %r28
	.word 0xb800e337  ! 55: ADD_I	add 	%r3, 0x0337, %r28
	.word 0xbe08e138  ! 55: AND_I	and 	%r3, 0x0138, %r31
	.word 0xb010e8a3  ! 55: OR_I	or 	%r3, 0x08a3, %r24
	.word 0xbe11ae01  ! 55: OR_I	or 	%r6, 0x0e01, %r31
	.word 0xb209a779  ! 55: AND_I	and 	%r6, 0x0779, %r25
	.word 0xb608e43a  ! 55: AND_I	and 	%r3, 0x043a, %r27
	.word 0xba11a39a  ! 55: OR_I	or 	%r6, 0x039a, %r29
	.word 0xa60929fa  ! 55: AND_I	and 	%r4, 0x09fa, %r19
	.word 0xb000c009  ! 55: ADD_R	add 	%r3, %r9, %r24
	.word 0xbe08ec82  ! 55: AND_I	and 	%r3, 0x0c82, %r31
	.word 0xb001ac7f  ! 55: ADD_I	add 	%r6, 0x0c7f, %r24
	.word 0xa601800f  ! 55: ADD_R	add 	%r6, %r15, %r19
	.word 0xa801c00c  ! 55: ADD_R	add 	%r7, %r12, %r20
	.word 0xa201400a  ! 55: ADD_R	add 	%r5, %r10, %r17
	.word 0xaa11400f  ! 55: OR_R	or 	%r5, %r15, %r21
	.word 0xb409800e  ! 55: AND_R	and 	%r6, %r14, %r26
	.word 0xb20229ff  ! 55: ADD_I	add 	%r8, 0x09ff, %r25
	.word 0xbe09400f  ! 55: AND_R	and 	%r5, %r15, %r31
	.word 0xa209c00f  ! 55: AND_R	and 	%r7, %r15, %r17
	.word 0xbe01a35a  ! 55: ADD_I	add 	%r6, 0x035a, %r31
	.word 0xa6112e5a  ! 55: OR_I	or 	%r4, 0x0e5a, %r19
	.word 0xa411400b  ! 55: OR_R	or 	%r5, %r11, %r18
	.word 0xb200c00c  ! 55: ADD_R	add 	%r3, %r12, %r25
	.word 0xb208c00a  ! 55: AND_R	and 	%r3, %r10, %r25
	.word 0xb81229cb  ! 55: OR_I	or 	%r8, 0x09cb, %r28
	.word 0xb2116323  ! 55: OR_I	or 	%r5, 0x0323, %r25
	.word 0xa2116b7c  ! 55: OR_I	or 	%r5, 0x0b7c, %r17
	.word 0xb609400d  ! 55: AND_R	and 	%r5, %r13, %r27
	.word 0xa6016287  ! 55: ADD_I	add 	%r5, 0x0287, %r19
	.word 0xbc09000c  ! 55: AND_R	and 	%r4, %r12, %r30
	.word 0xac012095  ! 55: ADD_I	add 	%r4, 0x0095, %r22
	.word 0xae010009  ! 55: ADD_R	add 	%r4, %r9, %r23
	.word 0xb409c00c  ! 55: AND_R	and 	%r7, %r12, %r26
	.word 0xa608efd9  ! 55: AND_I	and 	%r3, 0x0fd9, %r19
	.word 0xa60129bf  ! 55: ADD_I	add 	%r4, 0x09bf, %r19
	.word 0xac00c00d  ! 55: ADD_R	add 	%r3, %r13, %r22
	.word 0xb409400b  ! 55: AND_R	and 	%r5, %r11, %r26
	.word 0xaa10e3b2  ! 55: OR_I	or 	%r3, 0x03b2, %r21
	.word 0xac09e2df  ! 55: AND_I	and 	%r7, 0x02df, %r22
	.word 0xb000c00f  ! 55: ADD_R	add 	%r3, %r15, %r24
	.word 0xbe022b96  ! 55: ADD_I	add 	%r8, 0x0b96, %r31
	.word 0xae09400e  ! 55: AND_R	and 	%r5, %r14, %r23
	.word 0xa411c009  ! 55: OR_R	or 	%r7, %r9, %r18
	.word 0xb412000b  ! 55: OR_R	or 	%r8, %r11, %r26
	.word 0xbe11800d  ! 55: OR_R	or 	%r6, %r13, %r31
	.word 0xa40a25ae  ! 55: AND_I	and 	%r8, 0x05ae, %r18
	.word 0xaa012fcf  ! 55: ADD_I	add 	%r4, 0x0fcf, %r21
	.word 0xa2116adc  ! 55: OR_I	or 	%r5, 0x0adc, %r17
	.word 0xb811228b  ! 55: OR_I	or 	%r4, 0x028b, %r28
	.word 0xaa11800b  ! 55: OR_R	or 	%r6, %r11, %r21
	.word 0xaa11e0b9  ! 55: OR_I	or 	%r7, 0x00b9, %r21
	.word 0xa411800b  ! 55: OR_R	or 	%r6, %r11, %r18
	.word 0xba096bab  ! 55: AND_I	and 	%r5, 0x0bab, %r29
	.word 0xae122728  ! 55: OR_I	or 	%r8, 0x0728, %r23
	.word 0xbc02000b  ! 55: ADD_R	add 	%r8, %r11, %r30
	.word 0xa6016df8  ! 55: ADD_I	add 	%r5, 0x0df8, %r19
	.word 0xbe010009  ! 55: ADD_R	add 	%r4, %r9, %r31
	.word 0xa610ed89  ! 55: OR_I	or 	%r3, 0x0d89, %r19
	.word 0xb609400a  ! 55: AND_R	and 	%r5, %r10, %r27
	.word 0xa8112fda  ! 55: OR_I	or 	%r4, 0x0fda, %r20
	.word 0xb80a2d44  ! 55: AND_I	and 	%r8, 0x0d44, %r28
	.word 0xbe11800a  ! 55: OR_R	or 	%r6, %r10, %r31
	.word 0xac00c00c  ! 55: ADD_R	add 	%r3, %r12, %r22
	.word 0xae11287d  ! 55: OR_I	or 	%r4, 0x087d, %r23
	.word 0xb002000e  ! 55: ADD_R	add 	%r8, %r14, %r24
	.word 0xac01800f  ! 55: ADD_R	add 	%r6, %r15, %r22
	.word 0xbe11ea5c  ! 55: OR_I	or 	%r7, 0x0a5c, %r31
	.word 0xbc08ec7a  ! 55: AND_I	and 	%r3, 0x0c7a, %r30
	.word 0xb001000f  ! 55: ADD_R	add 	%r4, %r15, %r24
	.word 0xbe09aee9  ! 55: AND_I	and 	%r6, 0x0ee9, %r31
	.word 0xa211ecf6  ! 55: OR_I	or 	%r7, 0x0cf6, %r17
	.word 0xbe08c00c  ! 55: AND_R	and 	%r3, %r12, %r31
	.word 0xb811a8c8  ! 55: OR_I	or 	%r6, 0x08c8, %r28
	.word 0xa20a000d  ! 55: AND_R	and 	%r8, %r13, %r17
	.word 0xb811c009  ! 55: OR_R	or 	%r7, %r9, %r28
	.word 0xae0a20d7  ! 55: AND_I	and 	%r8, 0x00d7, %r23
	.word 0xa809e0a0  ! 55: AND_I	and 	%r7, 0x00a0, %r20
	.word 0xb401ea93  ! 55: ADD_I	add 	%r7, 0x0a93, %r26
	.word 0xbc096b2a  ! 55: AND_I	and 	%r5, 0x0b2a, %r30
	.word 0xb611800c  ! 55: OR_R	or 	%r6, %r12, %r27
	.word 0xac092988  ! 55: AND_I	and 	%r4, 0x0988, %r22
	.word 0xb211a49c  ! 55: OR_I	or 	%r6, 0x049c, %r25
	.word 0xb6022b8b  ! 55: ADD_I	add 	%r8, 0x0b8b, %r27
	.word 0xa209ee09  ! 55: AND_I	and 	%r7, 0x0e09, %r17
	.word 0xb810eebf  ! 55: OR_I	or 	%r3, 0x0ebf, %r28
	.word 0xaa10e432  ! 55: OR_I	or 	%r3, 0x0432, %r21
	.word 0xac08c00d  ! 55: AND_R	and 	%r3, %r13, %r22
	.word 0xb601400a  ! 55: ADD_R	add 	%r5, %r10, %r27
	.word 0xba08e999  ! 55: AND_I	and 	%r3, 0x0999, %r29
	.word 0xac11000f  ! 55: OR_R	or 	%r4, %r15, %r22
	.word 0xae09c00c  ! 55: AND_R	and 	%r7, %r12, %r23
	.word 0xb0116745  ! 55: OR_I	or 	%r5, 0x0745, %r24
	.word 0xa208c009  ! 55: AND_R	and 	%r3, %r9, %r17
	.word 0xb601e1ae  ! 55: ADD_I	add 	%r7, 0x01ae, %r27
	.word 0xaa1127a0  ! 55: OR_I	or 	%r4, 0x07a0, %r21
	.word 0xac00c00d  ! 55: ADD_R	add 	%r3, %r13, %r22
	.word 0xa60a2d86  ! 55: AND_I	and 	%r8, 0x0d86, %r19
	.word 0xa40166c3  ! 55: ADD_I	add 	%r5, 0x06c3, %r18
	.word 0xa211c00e  ! 55: OR_R	or 	%r7, %r14, %r17
	.word 0xa601a0b6  ! 55: ADD_I	add 	%r6, 0x00b6, %r19
	.word 0xaa012f48  ! 55: ADD_I	add 	%r4, 0x0f48, %r21
	.word 0xaa10e088  ! 55: OR_I	or 	%r3, 0x0088, %r21
	.word 0xb800c00a  ! 55: ADD_R	add 	%r3, %r10, %r28
	.word 0xb0092402  ! 55: AND_I	and 	%r4, 0x0402, %r24
	.word 0xa8112f7d  ! 55: OR_I	or 	%r4, 0x0f7d, %r20
	.word 0xb80a0009  ! 55: AND_R	and 	%r8, %r9, %r28
	.word 0xa411ef55  ! 55: OR_I	or 	%r7, 0x0f55, %r18
	.word 0xbc00c00c  ! 55: ADD_R	add 	%r3, %r12, %r30
	.word 0xb009c00b  ! 55: AND_R	and 	%r7, %r11, %r24
	.word 0xae0127f2  ! 55: ADD_I	add 	%r4, 0x07f2, %r23
	.word 0xae09abad  ! 55: AND_I	and 	%r6, 0x0bad, %r23
	.word 0xb401400f  ! 55: ADD_R	add 	%r5, %r15, %r26
	.word 0xac00e0e0  ! 55: ADD_I	add 	%r3, 0x00e0, %r22
	.word 0xa600e4c0  ! 55: ADD_I	add 	%r3, 0x04c0, %r19
	.word 0xa2122ae1  ! 55: OR_I	or 	%r8, 0x0ae1, %r17
	.word 0xbc11c00e  ! 55: OR_R	or 	%r7, %r14, %r30
	.word 0xa602000d  ! 55: ADD_R	add 	%r8, %r13, %r19
	.word 0xa408c00d  ! 55: AND_R	and 	%r3, %r13, %r18
	.word 0xa810eb21  ! 55: OR_I	or 	%r3, 0x0b21, %r20
	.word 0xac11800f  ! 55: OR_R	or 	%r6, %r15, %r22
	.word 0xa601630e  ! 55: ADD_I	add 	%r5, 0x030e, %r19
	.word 0xaa092157  ! 55: AND_I	and 	%r4, 0x0157, %r21
	.word 0xba11a1ee  ! 55: OR_I	or 	%r6, 0x01ee, %r29
	.word 0xb009e87d  ! 55: AND_I	and 	%r7, 0x087d, %r24
	.word 0xae08e7ae  ! 55: AND_I	and 	%r3, 0x07ae, %r23
	.word 0xb600e87f  ! 55: ADD_I	add 	%r3, 0x087f, %r27
	.word 0xb60a000f  ! 55: AND_R	and 	%r8, %r15, %r27
	.word 0xb210c00f  ! 55: OR_R	or 	%r3, %r15, %r25
	.word 0xa409c00e  ! 55: AND_R	and 	%r7, %r14, %r18
	.word 0xb411c009  ! 55: OR_R	or 	%r7, %r9, %r26
	.word 0xbc02000c  ! 55: ADD_R	add 	%r8, %r12, %r30
	.word 0xa20222bc  ! 55: ADD_I	add 	%r8, 0x02bc, %r17
	.word 0xbc116cf5  ! 55: OR_I	or 	%r5, 0x0cf5, %r30
	.word 0xaa12000e  ! 55: OR_R	or 	%r8, %r14, %r21
	.word 0xb601800c  ! 55: ADD_R	add 	%r6, %r12, %r27
	.word 0xa601c00c  ! 55: ADD_R	add 	%r7, %r12, %r19
	.word 0xb609ae88  ! 55: AND_I	and 	%r6, 0x0e88, %r27
	.word 0xbe012bde  ! 55: ADD_I	add 	%r4, 0x0bde, %r31
	.word 0xba01400b  ! 55: ADD_R	add 	%r5, %r11, %r29
	.word 0xae022eff  ! 55: ADD_I	add 	%r8, 0x0eff, %r23
	.word 0xba016964  ! 55: ADD_I	add 	%r5, 0x0964, %r29
	.word 0xb401edc7  ! 55: ADD_I	add 	%r7, 0x0dc7, %r26
	.word 0xbc01800f  ! 55: ADD_R	add 	%r6, %r15, %r30
	.word 0xfe222330  ! 55: STW_I	stw	%r31, [%r8 + 0x0330]
	.word 0xea2922c2  ! 55: STB_I	stb	%r21, [%r4 + 0x02c2]
	.word 0xf22226a4  ! 55: STW_I	stw	%r25, [%r8 + 0x06a4]
	.word 0xe4722090  ! 55: STX_I	stx	%r18, [%r8 + 0x0090]
	.word 0xe420e0c0  ! 55: STW_I	stw	%r18, [%r3 + 0x00c0]
	.word 0xf22223e8  ! 55: STW_I	stw	%r25, [%r8 + 0x03e8]
	.word 0xea31e990  ! 55: STH_I	sth	%r21, [%r7 + 0x0990]
thr0_dc_err_0:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_0), 16, 16),2,DC_DATA,15)
	.word 0xea01c00a  ! 57: LDUW_R	lduw	[%r7 + %r10], %r21
	.word 0xa729400e  ! 58: SLL_R	sll 	%r5, %r14, %r19
	.word 0xecb92768  ! 59: STDA_I	stda	%r22, [%r4 + 0x0768] %asi
	.word 0xf721c00b  ! 61: STF_R	st	%f27, [%r11, %r7]
	.word 0xb0122c58  ! 61: OR_I	or 	%r8, 0x0c58, %r24
	.word 0xb601aeb9  ! 61: ADD_I	add 	%r6, 0x0eb9, %r27
	.word 0xbe012b36  ! 61: ADD_I	add 	%r4, 0x0b36, %r31
	bne thr0_loop_3
	subcc %g1, 0x1, %g1
!Generating store_chunk_1
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr0_loop_4:
	.word 0xb4012da3  ! 67: ADD_I	add 	%r4, 0x0da3, %r26
	.word 0xaa096fb3  ! 67: AND_I	and 	%r5, 0x0fb3, %r21
	.word 0xb202205f  ! 67: ADD_I	add 	%r8, 0x005f, %r25
	.word 0xb409c00b  ! 67: AND_R	and 	%r7, %r11, %r26
	.word 0xb411e2b0  ! 67: OR_I	or 	%r7, 0x02b0, %r26
	.word 0xac09246b  ! 67: AND_I	and 	%r4, 0x046b, %r22
	.word 0xbc09c00d  ! 67: AND_R	and 	%r7, %r13, %r30
	.word 0xb801800d  ! 67: ADD_R	add 	%r6, %r13, %r28
	.word 0xb20a26ff  ! 67: AND_I	and 	%r8, 0x06ff, %r25
	.word 0xae00e27e  ! 67: ADD_I	add 	%r3, 0x027e, %r23
	.word 0xba01000d  ! 67: ADD_R	add 	%r4, %r13, %r29
	.word 0xb809ea89  ! 67: AND_I	and 	%r7, 0x0a89, %r28
	.word 0xac12000a  ! 67: OR_R	or 	%r8, %r10, %r22
	.word 0xb011c00a  ! 67: OR_R	or 	%r7, %r10, %r24
	.word 0xac02000f  ! 67: ADD_R	add 	%r8, %r15, %r22
	.word 0xb6016630  ! 67: ADD_I	add 	%r5, 0x0630, %r27
	.word 0xb4018009  ! 67: ADD_R	add 	%r6, %r9, %r26
	.word 0xbe09800a  ! 67: AND_R	and 	%r6, %r10, %r31
	.word 0xbe01400a  ! 67: ADD_R	add 	%r5, %r10, %r31
	.word 0xb0096f46  ! 67: AND_I	and 	%r5, 0x0f46, %r24
	.word 0xa411ec4a  ! 67: OR_I	or 	%r7, 0x0c4a, %r18
	.word 0xa611eedb  ! 67: OR_I	or 	%r7, 0x0edb, %r19
	.word 0xb401400e  ! 67: ADD_R	add 	%r5, %r14, %r26
	.word 0xa80a000b  ! 67: AND_R	and 	%r8, %r11, %r20
	.word 0xa809c00c  ! 67: AND_R	and 	%r7, %r12, %r20
	.word 0xb200e814  ! 67: ADD_I	add 	%r3, 0x0814, %r25
	.word 0xbc02000c  ! 67: ADD_R	add 	%r8, %r12, %r30
	.word 0xbc09400a  ! 67: AND_R	and 	%r5, %r10, %r30
	.word 0xb211000d  ! 67: OR_R	or 	%r4, %r13, %r25
	.word 0xba09800f  ! 67: AND_R	and 	%r6, %r15, %r29
	.word 0xbc01a255  ! 67: ADD_I	add 	%r6, 0x0255, %r30
	.word 0xa401c00a  ! 67: ADD_R	add 	%r7, %r10, %r18
	.word 0xa401c00f  ! 67: ADD_R	add 	%r7, %r15, %r18
	.word 0xb009000f  ! 67: AND_R	and 	%r4, %r15, %r24
	.word 0xb012000a  ! 67: OR_R	or 	%r8, %r10, %r24
	.word 0xb009a818  ! 67: AND_I	and 	%r6, 0x0818, %r24
	.word 0xb40960f7  ! 67: AND_I	and 	%r5, 0x00f7, %r26
	.word 0xaa0a000b  ! 67: AND_R	and 	%r8, %r11, %r21
	.word 0xb80928f9  ! 67: AND_I	and 	%r4, 0x08f9, %r28
	.word 0xbc11800e  ! 67: OR_R	or 	%r6, %r14, %r30
	.word 0xbc09400f  ! 67: AND_R	and 	%r5, %r15, %r30
	.word 0xae10c00e  ! 67: OR_R	or 	%r3, %r14, %r23
	.word 0xa201c00c  ! 67: ADD_R	add 	%r7, %r12, %r17
	.word 0xb0092457  ! 67: AND_I	and 	%r4, 0x0457, %r24
	.word 0xa201279b  ! 67: ADD_I	add 	%r4, 0x079b, %r17
	.word 0xaa11a938  ! 67: OR_I	or 	%r6, 0x0938, %r21
	.word 0xaa022683  ! 67: ADD_I	add 	%r8, 0x0683, %r21
	.word 0xa209e818  ! 67: AND_I	and 	%r7, 0x0818, %r17
	.word 0xae09c00f  ! 67: AND_R	and 	%r7, %r15, %r23
	.word 0xa810ea82  ! 67: OR_I	or 	%r3, 0x0a82, %r20
	.word 0xa60a000f  ! 67: AND_R	and 	%r8, %r15, %r19
	.word 0xa408c00f  ! 67: AND_R	and 	%r3, %r15, %r18
	.word 0xac022c7d  ! 67: ADD_I	add 	%r8, 0x0c7d, %r22
	.word 0xac11c00a  ! 67: OR_R	or 	%r7, %r10, %r22
	.word 0xbc10c00f  ! 67: OR_R	or 	%r3, %r15, %r30
	.word 0xb2096cfd  ! 67: AND_I	and 	%r5, 0x0cfd, %r25
	.word 0xae020009  ! 67: ADD_R	add 	%r8, %r9, %r23
	.word 0xae10e7ac  ! 67: OR_I	or 	%r3, 0x07ac, %r23
	.word 0xa409000b  ! 67: AND_R	and 	%r4, %r11, %r18
	.word 0xa811c00b  ! 67: OR_R	or 	%r7, %r11, %r20
	.word 0xa411abb7  ! 67: OR_I	or 	%r6, 0x0bb7, %r18
	.word 0xb011800d  ! 67: OR_R	or 	%r6, %r13, %r24
	.word 0xa410c00c  ! 67: OR_R	or 	%r3, %r12, %r18
	.word 0xac112f38  ! 67: OR_I	or 	%r4, 0x0f38, %r22
	.word 0xaa11000c  ! 67: OR_R	or 	%r4, %r12, %r21
	.word 0xba00c00f  ! 67: ADD_R	add 	%r3, %r15, %r29
	.word 0xa409000e  ! 67: AND_R	and 	%r4, %r14, %r18
	.word 0xb409000f  ! 67: AND_R	and 	%r4, %r15, %r26
	.word 0xa401c00e  ! 67: ADD_R	add 	%r7, %r14, %r18
	.word 0xba1228e1  ! 67: OR_I	or 	%r8, 0x08e1, %r29
	.word 0xac11400e  ! 67: OR_R	or 	%r5, %r14, %r22
	.word 0xb809400f  ! 67: AND_R	and 	%r5, %r15, %r28
	.word 0xae12000c  ! 67: OR_R	or 	%r8, %r12, %r23
	.word 0xb411e58c  ! 67: OR_I	or 	%r7, 0x058c, %r26
	.word 0xae02000f  ! 67: ADD_R	add 	%r8, %r15, %r23
	.word 0xaa022abc  ! 67: ADD_I	add 	%r8, 0x0abc, %r21
	.word 0xa401efce  ! 67: ADD_I	add 	%r7, 0x0fce, %r18
	.word 0xb809a539  ! 67: AND_I	and 	%r6, 0x0539, %r28
	.word 0xac120009  ! 67: OR_R	or 	%r8, %r9, %r22
	.word 0xae08c00f  ! 67: AND_R	and 	%r3, %r15, %r23
	.word 0xbc11000c  ! 67: OR_R	or 	%r4, %r12, %r30
	.word 0xa209c00c  ! 67: AND_R	and 	%r7, %r12, %r17
	.word 0xba02000e  ! 67: ADD_R	add 	%r8, %r14, %r29
	.word 0xbe09a037  ! 67: AND_I	and 	%r6, 0x0037, %r31
	.word 0xaa11400f  ! 67: OR_R	or 	%r5, %r15, %r21
	.word 0xba016113  ! 67: ADD_I	add 	%r5, 0x0113, %r29
	.word 0xb801aa4e  ! 67: ADD_I	add 	%r6, 0x0a4e, %r28
	.word 0xb002232d  ! 67: ADD_I	add 	%r8, 0x032d, %r24
	.word 0xb801c009  ! 67: ADD_R	add 	%r7, %r9, %r28
	.word 0xbe09c00d  ! 67: AND_R	and 	%r7, %r13, %r31
	.word 0xbc01000a  ! 67: ADD_R	add 	%r4, %r10, %r30
	.word 0xb011400b  ! 67: OR_R	or 	%r5, %r11, %r24
	.word 0xac01e581  ! 67: ADD_I	add 	%r7, 0x0581, %r22
	.word 0xba09e557  ! 67: AND_I	and 	%r7, 0x0557, %r29
	.word 0xa409c00f  ! 67: AND_R	and 	%r7, %r15, %r18
	.word 0xa800c00f  ! 67: ADD_R	add 	%r3, %r15, %r20
	.word 0xa611400e  ! 67: OR_R	or 	%r5, %r14, %r19
	.word 0xaa09e6a5  ! 67: AND_I	and 	%r7, 0x06a5, %r21
	.word 0xba09c00c  ! 67: AND_R	and 	%r7, %r12, %r29
	.word 0xa609000c  ! 67: AND_R	and 	%r4, %r12, %r19
	.word 0xa601c00e  ! 67: ADD_R	add 	%r7, %r14, %r19
	.word 0xa801ef58  ! 67: ADD_I	add 	%r7, 0x0f58, %r20
	.word 0xae096049  ! 67: AND_I	and 	%r5, 0x0049, %r23
	.word 0xbc09c00c  ! 67: AND_R	and 	%r7, %r12, %r30
	.word 0xac00eafd  ! 67: ADD_I	add 	%r3, 0x0afd, %r22
	.word 0xa80a000e  ! 67: AND_R	and 	%r8, %r14, %r20
	.word 0xba09800f  ! 67: AND_R	and 	%r6, %r15, %r29
	.word 0xbc0967e6  ! 67: AND_I	and 	%r5, 0x07e6, %r30
	.word 0xb201800e  ! 67: ADD_R	add 	%r6, %r14, %r25
	.word 0xba02000f  ! 67: ADD_R	add 	%r8, %r15, %r29
	.word 0xb801c00a  ! 67: ADD_R	add 	%r7, %r10, %r28
	.word 0xe271ea68  ! 67: STX_I	stx	%r17, [%r7 + 0x0a68]
	.word 0xe829600d  ! 67: STB_I	stb	%r20, [%r5 + 0x000d]
	.word 0xf2716a68  ! 67: STX_I	stx	%r25, [%r5 + 0x0a68]
	.word 0xee722148  ! 67: STX_I	stx	%r23, [%r8 + 0x0148]
	.word 0xf2292fee  ! 67: STB_I	stb	%r25, [%r4 + 0x0fee]
	.word 0xfe7129b8  ! 69: STX_I	stx	%r31, [%r4 + 0x09b8]
!Illinst: trpm_alu
	.word 0xae119d0b  ! 71: OR_R	or 	%r6, %r11, %r23
	.word 0xf8296640  ! 72: STB_I	stb	%r28, [%r5 + 0x0640]
	.word 0xc0f00962  ! 74: STXA_R	stxa	%r0, [%r0 + %r2] 0x4b
	.word 0xae49ea9c  ! 75: MULX_I	mulx 	%r7, 0x0a9c, %r23
	.word 0xbe11a9c5  ! 75: OR_I	or 	%r6, 0x09c5, %r31
	.word 0xa811a700  ! 75: OR_I	or 	%r6, 0x0700, %r20
	.word 0xb201c00a  ! 75: ADD_R	add 	%r7, %r10, %r25
	bne thr0_loop_4
	subcc %g1, 0x1, %g1
!Generating store_chunk_1
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr0_loop_5:
	.word 0xb2012235  ! 81: ADD_I	add 	%r4, 0x0235, %r25
	.word 0xb609ae88  ! 81: AND_I	and 	%r6, 0x0e88, %r27
	.word 0xa410c009  ! 81: OR_R	or 	%r3, %r9, %r18
	.word 0xa401a424  ! 81: ADD_I	add 	%r6, 0x0424, %r18
	.word 0xa61167f9  ! 81: OR_I	or 	%r5, 0x07f9, %r19
	.word 0xb81162b5  ! 81: OR_I	or 	%r5, 0x02b5, %r28
	.word 0xb601639b  ! 81: ADD_I	add 	%r5, 0x039b, %r27
	.word 0xbe12000e  ! 81: OR_R	or 	%r8, %r14, %r31
	.word 0xb601e4a3  ! 81: ADD_I	add 	%r7, 0x04a3, %r27
	.word 0xb40a2635  ! 81: AND_I	and 	%r8, 0x0635, %r26
	.word 0xb409800e  ! 81: AND_R	and 	%r6, %r14, %r26
	.word 0xb411612b  ! 81: OR_I	or 	%r5, 0x012b, %r26
	.word 0xb808ee49  ! 81: AND_I	and 	%r3, 0x0e49, %r28
	.word 0xb411800a  ! 81: OR_R	or 	%r6, %r10, %r26
	.word 0xb400e388  ! 81: ADD_I	add 	%r3, 0x0388, %r26
	.word 0xa20925d0  ! 81: AND_I	and 	%r4, 0x05d0, %r17
	.word 0xbe09800f  ! 81: AND_R	and 	%r6, %r15, %r31
	.word 0xaa11400f  ! 81: OR_R	or 	%r5, %r15, %r21
	.word 0xb0022c9b  ! 81: ADD_I	add 	%r8, 0x0c9b, %r24
	.word 0xa2122260  ! 81: OR_I	or 	%r8, 0x0260, %r17
	.word 0xae0a2c07  ! 81: AND_I	and 	%r8, 0x0c07, %r23
	.word 0xba00efa0  ! 81: ADD_I	add 	%r3, 0x0fa0, %r29
	.word 0xbe00c00d  ! 81: ADD_R	add 	%r3, %r13, %r31
	.word 0xbe096433  ! 81: AND_I	and 	%r5, 0x0433, %r31
	.word 0xa601400c  ! 81: ADD_R	add 	%r5, %r12, %r19
	.word 0xba122c79  ! 81: OR_I	or 	%r8, 0x0c79, %r29
	.word 0xa400e078  ! 81: ADD_I	add 	%r3, 0x0078, %r18
	.word 0xac09c00e  ! 81: AND_R	and 	%r7, %r14, %r22
	.word 0xbe0a000d  ! 81: AND_R	and 	%r8, %r13, %r31
	.word 0xb2118009  ! 81: OR_R	or 	%r6, %r9, %r25
	.word 0xa6012ae0  ! 81: ADD_I	add 	%r4, 0x0ae0, %r19
	.word 0xa6020009  ! 81: ADD_R	add 	%r8, %r9, %r19
	.word 0xa601c009  ! 81: ADD_R	add 	%r7, %r9, %r19
	.word 0xa409c00c  ! 81: AND_R	and 	%r7, %r12, %r18
	.word 0xb200ec3f  ! 81: ADD_I	add 	%r3, 0x0c3f, %r25
	.word 0xbe11000d  ! 81: OR_R	or 	%r4, %r13, %r31
	.word 0xbe01000d  ! 81: ADD_R	add 	%r4, %r13, %r31
	.word 0xa40a000e  ! 81: AND_R	and 	%r8, %r14, %r18
	.word 0xae012dc2  ! 81: ADD_I	add 	%r4, 0x0dc2, %r23
	.word 0xaa11000c  ! 81: OR_R	or 	%r4, %r12, %r21
	.word 0xb402210c  ! 81: ADD_I	add 	%r8, 0x010c, %r26
	.word 0xbc120009  ! 81: OR_R	or 	%r8, %r9, %r30
	.word 0xb211400d  ! 81: OR_R	or 	%r5, %r13, %r25
	.word 0xac01a532  ! 81: ADD_I	add 	%r6, 0x0532, %r22
	.word 0xaa00ea66  ! 81: ADD_I	add 	%r3, 0x0a66, %r21
	.word 0xbe01400c  ! 81: ADD_R	add 	%r5, %r12, %r31
	.word 0xa211a5e3  ! 81: OR_I	or 	%r6, 0x05e3, %r17
	.word 0xba116433  ! 81: OR_I	or 	%r5, 0x0433, %r29
	.word 0xa200ed86  ! 81: ADD_I	add 	%r3, 0x0d86, %r17
	.word 0xa611800d  ! 81: OR_R	or 	%r6, %r13, %r19
	.word 0xba096607  ! 81: AND_I	and 	%r5, 0x0607, %r29
	.word 0xa812000d  ! 81: OR_R	or 	%r8, %r13, %r20
	.word 0xaa08c00f  ! 81: AND_R	and 	%r3, %r15, %r21
	.word 0xbc08c009  ! 81: AND_R	and 	%r3, %r9, %r30
	.word 0xbe08c00a  ! 81: AND_R	and 	%r3, %r10, %r31
	.word 0xb801c00a  ! 81: ADD_R	add 	%r7, %r10, %r28
	.word 0xa609237b  ! 81: AND_I	and 	%r4, 0x037b, %r19
	.word 0xae09400b  ! 81: AND_R	and 	%r5, %r11, %r23
	.word 0xb609400c  ! 81: AND_R	and 	%r5, %r12, %r27
	.word 0xa611aaa9  ! 81: OR_I	or 	%r6, 0x0aa9, %r19
	.word 0xbc08c00b  ! 81: AND_R	and 	%r3, %r11, %r30
	.word 0xa8010009  ! 81: ADD_R	add 	%r4, %r9, %r20
	.word 0xbc09e082  ! 81: AND_I	and 	%r7, 0x0082, %r30
	.word 0xba01400e  ! 81: ADD_R	add 	%r5, %r14, %r29
	.word 0xba00c00e  ! 81: ADD_R	add 	%r3, %r14, %r29
	.word 0xac11c00b  ! 81: OR_R	or 	%r7, %r11, %r22
	.word 0xbc01c00a  ! 81: ADD_R	add 	%r7, %r10, %r30
	.word 0xae09ed50  ! 81: AND_I	and 	%r7, 0x0d50, %r23
	.word 0xa801c00b  ! 81: ADD_R	add 	%r7, %r11, %r20
	.word 0xb009c00f  ! 81: AND_R	and 	%r7, %r15, %r24
	.word 0xbc022e36  ! 81: ADD_I	add 	%r8, 0x0e36, %r30
	.word 0xbc01000c  ! 81: ADD_R	add 	%r4, %r12, %r30
	.word 0xbc11a683  ! 81: OR_I	or 	%r6, 0x0683, %r30
	.word 0xaa11800a  ! 81: OR_R	or 	%r6, %r10, %r21
	.word 0xac016d42  ! 81: ADD_I	add 	%r5, 0x0d42, %r22
	.word 0xbc112f1d  ! 81: OR_I	or 	%r4, 0x0f1d, %r30
	.word 0xb6020009  ! 81: ADD_R	add 	%r8, %r9, %r27
	.word 0xac11800d  ! 81: OR_R	or 	%r6, %r13, %r22
	.word 0xb801af57  ! 81: ADD_I	add 	%r6, 0x0f57, %r28
	.word 0xa601c00f  ! 81: ADD_R	add 	%r7, %r15, %r19
	.word 0xbc018009  ! 81: ADD_R	add 	%r6, %r9, %r30
	.word 0xac02000e  ! 81: ADD_R	add 	%r8, %r14, %r22
	.word 0xb208e4be  ! 81: AND_I	and 	%r3, 0x04be, %r25
	.word 0xa4118009  ! 81: OR_R	or 	%r6, %r9, %r18
	.word 0xac110009  ! 81: OR_R	or 	%r4, %r9, %r22
	.word 0xa210c00b  ! 81: OR_R	or 	%r3, %r11, %r17
	.word 0xa40a2321  ! 81: AND_I	and 	%r8, 0x0321, %r18
	.word 0xe671ac10  ! 81: STX_I	stx	%r19, [%r6 + 0x0c10]
	.word 0xfe20ed88  ! 81: STW_I	stw	%r31, [%r3 + 0x0d88]
	.word 0xea29a294  ! 81: STB_I	stb	%r21, [%r6 + 0x0294]
	.word 0xee3167b0  ! 81: STH_I	sth	%r23, [%r5 + 0x07b0]
	.word 0xea70e458  ! 81: STX_I	stx	%r21, [%r3 + 0x0458]
thr0_irf_ce_2:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_2), 16, 16),2,IRF,ce,36,x, x,x,x, x,x,x)
	.word 0xea712500  ! 83: STX_I	stx	%r21, [%r4 + 0x0500]
!Illinst: trpm_alu
	.word 0xbf393921  ! 85: SRAX_I	srax	%r4, 0x0021, %r31
	.word 0xe6712820  ! 86: STX_I	stx	%r19, [%r4 + 0x0820]
	.word 0xe6212d70  ! 87: STW_I	stw	%r19, [%r4 + 0x0d70]
thr0_ic_err_2:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_2), 16, 16),3,IC_DATA,IR,14,x)
	.word 0xb24a0009  ! 90: MULX_R	mulx 	%r8, %r9, %r25
	.word 0xb8116702  ! 90: OR_I	or 	%r5, 0x0702, %r28
	.word 0xa6022423  ! 90: ADD_I	add 	%r8, 0x0423, %r19
	.word 0xb0092a6b  ! 90: AND_I	and 	%r4, 0x0a6b, %r24
	bne thr0_loop_5
	subcc %g1, 0x1, %g1
!Generating store_chunk_3
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr0_loop_6:
	.word 0xbe11400e  ! 99: OR_R	or 	%r5, %r14, %r31
	.word 0xa411000a  ! 99: OR_R	or 	%r4, %r10, %r18
	.word 0xa611000e  ! 99: OR_R	or 	%r4, %r14, %r19
	.word 0xa608ef7b  ! 99: AND_I	and 	%r3, 0x0f7b, %r19
	.word 0xb011e22b  ! 99: OR_I	or 	%r7, 0x022b, %r24
	.word 0xb801eadb  ! 99: ADD_I	add 	%r7, 0x0adb, %r28
	.word 0xb60a2ff0  ! 99: AND_I	and 	%r8, 0x0ff0, %r27
	.word 0xa609a006  ! 99: AND_I	and 	%r6, 0x0006, %r19
	.word 0xac09ae06  ! 99: AND_I	and 	%r6, 0x0e06, %r22
	.word 0xaa01400e  ! 99: ADD_R	add 	%r5, %r14, %r21
	.word 0xb011ac00  ! 99: OR_I	or 	%r6, 0x0c00, %r24
	.word 0xac118009  ! 99: OR_R	or 	%r6, %r9, %r22
	.word 0xbc112b9d  ! 99: OR_I	or 	%r4, 0x0b9d, %r30
	.word 0xa601800d  ! 99: ADD_R	add 	%r6, %r13, %r19
	.word 0xa401000d  ! 99: ADD_R	add 	%r4, %r13, %r18
	.word 0xbe08e291  ! 99: AND_I	and 	%r3, 0x0291, %r31
	.word 0xb8092a75  ! 99: AND_I	and 	%r4, 0x0a75, %r28
	.word 0xa801c00a  ! 99: ADD_R	add 	%r7, %r10, %r20
	.word 0xb411ae09  ! 99: OR_I	or 	%r6, 0x0e09, %r26
	.word 0xb611400b  ! 99: OR_R	or 	%r5, %r11, %r27
	.word 0xaa096b87  ! 99: AND_I	and 	%r5, 0x0b87, %r21
	.word 0xbe0a2917  ! 99: AND_I	and 	%r8, 0x0917, %r31
	.word 0xb411eee2  ! 99: OR_I	or 	%r7, 0x0ee2, %r26
	.word 0xaa00c00b  ! 99: ADD_R	add 	%r3, %r11, %r21
	.word 0xbc112259  ! 99: OR_I	or 	%r4, 0x0259, %r30
	.word 0xb801c00c  ! 99: ADD_R	add 	%r7, %r12, %r28
	.word 0xb809800c  ! 99: AND_R	and 	%r6, %r12, %r28
	.word 0xb812000c  ! 99: OR_R	or 	%r8, %r12, %r28
	.word 0xb001c00a  ! 99: ADD_R	add 	%r7, %r10, %r24
	.word 0xb2116ab0  ! 99: OR_I	or 	%r5, 0x0ab0, %r25
	.word 0xb608e691  ! 99: AND_I	and 	%r3, 0x0691, %r27
	.word 0xaa08c00e  ! 99: AND_R	and 	%r3, %r14, %r21
	.word 0xb008e899  ! 99: AND_I	and 	%r3, 0x0899, %r24
	.word 0xb20a000a  ! 99: AND_R	and 	%r8, %r10, %r25
	.word 0xa20228d2  ! 99: ADD_I	add 	%r8, 0x08d2, %r17
	.word 0xba00e5f6  ! 99: ADD_I	add 	%r3, 0x05f6, %r29
	.word 0xac116643  ! 99: OR_I	or 	%r5, 0x0643, %r22
	.word 0xba0128aa  ! 99: ADD_I	add 	%r4, 0x08aa, %r29
	.word 0xa80a000e  ! 99: AND_R	and 	%r8, %r14, %r20
	.word 0xa801000c  ! 99: ADD_R	add 	%r4, %r12, %r20
	.word 0xae11ec1c  ! 99: OR_I	or 	%r7, 0x0c1c, %r23
	.word 0xa80a2a20  ! 99: AND_I	and 	%r8, 0x0a20, %r20
	.word 0xb8122044  ! 99: OR_I	or 	%r8, 0x0044, %r28
	.word 0xaa112bbb  ! 99: OR_I	or 	%r4, 0x0bbb, %r21
	.word 0xb010c00b  ! 99: OR_R	or 	%r3, %r11, %r24
	.word 0xba08e572  ! 99: AND_I	and 	%r3, 0x0572, %r29
	.word 0xbe09e973  ! 99: AND_I	and 	%r7, 0x0973, %r31
	.word 0xbc01400a  ! 99: ADD_R	add 	%r5, %r10, %r30
	.word 0xb6022a51  ! 99: ADD_I	add 	%r8, 0x0a51, %r27
	.word 0xbc08e8fb  ! 99: AND_I	and 	%r3, 0x08fb, %r30
	.word 0xbe096384  ! 99: AND_I	and 	%r5, 0x0384, %r31
	.word 0xb601800b  ! 99: ADD_R	add 	%r6, %r11, %r27
	.word 0xb201800c  ! 99: ADD_R	add 	%r6, %r12, %r25
	.word 0xac02000c  ! 99: ADD_R	add 	%r8, %r12, %r22
	.word 0xae11000f  ! 99: OR_R	or 	%r4, %r15, %r23
	.word 0xb801c00a  ! 99: ADD_R	add 	%r7, %r10, %r28
	.word 0xb0116106  ! 99: OR_I	or 	%r5, 0x0106, %r24
	.word 0xa210c00f  ! 99: OR_R	or 	%r3, %r15, %r17
	.word 0xa60a000c  ! 99: AND_R	and 	%r8, %r12, %r19
	.word 0xaa11ea61  ! 99: OR_I	or 	%r7, 0x0a61, %r21
	.word 0xbe01c00e  ! 99: ADD_R	add 	%r7, %r14, %r31
	.word 0xb011a66b  ! 99: OR_I	or 	%r6, 0x066b, %r24
	.word 0xbe12000b  ! 99: OR_R	or 	%r8, %r11, %r31
	.word 0xb4022178  ! 99: ADD_I	add 	%r8, 0x0178, %r26
	.word 0xb60228e3  ! 99: ADD_I	add 	%r8, 0x08e3, %r27
	.word 0xb2122b21  ! 99: OR_I	or 	%r8, 0x0b21, %r25
	.word 0xb2012235  ! 99: ADD_I	add 	%r4, 0x0235, %r25
	.word 0xae09000e  ! 99: AND_R	and 	%r4, %r14, %r23
	.word 0xae09800d  ! 99: AND_R	and 	%r6, %r13, %r23
	.word 0xa211000f  ! 99: OR_R	or 	%r4, %r15, %r17
	.word 0xb2092455  ! 99: AND_I	and 	%r4, 0x0455, %r25
	.word 0xa8092b6d  ! 99: AND_I	and 	%r4, 0x0b6d, %r20
	.word 0xbc01800f  ! 99: ADD_R	add 	%r6, %r15, %r30
	.word 0xa212000e  ! 99: OR_R	or 	%r8, %r14, %r17
	.word 0xa210c00a  ! 99: OR_R	or 	%r3, %r10, %r17
	.word 0xbe00e15c  ! 99: ADD_I	add 	%r3, 0x015c, %r31
	.word 0xb2012e2b  ! 99: ADD_I	add 	%r4, 0x0e2b, %r25
	.word 0xbe096669  ! 99: AND_I	and 	%r5, 0x0669, %r31
	.word 0xa200c00b  ! 99: ADD_R	add 	%r3, %r11, %r17
	.word 0xb201eb7a  ! 99: ADD_I	add 	%r7, 0x0b7a, %r25
	.word 0xb200c00f  ! 99: ADD_R	add 	%r3, %r15, %r25
	.word 0xb808c00d  ! 99: AND_R	and 	%r3, %r13, %r28
	.word 0xb600e5ab  ! 99: ADD_I	add 	%r3, 0x05ab, %r27
	.word 0xbe09a7ce  ! 99: AND_I	and 	%r6, 0x07ce, %r31
	.word 0xb601c009  ! 99: ADD_R	add 	%r7, %r9, %r27
	.word 0xae01ec6d  ! 99: ADD_I	add 	%r7, 0x0c6d, %r23
	.word 0xbe122b06  ! 99: OR_I	or 	%r8, 0x0b06, %r31
	.word 0xb401a532  ! 99: ADD_I	add 	%r6, 0x0532, %r26
	.word 0xba08c00e  ! 99: AND_R	and 	%r3, %r14, %r29
	.word 0xb60126b1  ! 99: ADD_I	add 	%r4, 0x06b1, %r27
	.word 0xa401294e  ! 99: ADD_I	add 	%r4, 0x094e, %r18
	.word 0xb008e979  ! 99: AND_I	and 	%r3, 0x0979, %r24
	.word 0xb009000b  ! 99: AND_R	and 	%r4, %r11, %r24
	.word 0xb811209a  ! 99: OR_I	or 	%r4, 0x009a, %r28
	.word 0xbe00e428  ! 99: ADD_I	add 	%r3, 0x0428, %r31
	.word 0xb211a3e0  ! 99: OR_I	or 	%r6, 0x03e0, %r25
	.word 0xb411ef36  ! 99: OR_I	or 	%r7, 0x0f36, %r26
	.word 0xb200ee22  ! 99: ADD_I	add 	%r3, 0x0e22, %r25
	.word 0xac01800a  ! 99: ADD_R	add 	%r6, %r10, %r22
	.word 0xb401e810  ! 99: ADD_I	add 	%r7, 0x0810, %r26
	.word 0xa609c009  ! 99: AND_R	and 	%r7, %r9, %r19
	.word 0xa211a5ff  ! 99: OR_I	or 	%r6, 0x05ff, %r17
	.word 0xba11ae0e  ! 99: OR_I	or 	%r6, 0x0e0e, %r29
	.word 0xa60a2368  ! 99: AND_I	and 	%r8, 0x0368, %r19
	.word 0xba01000e  ! 99: ADD_R	add 	%r4, %r14, %r29
	.word 0xbe10eccb  ! 99: OR_I	or 	%r3, 0x0ccb, %r31
	.word 0xba09c00b  ! 99: AND_R	and 	%r7, %r11, %r29
	.word 0xaa11000e  ! 99: OR_R	or 	%r4, %r14, %r21
	.word 0xbe09000b  ! 99: AND_R	and 	%r4, %r11, %r31
	.word 0xb208c00c  ! 99: AND_R	and 	%r3, %r12, %r25
	.word 0xb202000e  ! 99: ADD_R	add 	%r8, %r14, %r25
	.word 0xa40a000a  ! 99: AND_R	and 	%r8, %r10, %r18
	.word 0xb811c00c  ! 99: OR_R	or 	%r7, %r12, %r28
	.word 0xaa09400a  ! 99: AND_R	and 	%r5, %r10, %r21
	.word 0xb401c00a  ! 99: ADD_R	add 	%r7, %r10, %r26
	.word 0xbe01efb3  ! 99: ADD_I	add 	%r7, 0x0fb3, %r31
	.word 0xae0a2ab3  ! 99: AND_I	and 	%r8, 0x0ab3, %r23
	.word 0xb609000d  ! 99: AND_R	and 	%r4, %r13, %r27
	.word 0xb611800e  ! 99: OR_R	or 	%r6, %r14, %r27
	.word 0xaa01c00b  ! 99: ADD_R	add 	%r7, %r11, %r21
	.word 0xba122cad  ! 99: OR_I	or 	%r8, 0x0cad, %r29
	.word 0xb6118009  ! 99: OR_R	or 	%r6, %r9, %r27
	.word 0xbe10c00d  ! 99: OR_R	or 	%r3, %r13, %r31
	.word 0xbe120009  ! 99: OR_R	or 	%r8, %r9, %r31
	.word 0xb808e750  ! 99: AND_I	and 	%r3, 0x0750, %r28
	.word 0xa609800b  ! 99: AND_R	and 	%r6, %r11, %r19
	.word 0xb409800b  ! 99: AND_R	and 	%r6, %r11, %r26
	.word 0xa209efa1  ! 99: AND_I	and 	%r7, 0x0fa1, %r17
	.word 0xa800e61a  ! 99: ADD_I	add 	%r3, 0x061a, %r20
	.word 0xa409800d  ! 99: AND_R	and 	%r6, %r13, %r18
	.word 0xb8122787  ! 99: OR_I	or 	%r8, 0x0787, %r28
	.word 0xa20a000a  ! 99: AND_R	and 	%r8, %r10, %r17
	.word 0xa609eeb6  ! 99: AND_I	and 	%r7, 0x0eb6, %r19
	.word 0xbe08e0b4  ! 99: AND_I	and 	%r3, 0x00b4, %r31
	.word 0xaa11400c  ! 99: OR_R	or 	%r5, %r12, %r21
	.word 0xbe018009  ! 99: ADD_R	add 	%r6, %r9, %r31
	.word 0xb211ac1e  ! 99: OR_I	or 	%r6, 0x0c1e, %r25
	.word 0xb208ead0  ! 99: AND_I	and 	%r3, 0x0ad0, %r25
	.word 0xb40a0009  ! 99: AND_R	and 	%r8, %r9, %r26
	.word 0xa211678c  ! 99: OR_I	or 	%r5, 0x078c, %r17
	.word 0xa8120009  ! 99: OR_R	or 	%r8, %r9, %r20
	.word 0xae11a5d0  ! 99: OR_I	or 	%r6, 0x05d0, %r23
	.word 0xa2016aa5  ! 99: ADD_I	add 	%r5, 0x0aa5, %r17
	.word 0xae11800d  ! 99: OR_R	or 	%r6, %r13, %r23
	.word 0xba096f72  ! 99: AND_I	and 	%r5, 0x0f72, %r29
	.word 0xa6016a73  ! 99: ADD_I	add 	%r5, 0x0a73, %r19
	.word 0xae0229a9  ! 99: ADD_I	add 	%r8, 0x09a9, %r23
	.word 0xbc11c009  ! 99: OR_R	or 	%r7, %r9, %r30
	.word 0xbe09eff4  ! 99: AND_I	and 	%r7, 0x0ff4, %r31
	.word 0xa208ea2a  ! 99: AND_I	and 	%r3, 0x0a2a, %r17
	.word 0xb602000d  ! 99: ADD_R	add 	%r8, %r13, %r27
	.word 0xac01000d  ! 99: ADD_R	add 	%r4, %r13, %r22
	.word 0xb2022634  ! 99: ADD_I	add 	%r8, 0x0634, %r25
	.word 0xb411c00b  ! 99: OR_R	or 	%r7, %r11, %r26
	.word 0xb809a2c3  ! 99: AND_I	and 	%r6, 0x02c3, %r28
	.word 0xbe08ea5c  ! 99: AND_I	and 	%r3, 0x0a5c, %r31
	.word 0xa602000c  ! 99: ADD_R	add 	%r8, %r12, %r19
	.word 0xbe01800f  ! 99: ADD_R	add 	%r6, %r15, %r31
	.word 0xa209c00f  ! 99: AND_R	and 	%r7, %r15, %r17
	.word 0xbe09800d  ! 99: AND_R	and 	%r6, %r13, %r31
	.word 0xb61164c1  ! 99: OR_I	or 	%r5, 0x04c1, %r27
	.word 0xb809eac0  ! 99: AND_I	and 	%r7, 0x0ac0, %r28
	.word 0xb201800b  ! 99: ADD_R	add 	%r6, %r11, %r25
	.word 0xae0222cf  ! 99: ADD_I	add 	%r8, 0x02cf, %r23
	.word 0xbc09000e  ! 99: AND_R	and 	%r4, %r14, %r30
	.word 0xae08e189  ! 99: AND_I	and 	%r3, 0x0189, %r23
	.word 0xa411800a  ! 99: OR_R	or 	%r6, %r10, %r18
	.word 0xb409611e  ! 99: AND_I	and 	%r5, 0x011e, %r26
	.word 0xa4022d14  ! 99: ADD_I	add 	%r8, 0x0d14, %r18
	.word 0xa411800f  ! 99: OR_R	or 	%r6, %r15, %r18
	.word 0xb2096ede  ! 99: AND_I	and 	%r5, 0x0ede, %r25
	.word 0xa2112a6d  ! 99: OR_I	or 	%r4, 0x0a6d, %r17
	.word 0xba09800e  ! 99: AND_R	and 	%r6, %r14, %r29
	.word 0xae01ed0b  ! 99: ADD_I	add 	%r7, 0x0d0b, %r23
	.word 0xb0010009  ! 99: ADD_R	add 	%r4, %r9, %r24
	.word 0xac01ec5f  ! 99: ADD_I	add 	%r7, 0x0c5f, %r22
	.word 0xba11c00f  ! 99: OR_R	or 	%r7, %r15, %r29
	.word 0xa211c00b  ! 99: OR_R	or 	%r7, %r11, %r17
	.word 0xb211627e  ! 99: OR_I	or 	%r5, 0x027e, %r25
	.word 0xba022e58  ! 99: ADD_I	add 	%r8, 0x0e58, %r29
	.word 0xa2014009  ! 99: ADD_R	add 	%r5, %r9, %r17
	.word 0xb00a000c  ! 99: AND_R	and 	%r8, %r12, %r24
	.word 0xa208e1c0  ! 99: AND_I	and 	%r3, 0x01c0, %r17
	.word 0xbc01800a  ! 99: ADD_R	add 	%r6, %r10, %r30
	.word 0xa601400f  ! 99: ADD_R	add 	%r5, %r15, %r19
	.word 0xb600c00c  ! 99: ADD_R	add 	%r3, %r12, %r27
	.word 0xa401000c  ! 99: ADD_R	add 	%r4, %r12, %r18
	.word 0xb6012428  ! 99: ADD_I	add 	%r4, 0x0428, %r27
	.word 0xb8110009  ! 99: OR_R	or 	%r4, %r9, %r28
	.word 0xb411c00c  ! 99: OR_R	or 	%r7, %r12, %r26
	.word 0xb61128e9  ! 99: OR_I	or 	%r4, 0x08e9, %r27
	.word 0xac022c6a  ! 99: ADD_I	add 	%r8, 0x0c6a, %r22
	.word 0xa411400b  ! 99: OR_R	or 	%r5, %r11, %r18
	.word 0xb401800c  ! 99: ADD_R	add 	%r6, %r12, %r26
	.word 0xa811a5f5  ! 99: OR_I	or 	%r6, 0x05f5, %r20
	.word 0xa409c00d  ! 99: AND_R	and 	%r7, %r13, %r18
	.word 0xb8110009  ! 99: OR_R	or 	%r4, %r9, %r28
	.word 0xbc0a000a  ! 99: AND_R	and 	%r8, %r10, %r30
	.word 0xa6016ab7  ! 99: ADD_I	add 	%r5, 0x0ab7, %r19
	.word 0xa412232d  ! 99: OR_I	or 	%r8, 0x032d, %r18
	.word 0xb00a000e  ! 99: AND_R	and 	%r8, %r14, %r24
	.word 0xb009400b  ! 99: AND_R	and 	%r5, %r11, %r24
	.word 0xae00eb41  ! 99: ADD_I	add 	%r3, 0x0b41, %r23
	.word 0xbe08c00a  ! 99: AND_R	and 	%r3, %r10, %r31
	.word 0xba08c00d  ! 99: AND_R	and 	%r3, %r13, %r29
	.word 0xa810e0e3  ! 99: OR_I	or 	%r3, 0x00e3, %r20
	.word 0xa801000c  ! 99: ADD_R	add 	%r4, %r12, %r20
	.word 0xfc21ef48  ! 99: STW_I	stw	%r30, [%r7 + 0x0f48]
	.word 0xfe30eb66  ! 99: STH_I	sth	%r31, [%r3 + 0x0b66]
	.word 0xe271a0e8  ! 99: STX_I	stx	%r17, [%r6 + 0x00e8]
	.word 0xe470eb20  ! 99: STX_I	stx	%r18, [%r3 + 0x0b20]
	.word 0xf63162f0  ! 99: STH_I	sth	%r27, [%r5 + 0x02f0]
	.word 0xf071ea50  ! 99: STX_I	stx	%r24, [%r7 + 0x0a50]
	.word 0xf828e444  ! 99: STB_I	stb	%r28, [%r3 + 0x0444]
	.word 0xf800c009  ! 99: LDUW_R	lduw	[%r3 + %r9], %r28
	.word 0xc0f00982  ! 101: STXA_R	stxa	%r0, [%r0 + %r2] 0x4c
thr0_ic_err_3:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_3), 16, 16),2,IC_DATA,IR,18,x)
	.word 0xfc992938  ! 104: LDDA_I	ldda	[%r4, + 0x0938] %asi, %r30
	.word 0xb80a0009  ! 104: AND_R	and 	%r8, %r9, %r28
	.word 0xb411e4ca  ! 104: OR_I	or 	%r7, 0x04ca, %r26
	setx  0x0000000000000370, %r16, %r9
	bne thr0_loop_6
	subcc %g1, 0x1, %g1
!Generating store_chunk_2
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr0_loop_7:
	.word 0xa801c00a  ! 112: ADD_R	add 	%r7, %r10, %r20
	.word 0xa20125e9  ! 112: ADD_I	add 	%r4, 0x05e9, %r17
	.word 0xbe01800d  ! 112: ADD_R	add 	%r6, %r13, %r31
	.word 0xaa01e9f3  ! 112: ADD_I	add 	%r7, 0x09f3, %r21
	.word 0xa409c00a  ! 112: AND_R	and 	%r7, %r10, %r18
	.word 0xb409a60c  ! 112: AND_I	and 	%r6, 0x060c, %r26
	.word 0xb411e71a  ! 112: OR_I	or 	%r7, 0x071a, %r26
	.word 0xb801c00e  ! 112: ADD_R	add 	%r7, %r14, %r28
	.word 0xa8012ea7  ! 112: ADD_I	add 	%r4, 0x0ea7, %r20
	.word 0xa8122e41  ! 112: OR_I	or 	%r8, 0x0e41, %r20
	.word 0xaa09c00d  ! 112: AND_R	and 	%r7, %r13, %r21
	.word 0xac11abed  ! 112: OR_I	or 	%r6, 0x0bed, %r22
	.word 0xbc01c00b  ! 112: ADD_R	add 	%r7, %r11, %r30
	.word 0xac11c00b  ! 112: OR_R	or 	%r7, %r11, %r22
	.word 0xae122fa6  ! 112: OR_I	or 	%r8, 0x0fa6, %r23
	.word 0xb201800b  ! 112: ADD_R	add 	%r6, %r11, %r25
	.word 0xb200e049  ! 112: ADD_I	add 	%r3, 0x0049, %r25
	.word 0xa409400b  ! 112: AND_R	and 	%r5, %r11, %r18
	.word 0xa2012104  ! 112: ADD_I	add 	%r4, 0x0104, %r17
	.word 0xa209800d  ! 112: AND_R	and 	%r6, %r13, %r17
	.word 0xb801e89a  ! 112: ADD_I	add 	%r7, 0x089a, %r28
	.word 0xba09c009  ! 112: AND_R	and 	%r7, %r9, %r29
	.word 0xb6122666  ! 112: OR_I	or 	%r8, 0x0666, %r27
	.word 0xbe01000d  ! 112: ADD_R	add 	%r4, %r13, %r31
	.word 0xb810c009  ! 112: OR_R	or 	%r3, %r9, %r28
	.word 0xb801245f  ! 112: ADD_I	add 	%r4, 0x045f, %r28
	.word 0xbe01800b  ! 112: ADD_R	add 	%r6, %r11, %r31
	.word 0xa208e099  ! 112: AND_I	and 	%r3, 0x0099, %r17
	.word 0xac01a712  ! 112: ADD_I	add 	%r6, 0x0712, %r22
	.word 0xa212000f  ! 112: OR_R	or 	%r8, %r15, %r17
	.word 0xaa02000d  ! 112: ADD_R	add 	%r8, %r13, %r21
	.word 0xba00ed15  ! 112: ADD_I	add 	%r3, 0x0d15, %r29
	.word 0xa812214b  ! 112: OR_I	or 	%r8, 0x014b, %r20
	.word 0xbe022179  ! 112: ADD_I	add 	%r8, 0x0179, %r31
	.word 0xa209e833  ! 112: AND_I	and 	%r7, 0x0833, %r17
	.word 0xa202259d  ! 112: ADD_I	add 	%r8, 0x059d, %r17
	.word 0xb809286e  ! 112: AND_I	and 	%r4, 0x086e, %r28
	.word 0xb808c00c  ! 112: AND_R	and 	%r3, %r12, %r28
	.word 0xb409a6e9  ! 112: AND_I	and 	%r6, 0x06e9, %r26
	.word 0xac01400e  ! 112: ADD_R	add 	%r5, %r14, %r22
	.word 0xb412000c  ! 112: OR_R	or 	%r8, %r12, %r26
	.word 0xbe09800a  ! 112: AND_R	and 	%r6, %r10, %r31
	.word 0xa801400a  ! 112: ADD_R	add 	%r5, %r10, %r20
	.word 0xa408e6af  ! 112: AND_I	and 	%r3, 0x06af, %r18
	.word 0xa40160f1  ! 112: ADD_I	add 	%r5, 0x00f1, %r18
	.word 0xb811690c  ! 112: OR_I	or 	%r5, 0x090c, %r28
	.word 0xb60a2b65  ! 112: AND_I	and 	%r8, 0x0b65, %r27
	.word 0xb808c00a  ! 112: AND_R	and 	%r3, %r10, %r28
	.word 0xa60a000e  ! 112: AND_R	and 	%r8, %r14, %r19
	.word 0xb40a2e08  ! 112: AND_I	and 	%r8, 0x0e08, %r26
	.word 0xbe10ee88  ! 112: OR_I	or 	%r3, 0x0e88, %r31
	.word 0xa201400b  ! 112: ADD_R	add 	%r5, %r11, %r17
	.word 0xa6092215  ! 112: AND_I	and 	%r4, 0x0215, %r19
	.word 0xbc00c00d  ! 112: ADD_R	add 	%r3, %r13, %r30
	.word 0xa409ee24  ! 112: AND_I	and 	%r7, 0x0e24, %r18
	.word 0xb811ecd3  ! 112: OR_I	or 	%r7, 0x0cd3, %r28
	.word 0xa601eeda  ! 112: ADD_I	add 	%r7, 0x0eda, %r19
	.word 0xbe11c00f  ! 112: OR_R	or 	%r7, %r15, %r31
	.word 0xba08e14b  ! 112: AND_I	and 	%r3, 0x014b, %r29
	.word 0xac11a0f8  ! 112: OR_I	or 	%r6, 0x00f8, %r22
	.word 0xb20224d2  ! 112: ADD_I	add 	%r8, 0x04d2, %r25
	.word 0xb609400e  ! 112: AND_R	and 	%r5, %r14, %r27
	.word 0xa80a2042  ! 112: AND_I	and 	%r8, 0x0042, %r20
	.word 0xac01ec1e  ! 112: ADD_I	add 	%r7, 0x0c1e, %r22
	.word 0xae110009  ! 112: OR_R	or 	%r4, %r9, %r23
	.word 0xb201400c  ! 112: ADD_R	add 	%r5, %r12, %r25
	.word 0xa411c009  ! 112: OR_R	or 	%r7, %r9, %r18
	.word 0xae09a393  ! 112: AND_I	and 	%r6, 0x0393, %r23
	.word 0xb000e838  ! 112: ADD_I	add 	%r3, 0x0838, %r24
	.word 0xa4122465  ! 112: OR_I	or 	%r8, 0x0465, %r18
	.word 0xbc01675a  ! 112: ADD_I	add 	%r5, 0x075a, %r30
	.word 0xb812000e  ! 112: OR_R	or 	%r8, %r14, %r28
	.word 0xba10ed45  ! 112: OR_I	or 	%r3, 0x0d45, %r29
	.word 0xbc096b8c  ! 112: AND_I	and 	%r5, 0x0b8c, %r30
	.word 0xa4094009  ! 112: AND_R	and 	%r5, %r9, %r18
	.word 0xa410c00d  ! 112: OR_R	or 	%r3, %r13, %r18
	.word 0xae0a0009  ! 112: AND_R	and 	%r8, %r9, %r23
	.word 0xb409800d  ! 112: AND_R	and 	%r6, %r13, %r26
	.word 0xa2016a0d  ! 112: ADD_I	add 	%r5, 0x0a0d, %r17
	.word 0xba09800c  ! 112: AND_R	and 	%r6, %r12, %r29
	.word 0xae08e485  ! 112: AND_I	and 	%r3, 0x0485, %r23
	.word 0xa209a66e  ! 112: AND_I	and 	%r6, 0x066e, %r17
	.word 0xae1220dd  ! 112: OR_I	or 	%r8, 0x00dd, %r23
	.word 0xba00c009  ! 112: ADD_R	add 	%r3, %r9, %r29
	.word 0xa41160bc  ! 112: OR_I	or 	%r5, 0x00bc, %r18
	.word 0xa600c00e  ! 112: ADD_R	add 	%r3, %r14, %r19
	.word 0xb8116759  ! 112: OR_I	or 	%r5, 0x0759, %r28
	.word 0xa411400b  ! 112: OR_R	or 	%r5, %r11, %r18
	.word 0xac112c43  ! 112: OR_I	or 	%r4, 0x0c43, %r22
	.word 0xb401c00f  ! 112: ADD_R	add 	%r7, %r15, %r26
	.word 0xbe016c43  ! 112: ADD_I	add 	%r5, 0x0c43, %r31
	.word 0xb00a2a06  ! 112: AND_I	and 	%r8, 0x0a06, %r24
	.word 0xa401800e  ! 112: ADD_R	add 	%r6, %r14, %r18
	.word 0xba11ecef  ! 112: OR_I	or 	%r7, 0x0cef, %r29
	.word 0xa411400e  ! 112: OR_R	or 	%r5, %r14, %r18
	.word 0xa400eccb  ! 112: ADD_I	add 	%r3, 0x0ccb, %r18
	.word 0xa809c00e  ! 112: AND_R	and 	%r7, %r14, %r20
	.word 0xa601c00a  ! 112: ADD_R	add 	%r7, %r10, %r19
	.word 0xa401000c  ! 112: ADD_R	add 	%r4, %r12, %r18
	.word 0xaa01ef88  ! 112: ADD_I	add 	%r7, 0x0f88, %r21
	.word 0xbc01e28f  ! 112: ADD_I	add 	%r7, 0x028f, %r30
	.word 0xac0a000c  ! 112: AND_R	and 	%r8, %r12, %r22
	.word 0xa2020009  ! 112: ADD_R	add 	%r8, %r9, %r17
	.word 0xbe09ec1e  ! 112: AND_I	and 	%r7, 0x0c1e, %r31
	.word 0xb410e651  ! 112: OR_I	or 	%r3, 0x0651, %r26
	.word 0xbe11400e  ! 112: OR_R	or 	%r5, %r14, %r31
	.word 0xb609800b  ! 112: AND_R	and 	%r6, %r11, %r27
	.word 0xb40a2e0b  ! 112: AND_I	and 	%r8, 0x0e0b, %r26
	.word 0xae01800f  ! 112: ADD_R	add 	%r6, %r15, %r23
	.word 0xb4122191  ! 112: OR_I	or 	%r8, 0x0191, %r26
	.word 0xe821a0ec  ! 112: STW_I	stw	%r20, [%r6 + 0x00ec]
	.word 0xf629e4cf  ! 112: STB_I	stb	%r27, [%r7 + 0x04cf]
	.word 0xe831e558  ! 112: STH_I	sth	%r20, [%r7 + 0x0558]
	.word 0xfc296724  ! 112: STB_I	stb	%r30, [%r5 + 0x0724]
	.word 0xe829a7a3  ! 112: STB_I	stb	%r20, [%r6 + 0x07a3]
	.word 0xf821e860  ! 112: STW_I	stw	%r28, [%r7 + 0x0860]
	.word 0xea722f88  ! 112: STX_I	stx	%r21, [%r8 + 0x0f88]
!Illinst
	.word 0xb1395b69  ! 114: SRAX_R	srax	%r5, %r9, %r24
	.word 0xf3216d9c  ! 115: STF_I	st	%f25, [0x0d9c, %r5]
thr0_ic_err_4:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_4), 16, 16),3,IC_DATA,IR,9,x)
	.word 0xe339000a  ! 119: STDF_R	std	%f17, [%r10, %r4]
	.word 0xb009400a  ! 119: AND_R	and 	%r5, %r10, %r24
	.word 0xb211a5e7  ! 119: OR_I	or 	%r6, 0x05e7, %r25
	.word 0xb809617b  ! 119: AND_I	and 	%r5, 0x017b, %r28
	bne thr0_loop_7
	subcc %g1, 0x1, %g1
!Generating store_chunk_3
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr0_loop_8:
	.word 0xac08ea91  ! 128: AND_I	and 	%r3, 0x0a91, %r22
	.word 0xaa122422  ! 128: OR_I	or 	%r8, 0x0422, %r21
	.word 0xa209ae56  ! 128: AND_I	and 	%r6, 0x0e56, %r17
	.word 0xb601c00a  ! 128: ADD_R	add 	%r7, %r10, %r27
	.word 0xac01800a  ! 128: ADD_R	add 	%r6, %r10, %r22
	.word 0xac01e909  ! 128: ADD_I	add 	%r7, 0x0909, %r22
	.word 0xb40a000d  ! 128: AND_R	and 	%r8, %r13, %r26
	.word 0xb209c00e  ! 128: AND_R	and 	%r7, %r14, %r25
	.word 0xbc11a903  ! 128: OR_I	or 	%r6, 0x0903, %r30
	.word 0xb60a2c1e  ! 128: AND_I	and 	%r8, 0x0c1e, %r27
	.word 0xbc0165c9  ! 128: ADD_I	add 	%r5, 0x05c9, %r30
	.word 0xa80a000e  ! 128: AND_R	and 	%r8, %r14, %r20
	.word 0xbc112dd5  ! 128: OR_I	or 	%r4, 0x0dd5, %r30
	.word 0xb209800e  ! 128: AND_R	and 	%r6, %r14, %r25
	.word 0xaa1164f4  ! 128: OR_I	or 	%r5, 0x04f4, %r21
	.word 0xb8122b0d  ! 128: OR_I	or 	%r8, 0x0b0d, %r28
	.word 0xbc0a0009  ! 128: AND_R	and 	%r8, %r9, %r30
	.word 0xbe11400f  ! 128: OR_R	or 	%r5, %r15, %r31
	.word 0xac09000f  ! 128: AND_R	and 	%r4, %r15, %r22
	.word 0xa81124a0  ! 128: OR_I	or 	%r4, 0x04a0, %r20
	.word 0xb200c00e  ! 128: ADD_R	add 	%r3, %r14, %r25
	.word 0xaa0227ff  ! 128: ADD_I	add 	%r8, 0x07ff, %r21
	.word 0xa611c00a  ! 128: OR_R	or 	%r7, %r10, %r19
	.word 0xa812000a  ! 128: OR_R	or 	%r8, %r10, %r20
	.word 0xa410eae2  ! 128: OR_I	or 	%r3, 0x0ae2, %r18
	.word 0xb4022a09  ! 128: ADD_I	add 	%r8, 0x0a09, %r26
	.word 0xae11a665  ! 128: OR_I	or 	%r6, 0x0665, %r23
	.word 0xbc020009  ! 128: ADD_R	add 	%r8, %r9, %r30
	.word 0xba116c10  ! 128: OR_I	or 	%r5, 0x0c10, %r29
	.word 0xaa09800e  ! 128: AND_R	and 	%r6, %r14, %r21
	.word 0xb801800b  ! 128: ADD_R	add 	%r6, %r11, %r28
	.word 0xa209c00c  ! 128: AND_R	and 	%r7, %r12, %r17
	.word 0xbc08c00a  ! 128: AND_R	and 	%r3, %r10, %r30
	.word 0xb6096129  ! 128: AND_I	and 	%r5, 0x0129, %r27
	.word 0xa608e427  ! 128: AND_I	and 	%r3, 0x0427, %r19
	.word 0xbe01c009  ! 128: ADD_R	add 	%r7, %r9, %r31
	.word 0xb600e213  ! 128: ADD_I	add 	%r3, 0x0213, %r27
	.word 0xa801c00b  ! 128: ADD_R	add 	%r7, %r11, %r20
	.word 0xb800e0f3  ! 128: ADD_I	add 	%r3, 0x00f3, %r28
	.word 0xac022bb4  ! 128: ADD_I	add 	%r8, 0x0bb4, %r22
	.word 0xbe0a2f6a  ! 128: AND_I	and 	%r8, 0x0f6a, %r31
	.word 0xb40965f2  ! 128: AND_I	and 	%r5, 0x05f2, %r26
	.word 0xa4022282  ! 128: ADD_I	add 	%r8, 0x0282, %r18
	.word 0xbc08e01a  ! 128: AND_I	and 	%r3, 0x001a, %r30
	.word 0xa401400c  ! 128: ADD_R	add 	%r5, %r12, %r18
	.word 0xb611eaf0  ! 128: OR_I	or 	%r7, 0x0af0, %r27
	.word 0xb4092aab  ! 128: AND_I	and 	%r4, 0x0aab, %r26
	.word 0xac01c00f  ! 128: ADD_R	add 	%r7, %r15, %r22
	.word 0xb201400b  ! 128: ADD_R	add 	%r5, %r11, %r25
	.word 0xa60a000f  ! 128: AND_R	and 	%r8, %r15, %r19
	.word 0xb409000f  ! 128: AND_R	and 	%r4, %r15, %r26
	.word 0xba00eaf8  ! 128: ADD_I	add 	%r3, 0x0af8, %r29
	.word 0xbc11000a  ! 128: OR_R	or 	%r4, %r10, %r30
	.word 0xba09800a  ! 128: AND_R	and 	%r6, %r10, %r29
	.word 0xb802000c  ! 128: ADD_R	add 	%r8, %r12, %r28
	.word 0xa211a62a  ! 128: OR_I	or 	%r6, 0x062a, %r17
	.word 0xbe09800d  ! 128: AND_R	and 	%r6, %r13, %r31
	.word 0xb408c00c  ! 128: AND_R	and 	%r3, %r12, %r26
	.word 0xa211a696  ! 128: OR_I	or 	%r6, 0x0696, %r17
	.word 0xb810e1ce  ! 128: OR_I	or 	%r3, 0x01ce, %r28
	.word 0xa408c00d  ! 128: AND_R	and 	%r3, %r13, %r18
	.word 0xb201ee75  ! 128: ADD_I	add 	%r7, 0x0e75, %r25
	.word 0xa812000a  ! 128: OR_R	or 	%r8, %r10, %r20
	.word 0xb01169df  ! 128: OR_I	or 	%r5, 0x09df, %r24
	.word 0xba098009  ! 128: AND_R	and 	%r6, %r9, %r29
	.word 0xa61128b4  ! 128: OR_I	or 	%r4, 0x08b4, %r19
	.word 0xac01c009  ! 128: ADD_R	add 	%r7, %r9, %r22
	.word 0xb411800a  ! 128: OR_R	or 	%r6, %r10, %r26
	.word 0xb6110009  ! 128: OR_R	or 	%r4, %r9, %r27
	.word 0xb011800d  ! 128: OR_R	or 	%r6, %r13, %r24
	.word 0xa601e1f0  ! 128: ADD_I	add 	%r7, 0x01f0, %r19
	.word 0xb61162d9  ! 128: OR_I	or 	%r5, 0x02d9, %r27
	.word 0xa811800b  ! 128: OR_R	or 	%r6, %r11, %r20
	.word 0xb202000a  ! 128: ADD_R	add 	%r8, %r10, %r25
	.word 0xa609a5da  ! 128: AND_I	and 	%r6, 0x05da, %r19
	.word 0xa401c00d  ! 128: ADD_R	add 	%r7, %r13, %r18
	.word 0xac10e1aa  ! 128: OR_I	or 	%r3, 0x01aa, %r22
	.word 0xbe08c009  ! 128: AND_R	and 	%r3, %r9, %r31
	.word 0xa8096354  ! 128: AND_I	and 	%r5, 0x0354, %r20
	.word 0xa4016001  ! 128: ADD_I	add 	%r5, 0x0001, %r18
	.word 0xb810c00c  ! 128: OR_R	or 	%r3, %r12, %r28
	.word 0xac11eee9  ! 128: OR_I	or 	%r7, 0x0ee9, %r22
	.word 0xac12000d  ! 128: OR_R	or 	%r8, %r13, %r22
	.word 0xa808c00e  ! 128: AND_R	and 	%r3, %r14, %r20
	.word 0xa40a2f81  ! 128: AND_I	and 	%r8, 0x0f81, %r18
	.word 0xac00c00a  ! 128: ADD_R	add 	%r3, %r10, %r22
	.word 0xb001220d  ! 128: ADD_I	add 	%r4, 0x020d, %r24
	.word 0xb411289c  ! 128: OR_I	or 	%r4, 0x089c, %r26
	.word 0xb409000f  ! 128: AND_R	and 	%r4, %r15, %r26
	.word 0xac098009  ! 128: AND_R	and 	%r6, %r9, %r22
	.word 0xb81228f6  ! 128: OR_I	or 	%r8, 0x08f6, %r28
	.word 0xb808c009  ! 128: AND_R	and 	%r3, %r9, %r28
	.word 0xb409000b  ! 128: AND_R	and 	%r4, %r11, %r26
	.word 0xae09800e  ! 128: AND_R	and 	%r6, %r14, %r23
	.word 0xae00eafe  ! 128: ADD_I	add 	%r3, 0x0afe, %r23
	.word 0xee30eac8  ! 128: STH_I	sth	%r23, [%r3 + 0x0ac8]
	.word 0xf230efc4  ! 128: STH_I	sth	%r25, [%r3 + 0x0fc4]
	.word 0xe8312a8a  ! 128: STH_I	sth	%r20, [%r4 + 0x0a8a]
	.word 0xfe21ec54  ! 128: STW_I	stw	%r31, [%r7 + 0x0c54]
	.word 0xfe71e768  ! 128: STX_I	stx	%r31, [%r7 + 0x0768]
	.word 0xf021a7ec  ! 128: STW_I	stw	%r24, [%r6 + 0x07ec]
	.word 0xee22205c  ! 128: STW_I	stw	%r23, [%r8 + 0x005c]
	.word 0xee1a0009  ! 128: LDD_R	ldd	[%r8 + %r9], %r23
	.word 0xc0f00982  ! 130: STXA_R	stxa	%r0, [%r0 + %r2] 0x4c
thr0_ic_err_5:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_5), 16, 16),2,IC_DATA,IR,13,x)
	setx  0x0000000000000550, %r16, %r11
	.word 0xb609000d  ! 133: AND_R	and 	%r4, %r13, %r27
	.word 0xbc01800e  ! 133: ADD_R	add 	%r6, %r14, %r30
	setx  0x0000000000000dc0, %r16, %r9
	bne thr0_loop_8
	subcc %g1, 0x1, %g1
!Generating store_chunk_1
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr0_loop_9:
	.word 0xb0010009  ! 139: ADD_R	add 	%r4, %r9, %r24
	.word 0xb210c00d  ! 139: OR_R	or 	%r3, %r13, %r25
	.word 0xb408e839  ! 139: AND_I	and 	%r3, 0x0839, %r26
	.word 0xb600ed58  ! 139: ADD_I	add 	%r3, 0x0d58, %r27
	.word 0xb2012144  ! 139: ADD_I	add 	%r4, 0x0144, %r25
	.word 0xa8010009  ! 139: ADD_R	add 	%r4, %r9, %r20
	.word 0xb8122644  ! 139: OR_I	or 	%r8, 0x0644, %r28
	.word 0xbc0a0009  ! 139: AND_R	and 	%r8, %r9, %r30
	.word 0xb409e09a  ! 139: AND_I	and 	%r7, 0x009a, %r26
	.word 0xa8096e92  ! 139: AND_I	and 	%r5, 0x0e92, %r20
	.word 0xb400ea3a  ! 139: ADD_I	add 	%r3, 0x0a3a, %r26
	.word 0xaa11e4be  ! 139: OR_I	or 	%r7, 0x04be, %r21
	.word 0xa8016ce2  ! 139: ADD_I	add 	%r5, 0x0ce2, %r20
	.word 0xa600c00b  ! 139: ADD_R	add 	%r3, %r11, %r19
	.word 0xaa11400c  ! 139: OR_R	or 	%r5, %r12, %r21
	.word 0xbc11aec6  ! 139: OR_I	or 	%r6, 0x0ec6, %r30
	.word 0xba012a7a  ! 139: ADD_I	add 	%r4, 0x0a7a, %r29
	.word 0xa209a865  ! 139: AND_I	and 	%r6, 0x0865, %r17
	.word 0xb40a000c  ! 139: AND_R	and 	%r8, %r12, %r26
	.word 0xa801e596  ! 139: ADD_I	add 	%r7, 0x0596, %r20
	.word 0xb609800b  ! 139: AND_R	and 	%r6, %r11, %r27
	.word 0xa811aad0  ! 139: OR_I	or 	%r6, 0x0ad0, %r20
	.word 0xac00e35b  ! 139: ADD_I	add 	%r3, 0x035b, %r22
	.word 0xb401000a  ! 139: ADD_R	add 	%r4, %r10, %r26
	.word 0xa611ae13  ! 139: OR_I	or 	%r6, 0x0e13, %r19
	.word 0xac02000e  ! 139: ADD_R	add 	%r8, %r14, %r22
	.word 0xa20a2da0  ! 139: AND_I	and 	%r8, 0x0da0, %r17
	.word 0xb2020009  ! 139: ADD_R	add 	%r8, %r9, %r25
	.word 0xae01800f  ! 139: ADD_R	add 	%r6, %r15, %r23
	.word 0xbe096338  ! 139: AND_I	and 	%r5, 0x0338, %r31
	.word 0xb011c009  ! 139: OR_R	or 	%r7, %r9, %r24
	.word 0xa610e188  ! 139: OR_I	or 	%r3, 0x0188, %r19
	.word 0xaa020009  ! 139: ADD_R	add 	%r8, %r9, %r21
	.word 0xb6112dea  ! 139: OR_I	or 	%r4, 0x0dea, %r27
	.word 0xb409c00e  ! 139: AND_R	and 	%r7, %r14, %r26
	.word 0xaa09c00e  ! 139: AND_R	and 	%r7, %r14, %r21
	.word 0xb401000f  ! 139: ADD_R	add 	%r4, %r15, %r26
	.word 0xbe11a5c5  ! 139: OR_I	or 	%r6, 0x05c5, %r31
	.word 0xbc00e308  ! 139: ADD_I	add 	%r3, 0x0308, %r30
	.word 0xb211400e  ! 139: OR_R	or 	%r5, %r14, %r25
	.word 0xa4112f0b  ! 139: OR_I	or 	%r4, 0x0f0b, %r18
	.word 0xb208edcf  ! 139: AND_I	and 	%r3, 0x0dcf, %r25
	.word 0xa211e050  ! 139: OR_I	or 	%r7, 0x0050, %r17
	.word 0xba10c00f  ! 139: OR_R	or 	%r3, %r15, %r29
	.word 0xbe01000f  ! 139: ADD_R	add 	%r4, %r15, %r31
	.word 0xaa02248a  ! 139: ADD_I	add 	%r8, 0x048a, %r21
	.word 0xb410c009  ! 139: OR_R	or 	%r3, %r9, %r26
	.word 0xbc012939  ! 139: ADD_I	add 	%r4, 0x0939, %r30
	.word 0xb601400b  ! 139: ADD_R	add 	%r5, %r11, %r27
	.word 0xaa10e3a0  ! 139: OR_I	or 	%r3, 0x03a0, %r21
	.word 0xb200c00c  ! 139: ADD_R	add 	%r3, %r12, %r25
	.word 0xa401000d  ! 139: ADD_R	add 	%r4, %r13, %r18
	.word 0xa409a5a9  ! 139: AND_I	and 	%r6, 0x05a9, %r18
	.word 0xa609400a  ! 139: AND_R	and 	%r5, %r10, %r19
	.word 0xb201c00d  ! 139: ADD_R	add 	%r7, %r13, %r25
	.word 0xbe00e0ea  ! 139: ADD_I	add 	%r3, 0x00ea, %r31
	.word 0xba12000b  ! 139: OR_R	or 	%r8, %r11, %r29
	.word 0xb212000b  ! 139: OR_R	or 	%r8, %r11, %r25
	.word 0xa8092fdc  ! 139: AND_I	and 	%r4, 0x0fdc, %r20
	.word 0xa6120009  ! 139: OR_R	or 	%r8, %r9, %r19
	.word 0xb209c009  ! 139: AND_R	and 	%r7, %r9, %r25
	.word 0xaa11000c  ! 139: OR_R	or 	%r4, %r12, %r21
	.word 0xb011800f  ! 139: OR_R	or 	%r6, %r15, %r24
	.word 0xa211000e  ! 139: OR_R	or 	%r4, %r14, %r17
	.word 0xa812000b  ! 139: OR_R	or 	%r8, %r11, %r20
	.word 0xb6116da3  ! 139: OR_I	or 	%r5, 0x0da3, %r27
	.word 0xb609a9d8  ! 139: AND_I	and 	%r6, 0x09d8, %r27
	.word 0xa80a2735  ! 139: AND_I	and 	%r8, 0x0735, %r20
	.word 0xb209800d  ! 139: AND_R	and 	%r6, %r13, %r25
	.word 0xb811a684  ! 139: OR_I	or 	%r6, 0x0684, %r28
	.word 0xa611400c  ! 139: OR_R	or 	%r5, %r12, %r19
	.word 0xaa08ed45  ! 139: AND_I	and 	%r3, 0x0d45, %r21
	.word 0xba01000e  ! 139: ADD_R	add 	%r4, %r14, %r29
	.word 0xa209c009  ! 139: AND_R	and 	%r7, %r9, %r17
	.word 0xa4012916  ! 139: ADD_I	add 	%r4, 0x0916, %r18
	.word 0xb2122574  ! 139: OR_I	or 	%r8, 0x0574, %r25
	.word 0xa801800c  ! 139: ADD_R	add 	%r6, %r12, %r20
	.word 0xac022c1e  ! 139: ADD_I	add 	%r8, 0x0c1e, %r22
	.word 0xa4022d00  ! 139: ADD_I	add 	%r8, 0x0d00, %r18
	.word 0xbc098009  ! 139: AND_R	and 	%r6, %r9, %r30
	.word 0xac08c00a  ! 139: AND_R	and 	%r3, %r10, %r22
	.word 0xb60122e4  ! 139: ADD_I	add 	%r4, 0x02e4, %r27
	.word 0xba022167  ! 139: ADD_I	add 	%r8, 0x0167, %r29
	.word 0xac00c009  ! 139: ADD_R	add 	%r3, %r9, %r22
	.word 0xac11000d  ! 139: OR_R	or 	%r4, %r13, %r22
	.word 0xb201c00b  ! 139: ADD_R	add 	%r7, %r11, %r25
	.word 0xbc10c00b  ! 139: OR_R	or 	%r3, %r11, %r30
	.word 0xb409c00f  ! 139: AND_R	and 	%r7, %r15, %r26
	.word 0xb609231b  ! 139: AND_I	and 	%r4, 0x031b, %r27
	.word 0xb80a259d  ! 139: AND_I	and 	%r8, 0x059d, %r28
	.word 0xb808c00c  ! 139: AND_R	and 	%r3, %r12, %r28
	.word 0xbe112066  ! 139: OR_I	or 	%r4, 0x0066, %r31
	.word 0xac11ec6b  ! 139: OR_I	or 	%r7, 0x0c6b, %r22
	.word 0xbe012167  ! 139: ADD_I	add 	%r4, 0x0167, %r31
	.word 0xbe11400b  ! 139: OR_R	or 	%r5, %r11, %r31
	.word 0xb401000a  ! 139: ADD_R	add 	%r4, %r10, %r26
	.word 0xb809000d  ! 139: AND_R	and 	%r4, %r13, %r28
	.word 0xaa12000b  ! 139: OR_R	or 	%r8, %r11, %r21
	.word 0xb4016d10  ! 139: ADD_I	add 	%r5, 0x0d10, %r26
	.word 0xa210c00f  ! 139: OR_R	or 	%r3, %r15, %r17
	.word 0xb400c00a  ! 139: ADD_R	add 	%r3, %r10, %r26
	.word 0xa411400c  ! 139: OR_R	or 	%r5, %r12, %r18
	.word 0xb809400f  ! 139: AND_R	and 	%r5, %r15, %r28
	.word 0xb011a480  ! 139: OR_I	or 	%r6, 0x0480, %r24
	.word 0xa6116cf6  ! 139: OR_I	or 	%r5, 0x0cf6, %r19
	.word 0xb609a715  ! 139: AND_I	and 	%r6, 0x0715, %r27
	.word 0xb811a55e  ! 139: OR_I	or 	%r6, 0x055e, %r28
	.word 0xa8012be6  ! 139: ADD_I	add 	%r4, 0x0be6, %r20
	.word 0xb409240f  ! 139: AND_I	and 	%r4, 0x040f, %r26
	.word 0xb608c00a  ! 139: AND_R	and 	%r3, %r10, %r27
	.word 0xa6094009  ! 139: AND_R	and 	%r5, %r9, %r19
	.word 0xae01400f  ! 139: ADD_R	add 	%r5, %r15, %r23
	.word 0xba11800a  ! 139: OR_R	or 	%r6, %r10, %r29
	.word 0xb009400d  ! 139: AND_R	and 	%r5, %r13, %r24
	.word 0xac01c00b  ! 139: ADD_R	add 	%r7, %r11, %r22
	.word 0xb609800c  ! 139: AND_R	and 	%r6, %r12, %r27
	.word 0xb009aaa6  ! 139: AND_I	and 	%r6, 0x0aa6, %r24
	.word 0xbc11800a  ! 139: OR_R	or 	%r6, %r10, %r30
	.word 0xa611c00a  ! 139: OR_R	or 	%r7, %r10, %r19
	.word 0xbc01000c  ! 139: ADD_R	add 	%r4, %r12, %r30
	.word 0xae11800d  ! 139: OR_R	or 	%r6, %r13, %r23
	.word 0xa8114009  ! 139: OR_R	or 	%r5, %r9, %r20
	.word 0xac11223a  ! 139: OR_I	or 	%r4, 0x023a, %r22
	.word 0xaa09a004  ! 139: AND_I	and 	%r6, 0x0004, %r21
	.word 0xa8022ca7  ! 139: ADD_I	add 	%r8, 0x0ca7, %r20
	.word 0xb409c009  ! 139: AND_R	and 	%r7, %r9, %r26
	.word 0xbe11000f  ! 139: OR_R	or 	%r4, %r15, %r31
	.word 0xae1120da  ! 139: OR_I	or 	%r4, 0x00da, %r23
	.word 0xaa10e9ee  ! 139: OR_I	or 	%r3, 0x09ee, %r21
	.word 0xb011e70e  ! 139: OR_I	or 	%r7, 0x070e, %r24
	.word 0xba11a341  ! 139: OR_I	or 	%r6, 0x0341, %r29
	.word 0xa611c00a  ! 139: OR_R	or 	%r7, %r10, %r19
	.word 0xa412000e  ! 139: OR_R	or 	%r8, %r14, %r18
	.word 0xa809800f  ! 139: AND_R	and 	%r6, %r15, %r20
	.word 0xa409400d  ! 139: AND_R	and 	%r5, %r13, %r18
	.word 0xa8116099  ! 139: OR_I	or 	%r5, 0x0099, %r20
	.word 0xaa11a788  ! 139: OR_I	or 	%r6, 0x0788, %r21
	.word 0xb809400d  ! 139: AND_R	and 	%r5, %r13, %r28
	.word 0xb6122d77  ! 139: OR_I	or 	%r8, 0x0d77, %r27
	.word 0xba01400a  ! 139: ADD_R	add 	%r5, %r10, %r29
	.word 0xaa112dcf  ! 139: OR_I	or 	%r4, 0x0dcf, %r21
	.word 0xa609e84e  ! 139: AND_I	and 	%r7, 0x084e, %r19
	.word 0xba12000d  ! 139: OR_R	or 	%r8, %r13, %r29
	.word 0xb009400e  ! 139: AND_R	and 	%r5, %r14, %r24
	.word 0xa6018009  ! 139: ADD_R	add 	%r6, %r9, %r19
	.word 0xa4016edc  ! 139: ADD_I	add 	%r5, 0x0edc, %r18
	.word 0xb810c00b  ! 139: OR_R	or 	%r3, %r11, %r28
	.word 0xb009000c  ! 139: AND_R	and 	%r4, %r12, %r24
	.word 0xa402000c  ! 139: ADD_R	add 	%r8, %r12, %r18
	.word 0xb802000d  ! 139: ADD_R	add 	%r8, %r13, %r28
	.word 0xb609adf2  ! 139: AND_I	and 	%r6, 0x0df2, %r27
	.word 0xb409ed58  ! 139: AND_I	and 	%r7, 0x0d58, %r26
	.word 0xbe12000e  ! 139: OR_R	or 	%r8, %r14, %r31
	.word 0xac116a65  ! 139: OR_I	or 	%r5, 0x0a65, %r22
	.word 0xa401400c  ! 139: ADD_R	add 	%r5, %r12, %r18
	.word 0xb611000e  ! 139: OR_R	or 	%r4, %r14, %r27
	.word 0xa40a0009  ! 139: AND_R	and 	%r8, %r9, %r18
	.word 0xa601c00c  ! 139: ADD_R	add 	%r7, %r12, %r19
	.word 0xbe11400d  ! 139: OR_R	or 	%r5, %r13, %r31
	.word 0xbe016838  ! 139: ADD_I	add 	%r5, 0x0838, %r31
	.word 0xbe01a040  ! 139: ADD_I	add 	%r6, 0x0040, %r31
	.word 0xa812000f  ! 139: OR_R	or 	%r8, %r15, %r20
	.word 0xac01800d  ! 139: ADD_R	add 	%r6, %r13, %r22
	.word 0xb609c00c  ! 139: AND_R	and 	%r7, %r12, %r27
	.word 0xa801c00e  ! 139: ADD_R	add 	%r7, %r14, %r20
	.word 0xbc116aa1  ! 139: OR_I	or 	%r5, 0x0aa1, %r30
	.word 0xa411000c  ! 139: OR_R	or 	%r4, %r12, %r18
	.word 0xb800c00a  ! 139: ADD_R	add 	%r3, %r10, %r28
	.word 0xb409800e  ! 139: AND_R	and 	%r6, %r14, %r26
	.word 0xac10c00a  ! 139: OR_R	or 	%r3, %r10, %r22
	.word 0xb211400b  ! 139: OR_R	or 	%r5, %r11, %r25
	.word 0xa208eeec  ! 139: AND_I	and 	%r3, 0x0eec, %r17
	.word 0xb81167ad  ! 139: OR_I	or 	%r5, 0x07ad, %r28
	.word 0xa409219c  ! 139: AND_I	and 	%r4, 0x019c, %r18
	.word 0xa800ec8f  ! 139: ADD_I	add 	%r3, 0x0c8f, %r20
	.word 0xf470eaf0  ! 139: STX_I	stx	%r26, [%r3 + 0x0af0]
	.word 0xf029e9e2  ! 139: STB_I	stb	%r24, [%r7 + 0x09e2]
	.word 0xfe3120da  ! 139: STH_I	sth	%r31, [%r4 + 0x00da]
	.word 0xe831a65a  ! 139: STH_I	sth	%r20, [%r6 + 0x065a]
	.word 0xf021ecac  ! 139: STW_I	stw	%r24, [%r7 + 0x0cac]
	.word 0xf031ef55  ! 141: STH_I	sth	%r24, [%r7 + 0x0f55]
!alu: trpm_alu
	.word 0xb4020009  ! 143: ADD_R	add 	%r8, %r9, %r26
	.word 0xe47227d8  ! 144: STX_I	stx	%r18, [%r8 + 0x07d8]
	.word 0xc0f00982  ! 146: STXA_R	stxa	%r0, [%r0 + %r2] 0x4c
thr0_ic_err_6:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_6), 16, 16),3,IC_DATA,IR,31,x)
	setx  0x0000000000000220, %r16, %r12
	setx  0x0000000000001b26, %r16, %r2
	.word 0xba02000b  ! 149: ADD_R	add 	%r8, %r11, %r29
	.word 0xa809000f  ! 149: AND_R	and 	%r4, %r15, %r20
	.word 0xb201000b  ! 149: ADD_R	add 	%r4, %r11, %r25
	bne thr0_loop_9
	subcc %g1, 0x1, %g1
!Generating store_chunk_3
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr0_loop_10:
	.word 0xae09c00d  ! 158: AND_R	and 	%r7, %r13, %r23
	.word 0xb811000a  ! 158: OR_R	or 	%r4, %r10, %r28
	.word 0xac0a0009  ! 158: AND_R	and 	%r8, %r9, %r22
	.word 0xb801a8b5  ! 158: ADD_I	add 	%r6, 0x08b5, %r28
	.word 0xb000e25b  ! 158: ADD_I	add 	%r3, 0x025b, %r24
	.word 0xac0a20e3  ! 158: AND_I	and 	%r8, 0x00e3, %r22
	.word 0xae09400f  ! 158: AND_R	and 	%r5, %r15, %r23
	.word 0xba09e6c4  ! 158: AND_I	and 	%r7, 0x06c4, %r29
	.word 0xbc09400d  ! 158: AND_R	and 	%r5, %r13, %r30
	.word 0xae09eba9  ! 158: AND_I	and 	%r7, 0x0ba9, %r23
	.word 0xac09000c  ! 158: AND_R	and 	%r4, %r12, %r22
	.word 0xa211800f  ! 158: OR_R	or 	%r6, %r15, %r17
	.word 0xb409edd6  ! 158: AND_I	and 	%r7, 0x0dd6, %r26
	.word 0xba11000b  ! 158: OR_R	or 	%r4, %r11, %r29
	.word 0xa809000a  ! 158: AND_R	and 	%r4, %r10, %r20
	.word 0xa400c00e  ! 158: ADD_R	add 	%r3, %r14, %r18
	.word 0xa201ae83  ! 158: ADD_I	add 	%r6, 0x0e83, %r17
	.word 0xb812275e  ! 158: OR_I	or 	%r8, 0x075e, %r28
	.word 0xb401a661  ! 158: ADD_I	add 	%r6, 0x0661, %r26
	.word 0xa611400d  ! 158: OR_R	or 	%r5, %r13, %r19
	.word 0xb008e7db  ! 158: AND_I	and 	%r3, 0x07db, %r24
	.word 0xb212000f  ! 158: OR_R	or 	%r8, %r15, %r25
	.word 0xa601800d  ! 158: ADD_R	add 	%r6, %r13, %r19
	.word 0xae10c00f  ! 158: OR_R	or 	%r3, %r15, %r23
	.word 0xb2012d0a  ! 158: ADD_I	add 	%r4, 0x0d0a, %r25
	.word 0xb609400a  ! 158: AND_R	and 	%r5, %r10, %r27
	.word 0xa400edba  ! 158: ADD_I	add 	%r3, 0x0dba, %r18
	.word 0xa801e4aa  ! 158: ADD_I	add 	%r7, 0x04aa, %r20
	.word 0xaa11400a  ! 158: OR_R	or 	%r5, %r10, %r21
	.word 0xba010009  ! 158: ADD_R	add 	%r4, %r9, %r29
	.word 0xb001a660  ! 158: ADD_I	add 	%r6, 0x0660, %r24
	.word 0xb609e530  ! 158: AND_I	and 	%r7, 0x0530, %r27
	.word 0xbe09800a  ! 158: AND_R	and 	%r6, %r10, %r31
	.word 0xb601000e  ! 158: ADD_R	add 	%r4, %r14, %r27
	.word 0xb411c00f  ! 158: OR_R	or 	%r7, %r15, %r26
	.word 0xaa012e02  ! 158: ADD_I	add 	%r4, 0x0e02, %r21
	.word 0xae11000b  ! 158: OR_R	or 	%r4, %r11, %r23
	.word 0xb80a2d04  ! 158: AND_I	and 	%r8, 0x0d04, %r28
	.word 0xb2012c34  ! 158: ADD_I	add 	%r4, 0x0c34, %r25
	.word 0xac09e8d6  ! 158: AND_I	and 	%r7, 0x08d6, %r22
	.word 0xb811800c  ! 158: OR_R	or 	%r6, %r12, %r28
	.word 0xb40a2691  ! 158: AND_I	and 	%r8, 0x0691, %r26
	.word 0xaa11aa82  ! 158: OR_I	or 	%r6, 0x0a82, %r21
	.word 0xa409e207  ! 158: AND_I	and 	%r7, 0x0207, %r18
	.word 0xba00e938  ! 158: ADD_I	add 	%r3, 0x0938, %r29
	.word 0xa411000e  ! 158: OR_R	or 	%r4, %r14, %r18
	.word 0xac01639c  ! 158: ADD_I	add 	%r5, 0x039c, %r22
	.word 0xa201208b  ! 158: ADD_I	add 	%r4, 0x008b, %r17
	.word 0xb202000b  ! 158: ADD_R	add 	%r8, %r11, %r25
	.word 0xba01c00a  ! 158: ADD_R	add 	%r7, %r10, %r29
	.word 0xb009a9c9  ! 158: AND_I	and 	%r6, 0x09c9, %r24
	.word 0xbe092ee9  ! 158: AND_I	and 	%r4, 0x0ee9, %r31
	.word 0xae11000c  ! 158: OR_R	or 	%r4, %r12, %r23
	.word 0xa6112458  ! 158: OR_I	or 	%r4, 0x0458, %r19
	.word 0xa6122cec  ! 158: OR_I	or 	%r8, 0x0cec, %r19
	.word 0xae08e5be  ! 158: AND_I	and 	%r3, 0x05be, %r23
	.word 0xb411eff0  ! 158: OR_I	or 	%r7, 0x0ff0, %r26
	.word 0xb609aa0b  ! 158: AND_I	and 	%r6, 0x0a0b, %r27
	.word 0xbe01a099  ! 158: ADD_I	add 	%r6, 0x0099, %r31
	.word 0xba11c00e  ! 158: OR_R	or 	%r7, %r14, %r29
	.word 0xac01a065  ! 158: ADD_I	add 	%r6, 0x0065, %r22
	.word 0xa2118009  ! 158: OR_R	or 	%r6, %r9, %r17
	.word 0xa209a991  ! 158: AND_I	and 	%r6, 0x0991, %r17
	.word 0xb401000e  ! 158: ADD_R	add 	%r4, %r14, %r26
	.word 0xb612000c  ! 158: OR_R	or 	%r8, %r12, %r27
	.word 0xa811a340  ! 158: OR_I	or 	%r6, 0x0340, %r20
	.word 0xaa01000a  ! 158: ADD_R	add 	%r4, %r10, %r21
	.word 0xb20225df  ! 158: ADD_I	add 	%r8, 0x05df, %r25
	.word 0xac11000f  ! 158: OR_R	or 	%r4, %r15, %r22
	.word 0xb411000f  ! 158: OR_R	or 	%r4, %r15, %r26
	.word 0xa209000d  ! 158: AND_R	and 	%r4, %r13, %r17
	.word 0xac01c00f  ! 158: ADD_R	add 	%r7, %r15, %r22
	.word 0xa608c00a  ! 158: AND_R	and 	%r3, %r10, %r19
	.word 0xb8112374  ! 158: OR_I	or 	%r4, 0x0374, %r28
	.word 0xb8112f2a  ! 158: OR_I	or 	%r4, 0x0f2a, %r28
	.word 0xb40126fa  ! 158: ADD_I	add 	%r4, 0x06fa, %r26
	.word 0xb4012e30  ! 158: ADD_I	add 	%r4, 0x0e30, %r26
	.word 0xb809e9d4  ! 158: AND_I	and 	%r7, 0x09d4, %r28
	.word 0xae09800e  ! 158: AND_R	and 	%r6, %r14, %r23
	.word 0xa210c00c  ! 158: OR_R	or 	%r3, %r12, %r17
	.word 0xb012211b  ! 158: OR_I	or 	%r8, 0x011b, %r24
	.word 0xa800c009  ! 158: ADD_R	add 	%r3, %r9, %r20
	.word 0xac11e0f8  ! 158: OR_I	or 	%r7, 0x00f8, %r22
	.word 0xbc08e3fd  ! 158: AND_I	and 	%r3, 0x03fd, %r30
	.word 0xbe11800f  ! 158: OR_R	or 	%r6, %r15, %r31
	.word 0xa411000e  ! 158: OR_R	or 	%r4, %r14, %r18
	.word 0xb201648d  ! 158: ADD_I	add 	%r5, 0x048d, %r25
	.word 0xac01800b  ! 158: ADD_R	add 	%r6, %r11, %r22
	.word 0xa80922f0  ! 158: AND_I	and 	%r4, 0x02f0, %r20
	.word 0xbc11400d  ! 158: OR_R	or 	%r5, %r13, %r30
	.word 0xb611a91f  ! 158: OR_I	or 	%r6, 0x091f, %r27
	.word 0xba11800b  ! 158: OR_R	or 	%r6, %r11, %r29
	.word 0xa801400d  ! 158: ADD_R	add 	%r5, %r13, %r20
	.word 0xb208c00d  ! 158: AND_R	and 	%r3, %r13, %r25
	.word 0xb011c009  ! 158: OR_R	or 	%r7, %r9, %r24
	.word 0xa81229eb  ! 158: OR_I	or 	%r8, 0x09eb, %r20
	.word 0xa411400e  ! 158: OR_R	or 	%r5, %r14, %r18
	.word 0xaa096267  ! 158: AND_I	and 	%r5, 0x0267, %r21
	.word 0xbc09400d  ! 158: AND_R	and 	%r5, %r13, %r30
	.word 0xa801000f  ! 158: ADD_R	add 	%r4, %r15, %r20
	.word 0xb401ec31  ! 158: ADD_I	add 	%r7, 0x0c31, %r26
	.word 0xa4016c7d  ! 158: ADD_I	add 	%r5, 0x0c7d, %r18
	.word 0xb812299b  ! 158: OR_I	or 	%r8, 0x099b, %r28
	.word 0xb6096ac2  ! 158: AND_I	and 	%r5, 0x0ac2, %r27
	.word 0xac012ce2  ! 158: ADD_I	add 	%r4, 0x0ce2, %r22
	.word 0xa411c00f  ! 158: OR_R	or 	%r7, %r15, %r18
	.word 0xaa01800d  ! 158: ADD_R	add 	%r6, %r13, %r21
	.word 0xb401a963  ! 158: ADD_I	add 	%r6, 0x0963, %r26
	.word 0xa8012e74  ! 158: ADD_I	add 	%r4, 0x0e74, %r20
	.word 0xac014009  ! 158: ADD_R	add 	%r5, %r9, %r22
	.word 0xa801adbd  ! 158: ADD_I	add 	%r6, 0x0dbd, %r20
	.word 0xaa012bea  ! 158: ADD_I	add 	%r4, 0x0bea, %r21
	.word 0xb2110009  ! 158: OR_R	or 	%r4, %r9, %r25
	.word 0xa6092dba  ! 158: AND_I	and 	%r4, 0x0dba, %r19
	.word 0xb8098009  ! 158: AND_R	and 	%r6, %r9, %r28
	.word 0xb412257a  ! 158: OR_I	or 	%r8, 0x057a, %r26
	.word 0xa801e034  ! 158: ADD_I	add 	%r7, 0x0034, %r20
	.word 0xbc0a280a  ! 158: AND_I	and 	%r8, 0x080a, %r30
	.word 0xa811c00e  ! 158: OR_R	or 	%r7, %r14, %r20
	.word 0xf03166e4  ! 158: STH_I	sth	%r24, [%r5 + 0x06e4]
	.word 0xfa216cac  ! 158: STW_I	stw	%r29, [%r5 + 0x0cac]
	.word 0xee71eca8  ! 158: STX_I	stx	%r23, [%r7 + 0x0ca8]
	.word 0xe821e298  ! 158: STW_I	stw	%r20, [%r7 + 0x0298]
	.word 0xf2712110  ! 158: STX_I	stx	%r25, [%r4 + 0x0110]
	.word 0xe229aa78  ! 158: STB_I	stb	%r17, [%r6 + 0x0a78]
	.word 0xe4222398  ! 158: STW_I	stw	%r18, [%r8 + 0x0398]
	.word 0xe44a0009  ! 158: LDSB_R	ldsb	[%r8 + %r9], %r18
	.word 0xf939400e  ! 159: STDF_R	std	%f28, [%r14, %r5]
thr0_ic_err_7:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_7), 16, 16),2,IC_DATA,IR,20,x)
	.word 0x8143e00b  ! 162: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore 
	.word 0xb802000e  ! 162: ADD_R	add 	%r8, %r14, %r28
	.word 0xac0963a3  ! 162: AND_I	and 	%r5, 0x03a3, %r22
	setx  0x0000000000000a60, %r16, %r9
	bne thr0_loop_10
	subcc %g1, 0x1, %g1
!Generating store_chunk_3
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr0_loop_11:
	.word 0xae10c00e  ! 171: OR_R	or 	%r3, %r14, %r23
	.word 0xa601aa31  ! 171: ADD_I	add 	%r6, 0x0a31, %r19
	.word 0xa411c00c  ! 171: OR_R	or 	%r7, %r12, %r18
	.word 0xa811c00d  ! 171: OR_R	or 	%r7, %r13, %r20
	.word 0xa401a66a  ! 171: ADD_I	add 	%r6, 0x066a, %r18
	.word 0xb808c00a  ! 171: AND_R	and 	%r3, %r10, %r28
	.word 0xae08ec21  ! 171: AND_I	and 	%r3, 0x0c21, %r23
	.word 0xb009000d  ! 171: AND_R	and 	%r4, %r13, %r24
	.word 0xa811800c  ! 171: OR_R	or 	%r6, %r12, %r20
	.word 0xa20a000e  ! 171: AND_R	and 	%r8, %r14, %r17
	.word 0xb211c00c  ! 171: OR_R	or 	%r7, %r12, %r25
	.word 0xb212000b  ! 171: OR_R	or 	%r8, %r11, %r25
	.word 0xbe11000b  ! 171: OR_R	or 	%r4, %r11, %r31
	.word 0xb610c00a  ! 171: OR_R	or 	%r3, %r10, %r27
	.word 0xba12292b  ! 171: OR_I	or 	%r8, 0x092b, %r29
	.word 0xae11a857  ! 171: OR_I	or 	%r6, 0x0857, %r23
	.word 0xb808c00d  ! 171: AND_R	and 	%r3, %r13, %r28
	.word 0xb809000f  ! 171: AND_R	and 	%r4, %r15, %r28
	.word 0xb8116325  ! 171: OR_I	or 	%r5, 0x0325, %r28
	.word 0xaa10c009  ! 171: OR_R	or 	%r3, %r9, %r21
	.word 0xba09c00e  ! 171: AND_R	and 	%r7, %r14, %r29
	.word 0xa202000f  ! 171: ADD_R	add 	%r8, %r15, %r17
	.word 0xb410e778  ! 171: OR_I	or 	%r3, 0x0778, %r26
	.word 0xb4090009  ! 171: AND_R	and 	%r4, %r9, %r26
	.word 0xaa01000c  ! 171: ADD_R	add 	%r4, %r12, %r21
	.word 0xb609a098  ! 171: AND_I	and 	%r6, 0x0098, %r27
	.word 0xa610c00d  ! 171: OR_R	or 	%r3, %r13, %r19
	.word 0xba01800b  ! 171: ADD_R	add 	%r6, %r11, %r29
	.word 0xa209000a  ! 171: AND_R	and 	%r4, %r10, %r17
	.word 0xa209a435  ! 171: AND_I	and 	%r6, 0x0435, %r17
	.word 0xba09000f  ! 171: AND_R	and 	%r4, %r15, %r29
	.word 0xba122813  ! 171: OR_I	or 	%r8, 0x0813, %r29
	.word 0xa80a2bd4  ! 171: AND_I	and 	%r8, 0x0bd4, %r20
	.word 0xb211400c  ! 171: OR_R	or 	%r5, %r12, %r25
	.word 0xba0a2d22  ! 171: AND_I	and 	%r8, 0x0d22, %r29
	.word 0xb401000b  ! 171: ADD_R	add 	%r4, %r11, %r26
	.word 0xa202000e  ! 171: ADD_R	add 	%r8, %r14, %r17
	.word 0xaa11000f  ! 171: OR_R	or 	%r4, %r15, %r21
	.word 0xa81129f3  ! 171: OR_I	or 	%r4, 0x09f3, %r20
	.word 0xae0229ea  ! 171: ADD_I	add 	%r8, 0x09ea, %r23
	.word 0xa609000a  ! 171: AND_R	and 	%r4, %r10, %r19
	.word 0xbc01a31c  ! 171: ADD_I	add 	%r6, 0x031c, %r30
	.word 0xaa11615b  ! 171: OR_I	or 	%r5, 0x015b, %r21
	.word 0xb201000b  ! 171: ADD_R	add 	%r4, %r11, %r25
	.word 0xa8096ebf  ! 171: AND_I	and 	%r5, 0x0ebf, %r20
	.word 0xa80966f3  ! 171: AND_I	and 	%r5, 0x06f3, %r20
	.word 0xbc00ee76  ! 171: ADD_I	add 	%r3, 0x0e76, %r30
	.word 0xb402000c  ! 171: ADD_R	add 	%r8, %r12, %r26
	.word 0xb4110009  ! 171: OR_R	or 	%r4, %r9, %r26
	.word 0xac09c00d  ! 171: AND_R	and 	%r7, %r13, %r22
	.word 0xa611eb73  ! 171: OR_I	or 	%r7, 0x0b73, %r19
	.word 0xba11279f  ! 171: OR_I	or 	%r4, 0x079f, %r29
	.word 0xb011a458  ! 171: OR_I	or 	%r6, 0x0458, %r24
	.word 0xa80a000e  ! 171: AND_R	and 	%r8, %r14, %r20
	.word 0xbc10c00b  ! 171: OR_R	or 	%r3, %r11, %r30
	.word 0xb409619d  ! 171: AND_I	and 	%r5, 0x019d, %r26
	.word 0xb211c00a  ! 171: OR_R	or 	%r7, %r10, %r25
	.word 0xae10c00f  ! 171: OR_R	or 	%r3, %r15, %r23
	.word 0xb201a220  ! 171: ADD_I	add 	%r6, 0x0220, %r25
	.word 0xbe00e9a8  ! 171: ADD_I	add 	%r3, 0x09a8, %r31
	.word 0xac018009  ! 171: ADD_R	add 	%r6, %r9, %r22
	.word 0xaa01c00e  ! 171: ADD_R	add 	%r7, %r14, %r21
	.word 0xa60a000c  ! 171: AND_R	and 	%r8, %r12, %r19
	.word 0xb001800a  ! 171: ADD_R	add 	%r6, %r10, %r24
	.word 0xa600e113  ! 171: ADD_I	add 	%r3, 0x0113, %r19
	.word 0xae092d74  ! 171: AND_I	and 	%r4, 0x0d74, %r23
	.word 0xb811a26c  ! 171: OR_I	or 	%r6, 0x026c, %r28
	.word 0xa409000b  ! 171: AND_R	and 	%r4, %r11, %r18
	.word 0xa801c00c  ! 171: ADD_R	add 	%r7, %r12, %r20
	.word 0xbe01000f  ! 171: ADD_R	add 	%r4, %r15, %r31
	.word 0xaa116f1f  ! 171: OR_I	or 	%r5, 0x0f1f, %r21
	.word 0xa400e8fb  ! 171: ADD_I	add 	%r3, 0x08fb, %r18
	.word 0xb400c00e  ! 171: ADD_R	add 	%r3, %r14, %r26
	.word 0xba11a647  ! 171: OR_I	or 	%r6, 0x0647, %r29
	.word 0xa40929ac  ! 171: AND_I	and 	%r4, 0x09ac, %r18
	.word 0xa400c00e  ! 171: ADD_R	add 	%r3, %r14, %r18
	.word 0xb012208c  ! 171: OR_I	or 	%r8, 0x008c, %r24
	.word 0xb810c00f  ! 171: OR_R	or 	%r3, %r15, %r28
	.word 0xa401a5e1  ! 171: ADD_I	add 	%r6, 0x05e1, %r18
	.word 0xa411800f  ! 171: OR_R	or 	%r6, %r15, %r18
	.word 0xbe09800d  ! 171: AND_R	and 	%r6, %r13, %r31
	.word 0xb4012033  ! 171: ADD_I	add 	%r4, 0x0033, %r26
	.word 0xa4096766  ! 171: AND_I	and 	%r5, 0x0766, %r18
	.word 0xac01a015  ! 171: ADD_I	add 	%r6, 0x0015, %r22
	.word 0xb4116331  ! 171: OR_I	or 	%r5, 0x0331, %r26
	.word 0xb811800c  ! 171: OR_R	or 	%r6, %r12, %r28
	.word 0xb411000a  ! 171: OR_R	or 	%r4, %r10, %r26
	.word 0xa611602c  ! 171: OR_I	or 	%r5, 0x002c, %r19
	.word 0xae08c00c  ! 171: AND_R	and 	%r3, %r12, %r23
	.word 0xba08c00e  ! 171: AND_R	and 	%r3, %r14, %r29
	.word 0xbc01c00f  ! 171: ADD_R	add 	%r7, %r15, %r30
	.word 0xa81160c7  ! 171: OR_I	or 	%r5, 0x00c7, %r20
	.word 0xac0a000d  ! 171: AND_R	and 	%r8, %r13, %r22
	.word 0xaa012ff2  ! 171: ADD_I	add 	%r4, 0x0ff2, %r21
	.word 0xb401400c  ! 171: ADD_R	add 	%r5, %r12, %r26
	.word 0xac01400d  ! 171: ADD_R	add 	%r5, %r13, %r22
	.word 0xb608c00c  ! 171: AND_R	and 	%r3, %r12, %r27
	.word 0xa610c009  ! 171: OR_R	or 	%r3, %r9, %r19
	.word 0xac11800a  ! 171: OR_R	or 	%r6, %r10, %r22
	.word 0xb801000d  ! 171: ADD_R	add 	%r4, %r13, %r28
	.word 0xb8112620  ! 171: OR_I	or 	%r4, 0x0620, %r28
	.word 0xa4122e13  ! 171: OR_I	or 	%r8, 0x0e13, %r18
	.word 0xb8114009  ! 171: OR_R	or 	%r5, %r9, %r28
	.word 0xb2014009  ! 171: ADD_R	add 	%r5, %r9, %r25
	.word 0xa210e88e  ! 171: OR_I	or 	%r3, 0x088e, %r17
	.word 0xba01e5fa  ! 171: ADD_I	add 	%r7, 0x05fa, %r29
	.word 0xb009c00a  ! 171: AND_R	and 	%r7, %r10, %r24
	.word 0xa609800e  ! 171: AND_R	and 	%r6, %r14, %r19
	.word 0xba12000b  ! 171: OR_R	or 	%r8, %r11, %r29
	.word 0xb0092466  ! 171: AND_I	and 	%r4, 0x0466, %r24
	.word 0xb611a4d4  ! 171: OR_I	or 	%r6, 0x04d4, %r27
	.word 0xbc09800b  ! 171: AND_R	and 	%r6, %r11, %r30
	.word 0xac01800f  ! 171: ADD_R	add 	%r6, %r15, %r22
	.word 0xa801400c  ! 171: ADD_R	add 	%r5, %r12, %r20
	.word 0xa410c00a  ! 171: OR_R	or 	%r3, %r10, %r18
	.word 0xb811000e  ! 171: OR_R	or 	%r4, %r14, %r28
	.word 0xa20a2c12  ! 171: AND_I	and 	%r8, 0x0c12, %r17
	.word 0xa20169c0  ! 171: ADD_I	add 	%r5, 0x09c0, %r17
	.word 0xb208e25a  ! 171: AND_I	and 	%r3, 0x025a, %r25
	.word 0xa411400c  ! 171: OR_R	or 	%r5, %r12, %r18
	.word 0xb401ed99  ! 171: ADD_I	add 	%r7, 0x0d99, %r26
	.word 0xbc092d42  ! 171: AND_I	and 	%r4, 0x0d42, %r30
	.word 0xb8014009  ! 171: ADD_R	add 	%r5, %r9, %r28
	.word 0xa6012604  ! 171: ADD_I	add 	%r4, 0x0604, %r19
	.word 0xa801afe5  ! 171: ADD_I	add 	%r6, 0x0fe5, %r20
	.word 0xbc122bc6  ! 171: OR_I	or 	%r8, 0x0bc6, %r30
	.word 0xaa11400a  ! 171: OR_R	or 	%r5, %r10, %r21
	.word 0xa602000e  ! 171: ADD_R	add 	%r8, %r14, %r19
	.word 0xb401ae4d  ! 171: ADD_I	add 	%r6, 0x0e4d, %r26
	.word 0xae00c00e  ! 171: ADD_R	add 	%r3, %r14, %r23
	.word 0xbe0a2541  ! 171: AND_I	and 	%r8, 0x0541, %r31
	.word 0xa411a8ec  ! 171: OR_I	or 	%r6, 0x08ec, %r18
	.word 0xa40963cc  ! 171: AND_I	and 	%r5, 0x03cc, %r18
	.word 0xb40a2d2f  ! 171: AND_I	and 	%r8, 0x0d2f, %r26
	.word 0xa411eb6e  ! 171: OR_I	or 	%r7, 0x0b6e, %r18
	.word 0xa211800a  ! 171: OR_R	or 	%r6, %r10, %r17
	.word 0xb000c00c  ! 171: ADD_R	add 	%r3, %r12, %r24
	.word 0xa611400b  ! 171: OR_R	or 	%r5, %r11, %r19
	.word 0xa809662c  ! 171: AND_I	and 	%r5, 0x062c, %r20
	.word 0xb0014009  ! 171: ADD_R	add 	%r5, %r9, %r24
	.word 0xae01400e  ! 171: ADD_R	add 	%r5, %r14, %r23
	.word 0xbe0962ce  ! 171: AND_I	and 	%r5, 0x02ce, %r31
	.word 0xaa122d78  ! 171: OR_I	or 	%r8, 0x0d78, %r21
	.word 0xba0a000d  ! 171: AND_R	and 	%r8, %r13, %r29
	.word 0xa6022620  ! 171: ADD_I	add 	%r8, 0x0620, %r19
	.word 0xa2122b38  ! 171: OR_I	or 	%r8, 0x0b38, %r17
	.word 0xb810c00b  ! 171: OR_R	or 	%r3, %r11, %r28
	.word 0xae11400e  ! 171: OR_R	or 	%r5, %r14, %r23
	.word 0xb009800d  ! 171: AND_R	and 	%r6, %r13, %r24
	.word 0xaa00c00d  ! 171: ADD_R	add 	%r3, %r13, %r21
	.word 0xb409400f  ! 171: AND_R	and 	%r5, %r15, %r26
	.word 0xa209400e  ! 171: AND_R	and 	%r5, %r14, %r17
	.word 0xa4116907  ! 171: OR_I	or 	%r5, 0x0907, %r18
	.word 0xb010e131  ! 171: OR_I	or 	%r3, 0x0131, %r24
	.word 0xa401ef3e  ! 171: ADD_I	add 	%r7, 0x0f3e, %r18
	.word 0xa200c00e  ! 171: ADD_R	add 	%r3, %r14, %r17
	.word 0xaa012007  ! 171: ADD_I	add 	%r4, 0x0007, %r21
	.word 0xba08e920  ! 171: AND_I	and 	%r3, 0x0920, %r29
	.word 0xb608eeed  ! 171: AND_I	and 	%r3, 0x0eed, %r27
	.word 0xba08c00e  ! 171: AND_R	and 	%r3, %r14, %r29
	.word 0xae11800e  ! 171: OR_R	or 	%r6, %r14, %r23
	.word 0xb609aff0  ! 171: AND_I	and 	%r6, 0x0ff0, %r27
	.word 0xa801000c  ! 171: ADD_R	add 	%r4, %r12, %r20
	.word 0xba11c00e  ! 171: OR_R	or 	%r7, %r14, %r29
	.word 0xb4096f38  ! 171: AND_I	and 	%r5, 0x0f38, %r26
	.word 0xb00a000a  ! 171: AND_R	and 	%r8, %r10, %r24
	.word 0xb208c00c  ! 171: AND_R	and 	%r3, %r12, %r25
	.word 0xe4316358  ! 171: STH_I	sth	%r18, [%r5 + 0x0358]
	.word 0xe421e884  ! 171: STW_I	stw	%r18, [%r7 + 0x0884]
	.word 0xf220ee38  ! 171: STW_I	stw	%r25, [%r3 + 0x0e38]
	.word 0xf871aea8  ! 171: STX_I	stx	%r28, [%r6 + 0x0ea8]
	.word 0xe471aaa8  ! 171: STX_I	stx	%r18, [%r6 + 0x0aa8]
	.word 0xf630e36c  ! 171: STH_I	sth	%r27, [%r3 + 0x036c]
	.word 0xea296d59  ! 171: STB_I	stb	%r21, [%r5 + 0x0d59]
	.word 0xea594009  ! 171: LDX_R	ldx	[%r5 + %r9], %r21
	.word 0xc0f00962  ! 173: STXA_R	stxa	%r0, [%r0 + %r2] 0x4b
	.word 0xf322000f  ! 175: STF_R	st	%f25, [%r15, %r8]
	.word 0xa212000e  ! 175: OR_R	or 	%r8, %r14, %r17
	.word 0xa2122ac9  ! 175: OR_I	or 	%r8, 0x0ac9, %r17
	setx  0x0000000000000a80, %r16, %r9
	bne thr0_loop_11
	subcc %g1, 0x1, %g1
!Generating store_chunk_2
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr0_loop_12:
	.word 0xae01400f  ! 183: ADD_R	add 	%r5, %r15, %r23
	.word 0xb4012805  ! 183: ADD_I	add 	%r4, 0x0805, %r26
	.word 0xac09e393  ! 183: AND_I	and 	%r7, 0x0393, %r22
	.word 0xb409800b  ! 183: AND_R	and 	%r6, %r11, %r26
	.word 0xb601800c  ! 183: ADD_R	add 	%r6, %r12, %r27
	.word 0xa809a27c  ! 183: AND_I	and 	%r6, 0x027c, %r20
	.word 0xaa112d13  ! 183: OR_I	or 	%r4, 0x0d13, %r21
	.word 0xba01000f  ! 183: ADD_R	add 	%r4, %r15, %r29
	.word 0xb010c00d  ! 183: OR_R	or 	%r3, %r13, %r24
	.word 0xb60a0009  ! 183: AND_R	and 	%r8, %r9, %r27
	.word 0xa60161bb  ! 183: ADD_I	add 	%r5, 0x01bb, %r19
	.word 0xaa09400d  ! 183: AND_R	and 	%r5, %r13, %r21
	.word 0xa610ec8f  ! 183: OR_I	or 	%r3, 0x0c8f, %r19
	.word 0xaa01400c  ! 183: ADD_R	add 	%r5, %r12, %r21
	.word 0xb400c00a  ! 183: ADD_R	add 	%r3, %r10, %r26
	.word 0xbe096623  ! 183: AND_I	and 	%r5, 0x0623, %r31
	.word 0xbc08c00c  ! 183: AND_R	and 	%r3, %r12, %r30
	.word 0xba11e127  ! 183: OR_I	or 	%r7, 0x0127, %r29
	.word 0xb6096842  ! 183: AND_I	and 	%r5, 0x0842, %r27
	.word 0xae01e339  ! 183: ADD_I	add 	%r7, 0x0339, %r23
	.word 0xba122560  ! 183: OR_I	or 	%r8, 0x0560, %r29
	.word 0xa611400a  ! 183: OR_R	or 	%r5, %r10, %r19
	.word 0xb601a5e1  ! 183: ADD_I	add 	%r6, 0x05e1, %r27
	.word 0xaa01c00a  ! 183: ADD_R	add 	%r7, %r10, %r21
	.word 0xa212000d  ! 183: OR_R	or 	%r8, %r13, %r17
	.word 0xb410efcc  ! 183: OR_I	or 	%r3, 0x0fcc, %r26
	.word 0xac092200  ! 183: AND_I	and 	%r4, 0x0200, %r22
	.word 0xae022c16  ! 183: ADD_I	add 	%r8, 0x0c16, %r23
	.word 0xbc096929  ! 183: AND_I	and 	%r5, 0x0929, %r30
	.word 0xb411a06d  ! 183: OR_I	or 	%r6, 0x006d, %r26
	.word 0xaa08c00c  ! 183: AND_R	and 	%r3, %r12, %r21
	.word 0xaa11000f  ! 183: OR_R	or 	%r4, %r15, %r21
	.word 0xbc09a318  ! 183: AND_I	and 	%r6, 0x0318, %r30
	.word 0xa402000b  ! 183: ADD_R	add 	%r8, %r11, %r18
	.word 0xb401c00a  ! 183: ADD_R	add 	%r7, %r10, %r26
	.word 0xb411a270  ! 183: OR_I	or 	%r6, 0x0270, %r26
	.word 0xa409c00b  ! 183: AND_R	and 	%r7, %r11, %r18
	.word 0xaa02000e  ! 183: ADD_R	add 	%r8, %r14, %r21
	.word 0xb0116fe3  ! 183: OR_I	or 	%r5, 0x0fe3, %r24
	.word 0xae116084  ! 183: OR_I	or 	%r5, 0x0084, %r23
	.word 0xa809ef31  ! 183: AND_I	and 	%r7, 0x0f31, %r20
	.word 0xb001800d  ! 183: ADD_R	add 	%r6, %r13, %r24
	.word 0xaa122fbb  ! 183: OR_I	or 	%r8, 0x0fbb, %r21
	.word 0xb0018009  ! 183: ADD_R	add 	%r6, %r9, %r24
	.word 0xac010009  ! 183: ADD_R	add 	%r4, %r9, %r22
	.word 0xa200c009  ! 183: ADD_R	add 	%r3, %r9, %r17
	.word 0xb210c00d  ! 183: OR_R	or 	%r3, %r13, %r25
	.word 0xa800c00e  ! 183: ADD_R	add 	%r3, %r14, %r20
	.word 0xac02251f  ! 183: ADD_I	add 	%r8, 0x051f, %r22
	.word 0xa61224b8  ! 183: OR_I	or 	%r8, 0x04b8, %r19
	.word 0xb8012e96  ! 183: ADD_I	add 	%r4, 0x0e96, %r28
	.word 0xbc01800b  ! 183: ADD_R	add 	%r6, %r11, %r30
	.word 0xb2092a44  ! 183: AND_I	and 	%r4, 0x0a44, %r25
	.word 0xb2022ea3  ! 183: ADD_I	add 	%r8, 0x0ea3, %r25
	.word 0xbe01e09d  ! 183: ADD_I	add 	%r7, 0x009d, %r31
	.word 0xbc00c00f  ! 183: ADD_R	add 	%r3, %r15, %r30
	.word 0xb808e414  ! 183: AND_I	and 	%r3, 0x0414, %r28
	.word 0xa410e1eb  ! 183: OR_I	or 	%r3, 0x01eb, %r18
	.word 0xac09800f  ! 183: AND_R	and 	%r6, %r15, %r22
	.word 0xbe11acb4  ! 183: OR_I	or 	%r6, 0x0cb4, %r31
	.word 0xb210ed6d  ! 183: OR_I	or 	%r3, 0x0d6d, %r25
	.word 0xbe0923c2  ! 183: AND_I	and 	%r4, 0x03c2, %r31
	.word 0xa6112aaf  ! 183: OR_I	or 	%r4, 0x0aaf, %r19
	.word 0xb2120009  ! 183: OR_R	or 	%r8, %r9, %r25
	.word 0xbe02000b  ! 183: ADD_R	add 	%r8, %r11, %r31
	.word 0xb012000a  ! 183: OR_R	or 	%r8, %r10, %r24
	.word 0xb612297d  ! 183: OR_I	or 	%r8, 0x097d, %r27
	.word 0xa401283f  ! 183: ADD_I	add 	%r4, 0x083f, %r18
	.word 0xba1125db  ! 183: OR_I	or 	%r4, 0x05db, %r29
	.word 0xbc00c009  ! 183: ADD_R	add 	%r3, %r9, %r30
	.word 0xa809a366  ! 183: AND_I	and 	%r6, 0x0366, %r20
	.word 0xa211af12  ! 183: OR_I	or 	%r6, 0x0f12, %r17
	.word 0xbc08c00e  ! 183: AND_R	and 	%r3, %r14, %r30
	.word 0xb0122b4b  ! 183: OR_I	or 	%r8, 0x0b4b, %r24
	.word 0xb408e89a  ! 183: AND_I	and 	%r3, 0x089a, %r26
	.word 0xb609000e  ! 183: AND_R	and 	%r4, %r14, %r27
	.word 0xbe09800b  ! 183: AND_R	and 	%r6, %r11, %r31
	.word 0xbe01000b  ! 183: ADD_R	add 	%r4, %r11, %r31
	.word 0xba0a000a  ! 183: AND_R	and 	%r8, %r10, %r29
	.word 0xb0092f06  ! 183: AND_I	and 	%r4, 0x0f06, %r24
	.word 0xba09000a  ! 183: AND_R	and 	%r4, %r10, %r29
	.word 0xac10c00a  ! 183: OR_R	or 	%r3, %r10, %r22
	.word 0xb401400d  ! 183: ADD_R	add 	%r5, %r13, %r26
	.word 0xb411000d  ! 183: OR_R	or 	%r4, %r13, %r26
	.word 0xb21225ac  ! 183: OR_I	or 	%r8, 0x05ac, %r25
	.word 0xba09c00a  ! 183: AND_R	and 	%r7, %r10, %r29
	.word 0xb809c00f  ! 183: AND_R	and 	%r7, %r15, %r28
	.word 0xb009800f  ! 183: AND_R	and 	%r6, %r15, %r24
	.word 0xa21228e6  ! 183: OR_I	or 	%r8, 0x08e6, %r17
	.word 0xa811400a  ! 183: OR_R	or 	%r5, %r10, %r20
	.word 0xaa09400c  ! 183: AND_R	and 	%r5, %r12, %r21
	.word 0xae09000c  ! 183: AND_R	and 	%r4, %r12, %r23
	.word 0xa609aff1  ! 183: AND_I	and 	%r6, 0x0ff1, %r19
	.word 0xa201400e  ! 183: ADD_R	add 	%r5, %r14, %r17
	.word 0xa209afd9  ! 183: AND_I	and 	%r6, 0x0fd9, %r17
	.word 0xbc08c00c  ! 183: AND_R	and 	%r3, %r12, %r30
	.word 0xb411000a  ! 183: OR_R	or 	%r4, %r10, %r26
	.word 0xa412000e  ! 183: OR_R	or 	%r8, %r14, %r18
	.word 0xb809e254  ! 183: AND_I	and 	%r7, 0x0254, %r28
	.word 0xac11c00d  ! 183: OR_R	or 	%r7, %r13, %r22
	.word 0xbc11e91d  ! 183: OR_I	or 	%r7, 0x091d, %r30
	.word 0xaa00c00a  ! 183: ADD_R	add 	%r3, %r10, %r21
	.word 0xbc10e48b  ! 183: OR_I	or 	%r3, 0x048b, %r30
	.word 0xbc112e4c  ! 183: OR_I	or 	%r4, 0x0e4c, %r30
	.word 0xb401400a  ! 183: ADD_R	add 	%r5, %r10, %r26
	.word 0xa211a81e  ! 183: OR_I	or 	%r6, 0x081e, %r17
	.word 0xaa11eca8  ! 183: OR_I	or 	%r7, 0x0ca8, %r21
	.word 0xb412000b  ! 183: OR_R	or 	%r8, %r11, %r26
	.word 0xbc11c00a  ! 183: OR_R	or 	%r7, %r10, %r30
	.word 0xba090009  ! 183: AND_R	and 	%r4, %r9, %r29
	.word 0xb412000f  ! 183: OR_R	or 	%r8, %r15, %r26
	.word 0xb0022ba5  ! 183: ADD_I	add 	%r8, 0x0ba5, %r24
	.word 0xa401a7a6  ! 183: ADD_I	add 	%r6, 0x07a6, %r18
	.word 0xb611e70a  ! 183: OR_I	or 	%r7, 0x070a, %r27
	.word 0xa212000d  ! 183: OR_R	or 	%r8, %r13, %r17
	.word 0xba122a55  ! 183: OR_I	or 	%r8, 0x0a55, %r29
	.word 0xb008c00b  ! 183: AND_R	and 	%r3, %r11, %r24
	.word 0xaa09e352  ! 183: AND_I	and 	%r7, 0x0352, %r21
	.word 0xbc09000a  ! 183: AND_R	and 	%r4, %r10, %r30
	.word 0xbe10e4ba  ! 183: OR_I	or 	%r3, 0x04ba, %r31
	.word 0xb402000f  ! 183: ADD_R	add 	%r8, %r15, %r26
	.word 0xaa00c00c  ! 183: ADD_R	add 	%r3, %r12, %r21
	.word 0xba0926bf  ! 183: AND_I	and 	%r4, 0x06bf, %r29
	.word 0xbe016f7a  ! 183: ADD_I	add 	%r5, 0x0f7a, %r31
	.word 0xa80a000a  ! 183: AND_R	and 	%r8, %r10, %r20
	.word 0xaa01a6c6  ! 183: ADD_I	add 	%r6, 0x06c6, %r21
	.word 0xbc0223dd  ! 183: ADD_I	add 	%r8, 0x03dd, %r30
	.word 0xb009c00f  ! 183: AND_R	and 	%r7, %r15, %r24
	.word 0xbe01a419  ! 183: ADD_I	add 	%r6, 0x0419, %r31
	.word 0xb801400d  ! 183: ADD_R	add 	%r5, %r13, %r28
	.word 0xa60123d4  ! 183: ADD_I	add 	%r4, 0x03d4, %r19
	.word 0xb811000a  ! 183: OR_R	or 	%r4, %r10, %r28
	.word 0xba00c00d  ! 183: ADD_R	add 	%r3, %r13, %r29
	.word 0xb400e2b6  ! 183: ADD_I	add 	%r3, 0x02b6, %r26
	.word 0xb400e618  ! 183: ADD_I	add 	%r3, 0x0618, %r26
	.word 0xb40229ef  ! 183: ADD_I	add 	%r8, 0x09ef, %r26
	.word 0xb6022f57  ! 183: ADD_I	add 	%r8, 0x0f57, %r27
	.word 0xb411400f  ! 183: OR_R	or 	%r5, %r15, %r26
	.word 0xaa09800b  ! 183: AND_R	and 	%r6, %r11, %r21
	.word 0xa401a219  ! 183: ADD_I	add 	%r6, 0x0219, %r18
	.word 0xb601e0fd  ! 183: ADD_I	add 	%r7, 0x00fd, %r27
	.word 0xbc08e6d0  ! 183: AND_I	and 	%r3, 0x06d0, %r30
	.word 0xb20a000f  ! 183: AND_R	and 	%r8, %r15, %r25
	.word 0xb8114009  ! 183: OR_R	or 	%r5, %r9, %r28
	.word 0xae09ada3  ! 183: AND_I	and 	%r6, 0x0da3, %r23
	.word 0xb211e4c9  ! 183: OR_I	or 	%r7, 0x04c9, %r25
	.word 0xaa09000d  ! 183: AND_R	and 	%r4, %r13, %r21
	.word 0xa801000e  ! 183: ADD_R	add 	%r4, %r14, %r20
	.word 0xae10c00c  ! 183: OR_R	or 	%r3, %r12, %r23
	.word 0xb410eda7  ! 183: OR_I	or 	%r3, 0x0da7, %r26
	.word 0xa411400c  ! 183: OR_R	or 	%r5, %r12, %r18
	.word 0xba12000d  ! 183: OR_R	or 	%r8, %r13, %r29
	.word 0xb200e8e6  ! 183: ADD_I	add 	%r3, 0x08e6, %r25
	.word 0xb21222f6  ! 183: OR_I	or 	%r8, 0x02f6, %r25
	.word 0xb201e8ac  ! 183: ADD_I	add 	%r7, 0x08ac, %r25
	.word 0xa4012775  ! 183: ADD_I	add 	%r4, 0x0775, %r18
	.word 0xb009e98f  ! 183: AND_I	and 	%r7, 0x098f, %r24
	.word 0xb4012d2e  ! 183: ADD_I	add 	%r4, 0x0d2e, %r26
	.word 0xf4316f80  ! 183: STH_I	sth	%r26, [%r5 + 0x0f80]
	.word 0xe829eccd  ! 183: STB_I	stb	%r20, [%r7 + 0x0ccd]
	.word 0xfe71e668  ! 183: STX_I	stx	%r31, [%r7 + 0x0668]
	.word 0xf62222ec  ! 183: STW_I	stw	%r27, [%r8 + 0x02ec]
	.word 0xfa71ea08  ! 183: STX_I	stx	%r29, [%r7 + 0x0a08]
	.word 0xfe71e9c0  ! 183: STX_I	stx	%r31, [%r7 + 0x09c0]
	.word 0xfe29209a  ! 183: STB_I	stb	%r31, [%r4 + 0x009a]
!Illinst
	.word 0xa611affb  ! 185: OR_I	or 	%r6, 0x0ffb, %r19
	.word 0xc0f00982  ! 187: STXA_R	stxa	%r0, [%r0 + %r2] 0x4c
	.word 0xef21a1f4  ! 189: STF_I	st	%f23, [0x01f4, %r6]
	.word 0xb009ed50  ! 189: AND_I	and 	%r7, 0x0d50, %r24
	.word 0xb800c00c  ! 189: ADD_R	add 	%r3, %r12, %r28
	.word 0xb6018009  ! 189: ADD_R	add 	%r6, %r9, %r27
	bne thr0_loop_12
	subcc %g1, 0x1, %g1
!Generating store_chunk_2
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr0_loop_13:
	.word 0xb609800c  ! 197: AND_R	and 	%r6, %r12, %r27
	.word 0xb601aa04  ! 197: ADD_I	add 	%r6, 0x0a04, %r27
	.word 0xb811400d  ! 197: OR_R	or 	%r5, %r13, %r28
	.word 0xaa10c00f  ! 197: OR_R	or 	%r3, %r15, %r21
	.word 0xbe09a804  ! 197: AND_I	and 	%r6, 0x0804, %r31
	.word 0xa811000b  ! 197: OR_R	or 	%r4, %r11, %r20
	.word 0xbc01ea65  ! 197: ADD_I	add 	%r7, 0x0a65, %r30
	.word 0xae11e64b  ! 197: OR_I	or 	%r7, 0x064b, %r23
	.word 0xb6110009  ! 197: OR_R	or 	%r4, %r9, %r27
	.word 0xa609e1bd  ! 197: AND_I	and 	%r7, 0x01bd, %r19
	.word 0xb601c00c  ! 197: ADD_R	add 	%r7, %r12, %r27
	.word 0xa411ae8a  ! 197: OR_I	or 	%r6, 0x0e8a, %r18
	.word 0xaa090009  ! 197: AND_R	and 	%r4, %r9, %r21
	.word 0xb801400c  ! 197: ADD_R	add 	%r5, %r12, %r28
	.word 0xa409800c  ! 197: AND_R	and 	%r6, %r12, %r18
	.word 0xbe092e3f  ! 197: AND_I	and 	%r4, 0x0e3f, %r31
	.word 0xb401800d  ! 197: ADD_R	add 	%r6, %r13, %r26
	.word 0xb002000d  ! 197: ADD_R	add 	%r8, %r13, %r24
	.word 0xb210c00b  ! 197: OR_R	or 	%r3, %r11, %r25
	.word 0xa80a000a  ! 197: AND_R	and 	%r8, %r10, %r20
	.word 0xac012bd7  ! 197: ADD_I	add 	%r4, 0x0bd7, %r22
	.word 0xbc022128  ! 197: ADD_I	add 	%r8, 0x0128, %r30
	.word 0xba00c00c  ! 197: ADD_R	add 	%r3, %r12, %r29
	.word 0xbe11400a  ! 197: OR_R	or 	%r5, %r10, %r31
	.word 0xb811400b  ! 197: OR_R	or 	%r5, %r11, %r28
	.word 0xb811000b  ! 197: OR_R	or 	%r4, %r11, %r28
	.word 0xbc0a000a  ! 197: AND_R	and 	%r8, %r10, %r30
	.word 0xba09000d  ! 197: AND_R	and 	%r4, %r13, %r29
	.word 0xb2112de5  ! 197: OR_I	or 	%r4, 0x0de5, %r25
	.word 0xa80a2582  ! 197: AND_I	and 	%r8, 0x0582, %r20
	.word 0xbc09000a  ! 197: AND_R	and 	%r4, %r10, %r30
	.word 0xaa120009  ! 197: OR_R	or 	%r8, %r9, %r21
	.word 0xb0022a53  ! 197: ADD_I	add 	%r8, 0x0a53, %r24
	.word 0xa410ebce  ! 197: OR_I	or 	%r3, 0x0bce, %r18
	.word 0xb201ab20  ! 197: ADD_I	add 	%r6, 0x0b20, %r25
	.word 0xae11400f  ! 197: OR_R	or 	%r5, %r15, %r23
	.word 0xa61165e5  ! 197: OR_I	or 	%r5, 0x05e5, %r19
	.word 0xb410c00f  ! 197: OR_R	or 	%r3, %r15, %r26
	.word 0xb2092141  ! 197: AND_I	and 	%r4, 0x0141, %r25
	.word 0xbe096d7c  ! 197: AND_I	and 	%r5, 0x0d7c, %r31
	.word 0xa201c009  ! 197: ADD_R	add 	%r7, %r9, %r17
	.word 0xa800ef9d  ! 197: ADD_I	add 	%r3, 0x0f9d, %r20
	.word 0xba11000e  ! 197: OR_R	or 	%r4, %r14, %r29
	.word 0xa608ec30  ! 197: AND_I	and 	%r3, 0x0c30, %r19
	.word 0xb61222dc  ! 197: OR_I	or 	%r8, 0x02dc, %r27
	.word 0xaa016b06  ! 197: ADD_I	add 	%r5, 0x0b06, %r21
	.word 0xbe11400f  ! 197: OR_R	or 	%r5, %r15, %r31
	.word 0xa209000f  ! 197: AND_R	and 	%r4, %r15, %r17
	.word 0xb601800f  ! 197: ADD_R	add 	%r6, %r15, %r27
	.word 0xb00921a1  ! 197: AND_I	and 	%r4, 0x01a1, %r24
	.word 0xa611c00d  ! 197: OR_R	or 	%r7, %r13, %r19
	.word 0xa810e746  ! 197: OR_I	or 	%r3, 0x0746, %r20
	.word 0xa210e67d  ! 197: OR_I	or 	%r3, 0x067d, %r17
	.word 0xb210c00f  ! 197: OR_R	or 	%r3, %r15, %r25
	.word 0xbc01000f  ! 197: ADD_R	add 	%r4, %r15, %r30
	.word 0xae01000d  ! 197: ADD_R	add 	%r4, %r13, %r23
	.word 0xbe09c00e  ! 197: AND_R	and 	%r7, %r14, %r31
	.word 0xb000e3be  ! 197: ADD_I	add 	%r3, 0x03be, %r24
	.word 0xb208e86a  ! 197: AND_I	and 	%r3, 0x086a, %r25
	.word 0xb002000f  ! 197: ADD_R	add 	%r8, %r15, %r24
	.word 0xa411400f  ! 197: OR_R	or 	%r5, %r15, %r18
	.word 0xa4116356  ! 197: OR_I	or 	%r5, 0x0356, %r18
	.word 0xb201c00a  ! 197: ADD_R	add 	%r7, %r10, %r25
	.word 0xa8112589  ! 197: OR_I	or 	%r4, 0x0589, %r20
	.word 0xa6122eec  ! 197: OR_I	or 	%r8, 0x0eec, %r19
	.word 0xae018009  ! 197: ADD_R	add 	%r6, %r9, %r23
	.word 0xaa012769  ! 197: ADD_I	add 	%r4, 0x0769, %r21
	.word 0xac09e677  ! 197: AND_I	and 	%r7, 0x0677, %r22
	.word 0xbc09400e  ! 197: AND_R	and 	%r5, %r14, %r30
	.word 0xbe01a52b  ! 197: ADD_I	add 	%r6, 0x052b, %r31
	.word 0xac09ab5e  ! 197: AND_I	and 	%r6, 0x0b5e, %r22
	.word 0xb00a000a  ! 197: AND_R	and 	%r8, %r10, %r24
	.word 0xae09000e  ! 197: AND_R	and 	%r4, %r14, %r23
	.word 0xb20a000b  ! 197: AND_R	and 	%r8, %r11, %r25
	.word 0xb811000d  ! 197: OR_R	or 	%r4, %r13, %r28
	.word 0xb0122e04  ! 197: OR_I	or 	%r8, 0x0e04, %r24
	.word 0xb00a2709  ! 197: AND_I	and 	%r8, 0x0709, %r24
	.word 0xa411c00b  ! 197: OR_R	or 	%r7, %r11, %r18
	.word 0xae116be0  ! 197: OR_I	or 	%r5, 0x0be0, %r23
	.word 0xa60a0009  ! 197: AND_R	and 	%r8, %r9, %r19
	.word 0xa4114009  ! 197: OR_R	or 	%r5, %r9, %r18
	.word 0xba01400b  ! 197: ADD_R	add 	%r5, %r11, %r29
	.word 0xb611400a  ! 197: OR_R	or 	%r5, %r10, %r27
	.word 0xaa0a000c  ! 197: AND_R	and 	%r8, %r12, %r21
	.word 0xb408ea13  ! 197: AND_I	and 	%r3, 0x0a13, %r26
	.word 0xb410e167  ! 197: OR_I	or 	%r3, 0x0167, %r26
	.word 0xa211800a  ! 197: OR_R	or 	%r6, %r10, %r17
	.word 0xa209000b  ! 197: AND_R	and 	%r4, %r11, %r17
	.word 0xb809800a  ! 197: AND_R	and 	%r6, %r10, %r28
	.word 0xa208e0c6  ! 197: AND_I	and 	%r3, 0x00c6, %r17
	.word 0xb001eae3  ! 197: ADD_I	add 	%r7, 0x0ae3, %r24
	.word 0xb200e933  ! 197: ADD_I	add 	%r3, 0x0933, %r25
	.word 0xae08c00f  ! 197: AND_R	and 	%r3, %r15, %r23
	.word 0xac09ea07  ! 197: AND_I	and 	%r7, 0x0a07, %r22
	.word 0xb211e32f  ! 197: OR_I	or 	%r7, 0x032f, %r25
	.word 0xb201280a  ! 197: ADD_I	add 	%r4, 0x080a, %r25
	.word 0xaa01e784  ! 197: ADD_I	add 	%r7, 0x0784, %r21
	.word 0xbc01eda4  ! 197: ADD_I	add 	%r7, 0x0da4, %r30
	.word 0xa401a6f1  ! 197: ADD_I	add 	%r6, 0x06f1, %r18
	.word 0xaa01c00d  ! 197: ADD_R	add 	%r7, %r13, %r21
	.word 0xb809c00f  ! 197: AND_R	and 	%r7, %r15, %r28
	.word 0xa601400b  ! 197: ADD_R	add 	%r5, %r11, %r19
	.word 0xb80964d9  ! 197: AND_I	and 	%r5, 0x04d9, %r28
	.word 0xb009a93e  ! 197: AND_I	and 	%r6, 0x093e, %r24
	.word 0xb409400d  ! 197: AND_R	and 	%r5, %r13, %r26
	.word 0xa610efdf  ! 197: OR_I	or 	%r3, 0x0fdf, %r19
	.word 0xb411800b  ! 197: OR_R	or 	%r6, %r11, %r26
	.word 0xbe0164aa  ! 197: ADD_I	add 	%r5, 0x04aa, %r31
	.word 0xbe09c00e  ! 197: AND_R	and 	%r7, %r14, %r31
	.word 0xb611e737  ! 197: OR_I	or 	%r7, 0x0737, %r27
	.word 0xba090009  ! 197: AND_R	and 	%r4, %r9, %r29
	.word 0xa201800e  ! 197: ADD_R	add 	%r6, %r14, %r17
	.word 0xb6112343  ! 197: OR_I	or 	%r4, 0x0343, %r27
	.word 0xa601a558  ! 197: ADD_I	add 	%r6, 0x0558, %r19
	.word 0xbc09218d  ! 197: AND_I	and 	%r4, 0x018d, %r30
	.word 0xb801c00f  ! 197: ADD_R	add 	%r7, %r15, %r28
	.word 0xa80925b5  ! 197: AND_I	and 	%r4, 0x05b5, %r20
	.word 0xa409000e  ! 197: AND_R	and 	%r4, %r14, %r18
	.word 0xaa09c00b  ! 197: AND_R	and 	%r7, %r11, %r21
	.word 0xa201000e  ! 197: ADD_R	add 	%r4, %r14, %r17
	.word 0xa60161c2  ! 197: ADD_I	add 	%r5, 0x01c2, %r19
	.word 0xbc11a3a4  ! 197: OR_I	or 	%r6, 0x03a4, %r30
	.word 0xb802000b  ! 197: ADD_R	add 	%r8, %r11, %r28
	.word 0xb211400c  ! 197: OR_R	or 	%r5, %r12, %r25
	.word 0xb809400d  ! 197: AND_R	and 	%r5, %r13, %r28
	.word 0xa211a0ce  ! 197: OR_I	or 	%r6, 0x00ce, %r17
	.word 0xa809c00e  ! 197: AND_R	and 	%r7, %r14, %r20
	.word 0xa211400b  ! 197: OR_R	or 	%r5, %r11, %r17
	.word 0xae01c00f  ! 197: ADD_R	add 	%r7, %r15, %r23
	.word 0xbc0a2353  ! 197: AND_I	and 	%r8, 0x0353, %r30
	.word 0xae09a137  ! 197: AND_I	and 	%r6, 0x0137, %r23
	.word 0xac01e0d8  ! 197: ADD_I	add 	%r7, 0x00d8, %r22
	.word 0xaa116c75  ! 197: OR_I	or 	%r5, 0x0c75, %r21
	.word 0xa808ec86  ! 197: AND_I	and 	%r3, 0x0c86, %r20
	.word 0xa208e24c  ! 197: AND_I	and 	%r3, 0x024c, %r17
	.word 0xba01e79c  ! 197: ADD_I	add 	%r7, 0x079c, %r29
	.word 0xb811800a  ! 197: OR_R	or 	%r6, %r10, %r28
	.word 0xbe02281c  ! 197: ADD_I	add 	%r8, 0x081c, %r31
	.word 0xb600e374  ! 197: ADD_I	add 	%r3, 0x0374, %r27
	.word 0xba01a64c  ! 197: ADD_I	add 	%r6, 0x064c, %r29
	.word 0xba02000f  ! 197: ADD_R	add 	%r8, %r15, %r29
	.word 0xbc11400c  ! 197: OR_R	or 	%r5, %r12, %r30
	.word 0xb601800b  ! 197: ADD_R	add 	%r6, %r11, %r27
	.word 0xae09c00f  ! 197: AND_R	and 	%r7, %r15, %r23
	.word 0xae11800c  ! 197: OR_R	or 	%r6, %r12, %r23
	.word 0xa61228f8  ! 197: OR_I	or 	%r8, 0x08f8, %r19
	.word 0xa211400a  ! 197: OR_R	or 	%r5, %r10, %r17
	.word 0xba00ef0e  ! 197: ADD_I	add 	%r3, 0x0f0e, %r29
	.word 0xa211ed74  ! 197: OR_I	or 	%r7, 0x0d74, %r17
	.word 0xb401800b  ! 197: ADD_R	add 	%r6, %r11, %r26
	.word 0xb40a000e  ! 197: AND_R	and 	%r8, %r14, %r26
	.word 0xb4116324  ! 197: OR_I	or 	%r5, 0x0324, %r26
	.word 0xa411e615  ! 197: OR_I	or 	%r7, 0x0615, %r18
	.word 0xbc11400a  ! 197: OR_R	or 	%r5, %r10, %r30
	.word 0xbc11af8f  ! 197: OR_I	or 	%r6, 0x0f8f, %r30
	.word 0xbc0229c2  ! 197: ADD_I	add 	%r8, 0x09c2, %r30
	.word 0xac01251f  ! 197: ADD_I	add 	%r4, 0x051f, %r22
	.word 0xb210c00b  ! 197: OR_R	or 	%r3, %r11, %r25
	.word 0xac0a000f  ! 197: AND_R	and 	%r8, %r15, %r22
	.word 0xae01800d  ! 197: ADD_R	add 	%r6, %r13, %r23
	.word 0xac00c009  ! 197: ADD_R	add 	%r3, %r9, %r22
	.word 0xa801000a  ! 197: ADD_R	add 	%r4, %r10, %r20
	.word 0xac09c00c  ! 197: AND_R	and 	%r7, %r12, %r22
	.word 0xa401800e  ! 197: ADD_R	add 	%r6, %r14, %r18
	.word 0xb009c00d  ! 197: AND_R	and 	%r7, %r13, %r24
	.word 0xb00a2969  ! 197: AND_I	and 	%r8, 0x0969, %r24
	.word 0xb601c00f  ! 197: ADD_R	add 	%r7, %r15, %r27
	.word 0xac10c00b  ! 197: OR_R	or 	%r3, %r11, %r22
	.word 0xb411c00e  ! 197: OR_R	or 	%r7, %r14, %r26
	.word 0xb001291f  ! 197: ADD_I	add 	%r4, 0x091f, %r24
	.word 0xa601400a  ! 197: ADD_R	add 	%r5, %r10, %r19
	.word 0xa602000c  ! 197: ADD_R	add 	%r8, %r12, %r19
	.word 0xa211ef49  ! 197: OR_I	or 	%r7, 0x0f49, %r17
	.word 0xbc01e215  ! 197: ADD_I	add 	%r7, 0x0215, %r30
	.word 0xb800c00a  ! 197: ADD_R	add 	%r3, %r10, %r28
	.word 0xb208eb5f  ! 197: AND_I	and 	%r3, 0x0b5f, %r25
	.word 0xb811e991  ! 197: OR_I	or 	%r7, 0x0991, %r28
	.word 0xa810e250  ! 197: OR_I	or 	%r3, 0x0250, %r20
	.word 0xb611abb8  ! 197: OR_I	or 	%r6, 0x0bb8, %r27
	.word 0xa210e9bf  ! 197: OR_I	or 	%r3, 0x09bf, %r17
	.word 0xb001ab17  ! 197: ADD_I	add 	%r6, 0x0b17, %r24
	.word 0xb4112a45  ! 197: OR_I	or 	%r4, 0x0a45, %r26
	.word 0xfc21a478  ! 197: STW_I	stw	%r30, [%r6 + 0x0478]
	.word 0xfa322238  ! 197: STH_I	sth	%r29, [%r8 + 0x0238]
	.word 0xe828e3af  ! 197: STB_I	stb	%r20, [%r3 + 0x03af]
	.word 0xfe29efc8  ! 197: STB_I	stb	%r31, [%r7 + 0x0fc8]
	.word 0xea21e758  ! 197: STW_I	stw	%r21, [%r7 + 0x0758]
	.word 0xe8312006  ! 197: STH_I	sth	%r20, [%r4 + 0x0006]
	.word 0xf031a8e2  ! 197: STH_I	sth	%r24, [%r6 + 0x08e2]
thr0_dc_err_1:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_1), 16, 16),2,DC_DATA,3)
	.word 0xf041800a  ! 199: LDSW_R	ldsw	[%r6 + %r10], %r24

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
	.word  0x078a0bfb,0x1bff5a98,0xadfc1129,0x03c071f4
	.word  0x5b2f0074,0x140e3eff,0x10c28823,0x75e047c1
	.word  0x75d8899d,0xa9337119,0x736b24ad,0x0b4509d6
	.word  0x3957a409,0xab878287,0xf5699c01,0xd5b55eb9
	.word  0x9a2fe32f,0xe90a76f9,0xf6d2644e,0x33d02090
	.word  0xfeb25503,0xb275108e,0xdfd2f9f2,0xd141762f
	.word  0x1c605234,0xf94afdef,0x1505837f,0x05151e4f
	.word  0xd3dfbbe4,0x1b61e489,0x468da79c,0xbda71288
	.word  0x44a89b23,0x56827ef2,0xeb88f26b,0xe154c5e2
	.word  0x4ee28f35,0x29d7ba8d,0x0c62b730,0x9ce4e7a8
	.word  0x2e3b60ee,0xe648a6ec,0x50aee751,0x882b255d
	.word  0x2df33089,0xb438532c,0xfb7141db,0xbaf5a803
	.word  0x56710de8,0x5074b97c,0x34e61a17,0x9d79105c
	.word  0x8be4a9fa,0x680ffb61,0xd0ba7162,0xa97a51d3
	.word  0xc387b64a,0x3e2b943d,0xca48dfd8,0x1fcd162c
	.word  0x05056c74,0xce5778b5,0xb11de24b,0x0cc462fe
	.word  0x04b45d5d,0x5660a075,0x0d18d2f6,0xca74fd24
	.word  0x13f63465,0x8a3b7e79,0xab9c3c80,0x97c41065
	.word  0x360424f8,0xeb2bbd28,0xb60ae252,0xa261b7bb
	.word  0xf1067f42,0x3e632c9e,0x5230c62f,0x09d2ac73
	.word  0xc1cc165a,0xe6a36e6f,0x165df501,0x462f85fc
	.word  0x024ba6b5,0x8f8c0647,0x35a536cf,0x9b722102
	.word  0x02feb564,0xe9815a4a,0x6a239072,0x62ad98c2
	.word  0xa9fdb3ee,0x3085bc71,0x58695cda,0x40b3e295
	.word  0x3f1080d6,0xe0e377f8,0xfc27f2dc,0x2297f31b
	.word  0xb976177d,0xebb7c26c,0x1ea00e8e,0xa2282f01
	.word  0x51e6efe6,0x8532603a,0x4c88132b,0xcb15df08
	.word  0x2454ac4b,0x0e6c0be6,0x2543d094,0xd79861b0
	.word  0x3efc986e,0x3a4b89bc,0xc086806f,0xe2067b4d
	.word  0xaa3826bb,0x56814a72,0xf4dd8ae1,0xd69afc53
	.word  0x47241540,0x3fc7e379,0x3f0c812c,0x61631d31
	.word  0x19a1667c,0x00d8a7a0,0xf9f9f643,0x61a2867b
	.word  0x51e3a4a5,0xea0ce77c,0x3ff8649f,0x7af0d323
	.word  0x56791b46,0xf8dbc100,0x7b0fb7b5,0x46bd5fe4
	.word  0x87fb0ec7,0xff37011f,0x86811a54,0xe2294a92
	.word  0x354bcb75,0xd879dd99,0x53a7c661,0x085a07d7
	.word  0x1835203d,0x179a1ea2,0xf912181b,0xa4581cc3
	.word  0x088a6ac9,0x4df6562a,0x8ad87c0a,0x42f7810a
	.word  0x5d48d203,0xf0e0219e,0x6e8ed267,0x6342dade
	.word  0x34f0d811,0xa8a18a17,0x6b1a5059,0xeb780406
	.word  0x6dd3c324,0xe5211dcd,0xf4a51806,0x85e20091
	.word  0x77432291,0xf1926b1d,0xbfc2081c,0x157e2301
	.word  0xd6421192,0x906e8db7,0x44d1f268,0xe27a0af2
	.word  0x9437d270,0x7edecb3d,0xee88cf14,0xed880c81
	.word  0xd840b911,0x6be2d835,0x23993548,0xb1bf86f2
	.word  0x52225b2a,0xd22831ef,0x1615ff31,0xad3fc5c1
	.word  0x5e3f4d73,0xe8f119c1,0x050b54d7,0xf23ac4ae
	.word  0xa5cd97eb,0x95da7490,0x06c27fca,0xda3a29f7
	.word  0xd7039cb6,0x9456147b,0xc88d6c07,0x0e12e178
	.word  0x1fa39956,0xc477f5bd,0x66d708cf,0x49568859
	.word  0x723adbbd,0xb85c453e,0x24902510,0xb68f3492
	.word  0x9bf61d86,0x8ea06754,0x5a58c5d4,0x31daccf1
	.word  0x95d4c090,0x3e9f6100,0xecd5d21a,0x98065d38
	.word  0x78262bc0,0xafb7d00a,0x3b6b7f3b,0xd10fce8e
	.word  0xe0817f40,0xf09b59f3,0x830c8fa0,0x1e152a30
	.word  0x9cecc931,0x7a97a265,0x820417d0,0xb01eea21
	.word  0xc356d889,0x2144460b,0x551f210d,0x64723692
	.word  0x421cf962,0x40f0fa11,0x4690fd6f,0xd005efce
	.word  0xde708b98,0x6c381207,0x4a09c710,0xdae788bd
	.word  0xce99a4b4,0xab19c7ae,0x806867b7,0x051765e5
	.word  0xb216dda4,0x7d6889ad,0x60b88734,0xf53af7a3
	.word  0x1831a56b,0x8dff73f9,0xe5faed7b,0xb3603be5
	.word  0x17bcc6a3,0xc0a23c62,0x149a1a25,0x9fc5eb05
	.word  0x9abb1592,0xda0a5671,0x30d14176,0x642fecd3
	.word  0x927ad03d,0x426dbbfc,0xfc757a84,0x8bbbee39
	.word  0xefc88197,0xe0d69046,0xdfcb9f41,0x5d2c4e8e
	.word  0x06f7eb75,0x203bb606,0xbfdc9122,0x13be7c07
	.word  0x482e5e13,0x03e1baad,0x7dddb48c,0x6a5903dc
	.word  0x508d4daf,0x369b4216,0x70ae78b3,0xef12c760
	.word  0x95ae4087,0x6d1b6a38,0xcb4d7952,0xde625435
	.word  0x5ef4385a,0x52906139,0x4d57acea,0xc8487fd7
	.word  0x016a744c,0x76cf54ef,0xdec65b4d,0x205b2c30
	.word  0xd14068b3,0x6a01ead7,0xe45c08df,0x2ef74d4c
	.word  0x3b2c2256,0x92a06e6d,0xa20f00cf,0x5c281e07
	.word  0xa45b8561,0x98fec968,0xc892d25c,0x4f617091
	.word  0x8fb5eed9,0x6d6f4c22,0x747690db,0xfb9aa6fe
	.word  0xf3efefe1,0x56ccde30,0x46484c17,0x31678961
	.word  0xbcc36f30,0xc7ab68d0,0x6d6b498e,0x137ec753
	.word  0xd0fcf12b,0xe25a2f75,0xcc91591e,0xff60985f
	.word  0x08ab2890,0x6ec3daae,0x81a65a6f,0xf9648003
	.word  0x77f4711a,0xabc83855,0xee01daed,0xe8771df3
	.word  0x8e64637b,0xe5a88c07,0xe8084cc9,0xdbe0a377
	.word  0x5cecd1c6,0x21eb9506,0xfaf2139c,0x44f23313
	.word  0xf97ce01b,0xbb463a65,0x6b5a79e0,0x5aff85b3
	.word  0x0c5296c9,0x96afd758,0x29e88e59,0xb21f39be
	.word  0xf128103d,0xe9ebad73,0xb25ae7e8,0x1136d2b0
	.word  0x273d43f1,0x47e0d310,0x2523498e,0xd751319a
	.word  0xe1c30ca4,0x8c509628,0x1b07a4d6,0xf47e209c
	.word  0x91d620fb,0x8b069f06,0x78299258,0xcdf3241c
	.word  0x7ac397b7,0xd66f8a7d,0x646b1809,0x3d88ef8d
	.word  0xd472d194,0x253007fe,0x672424f4,0x1898b293
	.word  0xc7718c53,0x14269fcb,0x1cf6ee46,0x6a565e47
	.word  0xedd1dd36,0x3f6159d9,0x002e56d1,0xec860fe3
	.word  0x135f4196,0xb252a2c4,0x8f349467,0x8bfb645e
	.word  0x5aada5ca,0xb578bd11,0x48719de4,0x4308e95b
	.word  0x2dd119c0,0x11866bff,0xd66feaca,0x9c8ba5c9
	.word  0xe34522ed,0xbff3fcb6,0xd8553935,0x3f80e56e
	.word  0xfc7aaba3,0x7553224c,0x708e9782,0xf19005bc
	.word  0xe9d17c6e,0x0f2d1a7d,0x573b8dc0,0x3994e6ae
	.word  0x97492627,0x98568cd6,0xcc10d619,0xa7c1c533
	.word  0xc62e45f9,0xf69ad41e,0x06a9e0f4,0xce73fddf
	.word  0x4f2883cd,0x3be7ab21,0x0e1e336c,0xfdff06b3
	.word  0x11665793,0xec535b7b,0x39286727,0x86b4bb78
	.word  0xdcc0078a,0x609aa7c9,0xb551a555,0xf1ddab53
	.word  0x7769a92b,0xb3ce3472,0xbc84e793,0x89bfe4fa
	.word  0x662179f1,0x43bd9551,0x39e30ddb,0x779a9007
	.word  0x81c9275a,0x65b43401,0x6768fe13,0xbc8d38d1
	.word  0x10b8a42e,0x5cd5bd76,0x3665533e,0x44d02888
	.word  0x0918fe1e,0x8022ad4e,0x9a1eadbc,0x4bf5c379
	.word  0xaec21102,0xeb27ddf8,0xa8ef44a2,0x5046312d
	.word  0x42326386,0x852b3624,0x5473e356,0xa3971f27
	.word  0x307c76bc,0xafcebd9b,0x677e9355,0x981af72e
	.word  0xc778cbd2,0x45b7217a,0xeee45e07,0x67668124
	.word  0xc1511135,0x101ea0e6,0x73d12f59,0xc3d0ddd9
	.word  0x7c325715,0x6958e515,0xf03487df,0x94423e87
	.word  0x121ba59d,0xe55d8e79,0x6f918efd,0x1f972608
	.word  0x05da108a,0x44d2d0af,0x76241bbd,0x09a38dba
	.word  0x4e1515ee,0x68e5ac35,0xcad6bf45,0xe8f4fb79
	.word  0xf0c697d2,0xf387b006,0x43ee23e5,0xf43d8da6
	.word  0x498925d5,0xcb9f8e69,0x711156db,0x92447c85
	.word  0x2c467880,0x3dd66b98,0xb7062029,0xff83dc8c
	.word  0xc7cd5ad4,0x7e377839,0x18681152,0x73fee4ee
	.word  0xbabb02bb,0x8219a730,0x70ef53b2,0x196b1c83
	.word  0x80436d81,0xf8245cb6,0x9af16e47,0x3e83f75a
	.word  0x938bebf7,0xcc74ba27,0x6e140b49,0xb844519b
	.word  0x839d05c2,0x951bdb49,0x5205d72f,0xaaa89af2
	.word  0xa399ed51,0x5c4cc980,0x3107aaef,0x1f2402df
	.word  0xb98c17b1,0x93581dd3,0x013492ff,0x9ec8cb6a
	.word  0x6073830f,0xc2b99f1f,0x797e7cce,0xa230d8e8
	.word  0x8d89e27d,0x23c526a6,0x9faef280,0x929ab9f6
	.word  0x8c4b975c,0x0c64be31,0x569221ae,0xf2bd3a84
	.word  0x18a5d915,0x8c3a63f2,0xac3c1230,0xea676967
	.word  0xf056683e,0xe4fe05d0,0x8290f7af,0x1bbc1878
	.word  0xc104a097,0x70126dca,0x0fd2ab80,0x4ef267ad
	.word  0x040bcd5e,0x59a36674,0xa3f11106,0x535f7ac6
	.word  0x8cf1ef92,0x265cd62e,0x112d606d,0x36fae1d5
	.word  0x71af0bd9,0x0d4d11bb,0x4e16edb2,0x2b74a5d4
	.word  0xe02355ef,0xaaf18a11,0x38d17c92,0x3ea1544f
	.word  0x28ddcbc0,0xb0b8a30d,0x9bcf7bd1,0x1baf9675
	.word  0x45e219ca,0x2022070a,0x7187a26c,0xa4af9ba1
	.word  0xb67a670d,0x312dea34,0xde78eab3,0x0747d72e
	.word  0xe8fef607,0x506d262b,0xd27c2aff,0xe15b8bf3
	.word  0x859c60a5,0x2538ea17,0x7481c6c6,0x39823111
	.word  0x739aeaf0,0x0ec07afd,0x4fdfd7dd,0xf8d745e1
	.word  0xd6e1057f,0x70081daf,0xe40f5998,0xf4847e67
	.word  0xe1dda397,0xd07319c8,0x3a4d6c90,0xc532d9f0
	.word  0xa17f2a51,0x0c577185,0xf7452fef,0xace18177
	.word  0x1c6d2388,0x495c8f8a,0xcdf669e6,0x5c997db2
	.word  0xa30646b9,0x30cd6b66,0xc5fb0dbc,0x36b377fd
	.word  0x9e7a2edd,0xb3fe603c,0xcb863678,0x5fca7b20
	.word  0x514a363d,0x563fbf4f,0x7446d4d5,0xf089938f
	.word  0xf8726c98,0x60ed729c,0x5e932b93,0x1454ceff
	.word  0x724a3192,0xa2c97926,0x56c3b7de,0x28c6db9e
	.word  0xe6bfd487,0x6602e9f4,0xb2a83001,0x45e8fc15
	.word  0x26c9bd6b,0x65721206,0x8fdaed54,0x59961e32
	.word  0xf971cf5a,0x2c337434,0x3b44b25b,0xf2231908
	.word  0xb2958a81,0x99cb337a,0x2f2635db,0xabf7b4ba
	.word  0x4db77f8a,0x4a4ff858,0x204ceec8,0x5513cbae
	.word  0xa90d79ce,0x981ef798,0xfb773243,0x6ad3b26e
	.word  0x7afcbc7d,0xb404172c,0xb7118626,0x9b42b437
	.word  0x2b4a3520,0x31051da1,0xcb180a6b,0x2ed84296
	.word  0xfe9e02c8,0xea65eae6,0x03aabbac,0x43a7bff8
	.word  0x910eddf1,0xadc1513d,0xd05672da,0x189795cb
	.word  0x94735c70,0x5579ffcd,0xacacf400,0x1f8b4087
	.word  0x3bbfa6ce,0x43ece27f,0x73aafb2a,0x8df694cc
	.word  0xb4ed302c,0xa8ade272,0xdea6c136,0x0f3f5c36
	.word  0x14218fbe,0xff1bf914,0x29c2798b,0xba7f1060
	.word  0x027b37ee,0xd13c3569,0xa289e709,0xfe6d5d8b
	.word  0xf6767e37,0x8aeda499,0x2c9f64f0,0xf8569e6b
	.word  0xf15fa6b3,0xb7b69a5c,0xcdb25b2c,0x2595990e
	.word  0x74a5b44e,0x44e667e7,0x0faf8948,0x0b678dc6
	.word  0x00a29588,0x656fd653,0x992104eb,0x1ed80686
	.word  0x794f1a31,0x9e677ee9,0x04461bef,0xe5a9a44d
	.word  0x06d4ad38,0xba623397,0x370888ff,0x3e28bb18
	.word  0x0f534e39,0x975e1bce,0xa1910a7a,0x168a000c
	.word  0xac226cb7,0x7964bde7,0xccaf809a,0x1c6d29e7
	.word  0x666dc8bd,0x8ee54f50,0xb537ed93,0x33440e80
	.word  0xb95304d2,0x353480cd,0x6232b444,0xeffffdc3
	.word  0x54ab1874,0xb5705769,0x2329e784,0x56a7419c
	.word  0xc6340875,0x049f49e8,0x0d65f6e2,0x3c3d376a
	.word  0x06c98f85,0xae158329,0xc51aba3f,0x0112152a
	.word  0x329214ee,0x670fed47,0x04107211,0x8930ffbf
	.word  0x9f9d6d57,0xd98a44fd,0x802c1387,0xf89ed63b
	.word  0xa6a396e2,0x7b1f7020,0x72667d5d,0x0ccdd587
	.word  0x532a9e95,0xc37ecba3,0x46afa69b,0xd31fe57a
	.word  0x8d571cee,0xa1641cd1,0x5037232b,0x5e76c775
	.word  0xbb7dbe81,0x1dc8f46c,0xa7b1a3c4,0x1ada36d5
	.word  0x44d9b75a,0x0a6d263a,0x2bccf81f,0x5b850932
	.word  0xd31d0aa7,0xb7b57c79,0xcba60a20,0xbb4c9b93
	.word  0x2c7c7078,0x81e0a63d,0x44b03288,0x11f1acb5
	.word  0xc522e9ed,0xc20a1a9e,0xf9ff4230,0x3b472557
	.word  0x872b9d98,0x4dde670d,0xe0ea3b96,0xa0f37334
	.word  0xa81092f7,0x3cd68261,0x27480acc,0x2b64b646
	.word  0xf7bf6e50,0xe4b0a18b,0x053c334a,0x028b3792
	.word  0xb62147cc,0xd99ded85,0xfd84149c,0x4c0d062a
	.word  0x141a0cfb,0xca3f68bd,0x1039163c,0xffab9d9a
	.word  0x633cfc3f,0xc8d7fd4b,0x0669e7b7,0xb597bf04
	.word  0x44c4c973,0x896052ac,0x2bd7be44,0x43a06ee2
	.word  0x3fccdaf7,0x6bfe563e,0xf38a7c78,0x9d4f7d01
	.word  0x1382f0f5,0x1a189bc1,0xbf9361e7,0xe2d57971
	.word  0x904ee385,0x999b47ee,0xd8fa3079,0x5820a692
	.word  0xc8d30eb1,0xffb5218d,0xed1c43e3,0xe6bec7e9
	.word  0xdcee833c,0xea4ef7ec,0xef4abccb,0x808b9422
	.word  0x2eb3bc51,0x37affa5f,0x5745db7e,0x56090dbd
	.word  0x06bddf9a,0x82166912,0x60d832f7,0xbd4540fc
	.word  0xbb3a625d,0x25d43155,0x243eae74,0x097d0cc9
	.word  0xbbc58a17,0xcce4b4d2,0xdd0e3c55,0x68367222
	.word  0xdd241f97,0x69d4a88d,0xf93668f2,0xd5725de8
	.word  0x4a4eb08c,0xdaed4320,0x69606b72,0x2a4648bf
	.word  0x34dfe7b3,0x901d80cc,0x4e13ef3a,0xedd79e93
	.word  0xafab6f10,0x81e2ef4b,0x59a54014,0x27ed0354
	.word  0xd8b1d6c4,0x5e335b9c,0xb8027c3e,0x382ba98f
	.word  0x915d39e6,0x4acc0557,0x865e5284,0xae562253
	.word  0x67bf3af4,0x54343530,0x4ab2a03e,0x48ca875b
	.word  0x6888b401,0xb95c6944,0x500ad82f,0xa6abc60b
	.word  0x452bc678,0xa2e1edda,0xf7514ee6,0x4ab69dd9
	.word  0xc10df000,0xc78d39f4,0x9c6fa3f8,0x5f77a260
	.word  0xc18832b3,0x2c79cda8,0xb1847230,0x43eaa56f
	.word  0x4ed35bf7,0x88591aed,0x1cab6672,0xfc4b0836
	.word  0x43919b2d,0x5aea34d4,0xa7de7a89,0x13b15ec8
	.word  0xaa4704fa,0xb66afe6e,0x0c2f2511,0x090b76f1
	.word  0xadd1612a,0x24e67234,0x729ffdbf,0xce9602e6
	.word  0xf07f7e59,0xdb300a7f,0x7134daab,0x751ef6a9
	.word  0xa5d70acf,0x79ad862a,0xb9003277,0x7fe1e194
	.word  0x6ddd0f4e,0xd461bd1b,0xef148957,0xe14216cd
	.word  0x1f45053e,0x4711aa1a,0x420fe8e9,0x42fe618f
	.word  0x970060b3,0x492c315b,0x4dce11be,0x682001e4
	.word  0x95dcae1c,0xebafef8c,0x71d63cc4,0x162ab1c3
	.word  0x38fc7e8c,0xe0c1a393,0x4c29387f,0x9deed895
	.word  0x36d33bfe,0xc1e8e9d1,0x8fb46305,0x2d35d170
	.word  0xd290e853,0x689ada2c,0x359d028e,0xbf96fc18
	.word  0xa5b5de58,0x34f2ef4c,0xee228ad4,0x1ae3e1d0
	.word  0xd928930e,0x6f052d57,0xa9508853,0x55c76f8a
	.word  0x3222482c,0x1dda5e26,0x5427fce2,0xcdc9d58e
	.word  0xfdead0a8,0xdf5bb3de,0x03cdbba1,0x06d346bd
	.word  0xc2b01865,0x097bbb45,0x918dcf9f,0x8656ad47
	.word  0x13f923ee,0x7930213c,0x5390ce72,0xda96c53e
	.word  0x2af201f2,0x900b0026,0xc696e7ba,0xfc0e56ba
	.word  0xcabbfaea,0x63f74fb4,0x70e6f5c2,0xfe3a0a85
	.word  0x4b3f9adb,0xfa2d41a7,0x1fde2ffa,0xf45cf7f3
	.word  0xdca7db54,0x3434e979,0xdea660d5,0x95975015
	.word  0x58671771,0x9bba70a3,0xa7dd17cf,0x7f22a6b2
	.word  0x344c2944,0x6d407f6c,0x50557eb4,0xf3bbcd42
	.word  0xf5cda842,0xbd898143,0x8cb94004,0xe09cc586
	.word  0xed099799,0xa1e5632b,0x8d58dea4,0x4a5f9802
	.word  0x2b4296ae,0x8e90471a,0x95893df3,0x376fbd9e
	.word  0x170d219f,0xbdb3a4dc,0xf11c1b75,0x14279126
	.word  0x47f01073,0x813f18f5,0x3157dfb3,0x842e9de4
	.word  0x6931e3a0,0x745174d7,0x7107c50c,0x3c8816c1
	.word  0x17827a69,0x55384329,0xb42dfa20,0xeb1fccfb
	.word  0xfd28ac3b,0xe4e015ff,0xf14db765,0x699b6ec4
	.word  0xc8f8a7d5,0x0372916c,0xb0c2cd28,0xb6e6d08f
	.word  0x529770a0,0x18e180ba,0x56ec77be,0x9a8bb3c1
	.word  0x8474106f,0xce700b1d,0x5c7b07d9,0x54d790c3
	.word  0x76e46190,0x70964d7b,0x4b37f5f9,0x1e67c932
	.word  0x44aef077,0x80b73727,0xdfed47df,0x36e93c5c



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
!!#   int bitnum = 0, itr = 0;
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
!!#   IJ_set_ropr_fld ("diag.j", 38, ijdefault, Ft_Rs1, "{3..8}");
!!#   IJ_set_ropr_fld ("diag.j", 39, ijdefault, Ft_Rs2, "{9..15}");
!!#   IJ_set_ropr_fld ("diag.j", 40, ijdefault, Ft_Rd, "{17..31}");
!!#   IJ_set_ropr_fld ("diag.j", 41, ijdefault, Ft_Simm13, "13'b0rrrrrrrrrrrr");
!!#   IJ_set_ropr_fld ("diag.j", 42, ijdefault, Fm_align_Simm13, "3'b111");
!!#   IJ_set_ropr_fld ("diag.j", 43, ijdefault, Fm_align_Rd, "1'b1");
!!#   IJ_set_ropr_fld ("diag.j", 44, ijdefault, Ft_Imm_Asi, "{0x80}");
!!#   IJ_set_ropr_fld ("diag.j", 45, ijdefault, Ft_Cc1_f2, "1'br");
!!#   IJ_set_ropr_fld ("diag.j", 46, ijdefault, Ft_Cc0_f2, "1'b0");
!!#   IJ_set_ropr_fld ("diag.j", 47, ijdefault, Ft_P, "1'br");
!!#   IJ_set_ropr_fld ("diag.j", 48, ijdefault, Ft_A, "1'br");  
!!#   IJ_set_ropr_fld ("diag.j", 49, ijdefault, Ft_D16, "{0x1, 0x3}");
!!#   IJ_set_ropr_fld ("diag.j", 50, ijdefault, Ft_Disp22, "{0x1, 0x3}");
!!#   IJ_set_ropr_fld ("diag.j", 51, ijdefault, Ft_Disp19, "{0x1, 0x3}");
!!#   IJ_set_ropr_fld ("diag.j", 52, ijdefault, Ft_Disp30, "{0x1, 0x3}");
!!#   IJ_set_ropr_fld ("diag.j", 53, ijdefault, Ft_Cmask, "3'brrr");
!!#   IJ_set_ropr_fld ("diag.j", 54, ijdefault, Ft_Mmask, "4'brrrr");
!!# 
!!#   //Internal asi stores to err regs and data tag
!!#   IJ_set_ropr_fld ("diag.j", 57, Ro_int_asi, Ft_Rs1, "{0}");
!!#   IJ_set_ropr_fld ("diag.j", 58, Ro_int_asi, Ft_Rs2, "{2}");
!!#   IJ_set_ropr_fld ("diag.j", 59, Ro_int_asi, Ft_Rd, "{0}");
!!#   IJ_set_ropr_fld ("diag.j", 60, Ro_int_asi, Ft_Imm_Asi, "{0x4c,0x4b,0x47}");
!!# 
!!#   IJ_set_ropr_fld ("diag.j", 62, Ro_unaligned_addr, Fm_align_Simm13, "3'b000");
!!#   IJ_set_ropr_fld ("diag.j", 63, Ro_unaligned_addr, Ft_Simm13, "13'b0rrrrrrrrrrr1");
!!# 
!!#   IJ_set_ropr_fld ("diag.j", 65, Ro_dcerr, Ft_Rs2, "{10}");
!!#   IJ_set_ropr_fld ("diag.j", 66, Ro_ldmiss, Ft_Rs2, "{9}");
!!# 
!!#   IJ_bind_thread_group("diag.j", 68, th_all, 0x1);
!!# 
!!#   IJ_set_ropr_fld ("diag.j", 70, Ro_rsvd_set, Ft_Rs1, "{3..8}");
!!#   IJ_set_ropr_fld ("diag.j", 71, Ro_rsvd_set, Ft_Rs2, "{9..15}");
!!#   IJ_set_ropr_fld ("diag.j", 72, Ro_rsvd_set, Ft_Rd, "{17..31}");
!!#   IJ_set_ropr_fld ("diag.j", 73, Ro_rsvd_set, Ft_Simm13, "13'b0rrrrrrrrrrrr");
!!#   IJ_set_ropr_bits ("diag.j", 74, Ro_rsvd_set, 0x1f70, "13'br1rr1rrr00000");
!!# 
!!#   IJ_th_fork_group ("diag.j", 84, th_all);
!!# 
!!#   //Keep r16 as the scratch register
!!#   //Initialize Rd
!!#   IJ_set_rvar ("diag.j", 88, reg_rand_init, "64'hrrrrrrrr rrrrrrrr");
!!#   for (i = 17; i < 32; i++) {
!!#      IJ_printf ("diag.j", 90, th_all, "\tsetx  0x%016llrx, %%r16, %%r%d\n", reg_rand_init, i);
!!#   }
!!# 
!!#   //Initialize Rs2
!!#   IJ_set_rvar ("diag.j", 94, reg_rand_init, "64'h0000000000000rr0");
!!#   for (i = 9; i < 16; i++) {  
!!#     IJ_printf ("diag.j", 96, th_all, "\tsetx  0x%016llrx, %%r16, %%r%d\n", reg_rand_init, i);
!!#   }
!!# 
!!#   //Initialize Rs1
!!#   for (i = 3; i < 9; i++) {
!!#      IJ_printf ("diag.j", 101, th_all, "\tsetx MAIN_BASE_DATA_VA, %%r16, %%r%d\n", i);
!!#   }
!!# 
!!#   //initialize %r2 for int asi store addresses
!!#   IJ_set_rvar ("diag.j", 105, int_asi_reg_rand_init, "{0x0..0x3ff0}");
!!#   IJ_printf ("diag.j", 106, th_all, "\tsetx  0x%016llrx, %%r16, %%r2\n", int_asi_reg_rand_init);
!!# 
!!#   IJ_printf ("diag.j", 108, th_all, "\twr %%r0, 0x4, %%fprs\n");
!!#   IJ_init_fp_regs ("diag.j", 109, th_all, 4);
!!#   IJ_printf ("diag.j", 110, th_all, "\tta T_CHANGE_HPRIV !To allow ASI writes to D-I caches\n");
!!#   IJ_printf ("diag.j", 111, th_all, "\twr  %%r0, 0x80, %%asi\n");
!!# 
!!# }
!!# 
!!# %%
!!# %%section finish
!!# {
!!# 
!!# 
!!#   IJ_th_join ("diag.j", 115,0xf);
!!#   IJ_th_start ("diag.j", 116,Seq_Start, NULL, 2); 
!!# 
!!#   IJ_printf ("diag.j", 118, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 119, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 120, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 121, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 122, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 123, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 124, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 125, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 126, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 127, th_all, "	ta    T_GOOD_TRAP\n\n");
!!# 
!!#   IJ_set_rvar ("diag.j", 129, data_rand_init, "32'hrrrrrrrr");
!!#   IJ_printf ("diag.j", 130, th_all, ".data\n");
!!#   for (i = 0; i < 128; i++) {
!!#     IJ_printf ("diag.j", 132, th_all, "	.word  0x%08rx,0x%08rx,0x%08rx,0x%08rx\n", data_rand_init, data_rand_init, data_rand_init, data_rand_init);
!!#     IJ_printf ("diag.j", 133, th_all, "	.word  0x%08rx,0x%08rx,0x%08rx,0x%08rx\n", data_rand_init, data_rand_init, data_rand_init, data_rand_init);
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
!!# store_chunk_1: d0 store_i store_i store_i store_i store_i
!!#      {
!!#         IJ_printf ("diag.j", 163, th_all, "!Generating store_chunk_1\n");
!!#         IJ_printf ("diag.j", 164, th_all, "\tset 0x2, %%g1\n");
!!#         IJ_printf ("diag.j", 165, th_all, "\tsubcc %%g1, 0x1, %%g1\n");
!!#         IJ_printf ("diag.j", 166, th_all, ".align 0x20\n");
!!#         IJ_printf ("diag.j", 167, th_all, "thr%y_loop_%d:\n",label_cnt);
!!#         i = ((random() % 20 + 10)*8) - 1;  
!!#         IJ_generate_from_token ("diag.j", 169,i, th_all, ijdefault, tADD_R, tADD_I, tAND_R, tAND_I, tOR_R, tOR_I, -1);; 
!!#         IJ_generate_va ("diag.j", 170,th_all, $2, $3, $4, $5, $6, -1);;
!!#      } 
!!#      st_irferr_unalgn trpm_alu store_i 
!!#      {
!!#         IJ_generate ("diag.j", 174, th_all, $10);
!!#      }
!!#      store8 inst9 
!!#      {
!!#         IJ_generate_from_token ("diag.j", 178,3, th_all, ijdefault, tADD_R, tADD_I, tAND_R, tAND_I, tOR_R, tOR_I, -1);; 
!!#         IJ_printf ("diag.j", 179, th_all, "\tbne thr%y_loop_%d\n",label_cnt);
!!#         IJ_printf ("diag.j", 180, th_all, "\tsubcc %%g1, 0x1, %%g1\n");
!!#         label_cnt++;   
!!#         itr = 0;
!!#      }
!!# ;
!!# 
!!# store_chunk_2: d1 store_i store_i store_i store_i store_i store_i store_i
!!#      {
!!#         IJ_printf ("diag.j", 188, th_all, "!Generating store_chunk_2\n");
!!#         IJ_printf ("diag.j", 189, th_all, "\tset 0x2, %%g1\n");
!!#         IJ_printf ("diag.j", 190, th_all, "\tsubcc %%g1, 0x1, %%g1\n");
!!#         IJ_printf ("diag.j", 191, th_all, ".align 0x20\n");
!!#         IJ_printf ("diag.j", 192, th_all, "thr%y_loop_%d:\n",label_cnt);
!!#         i = ((random() % 20 + 10)*8) - 2;  
!!#         IJ_generate_from_token ("diag.j", 194,i, th_all, ijdefault, tADD_R, tADD_I, tAND_R, tAND_I, tOR_R, tOR_I, -1);; 
!!#         IJ_generate_va ("diag.j", 195,th_all, $2, $3, $4, $5, $6, $7, $8, -1);;
!!#      }
!!#      dcw2 store8 inst9
!!#      {
!!#         IJ_generate_from_token ("diag.j", 199,3, th_all, ijdefault, tADD_R, tADD_I, tAND_R, tAND_I, tOR_R, tOR_I, -1);; 
!!#         IJ_printf ("diag.j", 200, th_all, "\tbne thr%y_loop_%d\n",label_cnt);
!!#         IJ_printf ("diag.j", 201, th_all, "\tsubcc %%g1, 0x1, %%g1\n");
!!#         label_cnt++;   
!!#         itr = 0;
!!#      }
!!# ;
!!# 
!!# store_chunk_3: d2 store_i store_i store_i store_i store_i store_i store_i load_r 
!!#      {
!!#         IJ_printf ("diag.j", 209, th_all, "!Generating store_chunk_3\n");
!!#         IJ_printf ("diag.j", 210, th_all, "\tset 0x2, %%g1\n");
!!#         IJ_printf ("diag.j", 211, th_all, "\tsubcc %%g1, 0x1, %%g1\n");
!!#         IJ_printf ("diag.j", 212, th_all, ".align 0x20\n");
!!#         IJ_printf ("diag.j", 213, th_all, "thr%y_loop_%d:\n",label_cnt);
!!#         i = ((random() % 20 + 10)*8) - 1;  
!!#         IJ_generate_from_token ("diag.j", 215,i, th_all, ijdefault, tADD_R, tADD_I, tAND_R, tAND_I, tOR_R, tOR_I, -1);; 
!!#         IJ_generate_va ("diag.j", 216,th_all, $2, $3, $4, $5, $6, $7, $8, -1);;
!!# 	IJ_generate_from_token ("diag.j", 217,1, th_all, Ro_ldmiss, tLDSB_R, tLDSH_R, 
!!#                                  tLDSW_R, tLDUB_R, tLDUH_R, tLDUW_R, tLDX_R, tLDD_R, -1);;
!!#      }
!!#      store8 inst9
!!#      {
!!#         IJ_generate_from_token ("diag.j", 221,2, th_all, ijdefault, tADD_R, tADD_I, tAND_R, tAND_I, tOR_R, tOR_I, -1);; 
!!#         IJ_printf ("diag.j", 222, th_all, "\tsetx  0x%016llrx, %%r16, %%r9\n", reg_rand_init);  
!!#         IJ_printf ("diag.j", 223, th_all, "\tbne thr%y_loop_%d\n",label_cnt);
!!#         IJ_printf ("diag.j", 224, th_all, "\tsubcc %%g1, 0x1, %%g1\n");
!!#         label_cnt++;   
!!#         itr = 0;
!!#      }
!!# ;
!!# 
!!# st_irferr_unalgn: irferr store_i 
!!# 		    {
!!# 		       IJ_generate ("diag.j", 232, th_all, $2);
!!# 		    }
!!#                   | d5 store_i %ropr  Ro_unaligned_addr
!!#                     {
!!# 		      IJ_generate ("diag.j", 236, th_all, $2);
!!#                       itr++;
!!#                     }
!!#                   | d4 store_i
!!#                     {
!!# 		      IJ_generate ("diag.j", 241, th_all, $2);
!!#                     }
!!# 		  | d6 irferr store_i  %ropr  Ro_unaligned_addr
!!#                     {
!!# 		      IJ_generate ("diag.j", 245, th_all, $3);
!!#                       itr++;
!!#                     }
!!# ;
!!# 
!!# inst9: alu_err | lop_err | setx_err
!!# ;
!!# 
!!# alu_err: alu 
!!#            {
!!#               IJ_generate ("diag.j", 255, th_all, $1);
!!#            }
!!#          | d7 icerr_2 alu
!!#            {
!!#               IJ_generate ("diag.j", 259, th_all, $3);
!!#            }
!!# ;
!!# 
!!# lop_err: lop 
!!#            {
!!#               IJ_generate ("diag.j", 265, th_all, $1);
!!#            }
!!#          | d8 icerr_2 lop
!!#            {
!!#               IJ_generate ("diag.j", 269, th_all, $3);
!!#            }
!!# ;
!!# 
!!# setx_err: setx | d10 icerr_2 setx
!!# ;
!!# 
!!# //dcerr load_r %ropr Ro_dcerr
!!# dcw2: dcerr load_r 
!!#       {
!!#          IJ_generate_from_token ("diag.j", 279,1, th_all, Ro_dcerr, tLDSB_R, tLDSH_R, 
!!#                                  tLDSW_R, tLDUB_R, tLDUH_R, tLDUW_R, tLDX_R, tLDD_R, -1);;
!!# //         IJ_generate (th_all, $2);
!!#       } alu 
!!#         {
!!# 	  IJ_generate ("diag.j", 283, th_all, $4);
!!#         }
!!#         | d27 alu %ropr  Ro_rsvd_set
!!#             {
!!#               IJ_printf ("diag.j", 287, th_all, "!Illinst\n");
!!#               IJ_generate ("diag.j", 288, th_all, $2);
!!#               itr++;
!!#               $$ = $2;
!!#             }
!!# ;
!!# 
!!# st: st_fp | atomic | st_int_asi | st_ext_asi | store_i 
!!# ;
!!# 
!!# store8: st
!!# {
!!#    IJ_generate("diag.j", 299, th_all, $1);
!!# }
!!# ;
!!# 
!!# icerr_2: mMETA3
!!# {
!!#    IJ_printf ("diag.j", 305, th_all, "thr%y_ic_err_%d:\n", ic_err_cnt);
!!#    bitnum = random () % 34;
!!#    IJ_printf ("diag.j", 307, th_all, "!$EV error(%y,expr(@VA(.MAIN.thr%y_ic_err_%d), 16, 16),%d,IC_DATA,IR,%d,x)\n", ic_err_cnt,itr+2,bitnum);
!!#    ic_err_cnt++;
!!# }
!!# ;
!!# 
!!# dcerr: mMETA5
!!# {
!!#    IJ_printf ("diag.j", 314, th_all, "thr%y_dc_err_%d:\n", dc_err_cnt);
!!#    bitnum = random () % 72;
!!#    IJ_printf ("diag.j", 316, th_all, "!$EV error(%y,expr(@VA(.MAIN.thr%y_dc_err_%d), 16, 16),2,DC_DATA,%d)\n", dc_err_cnt,bitnum);
!!#    dc_err_cnt++;
!!# }
!!# ;
!!# 
!!# irferr: mMETA100
!!# {
!!#      IJ_printf ("diag.j", 323, th_all, "thr%y_irf_ce_%d:\n", irf_err_cnt);
!!# //     bitnum = random () % 72;
!!#      bitnum = random () % 70;
!!#      IJ_printf ("diag.j", 326, th_all, "!$EV error(%y,expr(@VA(.MAIN.thr%y_irf_ce_%d), 16, 16),2,IRF,ce,%d,x, x,x,x, x,x,x)\n", irf_err_cnt, bitnum);
!!#      irf_err_cnt++;
!!# }
!!# ;
!!# 
!!# trpm_alu: d25 alu 
!!#             { 
!!#               IJ_printf ("diag.j", 333, th_all, "!alu: trpm_alu\n");	      
!!#               IJ_generate ("diag.j", 334, th_all, $2);
!!#             }
!!#           | d26 alu %ropr  Ro_rsvd_set
!!#             {
!!#               IJ_printf ("diag.j", 338, th_all, "!Illinst: trpm_alu\n");
!!#               IJ_generate ("diag.j", 339, th_all, $2);
!!#               itr++;
!!#               $$ = $2;
!!#             }
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
!!#   IJ_printf ("diag.j", 401, th_all, "\tsetx  0x%016llrx, %%r16, %%r%d\n", reg_rand_init, regid);
!!#   if (regid % 2 == 0) {
!!#     IJ_printf ("diag.j", 403, th_all, "\tsetx  0x%016llrx, %%r16, %%r2\n", int_asi_reg_rand_init);
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
!!# d7: mMETA13
!!# ;
!!# 
!!# d8: mMETA14
!!# ;
!!# 
!!# d10: mMETA30
!!# ;
!!# 
!!# d25: mMETA25000
!!# ;
!!# 
!!# d26: mMETA26000
!!# ;
!!# 
!!# d60: mMETA60
!!# ;
!!# 
!!# d27: mMETA27
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

