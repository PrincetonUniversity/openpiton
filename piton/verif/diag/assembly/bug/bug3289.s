// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: bug3289.s
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
   random seed:	19012451
   Jal stb6.j:	
********************************************************************************/

#ifndef OVERRIDE_THREAD_COUNT
# define THREAD_COUNT 4
#endif
#define MAIN_PAGE_HV_ALSO
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
	setx  0xf89cbb2d009b8630, %r1, %r1
	setx  0x4e78be9f0643b118, %r1, %r2
	setx  0x96a5fb540e80f4d8, %r1, %r3
	setx  0x183808650252dd40, %r1, %r6
	setx  0x2bad01420bdaa3b0, %r1, %r7
	setx  0xf03e3c41090d8428, %r1, %r8
	setx  0xfc355ef20435eaa8, %r1, %r9
	setx  0x20f04a30f3c8862b, %r1, %r11
	setx  0xccfd3c3088e8c680, %r1, %r12
	setx  0xe243e1bbbbe0f985, %r1, %r13
	setx  0xc402f82e73e95ab0, %r1, %r14
	setx  0x2594502729cfaead, %r1, %r15
	setx  0x94259cdf752ac981, %r1, %r16
	setx  0x7003c075ecf462da, %r1, %r17
	setx  0x841b8449f8d5dbd0, %r1, %r18
	setx  0x60ecbaeada9484b9, %r1, %r19
	setx  0x1caea2b7f577bb89, %r1, %r20
	setx  0x387d85d2dd035414, %r1, %r21
	setx  0xe1d5160a7134dbb6, %r1, %r22
	setx  0xae92f83d9f74ac23, %r1, %r23
	setx  0x7ec1fe973ba1ca6e, %r1, %r24
	setx  0x16e25c3b73270661, %r1, %r25
	setx  0xc3191e6f3c09419f, %r1, %r26
	setx  0x5eaa3646b730ad66, %r1, %r27
	setx  0x71e040647a1f37e6, %r1, %r28
	setx  0x01f2e1613bdd3926, %r1, %r29
	setx  0xcb2bd513c419048e, %r1, %r30
	setx  0xf7ff9c3da0a3d849, %r1, %r31
	setx  MAIN_BASE_DATA_VA, %r1, %r4
	setx  0x0000000000000e90, %r1, %r5
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
	setx  0x80, %r2, %r1
	wr  %r1, %r0, %asi
	ta T_CHANGE_HPRIV !To allow ASI writes to D-I caches
! Store8_ext_asi
	.word 0xc2304001  ! 11: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2284001  ! 11: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2306001  ! 11: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2284001  ! 11: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2284001  ! 11: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2306001  ! 11: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2704001  ! 11: STX_R	stx	%r1, [%r1 + %r1]
	.word 0x2ac80001  ! 11: BRNZ	brnz,a,pt	%0,<label_0x80001>
	.word 0xd6f04ce2  ! 11: STXA_R	stxa	%r11, [%r1 + %r2] 0x67
! Store9_int_asi
	.word 0xc2304001  ! 21: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 21: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2284001  ! 21: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2306001  ! 21: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2306001  ! 21: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2304001  ! 21: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 21: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 21: STW_R	stw	%r1, [%r1 + %r1]
	.word 0x36800001  ! 21: BGE	bge,a	<label_0x1>
	.word 0xd8f00ce2  ! 21: STXA_R	stxa	%r12, [%r0 + %r2] 0x67
! Store8_atm
	.word 0xc2304001  ! 30: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2284001  ! 30: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2306001  ! 30: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2704001  ! 30: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 30: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 30: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2284001  ! 30: STB_R	stb	%r1, [%r1 + %r1]
	.word 0x2cc80001  ! 30: BRGZ	brgz,a,pt	%0,<label_0x80001>
	.word 0xc2e84021  ! 30: LDSTUBA_R	ldstuba	%r1, [%r1 + %r1] 0x01
! Store8_ext_asi
	.word 0xc2304001  ! 39: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 39: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2304001  ! 39: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2206001  ! 39: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0xc2306001  ! 39: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2204001  ! 39: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 39: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0x2cc80001  ! 39: BRGZ	brgz,a,pt	%0,<label_0x80001>
	.word 0xd6f04ce0  ! 39: STXA_R	stxa	%r11, [%r1 + %r0] 0x67
! Store8_ext_asi
	.word 0xc2304001  ! 48: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2306001  ! 48: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2304001  ! 48: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 48: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2286001  ! 48: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2704001  ! 48: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2206001  ! 48: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0x36800001  ! 48: BGE	bge,a	<label_0x1>
	.word 0xd6f1cce1  ! 48: STXA_R	stxa	%r11, [%r7 + %r1] 0x67
! Store8_ext_asi
	.word 0xc2304001  ! 57: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2284001  ! 57: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2306001  ! 57: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2286001  ! 57: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2304001  ! 57: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2304001  ! 57: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 57: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0x38800001  ! 57: BGU	bgu,a	<label_0x1>
	.word 0xd8f24ce3  ! 57: STXA_R	stxa	%r12, [%r9 + %r3] 0x67
! Store9_fp_st
	.word 0xc2304001  ! 67: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 67: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2706001  ! 67: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2284001  ! 67: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2206001  ! 67: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0xc2284001  ! 67: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2286001  ! 67: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2206001  ! 67: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0x22c80001  ! 67: BRZ	brz,a,pt	%0,<label_0x80001>
	.word 0xc3386001  ! 67: STDF_I	std	%f1, [0x0001, %r1]
! Store8_fp_st
	.word 0xc2304001  ! 76: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2306001  ! 76: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2304001  ! 76: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 76: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2284001  ! 76: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 76: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 76: STW_R	stw	%r1, [%r1 + %r1]
	.word 0x2a800001  ! 76: BCS	bcs,a	<label_0x1>
	.word 0xc3204001  ! 76: STF_R	st	%f1, [%r1, %r1]
! Store8_ext_asi
	.word 0xc2304001  ! 85: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2304001  ! 85: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2286001  ! 85: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2306001  ! 85: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2206001  ! 85: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0xc2286001  ! 85: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2284001  ! 85: STB_R	stb	%r1, [%r1 + %r1]
	.word 0x3a800001  ! 85: BCC	bcc,a	<label_0x1>
	.word 0xc2f04021  ! 85: STXA_R	stxa	%r1, [%r1 + %r1] 0x01
! Store8_fp_st
	.word 0xc2304001  ! 94: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2306001  ! 94: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2704001  ! 94: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2306001  ! 94: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2284001  ! 94: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2304001  ! 94: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2284001  ! 94: STB_R	stb	%r1, [%r1 + %r1]
	.word 0x38800001  ! 94: BGU	bgu,a	<label_0x1>
	.word 0xc3384001  ! 94: STDF_R	std	%f1, [%r1, %r1]
! Store9_int_asi
	.word 0xc2304001  ! 104: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2286001  ! 104: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2304001  ! 104: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2306001  ! 104: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2204001  ! 104: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 104: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2304001  ! 104: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 104: STW_R	stw	%r1, [%r1 + %r1]
	.word 0x3a800001  ! 104: BCC	bcc,a	<label_0x1>
	.word 0xd6f00ce2  ! 104: STXA_R	stxa	%r11, [%r0 + %r2] 0x67
! Store9_fp_st
	.word 0xc2304001  ! 114: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2206001  ! 114: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0xc2704001  ! 114: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2304001  ! 114: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2206001  ! 114: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0xc2304001  ! 114: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 114: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2306001  ! 114: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0x3a800001  ! 114: BCC	bcc,a	<label_0x1>
	.word 0xc3204001  ! 114: STF_R	st	%f1, [%r1, %r1]
! Store8
	.word 0xc2304001  ! 123: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2704001  ! 123: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2304001  ! 123: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2286001  ! 123: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2706001  ! 123: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2704001  ! 123: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2286001  ! 123: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0x22800001  ! 123: BE	be,a	<label_0x1>
	.word 0xc2306001  ! 123: STH_I	sth	%r1, [%r1 + 0x0001]
! Store9_ext_asi
	.word 0xc2304001  ! 133: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2286001  ! 133: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2704001  ! 133: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2206001  ! 133: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0xc2704001  ! 133: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2206001  ! 133: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0xc2206001  ! 133: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0x3a800001  ! 133: BCC	bcc,a	<label_0x1>
	.word 0xc2a06001  ! 133: STWA_I	stwa	%r1, [%r1 + 0x0001] %asi
! Store9_atm
	.word 0xc2304001  ! 143: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 143: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2306001  ! 143: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2306001  ! 143: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2206001  ! 143: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0xc2306001  ! 143: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2204001  ! 143: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2286001  ! 143: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0x2e800001  ! 143: BVS	bvs,a	<label_0x1>
	.word 0xc2e86001  ! 143: LDSTUBA_I	ldstuba	%r1, [%r1 + 0x0001] %asi
! Store9_fp_st
	.word 0xc2304001  ! 153: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 153: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 153: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2704001  ! 153: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2306001  ! 153: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2206001  ! 153: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0xc2284001  ! 153: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2306001  ! 153: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0x32800001  ! 153: BNE	bne,a	<label_0x1>
	.word 0xc3386001  ! 153: STDF_I	std	%f1, [0x0001, %r1]
! Store8_ext_asi
	.word 0xc2304001  ! 162: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2306001  ! 162: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2206001  ! 162: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0xc2286001  ! 162: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2284001  ! 162: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2284001  ! 162: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2286001  ! 162: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0x3e800001  ! 162: BVC	bvc,a	<label_0x1>
	.word 0xc2a86001  ! 162: STBA_I	stba	%r1, [%r1 + 0x0001] %asi
! Store8_atm
	.word 0xc2304001  ! 171: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2304001  ! 171: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2284001  ! 171: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 171: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2206001  ! 171: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0xc2286001  ! 171: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2304001  ! 171: STH_R	sth	%r1, [%r1 + %r1]
	.word 0x2ec80001  ! 171: BRGEZ	brgez,a,pt	%0,<label_0x80001>
	.word 0xc2786001  ! 171: SWAP_I	swap	%r1, [%r1 + 0x0001]
! Store9
	.word 0xc2304001  ! 181: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2304001  ! 181: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2304001  ! 181: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2286001  ! 181: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2304001  ! 181: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2206001  ! 181: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0xc2304001  ! 181: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2284001  ! 181: STB_R	stb	%r1, [%r1 + %r1]
	.word 0x3a800001  ! 181: BCC	bcc,a	<label_0x1>
	.word 0xc2204001  ! 181: STW_R	stw	%r1, [%r1 + %r1]
! Store9_fp_st
	.word 0xc2304001  ! 191: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2206001  ! 191: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0xc2206001  ! 191: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0xc2704001  ! 191: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2306001  ! 191: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2704001  ! 191: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 191: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2704001  ! 191: STX_R	stx	%r1, [%r1 + %r1]
	.word 0x26800001  ! 191: BL	bl,a	<label_0x1>
	.word 0xc3206001  ! 191: STF_I	st	%f1, [0x0001, %r1]
! Store8
	.word 0xc2304001  ! 200: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2704001  ! 200: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2704001  ! 200: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 200: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2286001  ! 200: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2284001  ! 200: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 200: STW_R	stw	%r1, [%r1 + %r1]
	.word 0x2ec80001  ! 200: BRGEZ	brgez,a,pt	%0,<label_0x80001>
	.word 0xc2306001  ! 200: STH_I	sth	%r1, [%r1 + 0x0001]
! Store8
	.word 0xc2304001  ! 209: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2286001  ! 209: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2206001  ! 209: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0xc2286001  ! 209: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2304001  ! 209: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 209: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2304001  ! 209: STH_R	sth	%r1, [%r1 + %r1]
	.word 0x40000001  ! 209: CALL	call	disp30_1
	.word 0xc2706001  ! 209: STX_I	stx	%r1, [%r1 + 0x0001]
! Store8_ext_asi
	.word 0xc2304001  ! 218: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 218: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2286001  ! 218: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2304001  ! 218: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 218: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 218: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2306001  ! 218: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0x2ec80001  ! 218: BRGEZ	brgez,a,pt	%0,<label_0x80001>
	.word 0xd8f18ce3  ! 218: STXA_R	stxa	%r12, [%r6 + %r3] 0x67
! Store8
	.word 0xc2304001  ! 227: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2306001  ! 227: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2306001  ! 227: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2204001  ! 227: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2306001  ! 227: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2706001  ! 227: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2306001  ! 227: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0x2cc80001  ! 227: BRGZ	brgz,a,pt	%0,<label_0x80001>
	.word 0xc2706001  ! 227: STX_I	stx	%r1, [%r1 + 0x0001]
! Store9_fp_st
	.word 0xc2304001  ! 237: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2306001  ! 237: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2304001  ! 237: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2286001  ! 237: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2306001  ! 237: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2204001  ! 237: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2306001  ! 237: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2706001  ! 237: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0x2ec80001  ! 237: BRGEZ	brgez,a,pt	%0,<label_0x80001>
	.word 0xc3386001  ! 237: STDF_I	std	%f1, [0x0001, %r1]
! Store8_ext_asi
	.word 0xc2304001  ! 246: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2206001  ! 246: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0xc2306001  ! 246: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2206001  ! 246: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0xc2204001  ! 246: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2304001  ! 246: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2206001  ! 246: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0x22c80001  ! 246: BRZ	brz,a,pt	%0,<label_0x80001>
	.word 0xd6f18982  ! 246: STXA_R	stxa	%r11, [%r6 + %r2] 0x4c
! Store9_atm
	.word 0xc2304001  ! 256: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2206001  ! 256: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0xc2704001  ! 256: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2704001  ! 256: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2206001  ! 256: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0xc2306001  ! 256: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2206001  ! 256: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0xc2304001  ! 256: STH_R	sth	%r1, [%r1 + %r1]
	.word 0x32800001  ! 256: BNE	bne,a	<label_0x1>
	.word 0xc3e04021  ! 256: CASA_I	casa	[%r1] 0x 1, %r1, %r1
! Store9_fp_st
	.word 0xc2304001  ! 266: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2306001  ! 266: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2206001  ! 266: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0xc2284001  ! 266: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2704001  ! 266: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2284001  ! 266: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2286001  ! 266: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2284001  ! 266: STB_R	stb	%r1, [%r1 + %r1]
	.word 0x34800001  ! 266: BG	bg,a	<label_0x1>
	.word 0xc3384001  ! 266: STDF_R	std	%f1, [%r1, %r1]
! Store9
	.word 0xc2304001  ! 276: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2704001  ! 276: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2304001  ! 276: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 276: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2204001  ! 276: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2284001  ! 276: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2306001  ! 276: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2306001  ! 276: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0x2ec80001  ! 276: BRGEZ	brgez,a,pt	%0,<label_0x80001>
	.word 0xc2704001  ! 276: STX_R	stx	%r1, [%r1 + %r1]
! Store8_atm
	.word 0xc2304001  ! 285: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2284001  ! 285: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2304001  ! 285: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2286001  ! 285: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2306001  ! 285: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2704001  ! 285: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2704001  ! 285: STX_R	stx	%r1, [%r1 + %r1]
	.word 0x2e800001  ! 285: BVS	bvs,a	<label_0x1>
	.word 0xc2e86001  ! 285: LDSTUBA_I	ldstuba	%r1, [%r1 + 0x0001] %asi
! Store8_atm
	.word 0xc2304001  ! 294: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2704001  ! 294: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2286001  ! 294: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2204001  ! 294: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2704001  ! 294: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2286001  ! 294: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2704001  ! 294: STX_R	stx	%r1, [%r1 + %r1]
	.word 0x2e800001  ! 294: BVS	bvs,a	<label_0x1>
	.word 0xc3f06001  ! 294: CASXA_R	casxa	[%r1]%asi, %r1, %r1
! Store8_ext_asi
	.word 0xc2304001  ! 303: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2284001  ! 303: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2284001  ! 303: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2286001  ! 303: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2204001  ! 303: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2206001  ! 303: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0xc2706001  ! 303: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0x28800001  ! 303: BLEU	bleu,a	<label_0x1>
	.word 0xc2a04021  ! 303: STWA_R	stwa	%r1, [%r1 + %r1] 0x01
! Store8_ext_asi
	.word 0xc2304001  ! 312: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2704001  ! 312: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2704001  ! 312: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2286001  ! 312: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2704001  ! 312: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2306001  ! 312: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2284001  ! 312: STB_R	stb	%r1, [%r1 + %r1]
	.word 0x24c80001  ! 312: BRLEZ	brlez,a,pt	%0,<label_0x80001>
	.word 0xc2f04021  ! 312: STXA_R	stxa	%r1, [%r1 + %r1] 0x01
! Store8_ext_asi
	.word 0xc2304001  ! 321: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2284001  ! 321: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 321: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2704001  ! 321: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2304001  ! 321: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2304001  ! 321: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2284001  ! 321: STB_R	stb	%r1, [%r1 + %r1]
	.word 0x2cc80001  ! 321: BRGZ	brgz,a,pt	%0,<label_0x80001>
	.word 0xc2a04021  ! 321: STWA_R	stwa	%r1, [%r1 + %r1] 0x01
! Store9_fp_st
	.word 0xc2304001  ! 331: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2304001  ! 331: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2304001  ! 331: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2286001  ! 331: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2704001  ! 331: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 331: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 331: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2286001  ! 331: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0x28800001  ! 331: BLEU	bleu,a	<label_0x1>
	.word 0xc3386001  ! 331: STDF_I	std	%f1, [0x0001, %r1]
! Store8_fp_st
	.word 0xc2304001  ! 340: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2284001  ! 340: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 340: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2204001  ! 340: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 340: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 340: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2304001  ! 340: STH_R	sth	%r1, [%r1 + %r1]
	.word 0x2e800001  ! 340: BVS	bvs,a	<label_0x1>
	.word 0xc3204001  ! 340: STF_R	st	%f1, [%r1, %r1]
