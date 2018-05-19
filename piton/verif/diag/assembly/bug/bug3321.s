// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: bug3321.s
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
   random seed:	759277343
   Jal stb4.j:	
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
	setx  0x39cb16040db5a640, %r1, %r1
	setx  0x07fb7ee30143ab80, %r1, %r2
	setx  0x2119f99507030f98, %r1, %r3
	setx  0x8749704c08470518, %r1, %r6
	setx  0xb314fc01035c1eb0, %r1, %r7
	setx  0xf8a29d60059eafb0, %r1, %r8
	setx  0xc2c5e61a03408278, %r1, %r9
	setx  0xa785a770080ff838, %r1, %r11
	setx  0xd9b97580006fe584, %r1, %r12
	setx  0x30550e92f6f16b2e, %r1, %r13
	setx  0x26925e82ae690835, %r1, %r14
	setx  0x5e92e2113547a1ff, %r1, %r15
	setx  0xcac083b2f33acd67, %r1, %r16
	setx  0xafee8a9ac0b93a27, %r1, %r17
	setx  0x7c400b732a3785d5, %r1, %r18
	setx  0x94ccb73c36eab255, %r1, %r19
	setx  0xb120ea7ff361d683, %r1, %r20
	setx  0x599a7002b237d64d, %r1, %r21
	setx  0x5fcce7d666d1d332, %r1, %r22
	setx  0x491b47e077ef96ac, %r1, %r23
	setx  0x1b43068ad3cf85d2, %r1, %r24
	setx  0xa9739c0d15857930, %r1, %r25
	setx  0x2011be1a80bedf75, %r1, %r26
	setx  0x3ea73a058b0db4f9, %r1, %r27
	setx  0x78be25c5662e82df, %r1, %r28
	setx  0x9ad42c678ca903f8, %r1, %r29
	setx  0xe1da4982a2b551cf, %r1, %r30
	setx  0x9e0d7e63d7007fe4, %r1, %r31
	setx  MAIN_BASE_DATA_VA, %r1, %r4
	setx  0x0000000000000da0, %r1, %r5
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
	.word 0xf8210005  ! 6: STW_R	stw	%r28, [%r4 + %r5]
	.word 0xf2290005  ! 7: STB_R	stb	%r25, [%r4 + %r5]
	.word 0xeef11005  ! 8: STXA_R	stxa	%r23, [%r4 + %r5] 0x80
	.word 0xd6f24960  ! 10: STXA_R	stxa	%r11, [%r9 + %r0] 0x4b
	.word 0xf5212084  ! 11: STF_I	st	%f26, [0x0084, %r4]
	.word 0xf9f12005  ! 12: CASXA_R	casxa	[%r4]%asi, %r5, %r28
	.word 0xf4e92155  ! 13: LDSTUBA_I	ldstuba	%r26, [%r4 + 0x0155] %asi
	.word 0xfcb925d8  ! 14: STDA_I	stda	%r30, [%r4 + 0x05d8] %asi
	.word 0xf1210005  ! 15: STF_R	st	%f24, [%r5, %r4]
	.word 0xe0b91005  ! 16: STDA_R	stda	%r16, [%r4 + %r5] 0x80
	.word 0xf33922b8  ! 17: STDF_I	std	%f25, [0x02b8, %r4]
	.word 0xf0710005  ! 18: STX_R	stx	%r24, [%r4 + %r5]
	.word 0xe9210005  ! 19: STF_R	st	%f20, [%r5, %r4]
	.word 0xfbf12005  ! 20: CASXA_R	casxa	[%r4]%asi, %r5, %r29
	.word 0xe1390005  ! 21: STDF_R	std	%f16, [%r5, %r4]
	.word 0xd6f20961  ! 23: STXA_R	stxa	%r11, [%r8 + %r1] 0x4b
	.word 0xdea12568  ! 24: STWA_I	stwa	%r15, [%r4 + 0x0568] %asi
	.word 0xe6e92974  ! 25: LDSTUBA_I	ldstuba	%r19, [%r4 + 0x0974] %asi
	.word 0xef2124e4  ! 26: STF_I	st	%f23, [0x04e4, %r4]
	.word 0xdaf12040  ! 27: STXA_I	stxa	%r13, [%r4 + 0x0040] %asi
	.word 0xd8f0cce3  ! 29: STXA_R	stxa	%r12, [%r3 + %r3] 0x67
	.word 0xd6f20968  ! 31: STXA_R	stxa	%r11, [%r8 + %r8] 0x4b
	.word 0xd6f24980  ! 33: STXA_R	stxa	%r11, [%r9 + %r0] 0x4c
	.word 0xe0710005  ! 34: STX_R	stx	%r16, [%r4 + %r5]
	.word 0xd6f04ce2  ! 36: STXA_R	stxa	%r11, [%r1 + %r2] 0x67
	.word 0xd6f1cce3  ! 38: STXA_R	stxa	%r11, [%r7 + %r3] 0x67
	.word 0xd8f0cce2  ! 40: STXA_R	stxa	%r12, [%r3 + %r2] 0x67
	.word 0xf8712960  ! 41: STX_I	stx	%r28, [%r4 + 0x0960]
	.word 0xde312f28  ! 42: STH_I	sth	%r15, [%r4 + 0x0f28]
	.word 0xdb210005  ! 43: STF_R	st	%f13, [%r5, %r4]
	.word 0xd6f04989  ! 45: STXA_R	stxa	%r11, [%r1 + %r9] 0x4c
	.word 0xd6f08ce2  ! 47: STXA_R	stxa	%r11, [%r2 + %r2] 0x67
	.word 0xfce91005  ! 48: LDSTUBA_R	ldstuba	%r30, [%r4 + %r5] 0x80
	.word 0xf0a11005  ! 49: STWA_R	stwa	%r24, [%r4 + %r5] 0x80
	.word 0xfe292b70  ! 50: STB_I	stb	%r31, [%r4 + 0x0b70]
	.word 0xf2a12578  ! 51: STWA_I	stwa	%r25, [%r4 + 0x0578] %asi
	.word 0xd6f0c983  ! 53: STXA_R	stxa	%r11, [%r3 + %r3] 0x4c
	.word 0xdaf12b18  ! 54: STXA_I	stxa	%r13, [%r4 + 0x0b18] %asi
	.word 0xdf392c60  ! 55: STDF_I	std	%f15, [0x0c60, %r4]
	.word 0xdc712728  ! 56: STX_I	stx	%r14, [%r4 + 0x0728]
	.word 0xe4290005  ! 57: STB_R	stb	%r18, [%r4 + %r5]
	.word 0xe33926f0  ! 58: STDF_I	std	%f17, [0x06f0, %r4]
	.word 0xe3390005  ! 59: STDF_R	std	%f17, [%r5, %r4]
	.word 0xf0f91005  ! 60: SWAPA_R	swapa	%r24, [%r4 + %r5] 0x80
	.word 0xfef91005  ! 61: SWAPA_R	swapa	%r31, [%r4 + %r5] 0x80
	.word 0xe0b91005  ! 62: STDA_R	stda	%r16, [%r4 + %r5] 0x80
	.word 0xeb210005  ! 63: STF_R	st	%f21, [%r5, %r4]
	.word 0xf3390005  ! 64: STDF_R	std	%f25, [%r5, %r4]
	.word 0xe7390005  ! 65: STDF_R	std	%f19, [%r5, %r4]
	.word 0xda710005  ! 66: STX_R	stx	%r13, [%r4 + %r5]
	.word 0xfbe12005  ! 67: CASA_R	casa	[%r4] %asi, %r5, %r29
	.word 0xef392748  ! 68: STDF_I	std	%f23, [0x0748, %r4]
	.word 0xda212ef8  ! 69: STW_I	stw	%r13, [%r4 + 0x0ef8]
	.word 0xecb92b40  ! 70: STDA_I	stda	%r22, [%r4 + 0x0b40] %asi
	.word 0xe4210005  ! 71: STW_R	stw	%r18, [%r4 + %r5]
	.word 0xfee91005  ! 72: LDSTUBA_R	ldstuba	%r31, [%r4 + %r5] 0x80
	.word 0xdeb12c86  ! 73: STHA_I	stha	%r15, [%r4 + 0x0c86] %asi
	.word 0xe4292bfd  ! 74: STB_I	stb	%r18, [%r4 + 0x0bfd]
	.word 0xdd390005  ! 75: STDF_R	std	%f14, [%r5, %r4]
	.word 0xdca11005  ! 76: STWA_R	stwa	%r14, [%r4 + %r5] 0x80
	.word 0xe9e12005  ! 77: CASA_R	casa	[%r4] %asi, %r5, %r20
	.word 0xdcb11005  ! 78: STHA_R	stha	%r14, [%r4 + %r5] 0x80
	.word 0xfc790005  ! 79: SWAP_R	swap	%r30, [%r4 + %r5]
	.word 0xf2b11005  ! 80: STHA_R	stha	%r25, [%r4 + %r5] 0x80
	.word 0xf8290005  ! 81: STB_R	stb	%r28, [%r4 + %r5]
	.word 0xd8f1cce2  ! 83: STXA_R	stxa	%r12, [%r7 + %r2] 0x67
	.word 0xdbf11005  ! 84: CASXA_I	casxa	[%r4] 0x80, %r5, %r13
	.word 0xdb390005  ! 85: STDF_R	std	%f13, [%r5, %r4]
	.word 0xd8f1cce9  ! 87: STXA_R	stxa	%r12, [%r7 + %r9] 0x67
	.word 0xf1392b20  ! 88: STDF_I	std	%f24, [0x0b20, %r4]
	.word 0xe0292471  ! 89: STB_I	stb	%r16, [%r4 + 0x0471]
	.word 0xd6f00962  ! 91: STXA_R	stxa	%r11, [%r0 + %r2] 0x4b
	.word 0xd6f00962  ! 93: STXA_R	stxa	%r11, [%r0 + %r2] 0x4b
	.word 0xfdf12005  ! 94: CASXA_R	casxa	[%r4]%asi, %r5, %r30
	.word 0xf83127aa  ! 95: STH_I	sth	%r28, [%r4 + 0x07aa]
	.word 0xd6f00969  ! 97: STXA_R	stxa	%r11, [%r0 + %r9] 0x4b
	.word 0xeaf12418  ! 98: STXA_I	stxa	%r21, [%r4 + 0x0418] %asi
	.word 0xfaf91005  ! 99: SWAPA_R	swapa	%r29, [%r4 + %r5] 0x80
	.word 0xf8310005  ! 100: STH_R	sth	%r28, [%r4 + %r5]
	.word 0xf0712b20  ! 101: STX_I	stx	%r24, [%r4 + 0x0b20]
	.word 0xe7210005  ! 102: STF_R	st	%f19, [%r5, %r4]
	.word 0xd8f24983  ! 104: STXA_R	stxa	%r12, [%r9 + %r3] 0x4c
	.word 0xf8b11005  ! 105: STHA_R	stha	%r28, [%r4 + %r5] 0x80
	.word 0xeb212bb0  ! 106: STF_I	st	%f21, [0x0bb0, %r4]
	.word 0xd6f00ce9  ! 108: STXA_R	stxa	%r11, [%r0 + %r9] 0x67
	.word 0xd6f1c960  ! 110: STXA_R	stxa	%r11, [%r7 + %r0] 0x4b
	.word 0xe1392658  ! 111: STDF_I	std	%f16, [0x0658, %r4]
	.word 0xfe310005  ! 112: STH_R	sth	%r31, [%r4 + %r5]
	.word 0xf3210005  ! 113: STF_R	st	%f25, [%r5, %r4]
	.word 0xec210005  ! 114: STW_R	stw	%r22, [%r4 + %r5]
	.word 0xe0b922e0  ! 115: STDA_I	stda	%r16, [%r4 + 0x02e0] %asi
	.word 0xfe290005  ! 116: STB_R	stb	%r31, [%r4 + %r5]
	.word 0xf72124a8  ! 117: STF_I	st	%f27, [0x04a8, %r4]
	.word 0xd6f08ce1  ! 119: STXA_R	stxa	%r11, [%r2 + %r1] 0x67
	.word 0xe32125b0  ! 120: STF_I	st	%f17, [0x05b0, %r4]
	.word 0xd8f0cce0  ! 122: STXA_R	stxa	%r12, [%r3 + %r0] 0x67
	.word 0xd6f00ce9  ! 124: STXA_R	stxa	%r11, [%r0 + %r9] 0x67
	.word 0xec212290  ! 125: STW_I	stw	%r22, [%r4 + 0x0290]
	.word 0xdcb92510  ! 126: STDA_I	stda	%r14, [%r4 + 0x0510] %asi
	.word 0xd8f1cce3  ! 128: STXA_R	stxa	%r12, [%r7 + %r3] 0x67
	.word 0xf4b11005  ! 129: STHA_R	stha	%r26, [%r4 + %r5] 0x80
	.word 0xdd390005  ! 130: STDF_R	std	%f14, [%r5, %r4]
	.word 0xe2b12674  ! 131: STHA_I	stha	%r17, [%r4 + 0x0674] %asi
	.word 0xe4b920d0  ! 132: STDA_I	stda	%r18, [%r4 + 0x00d0] %asi
	.word 0xe4b12b38  ! 133: STHA_I	stha	%r18, [%r4 + 0x0b38] %asi
	.word 0xdb392f30  ! 134: STDF_I	std	%f13, [0x0f30, %r4]
	.word 0xdea12530  ! 135: STWA_I	stwa	%r15, [%r4 + 0x0530] %asi
	.word 0xf0e920e5  ! 136: LDSTUBA_I	ldstuba	%r24, [%r4 + 0x00e5] %asi
	.word 0xf7f12005  ! 137: CASXA_R	casxa	[%r4]%asi, %r5, %r27
	.word 0xf6792114  ! 138: SWAP_I	swap	%r27, [%r4 + 0x0114]
	.word 0xe8f126e0  ! 139: STXA_I	stxa	%r20, [%r4 + 0x06e0] %asi
	.word 0xf6792158  ! 140: SWAP_I	swap	%r27, [%r4 + 0x0158]
	.word 0xec290005  ! 141: STB_R	stb	%r22, [%r4 + %r5]
	.word 0xdd2122f8  ! 142: STF_I	st	%f14, [0x02f8, %r4]
	.word 0xdbe11005  ! 143: CASA_I	casa	[%r4] 0x80, %r5, %r13
	.word 0xe3f12005  ! 144: CASXA_R	casxa	[%r4]%asi, %r5, %r17
	.word 0xd8f18ce3  ! 146: STXA_R	stxa	%r12, [%r6 + %r3] 0x67
	.word 0xfc210005  ! 147: STW_R	stw	%r30, [%r4 + %r5]
	.word 0xe6b1294c  ! 148: STHA_I	stha	%r19, [%r4 + 0x094c] %asi
	.word 0xd6f18961  ! 150: STXA_R	stxa	%r11, [%r6 + %r1] 0x4b
	.word 0xf8712e00  ! 151: STX_I	stx	%r28, [%r4 + 0x0e00]
	.word 0xfe290005  ! 152: STB_R	stb	%r31, [%r4 + %r5]
	.word 0xd6f24ce0  ! 154: STXA_R	stxa	%r11, [%r9 + %r0] 0x67
	.word 0xfae91005  ! 155: LDSTUBA_R	ldstuba	%r29, [%r4 + %r5] 0x80
	.word 0xd6f00ce1  ! 157: STXA_R	stxa	%r11, [%r0 + %r1] 0x67
	.word 0xe13920b8  ! 158: STDF_I	std	%f16, [0x00b8, %r4]
	.word 0xf4b11005  ! 159: STHA_R	stha	%r26, [%r4 + %r5] 0x80
	.word 0xf2f91005  ! 160: SWAPA_R	swapa	%r25, [%r4 + %r5] 0x80
	.word 0xeaa12bf4  ! 161: STWA_I	stwa	%r21, [%r4 + 0x0bf4] %asi
	.word 0xf1212444  ! 162: STF_I	st	%f24, [0x0444, %r4]
	.word 0xe3392670  ! 163: STDF_I	std	%f17, [0x0670, %r4]
	.word 0xf8b91005  ! 164: STDA_R	stda	%r28, [%r4 + %r5] 0x80
	.word 0xea790005  ! 165: SWAP_R	swap	%r21, [%r4 + %r5]
	.word 0xd8f04983  ! 167: STXA_R	stxa	%r12, [%r1 + %r3] 0x4c
	.word 0xf2a11005  ! 168: STWA_R	stwa	%r25, [%r4 + %r5] 0x80
	.word 0xee710005  ! 169: STX_R	stx	%r23, [%r4 + %r5]
	.word 0xfef91005  ! 170: SWAPA_R	swapa	%r31, [%r4 + %r5] 0x80
	.word 0xef212224  ! 171: STF_I	st	%f23, [0x0224, %r4]
	.word 0xf2712f18  ! 172: STX_I	stx	%r25, [%r4 + 0x0f18]
	.word 0xdd212a14  ! 173: STF_I	st	%f14, [0x0a14, %r4]
	.word 0xd6f1cce0  ! 175: STXA_R	stxa	%r11, [%r7 + %r0] 0x67
	.word 0xe7210005  ! 176: STF_R	st	%f19, [%r5, %r4]
	.word 0xdab1287a  ! 177: STHA_I	stha	%r13, [%r4 + 0x087a] %asi
	.word 0xe6a929ff  ! 178: STBA_I	stba	%r19, [%r4 + 0x09ff] %asi
	.word 0xfc290005  ! 179: STB_R	stb	%r30, [%r4 + %r5]
	.word 0xd8b91005  ! 180: STDA_R	stda	%r12, [%r4 + %r5] 0x80
	.word 0xf8290005  ! 181: STB_R	stb	%r28, [%r4 + %r5]
	.word 0xd8f04ce6  ! 183: STXA_R	stxa	%r12, [%r1 + %r6] 0x67
	.word 0xef212aa8  ! 184: STF_I	st	%f23, [0x0aa8, %r4]
	.word 0xfbf12005  ! 185: CASXA_R	casxa	[%r4]%asi, %r5, %r29
	.word 0xf7390005  ! 186: STDF_R	std	%f27, [%r5, %r4]
	.word 0xeca91005  ! 187: STBA_R	stba	%r22, [%r4 + %r5] 0x80
	.word 0xe6210005  ! 188: STW_R	stw	%r19, [%r4 + %r5]
	.word 0xdb390005  ! 189: STDF_R	std	%f13, [%r5, %r4]
	.word 0xee3129c8  ! 190: STH_I	sth	%r23, [%r4 + 0x09c8]
	.word 0xee210005  ! 191: STW_R	stw	%r23, [%r4 + %r5]
	.word 0xd8f0c982  ! 193: STXA_R	stxa	%r12, [%r3 + %r2] 0x4c
	.word 0xe4b12b96  ! 194: STHA_I	stha	%r18, [%r4 + 0x0b96] %asi
	.word 0xeae91005  ! 195: LDSTUBA_R	ldstuba	%r21, [%r4 + %r5] 0x80
	.word 0xda7126f0  ! 196: STX_I	stx	%r13, [%r4 + 0x06f0]
	.word 0xd6f00ce9  ! 198: STXA_R	stxa	%r11, [%r0 + %r9] 0x67
	.word 0xf2312908  ! 199: STH_I	sth	%r25, [%r4 + 0x0908]
	.word 0xfaa11005  ! 200: STWA_R	stwa	%r29, [%r4 + %r5] 0x80
	.word 0xf3210005  ! 201: STF_R	st	%f25, [%r5, %r4]
	.word 0xe2212518  ! 202: STW_I	stw	%r17, [%r4 + 0x0518]
	.word 0xd6f08ce2  ! 204: STXA_R	stxa	%r11, [%r2 + %r2] 0x67
	.word 0xd6f18963  ! 206: STXA_R	stxa	%r11, [%r6 + %r3] 0x4b
	.word 0xe72127b0  ! 207: STF_I	st	%f19, [0x07b0, %r4]
	.word 0xfb390005  ! 208: STDF_R	std	%f29, [%r5, %r4]
	.word 0xd6f1cce2  ! 210: STXA_R	stxa	%r11, [%r7 + %r2] 0x67
	.word 0xe12120a4  ! 211: STF_I	st	%f16, [0x00a4, %r4]
	.word 0xe7f12005  ! 212: CASXA_R	casxa	[%r4]%asi, %r5, %r19
	.word 0xe6312b46  ! 213: STH_I	sth	%r19, [%r4 + 0x0b46]
	.word 0xf8710005  ! 214: STX_R	stx	%r28, [%r4 + %r5]
	.word 0xe2f122e0  ! 215: STXA_I	stxa	%r17, [%r4 + 0x02e0] %asi
	.word 0xd6f00ce2  ! 217: STXA_R	stxa	%r11, [%r0 + %r2] 0x67
	.word 0xde212260  ! 218: STW_I	stw	%r15, [%r4 + 0x0260]
	.word 0xf4b11005  ! 219: STHA_R	stha	%r26, [%r4 + %r5] 0x80
	.word 0xe1210005  ! 220: STF_R	st	%f16, [%r5, %r4]
	.word 0xd6f08963  ! 222: STXA_R	stxa	%r11, [%r2 + %r3] 0x4b
	.word 0xf7210005  ! 223: STF_R	st	%f27, [%r5, %r4]
	.word 0xe9392b80  ! 224: STDF_I	std	%f20, [0x0b80, %r4]
	.word 0xf2212a70  ! 225: STW_I	stw	%r25, [%r4 + 0x0a70]
	.word 0xfb212f78  ! 226: STF_I	st	%f29, [0x0f78, %r4]
	.word 0xe6a11005  ! 227: STWA_R	stwa	%r19, [%r4 + %r5] 0x80
	.word 0xe6b11005  ! 228: STHA_R	stha	%r19, [%r4 + %r5] 0x80
	.word 0xe8e91005  ! 229: LDSTUBA_R	ldstuba	%r20, [%r4 + %r5] 0x80
	.word 0xf2f11005  ! 230: STXA_R	stxa	%r25, [%r4 + %r5] 0x80
	.word 0xd8f04969  ! 232: STXA_R	stxa	%r12, [%r1 + %r9] 0x4b
	.word 0xe9390005  ! 233: STDF_R	std	%f20, [%r5, %r4]
	.word 0xdaa91005  ! 234: STBA_R	stba	%r13, [%r4 + %r5] 0x80
	.word 0xe8b92368  ! 235: STDA_I	stda	%r20, [%r4 + 0x0368] %asi
	.word 0xe2a11005  ! 236: STWA_R	stwa	%r17, [%r4 + %r5] 0x80
	.word 0xfef127d0  ! 237: STXA_I	stxa	%r31, [%r4 + 0x07d0] %asi
	.word 0xf8290005  ! 238: STB_R	stb	%r28, [%r4 + %r5]
	.word 0xd6f08980  ! 240: STXA_R	stxa	%r11, [%r2 + %r0] 0x4c
	.word 0xf2790005  ! 241: SWAP_R	swap	%r25, [%r4 + %r5]
	.word 0xeea11005  ! 242: STWA_R	stwa	%r23, [%r4 + %r5] 0x80
	.word 0xe6712128  ! 243: STX_I	stx	%r19, [%r4 + 0x0128]
	.word 0xe0212558  ! 244: STW_I	stw	%r16, [%r4 + 0x0558]
	.word 0xf6f92b28  ! 245: SWAPA_I	swapa	%r27, [%r4 + 0x0b28] %asi
	.word 0xf6790005  ! 246: SWAP_R	swap	%r27, [%r4 + %r5]
	.word 0xd6f1c963  ! 248: STXA_R	stxa	%r11, [%r7 + %r3] 0x4b
	.word 0xebf11005  ! 249: CASXA_I	casxa	[%r4] 0x80, %r5, %r21
	.word 0xe9390005  ! 250: STDF_R	std	%f20, [%r5, %r4]
	.word 0xe6b11005  ! 251: STHA_R	stha	%r19, [%r4 + %r5] 0x80
	.word 0xe2a91005  ! 252: STBA_R	stba	%r17, [%r4 + %r5] 0x80
	.word 0xe9390005  ! 253: STDF_R	std	%f20, [%r5, %r4]
	.word 0xf4a11005  ! 254: STWA_R	stwa	%r26, [%r4 + %r5] 0x80
	.word 0xdf392b60  ! 255: STDF_I	std	%f15, [0x0b60, %r4]
	.word 0xfae92f6a  ! 256: LDSTUBA_I	ldstuba	%r29, [%r4 + 0x0f6a] %asi
	.word 0xd8f08ce2  ! 258: STXA_R	stxa	%r12, [%r2 + %r2] 0x67
	.word 0xd6f20962  ! 260: STXA_R	stxa	%r11, [%r8 + %r2] 0x4b
	.word 0xe1e12005  ! 261: CASA_R	casa	[%r4] %asi, %r5, %r16
	.word 0xf2712b80  ! 262: STX_I	stx	%r25, [%r4 + 0x0b80]
	.word 0xe4b92228  ! 263: STDA_I	stda	%r18, [%r4 + 0x0228] %asi
	.word 0xe9390005  ! 264: STDF_R	std	%f20, [%r5, %r4]
	.word 0xfea12928  ! 265: STWA_I	stwa	%r31, [%r4 + 0x0928] %asi
	.word 0xf4f11005  ! 266: STXA_R	stxa	%r26, [%r4 + %r5] 0x80
	.word 0xdbf12005  ! 267: CASXA_R	casxa	[%r4]%asi, %r5, %r13
	.word 0xdb210005  ! 268: STF_R	st	%f13, [%r5, %r4]
	.word 0xdab12d78  ! 269: STHA_I	stha	%r13, [%r4 + 0x0d78] %asi
	.word 0xd6f04ce2  ! 271: STXA_R	stxa	%r11, [%r1 + %r2] 0x67
	.word 0xf8790005  ! 272: SWAP_R	swap	%r28, [%r4 + %r5]
	.word 0xd6f08988  ! 274: STXA_R	stxa	%r11, [%r2 + %r8] 0x4c
	.word 0xfd210005  ! 275: STF_R	st	%f30, [%r5, %r4]
	.word 0xd6f0cce6  ! 277: STXA_R	stxa	%r11, [%r3 + %r6] 0x67
	.word 0xd8f00963  ! 279: STXA_R	stxa	%r12, [%r0 + %r3] 0x4b
	.word 0xe9210005  ! 280: STF_R	st	%f20, [%r5, %r4]
	.word 0xebf11005  ! 281: CASXA_I	casxa	[%r4] 0x80, %r5, %r21
	.word 0xf229226d  ! 282: STB_I	stb	%r25, [%r4 + 0x026d]
	.word 0xf6e927e7  ! 283: LDSTUBA_I	ldstuba	%r27, [%r4 + 0x07e7] %asi
	.word 0xd6f24ce9  ! 285: STXA_R	stxa	%r11, [%r9 + %r9] 0x67
	.word 0xfce91005  ! 286: LDSTUBA_R	ldstuba	%r30, [%r4 + %r5] 0x80
	.word 0xd8f08ce1  ! 288: STXA_R	stxa	%r12, [%r2 + %r1] 0x67
	.word 0xeb212a50  ! 289: STF_I	st	%f21, [0x0a50, %r4]
	.word 0xfd212480  ! 290: STF_I	st	%f30, [0x0480, %r4]
	.word 0xffe12005  ! 291: CASA_R	casa	[%r4] %asi, %r5, %r31
	.word 0xe021219c  ! 292: STW_I	stw	%r16, [%r4 + 0x019c]
	.word 0xe4790005  ! 293: SWAP_R	swap	%r18, [%r4 + %r5]
	.word 0xf5390005  ! 294: STDF_R	std	%f26, [%r5, %r4]
	.word 0xf33921c0  ! 295: STDF_I	std	%f25, [0x01c0, %r4]
	.word 0xd6f00ce0  ! 297: STXA_R	stxa	%r11, [%r0 + %r0] 0x67
	.word 0xff210005  ! 298: STF_R	st	%f31, [%r5, %r4]
	.word 0xe8e91005  ! 299: LDSTUBA_R	ldstuba	%r20, [%r4 + %r5] 0x80
	.word 0xe9210005  ! 300: STF_R	st	%f20, [%r5, %r4]
	.word 0xd6f18987  ! 302: STXA_R	stxa	%r11, [%r6 + %r7] 0x4c
	.word 0xfeb11005  ! 303: STHA_R	stha	%r31, [%r4 + %r5] 0x80
	.word 0xfb390005  ! 304: STDF_R	std	%f29, [%r5, %r4]
	.word 0xf0e91005  ! 305: LDSTUBA_R	ldstuba	%r24, [%r4 + %r5] 0x80
	.word 0xe6a91005  ! 306: STBA_R	stba	%r19, [%r4 + %r5] 0x80
	.word 0xeb392748  ! 307: STDF_I	std	%f21, [0x0748, %r4]
	.word 0xd6f00962  ! 309: STXA_R	stxa	%r11, [%r0 + %r2] 0x4b
	.word 0xdc212acc  ! 310: STW_I	stw	%r14, [%r4 + 0x0acc]
	.word 0xfe212b98  ! 311: STW_I	stw	%r31, [%r4 + 0x0b98]
	.word 0xf5210005  ! 312: STF_R	st	%f26, [%r5, %r4]
	.word 0xed2128dc  ! 313: STF_I	st	%f22, [0x08dc, %r4]
	.word 0xf2f91005  ! 314: SWAPA_R	swapa	%r25, [%r4 + %r5] 0x80
	.word 0xdaf12818  ! 315: STXA_I	stxa	%r13, [%r4 + 0x0818] %asi
	.word 0xff210005  ! 316: STF_R	st	%f31, [%r5, %r4]
	.word 0xff390005  ! 317: STDF_R	std	%f31, [%r5, %r4]
	.word 0xdd392860  ! 318: STDF_I	std	%f14, [0x0860, %r4]
	.word 0xf5212c5c  ! 319: STF_I	st	%f26, [0x0c5c, %r4]
	.word 0xf3212788  ! 320: STF_I	st	%f25, [0x0788, %r4]
	.word 0xf4f11005  ! 321: STXA_R	stxa	%r26, [%r4 + %r5] 0x80
	.word 0xfea11005  ! 322: STWA_R	stwa	%r31, [%r4 + %r5] 0x80
	.word 0xdff12005  ! 323: CASXA_R	casxa	[%r4]%asi, %r5, %r15
	.word 0xe6e91005  ! 324: LDSTUBA_R	ldstuba	%r19, [%r4 + %r5] 0x80
	.word 0xe1e11005  ! 325: CASA_I	casa	[%r4] 0x80, %r5, %r16
	.word 0xeae9239c  ! 326: LDSTUBA_I	ldstuba	%r21, [%r4 + 0x039c] %asi
	.word 0xd6f08982  ! 328: STXA_R	stxa	%r11, [%r2 + %r2] 0x4c
	.word 0xecf926a0  ! 329: SWAPA_I	swapa	%r22, [%r4 + 0x06a0] %asi
	.word 0xe2210005  ! 330: STW_R	stw	%r17, [%r4 + %r5]
	.word 0xf3f12005  ! 331: CASXA_R	casxa	[%r4]%asi, %r5, %r25
	.word 0xe0f91005  ! 332: SWAPA_R	swapa	%r16, [%r4 + %r5] 0x80
	.word 0xec790005  ! 333: SWAP_R	swap	%r22, [%r4 + %r5]
	.word 0xffe12005  ! 334: CASA_R	casa	[%r4] %asi, %r5, %r31
	.word 0xfb210005  ! 335: STF_R	st	%f29, [%r5, %r4]
	.word 0xdb390005  ! 336: STDF_R	std	%f13, [%r5, %r4]
	.word 0xed210005  ! 337: STF_R	st	%f22, [%r5, %r4]
	.word 0xf2212640  ! 338: STW_I	stw	%r25, [%r4 + 0x0640]
	.word 0xe9390005  ! 339: STDF_R	std	%f20, [%r5, %r4]
	.word 0xfe210005  ! 340: STW_R	stw	%r31, [%r4 + %r5]
	.word 0xd8f04ce9  ! 342: STXA_R	stxa	%r12, [%r1 + %r9] 0x67
	.word 0xe53920d0  ! 343: STDF_I	std	%f18, [0x00d0, %r4]
	.word 0xe6f92760  ! 344: SWAPA_I	swapa	%r19, [%r4 + 0x0760] %asi
	.word 0xfca11005  ! 345: STWA_R	stwa	%r30, [%r4 + %r5] 0x80
	.word 0xd8f04ce2  ! 347: STXA_R	stxa	%r12, [%r1 + %r2] 0x67
	.word 0xeef91005  ! 348: SWAPA_R	swapa	%r23, [%r4 + %r5] 0x80
	.word 0xd6f08962  ! 350: STXA_R	stxa	%r11, [%r2 + %r2] 0x4b
	.word 0xdde12005  ! 351: CASA_R	casa	[%r4] %asi, %r5, %r14
	.word 0xe8710005  ! 352: STX_R	stx	%r20, [%r4 + %r5]
	.word 0xfe290005  ! 353: STB_R	stb	%r31, [%r4 + %r5]
	.word 0xf1390005  ! 354: STDF_R	std	%f24, [%r5, %r4]
	.word 0xd6f18ce0  ! 356: STXA_R	stxa	%r11, [%r6 + %r0] 0x67
	.word 0xf2f92a90  ! 357: SWAPA_I	swapa	%r25, [%r4 + 0x0a90] %asi
	.word 0xf4f92088  ! 358: SWAPA_I	swapa	%r26, [%r4 + 0x0088] %asi
	.word 0xd8f00968  ! 360: STXA_R	stxa	%r12, [%r0 + %r8] 0x4b
	.word 0xdcb11005  ! 361: STHA_R	stha	%r14, [%r4 + %r5] 0x80
	.word 0xf6b11005  ! 362: STHA_R	stha	%r27, [%r4 + %r5] 0x80
	.word 0xde79297c  ! 363: SWAP_I	swap	%r15, [%r4 + 0x097c]
	.word 0xf4f11005  ! 364: STXA_R	stxa	%r26, [%r4 + %r5] 0x80
	.word 0xf1390005  ! 365: STDF_R	std	%f24, [%r5, %r4]
	.word 0xd6f00981  ! 367: STXA_R	stxa	%r11, [%r0 + %r1] 0x4c
	.word 0xea710005  ! 368: STX_R	stx	%r21, [%r4 + %r5]
	.word 0xf2710005  ! 369: STX_R	stx	%r25, [%r4 + %r5]
	.word 0xf0712788  ! 370: STX_I	stx	%r24, [%r4 + 0x0788]
	.word 0xea290005  ! 371: STB_R	stb	%r21, [%r4 + %r5]
	.word 0xdeb11005  ! 372: STHA_R	stha	%r15, [%r4 + %r5] 0x80
	.word 0xfb212cfc  ! 373: STF_I	st	%f29, [0x0cfc, %r4]
	.word 0xd8f1c969  ! 375: STXA_R	stxa	%r12, [%r7 + %r9] 0x4b
	.word 0xf4f91005  ! 376: SWAPA_R	swapa	%r26, [%r4 + %r5] 0x80
	.word 0xfaa11005  ! 377: STWA_R	stwa	%r29, [%r4 + %r5] 0x80
	.word 0xfcf11005  ! 378: STXA_R	stxa	%r30, [%r4 + %r5] 0x80
	.word 0xd6f20982  ! 380: STXA_R	stxa	%r11, [%r8 + %r2] 0x4c
	.word 0xdd210005  ! 381: STF_R	st	%f14, [%r5, %r4]
	.word 0xe0212a8c  ! 382: STW_I	stw	%r16, [%r4 + 0x0a8c]
	.word 0xd6f18ce9  ! 384: STXA_R	stxa	%r11, [%r6 + %r9] 0x67
	.word 0xea210005  ! 385: STW_R	stw	%r21, [%r4 + %r5]
	.word 0xd6f04ce0  ! 387: STXA_R	stxa	%r11, [%r1 + %r0] 0x67
	.word 0xd6f04983  ! 389: STXA_R	stxa	%r11, [%r1 + %r3] 0x4c
	.word 0xd6f24ce6  ! 391: STXA_R	stxa	%r11, [%r9 + %r6] 0x67
	.word 0xd8f04ce1  ! 393: STXA_R	stxa	%r12, [%r1 + %r1] 0x67
	.word 0xd8f1c983  ! 395: STXA_R	stxa	%r12, [%r7 + %r3] 0x4c
	.word 0xd6f00ce2  ! 397: STXA_R	stxa	%r11, [%r0 + %r2] 0x67
	.word 0xeca11005  ! 398: STWA_R	stwa	%r22, [%r4 + %r5] 0x80
	.word 0xf1212830  ! 399: STF_I	st	%f24, [0x0830, %r4]
	.word 0xe0210005  ! 400: STW_R	stw	%r16, [%r4 + %r5]
	.word 0xd6f0cce6  ! 402: STXA_R	stxa	%r11, [%r3 + %r6] 0x67
	.word 0xe6710005  ! 403: STX_R	stx	%r19, [%r4 + %r5]
	.word 0xe6310005  ! 404: STH_R	sth	%r19, [%r4 + %r5]
	.word 0xed210005  ! 405: STF_R	st	%f22, [%r5, %r4]
	.word 0xdcf12c08  ! 406: STXA_I	stxa	%r14, [%r4 + 0x0c08] %asi
	.word 0xe8f91005  ! 407: SWAPA_R	swapa	%r20, [%r4 + %r5] 0x80
	.word 0xdc7129d0  ! 408: STX_I	stx	%r14, [%r4 + 0x09d0]
	.word 0xf8210005  ! 409: STW_R	stw	%r28, [%r4 + %r5]
	.word 0xf4b91005  ! 410: STDA_R	stda	%r26, [%r4 + %r5] 0x80
	.word 0xfd392750  ! 411: STDF_I	std	%f30, [0x0750, %r4]
	.word 0xd6f0cce2  ! 413: STXA_R	stxa	%r11, [%r3 + %r2] 0x67
	.word 0xd6f04ce9  ! 415: STXA_R	stxa	%r11, [%r1 + %r9] 0x67
	.word 0xd6f08ce1  ! 417: STXA_R	stxa	%r11, [%r2 + %r1] 0x67
	.word 0xeaa929d5  ! 418: STBA_I	stba	%r21, [%r4 + 0x09d5] %asi
	.word 0xe4b925a0  ! 419: STDA_I	stda	%r18, [%r4 + 0x05a0] %asi
	.word 0xeb212b40  ! 420: STF_I	st	%f21, [0x0b40, %r4]
	.word 0xe0a91005  ! 421: STBA_R	stba	%r16, [%r4 + %r5] 0x80
	.word 0xd6f04ce6  ! 423: STXA_R	stxa	%r11, [%r1 + %r6] 0x67
	.word 0xea310005  ! 424: STH_R	sth	%r21, [%r4 + %r5]
	.word 0xf2210005  ! 425: STW_R	stw	%r25, [%r4 + %r5]
	.word 0xf0712e90  ! 426: STX_I	stx	%r24, [%r4 + 0x0e90]
	.word 0xe0710005  ! 427: STX_R	stx	%r16, [%r4 + %r5]
	.word 0xe8312c80  ! 428: STH_I	sth	%r20, [%r4 + 0x0c80]
	.word 0xf4f92410  ! 429: SWAPA_I	swapa	%r26, [%r4 + 0x0410] %asi
	.word 0xe5210005  ! 430: STF_R	st	%f18, [%r5, %r4]
	.word 0xdc312876  ! 431: STH_I	sth	%r14, [%r4 + 0x0876]
	.word 0xd6f0c989  ! 433: STXA_R	stxa	%r11, [%r3 + %r9] 0x4c
	.word 0xe8290005  ! 434: STB_R	stb	%r20, [%r4 + %r5]
	.word 0xe93921b8  ! 435: STDF_I	std	%f20, [0x01b8, %r4]
	.word 0xe0f12e28  ! 436: STXA_I	stxa	%r16, [%r4 + 0x0e28] %asi
	.word 0xe2e91005  ! 437: LDSTUBA_R	ldstuba	%r17, [%r4 + %r5] 0x80
	.word 0xf0312850  ! 438: STH_I	sth	%r24, [%r4 + 0x0850]
	.word 0xefe11005  ! 439: CASA_I	casa	[%r4] 0x80, %r5, %r23
	.word 0xdfe12005  ! 440: CASA_R	casa	[%r4] %asi, %r5, %r15
	.word 0xf6312e3c  ! 441: STH_I	sth	%r27, [%r4 + 0x0e3c]
	.word 0xd6f20ce1  ! 443: STXA_R	stxa	%r11, [%r8 + %r1] 0x67
	.word 0xe7f11005  ! 444: CASXA_I	casxa	[%r4] 0x80, %r5, %r19
	.word 0xd6f18980  ! 446: STXA_R	stxa	%r11, [%r6 + %r0] 0x4c
	.word 0xec712580  ! 447: STX_I	stx	%r22, [%r4 + 0x0580]
	.word 0xe9212c5c  ! 448: STF_I	st	%f20, [0x0c5c, %r4]
	.word 0xe3210005  ! 449: STF_R	st	%f17, [%r5, %r4]
	.word 0xe1392248  ! 450: STDF_I	std	%f16, [0x0248, %r4]
	.word 0xd6f0cce8  ! 452: STXA_R	stxa	%r11, [%r3 + %r8] 0x67
	.word 0xf4b120ec  ! 453: STHA_I	stha	%r26, [%r4 + 0x00ec] %asi
	.word 0xea210005  ! 454: STW_R	stw	%r21, [%r4 + %r5]
	.word 0xf0e91005  ! 455: LDSTUBA_R	ldstuba	%r24, [%r4 + %r5] 0x80
	.word 0xf0e92079  ! 456: LDSTUBA_I	ldstuba	%r24, [%r4 + 0x0079] %asi
	.word 0xd8f08982  ! 458: STXA_R	stxa	%r12, [%r2 + %r2] 0x4c
	.word 0xf2f91005  ! 459: SWAPA_R	swapa	%r25, [%r4 + %r5] 0x80
	.word 0xd8f04ce3  ! 461: STXA_R	stxa	%r12, [%r1 + %r3] 0x67
	.word 0xfde11005  ! 462: CASA_I	casa	[%r4] 0x80, %r5, %r30
	.word 0xeef91005  ! 463: SWAPA_R	swapa	%r23, [%r4 + %r5] 0x80
	.word 0xe0790005  ! 464: SWAP_R	swap	%r16, [%r4 + %r5]
	.word 0xeca9263a  ! 465: STBA_I	stba	%r22, [%r4 + 0x063a] %asi
	.word 0xdb392df0  ! 466: STDF_I	std	%f13, [0x0df0, %r4]
	.word 0xdea1259c  ! 467: STWA_I	stwa	%r15, [%r4 + 0x059c] %asi
	.word 0xe0b92d30  ! 468: STDA_I	stda	%r16, [%r4 + 0x0d30] %asi
	.word 0xeee91005  ! 469: LDSTUBA_R	ldstuba	%r23, [%r4 + %r5] 0x80
	.word 0xe8290005  ! 470: STB_R	stb	%r20, [%r4 + %r5]
	.word 0xe4710005  ! 471: STX_R	stx	%r18, [%r4 + %r5]
	.word 0xe1212cd8  ! 472: STF_I	st	%f16, [0x0cd8, %r4]
	.word 0xef3926e0  ! 473: STDF_I	std	%f23, [0x06e0, %r4]
	.word 0xeef11005  ! 474: STXA_R	stxa	%r23, [%r4 + %r5] 0x80
	.word 0xfcb91005  ! 475: STDA_R	stda	%r30, [%r4 + %r5] 0x80
	.word 0xd6f1c981  ! 477: STXA_R	stxa	%r11, [%r7 + %r1] 0x4c
	.word 0xf5390005  ! 478: STDF_R	std	%f26, [%r5, %r4]
	.word 0xe5392cb0  ! 479: STDF_I	std	%f18, [0x0cb0, %r4]
	.word 0xde212990  ! 480: STW_I	stw	%r15, [%r4 + 0x0990]
	.word 0xdeb12c36  ! 481: STHA_I	stha	%r15, [%r4 + 0x0c36] %asi
	.word 0xf6e92e3f  ! 482: LDSTUBA_I	ldstuba	%r27, [%r4 + 0x0e3f] %asi
	.word 0xd6f08ce3  ! 484: STXA_R	stxa	%r11, [%r2 + %r3] 0x67
	.word 0xe0b91005  ! 485: STDA_R	stda	%r16, [%r4 + %r5] 0x80
	.word 0xdd392ed0  ! 486: STDF_I	std	%f14, [0x0ed0, %r4]
	.word 0xe7e11005  ! 487: CASA_I	casa	[%r4] 0x80, %r5, %r19
	.word 0xd6f18961  ! 489: STXA_R	stxa	%r11, [%r6 + %r1] 0x4b
	.word 0xeb212220  ! 490: STF_I	st	%f21, [0x0220, %r4]
	.word 0xeaf12d18  ! 491: STXA_I	stxa	%r21, [%r4 + 0x0d18] %asi
	.word 0xd6f1c961  ! 493: STXA_R	stxa	%r11, [%r7 + %r1] 0x4b
	.word 0xe3392f40  ! 494: STDF_I	std	%f17, [0x0f40, %r4]
	.word 0xe3210005  ! 495: STF_R	st	%f17, [%r5, %r4]
	.word 0xd6f18ce3  ! 497: STXA_R	stxa	%r11, [%r6 + %r3] 0x67
	.word 0xf0b92948  ! 498: STDA_I	stda	%r24, [%r4 + 0x0948] %asi
	.word 0xeaf11005  ! 499: STXA_R	stxa	%r21, [%r4 + %r5] 0x80
        ta      T_GOOD_TRAP

