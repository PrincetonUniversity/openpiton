// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: bug3576.s
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
   random seed:	195861816
   Jal stb_intr.j:	
********************************************************************************/

#ifndef OVERRIDE_THREAD_COUNT
# define THREAD_COUNT 4
#endif
#define NO_TRAPCHECK
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
	setx  0x0000000000000770, %r1, %r5
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
        setx  0x80, %g2, %g1
        wr  %g1, %g0, %asi
	setx  0x755db38c0bd15875, %r1, %r1
	setx  0xe3283ceb807d7e7f, %r1, %r2
	setx  0xaffa173d6813a689, %r1, %r3
	setx  0xd9910a24121f3919, %r1, %r6
	setx  0x758c7747db317981, %r1, %r7
	setx  0x67d51cf061004e61, %r1, %r8
	setx  0x3e8ec1ec433c1991, %r1, %r9
	setx  0x675054266dc8a2e2, %r1, %r10
	setx  0x23cec111ff05329e, %r1, %r11
	setx  0xb962ca7bdeb28f42, %r1, %r12
	setx  0x3b464db073aa18e2, %r1, %r13
	setx  0xd00fc12194ad7eaa, %r1, %r14
	setx  0xcd129d0d97ea350a, %r1, %r15
	setx  0xb13e2e5d009dfcdd, %r1, %r16
	setx  0xfce9b3d08c6577fb, %r1, %r17
	setx  0x680c61d701cd871d, %r1, %r18
	setx  0x39bc25494db32197, %r1, %r19
	setx  0xee8e46b77cae612c, %r1, %r20
	setx  0x706ece2a8d1754b7, %r1, %r21
	setx  0xc1360650b12f15c4, %r1, %r22
	setx  0x47a3f5c7d38c1ee6, %r1, %r23
	setx  0x987e84187ed924ad, %r1, %r24
	setx  0x83a14cf6de499369, %r1, %r25
	setx  0xb2b35ee369d727ce, %r1, %r26
	setx  0xe81b999399d6a4f9, %r1, %r27
	setx  0x63e50205d5c34291, %r1, %r28
	setx  0x58ee817c9d5c8e7b, %r1, %r29
	setx  0x1a7cb7e6181c0aed, %r1, %r30
	setx  0x31e1268426196dc3, %r1, %r31
! Store6_atm_st
	.word 0xc2710005  ! 10: STX_R	stx	%r1, [%r4 + %r5]
	.word 0xc431231c  ! 10: STH_I	sth	%r2, [%r4 + 0x031c]
	.word 0xc421258c  ! 10: STW_I	stw	%r2, [%r4 + 0x058c]
	.word 0xc6210005  ! 10: STW_R	stw	%r3, [%r4 + %r5]
	.word 0xc4310005  ! 10: STH_R	sth	%r2, [%r4 + %r5]
	.word 0xc6290005  ! 10: STB_R	stb	%r3, [%r4 + %r5]
	.word 0xfbe11005  ! 10: CASA_I	casa	[%r4] 0x80, %r5, %r29
	.word 0xc2712418  ! 10: STX_I	stx	%r1, [%r4 + 0x0418]
! Store8_atm
	.word 0xc4710005  ! 19: STX_R	stx	%r2, [%r4 + %r5]
	.word 0xf6710005  ! 19: STX_R	stx	%r27, [%r4 + %r5]
	.word 0xc0710005  ! 19: STX_R	stx	%r0, [%r4 + %r5]
	.word 0xc0712db0  ! 19: STX_I	stx	%r0, [%r4 + 0x0db0]
	.word 0xc6310005  ! 19: STH_R	sth	%r3, [%r4 + %r5]
	.word 0xc4212cb0  ! 19: STW_I	stw	%r2, [%r4 + 0x0cb0]
	.word 0xc0290005  ! 19: STB_R	stb	%r0, [%r4 + %r5]
	.word 0xc4210005  ! 19: STW_R	stw	%r2, [%r4 + %r5]
	.word 0xde790005  ! 19: SWAP_R	swap	%r15, [%r4 + %r5]
! Store6_fpst_st
	.word 0xc2710005  ! 27: STX_R	stx	%r1, [%r4 + %r5]
	.word 0xc6312ea6  ! 27: STH_I	sth	%r3, [%r4 + 0x0ea6]
	.word 0xc4312b88  ! 27: STH_I	sth	%r2, [%r4 + 0x0b88]
	.word 0xd6710005  ! 27: STX_R	stx	%r11, [%r4 + %r5]
	.word 0xc0212550  ! 27: STW_I	stw	%r0, [%r4 + 0x0550]
	.word 0xee312c50  ! 27: STH_I	sth	%r23, [%r4 + 0x0c50]
	.word 0xc7210005  ! 27: STF_R	st	%f3, [%r5, %r4]
	.word 0xc2312274  ! 27: STH_I	sth	%r1, [%r4 + 0x0274]
! Store6_atm_st
	.word 0xc6710005  ! 35: STX_R	stx	%r3, [%r4 + %r5]
	.word 0xc4290005  ! 35: STB_R	stb	%r2, [%r4 + %r5]
	.word 0xda710005  ! 35: STX_R	stx	%r13, [%r4 + %r5]
	.word 0xc231212e  ! 35: STH_I	sth	%r1, [%r4 + 0x012e]
	.word 0xf6210005  ! 35: STW_R	stw	%r27, [%r4 + %r5]
	.word 0xc6210005  ! 35: STW_R	stw	%r3, [%r4 + %r5]
	.word 0xe0e92add  ! 35: LDSTUBA_I	ldstuba	%r16, [%r4 + 0x0add] %asi
	.word 0xc0312254  ! 35: STH_I	sth	%r0, [%r4 + 0x0254]
	.word 0xd8312974  ! 44: STH_I	sth	%r12, [%r4 + 0x0974]
IDLE_INTR_0:
!$EV trig_pc_d(0,expr(@VA(.MAIN.IDLE_INTR_0), 16, 16)) -> intp(2, 2, 1)
!$EV trig_pc_d(0,expr(@VA(.MAIN.IDLE_INTR_0)+16, 16, 16)) -> intp(2, 3, 1)
! Store8
	.word 0xd0710005  ! 44: STX_R	stx	%r8, [%r4 + %r5]
	.word 0xc6712c98  ! 44: STX_I	stx	%r3, [%r4 + 0x0c98]
	.word 0xf6212958  ! 44: STW_I	stw	%r27, [%r4 + 0x0958]
	.word 0xf0290005  ! 44: STB_R	stb	%r24, [%r4 + %r5]
	.word 0xc42922f0  ! 44: STB_I	stb	%r2, [%r4 + 0x02f0]
	.word 0xc2292fb8  ! 44: STB_I	stb	%r1, [%r4 + 0x0fb8]
	.word 0xc6310005  ! 44: STH_R	sth	%r3, [%r4 + %r5]
	.word 0xc4290005  ! 44: STB_R	stb	%r2, [%r4 + %r5]
	.word 0xc6292064  ! 53: STB_I	stb	%r3, [%r4 + 0x0064]
IDLE_INTR_1:
!$EV trig_pc_d(0,expr(@VA(.MAIN.IDLE_INTR_1), 16, 16)) -> intp(1, 2, 1)
!$EV trig_pc_d(0,expr(@VA(.MAIN.IDLE_INTR_1)+16, 16, 16)) -> intp(1, 3, 1)
! Store8
	.word 0xc6710005  ! 53: STX_R	stx	%r3, [%r4 + %r5]
	.word 0xf229257e  ! 53: STB_I	stb	%r25, [%r4 + 0x057e]
	.word 0xe0210005  ! 53: STW_R	stw	%r16, [%r4 + %r5]
	.word 0xc6292938  ! 53: STB_I	stb	%r3, [%r4 + 0x0938]
	.word 0xc6710005  ! 53: STX_R	stx	%r3, [%r4 + %r5]
	.word 0xc0710005  ! 53: STX_R	stx	%r0, [%r4 + %r5]
	.word 0xd8712aa0  ! 53: STX_I	stx	%r12, [%r4 + 0x0aa0]
	.word 0xc4212740  ! 53: STW_I	stw	%r2, [%r4 + 0x0740]
! Store9
	.word 0xf2710005  ! 62: STX_R	stx	%r25, [%r4 + %r5]
	.word 0xea310005  ! 62: STH_R	sth	%r21, [%r4 + %r5]
	.word 0xc27120c0  ! 62: STX_I	stx	%r1, [%r4 + 0x00c0]
	.word 0xf2712940  ! 62: STX_I	stx	%r25, [%r4 + 0x0940]
	.word 0xc4290005  ! 62: STB_R	stb	%r2, [%r4 + %r5]
	.word 0xc0312bb6  ! 62: STH_I	sth	%r0, [%r4 + 0x0bb6]
	.word 0xcc312298  ! 62: STH_I	sth	%r6, [%r4 + 0x0298]
	.word 0xce292c12  ! 62: STB_I	stb	%r7, [%r4 + 0x0c12]
	.word 0xc2210005  ! 62: STW_R	stw	%r1, [%r4 + %r5]
! Store8_fpst
	.word 0xd4710005  ! 71: STX_R	stx	%r10, [%r4 + %r5]
	.word 0xc2310005  ! 71: STH_R	sth	%r1, [%r4 + %r5]
	.word 0xf4292406  ! 71: STB_I	stb	%r26, [%r4 + 0x0406]
	.word 0xc429245c  ! 71: STB_I	stb	%r2, [%r4 + 0x045c]
	.word 0xea290005  ! 71: STB_R	stb	%r21, [%r4 + %r5]
	.word 0xc231200a  ! 71: STH_I	sth	%r1, [%r4 + 0x000a]
	.word 0xc4710005  ! 71: STX_R	stx	%r2, [%r4 + %r5]
	.word 0xe4712148  ! 71: STX_I	stx	%r18, [%r4 + 0x0148]
	.word 0xc52129ec  ! 71: STF_I	st	%f2, [0x09ec, %r4]
! Store6_atm_st
	.word 0xee710005  ! 79: STX_R	stx	%r23, [%r4 + %r5]
	.word 0xf67129b0  ! 79: STX_I	stx	%r27, [%r4 + 0x09b0]
	.word 0xd8210005  ! 79: STW_R	stw	%r12, [%r4 + %r5]
	.word 0xc231203c  ! 79: STH_I	sth	%r1, [%r4 + 0x003c]
	.word 0xc07129a8  ! 79: STX_I	stx	%r0, [%r4 + 0x09a8]
	.word 0xc0310005  ! 79: STH_R	sth	%r0, [%r4 + %r5]
	.word 0xc5f12005  ! 79: CASXA_R	casxa	[%r4]%asi, %r5, %r2
	.word 0xde212514  ! 79: STW_I	stw	%r15, [%r4 + 0x0514]
	.word 0xe6312484  ! 88: STH_I	sth	%r19, [%r4 + 0x0484]
IDLE_INTR_2:
!$EV trig_pc_d(0,expr(@VA(.MAIN.IDLE_INTR_2), 16, 16)) -> intp(2, 2, 1)
!$EV trig_pc_d(0,expr(@VA(.MAIN.IDLE_INTR_2)+16, 16, 16)) -> intp(2, 3, 1)
! Store8
	.word 0xee710005  ! 88: STX_R	stx	%r23, [%r4 + %r5]
	.word 0xd2310005  ! 88: STH_R	sth	%r9, [%r4 + %r5]
	.word 0xf0710005  ! 88: STX_R	stx	%r24, [%r4 + %r5]
	.word 0xe4310005  ! 88: STH_R	sth	%r18, [%r4 + %r5]
	.word 0xc4290005  ! 88: STB_R	stb	%r2, [%r4 + %r5]
	.word 0xc2290005  ! 88: STB_R	stb	%r1, [%r4 + %r5]
	.word 0xce310005  ! 88: STH_R	sth	%r7, [%r4 + %r5]
	.word 0xc2310005  ! 88: STH_R	sth	%r1, [%r4 + %r5]
! Store8_atm
	.word 0xec710005  ! 97: STX_R	stx	%r22, [%r4 + %r5]
	.word 0xfc312fb8  ! 97: STH_I	sth	%r30, [%r4 + 0x0fb8]
	.word 0xea31254a  ! 97: STH_I	sth	%r21, [%r4 + 0x054a]
	.word 0xc029275f  ! 97: STB_I	stb	%r0, [%r4 + 0x075f]
	.word 0xf2292a9a  ! 97: STB_I	stb	%r25, [%r4 + 0x0a9a]
	.word 0xc03123e4  ! 97: STH_I	sth	%r0, [%r4 + 0x03e4]
	.word 0xc4212dd8  ! 97: STW_I	stw	%r2, [%r4 + 0x0dd8]
	.word 0xc2212170  ! 97: STW_I	stw	%r1, [%r4 + 0x0170]
	.word 0xc3e12005  ! 97: CASA_R	casa	[%r4] %asi, %r5, %r1
! Store8_atm
	.word 0xc4710005  ! 106: STX_R	stx	%r2, [%r4 + %r5]
	.word 0xf03127e4  ! 106: STH_I	sth	%r24, [%r4 + 0x07e4]
	.word 0xc6712088  ! 106: STX_I	stx	%r3, [%r4 + 0x0088]
	.word 0xfa312684  ! 106: STH_I	sth	%r29, [%r4 + 0x0684]
	.word 0xd4312ed4  ! 106: STH_I	sth	%r10, [%r4 + 0x0ed4]
	.word 0xd6710005  ! 106: STX_R	stx	%r11, [%r4 + %r5]
	.word 0xf0312912  ! 106: STH_I	sth	%r24, [%r4 + 0x0912]
	.word 0xc0290005  ! 106: STB_R	stb	%r0, [%r4 + %r5]
	.word 0xc4792cb8  ! 106: SWAP_I	swap	%r2, [%r4 + 0x0cb8]
! Store6_fpst_st
	.word 0xc2710005  ! 114: STX_R	stx	%r1, [%r4 + %r5]
	.word 0xc0290005  ! 114: STB_R	stb	%r0, [%r4 + %r5]
	.word 0xd8292a65  ! 114: STB_I	stb	%r12, [%r4 + 0x0a65]
	.word 0xc4312f72  ! 114: STH_I	sth	%r2, [%r4 + 0x0f72]
	.word 0xc0292c45  ! 114: STB_I	stb	%r0, [%r4 + 0x0c45]
	.word 0xdc312568  ! 114: STH_I	sth	%r14, [%r4 + 0x0568]
	.word 0xc1210005  ! 114: STF_R	st	%f0, [%r5, %r4]
	.word 0xe2710005  ! 114: STX_R	stx	%r17, [%r4 + %r5]
! Store6_atm_st
	.word 0xc6710005  ! 122: STX_R	stx	%r3, [%r4 + %r5]
	.word 0xc6290005  ! 122: STB_R	stb	%r3, [%r4 + %r5]
	.word 0xc6290005  ! 122: STB_R	stb	%r3, [%r4 + %r5]
	.word 0xc4712b78  ! 122: STX_I	stx	%r2, [%r4 + 0x0b78]
	.word 0xc4290005  ! 122: STB_R	stb	%r2, [%r4 + %r5]
	.word 0xd4290005  ! 122: STB_R	stb	%r10, [%r4 + %r5]
	.word 0xefe11005  ! 122: CASA_I	casa	[%r4] 0x80, %r5, %r23
	.word 0xc07128c0  ! 122: STX_I	stx	%r0, [%r4 + 0x08c0]
! Store8_fpst
	.word 0xc6710005  ! 131: STX_R	stx	%r3, [%r4 + %r5]
	.word 0xc27129b0  ! 131: STX_I	stx	%r1, [%r4 + 0x09b0]
	.word 0xc0712800  ! 131: STX_I	stx	%r0, [%r4 + 0x0800]
	.word 0xc2292f44  ! 131: STB_I	stb	%r1, [%r4 + 0x0f44]
	.word 0xc4310005  ! 131: STH_R	sth	%r2, [%r4 + %r5]
	.word 0xc2310005  ! 131: STH_R	sth	%r1, [%r4 + %r5]
	.word 0xc6290005  ! 131: STB_R	stb	%r3, [%r4 + %r5]
	.word 0xdc292041  ! 131: STB_I	stb	%r14, [%r4 + 0x0041]
	.word 0xc5212eb0  ! 131: STF_I	st	%f2, [0x0eb0, %r4]
! Store8_fpst
	.word 0xc2710005  ! 140: STX_R	stx	%r1, [%r4 + %r5]
	.word 0xc2310005  ! 140: STH_R	sth	%r1, [%r4 + %r5]
	.word 0xc6212cec  ! 140: STW_I	stw	%r3, [%r4 + 0x0cec]
	.word 0xe0712010  ! 140: STX_I	stx	%r16, [%r4 + 0x0010]
	.word 0xda210005  ! 140: STW_R	stw	%r13, [%r4 + %r5]
	.word 0xf8290005  ! 140: STB_R	stb	%r28, [%r4 + %r5]
	.word 0xc4290005  ! 140: STB_R	stb	%r2, [%r4 + %r5]
	.word 0xe4290005  ! 140: STB_R	stb	%r18, [%r4 + %r5]
	.word 0xcd392c98  ! 140: STDF_I	std	%f6, [0x0c98, %r4]
! Store6_atm_st
	.word 0xc6710005  ! 148: STX_R	stx	%r3, [%r4 + %r5]
	.word 0xf0212698  ! 148: STW_I	stw	%r24, [%r4 + 0x0698]
	.word 0xc0310005  ! 148: STH_R	sth	%r0, [%r4 + %r5]
	.word 0xc4310005  ! 148: STH_R	sth	%r2, [%r4 + %r5]
	.word 0xc0210005  ! 148: STW_R	stw	%r0, [%r4 + %r5]
	.word 0xc4310005  ! 148: STH_R	sth	%r2, [%r4 + %r5]
	.word 0xc6e91005  ! 148: LDSTUBA_R	ldstuba	%r3, [%r4 + %r5] 0x80
	.word 0xc2710005  ! 148: STX_R	stx	%r1, [%r4 + %r5]
! Store9
	.word 0xc2710005  ! 157: STX_R	stx	%r1, [%r4 + %r5]
	.word 0xfa290005  ! 157: STB_R	stb	%r29, [%r4 + %r5]
	.word 0xc4310005  ! 157: STH_R	sth	%r2, [%r4 + %r5]
	.word 0xc2212f90  ! 157: STW_I	stw	%r1, [%r4 + 0x0f90]
	.word 0xfa292ba9  ! 157: STB_I	stb	%r29, [%r4 + 0x0ba9]
	.word 0xde312f7e  ! 157: STH_I	sth	%r15, [%r4 + 0x0f7e]
	.word 0xc6710005  ! 157: STX_R	stx	%r3, [%r4 + %r5]
	.word 0xc2710005  ! 157: STX_R	stx	%r1, [%r4 + %r5]
	.word 0xc6710005  ! 157: STX_R	stx	%r3, [%r4 + %r5]
! Store9
	.word 0xce710005  ! 166: STX_R	stx	%r7, [%r4 + %r5]
	.word 0xc4712108  ! 166: STX_I	stx	%r2, [%r4 + 0x0108]
	.word 0xc2710005  ! 166: STX_R	stx	%r1, [%r4 + %r5]
	.word 0xec312ab4  ! 166: STH_I	sth	%r22, [%r4 + 0x0ab4]
	.word 0xc0312958  ! 166: STH_I	sth	%r0, [%r4 + 0x0958]
	.word 0xc4712570  ! 166: STX_I	stx	%r2, [%r4 + 0x0570]
	.word 0xe0212bdc  ! 166: STW_I	stw	%r16, [%r4 + 0x0bdc]
	.word 0xc4210005  ! 166: STW_R	stw	%r2, [%r4 + %r5]
	.word 0xc431203e  ! 166: STH_I	sth	%r2, [%r4 + 0x003e]
! Store7_atm_st
	.word 0xda710005  ! 175: STX_R	stx	%r13, [%r4 + %r5]
	.word 0xc4210005  ! 175: STW_R	stw	%r2, [%r4 + %r5]
	.word 0xc6310005  ! 175: STH_R	sth	%r3, [%r4 + %r5]
	.word 0xc0712dc8  ! 175: STX_I	stx	%r0, [%r4 + 0x0dc8]
	.word 0xc4710005  ! 175: STX_R	stx	%r2, [%r4 + %r5]
	.word 0xc6312c40  ! 175: STH_I	sth	%r3, [%r4 + 0x0c40]
	.word 0xc0210005  ! 175: STW_R	stw	%r0, [%r4 + %r5]
	.word 0xcfe11005  ! 175: CASA_I	casa	[%r4] 0x80, %r5, %r7
	.word 0xc2212d5c  ! 175: STW_I	stw	%r1, [%r4 + 0x0d5c]
! Store6_fpst_st
	.word 0xc6710005  ! 183: STX_R	stx	%r3, [%r4 + %r5]
	.word 0xc6292631  ! 183: STB_I	stb	%r3, [%r4 + 0x0631]
	.word 0xd4212cc0  ! 183: STW_I	stw	%r10, [%r4 + 0x0cc0]
	.word 0xc2710005  ! 183: STX_R	stx	%r1, [%r4 + %r5]
	.word 0xc6712fb8  ! 183: STX_I	stx	%r3, [%r4 + 0x0fb8]
	.word 0xd4212de4  ! 183: STW_I	stw	%r10, [%r4 + 0x0de4]
	.word 0xc12127ec  ! 183: STF_I	st	%f0, [0x07ec, %r4]
	.word 0xc629218f  ! 183: STB_I	stb	%r3, [%r4 + 0x018f]
! Store6_fpst_st
	.word 0xc4710005  ! 191: STX_R	stx	%r2, [%r4 + %r5]
	.word 0xc4712a00  ! 191: STX_I	stx	%r2, [%r4 + 0x0a00]
	.word 0xc2212fcc  ! 191: STW_I	stw	%r1, [%r4 + 0x0fcc]
	.word 0xfc292d1b  ! 191: STB_I	stb	%r30, [%r4 + 0x0d1b]
	.word 0xfc710005  ! 191: STX_R	stx	%r30, [%r4 + %r5]
	.word 0xd6312294  ! 191: STH_I	sth	%r11, [%r4 + 0x0294]
	.word 0xd7212f1c  ! 191: STF_I	st	%f11, [0x0f1c, %r4]
	.word 0xf2712d48  ! 191: STX_I	stx	%r25, [%r4 + 0x0d48]
! Store6_atm_st
	.word 0xe8710005  ! 199: STX_R	stx	%r20, [%r4 + %r5]
	.word 0xf42128bc  ! 199: STW_I	stw	%r26, [%r4 + 0x08bc]
	.word 0xf4210005  ! 199: STW_R	stw	%r26, [%r4 + %r5]
	.word 0xc0312c28  ! 199: STH_I	sth	%r0, [%r4 + 0x0c28]
	.word 0xc0310005  ! 199: STH_R	sth	%r0, [%r4 + %r5]
	.word 0xda212904  ! 199: STW_I	stw	%r13, [%r4 + 0x0904]
	.word 0xdc792248  ! 199: SWAP_I	swap	%r14, [%r4 + 0x0248]
	.word 0xc2290005  ! 199: STB_R	stb	%r1, [%r4 + %r5]
! Store8_fpst
	.word 0xd6710005  ! 208: STX_R	stx	%r11, [%r4 + %r5]
	.word 0xd0312288  ! 208: STH_I	sth	%r8, [%r4 + 0x0288]
	.word 0xc6212cf8  ! 208: STW_I	stw	%r3, [%r4 + 0x0cf8]
	.word 0xd831252a  ! 208: STH_I	sth	%r12, [%r4 + 0x052a]
	.word 0xfc290005  ! 208: STB_R	stb	%r30, [%r4 + %r5]
	.word 0xd4710005  ! 208: STX_R	stx	%r10, [%r4 + %r5]
	.word 0xc2292ca7  ! 208: STB_I	stb	%r1, [%r4 + 0x0ca7]
	.word 0xc0712428  ! 208: STX_I	stx	%r0, [%r4 + 0x0428]
	.word 0xef210005  ! 208: STF_R	st	%f23, [%r5, %r4]
! Store6_fpst_st
	.word 0xc0710005  ! 216: STX_R	stx	%r0, [%r4 + %r5]
	.word 0xc4210005  ! 216: STW_R	stw	%r2, [%r4 + %r5]
	.word 0xe4710005  ! 216: STX_R	stx	%r18, [%r4 + %r5]
	.word 0xfe312484  ! 216: STH_I	sth	%r31, [%r4 + 0x0484]
	.word 0xc2710005  ! 216: STX_R	stx	%r1, [%r4 + %r5]
	.word 0xdc312a64  ! 216: STH_I	sth	%r14, [%r4 + 0x0a64]
	.word 0xf3392760  ! 216: STDF_I	std	%f25, [0x0760, %r4]
	.word 0xc031273e  ! 216: STH_I	sth	%r0, [%r4 + 0x073e]
! Store6_atm_st
	.word 0xe4710005  ! 224: STX_R	stx	%r18, [%r4 + %r5]
	.word 0xdc31284a  ! 224: STH_I	sth	%r14, [%r4 + 0x084a]
	.word 0xc22123bc  ! 224: STW_I	stw	%r1, [%r4 + 0x03bc]
	.word 0xc2710005  ! 224: STX_R	stx	%r1, [%r4 + %r5]
	.word 0xc02120b0  ! 224: STW_I	stw	%r0, [%r4 + 0x00b0]
	.word 0xc2290005  ! 224: STB_R	stb	%r1, [%r4 + %r5]
	.word 0xc2e91005  ! 224: LDSTUBA_R	ldstuba	%r1, [%r4 + %r5] 0x80
	.word 0xc4292b78  ! 224: STB_I	stb	%r2, [%r4 + 0x0b78]
! Store6_atm_st
	.word 0xc2710005  ! 232: STX_R	stx	%r1, [%r4 + %r5]
	.word 0xc0292cc5  ! 232: STB_I	stb	%r0, [%r4 + 0x0cc5]
	.word 0xc62929e6  ! 232: STB_I	stb	%r3, [%r4 + 0x09e6]
	.word 0xdc290005  ! 232: STB_R	stb	%r14, [%r4 + %r5]
	.word 0xc0312b3e  ! 232: STH_I	sth	%r0, [%r4 + 0x0b3e]
	.word 0xc2310005  ! 232: STH_R	sth	%r1, [%r4 + %r5]
	.word 0xc1f12005  ! 232: CASXA_R	casxa	[%r4]%asi, %r5, %r0
	.word 0xc231267a  ! 232: STH_I	sth	%r1, [%r4 + 0x067a]
! Store6_fpst_st
	.word 0xc4710005  ! 240: STX_R	stx	%r2, [%r4 + %r5]
	.word 0xfa712768  ! 240: STX_I	stx	%r29, [%r4 + 0x0768]
	.word 0xe8210005  ! 240: STW_R	stw	%r20, [%r4 + %r5]
	.word 0xc4292083  ! 240: STB_I	stb	%r2, [%r4 + 0x0083]
	.word 0xc6310005  ! 240: STH_R	sth	%r3, [%r4 + %r5]
	.word 0xc4310005  ! 240: STH_R	sth	%r2, [%r4 + %r5]
	.word 0xc7390005  ! 240: STDF_R	std	%f3, [%r5, %r4]
	.word 0xc0292b48  ! 240: STB_I	stb	%r0, [%r4 + 0x0b48]
! Store8_atm
	.word 0xc6710005  ! 249: STX_R	stx	%r3, [%r4 + %r5]
	.word 0xc6310005  ! 249: STH_R	sth	%r3, [%r4 + %r5]
	.word 0xc0310005  ! 249: STH_R	sth	%r0, [%r4 + %r5]
	.word 0xee292af2  ! 249: STB_I	stb	%r23, [%r4 + 0x0af2]
	.word 0xc0290005  ! 249: STB_R	stb	%r0, [%r4 + %r5]
	.word 0xc229221a  ! 249: STB_I	stb	%r1, [%r4 + 0x021a]
	.word 0xf47123b0  ! 249: STX_I	stx	%r26, [%r4 + 0x03b0]
	.word 0xc0212198  ! 249: STW_I	stw	%r0, [%r4 + 0x0198]
	.word 0xc2790005  ! 249: SWAP_R	swap	%r1, [%r4 + %r5]
! Store7_atm_st
	.word 0xc2710005  ! 258: STX_R	stx	%r1, [%r4 + %r5]
	.word 0xc6310005  ! 258: STH_R	sth	%r3, [%r4 + %r5]
	.word 0xc2210005  ! 258: STW_R	stw	%r1, [%r4 + %r5]
	.word 0xee210005  ! 258: STW_R	stw	%r23, [%r4 + %r5]
	.word 0xc6210005  ! 258: STW_R	stw	%r3, [%r4 + %r5]
	.word 0xf0212fd8  ! 258: STW_I	stw	%r24, [%r4 + 0x0fd8]
	.word 0xc0312060  ! 258: STH_I	sth	%r0, [%r4 + 0x0060]
	.word 0xc6f925cc  ! 258: SWAPA_I	swapa	%r3, [%r4 + 0x05cc] %asi
	.word 0xe0210005  ! 258: STW_R	stw	%r16, [%r4 + %r5]
! Store7_atm_st
	.word 0xea710005  ! 267: STX_R	stx	%r21, [%r4 + %r5]
	.word 0xc0210005  ! 267: STW_R	stw	%r0, [%r4 + %r5]
	.word 0xc0212b70  ! 267: STW_I	stw	%r0, [%r4 + 0x0b70]
	.word 0xc0212d8c  ! 267: STW_I	stw	%r0, [%r4 + 0x0d8c]
	.word 0xe6310005  ! 267: STH_R	sth	%r19, [%r4 + %r5]
	.word 0xee310005  ! 267: STH_R	sth	%r23, [%r4 + %r5]
	.word 0xfc212dc4  ! 267: STW_I	stw	%r30, [%r4 + 0x0dc4]
	.word 0xfdf11005  ! 267: CASXA_I	casxa	[%r4] 0x80, %r5, %r30
	.word 0xc6210005  ! 267: STW_R	stw	%r3, [%r4 + %r5]
! Store8_fpst
	.word 0xc0710005  ! 276: STX_R	stx	%r0, [%r4 + %r5]
	.word 0xc62128d4  ! 276: STW_I	stw	%r3, [%r4 + 0x08d4]
	.word 0xc6712030  ! 276: STX_I	stx	%r3, [%r4 + 0x0030]
	.word 0xc4210005  ! 276: STW_R	stw	%r2, [%r4 + %r5]
	.word 0xf07122a8  ! 276: STX_I	stx	%r24, [%r4 + 0x02a8]
	.word 0xc4290005  ! 276: STB_R	stb	%r2, [%r4 + %r5]
	.word 0xc6210005  ! 276: STW_R	stw	%r3, [%r4 + %r5]
	.word 0xf6290005  ! 276: STB_R	stb	%r27, [%r4 + %r5]
	.word 0xc7212798  ! 276: STF_I	st	%f3, [0x0798, %r4]
	.word 0xc07121e8  ! 285: STX_I	stx	%r0, [%r4 + 0x01e8]