! Store9
	.word 0xc2304001  ! 350: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2286001  ! 350: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2304001  ! 350: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 350: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 350: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 350: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2286001  ! 350: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2706001  ! 350: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0x26c80001  ! 350: BRLZ	brlz,a,pt	%0,<label_0x80001>
	.word 0xc2204001  ! 350: STW_R	stw	%r1, [%r1 + %r1]
! Store9_atm
	.word 0xc2304001  ! 360: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 360: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2304001  ! 360: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2306001  ! 360: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2304001  ! 360: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 360: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2286001  ! 360: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2304001  ! 360: STH_R	sth	%r1, [%r1 + %r1]
	.word 0x3a800001  ! 360: BCC	bcc,a	<label_0x1>
	.word 0xc3e04021  ! 360: CASA_I	casa	[%r1] 0x 1, %r1, %r1
! Store8_fp_st
	.word 0xc2304001  ! 369: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 369: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2206001  ! 369: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0xc2286001  ! 369: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2206001  ! 369: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0xc2304001  ! 369: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2704001  ! 369: STX_R	stx	%r1, [%r1 + %r1]
	.word 0x2ac80001  ! 369: BRNZ	brnz,a,pt	%0,<label_0x80001>
	.word 0xc3204001  ! 369: STF_R	st	%f1, [%r1, %r1]
! Store9_ext_asi
	.word 0xc2304001  ! 379: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2284001  ! 379: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2206001  ! 379: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0xc2706001  ! 379: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2204001  ! 379: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2284001  ! 379: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2306001  ! 379: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0x30800001  ! 379: BA	ba,a	<label_0x1>
	.word 0xc2b84021  ! 379: STDA_R	stda	%r1, [%r1 + %r1] 0x01
! Store9_atm
	.word 0xc2304001  ! 389: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2306001  ! 389: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2704001  ! 389: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 389: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2204001  ! 389: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2304001  ! 389: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2304001  ! 389: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2286001  ! 389: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0x34800001  ! 389: BG	bg,a	<label_0x1>
	.word 0xc3f06001  ! 389: CASXA_R	casxa	[%r1]%asi, %r1, %r1
! Store8
	.word 0xc2304001  ! 398: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2286001  ! 398: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2306001  ! 398: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2706001  ! 398: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2704001  ! 398: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2704001  ! 398: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2304001  ! 398: STH_R	sth	%r1, [%r1 + %r1]
	.word 0x2cc80001  ! 398: BRGZ	brgz,a,pt	%0,<label_0x80001>
	.word 0xc2206001  ! 398: STW_I	stw	%r1, [%r1 + 0x0001]
! Store8_ext_asi
	.word 0xc2304001  ! 407: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2304001  ! 407: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2284001  ! 407: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 407: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2704001  ! 407: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 407: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 407: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0x2e800001  ! 407: BVS	bvs,a	<label_0x1>
	.word 0xd6f08ce7  ! 407: STXA_R	stxa	%r11, [%r2 + %r7] 0x67
! Store9_int_asi
	.word 0xc2304001  ! 417: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2304001  ! 417: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2284001  ! 417: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 417: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 417: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 417: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2284001  ! 417: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2704001  ! 417: STX_R	stx	%r1, [%r1 + %r1]
	.word 0x24c80001  ! 417: BRLEZ	brlez,a,pt	%0,<label_0x80001>
	.word 0xd6f0cce2  ! 417: STXA_R	stxa	%r11, [%r3 + %r2] 0x67
! Store9
	.word 0xc2304001  ! 427: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 427: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2286001  ! 427: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2286001  ! 427: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2204001  ! 427: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 427: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2704001  ! 427: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 427: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0x3a800001  ! 427: BCC	bcc,a	<label_0x1>
	.word 0xc2204001  ! 427: STW_R	stw	%r1, [%r1 + %r1]
! Store9_ext_asi
	.word 0xc2304001  ! 437: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 437: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2204001  ! 437: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2306001  ! 437: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2204001  ! 437: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2286001  ! 437: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2704001  ! 437: STX_R	stx	%r1, [%r1 + %r1]
	.word 0x20800001  ! 437: BN	bn,a	<label_0x1>
	.word 0xc2a84021  ! 437: STBA_R	stba	%r1, [%r1 + %r1] 0x01
! Store9_ext_asi
	.word 0xc2304001  ! 447: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 447: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2706001  ! 447: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2306001  ! 447: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2704001  ! 447: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2206001  ! 447: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0xc2286001  ! 447: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0x22800001  ! 447: BE	be,a	<label_0x1>
	.word 0xc2b06001  ! 447: STHA_I	stha	%r1, [%r1 + 0x0001] %asi
! Store9_ext_asi
	.word 0xc2304001  ! 457: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2284001  ! 457: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2284001  ! 457: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2284001  ! 457: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 457: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2704001  ! 457: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 457: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0x2a800001  ! 457: BCS	bcs,a	<label_0x1>
	.word 0xc2b84021  ! 457: STDA_R	stda	%r1, [%r1 + %r1] 0x01
! Store8_ext_asi
	.word 0xc2304001  ! 466: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2306001  ! 466: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2306001  ! 466: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2306001  ! 466: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2706001  ! 466: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2704001  ! 466: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2286001  ! 466: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0x24c80001  ! 466: BRLEZ	brlez,a,pt	%0,<label_0x80001>
	.word 0xd6f08ce9  ! 466: STXA_R	stxa	%r11, [%r2 + %r9] 0x67
! Store8_fp_st
	.word 0xc2304001  ! 475: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2284001  ! 475: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2304001  ! 475: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 475: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2304001  ! 475: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2206001  ! 475: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0xc2306001  ! 475: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0x2ac80001  ! 475: BRNZ	brnz,a,pt	%0,<label_0x80001>
	.word 0xc3384001  ! 475: STDF_R	std	%f1, [%r1, %r1]
! Store9_int_asi
	.word 0xc2304001  ! 485: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 485: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2304001  ! 485: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2304001  ! 485: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 485: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2304001  ! 485: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 485: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2206001  ! 485: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0x24800001  ! 485: BLE	ble,a	<label_0x1>
	.word 0xd8f20ce6  ! 485: STXA_R	stxa	%r12, [%r8 + %r6] 0x67
! Store9_fp_st
	.word 0xc2304001  ! 495: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2306001  ! 495: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2204001  ! 495: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2304001  ! 495: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 495: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 495: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2706001  ! 495: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2204001  ! 495: STW_R	stw	%r1, [%r1 + %r1]
	.word 0x24c80001  ! 495: BRLEZ	brlez,a,pt	%0,<label_0x80001>
	.word 0xc3204001  ! 495: STF_R	st	%f1, [%r1, %r1]
	nop
	nop
        ta      T_GOOD_TRAP

th_main_1:
	setx  0xf89cbb2d009b8630, %r1, %r1
	setx  0x4e78be9f0643b118, %r1, %r2
	setx  0x96a5fb540e80f4d8, %r1, %r3
	setx  0x183808650252dd40, %r1, %r6
	setx  0x2bad01420bdaa3b0, %r1, %r7
	setx  0xf03e3c41090d8428, %r1, %r8
	setx  0xfc355ef20435eaa8, %r1, %r9
	setx  0x20f04a30f3c8862b, %r1, %r11
	setx  0xccfd3c3088e8c680, %r1, %r12
	setx  0xe243e1bbbbe0f985, %r1, %r13
	setx  0xc402f82e73e95ab0, %r1, %r14
	setx  0x2594502729cfaead, %r1, %r15
	setx  0x94259cdf752ac981, %r1, %r16
	setx  0x7003c075ecf462da, %r1, %r17
	setx  0x841b8449f8d5dbd0, %r1, %r18
	setx  0x60ecbaeada9484b9, %r1, %r19
	setx  0x1caea2b7f577bb89, %r1, %r20
	setx  0x387d85d2dd035414, %r1, %r21
	setx  0xe1d5160a7134dbb6, %r1, %r22
	setx  0xae92f83d9f74ac23, %r1, %r23
	setx  0x7ec1fe973ba1ca6e, %r1, %r24
	setx  0x16e25c3b73270661, %r1, %r25
	setx  0xc3191e6f3c09419f, %r1, %r26
	setx  0x5eaa3646b730ad66, %r1, %r27
	setx  0x71e040647a1f37e6, %r1, %r28
	setx  0x01f2e1613bdd3926, %r1, %r29
	setx  0xcb2bd513c419048e, %r1, %r30
	setx  0xf7ff9c3da0a3d849, %r1, %r31
	setx  MAIN_BASE_DATA_VA, %r1, %r4
	setx  0x0000000000000e90, %r1, %r5
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
	setx  0x80, %r2, %r1
	wr  %r1, %r0, %asi
	ta T_CHANGE_HPRIV !To allow ASI writes to D-I caches
! Store8_ext_asi
	.word 0xc2304001  ! 11: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2284001  ! 11: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2306001  ! 11: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2284001  ! 11: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2284001  ! 11: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2306001  ! 11: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2704001  ! 11: STX_R	stx	%r1, [%r1 + %r1]
	.word 0x2ac80001  ! 11: BRNZ	brnz,a,pt	%0,<label_0x80001>
	.word 0xd6f08983  ! 11: STXA_R	stxa	%r11, [%r2 + %r3] 0x4c
! Store9_int_asi
	.word 0xc2304001  ! 21: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 21: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2284001  ! 21: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2306001  ! 21: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2306001  ! 21: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2304001  ! 21: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 21: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 21: STW_R	stw	%r1, [%r1 + %r1]
	.word 0x36800001  ! 21: BGE	bge,a	<label_0x1>
	.word 0xd6f24983  ! 21: STXA_R	stxa	%r11, [%r9 + %r3] 0x4c
! Store8_atm
	.word 0xc2304001  ! 30: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2284001  ! 30: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2306001  ! 30: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2704001  ! 30: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 30: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 30: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2284001  ! 30: STB_R	stb	%r1, [%r1 + %r1]
	.word 0x2cc80001  ! 30: BRGZ	brgz,a,pt	%0,<label_0x80001>
	.word 0xc2e84021  ! 30: LDSTUBA_R	ldstuba	%r1, [%r1 + %r1] 0x01
! Store8_ext_asi
	.word 0xc2304001  ! 39: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 39: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2304001  ! 39: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2206001  ! 39: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0xc2306001  ! 39: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2204001  ! 39: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 39: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0x2cc80001  ! 39: BRGZ	brgz,a,pt	%0,<label_0x80001>
	.word 0xd6f20ce1  ! 39: STXA_R	stxa	%r11, [%r8 + %r1] 0x67
! Store8_ext_asi
	.word 0xc2304001  ! 48: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2306001  ! 48: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2304001  ! 48: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 48: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2286001  ! 48: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2704001  ! 48: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2206001  ! 48: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0x36800001  ! 48: BGE	bge,a	<label_0x1>
	.word 0xd8f08ce2  ! 48: STXA_R	stxa	%r12, [%r2 + %r2] 0x67
! Store8_ext_asi
	.word 0xc2304001  ! 57: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2284001  ! 57: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2306001  ! 57: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2286001  ! 57: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2304001  ! 57: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2304001  ! 57: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 57: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0x38800001  ! 57: BGU	bgu,a	<label_0x1>
	.word 0xd6f08ce8  ! 57: STXA_R	stxa	%r11, [%r2 + %r8] 0x67
! Store9_fp_st
	.word 0xc2304001  ! 67: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 67: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2706001  ! 67: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2284001  ! 67: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2206001  ! 67: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0xc2284001  ! 67: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2286001  ! 67: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2206001  ! 67: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0x22c80001  ! 67: BRZ	brz,a,pt	%0,<label_0x80001>
	.word 0xc3386001  ! 67: STDF_I	std	%f1, [0x0001, %r1]
! Store8_fp_st
	.word 0xc2304001  ! 76: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2306001  ! 76: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2304001  ! 76: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 76: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2284001  ! 76: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 76: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 76: STW_R	stw	%r1, [%r1 + %r1]
	.word 0x2a800001  ! 76: BCS	bcs,a	<label_0x1>
	.word 0xc3204001  ! 76: STF_R	st	%f1, [%r1, %r1]
! Store8_ext_asi
	.word 0xc2304001  ! 85: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2304001  ! 85: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2286001  ! 85: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2306001  ! 85: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2206001  ! 85: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0xc2286001  ! 85: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2284001  ! 85: STB_R	stb	%r1, [%r1 + %r1]
	.word 0x3a800001  ! 85: BCC	bcc,a	<label_0x1>
	.word 0xc2f04021  ! 85: STXA_R	stxa	%r1, [%r1 + %r1] 0x01
! Store8_fp_st
	.word 0xc2304001  ! 94: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2306001  ! 94: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2704001  ! 94: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2306001  ! 94: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2284001  ! 94: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2304001  ! 94: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2284001  ! 94: STB_R	stb	%r1, [%r1 + %r1]
	.word 0x38800001  ! 94: BGU	bgu,a	<label_0x1>
	.word 0xc3384001  ! 94: STDF_R	std	%f1, [%r1, %r1]
! Store9_int_asi
	.word 0xc2304001  ! 104: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2286001  ! 104: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2304001  ! 104: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2306001  ! 104: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2204001  ! 104: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 104: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2304001  ! 104: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 104: STW_R	stw	%r1, [%r1 + %r1]
	.word 0x3a800001  ! 104: BCC	bcc,a	<label_0x1>
	.word 0xd6f24967  ! 104: STXA_R	stxa	%r11, [%r9 + %r7] 0x4b
! Store9_fp_st
	.word 0xc2304001  ! 114: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2206001  ! 114: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0xc2704001  ! 114: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2304001  ! 114: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2206001  ! 114: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0xc2304001  ! 114: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 114: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2306001  ! 114: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0x3a800001  ! 114: BCC	bcc,a	<label_0x1>
	.word 0xc3204001  ! 114: STF_R	st	%f1, [%r1, %r1]
! Store8
	.word 0xc2304001  ! 123: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2704001  ! 123: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2304001  ! 123: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2286001  ! 123: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2706001  ! 123: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2704001  ! 123: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2286001  ! 123: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0x22800001  ! 123: BE	be,a	<label_0x1>
	.word 0xc2306001  ! 123: STH_I	sth	%r1, [%r1 + 0x0001]
! Store9_ext_asi
	.word 0xc2304001  ! 133: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2286001  ! 133: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2704001  ! 133: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2206001  ! 133: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0xc2704001  ! 133: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2206001  ! 133: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0xc2206001  ! 133: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0x3a800001  ! 133: BCC	bcc,a	<label_0x1>
	.word 0xc2a06001  ! 133: STWA_I	stwa	%r1, [%r1 + 0x0001] %asi
! Store9_atm
	.word 0xc2304001  ! 143: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 143: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2306001  ! 143: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2306001  ! 143: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2206001  ! 143: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0xc2306001  ! 143: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2204001  ! 143: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2286001  ! 143: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0x2e800001  ! 143: BVS	bvs,a	<label_0x1>
	.word 0xc2e86001  ! 143: LDSTUBA_I	ldstuba	%r1, [%r1 + 0x0001] %asi
! Store9_fp_st
	.word 0xc2304001  ! 153: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 153: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 153: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2704001  ! 153: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2306001  ! 153: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2206001  ! 153: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0xc2284001  ! 153: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2306001  ! 153: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0x32800001  ! 153: BNE	bne,a	<label_0x1>
	.word 0xc3386001  ! 153: STDF_I	std	%f1, [0x0001, %r1]
! Store8_ext_asi
	.word 0xc2304001  ! 162: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2306001  ! 162: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2206001  ! 162: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0xc2286001  ! 162: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2284001  ! 162: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2284001  ! 162: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2286001  ! 162: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0x3e800001  ! 162: BVC	bvc,a	<label_0x1>
	.word 0xc2a86001  ! 162: STBA_I	stba	%r1, [%r1 + 0x0001] %asi
! Store8_atm
	.word 0xc2304001  ! 171: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2304001  ! 171: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2284001  ! 171: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 171: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2206001  ! 171: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0xc2286001  ! 171: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2304001  ! 171: STH_R	sth	%r1, [%r1 + %r1]
	.word 0x2ec80001  ! 171: BRGEZ	brgez,a,pt	%0,<label_0x80001>
	.word 0xc2786001  ! 171: SWAP_I	swap	%r1, [%r1 + 0x0001]
! Store9
	.word 0xc2304001  ! 181: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2304001  ! 181: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2304001  ! 181: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2286001  ! 181: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2304001  ! 181: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2206001  ! 181: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0xc2304001  ! 181: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2284001  ! 181: STB_R	stb	%r1, [%r1 + %r1]
	.word 0x3a800001  ! 181: BCC	bcc,a	<label_0x1>
	.word 0xc2204001  ! 181: STW_R	stw	%r1, [%r1 + %r1]
! Store9_fp_st
	.word 0xc2304001  ! 191: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2206001  ! 191: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0xc2206001  ! 191: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0xc2704001  ! 191: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2306001  ! 191: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2704001  ! 191: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 191: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2704001  ! 191: STX_R	stx	%r1, [%r1 + %r1]
	.word 0x26800001  ! 191: BL	bl,a	<label_0x1>
	.word 0xc3206001  ! 191: STF_I	st	%f1, [0x0001, %r1]
! Store8
	.word 0xc2304001  ! 200: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2704001  ! 200: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2704001  ! 200: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 200: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2286001  ! 200: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2284001  ! 200: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 200: STW_R	stw	%r1, [%r1 + %r1]
	.word 0x2ec80001  ! 200: BRGEZ	brgez,a,pt	%0,<label_0x80001>
	.word 0xc2306001  ! 200: STH_I	sth	%r1, [%r1 + 0x0001]