th_main_1:
	setx  0x39cb16040db5a640, %r1, %r1
	setx  0x07fb7ee30143ab80, %r1, %r2
	setx  0x2119f99507030f98, %r1, %r3
	setx  0x8749704c08470518, %r1, %r6
	setx  0xb314fc01035c1eb0, %r1, %r7
	setx  0xf8a29d60059eafb0, %r1, %r8
	setx  0xc2c5e61a03408278, %r1, %r9
	setx  0xa785a770080ff838, %r1, %r11
	setx  0xd9b97580006fe584, %r1, %r12
	setx  0x30550e92f6f16b2e, %r1, %r13
	setx  0x26925e82ae690835, %r1, %r14
	setx  0x5e92e2113547a1ff, %r1, %r15
	setx  0xcac083b2f33acd67, %r1, %r16
	setx  0xafee8a9ac0b93a27, %r1, %r17
	setx  0x7c400b732a3785d5, %r1, %r18
	setx  0x94ccb73c36eab255, %r1, %r19
	setx  0xb120ea7ff361d683, %r1, %r20
	setx  0x599a7002b237d64d, %r1, %r21
	setx  0x5fcce7d666d1d332, %r1, %r22
	setx  0x491b47e077ef96ac, %r1, %r23
	setx  0x1b43068ad3cf85d2, %r1, %r24
	setx  0xa9739c0d15857930, %r1, %r25
	setx  0x2011be1a80bedf75, %r1, %r26
	setx  0x3ea73a058b0db4f9, %r1, %r27
	setx  0x78be25c5662e82df, %r1, %r28
	setx  0x9ad42c678ca903f8, %r1, %r29
	setx  0xe1da4982a2b551cf, %r1, %r30
	setx  0x9e0d7e63d7007fe4, %r1, %r31
	setx  MAIN_BASE_DATA_VA, %r1, %r4
	setx  0x0000000000000da0, %r1, %r5
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
	.word 0xf0210005  ! 6: STW_R	stw	%r24, [%r4 + %r5]
	.word 0xde290005  ! 7: STB_R	stb	%r15, [%r4 + %r5]
	.word 0xf0f11005  ! 8: STXA_R	stxa	%r24, [%r4 + %r5] 0x80
	.word 0xd6f24960  ! 10: STXA_R	stxa	%r11, [%r9 + %r0] 0x4b
	.word 0xe7212f34  ! 11: STF_I	st	%f19, [0x0f34, %r4]
	.word 0xeff12005  ! 12: CASXA_R	casxa	[%r4]%asi, %r5, %r23
	.word 0xeae92461  ! 13: LDSTUBA_I	ldstuba	%r21, [%r4 + 0x0461] %asi
	.word 0xecb92938  ! 14: STDA_I	stda	%r22, [%r4 + 0x0938] %asi
	.word 0xf5210005  ! 15: STF_R	st	%f26, [%r5, %r4]
	.word 0xf0b91005  ! 16: STDA_R	stda	%r24, [%r4 + %r5] 0x80
	.word 0xfb392e08  ! 17: STDF_I	std	%f29, [0x0e08, %r4]
	.word 0xec710005  ! 18: STX_R	stx	%r22, [%r4 + %r5]
	.word 0xdb210005  ! 19: STF_R	st	%f13, [%r5, %r4]
	.word 0xe1f12005  ! 20: CASXA_R	casxa	[%r4]%asi, %r5, %r16
	.word 0xfd390005  ! 21: STDF_R	std	%f30, [%r5, %r4]
	.word 0xd8f24ce2  ! 23: STXA_R	stxa	%r12, [%r9 + %r2] 0x67
	.word 0xdca120d4  ! 24: STWA_I	stwa	%r14, [%r4 + 0x00d4] %asi
	.word 0xf6e925ba  ! 25: LDSTUBA_I	ldstuba	%r27, [%r4 + 0x05ba] %asi
	.word 0xf72126f4  ! 26: STF_I	st	%f27, [0x06f4, %r4]
	.word 0xdcf12f10  ! 27: STXA_I	stxa	%r14, [%r4 + 0x0f10] %asi
	.word 0xd8f0cce8  ! 29: STXA_R	stxa	%r12, [%r3 + %r8] 0x67
	.word 0xd6f00ce8  ! 31: STXA_R	stxa	%r11, [%r0 + %r8] 0x67
	.word 0xd8f04961  ! 33: STXA_R	stxa	%r12, [%r1 + %r1] 0x4b
	.word 0xf2710005  ! 34: STX_R	stx	%r25, [%r4 + %r5]
	.word 0xd6f04ce1  ! 36: STXA_R	stxa	%r11, [%r1 + %r1] 0x67
	.word 0xd6f08ce3  ! 38: STXA_R	stxa	%r11, [%r2 + %r3] 0x67
	.word 0xd6f0cce0  ! 40: STXA_R	stxa	%r11, [%r3 + %r0] 0x67
	.word 0xde712b58  ! 41: STX_I	stx	%r15, [%r4 + 0x0b58]
	.word 0xfc31222e  ! 42: STH_I	sth	%r30, [%r4 + 0x022e]
	.word 0xf1210005  ! 43: STF_R	st	%f24, [%r5, %r4]
	.word 0xd6f20ce1  ! 45: STXA_R	stxa	%r11, [%r8 + %r1] 0x67
	.word 0xd6f0cce2  ! 47: STXA_R	stxa	%r11, [%r3 + %r2] 0x67
	.word 0xf8e91005  ! 48: LDSTUBA_R	ldstuba	%r28, [%r4 + %r5] 0x80
	.word 0xf0a11005  ! 49: STWA_R	stwa	%r24, [%r4 + %r5] 0x80
	.word 0xf6292946  ! 50: STB_I	stb	%r27, [%r4 + 0x0946]
	.word 0xeaa12838  ! 51: STWA_I	stwa	%r21, [%r4 + 0x0838] %asi
	.word 0xd8f08ce3  ! 53: STXA_R	stxa	%r12, [%r2 + %r3] 0x67
	.word 0xe2f120f0  ! 54: STXA_I	stxa	%r17, [%r4 + 0x00f0] %asi
	.word 0xdd3926a8  ! 55: STDF_I	std	%f14, [0x06a8, %r4]
	.word 0xda712978  ! 56: STX_I	stx	%r13, [%r4 + 0x0978]
	.word 0xe4290005  ! 57: STB_R	stb	%r18, [%r4 + %r5]
	.word 0xef392e18  ! 58: STDF_I	std	%f23, [0x0e18, %r4]
	.word 0xf1390005  ! 59: STDF_R	std	%f24, [%r5, %r4]
	.word 0xdef91005  ! 60: SWAPA_R	swapa	%r15, [%r4 + %r5] 0x80
	.word 0xe8f91005  ! 61: SWAPA_R	swapa	%r20, [%r4 + %r5] 0x80
	.word 0xdcb91005  ! 62: STDA_R	stda	%r14, [%r4 + %r5] 0x80
	.word 0xeb210005  ! 63: STF_R	st	%f21, [%r5, %r4]
	.word 0xdd390005  ! 64: STDF_R	std	%f14, [%r5, %r4]
	.word 0xff390005  ! 65: STDF_R	std	%f31, [%r5, %r4]
	.word 0xea710005  ! 66: STX_R	stx	%r21, [%r4 + %r5]
	.word 0xffe12005  ! 67: CASA_R	casa	[%r4] %asi, %r5, %r31
	.word 0xef392338  ! 68: STDF_I	std	%f23, [0x0338, %r4]
	.word 0xda21264c  ! 69: STW_I	stw	%r13, [%r4 + 0x064c]
	.word 0xe8b92ee0  ! 70: STDA_I	stda	%r20, [%r4 + 0x0ee0] %asi
	.word 0xfc210005  ! 71: STW_R	stw	%r30, [%r4 + %r5]
	.word 0xdce91005  ! 72: LDSTUBA_R	ldstuba	%r14, [%r4 + %r5] 0x80
	.word 0xf2b12d72  ! 73: STHA_I	stha	%r25, [%r4 + 0x0d72] %asi
	.word 0xf8292def  ! 74: STB_I	stb	%r28, [%r4 + 0x0def]
	.word 0xdf390005  ! 75: STDF_R	std	%f15, [%r5, %r4]
	.word 0xdca11005  ! 76: STWA_R	stwa	%r14, [%r4 + %r5] 0x80
	.word 0xe3e12005  ! 77: CASA_R	casa	[%r4] %asi, %r5, %r17
	.word 0xf0b11005  ! 78: STHA_R	stha	%r24, [%r4 + %r5] 0x80
	.word 0xde790005  ! 79: SWAP_R	swap	%r15, [%r4 + %r5]
	.word 0xf8b11005  ! 80: STHA_R	stha	%r28, [%r4 + %r5] 0x80
	.word 0xe6290005  ! 81: STB_R	stb	%r19, [%r4 + %r5]
	.word 0xd6f1c962  ! 83: STXA_R	stxa	%r11, [%r7 + %r2] 0x4b
	.word 0xeff11005  ! 84: CASXA_I	casxa	[%r4] 0x80, %r5, %r23
	.word 0xf1390005  ! 85: STDF_R	std	%f24, [%r5, %r4]
	.word 0xd6f00981  ! 87: STXA_R	stxa	%r11, [%r0 + %r1] 0x4c
	.word 0xe73920e0  ! 88: STDF_I	std	%f19, [0x00e0, %r4]
	.word 0xe229233d  ! 89: STB_I	stb	%r17, [%r4 + 0x033d]
	.word 0xd6f00ce1  ! 91: STXA_R	stxa	%r11, [%r0 + %r1] 0x67
	.word 0xd6f18962  ! 93: STXA_R	stxa	%r11, [%r6 + %r2] 0x4b
	.word 0xfdf12005  ! 94: CASXA_R	casxa	[%r4]%asi, %r5, %r30
	.word 0xea3121a6  ! 95: STH_I	sth	%r21, [%r4 + 0x01a6]
	.word 0xd6f0cce1  ! 97: STXA_R	stxa	%r11, [%r3 + %r1] 0x67
	.word 0xf8f12320  ! 98: STXA_I	stxa	%r28, [%r4 + 0x0320] %asi
	.word 0xe6f91005  ! 99: SWAPA_R	swapa	%r19, [%r4 + %r5] 0x80
	.word 0xec310005  ! 100: STH_R	sth	%r22, [%r4 + %r5]
	.word 0xee712798  ! 101: STX_I	stx	%r23, [%r4 + 0x0798]
	.word 0xdb210005  ! 102: STF_R	st	%f13, [%r5, %r4]
	.word 0xd6f00ce6  ! 104: STXA_R	stxa	%r11, [%r0 + %r6] 0x67
	.word 0xf2b11005  ! 105: STHA_R	stha	%r25, [%r4 + %r5] 0x80
	.word 0xe72129d8  ! 106: STF_I	st	%f19, [0x09d8, %r4]
	.word 0xd6f20962  ! 108: STXA_R	stxa	%r11, [%r8 + %r2] 0x4b
	.word 0xd6f24ce1  ! 110: STXA_R	stxa	%r11, [%r9 + %r1] 0x67
	.word 0xe7392e58  ! 111: STDF_I	std	%f19, [0x0e58, %r4]
	.word 0xee310005  ! 112: STH_R	sth	%r23, [%r4 + %r5]
	.word 0xe1210005  ! 113: STF_R	st	%f16, [%r5, %r4]
	.word 0xe0210005  ! 114: STW_R	stw	%r16, [%r4 + %r5]
	.word 0xfcb92908  ! 115: STDA_I	stda	%r30, [%r4 + 0x0908] %asi
	.word 0xe2290005  ! 116: STB_R	stb	%r17, [%r4 + %r5]
	.word 0xe52124a0  ! 117: STF_I	st	%f18, [0x04a0, %r4]
	.word 0xd6f08980  ! 119: STXA_R	stxa	%r11, [%r2 + %r0] 0x4c
	.word 0xe3212b10  ! 120: STF_I	st	%f17, [0x0b10, %r4]
	.word 0xd8f24ce2  ! 122: STXA_R	stxa	%r12, [%r9 + %r2] 0x67
	.word 0xd8f08ce1  ! 124: STXA_R	stxa	%r12, [%r2 + %r1] 0x67
	.word 0xfe212930  ! 125: STW_I	stw	%r31, [%r4 + 0x0930]
	.word 0xfcb920f8  ! 126: STDA_I	stda	%r30, [%r4 + 0x00f8] %asi
	.word 0xd6f04ce0  ! 128: STXA_R	stxa	%r11, [%r1 + %r0] 0x67
	.word 0xeab11005  ! 129: STHA_R	stha	%r21, [%r4 + %r5] 0x80
	.word 0xff390005  ! 130: STDF_R	std	%f31, [%r5, %r4]
	.word 0xf8b12818  ! 131: STHA_I	stha	%r28, [%r4 + 0x0818] %asi
	.word 0xdcb92f90  ! 132: STDA_I	stda	%r14, [%r4 + 0x0f90] %asi
	.word 0xe8b12856  ! 133: STHA_I	stha	%r20, [%r4 + 0x0856] %asi
	.word 0xf7392b28  ! 134: STDF_I	std	%f27, [0x0b28, %r4]
	.word 0xdea129cc  ! 135: STWA_I	stwa	%r15, [%r4 + 0x09cc] %asi
	.word 0xe0e92033  ! 136: LDSTUBA_I	ldstuba	%r16, [%r4 + 0x0033] %asi
	.word 0xfff12005  ! 137: CASXA_R	casxa	[%r4]%asi, %r5, %r31
	.word 0xf6792b3c  ! 138: SWAP_I	swap	%r27, [%r4 + 0x0b3c]
	.word 0xeef12538  ! 139: STXA_I	stxa	%r23, [%r4 + 0x0538] %asi
	.word 0xe8792f6c  ! 140: SWAP_I	swap	%r20, [%r4 + 0x0f6c]
	.word 0xf4290005  ! 141: STB_R	stb	%r26, [%r4 + %r5]
	.word 0xf5212bbc  ! 142: STF_I	st	%f26, [0x0bbc, %r4]
	.word 0xf5e11005  ! 143: CASA_I	casa	[%r4] 0x80, %r5, %r26
	.word 0xf1f12005  ! 144: CASXA_R	casxa	[%r4]%asi, %r5, %r24
	.word 0xd6f18962  ! 146: STXA_R	stxa	%r11, [%r6 + %r2] 0x4b
	.word 0xf2210005  ! 147: STW_R	stw	%r25, [%r4 + %r5]
	.word 0xecb1232a  ! 148: STHA_I	stha	%r22, [%r4 + 0x032a] %asi
	.word 0xd6f08968  ! 150: STXA_R	stxa	%r11, [%r2 + %r8] 0x4b
	.word 0xf07126b8  ! 151: STX_I	stx	%r24, [%r4 + 0x06b8]
	.word 0xf0290005  ! 152: STB_R	stb	%r24, [%r4 + %r5]
	.word 0xd6f08981  ! 154: STXA_R	stxa	%r11, [%r2 + %r1] 0x4c
	.word 0xf8e91005  ! 155: LDSTUBA_R	ldstuba	%r28, [%r4 + %r5] 0x80
	.word 0xd6f00ce9  ! 157: STXA_R	stxa	%r11, [%r0 + %r9] 0x67
	.word 0xef392cc8  ! 158: STDF_I	std	%f23, [0x0cc8, %r4]
	.word 0xf0b11005  ! 159: STHA_R	stha	%r24, [%r4 + %r5] 0x80
	.word 0xe2f91005  ! 160: SWAPA_R	swapa	%r17, [%r4 + %r5] 0x80
	.word 0xe4a127d4  ! 161: STWA_I	stwa	%r18, [%r4 + 0x07d4] %asi
	.word 0xe9212d04  ! 162: STF_I	st	%f20, [0x0d04, %r4]
	.word 0xe53923c0  ! 163: STDF_I	std	%f18, [0x03c0, %r4]
	.word 0xdcb91005  ! 164: STDA_R	stda	%r14, [%r4 + %r5] 0x80
	.word 0xe8790005  ! 165: SWAP_R	swap	%r20, [%r4 + %r5]
	.word 0xd6f0c982  ! 167: STXA_R	stxa	%r11, [%r3 + %r2] 0x4c
	.word 0xe4a11005  ! 168: STWA_R	stwa	%r18, [%r4 + %r5] 0x80
	.word 0xf8710005  ! 169: STX_R	stx	%r28, [%r4 + %r5]
	.word 0xe6f91005  ! 170: SWAPA_R	swapa	%r19, [%r4 + %r5] 0x80
	.word 0xff21270c  ! 171: STF_I	st	%f31, [0x070c, %r4]
	.word 0xfe7122c0  ! 172: STX_I	stx	%r31, [%r4 + 0x02c0]
	.word 0xed212a24  ! 173: STF_I	st	%f22, [0x0a24, %r4]
	.word 0xd6f20ce8  ! 175: STXA_R	stxa	%r11, [%r8 + %r8] 0x67
	.word 0xfb210005  ! 176: STF_R	st	%f29, [%r5, %r4]
	.word 0xf6b12d4e  ! 177: STHA_I	stha	%r27, [%r4 + 0x0d4e] %asi
	.word 0xfaa92752  ! 178: STBA_I	stba	%r29, [%r4 + 0x0752] %asi
	.word 0xe4290005  ! 179: STB_R	stb	%r18, [%r4 + %r5]
	.word 0xecb91005  ! 180: STDA_R	stda	%r22, [%r4 + %r5] 0x80
	.word 0xe0290005  ! 181: STB_R	stb	%r16, [%r4 + %r5]
	.word 0xd6f08962  ! 183: STXA_R	stxa	%r11, [%r2 + %r2] 0x4b
	.word 0xfd212440  ! 184: STF_I	st	%f30, [0x0440, %r4]
	.word 0xddf12005  ! 185: CASXA_R	casxa	[%r4]%asi, %r5, %r14
	.word 0xfb390005  ! 186: STDF_R	std	%f29, [%r5, %r4]
	.word 0xe2a91005  ! 187: STBA_R	stba	%r17, [%r4 + %r5] 0x80
	.word 0xf0210005  ! 188: STW_R	stw	%r24, [%r4 + %r5]
	.word 0xf7390005  ! 189: STDF_R	std	%f27, [%r5, %r4]
	.word 0xe2312530  ! 190: STH_I	sth	%r17, [%r4 + 0x0530]
	.word 0xf0210005  ! 191: STW_R	stw	%r24, [%r4 + %r5]
	.word 0xd8f20ce2  ! 193: STXA_R	stxa	%r12, [%r8 + %r2] 0x67
	.word 0xe8b1213e  ! 194: STHA_I	stha	%r20, [%r4 + 0x013e] %asi
	.word 0xdce91005  ! 195: LDSTUBA_R	ldstuba	%r14, [%r4 + %r5] 0x80
	.word 0xfe712698  ! 196: STX_I	stx	%r31, [%r4 + 0x0698]
	.word 0xd6f0c980  ! 198: STXA_R	stxa	%r11, [%r3 + %r0] 0x4c
	.word 0xfc31242a  ! 199: STH_I	sth	%r30, [%r4 + 0x042a]
	.word 0xeca11005  ! 200: STWA_R	stwa	%r22, [%r4 + %r5] 0x80
	.word 0xef210005  ! 201: STF_R	st	%f23, [%r5, %r4]
	.word 0xe621262c  ! 202: STW_I	stw	%r19, [%r4 + 0x062c]
	.word 0xd6f1cce3  ! 204: STXA_R	stxa	%r11, [%r7 + %r3] 0x67
	.word 0xd6f20ce1  ! 206: STXA_R	stxa	%r11, [%r8 + %r1] 0x67
	.word 0xf3212540  ! 207: STF_I	st	%f25, [0x0540, %r4]
	.word 0xdf390005  ! 208: STDF_R	std	%f15, [%r5, %r4]
	.word 0xd6f20ce1  ! 210: STXA_R	stxa	%r11, [%r8 + %r1] 0x67
	.word 0xe52121e4  ! 211: STF_I	st	%f18, [0x01e4, %r4]
	.word 0xe9f12005  ! 212: CASXA_R	casxa	[%r4]%asi, %r5, %r20
	.word 0xf6312164  ! 213: STH_I	sth	%r27, [%r4 + 0x0164]
	.word 0xe6710005  ! 214: STX_R	stx	%r19, [%r4 + %r5]
	.word 0xdef12038  ! 215: STXA_I	stxa	%r15, [%r4 + 0x0038] %asi
	.word 0xd8f04ce1  ! 217: STXA_R	stxa	%r12, [%r1 + %r1] 0x67
	.word 0xf02123b8  ! 218: STW_I	stw	%r24, [%r4 + 0x03b8]
	.word 0xe2b11005  ! 219: STHA_R	stha	%r17, [%r4 + %r5] 0x80
	.word 0xf7210005  ! 220: STF_R	st	%f27, [%r5, %r4]
	.word 0xd6f1c962  ! 222: STXA_R	stxa	%r11, [%r7 + %r2] 0x4b
	.word 0xe9210005  ! 223: STF_R	st	%f20, [%r5, %r4]
	.word 0xf1392370  ! 224: STDF_I	std	%f24, [0x0370, %r4]
	.word 0xf42129fc  ! 225: STW_I	stw	%r26, [%r4 + 0x09fc]
	.word 0xe521265c  ! 226: STF_I	st	%f18, [0x065c, %r4]
	.word 0xe8a11005  ! 227: STWA_R	stwa	%r20, [%r4 + %r5] 0x80
	.word 0xdab11005  ! 228: STHA_R	stha	%r13, [%r4 + %r5] 0x80
	.word 0xfee91005  ! 229: LDSTUBA_R	ldstuba	%r31, [%r4 + %r5] 0x80
	.word 0xe0f11005  ! 230: STXA_R	stxa	%r16, [%r4 + %r5] 0x80
	.word 0xd8f08983  ! 232: STXA_R	stxa	%r12, [%r2 + %r3] 0x4c
	.word 0xe5390005  ! 233: STDF_R	std	%f18, [%r5, %r4]
	.word 0xdca91005  ! 234: STBA_R	stba	%r14, [%r4 + %r5] 0x80
	.word 0xfcb92df8  ! 235: STDA_I	stda	%r30, [%r4 + 0x0df8] %asi
	.word 0xfaa11005  ! 236: STWA_R	stwa	%r29, [%r4 + %r5] 0x80
	.word 0xfcf12a50  ! 237: STXA_I	stxa	%r30, [%r4 + 0x0a50] %asi
	.word 0xf6290005  ! 238: STB_R	stb	%r27, [%r4 + %r5]
	.word 0xd6f0cce8  ! 240: STXA_R	stxa	%r11, [%r3 + %r8] 0x67
	.word 0xf4790005  ! 241: SWAP_R	swap	%r26, [%r4 + %r5]
	.word 0xf8a11005  ! 242: STWA_R	stwa	%r28, [%r4 + %r5] 0x80
	.word 0xf8712c80  ! 243: STX_I	stx	%r28, [%r4 + 0x0c80]
	.word 0xf22125c0  ! 244: STW_I	stw	%r25, [%r4 + 0x05c0]
	.word 0xe4f9200c  ! 245: SWAPA_I	swapa	%r18, [%r4 + 0x000c] %asi
	.word 0xfe790005  ! 246: SWAP_R	swap	%r31, [%r4 + %r5]
	.word 0xd8f04980  ! 248: STXA_R	stxa	%r12, [%r1 + %r0] 0x4c
	.word 0xfdf11005  ! 249: CASXA_I	casxa	[%r4] 0x80, %r5, %r30
	.word 0xfd390005  ! 250: STDF_R	std	%f30, [%r5, %r4]
	.word 0xe0b11005  ! 251: STHA_R	stha	%r16, [%r4 + %r5] 0x80
	.word 0xe4a91005  ! 252: STBA_R	stba	%r18, [%r4 + %r5] 0x80
	.word 0xe3390005  ! 253: STDF_R	std	%f17, [%r5, %r4]
	.word 0xfaa11005  ! 254: STWA_R	stwa	%r29, [%r4 + %r5] 0x80
	.word 0xf3392108  ! 255: STDF_I	std	%f25, [0x0108, %r4]
	.word 0xece921ca  ! 256: LDSTUBA_I	ldstuba	%r22, [%r4 + 0x01ca] %asi
	.word 0xd8f0cce2  ! 258: STXA_R	stxa	%r12, [%r3 + %r2] 0x67
	.word 0xd6f0cce3  ! 260: STXA_R	stxa	%r11, [%r3 + %r3] 0x67
	.word 0xf9e12005  ! 261: CASA_R	casa	[%r4] %asi, %r5, %r28
	.word 0xe8712ce0  ! 262: STX_I	stx	%r20, [%r4 + 0x0ce0]
	.word 0xe8b92b40  ! 263: STDA_I	stda	%r20, [%r4 + 0x0b40] %asi
	.word 0xe9390005  ! 264: STDF_R	std	%f20, [%r5, %r4]
	.word 0xe6a12c48  ! 265: STWA_I	stwa	%r19, [%r4 + 0x0c48] %asi
	.word 0xf6f11005  ! 266: STXA_R	stxa	%r27, [%r4 + %r5] 0x80
	.word 0xf3f12005  ! 267: CASXA_R	casxa	[%r4]%asi, %r5, %r25
	.word 0xe7210005  ! 268: STF_R	st	%f19, [%r5, %r4]
	.word 0xecb125e6  ! 269: STHA_I	stha	%r22, [%r4 + 0x05e6] %asi
	.word 0xd6f24ce2  ! 271: STXA_R	stxa	%r11, [%r9 + %r2] 0x67
	.word 0xe2790005  ! 272: SWAP_R	swap	%r17, [%r4 + %r5]
	.word 0xd6f0c961  ! 274: STXA_R	stxa	%r11, [%r3 + %r1] 0x4b
	.word 0xeb210005  ! 275: STF_R	st	%f21, [%r5, %r4]
	.word 0xd8f1c968  ! 277: STXA_R	stxa	%r12, [%r7 + %r8] 0x4b
	.word 0xd6f00ce1  ! 279: STXA_R	stxa	%r11, [%r0 + %r1] 0x67
	.word 0xef210005  ! 280: STF_R	st	%f23, [%r5, %r4]
	.word 0xdff11005  ! 281: CASXA_I	casxa	[%r4] 0x80, %r5, %r15
	.word 0xee292f80  ! 282: STB_I	stb	%r23, [%r4 + 0x0f80]
	.word 0xe0e92183  ! 283: LDSTUBA_I	ldstuba	%r16, [%r4 + 0x0183] %asi
	.word 0xd6f18966  ! 285: STXA_R	stxa	%r11, [%r6 + %r6] 0x4b
	.word 0xf2e91005  ! 286: LDSTUBA_R	ldstuba	%r25, [%r4 + %r5] 0x80
	.word 0xd8f04981  ! 288: STXA_R	stxa	%r12, [%r1 + %r1] 0x4c
	.word 0xe5212ab8  ! 289: STF_I	st	%f18, [0x0ab8, %r4]
	.word 0xf1212a04  ! 290: STF_I	st	%f24, [0x0a04, %r4]
	.word 0xffe12005  ! 291: CASA_R	casa	[%r4] %asi, %r5, %r31
	.word 0xee212080  ! 292: STW_I	stw	%r23, [%r4 + 0x0080]
	.word 0xe4790005  ! 293: SWAP_R	swap	%r18, [%r4 + %r5]
	.word 0xf3390005  ! 294: STDF_R	std	%f25, [%r5, %r4]
	.word 0xdd3925c8  ! 295: STDF_I	std	%f14, [0x05c8, %r4]
	.word 0xd6f08989  ! 297: STXA_R	stxa	%r11, [%r2 + %r9] 0x4c
	.word 0xf3210005  ! 298: STF_R	st	%f25, [%r5, %r4]
	.word 0xece91005  ! 299: LDSTUBA_R	ldstuba	%r22, [%r4 + %r5] 0x80
	.word 0xef210005  ! 300: STF_R	st	%f23, [%r5, %r4]
	.word 0xd6f18980  ! 302: STXA_R	stxa	%r11, [%r6 + %r0] 0x4c
	.word 0xe0b11005  ! 303: STHA_R	stha	%r16, [%r4 + %r5] 0x80
	.word 0xf5390005  ! 304: STDF_R	std	%f26, [%r5, %r4]
	.word 0xe6e91005  ! 305: LDSTUBA_R	ldstuba	%r19, [%r4 + %r5] 0x80
	.word 0xf6a91005  ! 306: STBA_R	stba	%r27, [%r4 + %r5] 0x80
	.word 0xdd392e70  ! 307: STDF_I	std	%f14, [0x0e70, %r4]
	.word 0xd8f18ce0  ! 309: STXA_R	stxa	%r12, [%r6 + %r0] 0x67
	.word 0xfc2126c0  ! 310: STW_I	stw	%r30, [%r4 + 0x06c0]
	.word 0xda212cf0  ! 311: STW_I	stw	%r13, [%r4 + 0x0cf0]
	.word 0xef210005  ! 312: STF_R	st	%f23, [%r5, %r4]
	.word 0xdf212090  ! 313: STF_I	st	%f15, [0x0090, %r4]
	.word 0xfcf91005  ! 314: SWAPA_R	swapa	%r30, [%r4 + %r5] 0x80
	.word 0xdef12d60  ! 315: STXA_I	stxa	%r15, [%r4 + 0x0d60] %asi
	.word 0xfd210005  ! 316: STF_R	st	%f30, [%r5, %r4]
	.word 0xf7390005  ! 317: STDF_R	std	%f27, [%r5, %r4]
	.word 0xf5392700  ! 318: STDF_I	std	%f26, [0x0700, %r4]
	.word 0xe1212b00  ! 319: STF_I	st	%f16, [0x0b00, %r4]
	.word 0xfd212714  ! 320: STF_I	st	%f30, [0x0714, %r4]
	.word 0xe4f11005  ! 321: STXA_R	stxa	%r18, [%r4 + %r5] 0x80
	.word 0xf2a11005  ! 322: STWA_R	stwa	%r25, [%r4 + %r5] 0x80
	.word 0xf1f12005  ! 323: CASXA_R	casxa	[%r4]%asi, %r5, %r24
	.word 0xf2e91005  ! 324: LDSTUBA_R	ldstuba	%r25, [%r4 + %r5] 0x80
	.word 0xefe11005  ! 325: CASA_I	casa	[%r4] 0x80, %r5, %r23
	.word 0xece926ca  ! 326: LDSTUBA_I	ldstuba	%r22, [%r4 + 0x06ca] %asi
	.word 0xd6f0c962  ! 328: STXA_R	stxa	%r11, [%r3 + %r2] 0x4b
	.word 0xf8f92838  ! 329: SWAPA_I	swapa	%r28, [%r4 + 0x0838] %asi
	.word 0xf0210005  ! 330: STW_R	stw	%r24, [%r4 + %r5]
	.word 0xedf12005  ! 331: CASXA_R	casxa	[%r4]%asi, %r5, %r22
	.word 0xdaf91005  ! 332: SWAPA_R	swapa	%r13, [%r4 + %r5] 0x80
	.word 0xe6790005  ! 333: SWAP_R	swap	%r19, [%r4 + %r5]
	.word 0xf5e12005  ! 334: CASA_R	casa	[%r4] %asi, %r5, %r26
	.word 0xf1210005  ! 335: STF_R	st	%f24, [%r5, %r4]
	.word 0xdf390005  ! 336: STDF_R	std	%f15, [%r5, %r4]
	.word 0xe5210005  ! 337: STF_R	st	%f18, [%r5, %r4]
	.word 0xe2212398  ! 338: STW_I	stw	%r17, [%r4 + 0x0398]
	.word 0xe7390005  ! 339: STDF_R	std	%f19, [%r5, %r4]
	.word 0xf4210005  ! 340: STW_R	stw	%r26, [%r4 + %r5]
	.word 0xd6f00ce0  ! 342: STXA_R	stxa	%r11, [%r0 + %r0] 0x67
	.word 0xe53926f8  ! 343: STDF_I	std	%f18, [0x06f8, %r4]
	.word 0xeef92604  ! 344: SWAPA_I	swapa	%r23, [%r4 + 0x0604] %asi
	.word 0xe4a11005  ! 345: STWA_R	stwa	%r18, [%r4 + %r5] 0x80
	.word 0xd6f00ce0  ! 347: STXA_R	stxa	%r11, [%r0 + %r0] 0x67
	.word 0xe0f91005  ! 348: SWAPA_R	swapa	%r16, [%r4 + %r5] 0x80
	.word 0xd8f08982  ! 350: STXA_R	stxa	%r12, [%r2 + %r2] 0x4c
	.word 0xf9e12005  ! 351: CASA_R	casa	[%r4] %asi, %r5, %r28
	.word 0xea710005  ! 352: STX_R	stx	%r21, [%r4 + %r5]
	.word 0xf4290005  ! 353: STB_R	stb	%r26, [%r4 + %r5]
	.word 0xfb390005  ! 354: STDF_R	std	%f29, [%r5, %r4]
	.word 0xd8f04ce6  ! 356: STXA_R	stxa	%r12, [%r1 + %r6] 0x67
	.word 0xdcf92bec  ! 357: SWAPA_I	swapa	%r14, [%r4 + 0x0bec] %asi
	.word 0xfcf92c64  ! 358: SWAPA_I	swapa	%r30, [%r4 + 0x0c64] %asi
	.word 0xd8f0cce1  ! 360: STXA_R	stxa	%r12, [%r3 + %r1] 0x67
	.word 0xfcb11005  ! 361: STHA_R	stha	%r30, [%r4 + %r5] 0x80
	.word 0xeeb11005  ! 362: STHA_R	stha	%r23, [%r4 + %r5] 0x80
	.word 0xdc79223c  ! 363: SWAP_I	swap	%r14, [%r4 + 0x023c]
	.word 0xdaf11005  ! 364: STXA_R	stxa	%r13, [%r4 + %r5] 0x80
	.word 0xf7390005  ! 365: STDF_R	std	%f27, [%r5, %r4]
	.word 0xd6f20ce7  ! 367: STXA_R	stxa	%r11, [%r8 + %r7] 0x67
	.word 0xe4710005  ! 368: STX_R	stx	%r18, [%r4 + %r5]
	.word 0xfc710005  ! 369: STX_R	stx	%r30, [%r4 + %r5]
	.word 0xe0712290  ! 370: STX_I	stx	%r16, [%r4 + 0x0290]
	.word 0xee290005  ! 371: STB_R	stb	%r23, [%r4 + %r5]
	.word 0xf4b11005  ! 372: STHA_R	stha	%r26, [%r4 + %r5] 0x80
	.word 0xe5212b20  ! 373: STF_I	st	%f18, [0x0b20, %r4]
	.word 0xd6f08962  ! 375: STXA_R	stxa	%r11, [%r2 + %r2] 0x4b
	.word 0xdaf91005  ! 376: SWAPA_R	swapa	%r13, [%r4 + %r5] 0x80
	.word 0xf0a11005  ! 377: STWA_R	stwa	%r24, [%r4 + %r5] 0x80
	.word 0xe4f11005  ! 378: STXA_R	stxa	%r18, [%r4 + %r5] 0x80
	.word 0xd8f20ce9  ! 380: STXA_R	stxa	%r12, [%r8 + %r9] 0x67
	.word 0xf7210005  ! 381: STF_R	st	%f27, [%r5, %r4]
	.word 0xda212f68  ! 382: STW_I	stw	%r13, [%r4 + 0x0f68]
	.word 0xd6f18ce3  ! 384: STXA_R	stxa	%r11, [%r6 + %r3] 0x67
	.word 0xe0210005  ! 385: STW_R	stw	%r16, [%r4 + %r5]
	.word 0xd8f0cce3  ! 387: STXA_R	stxa	%r12, [%r3 + %r3] 0x67
	.word 0xd6f00ce8  ! 389: STXA_R	stxa	%r11, [%r0 + %r8] 0x67
	.word 0xd8f18ce1  ! 391: STXA_R	stxa	%r12, [%r6 + %r1] 0x67
	.word 0xd8f1c966  ! 393: STXA_R	stxa	%r12, [%r7 + %r6] 0x4b
	.word 0xd6f24ce9  ! 395: STXA_R	stxa	%r11, [%r9 + %r9] 0x67
	.word 0xd6f00ce0  ! 397: STXA_R	stxa	%r11, [%r0 + %r0] 0x67
	.word 0xeca11005  ! 398: STWA_R	stwa	%r22, [%r4 + %r5] 0x80
	.word 0xed21250c  ! 399: STF_I	st	%f22, [0x050c, %r4]
	.word 0xf8210005  ! 400: STW_R	stw	%r28, [%r4 + %r5]
	.word 0xd6f18961  ! 402: STXA_R	stxa	%r11, [%r6 + %r1] 0x4b
	.word 0xf4710005  ! 403: STX_R	stx	%r26, [%r4 + %r5]
	.word 0xfe310005  ! 404: STH_R	sth	%r31, [%r4 + %r5]
	.word 0xdb210005  ! 405: STF_R	st	%f13, [%r5, %r4]
	.word 0xfef120c8  ! 406: STXA_I	stxa	%r31, [%r4 + 0x00c8] %asi
	.word 0xf2f91005  ! 407: SWAPA_R	swapa	%r25, [%r4 + %r5] 0x80
	.word 0xe6712bc0  ! 408: STX_I	stx	%r19, [%r4 + 0x0bc0]
	.word 0xda210005  ! 409: STW_R	stw	%r13, [%r4 + %r5]
	.word 0xf8b91005  ! 410: STDA_R	stda	%r28, [%r4 + %r5] 0x80
	.word 0xfb392950  ! 411: STDF_I	std	%f29, [0x0950, %r4]
	.word 0xd6f0cce1  ! 413: STXA_R	stxa	%r11, [%r3 + %r1] 0x67
	.word 0xd6f08ce8  ! 415: STXA_R	stxa	%r11, [%r2 + %r8] 0x67
	.word 0xd6f1c968  ! 417: STXA_R	stxa	%r11, [%r7 + %r8] 0x4b
	.word 0xf0a92812  ! 418: STBA_I	stba	%r24, [%r4 + 0x0812] %asi
	.word 0xe8b92310  ! 419: STDA_I	stda	%r20, [%r4 + 0x0310] %asi
	.word 0xdb212660  ! 420: STF_I	st	%f13, [0x0660, %r4]
	.word 0xf0a91005  ! 421: STBA_R	stba	%r24, [%r4 + %r5] 0x80
	.word 0xd8f0cce3  ! 423: STXA_R	stxa	%r12, [%r3 + %r3] 0x67
	.word 0xde310005  ! 424: STH_R	sth	%r15, [%r4 + %r5]
	.word 0xfc210005  ! 425: STW_R	stw	%r30, [%r4 + %r5]
	.word 0xf4712c08  ! 426: STX_I	stx	%r26, [%r4 + 0x0c08]
	.word 0xe0710005  ! 427: STX_R	stx	%r16, [%r4 + %r5]
	.word 0xe6312192  ! 428: STH_I	sth	%r19, [%r4 + 0x0192]
	.word 0xf8f92be0  ! 429: SWAPA_I	swapa	%r28, [%r4 + 0x0be0] %asi
	.word 0xef210005  ! 430: STF_R	st	%f23, [%r5, %r4]
	.word 0xfe3128fa  ! 431: STH_I	sth	%r31, [%r4 + 0x08fa]
	.word 0xd6f0cce1  ! 433: STXA_R	stxa	%r11, [%r3 + %r1] 0x67
	.word 0xf4290005  ! 434: STB_R	stb	%r26, [%r4 + %r5]
	.word 0xdf3924b8  ! 435: STDF_I	std	%f15, [0x04b8, %r4]
	.word 0xfcf127b0  ! 436: STXA_I	stxa	%r30, [%r4 + 0x07b0] %asi
	.word 0xf8e91005  ! 437: LDSTUBA_R	ldstuba	%r28, [%r4 + %r5] 0x80
	.word 0xe6312ce8  ! 438: STH_I	sth	%r19, [%r4 + 0x0ce8]
	.word 0xdfe11005  ! 439: CASA_I	casa	[%r4] 0x80, %r5, %r15
	.word 0xf9e12005  ! 440: CASA_R	casa	[%r4] %asi, %r5, %r28
	.word 0xda312262  ! 441: STH_I	sth	%r13, [%r4 + 0x0262]
	.word 0xd8f04ce0  ! 443: STXA_R	stxa	%r12, [%r1 + %r0] 0x67
	.word 0xddf11005  ! 444: CASXA_I	casxa	[%r4] 0x80, %r5, %r14
	.word 0xd6f0cce0  ! 446: STXA_R	stxa	%r11, [%r3 + %r0] 0x67
	.word 0xf07124b8  ! 447: STX_I	stx	%r24, [%r4 + 0x04b8]
	.word 0xe3212438  ! 448: STF_I	st	%f17, [0x0438, %r4]
	.word 0xf7210005  ! 449: STF_R	st	%f27, [%r5, %r4]
	.word 0xf33922f0  ! 450: STDF_I	std	%f25, [0x02f0, %r4]
	.word 0xd6f24981  ! 452: STXA_R	stxa	%r11, [%r9 + %r1] 0x4c
	.word 0xfcb12030  ! 453: STHA_I	stha	%r30, [%r4 + 0x0030] %asi
	.word 0xf8210005  ! 454: STW_R	stw	%r28, [%r4 + %r5]
	.word 0xf6e91005  ! 455: LDSTUBA_R	ldstuba	%r27, [%r4 + %r5] 0x80
	.word 0xf6e92f4c  ! 456: LDSTUBA_I	ldstuba	%r27, [%r4 + 0x0f4c] %asi
	.word 0xd8f0c960  ! 458: STXA_R	stxa	%r12, [%r3 + %r0] 0x4b
	.word 0xecf91005  ! 459: SWAPA_R	swapa	%r22, [%r4 + %r5] 0x80
	.word 0xd6f00ce1  ! 461: STXA_R	stxa	%r11, [%r0 + %r1] 0x67
	.word 0xe5e11005  ! 462: CASA_I	casa	[%r4] 0x80, %r5, %r18
	.word 0xfcf91005  ! 463: SWAPA_R	swapa	%r30, [%r4 + %r5] 0x80
	.word 0xea790005  ! 464: SWAP_R	swap	%r21, [%r4 + %r5]
	.word 0xe6a92aa0  ! 465: STBA_I	stba	%r19, [%r4 + 0x0aa0] %asi
	.word 0xfd392248  ! 466: STDF_I	std	%f30, [0x0248, %r4]
	.word 0xdea12df4  ! 467: STWA_I	stwa	%r15, [%r4 + 0x0df4] %asi
	.word 0xfcb92478  ! 468: STDA_I	stda	%r30, [%r4 + 0x0478] %asi
	.word 0xece91005  ! 469: LDSTUBA_R	ldstuba	%r22, [%r4 + %r5] 0x80
	.word 0xf6290005  ! 470: STB_R	stb	%r27, [%r4 + %r5]
	.word 0xee710005  ! 471: STX_R	stx	%r23, [%r4 + %r5]
	.word 0xf3212dec  ! 472: STF_I	st	%f25, [0x0dec, %r4]
	.word 0xfd392618  ! 473: STDF_I	std	%f30, [0x0618, %r4]
	.word 0xfaf11005  ! 474: STXA_R	stxa	%r29, [%r4 + %r5] 0x80
	.word 0xf0b91005  ! 475: STDA_R	stda	%r24, [%r4 + %r5] 0x80
	.word 0xd6f08983  ! 477: STXA_R	stxa	%r11, [%r2 + %r3] 0x4c
	.word 0xe1390005  ! 478: STDF_R	std	%f16, [%r5, %r4]
	.word 0xf33923d0  ! 479: STDF_I	std	%f25, [0x03d0, %r4]
	.word 0xfa2129b0  ! 480: STW_I	stw	%r29, [%r4 + 0x09b0]
	.word 0xe8b129fc  ! 481: STHA_I	stha	%r20, [%r4 + 0x09fc] %asi
	.word 0xeee924e7  ! 482: LDSTUBA_I	ldstuba	%r23, [%r4 + 0x04e7] %asi
	.word 0xd8f00ce1  ! 484: STXA_R	stxa	%r12, [%r0 + %r1] 0x67
	.word 0xf8b91005  ! 485: STDA_R	stda	%r28, [%r4 + %r5] 0x80
	.word 0xdf392c00  ! 486: STDF_I	std	%f15, [0x0c00, %r4]
	.word 0xdfe11005  ! 487: CASA_I	casa	[%r4] 0x80, %r5, %r15
	.word 0xd6f04962  ! 489: STXA_R	stxa	%r11, [%r1 + %r2] 0x4b
	.word 0xe5212fcc  ! 490: STF_I	st	%f18, [0x0fcc, %r4]
	.word 0xfcf12328  ! 491: STXA_I	stxa	%r30, [%r4 + 0x0328] %asi
	.word 0xd6f04987  ! 493: STXA_R	stxa	%r11, [%r1 + %r7] 0x4c
	.word 0xdf3923d0  ! 494: STDF_I	std	%f15, [0x03d0, %r4]
	.word 0xe9210005  ! 495: STF_R	st	%f20, [%r5, %r4]
	.word 0xd6f0cce1  ! 497: STXA_R	stxa	%r11, [%r3 + %r1] 0x67
	.word 0xf8b92268  ! 498: STDA_I	stda	%r28, [%r4 + 0x0268] %asi
	.word 0xf2f11005  ! 499: STXA_R	stxa	%r25, [%r4 + %r5] 0x80
        ta      T_GOOD_TRAP