IDLE_INTR_3:
!$EV trig_pc_d(0,expr(@VA(.MAIN.IDLE_INTR_3), 16, 16)) -> intp(3, 2, 1)
!$EV trig_pc_d(0,expr(@VA(.MAIN.IDLE_INTR_3)+16, 16, 16)) -> intp(3, 3, 1)
! Store8
	.word 0xc6710005  ! 285: STX_R	stx	%r3, [%r4 + %r5]
	.word 0xc0290005  ! 285: STB_R	stb	%r0, [%r4 + %r5]
	.word 0xce2921dc  ! 285: STB_I	stb	%r7, [%r4 + 0x01dc]
	.word 0xde2124e8  ! 285: STW_I	stw	%r15, [%r4 + 0x04e8]
	.word 0xc0212734  ! 285: STW_I	stw	%r0, [%r4 + 0x0734]
	.word 0xc6290005  ! 285: STB_R	stb	%r3, [%r4 + %r5]
	.word 0xc6710005  ! 285: STX_R	stx	%r3, [%r4 + %r5]
	.word 0xd8212fe4  ! 285: STW_I	stw	%r12, [%r4 + 0x0fe4]
! Store6_atm_st
	.word 0xc0710005  ! 293: STX_R	stx	%r0, [%r4 + %r5]
	.word 0xc429223c  ! 293: STB_I	stb	%r2, [%r4 + 0x023c]
	.word 0xc0290005  ! 293: STB_R	stb	%r0, [%r4 + %r5]
	.word 0xcc290005  ! 293: STB_R	stb	%r6, [%r4 + %r5]
	.word 0xf8210005  ! 293: STW_R	stw	%r28, [%r4 + %r5]
	.word 0xc4212998  ! 293: STW_I	stw	%r2, [%r4 + 0x0998]
	.word 0xc3e11005  ! 293: CASA_I	casa	[%r4] 0x80, %r5, %r1
	.word 0xfe290005  ! 293: STB_R	stb	%r31, [%r4 + %r5]
! Store9
	.word 0xc6710005  ! 302: STX_R	stx	%r3, [%r4 + %r5]
	.word 0xea212b20  ! 302: STW_I	stw	%r21, [%r4 + 0x0b20]
	.word 0xfc710005  ! 302: STX_R	stx	%r30, [%r4 + %r5]
	.word 0xfc710005  ! 302: STX_R	stx	%r30, [%r4 + %r5]
	.word 0xf4712ac8  ! 302: STX_I	stx	%r26, [%r4 + 0x0ac8]
	.word 0xe2712b38  ! 302: STX_I	stx	%r17, [%r4 + 0x0b38]
	.word 0xc0712460  ! 302: STX_I	stx	%r0, [%r4 + 0x0460]
	.word 0xc23121f8  ! 302: STH_I	sth	%r1, [%r4 + 0x01f8]
	.word 0xf8712060  ! 302: STX_I	stx	%r28, [%r4 + 0x0060]
! Store7_atm_st
	.word 0xc4710005  ! 311: STX_R	stx	%r2, [%r4 + %r5]
	.word 0xc4210005  ! 311: STW_R	stw	%r2, [%r4 + %r5]
	.word 0xf2712938  ! 311: STX_I	stx	%r25, [%r4 + 0x0938]
	.word 0xc0712b58  ! 311: STX_I	stx	%r0, [%r4 + 0x0b58]
	.word 0xc4210005  ! 311: STW_R	stw	%r2, [%r4 + %r5]
	.word 0xe8290005  ! 311: STB_R	stb	%r20, [%r4 + %r5]
	.word 0xdc310005  ! 311: STH_R	sth	%r14, [%r4 + %r5]
	.word 0xc2e91005  ! 311: LDSTUBA_R	ldstuba	%r1, [%r4 + %r5] 0x80
	.word 0xc4710005  ! 311: STX_R	stx	%r2, [%r4 + %r5]
! Store7_fpst_st
	.word 0xe2710005  ! 320: STX_R	stx	%r17, [%r4 + %r5]
	.word 0xd83122ae  ! 320: STH_I	sth	%r12, [%r4 + 0x02ae]
	.word 0xc03121dc  ! 320: STH_I	sth	%r0, [%r4 + 0x01dc]
	.word 0xec7126c0  ! 320: STX_I	stx	%r22, [%r4 + 0x06c0]
	.word 0xd4290005  ! 320: STB_R	stb	%r10, [%r4 + %r5]
	.word 0xf8210005  ! 320: STW_R	stw	%r28, [%r4 + %r5]
	.word 0xe4210005  ! 320: STW_R	stw	%r18, [%r4 + %r5]
	.word 0xf7390005  ! 320: STDF_R	std	%f27, [%r5, %r4]
	.word 0xc6712578  ! 320: STX_I	stx	%r3, [%r4 + 0x0578]
! Store6_fpst_st
	.word 0xe8710005  ! 328: STX_R	stx	%r20, [%r4 + %r5]
	.word 0xf0212498  ! 328: STW_I	stw	%r24, [%r4 + 0x0498]
	.word 0xd6310005  ! 328: STH_R	sth	%r11, [%r4 + %r5]
	.word 0xd4310005  ! 328: STH_R	sth	%r10, [%r4 + %r5]
	.word 0xc2210005  ! 328: STW_R	stw	%r1, [%r4 + %r5]
	.word 0xdc710005  ! 328: STX_R	stx	%r14, [%r4 + %r5]
	.word 0xe1390005  ! 328: STDF_R	std	%f16, [%r5, %r4]
	.word 0xd2290005  ! 328: STB_R	stb	%r9, [%r4 + %r5]
! Store6_atm_st
	.word 0xc2710005  ! 336: STX_R	stx	%r1, [%r4 + %r5]
	.word 0xc6712af0  ! 336: STX_I	stx	%r3, [%r4 + 0x0af0]
	.word 0xc2210005  ! 336: STW_R	stw	%r1, [%r4 + %r5]
	.word 0xc4210005  ! 336: STW_R	stw	%r2, [%r4 + %r5]
	.word 0xc4310005  ! 336: STH_R	sth	%r2, [%r4 + %r5]
	.word 0xc431296a  ! 336: STH_I	sth	%r2, [%r4 + 0x096a]
	.word 0xf7f11005  ! 336: CASXA_I	casxa	[%r4] 0x80, %r5, %r27
	.word 0xc0212444  ! 336: STW_I	stw	%r0, [%r4 + 0x0444]
! Store8_atm
	.word 0xc0710005  ! 345: STX_R	stx	%r0, [%r4 + %r5]
	.word 0xc23123c6  ! 345: STH_I	sth	%r1, [%r4 + 0x03c6]
	.word 0xd0710005  ! 345: STX_R	stx	%r8, [%r4 + %r5]
	.word 0xc0292cfd  ! 345: STB_I	stb	%r0, [%r4 + 0x0cfd]
	.word 0xfc292e0f  ! 345: STB_I	stb	%r30, [%r4 + 0x0e0f]
	.word 0xc6210005  ! 345: STW_R	stw	%r3, [%r4 + %r5]
	.word 0xd2710005  ! 345: STX_R	stx	%r9, [%r4 + %r5]
	.word 0xc0312528  ! 345: STH_I	sth	%r0, [%r4 + 0x0528]
	.word 0xc5e12005  ! 345: CASA_R	casa	[%r4] %asi, %r5, %r2
! Store8_fpst
	.word 0xd6710005  ! 354: STX_R	stx	%r11, [%r4 + %r5]
	.word 0xc4712338  ! 354: STX_I	stx	%r2, [%r4 + 0x0338]
	.word 0xf2712810  ! 354: STX_I	stx	%r25, [%r4 + 0x0810]
	.word 0xc0710005  ! 354: STX_R	stx	%r0, [%r4 + %r5]
	.word 0xc2710005  ! 354: STX_R	stx	%r1, [%r4 + %r5]
	.word 0xce310005  ! 354: STH_R	sth	%r7, [%r4 + %r5]
	.word 0xc4210005  ! 354: STW_R	stw	%r2, [%r4 + %r5]
	.word 0xc6710005  ! 354: STX_R	stx	%r3, [%r4 + %r5]
	.word 0xe1392038  ! 354: STDF_I	std	%f16, [0x0038, %r4]
	.word 0xc629236d  ! 363: STB_I	stb	%r3, [%r4 + 0x036d]
IDLE_INTR_4:
!$EV trig_pc_d(0,expr(@VA(.MAIN.IDLE_INTR_4), 16, 16)) -> intp(1, 2, 1)
!$EV trig_pc_d(0,expr(@VA(.MAIN.IDLE_INTR_4)+16, 16, 16)) -> intp(1, 3, 1)
! Store8
	.word 0xc2710005  ! 363: STX_R	stx	%r1, [%r4 + %r5]
	.word 0xc6310005  ! 363: STH_R	sth	%r3, [%r4 + %r5]
	.word 0xc0712f70  ! 363: STX_I	stx	%r0, [%r4 + 0x0f70]
	.word 0xc2212bbc  ! 363: STW_I	stw	%r1, [%r4 + 0x0bbc]
	.word 0xc2292084  ! 363: STB_I	stb	%r1, [%r4 + 0x0084]
	.word 0xc6310005  ! 363: STH_R	sth	%r3, [%r4 + %r5]
	.word 0xde712de8  ! 363: STX_I	stx	%r15, [%r4 + 0x0de8]
	.word 0xf4290005  ! 363: STB_R	stb	%r26, [%r4 + %r5]
	.word 0xc07127f8  ! 372: STX_I	stx	%r0, [%r4 + 0x07f8]
IDLE_INTR_5:
!$EV trig_pc_d(0,expr(@VA(.MAIN.IDLE_INTR_5), 16, 16)) -> intp(3, 2, 1)
!$EV trig_pc_d(0,expr(@VA(.MAIN.IDLE_INTR_5)+16, 16, 16)) -> intp(3, 3, 1)
! Store8
	.word 0xee710005  ! 372: STX_R	stx	%r23, [%r4 + %r5]
	.word 0xc4312b8e  ! 372: STH_I	sth	%r2, [%r4 + 0x0b8e]
	.word 0xc2290005  ! 372: STB_R	stb	%r1, [%r4 + %r5]
	.word 0xe8312bbe  ! 372: STH_I	sth	%r20, [%r4 + 0x0bbe]
	.word 0xc4712528  ! 372: STX_I	stx	%r2, [%r4 + 0x0528]
	.word 0xc6210005  ! 372: STW_R	stw	%r3, [%r4 + %r5]
	.word 0xd4212828  ! 372: STW_I	stw	%r10, [%r4 + 0x0828]
	.word 0xc229254c  ! 372: STB_I	stb	%r1, [%r4 + 0x054c]
! Store8_atm
	.word 0xfa710005  ! 381: STX_R	stx	%r29, [%r4 + %r5]
	.word 0xc6290005  ! 381: STB_R	stb	%r3, [%r4 + %r5]
	.word 0xc0292a30  ! 381: STB_I	stb	%r0, [%r4 + 0x0a30]
	.word 0xc22122b0  ! 381: STW_I	stw	%r1, [%r4 + 0x02b0]
	.word 0xc4210005  ! 381: STW_R	stw	%r2, [%r4 + %r5]
	.word 0xc0290005  ! 381: STB_R	stb	%r0, [%r4 + %r5]
	.word 0xe8210005  ! 381: STW_R	stw	%r20, [%r4 + %r5]
	.word 0xc0210005  ! 381: STW_R	stw	%r0, [%r4 + %r5]
	.word 0xc4e92445  ! 381: LDSTUBA_I	ldstuba	%r2, [%r4 + 0x0445] %asi
! Store6_atm_st
	.word 0xc0710005  ! 389: STX_R	stx	%r0, [%r4 + %r5]
	.word 0xe8290005  ! 389: STB_R	stb	%r20, [%r4 + %r5]
	.word 0xdc2923f7  ! 389: STB_I	stb	%r14, [%r4 + 0x03f7]
	.word 0xea212518  ! 389: STW_I	stw	%r21, [%r4 + 0x0518]
	.word 0xc6310005  ! 389: STH_R	sth	%r3, [%r4 + %r5]
	.word 0xf8210005  ! 389: STW_R	stw	%r28, [%r4 + %r5]
	.word 0xe0f91005  ! 389: SWAPA_R	swapa	%r16, [%r4 + %r5] 0x80
	.word 0xc2310005  ! 389: STH_R	sth	%r1, [%r4 + %r5]
! Store7_atm_st
	.word 0xc4710005  ! 398: STX_R	stx	%r2, [%r4 + %r5]
	.word 0xc2290005  ! 398: STB_R	stb	%r1, [%r4 + %r5]
	.word 0xc0210005  ! 398: STW_R	stw	%r0, [%r4 + %r5]
	.word 0xc4210005  ! 398: STW_R	stw	%r2, [%r4 + %r5]
	.word 0xc0710005  ! 398: STX_R	stx	%r0, [%r4 + %r5]
	.word 0xce292997  ! 398: STB_I	stb	%r7, [%r4 + 0x0997]
	.word 0xc6310005  ! 398: STH_R	sth	%r3, [%r4 + %r5]
	.word 0xc2e92856  ! 398: LDSTUBA_I	ldstuba	%r1, [%r4 + 0x0856] %asi
	.word 0xc0290005  ! 398: STB_R	stb	%r0, [%r4 + %r5]
! Store8_atm
	.word 0xc6710005  ! 407: STX_R	stx	%r3, [%r4 + %r5]
	.word 0xf07125d8  ! 407: STX_I	stx	%r24, [%r4 + 0x05d8]
	.word 0xf4312fd2  ! 407: STH_I	sth	%r26, [%r4 + 0x0fd2]
	.word 0xe2210005  ! 407: STW_R	stw	%r17, [%r4 + %r5]
	.word 0xc4712210  ! 407: STX_I	stx	%r2, [%r4 + 0x0210]
	.word 0xdc212d60  ! 407: STW_I	stw	%r14, [%r4 + 0x0d60]
	.word 0xf0310005  ! 407: STH_R	sth	%r24, [%r4 + %r5]
	.word 0xc2712c68  ! 407: STX_I	stx	%r1, [%r4 + 0x0c68]
	.word 0xc1f11005  ! 407: CASXA_I	casxa	[%r4] 0x80, %r5, %r0
! Store7_atm_st
	.word 0xc0710005  ! 416: STX_R	stx	%r0, [%r4 + %r5]
	.word 0xc0292fbb  ! 416: STB_I	stb	%r0, [%r4 + 0x0fbb]
	.word 0xc2712568  ! 416: STX_I	stx	%r1, [%r4 + 0x0568]
	.word 0xc0210005  ! 416: STW_R	stw	%r0, [%r4 + %r5]
	.word 0xda310005  ! 416: STH_R	sth	%r13, [%r4 + %r5]
	.word 0xc2292e47  ! 416: STB_I	stb	%r1, [%r4 + 0x0e47]
	.word 0xc2290005  ! 416: STB_R	stb	%r1, [%r4 + %r5]
	.word 0xe0e92288  ! 416: LDSTUBA_I	ldstuba	%r16, [%r4 + 0x0288] %asi
	.word 0xc0212d80  ! 416: STW_I	stw	%r0, [%r4 + 0x0d80]
! Store6_atm_st
	.word 0xc6710005  ! 424: STX_R	stx	%r3, [%r4 + %r5]
	.word 0xc0290005  ! 424: STB_R	stb	%r0, [%r4 + %r5]
	.word 0xfe210005  ! 424: STW_R	stw	%r31, [%r4 + %r5]
	.word 0xc4710005  ! 424: STX_R	stx	%r2, [%r4 + %r5]
	.word 0xe8210005  ! 424: STW_R	stw	%r20, [%r4 + %r5]
	.word 0xc6212b70  ! 424: STW_I	stw	%r3, [%r4 + 0x0b70]
	.word 0xc4f9273c  ! 424: SWAPA_I	swapa	%r2, [%r4 + 0x073c] %asi
	.word 0xc4290005  ! 424: STB_R	stb	%r2, [%r4 + %r5]
! Store8_fpst
	.word 0xe0710005  ! 433: STX_R	stx	%r16, [%r4 + %r5]
	.word 0xc6290005  ! 433: STB_R	stb	%r3, [%r4 + %r5]
	.word 0xc4212144  ! 433: STW_I	stw	%r2, [%r4 + 0x0144]
	.word 0xc2710005  ! 433: STX_R	stx	%r1, [%r4 + %r5]
	.word 0xc2212958  ! 433: STW_I	stw	%r1, [%r4 + 0x0958]
	.word 0xf0290005  ! 433: STB_R	stb	%r24, [%r4 + %r5]
	.word 0xc62924e4  ! 433: STB_I	stb	%r3, [%r4 + 0x04e4]
	.word 0xc02921e6  ! 433: STB_I	stb	%r0, [%r4 + 0x01e6]
	.word 0xc1392df0  ! 433: STDF_I	std	%f0, [0x0df0, %r4]
! Store7_atm_st
	.word 0xc6710005  ! 442: STX_R	stx	%r3, [%r4 + %r5]
	.word 0xf4710005  ! 442: STX_R	stx	%r26, [%r4 + %r5]
	.word 0xc47123d0  ! 442: STX_I	stx	%r2, [%r4 + 0x03d0]
	.word 0xf4712510  ! 442: STX_I	stx	%r26, [%r4 + 0x0510]
	.word 0xc4290005  ! 442: STB_R	stb	%r2, [%r4 + %r5]
	.word 0xc4210005  ! 442: STW_R	stw	%r2, [%r4 + %r5]
	.word 0xc4710005  ! 442: STX_R	stx	%r2, [%r4 + %r5]
	.word 0xc4f91005  ! 442: SWAPA_R	swapa	%r2, [%r4 + %r5] 0x80
	.word 0xc2210005  ! 442: STW_R	stw	%r1, [%r4 + %r5]
! Store6_fpst_st
	.word 0xc4710005  ! 450: STX_R	stx	%r2, [%r4 + %r5]
	.word 0xc629239f  ! 450: STB_I	stb	%r3, [%r4 + 0x039f]
	.word 0xc62921c9  ! 450: STB_I	stb	%r3, [%r4 + 0x01c9]
	.word 0xc0290005  ! 450: STB_R	stb	%r0, [%r4 + %r5]
	.word 0xc6292d9f  ! 450: STB_I	stb	%r3, [%r4 + 0x0d9f]
	.word 0xc6712720  ! 450: STX_I	stx	%r3, [%r4 + 0x0720]
	.word 0xc52124c4  ! 450: STF_I	st	%f2, [0x04c4, %r4]
	.word 0xf831224e  ! 450: STH_I	sth	%r28, [%r4 + 0x024e]
! Store9
	.word 0xea710005  ! 459: STX_R	stx	%r21, [%r4 + %r5]
	.word 0xc0290005  ! 459: STB_R	stb	%r0, [%r4 + %r5]
	.word 0xc0292a58  ! 459: STB_I	stb	%r0, [%r4 + 0x0a58]
	.word 0xc221221c  ! 459: STW_I	stw	%r1, [%r4 + 0x021c]
	.word 0xc2292fcc  ! 459: STB_I	stb	%r1, [%r4 + 0x0fcc]
	.word 0xdc290005  ! 459: STB_R	stb	%r14, [%r4 + %r5]
	.word 0xc0712d78  ! 459: STX_I	stx	%r0, [%r4 + 0x0d78]
	.word 0xc6210005  ! 459: STW_R	stw	%r3, [%r4 + %r5]
	.word 0xc2712398  ! 459: STX_I	stx	%r1, [%r4 + 0x0398]
! Store6_atm_st
	.word 0xc2710005  ! 467: STX_R	stx	%r1, [%r4 + %r5]
	.word 0xc0310005  ! 467: STH_R	sth	%r0, [%r4 + %r5]
	.word 0xf8312b64  ! 467: STH_I	sth	%r28, [%r4 + 0x0b64]
	.word 0xcc710005  ! 467: STX_R	stx	%r6, [%r4 + %r5]
	.word 0xc4292a78  ! 467: STB_I	stb	%r2, [%r4 + 0x0a78]
	.word 0xc4210005  ! 467: STW_R	stw	%r2, [%r4 + %r5]
	.word 0xc3f12005  ! 467: CASXA_R	casxa	[%r4]%asi, %r5, %r1
	.word 0xc4210005  ! 467: STW_R	stw	%r2, [%r4 + %r5]
! Store9
	.word 0xc0710005  ! 476: STX_R	stx	%r0, [%r4 + %r5]
	.word 0xc231205a  ! 476: STH_I	sth	%r1, [%r4 + 0x005a]
	.word 0xe2290005  ! 476: STB_R	stb	%r17, [%r4 + %r5]
	.word 0xc2712670  ! 476: STX_I	stx	%r1, [%r4 + 0x0670]
	.word 0xc4710005  ! 476: STX_R	stx	%r2, [%r4 + %r5]
	.word 0xc0290005  ! 476: STB_R	stb	%r0, [%r4 + %r5]
	.word 0xc0210005  ! 476: STW_R	stw	%r0, [%r4 + %r5]
	.word 0xc4312672  ! 476: STH_I	sth	%r2, [%r4 + 0x0672]
	.word 0xdc290005  ! 476: STB_R	stb	%r14, [%r4 + %r5]
! Store8_fpst
	.word 0xc2710005  ! 485: STX_R	stx	%r1, [%r4 + %r5]
	.word 0xc2710005  ! 485: STX_R	stx	%r1, [%r4 + %r5]
	.word 0xc631202e  ! 485: STH_I	sth	%r3, [%r4 + 0x002e]
	.word 0xc6710005  ! 485: STX_R	stx	%r3, [%r4 + %r5]
	.word 0xc2710005  ! 485: STX_R	stx	%r1, [%r4 + %r5]
	.word 0xc6712958  ! 485: STX_I	stx	%r3, [%r4 + 0x0958]
	.word 0xd0292d97  ! 485: STB_I	stb	%r8, [%r4 + 0x0d97]
	.word 0xfe312ff2  ! 485: STH_I	sth	%r31, [%r4 + 0x0ff2]
	.word 0xd5210005  ! 485: STF_R	st	%f10, [%r5, %r4]
! Store9
	.word 0xee710005  ! 494: STX_R	stx	%r23, [%r4 + %r5]
	.word 0xc6290005  ! 494: STB_R	stb	%r3, [%r4 + %r5]
	.word 0xfa210005  ! 494: STW_R	stw	%r29, [%r4 + %r5]
	.word 0xf0712f68  ! 494: STX_I	stx	%r24, [%r4 + 0x0f68]
	.word 0xc431293e  ! 494: STH_I	sth	%r2, [%r4 + 0x093e]
	.word 0xc4290005  ! 494: STB_R	stb	%r2, [%r4 + %r5]
	.word 0xe4710005  ! 494: STX_R	stx	%r18, [%r4 + %r5]
	.word 0xc43124f8  ! 494: STH_I	sth	%r2, [%r4 + 0x04f8]
	.word 0xdc710005  ! 494: STX_R	stx	%r14, [%r4 + %r5]
        ta      T_GOOD_TRAP

th_main_1:
	setx  MAIN_BASE_DATA_VA, %r1, %r4
	setx  0x0000000000000770, %r1, %r5
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
        setx  0x80, %g2, %g1
        wr  %g1, %g0, %asi
	setx  0x755db38c0bd15875, %r1, %r1
	setx  0xe3283ceb807d7e7f, %r1, %r2
	setx  0xaffa173d6813a689, %r1, %r3
	setx  0xd9910a24121f3919, %r1, %r6
	setx  0x758c7747db317981, %r1, %r7
	setx  0x67d51cf061004e61, %r1, %r8
	setx  0x3e8ec1ec433c1991, %r1, %r9
	setx  0x675054266dc8a2e2, %r1, %r10
	setx  0x23cec111ff05329e, %r1, %r11
	setx  0xb962ca7bdeb28f42, %r1, %r12
	setx  0x3b464db073aa18e2, %r1, %r13
	setx  0xd00fc12194ad7eaa, %r1, %r14
	setx  0xcd129d0d97ea350a, %r1, %r15
	setx  0xb13e2e5d009dfcdd, %r1, %r16
	setx  0xfce9b3d08c6577fb, %r1, %r17
	setx  0x680c61d701cd871d, %r1, %r18
	setx  0x39bc25494db32197, %r1, %r19
	setx  0xee8e46b77cae612c, %r1, %r20
	setx  0x706ece2a8d1754b7, %r1, %r21
	setx  0xc1360650b12f15c4, %r1, %r22
	setx  0x47a3f5c7d38c1ee6, %r1, %r23
	setx  0x987e84187ed924ad, %r1, %r24
	setx  0x83a14cf6de499369, %r1, %r25
	setx  0xb2b35ee369d727ce, %r1, %r26
	setx  0xe81b999399d6a4f9, %r1, %r27
	setx  0x63e50205d5c34291, %r1, %r28
	setx  0x58ee817c9d5c8e7b, %r1, %r29
	setx  0x1a7cb7e6181c0aed, %r1, %r30
	setx  0x31e1268426196dc3, %r1, %r31
! Store6_atm_st
	.word 0xda710005  ! 10: STX_R	stx	%r13, [%r4 + %r5]
	.word 0xc63121aa  ! 10: STH_I	sth	%r3, [%r4 + 0x01aa]
	.word 0xe62127a4  ! 10: STW_I	stw	%r19, [%r4 + 0x07a4]
	.word 0xc0210005  ! 10: STW_R	stw	%r0, [%r4 + %r5]
	.word 0xc2310005  ! 10: STH_R	sth	%r1, [%r4 + %r5]
	.word 0xc4290005  ! 10: STB_R	stb	%r2, [%r4 + %r5]
	.word 0xc3e11005  ! 10: CASA_I	casa	[%r4] 0x80, %r5, %r1
	.word 0xda7123e8  ! 10: STX_I	stx	%r13, [%r4 + 0x03e8]
! Store8_atm
	.word 0xf4710005  ! 19: STX_R	stx	%r26, [%r4 + %r5]
	.word 0xc0710005  ! 19: STX_R	stx	%r0, [%r4 + %r5]
	.word 0xc2710005  ! 19: STX_R	stx	%r1, [%r4 + %r5]
	.word 0xc07129d0  ! 19: STX_I	stx	%r0, [%r4 + 0x09d0]
	.word 0xc0310005  ! 19: STH_R	sth	%r0, [%r4 + %r5]
	.word 0xc021254c  ! 19: STW_I	stw	%r0, [%r4 + 0x054c]
	.word 0xf0290005  ! 19: STB_R	stb	%r24, [%r4 + %r5]
	.word 0xde210005  ! 19: STW_R	stw	%r15, [%r4 + %r5]
	.word 0xc2790005  ! 19: SWAP_R	swap	%r1, [%r4 + %r5]
! Store6_fpst_st
	.word 0xc2710005  ! 27: STX_R	stx	%r1, [%r4 + %r5]
	.word 0xf8312fbc  ! 27: STH_I	sth	%r28, [%r4 + 0x0fbc]
	.word 0xfc312ca0  ! 27: STH_I	sth	%r30, [%r4 + 0x0ca0]
	.word 0xc6710005  ! 27: STX_R	stx	%r3, [%r4 + %r5]
	.word 0xc62124d0  ! 27: STW_I	stw	%r3, [%r4 + 0x04d0]
	.word 0xc6312de0  ! 27: STH_I	sth	%r3, [%r4 + 0x0de0]
	.word 0xed210005  ! 27: STF_R	st	%f22, [%r5, %r4]
	.word 0xc631284c  ! 27: STH_I	sth	%r3, [%r4 + 0x084c]
! Store6_atm_st
	.word 0xc2710005  ! 35: STX_R	stx	%r1, [%r4 + %r5]
	.word 0xc2290005  ! 35: STB_R	stb	%r1, [%r4 + %r5]
	.word 0xc6710005  ! 35: STX_R	stx	%r3, [%r4 + %r5]
	.word 0xfa312ff6  ! 35: STH_I	sth	%r29, [%r4 + 0x0ff6]
	.word 0xcc210005  ! 35: STW_R	stw	%r6, [%r4 + %r5]
	.word 0xc2210005  ! 35: STW_R	stw	%r1, [%r4 + %r5]
	.word 0xeee92b04  ! 35: LDSTUBA_I	ldstuba	%r23, [%r4 + 0x0b04] %asi
	.word 0xc2312b30  ! 35: STH_I	sth	%r1, [%r4 + 0x0b30]
! Store8
	.word 0xc2710005  ! 44: STX_R	stx	%r1, [%r4 + %r5]
	.word 0xf8712f20  ! 44: STX_I	stx	%r28, [%r4 + 0x0f20]
	.word 0xc4212338  ! 44: STW_I	stw	%r2, [%r4 + 0x0338]
	.word 0xc0290005  ! 44: STB_R	stb	%r0, [%r4 + %r5]
	.word 0xc42924d7  ! 44: STB_I	stb	%r2, [%r4 + 0x04d7]
	.word 0xc4292100  ! 44: STB_I	stb	%r2, [%r4 + 0x0100]
	.word 0xf0310005  ! 44: STH_R	sth	%r24, [%r4 + %r5]
	.word 0xc2290005  ! 44: STB_R	stb	%r1, [%r4 + %r5]
! Store8
	.word 0xe4710005  ! 53: STX_R	stx	%r18, [%r4 + %r5]
	.word 0xc6292ab7  ! 53: STB_I	stb	%r3, [%r4 + 0x0ab7]
	.word 0xc6210005  ! 53: STW_R	stw	%r3, [%r4 + %r5]
	.word 0xc4292cbc  ! 53: STB_I	stb	%r2, [%r4 + 0x0cbc]
	.word 0xc4710005  ! 53: STX_R	stx	%r2, [%r4 + %r5]
	.word 0xc6710005  ! 53: STX_R	stx	%r3, [%r4 + %r5]
	.word 0xd2712e78  ! 53: STX_I	stx	%r9, [%r4 + 0x0e78]
	.word 0xc62120f8  ! 53: STW_I	stw	%r3, [%r4 + 0x00f8]
! Store9
	.word 0xc4710005  ! 62: STX_R	stx	%r2, [%r4 + %r5]
	.word 0xc2310005  ! 62: STH_R	sth	%r1, [%r4 + %r5]
	.word 0xc4712580  ! 62: STX_I	stx	%r2, [%r4 + 0x0580]
	.word 0xc0712a78  ! 62: STX_I	stx	%r0, [%r4 + 0x0a78]
	.word 0xc2290005  ! 62: STB_R	stb	%r1, [%r4 + %r5]
	.word 0xe0312af8  ! 62: STH_I	sth	%r16, [%r4 + 0x0af8]
	.word 0xc2312222  ! 62: STH_I	sth	%r1, [%r4 + 0x0222]
	.word 0xf429240a  ! 62: STB_I	stb	%r26, [%r4 + 0x040a]
	.word 0xc4210005  ! 62: STW_R	stw	%r2, [%r4 + %r5]