! Store8
	.word 0xc2304001  ! 209: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2286001  ! 209: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2206001  ! 209: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0xc2286001  ! 209: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2304001  ! 209: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 209: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2304001  ! 209: STH_R	sth	%r1, [%r1 + %r1]
	.word 0x40000001  ! 209: CALL	call	disp30_1
	.word 0xc2706001  ! 209: STX_I	stx	%r1, [%r1 + 0x0001]
! Store8_ext_asi
	.word 0xc2304001  ! 218: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 218: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2286001  ! 218: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2304001  ! 218: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 218: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 218: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2306001  ! 218: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0x2ec80001  ! 218: BRGEZ	brgez,a,pt	%0,<label_0x80001>
	.word 0xd6f0cce2  ! 218: STXA_R	stxa	%r11, [%r3 + %r2] 0x67
! Store8
	.word 0xc2304001  ! 227: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2306001  ! 227: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2306001  ! 227: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2204001  ! 227: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2306001  ! 227: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2706001  ! 227: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2306001  ! 227: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0x2cc80001  ! 227: BRGZ	brgz,a,pt	%0,<label_0x80001>
	.word 0xc2706001  ! 227: STX_I	stx	%r1, [%r1 + 0x0001]
! Store9_fp_st
	.word 0xc2304001  ! 237: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2306001  ! 237: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2304001  ! 237: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2286001  ! 237: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2306001  ! 237: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2204001  ! 237: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2306001  ! 237: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2706001  ! 237: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0x2ec80001  ! 237: BRGEZ	brgez,a,pt	%0,<label_0x80001>
	.word 0xc3386001  ! 237: STDF_I	std	%f1, [0x0001, %r1]
! Store8_ext_asi
	.word 0xc2304001  ! 246: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2206001  ! 246: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0xc2306001  ! 246: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2206001  ! 246: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0xc2204001  ! 246: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2304001  ! 246: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2206001  ! 246: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0x22c80001  ! 246: BRZ	brz,a,pt	%0,<label_0x80001>
	.word 0xd6f08962  ! 246: STXA_R	stxa	%r11, [%r2 + %r2] 0x4b
! Store9_atm
	.word 0xc2304001  ! 256: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2206001  ! 256: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0xc2704001  ! 256: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2704001  ! 256: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2206001  ! 256: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0xc2306001  ! 256: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2206001  ! 256: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0xc2304001  ! 256: STH_R	sth	%r1, [%r1 + %r1]
	.word 0x32800001  ! 256: BNE	bne,a	<label_0x1>
	.word 0xc3e04021  ! 256: CASA_I	casa	[%r1] 0x 1, %r1, %r1
! Store9_fp_st
	.word 0xc2304001  ! 266: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2306001  ! 266: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2206001  ! 266: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0xc2284001  ! 266: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2704001  ! 266: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2284001  ! 266: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2286001  ! 266: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2284001  ! 266: STB_R	stb	%r1, [%r1 + %r1]
	.word 0x34800001  ! 266: BG	bg,a	<label_0x1>
	.word 0xc3384001  ! 266: STDF_R	std	%f1, [%r1, %r1]
! Store9
	.word 0xc2304001  ! 276: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2704001  ! 276: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2304001  ! 276: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 276: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2204001  ! 276: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2284001  ! 276: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2306001  ! 276: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2306001  ! 276: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0x2ec80001  ! 276: BRGEZ	brgez,a,pt	%0,<label_0x80001>
	.word 0xc2704001  ! 276: STX_R	stx	%r1, [%r1 + %r1]
! Store8_atm
	.word 0xc2304001  ! 285: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2284001  ! 285: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2304001  ! 285: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2286001  ! 285: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2306001  ! 285: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2704001  ! 285: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2704001  ! 285: STX_R	stx	%r1, [%r1 + %r1]
	.word 0x2e800001  ! 285: BVS	bvs,a	<label_0x1>
	.word 0xc2e86001  ! 285: LDSTUBA_I	ldstuba	%r1, [%r1 + 0x0001] %asi
! Store8_atm
	.word 0xc2304001  ! 294: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2704001  ! 294: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2286001  ! 294: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2204001  ! 294: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2704001  ! 294: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2286001  ! 294: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2704001  ! 294: STX_R	stx	%r1, [%r1 + %r1]
	.word 0x2e800001  ! 294: BVS	bvs,a	<label_0x1>
	.word 0xc3f06001  ! 294: CASXA_R	casxa	[%r1]%asi, %r1, %r1
! Store8_ext_asi
	.word 0xc2304001  ! 303: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2284001  ! 303: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2284001  ! 303: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2286001  ! 303: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2204001  ! 303: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2206001  ! 303: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0xc2706001  ! 303: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0x28800001  ! 303: BLEU	bleu,a	<label_0x1>
	.word 0xc2a04021  ! 303: STWA_R	stwa	%r1, [%r1 + %r1] 0x01
! Store8_ext_asi
	.word 0xc2304001  ! 312: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2704001  ! 312: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2704001  ! 312: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2286001  ! 312: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2704001  ! 312: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2306001  ! 312: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2284001  ! 312: STB_R	stb	%r1, [%r1 + %r1]
	.word 0x24c80001  ! 312: BRLEZ	brlez,a,pt	%0,<label_0x80001>
	.word 0xc2f04021  ! 312: STXA_R	stxa	%r1, [%r1 + %r1] 0x01
! Store8_ext_asi
	.word 0xc2304001  ! 321: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2284001  ! 321: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 321: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2704001  ! 321: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2304001  ! 321: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2304001  ! 321: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2284001  ! 321: STB_R	stb	%r1, [%r1 + %r1]
	.word 0x2cc80001  ! 321: BRGZ	brgz,a,pt	%0,<label_0x80001>
	.word 0xc2a04021  ! 321: STWA_R	stwa	%r1, [%r1 + %r1] 0x01
! Store9_fp_st
	.word 0xc2304001  ! 331: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2304001  ! 331: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2304001  ! 331: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2286001  ! 331: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2704001  ! 331: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 331: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 331: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2286001  ! 331: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0x28800001  ! 331: BLEU	bleu,a	<label_0x1>
	.word 0xc3386001  ! 331: STDF_I	std	%f1, [0x0001, %r1]
! Store8_fp_st
	.word 0xc2304001  ! 340: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2284001  ! 340: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 340: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2204001  ! 340: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 340: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 340: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2304001  ! 340: STH_R	sth	%r1, [%r1 + %r1]
	.word 0x2e800001  ! 340: BVS	bvs,a	<label_0x1>
	.word 0xc3204001  ! 340: STF_R	st	%f1, [%r1, %r1]
! Store9
	.word 0xc2304001  ! 350: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2286001  ! 350: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2304001  ! 350: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 350: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 350: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 350: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2286001  ! 350: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2706001  ! 350: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0x26c80001  ! 350: BRLZ	brlz,a,pt	%0,<label_0x80001>
	.word 0xc2204001  ! 350: STW_R	stw	%r1, [%r1 + %r1]
! Store9_atm
	.word 0xc2304001  ! 360: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 360: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2304001  ! 360: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2306001  ! 360: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2304001  ! 360: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 360: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2286001  ! 360: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2304001  ! 360: STH_R	sth	%r1, [%r1 + %r1]
	.word 0x3a800001  ! 360: BCC	bcc,a	<label_0x1>
	.word 0xc3e04021  ! 360: CASA_I	casa	[%r1] 0x 1, %r1, %r1
! Store8_fp_st
	.word 0xc2304001  ! 369: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 369: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2206001  ! 369: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0xc2286001  ! 369: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2206001  ! 369: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0xc2304001  ! 369: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2704001  ! 369: STX_R	stx	%r1, [%r1 + %r1]
	.word 0x2ac80001  ! 369: BRNZ	brnz,a,pt	%0,<label_0x80001>
	.word 0xc3204001  ! 369: STF_R	st	%f1, [%r1, %r1]
! Store9_ext_asi
	.word 0xc2304001  ! 379: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2284001  ! 379: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2206001  ! 379: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0xc2706001  ! 379: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2204001  ! 379: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2284001  ! 379: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2306001  ! 379: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0x30800001  ! 379: BA	ba,a	<label_0x1>
	.word 0xc2b84021  ! 379: STDA_R	stda	%r1, [%r1 + %r1] 0x01
! Store9_atm
	.word 0xc2304001  ! 389: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2306001  ! 389: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2704001  ! 389: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 389: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2204001  ! 389: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2304001  ! 389: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2304001  ! 389: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2286001  ! 389: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0x34800001  ! 389: BG	bg,a	<label_0x1>
	.word 0xc3f06001  ! 389: CASXA_R	casxa	[%r1]%asi, %r1, %r1
! Store8
	.word 0xc2304001  ! 398: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2286001  ! 398: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2306001  ! 398: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2706001  ! 398: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2704001  ! 398: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2704001  ! 398: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2304001  ! 398: STH_R	sth	%r1, [%r1 + %r1]
	.word 0x2cc80001  ! 398: BRGZ	brgz,a,pt	%0,<label_0x80001>
	.word 0xc2206001  ! 398: STW_I	stw	%r1, [%r1 + 0x0001]
! Store8_ext_asi
	.word 0xc2304001  ! 407: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2304001  ! 407: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2284001  ! 407: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 407: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2704001  ! 407: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 407: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 407: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0x2e800001  ! 407: BVS	bvs,a	<label_0x1>
	.word 0xd6f18983  ! 407: STXA_R	stxa	%r11, [%r6 + %r3] 0x4c
! Store9_int_asi
	.word 0xc2304001  ! 417: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2304001  ! 417: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2284001  ! 417: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 417: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 417: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 417: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2284001  ! 417: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2704001  ! 417: STX_R	stx	%r1, [%r1 + %r1]
	.word 0x24c80001  ! 417: BRLEZ	brlez,a,pt	%0,<label_0x80001>
	.word 0xd6f08960  ! 417: STXA_R	stxa	%r11, [%r2 + %r0] 0x4b
! Store9
	.word 0xc2304001  ! 427: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 427: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2286001  ! 427: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2286001  ! 427: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2204001  ! 427: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 427: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2704001  ! 427: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 427: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0x3a800001  ! 427: BCC	bcc,a	<label_0x1>
	.word 0xc2204001  ! 427: STW_R	stw	%r1, [%r1 + %r1]
! Store9_ext_asi
	.word 0xc2304001  ! 437: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 437: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2204001  ! 437: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2306001  ! 437: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2204001  ! 437: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2286001  ! 437: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2704001  ! 437: STX_R	stx	%r1, [%r1 + %r1]
	.word 0x20800001  ! 437: BN	bn,a	<label_0x1>
	.word 0xc2a84021  ! 437: STBA_R	stba	%r1, [%r1 + %r1] 0x01
! Store9_ext_asi
	.word 0xc2304001  ! 447: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 447: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2706001  ! 447: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2306001  ! 447: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2704001  ! 447: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2206001  ! 447: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0xc2286001  ! 447: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0x22800001  ! 447: BE	be,a	<label_0x1>
	.word 0xc2b06001  ! 447: STHA_I	stha	%r1, [%r1 + 0x0001] %asi
! Store9_ext_asi
	.word 0xc2304001  ! 457: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2284001  ! 457: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2284001  ! 457: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2284001  ! 457: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 457: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2704001  ! 457: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 457: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0x2a800001  ! 457: BCS	bcs,a	<label_0x1>
	.word 0xc2b84021  ! 457: STDA_R	stda	%r1, [%r1 + %r1] 0x01
! Store8_ext_asi
	.word 0xc2304001  ! 466: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2306001  ! 466: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2306001  ! 466: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2306001  ! 466: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2706001  ! 466: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2704001  ! 466: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2286001  ! 466: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0x24c80001  ! 466: BRLEZ	brlez,a,pt	%0,<label_0x80001>
	.word 0xd6f0cce0  ! 466: STXA_R	stxa	%r11, [%r3 + %r0] 0x67
! Store8_fp_st
	.word 0xc2304001  ! 475: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2284001  ! 475: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2304001  ! 475: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 475: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2304001  ! 475: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2206001  ! 475: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0xc2306001  ! 475: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0x2ac80001  ! 475: BRNZ	brnz,a,pt	%0,<label_0x80001>
	.word 0xc3384001  ! 475: STDF_R	std	%f1, [%r1, %r1]
! Store9_int_asi
	.word 0xc2304001  ! 485: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 485: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2304001  ! 485: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2304001  ! 485: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 485: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2304001  ! 485: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 485: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2206001  ! 485: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0x24800001  ! 485: BLE	ble,a	<label_0x1>
	.word 0xd8f1cce3  ! 485: STXA_R	stxa	%r12, [%r7 + %r3] 0x67
! Store9_fp_st
	.word 0xc2304001  ! 495: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2306001  ! 495: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2204001  ! 495: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2304001  ! 495: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 495: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 495: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2706001  ! 495: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2204001  ! 495: STW_R	stw	%r1, [%r1 + %r1]
	.word 0x24c80001  ! 495: BRLEZ	brlez,a,pt	%0,<label_0x80001>
	.word 0xc3204001  ! 495: STF_R	st	%f1, [%r1, %r1]
	nop
	nop
        ta      T_GOOD_TRAP

th_main_2:
	setx  0xf89cbb2d009b8630, %r1, %r1
	setx  0x4e78be9f0643b118, %r1, %r2
	setx  0x96a5fb540e80f4d8, %r1, %r3
	setx  0x183808650252dd40, %r1, %r6
	setx  0x2bad01420bdaa3b0, %r1, %r7
	setx  0xf03e3c41090d8428, %r1, %r8
	setx  0xfc355ef20435eaa8, %r1, %r9
	setx  0x20f04a30f3c8862b, %r1, %r11
	setx  0xccfd3c3088e8c680, %r1, %r12
	setx  0xe243e1bbbbe0f985, %r1, %r13
	setx  0xc402f82e73e95ab0, %r1, %r14
	setx  0x2594502729cfaead, %r1, %r15
	setx  0x94259cdf752ac981, %r1, %r16
	setx  0x7003c075ecf462da, %r1, %r17
	setx  0x841b8449f8d5dbd0, %r1, %r18
	setx  0x60ecbaeada9484b9, %r1, %r19
	setx  0x1caea2b7f577bb89, %r1, %r20
	setx  0x387d85d2dd035414, %r1, %r21
	setx  0xe1d5160a7134dbb6, %r1, %r22
	setx  0xae92f83d9f74ac23, %r1, %r23
	setx  0x7ec1fe973ba1ca6e, %r1, %r24
	setx  0x16e25c3b73270661, %r1, %r25
	setx  0xc3191e6f3c09419f, %r1, %r26
	setx  0x5eaa3646b730ad66, %r1, %r27
	setx  0x71e040647a1f37e6, %r1, %r28
	setx  0x01f2e1613bdd3926, %r1, %r29
	setx  0xcb2bd513c419048e, %r1, %r30
	setx  0xf7ff9c3da0a3d849, %r1, %r31
	setx  MAIN_BASE_DATA_VA, %r1, %r4
	setx  0x0000000000000e90, %r1, %r5
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
	setx  0x80, %r2, %r1
	wr  %r1, %r0, %asi
	ta T_CHANGE_HPRIV !To allow ASI writes to D-I caches
! Store8_ext_asi
	.word 0xc2304001  ! 11: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2284001  ! 11: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2306001  ! 11: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2284001  ! 11: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2284001  ! 11: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2306001  ! 11: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2704001  ! 11: STX_R	stx	%r1, [%r1 + %r1]
	.word 0x2ac80001  ! 11: BRNZ	brnz,a,pt	%0,<label_0x80001>
	.word 0xd8f20981  ! 11: STXA_R	stxa	%r12, [%r8 + %r1] 0x4c
! Store9_int_asi
	.word 0xc2304001  ! 21: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 21: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2284001  ! 21: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2306001  ! 21: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2306001  ! 21: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2304001  ! 21: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 21: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 21: STW_R	stw	%r1, [%r1 + %r1]
	.word 0x36800001  ! 21: BGE	bge,a	<label_0x1>
	.word 0xd8f1cce1  ! 21: STXA_R	stxa	%r12, [%r7 + %r1] 0x67
! Store8_atm
	.word 0xc2304001  ! 30: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2284001  ! 30: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2306001  ! 30: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2704001  ! 30: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 30: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 30: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2284001  ! 30: STB_R	stb	%r1, [%r1 + %r1]
	.word 0x2cc80001  ! 30: BRGZ	brgz,a,pt	%0,<label_0x80001>
	.word 0xc2e84021  ! 30: LDSTUBA_R	ldstuba	%r1, [%r1 + %r1] 0x01
! Store8_ext_asi
	.word 0xc2304001  ! 39: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 39: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2304001  ! 39: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2206001  ! 39: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0xc2306001  ! 39: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2204001  ! 39: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 39: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0x2cc80001  ! 39: BRGZ	brgz,a,pt	%0,<label_0x80001>
	.word 0xd6f04962  ! 39: STXA_R	stxa	%r11, [%r1 + %r2] 0x4b
! Store8_ext_asi
	.word 0xc2304001  ! 48: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2306001  ! 48: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2304001  ! 48: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 48: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2286001  ! 48: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2704001  ! 48: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2206001  ! 48: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0x36800001  ! 48: BGE	bge,a	<label_0x1>
	.word 0xd6f20ce8  ! 48: STXA_R	stxa	%r11, [%r8 + %r8] 0x67
! Store8_ext_asi
	.word 0xc2304001  ! 57: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2284001  ! 57: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2306001  ! 57: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2286001  ! 57: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2304001  ! 57: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2304001  ! 57: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 57: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0x38800001  ! 57: BGU	bgu,a	<label_0x1>
	.word 0xd6f20ce0  ! 57: STXA_R	stxa	%r11, [%r8 + %r0] 0x67