th_main_2:
	setx  0x39cb16040db5a640, %r1, %r1
	setx  0x07fb7ee30143ab80, %r1, %r2
	setx  0x2119f99507030f98, %r1, %r3
	setx  0x8749704c08470518, %r1, %r6
	setx  0xb314fc01035c1eb0, %r1, %r7
	setx  0xf8a29d60059eafb0, %r1, %r8
	setx  0xc2c5e61a03408278, %r1, %r9
	setx  0xa785a770080ff838, %r1, %r11
	setx  0xd9b97580006fe584, %r1, %r12
	setx  0x30550e92f6f16b2e, %r1, %r13
	setx  0x26925e82ae690835, %r1, %r14
	setx  0x5e92e2113547a1ff, %r1, %r15
	setx  0xcac083b2f33acd67, %r1, %r16
	setx  0xafee8a9ac0b93a27, %r1, %r17
	setx  0x7c400b732a3785d5, %r1, %r18
	setx  0x94ccb73c36eab255, %r1, %r19
	setx  0xb120ea7ff361d683, %r1, %r20
	setx  0x599a7002b237d64d, %r1, %r21
	setx  0x5fcce7d666d1d332, %r1, %r22
	setx  0x491b47e077ef96ac, %r1, %r23
	setx  0x1b43068ad3cf85d2, %r1, %r24
	setx  0xa9739c0d15857930, %r1, %r25
	setx  0x2011be1a80bedf75, %r1, %r26
	setx  0x3ea73a058b0db4f9, %r1, %r27
	setx  0x78be25c5662e82df, %r1, %r28
	setx  0x9ad42c678ca903f8, %r1, %r29
	setx  0xe1da4982a2b551cf, %r1, %r30
	setx  0x9e0d7e63d7007fe4, %r1, %r31
	setx  MAIN_BASE_DATA_VA, %r1, %r4
	setx  0x0000000000000da0, %r1, %r5
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
	.word 0xf8210005  ! 6: STW_R	stw	%r28, [%r4 + %r5]
	.word 0xec290005  ! 7: STB_R	stb	%r22, [%r4 + %r5]
	.word 0xf2f11005  ! 8: STXA_R	stxa	%r25, [%r4 + %r5] 0x80
	.word 0xd8f04967  ! 10: STXA_R	stxa	%r12, [%r1 + %r7] 0x4b
	.word 0xf12125d8  ! 11: STF_I	st	%f24, [0x05d8, %r4]
	.word 0xdbf12005  ! 12: CASXA_R	casxa	[%r4]%asi, %r5, %r13
	.word 0xf6e9231e  ! 13: LDSTUBA_I	ldstuba	%r27, [%r4 + 0x031e] %asi
	.word 0xecb92398  ! 14: STDA_I	stda	%r22, [%r4 + 0x0398] %asi
	.word 0xe3210005  ! 15: STF_R	st	%f17, [%r5, %r4]
	.word 0xf4b91005  ! 16: STDA_R	stda	%r26, [%r4 + %r5] 0x80
	.word 0xdd392e50  ! 17: STDF_I	std	%f14, [0x0e50, %r4]
	.word 0xec710005  ! 18: STX_R	stx	%r22, [%r4 + %r5]
	.word 0xf5210005  ! 19: STF_R	st	%f26, [%r5, %r4]
	.word 0xe7f12005  ! 20: CASXA_R	casxa	[%r4]%asi, %r5, %r19
	.word 0xdf390005  ! 21: STDF_R	std	%f15, [%r5, %r4]
	.word 0xd6f00961  ! 23: STXA_R	stxa	%r11, [%r0 + %r1] 0x4b
	.word 0xdaa12368  ! 24: STWA_I	stwa	%r13, [%r4 + 0x0368] %asi
	.word 0xe6e92dee  ! 25: LDSTUBA_I	ldstuba	%r19, [%r4 + 0x0dee] %asi
	.word 0xe92121c0  ! 26: STF_I	st	%f20, [0x01c0, %r4]
	.word 0xf2f127c0  ! 27: STXA_I	stxa	%r25, [%r4 + 0x07c0] %asi
	.word 0xd6f18ce2  ! 29: STXA_R	stxa	%r11, [%r6 + %r2] 0x67
	.word 0xd6f0c988  ! 31: STXA_R	stxa	%r11, [%r3 + %r8] 0x4c
	.word 0xd8f00ce8  ! 33: STXA_R	stxa	%r12, [%r0 + %r8] 0x67
	.word 0xda710005  ! 34: STX_R	stx	%r13, [%r4 + %r5]
	.word 0xd6f18ce6  ! 36: STXA_R	stxa	%r11, [%r6 + %r6] 0x67
	.word 0xd6f00962  ! 38: STXA_R	stxa	%r11, [%r0 + %r2] 0x4b
	.word 0xd6f0c982  ! 40: STXA_R	stxa	%r11, [%r3 + %r2] 0x4c
	.word 0xf47120b8  ! 41: STX_I	stx	%r26, [%r4 + 0x00b8]
	.word 0xf031253c  ! 42: STH_I	sth	%r24, [%r4 + 0x053c]
	.word 0xe9210005  ! 43: STF_R	st	%f20, [%r5, %r4]
	.word 0xd6f00961  ! 45: STXA_R	stxa	%r11, [%r0 + %r1] 0x4b
	.word 0xd6f08980  ! 47: STXA_R	stxa	%r11, [%r2 + %r0] 0x4c
	.word 0xf0e91005  ! 48: LDSTUBA_R	ldstuba	%r24, [%r4 + %r5] 0x80
	.word 0xfca11005  ! 49: STWA_R	stwa	%r30, [%r4 + %r5] 0x80
	.word 0xea292774  ! 50: STB_I	stb	%r21, [%r4 + 0x0774]
	.word 0xeca1233c  ! 51: STWA_I	stwa	%r22, [%r4 + 0x033c] %asi
	.word 0xd6f08983  ! 53: STXA_R	stxa	%r11, [%r2 + %r3] 0x4c
	.word 0xdef122b8  ! 54: STXA_I	stxa	%r15, [%r4 + 0x02b8] %asi
	.word 0xf1392368  ! 55: STDF_I	std	%f24, [0x0368, %r4]
	.word 0xfc712940  ! 56: STX_I	stx	%r30, [%r4 + 0x0940]
	.word 0xe4290005  ! 57: STB_R	stb	%r18, [%r4 + %r5]
	.word 0xdf392650  ! 58: STDF_I	std	%f15, [0x0650, %r4]
	.word 0xe3390005  ! 59: STDF_R	std	%f17, [%r5, %r4]
	.word 0xf2f91005  ! 60: SWAPA_R	swapa	%r25, [%r4 + %r5] 0x80
	.word 0xe6f91005  ! 61: SWAPA_R	swapa	%r19, [%r4 + %r5] 0x80
	.word 0xdcb91005  ! 62: STDA_R	stda	%r14, [%r4 + %r5] 0x80
	.word 0xe7210005  ! 63: STF_R	st	%f19, [%r5, %r4]
	.word 0xef390005  ! 64: STDF_R	std	%f23, [%r5, %r4]
	.word 0xff390005  ! 65: STDF_R	std	%f31, [%r5, %r4]
	.word 0xea710005  ! 66: STX_R	stx	%r21, [%r4 + %r5]
	.word 0xebe12005  ! 67: CASA_R	casa	[%r4] %asi, %r5, %r21
	.word 0xff392e60  ! 68: STDF_I	std	%f31, [0x0e60, %r4]
	.word 0xf0212c70  ! 69: STW_I	stw	%r24, [%r4 + 0x0c70]
	.word 0xe8b92b28  ! 70: STDA_I	stda	%r20, [%r4 + 0x0b28] %asi
	.word 0xec210005  ! 71: STW_R	stw	%r22, [%r4 + %r5]
	.word 0xdee91005  ! 72: LDSTUBA_R	ldstuba	%r15, [%r4 + %r5] 0x80
	.word 0xe0b12ad2  ! 73: STHA_I	stha	%r16, [%r4 + 0x0ad2] %asi
	.word 0xfe2920ca  ! 74: STB_I	stb	%r31, [%r4 + 0x00ca]
	.word 0xfb390005  ! 75: STDF_R	std	%f29, [%r5, %r4]
	.word 0xeea11005  ! 76: STWA_R	stwa	%r23, [%r4 + %r5] 0x80
	.word 0xe3e12005  ! 77: CASA_R	casa	[%r4] %asi, %r5, %r17
	.word 0xe4b11005  ! 78: STHA_R	stha	%r18, [%r4 + %r5] 0x80
	.word 0xe0790005  ! 79: SWAP_R	swap	%r16, [%r4 + %r5]
	.word 0xeab11005  ! 80: STHA_R	stha	%r21, [%r4 + %r5] 0x80
	.word 0xdc290005  ! 81: STB_R	stb	%r14, [%r4 + %r5]
	.word 0xd6f0c961  ! 83: STXA_R	stxa	%r11, [%r3 + %r1] 0x4b
	.word 0xdbf11005  ! 84: CASXA_I	casxa	[%r4] 0x80, %r5, %r13
	.word 0xdf390005  ! 85: STDF_R	std	%f15, [%r5, %r4]
	.word 0xd6f04ce0  ! 87: STXA_R	stxa	%r11, [%r1 + %r0] 0x67
	.word 0xed392f88  ! 88: STDF_I	std	%f22, [0x0f88, %r4]
	.word 0xe029214d  ! 89: STB_I	stb	%r16, [%r4 + 0x014d]
	.word 0xd6f04988  ! 91: STXA_R	stxa	%r11, [%r1 + %r8] 0x4c
	.word 0xd8f1cce0  ! 93: STXA_R	stxa	%r12, [%r7 + %r0] 0x67
	.word 0xf9f12005  ! 94: CASXA_R	casxa	[%r4]%asi, %r5, %r28
	.word 0xfe312686  ! 95: STH_I	sth	%r31, [%r4 + 0x0686]
	.word 0xd6f1c962  ! 97: STXA_R	stxa	%r11, [%r7 + %r2] 0x4b
	.word 0xf4f12c20  ! 98: STXA_I	stxa	%r26, [%r4 + 0x0c20] %asi
	.word 0xfef91005  ! 99: SWAPA_R	swapa	%r31, [%r4 + %r5] 0x80
	.word 0xda310005  ! 100: STH_R	sth	%r13, [%r4 + %r5]
	.word 0xec712ad0  ! 101: STX_I	stx	%r22, [%r4 + 0x0ad0]
	.word 0xe3210005  ! 102: STF_R	st	%f17, [%r5, %r4]
	.word 0xd6f20ce2  ! 104: STXA_R	stxa	%r11, [%r8 + %r2] 0x67
	.word 0xfeb11005  ! 105: STHA_R	stha	%r31, [%r4 + %r5] 0x80
	.word 0xed21209c  ! 106: STF_I	st	%f22, [0x009c, %r4]
	.word 0xd8f00961  ! 108: STXA_R	stxa	%r12, [%r0 + %r1] 0x4b
	.word 0xd6f00ce3  ! 110: STXA_R	stxa	%r11, [%r0 + %r3] 0x67
	.word 0xf5392ef0  ! 111: STDF_I	std	%f26, [0x0ef0, %r4]
	.word 0xf8310005  ! 112: STH_R	sth	%r28, [%r4 + %r5]
	.word 0xf7210005  ! 113: STF_R	st	%f27, [%r5, %r4]
	.word 0xe6210005  ! 114: STW_R	stw	%r19, [%r4 + %r5]
	.word 0xe0b929f0  ! 115: STDA_I	stda	%r16, [%r4 + 0x09f0] %asi
	.word 0xea290005  ! 116: STB_R	stb	%r21, [%r4 + %r5]
	.word 0xf12122e8  ! 117: STF_I	st	%f24, [0x02e8, %r4]
	.word 0xd6f00ce0  ! 119: STXA_R	stxa	%r11, [%r0 + %r0] 0x67
	.word 0xfd212924  ! 120: STF_I	st	%f30, [0x0924, %r4]
	.word 0xd6f00ce7  ! 122: STXA_R	stxa	%r11, [%r0 + %r7] 0x67
	.word 0xd6f20980  ! 124: STXA_R	stxa	%r11, [%r8 + %r0] 0x4c
	.word 0xdc212b80  ! 125: STW_I	stw	%r14, [%r4 + 0x0b80]
	.word 0xecb92b38  ! 126: STDA_I	stda	%r22, [%r4 + 0x0b38] %asi
	.word 0xd6f08ce3  ! 128: STXA_R	stxa	%r11, [%r2 + %r3] 0x67
	.word 0xdab11005  ! 129: STHA_R	stha	%r13, [%r4 + %r5] 0x80
	.word 0xf3390005  ! 130: STDF_R	std	%f25, [%r5, %r4]
	.word 0xe0b12512  ! 131: STHA_I	stha	%r16, [%r4 + 0x0512] %asi
	.word 0xfcb92330  ! 132: STDA_I	stda	%r30, [%r4 + 0x0330] %asi
	.word 0xf2b12532  ! 133: STHA_I	stha	%r25, [%r4 + 0x0532] %asi
	.word 0xe53924b8  ! 134: STDF_I	std	%f18, [0x04b8, %r4]
	.word 0xfca12d68  ! 135: STWA_I	stwa	%r30, [%r4 + 0x0d68] %asi
	.word 0xdce92a37  ! 136: LDSTUBA_I	ldstuba	%r14, [%r4 + 0x0a37] %asi
	.word 0xdff12005  ! 137: CASXA_R	casxa	[%r4]%asi, %r5, %r15
	.word 0xe6792ab0  ! 138: SWAP_I	swap	%r19, [%r4 + 0x0ab0]
	.word 0xe6f12fa0  ! 139: STXA_I	stxa	%r19, [%r4 + 0x0fa0] %asi
	.word 0xe479217c  ! 140: SWAP_I	swap	%r18, [%r4 + 0x017c]
	.word 0xf6290005  ! 141: STB_R	stb	%r27, [%r4 + %r5]
	.word 0xeb212ca8  ! 142: STF_I	st	%f21, [0x0ca8, %r4]
	.word 0xdbe11005  ! 143: CASA_I	casa	[%r4] 0x80, %r5, %r13
	.word 0xdbf12005  ! 144: CASXA_R	casxa	[%r4]%asi, %r5, %r13
	.word 0xd6f24969  ! 146: STXA_R	stxa	%r11, [%r9 + %r9] 0x4b
	.word 0xde210005  ! 147: STW_R	stw	%r15, [%r4 + %r5]
	.word 0xe2b12020  ! 148: STHA_I	stha	%r17, [%r4 + 0x0020] %asi
	.word 0xd8f24980  ! 150: STXA_R	stxa	%r12, [%r9 + %r0] 0x4c
	.word 0xec7127c0  ! 151: STX_I	stx	%r22, [%r4 + 0x07c0]
	.word 0xde290005  ! 152: STB_R	stb	%r15, [%r4 + %r5]
	.word 0xd6f18983  ! 154: STXA_R	stxa	%r11, [%r6 + %r3] 0x4c
	.word 0xdee91005  ! 155: LDSTUBA_R	ldstuba	%r15, [%r4 + %r5] 0x80
	.word 0xd6f00ce1  ! 157: STXA_R	stxa	%r11, [%r0 + %r1] 0x67
	.word 0xf5392250  ! 158: STDF_I	std	%f26, [0x0250, %r4]
	.word 0xf8b11005  ! 159: STHA_R	stha	%r28, [%r4 + %r5] 0x80
	.word 0xf8f91005  ! 160: SWAPA_R	swapa	%r28, [%r4 + %r5] 0x80
	.word 0xeca12588  ! 161: STWA_I	stwa	%r22, [%r4 + 0x0588] %asi
	.word 0xdb2125ac  ! 162: STF_I	st	%f13, [0x05ac, %r4]
	.word 0xed392c48  ! 163: STDF_I	std	%f22, [0x0c48, %r4]
	.word 0xdcb91005  ! 164: STDA_R	stda	%r14, [%r4 + %r5] 0x80
	.word 0xde790005  ! 165: SWAP_R	swap	%r15, [%r4 + %r5]
	.word 0xd6f04989  ! 167: STXA_R	stxa	%r11, [%r1 + %r9] 0x4c
	.word 0xe6a11005  ! 168: STWA_R	stwa	%r19, [%r4 + %r5] 0x80
	.word 0xfa710005  ! 169: STX_R	stx	%r29, [%r4 + %r5]
	.word 0xeef91005  ! 170: SWAPA_R	swapa	%r23, [%r4 + %r5] 0x80
	.word 0xdb212db4  ! 171: STF_I	st	%f13, [0x0db4, %r4]
	.word 0xee712550  ! 172: STX_I	stx	%r23, [%r4 + 0x0550]
	.word 0xe5212388  ! 173: STF_I	st	%f18, [0x0388, %r4]
	.word 0xd6f04960  ! 175: STXA_R	stxa	%r11, [%r1 + %r0] 0x4b
	.word 0xdf210005  ! 176: STF_R	st	%f15, [%r5, %r4]
	.word 0xecb12eec  ! 177: STHA_I	stha	%r22, [%r4 + 0x0eec] %asi
	.word 0xe6a92884  ! 178: STBA_I	stba	%r19, [%r4 + 0x0884] %asi
	.word 0xee290005  ! 179: STB_R	stb	%r23, [%r4 + %r5]
	.word 0xfcb91005  ! 180: STDA_R	stda	%r30, [%r4 + %r5] 0x80
	.word 0xec290005  ! 181: STB_R	stb	%r22, [%r4 + %r5]
	.word 0xd8f08ce8  ! 183: STXA_R	stxa	%r12, [%r2 + %r8] 0x67
	.word 0xe3212160  ! 184: STF_I	st	%f17, [0x0160, %r4]
	.word 0xddf12005  ! 185: CASXA_R	casxa	[%r4]%asi, %r5, %r14
	.word 0xe5390005  ! 186: STDF_R	std	%f18, [%r5, %r4]
	.word 0xfca91005  ! 187: STBA_R	stba	%r30, [%r4 + %r5] 0x80
	.word 0xfa210005  ! 188: STW_R	stw	%r29, [%r4 + %r5]
	.word 0xe9390005  ! 189: STDF_R	std	%f20, [%r5, %r4]
	.word 0xf4312a86  ! 190: STH_I	sth	%r26, [%r4 + 0x0a86]
	.word 0xf2210005  ! 191: STW_R	stw	%r25, [%r4 + %r5]
	.word 0xd6f18ce9  ! 193: STXA_R	stxa	%r11, [%r6 + %r9] 0x67
	.word 0xeab12426  ! 194: STHA_I	stha	%r21, [%r4 + 0x0426] %asi
	.word 0xece91005  ! 195: LDSTUBA_R	ldstuba	%r22, [%r4 + %r5] 0x80
	.word 0xe27121f8  ! 196: STX_I	stx	%r17, [%r4 + 0x01f8]
	.word 0xd6f08ce8  ! 198: STXA_R	stxa	%r11, [%r2 + %r8] 0x67
	.word 0xf631263c  ! 199: STH_I	sth	%r27, [%r4 + 0x063c]
	.word 0xe2a11005  ! 200: STWA_R	stwa	%r17, [%r4 + %r5] 0x80
	.word 0xed210005  ! 201: STF_R	st	%f22, [%r5, %r4]
	.word 0xf62121fc  ! 202: STW_I	stw	%r27, [%r4 + 0x01fc]
	.word 0xd8f18ce8  ! 204: STXA_R	stxa	%r12, [%r6 + %r8] 0x67
	.word 0xd8f00962  ! 206: STXA_R	stxa	%r12, [%r0 + %r2] 0x4b
	.word 0xed212a64  ! 207: STF_I	st	%f22, [0x0a64, %r4]
	.word 0xdb390005  ! 208: STDF_R	std	%f13, [%r5, %r4]
	.word 0xd8f24981  ! 210: STXA_R	stxa	%r12, [%r9 + %r1] 0x4c
	.word 0xf72125a8  ! 211: STF_I	st	%f27, [0x05a8, %r4]
	.word 0xf7f12005  ! 212: CASXA_R	casxa	[%r4]%asi, %r5, %r27
	.word 0xf2312a42  ! 213: STH_I	sth	%r25, [%r4 + 0x0a42]
	.word 0xea710005  ! 214: STX_R	stx	%r21, [%r4 + %r5]
	.word 0xe0f12b18  ! 215: STXA_I	stxa	%r16, [%r4 + 0x0b18] %asi
	.word 0xd6f08ce3  ! 217: STXA_R	stxa	%r11, [%r2 + %r3] 0x67
	.word 0xfa212e58  ! 218: STW_I	stw	%r29, [%r4 + 0x0e58]
	.word 0xf2b11005  ! 219: STHA_R	stha	%r25, [%r4 + %r5] 0x80
	.word 0xf5210005  ! 220: STF_R	st	%f26, [%r5, %r4]
	.word 0xd8f0cce1  ! 222: STXA_R	stxa	%r12, [%r3 + %r1] 0x67
	.word 0xe1210005  ! 223: STF_R	st	%f16, [%r5, %r4]
	.word 0xf7392fc8  ! 224: STDF_I	std	%f27, [0x0fc8, %r4]
	.word 0xf4212ad0  ! 225: STW_I	stw	%r26, [%r4 + 0x0ad0]
	.word 0xed212a10  ! 226: STF_I	st	%f22, [0x0a10, %r4]
	.word 0xdea11005  ! 227: STWA_R	stwa	%r15, [%r4 + %r5] 0x80
	.word 0xe8b11005  ! 228: STHA_R	stha	%r20, [%r4 + %r5] 0x80
	.word 0xeae91005  ! 229: LDSTUBA_R	ldstuba	%r21, [%r4 + %r5] 0x80
	.word 0xf4f11005  ! 230: STXA_R	stxa	%r26, [%r4 + %r5] 0x80
	.word 0xd8f20ce3  ! 232: STXA_R	stxa	%r12, [%r8 + %r3] 0x67
	.word 0xfb390005  ! 233: STDF_R	std	%f29, [%r5, %r4]
	.word 0xdaa91005  ! 234: STBA_R	stba	%r13, [%r4 + %r5] 0x80
	.word 0xe8b92bc0  ! 235: STDA_I	stda	%r20, [%r4 + 0x0bc0] %asi
	.word 0xe0a11005  ! 236: STWA_R	stwa	%r16, [%r4 + %r5] 0x80
	.word 0xeef126a0  ! 237: STXA_I	stxa	%r23, [%r4 + 0x06a0] %asi
	.word 0xf0290005  ! 238: STB_R	stb	%r24, [%r4 + %r5]
	.word 0xd8f18982  ! 240: STXA_R	stxa	%r12, [%r6 + %r2] 0x4c
	.word 0xfe790005  ! 241: SWAP_R	swap	%r31, [%r4 + %r5]
	.word 0xeaa11005  ! 242: STWA_R	stwa	%r21, [%r4 + %r5] 0x80
	.word 0xda712340  ! 243: STX_I	stx	%r13, [%r4 + 0x0340]
	.word 0xe421211c  ! 244: STW_I	stw	%r18, [%r4 + 0x011c]
	.word 0xeaf92f20  ! 245: SWAPA_I	swapa	%r21, [%r4 + 0x0f20] %asi
	.word 0xfe790005  ! 246: SWAP_R	swap	%r31, [%r4 + %r5]
	.word 0xd6f04ce7  ! 248: STXA_R	stxa	%r11, [%r1 + %r7] 0x67
	.word 0xdff11005  ! 249: CASXA_I	casxa	[%r4] 0x80, %r5, %r15
	.word 0xf1390005  ! 250: STDF_R	std	%f24, [%r5, %r4]
	.word 0xdcb11005  ! 251: STHA_R	stha	%r14, [%r4 + %r5] 0x80
	.word 0xeea91005  ! 252: STBA_R	stba	%r23, [%r4 + %r5] 0x80
	.word 0xe5390005  ! 253: STDF_R	std	%f18, [%r5, %r4]
	.word 0xf2a11005  ! 254: STWA_R	stwa	%r25, [%r4 + %r5] 0x80
	.word 0xdb392558  ! 255: STDF_I	std	%f13, [0x0558, %r4]
	.word 0xeee9244a  ! 256: LDSTUBA_I	ldstuba	%r23, [%r4 + 0x044a] %asi
	.word 0xd6f18ce8  ! 258: STXA_R	stxa	%r11, [%r6 + %r8] 0x67
	.word 0xd6f24ce3  ! 260: STXA_R	stxa	%r11, [%r9 + %r3] 0x67
	.word 0xe7e12005  ! 261: CASA_R	casa	[%r4] %asi, %r5, %r19
	.word 0xf0712f98  ! 262: STX_I	stx	%r24, [%r4 + 0x0f98]
	.word 0xf8b92b08  ! 263: STDA_I	stda	%r28, [%r4 + 0x0b08] %asi
	.word 0xf3390005  ! 264: STDF_R	std	%f25, [%r5, %r4]
	.word 0xf2a123cc  ! 265: STWA_I	stwa	%r25, [%r4 + 0x03cc] %asi
	.word 0xe0f11005  ! 266: STXA_R	stxa	%r16, [%r4 + %r5] 0x80
	.word 0xf9f12005  ! 267: CASXA_R	casxa	[%r4]%asi, %r5, %r28
	.word 0xe3210005  ! 268: STF_R	st	%f17, [%r5, %r4]
	.word 0xf6b12394  ! 269: STHA_I	stha	%r27, [%r4 + 0x0394] %asi
	.word 0xd6f24ce2  ! 271: STXA_R	stxa	%r11, [%r9 + %r2] 0x67
	.word 0xfe790005  ! 272: SWAP_R	swap	%r31, [%r4 + %r5]
	.word 0xd6f1c980  ! 274: STXA_R	stxa	%r11, [%r7 + %r0] 0x4c
	.word 0xed210005  ! 275: STF_R	st	%f22, [%r5, %r4]
	.word 0xd8f0c968  ! 277: STXA_R	stxa	%r12, [%r3 + %r8] 0x4b
	.word 0xd6f24ce3  ! 279: STXA_R	stxa	%r11, [%r9 + %r3] 0x67
	.word 0xfd210005  ! 280: STF_R	st	%f30, [%r5, %r4]
	.word 0xedf11005  ! 281: CASXA_I	casxa	[%r4] 0x80, %r5, %r22
	.word 0xe8292ba9  ! 282: STB_I	stb	%r20, [%r4 + 0x0ba9]
	.word 0xf2e92fa5  ! 283: LDSTUBA_I	ldstuba	%r25, [%r4 + 0x0fa5] %asi
	.word 0xd6f24983  ! 285: STXA_R	stxa	%r11, [%r9 + %r3] 0x4c
	.word 0xeae91005  ! 286: LDSTUBA_R	ldstuba	%r21, [%r4 + %r5] 0x80
	.word 0xd6f20ce2  ! 288: STXA_R	stxa	%r11, [%r8 + %r2] 0x67
	.word 0xfb212cb8  ! 289: STF_I	st	%f29, [0x0cb8, %r4]
	.word 0xed212f20  ! 290: STF_I	st	%f22, [0x0f20, %r4]
	.word 0xe3e12005  ! 291: CASA_R	casa	[%r4] %asi, %r5, %r17
	.word 0xf2212b90  ! 292: STW_I	stw	%r25, [%r4 + 0x0b90]
	.word 0xde790005  ! 293: SWAP_R	swap	%r15, [%r4 + %r5]
	.word 0xed390005  ! 294: STDF_R	std	%f22, [%r5, %r4]
	.word 0xeb392888  ! 295: STDF_I	std	%f21, [0x0888, %r4]
	.word 0xd6f18963  ! 297: STXA_R	stxa	%r11, [%r6 + %r3] 0x4b
	.word 0xe7210005  ! 298: STF_R	st	%f19, [%r5, %r4]
	.word 0xe8e91005  ! 299: LDSTUBA_R	ldstuba	%r20, [%r4 + %r5] 0x80
	.word 0xfb210005  ! 300: STF_R	st	%f29, [%r5, %r4]
	.word 0xd8f04ce1  ! 302: STXA_R	stxa	%r12, [%r1 + %r1] 0x67
	.word 0xe0b11005  ! 303: STHA_R	stha	%r16, [%r4 + %r5] 0x80
	.word 0xdb390005  ! 304: STDF_R	std	%f13, [%r5, %r4]
	.word 0xf8e91005  ! 305: LDSTUBA_R	ldstuba	%r28, [%r4 + %r5] 0x80
	.word 0xf8a91005  ! 306: STBA_R	stba	%r28, [%r4 + %r5] 0x80
	.word 0xfd392520  ! 307: STDF_I	std	%f30, [0x0520, %r4]
	.word 0xd6f04ce2  ! 309: STXA_R	stxa	%r11, [%r1 + %r2] 0x67
	.word 0xf4212554  ! 310: STW_I	stw	%r26, [%r4 + 0x0554]
	.word 0xde212f28  ! 311: STW_I	stw	%r15, [%r4 + 0x0f28]
	.word 0xf1210005  ! 312: STF_R	st	%f24, [%r5, %r4]
	.word 0xdf2124b8  ! 313: STF_I	st	%f15, [0x04b8, %r4]
	.word 0xe4f91005  ! 314: SWAPA_R	swapa	%r18, [%r4 + %r5] 0x80
	.word 0xe8f12880  ! 315: STXA_I	stxa	%r20, [%r4 + 0x0880] %asi
	.word 0xfd210005  ! 316: STF_R	st	%f30, [%r5, %r4]
	.word 0xdd390005  ! 317: STDF_R	std	%f14, [%r5, %r4]
	.word 0xf13920d8  ! 318: STDF_I	std	%f24, [0x00d8, %r4]
	.word 0xef212e0c  ! 319: STF_I	st	%f23, [0x0e0c, %r4]
	.word 0xed212258  ! 320: STF_I	st	%f22, [0x0258, %r4]
	.word 0xf0f11005  ! 321: STXA_R	stxa	%r24, [%r4 + %r5] 0x80
	.word 0xeca11005  ! 322: STWA_R	stwa	%r22, [%r4 + %r5] 0x80
	.word 0xe7f12005  ! 323: CASXA_R	casxa	[%r4]%asi, %r5, %r19
	.word 0xf6e91005  ! 324: LDSTUBA_R	ldstuba	%r27, [%r4 + %r5] 0x80
	.word 0xdbe11005  ! 325: CASA_I	casa	[%r4] 0x80, %r5, %r13
	.word 0xdae9274c  ! 326: LDSTUBA_I	ldstuba	%r13, [%r4 + 0x074c] %asi
	.word 0xd8f0c982  ! 328: STXA_R	stxa	%r12, [%r3 + %r2] 0x4c
	.word 0xf8f925d0  ! 329: SWAPA_I	swapa	%r28, [%r4 + 0x05d0] %asi
	.word 0xec210005  ! 330: STW_R	stw	%r22, [%r4 + %r5]
	.word 0xf3f12005  ! 331: CASXA_R	casxa	[%r4]%asi, %r5, %r25
	.word 0xdaf91005  ! 332: SWAPA_R	swapa	%r13, [%r4 + %r5] 0x80
	.word 0xee790005  ! 333: SWAP_R	swap	%r23, [%r4 + %r5]
	.word 0xf9e12005  ! 334: CASA_R	casa	[%r4] %asi, %r5, %r28
	.word 0xe5210005  ! 335: STF_R	st	%f18, [%r5, %r4]
	.word 0xfd390005  ! 336: STDF_R	std	%f30, [%r5, %r4]
	.word 0xf1210005  ! 337: STF_R	st	%f24, [%r5, %r4]
	.word 0xf02122ec  ! 338: STW_I	stw	%r24, [%r4 + 0x02ec]
	.word 0xfd390005  ! 339: STDF_R	std	%f30, [%r5, %r4]
	.word 0xe6210005  ! 340: STW_R	stw	%r19, [%r4 + %r5]
	.word 0xd6f00981  ! 342: STXA_R	stxa	%r11, [%r0 + %r1] 0x4c
	.word 0xeb392e28  ! 343: STDF_I	std	%f21, [0x0e28, %r4]
	.word 0xf4f92a94  ! 344: SWAPA_I	swapa	%r26, [%r4 + 0x0a94] %asi
	.word 0xfaa11005  ! 345: STWA_R	stwa	%r29, [%r4 + %r5] 0x80
	.word 0xd6f04963  ! 347: STXA_R	stxa	%r11, [%r1 + %r3] 0x4b
	.word 0xfaf91005  ! 348: SWAPA_R	swapa	%r29, [%r4 + %r5] 0x80
	.word 0xd6f00982  ! 350: STXA_R	stxa	%r11, [%r0 + %r2] 0x4c
	.word 0xede12005  ! 351: CASA_R	casa	[%r4] %asi, %r5, %r22
	.word 0xf8710005  ! 352: STX_R	stx	%r28, [%r4 + %r5]
	.word 0xe8290005  ! 353: STB_R	stb	%r20, [%r4 + %r5]
	.word 0xef390005  ! 354: STDF_R	std	%f23, [%r5, %r4]
	.word 0xd8f08981  ! 356: STXA_R	stxa	%r12, [%r2 + %r1] 0x4c
	.word 0xdef92788  ! 357: SWAPA_I	swapa	%r15, [%r4 + 0x0788] %asi
	.word 0xfef92de4  ! 358: SWAPA_I	swapa	%r31, [%r4 + 0x0de4] %asi
	.word 0xd8f20ce3  ! 360: STXA_R	stxa	%r12, [%r8 + %r3] 0x67
	.word 0xfeb11005  ! 361: STHA_R	stha	%r31, [%r4 + %r5] 0x80
	.word 0xdab11005  ! 362: STHA_R	stha	%r13, [%r4 + %r5] 0x80
	.word 0xe0792a3c  ! 363: SWAP_I	swap	%r16, [%r4 + 0x0a3c]
	.word 0xe4f11005  ! 364: STXA_R	stxa	%r18, [%r4 + %r5] 0x80
	.word 0xf3390005  ! 365: STDF_R	std	%f25, [%r5, %r4]
	.word 0xd6f08ce8  ! 367: STXA_R	stxa	%r11, [%r2 + %r8] 0x67
	.word 0xe2710005  ! 368: STX_R	stx	%r17, [%r4 + %r5]
	.word 0xda710005  ! 369: STX_R	stx	%r13, [%r4 + %r5]
	.word 0xf6712738  ! 370: STX_I	stx	%r27, [%r4 + 0x0738]
	.word 0xee290005  ! 371: STB_R	stb	%r23, [%r4 + %r5]
	.word 0xdeb11005  ! 372: STHA_R	stha	%r15, [%r4 + %r5] 0x80
	.word 0xf1212fd0  ! 373: STF_I	st	%f24, [0x0fd0, %r4]
	.word 0xd6f24ce7  ! 375: STXA_R	stxa	%r11, [%r9 + %r7] 0x67
	.word 0xeaf91005  ! 376: SWAPA_R	swapa	%r21, [%r4 + %r5] 0x80
	.word 0xfaa11005  ! 377: STWA_R	stwa	%r29, [%r4 + %r5] 0x80
	.word 0xfcf11005  ! 378: STXA_R	stxa	%r30, [%r4 + %r5] 0x80
	.word 0xd8f0cce1  ! 380: STXA_R	stxa	%r12, [%r3 + %r1] 0x67
	.word 0xe9210005  ! 381: STF_R	st	%f20, [%r5, %r4]
	.word 0xf6212068  ! 382: STW_I	stw	%r27, [%r4 + 0x0068]
	.word 0xd8f08ce2  ! 384: STXA_R	stxa	%r12, [%r2 + %r2] 0x67
	.word 0xe6210005  ! 385: STW_R	stw	%r19, [%r4 + %r5]
	.word 0xd8f0cce3  ! 387: STXA_R	stxa	%r12, [%r3 + %r3] 0x67
	.word 0xd8f0cce3  ! 389: STXA_R	stxa	%r12, [%r3 + %r3] 0x67
	.word 0xd6f00ce1  ! 391: STXA_R	stxa	%r11, [%r0 + %r1] 0x67
	.word 0xd8f24989  ! 393: STXA_R	stxa	%r12, [%r9 + %r9] 0x4c
	.word 0xd8f0cce1  ! 395: STXA_R	stxa	%r12, [%r3 + %r1] 0x67
	.word 0xd6f04ce8  ! 397: STXA_R	stxa	%r11, [%r1 + %r8] 0x67
	.word 0xf6a11005  ! 398: STWA_R	stwa	%r27, [%r4 + %r5] 0x80
	.word 0xf32126a0  ! 399: STF_I	st	%f25, [0x06a0, %r4]
	.word 0xde210005  ! 400: STW_R	stw	%r15, [%r4 + %r5]
	.word 0xd6f0cce2  ! 402: STXA_R	stxa	%r11, [%r3 + %r2] 0x67
	.word 0xda710005  ! 403: STX_R	stx	%r13, [%r4 + %r5]
	.word 0xfa310005  ! 404: STH_R	sth	%r29, [%r4 + %r5]
	.word 0xf3210005  ! 405: STF_R	st	%f25, [%r5, %r4]
	.word 0xf4f12280  ! 406: STXA_I	stxa	%r26, [%r4 + 0x0280] %asi
	.word 0xfef91005  ! 407: SWAPA_R	swapa	%r31, [%r4 + %r5] 0x80
	.word 0xf6712928  ! 408: STX_I	stx	%r27, [%r4 + 0x0928]
	.word 0xf6210005  ! 409: STW_R	stw	%r27, [%r4 + %r5]
	.word 0xf4b91005  ! 410: STDA_R	stda	%r26, [%r4 + %r5] 0x80
	.word 0xe7392fe0  ! 411: STDF_I	std	%f19, [0x0fe0, %r4]
	.word 0xd8f18981  ! 413: STXA_R	stxa	%r12, [%r6 + %r1] 0x4c
	.word 0xd6f18980  ! 415: STXA_R	stxa	%r11, [%r6 + %r0] 0x4c
	.word 0xd8f08ce0  ! 417: STXA_R	stxa	%r12, [%r2 + %r0] 0x67
	.word 0xe6a92cb3  ! 418: STBA_I	stba	%r19, [%r4 + 0x0cb3] %asi
	.word 0xecb926d0  ! 419: STDA_I	stda	%r22, [%r4 + 0x06d0] %asi
	.word 0xf92124d0  ! 420: STF_I	st	%f28, [0x04d0, %r4]
	.word 0xf4a91005  ! 421: STBA_R	stba	%r26, [%r4 + %r5] 0x80
	.word 0xd6f00986  ! 423: STXA_R	stxa	%r11, [%r0 + %r6] 0x4c
	.word 0xee310005  ! 424: STH_R	sth	%r23, [%r4 + %r5]
	.word 0xfc210005  ! 425: STW_R	stw	%r30, [%r4 + %r5]
	.word 0xec712d60  ! 426: STX_I	stx	%r22, [%r4 + 0x0d60]
	.word 0xfe710005  ! 427: STX_R	stx	%r31, [%r4 + %r5]
	.word 0xe4312628  ! 428: STH_I	sth	%r18, [%r4 + 0x0628]
	.word 0xfef92f04  ! 429: SWAPA_I	swapa	%r31, [%r4 + 0x0f04] %asi
	.word 0xdf210005  ! 430: STF_R	st	%f15, [%r5, %r4]
	.word 0xe6312c66  ! 431: STH_I	sth	%r19, [%r4 + 0x0c66]
	.word 0xd6f04989  ! 433: STXA_R	stxa	%r11, [%r1 + %r9] 0x4c
	.word 0xda290005  ! 434: STB_R	stb	%r13, [%r4 + %r5]
	.word 0xe9392168  ! 435: STDF_I	std	%f20, [0x0168, %r4]
	.word 0xf4f124a0  ! 436: STXA_I	stxa	%r26, [%r4 + 0x04a0] %asi
	.word 0xeae91005  ! 437: LDSTUBA_R	ldstuba	%r21, [%r4 + %r5] 0x80
	.word 0xee31216e  ! 438: STH_I	sth	%r23, [%r4 + 0x016e]
	.word 0xe9e11005  ! 439: CASA_I	casa	[%r4] 0x80, %r5, %r20
	.word 0xebe12005  ! 440: CASA_R	casa	[%r4] %asi, %r5, %r21
	.word 0xfe312a2a  ! 441: STH_I	sth	%r31, [%r4 + 0x0a2a]
	.word 0xd6f04960  ! 443: STXA_R	stxa	%r11, [%r1 + %r0] 0x4b
	.word 0xeff11005  ! 444: CASXA_I	casxa	[%r4] 0x80, %r5, %r23
	.word 0xd6f1c961  ! 446: STXA_R	stxa	%r11, [%r7 + %r1] 0x4b
	.word 0xe27124e8  ! 447: STX_I	stx	%r17, [%r4 + 0x04e8]
	.word 0xe92128e8  ! 448: STF_I	st	%f20, [0x08e8, %r4]
	.word 0xeb210005  ! 449: STF_R	st	%f21, [%r5, %r4]
	.word 0xe33925a8  ! 450: STDF_I	std	%f17, [0x05a8, %r4]
	.word 0xd6f18ce0  ! 452: STXA_R	stxa	%r11, [%r6 + %r0] 0x67
	.word 0xe6b1224c  ! 453: STHA_I	stha	%r19, [%r4 + 0x024c] %asi
	.word 0xf4210005  ! 454: STW_R	stw	%r26, [%r4 + %r5]
	.word 0xf0e91005  ! 455: LDSTUBA_R	ldstuba	%r24, [%r4 + %r5] 0x80
	.word 0xdee923f5  ! 456: LDSTUBA_I	ldstuba	%r15, [%r4 + 0x03f5] %asi
	.word 0xd8f0cce0  ! 458: STXA_R	stxa	%r12, [%r3 + %r0] 0x67
	.word 0xf2f91005  ! 459: SWAPA_R	swapa	%r25, [%r4 + %r5] 0x80
	.word 0xd8f08962  ! 461: STXA_R	stxa	%r12, [%r2 + %r2] 0x4b
	.word 0xe3e11005  ! 462: CASA_I	casa	[%r4] 0x80, %r5, %r17
	.word 0xfef91005  ! 463: SWAPA_R	swapa	%r31, [%r4 + %r5] 0x80
	.word 0xf6790005  ! 464: SWAP_R	swap	%r27, [%r4 + %r5]
	.word 0xe4a928a6  ! 465: STBA_I	stba	%r18, [%r4 + 0x08a6] %asi
	.word 0xf93925c8  ! 466: STDF_I	std	%f28, [0x05c8, %r4]
	.word 0xfca12a3c  ! 467: STWA_I	stwa	%r30, [%r4 + 0x0a3c] %asi
	.word 0xf0b92fe8  ! 468: STDA_I	stda	%r24, [%r4 + 0x0fe8] %asi
	.word 0xdae91005  ! 469: LDSTUBA_R	ldstuba	%r13, [%r4 + %r5] 0x80
	.word 0xec290005  ! 470: STB_R	stb	%r22, [%r4 + %r5]
	.word 0xe4710005  ! 471: STX_R	stx	%r18, [%r4 + %r5]
	.word 0xeb212fc4  ! 472: STF_I	st	%f21, [0x0fc4, %r4]
	.word 0xf3392b28  ! 473: STDF_I	std	%f25, [0x0b28, %r4]
	.word 0xf8f11005  ! 474: STXA_R	stxa	%r28, [%r4 + %r5] 0x80
	.word 0xd8b91005  ! 475: STDA_R	stda	%r12, [%r4 + %r5] 0x80
	.word 0xd8f04ce1  ! 477: STXA_R	stxa	%r12, [%r1 + %r1] 0x67
	.word 0xf7390005  ! 478: STDF_R	std	%f27, [%r5, %r4]
	.word 0xe1392498  ! 479: STDF_I	std	%f16, [0x0498, %r4]
	.word 0xfa212250  ! 480: STW_I	stw	%r29, [%r4 + 0x0250]
	.word 0xeeb12786  ! 481: STHA_I	stha	%r23, [%r4 + 0x0786] %asi
	.word 0xe6e926b7  ! 482: LDSTUBA_I	ldstuba	%r19, [%r4 + 0x06b7] %asi
	.word 0xd8f08ce2  ! 484: STXA_R	stxa	%r12, [%r2 + %r2] 0x67
	.word 0xfcb91005  ! 485: STDA_R	stda	%r30, [%r4 + %r5] 0x80
	.word 0xe3392bb8  ! 486: STDF_I	std	%f17, [0x0bb8, %r4]
	.word 0xe7e11005  ! 487: CASA_I	casa	[%r4] 0x80, %r5, %r19
	.word 0xd6f00ce6  ! 489: STXA_R	stxa	%r11, [%r0 + %r6] 0x67
	.word 0xeb2120bc  ! 490: STF_I	st	%f21, [0x00bc, %r4]
	.word 0xecf12ef8  ! 491: STXA_I	stxa	%r22, [%r4 + 0x0ef8] %asi
	.word 0xd8f0c968  ! 493: STXA_R	stxa	%r12, [%r3 + %r8] 0x4b
	.word 0xe3392a88  ! 494: STDF_I	std	%f17, [0x0a88, %r4]
	.word 0xe5210005  ! 495: STF_R	st	%f18, [%r5, %r4]
	.word 0xd8f08ce8  ! 497: STXA_R	stxa	%r12, [%r2 + %r8] 0x67
	.word 0xdcb929a8  ! 498: STDA_I	stda	%r14, [%r4 + 0x09a8] %asi
	.word 0xe4f11005  ! 499: STXA_R	stxa	%r18, [%r4 + %r5] 0x80
        ta      T_GOOD_TRAP

