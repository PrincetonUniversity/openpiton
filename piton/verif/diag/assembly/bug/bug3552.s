// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: bug3552.s
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
   random seed:	892089843
   Jal stb.j:	
********************************************************************************/

#define THREAD_COUNT 4
#include "enable_traps.h"
#include "hboot.s"

!SIMS: -non_shared
!SIMS: +spis

.text
.global main
.global th_main_0
.global th_main_1
.global th_main_2
.global th_main_3

main:

	th_fork(th_main)

th_main_0:
        setx  MAIN_BASE_DATA_VA, %r1, %r4
	setx  0x10, %r1, %r5
        setx  0x80, %g2, %g1
        wr  %g1, %g0, %asi
	rd %fprs, %g0 !Just to keep the behavior same
        wr %g0, 0x4, %fprs
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
        setx  0x43819c910184d33f, %g1, %r0
        setx  0xd37f755825718625, %g1, %r1
        setx  0x81957ec2b2021eca, %g1, %r2
        setx  0x3122a8cf70f47332, %g1, %r6
        setx  0x10d5f679fcb769e5, %g1, %r7
        setx  0xb39d80c77a52cd87, %g1, %r8
        setx  0x507041a6c4e22b2a, %g1, %r9
        setx  0xe4cd0668f1f749c1, %g1, %r10
        setx  0x4825023a133603bc, %g1, %r11
        setx  0x33348a27b80fd589, %g1, %r12
        setx  0xd4b694ef9e495b5c, %g1, %r13
        setx  0xb8555f8ca92e03e5, %g1, %r14
        setx  0xbd1fc36fcf3d5ed5, %g1, %r15
        setx  0xbfa8be9857aa866e, %g1, %r16
        setx  0xf94e0df62e46eb44, %g1, %r17
        setx  0xffe9ab62c885b8af, %g1, %r18
        setx  0x22a36a9a796fc279, %g1, %r19
        setx  0xdeee6c1472898768, %g1, %r20
        setx  0xe484b6640b20d3ae, %g1, %r21
        setx  0xa06b2a20d4a205cd, %g1, %r22
        setx  0x4bd30a9b2b1d48fa, %g1, %r23
        setx  0xa34ee44b7a9b150e, %g1, %r24
        setx  0xf206dea1655397db, %g1, %r25
        setx  0xb870b25f38151ce0, %g1, %r26
        setx  0xe80510af1fbcb68c, %g1, %r27
        setx  0x1a3fea305bb7809f, %g1, %r28
        setx  0xebc829807c92a1aa, %g1, %r29
        setx  0xc882a45c3687bcf5, %g1, %r30
        setx  0x97e35951968b5cac, %g1, %r31
	.word 0xc2310005  ! 9: STH_R	sth	%r1, [%r4 + %r5]
	.word 0xc0712010  ! 9: STX_I	stx	%r0, [%r4 + 0x0010]
	.word 0xc4292010  ! 9: STB_I	stb	%r2, [%r4 + 0x0010]
	.word 0xc0310005  ! 9: STH_R	sth	%r0, [%r4 + %r5]
	.word 0xf8210005  ! 9: STW_R	stw	%r28, [%r4 + %r5]
	.word 0xd4210005  ! 9: STW_R	stw	%r10, [%r4 + %r5]
	.word 0xc6792010  ! 9: SWAP_I	swap	%r3, [%r4 + 0x0010]
	.word 0xc6310005  ! 9: STH_R	sth	%r3, [%r4 + %r5]
	.word 0xd2310005  ! 16: STH_R	sth	%r9, [%r4 + %r5]
	.word 0xc6210005  ! 16: STW_R	stw	%r3, [%r4 + %r5]
	.word 0xc6290005  ! 16: STB_R	stb	%r3, [%r4 + %r5]
	.word 0xce212010  ! 16: STW_I	stw	%r7, [%r4 + 0x0010]
	.word 0xf2212010  ! 16: STW_I	stw	%r25, [%r4 + 0x0010]
	.word 0xd6290005  ! 16: STB_R	stb	%r11, [%r4 + %r5]
	.word 0xf0790005  ! 16: SWAP_R	swap	%r24, [%r4 + %r5]
	.word 0xc4712010  ! 16: STX_I	stx	%r2, [%r4 + 0x0010]
	.word 0xf4310005  ! 23: STH_R	sth	%r26, [%r4 + %r5]
	.word 0xcc310005  ! 23: STH_R	sth	%r6, [%r4 + %r5]
	.word 0xea712010  ! 23: STX_I	stx	%r21, [%r4 + 0x0010]
	.word 0xfa710005  ! 23: STX_R	stx	%r29, [%r4 + %r5]
	.word 0xc6710005  ! 23: STX_R	stx	%r3, [%r4 + %r5]
	.word 0xc0292010  ! 23: STB_I	stb	%r0, [%r4 + 0x0010]
	.word 0xc3390005  ! 23: STDF_R	std	%f1, [%r5, %r4]
	.word 0xc0212010  ! 23: STW_I	stw	%r0, [%r4 + 0x0010]
	.word 0xc2310005  ! 30: STH_R	sth	%r1, [%r4 + %r5]
	.word 0xc2210005  ! 30: STW_R	stw	%r1, [%r4 + %r5]
	.word 0xc2210005  ! 30: STW_R	stw	%r1, [%r4 + %r5]
	.word 0xc2210005  ! 30: STW_R	stw	%r1, [%r4 + %r5]
	.word 0xc4312010  ! 30: STH_I	sth	%r2, [%r4 + 0x0010]
	.word 0xc6712010  ! 30: STX_I	stx	%r3, [%r4 + 0x0010]
	.word 0xf9392010  ! 30: STDF_I	std	%f28, [0x0010, %r4]
	.word 0xc4310005  ! 30: STH_R	sth	%r2, [%r4 + %r5]
	.word 0xce310005  ! 37: STH_R	sth	%r7, [%r4 + %r5]
	.word 0xc0312010  ! 37: STH_I	sth	%r0, [%r4 + 0x0010]
	.word 0xce712010  ! 37: STX_I	stx	%r7, [%r4 + 0x0010]
	.word 0xc4292010  ! 37: STB_I	stb	%r2, [%r4 + 0x0010]
	.word 0xe4290005  ! 37: STB_R	stb	%r18, [%r4 + %r5]
	.word 0xec290005  ! 37: STB_R	stb	%r22, [%r4 + %r5]
	.word 0xc5210005  ! 37: STF_R	st	%f2, [%r5, %r4]
	.word 0xc0212010  ! 37: STW_I	stw	%r0, [%r4 + 0x0010]
	.word 0xc2310005  ! 44: STH_R	sth	%r1, [%r4 + %r5]
	.word 0xc2292010  ! 44: STB_I	stb	%r1, [%r4 + 0x0010]
	.word 0xde310005  ! 44: STH_R	sth	%r15, [%r4 + %r5]
	.word 0xc6710005  ! 44: STX_R	stx	%r3, [%r4 + %r5]
	.word 0xc6290005  ! 44: STB_R	stb	%r3, [%r4 + %r5]
	.word 0xc2312010  ! 44: STH_I	sth	%r1, [%r4 + 0x0010]
	.word 0xc7312010  ! 44: STQF_I	-	%f3, [0x0010, %r4]
	.word 0xc6712010  ! 44: STX_I	stx	%r3, [%r4 + 0x0010]
	.word 0xc4310005  ! 52: STH_R	sth	%r2, [%r4 + %r5]
	.word 0xf8292010  ! 52: STB_I	stb	%r28, [%r4 + 0x0010]
	.word 0xdc292010  ! 52: STB_I	stb	%r14, [%r4 + 0x0010]
	.word 0xc0712010  ! 52: STX_I	stx	%r0, [%r4 + 0x0010]
	.word 0xc4212010  ! 52: STW_I	stw	%r2, [%r4 + 0x0010]
	.word 0xf8312010  ! 52: STH_I	sth	%r28, [%r4 + 0x0010]
	.word 0xc0290005  ! 52: STB_R	stb	%r0, [%r4 + %r5]
	.word 0xc5312010  ! 52: STQF_I	-	%f2, [0x0010, %r4]
	.word 0xc4312010  ! 52: STH_I	sth	%r2, [%r4 + 0x0010]
	.word 0xc4310005  ! 59: STH_R	sth	%r2, [%r4 + %r5]
	.word 0xc0310005  ! 59: STH_R	sth	%r0, [%r4 + %r5]
	.word 0xc2290005  ! 59: STB_R	stb	%r1, [%r4 + %r5]
	.word 0xc0212010  ! 59: STW_I	stw	%r0, [%r4 + 0x0010]
	.word 0xc6710005  ! 59: STX_R	stx	%r3, [%r4 + %r5]
	.word 0xda310005  ! 59: STH_R	sth	%r13, [%r4 + %r5]
	.word 0xe8f92010  ! 59: SWAPA_I	swapa	%r20, [%r4 + 0x0010] %asi
	.word 0xc0712010  ! 59: STX_I	stx	%r0, [%r4 + 0x0010]
	.word 0xe2310005  ! 66: STH_R	sth	%r17, [%r4 + %r5]
	.word 0xc4310005  ! 66: STH_R	sth	%r2, [%r4 + %r5]
	.word 0xc4210005  ! 66: STW_R	stw	%r2, [%r4 + %r5]
	.word 0xc6710005  ! 66: STX_R	stx	%r3, [%r4 + %r5]
	.word 0xdc292010  ! 66: STB_I	stb	%r14, [%r4 + 0x0010]
	.word 0xc0710005  ! 66: STX_R	stx	%r0, [%r4 + %r5]
	.word 0xd5390005  ! 66: STDF_R	std	%f10, [%r5, %r4]
	.word 0xc2312010  ! 66: STH_I	sth	%r1, [%r4 + 0x0010]
	.word 0xc6310005  ! 73: STH_R	sth	%r3, [%r4 + %r5]
	.word 0xcc212010  ! 73: STW_I	stw	%r6, [%r4 + 0x0010]
	.word 0xc6712010  ! 73: STX_I	stx	%r3, [%r4 + 0x0010]
	.word 0xc0212010  ! 73: STW_I	stw	%r0, [%r4 + 0x0010]
	.word 0xc6310005  ! 73: STH_R	sth	%r3, [%r4 + %r5]
	.word 0xc0210005  ! 73: STW_R	stw	%r0, [%r4 + %r5]
	.word 0xe5210005  ! 73: STF_R	st	%f18, [%r5, %r4]
	.word 0xce290005  ! 73: STB_R	stb	%r7, [%r4 + %r5]
	.word 0xc4310005  ! 81: STH_R	sth	%r2, [%r4 + %r5]
	.word 0xde312010  ! 81: STH_I	sth	%r15, [%r4 + 0x0010]
	.word 0xc2212010  ! 81: STW_I	stw	%r1, [%r4 + 0x0010]
	.word 0xec212010  ! 81: STW_I	stw	%r22, [%r4 + 0x0010]
	.word 0xc0292010  ! 81: STB_I	stb	%r0, [%r4 + 0x0010]
	.word 0xf6292010  ! 81: STB_I	stb	%r27, [%r4 + 0x0010]
	.word 0xd0710005  ! 81: STX_R	stx	%r8, [%r4 + %r5]
	.word 0xf6712010  ! 81: STX_I	stx	%r27, [%r4 + 0x0010]
	.word 0xc2f92010  ! 81: SWAPA_I	swapa	%r1, [%r4 + 0x0010] %asi
	.word 0xec310005  ! 89: STH_R	sth	%r22, [%r4 + %r5]
	.word 0xe6212010  ! 89: STW_I	stw	%r19, [%r4 + 0x0010]
	.word 0xd8310005  ! 89: STH_R	sth	%r12, [%r4 + %r5]
	.word 0xc2312010  ! 89: STH_I	sth	%r1, [%r4 + 0x0010]
	.word 0xc4292010  ! 89: STB_I	stb	%r2, [%r4 + 0x0010]
	.word 0xf2710005  ! 89: STX_R	stx	%r25, [%r4 + %r5]
	.word 0xfa290005  ! 89: STB_R	stb	%r29, [%r4 + %r5]
	.word 0xc6e92010  ! 89: LDSTUBA_I	ldstuba	%r3, [%r4 + 0x0010] %asi
	.word 0xce710005  ! 89: STX_R	stx	%r7, [%r4 + %r5]
	.word 0xc0310005  ! 96: STH_R	sth	%r0, [%r4 + %r5]
	.word 0xd6210005  ! 96: STW_R	stw	%r11, [%r4 + %r5]
	.word 0xcc292010  ! 96: STB_I	stb	%r6, [%r4 + 0x0010]
	.word 0xc6290005  ! 96: STB_R	stb	%r3, [%r4 + %r5]
	.word 0xea710005  ! 96: STX_R	stx	%r21, [%r4 + %r5]
	.word 0xf6712010  ! 96: STX_I	stx	%r27, [%r4 + 0x0010]
	.word 0xc5312010  ! 96: STQF_I	-	%f2, [0x0010, %r4]
	.word 0xfe710005  ! 96: STX_R	stx	%r31, [%r4 + %r5]
	.word 0xc6310005  ! 103: STH_R	sth	%r3, [%r4 + %r5]
	.word 0xe4310005  ! 103: STH_R	sth	%r18, [%r4 + %r5]
	.word 0xf6290005  ! 103: STB_R	stb	%r27, [%r4 + %r5]
	.word 0xf2712010  ! 103: STX_I	stx	%r25, [%r4 + 0x0010]
	.word 0xc6312010  ! 103: STH_I	sth	%r3, [%r4 + 0x0010]
	.word 0xc2310005  ! 103: STH_R	sth	%r1, [%r4 + %r5]
	.word 0xc2f91005  ! 103: SWAPA_R	swapa	%r1, [%r4 + %r5] 0x80
	.word 0xc4292010  ! 103: STB_I	stb	%r2, [%r4 + 0x0010]
	.word 0xfe310005  ! 110: STH_R	sth	%r31, [%r4 + %r5]
	.word 0xc0710005  ! 110: STX_R	stx	%r0, [%r4 + %r5]
	.word 0xc0312010  ! 110: STH_I	sth	%r0, [%r4 + 0x0010]
	.word 0xc0310005  ! 110: STH_R	sth	%r0, [%r4 + %r5]
	.word 0xe0712010  ! 110: STX_I	stx	%r16, [%r4 + 0x0010]
	.word 0xfe290005  ! 110: STB_R	stb	%r31, [%r4 + %r5]
	.word 0xc4e92010  ! 110: LDSTUBA_I	ldstuba	%r2, [%r4 + 0x0010] %asi
	.word 0xf6210005  ! 110: STW_R	stw	%r27, [%r4 + %r5]
	.word 0xe2310005  ! 117: STH_R	sth	%r17, [%r4 + %r5]
	.word 0xc0210005  ! 117: STW_R	stw	%r0, [%r4 + %r5]
	.word 0xc2310005  ! 117: STH_R	sth	%r1, [%r4 + %r5]
	.word 0xec312010  ! 117: STH_I	sth	%r22, [%r4 + 0x0010]
	.word 0xc6310005  ! 117: STH_R	sth	%r3, [%r4 + %r5]
	.word 0xd8712010  ! 117: STX_I	stx	%r12, [%r4 + 0x0010]
	.word 0xc3392010  ! 117: STDF_I	std	%f1, [0x0010, %r4]
	.word 0xc4310005  ! 117: STH_R	sth	%r2, [%r4 + %r5]
	.word 0xd0310005  ! 125: STH_R	sth	%r8, [%r4 + %r5]
	.word 0xc4210005  ! 125: STW_R	stw	%r2, [%r4 + %r5]
	.word 0xc6712010  ! 125: STX_I	stx	%r3, [%r4 + 0x0010]
	.word 0xc0290005  ! 125: STB_R	stb	%r0, [%r4 + %r5]
	.word 0xda312010  ! 125: STH_I	sth	%r13, [%r4 + 0x0010]
	.word 0xf4312010  ! 125: STH_I	sth	%r26, [%r4 + 0x0010]
	.word 0xc4312010  ! 125: STH_I	sth	%r2, [%r4 + 0x0010]
	.word 0xc7f11005  ! 125: CASXA_I	casxa	[%r4] 0x80, %r5, %r3
	.word 0xce312010  ! 125: STH_I	sth	%r7, [%r4 + 0x0010]
	.word 0xec310005  ! 133: STH_R	sth	%r22, [%r4 + %r5]
	.word 0xc0710005  ! 133: STX_R	stx	%r0, [%r4 + %r5]
	.word 0xc2712010  ! 133: STX_I	stx	%r1, [%r4 + 0x0010]
	.word 0xc0210005  ! 133: STW_R	stw	%r0, [%r4 + %r5]
	.word 0xd0710005  ! 133: STX_R	stx	%r8, [%r4 + %r5]
	.word 0xc4710005  ! 133: STX_R	stx	%r2, [%r4 + %r5]
	.word 0xc2292010  ! 133: STB_I	stb	%r1, [%r4 + 0x0010]
	.word 0xc0310005  ! 133: STH_R	sth	%r0, [%r4 + %r5]
	.word 0xc0290005  ! 133: STB_R	stb	%r0, [%r4 + %r5]
	.word 0xf6310005  ! 140: STH_R	sth	%r27, [%r4 + %r5]
	.word 0xd2712010  ! 140: STX_I	stx	%r9, [%r4 + 0x0010]
	.word 0xc4290005  ! 140: STB_R	stb	%r2, [%r4 + %r5]
	.word 0xc2312010  ! 140: STH_I	sth	%r1, [%r4 + 0x0010]
	.word 0xd4210005  ! 140: STW_R	stw	%r10, [%r4 + %r5]
	.word 0xc6312010  ! 140: STH_I	sth	%r3, [%r4 + 0x0010]
	.word 0xc5f11005  ! 140: CASXA_I	casxa	[%r4] 0x80, %r5, %r2
	.word 0xf2712010  ! 140: STX_I	stx	%r25, [%r4 + 0x0010]
	.word 0xd6310005  ! 147: STH_R	sth	%r11, [%r4 + %r5]
	.word 0xc4712010  ! 147: STX_I	stx	%r2, [%r4 + 0x0010]
	.word 0xcc712010  ! 147: STX_I	stx	%r6, [%r4 + 0x0010]
	.word 0xea710005  ! 147: STX_R	stx	%r21, [%r4 + %r5]
	.word 0xfa710005  ! 147: STX_R	stx	%r29, [%r4 + %r5]
	.word 0xc2310005  ! 147: STH_R	sth	%r1, [%r4 + %r5]
	.word 0xc1392010  ! 147: STDF_I	std	%f0, [0x0010, %r4]
	.word 0xc2712010  ! 147: STX_I	stx	%r1, [%r4 + 0x0010]
	.word 0xc2310005  ! 154: STH_R	sth	%r1, [%r4 + %r5]
	.word 0xc2212010  ! 154: STW_I	stw	%r1, [%r4 + 0x0010]
	.word 0xc0712010  ! 154: STX_I	stx	%r0, [%r4 + 0x0010]
	.word 0xce290005  ! 154: STB_R	stb	%r7, [%r4 + %r5]
	.word 0xc0310005  ! 154: STH_R	sth	%r0, [%r4 + %r5]
	.word 0xc4310005  ! 154: STH_R	sth	%r2, [%r4 + %r5]
	.word 0xc7310005  ! 154: STQF_R	-	%f3, [%r5, %r4]
	.word 0xc2292010  ! 154: STB_I	stb	%r1, [%r4 + 0x0010]
	.word 0xc4310005  ! 162: STH_R	sth	%r2, [%r4 + %r5]
	.word 0xc0212010  ! 162: STW_I	stw	%r0, [%r4 + 0x0010]
	.word 0xc2290005  ! 162: STB_R	stb	%r1, [%r4 + %r5]
	.word 0xd0290005  ! 162: STB_R	stb	%r8, [%r4 + %r5]
	.word 0xc0210005  ! 162: STW_R	stw	%r0, [%r4 + %r5]
	.word 0xc0310005  ! 162: STH_R	sth	%r0, [%r4 + %r5]
	.word 0xe4710005  ! 162: STX_R	stx	%r18, [%r4 + %r5]
	.word 0xc2790005  ! 162: SWAP_R	swap	%r1, [%r4 + %r5]
	.word 0xc6210005  ! 162: STW_R	stw	%r3, [%r4 + %r5]
	.word 0xfe310005  ! 169: STH_R	sth	%r31, [%r4 + %r5]
	.word 0xd6712010  ! 169: STX_I	stx	%r11, [%r4 + 0x0010]
	.word 0xea310005  ! 169: STH_R	sth	%r21, [%r4 + %r5]
	.word 0xc0710005  ! 169: STX_R	stx	%r0, [%r4 + %r5]
	.word 0xfc712010  ! 169: STX_I	stx	%r30, [%r4 + 0x0010]
	.word 0xc6290005  ! 169: STB_R	stb	%r3, [%r4 + %r5]
	.word 0xc2792010  ! 169: SWAP_I	swap	%r1, [%r4 + 0x0010]
	.word 0xc4290005  ! 169: STB_R	stb	%r2, [%r4 + %r5]
	.word 0xfc310005  ! 177: STH_R	sth	%r30, [%r4 + %r5]
	.word 0xc0292010  ! 177: STB_I	stb	%r0, [%r4 + 0x0010]
	.word 0xe2710005  ! 177: STX_R	stx	%r17, [%r4 + %r5]
	.word 0xc4290005  ! 177: STB_R	stb	%r2, [%r4 + %r5]
	.word 0xc0292010  ! 177: STB_I	stb	%r0, [%r4 + 0x0010]
	.word 0xc6212010  ! 177: STW_I	stw	%r3, [%r4 + 0x0010]
	.word 0xc6712010  ! 177: STX_I	stx	%r3, [%r4 + 0x0010]
	.word 0xd9210005  ! 177: STF_R	st	%f12, [%r5, %r4]
	.word 0xc4212010  ! 177: STW_I	stw	%r2, [%r4 + 0x0010]
	.word 0xc4310005  ! 184: STH_R	sth	%r2, [%r4 + %r5]
	.word 0xc4712010  ! 184: STX_I	stx	%r2, [%r4 + 0x0010]
	.word 0xe8210005  ! 184: STW_R	stw	%r20, [%r4 + %r5]
	.word 0xc2290005  ! 184: STB_R	stb	%r1, [%r4 + %r5]
	.word 0xde710005  ! 184: STX_R	stx	%r15, [%r4 + %r5]
	.word 0xd0310005  ! 184: STH_R	sth	%r8, [%r4 + %r5]
	.word 0xc1312010  ! 184: STQF_I	-	%f0, [0x0010, %r4]
	.word 0xc2212010  ! 184: STW_I	stw	%r1, [%r4 + 0x0010]
	.word 0xc0310005  ! 192: STH_R	sth	%r0, [%r4 + %r5]
	.word 0xc0212010  ! 192: STW_I	stw	%r0, [%r4 + 0x0010]
	.word 0xf0212010  ! 192: STW_I	stw	%r24, [%r4 + 0x0010]
	.word 0xc2710005  ! 192: STX_R	stx	%r1, [%r4 + %r5]
	.word 0xc2312010  ! 192: STH_I	sth	%r1, [%r4 + 0x0010]
	.word 0xc6290005  ! 192: STB_R	stb	%r3, [%r4 + %r5]
	.word 0xf8210005  ! 192: STW_R	stw	%r28, [%r4 + %r5]
	.word 0xc6712010  ! 192: STX_I	stx	%r3, [%r4 + 0x0010]
	.word 0xe8e91005  ! 192: LDSTUBA_R	ldstuba	%r20, [%r4 + %r5] 0x80
	.word 0xc2310005  ! 199: STH_R	sth	%r1, [%r4 + %r5]
	.word 0xc6292010  ! 199: STB_I	stb	%r3, [%r4 + 0x0010]
	.word 0xc2292010  ! 199: STB_I	stb	%r1, [%r4 + 0x0010]
	.word 0xd0312010  ! 199: STH_I	sth	%r8, [%r4 + 0x0010]
	.word 0xc0712010  ! 199: STX_I	stx	%r0, [%r4 + 0x0010]
	.word 0xc0712010  ! 199: STX_I	stx	%r0, [%r4 + 0x0010]
	.word 0xc7392010  ! 199: STDF_I	std	%f3, [0x0010, %r4]
	.word 0xc6292010  ! 199: STB_I	stb	%r3, [%r4 + 0x0010]
	.word 0xc2310005  ! 206: STH_R	sth	%r1, [%r4 + %r5]
	.word 0xec292010  ! 206: STB_I	stb	%r22, [%r4 + 0x0010]
	.word 0xc6212010  ! 206: STW_I	stw	%r3, [%r4 + 0x0010]
	.word 0xfa310005  ! 206: STH_R	sth	%r29, [%r4 + %r5]
	.word 0xce710005  ! 206: STX_R	stx	%r7, [%r4 + %r5]
	.word 0xfc712010  ! 206: STX_I	stx	%r30, [%r4 + 0x0010]
	.word 0xc7212010  ! 206: STF_I	st	%f3, [0x0010, %r4]
	.word 0xf2310005  ! 206: STH_R	sth	%r25, [%r4 + %r5]
	.word 0xc0310005  ! 214: STH_R	sth	%r0, [%r4 + %r5]
	.word 0xc2212010  ! 214: STW_I	stw	%r1, [%r4 + 0x0010]
	.word 0xc4312010  ! 214: STH_I	sth	%r2, [%r4 + 0x0010]
	.word 0xd8710005  ! 214: STX_R	stx	%r12, [%r4 + %r5]
	.word 0xd4210005  ! 214: STW_R	stw	%r10, [%r4 + %r5]
	.word 0xc6292010  ! 214: STB_I	stb	%r3, [%r4 + 0x0010]
	.word 0xc4212010  ! 214: STW_I	stw	%r2, [%r4 + 0x0010]
	.word 0xc3392010  ! 214: STDF_I	std	%f1, [0x0010, %r4]
	.word 0xc0310005  ! 214: STH_R	sth	%r0, [%r4 + %r5]
	.word 0xfe310005  ! 221: STH_R	sth	%r31, [%r4 + %r5]
	.word 0xf2312010  ! 221: STH_I	sth	%r25, [%r4 + 0x0010]
	.word 0xc0312010  ! 221: STH_I	sth	%r0, [%r4 + 0x0010]
	.word 0xe8212010  ! 221: STW_I	stw	%r20, [%r4 + 0x0010]
	.word 0xc4312010  ! 221: STH_I	sth	%r2, [%r4 + 0x0010]
	.word 0xc2212010  ! 221: STW_I	stw	%r1, [%r4 + 0x0010]
	.word 0xc1390005  ! 221: STDF_R	std	%f0, [%r5, %r4]
	.word 0xf4712010  ! 221: STX_I	stx	%r26, [%r4 + 0x0010]
	.word 0xc2310005  ! 228: STH_R	sth	%r1, [%r4 + %r5]
	.word 0xf4712010  ! 228: STX_I	stx	%r26, [%r4 + 0x0010]
	.word 0xc0312010  ! 228: STH_I	sth	%r0, [%r4 + 0x0010]
	.word 0xec290005  ! 228: STB_R	stb	%r22, [%r4 + %r5]
	.word 0xfa312010  ! 228: STH_I	sth	%r29, [%r4 + 0x0010]
	.word 0xc6292010  ! 228: STB_I	stb	%r3, [%r4 + 0x0010]
	.word 0xc7312010  ! 228: STQF_I	-	%f3, [0x0010, %r4]
	.word 0xc6292010  ! 228: STB_I	stb	%r3, [%r4 + 0x0010]
	.word 0xc2310005  ! 235: STH_R	sth	%r1, [%r4 + %r5]
	.word 0xe8210005  ! 235: STW_R	stw	%r20, [%r4 + %r5]
	.word 0xe4210005  ! 235: STW_R	stw	%r18, [%r4 + %r5]
	.word 0xce710005  ! 235: STX_R	stx	%r7, [%r4 + %r5]
	.word 0xc6712010  ! 235: STX_I	stx	%r3, [%r4 + 0x0010]
	.word 0xc4212010  ! 235: STW_I	stw	%r2, [%r4 + 0x0010]
	.word 0xe5390005  ! 235: STDF_R	std	%f18, [%r5, %r4]
	.word 0xc2312010  ! 235: STH_I	sth	%r1, [%r4 + 0x0010]
	.word 0xcc310005  ! 242: STH_R	sth	%r6, [%r4 + %r5]
	.word 0xf4210005  ! 242: STW_R	stw	%r26, [%r4 + %r5]
	.word 0xc6310005  ! 242: STH_R	sth	%r3, [%r4 + %r5]
	.word 0xc4310005  ! 242: STH_R	sth	%r2, [%r4 + %r5]
	.word 0xc0712010  ! 242: STX_I	stx	%r0, [%r4 + 0x0010]
	.word 0xc6210005  ! 242: STW_R	stw	%r3, [%r4 + %r5]
	.word 0xc2e92010  ! 242: LDSTUBA_I	ldstuba	%r1, [%r4 + 0x0010] %asi
	.word 0xc6290005  ! 242: STB_R	stb	%r3, [%r4 + %r5]
	.word 0xe0310005  ! 249: STH_R	sth	%r16, [%r4 + %r5]
	.word 0xc4312010  ! 249: STH_I	sth	%r2, [%r4 + 0x0010]
	.word 0xc4712010  ! 249: STX_I	stx	%r2, [%r4 + 0x0010]
	.word 0xc2712010  ! 249: STX_I	stx	%r1, [%r4 + 0x0010]
	.word 0xc4292010  ! 249: STB_I	stb	%r2, [%r4 + 0x0010]
	.word 0xc6710005  ! 249: STX_R	stx	%r3, [%r4 + %r5]
	.word 0xdd212010  ! 249: STF_I	st	%f14, [0x0010, %r4]
	.word 0xc6292010  ! 249: STB_I	stb	%r3, [%r4 + 0x0010]
	.word 0xc6310005  ! 256: STH_R	sth	%r3, [%r4 + %r5]
	.word 0xc0710005  ! 256: STX_R	stx	%r0, [%r4 + %r5]
	.word 0xc0310005  ! 256: STH_R	sth	%r0, [%r4 + %r5]
	.word 0xc2712010  ! 256: STX_I	stx	%r1, [%r4 + 0x0010]
	.word 0xd4710005  ! 256: STX_R	stx	%r10, [%r4 + %r5]
	.word 0xf2290005  ! 256: STB_R	stb	%r25, [%r4 + %r5]
	.word 0xc4f92010  ! 256: SWAPA_I	swapa	%r2, [%r4 + 0x0010] %asi
	.word 0xc4212010  ! 256: STW_I	stw	%r2, [%r4 + 0x0010]
	.word 0xfa310005  ! 264: STH_R	sth	%r29, [%r4 + %r5]
	.word 0xc2712010  ! 264: STX_I	stx	%r1, [%r4 + 0x0010]
	.word 0xc4312010  ! 264: STH_I	sth	%r2, [%r4 + 0x0010]
	.word 0xc2212010  ! 264: STW_I	stw	%r1, [%r4 + 0x0010]
	.word 0xc6310005  ! 264: STH_R	sth	%r3, [%r4 + %r5]
	.word 0xe8310005  ! 264: STH_R	sth	%r20, [%r4 + %r5]
	.word 0xc2210005  ! 264: STW_R	stw	%r1, [%r4 + %r5]
	.word 0xfe210005  ! 264: STW_R	stw	%r31, [%r4 + %r5]
	.word 0xc2f91005  ! 264: SWAPA_R	swapa	%r1, [%r4 + %r5] 0x80
	.word 0xc2310005  ! 271: STH_R	sth	%r1, [%r4 + %r5]
	.word 0xc2292010  ! 271: STB_I	stb	%r1, [%r4 + 0x0010]
	.word 0xf8310005  ! 271: STH_R	sth	%r28, [%r4 + %r5]
	.word 0xc4212010  ! 271: STW_I	stw	%r2, [%r4 + 0x0010]
	.word 0xc6310005  ! 271: STH_R	sth	%r3, [%r4 + %r5]
	.word 0xfc212010  ! 271: STW_I	stw	%r30, [%r4 + 0x0010]
	.word 0xc5210005  ! 271: STF_R	st	%f2, [%r5, %r4]
	.word 0xc6290005  ! 271: STB_R	stb	%r3, [%r4 + %r5]
	.word 0xc0310005  ! 278: STH_R	sth	%r0, [%r4 + %r5]
	.word 0xc6310005  ! 278: STH_R	sth	%r3, [%r4 + %r5]
	.word 0xc0212010  ! 278: STW_I	stw	%r0, [%r4 + 0x0010]
	.word 0xc4712010  ! 278: STX_I	stx	%r2, [%r4 + 0x0010]
	.word 0xc2712010  ! 278: STX_I	stx	%r1, [%r4 + 0x0010]
	.word 0xc2212010  ! 278: STW_I	stw	%r1, [%r4 + 0x0010]
	.word 0xc3e11005  ! 278: CASA_I	casa	[%r4] 0x80, %r5, %r1
	.word 0xc2212010  ! 278: STW_I	stw	%r1, [%r4 + 0x0010]
	.word 0xf0310005  ! 286: STH_R	sth	%r24, [%r4 + %r5]
	.word 0xc4710005  ! 286: STX_R	stx	%r2, [%r4 + %r5]
	.word 0xc0210005  ! 286: STW_R	stw	%r0, [%r4 + %r5]
	.word 0xfa310005  ! 286: STH_R	sth	%r29, [%r4 + %r5]
	.word 0xc0712010  ! 286: STX_I	stx	%r0, [%r4 + 0x0010]
	.word 0xc2290005  ! 286: STB_R	stb	%r1, [%r4 + %r5]
	.word 0xc0712010  ! 286: STX_I	stx	%r0, [%r4 + 0x0010]
	.word 0xc1312010  ! 286: STQF_I	-	%f0, [0x0010, %r4]
	.word 0xc2290005  ! 286: STB_R	stb	%r1, [%r4 + %r5]
	.word 0xc4310005  ! 293: STH_R	sth	%r2, [%r4 + %r5]
	.word 0xc6292010  ! 293: STB_I	stb	%r3, [%r4 + 0x0010]
	.word 0xe6210005  ! 293: STW_R	stw	%r19, [%r4 + %r5]
	.word 0xc2312010  ! 293: STH_I	sth	%r1, [%r4 + 0x0010]
	.word 0xc6710005  ! 293: STX_R	stx	%r3, [%r4 + %r5]
	.word 0xc0710005  ! 293: STX_R	stx	%r0, [%r4 + %r5]
	.word 0xfb210005  ! 293: STF_R	st	%f29, [%r5, %r4]
	.word 0xe2310005  ! 293: STH_R	sth	%r17, [%r4 + %r5]
	.word 0xf8310005  ! 301: STH_R	sth	%r28, [%r4 + %r5]
	.word 0xc6312010  ! 301: STH_I	sth	%r3, [%r4 + 0x0010]
	.word 0xc2292010  ! 301: STB_I	stb	%r1, [%r4 + 0x0010]
	.word 0xc6212010  ! 301: STW_I	stw	%r3, [%r4 + 0x0010]
	.word 0xcc210005  ! 301: STW_R	stw	%r6, [%r4 + %r5]
	.word 0xc2710005  ! 301: STX_R	stx	%r1, [%r4 + %r5]
	.word 0xc4212010  ! 301: STW_I	stw	%r2, [%r4 + 0x0010]
	.word 0xc3210005  ! 301: STF_R	st	%f1, [%r5, %r4]
	.word 0xec710005  ! 301: STX_R	stx	%r22, [%r4 + %r5]
	.word 0xc6310005  ! 309: STH_R	sth	%r3, [%r4 + %r5]
	.word 0xc4310005  ! 309: STH_R	sth	%r2, [%r4 + %r5]
	.word 0xe2210005  ! 309: STW_R	stw	%r17, [%r4 + %r5]
	.word 0xc2212010  ! 309: STW_I	stw	%r1, [%r4 + 0x0010]
	.word 0xc0712010  ! 309: STX_I	stx	%r0, [%r4 + 0x0010]
	.word 0xc4290005  ! 309: STB_R	stb	%r2, [%r4 + %r5]
	.word 0xc0210005  ! 309: STW_R	stw	%r0, [%r4 + %r5]
	.word 0xc3390005  ! 309: STDF_R	std	%f1, [%r5, %r4]
	.word 0xf0292010  ! 309: STB_I	stb	%r24, [%r4 + 0x0010]
	.word 0xc0310005  ! 316: STH_R	sth	%r0, [%r4 + %r5]
	.word 0xc0292010  ! 316: STB_I	stb	%r0, [%r4 + 0x0010]
	.word 0xc6212010  ! 316: STW_I	stw	%r3, [%r4 + 0x0010]
	.word 0xc2710005  ! 316: STX_R	stx	%r1, [%r4 + %r5]
	.word 0xc0712010  ! 316: STX_I	stx	%r0, [%r4 + 0x0010]
	.word 0xee292010  ! 316: STB_I	stb	%r23, [%r4 + 0x0010]
	.word 0xc3e12005  ! 316: CASA_R	casa	[%r4] %asi, %r5, %r1
	.word 0xe8312010  ! 316: STH_I	sth	%r20, [%r4 + 0x0010]
	.word 0xc6310005  ! 323: STH_R	sth	%r3, [%r4 + %r5]
	.word 0xc4312010  ! 323: STH_I	sth	%r2, [%r4 + 0x0010]
	.word 0xc6292010  ! 323: STB_I	stb	%r3, [%r4 + 0x0010]
	.word 0xc2212010  ! 323: STW_I	stw	%r1, [%r4 + 0x0010]
	.word 0xe6290005  ! 323: STB_R	stb	%r19, [%r4 + %r5]
	.word 0xc4710005  ! 323: STX_R	stx	%r2, [%r4 + %r5]
	.word 0xc1310005  ! 323: STQF_R	-	%f0, [%r5, %r4]
	.word 0xc6310005  ! 323: STH_R	sth	%r3, [%r4 + %r5]
	.word 0xc0310005  ! 331: STH_R	sth	%r0, [%r4 + %r5]
	.word 0xc6292010  ! 331: STB_I	stb	%r3, [%r4 + 0x0010]
	.word 0xc2210005  ! 331: STW_R	stw	%r1, [%r4 + %r5]
	.word 0xc4712010  ! 331: STX_I	stx	%r2, [%r4 + 0x0010]
	.word 0xc4210005  ! 331: STW_R	stw	%r2, [%r4 + %r5]
	.word 0xc2310005  ! 331: STH_R	sth	%r1, [%r4 + %r5]
	.word 0xc0212010  ! 331: STW_I	stw	%r0, [%r4 + 0x0010]
	.word 0xc5310005  ! 331: STQF_R	-	%f2, [%r5, %r4]
	.word 0xc6292010  ! 331: STB_I	stb	%r3, [%r4 + 0x0010]
	.word 0xc6310005  ! 339: STH_R	sth	%r3, [%r4 + %r5]
	.word 0xfc292010  ! 339: STB_I	stb	%r30, [%r4 + 0x0010]
	.word 0xdc290005  ! 339: STB_R	stb	%r14, [%r4 + %r5]
	.word 0xe2710005  ! 339: STX_R	stx	%r17, [%r4 + %r5]
	.word 0xc0292010  ! 339: STB_I	stb	%r0, [%r4 + 0x0010]
	.word 0xc6290005  ! 339: STB_R	stb	%r3, [%r4 + %r5]
	.word 0xc6312010  ! 339: STH_I	sth	%r3, [%r4 + 0x0010]
	.word 0xef210005  ! 339: STF_R	st	%f23, [%r5, %r4]
	.word 0xfc212010  ! 339: STW_I	stw	%r30, [%r4 + 0x0010]
	.word 0xc2310005  ! 346: STH_R	sth	%r1, [%r4 + %r5]
	.word 0xc4292010  ! 346: STB_I	stb	%r2, [%r4 + 0x0010]
	.word 0xe2292010  ! 346: STB_I	stb	%r17, [%r4 + 0x0010]
	.word 0xc2290005  ! 346: STB_R	stb	%r1, [%r4 + %r5]
	.word 0xe8292010  ! 346: STB_I	stb	%r20, [%r4 + 0x0010]
	.word 0xe6212010  ! 346: STW_I	stw	%r19, [%r4 + 0x0010]
	.word 0xc5210005  ! 346: STF_R	st	%f2, [%r5, %r4]
	.word 0xe2312010  ! 346: STH_I	sth	%r17, [%r4 + 0x0010]
	.word 0xc4310005  ! 353: STH_R	sth	%r2, [%r4 + %r5]
	.word 0xc2312010  ! 353: STH_I	sth	%r1, [%r4 + 0x0010]
	.word 0xde710005  ! 353: STX_R	stx	%r15, [%r4 + %r5]
	.word 0xc4710005  ! 353: STX_R	stx	%r2, [%r4 + %r5]
	.word 0xc2210005  ! 353: STW_R	stw	%r1, [%r4 + %r5]
	.word 0xce710005  ! 353: STX_R	stx	%r7, [%r4 + %r5]
	.word 0xc5312010  ! 353: STQF_I	-	%f2, [0x0010, %r4]
	.word 0xe4210005  ! 353: STW_R	stw	%r18, [%r4 + %r5]
	.word 0xc2310005  ! 360: STH_R	sth	%r1, [%r4 + %r5]
	.word 0xc0212010  ! 360: STW_I	stw	%r0, [%r4 + 0x0010]
	.word 0xc2292010  ! 360: STB_I	stb	%r1, [%r4 + 0x0010]
	.word 0xc4212010  ! 360: STW_I	stw	%r2, [%r4 + 0x0010]
	.word 0xc2312010  ! 360: STH_I	sth	%r1, [%r4 + 0x0010]
	.word 0xc0310005  ! 360: STH_R	sth	%r0, [%r4 + %r5]
	.word 0xff312010  ! 360: STQF_I	-	%f31, [0x0010, %r4]
	.word 0xc0712010  ! 360: STX_I	stx	%r0, [%r4 + 0x0010]
	.word 0xc2310005  ! 368: STH_R	sth	%r1, [%r4 + %r5]
	.word 0xce292010  ! 368: STB_I	stb	%r7, [%r4 + 0x0010]
	.word 0xc2292010  ! 368: STB_I	stb	%r1, [%r4 + 0x0010]
	.word 0xc2712010  ! 368: STX_I	stx	%r1, [%r4 + 0x0010]
	.word 0xc4210005  ! 368: STW_R	stw	%r2, [%r4 + %r5]
	.word 0xc0710005  ! 368: STX_R	stx	%r0, [%r4 + %r5]
	.word 0xc4712010  ! 368: STX_I	stx	%r2, [%r4 + 0x0010]
	.word 0xc5e12005  ! 368: CASA_R	casa	[%r4] %asi, %r5, %r2
	.word 0xc2310005  ! 368: STH_R	sth	%r1, [%r4 + %r5]
	.word 0xf4310005  ! 375: STH_R	sth	%r26, [%r4 + %r5]
	.word 0xc4212010  ! 375: STW_I	stw	%r2, [%r4 + 0x0010]
	.word 0xc6210005  ! 375: STW_R	stw	%r3, [%r4 + %r5]
	.word 0xc4210005  ! 375: STW_R	stw	%r2, [%r4 + %r5]
	.word 0xc2712010  ! 375: STX_I	stx	%r1, [%r4 + 0x0010]
	.word 0xec310005  ! 375: STH_R	sth	%r22, [%r4 + %r5]
	.word 0xc3e11005  ! 375: CASA_I	casa	[%r4] 0x80, %r5, %r1
	.word 0xdc712010  ! 375: STX_I	stx	%r14, [%r4 + 0x0010]
	.word 0xc6310005  ! 382: STH_R	sth	%r3, [%r4 + %r5]
	.word 0xf0210005  ! 382: STW_R	stw	%r24, [%r4 + %r5]
	.word 0xc4210005  ! 382: STW_R	stw	%r2, [%r4 + %r5]
	.word 0xc0210005  ! 382: STW_R	stw	%r0, [%r4 + %r5]
	.word 0xc6712010  ! 382: STX_I	stx	%r3, [%r4 + 0x0010]
	.word 0xc4210005  ! 382: STW_R	stw	%r2, [%r4 + %r5]
	.word 0xc6e91005  ! 382: LDSTUBA_R	ldstuba	%r3, [%r4 + %r5] 0x80
	.word 0xea712010  ! 382: STX_I	stx	%r21, [%r4 + 0x0010]
	.word 0xc0310005  ! 389: STH_R	sth	%r0, [%r4 + %r5]
	.word 0xc0210005  ! 389: STW_R	stw	%r0, [%r4 + %r5]
	.word 0xc2292010  ! 389: STB_I	stb	%r1, [%r4 + 0x0010]
	.word 0xc2292010  ! 389: STB_I	stb	%r1, [%r4 + 0x0010]
	.word 0xe4292010  ! 389: STB_I	stb	%r18, [%r4 + 0x0010]
	.word 0xee292010  ! 389: STB_I	stb	%r23, [%r4 + 0x0010]
	.word 0xc0e91005  ! 389: LDSTUBA_R	ldstuba	%r0, [%r4 + %r5] 0x80
	.word 0xc2712010  ! 389: STX_I	stx	%r1, [%r4 + 0x0010]
	.word 0xc4310005  ! 396: STH_R	sth	%r2, [%r4 + %r5]
	.word 0xc0310005  ! 396: STH_R	sth	%r0, [%r4 + %r5]
	.word 0xc2290005  ! 396: STB_R	stb	%r1, [%r4 + %r5]
	.word 0xc0712010  ! 396: STX_I	stx	%r0, [%r4 + 0x0010]
	.word 0xc0290005  ! 396: STB_R	stb	%r0, [%r4 + %r5]
	.word 0xf6210005  ! 396: STW_R	stw	%r27, [%r4 + %r5]
	.word 0xde792010  ! 396: SWAP_I	swap	%r15, [%r4 + 0x0010]
	.word 0xc6710005  ! 396: STX_R	stx	%r3, [%r4 + %r5]
	.word 0xd6310005  ! 404: STH_R	sth	%r11, [%r4 + %r5]
	.word 0xc0310005  ! 404: STH_R	sth	%r0, [%r4 + %r5]
	.word 0xc4292010  ! 404: STB_I	stb	%r2, [%r4 + 0x0010]
	.word 0xd6292010  ! 404: STB_I	stb	%r11, [%r4 + 0x0010]
	.word 0xdc312010  ! 404: STH_I	sth	%r14, [%r4 + 0x0010]
	.word 0xc2292010  ! 404: STB_I	stb	%r1, [%r4 + 0x0010]
	.word 0xce210005  ! 404: STW_R	stw	%r7, [%r4 + %r5]
	.word 0xc6710005  ! 404: STX_R	stx	%r3, [%r4 + %r5]
	.word 0xcc290005  ! 404: STB_R	stb	%r6, [%r4 + %r5]
	.word 0xc6310005  ! 412: STH_R	sth	%r3, [%r4 + %r5]
	.word 0xc2712010  ! 412: STX_I	stx	%r1, [%r4 + 0x0010]
	.word 0xf2212010  ! 412: STW_I	stw	%r25, [%r4 + 0x0010]
	.word 0xc2292010  ! 412: STB_I	stb	%r1, [%r4 + 0x0010]
	.word 0xc2290005  ! 412: STB_R	stb	%r1, [%r4 + %r5]
	.word 0xc0212010  ! 412: STW_I	stw	%r0, [%r4 + 0x0010]
	.word 0xc2212010  ! 412: STW_I	stw	%r1, [%r4 + 0x0010]
	.word 0xc2712010  ! 412: STX_I	stx	%r1, [%r4 + 0x0010]
	.word 0xc0312010  ! 412: STH_I	sth	%r0, [%r4 + 0x0010]
	.word 0xf8310005  ! 420: STH_R	sth	%r28, [%r4 + %r5]
	.word 0xc2292010  ! 420: STB_I	stb	%r1, [%r4 + 0x0010]
	.word 0xda312010  ! 420: STH_I	sth	%r13, [%r4 + 0x0010]
	.word 0xc2712010  ! 420: STX_I	stx	%r1, [%r4 + 0x0010]
	.word 0xc0712010  ! 420: STX_I	stx	%r0, [%r4 + 0x0010]
	.word 0xc2312010  ! 420: STH_I	sth	%r1, [%r4 + 0x0010]
	.word 0xc6210005  ! 420: STW_R	stw	%r3, [%r4 + %r5]
	.word 0xc3310005  ! 420: STQF_R	-	%f1, [%r5, %r4]
	.word 0xc6212010  ! 420: STW_I	stw	%r3, [%r4 + 0x0010]
	.word 0xf4310005  ! 427: STH_R	sth	%r26, [%r4 + %r5]
	.word 0xc2290005  ! 427: STB_R	stb	%r1, [%r4 + %r5]
	.word 0xc6312010  ! 427: STH_I	sth	%r3, [%r4 + 0x0010]
	.word 0xc2210005  ! 427: STW_R	stw	%r1, [%r4 + %r5]
	.word 0xfe312010  ! 427: STH_I	sth	%r31, [%r4 + 0x0010]
	.word 0xc6292010  ! 427: STB_I	stb	%r3, [%r4 + 0x0010]
	.word 0xe3210005  ! 427: STF_R	st	%f17, [%r5, %r4]
	.word 0xc6210005  ! 427: STW_R	stw	%r3, [%r4 + %r5]
	.word 0xc2310005  ! 435: STH_R	sth	%r1, [%r4 + %r5]
	.word 0xe2292010  ! 435: STB_I	stb	%r17, [%r4 + 0x0010]
	.word 0xfe292010  ! 435: STB_I	stb	%r31, [%r4 + 0x0010]
	.word 0xc4290005  ! 435: STB_R	stb	%r2, [%r4 + %r5]
	.word 0xc4290005  ! 435: STB_R	stb	%r2, [%r4 + %r5]
	.word 0xc6210005  ! 435: STW_R	stw	%r3, [%r4 + %r5]
	.word 0xc0210005  ! 435: STW_R	stw	%r0, [%r4 + %r5]
	.word 0xd6f91005  ! 435: SWAPA_R	swapa	%r11, [%r4 + %r5] 0x80
	.word 0xc0212010  ! 435: STW_I	stw	%r0, [%r4 + 0x0010]
	.word 0xd4310005  ! 442: STH_R	sth	%r10, [%r4 + %r5]
	.word 0xc2292010  ! 442: STB_I	stb	%r1, [%r4 + 0x0010]
	.word 0xd4292010  ! 442: STB_I	stb	%r10, [%r4 + 0x0010]
	.word 0xf2712010  ! 442: STX_I	stx	%r25, [%r4 + 0x0010]
	.word 0xc6290005  ! 442: STB_R	stb	%r3, [%r4 + %r5]
	.word 0xc2312010  ! 442: STH_I	sth	%r1, [%r4 + 0x0010]
	.word 0xc6f91005  ! 442: SWAPA_R	swapa	%r3, [%r4 + %r5] 0x80
	.word 0xd4212010  ! 442: STW_I	stw	%r10, [%r4 + 0x0010]
	.word 0xc6310005  ! 449: STH_R	sth	%r3, [%r4 + %r5]
	.word 0xd4210005  ! 449: STW_R	stw	%r10, [%r4 + %r5]
	.word 0xc0712010  ! 449: STX_I	stx	%r0, [%r4 + 0x0010]
	.word 0xf8290005  ! 449: STB_R	stb	%r28, [%r4 + %r5]
	.word 0xc0712010  ! 449: STX_I	stx	%r0, [%r4 + 0x0010]
	.word 0xc0210005  ! 449: STW_R	stw	%r0, [%r4 + %r5]
	.word 0xc6e91005  ! 449: LDSTUBA_R	ldstuba	%r3, [%r4 + %r5] 0x80
	.word 0xc6292010  ! 449: STB_I	stb	%r3, [%r4 + 0x0010]
	.word 0xc6310005  ! 456: STH_R	sth	%r3, [%r4 + %r5]
	.word 0xec712010  ! 456: STX_I	stx	%r22, [%r4 + 0x0010]
	.word 0xc4292010  ! 456: STB_I	stb	%r2, [%r4 + 0x0010]
	.word 0xdc710005  ! 456: STX_R	stx	%r14, [%r4 + %r5]
	.word 0xc6290005  ! 456: STB_R	stb	%r3, [%r4 + %r5]
	.word 0xc6292010  ! 456: STB_I	stb	%r3, [%r4 + 0x0010]
	.word 0xeae92010  ! 456: LDSTUBA_I	ldstuba	%r21, [%r4 + 0x0010] %asi
	.word 0xf0710005  ! 456: STX_R	stx	%r24, [%r4 + %r5]
	.word 0xc4310005  ! 463: STH_R	sth	%r2, [%r4 + %r5]
	.word 0xea712010  ! 463: STX_I	stx	%r21, [%r4 + 0x0010]
	.word 0xf8212010  ! 463: STW_I	stw	%r28, [%r4 + 0x0010]
	.word 0xc0712010  ! 463: STX_I	stx	%r0, [%r4 + 0x0010]
	.word 0xc0312010  ! 463: STH_I	sth	%r0, [%r4 + 0x0010]
	.word 0xc0292010  ! 463: STB_I	stb	%r0, [%r4 + 0x0010]
	.word 0xcce91005  ! 463: LDSTUBA_R	ldstuba	%r6, [%r4 + %r5] 0x80
	.word 0xc4210005  ! 463: STW_R	stw	%r2, [%r4 + %r5]
	.word 0xd8310005  ! 470: STH_R	sth	%r12, [%r4 + %r5]
	.word 0xda310005  ! 470: STH_R	sth	%r13, [%r4 + %r5]
	.word 0xc6712010  ! 470: STX_I	stx	%r3, [%r4 + 0x0010]
	.word 0xe0712010  ! 470: STX_I	stx	%r16, [%r4 + 0x0010]
	.word 0xc4210005  ! 470: STW_R	stw	%r2, [%r4 + %r5]
	.word 0xc6290005  ! 470: STB_R	stb	%r3, [%r4 + %r5]
	.word 0xc1312010  ! 470: STQF_I	-	%f0, [0x0010, %r4]
	.word 0xf6312010  ! 470: STH_I	sth	%r27, [%r4 + 0x0010]
	.word 0xe8310005  ! 477: STH_R	sth	%r20, [%r4 + %r5]
	.word 0xce210005  ! 477: STW_R	stw	%r7, [%r4 + %r5]
	.word 0xc6312010  ! 477: STH_I	sth	%r3, [%r4 + 0x0010]
	.word 0xcc292010  ! 477: STB_I	stb	%r6, [%r4 + 0x0010]
	.word 0xdc212010  ! 477: STW_I	stw	%r14, [%r4 + 0x0010]
	.word 0xc0292010  ! 477: STB_I	stb	%r0, [%r4 + 0x0010]
	.word 0xc5310005  ! 477: STQF_R	-	%f2, [%r5, %r4]
	.word 0xc2712010  ! 477: STX_I	stx	%r1, [%r4 + 0x0010]
	.word 0xe0310005  ! 484: STH_R	sth	%r16, [%r4 + %r5]
	.word 0xea292010  ! 484: STB_I	stb	%r21, [%r4 + 0x0010]
	.word 0xd8712010  ! 484: STX_I	stx	%r12, [%r4 + 0x0010]
	.word 0xc4710005  ! 484: STX_R	stx	%r2, [%r4 + %r5]
	.word 0xc0290005  ! 484: STB_R	stb	%r0, [%r4 + %r5]
	.word 0xd2312010  ! 484: STH_I	sth	%r9, [%r4 + 0x0010]
	.word 0xc4792010  ! 484: SWAP_I	swap	%r2, [%r4 + 0x0010]
	.word 0xc2710005  ! 484: STX_R	stx	%r1, [%r4 + %r5]
	.word 0xc4310005  ! 491: STH_R	sth	%r2, [%r4 + %r5]
	.word 0xc6310005  ! 491: STH_R	sth	%r3, [%r4 + %r5]
	.word 0xc6712010  ! 491: STX_I	stx	%r3, [%r4 + 0x0010]
	.word 0xc0212010  ! 491: STW_I	stw	%r0, [%r4 + 0x0010]
	.word 0xdc290005  ! 491: STB_R	stb	%r14, [%r4 + %r5]
	.word 0xc6310005  ! 491: STH_R	sth	%r3, [%r4 + %r5]
	.word 0xc7310005  ! 491: STQF_R	-	%f3, [%r5, %r4]
	.word 0xc0210005  ! 491: STW_R	stw	%r0, [%r4 + %r5]
	.word 0xc4310005  ! 498: STH_R	sth	%r2, [%r4 + %r5]
	.word 0xc2310005  ! 498: STH_R	sth	%r1, [%r4 + %r5]
	.word 0xc2310005  ! 498: STH_R	sth	%r1, [%r4 + %r5]
	.word 0xc2312010  ! 498: STH_I	sth	%r1, [%r4 + 0x0010]
	.word 0xc2290005  ! 498: STB_R	stb	%r1, [%r4 + %r5]
	.word 0xc6290005  ! 498: STB_R	stb	%r3, [%r4 + %r5]
	.word 0xc3f12005  ! 498: CASXA_R	casxa	[%r4]%asi, %r5, %r1
	.word 0xc4212010  ! 498: STW_I	stw	%r2, [%r4 + 0x0010]
	.word 0xc6310005  ! 505: STH_R	sth	%r3, [%r4 + %r5]
	.word 0xc6310005  ! 505: STH_R	sth	%r3, [%r4 + %r5]
	.word 0xf4310005  ! 505: STH_R	sth	%r26, [%r4 + %r5]
	.word 0xc6310005  ! 505: STH_R	sth	%r3, [%r4 + %r5]
	.word 0xc2292010  ! 505: STB_I	stb	%r1, [%r4 + 0x0010]
	.word 0xf4210005  ! 505: STW_R	stw	%r26, [%r4 + %r5]
	.word 0xc5210005  ! 505: STF_R	st	%f2, [%r5, %r4]
	.word 0xc6312010  ! 505: STH_I	sth	%r3, [%r4 + 0x0010]
	.word 0xc6310005  ! 512: STH_R	sth	%r3, [%r4 + %r5]
	.word 0xc4212010  ! 512: STW_I	stw	%r2, [%r4 + 0x0010]
	.word 0xc2710005  ! 512: STX_R	stx	%r1, [%r4 + %r5]
	.word 0xea292010  ! 512: STB_I	stb	%r21, [%r4 + 0x0010]
	.word 0xf4290005  ! 512: STB_R	stb	%r26, [%r4 + %r5]
	.word 0xf0712010  ! 512: STX_I	stx	%r24, [%r4 + 0x0010]
	.word 0xe9312010  ! 512: STQF_I	-	%f20, [0x0010, %r4]
	.word 0xc0210005  ! 512: STW_R	stw	%r0, [%r4 + %r5]
	.word 0xc2310005  ! 520: STH_R	sth	%r1, [%r4 + %r5]
	.word 0xce210005  ! 520: STW_R	stw	%r7, [%r4 + %r5]
	.word 0xc6210005  ! 520: STW_R	stw	%r3, [%r4 + %r5]
	.word 0xc0210005  ! 520: STW_R	stw	%r0, [%r4 + %r5]
	.word 0xc6292010  ! 520: STB_I	stb	%r3, [%r4 + 0x0010]
	.word 0xe6712010  ! 520: STX_I	stx	%r19, [%r4 + 0x0010]
	.word 0xc6292010  ! 520: STB_I	stb	%r3, [%r4 + 0x0010]
	.word 0xce712010  ! 520: STX_I	stx	%r7, [%r4 + 0x0010]
	.word 0xc5210005  ! 520: STF_R	st	%f2, [%r5, %r4]
	.word 0xdc310005  ! 528: STH_R	sth	%r14, [%r4 + %r5]
	.word 0xc4710005  ! 528: STX_R	stx	%r2, [%r4 + %r5]
	.word 0xc2292010  ! 528: STB_I	stb	%r1, [%r4 + 0x0010]
	.word 0xee212010  ! 528: STW_I	stw	%r23, [%r4 + 0x0010]
	.word 0xc2210005  ! 528: STW_R	stw	%r1, [%r4 + %r5]
	.word 0xd0210005  ! 528: STW_R	stw	%r8, [%r4 + %r5]
	.word 0xc4210005  ! 528: STW_R	stw	%r2, [%r4 + %r5]
	.word 0xc6710005  ! 528: STX_R	stx	%r3, [%r4 + %r5]
	.word 0xc0290005  ! 528: STB_R	stb	%r0, [%r4 + %r5]
	.word 0xce310005  ! 536: STH_R	sth	%r7, [%r4 + %r5]
	.word 0xc2212010  ! 536: STW_I	stw	%r1, [%r4 + 0x0010]
	.word 0xfc290005  ! 536: STB_R	stb	%r30, [%r4 + %r5]
	.word 0xc2292010  ! 536: STB_I	stb	%r1, [%r4 + 0x0010]
	.word 0xe8290005  ! 536: STB_R	stb	%r20, [%r4 + %r5]
	.word 0xc2712010  ! 536: STX_I	stx	%r1, [%r4 + 0x0010]
	.word 0xd4712010  ! 536: STX_I	stx	%r10, [%r4 + 0x0010]
	.word 0xc7312010  ! 536: STQF_I	-	%f3, [0x0010, %r4]
	.word 0xe6712010  ! 536: STX_I	stx	%r19, [%r4 + 0x0010]
	.word 0xf8310005  ! 543: STH_R	sth	%r28, [%r4 + %r5]
	.word 0xc6212010  ! 543: STW_I	stw	%r3, [%r4 + 0x0010]
	.word 0xc2712010  ! 543: STX_I	stx	%r1, [%r4 + 0x0010]
	.word 0xc4212010  ! 543: STW_I	stw	%r2, [%r4 + 0x0010]
	.word 0xc4210005  ! 543: STW_R	stw	%r2, [%r4 + %r5]
	.word 0xc4290005  ! 543: STB_R	stb	%r2, [%r4 + %r5]
	.word 0xc2e92010  ! 543: LDSTUBA_I	ldstuba	%r1, [%r4 + 0x0010] %asi
	.word 0xde290005  ! 543: STB_R	stb	%r15, [%r4 + %r5]
	.word 0xf0310005  ! 550: STH_R	sth	%r24, [%r4 + %r5]
	.word 0xd8712010  ! 550: STX_I	stx	%r12, [%r4 + 0x0010]
	.word 0xc6290005  ! 550: STB_R	stb	%r3, [%r4 + %r5]
	.word 0xc0290005  ! 550: STB_R	stb	%r0, [%r4 + %r5]
	.word 0xc4210005  ! 550: STW_R	stw	%r2, [%r4 + %r5]
	.word 0xc4312010  ! 550: STH_I	sth	%r2, [%r4 + 0x0010]
	.word 0xc1f11005  ! 550: CASXA_I	casxa	[%r4] 0x80, %r5, %r0
	.word 0xd4312010  ! 550: STH_I	sth	%r10, [%r4 + 0x0010]
	.word 0xc2310005  ! 557: STH_R	sth	%r1, [%r4 + %r5]
	.word 0xc2712010  ! 557: STX_I	stx	%r1, [%r4 + 0x0010]
	.word 0xfe210005  ! 557: STW_R	stw	%r31, [%r4 + %r5]
	.word 0xc6312010  ! 557: STH_I	sth	%r3, [%r4 + 0x0010]
	.word 0xc4210005  ! 557: STW_R	stw	%r2, [%r4 + %r5]
	.word 0xf8310005  ! 557: STH_R	sth	%r28, [%r4 + %r5]
	.word 0xf1e12005  ! 557: CASA_R	casa	[%r4] %asi, %r5, %r24
	.word 0xc4712010  ! 557: STX_I	stx	%r2, [%r4 + 0x0010]
	.word 0xc6310005  ! 564: STH_R	sth	%r3, [%r4 + %r5]
	.word 0xd2210005  ! 564: STW_R	stw	%r9, [%r4 + %r5]
	.word 0xc0312010  ! 564: STH_I	sth	%r0, [%r4 + 0x0010]
	.word 0xc2310005  ! 564: STH_R	sth	%r1, [%r4 + %r5]
	.word 0xc2310005  ! 564: STH_R	sth	%r1, [%r4 + %r5]
	.word 0xdc712010  ! 564: STX_I	stx	%r14, [%r4 + 0x0010]
	.word 0xd3392010  ! 564: STDF_I	std	%f9, [0x0010, %r4]
	.word 0xc6292010  ! 564: STB_I	stb	%r3, [%r4 + 0x0010]
	.word 0xc4310005  ! 571: STH_R	sth	%r2, [%r4 + %r5]
	.word 0xd4290005  ! 571: STB_R	stb	%r10, [%r4 + %r5]
	.word 0xc0292010  ! 571: STB_I	stb	%r0, [%r4 + 0x0010]
	.word 0xc0710005  ! 571: STX_R	stx	%r0, [%r4 + %r5]
	.word 0xf8292010  ! 571: STB_I	stb	%r28, [%r4 + 0x0010]
	.word 0xc6712010  ! 571: STX_I	stx	%r3, [%r4 + 0x0010]
	.word 0xc1e11005  ! 571: CASA_I	casa	[%r4] 0x80, %r5, %r0
	.word 0xc0710005  ! 571: STX_R	stx	%r0, [%r4 + %r5]
	.word 0xc6310005  ! 579: STH_R	sth	%r3, [%r4 + %r5]
	.word 0xc4310005  ! 579: STH_R	sth	%r2, [%r4 + %r5]
	.word 0xc0292010  ! 579: STB_I	stb	%r0, [%r4 + 0x0010]
	.word 0xd4712010  ! 579: STX_I	stx	%r10, [%r4 + 0x0010]
	.word 0xe0212010  ! 579: STW_I	stw	%r16, [%r4 + 0x0010]
	.word 0xc4710005  ! 579: STX_R	stx	%r2, [%r4 + %r5]
	.word 0xd0212010  ! 579: STW_I	stw	%r8, [%r4 + 0x0010]
	.word 0xf5e11005  ! 579: CASA_I	casa	[%r4] 0x80, %r5, %r26
	.word 0xc0312010  ! 579: STH_I	sth	%r0, [%r4 + 0x0010]
	.word 0xfc310005  ! 586: STH_R	sth	%r30, [%r4 + %r5]
	.word 0xd6712010  ! 586: STX_I	stx	%r11, [%r4 + 0x0010]
	.word 0xc6292010  ! 586: STB_I	stb	%r3, [%r4 + 0x0010]
	.word 0xc6292010  ! 586: STB_I	stb	%r3, [%r4 + 0x0010]
	.word 0xf2212010  ! 586: STW_I	stw	%r25, [%r4 + 0x0010]
	.word 0xc2290005  ! 586: STB_R	stb	%r1, [%r4 + %r5]
	.word 0xc7e12005  ! 586: CASA_R	casa	[%r4] %asi, %r5, %r3
	.word 0xc4310005  ! 586: STH_R	sth	%r2, [%r4 + %r5]
	.word 0xc6310005  ! 593: STH_R	sth	%r3, [%r4 + %r5]
	.word 0xc0712010  ! 593: STX_I	stx	%r0, [%r4 + 0x0010]
	.word 0xf0710005  ! 593: STX_R	stx	%r24, [%r4 + %r5]
	.word 0xd0290005  ! 593: STB_R	stb	%r8, [%r4 + %r5]
	.word 0xc0292010  ! 593: STB_I	stb	%r0, [%r4 + 0x0010]
	.word 0xf0210005  ! 593: STW_R	stw	%r24, [%r4 + %r5]
	.word 0xed310005  ! 593: STQF_R	-	%f22, [%r5, %r4]
	.word 0xc0292010  ! 593: STB_I	stb	%r0, [%r4 + 0x0010]
	.word 0xc4310005  ! 600: STH_R	sth	%r2, [%r4 + %r5]
	.word 0xe2212010  ! 600: STW_I	stw	%r17, [%r4 + 0x0010]
	.word 0xe0310005  ! 600: STH_R	sth	%r16, [%r4 + %r5]
	.word 0xc0710005  ! 600: STX_R	stx	%r0, [%r4 + %r5]
	.word 0xc4312010  ! 600: STH_I	sth	%r2, [%r4 + 0x0010]
	.word 0xc4292010  ! 600: STB_I	stb	%r2, [%r4 + 0x0010]
	.word 0xf9f11005  ! 600: CASXA_I	casxa	[%r4] 0x80, %r5, %r28
	.word 0xfe212010  ! 600: STW_I	stw	%r31, [%r4 + 0x0010]
	.word 0xc2310005  ! 607: STH_R	sth	%r1, [%r4 + %r5]
	.word 0xec310005  ! 607: STH_R	sth	%r22, [%r4 + %r5]
	.word 0xe8712010  ! 607: STX_I	stx	%r20, [%r4 + 0x0010]
	.word 0xc6712010  ! 607: STX_I	stx	%r3, [%r4 + 0x0010]
	.word 0xc2710005  ! 607: STX_R	stx	%r1, [%r4 + %r5]
	.word 0xc2312010  ! 607: STH_I	sth	%r1, [%r4 + 0x0010]
	.word 0xc2f91005  ! 607: SWAPA_R	swapa	%r1, [%r4 + %r5] 0x80
	.word 0xc2310005  ! 607: STH_R	sth	%r1, [%r4 + %r5]
	.word 0xc0310005  ! 614: STH_R	sth	%r0, [%r4 + %r5]
	.word 0xfc712010  ! 614: STX_I	stx	%r30, [%r4 + 0x0010]
	.word 0xc0210005  ! 614: STW_R	stw	%r0, [%r4 + %r5]
	.word 0xde210005  ! 614: STW_R	stw	%r15, [%r4 + %r5]
	.word 0xf6210005  ! 614: STW_R	stw	%r27, [%r4 + %r5]
	.word 0xd6290005  ! 614: STB_R	stb	%r11, [%r4 + %r5]
	.word 0xe9390005  ! 614: STDF_R	std	%f20, [%r5, %r4]
	.word 0xc0290005  ! 614: STB_R	stb	%r0, [%r4 + %r5]
	.word 0xc6310005  ! 621: STH_R	sth	%r3, [%r4 + %r5]
	.word 0xc2290005  ! 621: STB_R	stb	%r1, [%r4 + %r5]
	.word 0xce712010  ! 621: STX_I	stx	%r7, [%r4 + 0x0010]
	.word 0xdc290005  ! 621: STB_R	stb	%r14, [%r4 + %r5]
	.word 0xc2212010  ! 621: STW_I	stw	%r1, [%r4 + 0x0010]
	.word 0xc4310005  ! 621: STH_R	sth	%r2, [%r4 + %r5]
	.word 0xcef92010  ! 621: SWAPA_I	swapa	%r7, [%r4 + 0x0010] %asi
	.word 0xde290005  ! 621: STB_R	stb	%r15, [%r4 + %r5]
	.word 0xc0310005  ! 628: STH_R	sth	%r0, [%r4 + %r5]
	.word 0xd8312010  ! 628: STH_I	sth	%r12, [%r4 + 0x0010]
	.word 0xc4292010  ! 628: STB_I	stb	%r2, [%r4 + 0x0010]
	.word 0xf2310005  ! 628: STH_R	sth	%r25, [%r4 + %r5]
	.word 0xc2712010  ! 628: STX_I	stx	%r1, [%r4 + 0x0010]
	.word 0xc0212010  ! 628: STW_I	stw	%r0, [%r4 + 0x0010]
	.word 0xc5f11005  ! 628: CASXA_I	casxa	[%r4] 0x80, %r5, %r2
	.word 0xc6710005  ! 628: STX_R	stx	%r3, [%r4 + %r5]
	.word 0xc2310005  ! 635: STH_R	sth	%r1, [%r4 + %r5]
	.word 0xd2310005  ! 635: STH_R	sth	%r9, [%r4 + %r5]
	.word 0xc4290005  ! 635: STB_R	stb	%r2, [%r4 + %r5]
	.word 0xc4210005  ! 635: STW_R	stw	%r2, [%r4 + %r5]
	.word 0xc4312010  ! 635: STH_I	sth	%r2, [%r4 + 0x0010]
	.word 0xfe292010  ! 635: STB_I	stb	%r31, [%r4 + 0x0010]
	.word 0xc1210005  ! 635: STF_R	st	%f0, [%r5, %r4]
	.word 0xc0290005  ! 635: STB_R	stb	%r0, [%r4 + %r5]
	.word 0xc0310005  ! 642: STH_R	sth	%r0, [%r4 + %r5]
	.word 0xc0212010  ! 642: STW_I	stw	%r0, [%r4 + 0x0010]
	.word 0xc6210005  ! 642: STW_R	stw	%r3, [%r4 + %r5]
	.word 0xf0710005  ! 642: STX_R	stx	%r24, [%r4 + %r5]
	.word 0xc2290005  ! 642: STB_R	stb	%r1, [%r4 + %r5]
	.word 0xc6210005  ! 642: STW_R	stw	%r3, [%r4 + %r5]
	.word 0xdb210005  ! 642: STF_R	st	%f13, [%r5, %r4]
	.word 0xe6210005  ! 642: STW_R	stw	%r19, [%r4 + %r5]
	.word 0xcc310005  ! 650: STH_R	sth	%r6, [%r4 + %r5]
	.word 0xfe310005  ! 650: STH_R	sth	%r31, [%r4 + %r5]
	.word 0xc4292010  ! 650: STB_I	stb	%r2, [%r4 + 0x0010]
	.word 0xe6310005  ! 650: STH_R	sth	%r19, [%r4 + %r5]
	.word 0xc4312010  ! 650: STH_I	sth	%r2, [%r4 + 0x0010]
	.word 0xc2712010  ! 650: STX_I	stx	%r1, [%r4 + 0x0010]
	.word 0xc4212010  ! 650: STW_I	stw	%r2, [%r4 + 0x0010]
	.word 0xd3310005  ! 650: STQF_R	-	%f9, [%r5, %r4]
	.word 0xde210005  ! 650: STW_R	stw	%r15, [%r4 + %r5]
	.word 0xc6310005  ! 657: STH_R	sth	%r3, [%r4 + %r5]
	.word 0xc2712010  ! 657: STX_I	stx	%r1, [%r4 + 0x0010]
	.word 0xfe710005  ! 657: STX_R	stx	%r31, [%r4 + %r5]
	.word 0xc6292010  ! 657: STB_I	stb	%r3, [%r4 + 0x0010]
	.word 0xc2290005  ! 657: STB_R	stb	%r1, [%r4 + %r5]
	.word 0xc2292010  ! 657: STB_I	stb	%r1, [%r4 + 0x0010]
	.word 0xc1e11005  ! 657: CASA_I	casa	[%r4] 0x80, %r5, %r0
	.word 0xc4212010  ! 657: STW_I	stw	%r2, [%r4 + 0x0010]
	.word 0xc2310005  ! 665: STH_R	sth	%r1, [%r4 + %r5]
	.word 0xec292010  ! 665: STB_I	stb	%r22, [%r4 + 0x0010]
	.word 0xc0212010  ! 665: STW_I	stw	%r0, [%r4 + 0x0010]
	.word 0xc2310005  ! 665: STH_R	sth	%r1, [%r4 + %r5]
	.word 0xfc292010  ! 665: STB_I	stb	%r30, [%r4 + 0x0010]
	.word 0xc2310005  ! 665: STH_R	sth	%r1, [%r4 + %r5]
	.word 0xf0312010  ! 665: STH_I	sth	%r24, [%r4 + 0x0010]
	.word 0xc3310005  ! 665: STQF_R	-	%f1, [%r5, %r4]
	.word 0xc6710005  ! 665: STX_R	stx	%r3, [%r4 + %r5]
	.word 0xc6310005  ! 673: STH_R	sth	%r3, [%r4 + %r5]
	.word 0xc0710005  ! 673: STX_R	stx	%r0, [%r4 + %r5]
	.word 0xc2210005  ! 673: STW_R	stw	%r1, [%r4 + %r5]
	.word 0xe8710005  ! 673: STX_R	stx	%r20, [%r4 + %r5]
	.word 0xdc310005  ! 673: STH_R	sth	%r14, [%r4 + %r5]
	.word 0xc6312010  ! 673: STH_I	sth	%r3, [%r4 + 0x0010]
	.word 0xce710005  ! 673: STX_R	stx	%r7, [%r4 + %r5]
	.word 0xc5e12005  ! 673: CASA_R	casa	[%r4] %asi, %r5, %r2
	.word 0xe6710005  ! 673: STX_R	stx	%r19, [%r4 + %r5]
	.word 0xc2310005  ! 681: STH_R	sth	%r1, [%r4 + %r5]
	.word 0xc6212010  ! 681: STW_I	stw	%r3, [%r4 + 0x0010]
	.word 0xc2712010  ! 681: STX_I	stx	%r1, [%r4 + 0x0010]
	.word 0xc6710005  ! 681: STX_R	stx	%r3, [%r4 + %r5]
	.word 0xc0212010  ! 681: STW_I	stw	%r0, [%r4 + 0x0010]
	.word 0xc4310005  ! 681: STH_R	sth	%r2, [%r4 + %r5]
	.word 0xee310005  ! 681: STH_R	sth	%r23, [%r4 + %r5]
	.word 0xc0712010  ! 681: STX_I	stx	%r0, [%r4 + 0x0010]
	.word 0xc7210005  ! 681: STF_R	st	%f3, [%r5, %r4]
	.word 0xc4310005  ! 688: STH_R	sth	%r2, [%r4 + %r5]
	.word 0xf4292010  ! 688: STB_I	stb	%r26, [%r4 + 0x0010]
	.word 0xc2312010  ! 688: STH_I	sth	%r1, [%r4 + 0x0010]
	.word 0xc2212010  ! 688: STW_I	stw	%r1, [%r4 + 0x0010]
	.word 0xfa292010  ! 688: STB_I	stb	%r29, [%r4 + 0x0010]
	.word 0xe2292010  ! 688: STB_I	stb	%r17, [%r4 + 0x0010]
	.word 0xc7392010  ! 688: STDF_I	std	%f3, [0x0010, %r4]
	.word 0xc6310005  ! 688: STH_R	sth	%r3, [%r4 + %r5]
	.word 0xc0310005  ! 695: STH_R	sth	%r0, [%r4 + %r5]
	.word 0xc2312010  ! 695: STH_I	sth	%r1, [%r4 + 0x0010]
	.word 0xc4290005  ! 695: STB_R	stb	%r2, [%r4 + %r5]
	.word 0xc6312010  ! 695: STH_I	sth	%r3, [%r4 + 0x0010]
	.word 0xda712010  ! 695: STX_I	stx	%r13, [%r4 + 0x0010]
	.word 0xe8292010  ! 695: STB_I	stb	%r20, [%r4 + 0x0010]
	.word 0xc7f11005  ! 695: CASXA_I	casxa	[%r4] 0x80, %r5, %r3
	.word 0xe4210005  ! 695: STW_R	stw	%r18, [%r4 + %r5]
	.word 0xc6310005  ! 703: STH_R	sth	%r3, [%r4 + %r5]
	.word 0xc6712010  ! 703: STX_I	stx	%r3, [%r4 + 0x0010]
	.word 0xc4712010  ! 703: STX_I	stx	%r2, [%r4 + 0x0010]
	.word 0xc6312010  ! 703: STH_I	sth	%r3, [%r4 + 0x0010]
	.word 0xcc290005  ! 703: STB_R	stb	%r6, [%r4 + %r5]
	.word 0xc2310005  ! 703: STH_R	sth	%r1, [%r4 + %r5]
	.word 0xc0290005  ! 703: STB_R	stb	%r0, [%r4 + %r5]
	.word 0xc2792010  ! 703: SWAP_I	swap	%r1, [%r4 + 0x0010]
	.word 0xc4210005  ! 703: STW_R	stw	%r2, [%r4 + %r5]
	.word 0xc4310005  ! 710: STH_R	sth	%r2, [%r4 + %r5]
	.word 0xc0212010  ! 710: STW_I	stw	%r0, [%r4 + 0x0010]
	.word 0xd2210005  ! 710: STW_R	stw	%r9, [%r4 + %r5]
	.word 0xc0310005  ! 710: STH_R	sth	%r0, [%r4 + %r5]
	.word 0xc4312010  ! 710: STH_I	sth	%r2, [%r4 + 0x0010]
	.word 0xc0210005  ! 710: STW_R	stw	%r0, [%r4 + %r5]
	.word 0xc1e12005  ! 710: CASA_R	casa	[%r4] %asi, %r5, %r0
	.word 0xc2310005  ! 710: STH_R	sth	%r1, [%r4 + %r5]
	.word 0xc2310005  ! 717: STH_R	sth	%r1, [%r4 + %r5]
	.word 0xc6710005  ! 717: STX_R	stx	%r3, [%r4 + %r5]
	.word 0xda710005  ! 717: STX_R	stx	%r13, [%r4 + %r5]
	.word 0xee710005  ! 717: STX_R	stx	%r23, [%r4 + %r5]
	.word 0xc4210005  ! 717: STW_R	stw	%r2, [%r4 + %r5]
	.word 0xc0312010  ! 717: STH_I	sth	%r0, [%r4 + 0x0010]
	.word 0xc3310005  ! 717: STQF_R	-	%f1, [%r5, %r4]
	.word 0xc4292010  ! 717: STB_I	stb	%r2, [%r4 + 0x0010]
	.word 0xc2310005  ! 725: STH_R	sth	%r1, [%r4 + %r5]
	.word 0xc2210005  ! 725: STW_R	stw	%r1, [%r4 + %r5]
	.word 0xc2210005  ! 725: STW_R	stw	%r1, [%r4 + %r5]
	.word 0xd2312010  ! 725: STH_I	sth	%r9, [%r4 + 0x0010]
	.word 0xc0292010  ! 725: STB_I	stb	%r0, [%r4 + 0x0010]
	.word 0xee312010  ! 725: STH_I	sth	%r23, [%r4 + 0x0010]
	.word 0xc4310005  ! 725: STH_R	sth	%r2, [%r4 + %r5]
	.word 0xc5f12005  ! 725: CASXA_R	casxa	[%r4]%asi, %r5, %r2
	.word 0xc0312010  ! 725: STH_I	sth	%r0, [%r4 + 0x0010]
	.word 0xc0310005  ! 733: STH_R	sth	%r0, [%r4 + %r5]
	.word 0xec212010  ! 733: STW_I	stw	%r22, [%r4 + 0x0010]
	.word 0xc4292010  ! 733: STB_I	stb	%r2, [%r4 + 0x0010]
	.word 0xc6712010  ! 733: STX_I	stx	%r3, [%r4 + 0x0010]
	.word 0xc6292010  ! 733: STB_I	stb	%r3, [%r4 + 0x0010]
	.word 0xd2290005  ! 733: STB_R	stb	%r9, [%r4 + %r5]
	.word 0xea312010  ! 733: STH_I	sth	%r21, [%r4 + 0x0010]
	.word 0xc3e12005  ! 733: CASA_R	casa	[%r4] %asi, %r5, %r1
	.word 0xc2310005  ! 733: STH_R	sth	%r1, [%r4 + %r5]
	.word 0xc2310005  ! 740: STH_R	sth	%r1, [%r4 + %r5]
	.word 0xe0292010  ! 740: STB_I	stb	%r16, [%r4 + 0x0010]
	.word 0xc6310005  ! 740: STH_R	sth	%r3, [%r4 + %r5]
	.word 0xfe312010  ! 740: STH_I	sth	%r31, [%r4 + 0x0010]
	.word 0xfe210005  ! 740: STW_R	stw	%r31, [%r4 + %r5]
	.word 0xc6312010  ! 740: STH_I	sth	%r3, [%r4 + 0x0010]
	.word 0xc0792010  ! 740: SWAP_I	swap	%r0, [%r4 + 0x0010]
	.word 0xe0310005  ! 740: STH_R	sth	%r16, [%r4 + %r5]
	.word 0xf6310005  ! 748: STH_R	sth	%r27, [%r4 + %r5]
	.word 0xf8712010  ! 748: STX_I	stx	%r28, [%r4 + 0x0010]
	.word 0xc6212010  ! 748: STW_I	stw	%r3, [%r4 + 0x0010]
	.word 0xc4312010  ! 748: STH_I	sth	%r2, [%r4 + 0x0010]
	.word 0xde312010  ! 748: STH_I	sth	%r15, [%r4 + 0x0010]
	.word 0xc4310005  ! 748: STH_R	sth	%r2, [%r4 + %r5]
	.word 0xc6212010  ! 748: STW_I	stw	%r3, [%r4 + 0x0010]
	.word 0xc2312010  ! 748: STH_I	sth	%r1, [%r4 + 0x0010]
	.word 0xe8212010  ! 748: STW_I	stw	%r20, [%r4 + 0x0010]
	.word 0xec310005  ! 755: STH_R	sth	%r22, [%r4 + %r5]
	.word 0xe2312010  ! 755: STH_I	sth	%r17, [%r4 + 0x0010]
	.word 0xc2292010  ! 755: STB_I	stb	%r1, [%r4 + 0x0010]
	.word 0xc6292010  ! 755: STB_I	stb	%r3, [%r4 + 0x0010]
	.word 0xd2292010  ! 755: STB_I	stb	%r9, [%r4 + 0x0010]
	.word 0xc2210005  ! 755: STW_R	stw	%r1, [%r4 + %r5]
	.word 0xc3310005  ! 755: STQF_R	-	%f1, [%r5, %r4]
	.word 0xe4310005  ! 755: STH_R	sth	%r18, [%r4 + %r5]
	.word 0xc4310005  ! 762: STH_R	sth	%r2, [%r4 + %r5]
	.word 0xc4312010  ! 762: STH_I	sth	%r2, [%r4 + 0x0010]
	.word 0xc0292010  ! 762: STB_I	stb	%r0, [%r4 + 0x0010]
	.word 0xe4210005  ! 762: STW_R	stw	%r18, [%r4 + %r5]
	.word 0xfa212010  ! 762: STW_I	stw	%r29, [%r4 + 0x0010]
	.word 0xdc210005  ! 762: STW_R	stw	%r14, [%r4 + %r5]
	.word 0xc5390005  ! 762: STDF_R	std	%f2, [%r5, %r4]
	.word 0xd0710005  ! 762: STX_R	stx	%r8, [%r4 + %r5]
	.word 0xee310005  ! 769: STH_R	sth	%r23, [%r4 + %r5]
	.word 0xc6712010  ! 769: STX_I	stx	%r3, [%r4 + 0x0010]
	.word 0xe6210005  ! 769: STW_R	stw	%r19, [%r4 + %r5]
	.word 0xec292010  ! 769: STB_I	stb	%r22, [%r4 + 0x0010]
	.word 0xfe212010  ! 769: STW_I	stw	%r31, [%r4 + 0x0010]
	.word 0xc0210005  ! 769: STW_R	stw	%r0, [%r4 + %r5]
	.word 0xc1e11005  ! 769: CASA_I	casa	[%r4] 0x80, %r5, %r0
	.word 0xc0292010  ! 769: STB_I	stb	%r0, [%r4 + 0x0010]
	.word 0xc4310005  ! 776: STH_R	sth	%r2, [%r4 + %r5]
	.word 0xc0292010  ! 776: STB_I	stb	%r0, [%r4 + 0x0010]
	.word 0xc6212010  ! 776: STW_I	stw	%r3, [%r4 + 0x0010]
	.word 0xc6312010  ! 776: STH_I	sth	%r3, [%r4 + 0x0010]
	.word 0xe6710005  ! 776: STX_R	stx	%r19, [%r4 + %r5]
	.word 0xc2712010  ! 776: STX_I	stx	%r1, [%r4 + 0x0010]
	.word 0xc7f12005  ! 776: CASXA_R	casxa	[%r4]%asi, %r5, %r3
	.word 0xc2290005  ! 776: STB_R	stb	%r1, [%r4 + %r5]
	.word 0xd8310005  ! 784: STH_R	sth	%r12, [%r4 + %r5]
	.word 0xc6312010  ! 784: STH_I	sth	%r3, [%r4 + 0x0010]
	.word 0xc0310005  ! 784: STH_R	sth	%r0, [%r4 + %r5]
	.word 0xc0712010  ! 784: STX_I	stx	%r0, [%r4 + 0x0010]
	.word 0xc6290005  ! 784: STB_R	stb	%r3, [%r4 + %r5]
	.word 0xde210005  ! 784: STW_R	stw	%r15, [%r4 + %r5]
	.word 0xc0710005  ! 784: STX_R	stx	%r0, [%r4 + %r5]
	.word 0xfe310005  ! 784: STH_R	sth	%r31, [%r4 + %r5]
	.word 0xe3210005  ! 784: STF_R	st	%f17, [%r5, %r4]
	.word 0xc0310005  ! 791: STH_R	sth	%r0, [%r4 + %r5]
	.word 0xe6290005  ! 791: STB_R	stb	%r19, [%r4 + %r5]
	.word 0xc0292010  ! 791: STB_I	stb	%r0, [%r4 + 0x0010]
	.word 0xc6292010  ! 791: STB_I	stb	%r3, [%r4 + 0x0010]
	.word 0xea310005  ! 791: STH_R	sth	%r21, [%r4 + %r5]
	.word 0xc2712010  ! 791: STX_I	stx	%r1, [%r4 + 0x0010]
	.word 0xc3e12005  ! 791: CASA_R	casa	[%r4] %asi, %r5, %r1
	.word 0xd2290005  ! 791: STB_R	stb	%r9, [%r4 + %r5]
	.word 0xd0310005  ! 798: STH_R	sth	%r8, [%r4 + %r5]
	.word 0xc2312010  ! 798: STH_I	sth	%r1, [%r4 + 0x0010]
	.word 0xc6210005  ! 798: STW_R	stw	%r3, [%r4 + %r5]
	.word 0xc4310005  ! 798: STH_R	sth	%r2, [%r4 + %r5]
	.word 0xc6310005  ! 798: STH_R	sth	%r3, [%r4 + %r5]
	.word 0xda710005  ! 798: STX_R	stx	%r13, [%r4 + %r5]
	.word 0xdd390005  ! 798: STDF_R	std	%f14, [%r5, %r4]
	.word 0xc0710005  ! 798: STX_R	stx	%r0, [%r4 + %r5]
	.word 0xc2310005  ! 805: STH_R	sth	%r1, [%r4 + %r5]
	.word 0xc0212010  ! 805: STW_I	stw	%r0, [%r4 + 0x0010]
	.word 0xc0210005  ! 805: STW_R	stw	%r0, [%r4 + %r5]
	.word 0xf2312010  ! 805: STH_I	sth	%r25, [%r4 + 0x0010]
	.word 0xc0312010  ! 805: STH_I	sth	%r0, [%r4 + 0x0010]
	.word 0xea710005  ! 805: STX_R	stx	%r21, [%r4 + %r5]
	.word 0xe5312010  ! 805: STQF_I	-	%f18, [0x0010, %r4]
	.word 0xc0710005  ! 805: STX_R	stx	%r0, [%r4 + %r5]
	.word 0xc2310005  ! 812: STH_R	sth	%r1, [%r4 + %r5]
	.word 0xc2710005  ! 812: STX_R	stx	%r1, [%r4 + %r5]
	.word 0xf4210005  ! 812: STW_R	stw	%r26, [%r4 + %r5]
	.word 0xe4290005  ! 812: STB_R	stb	%r18, [%r4 + %r5]
	.word 0xc2212010  ! 812: STW_I	stw	%r1, [%r4 + 0x0010]
	.word 0xc6710005  ! 812: STX_R	stx	%r3, [%r4 + %r5]
	.word 0xc7f12005  ! 812: CASXA_R	casxa	[%r4]%asi, %r5, %r3
	.word 0xc0310005  ! 812: STH_R	sth	%r0, [%r4 + %r5]
	.word 0xc4310005  ! 819: STH_R	sth	%r2, [%r4 + %r5]
	.word 0xdc210005  ! 819: STW_R	stw	%r14, [%r4 + %r5]
	.word 0xf2290005  ! 819: STB_R	stb	%r25, [%r4 + %r5]
	.word 0xe6210005  ! 819: STW_R	stw	%r19, [%r4 + %r5]
	.word 0xc2712010  ! 819: STX_I	stx	%r1, [%r4 + 0x0010]
	.word 0xfe292010  ! 819: STB_I	stb	%r31, [%r4 + 0x0010]
	.word 0xc3f12005  ! 819: CASXA_R	casxa	[%r4]%asi, %r5, %r1
	.word 0xc6310005  ! 819: STH_R	sth	%r3, [%r4 + %r5]
	.word 0xda310005  ! 826: STH_R	sth	%r13, [%r4 + %r5]
	.word 0xc2312010  ! 826: STH_I	sth	%r1, [%r4 + 0x0010]
	.word 0xc0290005  ! 826: STB_R	stb	%r0, [%r4 + %r5]
	.word 0xf2290005  ! 826: STB_R	stb	%r25, [%r4 + %r5]
	.word 0xc4312010  ! 826: STH_I	sth	%r2, [%r4 + 0x0010]
	.word 0xc4310005  ! 826: STH_R	sth	%r2, [%r4 + %r5]
	.word 0xc3e12005  ! 826: CASA_R	casa	[%r4] %asi, %r5, %r1
	.word 0xc6212010  ! 826: STW_I	stw	%r3, [%r4 + 0x0010]
	.word 0xc6310005  ! 833: STH_R	sth	%r3, [%r4 + %r5]
	.word 0xc4310005  ! 833: STH_R	sth	%r2, [%r4 + %r5]
	.word 0xdc710005  ! 833: STX_R	stx	%r14, [%r4 + %r5]
	.word 0xc2312010  ! 833: STH_I	sth	%r1, [%r4 + 0x0010]
	.word 0xc6292010  ! 833: STB_I	stb	%r3, [%r4 + 0x0010]
	.word 0xf8310005  ! 833: STH_R	sth	%r28, [%r4 + %r5]
	.word 0xc5212010  ! 833: STF_I	st	%f2, [0x0010, %r4]
	.word 0xc4712010  ! 833: STX_I	stx	%r2, [%r4 + 0x0010]
	.word 0xc0310005  ! 841: STH_R	sth	%r0, [%r4 + %r5]
	.word 0xc4292010  ! 841: STB_I	stb	%r2, [%r4 + 0x0010]
	.word 0xc2712010  ! 841: STX_I	stx	%r1, [%r4 + 0x0010]
	.word 0xc4712010  ! 841: STX_I	stx	%r2, [%r4 + 0x0010]
	.word 0xc0212010  ! 841: STW_I	stw	%r0, [%r4 + 0x0010]
	.word 0xcc310005  ! 841: STH_R	sth	%r6, [%r4 + %r5]
	.word 0xc0210005  ! 841: STW_R	stw	%r0, [%r4 + %r5]
	.word 0xc0212010  ! 841: STW_I	stw	%r0, [%r4 + 0x0010]
	.word 0xde212010  ! 841: STW_I	stw	%r15, [%r4 + 0x0010]
	.word 0xc4310005  ! 849: STH_R	sth	%r2, [%r4 + %r5]
	.word 0xc4290005  ! 849: STB_R	stb	%r2, [%r4 + %r5]
	.word 0xc6292010  ! 849: STB_I	stb	%r3, [%r4 + 0x0010]
	.word 0xc6712010  ! 849: STX_I	stx	%r3, [%r4 + 0x0010]
	.word 0xf6290005  ! 849: STB_R	stb	%r27, [%r4 + %r5]
	.word 0xc4212010  ! 849: STW_I	stw	%r2, [%r4 + 0x0010]
	.word 0xc6712010  ! 849: STX_I	stx	%r3, [%r4 + 0x0010]
	.word 0xe6792010  ! 849: SWAP_I	swap	%r19, [%r4 + 0x0010]
	.word 0xc6290005  ! 849: STB_R	stb	%r3, [%r4 + %r5]
	.word 0xc0310005  ! 856: STH_R	sth	%r0, [%r4 + %r5]
	.word 0xfc212010  ! 856: STW_I	stw	%r30, [%r4 + 0x0010]
	.word 0xf0212010  ! 856: STW_I	stw	%r24, [%r4 + 0x0010]
	.word 0xc0312010  ! 856: STH_I	sth	%r0, [%r4 + 0x0010]
	.word 0xc6212010  ! 856: STW_I	stw	%r3, [%r4 + 0x0010]
	.word 0xc2210005  ! 856: STW_R	stw	%r1, [%r4 + %r5]
	.word 0xc1f12005  ! 856: CASXA_R	casxa	[%r4]%asi, %r5, %r0
	.word 0xc6210005  ! 856: STW_R	stw	%r3, [%r4 + %r5]
	.word 0xc6310005  ! 864: STH_R	sth	%r3, [%r4 + %r5]
	.word 0xc0710005  ! 864: STX_R	stx	%r0, [%r4 + %r5]
	.word 0xc2292010  ! 864: STB_I	stb	%r1, [%r4 + 0x0010]
	.word 0xc4210005  ! 864: STW_R	stw	%r2, [%r4 + %r5]
	.word 0xc6210005  ! 864: STW_R	stw	%r3, [%r4 + %r5]
	.word 0xc6310005  ! 864: STH_R	sth	%r3, [%r4 + %r5]
	.word 0xc0212010  ! 864: STW_I	stw	%r0, [%r4 + 0x0010]
	.word 0xdf210005  ! 864: STF_R	st	%f15, [%r5, %r4]
	.word 0xd4210005  ! 864: STW_R	stw	%r10, [%r4 + %r5]
	.word 0xc2310005  ! 871: STH_R	sth	%r1, [%r4 + %r5]
	.word 0xc0312010  ! 871: STH_I	sth	%r0, [%r4 + 0x0010]
	.word 0xc0292010  ! 871: STB_I	stb	%r0, [%r4 + 0x0010]
	.word 0xc6292010  ! 871: STB_I	stb	%r3, [%r4 + 0x0010]
	.word 0xc4210005  ! 871: STW_R	stw	%r2, [%r4 + %r5]
	.word 0xea712010  ! 871: STX_I	stx	%r21, [%r4 + 0x0010]
	.word 0xff392010  ! 871: STDF_I	std	%f31, [0x0010, %r4]
	.word 0xc0312010  ! 871: STH_I	sth	%r0, [%r4 + 0x0010]
	.word 0xc6310005  ! 879: STH_R	sth	%r3, [%r4 + %r5]
	.word 0xc2290005  ! 879: STB_R	stb	%r1, [%r4 + %r5]
	.word 0xc4290005  ! 879: STB_R	stb	%r2, [%r4 + %r5]
	.word 0xc0290005  ! 879: STB_R	stb	%r0, [%r4 + %r5]
	.word 0xc0210005  ! 879: STW_R	stw	%r0, [%r4 + %r5]
	.word 0xc2310005  ! 879: STH_R	sth	%r1, [%r4 + %r5]
	.word 0xc0312010  ! 879: STH_I	sth	%r0, [%r4 + 0x0010]
	.word 0xd1f11005  ! 879: CASXA_I	casxa	[%r4] 0x80, %r5, %r8
	.word 0xc4712010  ! 879: STX_I	stx	%r2, [%r4 + 0x0010]
	.word 0xc2310005  ! 887: STH_R	sth	%r1, [%r4 + %r5]
	.word 0xc2210005  ! 887: STW_R	stw	%r1, [%r4 + %r5]
	.word 0xc4210005  ! 887: STW_R	stw	%r2, [%r4 + %r5]
	.word 0xc2212010  ! 887: STW_I	stw	%r1, [%r4 + 0x0010]
	.word 0xc0212010  ! 887: STW_I	stw	%r0, [%r4 + 0x0010]
	.word 0xe8710005  ! 887: STX_R	stx	%r20, [%r4 + %r5]
	.word 0xc6212010  ! 887: STW_I	stw	%r3, [%r4 + 0x0010]
	.word 0xd1392010  ! 887: STDF_I	std	%f8, [0x0010, %r4]
	.word 0xc6310005  ! 887: STH_R	sth	%r3, [%r4 + %r5]
	.word 0xc6310005  ! 894: STH_R	sth	%r3, [%r4 + %r5]
	.word 0xc2312010  ! 894: STH_I	sth	%r1, [%r4 + 0x0010]
	.word 0xc4212010  ! 894: STW_I	stw	%r2, [%r4 + 0x0010]
	.word 0xd2212010  ! 894: STW_I	stw	%r9, [%r4 + 0x0010]
	.word 0xc0210005  ! 894: STW_R	stw	%r0, [%r4 + %r5]
	.word 0xc4210005  ! 894: STW_R	stw	%r2, [%r4 + %r5]
	.word 0xc4e92010  ! 894: LDSTUBA_I	ldstuba	%r2, [%r4 + 0x0010] %asi
	.word 0xe0212010  ! 894: STW_I	stw	%r16, [%r4 + 0x0010]
	.word 0xc2310005  ! 902: STH_R	sth	%r1, [%r4 + %r5]
	.word 0xee310005  ! 902: STH_R	sth	%r23, [%r4 + %r5]
	.word 0xec210005  ! 902: STW_R	stw	%r22, [%r4 + %r5]
	.word 0xc0210005  ! 902: STW_R	stw	%r0, [%r4 + %r5]
	.word 0xec712010  ! 902: STX_I	stx	%r22, [%r4 + 0x0010]
	.word 0xfa292010  ! 902: STB_I	stb	%r29, [%r4 + 0x0010]
	.word 0xc4210005  ! 902: STW_R	stw	%r2, [%r4 + %r5]
	.word 0xc6790005  ! 902: SWAP_R	swap	%r3, [%r4 + %r5]
	.word 0xe4292010  ! 902: STB_I	stb	%r18, [%r4 + 0x0010]
	.word 0xd8310005  ! 910: STH_R	sth	%r12, [%r4 + %r5]
	.word 0xe6210005  ! 910: STW_R	stw	%r19, [%r4 + %r5]
	.word 0xc2710005  ! 910: STX_R	stx	%r1, [%r4 + %r5]
	.word 0xe2290005  ! 910: STB_R	stb	%r17, [%r4 + %r5]
	.word 0xd4210005  ! 910: STW_R	stw	%r10, [%r4 + %r5]
	.word 0xda712010  ! 910: STX_I	stx	%r13, [%r4 + 0x0010]
	.word 0xe2712010  ! 910: STX_I	stx	%r17, [%r4 + 0x0010]
	.word 0xf4212010  ! 910: STW_I	stw	%r26, [%r4 + 0x0010]
	.word 0xfcf92010  ! 910: SWAPA_I	swapa	%r30, [%r4 + 0x0010] %asi
	.word 0xce310005  ! 917: STH_R	sth	%r7, [%r4 + %r5]
	.word 0xd6712010  ! 917: STX_I	stx	%r11, [%r4 + 0x0010]
	.word 0xc2212010  ! 917: STW_I	stw	%r1, [%r4 + 0x0010]
	.word 0xc0712010  ! 917: STX_I	stx	%r0, [%r4 + 0x0010]
	.word 0xd4712010  ! 917: STX_I	stx	%r10, [%r4 + 0x0010]
	.word 0xc0312010  ! 917: STH_I	sth	%r0, [%r4 + 0x0010]
	.word 0xc7212010  ! 917: STF_I	st	%f3, [0x0010, %r4]
	.word 0xf8290005  ! 917: STB_R	stb	%r28, [%r4 + %r5]
	.word 0xc6310005  ! 924: STH_R	sth	%r3, [%r4 + %r5]
	.word 0xc6312010  ! 924: STH_I	sth	%r3, [%r4 + 0x0010]
	.word 0xc6210005  ! 924: STW_R	stw	%r3, [%r4 + %r5]
	.word 0xc2210005  ! 924: STW_R	stw	%r1, [%r4 + %r5]
	.word 0xd4310005  ! 924: STH_R	sth	%r10, [%r4 + %r5]
	.word 0xc0310005  ! 924: STH_R	sth	%r0, [%r4 + %r5]
	.word 0xc1390005  ! 924: STDF_R	std	%f0, [%r5, %r4]
	.word 0xc6312010  ! 924: STH_I	sth	%r3, [%r4 + 0x0010]
	.word 0xdc310005  ! 931: STH_R	sth	%r14, [%r4 + %r5]
	.word 0xee290005  ! 931: STB_R	stb	%r23, [%r4 + %r5]
	.word 0xfa712010  ! 931: STX_I	stx	%r29, [%r4 + 0x0010]
	.word 0xec310005  ! 931: STH_R	sth	%r22, [%r4 + %r5]
	.word 0xc6712010  ! 931: STX_I	stx	%r3, [%r4 + 0x0010]
	.word 0xc4212010  ! 931: STW_I	stw	%r2, [%r4 + 0x0010]
	.word 0xc5392010  ! 931: STDF_I	std	%f2, [0x0010, %r4]
	.word 0xc4310005  ! 931: STH_R	sth	%r2, [%r4 + %r5]
	.word 0xde310005  ! 938: STH_R	sth	%r15, [%r4 + %r5]
	.word 0xc4310005  ! 938: STH_R	sth	%r2, [%r4 + %r5]
	.word 0xc4292010  ! 938: STB_I	stb	%r2, [%r4 + 0x0010]
	.word 0xda210005  ! 938: STW_R	stw	%r13, [%r4 + %r5]
	.word 0xc4712010  ! 938: STX_I	stx	%r2, [%r4 + 0x0010]
	.word 0xc6210005  ! 938: STW_R	stw	%r3, [%r4 + %r5]
	.word 0xc7390005  ! 938: STDF_R	std	%f3, [%r5, %r4]
	.word 0xc4312010  ! 938: STH_I	sth	%r2, [%r4 + 0x0010]
	.word 0xe0310005  ! 946: STH_R	sth	%r16, [%r4 + %r5]
	.word 0xc0712010  ! 946: STX_I	stx	%r0, [%r4 + 0x0010]
	.word 0xc2712010  ! 946: STX_I	stx	%r1, [%r4 + 0x0010]
	.word 0xc4210005  ! 946: STW_R	stw	%r2, [%r4 + %r5]
	.word 0xc0312010  ! 946: STH_I	sth	%r0, [%r4 + 0x0010]
	.word 0xc2712010  ! 946: STX_I	stx	%r1, [%r4 + 0x0010]
	.word 0xc0212010  ! 946: STW_I	stw	%r0, [%r4 + 0x0010]
	.word 0xc7210005  ! 946: STF_R	st	%f3, [%r5, %r4]
	.word 0xde292010  ! 946: STB_I	stb	%r15, [%r4 + 0x0010]
	.word 0xc2310005  ! 953: STH_R	sth	%r1, [%r4 + %r5]
	.word 0xe8292010  ! 953: STB_I	stb	%r20, [%r4 + 0x0010]
	.word 0xc6210005  ! 953: STW_R	stw	%r3, [%r4 + %r5]
	.word 0xf0210005  ! 953: STW_R	stw	%r24, [%r4 + %r5]
	.word 0xfc292010  ! 953: STB_I	stb	%r30, [%r4 + 0x0010]
	.word 0xf4310005  ! 953: STH_R	sth	%r26, [%r4 + %r5]
	.word 0xe5212010  ! 953: STF_I	st	%f18, [0x0010, %r4]
	.word 0xd0312010  ! 953: STH_I	sth	%r8, [%r4 + 0x0010]
	.word 0xd2310005  ! 960: STH_R	sth	%r9, [%r4 + %r5]
	.word 0xd4710005  ! 960: STX_R	stx	%r10, [%r4 + %r5]
	.word 0xe6290005  ! 960: STB_R	stb	%r19, [%r4 + %r5]
	.word 0xc0212010  ! 960: STW_I	stw	%r0, [%r4 + 0x0010]
	.word 0xc0310005  ! 960: STH_R	sth	%r0, [%r4 + %r5]
	.word 0xc2210005  ! 960: STW_R	stw	%r1, [%r4 + %r5]
	.word 0xd8e92010  ! 960: LDSTUBA_I	ldstuba	%r12, [%r4 + 0x0010] %asi
	.word 0xf8210005  ! 960: STW_R	stw	%r28, [%r4 + %r5]
	.word 0xc6310005  ! 967: STH_R	sth	%r3, [%r4 + %r5]
	.word 0xc0312010  ! 967: STH_I	sth	%r0, [%r4 + 0x0010]
	.word 0xdc310005  ! 967: STH_R	sth	%r14, [%r4 + %r5]
	.word 0xc0312010  ! 967: STH_I	sth	%r0, [%r4 + 0x0010]
	.word 0xc2312010  ! 967: STH_I	sth	%r1, [%r4 + 0x0010]
	.word 0xfa292010  ! 967: STB_I	stb	%r29, [%r4 + 0x0010]
	.word 0xcf312010  ! 967: STQF_I	-	%f7, [0x0010, %r4]
	.word 0xc6710005  ! 967: STX_R	stx	%r3, [%r4 + %r5]
	.word 0xc4310005  ! 975: STH_R	sth	%r2, [%r4 + %r5]
	.word 0xec292010  ! 975: STB_I	stb	%r22, [%r4 + 0x0010]
	.word 0xc2292010  ! 975: STB_I	stb	%r1, [%r4 + 0x0010]
	.word 0xc4712010  ! 975: STX_I	stx	%r2, [%r4 + 0x0010]
	.word 0xc4710005  ! 975: STX_R	stx	%r2, [%r4 + %r5]
	.word 0xc6312010  ! 975: STH_I	sth	%r3, [%r4 + 0x0010]
	.word 0xc2310005  ! 975: STH_R	sth	%r1, [%r4 + %r5]
	.word 0xf1e12005  ! 975: CASA_R	casa	[%r4] %asi, %r5, %r24
	.word 0xe2310005  ! 975: STH_R	sth	%r17, [%r4 + %r5]
	.word 0xc6310005  ! 983: STH_R	sth	%r3, [%r4 + %r5]
	.word 0xc0290005  ! 983: STB_R	stb	%r0, [%r4 + %r5]
	.word 0xec212010  ! 983: STW_I	stw	%r22, [%r4 + 0x0010]
	.word 0xc4710005  ! 983: STX_R	stx	%r2, [%r4 + %r5]
	.word 0xc0292010  ! 983: STB_I	stb	%r0, [%r4 + 0x0010]
	.word 0xfc292010  ! 983: STB_I	stb	%r30, [%r4 + 0x0010]
	.word 0xc6712010  ! 983: STX_I	stx	%r3, [%r4 + 0x0010]
	.word 0xc2312010  ! 983: STH_I	sth	%r1, [%r4 + 0x0010]
	.word 0xdbf12005  ! 983: CASXA_R	casxa	[%r4]%asi, %r5, %r13
	.word 0xc0310005  ! 990: STH_R	sth	%r0, [%r4 + %r5]
	.word 0xd4710005  ! 990: STX_R	stx	%r10, [%r4 + %r5]
	.word 0xc4290005  ! 990: STB_R	stb	%r2, [%r4 + %r5]
	.word 0xc0212010  ! 990: STW_I	stw	%r0, [%r4 + 0x0010]
	.word 0xc0292010  ! 990: STB_I	stb	%r0, [%r4 + 0x0010]
	.word 0xc0712010  ! 990: STX_I	stx	%r0, [%r4 + 0x0010]
	.word 0xc2790005  ! 990: SWAP_R	swap	%r1, [%r4 + %r5]
	.word 0xe8292010  ! 990: STB_I	stb	%r20, [%r4 + 0x0010]
	.word 0xc4310005  ! 997: STH_R	sth	%r2, [%r4 + %r5]
	.word 0xf6292010  ! 997: STB_I	stb	%r27, [%r4 + 0x0010]
	.word 0xe8292010  ! 997: STB_I	stb	%r20, [%r4 + 0x0010]
	.word 0xd0210005  ! 997: STW_R	stw	%r8, [%r4 + %r5]
	.word 0xc0212010  ! 997: STW_I	stw	%r0, [%r4 + 0x0010]
	.word 0xc2310005  ! 997: STH_R	sth	%r1, [%r4 + %r5]
	.word 0xc3392010  ! 997: STDF_I	std	%f1, [0x0010, %r4]
	.word 0xc0312010  ! 997: STH_I	sth	%r0, [%r4 + 0x0010]
        ta      T_GOOD_TRAP