! Store9_fp_st
	.word 0xc2304001  ! 67: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 67: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2706001  ! 67: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2284001  ! 67: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2206001  ! 67: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0xc2284001  ! 67: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2286001  ! 67: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2206001  ! 67: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0x22c80001  ! 67: BRZ	brz,a,pt	%0,<label_0x80001>
	.word 0xc3386001  ! 67: STDF_I	std	%f1, [0x0001, %r1]
! Store8_fp_st
	.word 0xc2304001  ! 76: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2306001  ! 76: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2304001  ! 76: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 76: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2284001  ! 76: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 76: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 76: STW_R	stw	%r1, [%r1 + %r1]
	.word 0x2a800001  ! 76: BCS	bcs,a	<label_0x1>
	.word 0xc3204001  ! 76: STF_R	st	%f1, [%r1, %r1]
! Store8_ext_asi
	.word 0xc2304001  ! 85: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2304001  ! 85: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2286001  ! 85: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2306001  ! 85: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2206001  ! 85: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0xc2286001  ! 85: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2284001  ! 85: STB_R	stb	%r1, [%r1 + %r1]
	.word 0x3a800001  ! 85: BCC	bcc,a	<label_0x1>
	.word 0xc2f04021  ! 85: STXA_R	stxa	%r1, [%r1 + %r1] 0x01
! Store8_fp_st
	.word 0xc2304001  ! 94: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2306001  ! 94: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2704001  ! 94: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2306001  ! 94: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2284001  ! 94: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2304001  ! 94: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2284001  ! 94: STB_R	stb	%r1, [%r1 + %r1]
	.word 0x38800001  ! 94: BGU	bgu,a	<label_0x1>
	.word 0xc3384001  ! 94: STDF_R	std	%f1, [%r1, %r1]
! Store9_int_asi
	.word 0xc2304001  ! 104: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2286001  ! 104: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2304001  ! 104: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2306001  ! 104: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2204001  ! 104: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 104: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2304001  ! 104: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 104: STW_R	stw	%r1, [%r1 + %r1]
	.word 0x3a800001  ! 104: BCC	bcc,a	<label_0x1>
	.word 0xd6f0cce1  ! 104: STXA_R	stxa	%r11, [%r3 + %r1] 0x67
! Store9_fp_st
	.word 0xc2304001  ! 114: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2206001  ! 114: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0xc2704001  ! 114: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2304001  ! 114: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2206001  ! 114: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0xc2304001  ! 114: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 114: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2306001  ! 114: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0x3a800001  ! 114: BCC	bcc,a	<label_0x1>
	.word 0xc3204001  ! 114: STF_R	st	%f1, [%r1, %r1]
! Store8
	.word 0xc2304001  ! 123: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2704001  ! 123: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2304001  ! 123: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2286001  ! 123: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2706001  ! 123: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2704001  ! 123: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2286001  ! 123: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0x22800001  ! 123: BE	be,a	<label_0x1>
	.word 0xc2306001  ! 123: STH_I	sth	%r1, [%r1 + 0x0001]
! Store9_ext_asi
	.word 0xc2304001  ! 133: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2286001  ! 133: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2704001  ! 133: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2206001  ! 133: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0xc2704001  ! 133: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2206001  ! 133: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0xc2206001  ! 133: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0x3a800001  ! 133: BCC	bcc,a	<label_0x1>
	.word 0xc2a06001  ! 133: STWA_I	stwa	%r1, [%r1 + 0x0001] %asi
! Store9_atm
	.word 0xc2304001  ! 143: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 143: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2306001  ! 143: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2306001  ! 143: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2206001  ! 143: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0xc2306001  ! 143: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2204001  ! 143: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2286001  ! 143: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0x2e800001  ! 143: BVS	bvs,a	<label_0x1>
	.word 0xc2e86001  ! 143: LDSTUBA_I	ldstuba	%r1, [%r1 + 0x0001] %asi
! Store9_fp_st
	.word 0xc2304001  ! 153: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 153: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 153: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2704001  ! 153: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2306001  ! 153: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2206001  ! 153: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0xc2284001  ! 153: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2306001  ! 153: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0x32800001  ! 153: BNE	bne,a	<label_0x1>
	.word 0xc3386001  ! 153: STDF_I	std	%f1, [0x0001, %r1]
! Store8_ext_asi
	.word 0xc2304001  ! 162: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2306001  ! 162: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2206001  ! 162: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0xc2286001  ! 162: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2284001  ! 162: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2284001  ! 162: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2286001  ! 162: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0x3e800001  ! 162: BVC	bvc,a	<label_0x1>
	.word 0xc2a86001  ! 162: STBA_I	stba	%r1, [%r1 + 0x0001] %asi
! Store8_atm
	.word 0xc2304001  ! 171: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2304001  ! 171: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2284001  ! 171: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 171: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2206001  ! 171: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0xc2286001  ! 171: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2304001  ! 171: STH_R	sth	%r1, [%r1 + %r1]
	.word 0x2ec80001  ! 171: BRGEZ	brgez,a,pt	%0,<label_0x80001>
	.word 0xc2786001  ! 171: SWAP_I	swap	%r1, [%r1 + 0x0001]
! Store9
	.word 0xc2304001  ! 181: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2304001  ! 181: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2304001  ! 181: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2286001  ! 181: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2304001  ! 181: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2206001  ! 181: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0xc2304001  ! 181: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2284001  ! 181: STB_R	stb	%r1, [%r1 + %r1]
	.word 0x3a800001  ! 181: BCC	bcc,a	<label_0x1>
	.word 0xc2204001  ! 181: STW_R	stw	%r1, [%r1 + %r1]
! Store9_fp_st
	.word 0xc2304001  ! 191: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2206001  ! 191: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0xc2206001  ! 191: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0xc2704001  ! 191: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2306001  ! 191: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2704001  ! 191: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 191: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2704001  ! 191: STX_R	stx	%r1, [%r1 + %r1]
	.word 0x26800001  ! 191: BL	bl,a	<label_0x1>
	.word 0xc3206001  ! 191: STF_I	st	%f1, [0x0001, %r1]
! Store8
	.word 0xc2304001  ! 200: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2704001  ! 200: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2704001  ! 200: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 200: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2286001  ! 200: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2284001  ! 200: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 200: STW_R	stw	%r1, [%r1 + %r1]
	.word 0x2ec80001  ! 200: BRGEZ	brgez,a,pt	%0,<label_0x80001>
	.word 0xc2306001  ! 200: STH_I	sth	%r1, [%r1 + 0x0001]
! Store8
	.word 0xc2304001  ! 209: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2286001  ! 209: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2206001  ! 209: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0xc2286001  ! 209: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2304001  ! 209: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 209: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2304001  ! 209: STH_R	sth	%r1, [%r1 + %r1]
	.word 0x40000001  ! 209: CALL	call	disp30_1
	.word 0xc2706001  ! 209: STX_I	stx	%r1, [%r1 + 0x0001]
! Store8_ext_asi
	.word 0xc2304001  ! 218: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 218: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2286001  ! 218: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2304001  ! 218: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 218: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 218: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2306001  ! 218: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0x2ec80001  ! 218: BRGEZ	brgez,a,pt	%0,<label_0x80001>
	.word 0xd6f24ce9  ! 218: STXA_R	stxa	%r11, [%r9 + %r9] 0x67
! Store8
	.word 0xc2304001  ! 227: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2306001  ! 227: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2306001  ! 227: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2204001  ! 227: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2306001  ! 227: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2706001  ! 227: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2306001  ! 227: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0x2cc80001  ! 227: BRGZ	brgz,a,pt	%0,<label_0x80001>
	.word 0xc2706001  ! 227: STX_I	stx	%r1, [%r1 + 0x0001]
! Store9_fp_st
	.word 0xc2304001  ! 237: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2306001  ! 237: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2304001  ! 237: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2286001  ! 237: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2306001  ! 237: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2204001  ! 237: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2306001  ! 237: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2706001  ! 237: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0x2ec80001  ! 237: BRGEZ	brgez,a,pt	%0,<label_0x80001>
	.word 0xc3386001  ! 237: STDF_I	std	%f1, [0x0001, %r1]
! Store8_ext_asi
	.word 0xc2304001  ! 246: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2206001  ! 246: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0xc2306001  ! 246: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2206001  ! 246: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0xc2204001  ! 246: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2304001  ! 246: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2206001  ! 246: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0x22c80001  ! 246: BRZ	brz,a,pt	%0,<label_0x80001>
	.word 0xd6f20ce3  ! 246: STXA_R	stxa	%r11, [%r8 + %r3] 0x67
! Store9_atm
	.word 0xc2304001  ! 256: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2206001  ! 256: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0xc2704001  ! 256: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2704001  ! 256: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2206001  ! 256: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0xc2306001  ! 256: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2206001  ! 256: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0xc2304001  ! 256: STH_R	sth	%r1, [%r1 + %r1]
	.word 0x32800001  ! 256: BNE	bne,a	<label_0x1>
	.word 0xc3e04021  ! 256: CASA_I	casa	[%r1] 0x 1, %r1, %r1
! Store9_fp_st
	.word 0xc2304001  ! 266: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2306001  ! 266: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2206001  ! 266: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0xc2284001  ! 266: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2704001  ! 266: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2284001  ! 266: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2286001  ! 266: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2284001  ! 266: STB_R	stb	%r1, [%r1 + %r1]
	.word 0x34800001  ! 266: BG	bg,a	<label_0x1>
	.word 0xc3384001  ! 266: STDF_R	std	%f1, [%r1, %r1]
! Store9
	.word 0xc2304001  ! 276: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2704001  ! 276: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2304001  ! 276: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 276: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2204001  ! 276: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2284001  ! 276: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2306001  ! 276: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2306001  ! 276: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0x2ec80001  ! 276: BRGEZ	brgez,a,pt	%0,<label_0x80001>
	.word 0xc2704001  ! 276: STX_R	stx	%r1, [%r1 + %r1]
! Store8_atm
	.word 0xc2304001  ! 285: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2284001  ! 285: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2304001  ! 285: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2286001  ! 285: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2306001  ! 285: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2704001  ! 285: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2704001  ! 285: STX_R	stx	%r1, [%r1 + %r1]
	.word 0x2e800001  ! 285: BVS	bvs,a	<label_0x1>
	.word 0xc2e86001  ! 285: LDSTUBA_I	ldstuba	%r1, [%r1 + 0x0001] %asi
! Store8_atm
	.word 0xc2304001  ! 294: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2704001  ! 294: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2286001  ! 294: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2204001  ! 294: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2704001  ! 294: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2286001  ! 294: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2704001  ! 294: STX_R	stx	%r1, [%r1 + %r1]
	.word 0x2e800001  ! 294: BVS	bvs,a	<label_0x1>
	.word 0xc3f06001  ! 294: CASXA_R	casxa	[%r1]%asi, %r1, %r1
! Store8_ext_asi
	.word 0xc2304001  ! 303: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2284001  ! 303: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2284001  ! 303: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2286001  ! 303: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2204001  ! 303: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2206001  ! 303: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0xc2706001  ! 303: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0x28800001  ! 303: BLEU	bleu,a	<label_0x1>
	.word 0xc2a04021  ! 303: STWA_R	stwa	%r1, [%r1 + %r1] 0x01
! Store8_ext_asi
	.word 0xc2304001  ! 312: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2704001  ! 312: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2704001  ! 312: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2286001  ! 312: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2704001  ! 312: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2306001  ! 312: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2284001  ! 312: STB_R	stb	%r1, [%r1 + %r1]
	.word 0x24c80001  ! 312: BRLEZ	brlez,a,pt	%0,<label_0x80001>
	.word 0xc2f04021  ! 312: STXA_R	stxa	%r1, [%r1 + %r1] 0x01
! Store8_ext_asi
	.word 0xc2304001  ! 321: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2284001  ! 321: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 321: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2704001  ! 321: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2304001  ! 321: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2304001  ! 321: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2284001  ! 321: STB_R	stb	%r1, [%r1 + %r1]
	.word 0x2cc80001  ! 321: BRGZ	brgz,a,pt	%0,<label_0x80001>
	.word 0xc2a04021  ! 321: STWA_R	stwa	%r1, [%r1 + %r1] 0x01
! Store9_fp_st
	.word 0xc2304001  ! 331: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2304001  ! 331: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2304001  ! 331: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2286001  ! 331: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2704001  ! 331: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 331: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 331: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2286001  ! 331: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0x28800001  ! 331: BLEU	bleu,a	<label_0x1>
	.word 0xc3386001  ! 331: STDF_I	std	%f1, [0x0001, %r1]
! Store8_fp_st
	.word 0xc2304001  ! 340: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2284001  ! 340: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 340: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2204001  ! 340: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 340: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 340: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2304001  ! 340: STH_R	sth	%r1, [%r1 + %r1]
	.word 0x2e800001  ! 340: BVS	bvs,a	<label_0x1>
	.word 0xc3204001  ! 340: STF_R	st	%f1, [%r1, %r1]
! Store9
	.word 0xc2304001  ! 350: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2286001  ! 350: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2304001  ! 350: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 350: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 350: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 350: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2286001  ! 350: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2706001  ! 350: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0x26c80001  ! 350: BRLZ	brlz,a,pt	%0,<label_0x80001>
	.word 0xc2204001  ! 350: STW_R	stw	%r1, [%r1 + %r1]
! Store9_atm
	.word 0xc2304001  ! 360: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 360: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2304001  ! 360: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2306001  ! 360: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2304001  ! 360: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 360: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2286001  ! 360: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2304001  ! 360: STH_R	sth	%r1, [%r1 + %r1]
	.word 0x3a800001  ! 360: BCC	bcc,a	<label_0x1>
	.word 0xc3e04021  ! 360: CASA_I	casa	[%r1] 0x 1, %r1, %r1
! Store8_fp_st
	.word 0xc2304001  ! 369: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 369: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2206001  ! 369: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0xc2286001  ! 369: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2206001  ! 369: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0xc2304001  ! 369: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2704001  ! 369: STX_R	stx	%r1, [%r1 + %r1]
	.word 0x2ac80001  ! 369: BRNZ	brnz,a,pt	%0,<label_0x80001>
	.word 0xc3204001  ! 369: STF_R	st	%f1, [%r1, %r1]
! Store9_ext_asi
	.word 0xc2304001  ! 379: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2284001  ! 379: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2206001  ! 379: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0xc2706001  ! 379: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2204001  ! 379: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2284001  ! 379: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2306001  ! 379: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0x30800001  ! 379: BA	ba,a	<label_0x1>
	.word 0xc2b84021  ! 379: STDA_R	stda	%r1, [%r1 + %r1] 0x01
! Store9_atm
	.word 0xc2304001  ! 389: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2306001  ! 389: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2704001  ! 389: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 389: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2204001  ! 389: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2304001  ! 389: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2304001  ! 389: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2286001  ! 389: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0x34800001  ! 389: BG	bg,a	<label_0x1>
	.word 0xc3f06001  ! 389: CASXA_R	casxa	[%r1]%asi, %r1, %r1
! Store8
	.word 0xc2304001  ! 398: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2286001  ! 398: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2306001  ! 398: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2706001  ! 398: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2704001  ! 398: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2704001  ! 398: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2304001  ! 398: STH_R	sth	%r1, [%r1 + %r1]
	.word 0x2cc80001  ! 398: BRGZ	brgz,a,pt	%0,<label_0x80001>
	.word 0xc2206001  ! 398: STW_I	stw	%r1, [%r1 + 0x0001]
! Store8_ext_asi
	.word 0xc2304001  ! 407: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2304001  ! 407: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2284001  ! 407: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 407: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2704001  ! 407: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 407: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 407: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0x2e800001  ! 407: BVS	bvs,a	<label_0x1>
	.word 0xd6f20ce2  ! 407: STXA_R	stxa	%r11, [%r8 + %r2] 0x67
! Store9_int_asi
	.word 0xc2304001  ! 417: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2304001  ! 417: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2284001  ! 417: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 417: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 417: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 417: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2284001  ! 417: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2704001  ! 417: STX_R	stx	%r1, [%r1 + %r1]
	.word 0x24c80001  ! 417: BRLEZ	brlez,a,pt	%0,<label_0x80001>
	.word 0xd8f08ce3  ! 417: STXA_R	stxa	%r12, [%r2 + %r3] 0x67
! Store9
	.word 0xc2304001  ! 427: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 427: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2286001  ! 427: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2286001  ! 427: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2204001  ! 427: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 427: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2704001  ! 427: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 427: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0x3a800001  ! 427: BCC	bcc,a	<label_0x1>
	.word 0xc2204001  ! 427: STW_R	stw	%r1, [%r1 + %r1]
! Store9_ext_asi
	.word 0xc2304001  ! 437: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 437: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2204001  ! 437: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2306001  ! 437: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2204001  ! 437: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2286001  ! 437: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2704001  ! 437: STX_R	stx	%r1, [%r1 + %r1]
	.word 0x20800001  ! 437: BN	bn,a	<label_0x1>
	.word 0xc2a84021  ! 437: STBA_R	stba	%r1, [%r1 + %r1] 0x01
! Store9_ext_asi
	.word 0xc2304001  ! 447: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 447: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2706001  ! 447: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2306001  ! 447: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2704001  ! 447: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2206001  ! 447: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0xc2286001  ! 447: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0x22800001  ! 447: BE	be,a	<label_0x1>
	.word 0xc2b06001  ! 447: STHA_I	stha	%r1, [%r1 + 0x0001] %asi