! Store8_fpst
	.word 0xc4710005  ! 71: STX_R	stx	%r2, [%r4 + %r5]
	.word 0xc6310005  ! 71: STH_R	sth	%r3, [%r4 + %r5]
	.word 0xc6292987  ! 71: STB_I	stb	%r3, [%r4 + 0x0987]
	.word 0xc2292754  ! 71: STB_I	stb	%r1, [%r4 + 0x0754]
	.word 0xc6290005  ! 71: STB_R	stb	%r3, [%r4 + %r5]
	.word 0xc4312b8c  ! 71: STH_I	sth	%r2, [%r4 + 0x0b8c]
	.word 0xc4710005  ! 71: STX_R	stx	%r2, [%r4 + %r5]
	.word 0xc6712a88  ! 71: STX_I	stx	%r3, [%r4 + 0x0a88]
	.word 0xe32125e4  ! 71: STF_I	st	%f17, [0x05e4, %r4]
! Store6_atm_st
	.word 0xc4710005  ! 79: STX_R	stx	%r2, [%r4 + %r5]
	.word 0xc6712030  ! 79: STX_I	stx	%r3, [%r4 + 0x0030]
	.word 0xc2210005  ! 79: STW_R	stw	%r1, [%r4 + %r5]
	.word 0xee312f34  ! 79: STH_I	sth	%r23, [%r4 + 0x0f34]
	.word 0xc4712e58  ! 79: STX_I	stx	%r2, [%r4 + 0x0e58]
	.word 0xc2310005  ! 79: STH_R	sth	%r1, [%r4 + %r5]
	.word 0xf9f12005  ! 79: CASXA_R	casxa	[%r4]%asi, %r5, %r28
	.word 0xf421260c  ! 79: STW_I	stw	%r26, [%r4 + 0x060c]
! Store8
	.word 0xc2710005  ! 88: STX_R	stx	%r1, [%r4 + %r5]
	.word 0xde310005  ! 88: STH_R	sth	%r15, [%r4 + %r5]
	.word 0xc4710005  ! 88: STX_R	stx	%r2, [%r4 + %r5]
	.word 0xc0310005  ! 88: STH_R	sth	%r0, [%r4 + %r5]
	.word 0xc4290005  ! 88: STB_R	stb	%r2, [%r4 + %r5]
	.word 0xc4290005  ! 88: STB_R	stb	%r2, [%r4 + %r5]
	.word 0xc2310005  ! 88: STH_R	sth	%r1, [%r4 + %r5]
	.word 0xc0310005  ! 88: STH_R	sth	%r0, [%r4 + %r5]
! Store8_atm
	.word 0xc6710005  ! 97: STX_R	stx	%r3, [%r4 + %r5]
	.word 0xc2312c26  ! 97: STH_I	sth	%r1, [%r4 + 0x0c26]
	.word 0xea312e60  ! 97: STH_I	sth	%r21, [%r4 + 0x0e60]
	.word 0xc22927f6  ! 97: STB_I	stb	%r1, [%r4 + 0x07f6]
	.word 0xc229200e  ! 97: STB_I	stb	%r1, [%r4 + 0x000e]
	.word 0xc23129d4  ! 97: STH_I	sth	%r1, [%r4 + 0x09d4]
	.word 0xc6212830  ! 97: STW_I	stw	%r3, [%r4 + 0x0830]
	.word 0xc2212080  ! 97: STW_I	stw	%r1, [%r4 + 0x0080]
	.word 0xc3e12005  ! 97: CASA_R	casa	[%r4] %asi, %r5, %r1
! Store8_atm
	.word 0xc0710005  ! 106: STX_R	stx	%r0, [%r4 + %r5]
	.word 0xc6312fc0  ! 106: STH_I	sth	%r3, [%r4 + 0x0fc0]
	.word 0xec712850  ! 106: STX_I	stx	%r22, [%r4 + 0x0850]
	.word 0xc631254a  ! 106: STH_I	sth	%r3, [%r4 + 0x054a]
	.word 0xc43122a6  ! 106: STH_I	sth	%r2, [%r4 + 0x02a6]
	.word 0xc4710005  ! 106: STX_R	stx	%r2, [%r4 + %r5]
	.word 0xe43129e0  ! 106: STH_I	sth	%r18, [%r4 + 0x09e0]
	.word 0xce290005  ! 106: STB_R	stb	%r7, [%r4 + %r5]
	.word 0xd4792cdc  ! 106: SWAP_I	swap	%r10, [%r4 + 0x0cdc]
! Store6_fpst_st
	.word 0xc0710005  ! 114: STX_R	stx	%r0, [%r4 + %r5]
	.word 0xc0290005  ! 114: STB_R	stb	%r0, [%r4 + %r5]
	.word 0xc2292c48  ! 114: STB_I	stb	%r1, [%r4 + 0x0c48]
	.word 0xc23124ae  ! 114: STH_I	sth	%r1, [%r4 + 0x04ae]
	.word 0xc0292c24  ! 114: STB_I	stb	%r0, [%r4 + 0x0c24]
	.word 0xc63125ee  ! 114: STH_I	sth	%r3, [%r4 + 0x05ee]
	.word 0xc5210005  ! 114: STF_R	st	%f2, [%r5, %r4]
	.word 0xc2710005  ! 114: STX_R	stx	%r1, [%r4 + %r5]
! Store6_atm_st
	.word 0xc4710005  ! 122: STX_R	stx	%r2, [%r4 + %r5]
	.word 0xc2290005  ! 122: STB_R	stb	%r1, [%r4 + %r5]
	.word 0xc4290005  ! 122: STB_R	stb	%r2, [%r4 + %r5]
	.word 0xc27122f0  ! 122: STX_I	stx	%r1, [%r4 + 0x02f0]
	.word 0xc6290005  ! 122: STB_R	stb	%r3, [%r4 + %r5]
	.word 0xc2290005  ! 122: STB_R	stb	%r1, [%r4 + %r5]
	.word 0xc1e11005  ! 122: CASA_I	casa	[%r4] 0x80, %r5, %r0
	.word 0xc4712860  ! 122: STX_I	stx	%r2, [%r4 + 0x0860]
! Store8_fpst
	.word 0xdc710005  ! 131: STX_R	stx	%r14, [%r4 + %r5]
	.word 0xc07125f0  ! 131: STX_I	stx	%r0, [%r4 + 0x05f0]
	.word 0xc4712ba0  ! 131: STX_I	stx	%r2, [%r4 + 0x0ba0]
	.word 0xf6292ef0  ! 131: STB_I	stb	%r27, [%r4 + 0x0ef0]
	.word 0xc4310005  ! 131: STH_R	sth	%r2, [%r4 + %r5]
	.word 0xc4310005  ! 131: STH_R	sth	%r2, [%r4 + %r5]
	.word 0xc6290005  ! 131: STB_R	stb	%r3, [%r4 + %r5]
	.word 0xc4292ae3  ! 131: STB_I	stb	%r2, [%r4 + 0x0ae3]
	.word 0xef212220  ! 131: STF_I	st	%f23, [0x0220, %r4]
! Store8_fpst
	.word 0xc4710005  ! 140: STX_R	stx	%r2, [%r4 + %r5]
	.word 0xc4310005  ! 140: STH_R	sth	%r2, [%r4 + %r5]
	.word 0xc4212bec  ! 140: STW_I	stw	%r2, [%r4 + 0x0bec]
	.word 0xc4712b90  ! 140: STX_I	stx	%r2, [%r4 + 0x0b90]
	.word 0xc0210005  ! 140: STW_R	stw	%r0, [%r4 + %r5]
	.word 0xf6290005  ! 140: STB_R	stb	%r27, [%r4 + %r5]
	.word 0xc0290005  ! 140: STB_R	stb	%r0, [%r4 + %r5]
	.word 0xc4290005  ! 140: STB_R	stb	%r2, [%r4 + %r5]
	.word 0xe53921a8  ! 140: STDF_I	std	%f18, [0x01a8, %r4]
! Store6_atm_st
	.word 0xce710005  ! 148: STX_R	stx	%r7, [%r4 + %r5]
	.word 0xc621264c  ! 148: STW_I	stw	%r3, [%r4 + 0x064c]
	.word 0xc2310005  ! 148: STH_R	sth	%r1, [%r4 + %r5]
	.word 0xc4310005  ! 148: STH_R	sth	%r2, [%r4 + %r5]
	.word 0xc2210005  ! 148: STW_R	stw	%r1, [%r4 + %r5]
	.word 0xc6310005  ! 148: STH_R	sth	%r3, [%r4 + %r5]
	.word 0xc6e91005  ! 148: LDSTUBA_R	ldstuba	%r3, [%r4 + %r5] 0x80
	.word 0xc4710005  ! 148: STX_R	stx	%r2, [%r4 + %r5]
! Store9
	.word 0xc4710005  ! 157: STX_R	stx	%r2, [%r4 + %r5]
	.word 0xf8290005  ! 157: STB_R	stb	%r28, [%r4 + %r5]
	.word 0xdc310005  ! 157: STH_R	sth	%r14, [%r4 + %r5]
	.word 0xd4212ae4  ! 157: STW_I	stw	%r10, [%r4 + 0x0ae4]
	.word 0xc6292d4b  ! 157: STB_I	stb	%r3, [%r4 + 0x0d4b]
	.word 0xc6312ab4  ! 157: STH_I	sth	%r3, [%r4 + 0x0ab4]
	.word 0xfc710005  ! 157: STX_R	stx	%r30, [%r4 + %r5]
	.word 0xc6710005  ! 157: STX_R	stx	%r3, [%r4 + %r5]
	.word 0xc6710005  ! 157: STX_R	stx	%r3, [%r4 + %r5]
! Store9
	.word 0xfc710005  ! 166: STX_R	stx	%r30, [%r4 + %r5]
	.word 0xc2712958  ! 166: STX_I	stx	%r1, [%r4 + 0x0958]
	.word 0xde710005  ! 166: STX_R	stx	%r15, [%r4 + %r5]
	.word 0xc43124dc  ! 166: STH_I	sth	%r2, [%r4 + 0x04dc]
	.word 0xc2312fca  ! 166: STH_I	sth	%r1, [%r4 + 0x0fca]
	.word 0xce712128  ! 166: STX_I	stx	%r7, [%r4 + 0x0128]
	.word 0xc6212e64  ! 166: STW_I	stw	%r3, [%r4 + 0x0e64]
	.word 0xc6210005  ! 166: STW_R	stw	%r3, [%r4 + %r5]
	.word 0xc031224a  ! 166: STH_I	sth	%r0, [%r4 + 0x024a]
! Store7_atm_st
	.word 0xc4710005  ! 175: STX_R	stx	%r2, [%r4 + %r5]
	.word 0xea210005  ! 175: STW_R	stw	%r21, [%r4 + %r5]
	.word 0xc4310005  ! 175: STH_R	sth	%r2, [%r4 + %r5]
	.word 0xc47124a8  ! 175: STX_I	stx	%r2, [%r4 + 0x04a8]
	.word 0xe8710005  ! 175: STX_R	stx	%r20, [%r4 + %r5]
	.word 0xc6312a76  ! 175: STH_I	sth	%r3, [%r4 + 0x0a76]
	.word 0xc2210005  ! 175: STW_R	stw	%r1, [%r4 + %r5]
	.word 0xc5e11005  ! 175: CASA_I	casa	[%r4] 0x80, %r5, %r2
	.word 0xf0212b4c  ! 175: STW_I	stw	%r24, [%r4 + 0x0b4c]
! Store6_fpst_st
	.word 0xd2710005  ! 183: STX_R	stx	%r9, [%r4 + %r5]
	.word 0xc0292f3f  ! 183: STB_I	stb	%r0, [%r4 + 0x0f3f]
	.word 0xc221250c  ! 183: STW_I	stw	%r1, [%r4 + 0x050c]
	.word 0xc0710005  ! 183: STX_R	stx	%r0, [%r4 + %r5]
	.word 0xc6712720  ! 183: STX_I	stx	%r3, [%r4 + 0x0720]
	.word 0xf8212590  ! 183: STW_I	stw	%r28, [%r4 + 0x0590]
	.word 0xc12122ac  ! 183: STF_I	st	%f0, [0x02ac, %r4]
	.word 0xc6292c13  ! 183: STB_I	stb	%r3, [%r4 + 0x0c13]
! Store6_fpst_st
	.word 0xc2710005  ! 191: STX_R	stx	%r1, [%r4 + %r5]
	.word 0xc07128d8  ! 191: STX_I	stx	%r0, [%r4 + 0x08d8]
	.word 0xc02120c0  ! 191: STW_I	stw	%r0, [%r4 + 0x00c0]
	.word 0xc6292ac1  ! 191: STB_I	stb	%r3, [%r4 + 0x0ac1]
	.word 0xc6710005  ! 191: STX_R	stx	%r3, [%r4 + %r5]
	.word 0xc2312c44  ! 191: STH_I	sth	%r1, [%r4 + 0x0c44]
	.word 0xf92121a0  ! 191: STF_I	st	%f28, [0x01a0, %r4]
	.word 0xd2712510  ! 191: STX_I	stx	%r9, [%r4 + 0x0510]
! Store6_atm_st
	.word 0xf8710005  ! 199: STX_R	stx	%r28, [%r4 + %r5]
	.word 0xd821245c  ! 199: STW_I	stw	%r12, [%r4 + 0x045c]
	.word 0xc6210005  ! 199: STW_R	stw	%r3, [%r4 + %r5]
	.word 0xc4312c08  ! 199: STH_I	sth	%r2, [%r4 + 0x0c08]
	.word 0xc2310005  ! 199: STH_R	sth	%r1, [%r4 + %r5]
	.word 0xc4212e70  ! 199: STW_I	stw	%r2, [%r4 + 0x0e70]
	.word 0xc4792fd4  ! 199: SWAP_I	swap	%r2, [%r4 + 0x0fd4]
	.word 0xcc290005  ! 199: STB_R	stb	%r6, [%r4 + %r5]
! Store8_fpst
	.word 0xf6710005  ! 208: STX_R	stx	%r27, [%r4 + %r5]
	.word 0xc4312302  ! 208: STH_I	sth	%r2, [%r4 + 0x0302]
	.word 0xc621291c  ! 208: STW_I	stw	%r3, [%r4 + 0x091c]
	.word 0xc2312c4c  ! 208: STH_I	sth	%r1, [%r4 + 0x0c4c]
	.word 0xc2290005  ! 208: STB_R	stb	%r1, [%r4 + %r5]
	.word 0xe8710005  ! 208: STX_R	stx	%r20, [%r4 + %r5]
	.word 0xe429219e  ! 208: STB_I	stb	%r18, [%r4 + 0x019e]
	.word 0xdc712490  ! 208: STX_I	stx	%r14, [%r4 + 0x0490]
	.word 0xf7210005  ! 208: STF_R	st	%f27, [%r5, %r4]
! Store6_fpst_st
	.word 0xf0710005  ! 216: STX_R	stx	%r24, [%r4 + %r5]
	.word 0xfc210005  ! 216: STW_R	stw	%r30, [%r4 + %r5]
	.word 0xc4710005  ! 216: STX_R	stx	%r2, [%r4 + %r5]
	.word 0xce312e34  ! 216: STH_I	sth	%r7, [%r4 + 0x0e34]
	.word 0xc4710005  ! 216: STX_R	stx	%r2, [%r4 + %r5]
	.word 0xc031211a  ! 216: STH_I	sth	%r0, [%r4 + 0x011a]
	.word 0xc3392228  ! 216: STDF_I	std	%f1, [0x0228, %r4]
	.word 0xcc312784  ! 216: STH_I	sth	%r6, [%r4 + 0x0784]
! Store6_atm_st
	.word 0xc4710005  ! 224: STX_R	stx	%r2, [%r4 + %r5]
	.word 0xc631264c  ! 224: STH_I	sth	%r3, [%r4 + 0x064c]
	.word 0xf0212500  ! 224: STW_I	stw	%r24, [%r4 + 0x0500]
	.word 0xc6710005  ! 224: STX_R	stx	%r3, [%r4 + %r5]
	.word 0xc4212ff8  ! 224: STW_I	stw	%r2, [%r4 + 0x0ff8]
	.word 0xc4290005  ! 224: STB_R	stb	%r2, [%r4 + %r5]
	.word 0xc4e91005  ! 224: LDSTUBA_R	ldstuba	%r2, [%r4 + %r5] 0x80
	.word 0xc2292f7d  ! 224: STB_I	stb	%r1, [%r4 + 0x0f7d]
! Store6_atm_st
	.word 0xfa710005  ! 232: STX_R	stx	%r29, [%r4 + %r5]
	.word 0xc62924c8  ! 232: STB_I	stb	%r3, [%r4 + 0x04c8]
	.word 0xd62928ee  ! 232: STB_I	stb	%r11, [%r4 + 0x08ee]
	.word 0xf0290005  ! 232: STB_R	stb	%r24, [%r4 + %r5]
	.word 0xc2312c78  ! 232: STH_I	sth	%r1, [%r4 + 0x0c78]
	.word 0xd8310005  ! 232: STH_R	sth	%r12, [%r4 + %r5]
	.word 0xc5f12005  ! 232: CASXA_R	casxa	[%r4]%asi, %r5, %r2
	.word 0xc6312c8a  ! 232: STH_I	sth	%r3, [%r4 + 0x0c8a]
! Store6_fpst_st
	.word 0xc2710005  ! 240: STX_R	stx	%r1, [%r4 + %r5]
	.word 0xc6712760  ! 240: STX_I	stx	%r3, [%r4 + 0x0760]
	.word 0xc4210005  ! 240: STW_R	stw	%r2, [%r4 + %r5]
	.word 0xc4292c32  ! 240: STB_I	stb	%r2, [%r4 + 0x0c32]
	.word 0xc6310005  ! 240: STH_R	sth	%r3, [%r4 + %r5]
	.word 0xc6310005  ! 240: STH_R	sth	%r3, [%r4 + %r5]
	.word 0xed390005  ! 240: STDF_R	std	%f22, [%r5, %r4]
	.word 0xde29264c  ! 240: STB_I	stb	%r15, [%r4 + 0x064c]
! Store8_atm
	.word 0xc2710005  ! 249: STX_R	stx	%r1, [%r4 + %r5]
	.word 0xc6310005  ! 249: STH_R	sth	%r3, [%r4 + %r5]
	.word 0xc0310005  ! 249: STH_R	sth	%r0, [%r4 + %r5]
	.word 0xc6292ada  ! 249: STB_I	stb	%r3, [%r4 + 0x0ada]
	.word 0xe2290005  ! 249: STB_R	stb	%r17, [%r4 + %r5]
	.word 0xc2292285  ! 249: STB_I	stb	%r1, [%r4 + 0x0285]
	.word 0xe2712be0  ! 249: STX_I	stx	%r17, [%r4 + 0x0be0]
	.word 0xda212c20  ! 249: STW_I	stw	%r13, [%r4 + 0x0c20]
	.word 0xc0790005  ! 249: SWAP_R	swap	%r0, [%r4 + %r5]
! Store7_atm_st
	.word 0xd8710005  ! 258: STX_R	stx	%r12, [%r4 + %r5]
	.word 0xc4310005  ! 258: STH_R	sth	%r2, [%r4 + %r5]
	.word 0xfa210005  ! 258: STW_R	stw	%r29, [%r4 + %r5]
	.word 0xe4210005  ! 258: STW_R	stw	%r18, [%r4 + %r5]
	.word 0xe2210005  ! 258: STW_R	stw	%r17, [%r4 + %r5]
	.word 0xc4212548  ! 258: STW_I	stw	%r2, [%r4 + 0x0548]
	.word 0xc0312780  ! 258: STH_I	sth	%r0, [%r4 + 0x0780]
	.word 0xc6f92060  ! 258: SWAPA_I	swapa	%r3, [%r4 + 0x0060] %asi
	.word 0xc2210005  ! 258: STW_R	stw	%r1, [%r4 + %r5]
! Store7_atm_st
	.word 0xc4710005  ! 267: STX_R	stx	%r2, [%r4 + %r5]
	.word 0xc6210005  ! 267: STW_R	stw	%r3, [%r4 + %r5]
	.word 0xc0212e94  ! 267: STW_I	stw	%r0, [%r4 + 0x0e94]
	.word 0xc0212d94  ! 267: STW_I	stw	%r0, [%r4 + 0x0d94]
	.word 0xc6310005  ! 267: STH_R	sth	%r3, [%r4 + %r5]
	.word 0xc2310005  ! 267: STH_R	sth	%r1, [%r4 + %r5]
	.word 0xc421279c  ! 267: STW_I	stw	%r2, [%r4 + 0x079c]
	.word 0xe9f11005  ! 267: CASXA_I	casxa	[%r4] 0x80, %r5, %r20
	.word 0xc4210005  ! 267: STW_R	stw	%r2, [%r4 + %r5]
! Store8_fpst
	.word 0xc0710005  ! 276: STX_R	stx	%r0, [%r4 + %r5]
	.word 0xc2212da4  ! 276: STW_I	stw	%r1, [%r4 + 0x0da4]
	.word 0xc27128a0  ! 276: STX_I	stx	%r1, [%r4 + 0x08a0]
	.word 0xfc210005  ! 276: STW_R	stw	%r30, [%r4 + %r5]
	.word 0xc6712988  ! 276: STX_I	stx	%r3, [%r4 + 0x0988]
	.word 0xc0290005  ! 276: STB_R	stb	%r0, [%r4 + %r5]
	.word 0xc6210005  ! 276: STW_R	stw	%r3, [%r4 + %r5]
	.word 0xc4290005  ! 276: STB_R	stb	%r2, [%r4 + %r5]
	.word 0xe5212de8  ! 276: STF_I	st	%f18, [0x0de8, %r4]
! Store8
	.word 0xc0710005  ! 285: STX_R	stx	%r0, [%r4 + %r5]
	.word 0xc2290005  ! 285: STB_R	stb	%r1, [%r4 + %r5]
	.word 0xf6292830  ! 285: STB_I	stb	%r27, [%r4 + 0x0830]
	.word 0xc2212888  ! 285: STW_I	stw	%r1, [%r4 + 0x0888]
	.word 0xc6212084  ! 285: STW_I	stw	%r3, [%r4 + 0x0084]
	.word 0xce290005  ! 285: STB_R	stb	%r7, [%r4 + %r5]
	.word 0xc0710005  ! 285: STX_R	stx	%r0, [%r4 + %r5]
	.word 0xc2212b68  ! 285: STW_I	stw	%r1, [%r4 + 0x0b68]
! Store6_atm_st
	.word 0xe6710005  ! 293: STX_R	stx	%r19, [%r4 + %r5]
	.word 0xc029239e  ! 293: STB_I	stb	%r0, [%r4 + 0x039e]
	.word 0xc0290005  ! 293: STB_R	stb	%r0, [%r4 + %r5]
	.word 0xea290005  ! 293: STB_R	stb	%r21, [%r4 + %r5]
	.word 0xe8210005  ! 293: STW_R	stw	%r20, [%r4 + %r5]
	.word 0xf0212240  ! 293: STW_I	stw	%r24, [%r4 + 0x0240]
	.word 0xc1e11005  ! 293: CASA_I	casa	[%r4] 0x80, %r5, %r0
	.word 0xd4290005  ! 293: STB_R	stb	%r10, [%r4 + %r5]
! Store9
	.word 0xc4710005  ! 302: STX_R	stx	%r2, [%r4 + %r5]
	.word 0xc22126b0  ! 302: STW_I	stw	%r1, [%r4 + 0x06b0]
	.word 0xc4710005  ! 302: STX_R	stx	%r2, [%r4 + %r5]
	.word 0xfc710005  ! 302: STX_R	stx	%r30, [%r4 + %r5]
	.word 0xe6712e70  ! 302: STX_I	stx	%r19, [%r4 + 0x0e70]
	.word 0xec712348  ! 302: STX_I	stx	%r22, [%r4 + 0x0348]
	.word 0xc4712120  ! 302: STX_I	stx	%r2, [%r4 + 0x0120]
	.word 0xfe31281a  ! 302: STH_I	sth	%r31, [%r4 + 0x081a]
	.word 0xc4712830  ! 302: STX_I	stx	%r2, [%r4 + 0x0830]
! Store7_atm_st
	.word 0xcc710005  ! 311: STX_R	stx	%r6, [%r4 + %r5]
	.word 0xc0210005  ! 311: STW_R	stw	%r0, [%r4 + %r5]
	.word 0xc6712660  ! 311: STX_I	stx	%r3, [%r4 + 0x0660]
	.word 0xc47121e0  ! 311: STX_I	stx	%r2, [%r4 + 0x01e0]
	.word 0xd8210005  ! 311: STW_R	stw	%r12, [%r4 + %r5]
	.word 0xd8290005  ! 311: STB_R	stb	%r12, [%r4 + %r5]
	.word 0xc0310005  ! 311: STH_R	sth	%r0, [%r4 + %r5]
	.word 0xc2e91005  ! 311: LDSTUBA_R	ldstuba	%r1, [%r4 + %r5] 0x80
	.word 0xc4710005  ! 311: STX_R	stx	%r2, [%r4 + %r5]
! Store7_fpst_st
	.word 0xc6710005  ! 320: STX_R	stx	%r3, [%r4 + %r5]
	.word 0xf2312d2c  ! 320: STH_I	sth	%r25, [%r4 + 0x0d2c]
	.word 0xc631200c  ! 320: STH_I	sth	%r3, [%r4 + 0x000c]
	.word 0xc6712050  ! 320: STX_I	stx	%r3, [%r4 + 0x0050]
	.word 0xc4290005  ! 320: STB_R	stb	%r2, [%r4 + %r5]
	.word 0xc0210005  ! 320: STW_R	stw	%r0, [%r4 + %r5]
	.word 0xcc210005  ! 320: STW_R	stw	%r6, [%r4 + %r5]
	.word 0xc5390005  ! 320: STDF_R	std	%f2, [%r5, %r4]
	.word 0xc67120b0  ! 320: STX_I	stx	%r3, [%r4 + 0x00b0]
! Store6_fpst_st
	.word 0xc6710005  ! 328: STX_R	stx	%r3, [%r4 + %r5]
	.word 0xd4212ae8  ! 328: STW_I	stw	%r10, [%r4 + 0x0ae8]
	.word 0xc6310005  ! 328: STH_R	sth	%r3, [%r4 + %r5]
	.word 0xc0310005  ! 328: STH_R	sth	%r0, [%r4 + %r5]
	.word 0xc0210005  ! 328: STW_R	stw	%r0, [%r4 + %r5]
	.word 0xc4710005  ! 328: STX_R	stx	%r2, [%r4 + %r5]
	.word 0xd3390005  ! 328: STDF_R	std	%f9, [%r5, %r4]
	.word 0xc6290005  ! 328: STB_R	stb	%r3, [%r4 + %r5]
! Store6_atm_st
	.word 0xf2710005  ! 336: STX_R	stx	%r25, [%r4 + %r5]
	.word 0xe87121f0  ! 336: STX_I	stx	%r20, [%r4 + 0x01f0]
	.word 0xe8210005  ! 336: STW_R	stw	%r20, [%r4 + %r5]
	.word 0xc2210005  ! 336: STW_R	stw	%r1, [%r4 + %r5]
	.word 0xc4310005  ! 336: STH_R	sth	%r2, [%r4 + %r5]
	.word 0xc2312f88  ! 336: STH_I	sth	%r1, [%r4 + 0x0f88]
	.word 0xc3f11005  ! 336: CASXA_I	casxa	[%r4] 0x80, %r5, %r1
	.word 0xc421278c  ! 336: STW_I	stw	%r2, [%r4 + 0x078c]
! Store8_atm
	.word 0xd8710005  ! 345: STX_R	stx	%r12, [%r4 + %r5]
	.word 0xfe312aa6  ! 345: STH_I	sth	%r31, [%r4 + 0x0aa6]
	.word 0xc6710005  ! 345: STX_R	stx	%r3, [%r4 + %r5]
	.word 0xee292ae1  ! 345: STB_I	stb	%r23, [%r4 + 0x0ae1]
	.word 0xc429281e  ! 345: STB_I	stb	%r2, [%r4 + 0x081e]
	.word 0xc2210005  ! 345: STW_R	stw	%r1, [%r4 + %r5]
	.word 0xea710005  ! 345: STX_R	stx	%r21, [%r4 + %r5]
	.word 0xc2312d72  ! 345: STH_I	sth	%r1, [%r4 + 0x0d72]
	.word 0xd5e12005  ! 345: CASA_R	casa	[%r4] %asi, %r5, %r10
! Store8_fpst
	.word 0xc0710005  ! 354: STX_R	stx	%r0, [%r4 + %r5]
	.word 0xc2712e20  ! 354: STX_I	stx	%r1, [%r4 + 0x0e20]
	.word 0xc67126b0  ! 354: STX_I	stx	%r3, [%r4 + 0x06b0]
	.word 0xc4710005  ! 354: STX_R	stx	%r2, [%r4 + %r5]
	.word 0xf6710005  ! 354: STX_R	stx	%r27, [%r4 + %r5]
	.word 0xe4310005  ! 354: STH_R	sth	%r18, [%r4 + %r5]
	.word 0xc2210005  ! 354: STW_R	stw	%r1, [%r4 + %r5]
	.word 0xc2710005  ! 354: STX_R	stx	%r1, [%r4 + %r5]
	.word 0xc3392840  ! 354: STDF_I	std	%f1, [0x0840, %r4]
! Store8
	.word 0xc0710005  ! 363: STX_R	stx	%r0, [%r4 + %r5]
	.word 0xc0310005  ! 363: STH_R	sth	%r0, [%r4 + %r5]
	.word 0xc07121f8  ! 363: STX_I	stx	%r0, [%r4 + 0x01f8]
	.word 0xc0212edc  ! 363: STW_I	stw	%r0, [%r4 + 0x0edc]
	.word 0xc0292def  ! 363: STB_I	stb	%r0, [%r4 + 0x0def]
	.word 0xc2310005  ! 363: STH_R	sth	%r1, [%r4 + %r5]
	.word 0xc27126b8  ! 363: STX_I	stx	%r1, [%r4 + 0x06b8]
	.word 0xc0290005  ! 363: STB_R	stb	%r0, [%r4 + %r5]
! Store8
	.word 0xc0710005  ! 372: STX_R	stx	%r0, [%r4 + %r5]
	.word 0xc4312d10  ! 372: STH_I	sth	%r2, [%r4 + 0x0d10]
	.word 0xc4290005  ! 372: STB_R	stb	%r2, [%r4 + %r5]
	.word 0xc63125b0  ! 372: STH_I	sth	%r3, [%r4 + 0x05b0]
	.word 0xf27127f8  ! 372: STX_I	stx	%r25, [%r4 + 0x07f8]
	.word 0xce210005  ! 372: STW_R	stw	%r7, [%r4 + %r5]
	.word 0xc0212dc0  ! 372: STW_I	stw	%r0, [%r4 + 0x0dc0]
	.word 0xf029250b  ! 372: STB_I	stb	%r24, [%r4 + 0x050b]