th_main_3:
	setx  0x39cb16040db5a640, %r1, %r1
	setx  0x07fb7ee30143ab80, %r1, %r2
	setx  0x2119f99507030f98, %r1, %r3
	setx  0x8749704c08470518, %r1, %r6
	setx  0xb314fc01035c1eb0, %r1, %r7
	setx  0xf8a29d60059eafb0, %r1, %r8
	setx  0xc2c5e61a03408278, %r1, %r9
	setx  0xa785a770080ff838, %r1, %r11
	setx  0xd9b97580006fe584, %r1, %r12
	setx  0x30550e92f6f16b2e, %r1, %r13
	setx  0x26925e82ae690835, %r1, %r14
	setx  0x5e92e2113547a1ff, %r1, %r15
	setx  0xcac083b2f33acd67, %r1, %r16
	setx  0xafee8a9ac0b93a27, %r1, %r17
	setx  0x7c400b732a3785d5, %r1, %r18
	setx  0x94ccb73c36eab255, %r1, %r19
	setx  0xb120ea7ff361d683, %r1, %r20
	setx  0x599a7002b237d64d, %r1, %r21
	setx  0x5fcce7d666d1d332, %r1, %r22
	setx  0x491b47e077ef96ac, %r1, %r23
	setx  0x1b43068ad3cf85d2, %r1, %r24
	setx  0xa9739c0d15857930, %r1, %r25
	setx  0x2011be1a80bedf75, %r1, %r26
	setx  0x3ea73a058b0db4f9, %r1, %r27
	setx  0x78be25c5662e82df, %r1, %r28
	setx  0x9ad42c678ca903f8, %r1, %r29
	setx  0xe1da4982a2b551cf, %r1, %r30
	setx  0x9e0d7e63d7007fe4, %r1, %r31
	setx  MAIN_BASE_DATA_VA, %r1, %r4
	setx  0x0000000000000da0, %r1, %r5
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
	.word 0xfc210005  ! 6: STW_R	stw	%r30, [%r4 + %r5]
	.word 0xee290005  ! 7: STB_R	stb	%r23, [%r4 + %r5]
	.word 0xdcf11005  ! 8: STXA_R	stxa	%r14, [%r4 + %r5] 0x80
	.word 0xd6f04983  ! 10: STXA_R	stxa	%r11, [%r1 + %r3] 0x4c
	.word 0xe5212810  ! 11: STF_I	st	%f18, [0x0810, %r4]
	.word 0xdff12005  ! 12: CASXA_R	casxa	[%r4]%asi, %r5, %r15
	.word 0xdae921d1  ! 13: LDSTUBA_I	ldstuba	%r13, [%r4 + 0x01d1] %asi
	.word 0xf8b925f0  ! 14: STDA_I	stda	%r28, [%r4 + 0x05f0] %asi
	.word 0xfd210005  ! 15: STF_R	st	%f30, [%r5, %r4]
	.word 0xecb91005  ! 16: STDA_R	stda	%r22, [%r4 + %r5] 0x80
	.word 0xeb3920c0  ! 17: STDF_I	std	%f21, [0x00c0, %r4]
	.word 0xec710005  ! 18: STX_R	stx	%r22, [%r4 + %r5]
	.word 0xfb210005  ! 19: STF_R	st	%f29, [%r5, %r4]
	.word 0xe7f12005  ! 20: CASXA_R	casxa	[%r4]%asi, %r5, %r19
	.word 0xf3390005  ! 21: STDF_R	std	%f25, [%r5, %r4]
	.word 0xd6f04ce2  ! 23: STXA_R	stxa	%r11, [%r1 + %r2] 0x67
	.word 0xe4a12bf0  ! 24: STWA_I	stwa	%r18, [%r4 + 0x0bf0] %asi
	.word 0xdee92ce4  ! 25: LDSTUBA_I	ldstuba	%r15, [%r4 + 0x0ce4] %asi
	.word 0xeb2126d0  ! 26: STF_I	st	%f21, [0x06d0, %r4]
	.word 0xf2f12ce0  ! 27: STXA_I	stxa	%r25, [%r4 + 0x0ce0] %asi
	.word 0xd8f04960  ! 29: STXA_R	stxa	%r12, [%r1 + %r0] 0x4b
	.word 0xd6f20ce9  ! 31: STXA_R	stxa	%r11, [%r8 + %r9] 0x67
	.word 0xd8f20967  ! 33: STXA_R	stxa	%r12, [%r8 + %r7] 0x4b
	.word 0xf2710005  ! 34: STX_R	stx	%r25, [%r4 + %r5]
	.word 0xd8f0cce7  ! 36: STXA_R	stxa	%r12, [%r3 + %r7] 0x67
	.word 0xd8f04ce0  ! 38: STXA_R	stxa	%r12, [%r1 + %r0] 0x67
	.word 0xd8f00ce9  ! 40: STXA_R	stxa	%r12, [%r0 + %r9] 0x67
	.word 0xe07129c8  ! 41: STX_I	stx	%r16, [%r4 + 0x09c8]
	.word 0xe231222c  ! 42: STH_I	sth	%r17, [%r4 + 0x022c]
	.word 0xe1210005  ! 43: STF_R	st	%f16, [%r5, %r4]
	.word 0xd6f18ce0  ! 45: STXA_R	stxa	%r11, [%r6 + %r0] 0x67
	.word 0xd6f04969  ! 47: STXA_R	stxa	%r11, [%r1 + %r9] 0x4b
	.word 0xeae91005  ! 48: LDSTUBA_R	ldstuba	%r21, [%r4 + %r5] 0x80
	.word 0xe0a11005  ! 49: STWA_R	stwa	%r16, [%r4 + %r5] 0x80
	.word 0xe2292d43  ! 50: STB_I	stb	%r17, [%r4 + 0x0d43]
	.word 0xf2a1207c  ! 51: STWA_I	stwa	%r25, [%r4 + 0x007c] %asi
	.word 0xd8f1c966  ! 53: STXA_R	stxa	%r12, [%r7 + %r6] 0x4b
	.word 0xe8f12d38  ! 54: STXA_I	stxa	%r20, [%r4 + 0x0d38] %asi
	.word 0xfb392270  ! 55: STDF_I	std	%f29, [0x0270, %r4]
	.word 0xfe712618  ! 56: STX_I	stx	%r31, [%r4 + 0x0618]
	.word 0xdc290005  ! 57: STB_R	stb	%r14, [%r4 + %r5]
	.word 0xdf392b20  ! 58: STDF_I	std	%f15, [0x0b20, %r4]
	.word 0xeb390005  ! 59: STDF_R	std	%f21, [%r5, %r4]
	.word 0xfaf91005  ! 60: SWAPA_R	swapa	%r29, [%r4 + %r5] 0x80
	.word 0xdaf91005  ! 61: SWAPA_R	swapa	%r13, [%r4 + %r5] 0x80
	.word 0xe0b91005  ! 62: STDA_R	stda	%r16, [%r4 + %r5] 0x80
	.word 0xeb210005  ! 63: STF_R	st	%f21, [%r5, %r4]
	.word 0xf9390005  ! 64: STDF_R	std	%f28, [%r5, %r4]
	.word 0xdd390005  ! 65: STDF_R	std	%f14, [%r5, %r4]
	.word 0xda710005  ! 66: STX_R	stx	%r13, [%r4 + %r5]
	.word 0xe1e12005  ! 67: CASA_R	casa	[%r4] %asi, %r5, %r16
	.word 0xdd392080  ! 68: STDF_I	std	%f14, [0x0080, %r4]
	.word 0xe6212e9c  ! 69: STW_I	stw	%r19, [%r4 + 0x0e9c]
	.word 0xf4b920b8  ! 70: STDA_I	stda	%r26, [%r4 + 0x00b8] %asi
	.word 0xda210005  ! 71: STW_R	stw	%r13, [%r4 + %r5]
	.word 0xf6e91005  ! 72: LDSTUBA_R	ldstuba	%r27, [%r4 + %r5] 0x80
	.word 0xfab12538  ! 73: STHA_I	stha	%r29, [%r4 + 0x0538] %asi
	.word 0xf02928f2  ! 74: STB_I	stb	%r24, [%r4 + 0x08f2]
	.word 0xe9390005  ! 75: STDF_R	std	%f20, [%r5, %r4]
	.word 0xe0a11005  ! 76: STWA_R	stwa	%r16, [%r4 + %r5] 0x80
	.word 0xe5e12005  ! 77: CASA_R	casa	[%r4] %asi, %r5, %r18
	.word 0xe8b11005  ! 78: STHA_R	stha	%r20, [%r4 + %r5] 0x80
	.word 0xdc790005  ! 79: SWAP_R	swap	%r14, [%r4 + %r5]
	.word 0xe2b11005  ! 80: STHA_R	stha	%r17, [%r4 + %r5] 0x80
	.word 0xf0290005  ! 81: STB_R	stb	%r24, [%r4 + %r5]
	.word 0xd6f1c982  ! 83: STXA_R	stxa	%r11, [%r7 + %r2] 0x4c
	.word 0xdff11005  ! 84: CASXA_I	casxa	[%r4] 0x80, %r5, %r15
	.word 0xf3390005  ! 85: STDF_R	std	%f25, [%r5, %r4]
	.word 0xd6f20ce3  ! 87: STXA_R	stxa	%r11, [%r8 + %r3] 0x67
	.word 0xeb392a48  ! 88: STDF_I	std	%f21, [0x0a48, %r4]
	.word 0xfc2928c4  ! 89: STB_I	stb	%r30, [%r4 + 0x08c4]
	.word 0xd8f1cce0  ! 91: STXA_R	stxa	%r12, [%r7 + %r0] 0x67
	.word 0xd8f18968  ! 93: STXA_R	stxa	%r12, [%r6 + %r8] 0x4b
	.word 0xdbf12005  ! 94: CASXA_R	casxa	[%r4]%asi, %r5, %r13
	.word 0xe8312be6  ! 95: STH_I	sth	%r20, [%r4 + 0x0be6]
	.word 0xd6f00ce7  ! 97: STXA_R	stxa	%r11, [%r0 + %r7] 0x67
	.word 0xfef12350  ! 98: STXA_I	stxa	%r31, [%r4 + 0x0350] %asi
	.word 0xf6f91005  ! 99: SWAPA_R	swapa	%r27, [%r4 + %r5] 0x80
	.word 0xdc310005  ! 100: STH_R	sth	%r14, [%r4 + %r5]
	.word 0xe6712568  ! 101: STX_I	stx	%r19, [%r4 + 0x0568]
	.word 0xe7210005  ! 102: STF_R	st	%f19, [%r5, %r4]
	.word 0xd8f04ce3  ! 104: STXA_R	stxa	%r12, [%r1 + %r3] 0x67
	.word 0xe2b11005  ! 105: STHA_R	stha	%r17, [%r4 + %r5] 0x80
	.word 0xf7212e84  ! 106: STF_I	st	%f27, [0x0e84, %r4]
	.word 0xd6f04ce3  ! 108: STXA_R	stxa	%r11, [%r1 + %r3] 0x67
	.word 0xd6f00968  ! 110: STXA_R	stxa	%r11, [%r0 + %r8] 0x4b
	.word 0xfd392dd0  ! 111: STDF_I	std	%f30, [0x0dd0, %r4]
	.word 0xda310005  ! 112: STH_R	sth	%r13, [%r4 + %r5]
	.word 0xed210005  ! 113: STF_R	st	%f22, [%r5, %r4]
	.word 0xee210005  ! 114: STW_R	stw	%r23, [%r4 + %r5]
	.word 0xecb92998  ! 115: STDA_I	stda	%r22, [%r4 + 0x0998] %asi
	.word 0xe2290005  ! 116: STB_R	stb	%r17, [%r4 + %r5]
	.word 0xeb212794  ! 117: STF_I	st	%f21, [0x0794, %r4]
	.word 0xd6f08ce3  ! 119: STXA_R	stxa	%r11, [%r2 + %r3] 0x67
	.word 0xdf2128b8  ! 120: STF_I	st	%f15, [0x08b8, %r4]
	.word 0xd6f24ce9  ! 122: STXA_R	stxa	%r11, [%r9 + %r9] 0x67
	.word 0xd6f04969  ! 124: STXA_R	stxa	%r11, [%r1 + %r9] 0x4b
	.word 0xea21200c  ! 125: STW_I	stw	%r21, [%r4 + 0x000c]
	.word 0xdcb925d0  ! 126: STDA_I	stda	%r14, [%r4 + 0x05d0] %asi
	.word 0xd8f0cce0  ! 128: STXA_R	stxa	%r12, [%r3 + %r0] 0x67
	.word 0xe6b11005  ! 129: STHA_R	stha	%r19, [%r4 + %r5] 0x80
	.word 0xeb390005  ! 130: STDF_R	std	%f21, [%r5, %r4]
	.word 0xfab1228c  ! 131: STHA_I	stha	%r29, [%r4 + 0x028c] %asi
	.word 0xe0b92a68  ! 132: STDA_I	stda	%r16, [%r4 + 0x0a68] %asi
	.word 0xfab12a4c  ! 133: STHA_I	stha	%r29, [%r4 + 0x0a4c] %asi
	.word 0xf93926d8  ! 134: STDF_I	std	%f28, [0x06d8, %r4]
	.word 0xfea12d24  ! 135: STWA_I	stwa	%r31, [%r4 + 0x0d24] %asi
	.word 0xf8e92512  ! 136: LDSTUBA_I	ldstuba	%r28, [%r4 + 0x0512] %asi
	.word 0xe9f12005  ! 137: CASXA_R	casxa	[%r4]%asi, %r5, %r20
	.word 0xfe79276c  ! 138: SWAP_I	swap	%r31, [%r4 + 0x076c]
	.word 0xf4f12328  ! 139: STXA_I	stxa	%r26, [%r4 + 0x0328] %asi
	.word 0xec7926f4  ! 140: SWAP_I	swap	%r22, [%r4 + 0x06f4]
	.word 0xfe290005  ! 141: STB_R	stb	%r31, [%r4 + %r5]
	.word 0xe1212e28  ! 142: STF_I	st	%f16, [0x0e28, %r4]
	.word 0xe3e11005  ! 143: CASA_I	casa	[%r4] 0x80, %r5, %r17
	.word 0xf9f12005  ! 144: CASXA_R	casxa	[%r4]%asi, %r5, %r28
	.word 0xd6f00962  ! 146: STXA_R	stxa	%r11, [%r0 + %r2] 0x4b
	.word 0xfc210005  ! 147: STW_R	stw	%r30, [%r4 + %r5]
	.word 0xf4b1234a  ! 148: STHA_I	stha	%r26, [%r4 + 0x034a] %asi
	.word 0xd6f00982  ! 150: STXA_R	stxa	%r11, [%r0 + %r2] 0x4c
	.word 0xdc7123d0  ! 151: STX_I	stx	%r14, [%r4 + 0x03d0]
	.word 0xdc290005  ! 152: STB_R	stb	%r14, [%r4 + %r5]
	.word 0xd8f20983  ! 154: STXA_R	stxa	%r12, [%r8 + %r3] 0x4c
	.word 0xe4e91005  ! 155: LDSTUBA_R	ldstuba	%r18, [%r4 + %r5] 0x80
	.word 0xd8f1cce0  ! 157: STXA_R	stxa	%r12, [%r7 + %r0] 0x67
	.word 0xf3392350  ! 158: STDF_I	std	%f25, [0x0350, %r4]
	.word 0xf8b11005  ! 159: STHA_R	stha	%r28, [%r4 + %r5] 0x80
	.word 0xf8f91005  ! 160: SWAPA_R	swapa	%r28, [%r4 + %r5] 0x80
	.word 0xf8a12748  ! 161: STWA_I	stwa	%r28, [%r4 + 0x0748] %asi
	.word 0xf9212d10  ! 162: STF_I	st	%f28, [0x0d10, %r4]
	.word 0xed3924c0  ! 163: STDF_I	std	%f22, [0x04c0, %r4]
	.word 0xfcb91005  ! 164: STDA_R	stda	%r30, [%r4 + %r5] 0x80
	.word 0xfe790005  ! 165: SWAP_R	swap	%r31, [%r4 + %r5]
	.word 0xd6f24ce1  ! 167: STXA_R	stxa	%r11, [%r9 + %r1] 0x67
	.word 0xfaa11005  ! 168: STWA_R	stwa	%r29, [%r4 + %r5] 0x80
	.word 0xe0710005  ! 169: STX_R	stx	%r16, [%r4 + %r5]
	.word 0xe0f91005  ! 170: SWAPA_R	swapa	%r16, [%r4 + %r5] 0x80
	.word 0xe5212bf8  ! 171: STF_I	st	%f18, [0x0bf8, %r4]
	.word 0xf8712908  ! 172: STX_I	stx	%r28, [%r4 + 0x0908]
	.word 0xed212cf8  ! 173: STF_I	st	%f22, [0x0cf8, %r4]
	.word 0xd6f08966  ! 175: STXA_R	stxa	%r11, [%r2 + %r6] 0x4b
	.word 0xdd210005  ! 176: STF_R	st	%f14, [%r5, %r4]
	.word 0xecb12694  ! 177: STHA_I	stha	%r22, [%r4 + 0x0694] %asi
	.word 0xdea92538  ! 178: STBA_I	stba	%r15, [%r4 + 0x0538] %asi
	.word 0xf0290005  ! 179: STB_R	stb	%r24, [%r4 + %r5]
	.word 0xecb91005  ! 180: STDA_R	stda	%r22, [%r4 + %r5] 0x80
	.word 0xdc290005  ! 181: STB_R	stb	%r14, [%r4 + %r5]
	.word 0xd6f0cce1  ! 183: STXA_R	stxa	%r11, [%r3 + %r1] 0x67
	.word 0xfb212a7c  ! 184: STF_I	st	%f29, [0x0a7c, %r4]
	.word 0xddf12005  ! 185: CASXA_R	casxa	[%r4]%asi, %r5, %r14
	.word 0xdd390005  ! 186: STDF_R	std	%f14, [%r5, %r4]
	.word 0xdea91005  ! 187: STBA_R	stba	%r15, [%r4 + %r5] 0x80
	.word 0xea210005  ! 188: STW_R	stw	%r21, [%r4 + %r5]
	.word 0xfb390005  ! 189: STDF_R	std	%f29, [%r5, %r4]
	.word 0xe6312254  ! 190: STH_I	sth	%r19, [%r4 + 0x0254]
	.word 0xe6210005  ! 191: STW_R	stw	%r19, [%r4 + %r5]
	.word 0xd6f00980  ! 193: STXA_R	stxa	%r11, [%r0 + %r0] 0x4c
	.word 0xe2b12ac6  ! 194: STHA_I	stha	%r17, [%r4 + 0x0ac6] %asi
	.word 0xeee91005  ! 195: LDSTUBA_R	ldstuba	%r23, [%r4 + %r5] 0x80
	.word 0xda712c28  ! 196: STX_I	stx	%r13, [%r4 + 0x0c28]
	.word 0xd6f24ce0  ! 198: STXA_R	stxa	%r11, [%r9 + %r0] 0x67
	.word 0xdc312b56  ! 199: STH_I	sth	%r14, [%r4 + 0x0b56]
	.word 0xeea11005  ! 200: STWA_R	stwa	%r23, [%r4 + %r5] 0x80
	.word 0xf1210005  ! 201: STF_R	st	%f24, [%r5, %r4]
	.word 0xfc212e60  ! 202: STW_I	stw	%r30, [%r4 + 0x0e60]
	.word 0xd8f04963  ! 204: STXA_R	stxa	%r12, [%r1 + %r3] 0x4b
	.word 0xd6f08ce9  ! 206: STXA_R	stxa	%r11, [%r2 + %r9] 0x67
	.word 0xdd212598  ! 207: STF_I	st	%f14, [0x0598, %r4]
	.word 0xdd390005  ! 208: STDF_R	std	%f14, [%r5, %r4]
	.word 0xd6f08969  ! 210: STXA_R	stxa	%r11, [%r2 + %r9] 0x4b
	.word 0xf52120d8  ! 211: STF_I	st	%f26, [0x00d8, %r4]
	.word 0xf3f12005  ! 212: CASXA_R	casxa	[%r4]%asi, %r5, %r25
	.word 0xdc31250e  ! 213: STH_I	sth	%r14, [%r4 + 0x050e]
	.word 0xec710005  ! 214: STX_R	stx	%r22, [%r4 + %r5]
	.word 0xecf12d08  ! 215: STXA_I	stxa	%r22, [%r4 + 0x0d08] %asi
	.word 0xd6f1cce0  ! 217: STXA_R	stxa	%r11, [%r7 + %r0] 0x67
	.word 0xf2212000  ! 218: STW_I	stw	%r25, [%r4 + 0x0000]
	.word 0xf2b11005  ! 219: STHA_R	stha	%r25, [%r4 + %r5] 0x80
	.word 0xe3210005  ! 220: STF_R	st	%f17, [%r5, %r4]
	.word 0xd6f0c982  ! 222: STXA_R	stxa	%r11, [%r3 + %r2] 0x4c
	.word 0xe1210005  ! 223: STF_R	st	%f16, [%r5, %r4]
	.word 0xfd3928f8  ! 224: STDF_I	std	%f30, [0x08f8, %r4]
	.word 0xe22123f0  ! 225: STW_I	stw	%r17, [%r4 + 0x03f0]
	.word 0xe5212028  ! 226: STF_I	st	%f18, [0x0028, %r4]
	.word 0xeaa11005  ! 227: STWA_R	stwa	%r21, [%r4 + %r5] 0x80
	.word 0xf0b11005  ! 228: STHA_R	stha	%r24, [%r4 + %r5] 0x80
	.word 0xf8e91005  ! 229: LDSTUBA_R	ldstuba	%r28, [%r4 + %r5] 0x80
	.word 0xe4f11005  ! 230: STXA_R	stxa	%r18, [%r4 + %r5] 0x80
	.word 0xd6f0c980  ! 232: STXA_R	stxa	%r11, [%r3 + %r0] 0x4c
	.word 0xe9390005  ! 233: STDF_R	std	%f20, [%r5, %r4]
	.word 0xe8a91005  ! 234: STBA_R	stba	%r20, [%r4 + %r5] 0x80
	.word 0xf8b924f8  ! 235: STDA_I	stda	%r28, [%r4 + 0x04f8] %asi
	.word 0xdca11005  ! 236: STWA_R	stwa	%r14, [%r4 + %r5] 0x80
	.word 0xe2f12fa8  ! 237: STXA_I	stxa	%r17, [%r4 + 0x0fa8] %asi
	.word 0xfa290005  ! 238: STB_R	stb	%r29, [%r4 + %r5]
	.word 0xd6f04ce8  ! 240: STXA_R	stxa	%r11, [%r1 + %r8] 0x67
	.word 0xda790005  ! 241: SWAP_R	swap	%r13, [%r4 + %r5]
	.word 0xeaa11005  ! 242: STWA_R	stwa	%r21, [%r4 + %r5] 0x80
	.word 0xde712b38  ! 243: STX_I	stx	%r15, [%r4 + 0x0b38]
	.word 0xf421216c  ! 244: STW_I	stw	%r26, [%r4 + 0x016c]
	.word 0xdaf92304  ! 245: SWAPA_I	swapa	%r13, [%r4 + 0x0304] %asi
	.word 0xf6790005  ! 246: SWAP_R	swap	%r27, [%r4 + %r5]
	.word 0xd6f0c982  ! 248: STXA_R	stxa	%r11, [%r3 + %r2] 0x4c
	.word 0xf1f11005  ! 249: CASXA_I	casxa	[%r4] 0x80, %r5, %r24
	.word 0xf1390005  ! 250: STDF_R	std	%f24, [%r5, %r4]
	.word 0xe0b11005  ! 251: STHA_R	stha	%r16, [%r4 + %r5] 0x80
	.word 0xdca91005  ! 252: STBA_R	stba	%r14, [%r4 + %r5] 0x80
	.word 0xf7390005  ! 253: STDF_R	std	%f27, [%r5, %r4]
	.word 0xf2a11005  ! 254: STWA_R	stwa	%r25, [%r4 + %r5] 0x80
	.word 0xdd392d28  ! 255: STDF_I	std	%f14, [0x0d28, %r4]
	.word 0xdce92a5d  ! 256: LDSTUBA_I	ldstuba	%r14, [%r4 + 0x0a5d] %asi
	.word 0xd8f0cce3  ! 258: STXA_R	stxa	%r12, [%r3 + %r3] 0x67
	.word 0xd8f24ce6  ! 260: STXA_R	stxa	%r12, [%r9 + %r6] 0x67
	.word 0xf5e12005  ! 261: CASA_R	casa	[%r4] %asi, %r5, %r26
	.word 0xf8712c18  ! 262: STX_I	stx	%r28, [%r4 + 0x0c18]
	.word 0xf0b92b38  ! 263: STDA_I	stda	%r24, [%r4 + 0x0b38] %asi
	.word 0xf3390005  ! 264: STDF_R	std	%f25, [%r5, %r4]
	.word 0xe0a123b4  ! 265: STWA_I	stwa	%r16, [%r4 + 0x03b4] %asi
	.word 0xe2f11005  ! 266: STXA_R	stxa	%r17, [%r4 + %r5] 0x80
	.word 0xeff12005  ! 267: CASXA_R	casxa	[%r4]%asi, %r5, %r23
	.word 0xf1210005  ! 268: STF_R	st	%f24, [%r5, %r4]
	.word 0xfeb12022  ! 269: STHA_I	stha	%r31, [%r4 + 0x0022] %asi
	.word 0xd8f08980  ! 271: STXA_R	stxa	%r12, [%r2 + %r0] 0x4c
	.word 0xec790005  ! 272: SWAP_R	swap	%r22, [%r4 + %r5]
	.word 0xd6f18ce2  ! 274: STXA_R	stxa	%r11, [%r6 + %r2] 0x67
	.word 0xf7210005  ! 275: STF_R	st	%f27, [%r5, %r4]
	.word 0xd6f18ce8  ! 277: STXA_R	stxa	%r11, [%r6 + %r8] 0x67
	.word 0xd6f04963  ! 279: STXA_R	stxa	%r11, [%r1 + %r3] 0x4b
	.word 0xe1210005  ! 280: STF_R	st	%f16, [%r5, %r4]
	.word 0xfbf11005  ! 281: CASXA_I	casxa	[%r4] 0x80, %r5, %r29
	.word 0xf82928d0  ! 282: STB_I	stb	%r28, [%r4 + 0x08d0]
	.word 0xf4e92bbe  ! 283: LDSTUBA_I	ldstuba	%r26, [%r4 + 0x0bbe] %asi
	.word 0xd6f1cce2  ! 285: STXA_R	stxa	%r11, [%r7 + %r2] 0x67
	.word 0xece91005  ! 286: LDSTUBA_R	ldstuba	%r22, [%r4 + %r5] 0x80
	.word 0xd6f24963  ! 288: STXA_R	stxa	%r11, [%r9 + %r3] 0x4b
	.word 0xe9212d18  ! 289: STF_I	st	%f20, [0x0d18, %r4]
	.word 0xdd212de8  ! 290: STF_I	st	%f14, [0x0de8, %r4]
	.word 0xe7e12005  ! 291: CASA_R	casa	[%r4] %asi, %r5, %r19
	.word 0xda21293c  ! 292: STW_I	stw	%r13, [%r4 + 0x093c]
	.word 0xfc790005  ! 293: SWAP_R	swap	%r30, [%r4 + %r5]
	.word 0xef390005  ! 294: STDF_R	std	%f23, [%r5, %r4]
	.word 0xe9392c90  ! 295: STDF_I	std	%f20, [0x0c90, %r4]
	.word 0xd8f0c969  ! 297: STXA_R	stxa	%r12, [%r3 + %r9] 0x4b
	.word 0xeb210005  ! 298: STF_R	st	%f21, [%r5, %r4]
	.word 0xece91005  ! 299: LDSTUBA_R	ldstuba	%r22, [%r4 + %r5] 0x80
	.word 0xf1210005  ! 300: STF_R	st	%f24, [%r5, %r4]
	.word 0xd6f1cce2  ! 302: STXA_R	stxa	%r11, [%r7 + %r2] 0x67
	.word 0xecb11005  ! 303: STHA_R	stha	%r22, [%r4 + %r5] 0x80
	.word 0xe7390005  ! 304: STDF_R	std	%f19, [%r5, %r4]
	.word 0xfee91005  ! 305: LDSTUBA_R	ldstuba	%r31, [%r4 + %r5] 0x80
	.word 0xf6a91005  ! 306: STBA_R	stba	%r27, [%r4 + %r5] 0x80
	.word 0xe13928f8  ! 307: STDF_I	std	%f16, [0x08f8, %r4]
	.word 0xd6f18983  ! 309: STXA_R	stxa	%r11, [%r6 + %r3] 0x4c
	.word 0xec212dc0  ! 310: STW_I	stw	%r22, [%r4 + 0x0dc0]
	.word 0xda212674  ! 311: STW_I	stw	%r13, [%r4 + 0x0674]
	.word 0xef210005  ! 312: STF_R	st	%f23, [%r5, %r4]
	.word 0xdd212c6c  ! 313: STF_I	st	%f14, [0x0c6c, %r4]
	.word 0xf0f91005  ! 314: SWAPA_R	swapa	%r24, [%r4 + %r5] 0x80
	.word 0xecf12ff0  ! 315: STXA_I	stxa	%r22, [%r4 + 0x0ff0] %asi
	.word 0xe9210005  ! 316: STF_R	st	%f20, [%r5, %r4]
	.word 0xe5390005  ! 317: STDF_R	std	%f18, [%r5, %r4]
	.word 0xe5392ac0  ! 318: STDF_I	std	%f18, [0x0ac0, %r4]
	.word 0xf32124ac  ! 319: STF_I	st	%f25, [0x04ac, %r4]
	.word 0xe1212c20  ! 320: STF_I	st	%f16, [0x0c20, %r4]
	.word 0xfef11005  ! 321: STXA_R	stxa	%r31, [%r4 + %r5] 0x80
	.word 0xe0a11005  ! 322: STWA_R	stwa	%r16, [%r4 + %r5] 0x80
	.word 0xe5f12005  ! 323: CASXA_R	casxa	[%r4]%asi, %r5, %r18
	.word 0xf4e91005  ! 324: LDSTUBA_R	ldstuba	%r26, [%r4 + %r5] 0x80
	.word 0xf5e11005  ! 325: CASA_I	casa	[%r4] 0x80, %r5, %r26
	.word 0xece92c8d  ! 326: LDSTUBA_I	ldstuba	%r22, [%r4 + 0x0c8d] %asi
	.word 0xd6f00ce6  ! 328: STXA_R	stxa	%r11, [%r0 + %r6] 0x67
	.word 0xdef92930  ! 329: SWAPA_I	swapa	%r15, [%r4 + 0x0930] %asi
	.word 0xde210005  ! 330: STW_R	stw	%r15, [%r4 + %r5]
	.word 0xfff12005  ! 331: CASXA_R	casxa	[%r4]%asi, %r5, %r31
	.word 0xeaf91005  ! 332: SWAPA_R	swapa	%r21, [%r4 + %r5] 0x80
	.word 0xf4790005  ! 333: SWAP_R	swap	%r26, [%r4 + %r5]
	.word 0xffe12005  ! 334: CASA_R	casa	[%r4] %asi, %r5, %r31
	.word 0xf7210005  ! 335: STF_R	st	%f27, [%r5, %r4]
	.word 0xe5390005  ! 336: STDF_R	std	%f18, [%r5, %r4]
	.word 0xf5210005  ! 337: STF_R	st	%f26, [%r5, %r4]
	.word 0xde212ee4  ! 338: STW_I	stw	%r15, [%r4 + 0x0ee4]
	.word 0xf3390005  ! 339: STDF_R	std	%f25, [%r5, %r4]
	.word 0xf4210005  ! 340: STW_R	stw	%r26, [%r4 + %r5]
	.word 0xd8f0cce2  ! 342: STXA_R	stxa	%r12, [%r3 + %r2] 0x67
	.word 0xdf392420  ! 343: STDF_I	std	%f15, [0x0420, %r4]
	.word 0xdef921ec  ! 344: SWAPA_I	swapa	%r15, [%r4 + 0x01ec] %asi
	.word 0xf4a11005  ! 345: STWA_R	stwa	%r26, [%r4 + %r5] 0x80
	.word 0xd6f0cce1  ! 347: STXA_R	stxa	%r11, [%r3 + %r1] 0x67
	.word 0xdef91005  ! 348: SWAPA_R	swapa	%r15, [%r4 + %r5] 0x80
	.word 0xd6f1cce9  ! 350: STXA_R	stxa	%r11, [%r7 + %r9] 0x67
	.word 0xffe12005  ! 351: CASA_R	casa	[%r4] %asi, %r5, %r31
	.word 0xe0710005  ! 352: STX_R	stx	%r16, [%r4 + %r5]
	.word 0xec290005  ! 353: STB_R	stb	%r22, [%r4 + %r5]
	.word 0xed390005  ! 354: STDF_R	std	%f22, [%r5, %r4]
	.word 0xd6f00960  ! 356: STXA_R	stxa	%r11, [%r0 + %r0] 0x4b
	.word 0xeef922b4  ! 357: SWAPA_I	swapa	%r23, [%r4 + 0x02b4] %asi
	.word 0xf6f92cf4  ! 358: SWAPA_I	swapa	%r27, [%r4 + 0x0cf4] %asi
	.word 0xd8f0c983  ! 360: STXA_R	stxa	%r12, [%r3 + %r3] 0x4c
	.word 0xfcb11005  ! 361: STHA_R	stha	%r30, [%r4 + %r5] 0x80
	.word 0xe0b11005  ! 362: STHA_R	stha	%r16, [%r4 + %r5] 0x80
	.word 0xdc792f44  ! 363: SWAP_I	swap	%r14, [%r4 + 0x0f44]
	.word 0xfcf11005  ! 364: STXA_R	stxa	%r30, [%r4 + %r5] 0x80
	.word 0xed390005  ! 365: STDF_R	std	%f22, [%r5, %r4]
	.word 0xd6f24982  ! 367: STXA_R	stxa	%r11, [%r9 + %r2] 0x4c
	.word 0xe0710005  ! 368: STX_R	stx	%r16, [%r4 + %r5]
	.word 0xe2710005  ! 369: STX_R	stx	%r17, [%r4 + %r5]
	.word 0xec712230  ! 370: STX_I	stx	%r22, [%r4 + 0x0230]
	.word 0xf6290005  ! 371: STB_R	stb	%r27, [%r4 + %r5]
	.word 0xf4b11005  ! 372: STHA_R	stha	%r26, [%r4 + %r5] 0x80
	.word 0xe12127e0  ! 373: STF_I	st	%f16, [0x07e0, %r4]
	.word 0xd6f0c982  ! 375: STXA_R	stxa	%r11, [%r3 + %r2] 0x4c
	.word 0xe4f91005  ! 376: SWAPA_R	swapa	%r18, [%r4 + %r5] 0x80
	.word 0xf4a11005  ! 377: STWA_R	stwa	%r26, [%r4 + %r5] 0x80
	.word 0xe6f11005  ! 378: STXA_R	stxa	%r19, [%r4 + %r5] 0x80
	.word 0xd8f1cce6  ! 380: STXA_R	stxa	%r12, [%r7 + %r6] 0x67
	.word 0xe9210005  ! 381: STF_R	st	%f20, [%r5, %r4]
	.word 0xe62121a0  ! 382: STW_I	stw	%r19, [%r4 + 0x01a0]
	.word 0xd8f04ce1  ! 384: STXA_R	stxa	%r12, [%r1 + %r1] 0x67
	.word 0xf8210005  ! 385: STW_R	stw	%r28, [%r4 + %r5]
	.word 0xd6f08967  ! 387: STXA_R	stxa	%r11, [%r2 + %r7] 0x4b
	.word 0xd6f00980  ! 389: STXA_R	stxa	%r11, [%r0 + %r0] 0x4c
	.word 0xd8f18983  ! 391: STXA_R	stxa	%r12, [%r6 + %r3] 0x4c
	.word 0xd6f0cce3  ! 393: STXA_R	stxa	%r11, [%r3 + %r3] 0x67
	.word 0xd6f08ce8  ! 395: STXA_R	stxa	%r11, [%r2 + %r8] 0x67
	.word 0xd6f18ce7  ! 397: STXA_R	stxa	%r11, [%r6 + %r7] 0x67
	.word 0xdea11005  ! 398: STWA_R	stwa	%r15, [%r4 + %r5] 0x80
	.word 0xe7212cc0  ! 399: STF_I	st	%f19, [0x0cc0, %r4]
	.word 0xea210005  ! 400: STW_R	stw	%r21, [%r4 + %r5]
	.word 0xd8f0c961  ! 402: STXA_R	stxa	%r12, [%r3 + %r1] 0x4b
	.word 0xfc710005  ! 403: STX_R	stx	%r30, [%r4 + %r5]
	.word 0xf2310005  ! 404: STH_R	sth	%r25, [%r4 + %r5]
	.word 0xf5210005  ! 405: STF_R	st	%f26, [%r5, %r4]
	.word 0xe8f126c0  ! 406: STXA_I	stxa	%r20, [%r4 + 0x06c0] %asi
	.word 0xfcf91005  ! 407: SWAPA_R	swapa	%r30, [%r4 + %r5] 0x80
	.word 0xf8712cd8  ! 408: STX_I	stx	%r28, [%r4 + 0x0cd8]
	.word 0xe8210005  ! 409: STW_R	stw	%r20, [%r4 + %r5]
	.word 0xfcb91005  ! 410: STDA_R	stda	%r30, [%r4 + %r5] 0x80
	.word 0xe3392a10  ! 411: STDF_I	std	%f17, [0x0a10, %r4]
	.word 0xd6f00ce2  ! 413: STXA_R	stxa	%r11, [%r0 + %r2] 0x67
	.word 0xd6f18ce9  ! 415: STXA_R	stxa	%r11, [%r6 + %r9] 0x67
	.word 0xd6f00980  ! 417: STXA_R	stxa	%r11, [%r0 + %r0] 0x4c
	.word 0xfca92cc4  ! 418: STBA_I	stba	%r30, [%r4 + 0x0cc4] %asi
	.word 0xf4b928d8  ! 419: STDA_I	stda	%r26, [%r4 + 0x08d8] %asi
	.word 0xe5212748  ! 420: STF_I	st	%f18, [0x0748, %r4]
	.word 0xdea91005  ! 421: STBA_R	stba	%r15, [%r4 + %r5] 0x80
	.word 0xd6f08981  ! 423: STXA_R	stxa	%r11, [%r2 + %r1] 0x4c
	.word 0xf4310005  ! 424: STH_R	sth	%r26, [%r4 + %r5]
	.word 0xe4210005  ! 425: STW_R	stw	%r18, [%r4 + %r5]
	.word 0xe2712268  ! 426: STX_I	stx	%r17, [%r4 + 0x0268]
	.word 0xda710005  ! 427: STX_R	stx	%r13, [%r4 + %r5]
	.word 0xe63128fc  ! 428: STH_I	sth	%r19, [%r4 + 0x08fc]
	.word 0xf8f92d78  ! 429: SWAPA_I	swapa	%r28, [%r4 + 0x0d78] %asi
	.word 0xf3210005  ! 430: STF_R	st	%f25, [%r5, %r4]
	.word 0xfe312c60  ! 431: STH_I	sth	%r31, [%r4 + 0x0c60]
	.word 0xd6f04ce1  ! 433: STXA_R	stxa	%r11, [%r1 + %r1] 0x67
	.word 0xe0290005  ! 434: STB_R	stb	%r16, [%r4 + %r5]
	.word 0xeb392fa0  ! 435: STDF_I	std	%f21, [0x0fa0, %r4]
	.word 0xe6f121e8  ! 436: STXA_I	stxa	%r19, [%r4 + 0x01e8] %asi
	.word 0xdce91005  ! 437: LDSTUBA_R	ldstuba	%r14, [%r4 + %r5] 0x80
	.word 0xfc3122e6  ! 438: STH_I	sth	%r30, [%r4 + 0x02e6]
	.word 0xfde11005  ! 439: CASA_I	casa	[%r4] 0x80, %r5, %r30
	.word 0xe7e12005  ! 440: CASA_R	casa	[%r4] %asi, %r5, %r19
	.word 0xdc312532  ! 441: STH_I	sth	%r14, [%r4 + 0x0532]
	.word 0xd8f20982  ! 443: STXA_R	stxa	%r12, [%r8 + %r2] 0x4c
	.word 0xe1f11005  ! 444: CASXA_I	casxa	[%r4] 0x80, %r5, %r16
	.word 0xd8f20960  ! 446: STXA_R	stxa	%r12, [%r8 + %r0] 0x4b
	.word 0xf87121f8  ! 447: STX_I	stx	%r28, [%r4 + 0x01f8]
	.word 0xe321266c  ! 448: STF_I	st	%f17, [0x066c, %r4]
	.word 0xdf210005  ! 449: STF_R	st	%f15, [%r5, %r4]
	.word 0xdd392b18  ! 450: STDF_I	std	%f14, [0x0b18, %r4]
	.word 0xd6f00982  ! 452: STXA_R	stxa	%r11, [%r0 + %r2] 0x4c
	.word 0xe4b12d44  ! 453: STHA_I	stha	%r18, [%r4 + 0x0d44] %asi
	.word 0xee210005  ! 454: STW_R	stw	%r23, [%r4 + %r5]
	.word 0xeee91005  ! 455: LDSTUBA_R	ldstuba	%r23, [%r4 + %r5] 0x80
	.word 0xdce9228e  ! 456: LDSTUBA_I	ldstuba	%r14, [%r4 + 0x028e] %asi
	.word 0xd6f04ce2  ! 458: STXA_R	stxa	%r11, [%r1 + %r2] 0x67
	.word 0xeaf91005  ! 459: SWAPA_R	swapa	%r21, [%r4 + %r5] 0x80
	.word 0xd8f20ce8  ! 461: STXA_R	stxa	%r12, [%r8 + %r8] 0x67
	.word 0xf1e11005  ! 462: CASA_I	casa	[%r4] 0x80, %r5, %r24
	.word 0xe6f91005  ! 463: SWAPA_R	swapa	%r19, [%r4 + %r5] 0x80
	.word 0xdc790005  ! 464: SWAP_R	swap	%r14, [%r4 + %r5]
	.word 0xeca92c34  ! 465: STBA_I	stba	%r22, [%r4 + 0x0c34] %asi
	.word 0xf33929f8  ! 466: STDF_I	std	%f25, [0x09f8, %r4]
	.word 0xe4a12fe0  ! 467: STWA_I	stwa	%r18, [%r4 + 0x0fe0] %asi
	.word 0xf4b92110  ! 468: STDA_I	stda	%r26, [%r4 + 0x0110] %asi
	.word 0xdce91005  ! 469: LDSTUBA_R	ldstuba	%r14, [%r4 + %r5] 0x80
	.word 0xe2290005  ! 470: STB_R	stb	%r17, [%r4 + %r5]
	.word 0xfc710005  ! 471: STX_R	stx	%r30, [%r4 + %r5]
	.word 0xdb21290c  ! 472: STF_I	st	%f13, [0x090c, %r4]
	.word 0xe93924e8  ! 473: STDF_I	std	%f20, [0x04e8, %r4]
	.word 0xf2f11005  ! 474: STXA_R	stxa	%r25, [%r4 + %r5] 0x80
	.word 0xfcb91005  ! 475: STDA_R	stda	%r30, [%r4 + %r5] 0x80
	.word 0xd6f08ce8  ! 477: STXA_R	stxa	%r11, [%r2 + %r8] 0x67
	.word 0xe1390005  ! 478: STDF_R	std	%f16, [%r5, %r4]
	.word 0xe33926f0  ! 479: STDF_I	std	%f17, [0x06f0, %r4]
	.word 0xf6212f64  ! 480: STW_I	stw	%r27, [%r4 + 0x0f64]
	.word 0xeeb129d8  ! 481: STHA_I	stha	%r23, [%r4 + 0x09d8] %asi
	.word 0xf6e928d8  ! 482: LDSTUBA_I	ldstuba	%r27, [%r4 + 0x08d8] %asi
	.word 0xd8f08988  ! 484: STXA_R	stxa	%r12, [%r2 + %r8] 0x4c
	.word 0xe4b91005  ! 485: STDA_R	stda	%r18, [%r4 + %r5] 0x80
	.word 0xe1392cd0  ! 486: STDF_I	std	%f16, [0x0cd0, %r4]
	.word 0xdde11005  ! 487: CASA_I	casa	[%r4] 0x80, %r5, %r14
	.word 0xd6f00ce9  ! 489: STXA_R	stxa	%r11, [%r0 + %r9] 0x67
	.word 0xf5212cc0  ! 490: STF_I	st	%f26, [0x0cc0, %r4]
	.word 0xecf12f20  ! 491: STXA_I	stxa	%r22, [%r4 + 0x0f20] %asi
	.word 0xd8f0cce6  ! 493: STXA_R	stxa	%r12, [%r3 + %r6] 0x67
	.word 0xed392280  ! 494: STDF_I	std	%f22, [0x0280, %r4]
	.word 0xdd210005  ! 495: STF_R	st	%f14, [%r5, %r4]
	.word 0xd6f0c961  ! 497: STXA_R	stxa	%r11, [%r3 + %r1] 0x4b
	.word 0xf8b929c0  ! 498: STDA_I	stda	%r28, [%r4 + 0x09c0] %asi
	.word 0xfef11005  ! 499: STXA_R	stxa	%r31, [%r4 + %r5] 0x80
        ta      T_GOOD_TRAP