! Store9_ext_asi
	.word 0xc2304001  ! 457: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2284001  ! 457: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2284001  ! 457: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2284001  ! 457: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 457: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2704001  ! 457: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 457: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0x2a800001  ! 457: BCS	bcs,a	<label_0x1>
	.word 0xc2b84021  ! 457: STDA_R	stda	%r1, [%r1 + %r1] 0x01
! Store8_ext_asi
	.word 0xc2304001  ! 466: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2306001  ! 466: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2306001  ! 466: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2306001  ! 466: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2706001  ! 466: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2704001  ! 466: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2286001  ! 466: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0x24c80001  ! 466: BRLEZ	brlez,a,pt	%0,<label_0x80001>
	.word 0xd6f0c982  ! 466: STXA_R	stxa	%r11, [%r3 + %r2] 0x4c
! Store8_fp_st
	.word 0xc2304001  ! 475: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2284001  ! 475: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2304001  ! 475: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 475: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2304001  ! 475: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2206001  ! 475: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0xc2306001  ! 475: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0x2ac80001  ! 475: BRNZ	brnz,a,pt	%0,<label_0x80001>
	.word 0xc3384001  ! 475: STDF_R	std	%f1, [%r1, %r1]
! Store9_int_asi
	.word 0xc2304001  ! 485: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 485: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2304001  ! 485: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2304001  ! 485: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 485: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2304001  ! 485: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 485: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2206001  ! 485: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0x24800001  ! 485: BLE	ble,a	<label_0x1>
	.word 0xd6f0c982  ! 485: STXA_R	stxa	%r11, [%r3 + %r2] 0x4c
! Store9_fp_st
	.word 0xc2304001  ! 495: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2306001  ! 495: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2204001  ! 495: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2304001  ! 495: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 495: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 495: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2706001  ! 495: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2204001  ! 495: STW_R	stw	%r1, [%r1 + %r1]
	.word 0x24c80001  ! 495: BRLEZ	brlez,a,pt	%0,<label_0x80001>
	.word 0xc3204001  ! 495: STF_R	st	%f1, [%r1, %r1]
	nop
	nop
        ta      T_GOOD_TRAP


th_main_3:
	setx  0xf89cbb2d009b8630, %r1, %r1
	setx  0x4e78be9f0643b118, %r1, %r2
	setx  0x96a5fb540e80f4d8, %r1, %r3
	setx  0x183808650252dd40, %r1, %r6
	setx  0x2bad01420bdaa3b0, %r1, %r7
	setx  0xf03e3c41090d8428, %r1, %r8
	setx  0xfc355ef20435eaa8, %r1, %r9
	setx  0x20f04a30f3c8862b, %r1, %r11
	setx  0xccfd3c3088e8c680, %r1, %r12
	setx  0xe243e1bbbbe0f985, %r1, %r13
	setx  0xc402f82e73e95ab0, %r1, %r14
	setx  0x2594502729cfaead, %r1, %r15
	setx  0x94259cdf752ac981, %r1, %r16
	setx  0x7003c075ecf462da, %r1, %r17
	setx  0x841b8449f8d5dbd0, %r1, %r18
	setx  0x60ecbaeada9484b9, %r1, %r19
	setx  0x1caea2b7f577bb89, %r1, %r20
	setx  0x387d85d2dd035414, %r1, %r21
	setx  0xe1d5160a7134dbb6, %r1, %r22
	setx  0xae92f83d9f74ac23, %r1, %r23
	setx  0x7ec1fe973ba1ca6e, %r1, %r24
	setx  0x16e25c3b73270661, %r1, %r25
	setx  0xc3191e6f3c09419f, %r1, %r26
	setx  0x5eaa3646b730ad66, %r1, %r27
	setx  0x71e040647a1f37e6, %r1, %r28
	setx  0x01f2e1613bdd3926, %r1, %r29
	setx  0xcb2bd513c419048e, %r1, %r30
	setx  0xf7ff9c3da0a3d849, %r1, %r31
	setx  MAIN_BASE_DATA_VA, %r1, %r4
	setx  0x0000000000000e90, %r1, %r5
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
	setx  0x80, %r2, %r1
	wr  %r1, %r0, %asi
	ta T_CHANGE_HPRIV !To allow ASI writes to D-I caches
! Store8_ext_asi
	.word 0xc2304001  ! 11: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2284001  ! 11: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2306001  ! 11: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2284001  ! 11: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2284001  ! 11: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2306001  ! 11: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2704001  ! 11: STX_R	stx	%r1, [%r1 + %r1]
	.word 0x2ac80001  ! 11: BRNZ	brnz,a,pt	%0,<label_0x80001>
	.word 0xd8f08960  ! 11: STXA_R	stxa	%r12, [%r2 + %r0] 0x4b
! Store9_int_asi
	.word 0xc2304001  ! 21: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 21: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2284001  ! 21: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2306001  ! 21: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2306001  ! 21: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2304001  ! 21: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 21: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 21: STW_R	stw	%r1, [%r1 + %r1]
	.word 0x36800001  ! 21: BGE	bge,a	<label_0x1>
	.word 0xd8f04ce8  ! 21: STXA_R	stxa	%r12, [%r1 + %r8] 0x67
! Store8_atm
	.word 0xc2304001  ! 30: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2284001  ! 30: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2306001  ! 30: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2704001  ! 30: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 30: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 30: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2284001  ! 30: STB_R	stb	%r1, [%r1 + %r1]
	.word 0x2cc80001  ! 30: BRGZ	brgz,a,pt	%0,<label_0x80001>
	.word 0xc2e84021  ! 30: LDSTUBA_R	ldstuba	%r1, [%r1 + %r1] 0x01
! Store8_ext_asi
	.word 0xc2304001  ! 39: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 39: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2304001  ! 39: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2206001  ! 39: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0xc2306001  ! 39: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2204001  ! 39: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 39: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0x2cc80001  ! 39: BRGZ	brgz,a,pt	%0,<label_0x80001>
	.word 0xd8f1cce2  ! 39: STXA_R	stxa	%r12, [%r7 + %r2] 0x67
! Store8_ext_asi
	.word 0xc2304001  ! 48: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2306001  ! 48: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2304001  ! 48: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 48: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2286001  ! 48: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2704001  ! 48: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2206001  ! 48: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0x36800001  ! 48: BGE	bge,a	<label_0x1>
	.word 0xd8f08ce3  ! 48: STXA_R	stxa	%r12, [%r2 + %r3] 0x67
! Store8_ext_asi
	.word 0xc2304001  ! 57: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2284001  ! 57: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2306001  ! 57: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2286001  ! 57: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2304001  ! 57: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2304001  ! 57: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 57: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0x38800001  ! 57: BGU	bgu,a	<label_0x1>
	.word 0xd6f0cce7  ! 57: STXA_R	stxa	%r11, [%r3 + %r7] 0x67
! Store9_fp_st
	.word 0xc2304001  ! 67: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 67: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2706001  ! 67: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2284001  ! 67: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2206001  ! 67: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0xc2284001  ! 67: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2286001  ! 67: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2206001  ! 67: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0x22c80001  ! 67: BRZ	brz,a,pt	%0,<label_0x80001>
	.word 0xc3386001  ! 67: STDF_I	std	%f1, [0x0001, %r1]
! Store8_fp_st
	.word 0xc2304001  ! 76: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2306001  ! 76: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2304001  ! 76: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 76: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2284001  ! 76: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 76: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 76: STW_R	stw	%r1, [%r1 + %r1]
	.word 0x2a800001  ! 76: BCS	bcs,a	<label_0x1>
	.word 0xc3204001  ! 76: STF_R	st	%f1, [%r1, %r1]
! Store8_ext_asi
	.word 0xc2304001  ! 85: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2304001  ! 85: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2286001  ! 85: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2306001  ! 85: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2206001  ! 85: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0xc2286001  ! 85: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2284001  ! 85: STB_R	stb	%r1, [%r1 + %r1]
	.word 0x3a800001  ! 85: BCC	bcc,a	<label_0x1>
	.word 0xc2f04021  ! 85: STXA_R	stxa	%r1, [%r1 + %r1] 0x01
! Store8_fp_st
	.word 0xc2304001  ! 94: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2306001  ! 94: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2704001  ! 94: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2306001  ! 94: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2284001  ! 94: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2304001  ! 94: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2284001  ! 94: STB_R	stb	%r1, [%r1 + %r1]
	.word 0x38800001  ! 94: BGU	bgu,a	<label_0x1>
	.word 0xc3384001  ! 94: STDF_R	std	%f1, [%r1, %r1]
! Store9_int_asi
	.word 0xc2304001  ! 104: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2286001  ! 104: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2304001  ! 104: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2306001  ! 104: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2204001  ! 104: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 104: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2304001  ! 104: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 104: STW_R	stw	%r1, [%r1 + %r1]
	.word 0x3a800001  ! 104: BCC	bcc,a	<label_0x1>
	.word 0xd6f00ce2  ! 104: STXA_R	stxa	%r11, [%r0 + %r2] 0x67
! Store9_fp_st
	.word 0xc2304001  ! 114: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2206001  ! 114: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0xc2704001  ! 114: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2304001  ! 114: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2206001  ! 114: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0xc2304001  ! 114: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 114: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2306001  ! 114: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0x3a800001  ! 114: BCC	bcc,a	<label_0x1>
	.word 0xc3204001  ! 114: STF_R	st	%f1, [%r1, %r1]
! Store8
	.word 0xc2304001  ! 123: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2704001  ! 123: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2304001  ! 123: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2286001  ! 123: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2706001  ! 123: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2704001  ! 123: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2286001  ! 123: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0x22800001  ! 123: BE	be,a	<label_0x1>
	.word 0xc2306001  ! 123: STH_I	sth	%r1, [%r1 + 0x0001]
! Store9_ext_asi
	.word 0xc2304001  ! 133: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2286001  ! 133: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2704001  ! 133: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2206001  ! 133: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0xc2704001  ! 133: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2206001  ! 133: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0xc2206001  ! 133: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0x3a800001  ! 133: BCC	bcc,a	<label_0x1>
	.word 0xc2a06001  ! 133: STWA_I	stwa	%r1, [%r1 + 0x0001] %asi
! Store9_atm
	.word 0xc2304001  ! 143: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 143: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2306001  ! 143: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2306001  ! 143: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2206001  ! 143: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0xc2306001  ! 143: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2204001  ! 143: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2286001  ! 143: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0x2e800001  ! 143: BVS	bvs,a	<label_0x1>
	.word 0xc2e86001  ! 143: LDSTUBA_I	ldstuba	%r1, [%r1 + 0x0001] %asi
! Store9_fp_st
	.word 0xc2304001  ! 153: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 153: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 153: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2704001  ! 153: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2306001  ! 153: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2206001  ! 153: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0xc2284001  ! 153: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2306001  ! 153: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0x32800001  ! 153: BNE	bne,a	<label_0x1>
	.word 0xc3386001  ! 153: STDF_I	std	%f1, [0x0001, %r1]
! Store8_ext_asi
	.word 0xc2304001  ! 162: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2306001  ! 162: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2206001  ! 162: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0xc2286001  ! 162: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2284001  ! 162: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2284001  ! 162: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2286001  ! 162: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0x3e800001  ! 162: BVC	bvc,a	<label_0x1>
	.word 0xc2a86001  ! 162: STBA_I	stba	%r1, [%r1 + 0x0001] %asi
! Store8_atm
	.word 0xc2304001  ! 171: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2304001  ! 171: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2284001  ! 171: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 171: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2206001  ! 171: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0xc2286001  ! 171: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2304001  ! 171: STH_R	sth	%r1, [%r1 + %r1]
	.word 0x2ec80001  ! 171: BRGEZ	brgez,a,pt	%0,<label_0x80001>
	.word 0xc2786001  ! 171: SWAP_I	swap	%r1, [%r1 + 0x0001]
! Store9
	.word 0xc2304001  ! 181: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2304001  ! 181: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2304001  ! 181: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2286001  ! 181: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2304001  ! 181: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2206001  ! 181: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0xc2304001  ! 181: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2284001  ! 181: STB_R	stb	%r1, [%r1 + %r1]
	.word 0x3a800001  ! 181: BCC	bcc,a	<label_0x1>
	.word 0xc2204001  ! 181: STW_R	stw	%r1, [%r1 + %r1]
! Store9_fp_st
	.word 0xc2304001  ! 191: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2206001  ! 191: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0xc2206001  ! 191: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0xc2704001  ! 191: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2306001  ! 191: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2704001  ! 191: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 191: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2704001  ! 191: STX_R	stx	%r1, [%r1 + %r1]
	.word 0x26800001  ! 191: BL	bl,a	<label_0x1>
	.word 0xc3206001  ! 191: STF_I	st	%f1, [0x0001, %r1]
! Store8
	.word 0xc2304001  ! 200: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2704001  ! 200: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2704001  ! 200: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 200: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2286001  ! 200: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2284001  ! 200: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 200: STW_R	stw	%r1, [%r1 + %r1]
	.word 0x2ec80001  ! 200: BRGEZ	brgez,a,pt	%0,<label_0x80001>
	.word 0xc2306001  ! 200: STH_I	sth	%r1, [%r1 + 0x0001]
! Store8
	.word 0xc2304001  ! 209: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2286001  ! 209: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2206001  ! 209: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0xc2286001  ! 209: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2304001  ! 209: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 209: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2304001  ! 209: STH_R	sth	%r1, [%r1 + %r1]
	.word 0x40000001  ! 209: CALL	call	disp30_1
	.word 0xc2706001  ! 209: STX_I	stx	%r1, [%r1 + 0x0001]
! Store8_ext_asi
	.word 0xc2304001  ! 218: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 218: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2286001  ! 218: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2304001  ! 218: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 218: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 218: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2306001  ! 218: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0x2ec80001  ! 218: BRGEZ	brgez,a,pt	%0,<label_0x80001>
	.word 0xd6f04ce1  ! 218: STXA_R	stxa	%r11, [%r1 + %r1] 0x67
! Store8
	.word 0xc2304001  ! 227: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2306001  ! 227: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2306001  ! 227: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2204001  ! 227: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2306001  ! 227: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2706001  ! 227: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2306001  ! 227: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0x2cc80001  ! 227: BRGZ	brgz,a,pt	%0,<label_0x80001>
	.word 0xc2706001  ! 227: STX_I	stx	%r1, [%r1 + 0x0001]
! Store9_fp_st
	.word 0xc2304001  ! 237: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2306001  ! 237: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2304001  ! 237: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2286001  ! 237: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2306001  ! 237: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2204001  ! 237: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2306001  ! 237: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2706001  ! 237: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0x2ec80001  ! 237: BRGEZ	brgez,a,pt	%0,<label_0x80001>
	.word 0xc3386001  ! 237: STDF_I	std	%f1, [0x0001, %r1]
! Store8_ext_asi
	.word 0xc2304001  ! 246: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2206001  ! 246: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0xc2306001  ! 246: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2206001  ! 246: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0xc2204001  ! 246: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2304001  ! 246: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2206001  ! 246: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0x22c80001  ! 246: BRZ	brz,a,pt	%0,<label_0x80001>
	.word 0xd8f24968  ! 246: STXA_R	stxa	%r12, [%r9 + %r8] 0x4b
! Store9_atm
	.word 0xc2304001  ! 256: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2206001  ! 256: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0xc2704001  ! 256: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2704001  ! 256: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2206001  ! 256: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0xc2306001  ! 256: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2206001  ! 256: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0xc2304001  ! 256: STH_R	sth	%r1, [%r1 + %r1]
	.word 0x32800001  ! 256: BNE	bne,a	<label_0x1>
	.word 0xc3e04021  ! 256: CASA_I	casa	[%r1] 0x 1, %r1, %r1
! Store9_fp_st
	.word 0xc2304001  ! 266: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2306001  ! 266: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2206001  ! 266: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0xc2284001  ! 266: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2704001  ! 266: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2284001  ! 266: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2286001  ! 266: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2284001  ! 266: STB_R	stb	%r1, [%r1 + %r1]
	.word 0x34800001  ! 266: BG	bg,a	<label_0x1>
	.word 0xc3384001  ! 266: STDF_R	std	%f1, [%r1, %r1]
! Store9
	.word 0xc2304001  ! 276: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2704001  ! 276: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2304001  ! 276: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 276: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2204001  ! 276: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2284001  ! 276: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2306001  ! 276: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2306001  ! 276: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0x2ec80001  ! 276: BRGEZ	brgez,a,pt	%0,<label_0x80001>
	.word 0xc2704001  ! 276: STX_R	stx	%r1, [%r1 + %r1]
! Store8_atm
	.word 0xc2304001  ! 285: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2284001  ! 285: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2304001  ! 285: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2286001  ! 285: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2306001  ! 285: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2704001  ! 285: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2704001  ! 285: STX_R	stx	%r1, [%r1 + %r1]
	.word 0x2e800001  ! 285: BVS	bvs,a	<label_0x1>
	.word 0xc2e86001  ! 285: LDSTUBA_I	ldstuba	%r1, [%r1 + 0x0001] %asi
! Store8_atm
	.word 0xc2304001  ! 294: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2704001  ! 294: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2286001  ! 294: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2204001  ! 294: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2704001  ! 294: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2286001  ! 294: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2704001  ! 294: STX_R	stx	%r1, [%r1 + %r1]
	.word 0x2e800001  ! 294: BVS	bvs,a	<label_0x1>
	.word 0xc3f06001  ! 294: CASXA_R	casxa	[%r1]%asi, %r1, %r1
! Store8_ext_asi
	.word 0xc2304001  ! 303: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2284001  ! 303: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2284001  ! 303: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2286001  ! 303: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2204001  ! 303: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2206001  ! 303: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0xc2706001  ! 303: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0x28800001  ! 303: BLEU	bleu,a	<label_0x1>
	.word 0xc2a04021  ! 303: STWA_R	stwa	%r1, [%r1 + %r1] 0x01