! Store8_atm
	.word 0xc4710005  ! 381: STX_R	stx	%r2, [%r4 + %r5]
	.word 0xc6290005  ! 381: STB_R	stb	%r3, [%r4 + %r5]
	.word 0xf82924d7  ! 381: STB_I	stb	%r28, [%r4 + 0x04d7]
	.word 0xc6212bb0  ! 381: STW_I	stw	%r3, [%r4 + 0x0bb0]
	.word 0xc0210005  ! 381: STW_R	stw	%r0, [%r4 + %r5]
	.word 0xc2290005  ! 381: STB_R	stb	%r1, [%r4 + %r5]
	.word 0xc0210005  ! 381: STW_R	stw	%r0, [%r4 + %r5]
	.word 0xc4210005  ! 381: STW_R	stw	%r2, [%r4 + %r5]
	.word 0xe0e92730  ! 381: LDSTUBA_I	ldstuba	%r16, [%r4 + 0x0730] %asi
! Store6_atm_st
	.word 0xc4710005  ! 389: STX_R	stx	%r2, [%r4 + %r5]
	.word 0xea290005  ! 389: STB_R	stb	%r21, [%r4 + %r5]
	.word 0xc0292701  ! 389: STB_I	stb	%r0, [%r4 + 0x0701]
	.word 0xc42122d4  ! 389: STW_I	stw	%r2, [%r4 + 0x02d4]
	.word 0xc6310005  ! 389: STH_R	sth	%r3, [%r4 + %r5]
	.word 0xc4210005  ! 389: STW_R	stw	%r2, [%r4 + %r5]
	.word 0xdef91005  ! 389: SWAPA_R	swapa	%r15, [%r4 + %r5] 0x80
	.word 0xc0310005  ! 389: STH_R	sth	%r0, [%r4 + %r5]
! Store7_atm_st
	.word 0xc4710005  ! 398: STX_R	stx	%r2, [%r4 + %r5]
	.word 0xe4290005  ! 398: STB_R	stb	%r18, [%r4 + %r5]
	.word 0xcc210005  ! 398: STW_R	stw	%r6, [%r4 + %r5]
	.word 0xc6210005  ! 398: STW_R	stw	%r3, [%r4 + %r5]
	.word 0xc4710005  ! 398: STX_R	stx	%r2, [%r4 + %r5]
	.word 0xee292dd8  ! 398: STB_I	stb	%r23, [%r4 + 0x0dd8]
	.word 0xd8310005  ! 398: STH_R	sth	%r12, [%r4 + %r5]
	.word 0xc6e92a9f  ! 398: LDSTUBA_I	ldstuba	%r3, [%r4 + 0x0a9f] %asi
	.word 0xc4290005  ! 398: STB_R	stb	%r2, [%r4 + %r5]
! Store8_atm
	.word 0xc6710005  ! 407: STX_R	stx	%r3, [%r4 + %r5]
	.word 0xc0712880  ! 407: STX_I	stx	%r0, [%r4 + 0x0880]
	.word 0xc0312b72  ! 407: STH_I	sth	%r0, [%r4 + 0x0b72]
	.word 0xc0210005  ! 407: STW_R	stw	%r0, [%r4 + %r5]
	.word 0xee7122e0  ! 407: STX_I	stx	%r23, [%r4 + 0x02e0]
	.word 0xc021251c  ! 407: STW_I	stw	%r0, [%r4 + 0x051c]
	.word 0xc2310005  ! 407: STH_R	sth	%r1, [%r4 + %r5]
	.word 0xc6712cd0  ! 407: STX_I	stx	%r3, [%r4 + 0x0cd0]
	.word 0xc7f11005  ! 407: CASXA_I	casxa	[%r4] 0x80, %r5, %r3
! Store7_atm_st
	.word 0xc6710005  ! 416: STX_R	stx	%r3, [%r4 + %r5]
	.word 0xc2292758  ! 416: STB_I	stb	%r1, [%r4 + 0x0758]
	.word 0xc6712010  ! 416: STX_I	stx	%r3, [%r4 + 0x0010]
	.word 0xc0210005  ! 416: STW_R	stw	%r0, [%r4 + %r5]
	.word 0xc2310005  ! 416: STH_R	sth	%r1, [%r4 + %r5]
	.word 0xc02927f7  ! 416: STB_I	stb	%r0, [%r4 + 0x07f7]
	.word 0xf8290005  ! 416: STB_R	stb	%r28, [%r4 + %r5]
	.word 0xf2e926cd  ! 416: LDSTUBA_I	ldstuba	%r25, [%r4 + 0x06cd] %asi
	.word 0xc62123a4  ! 416: STW_I	stw	%r3, [%r4 + 0x03a4]
! Store6_atm_st
	.word 0xc6710005  ! 424: STX_R	stx	%r3, [%r4 + %r5]
	.word 0xf4290005  ! 424: STB_R	stb	%r26, [%r4 + %r5]
	.word 0xc6210005  ! 424: STW_R	stw	%r3, [%r4 + %r5]
	.word 0xc6710005  ! 424: STX_R	stx	%r3, [%r4 + %r5]
	.word 0xc2210005  ! 424: STW_R	stw	%r1, [%r4 + %r5]
	.word 0xce21235c  ! 424: STW_I	stw	%r7, [%r4 + 0x035c]
	.word 0xc6f92064  ! 424: SWAPA_I	swapa	%r3, [%r4 + 0x0064] %asi
	.word 0xc6290005  ! 424: STB_R	stb	%r3, [%r4 + %r5]
! Store8_fpst
	.word 0xc0710005  ! 433: STX_R	stx	%r0, [%r4 + %r5]
	.word 0xc2290005  ! 433: STB_R	stb	%r1, [%r4 + %r5]
	.word 0xc0212284  ! 433: STW_I	stw	%r0, [%r4 + 0x0284]
	.word 0xf2710005  ! 433: STX_R	stx	%r25, [%r4 + %r5]
	.word 0xc4212f48  ! 433: STW_I	stw	%r2, [%r4 + 0x0f48]
	.word 0xf0290005  ! 433: STB_R	stb	%r24, [%r4 + %r5]
	.word 0xd4292106  ! 433: STB_I	stb	%r10, [%r4 + 0x0106]
	.word 0xc02927eb  ! 433: STB_I	stb	%r0, [%r4 + 0x07eb]
	.word 0xd3392a80  ! 433: STDF_I	std	%f9, [0x0a80, %r4]
! Store7_atm_st
	.word 0xde710005  ! 442: STX_R	stx	%r15, [%r4 + %r5]
	.word 0xd2710005  ! 442: STX_R	stx	%r9, [%r4 + %r5]
	.word 0xc6712478  ! 442: STX_I	stx	%r3, [%r4 + 0x0478]
	.word 0xd47125b0  ! 442: STX_I	stx	%r10, [%r4 + 0x05b0]
	.word 0xea290005  ! 442: STB_R	stb	%r21, [%r4 + %r5]
	.word 0xf8210005  ! 442: STW_R	stw	%r28, [%r4 + %r5]
	.word 0xc0710005  ! 442: STX_R	stx	%r0, [%r4 + %r5]
	.word 0xc4f91005  ! 442: SWAPA_R	swapa	%r2, [%r4 + %r5] 0x80
	.word 0xf0210005  ! 442: STW_R	stw	%r24, [%r4 + %r5]
! Store6_fpst_st
	.word 0xc0710005  ! 450: STX_R	stx	%r0, [%r4 + %r5]
	.word 0xd629243b  ! 450: STB_I	stb	%r11, [%r4 + 0x043b]
	.word 0xc0292aa3  ! 450: STB_I	stb	%r0, [%r4 + 0x0aa3]
	.word 0xc0290005  ! 450: STB_R	stb	%r0, [%r4 + %r5]
	.word 0xc6292156  ! 450: STB_I	stb	%r3, [%r4 + 0x0156]
	.word 0xc2712948  ! 450: STX_I	stx	%r1, [%r4 + 0x0948]
	.word 0xc7212418  ! 450: STF_I	st	%f3, [0x0418, %r4]
	.word 0xc0312fa8  ! 450: STH_I	sth	%r0, [%r4 + 0x0fa8]
! Store9
	.word 0xc0710005  ! 459: STX_R	stx	%r0, [%r4 + %r5]
	.word 0xc0290005  ! 459: STB_R	stb	%r0, [%r4 + %r5]
	.word 0xc029299c  ! 459: STB_I	stb	%r0, [%r4 + 0x099c]
	.word 0xc2212a28  ! 459: STW_I	stw	%r1, [%r4 + 0x0a28]
	.word 0xc4292d4e  ! 459: STB_I	stb	%r2, [%r4 + 0x0d4e]
	.word 0xf2290005  ! 459: STB_R	stb	%r25, [%r4 + %r5]
	.word 0xe0712350  ! 459: STX_I	stx	%r16, [%r4 + 0x0350]
	.word 0xc4210005  ! 459: STW_R	stw	%r2, [%r4 + %r5]
	.word 0xcc712498  ! 459: STX_I	stx	%r6, [%r4 + 0x0498]
! Store6_atm_st
	.word 0xda710005  ! 467: STX_R	stx	%r13, [%r4 + %r5]
	.word 0xc6310005  ! 467: STH_R	sth	%r3, [%r4 + %r5]
	.word 0xe2312f16  ! 467: STH_I	sth	%r17, [%r4 + 0x0f16]
	.word 0xc0710005  ! 467: STX_R	stx	%r0, [%r4 + %r5]
	.word 0xea292ea7  ! 467: STB_I	stb	%r21, [%r4 + 0x0ea7]
	.word 0xc2210005  ! 467: STW_R	stw	%r1, [%r4 + %r5]
	.word 0xd7f12005  ! 467: CASXA_R	casxa	[%r4]%asi, %r5, %r11
	.word 0xc2210005  ! 467: STW_R	stw	%r1, [%r4 + %r5]
! Store9
	.word 0xc2710005  ! 476: STX_R	stx	%r1, [%r4 + %r5]
	.word 0xc6312c52  ! 476: STH_I	sth	%r3, [%r4 + 0x0c52]
	.word 0xe0290005  ! 476: STB_R	stb	%r16, [%r4 + %r5]
	.word 0xc6712ed0  ! 476: STX_I	stx	%r3, [%r4 + 0x0ed0]
	.word 0xc6710005  ! 476: STX_R	stx	%r3, [%r4 + %r5]
	.word 0xc4290005  ! 476: STB_R	stb	%r2, [%r4 + %r5]
	.word 0xf2210005  ! 476: STW_R	stw	%r25, [%r4 + %r5]
	.word 0xc03128a0  ! 476: STH_I	sth	%r0, [%r4 + 0x08a0]
	.word 0xc6290005  ! 476: STB_R	stb	%r3, [%r4 + %r5]
! Store8_fpst
	.word 0xc6710005  ! 485: STX_R	stx	%r3, [%r4 + %r5]
	.word 0xc6710005  ! 485: STX_R	stx	%r3, [%r4 + %r5]
	.word 0xc2312ff4  ! 485: STH_I	sth	%r1, [%r4 + 0x0ff4]
	.word 0xd8710005  ! 485: STX_R	stx	%r12, [%r4 + %r5]
	.word 0xc0710005  ! 485: STX_R	stx	%r0, [%r4 + %r5]
	.word 0xc07124d8  ! 485: STX_I	stx	%r0, [%r4 + 0x04d8]
	.word 0xc22920fb  ! 485: STB_I	stb	%r1, [%r4 + 0x00fb]
	.word 0xc2312eb8  ! 485: STH_I	sth	%r1, [%r4 + 0x0eb8]
	.word 0xc3210005  ! 485: STF_R	st	%f1, [%r5, %r4]
! Store9
	.word 0xc6710005  ! 494: STX_R	stx	%r3, [%r4 + %r5]
	.word 0xc0290005  ! 494: STB_R	stb	%r0, [%r4 + %r5]
	.word 0xc4210005  ! 494: STW_R	stw	%r2, [%r4 + %r5]
	.word 0xf4712d28  ! 494: STX_I	stx	%r26, [%r4 + 0x0d28]
	.word 0xe0312cac  ! 494: STH_I	sth	%r16, [%r4 + 0x0cac]
	.word 0xc6290005  ! 494: STB_R	stb	%r3, [%r4 + %r5]
	.word 0xf6710005  ! 494: STX_R	stx	%r27, [%r4 + %r5]
	.word 0xfe312b2c  ! 494: STH_I	sth	%r31, [%r4 + 0x0b2c]
	.word 0xc6710005  ! 494: STX_R	stx	%r3, [%r4 + %r5]
        ta      T_GOOD_TRAP

th_main_2:
	setx  MAIN_BASE_DATA_VA, %r1, %r4
	setx  0x0000000000000770, %r1, %r5
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
        setx  0x80, %g2, %g1
        wr  %g1, %g0, %asi
	setx  0x755db38c0bd15875, %r1, %r1
	setx  0xe3283ceb807d7e7f, %r1, %r2
	setx  0xaffa173d6813a689, %r1, %r3
	setx  0xd9910a24121f3919, %r1, %r6
	setx  0x758c7747db317981, %r1, %r7
	setx  0x67d51cf061004e61, %r1, %r8
	setx  0x3e8ec1ec433c1991, %r1, %r9
	setx  0x675054266dc8a2e2, %r1, %r10
	setx  0x23cec111ff05329e, %r1, %r11
	setx  0xb962ca7bdeb28f42, %r1, %r12
	setx  0x3b464db073aa18e2, %r1, %r13
	setx  0xd00fc12194ad7eaa, %r1, %r14
	setx  0xcd129d0d97ea350a, %r1, %r15
	setx  0xb13e2e5d009dfcdd, %r1, %r16
	setx  0xfce9b3d08c6577fb, %r1, %r17
	setx  0x680c61d701cd871d, %r1, %r18
	setx  0x39bc25494db32197, %r1, %r19
	setx  0xee8e46b77cae612c, %r1, %r20
	setx  0x706ece2a8d1754b7, %r1, %r21
	setx  0xc1360650b12f15c4, %r1, %r22
	setx  0x47a3f5c7d38c1ee6, %r1, %r23
	setx  0x987e84187ed924ad, %r1, %r24
	setx  0x83a14cf6de499369, %r1, %r25
	setx  0xb2b35ee369d727ce, %r1, %r26
	setx  0xe81b999399d6a4f9, %r1, %r27
	setx  0x63e50205d5c34291, %r1, %r28
	setx  0x58ee817c9d5c8e7b, %r1, %r29
	setx  0x1a7cb7e6181c0aed, %r1, %r30
	setx  0x31e1268426196dc3, %r1, %r31
! Store6_atm_st
	.word 0xc0710005  ! 10: STX_R	stx	%r0, [%r4 + %r5]
	.word 0xc0312bec  ! 10: STH_I	sth	%r0, [%r4 + 0x0bec]
	.word 0xc2212d5c  ! 10: STW_I	stw	%r1, [%r4 + 0x0d5c]
	.word 0xd6210005  ! 10: STW_R	stw	%r11, [%r4 + %r5]
	.word 0xc4310005  ! 10: STH_R	sth	%r2, [%r4 + %r5]
	.word 0xf0290005  ! 10: STB_R	stb	%r24, [%r4 + %r5]
	.word 0xc3e11005  ! 10: CASA_I	casa	[%r4] 0x80, %r5, %r1
	.word 0xc6712f48  ! 10: STX_I	stx	%r3, [%r4 + 0x0f48]
! Store8_atm
	.word 0xfc710005  ! 19: STX_R	stx	%r30, [%r4 + %r5]
	.word 0xc2710005  ! 19: STX_R	stx	%r1, [%r4 + %r5]
	.word 0xfa710005  ! 19: STX_R	stx	%r29, [%r4 + %r5]
	.word 0xc4712be0  ! 19: STX_I	stx	%r2, [%r4 + 0x0be0]
	.word 0xf0310005  ! 19: STH_R	sth	%r24, [%r4 + %r5]
	.word 0xc22126e8  ! 19: STW_I	stw	%r1, [%r4 + 0x06e8]
	.word 0xc6290005  ! 19: STB_R	stb	%r3, [%r4 + %r5]
	.word 0xc6210005  ! 19: STW_R	stw	%r3, [%r4 + %r5]
	.word 0xc6790005  ! 19: SWAP_R	swap	%r3, [%r4 + %r5]
! Store6_fpst_st
	.word 0xf0710005  ! 27: STX_R	stx	%r24, [%r4 + %r5]
	.word 0xe6312830  ! 27: STH_I	sth	%r19, [%r4 + 0x0830]
	.word 0xdc312d7e  ! 27: STH_I	sth	%r14, [%r4 + 0x0d7e]
	.word 0xc2710005  ! 27: STX_R	stx	%r1, [%r4 + %r5]
	.word 0xc0212da0  ! 27: STW_I	stw	%r0, [%r4 + 0x0da0]
	.word 0xc031242e  ! 27: STH_I	sth	%r0, [%r4 + 0x042e]
	.word 0xff210005  ! 27: STF_R	st	%f31, [%r5, %r4]
	.word 0xc2312e3a  ! 27: STH_I	sth	%r1, [%r4 + 0x0e3a]
! Store6_atm_st
	.word 0xe8710005  ! 35: STX_R	stx	%r20, [%r4 + %r5]
	.word 0xce290005  ! 35: STB_R	stb	%r7, [%r4 + %r5]
	.word 0xfe710005  ! 35: STX_R	stx	%r31, [%r4 + %r5]
	.word 0xc0312fc4  ! 35: STH_I	sth	%r0, [%r4 + 0x0fc4]
	.word 0xc4210005  ! 35: STW_R	stw	%r2, [%r4 + %r5]
	.word 0xc6210005  ! 35: STW_R	stw	%r3, [%r4 + %r5]
	.word 0xece92e08  ! 35: LDSTUBA_I	ldstuba	%r22, [%r4 + 0x0e08] %asi
	.word 0xc43120fe  ! 35: STH_I	sth	%r2, [%r4 + 0x00fe]
! Store8
	.word 0xfe710005  ! 44: STX_R	stx	%r31, [%r4 + %r5]
	.word 0xc4712830  ! 44: STX_I	stx	%r2, [%r4 + 0x0830]
	.word 0xc62123e4  ! 44: STW_I	stw	%r3, [%r4 + 0x03e4]
	.word 0xc2290005  ! 44: STB_R	stb	%r1, [%r4 + %r5]
	.word 0xc6292e4f  ! 44: STB_I	stb	%r3, [%r4 + 0x0e4f]
	.word 0xc22923b9  ! 44: STB_I	stb	%r1, [%r4 + 0x03b9]
	.word 0xc0310005  ! 44: STH_R	sth	%r0, [%r4 + %r5]
	.word 0xc6290005  ! 44: STB_R	stb	%r3, [%r4 + %r5]
! Store8
	.word 0xc4710005  ! 53: STX_R	stx	%r2, [%r4 + %r5]
	.word 0xc6292027  ! 53: STB_I	stb	%r3, [%r4 + 0x0027]
	.word 0xc6210005  ! 53: STW_R	stw	%r3, [%r4 + %r5]
	.word 0xf62923bc  ! 53: STB_I	stb	%r27, [%r4 + 0x03bc]
	.word 0xc2710005  ! 53: STX_R	stx	%r1, [%r4 + %r5]
	.word 0xc2710005  ! 53: STX_R	stx	%r1, [%r4 + %r5]
	.word 0xfc7129a0  ! 53: STX_I	stx	%r30, [%r4 + 0x09a0]
	.word 0xc6212ba4  ! 53: STW_I	stw	%r3, [%r4 + 0x0ba4]
! Store9
	.word 0xc0710005  ! 62: STX_R	stx	%r0, [%r4 + %r5]
	.word 0xda310005  ! 62: STH_R	sth	%r13, [%r4 + %r5]
	.word 0xc0712b00  ! 62: STX_I	stx	%r0, [%r4 + 0x0b00]
	.word 0xc47127a0  ! 62: STX_I	stx	%r2, [%r4 + 0x07a0]
	.word 0xfc290005  ! 62: STB_R	stb	%r30, [%r4 + %r5]
	.word 0xc4312a92  ! 62: STH_I	sth	%r2, [%r4 + 0x0a92]
	.word 0xce312932  ! 62: STH_I	sth	%r7, [%r4 + 0x0932]
	.word 0xec292261  ! 62: STB_I	stb	%r22, [%r4 + 0x0261]
	.word 0xc2210005  ! 62: STW_R	stw	%r1, [%r4 + %r5]
! Store8_fpst
	.word 0xc4710005  ! 71: STX_R	stx	%r2, [%r4 + %r5]
	.word 0xe8310005  ! 71: STH_R	sth	%r20, [%r4 + %r5]
	.word 0xc2292e5c  ! 71: STB_I	stb	%r1, [%r4 + 0x0e5c]
	.word 0xc4292d20  ! 71: STB_I	stb	%r2, [%r4 + 0x0d20]
	.word 0xd6290005  ! 71: STB_R	stb	%r11, [%r4 + %r5]
	.word 0xc0312e0c  ! 71: STH_I	sth	%r0, [%r4 + 0x0e0c]
	.word 0xc4710005  ! 71: STX_R	stx	%r2, [%r4 + %r5]
	.word 0xe0712c90  ! 71: STX_I	stx	%r16, [%r4 + 0x0c90]
	.word 0xd92126e4  ! 71: STF_I	st	%f12, [0x06e4, %r4]
! Store6_atm_st
	.word 0xf4710005  ! 79: STX_R	stx	%r26, [%r4 + %r5]
	.word 0xc2712570  ! 79: STX_I	stx	%r1, [%r4 + 0x0570]
	.word 0xde210005  ! 79: STW_R	stw	%r15, [%r4 + %r5]
	.word 0xee312746  ! 79: STH_I	sth	%r23, [%r4 + 0x0746]
	.word 0xc0712f10  ! 79: STX_I	stx	%r0, [%r4 + 0x0f10]
	.word 0xea310005  ! 79: STH_R	sth	%r21, [%r4 + %r5]
	.word 0xc5f12005  ! 79: CASXA_R	casxa	[%r4]%asi, %r5, %r2
	.word 0xe621255c  ! 79: STW_I	stw	%r19, [%r4 + 0x055c]
! Store8
	.word 0xc4710005  ! 88: STX_R	stx	%r2, [%r4 + %r5]
	.word 0xc4310005  ! 88: STH_R	sth	%r2, [%r4 + %r5]
	.word 0xc2710005  ! 88: STX_R	stx	%r1, [%r4 + %r5]
	.word 0xf4310005  ! 88: STH_R	sth	%r26, [%r4 + %r5]
	.word 0xc2290005  ! 88: STB_R	stb	%r1, [%r4 + %r5]
	.word 0xc4290005  ! 88: STB_R	stb	%r2, [%r4 + %r5]
	.word 0xda310005  ! 88: STH_R	sth	%r13, [%r4 + %r5]
	.word 0xe8310005  ! 88: STH_R	sth	%r20, [%r4 + %r5]
! Store8_atm
	.word 0xf4710005  ! 97: STX_R	stx	%r26, [%r4 + %r5]
	.word 0xc43122a4  ! 97: STH_I	sth	%r2, [%r4 + 0x02a4]
	.word 0xc6312b5a  ! 97: STH_I	sth	%r3, [%r4 + 0x0b5a]
	.word 0xe02920e4  ! 97: STB_I	stb	%r16, [%r4 + 0x00e4]
	.word 0xc429230a  ! 97: STB_I	stb	%r2, [%r4 + 0x030a]
	.word 0xc2312038  ! 97: STH_I	sth	%r1, [%r4 + 0x0038]
	.word 0xc4212bc0  ! 97: STW_I	stw	%r2, [%r4 + 0x0bc0]
	.word 0xee21213c  ! 97: STW_I	stw	%r23, [%r4 + 0x013c]
	.word 0xf7e12005  ! 97: CASA_R	casa	[%r4] %asi, %r5, %r27
! Store8_atm
	.word 0xc0710005  ! 106: STX_R	stx	%r0, [%r4 + %r5]
	.word 0xc2312ef0  ! 106: STH_I	sth	%r1, [%r4 + 0x0ef0]
	.word 0xc2712698  ! 106: STX_I	stx	%r1, [%r4 + 0x0698]
	.word 0xc2312ae8  ! 106: STH_I	sth	%r1, [%r4 + 0x0ae8]
	.word 0xe23121ea  ! 106: STH_I	sth	%r17, [%r4 + 0x01ea]
	.word 0xfc710005  ! 106: STX_R	stx	%r30, [%r4 + %r5]
	.word 0xc4312cb0  ! 106: STH_I	sth	%r2, [%r4 + 0x0cb0]
	.word 0xc2290005  ! 106: STB_R	stb	%r1, [%r4 + %r5]
	.word 0xc6792cd8  ! 106: SWAP_I	swap	%r3, [%r4 + 0x0cd8]
! Store6_fpst_st
	.word 0xc6710005  ! 114: STX_R	stx	%r3, [%r4 + %r5]
	.word 0xc6290005  ! 114: STB_R	stb	%r3, [%r4 + %r5]
	.word 0xee292c1e  ! 114: STB_I	stb	%r23, [%r4 + 0x0c1e]
	.word 0xc431283c  ! 114: STH_I	sth	%r2, [%r4 + 0x083c]
	.word 0xc0292557  ! 114: STB_I	stb	%r0, [%r4 + 0x0557]
	.word 0xc4312436  ! 114: STH_I	sth	%r2, [%r4 + 0x0436]
	.word 0xf3210005  ! 114: STF_R	st	%f25, [%r5, %r4]
	.word 0xc0710005  ! 114: STX_R	stx	%r0, [%r4 + %r5]
! Store6_atm_st
	.word 0xc4710005  ! 122: STX_R	stx	%r2, [%r4 + %r5]
	.word 0xc6290005  ! 122: STB_R	stb	%r3, [%r4 + %r5]
	.word 0xc2290005  ! 122: STB_R	stb	%r1, [%r4 + %r5]
	.word 0xc6712960  ! 122: STX_I	stx	%r3, [%r4 + 0x0960]
	.word 0xc2290005  ! 122: STB_R	stb	%r1, [%r4 + %r5]
	.word 0xc6290005  ! 122: STB_R	stb	%r3, [%r4 + %r5]
	.word 0xc7e11005  ! 122: CASA_I	casa	[%r4] 0x80, %r5, %r3
	.word 0xc67126b0  ! 122: STX_I	stx	%r3, [%r4 + 0x06b0]
! Store8_fpst
	.word 0xf6710005  ! 131: STX_R	stx	%r27, [%r4 + %r5]
	.word 0xfc712010  ! 131: STX_I	stx	%r30, [%r4 + 0x0010]
	.word 0xf8712768  ! 131: STX_I	stx	%r28, [%r4 + 0x0768]
	.word 0xc6292218  ! 131: STB_I	stb	%r3, [%r4 + 0x0218]
	.word 0xc4310005  ! 131: STH_R	sth	%r2, [%r4 + %r5]
	.word 0xc6310005  ! 131: STH_R	sth	%r3, [%r4 + %r5]
	.word 0xd0290005  ! 131: STB_R	stb	%r8, [%r4 + %r5]
	.word 0xcc292165  ! 131: STB_I	stb	%r6, [%r4 + 0x0165]
	.word 0xc72122a8  ! 131: STF_I	st	%f3, [0x02a8, %r4]
! Store8_fpst
	.word 0xcc710005  ! 140: STX_R	stx	%r6, [%r4 + %r5]
	.word 0xc2310005  ! 140: STH_R	sth	%r1, [%r4 + %r5]
	.word 0xe62128e4  ! 140: STW_I	stw	%r19, [%r4 + 0x08e4]
	.word 0xc4712df0  ! 140: STX_I	stx	%r2, [%r4 + 0x0df0]
	.word 0xc4210005  ! 140: STW_R	stw	%r2, [%r4 + %r5]
	.word 0xc4290005  ! 140: STB_R	stb	%r2, [%r4 + %r5]
	.word 0xc6290005  ! 140: STB_R	stb	%r3, [%r4 + %r5]
	.word 0xd2290005  ! 140: STB_R	stb	%r9, [%r4 + %r5]
	.word 0xff392ab8  ! 140: STDF_I	std	%f31, [0x0ab8, %r4]
! Store6_atm_st
	.word 0xc4710005  ! 148: STX_R	stx	%r2, [%r4 + %r5]
	.word 0xc6212d40  ! 148: STW_I	stw	%r3, [%r4 + 0x0d40]
	.word 0xe4310005  ! 148: STH_R	sth	%r18, [%r4 + %r5]
	.word 0xf4310005  ! 148: STH_R	sth	%r26, [%r4 + %r5]
	.word 0xc6210005  ! 148: STW_R	stw	%r3, [%r4 + %r5]
	.word 0xc2310005  ! 148: STH_R	sth	%r1, [%r4 + %r5]
	.word 0xc4e91005  ! 148: LDSTUBA_R	ldstuba	%r2, [%r4 + %r5] 0x80
	.word 0xc2710005  ! 148: STX_R	stx	%r1, [%r4 + %r5]
! Store9
	.word 0xfc710005  ! 157: STX_R	stx	%r30, [%r4 + %r5]
	.word 0xd6290005  ! 157: STB_R	stb	%r11, [%r4 + %r5]
	.word 0xd2310005  ! 157: STH_R	sth	%r9, [%r4 + %r5]
	.word 0xf2212d38  ! 157: STW_I	stw	%r25, [%r4 + 0x0d38]
	.word 0xfe292a18  ! 157: STB_I	stb	%r31, [%r4 + 0x0a18]
	.word 0xfa3129a4  ! 157: STH_I	sth	%r29, [%r4 + 0x09a4]
	.word 0xc0710005  ! 157: STX_R	stx	%r0, [%r4 + %r5]
	.word 0xf8710005  ! 157: STX_R	stx	%r28, [%r4 + %r5]
	.word 0xda710005  ! 157: STX_R	stx	%r13, [%r4 + %r5]
! Store9
	.word 0xc4710005  ! 166: STX_R	stx	%r2, [%r4 + %r5]
	.word 0xc0712bf8  ! 166: STX_I	stx	%r0, [%r4 + 0x0bf8]
	.word 0xc0710005  ! 166: STX_R	stx	%r0, [%r4 + %r5]
	.word 0xf43122dc  ! 166: STH_I	sth	%r26, [%r4 + 0x02dc]
	.word 0xe0312316  ! 166: STH_I	sth	%r16, [%r4 + 0x0316]
	.word 0xc2712f60  ! 166: STX_I	stx	%r1, [%r4 + 0x0f60]
	.word 0xc4212bd4  ! 166: STW_I	stw	%r2, [%r4 + 0x0bd4]
	.word 0xfa210005  ! 166: STW_R	stw	%r29, [%r4 + %r5]
	.word 0xc4312a5c  ! 166: STH_I	sth	%r2, [%r4 + 0x0a5c]
