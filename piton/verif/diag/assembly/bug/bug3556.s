// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: bug3556.s
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
   random seed:	826416015
   Jal divs0_0.j:	
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
        setx  MAIN_BASE_DATA_VA, %r1, %r8
        setx  0x0000000000000a70, %g1, %r9
        setx  0x80, %g2, %g1
        wr  %g1, %g0, %asi
	    rd %fprs, %g1
        wr %g1, 0x4, %fprs
	ldd	[%r8 + 0], %f0
	ldd	[%r8 + 8], %f2
	ldd	[%r8 + 16], %f4
	ldd	[%r8 + 24], %f6
	ldd	[%r8 + 32], %f8
	ldd	[%r8 + 40], %f10
	ldd	[%r8 + 48], %f12
	ldd	[%r8 + 56], %f14
	ldd	[%r8 + 64], %f16
	ldd	[%r8 + 72], %f18
	ldd	[%r8 + 80], %f20
	ldd	[%r8 + 88], %f22
	ldd	[%r8 + 96], %f24
	ldd	[%r8 + 104], %f26
	ldd	[%r8 + 112], %f28
	ldd	[%r8 + 120], %f30
	ldd	[%r8 + 128], %f32
	ldd	[%r8 + 136], %f34
	ldd	[%r8 + 144], %f36
	ldd	[%r8 + 152], %f38
	ldd	[%r8 + 160], %f40
	ldd	[%r8 + 168], %f42
	ldd	[%r8 + 176], %f44
	ldd	[%r8 + 184], %f46
	ldd	[%r8 + 192], %f48
	ldd	[%r8 + 200], %f50
	ldd	[%r8 + 208], %f52
	ldd	[%r8 + 216], %f54
	ldd	[%r8 + 224], %f56
	ldd	[%r8 + 232], %f58
	ldd	[%r8 + 240], %f60
	ldd	[%r8 + 248], %f62
        setx  0x0b0d81f0fe3af56d, %g1, %r0
        setx  0x0a3eae6909e3226e, %g1, %r1
        setx  0xa2495705d46d52a4, %g1, %r2
        setx  0x2d9e5f15043844e5, %g1, %r3
        setx  0x7e09faa6b41e3b5f, %g1, %r4
        setx  0x1378554fe8c7ea0f, %g1, %r5
        setx  0x451bd698d5784bb2, %g1, %r6
        setx  0xa9cfe15e4b8b44f8, %g1, %r7
        setx  0xc6af7c420eceacd0, %g1, %r10
        setx  0x38c92734294f9e0a, %g1, %r11
        setx  0xf923bf91a0beadef, %g1, %r12
        setx  0x62f6d05fb5a0f1c3, %g1, %r13
        setx  0x1b33d7034741e8fe, %g1, %r14
        setx  0xcb5ccf4c3657a04e, %g1, %r15
        setx  0x206434f38d868fa2, %g1, %r16
        setx  0x9ab28d1371472bae, %g1, %r17
        setx  0x908cb67f8b23850a, %g1, %r18
        setx  0x3f209fd0519355ba, %g1, %r19
        setx  0x842823998005337e, %g1, %r20
        setx  0xefd36ea4e6e9313a, %g1, %r21
        setx  0xc4787cc8347a15e3, %g1, %r22
        setx  0xa273010e549103dd, %g1, %r23
        setx  0x4cd7b8fbba46e81b, %g1, %r24
        setx  0xdd3291283d17effe, %g1, %r25
        setx  0xf94c8d49300d31ac, %g1, %r26
        setx  0xe00e0fc930b1614c, %g1, %r27
        setx  0xabc0527c85b2ec13, %g1, %r28
        setx  0xc49efe1473900c0d, %g1, %r29
        setx  0x371a1b257dcd914c, %g1, %r30
        setx  0xa8996987094bf929, %g1, %r31
	.word 0x8a6a0009  ! 1: UDIVX_R	udivx 	%r8, %r9, %r5
	.word 0x8a720009  ! 3: UDIV_R	udiv 	%r8, %r9, %r5
	.word 0x94fa0009  ! 4: SDIVcc_R	sdivcc 	%r8, %r9, %r10
	.word 0x866a0009  ! 5: UDIVX_R	udivx 	%r8, %r9, %r3
	.word 0x847a2260  ! 6: SDIV_I	sdiv 	%r8, 0x0260, %r2
	.word 0x836a2168  ! 11: SDIVX_I	sdivx	%r8, 0x0168, %r1
	.word 0x84fa2724  ! 16: SDIVcc_I	sdivcc 	%r8, 0x0724, %r2
	.word 0x84720009  ! 17: UDIV_R	udiv 	%r8, %r9, %r2
	.word 0x8a7a0009  ! 22: SDIV_R	sdiv 	%r8, %r9, %r5
	.word 0x8e6a0009  ! 27: UDIVX_R	udivx 	%r8, %r9, %r7
	.word 0x866a0009  ! 30: UDIVX_R	udivx 	%r8, %r9, %r3
	.word 0x88f221ac  ! 33: UDIVcc_I	udivcc 	%r8, 0x01ac, %r4
	.word 0xa07a0009  ! 34: SDIV_R	sdiv 	%r8, %r9, %r16
	.word 0x8af20009  ! 35: UDIVcc_R	udivcc 	%r8, %r9, %r5
	.word 0xbef22770  ! 36: UDIVcc_I	udivcc 	%r8, 0x0770, %r31
	.word 0xb2720009  ! 38: UDIV_R	udiv 	%r8, %r9, %r25
	.word 0xa36a0009  ! 49: SDIVX_R	sdivx	%r8, %r9, %r17
	.word 0x88f20009  ! 54: UDIVcc_R	udivcc 	%r8, %r9, %r4
	.word 0x946a0009  ! 55: UDIVX_R	udivx 	%r8, %r9, %r10
	.word 0x9cf20009  ! 56: UDIVcc_R	udivcc 	%r8, %r9, %r14
	.word 0x996a0009  ! 57: SDIVX_R	sdivx	%r8, %r9, %r12
	.word 0x866a0009  ! 58: UDIVX_R	udivx 	%r8, %r9, %r3
	.word 0x86f20009  ! 64: UDIVcc_R	udivcc 	%r8, %r9, %r3
	.word 0x82720009  ! 67: UDIV_R	udiv 	%r8, %r9, %r1
	.word 0x88fa2f94  ! 68: SDIVcc_I	sdivcc 	%r8, 0x0f94, %r4
	.word 0x8e720009  ! 69: UDIV_R	udiv 	%r8, %r9, %r7
	.word 0x86720009  ! 70: UDIV_R	udiv 	%r8, %r9, %r3
	.word 0x8ef22478  ! 71: UDIVcc_I	udivcc 	%r8, 0x0478, %r7
	.word 0x9e7228f4  ! 84: UDIV_I	udiv 	%r8, 0x08f4, %r15
	.word 0x9ef226a4  ! 85: UDIVcc_I	udivcc 	%r8, 0x06a4, %r15
	.word 0xa8f2279c  ! 86: UDIVcc_I	udivcc 	%r8, 0x079c, %r20
	.word 0xb6722cd4  ! 87: UDIV_I	udiv 	%r8, 0x0cd4, %r27
	.word 0xac7a0009  ! 88: SDIV_R	sdiv 	%r8, %r9, %r22
	.word 0xb2fa20e0  ! 91: SDIVcc_I	sdivcc 	%r8, 0x00e0, %r25
	.word 0x967a208c  ! 92: SDIV_I	sdiv 	%r8, 0x008c, %r11
	.word 0xb27a2190  ! 94: SDIV_I	sdiv 	%r8, 0x0190, %r25
	.word 0x86f222dc  ! 97: UDIVcc_I	udivcc 	%r8, 0x02dc, %r3
	.word 0x9e720009  ! 100: UDIV_R	udiv 	%r8, %r9, %r15
	.word 0x8ef22df0  ! 110: UDIVcc_I	udivcc 	%r8, 0x0df0, %r7
	.word 0xae6a2894  ! 112: UDIVX_I	udivx 	%r8, 0x0894, %r23
	.word 0x887a0009  ! 117: SDIV_R	sdiv 	%r8, %r9, %r4
	.word 0xa6720009  ! 118: UDIV_R	udiv 	%r8, %r9, %r19
	.word 0x84f22268  ! 119: UDIVcc_I	udivcc 	%r8, 0x0268, %r2
	.word 0x876a2688  ! 120: SDIVX_I	sdivx	%r8, 0x0688, %r3
	.word 0x8afa0009  ! 125: SDIVcc_R	sdivcc 	%r8, %r9, %r5
	.word 0x866a2f34  ! 126: UDIVX_I	udivx 	%r8, 0x0f34, %r3
	.word 0x88fa0009  ! 127: SDIVcc_R	sdivcc 	%r8, %r9, %r4
	.word 0x8afa2428  ! 130: SDIVcc_I	sdivcc 	%r8, 0x0428, %r5
	.word 0x8e722e00  ! 131: UDIV_I	udiv 	%r8, 0x0e00, %r7
	.word 0x8a7a28ac  ! 132: SDIV_I	sdiv 	%r8, 0x08ac, %r5
	.word 0x847a28c8  ! 133: SDIV_I	sdiv 	%r8, 0x08c8, %r2
	.word 0x8d6a0009  ! 140: SDIVX_R	sdivx	%r8, %r9, %r6
	.word 0xbc720009  ! 143: UDIV_R	udiv 	%r8, %r9, %r30
	.word 0xbef2202c  ! 148: UDIVcc_I	udivcc 	%r8, 0x002c, %r31
	.word 0x8c6a2574  ! 149: UDIVX_I	udivx 	%r8, 0x0574, %r6
	.word 0xa8fa227c  ! 161: SDIVcc_I	sdivcc 	%r8, 0x027c, %r20
	.word 0xa46a0009  ! 162: UDIVX_R	udivx 	%r8, %r9, %r18
	.word 0x847a2364  ! 163: SDIV_I	sdiv 	%r8, 0x0364, %r2
	.word 0x836a0009  ! 168: SDIVX_R	sdivx	%r8, %r9, %r1
	.word 0x8a6a2d98  ! 169: UDIVX_I	udivx 	%r8, 0x0d98, %r5
	.word 0x8c6a2da0  ! 170: UDIVX_I	udivx 	%r8, 0x0da0, %r6
	.word 0x886a0009  ! 171: UDIVX_R	udivx 	%r8, %r9, %r4
	.word 0x88fa0009  ! 173: SDIVcc_R	sdivcc 	%r8, %r9, %r4
	.word 0x8e7a2490  ! 176: SDIV_I	sdiv 	%r8, 0x0490, %r7
	.word 0xac7227a4  ! 183: UDIV_I	udiv 	%r8, 0x07a4, %r22
	.word 0x847a26d0  ! 184: SDIV_I	sdiv 	%r8, 0x06d0, %r2
	.word 0x84f22504  ! 191: UDIVcc_I	udivcc 	%r8, 0x0504, %r2
	.word 0xa66a0009  ! 192: UDIVX_R	udivx 	%r8, %r9, %r19
	.word 0x84f227c0  ! 195: UDIVcc_I	udivcc 	%r8, 0x07c0, %r2
	.word 0x896a0009  ! 198: SDIVX_R	sdivx	%r8, %r9, %r4
	.word 0xb87a0009  ! 206: SDIV_R	sdiv 	%r8, %r9, %r28
	.word 0x827a0009  ! 211: SDIV_R	sdiv 	%r8, %r9, %r1
	.word 0x94722570  ! 212: UDIV_I	udiv 	%r8, 0x0570, %r10
	.word 0x96fa21e8  ! 213: SDIVcc_I	sdivcc 	%r8, 0x01e8, %r11
	.word 0x86fa0009  ! 225: SDIVcc_R	sdivcc 	%r8, %r9, %r3
	.word 0x86fa28c8  ! 230: SDIVcc_I	sdivcc 	%r8, 0x08c8, %r3
	.word 0x88fa0009  ! 233: SDIVcc_R	sdivcc 	%r8, %r9, %r4
	.word 0x88fa0009  ! 234: SDIVcc_R	sdivcc 	%r8, %r9, %r4
	.word 0x826a203c  ! 238: UDIVX_I	udivx 	%r8, 0x003c, %r1
	.word 0x8efa238c  ! 241: SDIVcc_I	sdivcc 	%r8, 0x038c, %r7
	.word 0x886a0009  ! 242: UDIVX_R	udivx 	%r8, %r9, %r4
	.word 0xa56a2940  ! 246: SDIVX_I	sdivx	%r8, 0x0940, %r18
	.word 0xb8722c40  ! 251: UDIV_I	udiv 	%r8, 0x0c40, %r28
	.word 0x82f20009  ! 252: UDIVcc_R	udivcc 	%r8, %r9, %r1
	.word 0x86f22d28  ! 253: UDIVcc_I	udivcc 	%r8, 0x0d28, %r3
	.word 0x8e7a0009  ! 262: SDIV_R	sdiv 	%r8, %r9, %r7
	.word 0x86fa260c  ! 267: SDIVcc_I	sdivcc 	%r8, 0x060c, %r3
	.word 0x8ef22770  ! 272: UDIVcc_I	udivcc 	%r8, 0x0770, %r7
	.word 0x886a0009  ! 273: UDIVX_R	udivx 	%r8, %r9, %r4
	.word 0x847a2f2c  ! 274: SDIV_I	sdiv 	%r8, 0x0f2c, %r2
	.word 0x8e7a0009  ! 275: SDIV_R	sdiv 	%r8, %r9, %r7
	.word 0x8d6a2288  ! 276: SDIVX_I	sdivx	%r8, 0x0288, %r6
	.word 0x8cf20009  ! 277: UDIVcc_R	udivcc 	%r8, %r9, %r6
	.word 0xbc7a2594  ! 283: SDIV_I	sdiv 	%r8, 0x0594, %r30
	.word 0x82f22048  ! 284: UDIVcc_I	udivcc 	%r8, 0x0048, %r1
	.word 0x86f22074  ! 291: UDIVcc_I	udivcc 	%r8, 0x0074, %r3
	.word 0xa66a0009  ! 296: UDIVX_R	udivx 	%r8, %r9, %r19
	.word 0x847a0009  ! 297: SDIV_R	sdiv 	%r8, %r9, %r2
	.word 0x8cf20009  ! 298: UDIVcc_R	udivcc 	%r8, %r9, %r6
	.word 0xbb6a0009  ! 299: SDIVX_R	sdivx	%r8, %r9, %r29
	.word 0x8a6a2b68  ! 304: UDIVX_I	udivx 	%r8, 0x0b68, %r5
	.word 0xac722f48  ! 312: UDIV_I	udiv 	%r8, 0x0f48, %r22
	.word 0x8ef20009  ! 316: UDIVcc_R	udivcc 	%r8, %r9, %r7
	.word 0x8efa2e1c  ! 322: SDIVcc_I	sdivcc 	%r8, 0x0e1c, %r7
	.word 0x88fa0009  ! 325: SDIVcc_R	sdivcc 	%r8, %r9, %r4
	.word 0x8e7a2d34  ! 330: SDIV_I	sdiv 	%r8, 0x0d34, %r7
	.word 0xbefa0009  ! 339: SDIVcc_R	sdivcc 	%r8, %r9, %r31
	.word 0x866a24a4  ! 340: UDIVX_I	udivx 	%r8, 0x04a4, %r3
	.word 0x86f20009  ! 355: UDIVcc_R	udivcc 	%r8, %r9, %r3
	.word 0xbefa0009  ! 367: SDIVcc_R	sdivcc 	%r8, %r9, %r31
	.word 0x8b6a0009  ! 379: SDIVX_R	sdivx	%r8, %r9, %r5
	.word 0xbe7a0009  ! 380: SDIV_R	sdiv 	%r8, %r9, %r31
	.word 0x8d6a0009  ! 390: SDIVX_R	sdivx	%r8, %r9, %r6
	.word 0x8efa2e00  ! 391: SDIVcc_I	sdivcc 	%r8, 0x0e00, %r7
	.word 0x836a0009  ! 394: SDIVX_R	sdivx	%r8, %r9, %r1
	.word 0x8a7226b0  ! 395: UDIV_I	udiv 	%r8, 0x06b0, %r5
	.word 0x8e7a2acc  ! 398: SDIV_I	sdiv 	%r8, 0x0acc, %r7
	.word 0x8e722268  ! 403: UDIV_I	udiv 	%r8, 0x0268, %r7
	.word 0xbaf22f84  ! 404: UDIVcc_I	udivcc 	%r8, 0x0f84, %r29
	.word 0xbcfa2748  ! 405: SDIVcc_I	sdivcc 	%r8, 0x0748, %r30
	.word 0x8e6a26d0  ! 406: UDIVX_I	udivx 	%r8, 0x06d0, %r7
	.word 0x8a6a283c  ! 413: UDIVX_I	udivx 	%r8, 0x083c, %r5
	.word 0x887a0009  ! 414: SDIV_R	sdiv 	%r8, %r9, %r4
	.word 0x98f20009  ! 415: UDIVcc_R	udivcc 	%r8, %r9, %r12
	.word 0x82fa2688  ! 416: SDIVcc_I	sdivcc 	%r8, 0x0688, %r1
	.word 0x8f6a0009  ! 456: SDIVX_R	sdivx	%r8, %r9, %r7
	.word 0x866a2dd4  ! 463: UDIVX_I	udivx 	%r8, 0x0dd4, %r3
	.word 0x8e6a21e8  ! 471: UDIVX_I	udivx 	%r8, 0x01e8, %r7
	.word 0x82fa2514  ! 472: SDIVcc_I	sdivcc 	%r8, 0x0514, %r1
	.word 0x86f22260  ! 473: UDIVcc_I	udivcc 	%r8, 0x0260, %r3
	.word 0x9a6a2724  ! 474: UDIVX_I	udivx 	%r8, 0x0724, %r13
	.word 0x8efa2718  ! 475: SDIVcc_I	sdivcc 	%r8, 0x0718, %r7
	.word 0x98fa2c8c  ! 484: SDIVcc_I	sdivcc 	%r8, 0x0c8c, %r12
	.word 0xb67a0009  ! 497: SDIV_R	sdiv 	%r8, %r9, %r27
	.word 0x9e7a2084  ! 499: SDIV_I	sdiv 	%r8, 0x0084, %r15
	.word 0x9af2227c  ! 501: UDIVcc_I	udivcc 	%r8, 0x027c, %r13
	.word 0x887a20fc  ! 503: SDIV_I	sdiv 	%r8, 0x00fc, %r4
	.word 0xacfa0009  ! 507: SDIVcc_R	sdivcc 	%r8, %r9, %r22
	.word 0x847a0009  ! 512: SDIV_R	sdiv 	%r8, %r9, %r2
	.word 0x8afa2138  ! 513: SDIVcc_I	sdivcc 	%r8, 0x0138, %r5
	.word 0x88fa2fd8  ! 514: SDIVcc_I	sdivcc 	%r8, 0x0fd8, %r4
	.word 0x9b6a21e4  ! 515: SDIVX_I	sdivx	%r8, 0x01e4, %r13
	.word 0x847a2390  ! 518: SDIV_I	sdiv 	%r8, 0x0390, %r2
	.word 0x84f20009  ! 527: UDIVcc_R	udivcc 	%r8, %r9, %r2
	.word 0x82f20009  ! 528: UDIVcc_R	udivcc 	%r8, %r9, %r1
	.word 0x8f6a2e10  ! 529: SDIVX_I	sdivx	%r8, 0x0e10, %r7
	.word 0xb16a2194  ! 530: SDIVX_I	sdivx	%r8, 0x0194, %r24
	.word 0x8af22450  ! 531: UDIVcc_I	udivcc 	%r8, 0x0450, %r5
	.word 0x8a6a0009  ! 532: UDIVX_R	udivx 	%r8, %r9, %r5
	.word 0x8e7229b4  ! 533: UDIV_I	udiv 	%r8, 0x09b4, %r7
	.word 0x8e722748  ! 537: UDIV_I	udiv 	%r8, 0x0748, %r7
	.word 0xbe7a2048  ! 538: SDIV_I	sdiv 	%r8, 0x0048, %r31
	.word 0x8c6a20f8  ! 539: UDIVX_I	udivx 	%r8, 0x00f8, %r6
	.word 0x82fa0009  ! 544: SDIVcc_R	sdivcc 	%r8, %r9, %r1
	.word 0x8872238c  ! 545: UDIV_I	udiv 	%r8, 0x038c, %r4
	.word 0xaa7a2d44  ! 546: SDIV_I	sdiv 	%r8, 0x0d44, %r21
	.word 0xa4720009  ! 547: UDIV_R	udiv 	%r8, %r9, %r18
	.word 0x867a2d90  ! 548: SDIV_I	sdiv 	%r8, 0x0d90, %r3
	.word 0x8c720009  ! 555: UDIV_R	udiv 	%r8, %r9, %r6
	.word 0x8c7a0009  ! 560: SDIV_R	sdiv 	%r8, %r9, %r6
	.word 0x8afa0009  ! 561: SDIVcc_R	sdivcc 	%r8, %r9, %r5
	.word 0xa27a0009  ! 564: SDIV_R	sdiv 	%r8, %r9, %r17
	.word 0x8e720009  ! 569: UDIV_R	udiv 	%r8, %r9, %r7
	.word 0x8ef22f5c  ! 572: UDIVcc_I	udivcc 	%r8, 0x0f5c, %r7
	.word 0x966a2178  ! 582: UDIVX_I	udivx 	%r8, 0x0178, %r11
	.word 0x8c7a0009  ! 583: SDIV_R	sdiv 	%r8, %r9, %r6
	.word 0x867a0009  ! 584: SDIV_R	sdiv 	%r8, %r9, %r3
	.word 0x827a0009  ! 595: SDIV_R	sdiv 	%r8, %r9, %r1
	.word 0x98fa2064  ! 596: SDIVcc_I	sdivcc 	%r8, 0x0064, %r12
	.word 0x8a6a0009  ! 598: UDIVX_R	udivx 	%r8, %r9, %r5
	.word 0x8e7a0009  ! 601: SDIV_R	sdiv 	%r8, %r9, %r7
	.word 0xac720009  ! 602: UDIV_R	udiv 	%r8, %r9, %r22
	.word 0x8e720009  ! 610: UDIV_R	udiv 	%r8, %r9, %r7
	.word 0x876a0009  ! 611: SDIVX_R	sdivx	%r8, %r9, %r3
	.word 0x88f22080  ! 614: UDIVcc_I	udivcc 	%r8, 0x0080, %r4
	.word 0x8c6a0009  ! 615: UDIVX_R	udivx 	%r8, %r9, %r6
	.word 0x82f20009  ! 619: UDIVcc_R	udivcc 	%r8, %r9, %r1
	.word 0x8e6a0009  ! 620: UDIVX_R	udivx 	%r8, %r9, %r7
	.word 0x8c722ef8  ! 621: UDIV_I	udiv 	%r8, 0x0ef8, %r6
	.word 0x8cfa2298  ! 622: SDIVcc_I	sdivcc 	%r8, 0x0298, %r6
	.word 0x876a0009  ! 623: SDIVX_R	sdivx	%r8, %r9, %r3
	.word 0x8e722510  ! 632: UDIV_I	udiv 	%r8, 0x0510, %r7
	.word 0x8d6a0009  ! 634: SDIVX_R	sdivx	%r8, %r9, %r6
	.word 0x8e7a2480  ! 635: SDIV_I	sdiv 	%r8, 0x0480, %r7
	.word 0x8e7a0009  ! 636: SDIV_R	sdiv 	%r8, %r9, %r7
	.word 0xa47224a0  ! 637: UDIV_I	udiv 	%r8, 0x04a0, %r18
	.word 0x867a2314  ! 642: SDIV_I	sdiv 	%r8, 0x0314, %r3
	.word 0x84722f64  ! 644: UDIV_I	udiv 	%r8, 0x0f64, %r2
	.word 0x82fa275c  ! 645: SDIVcc_I	sdivcc 	%r8, 0x075c, %r1
	.word 0x9a7a0009  ! 646: SDIV_R	sdiv 	%r8, %r9, %r13
	.word 0xb2f20009  ! 653: UDIVcc_R	udivcc 	%r8, %r9, %r25
	.word 0x8e722658  ! 654: UDIV_I	udiv 	%r8, 0x0658, %r7
	.word 0xb16a24bc  ! 664: SDIVX_I	sdivx	%r8, 0x04bc, %r24
	.word 0x9cf20009  ! 665: UDIVcc_R	udivcc 	%r8, %r9, %r14
	.word 0x9afa2ca0  ! 666: SDIVcc_I	sdivcc 	%r8, 0x0ca0, %r13
	.word 0xb2fa2be4  ! 672: SDIVcc_I	sdivcc 	%r8, 0x0be4, %r25
	.word 0x82720009  ! 677: UDIV_R	udiv 	%r8, %r9, %r1
	.word 0xbafa0009  ! 679: SDIVcc_R	sdivcc 	%r8, %r9, %r29
	.word 0x8c720009  ! 680: UDIV_R	udiv 	%r8, %r9, %r6
	.word 0x88fa0009  ! 685: SDIVcc_R	sdivcc 	%r8, %r9, %r4
	.word 0x8c7a25b4  ! 686: SDIV_I	sdiv 	%r8, 0x05b4, %r6
	.word 0xb27a2c74  ! 687: SDIV_I	sdiv 	%r8, 0x0c74, %r25
	.word 0x88f20009  ! 688: UDIVcc_R	udivcc 	%r8, %r9, %r4
	.word 0xb2fa0009  ! 689: SDIVcc_R	sdivcc 	%r8, %r9, %r25
	.word 0xacf20009  ! 690: UDIVcc_R	udivcc 	%r8, %r9, %r22
	.word 0x8c7a2820  ! 695: SDIV_I	sdiv 	%r8, 0x0820, %r6
	.word 0x876a2e7c  ! 702: SDIVX_I	sdivx	%r8, 0x0e7c, %r3
	.word 0x876a2d34  ! 706: SDIVX_I	sdivx	%r8, 0x0d34, %r3
	.word 0xa4fa0009  ! 707: SDIVcc_R	sdivcc 	%r8, %r9, %r18
	.word 0x8e720009  ! 708: UDIV_R	udiv 	%r8, %r9, %r7
	.word 0xa46a0009  ! 711: UDIVX_R	udivx 	%r8, %r9, %r18
	.word 0xbb6a2774  ! 712: SDIVX_I	sdivx	%r8, 0x0774, %r29
	.word 0x84f2227c  ! 724: UDIVcc_I	udivcc 	%r8, 0x027c, %r2
	.word 0x8efa0009  ! 725: SDIVcc_R	sdivcc 	%r8, %r9, %r7
	.word 0x9ef20009  ! 726: UDIVcc_R	udivcc 	%r8, %r9, %r15
	.word 0x88f22294  ! 728: UDIVcc_I	udivcc 	%r8, 0x0294, %r4
	.word 0xbf6a0009  ! 731: SDIVX_R	sdivx	%r8, %r9, %r31
	.word 0xa87226b8  ! 732: UDIV_I	udiv 	%r8, 0x06b8, %r20
	.word 0x8ef22c0c  ! 735: UDIVcc_I	udivcc 	%r8, 0x0c0c, %r7
	.word 0xaa6a20b4  ! 743: UDIVX_I	udivx 	%r8, 0x00b4, %r21
	.word 0xa4f20009  ! 744: UDIVcc_R	udivcc 	%r8, %r9, %r18
	.word 0x8cf22664  ! 751: UDIVcc_I	udivcc 	%r8, 0x0664, %r6
	.word 0xb2fa2ab4  ! 752: SDIVcc_I	sdivcc 	%r8, 0x0ab4, %r25
	.word 0x84720009  ! 753: UDIV_R	udiv 	%r8, %r9, %r2
	.word 0x86f22ca8  ! 758: UDIVcc_I	udivcc 	%r8, 0x0ca8, %r3
	.word 0x886a0009  ! 759: UDIVX_R	udivx 	%r8, %r9, %r4
	.word 0xbefa2a90  ! 762: SDIVcc_I	sdivcc 	%r8, 0x0a90, %r31
	.word 0x8e720009  ! 767: UDIV_R	udiv 	%r8, %r9, %r7
	.word 0xb36a2c6c  ! 768: SDIVX_I	sdivx	%r8, 0x0c6c, %r25
	.word 0x8efa22a0  ! 776: SDIVcc_I	sdivcc 	%r8, 0x02a0, %r7
	.word 0x846a2668  ! 791: UDIVX_I	udivx 	%r8, 0x0668, %r2
	.word 0x836a0009  ! 802: SDIVX_R	sdivx	%r8, %r9, %r1
	.word 0x856a2870  ! 807: SDIVX_I	sdivx	%r8, 0x0870, %r2
	.word 0x88fa2bdc  ! 811: SDIVcc_I	sdivcc 	%r8, 0x0bdc, %r4
	.word 0x8ef20009  ! 815: UDIVcc_R	udivcc 	%r8, %r9, %r7
	.word 0x8afa0009  ! 816: SDIVcc_R	sdivcc 	%r8, %r9, %r5
	.word 0x84f20009  ! 817: UDIVcc_R	udivcc 	%r8, %r9, %r2
	.word 0xb8f22918  ! 820: UDIVcc_I	udivcc 	%r8, 0x0918, %r28
	.word 0x867a2ec8  ! 829: SDIV_I	sdiv 	%r8, 0x0ec8, %r3
	.word 0x82f2292c  ! 830: UDIVcc_I	udivcc 	%r8, 0x092c, %r1
	.word 0x8f6a0009  ! 831: SDIVX_R	sdivx	%r8, %r9, %r7
	.word 0xa86a2234  ! 835: UDIVX_I	udivx 	%r8, 0x0234, %r20
	.word 0xa2722638  ! 840: UDIV_I	udiv 	%r8, 0x0638, %r17
	.word 0x82722cfc  ! 841: UDIV_I	udiv 	%r8, 0x0cfc, %r1
	.word 0xbafa20e4  ! 853: SDIVcc_I	sdivcc 	%r8, 0x00e4, %r29
	.word 0x886a0009  ! 856: UDIVX_R	udivx 	%r8, %r9, %r4
	.word 0x826a2bf4  ! 857: UDIVX_I	udivx 	%r8, 0x0bf4, %r1
	.word 0x8af20009  ! 860: UDIVcc_R	udivcc 	%r8, %r9, %r5
	.word 0x82720009  ! 861: UDIV_R	udiv 	%r8, %r9, %r1
	.word 0xbc7a2d04  ! 862: SDIV_I	sdiv 	%r8, 0x0d04, %r30
	.word 0x9c720009  ! 863: UDIV_R	udiv 	%r8, %r9, %r14
	.word 0x8d6a2994  ! 872: SDIVX_I	sdivx	%r8, 0x0994, %r6
	.word 0x8cfa0009  ! 874: SDIVcc_R	sdivcc 	%r8, %r9, %r6
	.word 0x847a0009  ! 877: SDIV_R	sdiv 	%r8, %r9, %r2
	.word 0x86f20009  ! 878: UDIVcc_R	udivcc 	%r8, %r9, %r3
	.word 0x896a0009  ! 882: SDIVX_R	sdivx	%r8, %r9, %r4
	.word 0x9cf20009  ! 883: UDIVcc_R	udivcc 	%r8, %r9, %r14
	.word 0x8ef20009  ! 884: UDIVcc_R	udivcc 	%r8, %r9, %r7
	.word 0x887a2b88  ! 887: SDIV_I	sdiv 	%r8, 0x0b88, %r4
	.word 0x8c7a0009  ! 888: SDIV_R	sdiv 	%r8, %r9, %r6
	.word 0x86720009  ! 896: UDIV_R	udiv 	%r8, %r9, %r3
	.word 0x8c722818  ! 897: UDIV_I	udiv 	%r8, 0x0818, %r6
	.word 0x82fa2cf4  ! 906: SDIVcc_I	sdivcc 	%r8, 0x0cf4, %r1
	.word 0x896a28a8  ! 907: SDIVX_I	sdivx	%r8, 0x08a8, %r4
	.word 0x896a0009  ! 908: SDIVX_R	sdivx	%r8, %r9, %r4
	.word 0xab6a2c68  ! 910: SDIVX_I	sdivx	%r8, 0x0c68, %r21
	.word 0x8a6a0009  ! 916: UDIVX_R	udivx 	%r8, %r9, %r5
	.word 0x846a2f44  ! 921: UDIVX_I	udivx 	%r8, 0x0f44, %r2
	.word 0xa2f20009  ! 922: UDIVcc_R	udivcc 	%r8, %r9, %r17
	.word 0xa46a0009  ! 933: UDIVX_R	udivx 	%r8, %r9, %r18
	.word 0x827a2480  ! 936: SDIV_I	sdiv 	%r8, 0x0480, %r1
	.word 0x98f22afc  ! 939: UDIVcc_I	udivcc 	%r8, 0x0afc, %r12
	.word 0x8c7a2cac  ! 940: SDIV_I	sdiv 	%r8, 0x0cac, %r6
	.word 0x8b6a27c0  ! 941: SDIVX_I	sdivx	%r8, 0x07c0, %r5
	.word 0x84fa0009  ! 944: SDIVcc_R	sdivcc 	%r8, %r9, %r2
	.word 0x886a0009  ! 945: UDIVX_R	udivx 	%r8, %r9, %r4
	.word 0xbefa0009  ! 946: SDIVcc_R	sdivcc 	%r8, %r9, %r31
	.word 0x8c722210  ! 949: UDIV_I	udiv 	%r8, 0x0210, %r6
	.word 0x84f20009  ! 951: UDIVcc_R	udivcc 	%r8, %r9, %r2
	.word 0x8e7a0009  ! 952: SDIV_R	sdiv 	%r8, %r9, %r7
	.word 0x866a0009  ! 955: UDIVX_R	udivx 	%r8, %r9, %r3
	.word 0x867a0009  ! 956: SDIV_R	sdiv 	%r8, %r9, %r3
	.word 0xa4f20009  ! 959: UDIVcc_R	udivcc 	%r8, %r9, %r18
	.word 0x847a0009  ! 968: SDIV_R	sdiv 	%r8, %r9, %r2
	.word 0x8e72280c  ! 971: UDIV_I	udiv 	%r8, 0x080c, %r7
	.word 0x847a2e3c  ! 972: SDIV_I	sdiv 	%r8, 0x0e3c, %r2
	.word 0xa16a2c24  ! 973: SDIVX_I	sdivx	%r8, 0x0c24, %r16
	.word 0x8c6a0009  ! 976: UDIVX_R	udivx 	%r8, %r9, %r6
	.word 0x876a2308  ! 979: SDIVX_I	sdivx	%r8, 0x0308, %r3
	.word 0xa76a297c  ! 980: SDIVX_I	sdivx	%r8, 0x097c, %r19
	.word 0xa6720009  ! 981: UDIV_R	udiv 	%r8, %r9, %r19
	.word 0x8f6a2820  ! 982: SDIVX_I	sdivx	%r8, 0x0820, %r7
	.word 0xa86a2e3c  ! 983: UDIVX_I	udivx 	%r8, 0x0e3c, %r20
	.word 0x8e720009  ! 984: UDIV_R	udiv 	%r8, %r9, %r7
	.word 0x8b6a0009  ! 985: SDIVX_R	sdivx	%r8, %r9, %r5
	.word 0xa2f22de0  ! 986: UDIVcc_I	udivcc 	%r8, 0x0de0, %r17
	.word 0x8a6a0009  ! 987: UDIVX_R	udivx 	%r8, %r9, %r5
	.word 0xba722278  ! 988: UDIV_I	udiv 	%r8, 0x0278, %r29
	.word 0x84f20009  ! 990: UDIVcc_R	udivcc 	%r8, %r9, %r2
	.word 0x9e6a0009  ! 996: UDIVX_R	udivx 	%r8, %r9, %r15
	.word 0x86fa228c  ! 999: SDIVcc_I	sdivcc 	%r8, 0x028c, %r3
	nop
	nop
	nop
        ta      T_GOOD_TRAP

th_main_1:
        setx  MAIN_BASE_DATA_VA, %r1, %r8
        setx  0x0000000000000a70, %g1, %r9
        setx  0x80, %g2, %g1
        wr  %g1, %g0, %asi
	    rd %fprs, %g1
        wr %g1, 0x4, %fprs
	ldd	[%r8 + 0], %f0
	ldd	[%r8 + 8], %f2
	ldd	[%r8 + 16], %f4
	ldd	[%r8 + 24], %f6
	ldd	[%r8 + 32], %f8
	ldd	[%r8 + 40], %f10
	ldd	[%r8 + 48], %f12
	ldd	[%r8 + 56], %f14
	ldd	[%r8 + 64], %f16
	ldd	[%r8 + 72], %f18
	ldd	[%r8 + 80], %f20
	ldd	[%r8 + 88], %f22
	ldd	[%r8 + 96], %f24
	ldd	[%r8 + 104], %f26
	ldd	[%r8 + 112], %f28
	ldd	[%r8 + 120], %f30
	ldd	[%r8 + 128], %f32
	ldd	[%r8 + 136], %f34
	ldd	[%r8 + 144], %f36
	ldd	[%r8 + 152], %f38
	ldd	[%r8 + 160], %f40
	ldd	[%r8 + 168], %f42
	ldd	[%r8 + 176], %f44
	ldd	[%r8 + 184], %f46
	ldd	[%r8 + 192], %f48
	ldd	[%r8 + 200], %f50
	ldd	[%r8 + 208], %f52
	ldd	[%r8 + 216], %f54
	ldd	[%r8 + 224], %f56
	ldd	[%r8 + 232], %f58
	ldd	[%r8 + 240], %f60
	ldd	[%r8 + 248], %f62
        setx  0x0b0d81f0fe3af56d, %g1, %r0
        setx  0x0a3eae6909e3226e, %g1, %r1
        setx  0xa2495705d46d52a4, %g1, %r2
        setx  0x2d9e5f15043844e5, %g1, %r3
        setx  0x7e09faa6b41e3b5f, %g1, %r4
        setx  0x1378554fe8c7ea0f, %g1, %r5
        setx  0x451bd698d5784bb2, %g1, %r6
        setx  0xa9cfe15e4b8b44f8, %g1, %r7
        setx  0xc6af7c420eceacd0, %g1, %r10
        setx  0x38c92734294f9e0a, %g1, %r11
        setx  0xf923bf91a0beadef, %g1, %r12
        setx  0x62f6d05fb5a0f1c3, %g1, %r13
        setx  0x1b33d7034741e8fe, %g1, %r14
        setx  0xcb5ccf4c3657a04e, %g1, %r15
        setx  0x206434f38d868fa2, %g1, %r16
        setx  0x9ab28d1371472bae, %g1, %r17
        setx  0x908cb67f8b23850a, %g1, %r18
        setx  0x3f209fd0519355ba, %g1, %r19
        setx  0x842823998005337e, %g1, %r20
        setx  0xefd36ea4e6e9313a, %g1, %r21
        setx  0xc4787cc8347a15e3, %g1, %r22
        setx  0xa273010e549103dd, %g1, %r23
        setx  0x4cd7b8fbba46e81b, %g1, %r24
        setx  0xdd3291283d17effe, %g1, %r25
        setx  0xf94c8d49300d31ac, %g1, %r26
        setx  0xe00e0fc930b1614c, %g1, %r27
        setx  0xabc0527c85b2ec13, %g1, %r28
        setx  0xc49efe1473900c0d, %g1, %r29
        setx  0x371a1b257dcd914c, %g1, %r30
        setx  0xa8996987094bf929, %g1, %r31
	.word 0xc62a0009  ! 10: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xce120009  ! 10: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0x866a0009  ! 10: UDIVX_R	udivx 	%r8, %r9, %r3
	.word 0x836a2400  ! 10: SDIVX_I	sdivx	%r8, 0x0400, %r1
	.word 0xb8420009  ! 12: ADDC_R	addc 	%r8, %r9, %r28
	.word 0x832a0009  ! 12: SLL_R	sll 	%r8, %r9, %r1
	.word 0x8a320009  ! 12: ORN_R	orn 	%r8, %r9, %r5
	.word 0x96ba256c  ! 12: XNORcc_I	xnorcc 	%r8, 0x056c, %r11
	.word 0x872a0009  ! 12: SLL_R	sll 	%r8, %r9, %r3
	.word 0xbf320009  ! 12: SRL_R	srl 	%r8, %r9, %r31
	.word 0x86320009  ! 12: SUBC_R	orn 	%r8, %r9, %r3
	.word 0x82922b94  ! 12: ORcc_I	orcc 	%r8, 0x0b94, %r1
	.word 0x86aa22fc  ! 12: ANDNcc_I	andncc 	%r8, 0x02fc, %r3
	.word 0x8a020009  ! 12: ADD_R	add 	%r8, %r9, %r5
	.word 0x9e320009  ! 12: SUBC_R	orn 	%r8, %r9, %r15
	.word 0xbe420009  ! 13: ADDC_R	addc 	%r8, %r9, %r31
	.word 0x889a2bcc  ! 13: XORcc_I	xorcc 	%r8, 0x0bcc, %r4
	.word 0xbcba2d5c  ! 13: XNORcc_I	xnorcc 	%r8, 0x0d5c, %r30
	.word 0x89782401  ! 13: MOVR_I	move	%r0, 0xd5c, %r4
	.word 0x841228e4  ! 13: OR_I	or 	%r8, 0x08e4, %r2
	.word 0x8c3a2714  ! 13: XNOR_I	xnor 	%r8, 0x0714, %r6
	.word 0x89321009  ! 13: SRLX_R	srlx	%r8, %r9, %r4
	.word 0x860a0009  ! 13: AND_R	and 	%r8, %r9, %r3
	.word 0x83641809  ! 13: MOVcc_R	<illegal instruction>
	.word 0x8b3a0009  ! 13: SRA_R	sra 	%r8, %r9, %r5
	.word 0x86922f4c  ! 13: ORcc_I	orcc 	%r8, 0x0f4c, %r3
	.word 0x863220d4  ! 13: SUBC_I	orn 	%r8, 0x00d4, %r3
	.word 0x0cca0001  ! 15: BRGZ	brgz  ,pt	%8,<label_0xa0001>
	.word 0xba722ab4  ! 15: UDIV_I	udiv 	%r8, 0x0ab4, %r29
	.word 0xfe320009  ! 21: STH_R	sth	%r31, [%r8 + %r9]
	.word 0xcd020009  ! 21: LDF_R	ld	[%r8, %r9], %f6
	.word 0x8e8a0009  ! 21: ANDcc_R	andcc 	%r8, %r9, %r7
	.word 0x84f22548  ! 21: UDIVcc_I	udivcc 	%r8, 0x0548, %r2
	.word 0xc8720009  ! 26: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xcd020009  ! 26: LDF_R	ld	[%r8, %r9], %f6
	.word 0x856a277c  ! 26: SDIVX_I	sdivx	%r8, 0x077c, %r2
	.word 0x896a27d0  ! 26: SDIVX_I	sdivx	%r8, 0x07d0, %r4
	.word 0x02800002  ! 29: BE	be  	<label_0x2>
	.word 0x8af227e8  ! 29: UDIVcc_I	udivcc 	%r8, 0x07e8, %r5
	.word 0x84b20009  ! 31: ORNcc_R	orncc 	%r8, %r9, %r2
	.word 0xaeba2718  ! 31: XNORcc_I	xnorcc 	%r8, 0x0718, %r23
	.word 0xb6120009  ! 31: OR_R	or 	%r8, %r9, %r27
	.word 0x8e320009  ! 31: ORN_R	orn 	%r8, %r9, %r7
	.word 0x8f3a0009  ! 31: SRA_R	sra 	%r8, %r9, %r7
	.word 0x84a20009  ! 31: SUBcc_R	subcc 	%r8, %r9, %r2
	.word 0xa4b20009  ! 31: SUBCcc_R	orncc 	%r8, %r9, %r18
	.word 0x8c820009  ! 31: ADDcc_R	addcc 	%r8, %r9, %r6
	.word 0x88a20009  ! 31: SUBcc_R	subcc 	%r8, %r9, %r4
	.word 0x84022d68  ! 31: ADD_I	add 	%r8, 0x0d68, %r2
	.word 0xb13a0009  ! 31: SRA_R	sra 	%r8, %r9, %r24
	.word 0x8e822608  ! 32: ADDcc_I	addcc 	%r8, 0x0608, %r7
	.word 0x8d780409  ! 32: MOVR_R	move	%r0, %r9, %r6
	.word 0xa6120009  ! 32: OR_R	or 	%r8, %r9, %r19
	.word 0x8c2a0009  ! 32: ANDN_R	andn 	%r8, %r9, %r6
	.word 0x8eba2708  ! 32: XNORcc_I	xnorcc 	%r8, 0x0708, %r7
	.word 0x948a20d4  ! 32: ANDcc_I	andcc 	%r8, 0x00d4, %r10
	.word 0xb48a0009  ! 32: ANDcc_R	andcc 	%r8, %r9, %r26
	.word 0x82a20009  ! 32: SUBcc_R	subcc 	%r8, %r9, %r1
	.word 0xa69a2904  ! 32: XORcc_I	xorcc 	%r8, 0x0904, %r19
	.word 0x832a0009  ! 32: SLL_R	sll 	%r8, %r9, %r1
	.word 0xac2a2d6c  ! 32: ANDN_I	andn 	%r8, 0x0d6c, %r22
	.word 0xbf780409  ! 37: MOVR_R	move	%r0, %r9, %r31
	.word 0xba8a2b14  ! 37: ANDcc_I	andcc 	%r8, 0x0b14, %r29
	.word 0x8cb20009  ! 37: ORNcc_R	orncc 	%r8, %r9, %r6
	.word 0x83643801  ! 37: MOVcc_I	<illegal instruction>
	.word 0xbf2a3001  ! 37: SLLX_I	sllx	%r8, 0x0001, %r31
	.word 0x9a42214c  ! 37: ADDC_I	addc 	%r8, 0x014c, %r13
	.word 0x82820009  ! 37: ADDcc_R	addcc 	%r8, %r9, %r1
	.word 0x8832244c  ! 37: SUBC_I	orn 	%r8, 0x044c, %r4
	.word 0x822226cc  ! 37: SUB_I	sub 	%r8, 0x06cc, %r1
	.word 0xb2920009  ! 37: ORcc_R	orcc 	%r8, %r9, %r25
	.word 0xa40a0009  ! 37: AND_R	and 	%r8, %r9, %r18
	.word 0xa22a0009  ! 37: ANDN_R	andn 	%r8, %r9, %r17
	.word 0x8eb20009  ! 37: SUBCcc_R	orncc 	%r8, %r9, %r7
	.word 0x86c20009  ! 37: ADDCcc_R	addccc 	%r8, %r9, %r3
	.word 0x02c20001  ! 40: BRZ	brz  ,nt	%8,<label_0x20001>
	.word 0x86f221c8  ! 40: UDIVcc_I	udivcc 	%r8, 0x01c8, %r3
	.word 0xf1220009  ! 44: STF_R	st	%f24, [%r9, %r8]
	.word 0xda020009  ! 44: LDUW_R	lduw	[%r8 + %r9], %r13
	.word 0xb76a0009  ! 44: SDIVX_R	sdivx	%r8, %r9, %r27
	.word 0x827229c8  ! 44: UDIV_I	udiv 	%r8, 0x09c8, %r1
	.word 0xdf220009  ! 48: STF_R	st	%f15, [%r9, %r8]
	.word 0xc4020009  ! 48: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xac820009  ! 48: ADDcc_R	addcc 	%r8, %r9, %r22
	.word 0x847222c8  ! 48: UDIV_I	udiv 	%r8, 0x02c8, %r2
	.word 0x0cc20001  ! 51: BRGZ	brgz  ,nt	%8,<label_0x20001>
	.word 0x876a0009  ! 51: SDIVX_R	sdivx	%r8, %r9, %r3
	.word 0x9a3a22a4  ! 52: XNOR_I	xnor 	%r8, 0x02a4, %r13
	.word 0x83321009  ! 52: SRLX_R	srlx	%r8, %r9, %r1
	.word 0x828a2410  ! 52: ANDcc_I	andcc 	%r8, 0x0410, %r1
	.word 0x86320009  ! 52: ORN_R	orn 	%r8, %r9, %r3
	.word 0xbeba23a0  ! 52: XNORcc_I	xnorcc 	%r8, 0x03a0, %r31
	.word 0x84aa2884  ! 52: ANDNcc_I	andncc 	%r8, 0x0884, %r2
	.word 0x868224d0  ! 52: ADDcc_I	addcc 	%r8, 0x04d0, %r3
	.word 0x963a2894  ! 52: XNOR_I	xnor 	%r8, 0x0894, %r11
	.word 0x8e320009  ! 52: SUBC_R	orn 	%r8, %r9, %r7
	.word 0xa52a3001  ! 52: SLLX_I	sllx	%r8, 0x0001, %r18
	.word 0x9f3a1009  ! 52: SRAX_R	srax	%r8, %r9, %r15
	.word 0x9ab20009  ! 53: SUBCcc_R	orncc 	%r8, %r9, %r13
	.word 0x8e320009  ! 53: ORN_R	orn 	%r8, %r9, %r7
	.word 0xb6320009  ! 53: SUBC_R	orn 	%r8, %r9, %r27
	.word 0x8e120009  ! 53: OR_R	or 	%r8, %r9, %r7
	.word 0x853a2001  ! 53: SRA_I	sra 	%r8, 0x0001, %r2
	.word 0x8cb20009  ! 53: ORNcc_R	orncc 	%r8, %r9, %r6
	.word 0xa0920009  ! 53: ORcc_R	orcc 	%r8, %r9, %r16
	.word 0x86420009  ! 53: ADDC_R	addc 	%r8, %r9, %r3
	.word 0x8b780409  ! 53: MOVR_R	move	%r0, %r9, %r5
	.word 0x893a3001  ! 53: SRAX_I	srax	%r8, 0x0001, %r4
	.word 0x8f320009  ! 53: SRL_R	srl 	%r8, %r9, %r7
	.word 0x861a0009  ! 59: XOR_R	xor 	%r8, %r9, %r3
	.word 0x852a2001  ! 59: SLL_I	sll 	%r8, 0x0001, %r2
	.word 0x822a0009  ! 59: ANDN_R	andn 	%r8, %r9, %r1
	.word 0x8e122350  ! 59: OR_I	or 	%r8, 0x0350, %r7
	.word 0xaa02285c  ! 59: ADD_I	add 	%r8, 0x085c, %r21
	.word 0x99641809  ! 59: MOVcc_R	<illegal instruction>
	.word 0x822a0009  ! 59: ANDN_R	andn 	%r8, %r9, %r1
	.word 0x8a420009  ! 59: ADDC_R	addc 	%r8, %r9, %r5
	.word 0xae1a2628  ! 59: XOR_I	xor 	%r8, 0x0628, %r23
	.word 0x892a1009  ! 59: SLLX_R	sllx	%r8, %r9, %r4
	.word 0xb0aa2458  ! 59: ANDNcc_I	andncc 	%r8, 0x0458, %r24
	.word 0x8c32273c  ! 59: SUBC_I	orn 	%r8, 0x073c, %r6
	.word 0x873a0009  ! 59: SRA_R	sra 	%r8, %r9, %r3
	.word 0x84b222fc  ! 59: ORNcc_I	orncc 	%r8, 0x02fc, %r2
	.word 0xec320009  ! 63: STH_R	sth	%r22, [%r8 + %r9]
	.word 0xf91a0009  ! 63: LDDF_R	ldd	[%r8, %r9], %f28
	.word 0x84f20009  ! 63: UDIVcc_R	udivcc 	%r8, %r9, %r2
	.word 0x86722010  ! 63: UDIV_I	udiv 	%r8, 0x0010, %r3
	.word 0x2cca0001  ! 66: BRGZ	brgz,a,pt	%8,<label_0xa0001>
	.word 0x887a26a4  ! 66: SDIV_I	sdiv 	%r8, 0x06a4, %r4
	.word 0x00800002  ! 73: BN	bn  	<label_0x2>
	.word 0x8c6a0009  ! 73: UDIVX_R	udivx 	%r8, %r9, %r6
	.word 0xde320009  ! 77: STH_R	sth	%r15, [%r8 + %r9]
	.word 0xda520009  ! 77: LDSH_R	ldsh	[%r8 + %r9], %r13
	.word 0x8a6a0009  ! 77: UDIVX_R	udivx 	%r8, %r9, %r5
	.word 0x8e720009  ! 77: UDIV_R	udiv 	%r8, %r9, %r7
	.word 0x26800001  ! 79: BL	bl,a	<label_0x1>
	.word 0x8e72286c  ! 79: UDIV_I	udiv 	%r8, 0x086c, %r7
	.word 0xc6720009  ! 83: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xcb1a0009  ! 83: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0x847a2890  ! 83: SDIV_I	sdiv 	%r8, 0x0890, %r2
	.word 0x88722d9c  ! 83: UDIV_I	udiv 	%r8, 0x0d9c, %r4
	.word 0x04c20001  ! 90: BRLEZ	brlez  ,nt	%8,<label_0x20001>
	.word 0x9f6a0009  ! 90: SDIVX_R	sdivx	%r8, %r9, %r15
	.word 0x8c3a0009  ! 93: XNOR_R	xnor 	%r8, %r9, %r6
	.word 0xb3321009  ! 93: SRLX_R	srlx	%r8, %r9, %r25
	.word 0x828226e4  ! 93: ADDcc_I	addcc 	%r8, 0x06e4, %r1
	.word 0x82b22d18  ! 93: SUBCcc_I	orncc 	%r8, 0x0d18, %r1
	.word 0x88b20009  ! 93: ORNcc_R	orncc 	%r8, %r9, %r4
	.word 0xb32a1009  ! 93: SLLX_R	sllx	%r8, %r9, %r25
	.word 0x8a322990  ! 93: ORN_I	orn 	%r8, 0x0990, %r5
	.word 0x83782401  ! 93: MOVR_I	move	%r0, 0x990, %r1
	.word 0x833a3001  ! 93: SRAX_I	srax	%r8, 0x0001, %r1
	.word 0x872a1009  ! 93: SLLX_R	sllx	%r8, %r9, %r3
	.word 0x40000002  ! 96: CALL	call	disp30_2
	.word 0x847a23f8  ! 96: SDIV_I	sdiv 	%r8, 0x03f8, %r2
	.word 0x12800001  ! 99: BNE	bne  	<label_0x1>
	.word 0xa16a2e1c  ! 99: SDIVX_I	sdivx	%r8, 0x0e1c, %r16
	.word 0x2a800001  ! 102: BCS	bcs,a	<label_0x1>
	.word 0x8cfa0009  ! 102: SDIVcc_R	sdivcc 	%r8, %r9, %r6
	.word 0x08800001  ! 104: BLEU	bleu  	<label_0x1>
	.word 0xa8722960  ! 104: UDIV_I	udiv 	%r8, 0x0960, %r20
	.word 0xc4720009  ! 108: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xcc5a0009  ! 108: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0x8b6a2e10  ! 108: SDIVX_I	sdivx	%r8, 0x0e10, %r5
	.word 0x86f226c8  ! 108: UDIVcc_I	udivcc 	%r8, 0x06c8, %r3
	.word 0x8e0a0009  ! 109: AND_R	and 	%r8, %r9, %r7
	.word 0xb6a22c20  ! 109: SUBcc_I	subcc 	%r8, 0x0c20, %r27
	.word 0x82b2212c  ! 109: SUBCcc_I	orncc 	%r8, 0x012c, %r1
	.word 0x8e020009  ! 109: ADD_R	add 	%r8, %r9, %r7
	.word 0x8c1a2d04  ! 109: XOR_I	xor 	%r8, 0x0d04, %r6
	.word 0x84320009  ! 109: ORN_R	orn 	%r8, %r9, %r2
	.word 0x82120009  ! 109: OR_R	or 	%r8, %r9, %r1
	.word 0x8aa20009  ! 109: SUBcc_R	subcc 	%r8, %r9, %r5
	.word 0xb49a2db4  ! 109: XORcc_I	xorcc 	%r8, 0x0db4, %r26
	.word 0x8e222c28  ! 109: SUB_I	sub 	%r8, 0x0c28, %r7
	.word 0xba022cf4  ! 109: ADD_I	add 	%r8, 0x0cf4, %r29
	.word 0x893a1009  ! 109: SRAX_R	srax	%r8, %r9, %r4
	.word 0x9f3a3001  ! 111: SRAX_I	srax	%r8, 0x0001, %r15
	.word 0x8eaa24ec  ! 111: ANDNcc_I	andncc 	%r8, 0x04ec, %r7
	.word 0x893a1009  ! 111: SRAX_R	srax	%r8, %r9, %r4
	.word 0xb03226fc  ! 111: SUBC_I	orn 	%r8, 0x06fc, %r24
	.word 0xa40a0009  ! 111: AND_R	and 	%r8, %r9, %r18
	.word 0x8c020009  ! 111: ADD_R	add 	%r8, %r9, %r6
	.word 0x8b2a2001  ! 111: SLL_I	sll 	%r8, 0x0001, %r5
	.word 0x872a3001  ! 111: SLLX_I	sllx	%r8, 0x0001, %r3
	.word 0x84aa0009  ! 111: ANDNcc_R	andncc 	%r8, %r9, %r2
	.word 0x8d3a2001  ! 111: SRA_I	sra 	%r8, 0x0001, %r6
	.word 0x8a022814  ! 111: ADD_I	add 	%r8, 0x0814, %r5
	.word 0x96aa2d1c  ! 111: ANDNcc_I	andncc 	%r8, 0x0d1c, %r11
	.word 0x87643801  ! 111: MOVcc_I	<illegal instruction>
	.word 0x8d780409  ! 111: MOVR_R	move	%r0, %r9, %r6
	.word 0xeb3a0009  ! 116: STDF_R	std	%f21, [%r9, %r8]
	.word 0xe6120009  ! 116: LDUH_R	lduh	[%r8 + %r9], %r19
	.word 0x8cf22efc  ! 116: UDIVcc_I	udivcc 	%r8, 0x0efc, %r6
	.word 0x8f6a0009  ! 116: SDIVX_R	sdivx	%r8, %r9, %r7
	.word 0xc5220009  ! 124: STF_R	st	%f2, [%r9, %r8]
	.word 0xc81a0009  ! 124: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xb4f20009  ! 124: UDIVcc_R	udivcc 	%r8, %r9, %r26
	.word 0x8e6a238c  ! 124: UDIVX_I	udivx 	%r8, 0x038c, %r7
	.word 0x22c20001  ! 129: BRZ	brz,a,nt	%8,<label_0x20001>
	.word 0x8ef22100  ! 129: UDIVcc_I	udivcc 	%r8, 0x0100, %r7
	.word 0xec320009  ! 137: STH_R	sth	%r22, [%r8 + %r9]
	.word 0xf31a0009  ! 137: LDDF_R	ldd	[%r8, %r9], %f25
	.word 0xceca22c0  ! 137: LDSBA_I	ldsba	[%r8, + 0x02c0] %asi, %r7
	.word 0x9c6a0009  ! 137: UDIVX_R	udivx 	%r8, %r9, %r14
	.word 0x18800001  ! 139: BGU	bgu  	<label_0x1>
	.word 0x8f6a0009  ! 139: SDIVX_R	sdivx	%r8, %r9, %r7
	.word 0x1a800002  ! 142: BCC	bcc  	<label_0x2>
	.word 0x866a25ec  ! 142: UDIVX_I	udivx 	%r8, 0x05ec, %r3
	.word 0x3e800001  ! 145: BVC	bvc,a	<label_0x1>
	.word 0x98f22ff4  ! 145: UDIVcc_I	udivcc 	%r8, 0x0ff4, %r12
	.word 0x38800001  ! 147: BGU	bgu,a	<label_0x1>
	.word 0x886a2f88  ! 147: UDIVX_I	udivx 	%r8, 0x0f88, %r4
	.word 0x04c20001  ! 151: BRLEZ	brlez  ,nt	%8,<label_0x20001>
	.word 0x876a0009  ! 151: SDIVX_R	sdivx	%r8, %r9, %r3
	.word 0x12800001  ! 153: BNE	bne  	<label_0x1>
	.word 0x8c7a0009  ! 153: SDIV_R	sdiv 	%r8, %r9, %r6
	.word 0x82320009  ! 154: SUBC_R	orn 	%r8, %r9, %r1
	.word 0x82322910  ! 154: SUBC_I	orn 	%r8, 0x0910, %r1
	.word 0x83643801  ! 154: MOVcc_I	<illegal instruction>
	.word 0x8e2a0009  ! 154: ANDN_R	andn 	%r8, %r9, %r7
	.word 0x9c920009  ! 154: ORcc_R	orcc 	%r8, %r9, %r14
	.word 0x86c20009  ! 154: ADDCcc_R	addccc 	%r8, %r9, %r3
	.word 0x86ba0009  ! 154: XNORcc_R	xnorcc 	%r8, %r9, %r3
	.word 0x86c20009  ! 154: ADDCcc_R	addccc 	%r8, %r9, %r3
	.word 0x883a243c  ! 154: XNOR_I	xnor 	%r8, 0x043c, %r4
	.word 0x82aa0009  ! 154: ANDNcc_R	andncc 	%r8, %r9, %r1
	.word 0x87321009  ! 154: SRLX_R	srlx	%r8, %r9, %r3
	.word 0x86b22730  ! 154: SUBCcc_I	orncc 	%r8, 0x0730, %r3
	.word 0x16800002  ! 156: BGE	bge  	<label_0x2>
	.word 0xab6a0009  ! 156: SDIVX_R	sdivx	%r8, %r9, %r21
	.word 0xca2a0009  ! 160: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xdb020009  ! 160: LDF_R	ld	[%r8, %r9], %f13
	.word 0x8af22fdc  ! 160: UDIVcc_I	udivcc 	%r8, 0x0fdc, %r5
	.word 0xbcf20009  ! 160: UDIVcc_R	udivcc 	%r8, %r9, %r30
	.word 0xcf3a0009  ! 167: STDF_R	std	%f7, [%r9, %r8]
	.word 0xca420009  ! 167: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0x846a2e6c  ! 167: UDIVX_I	udivx 	%r8, 0x0e6c, %r2
	.word 0x846a2ef0  ! 167: UDIVX_I	udivx 	%r8, 0x0ef0, %r2
	.word 0x82022b00  ! 172: ADD_I	add 	%r8, 0x0b00, %r1
	.word 0xaa822d28  ! 172: ADDcc_I	addcc 	%r8, 0x0d28, %r21
	.word 0x882a0009  ! 172: ANDN_R	andn 	%r8, %r9, %r4
	.word 0x889a2b08  ! 172: XORcc_I	xorcc 	%r8, 0x0b08, %r4
	.word 0x853a1009  ! 172: SRAX_R	srax	%r8, %r9, %r2
	.word 0x841a0009  ! 172: XOR_R	xor 	%r8, %r9, %r2
	.word 0x993a2001  ! 172: SRA_I	sra 	%r8, 0x0001, %r12
	.word 0x88120009  ! 172: OR_R	or 	%r8, %r9, %r4
	.word 0xb6922bb4  ! 172: ORcc_I	orcc 	%r8, 0x0bb4, %r27
	.word 0x852a2001  ! 172: SLL_I	sll 	%r8, 0x0001, %r2
	.word 0x8c1a2390  ! 172: XOR_I	xor 	%r8, 0x0390, %r6
	.word 0x22c20001  ! 175: BRZ	brz,a,nt	%8,<label_0x20001>
	.word 0x98fa0009  ! 175: SDIVcc_R	sdivcc 	%r8, %r9, %r12
	.word 0xcf220009  ! 180: STF_R	st	%f7, [%r9, %r8]
	.word 0xcc420009  ! 180: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xa16a2844  ! 180: SDIVX_I	sdivx	%r8, 0x0844, %r16
	.word 0x8c7a0009  ! 180: SDIV_R	sdiv 	%r8, %r9, %r6
	.word 0x02800002  ! 182: BE	be  	<label_0x2>
	.word 0x88722710  ! 182: UDIV_I	udiv 	%r8, 0x0710, %r4
	.word 0xce2a0009  ! 188: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xcf1a0009  ! 188: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xc85a22dc  ! 188: LDX_I	ldx	[%r8 + 0x02dc], %r4
	.word 0x8e6a0009  ! 188: UDIVX_R	udivx 	%r8, %r9, %r7
	.word 0x3a800001  ! 190: BCC	bcc,a	<label_0x1>
	.word 0x8e722220  ! 190: UDIV_I	udiv 	%r8, 0x0220, %r7
	.word 0x1c800001  ! 194: BPOS	bpos  	<label_0x1>
	.word 0x86fa0009  ! 194: SDIVcc_R	sdivcc 	%r8, %r9, %r3
	.word 0x2ec20001  ! 197: BRGEZ	brgez,a,nt	%8,<label_0x20001>
	.word 0x886a0009  ! 197: UDIVX_R	udivx 	%r8, %r9, %r4
	.word 0x9eaa256c  ! 199: ANDNcc_I	andncc 	%r8, 0x056c, %r15
	.word 0x88b20009  ! 199: SUBCcc_R	orncc 	%r8, %r9, %r4
	.word 0xaeb22f84  ! 199: SUBCcc_I	orncc 	%r8, 0x0f84, %r23
	.word 0x8e3228cc  ! 199: SUBC_I	orn 	%r8, 0x08cc, %r7
	.word 0x85780409  ! 199: MOVR_R	move	%r0, %r9, %r2
	.word 0x8a122974  ! 199: OR_I	or 	%r8, 0x0974, %r5
	.word 0x9b641809  ! 199: MOVcc_R	<illegal instruction>
	.word 0x840a2484  ! 199: AND_I	and 	%r8, 0x0484, %r2
	.word 0x86222d84  ! 199: SUB_I	sub 	%r8, 0x0d84, %r3
	.word 0x8492227c  ! 199: ORcc_I	orcc 	%r8, 0x027c, %r2
	.word 0x84a22090  ! 199: SUBcc_I	subcc 	%r8, 0x0090, %r2
	.word 0xf4320009  ! 205: STH_R	sth	%r26, [%r8 + %r9]
	.word 0xce4a0009  ! 205: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0x84920009  ! 205: ORcc_R	orcc 	%r8, %r9, %r2
	.word 0x8b323001  ! 205: SRLX_I	srlx	%r8, 0x0001, %r5
	.word 0xb1780409  ! 205: MOVR_R	move	%r0, %r9, %r24
	.word 0xa06a2c6c  ! 205: UDIVX_I	udivx 	%r8, 0x0c6c, %r16
	.word 0x82222aec  ! 207: SUB_I	sub 	%r8, 0x0aec, %r1
	.word 0x8b2a3001  ! 207: SLLX_I	sllx	%r8, 0x0001, %r5
	.word 0x84820009  ! 207: ADDcc_R	addcc 	%r8, %r9, %r2
	.word 0xbe8a0009  ! 207: ANDcc_R	andcc 	%r8, %r9, %r31
	.word 0x9ac22e90  ! 207: ADDCcc_I	addccc 	%r8, 0x0e90, %r13
	.word 0x9e1a0009  ! 207: XOR_R	xor 	%r8, %r9, %r15
	.word 0x84a22d78  ! 207: SUBcc_I	subcc 	%r8, 0x0d78, %r2
	.word 0xac2a0009  ! 207: ANDN_R	andn 	%r8, %r9, %r22
	.word 0x82b20009  ! 207: ORNcc_R	orncc 	%r8, %r9, %r1
	.word 0x84320009  ! 207: SUBC_R	orn 	%r8, %r9, %r2
	.word 0xba9a0009  ! 207: XORcc_R	xorcc 	%r8, %r9, %r29
	.word 0xb13a3001  ! 207: SRAX_I	srax	%r8, 0x0001, %r24
	.word 0x8a320009  ! 207: SUBC_R	orn 	%r8, %r9, %r5
	.word 0xb7641809  ! 207: MOVcc_R	<illegal instruction>
	.word 0x829a2678  ! 207: XORcc_I	xorcc 	%r8, 0x0678, %r1
	.word 0x88b22d18  ! 208: ORNcc_I	orncc 	%r8, 0x0d18, %r4
	.word 0x9a3a0009  ! 208: XNOR_R	xnor 	%r8, %r9, %r13
	.word 0x84820009  ! 208: ADDcc_R	addcc 	%r8, %r9, %r2
	.word 0x8a220009  ! 208: SUB_R	sub 	%r8, %r9, %r5
	.word 0xb4b22c60  ! 208: ORNcc_I	orncc 	%r8, 0x0c60, %r26
	.word 0x873a1009  ! 208: SRAX_R	srax	%r8, %r9, %r3
	.word 0xa6c20009  ! 208: ADDCcc_R	addccc 	%r8, %r9, %r19
	.word 0x88920009  ! 208: ORcc_R	orcc 	%r8, %r9, %r4
	.word 0x82aa2cb0  ! 208: ANDNcc_I	andncc 	%r8, 0x0cb0, %r1
	.word 0x87320009  ! 208: SRL_R	srl 	%r8, %r9, %r3
	.word 0x8e820009  ! 208: ADDcc_R	addcc 	%r8, %r9, %r7
	.word 0xa7780409  ! 208: MOVR_R	move	%r0, %r9, %r19
	.word 0x02800001  ! 210: BE	be  	<label_0x1>
	.word 0x84fa2960  ! 210: SDIVcc_I	sdivcc 	%r8, 0x0960, %r2
	.word 0x0a800001  ! 215: BCS	bcs  	<label_0x1>
	.word 0x8ef22044  ! 215: UDIVcc_I	udivcc 	%r8, 0x0044, %r7
	.word 0xb32a1009  ! 216: SLLX_R	sllx	%r8, %r9, %r25
	.word 0x853a3001  ! 216: SRAX_I	srax	%r8, 0x0001, %r2
	.word 0x893a1009  ! 216: SRAX_R	srax	%r8, %r9, %r4
	.word 0x9a320009  ! 216: ORN_R	orn 	%r8, %r9, %r13
	.word 0x84222cdc  ! 216: SUB_I	sub 	%r8, 0x0cdc, %r2
	.word 0x8f320009  ! 216: SRL_R	srl 	%r8, %r9, %r7
	.word 0xa6b20009  ! 216: SUBCcc_R	orncc 	%r8, %r9, %r19
	.word 0xbd2a2001  ! 216: SLL_I	sll 	%r8, 0x0001, %r30
	.word 0xa00a2d48  ! 216: AND_I	and 	%r8, 0x0d48, %r16
	.word 0x841a27f8  ! 216: XOR_I	xor 	%r8, 0x07f8, %r2
	.word 0x88022064  ! 216: ADD_I	add 	%r8, 0x0064, %r4
	.word 0x83641809  ! 216: MOVcc_R	<illegal instruction>
	.word 0x86b20009  ! 216: ORNcc_R	orncc 	%r8, %r9, %r3
	.word 0x8e2a21f8  ! 216: ANDN_I	andn 	%r8, 0x01f8, %r7
	.word 0xfd220009  ! 220: STF_R	st	%f30, [%r9, %r8]
	.word 0xfc4a0009  ! 220: LDSB_R	ldsb	[%r8 + %r9], %r30
	.word 0xee92256c  ! 220: LDUHA_I	lduha	[%r8, + 0x056c] %asi, %r23
	.word 0x827a0009  ! 220: SDIV_R	sdiv 	%r8, %r9, %r1
	.word 0xcc2a0009  ! 224: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc9020009  ! 224: LDF_R	ld	[%r8, %r9], %f4
	.word 0xce1221c0  ! 224: LDUH_I	lduh	[%r8 + 0x01c0], %r7
	.word 0x8efa218c  ! 224: SDIVcc_I	sdivcc 	%r8, 0x018c, %r7
	.word 0xc5220009  ! 229: STF_R	st	%f2, [%r9, %r8]
	.word 0xcc120009  ! 229: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0x9a1a0009  ! 229: XOR_R	xor 	%r8, %r9, %r13
	.word 0x8a7a0009  ! 229: SDIV_R	sdiv 	%r8, %r9, %r5
	.word 0x04800001  ! 232: BLE	ble  	<label_0x1>
	.word 0x8c6a2aa8  ! 232: UDIVX_I	udivx 	%r8, 0x0aa8, %r6
	.word 0x1e800002  ! 236: BVC	bvc  	<label_0x2>
	.word 0x826a2454  ! 236: UDIVX_I	udivx 	%r8, 0x0454, %r1
	.word 0xa22a2dd0  ! 237: ANDN_I	andn 	%r8, 0x0dd0, %r17
	.word 0xb12a1009  ! 237: SLLX_R	sllx	%r8, %r9, %r24
	.word 0x892a0009  ! 237: SLL_R	sll 	%r8, %r9, %r4
	.word 0x8c820009  ! 237: ADDcc_R	addcc 	%r8, %r9, %r6
	.word 0x82ba0009  ! 237: XNORcc_R	xnorcc 	%r8, %r9, %r1
	.word 0xb3641809  ! 237: MOVcc_R	<illegal instruction>
	.word 0x8eba2ee4  ! 237: XNORcc_I	xnorcc 	%r8, 0x0ee4, %r7
	.word 0x8eb20009  ! 237: SUBCcc_R	orncc 	%r8, %r9, %r7
	.word 0x8882243c  ! 237: ADDcc_I	addcc 	%r8, 0x043c, %r4
	.word 0xb80223d0  ! 237: ADD_I	add 	%r8, 0x03d0, %r28
	.word 0x82ba0009  ! 237: XNORcc_R	xnorcc 	%r8, %r9, %r1
	.word 0x86920009  ! 237: ORcc_R	orcc 	%r8, %r9, %r3
	.word 0x8c822608  ! 237: ADDcc_I	addcc 	%r8, 0x0608, %r6
	.word 0x8c8a0009  ! 237: ANDcc_R	andcc 	%r8, %r9, %r6
	.word 0x1a800001  ! 240: BCC	bcc  	<label_0x1>
	.word 0x88fa0009  ! 240: SDIVcc_R	sdivcc 	%r8, %r9, %r4
	.word 0x8c420009  ! 243: ADDC_R	addc 	%r8, %r9, %r6
	.word 0xb7320009  ! 243: SRL_R	srl 	%r8, %r9, %r27
	.word 0x888a0009  ! 243: ANDcc_R	andcc 	%r8, %r9, %r4
	.word 0x8e020009  ! 243: ADD_R	add 	%r8, %r9, %r7
	.word 0x8f322001  ! 243: SRL_I	srl 	%r8, 0x0001, %r7
	.word 0x87321009  ! 243: SRLX_R	srlx	%r8, %r9, %r3
	.word 0x86020009  ! 243: ADD_R	add 	%r8, %r9, %r3
	.word 0x82c20009  ! 243: ADDCcc_R	addccc 	%r8, %r9, %r1
	.word 0x86ba0009  ! 243: XNORcc_R	xnorcc 	%r8, %r9, %r3
	.word 0x863a0009  ! 243: XNOR_R	xnor 	%r8, %r9, %r3
	.word 0x98120009  ! 243: OR_R	or 	%r8, %r9, %r12
	.word 0xb08a21d8  ! 243: ANDcc_I	andcc 	%r8, 0x01d8, %r24
	.word 0x1a800002  ! 245: BCC	bcc  	<label_0x2>
	.word 0x8cf20009  ! 245: UDIVcc_R	udivcc 	%r8, %r9, %r6
	.word 0xcd220009  ! 250: STF_R	st	%f6, [%r9, %r8]
	.word 0xd81a0009  ! 250: LDD_R	ldd	[%r8 + %r9], %r12
	.word 0x8e922e84  ! 250: ORcc_I	orcc 	%r8, 0x0e84, %r7
	.word 0xb76a2480  ! 250: SDIVX_I	sdivx	%r8, 0x0480, %r27
	.word 0xce220009  ! 257: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xf4020009  ! 257: LDUW_R	lduw	[%r8 + %r9], %r26
	.word 0x8a7a20f4  ! 257: SDIV_I	sdiv 	%r8, 0x00f4, %r5
	.word 0xa56a2190  ! 257: SDIVX_I	sdivx	%r8, 0x0190, %r18
	.word 0x16800002  ! 259: BGE	bge  	<label_0x2>
	.word 0xa36a2d28  ! 259: SDIVX_I	sdivx	%r8, 0x0d28, %r17
	.word 0x24c20001  ! 261: BRLEZ	brlez,a,nt	%8,<label_0x20001>
	.word 0x8c7a0009  ! 261: SDIV_R	sdiv 	%r8, %r9, %r6
	.word 0xc9220009  ! 266: STF_R	st	%f4, [%r9, %r8]
	.word 0xc6420009  ! 266: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0x8afa29ec  ! 266: SDIVcc_I	sdivcc 	%r8, 0x09ec, %r5
	.word 0x9a722980  ! 266: UDIV_I	udiv 	%r8, 0x0980, %r13
	.word 0xcc320009  ! 271: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc91a0009  ! 271: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0x9d6a0009  ! 271: SDIVX_R	sdivx	%r8, %r9, %r14
	.word 0x876a21e4  ! 271: SDIVX_I	sdivx	%r8, 0x01e4, %r3
	.word 0xeb3a0009  ! 281: STDF_R	std	%f21, [%r9, %r8]
	.word 0xcc5a0009  ! 281: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xa0720009  ! 281: UDIV_R	udiv 	%r8, %r9, %r16
	.word 0x8afa2d30  ! 281: SDIVcc_I	sdivcc 	%r8, 0x0d30, %r5
	.word 0x9d320009  ! 282: SRL_R	srl 	%r8, %r9, %r14
	.word 0x8ab20009  ! 282: SUBCcc_R	orncc 	%r8, %r9, %r5
	.word 0xb09a0009  ! 282: XORcc_R	xorcc 	%r8, %r9, %r24
	.word 0xa8b221ec  ! 282: ORNcc_I	orncc 	%r8, 0x01ec, %r20
	.word 0x9f782401  ! 282: MOVR_I	move	%r0, 0x1ec, %r15
	.word 0xbeb2293c  ! 282: SUBCcc_I	orncc 	%r8, 0x093c, %r31
	.word 0x88120009  ! 282: OR_R	or 	%r8, %r9, %r4
	.word 0x8c922d6c  ! 282: ORcc_I	orcc 	%r8, 0x0d6c, %r6
	.word 0xa0b20009  ! 282: SUBCcc_R	orncc 	%r8, %r9, %r16
	.word 0x89323001  ! 282: SRLX_I	srlx	%r8, 0x0001, %r4
	.word 0xbe0a2fb4  ! 282: AND_I	and 	%r8, 0x0fb4, %r31
	.word 0x88822798  ! 282: ADDcc_I	addcc 	%r8, 0x0798, %r4
	.word 0x832a1009  ! 282: SLLX_R	sllx	%r8, %r9, %r1
	.word 0x06800001  ! 286: BL	bl  	<label_0x1>
	.word 0x88720009  ! 286: UDIV_R	udiv 	%r8, %r9, %r4
	.word 0xc6720009  ! 290: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xf64a0009  ! 290: LDSB_R	ldsb	[%r8 + %r9], %r27
	.word 0x8e7a2944  ! 290: SDIV_I	sdiv 	%r8, 0x0944, %r7
	.word 0xa4f22a30  ! 290: UDIVcc_I	udivcc 	%r8, 0x0a30, %r18
	.word 0xc53a0009  ! 295: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc01a0009  ! 295: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0x8af20009  ! 295: UDIVcc_R	udivcc 	%r8, %r9, %r5
	.word 0x88f20009  ! 295: UDIVcc_R	udivcc 	%r8, %r9, %r4
	.word 0xc8720009  ! 303: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xf40a0009  ! 303: LDUB_R	ldub	[%r8 + %r9], %r26
	.word 0xc8520009  ! 303: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0x846a0009  ! 303: UDIVX_R	udivx 	%r8, %r9, %r2
	.word 0x86820009  ! 305: ADDcc_R	addcc 	%r8, %r9, %r3
	.word 0x820a0009  ! 305: AND_R	and 	%r8, %r9, %r1
	.word 0x94222af8  ! 305: SUB_I	sub 	%r8, 0x0af8, %r10
	.word 0xaaba0009  ! 305: XNORcc_R	xnorcc 	%r8, %r9, %r21
	.word 0x84020009  ! 305: ADD_R	add 	%r8, %r9, %r2
	.word 0x883a2e18  ! 305: XNOR_I	xnor 	%r8, 0x0e18, %r4
	.word 0x8f320009  ! 305: SRL_R	srl 	%r8, %r9, %r7
	.word 0x8cba0009  ! 305: XNORcc_R	xnorcc 	%r8, %r9, %r6
	.word 0x8a3a0009  ! 305: XNOR_R	xnor 	%r8, %r9, %r5
	.word 0x8cb22368  ! 305: SUBCcc_I	orncc 	%r8, 0x0368, %r6
	.word 0x8eba0009  ! 305: XNORcc_R	xnorcc 	%r8, %r9, %r7
	.word 0x82320009  ! 305: SUBC_R	orn 	%r8, %r9, %r1
	.word 0xee2a0009  ! 309: STB_R	stb	%r23, [%r8 + %r9]
	.word 0xe85a0009  ! 309: LDX_R	ldx	[%r8 + %r9], %r20
	.word 0xa86a2908  ! 309: UDIVX_I	udivx 	%r8, 0x0908, %r20
	.word 0x88720009  ! 309: UDIV_R	udiv 	%r8, %r9, %r4
	.word 0x8e1a0009  ! 310: XOR_R	xor 	%r8, %r9, %r7
	.word 0x8cb22298  ! 310: ORNcc_I	orncc 	%r8, 0x0298, %r6
	.word 0x82320009  ! 310: ORN_R	orn 	%r8, %r9, %r1
	.word 0x87321009  ! 310: SRLX_R	srlx	%r8, %r9, %r3
	.word 0xac42289c  ! 310: ADDC_I	addc 	%r8, 0x089c, %r22
	.word 0xa6b20009  ! 310: SUBCcc_R	orncc 	%r8, %r9, %r19
	.word 0xbd322001  ! 310: SRL_I	srl 	%r8, 0x0001, %r30
	.word 0xad320009  ! 310: SRL_R	srl 	%r8, %r9, %r22
	.word 0x98b20009  ! 310: SUBCcc_R	orncc 	%r8, %r9, %r12
	.word 0x84320009  ! 310: SUBC_R	orn 	%r8, %r9, %r2
	.word 0x83780409  ! 310: MOVR_R	move	%r0, %r9, %r1
	.word 0xa4120009  ! 310: OR_R	or 	%r8, %r9, %r18
	.word 0x88020009  ! 310: ADD_R	add 	%r8, %r9, %r4
	.word 0x9c1a277c  ! 310: XOR_I	xor 	%r8, 0x077c, %r14
	.word 0x8d780409  ! 311: MOVR_R	move	%r0, %r9, %r6
	.word 0x82aa2a40  ! 311: ANDNcc_I	andncc 	%r8, 0x0a40, %r1
	.word 0x842a2054  ! 311: ANDN_I	andn 	%r8, 0x0054, %r2
	.word 0x880a0009  ! 311: AND_R	and 	%r8, %r9, %r4
	.word 0x8d641809  ! 311: MOVcc_R	<illegal instruction>
	.word 0x9c8229f8  ! 311: ADDcc_I	addcc 	%r8, 0x09f8, %r14
	.word 0x8eaa0009  ! 311: ANDNcc_R	andncc 	%r8, %r9, %r7
	.word 0x8aaa0009  ! 311: ANDNcc_R	andncc 	%r8, %r9, %r5
	.word 0x8f323001  ! 311: SRLX_I	srlx	%r8, 0x0001, %r7
	.word 0x96220009  ! 311: SUB_R	sub 	%r8, %r9, %r11
	.word 0x82322a9c  ! 311: SUBC_I	orn 	%r8, 0x0a9c, %r1
	.word 0x06800002  ! 314: BL	bl  	<label_0x2>
	.word 0x8af22340  ! 314: UDIVcc_I	udivcc 	%r8, 0x0340, %r5
	.word 0xb33a3001  ! 315: SRAX_I	srax	%r8, 0x0001, %r25
	.word 0x8c920009  ! 315: ORcc_R	orcc 	%r8, %r9, %r6
	.word 0x8ac22c88  ! 315: ADDCcc_I	addccc 	%r8, 0x0c88, %r5
	.word 0x8a020009  ! 315: ADD_R	add 	%r8, %r9, %r5
	.word 0x872a3001  ! 315: SLLX_I	sllx	%r8, 0x0001, %r3
	.word 0x96b22310  ! 315: SUBCcc_I	orncc 	%r8, 0x0310, %r11
	.word 0x9b2a3001  ! 315: SLLX_I	sllx	%r8, 0x0001, %r13
	.word 0x82820009  ! 315: ADDcc_R	addcc 	%r8, %r9, %r1
	.word 0x832a1009  ! 315: SLLX_R	sllx	%r8, %r9, %r1
	.word 0x869a23b4  ! 315: XORcc_I	xorcc 	%r8, 0x03b4, %r3
	.word 0xa6420009  ! 317: ADDC_R	addc 	%r8, %r9, %r19
	.word 0x8b2a0009  ! 317: SLL_R	sll 	%r8, %r9, %r5
	.word 0x852a3001  ! 317: SLLX_I	sllx	%r8, 0x0001, %r2
	.word 0x86220009  ! 317: SUB_R	sub 	%r8, %r9, %r3
	.word 0x83641809  ! 317: MOVcc_R	<illegal instruction>
	.word 0xbc0a0009  ! 317: AND_R	and 	%r8, %r9, %r30
	.word 0x892a0009  ! 317: SLL_R	sll 	%r8, %r9, %r4
	.word 0x869a0009  ! 317: XORcc_R	xorcc 	%r8, %r9, %r3
	.word 0xa7641809  ! 317: MOVcc_R	<illegal instruction>
	.word 0xa02a2bb0  ! 317: ANDN_I	andn 	%r8, 0x0bb0, %r16
	.word 0x8c1220f4  ! 317: OR_I	or 	%r8, 0x00f4, %r6
	.word 0xc8720009  ! 321: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc65a0009  ! 321: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xf81a0009  ! 321: LDD_R	ldd	[%r8 + %r9], %r28
	.word 0xa8f20009  ! 321: UDIVcc_R	udivcc 	%r8, %r9, %r20
	.word 0x85323001  ! 323: SRLX_I	srlx	%r8, 0x0001, %r2
	.word 0x883a0009  ! 323: XNOR_R	xnor 	%r8, %r9, %r4
	.word 0x88420009  ! 323: ADDC_R	addc 	%r8, %r9, %r4
	.word 0x83782401  ! 323: MOVR_I	move	%r0, 0x9, %r1
	.word 0xa0122e54  ! 323: OR_I	or 	%r8, 0x0e54, %r16
	.word 0x882a0009  ! 323: ANDN_R	andn 	%r8, %r9, %r4
	.word 0x8f3a2001  ! 323: SRA_I	sra 	%r8, 0x0001, %r7
	.word 0xa7320009  ! 323: SRL_R	srl 	%r8, %r9, %r19
	.word 0x82422914  ! 323: ADDC_I	addc 	%r8, 0x0914, %r1
	.word 0x8e8a2238  ! 323: ANDcc_I	andcc 	%r8, 0x0238, %r7
	.word 0x8d2a0009  ! 323: SLL_R	sll 	%r8, %r9, %r6
	.word 0x9a120009  ! 323: OR_R	or 	%r8, %r9, %r13
	.word 0x8d3a3001  ! 323: SRAX_I	srax	%r8, 0x0001, %r6
	.word 0x8a320009  ! 323: ORN_R	orn 	%r8, %r9, %r5
	.word 0x89641809  ! 324: MOVcc_R	<illegal instruction>
	.word 0x82ba0009  ! 324: XNORcc_R	xnorcc 	%r8, %r9, %r1
	.word 0x84b22164  ! 324: SUBCcc_I	orncc 	%r8, 0x0164, %r2
	.word 0x88b20009  ! 324: SUBCcc_R	orncc 	%r8, %r9, %r4
	.word 0x87322001  ! 324: SRL_I	srl 	%r8, 0x0001, %r3
	.word 0x8ea22a90  ! 324: SUBcc_I	subcc 	%r8, 0x0a90, %r7
	.word 0x8b321009  ! 324: SRLX_R	srlx	%r8, %r9, %r5
	.word 0xb89a2790  ! 324: XORcc_I	xorcc 	%r8, 0x0790, %r28
	.word 0x8cb22a48  ! 324: SUBCcc_I	orncc 	%r8, 0x0a48, %r6
	.word 0x8f2a1009  ! 324: SLLX_R	sllx	%r8, %r9, %r7
	.word 0xd8220009  ! 329: STW_R	stw	%r12, [%r8 + %r9]
	.word 0xf64a0009  ! 329: LDSB_R	ldsb	[%r8 + %r9], %r27
	.word 0x84a20009  ! 329: SUBcc_R	subcc 	%r8, %r9, %r2
	.word 0xacfa0009  ! 329: SDIVcc_R	sdivcc 	%r8, %r9, %r22
	.word 0xf4320009  ! 334: STH_R	sth	%r26, [%r8 + %r9]
	.word 0xf7020009  ! 334: LDF_R	ld	[%r8, %r9], %f27
	.word 0x8af20009  ! 334: UDIVcc_R	udivcc 	%r8, %r9, %r5
	.word 0x856a0009  ! 334: SDIVX_R	sdivx	%r8, %r9, %r2
	.word 0xe53a0009  ! 338: STDF_R	std	%f18, [%r9, %r8]
	.word 0xfd1a0009  ! 338: LDDF_R	ldd	[%r8, %r9], %f30
	.word 0xb6720009  ! 338: UDIV_R	udiv 	%r8, %r9, %r27
	.word 0xa66a0009  ! 338: UDIVX_R	udivx 	%r8, %r9, %r19
	.word 0x0e800001  ! 342: BVS	bvs  	<label_0x1>
	.word 0x8c722440  ! 342: UDIV_I	udiv 	%r8, 0x0440, %r6
	.word 0xc93a0009  ! 346: STDF_R	std	%f4, [%r9, %r8]
	.word 0xd80a0009  ! 346: LDUB_R	ldub	[%r8 + %r9], %r12
	.word 0x847a2e78  ! 346: SDIV_I	sdiv 	%r8, 0x0e78, %r2
	.word 0xa06a0009  ! 346: UDIVX_R	udivx 	%r8, %r9, %r16
	.word 0x30800001  ! 348: BA	ba,a	<label_0x1>
	.word 0xb6fa26cc  ! 348: SDIVcc_I	sdivcc 	%r8, 0x06cc, %r27
	.word 0xe42a0009  ! 352: STB_R	stb	%r18, [%r8 + %r9]
	.word 0xc84a0009  ! 352: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0x8a6a2188  ! 352: UDIVX_I	udivx 	%r8, 0x0188, %r5
	.word 0xb8f20009  ! 352: UDIVcc_R	udivcc 	%r8, %r9, %r28
	.word 0x18800001  ! 354: BGU	bgu  	<label_0x1>
	.word 0x88f20009  ! 354: UDIVcc_R	udivcc 	%r8, %r9, %r4
	.word 0x18800001  ! 357: BGU	bgu  	<label_0x1>
	.word 0x946a2510  ! 357: UDIVX_I	udivx 	%r8, 0x0510, %r10
	.word 0xe4220009  ! 361: STW_R	stw	%r18, [%r8 + %r9]
	.word 0xd5020009  ! 361: LDF_R	ld	[%r8, %r9], %f10
	.word 0xc84a0009  ! 361: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0x887a2b2c  ! 361: SDIV_I	sdiv 	%r8, 0x0b2c, %r4
	.word 0x86b20009  ! 362: ORNcc_R	orncc 	%r8, %r9, %r3
	.word 0x9e420009  ! 362: ADDC_R	addc 	%r8, %r9, %r15
	.word 0x8cb224d8  ! 362: SUBCcc_I	orncc 	%r8, 0x04d8, %r6
	.word 0x9cba23a4  ! 362: XNORcc_I	xnorcc 	%r8, 0x03a4, %r14
	.word 0x86120009  ! 362: OR_R	or 	%r8, %r9, %r3
	.word 0x8b323001  ! 362: SRLX_I	srlx	%r8, 0x0001, %r5
	.word 0xa0b20009  ! 362: SUBCcc_R	orncc 	%r8, %r9, %r16
	.word 0x88ba0009  ! 362: XNORcc_R	xnorcc 	%r8, %r9, %r4
	.word 0x8f643801  ! 362: MOVcc_I	<illegal instruction>
	.word 0xac1220e8  ! 362: OR_I	or 	%r8, 0x00e8, %r22
	.word 0x8caa0009  ! 362: ANDNcc_R	andncc 	%r8, %r9, %r6
	.word 0x0cc20001  ! 364: BRGZ	brgz  ,nt	%8,<label_0x20001>
	.word 0xa26a2edc  ! 364: UDIVX_I	udivx 	%r8, 0x0edc, %r17
	.word 0x9c122ec4  ! 365: OR_I	or 	%r8, 0x0ec4, %r14
	.word 0x8a2a0009  ! 365: ANDN_R	andn 	%r8, %r9, %r5
	.word 0x8e0a291c  ! 365: AND_I	and 	%r8, 0x091c, %r7
	.word 0x8aaa2810  ! 365: ANDNcc_I	andncc 	%r8, 0x0810, %r5
	.word 0xba42226c  ! 365: ADDC_I	addc 	%r8, 0x026c, %r29
	.word 0x868a0009  ! 365: ANDcc_R	andcc 	%r8, %r9, %r3
	.word 0xa0022c10  ! 365: ADD_I	add 	%r8, 0x0c10, %r16
	.word 0x869a0009  ! 365: XORcc_R	xorcc 	%r8, %r9, %r3
	.word 0x832a2001  ! 365: SLL_I	sll 	%r8, 0x0001, %r1
	.word 0xb00a0009  ! 365: AND_R	and 	%r8, %r9, %r24
	.word 0x8ab22320  ! 365: ORNcc_I	orncc 	%r8, 0x0320, %r5
	.word 0x8e322e40  ! 365: SUBC_I	orn 	%r8, 0x0e40, %r7
	.word 0x84020009  ! 366: ADD_R	add 	%r8, %r9, %r2
	.word 0x9d3a0009  ! 366: SRA_R	sra 	%r8, %r9, %r14
	.word 0xbe3a0009  ! 366: XNOR_R	xnor 	%r8, %r9, %r31
	.word 0x82aa0009  ! 366: ANDNcc_R	andncc 	%r8, %r9, %r1
	.word 0x8c3a20c0  ! 366: XNOR_I	xnor 	%r8, 0x00c0, %r6
	.word 0x849a0009  ! 366: XORcc_R	xorcc 	%r8, %r9, %r2
	.word 0x8b320009  ! 366: SRL_R	srl 	%r8, %r9, %r5
	.word 0x86b22bac  ! 366: SUBCcc_I	orncc 	%r8, 0x0bac, %r3
	.word 0xb1782401  ! 366: MOVR_I	move	%r0, 0xffffffac, %r24
	.word 0x8caa22c4  ! 366: ANDNcc_I	andncc 	%r8, 0x02c4, %r6
	.word 0x8a0a2df4  ! 366: AND_I	and 	%r8, 0x0df4, %r5
	.word 0x83320009  ! 366: SRL_R	srl 	%r8, %r9, %r1
	.word 0x829a298c  ! 366: XORcc_I	xorcc 	%r8, 0x098c, %r1
	.word 0x8eba0009  ! 366: XNORcc_R	xnorcc 	%r8, %r9, %r7
	.word 0x82220009  ! 366: SUB_R	sub 	%r8, %r9, %r1
	.word 0x0e800001  ! 369: BVS	bvs  	<label_0x1>
	.word 0x82f226e4  ! 369: UDIVcc_I	udivcc 	%r8, 0x06e4, %r1
	.word 0xd6220009  ! 373: STW_R	stw	%r11, [%r8 + %r9]
	.word 0xc20a0009  ! 373: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0x876a2188  ! 373: SDIVX_I	sdivx	%r8, 0x0188, %r3
	.word 0x827a29ac  ! 373: SDIV_I	sdiv 	%r8, 0x09ac, %r1
	.word 0xf8220009  ! 377: STW_R	stw	%r28, [%r8 + %r9]
	.word 0xcf020009  ! 377: LDF_R	ld	[%r8, %r9], %f7
	.word 0xbd6a0009  ! 377: SDIVX_R	sdivx	%r8, %r9, %r30
	.word 0x8cf20009  ! 377: UDIVcc_R	udivcc 	%r8, %r9, %r6
	.word 0x88aa2734  ! 378: ANDNcc_I	andncc 	%r8, 0x0734, %r4
	.word 0xb5322001  ! 378: SRL_I	srl 	%r8, 0x0001, %r26
	.word 0xaa322940  ! 378: SUBC_I	orn 	%r8, 0x0940, %r21
	.word 0x84020009  ! 378: ADD_R	add 	%r8, %r9, %r2
	.word 0x842a0009  ! 378: ANDN_R	andn 	%r8, %r9, %r2
	.word 0x973a1009  ! 378: SRAX_R	srax	%r8, %r9, %r11
	.word 0x9e422548  ! 378: ADDC_I	addc 	%r8, 0x0548, %r15
	.word 0xb8b22114  ! 378: SUBCcc_I	orncc 	%r8, 0x0114, %r28
	.word 0x8aa22dd4  ! 378: SUBcc_I	subcc 	%r8, 0x0dd4, %r5
	.word 0x96aa0009  ! 378: ANDNcc_R	andncc 	%r8, %r9, %r11
	.word 0x86b20009  ! 378: SUBCcc_R	orncc 	%r8, %r9, %r3
	.word 0x849a0009  ! 378: XORcc_R	xorcc 	%r8, %r9, %r2
	.word 0x8a420009  ! 378: ADDC_R	addc 	%r8, %r9, %r5
	.word 0x12800001  ! 382: BNE	bne  	<label_0x1>
	.word 0x8e7a24f8  ! 382: SDIV_I	sdiv 	%r8, 0x04f8, %r7
	.word 0x00800001  ! 384: BN	bn  	<label_0x1>
	.word 0xa8fa249c  ! 384: SDIVcc_I	sdivcc 	%r8, 0x049c, %r20
	.word 0xb3641809  ! 385: MOVcc_R	<illegal instruction>
	.word 0x8aaa0009  ! 385: ANDNcc_R	andncc 	%r8, %r9, %r5
	.word 0x8eb20009  ! 385: SUBCcc_R	orncc 	%r8, %r9, %r7
	.word 0x8ab20009  ! 385: ORNcc_R	orncc 	%r8, %r9, %r5
	.word 0xa632204c  ! 385: SUBC_I	orn 	%r8, 0x004c, %r19
	.word 0x8b322001  ! 385: SRL_I	srl 	%r8, 0x0001, %r5
	.word 0x8eaa0009  ! 385: ANDNcc_R	andncc 	%r8, %r9, %r7
	.word 0x8e2224e4  ! 385: SUB_I	sub 	%r8, 0x04e4, %r7
	.word 0x872a3001  ! 385: SLLX_I	sllx	%r8, 0x0001, %r3
	.word 0x893a3001  ! 385: SRAX_I	srax	%r8, 0x0001, %r4
	.word 0x88320009  ! 385: SUBC_R	orn 	%r8, %r9, %r4
	.word 0x8ac20009  ! 385: ADDCcc_R	addccc 	%r8, %r9, %r5
	.word 0x8cb20009  ! 385: ORNcc_R	orncc 	%r8, %r9, %r6
	.word 0x861a0009  ! 385: XOR_R	xor 	%r8, %r9, %r3
	.word 0xf8320009  ! 389: STH_R	sth	%r28, [%r8 + %r9]
	.word 0xda5a0009  ! 389: LDX_R	ldx	[%r8 + %r9], %r13
	.word 0xc4122c0c  ! 389: LDUH_I	lduh	[%r8 + 0x0c0c], %r2
	.word 0x8cfa2318  ! 389: SDIVcc_I	sdivcc 	%r8, 0x0318, %r6
	.word 0x3c800001  ! 393: BPOS	bpos,a	<label_0x1>
	.word 0x8a720009  ! 393: UDIV_R	udiv 	%r8, %r9, %r5
	.word 0x36800001  ! 397: BGE	bge,a	<label_0x1>
	.word 0x84fa0009  ! 397: SDIVcc_R	sdivcc 	%r8, %r9, %r2
	.word 0xca2a0009  ! 402: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc31a0009  ! 402: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xb86a0009  ! 402: UDIVX_R	udivx 	%r8, %r9, %r28
	.word 0x827a2b84  ! 402: SDIV_I	sdiv 	%r8, 0x0b84, %r1
	.word 0x02ca0001  ! 408: BRZ	brz  ,pt	%8,<label_0xa0001>
	.word 0x82f20009  ! 408: UDIVcc_R	udivcc 	%r8, %r9, %r1
	.word 0xdc220009  ! 412: STW_R	stw	%r14, [%r8 + %r9]
	.word 0xf45a0009  ! 412: LDX_R	ldx	[%r8 + %r9], %r26
	.word 0xb6b20009  ! 412: SUBCcc_R	orncc 	%r8, %r9, %r27
	.word 0x8ef20009  ! 412: UDIVcc_R	udivcc 	%r8, %r9, %r7
	.word 0xa28a0009  ! 417: ANDcc_R	andcc 	%r8, %r9, %r17
	.word 0xa8820009  ! 417: ADDcc_R	addcc 	%r8, %r9, %r20
	.word 0xbd643801  ! 417: MOVcc_I	<illegal instruction>
	.word 0x88322094  ! 417: ORN_I	orn 	%r8, 0x0094, %r4
	.word 0x8a120009  ! 417: OR_R	or 	%r8, %r9, %r5
	.word 0xa52a3001  ! 417: SLLX_I	sllx	%r8, 0x0001, %r18
	.word 0xb6aa0009  ! 417: ANDNcc_R	andncc 	%r8, %r9, %r27
	.word 0xb6ba2950  ! 417: XNORcc_I	xnorcc 	%r8, 0x0950, %r27
	.word 0x8eb2292c  ! 417: ORNcc_I	orncc 	%r8, 0x092c, %r7
	.word 0xa8820009  ! 417: ADDcc_R	addcc 	%r8, %r9, %r20
	.word 0x8d321009  ! 417: SRLX_R	srlx	%r8, %r9, %r6
	.word 0x82322174  ! 417: ORN_I	orn 	%r8, 0x0174, %r1
	.word 0x833a3001  ! 417: SRAX_I	srax	%r8, 0x0001, %r1
	.word 0xcc720009  ! 421: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc7020009  ! 421: LDF_R	ld	[%r8, %r9], %f3
	.word 0x846a2720  ! 421: UDIVX_I	udivx 	%r8, 0x0720, %r2
	.word 0x8e7a0009  ! 421: SDIV_R	sdiv 	%r8, %r9, %r7
	.word 0x868a2f7c  ! 422: ANDcc_I	andcc 	%r8, 0x0f7c, %r3
	.word 0x8c220009  ! 422: SUB_R	sub 	%r8, %r9, %r6
	.word 0x852a2001  ! 422: SLL_I	sll 	%r8, 0x0001, %r2
	.word 0x893a1009  ! 422: SRAX_R	srax	%r8, %r9, %r4
	.word 0xb83224f4  ! 422: ORN_I	orn 	%r8, 0x04f4, %r28
	.word 0x82422454  ! 422: ADDC_I	addc 	%r8, 0x0454, %r1
	.word 0x8ab20009  ! 422: SUBCcc_R	orncc 	%r8, %r9, %r5
	.word 0x84ba25ac  ! 422: XNORcc_I	xnorcc 	%r8, 0x05ac, %r2
	.word 0x833a0009  ! 422: SRA_R	sra 	%r8, %r9, %r1
	.word 0x8e222e2c  ! 422: SUB_I	sub 	%r8, 0x0e2c, %r7
	.word 0x82320009  ! 422: ORN_R	orn 	%r8, %r9, %r1
	.word 0xbe120009  ! 422: OR_R	or 	%r8, %r9, %r31
	.word 0xb5320009  ! 422: SRL_R	srl 	%r8, %r9, %r26
	.word 0xbcc226cc  ! 422: ADDCcc_I	addccc 	%r8, 0x06cc, %r30
	.word 0xc4220009  ! 426: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xf4120009  ! 426: LDUH_R	lduh	[%r8 + %r9], %r26
	.word 0x8cfa0009  ! 426: SDIVcc_R	sdivcc 	%r8, %r9, %r6
	.word 0x86fa0009  ! 426: SDIVcc_R	sdivcc 	%r8, %r9, %r3
	.word 0xea2a0009  ! 430: STB_R	stb	%r21, [%r8 + %r9]
	.word 0xcc1a0009  ! 430: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xbcf22dc4  ! 430: UDIVcc_I	udivcc 	%r8, 0x0dc4, %r30
	.word 0x84f22cb0  ! 430: UDIVcc_I	udivcc 	%r8, 0x0cb0, %r2
	.word 0xf8720009  ! 434: STX_R	stx	%r28, [%r8 + %r9]
	.word 0xf9020009  ! 434: LDF_R	ld	[%r8, %r9], %f28
	.word 0xc09a1009  ! 434: LDDA_R	ldda	[%r8, %r9] 0x80, %r0
	.word 0x8afa0009  ! 434: SDIVcc_R	sdivcc 	%r8, %r9, %r5
	.word 0x86822148  ! 435: ADDcc_I	addcc 	%r8, 0x0148, %r3
	.word 0x8a422788  ! 435: ADDC_I	addc 	%r8, 0x0788, %r5
	.word 0x84b20009  ! 435: ORNcc_R	orncc 	%r8, %r9, %r2
	.word 0x88c22d78  ! 435: ADDCcc_I	addccc 	%r8, 0x0d78, %r4
	.word 0x86b22010  ! 435: SUBCcc_I	orncc 	%r8, 0x0010, %r3
	.word 0x9ab20009  ! 435: ORNcc_R	orncc 	%r8, %r9, %r13
	.word 0x842a2720  ! 435: ANDN_I	andn 	%r8, 0x0720, %r2
	.word 0xb2420009  ! 435: ADDC_R	addc 	%r8, %r9, %r25
	.word 0x9ca20009  ! 435: SUBcc_R	subcc 	%r8, %r9, %r14
	.word 0x85641809  ! 435: MOVcc_R	<illegal instruction>
	.word 0xc62a0009  ! 439: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xcc020009  ! 439: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xb2f22be4  ! 439: UDIVcc_I	udivcc 	%r8, 0x0be4, %r25
	.word 0x887a0009  ! 439: SDIV_R	sdiv 	%r8, %r9, %r4
	.word 0xb3321009  ! 440: SRLX_R	srlx	%r8, %r9, %r25
	.word 0x8ab22b58  ! 440: ORNcc_I	orncc 	%r8, 0x0b58, %r5
	.word 0x8f2a1009  ! 440: SLLX_R	sllx	%r8, %r9, %r7
	.word 0x861a0009  ! 440: XOR_R	xor 	%r8, %r9, %r3
	.word 0x88222534  ! 440: SUB_I	sub 	%r8, 0x0534, %r4
	.word 0xb81a2660  ! 440: XOR_I	xor 	%r8, 0x0660, %r28
	.word 0x849a0009  ! 440: XORcc_R	xorcc 	%r8, %r9, %r2
	.word 0x9c3a2340  ! 440: XNOR_I	xnor 	%r8, 0x0340, %r14
	.word 0x8aba0009  ! 440: XNORcc_R	xnorcc 	%r8, %r9, %r5
	.word 0x8a222fc0  ! 440: SUB_I	sub 	%r8, 0x0fc0, %r5
	.word 0xb88a0009  ! 440: ANDcc_R	andcc 	%r8, %r9, %r28
	.word 0x82320009  ! 440: SUBC_R	orn 	%r8, %r9, %r1
	.word 0x843a2d34  ! 441: XNOR_I	xnor 	%r8, 0x0d34, %r2
	.word 0x8b323001  ! 441: SRLX_I	srlx	%r8, 0x0001, %r5
	.word 0x96aa0009  ! 441: ANDNcc_R	andncc 	%r8, %r9, %r11
	.word 0x8d2a3001  ! 441: SLLX_I	sllx	%r8, 0x0001, %r6
	.word 0x86320009  ! 441: SUBC_R	orn 	%r8, %r9, %r3
	.word 0x88b221a4  ! 441: ORNcc_I	orncc 	%r8, 0x01a4, %r4
	.word 0x96b20009  ! 441: SUBCcc_R	orncc 	%r8, %r9, %r11
	.word 0x8cb225a8  ! 441: ORNcc_I	orncc 	%r8, 0x05a8, %r6
	.word 0x8cb22eb4  ! 441: SUBCcc_I	orncc 	%r8, 0x0eb4, %r6
	.word 0x9f322001  ! 441: SRL_I	srl 	%r8, 0x0001, %r15
	.word 0x892a3001  ! 441: SLLX_I	sllx	%r8, 0x0001, %r4
	.word 0x8e3a2148  ! 441: XNOR_I	xnor 	%r8, 0x0148, %r7
	.word 0xcc2a0009  ! 445: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xca020009  ! 445: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0x9ef22558  ! 445: UDIVcc_I	udivcc 	%r8, 0x0558, %r15
	.word 0x9e7a2708  ! 445: SDIV_I	sdiv 	%r8, 0x0708, %r15
	.word 0x14800001  ! 447: BG	bg  	<label_0x1>
	.word 0x8e720009  ! 447: UDIV_R	udiv 	%r8, %r9, %r7
	.word 0x8a820009  ! 448: ADDcc_R	addcc 	%r8, %r9, %r5
	.word 0xa92a1009  ! 448: SLLX_R	sllx	%r8, %r9, %r20
	.word 0x82220009  ! 448: SUB_R	sub 	%r8, %r9, %r1
	.word 0x88a20009  ! 448: SUBcc_R	subcc 	%r8, %r9, %r4
	.word 0x8f3a0009  ! 448: SRA_R	sra 	%r8, %r9, %r7
	.word 0x873a3001  ! 448: SRAX_I	srax	%r8, 0x0001, %r3
	.word 0xb8120009  ! 448: OR_R	or 	%r8, %r9, %r28
	.word 0x9f2a1009  ! 448: SLLX_R	sllx	%r8, %r9, %r15
	.word 0x8a220009  ! 448: SUB_R	sub 	%r8, %r9, %r5
	.word 0x8c9220ec  ! 448: ORcc_I	orcc 	%r8, 0x00ec, %r6
	.word 0x8e020009  ! 448: ADD_R	add 	%r8, %r9, %r7
	.word 0x860a0009  ! 448: AND_R	and 	%r8, %r9, %r3
	.word 0x85782401  ! 448: MOVR_I	move	%r0, 0x9, %r2
	.word 0x8e020009  ! 448: ADD_R	add 	%r8, %r9, %r7
	.word 0x8e2229ec  ! 449: SUB_I	sub 	%r8, 0x09ec, %r7
	.word 0x8eb22070  ! 449: SUBCcc_I	orncc 	%r8, 0x0070, %r7
	.word 0x8b320009  ! 449: SRL_R	srl 	%r8, %r9, %r5
	.word 0xab643801  ! 449: MOVcc_I	<illegal instruction>
	.word 0x8e122860  ! 449: OR_I	or 	%r8, 0x0860, %r7
	.word 0x892a1009  ! 449: SLLX_R	sllx	%r8, %r9, %r4
	.word 0x88c22d20  ! 449: ADDCcc_I	addccc 	%r8, 0x0d20, %r4
	.word 0x84020009  ! 449: ADD_R	add 	%r8, %r9, %r2
	.word 0xb022256c  ! 449: SUB_I	sub 	%r8, 0x056c, %r24
	.word 0x86ba217c  ! 449: XNORcc_I	xnorcc 	%r8, 0x017c, %r3
	.word 0x8e420009  ! 449: ADDC_R	addc 	%r8, %r9, %r7
	.word 0x8f322001  ! 449: SRL_I	srl 	%r8, 0x0001, %r7
	.word 0x841a0009  ! 449: XOR_R	xor 	%r8, %r9, %r2
	.word 0xce2a0009  ! 453: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc84a0009  ! 453: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0x8e9a2568  ! 453: XORcc_I	xorcc 	%r8, 0x0568, %r7
	.word 0x84fa2f9c  ! 453: SDIVcc_I	sdivcc 	%r8, 0x0f9c, %r2
	.word 0x2a800002  ! 455: BCS	bcs,a	<label_0x2>
	.word 0x856a0009  ! 455: SDIVX_R	sdivx	%r8, %r9, %r2
	.word 0xf2220009  ! 462: STW_R	stw	%r25, [%r8 + %r9]
	.word 0xc81a0009  ! 462: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xa3643801  ! 462: MOVcc_I	<illegal instruction>
	.word 0x8e822590  ! 462: ADDcc_I	addcc 	%r8, 0x0590, %r7
	.word 0x9d780409  ! 462: MOVR_R	move	%r0, %r9, %r14
	.word 0xacfa0009  ! 462: SDIVcc_R	sdivcc 	%r8, %r9, %r22
	.word 0x861a0009  ! 464: XOR_R	xor 	%r8, %r9, %r3
	.word 0x8f3a1009  ! 464: SRAX_R	srax	%r8, %r9, %r7
	.word 0x8e422244  ! 464: ADDC_I	addc 	%r8, 0x0244, %r7
	.word 0xba920009  ! 464: ORcc_R	orcc 	%r8, %r9, %r29
	.word 0x833a0009  ! 464: SRA_R	sra 	%r8, %r9, %r1
	.word 0x8b3a2001  ! 464: SRA_I	sra 	%r8, 0x0001, %r5
	.word 0x8e8a2854  ! 464: ANDcc_I	andcc 	%r8, 0x0854, %r7
	.word 0xa8922930  ! 464: ORcc_I	orcc 	%r8, 0x0930, %r20
	.word 0xb93a2001  ! 464: SRA_I	sra 	%r8, 0x0001, %r28
	.word 0x860a2780  ! 464: AND_I	and 	%r8, 0x0780, %r3
	.word 0x8c2226a0  ! 464: SUB_I	sub 	%r8, 0x06a0, %r6
	.word 0xbaaa0009  ! 464: ANDNcc_R	andncc 	%r8, %r9, %r29
	.word 0x8c920009  ! 464: ORcc_R	orcc 	%r8, %r9, %r6
	.word 0x2e800002  ! 466: BVS	bvs,a	<label_0x2>
	.word 0xaaf20009  ! 466: UDIVcc_R	udivcc 	%r8, %r9, %r21
	.word 0xc8320009  ! 470: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc6520009  ! 470: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0x88720009  ! 470: UDIV_R	udiv 	%r8, %r9, %r4
	.word 0x826a2a14  ! 470: UDIVX_I	udivx 	%r8, 0x0a14, %r1
	.word 0xcc220009  ! 479: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc5020009  ! 479: LDF_R	ld	[%r8, %r9], %f2
	.word 0xb86a2154  ! 479: UDIVX_I	udivx 	%r8, 0x0154, %r28
	.word 0x82fa0009  ! 479: SDIVcc_R	sdivcc 	%r8, %r9, %r1
	.word 0xca720009  ! 483: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc80a0009  ! 483: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0x86722078  ! 483: UDIV_I	udiv 	%r8, 0x0078, %r3
	.word 0x8cfa0009  ! 483: SDIVcc_R	sdivcc 	%r8, %r9, %r6
	.word 0xcc2a0009  ! 488: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xcc0a0009  ! 488: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0x8c722c2c  ! 488: UDIV_I	udiv 	%r8, 0x0c2c, %r6
	.word 0x8a6a2768  ! 488: UDIVX_I	udivx 	%r8, 0x0768, %r5
	.word 0xf3220009  ! 492: STF_R	st	%f25, [%r9, %r8]
	.word 0xee0a0009  ! 492: LDUB_R	ldub	[%r8 + %r9], %r23
	.word 0x8f3a0009  ! 492: SRA_R	sra 	%r8, %r9, %r7
	.word 0x8e7a20b8  ! 492: SDIV_I	sdiv 	%r8, 0x00b8, %r7
	.word 0x0e800001  ! 494: BVS	bvs  	<label_0x1>
	.word 0x846a0009  ! 494: UDIVX_R	udivx 	%r8, %r9, %r2
	.word 0x24c20001  ! 496: BRLEZ	brlez,a,nt	%8,<label_0x20001>
	.word 0x82f223e8  ! 496: UDIVcc_I	udivcc 	%r8, 0x03e8, %r1
	.word 0x822a0009  ! 498: ANDN_R	andn 	%r8, %r9, %r1
	.word 0x82920009  ! 498: ORcc_R	orcc 	%r8, %r9, %r1
	.word 0x8a9a2860  ! 498: XORcc_I	xorcc 	%r8, 0x0860, %r5
	.word 0x88ba0009  ! 498: XNORcc_R	xnorcc 	%r8, %r9, %r4
	.word 0x8eb20009  ! 498: SUBCcc_R	orncc 	%r8, %r9, %r7
	.word 0x868a0009  ! 498: ANDcc_R	andcc 	%r8, %r9, %r3
	.word 0x821a0009  ! 498: XOR_R	xor 	%r8, %r9, %r1
	.word 0xa29a0009  ! 498: XORcc_R	xorcc 	%r8, %r9, %r17
	.word 0x873a3001  ! 498: SRAX_I	srax	%r8, 0x0001, %r3
	.word 0xaab20009  ! 498: SUBCcc_R	orncc 	%r8, %r9, %r21
	.word 0x8e122d5c  ! 498: OR_I	or 	%r8, 0x0d5c, %r7
	.word 0x9e1a2c14  ! 500: XOR_I	xor 	%r8, 0x0c14, %r15
	.word 0xb00a0009  ! 500: AND_R	and 	%r8, %r9, %r24
	.word 0xa0320009  ! 500: ORN_R	orn 	%r8, %r9, %r16
	.word 0x860a217c  ! 500: AND_I	and 	%r8, 0x017c, %r3
	.word 0xb4920009  ! 500: ORcc_R	orcc 	%r8, %r9, %r26
	.word 0x8caa29f0  ! 500: ANDNcc_I	andncc 	%r8, 0x09f0, %r6
	.word 0x8f780409  ! 500: MOVR_R	move	%r0, %r9, %r7
	.word 0x8a222acc  ! 500: SUB_I	sub 	%r8, 0x0acc, %r5
	.word 0xaaaa0009  ! 500: ANDNcc_R	andncc 	%r8, %r9, %r21
	.word 0x82a22258  ! 500: SUBcc_I	subcc 	%r8, 0x0258, %r1
	.word 0xa73a0009  ! 500: SRA_R	sra 	%r8, %r9, %r19
	.word 0xbd3a2001  ! 500: SRA_I	sra 	%r8, 0x0001, %r30
	.word 0x8c0a0009  ! 502: AND_R	and 	%r8, %r9, %r6
	.word 0xb6b22ac4  ! 502: ORNcc_I	orncc 	%r8, 0x0ac4, %r27
	.word 0x829229f4  ! 502: ORcc_I	orcc 	%r8, 0x09f4, %r1
	.word 0x9a022968  ! 502: ADD_I	add 	%r8, 0x0968, %r13
	.word 0x8d3a1009  ! 502: SRAX_R	srax	%r8, %r9, %r6
	.word 0xa61a0009  ! 502: XOR_R	xor 	%r8, %r9, %r19
	.word 0x89643801  ! 502: MOVcc_I	<illegal instruction>
	.word 0x843229c0  ! 502: ORN_I	orn 	%r8, 0x09c0, %r2
	.word 0x88b226b4  ! 502: SUBCcc_I	orncc 	%r8, 0x06b4, %r4
	.word 0xbcaa0009  ! 502: ANDNcc_R	andncc 	%r8, %r9, %r30
	.word 0x8aba24f8  ! 502: XNORcc_I	xnorcc 	%r8, 0x04f8, %r5
	.word 0xb2b20009  ! 502: ORNcc_R	orncc 	%r8, %r9, %r25
	.word 0xaa2a0009  ! 502: ANDN_R	andn 	%r8, %r9, %r21
	.word 0x8c022f30  ! 502: ADD_I	add 	%r8, 0x0f30, %r6
	.word 0xa28a0009  ! 502: ANDcc_R	andcc 	%r8, %r9, %r17
	.word 0x40000001  ! 505: CALL	call	disp30_1
	.word 0x836a0009  ! 505: SDIVX_R	sdivx	%r8, %r9, %r1
	.word 0x82322644  ! 506: ORN_I	orn 	%r8, 0x0644, %r1
	.word 0x88022408  ! 506: ADD_I	add 	%r8, 0x0408, %r4
	.word 0x8e32276c  ! 506: SUBC_I	orn 	%r8, 0x076c, %r7
	.word 0x82b20009  ! 506: SUBCcc_R	orncc 	%r8, %r9, %r1
	.word 0x97780409  ! 506: MOVR_R	move	%r0, %r9, %r11
	.word 0xb33a2001  ! 506: SRA_I	sra 	%r8, 0x0001, %r25
	.word 0x82922fc0  ! 506: ORcc_I	orcc 	%r8, 0x0fc0, %r1
	.word 0xb0b20009  ! 506: SUBCcc_R	orncc 	%r8, %r9, %r24
	.word 0x88b20009  ! 506: SUBCcc_R	orncc 	%r8, %r9, %r4
	.word 0x8e8a2380  ! 506: ANDcc_I	andcc 	%r8, 0x0380, %r7
	.word 0x88820009  ! 506: ADDcc_R	addcc 	%r8, %r9, %r4
	.word 0xb89a0009  ! 506: XORcc_R	xorcc 	%r8, %r9, %r28
	.word 0x880a0009  ! 506: AND_R	and 	%r8, %r9, %r4
	.word 0x85643801  ! 506: MOVcc_I	<illegal instruction>
	.word 0x842a0009  ! 506: ANDN_R	andn 	%r8, %r9, %r2
	.word 0xce2a0009  ! 511: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xce4a0009  ! 511: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0x88720009  ! 511: UDIV_R	udiv 	%r8, %r9, %r4
	.word 0x826a0009  ! 511: UDIVX_R	udivx 	%r8, %r9, %r1
	.word 0x40000001  ! 517: CALL	call	disp30_1
	.word 0x896a26a4  ! 517: SDIVX_I	sdivx	%r8, 0x06a4, %r4
	.word 0xf8220009  ! 522: STW_R	stw	%r28, [%r8 + %r9]
	.word 0xc4020009  ! 522: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0x9f3a0009  ! 522: SRA_R	sra 	%r8, %r9, %r15
	.word 0xbb6a2b58  ! 522: SDIVX_I	sdivx	%r8, 0x0b58, %r29
	.word 0xca720009  ! 526: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc64a0009  ! 526: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xf8ca20bc  ! 526: LDSBA_I	ldsba	[%r8, + 0x00bc] %asi, %r28
	.word 0x8afa0009  ! 526: SDIVcc_R	sdivcc 	%r8, %r9, %r5
	.word 0x40000002  ! 535: CALL	call	disp30_2
	.word 0x98f22c74  ! 535: UDIVcc_I	udivcc 	%r8, 0x0c74, %r12
	.word 0x8f3a0009  ! 536: SRA_R	sra 	%r8, %r9, %r7
	.word 0x84aa27cc  ! 536: ANDNcc_I	andncc 	%r8, 0x07cc, %r2
	.word 0xbc1a21c0  ! 536: XOR_I	xor 	%r8, 0x01c0, %r30
	.word 0xa2322a8c  ! 536: SUBC_I	orn 	%r8, 0x0a8c, %r17
	.word 0x88c224cc  ! 536: ADDCcc_I	addccc 	%r8, 0x04cc, %r4
	.word 0x861a0009  ! 536: XOR_R	xor 	%r8, %r9, %r3
	.word 0x85320009  ! 536: SRL_R	srl 	%r8, %r9, %r2
	.word 0x84322f90  ! 536: ORN_I	orn 	%r8, 0x0f90, %r2
	.word 0x8e0a25a4  ! 536: AND_I	and 	%r8, 0x05a4, %r7
	.word 0xa92a2001  ! 536: SLL_I	sll 	%r8, 0x0001, %r20
	.word 0x8aa22068  ! 536: SUBcc_I	subcc 	%r8, 0x0068, %r5
	.word 0x98b20009  ! 536: SUBCcc_R	orncc 	%r8, %r9, %r12
	.word 0x9a422164  ! 536: ADDC_I	addc 	%r8, 0x0164, %r13
	.word 0x9c9a2450  ! 536: XORcc_I	xorcc 	%r8, 0x0450, %r14
	.word 0x8c222724  ! 536: SUB_I	sub 	%r8, 0x0724, %r6
	.word 0xe82a0009  ! 543: STB_R	stb	%r20, [%r8 + %r9]
	.word 0xea5a0009  ! 543: LDX_R	ldx	[%r8 + %r9], %r21
	.word 0xa6fa0009  ! 543: SDIVcc_R	sdivcc 	%r8, %r9, %r19
	.word 0x8a6a2c44  ! 543: UDIVX_I	udivx 	%r8, 0x0c44, %r5
	.word 0xcc320009  ! 552: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc64a0009  ! 552: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xc64a0009  ! 552: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0x876a0009  ! 552: SDIVX_R	sdivx	%r8, %r9, %r3
	.word 0x24800001  ! 554: BLE	ble,a	<label_0x1>
	.word 0x8b6a21f4  ! 554: SDIVX_I	sdivx	%r8, 0x01f4, %r5
	.word 0xc22a0009  ! 559: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xcc1a0009  ! 559: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xb0fa29c4  ! 559: SDIVcc_I	sdivcc 	%r8, 0x09c4, %r24
	.word 0x8e722d44  ! 559: UDIV_I	udiv 	%r8, 0x0d44, %r7
	.word 0x0ec20001  ! 563: BRGEZ	brgez  ,nt	%8,<label_0x20001>
	.word 0x8a6a0009  ! 563: UDIVX_R	udivx 	%r8, %r9, %r5
	.word 0xe8220009  ! 568: STW_R	stw	%r20, [%r8 + %r9]
	.word 0xec1a0009  ! 568: LDD_R	ldd	[%r8 + %r9], %r22
	.word 0x9a120009  ! 568: OR_R	or 	%r8, %r9, %r13
	.word 0xba720009  ! 568: UDIV_R	udiv 	%r8, %r9, %r29
	.word 0x02800001  ! 571: BE	be  	<label_0x1>
	.word 0xb47a0009  ! 571: SDIV_R	sdiv 	%r8, %r9, %r26
	.word 0x8e2a0009  ! 573: ANDN_R	andn 	%r8, %r9, %r7
	.word 0x821a289c  ! 573: XOR_I	xor 	%r8, 0x089c, %r1
	.word 0x8b782401  ! 573: MOVR_I	move	%r0, 0x89c, %r5
	.word 0x8eb2234c  ! 573: SUBCcc_I	orncc 	%r8, 0x034c, %r7
	.word 0xbab22fc0  ! 573: SUBCcc_I	orncc 	%r8, 0x0fc0, %r29
	.word 0x8cb22100  ! 573: ORNcc_I	orncc 	%r8, 0x0100, %r6
	.word 0x9b643801  ! 573: MOVcc_I	<illegal instruction>
	.word 0x86422b30  ! 573: ADDC_I	addc 	%r8, 0x0b30, %r3
	.word 0xb9323001  ! 573: SRLX_I	srlx	%r8, 0x0001, %r28
	.word 0x8e3a2978  ! 573: XNOR_I	xnor 	%r8, 0x0978, %r7
	.word 0x8a120009  ! 573: OR_R	or 	%r8, %r9, %r5
	.word 0x84aa23c8  ! 573: ANDNcc_I	andncc 	%r8, 0x03c8, %r2
	.word 0x85780409  ! 573: MOVR_R	move	%r0, %r9, %r2
	.word 0x8e3226d0  ! 573: ORN_I	orn 	%r8, 0x06d0, %r7
	.word 0xc2320009  ! 577: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xfc5a0009  ! 577: LDX_R	ldx	[%r8 + %r9], %r30
	.word 0xc20a0009  ! 577: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0x88fa0009  ! 577: SDIVcc_R	sdivcc 	%r8, %r9, %r4
	.word 0xf6320009  ! 581: STH_R	sth	%r27, [%r8 + %r9]
	.word 0xc81a0009  ! 581: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x8a6a0009  ! 581: UDIVX_R	udivx 	%r8, %r9, %r5
	.word 0x8cfa2358  ! 581: SDIVcc_I	sdivcc 	%r8, 0x0358, %r6
	.word 0xe6320009  ! 588: STH_R	sth	%r19, [%r8 + %r9]
	.word 0xe44a0009  ! 588: LDSB_R	ldsb	[%r8 + %r9], %r18
	.word 0xaef22d14  ! 588: UDIVcc_I	udivcc 	%r8, 0x0d14, %r23
	.word 0x8a720009  ! 588: UDIV_R	udiv 	%r8, %r9, %r5
	.word 0x34800001  ! 590: BG	bg,a	<label_0x1>
	.word 0xb2fa0009  ! 590: SDIVcc_R	sdivcc 	%r8, %r9, %r25
	.word 0xcd220009  ! 594: STF_R	st	%f6, [%r9, %r8]
	.word 0xc8520009  ! 594: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0x827a0009  ! 594: SDIV_R	sdiv 	%r8, %r9, %r1
	.word 0x886a0009  ! 594: UDIVX_R	udivx 	%r8, %r9, %r4
	.word 0xbec226b0  ! 597: ADDCcc_I	addccc 	%r8, 0x06b0, %r31
	.word 0x85322001  ! 597: SRL_I	srl 	%r8, 0x0001, %r2
	.word 0x98aa2794  ! 597: ANDNcc_I	andncc 	%r8, 0x0794, %r12
	.word 0x8d323001  ! 597: SRLX_I	srlx	%r8, 0x0001, %r6
	.word 0xb68221b8  ! 597: ADDcc_I	addcc 	%r8, 0x01b8, %r27
	.word 0x88ba2560  ! 597: XNORcc_I	xnorcc 	%r8, 0x0560, %r4
	.word 0x88320009  ! 597: ORN_R	orn 	%r8, %r9, %r4
	.word 0x88320009  ! 597: ORN_R	orn 	%r8, %r9, %r4
	.word 0x8232239c  ! 597: ORN_I	orn 	%r8, 0x039c, %r1
	.word 0xa13a0009  ! 597: SRA_R	sra 	%r8, %r9, %r16
	.word 0x34800001  ! 600: BG	bg,a	<label_0x1>
	.word 0x9c7221c4  ! 600: UDIV_I	udiv 	%r8, 0x01c4, %r14
	.word 0x8a822ef4  ! 603: ADDcc_I	addcc 	%r8, 0x0ef4, %r5
	.word 0x889a2aa8  ! 603: XORcc_I	xorcc 	%r8, 0x0aa8, %r4
	.word 0x84c20009  ! 603: ADDCcc_R	addccc 	%r8, %r9, %r2
	.word 0x8e9a2b18  ! 603: XORcc_I	xorcc 	%r8, 0x0b18, %r7
	.word 0x8a9a276c  ! 603: XORcc_I	xorcc 	%r8, 0x076c, %r5
	.word 0x82420009  ! 603: ADDC_R	addc 	%r8, %r9, %r1
	.word 0xae2a25c4  ! 603: ANDN_I	andn 	%r8, 0x05c4, %r23
	.word 0xa832225c  ! 603: ORN_I	orn 	%r8, 0x025c, %r20
	.word 0x888a0009  ! 603: ANDcc_R	andcc 	%r8, %r9, %r4
	.word 0x8b780409  ! 603: MOVR_R	move	%r0, %r9, %r5
	.word 0x8ec22d90  ! 603: ADDCcc_I	addccc 	%r8, 0x0d90, %r7
	.word 0x82822afc  ! 603: ADDcc_I	addcc 	%r8, 0x0afc, %r1
	.word 0xbe32214c  ! 604: ORN_I	orn 	%r8, 0x014c, %r31
	.word 0x8a020009  ! 604: ADD_R	add 	%r8, %r9, %r5
	.word 0x84b22754  ! 604: ORNcc_I	orncc 	%r8, 0x0754, %r2
	.word 0x9f320009  ! 604: SRL_R	srl 	%r8, %r9, %r15
	.word 0xbf323001  ! 604: SRLX_I	srlx	%r8, 0x0001, %r31
	.word 0x8cb22250  ! 604: SUBCcc_I	orncc 	%r8, 0x0250, %r6
	.word 0x860a275c  ! 604: AND_I	and 	%r8, 0x075c, %r3
	.word 0x8eb22a04  ! 604: SUBCcc_I	orncc 	%r8, 0x0a04, %r7
	.word 0xb3641809  ! 604: MOVcc_R	<illegal instruction>
	.word 0xa69a0009  ! 604: XORcc_R	xorcc 	%r8, %r9, %r19
	.word 0x873a3001  ! 604: SRAX_I	srax	%r8, 0x0001, %r3
	.word 0x860a0009  ! 605: AND_R	and 	%r8, %r9, %r3
	.word 0x880a2488  ! 605: AND_I	and 	%r8, 0x0488, %r4
	.word 0x892a3001  ! 605: SLLX_I	sllx	%r8, 0x0001, %r4
	.word 0x8f323001  ! 605: SRLX_I	srlx	%r8, 0x0001, %r7
	.word 0x8ab224a4  ! 605: SUBCcc_I	orncc 	%r8, 0x04a4, %r5
	.word 0xb52a1009  ! 605: SLLX_R	sllx	%r8, %r9, %r26
	.word 0x8ea20009  ! 605: SUBcc_R	subcc 	%r8, %r9, %r7
	.word 0x8aaa2dc8  ! 605: ANDNcc_I	andncc 	%r8, 0x0dc8, %r5
	.word 0xaf780409  ! 605: MOVR_R	move	%r0, %r9, %r23
	.word 0x861a29fc  ! 605: XOR_I	xor 	%r8, 0x09fc, %r3
	.word 0xb8320009  ! 605: SUBC_R	orn 	%r8, %r9, %r28
	.word 0x8e822518  ! 605: ADDcc_I	addcc 	%r8, 0x0518, %r7
	.word 0x873a2001  ! 605: SRA_I	sra 	%r8, 0x0001, %r3
	.word 0xfa220009  ! 609: STW_R	stw	%r29, [%r8 + %r9]
	.word 0xc31a0009  ! 609: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0x82fa0009  ! 609: SDIVcc_R	sdivcc 	%r8, %r9, %r1
	.word 0xbe722f94  ! 609: UDIV_I	udiv 	%r8, 0x0f94, %r31
	.word 0x0a800002  ! 613: BCS	bcs  	<label_0x2>
	.word 0xae722734  ! 613: UDIV_I	udiv 	%r8, 0x0734, %r23
	.word 0x2cc20001  ! 617: BRGZ	brgz,a,nt	%8,<label_0x20001>
	.word 0xaafa0009  ! 617: SDIVcc_R	sdivcc 	%r8, %r9, %r21
	.word 0x8b322001  ! 618: SRL_I	srl 	%r8, 0x0001, %r5
	.word 0x87780409  ! 618: MOVR_R	move	%r0, %r9, %r3
	.word 0x8aaa0009  ! 618: ANDNcc_R	andncc 	%r8, %r9, %r5
	.word 0xbd2a2001  ! 618: SLL_I	sll 	%r8, 0x0001, %r30
	.word 0x86ba0009  ! 618: XNORcc_R	xnorcc 	%r8, %r9, %r3
	.word 0x8eb20009  ! 618: SUBCcc_R	orncc 	%r8, %r9, %r7
	.word 0xa7322001  ! 618: SRL_I	srl 	%r8, 0x0001, %r19
	.word 0x84122e00  ! 618: OR_I	or 	%r8, 0x0e00, %r2
	.word 0x84320009  ! 618: SUBC_R	orn 	%r8, %r9, %r2
	.word 0x8b780409  ! 618: MOVR_R	move	%r0, %r9, %r5
	.word 0x84320009  ! 618: SUBC_R	orn 	%r8, %r9, %r2
	.word 0x8a1a0009  ! 618: XOR_R	xor 	%r8, %r9, %r5
	.word 0xa92a2001  ! 618: SLL_I	sll 	%r8, 0x0001, %r20
	.word 0x86320009  ! 624: SUBC_R	orn 	%r8, %r9, %r3
	.word 0x9f3a2001  ! 624: SRA_I	sra 	%r8, 0x0001, %r15
	.word 0x881a0009  ! 624: XOR_R	xor 	%r8, %r9, %r4
	.word 0x8cc20009  ! 624: ADDCcc_R	addccc 	%r8, %r9, %r6
	.word 0x88b229bc  ! 624: SUBCcc_I	orncc 	%r8, 0x09bc, %r4
	.word 0x83780409  ! 624: MOVR_R	move	%r0, %r9, %r1
	.word 0xb492278c  ! 624: ORcc_I	orcc 	%r8, 0x078c, %r26
	.word 0x84aa20e8  ! 624: ANDNcc_I	andncc 	%r8, 0x00e8, %r2
	.word 0x9b2a3001  ! 624: SLLX_I	sllx	%r8, 0x0001, %r13
	.word 0xbac224fc  ! 624: ADDCcc_I	addccc 	%r8, 0x04fc, %r29
	.word 0x8c322d78  ! 624: SUBC_I	orn 	%r8, 0x0d78, %r6
	.word 0xa1780409  ! 624: MOVR_R	move	%r0, %r9, %r16
	.word 0x26800001  ! 626: BL	bl,a	<label_0x1>
	.word 0x84fa0009  ! 626: SDIVcc_R	sdivcc 	%r8, %r9, %r2
	.word 0x8d3a3001  ! 627: SRAX_I	srax	%r8, 0x0001, %r6
	.word 0x8612262c  ! 627: OR_I	or 	%r8, 0x062c, %r3
	.word 0x88020009  ! 627: ADD_R	add 	%r8, %r9, %r4
	.word 0xa43a2378  ! 627: XNOR_I	xnor 	%r8, 0x0378, %r18
	.word 0x82422e58  ! 627: ADDC_I	addc 	%r8, 0x0e58, %r1
	.word 0x8d3a1009  ! 627: SRAX_R	srax	%r8, %r9, %r6
	.word 0x8c0223a0  ! 627: ADD_I	add 	%r8, 0x03a0, %r6
	.word 0xbc022bf4  ! 627: ADD_I	add 	%r8, 0x0bf4, %r30
	.word 0x8f3a3001  ! 627: SRAX_I	srax	%r8, 0x0001, %r7
	.word 0x880a2eec  ! 627: AND_I	and 	%r8, 0x0eec, %r4
	.word 0xb6a22880  ! 627: SUBcc_I	subcc 	%r8, 0x0880, %r27
	.word 0x823a28c8  ! 627: XNOR_I	xnor 	%r8, 0x08c8, %r1
	.word 0xaaa22278  ! 627: SUBcc_I	subcc 	%r8, 0x0278, %r21
	.word 0x8cba2da0  ! 627: XNORcc_I	xnorcc 	%r8, 0x0da0, %r6
	.word 0xb23a0009  ! 627: XNOR_R	xnor 	%r8, %r9, %r25
	.word 0xc2720009  ! 631: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xcc120009  ! 631: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0x96f20009  ! 631: UDIVcc_R	udivcc 	%r8, %r9, %r11
	.word 0x8e722dcc  ! 631: UDIV_I	udiv 	%r8, 0x0dcc, %r7
	.word 0x86c22d5c  ! 633: ADDCcc_I	addccc 	%r8, 0x0d5c, %r3
	.word 0x8c120009  ! 633: OR_R	or 	%r8, %r9, %r6
	.word 0xa0120009  ! 633: OR_R	or 	%r8, %r9, %r16
	.word 0x8eb22e60  ! 633: ORNcc_I	orncc 	%r8, 0x0e60, %r7
	.word 0x88022444  ! 633: ADD_I	add 	%r8, 0x0444, %r4
	.word 0xbb2a2001  ! 633: SLL_I	sll 	%r8, 0x0001, %r29
	.word 0x8e320009  ! 633: ORN_R	orn 	%r8, %r9, %r7
	.word 0x8f2a3001  ! 633: SLLX_I	sllx	%r8, 0x0001, %r7
	.word 0x83323001  ! 633: SRLX_I	srlx	%r8, 0x0001, %r1
	.word 0xbb323001  ! 633: SRLX_I	srlx	%r8, 0x0001, %r29
	.word 0x8f320009  ! 633: SRL_R	srl 	%r8, %r9, %r7
	.word 0x88ba2a68  ! 633: XNORcc_I	xnorcc 	%r8, 0x0a68, %r4
	.word 0xfc220009  ! 641: STW_R	stw	%r30, [%r8 + %r9]
	.word 0xec120009  ! 641: LDUH_R	lduh	[%r8 + %r9], %r22
	.word 0xce022ba0  ! 641: LDUW_I	lduw	[%r8 + 0x0ba0], %r7
	.word 0xaefa2698  ! 641: SDIVcc_I	sdivcc 	%r8, 0x0698, %r23
	.word 0xaf3a2001  ! 643: SRA_I	sra 	%r8, 0x0001, %r23
	.word 0xb3321009  ! 643: SRLX_R	srlx	%r8, %r9, %r25
	.word 0x96ba2b48  ! 643: XNORcc_I	xnorcc 	%r8, 0x0b48, %r11
	.word 0xb93a0009  ! 643: SRA_R	sra 	%r8, %r9, %r28
	.word 0x8d2a2001  ! 643: SLL_I	sll 	%r8, 0x0001, %r6
	.word 0x8cb228b8  ! 643: ORNcc_I	orncc 	%r8, 0x08b8, %r6
	.word 0x8e2a20d4  ! 643: ANDN_I	andn 	%r8, 0x00d4, %r7
	.word 0x852a1009  ! 643: SLLX_R	sllx	%r8, %r9, %r2
	.word 0x8202295c  ! 643: ADD_I	add 	%r8, 0x095c, %r1
	.word 0x96220009  ! 643: SUB_R	sub 	%r8, %r9, %r11
	.word 0x8a320009  ! 643: SUBC_R	orn 	%r8, %r9, %r5
	.word 0x8cb22ce0  ! 643: ORNcc_I	orncc 	%r8, 0x0ce0, %r6
	.word 0x869a29dc  ! 643: XORcc_I	xorcc 	%r8, 0x09dc, %r3
	.word 0x82aa2960  ! 643: ANDNcc_I	andncc 	%r8, 0x0960, %r1
	.word 0x8c320009  ! 647: ORN_R	orn 	%r8, %r9, %r6
	.word 0x86320009  ! 647: SUBC_R	orn 	%r8, %r9, %r3
	.word 0x89323001  ! 647: SRLX_I	srlx	%r8, 0x0001, %r4
	.word 0x853a3001  ! 647: SRAX_I	srax	%r8, 0x0001, %r2
	.word 0x948a0009  ! 647: ANDcc_R	andcc 	%r8, %r9, %r10
	.word 0x85321009  ! 647: SRLX_R	srlx	%r8, %r9, %r2
	.word 0xa6b20009  ! 647: SUBCcc_R	orncc 	%r8, %r9, %r19
	.word 0x8c220009  ! 647: SUB_R	sub 	%r8, %r9, %r6
	.word 0x8e320009  ! 647: SUBC_R	orn 	%r8, %r9, %r7
	.word 0x8d321009  ! 647: SRLX_R	srlx	%r8, %r9, %r6
	.word 0x82b20009  ! 647: ORNcc_R	orncc 	%r8, %r9, %r1
	.word 0x8b782401  ! 647: MOVR_I	move	%r0, 0x9, %r5
	.word 0x829a0009  ! 647: XORcc_R	xorcc 	%r8, %r9, %r1
	.word 0x84b20009  ! 647: SUBCcc_R	orncc 	%r8, %r9, %r2
	.word 0x98120009  ! 648: OR_R	or 	%r8, %r9, %r12
	.word 0x8eaa2fa4  ! 648: ANDNcc_I	andncc 	%r8, 0x0fa4, %r7
	.word 0xb62a0009  ! 648: ANDN_R	andn 	%r8, %r9, %r27
	.word 0xb12a0009  ! 648: SLL_R	sll 	%r8, %r9, %r24
	.word 0x822a25e0  ! 648: ANDN_I	andn 	%r8, 0x05e0, %r1
	.word 0x8ac223cc  ! 648: ADDCcc_I	addccc 	%r8, 0x03cc, %r5
	.word 0x828a2784  ! 648: ANDcc_I	andcc 	%r8, 0x0784, %r1
	.word 0x86120009  ! 648: OR_R	or 	%r8, %r9, %r3
	.word 0xb4b226e8  ! 648: ORNcc_I	orncc 	%r8, 0x06e8, %r26
	.word 0xa12a1009  ! 648: SLLX_R	sllx	%r8, %r9, %r16
	.word 0xc5220009  ! 652: STF_R	st	%f2, [%r9, %r8]
	.word 0xca120009  ! 652: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xc3020009  ! 652: LDF_R	ld	[%r8, %r9], %f1
	.word 0x976a2164  ! 652: SDIVX_I	sdivx	%r8, 0x0164, %r11
	.word 0xde320009  ! 658: STH_R	sth	%r15, [%r8 + %r9]
	.word 0xce4a0009  ! 658: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0x86722480  ! 658: UDIV_I	udiv 	%r8, 0x0480, %r3
	.word 0x967226d0  ! 658: UDIV_I	udiv 	%r8, 0x06d0, %r11
	.word 0xf2220009  ! 662: STW_R	stw	%r25, [%r8 + %r9]
	.word 0xcd020009  ! 662: LDF_R	ld	[%r8, %r9], %f6
	.word 0x8a7a24d4  ! 662: SDIV_I	sdiv 	%r8, 0x04d4, %r5
	.word 0x8e7a2130  ! 662: SDIV_I	sdiv 	%r8, 0x0130, %r7
	.word 0x881a0009  ! 663: XOR_R	xor 	%r8, %r9, %r4
	.word 0x88c20009  ! 663: ADDCcc_R	addccc 	%r8, %r9, %r4
	.word 0x8cb20009  ! 663: SUBCcc_R	orncc 	%r8, %r9, %r6
	.word 0x9d322001  ! 663: SRL_I	srl 	%r8, 0x0001, %r14
	.word 0xad2a0009  ! 663: SLL_R	sll 	%r8, %r9, %r22
	.word 0x8a820009  ! 663: ADDcc_R	addcc 	%r8, %r9, %r5
	.word 0x9c420009  ! 663: ADDC_R	addc 	%r8, %r9, %r14
	.word 0x893a2001  ! 663: SRA_I	sra 	%r8, 0x0001, %r4
	.word 0x88220009  ! 663: SUB_R	sub 	%r8, %r9, %r4
	.word 0x8c822db4  ! 663: ADDcc_I	addcc 	%r8, 0x0db4, %r6
	.word 0x8e22277c  ! 667: SUB_I	sub 	%r8, 0x077c, %r7
	.word 0xae222164  ! 667: SUB_I	sub 	%r8, 0x0164, %r23
	.word 0xa8422a00  ! 667: ADDC_I	addc 	%r8, 0x0a00, %r20
	.word 0x88220009  ! 667: SUB_R	sub 	%r8, %r9, %r4
	.word 0x8a820009  ! 667: ADDcc_R	addcc 	%r8, %r9, %r5
	.word 0x8e920009  ! 667: ORcc_R	orcc 	%r8, %r9, %r7
	.word 0x87782401  ! 667: MOVR_I	move	%r0, 0x9, %r3
	.word 0xb12a1009  ! 667: SLLX_R	sllx	%r8, %r9, %r24
	.word 0x86ba0009  ! 667: XNORcc_R	xnorcc 	%r8, %r9, %r3
	.word 0x83323001  ! 667: SRLX_I	srlx	%r8, 0x0001, %r1
	.word 0xba8a2fe0  ! 667: ANDcc_I	andcc 	%r8, 0x0fe0, %r29
	.word 0xa8220009  ! 667: SUB_R	sub 	%r8, %r9, %r20
	.word 0xbe322d54  ! 667: ORN_I	orn 	%r8, 0x0d54, %r31
	.word 0x8e1a0009  ! 667: XOR_R	xor 	%r8, %r9, %r7
	.word 0x84b20009  ! 667: SUBCcc_R	orncc 	%r8, %r9, %r2
	.word 0xc82a0009  ! 671: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xf60a0009  ! 671: LDUB_R	ldub	[%r8 + %r9], %r27
	.word 0x8e720009  ! 671: UDIV_R	udiv 	%r8, %r9, %r7
	.word 0x8e7a2d5c  ! 671: SDIV_I	sdiv 	%r8, 0x0d5c, %r7
	.word 0xc6720009  ! 676: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xe2020009  ! 676: LDUW_R	lduw	[%r8 + %r9], %r17
	.word 0xc31a0009  ! 676: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0x88f22d20  ! 676: UDIVcc_I	udivcc 	%r8, 0x0d20, %r4
	.word 0x841a2f44  ! 678: XOR_I	xor 	%r8, 0x0f44, %r2
	.word 0x84022590  ! 678: ADD_I	add 	%r8, 0x0590, %r2
	.word 0xbcaa2c80  ! 678: ANDNcc_I	andncc 	%r8, 0x0c80, %r30
	.word 0x8f2a3001  ! 678: SLLX_I	sllx	%r8, 0x0001, %r7
	.word 0x8b641809  ! 678: MOVcc_R	<illegal instruction>
	.word 0xa33a2001  ! 678: SRA_I	sra 	%r8, 0x0001, %r17
	.word 0xb0322534  ! 678: SUBC_I	orn 	%r8, 0x0534, %r24
	.word 0x849223c4  ! 678: ORcc_I	orcc 	%r8, 0x03c4, %r2
	.word 0x8e0a0009  ! 678: AND_R	and 	%r8, %r9, %r7
	.word 0xa20a29ec  ! 678: AND_I	and 	%r8, 0x09ec, %r17
	.word 0x820a0009  ! 678: AND_R	and 	%r8, %r9, %r1
	.word 0x8c1a0009  ! 678: XOR_R	xor 	%r8, %r9, %r6
	.word 0x16800001  ! 682: BGE	bge  	<label_0x1>
	.word 0x8ef20009  ! 682: UDIVcc_R	udivcc 	%r8, %r9, %r7
	.word 0x08800002  ! 684: BLEU	bleu  	<label_0x2>
	.word 0x827a0009  ! 684: SDIV_R	sdiv 	%r8, %r9, %r1
	.word 0xaab20009  ! 691: SUBCcc_R	orncc 	%r8, %r9, %r21
	.word 0x83641809  ! 691: MOVcc_R	<illegal instruction>
	.word 0x848a0009  ! 691: ANDcc_R	andcc 	%r8, %r9, %r2
	.word 0x8b3a3001  ! 691: SRAX_I	srax	%r8, 0x0001, %r5
	.word 0x99323001  ! 691: SRLX_I	srlx	%r8, 0x0001, %r12
	.word 0x84120009  ! 691: OR_R	or 	%r8, %r9, %r2
	.word 0x8e3a2a9c  ! 691: XNOR_I	xnor 	%r8, 0x0a9c, %r7
	.word 0x820a0009  ! 691: AND_R	and 	%r8, %r9, %r1
	.word 0x85323001  ! 691: SRLX_I	srlx	%r8, 0x0001, %r2
	.word 0x88c22c50  ! 691: ADDCcc_I	addccc 	%r8, 0x0c50, %r4
	.word 0x8c1a0009  ! 692: XOR_R	xor 	%r8, %r9, %r6
	.word 0xae920009  ! 692: ORcc_R	orcc 	%r8, %r9, %r23
	.word 0x8a1a22a8  ! 692: XOR_I	xor 	%r8, 0x02a8, %r5
	.word 0x86aa2fd8  ! 692: ANDNcc_I	andncc 	%r8, 0x0fd8, %r3
	.word 0x961a2810  ! 692: XOR_I	xor 	%r8, 0x0810, %r11
	.word 0xa042208c  ! 692: ADDC_I	addc 	%r8, 0x008c, %r16
	.word 0x83322001  ! 692: SRL_I	srl 	%r8, 0x0001, %r1
	.word 0x82c22344  ! 692: ADDCcc_I	addccc 	%r8, 0x0344, %r1
	.word 0x87641809  ! 692: MOVcc_R	<illegal instruction>
	.word 0x9e822ea4  ! 692: ADDcc_I	addcc 	%r8, 0x0ea4, %r15
	.word 0xb8a20009  ! 692: SUBcc_R	subcc 	%r8, %r9, %r28
	.word 0x02800001  ! 694: BE	be  	<label_0x1>
	.word 0x84f2296c  ! 694: UDIVcc_I	udivcc 	%r8, 0x096c, %r2
	.word 0x98c20009  ! 696: ADDCcc_R	addccc 	%r8, %r9, %r12
	.word 0xb0820009  ! 696: ADDcc_R	addcc 	%r8, %r9, %r24
	.word 0x86b22f8c  ! 696: ORNcc_I	orncc 	%r8, 0x0f8c, %r3
	.word 0x962a2c0c  ! 696: ANDN_I	andn 	%r8, 0x0c0c, %r11
	.word 0x8eb20009  ! 696: SUBCcc_R	orncc 	%r8, %r9, %r7
	.word 0xa2aa2214  ! 696: ANDNcc_I	andncc 	%r8, 0x0214, %r17
	.word 0x8cb20009  ! 696: SUBCcc_R	orncc 	%r8, %r9, %r6
	.word 0x82322330  ! 696: SUBC_I	orn 	%r8, 0x0330, %r1
	.word 0x82220009  ! 696: SUB_R	sub 	%r8, %r9, %r1
	.word 0xb73a3001  ! 696: SRAX_I	srax	%r8, 0x0001, %r27
	.word 0x9412238c  ! 697: OR_I	or 	%r8, 0x038c, %r10
	.word 0x8f2a1009  ! 697: SLLX_R	sllx	%r8, %r9, %r7
	.word 0xb4b22060  ! 697: ORNcc_I	orncc 	%r8, 0x0060, %r26
	.word 0x84320009  ! 697: SUBC_R	orn 	%r8, %r9, %r2
	.word 0x84920009  ! 697: ORcc_R	orcc 	%r8, %r9, %r2
	.word 0x82222d68  ! 697: SUB_I	sub 	%r8, 0x0d68, %r1
	.word 0x8a022e08  ! 697: ADD_I	add 	%r8, 0x0e08, %r5
	.word 0x87323001  ! 697: SRLX_I	srlx	%r8, 0x0001, %r3
	.word 0x860a0009  ! 697: AND_R	and 	%r8, %r9, %r3
	.word 0x9ac20009  ! 697: ADDCcc_R	addccc 	%r8, %r9, %r13
	.word 0x8a222998  ! 697: SUB_I	sub 	%r8, 0x0998, %r5
	.word 0xcd3a0009  ! 701: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc20a0009  ! 701: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xb0f22f80  ! 701: UDIVcc_I	udivcc 	%r8, 0x0f80, %r24
	.word 0x947a2694  ! 701: SDIV_I	sdiv 	%r8, 0x0694, %r10
	.word 0x99643801  ! 703: MOVcc_I	<illegal instruction>
	.word 0xa73a3001  ! 703: SRAX_I	srax	%r8, 0x0001, %r19
	.word 0x833a1009  ! 703: SRAX_R	srax	%r8, %r9, %r1
	.word 0x860a0009  ! 703: AND_R	and 	%r8, %r9, %r3
	.word 0x873a3001  ! 703: SRAX_I	srax	%r8, 0x0001, %r3
	.word 0x9d641809  ! 703: MOVcc_R	<illegal instruction>
	.word 0x8b2a1009  ! 703: SLLX_R	sllx	%r8, %r9, %r5
	.word 0xa4320009  ! 703: SUBC_R	orn 	%r8, %r9, %r18
	.word 0x89782401  ! 703: MOVR_I	move	%r0, 0x9, %r4
	.word 0xacaa0009  ! 703: ANDNcc_R	andncc 	%r8, %r9, %r22
	.word 0x84b22ae4  ! 703: SUBCcc_I	orncc 	%r8, 0x0ae4, %r2
	.word 0x8a822480  ! 703: ADDcc_I	addcc 	%r8, 0x0480, %r5
	.word 0x89782401  ! 703: MOVR_I	move	%r0, 0x480, %r4
	.word 0xb4ba2f70  ! 703: XNORcc_I	xnorcc 	%r8, 0x0f70, %r26
	.word 0x8f323001  ! 703: SRLX_I	srlx	%r8, 0x0001, %r7
	.word 0x24ca0001  ! 705: BRLEZ	brlez,a,pt	%8,<label_0xa0001>
	.word 0x84fa22f8  ! 705: SDIVcc_I	sdivcc 	%r8, 0x02f8, %r2
	.word 0x30800001  ! 710: BA	ba,a	<label_0x1>
	.word 0x9c720009  ! 710: UDIV_R	udiv 	%r8, %r9, %r14
	.word 0x34800002  ! 714: BG	bg,a	<label_0x2>
	.word 0x8cf22db4  ! 714: UDIVcc_I	udivcc 	%r8, 0x0db4, %r6
	.word 0x12800002  ! 716: BNE	bne  	<label_0x2>
	.word 0x8c720009  ! 716: UDIV_R	udiv 	%r8, %r9, %r6
	.word 0xee220009  ! 722: STW_R	stw	%r23, [%r8 + %r9]
	.word 0xc24a0009  ! 722: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0x88122e40  ! 722: OR_I	or 	%r8, 0x0e40, %r4
	.word 0x98322d28  ! 722: SUBC_I	orn 	%r8, 0x0d28, %r12
	.word 0x83323001  ! 722: SRLX_I	srlx	%r8, 0x0001, %r1
	.word 0xbafa0009  ! 722: SDIVcc_R	sdivcc 	%r8, %r9, %r29
	.word 0x8a422668  ! 723: ADDC_I	addc 	%r8, 0x0668, %r5
	.word 0x83643801  ! 723: MOVcc_I	<illegal instruction>
	.word 0x8ca2282c  ! 723: SUBcc_I	subcc 	%r8, 0x082c, %r6
	.word 0x968a2aa4  ! 723: ANDcc_I	andcc 	%r8, 0x0aa4, %r11
	.word 0x8c3a2c94  ! 723: XNOR_I	xnor 	%r8, 0x0c94, %r6
	.word 0xae0a2e24  ! 723: AND_I	and 	%r8, 0x0e24, %r23
	.word 0x8e8a2aac  ! 723: ANDcc_I	andcc 	%r8, 0x0aac, %r7
	.word 0x8e0a0009  ! 723: AND_R	and 	%r8, %r9, %r7
	.word 0x840a0009  ! 723: AND_R	and 	%r8, %r9, %r2
	.word 0x8c9a25d0  ! 723: XORcc_I	xorcc 	%r8, 0x05d0, %r6
	.word 0x8d641809  ! 723: MOVcc_R	<illegal instruction>
	.word 0x89322001  ! 727: SRL_I	srl 	%r8, 0x0001, %r4
	.word 0x86220009  ! 727: SUB_R	sub 	%r8, %r9, %r3
	.word 0xaf3a0009  ! 727: SRA_R	sra 	%r8, %r9, %r23
	.word 0x84ba2bc8  ! 727: XNORcc_I	xnorcc 	%r8, 0x0bc8, %r2
	.word 0x8ec222d4  ! 727: ADDCcc_I	addccc 	%r8, 0x02d4, %r7
	.word 0x8e220009  ! 727: SUB_R	sub 	%r8, %r9, %r7
	.word 0xac1a2580  ! 727: XOR_I	xor 	%r8, 0x0580, %r22
	.word 0xbd321009  ! 727: SRLX_R	srlx	%r8, %r9, %r30
	.word 0x89322001  ! 727: SRL_I	srl 	%r8, 0x0001, %r4
	.word 0xb08a0009  ! 727: ANDcc_R	andcc 	%r8, %r9, %r24
	.word 0xbaa20009  ! 727: SUBcc_R	subcc 	%r8, %r9, %r29
	.word 0x12800002  ! 730: BNE	bne  	<label_0x2>
	.word 0xb27220d8  ! 730: UDIV_I	udiv 	%r8, 0x00d8, %r25
	.word 0x3c800001  ! 734: BPOS	bpos,a	<label_0x1>
	.word 0x867a0009  ! 734: SDIV_R	sdiv 	%r8, %r9, %r3
	.word 0xc33a0009  ! 739: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc41a0009  ! 739: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xa06a0009  ! 739: UDIVX_R	udivx 	%r8, %r9, %r16
	.word 0x9f6a2e10  ! 739: SDIVX_I	sdivx	%r8, 0x0e10, %r15
	.word 0x38800002  ! 741: BGU	bgu,a	<label_0x2>
	.word 0xbef20009  ! 741: UDIVcc_R	udivcc 	%r8, %r9, %r31
	.word 0xad2a2001  ! 742: SLL_I	sll 	%r8, 0x0001, %r22
	.word 0x8a820009  ! 742: ADDcc_R	addcc 	%r8, %r9, %r5
	.word 0x8c1a0009  ! 742: XOR_R	xor 	%r8, %r9, %r6
	.word 0x8ea20009  ! 742: SUBcc_R	subcc 	%r8, %r9, %r7
	.word 0x8c422508  ! 742: ADDC_I	addc 	%r8, 0x0508, %r6
	.word 0x94820009  ! 742: ADDcc_R	addcc 	%r8, %r9, %r10
	.word 0x8a022214  ! 742: ADD_I	add 	%r8, 0x0214, %r5
	.word 0x8e120009  ! 742: OR_R	or 	%r8, %r9, %r7
	.word 0x82c20009  ! 742: ADDCcc_R	addccc 	%r8, %r9, %r1
	.word 0x992a0009  ! 742: SLL_R	sll 	%r8, %r9, %r12
	.word 0x86ba0009  ! 742: XNORcc_R	xnorcc 	%r8, %r9, %r3
	.word 0x82320009  ! 742: ORN_R	orn 	%r8, %r9, %r1
	.word 0x8d321009  ! 742: SRLX_R	srlx	%r8, %r9, %r6
	.word 0x0cc20001  ! 746: BRGZ	brgz  ,nt	%8,<label_0x20001>
	.word 0xa0fa0009  ! 746: SDIVcc_R	sdivcc 	%r8, %r9, %r16
	.word 0xc93a0009  ! 750: STDF_R	std	%f4, [%r9, %r8]
	.word 0xca520009  ! 750: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xde0a2c34  ! 750: LDUB_I	ldub	[%r8 + 0x0c34], %r15
	.word 0x8efa2a80  ! 750: SDIVcc_I	sdivcc 	%r8, 0x0a80, %r7
	.word 0xf8220009  ! 757: STW_R	stw	%r28, [%r8 + %r9]
	.word 0xce520009  ! 757: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0x8f6a0009  ! 757: SDIVX_R	sdivx	%r8, %r9, %r7
	.word 0x887a0009  ! 757: SDIV_R	sdiv 	%r8, %r9, %r4
	.word 0x12800001  ! 761: BNE	bne  	<label_0x1>
	.word 0x84722c4c  ! 761: UDIV_I	udiv 	%r8, 0x0c4c, %r2
	.word 0xea720009  ! 766: STX_R	stx	%r21, [%r8 + %r9]
	.word 0xc2420009  ! 766: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0x8efa0009  ! 766: SDIVcc_R	sdivcc 	%r8, %r9, %r7
	.word 0x836a29cc  ! 766: SDIVX_I	sdivx	%r8, 0x09cc, %r1
	.word 0xc73a0009  ! 772: STDF_R	std	%f3, [%r9, %r8]
	.word 0xcf020009  ! 772: LDF_R	ld	[%r8, %r9], %f7
	.word 0xa86a2f9c  ! 772: UDIVX_I	udivx 	%r8, 0x0f9c, %r20
	.word 0x947a2244  ! 772: SDIV_I	sdiv 	%r8, 0x0244, %r10
	.word 0x8ca22d18  ! 773: SUBcc_I	subcc 	%r8, 0x0d18, %r6
	.word 0x82422d2c  ! 773: ADDC_I	addc 	%r8, 0x0d2c, %r1
	.word 0xaa8a0009  ! 773: ANDcc_R	andcc 	%r8, %r9, %r21
	.word 0xac92227c  ! 773: ORcc_I	orcc 	%r8, 0x027c, %r22
	.word 0x8e0a0009  ! 773: AND_R	and 	%r8, %r9, %r7
	.word 0x8f322001  ! 773: SRL_I	srl 	%r8, 0x0001, %r7
	.word 0x84c20009  ! 773: ADDCcc_R	addccc 	%r8, %r9, %r2
	.word 0xb5782401  ! 773: MOVR_I	move	%r0, 0x9, %r26
	.word 0x8a3221b8  ! 773: SUBC_I	orn 	%r8, 0x01b8, %r5
	.word 0x88ba0009  ! 773: XNORcc_R	xnorcc 	%r8, %r9, %r4
	.word 0x8a120009  ! 773: OR_R	or 	%r8, %r9, %r5
	.word 0xaac22e34  ! 773: ADDCcc_I	addccc 	%r8, 0x0e34, %r21
	.word 0x9a220009  ! 773: SUB_R	sub 	%r8, %r9, %r13
	.word 0x841a0009  ! 773: XOR_R	xor 	%r8, %r9, %r2
	.word 0x04ca0001  ! 775: BRLEZ	brlez  ,pt	%8,<label_0xa0001>
	.word 0x886a24d8  ! 775: UDIVX_I	udivx 	%r8, 0x04d8, %r4
	.word 0x993a1009  ! 777: SRAX_R	srax	%r8, %r9, %r12
	.word 0x8a8a24e8  ! 777: ANDcc_I	andcc 	%r8, 0x04e8, %r5
	.word 0x82422cec  ! 777: ADDC_I	addc 	%r8, 0x0cec, %r1
	.word 0x89643801  ! 777: MOVcc_I	<illegal instruction>
	.word 0xb43a0009  ! 777: XNOR_R	xnor 	%r8, %r9, %r26
	.word 0x949221e8  ! 777: ORcc_I	orcc 	%r8, 0x01e8, %r10
	.word 0x83782401  ! 777: MOVR_I	move	%r0, 0x1e8, %r1
	.word 0xaaa22894  ! 777: SUBcc_I	subcc 	%r8, 0x0894, %r21
	.word 0xbc2a0009  ! 777: ANDN_R	andn 	%r8, %r9, %r30
	.word 0x86aa0009  ! 777: ANDNcc_R	andncc 	%r8, %r9, %r3
	.word 0xc53a0009  ! 781: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc31a0009  ! 781: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xec9a1009  ! 781: LDDA_R	ldda	[%r8, %r9] 0x80, %r22
	.word 0x8d6a2988  ! 781: SDIVX_I	sdivx	%r8, 0x0988, %r6
	.word 0xc42a0009  ! 785: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc4120009  ! 785: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0x836a0009  ! 785: SDIVX_R	sdivx	%r8, %r9, %r1
	.word 0x866a20e8  ! 785: UDIVX_I	udivx 	%r8, 0x00e8, %r3
	.word 0xff3a0009  ! 789: STDF_R	std	%f31, [%r9, %r8]
	.word 0xcd1a0009  ! 789: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0x94720009  ! 789: UDIV_R	udiv 	%r8, %r9, %r10
	.word 0x8cfa2644  ! 789: SDIVcc_I	sdivcc 	%r8, 0x0644, %r6
	.word 0x8c1a0009  ! 790: XOR_R	xor 	%r8, %r9, %r6
	.word 0xa2b228b4  ! 790: SUBCcc_I	orncc 	%r8, 0x08b4, %r17
	.word 0x84020009  ! 790: ADD_R	add 	%r8, %r9, %r2
	.word 0x86920009  ! 790: ORcc_R	orcc 	%r8, %r9, %r3
	.word 0x82220009  ! 790: SUB_R	sub 	%r8, %r9, %r1
	.word 0x82b20009  ! 790: SUBCcc_R	orncc 	%r8, %r9, %r1
	.word 0x8b2a3001  ! 790: SLLX_I	sllx	%r8, 0x0001, %r5
	.word 0x86022504  ! 790: ADD_I	add 	%r8, 0x0504, %r3
	.word 0x83643801  ! 790: MOVcc_I	<illegal instruction>
	.word 0x8a222430  ! 790: SUB_I	sub 	%r8, 0x0430, %r5
	.word 0x9ab220d4  ! 790: SUBCcc_I	orncc 	%r8, 0x00d4, %r13
	.word 0x893a2001  ! 790: SRA_I	sra 	%r8, 0x0001, %r4
	.word 0xb8120009  ! 790: OR_R	or 	%r8, %r9, %r28
	.word 0x832a2001  ! 790: SLL_I	sll 	%r8, 0x0001, %r1
	.word 0x84822240  ! 790: ADDcc_I	addcc 	%r8, 0x0240, %r2
	.word 0xcb220009  ! 795: STF_R	st	%f5, [%r9, %r8]
	.word 0xc9020009  ! 795: LDF_R	ld	[%r8, %r9], %f4
	.word 0x8c0a0009  ! 795: AND_R	and 	%r8, %r9, %r6
	.word 0x8cfa2a3c  ! 795: SDIVcc_I	sdivcc 	%r8, 0x0a3c, %r6
	.word 0xc4220009  ! 799: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xcf020009  ! 799: LDF_R	ld	[%r8, %r9], %f7
	.word 0xc41a0009  ! 799: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x827229b4  ! 799: UDIV_I	udiv 	%r8, 0x09b4, %r1
	.word 0x2cc20001  ! 801: BRGZ	brgz,a,nt	%8,<label_0x20001>
	.word 0x84fa2dec  ! 801: SDIVcc_I	sdivcc 	%r8, 0x0dec, %r2
	.word 0xf0220009  ! 806: STW_R	stw	%r24, [%r8 + %r9]
	.word 0xd8420009  ! 806: LDSW_R	ldsw	[%r8 + %r9], %r12
	.word 0xf0522248  ! 806: LDSH_I	ldsh	[%r8 + 0x0248], %r24
	.word 0xa0fa0009  ! 806: SDIVcc_R	sdivcc 	%r8, %r9, %r16
	.word 0x860a2e94  ! 808: AND_I	and 	%r8, 0x0e94, %r3
	.word 0x892a2001  ! 808: SLL_I	sll 	%r8, 0x0001, %r4
	.word 0x88c20009  ! 808: ADDCcc_R	addccc 	%r8, %r9, %r4
	.word 0x8b323001  ! 808: SRLX_I	srlx	%r8, 0x0001, %r5
	.word 0x88ba25f8  ! 808: XNORcc_I	xnorcc 	%r8, 0x05f8, %r4
	.word 0x82022978  ! 808: ADD_I	add 	%r8, 0x0978, %r1
	.word 0xa6a20009  ! 808: SUBcc_R	subcc 	%r8, %r9, %r19
	.word 0x8a320009  ! 808: SUBC_R	orn 	%r8, %r9, %r5
	.word 0x9b320009  ! 808: SRL_R	srl 	%r8, %r9, %r13
	.word 0x8e1a2408  ! 808: XOR_I	xor 	%r8, 0x0408, %r7
	.word 0x8cc224c8  ! 808: ADDCcc_I	addccc 	%r8, 0x04c8, %r6
	.word 0x22ca0001  ! 810: BRZ	brz,a,pt	%8,<label_0xa0001>
	.word 0x88fa2a74  ! 810: SDIVcc_I	sdivcc 	%r8, 0x0a74, %r4
	.word 0x86020009  ! 812: ADD_R	add 	%r8, %r9, %r3
	.word 0x8c320009  ! 812: ORN_R	orn 	%r8, %r9, %r6
	.word 0xb88a0009  ! 812: ANDcc_R	andcc 	%r8, %r9, %r28
	.word 0x87643801  ! 812: MOVcc_I	<illegal instruction>
	.word 0x8e820009  ! 812: ADDcc_R	addcc 	%r8, %r9, %r7
	.word 0x89643801  ! 812: MOVcc_I	<illegal instruction>
	.word 0x8a2a0009  ! 812: ANDN_R	andn 	%r8, %r9, %r5
	.word 0x88b20009  ! 812: ORNcc_R	orncc 	%r8, %r9, %r4
	.word 0x8c022100  ! 812: ADD_I	add 	%r8, 0x0100, %r6
	.word 0xa8120009  ! 812: OR_R	or 	%r8, %r9, %r20
	.word 0x86320009  ! 813: ORN_R	orn 	%r8, %r9, %r3
	.word 0x8eb22c84  ! 813: ORNcc_I	orncc 	%r8, 0x0c84, %r7
	.word 0x8e320009  ! 813: SUBC_R	orn 	%r8, %r9, %r7
	.word 0x9a3a2118  ! 813: XNOR_I	xnor 	%r8, 0x0118, %r13
	.word 0x972a2001  ! 813: SLL_I	sll 	%r8, 0x0001, %r11
	.word 0xa03a0009  ! 813: XNOR_R	xnor 	%r8, %r9, %r16
	.word 0x8ca22d48  ! 813: SUBcc_I	subcc 	%r8, 0x0d48, %r6
	.word 0x8eb20009  ! 813: SUBCcc_R	orncc 	%r8, %r9, %r7
	.word 0x88922860  ! 813: ORcc_I	orcc 	%r8, 0x0860, %r4
	.word 0xba9a0009  ! 813: XORcc_R	xorcc 	%r8, %r9, %r29
	.word 0x893a0009  ! 813: SRA_R	sra 	%r8, %r9, %r4
	.word 0x87782401  ! 813: MOVR_I	move	%r0, 0x9, %r3
	.word 0x8e120009  ! 813: OR_R	or 	%r8, %r9, %r7
	.word 0x8a0a0009  ! 813: AND_R	and 	%r8, %r9, %r5
	.word 0x8b782401  ! 814: MOVR_I	move	%r0, 0xffffff48, %r5
	.word 0x84a20009  ! 814: SUBcc_R	subcc 	%r8, %r9, %r2
	.word 0xacc20009  ! 814: ADDCcc_R	addccc 	%r8, %r9, %r22
	.word 0xb6820009  ! 814: ADDcc_R	addcc 	%r8, %r9, %r27
	.word 0x85782401  ! 814: MOVR_I	move	%r0, 0x9, %r2
	.word 0x868a0009  ! 814: ANDcc_R	andcc 	%r8, %r9, %r3
	.word 0x8d323001  ! 814: SRLX_I	srlx	%r8, 0x0001, %r6
	.word 0xae9a2154  ! 814: XORcc_I	xorcc 	%r8, 0x0154, %r23
	.word 0xbc222ed0  ! 814: SUB_I	sub 	%r8, 0x0ed0, %r30
	.word 0x823a0009  ! 814: XNOR_R	xnor 	%r8, %r9, %r1
	.word 0x88b22050  ! 814: ORNcc_I	orncc 	%r8, 0x0050, %r4
	.word 0x863a2e84  ! 818: XNOR_I	xnor 	%r8, 0x0e84, %r3
	.word 0x8d2a3001  ! 818: SLLX_I	sllx	%r8, 0x0001, %r6
	.word 0xb8422a88  ! 818: ADDC_I	addc 	%r8, 0x0a88, %r28
	.word 0x88420009  ! 818: ADDC_R	addc 	%r8, %r9, %r4
	.word 0xbd3a3001  ! 818: SRAX_I	srax	%r8, 0x0001, %r30
	.word 0x8c420009  ! 818: ADDC_R	addc 	%r8, %r9, %r6
	.word 0x829a2bb4  ! 818: XORcc_I	xorcc 	%r8, 0x0bb4, %r1
	.word 0x82920009  ! 818: ORcc_R	orcc 	%r8, %r9, %r1
	.word 0xa4aa2b90  ! 818: ANDNcc_I	andncc 	%r8, 0x0b90, %r18
	.word 0x88a20009  ! 818: SUBcc_R	subcc 	%r8, %r9, %r4
	.word 0x8d323001  ! 818: SRLX_I	srlx	%r8, 0x0001, %r6
	.word 0x848222e4  ! 819: ADDcc_I	addcc 	%r8, 0x02e4, %r2
	.word 0x8c0a29b0  ! 819: AND_I	and 	%r8, 0x09b0, %r6
	.word 0x8c9a2d00  ! 819: XORcc_I	xorcc 	%r8, 0x0d00, %r6
	.word 0x8f780409  ! 819: MOVR_R	move	%r0, %r9, %r7
	.word 0x86ba0009  ! 819: XNORcc_R	xnorcc 	%r8, %r9, %r3
	.word 0x881a2640  ! 819: XOR_I	xor 	%r8, 0x0640, %r4
	.word 0xae220009  ! 819: SUB_R	sub 	%r8, %r9, %r23
	.word 0x9e8a0009  ! 819: ANDcc_R	andcc 	%r8, %r9, %r15
	.word 0x85321009  ! 819: SRLX_R	srlx	%r8, %r9, %r2
	.word 0xb12a1009  ! 819: SLLX_R	sllx	%r8, %r9, %r24
	.word 0x83323001  ! 819: SRLX_I	srlx	%r8, 0x0001, %r1
	.word 0xbb780409  ! 819: MOVR_R	move	%r0, %r9, %r29
	.word 0xc6320009  ! 824: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc81a0009  ! 824: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xbb6a28c0  ! 824: SDIVX_I	sdivx	%r8, 0x08c0, %r29
	.word 0x836a2eb8  ! 824: SDIVX_I	sdivx	%r8, 0x0eb8, %r1
	.word 0x38800001  ! 826: BGU	bgu,a	<label_0x1>
	.word 0x86fa2de0  ! 826: SDIVcc_I	sdivcc 	%r8, 0x0de0, %r3
	.word 0x12800002  ! 828: BNE	bne  	<label_0x2>
	.word 0x856a2ba8  ! 828: SDIVX_I	sdivx	%r8, 0x0ba8, %r2
	.word 0x98aa0009  ! 832: ANDNcc_R	andncc 	%r8, %r9, %r12
	.word 0x8e2a2eec  ! 832: ANDN_I	andn 	%r8, 0x0eec, %r7
	.word 0x82120009  ! 832: OR_R	or 	%r8, %r9, %r1
	.word 0x8a2227e0  ! 832: SUB_I	sub 	%r8, 0x07e0, %r5
	.word 0x86820009  ! 832: ADDcc_R	addcc 	%r8, %r9, %r3
	.word 0x8eb20009  ! 832: SUBCcc_R	orncc 	%r8, %r9, %r7
	.word 0xbb3a1009  ! 832: SRAX_R	srax	%r8, %r9, %r29
	.word 0x82b22c0c  ! 832: ORNcc_I	orncc 	%r8, 0x0c0c, %r1
	.word 0x968a0009  ! 832: ANDcc_R	andcc 	%r8, %r9, %r11
	.word 0x893a3001  ! 832: SRAX_I	srax	%r8, 0x0001, %r4
	.word 0x8eaa2b18  ! 832: ANDNcc_I	andncc 	%r8, 0x0b18, %r7
	.word 0xb0a20009  ! 832: SUBcc_R	subcc 	%r8, %r9, %r24
	.word 0x87641809  ! 832: MOVcc_R	<illegal instruction>
	.word 0x9a322130  ! 832: ORN_I	orn 	%r8, 0x0130, %r13
	.word 0x94b22d78  ! 832: ORNcc_I	orncc 	%r8, 0x0d78, %r10
	.word 0x34800002  ! 834: BG	bg,a	<label_0x2>
	.word 0x82fa2908  ! 834: SDIVcc_I	sdivcc 	%r8, 0x0908, %r1
	.word 0xff220009  ! 839: STF_R	st	%f31, [%r9, %r8]
	.word 0xf64a0009  ! 839: LDSB_R	ldsb	[%r8 + %r9], %r27
	.word 0xbe720009  ! 839: UDIV_R	udiv 	%r8, %r9, %r31
	.word 0xb76a2dfc  ! 839: SDIVX_I	sdivx	%r8, 0x0dfc, %r27
	.word 0xa13a0009  ! 842: SRA_R	sra 	%r8, %r9, %r16
	.word 0x868a27cc  ! 842: ANDcc_I	andcc 	%r8, 0x07cc, %r3
	.word 0x849a0009  ! 842: XORcc_R	xorcc 	%r8, %r9, %r2
	.word 0xa6b20009  ! 842: SUBCcc_R	orncc 	%r8, %r9, %r19
	.word 0x8d323001  ! 842: SRLX_I	srlx	%r8, 0x0001, %r6
	.word 0x88220009  ! 842: SUB_R	sub 	%r8, %r9, %r4
	.word 0x84b20009  ! 842: SUBCcc_R	orncc 	%r8, %r9, %r2
	.word 0xa29a0009  ! 842: XORcc_R	xorcc 	%r8, %r9, %r17
	.word 0x86220009  ! 842: SUB_R	sub 	%r8, %r9, %r3
	.word 0x8e022978  ! 842: ADD_I	add 	%r8, 0x0978, %r7
	.word 0xbb641809  ! 842: MOVcc_R	<illegal instruction>
	.word 0xb7643801  ! 842: MOVcc_I	<illegal instruction>
	.word 0x8aa22a90  ! 842: SUBcc_I	subcc 	%r8, 0x0a90, %r5
	.word 0x9ca20009  ! 842: SUBcc_R	subcc 	%r8, %r9, %r14
	.word 0xcc2a0009  ! 846: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xcc020009  ! 846: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0x8a720009  ! 846: UDIV_R	udiv 	%r8, %r9, %r5
	.word 0xa67a0009  ! 846: SDIV_R	sdiv 	%r8, %r9, %r19
	.word 0x10800001  ! 848: BA	ba  	<label_0x1>
	.word 0x86f20009  ! 848: UDIVcc_R	udivcc 	%r8, %r9, %r3
	.word 0xcb3a0009  ! 852: STDF_R	std	%f5, [%r9, %r8]
	.word 0xc8020009  ! 852: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0x88f20009  ! 852: UDIVcc_R	udivcc 	%r8, %r9, %r4
	.word 0x8ef22e08  ! 852: UDIVcc_I	udivcc 	%r8, 0x0e08, %r7
	.word 0x8f643801  ! 854: MOVcc_I	<illegal instruction>
	.word 0x849a275c  ! 854: XORcc_I	xorcc 	%r8, 0x075c, %r2
	.word 0x84aa2914  ! 854: ANDNcc_I	andncc 	%r8, 0x0914, %r2
	.word 0xb20a0009  ! 854: AND_R	and 	%r8, %r9, %r25
	.word 0xba1a0009  ! 854: XOR_R	xor 	%r8, %r9, %r29
	.word 0x9eb20009  ! 854: SUBCcc_R	orncc 	%r8, %r9, %r15
	.word 0x84b20009  ! 854: ORNcc_R	orncc 	%r8, %r9, %r2
	.word 0xb0322c58  ! 854: ORN_I	orn 	%r8, 0x0c58, %r24
	.word 0x8c0a0009  ! 854: AND_R	and 	%r8, %r9, %r6
	.word 0x89641809  ! 854: MOVcc_R	<illegal instruction>
	.word 0x9e020009  ! 854: ADD_R	add 	%r8, %r9, %r15
	.word 0x88820009  ! 854: ADDcc_R	addcc 	%r8, %r9, %r4
	.word 0xb12a2001  ! 854: SLL_I	sll 	%r8, 0x0001, %r24
	.word 0x88020009  ! 855: ADD_R	add 	%r8, %r9, %r4
	.word 0x8c420009  ! 855: ADDC_R	addc 	%r8, %r9, %r6
	.word 0x828223b8  ! 855: ADDcc_I	addcc 	%r8, 0x03b8, %r1
	.word 0x83323001  ! 855: SRLX_I	srlx	%r8, 0x0001, %r1
	.word 0x87322001  ! 855: SRL_I	srl 	%r8, 0x0001, %r3
	.word 0x89321009  ! 855: SRLX_R	srlx	%r8, %r9, %r4
	.word 0x99643801  ! 855: MOVcc_I	<illegal instruction>
	.word 0x8c420009  ! 855: ADDC_R	addc 	%r8, %r9, %r6
	.word 0x8a320009  ! 855: ORN_R	orn 	%r8, %r9, %r5
	.word 0x88ba2614  ! 855: XNORcc_I	xnorcc 	%r8, 0x0614, %r4
	.word 0x84420009  ! 855: ADDC_R	addc 	%r8, %r9, %r2
	.word 0xbcba26f0  ! 855: XNORcc_I	xnorcc 	%r8, 0x06f0, %r30
	.word 0x0aca0001  ! 859: BRNZ	brnz  ,pt	%8,<label_0xa0001>
	.word 0x8f6a0009  ! 859: SDIVX_R	sdivx	%r8, %r9, %r7
	.word 0xf3220009  ! 869: STF_R	st	%f25, [%r9, %r8]
	.word 0xc91a0009  ! 869: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0x8c8a0009  ! 869: ANDcc_R	andcc 	%r8, %r9, %r6
	.word 0x87320009  ! 869: SRL_R	srl 	%r8, %r9, %r3
	.word 0x8ab20009  ! 869: SUBCcc_R	orncc 	%r8, %r9, %r5
	.word 0x82722f24  ! 869: UDIV_I	udiv 	%r8, 0x0f24, %r1
	.word 0x1a800001  ! 871: BCC	bcc  	<label_0x1>
	.word 0x9af223b4  ! 871: UDIVcc_I	udivcc 	%r8, 0x03b4, %r13
	.word 0x8e920009  ! 873: ORcc_R	orcc 	%r8, %r9, %r7
	.word 0x86b20009  ! 873: SUBCcc_R	orncc 	%r8, %r9, %r3
	.word 0x8eb20009  ! 873: SUBCcc_R	orncc 	%r8, %r9, %r7
	.word 0xbc920009  ! 873: ORcc_R	orcc 	%r8, %r9, %r30
	.word 0x8a2a2f7c  ! 873: ANDN_I	andn 	%r8, 0x0f7c, %r5
	.word 0x8b782401  ! 873: MOVR_I	move	%r0, 0xffffff7c, %r5
	.word 0x889a25f4  ! 873: XORcc_I	xorcc 	%r8, 0x05f4, %r4
	.word 0x8d321009  ! 873: SRLX_R	srlx	%r8, %r9, %r6
	.word 0x8d323001  ! 873: SRLX_I	srlx	%r8, 0x0001, %r6
	.word 0xa5641809  ! 873: MOVcc_R	<illegal instruction>
	.word 0x820a0009  ! 873: AND_R	and 	%r8, %r9, %r1
	.word 0x861a0009  ! 873: XOR_R	xor 	%r8, %r9, %r3
	.word 0xb2b20009  ! 873: SUBCcc_R	orncc 	%r8, %r9, %r25
	.word 0x8a2a2d90  ! 873: ANDN_I	andn 	%r8, 0x0d90, %r5
	.word 0x06ca0001  ! 876: BRLZ	brlz  ,pt	%8,<label_0xa0001>
	.word 0xa6f20009  ! 876: UDIVcc_R	udivcc 	%r8, %r9, %r19
	.word 0x86220009  ! 879: SUB_R	sub 	%r8, %r9, %r3
	.word 0x8b3a1009  ! 879: SRAX_R	srax	%r8, %r9, %r5
	.word 0x8c320009  ! 879: SUBC_R	orn 	%r8, %r9, %r6
	.word 0x8ab20009  ! 879: ORNcc_R	orncc 	%r8, %r9, %r5
	.word 0x8f323001  ! 879: SRLX_I	srlx	%r8, 0x0001, %r7
	.word 0xb8a22498  ! 879: SUBcc_I	subcc 	%r8, 0x0498, %r28
	.word 0x8eb20009  ! 879: SUBCcc_R	orncc 	%r8, %r9, %r7
	.word 0x8ab22874  ! 879: SUBCcc_I	orncc 	%r8, 0x0874, %r5
	.word 0x86b22f5c  ! 879: SUBCcc_I	orncc 	%r8, 0x0f5c, %r3
	.word 0x84b20009  ! 879: ORNcc_R	orncc 	%r8, %r9, %r2
	.word 0x860a0009  ! 879: AND_R	and 	%r8, %r9, %r3
	.word 0x8e4227a4  ! 879: ADDC_I	addc 	%r8, 0x07a4, %r7
	.word 0x861225d0  ! 879: OR_I	or 	%r8, 0x05d0, %r3
	.word 0x88aa0009  ! 879: ANDNcc_R	andncc 	%r8, %r9, %r4
	.word 0x40000001  ! 881: CALL	call	disp30_1
	.word 0x847225c8  ! 881: UDIV_I	udiv 	%r8, 0x05c8, %r2
	.word 0x2cc20001  ! 886: BRGZ	brgz,a,nt	%8,<label_0x20001>
	.word 0x98720009  ! 886: UDIV_R	udiv 	%r8, %r9, %r12
	.word 0xc53a0009  ! 894: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc6420009  ! 894: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0x893a2001  ! 894: SRA_I	sra 	%r8, 0x0001, %r4
	.word 0x98ba2c20  ! 894: XNORcc_I	xnorcc 	%r8, 0x0c20, %r12
	.word 0x8caa0009  ! 894: ANDNcc_R	andncc 	%r8, %r9, %r6
	.word 0x8d6a0009  ! 894: SDIVX_R	sdivx	%r8, %r9, %r6
	.word 0x88b22908  ! 895: ORNcc_I	orncc 	%r8, 0x0908, %r4
	.word 0x94822d38  ! 895: ADDcc_I	addcc 	%r8, 0x0d38, %r10
	.word 0xa22a0009  ! 895: ANDN_R	andn 	%r8, %r9, %r17
	.word 0x82aa2af0  ! 895: ANDNcc_I	andncc 	%r8, 0x0af0, %r1
	.word 0x8c222508  ! 895: SUB_I	sub 	%r8, 0x0508, %r6
	.word 0x84820009  ! 895: ADDcc_R	addcc 	%r8, %r9, %r2
	.word 0x8a322668  ! 895: ORN_I	orn 	%r8, 0x0668, %r5
	.word 0x8b641809  ! 895: MOVcc_R	<illegal instruction>
	.word 0x82b22d38  ! 895: ORNcc_I	orncc 	%r8, 0x0d38, %r1
	.word 0xa49a0009  ! 895: XORcc_R	xorcc 	%r8, %r9, %r18
	.word 0x82420009  ! 895: ADDC_R	addc 	%r8, %r9, %r1
	.word 0x8d2a2001  ! 895: SLL_I	sll 	%r8, 0x0001, %r6
	.word 0x8a822680  ! 895: ADDcc_I	addcc 	%r8, 0x0680, %r5
	.word 0x889a0009  ! 895: XORcc_R	xorcc 	%r8, %r9, %r4
	.word 0xce220009  ! 901: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xda4a0009  ! 901: LDSB_R	ldsb	[%r8 + %r9], %r13
	.word 0xa6720009  ! 901: UDIV_R	udiv 	%r8, %r9, %r19
	.word 0xa87a2a28  ! 901: SDIV_I	sdiv 	%r8, 0x0a28, %r20
	.word 0xa8aa0009  ! 902: ANDNcc_R	andncc 	%r8, %r9, %r20
	.word 0x873a3001  ! 902: SRAX_I	srax	%r8, 0x0001, %r3
	.word 0xac1a0009  ! 902: XOR_R	xor 	%r8, %r9, %r22
	.word 0xae320009  ! 902: ORN_R	orn 	%r8, %r9, %r23
	.word 0x8f320009  ! 902: SRL_R	srl 	%r8, %r9, %r7
	.word 0x83322001  ! 902: SRL_I	srl 	%r8, 0x0001, %r1
	.word 0x8b641809  ! 902: MOVcc_R	<illegal instruction>
	.word 0x87780409  ! 902: MOVR_R	move	%r0, %r9, %r3
	.word 0x8ab20009  ! 902: SUBCcc_R	orncc 	%r8, %r9, %r5
	.word 0x860a0009  ! 902: AND_R	and 	%r8, %r9, %r3
	.word 0x8b641809  ! 902: MOVcc_R	<illegal instruction>
	.word 0x842a2d74  ! 902: ANDN_I	andn 	%r8, 0x0d74, %r2
	.word 0x8b2a3001  ! 902: SLLX_I	sllx	%r8, 0x0001, %r5
	.word 0xb1320009  ! 902: SRL_R	srl 	%r8, %r9, %r24
	.word 0x8ca22da4  ! 902: SUBcc_I	subcc 	%r8, 0x0da4, %r6
	.word 0x8c9a2908  ! 903: XORcc_I	xorcc 	%r8, 0x0908, %r6
	.word 0x82922964  ! 903: ORcc_I	orcc 	%r8, 0x0964, %r1
	.word 0x842a268c  ! 903: ANDN_I	andn 	%r8, 0x068c, %r2
	.word 0xb52a3001  ! 903: SLLX_I	sllx	%r8, 0x0001, %r26
	.word 0x8c022aa0  ! 903: ADD_I	add 	%r8, 0x0aa0, %r6
	.word 0x8a9a0009  ! 903: XORcc_R	xorcc 	%r8, %r9, %r5
	.word 0x848a2950  ! 903: ANDcc_I	andcc 	%r8, 0x0950, %r2
	.word 0x94220009  ! 903: SUB_R	sub 	%r8, %r9, %r10
	.word 0x84420009  ! 903: ADDC_R	addc 	%r8, %r9, %r2
	.word 0x8a020009  ! 903: ADD_R	add 	%r8, %r9, %r5
	.word 0x88920009  ! 903: ORcc_R	orcc 	%r8, %r9, %r4
	.word 0x3a800002  ! 905: BCC	bcc,a	<label_0x2>
	.word 0x8af22b80  ! 905: UDIVcc_I	udivcc 	%r8, 0x0b80, %r5
	.word 0x9f643801  ! 909: MOVcc_I	<illegal instruction>
	.word 0x86222374  ! 909: SUB_I	sub 	%r8, 0x0374, %r3
	.word 0xb72a2001  ! 909: SLL_I	sll 	%r8, 0x0001, %r27
	.word 0x8b2a3001  ! 909: SLLX_I	sllx	%r8, 0x0001, %r5
	.word 0xb49a0009  ! 909: XORcc_R	xorcc 	%r8, %r9, %r26
	.word 0x84322d1c  ! 909: ORN_I	orn 	%r8, 0x0d1c, %r2
	.word 0x8eba210c  ! 909: XNORcc_I	xnorcc 	%r8, 0x010c, %r7
	.word 0x8f3a1009  ! 909: SRAX_R	srax	%r8, %r9, %r7
	.word 0x832a3001  ! 909: SLLX_I	sllx	%r8, 0x0001, %r1
	.word 0x843a250c  ! 909: XNOR_I	xnor 	%r8, 0x050c, %r2
	.word 0x2cca0001  ! 912: BRGZ	brgz,a,pt	%8,<label_0xa0001>
	.word 0x996a2ee8  ! 912: SDIVX_I	sdivx	%r8, 0x0ee8, %r12
	.word 0x06c20001  ! 914: BRLZ	brlz  ,nt	%8,<label_0x20001>
	.word 0x866a2304  ! 914: UDIVX_I	udivx 	%r8, 0x0304, %r3
	.word 0x98020009  ! 915: ADD_R	add 	%r8, %r9, %r12
	.word 0x8a3a2c3c  ! 915: XNOR_I	xnor 	%r8, 0x0c3c, %r5
	.word 0x8b3a1009  ! 915: SRAX_R	srax	%r8, %r9, %r5
	.word 0xa6aa0009  ! 915: ANDNcc_R	andncc 	%r8, %r9, %r19
	.word 0x8ea20009  ! 915: SUBcc_R	subcc 	%r8, %r9, %r7
	.word 0xb6b22118  ! 915: ORNcc_I	orncc 	%r8, 0x0118, %r27
	.word 0x8d3a2001  ! 915: SRA_I	sra 	%r8, 0x0001, %r6
	.word 0xae420009  ! 915: ADDC_R	addc 	%r8, %r9, %r23
	.word 0xa3641809  ! 915: MOVcc_R	<illegal instruction>
	.word 0x82b20009  ! 915: SUBCcc_R	orncc 	%r8, %r9, %r1
	.word 0xd53a0009  ! 920: STDF_R	std	%f10, [%r9, %r8]
	.word 0xe71a0009  ! 920: LDDF_R	ldd	[%r8, %r9], %f19
	.word 0x896a2710  ! 920: SDIVX_I	sdivx	%r8, 0x0710, %r4
	.word 0x94f22f38  ! 920: UDIVcc_I	udivcc 	%r8, 0x0f38, %r10
	.word 0x86420009  ! 923: ADDC_R	addc 	%r8, %r9, %r3
	.word 0x8c820009  ! 923: ADDcc_R	addcc 	%r8, %r9, %r6
	.word 0xb8b20009  ! 923: SUBCcc_R	orncc 	%r8, %r9, %r28
	.word 0x861a258c  ! 923: XOR_I	xor 	%r8, 0x058c, %r3
	.word 0xb6a20009  ! 923: SUBcc_R	subcc 	%r8, %r9, %r27
	.word 0xbb643801  ! 923: MOVcc_I	<illegal instruction>
	.word 0x8d321009  ! 923: SRLX_R	srlx	%r8, %r9, %r6
	.word 0x8e422b24  ! 923: ADDC_I	addc 	%r8, 0x0b24, %r7
	.word 0xaa8a0009  ! 923: ANDcc_R	andcc 	%r8, %r9, %r21
	.word 0xa82a0009  ! 923: ANDN_R	andn 	%r8, %r9, %r20
	.word 0x9b643801  ! 923: MOVcc_I	<illegal instruction>
	.word 0x853a2001  ! 923: SRA_I	sra 	%r8, 0x0001, %r2
	.word 0x84322fa8  ! 924: ORN_I	orn 	%r8, 0x0fa8, %r2
	.word 0x84322a90  ! 924: SUBC_I	orn 	%r8, 0x0a90, %r2
	.word 0xa22a0009  ! 924: ANDN_R	andn 	%r8, %r9, %r17
	.word 0x8a0a2758  ! 924: AND_I	and 	%r8, 0x0758, %r5
	.word 0x868a25bc  ! 924: ANDcc_I	andcc 	%r8, 0x05bc, %r3
	.word 0x8882222c  ! 924: ADDcc_I	addcc 	%r8, 0x022c, %r4
	.word 0x8c420009  ! 924: ADDC_R	addc 	%r8, %r9, %r6
	.word 0xb6422638  ! 924: ADDC_I	addc 	%r8, 0x0638, %r27
	.word 0xb52a2001  ! 924: SLL_I	sll 	%r8, 0x0001, %r26
	.word 0xb09a0009  ! 924: XORcc_R	xorcc 	%r8, %r9, %r24
	.word 0x8a322e74  ! 925: ORN_I	orn 	%r8, 0x0e74, %r5
	.word 0x87780409  ! 925: MOVR_R	move	%r0, %r9, %r3
	.word 0x8ac20009  ! 925: ADDCcc_R	addccc 	%r8, %r9, %r5
	.word 0x94120009  ! 925: OR_R	or 	%r8, %r9, %r10
	.word 0x860a2a10  ! 925: AND_I	and 	%r8, 0x0a10, %r3
	.word 0x861a25c4  ! 925: XOR_I	xor 	%r8, 0x05c4, %r3
	.word 0x8d321009  ! 925: SRLX_R	srlx	%r8, %r9, %r6
	.word 0xb63a2298  ! 925: XNOR_I	xnor 	%r8, 0x0298, %r27
	.word 0x88a22f78  ! 925: SUBcc_I	subcc 	%r8, 0x0f78, %r4
	.word 0x8c120009  ! 925: OR_R	or 	%r8, %r9, %r6
	.word 0xa63a0009  ! 925: XNOR_R	xnor 	%r8, %r9, %r19
	.word 0x8ab20009  ! 925: ORNcc_R	orncc 	%r8, %r9, %r5
	.word 0x9c122530  ! 925: OR_I	or 	%r8, 0x0530, %r14
	.word 0x821a295c  ! 925: XOR_I	xor 	%r8, 0x095c, %r1
	.word 0x84420009  ! 926: ADDC_R	addc 	%r8, %r9, %r2
	.word 0x823a269c  ! 926: XNOR_I	xnor 	%r8, 0x069c, %r1
	.word 0x8f643801  ! 926: MOVcc_I	<illegal instruction>
	.word 0xb69a2094  ! 926: XORcc_I	xorcc 	%r8, 0x0094, %r27
	.word 0xb4b20009  ! 926: SUBCcc_R	orncc 	%r8, %r9, %r26
	.word 0x8a32249c  ! 926: SUBC_I	orn 	%r8, 0x049c, %r5
	.word 0xbf322001  ! 926: SRL_I	srl 	%r8, 0x0001, %r31
	.word 0x86120009  ! 926: OR_R	or 	%r8, %r9, %r3
	.word 0x8e0a2c38  ! 926: AND_I	and 	%r8, 0x0c38, %r7
	.word 0x881a25fc  ! 926: XOR_I	xor 	%r8, 0x05fc, %r4
	.word 0xb53a2001  ! 926: SRA_I	sra 	%r8, 0x0001, %r26
	.word 0x88320009  ! 926: SUBC_R	orn 	%r8, %r9, %r4
	.word 0x86920009  ! 927: ORcc_R	orcc 	%r8, %r9, %r3
	.word 0x8b3a0009  ! 927: SRA_R	sra 	%r8, %r9, %r5
	.word 0x8a9a0009  ! 927: XORcc_R	xorcc 	%r8, %r9, %r5
	.word 0x8caa2118  ! 927: ANDNcc_I	andncc 	%r8, 0x0118, %r6
	.word 0x872a1009  ! 927: SLLX_R	sllx	%r8, %r9, %r3
	.word 0xb69a2bdc  ! 927: XORcc_I	xorcc 	%r8, 0x0bdc, %r27
	.word 0x9e1a0009  ! 927: XOR_R	xor 	%r8, %r9, %r15
	.word 0x8ea20009  ! 927: SUBcc_R	subcc 	%r8, %r9, %r7
	.word 0x9a320009  ! 927: SUBC_R	orn 	%r8, %r9, %r13
	.word 0x86420009  ! 927: ADDC_R	addc 	%r8, %r9, %r3
	.word 0x0eca0001  ! 929: BRGEZ	brgez  ,pt	%8,<label_0xa0001>
	.word 0x966a23d0  ! 929: UDIVX_I	udivx 	%r8, 0x03d0, %r11
	.word 0x8c0a0009  ! 930: AND_R	and 	%r8, %r9, %r6
	.word 0xba920009  ! 930: ORcc_R	orcc 	%r8, %r9, %r29
	.word 0x853a2001  ! 930: SRA_I	sra 	%r8, 0x0001, %r2
	.word 0x872a3001  ! 930: SLLX_I	sllx	%r8, 0x0001, %r3
	.word 0x84aa0009  ! 930: ANDNcc_R	andncc 	%r8, %r9, %r2
	.word 0x8f780409  ! 930: MOVR_R	move	%r0, %r9, %r7
	.word 0x8f3a2001  ! 930: SRA_I	sra 	%r8, 0x0001, %r7
	.word 0xbd322001  ! 930: SRL_I	srl 	%r8, 0x0001, %r30
	.word 0x8e222694  ! 930: SUB_I	sub 	%r8, 0x0694, %r7
	.word 0x8d641809  ! 930: MOVcc_R	<illegal instruction>
	.word 0x2aca0001  ! 932: BRNZ	brnz,a,pt	%8,<label_0xa0001>
	.word 0x827a250c  ! 932: SDIV_I	sdiv 	%r8, 0x050c, %r1
	.word 0x10800001  ! 935: BA	ba  	<label_0x1>
	.word 0xbf6a2c34  ! 935: SDIVX_I	sdivx	%r8, 0x0c34, %r31
	.word 0x22800002  ! 938: BE	be,a	<label_0x2>
	.word 0x8a6a21b0  ! 938: UDIVX_I	udivx 	%r8, 0x01b0, %r5
	.word 0x38800001  ! 943: BGU	bgu,a	<label_0x1>
	.word 0x8e6a2268  ! 943: UDIVX_I	udivx 	%r8, 0x0268, %r7
	.word 0x04c20001  ! 948: BRLEZ	brlez  ,nt	%8,<label_0x20001>
	.word 0xa2f20009  ! 948: UDIVcc_R	udivcc 	%r8, %r9, %r17
	.word 0x9ab222b4  ! 950: ORNcc_I	orncc 	%r8, 0x02b4, %r13
	.word 0x8aaa0009  ! 950: ANDNcc_R	andncc 	%r8, %r9, %r5
	.word 0x9f3a0009  ! 950: SRA_R	sra 	%r8, %r9, %r15
	.word 0x8e1a24b0  ! 950: XOR_I	xor 	%r8, 0x04b0, %r7
	.word 0xb53a2001  ! 950: SRA_I	sra 	%r8, 0x0001, %r26
	.word 0x85643801  ! 950: MOVcc_I	<illegal instruction>
	.word 0x8d641809  ! 950: MOVcc_R	<illegal instruction>
	.word 0x82022138  ! 950: ADD_I	add 	%r8, 0x0138, %r1
	.word 0xb82a0009  ! 950: ANDN_R	andn 	%r8, %r9, %r28
	.word 0x892a3001  ! 950: SLLX_I	sllx	%r8, 0x0001, %r4
	.word 0x841a27d4  ! 950: XOR_I	xor 	%r8, 0x07d4, %r2
	.word 0x8c0a236c  ! 950: AND_I	and 	%r8, 0x036c, %r6
	.word 0xb82224cc  ! 950: SUB_I	sub 	%r8, 0x04cc, %r28
	.word 0x8e0a2064  ! 950: AND_I	and 	%r8, 0x0064, %r7
	.word 0x89641809  ! 950: MOVcc_R	<illegal instruction>
	.word 0x0e800002  ! 954: BVS	bvs  	<label_0x2>
	.word 0x966a0009  ! 954: UDIVX_R	udivx 	%r8, %r9, %r11
	.word 0x04c20001  ! 958: BRLEZ	brlez  ,nt	%8,<label_0x20001>
	.word 0x86720009  ! 958: UDIV_R	udiv 	%r8, %r9, %r3
	.word 0xe4320009  ! 963: STH_R	sth	%r18, [%r8 + %r9]
	.word 0xc6020009  ! 963: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0x88fa0009  ! 963: SDIVcc_R	sdivcc 	%r8, %r9, %r4
	.word 0xbb6a2c2c  ! 963: SDIVX_I	sdivx	%r8, 0x0c2c, %r29
	.word 0xcb220009  ! 967: STF_R	st	%f5, [%r9, %r8]
	.word 0xee0a0009  ! 967: LDUB_R	ldub	[%r8 + %r9], %r23
	.word 0xb072280c  ! 967: UDIV_I	udiv 	%r8, 0x080c, %r24
	.word 0xbc7226d4  ! 967: UDIV_I	udiv 	%r8, 0x06d4, %r30
	.word 0x0e800001  ! 970: BVS	bvs  	<label_0x1>
	.word 0xa86a0009  ! 970: UDIVX_R	udivx 	%r8, %r9, %r20
	.word 0xa0822fe8  ! 974: ADDcc_I	addcc 	%r8, 0x0fe8, %r16
	.word 0x88322ae0  ! 974: ORN_I	orn 	%r8, 0x0ae0, %r4
	.word 0x8d322001  ! 974: SRL_I	srl 	%r8, 0x0001, %r6
	.word 0x823221c4  ! 974: SUBC_I	orn 	%r8, 0x01c4, %r1
	.word 0x89641809  ! 974: MOVcc_R	<illegal instruction>
	.word 0x88aa0009  ! 974: ANDNcc_R	andncc 	%r8, %r9, %r4
	.word 0x842229a4  ! 974: SUB_I	sub 	%r8, 0x09a4, %r2
	.word 0x88322768  ! 974: SUBC_I	orn 	%r8, 0x0768, %r4
	.word 0x881227c0  ! 974: OR_I	or 	%r8, 0x07c0, %r4
	.word 0x8e120009  ! 974: OR_R	or 	%r8, %r9, %r7
	.word 0x988a283c  ! 974: ANDcc_I	andcc 	%r8, 0x083c, %r12
	.word 0x95320009  ! 974: SRL_R	srl 	%r8, %r9, %r10
	.word 0x8f322001  ! 975: SRL_I	srl 	%r8, 0x0001, %r7
	.word 0xba820009  ! 975: ADDcc_R	addcc 	%r8, %r9, %r29
	.word 0x88322260  ! 975: SUBC_I	orn 	%r8, 0x0260, %r4
	.word 0x84322d10  ! 975: ORN_I	orn 	%r8, 0x0d10, %r2
	.word 0x852a3001  ! 975: SLLX_I	sllx	%r8, 0x0001, %r2
	.word 0x82c22360  ! 975: ADDCcc_I	addccc 	%r8, 0x0360, %r1
	.word 0x8b3a3001  ! 975: SRAX_I	srax	%r8, 0x0001, %r5
	.word 0x94320009  ! 975: ORN_R	orn 	%r8, %r9, %r10
	.word 0x8b323001  ! 975: SRLX_I	srlx	%r8, 0x0001, %r5
	.word 0xb22a2e68  ! 975: ANDN_I	andn 	%r8, 0x0e68, %r25
	.word 0x8a820009  ! 975: ADDcc_R	addcc 	%r8, %r9, %r5
	.word 0x1a800001  ! 978: BCC	bcc  	<label_0x1>
	.word 0x887a0009  ! 978: SDIV_R	sdiv 	%r8, %r9, %r4
	.word 0x87782401  ! 989: MOVR_I	move	%r0, 0xfffffe7c, %r3
	.word 0x893a0009  ! 989: SRA_R	sra 	%r8, %r9, %r4
	.word 0x852a0009  ! 989: SLL_R	sll 	%r8, %r9, %r2
	.word 0x8282267c  ! 989: ADDcc_I	addcc 	%r8, 0x067c, %r1
	.word 0x86822388  ! 989: ADDcc_I	addcc 	%r8, 0x0388, %r3
	.word 0xb40a0009  ! 989: AND_R	and 	%r8, %r9, %r26
	.word 0xaa022fa0  ! 989: ADD_I	add 	%r8, 0x0fa0, %r21
	.word 0x89780409  ! 989: MOVR_R	move	%r0, %r9, %r4
	.word 0x88aa0009  ! 989: ANDNcc_R	andncc 	%r8, %r9, %r4
	.word 0xa93a1009  ! 989: SRAX_R	srax	%r8, %r9, %r20
	.word 0x84a20009  ! 989: SUBcc_R	subcc 	%r8, %r9, %r2
	.word 0xa60a0009  ! 989: AND_R	and 	%r8, %r9, %r19
	.word 0xce220009  ! 994: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xcc020009  ! 994: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xc68a1009  ! 994: LDUBA_R	lduba	[%r8, %r9] 0x80, %r3
	.word 0x88720009  ! 994: UDIV_R	udiv 	%r8, %r9, %r4
	.word 0xb5641809  ! 995: MOVcc_R	<illegal instruction>
	.word 0xaa820009  ! 995: ADDcc_R	addcc 	%r8, %r9, %r21
	.word 0xb0ba2260  ! 995: XNORcc_I	xnorcc 	%r8, 0x0260, %r24
	.word 0x87780409  ! 995: MOVR_R	move	%r0, %r9, %r3
	.word 0x982a2bdc  ! 995: ANDN_I	andn 	%r8, 0x0bdc, %r12
	.word 0x8caa0009  ! 995: ANDNcc_R	andncc 	%r8, %r9, %r6
	.word 0x88122808  ! 995: OR_I	or 	%r8, 0x0808, %r4
	.word 0x87320009  ! 995: SRL_R	srl 	%r8, %r9, %r3
	.word 0x86920009  ! 995: ORcc_R	orcc 	%r8, %r9, %r3
	.word 0x8a9a2e6c  ! 995: XORcc_I	xorcc 	%r8, 0x0e6c, %r5
	.word 0x960a2f04  ! 995: AND_I	and 	%r8, 0x0f04, %r11
	.word 0x86b22f0c  ! 995: ORNcc_I	orncc 	%r8, 0x0f0c, %r3
	.word 0x2c800002  ! 998: BNEG	bneg,a	<label_0x2>
	.word 0x86f22728  ! 998: UDIVcc_I	udivcc 	%r8, 0x0728, %r3
	nop
	nop
	nop
        ta      T_GOOD_TRAP

th_main_2:
        setx  MAIN_BASE_DATA_VA, %r1, %r8
        setx  0x0000000000000a70, %g1, %r9
        setx  0x80, %g2, %g1
        wr  %g1, %g0, %asi
	    rd %fprs, %g1
        wr %g1, 0x4, %fprs
	ldd	[%r8 + 0], %f0
	ldd	[%r8 + 8], %f2
	ldd	[%r8 + 16], %f4
	ldd	[%r8 + 24], %f6
	ldd	[%r8 + 32], %f8
	ldd	[%r8 + 40], %f10
	ldd	[%r8 + 48], %f12
	ldd	[%r8 + 56], %f14
	ldd	[%r8 + 64], %f16
	ldd	[%r8 + 72], %f18
	ldd	[%r8 + 80], %f20
	ldd	[%r8 + 88], %f22
	ldd	[%r8 + 96], %f24
	ldd	[%r8 + 104], %f26
	ldd	[%r8 + 112], %f28
	ldd	[%r8 + 120], %f30
	ldd	[%r8 + 128], %f32
	ldd	[%r8 + 136], %f34
	ldd	[%r8 + 144], %f36
	ldd	[%r8 + 152], %f38
	ldd	[%r8 + 160], %f40
	ldd	[%r8 + 168], %f42
	ldd	[%r8 + 176], %f44
	ldd	[%r8 + 184], %f46
	ldd	[%r8 + 192], %f48
	ldd	[%r8 + 200], %f50
	ldd	[%r8 + 208], %f52
	ldd	[%r8 + 216], %f54
	ldd	[%r8 + 224], %f56
	ldd	[%r8 + 232], %f58
	ldd	[%r8 + 240], %f60
	ldd	[%r8 + 248], %f62
        setx  0x0b0d81f0fe3af56d, %g1, %r0
        setx  0x0a3eae6909e3226e, %g1, %r1
        setx  0xa2495705d46d52a4, %g1, %r2
        setx  0x2d9e5f15043844e5, %g1, %r3
        setx  0x7e09faa6b41e3b5f, %g1, %r4
        setx  0x1378554fe8c7ea0f, %g1, %r5
        setx  0x451bd698d5784bb2, %g1, %r6
        setx  0xa9cfe15e4b8b44f8, %g1, %r7
        setx  0xc6af7c420eceacd0, %g1, %r10
        setx  0x38c92734294f9e0a, %g1, %r11
        setx  0xf923bf91a0beadef, %g1, %r12
        setx  0x62f6d05fb5a0f1c3, %g1, %r13
        setx  0x1b33d7034741e8fe, %g1, %r14
        setx  0xcb5ccf4c3657a04e, %g1, %r15
        setx  0x206434f38d868fa2, %g1, %r16
        setx  0x9ab28d1371472bae, %g1, %r17
        setx  0x908cb67f8b23850a, %g1, %r18
        setx  0x3f209fd0519355ba, %g1, %r19
        setx  0x842823998005337e, %g1, %r20
        setx  0xefd36ea4e6e9313a, %g1, %r21
        setx  0xc4787cc8347a15e3, %g1, %r22
        setx  0xa273010e549103dd, %g1, %r23
        setx  0x4cd7b8fbba46e81b, %g1, %r24
        setx  0xdd3291283d17effe, %g1, %r25
        setx  0xf94c8d49300d31ac, %g1, %r26
        setx  0xe00e0fc930b1614c, %g1, %r27
        setx  0xabc0527c85b2ec13, %g1, %r28
        setx  0xc49efe1473900c0d, %g1, %r29
        setx  0x371a1b257dcd914c, %g1, %r30
        setx  0xa8996987094bf929, %g1, %r31
	.word 0xc42a0009  ! 10: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xf2120009  ! 10: LDUH_R	lduh	[%r8 + %r9], %r25
	.word 0xb26a0009  ! 10: UDIVX_R	udivx 	%r8, %r9, %r25
	.word 0xa16a2204  ! 10: SDIVX_I	sdivx	%r8, 0x0204, %r16
	.word 0x9b2a1009  ! 12: SLLX_R	sllx	%r8, %r9, %r13
	.word 0x8442295c  ! 12: ADDC_I	addc 	%r8, 0x095c, %r2
	.word 0x88b20009  ! 12: SUBCcc_R	orncc 	%r8, %r9, %r4
	.word 0x884220ac  ! 12: ADDC_I	addc 	%r8, 0x00ac, %r4
	.word 0x9c3a2084  ! 12: XNOR_I	xnor 	%r8, 0x0084, %r14
	.word 0x880a2378  ! 12: AND_I	and 	%r8, 0x0378, %r4
	.word 0x86920009  ! 12: ORcc_R	orcc 	%r8, %r9, %r3
	.word 0x9a9227a8  ! 12: ORcc_I	orcc 	%r8, 0x07a8, %r13
	.word 0x9a320009  ! 12: ORN_R	orn 	%r8, %r9, %r13
	.word 0xa4b224e0  ! 12: SUBCcc_I	orncc 	%r8, 0x04e0, %r18
	.word 0x8b3a2001  ! 12: SRA_I	sra 	%r8, 0x0001, %r5
	.word 0x8a422d04  ! 13: ADDC_I	addc 	%r8, 0x0d04, %r5
	.word 0xaa220009  ! 13: SUB_R	sub 	%r8, %r9, %r21
	.word 0x84220009  ! 13: SUB_R	sub 	%r8, %r9, %r2
	.word 0x862a0009  ! 13: ANDN_R	andn 	%r8, %r9, %r3
	.word 0x883a0009  ! 13: XNOR_R	xnor 	%r8, %r9, %r4
	.word 0xae920009  ! 13: ORcc_R	orcc 	%r8, %r9, %r23
	.word 0x88b228c4  ! 13: ORNcc_I	orncc 	%r8, 0x08c4, %r4
	.word 0x8a922ff0  ! 13: ORcc_I	orcc 	%r8, 0x0ff0, %r5
	.word 0x8642225c  ! 13: ADDC_I	addc 	%r8, 0x025c, %r3
	.word 0x84322a5c  ! 13: SUBC_I	orn 	%r8, 0x0a5c, %r2
	.word 0x86120009  ! 13: OR_R	or 	%r8, %r9, %r3
	.word 0x8e820009  ! 13: ADDcc_R	addcc 	%r8, %r9, %r7
	.word 0x2cc20001  ! 15: BRGZ	brgz,a,nt	%8,<label_0x20001>
	.word 0x887229f8  ! 15: UDIV_I	udiv 	%r8, 0x09f8, %r4
	.word 0xce320009  ! 21: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc3020009  ! 21: LDF_R	ld	[%r8, %r9], %f1
	.word 0x8a8a0009  ! 21: ANDcc_R	andcc 	%r8, %r9, %r5
	.word 0xb0f228a4  ! 21: UDIVcc_I	udivcc 	%r8, 0x08a4, %r24
	.word 0xc8720009  ! 26: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc9020009  ! 26: LDF_R	ld	[%r8, %r9], %f4
	.word 0x836a2628  ! 26: SDIVX_I	sdivx	%r8, 0x0628, %r1
	.word 0x8d6a20b4  ! 26: SDIVX_I	sdivx	%r8, 0x00b4, %r6
	.word 0x02800002  ! 29: BE	be  	<label_0x2>
	.word 0x84f22340  ! 29: UDIVcc_I	udivcc 	%r8, 0x0340, %r2
	.word 0x86b20009  ! 31: ORNcc_R	orncc 	%r8, %r9, %r3
	.word 0x8a222eb0  ! 31: SUB_I	sub 	%r8, 0x0eb0, %r5
	.word 0xa88a203c  ! 31: ANDcc_I	andcc 	%r8, 0x003c, %r20
	.word 0x8f641809  ! 31: MOVcc_R	<illegal instruction>
	.word 0x88ba0009  ! 31: XNORcc_R	xnorcc 	%r8, %r9, %r4
	.word 0xb8820009  ! 31: ADDcc_R	addcc 	%r8, %r9, %r28
	.word 0x972a2001  ! 31: SLL_I	sll 	%r8, 0x0001, %r11
	.word 0x86aa0009  ! 31: ANDNcc_R	andncc 	%r8, %r9, %r3
	.word 0x87320009  ! 31: SRL_R	srl 	%r8, %r9, %r3
	.word 0x84c221c0  ! 31: ADDCcc_I	addccc 	%r8, 0x01c0, %r2
	.word 0x8cb20009  ! 31: SUBCcc_R	orncc 	%r8, %r9, %r6
	.word 0x833a3001  ! 32: SRAX_I	srax	%r8, 0x0001, %r1
	.word 0xba0a2e14  ! 32: AND_I	and 	%r8, 0x0e14, %r29
	.word 0x8a020009  ! 32: ADD_R	add 	%r8, %r9, %r5
	.word 0x8a9a2bf4  ! 32: XORcc_I	xorcc 	%r8, 0x0bf4, %r5
	.word 0xa69a2c44  ! 32: XORcc_I	xorcc 	%r8, 0x0c44, %r19
	.word 0x832a1009  ! 32: SLLX_R	sllx	%r8, %r9, %r1
	.word 0x842a2c68  ! 32: ANDN_I	andn 	%r8, 0x0c68, %r2
	.word 0x8c222740  ! 32: SUB_I	sub 	%r8, 0x0740, %r6
	.word 0x84320009  ! 32: SUBC_R	orn 	%r8, %r9, %r2
	.word 0x88122884  ! 32: OR_I	or 	%r8, 0x0884, %r4
	.word 0x8a2a0009  ! 32: ANDN_R	andn 	%r8, %r9, %r5
	.word 0x8e3a0009  ! 37: XNOR_R	xnor 	%r8, %r9, %r7
	.word 0x828a26e8  ! 37: ANDcc_I	andcc 	%r8, 0x06e8, %r1
	.word 0x85320009  ! 37: SRL_R	srl 	%r8, %r9, %r2
	.word 0xa1323001  ! 37: SRLX_I	srlx	%r8, 0x0001, %r16
	.word 0x842a0009  ! 37: ANDN_R	andn 	%r8, %r9, %r2
	.word 0x8e320009  ! 37: SUBC_R	orn 	%r8, %r9, %r7
	.word 0x981a0009  ! 37: XOR_R	xor 	%r8, %r9, %r12
	.word 0x872a3001  ! 37: SLLX_I	sllx	%r8, 0x0001, %r3
	.word 0x88822f84  ! 37: ADDcc_I	addcc 	%r8, 0x0f84, %r4
	.word 0xbb780409  ! 37: MOVR_R	move	%r0, %r9, %r29
	.word 0x84220009  ! 37: SUB_R	sub 	%r8, %r9, %r2
	.word 0x852a2001  ! 37: SLL_I	sll 	%r8, 0x0001, %r2
	.word 0x8eba0009  ! 37: XNORcc_R	xnorcc 	%r8, %r9, %r7
	.word 0x8eb20009  ! 37: SUBCcc_R	orncc 	%r8, %r9, %r7
	.word 0x02ca0001  ! 40: BRZ	brz  ,pt	%8,<label_0xa0001>
	.word 0x88f22690  ! 40: UDIVcc_I	udivcc 	%r8, 0x0690, %r4
	.word 0xf3220009  ! 44: STF_R	st	%f25, [%r9, %r8]
	.word 0xca020009  ! 44: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xb76a0009  ! 44: SDIVX_R	sdivx	%r8, %r9, %r27
	.word 0x84722160  ! 44: UDIV_I	udiv 	%r8, 0x0160, %r2
	.word 0xdb220009  ! 48: STF_R	st	%f13, [%r9, %r8]
	.word 0xfa020009  ! 48: LDUW_R	lduw	[%r8 + %r9], %r29
	.word 0x8a820009  ! 48: ADDcc_R	addcc 	%r8, %r9, %r5
	.word 0x84722af4  ! 48: UDIV_I	udiv 	%r8, 0x0af4, %r2
	.word 0x0cc20001  ! 51: BRGZ	brgz  ,nt	%8,<label_0x20001>
	.word 0xbf6a0009  ! 51: SDIVX_R	sdivx	%r8, %r9, %r31
	.word 0xac322774  ! 52: ORN_I	orn 	%r8, 0x0774, %r22
	.word 0xb2c20009  ! 52: ADDCcc_R	addccc 	%r8, %r9, %r25
	.word 0x8eb22c10  ! 52: ORNcc_I	orncc 	%r8, 0x0c10, %r7
	.word 0x8e9a2434  ! 52: XORcc_I	xorcc 	%r8, 0x0434, %r7
	.word 0xb00a0009  ! 52: AND_R	and 	%r8, %r9, %r24
	.word 0x8f3a0009  ! 52: SRA_R	sra 	%r8, %r9, %r7
	.word 0x842a0009  ! 52: ANDN_R	andn 	%r8, %r9, %r2
	.word 0x873a3001  ! 52: SRAX_I	srax	%r8, 0x0001, %r3
	.word 0x8cb20009  ! 52: ORNcc_R	orncc 	%r8, %r9, %r6
	.word 0x88a20009  ! 52: SUBcc_R	subcc 	%r8, %r9, %r4
	.word 0x8ab20009  ! 52: ORNcc_R	orncc 	%r8, %r9, %r5
	.word 0x8e920009  ! 53: ORcc_R	orcc 	%r8, %r9, %r7
	.word 0xa4ba0009  ! 53: XNORcc_R	xnorcc 	%r8, %r9, %r18
	.word 0x8e220009  ! 53: SUB_R	sub 	%r8, %r9, %r7
	.word 0x888a0009  ! 53: ANDcc_R	andcc 	%r8, %r9, %r4
	.word 0x9c2224fc  ! 53: SUB_I	sub 	%r8, 0x04fc, %r14
	.word 0x893a2001  ! 53: SRA_I	sra 	%r8, 0x0001, %r4
	.word 0x8f321009  ! 53: SRLX_R	srlx	%r8, %r9, %r7
	.word 0x8e2a0009  ! 53: ANDN_R	andn 	%r8, %r9, %r7
	.word 0xb13a1009  ! 53: SRAX_R	srax	%r8, %r9, %r24
	.word 0x892a3001  ! 53: SLLX_I	sllx	%r8, 0x0001, %r4
	.word 0x8f780409  ! 53: MOVR_R	move	%r0, %r9, %r7
	.word 0x833a3001  ! 59: SRAX_I	srax	%r8, 0x0001, %r1
	.word 0x82822994  ! 59: ADDcc_I	addcc 	%r8, 0x0994, %r1
	.word 0xbc222884  ! 59: SUB_I	sub 	%r8, 0x0884, %r30
	.word 0x88320009  ! 59: ORN_R	orn 	%r8, %r9, %r4
	.word 0xae2228e4  ! 59: SUB_I	sub 	%r8, 0x08e4, %r23
	.word 0xa4020009  ! 59: ADD_R	add 	%r8, %r9, %r18
	.word 0x82b224cc  ! 59: SUBCcc_I	orncc 	%r8, 0x04cc, %r1
	.word 0x8b780409  ! 59: MOVR_R	move	%r0, %r9, %r5
	.word 0x8a820009  ! 59: ADDcc_R	addcc 	%r8, %r9, %r5
	.word 0xb0b227a4  ! 59: SUBCcc_I	orncc 	%r8, 0x07a4, %r24
	.word 0x82a224ac  ! 59: SUBcc_I	subcc 	%r8, 0x04ac, %r1
	.word 0x82120009  ! 59: OR_R	or 	%r8, %r9, %r1
	.word 0x88120009  ! 59: OR_R	or 	%r8, %r9, %r4
	.word 0x8e220009  ! 59: SUB_R	sub 	%r8, %r9, %r7
	.word 0xce320009  ! 63: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xcd1a0009  ! 63: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0x84f20009  ! 63: UDIVcc_R	udivcc 	%r8, %r9, %r2
	.word 0x867229e8  ! 63: UDIV_I	udiv 	%r8, 0x09e8, %r3
	.word 0x0cca0001  ! 66: BRGZ	brgz  ,pt	%8,<label_0xa0001>
	.word 0xb67a2d28  ! 66: SDIV_I	sdiv 	%r8, 0x0d28, %r27
	.word 0x00800001  ! 73: BN	bn  	<label_0x1>
	.word 0x8e6a0009  ! 73: UDIVX_R	udivx 	%r8, %r9, %r7
	.word 0xee320009  ! 77: STH_R	sth	%r23, [%r8 + %r9]
	.word 0xcc520009  ! 77: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0x8e6a0009  ! 77: UDIVX_R	udivx 	%r8, %r9, %r7
	.word 0x8c720009  ! 77: UDIV_R	udiv 	%r8, %r9, %r6
	.word 0x26800001  ! 79: BL	bl,a	<label_0x1>
	.word 0xa87222e0  ! 79: UDIV_I	udiv 	%r8, 0x02e0, %r20
	.word 0xca720009  ! 83: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xe51a0009  ! 83: LDDF_R	ldd	[%r8, %r9], %f18
	.word 0x827a26c0  ! 83: SDIV_I	sdiv 	%r8, 0x06c0, %r1
	.word 0x8c722dc0  ! 83: UDIV_I	udiv 	%r8, 0x0dc0, %r6
	.word 0x24c20001  ! 90: BRLEZ	brlez,a,nt	%8,<label_0x20001>
	.word 0x8b6a0009  ! 90: SDIVX_R	sdivx	%r8, %r9, %r5
	.word 0x82320009  ! 93: SUBC_R	orn 	%r8, %r9, %r1
	.word 0x8b2a1009  ! 93: SLLX_R	sllx	%r8, %r9, %r5
	.word 0x8cc22ca8  ! 93: ADDCcc_I	addccc 	%r8, 0x0ca8, %r6
	.word 0x96322e2c  ! 93: SUBC_I	orn 	%r8, 0x0e2c, %r11
	.word 0x8d780409  ! 93: MOVR_R	move	%r0, %r9, %r6
	.word 0x848a0009  ! 93: ANDcc_R	andcc 	%r8, %r9, %r2
	.word 0xb7780409  ! 93: MOVR_R	move	%r0, %r9, %r27
	.word 0xa0220009  ! 93: SUB_R	sub 	%r8, %r9, %r16
	.word 0x868a20c4  ! 93: ANDcc_I	andcc 	%r8, 0x00c4, %r3
	.word 0xb83a0009  ! 93: XNOR_R	xnor 	%r8, %r9, %r28
	.word 0x40000001  ! 96: CALL	call	disp30_1
	.word 0x847a2204  ! 96: SDIV_I	sdiv 	%r8, 0x0204, %r2
	.word 0x12800002  ! 99: BNE	bne  	<label_0x2>
	.word 0xbd6a2094  ! 99: SDIVX_I	sdivx	%r8, 0x0094, %r30
	.word 0x0a800001  ! 102: BCS	bcs  	<label_0x1>
	.word 0xbefa0009  ! 102: SDIVcc_R	sdivcc 	%r8, %r9, %r31
	.word 0x28800001  ! 104: BLEU	bleu,a	<label_0x1>
	.word 0x8c7229e4  ! 104: UDIV_I	udiv 	%r8, 0x09e4, %r6
	.word 0xc4720009  ! 108: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc85a0009  ! 108: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0x956a2368  ! 108: SDIVX_I	sdivx	%r8, 0x0368, %r10
	.word 0xb2f22488  ! 108: UDIVcc_I	udivcc 	%r8, 0x0488, %r25
	.word 0x85320009  ! 109: SRL_R	srl 	%r8, %r9, %r2
	.word 0x9aaa0009  ! 109: ANDNcc_R	andncc 	%r8, %r9, %r13
	.word 0x88aa28fc  ! 109: ANDNcc_I	andncc 	%r8, 0x08fc, %r4
	.word 0x853a1009  ! 109: SRAX_R	srax	%r8, %r9, %r2
	.word 0x86b22c48  ! 109: SUBCcc_I	orncc 	%r8, 0x0c48, %r3
	.word 0xa9643801  ! 109: MOVcc_I	<illegal instruction>
	.word 0x85320009  ! 109: SRL_R	srl 	%r8, %r9, %r2
	.word 0x8f3a3001  ! 109: SRAX_I	srax	%r8, 0x0001, %r7
	.word 0x960220f0  ! 109: ADD_I	add 	%r8, 0x00f0, %r11
	.word 0x853a0009  ! 109: SRA_R	sra 	%r8, %r9, %r2
	.word 0x85780409  ! 109: MOVR_R	move	%r0, %r9, %r2
	.word 0xb3320009  ! 109: SRL_R	srl 	%r8, %r9, %r25
	.word 0xac3a2628  ! 111: XNOR_I	xnor 	%r8, 0x0628, %r22
	.word 0x86420009  ! 111: ADDC_R	addc 	%r8, %r9, %r3
	.word 0x8d2a3001  ! 111: SLLX_I	sllx	%r8, 0x0001, %r6
	.word 0xb0322878  ! 111: ORN_I	orn 	%r8, 0x0878, %r24
	.word 0x8c422ae0  ! 111: ADDC_I	addc 	%r8, 0x0ae0, %r6
	.word 0xb0b20009  ! 111: SUBCcc_R	orncc 	%r8, %r9, %r24
	.word 0x88c221f0  ! 111: ADDCcc_I	addccc 	%r8, 0x01f0, %r4
	.word 0x89641809  ! 111: MOVcc_R	<illegal instruction>
	.word 0x86920009  ! 111: ORcc_R	orcc 	%r8, %r9, %r3
	.word 0x9a3226bc  ! 111: ORN_I	orn 	%r8, 0x06bc, %r13
	.word 0x823222a4  ! 111: ORN_I	orn 	%r8, 0x02a4, %r1
	.word 0xaea22d68  ! 111: SUBcc_I	subcc 	%r8, 0x0d68, %r23
	.word 0x848a2660  ! 111: ANDcc_I	andcc 	%r8, 0x0660, %r2
	.word 0x828a0009  ! 111: ANDcc_R	andcc 	%r8, %r9, %r1
	.word 0xeb3a0009  ! 116: STDF_R	std	%f21, [%r9, %r8]
	.word 0xce120009  ! 116: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0x8ef22be4  ! 116: UDIVcc_I	udivcc 	%r8, 0x0be4, %r7
	.word 0xa16a0009  ! 116: SDIVX_R	sdivx	%r8, %r9, %r16
	.word 0xd7220009  ! 124: STF_R	st	%f11, [%r9, %r8]
	.word 0xc01a0009  ! 124: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0x88f20009  ! 124: UDIVcc_R	udivcc 	%r8, %r9, %r4
	.word 0x886a2afc  ! 124: UDIVX_I	udivx 	%r8, 0x0afc, %r4
	.word 0x22c20001  ! 129: BRZ	brz,a,nt	%8,<label_0x20001>
	.word 0x84f22ef0  ! 129: UDIVcc_I	udivcc 	%r8, 0x0ef0, %r2
	.word 0xcc320009  ! 137: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xe11a0009  ! 137: LDDF_R	ldd	[%r8, %r9], %f16
	.word 0xcaca2ae8  ! 137: LDSBA_I	ldsba	[%r8, + 0x0ae8] %asi, %r5
	.word 0x8a6a0009  ! 137: UDIVX_R	udivx 	%r8, %r9, %r5
	.word 0x38800001  ! 139: BGU	bgu,a	<label_0x1>
	.word 0x8f6a0009  ! 139: SDIVX_R	sdivx	%r8, %r9, %r7
	.word 0x3a800001  ! 142: BCC	bcc,a	<label_0x1>
	.word 0x8c6a2f28  ! 142: UDIVX_I	udivx 	%r8, 0x0f28, %r6
	.word 0x1e800001  ! 145: BVC	bvc  	<label_0x1>
	.word 0x8af22144  ! 145: UDIVcc_I	udivcc 	%r8, 0x0144, %r5
	.word 0x38800001  ! 147: BGU	bgu,a	<label_0x1>
	.word 0xaa6a2e4c  ! 147: UDIVX_I	udivx 	%r8, 0x0e4c, %r21
	.word 0x04ca0001  ! 151: BRLEZ	brlez  ,pt	%8,<label_0xa0001>
	.word 0xad6a0009  ! 151: SDIVX_R	sdivx	%r8, %r9, %r22
	.word 0x12800001  ! 153: BNE	bne  	<label_0x1>
	.word 0xa07a0009  ! 153: SDIV_R	sdiv 	%r8, %r9, %r16
	.word 0x87780409  ! 154: MOVR_R	move	%r0, %r9, %r3
	.word 0x96c22034  ! 154: ADDCcc_I	addccc 	%r8, 0x0034, %r11
	.word 0xb0320009  ! 154: ORN_R	orn 	%r8, %r9, %r24
	.word 0x8eb20009  ! 154: SUBCcc_R	orncc 	%r8, %r9, %r7
	.word 0xa1780409  ! 154: MOVR_R	move	%r0, %r9, %r16
	.word 0xaeb20009  ! 154: SUBCcc_R	orncc 	%r8, %r9, %r23
	.word 0x82a22a8c  ! 154: SUBcc_I	subcc 	%r8, 0x0a8c, %r1
	.word 0x992a2001  ! 154: SLL_I	sll 	%r8, 0x0001, %r12
	.word 0x88320009  ! 154: ORN_R	orn 	%r8, %r9, %r4
	.word 0x8a3229a0  ! 154: SUBC_I	orn 	%r8, 0x09a0, %r5
	.word 0xacb22d28  ! 154: SUBCcc_I	orncc 	%r8, 0x0d28, %r22
	.word 0x823a27e8  ! 154: XNOR_I	xnor 	%r8, 0x07e8, %r1
	.word 0x36800001  ! 156: BGE	bge,a	<label_0x1>
	.word 0xb76a0009  ! 156: SDIVX_R	sdivx	%r8, %r9, %r27
	.word 0xca2a0009  ! 160: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xe5020009  ! 160: LDF_R	ld	[%r8, %r9], %f18
	.word 0x88f2261c  ! 160: UDIVcc_I	udivcc 	%r8, 0x061c, %r4
	.word 0x8af20009  ! 160: UDIVcc_R	udivcc 	%r8, %r9, %r5
	.word 0xe13a0009  ! 167: STDF_R	std	%f16, [%r9, %r8]
	.word 0xce420009  ! 167: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0x866a24a8  ! 167: UDIVX_I	udivx 	%r8, 0x04a8, %r3
	.word 0xb86a2b64  ! 167: UDIVX_I	udivx 	%r8, 0x0b64, %r28
	.word 0x8d780409  ! 172: MOVR_R	move	%r0, %r9, %r6
	.word 0x98a20009  ! 172: SUBcc_R	subcc 	%r8, %r9, %r12
	.word 0xac1a2710  ! 172: XOR_I	xor 	%r8, 0x0710, %r22
	.word 0x853a0009  ! 172: SRA_R	sra 	%r8, %r9, %r2
	.word 0xa4b20009  ! 172: SUBCcc_R	orncc 	%r8, %r9, %r18
	.word 0x8f2a0009  ! 172: SLL_R	sll 	%r8, %r9, %r7
	.word 0x822a2b00  ! 172: ANDN_I	andn 	%r8, 0x0b00, %r1
	.word 0x88a2290c  ! 172: SUBcc_I	subcc 	%r8, 0x090c, %r4
	.word 0x948a0009  ! 172: ANDcc_R	andcc 	%r8, %r9, %r10
	.word 0x8c022a58  ! 172: ADD_I	add 	%r8, 0x0a58, %r6
	.word 0x85780409  ! 172: MOVR_R	move	%r0, %r9, %r2
	.word 0x22ca0001  ! 175: BRZ	brz,a,pt	%8,<label_0xa0001>
	.word 0xb0fa0009  ! 175: SDIVcc_R	sdivcc 	%r8, %r9, %r24
	.word 0xcd220009  ! 180: STF_R	st	%f6, [%r9, %r8]
	.word 0xca420009  ! 180: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0x996a29e4  ! 180: SDIVX_I	sdivx	%r8, 0x09e4, %r12
	.word 0xa27a0009  ! 180: SDIV_R	sdiv 	%r8, %r9, %r17
	.word 0x22800001  ! 182: BE	be,a	<label_0x1>
	.word 0x88722b74  ! 182: UDIV_I	udiv 	%r8, 0x0b74, %r4
	.word 0xe62a0009  ! 188: STB_R	stb	%r19, [%r8 + %r9]
	.word 0xd91a0009  ! 188: LDDF_R	ldd	[%r8, %r9], %f12
	.word 0xec5a2cb4  ! 188: LDX_I	ldx	[%r8 + 0x0cb4], %r22
	.word 0x826a0009  ! 188: UDIVX_R	udivx 	%r8, %r9, %r1
	.word 0x3a800001  ! 190: BCC	bcc,a	<label_0x1>
	.word 0xb27221d8  ! 190: UDIV_I	udiv 	%r8, 0x01d8, %r25
	.word 0x1c800002  ! 194: BPOS	bpos  	<label_0x2>
	.word 0x8efa0009  ! 194: SDIVcc_R	sdivcc 	%r8, %r9, %r7
	.word 0x0ec20001  ! 197: BRGEZ	brgez  ,nt	%8,<label_0x20001>
	.word 0xaa6a0009  ! 197: UDIVX_R	udivx 	%r8, %r9, %r21
	.word 0xbc422dec  ! 199: ADDC_I	addc 	%r8, 0x0dec, %r30
	.word 0x82820009  ! 199: ADDcc_R	addcc 	%r8, %r9, %r1
	.word 0x82922e90  ! 199: ORcc_I	orcc 	%r8, 0x0e90, %r1
	.word 0xb4b20009  ! 199: SUBCcc_R	orncc 	%r8, %r9, %r26
	.word 0x8e0a2190  ! 199: AND_I	and 	%r8, 0x0190, %r7
	.word 0x86a20009  ! 199: SUBcc_R	subcc 	%r8, %r9, %r3
	.word 0x8e020009  ! 199: ADD_R	add 	%r8, %r9, %r7
	.word 0x82b223d4  ! 199: SUBCcc_I	orncc 	%r8, 0x03d4, %r1
	.word 0xa2aa2ea4  ! 199: ANDNcc_I	andncc 	%r8, 0x0ea4, %r17
	.word 0x8f782401  ! 199: MOVR_I	move	%r0, 0xfffffea4, %r7
	.word 0xa7780409  ! 199: MOVR_R	move	%r0, %r9, %r19
	.word 0xc6320009  ! 205: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xcc4a0009  ! 205: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0x88920009  ! 205: ORcc_R	orcc 	%r8, %r9, %r4
	.word 0x85323001  ! 205: SRLX_I	srlx	%r8, 0x0001, %r2
	.word 0x83780409  ! 205: MOVR_R	move	%r0, %r9, %r1
	.word 0x8e6a2fd4  ! 205: UDIVX_I	udivx 	%r8, 0x0fd4, %r7
	.word 0x88a22b10  ! 207: SUBcc_I	subcc 	%r8, 0x0b10, %r4
	.word 0xa80a2b38  ! 207: AND_I	and 	%r8, 0x0b38, %r20
	.word 0x86c22ba4  ! 207: ADDCcc_I	addccc 	%r8, 0x0ba4, %r3
	.word 0x853a0009  ! 207: SRA_R	sra 	%r8, %r9, %r2
	.word 0x980221a4  ! 207: ADD_I	add 	%r8, 0x01a4, %r12
	.word 0x84b20009  ! 207: ORNcc_R	orncc 	%r8, %r9, %r2
	.word 0x8b2a2001  ! 207: SLL_I	sll 	%r8, 0x0001, %r5
	.word 0x8e822020  ! 207: ADDcc_I	addcc 	%r8, 0x0020, %r7
	.word 0x98320009  ! 207: SUBC_R	orn 	%r8, %r9, %r12
	.word 0x8232271c  ! 207: SUBC_I	orn 	%r8, 0x071c, %r1
	.word 0x8a920009  ! 207: ORcc_R	orcc 	%r8, %r9, %r5
	.word 0xa8c22a64  ! 207: ADDCcc_I	addccc 	%r8, 0x0a64, %r20
	.word 0x8a32200c  ! 207: SUBC_I	orn 	%r8, 0x000c, %r5
	.word 0x8cb20009  ! 207: ORNcc_R	orncc 	%r8, %r9, %r6
	.word 0x88c20009  ! 207: ADDCcc_R	addccc 	%r8, %r9, %r4
	.word 0x87322001  ! 208: SRL_I	srl 	%r8, 0x0001, %r3
	.word 0x8c022760  ! 208: ADD_I	add 	%r8, 0x0760, %r6
	.word 0x872a3001  ! 208: SLLX_I	sllx	%r8, 0x0001, %r3
	.word 0xaa1a2b2c  ! 208: XOR_I	xor 	%r8, 0x0b2c, %r21
	.word 0x8e122d50  ! 208: OR_I	or 	%r8, 0x0d50, %r7
	.word 0xb00a0009  ! 208: AND_R	and 	%r8, %r9, %r24
	.word 0x82a20009  ! 208: SUBcc_R	subcc 	%r8, %r9, %r1
	.word 0x87320009  ! 208: SRL_R	srl 	%r8, %r9, %r3
	.word 0x94922a50  ! 208: ORcc_I	orcc 	%r8, 0x0a50, %r10
	.word 0x833a2001  ! 208: SRA_I	sra 	%r8, 0x0001, %r1
	.word 0xaa320009  ! 208: ORN_R	orn 	%r8, %r9, %r21
	.word 0x8b3a0009  ! 208: SRA_R	sra 	%r8, %r9, %r5
	.word 0x22800002  ! 210: BE	be,a	<label_0x2>
	.word 0x84fa280c  ! 210: SDIVcc_I	sdivcc 	%r8, 0x080c, %r2
	.word 0x0a800001  ! 215: BCS	bcs  	<label_0x1>
	.word 0xa6f2291c  ! 215: UDIVcc_I	udivcc 	%r8, 0x091c, %r19
	.word 0x840a0009  ! 216: AND_R	and 	%r8, %r9, %r2
	.word 0x87782401  ! 216: MOVR_I	move	%r0, 0x9, %r3
	.word 0x83782401  ! 216: MOVR_I	move	%r0, 0x9, %r1
	.word 0x8b2a3001  ! 216: SLLX_I	sllx	%r8, 0x0001, %r5
	.word 0x88b22bcc  ! 216: SUBCcc_I	orncc 	%r8, 0x0bcc, %r4
	.word 0x848a0009  ! 216: ANDcc_R	andcc 	%r8, %r9, %r2
	.word 0x863221e4  ! 216: SUBC_I	orn 	%r8, 0x01e4, %r3
	.word 0x82322dfc  ! 216: SUBC_I	orn 	%r8, 0x0dfc, %r1
	.word 0x843a0009  ! 216: XNOR_R	xnor 	%r8, %r9, %r2
	.word 0x888a0009  ! 216: ANDcc_R	andcc 	%r8, %r9, %r4
	.word 0xb32a1009  ! 216: SLLX_R	sllx	%r8, %r9, %r25
	.word 0x9a8a0009  ! 216: ANDcc_R	andcc 	%r8, %r9, %r13
	.word 0xa6122db4  ! 216: OR_I	or 	%r8, 0x0db4, %r19
	.word 0x88320009  ! 216: SUBC_R	orn 	%r8, %r9, %r4
	.word 0xe5220009  ! 220: STF_R	st	%f18, [%r9, %r8]
	.word 0xc84a0009  ! 220: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xf2922e98  ! 220: LDUHA_I	lduha	[%r8, + 0x0e98] %asi, %r25
	.word 0x847a0009  ! 220: SDIV_R	sdiv 	%r8, %r9, %r2
	.word 0xf42a0009  ! 224: STB_R	stb	%r26, [%r8 + %r9]
	.word 0xc3020009  ! 224: LDF_R	ld	[%r8, %r9], %f1
	.word 0xcc122144  ! 224: LDUH_I	lduh	[%r8 + 0x0144], %r6
	.word 0x8efa2068  ! 224: SDIVcc_I	sdivcc 	%r8, 0x0068, %r7
	.word 0xcb220009  ! 229: STF_R	st	%f5, [%r9, %r8]
	.word 0xcc120009  ! 229: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xa41a0009  ! 229: XOR_R	xor 	%r8, %r9, %r18
	.word 0xae7a0009  ! 229: SDIV_R	sdiv 	%r8, %r9, %r23
	.word 0x04800001  ! 232: BLE	ble  	<label_0x1>
	.word 0x826a2054  ! 232: UDIVX_I	udivx 	%r8, 0x0054, %r1
	.word 0x3e800001  ! 236: BVC	bvc,a	<label_0x1>
	.word 0x886a224c  ! 236: UDIVX_I	udivx 	%r8, 0x024c, %r4
	.word 0x8b2a2001  ! 237: SLL_I	sll 	%r8, 0x0001, %r5
	.word 0xa0b2263c  ! 237: SUBCcc_I	orncc 	%r8, 0x063c, %r16
	.word 0x96b22a74  ! 237: SUBCcc_I	orncc 	%r8, 0x0a74, %r11
	.word 0xb61223b0  ! 237: OR_I	or 	%r8, 0x03b0, %r27
	.word 0x8a8a2158  ! 237: ANDcc_I	andcc 	%r8, 0x0158, %r5
	.word 0x83643801  ! 237: MOVcc_I	<illegal instruction>
	.word 0x8e320009  ! 237: SUBC_R	orn 	%r8, %r9, %r7
	.word 0x88aa2dbc  ! 237: ANDNcc_I	andncc 	%r8, 0x0dbc, %r4
	.word 0x873a1009  ! 237: SRAX_R	srax	%r8, %r9, %r3
	.word 0x8f2a2001  ! 237: SLL_I	sll 	%r8, 0x0001, %r7
	.word 0x86b20009  ! 237: ORNcc_R	orncc 	%r8, %r9, %r3
	.word 0xa5780409  ! 237: MOVR_R	move	%r0, %r9, %r18
	.word 0x88c20009  ! 237: ADDCcc_R	addccc 	%r8, %r9, %r4
	.word 0xaa920009  ! 237: ORcc_R	orcc 	%r8, %r9, %r21
	.word 0x3a800001  ! 240: BCC	bcc,a	<label_0x1>
	.word 0x84fa0009  ! 240: SDIVcc_R	sdivcc 	%r8, %r9, %r2
	.word 0x8cba0009  ! 243: XNORcc_R	xnorcc 	%r8, %r9, %r6
	.word 0x8a120009  ! 243: OR_R	or 	%r8, %r9, %r5
	.word 0x96220009  ! 243: SUB_R	sub 	%r8, %r9, %r11
	.word 0xa2c20009  ! 243: ADDCcc_R	addccc 	%r8, %r9, %r17
	.word 0xa8322f98  ! 243: ORN_I	orn 	%r8, 0x0f98, %r20
	.word 0xa9782401  ! 243: MOVR_I	move	%r0, 0xffffff98, %r20
	.word 0x84b20009  ! 243: SUBCcc_R	orncc 	%r8, %r9, %r2
	.word 0x86822d5c  ! 243: ADDcc_I	addcc 	%r8, 0x0d5c, %r3
	.word 0xb2b20009  ! 243: SUBCcc_R	orncc 	%r8, %r9, %r25
	.word 0xa6aa0009  ! 243: ANDNcc_R	andncc 	%r8, %r9, %r19
	.word 0x893a3001  ! 243: SRAX_I	srax	%r8, 0x0001, %r4
	.word 0xa41224b8  ! 243: OR_I	or 	%r8, 0x04b8, %r18
	.word 0x3a800002  ! 245: BCC	bcc,a	<label_0x2>
	.word 0xacf20009  ! 245: UDIVcc_R	udivcc 	%r8, %r9, %r22
	.word 0xc9220009  ! 250: STF_R	st	%f4, [%r9, %r8]
	.word 0xf01a0009  ! 250: LDD_R	ldd	[%r8 + %r9], %r24
	.word 0x82922dac  ! 250: ORcc_I	orcc 	%r8, 0x0dac, %r1
	.word 0xbf6a21b4  ! 250: SDIVX_I	sdivx	%r8, 0x01b4, %r31
	.word 0xe4220009  ! 257: STW_R	stw	%r18, [%r8 + %r9]
	.word 0xce020009  ! 257: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0x8e7a2474  ! 257: SDIV_I	sdiv 	%r8, 0x0474, %r7
	.word 0x896a2ca4  ! 257: SDIVX_I	sdivx	%r8, 0x0ca4, %r4
	.word 0x36800002  ! 259: BGE	bge,a	<label_0x2>
	.word 0x856a2ae4  ! 259: SDIVX_I	sdivx	%r8, 0x0ae4, %r2
	.word 0x04c20001  ! 261: BRLEZ	brlez  ,nt	%8,<label_0x20001>
	.word 0x8c7a0009  ! 261: SDIV_R	sdiv 	%r8, %r9, %r6
	.word 0xc7220009  ! 266: STF_R	st	%f3, [%r9, %r8]
	.word 0xca420009  ! 266: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0x8cfa2194  ! 266: SDIVcc_I	sdivcc 	%r8, 0x0194, %r6
	.word 0x8c722bd0  ! 266: UDIV_I	udiv 	%r8, 0x0bd0, %r6
	.word 0xc6320009  ! 271: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xd91a0009  ! 271: LDDF_R	ldd	[%r8, %r9], %f12
	.word 0x8f6a0009  ! 271: SDIVX_R	sdivx	%r8, %r9, %r7
	.word 0x876a25a0  ! 271: SDIVX_I	sdivx	%r8, 0x05a0, %r3
	.word 0xcf3a0009  ! 281: STDF_R	std	%f7, [%r9, %r8]
	.word 0xf25a0009  ! 281: LDX_R	ldx	[%r8 + %r9], %r25
	.word 0x9c720009  ! 281: UDIV_R	udiv 	%r8, %r9, %r14
	.word 0x9efa2e3c  ! 281: SDIVcc_I	sdivcc 	%r8, 0x0e3c, %r15
	.word 0x8f323001  ! 282: SRLX_I	srlx	%r8, 0x0001, %r7
	.word 0x9a020009  ! 282: ADD_R	add 	%r8, %r9, %r13
	.word 0x8eba0009  ! 282: XNORcc_R	xnorcc 	%r8, %r9, %r7
	.word 0x84a2278c  ! 282: SUBcc_I	subcc 	%r8, 0x078c, %r2
	.word 0x89641809  ! 282: MOVcc_R	<illegal instruction>
	.word 0x8c320009  ! 282: SUBC_R	orn 	%r8, %r9, %r6
	.word 0x833a2001  ! 282: SRA_I	sra 	%r8, 0x0001, %r1
	.word 0xad2a1009  ! 282: SLLX_R	sllx	%r8, %r9, %r22
	.word 0xb21a0009  ! 282: XOR_R	xor 	%r8, %r9, %r25
	.word 0x84c22850  ! 282: ADDCcc_I	addccc 	%r8, 0x0850, %r2
	.word 0x8ea2219c  ! 282: SUBcc_I	subcc 	%r8, 0x019c, %r7
	.word 0x8c322338  ! 282: ORN_I	orn 	%r8, 0x0338, %r6
	.word 0x8b643801  ! 282: MOVcc_I	<illegal instruction>
	.word 0x26800001  ! 286: BL	bl,a	<label_0x1>
	.word 0x82720009  ! 286: UDIV_R	udiv 	%r8, %r9, %r1
	.word 0xf8720009  ! 290: STX_R	stx	%r28, [%r8 + %r9]
	.word 0xc24a0009  ! 290: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0x967a2648  ! 290: SDIV_I	sdiv 	%r8, 0x0648, %r11
	.word 0x96f22658  ! 290: UDIVcc_I	udivcc 	%r8, 0x0658, %r11
	.word 0xcf3a0009  ! 295: STDF_R	std	%f7, [%r9, %r8]
	.word 0xfc1a0009  ! 295: LDD_R	ldd	[%r8 + %r9], %r30
	.word 0x94f20009  ! 295: UDIVcc_R	udivcc 	%r8, %r9, %r10
	.word 0x94f20009  ! 295: UDIVcc_R	udivcc 	%r8, %r9, %r10
	.word 0xca720009  ! 303: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xcc0a0009  ! 303: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xc8520009  ! 303: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0x826a0009  ! 303: UDIVX_R	udivx 	%r8, %r9, %r1
	.word 0x8b3a3001  ! 305: SRAX_I	srax	%r8, 0x0001, %r5
	.word 0x86022610  ! 305: ADD_I	add 	%r8, 0x0610, %r3
	.word 0x86b20009  ! 305: SUBCcc_R	orncc 	%r8, %r9, %r3
	.word 0x941a0009  ! 305: XOR_R	xor 	%r8, %r9, %r10
	.word 0x8a020009  ! 305: ADD_R	add 	%r8, %r9, %r5
	.word 0xb6020009  ! 305: ADD_R	add 	%r8, %r9, %r27
	.word 0xb53a1009  ! 305: SRAX_R	srax	%r8, %r9, %r26
	.word 0x8c2228e4  ! 305: SUB_I	sub 	%r8, 0x08e4, %r6
	.word 0xa8c20009  ! 305: ADDCcc_R	addccc 	%r8, %r9, %r20
	.word 0x8a922e3c  ! 305: ORcc_I	orcc 	%r8, 0x0e3c, %r5
	.word 0x89641809  ! 305: MOVcc_R	<illegal instruction>
	.word 0x82ba0009  ! 305: XNORcc_R	xnorcc 	%r8, %r9, %r1
	.word 0xce2a0009  ! 309: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc65a0009  ! 309: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0x846a2d54  ! 309: UDIVX_I	udivx 	%r8, 0x0d54, %r2
	.word 0x8c720009  ! 309: UDIV_R	udiv 	%r8, %r9, %r6
	.word 0x85641809  ! 310: MOVcc_R	<illegal instruction>
	.word 0xb6c224c0  ! 310: ADDCcc_I	addccc 	%r8, 0x04c0, %r27
	.word 0xb29a0009  ! 310: XORcc_R	xorcc 	%r8, %r9, %r25
	.word 0x8a3227fc  ! 310: SUBC_I	orn 	%r8, 0x07fc, %r5
	.word 0x8b322001  ! 310: SRL_I	srl 	%r8, 0x0001, %r5
	.word 0xb6a20009  ! 310: SUBcc_R	subcc 	%r8, %r9, %r27
	.word 0x829a2c5c  ! 310: XORcc_I	xorcc 	%r8, 0x0c5c, %r1
	.word 0x8c220009  ! 310: SUB_R	sub 	%r8, %r9, %r6
	.word 0x84c22448  ! 310: ADDCcc_I	addccc 	%r8, 0x0448, %r2
	.word 0xb63220c8  ! 310: ORN_I	orn 	%r8, 0x00c8, %r27
	.word 0x8c8a0009  ! 310: ANDcc_R	andcc 	%r8, %r9, %r6
	.word 0x84122c4c  ! 310: OR_I	or 	%r8, 0x0c4c, %r2
	.word 0x8e1a2d84  ! 310: XOR_I	xor 	%r8, 0x0d84, %r7
	.word 0x8cba0009  ! 310: XNORcc_R	xnorcc 	%r8, %r9, %r6
	.word 0x86aa0009  ! 311: ANDNcc_R	andncc 	%r8, %r9, %r3
	.word 0x98020009  ! 311: ADD_R	add 	%r8, %r9, %r12
	.word 0x96b20009  ! 311: SUBCcc_R	orncc 	%r8, %r9, %r11
	.word 0x8e8a0009  ! 311: ANDcc_R	andcc 	%r8, %r9, %r7
	.word 0x822a0009  ! 311: ANDN_R	andn 	%r8, %r9, %r1
	.word 0x8b2a1009  ! 311: SLLX_R	sllx	%r8, %r9, %r5
	.word 0x85321009  ! 311: SRLX_R	srlx	%r8, %r9, %r2
	.word 0x8f2a1009  ! 311: SLLX_R	sllx	%r8, %r9, %r7
	.word 0x83323001  ! 311: SRLX_I	srlx	%r8, 0x0001, %r1
	.word 0xbe1229f4  ! 311: OR_I	or 	%r8, 0x09f4, %r31
	.word 0x880a0009  ! 311: AND_R	and 	%r8, %r9, %r4
	.word 0x06800001  ! 314: BL	bl  	<label_0x1>
	.word 0x8af227a4  ! 314: UDIVcc_I	udivcc 	%r8, 0x07a4, %r5
	.word 0x8d641809  ! 315: MOVcc_R	<illegal instruction>
	.word 0x8e9a0009  ! 315: XORcc_R	xorcc 	%r8, %r9, %r7
	.word 0x96822138  ! 315: ADDcc_I	addcc 	%r8, 0x0138, %r11
	.word 0x8cb22e04  ! 315: ORNcc_I	orncc 	%r8, 0x0e04, %r6
	.word 0x8c1a0009  ! 315: XOR_R	xor 	%r8, %r9, %r6
	.word 0x8c2a0009  ! 315: ANDN_R	andn 	%r8, %r9, %r6
	.word 0x94b20009  ! 315: ORNcc_R	orncc 	%r8, %r9, %r10
	.word 0x8ab20009  ! 315: ORNcc_R	orncc 	%r8, %r9, %r5
	.word 0x8cb20009  ! 315: SUBCcc_R	orncc 	%r8, %r9, %r6
	.word 0x88920009  ! 315: ORcc_R	orcc 	%r8, %r9, %r4
	.word 0x86820009  ! 317: ADDcc_R	addcc 	%r8, %r9, %r3
	.word 0x86aa24d0  ! 317: ANDNcc_I	andncc 	%r8, 0x04d0, %r3
	.word 0x8d3a1009  ! 317: SRAX_R	srax	%r8, %r9, %r6
	.word 0x8ac20009  ! 317: ADDCcc_R	addccc 	%r8, %r9, %r5
	.word 0x84ba0009  ! 317: XNORcc_R	xnorcc 	%r8, %r9, %r2
	.word 0x832a1009  ! 317: SLLX_R	sllx	%r8, %r9, %r1
	.word 0xa1322001  ! 317: SRL_I	srl 	%r8, 0x0001, %r16
	.word 0x8eaa28c8  ! 317: ANDNcc_I	andncc 	%r8, 0x08c8, %r7
	.word 0x989a0009  ! 317: XORcc_R	xorcc 	%r8, %r9, %r12
	.word 0xa2320009  ! 317: ORN_R	orn 	%r8, %r9, %r17
	.word 0x8ea20009  ! 317: SUBcc_R	subcc 	%r8, %r9, %r7
	.word 0xcc720009  ! 321: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xce5a0009  ! 321: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xc81a0009  ! 321: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x98f20009  ! 321: UDIVcc_R	udivcc 	%r8, %r9, %r12
	.word 0x9b3a1009  ! 323: SRAX_R	srax	%r8, %r9, %r13
	.word 0x84ba0009  ! 323: XNORcc_R	xnorcc 	%r8, %r9, %r2
	.word 0x86220009  ! 323: SUB_R	sub 	%r8, %r9, %r3
	.word 0x968a0009  ! 323: ANDcc_R	andcc 	%r8, %r9, %r11
	.word 0x9d321009  ! 323: SRLX_R	srlx	%r8, %r9, %r14
	.word 0x84020009  ! 323: ADD_R	add 	%r8, %r9, %r2
	.word 0xb32a1009  ! 323: SLLX_R	sllx	%r8, %r9, %r25
	.word 0x841a0009  ! 323: XOR_R	xor 	%r8, %r9, %r2
	.word 0xb2320009  ! 323: ORN_R	orn 	%r8, %r9, %r25
	.word 0xa3641809  ! 323: MOVcc_R	<illegal instruction>
	.word 0xa83a2558  ! 323: XNOR_I	xnor 	%r8, 0x0558, %r20
	.word 0x8a3a0009  ! 323: XNOR_R	xnor 	%r8, %r9, %r5
	.word 0xbc320009  ! 323: ORN_R	orn 	%r8, %r9, %r30
	.word 0x882a0009  ! 323: ANDN_R	andn 	%r8, %r9, %r4
	.word 0xbf2a3001  ! 324: SLLX_I	sllx	%r8, 0x0001, %r31
	.word 0x84220009  ! 324: SUB_R	sub 	%r8, %r9, %r2
	.word 0x849a20f0  ! 324: XORcc_I	xorcc 	%r8, 0x00f0, %r2
	.word 0x889a0009  ! 324: XORcc_R	xorcc 	%r8, %r9, %r4
	.word 0x83320009  ! 324: SRL_R	srl 	%r8, %r9, %r1
	.word 0x8a2a0009  ! 324: ANDN_R	andn 	%r8, %r9, %r5
	.word 0xb6420009  ! 324: ADDC_R	addc 	%r8, %r9, %r27
	.word 0x8f643801  ! 324: MOVcc_I	<illegal instruction>
	.word 0xb6022478  ! 324: ADD_I	add 	%r8, 0x0478, %r27
	.word 0x8e0a2030  ! 324: AND_I	and 	%r8, 0x0030, %r7
	.word 0xc8220009  ! 329: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xe24a0009  ! 329: LDSB_R	ldsb	[%r8 + %r9], %r17
	.word 0xaaa20009  ! 329: SUBcc_R	subcc 	%r8, %r9, %r21
	.word 0xb2fa0009  ! 329: SDIVcc_R	sdivcc 	%r8, %r9, %r25
	.word 0xce320009  ! 334: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xcd020009  ! 334: LDF_R	ld	[%r8, %r9], %f6
	.word 0x86f20009  ! 334: UDIVcc_R	udivcc 	%r8, %r9, %r3
	.word 0x876a0009  ! 334: SDIVX_R	sdivx	%r8, %r9, %r3
	.word 0xcf3a0009  ! 338: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc71a0009  ! 338: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0x8a720009  ! 338: UDIV_R	udiv 	%r8, %r9, %r5
	.word 0x886a0009  ! 338: UDIVX_R	udivx 	%r8, %r9, %r4
	.word 0x2e800001  ! 342: BVS	bvs,a	<label_0x1>
	.word 0xb07223f0  ! 342: UDIV_I	udiv 	%r8, 0x03f0, %r24
	.word 0xcf3a0009  ! 346: STDF_R	std	%f7, [%r9, %r8]
	.word 0xce0a0009  ! 346: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0x8a7a21a8  ! 346: SDIV_I	sdiv 	%r8, 0x01a8, %r5
	.word 0x846a0009  ! 346: UDIVX_R	udivx 	%r8, %r9, %r2
	.word 0x30800002  ! 348: BA	ba,a	<label_0x2>
	.word 0x82fa2fb8  ! 348: SDIVcc_I	sdivcc 	%r8, 0x0fb8, %r1
	.word 0xf82a0009  ! 352: STB_R	stb	%r28, [%r8 + %r9]
	.word 0xc44a0009  ! 352: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0x8e6a2064  ! 352: UDIVX_I	udivx 	%r8, 0x0064, %r7
	.word 0x82f20009  ! 352: UDIVcc_R	udivcc 	%r8, %r9, %r1
	.word 0x18800002  ! 354: BGU	bgu  	<label_0x2>
	.word 0x86f20009  ! 354: UDIVcc_R	udivcc 	%r8, %r9, %r3
	.word 0x18800002  ! 357: BGU	bgu  	<label_0x2>
	.word 0xa66a206c  ! 357: UDIVX_I	udivx 	%r8, 0x006c, %r19
	.word 0xdc220009  ! 361: STW_R	stw	%r14, [%r8 + %r9]
	.word 0xc7020009  ! 361: LDF_R	ld	[%r8, %r9], %f3
	.word 0xca4a0009  ! 361: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0x8c7a24f0  ! 361: SDIV_I	sdiv 	%r8, 0x04f0, %r6
	.word 0x832a0009  ! 362: SLL_R	sll 	%r8, %r9, %r1
	.word 0x8f3a1009  ! 362: SRAX_R	srax	%r8, %r9, %r7
	.word 0x9eb20009  ! 362: SUBCcc_R	orncc 	%r8, %r9, %r15
	.word 0xa0120009  ! 362: OR_R	or 	%r8, %r9, %r16
	.word 0x883a0009  ! 362: XNOR_R	xnor 	%r8, %r9, %r4
	.word 0xac0a2044  ! 362: AND_I	and 	%r8, 0x0044, %r22
	.word 0x882a227c  ! 362: ANDN_I	andn 	%r8, 0x027c, %r4
	.word 0x8c4224b0  ! 362: ADDC_I	addc 	%r8, 0x04b0, %r6
	.word 0x880a20b4  ! 362: AND_I	and 	%r8, 0x00b4, %r4
	.word 0xb00a0009  ! 362: AND_R	and 	%r8, %r9, %r24
	.word 0xa81a2e6c  ! 362: XOR_I	xor 	%r8, 0x0e6c, %r20
	.word 0x0cc20001  ! 364: BRGZ	brgz  ,nt	%8,<label_0x20001>
	.word 0x866a26bc  ! 364: UDIVX_I	udivx 	%r8, 0x06bc, %r3
	.word 0x9f321009  ! 365: SRLX_R	srlx	%r8, %r9, %r15
	.word 0xac3a0009  ! 365: XNOR_R	xnor 	%r8, %r9, %r22
	.word 0x853a1009  ! 365: SRAX_R	srax	%r8, %r9, %r2
	.word 0x8d323001  ! 365: SRLX_I	srlx	%r8, 0x0001, %r6
	.word 0xac920009  ! 365: ORcc_R	orcc 	%r8, %r9, %r22
	.word 0x8b321009  ! 365: SRLX_R	srlx	%r8, %r9, %r5
	.word 0xa7320009  ! 365: SRL_R	srl 	%r8, %r9, %r19
	.word 0x820a0009  ! 365: AND_R	and 	%r8, %r9, %r1
	.word 0x860a239c  ! 365: AND_I	and 	%r8, 0x039c, %r3
	.word 0x82b20009  ! 365: SUBCcc_R	orncc 	%r8, %r9, %r1
	.word 0xa49a20cc  ! 365: XORcc_I	xorcc 	%r8, 0x00cc, %r18
	.word 0x8c0a0009  ! 365: AND_R	and 	%r8, %r9, %r6
	.word 0x9a3227c8  ! 366: SUBC_I	orn 	%r8, 0x07c8, %r13
	.word 0x82420009  ! 366: ADDC_R	addc 	%r8, %r9, %r1
	.word 0x88b20009  ! 366: ORNcc_R	orncc 	%r8, %r9, %r4
	.word 0x84820009  ! 366: ADDcc_R	addcc 	%r8, %r9, %r2
	.word 0x82aa0009  ! 366: ANDNcc_R	andncc 	%r8, %r9, %r1
	.word 0x82ba0009  ! 366: XNORcc_R	xnorcc 	%r8, %r9, %r1
	.word 0xa03a23a0  ! 366: XNOR_I	xnor 	%r8, 0x03a0, %r16
	.word 0x82022624  ! 366: ADD_I	add 	%r8, 0x0624, %r1
	.word 0x822a0009  ! 366: ANDN_R	andn 	%r8, %r9, %r1
	.word 0x84b22940  ! 366: SUBCcc_I	orncc 	%r8, 0x0940, %r2
	.word 0xb2b22060  ! 366: ORNcc_I	orncc 	%r8, 0x0060, %r25
	.word 0xa4b22fa0  ! 366: ORNcc_I	orncc 	%r8, 0x0fa0, %r18
	.word 0xba822564  ! 366: ADDcc_I	addcc 	%r8, 0x0564, %r29
	.word 0xa0ba0009  ! 366: XNORcc_R	xnorcc 	%r8, %r9, %r16
	.word 0x833a3001  ! 366: SRAX_I	srax	%r8, 0x0001, %r1
	.word 0x2e800001  ! 369: BVS	bvs,a	<label_0x1>
	.word 0xaef227b0  ! 369: UDIVcc_I	udivcc 	%r8, 0x07b0, %r23
	.word 0xc8220009  ! 373: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc40a0009  ! 373: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xbd6a23d4  ! 373: SDIVX_I	sdivx	%r8, 0x03d4, %r30
	.word 0x8e7a2998  ! 373: SDIV_I	sdiv 	%r8, 0x0998, %r7
	.word 0xfc220009  ! 377: STW_R	stw	%r30, [%r8 + %r9]
	.word 0xf3020009  ! 377: LDF_R	ld	[%r8, %r9], %f25
	.word 0x896a0009  ! 377: SDIVX_R	sdivx	%r8, %r9, %r4
	.word 0x84f20009  ! 377: UDIVcc_R	udivcc 	%r8, %r9, %r2
	.word 0xa2920009  ! 378: ORcc_R	orcc 	%r8, %r9, %r17
	.word 0x87641809  ! 378: MOVcc_R	<illegal instruction>
	.word 0x8e0229b4  ! 378: ADD_I	add 	%r8, 0x09b4, %r7
	.word 0x85780409  ! 378: MOVR_R	move	%r0, %r9, %r2
	.word 0xa8822798  ! 378: ADDcc_I	addcc 	%r8, 0x0798, %r20
	.word 0xb52a3001  ! 378: SLLX_I	sllx	%r8, 0x0001, %r26
	.word 0x881220d8  ! 378: OR_I	or 	%r8, 0x00d8, %r4
	.word 0x8eb20009  ! 378: SUBCcc_R	orncc 	%r8, %r9, %r7
	.word 0x952a1009  ! 378: SLLX_R	sllx	%r8, %r9, %r10
	.word 0x8c3a0009  ! 378: XNOR_R	xnor 	%r8, %r9, %r6
	.word 0x88122600  ! 378: OR_I	or 	%r8, 0x0600, %r4
	.word 0x8ab22fe4  ! 378: ORNcc_I	orncc 	%r8, 0x0fe4, %r5
	.word 0x860a2b78  ! 378: AND_I	and 	%r8, 0x0b78, %r3
	.word 0x32800002  ! 382: BNE	bne,a	<label_0x2>
	.word 0x8c7a2710  ! 382: SDIV_I	sdiv 	%r8, 0x0710, %r6
	.word 0x00800001  ! 384: BN	bn  	<label_0x1>
	.word 0x8cfa2b50  ! 384: SDIVcc_I	sdivcc 	%r8, 0x0b50, %r6
	.word 0x8eba2350  ! 385: XNORcc_I	xnorcc 	%r8, 0x0350, %r7
	.word 0x8cb22804  ! 385: SUBCcc_I	orncc 	%r8, 0x0804, %r6
	.word 0x87643801  ! 385: MOVcc_I	<illegal instruction>
	.word 0x84222e70  ! 385: SUB_I	sub 	%r8, 0x0e70, %r2
	.word 0x8d641809  ! 385: MOVcc_R	<illegal instruction>
	.word 0x961a2754  ! 385: XOR_I	xor 	%r8, 0x0754, %r11
	.word 0xb9322001  ! 385: SRL_I	srl 	%r8, 0x0001, %r28
	.word 0x98a20009  ! 385: SUBcc_R	subcc 	%r8, %r9, %r12
	.word 0xba8a2998  ! 385: ANDcc_I	andcc 	%r8, 0x0998, %r29
	.word 0xa5641809  ! 385: MOVcc_R	<illegal instruction>
	.word 0x861221ac  ! 385: OR_I	or 	%r8, 0x01ac, %r3
	.word 0x89323001  ! 385: SRLX_I	srlx	%r8, 0x0001, %r4
	.word 0x8d320009  ! 385: SRL_R	srl 	%r8, %r9, %r6
	.word 0x862a2368  ! 385: ANDN_I	andn 	%r8, 0x0368, %r3
	.word 0xce320009  ! 389: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xd45a0009  ! 389: LDX_R	ldx	[%r8 + %r9], %r10
	.word 0xce122498  ! 389: LDUH_I	lduh	[%r8 + 0x0498], %r7
	.word 0x8efa24c8  ! 389: SDIVcc_I	sdivcc 	%r8, 0x04c8, %r7
	.word 0x3c800002  ! 393: BPOS	bpos,a	<label_0x2>
	.word 0x8e720009  ! 393: UDIV_R	udiv 	%r8, %r9, %r7
	.word 0x16800001  ! 397: BGE	bge  	<label_0x1>
	.word 0x82fa0009  ! 397: SDIVcc_R	sdivcc 	%r8, %r9, %r1
	.word 0xca2a0009  ! 402: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xf91a0009  ! 402: LDDF_R	ldd	[%r8, %r9], %f28
	.word 0xa06a0009  ! 402: UDIVX_R	udivx 	%r8, %r9, %r16
	.word 0x847a2668  ! 402: SDIV_I	sdiv 	%r8, 0x0668, %r2
	.word 0x22c20001  ! 408: BRZ	brz,a,nt	%8,<label_0x20001>
	.word 0x86f20009  ! 408: UDIVcc_R	udivcc 	%r8, %r9, %r3
	.word 0xc8220009  ! 412: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xf65a0009  ! 412: LDX_R	ldx	[%r8 + %r9], %r27
	.word 0x8cb20009  ! 412: SUBCcc_R	orncc 	%r8, %r9, %r6
	.word 0xa4f20009  ! 412: UDIVcc_R	udivcc 	%r8, %r9, %r18
	.word 0x8e0a0009  ! 417: AND_R	and 	%r8, %r9, %r7
	.word 0x843a0009  ! 417: XNOR_R	xnor 	%r8, %r9, %r2
	.word 0x892a3001  ! 417: SLLX_I	sllx	%r8, 0x0001, %r4
	.word 0x8d2a1009  ! 417: SLLX_R	sllx	%r8, %r9, %r6
	.word 0xa5780409  ! 417: MOVR_R	move	%r0, %r9, %r18
	.word 0x881a0009  ! 417: XOR_R	xor 	%r8, %r9, %r4
	.word 0xbab20009  ! 417: SUBCcc_R	orncc 	%r8, %r9, %r29
	.word 0x86b20009  ! 417: ORNcc_R	orncc 	%r8, %r9, %r3
	.word 0x822a0009  ! 417: ANDN_R	andn 	%r8, %r9, %r1
	.word 0x83643801  ! 417: MOVcc_I	<illegal instruction>
	.word 0xb5323001  ! 417: SRLX_I	srlx	%r8, 0x0001, %r26
	.word 0x83780409  ! 417: MOVR_R	move	%r0, %r9, %r1
	.word 0xaf2a2001  ! 417: SLL_I	sll 	%r8, 0x0001, %r23
	.word 0xc6720009  ! 421: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xed020009  ! 421: LDF_R	ld	[%r8, %r9], %f22
	.word 0x846a2bb4  ! 421: UDIVX_I	udivx 	%r8, 0x0bb4, %r2
	.word 0x887a0009  ! 421: SDIV_R	sdiv 	%r8, %r9, %r4
	.word 0x8aba0009  ! 422: XNORcc_R	xnorcc 	%r8, %r9, %r5
	.word 0x840a2e7c  ! 422: AND_I	and 	%r8, 0x0e7c, %r2
	.word 0x82ba2a58  ! 422: XNORcc_I	xnorcc 	%r8, 0x0a58, %r1
	.word 0x85641809  ! 422: MOVcc_R	<illegal instruction>
	.word 0x8c9a0009  ! 422: XORcc_R	xorcc 	%r8, %r9, %r6
	.word 0x8a020009  ! 422: ADD_R	add 	%r8, %r9, %r5
	.word 0xa0322620  ! 422: SUBC_I	orn 	%r8, 0x0620, %r16
	.word 0x960a2628  ! 422: AND_I	and 	%r8, 0x0628, %r11
	.word 0x9e120009  ! 422: OR_R	or 	%r8, %r9, %r15
	.word 0x8e1a0009  ! 422: XOR_R	xor 	%r8, %r9, %r7
	.word 0x8a1a2e4c  ! 422: XOR_I	xor 	%r8, 0x0e4c, %r5
	.word 0x829a2344  ! 422: XORcc_I	xorcc 	%r8, 0x0344, %r1
	.word 0x88220009  ! 422: SUB_R	sub 	%r8, %r9, %r4
	.word 0x85321009  ! 422: SRLX_R	srlx	%r8, %r9, %r2
	.word 0xc6220009  ! 426: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xfc120009  ! 426: LDUH_R	lduh	[%r8 + %r9], %r30
	.word 0x98fa0009  ! 426: SDIVcc_R	sdivcc 	%r8, %r9, %r12
	.word 0xbcfa0009  ! 426: SDIVcc_R	sdivcc 	%r8, %r9, %r30
	.word 0xc62a0009  ! 430: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc81a0009  ! 430: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x94f22960  ! 430: UDIVcc_I	udivcc 	%r8, 0x0960, %r10
	.word 0x8cf22884  ! 430: UDIVcc_I	udivcc 	%r8, 0x0884, %r6
	.word 0xc8720009  ! 434: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xe9020009  ! 434: LDF_R	ld	[%r8, %r9], %f20
	.word 0xc89a1009  ! 434: LDDA_R	ldda	[%r8, %r9] 0x80, %r4
	.word 0x82fa0009  ! 434: SDIVcc_R	sdivcc 	%r8, %r9, %r1
	.word 0x8d3a3001  ! 435: SRAX_I	srax	%r8, 0x0001, %r6
	.word 0x9b323001  ! 435: SRLX_I	srlx	%r8, 0x0001, %r13
	.word 0x8e922080  ! 435: ORcc_I	orcc 	%r8, 0x0080, %r7
	.word 0x960a2fc8  ! 435: AND_I	and 	%r8, 0x0fc8, %r11
	.word 0x8c1a0009  ! 435: XOR_R	xor 	%r8, %r9, %r6
	.word 0xa9643801  ! 435: MOVcc_I	<illegal instruction>
	.word 0x8aaa2d0c  ! 435: ANDNcc_I	andncc 	%r8, 0x0d0c, %r5
	.word 0x84b20009  ! 435: SUBCcc_R	orncc 	%r8, %r9, %r2
	.word 0x8aba2e44  ! 435: XNORcc_I	xnorcc 	%r8, 0x0e44, %r5
	.word 0xb612234c  ! 435: OR_I	or 	%r8, 0x034c, %r27
	.word 0xd42a0009  ! 439: STB_R	stb	%r10, [%r8 + %r9]
	.word 0xc8020009  ! 439: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0x8cf2271c  ! 439: UDIVcc_I	udivcc 	%r8, 0x071c, %r6
	.word 0x8c7a0009  ! 439: SDIV_R	sdiv 	%r8, %r9, %r6
	.word 0x8a02276c  ! 440: ADD_I	add 	%r8, 0x076c, %r5
	.word 0xb6ba2d1c  ! 440: XNORcc_I	xnorcc 	%r8, 0x0d1c, %r27
	.word 0x8a1a2f18  ! 440: XOR_I	xor 	%r8, 0x0f18, %r5
	.word 0x82320009  ! 440: ORN_R	orn 	%r8, %r9, %r1
	.word 0x8f3a1009  ! 440: SRAX_R	srax	%r8, %r9, %r7
	.word 0x862a0009  ! 440: ANDN_R	andn 	%r8, %r9, %r3
	.word 0x993a3001  ! 440: SRAX_I	srax	%r8, 0x0001, %r12
	.word 0x8c920009  ! 440: ORcc_R	orcc 	%r8, %r9, %r6
	.word 0xb08a0009  ! 440: ANDcc_R	andcc 	%r8, %r9, %r24
	.word 0xa7323001  ! 440: SRLX_I	srlx	%r8, 0x0001, %r19
	.word 0x880a0009  ! 440: AND_R	and 	%r8, %r9, %r4
	.word 0x88aa0009  ! 440: ANDNcc_R	andncc 	%r8, %r9, %r4
	.word 0xb40a2b24  ! 441: AND_I	and 	%r8, 0x0b24, %r26
	.word 0x82222bcc  ! 441: SUB_I	sub 	%r8, 0x0bcc, %r1
	.word 0x86122af0  ! 441: OR_I	or 	%r8, 0x0af0, %r3
	.word 0x89323001  ! 441: SRLX_I	srlx	%r8, 0x0001, %r4
	.word 0x840a0009  ! 441: AND_R	and 	%r8, %r9, %r2
	.word 0x88ba0009  ! 441: XNORcc_R	xnorcc 	%r8, %r9, %r4
	.word 0x869a0009  ! 441: XORcc_R	xorcc 	%r8, %r9, %r3
	.word 0x849a2070  ! 441: XORcc_I	xorcc 	%r8, 0x0070, %r2
	.word 0xbd3a0009  ! 441: SRA_R	sra 	%r8, %r9, %r30
	.word 0xb81a20fc  ! 441: XOR_I	xor 	%r8, 0x00fc, %r28
	.word 0xa8ba0009  ! 441: XNORcc_R	xnorcc 	%r8, %r9, %r20
	.word 0x863a0009  ! 441: XNOR_R	xnor 	%r8, %r9, %r3
	.word 0xcc2a0009  ! 445: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc8020009  ! 445: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xb4f22090  ! 445: UDIVcc_I	udivcc 	%r8, 0x0090, %r26
	.word 0x847a2d30  ! 445: SDIV_I	sdiv 	%r8, 0x0d30, %r2
	.word 0x34800001  ! 447: BG	bg,a	<label_0x1>
	.word 0x9e720009  ! 447: UDIV_R	udiv 	%r8, %r9, %r15
	.word 0x82b22104  ! 448: ORNcc_I	orncc 	%r8, 0x0104, %r1
	.word 0x8c320009  ! 448: ORN_R	orn 	%r8, %r9, %r6
	.word 0x881a2764  ! 448: XOR_I	xor 	%r8, 0x0764, %r4
	.word 0xb2b20009  ! 448: SUBCcc_R	orncc 	%r8, %r9, %r25
	.word 0xbe322bdc  ! 448: ORN_I	orn 	%r8, 0x0bdc, %r31
	.word 0x8f2a1009  ! 448: SLLX_R	sllx	%r8, %r9, %r7
	.word 0xa32a0009  ! 448: SLL_R	sll 	%r8, %r9, %r17
	.word 0x9cb22888  ! 448: ORNcc_I	orncc 	%r8, 0x0888, %r14
	.word 0x84b228c4  ! 448: ORNcc_I	orncc 	%r8, 0x08c4, %r2
	.word 0xa61a278c  ! 448: XOR_I	xor 	%r8, 0x078c, %r19
	.word 0x84022fb8  ! 448: ADD_I	add 	%r8, 0x0fb8, %r2
	.word 0x8e2a0009  ! 448: ANDN_R	andn 	%r8, %r9, %r7
	.word 0xae822ac0  ! 448: ADDcc_I	addcc 	%r8, 0x0ac0, %r23
	.word 0x8a9a0009  ! 448: XORcc_R	xorcc 	%r8, %r9, %r5
	.word 0x8c8a29d8  ! 449: ANDcc_I	andcc 	%r8, 0x09d8, %r6
	.word 0x88820009  ! 449: ADDcc_R	addcc 	%r8, %r9, %r4
	.word 0x84b20009  ! 449: SUBCcc_R	orncc 	%r8, %r9, %r2
	.word 0x9d3a0009  ! 449: SRA_R	sra 	%r8, %r9, %r14
	.word 0x8f322001  ! 449: SRL_I	srl 	%r8, 0x0001, %r7
	.word 0x8e3a0009  ! 449: XNOR_R	xnor 	%r8, %r9, %r7
	.word 0xa68a0009  ! 449: ANDcc_R	andcc 	%r8, %r9, %r19
	.word 0x86ba0009  ! 449: XNORcc_R	xnorcc 	%r8, %r9, %r3
	.word 0x82ba0009  ! 449: XNORcc_R	xnorcc 	%r8, %r9, %r1
	.word 0xb0b20009  ! 449: SUBCcc_R	orncc 	%r8, %r9, %r24
	.word 0x88b20009  ! 449: SUBCcc_R	orncc 	%r8, %r9, %r4
	.word 0x821a2eb0  ! 449: XOR_I	xor 	%r8, 0x0eb0, %r1
	.word 0x8b643801  ! 449: MOVcc_I	<illegal instruction>
	.word 0xcc2a0009  ! 453: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc84a0009  ! 453: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0x8e9a2140  ! 453: XORcc_I	xorcc 	%r8, 0x0140, %r7
	.word 0x8efa2740  ! 453: SDIVcc_I	sdivcc 	%r8, 0x0740, %r7
	.word 0x2a800001  ! 455: BCS	bcs,a	<label_0x1>
	.word 0x8b6a0009  ! 455: SDIVX_R	sdivx	%r8, %r9, %r5
	.word 0xc6220009  ! 462: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xe01a0009  ! 462: LDD_R	ldd	[%r8 + %r9], %r16
	.word 0x85643801  ! 462: MOVcc_I	<illegal instruction>
	.word 0x88822c88  ! 462: ADDcc_I	addcc 	%r8, 0x0c88, %r4
	.word 0x87780409  ! 462: MOVR_R	move	%r0, %r9, %r3
	.word 0x8efa0009  ! 462: SDIVcc_R	sdivcc 	%r8, %r9, %r7
	.word 0xa84226d8  ! 464: ADDC_I	addc 	%r8, 0x06d8, %r20
	.word 0xb4c20009  ! 464: ADDCcc_R	addccc 	%r8, %r9, %r26
	.word 0x96a20009  ! 464: SUBcc_R	subcc 	%r8, %r9, %r11
	.word 0xa68a2fd4  ! 464: ANDcc_I	andcc 	%r8, 0x0fd4, %r19
	.word 0x88920009  ! 464: ORcc_R	orcc 	%r8, %r9, %r4
	.word 0xa6222228  ! 464: SUB_I	sub 	%r8, 0x0228, %r19
	.word 0xa5322001  ! 464: SRL_I	srl 	%r8, 0x0001, %r18
	.word 0x873a0009  ! 464: SRA_R	sra 	%r8, %r9, %r3
	.word 0x8a322d78  ! 464: ORN_I	orn 	%r8, 0x0d78, %r5
	.word 0x8d3a2001  ! 464: SRA_I	sra 	%r8, 0x0001, %r6
	.word 0x8e920009  ! 464: ORcc_R	orcc 	%r8, %r9, %r7
	.word 0x8eba2498  ! 464: XNORcc_I	xnorcc 	%r8, 0x0498, %r7
	.word 0x82a20009  ! 464: SUBcc_R	subcc 	%r8, %r9, %r1
	.word 0x0e800001  ! 466: BVS	bvs  	<label_0x1>
	.word 0x8ef20009  ! 466: UDIVcc_R	udivcc 	%r8, %r9, %r7
	.word 0xc4320009  ! 470: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xce520009  ! 470: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0x84720009  ! 470: UDIV_R	udiv 	%r8, %r9, %r2
	.word 0x826a2ba4  ! 470: UDIVX_I	udivx 	%r8, 0x0ba4, %r1
	.word 0xca220009  ! 479: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xcb020009  ! 479: LDF_R	ld	[%r8, %r9], %f5
	.word 0xa66a2788  ! 479: UDIVX_I	udivx 	%r8, 0x0788, %r19
	.word 0x84fa0009  ! 479: SDIVcc_R	sdivcc 	%r8, %r9, %r2
	.word 0xe0720009  ! 483: STX_R	stx	%r16, [%r8 + %r9]
	.word 0xfc0a0009  ! 483: LDUB_R	ldub	[%r8 + %r9], %r30
	.word 0x8e722138  ! 483: UDIV_I	udiv 	%r8, 0x0138, %r7
	.word 0xaefa0009  ! 483: SDIVcc_R	sdivcc 	%r8, %r9, %r23
	.word 0xca2a0009  ! 488: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xca0a0009  ! 488: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0x8c722bc8  ! 488: UDIV_I	udiv 	%r8, 0x0bc8, %r6
	.word 0x886a2cd8  ! 488: UDIVX_I	udivx 	%r8, 0x0cd8, %r4
	.word 0xed220009  ! 492: STF_R	st	%f22, [%r9, %r8]
	.word 0xca0a0009  ! 492: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0x893a0009  ! 492: SRA_R	sra 	%r8, %r9, %r4
	.word 0xac7a22bc  ! 492: SDIV_I	sdiv 	%r8, 0x02bc, %r22
	.word 0x2e800001  ! 494: BVS	bvs,a	<label_0x1>
	.word 0x8e6a0009  ! 494: UDIVX_R	udivx 	%r8, %r9, %r7
	.word 0x04c20001  ! 496: BRLEZ	brlez  ,nt	%8,<label_0x20001>
	.word 0xb6f227d8  ! 496: UDIVcc_I	udivcc 	%r8, 0x07d8, %r27
	.word 0x9b643801  ! 498: MOVcc_I	<illegal instruction>
	.word 0x849a27a8  ! 498: XORcc_I	xorcc 	%r8, 0x07a8, %r2
	.word 0x8b780409  ! 498: MOVR_R	move	%r0, %r9, %r5
	.word 0x88a20009  ! 498: SUBcc_R	subcc 	%r8, %r9, %r4
	.word 0x852a2001  ! 498: SLL_I	sll 	%r8, 0x0001, %r2
	.word 0x82b22148  ! 498: ORNcc_I	orncc 	%r8, 0x0148, %r1
	.word 0x843a0009  ! 498: XNOR_R	xnor 	%r8, %r9, %r2
	.word 0x88ba2950  ! 498: XNORcc_I	xnorcc 	%r8, 0x0950, %r4
	.word 0x84122fdc  ! 498: OR_I	or 	%r8, 0x0fdc, %r2
	.word 0xb62a2198  ! 498: ANDN_I	andn 	%r8, 0x0198, %r27
	.word 0x844221b0  ! 498: ADDC_I	addc 	%r8, 0x01b0, %r2
	.word 0x8a220009  ! 500: SUB_R	sub 	%r8, %r9, %r5
	.word 0xb53a2001  ! 500: SRA_I	sra 	%r8, 0x0001, %r26
	.word 0x9f320009  ! 500: SRL_R	srl 	%r8, %r9, %r15
	.word 0x88920009  ! 500: ORcc_R	orcc 	%r8, %r9, %r4
	.word 0x88320009  ! 500: ORN_R	orn 	%r8, %r9, %r4
	.word 0x872a1009  ! 500: SLLX_R	sllx	%r8, %r9, %r3
	.word 0x8aa20009  ! 500: SUBcc_R	subcc 	%r8, %r9, %r5
	.word 0x8aaa29d4  ! 500: ANDNcc_I	andncc 	%r8, 0x09d4, %r5
	.word 0xbcc22134  ! 500: ADDCcc_I	addccc 	%r8, 0x0134, %r30
	.word 0x8a8a2770  ! 500: ANDcc_I	andcc 	%r8, 0x0770, %r5
	.word 0x86122930  ! 500: OR_I	or 	%r8, 0x0930, %r3
	.word 0x8ac22154  ! 500: ADDCcc_I	addccc 	%r8, 0x0154, %r5
	.word 0xab3a1009  ! 502: SRAX_R	srax	%r8, %r9, %r21
	.word 0x88322dd8  ! 502: SUBC_I	orn 	%r8, 0x0dd8, %r4
	.word 0x89782401  ! 502: MOVR_I	move	%r0, 0xdd8, %r4
	.word 0x892a3001  ! 502: SLLX_I	sllx	%r8, 0x0001, %r4
	.word 0x87780409  ! 502: MOVR_R	move	%r0, %r9, %r3
	.word 0xbb323001  ! 502: SRLX_I	srlx	%r8, 0x0001, %r29
	.word 0x83323001  ! 502: SRLX_I	srlx	%r8, 0x0001, %r1
	.word 0x8d2a1009  ! 502: SLLX_R	sllx	%r8, %r9, %r6
	.word 0xb0222820  ! 502: SUB_I	sub 	%r8, 0x0820, %r24
	.word 0x8eb2283c  ! 502: SUBCcc_I	orncc 	%r8, 0x083c, %r7
	.word 0xaa920009  ! 502: ORcc_R	orcc 	%r8, %r9, %r21
	.word 0xa33a0009  ! 502: SRA_R	sra 	%r8, %r9, %r17
	.word 0xab322001  ! 502: SRL_I	srl 	%r8, 0x0001, %r21
	.word 0x8cc224c4  ! 502: ADDCcc_I	addccc 	%r8, 0x04c4, %r6
	.word 0x86a22d0c  ! 502: SUBcc_I	subcc 	%r8, 0x0d0c, %r3
	.word 0x40000002  ! 505: CALL	call	disp30_2
	.word 0xbb6a0009  ! 505: SDIVX_R	sdivx	%r8, %r9, %r29
	.word 0xbaaa2ba4  ! 506: ANDNcc_I	andncc 	%r8, 0x0ba4, %r29
	.word 0x892a1009  ! 506: SLLX_R	sllx	%r8, %r9, %r4
	.word 0x8e0a0009  ! 506: AND_R	and 	%r8, %r9, %r7
	.word 0x84a2297c  ! 506: SUBcc_I	subcc 	%r8, 0x097c, %r2
	.word 0x8ab20009  ! 506: ORNcc_R	orncc 	%r8, %r9, %r5
	.word 0x87780409  ! 506: MOVR_R	move	%r0, %r9, %r3
	.word 0x88120009  ! 506: OR_R	or 	%r8, %r9, %r4
	.word 0x8f2a3001  ! 506: SLLX_I	sllx	%r8, 0x0001, %r7
	.word 0xb72a0009  ! 506: SLL_R	sll 	%r8, %r9, %r27
	.word 0x83322001  ! 506: SRL_I	srl 	%r8, 0x0001, %r1
	.word 0x86320009  ! 506: SUBC_R	orn 	%r8, %r9, %r3
	.word 0x86420009  ! 506: ADDC_R	addc 	%r8, %r9, %r3
	.word 0xb23a0009  ! 506: XNOR_R	xnor 	%r8, %r9, %r25
	.word 0x841a2bb0  ! 506: XOR_I	xor 	%r8, 0x0bb0, %r2
	.word 0xba422c40  ! 506: ADDC_I	addc 	%r8, 0x0c40, %r29
	.word 0xce2a0009  ! 511: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc64a0009  ! 511: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0x8c720009  ! 511: UDIV_R	udiv 	%r8, %r9, %r6
	.word 0x826a0009  ! 511: UDIVX_R	udivx 	%r8, %r9, %r1
	.word 0x40000001  ! 517: CALL	call	disp30_1
	.word 0x856a244c  ! 517: SDIVX_I	sdivx	%r8, 0x044c, %r2
	.word 0xe6220009  ! 522: STW_R	stw	%r19, [%r8 + %r9]
	.word 0xc2020009  ! 522: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xa93a0009  ! 522: SRA_R	sra 	%r8, %r9, %r20
	.word 0x8d6a26fc  ! 522: SDIVX_I	sdivx	%r8, 0x06fc, %r6
	.word 0xca720009  ! 526: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc64a0009  ! 526: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xcaca24ac  ! 526: LDSBA_I	ldsba	[%r8, + 0x04ac] %asi, %r5
	.word 0xbcfa0009  ! 526: SDIVcc_R	sdivcc 	%r8, %r9, %r30
	.word 0x40000002  ! 535: CALL	call	disp30_2
	.word 0xbaf229cc  ! 535: UDIVcc_I	udivcc 	%r8, 0x09cc, %r29
	.word 0xaeaa0009  ! 536: ANDNcc_R	andncc 	%r8, %r9, %r23
	.word 0x84ba288c  ! 536: XNORcc_I	xnorcc 	%r8, 0x088c, %r2
	.word 0x8d2a0009  ! 536: SLL_R	sll 	%r8, %r9, %r6
	.word 0x8f323001  ! 536: SRLX_I	srlx	%r8, 0x0001, %r7
	.word 0x8a422768  ! 536: ADDC_I	addc 	%r8, 0x0768, %r5
	.word 0x8e8a22ec  ! 536: ANDcc_I	andcc 	%r8, 0x02ec, %r7
	.word 0x97323001  ! 536: SRLX_I	srlx	%r8, 0x0001, %r11
	.word 0x833a3001  ! 536: SRAX_I	srax	%r8, 0x0001, %r1
	.word 0x860228c8  ! 536: ADD_I	add 	%r8, 0x08c8, %r3
	.word 0xbf643801  ! 536: MOVcc_I	<illegal instruction>
	.word 0x889a22c0  ! 536: XORcc_I	xorcc 	%r8, 0x02c0, %r4
	.word 0xbcba0009  ! 536: XNORcc_R	xnorcc 	%r8, %r9, %r30
	.word 0x8eaa0009  ! 536: ANDNcc_R	andncc 	%r8, %r9, %r7
	.word 0x86322f24  ! 536: ORN_I	orn 	%r8, 0x0f24, %r3
	.word 0x8b323001  ! 536: SRLX_I	srlx	%r8, 0x0001, %r5
	.word 0xc22a0009  ! 543: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc85a0009  ! 543: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0x88fa0009  ! 543: SDIVcc_R	sdivcc 	%r8, %r9, %r4
	.word 0x8a6a2f90  ! 543: UDIVX_I	udivx 	%r8, 0x0f90, %r5
	.word 0xee320009  ! 552: STH_R	sth	%r23, [%r8 + %r9]
	.word 0xfa4a0009  ! 552: LDSB_R	ldsb	[%r8 + %r9], %r29
	.word 0xf44a0009  ! 552: LDSB_R	ldsb	[%r8 + %r9], %r26
	.word 0x8f6a0009  ! 552: SDIVX_R	sdivx	%r8, %r9, %r7
	.word 0x24800002  ! 554: BLE	ble,a	<label_0x2>
	.word 0x8f6a24d0  ! 554: SDIVX_I	sdivx	%r8, 0x04d0, %r7
	.word 0xcc2a0009  ! 559: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xe81a0009  ! 559: LDD_R	ldd	[%r8 + %r9], %r20
	.word 0x9efa2dd0  ! 559: SDIVcc_I	sdivcc 	%r8, 0x0dd0, %r15
	.word 0x9e722d90  ! 559: UDIV_I	udiv 	%r8, 0x0d90, %r15
	.word 0x0eca0001  ! 563: BRGEZ	brgez  ,pt	%8,<label_0xa0001>
	.word 0x8e6a0009  ! 563: UDIVX_R	udivx 	%r8, %r9, %r7
	.word 0xc6220009  ! 568: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc01a0009  ! 568: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0x84120009  ! 568: OR_R	or 	%r8, %r9, %r2
	.word 0x9a720009  ! 568: UDIV_R	udiv 	%r8, %r9, %r13
	.word 0x22800001  ! 571: BE	be,a	<label_0x1>
	.word 0xbe7a0009  ! 571: SDIV_R	sdiv 	%r8, %r9, %r31
	.word 0x8a020009  ! 573: ADD_R	add 	%r8, %r9, %r5
	.word 0x8e220009  ! 573: SUB_R	sub 	%r8, %r9, %r7
	.word 0xac3a0009  ! 573: XNOR_R	xnor 	%r8, %r9, %r22
	.word 0x88820009  ! 573: ADDcc_R	addcc 	%r8, %r9, %r4
	.word 0x82aa269c  ! 573: ANDNcc_I	andncc 	%r8, 0x069c, %r1
	.word 0x94b20009  ! 573: SUBCcc_R	orncc 	%r8, %r9, %r10
	.word 0x8a92264c  ! 573: ORcc_I	orcc 	%r8, 0x064c, %r5
	.word 0x8f780409  ! 573: MOVR_R	move	%r0, %r9, %r7
	.word 0x86320009  ! 573: SUBC_R	orn 	%r8, %r9, %r3
	.word 0x8f3a3001  ! 573: SRAX_I	srax	%r8, 0x0001, %r7
	.word 0x8c1a2e70  ! 573: XOR_I	xor 	%r8, 0x0e70, %r6
	.word 0x8422270c  ! 573: SUB_I	sub 	%r8, 0x070c, %r2
	.word 0x98b221b8  ! 573: SUBCcc_I	orncc 	%r8, 0x01b8, %r12
	.word 0x8e2221c4  ! 573: SUB_I	sub 	%r8, 0x01c4, %r7
	.word 0xfc320009  ! 577: STH_R	sth	%r30, [%r8 + %r9]
	.word 0xc65a0009  ! 577: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xc40a0009  ! 577: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0x8efa0009  ! 577: SDIVcc_R	sdivcc 	%r8, %r9, %r7
	.word 0xf6320009  ! 581: STH_R	sth	%r27, [%r8 + %r9]
	.word 0xdc1a0009  ! 581: LDD_R	ldd	[%r8 + %r9], %r14
	.word 0xa06a0009  ! 581: UDIVX_R	udivx 	%r8, %r9, %r16
	.word 0xb0fa2d68  ! 581: SDIVcc_I	sdivcc 	%r8, 0x0d68, %r24
	.word 0xcc320009  ! 588: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xcc4a0009  ! 588: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0x9cf225fc  ! 588: UDIVcc_I	udivcc 	%r8, 0x05fc, %r14
	.word 0x94720009  ! 588: UDIV_R	udiv 	%r8, %r9, %r10
	.word 0x14800002  ! 590: BG	bg  	<label_0x2>
	.word 0x8afa0009  ! 590: SDIVcc_R	sdivcc 	%r8, %r9, %r5
	.word 0xc3220009  ! 594: STF_R	st	%f1, [%r9, %r8]
	.word 0xc6520009  ! 594: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0x8c7a0009  ! 594: SDIV_R	sdiv 	%r8, %r9, %r6
	.word 0x826a0009  ! 594: UDIVX_R	udivx 	%r8, %r9, %r1
	.word 0x8eaa2b54  ! 597: ANDNcc_I	andncc 	%r8, 0x0b54, %r7
	.word 0x8d320009  ! 597: SRL_R	srl 	%r8, %r9, %r6
	.word 0x8b3a0009  ! 597: SRA_R	sra 	%r8, %r9, %r5
	.word 0xbb323001  ! 597: SRLX_I	srlx	%r8, 0x0001, %r29
	.word 0x873a3001  ! 597: SRAX_I	srax	%r8, 0x0001, %r3
	.word 0xaac22cdc  ! 597: ADDCcc_I	addccc 	%r8, 0x0cdc, %r21
	.word 0x873a1009  ! 597: SRAX_R	srax	%r8, %r9, %r3
	.word 0x8cb20009  ! 597: SUBCcc_R	orncc 	%r8, %r9, %r6
	.word 0x881a2e10  ! 597: XOR_I	xor 	%r8, 0x0e10, %r4
	.word 0x829a27f0  ! 597: XORcc_I	xorcc 	%r8, 0x07f0, %r1
	.word 0x34800002  ! 600: BG	bg,a	<label_0x2>
	.word 0x827226d8  ! 600: UDIV_I	udiv 	%r8, 0x06d8, %r1
	.word 0xb0a20009  ! 603: SUBcc_R	subcc 	%r8, %r9, %r24
	.word 0x873a3001  ! 603: SRAX_I	srax	%r8, 0x0001, %r3
	.word 0x822a265c  ! 603: ANDN_I	andn 	%r8, 0x065c, %r1
	.word 0x8d641809  ! 603: MOVcc_R	<illegal instruction>
	.word 0x8e1a0009  ! 603: XOR_R	xor 	%r8, %r9, %r7
	.word 0x8ac20009  ! 603: ADDCcc_R	addccc 	%r8, %r9, %r5
	.word 0x8f780409  ! 603: MOVR_R	move	%r0, %r9, %r7
	.word 0x853a2001  ! 603: SRA_I	sra 	%r8, 0x0001, %r2
	.word 0x8ca22bc0  ! 603: SUBcc_I	subcc 	%r8, 0x0bc0, %r6
	.word 0x88b22d38  ! 603: SUBCcc_I	orncc 	%r8, 0x0d38, %r4
	.word 0x83641809  ! 603: MOVcc_R	<illegal instruction>
	.word 0x872a0009  ! 603: SLL_R	sll 	%r8, %r9, %r3
	.word 0x8cba0009  ! 604: XNORcc_R	xnorcc 	%r8, %r9, %r6
	.word 0xaab20009  ! 604: ORNcc_R	orncc 	%r8, %r9, %r21
	.word 0xb4aa2c04  ! 604: ANDNcc_I	andncc 	%r8, 0x0c04, %r26
	.word 0x86b20009  ! 604: ORNcc_R	orncc 	%r8, %r9, %r3
	.word 0x94c20009  ! 604: ADDCcc_R	addccc 	%r8, %r9, %r10
	.word 0xb28a2068  ! 604: ANDcc_I	andcc 	%r8, 0x0068, %r25
	.word 0x8d2a2001  ! 604: SLL_I	sll 	%r8, 0x0001, %r6
	.word 0x88ba2400  ! 604: XNORcc_I	xnorcc 	%r8, 0x0400, %r4
	.word 0x8c9a0009  ! 604: XORcc_R	xorcc 	%r8, %r9, %r6
	.word 0x84022de0  ! 604: ADD_I	add 	%r8, 0x0de0, %r2
	.word 0x8a020009  ! 604: ADD_R	add 	%r8, %r9, %r5
	.word 0x893a2001  ! 605: SRA_I	sra 	%r8, 0x0001, %r4
	.word 0x88920009  ! 605: ORcc_R	orcc 	%r8, %r9, %r4
	.word 0x86320009  ! 605: SUBC_R	orn 	%r8, %r9, %r3
	.word 0xa9641809  ! 605: MOVcc_R	<illegal instruction>
	.word 0xbc820009  ! 605: ADDcc_R	addcc 	%r8, %r9, %r30
	.word 0x8c0a2654  ! 605: AND_I	and 	%r8, 0x0654, %r6
	.word 0x82920009  ! 605: ORcc_R	orcc 	%r8, %r9, %r1
	.word 0x8eaa2254  ! 605: ANDNcc_I	andncc 	%r8, 0x0254, %r7
	.word 0x8aa20009  ! 605: SUBcc_R	subcc 	%r8, %r9, %r5
	.word 0x969a20e0  ! 605: XORcc_I	xorcc 	%r8, 0x00e0, %r11
	.word 0xa0b20009  ! 605: ORNcc_R	orncc 	%r8, %r9, %r16
	.word 0x8c8220cc  ! 605: ADDcc_I	addcc 	%r8, 0x00cc, %r6
	.word 0x8a120009  ! 605: OR_R	or 	%r8, %r9, %r5
	.word 0xc8220009  ! 609: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xcd1a0009  ! 609: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0x9afa0009  ! 609: SDIVcc_R	sdivcc 	%r8, %r9, %r13
	.word 0x9a722de0  ! 609: UDIV_I	udiv 	%r8, 0x0de0, %r13
	.word 0x2a800001  ! 613: BCS	bcs,a	<label_0x1>
	.word 0x9e7229e8  ! 613: UDIV_I	udiv 	%r8, 0x09e8, %r15
	.word 0x2cc20001  ! 617: BRGZ	brgz,a,nt	%8,<label_0x20001>
	.word 0xb2fa0009  ! 617: SDIVcc_R	sdivcc 	%r8, %r9, %r25
	.word 0x8d2a3001  ! 618: SLLX_I	sllx	%r8, 0x0001, %r6
	.word 0x8c122224  ! 618: OR_I	or 	%r8, 0x0224, %r6
	.word 0xbb323001  ! 618: SRLX_I	srlx	%r8, 0x0001, %r29
	.word 0x893a2001  ! 618: SRA_I	sra 	%r8, 0x0001, %r4
	.word 0x852a1009  ! 618: SLLX_R	sllx	%r8, %r9, %r2
	.word 0x820a0009  ! 618: AND_R	and 	%r8, %r9, %r1
	.word 0xae3a0009  ! 618: XNOR_R	xnor 	%r8, %r9, %r23
	.word 0x860223f4  ! 618: ADD_I	add 	%r8, 0x03f4, %r3
	.word 0x8f321009  ! 618: SRLX_R	srlx	%r8, %r9, %r7
	.word 0x84420009  ! 618: ADDC_R	addc 	%r8, %r9, %r2
	.word 0x88b20009  ! 618: ORNcc_R	orncc 	%r8, %r9, %r4
	.word 0x86ba25c0  ! 618: XNORcc_I	xnorcc 	%r8, 0x05c0, %r3
	.word 0x853a3001  ! 618: SRAX_I	srax	%r8, 0x0001, %r2
	.word 0x8a8a22a4  ! 624: ANDcc_I	andcc 	%r8, 0x02a4, %r5
	.word 0x86c22d48  ! 624: ADDCcc_I	addccc 	%r8, 0x0d48, %r3
	.word 0xab3a0009  ! 624: SRA_R	sra 	%r8, %r9, %r21
	.word 0x84b22198  ! 624: SUBCcc_I	orncc 	%r8, 0x0198, %r2
	.word 0xae1a0009  ! 624: XOR_R	xor 	%r8, %r9, %r23
	.word 0x8f782401  ! 624: MOVR_I	move	%r0, 0x9, %r7
	.word 0x88422328  ! 624: ADDC_I	addc 	%r8, 0x0328, %r4
	.word 0xa6c20009  ! 624: ADDCcc_R	addccc 	%r8, %r9, %r19
	.word 0x84aa0009  ! 624: ANDNcc_R	andncc 	%r8, %r9, %r2
	.word 0xac1229e8  ! 624: OR_I	or 	%r8, 0x09e8, %r22
	.word 0x8b3a3001  ! 624: SRAX_I	srax	%r8, 0x0001, %r5
	.word 0xb0020009  ! 624: ADD_R	add 	%r8, %r9, %r24
	.word 0x26800001  ! 626: BL	bl,a	<label_0x1>
	.word 0xbafa0009  ! 626: SDIVcc_R	sdivcc 	%r8, %r9, %r29
	.word 0xbc122ce0  ! 627: OR_I	or 	%r8, 0x0ce0, %r30
	.word 0x832a3001  ! 627: SLLX_I	sllx	%r8, 0x0001, %r1
	.word 0x8cc20009  ! 627: ADDCcc_R	addccc 	%r8, %r9, %r6
	.word 0x88120009  ! 627: OR_R	or 	%r8, %r9, %r4
	.word 0x8b3a3001  ! 627: SRAX_I	srax	%r8, 0x0001, %r5
	.word 0x84b20009  ! 627: ORNcc_R	orncc 	%r8, %r9, %r2
	.word 0xbc822520  ! 627: ADDcc_I	addcc 	%r8, 0x0520, %r30
	.word 0x8e9a2e40  ! 627: XORcc_I	xorcc 	%r8, 0x0e40, %r7
	.word 0x98820009  ! 627: ADDcc_R	addcc 	%r8, %r9, %r12
	.word 0x85323001  ! 627: SRLX_I	srlx	%r8, 0x0001, %r2
	.word 0x84122fa0  ! 627: OR_I	or 	%r8, 0x0fa0, %r2
	.word 0xa8820009  ! 627: ADDcc_R	addcc 	%r8, %r9, %r20
	.word 0x82b22954  ! 627: ORNcc_I	orncc 	%r8, 0x0954, %r1
	.word 0x88b20009  ! 627: ORNcc_R	orncc 	%r8, %r9, %r4
	.word 0x83320009  ! 627: SRL_R	srl 	%r8, %r9, %r1
	.word 0xc2720009  ! 631: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xf4120009  ! 631: LDUH_R	lduh	[%r8 + %r9], %r26
	.word 0x96f20009  ! 631: UDIVcc_R	udivcc 	%r8, %r9, %r11
	.word 0xb27224a4  ! 631: UDIV_I	udiv 	%r8, 0x04a4, %r25
	.word 0x82420009  ! 633: ADDC_R	addc 	%r8, %r9, %r1
	.word 0x832a0009  ! 633: SLL_R	sll 	%r8, %r9, %r1
	.word 0x852a1009  ! 633: SLLX_R	sllx	%r8, %r9, %r2
	.word 0x9f323001  ! 633: SRLX_I	srlx	%r8, 0x0001, %r15
	.word 0x88c20009  ! 633: ADDCcc_R	addccc 	%r8, %r9, %r4
	.word 0xa80a0009  ! 633: AND_R	and 	%r8, %r9, %r20
	.word 0xa4a228f0  ! 633: SUBcc_I	subcc 	%r8, 0x08f0, %r18
	.word 0xab3a3001  ! 633: SRAX_I	srax	%r8, 0x0001, %r21
	.word 0x82b20009  ! 633: SUBCcc_R	orncc 	%r8, %r9, %r1
	.word 0xaf2a1009  ! 633: SLLX_R	sllx	%r8, %r9, %r23
	.word 0x849a0009  ! 633: XORcc_R	xorcc 	%r8, %r9, %r2
	.word 0x8c120009  ! 633: OR_R	or 	%r8, %r9, %r6
	.word 0xc8220009  ! 641: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc2120009  ! 641: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xc8022240  ! 641: LDUW_I	lduw	[%r8 + 0x0240], %r4
	.word 0x86fa2224  ! 641: SDIVcc_I	sdivcc 	%r8, 0x0224, %r3
	.word 0x8c1a0009  ! 643: XOR_R	xor 	%r8, %r9, %r6
	.word 0x843225f4  ! 643: SUBC_I	orn 	%r8, 0x05f4, %r2
	.word 0x8f3a1009  ! 643: SRAX_R	srax	%r8, %r9, %r7
	.word 0xb61221d4  ! 643: OR_I	or 	%r8, 0x01d4, %r27
	.word 0x8f641809  ! 643: MOVcc_R	<illegal instruction>
	.word 0x83323001  ! 643: SRLX_I	srlx	%r8, 0x0001, %r1
	.word 0x8a2a2f4c  ! 643: ANDN_I	andn 	%r8, 0x0f4c, %r5
	.word 0x973a0009  ! 643: SRA_R	sra 	%r8, %r9, %r11
	.word 0x88822f3c  ! 643: ADDcc_I	addcc 	%r8, 0x0f3c, %r4
	.word 0x84c20009  ! 643: ADDCcc_R	addccc 	%r8, %r9, %r2
	.word 0x8c3223e0  ! 643: SUBC_I	orn 	%r8, 0x03e0, %r6
	.word 0xb68a0009  ! 643: ANDcc_R	andcc 	%r8, %r9, %r27
	.word 0xbe2a2c54  ! 643: ANDN_I	andn 	%r8, 0x0c54, %r31
	.word 0x8ea222b0  ! 643: SUBcc_I	subcc 	%r8, 0x02b0, %r7
	.word 0x8c9a24e0  ! 647: XORcc_I	xorcc 	%r8, 0x04e0, %r6
	.word 0x8ec22dd4  ! 647: ADDCcc_I	addccc 	%r8, 0x0dd4, %r7
	.word 0x82b20009  ! 647: SUBCcc_R	orncc 	%r8, %r9, %r1
	.word 0xb01a24a0  ! 647: XOR_I	xor 	%r8, 0x04a0, %r24
	.word 0x89321009  ! 647: SRLX_R	srlx	%r8, %r9, %r4
	.word 0x86120009  ! 647: OR_R	or 	%r8, %r9, %r3
	.word 0x983a2860  ! 647: XNOR_I	xnor 	%r8, 0x0860, %r12
	.word 0xaa1224bc  ! 647: OR_I	or 	%r8, 0x04bc, %r21
	.word 0x8e320009  ! 647: ORN_R	orn 	%r8, %r9, %r7
	.word 0xa69a0009  ! 647: XORcc_R	xorcc 	%r8, %r9, %r19
	.word 0x841a2a70  ! 647: XOR_I	xor 	%r8, 0x0a70, %r2
	.word 0x832a2001  ! 647: SLL_I	sll 	%r8, 0x0001, %r1
	.word 0xbea224c4  ! 647: SUBcc_I	subcc 	%r8, 0x04c4, %r31
	.word 0x861224a8  ! 647: OR_I	or 	%r8, 0x04a8, %r3
	.word 0xbe322a00  ! 648: ORN_I	orn 	%r8, 0x0a00, %r31
	.word 0x8e2a0009  ! 648: ANDN_R	andn 	%r8, %r9, %r7
	.word 0x8c022a4c  ! 648: ADD_I	add 	%r8, 0x0a4c, %r6
	.word 0x84922e80  ! 648: ORcc_I	orcc 	%r8, 0x0e80, %r2
	.word 0xacb20009  ! 648: SUBCcc_R	orncc 	%r8, %r9, %r22
	.word 0x84b20009  ! 648: SUBCcc_R	orncc 	%r8, %r9, %r2
	.word 0x8e320009  ! 648: ORN_R	orn 	%r8, %r9, %r7
	.word 0x86220009  ! 648: SUB_R	sub 	%r8, %r9, %r3
	.word 0xb4a22dcc  ! 648: SUBcc_I	subcc 	%r8, 0x0dcc, %r26
	.word 0x8d321009  ! 648: SRLX_R	srlx	%r8, %r9, %r6
	.word 0xcf220009  ! 652: STF_R	st	%f7, [%r9, %r8]
	.word 0xde120009  ! 652: LDUH_R	lduh	[%r8 + %r9], %r15
	.word 0xd9020009  ! 652: LDF_R	ld	[%r8, %r9], %f12
	.word 0x8f6a29d8  ! 652: SDIVX_I	sdivx	%r8, 0x09d8, %r7
	.word 0xc4320009  ! 658: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc64a0009  ! 658: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0x82722e2c  ! 658: UDIV_I	udiv 	%r8, 0x0e2c, %r1
	.word 0x8c7220b8  ! 658: UDIV_I	udiv 	%r8, 0x00b8, %r6
	.word 0xd8220009  ! 662: STW_R	stw	%r12, [%r8 + %r9]
	.word 0xc7020009  ! 662: LDF_R	ld	[%r8, %r9], %f3
	.word 0x947a2190  ! 662: SDIV_I	sdiv 	%r8, 0x0190, %r10
	.word 0x8c7a2974  ! 662: SDIV_I	sdiv 	%r8, 0x0974, %r6
	.word 0x8a1a28a8  ! 663: XOR_I	xor 	%r8, 0x08a8, %r5
	.word 0x8ec20009  ! 663: ADDCcc_R	addccc 	%r8, %r9, %r7
	.word 0x8b2a1009  ! 663: SLLX_R	sllx	%r8, %r9, %r5
	.word 0xa6b228c8  ! 663: SUBCcc_I	orncc 	%r8, 0x08c8, %r19
	.word 0x8cc20009  ! 663: ADDCcc_R	addccc 	%r8, %r9, %r6
	.word 0x89643801  ! 663: MOVcc_I	<illegal instruction>
	.word 0x892a3001  ! 663: SLLX_I	sllx	%r8, 0x0001, %r4
	.word 0x8f321009  ! 663: SRLX_R	srlx	%r8, %r9, %r7
	.word 0x849a2eb8  ! 663: XORcc_I	xorcc 	%r8, 0x0eb8, %r2
	.word 0x82b22a24  ! 663: ORNcc_I	orncc 	%r8, 0x0a24, %r1
	.word 0x88b221d8  ! 667: SUBCcc_I	orncc 	%r8, 0x01d8, %r4
	.word 0x9b3a1009  ! 667: SRAX_R	srax	%r8, %r9, %r13
	.word 0xa63a2634  ! 667: XNOR_I	xnor 	%r8, 0x0634, %r19
	.word 0x88820009  ! 667: ADDcc_R	addcc 	%r8, %r9, %r4
	.word 0x823a0009  ! 667: XNOR_R	xnor 	%r8, %r9, %r1
	.word 0x82422188  ! 667: ADDC_I	addc 	%r8, 0x0188, %r1
	.word 0x8d3a1009  ! 667: SRAX_R	srax	%r8, %r9, %r6
	.word 0x88ba2d90  ! 667: XNORcc_I	xnorcc 	%r8, 0x0d90, %r4
	.word 0x82a20009  ! 667: SUBcc_R	subcc 	%r8, %r9, %r1
	.word 0x841a0009  ! 667: XOR_R	xor 	%r8, %r9, %r2
	.word 0x86aa25c8  ! 667: ANDNcc_I	andncc 	%r8, 0x05c8, %r3
	.word 0x8cb22b44  ! 667: ORNcc_I	orncc 	%r8, 0x0b44, %r6
	.word 0x8e320009  ! 667: SUBC_R	orn 	%r8, %r9, %r7
	.word 0x8ea228c8  ! 667: SUBcc_I	subcc 	%r8, 0x08c8, %r7
	.word 0x8e2a0009  ! 667: ANDN_R	andn 	%r8, %r9, %r7
	.word 0xc62a0009  ! 671: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc80a0009  ! 671: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0x98720009  ! 671: UDIV_R	udiv 	%r8, %r9, %r12
	.word 0x8a7a261c  ! 671: SDIV_I	sdiv 	%r8, 0x061c, %r5
	.word 0xe6720009  ! 676: STX_R	stx	%r19, [%r8 + %r9]
	.word 0xde020009  ! 676: LDUW_R	lduw	[%r8 + %r9], %r15
	.word 0xc31a0009  ! 676: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0x8ef22b88  ! 676: UDIVcc_I	udivcc 	%r8, 0x0b88, %r7
	.word 0x89641809  ! 678: MOVcc_R	<illegal instruction>
	.word 0x8822264c  ! 678: SUB_I	sub 	%r8, 0x064c, %r4
	.word 0x83323001  ! 678: SRLX_I	srlx	%r8, 0x0001, %r1
	.word 0x8aba0009  ! 678: XNORcc_R	xnorcc 	%r8, %r9, %r5
	.word 0xa6aa0009  ! 678: ANDNcc_R	andncc 	%r8, %r9, %r19
	.word 0x9c122148  ! 678: OR_I	or 	%r8, 0x0148, %r14
	.word 0xb4422a64  ! 678: ADDC_I	addc 	%r8, 0x0a64, %r26
	.word 0x8cba0009  ! 678: XNORcc_R	xnorcc 	%r8, %r9, %r6
	.word 0xad321009  ! 678: SRLX_R	srlx	%r8, %r9, %r22
	.word 0x944220e8  ! 678: ADDC_I	addc 	%r8, 0x00e8, %r10
	.word 0x88b20009  ! 678: ORNcc_R	orncc 	%r8, %r9, %r4
	.word 0x8e820009  ! 678: ADDcc_R	addcc 	%r8, %r9, %r7
	.word 0x36800002  ! 682: BGE	bge,a	<label_0x2>
	.word 0x88f20009  ! 682: UDIVcc_R	udivcc 	%r8, %r9, %r4
	.word 0x08800001  ! 684: BLEU	bleu  	<label_0x1>
	.word 0x887a0009  ! 684: SDIV_R	sdiv 	%r8, %r9, %r4
	.word 0x8c320009  ! 691: SUBC_R	orn 	%r8, %r9, %r6
	.word 0x8622217c  ! 691: SUB_I	sub 	%r8, 0x017c, %r3
	.word 0xa20a0009  ! 691: AND_R	and 	%r8, %r9, %r17
	.word 0x8e020009  ! 691: ADD_R	add 	%r8, %r9, %r7
	.word 0x9aba0009  ! 691: XNORcc_R	xnorcc 	%r8, %r9, %r13
	.word 0xaa02233c  ! 691: ADD_I	add 	%r8, 0x033c, %r21
	.word 0x852a3001  ! 691: SLLX_I	sllx	%r8, 0x0001, %r2
	.word 0x963222e8  ! 691: SUBC_I	orn 	%r8, 0x02e8, %r11
	.word 0x84a20009  ! 691: SUBcc_R	subcc 	%r8, %r9, %r2
	.word 0x85641809  ! 691: MOVcc_R	<illegal instruction>
	.word 0x822a2acc  ! 692: ANDN_I	andn 	%r8, 0x0acc, %r1
	.word 0x8b2a0009  ! 692: SLL_R	sll 	%r8, %r9, %r5
	.word 0x822a0009  ! 692: ANDN_R	andn 	%r8, %r9, %r1
	.word 0xa6820009  ! 692: ADDcc_R	addcc 	%r8, %r9, %r19
	.word 0x89323001  ! 692: SRLX_I	srlx	%r8, 0x0001, %r4
	.word 0x84322e5c  ! 692: SUBC_I	orn 	%r8, 0x0e5c, %r2
	.word 0x853a0009  ! 692: SRA_R	sra 	%r8, %r9, %r2
	.word 0xac9a0009  ! 692: XORcc_R	xorcc 	%r8, %r9, %r22
	.word 0x8a3a2cac  ! 692: XNOR_I	xnor 	%r8, 0x0cac, %r5
	.word 0x95643801  ! 692: MOVcc_I	<illegal instruction>
	.word 0x8f3a1009  ! 692: SRAX_R	srax	%r8, %r9, %r7
	.word 0x22800001  ! 694: BE	be,a	<label_0x1>
	.word 0x8ef22b30  ! 694: UDIVcc_I	udivcc 	%r8, 0x0b30, %r7
	.word 0xaa8a2894  ! 696: ANDcc_I	andcc 	%r8, 0x0894, %r21
	.word 0x8b643801  ! 696: MOVcc_I	<illegal instruction>
	.word 0x84322bc8  ! 696: ORN_I	orn 	%r8, 0x0bc8, %r2
	.word 0x8b2a1009  ! 696: SLLX_R	sllx	%r8, %r9, %r5
	.word 0xb2b22d08  ! 696: ORNcc_I	orncc 	%r8, 0x0d08, %r25
	.word 0xb2822908  ! 696: ADDcc_I	addcc 	%r8, 0x0908, %r25
	.word 0x842a2348  ! 696: ANDN_I	andn 	%r8, 0x0348, %r2
	.word 0x88aa0009  ! 696: ANDNcc_R	andncc 	%r8, %r9, %r4
	.word 0x9a822114  ! 696: ADDcc_I	addcc 	%r8, 0x0114, %r13
	.word 0x86c22480  ! 696: ADDCcc_I	addccc 	%r8, 0x0480, %r3
	.word 0x85641809  ! 697: MOVcc_R	<illegal instruction>
	.word 0x82b22440  ! 697: SUBCcc_I	orncc 	%r8, 0x0440, %r1
	.word 0x8e420009  ! 697: ADDC_R	addc 	%r8, %r9, %r7
	.word 0x8c8a251c  ! 697: ANDcc_I	andcc 	%r8, 0x051c, %r6
	.word 0x849a0009  ! 697: XORcc_R	xorcc 	%r8, %r9, %r2
	.word 0xaa322ff8  ! 697: SUBC_I	orn 	%r8, 0x0ff8, %r21
	.word 0xacaa2618  ! 697: ANDNcc_I	andncc 	%r8, 0x0618, %r22
	.word 0x8e0a0009  ! 697: AND_R	and 	%r8, %r9, %r7
	.word 0x86c20009  ! 697: ADDCcc_R	addccc 	%r8, %r9, %r3
	.word 0x8e1a0009  ! 697: XOR_R	xor 	%r8, %r9, %r7
	.word 0x9c2a2ecc  ! 697: ANDN_I	andn 	%r8, 0x0ecc, %r14
	.word 0xe33a0009  ! 701: STDF_R	std	%f17, [%r9, %r8]
	.word 0xe60a0009  ! 701: LDUB_R	ldub	[%r8 + %r9], %r19
	.word 0x84f22004  ! 701: UDIVcc_I	udivcc 	%r8, 0x0004, %r2
	.word 0x8a7a2dbc  ! 701: SDIV_I	sdiv 	%r8, 0x0dbc, %r5
	.word 0xbf2a2001  ! 703: SLL_I	sll 	%r8, 0x0001, %r31
	.word 0x84aa2a28  ! 703: ANDNcc_I	andncc 	%r8, 0x0a28, %r2
	.word 0xb62a0009  ! 703: ANDN_R	andn 	%r8, %r9, %r27
	.word 0x832a1009  ! 703: SLLX_R	sllx	%r8, %r9, %r1
	.word 0x8d320009  ! 703: SRL_R	srl 	%r8, %r9, %r6
	.word 0x85322001  ! 703: SRL_I	srl 	%r8, 0x0001, %r2
	.word 0xac1a0009  ! 703: XOR_R	xor 	%r8, %r9, %r22
	.word 0x88a20009  ! 703: SUBcc_R	subcc 	%r8, %r9, %r4
	.word 0x8d3a1009  ! 703: SRAX_R	srax	%r8, %r9, %r6
	.word 0x829a0009  ! 703: XORcc_R	xorcc 	%r8, %r9, %r1
	.word 0xb0aa2c68  ! 703: ANDNcc_I	andncc 	%r8, 0x0c68, %r24
	.word 0x82a20009  ! 703: SUBcc_R	subcc 	%r8, %r9, %r1
	.word 0x83322001  ! 703: SRL_I	srl 	%r8, 0x0001, %r1
	.word 0x96820009  ! 703: ADDcc_R	addcc 	%r8, %r9, %r11
	.word 0x82822674  ! 703: ADDcc_I	addcc 	%r8, 0x0674, %r1
	.word 0x04c20001  ! 705: BRLEZ	brlez  ,nt	%8,<label_0x20001>
	.word 0x82fa27c0  ! 705: SDIVcc_I	sdivcc 	%r8, 0x07c0, %r1
	.word 0x10800002  ! 710: BA	ba  	<label_0x2>
	.word 0xbc720009  ! 710: UDIV_R	udiv 	%r8, %r9, %r30
	.word 0x14800001  ! 714: BG	bg  	<label_0x1>
	.word 0x8cf22da8  ! 714: UDIVcc_I	udivcc 	%r8, 0x0da8, %r6
	.word 0x12800002  ! 716: BNE	bne  	<label_0x2>
	.word 0x86720009  ! 716: UDIV_R	udiv 	%r8, %r9, %r3
	.word 0xd6220009  ! 722: STW_R	stw	%r11, [%r8 + %r9]
	.word 0xc84a0009  ! 722: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xb4122b94  ! 722: OR_I	or 	%r8, 0x0b94, %r26
	.word 0x8a322db8  ! 722: SUBC_I	orn 	%r8, 0x0db8, %r5
	.word 0x8b323001  ! 722: SRLX_I	srlx	%r8, 0x0001, %r5
	.word 0x88fa0009  ! 722: SDIVcc_R	sdivcc 	%r8, %r9, %r4
	.word 0x8a2a2b80  ! 723: ANDN_I	andn 	%r8, 0x0b80, %r5
	.word 0x8d2a1009  ! 723: SLLX_R	sllx	%r8, %r9, %r6
	.word 0xa0a22dfc  ! 723: SUBcc_I	subcc 	%r8, 0x0dfc, %r16
	.word 0x893a1009  ! 723: SRAX_R	srax	%r8, %r9, %r4
	.word 0x8a9a29f8  ! 723: XORcc_I	xorcc 	%r8, 0x09f8, %r5
	.word 0x8ab20009  ! 723: SUBCcc_R	orncc 	%r8, %r9, %r5
	.word 0x8b780409  ! 723: MOVR_R	move	%r0, %r9, %r5
	.word 0xa7780409  ! 723: MOVR_R	move	%r0, %r9, %r19
	.word 0x82b22db0  ! 723: SUBCcc_I	orncc 	%r8, 0x0db0, %r1
	.word 0x84b22830  ! 723: ORNcc_I	orncc 	%r8, 0x0830, %r2
	.word 0x84120009  ! 723: OR_R	or 	%r8, %r9, %r2
	.word 0xac8a0009  ! 727: ANDcc_R	andcc 	%r8, %r9, %r22
	.word 0x85782401  ! 727: MOVR_I	move	%r0, 0x9, %r2
	.word 0xad3a2001  ! 727: SRA_I	sra 	%r8, 0x0001, %r22
	.word 0xa08a0009  ! 727: ANDcc_R	andcc 	%r8, %r9, %r16
	.word 0x883a28a8  ! 727: XNOR_I	xnor 	%r8, 0x08a8, %r4
	.word 0x8c2a0009  ! 727: ANDN_R	andn 	%r8, %r9, %r6
	.word 0x8c1228c4  ! 727: OR_I	or 	%r8, 0x08c4, %r6
	.word 0x8c8a0009  ! 727: ANDcc_R	andcc 	%r8, %r9, %r6
	.word 0xaeb223f8  ! 727: ORNcc_I	orncc 	%r8, 0x03f8, %r23
	.word 0xaec20009  ! 727: ADDCcc_R	addccc 	%r8, %r9, %r23
	.word 0x8d2a2001  ! 727: SLL_I	sll 	%r8, 0x0001, %r6
	.word 0x12800001  ! 730: BNE	bne  	<label_0x1>
	.word 0x8c722f78  ! 730: UDIV_I	udiv 	%r8, 0x0f78, %r6
	.word 0x3c800001  ! 734: BPOS	bpos,a	<label_0x1>
	.word 0x987a0009  ! 734: SDIV_R	sdiv 	%r8, %r9, %r12
	.word 0xcd3a0009  ! 739: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc81a0009  ! 739: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x8e6a0009  ! 739: UDIVX_R	udivx 	%r8, %r9, %r7
	.word 0x8d6a2348  ! 739: SDIVX_I	sdivx	%r8, 0x0348, %r6
	.word 0x38800002  ! 741: BGU	bgu,a	<label_0x2>
	.word 0xbcf20009  ! 741: UDIVcc_R	udivcc 	%r8, %r9, %r30
	.word 0x97643801  ! 742: MOVcc_I	<illegal instruction>
	.word 0x88b22b98  ! 742: ORNcc_I	orncc 	%r8, 0x0b98, %r4
	.word 0x87780409  ! 742: MOVR_R	move	%r0, %r9, %r3
	.word 0x993a1009  ! 742: SRAX_R	srax	%r8, %r9, %r12
	.word 0x8e2a0009  ! 742: ANDN_R	andn 	%r8, %r9, %r7
	.word 0x8d780409  ! 742: MOVR_R	move	%r0, %r9, %r6
	.word 0xbeb20009  ! 742: SUBCcc_R	orncc 	%r8, %r9, %r31
	.word 0x8f3a2001  ! 742: SRA_I	sra 	%r8, 0x0001, %r7
	.word 0x8b3a2001  ! 742: SRA_I	sra 	%r8, 0x0001, %r5
	.word 0xb2320009  ! 742: ORN_R	orn 	%r8, %r9, %r25
	.word 0x989a0009  ! 742: XORcc_R	xorcc 	%r8, %r9, %r12
	.word 0x8f780409  ! 742: MOVR_R	move	%r0, %r9, %r7
	.word 0x8ab22588  ! 742: ORNcc_I	orncc 	%r8, 0x0588, %r5
	.word 0x0cca0001  ! 746: BRGZ	brgz  ,pt	%8,<label_0xa0001>
	.word 0x82fa0009  ! 746: SDIVcc_R	sdivcc 	%r8, %r9, %r1
	.word 0xe33a0009  ! 750: STDF_R	std	%f17, [%r9, %r8]
	.word 0xcc520009  ! 750: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xce0a2fdc  ! 750: LDUB_I	ldub	[%r8 + 0x0fdc], %r7
	.word 0x8cfa2b34  ! 750: SDIVcc_I	sdivcc 	%r8, 0x0b34, %r6
	.word 0xe8220009  ! 757: STW_R	stw	%r20, [%r8 + %r9]
	.word 0xea520009  ! 757: LDSH_R	ldsh	[%r8 + %r9], %r21
	.word 0xa96a0009  ! 757: SDIVX_R	sdivx	%r8, %r9, %r20
	.word 0x867a0009  ! 757: SDIV_R	sdiv 	%r8, %r9, %r3
	.word 0x12800001  ! 761: BNE	bne  	<label_0x1>
	.word 0x867222c4  ! 761: UDIV_I	udiv 	%r8, 0x02c4, %r3
	.word 0xce720009  ! 766: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xca420009  ! 766: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0x84fa0009  ! 766: SDIVcc_R	sdivcc 	%r8, %r9, %r2
	.word 0xb16a2a20  ! 766: SDIVX_I	sdivx	%r8, 0x0a20, %r24
	.word 0xef3a0009  ! 772: STDF_R	std	%f23, [%r9, %r8]
	.word 0xe1020009  ! 772: LDF_R	ld	[%r8, %r9], %f16
	.word 0x866a2710  ! 772: UDIVX_I	udivx 	%r8, 0x0710, %r3
	.word 0x827a2efc  ! 772: SDIV_I	sdiv 	%r8, 0x0efc, %r1
	.word 0x9ac223a8  ! 773: ADDCcc_I	addccc 	%r8, 0x03a8, %r13
	.word 0x9f321009  ! 773: SRLX_R	srlx	%r8, %r9, %r15
	.word 0x823228fc  ! 773: ORN_I	orn 	%r8, 0x08fc, %r1
	.word 0xa28a2fa4  ! 773: ANDcc_I	andcc 	%r8, 0x0fa4, %r17
	.word 0x84b20009  ! 773: SUBCcc_R	orncc 	%r8, %r9, %r2
	.word 0x82320009  ! 773: SUBC_R	orn 	%r8, %r9, %r1
	.word 0x953a1009  ! 773: SRAX_R	srax	%r8, %r9, %r10
	.word 0x84ba0009  ! 773: XNORcc_R	xnorcc 	%r8, %r9, %r2
	.word 0x9b320009  ! 773: SRL_R	srl 	%r8, %r9, %r13
	.word 0x8f3a3001  ! 773: SRAX_I	srax	%r8, 0x0001, %r7
	.word 0x8b3a3001  ! 773: SRAX_I	srax	%r8, 0x0001, %r5
	.word 0x8c9a0009  ! 773: XORcc_R	xorcc 	%r8, %r9, %r6
	.word 0x8aba0009  ! 773: XNORcc_R	xnorcc 	%r8, %r9, %r5
	.word 0x82c20009  ! 773: ADDCcc_R	addccc 	%r8, %r9, %r1
	.word 0x04c20001  ! 775: BRLEZ	brlez  ,nt	%8,<label_0x20001>
	.word 0x8e6a20b4  ! 775: UDIVX_I	udivx 	%r8, 0x00b4, %r7
	.word 0x9a8a224c  ! 777: ANDcc_I	andcc 	%r8, 0x024c, %r13
	.word 0xbb2a0009  ! 777: SLL_R	sll 	%r8, %r9, %r29
	.word 0x842a0009  ! 777: ANDN_R	andn 	%r8, %r9, %r2
	.word 0xaaaa2628  ! 777: ANDNcc_I	andncc 	%r8, 0x0628, %r21
	.word 0xb8820009  ! 777: ADDcc_R	addcc 	%r8, %r9, %r28
	.word 0xa20a0009  ! 777: AND_R	and 	%r8, %r9, %r17
	.word 0x8432276c  ! 777: SUBC_I	orn 	%r8, 0x076c, %r2
	.word 0x86b20009  ! 777: SUBCcc_R	orncc 	%r8, %r9, %r3
	.word 0x881a27d8  ! 777: XOR_I	xor 	%r8, 0x07d8, %r4
	.word 0x88420009  ! 777: ADDC_R	addc 	%r8, %r9, %r4
	.word 0xc53a0009  ! 781: STDF_R	std	%f2, [%r9, %r8]
	.word 0xcd1a0009  ! 781: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xec9a1009  ! 781: LDDA_R	ldda	[%r8, %r9] 0x80, %r22
	.word 0x9f6a2938  ! 781: SDIVX_I	sdivx	%r8, 0x0938, %r15
	.word 0xca2a0009  ! 785: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xcc120009  ! 785: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0x856a0009  ! 785: SDIVX_R	sdivx	%r8, %r9, %r2
	.word 0xb66a2f00  ! 785: UDIVX_I	udivx 	%r8, 0x0f00, %r27
	.word 0xf13a0009  ! 789: STDF_R	std	%f24, [%r9, %r8]
	.word 0xc31a0009  ! 789: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0x86720009  ! 789: UDIV_R	udiv 	%r8, %r9, %r3
	.word 0x86fa2014  ! 789: SDIVcc_I	sdivcc 	%r8, 0x0014, %r3
	.word 0xa5641809  ! 790: MOVcc_R	<illegal instruction>
	.word 0x848a2004  ! 790: ANDcc_I	andcc 	%r8, 0x0004, %r2
	.word 0xa1641809  ! 790: MOVcc_R	<illegal instruction>
	.word 0x8c8a0009  ! 790: ANDcc_R	andcc 	%r8, %r9, %r6
	.word 0x9cb20009  ! 790: SUBCcc_R	orncc 	%r8, %r9, %r14
	.word 0x8f2a1009  ! 790: SLLX_R	sllx	%r8, %r9, %r7
	.word 0x96c20009  ! 790: ADDCcc_R	addccc 	%r8, %r9, %r11
	.word 0x8eb2261c  ! 790: SUBCcc_I	orncc 	%r8, 0x061c, %r7
	.word 0xa1323001  ! 790: SRLX_I	srlx	%r8, 0x0001, %r16
	.word 0x9cb22bb0  ! 790: ORNcc_I	orncc 	%r8, 0x0bb0, %r14
	.word 0x89643801  ! 790: MOVcc_I	<illegal instruction>
	.word 0x8a1224bc  ! 790: OR_I	or 	%r8, 0x04bc, %r5
	.word 0xbca20009  ! 790: SUBcc_R	subcc 	%r8, %r9, %r30
	.word 0xa69a0009  ! 790: XORcc_R	xorcc 	%r8, %r9, %r19
	.word 0xa8b22780  ! 790: ORNcc_I	orncc 	%r8, 0x0780, %r20
	.word 0xcf220009  ! 795: STF_R	st	%f7, [%r9, %r8]
	.word 0xc9020009  ! 795: LDF_R	ld	[%r8, %r9], %f4
	.word 0x860a0009  ! 795: AND_R	and 	%r8, %r9, %r3
	.word 0x8cfa266c  ! 795: SDIVcc_I	sdivcc 	%r8, 0x066c, %r6
	.word 0xf8220009  ! 799: STW_R	stw	%r28, [%r8 + %r9]
	.word 0xc3020009  ! 799: LDF_R	ld	[%r8, %r9], %f1
	.word 0xcc1a0009  ! 799: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0x8e7225f4  ! 799: UDIV_I	udiv 	%r8, 0x05f4, %r7
	.word 0x0cc20001  ! 801: BRGZ	brgz  ,nt	%8,<label_0x20001>
	.word 0x88fa2f30  ! 801: SDIVcc_I	sdivcc 	%r8, 0x0f30, %r4
	.word 0xc8220009  ! 806: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xcc420009  ! 806: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xca522cf8  ! 806: LDSH_I	ldsh	[%r8 + 0x0cf8], %r5
	.word 0x84fa0009  ! 806: SDIVcc_R	sdivcc 	%r8, %r9, %r2
	.word 0xae9a2a7c  ! 808: XORcc_I	xorcc 	%r8, 0x0a7c, %r23
	.word 0x8aba0009  ! 808: XNORcc_R	xnorcc 	%r8, %r9, %r5
	.word 0x84ba2b0c  ! 808: XNORcc_I	xnorcc 	%r8, 0x0b0c, %r2
	.word 0xa61a0009  ! 808: XOR_R	xor 	%r8, %r9, %r19
	.word 0x8e422f8c  ! 808: ADDC_I	addc 	%r8, 0x0f8c, %r7
	.word 0x85643801  ! 808: MOVcc_I	<illegal instruction>
	.word 0xaf320009  ! 808: SRL_R	srl 	%r8, %r9, %r23
	.word 0x87320009  ! 808: SRL_R	srl 	%r8, %r9, %r3
	.word 0xa0820009  ! 808: ADDcc_R	addcc 	%r8, %r9, %r16
	.word 0x863a0009  ! 808: XNOR_R	xnor 	%r8, %r9, %r3
	.word 0xa0c226ec  ! 808: ADDCcc_I	addccc 	%r8, 0x06ec, %r16
	.word 0x02c20001  ! 810: BRZ	brz  ,nt	%8,<label_0x20001>
	.word 0x8afa204c  ! 810: SDIVcc_I	sdivcc 	%r8, 0x004c, %r5
	.word 0x8e1a2248  ! 812: XOR_I	xor 	%r8, 0x0248, %r7
	.word 0x8e3a2724  ! 812: XNOR_I	xnor 	%r8, 0x0724, %r7
	.word 0x8c1a0009  ! 812: XOR_R	xor 	%r8, %r9, %r6
	.word 0x84020009  ! 812: ADD_R	add 	%r8, %r9, %r2
	.word 0x893a0009  ! 812: SRA_R	sra 	%r8, %r9, %r4
	.word 0x8c3a2c4c  ! 812: XNOR_I	xnor 	%r8, 0x0c4c, %r6
	.word 0x89641809  ! 812: MOVcc_R	<illegal instruction>
	.word 0x8a920009  ! 812: ORcc_R	orcc 	%r8, %r9, %r5
	.word 0x85782401  ! 812: MOVR_I	move	%r0, 0x9, %r2
	.word 0xa2a20009  ! 812: SUBcc_R	subcc 	%r8, %r9, %r17
	.word 0x8d2a2001  ! 813: SLL_I	sll 	%r8, 0x0001, %r6
	.word 0x8f3a3001  ! 813: SRAX_I	srax	%r8, 0x0001, %r7
	.word 0x82022058  ! 813: ADD_I	add 	%r8, 0x0058, %r1
	.word 0x8a920009  ! 813: ORcc_R	orcc 	%r8, %r9, %r5
	.word 0x8a3a2920  ! 813: XNOR_I	xnor 	%r8, 0x0920, %r5
	.word 0x829a2a50  ! 813: XORcc_I	xorcc 	%r8, 0x0a50, %r1
	.word 0xa3641809  ! 813: MOVcc_R	<illegal instruction>
	.word 0x8c422214  ! 813: ADDC_I	addc 	%r8, 0x0214, %r6
	.word 0x848a0009  ! 813: ANDcc_R	andcc 	%r8, %r9, %r2
	.word 0x972a3001  ! 813: SLLX_I	sllx	%r8, 0x0001, %r11
	.word 0x8d2a3001  ! 813: SLLX_I	sllx	%r8, 0x0001, %r6
	.word 0xa03a0009  ! 813: XNOR_R	xnor 	%r8, %r9, %r16
	.word 0x8a1a0009  ! 813: XOR_R	xor 	%r8, %r9, %r5
	.word 0x833a0009  ! 813: SRA_R	sra 	%r8, %r9, %r1
	.word 0x86b22978  ! 814: ORNcc_I	orncc 	%r8, 0x0978, %r3
	.word 0xb4ba0009  ! 814: XNORcc_R	xnorcc 	%r8, %r9, %r26
	.word 0x88822ec0  ! 814: ADDcc_I	addcc 	%r8, 0x0ec0, %r4
	.word 0x8a0a2d84  ! 814: AND_I	and 	%r8, 0x0d84, %r5
	.word 0x832a1009  ! 814: SLLX_R	sllx	%r8, %r9, %r1
	.word 0x882a0009  ! 814: ANDN_R	andn 	%r8, %r9, %r4
	.word 0x88a22538  ! 814: SUBcc_I	subcc 	%r8, 0x0538, %r4
	.word 0x88b20009  ! 814: ORNcc_R	orncc 	%r8, %r9, %r4
	.word 0x82922320  ! 814: ORcc_I	orcc 	%r8, 0x0320, %r1
	.word 0x8e0a0009  ! 814: AND_R	and 	%r8, %r9, %r7
	.word 0x9b3a3001  ! 814: SRAX_I	srax	%r8, 0x0001, %r13
	.word 0xb1641809  ! 818: MOVcc_R	<illegal instruction>
	.word 0xb93a1009  ! 818: SRAX_R	srax	%r8, %r9, %r28
	.word 0x8d3a3001  ! 818: SRAX_I	srax	%r8, 0x0001, %r6
	.word 0x85780409  ! 818: MOVR_R	move	%r0, %r9, %r2
	.word 0x880a0009  ! 818: AND_R	and 	%r8, %r9, %r4
	.word 0x8e1a2e20  ! 818: XOR_I	xor 	%r8, 0x0e20, %r7
	.word 0xaf2a0009  ! 818: SLL_R	sll 	%r8, %r9, %r23
	.word 0xa5320009  ! 818: SRL_R	srl 	%r8, %r9, %r18
	.word 0x8d2a0009  ! 818: SLL_R	sll 	%r8, %r9, %r6
	.word 0x8d3a1009  ! 818: SRAX_R	srax	%r8, %r9, %r6
	.word 0x8a320009  ! 818: SUBC_R	orn 	%r8, %r9, %r5
	.word 0x97320009  ! 819: SRL_R	srl 	%r8, %r9, %r11
	.word 0xb9323001  ! 819: SRLX_I	srlx	%r8, 0x0001, %r28
	.word 0x8cc20009  ! 819: ADDCcc_R	addccc 	%r8, %r9, %r6
	.word 0x8c9a27bc  ! 819: XORcc_I	xorcc 	%r8, 0x07bc, %r6
	.word 0x86c22e0c  ! 819: ADDCcc_I	addccc 	%r8, 0x0e0c, %r3
	.word 0x8c1223c0  ! 819: OR_I	or 	%r8, 0x03c0, %r6
	.word 0x883220c0  ! 819: SUBC_I	orn 	%r8, 0x00c0, %r4
	.word 0x841a2cbc  ! 819: XOR_I	xor 	%r8, 0x0cbc, %r2
	.word 0x881a0009  ! 819: XOR_R	xor 	%r8, %r9, %r4
	.word 0x8a3a2930  ! 819: XNOR_I	xnor 	%r8, 0x0930, %r5
	.word 0xb62a2c00  ! 819: ANDN_I	andn 	%r8, 0x0c00, %r27
	.word 0x821a2038  ! 819: XOR_I	xor 	%r8, 0x0038, %r1
	.word 0xc4320009  ! 824: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc41a0009  ! 824: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x8d6a2df0  ! 824: SDIVX_I	sdivx	%r8, 0x0df0, %r6
	.word 0x8d6a2cd4  ! 824: SDIVX_I	sdivx	%r8, 0x0cd4, %r6
	.word 0x38800001  ! 826: BGU	bgu,a	<label_0x1>
	.word 0x98fa2650  ! 826: SDIVcc_I	sdivcc 	%r8, 0x0650, %r12
	.word 0x32800001  ! 828: BNE	bne,a	<label_0x1>
	.word 0x876a2ce4  ! 828: SDIVX_I	sdivx	%r8, 0x0ce4, %r3
	.word 0x88022f94  ! 832: ADD_I	add 	%r8, 0x0f94, %r4
	.word 0x8ac224bc  ! 832: ADDCcc_I	addccc 	%r8, 0x04bc, %r5
	.word 0x880a0009  ! 832: AND_R	and 	%r8, %r9, %r4
	.word 0x86a20009  ! 832: SUBcc_R	subcc 	%r8, %r9, %r3
	.word 0x868a2b84  ! 832: ANDcc_I	andcc 	%r8, 0x0b84, %r3
	.word 0x852a2001  ! 832: SLL_I	sll 	%r8, 0x0001, %r2
	.word 0x84a20009  ! 832: SUBcc_R	subcc 	%r8, %r9, %r2
	.word 0xb29a2f58  ! 832: XORcc_I	xorcc 	%r8, 0x0f58, %r25
	.word 0x8d2a0009  ! 832: SLL_R	sll 	%r8, %r9, %r6
	.word 0x9c120009  ! 832: OR_R	or 	%r8, %r9, %r14
	.word 0x883a2954  ! 832: XNOR_I	xnor 	%r8, 0x0954, %r4
	.word 0x892a3001  ! 832: SLLX_I	sllx	%r8, 0x0001, %r4
	.word 0x8ac22430  ! 832: ADDCcc_I	addccc 	%r8, 0x0430, %r5
	.word 0x8a3a0009  ! 832: XNOR_R	xnor 	%r8, %r9, %r5
	.word 0x84822940  ! 832: ADDcc_I	addcc 	%r8, 0x0940, %r2
	.word 0x34800001  ! 834: BG	bg,a	<label_0x1>
	.word 0x88fa2528  ! 834: SDIVcc_I	sdivcc 	%r8, 0x0528, %r4
	.word 0xcf220009  ! 839: STF_R	st	%f7, [%r9, %r8]
	.word 0xc44a0009  ! 839: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0x8c720009  ! 839: UDIV_R	udiv 	%r8, %r9, %r6
	.word 0x8b6a2a04  ! 839: SDIVX_I	sdivx	%r8, 0x0a04, %r5
	.word 0xb29225fc  ! 842: ORcc_I	orcc 	%r8, 0x05fc, %r25
	.word 0x882a2f88  ! 842: ANDN_I	andn 	%r8, 0x0f88, %r4
	.word 0x8d2a1009  ! 842: SLLX_R	sllx	%r8, %r9, %r6
	.word 0x8c320009  ! 842: ORN_R	orn 	%r8, %r9, %r6
	.word 0xaa9a0009  ! 842: XORcc_R	xorcc 	%r8, %r9, %r21
	.word 0xa2320009  ! 842: SUBC_R	orn 	%r8, %r9, %r17
	.word 0xa32a3001  ! 842: SLLX_I	sllx	%r8, 0x0001, %r17
	.word 0x8d323001  ! 842: SRLX_I	srlx	%r8, 0x0001, %r6
	.word 0x8e3a21c4  ! 842: XNOR_I	xnor 	%r8, 0x01c4, %r7
	.word 0xb0022068  ! 842: ADD_I	add 	%r8, 0x0068, %r24
	.word 0x86b20009  ! 842: ORNcc_R	orncc 	%r8, %r9, %r3
	.word 0x852a0009  ! 842: SLL_R	sll 	%r8, %r9, %r2
	.word 0x88020009  ! 842: ADD_R	add 	%r8, %r9, %r4
	.word 0x883a0009  ! 842: XNOR_R	xnor 	%r8, %r9, %r4
	.word 0xc82a0009  ! 846: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc8020009  ! 846: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xb4720009  ! 846: UDIV_R	udiv 	%r8, %r9, %r26
	.word 0x827a0009  ! 846: SDIV_R	sdiv 	%r8, %r9, %r1
	.word 0x10800001  ! 848: BA	ba  	<label_0x1>
	.word 0x88f20009  ! 848: UDIVcc_R	udivcc 	%r8, %r9, %r4
	.word 0xcb3a0009  ! 852: STDF_R	std	%f5, [%r9, %r8]
	.word 0xe2020009  ! 852: LDUW_R	lduw	[%r8 + %r9], %r17
	.word 0x8ef20009  ! 852: UDIVcc_R	udivcc 	%r8, %r9, %r7
	.word 0xaef22698  ! 852: UDIVcc_I	udivcc 	%r8, 0x0698, %r23
	.word 0x8cb22c40  ! 854: SUBCcc_I	orncc 	%r8, 0x0c40, %r6
	.word 0x883a2af0  ! 854: XNOR_I	xnor 	%r8, 0x0af0, %r4
	.word 0xbe3a2ebc  ! 854: XNOR_I	xnor 	%r8, 0x0ebc, %r31
	.word 0x848221a0  ! 854: ADDcc_I	addcc 	%r8, 0x01a0, %r2
	.word 0x892a0009  ! 854: SLL_R	sll 	%r8, %r9, %r4
	.word 0x88aa0009  ! 854: ANDNcc_R	andncc 	%r8, %r9, %r4
	.word 0x853a0009  ! 854: SRA_R	sra 	%r8, %r9, %r2
	.word 0x89323001  ! 854: SRLX_I	srlx	%r8, 0x0001, %r4
	.word 0x82aa2254  ! 854: ANDNcc_I	andncc 	%r8, 0x0254, %r1
	.word 0x8ec20009  ! 854: ADDCcc_R	addccc 	%r8, %r9, %r7
	.word 0x8d2a0009  ! 854: SLL_R	sll 	%r8, %r9, %r6
	.word 0x86b22e9c  ! 854: SUBCcc_I	orncc 	%r8, 0x0e9c, %r3
	.word 0xb2ba0009  ! 854: XNORcc_R	xnorcc 	%r8, %r9, %r25
	.word 0x8e2a2f38  ! 855: ANDN_I	andn 	%r8, 0x0f38, %r7
	.word 0xbec22918  ! 855: ADDCcc_I	addccc 	%r8, 0x0918, %r31
	.word 0x8b3a3001  ! 855: SRAX_I	srax	%r8, 0x0001, %r5
	.word 0xb84224ec  ! 855: ADDC_I	addc 	%r8, 0x04ec, %r28
	.word 0x85323001  ! 855: SRLX_I	srlx	%r8, 0x0001, %r2
	.word 0xa72a3001  ! 855: SLLX_I	sllx	%r8, 0x0001, %r19
	.word 0xb72a3001  ! 855: SLLX_I	sllx	%r8, 0x0001, %r27
	.word 0x8e120009  ! 855: OR_R	or 	%r8, %r9, %r7
	.word 0x8c3a0009  ! 855: XNOR_R	xnor 	%r8, %r9, %r6
	.word 0x9a920009  ! 855: ORcc_R	orcc 	%r8, %r9, %r13
	.word 0x892a0009  ! 855: SLL_R	sll 	%r8, %r9, %r4
	.word 0x84020009  ! 855: ADD_R	add 	%r8, %r9, %r2
	.word 0x0aca0001  ! 859: BRNZ	brnz  ,pt	%8,<label_0xa0001>
	.word 0xab6a0009  ! 859: SDIVX_R	sdivx	%r8, %r9, %r21
	.word 0xcb220009  ! 869: STF_R	st	%f5, [%r9, %r8]
	.word 0xc31a0009  ! 869: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0x828a0009  ! 869: ANDcc_R	andcc 	%r8, %r9, %r1
	.word 0x89320009  ! 869: SRL_R	srl 	%r8, %r9, %r4
	.word 0x8ab20009  ! 869: SUBCcc_R	orncc 	%r8, %r9, %r5
	.word 0x8e722c5c  ! 869: UDIV_I	udiv 	%r8, 0x0c5c, %r7
	.word 0x3a800001  ! 871: BCC	bcc,a	<label_0x1>
	.word 0xa8f22f54  ! 871: UDIVcc_I	udivcc 	%r8, 0x0f54, %r20
	.word 0x853a2001  ! 873: SRA_I	sra 	%r8, 0x0001, %r2
	.word 0x832a2001  ! 873: SLL_I	sll 	%r8, 0x0001, %r1
	.word 0x85323001  ! 873: SRLX_I	srlx	%r8, 0x0001, %r2
	.word 0x8c8a0009  ! 873: ANDcc_R	andcc 	%r8, %r9, %r6
	.word 0x8c320009  ! 873: ORN_R	orn 	%r8, %r9, %r6
	.word 0x86b20009  ! 873: SUBCcc_R	orncc 	%r8, %r9, %r3
	.word 0xa08a0009  ! 873: ANDcc_R	andcc 	%r8, %r9, %r16
	.word 0x8ab20009  ! 873: SUBCcc_R	orncc 	%r8, %r9, %r5
	.word 0x8e1a2378  ! 873: XOR_I	xor 	%r8, 0x0378, %r7
	.word 0xbeba0009  ! 873: XNORcc_R	xnorcc 	%r8, %r9, %r31
	.word 0xaca221b4  ! 873: SUBcc_I	subcc 	%r8, 0x01b4, %r22
	.word 0xbea20009  ! 873: SUBcc_R	subcc 	%r8, %r9, %r31
	.word 0x8f3a2001  ! 873: SRA_I	sra 	%r8, 0x0001, %r7
	.word 0x86aa0009  ! 873: ANDNcc_R	andncc 	%r8, %r9, %r3
	.word 0x06ca0001  ! 876: BRLZ	brlz  ,pt	%8,<label_0xa0001>
	.word 0x84f20009  ! 876: UDIVcc_R	udivcc 	%r8, %r9, %r2
	.word 0x83320009  ! 879: SRL_R	srl 	%r8, %r9, %r1
	.word 0xa92a3001  ! 879: SLLX_I	sllx	%r8, 0x0001, %r20
	.word 0x86ba0009  ! 879: XNORcc_R	xnorcc 	%r8, %r9, %r3
	.word 0x84b20009  ! 879: SUBCcc_R	orncc 	%r8, %r9, %r2
	.word 0xba8a249c  ! 879: ANDcc_I	andcc 	%r8, 0x049c, %r29
	.word 0x8ca22b88  ! 879: SUBcc_I	subcc 	%r8, 0x0b88, %r6
	.word 0xa12a0009  ! 879: SLL_R	sll 	%r8, %r9, %r16
	.word 0x892a0009  ! 879: SLL_R	sll 	%r8, %r9, %r4
	.word 0x8f2a1009  ! 879: SLLX_R	sllx	%r8, %r9, %r7
	.word 0x8cb20009  ! 879: SUBCcc_R	orncc 	%r8, %r9, %r6
	.word 0x88422808  ! 879: ADDC_I	addc 	%r8, 0x0808, %r4
	.word 0x82b22a3c  ! 879: ORNcc_I	orncc 	%r8, 0x0a3c, %r1
	.word 0x8e3a0009  ! 879: XNOR_R	xnor 	%r8, %r9, %r7
	.word 0x8b322001  ! 879: SRL_I	srl 	%r8, 0x0001, %r5
	.word 0x40000001  ! 881: CALL	call	disp30_1
	.word 0x82722ae8  ! 881: UDIV_I	udiv 	%r8, 0x0ae8, %r1
	.word 0x2cca0001  ! 886: BRGZ	brgz,a,pt	%8,<label_0xa0001>
	.word 0x8a720009  ! 886: UDIV_R	udiv 	%r8, %r9, %r5
	.word 0xf13a0009  ! 894: STDF_R	std	%f24, [%r9, %r8]
	.word 0xfc420009  ! 894: LDSW_R	ldsw	[%r8 + %r9], %r30
	.word 0xaf3a2001  ! 894: SRA_I	sra 	%r8, 0x0001, %r23
	.word 0x8aba2140  ! 894: XNORcc_I	xnorcc 	%r8, 0x0140, %r5
	.word 0x8caa0009  ! 894: ANDNcc_R	andncc 	%r8, %r9, %r6
	.word 0x836a0009  ! 894: SDIVX_R	sdivx	%r8, %r9, %r1
	.word 0xa2aa2ff8  ! 895: ANDNcc_I	andncc 	%r8, 0x0ff8, %r17
	.word 0x87323001  ! 895: SRLX_I	srlx	%r8, 0x0001, %r3
	.word 0x82120009  ! 895: OR_R	or 	%r8, %r9, %r1
	.word 0x8ab20009  ! 895: ORNcc_R	orncc 	%r8, %r9, %r5
	.word 0x84420009  ! 895: ADDC_R	addc 	%r8, %r9, %r2
	.word 0x848a0009  ! 895: ANDcc_R	andcc 	%r8, %r9, %r2
	.word 0x88820009  ! 895: ADDcc_R	addcc 	%r8, %r9, %r4
	.word 0x8d321009  ! 895: SRLX_R	srlx	%r8, %r9, %r6
	.word 0xbc3a0009  ! 895: XNOR_R	xnor 	%r8, %r9, %r30
	.word 0xb4020009  ! 895: ADD_R	add 	%r8, %r9, %r26
	.word 0x8ab20009  ! 895: SUBCcc_R	orncc 	%r8, %r9, %r5
	.word 0x888a0009  ! 895: ANDcc_R	andcc 	%r8, %r9, %r4
	.word 0x82922454  ! 895: ORcc_I	orcc 	%r8, 0x0454, %r1
	.word 0xb53a0009  ! 895: SRA_R	sra 	%r8, %r9, %r26
	.word 0xf0220009  ! 901: STW_R	stw	%r24, [%r8 + %r9]
	.word 0xda4a0009  ! 901: LDSB_R	ldsb	[%r8 + %r9], %r13
	.word 0x82720009  ! 901: UDIV_R	udiv 	%r8, %r9, %r1
	.word 0x867a20d0  ! 901: SDIV_I	sdiv 	%r8, 0x00d0, %r3
	.word 0x8c422f38  ! 902: ADDC_I	addc 	%r8, 0x0f38, %r6
	.word 0x841a0009  ! 902: XOR_R	xor 	%r8, %r9, %r2
	.word 0x843a2f9c  ! 902: XNOR_I	xnor 	%r8, 0x0f9c, %r2
	.word 0x82aa29ec  ! 902: ANDNcc_I	andncc 	%r8, 0x09ec, %r1
	.word 0x84020009  ! 902: ADD_R	add 	%r8, %r9, %r2
	.word 0x89782401  ! 902: MOVR_I	move	%r0, 0x9, %r4
	.word 0xb4422728  ! 902: ADDC_I	addc 	%r8, 0x0728, %r26
	.word 0x82322e68  ! 902: SUBC_I	orn 	%r8, 0x0e68, %r1
	.word 0x87641809  ! 902: MOVcc_R	<illegal instruction>
	.word 0x8c0a241c  ! 902: AND_I	and 	%r8, 0x041c, %r6
	.word 0x86a22f64  ! 902: SUBcc_I	subcc 	%r8, 0x0f64, %r3
	.word 0xb2aa0009  ! 902: ANDNcc_R	andncc 	%r8, %r9, %r25
	.word 0x82220009  ! 902: SUB_R	sub 	%r8, %r9, %r1
	.word 0x84ba0009  ! 902: XNORcc_R	xnorcc 	%r8, %r9, %r2
	.word 0x8e3a0009  ! 902: XNOR_R	xnor 	%r8, %r9, %r7
	.word 0x85782401  ! 903: MOVR_I	move	%r0, 0x9, %r2
	.word 0x8eaa23a4  ! 903: ANDNcc_I	andncc 	%r8, 0x03a4, %r7
	.word 0xaf323001  ! 903: SRLX_I	srlx	%r8, 0x0001, %r23
	.word 0x8a122fc4  ! 903: OR_I	or 	%r8, 0x0fc4, %r5
	.word 0x8d323001  ! 903: SRLX_I	srlx	%r8, 0x0001, %r6
	.word 0xb3320009  ! 903: SRL_R	srl 	%r8, %r9, %r25
	.word 0x83641809  ! 903: MOVcc_R	<illegal instruction>
	.word 0x82320009  ! 903: SUBC_R	orn 	%r8, %r9, %r1
	.word 0x941a2624  ! 903: XOR_I	xor 	%r8, 0x0624, %r10
	.word 0x8c320009  ! 903: SUBC_R	orn 	%r8, %r9, %r6
	.word 0x84b2251c  ! 903: SUBCcc_I	orncc 	%r8, 0x051c, %r2
	.word 0x3a800001  ! 905: BCC	bcc,a	<label_0x1>
	.word 0xb8f22acc  ! 905: UDIVcc_I	udivcc 	%r8, 0x0acc, %r28
	.word 0x833a3001  ! 909: SRAX_I	srax	%r8, 0x0001, %r1
	.word 0xaa322b24  ! 909: ORN_I	orn 	%r8, 0x0b24, %r21
	.word 0xbf641809  ! 909: MOVcc_R	<illegal instruction>
	.word 0x82420009  ! 909: ADDC_R	addc 	%r8, %r9, %r1
	.word 0x8e322ad0  ! 909: SUBC_I	orn 	%r8, 0x0ad0, %r7
	.word 0x83643801  ! 909: MOVcc_I	<illegal instruction>
	.word 0x8aaa0009  ! 909: ANDNcc_R	andncc 	%r8, %r9, %r5
	.word 0xb9641809  ! 909: MOVcc_R	<illegal instruction>
	.word 0x8c2225fc  ! 909: SUB_I	sub 	%r8, 0x05fc, %r6
	.word 0x822a0009  ! 909: ANDN_R	andn 	%r8, %r9, %r1
	.word 0x0cca0001  ! 912: BRGZ	brgz  ,pt	%8,<label_0xa0001>
	.word 0xbb6a2d60  ! 912: SDIVX_I	sdivx	%r8, 0x0d60, %r29
	.word 0x06c20001  ! 914: BRLZ	brlz  ,nt	%8,<label_0x20001>
	.word 0x846a2fd0  ! 914: UDIVX_I	udivx 	%r8, 0x0fd0, %r2
	.word 0x9a820009  ! 915: ADDcc_R	addcc 	%r8, %r9, %r13
	.word 0x872a1009  ! 915: SLLX_R	sllx	%r8, %r9, %r3
	.word 0x8a022798  ! 915: ADD_I	add 	%r8, 0x0798, %r5
	.word 0x8ea20009  ! 915: SUBcc_R	subcc 	%r8, %r9, %r7
	.word 0x8eaa0009  ! 915: ANDNcc_R	andncc 	%r8, %r9, %r7
	.word 0x852a2001  ! 915: SLL_I	sll 	%r8, 0x0001, %r2
	.word 0x841222bc  ! 915: OR_I	or 	%r8, 0x02bc, %r2
	.word 0xae8a0009  ! 915: ANDcc_R	andcc 	%r8, %r9, %r23
	.word 0x853a2001  ! 915: SRA_I	sra 	%r8, 0x0001, %r2
	.word 0x85322001  ! 915: SRL_I	srl 	%r8, 0x0001, %r2
	.word 0xcb3a0009  ! 920: STDF_R	std	%f5, [%r9, %r8]
	.word 0xc51a0009  ! 920: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xad6a2464  ! 920: SDIVX_I	sdivx	%r8, 0x0464, %r22
	.word 0x9af22578  ! 920: UDIVcc_I	udivcc 	%r8, 0x0578, %r13
	.word 0x848a2f38  ! 923: ANDcc_I	andcc 	%r8, 0x0f38, %r2
	.word 0xb7641809  ! 923: MOVcc_R	<illegal instruction>
	.word 0x86b22ad8  ! 923: SUBCcc_I	orncc 	%r8, 0x0ad8, %r3
	.word 0x882a0009  ! 923: ANDN_R	andn 	%r8, %r9, %r4
	.word 0x8c220009  ! 923: SUB_R	sub 	%r8, %r9, %r6
	.word 0x8f641809  ! 923: MOVcc_R	<illegal instruction>
	.word 0x84c22d00  ! 923: ADDCcc_I	addccc 	%r8, 0x0d00, %r2
	.word 0x8a9a2fd0  ! 923: XORcc_I	xorcc 	%r8, 0x0fd0, %r5
	.word 0xaac22f00  ! 923: ADDCcc_I	addccc 	%r8, 0x0f00, %r21
	.word 0x8ab20009  ! 923: SUBCcc_R	orncc 	%r8, %r9, %r5
	.word 0x9642286c  ! 923: ADDC_I	addc 	%r8, 0x086c, %r11
	.word 0x84b20009  ! 923: SUBCcc_R	orncc 	%r8, %r9, %r2
	.word 0x823a0009  ! 924: XNOR_R	xnor 	%r8, %r9, %r1
	.word 0xa9321009  ! 924: SRLX_R	srlx	%r8, %r9, %r20
	.word 0xba1a2d70  ! 924: XOR_I	xor 	%r8, 0x0d70, %r29
	.word 0x94320009  ! 924: ORN_R	orn 	%r8, %r9, %r10
	.word 0x88220009  ! 924: SUB_R	sub 	%r8, %r9, %r4
	.word 0x8e0a0009  ! 924: AND_R	and 	%r8, %r9, %r7
	.word 0x9802237c  ! 924: ADD_I	add 	%r8, 0x037c, %r12
	.word 0x9a2a0009  ! 924: ANDN_R	andn 	%r8, %r9, %r13
	.word 0x8cb20009  ! 924: ORNcc_R	orncc 	%r8, %r9, %r6
	.word 0x8e2a0009  ! 924: ANDN_R	andn 	%r8, %r9, %r7
	.word 0xa2ba2ac0  ! 925: XNORcc_I	xnorcc 	%r8, 0x0ac0, %r17
	.word 0x86122960  ! 925: OR_I	or 	%r8, 0x0960, %r3
	.word 0xb32a2001  ! 925: SLL_I	sll 	%r8, 0x0001, %r25
	.word 0x86422138  ! 925: ADDC_I	addc 	%r8, 0x0138, %r3
	.word 0xb6aa223c  ! 925: ANDNcc_I	andncc 	%r8, 0x023c, %r27
	.word 0xbcb20009  ! 925: SUBCcc_R	orncc 	%r8, %r9, %r30
	.word 0x88b20009  ! 925: SUBCcc_R	orncc 	%r8, %r9, %r4
	.word 0x8a8a2594  ! 925: ANDcc_I	andcc 	%r8, 0x0594, %r5
	.word 0x8cba0009  ! 925: XNORcc_R	xnorcc 	%r8, %r9, %r6
	.word 0xacb22020  ! 925: SUBCcc_I	orncc 	%r8, 0x0020, %r22
	.word 0x87320009  ! 925: SRL_R	srl 	%r8, %r9, %r3
	.word 0x84aa2ba4  ! 925: ANDNcc_I	andncc 	%r8, 0x0ba4, %r2
	.word 0x872a3001  ! 925: SLLX_I	sllx	%r8, 0x0001, %r3
	.word 0xbd2a0009  ! 925: SLL_R	sll 	%r8, %r9, %r30
	.word 0xb0c22654  ! 926: ADDCcc_I	addccc 	%r8, 0x0654, %r24
	.word 0x8d643801  ! 926: MOVcc_I	<illegal instruction>
	.word 0x82aa2018  ! 926: ANDNcc_I	andncc 	%r8, 0x0018, %r1
	.word 0x8cba2254  ! 926: XNORcc_I	xnorcc 	%r8, 0x0254, %r6
	.word 0x84220009  ! 926: SUB_R	sub 	%r8, %r9, %r2
	.word 0x82a22554  ! 926: SUBcc_I	subcc 	%r8, 0x0554, %r1
	.word 0xb52a0009  ! 926: SLL_R	sll 	%r8, %r9, %r26
	.word 0x861a29cc  ! 926: XOR_I	xor 	%r8, 0x09cc, %r3
	.word 0x881a0009  ! 926: XOR_R	xor 	%r8, %r9, %r4
	.word 0xb08a27a0  ! 926: ANDcc_I	andcc 	%r8, 0x07a0, %r24
	.word 0x8d322001  ! 926: SRL_I	srl 	%r8, 0x0001, %r6
	.word 0xbd322001  ! 926: SRL_I	srl 	%r8, 0x0001, %r30
	.word 0xba2a0009  ! 927: ANDN_R	andn 	%r8, %r9, %r29
	.word 0x82120009  ! 927: OR_R	or 	%r8, %r9, %r1
	.word 0x940a0009  ! 927: AND_R	and 	%r8, %r9, %r10
	.word 0x82420009  ! 927: ADDC_R	addc 	%r8, %r9, %r1
	.word 0x8e0a2b18  ! 927: AND_I	and 	%r8, 0x0b18, %r7
	.word 0x8aaa0009  ! 927: ANDNcc_R	andncc 	%r8, %r9, %r5
	.word 0x8cb20009  ! 927: SUBCcc_R	orncc 	%r8, %r9, %r6
	.word 0x84c22efc  ! 927: ADDCcc_I	addccc 	%r8, 0x0efc, %r2
	.word 0x82422848  ! 927: ADDC_I	addc 	%r8, 0x0848, %r1
	.word 0x84322880  ! 927: SUBC_I	orn 	%r8, 0x0880, %r2
	.word 0x2ec20001  ! 929: BRGEZ	brgez,a,nt	%8,<label_0x20001>
	.word 0x886a2b6c  ! 929: UDIVX_I	udivx 	%r8, 0x0b6c, %r4
	.word 0x888a2350  ! 930: ANDcc_I	andcc 	%r8, 0x0350, %r4
	.word 0xb8a20009  ! 930: SUBcc_R	subcc 	%r8, %r9, %r28
	.word 0x85323001  ! 930: SRLX_I	srlx	%r8, 0x0001, %r2
	.word 0x82a220e4  ! 930: SUBcc_I	subcc 	%r8, 0x00e4, %r1
	.word 0xa83a0009  ! 930: XNOR_R	xnor 	%r8, %r9, %r20
	.word 0x88aa0009  ! 930: ANDNcc_R	andncc 	%r8, %r9, %r4
	.word 0xb12a3001  ! 930: SLLX_I	sllx	%r8, 0x0001, %r24
	.word 0x8cb220a0  ! 930: SUBCcc_I	orncc 	%r8, 0x00a0, %r6
	.word 0x8eaa0009  ! 930: ANDNcc_R	andncc 	%r8, %r9, %r7
	.word 0x832a3001  ! 930: SLLX_I	sllx	%r8, 0x0001, %r1
	.word 0x2ac20001  ! 932: BRNZ	brnz,a,nt	%8,<label_0x20001>
	.word 0xaa7a2d50  ! 932: SDIV_I	sdiv 	%r8, 0x0d50, %r21
	.word 0x10800002  ! 935: BA	ba  	<label_0x2>
	.word 0x836a2d2c  ! 935: SDIVX_I	sdivx	%r8, 0x0d2c, %r1
	.word 0x02800002  ! 938: BE	be  	<label_0x2>
	.word 0x8e6a2914  ! 938: UDIVX_I	udivx 	%r8, 0x0914, %r7
	.word 0x18800001  ! 943: BGU	bgu  	<label_0x1>
	.word 0x8a6a2718  ! 943: UDIVX_I	udivx 	%r8, 0x0718, %r5
	.word 0x24c20001  ! 948: BRLEZ	brlez,a,nt	%8,<label_0x20001>
	.word 0x84f20009  ! 948: UDIVcc_R	udivcc 	%r8, %r9, %r2
	.word 0x8a0220f8  ! 950: ADD_I	add 	%r8, 0x00f8, %r5
	.word 0x88b20009  ! 950: ORNcc_R	orncc 	%r8, %r9, %r4
	.word 0x8ab20009  ! 950: SUBCcc_R	orncc 	%r8, %r9, %r5
	.word 0x823229f4  ! 950: SUBC_I	orn 	%r8, 0x09f4, %r1
	.word 0x8d3a3001  ! 950: SRAX_I	srax	%r8, 0x0001, %r6
	.word 0x82b20009  ! 950: SUBCcc_R	orncc 	%r8, %r9, %r1
	.word 0x84020009  ! 950: ADD_R	add 	%r8, %r9, %r2
	.word 0x82b22dc8  ! 950: ORNcc_I	orncc 	%r8, 0x0dc8, %r1
	.word 0x8b643801  ! 950: MOVcc_I	<illegal instruction>
	.word 0x89321009  ! 950: SRLX_R	srlx	%r8, %r9, %r4
	.word 0xa73a2001  ! 950: SRA_I	sra 	%r8, 0x0001, %r19
	.word 0xaa1a2214  ! 950: XOR_I	xor 	%r8, 0x0214, %r21
	.word 0x8e822cbc  ! 950: ADDcc_I	addcc 	%r8, 0x0cbc, %r7
	.word 0x892a2001  ! 950: SLL_I	sll 	%r8, 0x0001, %r4
	.word 0xa20a24c4  ! 950: AND_I	and 	%r8, 0x04c4, %r17
	.word 0x0e800001  ! 954: BVS	bvs  	<label_0x1>
	.word 0x846a0009  ! 954: UDIVX_R	udivx 	%r8, %r9, %r2
	.word 0x24c20001  ! 958: BRLEZ	brlez,a,nt	%8,<label_0x20001>
	.word 0x8e720009  ! 958: UDIV_R	udiv 	%r8, %r9, %r7
	.word 0xc2320009  ! 963: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xca020009  ! 963: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0x88fa0009  ! 963: SDIVcc_R	sdivcc 	%r8, %r9, %r4
	.word 0x856a29dc  ! 963: SDIVX_I	sdivx	%r8, 0x09dc, %r2
	.word 0xcb220009  ! 967: STF_R	st	%f5, [%r9, %r8]
	.word 0xc20a0009  ! 967: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xa4722a7c  ! 967: UDIV_I	udiv 	%r8, 0x0a7c, %r18
	.word 0x82722798  ! 967: UDIV_I	udiv 	%r8, 0x0798, %r1
	.word 0x0e800001  ! 970: BVS	bvs  	<label_0x1>
	.word 0xa46a0009  ! 970: UDIVX_R	udivx 	%r8, %r9, %r18
	.word 0x9e2a2268  ! 974: ANDN_I	andn 	%r8, 0x0268, %r15
	.word 0xaaaa0009  ! 974: ANDNcc_R	andncc 	%r8, %r9, %r21
	.word 0x8d321009  ! 974: SRLX_R	srlx	%r8, %r9, %r6
	.word 0x8cb20009  ! 974: ORNcc_R	orncc 	%r8, %r9, %r6
	.word 0x8b782401  ! 974: MOVR_I	move	%r0, 0x9, %r5
	.word 0x89782401  ! 974: MOVR_I	move	%r0, 0x9, %r4
	.word 0x94320009  ! 974: ORN_R	orn 	%r8, %r9, %r10
	.word 0x9a320009  ! 974: ORN_R	orn 	%r8, %r9, %r13
	.word 0xae122d90  ! 974: OR_I	or 	%r8, 0x0d90, %r23
	.word 0x940a0009  ! 974: AND_R	and 	%r8, %r9, %r10
	.word 0x87782401  ! 974: MOVR_I	move	%r0, 0x9, %r3
	.word 0x8a022e40  ! 974: ADD_I	add 	%r8, 0x0e40, %r5
	.word 0x86b20009  ! 975: SUBCcc_R	orncc 	%r8, %r9, %r3
	.word 0xb7780409  ! 975: MOVR_R	move	%r0, %r9, %r27
	.word 0x8c22284c  ! 975: SUB_I	sub 	%r8, 0x084c, %r6
	.word 0xb2120009  ! 975: OR_R	or 	%r8, %r9, %r25
	.word 0xa28a2708  ! 975: ANDcc_I	andcc 	%r8, 0x0708, %r17
	.word 0x8d323001  ! 975: SRLX_I	srlx	%r8, 0x0001, %r6
	.word 0x8ab20009  ! 975: SUBCcc_R	orncc 	%r8, %r9, %r5
	.word 0x8a3a2420  ! 975: XNOR_I	xnor 	%r8, 0x0420, %r5
	.word 0xaaaa0009  ! 975: ANDNcc_R	andncc 	%r8, %r9, %r21
	.word 0x8cb20009  ! 975: SUBCcc_R	orncc 	%r8, %r9, %r6
	.word 0x8aaa2390  ! 975: ANDNcc_I	andncc 	%r8, 0x0390, %r5
	.word 0x3a800001  ! 978: BCC	bcc,a	<label_0x1>
	.word 0x987a0009  ! 978: SDIV_R	sdiv 	%r8, %r9, %r12
	.word 0xb5321009  ! 989: SRLX_R	srlx	%r8, %r9, %r26
	.word 0x82020009  ! 989: ADD_R	add 	%r8, %r9, %r1
	.word 0xac320009  ! 989: SUBC_R	orn 	%r8, %r9, %r22
	.word 0x8d780409  ! 989: MOVR_R	move	%r0, %r9, %r6
	.word 0x852a3001  ! 989: SLLX_I	sllx	%r8, 0x0001, %r2
	.word 0x9c3a2d28  ! 989: XNOR_I	xnor 	%r8, 0x0d28, %r14
	.word 0x862223d8  ! 989: SUB_I	sub 	%r8, 0x03d8, %r3
	.word 0xb9323001  ! 989: SRLX_I	srlx	%r8, 0x0001, %r28
	.word 0x860a0009  ! 989: AND_R	and 	%r8, %r9, %r3
	.word 0x88920009  ! 989: ORcc_R	orcc 	%r8, %r9, %r4
	.word 0xbc1a0009  ! 989: XOR_R	xor 	%r8, %r9, %r30
	.word 0x849a0009  ! 989: XORcc_R	xorcc 	%r8, %r9, %r2
	.word 0xc6220009  ! 994: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc8020009  ! 994: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xc88a1009  ! 994: LDUBA_R	lduba	[%r8, %r9] 0x80, %r4
	.word 0xb2720009  ! 994: UDIV_R	udiv 	%r8, %r9, %r25
	.word 0x8b2a2001  ! 995: SLL_I	sll 	%r8, 0x0001, %r5
	.word 0x86b20009  ! 995: ORNcc_R	orncc 	%r8, %r9, %r3
	.word 0xbf2a2001  ! 995: SLL_I	sll 	%r8, 0x0001, %r31
	.word 0x83782401  ! 995: MOVR_I	move	%r0, 0x1, %r1
	.word 0xb9780409  ! 995: MOVR_R	move	%r0, %r9, %r28
	.word 0x86aa215c  ! 995: ANDNcc_I	andncc 	%r8, 0x015c, %r3
	.word 0xa73a0009  ! 995: SRA_R	sra 	%r8, %r9, %r19
	.word 0x9e3226d0  ! 995: SUBC_I	orn 	%r8, 0x06d0, %r15
	.word 0x9cba0009  ! 995: XNORcc_R	xnorcc 	%r8, %r9, %r14
	.word 0xb3321009  ! 995: SRLX_R	srlx	%r8, %r9, %r25
	.word 0x9f780409  ! 995: MOVR_R	move	%r0, %r9, %r15
	.word 0x8f323001  ! 995: SRLX_I	srlx	%r8, 0x0001, %r7
	.word 0x2c800001  ! 998: BNEG	bneg,a	<label_0x1>
	.word 0x8ef22b4c  ! 998: UDIVcc_I	udivcc 	%r8, 0x0b4c, %r7
	nop
	nop
	nop
        ta      T_GOOD_TRAP

th_main_3:
        setx  MAIN_BASE_DATA_VA, %r1, %r8
        setx  0x0000000000000a70, %g1, %r9
        setx  0x80, %g2, %g1
        wr  %g1, %g0, %asi
	    rd %fprs, %g1
        wr %g1, 0x4, %fprs
	ldd	[%r8 + 0], %f0
	ldd	[%r8 + 8], %f2
	ldd	[%r8 + 16], %f4
	ldd	[%r8 + 24], %f6
	ldd	[%r8 + 32], %f8
	ldd	[%r8 + 40], %f10
	ldd	[%r8 + 48], %f12
	ldd	[%r8 + 56], %f14
	ldd	[%r8 + 64], %f16
	ldd	[%r8 + 72], %f18
	ldd	[%r8 + 80], %f20
	ldd	[%r8 + 88], %f22
	ldd	[%r8 + 96], %f24
	ldd	[%r8 + 104], %f26
	ldd	[%r8 + 112], %f28
	ldd	[%r8 + 120], %f30
	ldd	[%r8 + 128], %f32
	ldd	[%r8 + 136], %f34
	ldd	[%r8 + 144], %f36
	ldd	[%r8 + 152], %f38
	ldd	[%r8 + 160], %f40
	ldd	[%r8 + 168], %f42
	ldd	[%r8 + 176], %f44
	ldd	[%r8 + 184], %f46
	ldd	[%r8 + 192], %f48
	ldd	[%r8 + 200], %f50
	ldd	[%r8 + 208], %f52
	ldd	[%r8 + 216], %f54
	ldd	[%r8 + 224], %f56
	ldd	[%r8 + 232], %f58
	ldd	[%r8 + 240], %f60
	ldd	[%r8 + 248], %f62
        setx  0x0b0d81f0fe3af56d, %g1, %r0
        setx  0x0a3eae6909e3226e, %g1, %r1
        setx  0xa2495705d46d52a4, %g1, %r2
        setx  0x2d9e5f15043844e5, %g1, %r3
        setx  0x7e09faa6b41e3b5f, %g1, %r4
        setx  0x1378554fe8c7ea0f, %g1, %r5
        setx  0x451bd698d5784bb2, %g1, %r6
        setx  0xa9cfe15e4b8b44f8, %g1, %r7
        setx  0xc6af7c420eceacd0, %g1, %r10
        setx  0x38c92734294f9e0a, %g1, %r11
        setx  0xf923bf91a0beadef, %g1, %r12
        setx  0x62f6d05fb5a0f1c3, %g1, %r13
        setx  0x1b33d7034741e8fe, %g1, %r14
        setx  0xcb5ccf4c3657a04e, %g1, %r15
        setx  0x206434f38d868fa2, %g1, %r16
        setx  0x9ab28d1371472bae, %g1, %r17
        setx  0x908cb67f8b23850a, %g1, %r18
        setx  0x3f209fd0519355ba, %g1, %r19
        setx  0x842823998005337e, %g1, %r20
        setx  0xefd36ea4e6e9313a, %g1, %r21
        setx  0xc4787cc8347a15e3, %g1, %r22
        setx  0xa273010e549103dd, %g1, %r23
        setx  0x4cd7b8fbba46e81b, %g1, %r24
        setx  0xdd3291283d17effe, %g1, %r25
        setx  0xf94c8d49300d31ac, %g1, %r26
        setx  0xe00e0fc930b1614c, %g1, %r27
        setx  0xabc0527c85b2ec13, %g1, %r28
        setx  0xc49efe1473900c0d, %g1, %r29
        setx  0x371a1b257dcd914c, %g1, %r30
        setx  0xa8996987094bf929, %g1, %r31
	.word 0xd82a0009  ! 10: STB_R	stb	%r12, [%r8 + %r9]
	.word 0xc2120009  ! 10: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0x826a0009  ! 10: UDIVX_R	udivx 	%r8, %r9, %r1
	.word 0x8b6a26c8  ! 10: SDIVX_I	sdivx	%r8, 0x06c8, %r5
	.word 0x8c822644  ! 12: ADDcc_I	addcc 	%r8, 0x0644, %r6
	.word 0xa8022ddc  ! 12: ADD_I	add 	%r8, 0x0ddc, %r20
	.word 0xbaba2790  ! 12: XNORcc_I	xnorcc 	%r8, 0x0790, %r29
	.word 0x883a0009  ! 12: XNOR_R	xnor 	%r8, %r9, %r4
	.word 0x8a42288c  ! 12: ADDC_I	addc 	%r8, 0x088c, %r5
	.word 0x86c22c20  ! 12: ADDCcc_I	addccc 	%r8, 0x0c20, %r3
	.word 0x98320009  ! 12: SUBC_R	orn 	%r8, %r9, %r12
	.word 0x829a2744  ! 12: XORcc_I	xorcc 	%r8, 0x0744, %r1
	.word 0x89323001  ! 12: SRLX_I	srlx	%r8, 0x0001, %r4
	.word 0x8e0a2d74  ! 12: AND_I	and 	%r8, 0x0d74, %r7
	.word 0xb0822730  ! 12: ADDcc_I	addcc 	%r8, 0x0730, %r24
	.word 0x8a2a2ea8  ! 13: ANDN_I	andn 	%r8, 0x0ea8, %r5
	.word 0x833a1009  ! 13: SRAX_R	srax	%r8, %r9, %r1
	.word 0xb3321009  ! 13: SRLX_R	srlx	%r8, %r9, %r25
	.word 0xacc20009  ! 13: ADDCcc_R	addccc 	%r8, %r9, %r22
	.word 0x88222e68  ! 13: SUB_I	sub 	%r8, 0x0e68, %r4
	.word 0x8d2a2001  ! 13: SLL_I	sll 	%r8, 0x0001, %r6
	.word 0x8f323001  ! 13: SRLX_I	srlx	%r8, 0x0001, %r7
	.word 0x82c20009  ! 13: ADDCcc_R	addccc 	%r8, %r9, %r1
	.word 0x89322001  ! 13: SRL_I	srl 	%r8, 0x0001, %r4
	.word 0x880a0009  ! 13: AND_R	and 	%r8, %r9, %r4
	.word 0x82ba2500  ! 13: XNORcc_I	xnorcc 	%r8, 0x0500, %r1
	.word 0x84222c48  ! 13: SUB_I	sub 	%r8, 0x0c48, %r2
	.word 0x0cca0001  ! 15: BRGZ	brgz  ,pt	%8,<label_0xa0001>
	.word 0x86722ce8  ! 15: UDIV_I	udiv 	%r8, 0x0ce8, %r3
	.word 0xe8320009  ! 21: STH_R	sth	%r20, [%r8 + %r9]
	.word 0xc5020009  ! 21: LDF_R	ld	[%r8, %r9], %f2
	.word 0xa88a0009  ! 21: ANDcc_R	andcc 	%r8, %r9, %r20
	.word 0xaaf22fa0  ! 21: UDIVcc_I	udivcc 	%r8, 0x0fa0, %r21
	.word 0xcc720009  ! 26: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xd9020009  ! 26: LDF_R	ld	[%r8, %r9], %f12
	.word 0xa96a2f24  ! 26: SDIVX_I	sdivx	%r8, 0x0f24, %r20
	.word 0xb56a2530  ! 26: SDIVX_I	sdivx	%r8, 0x0530, %r26
	.word 0x02800001  ! 29: BE	be  	<label_0x1>
	.word 0x86f22ea8  ! 29: UDIVcc_I	udivcc 	%r8, 0x0ea8, %r3
	.word 0x840a2f54  ! 31: AND_I	and 	%r8, 0x0f54, %r2
	.word 0xac120009  ! 31: OR_R	or 	%r8, %r9, %r22
	.word 0x883a0009  ! 31: XNOR_R	xnor 	%r8, %r9, %r4
	.word 0x84320009  ! 31: ORN_R	orn 	%r8, %r9, %r2
	.word 0x8a9a0009  ! 31: XORcc_R	xorcc 	%r8, %r9, %r5
	.word 0x8a220009  ! 31: SUB_R	sub 	%r8, %r9, %r5
	.word 0xad3a2001  ! 31: SRA_I	sra 	%r8, 0x0001, %r22
	.word 0x82222b8c  ! 31: SUB_I	sub 	%r8, 0x0b8c, %r1
	.word 0x88b22900  ! 31: SUBCcc_I	orncc 	%r8, 0x0900, %r4
	.word 0xa3323001  ! 31: SRLX_I	srlx	%r8, 0x0001, %r17
	.word 0x88420009  ! 31: ADDC_R	addc 	%r8, %r9, %r4
	.word 0x860a2ef8  ! 32: AND_I	and 	%r8, 0x0ef8, %r3
	.word 0x86320009  ! 32: SUBC_R	orn 	%r8, %r9, %r3
	.word 0x8a320009  ! 32: ORN_R	orn 	%r8, %r9, %r5
	.word 0x892a3001  ! 32: SLLX_I	sllx	%r8, 0x0001, %r4
	.word 0x82320009  ! 32: ORN_R	orn 	%r8, %r9, %r1
	.word 0x8b2a0009  ! 32: SLL_R	sll 	%r8, %r9, %r5
	.word 0x860a2840  ! 32: AND_I	and 	%r8, 0x0840, %r3
	.word 0x8e2a26e4  ! 32: ANDN_I	andn 	%r8, 0x06e4, %r7
	.word 0x869a29d4  ! 32: XORcc_I	xorcc 	%r8, 0x09d4, %r3
	.word 0x88ba0009  ! 32: XNORcc_R	xnorcc 	%r8, %r9, %r4
	.word 0x8a822af4  ! 32: ADDcc_I	addcc 	%r8, 0x0af4, %r5
	.word 0x84320009  ! 37: SUBC_R	orn 	%r8, %r9, %r2
	.word 0xbaa221c8  ! 37: SUBcc_I	subcc 	%r8, 0x01c8, %r29
	.word 0x82b20009  ! 37: SUBCcc_R	orncc 	%r8, %r9, %r1
	.word 0x882a2470  ! 37: ANDN_I	andn 	%r8, 0x0470, %r4
	.word 0x89320009  ! 37: SRL_R	srl 	%r8, %r9, %r4
	.word 0x94b20009  ! 37: SUBCcc_R	orncc 	%r8, %r9, %r10
	.word 0x8eba0009  ! 37: XNORcc_R	xnorcc 	%r8, %r9, %r7
	.word 0x853a2001  ! 37: SRA_I	sra 	%r8, 0x0001, %r2
	.word 0xb4120009  ! 37: OR_R	or 	%r8, %r9, %r26
	.word 0x86820009  ! 37: ADDcc_R	addcc 	%r8, %r9, %r3
	.word 0xb4aa0009  ! 37: ANDNcc_R	andncc 	%r8, %r9, %r26
	.word 0x8a420009  ! 37: ADDC_R	addc 	%r8, %r9, %r5
	.word 0x8eaa0009  ! 37: ANDNcc_R	andncc 	%r8, %r9, %r7
	.word 0xba12224c  ! 37: OR_I	or 	%r8, 0x024c, %r29
	.word 0x02ca0001  ! 40: BRZ	brz  ,pt	%8,<label_0xa0001>
	.word 0x82f22280  ! 40: UDIVcc_I	udivcc 	%r8, 0x0280, %r1
	.word 0xc9220009  ! 44: STF_R	st	%f4, [%r9, %r8]
	.word 0xce020009  ! 44: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0x836a0009  ! 44: SDIVX_R	sdivx	%r8, %r9, %r1
	.word 0x84722c48  ! 44: UDIV_I	udiv 	%r8, 0x0c48, %r2
	.word 0xe5220009  ! 48: STF_R	st	%f18, [%r9, %r8]
	.word 0xce020009  ! 48: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0x82820009  ! 48: ADDcc_R	addcc 	%r8, %r9, %r1
	.word 0x887225a8  ! 48: UDIV_I	udiv 	%r8, 0x05a8, %r4
	.word 0x0cc20001  ! 51: BRGZ	brgz  ,nt	%8,<label_0x20001>
	.word 0x8d6a0009  ! 51: SDIVX_R	sdivx	%r8, %r9, %r6
	.word 0x8c8a2454  ! 52: ANDcc_I	andcc 	%r8, 0x0454, %r6
	.word 0x988a2478  ! 52: ANDcc_I	andcc 	%r8, 0x0478, %r12
	.word 0xb6aa26a8  ! 52: ANDNcc_I	andncc 	%r8, 0x06a8, %r27
	.word 0x8f323001  ! 52: SRLX_I	srlx	%r8, 0x0001, %r7
	.word 0x868a24c0  ! 52: ANDcc_I	andcc 	%r8, 0x04c0, %r3
	.word 0x8e2a0009  ! 52: ANDN_R	andn 	%r8, %r9, %r7
	.word 0x8eaa2810  ! 52: ANDNcc_I	andncc 	%r8, 0x0810, %r7
	.word 0x852a1009  ! 52: SLLX_R	sllx	%r8, %r9, %r2
	.word 0xa6220009  ! 52: SUB_R	sub 	%r8, %r9, %r19
	.word 0x873a3001  ! 52: SRAX_I	srax	%r8, 0x0001, %r3
	.word 0x8c2a0009  ! 52: ANDN_R	andn 	%r8, %r9, %r6
	.word 0x842a0009  ! 53: ANDN_R	andn 	%r8, %r9, %r2
	.word 0x95643801  ! 53: MOVcc_I	<illegal instruction>
	.word 0x9aba0009  ! 53: XNORcc_R	xnorcc 	%r8, %r9, %r13
	.word 0xaaba0009  ! 53: XNORcc_R	xnorcc 	%r8, %r9, %r21
	.word 0x8b322001  ! 53: SRL_I	srl 	%r8, 0x0001, %r5
	.word 0x8b3a1009  ! 53: SRAX_R	srax	%r8, %r9, %r5
	.word 0x83321009  ! 53: SRLX_R	srlx	%r8, %r9, %r1
	.word 0x86420009  ! 53: ADDC_R	addc 	%r8, %r9, %r3
	.word 0x9ab20009  ! 53: SUBCcc_R	orncc 	%r8, %r9, %r13
	.word 0x84422748  ! 53: ADDC_I	addc 	%r8, 0x0748, %r2
	.word 0x8e920009  ! 53: ORcc_R	orcc 	%r8, %r9, %r7
	.word 0x84b20009  ! 59: SUBCcc_R	orncc 	%r8, %r9, %r2
	.word 0x8c922e78  ! 59: ORcc_I	orcc 	%r8, 0x0e78, %r6
	.word 0x96022244  ! 59: ADD_I	add 	%r8, 0x0244, %r11
	.word 0x82b22814  ! 59: SUBCcc_I	orncc 	%r8, 0x0814, %r1
	.word 0xad3a2001  ! 59: SRA_I	sra 	%r8, 0x0001, %r22
	.word 0x86820009  ! 59: ADDcc_R	addcc 	%r8, %r9, %r3
	.word 0x853a1009  ! 59: SRAX_R	srax	%r8, %r9, %r2
	.word 0x8e02245c  ! 59: ADD_I	add 	%r8, 0x045c, %r7
	.word 0x8d3a2001  ! 59: SRA_I	sra 	%r8, 0x0001, %r6
	.word 0x8c020009  ! 59: ADD_R	add 	%r8, %r9, %r6
	.word 0x9ca20009  ! 59: SUBcc_R	subcc 	%r8, %r9, %r14
	.word 0x852a0009  ! 59: SLL_R	sll 	%r8, %r9, %r2
	.word 0xa6c20009  ! 59: ADDCcc_R	addccc 	%r8, %r9, %r19
	.word 0x9a3227a0  ! 59: SUBC_I	orn 	%r8, 0x07a0, %r13
	.word 0xc4320009  ! 63: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc71a0009  ! 63: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0x82f20009  ! 63: UDIVcc_R	udivcc 	%r8, %r9, %r1
	.word 0x847220d0  ! 63: UDIV_I	udiv 	%r8, 0x00d0, %r2
	.word 0x2cca0001  ! 66: BRGZ	brgz,a,pt	%8,<label_0xa0001>
	.word 0x827a2174  ! 66: SDIV_I	sdiv 	%r8, 0x0174, %r1
	.word 0x00800002  ! 73: BN	bn  	<label_0x2>
	.word 0xa46a0009  ! 73: UDIVX_R	udivx 	%r8, %r9, %r18
	.word 0xf2320009  ! 77: STH_R	sth	%r25, [%r8 + %r9]
	.word 0xce520009  ! 77: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xbe6a0009  ! 77: UDIVX_R	udivx 	%r8, %r9, %r31
	.word 0x9c720009  ! 77: UDIV_R	udiv 	%r8, %r9, %r14
	.word 0x06800001  ! 79: BL	bl  	<label_0x1>
	.word 0x84722400  ! 79: UDIV_I	udiv 	%r8, 0x0400, %r2
	.word 0xcc720009  ! 83: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc91a0009  ! 83: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0x847a2bdc  ! 83: SDIV_I	sdiv 	%r8, 0x0bdc, %r2
	.word 0x88722cb0  ! 83: UDIV_I	udiv 	%r8, 0x0cb0, %r4
	.word 0x24ca0001  ! 90: BRLEZ	brlez,a,pt	%8,<label_0xa0001>
	.word 0x8f6a0009  ! 90: SDIVX_R	sdivx	%r8, %r9, %r7
	.word 0x8a1a0009  ! 93: XOR_R	xor 	%r8, %r9, %r5
	.word 0x8c220009  ! 93: SUB_R	sub 	%r8, %r9, %r6
	.word 0xb12a1009  ! 93: SLLX_R	sllx	%r8, %r9, %r24
	.word 0x94320009  ! 93: ORN_R	orn 	%r8, %r9, %r10
	.word 0x8e320009  ! 93: ORN_R	orn 	%r8, %r9, %r7
	.word 0x84120009  ! 93: OR_R	or 	%r8, %r9, %r2
	.word 0x8cb22e94  ! 93: SUBCcc_I	orncc 	%r8, 0x0e94, %r6
	.word 0x87780409  ! 93: MOVR_R	move	%r0, %r9, %r3
	.word 0x9892220c  ! 93: ORcc_I	orcc 	%r8, 0x020c, %r12
	.word 0x94c22fb8  ! 93: ADDCcc_I	addccc 	%r8, 0x0fb8, %r10
	.word 0x40000001  ! 96: CALL	call	disp30_1
	.word 0x8e7a2278  ! 96: SDIV_I	sdiv 	%r8, 0x0278, %r7
	.word 0x12800001  ! 99: BNE	bne  	<label_0x1>
	.word 0x856a2930  ! 99: SDIVX_I	sdivx	%r8, 0x0930, %r2
	.word 0x0a800002  ! 102: BCS	bcs  	<label_0x2>
	.word 0x8cfa0009  ! 102: SDIVcc_R	sdivcc 	%r8, %r9, %r6
	.word 0x28800001  ! 104: BLEU	bleu,a	<label_0x1>
	.word 0x86722778  ! 104: UDIV_I	udiv 	%r8, 0x0778, %r3
	.word 0xc2720009  ! 108: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc85a0009  ! 108: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0x9b6a2dd8  ! 108: SDIVX_I	sdivx	%r8, 0x0dd8, %r13
	.word 0xbaf2242c  ! 108: UDIVcc_I	udivcc 	%r8, 0x042c, %r29
	.word 0x8a3a29f4  ! 109: XNOR_I	xnor 	%r8, 0x09f4, %r5
	.word 0x99321009  ! 109: SRLX_R	srlx	%r8, %r9, %r12
	.word 0x9e9a0009  ! 109: XORcc_R	xorcc 	%r8, %r9, %r15
	.word 0x881226ac  ! 109: OR_I	or 	%r8, 0x06ac, %r4
	.word 0x8f321009  ! 109: SRLX_R	srlx	%r8, %r9, %r7
	.word 0x9e120009  ! 109: OR_R	or 	%r8, %r9, %r15
	.word 0x8ab20009  ! 109: ORNcc_R	orncc 	%r8, %r9, %r5
	.word 0xbc922988  ! 109: ORcc_I	orcc 	%r8, 0x0988, %r30
	.word 0x832a3001  ! 109: SLLX_I	sllx	%r8, 0x0001, %r1
	.word 0x869a0009  ! 109: XORcc_R	xorcc 	%r8, %r9, %r3
	.word 0x8aa20009  ! 109: SUBcc_R	subcc 	%r8, %r9, %r5
	.word 0x832a2001  ! 109: SLL_I	sll 	%r8, 0x0001, %r1
	.word 0x96422094  ! 111: ADDC_I	addc 	%r8, 0x0094, %r11
	.word 0x8e322cd4  ! 111: ORN_I	orn 	%r8, 0x0cd4, %r7
	.word 0xa41223ac  ! 111: OR_I	or 	%r8, 0x03ac, %r18
	.word 0x88122b0c  ! 111: OR_I	or 	%r8, 0x0b0c, %r4
	.word 0xae022edc  ! 111: ADD_I	add 	%r8, 0x0edc, %r23
	.word 0x848a2d18  ! 111: ANDcc_I	andcc 	%r8, 0x0d18, %r2
	.word 0xb93a3001  ! 111: SRAX_I	srax	%r8, 0x0001, %r28
	.word 0x8e022f24  ! 111: ADD_I	add 	%r8, 0x0f24, %r7
	.word 0x8e0a2e98  ! 111: AND_I	and 	%r8, 0x0e98, %r7
	.word 0x99320009  ! 111: SRL_R	srl 	%r8, %r9, %r12
	.word 0x82820009  ! 111: ADDcc_R	addcc 	%r8, %r9, %r1
	.word 0x882a0009  ! 111: ANDN_R	andn 	%r8, %r9, %r4
	.word 0x8aba0009  ! 111: XNORcc_R	xnorcc 	%r8, %r9, %r5
	.word 0xa1322001  ! 111: SRL_I	srl 	%r8, 0x0001, %r16
	.word 0xd53a0009  ! 116: STDF_R	std	%f10, [%r9, %r8]
	.word 0xc8120009  ! 116: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0x86f22db4  ! 116: UDIVcc_I	udivcc 	%r8, 0x0db4, %r3
	.word 0x9d6a0009  ! 116: SDIVX_R	sdivx	%r8, %r9, %r14
	.word 0xc3220009  ! 124: STF_R	st	%f1, [%r9, %r8]
	.word 0xc81a0009  ! 124: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x88f20009  ! 124: UDIVcc_R	udivcc 	%r8, %r9, %r4
	.word 0x9c6a2e84  ! 124: UDIVX_I	udivx 	%r8, 0x0e84, %r14
	.word 0x02c20001  ! 129: BRZ	brz  ,nt	%8,<label_0x20001>
	.word 0x8af22128  ! 129: UDIVcc_I	udivcc 	%r8, 0x0128, %r5
	.word 0xc6320009  ! 137: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xd91a0009  ! 137: LDDF_R	ldd	[%r8, %r9], %f12
	.word 0xc2ca2bd4  ! 137: LDSBA_I	ldsba	[%r8, + 0x0bd4] %asi, %r1
	.word 0xa26a0009  ! 137: UDIVX_R	udivx 	%r8, %r9, %r17
	.word 0x38800001  ! 139: BGU	bgu,a	<label_0x1>
	.word 0xa16a0009  ! 139: SDIVX_R	sdivx	%r8, %r9, %r16
	.word 0x1a800002  ! 142: BCC	bcc  	<label_0x2>
	.word 0x8c6a2ac4  ! 142: UDIVX_I	udivx 	%r8, 0x0ac4, %r6
	.word 0x1e800001  ! 145: BVC	bvc  	<label_0x1>
	.word 0x88f2207c  ! 145: UDIVcc_I	udivcc 	%r8, 0x007c, %r4
	.word 0x38800001  ! 147: BGU	bgu,a	<label_0x1>
	.word 0x886a2690  ! 147: UDIVX_I	udivx 	%r8, 0x0690, %r4
	.word 0x04ca0001  ! 151: BRLEZ	brlez  ,pt	%8,<label_0xa0001>
	.word 0x8b6a0009  ! 151: SDIVX_R	sdivx	%r8, %r9, %r5
	.word 0x12800001  ! 153: BNE	bne  	<label_0x1>
	.word 0xb07a0009  ! 153: SDIV_R	sdiv 	%r8, %r9, %r24
	.word 0x953a1009  ! 154: SRAX_R	srax	%r8, %r9, %r10
	.word 0xac220009  ! 154: SUB_R	sub 	%r8, %r9, %r22
	.word 0x868a224c  ! 154: ANDcc_I	andcc 	%r8, 0x024c, %r3
	.word 0xa0920009  ! 154: ORcc_R	orcc 	%r8, %r9, %r16
	.word 0x8e9a2004  ! 154: XORcc_I	xorcc 	%r8, 0x0004, %r7
	.word 0x869222e4  ! 154: ORcc_I	orcc 	%r8, 0x02e4, %r3
	.word 0x8d322001  ! 154: SRL_I	srl 	%r8, 0x0001, %r6
	.word 0x8a0a2784  ! 154: AND_I	and 	%r8, 0x0784, %r5
	.word 0x9cb22850  ! 154: ORNcc_I	orncc 	%r8, 0x0850, %r14
	.word 0x888a2a60  ! 154: ANDcc_I	andcc 	%r8, 0x0a60, %r4
	.word 0x873a3001  ! 154: SRAX_I	srax	%r8, 0x0001, %r3
	.word 0x852a3001  ! 154: SLLX_I	sllx	%r8, 0x0001, %r2
	.word 0x16800001  ! 156: BGE	bge  	<label_0x1>
	.word 0xa16a0009  ! 156: SDIVX_R	sdivx	%r8, %r9, %r16
	.word 0xe42a0009  ! 160: STB_R	stb	%r18, [%r8 + %r9]
	.word 0xc5020009  ! 160: LDF_R	ld	[%r8, %r9], %f2
	.word 0x8ef220fc  ! 160: UDIVcc_I	udivcc 	%r8, 0x00fc, %r7
	.word 0x84f20009  ! 160: UDIVcc_R	udivcc 	%r8, %r9, %r2
	.word 0xeb3a0009  ! 167: STDF_R	std	%f21, [%r9, %r8]
	.word 0xca420009  ! 167: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0x8e6a2564  ! 167: UDIVX_I	udivx 	%r8, 0x0564, %r7
	.word 0x8a6a2cfc  ! 167: UDIVX_I	udivx 	%r8, 0x0cfc, %r5
	.word 0x88b20009  ! 172: SUBCcc_R	orncc 	%r8, %r9, %r4
	.word 0x892a0009  ! 172: SLL_R	sll 	%r8, %r9, %r4
	.word 0xbeb20009  ! 172: SUBCcc_R	orncc 	%r8, %r9, %r31
	.word 0xbd2a0009  ! 172: SLL_R	sll 	%r8, %r9, %r30
	.word 0x840a241c  ! 172: AND_I	and 	%r8, 0x041c, %r2
	.word 0x8a8a2b50  ! 172: ANDcc_I	andcc 	%r8, 0x0b50, %r5
	.word 0x8b2a2001  ! 172: SLL_I	sll 	%r8, 0x0001, %r5
	.word 0xa49a0009  ! 172: XORcc_R	xorcc 	%r8, %r9, %r18
	.word 0xb73a2001  ! 172: SRA_I	sra 	%r8, 0x0001, %r27
	.word 0x82aa0009  ! 172: ANDNcc_R	andncc 	%r8, %r9, %r1
	.word 0x88920009  ! 172: ORcc_R	orcc 	%r8, %r9, %r4
	.word 0x22c20001  ! 175: BRZ	brz,a,nt	%8,<label_0x20001>
	.word 0x84fa0009  ! 175: SDIVcc_R	sdivcc 	%r8, %r9, %r2
	.word 0xe9220009  ! 180: STF_R	st	%f20, [%r9, %r8]
	.word 0xda420009  ! 180: LDSW_R	ldsw	[%r8 + %r9], %r13
	.word 0x856a299c  ! 180: SDIVX_I	sdivx	%r8, 0x099c, %r2
	.word 0x8c7a0009  ! 180: SDIV_R	sdiv 	%r8, %r9, %r6
	.word 0x22800002  ! 182: BE	be,a	<label_0x2>
	.word 0x8e7224f8  ! 182: UDIV_I	udiv 	%r8, 0x04f8, %r7
	.word 0xc42a0009  ! 188: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xcf1a0009  ! 188: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xcc5a2850  ! 188: LDX_I	ldx	[%r8 + 0x0850], %r6
	.word 0x8a6a0009  ! 188: UDIVX_R	udivx 	%r8, %r9, %r5
	.word 0x3a800001  ! 190: BCC	bcc,a	<label_0x1>
	.word 0x82722f30  ! 190: UDIV_I	udiv 	%r8, 0x0f30, %r1
	.word 0x1c800001  ! 194: BPOS	bpos  	<label_0x1>
	.word 0x88fa0009  ! 194: SDIVcc_R	sdivcc 	%r8, %r9, %r4
	.word 0x0eca0001  ! 197: BRGEZ	brgez  ,pt	%8,<label_0xa0001>
	.word 0x8a6a0009  ! 197: UDIVX_R	udivx 	%r8, %r9, %r5
	.word 0x84920009  ! 199: ORcc_R	orcc 	%r8, %r9, %r2
	.word 0x88ba2ffc  ! 199: XNORcc_I	xnorcc 	%r8, 0x0ffc, %r4
	.word 0x8f323001  ! 199: SRLX_I	srlx	%r8, 0x0001, %r7
	.word 0x8eb20009  ! 199: SUBCcc_R	orncc 	%r8, %r9, %r7
	.word 0x892a2001  ! 199: SLL_I	sll 	%r8, 0x0001, %r4
	.word 0x8f323001  ! 199: SRLX_I	srlx	%r8, 0x0001, %r7
	.word 0x833a0009  ! 199: SRA_R	sra 	%r8, %r9, %r1
	.word 0x889a0009  ! 199: XORcc_R	xorcc 	%r8, %r9, %r4
	.word 0xbd321009  ! 199: SRLX_R	srlx	%r8, %r9, %r30
	.word 0x84220009  ! 199: SUB_R	sub 	%r8, %r9, %r2
	.word 0x8e0a2520  ! 199: AND_I	and 	%r8, 0x0520, %r7
	.word 0xc6320009  ! 205: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc44a0009  ! 205: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0x9a920009  ! 205: ORcc_R	orcc 	%r8, %r9, %r13
	.word 0x8b323001  ! 205: SRLX_I	srlx	%r8, 0x0001, %r5
	.word 0x87780409  ! 205: MOVR_R	move	%r0, %r9, %r3
	.word 0x8c6a2dd8  ! 205: UDIVX_I	udivx 	%r8, 0x0dd8, %r6
	.word 0x8ec20009  ! 207: ADDCcc_R	addccc 	%r8, %r9, %r7
	.word 0xa6320009  ! 207: SUBC_R	orn 	%r8, %r9, %r19
	.word 0x82b20009  ! 207: ORNcc_R	orncc 	%r8, %r9, %r1
	.word 0x84020009  ! 207: ADD_R	add 	%r8, %r9, %r2
	.word 0x88aa2108  ! 207: ANDNcc_I	andncc 	%r8, 0x0108, %r4
	.word 0x832a0009  ! 207: SLL_R	sll 	%r8, %r9, %r1
	.word 0x8832217c  ! 207: ORN_I	orn 	%r8, 0x017c, %r4
	.word 0x8b2a0009  ! 207: SLL_R	sll 	%r8, %r9, %r5
	.word 0x8d2a1009  ! 207: SLLX_R	sllx	%r8, %r9, %r6
	.word 0x868a0009  ! 207: ANDcc_R	andcc 	%r8, %r9, %r3
	.word 0x84420009  ! 207: ADDC_R	addc 	%r8, %r9, %r2
	.word 0x8c8226bc  ! 207: ADDcc_I	addcc 	%r8, 0x06bc, %r6
	.word 0x87780409  ! 207: MOVR_R	move	%r0, %r9, %r3
	.word 0x893a0009  ! 207: SRA_R	sra 	%r8, %r9, %r4
	.word 0x82b20009  ! 207: ORNcc_R	orncc 	%r8, %r9, %r1
	.word 0xa6c222a0  ! 208: ADDCcc_I	addccc 	%r8, 0x02a0, %r19
	.word 0x84c20009  ! 208: ADDCcc_R	addccc 	%r8, %r9, %r2
	.word 0x8eb20009  ! 208: SUBCcc_R	orncc 	%r8, %r9, %r7
	.word 0x84a20009  ! 208: SUBcc_R	subcc 	%r8, %r9, %r2
	.word 0xb52a1009  ! 208: SLLX_R	sllx	%r8, %r9, %r26
	.word 0x8e8a0009  ! 208: ANDcc_R	andcc 	%r8, %r9, %r7
	.word 0xa4aa0009  ! 208: ANDNcc_R	andncc 	%r8, %r9, %r18
	.word 0xaeba0009  ! 208: XNORcc_R	xnorcc 	%r8, %r9, %r23
	.word 0x82920009  ! 208: ORcc_R	orcc 	%r8, %r9, %r1
	.word 0x86822aa4  ! 208: ADDcc_I	addcc 	%r8, 0x0aa4, %r3
	.word 0x8caa2760  ! 208: ANDNcc_I	andncc 	%r8, 0x0760, %r6
	.word 0x96322ab4  ! 208: ORN_I	orn 	%r8, 0x0ab4, %r11
	.word 0x22800001  ! 210: BE	be,a	<label_0x1>
	.word 0x9efa268c  ! 210: SDIVcc_I	sdivcc 	%r8, 0x068c, %r15
	.word 0x2a800001  ! 215: BCS	bcs,a	<label_0x1>
	.word 0x96f22af0  ! 215: UDIVcc_I	udivcc 	%r8, 0x0af0, %r11
	.word 0x853a1009  ! 216: SRAX_R	srax	%r8, %r9, %r2
	.word 0x822a2380  ! 216: ANDN_I	andn 	%r8, 0x0380, %r1
	.word 0x98aa0009  ! 216: ANDNcc_R	andncc 	%r8, %r9, %r12
	.word 0x862a29ac  ! 216: ANDN_I	andn 	%r8, 0x09ac, %r3
	.word 0x8a820009  ! 216: ADDcc_R	addcc 	%r8, %r9, %r5
	.word 0x833a0009  ! 216: SRA_R	sra 	%r8, %r9, %r1
	.word 0x82322218  ! 216: SUBC_I	orn 	%r8, 0x0218, %r1
	.word 0x87641809  ! 216: MOVcc_R	<illegal instruction>
	.word 0x84822cf0  ! 216: ADDcc_I	addcc 	%r8, 0x0cf0, %r2
	.word 0xa5323001  ! 216: SRLX_I	srlx	%r8, 0x0001, %r18
	.word 0x89782401  ! 216: MOVR_I	move	%r0, 0x1, %r4
	.word 0x8a1a0009  ! 216: XOR_R	xor 	%r8, %r9, %r5
	.word 0x840a24b4  ! 216: AND_I	and 	%r8, 0x04b4, %r2
	.word 0x963a2ac0  ! 216: XNOR_I	xnor 	%r8, 0x0ac0, %r11
	.word 0xcb220009  ! 220: STF_R	st	%f5, [%r9, %r8]
	.word 0xf84a0009  ! 220: LDSB_R	ldsb	[%r8 + %r9], %r28
	.word 0xc69227ac  ! 220: LDUHA_I	lduha	[%r8, + 0x07ac] %asi, %r3
	.word 0x867a0009  ! 220: SDIV_R	sdiv 	%r8, %r9, %r3
	.word 0xc22a0009  ! 224: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xfb020009  ! 224: LDF_R	ld	[%r8, %r9], %f29
	.word 0xca122fb0  ! 224: LDUH_I	lduh	[%r8 + 0x0fb0], %r5
	.word 0x8afa2648  ! 224: SDIVcc_I	sdivcc 	%r8, 0x0648, %r5
	.word 0xcf220009  ! 229: STF_R	st	%f7, [%r9, %r8]
	.word 0xdc120009  ! 229: LDUH_R	lduh	[%r8 + %r9], %r14
	.word 0x841a0009  ! 229: XOR_R	xor 	%r8, %r9, %r2
	.word 0xae7a0009  ! 229: SDIV_R	sdiv 	%r8, %r9, %r23
	.word 0x24800001  ! 232: BLE	ble,a	<label_0x1>
	.word 0x866a2230  ! 232: UDIVX_I	udivx 	%r8, 0x0230, %r3
	.word 0x1e800001  ! 236: BVC	bvc  	<label_0x1>
	.word 0xae6a2b50  ! 236: UDIVX_I	udivx 	%r8, 0x0b50, %r23
	.word 0x8e0a0009  ! 237: AND_R	and 	%r8, %r9, %r7
	.word 0xa4220009  ! 237: SUB_R	sub 	%r8, %r9, %r18
	.word 0x8a8a2db8  ! 237: ANDcc_I	andcc 	%r8, 0x0db8, %r5
	.word 0x96422524  ! 237: ADDC_I	addc 	%r8, 0x0524, %r11
	.word 0x8c1a0009  ! 237: XOR_R	xor 	%r8, %r9, %r6
	.word 0x9aa20009  ! 237: SUBcc_R	subcc 	%r8, %r9, %r13
	.word 0x8cc222e0  ! 237: ADDCcc_I	addccc 	%r8, 0x02e0, %r6
	.word 0x8e322c58  ! 237: ORN_I	orn 	%r8, 0x0c58, %r7
	.word 0x8e820009  ! 237: ADDcc_R	addcc 	%r8, %r9, %r7
	.word 0xa0c20009  ! 237: ADDCcc_R	addccc 	%r8, %r9, %r16
	.word 0xbb643801  ! 237: MOVcc_I	<illegal instruction>
	.word 0x8a120009  ! 237: OR_R	or 	%r8, %r9, %r5
	.word 0xa6b20009  ! 237: SUBCcc_R	orncc 	%r8, %r9, %r19
	.word 0x84aa0009  ! 237: ANDNcc_R	andncc 	%r8, %r9, %r2
	.word 0x1a800001  ! 240: BCC	bcc  	<label_0x1>
	.word 0x88fa0009  ! 240: SDIVcc_R	sdivcc 	%r8, %r9, %r4
	.word 0x8eaa2178  ! 243: ANDNcc_I	andncc 	%r8, 0x0178, %r7
	.word 0x86020009  ! 243: ADD_R	add 	%r8, %r9, %r3
	.word 0x82220009  ! 243: SUB_R	sub 	%r8, %r9, %r1
	.word 0x893a0009  ! 243: SRA_R	sra 	%r8, %r9, %r4
	.word 0x8f2a3001  ! 243: SLLX_I	sllx	%r8, 0x0001, %r7
	.word 0xac0a2ae8  ! 243: AND_I	and 	%r8, 0x0ae8, %r22
	.word 0x9aa20009  ! 243: SUBcc_R	subcc 	%r8, %r9, %r13
	.word 0x8f2a0009  ! 243: SLL_R	sll 	%r8, %r9, %r7
	.word 0x853a2001  ! 243: SRA_I	sra 	%r8, 0x0001, %r2
	.word 0x8e9229ac  ! 243: ORcc_I	orcc 	%r8, 0x09ac, %r7
	.word 0x9a0a0009  ! 243: AND_R	and 	%r8, %r9, %r13
	.word 0x8f3a2001  ! 243: SRA_I	sra 	%r8, 0x0001, %r7
	.word 0x3a800001  ! 245: BCC	bcc,a	<label_0x1>
	.word 0x84f20009  ! 245: UDIVcc_R	udivcc 	%r8, %r9, %r2
	.word 0xcd220009  ! 250: STF_R	st	%f6, [%r9, %r8]
	.word 0xec1a0009  ! 250: LDD_R	ldd	[%r8 + %r9], %r22
	.word 0x829220e8  ! 250: ORcc_I	orcc 	%r8, 0x00e8, %r1
	.word 0x856a2674  ! 250: SDIVX_I	sdivx	%r8, 0x0674, %r2
	.word 0xfa220009  ! 257: STW_R	stw	%r29, [%r8 + %r9]
	.word 0xc4020009  ! 257: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0x827a2070  ! 257: SDIV_I	sdiv 	%r8, 0x0070, %r1
	.word 0x8d6a220c  ! 257: SDIVX_I	sdivx	%r8, 0x020c, %r6
	.word 0x36800001  ! 259: BGE	bge,a	<label_0x1>
	.word 0x956a20f8  ! 259: SDIVX_I	sdivx	%r8, 0x00f8, %r10
	.word 0x24ca0001  ! 261: BRLEZ	brlez,a,pt	%8,<label_0xa0001>
	.word 0x847a0009  ! 261: SDIV_R	sdiv 	%r8, %r9, %r2
	.word 0xc5220009  ! 266: STF_R	st	%f2, [%r9, %r8]
	.word 0xce420009  ! 266: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xa0fa287c  ! 266: SDIVcc_I	sdivcc 	%r8, 0x087c, %r16
	.word 0xa4722658  ! 266: UDIV_I	udiv 	%r8, 0x0658, %r18
	.word 0xd4320009  ! 271: STH_R	sth	%r10, [%r8 + %r9]
	.word 0xcf1a0009  ! 271: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0x8f6a0009  ! 271: SDIVX_R	sdivx	%r8, %r9, %r7
	.word 0x896a21c0  ! 271: SDIVX_I	sdivx	%r8, 0x01c0, %r4
	.word 0xcd3a0009  ! 281: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc65a0009  ! 281: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0x96720009  ! 281: UDIV_R	udiv 	%r8, %r9, %r11
	.word 0x86fa2ac8  ! 281: SDIVcc_I	sdivcc 	%r8, 0x0ac8, %r3
	.word 0x852a3001  ! 282: SLLX_I	sllx	%r8, 0x0001, %r2
	.word 0x8c422a54  ! 282: ADDC_I	addc 	%r8, 0x0a54, %r6
	.word 0xaac20009  ! 282: ADDCcc_R	addccc 	%r8, %r9, %r21
	.word 0xb4920009  ! 282: ORcc_R	orcc 	%r8, %r9, %r26
	.word 0x97780409  ! 282: MOVR_R	move	%r0, %r9, %r11
	.word 0x8b3a3001  ! 282: SRAX_I	srax	%r8, 0x0001, %r5
	.word 0x8cb20009  ! 282: ORNcc_R	orncc 	%r8, %r9, %r6
	.word 0x8c322200  ! 282: ORN_I	orn 	%r8, 0x0200, %r6
	.word 0x84320009  ! 282: ORN_R	orn 	%r8, %r9, %r2
	.word 0x8eb22344  ! 282: ORNcc_I	orncc 	%r8, 0x0344, %r7
	.word 0x8cba2acc  ! 282: XNORcc_I	xnorcc 	%r8, 0x0acc, %r6
	.word 0x84a22e4c  ! 282: SUBcc_I	subcc 	%r8, 0x0e4c, %r2
	.word 0xb6b20009  ! 282: ORNcc_R	orncc 	%r8, %r9, %r27
	.word 0x06800001  ! 286: BL	bl  	<label_0x1>
	.word 0x8e720009  ! 286: UDIV_R	udiv 	%r8, %r9, %r7
	.word 0xf4720009  ! 290: STX_R	stx	%r26, [%r8 + %r9]
	.word 0xc64a0009  ! 290: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xa27a24d8  ! 290: SDIV_I	sdiv 	%r8, 0x04d8, %r17
	.word 0xb8f221dc  ! 290: UDIVcc_I	udivcc 	%r8, 0x01dc, %r28
	.word 0xcd3a0009  ! 295: STDF_R	std	%f6, [%r9, %r8]
	.word 0xcc1a0009  ! 295: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0x82f20009  ! 295: UDIVcc_R	udivcc 	%r8, %r9, %r1
	.word 0x82f20009  ! 295: UDIVcc_R	udivcc 	%r8, %r9, %r1
	.word 0xee720009  ! 303: STX_R	stx	%r23, [%r8 + %r9]
	.word 0xe40a0009  ! 303: LDUB_R	ldub	[%r8 + %r9], %r18
	.word 0xce520009  ! 303: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0x866a0009  ! 303: UDIVX_R	udivx 	%r8, %r9, %r3
	.word 0x8ec229ec  ! 305: ADDCcc_I	addccc 	%r8, 0x09ec, %r7
	.word 0x89320009  ! 305: SRL_R	srl 	%r8, %r9, %r4
	.word 0xa4820009  ! 305: ADDcc_R	addcc 	%r8, %r9, %r18
	.word 0xa62a2224  ! 305: ANDN_I	andn 	%r8, 0x0224, %r19
	.word 0x861a20dc  ! 305: XOR_I	xor 	%r8, 0x00dc, %r3
	.word 0x9a0a0009  ! 305: AND_R	and 	%r8, %r9, %r13
	.word 0x86222390  ! 305: SUB_I	sub 	%r8, 0x0390, %r3
	.word 0x85643801  ! 305: MOVcc_I	<illegal instruction>
	.word 0xa3643801  ! 305: MOVcc_I	<illegal instruction>
	.word 0x822a0009  ! 305: ANDN_R	andn 	%r8, %r9, %r1
	.word 0x8e1a0009  ! 305: XOR_R	xor 	%r8, %r9, %r7
	.word 0x9a9223a8  ! 305: ORcc_I	orcc 	%r8, 0x03a8, %r13
	.word 0xe42a0009  ! 309: STB_R	stb	%r18, [%r8 + %r9]
	.word 0xc25a0009  ! 309: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xb06a278c  ! 309: UDIVX_I	udivx 	%r8, 0x078c, %r24
	.word 0x82720009  ! 309: UDIV_R	udiv 	%r8, %r9, %r1
	.word 0xb52a2001  ! 310: SLL_I	sll 	%r8, 0x0001, %r26
	.word 0x940223d0  ! 310: ADD_I	add 	%r8, 0x03d0, %r10
	.word 0x82220009  ! 310: SUB_R	sub 	%r8, %r9, %r1
	.word 0xbc9a0009  ! 310: XORcc_R	xorcc 	%r8, %r9, %r30
	.word 0x8a9a261c  ! 310: XORcc_I	xorcc 	%r8, 0x061c, %r5
	.word 0x86322cd4  ! 310: ORN_I	orn 	%r8, 0x0cd4, %r3
	.word 0x972a1009  ! 310: SLLX_R	sllx	%r8, %r9, %r11
	.word 0x82820009  ! 310: ADDcc_R	addcc 	%r8, %r9, %r1
	.word 0x843a2c6c  ! 310: XNOR_I	xnor 	%r8, 0x0c6c, %r2
	.word 0x8b3a1009  ! 310: SRAX_R	srax	%r8, %r9, %r5
	.word 0x852a0009  ! 310: SLL_R	sll 	%r8, %r9, %r2
	.word 0xa6ba0009  ! 310: XNORcc_R	xnorcc 	%r8, %r9, %r19
	.word 0xa9320009  ! 310: SRL_R	srl 	%r8, %r9, %r20
	.word 0x8f3a1009  ! 310: SRAX_R	srax	%r8, %r9, %r7
	.word 0xbcba2bec  ! 311: XNORcc_I	xnorcc 	%r8, 0x0bec, %r30
	.word 0xa81a2360  ! 311: XOR_I	xor 	%r8, 0x0360, %r20
	.word 0x98ba2d8c  ! 311: XNORcc_I	xnorcc 	%r8, 0x0d8c, %r12
	.word 0xb72a3001  ! 311: SLLX_I	sllx	%r8, 0x0001, %r27
	.word 0x8c322358  ! 311: SUBC_I	orn 	%r8, 0x0358, %r6
	.word 0xa9323001  ! 311: SRLX_I	srlx	%r8, 0x0001, %r20
	.word 0xa1780409  ! 311: MOVR_R	move	%r0, %r9, %r16
	.word 0x8eb20009  ! 311: SUBCcc_R	orncc 	%r8, %r9, %r7
	.word 0x873a3001  ! 311: SRAX_I	srax	%r8, 0x0001, %r3
	.word 0x892a1009  ! 311: SLLX_R	sllx	%r8, %r9, %r4
	.word 0x881a2ac8  ! 311: XOR_I	xor 	%r8, 0x0ac8, %r4
	.word 0x06800001  ! 314: BL	bl  	<label_0x1>
	.word 0x8cf220ec  ! 314: UDIVcc_I	udivcc 	%r8, 0x00ec, %r6
	.word 0x87782401  ! 315: MOVR_I	move	%r0, 0x9, %r3
	.word 0x84222c84  ! 315: SUB_I	sub 	%r8, 0x0c84, %r2
	.word 0x84ba20e8  ! 315: XNORcc_I	xnorcc 	%r8, 0x00e8, %r2
	.word 0xb2ba2a50  ! 315: XNORcc_I	xnorcc 	%r8, 0x0a50, %r25
	.word 0x8a422410  ! 315: ADDC_I	addc 	%r8, 0x0410, %r5
	.word 0x85643801  ! 315: MOVcc_I	<illegal instruction>
	.word 0x8e322390  ! 315: SUBC_I	orn 	%r8, 0x0390, %r7
	.word 0x8aaa0009  ! 315: ANDNcc_R	andncc 	%r8, %r9, %r5
	.word 0x8aba0009  ! 315: XNORcc_R	xnorcc 	%r8, %r9, %r5
	.word 0x843a0009  ! 315: XNOR_R	xnor 	%r8, %r9, %r2
	.word 0x852a3001  ! 317: SLLX_I	sllx	%r8, 0x0001, %r2
	.word 0x8cc22ec4  ! 317: ADDCcc_I	addccc 	%r8, 0x0ec4, %r6
	.word 0x8f323001  ! 317: SRLX_I	srlx	%r8, 0x0001, %r7
	.word 0x8c920009  ! 317: ORcc_R	orcc 	%r8, %r9, %r6
	.word 0x8ca20009  ! 317: SUBcc_R	subcc 	%r8, %r9, %r6
	.word 0xa0422e90  ! 317: ADDC_I	addc 	%r8, 0x0e90, %r16
	.word 0x8ab20009  ! 317: ORNcc_R	orncc 	%r8, %r9, %r5
	.word 0x852a0009  ! 317: SLL_R	sll 	%r8, %r9, %r2
	.word 0x8e9a0009  ! 317: XORcc_R	xorcc 	%r8, %r9, %r7
	.word 0x8802292c  ! 317: ADD_I	add 	%r8, 0x092c, %r4
	.word 0xa4422820  ! 317: ADDC_I	addc 	%r8, 0x0820, %r18
	.word 0xca720009  ! 321: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xca5a0009  ! 321: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xc81a0009  ! 321: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x8ef20009  ! 321: UDIVcc_R	udivcc 	%r8, %r9, %r7
	.word 0x87323001  ! 323: SRLX_I	srlx	%r8, 0x0001, %r3
	.word 0x8b322001  ! 323: SRL_I	srl 	%r8, 0x0001, %r5
	.word 0x88320009  ! 323: ORN_R	orn 	%r8, %r9, %r4
	.word 0x8d323001  ! 323: SRLX_I	srlx	%r8, 0x0001, %r6
	.word 0x8c1a2434  ! 323: XOR_I	xor 	%r8, 0x0434, %r6
	.word 0x88920009  ! 323: ORcc_R	orcc 	%r8, %r9, %r4
	.word 0x94aa0009  ! 323: ANDNcc_R	andncc 	%r8, %r9, %r10
	.word 0x953a1009  ! 323: SRAX_R	srax	%r8, %r9, %r10
	.word 0x872a2001  ! 323: SLL_I	sll 	%r8, 0x0001, %r3
	.word 0xa53a0009  ! 323: SRA_R	sra 	%r8, %r9, %r18
	.word 0x8c9a0009  ! 323: XORcc_R	xorcc 	%r8, %r9, %r6
	.word 0xbca2246c  ! 323: SUBcc_I	subcc 	%r8, 0x046c, %r30
	.word 0x82220009  ! 323: SUB_R	sub 	%r8, %r9, %r1
	.word 0x849a2544  ! 323: XORcc_I	xorcc 	%r8, 0x0544, %r2
	.word 0x8d643801  ! 324: MOVcc_I	<illegal instruction>
	.word 0x889a24a8  ! 324: XORcc_I	xorcc 	%r8, 0x04a8, %r4
	.word 0x82420009  ! 324: ADDC_R	addc 	%r8, %r9, %r1
	.word 0x8e820009  ! 324: ADDcc_R	addcc 	%r8, %r9, %r7
	.word 0x8f3a3001  ! 324: SRAX_I	srax	%r8, 0x0001, %r7
	.word 0x82b20009  ! 324: SUBCcc_R	orncc 	%r8, %r9, %r1
	.word 0x8a020009  ! 324: ADD_R	add 	%r8, %r9, %r5
	.word 0x8a920009  ! 324: ORcc_R	orcc 	%r8, %r9, %r5
	.word 0x822a2544  ! 324: ANDN_I	andn 	%r8, 0x0544, %r1
	.word 0x84c20009  ! 324: ADDCcc_R	addccc 	%r8, %r9, %r2
	.word 0xf2220009  ! 329: STW_R	stw	%r25, [%r8 + %r9]
	.word 0xc64a0009  ! 329: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0x8ca20009  ! 329: SUBcc_R	subcc 	%r8, %r9, %r6
	.word 0xb8fa0009  ! 329: SDIVcc_R	sdivcc 	%r8, %r9, %r28
	.word 0xf0320009  ! 334: STH_R	sth	%r24, [%r8 + %r9]
	.word 0xc5020009  ! 334: LDF_R	ld	[%r8, %r9], %f2
	.word 0x96f20009  ! 334: UDIVcc_R	udivcc 	%r8, %r9, %r11
	.word 0x876a0009  ! 334: SDIVX_R	sdivx	%r8, %r9, %r3
	.word 0xcf3a0009  ! 338: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc31a0009  ! 338: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xb8720009  ! 338: UDIV_R	udiv 	%r8, %r9, %r28
	.word 0x8c6a0009  ! 338: UDIVX_R	udivx 	%r8, %r9, %r6
	.word 0x2e800001  ! 342: BVS	bvs,a	<label_0x1>
	.word 0x8e722cd0  ! 342: UDIV_I	udiv 	%r8, 0x0cd0, %r7
	.word 0xed3a0009  ! 346: STDF_R	std	%f22, [%r9, %r8]
	.word 0xc40a0009  ! 346: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0x867a2c3c  ! 346: SDIV_I	sdiv 	%r8, 0x0c3c, %r3
	.word 0x8a6a0009  ! 346: UDIVX_R	udivx 	%r8, %r9, %r5
	.word 0x30800002  ! 348: BA	ba,a	<label_0x2>
	.word 0x9afa2bf0  ! 348: SDIVcc_I	sdivcc 	%r8, 0x0bf0, %r13
	.word 0xce2a0009  ! 352: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc44a0009  ! 352: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0x886a202c  ! 352: UDIVX_I	udivx 	%r8, 0x002c, %r4
	.word 0x9cf20009  ! 352: UDIVcc_R	udivcc 	%r8, %r9, %r14
	.word 0x18800001  ! 354: BGU	bgu  	<label_0x1>
	.word 0x88f20009  ! 354: UDIVcc_R	udivcc 	%r8, %r9, %r4
	.word 0x18800002  ! 357: BGU	bgu  	<label_0x2>
	.word 0x866a26a8  ! 357: UDIVX_I	udivx 	%r8, 0x06a8, %r3
	.word 0xcc220009  ! 361: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xd7020009  ! 361: LDF_R	ld	[%r8, %r9], %f11
	.word 0xc64a0009  ! 361: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0x8a7a23f8  ! 361: SDIV_I	sdiv 	%r8, 0x03f8, %r5
	.word 0x821a0009  ! 362: XOR_R	xor 	%r8, %r9, %r1
	.word 0x8b322001  ! 362: SRL_I	srl 	%r8, 0x0001, %r5
	.word 0x8d3a1009  ! 362: SRAX_R	srax	%r8, %r9, %r6
	.word 0xbd782401  ! 362: MOVR_I	move	%r0, 0x9, %r30
	.word 0x94322888  ! 362: SUBC_I	orn 	%r8, 0x0888, %r10
	.word 0x8a820009  ! 362: ADDcc_R	addcc 	%r8, %r9, %r5
	.word 0x8b641809  ! 362: MOVcc_R	<illegal instruction>
	.word 0x88a22a4c  ! 362: SUBcc_I	subcc 	%r8, 0x0a4c, %r4
	.word 0x8c820009  ! 362: ADDcc_R	addcc 	%r8, %r9, %r6
	.word 0xb7321009  ! 362: SRLX_R	srlx	%r8, %r9, %r27
	.word 0xba8a0009  ! 362: ANDcc_R	andcc 	%r8, %r9, %r29
	.word 0x2cc20001  ! 364: BRGZ	brgz,a,nt	%8,<label_0x20001>
	.word 0xbe6a2734  ! 364: UDIVX_I	udivx 	%r8, 0x0734, %r31
	.word 0x8b321009  ! 365: SRLX_R	srlx	%r8, %r9, %r5
	.word 0x8a8a2e5c  ! 365: ANDcc_I	andcc 	%r8, 0x0e5c, %r5
	.word 0x8e2a2954  ! 365: ANDN_I	andn 	%r8, 0x0954, %r7
	.word 0x88320009  ! 365: SUBC_R	orn 	%r8, %r9, %r4
	.word 0xa8322498  ! 365: ORN_I	orn 	%r8, 0x0498, %r20
	.word 0x869a2220  ! 365: XORcc_I	xorcc 	%r8, 0x0220, %r3
	.word 0x852a3001  ! 365: SLLX_I	sllx	%r8, 0x0001, %r2
	.word 0xb1780409  ! 365: MOVR_R	move	%r0, %r9, %r24
	.word 0x84120009  ! 365: OR_R	or 	%r8, %r9, %r2
	.word 0x8b643801  ! 365: MOVcc_I	<illegal instruction>
	.word 0x8e122920  ! 365: OR_I	or 	%r8, 0x0920, %r7
	.word 0xbd782401  ! 365: MOVR_I	move	%r0, 0x920, %r30
	.word 0x8b2a1009  ! 366: SLLX_R	sllx	%r8, %r9, %r5
	.word 0x8b643801  ! 366: MOVcc_I	<illegal instruction>
	.word 0x8f3a3001  ! 366: SRAX_I	srax	%r8, 0x0001, %r7
	.word 0x8c8a0009  ! 366: ANDcc_R	andcc 	%r8, %r9, %r6
	.word 0x84ba0009  ! 366: XNORcc_R	xnorcc 	%r8, %r9, %r2
	.word 0x99782401  ! 366: MOVR_I	move	%r0, 0x9, %r12
	.word 0x8f641809  ! 366: MOVcc_R	<illegal instruction>
	.word 0x96a20009  ! 366: SUBcc_R	subcc 	%r8, %r9, %r11
	.word 0x88aa2818  ! 366: ANDNcc_I	andncc 	%r8, 0x0818, %r4
	.word 0x85321009  ! 366: SRLX_R	srlx	%r8, %r9, %r2
	.word 0xb8320009  ! 366: ORN_R	orn 	%r8, %r9, %r28
	.word 0x9ab20009  ! 366: ORNcc_R	orncc 	%r8, %r9, %r13
	.word 0xb49a2adc  ! 366: XORcc_I	xorcc 	%r8, 0x0adc, %r26
	.word 0x87321009  ! 366: SRLX_R	srlx	%r8, %r9, %r3
	.word 0xa60a2d44  ! 366: AND_I	and 	%r8, 0x0d44, %r19
	.word 0x0e800001  ! 369: BVS	bvs  	<label_0x1>
	.word 0xa4f22e60  ! 369: UDIVcc_I	udivcc 	%r8, 0x0e60, %r18
	.word 0xcc220009  ! 373: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xee0a0009  ! 373: LDUB_R	ldub	[%r8 + %r9], %r23
	.word 0x8b6a2ecc  ! 373: SDIVX_I	sdivx	%r8, 0x0ecc, %r5
	.word 0x867a22ec  ! 373: SDIV_I	sdiv 	%r8, 0x02ec, %r3
	.word 0xf2220009  ! 377: STW_R	stw	%r25, [%r8 + %r9]
	.word 0xe7020009  ! 377: LDF_R	ld	[%r8, %r9], %f19
	.word 0x876a0009  ! 377: SDIVX_R	sdivx	%r8, %r9, %r3
	.word 0x9af20009  ! 377: UDIVcc_R	udivcc 	%r8, %r9, %r13
	.word 0x86022d44  ! 378: ADD_I	add 	%r8, 0x0d44, %r3
	.word 0x8eaa2e30  ! 378: ANDNcc_I	andncc 	%r8, 0x0e30, %r7
	.word 0x86320009  ! 378: SUBC_R	orn 	%r8, %r9, %r3
	.word 0x880a0009  ! 378: AND_R	and 	%r8, %r9, %r4
	.word 0x8e2a2c7c  ! 378: ANDN_I	andn 	%r8, 0x0c7c, %r7
	.word 0x86020009  ! 378: ADD_R	add 	%r8, %r9, %r3
	.word 0x8e2229a0  ! 378: SUB_I	sub 	%r8, 0x09a0, %r7
	.word 0x8b2a3001  ! 378: SLLX_I	sllx	%r8, 0x0001, %r5
	.word 0x85320009  ! 378: SRL_R	srl 	%r8, %r9, %r2
	.word 0x828a0009  ! 378: ANDcc_R	andcc 	%r8, %r9, %r1
	.word 0x829a0009  ! 378: XORcc_R	xorcc 	%r8, %r9, %r1
	.word 0x95323001  ! 378: SRLX_I	srlx	%r8, 0x0001, %r10
	.word 0x943a2e88  ! 378: XNOR_I	xnor 	%r8, 0x0e88, %r10
	.word 0x12800002  ! 382: BNE	bne  	<label_0x2>
	.word 0x8c7a2b04  ! 382: SDIV_I	sdiv 	%r8, 0x0b04, %r6
	.word 0x00800001  ! 384: BN	bn  	<label_0x1>
	.word 0x82fa224c  ! 384: SDIVcc_I	sdivcc 	%r8, 0x024c, %r1
	.word 0x9aa22114  ! 385: SUBcc_I	subcc 	%r8, 0x0114, %r13
	.word 0x852a2001  ! 385: SLL_I	sll 	%r8, 0x0001, %r2
	.word 0x87320009  ! 385: SRL_R	srl 	%r8, %r9, %r3
	.word 0xbca20009  ! 385: SUBcc_R	subcc 	%r8, %r9, %r30
	.word 0x8e1a2f28  ! 385: XOR_I	xor 	%r8, 0x0f28, %r7
	.word 0x861a0009  ! 385: XOR_R	xor 	%r8, %r9, %r3
	.word 0xa0122870  ! 385: OR_I	or 	%r8, 0x0870, %r16
	.word 0x84b20009  ! 385: ORNcc_R	orncc 	%r8, %r9, %r2
	.word 0x841a0009  ! 385: XOR_R	xor 	%r8, %r9, %r2
	.word 0x8e122250  ! 385: OR_I	or 	%r8, 0x0250, %r7
	.word 0x988a203c  ! 385: ANDcc_I	andcc 	%r8, 0x003c, %r12
	.word 0xbc020009  ! 385: ADD_R	add 	%r8, %r9, %r30
	.word 0x88aa0009  ! 385: ANDNcc_R	andncc 	%r8, %r9, %r4
	.word 0xaa9a2198  ! 385: XORcc_I	xorcc 	%r8, 0x0198, %r21
	.word 0xc6320009  ! 389: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc85a0009  ! 389: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xca1225e0  ! 389: LDUH_I	lduh	[%r8 + 0x05e0], %r5
	.word 0x9cfa29b0  ! 389: SDIVcc_I	sdivcc 	%r8, 0x09b0, %r14
	.word 0x1c800001  ! 393: BPOS	bpos  	<label_0x1>
	.word 0x8e720009  ! 393: UDIV_R	udiv 	%r8, %r9, %r7
	.word 0x16800001  ! 397: BGE	bge  	<label_0x1>
	.word 0x8efa0009  ! 397: SDIVcc_R	sdivcc 	%r8, %r9, %r7
	.word 0xc62a0009  ! 402: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xcd1a0009  ! 402: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0x8c6a0009  ! 402: UDIVX_R	udivx 	%r8, %r9, %r6
	.word 0x8c7a2bf4  ! 402: SDIV_I	sdiv 	%r8, 0x0bf4, %r6
	.word 0x02c20001  ! 408: BRZ	brz  ,nt	%8,<label_0x20001>
	.word 0x86f20009  ! 408: UDIVcc_R	udivcc 	%r8, %r9, %r3
	.word 0xe2220009  ! 412: STW_R	stw	%r17, [%r8 + %r9]
	.word 0xf45a0009  ! 412: LDX_R	ldx	[%r8 + %r9], %r26
	.word 0x82b20009  ! 412: SUBCcc_R	orncc 	%r8, %r9, %r1
	.word 0x8af20009  ! 412: UDIVcc_R	udivcc 	%r8, %r9, %r5
	.word 0x832a0009  ! 417: SLL_R	sll 	%r8, %r9, %r1
	.word 0x8ea20009  ! 417: SUBcc_R	subcc 	%r8, %r9, %r7
	.word 0x86a20009  ! 417: SUBcc_R	subcc 	%r8, %r9, %r3
	.word 0x8a3a0009  ! 417: XNOR_R	xnor 	%r8, %r9, %r5
	.word 0x88c22440  ! 417: ADDCcc_I	addccc 	%r8, 0x0440, %r4
	.word 0xbf321009  ! 417: SRLX_R	srlx	%r8, %r9, %r31
	.word 0x88a20009  ! 417: SUBcc_R	subcc 	%r8, %r9, %r4
	.word 0x88b20009  ! 417: SUBCcc_R	orncc 	%r8, %r9, %r4
	.word 0x8b2a0009  ! 417: SLL_R	sll 	%r8, %r9, %r5
	.word 0xacaa2eb0  ! 417: ANDNcc_I	andncc 	%r8, 0x0eb0, %r22
	.word 0x822a0009  ! 417: ANDN_R	andn 	%r8, %r9, %r1
	.word 0x9f2a3001  ! 417: SLLX_I	sllx	%r8, 0x0001, %r15
	.word 0x8f2a2001  ! 417: SLL_I	sll 	%r8, 0x0001, %r7
	.word 0xc8720009  ! 421: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xcf020009  ! 421: LDF_R	ld	[%r8, %r9], %f7
	.word 0xa26a21bc  ! 421: UDIVX_I	udivx 	%r8, 0x01bc, %r17
	.word 0x827a0009  ! 421: SDIV_R	sdiv 	%r8, %r9, %r1
	.word 0x9ea20009  ! 422: SUBcc_R	subcc 	%r8, %r9, %r15
	.word 0xb1321009  ! 422: SRLX_R	srlx	%r8, %r9, %r24
	.word 0xb32a1009  ! 422: SLLX_R	sllx	%r8, %r9, %r25
	.word 0x841a2444  ! 422: XOR_I	xor 	%r8, 0x0444, %r2
	.word 0x82c20009  ! 422: ADDCcc_R	addccc 	%r8, %r9, %r1
	.word 0x82920009  ! 422: ORcc_R	orcc 	%r8, %r9, %r1
	.word 0x83780409  ! 422: MOVR_R	move	%r0, %r9, %r1
	.word 0x82320009  ! 422: ORN_R	orn 	%r8, %r9, %r1
	.word 0x9832219c  ! 422: ORN_I	orn 	%r8, 0x019c, %r12
	.word 0x8a320009  ! 422: SUBC_R	orn 	%r8, %r9, %r5
	.word 0x8c220009  ! 422: SUB_R	sub 	%r8, %r9, %r6
	.word 0x8b2a0009  ! 422: SLL_R	sll 	%r8, %r9, %r5
	.word 0x843a26d0  ! 422: XNOR_I	xnor 	%r8, 0x06d0, %r2
	.word 0x8e822d60  ! 422: ADDcc_I	addcc 	%r8, 0x0d60, %r7
	.word 0xca220009  ! 426: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xcc120009  ! 426: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0x84fa0009  ! 426: SDIVcc_R	sdivcc 	%r8, %r9, %r2
	.word 0x88fa0009  ! 426: SDIVcc_R	sdivcc 	%r8, %r9, %r4
	.word 0xc62a0009  ! 430: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xe81a0009  ! 430: LDD_R	ldd	[%r8 + %r9], %r20
	.word 0xaef224e8  ! 430: UDIVcc_I	udivcc 	%r8, 0x04e8, %r23
	.word 0xb8f22778  ! 430: UDIVcc_I	udivcc 	%r8, 0x0778, %r28
	.word 0xc6720009  ! 434: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xcf020009  ! 434: LDF_R	ld	[%r8, %r9], %f7
	.word 0xc89a1009  ! 434: LDDA_R	ldda	[%r8, %r9] 0x80, %r4
	.word 0x84fa0009  ! 434: SDIVcc_R	sdivcc 	%r8, %r9, %r2
	.word 0xac2a0009  ! 435: ANDN_R	andn 	%r8, %r9, %r22
	.word 0x98922d7c  ! 435: ORcc_I	orcc 	%r8, 0x0d7c, %r12
	.word 0x8c9a297c  ! 435: XORcc_I	xorcc 	%r8, 0x097c, %r6
	.word 0x8a9a0009  ! 435: XORcc_R	xorcc 	%r8, %r9, %r5
	.word 0x8f641809  ! 435: MOVcc_R	<illegal instruction>
	.word 0x8c120009  ! 435: OR_R	or 	%r8, %r9, %r6
	.word 0x95782401  ! 435: MOVR_I	move	%r0, 0x9, %r10
	.word 0x829a0009  ! 435: XORcc_R	xorcc 	%r8, %r9, %r1
	.word 0x88b22358  ! 435: SUBCcc_I	orncc 	%r8, 0x0358, %r4
	.word 0x8b643801  ! 435: MOVcc_I	<illegal instruction>
	.word 0xec2a0009  ! 439: STB_R	stb	%r22, [%r8 + %r9]
	.word 0xcc020009  ! 439: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xacf22bd8  ! 439: UDIVcc_I	udivcc 	%r8, 0x0bd8, %r22
	.word 0x8e7a0009  ! 439: SDIV_R	sdiv 	%r8, %r9, %r7
	.word 0x82022668  ! 440: ADD_I	add 	%r8, 0x0668, %r1
	.word 0x86120009  ! 440: OR_R	or 	%r8, %r9, %r3
	.word 0xa4320009  ! 440: SUBC_R	orn 	%r8, %r9, %r18
	.word 0xaca20009  ! 440: SUBcc_R	subcc 	%r8, %r9, %r22
	.word 0x823a0009  ! 440: XNOR_R	xnor 	%r8, %r9, %r1
	.word 0x86b22688  ! 440: ORNcc_I	orncc 	%r8, 0x0688, %r3
	.word 0x980a2fd4  ! 440: AND_I	and 	%r8, 0x0fd4, %r12
	.word 0xaa3a0009  ! 440: XNOR_R	xnor 	%r8, %r9, %r21
	.word 0x87323001  ! 440: SRLX_I	srlx	%r8, 0x0001, %r3
	.word 0x85320009  ! 440: SRL_R	srl 	%r8, %r9, %r2
	.word 0x9e320009  ! 440: SUBC_R	orn 	%r8, %r9, %r15
	.word 0x86320009  ! 440: ORN_R	orn 	%r8, %r9, %r3
	.word 0xaf3a0009  ! 441: SRA_R	sra 	%r8, %r9, %r23
	.word 0xb7321009  ! 441: SRLX_R	srlx	%r8, %r9, %r27
	.word 0xbaa20009  ! 441: SUBcc_R	subcc 	%r8, %r9, %r29
	.word 0x8a222a88  ! 441: SUB_I	sub 	%r8, 0x0a88, %r5
	.word 0x82a20009  ! 441: SUBcc_R	subcc 	%r8, %r9, %r1
	.word 0xacb20009  ! 441: ORNcc_R	orncc 	%r8, %r9, %r22
	.word 0x962a216c  ! 441: ANDN_I	andn 	%r8, 0x016c, %r11
	.word 0x832a0009  ! 441: SLL_R	sll 	%r8, %r9, %r1
	.word 0x86020009  ! 441: ADD_R	add 	%r8, %r9, %r3
	.word 0xb68a0009  ! 441: ANDcc_R	andcc 	%r8, %r9, %r27
	.word 0x84a22d74  ! 441: SUBcc_I	subcc 	%r8, 0x0d74, %r2
	.word 0xb68a0009  ! 441: ANDcc_R	andcc 	%r8, %r9, %r27
	.word 0xce2a0009  ! 445: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc2020009  ! 445: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0x8af22890  ! 445: UDIVcc_I	udivcc 	%r8, 0x0890, %r5
	.word 0x8c7a2f10  ! 445: SDIV_I	sdiv 	%r8, 0x0f10, %r6
	.word 0x14800002  ! 447: BG	bg  	<label_0x2>
	.word 0xbe720009  ! 447: UDIV_R	udiv 	%r8, %r9, %r31
	.word 0x88220009  ! 448: SUB_R	sub 	%r8, %r9, %r4
	.word 0x8f643801  ! 448: MOVcc_I	<illegal instruction>
	.word 0x8b2a1009  ! 448: SLLX_R	sllx	%r8, %r9, %r5
	.word 0x88422340  ! 448: ADDC_I	addc 	%r8, 0x0340, %r4
	.word 0x84920009  ! 448: ORcc_R	orcc 	%r8, %r9, %r2
	.word 0x8e122a44  ! 448: OR_I	or 	%r8, 0x0a44, %r7
	.word 0x8eb20009  ! 448: ORNcc_R	orncc 	%r8, %r9, %r7
	.word 0x8cb20009  ! 448: SUBCcc_R	orncc 	%r8, %r9, %r6
	.word 0x8a320009  ! 448: ORN_R	orn 	%r8, %r9, %r5
	.word 0xa09a0009  ! 448: XORcc_R	xorcc 	%r8, %r9, %r16
	.word 0x88a20009  ! 448: SUBcc_R	subcc 	%r8, %r9, %r4
	.word 0xa01a218c  ! 448: XOR_I	xor 	%r8, 0x018c, %r16
	.word 0x88a22124  ! 448: SUBcc_I	subcc 	%r8, 0x0124, %r4
	.word 0x86422c9c  ! 448: ADDC_I	addc 	%r8, 0x0c9c, %r3
	.word 0x8eba2498  ! 449: XNORcc_I	xnorcc 	%r8, 0x0498, %r7
	.word 0x8a8a0009  ! 449: ANDcc_R	andcc 	%r8, %r9, %r5
	.word 0xb2320009  ! 449: SUBC_R	orn 	%r8, %r9, %r25
	.word 0x82aa0009  ! 449: ANDNcc_R	andncc 	%r8, %r9, %r1
	.word 0x8e2a28e8  ! 449: ANDN_I	andn 	%r8, 0x08e8, %r7
	.word 0xbb322001  ! 449: SRL_I	srl 	%r8, 0x0001, %r29
	.word 0x8f3a1009  ! 449: SRAX_R	srax	%r8, %r9, %r7
	.word 0xbc3a2c30  ! 449: XNOR_I	xnor 	%r8, 0x0c30, %r30
	.word 0xb83a0009  ! 449: XNOR_R	xnor 	%r8, %r9, %r28
	.word 0x832a0009  ! 449: SLL_R	sll 	%r8, %r9, %r1
	.word 0x833a0009  ! 449: SRA_R	sra 	%r8, %r9, %r1
	.word 0xb3643801  ! 449: MOVcc_I	<illegal instruction>
	.word 0x8cb228a8  ! 449: SUBCcc_I	orncc 	%r8, 0x08a8, %r6
	.word 0xce2a0009  ! 453: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xd84a0009  ! 453: LDSB_R	ldsb	[%r8 + %r9], %r12
	.word 0xaa9a21e8  ! 453: XORcc_I	xorcc 	%r8, 0x01e8, %r21
	.word 0x8cfa2b0c  ! 453: SDIVcc_I	sdivcc 	%r8, 0x0b0c, %r6
	.word 0x2a800001  ! 455: BCS	bcs,a	<label_0x1>
	.word 0x896a0009  ! 455: SDIVX_R	sdivx	%r8, %r9, %r4
	.word 0xdc220009  ! 462: STW_R	stw	%r14, [%r8 + %r9]
	.word 0xd81a0009  ! 462: LDD_R	ldd	[%r8 + %r9], %r12
	.word 0x8d643801  ! 462: MOVcc_I	<illegal instruction>
	.word 0x8c822d34  ! 462: ADDcc_I	addcc 	%r8, 0x0d34, %r6
	.word 0xbd780409  ! 462: MOVR_R	move	%r0, %r9, %r30
	.word 0xa2fa0009  ! 462: SDIVcc_R	sdivcc 	%r8, %r9, %r17
	.word 0x8eb22644  ! 464: SUBCcc_I	orncc 	%r8, 0x0644, %r7
	.word 0x823a22b4  ! 464: XNOR_I	xnor 	%r8, 0x02b4, %r1
	.word 0x8a9226e4  ! 464: ORcc_I	orcc 	%r8, 0x06e4, %r5
	.word 0x823a0009  ! 464: XNOR_R	xnor 	%r8, %r9, %r1
	.word 0x88b22dc8  ! 464: SUBCcc_I	orncc 	%r8, 0x0dc8, %r4
	.word 0x84222c5c  ! 464: SUB_I	sub 	%r8, 0x0c5c, %r2
	.word 0x8ec22c5c  ! 464: ADDCcc_I	addccc 	%r8, 0x0c5c, %r7
	.word 0xa6020009  ! 464: ADD_R	add 	%r8, %r9, %r19
	.word 0x8b782401  ! 464: MOVR_I	move	%r0, 0x9, %r5
	.word 0x82020009  ! 464: ADD_R	add 	%r8, %r9, %r1
	.word 0x8d320009  ! 464: SRL_R	srl 	%r8, %r9, %r6
	.word 0xb8b20009  ! 464: SUBCcc_R	orncc 	%r8, %r9, %r28
	.word 0x8e9a0009  ! 464: XORcc_R	xorcc 	%r8, %r9, %r7
	.word 0x2e800001  ! 466: BVS	bvs,a	<label_0x1>
	.word 0x86f20009  ! 466: UDIVcc_R	udivcc 	%r8, %r9, %r3
	.word 0xcc320009  ! 470: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc4520009  ! 470: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0x82720009  ! 470: UDIV_R	udiv 	%r8, %r9, %r1
	.word 0x8e6a2440  ! 470: UDIVX_I	udivx 	%r8, 0x0440, %r7
	.word 0xc2220009  ! 479: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xcf020009  ! 479: LDF_R	ld	[%r8, %r9], %f7
	.word 0xa46a2894  ! 479: UDIVX_I	udivx 	%r8, 0x0894, %r18
	.word 0x82fa0009  ! 479: SDIVcc_R	sdivcc 	%r8, %r9, %r1
	.word 0xcc720009  ! 483: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc20a0009  ! 483: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xa872260c  ! 483: UDIV_I	udiv 	%r8, 0x060c, %r20
	.word 0x88fa0009  ! 483: SDIVcc_R	sdivcc 	%r8, %r9, %r4
	.word 0xc62a0009  ! 488: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xe80a0009  ! 488: LDUB_R	ldub	[%r8 + %r9], %r20
	.word 0xb4722ff0  ! 488: UDIV_I	udiv 	%r8, 0x0ff0, %r26
	.word 0x846a2d0c  ! 488: UDIVX_I	udivx 	%r8, 0x0d0c, %r2
	.word 0xdf220009  ! 492: STF_R	st	%f15, [%r9, %r8]
	.word 0xf40a0009  ! 492: LDUB_R	ldub	[%r8 + %r9], %r26
	.word 0x8d3a0009  ! 492: SRA_R	sra 	%r8, %r9, %r6
	.word 0xae7a2ef4  ! 492: SDIV_I	sdiv 	%r8, 0x0ef4, %r23
	.word 0x0e800001  ! 494: BVS	bvs  	<label_0x1>
	.word 0x8a6a0009  ! 494: UDIVX_R	udivx 	%r8, %r9, %r5
	.word 0x24c20001  ! 496: BRLEZ	brlez,a,nt	%8,<label_0x20001>
	.word 0xa4f22394  ! 496: UDIVcc_I	udivcc 	%r8, 0x0394, %r18
	.word 0x863226a4  ! 498: SUBC_I	orn 	%r8, 0x06a4, %r3
	.word 0x892a1009  ! 498: SLLX_R	sllx	%r8, %r9, %r4
	.word 0xa6aa0009  ! 498: ANDNcc_R	andncc 	%r8, %r9, %r19
	.word 0x8c022114  ! 498: ADD_I	add 	%r8, 0x0114, %r6
	.word 0x8c0a2828  ! 498: AND_I	and 	%r8, 0x0828, %r6
	.word 0x8f2a0009  ! 498: SLL_R	sll 	%r8, %r9, %r7
	.word 0x8c422a04  ! 498: ADDC_I	addc 	%r8, 0x0a04, %r6
	.word 0x9b322001  ! 498: SRL_I	srl 	%r8, 0x0001, %r13
	.word 0x8a8a0009  ! 498: ANDcc_R	andcc 	%r8, %r9, %r5
	.word 0xbaaa2930  ! 498: ANDNcc_I	andncc 	%r8, 0x0930, %r29
	.word 0x8a8a292c  ! 498: ANDcc_I	andcc 	%r8, 0x092c, %r5
	.word 0x8a220009  ! 500: SUB_R	sub 	%r8, %r9, %r5
	.word 0x8cc22a54  ! 500: ADDCcc_I	addccc 	%r8, 0x0a54, %r6
	.word 0xb9782401  ! 500: MOVR_I	move	%r0, 0xfffffe54, %r28
	.word 0x88120009  ! 500: OR_R	or 	%r8, %r9, %r4
	.word 0xb2822b9c  ! 500: ADDcc_I	addcc 	%r8, 0x0b9c, %r25
	.word 0x8e3a0009  ! 500: XNOR_R	xnor 	%r8, %r9, %r7
	.word 0xae0a2c3c  ! 500: AND_I	and 	%r8, 0x0c3c, %r23
	.word 0xbc322728  ! 500: ORN_I	orn 	%r8, 0x0728, %r30
	.word 0x849a0009  ! 500: XORcc_R	xorcc 	%r8, %r9, %r2
	.word 0x82b20009  ! 500: SUBCcc_R	orncc 	%r8, %r9, %r1
	.word 0x8a1a2fa0  ! 500: XOR_I	xor 	%r8, 0x0fa0, %r5
	.word 0x8a9a0009  ! 500: XORcc_R	xorcc 	%r8, %r9, %r5
	.word 0x852a2001  ! 502: SLL_I	sll 	%r8, 0x0001, %r2
	.word 0x82a22abc  ! 502: SUBcc_I	subcc 	%r8, 0x0abc, %r1
	.word 0xb6ba0009  ! 502: XNORcc_R	xnorcc 	%r8, %r9, %r27
	.word 0xbe320009  ! 502: SUBC_R	orn 	%r8, %r9, %r31
	.word 0x869a2a54  ! 502: XORcc_I	xorcc 	%r8, 0x0a54, %r3
	.word 0x8aaa0009  ! 502: ANDNcc_R	andncc 	%r8, %r9, %r5
	.word 0x881a2c44  ! 502: XOR_I	xor 	%r8, 0x0c44, %r4
	.word 0xbab22600  ! 502: ORNcc_I	orncc 	%r8, 0x0600, %r29
	.word 0x98b226e4  ! 502: ORNcc_I	orncc 	%r8, 0x06e4, %r12
	.word 0x88b20009  ! 502: ORNcc_R	orncc 	%r8, %r9, %r4
	.word 0xad321009  ! 502: SRLX_R	srlx	%r8, %r9, %r22
	.word 0xa6420009  ! 502: ADDC_R	addc 	%r8, %r9, %r19
	.word 0x82820009  ! 502: ADDcc_R	addcc 	%r8, %r9, %r1
	.word 0x94320009  ! 502: SUBC_R	orn 	%r8, %r9, %r10
	.word 0x96b22ca8  ! 502: SUBCcc_I	orncc 	%r8, 0x0ca8, %r11
	.word 0x40000001  ! 505: CALL	call	disp30_1
	.word 0xb56a0009  ! 505: SDIVX_R	sdivx	%r8, %r9, %r26
	.word 0x8caa2f64  ! 506: ANDNcc_I	andncc 	%r8, 0x0f64, %r6
	.word 0x8ec20009  ! 506: ADDCcc_R	addccc 	%r8, %r9, %r7
	.word 0x943a2900  ! 506: XNOR_I	xnor 	%r8, 0x0900, %r10
	.word 0x8d320009  ! 506: SRL_R	srl 	%r8, %r9, %r6
	.word 0x86320009  ! 506: SUBC_R	orn 	%r8, %r9, %r3
	.word 0x940a0009  ! 506: AND_R	and 	%r8, %r9, %r10
	.word 0x8ab20009  ! 506: SUBCcc_R	orncc 	%r8, %r9, %r5
	.word 0x88022d24  ! 506: ADD_I	add 	%r8, 0x0d24, %r4
	.word 0x84422b9c  ! 506: ADDC_I	addc 	%r8, 0x0b9c, %r2
	.word 0x8e8a0009  ! 506: ANDcc_R	andcc 	%r8, %r9, %r7
	.word 0x84c220ac  ! 506: ADDCcc_I	addccc 	%r8, 0x00ac, %r2
	.word 0x9a422b4c  ! 506: ADDC_I	addc 	%r8, 0x0b4c, %r13
	.word 0x889222c4  ! 506: ORcc_I	orcc 	%r8, 0x02c4, %r4
	.word 0x98920009  ! 506: ORcc_R	orcc 	%r8, %r9, %r12
	.word 0x8aba0009  ! 506: XNORcc_R	xnorcc 	%r8, %r9, %r5
	.word 0xcc2a0009  ! 511: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc24a0009  ! 511: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0x86720009  ! 511: UDIV_R	udiv 	%r8, %r9, %r3
	.word 0x826a0009  ! 511: UDIVX_R	udivx 	%r8, %r9, %r1
	.word 0x40000002  ! 517: CALL	call	disp30_2
	.word 0x976a2510  ! 517: SDIVX_I	sdivx	%r8, 0x0510, %r11
	.word 0xc4220009  ! 522: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xf0020009  ! 522: LDUW_R	lduw	[%r8 + %r9], %r24
	.word 0x8d3a0009  ! 522: SRA_R	sra 	%r8, %r9, %r6
	.word 0x836a2208  ! 522: SDIVX_I	sdivx	%r8, 0x0208, %r1
	.word 0xee720009  ! 526: STX_R	stx	%r23, [%r8 + %r9]
	.word 0xfc4a0009  ! 526: LDSB_R	ldsb	[%r8 + %r9], %r30
	.word 0xd8ca232c  ! 526: LDSBA_I	ldsba	[%r8, + 0x032c] %asi, %r12
	.word 0x8afa0009  ! 526: SDIVcc_R	sdivcc 	%r8, %r9, %r5
	.word 0x40000002  ! 535: CALL	call	disp30_2
	.word 0x8ef22c18  ! 535: UDIVcc_I	udivcc 	%r8, 0x0c18, %r7
	.word 0x8e2a0009  ! 536: ANDN_R	andn 	%r8, %r9, %r7
	.word 0x98a20009  ! 536: SUBcc_R	subcc 	%r8, %r9, %r12
	.word 0xa9323001  ! 536: SRLX_I	srlx	%r8, 0x0001, %r20
	.word 0x8eaa2658  ! 536: ANDNcc_I	andncc 	%r8, 0x0658, %r7
	.word 0x8cc221f4  ! 536: ADDCcc_I	addccc 	%r8, 0x01f4, %r6
	.word 0x8e920009  ! 536: ORcc_R	orcc 	%r8, %r9, %r7
	.word 0x8ca20009  ! 536: SUBcc_R	subcc 	%r8, %r9, %r6
	.word 0x87643801  ! 536: MOVcc_I	<illegal instruction>
	.word 0x8aaa281c  ! 536: ANDNcc_I	andncc 	%r8, 0x081c, %r5
	.word 0x84022a0c  ! 536: ADD_I	add 	%r8, 0x0a0c, %r2
	.word 0x8b2a1009  ! 536: SLLX_R	sllx	%r8, %r9, %r5
	.word 0x88320009  ! 536: ORN_R	orn 	%r8, %r9, %r4
	.word 0x87643801  ! 536: MOVcc_I	<illegal instruction>
	.word 0x8a0a2bf8  ! 536: AND_I	and 	%r8, 0x0bf8, %r5
	.word 0xaa920009  ! 536: ORcc_R	orcc 	%r8, %r9, %r21
	.word 0xc82a0009  ! 543: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc65a0009  ! 543: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xa2fa0009  ! 543: SDIVcc_R	sdivcc 	%r8, %r9, %r17
	.word 0xac6a258c  ! 543: UDIVX_I	udivx 	%r8, 0x058c, %r22
	.word 0xce320009  ! 552: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xce4a0009  ! 552: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xc84a0009  ! 552: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0x876a0009  ! 552: SDIVX_R	sdivx	%r8, %r9, %r3
	.word 0x24800002  ! 554: BLE	ble,a	<label_0x2>
	.word 0x8b6a23dc  ! 554: SDIVX_I	sdivx	%r8, 0x03dc, %r5
	.word 0xf62a0009  ! 559: STB_R	stb	%r27, [%r8 + %r9]
	.word 0xd41a0009  ! 559: LDD_R	ldd	[%r8 + %r9], %r10
	.word 0x8cfa2238  ! 559: SDIVcc_I	sdivcc 	%r8, 0x0238, %r6
	.word 0xac722630  ! 559: UDIV_I	udiv 	%r8, 0x0630, %r22
	.word 0x2ec20001  ! 563: BRGEZ	brgez,a,nt	%8,<label_0x20001>
	.word 0x886a0009  ! 563: UDIVX_R	udivx 	%r8, %r9, %r4
	.word 0xfe220009  ! 568: STW_R	stw	%r31, [%r8 + %r9]
	.word 0xc01a0009  ! 568: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0x8c120009  ! 568: OR_R	or 	%r8, %r9, %r6
	.word 0x8e720009  ! 568: UDIV_R	udiv 	%r8, %r9, %r7
	.word 0x22800001  ! 571: BE	be,a	<label_0x1>
	.word 0x887a0009  ! 571: SDIV_R	sdiv 	%r8, %r9, %r4
	.word 0x84b20009  ! 573: SUBCcc_R	orncc 	%r8, %r9, %r2
	.word 0x8a920009  ! 573: ORcc_R	orcc 	%r8, %r9, %r5
	.word 0x89780409  ! 573: MOVR_R	move	%r0, %r9, %r4
	.word 0x84220009  ! 573: SUB_R	sub 	%r8, %r9, %r2
	.word 0x868222fc  ! 573: ADDcc_I	addcc 	%r8, 0x02fc, %r3
	.word 0x8cba21f4  ! 573: XNORcc_I	xnorcc 	%r8, 0x01f4, %r6
	.word 0x84922b30  ! 573: ORcc_I	orcc 	%r8, 0x0b30, %r2
	.word 0x8c320009  ! 573: ORN_R	orn 	%r8, %r9, %r6
	.word 0xb2ba0009  ! 573: XNORcc_R	xnorcc 	%r8, %r9, %r25
	.word 0x853a3001  ! 573: SRAX_I	srax	%r8, 0x0001, %r2
	.word 0x82b22294  ! 573: SUBCcc_I	orncc 	%r8, 0x0294, %r1
	.word 0x8c322198  ! 573: SUBC_I	orn 	%r8, 0x0198, %r6
	.word 0x8e420009  ! 573: ADDC_R	addc 	%r8, %r9, %r7
	.word 0xaa1227f4  ! 573: OR_I	or 	%r8, 0x07f4, %r21
	.word 0xc6320009  ! 577: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xe85a0009  ! 577: LDX_R	ldx	[%r8 + %r9], %r20
	.word 0xc20a0009  ! 577: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0x88fa0009  ! 577: SDIVcc_R	sdivcc 	%r8, %r9, %r4
	.word 0xc2320009  ! 581: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xcc1a0009  ! 581: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0x846a0009  ! 581: UDIVX_R	udivx 	%r8, %r9, %r2
	.word 0x94fa2e5c  ! 581: SDIVcc_I	sdivcc 	%r8, 0x0e5c, %r10
	.word 0xd6320009  ! 588: STH_R	sth	%r11, [%r8 + %r9]
	.word 0xde4a0009  ! 588: LDSB_R	ldsb	[%r8 + %r9], %r15
	.word 0x88f2250c  ! 588: UDIVcc_I	udivcc 	%r8, 0x050c, %r4
	.word 0x98720009  ! 588: UDIV_R	udiv 	%r8, %r9, %r12
	.word 0x14800001  ! 590: BG	bg  	<label_0x1>
	.word 0x86fa0009  ! 590: SDIVcc_R	sdivcc 	%r8, %r9, %r3
	.word 0xc7220009  ! 594: STF_R	st	%f3, [%r9, %r8]
	.word 0xc4520009  ! 594: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xa27a0009  ! 594: SDIV_R	sdiv 	%r8, %r9, %r17
	.word 0x886a0009  ! 594: UDIVX_R	udivx 	%r8, %r9, %r4
	.word 0x8e8a26fc  ! 597: ANDcc_I	andcc 	%r8, 0x06fc, %r7
	.word 0x8d782401  ! 597: MOVR_I	move	%r0, 0xfffffefc, %r6
	.word 0x84222cac  ! 597: SUB_I	sub 	%r8, 0x0cac, %r2
	.word 0x82a22738  ! 597: SUBcc_I	subcc 	%r8, 0x0738, %r1
	.word 0x89641809  ! 597: MOVcc_R	<illegal instruction>
	.word 0xbf641809  ! 597: MOVcc_R	<illegal instruction>
	.word 0x8d3a0009  ! 597: SRA_R	sra 	%r8, %r9, %r6
	.word 0x85320009  ! 597: SRL_R	srl 	%r8, %r9, %r2
	.word 0x8c120009  ! 597: OR_R	or 	%r8, %r9, %r6
	.word 0xba9a0009  ! 597: XORcc_R	xorcc 	%r8, %r9, %r29
	.word 0x34800001  ! 600: BG	bg,a	<label_0x1>
	.word 0x8a722cfc  ! 600: UDIV_I	udiv 	%r8, 0x0cfc, %r5
	.word 0xaac20009  ! 603: ADDCcc_R	addccc 	%r8, %r9, %r21
	.word 0x82020009  ! 603: ADD_R	add 	%r8, %r9, %r1
	.word 0x873a3001  ! 603: SRAX_I	srax	%r8, 0x0001, %r3
	.word 0x9aba26fc  ! 603: XNORcc_I	xnorcc 	%r8, 0x06fc, %r13
	.word 0x88320009  ! 603: SUBC_R	orn 	%r8, %r9, %r4
	.word 0x86b20009  ! 603: SUBCcc_R	orncc 	%r8, %r9, %r3
	.word 0x8e120009  ! 603: OR_R	or 	%r8, %r9, %r7
	.word 0xa2a20009  ! 603: SUBcc_R	subcc 	%r8, %r9, %r17
	.word 0x97320009  ! 603: SRL_R	srl 	%r8, %r9, %r11
	.word 0x843a0009  ! 603: XNOR_R	xnor 	%r8, %r9, %r2
	.word 0x8d643801  ! 603: MOVcc_I	<illegal instruction>
	.word 0x8e9a0009  ! 603: XORcc_R	xorcc 	%r8, %r9, %r7
	.word 0x86b20009  ! 604: ORNcc_R	orncc 	%r8, %r9, %r3
	.word 0xa40a0009  ! 604: AND_R	and 	%r8, %r9, %r18
	.word 0xbd3a1009  ! 604: SRAX_R	srax	%r8, %r9, %r30
	.word 0xbe020009  ! 604: ADD_R	add 	%r8, %r9, %r31
	.word 0x8c822030  ! 604: ADDcc_I	addcc 	%r8, 0x0030, %r6
	.word 0x88c20009  ! 604: ADDCcc_R	addccc 	%r8, %r9, %r4
	.word 0x8b2a1009  ! 604: SLLX_R	sllx	%r8, %r9, %r5
	.word 0xb33a3001  ! 604: SRAX_I	srax	%r8, 0x0001, %r25
	.word 0x8c920009  ! 604: ORcc_R	orcc 	%r8, %r9, %r6
	.word 0xaf3a2001  ! 604: SRA_I	sra 	%r8, 0x0001, %r23
	.word 0x892a1009  ! 604: SLLX_R	sllx	%r8, %r9, %r4
	.word 0x8a320009  ! 605: ORN_R	orn 	%r8, %r9, %r5
	.word 0x82122eec  ! 605: OR_I	or 	%r8, 0x0eec, %r1
	.word 0x8d3a0009  ! 605: SRA_R	sra 	%r8, %r9, %r6
	.word 0x87780409  ! 605: MOVR_R	move	%r0, %r9, %r3
	.word 0xaa022514  ! 605: ADD_I	add 	%r8, 0x0514, %r21
	.word 0x86820009  ! 605: ADDcc_R	addcc 	%r8, %r9, %r3
	.word 0x9eb20009  ! 605: SUBCcc_R	orncc 	%r8, %r9, %r15
	.word 0xa7322001  ! 605: SRL_I	srl 	%r8, 0x0001, %r19
	.word 0x82ba2100  ! 605: XNORcc_I	xnorcc 	%r8, 0x0100, %r1
	.word 0x88322750  ! 605: ORN_I	orn 	%r8, 0x0750, %r4
	.word 0x869a0009  ! 605: XORcc_R	xorcc 	%r8, %r9, %r3
	.word 0x852a1009  ! 605: SLLX_R	sllx	%r8, %r9, %r2
	.word 0x83780409  ! 605: MOVR_R	move	%r0, %r9, %r1
	.word 0xce220009  ! 609: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xdd1a0009  ! 609: LDDF_R	ldd	[%r8, %r9], %f14
	.word 0xa0fa0009  ! 609: SDIVcc_R	sdivcc 	%r8, %r9, %r16
	.word 0x88722300  ! 609: UDIV_I	udiv 	%r8, 0x0300, %r4
	.word 0x0a800001  ! 613: BCS	bcs  	<label_0x1>
	.word 0x8872220c  ! 613: UDIV_I	udiv 	%r8, 0x020c, %r4
	.word 0x2cc20001  ! 617: BRGZ	brgz,a,nt	%8,<label_0x20001>
	.word 0xb0fa0009  ! 617: SDIVcc_R	sdivcc 	%r8, %r9, %r24
	.word 0xaeb20009  ! 618: ORNcc_R	orncc 	%r8, %r9, %r23
	.word 0x853a1009  ! 618: SRAX_R	srax	%r8, %r9, %r2
	.word 0x8a8a0009  ! 618: ANDcc_R	andcc 	%r8, %r9, %r5
	.word 0xa00a2b70  ! 618: AND_I	and 	%r8, 0x0b70, %r16
	.word 0x8f641809  ! 618: MOVcc_R	<illegal instruction>
	.word 0x82322d2c  ! 618: ORN_I	orn 	%r8, 0x0d2c, %r1
	.word 0x87323001  ! 618: SRLX_I	srlx	%r8, 0x0001, %r3
	.word 0x96c20009  ! 618: ADDCcc_R	addccc 	%r8, %r9, %r11
	.word 0x8c920009  ! 618: ORcc_R	orcc 	%r8, %r9, %r6
	.word 0x83782401  ! 618: MOVR_I	move	%r0, 0x9, %r1
	.word 0xa2820009  ! 618: ADDcc_R	addcc 	%r8, %r9, %r17
	.word 0xa6220009  ! 618: SUB_R	sub 	%r8, %r9, %r19
	.word 0x8e2a2b40  ! 618: ANDN_I	andn 	%r8, 0x0b40, %r7
	.word 0x8eb22ab8  ! 624: SUBCcc_I	orncc 	%r8, 0x0ab8, %r7
	.word 0x86ba0009  ! 624: XNORcc_R	xnorcc 	%r8, %r9, %r3
	.word 0xa2820009  ! 624: ADDcc_R	addcc 	%r8, %r9, %r17
	.word 0xa04223e4  ! 624: ADDC_I	addc 	%r8, 0x03e4, %r16
	.word 0xaa922e7c  ! 624: ORcc_I	orcc 	%r8, 0x0e7c, %r21
	.word 0x84ba0009  ! 624: XNORcc_R	xnorcc 	%r8, %r9, %r2
	.word 0x88422a18  ! 624: ADDC_I	addc 	%r8, 0x0a18, %r4
	.word 0x8a020009  ! 624: ADD_R	add 	%r8, %r9, %r5
	.word 0x8c020009  ! 624: ADD_R	add 	%r8, %r9, %r6
	.word 0x8f3a3001  ! 624: SRAX_I	srax	%r8, 0x0001, %r7
	.word 0x849a2028  ! 624: XORcc_I	xorcc 	%r8, 0x0028, %r2
	.word 0x8b3a2001  ! 624: SRA_I	sra 	%r8, 0x0001, %r5
	.word 0x06800002  ! 626: BL	bl  	<label_0x2>
	.word 0x8efa0009  ! 626: SDIVcc_R	sdivcc 	%r8, %r9, %r7
	.word 0x852a0009  ! 627: SLL_R	sll 	%r8, %r9, %r2
	.word 0x97322001  ! 627: SRL_I	srl 	%r8, 0x0001, %r11
	.word 0x86822320  ! 627: ADDcc_I	addcc 	%r8, 0x0320, %r3
	.word 0x84820009  ! 627: ADDcc_R	addcc 	%r8, %r9, %r2
	.word 0x992a2001  ! 627: SLL_I	sll 	%r8, 0x0001, %r12
	.word 0xaa2228dc  ! 627: SUB_I	sub 	%r8, 0x08dc, %r21
	.word 0x892a2001  ! 627: SLL_I	sll 	%r8, 0x0001, %r4
	.word 0x853a2001  ! 627: SRA_I	sra 	%r8, 0x0001, %r2
	.word 0x860a25f0  ! 627: AND_I	and 	%r8, 0x05f0, %r3
	.word 0x8e3a2a3c  ! 627: XNOR_I	xnor 	%r8, 0x0a3c, %r7
	.word 0xbd2a0009  ! 627: SLL_R	sll 	%r8, %r9, %r30
	.word 0x85641809  ! 627: MOVcc_R	<illegal instruction>
	.word 0x8c1a0009  ! 627: XOR_R	xor 	%r8, %r9, %r6
	.word 0x893a2001  ! 627: SRA_I	sra 	%r8, 0x0001, %r4
	.word 0x8e322d74  ! 627: ORN_I	orn 	%r8, 0x0d74, %r7
	.word 0xc2720009  ! 631: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc8120009  ! 631: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0x8ef20009  ! 631: UDIVcc_R	udivcc 	%r8, %r9, %r7
	.word 0x94722a78  ! 631: UDIV_I	udiv 	%r8, 0x0a78, %r10
	.word 0xb8120009  ! 633: OR_R	or 	%r8, %r9, %r28
	.word 0x868a0009  ! 633: ANDcc_R	andcc 	%r8, %r9, %r3
	.word 0x86422644  ! 633: ADDC_I	addc 	%r8, 0x0644, %r3
	.word 0x84b20009  ! 633: SUBCcc_R	orncc 	%r8, %r9, %r2
	.word 0x8a9a2288  ! 633: XORcc_I	xorcc 	%r8, 0x0288, %r5
	.word 0x9c020009  ! 633: ADD_R	add 	%r8, %r9, %r14
	.word 0x8d641809  ! 633: MOVcc_R	<illegal instruction>
	.word 0xa68a0009  ! 633: ANDcc_R	andcc 	%r8, %r9, %r19
	.word 0xa8822f20  ! 633: ADDcc_I	addcc 	%r8, 0x0f20, %r20
	.word 0x860a2260  ! 633: AND_I	and 	%r8, 0x0260, %r3
	.word 0x8aa20009  ! 633: SUBcc_R	subcc 	%r8, %r9, %r5
	.word 0x87782401  ! 633: MOVR_I	move	%r0, 0x9, %r3
	.word 0xc8220009  ! 641: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc4120009  ! 641: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xca022210  ! 641: LDUW_I	lduw	[%r8 + 0x0210], %r5
	.word 0x84fa2d0c  ! 641: SDIVcc_I	sdivcc 	%r8, 0x0d0c, %r2
	.word 0x89321009  ! 643: SRLX_R	srlx	%r8, %r9, %r4
	.word 0x8d780409  ! 643: MOVR_R	move	%r0, %r9, %r6
	.word 0x8d320009  ! 643: SRL_R	srl 	%r8, %r9, %r6
	.word 0x828a2734  ! 643: ANDcc_I	andcc 	%r8, 0x0734, %r1
	.word 0xaf643801  ! 643: MOVcc_I	<illegal instruction>
	.word 0xa0b20009  ! 643: SUBCcc_R	orncc 	%r8, %r9, %r16
	.word 0xaac20009  ! 643: ADDCcc_R	addccc 	%r8, %r9, %r21
	.word 0x8a020009  ! 643: ADD_R	add 	%r8, %r9, %r5
	.word 0x872a2001  ! 643: SLL_I	sll 	%r8, 0x0001, %r3
	.word 0x9e1225c4  ! 643: OR_I	or 	%r8, 0x05c4, %r15
	.word 0xb72a2001  ! 643: SLL_I	sll 	%r8, 0x0001, %r27
	.word 0x8a1a0009  ! 643: XOR_R	xor 	%r8, %r9, %r5
	.word 0x960a219c  ! 643: AND_I	and 	%r8, 0x019c, %r11
	.word 0xb8a20009  ! 643: SUBcc_R	subcc 	%r8, %r9, %r28
	.word 0xb2c20009  ! 647: ADDCcc_R	addccc 	%r8, %r9, %r25
	.word 0x840a2dbc  ! 647: AND_I	and 	%r8, 0x0dbc, %r2
	.word 0x8c8a0009  ! 647: ANDcc_R	andcc 	%r8, %r9, %r6
	.word 0xb2b22908  ! 647: SUBCcc_I	orncc 	%r8, 0x0908, %r25
	.word 0x8a220009  ! 647: SUB_R	sub 	%r8, %r9, %r5
	.word 0xb8c223ac  ! 647: ADDCcc_I	addccc 	%r8, 0x03ac, %r28
	.word 0x87643801  ! 647: MOVcc_I	<illegal instruction>
	.word 0x8aba215c  ! 647: XNORcc_I	xnorcc 	%r8, 0x015c, %r5
	.word 0x8d2a3001  ! 647: SLLX_I	sllx	%r8, 0x0001, %r6
	.word 0x8c8a28c4  ! 647: ANDcc_I	andcc 	%r8, 0x08c4, %r6
	.word 0x872a0009  ! 647: SLL_R	sll 	%r8, %r9, %r3
	.word 0x853a2001  ! 647: SRA_I	sra 	%r8, 0x0001, %r2
	.word 0xac322b90  ! 647: SUBC_I	orn 	%r8, 0x0b90, %r22
	.word 0x8c2a0009  ! 647: ANDN_R	andn 	%r8, %r9, %r6
	.word 0x832a1009  ! 648: SLLX_R	sllx	%r8, %r9, %r1
	.word 0x8ca22c90  ! 648: SUBcc_I	subcc 	%r8, 0x0c90, %r6
	.word 0x98b22fc8  ! 648: SUBCcc_I	orncc 	%r8, 0x0fc8, %r12
	.word 0x8e1a0009  ! 648: XOR_R	xor 	%r8, %r9, %r7
	.word 0x849a2034  ! 648: XORcc_I	xorcc 	%r8, 0x0034, %r2
	.word 0x87780409  ! 648: MOVR_R	move	%r0, %r9, %r3
	.word 0xa73a1009  ! 648: SRAX_R	srax	%r8, %r9, %r19
	.word 0x8e220009  ! 648: SUB_R	sub 	%r8, %r9, %r7
	.word 0x8d780409  ! 648: MOVR_R	move	%r0, %r9, %r6
	.word 0x8ac20009  ! 648: ADDCcc_R	addccc 	%r8, %r9, %r5
	.word 0xcd220009  ! 652: STF_R	st	%f6, [%r9, %r8]
	.word 0xd4120009  ! 652: LDUH_R	lduh	[%r8 + %r9], %r10
	.word 0xc3020009  ! 652: LDF_R	ld	[%r8, %r9], %f1
	.word 0x836a2534  ! 652: SDIVX_I	sdivx	%r8, 0x0534, %r1
	.word 0xe2320009  ! 658: STH_R	sth	%r17, [%r8 + %r9]
	.word 0xe04a0009  ! 658: LDSB_R	ldsb	[%r8 + %r9], %r16
	.word 0x8c722ef8  ! 658: UDIV_I	udiv 	%r8, 0x0ef8, %r6
	.word 0x84722f90  ! 658: UDIV_I	udiv 	%r8, 0x0f90, %r2
	.word 0xe4220009  ! 662: STW_R	stw	%r18, [%r8 + %r9]
	.word 0xf9020009  ! 662: LDF_R	ld	[%r8, %r9], %f28
	.word 0xba7a2608  ! 662: SDIV_I	sdiv 	%r8, 0x0608, %r29
	.word 0x827a26d8  ! 662: SDIV_I	sdiv 	%r8, 0x06d8, %r1
	.word 0x8b643801  ! 663: MOVcc_I	<illegal instruction>
	.word 0x8f2a3001  ! 663: SLLX_I	sllx	%r8, 0x0001, %r7
	.word 0x8e820009  ! 663: ADDcc_R	addcc 	%r8, %r9, %r7
	.word 0x84922d04  ! 663: ORcc_I	orcc 	%r8, 0x0d04, %r2
	.word 0x8b3a2001  ! 663: SRA_I	sra 	%r8, 0x0001, %r5
	.word 0x82aa21b8  ! 663: ANDNcc_I	andncc 	%r8, 0x01b8, %r1
	.word 0x88122d28  ! 663: OR_I	or 	%r8, 0x0d28, %r4
	.word 0x992a2001  ! 663: SLL_I	sll 	%r8, 0x0001, %r12
	.word 0x8d323001  ! 663: SRLX_I	srlx	%r8, 0x0001, %r6
	.word 0x8e320009  ! 663: SUBC_R	orn 	%r8, %r9, %r7
	.word 0x9ac20009  ! 667: ADDCcc_R	addccc 	%r8, %r9, %r13
	.word 0x8f3a1009  ! 667: SRAX_R	srax	%r8, %r9, %r7
	.word 0xb3643801  ! 667: MOVcc_I	<illegal instruction>
	.word 0x84aa2070  ! 667: ANDNcc_I	andncc 	%r8, 0x0070, %r2
	.word 0x9c420009  ! 667: ADDC_R	addc 	%r8, %r9, %r14
	.word 0x8d782401  ! 667: MOVR_I	move	%r0, 0x9, %r6
	.word 0x880a0009  ! 667: AND_R	and 	%r8, %r9, %r4
	.word 0x86c20009  ! 667: ADDCcc_R	addccc 	%r8, %r9, %r3
	.word 0xb69a0009  ! 667: XORcc_R	xorcc 	%r8, %r9, %r27
	.word 0x8c220009  ! 667: SUB_R	sub 	%r8, %r9, %r6
	.word 0xa61229e8  ! 667: OR_I	or 	%r8, 0x09e8, %r19
	.word 0x82820009  ! 667: ADDcc_R	addcc 	%r8, %r9, %r1
	.word 0x9cc22e74  ! 667: ADDCcc_I	addccc 	%r8, 0x0e74, %r14
	.word 0x8a32211c  ! 667: SUBC_I	orn 	%r8, 0x011c, %r5
	.word 0x8a3220c8  ! 667: SUBC_I	orn 	%r8, 0x00c8, %r5
	.word 0xc22a0009  ! 671: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xca0a0009  ! 671: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xbe720009  ! 671: UDIV_R	udiv 	%r8, %r9, %r31
	.word 0x827a2dc0  ! 671: SDIV_I	sdiv 	%r8, 0x0dc0, %r1
	.word 0xc2720009  ! 676: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc4020009  ! 676: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xc31a0009  ! 676: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xa8f22ebc  ! 676: UDIVcc_I	udivcc 	%r8, 0x0ebc, %r20
	.word 0xad3a2001  ! 678: SRA_I	sra 	%r8, 0x0001, %r22
	.word 0x8cb22628  ! 678: SUBCcc_I	orncc 	%r8, 0x0628, %r6
	.word 0x88920009  ! 678: ORcc_R	orcc 	%r8, %r9, %r4
	.word 0x880a2d7c  ! 678: AND_I	and 	%r8, 0x0d7c, %r4
	.word 0x952a0009  ! 678: SLL_R	sll 	%r8, %r9, %r10
	.word 0xa02a2a18  ! 678: ANDN_I	andn 	%r8, 0x0a18, %r16
	.word 0x8ec22ebc  ! 678: ADDCcc_I	addccc 	%r8, 0x0ebc, %r7
	.word 0x87780409  ! 678: MOVR_R	move	%r0, %r9, %r3
	.word 0x88322678  ! 678: ORN_I	orn 	%r8, 0x0678, %r4
	.word 0xb6120009  ! 678: OR_R	or 	%r8, %r9, %r27
	.word 0xb832262c  ! 678: SUBC_I	orn 	%r8, 0x062c, %r28
	.word 0x883a210c  ! 678: XNOR_I	xnor 	%r8, 0x010c, %r4
	.word 0x16800001  ! 682: BGE	bge  	<label_0x1>
	.word 0x8ef20009  ! 682: UDIVcc_R	udivcc 	%r8, %r9, %r7
	.word 0x08800001  ! 684: BLEU	bleu  	<label_0x1>
	.word 0xb27a0009  ! 684: SDIV_R	sdiv 	%r8, %r9, %r25
	.word 0x8c020009  ! 691: ADD_R	add 	%r8, %r9, %r6
	.word 0x893a1009  ! 691: SRAX_R	srax	%r8, %r9, %r4
	.word 0xa88a0009  ! 691: ANDcc_R	andcc 	%r8, %r9, %r20
	.word 0xa4b20009  ! 691: ORNcc_R	orncc 	%r8, %r9, %r18
	.word 0x82222730  ! 691: SUB_I	sub 	%r8, 0x0730, %r1
	.word 0x8aa22718  ! 691: SUBcc_I	subcc 	%r8, 0x0718, %r5
	.word 0xa7320009  ! 691: SRL_R	srl 	%r8, %r9, %r19
	.word 0x96b20009  ! 691: ORNcc_R	orncc 	%r8, %r9, %r11
	.word 0x88220009  ! 691: SUB_R	sub 	%r8, %r9, %r4
	.word 0x8b2a1009  ! 691: SLLX_R	sllx	%r8, %r9, %r5
	.word 0x873a1009  ! 692: SRAX_R	srax	%r8, %r9, %r3
	.word 0x83641809  ! 692: MOVcc_R	<illegal instruction>
	.word 0x8a8a24c0  ! 692: ANDcc_I	andcc 	%r8, 0x04c0, %r5
	.word 0x9e820009  ! 692: ADDcc_R	addcc 	%r8, %r9, %r15
	.word 0x88922a8c  ! 692: ORcc_I	orcc 	%r8, 0x0a8c, %r4
	.word 0x8cb20009  ! 692: SUBCcc_R	orncc 	%r8, %r9, %r6
	.word 0x8d320009  ! 692: SRL_R	srl 	%r8, %r9, %r6
	.word 0x8b3a3001  ! 692: SRAX_I	srax	%r8, 0x0001, %r5
	.word 0x8e8a0009  ! 692: ANDcc_R	andcc 	%r8, %r9, %r7
	.word 0xae1a0009  ! 692: XOR_R	xor 	%r8, %r9, %r23
	.word 0x8e920009  ! 692: ORcc_R	orcc 	%r8, %r9, %r7
	.word 0x02800001  ! 694: BE	be  	<label_0x1>
	.word 0x8cf22c88  ! 694: UDIVcc_I	udivcc 	%r8, 0x0c88, %r6
	.word 0x8e920009  ! 696: ORcc_R	orcc 	%r8, %r9, %r7
	.word 0xbeb20009  ! 696: SUBCcc_R	orncc 	%r8, %r9, %r31
	.word 0x883a2c7c  ! 696: XNOR_I	xnor 	%r8, 0x0c7c, %r4
	.word 0x8a422a50  ! 696: ADDC_I	addc 	%r8, 0x0a50, %r5
	.word 0x87322001  ! 696: SRL_I	srl 	%r8, 0x0001, %r3
	.word 0x85323001  ! 696: SRLX_I	srlx	%r8, 0x0001, %r2
	.word 0xbeaa2834  ! 696: ANDNcc_I	andncc 	%r8, 0x0834, %r31
	.word 0x84820009  ! 696: ADDcc_R	addcc 	%r8, %r9, %r2
	.word 0x822a0009  ! 696: ANDN_R	andn 	%r8, %r9, %r1
	.word 0xa0120009  ! 696: OR_R	or 	%r8, %r9, %r16
	.word 0xb4b2247c  ! 697: SUBCcc_I	orncc 	%r8, 0x047c, %r26
	.word 0x843228d8  ! 697: ORN_I	orn 	%r8, 0x08d8, %r2
	.word 0xa0b20009  ! 697: ORNcc_R	orncc 	%r8, %r9, %r16
	.word 0x84022fc8  ! 697: ADD_I	add 	%r8, 0x0fc8, %r2
	.word 0xa8aa0009  ! 697: ANDNcc_R	andncc 	%r8, %r9, %r20
	.word 0x88422084  ! 697: ADDC_I	addc 	%r8, 0x0084, %r4
	.word 0x8d322001  ! 697: SRL_I	srl 	%r8, 0x0001, %r6
	.word 0x963a2938  ! 697: XNOR_I	xnor 	%r8, 0x0938, %r11
	.word 0x843a0009  ! 697: XNOR_R	xnor 	%r8, %r9, %r2
	.word 0x88b20009  ! 697: SUBCcc_R	orncc 	%r8, %r9, %r4
	.word 0x8e8a2554  ! 697: ANDcc_I	andcc 	%r8, 0x0554, %r7
	.word 0xf53a0009  ! 701: STDF_R	std	%f26, [%r9, %r8]
	.word 0xc80a0009  ! 701: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0x84f229a4  ! 701: UDIVcc_I	udivcc 	%r8, 0x09a4, %r2
	.word 0x8c7a2240  ! 701: SDIV_I	sdiv 	%r8, 0x0240, %r6
	.word 0x88420009  ! 703: ADDC_R	addc 	%r8, %r9, %r4
	.word 0x8c8a26c0  ! 703: ANDcc_I	andcc 	%r8, 0x06c0, %r6
	.word 0x8c820009  ! 703: ADDcc_R	addcc 	%r8, %r9, %r6
	.word 0xb2b22120  ! 703: ORNcc_I	orncc 	%r8, 0x0120, %r25
	.word 0x820a0009  ! 703: AND_R	and 	%r8, %r9, %r1
	.word 0x8b2a0009  ! 703: SLL_R	sll 	%r8, %r9, %r5
	.word 0x88020009  ! 703: ADD_R	add 	%r8, %r9, %r4
	.word 0x8a020009  ! 703: ADD_R	add 	%r8, %r9, %r5
	.word 0xbb2a0009  ! 703: SLL_R	sll 	%r8, %r9, %r29
	.word 0x86b22bbc  ! 703: SUBCcc_I	orncc 	%r8, 0x0bbc, %r3
	.word 0x8d782401  ! 703: MOVR_I	move	%r0, 0xffffffbc, %r6
	.word 0x9a020009  ! 703: ADD_R	add 	%r8, %r9, %r13
	.word 0x9a2a0009  ! 703: ANDN_R	andn 	%r8, %r9, %r13
	.word 0x86aa0009  ! 703: ANDNcc_R	andncc 	%r8, %r9, %r3
	.word 0x88020009  ! 703: ADD_R	add 	%r8, %r9, %r4
	.word 0x24c20001  ! 705: BRLEZ	brlez,a,nt	%8,<label_0x20001>
	.word 0x88fa2d98  ! 705: SDIVcc_I	sdivcc 	%r8, 0x0d98, %r4
	.word 0x10800001  ! 710: BA	ba  	<label_0x1>
	.word 0x88720009  ! 710: UDIV_R	udiv 	%r8, %r9, %r4
	.word 0x34800001  ! 714: BG	bg,a	<label_0x1>
	.word 0xaef22420  ! 714: UDIVcc_I	udivcc 	%r8, 0x0420, %r23
	.word 0x12800002  ! 716: BNE	bne  	<label_0x2>
	.word 0x84720009  ! 716: UDIV_R	udiv 	%r8, %r9, %r2
	.word 0xca220009  ! 722: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xcc4a0009  ! 722: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xb2122a6c  ! 722: OR_I	or 	%r8, 0x0a6c, %r25
	.word 0xb8322bb8  ! 722: SUBC_I	orn 	%r8, 0x0bb8, %r28
	.word 0x99323001  ! 722: SRLX_I	srlx	%r8, 0x0001, %r12
	.word 0x96fa0009  ! 722: SDIVcc_R	sdivcc 	%r8, %r9, %r11
	.word 0xa6b20009  ! 723: SUBCcc_R	orncc 	%r8, %r9, %r19
	.word 0xa812259c  ! 723: OR_I	or 	%r8, 0x059c, %r20
	.word 0x88020009  ! 723: ADD_R	add 	%r8, %r9, %r4
	.word 0xa48a0009  ! 723: ANDcc_R	andcc 	%r8, %r9, %r18
	.word 0x86420009  ! 723: ADDC_R	addc 	%r8, %r9, %r3
	.word 0xaca20009  ! 723: SUBcc_R	subcc 	%r8, %r9, %r22
	.word 0x822a0009  ! 723: ANDN_R	andn 	%r8, %r9, %r1
	.word 0xb1322001  ! 723: SRL_I	srl 	%r8, 0x0001, %r24
	.word 0xbb3a0009  ! 723: SRA_R	sra 	%r8, %r9, %r29
	.word 0x882a2f2c  ! 723: ANDN_I	andn 	%r8, 0x0f2c, %r4
	.word 0x88222340  ! 723: SUB_I	sub 	%r8, 0x0340, %r4
	.word 0x832a0009  ! 727: SLL_R	sll 	%r8, %r9, %r1
	.word 0xb6c2213c  ! 727: ADDCcc_I	addccc 	%r8, 0x013c, %r27
	.word 0x8cc22294  ! 727: ADDCcc_I	addccc 	%r8, 0x0294, %r6
	.word 0xaeb20009  ! 727: SUBCcc_R	orncc 	%r8, %r9, %r23
	.word 0xaa320009  ! 727: SUBC_R	orn 	%r8, %r9, %r21
	.word 0xaaba0009  ! 727: XNORcc_R	xnorcc 	%r8, %r9, %r21
	.word 0x89321009  ! 727: SRLX_R	srlx	%r8, %r9, %r4
	.word 0x8e122aec  ! 727: OR_I	or 	%r8, 0x0aec, %r7
	.word 0x853a1009  ! 727: SRAX_R	srax	%r8, %r9, %r2
	.word 0x82320009  ! 727: ORN_R	orn 	%r8, %r9, %r1
	.word 0x8c320009  ! 727: ORN_R	orn 	%r8, %r9, %r6
	.word 0x32800001  ! 730: BNE	bne,a	<label_0x1>
	.word 0x8c722ba8  ! 730: UDIV_I	udiv 	%r8, 0x0ba8, %r6
	.word 0x3c800001  ! 734: BPOS	bpos,a	<label_0x1>
	.word 0x867a0009  ! 734: SDIV_R	sdiv 	%r8, %r9, %r3
	.word 0xc33a0009  ! 739: STDF_R	std	%f1, [%r9, %r8]
	.word 0xdc1a0009  ! 739: LDD_R	ldd	[%r8 + %r9], %r14
	.word 0x8a6a0009  ! 739: UDIVX_R	udivx 	%r8, %r9, %r5
	.word 0xb96a25f8  ! 739: SDIVX_I	sdivx	%r8, 0x05f8, %r28
	.word 0x18800001  ! 741: BGU	bgu  	<label_0x1>
	.word 0x8ef20009  ! 741: UDIVcc_R	udivcc 	%r8, %r9, %r7
	.word 0x8a322a30  ! 742: SUBC_I	orn 	%r8, 0x0a30, %r5
	.word 0x85782401  ! 742: MOVR_I	move	%r0, 0xfffffe30, %r2
	.word 0x8eba20a4  ! 742: XNORcc_I	xnorcc 	%r8, 0x00a4, %r7
	.word 0xba12229c  ! 742: OR_I	or 	%r8, 0x029c, %r29
	.word 0xb6220009  ! 742: SUB_R	sub 	%r8, %r9, %r27
	.word 0x8a420009  ! 742: ADDC_R	addc 	%r8, %r9, %r5
	.word 0x883221f0  ! 742: ORN_I	orn 	%r8, 0x01f0, %r4
	.word 0x89641809  ! 742: MOVcc_R	<illegal instruction>
	.word 0x8b3a0009  ! 742: SRA_R	sra 	%r8, %r9, %r5
	.word 0xb6b20009  ! 742: SUBCcc_R	orncc 	%r8, %r9, %r27
	.word 0x8e422d90  ! 742: ADDC_I	addc 	%r8, 0x0d90, %r7
	.word 0x829a0009  ! 742: XORcc_R	xorcc 	%r8, %r9, %r1
	.word 0x9e1228b8  ! 742: OR_I	or 	%r8, 0x08b8, %r15
	.word 0x2cca0001  ! 746: BRGZ	brgz,a,pt	%8,<label_0xa0001>
	.word 0x88fa0009  ! 746: SDIVcc_R	sdivcc 	%r8, %r9, %r4
	.word 0xdd3a0009  ! 750: STDF_R	std	%f14, [%r9, %r8]
	.word 0xc4520009  ! 750: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xc40a2694  ! 750: LDUB_I	ldub	[%r8 + 0x0694], %r2
	.word 0x9efa28b4  ! 750: SDIVcc_I	sdivcc 	%r8, 0x08b4, %r15
	.word 0xca220009  ! 757: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xda520009  ! 757: LDSH_R	ldsh	[%r8 + %r9], %r13
	.word 0x8d6a0009  ! 757: SDIVX_R	sdivx	%r8, %r9, %r6
	.word 0xbe7a0009  ! 757: SDIV_R	sdiv 	%r8, %r9, %r31
	.word 0x12800001  ! 761: BNE	bne  	<label_0x1>
	.word 0x82722d80  ! 761: UDIV_I	udiv 	%r8, 0x0d80, %r1
	.word 0xc2720009  ! 766: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xd8420009  ! 766: LDSW_R	ldsw	[%r8 + %r9], %r12
	.word 0x9efa0009  ! 766: SDIVcc_R	sdivcc 	%r8, %r9, %r15
	.word 0x9b6a2014  ! 766: SDIVX_I	sdivx	%r8, 0x0014, %r13
	.word 0xc73a0009  ! 772: STDF_R	std	%f3, [%r9, %r8]
	.word 0xed020009  ! 772: LDF_R	ld	[%r8, %r9], %f22
	.word 0x8a6a24f8  ! 772: UDIVX_I	udivx 	%r8, 0x04f8, %r5
	.word 0x827a23e8  ! 772: SDIV_I	sdiv 	%r8, 0x03e8, %r1
	.word 0x84420009  ! 773: ADDC_R	addc 	%r8, %r9, %r2
	.word 0x8b641809  ! 773: MOVcc_R	<illegal instruction>
	.word 0x8c220009  ! 773: SUB_R	sub 	%r8, %r9, %r6
	.word 0x8c222a6c  ! 773: SUB_I	sub 	%r8, 0x0a6c, %r6
	.word 0xb4b221dc  ! 773: SUBCcc_I	orncc 	%r8, 0x01dc, %r26
	.word 0x8c320009  ! 773: ORN_R	orn 	%r8, %r9, %r6
	.word 0x82422f58  ! 773: ADDC_I	addc 	%r8, 0x0f58, %r1
	.word 0x872a0009  ! 773: SLL_R	sll 	%r8, %r9, %r3
	.word 0x882a2bd0  ! 773: ANDN_I	andn 	%r8, 0x0bd0, %r4
	.word 0xb63223b0  ! 773: ORN_I	orn 	%r8, 0x03b0, %r27
	.word 0x853a3001  ! 773: SRAX_I	srax	%r8, 0x0001, %r2
	.word 0x821a0009  ! 773: XOR_R	xor 	%r8, %r9, %r1
	.word 0x86a224d0  ! 773: SUBcc_I	subcc 	%r8, 0x04d0, %r3
	.word 0x8e0a241c  ! 773: AND_I	and 	%r8, 0x041c, %r7
	.word 0x24c20001  ! 775: BRLEZ	brlez,a,nt	%8,<label_0x20001>
	.word 0xb46a2ad8  ! 775: UDIVX_I	udivx 	%r8, 0x0ad8, %r26
	.word 0x84422b00  ! 777: ADDC_I	addc 	%r8, 0x0b00, %r2
	.word 0xa8ba0009  ! 777: XNORcc_R	xnorcc 	%r8, %r9, %r20
	.word 0x88aa0009  ! 777: ANDNcc_R	andncc 	%r8, %r9, %r4
	.word 0x8e0226b4  ! 777: ADD_I	add 	%r8, 0x06b4, %r7
	.word 0x82ba2de4  ! 777: XNORcc_I	xnorcc 	%r8, 0x0de4, %r1
	.word 0x943a21a4  ! 777: XNOR_I	xnor 	%r8, 0x01a4, %r10
	.word 0x848226c4  ! 777: ADDcc_I	addcc 	%r8, 0x06c4, %r2
	.word 0xac820009  ! 777: ADDcc_R	addcc 	%r8, %r9, %r22
	.word 0xac02259c  ! 777: ADD_I	add 	%r8, 0x059c, %r22
	.word 0xaeaa2664  ! 777: ANDNcc_I	andncc 	%r8, 0x0664, %r23
	.word 0xc33a0009  ! 781: STDF_R	std	%f1, [%r9, %r8]
	.word 0xcb1a0009  ! 781: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xcc9a1009  ! 781: LDDA_R	ldda	[%r8, %r9] 0x80, %r6
	.word 0x856a2de0  ! 781: SDIVX_I	sdivx	%r8, 0x0de0, %r2
	.word 0xcc2a0009  ! 785: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xdc120009  ! 785: LDUH_R	lduh	[%r8 + %r9], %r14
	.word 0x976a0009  ! 785: SDIVX_R	sdivx	%r8, %r9, %r11
	.word 0xa06a22c4  ! 785: UDIVX_I	udivx 	%r8, 0x02c4, %r16
	.word 0xc93a0009  ! 789: STDF_R	std	%f4, [%r9, %r8]
	.word 0xed1a0009  ! 789: LDDF_R	ldd	[%r8, %r9], %f22
	.word 0xba720009  ! 789: UDIV_R	udiv 	%r8, %r9, %r29
	.word 0x84fa21c8  ! 789: SDIVcc_I	sdivcc 	%r8, 0x01c8, %r2
	.word 0x8e1a2d38  ! 790: XOR_I	xor 	%r8, 0x0d38, %r7
	.word 0x8e920009  ! 790: ORcc_R	orcc 	%r8, %r9, %r7
	.word 0x8e2a0009  ! 790: ANDN_R	andn 	%r8, %r9, %r7
	.word 0xbf2a2001  ! 790: SLL_I	sll 	%r8, 0x0001, %r31
	.word 0x82122530  ! 790: OR_I	or 	%r8, 0x0530, %r1
	.word 0x9b322001  ! 790: SRL_I	srl 	%r8, 0x0001, %r13
	.word 0xb9323001  ! 790: SRLX_I	srlx	%r8, 0x0001, %r28
	.word 0x88320009  ! 790: SUBC_R	orn 	%r8, %r9, %r4
	.word 0x86322c0c  ! 790: ORN_I	orn 	%r8, 0x0c0c, %r3
	.word 0x8b321009  ! 790: SRLX_R	srlx	%r8, %r9, %r5
	.word 0x883a2018  ! 790: XNOR_I	xnor 	%r8, 0x0018, %r4
	.word 0x888a223c  ! 790: ANDcc_I	andcc 	%r8, 0x023c, %r4
	.word 0x893a2001  ! 790: SRA_I	sra 	%r8, 0x0001, %r4
	.word 0x86b20009  ! 790: SUBCcc_R	orncc 	%r8, %r9, %r3
	.word 0x889a2784  ! 790: XORcc_I	xorcc 	%r8, 0x0784, %r4
	.word 0xc5220009  ! 795: STF_R	st	%f2, [%r9, %r8]
	.word 0xc7020009  ! 795: LDF_R	ld	[%r8, %r9], %f3
	.word 0x880a0009  ! 795: AND_R	and 	%r8, %r9, %r4
	.word 0x82fa2688  ! 795: SDIVcc_I	sdivcc 	%r8, 0x0688, %r1
	.word 0xce220009  ! 799: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xe1020009  ! 799: LDF_R	ld	[%r8, %r9], %f16
	.word 0xcc1a0009  ! 799: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xbc722ddc  ! 799: UDIV_I	udiv 	%r8, 0x0ddc, %r30
	.word 0x0cca0001  ! 801: BRGZ	brgz  ,pt	%8,<label_0xa0001>
	.word 0x84fa29e8  ! 801: SDIVcc_I	sdivcc 	%r8, 0x09e8, %r2
	.word 0xc4220009  ! 806: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xcc420009  ! 806: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xf8522c94  ! 806: LDSH_I	ldsh	[%r8 + 0x0c94], %r28
	.word 0x8afa0009  ! 806: SDIVcc_R	sdivcc 	%r8, %r9, %r5
	.word 0x8eaa2878  ! 808: ANDNcc_I	andncc 	%r8, 0x0878, %r7
	.word 0x94820009  ! 808: ADDcc_R	addcc 	%r8, %r9, %r10
	.word 0x833a2001  ! 808: SRA_I	sra 	%r8, 0x0001, %r1
	.word 0x9c0a28b8  ! 808: AND_I	and 	%r8, 0x08b8, %r14
	.word 0x8f2a1009  ! 808: SLLX_R	sllx	%r8, %r9, %r7
	.word 0x88aa2f24  ! 808: ANDNcc_I	andncc 	%r8, 0x0f24, %r4
	.word 0x822a0009  ! 808: ANDN_R	andn 	%r8, %r9, %r1
	.word 0x8c3a2b98  ! 808: XNOR_I	xnor 	%r8, 0x0b98, %r6
	.word 0x8a922484  ! 808: ORcc_I	orcc 	%r8, 0x0484, %r5
	.word 0x841a29b8  ! 808: XOR_I	xor 	%r8, 0x09b8, %r2
	.word 0x8d782401  ! 808: MOVR_I	move	%r0, 0x9b8, %r6
	.word 0x02ca0001  ! 810: BRZ	brz  ,pt	%8,<label_0xa0001>
	.word 0xa0fa2f70  ! 810: SDIVcc_I	sdivcc 	%r8, 0x0f70, %r16
	.word 0xa0b20009  ! 812: ORNcc_R	orncc 	%r8, %r9, %r16
	.word 0x833a0009  ! 812: SRA_R	sra 	%r8, %r9, %r1
	.word 0x8a2a0009  ! 812: ANDN_R	andn 	%r8, %r9, %r5
	.word 0xb2a22810  ! 812: SUBcc_I	subcc 	%r8, 0x0810, %r25
	.word 0x8c320009  ! 812: SUBC_R	orn 	%r8, %r9, %r6
	.word 0xbe320009  ! 812: ORN_R	orn 	%r8, %r9, %r31
	.word 0x852a1009  ! 812: SLLX_R	sllx	%r8, %r9, %r2
	.word 0x8d3a0009  ! 812: SRA_R	sra 	%r8, %r9, %r6
	.word 0xbd321009  ! 812: SRLX_R	srlx	%r8, %r9, %r30
	.word 0x88b225ac  ! 812: ORNcc_I	orncc 	%r8, 0x05ac, %r4
	.word 0x843a0009  ! 813: XNOR_R	xnor 	%r8, %r9, %r2
	.word 0x892a0009  ! 813: SLL_R	sll 	%r8, %r9, %r4
	.word 0x8d320009  ! 813: SRL_R	srl 	%r8, %r9, %r6
	.word 0x86922bd8  ! 813: ORcc_I	orcc 	%r8, 0x0bd8, %r3
	.word 0x86b226f0  ! 813: ORNcc_I	orncc 	%r8, 0x06f0, %r3
	.word 0x849a0009  ! 813: XORcc_R	xorcc 	%r8, %r9, %r2
	.word 0x8c9a0009  ! 813: XORcc_R	xorcc 	%r8, %r9, %r6
	.word 0x88ba265c  ! 813: XNORcc_I	xnorcc 	%r8, 0x065c, %r4
	.word 0x86b22b0c  ! 813: ORNcc_I	orncc 	%r8, 0x0b0c, %r3
	.word 0xb4ba0009  ! 813: XNORcc_R	xnorcc 	%r8, %r9, %r26
	.word 0x8e322558  ! 813: ORN_I	orn 	%r8, 0x0558, %r7
	.word 0x88b20009  ! 813: ORNcc_R	orncc 	%r8, %r9, %r4
	.word 0x8eb2200c  ! 813: ORNcc_I	orncc 	%r8, 0x000c, %r7
	.word 0x863a2348  ! 813: XNOR_I	xnor 	%r8, 0x0348, %r3
	.word 0xb8b227d8  ! 814: ORNcc_I	orncc 	%r8, 0x07d8, %r28
	.word 0x953a3001  ! 814: SRAX_I	srax	%r8, 0x0001, %r10
	.word 0x8ab22e64  ! 814: SUBCcc_I	orncc 	%r8, 0x0e64, %r5
	.word 0x853a3001  ! 814: SRAX_I	srax	%r8, 0x0001, %r2
	.word 0x82220009  ! 814: SUB_R	sub 	%r8, %r9, %r1
	.word 0x8e9a279c  ! 814: XORcc_I	xorcc 	%r8, 0x079c, %r7
	.word 0x84220009  ! 814: SUB_R	sub 	%r8, %r9, %r2
	.word 0xa82a0009  ! 814: ANDN_R	andn 	%r8, %r9, %r20
	.word 0xbcb20009  ! 814: SUBCcc_R	orncc 	%r8, %r9, %r30
	.word 0x8a9a0009  ! 814: XORcc_R	xorcc 	%r8, %r9, %r5
	.word 0x8cc20009  ! 814: ADDCcc_R	addccc 	%r8, %r9, %r6
	.word 0x88ba0009  ! 818: XNORcc_R	xnorcc 	%r8, %r9, %r4
	.word 0xa2822bc0  ! 818: ADDcc_I	addcc 	%r8, 0x0bc0, %r17
	.word 0x8a9a2ab8  ! 818: XORcc_I	xorcc 	%r8, 0x0ab8, %r5
	.word 0x88420009  ! 818: ADDC_R	addc 	%r8, %r9, %r4
	.word 0xaa8a0009  ! 818: ANDcc_R	andcc 	%r8, %r9, %r21
	.word 0x86aa0009  ! 818: ANDNcc_R	andncc 	%r8, %r9, %r3
	.word 0x86b20009  ! 818: SUBCcc_R	orncc 	%r8, %r9, %r3
	.word 0x84920009  ! 818: ORcc_R	orcc 	%r8, %r9, %r2
	.word 0x8a4229b8  ! 818: ADDC_I	addc 	%r8, 0x09b8, %r5
	.word 0x8f3a2001  ! 818: SRA_I	sra 	%r8, 0x0001, %r7
	.word 0x86b227c0  ! 818: SUBCcc_I	orncc 	%r8, 0x07c0, %r3
	.word 0x8eba25ec  ! 819: XNORcc_I	xnorcc 	%r8, 0x05ec, %r7
	.word 0x8b2a0009  ! 819: SLL_R	sll 	%r8, %r9, %r5
	.word 0x823a29c0  ! 819: XNOR_I	xnor 	%r8, 0x09c0, %r1
	.word 0x84ba2580  ! 819: XNORcc_I	xnorcc 	%r8, 0x0580, %r2
	.word 0x82322654  ! 819: SUBC_I	orn 	%r8, 0x0654, %r1
	.word 0xa6aa0009  ! 819: ANDNcc_R	andncc 	%r8, %r9, %r19
	.word 0x94a20009  ! 819: SUBcc_R	subcc 	%r8, %r9, %r10
	.word 0xbd322001  ! 819: SRL_I	srl 	%r8, 0x0001, %r30
	.word 0x8e42212c  ! 819: ADDC_I	addc 	%r8, 0x012c, %r7
	.word 0x8e1a0009  ! 819: XOR_R	xor 	%r8, %r9, %r7
	.word 0xb0320009  ! 819: ORN_R	orn 	%r8, %r9, %r24
	.word 0x97322001  ! 819: SRL_I	srl 	%r8, 0x0001, %r11
	.word 0xc8320009  ! 824: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc81a0009  ! 824: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x8f6a2690  ! 824: SDIVX_I	sdivx	%r8, 0x0690, %r7
	.word 0x8f6a2bc8  ! 824: SDIVX_I	sdivx	%r8, 0x0bc8, %r7
	.word 0x18800001  ! 826: BGU	bgu  	<label_0x1>
	.word 0x8cfa2358  ! 826: SDIVcc_I	sdivcc 	%r8, 0x0358, %r6
	.word 0x32800001  ! 828: BNE	bne,a	<label_0x1>
	.word 0x8b6a2320  ! 828: SDIVX_I	sdivx	%r8, 0x0320, %r5
	.word 0x8a9a0009  ! 832: XORcc_R	xorcc 	%r8, %r9, %r5
	.word 0x8b3a3001  ! 832: SRAX_I	srax	%r8, 0x0001, %r5
	.word 0xad641809  ! 832: MOVcc_R	<illegal instruction>
	.word 0x96b22f48  ! 832: ORNcc_I	orncc 	%r8, 0x0f48, %r11
	.word 0x8d3a0009  ! 832: SRA_R	sra 	%r8, %r9, %r6
	.word 0x88020009  ! 832: ADD_R	add 	%r8, %r9, %r4
	.word 0xaaba28a4  ! 832: XNORcc_I	xnorcc 	%r8, 0x08a4, %r21
	.word 0x961a0009  ! 832: XOR_R	xor 	%r8, %r9, %r11
	.word 0x8ec22314  ! 832: ADDCcc_I	addccc 	%r8, 0x0314, %r7
	.word 0x87321009  ! 832: SRLX_R	srlx	%r8, %r9, %r3
	.word 0xbec22fcc  ! 832: ADDCcc_I	addccc 	%r8, 0x0fcc, %r31
	.word 0x8a3229b4  ! 832: SUBC_I	orn 	%r8, 0x09b4, %r5
	.word 0x8cb222ec  ! 832: ORNcc_I	orncc 	%r8, 0x02ec, %r6
	.word 0x83780409  ! 832: MOVR_R	move	%r0, %r9, %r1
	.word 0x8ab20009  ! 832: SUBCcc_R	orncc 	%r8, %r9, %r5
	.word 0x14800002  ! 834: BG	bg  	<label_0x2>
	.word 0xa8fa2f94  ! 834: SDIVcc_I	sdivcc 	%r8, 0x0f94, %r20
	.word 0xe9220009  ! 839: STF_R	st	%f20, [%r9, %r8]
	.word 0xca4a0009  ! 839: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0x96720009  ! 839: UDIV_R	udiv 	%r8, %r9, %r11
	.word 0x876a2fc8  ! 839: SDIVX_I	sdivx	%r8, 0x0fc8, %r3
	.word 0xa52a0009  ! 842: SLL_R	sll 	%r8, %r9, %r18
	.word 0xae3a0009  ! 842: XNOR_R	xnor 	%r8, %r9, %r23
	.word 0x828a2624  ! 842: ANDcc_I	andcc 	%r8, 0x0624, %r1
	.word 0x89320009  ! 842: SRL_R	srl 	%r8, %r9, %r4
	.word 0xba220009  ! 842: SUB_R	sub 	%r8, %r9, %r29
	.word 0x83780409  ! 842: MOVR_R	move	%r0, %r9, %r1
	.word 0x86a20009  ! 842: SUBcc_R	subcc 	%r8, %r9, %r3
	.word 0x948a0009  ! 842: ANDcc_R	andcc 	%r8, %r9, %r10
	.word 0x8eaa0009  ! 842: ANDNcc_R	andncc 	%r8, %r9, %r7
	.word 0x849a0009  ! 842: XORcc_R	xorcc 	%r8, %r9, %r2
	.word 0x87320009  ! 842: SRL_R	srl 	%r8, %r9, %r3
	.word 0xa52a3001  ! 842: SLLX_I	sllx	%r8, 0x0001, %r18
	.word 0x94b20009  ! 842: ORNcc_R	orncc 	%r8, %r9, %r10
	.word 0x8d322001  ! 842: SRL_I	srl 	%r8, 0x0001, %r6
	.word 0xdc2a0009  ! 846: STB_R	stb	%r14, [%r8 + %r9]
	.word 0xce020009  ! 846: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0x8a720009  ! 846: UDIV_R	udiv 	%r8, %r9, %r5
	.word 0xbe7a0009  ! 846: SDIV_R	sdiv 	%r8, %r9, %r31
	.word 0x30800001  ! 848: BA	ba,a	<label_0x1>
	.word 0xaef20009  ! 848: UDIVcc_R	udivcc 	%r8, %r9, %r23
	.word 0xcf3a0009  ! 852: STDF_R	std	%f7, [%r9, %r8]
	.word 0xf4020009  ! 852: LDUW_R	lduw	[%r8 + %r9], %r26
	.word 0x88f20009  ! 852: UDIVcc_R	udivcc 	%r8, %r9, %r4
	.word 0x8cf2281c  ! 852: UDIVcc_I	udivcc 	%r8, 0x081c, %r6
	.word 0x8f3a0009  ! 854: SRA_R	sra 	%r8, %r9, %r7
	.word 0xae822b10  ! 854: ADDcc_I	addcc 	%r8, 0x0b10, %r23
	.word 0x84b20009  ! 854: SUBCcc_R	orncc 	%r8, %r9, %r2
	.word 0x8a9a2874  ! 854: XORcc_I	xorcc 	%r8, 0x0874, %r5
	.word 0xae822030  ! 854: ADDcc_I	addcc 	%r8, 0x0030, %r23
	.word 0x8b3a3001  ! 854: SRAX_I	srax	%r8, 0x0001, %r5
	.word 0x8b641809  ! 854: MOVcc_R	<illegal instruction>
	.word 0x8d3a0009  ! 854: SRA_R	sra 	%r8, %r9, %r6
	.word 0x8eba2688  ! 854: XNORcc_I	xnorcc 	%r8, 0x0688, %r7
	.word 0xb93a3001  ! 854: SRAX_I	srax	%r8, 0x0001, %r28
	.word 0x8eb22300  ! 854: SUBCcc_I	orncc 	%r8, 0x0300, %r7
	.word 0x8e320009  ! 854: ORN_R	orn 	%r8, %r9, %r7
	.word 0xacc22aa8  ! 854: ADDCcc_I	addccc 	%r8, 0x0aa8, %r22
	.word 0xa12a2001  ! 855: SLL_I	sll 	%r8, 0x0001, %r16
	.word 0x84a22248  ! 855: SUBcc_I	subcc 	%r8, 0x0248, %r2
	.word 0x883221ec  ! 855: ORN_I	orn 	%r8, 0x01ec, %r4
	.word 0x829a2808  ! 855: XORcc_I	xorcc 	%r8, 0x0808, %r1
	.word 0x8a3a0009  ! 855: XNOR_R	xnor 	%r8, %r9, %r5
	.word 0x8d320009  ! 855: SRL_R	srl 	%r8, %r9, %r6
	.word 0x86ba2ee4  ! 855: XNORcc_I	xnorcc 	%r8, 0x0ee4, %r3
	.word 0x872a3001  ! 855: SLLX_I	sllx	%r8, 0x0001, %r3
	.word 0x8c020009  ! 855: ADD_R	add 	%r8, %r9, %r6
	.word 0x983227cc  ! 855: ORN_I	orn 	%r8, 0x07cc, %r12
	.word 0xa73a2001  ! 855: SRA_I	sra 	%r8, 0x0001, %r19
	.word 0x848a0009  ! 855: ANDcc_R	andcc 	%r8, %r9, %r2
	.word 0x2aca0001  ! 859: BRNZ	brnz,a,pt	%8,<label_0xa0001>
	.word 0x856a0009  ! 859: SDIVX_R	sdivx	%r8, %r9, %r2
	.word 0xcb220009  ! 869: STF_R	st	%f5, [%r9, %r8]
	.word 0xcf1a0009  ! 869: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0x968a0009  ! 869: ANDcc_R	andcc 	%r8, %r9, %r11
	.word 0x85320009  ! 869: SRL_R	srl 	%r8, %r9, %r2
	.word 0x8cb20009  ! 869: SUBCcc_R	orncc 	%r8, %r9, %r6
	.word 0x8c722664  ! 869: UDIV_I	udiv 	%r8, 0x0664, %r6
	.word 0x1a800001  ! 871: BCC	bcc  	<label_0x1>
	.word 0x82f22828  ! 871: UDIVcc_I	udivcc 	%r8, 0x0828, %r1
	.word 0x9c320009  ! 873: ORN_R	orn 	%r8, %r9, %r14
	.word 0x832a3001  ! 873: SLLX_I	sllx	%r8, 0x0001, %r1
	.word 0x863a0009  ! 873: XNOR_R	xnor 	%r8, %r9, %r3
	.word 0x8e0a0009  ! 873: AND_R	and 	%r8, %r9, %r7
	.word 0x8a922528  ! 873: ORcc_I	orcc 	%r8, 0x0528, %r5
	.word 0x88c22800  ! 873: ADDCcc_I	addccc 	%r8, 0x0800, %r4
	.word 0x84320009  ! 873: ORN_R	orn 	%r8, %r9, %r2
	.word 0x8aaa2784  ! 873: ANDNcc_I	andncc 	%r8, 0x0784, %r5
	.word 0x86ba0009  ! 873: XNORcc_R	xnorcc 	%r8, %r9, %r3
	.word 0x8d641809  ! 873: MOVcc_R	<illegal instruction>
	.word 0xb4120009  ! 873: OR_R	or 	%r8, %r9, %r26
	.word 0x82ba2e20  ! 873: XNORcc_I	xnorcc 	%r8, 0x0e20, %r1
	.word 0x883a0009  ! 873: XNOR_R	xnor 	%r8, %r9, %r4
	.word 0x8482213c  ! 873: ADDcc_I	addcc 	%r8, 0x013c, %r2
	.word 0x26c20001  ! 876: BRLZ	brlz,a,nt	%8,<label_0x20001>
	.word 0x84f20009  ! 876: UDIVcc_R	udivcc 	%r8, %r9, %r2
	.word 0xba320009  ! 879: ORN_R	orn 	%r8, %r9, %r29
	.word 0x86220009  ! 879: SUB_R	sub 	%r8, %r9, %r3
	.word 0x84820009  ! 879: ADDcc_R	addcc 	%r8, %r9, %r2
	.word 0x873a0009  ! 879: SRA_R	sra 	%r8, %r9, %r3
	.word 0x893a1009  ! 879: SRAX_R	srax	%r8, %r9, %r4
	.word 0x8e0a0009  ! 879: AND_R	and 	%r8, %r9, %r7
	.word 0x86020009  ! 879: ADD_R	add 	%r8, %r9, %r3
	.word 0x84120009  ! 879: OR_R	or 	%r8, %r9, %r2
	.word 0x8f321009  ! 879: SRLX_R	srlx	%r8, %r9, %r7
	.word 0xaa820009  ! 879: ADDcc_R	addcc 	%r8, %r9, %r21
	.word 0xb0320009  ! 879: SUBC_R	orn 	%r8, %r9, %r24
	.word 0x8a220009  ! 879: SUB_R	sub 	%r8, %r9, %r5
	.word 0x8c022118  ! 879: ADD_I	add 	%r8, 0x0118, %r6
	.word 0x8c920009  ! 879: ORcc_R	orcc 	%r8, %r9, %r6
	.word 0x40000001  ! 881: CALL	call	disp30_1
	.word 0x8a722750  ! 881: UDIV_I	udiv 	%r8, 0x0750, %r5
	.word 0x0cca0001  ! 886: BRGZ	brgz  ,pt	%8,<label_0xa0001>
	.word 0x84720009  ! 886: UDIV_R	udiv 	%r8, %r9, %r2
	.word 0xcb3a0009  ! 894: STDF_R	std	%f5, [%r9, %r8]
	.word 0xf6420009  ! 894: LDSW_R	ldsw	[%r8 + %r9], %r27
	.word 0x8b3a2001  ! 894: SRA_I	sra 	%r8, 0x0001, %r5
	.word 0x86ba2540  ! 894: XNORcc_I	xnorcc 	%r8, 0x0540, %r3
	.word 0xa6aa0009  ! 894: ANDNcc_R	andncc 	%r8, %r9, %r19
	.word 0xa76a0009  ! 894: SDIVX_R	sdivx	%r8, %r9, %r19
	.word 0x8eb22464  ! 895: SUBCcc_I	orncc 	%r8, 0x0464, %r7
	.word 0x823a2514  ! 895: XNOR_I	xnor 	%r8, 0x0514, %r1
	.word 0xb6120009  ! 895: OR_R	or 	%r8, %r9, %r27
	.word 0x82b22578  ! 895: ORNcc_I	orncc 	%r8, 0x0578, %r1
	.word 0x952a0009  ! 895: SLL_R	sll 	%r8, %r9, %r10
	.word 0x8e9a0009  ! 895: XORcc_R	xorcc 	%r8, %r9, %r7
	.word 0xb41a0009  ! 895: XOR_R	xor 	%r8, %r9, %r26
	.word 0xb4b20009  ! 895: ORNcc_R	orncc 	%r8, %r9, %r26
	.word 0x8a2a2428  ! 895: ANDN_I	andn 	%r8, 0x0428, %r5
	.word 0x8e2224e4  ! 895: SUB_I	sub 	%r8, 0x04e4, %r7
	.word 0x8d321009  ! 895: SRLX_R	srlx	%r8, %r9, %r6
	.word 0x88b222f8  ! 895: SUBCcc_I	orncc 	%r8, 0x02f8, %r4
	.word 0xaf3a0009  ! 895: SRA_R	sra 	%r8, %r9, %r23
	.word 0xad643801  ! 895: MOVcc_I	<illegal instruction>
	.word 0xce220009  ! 901: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xd84a0009  ! 901: LDSB_R	ldsb	[%r8 + %r9], %r12
	.word 0xb0720009  ! 901: UDIV_R	udiv 	%r8, %r9, %r24
	.word 0x8e7a2dd8  ! 901: SDIV_I	sdiv 	%r8, 0x0dd8, %r7
	.word 0x893a0009  ! 902: SRA_R	sra 	%r8, %r9, %r4
	.word 0x86c22fc4  ! 902: ADDCcc_I	addccc 	%r8, 0x0fc4, %r3
	.word 0x83782401  ! 902: MOVR_I	move	%r0, 0xffffffc4, %r1
	.word 0x8e920009  ! 902: ORcc_R	orcc 	%r8, %r9, %r7
	.word 0xba420009  ! 902: ADDC_R	addc 	%r8, %r9, %r29
	.word 0x8c822344  ! 902: ADDcc_I	addcc 	%r8, 0x0344, %r6
	.word 0x880a24b8  ! 902: AND_I	and 	%r8, 0x04b8, %r4
	.word 0x8d321009  ! 902: SRLX_R	srlx	%r8, %r9, %r6
	.word 0x98b20009  ! 902: ORNcc_R	orncc 	%r8, %r9, %r12
	.word 0x86820009  ! 902: ADDcc_R	addcc 	%r8, %r9, %r3
	.word 0xa8a226b8  ! 902: SUBcc_I	subcc 	%r8, 0x06b8, %r20
	.word 0x8e8a2414  ! 902: ANDcc_I	andcc 	%r8, 0x0414, %r7
	.word 0x852a0009  ! 902: SLL_R	sll 	%r8, %r9, %r2
	.word 0x88c20009  ! 902: ADDCcc_R	addccc 	%r8, %r9, %r4
	.word 0xbab2252c  ! 902: ORNcc_I	orncc 	%r8, 0x052c, %r29
	.word 0x8eb22494  ! 903: SUBCcc_I	orncc 	%r8, 0x0494, %r7
	.word 0x8eb20009  ! 903: SUBCcc_R	orncc 	%r8, %r9, %r7
	.word 0x832a2001  ! 903: SLL_I	sll 	%r8, 0x0001, %r1
	.word 0x8e120009  ! 903: OR_R	or 	%r8, %r9, %r7
	.word 0xb9643801  ! 903: MOVcc_I	<illegal instruction>
	.word 0xa9641809  ! 903: MOVcc_R	<illegal instruction>
	.word 0x8c8a0009  ! 903: ANDcc_R	andcc 	%r8, %r9, %r6
	.word 0xba9a0009  ! 903: XORcc_R	xorcc 	%r8, %r9, %r29
	.word 0x84320009  ! 903: SUBC_R	orn 	%r8, %r9, %r2
	.word 0xa4a20009  ! 903: SUBcc_R	subcc 	%r8, %r9, %r18
	.word 0x8eb22b08  ! 903: ORNcc_I	orncc 	%r8, 0x0b08, %r7
	.word 0x3a800002  ! 905: BCC	bcc,a	<label_0x2>
	.word 0x9af22bb4  ! 905: UDIVcc_I	udivcc 	%r8, 0x0bb4, %r13
	.word 0x88122d64  ! 909: OR_I	or 	%r8, 0x0d64, %r4
	.word 0x84220009  ! 909: SUB_R	sub 	%r8, %r9, %r2
	.word 0x892a1009  ! 909: SLLX_R	sllx	%r8, %r9, %r4
	.word 0x8c0a0009  ! 909: AND_R	and 	%r8, %r9, %r6
	.word 0x85643801  ! 909: MOVcc_I	<illegal instruction>
	.word 0x832a1009  ! 909: SLLX_R	sllx	%r8, %r9, %r1
	.word 0x8a2a0009  ! 909: ANDN_R	andn 	%r8, %r9, %r5
	.word 0x8aa227a8  ! 909: SUBcc_I	subcc 	%r8, 0x07a8, %r5
	.word 0x8f643801  ! 909: MOVcc_I	<illegal instruction>
	.word 0x86aa23c8  ! 909: ANDNcc_I	andncc 	%r8, 0x03c8, %r3
	.word 0x0cc20001  ! 912: BRGZ	brgz  ,nt	%8,<label_0x20001>
	.word 0xb56a247c  ! 912: SDIVX_I	sdivx	%r8, 0x047c, %r26
	.word 0x06c20001  ! 914: BRLZ	brlz  ,nt	%8,<label_0x20001>
	.word 0xae6a2790  ! 914: UDIVX_I	udivx 	%r8, 0x0790, %r23
	.word 0x8d2a0009  ! 915: SLL_R	sll 	%r8, %r9, %r6
	.word 0xb3323001  ! 915: SRLX_I	srlx	%r8, 0x0001, %r25
	.word 0x8b320009  ! 915: SRL_R	srl 	%r8, %r9, %r5
	.word 0x872a2001  ! 915: SLL_I	sll 	%r8, 0x0001, %r3
	.word 0x892a0009  ! 915: SLL_R	sll 	%r8, %r9, %r4
	.word 0x82320009  ! 915: ORN_R	orn 	%r8, %r9, %r1
	.word 0x8f2a2001  ! 915: SLL_I	sll 	%r8, 0x0001, %r7
	.word 0x83782401  ! 915: MOVR_I	move	%r0, 0x1, %r1
	.word 0x85322001  ! 915: SRL_I	srl 	%r8, 0x0001, %r2
	.word 0x9e420009  ! 915: ADDC_R	addc 	%r8, %r9, %r15
	.word 0xfd3a0009  ! 920: STDF_R	std	%f30, [%r9, %r8]
	.word 0xc91a0009  ! 920: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0x8f6a20c0  ! 920: SDIVX_I	sdivx	%r8, 0x00c0, %r7
	.word 0x9ef229c4  ! 920: UDIVcc_I	udivcc 	%r8, 0x09c4, %r15
	.word 0x82b223b0  ! 923: SUBCcc_I	orncc 	%r8, 0x03b0, %r1
	.word 0x8d323001  ! 923: SRLX_I	srlx	%r8, 0x0001, %r6
	.word 0x84b20009  ! 923: ORNcc_R	orncc 	%r8, %r9, %r2
	.word 0x8c322870  ! 923: SUBC_I	orn 	%r8, 0x0870, %r6
	.word 0xbb321009  ! 923: SRLX_R	srlx	%r8, %r9, %r29
	.word 0x9f3a1009  ! 923: SRAX_R	srax	%r8, %r9, %r15
	.word 0x88aa0009  ! 923: ANDNcc_R	andncc 	%r8, %r9, %r4
	.word 0x833a0009  ! 923: SRA_R	sra 	%r8, %r9, %r1
	.word 0xaf3a2001  ! 923: SRA_I	sra 	%r8, 0x0001, %r23
	.word 0xa0a20009  ! 923: SUBcc_R	subcc 	%r8, %r9, %r16
	.word 0x8c3a2b84  ! 923: XNOR_I	xnor 	%r8, 0x0b84, %r6
	.word 0x8c320009  ! 923: ORN_R	orn 	%r8, %r9, %r6
	.word 0x8a322338  ! 924: ORN_I	orn 	%r8, 0x0338, %r5
	.word 0x842a0009  ! 924: ANDN_R	andn 	%r8, %r9, %r2
	.word 0x863a2764  ! 924: XNOR_I	xnor 	%r8, 0x0764, %r3
	.word 0x96122bb4  ! 924: OR_I	or 	%r8, 0x0bb4, %r11
	.word 0x8632280c  ! 924: SUBC_I	orn 	%r8, 0x080c, %r3
	.word 0x82a22a44  ! 924: SUBcc_I	subcc 	%r8, 0x0a44, %r1
	.word 0xa64229d8  ! 924: ADDC_I	addc 	%r8, 0x09d8, %r19
	.word 0x88820009  ! 924: ADDcc_R	addcc 	%r8, %r9, %r4
	.word 0x8eb22748  ! 924: SUBCcc_I	orncc 	%r8, 0x0748, %r7
	.word 0x8aa20009  ! 924: SUBcc_R	subcc 	%r8, %r9, %r5
	.word 0x8c0a0009  ! 925: AND_R	and 	%r8, %r9, %r6
	.word 0x9c3a0009  ! 925: XNOR_R	xnor 	%r8, %r9, %r14
	.word 0x84b22cf0  ! 925: ORNcc_I	orncc 	%r8, 0x0cf0, %r2
	.word 0x86b20009  ! 925: SUBCcc_R	orncc 	%r8, %r9, %r3
	.word 0x84122b58  ! 925: OR_I	or 	%r8, 0x0b58, %r2
	.word 0x8aa22234  ! 925: SUBcc_I	subcc 	%r8, 0x0234, %r5
	.word 0x82320009  ! 925: ORN_R	orn 	%r8, %r9, %r1
	.word 0x82aa0009  ! 925: ANDNcc_R	andncc 	%r8, %r9, %r1
	.word 0x84b20009  ! 925: SUBCcc_R	orncc 	%r8, %r9, %r2
	.word 0xaeb22530  ! 925: SUBCcc_I	orncc 	%r8, 0x0530, %r23
	.word 0x88320009  ! 925: ORN_R	orn 	%r8, %r9, %r4
	.word 0x96920009  ! 925: ORcc_R	orcc 	%r8, %r9, %r11
	.word 0x8f3a2001  ! 925: SRA_I	sra 	%r8, 0x0001, %r7
	.word 0x8c2a29f8  ! 925: ANDN_I	andn 	%r8, 0x09f8, %r6
	.word 0x86320009  ! 926: ORN_R	orn 	%r8, %r9, %r3
	.word 0x833a2001  ! 926: SRA_I	sra 	%r8, 0x0001, %r1
	.word 0x888a0009  ! 926: ANDcc_R	andcc 	%r8, %r9, %r4
	.word 0x95782401  ! 926: MOVR_I	move	%r0, 0x9, %r10
	.word 0xb2b20009  ! 926: SUBCcc_R	orncc 	%r8, %r9, %r25
	.word 0x8e420009  ! 926: ADDC_R	addc 	%r8, %r9, %r7
	.word 0x873a3001  ! 926: SRAX_I	srax	%r8, 0x0001, %r3
	.word 0xa73a3001  ! 926: SRAX_I	srax	%r8, 0x0001, %r19
	.word 0x82b223b0  ! 926: ORNcc_I	orncc 	%r8, 0x03b0, %r1
	.word 0x833a2001  ! 926: SRA_I	sra 	%r8, 0x0001, %r1
	.word 0xa4820009  ! 926: ADDcc_R	addcc 	%r8, %r9, %r18
	.word 0xb0022d90  ! 926: ADD_I	add 	%r8, 0x0d90, %r24
	.word 0x8c820009  ! 927: ADDcc_R	addcc 	%r8, %r9, %r6
	.word 0x868a0009  ! 927: ANDcc_R	andcc 	%r8, %r9, %r3
	.word 0xa00226f8  ! 927: ADD_I	add 	%r8, 0x06f8, %r16
	.word 0xa2aa0009  ! 927: ANDNcc_R	andncc 	%r8, %r9, %r17
	.word 0x86aa0009  ! 927: ANDNcc_R	andncc 	%r8, %r9, %r3
	.word 0x98822934  ! 927: ADDcc_I	addcc 	%r8, 0x0934, %r12
	.word 0xb3323001  ! 927: SRLX_I	srlx	%r8, 0x0001, %r25
	.word 0x882a0009  ! 927: ANDN_R	andn 	%r8, %r9, %r4
	.word 0xb4320009  ! 927: SUBC_R	orn 	%r8, %r9, %r26
	.word 0x82822b1c  ! 927: ADDcc_I	addcc 	%r8, 0x0b1c, %r1
	.word 0x0ec20001  ! 929: BRGEZ	brgez  ,nt	%8,<label_0x20001>
	.word 0x866a22b4  ! 929: UDIVX_I	udivx 	%r8, 0x02b4, %r3
	.word 0x8eba2d4c  ! 930: XNORcc_I	xnorcc 	%r8, 0x0d4c, %r7
	.word 0x8b322001  ! 930: SRL_I	srl 	%r8, 0x0001, %r5
	.word 0x84420009  ! 930: ADDC_R	addc 	%r8, %r9, %r2
	.word 0x824225d8  ! 930: ADDC_I	addc 	%r8, 0x05d8, %r1
	.word 0x82422030  ! 930: ADDC_I	addc 	%r8, 0x0030, %r1
	.word 0xb41a0009  ! 930: XOR_R	xor 	%r8, %r9, %r26
	.word 0x8f323001  ! 930: SRLX_I	srlx	%r8, 0x0001, %r7
	.word 0x83320009  ! 930: SRL_R	srl 	%r8, %r9, %r1
	.word 0x86aa2ba8  ! 930: ANDNcc_I	andncc 	%r8, 0x0ba8, %r3
	.word 0xb4b22840  ! 930: ORNcc_I	orncc 	%r8, 0x0840, %r26
	.word 0x0aca0001  ! 932: BRNZ	brnz  ,pt	%8,<label_0xa0001>
	.word 0x8a7a2a74  ! 932: SDIV_I	sdiv 	%r8, 0x0a74, %r5
	.word 0x30800001  ! 935: BA	ba,a	<label_0x1>
	.word 0x876a28c8  ! 935: SDIVX_I	sdivx	%r8, 0x08c8, %r3
	.word 0x02800001  ! 938: BE	be  	<label_0x1>
	.word 0x8c6a21ac  ! 938: UDIVX_I	udivx 	%r8, 0x01ac, %r6
	.word 0x18800001  ! 943: BGU	bgu  	<label_0x1>
	.word 0xac6a247c  ! 943: UDIVX_I	udivx 	%r8, 0x047c, %r22
	.word 0x24ca0001  ! 948: BRLEZ	brlez,a,pt	%8,<label_0xa0001>
	.word 0x8cf20009  ! 948: UDIVcc_R	udivcc 	%r8, %r9, %r6
	.word 0x88320009  ! 950: ORN_R	orn 	%r8, %r9, %r4
	.word 0x862a2448  ! 950: ANDN_I	andn 	%r8, 0x0448, %r3
	.word 0x87322001  ! 950: SRL_I	srl 	%r8, 0x0001, %r3
	.word 0x85322001  ! 950: SRL_I	srl 	%r8, 0x0001, %r2
	.word 0x8a020009  ! 950: ADD_R	add 	%r8, %r9, %r5
	.word 0x8d3a0009  ! 950: SRA_R	sra 	%r8, %r9, %r6
	.word 0xb2322f58  ! 950: ORN_I	orn 	%r8, 0x0f58, %r25
	.word 0x8d3a1009  ! 950: SRAX_R	srax	%r8, %r9, %r6
	.word 0x8c820009  ! 950: ADDcc_R	addcc 	%r8, %r9, %r6
	.word 0x822a2ff0  ! 950: ANDN_I	andn 	%r8, 0x0ff0, %r1
	.word 0x8a322314  ! 950: ORN_I	orn 	%r8, 0x0314, %r5
	.word 0xb1782401  ! 950: MOVR_I	move	%r0, 0xffffff14, %r24
	.word 0x8c222fac  ! 950: SUB_I	sub 	%r8, 0x0fac, %r6
	.word 0x8e0a225c  ! 950: AND_I	and 	%r8, 0x025c, %r7
	.word 0x8a020009  ! 950: ADD_R	add 	%r8, %r9, %r5
	.word 0x0e800001  ! 954: BVS	bvs  	<label_0x1>
	.word 0x886a0009  ! 954: UDIVX_R	udivx 	%r8, %r9, %r4
	.word 0x04c20001  ! 958: BRLEZ	brlez  ,nt	%8,<label_0x20001>
	.word 0x82720009  ! 958: UDIV_R	udiv 	%r8, %r9, %r1
	.word 0xfe320009  ! 963: STH_R	sth	%r31, [%r8 + %r9]
	.word 0xc8020009  ! 963: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0x8cfa0009  ! 963: SDIVcc_R	sdivcc 	%r8, %r9, %r6
	.word 0x876a2d64  ! 963: SDIVX_I	sdivx	%r8, 0x0d64, %r3
	.word 0xcd220009  ! 967: STF_R	st	%f6, [%r9, %r8]
	.word 0xc80a0009  ! 967: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0x867225b8  ! 967: UDIV_I	udiv 	%r8, 0x05b8, %r3
	.word 0x82722788  ! 967: UDIV_I	udiv 	%r8, 0x0788, %r1
	.word 0x0e800002  ! 970: BVS	bvs  	<label_0x2>
	.word 0xbc6a0009  ! 970: UDIVX_R	udivx 	%r8, %r9, %r30
	.word 0x9a8a0009  ! 974: ANDcc_R	andcc 	%r8, %r9, %r13
	.word 0x8eba262c  ! 974: XNORcc_I	xnorcc 	%r8, 0x062c, %r7
	.word 0x84c20009  ! 974: ADDCcc_R	addccc 	%r8, %r9, %r2
	.word 0xb28a2ea0  ! 974: ANDcc_I	andcc 	%r8, 0x0ea0, %r25
	.word 0xab323001  ! 974: SRLX_I	srlx	%r8, 0x0001, %r21
	.word 0x8e2a2fa4  ! 974: ANDN_I	andn 	%r8, 0x0fa4, %r7
	.word 0xb8220009  ! 974: SUB_R	sub 	%r8, %r9, %r28
	.word 0x832a3001  ! 974: SLLX_I	sllx	%r8, 0x0001, %r1
	.word 0x8f780409  ! 974: MOVR_R	move	%r0, %r9, %r7
	.word 0x82b20009  ! 974: SUBCcc_R	orncc 	%r8, %r9, %r1
	.word 0x8ac22920  ! 974: ADDCcc_I	addccc 	%r8, 0x0920, %r5
	.word 0x8a922260  ! 974: ORcc_I	orcc 	%r8, 0x0260, %r5
	.word 0x869a0009  ! 975: XORcc_R	xorcc 	%r8, %r9, %r3
	.word 0xbe222710  ! 975: SUB_I	sub 	%r8, 0x0710, %r31
	.word 0x87322001  ! 975: SRL_I	srl 	%r8, 0x0001, %r3
	.word 0x89643801  ! 975: MOVcc_I	<illegal instruction>
	.word 0xb6a222ec  ! 975: SUBcc_I	subcc 	%r8, 0x02ec, %r27
	.word 0xb4ba26d8  ! 975: XNORcc_I	xnorcc 	%r8, 0x06d8, %r26
	.word 0x8c9a0009  ! 975: XORcc_R	xorcc 	%r8, %r9, %r6
	.word 0x8b3a2001  ! 975: SRA_I	sra 	%r8, 0x0001, %r5
	.word 0x98820009  ! 975: ADDcc_R	addcc 	%r8, %r9, %r12
	.word 0x882a26c8  ! 975: ANDN_I	andn 	%r8, 0x06c8, %r4
	.word 0xb89a227c  ! 975: XORcc_I	xorcc 	%r8, 0x027c, %r28
	.word 0x1a800001  ! 978: BCC	bcc  	<label_0x1>
	.word 0xac7a0009  ! 978: SDIV_R	sdiv 	%r8, %r9, %r22
	.word 0x8ea2285c  ! 989: SUBcc_I	subcc 	%r8, 0x085c, %r7
	.word 0x82c20009  ! 989: ADDCcc_R	addccc 	%r8, %r9, %r1
	.word 0x83320009  ! 989: SRL_R	srl 	%r8, %r9, %r1
	.word 0xb62a2458  ! 989: ANDN_I	andn 	%r8, 0x0458, %r27
	.word 0x8eb20009  ! 989: ORNcc_R	orncc 	%r8, %r9, %r7
	.word 0x8c9a0009  ! 989: XORcc_R	xorcc 	%r8, %r9, %r6
	.word 0x8d780409  ! 989: MOVR_R	move	%r0, %r9, %r6
	.word 0x82322320  ! 989: ORN_I	orn 	%r8, 0x0320, %r1
	.word 0x96022830  ! 989: ADD_I	add 	%r8, 0x0830, %r11
	.word 0x86c2232c  ! 989: ADDCcc_I	addccc 	%r8, 0x032c, %r3
	.word 0x8a1a0009  ! 989: XOR_R	xor 	%r8, %r9, %r5
	.word 0x8a1a0009  ! 989: XOR_R	xor 	%r8, %r9, %r5
	.word 0xee220009  ! 994: STW_R	stw	%r23, [%r8 + %r9]
	.word 0xc2020009  ! 994: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xcc8a1009  ! 994: LDUBA_R	lduba	[%r8, %r9] 0x80, %r6
	.word 0x8c720009  ! 994: UDIV_R	udiv 	%r8, %r9, %r6
	.word 0xbd3a3001  ! 995: SRAX_I	srax	%r8, 0x0001, %r30
	.word 0x863222d8  ! 995: SUBC_I	orn 	%r8, 0x02d8, %r3
	.word 0x861a0009  ! 995: XOR_R	xor 	%r8, %r9, %r3
	.word 0xaac2260c  ! 995: ADDCcc_I	addccc 	%r8, 0x060c, %r21
	.word 0xae322528  ! 995: SUBC_I	orn 	%r8, 0x0528, %r23
	.word 0x852a2001  ! 995: SLL_I	sll 	%r8, 0x0001, %r2
	.word 0xb01a0009  ! 995: XOR_R	xor 	%r8, %r9, %r24
	.word 0x85320009  ! 995: SRL_R	srl 	%r8, %r9, %r2
	.word 0xa2b22288  ! 995: SUBCcc_I	orncc 	%r8, 0x0288, %r17
	.word 0xb8320009  ! 995: SUBC_R	orn 	%r8, %r9, %r28
	.word 0xbcb20009  ! 995: ORNcc_R	orncc 	%r8, %r9, %r30
	.word 0x848225f4  ! 995: ADDcc_I	addcc 	%r8, 0x05f4, %r2
	.word 0x2c800001  ! 998: BNEG	bneg,a	<label_0x1>
	.word 0x86f22398  ! 998: UDIVcc_I	udivcc 	%r8, 0x0398, %r3
	nop
	nop
	nop
        ta      T_GOOD_TRAP

.data
	.word  0x16f0faca,0x2ea6420d,0x51187bd7,0x5d825964
	.word  0x894a9617,0x891cf93c,0xc2a04104,0x56069176
	.word  0xf1c2c57b,0xcf0785fb,0x021b6c46,0xf0f36af2
	.word  0x385aa289,0x4ac3d9b7,0x4d943d9a,0xcfead439
	.word  0xe949a2cf,0xa8b39ec3,0xfc963962,0xe57481dd
	.word  0xcf6e4707,0x7c497a01,0x89a9e97d,0x9e578c36
	.word  0x4c957169,0x0a9f24a4,0x7d4e439a,0xcf70198c
	.word  0x83ecf7d0,0x6815bbca,0xa8436cc5,0x2869ded9
	.word  0xd40897dd,0x482108c0,0x22572a40,0x37c5d5aa
	.word  0x77f00ba6,0x1e14a5fc,0xea2708c3,0x67614f3b
	.word  0x85029712,0x2b2ae555,0x6d83ff51,0x3b6c9d8b
	.word  0x10fa1770,0x8a0b4a1a,0x18e1555c,0xb59d6d0d
	.word  0x29eabe8a,0x78a958b8,0x6153528c,0x7e063395
	.word  0xe8fe837c,0x514b0803,0x31e9ba8e,0x6e6b5aa8
	.word  0xa58c2c0f,0xfc89eb6b,0x1f62c44a,0x89196c12
	.word  0x8327dcc2,0xe49419e9,0x1018f585,0x564f9072
	.word  0xd2ff36ab,0x1eaf9b87,0xe81b2951,0xff94e915
	.word  0x6b7b70de,0xf1e7577d,0x291ba83e,0xfdd0900f
	.word  0xf916b473,0xca14a705,0x0dd283fc,0x49e4bbd4
	.word  0x28666d11,0x563cfae7,0x371db819,0xa8a41e92
	.word  0xbb3c5aa3,0x12761403,0xe20c5e7a,0x2d18b916
	.word  0x4771690e,0x3ca3a173,0x5c815828,0xca2ada79
	.word  0xc323c05d,0xc7fd58ad,0x6eeb086e,0x73c9adea
	.word  0xe0db7f73,0xa40dfc69,0x065bc9cb,0x25066ca1
	.word  0xe891b70d,0x2a474d1b,0x7b598141,0x6b7a9e50
	.word  0xf420385c,0x4594a5fc,0xe04c5424,0xdc4e29b0
	.word  0xf481db94,0x479c0993,0xa5fc1bb2,0x6290ed81
	.word  0x56d67774,0x4ae9c7bc,0x2ba4d03b,0x47385422
	.word  0x49cad4db,0x9c8ce12b,0x961744b6,0xe6973e34
	.word  0x82a94f37,0x4eca778f,0xa7e465b5,0x53587480
	.word  0xf8d9c9a0,0x324425b5,0x55cf3d5e,0x53708690
	.word  0x811f2c0e,0xb122b1b5,0x4b5eb295,0x983acf1c
	.word  0xdf152a37,0xec09e259,0xcf3a6a49,0xc1f7ef32
	.word  0x67405429,0x2bccc267,0x45af3922,0x1133eb2c
	.word  0x37f96c5f,0x09e578f2,0xe0e60ca1,0x56de092e
	.word  0x4d85b97e,0x69f69695,0xed5e4d79,0xe3517546
	.word  0xe46c1c33,0x63e0b22f,0x07a98376,0x5fe243ba
	.word  0xbef48cc8,0x26126baf,0x55db8ab2,0xe591b5ba
	.word  0x2a0fc49f,0xc73f1b87,0xc4d9e9d9,0xe6a1208c
	.word  0x9fe0989f,0x70b47579,0xc5ec0491,0xc0ea019c
	.word  0x44c84d8c,0x3da750a0,0xe5c7ccdf,0xc26765af
	.word  0x39a07cb3,0xa244dd2a,0x7f9d20f9,0x67d911ff
	.word  0x7cae183b,0xaa57ba55,0xc0fc7b61,0x6dcabdeb
	.word  0xb3785293,0xcc2ae350,0x00e48150,0x817817be
	.word  0xa12722ca,0x6ed41ad9,0x1d0ca85c,0xe85ec164
	.word  0x10b974a7,0x5f3a81f3,0x751cc2ed,0x2575996f
	.word  0xc03f1e66,0x49e7d155,0x21a81cc0,0xc4c57ee0
	.word  0x6d87762f,0xd5eea0c0,0xdfd91471,0x572e28a3
	.word  0x870b1b79,0x33c4b88e,0x49b782f7,0x5eb831d9
	.word  0x1b9d7eb3,0x5de5e53f,0x89e98686,0xb15c8e08
	.word  0x8837fa7a,0x11fd1f1e,0x290d814c,0x9049813b
	.word  0x544ad8d8,0x9569a4f8,0xdebdc2dc,0xf3ca7070
	.word  0xa0d693c8,0x8a6b04ba,0xb6768875,0x9469ab62
	.word  0x2a6e6094,0x977110d2,0x1a4263e1,0xa2705811
	.word  0xb1408b92,0xe5fe1cba,0x22e03153,0x77f2e24a
	.word  0x6de1e07d,0x2862d6ab,0x42e5351b,0x55db0ebb
	.word  0x48c8deea,0x0f0dbd01,0x9c2cd2fd,0x04853061
	.word  0xd6b431ea,0xe9070a57,0x31e8a96b,0xfaa9d828
	.word  0xf46139d9,0x55573d6d,0xaf6243ae,0x34de3160
	.word  0xf2ba4a18,0xd6e44575,0xe692cffe,0xa635c005
	.word  0x054d078c,0xd34a0b0b,0xa7a26d6f,0xdc3aaf5c
	.word  0x15fbe681,0x3d0aded8,0xda153448,0xa2e8059b
	.word  0x00043617,0x879c934c,0xd05a2b67,0x1056133d
	.word  0xc384f26b,0x165524e3,0x8ee858cb,0x2bedebbe
	.word  0x834b4008,0x845a1460,0xab46051c,0x57ae89fc
	.word  0x4a66e31f,0x24279c7a,0xc89c732b,0xb472aeeb
	.word  0xf0065945,0x3fd1458c,0xebc78511,0xfd5659bb
	.word  0x44eb78f8,0xab4927f3,0x1ff912d3,0x721c5f1c
	.word  0x6ce4ae3d,0x016b9161,0x135740bc,0x9287587e
	.word  0xd3515594,0x0c1fd72b,0xf33a7186,0xa35ad283
	.word  0x69dee6e7,0x7855bdf1,0xc1774bc0,0xa5d9d8be
	.word  0xc15a1cd6,0xfd3e3122,0x7350d7cd,0x026367cb
	.word  0x9844045d,0x77e14647,0x27454ebf,0x028309e7
	.word  0x7441bd0b,0x7c50d7fa,0x0a1f68cd,0xd7e41541
	.word  0xa9fe5806,0x0cddcbab,0x7aafe188,0x842d2276
	.word  0x65587654,0x8c239b5e,0xe7f1f505,0xc38db0ca
	.word  0xa8ca71a5,0xb8396009,0x297fd55d,0xdf5e5d8e
	.word  0x83387b7e,0x4e1db488,0x33658417,0x22476f6c
	.word  0x8fa83f6a,0xb5850ab1,0x754dbf74,0x97571c37
	.word  0xf4b983bc,0x7b4cc01d,0x5f4b6957,0xc6846d6d
	.word  0xc1b3f5c5,0xcf9d57c8,0x6172f617,0x121d4a9f
	.word  0x2a6f47b9,0x791e44c1,0x8057da24,0x211437a7
	.word  0xeceeaecb,0xe3f6af83,0x3de1105e,0xb8748f71
	.word  0x6a969564,0x5b9a0b77,0x4172ad0e,0x2407d0dd
	.word  0x51ab7288,0x78bb54ec,0x720b4d59,0x48c6df2d
	.word  0x46fa81c6,0xeee47d25,0x034e71b0,0x7368338b
	.word  0x7e12baa1,0x967e038d,0xb0600a44,0x007ceabd
	.word  0xaa9b7ebf,0x8d94d621,0x815305ce,0x733345ff
	.word  0x4589ed65,0x68292b01,0x968f0914,0x02f0ff71
	.word  0x4a4ba277,0x62a699df,0xf3d772d2,0x904519da
	.word  0x16cd7b20,0x79d92387,0x8f704fe4,0x426f4c29
	.word  0x72eb6619,0x8d0aaf0b,0x43eb7ae8,0x906d9470
	.word  0x307db5d2,0xf9b49a1e,0xb44cd156,0x82a4d6d5
	.word  0x1801d61a,0x3d04a01a,0xddfae0b8,0xdc25b914
	.word  0x71c7082c,0xa47da483,0x74a84697,0x53631b81
	.word  0x46ecf921,0x26cf603e,0xb0d69c98,0xd156227b
	.word  0xd96e86a4,0x4df472e7,0x656e2910,0x75e56d51
	.word  0x097c8a79,0x5cf15345,0x523872ad,0x71ba9776
	.word  0xa734e8ae,0x5c0fa1dd,0x4e3d528a,0x8b5550f8
	.word  0x5df9bdbe,0x3a8b61a4,0x46b30f85,0x812c8496
	.word  0xef0c61fa,0xd951f9f9,0x92928d01,0xe5dd25b4
	.word  0xe04a7fe5,0x1cc193ac,0xd7b37e51,0x4bf87b30
	.word  0x998a1daa,0x7aeb0aa7,0x68e897ae,0xc074982f
	.word  0x3c86cf42,0xa089a6b0,0x8959e75f,0x9e541570
	.word  0x01b73a4d,0xd07fad65,0xcec297a9,0x9845ee6c
	.word  0xb06d8694,0xba15ba15,0x191ce8bc,0xb0c11f55
	.word  0x87665a4a,0x19d28b7b,0xb782bc62,0xb12e46b3
	.word  0x0d730d76,0x1e52760a,0xa59001e3,0x0f38dd12
	.word  0xc160e590,0x0bc821e4,0x32082698,0xc2dec3a8
	.word  0x48ff11ff,0xeeedf004,0xc7df8e7e,0xa7e4a6ee
	.word  0xc7ca9b59,0x949cce48,0xa6682be7,0x807314cd
	.word  0x4f1a611f,0x36720b44,0xcab9a8fa,0xb3b2bf52
	.word  0xf14b5829,0x98192b2b,0x6b8a1c17,0x417bedcb
	.word  0x3614093b,0x8bf54f5e,0x78915702,0x0f0a4e34
	.word  0x8564caa9,0xb8db39d8,0x8b7cf94c,0xf677415a
	.word  0x8474796a,0x2e95e8ba,0x29f8df1a,0xb6686bea
	.word  0x0e7d935d,0x8d3d046a,0xdc55ee76,0xbbc5fa4a
	.word  0x387365c1,0x8ec18051,0xf4df0000,0xf20be62c
	.word  0x708fc972,0x30fa3302,0x11a78cf9,0x659cb071
	.word  0x1821ca8b,0x11636214,0x73f93e90,0xb831b219
	.word  0x9720c3e1,0xb3f12925,0xcb4ce8db,0x140399c5
	.word  0x79c160b0,0x745b0155,0xf354b446,0x86f8bcf6
	.word  0x711f7ad9,0x8a962f8c,0xc1a7a72c,0x51d5a357
	.word  0x50ae7f13,0x52e00bf3,0x0135b19e,0xd6997f94
	.word  0x229b8e73,0x48e01fde,0x44378a94,0xb1ad9490
	.word  0x30cc2fde,0x019dc725,0x07fb5bd6,0x74dcf424
	.word  0x6e7e77eb,0x18e2c669,0x4e8b1c19,0x9066d31f
	.word  0x23ef46fc,0x95e3857f,0x7a7f997a,0x4bfeb621
	.word  0xf40db778,0x410dbeea,0x1ebeed88,0x76d59e15
	.word  0xd87c6c81,0xcc92b56a,0x023067d5,0xed6ce8dc
	.word  0x57ea8a64,0xebe5dea0,0xd1a3163e,0xcae9664a
	.word  0x1ffce337,0xa670cd51,0x936ef379,0x7bc279f0
	.word  0x9d157ee7,0x82975317,0x353d25e7,0x5591aef4
	.word  0x32713017,0x73fe378e,0xcd86553b,0x324a6b0d
	.word  0x6c4c113a,0x4c763efc,0xdc50a40c,0x0437f54d
	.word  0x0bb98bde,0xcbea6fbc,0x050ae5f9,0x5e3e73dc
	.word  0x461187e9,0x14429d42,0x9b6cff8d,0x67c435b2
	.word  0x9f036d54,0x63edb327,0x7e5b17c5,0xeea1a3cf
	.word  0xf18a45d7,0xb1dea07e,0xb4c11326,0x729c34c2
	.word  0xa64d5330,0x30f7da58,0x2d55b378,0x72c4518d
	.word  0x4f8364b7,0x13a36dd7,0xd47d1f8d,0xb0b6a5ed
	.word  0xc2510993,0x6f748508,0x56de3828,0xee04a091
	.word  0x6202caf9,0x5136b39e,0xd560fdd9,0x0e4531c0
	.word  0x6d3d326a,0x34acc6d4,0xb5116eb3,0x06ad9757
	.word  0x92dba045,0x98406c6b,0x8c658bb1,0xddd3fc59
	.word  0xa1e9c6a7,0x321f6add,0xe53651a8,0x32b26ab7
	.word  0x6001277c,0xe95a99ef,0x22a7c7ca,0x717f40d6
	.word  0x7e015389,0xac3f96ba,0x5331365b,0x3ac37c4d
	.word  0x37060701,0xf51ec411,0x07721c33,0x1aa947e6
	.word  0x251bea27,0xe6c4a891,0xc422f5ea,0x19bba364
	.word  0xc4e7b080,0x7ed16b1d,0x65a45366,0x05b3ff86
	.word  0xa88b38c1,0x4462f8b2,0x628275b5,0x8b20f3ce
	.word  0x44137ce6,0x8016ddba,0x937a2a7c,0xa2846cd0
	.word  0x1485bfde,0x60f38c9e,0xaabafd42,0x067bc9e7
	.word  0x524c8e50,0x9474ef7d,0x35e60074,0x65afc7f3
	.word  0x6735a329,0x18593bff,0x6a3a8123,0x779a5e14
	.word  0xda8ace9e,0xbd6ec61e,0x51844773,0x418f56ce
	.word  0xf92f4d1a,0x10968aaa,0xefacc744,0xcb48b80b
	.word  0x66f19b59,0xe1fe2077,0x72b18a9e,0x4e23f2d1
	.word  0x9704f8b2,0x94b99630,0xd55e6ddb,0xdbb9e452
	.word  0x4f8bd2b7,0x8d3fa471,0x8405fb3f,0x8b5b1351
	.word  0xa6458724,0xed38ce62,0xadb783fc,0xec761c7f
	.word  0x88135c8a,0xba6fd558,0x43b3de17,0x954a8715
	.word  0x0eb8fad8,0x902fadd6,0x84f7d6ac,0xa256d812
	.word  0xe68bfac4,0x78a8cd43,0xea9e31f6,0xb7af9ea4
	.word  0x938ea3ba,0x42cc957b,0x1a1fda7e,0x4256234b
	.word  0x007eb289,0xd90b3f54,0xa5832380,0xfe3e4697
	.word  0xce718da1,0x5fd4dd68,0x158002a7,0x3a485c4a
	.word  0xbf3b38d5,0xd97b8d11,0x9b1b8e8d,0x22899be7
	.word  0x5b1f54de,0x974f40ec,0x4d80422f,0x437b4556
	.word  0xa5f44ed8,0x44100370,0xcdf35b13,0x82462996
	.word  0x611d7ef0,0xaa1bcc3f,0x10a7649b,0xd6b0e3ae
	.word  0xbb847cce,0xe6e8317b,0x0d61b8ab,0xacf99396
	.word  0x812b20b2,0x927ab629,0x85efe578,0x814480cb
	.word  0xf38f2765,0xde8a1bb8,0x650c7e42,0xbeee4b93
	.word  0xe8f02d2e,0x60240383,0x89286480,0x7eafe096
	.word  0x2acbf7ee,0xf6fbba03,0xd53c3993,0xb00a367d
	.word  0xdb13f44d,0x27c29f0d,0xf9db0bd2,0x18c468a0
	.word  0x62b802fe,0xe6ba414c,0xdf6f1d90,0x0cfe9b91
	.word  0xd581b7d9,0x46bf9559,0xc57386fd,0xc2150b6e
	.word  0x49be7b69,0x78102b70,0x0044ce4a,0xbc856921
	.word  0x157b7240,0xf75953a8,0x29a8bea3,0x219ab731
	.word  0x48df162f,0x8e025933,0x71f2b994,0x38c8ad93
	.word  0x768a95ff,0x878b2404,0x94b18c3b,0x84823ded
	.word  0x8c427346,0x83fe841f,0xa6132c6b,0x6c69fcd5
	.word  0x55cc32e7,0xad1f3571,0xa69d3cc7,0xa911f516
	.word  0xa06fb189,0x1a66e9cc,0x59b2efbe,0x72ec59ec
	.word  0x9f603039,0x95419d7c,0x65c3348f,0xc441c210
	.word  0xfb369509,0x1ec64017,0xdf9da972,0xa4216f3e
	.word  0x65a40db3,0x700275b2,0xf2fe0499,0x3de26325
	.word  0x7be3c984,0xd7113653,0x4f5a2448,0x9919f447
	.word  0xd5a02505,0x983e2bf9,0xd6f29387,0x52edf01b
	.word  0xdb5f54b3,0xd9188fc3,0xe2740f22,0x0b0e1625
	.word  0xf7fe5d90,0x3033f0a9,0x3a7c891c,0x7ac5c0e5
	.word  0xb8353349,0x419bc89a,0x93cfa09b,0x1e6ca86a
	.word  0x83833cd7,0xea6b5dd9,0x5a80f0e4,0xbc205d26
	.word  0xe6cc7d42,0x7caef58c,0x4ef96d9e,0x8aef0a67
	.word  0x7560ce31,0x70dc53a3,0x2df50d1e,0x25cdd4ff
	.word  0xeb568854,0x6ff959a4,0x9655ac34,0x5e0242d1
	.word  0x76f6d0c1,0x117a2549,0x5c47b0c9,0x7023183f
	.word  0x26e937e0,0x038db79e,0xa7f65c89,0x3abf8b1c
	.word  0x0a0c2963,0x08971aa7,0xfda835b9,0x35253e90
	.word  0x74a24feb,0x6d1aa94a,0x01550c7a,0x78d25795
	.word  0x3c6343c4,0x0b23abf0,0x82f0fff8,0x02b00568
	.word  0x11efcdcd,0x64d6b376,0x08de4104,0xb7f8d142
	.word  0xe509d76d,0x5f777f7e,0xcef46183,0xc7dfaa07
	.word  0xdf4539d4,0x45309914,0xd687703f,0x6fc3b13b
	.word  0x62830bd9,0x05185479,0xafb0e818,0x0f194fb6
	.word  0xc73c1072,0xc90c00d8,0x1de79413,0x7803a304
	.word  0x098f42cc,0x2dd6142d,0xbc7de7d3,0x406b2ad2
	.word  0x031058fa,0x456cf63c,0x9b790cd9,0x04f7f973
	.word  0x4edac295,0x31f71fa4,0xf95bb8d2,0x3e4249a7
	.word  0x6fdc1370,0xa2d2ce0a,0xe8af93df,0xaf7e71d0
	.word  0xa79d208b,0x4072d40d,0x9827cbbf,0x9a3f578d
	.word  0x7db7b06d,0x7aaac399,0xcb401b4f,0x2b3de606
	.word  0x3f075cf2,0xb321a240,0xe1ee0a80,0xc3d527bc
	.word  0xb4b38368,0x394ad729,0x20cf9837,0xb42d8801
	.word  0xe985c91c,0x01205028,0x4a82b6a3,0x974fd2ec
	.word  0x77695695,0xb7b86b66,0x16a61103,0x084fc9fd
	.word  0x5b4ae5eb,0xe4cf3a7c,0x365d8340,0xe79e8c13
	.word  0xc6fd0e82,0x52cf2d05,0x7f874e3f,0xee0862bc
	.word  0x872b50d0,0xd5c3cb6a,0xf1b2262a,0x4234c433
	.word  0x68abdfbe,0xb2bea9be,0xbe9ceba4,0x60421e5f
	.word  0xed1b7218,0x0430017b,0x2d16e615,0x9018be0a
	.word  0x4127ab89,0xb444a68e,0x4fcf16b2,0x1b2d035d
	.word  0xe4203efd,0xefec3a68,0x93e250c8,0xecef5d4b
	.word  0x828a2a9f,0xa33c225f,0x659a8541,0xbaee77dd
	.word  0x20a9e1a5,0x2888de52,0xf8cc8c60,0x76f50365
	.word  0x963fa21f,0xaac09070,0x938356a6,0x4fc19bda
	.word  0x1be9f3d3,0x0327bbbe,0x81ea52a9,0xd6ccd435
	.word  0x2687c75a,0x0f7af3d8,0x7e45b498,0x666cb693
	.word  0xd0cdca1d,0x6037d997,0xc438383b,0x05f09a21
	.word  0x74819905,0x5f8b0f8b,0x8d363fc0,0x381cb03a
	.word  0x4a066dc7,0x4d278555,0x8f189e63,0xa9a2df8c
	.word  0xb3a98dfd,0x1205eeb8,0xdc419a37,0xdd805cea
	.word  0x10144a3e,0xefa5d39a,0xd1b2c949,0xc4eaad79
	.word  0xf6c3f897,0x1bb25a72,0x710a73de,0xed30aabb
	.word  0xa5a776b2,0xff117827,0xaef7eff2,0xaa803d0c
	.word  0xaa519556,0xaa9dc5cd,0x8b0ac3c0,0x5a4184a4
	.word  0x50a33879,0xa79ed6df,0x5d6b4e66,0xd8082218
	.word  0x0bce3421,0x93108675,0xb4879e39,0x2f4c51ef
	.word  0xee4e6486,0xfe4957c2,0x96411394,0x0da69614
	.word  0x4a5e5449,0x7689e03d,0xf30a66ae,0xf531d79a
	.word  0xcc1cb230,0xd6d276fa,0x66119b12,0x0e0ccf65
	.word  0x7116e369,0x386370ce,0x67f0bbd4,0x758eb00a
	.word  0x0f83262e,0x36129a01,0xd938dfdd,0xd8792199
	.word  0x3e123045,0x684a85ad,0x1b393de6,0x87e22849
	.word  0xc5011c93,0x3c57065e,0x19b06d9a,0x98e70e76
	.word  0xfce6f15c,0x81bee7b3,0x49c0c5aa,0xc9509f7b
	.word  0xb47e8eea,0xe41dadb0,0x2c6c5199,0x3897a2cf
	.word  0x40c70382,0x731ab85a,0xbc929a5c,0x8be59d4c
	.word  0xc210c28b,0x09634c30,0x0afaac42,0x145ce108
	.word  0xbe20ccee,0x9aedecb0,0x27f56d79,0xb1822a16
	.word  0x97d4bb4f,0xf17853bc,0x1c5b3e97,0x56a875c6
	.word  0x308f29eb,0xdbf3019a,0x2366ff30,0x7f1f4b84
	.word  0x0c1d4faf,0x52a24538,0x0a1f2c7e,0x433ea8b3

!!# /************************************************************
!!# *
!!# * File:         divs0.j
!!# *
!!# * Description:  Contention for divider with stb raw and
!!# * 		Contention in the delay slot
!!# *
!!# **************************************************************/
!!# 
!!# --c_declarations
!!# 
!!#   int i;
!!#   int burst_cnt;
!!# 
!!# --setup
!!# 
!!#   IJ_set_thread_count(4);
!!# 
!!# --init
!!# 
!!#   printf ("**********************************\n");
!!# 
!!#   IJ_set_ropr_fld (ijdefault, Ft_Rs1, "{8}");
!!#   IJ_set_ropr_fld (ijdefault, Ft_Rs2, "{9}");
!!#   IJ_set_ropr_fld (ijdefault, Ft_Rd, "{1..7, 10..31}"); 
!!#   IJ_set_ropr_fld (ijdefault, Fm_align_Rd, "1'b1");
!!#   IJ_set_ropr_fld (ijdefault, Ft_Simm13, "13'b0rrrrrrrrrr00");
!!# //  IJ_set_ropr_fld (ijdefault, Fm_align_Simm13, "3'b111");
!!#   IJ_set_ropr_fld (ijdefault, Ft_Imm_Asi, "{0x80}");
!!#   IJ_set_ropr_fld (ijdefault, Ft_Cc1_f2, "1'br");
!!#   IJ_set_ropr_fld (ijdefault, Ft_Cc0_f2, "1'b0");
!!#   IJ_set_ropr_fld (ijdefault, Ft_P, "1'br");
!!#   IJ_set_ropr_fld (ijdefault, Ft_A, "1'br");  
!!#   IJ_set_ropr_fld (ijdefault, Ft_D16, "{0x1, 0x1}");
!!#   IJ_set_ropr_fld (ijdefault, Ft_Disp22, "{0x1, 0x2}");
!!#   IJ_set_ropr_fld (ijdefault, Ft_Disp19, "{0x1, 0x2}");
!!#   IJ_set_ropr_fld (ijdefault, Ft_Disp30, "{0x1, 0x2}");
!!#   IJ_set_ropr_fld (ijdefault, Ft_Cmask, "3'brrr");
!!#   IJ_set_ropr_fld (ijdefault, Ft_Mmask, "4'brrrr");
!!# 
!!#   IJ_set_rvar (reg_rand_init, "64'h0000000000000rr0");
!!# 
!!#   IJ_printf ("th", "        setx  MAIN_BASE_DATA_VA, %%r1, %%r8\n");
!!#   IJ_printf ("th", "        setx  0x%016llrx, %%g1, %%r9\n", reg_rand_init);
!!# 
!!#   IJ_printf ("th", "        setx  0x80, %%g2, %%g1\n");
!!#   IJ_printf ("th", "        wr  %%g1, %%g0, %%asi\n");
!!# 
!!#   IJ_printf ("th", "	    rd %%fprs, %%g1\n");
!!#   IJ_printf ("th", "        wr %%g1, 0x4, %%fprs\n");
!!# 
!!#   IJ_init_fp_regs ("th", 8);
!!# 
!!#   IJ_set_rvar (reg_rand_init, "64'hrrrrrrrr rrrrrrrr");
!!# 
!!#   for (i = 0; i < 8; i++) {
!!#      IJ_printf ("th", "        setx  0x%016llrx, %%g1, %%r%d\n", reg_rand_init, i);
!!#   }
!!#   for (i = 10; i < 32; i++) {
!!#      IJ_printf ("th", "        setx  0x%016llrx, %%g1, %%r%d\n", reg_rand_init, i);
!!#   }
!!# 
!!#   IJ_set_rvar (data_rand_init, "32'hrrrrrrrr");
!!#   IJ_printf ("-", ".data\n");
!!#   for (i = 0; i < 128; i++) {
!!#     IJ_printf ("-", "	.word  0x%08rx,0x%08rx,0x%08rx,0x%08rx\n", data_rand_init, data_rand_init, data_rand_init, data_rand_init);
!!#     IJ_printf ("-", "	.word  0x%08rx,0x%08rx,0x%08rx,0x%08rx\n", data_rand_init, data_rand_init, data_rand_init, data_rand_init);
!!#   }
!!# 
!!#   IJ_set_rvar (div_wt, "{3}");
!!# 
!!# --finish
!!# ;
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
!!# 	nop
!!# 	nop
!!# 	nop
!!#         ta      T_GOOD_TRAP
!!# 
!!# th_main_1:
!!# !<<IJ>>include "th1.s"
!!# 	nop
!!# 	nop
!!# 	nop
!!#         ta      T_GOOD_TRAP
!!# 
!!# th_main_2:
!!# !<<IJ>>include "th2.s"
!!# 	nop
!!# 	nop
!!# 	nop
!!#         ta      T_GOOD_TRAP
!!# 
!!# th_main_3:
!!# !<<IJ>>include "th3.s"
!!# 	nop
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
!!#             ;
!!# 
!!# inst_type: stb_raw_div 
!!# 	   | stb_raw_div_div
!!# 	   | br_div 
!!#     	   | stb_raw_ld_div 
!!# 	   | stb_raw_alu_div
!!# 	   | stb_raw_alu_alu_alu_div 
!!# 	   | alu_burst
!!# 	   | div %rvar div_wt 
!!# 		{
!!# 		   IJ_generate ("th0", $1);
!!# 		}
!!# ;
!!# 
!!# load: load_r | load_i | asi_load
!!# ;
!!# 
!!# div: tUDIV_I | tUDIV_R | tSDIV_I | tSDIV_R | tSDIVX_R | tSDIVX_I | tUDIVX_R | tUDIVX_I | tUDIVcc_I | tUDIVcc_R | tSDIVcc_I | tSDIVcc_R
!!# ;
!!# 
!!# load_i: tLDSB_I | tLDSH_I | tLDSW_I | tLDUB_I | tLDUH_I | tLDUW_I | tLDX_I | tLDD_I 
!!# ;
!!# 
!!# asi_load: tLDSBA_R | tLDSBA_I | tLDSHA_R | tLDSHA_I | tLDSWA_R | tLDSWA_I | tLDUBA_R | tLDUBA_I | tLDUHA_R | tLDUHA_I | tLDUWA_R | tLDUWA_I | tLDXA_R | tLDXA_I | tLDDA_R | tLDDA_I 
!!# ;
!!# 
!!# br: tBA | tBN | tBNE | tBE | tBG | tBLE | tBGE | tBL | tBGU | 
!!#     tBLEU | tBCC | tBCS | tBPOS | tBNEG | tBVC | tBVS | tBRZ |
!!#     tBRLEZ | tBRLZ | tBRNZ | tBRGZ | tBRGEZ | tCALL 
!!# ;
!!# 
!!# store_r: tSTB_R | tSTH_R | tSTW_R | tSTX_R | tSTF_R | tSTDF_R
!!# ;
!!# 
!!# load_r: tLDSB_R | tLDSH_R | tLDSW_R | tLDUB_R | tLDUH_R | tLDUW_R | tLDX_R | tLDD_R | tLDF_R | tLDDF_R
!!# ;
!!# 
!!# alu: tADD_R | tADD_I | tADDcc_R | tADDcc_I | tADDC_R | tADDC_I | tADDCcc_R | tADDCcc_I | tAND_R | tAND_I | tANDcc_R | tANDcc_I | tANDN_R | tANDN_I | tANDNcc_R | tANDNcc_I | tOR_R | tOR_I | tORcc_R | tORcc_I | tORN_R | tORN_I | tORNcc_R | tORNcc_I | tXOR_R | tXOR_I | tXORcc_R | tXORcc_I | tXNOR_R | tXNOR_I | tXNORcc_R | tXNORcc_I | tMOVcc_R | tMOVcc_I | tMOVR_R | tMOVR_I | tSLL_R | tSLL_I | tSRL_R | tSRL_I | tSRA_R | tSRA_I | tSLLX_R | tSLLX_I | tSRLX_R | tSRLX_I | tSRAX_R | tSRAX_I | tSUB_R | tSUB_I | tSUBcc_R | tSUBcc_I | tSUBC_R | tSUBC_I | tSUBCcc_R | tSUBCcc_R | tSUBCcc_I
!!# ;
!!# 
!!# br_div: br div
!!# {
!!#    IJ_generate_va ("th1:2:3", $1, $2, NULL);
!!# }
!!# ;
!!# 
!!# stb_raw_div: store_r load_r div
!!# {
!!#    IJ_generate_va ("th1:2:3", $1, $2, $3, NULL);
!!# }
!!# ;
!!# 
!!# stb_raw_div_div: store_r load_r div div
!!# {
!!#    IJ_generate_va ("th1:2:3", $1, $2, $3, $4, NULL);
!!# }
!!# ;
!!# 
!!# stb_raw_ld_div: store_r load_r load div
!!# {
!!#    IJ_generate_va ("th1:2:3", $1, $2, $3, $4, NULL);
!!# }
!!# ;
!!# 
!!# stb_raw_alu_div: store_r load_r alu div
!!# {
!!#    IJ_generate_va ("th1:2:3", $1, $2, $3, $4, NULL);
!!# }
!!# ;
!!# 
!!# stb_raw_alu_alu_alu_div: store_r load_r alu alu alu div
!!# {
!!#    IJ_generate_va ("th1:2:3", $1, $2, $3, $4, $5, $6, NULL);
!!# }
!!# ;
!!# 
!!# alu_burst: mMETA0
!!# { 
!!#    burst_cnt = random () % 6 + 10; 
!!# 
!!#    IJ_generate_from_token (burst_cnt, "th1", ijdefault, tADD_R, tADD_I, tADDcc_R, tADDcc_I, tADDC_R, tADDC_I, tADDCcc_R, tADDCcc_I, tAND_R, tAND_I, tANDcc_R, tANDcc_I, tANDN_R, tANDN_I, tANDNcc_R, tANDNcc_I, tOR_R, tOR_I, tORcc_R, tORcc_I, tORN_R, tORN_I, tORNcc_R, tORNcc_I, tXOR_R, tXOR_I, tXORcc_R, tXORcc_I, tXNOR_R, tXNOR_I, tXNORcc_R, tXNORcc_I, tMOVcc_R, tMOVcc_I, tMOVR_R, tMOVR_I, tSLL_R, tSLL_I, tSRL_R, tSRL_I, tSRA_R, tSRA_I, tSLLX_R, tSLLX_I, tSRLX_R, tSRLX_I, tSRAX_R, tSRAX_I, tSUB_R, tSUB_I, tSUBcc_R, tSUBcc_I, tSUBC_R, tSUBC_I, tSUBCcc_R, tSUBCcc_R, tSUBCcc_I, NULL);
!!# 
!!#    IJ_generate_from_token (burst_cnt, "th2", ijdefault, tADD_R, tADD_I, tADDcc_R, tADDcc_I, tADDC_R, tADDC_I, tADDCcc_R, tADDCcc_I, tAND_R, tAND_I, tANDcc_R, tANDcc_I, tANDN_R, tANDN_I, tANDNcc_R, tANDNcc_I, tOR_R, tOR_I, tORcc_R, tORcc_I, tORN_R, tORN_I, tORNcc_R, tORNcc_I, tXOR_R, tXOR_I, tXORcc_R, tXORcc_I, tXNOR_R, tXNOR_I, tXNORcc_R, tXNORcc_I, tMOVcc_R, tMOVcc_I, tMOVR_R, tMOVR_I, tSLL_R, tSLL_I, tSRL_R, tSRL_I, tSRA_R, tSRA_I, tSLLX_R, tSLLX_I, tSRLX_R, tSRLX_I, tSRAX_R, tSRAX_I, tSUB_R, tSUB_I, tSUBcc_R, tSUBcc_I, tSUBC_R, tSUBC_I, tSUBCcc_R, tSUBCcc_R, tSUBCcc_I, NULL);
!!# 
!!#    IJ_generate_from_token (burst_cnt, "th3", ijdefault, tADD_R, tADD_I, tADDcc_R, tADDcc_I, tADDC_R, tADDC_I, tADDCcc_R, tADDCcc_I, tAND_R, tAND_I, tANDcc_R, tANDcc_I, tANDN_R, tANDN_I, tANDNcc_R, tANDNcc_I, tOR_R, tOR_I, tORcc_R, tORcc_I, tORN_R, tORN_I, tORNcc_R, tORNcc_I, tXOR_R, tXOR_I, tXORcc_R, tXORcc_I, tXNOR_R, tXNOR_I, tXNORcc_R, tXNORcc_I, tMOVcc_R, tMOVcc_I, tMOVR_R, tMOVR_I, tSLL_R, tSLL_I, tSRL_R, tSRL_I, tSRA_R, tSRA_I, tSLLX_R, tSLLX_I, tSRLX_R, tSRLX_I, tSRAX_R, tSRAX_I, tSUB_R, tSUB_I, tSUBcc_R, tSUBcc_I, tSUBC_R, tSUBC_I, tSUBCcc_R, tSUBCcc_R, tSUBCcc_I, NULL);
!!# }
!!# ;
!! Token Generation Statistics
!! ---------------------------------
!! 
!! Rule   1 (line  118), Count:   999  inst_block           -> inst_type 
!! Rule   2 (line  119), Count:   999  inst_block           -> inst_block inst_type 
!! Rule   3 (line  122), Count:    96  inst_type            -> stb_raw_div 
!! Rule   5 (line  124), Count:   100  inst_type            -> br_div 
!! Rule   6 (line  125), Count:   116  inst_type            -> stb_raw_ld_div 
!! Rule   7 (line  126), Count:    25  inst_type            -> stb_raw_alu_div 
!! Rule   9 (line  128), Count:    99  inst_type            -> alu_burst 
!! Rule  10 (line  129), Count:   558  inst_type            -> div 
!! Rule  11 (line  135), Count:   104  load                 -> load_r 
!! Rule  12 (line  135), Count:     5  load                 -> load_i 
!! Rule  13 (line  135), Count:     5  load                 -> asi_load 
!! Rule  14 (line  138), Count:    50  div                  -> tUDIV_I 
!! Rule  15 (line  138), Count:    44  div                  -> tUDIV_R 
!! Rule  16 (line  138), Count:    47  div                  -> tSDIV_I 
!! Rule  17 (line  138), Count:    39  div                  -> tSDIV_R 
!! Rule  18 (line  138), Count:    35  div                  -> tSDIVX_R 
!! Rule  19 (line  138), Count:    46  div                  -> tSDIVX_I 
!! Rule  20 (line  138), Count:    43  div                  -> tUDIVX_R 
!! Rule  21 (line  138), Count:    44  div                  -> tUDIVX_I 
!! Rule  22 (line  138), Count:    57  div                  -> tUDIVcc_I 
!! Rule  23 (line  138), Count:    49  div                  -> tUDIVcc_R 
!! Rule  24 (line  138), Count:    48  div                  -> tSDIVcc_I 
!! Rule  25 (line  138), Count:    45  div                  -> tSDIVcc_R 
!! Rule  27 (line  141), Count:     0  load_i               -> tLDSH_I 
!! Rule  29 (line  141), Count:     0  load_i               -> tLDUB_I 
!! Rule  30 (line  141), Count:     1  load_i               -> tLDUH_I 
!! Rule  31 (line  141), Count:     0  load_i               -> tLDUW_I 
!! Rule  32 (line  141), Count:     0  load_i               -> tLDX_I 
!! Rule  35 (line  144), Count:     1  asi_load             -> tLDSBA_I 
!! Rule  40 (line  144), Count:     0  asi_load             -> tLDUBA_R 
!! Rule  43 (line  144), Count:     0  asi_load             -> tLDUHA_I 
!! Rule  48 (line  144), Count:     1  asi_load             -> tLDDA_R 
!! Rule  50 (line  147), Count:     3  br                   -> tBA 
!! Rule  51 (line  147), Count:     1  br                   -> tBN 
!! Rule  52 (line  147), Count:     6  br                   -> tBNE 
!! Rule  53 (line  147), Count:     5  br                   -> tBE 
!! Rule  54 (line  147), Count:     4  br                   -> tBG 
!! Rule  55 (line  147), Count:     1  br                   -> tBLE 
!! Rule  56 (line  147), Count:     3  br                   -> tBGE 
!! Rule  57 (line  147), Count:     3  br                   -> tBL 
!! Rule  58 (line  147), Count:     6  br                   -> tBGU 
!! Rule  59 (line  147), Count:     1  br                   -> tBLEU 
!! Rule  60 (line  148), Count:     6  br                   -> tBCC 
!! Rule  61 (line  148), Count:     3  br                   -> tBCS 
!! Rule  62 (line  148), Count:     2  br                   -> tBPOS 
!! Rule  63 (line  148), Count:     0  br                   -> tBNEG 
!! Rule  64 (line  148), Count:     2  br                   -> tBVC 
!! Rule  65 (line  148), Count:     5  br                   -> tBVS 
!! Rule  66 (line  148), Count:     4  br                   -> tBRZ 
!! Rule  67 (line  148), Count:     7  br                   -> tBRLEZ 
!! Rule  68 (line  149), Count:     1  br                   -> tBRLZ 
!! Rule  69 (line  149), Count:     1  br                   -> tBRNZ 
!! Rule  70 (line  149), Count:     8  br                   -> tBRGZ 
!! Rule  71 (line  149), Count:     2  br                   -> tBRGEZ 
!! Rule  72 (line  149), Count:     4  br                   -> tCALL 
!! Rule  73 (line  152), Count:    17  store_r              -> tSTB_R 
!! Rule  74 (line  152), Count:    15  store_r              -> tSTH_R 
!! Rule  75 (line  152), Count:    19  store_r              -> tSTW_R 
!! Rule  76 (line  152), Count:    12  store_r              -> tSTX_R 
!! Rule  77 (line  152), Count:    14  store_r              -> tSTF_R 
!! Rule  78 (line  152), Count:    14  store_r              -> tSTDF_R 
!! Rule  79 (line  155), Count:    15  load_r               -> tLDSB_R 
!! Rule  80 (line  155), Count:     5  load_r               -> tLDSH_R 
!! Rule  81 (line  155), Count:     5  load_r               -> tLDSW_R 
!! Rule  82 (line  155), Count:     9  load_r               -> tLDUB_R 
!! Rule  83 (line  155), Count:     7  load_r               -> tLDUH_R 
!! Rule  84 (line  155), Count:    10  load_r               -> tLDUW_R 
!! Rule  85 (line  155), Count:     7  load_r               -> tLDX_R 
!! Rule  86 (line  155), Count:    11  load_r               -> tLDD_R 
!! Rule  87 (line  155), Count:    14  load_r               -> tLDF_R 
!! Rule  88 (line  155), Count:    12  load_r               -> tLDDF_R 
!! Rule  91 (line  158), Count:     0  alu                  -> tADDcc_R 
!! Rule  92 (line  158), Count:     0  alu                  -> tADDcc_I 
!! Rule  97 (line  158), Count:     0  alu                  -> tAND_R 
!! Rule  99 (line  158), Count:     1  alu                  -> tANDcc_R 
!! Rule 103 (line  158), Count:     0  alu                  -> tANDNcc_R 
!! Rule 105 (line  158), Count:     0  alu                  -> tOR_R 
!! Rule 106 (line  158), Count:     0  alu                  -> tOR_I 
!! Rule 107 (line  158), Count:     0  alu                  -> tORcc_R 
!! Rule 108 (line  158), Count:     0  alu                  -> tORcc_I 
!! Rule 113 (line  158), Count:     0  alu                  -> tXOR_R 
!! Rule 116 (line  158), Count:     0  alu                  -> tXORcc_I 
!! Rule 120 (line  158), Count:     0  alu                  -> tXNORcc_I 
!! Rule 122 (line  158), Count:     0  alu                  -> tMOVcc_I 
!! Rule 123 (line  158), Count:     1  alu                  -> tMOVR_R 
!! Rule 127 (line  158), Count:     0  alu                  -> tSRL_R 
!! Rule 129 (line  158), Count:     1  alu                  -> tSRA_R 
!! Rule 130 (line  158), Count:     0  alu                  -> tSRA_I 
!! Rule 134 (line  158), Count:     1  alu                  -> tSRLX_I 
!! Rule 139 (line  158), Count:     0  alu                  -> tSUBcc_R 
!! Rule 142 (line  158), Count:     0  alu                  -> tSUBC_I 
!! Rule 143 (line  158), Count:     1  alu                  -> tSUBCcc_R 
!! Rule 146 (line  161), Count:   100  br_div               -> br div 
!! Rule 147 (line  167), Count:    96  stb_raw_div          -> store_r load_r div 
!! Rule 149 (line  179), Count:   116  stb_raw_ld_div       -> store_r load_r load div 
!! Rule 150 (line  185), Count:    25  stb_raw_alu_div      -> store_r load_r alu div 
!! 
!!   257: Token tUDIV_I	Count = 51
!!   258: Token tUDIV_R	Count = 45
!!   259: Token tSDIV_I	Count = 48
!!   260: Token tSDIV_R	Count = 40
!!   261: Token tSDIVX_R	Count = 36
!!   262: Token tSDIVX_I	Count = 47
!!   263: Token tUDIVX_R	Count = 44
!!   264: Token tUDIVX_I	Count = 45
!!   265: Token tUDIVcc_I	Count = 58
!!   266: Token tUDIVcc_R	Count = 50
!!   267: Token tSDIVcc_I	Count = 49
!!   268: Token tSDIVcc_R	Count = 46
!!   269: Token tLDSB_I	Count = 0
!!   270: Token tLDSH_I	Count = 1
!!   271: Token tLDSW_I	Count = 0
!!   272: Token tLDUB_I	Count = 1
!!   273: Token tLDUH_I	Count = 2
!!   274: Token tLDUW_I	Count = 1
!!   275: Token tLDX_I	Count = 1
!!   276: Token tLDD_I	Count = 0
!!   277: Token tLDSBA_R	Count = 0
!!   278: Token tLDSBA_I	Count = 2
!!   279: Token tLDSHA_R	Count = 0
!!   280: Token tLDSHA_I	Count = 0
!!   281: Token tLDSWA_R	Count = 0
!!   282: Token tLDSWA_I	Count = 0
!!   283: Token tLDUBA_R	Count = 1
!!   284: Token tLDUBA_I	Count = 0
!!   285: Token tLDUHA_R	Count = 0
!!   286: Token tLDUHA_I	Count = 1
!!   287: Token tLDUWA_R	Count = 0
!!   288: Token tLDUWA_I	Count = 0
!!   289: Token tLDXA_R	Count = 0
!!   290: Token tLDXA_I	Count = 0
!!   291: Token tLDDA_R	Count = 2
!!   292: Token tLDDA_I	Count = 0
!!   293: Token tBA	Count = 4
!!   294: Token tBN	Count = 2
!!   295: Token tBNE	Count = 7
!!   296: Token tBE	Count = 6
!!   297: Token tBG	Count = 5
!!   298: Token tBLE	Count = 2
!!   299: Token tBGE	Count = 4
!!   300: Token tBL	Count = 4
!!   301: Token tBGU	Count = 7
!!   302: Token tBLEU	Count = 2
!!   303: Token tBCC	Count = 7
!!   304: Token tBCS	Count = 4
!!   305: Token tBPOS	Count = 3
!!   306: Token tBNEG	Count = 1
!!   307: Token tBVC	Count = 3
!!   308: Token tBVS	Count = 6
!!   309: Token tBRZ	Count = 5
!!   310: Token tBRLEZ	Count = 8
!!   311: Token tBRLZ	Count = 2
!!   312: Token tBRNZ	Count = 2
!!   313: Token tBRGZ	Count = 9
!!   314: Token tBRGEZ	Count = 3
!!   315: Token tCALL	Count = 5
!!   316: Token tSTB_R	Count = 18
!!   317: Token tSTH_R	Count = 16
!!   318: Token tSTW_R	Count = 20
!!   319: Token tSTX_R	Count = 13
!!   320: Token tSTF_R	Count = 15
!!   321: Token tSTDF_R	Count = 15
!!   322: Token tLDSB_R	Count = 16
!!   323: Token tLDSH_R	Count = 6
!!   324: Token tLDSW_R	Count = 6
!!   325: Token tLDUB_R	Count = 10
!!   326: Token tLDUH_R	Count = 8
!!   327: Token tLDUW_R	Count = 11
!!   328: Token tLDX_R	Count = 8
!!   329: Token tLDD_R	Count = 12
!!   330: Token tLDF_R	Count = 15
!!   331: Token tLDDF_R	Count = 13
!!   332: Token tADD_R	Count = 0
!!   333: Token tADD_I	Count = 0
!!   334: Token tADDcc_R	Count = 1
!!   335: Token tADDcc_I	Count = 1
!!   336: Token tADDC_R	Count = 0
!!   337: Token tADDC_I	Count = 0
!!   338: Token tADDCcc_R	Count = 0
!!   339: Token tADDCcc_I	Count = 0
!!   340: Token tAND_R	Count = 1
!!   341: Token tAND_I	Count = 0
!!   342: Token tANDcc_R	Count = 2
!!   343: Token tANDcc_I	Count = 0
!!   344: Token tANDN_R	Count = 0
!!   345: Token tANDN_I	Count = 0
!!   346: Token tANDNcc_R	Count = 1
!!   347: Token tANDNcc_I	Count = 0
!!   348: Token tOR_R	Count = 1
!!   349: Token tOR_I	Count = 1
!!   350: Token tORcc_R	Count = 1
!!   351: Token tORcc_I	Count = 1
!!   352: Token tORN_R	Count = 0
!!   353: Token tORN_I	Count = 0
!!   354: Token tORNcc_R	Count = 0
!!   355: Token tORNcc_I	Count = 0
!!   356: Token tXOR_R	Count = 1
!!   357: Token tXOR_I	Count = 0
!!   358: Token tXORcc_R	Count = 0
!!   359: Token tXORcc_I	Count = 1
!!   360: Token tXNOR_R	Count = 0
!!   361: Token tXNOR_I	Count = 0
!!   362: Token tXNORcc_R	Count = 0
!!   363: Token tXNORcc_I	Count = 1
!!   364: Token tMOVcc_R	Count = 0
!!   365: Token tMOVcc_I	Count = 1
!!   366: Token tMOVR_R	Count = 2
!!   367: Token tMOVR_I	Count = 0
!!   368: Token tSLL_R	Count = 0
!!   369: Token tSLL_I	Count = 0
!!   370: Token tSRL_R	Count = 1
!!   371: Token tSRL_I	Count = 0
!!   372: Token tSRA_R	Count = 2
!!   373: Token tSRA_I	Count = 1
!!   374: Token tSLLX_R	Count = 0
!!   375: Token tSLLX_I	Count = 0
!!   376: Token tSRLX_R	Count = 0
!!   377: Token tSRLX_I	Count = 2
!!   378: Token tSRAX_R	Count = 0
!!   379: Token tSRAX_I	Count = 0
!!   380: Token tSUB_R	Count = 0
!!   381: Token tSUB_I	Count = 0
!!   382: Token tSUBcc_R	Count = 1
!!   383: Token tSUBcc_I	Count = 0
!!   384: Token tSUBC_R	Count = 0
!!   385: Token tSUBC_I	Count = 1
!!   386: Token tSUBCcc_R	Count = 2
!!   387: Token tSUBCcc_I	Count = 0
!!   388: Token mMETA0	Count = 100
!! 
!! 
!! +++ finish +++