! Store8_ext_asi
	.word 0xc2304001  ! 312: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2704001  ! 312: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2704001  ! 312: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2286001  ! 312: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2704001  ! 312: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2306001  ! 312: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2284001  ! 312: STB_R	stb	%r1, [%r1 + %r1]
	.word 0x24c80001  ! 312: BRLEZ	brlez,a,pt	%0,<label_0x80001>
	.word 0xc2f04021  ! 312: STXA_R	stxa	%r1, [%r1 + %r1] 0x01
! Store8_ext_asi
	.word 0xc2304001  ! 321: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2284001  ! 321: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 321: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2704001  ! 321: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2304001  ! 321: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2304001  ! 321: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2284001  ! 321: STB_R	stb	%r1, [%r1 + %r1]
	.word 0x2cc80001  ! 321: BRGZ	brgz,a,pt	%0,<label_0x80001>
	.word 0xc2a04021  ! 321: STWA_R	stwa	%r1, [%r1 + %r1] 0x01
! Store9_fp_st
	.word 0xc2304001  ! 331: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2304001  ! 331: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2304001  ! 331: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2286001  ! 331: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2704001  ! 331: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 331: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 331: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2286001  ! 331: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0x28800001  ! 331: BLEU	bleu,a	<label_0x1>
	.word 0xc3386001  ! 331: STDF_I	std	%f1, [0x0001, %r1]
! Store8_fp_st
	.word 0xc2304001  ! 340: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2284001  ! 340: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 340: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2204001  ! 340: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 340: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 340: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2304001  ! 340: STH_R	sth	%r1, [%r1 + %r1]
	.word 0x2e800001  ! 340: BVS	bvs,a	<label_0x1>
	.word 0xc3204001  ! 340: STF_R	st	%f1, [%r1, %r1]
! Store9
	.word 0xc2304001  ! 350: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2286001  ! 350: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2304001  ! 350: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 350: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 350: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 350: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2286001  ! 350: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2706001  ! 350: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0x26c80001  ! 350: BRLZ	brlz,a,pt	%0,<label_0x80001>
	.word 0xc2204001  ! 350: STW_R	stw	%r1, [%r1 + %r1]
! Store9_atm
	.word 0xc2304001  ! 360: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 360: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2304001  ! 360: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2306001  ! 360: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2304001  ! 360: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 360: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2286001  ! 360: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2304001  ! 360: STH_R	sth	%r1, [%r1 + %r1]
	.word 0x3a800001  ! 360: BCC	bcc,a	<label_0x1>
	.word 0xc3e04021  ! 360: CASA_I	casa	[%r1] 0x 1, %r1, %r1
! Store8_fp_st
	.word 0xc2304001  ! 369: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 369: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2206001  ! 369: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0xc2286001  ! 369: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2206001  ! 369: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0xc2304001  ! 369: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2704001  ! 369: STX_R	stx	%r1, [%r1 + %r1]
	.word 0x2ac80001  ! 369: BRNZ	brnz,a,pt	%0,<label_0x80001>
	.word 0xc3204001  ! 369: STF_R	st	%f1, [%r1, %r1]
! Store9_ext_asi
	.word 0xc2304001  ! 379: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2284001  ! 379: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2206001  ! 379: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0xc2706001  ! 379: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2204001  ! 379: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2284001  ! 379: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2306001  ! 379: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0x30800001  ! 379: BA	ba,a	<label_0x1>
	.word 0xc2b84021  ! 379: STDA_R	stda	%r1, [%r1 + %r1] 0x01
! Store9_atm
	.word 0xc2304001  ! 389: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2306001  ! 389: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2704001  ! 389: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 389: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2204001  ! 389: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2304001  ! 389: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2304001  ! 389: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2286001  ! 389: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0x34800001  ! 389: BG	bg,a	<label_0x1>
	.word 0xc3f06001  ! 389: CASXA_R	casxa	[%r1]%asi, %r1, %r1
! Store8
	.word 0xc2304001  ! 398: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2286001  ! 398: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2306001  ! 398: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2706001  ! 398: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2704001  ! 398: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2704001  ! 398: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2304001  ! 398: STH_R	sth	%r1, [%r1 + %r1]
	.word 0x2cc80001  ! 398: BRGZ	brgz,a,pt	%0,<label_0x80001>
	.word 0xc2206001  ! 398: STW_I	stw	%r1, [%r1 + 0x0001]
! Store8_ext_asi
	.word 0xc2304001  ! 407: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2304001  ! 407: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2284001  ! 407: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 407: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2704001  ! 407: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 407: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 407: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0x2e800001  ! 407: BVS	bvs,a	<label_0x1>
	.word 0xd6f08982  ! 407: STXA_R	stxa	%r11, [%r2 + %r2] 0x4c
! Store9_int_asi
	.word 0xc2304001  ! 417: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2304001  ! 417: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2284001  ! 417: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 417: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 417: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 417: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2284001  ! 417: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2704001  ! 417: STX_R	stx	%r1, [%r1 + %r1]
	.word 0x24c80001  ! 417: BRLEZ	brlez,a,pt	%0,<label_0x80001>
	.word 0xd8f00ce1  ! 417: STXA_R	stxa	%r12, [%r0 + %r1] 0x67
! Store9
	.word 0xc2304001  ! 427: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 427: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2286001  ! 427: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2286001  ! 427: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2204001  ! 427: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 427: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2704001  ! 427: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 427: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0x3a800001  ! 427: BCC	bcc,a	<label_0x1>
	.word 0xc2204001  ! 427: STW_R	stw	%r1, [%r1 + %r1]
! Store9_ext_asi
	.word 0xc2304001  ! 437: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 437: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2204001  ! 437: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2306001  ! 437: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2204001  ! 437: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2286001  ! 437: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0xc2704001  ! 437: STX_R	stx	%r1, [%r1 + %r1]
	.word 0x20800001  ! 437: BN	bn,a	<label_0x1>
	.word 0xc2a84021  ! 437: STBA_R	stba	%r1, [%r1 + %r1] 0x01
! Store9_ext_asi
	.word 0xc2304001  ! 447: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 447: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2706001  ! 447: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2306001  ! 447: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2704001  ! 447: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2206001  ! 447: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0xc2286001  ! 447: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0x22800001  ! 447: BE	be,a	<label_0x1>
	.word 0xc2b06001  ! 447: STHA_I	stha	%r1, [%r1 + 0x0001] %asi
! Store9_ext_asi
	.word 0xc2304001  ! 457: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2284001  ! 457: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2284001  ! 457: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2284001  ! 457: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 457: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2704001  ! 457: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 457: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0x2a800001  ! 457: BCS	bcs,a	<label_0x1>
	.word 0xc2b84021  ! 457: STDA_R	stda	%r1, [%r1 + %r1] 0x01
! Store8_ext_asi
	.word 0xc2304001  ! 466: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2306001  ! 466: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2306001  ! 466: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2306001  ! 466: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2706001  ! 466: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2704001  ! 466: STX_R	stx	%r1, [%r1 + %r1]
	.word 0xc2286001  ! 466: STB_I	stb	%r1, [%r1 + 0x0001]
	.word 0x24c80001  ! 466: BRLEZ	brlez,a,pt	%0,<label_0x80001>
	.word 0xd6f1c963  ! 466: STXA_R	stxa	%r11, [%r7 + %r3] 0x4b
! Store8_fp_st
	.word 0xc2304001  ! 475: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2284001  ! 475: STB_R	stb	%r1, [%r1 + %r1]
	.word 0xc2304001  ! 475: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 475: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2304001  ! 475: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2206001  ! 475: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0xc2306001  ! 475: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0x2ac80001  ! 475: BRNZ	brnz,a,pt	%0,<label_0x80001>
	.word 0xc3384001  ! 475: STDF_R	std	%f1, [%r1, %r1]
! Store9_int_asi
	.word 0xc2304001  ! 485: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 485: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2304001  ! 485: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2304001  ! 485: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 485: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2304001  ! 485: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 485: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2206001  ! 485: STW_I	stw	%r1, [%r1 + 0x0001]
	.word 0x24800001  ! 485: BLE	ble,a	<label_0x1>
	.word 0xd8f18ce3  ! 485: STXA_R	stxa	%r12, [%r6 + %r3] 0x67
! Store9_fp_st
	.word 0xc2304001  ! 495: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2306001  ! 495: STH_I	sth	%r1, [%r1 + 0x0001]
	.word 0xc2204001  ! 495: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2304001  ! 495: STH_R	sth	%r1, [%r1 + %r1]
	.word 0xc2204001  ! 495: STW_R	stw	%r1, [%r1 + %r1]
	.word 0xc2706001  ! 495: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2706001  ! 495: STX_I	stx	%r1, [%r1 + 0x0001]
	.word 0xc2204001  ! 495: STW_R	stw	%r1, [%r1 + %r1]
	.word 0x24c80001  ! 495: BRLEZ	brlez,a,pt	%0,<label_0x80001>
	.word 0xc3204001  ! 495: STF_R	st	%f1, [%r1, %r1]
	nop
	nop
        ta      T_GOOD_TRAP