! Store7_atm_st
	.word 0xc4710005  ! 175: STX_R	stx	%r2, [%r4 + %r5]
	.word 0xc6210005  ! 175: STW_R	stw	%r3, [%r4 + %r5]
	.word 0xc4310005  ! 175: STH_R	sth	%r2, [%r4 + %r5]
	.word 0xc07127b0  ! 175: STX_I	stx	%r0, [%r4 + 0x07b0]
	.word 0xc6710005  ! 175: STX_R	stx	%r3, [%r4 + %r5]
	.word 0xc03126aa  ! 175: STH_I	sth	%r0, [%r4 + 0x06aa]
	.word 0xc6210005  ! 175: STW_R	stw	%r3, [%r4 + %r5]
	.word 0xefe11005  ! 175: CASA_I	casa	[%r4] 0x80, %r5, %r23
	.word 0xc6212c08  ! 175: STW_I	stw	%r3, [%r4 + 0x0c08]
! Store6_fpst_st
	.word 0xc4710005  ! 183: STX_R	stx	%r2, [%r4 + %r5]
	.word 0xc229204e  ! 183: STB_I	stb	%r1, [%r4 + 0x004e]
	.word 0xc22127d0  ! 183: STW_I	stw	%r1, [%r4 + 0x07d0]
	.word 0xc0710005  ! 183: STX_R	stx	%r0, [%r4 + %r5]
	.word 0xc2712470  ! 183: STX_I	stx	%r1, [%r4 + 0x0470]
	.word 0xc0212fc8  ! 183: STW_I	stw	%r0, [%r4 + 0x0fc8]
	.word 0xc32128bc  ! 183: STF_I	st	%f1, [0x08bc, %r4]
	.word 0xc4292537  ! 183: STB_I	stb	%r2, [%r4 + 0x0537]
! Store6_fpst_st
	.word 0xfe710005  ! 191: STX_R	stx	%r31, [%r4 + %r5]
	.word 0xc0712e08  ! 191: STX_I	stx	%r0, [%r4 + 0x0e08]
	.word 0xc0212ac4  ! 191: STW_I	stw	%r0, [%r4 + 0x0ac4]
	.word 0xe4292984  ! 191: STB_I	stb	%r18, [%r4 + 0x0984]
	.word 0xc6710005  ! 191: STX_R	stx	%r3, [%r4 + %r5]
	.word 0xc631270c  ! 191: STH_I	sth	%r3, [%r4 + 0x070c]
	.word 0xc52127ac  ! 191: STF_I	st	%f2, [0x07ac, %r4]
	.word 0xc6712cc8  ! 191: STX_I	stx	%r3, [%r4 + 0x0cc8]
! Store6_atm_st
	.word 0xc0710005  ! 199: STX_R	stx	%r0, [%r4 + %r5]
	.word 0xfe212ec4  ! 199: STW_I	stw	%r31, [%r4 + 0x0ec4]
	.word 0xc0210005  ! 199: STW_R	stw	%r0, [%r4 + %r5]
	.word 0xc03121f0  ! 199: STH_I	sth	%r0, [%r4 + 0x01f0]
	.word 0xe8310005  ! 199: STH_R	sth	%r20, [%r4 + %r5]
	.word 0xc2212f4c  ! 199: STW_I	stw	%r1, [%r4 + 0x0f4c]
	.word 0xc6792144  ! 199: SWAP_I	swap	%r3, [%r4 + 0x0144]
	.word 0xc6290005  ! 199: STB_R	stb	%r3, [%r4 + %r5]
! Store8_fpst
	.word 0xc2710005  ! 208: STX_R	stx	%r1, [%r4 + %r5]
	.word 0xc2312a22  ! 208: STH_I	sth	%r1, [%r4 + 0x0a22]
	.word 0xc6212370  ! 208: STW_I	stw	%r3, [%r4 + 0x0370]
	.word 0xc2312708  ! 208: STH_I	sth	%r1, [%r4 + 0x0708]
	.word 0xc6290005  ! 208: STB_R	stb	%r3, [%r4 + %r5]
	.word 0xc6710005  ! 208: STX_R	stx	%r3, [%r4 + %r5]
	.word 0xc0292f0a  ! 208: STB_I	stb	%r0, [%r4 + 0x0f0a]
	.word 0xcc712c10  ! 208: STX_I	stx	%r6, [%r4 + 0x0c10]
	.word 0xed210005  ! 208: STF_R	st	%f22, [%r5, %r4]
! Store6_fpst_st
	.word 0xc4710005  ! 216: STX_R	stx	%r2, [%r4 + %r5]
	.word 0xc0210005  ! 216: STW_R	stw	%r0, [%r4 + %r5]
	.word 0xc0710005  ! 216: STX_R	stx	%r0, [%r4 + %r5]
	.word 0xc2312122  ! 216: STH_I	sth	%r1, [%r4 + 0x0122]
	.word 0xec710005  ! 216: STX_R	stx	%r22, [%r4 + %r5]
	.word 0xc6312f60  ! 216: STH_I	sth	%r3, [%r4 + 0x0f60]
	.word 0xc3392228  ! 216: STDF_I	std	%f1, [0x0228, %r4]
	.word 0xc2312984  ! 216: STH_I	sth	%r1, [%r4 + 0x0984]
! Store6_atm_st
	.word 0xc4710005  ! 224: STX_R	stx	%r2, [%r4 + %r5]
	.word 0xc6312c18  ! 224: STH_I	sth	%r3, [%r4 + 0x0c18]
	.word 0xd42126a8  ! 224: STW_I	stw	%r10, [%r4 + 0x06a8]
	.word 0xc2710005  ! 224: STX_R	stx	%r1, [%r4 + %r5]
	.word 0xc621271c  ! 224: STW_I	stw	%r3, [%r4 + 0x071c]
	.word 0xfa290005  ! 224: STB_R	stb	%r29, [%r4 + %r5]
	.word 0xc2e91005  ! 224: LDSTUBA_R	ldstuba	%r1, [%r4 + %r5] 0x80
	.word 0xc02920c9  ! 224: STB_I	stb	%r0, [%r4 + 0x00c9]
! Store6_atm_st
	.word 0xc2710005  ! 232: STX_R	stx	%r1, [%r4 + %r5]
	.word 0xc029222c  ! 232: STB_I	stb	%r0, [%r4 + 0x022c]
	.word 0xce29272b  ! 232: STB_I	stb	%r7, [%r4 + 0x072b]
	.word 0xdc290005  ! 232: STB_R	stb	%r14, [%r4 + %r5]
	.word 0xc4312a56  ! 232: STH_I	sth	%r2, [%r4 + 0x0a56]
	.word 0xfc310005  ! 232: STH_R	sth	%r30, [%r4 + %r5]
	.word 0xd1f12005  ! 232: CASXA_R	casxa	[%r4]%asi, %r5, %r8
	.word 0xc0312644  ! 232: STH_I	sth	%r0, [%r4 + 0x0644]
! Store6_fpst_st
	.word 0xc6710005  ! 240: STX_R	stx	%r3, [%r4 + %r5]
	.word 0xc0712c78  ! 240: STX_I	stx	%r0, [%r4 + 0x0c78]
	.word 0xea210005  ! 240: STW_R	stw	%r21, [%r4 + %r5]
	.word 0xfe2920e2  ! 240: STB_I	stb	%r31, [%r4 + 0x00e2]
	.word 0xf2310005  ! 240: STH_R	sth	%r25, [%r4 + %r5]
	.word 0xc0310005  ! 240: STH_R	sth	%r0, [%r4 + %r5]
	.word 0xc3390005  ! 240: STDF_R	std	%f1, [%r5, %r4]
	.word 0xfa292efc  ! 240: STB_I	stb	%r29, [%r4 + 0x0efc]
! Store8_atm
	.word 0xc4710005  ! 249: STX_R	stx	%r2, [%r4 + %r5]
	.word 0xc2310005  ! 249: STH_R	sth	%r1, [%r4 + %r5]
	.word 0xc6310005  ! 249: STH_R	sth	%r3, [%r4 + %r5]
	.word 0xf2292d2c  ! 249: STB_I	stb	%r25, [%r4 + 0x0d2c]
	.word 0xdc290005  ! 249: STB_R	stb	%r14, [%r4 + %r5]
	.word 0xd4292290  ! 249: STB_I	stb	%r10, [%r4 + 0x0290]
	.word 0xda712470  ! 249: STX_I	stx	%r13, [%r4 + 0x0470]
	.word 0xfc2121b8  ! 249: STW_I	stw	%r30, [%r4 + 0x01b8]
	.word 0xec790005  ! 249: SWAP_R	swap	%r22, [%r4 + %r5]
! Store7_atm_st
	.word 0xc4710005  ! 258: STX_R	stx	%r2, [%r4 + %r5]
	.word 0xc4310005  ! 258: STH_R	sth	%r2, [%r4 + %r5]
	.word 0xf2210005  ! 258: STW_R	stw	%r25, [%r4 + %r5]
	.word 0xc0210005  ! 258: STW_R	stw	%r0, [%r4 + %r5]
	.word 0xc4210005  ! 258: STW_R	stw	%r2, [%r4 + %r5]
	.word 0xc4212aa0  ! 258: STW_I	stw	%r2, [%r4 + 0x0aa0]
	.word 0xf63123ac  ! 258: STH_I	sth	%r27, [%r4 + 0x03ac]
	.word 0xe2f921b8  ! 258: SWAPA_I	swapa	%r17, [%r4 + 0x01b8] %asi
	.word 0xc2210005  ! 258: STW_R	stw	%r1, [%r4 + %r5]
! Store7_atm_st
	.word 0xc2710005  ! 267: STX_R	stx	%r1, [%r4 + %r5]
	.word 0xd2210005  ! 267: STW_R	stw	%r9, [%r4 + %r5]
	.word 0xc4212720  ! 267: STW_I	stw	%r2, [%r4 + 0x0720]
	.word 0xc0212f08  ! 267: STW_I	stw	%r0, [%r4 + 0x0f08]
	.word 0xc6310005  ! 267: STH_R	sth	%r3, [%r4 + %r5]
	.word 0xde310005  ! 267: STH_R	sth	%r15, [%r4 + %r5]
	.word 0xc4212ba0  ! 267: STW_I	stw	%r2, [%r4 + 0x0ba0]
	.word 0xd9f11005  ! 267: CASXA_I	casxa	[%r4] 0x80, %r5, %r12
	.word 0xf8210005  ! 267: STW_R	stw	%r28, [%r4 + %r5]
! Store8_fpst
	.word 0xc0710005  ! 276: STX_R	stx	%r0, [%r4 + %r5]
	.word 0xf6212e70  ! 276: STW_I	stw	%r27, [%r4 + 0x0e70]
	.word 0xce712b20  ! 276: STX_I	stx	%r7, [%r4 + 0x0b20]
	.word 0xc6210005  ! 276: STW_R	stw	%r3, [%r4 + %r5]
	.word 0xec712490  ! 276: STX_I	stx	%r22, [%r4 + 0x0490]
	.word 0xee290005  ! 276: STB_R	stb	%r23, [%r4 + %r5]
	.word 0xd8210005  ! 276: STW_R	stw	%r12, [%r4 + %r5]
	.word 0xe0290005  ! 276: STB_R	stb	%r16, [%r4 + %r5]
	.word 0xf5212728  ! 276: STF_I	st	%f26, [0x0728, %r4]
! Store8
	.word 0xc4710005  ! 285: STX_R	stx	%r2, [%r4 + %r5]
	.word 0xc0290005  ! 285: STB_R	stb	%r0, [%r4 + %r5]
	.word 0xe4292f07  ! 285: STB_I	stb	%r18, [%r4 + 0x0f07]
	.word 0xc621239c  ! 285: STW_I	stw	%r3, [%r4 + 0x039c]
	.word 0xc2212c74  ! 285: STW_I	stw	%r1, [%r4 + 0x0c74]
	.word 0xf6290005  ! 285: STB_R	stb	%r27, [%r4 + %r5]
	.word 0xc4710005  ! 285: STX_R	stx	%r2, [%r4 + %r5]
	.word 0xd0212a1c  ! 285: STW_I	stw	%r8, [%r4 + 0x0a1c]
! Store6_atm_st
	.word 0xc0710005  ! 293: STX_R	stx	%r0, [%r4 + %r5]
	.word 0xf0292a03  ! 293: STB_I	stb	%r24, [%r4 + 0x0a03]
	.word 0xc6290005  ! 293: STB_R	stb	%r3, [%r4 + %r5]
	.word 0xc4290005  ! 293: STB_R	stb	%r2, [%r4 + %r5]
	.word 0xc0210005  ! 293: STW_R	stw	%r0, [%r4 + %r5]
	.word 0xcc212350  ! 293: STW_I	stw	%r6, [%r4 + 0x0350]
	.word 0xffe11005  ! 293: CASA_I	casa	[%r4] 0x80, %r5, %r31
	.word 0xf6290005  ! 293: STB_R	stb	%r27, [%r4 + %r5]
! Store9
	.word 0xc4710005  ! 302: STX_R	stx	%r2, [%r4 + %r5]
	.word 0xc4212ea4  ! 302: STW_I	stw	%r2, [%r4 + 0x0ea4]
	.word 0xc2710005  ! 302: STX_R	stx	%r1, [%r4 + %r5]
	.word 0xc4710005  ! 302: STX_R	stx	%r2, [%r4 + %r5]
	.word 0xc47121d8  ! 302: STX_I	stx	%r2, [%r4 + 0x01d8]
	.word 0xc4712610  ! 302: STX_I	stx	%r2, [%r4 + 0x0610]
	.word 0xc4712438  ! 302: STX_I	stx	%r2, [%r4 + 0x0438]
	.word 0xc6312940  ! 302: STH_I	sth	%r3, [%r4 + 0x0940]
	.word 0xc0712ca0  ! 302: STX_I	stx	%r0, [%r4 + 0x0ca0]
! Store7_atm_st
	.word 0xc0710005  ! 311: STX_R	stx	%r0, [%r4 + %r5]
	.word 0xc4210005  ! 311: STW_R	stw	%r2, [%r4 + %r5]
	.word 0xc0712638  ! 311: STX_I	stx	%r0, [%r4 + 0x0638]
	.word 0xc2712600  ! 311: STX_I	stx	%r1, [%r4 + 0x0600]
	.word 0xc6210005  ! 311: STW_R	stw	%r3, [%r4 + %r5]
	.word 0xd6290005  ! 311: STB_R	stb	%r11, [%r4 + %r5]
	.word 0xf2310005  ! 311: STH_R	sth	%r25, [%r4 + %r5]
	.word 0xc0e91005  ! 311: LDSTUBA_R	ldstuba	%r0, [%r4 + %r5] 0x80
	.word 0xc0710005  ! 311: STX_R	stx	%r0, [%r4 + %r5]
! Store7_fpst_st
	.word 0xc2710005  ! 320: STX_R	stx	%r1, [%r4 + %r5]
	.word 0xc4312742  ! 320: STH_I	sth	%r2, [%r4 + 0x0742]
	.word 0xc4312f78  ! 320: STH_I	sth	%r2, [%r4 + 0x0f78]
	.word 0xf07125a8  ! 320: STX_I	stx	%r24, [%r4 + 0x05a8]
	.word 0xc4290005  ! 320: STB_R	stb	%r2, [%r4 + %r5]
	.word 0xcc210005  ! 320: STW_R	stw	%r6, [%r4 + %r5]
	.word 0xc6210005  ! 320: STW_R	stw	%r3, [%r4 + %r5]
	.word 0xdf390005  ! 320: STDF_R	std	%f15, [%r5, %r4]
	.word 0xde712bc0  ! 320: STX_I	stx	%r15, [%r4 + 0x0bc0]
! Store6_fpst_st
	.word 0xf2710005  ! 328: STX_R	stx	%r25, [%r4 + %r5]
	.word 0xc021208c  ! 328: STW_I	stw	%r0, [%r4 + 0x008c]
	.word 0xc0310005  ! 328: STH_R	sth	%r0, [%r4 + %r5]
	.word 0xc2310005  ! 328: STH_R	sth	%r1, [%r4 + %r5]
	.word 0xc0210005  ! 328: STW_R	stw	%r0, [%r4 + %r5]
	.word 0xc4710005  ! 328: STX_R	stx	%r2, [%r4 + %r5]
	.word 0xd9390005  ! 328: STDF_R	std	%f12, [%r5, %r4]
	.word 0xe0290005  ! 328: STB_R	stb	%r16, [%r4 + %r5]
! Store6_atm_st
	.word 0xc4710005  ! 336: STX_R	stx	%r2, [%r4 + %r5]
	.word 0xc6712110  ! 336: STX_I	stx	%r3, [%r4 + 0x0110]
	.word 0xc4210005  ! 336: STW_R	stw	%r2, [%r4 + %r5]
	.word 0xc0210005  ! 336: STW_R	stw	%r0, [%r4 + %r5]
	.word 0xc6310005  ! 336: STH_R	sth	%r3, [%r4 + %r5]
	.word 0xcc312800  ! 336: STH_I	sth	%r6, [%r4 + 0x0800]
	.word 0xd5f11005  ! 336: CASXA_I	casxa	[%r4] 0x80, %r5, %r10
	.word 0xf6212fbc  ! 336: STW_I	stw	%r27, [%r4 + 0x0fbc]
! Store8_atm
	.word 0xc4710005  ! 345: STX_R	stx	%r2, [%r4 + %r5]
	.word 0xec312680  ! 345: STH_I	sth	%r22, [%r4 + 0x0680]
	.word 0xc4710005  ! 345: STX_R	stx	%r2, [%r4 + %r5]
	.word 0xe0292300  ! 345: STB_I	stb	%r16, [%r4 + 0x0300]
	.word 0xc4292b3b  ! 345: STB_I	stb	%r2, [%r4 + 0x0b3b]
	.word 0xc0210005  ! 345: STW_R	stw	%r0, [%r4 + %r5]
	.word 0xc4710005  ! 345: STX_R	stx	%r2, [%r4 + %r5]
	.word 0xda312d0e  ! 345: STH_I	sth	%r13, [%r4 + 0x0d0e]
	.word 0xfde12005  ! 345: CASA_R	casa	[%r4] %asi, %r5, %r30
! Store8_fpst
	.word 0xe6710005  ! 354: STX_R	stx	%r19, [%r4 + %r5]
	.word 0xc2712548  ! 354: STX_I	stx	%r1, [%r4 + 0x0548]
	.word 0xc6712958  ! 354: STX_I	stx	%r3, [%r4 + 0x0958]
	.word 0xda710005  ! 354: STX_R	stx	%r13, [%r4 + %r5]
	.word 0xee710005  ! 354: STX_R	stx	%r23, [%r4 + %r5]
	.word 0xce310005  ! 354: STH_R	sth	%r7, [%r4 + %r5]
	.word 0xd4210005  ! 354: STW_R	stw	%r10, [%r4 + %r5]
	.word 0xda710005  ! 354: STX_R	stx	%r13, [%r4 + %r5]
	.word 0xfd392a58  ! 354: STDF_I	std	%f30, [0x0a58, %r4]
! Store8
	.word 0xe4710005  ! 363: STX_R	stx	%r18, [%r4 + %r5]
	.word 0xc2310005  ! 363: STH_R	sth	%r1, [%r4 + %r5]
	.word 0xf47123e0  ! 363: STX_I	stx	%r26, [%r4 + 0x03e0]
	.word 0xc22123f0  ! 363: STW_I	stw	%r1, [%r4 + 0x03f0]
	.word 0xc22928fd  ! 363: STB_I	stb	%r1, [%r4 + 0x08fd]
	.word 0xc2310005  ! 363: STH_R	sth	%r1, [%r4 + %r5]
	.word 0xc4712168  ! 363: STX_I	stx	%r2, [%r4 + 0x0168]
	.word 0xe2290005  ! 363: STB_R	stb	%r17, [%r4 + %r5]
! Store8
	.word 0xc6710005  ! 372: STX_R	stx	%r3, [%r4 + %r5]
	.word 0xd8312a76  ! 372: STH_I	sth	%r12, [%r4 + 0x0a76]
	.word 0xf0290005  ! 372: STB_R	stb	%r24, [%r4 + %r5]
	.word 0xc6312ae6  ! 372: STH_I	sth	%r3, [%r4 + 0x0ae6]
	.word 0xc2712d98  ! 372: STX_I	stx	%r1, [%r4 + 0x0d98]
	.word 0xc2210005  ! 372: STW_R	stw	%r1, [%r4 + %r5]
	.word 0xc2212e1c  ! 372: STW_I	stw	%r1, [%r4 + 0x0e1c]
	.word 0xc0292d04  ! 372: STB_I	stb	%r0, [%r4 + 0x0d04]
! Store8_atm
	.word 0xc4710005  ! 381: STX_R	stx	%r2, [%r4 + %r5]
	.word 0xc6290005  ! 381: STB_R	stb	%r3, [%r4 + %r5]
	.word 0xc6292b44  ! 381: STB_I	stb	%r3, [%r4 + 0x0b44]
	.word 0xc6212fa0  ! 381: STW_I	stw	%r3, [%r4 + 0x0fa0]
	.word 0xec210005  ! 381: STW_R	stw	%r22, [%r4 + %r5]
	.word 0xc2290005  ! 381: STB_R	stb	%r1, [%r4 + %r5]
	.word 0xc6210005  ! 381: STW_R	stw	%r3, [%r4 + %r5]
	.word 0xec210005  ! 381: STW_R	stw	%r22, [%r4 + %r5]
	.word 0xc6e9231f  ! 381: LDSTUBA_I	ldstuba	%r3, [%r4 + 0x031f] %asi
! Store6_atm_st
	.word 0xd8710005  ! 389: STX_R	stx	%r12, [%r4 + %r5]
	.word 0xc2290005  ! 389: STB_R	stb	%r1, [%r4 + %r5]
	.word 0xc4292253  ! 389: STB_I	stb	%r2, [%r4 + 0x0253]
	.word 0xee2128b8  ! 389: STW_I	stw	%r23, [%r4 + 0x08b8]
	.word 0xd2310005  ! 389: STH_R	sth	%r9, [%r4 + %r5]
	.word 0xc6210005  ! 389: STW_R	stw	%r3, [%r4 + %r5]
	.word 0xc0f91005  ! 389: SWAPA_R	swapa	%r0, [%r4 + %r5] 0x80
	.word 0xc6310005  ! 389: STH_R	sth	%r3, [%r4 + %r5]
! Store7_atm_st
	.word 0xc0710005  ! 398: STX_R	stx	%r0, [%r4 + %r5]
	.word 0xda290005  ! 398: STB_R	stb	%r13, [%r4 + %r5]
	.word 0xce210005  ! 398: STW_R	stw	%r7, [%r4 + %r5]
	.word 0xf4210005  ! 398: STW_R	stw	%r26, [%r4 + %r5]
	.word 0xc4710005  ! 398: STX_R	stx	%r2, [%r4 + %r5]
	.word 0xfe292523  ! 398: STB_I	stb	%r31, [%r4 + 0x0523]
	.word 0xc0310005  ! 398: STH_R	sth	%r0, [%r4 + %r5]
	.word 0xc0e929ea  ! 398: LDSTUBA_I	ldstuba	%r0, [%r4 + 0x09ea] %asi
	.word 0xc2290005  ! 398: STB_R	stb	%r1, [%r4 + %r5]
! Store8_atm
	.word 0xf8710005  ! 407: STX_R	stx	%r28, [%r4 + %r5]
	.word 0xc2712f10  ! 407: STX_I	stx	%r1, [%r4 + 0x0f10]
	.word 0xee312d88  ! 407: STH_I	sth	%r23, [%r4 + 0x0d88]
	.word 0xc0210005  ! 407: STW_R	stw	%r0, [%r4 + %r5]
	.word 0xc4712bd8  ! 407: STX_I	stx	%r2, [%r4 + 0x0bd8]
	.word 0xc6212b84  ! 407: STW_I	stw	%r3, [%r4 + 0x0b84]
	.word 0xde310005  ! 407: STH_R	sth	%r15, [%r4 + %r5]
	.word 0xc07121b0  ! 407: STX_I	stx	%r0, [%r4 + 0x01b0]
	.word 0xc7f11005  ! 407: CASXA_I	casxa	[%r4] 0x80, %r5, %r3
! Store7_atm_st
	.word 0xfa710005  ! 416: STX_R	stx	%r29, [%r4 + %r5]
	.word 0xe8292932  ! 416: STB_I	stb	%r20, [%r4 + 0x0932]
	.word 0xc2712730  ! 416: STX_I	stx	%r1, [%r4 + 0x0730]
	.word 0xc2210005  ! 416: STW_R	stw	%r1, [%r4 + %r5]
	.word 0xc2310005  ! 416: STH_R	sth	%r1, [%r4 + %r5]
	.word 0xdc292afd  ! 416: STB_I	stb	%r14, [%r4 + 0x0afd]
	.word 0xc2290005  ! 416: STB_R	stb	%r1, [%r4 + %r5]
	.word 0xc2e9215d  ! 416: LDSTUBA_I	ldstuba	%r1, [%r4 + 0x015d] %asi
	.word 0xc4212f74  ! 416: STW_I	stw	%r2, [%r4 + 0x0f74]
! Store6_atm_st
	.word 0xc0710005  ! 424: STX_R	stx	%r0, [%r4 + %r5]
	.word 0xc0290005  ! 424: STB_R	stb	%r0, [%r4 + %r5]
	.word 0xc6210005  ! 424: STW_R	stw	%r3, [%r4 + %r5]
	.word 0xce710005  ! 424: STX_R	stx	%r7, [%r4 + %r5]
	.word 0xc4210005  ! 424: STW_R	stw	%r2, [%r4 + %r5]
	.word 0xc42120ac  ! 424: STW_I	stw	%r2, [%r4 + 0x00ac]
	.word 0xc0f92e18  ! 424: SWAPA_I	swapa	%r0, [%r4 + 0x0e18] %asi
	.word 0xda290005  ! 424: STB_R	stb	%r13, [%r4 + %r5]
! Store8_fpst
	.word 0xc4710005  ! 433: STX_R	stx	%r2, [%r4 + %r5]
	.word 0xc0290005  ! 433: STB_R	stb	%r0, [%r4 + %r5]
	.word 0xc4212db0  ! 433: STW_I	stw	%r2, [%r4 + 0x0db0]
	.word 0xc6710005  ! 433: STX_R	stx	%r3, [%r4 + %r5]
	.word 0xc02125a0  ! 433: STW_I	stw	%r0, [%r4 + 0x05a0]
	.word 0xc4290005  ! 433: STB_R	stb	%r2, [%r4 + %r5]
	.word 0xc4292285  ! 433: STB_I	stb	%r2, [%r4 + 0x0285]
	.word 0xd8292aa5  ! 433: STB_I	stb	%r12, [%r4 + 0x0aa5]
	.word 0xc3392fa0  ! 433: STDF_I	std	%f1, [0x0fa0, %r4]
! Store7_atm_st
	.word 0xc4710005  ! 442: STX_R	stx	%r2, [%r4 + %r5]
	.word 0xfc710005  ! 442: STX_R	stx	%r30, [%r4 + %r5]
	.word 0xc47124f8  ! 442: STX_I	stx	%r2, [%r4 + 0x04f8]
	.word 0xc0712788  ! 442: STX_I	stx	%r0, [%r4 + 0x0788]
	.word 0xe4290005  ! 442: STB_R	stb	%r18, [%r4 + %r5]
	.word 0xe8210005  ! 442: STW_R	stw	%r20, [%r4 + %r5]
	.word 0xe6710005  ! 442: STX_R	stx	%r19, [%r4 + %r5]
	.word 0xd0f91005  ! 442: SWAPA_R	swapa	%r8, [%r4 + %r5] 0x80
	.word 0xc0210005  ! 442: STW_R	stw	%r0, [%r4 + %r5]
! Store6_fpst_st
	.word 0xc0710005  ! 450: STX_R	stx	%r0, [%r4 + %r5]
	.word 0xf02922ea  ! 450: STB_I	stb	%r24, [%r4 + 0x02ea]
	.word 0xfc292816  ! 450: STB_I	stb	%r30, [%r4 + 0x0816]
	.word 0xc2290005  ! 450: STB_R	stb	%r1, [%r4 + %r5]
	.word 0xc429217d  ! 450: STB_I	stb	%r2, [%r4 + 0x017d]
	.word 0xda7123d8  ! 450: STX_I	stx	%r13, [%r4 + 0x03d8]
	.word 0xc721200c  ! 450: STF_I	st	%f3, [0x000c, %r4]
	.word 0xc2312340  ! 450: STH_I	sth	%r1, [%r4 + 0x0340]
! Store9
	.word 0xd4710005  ! 459: STX_R	stx	%r10, [%r4 + %r5]
	.word 0xc4290005  ! 459: STB_R	stb	%r2, [%r4 + %r5]
	.word 0xc4292576  ! 459: STB_I	stb	%r2, [%r4 + 0x0576]
	.word 0xc4212214  ! 459: STW_I	stw	%r2, [%r4 + 0x0214]
	.word 0xc42924a9  ! 459: STB_I	stb	%r2, [%r4 + 0x04a9]
	.word 0xc4290005  ! 459: STB_R	stb	%r2, [%r4 + %r5]
	.word 0xf27128b0  ! 459: STX_I	stx	%r25, [%r4 + 0x08b0]
	.word 0xe2210005  ! 459: STW_R	stw	%r17, [%r4 + %r5]
	.word 0xc67123c0  ! 459: STX_I	stx	%r3, [%r4 + 0x03c0]
! Store6_atm_st
	.word 0xc4710005  ! 467: STX_R	stx	%r2, [%r4 + %r5]
	.word 0xc6310005  ! 467: STH_R	sth	%r3, [%r4 + %r5]
	.word 0xc4312572  ! 467: STH_I	sth	%r2, [%r4 + 0x0572]
	.word 0xe6710005  ! 467: STX_R	stx	%r19, [%r4 + %r5]
	.word 0xc4292ecd  ! 467: STB_I	stb	%r2, [%r4 + 0x0ecd]
	.word 0xd6210005  ! 467: STW_R	stw	%r11, [%r4 + %r5]
	.word 0xc1f12005  ! 467: CASXA_R	casxa	[%r4]%asi, %r5, %r0
	.word 0xf4210005  ! 467: STW_R	stw	%r26, [%r4 + %r5]
! Store9
	.word 0xc0710005  ! 476: STX_R	stx	%r0, [%r4 + %r5]
	.word 0xee31272e  ! 476: STH_I	sth	%r23, [%r4 + 0x072e]
	.word 0xee290005  ! 476: STB_R	stb	%r23, [%r4 + %r5]
	.word 0xc27120c0  ! 476: STX_I	stx	%r1, [%r4 + 0x00c0]
	.word 0xc4710005  ! 476: STX_R	stx	%r2, [%r4 + %r5]
	.word 0xc2290005  ! 476: STB_R	stb	%r1, [%r4 + %r5]
	.word 0xc2210005  ! 476: STW_R	stw	%r1, [%r4 + %r5]
	.word 0xec312f5a  ! 476: STH_I	sth	%r22, [%r4 + 0x0f5a]
	.word 0xc0290005  ! 476: STB_R	stb	%r0, [%r4 + %r5]