.data
	.word  0xca8e7a24,0x19833041,0x9c26ac4d,0x7a316829
	.word  0x8c8243e7,0x24a96b0a,0xa08265a7,0xfc824b12
	.word  0xb4673c0c,0x2e5c08b5,0xd8988ed1,0xa4e9f432
	.word  0x711ad873,0xe4511227,0x3274269b,0x0bce7b59
	.word  0xf5c265f9,0x8752ba7f,0xf10b7aa5,0xe5786024
	.word  0xab6469dd,0x92daaeeb,0x6624be80,0x0bc41bf1
	.word  0x4e92234e,0x9c59c251,0xed46a511,0x3e93c68d
	.word  0x7dd1a3a6,0x36e1b8c8,0xa2e2f252,0x913ba831
	.word  0xce594f24,0xe2dad182,0x673b4b90,0x224e8539
	.word  0x44244109,0xca62f9e6,0xaafa3f83,0xc0952800
	.word  0x3ea8b1af,0xa0f0c898,0x1fe11451,0x4c36c4e6
	.word  0x54a2e353,0x17a86e25,0xcf6d3f08,0x632bad75
	.word  0x95a22250,0x430838ae,0x55c1231c,0x39f2e6d6
	.word  0x1099a522,0xa47e0f6c,0x99a318f1,0xf414fd3f
	.word  0x90a62aa2,0xa7b50b0e,0x01e87fb3,0x81c19571
	.word  0x848bc63e,0x70c240ec,0xb41ac0cb,0x3b521d28
	.word  0xd50f44e1,0x86284a4f,0xd541f5a6,0x3846c002
	.word  0xa31f2158,0xa39156f5,0x88bd45a9,0x0e097746
	.word  0xdcf763ea,0xec9bb400,0x34843804,0x90b80de9
	.word  0x45c1de43,0x4121dc3e,0xeb4237ff,0xd3ab31ea
	.word  0x963882e8,0x50740553,0x34c15b93,0x28ee922a
	.word  0xc214e057,0x120bb17a,0x7cae3211,0x99f023b7
	.word  0x769a427f,0xb0e7643a,0x10642f78,0x698143ed
	.word  0xc335abd8,0x936ce071,0x9df7f5ab,0xd35df017
	.word  0xabb9d2bf,0x1342b604,0x1bcddedb,0x07de9585
	.word  0x7d20ae51,0xcf16532d,0x7ec6d679,0x2c107845
	.word  0xc4d2a489,0x145dd984,0x5f9a4e34,0xcabe9396
	.word  0xd344671c,0xe5776bb6,0xb80faee5,0x602425bb
	.word  0x1e15c448,0x35bc8a91,0x07eeaa14,0x582e5c1a
	.word  0x240597bf,0x1146f55c,0x8ebd5821,0x67450d9a
	.word  0x6b628878,0x05be4abd,0x15c7eba0,0xa908db35
	.word  0x1afe8118,0x53cf4366,0xce124310,0x6859f05f
	.word  0xee2c59e5,0x8628e748,0xf997408f,0x66816a2a
	.word  0x64975968,0x70733cbe,0x123af042,0x5e1e067d
	.word  0x5f06a444,0x3be7da3b,0x8c559c35,0x553e387d
	.word  0x356c0bc9,0x0436a10a,0x1dcae785,0x5e778ea8
	.word  0x9efd9661,0xd34873e1,0x7f96da65,0x54c4eeef
	.word  0x7b3baaa5,0x70b8f609,0xf7a349c9,0xd11b39b0
	.word  0xd103c431,0x6c39fe13,0x60bd834e,0xc8ef7c1a
	.word  0x788224e1,0x291dc000,0xc25b9453,0x3bf050a1
	.word  0x707cf7ef,0xd5def62c,0x8eab946e,0xa98d97f9
	.word  0x46acd4b7,0x75051ea1,0x6e7d3c47,0x567de3d3
	.word  0x07afca03,0xf19c34cc,0x25986926,0x0a7a3ae2
	.word  0xce78e623,0x2a7eef8b,0x33f77e4c,0x72fa7cb0
	.word  0xac1a9293,0x15e78a87,0x4744ec5f,0x8fd4829b
	.word  0x5e4b7b65,0x2fd7d51d,0xe74a814d,0xe6a2a8a2
	.word  0x31be9a74,0xd8be9331,0xa69d739e,0x9cf194ad
	.word  0x923b1409,0xeabe1266,0xa057fd55,0xeb2e4377
	.word  0xef7615c6,0xaeaa3701,0x156376d5,0x81ef2217
	.word  0x01c8b8ca,0x3680bb7f,0xb70a5871,0x3d2ac4d9
	.word  0x1cf460cb,0xe3008c59,0x7410d079,0x58d2f894
	.word  0x13149b8f,0xfe863e1d,0x72dca0bb,0x4d43a068
	.word  0xfdd4f1c5,0x6888abea,0xefcbe9f0,0x4ab7cdf5
	.word  0x96b5c869,0x74e2c4a8,0x4fc14155,0x66cf0458
	.word  0x213ac3a7,0x934ed16b,0x30b2be78,0xef9a093a
	.word  0x601af466,0xdad29c9b,0xb107d53e,0xfa25be58
	.word  0x087f5ffd,0x2136732a,0x54953fbd,0xa48006e5
	.word  0xb400ccb8,0xdd00f567,0xfec5ada9,0x1728136f
	.word  0x7768ab02,0x3d1ea027,0x6d125d6a,0x67631d82
	.word  0x60852ebe,0x003a8644,0x334952b5,0x2f987f0a
	.word  0xa27ec3d2,0xb86833ed,0xe6f83055,0x36d0b182
	.word  0x6d8dd0e8,0xd12d1153,0x6171c559,0x0147bc3b
	.word  0x0daea953,0xb10cc9fe,0xe0807720,0xe4858310
	.word  0x8c0d280d,0xa167a279,0xdfbbfcbb,0x386b9dc4
	.word  0x2dceadbd,0x9d7a04c1,0x7f2321ae,0xffe1d1b6
	.word  0x02b922be,0xac21f07c,0xadeecc05,0xf5d0bd35
	.word  0x4c33b1cc,0x6e0fdbaa,0xd5b7c915,0xd1156139
	.word  0x229d2d38,0x91a96ff3,0xce2abf99,0xe0af42bb
	.word  0xe51c74dd,0xcaf2854a,0x0bf40fe5,0x6954ce52
	.word  0xa1a62df1,0x0b4f087d,0x525974f6,0x447c35a2
	.word  0x9b455b74,0xe279b3ae,0xdce4fa5c,0x96bca127
	.word  0x4b272dab,0x0ca91d24,0x6ff28ff8,0x5dfb0f3a
	.word  0x7f717ebf,0x73dd0739,0x0d13fe08,0xf72e07fa
	.word  0xabd56fb6,0x71af35cd,0xdb579a62,0x8f69f144
	.word  0x0e21451e,0xed78cce7,0x56eafc66,0xdd88102f
	.word  0xafbd8f98,0x44aa6882,0x0e6e23f5,0x9b3a8497
	.word  0x6bab8db7,0x84a179a1,0x049f204c,0x7996f390
	.word  0x815cac51,0x963f8af6,0x6f018555,0x9d7f3c16
	.word  0x72552b50,0xe675a4c7,0x16cc3655,0x63e557ee
	.word  0xdf75d9b1,0xab7beed7,0xdc2a5112,0x602934a9
	.word  0x46094a56,0xae96b6bd,0x081365d6,0x28b1bee0
	.word  0xfdd94d55,0xdabd80df,0x7fea51a2,0xe3fb8449
	.word  0xa6c276a5,0x80d4b877,0xe5dc1710,0x7a6f80c6
	.word  0x0f9554db,0xc1417e65,0x5a83dde1,0x0e740f78
	.word  0xbed6983c,0xa0b3fb18,0xe440b6c3,0xca417c0a
	.word  0xf356b925,0x3f086ccf,0xd91df5e2,0x204eb5f1
	.word  0xa6a6bbd0,0xfd652e4c,0x4b20f3c6,0xa3f57805
	.word  0xf4f4f79e,0xeb31bb01,0xf5478b3f,0x49fb76a1
	.word  0x1ca24b2d,0xedc75500,0x26f7af95,0x38ade5c1
	.word  0x494f1501,0xa530feb2,0x6a84cd46,0x2dd05ddb
	.word  0x543984fe,0x7f10fc9e,0xbfa6110b,0x4d30a315
	.word  0xe63a9f6b,0xd46e7075,0x1d024ab4,0x6a895972
	.word  0x2ea6e01e,0xbd435452,0x63aba48c,0xa73da57e
	.word  0xbb5783d0,0x213bcd01,0xc7d2d61a,0x7de150be
	.word  0xbc0901f5,0x8b0602ce,0x75ca1c65,0xddb7bfa6
	.word  0x4c45dd06,0x55b3ce3c,0x3b5eb02f,0xd2e48b4e
	.word  0xb7891a3b,0x64364d7d,0x9a7587ce,0xae67e175
	.word  0x20d0fe48,0x01e991d3,0xdeaa1352,0xed038b6c
	.word  0x086b95b0,0xbfe9d35d,0xac21f4f3,0x3c1d091a
	.word  0x75636480,0x04fec6f7,0x3cc17d7d,0x373be872
	.word  0x7c92bdec,0xb6f40ba3,0x43d87597,0xf78def9e
	.word  0xad5a709a,0xb9d3f68b,0x598cb9bf,0xb0bde301
	.word  0xe1743211,0x169f8182,0x272071b0,0x124bd9ae
	.word  0x65777bb9,0x786926f9,0xfcd7b2a9,0x35f3c07e
	.word  0x0b73f61e,0x7a0d687b,0xa40179ea,0x3a16a554
	.word  0xb2b227b9,0x3b8440c1,0x2aae928c,0x94a2754f
	.word  0x15844b7c,0x18b9144e,0xa44341fe,0x53cae5c5
	.word  0x1c164ab0,0x9afaf0f2,0x0f094a7d,0x40ea581e
	.word  0x057319a3,0x2a1bd401,0xa58ce920,0x06f9fc9e
	.word  0x6c6c3807,0x9766108f,0xf8cb43ed,0x14c2f907
	.word  0x1f22737c,0x937fe859,0xf896efa0,0x2d7751b4
	.word  0xc4679129,0xb791f619,0x142429b2,0x00e05273
	.word  0x1af65c3c,0x3bd22044,0x5543ae3a,0x8bc8df14
	.word  0xe35264fd,0x5a83dc90,0x8d0e24fc,0x3d1d4b13
	.word  0x8dd8b63f,0xf3955c64,0x97da9533,0x40c93f1b
	.word  0xc7b3843a,0x8e495cb8,0xe8a6ca67,0x853774e7
	.word  0x73d68f3b,0xaba65ac1,0x9e012fac,0xef9d2cb6
	.word  0x2095bffd,0xdcd84447,0xe5b882ad,0x9ebda0ad
	.word  0x42d7603f,0xdda21095,0x890bb4b4,0x26f61d73
	.word  0x21ec6c46,0x617a357a,0xbb07252a,0x7a8fa696
	.word  0xea9d4d9b,0x8495f450,0xdba2561d,0x070804f5
	.word  0x4b14faae,0x650de755,0x4108090b,0x2aab0f54
	.word  0x6c147220,0x753effe8,0x1a795c2e,0x4183756d
	.word  0x28db2def,0x8cafea5e,0x39413261,0xcf782a94
	.word  0xff7d481e,0x7803ca65,0x16b9b5cc,0x634163ec
	.word  0xf692d51d,0x703d9f6b,0x1ce63952,0xd11cd2d0
	.word  0x8a46fa19,0xeca7d4b7,0xe867ffd6,0xb1b863cd
	.word  0xfc93a627,0xaffc9426,0xdca40958,0xf87a6bf6
	.word  0xf77bf678,0xdd48373e,0x8f76b7a8,0xbe85743e
	.word  0x7581cdf7,0xd109e48f,0x5ad7d7d9,0x38b826be
	.word  0x9fbe4d22,0x64d555fd,0xa0585695,0x3375b304
	.word  0x5f4614e2,0xe9189cd9,0x1e513b42,0xf64716fe
	.word  0xa1a36d2d,0xf5f70082,0x2c903f84,0x1da96947
	.word  0x0cc98cf4,0x5c7f184a,0x39155b8c,0xabb674e1
	.word  0x72e2098f,0x96c87d23,0xd032a2a4,0xc6ce3357
	.word  0x2101ec70,0x99631394,0x65a7bde7,0xebdd32b9
	.word  0x71f55df4,0x4e3fa549,0xac7cdfe8,0xe59d8741
	.word  0x1476a3cf,0xa5124cf9,0x8f5de828,0x6e18c608
	.word  0x85d13bf0,0x0ed05268,0x3a0e0dff,0x8675ec7f
	.word  0xf7aecb5b,0xc8de9c4f,0x4531bcd8,0x1903adcd
	.word  0x71cf5836,0x761ca322,0x6984c31d,0xf598b716
	.word  0x8cec136f,0x9c491f94,0x8393c397,0x76264340
	.word  0x0b1be61c,0x420ba065,0xd2f043ff,0xb8a9cb54
	.word  0x26ddee46,0xad1e93d5,0xa67244f6,0xf3caf961
	.word  0x765e086b,0x7d54aeb4,0x9c43757f,0xe411580a
	.word  0x365821db,0x5036ffb1,0xa643aff8,0xf707416f
	.word  0x820a3dbe,0x6a5a2be0,0x78cd1aef,0x83a74be0
	.word  0x63d09d52,0x4466b378,0x6d17c865,0xa6f29985
	.word  0x822192b2,0x7fb2cf08,0x50ab215c,0xfc45ad4d
	.word  0x63e7fd52,0x9cc481bc,0xccb42638,0x15abc3b2
	.word  0x9e486461,0x5acbaf43,0xa99697ed,0x507f7b50
	.word  0x7d7d3488,0x73ccca3c,0xc9ae5c59,0xbf183184
	.word  0x54bec7aa,0x63ffad21,0xaff6ef44,0x6376ed0e
	.word  0xa5434041,0xbf13d728,0x6ff5a721,0xaebf04b7
	.word  0x3671b265,0x087fab8a,0xf859a996,0x63bfac9f
	.word  0xe95e58aa,0xf8b8865a,0xb59166d4,0x1619a59d
	.word  0x3b402446,0x132f3006,0xc3e28928,0x4fe19f7a
	.word  0x765c6534,0x29119bb6,0x2586899a,0x3ddeeff7
	.word  0x0b0195dc,0xbc46e77d,0x3e53ca7e,0x3501384c
	.word  0x41975e6d,0x1f546bce,0xab0f42f4,0x24ec5805
	.word  0xbc6b37ab,0xfcd159c2,0x92cc9a32,0xf01b7ea3
	.word  0x5c688238,0xd535cb57,0xf70e8535,0xb0b83f18
	.word  0x0b650984,0x97df9951,0x1c98e866,0x25bff492
	.word  0x34b74fb0,0xfa53b76e,0xa92807dd,0x85960078
	.word  0xa5fe6cb7,0x40a1e80e,0xdb09ccb6,0x6575c580
	.word  0x4fc580e4,0x49780fb3,0x796a7df6,0x5374687c
	.word  0x64cef6e2,0xd8f92cf6,0xc25651f5,0x3fd6239a
	.word  0x3f44d14d,0xb316662a,0x5681a2bc,0xdd7edc65
	.word  0x928f6277,0xaf89fb3f,0xd4962100,0xcfef0148
	.word  0xbbad9ccc,0x32380f64,0x1abc3c5c,0xdbcbad4e
	.word  0x609b7dfe,0x05e3a67d,0xd61472cb,0x0ede1ec8
	.word  0xea8b53bd,0x7d471a32,0xd5ac7b87,0xe750cf01
	.word  0xcab9bbd8,0xabb70db9,0x25d379c7,0x67ba7f9d
	.word  0x42932b8c,0xed5a9942,0x0d69c357,0x62cc0505
	.word  0x9f0b9e47,0xb0892e10,0xc123e172,0x8981450c
	.word  0x7848cb1b,0xc3760cc1,0xc8897b62,0xe625fc3e
	.word  0x378e14ec,0x55f6bf1f,0xa04c5a07,0x78c1e996
	.word  0x01f8a10f,0xa53269f8,0x61ae969b,0xc4448782
	.word  0xd246e80e,0x580c1350,0x5dcd4009,0x5b45e31a
	.word  0x596f610a,0xee6341d7,0xdf36f68b,0x4061d6d5
	.word  0xbdda39d0,0x6084ca24,0x737739be,0x0d213309
	.word  0xad404851,0x497ae97b,0xda20cfb3,0x490fb362
	.word  0xeba16434,0x56294d7a,0x618a3d3c,0xe73239e2
	.word  0x4652d82b,0x3ea1db25,0xf683431e,0x3cbb6b0f
	.word  0xd8e09578,0x79a26d5d,0xa5baf953,0xd27ca83b
	.word  0x06bc2569,0x5731782c,0x2165edca,0xc2424084
	.word  0x24955e50,0xeb7b32c7,0xd53e2e52,0xec13587f
	.word  0xa1f41b10,0x1ac59249,0x398fcaf4,0x34a7285e
	.word  0x73b2e51f,0x6e66687a,0x69fdc84a,0x6e913d9d
	.word  0x7e70e8fb,0x540cea24,0x92fb54f2,0x0db40d1b
	.word  0x12d44ea6,0x2de386ff,0x25b71555,0xee44e361
	.word  0x6f547d6c,0x5af31e29,0xbb3aa96c,0x12e8b81c
	.word  0x648da4c4,0xaf7e7295,0xd60fc5a3,0x112511a4
	.word  0xbf7e9e14,0xe2c27f4a,0x63d36c70,0xbc0ddaac
	.word  0xeecad7c2,0xbc630bae,0x87d377c1,0x372a4baa
	.word  0x46557417,0x6dbd24af,0x7200dab6,0x927a67c4
	.word  0xaa3d40cb,0x632e2eea,0xe2c0e3f0,0x6f53b907
	.word  0xd4885c1f,0x624a8918,0x2e5c424c,0x37d08606
	.word  0x6fe5abfe,0xd7d95258,0x408b32f8,0x5222a9cd
	.word  0xf0b1e8d2,0xaec8d9e5,0x0fb32b74,0x58959972
	.word  0xb1557bf1,0xf789427e,0x397b8112,0xa2eb3c14
	.word  0x820a0930,0x1babab21,0x87a48c28,0xc4551b04
	.word  0x116ab0f3,0x8b66c470,0xbf162879,0x6f7b9f81
	.word  0xc859c757,0x44632d23,0xe61889f7,0x6df098c9
	.word  0x1551f0a3,0xef3c6c13,0x509bdb55,0x7b873439
	.word  0x7b969106,0x4361023d,0x6c54aa83,0x4eb23359
	.word  0x56b99981,0x24fe7e20,0x3e60d11f,0x25b8f06b
	.word  0xc6e21c43,0xd29c3f86,0x35948719,0x8fd43c15
	.word  0x0cfc75a7,0x1f82a623,0xdf9f0678,0xcbad59ad
	.word  0x96c4b534,0xf67fbdbf,0x85509639,0x74940088
	.word  0x3cb53a05,0xdb14a57d,0x5a662fed,0x0b64ea6b
	.word  0x3b72a74c,0x4d78a0ae,0xec26ee37,0x78915225
	.word  0x756f1fdc,0x4c5c98a9,0x42dd6957,0xbf0bfbb5
	.word  0xb26908b4,0x0199294b,0x62b2600e,0x348cacbc
	.word  0xb4de5345,0xbeb97212,0x4f09507a,0x3fc44ed0
	.word  0x7f10268d,0x01fd522e,0x603f9943,0xcbc2901d
	.word  0x573ca180,0xbca9ca0c,0x46eceead,0xe6e1700a
	.word  0x8fdc7963,0xbccd7e4d,0x4ee968b9,0xdfb06d0a
	.word  0x879cace0,0x98deff31,0xb46c7405,0xd7a71e4d
	.word  0x5e23fb98,0xd5c73ae3,0x4c6d40ca,0x90b1f1eb
	.word  0x49de16f4,0xd3669769,0x62d179b2,0x6300d60d
	.word  0xd6c1f48a,0x59d69e0e,0xcad68ea5,0xe81d3376
	.word  0x24c51f4b,0x74d3edfe,0x8bd76182,0xf1578c83
	.word  0x933297ae,0xe04ebcc0,0x863c12b0,0x118e7e1f
	.word  0x66b783c4,0xe97cb8c4,0x34c3c091,0x13a1a91f
	.word  0x467f984b,0x3eec8cd1,0x97d0d230,0x62e3d847
	.word  0x67d63868,0x4d828aac,0x54bc38d2,0xb94959f4
	.word  0x070716f1,0xa9a976d7,0x2afa42e2,0xfd002273
	.word  0x3571be9b,0x7d221e05,0x87e81694,0xcdbd6eda
	.word  0xdd610222,0x8d94ce6d,0xdcc59e6d,0x10c06b07
	.word  0xadf4a202,0xdd521b41,0xebfbf314,0x1963b7f1
	.word  0xc16ec117,0xd323ec4a,0x8fa92d93,0x0c8ae77c
	.word  0xee43778b,0x7c4c00f4,0x489e4b1d,0x35e74985
	.word  0x195f0e1b,0x5b4725ab,0xa26b5ce4,0x3b01601c
	.word  0xa2a3aa2c,0x36f13709,0x5dfe0e26,0xaa28f644
	.word  0x771aea67,0xd1011391,0xa7b865f9,0x7a6b49e0
	.word  0x1c6a5108,0x2a005a68,0xfd7d4ffa,0xd25f7cc7
	.word  0x788fed0f,0x11c5a7e5,0xb625392e,0x3255d1cf
	.word  0xcb510593,0x8d3cba71,0x4bcfabd2,0xe508aaaa
	.word  0x5f2267ab,0x594ecc8e,0x14ecc62b,0x7040bb04
	.word  0x2621504f,0x3709c2bf,0xff91f065,0xe2144a5e
	.word  0x684be5ee,0x134c7a21,0x797e9d7c,0xc39d0ff8
	.word  0x4094f0a5,0xdd16e96b,0xcfba610c,0x785173c5
	.word  0x47879039,0xabcf33c7,0x11e3c8a9,0xc14c5785
	.word  0x1ed6d178,0xe5879e68,0x6b196648,0xc304b18b
	.word  0x68a98f01,0x81e08d16,0x3588d451,0xc802cc8a
	.word  0x6766378e,0xf7b9fb48,0x5e57357f,0x13d1e52d
	.word  0xa35385dc,0x4f1e8fb2,0xd9428c90,0xe540e17e
	.word  0x049e59ed,0x73729f30,0x9443375a,0x36f8c42f
	.word  0x21668438,0xdc93ca5e,0x08b0cad1,0xde041753
	.word  0xe95f325a,0x97ff4270,0x3d89b4bc,0x975a06fe
	.word  0xe09a57f4,0xc54277d2,0x45d43237,0xd417ec1f
	.word  0x9ae3c981,0xe6689a8b,0xb5892ab2,0xd0f57a16
	.word  0x37f6626d,0xb73182e7,0x38dc2557,0xcce58866
	.word  0x75945bd4,0xc5d12d21,0x53b02435,0xb79aced3
	.word  0x6b77ba65,0x43d69f62,0x7fd9fcb8,0x3f61d298