.data
	.word  0x4f49b76a,0x6e990fd0,0x120a5ec1,0x70beae4b
	.word  0x9c86d96e,0x0945b99a,0x03fe9faf,0x51c117df
	.word  0x3a8d6eb4,0xa014ab98,0xc6b17c31,0xe33f4870
	.word  0x9c21ec2b,0xccc76533,0xca2f241e,0xeef3897e
	.word  0xcd8af4d8,0xe27cc8cd,0x5272d239,0x4d6fd5a6
	.word  0x3b7ec290,0xe17eb8a0,0x12a80934,0x0ff6e51d
	.word  0x86bb1337,0x10b2e8d8,0x2b1b4223,0x83be732a
	.word  0x661bf73c,0xc27c35c3,0xc99c46f5,0xabbfa9ae
	.word  0x077bd5ab,0x88008eac,0x0bb95819,0xc21b635f
	.word  0x6ba0e015,0x572985b2,0x8fe8ec7e,0x4a24c589
	.word  0xbfdeb61c,0x554fc9e5,0x62499d3b,0xb49cc705
	.word  0xbef9586f,0x37e13b04,0x14ad873d,0x523c28d1
	.word  0x79034ee9,0x419d09af,0x68131e71,0xd31459a3
	.word  0x06ab6b2b,0xacb4ab88,0xab76cbde,0xafe71ca0
	.word  0x1af025ba,0x5dcf27f4,0xd55920c7,0xd8d872d5
	.word  0xeead83e2,0x6b82408d,0x9e1f7752,0xf6edf3b4
	.word  0x330f52ad,0x7a52dd0a,0x4a1ff8e7,0xe0d3773e
	.word  0xe4dd4dba,0xdbb949bd,0xe460e5e8,0x99608cd7
	.word  0x3eeb0d00,0x8f3dcc02,0x038043cc,0x77132b93
	.word  0xfeccbe1d,0x54f85e02,0x07e19e67,0x4d1c3fb6
	.word  0x265458f8,0xcc4c2382,0xde1776e8,0xca862e6b
	.word  0x5266d31c,0x6f351797,0x3b37f9a5,0x931545f3
	.word  0xaa8c4f47,0xe242cd94,0xd754f2d5,0x2c5f2048
	.word  0x53c0a83f,0x608ed457,0x49fe095b,0x0b23f663
	.word  0x17230b11,0x8561c24d,0xa7e4e461,0xe8419cda
	.word  0xc27a6da9,0x111a5feb,0xe6a91c5a,0xf853ffa2
	.word  0x36d68c11,0xcd90c27c,0xd47f7353,0x40ecb2b1
	.word  0xed1b8a65,0x9cbb0350,0x3c6cbaae,0x50473c1b
	.word  0xfef49a5f,0xe6ee0c77,0x310ec6cf,0x4f0d0d93
	.word  0x990e8989,0x23c76d4c,0x2ed7693c,0xbca1b24e
	.word  0x5898228d,0xc97cf949,0x49519440,0xf94a8778
	.word  0xe4cf3de7,0x44b137d5,0x912ee9bb,0x2c7918fb
	.word  0x2098aa7b,0x18858d41,0x4a0e1cc3,0x9c4b8db8
	.word  0x658d3e78,0x3a9209a7,0xd31947ac,0x75adefc5
	.word  0x0a219ab3,0x5992d548,0xefbb2829,0x8a449d9f
	.word  0x47ade72c,0xe666a565,0x2b6c8f5b,0xb7e5f1d5
	.word  0x38acdac4,0x7a491849,0x844f4fbf,0x85fbb445
	.word  0x6f79f139,0xe14029cd,0x3e25755d,0x6aef56f0
	.word  0xc3e13fc1,0x0855bef9,0x7d922a4b,0xe05d7c86
	.word  0x0081e1c7,0x4d85f562,0xd8067936,0xb8479ce1
	.word  0x6e8ecc11,0x09304618,0xb2f84b4b,0x92dec108
	.word  0xb8c6122d,0x79f3bd0b,0x46e303f8,0x8688bb9a
	.word  0xa34597d0,0x4bd2ed33,0xbc4367c6,0x3f7c7c38
	.word  0x7d13b0bd,0xb8bd5454,0x5a6c50d3,0x4b7a2fd3
	.word  0x92d1f31c,0x5e27382b,0x30b0406b,0x609bc35d
	.word  0xf3a04dc2,0x4e4eff91,0x51840bac,0x783e694c
	.word  0xf565283c,0x3dcaf0aa,0x01965bd5,0x203076ca
	.word  0xaa90b590,0x4c50dc8b,0x64baa5fd,0x5d00fd34
	.word  0xcaa73b5a,0x028c5411,0x172a712b,0xad861dd7
	.word  0x35870625,0x3e46ff78,0x343e9aa8,0x72804b68
	.word  0xa013800b,0xacfd6f15,0xfa71d727,0xfde2d6f2
	.word  0xe9364a4b,0x4a5542cf,0xbd30a76e,0xe8cbbb28
	.word  0xa4216c94,0x48b5ba02,0x11040751,0xc5316987
	.word  0x0d07bdac,0x34f19714,0x821a7285,0x5d8d0d47
	.word  0x041c83e0,0x7adb9db7,0x42510f2f,0x0a6e2491
	.word  0x3da3a32b,0x23c5bc4c,0xc3884e81,0xcfe9c8ba
	.word  0x95e05b55,0x36149457,0x2efb4e6e,0x78f635c8
	.word  0x1d11d204,0x899bee1e,0x27e2c5ee,0xf58698e5
	.word  0xba4b2a33,0x41894cea,0x8ef367fc,0x513e58e4
	.word  0x6cea1af7,0x5098e991,0x292c9c10,0x3430cc88
	.word  0x91992f2c,0xd84f2a21,0xd32eb8f6,0x77454d1a
	.word  0x6f9ecd08,0x4479bfbb,0xa1de637a,0x25172ded
	.word  0x650a51b4,0x2b75a1fc,0x4a80e2a5,0xc138f001
	.word  0x848075df,0xb63514d5,0x9e4be65e,0xf3fd6e54
	.word  0x74ea2f03,0x3197e1f4,0xa49a4eb7,0xe8ba10c0
	.word  0x7363eec2,0x37ebe6df,0xada5a3f5,0x8dc559e8
	.word  0xef1eb203,0x1415c763,0xb2eb064a,0xec654e43
	.word  0x09b43ec6,0x0098b4e5,0x226d450e,0x77ec766a
	.word  0x75544599,0x9d50f1e7,0xe8610ebe,0x0903c17b
	.word  0x3706079d,0x4981048b,0xa70f6618,0x1df7a74a
	.word  0xc3cec60d,0x527119e9,0xa7895d0f,0x9d4e250a
	.word  0xc7699ae8,0xeff14720,0x7c30a0c9,0x6ec1e830
	.word  0x0c0e112f,0x3d1edc8f,0x79cbf08a,0xb8228c0d
	.word  0xfd94562c,0x29a885cc,0x6ca624a4,0xb1aa16ab
	.word  0x92c0794a,0x6971469b,0x3b5508ef,0x16ad2b19
	.word  0x95edec9b,0x50c57cb0,0xd5ea4f57,0xaaea5387
	.word  0x0d51ae9d,0x5e5edd94,0x0409ffe6,0x455a12cf
	.word  0x836ee98c,0x222a3e2e,0x16b8b713,0x74db9841
	.word  0xf6a28693,0x3ef52eeb,0x96b73e1e,0xf38f9b3e
	.word  0x2e90cabc,0xc6ffbfe6,0x8bdc62ce,0x73a6630a
	.word  0x3763efd8,0xb948c12b,0xacf2574e,0xafcdfbba
	.word  0x0ec8ef77,0xea7c4144,0x60ed75e7,0xe69e082c
	.word  0x046c58b6,0x85c28d96,0x16fbff11,0x23088240
	.word  0xdf5ec275,0x6752a825,0x2a1c8526,0x7fae92ff
	.word  0x08a327a2,0xfae000eb,0x647ef014,0xd615dc64
	.word  0xac53f460,0x6790340b,0xab79960b,0x9535c7ae
	.word  0x760df028,0xee8ad6e9,0x290facb1,0x81ff5694
	.word  0xd4a6d6ce,0x0a5e292d,0x16aef87d,0xbc3b1a08
	.word  0x0053374a,0x9ee8bcf9,0x073bfd3d,0x9dc1e9af
	.word  0x122d491d,0xedbd8d4a,0x6bda7040,0xc54ccd4a
	.word  0xcdc89513,0x4d657cc3,0xb7859c2b,0xa733a4e2
	.word  0x6960a074,0x06bc9411,0x23df1f24,0xed0d4618
	.word  0xb3c190c3,0xb4040095,0x00970354,0x8f0548cd
	.word  0x02e1e8a2,0x6d61160e,0xedeb8030,0xdea2e1f3
	.word  0xce4a1212,0x23db3bbc,0x26a4e9a9,0x51349eb6
	.word  0x5e94771f,0x7aaabe8f,0x01f38f5e,0xa640e6b6
	.word  0x273b916b,0x67754627,0x92aa5c9b,0x97d801ff
	.word  0x082f5618,0xf8be73b3,0xeec64cac,0x5a8cfa9e
	.word  0x036d3801,0x6a0b0903,0x87d6c32c,0x0540bca1
	.word  0x7baa78fc,0x0f0b0980,0x360e1598,0x06119032
	.word  0x1c5559d5,0xba29f6de,0xf3c9fcf8,0xcfc207ed
	.word  0x7ea45775,0xd3ef8daa,0x5cbdaeaf,0xf4d2a3ab
	.word  0x43e7364e,0xa6ff7808,0x2234c0c3,0xbee085eb
	.word  0xdd9688cd,0xd357c22b,0xe6a3f658,0xa7fed680
	.word  0x71c9e303,0xd20b80b9,0xfbde65fb,0x41054b2f
	.word  0xb1c397b7,0x22e94ab3,0x0ab4cf44,0x87ea8dcb
	.word  0x8689155e,0x1163e1dc,0xe2f41ab8,0x8cf112a6
	.word  0x6a128401,0xab8e1fc8,0xee95bcb7,0x5b28b353
	.word  0x9dbd9840,0x3a0997af,0xad03019f,0x91d0f7e8
	.word  0xfbf9dacc,0x06f98dd0,0xd985384e,0x7842d9b5
	.word  0x23807c57,0x01c4d0ca,0x83d5b779,0xcf988d32
	.word  0xb6497a24,0x6adf42b5,0xae64b3b4,0xdf177f74
	.word  0x33a256b3,0xaac63d75,0x0e0dd830,0x0816b4c6
	.word  0x4d0e61d1,0x81f04f45,0x19052254,0x0d730bb5
	.word  0x6fbf7b2f,0x52c8be2a,0x36c41c00,0xd60afe0c
	.word  0x9e0d2150,0x07176fdc,0xdb187f3c,0x0ec57830
	.word  0xdab44e77,0x17458b6b,0xe19dabbb,0xfe22e046
	.word  0x0c038b62,0xc5341827,0x0e871df9,0x008898f8
	.word  0xac298710,0xa92f8515,0x6b33f1c4,0x9b15d74a
	.word  0xbe1e8bc5,0xe6715f74,0x12587ce4,0x89358bf5
	.word  0xb1d3a6cc,0x557054a8,0x017b4ad0,0x356ea525
	.word  0xb5391a93,0x10b0312d,0xcb2cf03c,0x19836f8b
	.word  0x20d28af6,0x337f5b30,0x8ffc1781,0xfdbeb93b
	.word  0xff91ff06,0xbafa8d7f,0xa177f128,0xea9780cb
	.word  0x8e7f852d,0x38dd776b,0x0a75146e,0x042832be
	.word  0xaccadd6c,0x18c4d05a,0x07b37a2d,0x63d2c5a9
	.word  0x344e3d01,0x7c4fd403,0xcfdd5cfe,0x4957cd9f
	.word  0x88eec190,0xc687ed54,0x08fed1d1,0xe4dbd500
	.word  0x554ececb,0xb1cd2ff8,0x0bf7fc31,0x47dfe59c
	.word  0xac3f99ee,0x52efa7df,0x26d723a3,0x1d054cf0
	.word  0x1a91b000,0xd96f68a7,0x3baf9054,0x00925d59
	.word  0xe2d93377,0x494bbb26,0xdc649d4d,0xb244c2fc
	.word  0x60246c63,0x76214c6d,0x4f497f78,0x9249e23f
	.word  0x9f843b54,0xd65a6222,0xc7b05fe5,0xcb9a8324
	.word  0x6efc9598,0x416cd368,0xf641a9cf,0xfe8d2b59
	.word  0xc43f8fec,0x082f81d6,0x3af7498e,0xac54f48f
	.word  0x8e4835f0,0xc91bfa90,0x7cac600e,0xbfd12262
	.word  0x4d1b3887,0x1b642179,0xcf4fc405,0xee37c574
	.word  0x59d20ff0,0x1eb2f7ae,0x130ac5ed,0xfd12d664
	.word  0xd90a65b6,0x1776fe27,0x2dcb34fa,0xcb9447d6
	.word  0xc6e5b307,0x7eb869a2,0xb93a9139,0x997e5e4f
	.word  0xf8184ed9,0xa41b35d4,0xa617f10e,0x872bf1e9
	.word  0xba0065ec,0xa31c511c,0x2d23408e,0xa43e6699
	.word  0x68faf08e,0x48dfcd52,0x8980e63a,0x81aed7dc
	.word  0xc97cd3c4,0x5d8058b2,0x225d81c0,0xf984a625
	.word  0x49cd5396,0xe3b0e67b,0xbed8ece4,0xe40db38e
	.word  0x99d69d59,0xc091f8c4,0x59684602,0xb6531c89
	.word  0x30c845d7,0x5bfd2096,0x3a05978e,0x2f0bd241
	.word  0x76b7d5b2,0x0f1e3adb,0xbb96d96b,0x9e47d652
	.word  0x65a2891e,0xaf95647b,0x547844b6,0xdf69dbaa
	.word  0xa551aa98,0xf5ae6ba8,0x0d866215,0xeb44d424
	.word  0xe590a795,0x58361a80,0x7a7b931c,0x3261a046
	.word  0xff1a7ef6,0xb56ee213,0x1a72223a,0x72d87f44
	.word  0x58d210ec,0x439c567c,0x59e4e9a3,0x5e69eab0
	.word  0xec81b0f9,0x5d253ffe,0xc3432852,0xb8294b15
	.word  0x3405331f,0x68ae890d,0x9ac5fb82,0x2746cf46
	.word  0x55548f5a,0xb8395668,0x4aaa0f24,0xf765604e
	.word  0x3a9493cc,0x26e002b9,0x35864eff,0xc72a7142
	.word  0x13e008e7,0xfcd25f3e,0x77224f4d,0x9010cabd
	.word  0xb390043e,0x1863492d,0x9a116d6d,0x63cb3d09
	.word  0xfdf86154,0x361b6e98,0xedcaa963,0xcf48abb7
	.word  0xf031cbdb,0x4830f3a6,0xfd1ad7a2,0x277f0b8c
	.word  0x216f5e31,0xb757b8a3,0x370cf5ba,0x79a6f9f8
	.word  0x2228534c,0x4a8726d5,0x33e1f1b7,0x75cd3f28
	.word  0xb3028279,0x7eab24b0,0x1ed1d4c1,0x7194a6ba
	.word  0xea4b3666,0xda4733fa,0x5d77b8d7,0x84a9f064
	.word  0x6b5bad20,0x634c184f,0x54e81bd5,0x078ec2a9
	.word  0x36ce55c0,0x43c4d90c,0xe5e9bb42,0x8f5f5629
	.word  0xabfa1a6b,0xb07d0eb7,0xe9388e0d,0xe2d7e4dc
	.word  0xaff154be,0x74646e1c,0xe8613972,0xc64cfede
	.word  0xc507d6e3,0x22325f57,0x52161f04,0x22cf21f3
	.word  0x9ef6df40,0x3a1ffa83,0xf6672779,0x22ee8fd5
	.word  0xe518a0f7,0x8e3f6a64,0x3e6ebaac,0xc161b37e
	.word  0x0cc8f2e6,0xbcef95c3,0x078c48b2,0x2cdc92e7
	.word  0x85d814cc,0x0a3f999b,0x3e05b7bc,0xfddf9156
	.word  0xa8c48061,0x5a75d706,0x6f19e2b6,0x62cdb57d
	.word  0x548eed3f,0x6aaecea6,0xfa6d8464,0x9b3881cd
	.word  0x682b5666,0x1e1fe723,0x6ab0a4cb,0x51bc6431
	.word  0x06a0661a,0xd8e5286d,0x78c85aa4,0x38f72392
	.word  0xb426531e,0x94a810f7,0x92251b3b,0x7e746b84
	.word  0xb5630076,0x6ee306a4,0x17c8910e,0x82b398c0
	.word  0xf1b70e2c,0x65db3c74,0x13760d0d,0x44faee5c
	.word  0x174a3f3f,0x76b7d0bf,0xbb84f888,0x4ea7d96e
	.word  0x8613a183,0x13dacb64,0xff3071e6,0xef0bbc2b
	.word  0xc9b02843,0x5bf4c944,0xb872589e,0xf8deacd6
	.word  0xef622b76,0x6d05e8cc,0xceb10d1c,0xe29c6de3
	.word  0x3bb45496,0xf5328de9,0xd0e69c48,0xe912137c
	.word  0xb06881c3,0xaab63a72,0x4caf8f28,0xc781ef24
	.word  0x5b154066,0x9c615ac5,0xb4eae6ac,0xc6b0a568
	.word  0x721e8e8d,0xc8d572e0,0xbcda7bc7,0xefa88e5b
	.word  0x60a37e83,0x79c60b2b,0x2edef633,0x4a58beb5
	.word  0x42818af1,0x005a8ef1,0x1f985af5,0xb9339027
	.word  0x4a72b278,0x931e50ab,0x6aaa9479,0x2996ff23
	.word  0xdf111b53,0xb0a45f56,0x41ae190f,0x9cc2804d
	.word  0x19f6b711,0x05850b1a,0x506a912d,0x867bcec5
	.word  0xce8af057,0x4a7b4a29,0xf272410c,0x4f3307b3
	.word  0x1b3e6222,0xd0323e4b,0xce739b3f,0xef6b63f4
	.word  0xa14f64c5,0xc87a0ad5,0x51be1ad7,0x7ed6b2a7
	.word  0xf43bbc10,0x7b130638,0x2cc36d67,0x2b7a33e7
	.word  0x79710e84,0xf26333c1,0x7de777ab,0x9a14162f
	.word  0x90e3eb1e,0x166093e9,0x53199b5a,0xb23bc5a4
	.word  0x0df6d6e1,0xd540782e,0x34e4dd24,0x6a85ae6e
	.word  0xd1393d8d,0x6c98551c,0x64b1e16d,0x551422f5
	.word  0xad3eb9d0,0xd14dfdfa,0x6b30b013,0xd4d604a0
	.word  0x25b12ef1,0x4a05f935,0x572eedef,0x22cc2180
	.word  0x97cbe4d8,0x353aa1d9,0xf6daf42f,0x5256b9c5
	.word  0x5b86355e,0x87f9d76d,0xeff52ac0,0xae25af55
	.word  0x33e1d70e,0x02fd77bb,0x59ead872,0xce4a5aad
	.word  0x765c4b06,0x14e96246,0x8b72cd7d,0x81a3f4da
	.word  0xe70f435b,0x46af31f0,0xef3f0e54,0x16302eaf
	.word  0x241b3856,0xb36a7dc0,0xdf2c3138,0x8c8c8bb3
	.word  0x30a680ce,0x960aa43e,0x96165a0f,0xba7744bf
	.word  0xe9d278ed,0xa234fd65,0xf0bcec2e,0x7e621d59
	.word  0x12aa3024,0x7ce983ac,0x2731e990,0xc9c0428a
	.word  0x2d25ca8b,0xfda4009b,0xabf6d4aa,0xcf9a0b37
	.word  0xfd635181,0x4b645939,0x631947ec,0x0b36be20
	.word  0x2edb4f86,0x9fa11121,0xa1b25fb7,0xc869934f
	.word  0x4ccdcf5c,0xb181d0bd,0xdcb93818,0x190560d7
	.word  0xb18670df,0xaedbc93a,0xfebb336d,0x35a48e56
	.word  0x77b371c5,0x41b0dd10,0x836de9cf,0xf6bd6219
	.word  0xa8ec75e7,0xe2519b3b,0x101cd082,0xa7d64b90
	.word  0x9a1dee0c,0x59648e99,0x3e4b0920,0x7bf7f0fe
	.word  0x345b4bb7,0x0b387c83,0x98602a0f,0x41a62152
	.word  0xb4dcb46a,0xb4ec2072,0xe98868ea,0x16765ed1
	.word  0x872c244d,0xc34551cf,0x11403608,0xc3d34acb
	.word  0x711e4b51,0x95de2d07,0xb0557444,0x25007884
	.word  0x19d86efd,0x546181c2,0x836551bb,0x8eed30ec
	.word  0x628f8ab3,0x82d0ca5d,0x434c05bd,0xb65fe76e
	.word  0xf4b39f40,0x1f6de6db,0x822602fc,0x5823edde
	.word  0x6ca605bf,0x7d9f8da1,0x19ed14c0,0x531b599b
	.word  0xd0f9fcf5,0x3c9a0f45,0x2854f199,0x8c1d859b
	.word  0x13508c48,0x1315be50,0xf56f12cc,0xdaa1ae89
	.word  0xaf38690b,0x037d4d48,0x2f6433d7,0x5452252a
	.word  0xe0a8790a,0x508e7a4c,0x47f1099d,0xa02bced3
	.word  0x18c2b430,0x77090428,0x4a8ab31a,0x02330eb6
	.word  0xf57482c5,0x6d36044a,0x5e9c07f2,0xc5315a39
	.word  0xd7f6d128,0x545fc742,0x4c6dfc1d,0x4762a051
	.word  0xcf246e1c,0xb563cb98,0xe2051e58,0x0cdeecd0
	.word  0xf70f3a46,0x3048a1a6,0x8b163dfb,0x1f5617ad
	.word  0xdd5b88ad,0x7de6a7ab,0x2e425fda,0x3e99d414
	.word  0x4894161b,0x8c39a9b5,0xab4c28fd,0xc8401928
	.word  0x484686ea,0x5c6b9271,0xa810033d,0xe24f8ded
	.word  0x67753d57,0x1152fbe8,0xf788ccaa,0xc59d0b6a
	.word  0xd16258b6,0xe3aeff81,0x079c2461,0x46292055
	.word  0xa7b397dc,0xb9bfd5ae,0xa768c9af,0xf7a28e4a
	.word  0xb30ef7f8,0x7dcb2e2b,0x5727f526,0xb7c70eb2
	.word  0x129f3f62,0x7917c225,0x5eccc383,0x68406d97
	.word  0x219de264,0x03b77692,0xb7af2c16,0x38ca7ea7
	.word  0xa6215aa9,0x67d3ba05,0x381522b6,0x7827ed7d
	.word  0xec15461b,0x4708fd75,0x995233e0,0xf588f9d2
	.word  0x6f8e3d64,0xedb8523c,0x4d41005e,0x79cd869d
	.word  0x23f482b4,0x048cd967,0xa9c08a74,0xece91714
	.word  0xa22c2d7a,0xb2338afb,0x81a2c5ad,0x9b492019
	.word  0xbb0cd3de,0xa80951f6,0x570de326,0xc4ceac9d
	.word  0xf35e3b22,0x4963d09b,0xfca907b1,0x060c4cfd
	.word  0x5c7e3850,0xed07107c,0x6beabf9b,0x1651ce76