! Store8_fpst
	.word 0xc6710005  ! 485: STX_R	stx	%r3, [%r4 + %r5]
	.word 0xc0710005  ! 485: STX_R	stx	%r0, [%r4 + %r5]
	.word 0xc2312996  ! 485: STH_I	sth	%r1, [%r4 + 0x0996]
	.word 0xe8710005  ! 485: STX_R	stx	%r20, [%r4 + %r5]
	.word 0xc2710005  ! 485: STX_R	stx	%r1, [%r4 + %r5]
	.word 0xc0712e48  ! 485: STX_I	stx	%r0, [%r4 + 0x0e48]
	.word 0xd0292e4a  ! 485: STB_I	stb	%r8, [%r4 + 0x0e4a]
	.word 0xc0312c88  ! 485: STH_I	sth	%r0, [%r4 + 0x0c88]
	.word 0xc3210005  ! 485: STF_R	st	%f1, [%r5, %r4]
! Store9
	.word 0xc4710005  ! 494: STX_R	stx	%r2, [%r4 + %r5]
	.word 0xf0290005  ! 494: STB_R	stb	%r24, [%r4 + %r5]
	.word 0xc4210005  ! 494: STW_R	stw	%r2, [%r4 + %r5]
	.word 0xc6712248  ! 494: STX_I	stx	%r3, [%r4 + 0x0248]
	.word 0xc6312fea  ! 494: STH_I	sth	%r3, [%r4 + 0x0fea]
	.word 0xc6290005  ! 494: STB_R	stb	%r3, [%r4 + %r5]
	.word 0xfa710005  ! 494: STX_R	stx	%r29, [%r4 + %r5]
	.word 0xc23121c6  ! 494: STH_I	sth	%r1, [%r4 + 0x01c6]
	.word 0xc4710005  ! 494: STX_R	stx	%r2, [%r4 + %r5]
        ta      T_GOOD_TRAP

th_main_3:
	setx  MAIN_BASE_DATA_VA, %r1, %r4
	setx  0x0000000000000770, %r1, %r5
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
        setx  0x80, %g2, %g1
        wr  %g1, %g0, %asi
	setx  0x755db38c0bd15875, %r1, %r1
	setx  0xe3283ceb807d7e7f, %r1, %r2
	setx  0xaffa173d6813a689, %r1, %r3
	setx  0xd9910a24121f3919, %r1, %r6
	setx  0x758c7747db317981, %r1, %r7
	setx  0x67d51cf061004e61, %r1, %r8
	setx  0x3e8ec1ec433c1991, %r1, %r9
	setx  0x675054266dc8a2e2, %r1, %r10
	setx  0x23cec111ff05329e, %r1, %r11
	setx  0xb962ca7bdeb28f42, %r1, %r12
	setx  0x3b464db073aa18e2, %r1, %r13
	setx  0xd00fc12194ad7eaa, %r1, %r14
	setx  0xcd129d0d97ea350a, %r1, %r15
	setx  0xb13e2e5d009dfcdd, %r1, %r16
	setx  0xfce9b3d08c6577fb, %r1, %r17
	setx  0x680c61d701cd871d, %r1, %r18
	setx  0x39bc25494db32197, %r1, %r19
	setx  0xee8e46b77cae612c, %r1, %r20
	setx  0x706ece2a8d1754b7, %r1, %r21
	setx  0xc1360650b12f15c4, %r1, %r22
	setx  0x47a3f5c7d38c1ee6, %r1, %r23
	setx  0x987e84187ed924ad, %r1, %r24
	setx  0x83a14cf6de499369, %r1, %r25
	setx  0xb2b35ee369d727ce, %r1, %r26
	setx  0xe81b999399d6a4f9, %r1, %r27
	setx  0x63e50205d5c34291, %r1, %r28
	setx  0x58ee817c9d5c8e7b, %r1, %r29
	setx  0x1a7cb7e6181c0aed, %r1, %r30
	setx  0x31e1268426196dc3, %r1, %r31
! Store6_atm_st
	.word 0xc2710005  ! 10: STX_R	stx	%r1, [%r4 + %r5]
	.word 0xc6312da0  ! 10: STH_I	sth	%r3, [%r4 + 0x0da0]
	.word 0xdc2125fc  ! 10: STW_I	stw	%r14, [%r4 + 0x05fc]
	.word 0xc2210005  ! 10: STW_R	stw	%r1, [%r4 + %r5]
	.word 0xc6310005  ! 10: STH_R	sth	%r3, [%r4 + %r5]
	.word 0xf4290005  ! 10: STB_R	stb	%r26, [%r4 + %r5]
	.word 0xc1e11005  ! 10: CASA_I	casa	[%r4] 0x80, %r5, %r0
	.word 0xf27123e0  ! 10: STX_I	stx	%r25, [%r4 + 0x03e0]
! Store8_atm
	.word 0xc0710005  ! 19: STX_R	stx	%r0, [%r4 + %r5]
	.word 0xc2710005  ! 19: STX_R	stx	%r1, [%r4 + %r5]
	.word 0xc0710005  ! 19: STX_R	stx	%r0, [%r4 + %r5]
	.word 0xc07123d0  ! 19: STX_I	stx	%r0, [%r4 + 0x03d0]
	.word 0xd4310005  ! 19: STH_R	sth	%r10, [%r4 + %r5]
	.word 0xc0212b10  ! 19: STW_I	stw	%r0, [%r4 + 0x0b10]
	.word 0xec290005  ! 19: STB_R	stb	%r22, [%r4 + %r5]
	.word 0xf8210005  ! 19: STW_R	stw	%r28, [%r4 + %r5]
	.word 0xf8790005  ! 19: SWAP_R	swap	%r28, [%r4 + %r5]
! Store6_fpst_st
	.word 0xe4710005  ! 27: STX_R	stx	%r18, [%r4 + %r5]
	.word 0xee312c4a  ! 27: STH_I	sth	%r23, [%r4 + 0x0c4a]
	.word 0xc6312faa  ! 27: STH_I	sth	%r3, [%r4 + 0x0faa]
	.word 0xc6710005  ! 27: STX_R	stx	%r3, [%r4 + %r5]
	.word 0xc02125c0  ! 27: STW_I	stw	%r0, [%r4 + 0x05c0]
	.word 0xc23124c4  ! 27: STH_I	sth	%r1, [%r4 + 0x04c4]
	.word 0xc5210005  ! 27: STF_R	st	%f2, [%r5, %r4]
	.word 0xc6312b80  ! 27: STH_I	sth	%r3, [%r4 + 0x0b80]
! Store6_atm_st
	.word 0xee710005  ! 35: STX_R	stx	%r23, [%r4 + %r5]
	.word 0xc4290005  ! 35: STB_R	stb	%r2, [%r4 + %r5]
	.word 0xc2710005  ! 35: STX_R	stx	%r1, [%r4 + %r5]
	.word 0xc4312d88  ! 35: STH_I	sth	%r2, [%r4 + 0x0d88]
	.word 0xc2210005  ! 35: STW_R	stw	%r1, [%r4 + %r5]
	.word 0xc4210005  ! 35: STW_R	stw	%r2, [%r4 + %r5]
	.word 0xc0e92497  ! 35: LDSTUBA_I	ldstuba	%r0, [%r4 + 0x0497] %asi
	.word 0xc43127d0  ! 35: STH_I	sth	%r2, [%r4 + 0x07d0]
! Store8
	.word 0xc0710005  ! 44: STX_R	stx	%r0, [%r4 + %r5]
	.word 0xc47124c8  ! 44: STX_I	stx	%r2, [%r4 + 0x04c8]
	.word 0xc62127e4  ! 44: STW_I	stw	%r3, [%r4 + 0x07e4]
	.word 0xc4290005  ! 44: STB_R	stb	%r2, [%r4 + %r5]
	.word 0xc4292c93  ! 44: STB_I	stb	%r2, [%r4 + 0x0c93]
	.word 0xf0292989  ! 44: STB_I	stb	%r24, [%r4 + 0x0989]
	.word 0xc4310005  ! 44: STH_R	sth	%r2, [%r4 + %r5]
	.word 0xc0290005  ! 44: STB_R	stb	%r0, [%r4 + %r5]
! Store8
	.word 0xc2710005  ! 53: STX_R	stx	%r1, [%r4 + %r5]
	.word 0xc0292ef8  ! 53: STB_I	stb	%r0, [%r4 + 0x0ef8]
	.word 0xc0210005  ! 53: STW_R	stw	%r0, [%r4 + %r5]
	.word 0xc4292e11  ! 53: STB_I	stb	%r2, [%r4 + 0x0e11]
	.word 0xee710005  ! 53: STX_R	stx	%r23, [%r4 + %r5]
	.word 0xd0710005  ! 53: STX_R	stx	%r8, [%r4 + %r5]
	.word 0xc6712a18  ! 53: STX_I	stx	%r3, [%r4 + 0x0a18]
	.word 0xc2212dac  ! 53: STW_I	stw	%r1, [%r4 + 0x0dac]
! Store9
	.word 0xfc710005  ! 62: STX_R	stx	%r30, [%r4 + %r5]
	.word 0xc4310005  ! 62: STH_R	sth	%r2, [%r4 + %r5]
	.word 0xc67128d8  ! 62: STX_I	stx	%r3, [%r4 + 0x08d8]
	.word 0xc0712600  ! 62: STX_I	stx	%r0, [%r4 + 0x0600]
	.word 0xd6290005  ! 62: STB_R	stb	%r11, [%r4 + %r5]
	.word 0xd831245c  ! 62: STH_I	sth	%r12, [%r4 + 0x045c]
	.word 0xc6312902  ! 62: STH_I	sth	%r3, [%r4 + 0x0902]
	.word 0xc029239c  ! 62: STB_I	stb	%r0, [%r4 + 0x039c]
	.word 0xc0210005  ! 62: STW_R	stw	%r0, [%r4 + %r5]
! Store8_fpst
	.word 0xc2710005  ! 71: STX_R	stx	%r1, [%r4 + %r5]
	.word 0xc6310005  ! 71: STH_R	sth	%r3, [%r4 + %r5]
	.word 0xc4292c62  ! 71: STB_I	stb	%r2, [%r4 + 0x0c62]
	.word 0xc6292fc8  ! 71: STB_I	stb	%r3, [%r4 + 0x0fc8]
	.word 0xc0290005  ! 71: STB_R	stb	%r0, [%r4 + %r5]
	.word 0xc6312e3e  ! 71: STH_I	sth	%r3, [%r4 + 0x0e3e]
	.word 0xdc710005  ! 71: STX_R	stx	%r14, [%r4 + %r5]
	.word 0xe0712778  ! 71: STX_I	stx	%r16, [%r4 + 0x0778]
	.word 0xcd2128c4  ! 71: STF_I	st	%f6, [0x08c4, %r4]
! Store6_atm_st
	.word 0xc6710005  ! 79: STX_R	stx	%r3, [%r4 + %r5]
	.word 0xc6712c08  ! 79: STX_I	stx	%r3, [%r4 + 0x0c08]
	.word 0xc0210005  ! 79: STW_R	stw	%r0, [%r4 + %r5]
	.word 0xe0312354  ! 79: STH_I	sth	%r16, [%r4 + 0x0354]
	.word 0xc2712c68  ! 79: STX_I	stx	%r1, [%r4 + 0x0c68]
	.word 0xc6310005  ! 79: STH_R	sth	%r3, [%r4 + %r5]
	.word 0xf7f12005  ! 79: CASXA_R	casxa	[%r4]%asi, %r5, %r27
	.word 0xe0212cac  ! 79: STW_I	stw	%r16, [%r4 + 0x0cac]
! Store8
	.word 0xc2710005  ! 88: STX_R	stx	%r1, [%r4 + %r5]
	.word 0xe8310005  ! 88: STH_R	sth	%r20, [%r4 + %r5]
	.word 0xea710005  ! 88: STX_R	stx	%r21, [%r4 + %r5]
	.word 0xc2310005  ! 88: STH_R	sth	%r1, [%r4 + %r5]
	.word 0xc0290005  ! 88: STB_R	stb	%r0, [%r4 + %r5]
	.word 0xc6290005  ! 88: STB_R	stb	%r3, [%r4 + %r5]
	.word 0xc4310005  ! 88: STH_R	sth	%r2, [%r4 + %r5]
	.word 0xc0310005  ! 88: STH_R	sth	%r0, [%r4 + %r5]
! Store8_atm
	.word 0xc4710005  ! 97: STX_R	stx	%r2, [%r4 + %r5]
	.word 0xc23122fe  ! 97: STH_I	sth	%r1, [%r4 + 0x02fe]
	.word 0xc03128b8  ! 97: STH_I	sth	%r0, [%r4 + 0x08b8]
	.word 0xc4292ceb  ! 97: STB_I	stb	%r2, [%r4 + 0x0ceb]
	.word 0xc4292d42  ! 97: STB_I	stb	%r2, [%r4 + 0x0d42]
	.word 0xc631288a  ! 97: STH_I	sth	%r3, [%r4 + 0x088a]
	.word 0xea2126c0  ! 97: STW_I	stw	%r21, [%r4 + 0x06c0]
	.word 0xc0212654  ! 97: STW_I	stw	%r0, [%r4 + 0x0654]
	.word 0xc1e12005  ! 97: CASA_R	casa	[%r4] %asi, %r5, %r0
! Store8_atm
	.word 0xfc710005  ! 106: STX_R	stx	%r30, [%r4 + %r5]
	.word 0xc4312312  ! 106: STH_I	sth	%r2, [%r4 + 0x0312]
	.word 0xe6712ef0  ! 106: STX_I	stx	%r19, [%r4 + 0x0ef0]
	.word 0xec3126ca  ! 106: STH_I	sth	%r22, [%r4 + 0x06ca]
	.word 0xc4312a78  ! 106: STH_I	sth	%r2, [%r4 + 0x0a78]
	.word 0xc6710005  ! 106: STX_R	stx	%r3, [%r4 + %r5]
	.word 0xe2312630  ! 106: STH_I	sth	%r17, [%r4 + 0x0630]
	.word 0xc4290005  ! 106: STB_R	stb	%r2, [%r4 + %r5]
	.word 0xd4792afc  ! 106: SWAP_I	swap	%r10, [%r4 + 0x0afc]
! Store6_fpst_st
	.word 0xec710005  ! 114: STX_R	stx	%r22, [%r4 + %r5]
	.word 0xce290005  ! 114: STB_R	stb	%r7, [%r4 + %r5]
	.word 0xc0292d41  ! 114: STB_I	stb	%r0, [%r4 + 0x0d41]
	.word 0xc6312b7e  ! 114: STH_I	sth	%r3, [%r4 + 0x0b7e]
	.word 0xf629275c  ! 114: STB_I	stb	%r27, [%r4 + 0x075c]
	.word 0xfc312fca  ! 114: STH_I	sth	%r30, [%r4 + 0x0fca]
	.word 0xc7210005  ! 114: STF_R	st	%f3, [%r5, %r4]
	.word 0xc4710005  ! 114: STX_R	stx	%r2, [%r4 + %r5]
! Store6_atm_st
	.word 0xc2710005  ! 122: STX_R	stx	%r1, [%r4 + %r5]
	.word 0xc6290005  ! 122: STB_R	stb	%r3, [%r4 + %r5]
	.word 0xc6290005  ! 122: STB_R	stb	%r3, [%r4 + %r5]
	.word 0xc0712fb8  ! 122: STX_I	stx	%r0, [%r4 + 0x0fb8]
	.word 0xc0290005  ! 122: STB_R	stb	%r0, [%r4 + %r5]
	.word 0xde290005  ! 122: STB_R	stb	%r15, [%r4 + %r5]
	.word 0xc5e11005  ! 122: CASA_I	casa	[%r4] 0x80, %r5, %r2
	.word 0xd8712ff0  ! 122: STX_I	stx	%r12, [%r4 + 0x0ff0]
! Store8_fpst
	.word 0xd2710005  ! 131: STX_R	stx	%r9, [%r4 + %r5]
	.word 0xc67125c0  ! 131: STX_I	stx	%r3, [%r4 + 0x05c0]
	.word 0xf47124e0  ! 131: STX_I	stx	%r26, [%r4 + 0x04e0]
	.word 0xea292d7c  ! 131: STB_I	stb	%r21, [%r4 + 0x0d7c]
	.word 0xf4310005  ! 131: STH_R	sth	%r26, [%r4 + %r5]
	.word 0xc2310005  ! 131: STH_R	sth	%r1, [%r4 + %r5]
	.word 0xc4290005  ! 131: STB_R	stb	%r2, [%r4 + %r5]
	.word 0xfe292276  ! 131: STB_I	stb	%r31, [%r4 + 0x0276]
	.word 0xd721224c  ! 131: STF_I	st	%f11, [0x024c, %r4]
! Store8_fpst
	.word 0xc6710005  ! 140: STX_R	stx	%r3, [%r4 + %r5]
	.word 0xc6310005  ! 140: STH_R	sth	%r3, [%r4 + %r5]
	.word 0xc2212b68  ! 140: STW_I	stw	%r1, [%r4 + 0x0b68]
	.word 0xc2712618  ! 140: STX_I	stx	%r1, [%r4 + 0x0618]
	.word 0xc0210005  ! 140: STW_R	stw	%r0, [%r4 + %r5]
	.word 0xd6290005  ! 140: STB_R	stb	%r11, [%r4 + %r5]
	.word 0xc4290005  ! 140: STB_R	stb	%r2, [%r4 + %r5]
	.word 0xc0290005  ! 140: STB_R	stb	%r0, [%r4 + %r5]
	.word 0xc5392bb8  ! 140: STDF_I	std	%f2, [0x0bb8, %r4]
! Store6_atm_st
	.word 0xea710005  ! 148: STX_R	stx	%r21, [%r4 + %r5]
	.word 0xd8212588  ! 148: STW_I	stw	%r12, [%r4 + 0x0588]
	.word 0xde310005  ! 148: STH_R	sth	%r15, [%r4 + %r5]
	.word 0xee310005  ! 148: STH_R	sth	%r23, [%r4 + %r5]
	.word 0xc4210005  ! 148: STW_R	stw	%r2, [%r4 + %r5]
	.word 0xc0310005  ! 148: STH_R	sth	%r0, [%r4 + %r5]
	.word 0xc0e91005  ! 148: LDSTUBA_R	ldstuba	%r0, [%r4 + %r5] 0x80
	.word 0xce710005  ! 148: STX_R	stx	%r7, [%r4 + %r5]
! Store9
	.word 0xc2710005  ! 157: STX_R	stx	%r1, [%r4 + %r5]
	.word 0xc0290005  ! 157: STB_R	stb	%r0, [%r4 + %r5]
	.word 0xc4310005  ! 157: STH_R	sth	%r2, [%r4 + %r5]
	.word 0xc6212788  ! 157: STW_I	stw	%r3, [%r4 + 0x0788]
	.word 0xc2292744  ! 157: STB_I	stb	%r1, [%r4 + 0x0744]
	.word 0xc4312ff2  ! 157: STH_I	sth	%r2, [%r4 + 0x0ff2]
	.word 0xdc710005  ! 157: STX_R	stx	%r14, [%r4 + %r5]
	.word 0xc0710005  ! 157: STX_R	stx	%r0, [%r4 + %r5]
	.word 0xc6710005  ! 157: STX_R	stx	%r3, [%r4 + %r5]
! Store9
	.word 0xc2710005  ! 166: STX_R	stx	%r1, [%r4 + %r5]
	.word 0xc2712190  ! 166: STX_I	stx	%r1, [%r4 + 0x0190]
	.word 0xee710005  ! 166: STX_R	stx	%r23, [%r4 + %r5]
	.word 0xc2312420  ! 166: STH_I	sth	%r1, [%r4 + 0x0420]
	.word 0xc63121f2  ! 166: STH_I	sth	%r3, [%r4 + 0x01f2]
	.word 0xc4712c00  ! 166: STX_I	stx	%r2, [%r4 + 0x0c00]
	.word 0xc221277c  ! 166: STW_I	stw	%r1, [%r4 + 0x077c]
	.word 0xc2210005  ! 166: STW_R	stw	%r1, [%r4 + %r5]
	.word 0xc63129fe  ! 166: STH_I	sth	%r3, [%r4 + 0x09fe]
! Store7_atm_st
	.word 0xc4710005  ! 175: STX_R	stx	%r2, [%r4 + %r5]
	.word 0xc0210005  ! 175: STW_R	stw	%r0, [%r4 + %r5]
	.word 0xc4310005  ! 175: STH_R	sth	%r2, [%r4 + %r5]
	.word 0xc0712cd8  ! 175: STX_I	stx	%r0, [%r4 + 0x0cd8]
	.word 0xc4710005  ! 175: STX_R	stx	%r2, [%r4 + %r5]
	.word 0xd2312a42  ! 175: STH_I	sth	%r9, [%r4 + 0x0a42]
	.word 0xc0210005  ! 175: STW_R	stw	%r0, [%r4 + %r5]
	.word 0xdbe11005  ! 175: CASA_I	casa	[%r4] 0x80, %r5, %r13
	.word 0xc2212ff4  ! 175: STW_I	stw	%r1, [%r4 + 0x0ff4]
! Store6_fpst_st
	.word 0xe6710005  ! 183: STX_R	stx	%r19, [%r4 + %r5]
	.word 0xc6292f5c  ! 183: STB_I	stb	%r3, [%r4 + 0x0f5c]
	.word 0xf0212508  ! 183: STW_I	stw	%r24, [%r4 + 0x0508]
	.word 0xcc710005  ! 183: STX_R	stx	%r6, [%r4 + %r5]
	.word 0xc0712728  ! 183: STX_I	stx	%r0, [%r4 + 0x0728]
	.word 0xee2124bc  ! 183: STW_I	stw	%r23, [%r4 + 0x04bc]
	.word 0xc3212840  ! 183: STF_I	st	%f1, [0x0840, %r4]
	.word 0xc629216e  ! 183: STB_I	stb	%r3, [%r4 + 0x016e]
! Store6_fpst_st
	.word 0xc4710005  ! 191: STX_R	stx	%r2, [%r4 + %r5]
	.word 0xf07120c8  ! 191: STX_I	stx	%r24, [%r4 + 0x00c8]
	.word 0xf2212488  ! 191: STW_I	stw	%r25, [%r4 + 0x0488]
	.word 0xc4292c76  ! 191: STB_I	stb	%r2, [%r4 + 0x0c76]
	.word 0xc6710005  ! 191: STX_R	stx	%r3, [%r4 + %r5]
	.word 0xc631246e  ! 191: STH_I	sth	%r3, [%r4 + 0x046e]
	.word 0xc5212f28  ! 191: STF_I	st	%f2, [0x0f28, %r4]
	.word 0xc0712b78  ! 191: STX_I	stx	%r0, [%r4 + 0x0b78]
! Store6_atm_st
	.word 0xf2710005  ! 199: STX_R	stx	%r25, [%r4 + %r5]
	.word 0xc4212364  ! 199: STW_I	stw	%r2, [%r4 + 0x0364]
	.word 0xc4210005  ! 199: STW_R	stw	%r2, [%r4 + %r5]
	.word 0xf43128be  ! 199: STH_I	sth	%r26, [%r4 + 0x08be]
	.word 0xde310005  ! 199: STH_R	sth	%r15, [%r4 + %r5]
	.word 0xc6212bec  ! 199: STW_I	stw	%r3, [%r4 + 0x0bec]
	.word 0xc67927f0  ! 199: SWAP_I	swap	%r3, [%r4 + 0x07f0]
	.word 0xc6290005  ! 199: STB_R	stb	%r3, [%r4 + %r5]
! Store8_fpst
	.word 0xc0710005  ! 208: STX_R	stx	%r0, [%r4 + %r5]
	.word 0xc43121c2  ! 208: STH_I	sth	%r2, [%r4 + 0x01c2]
	.word 0xfe21225c  ! 208: STW_I	stw	%r31, [%r4 + 0x025c]
	.word 0xdc312e76  ! 208: STH_I	sth	%r14, [%r4 + 0x0e76]
	.word 0xd2290005  ! 208: STB_R	stb	%r9, [%r4 + %r5]
	.word 0xc6710005  ! 208: STX_R	stx	%r3, [%r4 + %r5]
	.word 0xc0292c16  ! 208: STB_I	stb	%r0, [%r4 + 0x0c16]
	.word 0xdc712060  ! 208: STX_I	stx	%r14, [%r4 + 0x0060]
	.word 0xc3210005  ! 208: STF_R	st	%f1, [%r5, %r4]
! Store6_fpst_st
	.word 0xc4710005  ! 216: STX_R	stx	%r2, [%r4 + %r5]
	.word 0xc2210005  ! 216: STW_R	stw	%r1, [%r4 + %r5]
	.word 0xd8710005  ! 216: STX_R	stx	%r12, [%r4 + %r5]
	.word 0xc231228a  ! 216: STH_I	sth	%r1, [%r4 + 0x028a]
	.word 0xdc710005  ! 216: STX_R	stx	%r14, [%r4 + %r5]
	.word 0xc4312f90  ! 216: STH_I	sth	%r2, [%r4 + 0x0f90]
	.word 0xe9392e30  ! 216: STDF_I	std	%f20, [0x0e30, %r4]
	.word 0xc6312774  ! 216: STH_I	sth	%r3, [%r4 + 0x0774]
! Store6_atm_st
	.word 0xf2710005  ! 224: STX_R	stx	%r25, [%r4 + %r5]
	.word 0xc43129b0  ! 224: STH_I	sth	%r2, [%r4 + 0x09b0]
	.word 0xfa212eb0  ! 224: STW_I	stw	%r29, [%r4 + 0x0eb0]
	.word 0xc0710005  ! 224: STX_R	stx	%r0, [%r4 + %r5]
	.word 0xf2212728  ! 224: STW_I	stw	%r25, [%r4 + 0x0728]
	.word 0xd4290005  ! 224: STB_R	stb	%r10, [%r4 + %r5]
	.word 0xc2e91005  ! 224: LDSTUBA_R	ldstuba	%r1, [%r4 + %r5] 0x80
	.word 0xc62924a0  ! 224: STB_I	stb	%r3, [%r4 + 0x04a0]
! Store6_atm_st
	.word 0xe0710005  ! 232: STX_R	stx	%r16, [%r4 + %r5]
	.word 0xc4292213  ! 232: STB_I	stb	%r2, [%r4 + 0x0213]
	.word 0xc6292e89  ! 232: STB_I	stb	%r3, [%r4 + 0x0e89]
	.word 0xc4290005  ! 232: STB_R	stb	%r2, [%r4 + %r5]
	.word 0xce31284e  ! 232: STH_I	sth	%r7, [%r4 + 0x084e]
	.word 0xc2310005  ! 232: STH_R	sth	%r1, [%r4 + %r5]
	.word 0xd7f12005  ! 232: CASXA_R	casxa	[%r4]%asi, %r5, %r11
	.word 0xc03122d6  ! 232: STH_I	sth	%r0, [%r4 + 0x02d6]
! Store6_fpst_st
	.word 0xc6710005  ! 240: STX_R	stx	%r3, [%r4 + %r5]
	.word 0xc6712820  ! 240: STX_I	stx	%r3, [%r4 + 0x0820]
	.word 0xc4210005  ! 240: STW_R	stw	%r2, [%r4 + %r5]
	.word 0xc22929bb  ! 240: STB_I	stb	%r1, [%r4 + 0x09bb]
	.word 0xc2310005  ! 240: STH_R	sth	%r1, [%r4 + %r5]
	.word 0xc0310005  ! 240: STH_R	sth	%r0, [%r4 + %r5]
	.word 0xc3390005  ! 240: STDF_R	std	%f1, [%r5, %r4]
	.word 0xc2292318  ! 240: STB_I	stb	%r1, [%r4 + 0x0318]
! Store8_atm
	.word 0xc0710005  ! 249: STX_R	stx	%r0, [%r4 + %r5]
	.word 0xf6310005  ! 249: STH_R	sth	%r27, [%r4 + %r5]
	.word 0xd2310005  ! 249: STH_R	sth	%r9, [%r4 + %r5]
	.word 0xc6292df1  ! 249: STB_I	stb	%r3, [%r4 + 0x0df1]
	.word 0xc4290005  ! 249: STB_R	stb	%r2, [%r4 + %r5]
	.word 0xc22923bb  ! 249: STB_I	stb	%r1, [%r4 + 0x03bb]
	.word 0xc6712558  ! 249: STX_I	stx	%r3, [%r4 + 0x0558]
	.word 0xc42122ac  ! 249: STW_I	stw	%r2, [%r4 + 0x02ac]
	.word 0xc4790005  ! 249: SWAP_R	swap	%r2, [%r4 + %r5]
! Store7_atm_st
	.word 0xc6710005  ! 258: STX_R	stx	%r3, [%r4 + %r5]
	.word 0xc2310005  ! 258: STH_R	sth	%r1, [%r4 + %r5]
	.word 0xc0210005  ! 258: STW_R	stw	%r0, [%r4 + %r5]
	.word 0xc2210005  ! 258: STW_R	stw	%r1, [%r4 + %r5]
	.word 0xe4210005  ! 258: STW_R	stw	%r18, [%r4 + %r5]
	.word 0xc0212e14  ! 258: STW_I	stw	%r0, [%r4 + 0x0e14]
	.word 0xc2312816  ! 258: STH_I	sth	%r1, [%r4 + 0x0816]
	.word 0xc6f924d0  ! 258: SWAPA_I	swapa	%r3, [%r4 + 0x04d0] %asi
	.word 0xea210005  ! 258: STW_R	stw	%r21, [%r4 + %r5]
! Store7_atm_st
	.word 0xc4710005  ! 267: STX_R	stx	%r2, [%r4 + %r5]
	.word 0xc4210005  ! 267: STW_R	stw	%r2, [%r4 + %r5]
	.word 0xc2212d9c  ! 267: STW_I	stw	%r1, [%r4 + 0x0d9c]
	.word 0xc4212bbc  ! 267: STW_I	stw	%r2, [%r4 + 0x0bbc]
	.word 0xde310005  ! 267: STH_R	sth	%r15, [%r4 + %r5]
	.word 0xfc310005  ! 267: STH_R	sth	%r30, [%r4 + %r5]
	.word 0xee2121b4  ! 267: STW_I	stw	%r23, [%r4 + 0x01b4]
	.word 0xc3f11005  ! 267: CASXA_I	casxa	[%r4] 0x80, %r5, %r1
	.word 0xc0210005  ! 267: STW_R	stw	%r0, [%r4 + %r5]
! Store8_fpst
	.word 0xe2710005  ! 276: STX_R	stx	%r17, [%r4 + %r5]
	.word 0xe4212588  ! 276: STW_I	stw	%r18, [%r4 + 0x0588]
	.word 0xc2712338  ! 276: STX_I	stx	%r1, [%r4 + 0x0338]
	.word 0xc6210005  ! 276: STW_R	stw	%r3, [%r4 + %r5]
	.word 0xc2712730  ! 276: STX_I	stx	%r1, [%r4 + 0x0730]
	.word 0xc2290005  ! 276: STB_R	stb	%r1, [%r4 + %r5]
	.word 0xea210005  ! 276: STW_R	stw	%r21, [%r4 + %r5]
	.word 0xf4290005  ! 276: STB_R	stb	%r26, [%r4 + %r5]
	.word 0xe9212a24  ! 276: STF_I	st	%f20, [0x0a24, %r4]