!!# /************************************************************
!!# *
!!# * File:         stb4.j
!!# *
!!# * Description: Store buffer full condition with various
!!# * store types in a completely random order
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
!!#   IJ_set_ropr_fld (ijdefault, Ft_Rs1, "{4}");
!!#   IJ_set_ropr_fld (ijdefault, Ft_Rs2, "{5}");
!!#   IJ_set_ropr_fld (ijdefault, Ft_Rd, "{13..31}");
!!#   IJ_set_ropr_fld (ijdefault, Ft_Simm13, "13'b0rrrrrrrrrrrr");
!!#   IJ_set_ropr_fld (ijdefault, Fm_align_Simm13, "3'b111");
!!#   IJ_set_ropr_fld (ijdefault, Fm_align_Rd, "1'b1");
!!#   IJ_set_ropr_fld (ijdefault, Ft_Imm_Asi, "{0x80}");
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
!!# {
!!#    IJ_generate ("th", $2);
!!# }
!!# ;
!!# 
!!# inst_type: store | st_fp | atomic | st_ext_asi | st_int_asi 
!!# ;
!!# 
!!# store: tSTB_R | tSTB_I | tSTH_R | tSTH_I | tSTW_R | tSTW_I | tSTX_R | tSTX_I
!!# ;
!!# 
!!# st_fp: tSTF_R | tSTF_I | tSTDF_I | tSTDF_R 
!!# ;
!!# 
!!# atomic: tCASA_R | tCASA_I | tCASXA_R  | tCASXA_I  | tLDSTUBA_I | tLDSTUBA_R | tSWAP_I | tSWAP_R | tSWAPA_I | tSWAPA_R 
!!# ;
!!# 
!!# st_ext_asi: tSTBA_R | tSTHA_R | tSTWA_R | tSTXA_R | tSTDA_R | tSTBA_I | tSTHA_I | tSTWA_I | tSTXA_I | tSTDA_I
!!# ;
!!# 
!!# st_int_asi: d0 tSTXA_R %ropr Ro_int_asi 
!!# {$$ = $2}
!!# ;
!!# 
!!# //Rules for disambiguating the grammar
!!# 
!!# d0: mMETA0
!!# ;!! Token Generation Statistics
!! ---------------------------------
!! 
!! Rule   1 (line  105), Count:   499  inst_block           -> inst_type 
!! Rule   2 (line  106), Count:   499  inst_block           -> inst_block inst_type 
!! Rule   3 (line  112), Count:    77  inst_type            -> store 
!! Rule   4 (line  112), Count:    92  inst_type            -> st_fp 
!! Rule   5 (line  112), Count:    76  inst_type            -> atomic 
!! Rule   6 (line  112), Count:    83  inst_type            -> st_ext_asi 
!! Rule   7 (line  112), Count:   167  inst_type            -> st_int_asi 
!! Rule   8 (line  115), Count:    12  store                -> tSTB_R 
!! Rule   9 (line  115), Count:     3  store                -> tSTB_I 
!! Rule  10 (line  115), Count:     3  store                -> tSTH_R 
!! Rule  11 (line  115), Count:     8  store                -> tSTH_I 
!! Rule  12 (line  115), Count:    12  store                -> tSTW_R 
!! Rule  13 (line  115), Count:    11  store                -> tSTW_I 
!! Rule  14 (line  115), Count:    10  store                -> tSTX_R 
!! Rule  15 (line  115), Count:    11  store                -> tSTX_I 
!! Rule  16 (line  118), Count:    23  st_fp                -> tSTF_R 
!! Rule  17 (line  118), Count:    23  st_fp                -> tSTF_I 
!! Rule  18 (line  118), Count:    22  st_fp                -> tSTDF_I 
!! Rule  19 (line  118), Count:    21  st_fp                -> tSTDF_R 
!! Rule  20 (line  121), Count:     6  atomic               -> tCASA_R 
!! Rule  21 (line  121), Count:     4  atomic               -> tCASA_I 
!! Rule  22 (line  121), Count:    10  atomic               -> tCASXA_R 
!! Rule  23 (line  121), Count:     4  atomic               -> tCASXA_I 
!! Rule  24 (line  121), Count:     7  atomic               -> tLDSTUBA_I 
!! Rule  25 (line  121), Count:    11  atomic               -> tLDSTUBA_R 
!! Rule  26 (line  121), Count:     2  atomic               -> tSWAP_I 
!! Rule  27 (line  121), Count:     7  atomic               -> tSWAP_R 
!! Rule  28 (line  121), Count:     5  atomic               -> tSWAPA_I 
!! Rule  29 (line  121), Count:    11  atomic               -> tSWAPA_R 
!! Rule  30 (line  124), Count:     6  st_ext_asi           -> tSTBA_R 
!! Rule  31 (line  124), Count:    11  st_ext_asi           -> tSTHA_R 
!! Rule  32 (line  124), Count:    11  st_ext_asi           -> tSTWA_R 
!! Rule  33 (line  124), Count:     7  st_ext_asi           -> tSTXA_R 
!! Rule  34 (line  124), Count:     6  st_ext_asi           -> tSTDA_R 
!! Rule  35 (line  124), Count:     2  st_ext_asi           -> tSTBA_I 
!! Rule  36 (line  124), Count:     8  st_ext_asi           -> tSTHA_I 
!! Rule  37 (line  124), Count:     5  st_ext_asi           -> tSTWA_I 
!! Rule  38 (line  124), Count:     9  st_ext_asi           -> tSTXA_I 
!! Rule  39 (line  124), Count:     9  st_ext_asi           -> tSTDA_I 
!! Rule  40 (line  127), Count:   167  st_int_asi           -> d0 tSTXA_R 
!! 
!!   257: Token tSTB_R	Count = 13
!!   258: Token tSTB_I	Count = 4
!!   259: Token tSTH_R	Count = 4
!!   260: Token tSTH_I	Count = 9
!!   261: Token tSTW_R	Count = 13
!!   262: Token tSTW_I	Count = 12
!!   263: Token tSTX_R	Count = 11
!!   264: Token tSTX_I	Count = 12
!!   265: Token tSTF_R	Count = 24
!!   266: Token tSTF_I	Count = 24
!!   267: Token tSTDF_I	Count = 23
!!   268: Token tSTDF_R	Count = 22
!!   269: Token tCASA_R	Count = 7
!!   270: Token tCASA_I	Count = 5
!!   271: Token tCASXA_R	Count = 11
!!   272: Token tCASXA_I	Count = 5
!!   273: Token tLDSTUBA_I	Count = 8
!!   274: Token tLDSTUBA_R	Count = 12
!!   275: Token tSWAP_I	Count = 3
!!   276: Token tSWAP_R	Count = 8
!!   277: Token tSWAPA_I	Count = 6
!!   278: Token tSWAPA_R	Count = 12
!!   279: Token tSTBA_R	Count = 7
!!   280: Token tSTHA_R	Count = 12
!!   281: Token tSTWA_R	Count = 12
!!   282: Token tSTXA_R	Count = 92
!!   283: Token tSTDA_R	Count = 7
!!   284: Token tSTBA_I	Count = 3
!!   285: Token tSTHA_I	Count = 9
!!   286: Token tSTWA_I	Count = 6
!!   287: Token tSTXA_I	Count = 10
!!   288: Token tSTDA_I	Count = 10
!!   289: Token mMETA0	Count = 84
!! 
!! 
!! +++ finish +++