!!# /************************************************************
!!# *
!!# * File:         stb6.j
!!# *
!!# * Description: Store buffer full condition with various
!!# * store types and 8th and 9th stores in the delay slot of 
!!# * branches.
!!# *
!!# * - Integer stores
!!# * - FP stores
!!# * - Atomics
!!# * - ASI stores (Internal)
!!# * - ASI stores (External)
!!# **************************************************************/
!!# 
!!# --c_declarations
!!# 
!!#   int i = 0;
!!# 
!!# --setup
!!# 
!!#   IJ_set_thread_count(4);
!!# 
!!# --init
!!# 
!!#   printf ("**********************************\n");
!!# 
!!#   IJ_set_ropr_fld (default, Ft_Rs1, "{4}");
!!#   IJ_set_ropr_fld (default, Ft_Rs2, "{5}");
!!#   IJ_set_ropr_fld (default, Ft_Rd, "{13..31}");
!!#   IJ_set_ropr_fld (default, Ft_Simm13, "13'b0rrrrrrrrrrrr");
!!#   IJ_set_ropr_fld (default, Fm_align_Simm13, "3'b111");
!!#   IJ_set_ropr_fld (default, Fm_align_Rd, "1'b1");
!!#   IJ_set_ropr_fld (default, Ft_Imm_Asi, "{0x80}");
!!#   IJ_set_ropr_fld (default, Ft_Cc1_f2, "1'br");
!!#   IJ_set_ropr_fld (default, Ft_Cc0_f2, "1'b0");
!!#   IJ_set_ropr_fld (default, Ft_P, "1'br");
!!#   IJ_set_ropr_fld (default, Ft_A, "1'br");  
!!#   IJ_set_ropr_fld (default, Ft_D16, "{0x1, 0x3}");
!!#   IJ_set_ropr_fld (default, Ft_Disp22, "{0x1, 0x3}");
!!#   IJ_set_ropr_fld (default, Ft_Disp19, "{0x1, 0x3}");
!!#   IJ_set_ropr_fld (default, Ft_Disp30, "{0x1, 0x3}");
!!# 
!!#   IJ_set_ropr_fld (Ro_int_asi, Ft_Rs1, "{0..3, 6..9}");
!!#   IJ_set_ropr_fld (Ro_int_asi, Ft_Rs2, "{0..3, 6..9}");
!!#   IJ_set_ropr_fld (Ro_int_asi, Ft_Rd, "{11,12}");
!!#   IJ_set_ropr_fld (Ro_int_asi, Ft_Imm_Asi, "{0x67,0x4c,0x4b}");
!!# 
!!#   IJ_set_rvar (reg_rand_init, "60'hrrrrrrrr rrrrrrr,4'br000");
!!#   for (i = 1; i < 4; i++) {
!!#      IJ_printf ("th", "\tsetx  0x%016llrx, %%r1, %%r%d\n", reg_rand_init, i);
!!#   }
!!#   for (i = 6; i < 10; i++) {
!!#      IJ_printf ("th", "\tsetx  0x%016llrx, %%r1, %%r%d\n", reg_rand_init, i);
!!#   }
!!#   
!!#   IJ_set_rvar (reg_rand_init, "28'hrrrrrrr,4'b0000,32'hrrrrrrrr");
!!#   for (i = 11; i < 13; i++) {
!!#      IJ_printf ("th", "\tsetx  0x%016llrx, %%r1, %%r%d\n", reg_rand_init, i);
!!#   }
!!#   
!!#   IJ_set_rvar (reg_rand_init, "64'hrrrrrrrr rrrrrrrr");
!!#   for (i = 13; i < 32; i++) {
!!#      IJ_printf ("th", "\tsetx  0x%016llrx, %%r1, %%r%d\n", reg_rand_init, i);
!!#   }
!!# 
!!#   IJ_set_rvar (reg_rand_init, "64'h0000000000000rr0");
!!#   IJ_printf ("th", "\tsetx  MAIN_BASE_DATA_VA, %%r1, %%r4\n");
!!#   IJ_printf ("th", "\tsetx  0x%016llrx, %%r1, %%r5\n", reg_rand_init);
!!# 
!!#   IJ_printf ("th", "\twr %%r0, 0x4, %%fprs\n");
!!#   IJ_init_fp_regs ("th", 4);
!!# 
!!#   IJ_printf ("th", "\tsetx  0x80, %%r2, %%r1\n");
!!#   IJ_printf ("th", "\twr  %%r1, %%r0, %%asi\n");
!!# 
!!#   IJ_printf ("th", "\tta T_CHANGE_HPRIV !To allow ASI writes to D-I caches\n");
!!# 
!!#   IJ_set_rvar (data_rand_init, "32'hrrrrrrrr");
!!#   IJ_printf ("-", ".data\n");
!!#   for (i = 0; i < 128; i++) {
!!#     IJ_printf ("-", "	.word  0x%08rx,0x%08rx,0x%08rx,0x%08rx\n", data_rand_init, data_rand_init, data_rand_init, data_rand_init);
!!#     IJ_printf ("-", "	.word  0x%08rx,0x%08rx,0x%08rx,0x%08rx\n", data_rand_init, data_rand_init, data_rand_init, data_rand_init);
!!#   }
!!# 
!!# --finish
!!# ;
!!# 
!!# --diag_ini
!!# #define MAIN_PAGE_HV_ALSO
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
!!# 	nop
!!# 	nop
!!#         ta      T_GOOD_TRAP
!!# 
!!# th_main_1:
!!# !<<IJ>>include "th1.s"
!!# 	nop
!!# 	nop
!!#         ta      T_GOOD_TRAP
!!# 
!!# th_main_2:
!!# !<<IJ>>include "th2.s"
!!# 	nop
!!# 	nop
!!#         ta      T_GOOD_TRAP
!!# 
!!# 
!!# th_main_3:
!!# !<<IJ>>include "th3.s"
!!# 	nop
!!# 	nop
!!#         ta      T_GOOD_TRAP
!!# 
!!# --diag_fini
!!# 
!!# --grammar
!!# 
!!# inst_block: inst_type
!!#             | inst_block inst_type
!!# ;
!!# 
!!# inst_type: store8 | store9 | st8_atm | st9_atm | st8_fp_st | st9_fp_st | st8_ext_asi | st9_ext_asi | st8_int_asi | st9_int_asi
!!# ;
!!# 
!!# store8: store store store store store store d0 store br store 
!!# {
!!#     IJ_printf ("th", "! Store8\n");
!!#     IJ_generate_va ("th", $1, $2, $3, $4, $5, $6, $8, $9, $10, NULL);
!!# }
!!# ;
!!# 
!!# store9: store store store store store store d1 store store br store
!!# {
!!#     IJ_printf ("th", "! Store9\n");
!!#     IJ_generate_va ("th", $1, $2, $3, $4, $5, $6, $8, $9, $10, $11, NULL);
!!# }
!!# ;
!!# 
!!# st8_atm: store store store store store store d2 store br atomic 
!!# {
!!#     IJ_printf ("th", "! Store8_atm\n");
!!#     IJ_generate_va ("th", $1, $2, $3, $4, $5, $6, $8, $9, $10, NULL);
!!# }
!!# ;
!!# 
!!# st9_atm: store store store store store store d3 store store br atomic
!!# {
!!#     IJ_printf ("th", "! Store9_atm\n");
!!#     IJ_generate_va ("th", $1, $2, $3, $4, $5, $6, $8, $9, $10, $11, NULL);
!!# }
!!# ;
!!# 
!!# st8_fp_st: store store store store store store d4 store br st_fp
!!# {
!!#     IJ_printf ("th", "! Store8_fp_st\n");
!!#     IJ_generate_va ("th", $1, $2, $3, $4, $5, $6, $8, $9, $10, NULL);
!!# }
!!# ;
!!# 
!!# st9_fp_st: store store store store store store d5 store store br st_fp
!!# {
!!#     IJ_printf ("th", "! Store9_fp_st\n");
!!#     IJ_generate_va ("th", $1, $2, $3, $4, $5, $6, $8, $9, $10, $11, NULL);
!!# }
!!# ;
!!# 
!!# st8_ext_asi: store store store store store store d6 store br st_ext_asi
!!# {
!!#     IJ_printf ("th", "! Store8_ext_asi\n");
!!#     IJ_generate_va ("th", $1, $2, $3, $4, $5, $6, $8, $9, $10, NULL);
!!# }
!!# ;
!!# 
!!# st9_ext_asi: store store store store store store d7 store store br st_ext_asi
!!# {
!!#     IJ_printf ("th", "! Store9_ext_asi\n");
!!#     IJ_generate_va ("th", $1, $2, $3, $4, $5, $6, $7, $9, $10, $11, NULL);
!!# }
!!# ;
!!# 
!!# st8_int_asi: store store store store store store d8 store br st_int_asi 
!!# {
!!#     IJ_printf ("th", "! Store8_ext_asi\n");
!!#     IJ_generate_va ("th", $1, $2, $3, $4, $5, $6, $8, $9, $10, NULL);
!!# }
!!# ;
!!# 
!!# st9_int_asi: store store store store store store d9 store store br st_int_asi
!!# {
!!#     IJ_printf ("th", "! Store9_int_asi\n");
!!#     IJ_generate_va ("th", $1, $2, $3, $4, $5, $6, $8, $9, $10, $11, NULL);
!!# }
!!# ;
!!# 
!!# store: tSTB_R | tSTB_I | tSTH_R | tSTH_I | tSTW_R | tSTW_I | tSTX_R | tSTX_I
!!# ;
!!# 
!!# st_fp: tSTF_R | tSTF_I | tSTDF_I | tSTDF_R 
!!# ;
!!# 
!!# atomic: tCASA_R | tCASA_I | tCASXA_R  | tCASXA_I  | tLDSTUBA_I | tLDSTUBA_R  | tSWAP_I | tSWAP_R | tSWAPA_I | tSWAPA_R 
!!# ;
!!# 
!!# st_ext_asi: tSTBA_R | tSTHA_R | tSTWA_R | tSTXA_R | tSTDA_R | tSTBA_I | tSTHA_I | tSTWA_I | tSTXA_I | tSTDA_I
!!# ;
!!# 
!!# st_int_asi: tSTXA_R %ropr Ro_int_asi 
!!# ;
!!# 
!!# br: tBA | tBN | tBNE | tBE | tBG | tBLE | tBGE | tBL | tBGU | 
!!#     tBLEU | tBCC | tBCS | tBPOS | tBNEG | tBVC | tBVS | tBRZ |
!!#     tBRLEZ | tBRLZ | tBRNZ | tBRGZ | tBRGEZ | tCALL 
!!# ;
!!# 
!!# //Tokens for disambiguating the grammar
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
!!# ;
!!# d8: mMETA8
!!# ;
!!# d9: mMETA9
!!# ;
!!# 
!! Token Generation Statistics
!! ---------------------------------
!! 
!! Rule   1 (line  120), Count:   500  inst_block           -> inst_type 
!! Rule   2 (line  121), Count:   500  inst_block           -> inst_block inst_type 
!! Rule   3 (line  124), Count:   409  inst_type            -> store8 
!! Rule   4 (line  124), Count:     3  inst_type            -> store9 
!! Rule   5 (line  124), Count:    11  inst_type            -> st8_atm 
!! Rule   6 (line  124), Count:     3  inst_type            -> st9_atm 
!! Rule   7 (line  124), Count:    17  inst_type            -> st8_fp_st 
!! Rule   8 (line  124), Count:     7  inst_type            -> st9_fp_st 
!! Rule   9 (line  124), Count:    15  inst_type            -> st8_ext_asi 
!! Rule  10 (line  124), Count:     4  inst_type            -> st9_ext_asi 
!! Rule  11 (line  124), Count:    19  inst_type            -> st8_int_asi 
!! Rule  12 (line  124), Count:     3  inst_type            -> st9_int_asi 
!! Rule  13 (line  127), Count:   409  store8               -> store store store store store store d0 store br store 
!! Rule  14 (line  134), Count:     3  store9               -> store store store store store store d1 store store br store 
!! Rule  15 (line  141), Count:    11  st8_atm              -> store store store store store store d2 store br atomic 
!! Rule  16 (line  148), Count:     3  st9_atm              -> store store store store store store d3 store store br atomic 
!! Rule  17 (line  155), Count:    17  st8_fp_st            -> store store store store store store d4 store br st_fp 
!! Rule  18 (line  162), Count:     7  st9_fp_st            -> store store store store store store d5 store store br st_fp 
!! Rule  19 (line  169), Count:    15  st8_ext_asi          -> store store store store store store d6 store br st_ext_asi 
!! Rule  20 (line  176), Count:     4  st9_ext_asi          -> store store store store store store d7 store store br st_ext_asi 
!! Rule  21 (line  183), Count:    19  st8_int_asi          -> store store store store store store d8 store br st_int_asi 
!! Rule  22 (line  190), Count:     3  st9_int_asi          -> store store store store store store d9 store store br st_int_asi 
!! Rule  23 (line  197), Count:    38  store                -> tSTB_R 
!! Rule  24 (line  197), Count:    37  store                -> tSTB_I 
!! Rule  25 (line  197), Count:    49  store                -> tSTH_R 
!! Rule  26 (line  197), Count:    51  store                -> tSTH_I 
!! Rule  27 (line  197), Count:    52  store                -> tSTW_R 
!! Rule  28 (line  197), Count:    33  store                -> tSTW_I 
!! Rule  29 (line  197), Count:    44  store                -> tSTX_R 
!! Rule  30 (line  197), Count:    41  store                -> tSTX_I 
!! Rule  31 (line  200), Count:     4  st_fp                -> tSTF_R 
!! Rule  32 (line  200), Count:     0  st_fp                -> tSTF_I 
!! Rule  33 (line  200), Count:     3  st_fp                -> tSTDF_I 
!! Rule  34 (line  200), Count:     2  st_fp                -> tSTDF_R 
!! Rule  36 (line  203), Count:     1  atomic               -> tCASA_I 
!! Rule  37 (line  203), Count:     1  atomic               -> tCASXA_R 
!! Rule  39 (line  203), Count:     1  atomic               -> tLDSTUBA_I 
!! Rule  40 (line  203), Count:     0  atomic               -> tLDSTUBA_R 
!! Rule  41 (line  203), Count:     0  atomic               -> tSWAP_I 
!! Rule  45 (line  206), Count:     0  st_ext_asi           -> tSTBA_R 
!! Rule  47 (line  206), Count:     1  st_ext_asi           -> tSTWA_R 
!! Rule  48 (line  206), Count:     1  st_ext_asi           -> tSTXA_R 
!! Rule  49 (line  206), Count:     1  st_ext_asi           -> tSTDA_R 
!! Rule  50 (line  206), Count:     0  st_ext_asi           -> tSTBA_I 
!! Rule  51 (line  206), Count:     0  st_ext_asi           -> tSTHA_I 
!! Rule  52 (line  206), Count:     0  st_ext_asi           -> tSTWA_I 
!! Rule  55 (line  209), Count:    11  st_int_asi           -> tSTXA_R 
!! Rule  56 (line  212), Count:     0  br                   -> tBA 
!! Rule  57 (line  212), Count:     0  br                   -> tBN 
!! Rule  58 (line  212), Count:     1  br                   -> tBNE 
!! Rule  59 (line  212), Count:     1  br                   -> tBE 
!! Rule  60 (line  212), Count:     1  br                   -> tBG 
!! Rule  61 (line  212), Count:     0  br                   -> tBLE 
!! Rule  62 (line  212), Count:     1  br                   -> tBGE 
!! Rule  63 (line  212), Count:     0  br                   -> tBL 
!! Rule  64 (line  212), Count:     1  br                   -> tBGU 
!! Rule  65 (line  212), Count:     1  br                   -> tBLEU 
!! Rule  66 (line  213), Count:     6  br                   -> tBCC 
!! Rule  67 (line  213), Count:     1  br                   -> tBCS 
!! Rule  70 (line  213), Count:     0  br                   -> tBVC 
!! Rule  71 (line  213), Count:     4  br                   -> tBVS 
!! Rule  72 (line  213), Count:     1  br                   -> tBRZ 
!! Rule  73 (line  213), Count:     3  br                   -> tBRLEZ 
!! Rule  74 (line  214), Count:     0  br                   -> tBRLZ 
!! Rule  75 (line  214), Count:     2  br                   -> tBRNZ 
!! Rule  76 (line  214), Count:     4  br                   -> tBRGZ 
!! Rule  77 (line  214), Count:     4  br                   -> tBRGEZ 
!! Rule  78 (line  214), Count:     0  br                   -> tCALL 
!! Rule  79 (line  219), Count:     4  d0                   -> mMETA0 
!! Rule  80 (line  221), Count:     3  d1                   -> mMETA1 
!! Rule  81 (line  223), Count:     3  d2                   -> mMETA2 
!! Rule  82 (line  225), Count:     3  d3                   -> mMETA3 
!! Rule  83 (line  227), Count:     4  d4                   -> mMETA4 
!! Rule  84 (line  229), Count:     7  d5                   -> mMETA5 
!! Rule  85 (line  231), Count:     5  d6                   -> mMETA6 
!! Rule  86 (line  233), Count:     4  d7                   -> mMETA7 
!! Rule  87 (line  235), Count:     7  d8                   -> mMETA8 
!! 
!!   257: Token tSTB_R	Count = 39
!!   258: Token tSTB_I	Count = 38
!!   259: Token tSTH_R	Count = 50
!!   260: Token tSTH_I	Count = 52
!!   261: Token tSTW_R	Count = 53
!!   262: Token tSTW_I	Count = 34
!!   263: Token tSTX_R	Count = 45
!!   264: Token tSTX_I	Count = 42
!!   265: Token tSTF_R	Count = 5
!!   266: Token tSTF_I	Count = 1
!!   267: Token tSTDF_I	Count = 4
!!   268: Token tSTDF_R	Count = 3
!!   269: Token tCASA_R	Count = 0
!!   270: Token tCASA_I	Count = 2
!!   271: Token tCASXA_R	Count = 2
!!   272: Token tCASXA_I	Count = 0
!!   273: Token tLDSTUBA_I	Count = 2
!!   274: Token tLDSTUBA_R	Count = 1
!!   275: Token tSWAP_I	Count = 1
!!   276: Token tSWAP_R	Count = 0
!!   277: Token tSWAPA_I	Count = 0
!!   278: Token tSWAPA_R	Count = 0
!!   279: Token tSTBA_R	Count = 1
!!   280: Token tSTHA_R	Count = 0
!!   281: Token tSTWA_R	Count = 2
!!   282: Token tSTXA_R	Count = 14
!!   283: Token tSTDA_R	Count = 2
!!   284: Token tSTBA_I	Count = 1
!!   285: Token tSTHA_I	Count = 1
!!   286: Token tSTWA_I	Count = 1
!!   287: Token tSTXA_I	Count = 0
!!   288: Token tSTDA_I	Count = 0
!!   289: Token tBA	Count = 1
!!   290: Token tBN	Count = 1
!!   291: Token tBNE	Count = 2
!!   292: Token tBE	Count = 2
!!   293: Token tBG	Count = 2
!!   294: Token tBLE	Count = 1
!!   295: Token tBGE	Count = 2
!!   296: Token tBL	Count = 1
!!   297: Token tBGU	Count = 2
!!   298: Token tBLEU	Count = 2
!!   299: Token tBCC	Count = 7
!!   300: Token tBCS	Count = 2
!!   301: Token tBPOS	Count = 0
!!   302: Token tBNEG	Count = 0
!!   303: Token tBVC	Count = 1
!!   304: Token tBVS	Count = 5
!!   305: Token tBRZ	Count = 2
!!   306: Token tBRLEZ	Count = 4
!!   307: Token tBRLZ	Count = 1
!!   308: Token tBRNZ	Count = 3
!!   309: Token tBRGZ	Count = 5
!!   310: Token tBRGEZ	Count = 5
!!   311: Token tCALL	Count = 1
!!   312: Token mMETA0	Count = 5
!!   313: Token mMETA1	Count = 4
!!   314: Token mMETA2	Count = 4
!!   315: Token mMETA3	Count = 4
!!   316: Token mMETA4	Count = 5
!!   317: Token mMETA5	Count = 8
!!   318: Token mMETA6	Count = 6
!!   319: Token mMETA7	Count = 5
!!   320: Token mMETA8	Count = 8
!!   321: Token mMETA9	Count = 4
!! 
!! 
!! +++ finish +++