! Store8
	.word 0xe6710005  ! 285: STX_R	stx	%r19, [%r4 + %r5]
	.word 0xc2290005  ! 285: STB_R	stb	%r1, [%r4 + %r5]
	.word 0xf2292845  ! 285: STB_I	stb	%r25, [%r4 + 0x0845]
	.word 0xc42120c4  ! 285: STW_I	stw	%r2, [%r4 + 0x00c4]
	.word 0xc0212998  ! 285: STW_I	stw	%r0, [%r4 + 0x0998]
	.word 0xea290005  ! 285: STB_R	stb	%r21, [%r4 + %r5]
	.word 0xc6710005  ! 285: STX_R	stx	%r3, [%r4 + %r5]
	.word 0xe82125bc  ! 285: STW_I	stw	%r20, [%r4 + 0x05bc]
! Store6_atm_st
	.word 0xc6710005  ! 293: STX_R	stx	%r3, [%r4 + %r5]
	.word 0xd229298a  ! 293: STB_I	stb	%r9, [%r4 + 0x098a]
	.word 0xc0290005  ! 293: STB_R	stb	%r0, [%r4 + %r5]
	.word 0xda290005  ! 293: STB_R	stb	%r13, [%r4 + %r5]
	.word 0xc4210005  ! 293: STW_R	stw	%r2, [%r4 + %r5]
	.word 0xc0212208  ! 293: STW_I	stw	%r0, [%r4 + 0x0208]
	.word 0xc3e11005  ! 293: CASA_I	casa	[%r4] 0x80, %r5, %r1
	.word 0xc6290005  ! 293: STB_R	stb	%r3, [%r4 + %r5]
! Store9
	.word 0xe0710005  ! 302: STX_R	stx	%r16, [%r4 + %r5]
	.word 0xc0212310  ! 302: STW_I	stw	%r0, [%r4 + 0x0310]
	.word 0xc2710005  ! 302: STX_R	stx	%r1, [%r4 + %r5]
	.word 0xd4710005  ! 302: STX_R	stx	%r10, [%r4 + %r5]
	.word 0xc4712c90  ! 302: STX_I	stx	%r2, [%r4 + 0x0c90]
	.word 0xc6712aa0  ! 302: STX_I	stx	%r3, [%r4 + 0x0aa0]
	.word 0xc6712bc8  ! 302: STX_I	stx	%r3, [%r4 + 0x0bc8]
	.word 0xc4312964  ! 302: STH_I	sth	%r2, [%r4 + 0x0964]
	.word 0xc2712780  ! 302: STX_I	stx	%r1, [%r4 + 0x0780]
! Store7_atm_st
	.word 0xc4710005  ! 311: STX_R	stx	%r2, [%r4 + %r5]
	.word 0xc2210005  ! 311: STW_R	stw	%r1, [%r4 + %r5]
	.word 0xc6712e98  ! 311: STX_I	stx	%r3, [%r4 + 0x0e98]
	.word 0xc2712b58  ! 311: STX_I	stx	%r1, [%r4 + 0x0b58]
	.word 0xc0210005  ! 311: STW_R	stw	%r0, [%r4 + %r5]
	.word 0xda290005  ! 311: STB_R	stb	%r13, [%r4 + %r5]
	.word 0xde310005  ! 311: STH_R	sth	%r15, [%r4 + %r5]
	.word 0xdee91005  ! 311: LDSTUBA_R	ldstuba	%r15, [%r4 + %r5] 0x80
	.word 0xc4710005  ! 311: STX_R	stx	%r2, [%r4 + %r5]
! Store7_fpst_st
	.word 0xf8710005  ! 320: STX_R	stx	%r28, [%r4 + %r5]
	.word 0xc631264c  ! 320: STH_I	sth	%r3, [%r4 + 0x064c]
	.word 0xc4312052  ! 320: STH_I	sth	%r2, [%r4 + 0x0052]
	.word 0xce712c80  ! 320: STX_I	stx	%r7, [%r4 + 0x0c80]
	.word 0xc0290005  ! 320: STB_R	stb	%r0, [%r4 + %r5]
	.word 0xf0210005  ! 320: STW_R	stw	%r24, [%r4 + %r5]
	.word 0xc0210005  ! 320: STW_R	stw	%r0, [%r4 + %r5]
	.word 0xc1390005  ! 320: STDF_R	std	%f0, [%r5, %r4]
	.word 0xd8712938  ! 320: STX_I	stx	%r12, [%r4 + 0x0938]
! Store6_fpst_st
	.word 0xee710005  ! 328: STX_R	stx	%r23, [%r4 + %r5]
	.word 0xc6212c94  ! 328: STW_I	stw	%r3, [%r4 + 0x0c94]
	.word 0xc6310005  ! 328: STH_R	sth	%r3, [%r4 + %r5]
	.word 0xd6310005  ! 328: STH_R	sth	%r11, [%r4 + %r5]
	.word 0xce210005  ! 328: STW_R	stw	%r7, [%r4 + %r5]
	.word 0xd6710005  ! 328: STX_R	stx	%r11, [%r4 + %r5]
	.word 0xff390005  ! 328: STDF_R	std	%f31, [%r5, %r4]
	.word 0xc6290005  ! 328: STB_R	stb	%r3, [%r4 + %r5]
! Store6_atm_st
	.word 0xc2710005  ! 336: STX_R	stx	%r1, [%r4 + %r5]
	.word 0xc0712670  ! 336: STX_I	stx	%r0, [%r4 + 0x0670]
	.word 0xd6210005  ! 336: STW_R	stw	%r11, [%r4 + %r5]
	.word 0xc2210005  ! 336: STW_R	stw	%r1, [%r4 + %r5]
	.word 0xd0310005  ! 336: STH_R	sth	%r8, [%r4 + %r5]
	.word 0xc031235c  ! 336: STH_I	sth	%r0, [%r4 + 0x035c]
	.word 0xc1f11005  ! 336: CASXA_I	casxa	[%r4] 0x80, %r5, %r0
	.word 0xc62120c0  ! 336: STW_I	stw	%r3, [%r4 + 0x00c0]
! Store8_atm
	.word 0xc2710005  ! 345: STX_R	stx	%r1, [%r4 + %r5]
	.word 0xc6312fa4  ! 345: STH_I	sth	%r3, [%r4 + 0x0fa4]
	.word 0xc2710005  ! 345: STX_R	stx	%r1, [%r4 + %r5]
	.word 0xe22929c3  ! 345: STB_I	stb	%r17, [%r4 + 0x09c3]
	.word 0xc62920a8  ! 345: STB_I	stb	%r3, [%r4 + 0x00a8]
	.word 0xc2210005  ! 345: STW_R	stw	%r1, [%r4 + %r5]
	.word 0xcc710005  ! 345: STX_R	stx	%r6, [%r4 + %r5]
	.word 0xc231204a  ! 345: STH_I	sth	%r1, [%r4 + 0x004a]
	.word 0xc3e12005  ! 345: CASA_R	casa	[%r4] %asi, %r5, %r1
! Store8_fpst
	.word 0xc2710005  ! 354: STX_R	stx	%r1, [%r4 + %r5]
	.word 0xee712fd0  ! 354: STX_I	stx	%r23, [%r4 + 0x0fd0]
	.word 0xc6712ea0  ! 354: STX_I	stx	%r3, [%r4 + 0x0ea0]
	.word 0xd4710005  ! 354: STX_R	stx	%r10, [%r4 + %r5]
	.word 0xc0710005  ! 354: STX_R	stx	%r0, [%r4 + %r5]
	.word 0xd0310005  ! 354: STH_R	sth	%r8, [%r4 + %r5]
	.word 0xc4210005  ! 354: STW_R	stw	%r2, [%r4 + %r5]
	.word 0xc2710005  ! 354: STX_R	stx	%r1, [%r4 + %r5]
	.word 0xd3392ac0  ! 354: STDF_I	std	%f9, [0x0ac0, %r4]
! Store8
	.word 0xc6710005  ! 363: STX_R	stx	%r3, [%r4 + %r5]
	.word 0xf8310005  ! 363: STH_R	sth	%r28, [%r4 + %r5]
	.word 0xd0712888  ! 363: STX_I	stx	%r8, [%r4 + 0x0888]
	.word 0xc22123ac  ! 363: STW_I	stw	%r1, [%r4 + 0x03ac]
	.word 0xc6292a5c  ! 363: STB_I	stb	%r3, [%r4 + 0x0a5c]
	.word 0xc2310005  ! 363: STH_R	sth	%r1, [%r4 + %r5]
	.word 0xc2712c10  ! 363: STX_I	stx	%r1, [%r4 + 0x0c10]
	.word 0xc2290005  ! 363: STB_R	stb	%r1, [%r4 + %r5]
! Store8
	.word 0xc2710005  ! 372: STX_R	stx	%r1, [%r4 + %r5]
	.word 0xc0312e10  ! 372: STH_I	sth	%r0, [%r4 + 0x0e10]
	.word 0xe8290005  ! 372: STB_R	stb	%r20, [%r4 + %r5]
	.word 0xc6312efa  ! 372: STH_I	sth	%r3, [%r4 + 0x0efa]
	.word 0xc6712de8  ! 372: STX_I	stx	%r3, [%r4 + 0x0de8]
	.word 0xc6210005  ! 372: STW_R	stw	%r3, [%r4 + %r5]
	.word 0xc22125c4  ! 372: STW_I	stw	%r1, [%r4 + 0x05c4]
	.word 0xc0292d1e  ! 372: STB_I	stb	%r0, [%r4 + 0x0d1e]
! Store8_atm
	.word 0xc6710005  ! 381: STX_R	stx	%r3, [%r4 + %r5]
	.word 0xf6290005  ! 381: STB_R	stb	%r27, [%r4 + %r5]
	.word 0xc42923cb  ! 381: STB_I	stb	%r2, [%r4 + 0x03cb]
	.word 0xee212058  ! 381: STW_I	stw	%r23, [%r4 + 0x0058]
	.word 0xf0210005  ! 381: STW_R	stw	%r24, [%r4 + %r5]
	.word 0xe6290005  ! 381: STB_R	stb	%r19, [%r4 + %r5]
	.word 0xc2210005  ! 381: STW_R	stw	%r1, [%r4 + %r5]
	.word 0xc4210005  ! 381: STW_R	stw	%r2, [%r4 + %r5]
	.word 0xc6e92a3c  ! 381: LDSTUBA_I	ldstuba	%r3, [%r4 + 0x0a3c] %asi
! Store6_atm_st
	.word 0xc2710005  ! 389: STX_R	stx	%r1, [%r4 + %r5]
	.word 0xc6290005  ! 389: STB_R	stb	%r3, [%r4 + %r5]
	.word 0xc2292d49  ! 389: STB_I	stb	%r1, [%r4 + 0x0d49]
	.word 0xc42129c4  ! 389: STW_I	stw	%r2, [%r4 + 0x09c4]
	.word 0xc6310005  ! 389: STH_R	sth	%r3, [%r4 + %r5]
	.word 0xc0210005  ! 389: STW_R	stw	%r0, [%r4 + %r5]
	.word 0xc4f91005  ! 389: SWAPA_R	swapa	%r2, [%r4 + %r5] 0x80
	.word 0xc0310005  ! 389: STH_R	sth	%r0, [%r4 + %r5]
! Store7_atm_st
	.word 0xc4710005  ! 398: STX_R	stx	%r2, [%r4 + %r5]
	.word 0xc0290005  ! 398: STB_R	stb	%r0, [%r4 + %r5]
	.word 0xcc210005  ! 398: STW_R	stw	%r6, [%r4 + %r5]
	.word 0xc6210005  ! 398: STW_R	stw	%r3, [%r4 + %r5]
	.word 0xc2710005  ! 398: STX_R	stx	%r1, [%r4 + %r5]
	.word 0xe229214b  ! 398: STB_I	stb	%r17, [%r4 + 0x014b]
	.word 0xc0310005  ! 398: STH_R	sth	%r0, [%r4 + %r5]
	.word 0xc0e92a14  ! 398: LDSTUBA_I	ldstuba	%r0, [%r4 + 0x0a14] %asi
	.word 0xc2290005  ! 398: STB_R	stb	%r1, [%r4 + %r5]
! Store8_atm
	.word 0xc6710005  ! 407: STX_R	stx	%r3, [%r4 + %r5]
	.word 0xc2712cd0  ! 407: STX_I	stx	%r1, [%r4 + 0x0cd0]
	.word 0xd4312106  ! 407: STH_I	sth	%r10, [%r4 + 0x0106]
	.word 0xd4210005  ! 407: STW_R	stw	%r10, [%r4 + %r5]
	.word 0xc67125b8  ! 407: STX_I	stx	%r3, [%r4 + 0x05b8]
	.word 0xe8212c60  ! 407: STW_I	stw	%r20, [%r4 + 0x0c60]
	.word 0xc6310005  ! 407: STH_R	sth	%r3, [%r4 + %r5]
	.word 0xc0712120  ! 407: STX_I	stx	%r0, [%r4 + 0x0120]
	.word 0xcdf11005  ! 407: CASXA_I	casxa	[%r4] 0x80, %r5, %r6
! Store7_atm_st
	.word 0xc4710005  ! 416: STX_R	stx	%r2, [%r4 + %r5]
	.word 0xc6292086  ! 416: STB_I	stb	%r3, [%r4 + 0x0086]
	.word 0xc6712f88  ! 416: STX_I	stx	%r3, [%r4 + 0x0f88]
	.word 0xc6210005  ! 416: STW_R	stw	%r3, [%r4 + %r5]
	.word 0xf4310005  ! 416: STH_R	sth	%r26, [%r4 + %r5]
	.word 0xc2292d84  ! 416: STB_I	stb	%r1, [%r4 + 0x0d84]
	.word 0xc2290005  ! 416: STB_R	stb	%r1, [%r4 + %r5]
	.word 0xf8e926a6  ! 416: LDSTUBA_I	ldstuba	%r28, [%r4 + 0x06a6] %asi
	.word 0xf4212a48  ! 416: STW_I	stw	%r26, [%r4 + 0x0a48]
! Store6_atm_st
	.word 0xce710005  ! 424: STX_R	stx	%r7, [%r4 + %r5]
	.word 0xc0290005  ! 424: STB_R	stb	%r0, [%r4 + %r5]
	.word 0xc4210005  ! 424: STW_R	stw	%r2, [%r4 + %r5]
	.word 0xc2710005  ! 424: STX_R	stx	%r1, [%r4 + %r5]
	.word 0xda210005  ! 424: STW_R	stw	%r13, [%r4 + %r5]
	.word 0xe2212b58  ! 424: STW_I	stw	%r17, [%r4 + 0x0b58]
	.word 0xc4f92ef8  ! 424: SWAPA_I	swapa	%r2, [%r4 + 0x0ef8] %asi
	.word 0xc2290005  ! 424: STB_R	stb	%r1, [%r4 + %r5]
! Store8_fpst
	.word 0xc2710005  ! 433: STX_R	stx	%r1, [%r4 + %r5]
	.word 0xfc290005  ! 433: STB_R	stb	%r30, [%r4 + %r5]
	.word 0xc42127ac  ! 433: STW_I	stw	%r2, [%r4 + 0x07ac]
	.word 0xc6710005  ! 433: STX_R	stx	%r3, [%r4 + %r5]
	.word 0xc0212d4c  ! 433: STW_I	stw	%r0, [%r4 + 0x0d4c]
	.word 0xf6290005  ! 433: STB_R	stb	%r27, [%r4 + %r5]
	.word 0xc229284b  ! 433: STB_I	stb	%r1, [%r4 + 0x084b]
	.word 0xc2292dde  ! 433: STB_I	stb	%r1, [%r4 + 0x0dde]
	.word 0xc5392ff8  ! 433: STDF_I	std	%f2, [0x0ff8, %r4]
! Store7_atm_st
	.word 0xc0710005  ! 442: STX_R	stx	%r0, [%r4 + %r5]
	.word 0xc0710005  ! 442: STX_R	stx	%r0, [%r4 + %r5]
	.word 0xc6712960  ! 442: STX_I	stx	%r3, [%r4 + 0x0960]
	.word 0xc2712020  ! 442: STX_I	stx	%r1, [%r4 + 0x0020]
	.word 0xe0290005  ! 442: STB_R	stb	%r16, [%r4 + %r5]
	.word 0xc2210005  ! 442: STW_R	stw	%r1, [%r4 + %r5]
	.word 0xe6710005  ! 442: STX_R	stx	%r19, [%r4 + %r5]
	.word 0xc6f91005  ! 442: SWAPA_R	swapa	%r3, [%r4 + %r5] 0x80
	.word 0xc6210005  ! 442: STW_R	stw	%r3, [%r4 + %r5]
! Store6_fpst_st
	.word 0xcc710005  ! 450: STX_R	stx	%r6, [%r4 + %r5]
	.word 0xfc2921dd  ! 450: STB_I	stb	%r30, [%r4 + 0x01dd]
	.word 0xc629241a  ! 450: STB_I	stb	%r3, [%r4 + 0x041a]
	.word 0xd8290005  ! 450: STB_R	stb	%r12, [%r4 + %r5]
	.word 0xc02922c3  ! 450: STB_I	stb	%r0, [%r4 + 0x02c3]
	.word 0xd6712608  ! 450: STX_I	stx	%r11, [%r4 + 0x0608]
	.word 0xc7212304  ! 450: STF_I	st	%f3, [0x0304, %r4]
	.word 0xf0312630  ! 450: STH_I	sth	%r24, [%r4 + 0x0630]
! Store9
	.word 0xc4710005  ! 459: STX_R	stx	%r2, [%r4 + %r5]
	.word 0xc4290005  ! 459: STB_R	stb	%r2, [%r4 + %r5]
	.word 0xc2292c75  ! 459: STB_I	stb	%r1, [%r4 + 0x0c75]
	.word 0xc22120e8  ! 459: STW_I	stw	%r1, [%r4 + 0x00e8]
	.word 0xc22920a6  ! 459: STB_I	stb	%r1, [%r4 + 0x00a6]
	.word 0xc2290005  ! 459: STB_R	stb	%r1, [%r4 + %r5]
	.word 0xc07120d0  ! 459: STX_I	stx	%r0, [%r4 + 0x00d0]
	.word 0xfa210005  ! 459: STW_R	stw	%r29, [%r4 + %r5]
	.word 0xc4712a08  ! 459: STX_I	stx	%r2, [%r4 + 0x0a08]
! Store6_atm_st
	.word 0xec710005  ! 467: STX_R	stx	%r22, [%r4 + %r5]
	.word 0xdc310005  ! 467: STH_R	sth	%r14, [%r4 + %r5]
	.word 0xc6312f6c  ! 467: STH_I	sth	%r3, [%r4 + 0x0f6c]
	.word 0xc6710005  ! 467: STX_R	stx	%r3, [%r4 + %r5]
	.word 0xfc292f4a  ! 467: STB_I	stb	%r30, [%r4 + 0x0f4a]
	.word 0xc0210005  ! 467: STW_R	stw	%r0, [%r4 + %r5]
	.word 0xfdf12005  ! 467: CASXA_R	casxa	[%r4]%asi, %r5, %r30
	.word 0xe8210005  ! 467: STW_R	stw	%r20, [%r4 + %r5]
! Store9
	.word 0xc6710005  ! 476: STX_R	stx	%r3, [%r4 + %r5]
	.word 0xc0312dd2  ! 476: STH_I	sth	%r0, [%r4 + 0x0dd2]
	.word 0xc0290005  ! 476: STB_R	stb	%r0, [%r4 + %r5]
	.word 0xd6712fc8  ! 476: STX_I	stx	%r11, [%r4 + 0x0fc8]
	.word 0xce710005  ! 476: STX_R	stx	%r7, [%r4 + %r5]
	.word 0xc6290005  ! 476: STB_R	stb	%r3, [%r4 + %r5]
	.word 0xc4210005  ! 476: STW_R	stw	%r2, [%r4 + %r5]
	.word 0xe43122ce  ! 476: STH_I	sth	%r18, [%r4 + 0x02ce]
	.word 0xf8290005  ! 476: STB_R	stb	%r28, [%r4 + %r5]
! Store8_fpst
	.word 0xc0710005  ! 485: STX_R	stx	%r0, [%r4 + %r5]
	.word 0xc2710005  ! 485: STX_R	stx	%r1, [%r4 + %r5]
	.word 0xc63125ba  ! 485: STH_I	sth	%r3, [%r4 + 0x05ba]
	.word 0xc2710005  ! 485: STX_R	stx	%r1, [%r4 + %r5]
	.word 0xf2710005  ! 485: STX_R	stx	%r25, [%r4 + %r5]
	.word 0xc0712ec0  ! 485: STX_I	stx	%r0, [%r4 + 0x0ec0]
	.word 0xcc292996  ! 485: STB_I	stb	%r6, [%r4 + 0x0996]
	.word 0xc2312d38  ! 485: STH_I	sth	%r1, [%r4 + 0x0d38]
	.word 0xd9210005  ! 485: STF_R	st	%f12, [%r5, %r4]
! Store9
	.word 0xc2710005  ! 494: STX_R	stx	%r1, [%r4 + %r5]
	.word 0xe8290005  ! 494: STB_R	stb	%r20, [%r4 + %r5]
	.word 0xd2210005  ! 494: STW_R	stw	%r9, [%r4 + %r5]
	.word 0xc2712200  ! 494: STX_I	stx	%r1, [%r4 + 0x0200]
	.word 0xc63126ca  ! 494: STH_I	sth	%r3, [%r4 + 0x06ca]
	.word 0xc6290005  ! 494: STB_R	stb	%r3, [%r4 + %r5]
	.word 0xe6710005  ! 494: STX_R	stx	%r19, [%r4 + %r5]
	.word 0xc2312326  ! 494: STH_I	sth	%r1, [%r4 + 0x0326]
	.word 0xe8710005  ! 494: STX_R	stx	%r20, [%r4 + %r5]
        ta      T_GOOD_TRAP