th_main_1:
        ta      T_GOOD_TRAP

th_main_2:
        ta      T_GOOD_TRAP

th_main_3:
        ta      T_GOOD_TRAP


.data
	.data
	.word	0x44ed49d7,0x73e1a4e0,0x3ffe960c,0x13a74b60
	.word	0x7e96230b,0x27c73cbc,0x1687eb4c,0x29eec9b4
	.word	0x2eab02cd,0x7d56abed,0x7eb1edca,0x27cae7bf
	.word	0x617b1251,0x7e2be79e,0x2402c875,0x239c9c25
	.word	0x54c1d81e,0x148ae582,0x72faf8c6,0x111f5605
	.word	0x2f0b6dc7,0x39f92835,0x7ad495c8,0x40bdd74d
	.word	0x52cc44f0,0x495884f0,0x47032bd2,0x1b5a5867
	.word	0x72e5d986,0x7a4503b0,0x7da18534,0x5f3e8e26
	.word	0x678ee4f4,0x37d3235d,0x6e26a891,0x3da01b40
	.word	0x2c797b9d,0x662507ff,0x5f9a6019,0x04ae93dd
	.word	0x01e8ea09,0x5b247e6a,0x637bb3ec,0x5e4c4de4
	.word	0x189dd267,0x6363fc5a,0x59506608,0x077e7c61
	.word	0x0d09361c,0x6d5faa85,0x77eee1dc,0x4c4b5ecf
	.word	0x0e1dd00b,0x3c14a3e3,0x2758d2ba,0x72c377a4
	.word	0x4d9a8cb3,0x60ea14fb,0x056d28d3,0x6e5bfe8c
	.word	0x40aec948,0x40806639,0x5b2f18ac,0x030eae08
	.word	0x4e04551a,0x283dae3d,0x78538997,0x4955c13d
	.word	0x363a3794,0x7a7dd0b7,0x0e62b63c,0x57ede9b0
	.word	0x795ce68a,0x3823219e,0x55a24f22,0x71de6a29
	.word	0x7b3e13f9,0x11fab8f1,0x1b871df8,0x2ef2b52a
	.word	0x06397779,0x08474a15,0x7f5a6376,0x1375ffd5
	.word	0x150f34bd,0x14574785,0x445bedf9,0x26b33630
	.word	0x4cd7c4d4,0x62a9c170,0x75415c80,0x49c916cc
	.word	0x19c63669,0x0d868e1d,0x232a27a9,0x5070752c
	.word	0x736b9af1,0x67ca8b84,0x35c43c5a,0x1b7db140
	.word	0x36055cbf,0x29a5d285,0x62485c3b,0x4426f296
	.word	0x66dd6088,0x2f62434a,0x61c8f423,0x37eaab5d
	.word	0x10c611f1,0x621b7481,0x415cfc3b,0x7d50121c
	.word	0x676a95e2,0x16ff896a,0x6a62be97,0x40b75fb2
	.word	0x7887c35c,0x7c79ca9f,0x2b56d0ef,0x2ebeac90
	.word	0x7108a29c,0x455f8831,0x5f238c0f,0x20982d70
	.word	0x1dcb64f9,0x0aced906,0x52e6164e,0x024db3b9
	.word	0x4cd1453e,0x1136ffea,0x7299648a,0x08aa52a8
	.word	0x0ccc6c23,0x02d6a1fe,0x3adcd270,0x54e1c0c5
	.word	0x19f5d8af,0x73a9ccab,0x3238e548,0x1ca5c693
	.word	0x344d4135,0x2abbeaa0,0x55c5412c,0x7395e183
	.word	0x6ee6ac53,0x1bb7d718,0x41bb740b,0x4027ffc3
	.word	0x0daa726a,0x676e6fb0,0x1831a1b7,0x6d1244fa
	.word	0x79a2e180,0x7eb31507,0x2ccdf7e1,0x77552dc7
	.word	0x085e60d7,0x176e4679,0x0981ee0d,0x7fb40e2f
	.word	0x50fd135c,0x552fa615,0x28a54664,0x7c1b5297
	.word	0x0027df67,0x5dc97f7f,0x58064813,0x638218d4
	.word	0x7dd50edf,0x1a1db817,0x51734c2a,0x0a3f2d5b
	.word	0x67608d1a,0x32225014,0x44d9a2b7,0x27388d57
	.word	0x73a75bbd,0x5647396e,0x4dda272c,0x069516c2
	.word	0x5d60f6ab,0x0151ce27,0x3db5a91e,0x660bc8e4
	.word	0x6a37af2e,0x5703d82b,0x0004e32e,0x6a83a0ff
	.word	0x05a223d2,0x72961005,0x6e721ea4,0x0986d13b
	.word	0x7a997ddc,0x569f372f,0x47c5b61a,0x17176508
	.word	0x2a0b2b89,0x7ac15d44,0x3468b6ae,0x1fcbfe2e
	.word	0x2d149030,0x27e03a68,0x14df155b,0x05dc02d9
	.word	0x604dced5,0x14751d4a,0x5a028a7d,0x59b8b812
	.word	0x0de87a8d,0x53f52a92,0x6abc56b8,0x27dcb1a9
	.word	0x12f5a0d5,0x6b497138,0x5546f8b9,0x2871ffd6
	.word	0x5ed2ad23,0x7d2d5003,0x424d4963,0x554bdbe8
	.word	0x47d6cd10,0x6474d0f6,0x6fc36008,0x30bf6808
	.word	0x57551451,0x42704aed,0x3b140825,0x37891623
	.word	0x7558c1ac,0x01603fda,0x3d31a831,0x6f7cbed3
	.word	0x2bc9759e,0x226d51dc,0x29407a43,0x5210bd8c
	.word	0x2b1fb669,0x0c174473,0x36e26f27,0x034304c0
	.word	0x4a10c5b6,0x390830f7,0x600c6f05,0x219ec5df
	.word	0x0a9f43a7,0x5d06668b,0x2451a22f,0x355367bf
	.word	0x175e539b,0x6971f0ca,0x5a33b68f,0x669eeb93
	.word	0x01802cba,0x5f3520ab,0x4de6c1c0,0x49f71697
	.word	0x787788b9,0x58d5410b,0x21a56b98,0x08fac9e5
	.word	0x30e7d155,0x6dd04a65,0x5a3580e6,0x5ed713c9
	.word	0x06b8ffe9,0x5cb146f4,0x103d9c42,0x0375fb29
	.word	0x68bed148,0x31d8b652,0x68c88b67,0x47200b69
	.word	0x7e28622c,0x32cf96fe,0x6ae0e749,0x48d4fa6d
	.word	0x75d1750c,0x08c7a5d3,0x0fd5fd8a,0x0f328979
	.word	0x3400cab0,0x0d2fc8a7,0x7239969d,0x6a09b419
	.word	0x491b2243,0x3580f76b,0x6c64e952,0x4020585e
	.word	0x6ce168b4,0x4192aafc,0x0e563876,0x0e0a54eb
	.word	0x6c01b485,0x1dc93a0a,0x2f62f562,0x688bb95c
	.word	0x06c09d0d,0x72bab46e,0x7a7a80fe,0x3fa091a4
	.word	0x2c1806d2,0x6f7f6e55,0x24936ac1,0x63430c65
	.word	0x1ea6db83,0x2a4068fe,0x224f0554,0x0f74520a
	.word	0x1c2eb6f7,0x1478508f,0x33080ed1,0x322502de
	.word	0x6561fdcd,0x502f81a7,0x21a81936,0x2541a56f
	.word	0x1c175774,0x2e7d2010,0x05b07912,0x0e0d0289
	.word	0x7c926ae5,0x08f8c028,0x700fcb0d,0x1406b189
	.word	0x5f135213,0x68941f6b,0x26c1fa32,0x1f72c06f
	.word	0x047f8796,0x65d3ef20,0x5b4ed3d9,0x213c7b30
	.word	0x0f5690a5,0x30978e68,0x55535d75,0x7fe23e9a
	.word	0x29c765a7,0x2dfd6c28,0x5ad7f767,0x77a262c9
	.word	0x3321aba7,0x45f61c9e,0x4275bcb8,0x0de00638
	.word	0x722ad877,0x1883a974,0x16259e46,0x641dd5ee
	.word	0x2fdcc8e1,0x0e422feb,0x4700c985,0x1bd61758
	.word	0x56835501,0x2c6f33c7,0x173af014,0x37109492
	.word	0x5f396577,0x3596a714,0x15035332,0x3dfcea46
	.word	0x703465a6,0x63b8ed0d,0x1b6a9634,0x7052270b
	.word	0x68605673,0x7f8af64b,0x14507b75,0x70bdf3a9
	.word	0x7d087915,0x1227bc1a,0x2d886273,0x6f2872dc
	.word	0x541bf51a,0x302a24bc,0x581dd8b9,0x6ffe1f2b
	.word	0x0a198e57,0x4646cd91,0x48adce31,0x6e4376ff
	.word	0x46bf2c48,0x39f65739,0x5488fd7d,0x0fae97b6
	.word	0x29c0d7d7,0x1d428149,0x66658b00,0x6bc3ed91
	.word	0x6bbb053d,0x08fa3d4e,0x52d9285d,0x7b68de32
	.word	0x5f01b23a,0x5bef6ae3,0x6cb32a5b,0x6e43be91
	.word	0x702c18ad,0x476208ad,0x5b7a612e,0x0103a5d1
	.word	0x7900e2cd,0x6d3491c2,0x5989c4c8,0x0902c3a2
	.word	0x1feb1480,0x4d1cd7e7,0x1d5eb67f,0x31a79d81
	.word	0x75bb1c66,0x2a04a2d7,0x1363a579,0x660c84b0
	.word	0x53b09087,0x3c7a48ae,0x63fafa10,0x67eca2f6
	.word	0x45c96342,0x7d71685e,0x59bcc9f7,0x4a608510
	.word	0x1ad9b0e5,0x31846880,0x066ba5ad,0x2c95f254
	.word	0x742275d9,0x79db631f,0x0d73d363,0x731ed008
	.word	0x71f0f834,0x644e8e87,0x413d6bcd,0x68ee3492
	.word	0x4c6ece16,0x6af1db01,0x51832049,0x1ac73095
	.word	0x54ee5b78,0x6c59e296,0x380eb2e9,0x6ee1d6c8
	.word	0x335efb58,0x4aa977de,0x165e856d,0x4b725862
	.word	0x44ba048e,0x070f8bdf,0x0723c08c,0x7a597f7e
	.word	0x0d767cd7,0x0a8367d1,0x0480f43d,0x60e08a83
	.word	0x7e0b69f3,0x28502dbc,0x3c07d051,0x0aec99ea
	.word	0x3269d846,0x722ddfcc,0x222b90dc,0x497ba3b4
	.word	0x7e302d3e,0x245ad07a,0x567c6e53,0x6368fca9
	.word	0x16e16565,0x4a9efb54,0x0f4cab7c,0x27ff8e9d
	.word	0x12cdb6c7,0x6bcfc0de,0x36f8ddea,0x475b5e65
	.word	0x47b0e2d5,0x462cb21f,0x367938bc,0x4d576357
	.word	0x1e7d83cc,0x0c6ae764,0x4d3c3dfe,0x3d9cf949
	.word	0x5ca9cc26,0x2bf400a4,0x16ee4f35,0x51bd323b
	.word	0x1c71c33a,0x5ab53619,0x54442e60,0x52f61f86
	.word	0x59d8bbe5,0x4edb9b81,0x4ce315e5,0x766fbf3c
	.word	0x4b5f12d6,0x5808e923,0x73366bfb,0x235f8439
	.word	0x49de75dc,0x6240783b,0x22a7e477,0x02831777
	.word	0x26f825b9,0x5cac2ca3,0x4e103919,0x59a0c261
	.word	0x42266b1f,0x6ea9088e,0x22d8dec2,0x048971d6
	.word	0x41d24efc,0x60a3eeeb,0x7b13eff2,0x70151cc0
	.word	0x64f85ead,0x1e7c1b22,0x0c97ef8f,0x12023f27
	.word	0x574bdd2c,0x016a21e8,0x7931513b,0x60dc1df0
	.word	0x6973eb59,0x31249912,0x5045bd69,0x46146720
	.word	0x45ff40dc,0x34d2fe2f,0x092d8235,0x437c2964
	.word	0x0576290e,0x0fddb6b8,0x1713766b,0x2bd566ad
	.word	0x69ad215a,0x2c6e4ec7,0x6c89e35c,0x6523af84
	.word	0x7f77dedf,0x2bd38c79,0x1b175756,0x0f62c21e
	.word	0x282d8670,0x414a2ddb,0x0c777b65,0x162b4748
	.word	0x79eb88e4,0x0d25e51d,0x5fc648fd,0x190f6af4
	.word	0x1f0c0158,0x51376611,0x0e900705,0x58f79a38
	.word	0x2251edd3,0x087fecb2,0x025bff23,0x5ed5c46e
	.word	0x375ee805,0x68512eaf,0x3d52eae1,0x0b898158
	.word	0x398a10d1,0x3cd51114,0x782ee567,0x5466614c
	.word	0x741b8ae2,0x2337322b,0x69435fdb,0x64b8c8c3
	.word	0x1a85fe7a,0x739369c1,0x4f0abea5,0x045ab731
	.word	0x7491a4fe,0x42b384ea,0x34dd979c,0x5b823a0a
	.word	0x6d9b7ad1,0x6e7d2de3,0x4fd96a07,0x14a3e099
	.word	0x3d3f357b,0x0ca77c29,0x3fb493f4,0x5e69710d
	.word	0x4d9a146f,0x5f91234e,0x152768db,0x42109317

.end