.data
	.word  0xb4cd5baf,0xa2357a4b,0x520e9dd8,0xd8c4a16b
	.word  0x21143dd0,0x84e62233,0x97f91431,0x91f263b4
	.word  0x5f3e7aca,0x497de43c,0x107dc116,0x031355b8
	.word  0x3b62b420,0xfb50f92c,0x3438fee8,0x4abb75ef
	.word  0x46cf415b,0xa599db3c,0x7932fb8e,0xf0213c3e
	.word  0xabb95b5e,0xd2a53dbc,0xcfc8ca46,0x66f4c2d8
	.word  0x8e55e70e,0x44a08ad9,0x31572167,0x8cf90678
	.word  0x675eb119,0x142e8a78,0x80131706,0x3e0b189d
	.word  0x989287a1,0xf3cc4fe7,0x97fcb3e1,0xc78b33ae
	.word  0xcee65f71,0x3c9cf86d,0xbfe1bd71,0xbea957b1
	.word  0xcd740653,0xf774b8f1,0x8bd958ef,0xa4cefc16
	.word  0xd3e5d98e,0x5152d8b8,0xcdc96dd8,0xfa054566
	.word  0x2694bff1,0xeab1f5a8,0xbbe72568,0xf527804b
	.word  0xf982a84d,0x8ead37f4,0x3dd006e7,0x947f3347
	.word  0x68f3c4eb,0x345b01d4,0x9a2e5bcd,0x0f62335b
	.word  0x930f85bc,0x4284628e,0x264a7c80,0x6a4990a4
	.word  0xb8f2c7f1,0xd3c873d7,0xf7fa387d,0x456f0682
	.word  0xba1a767a,0x3d1fe788,0xe42bdcbd,0xf23dec19
	.word  0x9e884c09,0x8d583f00,0x448ad112,0xe6d4d974
	.word  0xc6d6a342,0xbeb290ab,0x047d9005,0x4f497e82
	.word  0xb6bea49e,0x03ec5ebd,0x0d352d75,0xf1f58cc7
	.word  0x24ec5397,0xfbfaec74,0x2e35a87a,0x8a6fa69e
	.word  0x3d17b44a,0x9d0d2815,0x9f807238,0x3d35d821
	.word  0xe0b3a72b,0xbf111c43,0x2372f728,0xd58f2621
	.word  0x3c238ec6,0xd2447c03,0xbdb38315,0x540b9656
	.word  0x5d2941bf,0x550d725e,0xa829dd89,0x8cee278c
	.word  0xc07e1b6b,0x34776784,0xcbde3a4d,0xf4a82a95
	.word  0xb809df4a,0xd10271cd,0x221436c1,0x10b69faa
	.word  0xe299cb41,0x650c0ec0,0x2f45295f,0xf23b9e81
	.word  0xf9a0399a,0x94a19587,0x701076b0,0x39e2fe04
	.word  0x21529d51,0x36083f50,0xd5fa645b,0x4558dad5
	.word  0x9ff14f3e,0x1175d140,0xda6281d0,0x4fbe5c78
	.word  0x838f780e,0x7b2e76e0,0x0e0da3d8,0x22a5a190
	.word  0xb4425dda,0x9f82d2b5,0x8c6a2297,0x96f8d2ff
	.word  0x556e700b,0xbf1d937c,0x0a91cbbb,0xc2622e9b
	.word  0x2eceda91,0x9bec7931,0x4c740390,0x86a7be3d
	.word  0x6de5ab24,0xf84fb491,0xb8493a76,0x6e3a93e7
	.word  0x03c3966f,0x16980273,0xb439ebc4,0x4d6e1f40
	.word  0x63a40488,0x1be8cd57,0x458e4f92,0x22827dcf
	.word  0xb22e5e00,0xc3a38e1d,0xd7d22985,0x27d657ba
	.word  0xa8ac6b5c,0x9a1bded8,0xf44b2ac1,0x6bcc187a
	.word  0x726f2e45,0x24e88d42,0xc2e51d80,0x539d9597
	.word  0x683bace5,0x825c0c5e,0xb8602aac,0x3a033ede
	.word  0x8405aa0b,0x63515555,0xc9079b75,0xf7fa75da
	.word  0xfdb9bf19,0x4d998762,0xa144062d,0x5f7a7017
	.word  0x99617d54,0x448ccb03,0xe117132a,0x8ec25afd
	.word  0x092301cd,0xb0fc1cc4,0x883276af,0xa22b6d68
	.word  0x731c0ea5,0xebbfe8a2,0x72493412,0x4b723999
	.word  0x7d8a7ae7,0x545d0c2d,0x242d07c8,0x7bd4e059
	.word  0x5cacec68,0xdf317e35,0x242e256b,0xcec5695e
	.word  0xa29ab874,0x51bacb38,0x5719e20a,0x4de49caf
	.word  0x3d3a486f,0x6962967f,0x809eb2f1,0xbdf2f601
	.word  0x0d2e357c,0x21b0e375,0xdd8f6da7,0xe7fc22d3
	.word  0x9193d4bd,0x34ead6f8,0x55e69305,0x3937da3e
	.word  0xe1df1de6,0x0bcef039,0x461e38fa,0xc209cad1
	.word  0x95634a03,0xdc718469,0xb1e9b0c4,0x564e3f8f
	.word  0xb0bff125,0x35f0ee12,0x54213c17,0x43673a29
	.word  0xe19615f2,0x3519b9d0,0x67d750af,0x26e93a2e
	.word  0x60b97ff3,0x3aefb89f,0x4fdd23b6,0x92c95657
	.word  0x3f2de394,0x5e5ab445,0xd9182b2a,0x76856965
	.word  0x3656af4b,0xb219337f,0x838b742b,0xc006f552
	.word  0x0d7d0f99,0x8385f65c,0x056942d2,0x6b22057b
	.word  0x98e2f6fa,0xbf21a67d,0x4778670e,0xc7df32a9
	.word  0x849cc564,0x3703b512,0x2127f276,0xb6127672
	.word  0x11a3f55b,0x9c4f4b67,0x89bb355c,0x0ba9af1f
	.word  0xd6e65c0b,0xeb0de769,0xa2812540,0x0d5a3f6d
	.word  0xab2a0d90,0xb34bda3b,0xd9052aec,0x6ab5527e
	.word  0x27542d6c,0x443adbfd,0xb9e0e70b,0x3e7ca810
	.word  0x113c0e22,0x6e629895,0x770c07b9,0x4aefac88
	.word  0x85003d80,0xe610b3d5,0x003e4d08,0xa886b576
	.word  0x4ed08d1d,0x6cc58859,0x8c0d72c0,0x617eb2fe
	.word  0xd9759077,0xcb148fea,0x729e769e,0x68d9d2de
	.word  0x18e57828,0x086c78a1,0x24aea8b2,0xaf77c2ad
	.word  0x02c11c72,0xe2d3871e,0x5388b620,0x80d6e7bf
	.word  0xb02ca642,0xb602e9a9,0x6df0aa5f,0x19c4369a
	.word  0xdc6c4662,0x0830a51c,0xbc877410,0xddce755a
	.word  0x7fa5e92e,0xdc618641,0xc5c01338,0xd462edb6
	.word  0x116d50dc,0x707b0cfc,0xd78040e0,0xed923ea6
	.word  0x48bd6e37,0x34f9c7a0,0xf1cdbcba,0x4e322f20
	.word  0xc3dab2ce,0x1396dc34,0x58bd6a18,0x7311e359
	.word  0xfe270d00,0xa17009da,0x62934e64,0x18567b2a
	.word  0xff1e9e2c,0x8b07941d,0x6ee0ff4f,0x3b3496cc
	.word  0x53050b24,0xec74b162,0x60acac28,0x9ddb2c84
	.word  0x78686b60,0xcc86dbd8,0xb7b1239a,0xa608755d
	.word  0x2e9686fa,0x5c05de15,0xd64727ba,0x2c0e1549
	.word  0x3cde7eb9,0x9674f695,0xe5eed84f,0x9836ada2
	.word  0x83a272d9,0x007bbecf,0x80025c5a,0x372da6e7
	.word  0xaa7bb305,0x7c3022cc,0x0166d424,0xc2623bab
	.word  0xb75cd6d3,0xa1b74837,0x83ebcbac,0x30c6f109
	.word  0x51337f25,0x86d89f71,0x97f31b26,0x1fcf4e6c
	.word  0xa9344ca9,0x71bc92c9,0xe98b26f1,0x69f553c9
	.word  0xddac7875,0x21ebc7b9,0x331af4c5,0xf9d29eb5
	.word  0xbf621240,0x5e011da1,0xfe31df6a,0xaf10e138
	.word  0x04328e4c,0x50bd67d2,0x86fe1f77,0xd22252dc
	.word  0x2206c91f,0xec075d8e,0xba54e631,0x5a2043f9
	.word  0x1b5b9af2,0x9f31245b,0xad9b14b4,0x21539a62
	.word  0x6cbed5e7,0x0e0a4f6c,0xde0acb96,0x0d73fb09
	.word  0x077e54d8,0xf597055f,0x120cb8c2,0x09d1b111
	.word  0x3a6bec27,0xf677b41c,0x6ad70d47,0xc9ee72a4
	.word  0xa74148d8,0x68bdebe7,0x6df685cc,0x1c645ef1
	.word  0xeacf2fda,0x930ef861,0x48d6b954,0xe7603e63
	.word  0x3b1f9d6f,0x9a91ed5c,0x53ef937c,0x1c1f2151
	.word  0xb8dacf3f,0x429f0450,0x5aa44077,0x269ab896
	.word  0x4f2f5468,0x9cd04205,0xf9f17c6a,0xe950523d
	.word  0x5dca3b68,0xcbfe04b5,0xb86397f6,0x1331ce1b
	.word  0xa76a8dc5,0x03bd9b2a,0xfe0986a7,0xba65da61
	.word  0x5b575571,0x139f6de2,0x44063107,0x21f134b7
	.word  0x281fec75,0xdd50e751,0x545d0f9f,0xa6f3fb4a
	.word  0x7cf7e13b,0x69d1c24a,0x889ca8ee,0xf3eb53c4
	.word  0x538b45d7,0x6dde967d,0xcfcaefbf,0x550872fc
	.word  0x36650843,0x2264680a,0xc3504b29,0x335e1ede
	.word  0xb112d29a,0x60d0625c,0x802abbad,0x1713d639
	.word  0x2dacdb8f,0x0439c4f2,0x26be3e1f,0xe0344dd2
	.word  0x45c00fde,0xa2e121a0,0x99c7953a,0xf5a24f44
	.word  0x60535ded,0xa4914ff6,0x9397a122,0xa2461612
	.word  0x290898c9,0xfaeca14c,0x025943bc,0xa3c20cd4
	.word  0x60d650e5,0x223acba4,0xb7e96cbf,0x2b035a8d
	.word  0xcac262df,0x50772db0,0xc2cd1534,0x7181a615
	.word  0x22bafe35,0xc91b4987,0x7d39ed3e,0x6f3c0686
	.word  0xfa59884a,0xe894ac99,0x58b0415e,0x36b3a3b7
	.word  0xd8bcde6d,0x0426341c,0x06402dc1,0x2dbf6dc0
	.word  0x79bdfdbc,0xcda60132,0x7db6e741,0x9f013aec
	.word  0x781644c4,0xe586b3a0,0x5218e46d,0x841a59cc
	.word  0xc84d0675,0x4106576b,0x9df61b8c,0x9069e47b
	.word  0xb88d0bf3,0xe7597e77,0x6868a60f,0x73eb5684
	.word  0x96013faa,0xfbd36b64,0x43a3dae3,0x9f5e664e
	.word  0x18af76a7,0x276c297b,0x12ab1c47,0x30dbae73
	.word  0x5030eaad,0x6f24f210,0x7233384a,0x19a1def2
	.word  0xb42e30bf,0x3ece93a7,0x2cbfe244,0xa0786236
	.word  0x2098fb48,0x20d132dc,0x914bd270,0xe5c90a2f
	.word  0x78c8bab4,0x9403b272,0x997ef018,0x8f736705
	.word  0xe38b1d19,0xa0908dcd,0x8212d681,0x05e60630
	.word  0x302e94e1,0x76883294,0xd741754f,0xf4e4b12a
	.word  0xdcb5d9b2,0xf928d928,0x793c0f1e,0x564fef38
	.word  0xfcbdbd10,0x84ae921e,0x2eba48a0,0x405fbf98
	.word  0xfdca5a69,0x0ce0255b,0x22c55232,0x09ed0ece
	.word  0x8dc5ae1f,0x58419e09,0x375c7701,0x92352e0f
	.word  0x2db18917,0x62a27024,0xf52b0849,0x03ea0e5e
	.word  0x87a1f6f6,0x1c8696ae,0x946189d2,0x6052fe8e
	.word  0x402178b9,0x0820b1d7,0x9ec13026,0x9514249a
	.word  0xa6145c17,0x76f9f8c1,0xa8f0b387,0x9e839aca
	.word  0xe43754d0,0x3a521c06,0x3b14cf7a,0x93f3e86d
	.word  0xeb13713e,0xd12e26df,0x5cf3f37e,0x1941ca85
	.word  0xe771da48,0xfe00af52,0xd39a5603,0xf960619e
	.word  0x8e3526e9,0x3aa2bcd1,0xb3c54c38,0x00dfd32f
	.word  0x1e4d3161,0x7928f6e3,0x7c458a9b,0x90e4a554
	.word  0x77fb552f,0x0e1e0e62,0xabf6a1be,0x5f9ea59d
	.word  0x2892451a,0xd4516a78,0x47d166b1,0xeca435ca
	.word  0xdb15da94,0x365786dd,0x91da3e23,0xe2f71ac2
	.word  0x2d34c1c5,0x99a5c054,0x58ee6eca,0x45124380
	.word  0xd990d897,0x387abe23,0x0f0bb671,0xb76b5fa5
	.word  0xfc929e3a,0xc91e5907,0x042918c8,0x4350291e
	.word  0x5542e01d,0xc7e834f0,0x095020c4,0x27721ba6
	.word  0x5141e69e,0xede775b8,0x5269c723,0xba6122b2
	.word  0x3dc37a6c,0x990c6f1e,0xb65737c5,0xd122bd49
	.word  0xf580c7ef,0x02ca0c0d,0x5db92020,0xabcd7fb8
	.word  0x4832ec7b,0xfe439768,0x59ddcb25,0x56d84fea
	.word  0xc159461f,0x64d17c66,0x08978d5d,0xaead6a16
	.word  0x4772067b,0xfe767e2d,0x15bc39c0,0xe2710ae0
	.word  0xa1621b9b,0x9b8fe89f,0x33c310f4,0x97bd8b79
	.word  0x4d9a7c39,0x095ced10,0xcd2281a4,0x580e5d54
	.word  0x90eae2c2,0x8ed2a345,0x55feeb58,0xca0d55cd
	.word  0x8e63753a,0x112d6275,0xc37dbf11,0xc60fa991
	.word  0x9dbedaee,0x98fdf53e,0xaef2ea15,0x0c1eade3
	.word  0x18004b99,0xee7f651a,0xce4fff65,0xf3864c66
	.word  0x88ab1f8c,0x31488fe5,0xba7a7996,0xce3065a5
	.word  0x8a53c5b8,0xb955713e,0x83aeee1a,0xc0c62e07
	.word  0x234bc4b5,0xe6901482,0xd27eb5f9,0x221bcb64
	.word  0xea4915a6,0xd4dc9ebf,0x58583f4f,0x0f501ad6
	.word  0xd435935c,0xc3602128,0xb9d0d769,0x75c197f1
	.word  0x4f60b096,0x8df41a58,0x74c85b15,0x125a4c68
	.word  0x54be39ae,0x539ae946,0x786c7fc1,0x305aa023
	.word  0x92c6b921,0xc1f00918,0x9a4b8297,0xb0724d33
	.word  0x0b8b20ee,0x5eb40d6e,0xefd160b7,0xaf65f509
	.word  0x8cef8d3e,0xc760ea82,0x9cc58ec0,0xc7ed303e
	.word  0xffa14c02,0xd199c79e,0x4215f057,0x32b5a7fa
	.word  0xe15edbf8,0x0736cb02,0xae0b0fd1,0xec23bddb
	.word  0x06f033ab,0x5abe4562,0x0f7b3bce,0xe8da03f4
	.word  0xc2f5d325,0xfc1e1dd5,0xf4073b7b,0x2891dc8f
	.word  0x65eca38e,0x4d0cb4c1,0x1cef0b03,0xd7a174fc
	.word  0xf564102c,0x357e20d8,0xf5b28aa7,0xde667f0e
	.word  0xd63664b1,0x133f6cf9,0x8884e4be,0xf41b6c24
	.word  0x1783f383,0x3ab1fd8c,0xd5806df5,0xe5051d86
	.word  0x5cf23c8e,0xb333a1d5,0xea8e0444,0x752f4c80
	.word  0x7219fe03,0xbcc31423,0x8d63e5e5,0x22b84904
	.word  0x6dbaa5c8,0x7eac6746,0xa9b5ba56,0x3b66eafc
	.word  0x9ccb1e58,0x5392f336,0xe1a014db,0xbcb1fd7a
	.word  0x80e2b8d5,0xd322fb8c,0xa70ba8e2,0xf6cd6226
	.word  0x5c5758ac,0xcd7db7cd,0x09b3bd5d,0x4453b690
	.word  0xa9b7fc39,0xc8172efc,0xf149e9f0,0x2a534393
	.word  0x9d01ab97,0x1afc5f6d,0x4d629336,0x5b4a0af0
	.word  0x46d8f298,0x147614a4,0x0142d2c6,0x29634149
	.word  0xb81e0d40,0x1eaf7bbc,0x04367e15,0x92bc0969
	.word  0x74cb9d52,0xfc01cbb4,0xcab93b76,0x381edc07
	.word  0x79d3b589,0xb18f89e3,0x5e8cf36a,0xd1f10d86
	.word  0x9c79874c,0x46a494c2,0xe1448bae,0x4342d84d
	.word  0x71b06b69,0x078e76f1,0xeddda6e5,0xe010f963
	.word  0xc62c5310,0x3eaccbba,0x63ee2b7b,0x491b27a9
	.word  0x8bcbce6d,0xac1a25a0,0x7e89764a,0x548ef83e
	.word  0xe19f7ac6,0x83a07a1a,0x2b93e6be,0x89d1d2b2
	.word  0x362c6b09,0x9d3753bf,0xae1cd321,0x97645156
	.word  0xd22c7d14,0xe191e88b,0xb4e3349d,0x101aed7d
	.word  0xf2790855,0x5ad902d4,0xafe8b570,0xbec5f16a
	.word  0xf2a3dc74,0x22abb816,0x335ee330,0x0b542546
	.word  0xb0765a0d,0x12a84273,0x87330242,0x91d53902
	.word  0x0b9261bd,0x74114eb7,0x436eb40a,0xf706d439
	.word  0xc747179c,0x25efa5f8,0xeb2941ec,0xf588628c
	.word  0x2ab09739,0xe50b8369,0xbf2993cc,0xe3459aa4
	.word  0x4d1ecbcb,0x2a011961,0xb9d1ff33,0xe33e7a37
	.word  0xb89c43cb,0x67ac1dc9,0xe54a2674,0xad08364a
	.word  0xe4636e08,0xd2c6f010,0xa6978b1b,0x96510a25
	.word  0x772bb2b2,0x8bebf5ec,0xfa8a1235,0xefdee691
	.word  0xcaee8e6f,0x5296ac63,0x15bba06e,0x66227db1
	.word  0xb80fc328,0x3c5dfdc2,0xe53cb1db,0xe789aff4
	.word  0x655fda98,0xb4b68c12,0x7658f4ea,0xadd9c171
	.word  0x1699c26d,0x422b70ce,0x5ae30e44,0x0ac20be9
	.word  0xed0b95f3,0xd4798922,0x5e77fc35,0xe60d09de
	.word  0x4af487c4,0xdbacaa02,0x12afcdfe,0x40faa73d
	.word  0xe7e9d138,0xa421cf3f,0xbf7e2704,0x1e05a114
	.word  0xeb584a27,0xb2c4f03a,0x68e85af9,0x6df40c7b
	.word  0x3f2b3d3f,0xff4cc00a,0x710a1c73,0x3e7299a6
	.word  0x888f2d29,0xaea77043,0x04eb72d9,0x7d223245
	.word  0x0d5868ca,0x4f09e18c,0x958d21a2,0xad555a46
	.word  0xdb431dd3,0x9523ab35,0xa16a420b,0xf5fd7f93
	.word  0x30038b32,0x92d1358d,0x4747f1fd,0xa819f36b
	.word  0x919b855a,0x440b8906,0x087126af,0xb4fd1dac
	.word  0x7ae72aaf,0x9c6728db,0x13352ebf,0x2de4feb1
	.word  0x18f70ad6,0x44487424,0xed0d1569,0xc3729438
	.word  0x0833c02c,0x62e9300d,0x3c1da045,0x3da87859
	.word  0xd9d236ab,0x0689ac74,0xa0c883ab,0x609b0762
	.word  0xe2149b1b,0x50e50162,0x7b3ae28f,0x86b6e82a
	.word  0x4be74dfc,0xb66e831e,0x217ebee3,0xb8a9c7ab
	.word  0x79d7d73b,0x3a940ede,0x6e6df3e1,0x78a460f4
	.word  0xd52d2231,0xed52241f,0x769a0f61,0xca21a1e2
	.word  0xe0085465,0x1e866279,0xa5edd584,0x4e944713
	.word  0x1a0a6e1f,0x6f273ea7,0x4c7c9806,0x789d0423
	.word  0x7d9ac01e,0xed84ac00,0x10a10100,0x2374e0c2
	.word  0x7fba25bc,0x8770ab3b,0x0014ad46,0x6ff272ad
	.word  0x458b91af,0x8f26e697,0x3306245e,0x40777893
	.word  0xf50881c0,0x815bf22f,0x8dd2b994,0x1b8a2f56
	.word  0x979b84fd,0x2cc019a3,0x6341dc48,0xca553dfc
	.word  0x85ea4274,0x9afebf60,0x2484e9fa,0x4691d97a
	.word  0x5a4848a0,0x56521fb3,0x62fa3782,0x0d2026ac
	.word  0xef1fc191,0xc09d4c45,0x58dc9e28,0x504e5b7d
	.word  0x8e1e610f,0xd3860c91,0xb50d6bbe,0xedab14f5
	.word  0xd1c026ce,0xcfe76c0e,0x5699fd0b,0xd263fb76
	.word  0x1175d3ca,0x3a3ed18e,0xd26cf167,0x92b9cfaf
	.word  0xed930261,0xa324e42c,0x44e94b85,0xb9d05c91
	.word  0x9198829f,0x33d1549b,0x951148fa,0x74ccfed2
	.word  0xcb7db011,0x0b63f65d,0x232467b7,0x2e4af25e
	.word  0x024f7ad6,0x58750da2,0xd0840074,0xa446a368
	.word  0x0773b0a6,0x73f02ea7,0x6107fe63,0x1fbace12
	.word  0x47529254,0xabd92e3b,0x8da7a523,0xde9d52a7
	.word  0xac22023e,0x39d2c8e8,0x61fa308b,0x74e9e323
	.word  0x48768472,0x21ddb6de,0x282b310b,0xe0d74ad4
	.word  0x80daf8fe,0x321f0598,0x1b35b285,0x33596ff9

!!# /************************************************************
!!# *
!!# * File:         stb.j
!!# *
!!# * Description: Store buffer full condition with various
!!# * store types in the 7th, 8th and 9th slots:
!!# *
!!# * - Integer stores
!!# * - FP stores
!!# * - Atomics
!!# * 
!!# **************************************************************/
!!# 
!!# --c_declarations
!!# 
!!#   int i;
!!#   int intr_cnt = 0;
!!# 
!!# --setup
!!# 
!!#   IJ_set_thread_count(4);
!!# 
!!# --init
!!# 
!!#   printf ("**********************************\n");
!!# 
!!#   IJ_set_ropr_fld (ijdefault, Ft_Rs1, "{4}");
!!#   IJ_set_ropr_fld (ijdefault, Ft_Rs2, "{5}");
!!#   IJ_set_ropr_fld (ijdefault, Ft_Rd, "{0..3,6..31}");
!!#   IJ_set_ropr_fld (ijdefault, Ft_Simm13, "13'b0rrrrrrrrrrrr");
!!#   IJ_set_ropr_fld (ijdefault, Fm_align_Simm13, "3'b111");
!!#   IJ_set_ropr_fld (ijdefault, Fm_align_Rd, "1'b1");
!!#   IJ_set_ropr_fld (ijdefault, Ft_Imm_Asi, "{0x80}");
!!# 
!!#   IJ_set_rvar (reg_rand_init, "64'h0000000000000rr0");
!!# 
!!#   IJ_printf ("th", "\tsetx  MAIN_BASE_DATA_VA, %%r1, %%r4\n");
!!#   IJ_printf ("th", "\tsetx  0x%016llrx, %%r1, %%r5\n", reg_rand_init);
!!# 
!!#   IJ_printf ("th", "\twr %%r0, 0x4, %%fprs\n");
!!#   IJ_init_fp_regs ("th", 4);
!!# 
!!#   IJ_printf ("th", "        setx  0x80, %%g2, %%g1\n");
!!#   IJ_printf ("th", "        wr  %%g1, %%g0, %%asi\n");
!!# 
!!#   IJ_set_rvar (reg_rand_init, "64'hrrrrrrrr rrrrrrrr");
!!#   for (i = 1; i < 4; i++) {
!!#      IJ_printf ("th", "\tsetx  0x%016llrx, %%r1, %%r%d\n", reg_rand_init, i);
!!#   }
!!#   for (i = 6; i < 32; i++) {
!!#      IJ_printf ("th", "\tsetx  0x%016llrx, %%r1, %%r%d\n", reg_rand_init, i);
!!#   }
!!# 
!!#   IJ_set_rvar (data_rand_init, "32'hrrrrrrrr");
!!#   IJ_printf ("-", ".data\n");
!!#   for (i = 0; i < 128; i++) {
!!#     IJ_printf ("-", "	.word  0x%08rx,0x%08rx,0x%08rx,0x%08rx\n", data_rand_init, data_rand_init, data_rand_init, data_rand_init);
!!#     IJ_printf ("-", "	.word  0x%08rx,0x%08rx,0x%08rx,0x%08rx\n", data_rand_init, data_rand_init, data_rand_init, data_rand_init);
!!#   }
!!# 
!!# --finish
!!# 	;
!!# 
!!# --diag_ini
!!# #define NO_TRAPCHECK
!!# #include "enable_traps.h"
!!# #include "hboot.s"
!!# 
!!# !SIMS: -non_shared
!!# !SIMS: +spis
!!# 
!!# .text
!!# .global main
!!# .global th_main_0
!!# .global th_main_1
!!# .global th_main_2
!!# .global th_main_3
!!# 
!!# main:
!!# 
!!# 	th_fork(th_main)
!!# 
!!# th_main_0:
!!# !<<IJ>>include "th0.s"
!!#         ta      T_GOOD_TRAP
!!# 
!!# th_main_1:
!!# !<<IJ>>include "th1.s"
!!#         ta      T_GOOD_TRAP
!!# 
!!# th_main_2:
!!# !<<IJ>>include "th2.s"
!!#         ta      T_GOOD_TRAP
!!# 
!!# th_main_3:
!!# !<<IJ>>include "th3.s"
!!#         ta      T_GOOD_TRAP
!!# 
!!# --diag_fini
!!# 
!!# --grammar
!!# 
!!# inst_block: inst_type
!!#             | inst_block inst_type
!!#               {
!!# 		;
!!#               }
!!#             ;
!!# 
!!# inst_type: store8 | store9 | st6_atm_st | st7_atm_st | st8_atm | st6_fpst_st | st7_fpst_st | st8_fpst 
!!# ;
!!# 
!!# intr: T0_T1_idle_resum_intr | T0_T2_idle_resum_intr | T0_T3_idle_resum_intr
!!# ;
!!# 
!!# store8: store store store store store store d0 store store intr
!!# {
!!#     IJ_printf ("th", "! Store8\n");
!!#     IJ_generate_va ("th", $1, $2, $3, $4, $5, $6, $8, $9, NULL);
!!# }
!!# ;
!!# 
!!# store9: store store store store store store d1 store store store
!!# {
!!#     IJ_printf ("th", "! Store9\n");
!!#     IJ_generate_va ("th", $1, $2, $3, $4, $5, $6, $8, $9, $10, NULL);
!!# }
!!# ;
!!# 
!!# st6_atm_st: store store store store store store d2 atomic store
!!# {
!!#     IJ_printf ("th", "! Store6_atm_st\n");
!!#     IJ_generate_va ("th", $1, $2, $3, $4, $5, $6, $8, $9, NULL);
!!# }
!!# ;
!!# 
!!# st7_atm_st: store store store store store store d3 store atomic store
!!# {
!!#     IJ_printf ("th", "! Store7_atm_st\n");
!!#     IJ_generate_va ("th", $1, $2, $3, $4, $5, $6, $8, $9, $10, NULL);
!!# }
!!# ;
!!# 
!!# st8_atm: store store store store store store d4 store store atomic
!!# {
!!#     IJ_printf ("th", "! Store8_atm\n");
!!#     IJ_generate_va ("th", $1, $2, $3, $4, $5, $6, $8, $9, $10, NULL);
!!# }
!!# ;
!!# 
!!# st6_fpst_st: store store store store store store d5 st_fp store
!!# {
!!#     IJ_printf ("th", "! Store6_fpst_st\n");
!!#     IJ_generate_va ("th", $1, $2, $3, $4, $5, $6, $8, $9, NULL);
!!# }
!!# ;
!!# 
!!# st7_fpst_st: store store store store store store d6 store st_fp store
!!# {
!!#     IJ_printf ("th", "! Store7_fpst_st\n");
!!#     IJ_generate_va ("th", $1, $2, $3, $4, $5, $6, $8, $9, $10, NULL);
!!# }
!!# ;
!!# 
!!# st8_fpst: store store store store store store d7 store store st_fp
!!# {
!!#     IJ_printf ("th", "! Store8_fpst\n");
!!#     IJ_generate_va ("th", $1, $2, $3, $4, $5, $6, $8, $9, $10, NULL);
!!# }
!!# ;
!!# 
!!# store: tSTB_R | tSTB_I | tSTH_R | tSTH_I | tSTW_R | tSTW_I | tSTX_R | tSTX_I
!!# ;
!!# 
!!# st_fp: tSTF_R | tSTF_I | tSTDF_I | tSTDF_R 
!!# ;
!!# 
!!# atomic: tCASA_R | tCASA_I | tCASXA_R | tCASXA_I | tLDSTUBA_I | tLDSTUBA_R | tSWAP_I | tSWAP_R | tSWAPA_I | tSWAPA_R 
!!# ;
!!# 
!!# T0_T1_idle_resum_intr: mMETA12
!!# {
!!#   IJ_generate_from_token (1, "th0", ijdefault, tSTB_I, NULL);
!!#   IJ_printf ("th0", "IDLE_INTR_%d:\n", intr_cnt);
!!#   IJ_printf ("th0", "!$EV trig_pc_d(0,expr(@VA(.MAIN.IDLE_INTR_%d), 16, 16)) -> intp(1, 2, 1)\n", intr_cnt);
!!#   IJ_printf ("th0", "!$EV trig_pc_d(0,expr(@VA(.MAIN.IDLE_INTR_%d)+16, 16, 16)) -> intp(1, 3, 1)\n", intr_cnt);
!!#   intr_cnt++;
!!# }
!!# ;
!!# 
!!# T0_T2_idle_resum_intr: mMETA16
!!# {
!!#   IJ_generate_from_token (1, "th0", ijdefault, tSTH_I, NULL);
!!#   IJ_printf ("th0", "IDLE_INTR_%d:\n", intr_cnt);
!!#   IJ_printf ("th0", "!$EV trig_pc_d(0,expr(@VA(.MAIN.IDLE_INTR_%d), 16, 16)) -> intp(2, 2, 1)\n", intr_cnt);
!!#   IJ_printf ("th0", "!$EV trig_pc_d(0,expr(@VA(.MAIN.IDLE_INTR_%d)+16, 16, 16)) -> intp(2, 3, 1)\n", intr_cnt);
!!#   intr_cnt++;
!!# }
!!# ;
!!# 
!!# T0_T3_idle_resum_intr: mMETA18
!!# {
!!#   IJ_generate_from_token (1, "th0", ijdefault, tSTX_I, NULL);
!!#   IJ_printf ("th0", "IDLE_INTR_%d:\n", intr_cnt);
!!#   IJ_printf ("th0", "!$EV trig_pc_d(0,expr(@VA(.MAIN.IDLE_INTR_%d), 16, 16)) -> intp(3, 2, 1)\n", intr_cnt);
!!#   IJ_printf ("th0", "!$EV trig_pc_d(0,expr(@VA(.MAIN.IDLE_INTR_%d)+16, 16, 16)) -> intp(3, 3, 1)\n", intr_cnt);
!!#   intr_cnt++;
!!# }
!!# ;
!!# 
!!# d0: mMETA0
!!# ;
!!# d1: mMETA1
!!# ;
!!# d2: mMETA2
!!# ;
!!# d3: mMETA3
!!# ;
!!# d4: mMETA4
!!# ;
!!# d5: mMETA5
!!# ;
!!# d6: mMETA6
!!# ;
!!# d7: mMETA7
!!# ;!! Token Generation Statistics
!! ---------------------------------
!! 
!! Rule   1 (line   92), Count:   500  inst_block           -> inst_type 
!! Rule   2 (line   93), Count:   500  inst_block           -> inst_block inst_type 
!! Rule   3 (line   99), Count:   404  inst_type            -> store8 
!! Rule   4 (line   99), Count:     6  inst_type            -> store9 
!! Rule   5 (line   99), Count:    39  inst_type            -> st6_atm_st 
!! Rule   6 (line   99), Count:     6  inst_type            -> st7_atm_st 
!! Rule   7 (line   99), Count:     7  inst_type            -> st8_atm 
!! Rule   8 (line   99), Count:    24  inst_type            -> st6_fpst_st 
!! Rule   9 (line   99), Count:     0  inst_type            -> st7_fpst_st 
!! Rule  10 (line   99), Count:     7  inst_type            -> st8_fpst 
!! Rule  11 (line  102), Count:     1  intr                 -> T0_T1_idle_resum_intr 
!! Rule  12 (line  102), Count:     1  intr                 -> T0_T2_idle_resum_intr 
!! Rule  13 (line  102), Count:     1  intr                 -> T0_T3_idle_resum_intr 
!! Rule  14 (line  105), Count:   404  store8               -> store store store store store store d0 store store intr 
!! Rule  15 (line  112), Count:     6  store9               -> store store store store store store d1 store store store 
!! Rule  16 (line  119), Count:    39  st6_atm_st           -> store store store store store store d2 atomic store 
!! Rule  17 (line  126), Count:     6  st7_atm_st           -> store store store store store store d3 store atomic store 
!! Rule  18 (line  133), Count:     7  st8_atm              -> store store store store store store d4 store store atomic 
!! Rule  19 (line  140), Count:    24  st6_fpst_st          -> store store store store store store d5 st_fp store 
!! Rule  20 (line  147), Count:     0  st7_fpst_st          -> store store store store store store d6 store st_fp store 
!! Rule  21 (line  154), Count:     7  st8_fpst             -> store store store store store store d7 store store st_fp 
!! Rule  22 (line  161), Count:    55  store                -> tSTB_R 
!! Rule  23 (line  161), Count:    45  store                -> tSTB_I 
!! Rule  24 (line  161), Count:    39  store                -> tSTH_R 
!! Rule  25 (line  161), Count:    55  store                -> tSTH_I 
!! Rule  26 (line  161), Count:    51  store                -> tSTW_R 
!! Rule  27 (line  161), Count:    44  store                -> tSTW_I 
!! Rule  28 (line  161), Count:    44  store                -> tSTX_R 
!! Rule  29 (line  161), Count:    52  store                -> tSTX_I 
!! Rule  30 (line  164), Count:     3  st_fp                -> tSTF_R 
!! Rule  31 (line  164), Count:     5  st_fp                -> tSTF_I 
!! Rule  32 (line  164), Count:     3  st_fp                -> tSTDF_I 
!! Rule  33 (line  164), Count:     2  st_fp                -> tSTDF_R 
!! Rule  34 (line  167), Count:     1  atomic               -> tCASA_R 
!! Rule  35 (line  167), Count:     3  atomic               -> tCASA_I 
!! Rule  36 (line  167), Count:     2  atomic               -> tCASXA_R 
!! Rule  37 (line  167), Count:     2  atomic               -> tCASXA_I 
!! Rule  38 (line  167), Count:     3  atomic               -> tLDSTUBA_I 
!! Rule  39 (line  167), Count:     2  atomic               -> tLDSTUBA_R 
!! Rule  40 (line  167), Count:     1  atomic               -> tSWAP_I 
!! Rule  41 (line  167), Count:     1  atomic               -> tSWAP_R 
!! Rule  42 (line  167), Count:     1  atomic               -> tSWAPA_I 
!! Rule  43 (line  167), Count:     1  atomic               -> tSWAPA_R 
!! Rule  44 (line  170), Count:     1  T0_T1_idle_resum_intr -> mMETA12 
!! Rule  45 (line  180), Count:     1  T0_T2_idle_resum_intr -> mMETA16 
!! Rule  46 (line  190), Count:     1  T0_T3_idle_resum_intr -> mMETA18 
!! Rule  47 (line  200), Count:     5  d0                   -> mMETA0 
!! Rule  48 (line  202), Count:     6  d1                   -> mMETA1 
!! Rule  49 (line  204), Count:    12  d2                   -> mMETA2 
!! Rule  50 (line  206), Count:     6  d3                   -> mMETA3 
!! Rule  51 (line  208), Count:     7  d4                   -> mMETA4 
!! Rule  52 (line  210), Count:     7  d5                   -> mMETA5 
!! Rule  53 (line  212), Count:     0  d6                   -> mMETA6 
!! 
!!   257: Token tSTB_R	Count = 56
!!   258: Token tSTB_I	Count = 46
!!   259: Token tSTH_R	Count = 40
!!   260: Token tSTH_I	Count = 56
!!   261: Token tSTW_R	Count = 52
!!   262: Token tSTW_I	Count = 45
!!   263: Token tSTX_R	Count = 45
!!   264: Token tSTX_I	Count = 53
!!   265: Token tSTF_R	Count = 4
!!   266: Token tSTF_I	Count = 6
!!   267: Token tSTDF_I	Count = 4
!!   268: Token tSTDF_R	Count = 3
!!   269: Token tCASA_R	Count = 2
!!   270: Token tCASA_I	Count = 4
!!   271: Token tCASXA_R	Count = 3
!!   272: Token tCASXA_I	Count = 3
!!   273: Token tLDSTUBA_I	Count = 4
!!   274: Token tLDSTUBA_R	Count = 3
!!   275: Token tSWAP_I	Count = 2
!!   276: Token tSWAP_R	Count = 2
!!   277: Token tSWAPA_I	Count = 2
!!   278: Token tSWAPA_R	Count = 2
!!   279: Token mMETA12	Count = 2
!!   280: Token mMETA16	Count = 2
!!   281: Token mMETA18	Count = 2
!!   282: Token mMETA0	Count = 6
!!   283: Token mMETA1	Count = 7
!!   284: Token mMETA2	Count = 13
!!   285: Token mMETA3	Count = 7
!!   286: Token mMETA4	Count = 8
!!   287: Token mMETA5	Count = 8
!!   288: Token mMETA6	Count = 1
!!   289: Token mMETA7	Count = 8
!! 
!! 
!! +++ finish +++

