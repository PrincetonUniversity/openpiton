// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: bug3551.s
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
   random seed:	926696777
   Jal divs0.j:	
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
        setx  0x0000000000000000, %g1, %r9
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
        setx  0x0c51cfcf9d57f32c, %g1, %r0
        setx  0xf46b0705ac9087bc, %g1, %r1
        setx  0xadfcd966617ae86a, %g1, %r2
        setx  0x0fcc4658daf29213, %g1, %r3
        setx  0xff0451eb3c8e5463, %g1, %r4
        setx  0xed94271f38f0e1bb, %g1, %r5
        setx  0x5ced1245b1f3df55, %g1, %r6
        setx  0xfdbd2a2cabf1992d, %g1, %r7
        setx  0x83f9a6ae31e8ac51, %g1, %r10
        setx  0x35a289757330f770, %g1, %r11
        setx  0xf002fb2d16d83a6a, %g1, %r12
        setx  0xe9c01fd1a5cfcbbe, %g1, %r13
        setx  0xe8fa26872e6ef502, %g1, %r14
        setx  0x97bb62c49e7bbf8d, %g1, %r15
        setx  0x35a0e5f5a4b11afe, %g1, %r16
        setx  0x44737f7c730e402e, %g1, %r17
        setx  0xec12ac101c91c309, %g1, %r18
        setx  0xee3be91b14775be9, %g1, %r19
        setx  0x7d4259b85fa2a4df, %g1, %r20
        setx  0x0a92956dcbeb1ace, %g1, %r21
        setx  0xe935e1b3d31f58b1, %g1, %r22
        setx  0xe12f6842e9231ca3, %g1, %r23
        setx  0xda614dfec9fdf539, %g1, %r24
        setx  0x764a60dc4dfe08c2, %g1, %r25
        setx  0xa8f321d83aa29542, %g1, %r26
        setx  0xc9a5797f00972f8f, %g1, %r27
        setx  0x5821c091648996a5, %g1, %r28
        setx  0xd4d8babfac116b82, %g1, %r29
        setx  0x5afe8fb30bb3f02c, %g1, %r30
        setx  0x57305e358d4bc4b8, %g1, %r31
	.word 0x827a0009  ! 1: SDIV_R	sdiv 	%r8, %r9, %r1
	.word 0x887a2040  ! 3: SDIV_I	sdiv 	%r8, 0x0040, %r4
	.word 0x976a22ac  ! 4: SDIVX_I	sdivx	%r8, 0x02ac, %r11
	.word 0x86f227c4  ! 5: UDIVcc_I	udivcc 	%r8, 0x07c4, %r3
	.word 0x847a0009  ! 8: SDIV_R	sdiv 	%r8, %r9, %r2
	.word 0x827a2324  ! 9: SDIV_I	sdiv 	%r8, 0x0324, %r1
	.word 0x88fa0009  ! 10: SDIVcc_R	sdivcc 	%r8, %r9, %r4
	.word 0x88fa29ac  ! 11: SDIVcc_I	sdivcc 	%r8, 0x09ac, %r4
	.word 0x8a6a24ec  ! 29: UDIVX_I	udivx 	%r8, 0x04ec, %r5
	.word 0x856a2264  ! 33: SDIVX_I	sdivx	%r8, 0x0264, %r2
	.word 0x826a0009  ! 34: UDIVX_R	udivx 	%r8, %r9, %r1
	.word 0x8e6a2f28  ! 35: UDIVX_I	udivx 	%r8, 0x0f28, %r7
	.word 0x8e7a0009  ! 36: SDIV_R	sdiv 	%r8, %r9, %r7
	.word 0x887a21f0  ! 41: SDIV_I	sdiv 	%r8, 0x01f0, %r4
	.word 0x8c720009  ! 42: UDIV_R	udiv 	%r8, %r9, %r6
	.word 0xbcf20009  ! 45: UDIVcc_R	udivcc 	%r8, %r9, %r30
	.word 0x8cfa2aa4  ! 46: SDIVcc_I	sdivcc 	%r8, 0x0aa4, %r6
	.word 0x8c6a2684  ! 49: UDIVX_I	udivx 	%r8, 0x0684, %r6
	.word 0x8d6a0009  ! 60: SDIVX_R	sdivx	%r8, %r9, %r6
	.word 0x84fa229c  ! 61: SDIVcc_I	sdivcc 	%r8, 0x029c, %r2
	.word 0x8c6a0009  ! 62: UDIVX_R	udivx 	%r8, %r9, %r6
	.word 0x8d6a0009  ! 64: SDIVX_R	sdivx	%r8, %r9, %r6
	.word 0xa2722bbc  ! 67: UDIV_I	udiv 	%r8, 0x0bbc, %r17
	.word 0xba7a0009  ! 69: SDIV_R	sdiv 	%r8, %r9, %r29
	.word 0x9a7a0009  ! 70: SDIV_R	sdiv 	%r8, %r9, %r13
	.word 0x96f20009  ! 73: UDIVcc_R	udivcc 	%r8, %r9, %r11
	.word 0x84f22584  ! 74: UDIVcc_I	udivcc 	%r8, 0x0584, %r2
	.word 0xac7a239c  ! 75: SDIV_I	sdiv 	%r8, 0x039c, %r22
	.word 0xb4f20009  ! 76: UDIVcc_R	udivcc 	%r8, %r9, %r26
	.word 0x86720009  ! 77: UDIV_R	udiv 	%r8, %r9, %r3
	.word 0x8d6a0009  ! 78: SDIVX_R	sdivx	%r8, %r9, %r6
	.word 0x86722c54  ! 81: UDIV_I	udiv 	%r8, 0x0c54, %r3
	.word 0x8872231c  ! 82: UDIV_I	udiv 	%r8, 0x031c, %r4
	.word 0xb6fa2ce0  ! 83: SDIVcc_I	sdivcc 	%r8, 0x0ce0, %r27
	.word 0x86722bf8  ! 84: UDIV_I	udiv 	%r8, 0x0bf8, %r3
	.word 0x84f22e50  ! 85: UDIVcc_I	udivcc 	%r8, 0x0e50, %r2
	.word 0x8ef225e4  ! 87: UDIVcc_I	udivcc 	%r8, 0x05e4, %r7
	.word 0x827a0009  ! 93: SDIV_R	sdiv 	%r8, %r9, %r1
	.word 0x836a2f74  ! 94: SDIVX_I	sdivx	%r8, 0x0f74, %r1
	.word 0xbefa0009  ! 96: SDIVcc_R	sdivcc 	%r8, %r9, %r31
	.word 0x9a72227c  ! 101: UDIV_I	udiv 	%r8, 0x027c, %r13
	.word 0x84f20009  ! 102: UDIVcc_R	udivcc 	%r8, %r9, %r2
	.word 0xa6fa2f04  ! 103: SDIVcc_I	sdivcc 	%r8, 0x0f04, %r19
	.word 0x827a2be4  ! 106: SDIV_I	sdiv 	%r8, 0x0be4, %r1
	.word 0x88fa0009  ! 107: SDIVcc_R	sdivcc 	%r8, %r9, %r4
	.word 0x9c6a0009  ! 108: UDIVX_R	udivx 	%r8, %r9, %r14
	.word 0x8d6a0009  ! 109: SDIVX_R	sdivx	%r8, %r9, %r6
	.word 0x876a0009  ! 112: SDIVX_R	sdivx	%r8, %r9, %r3
	.word 0xa4fa0009  ! 114: SDIVcc_R	sdivcc 	%r8, %r9, %r18
	.word 0x8e7a2a90  ! 115: SDIV_I	sdiv 	%r8, 0x0a90, %r7
	.word 0x8af20009  ! 116: UDIVcc_R	udivcc 	%r8, %r9, %r5
	.word 0xaef20009  ! 117: UDIVcc_R	udivcc 	%r8, %r9, %r23
	.word 0x967a27bc  ! 118: SDIV_I	sdiv 	%r8, 0x07bc, %r11
	.word 0x8f6a0009  ! 119: SDIVX_R	sdivx	%r8, %r9, %r7
	.word 0x8c7a2ecc  ! 124: SDIV_I	sdiv 	%r8, 0x0ecc, %r6
	.word 0x8efa2ec4  ! 125: SDIVcc_I	sdivcc 	%r8, 0x0ec4, %r7
	.word 0xa56a0009  ! 128: SDIVX_R	sdivx	%r8, %r9, %r18
	.word 0x8e6a0009  ! 129: UDIVX_R	udivx 	%r8, %r9, %r7
	.word 0x886a0009  ! 140: UDIVX_R	udivx 	%r8, %r9, %r4
	.word 0x86720009  ! 142: UDIV_R	udiv 	%r8, %r9, %r3
	.word 0x8cfa2870  ! 143: SDIVcc_I	sdivcc 	%r8, 0x0870, %r6
	.word 0x88722d78  ! 146: UDIV_I	udiv 	%r8, 0x0d78, %r4
	.word 0xa6720009  ! 147: UDIV_R	udiv 	%r8, %r9, %r19
	.word 0x86f20009  ! 148: UDIVcc_R	udivcc 	%r8, %r9, %r3
	.word 0x866a0009  ! 170: UDIVX_R	udivx 	%r8, %r9, %r3
	.word 0xaa6a2f5c  ! 171: UDIVX_I	udivx 	%r8, 0x0f5c, %r21
	.word 0xa0722ef0  ! 172: UDIV_I	udiv 	%r8, 0x0ef0, %r16
	.word 0xb47229b0  ! 182: UDIV_I	udiv 	%r8, 0x09b0, %r26
	.word 0x827a26a0  ! 183: SDIV_I	sdiv 	%r8, 0x06a0, %r1
	.word 0x84720009  ! 184: UDIV_R	udiv 	%r8, %r9, %r2
	.word 0x847a0009  ! 185: SDIV_R	sdiv 	%r8, %r9, %r2
	.word 0x847a0009  ! 190: SDIV_R	sdiv 	%r8, %r9, %r2
	.word 0x887221cc  ! 194: UDIV_I	udiv 	%r8, 0x01cc, %r4
	.word 0xb8f20009  ! 199: UDIVcc_R	udivcc 	%r8, %r9, %r28
	.word 0xaefa0009  ! 201: SDIVcc_R	sdivcc 	%r8, %r9, %r23
	.word 0xbefa2020  ! 202: SDIVcc_I	sdivcc 	%r8, 0x0020, %r31
	.word 0xbf6a0009  ! 207: SDIVX_R	sdivx	%r8, %r9, %r31
	.word 0x8c720009  ! 208: UDIV_R	udiv 	%r8, %r9, %r6
	.word 0x8d6a2440  ! 209: SDIVX_I	sdivx	%r8, 0x0440, %r6
	.word 0x856a0009  ! 225: SDIVX_R	sdivx	%r8, %r9, %r2
	.word 0xaefa2000  ! 237: SDIVcc_I	sdivcc 	%r8, 0x0000, %r23
	.word 0xb6fa25f4  ! 241: SDIVcc_I	sdivcc 	%r8, 0x05f4, %r27
	.word 0x84720009  ! 246: UDIV_R	udiv 	%r8, %r9, %r2
	.word 0x856a2a58  ! 252: SDIVX_I	sdivx	%r8, 0x0a58, %r2
	.word 0x896a279c  ! 254: SDIVX_I	sdivx	%r8, 0x079c, %r4
	.word 0x88f20009  ! 259: UDIVcc_R	udivcc 	%r8, %r9, %r4
	.word 0x88722494  ! 260: UDIV_I	udiv 	%r8, 0x0494, %r4
	.word 0x836a0009  ! 262: SDIVX_R	sdivx	%r8, %r9, %r1
	.word 0x8afa2648  ! 265: SDIVcc_I	sdivcc 	%r8, 0x0648, %r5
	.word 0xa4fa2b4c  ! 270: SDIVcc_I	sdivcc 	%r8, 0x0b4c, %r18
	.word 0x8cf2250c  ! 271: UDIVcc_I	udivcc 	%r8, 0x050c, %r6
	.word 0x846a2b68  ! 272: UDIVX_I	udivx 	%r8, 0x0b68, %r2
	.word 0x82f22354  ! 280: UDIVcc_I	udivcc 	%r8, 0x0354, %r1
	.word 0x847a2ba4  ! 281: SDIV_I	sdiv 	%r8, 0x0ba4, %r2
	.word 0x8af20009  ! 294: UDIVcc_R	udivcc 	%r8, %r9, %r5
	.word 0xbe7a20a8  ! 296: SDIV_I	sdiv 	%r8, 0x00a8, %r31
	.word 0x8c722308  ! 298: UDIV_I	udiv 	%r8, 0x0308, %r6
	.word 0x826a0009  ! 299: UDIVX_R	udivx 	%r8, %r9, %r1
	.word 0xb4f20009  ! 314: UDIVcc_R	udivcc 	%r8, %r9, %r26
	.word 0x86fa2968  ! 315: SDIVcc_I	sdivcc 	%r8, 0x0968, %r3
	.word 0xa0722a50  ! 316: UDIV_I	udiv 	%r8, 0x0a50, %r16
	.word 0x8e6a2b3c  ! 317: UDIVX_I	udivx 	%r8, 0x0b3c, %r7
	.word 0xa2f20009  ! 324: UDIVcc_R	udivcc 	%r8, %r9, %r17
	.word 0x82720009  ! 326: UDIV_R	udiv 	%r8, %r9, %r1
	.word 0x86fa2c6c  ! 328: SDIVcc_I	sdivcc 	%r8, 0x0c6c, %r3
	.word 0x876a20b4  ! 329: SDIVX_I	sdivx	%r8, 0x00b4, %r3
	.word 0x8a6a2d70  ! 332: UDIVX_I	udivx 	%r8, 0x0d70, %r5
	.word 0xa47a0009  ! 342: SDIV_R	sdiv 	%r8, %r9, %r18
	.word 0xaafa0009  ! 343: SDIVcc_R	sdivcc 	%r8, %r9, %r21
	.word 0xa26a0009  ! 344: UDIVX_R	udivx 	%r8, %r9, %r17
	.word 0x887a0009  ! 348: SDIV_R	sdiv 	%r8, %r9, %r4
	.word 0xa26a274c  ! 351: UDIVX_I	udivx 	%r8, 0x074c, %r17
	.word 0xab6a0009  ! 352: SDIVX_R	sdivx	%r8, %r9, %r21
	.word 0x86fa2acc  ! 353: SDIVcc_I	sdivcc 	%r8, 0x0acc, %r3
	.word 0x8c722854  ! 354: UDIV_I	udiv 	%r8, 0x0854, %r6
	.word 0x82720009  ! 355: UDIV_R	udiv 	%r8, %r9, %r1
	.word 0x82f22430  ! 356: UDIVcc_I	udivcc 	%r8, 0x0430, %r1
	.word 0x827a0009  ! 358: SDIV_R	sdiv 	%r8, %r9, %r1
	.word 0x8d6a0009  ! 364: SDIVX_R	sdivx	%r8, %r9, %r6
	.word 0x8e722a84  ! 367: UDIV_I	udiv 	%r8, 0x0a84, %r7
	.word 0x896a28c4  ! 369: SDIVX_I	sdivx	%r8, 0x08c4, %r4
	.word 0xa2f2251c  ! 370: UDIVcc_I	udivcc 	%r8, 0x051c, %r17
	.word 0x8e720009  ! 371: UDIV_R	udiv 	%r8, %r9, %r7
	.word 0x856a26d8  ! 380: SDIVX_I	sdivx	%r8, 0x06d8, %r2
	.word 0x88f224ac  ! 381: UDIVcc_I	udivcc 	%r8, 0x04ac, %r4
	.word 0x8c7a2204  ! 382: SDIV_I	sdiv 	%r8, 0x0204, %r6
	.word 0xb4f2275c  ! 389: UDIVcc_I	udivcc 	%r8, 0x075c, %r26
	.word 0xbefa0009  ! 392: SDIVcc_R	sdivcc 	%r8, %r9, %r31
	.word 0xaa6a26bc  ! 393: UDIVX_I	udivx 	%r8, 0x06bc, %r21
	.word 0x846a0009  ! 394: UDIVX_R	udivx 	%r8, %r9, %r2
	.word 0x826a2694  ! 395: UDIVX_I	udivx 	%r8, 0x0694, %r1
	.word 0x8f6a2e74  ! 396: SDIVX_I	sdivx	%r8, 0x0e74, %r7
	.word 0x86722904  ! 397: UDIV_I	udiv 	%r8, 0x0904, %r3
	.word 0x886a205c  ! 400: UDIVX_I	udivx 	%r8, 0x005c, %r4
	.word 0x856a0009  ! 401: SDIVX_R	sdivx	%r8, %r9, %r2
	.word 0x84f20009  ! 428: UDIVcc_R	udivcc 	%r8, %r9, %r2
	.word 0x86f225e4  ! 430: UDIVcc_I	udivcc 	%r8, 0x05e4, %r3
	.word 0x967a0009  ! 431: SDIV_R	sdiv 	%r8, %r9, %r11
	.word 0xb86a29e4  ! 432: UDIVX_I	udivx 	%r8, 0x09e4, %r28
	.word 0x867a2a08  ! 433: SDIV_I	sdiv 	%r8, 0x0a08, %r3
	.word 0x8ef225dc  ! 434: UDIVcc_I	udivcc 	%r8, 0x05dc, %r7
	.word 0x88f20009  ! 435: UDIVcc_R	udivcc 	%r8, %r9, %r4
	.word 0x896a0009  ! 436: SDIVX_R	sdivx	%r8, %r9, %r4
	.word 0x887226d0  ! 438: UDIV_I	udiv 	%r8, 0x06d0, %r4
	.word 0xaaf226c4  ! 441: UDIVcc_I	udivcc 	%r8, 0x06c4, %r21
	.word 0x996a22c4  ! 442: SDIVX_I	sdivx	%r8, 0x02c4, %r12
	.word 0x8ef225dc  ! 443: UDIVcc_I	udivcc 	%r8, 0x05dc, %r7
	.word 0xa47a2cc0  ! 448: SDIV_I	sdiv 	%r8, 0x0cc0, %r18
	.word 0x996a23c8  ! 451: SDIVX_I	sdivx	%r8, 0x03c8, %r12
	.word 0xa6fa2b98  ! 456: SDIVcc_I	sdivcc 	%r8, 0x0b98, %r19
	.word 0x8e722ef4  ! 457: UDIV_I	udiv 	%r8, 0x0ef4, %r7
	.word 0x8ef22a40  ! 459: UDIVcc_I	udivcc 	%r8, 0x0a40, %r7
	.word 0xb0720009  ! 461: UDIV_R	udiv 	%r8, %r9, %r24
	.word 0x86fa213c  ! 462: SDIVcc_I	sdivcc 	%r8, 0x013c, %r3
	.word 0x84fa220c  ! 463: SDIVcc_I	sdivcc 	%r8, 0x020c, %r2
	.word 0x82f20009  ! 464: UDIVcc_R	udivcc 	%r8, %r9, %r1
	.word 0x88720009  ! 465: UDIV_R	udiv 	%r8, %r9, %r4
	.word 0xa6720009  ! 470: UDIV_R	udiv 	%r8, %r9, %r19
	.word 0x8efa0009  ! 471: SDIVcc_R	sdivcc 	%r8, %r9, %r7
	.word 0x8cf20009  ! 476: UDIVcc_R	udivcc 	%r8, %r9, %r6
	.word 0x9f6a2264  ! 479: SDIVX_I	sdivx	%r8, 0x0264, %r15
	.word 0x84fa0009  ! 482: SDIVcc_R	sdivcc 	%r8, %r9, %r2
	.word 0x8b6a2010  ! 483: SDIVX_I	sdivx	%r8, 0x0010, %r5
	.word 0x8c6a2298  ! 485: UDIVX_I	udivx 	%r8, 0x0298, %r6
	.word 0x9c720009  ! 488: UDIV_R	udiv 	%r8, %r9, %r14
	.word 0x88fa2324  ! 489: SDIVcc_I	sdivcc 	%r8, 0x0324, %r4
	.word 0x946a0009  ! 494: UDIVX_R	udivx 	%r8, %r9, %r10
	.word 0x9c7a22e8  ! 495: SDIV_I	sdiv 	%r8, 0x02e8, %r14
	.word 0xbf6a2378  ! 500: SDIVX_I	sdivx	%r8, 0x0378, %r31
	.word 0x827a0009  ! 501: SDIV_R	sdiv 	%r8, %r9, %r1
	.word 0x8af20009  ! 502: UDIVcc_R	udivcc 	%r8, %r9, %r5
	.word 0xaef20009  ! 503: UDIVcc_R	udivcc 	%r8, %r9, %r23
	.word 0x82fa29c8  ! 508: SDIVcc_I	sdivcc 	%r8, 0x09c8, %r1
	.word 0x8afa265c  ! 509: SDIVcc_I	sdivcc 	%r8, 0x065c, %r5
	.word 0x896a0009  ! 518: SDIVX_R	sdivx	%r8, %r9, %r4
	.word 0x836a21d8  ! 522: SDIVX_I	sdivx	%r8, 0x01d8, %r1
	.word 0xa26a220c  ! 523: UDIVX_I	udivx 	%r8, 0x020c, %r17
	.word 0x947a2e68  ! 524: SDIV_I	sdiv 	%r8, 0x0e68, %r10
	.word 0xb86a0009  ! 525: UDIVX_R	udivx 	%r8, %r9, %r28
	.word 0x847221f0  ! 526: UDIV_I	udiv 	%r8, 0x01f0, %r2
	.word 0x8afa2a48  ! 527: SDIVcc_I	sdivcc 	%r8, 0x0a48, %r5
	.word 0x847a2c60  ! 544: SDIV_I	sdiv 	%r8, 0x0c60, %r2
	.word 0x86722224  ! 551: UDIV_I	udiv 	%r8, 0x0224, %r3
	.word 0x9cf20009  ! 552: UDIVcc_R	udivcc 	%r8, %r9, %r14
	.word 0x8cfa0009  ! 555: SDIVcc_R	sdivcc 	%r8, %r9, %r6
	.word 0xb0720009  ! 563: UDIV_R	udiv 	%r8, %r9, %r24
	.word 0x8cf20009  ! 564: UDIVcc_R	udivcc 	%r8, %r9, %r6
	.word 0xb86a2dc4  ! 565: UDIVX_I	udivx 	%r8, 0x0dc4, %r28
	.word 0x986a0009  ! 566: UDIVX_R	udivx 	%r8, %r9, %r12
	.word 0xb6f2209c  ! 569: UDIVcc_I	udivcc 	%r8, 0x009c, %r27
	.word 0x8b6a2c10  ! 570: SDIVX_I	sdivx	%r8, 0x0c10, %r5
	.word 0x9e6a23fc  ! 573: UDIVX_I	udivx 	%r8, 0x03fc, %r15
	.word 0x866a2f9c  ! 579: UDIVX_I	udivx 	%r8, 0x0f9c, %r3
	.word 0xbe7a0009  ! 580: SDIV_R	sdiv 	%r8, %r9, %r31
	.word 0xb16a0009  ! 581: SDIVX_R	sdivx	%r8, %r9, %r24
	.word 0xb66a2fa4  ! 583: UDIVX_I	udivx 	%r8, 0x0fa4, %r27
	.word 0xa56a2860  ! 584: SDIVX_I	sdivx	%r8, 0x0860, %r18
	.word 0xbcf223e0  ! 586: UDIVcc_I	udivcc 	%r8, 0x03e0, %r30
	.word 0xa07a26b8  ! 587: SDIV_I	sdiv 	%r8, 0x06b8, %r16
	.word 0x82fa0009  ! 589: SDIVcc_R	sdivcc 	%r8, %r9, %r1
	.word 0x8c7220a0  ! 592: UDIV_I	udiv 	%r8, 0x00a0, %r6
	.word 0xb4720009  ! 593: UDIV_R	udiv 	%r8, %r9, %r26
	.word 0x956a2eec  ! 594: SDIVX_I	sdivx	%r8, 0x0eec, %r10
	.word 0x8efa0009  ! 604: SDIVcc_R	sdivcc 	%r8, %r9, %r7
	.word 0xac7a0009  ! 610: SDIV_R	sdiv 	%r8, %r9, %r22
	.word 0x84fa0009  ! 611: SDIVcc_R	sdivcc 	%r8, %r9, %r2
	.word 0xb8fa26b0  ! 616: SDIVcc_I	sdivcc 	%r8, 0x06b0, %r28
	.word 0xb76a2a34  ! 620: SDIVX_I	sdivx	%r8, 0x0a34, %r27
	.word 0x8afa0009  ! 629: SDIVcc_R	sdivcc 	%r8, %r9, %r5
	.word 0x82f223c4  ! 630: UDIVcc_I	udivcc 	%r8, 0x03c4, %r1
	.word 0x84fa0009  ! 631: SDIVcc_R	sdivcc 	%r8, %r9, %r2
	.word 0x8afa2ec0  ! 633: SDIVcc_I	sdivcc 	%r8, 0x0ec0, %r5
	.word 0x8b6a0009  ! 634: SDIVX_R	sdivx	%r8, %r9, %r5
	.word 0x84fa0009  ! 635: SDIVcc_R	sdivcc 	%r8, %r9, %r2
	.word 0x8afa29b8  ! 636: SDIVcc_I	sdivcc 	%r8, 0x09b8, %r5
	.word 0x947a0009  ! 637: SDIV_R	sdiv 	%r8, %r9, %r10
	.word 0x8afa2528  ! 638: SDIVcc_I	sdivcc 	%r8, 0x0528, %r5
	.word 0x9e6a0009  ! 639: UDIVX_R	udivx 	%r8, %r9, %r15
	.word 0x847a0009  ! 644: SDIV_R	sdiv 	%r8, %r9, %r2
	.word 0x887a2bb4  ! 645: SDIV_I	sdiv 	%r8, 0x0bb4, %r4
	.word 0x8c722cac  ! 648: UDIV_I	udiv 	%r8, 0x0cac, %r6
	.word 0x976a2c04  ! 649: SDIVX_I	sdivx	%r8, 0x0c04, %r11
	.word 0xbafa0009  ! 650: SDIVcc_R	sdivcc 	%r8, %r9, %r29
	.word 0x88f22e5c  ! 653: UDIVcc_I	udivcc 	%r8, 0x0e5c, %r4
	.word 0x84f22688  ! 654: UDIVcc_I	udivcc 	%r8, 0x0688, %r2
	.word 0x876a0009  ! 660: SDIVX_R	sdivx	%r8, %r9, %r3
	.word 0x86f20009  ! 661: UDIVcc_R	udivcc 	%r8, %r9, %r3
	.word 0x84f20009  ! 669: UDIVcc_R	udivcc 	%r8, %r9, %r2
	.word 0x8a7a2128  ! 671: SDIV_I	sdiv 	%r8, 0x0128, %r5
	.word 0xbcf22ee8  ! 673: UDIVcc_I	udivcc 	%r8, 0x0ee8, %r30
	.word 0x986a2764  ! 678: UDIVX_I	udivx 	%r8, 0x0764, %r12
	.word 0x8afa0009  ! 679: SDIVcc_R	sdivcc 	%r8, %r9, %r5
	.word 0x876a0009  ! 680: SDIVX_R	sdivx	%r8, %r9, %r3
	.word 0x8a6a0009  ! 681: UDIVX_R	udivx 	%r8, %r9, %r5
	.word 0x8ef22818  ! 682: UDIVcc_I	udivcc 	%r8, 0x0818, %r7
	.word 0x8afa2f9c  ! 684: SDIVcc_I	sdivcc 	%r8, 0x0f9c, %r5
	.word 0xbd6a2eb4  ! 692: SDIVX_I	sdivx	%r8, 0x0eb4, %r30
	.word 0xb46a2870  ! 693: UDIVX_I	udivx 	%r8, 0x0870, %r26
	.word 0x88fa0009  ! 696: SDIVcc_R	sdivcc 	%r8, %r9, %r4
	.word 0x846a0009  ! 697: UDIVX_R	udivx 	%r8, %r9, %r2
	.word 0xb4722790  ! 698: UDIV_I	udiv 	%r8, 0x0790, %r26
	.word 0x8a6a2704  ! 701: UDIVX_I	udivx 	%r8, 0x0704, %r5
	.word 0xbe720009  ! 704: UDIV_R	udiv 	%r8, %r9, %r31
	.word 0x8a720009  ! 705: UDIV_R	udiv 	%r8, %r9, %r5
	.word 0x8cf2292c  ! 706: UDIVcc_I	udivcc 	%r8, 0x092c, %r6
	.word 0xb46a0009  ! 707: UDIVX_R	udivx 	%r8, %r9, %r26
	.word 0xb06a0009  ! 709: UDIVX_R	udivx 	%r8, %r9, %r24
	.word 0x8ef20009  ! 710: UDIVcc_R	udivcc 	%r8, %r9, %r7
	.word 0x96f20009  ! 711: UDIVcc_R	udivcc 	%r8, %r9, %r11
	.word 0x896a0009  ! 712: SDIVX_R	sdivx	%r8, %r9, %r4
	.word 0x9d6a0009  ! 719: SDIVX_R	sdivx	%r8, %r9, %r14
	.word 0x86720009  ! 724: UDIV_R	udiv 	%r8, %r9, %r3
	.word 0x82f20009  ! 725: UDIVcc_R	udivcc 	%r8, %r9, %r1
	.word 0x847a0009  ! 726: SDIV_R	sdiv 	%r8, %r9, %r2
	.word 0xb2720009  ! 727: UDIV_R	udiv 	%r8, %r9, %r25
	.word 0x866a0009  ! 728: UDIVX_R	udivx 	%r8, %r9, %r3
	.word 0x847a282c  ! 734: SDIV_I	sdiv 	%r8, 0x082c, %r2
	.word 0x8d6a0009  ! 735: SDIVX_R	sdivx	%r8, %r9, %r6
	.word 0x856a0009  ! 746: SDIVX_R	sdivx	%r8, %r9, %r2
	.word 0x8f6a2314  ! 749: SDIVX_I	sdivx	%r8, 0x0314, %r7
	.word 0x986a0009  ! 750: UDIVX_R	udivx 	%r8, %r9, %r12
	.word 0x8a6a0009  ! 751: UDIVX_R	udivx 	%r8, %r9, %r5
	.word 0x866a0009  ! 752: UDIVX_R	udivx 	%r8, %r9, %r3
	.word 0x866a0009  ! 755: UDIVX_R	udivx 	%r8, %r9, %r3
	.word 0x82f2279c  ! 781: UDIVcc_I	udivcc 	%r8, 0x079c, %r1
	.word 0xa47a28e0  ! 784: SDIV_I	sdiv 	%r8, 0x08e0, %r18
	.word 0x84fa2e60  ! 788: SDIVcc_I	sdivcc 	%r8, 0x0e60, %r2
	.word 0x8a6a0009  ! 789: UDIVX_R	udivx 	%r8, %r9, %r5
	.word 0x876a27e0  ! 804: SDIVX_I	sdivx	%r8, 0x07e0, %r3
	.word 0xb4f220a4  ! 805: UDIVcc_I	udivcc 	%r8, 0x00a4, %r26
	.word 0xa4f20009  ! 806: UDIVcc_R	udivcc 	%r8, %r9, %r18
	.word 0x876a2a0c  ! 808: SDIVX_I	sdivx	%r8, 0x0a0c, %r3
	.word 0x8b6a0009  ! 813: SDIVX_R	sdivx	%r8, %r9, %r5
	.word 0xb2f2223c  ! 814: UDIVcc_I	udivcc 	%r8, 0x023c, %r25
	.word 0x8cfa2f90  ! 819: SDIVcc_I	sdivcc 	%r8, 0x0f90, %r6
	.word 0x8e7a2154  ! 820: SDIV_I	sdiv 	%r8, 0x0154, %r7
	.word 0x84fa0009  ! 821: SDIVcc_R	sdivcc 	%r8, %r9, %r2
	.word 0x8e720009  ! 822: UDIV_R	udiv 	%r8, %r9, %r7
	.word 0x82fa0009  ! 823: SDIVcc_R	sdivcc 	%r8, %r9, %r1
	.word 0xb66a0009  ! 824: UDIVX_R	udivx 	%r8, %r9, %r27
	.word 0x866a23f8  ! 825: UDIVX_I	udivx 	%r8, 0x03f8, %r3
	.word 0xa36a0009  ! 832: SDIVX_R	sdivx	%r8, %r9, %r17
	.word 0x8a7a2fe4  ! 833: SDIV_I	sdiv 	%r8, 0x0fe4, %r5
	.word 0x8e6a0009  ! 834: UDIVX_R	udivx 	%r8, %r9, %r7
	.word 0x8e7a2994  ! 835: SDIV_I	sdiv 	%r8, 0x0994, %r7
	.word 0x9cfa0009  ! 836: SDIVcc_R	sdivcc 	%r8, %r9, %r14
	.word 0x886a0009  ! 837: UDIVX_R	udivx 	%r8, %r9, %r4
	.word 0x88fa0009  ! 838: SDIVcc_R	sdivcc 	%r8, %r9, %r4
	.word 0x856a0009  ! 845: SDIVX_R	sdivx	%r8, %r9, %r2
	.word 0x98722654  ! 852: UDIV_I	udiv 	%r8, 0x0654, %r12
	.word 0x8e6a0009  ! 858: UDIVX_R	udivx 	%r8, %r9, %r7
	.word 0x8c6a254c  ! 859: UDIVX_I	udivx 	%r8, 0x054c, %r6
	.word 0x86fa0009  ! 866: SDIVcc_R	sdivcc 	%r8, %r9, %r3
	.word 0x8c6a0009  ! 868: UDIVX_R	udivx 	%r8, %r9, %r6
	.word 0x836a0009  ! 875: SDIVX_R	sdivx	%r8, %r9, %r1
	.word 0xbd6a2074  ! 876: SDIVX_I	sdivx	%r8, 0x0074, %r30
	.word 0xbaf22540  ! 877: UDIVcc_I	udivcc 	%r8, 0x0540, %r29
	.word 0x8afa247c  ! 878: SDIVcc_I	sdivcc 	%r8, 0x047c, %r5
	.word 0x827a2e34  ! 879: SDIV_I	sdiv 	%r8, 0x0e34, %r1
	.word 0xb4f22780  ! 880: UDIVcc_I	udivcc 	%r8, 0x0780, %r26
	.word 0x9c722b30  ! 885: UDIV_I	udiv 	%r8, 0x0b30, %r14
	.word 0x82f20009  ! 890: UDIVcc_R	udivcc 	%r8, %r9, %r1
	.word 0x8e6a0009  ! 892: UDIVX_R	udivx 	%r8, %r9, %r7
	.word 0xa272256c  ! 893: UDIV_I	udiv 	%r8, 0x056c, %r17
	.word 0x88f20009  ! 898: UDIVcc_R	udivcc 	%r8, %r9, %r4
	.word 0xa66a0009  ! 899: UDIVX_R	udivx 	%r8, %r9, %r19
	.word 0x8f6a272c  ! 903: SDIVX_I	sdivx	%r8, 0x072c, %r7
	.word 0x86720009  ! 906: UDIV_R	udiv 	%r8, %r9, %r3
	.word 0xa8fa23e0  ! 907: SDIVcc_I	sdivcc 	%r8, 0x03e0, %r20
	.word 0x82f22efc  ! 909: UDIVcc_I	udivcc 	%r8, 0x0efc, %r1
	.word 0x9a7a2a8c  ! 914: SDIV_I	sdiv 	%r8, 0x0a8c, %r13
	.word 0x836a0009  ! 915: SDIVX_R	sdivx	%r8, %r9, %r1
	.word 0x8b6a2b34  ! 918: SDIVX_I	sdivx	%r8, 0x0b34, %r5
	.word 0x8b6a2090  ! 923: SDIVX_I	sdivx	%r8, 0x0090, %r5
	.word 0x8a720009  ! 927: UDIV_R	udiv 	%r8, %r9, %r5
	.word 0x846a0009  ! 928: UDIVX_R	udivx 	%r8, %r9, %r2
	.word 0xa47a2afc  ! 935: SDIV_I	sdiv 	%r8, 0x0afc, %r18
	.word 0x867a2884  ! 938: SDIV_I	sdiv 	%r8, 0x0884, %r3
	.word 0x866a27d0  ! 943: UDIVX_I	udivx 	%r8, 0x07d0, %r3
	.word 0x8efa2c58  ! 948: SDIVcc_I	sdivcc 	%r8, 0x0c58, %r7
	.word 0xacfa2048  ! 951: SDIVcc_I	sdivcc 	%r8, 0x0048, %r22
	.word 0x8f6a20f8  ! 957: SDIVX_I	sdivx	%r8, 0x00f8, %r7
	.word 0x8e720009  ! 958: UDIV_R	udiv 	%r8, %r9, %r7
	.word 0x896a2754  ! 959: SDIVX_I	sdivx	%r8, 0x0754, %r4
	.word 0x8ef22130  ! 964: UDIVcc_I	udivcc 	%r8, 0x0130, %r7
	.word 0x846a0009  ! 966: UDIVX_R	udivx 	%r8, %r9, %r2
	.word 0xb87a0009  ! 971: SDIV_R	sdiv 	%r8, %r9, %r28
	.word 0x8d6a0009  ! 974: SDIVX_R	sdivx	%r8, %r9, %r6
	.word 0xaf6a0009  ! 978: SDIVX_R	sdivx	%r8, %r9, %r23
	.word 0xae7a0009  ! 983: SDIV_R	sdiv 	%r8, %r9, %r23
	.word 0xa67a0009  ! 984: SDIV_R	sdiv 	%r8, %r9, %r19
	.word 0x8efa0009  ! 985: SDIVcc_R	sdivcc 	%r8, %r9, %r7
	nop
	nop
	nop
        ta      T_GOOD_TRAP

th_main_1:
        setx  MAIN_BASE_DATA_VA, %r1, %r8
        setx  0x0000000000000000, %g1, %r9
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
        setx  0x0c51cfcf9d57f32c, %g1, %r0
        setx  0xf46b0705ac9087bc, %g1, %r1
        setx  0xadfcd966617ae86a, %g1, %r2
        setx  0x0fcc4658daf29213, %g1, %r3
        setx  0xff0451eb3c8e5463, %g1, %r4
        setx  0xed94271f38f0e1bb, %g1, %r5
        setx  0x5ced1245b1f3df55, %g1, %r6
        setx  0xfdbd2a2cabf1992d, %g1, %r7
        setx  0x83f9a6ae31e8ac51, %g1, %r10
        setx  0x35a289757330f770, %g1, %r11
        setx  0xf002fb2d16d83a6a, %g1, %r12
        setx  0xe9c01fd1a5cfcbbe, %g1, %r13
        setx  0xe8fa26872e6ef502, %g1, %r14
        setx  0x97bb62c49e7bbf8d, %g1, %r15
        setx  0x35a0e5f5a4b11afe, %g1, %r16
        setx  0x44737f7c730e402e, %g1, %r17
        setx  0xec12ac101c91c309, %g1, %r18
        setx  0xee3be91b14775be9, %g1, %r19
        setx  0x7d4259b85fa2a4df, %g1, %r20
        setx  0x0a92956dcbeb1ace, %g1, %r21
        setx  0xe935e1b3d31f58b1, %g1, %r22
        setx  0xe12f6842e9231ca3, %g1, %r23
        setx  0xda614dfec9fdf539, %g1, %r24
        setx  0x764a60dc4dfe08c2, %g1, %r25
        setx  0xa8f321d83aa29542, %g1, %r26
        setx  0xc9a5797f00972f8f, %g1, %r27
        setx  0x5821c091648996a5, %g1, %r28
        setx  0xd4d8babfac116b82, %g1, %r29
        setx  0x5afe8fb30bb3f02c, %g1, %r30
        setx  0x57305e358d4bc4b8, %g1, %r31
	.word 0x16800001  ! 7: BGE	bge  	<label_0x1>
	.word 0x856a28e8  ! 7: SDIVX_I	sdivx	%r8, 0x08e8, %r2
	.word 0x0c800002  ! 13: BNEG	bneg  	<label_0x2>
	.word 0x86fa0009  ! 13: SDIVcc_R	sdivcc 	%r8, %r9, %r3
	.word 0x18800001  ! 15: BGU	bgu  	<label_0x1>
	.word 0xba722b44  ! 15: UDIV_I	udiv 	%r8, 0x0b44, %r29
	.word 0x22800001  ! 17: BE	be,a	<label_0x1>
	.word 0xa2f22a4c  ! 17: UDIVcc_I	udivcc 	%r8, 0x0a4c, %r17
	.word 0x24800001  ! 19: BLE	ble,a	<label_0x1>
	.word 0x846a2da8  ! 19: UDIVX_I	udivx 	%r8, 0x0da8, %r2
	.word 0x8ab22abc  ! 20: SUBCcc_I	orncc 	%r8, 0x0abc, %r5
	.word 0x96a20009  ! 20: SUBcc_R	subcc 	%r8, %r9, %r11
	.word 0x84aa2abc  ! 20: ANDNcc_I	andncc 	%r8, 0x0abc, %r2
	.word 0x88c20009  ! 20: ADDCcc_R	addccc 	%r8, %r9, %r4
	.word 0x88b20009  ! 20: ORNcc_R	orncc 	%r8, %r9, %r4
	.word 0x8e120009  ! 20: OR_R	or 	%r8, %r9, %r7
	.word 0xa42220a4  ! 20: SUB_I	sub 	%r8, 0x00a4, %r18
	.word 0x8eba2ce8  ! 20: XNORcc_I	xnorcc 	%r8, 0x0ce8, %r7
	.word 0x99643801  ! 20: MOVcc_I	<illegal instruction>
	.word 0x853a0009  ! 20: SRA_R	sra 	%r8, %r9, %r2
	.word 0x8a3a2914  ! 20: XNOR_I	xnor 	%r8, 0x0914, %r5
	.word 0x88c20009  ! 20: ADDCcc_R	addccc 	%r8, %r9, %r4
	.word 0xac8220a8  ! 20: ADDcc_I	addcc 	%r8, 0x00a8, %r22
	.word 0xa33a3001  ! 20: SRAX_I	srax	%r8, 0x0001, %r17
	.word 0xc42a0009  ! 24: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xcc520009  ! 24: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0x86122b30  ! 24: OR_I	or 	%r8, 0x0b30, %r3
	.word 0x8e6a2500  ! 24: UDIVX_I	udivx 	%r8, 0x0500, %r7
	.word 0x12800001  ! 26: BNE	bne  	<label_0x1>
	.word 0x8a720009  ! 26: UDIV_R	udiv 	%r8, %r9, %r5
	.word 0x24800002  ! 28: BLE	ble,a	<label_0x2>
	.word 0x8a720009  ! 28: UDIV_R	udiv 	%r8, %r9, %r5
	.word 0xb6ba2308  ! 30: XNORcc_I	xnorcc 	%r8, 0x0308, %r27
	.word 0xa01a0009  ! 30: XOR_R	xor 	%r8, %r9, %r16
	.word 0x8c3a2128  ! 30: XNOR_I	xnor 	%r8, 0x0128, %r6
	.word 0xa73a0009  ! 30: SRA_R	sra 	%r8, %r9, %r19
	.word 0x828a2af4  ! 30: ANDcc_I	andcc 	%r8, 0x0af4, %r1
	.word 0x82b20009  ! 30: ORNcc_R	orncc 	%r8, %r9, %r1
	.word 0x9e220009  ! 30: SUB_R	sub 	%r8, %r9, %r15
	.word 0x8cb220a4  ! 30: ORNcc_I	orncc 	%r8, 0x00a4, %r6
	.word 0x8a1a2200  ! 30: XOR_I	xor 	%r8, 0x0200, %r5
	.word 0x868a0009  ! 30: ANDcc_R	andcc 	%r8, %r9, %r3
	.word 0xab641809  ! 30: MOVcc_R	<illegal instruction>
	.word 0x22ca0001  ! 32: BRZ	brz,a,pt	%8,<label_0xa0001>
	.word 0xb4f22144  ! 32: UDIVcc_I	udivcc 	%r8, 0x0144, %r26
	.word 0xcc2a0009  ! 40: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xe60a0009  ! 40: LDUB_R	ldub	[%r8 + %r9], %r19
	.word 0xf1020009  ! 40: LDF_R	ld	[%r8, %r9], %f24
	.word 0x8e7a0009  ! 40: SDIV_R	sdiv 	%r8, %r9, %r7
	.word 0x3a800002  ! 44: BCC	bcc,a	<label_0x2>
	.word 0x8b6a27a8  ! 44: SDIVX_I	sdivx	%r8, 0x07a8, %r5
	.word 0x02800001  ! 48: BE	be  	<label_0x1>
	.word 0x8872215c  ! 48: UDIV_I	udiv 	%r8, 0x015c, %r4
	.word 0x84ba0009  ! 50: XNORcc_R	xnorcc 	%r8, %r9, %r2
	.word 0x8e820009  ! 50: ADDcc_R	addcc 	%r8, %r9, %r7
	.word 0x8c3a21a8  ! 50: XNOR_I	xnor 	%r8, 0x01a8, %r6
	.word 0x8eba2858  ! 50: XNORcc_I	xnorcc 	%r8, 0x0858, %r7
	.word 0xa43a0009  ! 50: XNOR_R	xnor 	%r8, %r9, %r18
	.word 0x82c20009  ! 50: ADDCcc_R	addccc 	%r8, %r9, %r1
	.word 0x892a0009  ! 50: SLL_R	sll 	%r8, %r9, %r4
	.word 0x88a22a24  ! 50: SUBcc_I	subcc 	%r8, 0x0a24, %r4
	.word 0x84c20009  ! 50: ADDCcc_R	addccc 	%r8, %r9, %r2
	.word 0x822a2310  ! 50: ANDN_I	andn 	%r8, 0x0310, %r1
	.word 0x0a800002  ! 52: BCS	bcs  	<label_0x2>
	.word 0x876a0009  ! 52: SDIVX_R	sdivx	%r8, %r9, %r3
	.word 0x0a800002  ! 54: BCS	bcs  	<label_0x2>
	.word 0xae7a0009  ! 54: SDIV_R	sdiv 	%r8, %r9, %r23
	.word 0x85780409  ! 55: MOVR_R	move	%r0, %r9, %r2
	.word 0xa32a0009  ! 55: SLL_R	sll 	%r8, %r9, %r17
	.word 0x82b20009  ! 55: SUBCcc_R	orncc 	%r8, %r9, %r1
	.word 0x84120009  ! 55: OR_R	or 	%r8, %r9, %r2
	.word 0x98c20009  ! 55: ADDCcc_R	addccc 	%r8, %r9, %r12
	.word 0xbf2a1009  ! 55: SLLX_R	sllx	%r8, %r9, %r31
	.word 0x8482239c  ! 55: ADDcc_I	addcc 	%r8, 0x039c, %r2
	.word 0x8c0a24c0  ! 55: AND_I	and 	%r8, 0x04c0, %r6
	.word 0x881a22fc  ! 55: XOR_I	xor 	%r8, 0x02fc, %r4
	.word 0x8b2a2001  ! 55: SLL_I	sll 	%r8, 0x0001, %r5
	.word 0x8c3a0009  ! 55: XNOR_R	xnor 	%r8, %r9, %r6
	.word 0x8d643801  ! 55: MOVcc_I	<illegal instruction>
	.word 0xce2a0009  ! 59: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xf0420009  ! 59: LDSW_R	ldsw	[%r8 + %r9], %r24
	.word 0x94fa2e3c  ! 59: SDIVcc_I	sdivcc 	%r8, 0x0e3c, %r10
	.word 0xa2fa2604  ! 59: SDIVcc_I	sdivcc 	%r8, 0x0604, %r17
	.word 0x863a0009  ! 63: XNOR_R	xnor 	%r8, %r9, %r3
	.word 0xaa220009  ! 63: SUB_R	sub 	%r8, %r9, %r21
	.word 0x84020009  ! 63: ADD_R	add 	%r8, %r9, %r2
	.word 0x8d321009  ! 63: SRLX_R	srlx	%r8, %r9, %r6
	.word 0xa4a22910  ! 63: SUBcc_I	subcc 	%r8, 0x0910, %r18
	.word 0x87782401  ! 63: MOVR_I	move	%r0, 0x910, %r3
	.word 0x820a0009  ! 63: AND_R	and 	%r8, %r9, %r1
	.word 0x8e1a0009  ! 63: XOR_R	xor 	%r8, %r9, %r7
	.word 0x84a20009  ! 63: SUBcc_R	subcc 	%r8, %r9, %r2
	.word 0xb72a2001  ! 63: SLL_I	sll 	%r8, 0x0001, %r27
	.word 0xb2322b9c  ! 63: ORN_I	orn 	%r8, 0x0b9c, %r25
	.word 0xa28a0009  ! 63: ANDcc_R	andcc 	%r8, %r9, %r17
	.word 0x1e800001  ! 66: BVC	bvc  	<label_0x1>
	.word 0x8a7a2e3c  ! 66: SDIV_I	sdiv 	%r8, 0x0e3c, %r5
	.word 0xbcaa0009  ! 68: ANDNcc_R	andncc 	%r8, %r9, %r30
	.word 0x8b321009  ! 68: SRLX_R	srlx	%r8, %r9, %r5
	.word 0x848a2bf0  ! 68: ANDcc_I	andcc 	%r8, 0x0bf0, %r2
	.word 0xac9a0009  ! 68: XORcc_R	xorcc 	%r8, %r9, %r22
	.word 0xa2920009  ! 68: ORcc_R	orcc 	%r8, %r9, %r17
	.word 0xac022b7c  ! 68: ADD_I	add 	%r8, 0x0b7c, %r22
	.word 0x8a422944  ! 68: ADDC_I	addc 	%r8, 0x0944, %r5
	.word 0xb92a3001  ! 68: SLLX_I	sllx	%r8, 0x0001, %r28
	.word 0x88b20009  ! 68: SUBCcc_R	orncc 	%r8, %r9, %r4
	.word 0x86320009  ! 68: SUBC_R	orn 	%r8, %r9, %r3
	.word 0x99780409  ! 68: MOVR_R	move	%r0, %r9, %r12
	.word 0xbe922608  ! 68: ORcc_I	orcc 	%r8, 0x0608, %r31
	.word 0xb4b22528  ! 68: ORNcc_I	orncc 	%r8, 0x0528, %r26
	.word 0x00800002  ! 72: BN	bn  	<label_0x2>
	.word 0x9afa0009  ! 72: SDIVcc_R	sdivcc 	%r8, %r9, %r13
	.word 0x888a2d80  ! 79: ANDcc_I	andcc 	%r8, 0x0d80, %r4
	.word 0x8c122460  ! 79: OR_I	or 	%r8, 0x0460, %r6
	.word 0x8eb20009  ! 79: ORNcc_R	orncc 	%r8, %r9, %r7
	.word 0xaeb20009  ! 79: SUBCcc_R	orncc 	%r8, %r9, %r23
	.word 0xb2b20009  ! 79: SUBCcc_R	orncc 	%r8, %r9, %r25
	.word 0x84822bc4  ! 79: ADDcc_I	addcc 	%r8, 0x0bc4, %r2
	.word 0x8cb20009  ! 79: ORNcc_R	orncc 	%r8, %r9, %r6
	.word 0x86820009  ! 79: ADDcc_R	addcc 	%r8, %r9, %r3
	.word 0x8caa2844  ! 79: ANDNcc_I	andncc 	%r8, 0x0844, %r6
	.word 0xb89a0009  ! 79: XORcc_R	xorcc 	%r8, %r9, %r28
	.word 0x8e9a0009  ! 79: XORcc_R	xorcc 	%r8, %r9, %r7
	.word 0x9e020009  ! 80: ADD_R	add 	%r8, %r9, %r15
	.word 0x8a9a0009  ! 80: XORcc_R	xorcc 	%r8, %r9, %r5
	.word 0x8e3a23c8  ! 80: XNOR_I	xnor 	%r8, 0x03c8, %r7
	.word 0x82b22f48  ! 80: SUBCcc_I	orncc 	%r8, 0x0f48, %r1
	.word 0x862a0009  ! 80: ANDN_R	andn 	%r8, %r9, %r3
	.word 0x8a820009  ! 80: ADDcc_R	addcc 	%r8, %r9, %r5
	.word 0x84ba0009  ! 80: XNORcc_R	xnorcc 	%r8, %r9, %r2
	.word 0x8ca20009  ! 80: SUBcc_R	subcc 	%r8, %r9, %r6
	.word 0x8c2a2608  ! 80: ANDN_I	andn 	%r8, 0x0608, %r6
	.word 0xa73a1009  ! 80: SRAX_R	srax	%r8, %r9, %r19
	.word 0x8cb20009  ! 80: ORNcc_R	orncc 	%r8, %r9, %r6
	.word 0x88322ad4  ! 80: ORN_I	orn 	%r8, 0x0ad4, %r4
	.word 0x8d320009  ! 80: SRL_R	srl 	%r8, %r9, %r6
	.word 0x8caa2b6c  ! 80: ANDNcc_I	andncc 	%r8, 0x0b6c, %r6
	.word 0x8b782401  ! 80: MOVR_I	move	%r0, 0xffffff6c, %r5
	.word 0xacba0009  ! 86: XNORcc_R	xnorcc 	%r8, %r9, %r22
	.word 0xbeba2f8c  ! 86: XNORcc_I	xnorcc 	%r8, 0x0f8c, %r31
	.word 0x85320009  ! 86: SRL_R	srl 	%r8, %r9, %r2
	.word 0xb3780409  ! 86: MOVR_R	move	%r0, %r9, %r25
	.word 0xb2ba21bc  ! 86: XNORcc_I	xnorcc 	%r8, 0x01bc, %r25
	.word 0x882a2888  ! 86: ANDN_I	andn 	%r8, 0x0888, %r4
	.word 0x88b2282c  ! 86: ORNcc_I	orncc 	%r8, 0x082c, %r4
	.word 0x82b227b0  ! 86: ORNcc_I	orncc 	%r8, 0x07b0, %r1
	.word 0x86b20009  ! 86: SUBCcc_R	orncc 	%r8, %r9, %r3
	.word 0x880a0009  ! 86: AND_R	and 	%r8, %r9, %r4
	.word 0x892a1009  ! 88: SLLX_R	sllx	%r8, %r9, %r4
	.word 0x84a22440  ! 88: SUBcc_I	subcc 	%r8, 0x0440, %r2
	.word 0x853a3001  ! 88: SRAX_I	srax	%r8, 0x0001, %r2
	.word 0x8e320009  ! 88: ORN_R	orn 	%r8, %r9, %r7
	.word 0xab2a3001  ! 88: SLLX_I	sllx	%r8, 0x0001, %r21
	.word 0x982224dc  ! 88: SUB_I	sub 	%r8, 0x04dc, %r12
	.word 0x8e3a0009  ! 88: XNOR_R	xnor 	%r8, %r9, %r7
	.word 0x868a2cac  ! 88: ANDcc_I	andcc 	%r8, 0x0cac, %r3
	.word 0x8a020009  ! 88: ADD_R	add 	%r8, %r9, %r5
	.word 0x8eb20009  ! 88: SUBCcc_R	orncc 	%r8, %r9, %r7
	.word 0x82920009  ! 88: ORcc_R	orcc 	%r8, %r9, %r1
	.word 0x820a0009  ! 88: AND_R	and 	%r8, %r9, %r1
	.word 0x84222560  ! 88: SUB_I	sub 	%r8, 0x0560, %r2
	.word 0x00800002  ! 90: BN	bn  	<label_0x2>
	.word 0x9a6a0009  ! 90: UDIVX_R	udivx 	%r8, %r9, %r13
	.word 0x0eca0001  ! 92: BRGEZ	brgez  ,pt	%8,<label_0xa0001>
	.word 0x8e72235c  ! 92: UDIV_I	udiv 	%r8, 0x035c, %r7
	.word 0x8c122260  ! 95: OR_I	or 	%r8, 0x0260, %r6
	.word 0x8b2a1009  ! 95: SLLX_R	sllx	%r8, %r9, %r5
	.word 0xb6aa2098  ! 95: ANDNcc_I	andncc 	%r8, 0x0098, %r27
	.word 0x83641809  ! 95: MOVcc_R	<illegal instruction>
	.word 0x84b20009  ! 95: SUBCcc_R	orncc 	%r8, %r9, %r2
	.word 0xb60a0009  ! 95: AND_R	and 	%r8, %r9, %r27
	.word 0x94b20009  ! 95: ORNcc_R	orncc 	%r8, %r9, %r10
	.word 0x86422108  ! 95: ADDC_I	addc 	%r8, 0x0108, %r3
	.word 0xb2420009  ! 95: ADDC_R	addc 	%r8, %r9, %r25
	.word 0x940a0009  ! 95: AND_R	and 	%r8, %r9, %r10
	.word 0xc93a0009  ! 100: STDF_R	std	%f4, [%r9, %r8]
	.word 0xe1020009  ! 100: LDF_R	ld	[%r8, %r9], %f16
	.word 0x852a2001  ! 100: SLL_I	sll 	%r8, 0x0001, %r2
	.word 0xb0f22f5c  ! 100: UDIVcc_I	udivcc 	%r8, 0x0f5c, %r24
	.word 0x8e422088  ! 104: ADDC_I	addc 	%r8, 0x0088, %r7
	.word 0x86120009  ! 104: OR_R	or 	%r8, %r9, %r3
	.word 0x848a2608  ! 104: ANDcc_I	andcc 	%r8, 0x0608, %r2
	.word 0x8eaa0009  ! 104: ANDNcc_R	andncc 	%r8, %r9, %r7
	.word 0x88220009  ! 104: SUB_R	sub 	%r8, %r9, %r4
	.word 0xa80a22b0  ! 104: AND_I	and 	%r8, 0x02b0, %r20
	.word 0xb03a218c  ! 104: XNOR_I	xnor 	%r8, 0x018c, %r24
	.word 0x973a2001  ! 104: SRA_I	sra 	%r8, 0x0001, %r11
	.word 0x873a2001  ! 104: SRA_I	sra 	%r8, 0x0001, %r3
	.word 0xaca224e8  ! 104: SUBcc_I	subcc 	%r8, 0x04e8, %r22
	.word 0x88020009  ! 104: ADD_R	add 	%r8, %r9, %r4
	.word 0x8c8a0009  ! 105: ANDcc_R	andcc 	%r8, %r9, %r6
	.word 0x822a0009  ! 105: ANDN_R	andn 	%r8, %r9, %r1
	.word 0x8e2a0009  ! 105: ANDN_R	andn 	%r8, %r9, %r7
	.word 0x8a8a0009  ! 105: ANDcc_R	andcc 	%r8, %r9, %r5
	.word 0x873a1009  ! 105: SRAX_R	srax	%r8, %r9, %r3
	.word 0xa2120009  ! 105: OR_R	or 	%r8, %r9, %r17
	.word 0x82c22044  ! 105: ADDCcc_I	addccc 	%r8, 0x0044, %r1
	.word 0x9c322d48  ! 105: ORN_I	orn 	%r8, 0x0d48, %r14
	.word 0x8e922fb8  ! 105: ORcc_I	orcc 	%r8, 0x0fb8, %r7
	.word 0x8f323001  ! 105: SRLX_I	srlx	%r8, 0x0001, %r7
	.word 0x880a2660  ! 105: AND_I	and 	%r8, 0x0660, %r4
	.word 0x2aca0001  ! 111: BRNZ	brnz,a,pt	%8,<label_0xa0001>
	.word 0x8ef20009  ! 111: UDIVcc_R	udivcc 	%r8, %r9, %r7
	.word 0x82c22124  ! 113: ADDCcc_I	addccc 	%r8, 0x0124, %r1
	.word 0x94b226c0  ! 113: SUBCcc_I	orncc 	%r8, 0x06c0, %r10
	.word 0x853a1009  ! 113: SRAX_R	srax	%r8, %r9, %r2
	.word 0x9a420009  ! 113: ADDC_R	addc 	%r8, %r9, %r13
	.word 0xb83a28f8  ! 113: XNOR_I	xnor 	%r8, 0x08f8, %r28
	.word 0x852a2001  ! 113: SLL_I	sll 	%r8, 0x0001, %r2
	.word 0x88120009  ! 113: OR_R	or 	%r8, %r9, %r4
	.word 0x8d2a3001  ! 113: SLLX_I	sllx	%r8, 0x0001, %r6
	.word 0x88ba0009  ! 113: XNORcc_R	xnorcc 	%r8, %r9, %r4
	.word 0x8f320009  ! 113: SRL_R	srl 	%r8, %r9, %r7
	.word 0x943227e8  ! 113: SUBC_I	orn 	%r8, 0x07e8, %r10
	.word 0xb2022108  ! 113: ADD_I	add 	%r8, 0x0108, %r25
	.word 0xcc320009  ! 123: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xe4520009  ! 123: LDSH_R	ldsh	[%r8 + %r9], %r18
	.word 0x847a0009  ! 123: SDIV_R	sdiv 	%r8, %r9, %r2
	.word 0x8c6a0009  ! 123: UDIVX_R	udivx 	%r8, %r9, %r6
	.word 0x2a800001  ! 127: BCS	bcs,a	<label_0x1>
	.word 0x9cfa0009  ! 127: SDIVcc_R	sdivcc 	%r8, %r9, %r14
	.word 0x06ca0001  ! 131: BRLZ	brlz  ,pt	%8,<label_0xa0001>
	.word 0xac7a2508  ! 131: SDIV_I	sdiv 	%r8, 0x0508, %r22
	.word 0x8b322001  ! 132: SRL_I	srl 	%r8, 0x0001, %r5
	.word 0x82b22068  ! 132: ORNcc_I	orncc 	%r8, 0x0068, %r1
	.word 0x8d782401  ! 132: MOVR_I	move	%r0, 0x68, %r6
	.word 0x82920009  ! 132: ORcc_R	orcc 	%r8, %r9, %r1
	.word 0x8d782401  ! 132: MOVR_I	move	%r0, 0x9, %r6
	.word 0x842a0009  ! 132: ANDN_R	andn 	%r8, %r9, %r2
	.word 0xb28a0009  ! 132: ANDcc_R	andcc 	%r8, %r9, %r25
	.word 0x9b641809  ! 132: MOVcc_R	<illegal instruction>
	.word 0x823a286c  ! 132: XNOR_I	xnor 	%r8, 0x086c, %r1
	.word 0x8f3a1009  ! 132: SRAX_R	srax	%r8, %r9, %r7
	.word 0xa72a1009  ! 132: SLLX_R	sllx	%r8, %r9, %r19
	.word 0xa28a2b4c  ! 132: ANDcc_I	andcc 	%r8, 0x0b4c, %r17
	.word 0xb41a0009  ! 132: XOR_R	xor 	%r8, %r9, %r26
	.word 0x0a800002  ! 134: BCS	bcs  	<label_0x2>
	.word 0x8e7a0009  ! 134: SDIV_R	sdiv 	%r8, %r9, %r7
	.word 0x88b20009  ! 135: SUBCcc_R	orncc 	%r8, %r9, %r4
	.word 0x84920009  ! 135: ORcc_R	orcc 	%r8, %r9, %r2
	.word 0xa52a0009  ! 135: SLL_R	sll 	%r8, %r9, %r18
	.word 0xb4322f80  ! 135: SUBC_I	orn 	%r8, 0x0f80, %r26
	.word 0x9aa20009  ! 135: SUBcc_R	subcc 	%r8, %r9, %r13
	.word 0x8b321009  ! 135: SRLX_R	srlx	%r8, %r9, %r5
	.word 0xaa420009  ! 135: ADDC_R	addc 	%r8, %r9, %r21
	.word 0x8a120009  ! 135: OR_R	or 	%r8, %r9, %r5
	.word 0x8eba26c4  ! 135: XNORcc_I	xnorcc 	%r8, 0x06c4, %r7
	.word 0x868a29fc  ! 135: ANDcc_I	andcc 	%r8, 0x09fc, %r3
	.word 0xac4223c8  ! 135: ADDC_I	addc 	%r8, 0x03c8, %r22
	.word 0x949a2cc0  ! 135: XORcc_I	xorcc 	%r8, 0x0cc0, %r10
	.word 0x86322a48  ! 135: ORN_I	orn 	%r8, 0x0a48, %r3
	.word 0xb60a0009  ! 135: AND_R	and 	%r8, %r9, %r27
	.word 0x852a2001  ! 135: SLL_I	sll 	%r8, 0x0001, %r2
	.word 0x22800001  ! 137: BE	be,a	<label_0x1>
	.word 0x8c6a0009  ! 137: UDIVX_R	udivx 	%r8, %r9, %r6
	.word 0x12800001  ! 139: BNE	bne  	<label_0x1>
	.word 0xaafa0009  ! 139: SDIVcc_R	sdivcc 	%r8, %r9, %r21
	.word 0x828a0009  ! 141: ANDcc_R	andcc 	%r8, %r9, %r1
	.word 0x98b20009  ! 141: ORNcc_R	orncc 	%r8, %r9, %r12
	.word 0x88aa2354  ! 141: ANDNcc_I	andncc 	%r8, 0x0354, %r4
	.word 0x881a2de4  ! 141: XOR_I	xor 	%r8, 0x0de4, %r4
	.word 0x820a0009  ! 141: AND_R	and 	%r8, %r9, %r1
	.word 0x9e920009  ! 141: ORcc_R	orcc 	%r8, %r9, %r15
	.word 0x89321009  ! 141: SRLX_R	srlx	%r8, %r9, %r4
	.word 0x85323001  ! 141: SRLX_I	srlx	%r8, 0x0001, %r2
	.word 0x85643801  ! 141: MOVcc_I	<illegal instruction>
	.word 0x883a0009  ! 141: XNOR_R	xnor 	%r8, %r9, %r4
	.word 0x18800002  ! 145: BGU	bgu  	<label_0x2>
	.word 0x8f6a0009  ! 145: SDIVX_R	sdivx	%r8, %r9, %r7
	.word 0xca320009  ! 152: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xf51a0009  ! 152: LDDF_R	ldd	[%r8, %r9], %f26
	.word 0xb8fa0009  ! 152: SDIVcc_R	sdivcc 	%r8, %r9, %r28
	.word 0x84f20009  ! 152: UDIVcc_R	udivcc 	%r8, %r9, %r2
	.word 0x04800001  ! 154: BLE	ble  	<label_0x1>
	.word 0xbc7a0009  ! 154: SDIV_R	sdiv 	%r8, %r9, %r30
	.word 0x3c800001  ! 156: BPOS	bpos,a	<label_0x1>
	.word 0x8c6a0009  ! 156: UDIVX_R	udivx 	%r8, %r9, %r6
	.word 0x40000002  ! 158: CALL	call	disp30_2
	.word 0xa2fa0009  ! 158: SDIVcc_R	sdivcc 	%r8, %r9, %r17
	.word 0x8c320009  ! 159: ORN_R	orn 	%r8, %r9, %r6
	.word 0x82320009  ! 159: ORN_R	orn 	%r8, %r9, %r1
	.word 0x86020009  ! 159: ADD_R	add 	%r8, %r9, %r3
	.word 0x8e320009  ! 159: ORN_R	orn 	%r8, %r9, %r7
	.word 0xb32a3001  ! 159: SLLX_I	sllx	%r8, 0x0001, %r25
	.word 0xaf2a2001  ! 159: SLL_I	sll 	%r8, 0x0001, %r23
	.word 0x83641809  ! 159: MOVcc_R	<illegal instruction>
	.word 0x8c1a0009  ! 159: XOR_R	xor 	%r8, %r9, %r6
	.word 0x8d322001  ! 159: SRL_I	srl 	%r8, 0x0001, %r6
	.word 0x9a8a0009  ! 159: ANDcc_R	andcc 	%r8, %r9, %r13
	.word 0x87643801  ! 159: MOVcc_I	<illegal instruction>
	.word 0x8e3a0009  ! 159: XNOR_R	xnor 	%r8, %r9, %r7
	.word 0x87322001  ! 159: SRL_I	srl 	%r8, 0x0001, %r3
	.word 0x00800002  ! 161: BN	bn  	<label_0x2>
	.word 0x976a2968  ! 161: SDIVX_I	sdivx	%r8, 0x0968, %r11
	.word 0xc2320009  ! 165: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xf41a0009  ! 165: LDD_R	ldd	[%r8 + %r9], %r26
	.word 0xb4f2252c  ! 165: UDIVcc_I	udivcc 	%r8, 0x052c, %r26
	.word 0xa2fa2ac4  ! 165: SDIVcc_I	sdivcc 	%r8, 0x0ac4, %r17
	.word 0xc82a0009  ! 169: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xcc520009  ! 169: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0x8cb20009  ! 169: ORNcc_R	orncc 	%r8, %r9, %r6
	.word 0x827a0009  ! 169: SDIV_R	sdiv 	%r8, %r9, %r1
	.word 0xf7220009  ! 176: STF_R	st	%f27, [%r9, %r8]
	.word 0xc2520009  ! 176: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0x887a0009  ! 176: SDIV_R	sdiv 	%r8, %r9, %r4
	.word 0x86f22c74  ! 176: UDIVcc_I	udivcc 	%r8, 0x0c74, %r3
	.word 0xfc320009  ! 180: STH_R	sth	%r30, [%r8 + %r9]
	.word 0xcd020009  ! 180: LDF_R	ld	[%r8, %r9], %f6
	.word 0xb9321009  ! 180: SRLX_R	srlx	%r8, %r9, %r28
	.word 0xb06a0009  ! 180: UDIVX_R	udivx 	%r8, %r9, %r24
	.word 0x852a0009  ! 181: SLL_R	sll 	%r8, %r9, %r2
	.word 0x849a0009  ! 181: XORcc_R	xorcc 	%r8, %r9, %r2
	.word 0x8c2a2544  ! 181: ANDN_I	andn 	%r8, 0x0544, %r6
	.word 0x832a0009  ! 181: SLL_R	sll 	%r8, %r9, %r1
	.word 0x82c20009  ! 181: ADDCcc_R	addccc 	%r8, %r9, %r1
	.word 0x9c822130  ! 181: ADDcc_I	addcc 	%r8, 0x0130, %r14
	.word 0x8e322804  ! 181: SUBC_I	orn 	%r8, 0x0804, %r7
	.word 0x862a261c  ! 181: ANDN_I	andn 	%r8, 0x061c, %r3
	.word 0x82a22474  ! 181: SUBcc_I	subcc 	%r8, 0x0474, %r1
	.word 0x87641809  ! 181: MOVcc_R	<illegal instruction>
	.word 0xa3780409  ! 181: MOVR_R	move	%r0, %r9, %r17
	.word 0x8f3a2001  ! 181: SRA_I	sra 	%r8, 0x0001, %r7
	.word 0xcd220009  ! 189: STF_R	st	%f6, [%r9, %r8]
	.word 0xca020009  ! 189: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0x843a0009  ! 189: XNOR_R	xnor 	%r8, %r9, %r2
	.word 0x8872261c  ! 189: UDIV_I	udiv 	%r8, 0x061c, %r4
	.word 0x38800001  ! 192: BGU	bgu,a	<label_0x1>
	.word 0xa6722eb8  ! 192: UDIV_I	udiv 	%r8, 0x0eb8, %r19
	.word 0x84aa0009  ! 193: ANDNcc_R	andncc 	%r8, %r9, %r2
	.word 0xa8320009  ! 193: SUBC_R	orn 	%r8, %r9, %r20
	.word 0x84a20009  ! 193: SUBcc_R	subcc 	%r8, %r9, %r2
	.word 0x8e1221c8  ! 193: OR_I	or 	%r8, 0x01c8, %r7
	.word 0x841a2388  ! 193: XOR_I	xor 	%r8, 0x0388, %r2
	.word 0xb53a3001  ! 193: SRAX_I	srax	%r8, 0x0001, %r26
	.word 0x82420009  ! 193: ADDC_R	addc 	%r8, %r9, %r1
	.word 0x82822f58  ! 193: ADDcc_I	addcc 	%r8, 0x0f58, %r1
	.word 0x8ab221c8  ! 193: SUBCcc_I	orncc 	%r8, 0x01c8, %r5
	.word 0x993a1009  ! 193: SRAX_R	srax	%r8, %r9, %r12
	.word 0x8ec224d4  ! 193: ADDCcc_I	addccc 	%r8, 0x04d4, %r7
	.word 0x8ab22e7c  ! 193: SUBCcc_I	orncc 	%r8, 0x0e7c, %r5
	.word 0x8b322001  ! 193: SRL_I	srl 	%r8, 0x0001, %r5
	.word 0xfc720009  ! 198: STX_R	stx	%r30, [%r8 + %r9]
	.word 0xf51a0009  ! 198: LDDF_R	ldd	[%r8, %r9], %f26
	.word 0xc20a20f0  ! 198: LDUB_I	ldub	[%r8 + 0x00f0], %r1
	.word 0x9e7a2854  ! 198: SDIV_I	sdiv 	%r8, 0x0854, %r15
	.word 0x8f2a2001  ! 200: SLL_I	sll 	%r8, 0x0001, %r7
	.word 0x8f641809  ! 200: MOVcc_R	<illegal instruction>
	.word 0x96ba24ec  ! 200: XNORcc_I	xnorcc 	%r8, 0x04ec, %r11
	.word 0x85782401  ! 200: MOVR_I	move	%r0, 0x4ec, %r2
	.word 0x9c8a29f0  ! 200: ANDcc_I	andcc 	%r8, 0x09f0, %r14
	.word 0xa43a0009  ! 200: XNOR_R	xnor 	%r8, %r9, %r18
	.word 0x84ba2c6c  ! 200: XNORcc_I	xnorcc 	%r8, 0x0c6c, %r2
	.word 0x89321009  ! 200: SRLX_R	srlx	%r8, %r9, %r4
	.word 0xac320009  ! 200: SUBC_R	orn 	%r8, %r9, %r22
	.word 0xba1a0009  ! 200: XOR_R	xor 	%r8, %r9, %r29
	.word 0x872a0009  ! 200: SLL_R	sll 	%r8, %r9, %r3
	.word 0x9a2a0009  ! 200: ANDN_R	andn 	%r8, %r9, %r13
	.word 0x883228f0  ! 200: SUBC_I	orn 	%r8, 0x08f0, %r4
	.word 0x840a0009  ! 200: AND_R	and 	%r8, %r9, %r2
	.word 0x0cca0001  ! 204: BRGZ	brgz  ,pt	%8,<label_0xa0001>
	.word 0xa16a0009  ! 204: SDIVX_R	sdivx	%r8, %r9, %r16
	.word 0x0ac20001  ! 206: BRNZ	brnz  ,nt	%8,<label_0x20001>
	.word 0x847a22a4  ! 206: SDIV_I	sdiv 	%r8, 0x02a4, %r2
	.word 0xc6320009  ! 213: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc85a0009  ! 213: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0x82c22cdc  ! 213: ADDCcc_I	addccc 	%r8, 0x0cdc, %r1
	.word 0x8e7228a8  ! 213: UDIV_I	udiv 	%r8, 0x08a8, %r7
	.word 0xd5220009  ! 217: STF_R	st	%f10, [%r9, %r8]
	.word 0xc4420009  ! 217: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0x867a0009  ! 217: SDIV_R	sdiv 	%r8, %r9, %r3
	.word 0x9afa0009  ! 217: SDIVcc_R	sdivcc 	%r8, %r9, %r13
	.word 0xcc2a0009  ! 221: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xd44a0009  ! 221: LDSB_R	ldsb	[%r8 + %r9], %r10
	.word 0x8ef20009  ! 221: UDIVcc_R	udivcc 	%r8, %r9, %r7
	.word 0x8cf22510  ! 221: UDIVcc_I	udivcc 	%r8, 0x0510, %r6
	.word 0x08800001  ! 223: BLEU	bleu  	<label_0x1>
	.word 0x84fa2008  ! 223: SDIVcc_I	sdivcc 	%r8, 0x0008, %r2
	.word 0xb3780409  ! 224: MOVR_R	move	%r0, %r9, %r25
	.word 0xa4820009  ! 224: ADDcc_R	addcc 	%r8, %r9, %r18
	.word 0x8a0a291c  ! 224: AND_I	and 	%r8, 0x091c, %r5
	.word 0x82b2208c  ! 224: SUBCcc_I	orncc 	%r8, 0x008c, %r1
	.word 0x842a0009  ! 224: ANDN_R	andn 	%r8, %r9, %r2
	.word 0x8e320009  ! 224: SUBC_R	orn 	%r8, %r9, %r7
	.word 0x82aa0009  ! 224: ANDNcc_R	andncc 	%r8, %r9, %r1
	.word 0xbab22ab0  ! 224: SUBCcc_I	orncc 	%r8, 0x0ab0, %r29
	.word 0x889a25fc  ! 224: XORcc_I	xorcc 	%r8, 0x05fc, %r4
	.word 0x888a0009  ! 224: ANDcc_R	andcc 	%r8, %r9, %r4
	.word 0x861a21f8  ! 224: XOR_I	xor 	%r8, 0x01f8, %r3
	.word 0xaa9a21bc  ! 224: XORcc_I	xorcc 	%r8, 0x01bc, %r21
	.word 0x8c0a0009  ! 224: AND_R	and 	%r8, %r9, %r6
	.word 0xa82a0009  ! 224: ANDN_R	andn 	%r8, %r9, %r20
	.word 0x8f2a2001  ! 224: SLL_I	sll 	%r8, 0x0001, %r7
	.word 0x3c800001  ! 227: BPOS	bpos,a	<label_0x1>
	.word 0x9cf224a8  ! 227: UDIVcc_I	udivcc 	%r8, 0x04a8, %r14
	.word 0xdd220009  ! 231: STF_R	st	%f14, [%r9, %r8]
	.word 0xc9020009  ! 231: LDF_R	ld	[%r8, %r9], %f4
	.word 0x86720009  ! 231: UDIV_R	udiv 	%r8, %r9, %r3
	.word 0x8d6a0009  ! 231: SDIVX_R	sdivx	%r8, %r9, %r6
	.word 0xc6320009  ! 235: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc80a0009  ! 235: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0x89641809  ! 235: MOVcc_R	<illegal instruction>
	.word 0x876a2b7c  ! 235: SDIVX_I	sdivx	%r8, 0x0b7c, %r3
	.word 0x8ab20009  ! 236: SUBCcc_R	orncc 	%r8, %r9, %r5
	.word 0x8ea22764  ! 236: SUBcc_I	subcc 	%r8, 0x0764, %r7
	.word 0x8a020009  ! 236: ADD_R	add 	%r8, %r9, %r5
	.word 0x82b22c7c  ! 236: ORNcc_I	orncc 	%r8, 0x0c7c, %r1
	.word 0x85641809  ! 236: MOVcc_R	<illegal instruction>
	.word 0xb0922a20  ! 236: ORcc_I	orcc 	%r8, 0x0a20, %r24
	.word 0x86420009  ! 236: ADDC_R	addc 	%r8, %r9, %r3
	.word 0x892a2001  ! 236: SLL_I	sll 	%r8, 0x0001, %r4
	.word 0x8ab20009  ! 236: SUBCcc_R	orncc 	%r8, %r9, %r5
	.word 0xa4ba219c  ! 236: XNORcc_I	xnorcc 	%r8, 0x019c, %r18
	.word 0x84122854  ! 236: OR_I	or 	%r8, 0x0854, %r2
	.word 0xaea20009  ! 236: SUBcc_R	subcc 	%r8, %r9, %r23
	.word 0xa8aa0009  ! 238: ANDNcc_R	andncc 	%r8, %r9, %r20
	.word 0x94120009  ! 238: OR_R	or 	%r8, %r9, %r10
	.word 0x8d322001  ! 238: SRL_I	srl 	%r8, 0x0001, %r6
	.word 0x833a2001  ! 238: SRA_I	sra 	%r8, 0x0001, %r1
	.word 0x8a8a2088  ! 238: ANDcc_I	andcc 	%r8, 0x0088, %r5
	.word 0xaa120009  ! 238: OR_R	or 	%r8, %r9, %r21
	.word 0x8e22211c  ! 238: SUB_I	sub 	%r8, 0x011c, %r7
	.word 0x889a0009  ! 238: XORcc_R	xorcc 	%r8, %r9, %r4
	.word 0xa4322d5c  ! 238: ORN_I	orn 	%r8, 0x0d5c, %r18
	.word 0x88c20009  ! 238: ADDCcc_R	addccc 	%r8, %r9, %r4
	.word 0x8a420009  ! 238: ADDC_R	addc 	%r8, %r9, %r5
	.word 0x82022f50  ! 238: ADD_I	add 	%r8, 0x0f50, %r1
	.word 0x0eca0001  ! 240: BRGEZ	brgez  ,pt	%8,<label_0xa0001>
	.word 0xaef20009  ! 240: UDIVcc_R	udivcc 	%r8, %r9, %r23
	.word 0x24ca0001  ! 243: BRLEZ	brlez,a,pt	%8,<label_0xa0001>
	.word 0x8efa0009  ! 243: SDIVcc_R	sdivcc 	%r8, %r9, %r7
	.word 0x1e800001  ! 245: BVC	bvc  	<label_0x1>
	.word 0x8e6a2260  ! 245: UDIVX_I	udivx 	%r8, 0x0260, %r7
	.word 0xc82a0009  ! 250: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xce0a0009  ! 250: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xbaaa0009  ! 250: ANDNcc_R	andncc 	%r8, %r9, %r29
	.word 0x8a7a0009  ! 250: SDIV_R	sdiv 	%r8, %r9, %r5
	.word 0x83322001  ! 251: SRL_I	srl 	%r8, 0x0001, %r1
	.word 0xab3a2001  ! 251: SRA_I	sra 	%r8, 0x0001, %r21
	.word 0x820a0009  ! 251: AND_R	and 	%r8, %r9, %r1
	.word 0x88a22d6c  ! 251: SUBcc_I	subcc 	%r8, 0x0d6c, %r4
	.word 0x84b20009  ! 251: SUBCcc_R	orncc 	%r8, %r9, %r2
	.word 0x89782401  ! 251: MOVR_I	move	%r0, 0x9, %r4
	.word 0xb7322001  ! 251: SRL_I	srl 	%r8, 0x0001, %r27
	.word 0x84b20009  ! 251: ORNcc_R	orncc 	%r8, %r9, %r2
	.word 0x8f780409  ! 251: MOVR_R	move	%r0, %r9, %r7
	.word 0x8f3a3001  ! 251: SRAX_I	srax	%r8, 0x0001, %r7
	.word 0xa49a215c  ! 251: XORcc_I	xorcc 	%r8, 0x015c, %r18
	.word 0x82b22aac  ! 251: SUBCcc_I	orncc 	%r8, 0x0aac, %r1
	.word 0x86b220ac  ! 251: SUBCcc_I	orncc 	%r8, 0x00ac, %r3
	.word 0x86322858  ! 251: SUBC_I	orn 	%r8, 0x0858, %r3
	.word 0xa2320009  ! 253: SUBC_R	orn 	%r8, %r9, %r17
	.word 0xa20a0009  ! 253: AND_R	and 	%r8, %r9, %r17
	.word 0xb4b20009  ! 253: ORNcc_R	orncc 	%r8, %r9, %r26
	.word 0xa93a2001  ! 253: SRA_I	sra 	%r8, 0x0001, %r20
	.word 0x9a2a2de8  ! 253: ANDN_I	andn 	%r8, 0x0de8, %r13
	.word 0x8cba23a4  ! 253: XNORcc_I	xnorcc 	%r8, 0x03a4, %r6
	.word 0x88b20009  ! 253: ORNcc_R	orncc 	%r8, %r9, %r4
	.word 0x9e320009  ! 253: ORN_R	orn 	%r8, %r9, %r15
	.word 0x86220009  ! 253: SUB_R	sub 	%r8, %r9, %r3
	.word 0xac120009  ! 253: OR_R	or 	%r8, %r9, %r22
	.word 0x86a22b18  ! 253: SUBcc_I	subcc 	%r8, 0x0b18, %r3
	.word 0x82322a28  ! 253: ORN_I	orn 	%r8, 0x0a28, %r1
	.word 0x8a920009  ! 253: ORcc_R	orcc 	%r8, %r9, %r5
	.word 0x888a0009  ! 253: ANDcc_R	andcc 	%r8, %r9, %r4
	.word 0x84420009  ! 253: ADDC_R	addc 	%r8, %r9, %r2
	.word 0xcf3a0009  ! 258: STDF_R	std	%f7, [%r9, %r8]
	.word 0xe8420009  ! 258: LDSW_R	ldsw	[%r8 + %r9], %r20
	.word 0xcd020009  ! 258: LDF_R	ld	[%r8, %r9], %f6
	.word 0x8f6a0009  ! 258: SDIVX_R	sdivx	%r8, %r9, %r7
	.word 0x8cb20009  ! 261: SUBCcc_R	orncc 	%r8, %r9, %r6
	.word 0x833a3001  ! 261: SRAX_I	srax	%r8, 0x0001, %r1
	.word 0x87780409  ! 261: MOVR_R	move	%r0, %r9, %r3
	.word 0x8eaa0009  ! 261: ANDNcc_R	andncc 	%r8, %r9, %r7
	.word 0xbf3a0009  ! 261: SRA_R	sra 	%r8, %r9, %r31
	.word 0x82120009  ! 261: OR_R	or 	%r8, %r9, %r1
	.word 0x9d323001  ! 261: SRLX_I	srlx	%r8, 0x0001, %r14
	.word 0x8e122eb4  ! 261: OR_I	or 	%r8, 0x0eb4, %r7
	.word 0xbb2a3001  ! 261: SLLX_I	sllx	%r8, 0x0001, %r29
	.word 0x8c8a259c  ! 261: ANDcc_I	andcc 	%r8, 0x059c, %r6
	.word 0x02800002  ! 264: BE	be  	<label_0x2>
	.word 0xb4f221dc  ! 264: UDIVcc_I	udivcc 	%r8, 0x01dc, %r26
	.word 0x0c800001  ! 267: BNEG	bneg  	<label_0x1>
	.word 0xa47a2cec  ! 267: SDIV_I	sdiv 	%r8, 0x0cec, %r18
	.word 0x2cca0001  ! 269: BRGZ	brgz,a,pt	%8,<label_0xa0001>
	.word 0x8d6a0009  ! 269: SDIVX_R	sdivx	%r8, %r9, %r6
	.word 0xc8220009  ! 276: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xe6020009  ! 276: LDUW_R	lduw	[%r8 + %r9], %r19
	.word 0xc01a0009  ! 276: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0x8a72233c  ! 276: UDIV_I	udiv 	%r8, 0x033c, %r5
	.word 0x97323001  ! 277: SRLX_I	srlx	%r8, 0x0001, %r11
	.word 0xa2b22914  ! 277: ORNcc_I	orncc 	%r8, 0x0914, %r17
	.word 0x88322f2c  ! 277: SUBC_I	orn 	%r8, 0x0f2c, %r4
	.word 0xb6922754  ! 277: ORcc_I	orcc 	%r8, 0x0754, %r27
	.word 0x87323001  ! 277: SRLX_I	srlx	%r8, 0x0001, %r3
	.word 0x829a2850  ! 277: XORcc_I	xorcc 	%r8, 0x0850, %r1
	.word 0x86122800  ! 277: OR_I	or 	%r8, 0x0800, %r3
	.word 0x8e9a0009  ! 277: XORcc_R	xorcc 	%r8, %r9, %r7
	.word 0xb5320009  ! 277: SRL_R	srl 	%r8, %r9, %r26
	.word 0x8a920009  ! 277: ORcc_R	orcc 	%r8, %r9, %r5
	.word 0x882a0009  ! 277: ANDN_R	andn 	%r8, %r9, %r4
	.word 0x832a0009  ! 277: SLL_R	sll 	%r8, %r9, %r1
	.word 0x8f641809  ! 277: MOVcc_R	<illegal instruction>
	.word 0x12800002  ! 279: BNE	bne  	<label_0x2>
	.word 0x8af22f38  ! 279: UDIVcc_I	udivcc 	%r8, 0x0f38, %r5
	.word 0xb80a0009  ! 282: AND_R	and 	%r8, %r9, %r28
	.word 0x82922964  ! 282: ORcc_I	orcc 	%r8, 0x0964, %r1
	.word 0x8d2a3001  ! 282: SLLX_I	sllx	%r8, 0x0001, %r6
	.word 0x9aba0009  ! 282: XNORcc_R	xnorcc 	%r8, %r9, %r13
	.word 0x8a322bb8  ! 282: ORN_I	orn 	%r8, 0x0bb8, %r5
	.word 0xb12a1009  ! 282: SLLX_R	sllx	%r8, %r9, %r24
	.word 0x832a2001  ! 282: SLL_I	sll 	%r8, 0x0001, %r1
	.word 0xaa320009  ! 282: SUBC_R	orn 	%r8, %r9, %r21
	.word 0xa81a2ccc  ! 282: XOR_I	xor 	%r8, 0x0ccc, %r20
	.word 0xb23a249c  ! 282: XNOR_I	xnor 	%r8, 0x049c, %r25
	.word 0x8d3a1009  ! 282: SRAX_R	srax	%r8, %r9, %r6
	.word 0x96b225dc  ! 282: ORNcc_I	orncc 	%r8, 0x05dc, %r11
	.word 0x24800001  ! 284: BLE	ble,a	<label_0x1>
	.word 0x96f22f44  ! 284: UDIVcc_I	udivcc 	%r8, 0x0f44, %r11
	.word 0xcd3a0009  ! 288: STDF_R	std	%f6, [%r9, %r8]
	.word 0xca4a0009  ! 288: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xb0a220c8  ! 288: SUBcc_I	subcc 	%r8, 0x00c8, %r24
	.word 0x867a2a98  ! 288: SDIV_I	sdiv 	%r8, 0x0a98, %r3
	.word 0xef220009  ! 292: STF_R	st	%f23, [%r9, %r8]
	.word 0xc81a0009  ! 292: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x986a0009  ! 292: UDIVX_R	udivx 	%r8, %r9, %r12
	.word 0x827a0009  ! 292: SDIV_R	sdiv 	%r8, %r9, %r1
	.word 0x84320009  ! 293: ORN_R	orn 	%r8, %r9, %r2
	.word 0xaeb22060  ! 293: SUBCcc_I	orncc 	%r8, 0x0060, %r23
	.word 0xa2a20009  ! 293: SUBcc_R	subcc 	%r8, %r9, %r17
	.word 0x8b322001  ! 293: SRL_I	srl 	%r8, 0x0001, %r5
	.word 0x9a320009  ! 293: SUBC_R	orn 	%r8, %r9, %r13
	.word 0xa73a0009  ! 293: SRA_R	sra 	%r8, %r9, %r19
	.word 0x8b780409  ! 293: MOVR_R	move	%r0, %r9, %r5
	.word 0x829a0009  ! 293: XORcc_R	xorcc 	%r8, %r9, %r1
	.word 0x88322c98  ! 293: ORN_I	orn 	%r8, 0x0c98, %r4
	.word 0x8b2a1009  ! 293: SLLX_R	sllx	%r8, %r9, %r5
	.word 0x8ea222e8  ! 293: SUBcc_I	subcc 	%r8, 0x02e8, %r7
	.word 0x868a25f8  ! 293: ANDcc_I	andcc 	%r8, 0x05f8, %r3
	.word 0x868a26ac  ! 293: ANDcc_I	andcc 	%r8, 0x06ac, %r3
	.word 0x86420009  ! 293: ADDC_R	addc 	%r8, %r9, %r3
	.word 0x8f2a0009  ! 293: SLL_R	sll 	%r8, %r9, %r7
	.word 0x84120009  ! 295: OR_R	or 	%r8, %r9, %r2
	.word 0x8a3226f4  ! 295: ORN_I	orn 	%r8, 0x06f4, %r5
	.word 0x8d643801  ! 295: MOVcc_I	<illegal instruction>
	.word 0x853a3001  ! 295: SRAX_I	srax	%r8, 0x0001, %r2
	.word 0x8d782401  ! 295: MOVR_I	move	%r0, 0x1, %r6
	.word 0x9b3a0009  ! 295: SRA_R	sra 	%r8, %r9, %r13
	.word 0x883a2294  ! 295: XNOR_I	xnor 	%r8, 0x0294, %r4
	.word 0xba420009  ! 295: ADDC_R	addc 	%r8, %r9, %r29
	.word 0x822a0009  ! 295: ANDN_R	andn 	%r8, %r9, %r1
	.word 0x88320009  ! 295: SUBC_R	orn 	%r8, %r9, %r4
	.word 0x8cc22608  ! 297: ADDCcc_I	addccc 	%r8, 0x0608, %r6
	.word 0xa6b22810  ! 297: SUBCcc_I	orncc 	%r8, 0x0810, %r19
	.word 0x853a3001  ! 297: SRAX_I	srax	%r8, 0x0001, %r2
	.word 0x829a29d4  ! 297: XORcc_I	xorcc 	%r8, 0x09d4, %r1
	.word 0x8eb20009  ! 297: SUBCcc_R	orncc 	%r8, %r9, %r7
	.word 0x823a0009  ! 297: XNOR_R	xnor 	%r8, %r9, %r1
	.word 0x8ab22114  ! 297: ORNcc_I	orncc 	%r8, 0x0114, %r5
	.word 0x88020009  ! 297: ADD_R	add 	%r8, %r9, %r4
	.word 0x8d322001  ! 297: SRL_I	srl 	%r8, 0x0001, %r6
	.word 0x9c1a2e04  ! 297: XOR_I	xor 	%r8, 0x0e04, %r14
	.word 0xa68a0009  ! 297: ANDcc_R	andcc 	%r8, %r9, %r19
	.word 0x89782401  ! 300: MOVR_I	move	%r0, 0x9, %r4
	.word 0x9ab20009  ! 300: SUBCcc_R	orncc 	%r8, %r9, %r13
	.word 0x87323001  ! 300: SRLX_I	srlx	%r8, 0x0001, %r3
	.word 0xbe1224f8  ! 300: OR_I	or 	%r8, 0x04f8, %r31
	.word 0x82320009  ! 300: ORN_R	orn 	%r8, %r9, %r1
	.word 0x872a1009  ! 300: SLLX_R	sllx	%r8, %r9, %r3
	.word 0x893a2001  ! 300: SRA_I	sra 	%r8, 0x0001, %r4
	.word 0x869a0009  ! 300: XORcc_R	xorcc 	%r8, %r9, %r3
	.word 0x85641809  ! 300: MOVcc_R	<illegal instruction>
	.word 0x853a2001  ! 300: SRA_I	sra 	%r8, 0x0001, %r2
	.word 0x84920009  ! 300: ORcc_R	orcc 	%r8, %r9, %r2
	.word 0x9aa229b0  ! 300: SUBcc_I	subcc 	%r8, 0x09b0, %r13
	.word 0x8e320009  ! 300: SUBC_R	orn 	%r8, %r9, %r7
	.word 0x9e120009  ! 301: OR_R	or 	%r8, %r9, %r15
	.word 0xbf322001  ! 301: SRL_I	srl 	%r8, 0x0001, %r31
	.word 0x8f320009  ! 301: SRL_R	srl 	%r8, %r9, %r7
	.word 0x82320009  ! 301: ORN_R	orn 	%r8, %r9, %r1
	.word 0x87320009  ! 301: SRL_R	srl 	%r8, %r9, %r3
	.word 0xa6920009  ! 301: ORcc_R	orcc 	%r8, %r9, %r19
	.word 0xaca20009  ! 301: SUBcc_R	subcc 	%r8, %r9, %r22
	.word 0xbe2224e4  ! 301: SUB_I	sub 	%r8, 0x04e4, %r31
	.word 0x8b323001  ! 301: SRLX_I	srlx	%r8, 0x0001, %r5
	.word 0x8e8a0009  ! 301: ANDcc_R	andcc 	%r8, %r9, %r7
	.word 0x8c12273c  ! 301: OR_I	or 	%r8, 0x073c, %r6
	.word 0xaa2a25f0  ! 301: ANDN_I	andn 	%r8, 0x05f0, %r21
	.word 0x3a800002  ! 303: BCC	bcc,a	<label_0x2>
	.word 0x96722fc8  ! 303: UDIV_I	udiv 	%r8, 0x0fc8, %r11
	.word 0x3c800001  ! 305: BPOS	bpos,a	<label_0x1>
	.word 0xb86a0009  ! 305: UDIVX_R	udivx 	%r8, %r9, %r28
	.word 0xc73a0009  ! 309: STDF_R	std	%f3, [%r9, %r8]
	.word 0xca120009  ! 309: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xaa6a0009  ! 309: UDIVX_R	udivx 	%r8, %r9, %r21
	.word 0x867a2cdc  ! 309: SDIV_I	sdiv 	%r8, 0x0cdc, %r3
	.word 0xc22a0009  ! 313: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc6520009  ! 313: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0x893a0009  ! 313: SRA_R	sra 	%r8, %r9, %r4
	.word 0xa4722764  ! 313: UDIV_I	udiv 	%r8, 0x0764, %r18
	.word 0x3e800001  ! 319: BVC	bvc,a	<label_0x1>
	.word 0x98720009  ! 319: UDIV_R	udiv 	%r8, %r9, %r12
	.word 0xc7220009  ! 323: STF_R	st	%f3, [%r9, %r8]
	.word 0xf4420009  ! 323: LDSW_R	ldsw	[%r8 + %r9], %r26
	.word 0xaefa0009  ! 323: SDIVcc_R	sdivcc 	%r8, %r9, %r23
	.word 0x86fa2870  ! 323: SDIVcc_I	sdivcc 	%r8, 0x0870, %r3
	.word 0x892a2001  ! 325: SLL_I	sll 	%r8, 0x0001, %r4
	.word 0x8d2a0009  ! 325: SLL_R	sll 	%r8, %r9, %r6
	.word 0x95322001  ! 325: SRL_I	srl 	%r8, 0x0001, %r10
	.word 0x8a120009  ! 325: OR_R	or 	%r8, %r9, %r5
	.word 0x8d3a3001  ! 325: SRAX_I	srax	%r8, 0x0001, %r6
	.word 0x8e12297c  ! 325: OR_I	or 	%r8, 0x097c, %r7
	.word 0x9f3a0009  ! 325: SRA_R	sra 	%r8, %r9, %r15
	.word 0x83780409  ! 325: MOVR_R	move	%r0, %r9, %r1
	.word 0x8a122cf0  ! 325: OR_I	or 	%r8, 0x0cf0, %r5
	.word 0x99322001  ! 325: SRL_I	srl 	%r8, 0x0001, %r12
	.word 0x88220009  ! 325: SUB_R	sub 	%r8, %r9, %r4
	.word 0x982227d4  ! 325: SUB_I	sub 	%r8, 0x07d4, %r12
	.word 0xbab20009  ! 327: SUBCcc_R	orncc 	%r8, %r9, %r29
	.word 0xae322320  ! 327: SUBC_I	orn 	%r8, 0x0320, %r23
	.word 0x88c22084  ! 327: ADDCcc_I	addccc 	%r8, 0x0084, %r4
	.word 0x8a1a0009  ! 327: XOR_R	xor 	%r8, %r9, %r5
	.word 0x9eba0009  ! 327: XNORcc_R	xnorcc 	%r8, %r9, %r15
	.word 0x82420009  ! 327: ADDC_R	addc 	%r8, %r9, %r1
	.word 0x8a9a2e70  ! 327: XORcc_I	xorcc 	%r8, 0x0e70, %r5
	.word 0xa2a2220c  ! 327: SUBcc_I	subcc 	%r8, 0x020c, %r17
	.word 0x8f3a0009  ! 327: SRA_R	sra 	%r8, %r9, %r7
	.word 0x96920009  ! 327: ORcc_R	orcc 	%r8, %r9, %r11
	.word 0xbcba0009  ! 327: XNORcc_R	xnorcc 	%r8, %r9, %r30
	.word 0x882a0009  ! 327: ANDN_R	andn 	%r8, %r9, %r4
	.word 0x40000001  ! 331: CALL	call	disp30_1
	.word 0x86fa2064  ! 331: SDIVcc_I	sdivcc 	%r8, 0x0064, %r3
	.word 0x02c20001  ! 334: BRZ	brz  ,nt	%8,<label_0x20001>
	.word 0xb96a2f14  ! 334: SDIVX_I	sdivx	%r8, 0x0f14, %r28
	.word 0xad780409  ! 335: MOVR_R	move	%r0, %r9, %r22
	.word 0x8a4228ec  ! 335: ADDC_I	addc 	%r8, 0x08ec, %r5
	.word 0xb5643801  ! 335: MOVcc_I	<illegal instruction>
	.word 0x8a322cfc  ! 335: ORN_I	orn 	%r8, 0x0cfc, %r5
	.word 0x872a3001  ! 335: SLLX_I	sllx	%r8, 0x0001, %r3
	.word 0x82822f40  ! 335: ADDcc_I	addcc 	%r8, 0x0f40, %r1
	.word 0x86b20009  ! 335: SUBCcc_R	orncc 	%r8, %r9, %r3
	.word 0x84322a18  ! 335: SUBC_I	orn 	%r8, 0x0a18, %r2
	.word 0x88aa2e7c  ! 335: ANDNcc_I	andncc 	%r8, 0x0e7c, %r4
	.word 0xb4c20009  ! 335: ADDCcc_R	addccc 	%r8, %r9, %r26
	.word 0x26800001  ! 337: BL	bl,a	<label_0x1>
	.word 0x827a0009  ! 337: SDIV_R	sdiv 	%r8, %r9, %r1
	.word 0xce220009  ! 341: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc40a0009  ! 341: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0x84fa0009  ! 341: SDIVcc_R	sdivcc 	%r8, %r9, %r2
	.word 0x846a261c  ! 341: UDIVX_I	udivx 	%r8, 0x061c, %r2
	.word 0x1e800001  ! 346: BVC	bvc  	<label_0x1>
	.word 0x86fa2e5c  ! 346: SDIVcc_I	sdivcc 	%r8, 0x0e5c, %r3
	.word 0x86820009  ! 347: ADDcc_R	addcc 	%r8, %r9, %r3
	.word 0x8caa0009  ! 347: ANDNcc_R	andncc 	%r8, %r9, %r6
	.word 0x883226cc  ! 347: SUBC_I	orn 	%r8, 0x06cc, %r4
	.word 0x84aa0009  ! 347: ANDNcc_R	andncc 	%r8, %r9, %r2
	.word 0xbc822c38  ! 347: ADDcc_I	addcc 	%r8, 0x0c38, %r30
	.word 0xbf782401  ! 347: MOVR_I	move	%r0, 0xc38, %r31
	.word 0x8eb20009  ! 347: SUBCcc_R	orncc 	%r8, %r9, %r7
	.word 0x881a0009  ! 347: XOR_R	xor 	%r8, %r9, %r4
	.word 0x87643801  ! 347: MOVcc_I	<illegal instruction>
	.word 0x88b20009  ! 347: ORNcc_R	orncc 	%r8, %r9, %r4
	.word 0x8ac20009  ! 347: ADDCcc_R	addccc 	%r8, %r9, %r5
	.word 0xb2c22594  ! 347: ADDCcc_I	addccc 	%r8, 0x0594, %r25
	.word 0x06c20001  ! 350: BRLZ	brlz  ,nt	%8,<label_0x20001>
	.word 0x886a21c0  ! 350: UDIVX_I	udivx 	%r8, 0x01c0, %r4
	.word 0xbaba2c14  ! 357: XNORcc_I	xnorcc 	%r8, 0x0c14, %r29
	.word 0x8d320009  ! 357: SRL_R	srl 	%r8, %r9, %r6
	.word 0xae420009  ! 357: ADDC_R	addc 	%r8, %r9, %r23
	.word 0x96920009  ! 357: ORcc_R	orcc 	%r8, %r9, %r11
	.word 0x84820009  ! 357: ADDcc_R	addcc 	%r8, %r9, %r2
	.word 0x88122c30  ! 357: OR_I	or 	%r8, 0x0c30, %r4
	.word 0x880227f0  ! 357: ADD_I	add 	%r8, 0x07f0, %r4
	.word 0x82ba0009  ! 357: XNORcc_R	xnorcc 	%r8, %r9, %r1
	.word 0xa2b22fb8  ! 357: ORNcc_I	orncc 	%r8, 0x0fb8, %r17
	.word 0x868a2a9c  ! 357: ANDcc_I	andcc 	%r8, 0x0a9c, %r3
	.word 0xbd3a2001  ! 357: SRA_I	sra 	%r8, 0x0001, %r30
	.word 0xb8420009  ! 357: ADDC_R	addc 	%r8, %r9, %r28
	.word 0x88420009  ! 357: ADDC_R	addc 	%r8, %r9, %r4
	.word 0x983a2210  ! 357: XNOR_I	xnor 	%r8, 0x0210, %r12
	.word 0xf73a0009  ! 362: STDF_R	std	%f27, [%r9, %r8]
	.word 0xcf020009  ! 362: LDF_R	ld	[%r8, %r9], %f7
	.word 0xac6a20b0  ! 362: UDIVX_I	udivx 	%r8, 0x00b0, %r22
	.word 0x886a0009  ! 362: UDIVX_R	udivx 	%r8, %r9, %r4
	.word 0xbc422bf4  ! 363: ADDC_I	addc 	%r8, 0x0bf4, %r30
	.word 0xac0a2d0c  ! 363: AND_I	and 	%r8, 0x0d0c, %r22
	.word 0xbe220009  ! 363: SUB_R	sub 	%r8, %r9, %r31
	.word 0xa6920009  ! 363: ORcc_R	orcc 	%r8, %r9, %r19
	.word 0x8eb20009  ! 363: ORNcc_R	orncc 	%r8, %r9, %r7
	.word 0x8a020009  ! 363: ADD_R	add 	%r8, %r9, %r5
	.word 0x85321009  ! 363: SRLX_R	srlx	%r8, %r9, %r2
	.word 0x869a251c  ! 363: XORcc_I	xorcc 	%r8, 0x051c, %r3
	.word 0xb8b223a4  ! 363: ORNcc_I	orncc 	%r8, 0x03a4, %r28
	.word 0x82120009  ! 363: OR_R	or 	%r8, %r9, %r1
	.word 0x84322da0  ! 363: SUBC_I	orn 	%r8, 0x0da0, %r2
	.word 0x00800001  ! 366: BN	bn  	<label_0x1>
	.word 0x86720009  ! 366: UDIV_R	udiv 	%r8, %r9, %r3
	.word 0x8b2a1009  ! 368: SLLX_R	sllx	%r8, %r9, %r5
	.word 0x88b20009  ! 368: SUBCcc_R	orncc 	%r8, %r9, %r4
	.word 0x823a2ffc  ! 368: XNOR_I	xnor 	%r8, 0x0ffc, %r1
	.word 0x881a20a0  ! 368: XOR_I	xor 	%r8, 0x00a0, %r4
	.word 0xa5641809  ! 368: MOVcc_R	<illegal instruction>
	.word 0x86322e70  ! 368: ORN_I	orn 	%r8, 0x0e70, %r3
	.word 0x892a0009  ! 368: SLL_R	sll 	%r8, %r9, %r4
	.word 0x88aa0009  ! 368: ANDNcc_R	andncc 	%r8, %r9, %r4
	.word 0x8eaa0009  ! 368: ANDNcc_R	andncc 	%r8, %r9, %r7
	.word 0x85322001  ! 368: SRL_I	srl 	%r8, 0x0001, %r2
	.word 0x86b226c4  ! 368: ORNcc_I	orncc 	%r8, 0x06c4, %r3
	.word 0xe6220009  ! 375: STW_R	stw	%r19, [%r8 + %r9]
	.word 0xca120009  ! 375: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xfa020009  ! 375: LDUW_R	lduw	[%r8 + %r9], %r29
	.word 0x8cf20009  ! 375: UDIVcc_R	udivcc 	%r8, %r9, %r6
	.word 0x8e322bc4  ! 376: SUBC_I	orn 	%r8, 0x0bc4, %r7
	.word 0x8b2a0009  ! 376: SLL_R	sll 	%r8, %r9, %r5
	.word 0xbd780409  ! 376: MOVR_R	move	%r0, %r9, %r30
	.word 0xaf780409  ! 376: MOVR_R	move	%r0, %r9, %r23
	.word 0x83643801  ! 376: MOVcc_I	<illegal instruction>
	.word 0x86320009  ! 376: ORN_R	orn 	%r8, %r9, %r3
	.word 0x861a0009  ! 376: XOR_R	xor 	%r8, %r9, %r3
	.word 0x8c8a2698  ! 376: ANDcc_I	andcc 	%r8, 0x0698, %r6
	.word 0x853a2001  ! 376: SRA_I	sra 	%r8, 0x0001, %r2
	.word 0x87643801  ! 376: MOVcc_I	<illegal instruction>
	.word 0x8a8a2c00  ! 376: ANDcc_I	andcc 	%r8, 0x0c00, %r5
	.word 0x96320009  ! 376: ORN_R	orn 	%r8, %r9, %r11
	.word 0x84c20009  ! 376: ADDCcc_R	addccc 	%r8, %r9, %r2
	.word 0x14800001  ! 378: BG	bg  	<label_0x1>
	.word 0xa76a2828  ! 378: SDIVX_I	sdivx	%r8, 0x0828, %r19
	.word 0xb0022090  ! 379: ADD_I	add 	%r8, 0x0090, %r24
	.word 0x969a24a0  ! 379: XORcc_I	xorcc 	%r8, 0x04a0, %r11
	.word 0x88ba0009  ! 379: XNORcc_R	xnorcc 	%r8, %r9, %r4
	.word 0x8e02291c  ! 379: ADD_I	add 	%r8, 0x091c, %r7
	.word 0xac9a2a64  ! 379: XORcc_I	xorcc 	%r8, 0x0a64, %r22
	.word 0x8f322001  ! 379: SRL_I	srl 	%r8, 0x0001, %r7
	.word 0x8c820009  ! 379: ADDcc_R	addcc 	%r8, %r9, %r6
	.word 0x8692274c  ! 379: ORcc_I	orcc 	%r8, 0x074c, %r3
	.word 0x84b20009  ! 379: ORNcc_R	orncc 	%r8, %r9, %r2
	.word 0x8d3a3001  ! 379: SRAX_I	srax	%r8, 0x0001, %r6
	.word 0x84820009  ! 379: ADDcc_R	addcc 	%r8, %r9, %r2
	.word 0x8c9a23e8  ! 379: XORcc_I	xorcc 	%r8, 0x03e8, %r6
	.word 0x96920009  ! 379: ORcc_R	orcc 	%r8, %r9, %r11
	.word 0x8b3a2001  ! 379: SRA_I	sra 	%r8, 0x0001, %r5
	.word 0x16800001  ! 384: BGE	bge  	<label_0x1>
	.word 0x82720009  ! 384: UDIV_R	udiv 	%r8, %r9, %r1
	.word 0xfd220009  ! 388: STF_R	st	%f30, [%r9, %r8]
	.word 0xc44a0009  ! 388: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0x867a2db0  ! 388: SDIV_I	sdiv 	%r8, 0x0db0, %r3
	.word 0x866a2660  ! 388: UDIVX_I	udivx 	%r8, 0x0660, %r3
	.word 0x0e800001  ! 391: BVS	bvs  	<label_0x1>
	.word 0x887a26ac  ! 391: SDIV_I	sdiv 	%r8, 0x06ac, %r4
	.word 0x892a2001  ! 398: SLL_I	sll 	%r8, 0x0001, %r4
	.word 0xbe0a2780  ! 398: AND_I	and 	%r8, 0x0780, %r31
	.word 0x9c120009  ! 398: OR_R	or 	%r8, %r9, %r14
	.word 0x88420009  ! 398: ADDC_R	addc 	%r8, %r9, %r4
	.word 0x823a2d20  ! 398: XNOR_I	xnor 	%r8, 0x0d20, %r1
	.word 0x893a3001  ! 398: SRAX_I	srax	%r8, 0x0001, %r4
	.word 0xab3a3001  ! 398: SRAX_I	srax	%r8, 0x0001, %r21
	.word 0x8a0a2d0c  ! 398: AND_I	and 	%r8, 0x0d0c, %r5
	.word 0x82b22968  ! 398: ORNcc_I	orncc 	%r8, 0x0968, %r1
	.word 0x8a820009  ! 398: ADDcc_R	addcc 	%r8, %r9, %r5
	.word 0x84c20009  ! 398: ADDCcc_R	addccc 	%r8, %r9, %r2
	.word 0x8f780409  ! 398: MOVR_R	move	%r0, %r9, %r7
	.word 0x953a3001  ! 399: SRAX_I	srax	%r8, 0x0001, %r10
	.word 0x9b321009  ! 399: SRLX_R	srlx	%r8, %r9, %r13
	.word 0x8a0a0009  ! 399: AND_R	and 	%r8, %r9, %r5
	.word 0x868a2ee0  ! 399: ANDcc_I	andcc 	%r8, 0x0ee0, %r3
	.word 0x861a2c00  ! 399: XOR_I	xor 	%r8, 0x0c00, %r3
	.word 0x8d320009  ! 399: SRL_R	srl 	%r8, %r9, %r6
	.word 0x840a2b20  ! 399: AND_I	and 	%r8, 0x0b20, %r2
	.word 0x87321009  ! 399: SRLX_R	srlx	%r8, %r9, %r3
	.word 0x96320009  ! 399: ORN_R	orn 	%r8, %r9, %r11
	.word 0x8e9a0009  ! 399: XORcc_R	xorcc 	%r8, %r9, %r7
	.word 0x8f3a2001  ! 399: SRA_I	sra 	%r8, 0x0001, %r7
	.word 0x88ba0009  ! 399: XNORcc_R	xnorcc 	%r8, %r9, %r4
	.word 0x86ba0009  ! 399: XNORcc_R	xnorcc 	%r8, %r9, %r3
	.word 0x8a120009  ! 402: OR_R	or 	%r8, %r9, %r5
	.word 0x8e8a290c  ! 402: ANDcc_I	andcc 	%r8, 0x090c, %r7
	.word 0x8a120009  ! 402: OR_R	or 	%r8, %r9, %r5
	.word 0x88822900  ! 402: ADDcc_I	addcc 	%r8, 0x0900, %r4
	.word 0x980a0009  ! 402: AND_R	and 	%r8, %r9, %r12
	.word 0x888a0009  ! 402: ANDcc_R	andcc 	%r8, %r9, %r4
	.word 0x8c2a22bc  ! 402: ANDN_I	andn 	%r8, 0x02bc, %r6
	.word 0x943a2c78  ! 402: XNOR_I	xnor 	%r8, 0x0c78, %r10
	.word 0x8c12253c  ! 402: OR_I	or 	%r8, 0x053c, %r6
	.word 0x8c8226c0  ! 402: ADDcc_I	addcc 	%r8, 0x06c0, %r6
	.word 0xea720009  ! 406: STX_R	stx	%r21, [%r8 + %r9]
	.word 0xcb1a0009  ! 406: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0x9a7a2f68  ! 406: SDIV_I	sdiv 	%r8, 0x0f68, %r13
	.word 0xaf6a2e28  ! 406: SDIVX_I	sdivx	%r8, 0x0e28, %r23
	.word 0xc33a0009  ! 410: STDF_R	std	%f1, [%r9, %r8]
	.word 0xcf1a0009  ! 410: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xe85a2d18  ! 410: LDX_I	ldx	[%r8 + 0x0d18], %r20
	.word 0x8afa26c0  ! 410: SDIVcc_I	sdivcc 	%r8, 0x06c0, %r5
	.word 0x888a2be8  ! 411: ANDcc_I	andcc 	%r8, 0x0be8, %r4
	.word 0x86022204  ! 411: ADD_I	add 	%r8, 0x0204, %r3
	.word 0xb4020009  ! 411: ADD_R	add 	%r8, %r9, %r26
	.word 0x8a120009  ! 411: OR_R	or 	%r8, %r9, %r5
	.word 0x8e8a0009  ! 411: ANDcc_R	andcc 	%r8, %r9, %r7
	.word 0x8cb20009  ! 411: ORNcc_R	orncc 	%r8, %r9, %r6
	.word 0x9c2a0009  ! 411: ANDN_R	andn 	%r8, %r9, %r14
	.word 0x852a0009  ! 411: SLL_R	sll 	%r8, %r9, %r2
	.word 0x8c222970  ! 411: SUB_I	sub 	%r8, 0x0970, %r6
	.word 0xb8120009  ! 411: OR_R	or 	%r8, %r9, %r28
	.word 0xa6b20009  ! 411: ORNcc_R	orncc 	%r8, %r9, %r19
	.word 0xab2a2001  ! 411: SLL_I	sll 	%r8, 0x0001, %r21
	.word 0xd93a0009  ! 415: STDF_R	std	%f12, [%r9, %r8]
	.word 0xc60a0009  ! 415: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0x82720009  ! 415: UDIV_R	udiv 	%r8, %r9, %r1
	.word 0x946a0009  ! 415: UDIVX_R	udivx 	%r8, %r9, %r10
	.word 0x86ba0009  ! 416: XNORcc_R	xnorcc 	%r8, %r9, %r3
	.word 0x883222c4  ! 416: SUBC_I	orn 	%r8, 0x02c4, %r4
	.word 0xac1a28c0  ! 416: XOR_I	xor 	%r8, 0x08c0, %r22
	.word 0xb33a2001  ! 416: SRA_I	sra 	%r8, 0x0001, %r25
	.word 0x89643801  ! 416: MOVcc_I	<illegal instruction>
	.word 0xb9323001  ! 416: SRLX_I	srlx	%r8, 0x0001, %r28
	.word 0x9a220009  ! 416: SUB_R	sub 	%r8, %r9, %r13
	.word 0x8ca22e68  ! 416: SUBcc_I	subcc 	%r8, 0x0e68, %r6
	.word 0x85322001  ! 416: SRL_I	srl 	%r8, 0x0001, %r2
	.word 0x8d322001  ! 416: SRL_I	srl 	%r8, 0x0001, %r6
	.word 0xc6320009  ! 420: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xdf020009  ! 420: LDF_R	ld	[%r8, %r9], %f15
	.word 0xc24a24f0  ! 420: LDSB_I	ldsb	[%r8 + 0x04f0], %r1
	.word 0xb4722da0  ! 420: UDIV_I	udiv 	%r8, 0x0da0, %r26
	.word 0x888a0009  ! 421: ANDcc_R	andcc 	%r8, %r9, %r4
	.word 0x841a0009  ! 421: XOR_R	xor 	%r8, %r9, %r2
	.word 0xb232221c  ! 421: SUBC_I	orn 	%r8, 0x021c, %r25
	.word 0x82ba0009  ! 421: XNORcc_R	xnorcc 	%r8, %r9, %r1
	.word 0x8a820009  ! 421: ADDcc_R	addcc 	%r8, %r9, %r5
	.word 0x87643801  ! 421: MOVcc_I	<illegal instruction>
	.word 0xae2a2794  ! 421: ANDN_I	andn 	%r8, 0x0794, %r23
	.word 0xb3321009  ! 421: SRLX_R	srlx	%r8, %r9, %r25
	.word 0x881a279c  ! 421: XOR_I	xor 	%r8, 0x079c, %r4
	.word 0x8f3a3001  ! 421: SRAX_I	srax	%r8, 0x0001, %r7
	.word 0x8c122e64  ! 421: OR_I	or 	%r8, 0x0e64, %r6
	.word 0x40000002  ! 423: CALL	call	disp30_2
	.word 0x8ef22e40  ! 423: UDIVcc_I	udivcc 	%r8, 0x0e40, %r7
	.word 0xd93a0009  ! 427: STDF_R	std	%f12, [%r9, %r8]
	.word 0xc60a0009  ! 427: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xcc5a2288  ! 427: LDX_I	ldx	[%r8 + 0x0288], %r6
	.word 0xb2fa22ec  ! 427: SDIVcc_I	sdivcc 	%r8, 0x02ec, %r25
	.word 0xbc9a2d58  ! 429: XORcc_I	xorcc 	%r8, 0x0d58, %r30
	.word 0x89321009  ! 429: SRLX_R	srlx	%r8, %r9, %r4
	.word 0x98a20009  ! 429: SUBcc_R	subcc 	%r8, %r9, %r12
	.word 0x9c2a2304  ! 429: ANDN_I	andn 	%r8, 0x0304, %r14
	.word 0x8f3a1009  ! 429: SRAX_R	srax	%r8, %r9, %r7
	.word 0xbd321009  ! 429: SRLX_R	srlx	%r8, %r9, %r30
	.word 0x8e1a29a4  ! 429: XOR_I	xor 	%r8, 0x09a4, %r7
	.word 0x83323001  ! 429: SRLX_I	srlx	%r8, 0x0001, %r1
	.word 0x97322001  ! 429: SRL_I	srl 	%r8, 0x0001, %r11
	.word 0x8c3225d4  ! 429: ORN_I	orn 	%r8, 0x05d4, %r6
	.word 0x82220009  ! 429: SUB_R	sub 	%r8, %r9, %r1
	.word 0xa4420009  ! 429: ADDC_R	addc 	%r8, %r9, %r18
	.word 0x822a0009  ! 429: ANDN_R	andn 	%r8, %r9, %r1
	.word 0x882223d4  ! 429: SUB_I	sub 	%r8, 0x03d4, %r4
	.word 0x8ac20009  ! 437: ADDCcc_R	addccc 	%r8, %r9, %r5
	.word 0x8c1a269c  ! 437: XOR_I	xor 	%r8, 0x069c, %r6
	.word 0x8d3a1009  ! 437: SRAX_R	srax	%r8, %r9, %r6
	.word 0xbc120009  ! 437: OR_R	or 	%r8, %r9, %r30
	.word 0xa42a0009  ! 437: ANDN_R	andn 	%r8, %r9, %r18
	.word 0xa6820009  ! 437: ADDcc_R	addcc 	%r8, %r9, %r19
	.word 0x8f2a1009  ! 437: SLLX_R	sllx	%r8, %r9, %r7
	.word 0x89323001  ! 437: SRLX_I	srlx	%r8, 0x0001, %r4
	.word 0x860a0009  ! 437: AND_R	and 	%r8, %r9, %r3
	.word 0x86820009  ! 437: ADDcc_R	addcc 	%r8, %r9, %r3
	.word 0x8ab22a2c  ! 437: ORNcc_I	orncc 	%r8, 0x0a2c, %r5
	.word 0x20800001  ! 440: BN	bn,a	<label_0x1>
	.word 0xb26a0009  ! 440: UDIVX_R	udivx 	%r8, %r9, %r25
	.word 0x882a2c0c  ! 444: ANDN_I	andn 	%r8, 0x0c0c, %r4
	.word 0x8eaa299c  ! 444: ANDNcc_I	andncc 	%r8, 0x099c, %r7
	.word 0x82b22200  ! 444: ORNcc_I	orncc 	%r8, 0x0200, %r1
	.word 0x892a0009  ! 444: SLL_R	sll 	%r8, %r9, %r4
	.word 0x8e0a2b4c  ! 444: AND_I	and 	%r8, 0x0b4c, %r7
	.word 0x8d2a1009  ! 444: SLLX_R	sllx	%r8, %r9, %r6
	.word 0x84020009  ! 444: ADD_R	add 	%r8, %r9, %r2
	.word 0x8c320009  ! 444: ORN_R	orn 	%r8, %r9, %r6
	.word 0x8f321009  ! 444: SRLX_R	srlx	%r8, %r9, %r7
	.word 0x8cc20009  ! 444: ADDCcc_R	addccc 	%r8, %r9, %r6
	.word 0x84320009  ! 444: SUBC_R	orn 	%r8, %r9, %r2
	.word 0xa1321009  ! 444: SRLX_R	srlx	%r8, %r9, %r16
	.word 0xbc322c58  ! 444: ORN_I	orn 	%r8, 0x0c58, %r30
	.word 0x82320009  ! 444: SUBC_R	orn 	%r8, %r9, %r1
	.word 0x82ba0009  ! 445: XNORcc_R	xnorcc 	%r8, %r9, %r1
	.word 0x869a0009  ! 445: XORcc_R	xorcc 	%r8, %r9, %r3
	.word 0x86b20009  ! 445: SUBCcc_R	orncc 	%r8, %r9, %r3
	.word 0x8b641809  ! 445: MOVcc_R	<illegal instruction>
	.word 0x8ab20009  ! 445: SUBCcc_R	orncc 	%r8, %r9, %r5
	.word 0xacb22a70  ! 445: ORNcc_I	orncc 	%r8, 0x0a70, %r22
	.word 0x98220009  ! 445: SUB_R	sub 	%r8, %r9, %r12
	.word 0x8e0223ac  ! 445: ADD_I	add 	%r8, 0x03ac, %r7
	.word 0x868a2338  ! 445: ANDcc_I	andcc 	%r8, 0x0338, %r3
	.word 0xaeba0009  ! 445: XNORcc_R	xnorcc 	%r8, %r9, %r23
	.word 0x9c3a0009  ! 445: XNOR_R	xnor 	%r8, %r9, %r14
	.word 0x88020009  ! 445: ADD_R	add 	%r8, %r9, %r4
	.word 0x0e800001  ! 447: BVS	bvs  	<label_0x1>
	.word 0x86720009  ! 447: UDIV_R	udiv 	%r8, %r9, %r3
	.word 0x24c20001  ! 450: BRLEZ	brlez,a,nt	%8,<label_0x20001>
	.word 0x886a0009  ! 450: UDIVX_R	udivx 	%r8, %r9, %r4
	.word 0x843a0009  ! 452: XNOR_R	xnor 	%r8, %r9, %r2
	.word 0x82120009  ! 452: OR_R	or 	%r8, %r9, %r1
	.word 0x9b782401  ! 452: MOVR_I	move	%r0, 0x9, %r13
	.word 0x828a0009  ! 452: ANDcc_R	andcc 	%r8, %r9, %r1
	.word 0xaa2a2e94  ! 452: ANDN_I	andn 	%r8, 0x0e94, %r21
	.word 0x8a8a29b8  ! 452: ANDcc_I	andcc 	%r8, 0x09b8, %r5
	.word 0x83321009  ! 452: SRLX_R	srlx	%r8, %r9, %r1
	.word 0x84aa2ebc  ! 452: ANDNcc_I	andncc 	%r8, 0x0ebc, %r2
	.word 0x8a320009  ! 452: ORN_R	orn 	%r8, %r9, %r5
	.word 0x8c120009  ! 452: OR_R	or 	%r8, %r9, %r6
	.word 0x822a2ca8  ! 452: ANDN_I	andn 	%r8, 0x0ca8, %r1
	.word 0x9c4220dc  ! 452: ADDC_I	addc 	%r8, 0x00dc, %r14
	.word 0x9d321009  ! 452: SRLX_R	srlx	%r8, %r9, %r14
	.word 0x8a02292c  ! 452: ADD_I	add 	%r8, 0x092c, %r5
	.word 0xba2a29e0  ! 452: ANDN_I	andn 	%r8, 0x09e0, %r29
	.word 0x12800001  ! 454: BNE	bne  	<label_0x1>
	.word 0x887a2b74  ! 454: SDIV_I	sdiv 	%r8, 0x0b74, %r4
	.word 0xa8022168  ! 455: ADD_I	add 	%r8, 0x0168, %r20
	.word 0x8cb20009  ! 455: SUBCcc_R	orncc 	%r8, %r9, %r6
	.word 0xaa1a0009  ! 455: XOR_R	xor 	%r8, %r9, %r21
	.word 0x84220009  ! 455: SUB_R	sub 	%r8, %r9, %r2
	.word 0x8e02285c  ! 455: ADD_I	add 	%r8, 0x085c, %r7
	.word 0xb8aa0009  ! 455: ANDNcc_R	andncc 	%r8, %r9, %r28
	.word 0x861a2ab0  ! 455: XOR_I	xor 	%r8, 0x0ab0, %r3
	.word 0x8ca20009  ! 455: SUBcc_R	subcc 	%r8, %r9, %r6
	.word 0x8a322e30  ! 455: ORN_I	orn 	%r8, 0x0e30, %r5
	.word 0x88c20009  ! 455: ADDCcc_R	addccc 	%r8, %r9, %r4
	.word 0x8eb22edc  ! 458: SUBCcc_I	orncc 	%r8, 0x0edc, %r7
	.word 0x8f3a0009  ! 458: SRA_R	sra 	%r8, %r9, %r7
	.word 0x9c2a2d9c  ! 458: ANDN_I	andn 	%r8, 0x0d9c, %r14
	.word 0x8b2a1009  ! 458: SLLX_R	sllx	%r8, %r9, %r5
	.word 0x848a0009  ! 458: ANDcc_R	andcc 	%r8, %r9, %r2
	.word 0x8c320009  ! 458: SUBC_R	orn 	%r8, %r9, %r6
	.word 0x86a20009  ! 458: SUBcc_R	subcc 	%r8, %r9, %r3
	.word 0x832a1009  ! 458: SLLX_R	sllx	%r8, %r9, %r1
	.word 0x8ab20009  ! 458: SUBCcc_R	orncc 	%r8, %r9, %r5
	.word 0x84a22058  ! 458: SUBcc_I	subcc 	%r8, 0x0058, %r2
	.word 0x8a320009  ! 458: ORN_R	orn 	%r8, %r9, %r5
	.word 0x883a0009  ! 458: XNOR_R	xnor 	%r8, %r9, %r4
	.word 0x82b20009  ! 458: SUBCcc_R	orncc 	%r8, %r9, %r1
	.word 0x88b20009  ! 458: SUBCcc_R	orncc 	%r8, %r9, %r4
	.word 0x83643801  ! 460: MOVcc_I	<illegal instruction>
	.word 0x868a0009  ! 460: ANDcc_R	andcc 	%r8, %r9, %r3
	.word 0xb63a2d28  ! 460: XNOR_I	xnor 	%r8, 0x0d28, %r27
	.word 0x8d641809  ! 460: MOVcc_R	<illegal instruction>
	.word 0x8e320009  ! 460: SUBC_R	orn 	%r8, %r9, %r7
	.word 0x87780409  ! 460: MOVR_R	move	%r0, %r9, %r3
	.word 0x8c822788  ! 460: ADDcc_I	addcc 	%r8, 0x0788, %r6
	.word 0xa61a2ce8  ! 460: XOR_I	xor 	%r8, 0x0ce8, %r19
	.word 0x8c020009  ! 460: ADD_R	add 	%r8, %r9, %r6
	.word 0xba020009  ! 460: ADD_R	add 	%r8, %r9, %r29
	.word 0x972a0009  ! 460: SLL_R	sll 	%r8, %r9, %r11
	.word 0xba8a2bc8  ! 460: ANDcc_I	andcc 	%r8, 0x0bc8, %r29
	.word 0xd42a0009  ! 469: STB_R	stb	%r10, [%r8 + %r9]
	.word 0xe60a0009  ! 469: LDUB_R	ldub	[%r8 + %r9], %r19
	.word 0x96b22510  ! 469: SUBCcc_I	orncc 	%r8, 0x0510, %r11
	.word 0x86722d70  ! 469: UDIV_I	udiv 	%r8, 0x0d70, %r3
	.word 0xce2a0009  ! 475: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc31a0009  ! 475: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xc8420009  ! 475: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0x8efa288c  ! 475: SDIVcc_I	sdivcc 	%r8, 0x088c, %r7
	.word 0x34800002  ! 478: BG	bg,a	<label_0x2>
	.word 0xb0fa2a88  ! 478: SDIVcc_I	sdivcc 	%r8, 0x0a88, %r24
	.word 0x3a800001  ! 481: BCC	bcc,a	<label_0x1>
	.word 0x88f22678  ! 481: UDIVcc_I	udivcc 	%r8, 0x0678, %r4
	.word 0x86820009  ! 484: ADDcc_R	addcc 	%r8, %r9, %r3
	.word 0x85322001  ! 484: SRL_I	srl 	%r8, 0x0001, %r2
	.word 0xa43a2424  ! 484: XNOR_I	xnor 	%r8, 0x0424, %r18
	.word 0x86aa2e08  ! 484: ANDNcc_I	andncc 	%r8, 0x0e08, %r3
	.word 0x8a1a29a8  ! 484: XOR_I	xor 	%r8, 0x09a8, %r5
	.word 0x9a9a2c10  ! 484: XORcc_I	xorcc 	%r8, 0x0c10, %r13
	.word 0x873a3001  ! 484: SRAX_I	srax	%r8, 0x0001, %r3
	.word 0x82222fc4  ! 484: SUB_I	sub 	%r8, 0x0fc4, %r1
	.word 0x963a28ec  ! 484: XNOR_I	xnor 	%r8, 0x08ec, %r11
	.word 0x872a2001  ! 484: SLL_I	sll 	%r8, 0x0001, %r3
	.word 0xb4122678  ! 484: OR_I	or 	%r8, 0x0678, %r26
	.word 0x848a0009  ! 484: ANDcc_R	andcc 	%r8, %r9, %r2
	.word 0x823222b0  ! 484: ORN_I	orn 	%r8, 0x02b0, %r1
	.word 0x0ac20001  ! 487: BRNZ	brnz  ,nt	%8,<label_0x20001>
	.word 0x86fa265c  ! 487: SDIVcc_I	sdivcc 	%r8, 0x065c, %r3
	.word 0xca2a0009  ! 493: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xec1a0009  ! 493: LDD_R	ldd	[%r8 + %r9], %r22
	.word 0xc842290c  ! 493: LDSW_I	ldsw	[%r8 + 0x090c], %r4
	.word 0x8c7a21c0  ! 493: SDIV_I	sdiv 	%r8, 0x01c0, %r6
	.word 0xca2a0009  ! 499: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xde420009  ! 499: LDSW_R	ldsw	[%r8 + %r9], %r15
	.word 0x8d780409  ! 499: MOVR_R	move	%r0, %r9, %r6
	.word 0xb07220ac  ! 499: UDIV_I	udiv 	%r8, 0x00ac, %r24
	.word 0xc9220009  ! 507: STF_R	st	%f4, [%r9, %r8]
	.word 0xca0a0009  ! 507: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0x88aa0009  ! 507: ANDNcc_R	andncc 	%r8, %r9, %r4
	.word 0x8a720009  ! 507: UDIV_R	udiv 	%r8, %r9, %r5
	.word 0xc2220009  ! 513: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xf60a0009  ! 513: LDUB_R	ldub	[%r8 + %r9], %r27
	.word 0x856a0009  ! 513: SDIVX_R	sdivx	%r8, %r9, %r2
	.word 0x867a247c  ! 513: SDIV_I	sdiv 	%r8, 0x047c, %r3
	.word 0xc4720009  ! 517: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc6020009  ! 517: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0x8ef221b4  ! 517: UDIVcc_I	udivcc 	%r8, 0x01b4, %r7
	.word 0x8a720009  ! 517: UDIV_R	udiv 	%r8, %r9, %r5
	.word 0x40000001  ! 520: CALL	call	disp30_1
	.word 0xa6720009  ! 520: UDIV_R	udiv 	%r8, %r9, %r19
	.word 0x8c822ee4  ! 521: ADDcc_I	addcc 	%r8, 0x0ee4, %r6
	.word 0xa8a20009  ! 521: SUBcc_R	subcc 	%r8, %r9, %r20
	.word 0x8aa22094  ! 521: SUBcc_I	subcc 	%r8, 0x0094, %r5
	.word 0x840a0009  ! 521: AND_R	and 	%r8, %r9, %r2
	.word 0x82820009  ! 521: ADDcc_R	addcc 	%r8, %r9, %r1
	.word 0x88c22a28  ! 521: ADDCcc_I	addccc 	%r8, 0x0a28, %r4
	.word 0x8ab228e4  ! 521: ORNcc_I	orncc 	%r8, 0x08e4, %r5
	.word 0x89323001  ! 521: SRLX_I	srlx	%r8, 0x0001, %r4
	.word 0xb8122710  ! 521: OR_I	or 	%r8, 0x0710, %r28
	.word 0x86c20009  ! 521: ADDCcc_R	addccc 	%r8, %r9, %r3
	.word 0x86ba0009  ! 521: XNORcc_R	xnorcc 	%r8, %r9, %r3
	.word 0x1e800002  ! 529: BVC	bvc  	<label_0x2>
	.word 0x867a2e18  ! 529: SDIV_I	sdiv 	%r8, 0x0e18, %r3
	.word 0x02800001  ! 531: BE	be  	<label_0x1>
	.word 0x8e6a0009  ! 531: UDIVX_R	udivx 	%r8, %r9, %r7
	.word 0xe2320009  ! 535: STH_R	sth	%r17, [%r8 + %r9]
	.word 0xcb020009  ! 535: LDF_R	ld	[%r8, %r9], %f5
	.word 0x827a21b8  ! 535: SDIV_I	sdiv 	%r8, 0x01b8, %r1
	.word 0x876a0009  ! 535: SDIVX_R	sdivx	%r8, %r9, %r3
	.word 0xc5220009  ! 539: STF_R	st	%f2, [%r9, %r8]
	.word 0xfe4a0009  ! 539: LDSB_R	ldsb	[%r8 + %r9], %r31
	.word 0x86fa273c  ! 539: SDIVcc_I	sdivcc 	%r8, 0x073c, %r3
	.word 0x8e7a0009  ! 539: SDIV_R	sdiv 	%r8, %r9, %r7
	.word 0xc82a0009  ! 543: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc91a0009  ! 543: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xaa720009  ! 543: UDIV_R	udiv 	%r8, %r9, %r21
	.word 0xbafa0009  ! 543: SDIVcc_R	sdivcc 	%r8, %r9, %r29
	.word 0xc3220009  ! 548: STF_R	st	%f1, [%r9, %r8]
	.word 0xe4420009  ! 548: LDSW_R	ldsw	[%r8 + %r9], %r18
	.word 0x8c6a0009  ! 548: UDIVX_R	udivx 	%r8, %r9, %r6
	.word 0xb07a0009  ! 548: SDIV_R	sdiv 	%r8, %r9, %r24
	.word 0x32800001  ! 550: BNE	bne,a	<label_0x1>
	.word 0xac7a290c  ! 550: SDIV_I	sdiv 	%r8, 0x090c, %r22
	.word 0x40000002  ! 554: CALL	call	disp30_2
	.word 0x86fa0009  ! 554: SDIVcc_R	sdivcc 	%r8, %r9, %r3
	.word 0x0c800001  ! 557: BNEG	bneg  	<label_0x1>
	.word 0xa4f22234  ! 557: UDIVcc_I	udivcc 	%r8, 0x0234, %r18
	.word 0xc93a0009  ! 561: STDF_R	std	%f4, [%r9, %r8]
	.word 0xcc0a0009  ! 561: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0x88f2214c  ! 561: UDIVcc_I	udivcc 	%r8, 0x014c, %r4
	.word 0x8afa2f78  ! 561: SDIVcc_I	sdivcc 	%r8, 0x0f78, %r5
	.word 0xb9643801  ! 562: MOVcc_I	<illegal instruction>
	.word 0x880a0009  ! 562: AND_R	and 	%r8, %r9, %r4
	.word 0x9cb20009  ! 562: SUBCcc_R	orncc 	%r8, %r9, %r14
	.word 0x841a0009  ! 562: XOR_R	xor 	%r8, %r9, %r2
	.word 0x8d641809  ! 562: MOVcc_R	<illegal instruction>
	.word 0x82aa25b0  ! 562: ANDNcc_I	andncc 	%r8, 0x05b0, %r1
	.word 0x84020009  ! 562: ADD_R	add 	%r8, %r9, %r2
	.word 0x84c20009  ! 562: ADDCcc_R	addccc 	%r8, %r9, %r2
	.word 0x82420009  ! 562: ADDC_R	addc 	%r8, %r9, %r1
	.word 0xa32a0009  ! 562: SLL_R	sll 	%r8, %r9, %r17
	.word 0x0cca0001  ! 568: BRGZ	brgz  ,pt	%8,<label_0xa0001>
	.word 0xa4720009  ! 568: UDIV_R	udiv 	%r8, %r9, %r18
	.word 0x02800001  ! 572: BE	be  	<label_0x1>
	.word 0xad6a0009  ! 572: SDIVX_R	sdivx	%r8, %r9, %r22
	.word 0x88aa0009  ! 574: ANDNcc_R	andncc 	%r8, %r9, %r4
	.word 0xa29a2618  ! 574: XORcc_I	xorcc 	%r8, 0x0618, %r17
	.word 0xac120009  ! 574: OR_R	or 	%r8, %r9, %r22
	.word 0x9d3a0009  ! 574: SRA_R	sra 	%r8, %r9, %r14
	.word 0x84220009  ! 574: SUB_R	sub 	%r8, %r9, %r2
	.word 0x9cc20009  ! 574: ADDCcc_R	addccc 	%r8, %r9, %r14
	.word 0x88b20009  ! 574: SUBCcc_R	orncc 	%r8, %r9, %r4
	.word 0x872a2001  ! 574: SLL_I	sll 	%r8, 0x0001, %r3
	.word 0x8802213c  ! 574: ADD_I	add 	%r8, 0x013c, %r4
	.word 0x8e0a2188  ! 574: AND_I	and 	%r8, 0x0188, %r7
	.word 0x840a0009  ! 574: AND_R	and 	%r8, %r9, %r2
	.word 0x8e2a2528  ! 574: ANDN_I	andn 	%r8, 0x0528, %r7
	.word 0x89641809  ! 574: MOVcc_R	<illegal instruction>
	.word 0x8e820009  ! 574: ADDcc_R	addcc 	%r8, %r9, %r7
	.word 0xcd220009  ! 578: STF_R	st	%f6, [%r9, %r8]
	.word 0xfd1a0009  ! 578: LDDF_R	ldd	[%r8, %r9], %f30
	.word 0x827a0009  ! 578: SDIV_R	sdiv 	%r8, %r9, %r1
	.word 0x847a261c  ! 578: SDIV_I	sdiv 	%r8, 0x061c, %r2
	.word 0x87643801  ! 582: MOVcc_I	<illegal instruction>
	.word 0x83320009  ! 582: SRL_R	srl 	%r8, %r9, %r1
	.word 0x8c322bbc  ! 582: ORN_I	orn 	%r8, 0x0bbc, %r6
	.word 0x88a2274c  ! 582: SUBcc_I	subcc 	%r8, 0x074c, %r4
	.word 0x86320009  ! 582: SUBC_R	orn 	%r8, %r9, %r3
	.word 0x8a2a0009  ! 582: ANDN_R	andn 	%r8, %r9, %r5
	.word 0x9c8a0009  ! 582: ANDcc_R	andcc 	%r8, %r9, %r14
	.word 0x893a0009  ! 582: SRA_R	sra 	%r8, %r9, %r4
	.word 0x83782401  ! 582: MOVR_I	move	%r0, 0x9, %r1
	.word 0x88820009  ! 582: ADDcc_R	addcc 	%r8, %r9, %r4
	.word 0xaa9a23b4  ! 582: XORcc_I	xorcc 	%r8, 0x03b4, %r21
	.word 0xae32270c  ! 582: SUBC_I	orn 	%r8, 0x070c, %r23
	.word 0x83780409  ! 582: MOVR_R	move	%r0, %r9, %r1
	.word 0x84320009  ! 582: ORN_R	orn 	%r8, %r9, %r2
	.word 0x8a0225a4  ! 582: ADD_I	add 	%r8, 0x05a4, %r5
	.word 0xbc820009  ! 585: ADDcc_R	addcc 	%r8, %r9, %r30
	.word 0x829a2ae8  ! 585: XORcc_I	xorcc 	%r8, 0x0ae8, %r1
	.word 0x8f3a1009  ! 585: SRAX_R	srax	%r8, %r9, %r7
	.word 0x8812240c  ! 585: OR_I	or 	%r8, 0x040c, %r4
	.word 0x84920009  ! 585: ORcc_R	orcc 	%r8, %r9, %r2
	.word 0x8f2a1009  ! 585: SLLX_R	sllx	%r8, %r9, %r7
	.word 0xb4b20009  ! 585: ORNcc_R	orncc 	%r8, %r9, %r26
	.word 0x993a0009  ! 585: SRA_R	sra 	%r8, %r9, %r12
	.word 0x942a0009  ! 585: ANDN_R	andn 	%r8, %r9, %r10
	.word 0xab641809  ! 585: MOVcc_R	<illegal instruction>
	.word 0x9d3a0009  ! 585: SRA_R	sra 	%r8, %r9, %r14
	.word 0xba3a28b4  ! 585: XNOR_I	xnor 	%r8, 0x08b4, %r29
	.word 0x8d2a0009  ! 585: SLL_R	sll 	%r8, %r9, %r6
	.word 0x8e020009  ! 585: ADD_R	add 	%r8, %r9, %r7
	.word 0x8a420009  ! 588: ADDC_R	addc 	%r8, %r9, %r5
	.word 0x9a222440  ! 588: SUB_I	sub 	%r8, 0x0440, %r13
	.word 0x84b20009  ! 588: ORNcc_R	orncc 	%r8, %r9, %r2
	.word 0x82aa0009  ! 588: ANDNcc_R	andncc 	%r8, %r9, %r1
	.word 0x8ab20009  ! 588: SUBCcc_R	orncc 	%r8, %r9, %r5
	.word 0x86920009  ! 588: ORcc_R	orcc 	%r8, %r9, %r3
	.word 0x8eaa244c  ! 588: ANDNcc_I	andncc 	%r8, 0x044c, %r7
	.word 0x8b641809  ! 588: MOVcc_R	<illegal instruction>
	.word 0x84ba2364  ! 588: XNORcc_I	xnorcc 	%r8, 0x0364, %r2
	.word 0xb73a1009  ! 588: SRAX_R	srax	%r8, %r9, %r27
	.word 0xbab20009  ! 588: SUBCcc_R	orncc 	%r8, %r9, %r29
	.word 0x86a22f10  ! 590: SUBcc_I	subcc 	%r8, 0x0f10, %r3
	.word 0x88b20009  ! 590: SUBCcc_R	orncc 	%r8, %r9, %r4
	.word 0x8aa225ac  ! 590: SUBcc_I	subcc 	%r8, 0x05ac, %r5
	.word 0xbd2a1009  ! 590: SLLX_R	sllx	%r8, %r9, %r30
	.word 0x8e2224f0  ! 590: SUB_I	sub 	%r8, 0x04f0, %r7
	.word 0x8cba0009  ! 590: XNORcc_R	xnorcc 	%r8, %r9, %r6
	.word 0xa43a0009  ! 590: XNOR_R	xnor 	%r8, %r9, %r18
	.word 0x86320009  ! 590: ORN_R	orn 	%r8, %r9, %r3
	.word 0x82422928  ! 590: ADDC_I	addc 	%r8, 0x0928, %r1
	.word 0x96b22d68  ! 590: SUBCcc_I	orncc 	%r8, 0x0d68, %r11
	.word 0x8e2a250c  ! 590: ANDN_I	andn 	%r8, 0x050c, %r7
	.word 0x881a2f54  ! 591: XOR_I	xor 	%r8, 0x0f54, %r4
	.word 0xb6122024  ! 591: OR_I	or 	%r8, 0x0024, %r27
	.word 0x860a0009  ! 591: AND_R	and 	%r8, %r9, %r3
	.word 0xb72a3001  ! 591: SLLX_I	sllx	%r8, 0x0001, %r27
	.word 0x86422220  ! 591: ADDC_I	addc 	%r8, 0x0220, %r3
	.word 0xac8a0009  ! 591: ANDcc_R	andcc 	%r8, %r9, %r22
	.word 0x8e1a0009  ! 591: XOR_R	xor 	%r8, %r9, %r7
	.word 0x953a2001  ! 591: SRA_I	sra 	%r8, 0x0001, %r10
	.word 0x85782401  ! 591: MOVR_I	move	%r0, 0x1, %r2
	.word 0x82ba2864  ! 591: XNORcc_I	xnorcc 	%r8, 0x0864, %r1
	.word 0x849223a8  ! 591: ORcc_I	orcc 	%r8, 0x03a8, %r2
	.word 0xf6320009  ! 598: STH_R	sth	%r27, [%r8 + %r9]
	.word 0xf0020009  ! 598: LDUW_R	lduw	[%r8 + %r9], %r24
	.word 0xbeb22e3c  ! 598: SUBCcc_I	orncc 	%r8, 0x0e3c, %r31
	.word 0x856a26ec  ! 598: SDIVX_I	sdivx	%r8, 0x06ec, %r2
	.word 0x8cc22d90  ! 599: ADDCcc_I	addccc 	%r8, 0x0d90, %r6
	.word 0x8d643801  ! 599: MOVcc_I	<illegal instruction>
	.word 0x8e9a0009  ! 599: XORcc_R	xorcc 	%r8, %r9, %r7
	.word 0x86aa2f20  ! 599: ANDNcc_I	andncc 	%r8, 0x0f20, %r3
	.word 0x8a120009  ! 599: OR_R	or 	%r8, %r9, %r5
	.word 0x82aa0009  ! 599: ANDNcc_R	andncc 	%r8, %r9, %r1
	.word 0x8b2a1009  ! 599: SLLX_R	sllx	%r8, %r9, %r5
	.word 0xb5782401  ! 599: MOVR_I	move	%r0, 0x9, %r26
	.word 0x82920009  ! 599: ORcc_R	orcc 	%r8, %r9, %r1
	.word 0x8d2a2001  ! 599: SLL_I	sll 	%r8, 0x0001, %r6
	.word 0x9c3a213c  ! 599: XNOR_I	xnor 	%r8, 0x013c, %r14
	.word 0x88320009  ! 599: SUBC_R	orn 	%r8, %r9, %r4
	.word 0xaf320009  ! 599: SRL_R	srl 	%r8, %r9, %r23
	.word 0x8ec20009  ! 599: ADDCcc_R	addccc 	%r8, %r9, %r7
	.word 0xca220009  ! 603: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xcc0a0009  ! 603: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xc25a0009  ! 603: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0x887a2734  ! 603: SDIV_I	sdiv 	%r8, 0x0734, %r4
	.word 0x86320009  ! 605: SUBC_R	orn 	%r8, %r9, %r3
	.word 0x8aa22e98  ! 605: SUBcc_I	subcc 	%r8, 0x0e98, %r5
	.word 0x989a2f44  ! 605: XORcc_I	xorcc 	%r8, 0x0f44, %r12
	.word 0x8eba0009  ! 605: XNORcc_R	xnorcc 	%r8, %r9, %r7
	.word 0xa20a20f4  ! 605: AND_I	and 	%r8, 0x00f4, %r17
	.word 0x8d2a2001  ! 605: SLL_I	sll 	%r8, 0x0001, %r6
	.word 0x87320009  ! 605: SRL_R	srl 	%r8, %r9, %r3
	.word 0x82b20009  ! 605: ORNcc_R	orncc 	%r8, %r9, %r1
	.word 0x86020009  ! 605: ADD_R	add 	%r8, %r9, %r3
	.word 0x832a3001  ! 605: SLLX_I	sllx	%r8, 0x0001, %r1
	.word 0x8e822e74  ! 605: ADDcc_I	addcc 	%r8, 0x0e74, %r7
	.word 0x8e1a2984  ! 605: XOR_I	xor 	%r8, 0x0984, %r7
	.word 0xe42a0009  ! 609: STB_R	stb	%r18, [%r8 + %r9]
	.word 0xc25a0009  ! 609: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0x8c7a2704  ! 609: SDIV_I	sdiv 	%r8, 0x0704, %r6
	.word 0x867a267c  ! 609: SDIV_I	sdiv 	%r8, 0x067c, %r3
	.word 0xc8720009  ! 615: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xce5a0009  ! 615: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0x8e6a26bc  ! 615: UDIVX_I	udivx 	%r8, 0x06bc, %r7
	.word 0x8e6a0009  ! 615: UDIVX_R	udivx 	%r8, %r9, %r7
	.word 0x3c800002  ! 618: BPOS	bpos,a	<label_0x2>
	.word 0x896a0009  ! 618: SDIVX_R	sdivx	%r8, %r9, %r4
	.word 0x8eaa2498  ! 619: ANDNcc_I	andncc 	%r8, 0x0498, %r7
	.word 0xb62a0009  ! 619: ANDN_R	andn 	%r8, %r9, %r27
	.word 0x9d782401  ! 619: MOVR_I	move	%r0, 0x9, %r14
	.word 0x8cba0009  ! 619: XNORcc_R	xnorcc 	%r8, %r9, %r6
	.word 0x88a227d4  ! 619: SUBcc_I	subcc 	%r8, 0x07d4, %r4
	.word 0x833a1009  ! 619: SRAX_R	srax	%r8, %r9, %r1
	.word 0x8a0a0009  ! 619: AND_R	and 	%r8, %r9, %r5
	.word 0x8c022a38  ! 619: ADD_I	add 	%r8, 0x0a38, %r6
	.word 0x8882209c  ! 619: ADDcc_I	addcc 	%r8, 0x009c, %r4
	.word 0xa2220009  ! 619: SUB_R	sub 	%r8, %r9, %r17
	.word 0x88b22784  ! 619: ORNcc_I	orncc 	%r8, 0x0784, %r4
	.word 0xe73a0009  ! 624: STDF_R	std	%f19, [%r9, %r8]
	.word 0xc5020009  ! 624: LDF_R	ld	[%r8, %r9], %f2
	.word 0x8cfa29d8  ! 624: SDIVcc_I	sdivcc 	%r8, 0x09d8, %r6
	.word 0x8a722eb8  ! 624: UDIV_I	udiv 	%r8, 0x0eb8, %r5
	.word 0xc4220009  ! 628: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc24a0009  ! 628: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0x846a20c8  ! 628: UDIVX_I	udivx 	%r8, 0x00c8, %r2
	.word 0x8af20009  ! 628: UDIVcc_R	udivcc 	%r8, %r9, %r5
	.word 0x8a2a2bfc  ! 632: ANDN_I	andn 	%r8, 0x0bfc, %r5
	.word 0x86220009  ! 632: SUB_R	sub 	%r8, %r9, %r3
	.word 0x88322b9c  ! 632: ORN_I	orn 	%r8, 0x0b9c, %r4
	.word 0x8c320009  ! 632: ORN_R	orn 	%r8, %r9, %r6
	.word 0xa4a22210  ! 632: SUBcc_I	subcc 	%r8, 0x0210, %r18
	.word 0xbe3a0009  ! 632: XNOR_R	xnor 	%r8, %r9, %r31
	.word 0x82a20009  ! 632: SUBcc_R	subcc 	%r8, %r9, %r1
	.word 0x8c9a2cec  ! 632: XORcc_I	xorcc 	%r8, 0x0cec, %r6
	.word 0x8b323001  ! 632: SRLX_I	srlx	%r8, 0x0001, %r5
	.word 0xa0c22c64  ! 632: ADDCcc_I	addccc 	%r8, 0x0c64, %r16
	.word 0x840221ac  ! 632: ADD_I	add 	%r8, 0x01ac, %r2
	.word 0xb63a0009  ! 632: XNOR_R	xnor 	%r8, %r9, %r27
	.word 0x8e0a0009  ! 632: AND_R	and 	%r8, %r9, %r7
	.word 0x8f643801  ! 632: MOVcc_I	<illegal instruction>
	.word 0x86a22340  ! 632: SUBcc_I	subcc 	%r8, 0x0340, %r3
	.word 0xec220009  ! 643: STW_R	stw	%r22, [%r8 + %r9]
	.word 0xc45a0009  ! 643: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0x86720009  ! 643: UDIV_R	udiv 	%r8, %r9, %r3
	.word 0x8efa2d58  ! 643: SDIVcc_I	sdivcc 	%r8, 0x0d58, %r7
	.word 0x06ca0001  ! 647: BRLZ	brlz  ,pt	%8,<label_0xa0001>
	.word 0xb87229fc  ! 647: UDIV_I	udiv 	%r8, 0x09fc, %r28
	.word 0x24ca0001  ! 652: BRLEZ	brlez,a,pt	%8,<label_0xa0001>
	.word 0x8a6a2b90  ! 652: UDIVX_I	udivx 	%r8, 0x0b90, %r5
	.word 0x820a270c  ! 655: AND_I	and 	%r8, 0x070c, %r1
	.word 0x8b3a2001  ! 655: SRA_I	sra 	%r8, 0x0001, %r5
	.word 0x841a0009  ! 655: XOR_R	xor 	%r8, %r9, %r2
	.word 0xbf323001  ! 655: SRLX_I	srlx	%r8, 0x0001, %r31
	.word 0x843a29e8  ! 655: XNOR_I	xnor 	%r8, 0x09e8, %r2
	.word 0x982a23e4  ! 655: ANDN_I	andn 	%r8, 0x03e4, %r12
	.word 0x88aa2cb8  ! 655: ANDNcc_I	andncc 	%r8, 0x0cb8, %r4
	.word 0x9e1a2094  ! 655: XOR_I	xor 	%r8, 0x0094, %r15
	.word 0x8e3a2220  ! 655: XNOR_I	xnor 	%r8, 0x0220, %r7
	.word 0x89780409  ! 655: MOVR_R	move	%r0, %r9, %r4
	.word 0xc7220009  ! 659: STF_R	st	%f3, [%r9, %r8]
	.word 0xcc1a0009  ! 659: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0x89780409  ! 659: MOVR_R	move	%r0, %r9, %r4
	.word 0x8c7a0009  ! 659: SDIV_R	sdiv 	%r8, %r9, %r6
	.word 0xfc720009  ! 665: STX_R	stx	%r30, [%r8 + %r9]
	.word 0xf31a0009  ! 665: LDDF_R	ldd	[%r8, %r9], %f25
	.word 0x86720009  ! 665: UDIV_R	udiv 	%r8, %r9, %r3
	.word 0x82722814  ! 665: UDIV_I	udiv 	%r8, 0x0814, %r1
	.word 0x40000002  ! 667: CALL	call	disp30_2
	.word 0x856a2370  ! 667: SDIVX_I	sdivx	%r8, 0x0370, %r2
	.word 0x84222994  ! 668: SUB_I	sub 	%r8, 0x0994, %r2
	.word 0x869a0009  ! 668: XORcc_R	xorcc 	%r8, %r9, %r3
	.word 0xa12a2001  ! 668: SLL_I	sll 	%r8, 0x0001, %r16
	.word 0xae2a2fb4  ! 668: ANDN_I	andn 	%r8, 0x0fb4, %r23
	.word 0x893a3001  ! 668: SRAX_I	srax	%r8, 0x0001, %r4
	.word 0x863a0009  ! 668: XNOR_R	xnor 	%r8, %r9, %r3
	.word 0x86b20009  ! 668: SUBCcc_R	orncc 	%r8, %r9, %r3
	.word 0xb4322754  ! 668: ORN_I	orn 	%r8, 0x0754, %r26
	.word 0xb9780409  ! 668: MOVR_R	move	%r0, %r9, %r28
	.word 0x95320009  ! 668: SRL_R	srl 	%r8, %r9, %r10
	.word 0x8a2a28c8  ! 668: ANDN_I	andn 	%r8, 0x08c8, %r5
	.word 0x88220009  ! 670: SUB_R	sub 	%r8, %r9, %r4
	.word 0xa88a0009  ! 670: ANDcc_R	andcc 	%r8, %r9, %r20
	.word 0xa6ba2750  ! 670: XNORcc_I	xnorcc 	%r8, 0x0750, %r19
	.word 0xa0820009  ! 670: ADDcc_R	addcc 	%r8, %r9, %r16
	.word 0x94aa2ee4  ! 670: ANDNcc_I	andncc 	%r8, 0x0ee4, %r10
	.word 0xb6320009  ! 670: ORN_R	orn 	%r8, %r9, %r27
	.word 0x889225b0  ! 670: ORcc_I	orcc 	%r8, 0x05b0, %r4
	.word 0x8aba2df8  ! 670: XNORcc_I	xnorcc 	%r8, 0x0df8, %r5
	.word 0x9ab22618  ! 670: SUBCcc_I	orncc 	%r8, 0x0618, %r13
	.word 0x88ba23c8  ! 670: XNORcc_I	xnorcc 	%r8, 0x03c8, %r4
	.word 0x86122f8c  ! 670: OR_I	or 	%r8, 0x0f8c, %r3
	.word 0x853a3001  ! 670: SRAX_I	srax	%r8, 0x0001, %r2
	.word 0xae1a0009  ! 670: XOR_R	xor 	%r8, %r9, %r23
	.word 0x84c22390  ! 672: ADDCcc_I	addccc 	%r8, 0x0390, %r2
	.word 0x823a0009  ! 672: XNOR_R	xnor 	%r8, %r9, %r1
	.word 0xaab20009  ! 672: SUBCcc_R	orncc 	%r8, %r9, %r21
	.word 0x8a020009  ! 672: ADD_R	add 	%r8, %r9, %r5
	.word 0x8caa0009  ! 672: ANDNcc_R	andncc 	%r8, %r9, %r6
	.word 0x94a20009  ! 672: SUBcc_R	subcc 	%r8, %r9, %r10
	.word 0x97322001  ! 672: SRL_I	srl 	%r8, 0x0001, %r11
	.word 0x82320009  ! 672: SUBC_R	orn 	%r8, %r9, %r1
	.word 0x872a1009  ! 672: SLLX_R	sllx	%r8, %r9, %r3
	.word 0x88b22bb8  ! 672: SUBCcc_I	orncc 	%r8, 0x0bb8, %r4
	.word 0xcc220009  ! 677: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc25a0009  ! 677: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0x82720009  ! 677: UDIV_R	udiv 	%r8, %r9, %r1
	.word 0x86f22388  ! 677: UDIVcc_I	udivcc 	%r8, 0x0388, %r3
	.word 0x873a0009  ! 683: SRA_R	sra 	%r8, %r9, %r3
	.word 0x8c020009  ! 683: ADD_R	add 	%r8, %r9, %r6
	.word 0x883a2eac  ! 683: XNOR_I	xnor 	%r8, 0x0eac, %r4
	.word 0x84ba29d8  ! 683: XNORcc_I	xnorcc 	%r8, 0x09d8, %r2
	.word 0x860a0009  ! 683: AND_R	and 	%r8, %r9, %r3
	.word 0x82a20009  ! 683: SUBcc_R	subcc 	%r8, %r9, %r1
	.word 0x8d323001  ! 683: SRLX_I	srlx	%r8, 0x0001, %r6
	.word 0x8eb20009  ! 683: SUBCcc_R	orncc 	%r8, %r9, %r7
	.word 0x8ab22978  ! 683: ORNcc_I	orncc 	%r8, 0x0978, %r5
	.word 0xa08a2548  ! 683: ANDcc_I	andcc 	%r8, 0x0548, %r16
	.word 0xa0b20009  ! 683: SUBCcc_R	orncc 	%r8, %r9, %r16
	.word 0x8f643801  ! 683: MOVcc_I	<illegal instruction>
	.word 0xba1a0009  ! 685: XOR_R	xor 	%r8, %r9, %r29
	.word 0xbd3a3001  ! 685: SRAX_I	srax	%r8, 0x0001, %r30
	.word 0xb8022d7c  ! 685: ADD_I	add 	%r8, 0x0d7c, %r28
	.word 0xa0320009  ! 685: SUBC_R	orn 	%r8, %r9, %r16
	.word 0xae9a2848  ! 685: XORcc_I	xorcc 	%r8, 0x0848, %r23
	.word 0xa53a1009  ! 685: SRAX_R	srax	%r8, %r9, %r18
	.word 0x83323001  ! 685: SRLX_I	srlx	%r8, 0x0001, %r1
	.word 0xb6320009  ! 685: SUBC_R	orn 	%r8, %r9, %r27
	.word 0xb8820009  ! 685: ADDcc_R	addcc 	%r8, %r9, %r28
	.word 0x98020009  ! 685: ADD_R	add 	%r8, %r9, %r12
	.word 0x8ac2266c  ! 685: ADDCcc_I	addccc 	%r8, 0x066c, %r5
	.word 0x86820009  ! 685: ADDcc_R	addcc 	%r8, %r9, %r3
	.word 0x852a1009  ! 685: SLLX_R	sllx	%r8, %r9, %r2
	.word 0x86aa23bc  ! 685: ANDNcc_I	andncc 	%r8, 0x03bc, %r3
	.word 0xce220009  ! 689: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xfe420009  ! 689: LDSW_R	ldsw	[%r8 + %r9], %r31
	.word 0xca020009  ! 689: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xaafa2e8c  ! 689: SDIVcc_I	sdivcc 	%r8, 0x0e8c, %r21
	.word 0x18800001  ! 691: BGU	bgu  	<label_0x1>
	.word 0x8d6a0009  ! 691: SDIVX_R	sdivx	%r8, %r9, %r6
	.word 0x2c800002  ! 695: BNEG	bneg,a	<label_0x2>
	.word 0x8c6a0009  ! 695: UDIVX_R	udivx 	%r8, %r9, %r6
	.word 0x24800001  ! 700: BLE	ble,a	<label_0x1>
	.word 0x867a0009  ! 700: SDIV_R	sdiv 	%r8, %r9, %r3
	.word 0x89321009  ! 702: SRLX_R	srlx	%r8, %r9, %r4
	.word 0x973a2001  ! 702: SRA_I	sra 	%r8, 0x0001, %r11
	.word 0x8eb20009  ! 702: SUBCcc_R	orncc 	%r8, %r9, %r7
	.word 0xb08a2840  ! 702: ANDcc_I	andcc 	%r8, 0x0840, %r24
	.word 0x8eb22164  ! 702: SUBCcc_I	orncc 	%r8, 0x0164, %r7
	.word 0x8e8a0009  ! 702: ANDcc_R	andcc 	%r8, %r9, %r7
	.word 0x8f2a1009  ! 702: SLLX_R	sllx	%r8, %r9, %r7
	.word 0xb5321009  ! 702: SRLX_R	srlx	%r8, %r9, %r26
	.word 0x89323001  ! 702: SRLX_I	srlx	%r8, 0x0001, %r4
	.word 0xacba2cd4  ! 702: XNORcc_I	xnorcc 	%r8, 0x0cd4, %r22
	.word 0xbe020009  ! 703: ADD_R	add 	%r8, %r9, %r31
	.word 0x86122fc4  ! 703: OR_I	or 	%r8, 0x0fc4, %r3
	.word 0xa2ba0009  ! 703: XNORcc_R	xnorcc 	%r8, %r9, %r17
	.word 0x8a4225a8  ! 703: ADDC_I	addc 	%r8, 0x05a8, %r5
	.word 0x87323001  ! 703: SRLX_I	srlx	%r8, 0x0001, %r3
	.word 0xa43a2248  ! 703: XNOR_I	xnor 	%r8, 0x0248, %r18
	.word 0xbc0a0009  ! 703: AND_R	and 	%r8, %r9, %r30
	.word 0x86322a1c  ! 703: ORN_I	orn 	%r8, 0x0a1c, %r3
	.word 0x8b321009  ! 703: SRLX_R	srlx	%r8, %r9, %r5
	.word 0x823226fc  ! 703: ORN_I	orn 	%r8, 0x06fc, %r1
	.word 0x829a27cc  ! 703: XORcc_I	xorcc 	%r8, 0x07cc, %r1
	.word 0x8a3229a4  ! 703: SUBC_I	orn 	%r8, 0x09a4, %r5
	.word 0x8e3a2d58  ! 703: XNOR_I	xnor 	%r8, 0x0d58, %r7
	.word 0x98422460  ! 703: ADDC_I	addc 	%r8, 0x0460, %r12
	.word 0x8a822998  ! 708: ADDcc_I	addcc 	%r8, 0x0998, %r5
	.word 0xb2422bcc  ! 708: ADDC_I	addc 	%r8, 0x0bcc, %r25
	.word 0xb89a218c  ! 708: XORcc_I	xorcc 	%r8, 0x018c, %r28
	.word 0x84c22868  ! 708: ADDCcc_I	addccc 	%r8, 0x0868, %r2
	.word 0x88c20009  ! 708: ADDCcc_R	addccc 	%r8, %r9, %r4
	.word 0x88422d1c  ! 708: ADDC_I	addc 	%r8, 0x0d1c, %r4
	.word 0x88c22760  ! 708: ADDCcc_I	addccc 	%r8, 0x0760, %r4
	.word 0x9c822974  ! 708: ADDcc_I	addcc 	%r8, 0x0974, %r14
	.word 0x9c3a0009  ! 708: XNOR_R	xnor 	%r8, %r9, %r14
	.word 0x82822d8c  ! 708: ADDcc_I	addcc 	%r8, 0x0d8c, %r1
	.word 0x85320009  ! 708: SRL_R	srl 	%r8, %r9, %r2
	.word 0x8cba2170  ! 708: XNORcc_I	xnorcc 	%r8, 0x0170, %r6
	.word 0x26c20001  ! 714: BRLZ	brlz,a,nt	%8,<label_0x20001>
	.word 0x8d6a2cf8  ! 714: SDIVX_I	sdivx	%r8, 0x0cf8, %r6
	.word 0xc33a0009  ! 718: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc81a0009  ! 718: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xb80a0009  ! 718: AND_R	and 	%r8, %r9, %r28
	.word 0x846a2640  ! 718: UDIVX_I	udivx 	%r8, 0x0640, %r2
	.word 0xe0720009  ! 723: STX_R	stx	%r16, [%r8 + %r9]
	.word 0xc5020009  ! 723: LDF_R	ld	[%r8, %r9], %f2
	.word 0xbcfa0009  ! 723: SDIVcc_R	sdivcc 	%r8, %r9, %r30
	.word 0xbcfa2b28  ! 723: SDIVcc_I	sdivcc 	%r8, 0x0b28, %r30
	.word 0x8f643801  ! 729: MOVcc_I	<illegal instruction>
	.word 0x8aaa27ec  ! 729: ANDNcc_I	andncc 	%r8, 0x07ec, %r5
	.word 0x8b3a3001  ! 729: SRAX_I	srax	%r8, 0x0001, %r5
	.word 0x823223cc  ! 729: ORN_I	orn 	%r8, 0x03cc, %r1
	.word 0x8eb20009  ! 729: SUBCcc_R	orncc 	%r8, %r9, %r7
	.word 0xba8a0009  ! 729: ANDcc_R	andcc 	%r8, %r9, %r29
	.word 0x9cba2880  ! 729: XNORcc_I	xnorcc 	%r8, 0x0880, %r14
	.word 0x8d322001  ! 729: SRL_I	srl 	%r8, 0x0001, %r6
	.word 0x86920009  ! 729: ORcc_R	orcc 	%r8, %r9, %r3
	.word 0x89320009  ! 729: SRL_R	srl 	%r8, %r9, %r4
	.word 0x892a3001  ! 729: SLLX_I	sllx	%r8, 0x0001, %r4
	.word 0x862a0009  ! 729: ANDN_R	andn 	%r8, %r9, %r3
	.word 0xbe0a2e1c  ! 729: AND_I	and 	%r8, 0x0e1c, %r31
	.word 0xce320009  ! 733: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc2520009  ! 733: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xa47a0009  ! 733: SDIV_R	sdiv 	%r8, %r9, %r18
	.word 0x9c6a0009  ! 733: UDIVX_R	udivx 	%r8, %r9, %r14
	.word 0xc6720009  ! 739: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xcf020009  ! 739: LDF_R	ld	[%r8, %r9], %f7
	.word 0x856a28e8  ! 739: SDIVX_I	sdivx	%r8, 0x08e8, %r2
	.word 0x8a722750  ! 739: UDIV_I	udiv 	%r8, 0x0750, %r5
	.word 0x02ca0001  ! 741: BRZ	brz  ,pt	%8,<label_0xa0001>
	.word 0xb6f22d6c  ! 741: UDIVcc_I	udivcc 	%r8, 0x0d6c, %r27
	.word 0xcc320009  ! 745: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xe8020009  ! 745: LDUW_R	lduw	[%r8 + %r9], %r20
	.word 0x8e6a2758  ! 745: UDIVX_I	udivx 	%r8, 0x0758, %r7
	.word 0x84720009  ! 745: UDIV_R	udiv 	%r8, %r9, %r2
	.word 0x20800002  ! 748: BN	bn,a	<label_0x2>
	.word 0x876a0009  ! 748: SDIVX_R	sdivx	%r8, %r9, %r3
	.word 0x38800002  ! 754: BGU	bgu,a	<label_0x2>
	.word 0x9f6a0009  ! 754: SDIVX_R	sdivx	%r8, %r9, %r15
	.word 0xc2220009  ! 759: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xce420009  ! 759: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xa6f22c48  ! 759: UDIVcc_I	udivcc 	%r8, 0x0c48, %r19
	.word 0x8a6a0009  ! 759: UDIVX_R	udivx 	%r8, %r9, %r5
	.word 0x12800001  ! 761: BNE	bne  	<label_0x1>
	.word 0x8f6a0009  ! 761: SDIVX_R	sdivx	%r8, %r9, %r7
	.word 0xc22a0009  ! 765: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc41a0009  ! 765: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x8cf22ae4  ! 765: UDIVcc_I	udivcc 	%r8, 0x0ae4, %r6
	.word 0x856a0009  ! 765: SDIVX_R	sdivx	%r8, %r9, %r2
	.word 0x40000001  ! 767: CALL	call	disp30_1
	.word 0x8af22974  ! 767: UDIVcc_I	udivcc 	%r8, 0x0974, %r5
	.word 0x16800001  ! 769: BGE	bge  	<label_0x1>
	.word 0x827226c8  ! 769: UDIV_I	udiv 	%r8, 0x06c8, %r1
	.word 0x1c800001  ! 771: BPOS	bpos  	<label_0x1>
	.word 0x966a275c  ! 771: UDIVX_I	udivx 	%r8, 0x075c, %r11
	.word 0x8c320009  ! 772: ORN_R	orn 	%r8, %r9, %r6
	.word 0x820222b0  ! 772: ADD_I	add 	%r8, 0x02b0, %r1
	.word 0x8e9a281c  ! 772: XORcc_I	xorcc 	%r8, 0x081c, %r7
	.word 0x822a0009  ! 772: ANDN_R	andn 	%r8, %r9, %r1
	.word 0xbd641809  ! 772: MOVcc_R	<illegal instruction>
	.word 0x9cb20009  ! 772: SUBCcc_R	orncc 	%r8, %r9, %r14
	.word 0x8aa22f30  ! 772: SUBcc_I	subcc 	%r8, 0x0f30, %r5
	.word 0xb6b20009  ! 772: ORNcc_R	orncc 	%r8, %r9, %r27
	.word 0x83641809  ! 772: MOVcc_R	<illegal instruction>
	.word 0x87782401  ! 772: MOVR_I	move	%r0, 0x9, %r3
	.word 0x849a24e8  ! 772: XORcc_I	xorcc 	%r8, 0x04e8, %r2
	.word 0xc42a0009  ! 776: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc41a0009  ! 776: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x8ef20009  ! 776: UDIVcc_R	udivcc 	%r8, %r9, %r7
	.word 0x8a720009  ! 776: UDIV_R	udiv 	%r8, %r9, %r5
	.word 0xf3220009  ! 780: STF_R	st	%f25, [%r9, %r8]
	.word 0xc81a0009  ! 780: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x82722d70  ! 780: UDIV_I	udiv 	%r8, 0x0d70, %r1
	.word 0x976a0009  ! 780: SDIVX_R	sdivx	%r8, %r9, %r11
	.word 0x8232221c  ! 782: ORN_I	orn 	%r8, 0x021c, %r1
	.word 0x873a3001  ! 782: SRAX_I	srax	%r8, 0x0001, %r3
	.word 0x8e8a2edc  ! 782: ANDcc_I	andcc 	%r8, 0x0edc, %r7
	.word 0x863a0009  ! 782: XNOR_R	xnor 	%r8, %r9, %r3
	.word 0xba8a2648  ! 782: ANDcc_I	andcc 	%r8, 0x0648, %r29
	.word 0x8e3a21e8  ! 782: XNOR_I	xnor 	%r8, 0x01e8, %r7
	.word 0x8e1a24e0  ! 782: XOR_I	xor 	%r8, 0x04e0, %r7
	.word 0x8eaa2da0  ! 782: ANDNcc_I	andncc 	%r8, 0x0da0, %r7
	.word 0x8f320009  ! 782: SRL_R	srl 	%r8, %r9, %r7
	.word 0x9a8a22fc  ! 782: ANDcc_I	andcc 	%r8, 0x02fc, %r13
	.word 0xa29a0009  ! 782: XORcc_R	xorcc 	%r8, %r9, %r17
	.word 0xb23a250c  ! 782: XNOR_I	xnor 	%r8, 0x050c, %r25
	.word 0x82422c84  ! 782: ADDC_I	addc 	%r8, 0x0c84, %r1
	.word 0x82b20009  ! 783: SUBCcc_R	orncc 	%r8, %r9, %r1
	.word 0xa4120009  ! 783: OR_R	or 	%r8, %r9, %r18
	.word 0x88aa200c  ! 783: ANDNcc_I	andncc 	%r8, 0x000c, %r4
	.word 0xa402257c  ! 783: ADD_I	add 	%r8, 0x057c, %r18
	.word 0x86020009  ! 783: ADD_R	add 	%r8, %r9, %r3
	.word 0x8eb20009  ! 783: ORNcc_R	orncc 	%r8, %r9, %r7
	.word 0x8c2a23c8  ! 783: ANDN_I	andn 	%r8, 0x03c8, %r6
	.word 0x9eb22f1c  ! 783: ORNcc_I	orncc 	%r8, 0x0f1c, %r15
	.word 0x889a26f4  ! 783: XORcc_I	xorcc 	%r8, 0x06f4, %r4
	.word 0x8a9a0009  ! 783: XORcc_R	xorcc 	%r8, %r9, %r5
	.word 0x82020009  ! 783: ADD_R	add 	%r8, %r9, %r1
	.word 0xab3a1009  ! 783: SRAX_R	srax	%r8, %r9, %r21
	.word 0x848a293c  ! 783: ANDcc_I	andcc 	%r8, 0x093c, %r2
	.word 0x868a0009  ! 783: ANDcc_R	andcc 	%r8, %r9, %r3
	.word 0x8b322001  ! 785: SRL_I	srl 	%r8, 0x0001, %r5
	.word 0x8b322001  ! 785: SRL_I	srl 	%r8, 0x0001, %r5
	.word 0x9812225c  ! 785: OR_I	or 	%r8, 0x025c, %r12
	.word 0x88b222d4  ! 785: SUBCcc_I	orncc 	%r8, 0x02d4, %r4
	.word 0x86820009  ! 785: ADDcc_R	addcc 	%r8, %r9, %r3
	.word 0x841224b8  ! 785: OR_I	or 	%r8, 0x04b8, %r2
	.word 0x86120009  ! 785: OR_R	or 	%r8, %r9, %r3
	.word 0x94322b50  ! 785: ORN_I	orn 	%r8, 0x0b50, %r10
	.word 0xa63a0009  ! 785: XNOR_R	xnor 	%r8, %r9, %r19
	.word 0x8e9a0009  ! 785: XORcc_R	xorcc 	%r8, %r9, %r7
	.word 0x8caa2828  ! 785: ANDNcc_I	andncc 	%r8, 0x0828, %r6
	.word 0x8c820009  ! 785: ADDcc_R	addcc 	%r8, %r9, %r6
	.word 0xb32a3001  ! 785: SLLX_I	sllx	%r8, 0x0001, %r25
	.word 0x16800002  ! 787: BGE	bge  	<label_0x2>
	.word 0x8e7a266c  ! 787: SDIV_I	sdiv 	%r8, 0x066c, %r7
	.word 0xe2720009  ! 793: STX_R	stx	%r17, [%r8 + %r9]
	.word 0xfc1a0009  ! 793: LDD_R	ldd	[%r8 + %r9], %r30
	.word 0x8c720009  ! 793: UDIV_R	udiv 	%r8, %r9, %r6
	.word 0x88722a60  ! 793: UDIV_I	udiv 	%r8, 0x0a60, %r4
	.word 0x8c0227c8  ! 794: ADD_I	add 	%r8, 0x07c8, %r6
	.word 0x96020009  ! 794: ADD_R	add 	%r8, %r9, %r11
	.word 0x852a0009  ! 794: SLL_R	sll 	%r8, %r9, %r2
	.word 0x82320009  ! 794: SUBC_R	orn 	%r8, %r9, %r1
	.word 0x9a2a2698  ! 794: ANDN_I	andn 	%r8, 0x0698, %r13
	.word 0x86b20009  ! 794: SUBCcc_R	orncc 	%r8, %r9, %r3
	.word 0x8caa0009  ! 794: ANDNcc_R	andncc 	%r8, %r9, %r6
	.word 0x86a22a54  ! 794: SUBcc_I	subcc 	%r8, 0x0a54, %r3
	.word 0xb0b20009  ! 794: SUBCcc_R	orncc 	%r8, %r9, %r24
	.word 0x8c122a88  ! 794: OR_I	or 	%r8, 0x0a88, %r6
	.word 0x8c222ec0  ! 795: SUB_I	sub 	%r8, 0x0ec0, %r6
	.word 0x8f3a3001  ! 795: SRAX_I	srax	%r8, 0x0001, %r7
	.word 0xad780409  ! 795: MOVR_R	move	%r0, %r9, %r22
	.word 0x8c8a25f0  ! 795: ANDcc_I	andcc 	%r8, 0x05f0, %r6
	.word 0x82422260  ! 795: ADDC_I	addc 	%r8, 0x0260, %r1
	.word 0x9a322518  ! 795: SUBC_I	orn 	%r8, 0x0518, %r13
	.word 0x861a0009  ! 795: XOR_R	xor 	%r8, %r9, %r3
	.word 0x852a2001  ! 795: SLL_I	sll 	%r8, 0x0001, %r2
	.word 0x8eb20009  ! 795: ORNcc_R	orncc 	%r8, %r9, %r7
	.word 0x84220009  ! 795: SUB_R	sub 	%r8, %r9, %r2
	.word 0xc4320009  ! 799: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc3020009  ! 799: LDF_R	ld	[%r8, %r9], %f1
	.word 0x847a2ed4  ! 799: SDIV_I	sdiv 	%r8, 0x0ed4, %r2
	.word 0x867a0009  ! 799: SDIV_R	sdiv 	%r8, %r9, %r3
	.word 0xed3a0009  ! 803: STDF_R	std	%f22, [%r9, %r8]
	.word 0xcc1a0009  ! 803: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0x84722388  ! 803: UDIV_I	udiv 	%r8, 0x0388, %r2
	.word 0xa6f20009  ! 803: UDIVcc_R	udivcc 	%r8, %r9, %r19
	.word 0x8e320009  ! 807: ORN_R	orn 	%r8, %r9, %r7
	.word 0x82320009  ! 807: ORN_R	orn 	%r8, %r9, %r1
	.word 0xb4920009  ! 807: ORcc_R	orcc 	%r8, %r9, %r26
	.word 0x8a3a23e4  ! 807: XNOR_I	xnor 	%r8, 0x03e4, %r5
	.word 0x8a120009  ! 807: OR_R	or 	%r8, %r9, %r5
	.word 0x873a2001  ! 807: SRA_I	sra 	%r8, 0x0001, %r3
	.word 0x82320009  ! 807: SUBC_R	orn 	%r8, %r9, %r1
	.word 0x832a0009  ! 807: SLL_R	sll 	%r8, %r9, %r1
	.word 0x853a2001  ! 807: SRA_I	sra 	%r8, 0x0001, %r2
	.word 0x8a1a2e74  ! 807: XOR_I	xor 	%r8, 0x0e74, %r5
	.word 0x9e9a0009  ! 807: XORcc_R	xorcc 	%r8, %r9, %r15
	.word 0x849a0009  ! 807: XORcc_R	xorcc 	%r8, %r9, %r2
	.word 0x84a20009  ! 807: SUBcc_R	subcc 	%r8, %r9, %r2
	.word 0x89782401  ! 807: MOVR_I	move	%r0, 0x9, %r4
	.word 0x87643801  ! 807: MOVcc_I	<illegal instruction>
	.word 0xce720009  ! 812: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc24a0009  ! 812: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xc9020009  ! 812: LDF_R	ld	[%r8, %r9], %f4
	.word 0x8efa2e54  ! 812: SDIVcc_I	sdivcc 	%r8, 0x0e54, %r7
	.word 0xf0220009  ! 818: STW_R	stw	%r24, [%r8 + %r9]
	.word 0xca5a0009  ! 818: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0x867a0009  ! 818: SDIV_R	sdiv 	%r8, %r9, %r3
	.word 0xb6fa0009  ! 818: SDIVcc_R	sdivcc 	%r8, %r9, %r27
	.word 0xce220009  ! 829: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xd91a0009  ! 829: LDDF_R	ldd	[%r8, %r9], %f12
	.word 0x9a722b94  ! 829: UDIV_I	udiv 	%r8, 0x0b94, %r13
	.word 0x8c6a2688  ! 829: UDIVX_I	udivx 	%r8, 0x0688, %r6
	.word 0x0ac20001  ! 831: BRNZ	brnz  ,nt	%8,<label_0x20001>
	.word 0x8b6a211c  ! 831: SDIVX_I	sdivx	%r8, 0x011c, %r5
	.word 0x14800001  ! 840: BG	bg  	<label_0x1>
	.word 0x9a7a2700  ! 840: SDIV_I	sdiv 	%r8, 0x0700, %r13
	.word 0xcd3a0009  ! 844: STDF_R	std	%f6, [%r9, %r8]
	.word 0xec1a0009  ! 844: LDD_R	ldd	[%r8 + %r9], %r22
	.word 0x86fa2a08  ! 844: SDIVcc_I	sdivcc 	%r8, 0x0a08, %r3
	.word 0x86fa27a4  ! 844: SDIVcc_I	sdivcc 	%r8, 0x07a4, %r3
	.word 0x8f3a0009  ! 846: SRA_R	sra 	%r8, %r9, %r7
	.word 0x82320009  ! 846: SUBC_R	orn 	%r8, %r9, %r1
	.word 0x8c3229b8  ! 846: ORN_I	orn 	%r8, 0x09b8, %r6
	.word 0xb82a2c00  ! 846: ANDN_I	andn 	%r8, 0x0c00, %r28
	.word 0x832a1009  ! 846: SLLX_R	sllx	%r8, %r9, %r1
	.word 0xa7641809  ! 846: MOVcc_R	<illegal instruction>
	.word 0x853a2001  ! 846: SRA_I	sra 	%r8, 0x0001, %r2
	.word 0x86320009  ! 846: ORN_R	orn 	%r8, %r9, %r3
	.word 0x88c20009  ! 846: ADDCcc_R	addccc 	%r8, %r9, %r4
	.word 0x82c2228c  ! 846: ADDCcc_I	addccc 	%r8, 0x028c, %r1
	.word 0x98b22320  ! 846: ORNcc_I	orncc 	%r8, 0x0320, %r12
	.word 0x8f780409  ! 846: MOVR_R	move	%r0, %r9, %r7
	.word 0x98c221fc  ! 846: ADDCcc_I	addccc 	%r8, 0x01fc, %r12
	.word 0xb13a3001  ! 846: SRAX_I	srax	%r8, 0x0001, %r24
	.word 0xdf3a0009  ! 850: STDF_R	std	%f15, [%r9, %r8]
	.word 0xc85a0009  ! 850: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0x88fa0009  ! 850: SDIVcc_R	sdivcc 	%r8, %r9, %r4
	.word 0xb0720009  ! 850: UDIV_R	udiv 	%r8, %r9, %r24
	.word 0x8202260c  ! 851: ADD_I	add 	%r8, 0x060c, %r1
	.word 0x8b643801  ! 851: MOVcc_I	<illegal instruction>
	.word 0x8a920009  ! 851: ORcc_R	orcc 	%r8, %r9, %r5
	.word 0x8e920009  ! 851: ORcc_R	orcc 	%r8, %r9, %r7
	.word 0x8d323001  ! 851: SRLX_I	srlx	%r8, 0x0001, %r6
	.word 0x8a3a0009  ! 851: XNOR_R	xnor 	%r8, %r9, %r5
	.word 0xa0122574  ! 851: OR_I	or 	%r8, 0x0574, %r16
	.word 0xb9780409  ! 851: MOVR_R	move	%r0, %r9, %r28
	.word 0xb8b22df0  ! 851: ORNcc_I	orncc 	%r8, 0x0df0, %r28
	.word 0x9aaa2338  ! 851: ANDNcc_I	andncc 	%r8, 0x0338, %r13
	.word 0x8e320009  ! 851: SUBC_R	orn 	%r8, %r9, %r7
	.word 0xb2820009  ! 851: ADDcc_R	addcc 	%r8, %r9, %r25
	.word 0x94c22b04  ! 851: ADDCcc_I	addccc 	%r8, 0x0b04, %r10
	.word 0x840a0009  ! 851: AND_R	and 	%r8, %r9, %r2
	.word 0xc93a0009  ! 856: STDF_R	std	%f4, [%r9, %r8]
	.word 0xc4520009  ! 856: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xe01a2db8  ! 856: LDD_I	ldd	[%r8 + 0x0db8], %r16
	.word 0x86fa27d0  ! 856: SDIVcc_I	sdivcc 	%r8, 0x07d0, %r3
	.word 0x882a0009  ! 857: ANDN_R	andn 	%r8, %r9, %r4
	.word 0x882a22c4  ! 857: ANDN_I	andn 	%r8, 0x02c4, %r4
	.word 0x820a2f7c  ! 857: AND_I	and 	%r8, 0x0f7c, %r1
	.word 0x82820009  ! 857: ADDcc_R	addcc 	%r8, %r9, %r1
	.word 0x820a23fc  ! 857: AND_I	and 	%r8, 0x03fc, %r1
	.word 0x849a0009  ! 857: XORcc_R	xorcc 	%r8, %r9, %r2
	.word 0x8ab20009  ! 857: SUBCcc_R	orncc 	%r8, %r9, %r5
	.word 0x8e2a0009  ! 857: ANDN_R	andn 	%r8, %r9, %r7
	.word 0x832a1009  ! 857: SLLX_R	sllx	%r8, %r9, %r1
	.word 0x822a0009  ! 857: ANDN_R	andn 	%r8, %r9, %r1
	.word 0x8c9a2240  ! 857: XORcc_I	xorcc 	%r8, 0x0240, %r6
	.word 0xa4ba0009  ! 857: XNORcc_R	xnorcc 	%r8, %r9, %r18
	.word 0xb0420009  ! 857: ADDC_R	addc 	%r8, %r9, %r24
	.word 0xbe8a0009  ! 857: ANDcc_R	andcc 	%r8, %r9, %r31
	.word 0x8a020009  ! 857: ADD_R	add 	%r8, %r9, %r5
	.word 0x2cc20001  ! 861: BRGZ	brgz,a,nt	%8,<label_0x20001>
	.word 0x88720009  ! 861: UDIV_R	udiv 	%r8, %r9, %r4
	.word 0xc6320009  ! 865: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc8020009  ! 865: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0x896a0009  ! 865: SDIVX_R	sdivx	%r8, %r9, %r4
	.word 0x9a7a21d8  ! 865: SDIV_I	sdiv 	%r8, 0x01d8, %r13
	.word 0x8c9a2150  ! 867: XORcc_I	xorcc 	%r8, 0x0150, %r6
	.word 0x8ab22688  ! 867: ORNcc_I	orncc 	%r8, 0x0688, %r5
	.word 0x88820009  ! 867: ADDcc_R	addcc 	%r8, %r9, %r4
	.word 0x869226b0  ! 867: ORcc_I	orcc 	%r8, 0x06b0, %r3
	.word 0x82b20009  ! 867: SUBCcc_R	orncc 	%r8, %r9, %r1
	.word 0x87322001  ! 867: SRL_I	srl 	%r8, 0x0001, %r3
	.word 0x94322ed0  ! 867: SUBC_I	orn 	%r8, 0x0ed0, %r10
	.word 0x89643801  ! 867: MOVcc_I	<illegal instruction>
	.word 0xbeb20009  ! 867: ORNcc_R	orncc 	%r8, %r9, %r31
	.word 0x8eb20009  ! 867: SUBCcc_R	orncc 	%r8, %r9, %r7
	.word 0x892a0009  ! 867: SLL_R	sll 	%r8, %r9, %r4
	.word 0xae1a0009  ! 867: XOR_R	xor 	%r8, %r9, %r23
	.word 0x24800001  ! 870: BLE	ble,a	<label_0x1>
	.word 0x88f22a4c  ! 870: UDIVcc_I	udivcc 	%r8, 0x0a4c, %r4
	.word 0x1c800002  ! 872: BPOS	bpos  	<label_0x2>
	.word 0xbc6a2f3c  ! 872: UDIVX_I	udivx 	%r8, 0x0f3c, %r30
	.word 0x8c922bc4  ! 873: ORcc_I	orcc 	%r8, 0x0bc4, %r6
	.word 0xb0320009  ! 873: SUBC_R	orn 	%r8, %r9, %r24
	.word 0x8f2a3001  ! 873: SLLX_I	sllx	%r8, 0x0001, %r7
	.word 0x860a2d1c  ! 873: AND_I	and 	%r8, 0x0d1c, %r3
	.word 0xba0a0009  ! 873: AND_R	and 	%r8, %r9, %r29
	.word 0x882229d4  ! 873: SUB_I	sub 	%r8, 0x09d4, %r4
	.word 0x88aa0009  ! 873: ANDNcc_R	andncc 	%r8, %r9, %r4
	.word 0x83321009  ! 873: SRLX_R	srlx	%r8, %r9, %r1
	.word 0xbf3a0009  ! 873: SRA_R	sra 	%r8, %r9, %r31
	.word 0x88922668  ! 873: ORcc_I	orcc 	%r8, 0x0668, %r4
	.word 0x823a0009  ! 873: XNOR_R	xnor 	%r8, %r9, %r1
	.word 0x84ba2ac0  ! 873: XNORcc_I	xnorcc 	%r8, 0x0ac0, %r2
	.word 0x8aba0009  ! 874: XNORcc_R	xnorcc 	%r8, %r9, %r5
	.word 0xb1641809  ! 874: MOVcc_R	<illegal instruction>
	.word 0xb6422844  ! 874: ADDC_I	addc 	%r8, 0x0844, %r27
	.word 0xa13a2001  ! 874: SRA_I	sra 	%r8, 0x0001, %r16
	.word 0x8c1a2658  ! 874: XOR_I	xor 	%r8, 0x0658, %r6
	.word 0x82aa0009  ! 874: ANDNcc_R	andncc 	%r8, %r9, %r1
	.word 0x8a022e08  ! 874: ADD_I	add 	%r8, 0x0e08, %r5
	.word 0xa53a3001  ! 874: SRAX_I	srax	%r8, 0x0001, %r18
	.word 0x8ca222c8  ! 874: SUBcc_I	subcc 	%r8, 0x02c8, %r6
	.word 0x96022cbc  ! 874: ADD_I	add 	%r8, 0x0cbc, %r11
	.word 0x8c3a0009  ! 874: XNOR_R	xnor 	%r8, %r9, %r6
	.word 0x8b2a0009  ! 874: SLL_R	sll 	%r8, %r9, %r5
	.word 0x8e022988  ! 874: ADD_I	add 	%r8, 0x0988, %r7
	.word 0x8a9a0009  ! 874: XORcc_R	xorcc 	%r8, %r9, %r5
	.word 0x8cc20009  ! 874: ADDCcc_R	addccc 	%r8, %r9, %r6
	.word 0xc6720009  ! 884: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc8120009  ! 884: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0x8cf22d74  ! 884: UDIVcc_I	udivcc 	%r8, 0x0d74, %r6
	.word 0x88fa25d4  ! 884: SDIVcc_I	sdivcc 	%r8, 0x05d4, %r4
	.word 0xd9220009  ! 889: STF_R	st	%f12, [%r9, %r8]
	.word 0xce020009  ! 889: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0x987a2b08  ! 889: SDIV_I	sdiv 	%r8, 0x0b08, %r12
	.word 0x8c72286c  ! 889: UDIV_I	udiv 	%r8, 0x086c, %r6
	.word 0xb0c20009  ! 891: ADDCcc_R	addccc 	%r8, %r9, %r24
	.word 0x89643801  ! 891: MOVcc_I	<illegal instruction>
	.word 0x84420009  ! 891: ADDC_R	addc 	%r8, %r9, %r2
	.word 0x8e2a22c4  ! 891: ANDN_I	andn 	%r8, 0x02c4, %r7
	.word 0xb01a0009  ! 891: XOR_R	xor 	%r8, %r9, %r24
	.word 0x88322398  ! 891: ORN_I	orn 	%r8, 0x0398, %r4
	.word 0x8a1226e0  ! 891: OR_I	or 	%r8, 0x06e0, %r5
	.word 0xb7322001  ! 891: SRL_I	srl 	%r8, 0x0001, %r27
	.word 0xa8420009  ! 891: ADDC_R	addc 	%r8, %r9, %r20
	.word 0x8a020009  ! 891: ADD_R	add 	%r8, %r9, %r5
	.word 0x8a1a29b0  ! 891: XOR_I	xor 	%r8, 0x09b0, %r5
	.word 0x85782401  ! 891: MOVR_I	move	%r0, 0x9b0, %r2
	.word 0xc42a0009  ! 897: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xcc4a0009  ! 897: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xbe7a0009  ! 897: SDIV_R	sdiv 	%r8, %r9, %r31
	.word 0x856a0009  ! 897: SDIVX_R	sdivx	%r8, %r9, %r2
	.word 0xb8b20009  ! 900: SUBCcc_R	orncc 	%r8, %r9, %r28
	.word 0x84aa25cc  ! 900: ANDNcc_I	andncc 	%r8, 0x05cc, %r2
	.word 0x9a0a0009  ! 900: AND_R	and 	%r8, %r9, %r13
	.word 0x84c20009  ! 900: ADDCcc_R	addccc 	%r8, %r9, %r2
	.word 0x8d643801  ! 900: MOVcc_I	<illegal instruction>
	.word 0x872a0009  ! 900: SLL_R	sll 	%r8, %r9, %r3
	.word 0x8ac224a4  ! 900: ADDCcc_I	addccc 	%r8, 0x04a4, %r5
	.word 0x8eaa0009  ! 900: ANDNcc_R	andncc 	%r8, %r9, %r7
	.word 0x8c2a2dc8  ! 900: ANDN_I	andn 	%r8, 0x0dc8, %r6
	.word 0x9c422518  ! 900: ADDC_I	addc 	%r8, 0x0518, %r14
	.word 0xb0122258  ! 900: OR_I	or 	%r8, 0x0258, %r24
	.word 0x8242257c  ! 900: ADDC_I	addc 	%r8, 0x057c, %r1
	.word 0x84320009  ! 900: SUBC_R	orn 	%r8, %r9, %r2
	.word 0x32800002  ! 902: BNE	bne,a	<label_0x2>
	.word 0x826a2aec  ! 902: UDIVX_I	udivx 	%r8, 0x0aec, %r1
	.word 0x00800001  ! 905: BN	bn  	<label_0x1>
	.word 0x886a2b7c  ! 905: UDIVX_I	udivx 	%r8, 0x0b7c, %r4
	.word 0x8d323001  ! 908: SRLX_I	srlx	%r8, 0x0001, %r6
	.word 0x961a2040  ! 908: XOR_I	xor 	%r8, 0x0040, %r11
	.word 0x8f323001  ! 908: SRLX_I	srlx	%r8, 0x0001, %r7
	.word 0x86320009  ! 908: SUBC_R	orn 	%r8, %r9, %r3
	.word 0xaa8a21e0  ! 908: ANDcc_I	andcc 	%r8, 0x01e0, %r21
	.word 0xa2920009  ! 908: ORcc_R	orcc 	%r8, %r9, %r17
	.word 0x83322001  ! 908: SRL_I	srl 	%r8, 0x0001, %r1
	.word 0x89643801  ! 908: MOVcc_I	<illegal instruction>
	.word 0x86422920  ! 908: ADDC_I	addc 	%r8, 0x0920, %r3
	.word 0xad2a0009  ! 908: SLL_R	sll 	%r8, %r9, %r22
	.word 0xc3220009  ! 913: STF_R	st	%f1, [%r9, %r8]
	.word 0xfc120009  ! 913: LDUH_R	lduh	[%r8 + %r9], %r30
	.word 0x84720009  ! 913: UDIV_R	udiv 	%r8, %r9, %r2
	.word 0x8c720009  ! 913: UDIV_R	udiv 	%r8, %r9, %r6
	.word 0x8cc20009  ! 916: ADDCcc_R	addccc 	%r8, %r9, %r6
	.word 0x84922154  ! 916: ORcc_I	orcc 	%r8, 0x0154, %r2
	.word 0xb6320009  ! 916: ORN_R	orn 	%r8, %r9, %r27
	.word 0x848a0009  ! 916: ANDcc_R	andcc 	%r8, %r9, %r2
	.word 0xbd3a2001  ! 916: SRA_I	sra 	%r8, 0x0001, %r30
	.word 0x88aa2c60  ! 916: ANDNcc_I	andncc 	%r8, 0x0c60, %r4
	.word 0x869a0009  ! 916: XORcc_R	xorcc 	%r8, %r9, %r3
	.word 0x8e2223c8  ! 916: SUB_I	sub 	%r8, 0x03c8, %r7
	.word 0x84820009  ! 916: ADDcc_R	addcc 	%r8, %r9, %r2
	.word 0x83782401  ! 916: MOVR_I	move	%r0, 0x9, %r1
	.word 0x968a0009  ! 916: ANDcc_R	andcc 	%r8, %r9, %r11
	.word 0xb2b22168  ! 916: SUBCcc_I	orncc 	%r8, 0x0168, %r25
	.word 0x8ea20009  ! 916: SUBcc_R	subcc 	%r8, %r9, %r7
	.word 0x8a320009  ! 916: ORN_R	orn 	%r8, %r9, %r5
	.word 0xaf3a1009  ! 916: SRAX_R	srax	%r8, %r9, %r23
	.word 0x8e9a0009  ! 917: XORcc_R	xorcc 	%r8, %r9, %r7
	.word 0x8c3a0009  ! 917: XNOR_R	xnor 	%r8, %r9, %r6
	.word 0x842a2828  ! 917: ANDN_I	andn 	%r8, 0x0828, %r2
	.word 0x84aa0009  ! 917: ANDNcc_R	andncc 	%r8, %r9, %r2
	.word 0x8e1a2244  ! 917: XOR_I	xor 	%r8, 0x0244, %r7
	.word 0xb2ba2360  ! 917: XNORcc_I	xnorcc 	%r8, 0x0360, %r25
	.word 0x9a420009  ! 917: ADDC_R	addc 	%r8, %r9, %r13
	.word 0x82a22234  ! 917: SUBcc_I	subcc 	%r8, 0x0234, %r1
	.word 0x89780409  ! 917: MOVR_R	move	%r0, %r9, %r4
	.word 0x87780409  ! 917: MOVR_R	move	%r0, %r9, %r3
	.word 0x87323001  ! 917: SRLX_I	srlx	%r8, 0x0001, %r3
	.word 0xc33a0009  ! 922: STDF_R	std	%f1, [%r9, %r8]
	.word 0xcb020009  ! 922: LDF_R	ld	[%r8, %r9], %f5
	.word 0x836a2890  ! 922: SDIVX_I	sdivx	%r8, 0x0890, %r1
	.word 0x886a0009  ! 922: UDIVX_R	udivx 	%r8, %r9, %r4
	.word 0x2c800001  ! 925: BNEG	bneg,a	<label_0x1>
	.word 0x9cfa0009  ! 925: SDIVcc_R	sdivcc 	%r8, %r9, %r14
	.word 0xbd643801  ! 926: MOVcc_I	<illegal instruction>
	.word 0x943a0009  ! 926: XNOR_R	xnor 	%r8, %r9, %r10
	.word 0x88a20009  ! 926: SUBcc_R	subcc 	%r8, %r9, %r4
	.word 0x84820009  ! 926: ADDcc_R	addcc 	%r8, %r9, %r2
	.word 0xb48222fc  ! 926: ADDcc_I	addcc 	%r8, 0x02fc, %r26
	.word 0x82b20009  ! 926: SUBCcc_R	orncc 	%r8, %r9, %r1
	.word 0x84120009  ! 926: OR_R	or 	%r8, %r9, %r2
	.word 0x88322e64  ! 926: SUBC_I	orn 	%r8, 0x0e64, %r4
	.word 0x85320009  ! 926: SRL_R	srl 	%r8, %r9, %r2
	.word 0x88a22650  ! 926: SUBcc_I	subcc 	%r8, 0x0650, %r4
	.word 0xa3643801  ! 926: MOVcc_I	<illegal instruction>
	.word 0x84b22d38  ! 926: ORNcc_I	orncc 	%r8, 0x0d38, %r2
	.word 0x96020009  ! 926: ADD_R	add 	%r8, %r9, %r11
	.word 0x06800001  ! 930: BL	bl  	<label_0x1>
	.word 0x88720009  ! 930: UDIV_R	udiv 	%r8, %r9, %r4
	.word 0xc2220009  ! 934: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xce120009  ! 934: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xbefa2884  ! 934: SDIVcc_I	sdivcc 	%r8, 0x0884, %r31
	.word 0x82f20009  ! 934: UDIVcc_R	udivcc 	%r8, %r9, %r1
	.word 0x20800002  ! 937: BN	bn,a	<label_0x2>
	.word 0x886a0009  ! 937: UDIVX_R	udivx 	%r8, %r9, %r4
	.word 0xf6320009  ! 942: STH_R	sth	%r27, [%r8 + %r9]
	.word 0xc25a0009  ! 942: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xce120009  ! 942: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0x86722454  ! 942: UDIV_I	udiv 	%r8, 0x0454, %r3
	.word 0xc6220009  ! 947: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xf25a0009  ! 947: LDX_R	ldx	[%r8 + %r9], %r25
	.word 0x8a220009  ! 947: SUB_R	sub 	%r8, %r9, %r5
	.word 0xaa7a0009  ! 947: SDIV_R	sdiv 	%r8, %r9, %r21
	.word 0x04800001  ! 950: BLE	ble  	<label_0x1>
	.word 0xb06a0009  ! 950: UDIVX_R	udivx 	%r8, %r9, %r24
	.word 0xc73a0009  ! 955: STDF_R	std	%f3, [%r9, %r8]
	.word 0xf20a0009  ! 955: LDUB_R	ldub	[%r8 + %r9], %r25
	.word 0xf0522184  ! 955: LDSH_I	ldsh	[%r8 + 0x0184], %r24
	.word 0x88f223dc  ! 955: UDIVcc_I	udivcc 	%r8, 0x03dc, %r4
	.word 0x8b782401  ! 956: MOVR_I	move	%r0, 0xffffff68, %r5
	.word 0x9d2a2001  ! 956: SLL_I	sll 	%r8, 0x0001, %r14
	.word 0x8c0a0009  ! 956: AND_R	and 	%r8, %r9, %r6
	.word 0x84b2268c  ! 956: SUBCcc_I	orncc 	%r8, 0x068c, %r2
	.word 0x8eaa0009  ! 956: ANDNcc_R	andncc 	%r8, %r9, %r7
	.word 0x84b22e6c  ! 956: ORNcc_I	orncc 	%r8, 0x0e6c, %r2
	.word 0x82820009  ! 956: ADDcc_R	addcc 	%r8, %r9, %r1
	.word 0xac0a2b6c  ! 956: AND_I	and 	%r8, 0x0b6c, %r22
	.word 0x82320009  ! 956: SUBC_R	orn 	%r8, %r9, %r1
	.word 0x8c8a0009  ! 956: ANDcc_R	andcc 	%r8, %r9, %r6
	.word 0x8c122be0  ! 956: OR_I	or 	%r8, 0x0be0, %r6
	.word 0x893a0009  ! 956: SRA_R	sra 	%r8, %r9, %r4
	.word 0xac2a21fc  ! 956: ANDN_I	andn 	%r8, 0x01fc, %r22
	.word 0x8ec22acc  ! 956: ADDCcc_I	addccc 	%r8, 0x0acc, %r7
	.word 0x8f643801  ! 956: MOVcc_I	<illegal instruction>
	.word 0x14800001  ! 961: BG	bg  	<label_0x1>
	.word 0x9a6a2ce8  ! 961: UDIVX_I	udivx 	%r8, 0x0ce8, %r13
	.word 0x38800002  ! 963: BGU	bgu,a	<label_0x2>
	.word 0x996a29b8  ! 963: SDIVX_I	sdivx	%r8, 0x09b8, %r12
	.word 0x8e220009  ! 965: SUB_R	sub 	%r8, %r9, %r7
	.word 0x82320009  ! 965: ORN_R	orn 	%r8, %r9, %r1
	.word 0x8b2a1009  ! 965: SLLX_R	sllx	%r8, %r9, %r5
	.word 0x8a42217c  ! 965: ADDC_I	addc 	%r8, 0x017c, %r5
	.word 0x8f782401  ! 965: MOVR_I	move	%r0, 0x17c, %r7
	.word 0x82b22db0  ! 965: ORNcc_I	orncc 	%r8, 0x0db0, %r1
	.word 0x84a20009  ! 965: SUBcc_R	subcc 	%r8, %r9, %r2
	.word 0xb8920009  ! 965: ORcc_R	orcc 	%r8, %r9, %r28
	.word 0x84b20009  ! 965: SUBCcc_R	orncc 	%r8, %r9, %r2
	.word 0x868a229c  ! 965: ANDcc_I	andcc 	%r8, 0x029c, %r3
	.word 0x883221d0  ! 965: SUBC_I	orn 	%r8, 0x01d0, %r4
	.word 0xbb2a2001  ! 965: SLL_I	sll 	%r8, 0x0001, %r29
	.word 0x8ab20009  ! 965: SUBCcc_R	orncc 	%r8, %r9, %r5
	.word 0x8c322dd0  ! 965: ORN_I	orn 	%r8, 0x0dd0, %r6
	.word 0x881a290c  ! 967: XOR_I	xor 	%r8, 0x090c, %r4
	.word 0xbc120009  ! 967: OR_R	or 	%r8, %r9, %r30
	.word 0xa8c20009  ! 967: ADDCcc_R	addccc 	%r8, %r9, %r20
	.word 0xb21a2e44  ! 967: XOR_I	xor 	%r8, 0x0e44, %r25
	.word 0x85320009  ! 967: SRL_R	srl 	%r8, %r9, %r2
	.word 0xb83a2d38  ! 967: XNOR_I	xnor 	%r8, 0x0d38, %r28
	.word 0x9e020009  ! 967: ADD_R	add 	%r8, %r9, %r15
	.word 0xa6c20009  ! 967: ADDCcc_R	addccc 	%r8, %r9, %r19
	.word 0x863a0009  ! 967: XNOR_R	xnor 	%r8, %r9, %r3
	.word 0x9b3a1009  ! 967: SRAX_R	srax	%r8, %r9, %r13
	.word 0x9b641809  ! 967: MOVcc_R	<illegal instruction>
	.word 0xab2a3001  ! 967: SLLX_I	sllx	%r8, 0x0001, %r21
	.word 0x82922764  ! 968: ORcc_I	orcc 	%r8, 0x0764, %r1
	.word 0xb4320009  ! 968: SUBC_R	orn 	%r8, %r9, %r26
	.word 0x84420009  ! 968: ADDC_R	addc 	%r8, %r9, %r2
	.word 0x941a25e0  ! 968: XOR_I	xor 	%r8, 0x05e0, %r10
	.word 0x8e9a2e3c  ! 968: XORcc_I	xorcc 	%r8, 0x0e3c, %r7
	.word 0x8d2a2001  ! 968: SLL_I	sll 	%r8, 0x0001, %r6
	.word 0x84aa2cd4  ! 968: ANDNcc_I	andncc 	%r8, 0x0cd4, %r2
	.word 0x88820009  ! 968: ADDcc_R	addcc 	%r8, %r9, %r4
	.word 0xb01a21cc  ! 968: XOR_I	xor 	%r8, 0x01cc, %r24
	.word 0x85321009  ! 968: SRLX_R	srlx	%r8, %r9, %r2
	.word 0x9b3a1009  ! 968: SRAX_R	srax	%r8, %r9, %r13
	.word 0xb40a2000  ! 968: AND_I	and 	%r8, 0x0000, %r26
	.word 0x82b20009  ! 968: SUBCcc_R	orncc 	%r8, %r9, %r1
	.word 0x86aa0009  ! 968: ANDNcc_R	andncc 	%r8, %r9, %r3
	.word 0x8f322001  ! 969: SRL_I	srl 	%r8, 0x0001, %r7
	.word 0x848a2a2c  ! 969: ANDcc_I	andcc 	%r8, 0x0a2c, %r2
	.word 0x8e2a2688  ! 969: ANDN_I	andn 	%r8, 0x0688, %r7
	.word 0x96122c74  ! 969: OR_I	or 	%r8, 0x0c74, %r11
	.word 0x8e3a24fc  ! 969: XNOR_I	xnor 	%r8, 0x04fc, %r7
	.word 0x8cba0009  ! 969: XNORcc_R	xnorcc 	%r8, %r9, %r6
	.word 0x84020009  ! 969: ADD_R	add 	%r8, %r9, %r2
	.word 0x88020009  ! 969: ADD_R	add 	%r8, %r9, %r4
	.word 0x82220009  ! 969: SUB_R	sub 	%r8, %r9, %r1
	.word 0xb33a0009  ! 969: SRA_R	sra 	%r8, %r9, %r25
	.word 0x8d2a1009  ! 970: SLLX_R	sllx	%r8, %r9, %r6
	.word 0x94b22c58  ! 970: ORNcc_I	orncc 	%r8, 0x0c58, %r10
	.word 0x88ba2830  ! 970: XNORcc_I	xnorcc 	%r8, 0x0830, %r4
	.word 0x82aa0009  ! 970: ANDNcc_R	andncc 	%r8, %r9, %r1
	.word 0x88ba0009  ! 970: XNORcc_R	xnorcc 	%r8, %r9, %r4
	.word 0x9cb20009  ! 970: SUBCcc_R	orncc 	%r8, %r9, %r14
	.word 0xa68221bc  ! 970: ADDcc_I	addcc 	%r8, 0x01bc, %r19
	.word 0x873a3001  ! 970: SRAX_I	srax	%r8, 0x0001, %r3
	.word 0x861a0009  ! 970: XOR_R	xor 	%r8, %r9, %r3
	.word 0x84a20009  ! 970: SUBcc_R	subcc 	%r8, %r9, %r2
	.word 0x849a2998  ! 970: XORcc_I	xorcc 	%r8, 0x0998, %r2
	.word 0x82a22ba4  ! 970: SUBcc_I	subcc 	%r8, 0x0ba4, %r1
	.word 0x86820009  ! 970: ADDcc_R	addcc 	%r8, %r9, %r3
	.word 0x9e92216c  ! 970: ORcc_I	orcc 	%r8, 0x016c, %r15
	.word 0x8e2a2b58  ! 970: ANDN_I	andn 	%r8, 0x0b58, %r7
	.word 0x04c20001  ! 973: BRLEZ	brlez  ,nt	%8,<label_0x20001>
	.word 0x8c7a2714  ! 973: SDIV_I	sdiv 	%r8, 0x0714, %r6
	.word 0x84b20009  ! 975: SUBCcc_R	orncc 	%r8, %r9, %r2
	.word 0x881a0009  ! 975: XOR_R	xor 	%r8, %r9, %r4
	.word 0x84ba0009  ! 975: XNORcc_R	xnorcc 	%r8, %r9, %r2
	.word 0x9a220009  ! 975: SUB_R	sub 	%r8, %r9, %r13
	.word 0x88820009  ! 975: ADDcc_R	addcc 	%r8, %r9, %r4
	.word 0x853a0009  ! 975: SRA_R	sra 	%r8, %r9, %r2
	.word 0x96b20009  ! 975: SUBCcc_R	orncc 	%r8, %r9, %r11
	.word 0x84aa2224  ! 975: ANDNcc_I	andncc 	%r8, 0x0224, %r2
	.word 0x85782401  ! 975: MOVR_I	move	%r0, 0xfffffe24, %r2
	.word 0x82b22564  ! 975: SUBCcc_I	orncc 	%r8, 0x0564, %r1
	.word 0x8ab20009  ! 975: ORNcc_R	orncc 	%r8, %r9, %r5
	.word 0x8e320009  ! 975: ORN_R	orn 	%r8, %r9, %r7
	.word 0xbc2a2984  ! 975: ANDN_I	andn 	%r8, 0x0984, %r30
	.word 0x04800002  ! 977: BLE	ble  	<label_0x2>
	.word 0x8a7a0009  ! 977: SDIV_R	sdiv 	%r8, %r9, %r5
	.word 0xc6720009  ! 982: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xd6020009  ! 982: LDUW_R	lduw	[%r8 + %r9], %r11
	.word 0x847225a0  ! 982: UDIV_I	udiv 	%r8, 0x05a0, %r2
	.word 0x896a2aa4  ! 982: SDIVX_I	sdivx	%r8, 0x0aa4, %r4
	.word 0x86322548  ! 986: ORN_I	orn 	%r8, 0x0548, %r3
	.word 0x88020009  ! 986: ADD_R	add 	%r8, %r9, %r4
	.word 0x8c922a2c  ! 986: ORcc_I	orcc 	%r8, 0x0a2c, %r6
	.word 0x8aba2cc8  ! 986: XNORcc_I	xnorcc 	%r8, 0x0cc8, %r5
	.word 0x8b780409  ! 986: MOVR_R	move	%r0, %r9, %r5
	.word 0x84aa0009  ! 986: ANDNcc_R	andncc 	%r8, %r9, %r2
	.word 0x833a3001  ! 986: SRAX_I	srax	%r8, 0x0001, %r1
	.word 0x8d320009  ! 986: SRL_R	srl 	%r8, %r9, %r6
	.word 0x860a0009  ! 986: AND_R	and 	%r8, %r9, %r3
	.word 0x8ab20009  ! 986: ORNcc_R	orncc 	%r8, %r9, %r5
	.word 0x89643801  ! 986: MOVcc_I	<illegal instruction>
	.word 0x89780409  ! 986: MOVR_R	move	%r0, %r9, %r4
	.word 0x8d3a0009  ! 986: SRA_R	sra 	%r8, %r9, %r6
	.word 0xa8822034  ! 986: ADDcc_I	addcc 	%r8, 0x0034, %r20
	.word 0x982a0009  ! 986: ANDN_R	andn 	%r8, %r9, %r12
	.word 0xde220009  ! 990: STW_R	stw	%r15, [%r8 + %r9]
	.word 0xc25a0009  ! 990: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xacf224dc  ! 990: UDIVcc_I	udivcc 	%r8, 0x04dc, %r22
	.word 0x8e6a0009  ! 990: UDIVX_R	udivx 	%r8, %r9, %r7
	.word 0xc3220009  ! 994: STF_R	st	%f1, [%r9, %r8]
	.word 0xe81a0009  ! 994: LDD_R	ldd	[%r8 + %r9], %r20
	.word 0x88fa277c  ! 994: SDIVcc_I	sdivcc 	%r8, 0x077c, %r4
	.word 0xaafa2060  ! 994: SDIVcc_I	sdivcc 	%r8, 0x0060, %r21
	.word 0xc9220009  ! 998: STF_R	st	%f4, [%r9, %r8]
	.word 0xd45a0009  ! 998: LDX_R	ldx	[%r8 + %r9], %r10
	.word 0xaa7a2c00  ! 998: SDIV_I	sdiv 	%r8, 0x0c00, %r21
	.word 0x8c6a0009  ! 998: UDIVX_R	udivx 	%r8, %r9, %r6
	nop
	nop
	nop
        ta      T_GOOD_TRAP

th_main_2:
        setx  MAIN_BASE_DATA_VA, %r1, %r8
        setx  0x0000000000000000, %g1, %r9
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
        setx  0x0c51cfcf9d57f32c, %g1, %r0
        setx  0xf46b0705ac9087bc, %g1, %r1
        setx  0xadfcd966617ae86a, %g1, %r2
        setx  0x0fcc4658daf29213, %g1, %r3
        setx  0xff0451eb3c8e5463, %g1, %r4
        setx  0xed94271f38f0e1bb, %g1, %r5
        setx  0x5ced1245b1f3df55, %g1, %r6
        setx  0xfdbd2a2cabf1992d, %g1, %r7
        setx  0x83f9a6ae31e8ac51, %g1, %r10
        setx  0x35a289757330f770, %g1, %r11
        setx  0xf002fb2d16d83a6a, %g1, %r12
        setx  0xe9c01fd1a5cfcbbe, %g1, %r13
        setx  0xe8fa26872e6ef502, %g1, %r14
        setx  0x97bb62c49e7bbf8d, %g1, %r15
        setx  0x35a0e5f5a4b11afe, %g1, %r16
        setx  0x44737f7c730e402e, %g1, %r17
        setx  0xec12ac101c91c309, %g1, %r18
        setx  0xee3be91b14775be9, %g1, %r19
        setx  0x7d4259b85fa2a4df, %g1, %r20
        setx  0x0a92956dcbeb1ace, %g1, %r21
        setx  0xe935e1b3d31f58b1, %g1, %r22
        setx  0xe12f6842e9231ca3, %g1, %r23
        setx  0xda614dfec9fdf539, %g1, %r24
        setx  0x764a60dc4dfe08c2, %g1, %r25
        setx  0xa8f321d83aa29542, %g1, %r26
        setx  0xc9a5797f00972f8f, %g1, %r27
        setx  0x5821c091648996a5, %g1, %r28
        setx  0xd4d8babfac116b82, %g1, %r29
        setx  0x5afe8fb30bb3f02c, %g1, %r30
        setx  0x57305e358d4bc4b8, %g1, %r31
	.word 0x16800001  ! 7: BGE	bge  	<label_0x1>
	.word 0x9f6a22f0  ! 7: SDIVX_I	sdivx	%r8, 0x02f0, %r15
	.word 0x0c800001  ! 13: BNEG	bneg  	<label_0x1>
	.word 0x88fa0009  ! 13: SDIVcc_R	sdivcc 	%r8, %r9, %r4
	.word 0x38800001  ! 15: BGU	bgu,a	<label_0x1>
	.word 0xbc7222a0  ! 15: UDIV_I	udiv 	%r8, 0x02a0, %r30
	.word 0x02800002  ! 17: BE	be  	<label_0x2>
	.word 0x8af22e98  ! 17: UDIVcc_I	udivcc 	%r8, 0x0e98, %r5
	.word 0x04800001  ! 19: BLE	ble  	<label_0x1>
	.word 0x886a2c6c  ! 19: UDIVX_I	udivx 	%r8, 0x0c6c, %r4
	.word 0xad643801  ! 20: MOVcc_I	<illegal instruction>
	.word 0x84b20009  ! 20: SUBCcc_R	orncc 	%r8, %r9, %r2
	.word 0x8d2a2001  ! 20: SLL_I	sll 	%r8, 0x0001, %r6
	.word 0xb93a1009  ! 20: SRAX_R	srax	%r8, %r9, %r28
	.word 0x8c3a2c6c  ! 20: XNOR_I	xnor 	%r8, 0x0c6c, %r6
	.word 0x832a0009  ! 20: SLL_R	sll 	%r8, %r9, %r1
	.word 0x8ea20009  ! 20: SUBcc_R	subcc 	%r8, %r9, %r7
	.word 0x8d323001  ! 20: SRLX_I	srlx	%r8, 0x0001, %r6
	.word 0x8eb20009  ! 20: SUBCcc_R	orncc 	%r8, %r9, %r7
	.word 0x8f782401  ! 20: MOVR_I	move	%r0, 0x9, %r7
	.word 0x82b22f20  ! 20: SUBCcc_I	orncc 	%r8, 0x0f20, %r1
	.word 0x820a25a4  ! 20: AND_I	and 	%r8, 0x05a4, %r1
	.word 0xb82223dc  ! 20: SUB_I	sub 	%r8, 0x03dc, %r28
	.word 0x8822230c  ! 20: SUB_I	sub 	%r8, 0x030c, %r4
	.word 0xce2a0009  ! 24: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xea520009  ! 24: LDSH_R	ldsh	[%r8 + %r9], %r21
	.word 0x8a122c24  ! 24: OR_I	or 	%r8, 0x0c24, %r5
	.word 0xb86a2234  ! 24: UDIVX_I	udivx 	%r8, 0x0234, %r28
	.word 0x12800001  ! 26: BNE	bne  	<label_0x1>
	.word 0x8c720009  ! 26: UDIV_R	udiv 	%r8, %r9, %r6
	.word 0x04800001  ! 28: BLE	ble  	<label_0x1>
	.word 0x88720009  ! 28: UDIV_R	udiv 	%r8, %r9, %r4
	.word 0x82420009  ! 30: ADDC_R	addc 	%r8, %r9, %r1
	.word 0x9d2a2001  ! 30: SLL_I	sll 	%r8, 0x0001, %r14
	.word 0xaa2a0009  ! 30: ANDN_R	andn 	%r8, %r9, %r21
	.word 0x833a2001  ! 30: SRA_I	sra 	%r8, 0x0001, %r1
	.word 0x86020009  ! 30: ADD_R	add 	%r8, %r9, %r3
	.word 0x8eb220c0  ! 30: SUBCcc_I	orncc 	%r8, 0x00c0, %r7
	.word 0xb41a2090  ! 30: XOR_I	xor 	%r8, 0x0090, %r26
	.word 0x880a2fac  ! 30: AND_I	and 	%r8, 0x0fac, %r4
	.word 0x86aa27ac  ! 30: ANDNcc_I	andncc 	%r8, 0x07ac, %r3
	.word 0x8a820009  ! 30: ADDcc_R	addcc 	%r8, %r9, %r5
	.word 0x8f323001  ! 30: SRLX_I	srlx	%r8, 0x0001, %r7
	.word 0x02ca0001  ! 32: BRZ	brz  ,pt	%8,<label_0xa0001>
	.word 0x84f222a8  ! 32: UDIVcc_I	udivcc 	%r8, 0x02a8, %r2
	.word 0xc42a0009  ! 40: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xcc0a0009  ! 40: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xe3020009  ! 40: LDF_R	ld	[%r8, %r9], %f17
	.word 0x8c7a0009  ! 40: SDIV_R	sdiv 	%r8, %r9, %r6
	.word 0x3a800001  ! 44: BCC	bcc,a	<label_0x1>
	.word 0x836a242c  ! 44: SDIVX_I	sdivx	%r8, 0x042c, %r1
	.word 0x22800001  ! 48: BE	be,a	<label_0x1>
	.word 0xb47228b0  ! 48: UDIV_I	udiv 	%r8, 0x08b0, %r26
	.word 0x8ac20009  ! 50: ADDCcc_R	addccc 	%r8, %r9, %r5
	.word 0x84820009  ! 50: ADDcc_R	addcc 	%r8, %r9, %r2
	.word 0xb2920009  ! 50: ORcc_R	orcc 	%r8, %r9, %r25
	.word 0x8a322240  ! 50: SUBC_I	orn 	%r8, 0x0240, %r5
	.word 0xbe320009  ! 50: ORN_R	orn 	%r8, %r9, %r31
	.word 0x888225c8  ! 50: ADDcc_I	addcc 	%r8, 0x05c8, %r4
	.word 0xb9323001  ! 50: SRLX_I	srlx	%r8, 0x0001, %r28
	.word 0xa29226c8  ! 50: ORcc_I	orcc 	%r8, 0x06c8, %r17
	.word 0x8c922d74  ! 50: ORcc_I	orcc 	%r8, 0x0d74, %r6
	.word 0x8c922f5c  ! 50: ORcc_I	orcc 	%r8, 0x0f5c, %r6
	.word 0x0a800001  ! 52: BCS	bcs  	<label_0x1>
	.word 0x896a0009  ! 52: SDIVX_R	sdivx	%r8, %r9, %r4
	.word 0x0a800001  ! 54: BCS	bcs  	<label_0x1>
	.word 0x847a0009  ! 54: SDIV_R	sdiv 	%r8, %r9, %r2
	.word 0xa41a2f3c  ! 55: XOR_I	xor 	%r8, 0x0f3c, %r18
	.word 0x828a2290  ! 55: ANDcc_I	andcc 	%r8, 0x0290, %r1
	.word 0x8c420009  ! 55: ADDC_R	addc 	%r8, %r9, %r6
	.word 0x881a2260  ! 55: XOR_I	xor 	%r8, 0x0260, %r4
	.word 0x8cb20009  ! 55: ORNcc_R	orncc 	%r8, %r9, %r6
	.word 0x872a2001  ! 55: SLL_I	sll 	%r8, 0x0001, %r3
	.word 0x823a22b0  ! 55: XNOR_I	xnor 	%r8, 0x02b0, %r1
	.word 0xb5322001  ! 55: SRL_I	srl 	%r8, 0x0001, %r26
	.word 0x88c20009  ! 55: ADDCcc_R	addccc 	%r8, %r9, %r4
	.word 0xb4b20009  ! 55: SUBCcc_R	orncc 	%r8, %r9, %r26
	.word 0x992a0009  ! 55: SLL_R	sll 	%r8, %r9, %r12
	.word 0x852a0009  ! 55: SLL_R	sll 	%r8, %r9, %r2
	.word 0xc42a0009  ! 59: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xee420009  ! 59: LDSW_R	ldsw	[%r8 + %r9], %r23
	.word 0x86fa2ed0  ! 59: SDIVcc_I	sdivcc 	%r8, 0x0ed0, %r3
	.word 0x88fa2a9c  ! 59: SDIVcc_I	sdivcc 	%r8, 0x0a9c, %r4
	.word 0xaa3227a0  ! 63: ORN_I	orn 	%r8, 0x07a0, %r21
	.word 0x86b20009  ! 63: SUBCcc_R	orncc 	%r8, %r9, %r3
	.word 0x9e320009  ! 63: ORN_R	orn 	%r8, %r9, %r15
	.word 0xb43226dc  ! 63: SUBC_I	orn 	%r8, 0x06dc, %r26
	.word 0x88820009  ! 63: ADDcc_R	addcc 	%r8, %r9, %r4
	.word 0x853a3001  ! 63: SRAX_I	srax	%r8, 0x0001, %r2
	.word 0xb0322fd0  ! 63: SUBC_I	orn 	%r8, 0x0fd0, %r24
	.word 0x94220009  ! 63: SUB_R	sub 	%r8, %r9, %r10
	.word 0xac8220a0  ! 63: ADDcc_I	addcc 	%r8, 0x00a0, %r22
	.word 0x8e320009  ! 63: SUBC_R	orn 	%r8, %r9, %r7
	.word 0x88820009  ! 63: ADDcc_R	addcc 	%r8, %r9, %r4
	.word 0x8eb20009  ! 63: SUBCcc_R	orncc 	%r8, %r9, %r7
	.word 0x1e800001  ! 66: BVC	bvc  	<label_0x1>
	.word 0xa87a2ff0  ! 66: SDIV_I	sdiv 	%r8, 0x0ff0, %r20
	.word 0xaaa20009  ! 68: SUBcc_R	subcc 	%r8, %r9, %r21
	.word 0x85782401  ! 68: MOVR_I	move	%r0, 0x9, %r2
	.word 0xb20a0009  ! 68: AND_R	and 	%r8, %r9, %r25
	.word 0x862a2984  ! 68: ANDN_I	andn 	%r8, 0x0984, %r3
	.word 0x8d3a2001  ! 68: SRA_I	sra 	%r8, 0x0001, %r6
	.word 0xbd322001  ! 68: SRL_I	srl 	%r8, 0x0001, %r30
	.word 0x8f323001  ! 68: SRLX_I	srlx	%r8, 0x0001, %r7
	.word 0x8d2a1009  ! 68: SLLX_R	sllx	%r8, %r9, %r6
	.word 0xb4ba0009  ! 68: XNORcc_R	xnorcc 	%r8, %r9, %r26
	.word 0x8e1223e0  ! 68: OR_I	or 	%r8, 0x03e0, %r7
	.word 0x8e022c24  ! 68: ADD_I	add 	%r8, 0x0c24, %r7
	.word 0xb8422cc4  ! 68: ADDC_I	addc 	%r8, 0x0cc4, %r28
	.word 0xbca20009  ! 68: SUBcc_R	subcc 	%r8, %r9, %r30
	.word 0x00800001  ! 72: BN	bn  	<label_0x1>
	.word 0x86fa0009  ! 72: SDIVcc_R	sdivcc 	%r8, %r9, %r3
	.word 0xae320009  ! 79: SUBC_R	orn 	%r8, %r9, %r23
	.word 0xba9a0009  ! 79: XORcc_R	xorcc 	%r8, %r9, %r29
	.word 0xb1641809  ! 79: MOVcc_R	<illegal instruction>
	.word 0xb21a0009  ! 79: XOR_R	xor 	%r8, %r9, %r25
	.word 0x873a0009  ! 79: SRA_R	sra 	%r8, %r9, %r3
	.word 0xb93a0009  ! 79: SRA_R	sra 	%r8, %r9, %r28
	.word 0x8cb20009  ! 79: ORNcc_R	orncc 	%r8, %r9, %r6
	.word 0x8d322001  ! 79: SRL_I	srl 	%r8, 0x0001, %r6
	.word 0x832a0009  ! 79: SLL_R	sll 	%r8, %r9, %r1
	.word 0x882a2d1c  ! 79: ANDN_I	andn 	%r8, 0x0d1c, %r4
	.word 0x87780409  ! 79: MOVR_R	move	%r0, %r9, %r3
	.word 0xae020009  ! 80: ADD_R	add 	%r8, %r9, %r23
	.word 0x852a0009  ! 80: SLL_R	sll 	%r8, %r9, %r2
	.word 0x8c3a2e5c  ! 80: XNOR_I	xnor 	%r8, 0x0e5c, %r6
	.word 0x8e322ee0  ! 80: ORN_I	orn 	%r8, 0x0ee0, %r7
	.word 0x828a23ec  ! 80: ANDcc_I	andcc 	%r8, 0x03ec, %r1
	.word 0x8b3a2001  ! 80: SRA_I	sra 	%r8, 0x0001, %r5
	.word 0x8cba0009  ! 80: XNORcc_R	xnorcc 	%r8, %r9, %r6
	.word 0x84a20009  ! 80: SUBcc_R	subcc 	%r8, %r9, %r2
	.word 0x98422c30  ! 80: ADDC_I	addc 	%r8, 0x0c30, %r12
	.word 0xb0a22e30  ! 80: SUBcc_I	subcc 	%r8, 0x0e30, %r24
	.word 0x841a22b8  ! 80: XOR_I	xor 	%r8, 0x02b8, %r2
	.word 0x88220009  ! 80: SUB_R	sub 	%r8, %r9, %r4
	.word 0x8f782401  ! 80: MOVR_I	move	%r0, 0x74, %r7
	.word 0x8e120009  ! 80: OR_R	or 	%r8, %r9, %r7
	.word 0x97322001  ! 80: SRL_I	srl 	%r8, 0x0001, %r11
	.word 0x868a2a48  ! 86: ANDcc_I	andcc 	%r8, 0x0a48, %r3
	.word 0xa69a0009  ! 86: XORcc_R	xorcc 	%r8, %r9, %r19
	.word 0x83782401  ! 86: MOVR_I	move	%r0, 0x9, %r1
	.word 0x8b321009  ! 86: SRLX_R	srlx	%r8, %r9, %r5
	.word 0x843a0009  ! 86: XNOR_R	xnor 	%r8, %r9, %r2
	.word 0x8a322040  ! 86: ORN_I	orn 	%r8, 0x0040, %r5
	.word 0x88920009  ! 86: ORcc_R	orcc 	%r8, %r9, %r4
	.word 0x8c8a23c4  ! 86: ANDcc_I	andcc 	%r8, 0x03c4, %r6
	.word 0x85780409  ! 86: MOVR_R	move	%r0, %r9, %r2
	.word 0x8a820009  ! 86: ADDcc_R	addcc 	%r8, %r9, %r5
	.word 0x8aa222a4  ! 88: SUBcc_I	subcc 	%r8, 0x02a4, %r5
	.word 0x8b321009  ! 88: SRLX_R	srlx	%r8, %r9, %r5
	.word 0x94320009  ! 88: SUBC_R	orn 	%r8, %r9, %r10
	.word 0x8c8a0009  ! 88: ANDcc_R	andcc 	%r8, %r9, %r6
	.word 0xb8aa0009  ! 88: ANDNcc_R	andncc 	%r8, %r9, %r28
	.word 0x89320009  ! 88: SRL_R	srl 	%r8, %r9, %r4
	.word 0x9c120009  ! 88: OR_R	or 	%r8, %r9, %r14
	.word 0x83321009  ! 88: SRLX_R	srlx	%r8, %r9, %r1
	.word 0xab320009  ! 88: SRL_R	srl 	%r8, %r9, %r21
	.word 0x86b20009  ! 88: SUBCcc_R	orncc 	%r8, %r9, %r3
	.word 0xa40a0009  ! 88: AND_R	and 	%r8, %r9, %r18
	.word 0xb03a0009  ! 88: XNOR_R	xnor 	%r8, %r9, %r24
	.word 0x8c920009  ! 88: ORcc_R	orcc 	%r8, %r9, %r6
	.word 0x20800001  ! 90: BN	bn,a	<label_0x1>
	.word 0x8a6a0009  ! 90: UDIVX_R	udivx 	%r8, %r9, %r5
	.word 0x0eca0001  ! 92: BRGEZ	brgez  ,pt	%8,<label_0xa0001>
	.word 0x8872280c  ! 92: UDIV_I	udiv 	%r8, 0x080c, %r4
	.word 0x94020009  ! 95: ADD_R	add 	%r8, %r9, %r10
	.word 0xb8ba0009  ! 95: XNORcc_R	xnorcc 	%r8, %r9, %r28
	.word 0x9a020009  ! 95: ADD_R	add 	%r8, %r9, %r13
	.word 0x9c3a23a0  ! 95: XNOR_I	xnor 	%r8, 0x03a0, %r14
	.word 0x8b2a2001  ! 95: SLL_I	sll 	%r8, 0x0001, %r5
	.word 0x843a0009  ! 95: XNOR_R	xnor 	%r8, %r9, %r2
	.word 0x8d320009  ! 95: SRL_R	srl 	%r8, %r9, %r6
	.word 0xa23a0009  ! 95: XNOR_R	xnor 	%r8, %r9, %r17
	.word 0x8aba0009  ! 95: XNORcc_R	xnorcc 	%r8, %r9, %r5
	.word 0x94b20009  ! 95: SUBCcc_R	orncc 	%r8, %r9, %r10
	.word 0xc93a0009  ! 100: STDF_R	std	%f4, [%r9, %r8]
	.word 0xe5020009  ! 100: LDF_R	ld	[%r8, %r9], %f18
	.word 0x852a2001  ! 100: SLL_I	sll 	%r8, 0x0001, %r2
	.word 0x8cf22d94  ! 100: UDIVcc_I	udivcc 	%r8, 0x0d94, %r6
	.word 0x842a0009  ! 104: ANDN_R	andn 	%r8, %r9, %r2
	.word 0x8d3a0009  ! 104: SRA_R	sra 	%r8, %r9, %r6
	.word 0x86ba2adc  ! 104: XNORcc_I	xnorcc 	%r8, 0x0adc, %r3
	.word 0xbe420009  ! 104: ADDC_R	addc 	%r8, %r9, %r31
	.word 0x8ab20009  ! 104: ORNcc_R	orncc 	%r8, %r9, %r5
	.word 0x86b20009  ! 104: ORNcc_R	orncc 	%r8, %r9, %r3
	.word 0x89782401  ! 104: MOVR_I	move	%r0, 0x9, %r4
	.word 0x84822fa0  ! 104: ADDcc_I	addcc 	%r8, 0x0fa0, %r2
	.word 0x82c22d88  ! 104: ADDCcc_I	addccc 	%r8, 0x0d88, %r1
	.word 0xaeb22fc4  ! 104: ORNcc_I	orncc 	%r8, 0x0fc4, %r23
	.word 0x8a820009  ! 104: ADDcc_R	addcc 	%r8, %r9, %r5
	.word 0x9d641809  ! 105: MOVcc_R	<illegal instruction>
	.word 0x8aaa2af0  ! 105: ANDNcc_I	andncc 	%r8, 0x0af0, %r5
	.word 0x9a020009  ! 105: ADD_R	add 	%r8, %r9, %r13
	.word 0x8c020009  ! 105: ADD_R	add 	%r8, %r9, %r6
	.word 0x8a1a21a4  ! 105: XOR_I	xor 	%r8, 0x01a4, %r5
	.word 0xa9641809  ! 105: MOVcc_R	<illegal instruction>
	.word 0x8c3224a0  ! 105: SUBC_I	orn 	%r8, 0x04a0, %r6
	.word 0x8e820009  ! 105: ADDcc_R	addcc 	%r8, %r9, %r7
	.word 0x94ba0009  ! 105: XNORcc_R	xnorcc 	%r8, %r9, %r10
	.word 0xacaa0009  ! 105: ANDNcc_R	andncc 	%r8, %r9, %r22
	.word 0x82322cec  ! 105: ORN_I	orn 	%r8, 0x0cec, %r1
	.word 0x0ac20001  ! 111: BRNZ	brnz  ,nt	%8,<label_0x20001>
	.word 0x8cf20009  ! 111: UDIVcc_R	udivcc 	%r8, %r9, %r6
	.word 0x8e122790  ! 113: OR_I	or 	%r8, 0x0790, %r7
	.word 0x869223b0  ! 113: ORcc_I	orcc 	%r8, 0x03b0, %r3
	.word 0xba922e7c  ! 113: ORcc_I	orcc 	%r8, 0x0e7c, %r29
	.word 0x8f782401  ! 113: MOVR_I	move	%r0, 0xfffffe7c, %r7
	.word 0x89643801  ! 113: MOVcc_I	<illegal instruction>
	.word 0xa0b2262c  ! 113: SUBCcc_I	orncc 	%r8, 0x062c, %r16
	.word 0xbeba0009  ! 113: XNORcc_R	xnorcc 	%r8, %r9, %r31
	.word 0x9e1a29cc  ! 113: XOR_I	xor 	%r8, 0x09cc, %r15
	.word 0x8aaa0009  ! 113: ANDNcc_R	andncc 	%r8, %r9, %r5
	.word 0x84c22478  ! 113: ADDCcc_I	addccc 	%r8, 0x0478, %r2
	.word 0x82b20009  ! 113: SUBCcc_R	orncc 	%r8, %r9, %r1
	.word 0x8a420009  ! 113: ADDC_R	addc 	%r8, %r9, %r5
	.word 0xcc320009  ! 123: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc6520009  ! 123: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0x827a0009  ! 123: SDIV_R	sdiv 	%r8, %r9, %r1
	.word 0xbe6a0009  ! 123: UDIVX_R	udivx 	%r8, %r9, %r31
	.word 0x2a800001  ! 127: BCS	bcs,a	<label_0x1>
	.word 0x86fa0009  ! 127: SDIVcc_R	sdivcc 	%r8, %r9, %r3
	.word 0x26ca0001  ! 131: BRLZ	brlz,a,pt	%8,<label_0xa0001>
	.word 0xa87a2c84  ! 131: SDIV_I	sdiv 	%r8, 0x0c84, %r20
	.word 0xac022b64  ! 132: ADD_I	add 	%r8, 0x0b64, %r22
	.word 0x853a2001  ! 132: SRA_I	sra 	%r8, 0x0001, %r2
	.word 0x893a1009  ! 132: SRAX_R	srax	%r8, %r9, %r4
	.word 0x8aa20009  ! 132: SUBcc_R	subcc 	%r8, %r9, %r5
	.word 0x8c322a64  ! 132: SUBC_I	orn 	%r8, 0x0a64, %r6
	.word 0x8f2a3001  ! 132: SLLX_I	sllx	%r8, 0x0001, %r7
	.word 0x860a23bc  ! 132: AND_I	and 	%r8, 0x03bc, %r3
	.word 0x88aa0009  ! 132: ANDNcc_R	andncc 	%r8, %r9, %r4
	.word 0x8ac20009  ! 132: ADDCcc_R	addccc 	%r8, %r9, %r5
	.word 0x8b3a3001  ! 132: SRAX_I	srax	%r8, 0x0001, %r5
	.word 0x8b322001  ! 132: SRL_I	srl 	%r8, 0x0001, %r5
	.word 0x84aa2004  ! 132: ANDNcc_I	andncc 	%r8, 0x0004, %r2
	.word 0x86b20009  ! 132: SUBCcc_R	orncc 	%r8, %r9, %r3
	.word 0x2a800001  ! 134: BCS	bcs,a	<label_0x1>
	.word 0xb67a0009  ! 134: SDIV_R	sdiv 	%r8, %r9, %r27
	.word 0x8e2a2f80  ! 135: ANDN_I	andn 	%r8, 0x0f80, %r7
	.word 0xa52a2001  ! 135: SLL_I	sll 	%r8, 0x0001, %r18
	.word 0x8f323001  ! 135: SRLX_I	srlx	%r8, 0x0001, %r7
	.word 0xaa422450  ! 135: ADDC_I	addc 	%r8, 0x0450, %r21
	.word 0x8e422ce4  ! 135: ADDC_I	addc 	%r8, 0x0ce4, %r7
	.word 0x94b20009  ! 135: SUBCcc_R	orncc 	%r8, %r9, %r10
	.word 0x9eaa0009  ! 135: ANDNcc_R	andncc 	%r8, %r9, %r15
	.word 0xbc820009  ! 135: ADDcc_R	addcc 	%r8, %r9, %r30
	.word 0xb0b20009  ! 135: SUBCcc_R	orncc 	%r8, %r9, %r24
	.word 0x840a2dc0  ! 135: AND_I	and 	%r8, 0x0dc0, %r2
	.word 0x852a0009  ! 135: SLL_R	sll 	%r8, %r9, %r2
	.word 0x87323001  ! 135: SRLX_I	srlx	%r8, 0x0001, %r3
	.word 0x82420009  ! 135: ADDC_R	addc 	%r8, %r9, %r1
	.word 0xbf2a0009  ! 135: SLL_R	sll 	%r8, %r9, %r31
	.word 0xa6aa0009  ! 135: ANDNcc_R	andncc 	%r8, %r9, %r19
	.word 0x22800002  ! 137: BE	be,a	<label_0x2>
	.word 0x8e6a0009  ! 137: UDIVX_R	udivx 	%r8, %r9, %r7
	.word 0x12800002  ! 139: BNE	bne  	<label_0x2>
	.word 0x8cfa0009  ! 139: SDIVcc_R	sdivcc 	%r8, %r9, %r6
	.word 0x869a0009  ! 141: XORcc_R	xorcc 	%r8, %r9, %r3
	.word 0x8c322698  ! 141: ORN_I	orn 	%r8, 0x0698, %r6
	.word 0x86820009  ! 141: ADDcc_R	addcc 	%r8, %r9, %r3
	.word 0xb3641809  ! 141: MOVcc_R	<illegal instruction>
	.word 0x86b22308  ! 141: ORNcc_I	orncc 	%r8, 0x0308, %r3
	.word 0x96c22688  ! 141: ADDCcc_I	addccc 	%r8, 0x0688, %r11
	.word 0x8e020009  ! 141: ADD_R	add 	%r8, %r9, %r7
	.word 0x8ec228d4  ! 141: ADDCcc_I	addccc 	%r8, 0x08d4, %r7
	.word 0x84a227dc  ! 141: SUBcc_I	subcc 	%r8, 0x07dc, %r2
	.word 0x82b22800  ! 141: ORNcc_I	orncc 	%r8, 0x0800, %r1
	.word 0x18800001  ! 145: BGU	bgu  	<label_0x1>
	.word 0x956a0009  ! 145: SDIVX_R	sdivx	%r8, %r9, %r10
	.word 0xf2320009  ! 152: STH_R	sth	%r25, [%r8 + %r9]
	.word 0xed1a0009  ! 152: LDDF_R	ldd	[%r8, %r9], %f22
	.word 0x98fa0009  ! 152: SDIVcc_R	sdivcc 	%r8, %r9, %r12
	.word 0x82f20009  ! 152: UDIVcc_R	udivcc 	%r8, %r9, %r1
	.word 0x24800001  ! 154: BLE	ble,a	<label_0x1>
	.word 0x8a7a0009  ! 154: SDIV_R	sdiv 	%r8, %r9, %r5
	.word 0x1c800002  ! 156: BPOS	bpos  	<label_0x2>
	.word 0x8e6a0009  ! 156: UDIVX_R	udivx 	%r8, %r9, %r7
	.word 0x40000001  ! 158: CALL	call	disp30_1
	.word 0x8cfa0009  ! 158: SDIVcc_R	sdivcc 	%r8, %r9, %r6
	.word 0x88220009  ! 159: SUB_R	sub 	%r8, %r9, %r4
	.word 0x88b22cd8  ! 159: ORNcc_I	orncc 	%r8, 0x0cd8, %r4
	.word 0x872a2001  ! 159: SLL_I	sll 	%r8, 0x0001, %r3
	.word 0x8ac20009  ! 159: ADDCcc_R	addccc 	%r8, %r9, %r5
	.word 0xad2a2001  ! 159: SLL_I	sll 	%r8, 0x0001, %r22
	.word 0x8c820009  ! 159: ADDcc_R	addcc 	%r8, %r9, %r6
	.word 0x82022ee8  ! 159: ADD_I	add 	%r8, 0x0ee8, %r1
	.word 0xa41a2844  ! 159: XOR_I	xor 	%r8, 0x0844, %r18
	.word 0x86aa2f94  ! 159: ANDNcc_I	andncc 	%r8, 0x0f94, %r3
	.word 0x84122670  ! 159: OR_I	or 	%r8, 0x0670, %r2
	.word 0x872a2001  ! 159: SLL_I	sll 	%r8, 0x0001, %r3
	.word 0x84c20009  ! 159: ADDCcc_R	addccc 	%r8, %r9, %r2
	.word 0x96a20009  ! 159: SUBcc_R	subcc 	%r8, %r9, %r11
	.word 0x20800001  ! 161: BN	bn,a	<label_0x1>
	.word 0x8f6a2be0  ! 161: SDIVX_I	sdivx	%r8, 0x0be0, %r7
	.word 0xe0320009  ! 165: STH_R	sth	%r16, [%r8 + %r9]
	.word 0xc81a0009  ! 165: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x8ef22548  ! 165: UDIVcc_I	udivcc 	%r8, 0x0548, %r7
	.word 0x8cfa21c4  ! 165: SDIVcc_I	sdivcc 	%r8, 0x01c4, %r6
	.word 0xce2a0009  ! 169: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc8520009  ! 169: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xb6b20009  ! 169: ORNcc_R	orncc 	%r8, %r9, %r27
	.word 0xb47a0009  ! 169: SDIV_R	sdiv 	%r8, %r9, %r26
	.word 0xdb220009  ! 176: STF_R	st	%f13, [%r9, %r8]
	.word 0xcc520009  ! 176: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0x8e7a0009  ! 176: SDIV_R	sdiv 	%r8, %r9, %r7
	.word 0x86f22924  ! 176: UDIVcc_I	udivcc 	%r8, 0x0924, %r3
	.word 0xce320009  ! 180: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xd7020009  ! 180: LDF_R	ld	[%r8, %r9], %f11
	.word 0x8f321009  ! 180: SRLX_R	srlx	%r8, %r9, %r7
	.word 0x986a0009  ! 180: UDIVX_R	udivx 	%r8, %r9, %r12
	.word 0xb40a2a94  ! 181: AND_I	and 	%r8, 0x0a94, %r26
	.word 0xbe222f78  ! 181: SUB_I	sub 	%r8, 0x0f78, %r31
	.word 0x828223f8  ! 181: ADDcc_I	addcc 	%r8, 0x03f8, %r1
	.word 0xa5320009  ! 181: SRL_R	srl 	%r8, %r9, %r18
	.word 0x821a0009  ! 181: XOR_R	xor 	%r8, %r9, %r1
	.word 0x980a0009  ! 181: AND_R	and 	%r8, %r9, %r12
	.word 0x8e120009  ! 181: OR_R	or 	%r8, %r9, %r7
	.word 0xbac20009  ! 181: ADDCcc_R	addccc 	%r8, %r9, %r29
	.word 0xb2322690  ! 181: SUBC_I	orn 	%r8, 0x0690, %r25
	.word 0x8ea226b4  ! 181: SUBcc_I	subcc 	%r8, 0x06b4, %r7
	.word 0xa6922cf0  ! 181: ORcc_I	orcc 	%r8, 0x0cf0, %r19
	.word 0x852a3001  ! 181: SLLX_I	sllx	%r8, 0x0001, %r2
	.word 0xc9220009  ! 189: STF_R	st	%f4, [%r9, %r8]
	.word 0xe6020009  ! 189: LDUW_R	lduw	[%r8 + %r9], %r19
	.word 0x823a0009  ! 189: XNOR_R	xnor 	%r8, %r9, %r1
	.word 0xa8722d7c  ! 189: UDIV_I	udiv 	%r8, 0x0d7c, %r20
	.word 0x18800001  ! 192: BGU	bgu  	<label_0x1>
	.word 0x82722c84  ! 192: UDIV_I	udiv 	%r8, 0x0c84, %r1
	.word 0x8c020009  ! 193: ADD_R	add 	%r8, %r9, %r6
	.word 0xb1323001  ! 193: SRLX_I	srlx	%r8, 0x0001, %r24
	.word 0x89641809  ! 193: MOVcc_R	<illegal instruction>
	.word 0x86c22dfc  ! 193: ADDCcc_I	addccc 	%r8, 0x0dfc, %r3
	.word 0x9c0a2d94  ! 193: AND_I	and 	%r8, 0x0d94, %r14
	.word 0xaa120009  ! 193: OR_R	or 	%r8, %r9, %r21
	.word 0x888a0009  ! 193: ANDcc_R	andcc 	%r8, %r9, %r4
	.word 0x85320009  ! 193: SRL_R	srl 	%r8, %r9, %r2
	.word 0x820a2624  ! 193: AND_I	and 	%r8, 0x0624, %r1
	.word 0x84220009  ! 193: SUB_R	sub 	%r8, %r9, %r2
	.word 0x97641809  ! 193: MOVcc_R	<illegal instruction>
	.word 0x8f3a3001  ! 193: SRAX_I	srax	%r8, 0x0001, %r7
	.word 0xb492265c  ! 193: ORcc_I	orcc 	%r8, 0x065c, %r26
	.word 0xc4720009  ! 198: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc31a0009  ! 198: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xce0a2f8c  ! 198: LDUB_I	ldub	[%r8 + 0x0f8c], %r7
	.word 0x847a29e8  ! 198: SDIV_I	sdiv 	%r8, 0x09e8, %r2
	.word 0x82a20009  ! 200: SUBcc_R	subcc 	%r8, %r9, %r1
	.word 0xbd323001  ! 200: SRLX_I	srlx	%r8, 0x0001, %r30
	.word 0xa53a3001  ! 200: SRAX_I	srax	%r8, 0x0001, %r18
	.word 0x8b3a1009  ! 200: SRAX_R	srax	%r8, %r9, %r5
	.word 0x892a0009  ! 200: SLL_R	sll 	%r8, %r9, %r4
	.word 0x852a1009  ! 200: SLLX_R	sllx	%r8, %r9, %r2
	.word 0x8e420009  ! 200: ADDC_R	addc 	%r8, %r9, %r7
	.word 0x8e1a0009  ! 200: XOR_R	xor 	%r8, %r9, %r7
	.word 0xaa1a20fc  ! 200: XOR_I	xor 	%r8, 0x00fc, %r21
	.word 0xab3a2001  ! 200: SRA_I	sra 	%r8, 0x0001, %r21
	.word 0x841a0009  ! 200: XOR_R	xor 	%r8, %r9, %r2
	.word 0x89780409  ! 200: MOVR_R	move	%r0, %r9, %r4
	.word 0x8c422a4c  ! 200: ADDC_I	addc 	%r8, 0x0a4c, %r6
	.word 0x8d3a0009  ! 200: SRA_R	sra 	%r8, %r9, %r6
	.word 0x0cca0001  ! 204: BRGZ	brgz  ,pt	%8,<label_0xa0001>
	.word 0x8b6a0009  ! 204: SDIVX_R	sdivx	%r8, %r9, %r5
	.word 0x0aca0001  ! 206: BRNZ	brnz  ,pt	%8,<label_0xa0001>
	.word 0x847a2fe0  ! 206: SDIV_I	sdiv 	%r8, 0x0fe0, %r2
	.word 0xec320009  ! 213: STH_R	sth	%r22, [%r8 + %r9]
	.word 0xf85a0009  ! 213: LDX_R	ldx	[%r8 + %r9], %r28
	.word 0xb0c22fc0  ! 213: ADDCcc_I	addccc 	%r8, 0x0fc0, %r24
	.word 0x887220ac  ! 213: UDIV_I	udiv 	%r8, 0x00ac, %r4
	.word 0xcb220009  ! 217: STF_R	st	%f5, [%r9, %r8]
	.word 0xcc420009  ! 217: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xaa7a0009  ! 217: SDIV_R	sdiv 	%r8, %r9, %r21
	.word 0x86fa0009  ! 217: SDIVcc_R	sdivcc 	%r8, %r9, %r3
	.word 0xec2a0009  ! 221: STB_R	stb	%r22, [%r8 + %r9]
	.word 0xc84a0009  ! 221: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0x8ef20009  ! 221: UDIVcc_R	udivcc 	%r8, %r9, %r7
	.word 0x88f22cc0  ! 221: UDIVcc_I	udivcc 	%r8, 0x0cc0, %r4
	.word 0x28800002  ! 223: BLEU	bleu,a	<label_0x2>
	.word 0x8afa2a70  ! 223: SDIVcc_I	sdivcc 	%r8, 0x0a70, %r5
	.word 0x82b20009  ! 224: ORNcc_R	orncc 	%r8, %r9, %r1
	.word 0x8f2a0009  ! 224: SLL_R	sll 	%r8, %r9, %r7
	.word 0xa80a2900  ! 224: AND_I	and 	%r8, 0x0900, %r20
	.word 0x853a0009  ! 224: SRA_R	sra 	%r8, %r9, %r2
	.word 0x863a240c  ! 224: XNOR_I	xnor 	%r8, 0x040c, %r3
	.word 0x89321009  ! 224: SRLX_R	srlx	%r8, %r9, %r4
	.word 0x8eb20009  ! 224: SUBCcc_R	orncc 	%r8, %r9, %r7
	.word 0x82b22bf8  ! 224: ORNcc_I	orncc 	%r8, 0x0bf8, %r1
	.word 0x82aa2cc4  ! 224: ANDNcc_I	andncc 	%r8, 0x0cc4, %r1
	.word 0x88aa0009  ! 224: ANDNcc_R	andncc 	%r8, %r9, %r4
	.word 0xbcaa0009  ! 224: ANDNcc_R	andncc 	%r8, %r9, %r30
	.word 0x841a0009  ! 224: XOR_R	xor 	%r8, %r9, %r2
	.word 0x8c020009  ! 224: ADD_R	add 	%r8, %r9, %r6
	.word 0x8c022c60  ! 224: ADD_I	add 	%r8, 0x0c60, %r6
	.word 0x8c822220  ! 224: ADDcc_I	addcc 	%r8, 0x0220, %r6
	.word 0x3c800001  ! 227: BPOS	bpos,a	<label_0x1>
	.word 0x8ef22e08  ! 227: UDIVcc_I	udivcc 	%r8, 0x0e08, %r7
	.word 0xff220009  ! 231: STF_R	st	%f31, [%r9, %r8]
	.word 0xc3020009  ! 231: LDF_R	ld	[%r8, %r9], %f1
	.word 0x88720009  ! 231: UDIV_R	udiv 	%r8, %r9, %r4
	.word 0xad6a0009  ! 231: SDIVX_R	sdivx	%r8, %r9, %r22
	.word 0xee320009  ! 235: STH_R	sth	%r23, [%r8 + %r9]
	.word 0xc60a0009  ! 235: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0x83641809  ! 235: MOVcc_R	<illegal instruction>
	.word 0x996a2284  ! 235: SDIVX_I	sdivx	%r8, 0x0284, %r12
	.word 0xae920009  ! 236: ORcc_R	orcc 	%r8, %r9, %r23
	.word 0x84220009  ! 236: SUB_R	sub 	%r8, %r9, %r2
	.word 0xa4422f10  ! 236: ADDC_I	addc 	%r8, 0x0f10, %r18
	.word 0x820a2f34  ! 236: AND_I	and 	%r8, 0x0f34, %r1
	.word 0x8c320009  ! 236: SUBC_R	orn 	%r8, %r9, %r6
	.word 0x84c227f0  ! 236: ADDCcc_I	addccc 	%r8, 0x07f0, %r2
	.word 0x873a2001  ! 236: SRA_I	sra 	%r8, 0x0001, %r3
	.word 0x8f2a1009  ! 236: SLLX_R	sllx	%r8, %r9, %r7
	.word 0x87322001  ! 236: SRL_I	srl 	%r8, 0x0001, %r3
	.word 0x84a20009  ! 236: SUBcc_R	subcc 	%r8, %r9, %r2
	.word 0xa0b22d58  ! 236: SUBCcc_I	orncc 	%r8, 0x0d58, %r16
	.word 0x82220009  ! 236: SUB_R	sub 	%r8, %r9, %r1
	.word 0x8c1a0009  ! 238: XOR_R	xor 	%r8, %r9, %r6
	.word 0x8c420009  ! 238: ADDC_R	addc 	%r8, %r9, %r6
	.word 0x82820009  ! 238: ADDcc_R	addcc 	%r8, %r9, %r1
	.word 0x8a122e88  ! 238: OR_I	or 	%r8, 0x0e88, %r5
	.word 0x84820009  ! 238: ADDcc_R	addcc 	%r8, %r9, %r2
	.word 0x8eb20009  ! 238: SUBCcc_R	orncc 	%r8, %r9, %r7
	.word 0x849a25f8  ! 238: XORcc_I	xorcc 	%r8, 0x05f8, %r2
	.word 0xa4a22688  ! 238: SUBcc_I	subcc 	%r8, 0x0688, %r18
	.word 0x82322d14  ! 238: SUBC_I	orn 	%r8, 0x0d14, %r1
	.word 0x85320009  ! 238: SRL_R	srl 	%r8, %r9, %r2
	.word 0x88ba2024  ! 238: XNORcc_I	xnorcc 	%r8, 0x0024, %r4
	.word 0xb2120009  ! 238: OR_R	or 	%r8, %r9, %r25
	.word 0x2eca0001  ! 240: BRGEZ	brgez,a,pt	%8,<label_0xa0001>
	.word 0xa2f20009  ! 240: UDIVcc_R	udivcc 	%r8, %r9, %r17
	.word 0x24c20001  ! 243: BRLEZ	brlez,a,nt	%8,<label_0x20001>
	.word 0x9cfa0009  ! 243: SDIVcc_R	sdivcc 	%r8, %r9, %r14
	.word 0x3e800002  ! 245: BVC	bvc,a	<label_0x2>
	.word 0xb66a274c  ! 245: UDIVX_I	udivx 	%r8, 0x074c, %r27
	.word 0xc62a0009  ! 250: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xca0a0009  ! 250: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0x86aa0009  ! 250: ANDNcc_R	andncc 	%r8, %r9, %r3
	.word 0x8e7a0009  ! 250: SDIV_R	sdiv 	%r8, %r9, %r7
	.word 0xb5321009  ! 251: SRLX_R	srlx	%r8, %r9, %r26
	.word 0x832a2001  ! 251: SLL_I	sll 	%r8, 0x0001, %r1
	.word 0xb2aa0009  ! 251: ANDNcc_R	andncc 	%r8, %r9, %r25
	.word 0x8a3a0009  ! 251: XNOR_R	xnor 	%r8, %r9, %r5
	.word 0xbd2a3001  ! 251: SLLX_I	sllx	%r8, 0x0001, %r30
	.word 0x8eaa2aac  ! 251: ANDNcc_I	andncc 	%r8, 0x0aac, %r7
	.word 0x8c3221cc  ! 251: ORN_I	orn 	%r8, 0x01cc, %r6
	.word 0xae020009  ! 251: ADD_R	add 	%r8, %r9, %r23
	.word 0x82c20009  ! 251: ADDCcc_R	addccc 	%r8, %r9, %r1
	.word 0x84c20009  ! 251: ADDCcc_R	addccc 	%r8, %r9, %r2
	.word 0x86822838  ! 251: ADDcc_I	addcc 	%r8, 0x0838, %r3
	.word 0xb7643801  ! 251: MOVcc_I	<illegal instruction>
	.word 0x86222d30  ! 251: SUB_I	sub 	%r8, 0x0d30, %r3
	.word 0x880a2be0  ! 251: AND_I	and 	%r8, 0x0be0, %r4
	.word 0x861a2a84  ! 253: XOR_I	xor 	%r8, 0x0a84, %r3
	.word 0xba9a21e0  ! 253: XORcc_I	xorcc 	%r8, 0x01e0, %r29
	.word 0x8b2a0009  ! 253: SLL_R	sll 	%r8, %r9, %r5
	.word 0x84b20009  ! 253: SUBCcc_R	orncc 	%r8, %r9, %r2
	.word 0x884223e0  ! 253: ADDC_I	addc 	%r8, 0x03e0, %r4
	.word 0x8b2a1009  ! 253: SLLX_R	sllx	%r8, %r9, %r5
	.word 0x824222b0  ! 253: ADDC_I	addc 	%r8, 0x02b0, %r1
	.word 0x8ab20009  ! 253: SUBCcc_R	orncc 	%r8, %r9, %r5
	.word 0xa81a0009  ! 253: XOR_R	xor 	%r8, %r9, %r20
	.word 0x822221f0  ! 253: SUB_I	sub 	%r8, 0x01f0, %r1
	.word 0x8f643801  ! 253: MOVcc_I	<illegal instruction>
	.word 0xac022a20  ! 253: ADD_I	add 	%r8, 0x0a20, %r22
	.word 0x8b3a1009  ! 253: SRAX_R	srax	%r8, %r9, %r5
	.word 0xa2b22114  ! 253: SUBCcc_I	orncc 	%r8, 0x0114, %r17
	.word 0xaa022d70  ! 253: ADD_I	add 	%r8, 0x0d70, %r21
	.word 0xcd3a0009  ! 258: STDF_R	std	%f6, [%r9, %r8]
	.word 0xcc420009  ! 258: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xc5020009  ! 258: LDF_R	ld	[%r8, %r9], %f2
	.word 0x8b6a0009  ! 258: SDIVX_R	sdivx	%r8, %r9, %r5
	.word 0xb82a0009  ! 261: ANDN_R	andn 	%r8, %r9, %r28
	.word 0x86c228e8  ! 261: ADDCcc_I	addccc 	%r8, 0x08e8, %r3
	.word 0x98120009  ! 261: OR_R	or 	%r8, %r9, %r12
	.word 0x83780409  ! 261: MOVR_R	move	%r0, %r9, %r1
	.word 0x86320009  ! 261: ORN_R	orn 	%r8, %r9, %r3
	.word 0x84b20009  ! 261: ORNcc_R	orncc 	%r8, %r9, %r2
	.word 0x8d322001  ! 261: SRL_I	srl 	%r8, 0x0001, %r6
	.word 0xa33a3001  ! 261: SRAX_I	srax	%r8, 0x0001, %r17
	.word 0xbe320009  ! 261: ORN_R	orn 	%r8, %r9, %r31
	.word 0x8882208c  ! 261: ADDcc_I	addcc 	%r8, 0x008c, %r4
	.word 0x02800001  ! 264: BE	be  	<label_0x1>
	.word 0x86f22cb4  ! 264: UDIVcc_I	udivcc 	%r8, 0x0cb4, %r3
	.word 0x0c800001  ! 267: BNEG	bneg  	<label_0x1>
	.word 0xbc7a2978  ! 267: SDIV_I	sdiv 	%r8, 0x0978, %r30
	.word 0x2cca0001  ! 269: BRGZ	brgz,a,pt	%8,<label_0xa0001>
	.word 0xb56a0009  ! 269: SDIVX_R	sdivx	%r8, %r9, %r26
	.word 0xc8220009  ! 276: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xd6020009  ! 276: LDUW_R	lduw	[%r8 + %r9], %r11
	.word 0xc81a0009  ! 276: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xa072275c  ! 276: UDIV_I	udiv 	%r8, 0x075c, %r16
	.word 0x87322001  ! 277: SRL_I	srl 	%r8, 0x0001, %r3
	.word 0x8c122a8c  ! 277: OR_I	or 	%r8, 0x0a8c, %r6
	.word 0x849221d0  ! 277: ORcc_I	orcc 	%r8, 0x01d0, %r2
	.word 0xb62a23dc  ! 277: ANDN_I	andn 	%r8, 0x03dc, %r27
	.word 0xa92a3001  ! 277: SLLX_I	sllx	%r8, 0x0001, %r20
	.word 0xb80a20a0  ! 277: AND_I	and 	%r8, 0x00a0, %r28
	.word 0x88322e38  ! 277: SUBC_I	orn 	%r8, 0x0e38, %r4
	.word 0x860a0009  ! 277: AND_R	and 	%r8, %r9, %r3
	.word 0x84a220c0  ! 277: SUBcc_I	subcc 	%r8, 0x00c0, %r2
	.word 0xae3a2524  ! 277: XNOR_I	xnor 	%r8, 0x0524, %r23
	.word 0x8a9a2e94  ! 277: XORcc_I	xorcc 	%r8, 0x0e94, %r5
	.word 0x8e1a0009  ! 277: XOR_R	xor 	%r8, %r9, %r7
	.word 0xa48a23fc  ! 277: ANDcc_I	andcc 	%r8, 0x03fc, %r18
	.word 0x32800002  ! 279: BNE	bne,a	<label_0x2>
	.word 0x9ef22908  ! 279: UDIVcc_I	udivcc 	%r8, 0x0908, %r15
	.word 0xb69a0009  ! 282: XORcc_R	xorcc 	%r8, %r9, %r27
	.word 0x88020009  ! 282: ADD_R	add 	%r8, %r9, %r4
	.word 0x8ab228dc  ! 282: SUBCcc_I	orncc 	%r8, 0x08dc, %r5
	.word 0xaa8a0009  ! 282: ANDcc_R	andcc 	%r8, %r9, %r21
	.word 0xae3a0009  ! 282: XNOR_R	xnor 	%r8, %r9, %r23
	.word 0x86a224e4  ! 282: SUBcc_I	subcc 	%r8, 0x04e4, %r3
	.word 0xb9780409  ! 282: MOVR_R	move	%r0, %r9, %r28
	.word 0xb0ba21b0  ! 282: XNORcc_I	xnorcc 	%r8, 0x01b0, %r24
	.word 0x8c822a48  ! 282: ADDcc_I	addcc 	%r8, 0x0a48, %r6
	.word 0x82020009  ! 282: ADD_R	add 	%r8, %r9, %r1
	.word 0x88022fd0  ! 282: ADD_I	add 	%r8, 0x0fd0, %r4
	.word 0x820a0009  ! 282: AND_R	and 	%r8, %r9, %r1
	.word 0x04800001  ! 284: BLE	ble  	<label_0x1>
	.word 0x8ef22364  ! 284: UDIVcc_I	udivcc 	%r8, 0x0364, %r7
	.word 0xfd3a0009  ! 288: STDF_R	std	%f30, [%r9, %r8]
	.word 0xca4a0009  ! 288: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0x98a227b4  ! 288: SUBcc_I	subcc 	%r8, 0x07b4, %r12
	.word 0x8c7a2bd8  ! 288: SDIV_I	sdiv 	%r8, 0x0bd8, %r6
	.word 0xef220009  ! 292: STF_R	st	%f23, [%r9, %r8]
	.word 0xc81a0009  ! 292: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x826a0009  ! 292: UDIVX_R	udivx 	%r8, %r9, %r1
	.word 0xaa7a0009  ! 292: SDIV_R	sdiv 	%r8, %r9, %r21
	.word 0x84320009  ! 293: ORN_R	orn 	%r8, %r9, %r2
	.word 0x86aa2ed4  ! 293: ANDNcc_I	andncc 	%r8, 0x0ed4, %r3
	.word 0x8a1a0009  ! 293: XOR_R	xor 	%r8, %r9, %r5
	.word 0x84322c90  ! 293: SUBC_I	orn 	%r8, 0x0c90, %r2
	.word 0x88b20009  ! 293: ORNcc_R	orncc 	%r8, %r9, %r4
	.word 0xaf2a1009  ! 293: SLLX_R	sllx	%r8, %r9, %r23
	.word 0x8c9220b8  ! 293: ORcc_I	orcc 	%r8, 0x00b8, %r6
	.word 0x88320009  ! 293: SUBC_R	orn 	%r8, %r9, %r4
	.word 0x89641809  ! 293: MOVcc_R	<illegal instruction>
	.word 0x96920009  ! 293: ORcc_R	orcc 	%r8, %r9, %r11
	.word 0x8f3a0009  ! 293: SRA_R	sra 	%r8, %r9, %r7
	.word 0xbec22764  ! 293: ADDCcc_I	addccc 	%r8, 0x0764, %r31
	.word 0xb3780409  ! 293: MOVR_R	move	%r0, %r9, %r25
	.word 0x8ec20009  ! 293: ADDCcc_R	addccc 	%r8, %r9, %r7
	.word 0x88b20009  ! 293: SUBCcc_R	orncc 	%r8, %r9, %r4
	.word 0x8eba0009  ! 295: XNORcc_R	xnorcc 	%r8, %r9, %r7
	.word 0x86420009  ! 295: ADDC_R	addc 	%r8, %r9, %r3
	.word 0x84b2291c  ! 295: SUBCcc_I	orncc 	%r8, 0x091c, %r2
	.word 0x88820009  ! 295: ADDcc_R	addcc 	%r8, %r9, %r4
	.word 0xaea222a0  ! 295: SUBcc_I	subcc 	%r8, 0x02a0, %r23
	.word 0x8eb22bd4  ! 295: SUBCcc_I	orncc 	%r8, 0x0bd4, %r7
	.word 0x8d2a3001  ! 295: SLLX_I	sllx	%r8, 0x0001, %r6
	.word 0x87782401  ! 295: MOVR_I	move	%r0, 0x1, %r3
	.word 0x8a220009  ! 295: SUB_R	sub 	%r8, %r9, %r5
	.word 0x8b643801  ! 295: MOVcc_I	<illegal instruction>
	.word 0xa2822c10  ! 297: ADDcc_I	addcc 	%r8, 0x0c10, %r17
	.word 0xb42a286c  ! 297: ANDN_I	andn 	%r8, 0x086c, %r26
	.word 0x88320009  ! 297: ORN_R	orn 	%r8, %r9, %r4
	.word 0x822224c8  ! 297: SUB_I	sub 	%r8, 0x04c8, %r1
	.word 0x82020009  ! 297: ADD_R	add 	%r8, %r9, %r1
	.word 0xb0422b04  ! 297: ADDC_I	addc 	%r8, 0x0b04, %r24
	.word 0x8b321009  ! 297: SRLX_R	srlx	%r8, %r9, %r5
	.word 0x8a1a2cac  ! 297: XOR_I	xor 	%r8, 0x0cac, %r5
	.word 0x9a1a2568  ! 297: XOR_I	xor 	%r8, 0x0568, %r13
	.word 0x842a0009  ! 297: ANDN_R	andn 	%r8, %r9, %r2
	.word 0x98420009  ! 297: ADDC_R	addc 	%r8, %r9, %r12
	.word 0x888a0009  ! 300: ANDcc_R	andcc 	%r8, %r9, %r4
	.word 0x882a0009  ! 300: ANDN_R	andn 	%r8, %r9, %r4
	.word 0x82b2257c  ! 300: SUBCcc_I	orncc 	%r8, 0x057c, %r1
	.word 0xbc3a206c  ! 300: XNOR_I	xnor 	%r8, 0x006c, %r30
	.word 0x82b20009  ! 300: SUBCcc_R	orncc 	%r8, %r9, %r1
	.word 0x86aa0009  ! 300: ANDNcc_R	andncc 	%r8, %r9, %r3
	.word 0x8a9a23bc  ! 300: XORcc_I	xorcc 	%r8, 0x03bc, %r5
	.word 0x86220009  ! 300: SUB_R	sub 	%r8, %r9, %r3
	.word 0x88122908  ! 300: OR_I	or 	%r8, 0x0908, %r4
	.word 0x868a0009  ! 300: ANDcc_R	andcc 	%r8, %r9, %r3
	.word 0xb62a2540  ! 300: ANDN_I	andn 	%r8, 0x0540, %r27
	.word 0xaf3a2001  ! 300: SRA_I	sra 	%r8, 0x0001, %r23
	.word 0x832a3001  ! 300: SLLX_I	sllx	%r8, 0x0001, %r1
	.word 0xbd780409  ! 301: MOVR_R	move	%r0, %r9, %r30
	.word 0xa61222e4  ! 301: OR_I	or 	%r8, 0x02e4, %r19
	.word 0xa73a1009  ! 301: SRAX_R	srax	%r8, %r9, %r19
	.word 0x88b22f00  ! 301: SUBCcc_I	orncc 	%r8, 0x0f00, %r4
	.word 0xb6b20009  ! 301: SUBCcc_R	orncc 	%r8, %r9, %r27
	.word 0x833a0009  ! 301: SRA_R	sra 	%r8, %r9, %r1
	.word 0xbb3a2001  ! 301: SRA_I	sra 	%r8, 0x0001, %r29
	.word 0x833a0009  ! 301: SRA_R	sra 	%r8, %r9, %r1
	.word 0x8f782401  ! 301: MOVR_I	move	%r0, 0x9, %r7
	.word 0x8e0a23b4  ! 301: AND_I	and 	%r8, 0x03b4, %r7
	.word 0x9a2a0009  ! 301: ANDN_R	andn 	%r8, %r9, %r13
	.word 0x8eb20009  ! 301: ORNcc_R	orncc 	%r8, %r9, %r7
	.word 0x3a800001  ! 303: BCC	bcc,a	<label_0x1>
	.word 0x967220ac  ! 303: UDIV_I	udiv 	%r8, 0x00ac, %r11
	.word 0x3c800002  ! 305: BPOS	bpos,a	<label_0x2>
	.word 0x846a0009  ! 305: UDIVX_R	udivx 	%r8, %r9, %r2
	.word 0xc73a0009  ! 309: STDF_R	std	%f3, [%r9, %r8]
	.word 0xf8120009  ! 309: LDUH_R	lduh	[%r8 + %r9], %r28
	.word 0x8e6a0009  ! 309: UDIVX_R	udivx 	%r8, %r9, %r7
	.word 0x947a2dc0  ! 309: SDIV_I	sdiv 	%r8, 0x0dc0, %r10
	.word 0xd42a0009  ! 313: STB_R	stb	%r10, [%r8 + %r9]
	.word 0xc8520009  ! 313: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0x8f3a0009  ! 313: SRA_R	sra 	%r8, %r9, %r7
	.word 0x84722e28  ! 313: UDIV_I	udiv 	%r8, 0x0e28, %r2
	.word 0x1e800002  ! 319: BVC	bvc  	<label_0x2>
	.word 0xba720009  ! 319: UDIV_R	udiv 	%r8, %r9, %r29
	.word 0xef220009  ! 323: STF_R	st	%f23, [%r9, %r8]
	.word 0xc8420009  ! 323: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xb8fa0009  ! 323: SDIVcc_R	sdivcc 	%r8, %r9, %r28
	.word 0x8cfa2ccc  ! 323: SDIVcc_I	sdivcc 	%r8, 0x0ccc, %r6
	.word 0x9aba0009  ! 325: XNORcc_R	xnorcc 	%r8, %r9, %r13
	.word 0x88320009  ! 325: ORN_R	orn 	%r8, %r9, %r4
	.word 0x82ba2520  ! 325: XNORcc_I	xnorcc 	%r8, 0x0520, %r1
	.word 0x8b782401  ! 325: MOVR_I	move	%r0, 0x520, %r5
	.word 0xab322001  ! 325: SRL_I	srl 	%r8, 0x0001, %r21
	.word 0x8e920009  ! 325: ORcc_R	orcc 	%r8, %r9, %r7
	.word 0x88322cd8  ! 325: SUBC_I	orn 	%r8, 0x0cd8, %r4
	.word 0xa01a2f6c  ! 325: XOR_I	xor 	%r8, 0x0f6c, %r16
	.word 0x8842267c  ! 325: ADDC_I	addc 	%r8, 0x067c, %r4
	.word 0x82920009  ! 325: ORcc_R	orcc 	%r8, %r9, %r1
	.word 0x8a12290c  ! 325: OR_I	or 	%r8, 0x090c, %r5
	.word 0x8f2a0009  ! 325: SLL_R	sll 	%r8, %r9, %r7
	.word 0x8a3226a0  ! 327: ORN_I	orn 	%r8, 0x06a0, %r5
	.word 0xb4b22920  ! 327: ORNcc_I	orncc 	%r8, 0x0920, %r26
	.word 0x828a0009  ! 327: ANDcc_R	andcc 	%r8, %r9, %r1
	.word 0x8a120009  ! 327: OR_R	or 	%r8, %r9, %r5
	.word 0x94aa0009  ! 327: ANDNcc_R	andncc 	%r8, %r9, %r10
	.word 0x8c322318  ! 327: SUBC_I	orn 	%r8, 0x0318, %r6
	.word 0x96aa0009  ! 327: ANDNcc_R	andncc 	%r8, %r9, %r11
	.word 0x820a2c4c  ! 327: AND_I	and 	%r8, 0x0c4c, %r1
	.word 0x84822398  ! 327: ADDcc_I	addcc 	%r8, 0x0398, %r2
	.word 0x9eaa0009  ! 327: ANDNcc_R	andncc 	%r8, %r9, %r15
	.word 0xb8120009  ! 327: OR_R	or 	%r8, %r9, %r28
	.word 0x821226b0  ! 327: OR_I	or 	%r8, 0x06b0, %r1
	.word 0x40000001  ! 331: CALL	call	disp30_1
	.word 0x8afa27dc  ! 331: SDIVcc_I	sdivcc 	%r8, 0x07dc, %r5
	.word 0x22ca0001  ! 334: BRZ	brz,a,pt	%8,<label_0xa0001>
	.word 0x836a2a60  ! 334: SDIVX_I	sdivx	%r8, 0x0a60, %r1
	.word 0xac320009  ! 335: ORN_R	orn 	%r8, %r9, %r22
	.word 0x94aa2a7c  ! 335: ANDNcc_I	andncc 	%r8, 0x0a7c, %r10
	.word 0x8c0a0009  ! 335: AND_R	and 	%r8, %r9, %r6
	.word 0x8c1a28e4  ! 335: XOR_I	xor 	%r8, 0x08e4, %r6
	.word 0x8e1a205c  ! 335: XOR_I	xor 	%r8, 0x005c, %r7
	.word 0x832a0009  ! 335: SLL_R	sll 	%r8, %r9, %r1
	.word 0x94b22d04  ! 335: SUBCcc_I	orncc 	%r8, 0x0d04, %r10
	.word 0x8f321009  ! 335: SRLX_R	srlx	%r8, %r9, %r7
	.word 0x95641809  ! 335: MOVcc_R	<illegal instruction>
	.word 0x848a0009  ! 335: ANDcc_R	andcc 	%r8, %r9, %r2
	.word 0x26800001  ! 337: BL	bl,a	<label_0x1>
	.word 0x827a0009  ! 337: SDIV_R	sdiv 	%r8, %r9, %r1
	.word 0xde220009  ! 341: STW_R	stw	%r15, [%r8 + %r9]
	.word 0xc60a0009  ! 341: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xbcfa0009  ! 341: SDIVcc_R	sdivcc 	%r8, %r9, %r30
	.word 0x8e6a2244  ! 341: UDIVX_I	udivx 	%r8, 0x0244, %r7
	.word 0x3e800001  ! 346: BVC	bvc,a	<label_0x1>
	.word 0x9cfa2c10  ! 346: SDIVcc_I	sdivcc 	%r8, 0x0c10, %r14
	.word 0x8e920009  ! 347: ORcc_R	orcc 	%r8, %r9, %r7
	.word 0x8f2a2001  ! 347: SLL_I	sll 	%r8, 0x0001, %r7
	.word 0x892a0009  ! 347: SLL_R	sll 	%r8, %r9, %r4
	.word 0xaeba0009  ! 347: XNORcc_R	xnorcc 	%r8, %r9, %r23
	.word 0xa4b22e9c  ! 347: ORNcc_I	orncc 	%r8, 0x0e9c, %r18
	.word 0x872a2001  ! 347: SLL_I	sll 	%r8, 0x0001, %r3
	.word 0x889a0009  ! 347: XORcc_R	xorcc 	%r8, %r9, %r4
	.word 0x8c9a0009  ! 347: XORcc_R	xorcc 	%r8, %r9, %r6
	.word 0x8aa20009  ! 347: SUBcc_R	subcc 	%r8, %r9, %r5
	.word 0x86320009  ! 347: ORN_R	orn 	%r8, %r9, %r3
	.word 0x87320009  ! 347: SRL_R	srl 	%r8, %r9, %r3
	.word 0xaa122b40  ! 347: OR_I	or 	%r8, 0x0b40, %r21
	.word 0x26c20001  ! 350: BRLZ	brlz,a,nt	%8,<label_0x20001>
	.word 0x8a6a25ac  ! 350: UDIVX_I	udivx 	%r8, 0x05ac, %r5
	.word 0x868a0009  ! 357: ANDcc_R	andcc 	%r8, %r9, %r3
	.word 0x82022188  ! 357: ADD_I	add 	%r8, 0x0188, %r1
	.word 0xa23221ac  ! 357: SUBC_I	orn 	%r8, 0x01ac, %r17
	.word 0x840a0009  ! 357: AND_R	and 	%r8, %r9, %r2
	.word 0x88320009  ! 357: ORN_R	orn 	%r8, %r9, %r4
	.word 0x829a0009  ! 357: XORcc_R	xorcc 	%r8, %r9, %r1
	.word 0x8a120009  ! 357: OR_R	or 	%r8, %r9, %r5
	.word 0x821a0009  ! 357: XOR_R	xor 	%r8, %r9, %r1
	.word 0x86820009  ! 357: ADDcc_R	addcc 	%r8, %r9, %r3
	.word 0x88b20009  ! 357: ORNcc_R	orncc 	%r8, %r9, %r4
	.word 0x94320009  ! 357: SUBC_R	orn 	%r8, %r9, %r10
	.word 0x8e022edc  ! 357: ADD_I	add 	%r8, 0x0edc, %r7
	.word 0xacc20009  ! 357: ADDCcc_R	addccc 	%r8, %r9, %r22
	.word 0x8eb20009  ! 357: ORNcc_R	orncc 	%r8, %r9, %r7
	.word 0xc33a0009  ! 362: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc9020009  ! 362: LDF_R	ld	[%r8, %r9], %f4
	.word 0x946a24ec  ! 362: UDIVX_I	udivx 	%r8, 0x04ec, %r10
	.word 0x866a0009  ! 362: UDIVX_R	udivx 	%r8, %r9, %r3
	.word 0xbd3a3001  ! 363: SRAX_I	srax	%r8, 0x0001, %r30
	.word 0xb83a2c5c  ! 363: XNOR_I	xnor 	%r8, 0x0c5c, %r28
	.word 0x8c3a0009  ! 363: XNOR_R	xnor 	%r8, %r9, %r6
	.word 0x8632281c  ! 363: ORN_I	orn 	%r8, 0x081c, %r3
	.word 0x832a0009  ! 363: SLL_R	sll 	%r8, %r9, %r1
	.word 0x8a1a0009  ! 363: XOR_R	xor 	%r8, %r9, %r5
	.word 0x8c0a28d4  ! 363: AND_I	and 	%r8, 0x08d4, %r6
	.word 0x8aba2ec4  ! 363: XNORcc_I	xnorcc 	%r8, 0x0ec4, %r5
	.word 0x873a2001  ! 363: SRA_I	sra 	%r8, 0x0001, %r3
	.word 0x8b2a1009  ! 363: SLLX_R	sllx	%r8, %r9, %r5
	.word 0x84320009  ! 363: SUBC_R	orn 	%r8, %r9, %r2
	.word 0x20800002  ! 366: BN	bn,a	<label_0x2>
	.word 0x84720009  ! 366: UDIV_R	udiv 	%r8, %r9, %r2
	.word 0x84322b08  ! 368: ORN_I	orn 	%r8, 0x0b08, %r2
	.word 0x8cb2210c  ! 368: ORNcc_I	orncc 	%r8, 0x010c, %r6
	.word 0x8c922a90  ! 368: ORcc_I	orcc 	%r8, 0x0a90, %r6
	.word 0xac820009  ! 368: ADDcc_R	addcc 	%r8, %r9, %r22
	.word 0x86b20009  ! 368: SUBCcc_R	orncc 	%r8, %r9, %r3
	.word 0x87782401  ! 368: MOVR_I	move	%r0, 0x9, %r3
	.word 0x8d2a0009  ! 368: SLL_R	sll 	%r8, %r9, %r6
	.word 0x9f321009  ! 368: SRLX_R	srlx	%r8, %r9, %r15
	.word 0x843a0009  ! 368: XNOR_R	xnor 	%r8, %r9, %r2
	.word 0xa4120009  ! 368: OR_R	or 	%r8, %r9, %r18
	.word 0x83782401  ! 368: MOVR_I	move	%r0, 0x9, %r1
	.word 0xda220009  ! 375: STW_R	stw	%r13, [%r8 + %r9]
	.word 0xe8120009  ! 375: LDUH_R	lduh	[%r8 + %r9], %r20
	.word 0xca020009  ! 375: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0x82f20009  ! 375: UDIVcc_R	udivcc 	%r8, %r9, %r1
	.word 0x9d2a0009  ! 376: SLL_R	sll 	%r8, %r9, %r14
	.word 0x832a2001  ! 376: SLL_I	sll 	%r8, 0x0001, %r1
	.word 0xb52a3001  ! 376: SLLX_I	sllx	%r8, 0x0001, %r26
	.word 0x96422fcc  ! 376: ADDC_I	addc 	%r8, 0x0fcc, %r11
	.word 0x883a0009  ! 376: XNOR_R	xnor 	%r8, %r9, %r4
	.word 0x82ba22b4  ! 376: XNORcc_I	xnorcc 	%r8, 0x02b4, %r1
	.word 0x883a28fc  ! 376: XNOR_I	xnor 	%r8, 0x08fc, %r4
	.word 0x832a3001  ! 376: SLLX_I	sllx	%r8, 0x0001, %r1
	.word 0x843a26f4  ! 376: XNOR_I	xnor 	%r8, 0x06f4, %r2
	.word 0x88c20009  ! 376: ADDCcc_R	addccc 	%r8, %r9, %r4
	.word 0x8cba0009  ! 376: XNORcc_R	xnorcc 	%r8, %r9, %r6
	.word 0x86420009  ! 376: ADDC_R	addc 	%r8, %r9, %r3
	.word 0xac9a0009  ! 376: XORcc_R	xorcc 	%r8, %r9, %r22
	.word 0x34800001  ! 378: BG	bg,a	<label_0x1>
	.word 0x8d6a2570  ! 378: SDIVX_I	sdivx	%r8, 0x0570, %r6
	.word 0xbb3a0009  ! 379: SRA_R	sra 	%r8, %r9, %r29
	.word 0x8c1a0009  ! 379: XOR_R	xor 	%r8, %r9, %r6
	.word 0x8a0a2860  ! 379: AND_I	and 	%r8, 0x0860, %r5
	.word 0x8c920009  ! 379: ORcc_R	orcc 	%r8, %r9, %r6
	.word 0x8c3223e4  ! 379: SUBC_I	orn 	%r8, 0x03e4, %r6
	.word 0x832a2001  ! 379: SLL_I	sll 	%r8, 0x0001, %r1
	.word 0x8e0a2490  ! 379: AND_I	and 	%r8, 0x0490, %r7
	.word 0x8a220009  ! 379: SUB_R	sub 	%r8, %r9, %r5
	.word 0x872a2001  ! 379: SLL_I	sll 	%r8, 0x0001, %r3
	.word 0x94b22b80  ! 379: SUBCcc_I	orncc 	%r8, 0x0b80, %r10
	.word 0x86222e68  ! 379: SUB_I	sub 	%r8, 0x0e68, %r3
	.word 0xa89a0009  ! 379: XORcc_R	xorcc 	%r8, %r9, %r20
	.word 0x840a23d0  ! 379: AND_I	and 	%r8, 0x03d0, %r2
	.word 0xbf2a0009  ! 379: SLL_R	sll 	%r8, %r9, %r31
	.word 0x36800002  ! 384: BGE	bge,a	<label_0x2>
	.word 0x82720009  ! 384: UDIV_R	udiv 	%r8, %r9, %r1
	.word 0xd9220009  ! 388: STF_R	st	%f12, [%r9, %r8]
	.word 0xce4a0009  ! 388: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0x827a2270  ! 388: SDIV_I	sdiv 	%r8, 0x0270, %r1
	.word 0xbe6a2600  ! 388: UDIVX_I	udivx 	%r8, 0x0600, %r31
	.word 0x0e800001  ! 391: BVS	bvs  	<label_0x1>
	.word 0x887a24c0  ! 391: SDIV_I	sdiv 	%r8, 0x04c0, %r4
	.word 0xa21a0009  ! 398: XOR_R	xor 	%r8, %r9, %r17
	.word 0x868a0009  ! 398: ANDcc_R	andcc 	%r8, %r9, %r3
	.word 0x8b2a0009  ! 398: SLL_R	sll 	%r8, %r9, %r5
	.word 0x83323001  ! 398: SRLX_I	srlx	%r8, 0x0001, %r1
	.word 0x87780409  ! 398: MOVR_R	move	%r0, %r9, %r3
	.word 0x88c20009  ! 398: ADDCcc_R	addccc 	%r8, %r9, %r4
	.word 0x86422478  ! 398: ADDC_I	addc 	%r8, 0x0478, %r3
	.word 0xbab20009  ! 398: SUBCcc_R	orncc 	%r8, %r9, %r29
	.word 0x8e8a0009  ! 398: ANDcc_R	andcc 	%r8, %r9, %r7
	.word 0x8e220009  ! 398: SUB_R	sub 	%r8, %r9, %r7
	.word 0xb5780409  ! 398: MOVR_R	move	%r0, %r9, %r26
	.word 0x8b3a3001  ! 398: SRAX_I	srax	%r8, 0x0001, %r5
	.word 0x86ba0009  ! 399: XNORcc_R	xnorcc 	%r8, %r9, %r3
	.word 0xaf641809  ! 399: MOVcc_R	<illegal instruction>
	.word 0x853a2001  ! 399: SRA_I	sra 	%r8, 0x0001, %r2
	.word 0x84822fb4  ! 399: ADDcc_I	addcc 	%r8, 0x0fb4, %r2
	.word 0x9a920009  ! 399: ORcc_R	orcc 	%r8, %r9, %r13
	.word 0x85641809  ! 399: MOVcc_R	<illegal instruction>
	.word 0xb6022620  ! 399: ADD_I	add 	%r8, 0x0620, %r27
	.word 0x981a0009  ! 399: XOR_R	xor 	%r8, %r9, %r12
	.word 0x8a320009  ! 399: SUBC_R	orn 	%r8, %r9, %r5
	.word 0x8c3228f8  ! 399: SUBC_I	orn 	%r8, 0x08f8, %r6
	.word 0x8d3a0009  ! 399: SRA_R	sra 	%r8, %r9, %r6
	.word 0x85782401  ! 399: MOVR_I	move	%r0, 0x9, %r2
	.word 0x86320009  ! 399: SUBC_R	orn 	%r8, %r9, %r3
	.word 0x8c822938  ! 402: ADDcc_I	addcc 	%r8, 0x0938, %r6
	.word 0x861226c4  ! 402: OR_I	or 	%r8, 0x06c4, %r3
	.word 0x82b22d2c  ! 402: ORNcc_I	orncc 	%r8, 0x0d2c, %r1
	.word 0x8caa0009  ! 402: ANDNcc_R	andncc 	%r8, %r9, %r6
	.word 0x9ca22ed8  ! 402: SUBcc_I	subcc 	%r8, 0x0ed8, %r14
	.word 0x863a0009  ! 402: XNOR_R	xnor 	%r8, %r9, %r3
	.word 0x872a2001  ! 402: SLL_I	sll 	%r8, 0x0001, %r3
	.word 0xaf320009  ! 402: SRL_R	srl 	%r8, %r9, %r23
	.word 0x8ab20009  ! 402: ORNcc_R	orncc 	%r8, %r9, %r5
	.word 0xb0aa0009  ! 402: ANDNcc_R	andncc 	%r8, %r9, %r24
	.word 0xc4720009  ! 406: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc31a0009  ! 406: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0x867a282c  ! 406: SDIV_I	sdiv 	%r8, 0x082c, %r3
	.word 0xb56a2ac8  ! 406: SDIVX_I	sdivx	%r8, 0x0ac8, %r26
	.word 0xc53a0009  ! 410: STDF_R	std	%f2, [%r9, %r8]
	.word 0xcf1a0009  ! 410: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xc85a2868  ! 410: LDX_I	ldx	[%r8 + 0x0868], %r4
	.word 0x9cfa22cc  ! 410: SDIVcc_I	sdivcc 	%r8, 0x02cc, %r14
	.word 0x98320009  ! 411: SUBC_R	orn 	%r8, %r9, %r12
	.word 0xa02a2300  ! 411: ANDN_I	andn 	%r8, 0x0300, %r16
	.word 0x82020009  ! 411: ADD_R	add 	%r8, %r9, %r1
	.word 0x883a27cc  ! 411: XNOR_I	xnor 	%r8, 0x07cc, %r4
	.word 0x8a2a264c  ! 411: ANDN_I	andn 	%r8, 0x064c, %r5
	.word 0x85322001  ! 411: SRL_I	srl 	%r8, 0x0001, %r2
	.word 0xa6320009  ! 411: ORN_R	orn 	%r8, %r9, %r19
	.word 0x881225bc  ! 411: OR_I	or 	%r8, 0x05bc, %r4
	.word 0xad3a1009  ! 411: SRAX_R	srax	%r8, %r9, %r22
	.word 0x9ea22a10  ! 411: SUBcc_I	subcc 	%r8, 0x0a10, %r15
	.word 0x8c420009  ! 411: ADDC_R	addc 	%r8, %r9, %r6
	.word 0xb2420009  ! 411: ADDC_R	addc 	%r8, %r9, %r25
	.word 0xcf3a0009  ! 415: STDF_R	std	%f7, [%r9, %r8]
	.word 0xe20a0009  ! 415: LDUB_R	ldub	[%r8 + %r9], %r17
	.word 0x8e720009  ! 415: UDIV_R	udiv 	%r8, %r9, %r7
	.word 0x866a0009  ! 415: UDIVX_R	udivx 	%r8, %r9, %r3
	.word 0x88320009  ! 416: SUBC_R	orn 	%r8, %r9, %r4
	.word 0x89323001  ! 416: SRLX_I	srlx	%r8, 0x0001, %r4
	.word 0x8e3228d8  ! 416: ORN_I	orn 	%r8, 0x08d8, %r7
	.word 0xaa420009  ! 416: ADDC_R	addc 	%r8, %r9, %r21
	.word 0x860a0009  ! 416: AND_R	and 	%r8, %r9, %r3
	.word 0xb0020009  ! 416: ADD_R	add 	%r8, %r9, %r24
	.word 0x8e2a2bec  ! 416: ANDN_I	andn 	%r8, 0x0bec, %r7
	.word 0xbcaa2ec0  ! 416: ANDNcc_I	andncc 	%r8, 0x0ec0, %r30
	.word 0x8cba0009  ! 416: XNORcc_R	xnorcc 	%r8, %r9, %r6
	.word 0x893a3001  ! 416: SRAX_I	srax	%r8, 0x0001, %r4
	.word 0xce320009  ! 420: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc5020009  ! 420: LDF_R	ld	[%r8, %r9], %f2
	.word 0xc44a2b70  ! 420: LDSB_I	ldsb	[%r8 + 0x0b70], %r2
	.word 0x8e7220e8  ! 420: UDIV_I	udiv 	%r8, 0x00e8, %r7
	.word 0x8ca226f8  ! 421: SUBcc_I	subcc 	%r8, 0x06f8, %r6
	.word 0x8c3a0009  ! 421: XNOR_R	xnor 	%r8, %r9, %r6
	.word 0xba0a20b8  ! 421: AND_I	and 	%r8, 0x00b8, %r29
	.word 0x8a020009  ! 421: ADD_R	add 	%r8, %r9, %r5
	.word 0x8a42261c  ! 421: ADDC_I	addc 	%r8, 0x061c, %r5
	.word 0x86b2240c  ! 421: ORNcc_I	orncc 	%r8, 0x040c, %r3
	.word 0x86020009  ! 421: ADD_R	add 	%r8, %r9, %r3
	.word 0xbca22888  ! 421: SUBcc_I	subcc 	%r8, 0x0888, %r30
	.word 0xaa2a2b5c  ! 421: ANDN_I	andn 	%r8, 0x0b5c, %r21
	.word 0x8f321009  ! 421: SRLX_R	srlx	%r8, %r9, %r7
	.word 0x8eb20009  ! 421: SUBCcc_R	orncc 	%r8, %r9, %r7
	.word 0x40000001  ! 423: CALL	call	disp30_1
	.word 0x8af22abc  ! 423: UDIVcc_I	udivcc 	%r8, 0x0abc, %r5
	.word 0xc53a0009  ! 427: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc40a0009  ! 427: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xda5a29e8  ! 427: LDX_I	ldx	[%r8 + 0x09e8], %r13
	.word 0x88fa2150  ! 427: SDIVcc_I	sdivcc 	%r8, 0x0150, %r4
	.word 0x86ba0009  ! 429: XNORcc_R	xnorcc 	%r8, %r9, %r3
	.word 0x88b22a04  ! 429: ORNcc_I	orncc 	%r8, 0x0a04, %r4
	.word 0xaf2a0009  ! 429: SLL_R	sll 	%r8, %r9, %r23
	.word 0x8ab22a44  ! 429: SUBCcc_I	orncc 	%r8, 0x0a44, %r5
	.word 0xa72a3001  ! 429: SLLX_I	sllx	%r8, 0x0001, %r19
	.word 0xbf3a3001  ! 429: SRAX_I	srax	%r8, 0x0001, %r31
	.word 0xa02a0009  ! 429: ANDN_R	andn 	%r8, %r9, %r16
	.word 0x8e122494  ! 429: OR_I	or 	%r8, 0x0494, %r7
	.word 0xb8022348  ! 429: ADD_I	add 	%r8, 0x0348, %r28
	.word 0x8b3a0009  ! 429: SRA_R	sra 	%r8, %r9, %r5
	.word 0x8d2a2001  ! 429: SLL_I	sll 	%r8, 0x0001, %r6
	.word 0x8e3229a8  ! 429: ORN_I	orn 	%r8, 0x09a8, %r7
	.word 0x8c3221b4  ! 429: SUBC_I	orn 	%r8, 0x01b4, %r6
	.word 0x8c320009  ! 429: SUBC_R	orn 	%r8, %r9, %r6
	.word 0x893a0009  ! 437: SRA_R	sra 	%r8, %r9, %r4
	.word 0x8a2a20cc  ! 437: ANDN_I	andn 	%r8, 0x00cc, %r5
	.word 0x86222a30  ! 437: SUB_I	sub 	%r8, 0x0a30, %r3
	.word 0x84c22c60  ! 437: ADDCcc_I	addccc 	%r8, 0x0c60, %r2
	.word 0xb0c20009  ! 437: ADDCcc_R	addccc 	%r8, %r9, %r24
	.word 0x8c422d00  ! 437: ADDC_I	addc 	%r8, 0x0d00, %r6
	.word 0x981a0009  ! 437: XOR_R	xor 	%r8, %r9, %r12
	.word 0x853a1009  ! 437: SRAX_R	srax	%r8, %r9, %r2
	.word 0x8cb22664  ! 437: ORNcc_I	orncc 	%r8, 0x0664, %r6
	.word 0x83320009  ! 437: SRL_R	srl 	%r8, %r9, %r1
	.word 0xa6322a0c  ! 437: ORN_I	orn 	%r8, 0x0a0c, %r19
	.word 0x20800001  ! 440: BN	bn,a	<label_0x1>
	.word 0xaa6a0009  ! 440: UDIVX_R	udivx 	%r8, %r9, %r21
	.word 0xa32a1009  ! 444: SLLX_R	sllx	%r8, %r9, %r17
	.word 0x8242287c  ! 444: ADDC_I	addc 	%r8, 0x087c, %r1
	.word 0xa2822af0  ! 444: ADDcc_I	addcc 	%r8, 0x0af0, %r17
	.word 0x8a1221b4  ! 444: OR_I	or 	%r8, 0x01b4, %r5
	.word 0xb0b2263c  ! 444: ORNcc_I	orncc 	%r8, 0x063c, %r24
	.word 0x82320009  ! 444: ORN_R	orn 	%r8, %r9, %r1
	.word 0xb4aa2b6c  ! 444: ANDNcc_I	andncc 	%r8, 0x0b6c, %r26
	.word 0x8aaa26a8  ! 444: ANDNcc_I	andncc 	%r8, 0x06a8, %r5
	.word 0x86220009  ! 444: SUB_R	sub 	%r8, %r9, %r3
	.word 0x88322d84  ! 444: SUBC_I	orn 	%r8, 0x0d84, %r4
	.word 0x8d643801  ! 444: MOVcc_I	<illegal instruction>
	.word 0x98b224e8  ! 444: SUBCcc_I	orncc 	%r8, 0x04e8, %r12
	.word 0xa6b22300  ! 444: SUBCcc_I	orncc 	%r8, 0x0300, %r19
	.word 0xbb2a1009  ! 444: SLLX_R	sllx	%r8, %r9, %r29
	.word 0x82320009  ! 445: SUBC_R	orn 	%r8, %r9, %r1
	.word 0x8c320009  ! 445: SUBC_R	orn 	%r8, %r9, %r6
	.word 0x8a8a23f0  ! 445: ANDcc_I	andcc 	%r8, 0x03f0, %r5
	.word 0xa82a0009  ! 445: ANDN_R	andn 	%r8, %r9, %r20
	.word 0x84320009  ! 445: SUBC_R	orn 	%r8, %r9, %r2
	.word 0x88b20009  ! 445: SUBCcc_R	orncc 	%r8, %r9, %r4
	.word 0x88322bec  ! 445: ORN_I	orn 	%r8, 0x0bec, %r4
	.word 0xa0b20009  ! 445: ORNcc_R	orncc 	%r8, %r9, %r16
	.word 0x893a3001  ! 445: SRAX_I	srax	%r8, 0x0001, %r4
	.word 0x88ba21e0  ! 445: XNORcc_I	xnorcc 	%r8, 0x01e0, %r4
	.word 0x889a0009  ! 445: XORcc_R	xorcc 	%r8, %r9, %r4
	.word 0x893a0009  ! 445: SRA_R	sra 	%r8, %r9, %r4
	.word 0x0e800002  ! 447: BVS	bvs  	<label_0x2>
	.word 0x8e720009  ! 447: UDIV_R	udiv 	%r8, %r9, %r7
	.word 0x04c20001  ! 450: BRLEZ	brlez  ,nt	%8,<label_0x20001>
	.word 0x826a0009  ! 450: UDIVX_R	udivx 	%r8, %r9, %r1
	.word 0x873a1009  ! 452: SRAX_R	srax	%r8, %r9, %r3
	.word 0x84022ed0  ! 452: ADD_I	add 	%r8, 0x0ed0, %r2
	.word 0x973a2001  ! 452: SRA_I	sra 	%r8, 0x0001, %r11
	.word 0x8d321009  ! 452: SRLX_R	srlx	%r8, %r9, %r6
	.word 0x88b227d0  ! 452: ORNcc_I	orncc 	%r8, 0x07d0, %r4
	.word 0x8f782401  ! 452: MOVR_I	move	%r0, 0xffffffd0, %r7
	.word 0xb2a22610  ! 452: SUBcc_I	subcc 	%r8, 0x0610, %r25
	.word 0x87641809  ! 452: MOVcc_R	<illegal instruction>
	.word 0x8eaa2bfc  ! 452: ANDNcc_I	andncc 	%r8, 0x0bfc, %r7
	.word 0x8c922530  ! 452: ORcc_I	orcc 	%r8, 0x0530, %r6
	.word 0x94020009  ! 452: ADD_R	add 	%r8, %r9, %r10
	.word 0x84c20009  ! 452: ADDCcc_R	addccc 	%r8, %r9, %r2
	.word 0x9e0a2670  ! 452: AND_I	and 	%r8, 0x0670, %r15
	.word 0x821a2e48  ! 452: XOR_I	xor 	%r8, 0x0e48, %r1
	.word 0xbb321009  ! 452: SRLX_R	srlx	%r8, %r9, %r29
	.word 0x12800002  ! 454: BNE	bne  	<label_0x2>
	.word 0x867a25b8  ! 454: SDIV_I	sdiv 	%r8, 0x05b8, %r3
	.word 0xbb322001  ! 455: SRL_I	srl 	%r8, 0x0001, %r29
	.word 0x83641809  ! 455: MOVcc_R	<illegal instruction>
	.word 0xbe32296c  ! 455: SUBC_I	orn 	%r8, 0x096c, %r31
	.word 0x8a220009  ! 455: SUB_R	sub 	%r8, %r9, %r5
	.word 0x8c820009  ! 455: ADDcc_R	addcc 	%r8, %r9, %r6
	.word 0x8a920009  ! 455: ORcc_R	orcc 	%r8, %r9, %r5
	.word 0xb4320009  ! 455: SUBC_R	orn 	%r8, %r9, %r26
	.word 0xb2aa0009  ! 455: ANDNcc_R	andncc 	%r8, %r9, %r25
	.word 0x8b3a3001  ! 455: SRAX_I	srax	%r8, 0x0001, %r5
	.word 0x84422a24  ! 455: ADDC_I	addc 	%r8, 0x0a24, %r2
	.word 0x8caa2ff0  ! 458: ANDNcc_I	andncc 	%r8, 0x0ff0, %r6
	.word 0x84b22334  ! 458: SUBCcc_I	orncc 	%r8, 0x0334, %r2
	.word 0x840a2068  ! 458: AND_I	and 	%r8, 0x0068, %r2
	.word 0x8c1a0009  ! 458: XOR_R	xor 	%r8, %r9, %r6
	.word 0xb4a22994  ! 458: SUBcc_I	subcc 	%r8, 0x0994, %r26
	.word 0x86820009  ! 458: ADDcc_R	addcc 	%r8, %r9, %r3
	.word 0x8a920009  ! 458: ORcc_R	orcc 	%r8, %r9, %r5
	.word 0x888a0009  ! 458: ANDcc_R	andcc 	%r8, %r9, %r4
	.word 0x852a1009  ! 458: SLLX_R	sllx	%r8, %r9, %r2
	.word 0x87643801  ! 458: MOVcc_I	<illegal instruction>
	.word 0x8a022900  ! 458: ADD_I	add 	%r8, 0x0900, %r5
	.word 0x873a0009  ! 458: SRA_R	sra 	%r8, %r9, %r3
	.word 0x86b20009  ! 458: SUBCcc_R	orncc 	%r8, %r9, %r3
	.word 0x863a2cac  ! 458: XNOR_I	xnor 	%r8, 0x0cac, %r3
	.word 0x9d320009  ! 460: SRL_R	srl 	%r8, %r9, %r14
	.word 0x8c922058  ! 460: ORcc_I	orcc 	%r8, 0x0058, %r6
	.word 0xbd3a1009  ! 460: SRAX_R	srax	%r8, %r9, %r30
	.word 0xbf643801  ! 460: MOVcc_I	<illegal instruction>
	.word 0x8f2a0009  ! 460: SLL_R	sll 	%r8, %r9, %r7
	.word 0x86322df0  ! 460: SUBC_I	orn 	%r8, 0x0df0, %r3
	.word 0x8b322001  ! 460: SRL_I	srl 	%r8, 0x0001, %r5
	.word 0x8a3a219c  ! 460: XNOR_I	xnor 	%r8, 0x019c, %r5
	.word 0xa49a2fe8  ! 460: XORcc_I	xorcc 	%r8, 0x0fe8, %r18
	.word 0x8e120009  ! 460: OR_R	or 	%r8, %r9, %r7
	.word 0xb13a1009  ! 460: SRAX_R	srax	%r8, %r9, %r24
	.word 0x8e3225dc  ! 460: ORN_I	orn 	%r8, 0x05dc, %r7
	.word 0xf62a0009  ! 469: STB_R	stb	%r27, [%r8 + %r9]
	.word 0xe60a0009  ! 469: LDUB_R	ldub	[%r8 + %r9], %r19
	.word 0xa2b22b84  ! 469: SUBCcc_I	orncc 	%r8, 0x0b84, %r17
	.word 0x9472293c  ! 469: UDIV_I	udiv 	%r8, 0x093c, %r10
	.word 0xc42a0009  ! 475: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc71a0009  ! 475: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xc2420009  ! 475: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0x86fa2d8c  ! 475: SDIVcc_I	sdivcc 	%r8, 0x0d8c, %r3
	.word 0x34800001  ! 478: BG	bg,a	<label_0x1>
	.word 0x84fa2884  ! 478: SDIVcc_I	sdivcc 	%r8, 0x0884, %r2
	.word 0x1a800001  ! 481: BCC	bcc  	<label_0x1>
	.word 0x86f22a84  ! 481: UDIVcc_I	udivcc 	%r8, 0x0a84, %r3
	.word 0x88c22318  ! 484: ADDCcc_I	addccc 	%r8, 0x0318, %r4
	.word 0x84020009  ! 484: ADD_R	add 	%r8, %r9, %r2
	.word 0x873a0009  ! 484: SRA_R	sra 	%r8, %r9, %r3
	.word 0xb22a2b10  ! 484: ANDN_I	andn 	%r8, 0x0b10, %r25
	.word 0x8a020009  ! 484: ADD_R	add 	%r8, %r9, %r5
	.word 0x97320009  ! 484: SRL_R	srl 	%r8, %r9, %r11
	.word 0x8a020009  ! 484: ADD_R	add 	%r8, %r9, %r5
	.word 0x88220009  ! 484: SUB_R	sub 	%r8, %r9, %r4
	.word 0x8e420009  ! 484: ADDC_R	addc 	%r8, %r9, %r7
	.word 0x8c3a2c58  ! 484: XNOR_I	xnor 	%r8, 0x0c58, %r6
	.word 0x82022bac  ! 484: ADD_I	add 	%r8, 0x0bac, %r1
	.word 0x8a822704  ! 484: ADDcc_I	addcc 	%r8, 0x0704, %r5
	.word 0xa2420009  ! 484: ADDC_R	addc 	%r8, %r9, %r17
	.word 0x0ac20001  ! 487: BRNZ	brnz  ,nt	%8,<label_0x20001>
	.word 0x88fa2858  ! 487: SDIVcc_I	sdivcc 	%r8, 0x0858, %r4
	.word 0xf82a0009  ! 493: STB_R	stb	%r28, [%r8 + %r9]
	.word 0xc81a0009  ! 493: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xc242223c  ! 493: LDSW_I	ldsw	[%r8 + 0x023c], %r1
	.word 0x967a23ac  ! 493: SDIV_I	sdiv 	%r8, 0x03ac, %r11
	.word 0xc62a0009  ! 499: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc8420009  ! 499: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xb5780409  ! 499: MOVR_R	move	%r0, %r9, %r26
	.word 0x8c722ebc  ! 499: UDIV_I	udiv 	%r8, 0x0ebc, %r6
	.word 0xc7220009  ! 507: STF_R	st	%f3, [%r9, %r8]
	.word 0xf40a0009  ! 507: LDUB_R	ldub	[%r8 + %r9], %r26
	.word 0xb8aa0009  ! 507: ANDNcc_R	andncc 	%r8, %r9, %r28
	.word 0x8e720009  ! 507: UDIV_R	udiv 	%r8, %r9, %r7
	.word 0xca220009  ! 513: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xda0a0009  ! 513: LDUB_R	ldub	[%r8 + %r9], %r13
	.word 0x896a0009  ! 513: SDIVX_R	sdivx	%r8, %r9, %r4
	.word 0xa07a22bc  ! 513: SDIV_I	sdiv 	%r8, 0x02bc, %r16
	.word 0xc4720009  ! 517: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xf0020009  ! 517: LDUW_R	lduw	[%r8 + %r9], %r24
	.word 0x8af228a0  ! 517: UDIVcc_I	udivcc 	%r8, 0x08a0, %r5
	.word 0x8e720009  ! 517: UDIV_R	udiv 	%r8, %r9, %r7
	.word 0x40000001  ! 520: CALL	call	disp30_1
	.word 0xbe720009  ! 520: UDIV_R	udiv 	%r8, %r9, %r31
	.word 0x8c0a0009  ! 521: AND_R	and 	%r8, %r9, %r6
	.word 0xaf2a1009  ! 521: SLLX_R	sllx	%r8, %r9, %r23
	.word 0x868a2354  ! 521: ANDcc_I	andcc 	%r8, 0x0354, %r3
	.word 0x87641809  ! 521: MOVcc_R	<illegal instruction>
	.word 0x86ba2174  ! 521: XNORcc_I	xnorcc 	%r8, 0x0174, %r3
	.word 0xa1780409  ! 521: MOVR_R	move	%r0, %r9, %r16
	.word 0x8b3a0009  ! 521: SRA_R	sra 	%r8, %r9, %r5
	.word 0xb01a2584  ! 521: XOR_I	xor 	%r8, 0x0584, %r24
	.word 0x8e2a0009  ! 521: ANDN_R	andn 	%r8, %r9, %r7
	.word 0x9d2a2001  ! 521: SLL_I	sll 	%r8, 0x0001, %r14
	.word 0x8c420009  ! 521: ADDC_R	addc 	%r8, %r9, %r6
	.word 0x3e800002  ! 529: BVC	bvc,a	<label_0x2>
	.word 0x8e7a20a8  ! 529: SDIV_I	sdiv 	%r8, 0x00a8, %r7
	.word 0x22800002  ! 531: BE	be,a	<label_0x2>
	.word 0x8a6a0009  ! 531: UDIVX_R	udivx 	%r8, %r9, %r5
	.word 0xc8320009  ! 535: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xd9020009  ! 535: LDF_R	ld	[%r8, %r9], %f12
	.word 0x8e7a253c  ! 535: SDIV_I	sdiv 	%r8, 0x053c, %r7
	.word 0x9d6a0009  ! 535: SDIVX_R	sdivx	%r8, %r9, %r14
	.word 0xc5220009  ! 539: STF_R	st	%f2, [%r9, %r8]
	.word 0xf44a0009  ! 539: LDSB_R	ldsb	[%r8 + %r9], %r26
	.word 0x82fa2228  ! 539: SDIVcc_I	sdivcc 	%r8, 0x0228, %r1
	.word 0x887a0009  ! 539: SDIV_R	sdiv 	%r8, %r9, %r4
	.word 0xc62a0009  ! 543: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc71a0009  ! 543: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xb8720009  ! 543: UDIV_R	udiv 	%r8, %r9, %r28
	.word 0x82fa0009  ! 543: SDIVcc_R	sdivcc 	%r8, %r9, %r1
	.word 0xc7220009  ! 548: STF_R	st	%f3, [%r9, %r8]
	.word 0xc4420009  ! 548: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0x8e6a0009  ! 548: UDIVX_R	udivx 	%r8, %r9, %r7
	.word 0x867a0009  ! 548: SDIV_R	sdiv 	%r8, %r9, %r3
	.word 0x12800002  ! 550: BNE	bne  	<label_0x2>
	.word 0x8c7a26e4  ! 550: SDIV_I	sdiv 	%r8, 0x06e4, %r6
	.word 0x40000002  ! 554: CALL	call	disp30_2
	.word 0xbcfa0009  ! 554: SDIVcc_R	sdivcc 	%r8, %r9, %r30
	.word 0x0c800001  ! 557: BNEG	bneg  	<label_0x1>
	.word 0x8ef22f58  ! 557: UDIVcc_I	udivcc 	%r8, 0x0f58, %r7
	.word 0xfd3a0009  ! 561: STDF_R	std	%f30, [%r9, %r8]
	.word 0xca0a0009  ! 561: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0x8cf22564  ! 561: UDIVcc_I	udivcc 	%r8, 0x0564, %r6
	.word 0xacfa2258  ! 561: SDIVcc_I	sdivcc 	%r8, 0x0258, %r22
	.word 0xbe320009  ! 562: SUBC_R	orn 	%r8, %r9, %r31
	.word 0x8a1a2df4  ! 562: XOR_I	xor 	%r8, 0x0df4, %r5
	.word 0x82120009  ! 562: OR_R	or 	%r8, %r9, %r1
	.word 0x8d780409  ! 562: MOVR_R	move	%r0, %r9, %r6
	.word 0x84020009  ! 562: ADD_R	add 	%r8, %r9, %r2
	.word 0x8eb20009  ! 562: SUBCcc_R	orncc 	%r8, %r9, %r7
	.word 0x9f3a1009  ! 562: SRAX_R	srax	%r8, %r9, %r15
	.word 0x86c22148  ! 562: ADDCcc_I	addccc 	%r8, 0x0148, %r3
	.word 0x84822fb4  ! 562: ADDcc_I	addcc 	%r8, 0x0fb4, %r2
	.word 0x8b320009  ! 562: SRL_R	srl 	%r8, %r9, %r5
	.word 0x2cca0001  ! 568: BRGZ	brgz,a,pt	%8,<label_0xa0001>
	.word 0xae720009  ! 568: UDIV_R	udiv 	%r8, %r9, %r23
	.word 0x02800001  ! 572: BE	be  	<label_0x1>
	.word 0xb56a0009  ! 572: SDIVX_R	sdivx	%r8, %r9, %r26
	.word 0xb81a0009  ! 574: XOR_R	xor 	%r8, %r9, %r28
	.word 0x8b780409  ! 574: MOVR_R	move	%r0, %r9, %r5
	.word 0x8e2a2510  ! 574: ANDN_I	andn 	%r8, 0x0510, %r7
	.word 0x9eba21b4  ! 574: XNORcc_I	xnorcc 	%r8, 0x01b4, %r15
	.word 0xab782401  ! 574: MOVR_I	move	%r0, 0x1b4, %r21
	.word 0x893a0009  ! 574: SRA_R	sra 	%r8, %r9, %r4
	.word 0x87322001  ! 574: SRL_I	srl 	%r8, 0x0001, %r3
	.word 0x8a922538  ! 574: ORcc_I	orcc 	%r8, 0x0538, %r5
	.word 0x8d3a0009  ! 574: SRA_R	sra 	%r8, %r9, %r6
	.word 0x833a0009  ! 574: SRA_R	sra 	%r8, %r9, %r1
	.word 0xbaaa0009  ! 574: ANDNcc_R	andncc 	%r8, %r9, %r29
	.word 0xa68a2f04  ! 574: ANDcc_I	andcc 	%r8, 0x0f04, %r19
	.word 0x864225e4  ! 574: ADDC_I	addc 	%r8, 0x05e4, %r3
	.word 0x8c020009  ! 574: ADD_R	add 	%r8, %r9, %r6
	.word 0xcd220009  ! 578: STF_R	st	%f6, [%r9, %r8]
	.word 0xc31a0009  ! 578: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0x867a0009  ! 578: SDIV_R	sdiv 	%r8, %r9, %r3
	.word 0x8c7a2f70  ! 578: SDIV_I	sdiv 	%r8, 0x0f70, %r6
	.word 0x82820009  ! 582: ADDcc_R	addcc 	%r8, %r9, %r1
	.word 0x8cba0009  ! 582: XNORcc_R	xnorcc 	%r8, %r9, %r6
	.word 0x97782401  ! 582: MOVR_I	move	%r0, 0x9, %r11
	.word 0x88c20009  ! 582: ADDCcc_R	addccc 	%r8, %r9, %r4
	.word 0x8d2a2001  ! 582: SLL_I	sll 	%r8, 0x0001, %r6
	.word 0x87643801  ! 582: MOVcc_I	<illegal instruction>
	.word 0x8c2a2d1c  ! 582: ANDN_I	andn 	%r8, 0x0d1c, %r6
	.word 0x84820009  ! 582: ADDcc_R	addcc 	%r8, %r9, %r2
	.word 0xa6aa0009  ! 582: ANDNcc_R	andncc 	%r8, %r9, %r19
	.word 0x9a820009  ! 582: ADDcc_R	addcc 	%r8, %r9, %r13
	.word 0x9e020009  ! 582: ADD_R	add 	%r8, %r9, %r15
	.word 0x852a3001  ! 582: SLLX_I	sllx	%r8, 0x0001, %r2
	.word 0x8d3a3001  ! 582: SRAX_I	srax	%r8, 0x0001, %r6
	.word 0x82922354  ! 582: ORcc_I	orcc 	%r8, 0x0354, %r1
	.word 0x88422258  ! 582: ADDC_I	addc 	%r8, 0x0258, %r4
	.word 0x86320009  ! 585: ORN_R	orn 	%r8, %r9, %r3
	.word 0xbaa22910  ! 585: SUBcc_I	subcc 	%r8, 0x0910, %r29
	.word 0x862a0009  ! 585: ANDN_R	andn 	%r8, %r9, %r3
	.word 0x84320009  ! 585: ORN_R	orn 	%r8, %r9, %r2
	.word 0xa00a0009  ! 585: AND_R	and 	%r8, %r9, %r16
	.word 0xad2a0009  ! 585: SLL_R	sll 	%r8, %r9, %r22
	.word 0x82a20009  ! 585: SUBcc_R	subcc 	%r8, %r9, %r1
	.word 0x94ba0009  ! 585: XNORcc_R	xnorcc 	%r8, %r9, %r10
	.word 0x8eb20009  ! 585: SUBCcc_R	orncc 	%r8, %r9, %r7
	.word 0x969a20d8  ! 585: XORcc_I	xorcc 	%r8, 0x00d8, %r11
	.word 0x88b20009  ! 585: ORNcc_R	orncc 	%r8, %r9, %r4
	.word 0xb2322280  ! 585: SUBC_I	orn 	%r8, 0x0280, %r25
	.word 0xbf321009  ! 585: SRLX_R	srlx	%r8, %r9, %r31
	.word 0xb1321009  ! 585: SRLX_R	srlx	%r8, %r9, %r24
	.word 0x8c322940  ! 588: ORN_I	orn 	%r8, 0x0940, %r6
	.word 0x8ea20009  ! 588: SUBcc_R	subcc 	%r8, %r9, %r7
	.word 0x94120009  ! 588: OR_R	or 	%r8, %r9, %r10
	.word 0x8e822b4c  ! 588: ADDcc_I	addcc 	%r8, 0x0b4c, %r7
	.word 0x8e2a0009  ! 588: ANDN_R	andn 	%r8, %r9, %r7
	.word 0x8e120009  ! 588: OR_R	or 	%r8, %r9, %r7
	.word 0x952a2001  ! 588: SLL_I	sll 	%r8, 0x0001, %r10
	.word 0x8e422b28  ! 588: ADDC_I	addc 	%r8, 0x0b28, %r7
	.word 0xa73a1009  ! 588: SRAX_R	srax	%r8, %r9, %r19
	.word 0x8f321009  ! 588: SRLX_R	srlx	%r8, %r9, %r7
	.word 0xbe922810  ! 588: ORcc_I	orcc 	%r8, 0x0810, %r31
	.word 0x8e3223a8  ! 590: SUBC_I	orn 	%r8, 0x03a8, %r7
	.word 0x833a0009  ! 590: SRA_R	sra 	%r8, %r9, %r1
	.word 0xa4ba2350  ! 590: XNORcc_I	xnorcc 	%r8, 0x0350, %r18
	.word 0x823a2800  ! 590: XNOR_I	xnor 	%r8, 0x0800, %r1
	.word 0x833a3001  ! 590: SRAX_I	srax	%r8, 0x0001, %r1
	.word 0x8a120009  ! 590: OR_R	or 	%r8, %r9, %r5
	.word 0x86aa0009  ! 590: ANDNcc_R	andncc 	%r8, %r9, %r3
	.word 0xa0ba2994  ! 590: XNORcc_I	xnorcc 	%r8, 0x0994, %r16
	.word 0x8d321009  ! 590: SRLX_R	srlx	%r8, %r9, %r6
	.word 0xbc9a2210  ! 590: XORcc_I	xorcc 	%r8, 0x0210, %r30
	.word 0x89322001  ! 590: SRL_I	srl 	%r8, 0x0001, %r4
	.word 0xa6aa0009  ! 591: ANDNcc_R	andncc 	%r8, %r9, %r19
	.word 0x8eb22048  ! 591: SUBCcc_I	orncc 	%r8, 0x0048, %r7
	.word 0x82922d34  ! 591: ORcc_I	orcc 	%r8, 0x0d34, %r1
	.word 0xa0ba216c  ! 591: XNORcc_I	xnorcc 	%r8, 0x016c, %r16
	.word 0xae222184  ! 591: SUB_I	sub 	%r8, 0x0184, %r23
	.word 0x84ba0009  ! 591: XNORcc_R	xnorcc 	%r8, %r9, %r2
	.word 0x843a0009  ! 591: XNOR_R	xnor 	%r8, %r9, %r2
	.word 0x83643801  ! 591: MOVcc_I	<illegal instruction>
	.word 0xa22a2ee8  ! 591: ANDN_I	andn 	%r8, 0x0ee8, %r17
	.word 0xa6022e08  ! 591: ADD_I	add 	%r8, 0x0e08, %r19
	.word 0x8f323001  ! 591: SRLX_I	srlx	%r8, 0x0001, %r7
	.word 0xca320009  ! 598: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xca020009  ! 598: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0x86b22040  ! 598: SUBCcc_I	orncc 	%r8, 0x0040, %r3
	.word 0x836a2ab4  ! 598: SDIVX_I	sdivx	%r8, 0x0ab4, %r1
	.word 0x880a2874  ! 599: AND_I	and 	%r8, 0x0874, %r4
	.word 0x9ab20009  ! 599: ORNcc_R	orncc 	%r8, %r9, %r13
	.word 0x84322ec0  ! 599: SUBC_I	orn 	%r8, 0x0ec0, %r2
	.word 0x828a0009  ! 599: ANDcc_R	andcc 	%r8, %r9, %r1
	.word 0x848a0009  ! 599: ANDcc_R	andcc 	%r8, %r9, %r2
	.word 0x8cb22c04  ! 599: ORNcc_I	orncc 	%r8, 0x0c04, %r6
	.word 0x8c3a0009  ! 599: XNOR_R	xnor 	%r8, %r9, %r6
	.word 0x8d3a0009  ! 599: SRA_R	sra 	%r8, %r9, %r6
	.word 0x863a249c  ! 599: XNOR_I	xnor 	%r8, 0x049c, %r3
	.word 0x87322001  ! 599: SRL_I	srl 	%r8, 0x0001, %r3
	.word 0x82922ce0  ! 599: ORcc_I	orcc 	%r8, 0x0ce0, %r1
	.word 0x940a0009  ! 599: AND_R	and 	%r8, %r9, %r10
	.word 0xb23a292c  ! 599: XNOR_I	xnor 	%r8, 0x092c, %r25
	.word 0x981226a0  ! 599: OR_I	or 	%r8, 0x06a0, %r12
	.word 0xc6220009  ! 603: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xca0a0009  ! 603: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xc85a0009  ! 603: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0x867a2ac4  ! 603: SDIV_I	sdiv 	%r8, 0x0ac4, %r3
	.word 0x8a1a2d60  ! 605: XOR_I	xor 	%r8, 0x0d60, %r5
	.word 0x9ec22f90  ! 605: ADDCcc_I	addccc 	%r8, 0x0f90, %r15
	.word 0xae222b3c  ! 605: SUB_I	sub 	%r8, 0x0b3c, %r23
	.word 0x96b226dc  ! 605: SUBCcc_I	orncc 	%r8, 0x06dc, %r11
	.word 0x96922658  ! 605: ORcc_I	orcc 	%r8, 0x0658, %r11
	.word 0x8d3a0009  ! 605: SRA_R	sra 	%r8, %r9, %r6
	.word 0x88420009  ! 605: ADDC_R	addc 	%r8, %r9, %r4
	.word 0x8eb20009  ! 605: SUBCcc_R	orncc 	%r8, %r9, %r7
	.word 0xb8820009  ! 605: ADDcc_R	addcc 	%r8, %r9, %r28
	.word 0xb6820009  ! 605: ADDcc_R	addcc 	%r8, %r9, %r27
	.word 0x87322001  ! 605: SRL_I	srl 	%r8, 0x0001, %r3
	.word 0x98b20009  ! 605: SUBCcc_R	orncc 	%r8, %r9, %r12
	.word 0xda2a0009  ! 609: STB_R	stb	%r13, [%r8 + %r9]
	.word 0xca5a0009  ! 609: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0x867a25dc  ! 609: SDIV_I	sdiv 	%r8, 0x05dc, %r3
	.word 0x947a2aa0  ! 609: SDIV_I	sdiv 	%r8, 0x0aa0, %r10
	.word 0xe8720009  ! 615: STX_R	stx	%r20, [%r8 + %r9]
	.word 0xe25a0009  ! 615: LDX_R	ldx	[%r8 + %r9], %r17
	.word 0x846a2660  ! 615: UDIVX_I	udivx 	%r8, 0x0660, %r2
	.word 0x826a0009  ! 615: UDIVX_R	udivx 	%r8, %r9, %r1
	.word 0x1c800001  ! 618: BPOS	bpos  	<label_0x1>
	.word 0x896a0009  ! 618: SDIVX_R	sdivx	%r8, %r9, %r4
	.word 0x882a2140  ! 619: ANDN_I	andn 	%r8, 0x0140, %r4
	.word 0x860a25d0  ! 619: AND_I	and 	%r8, 0x05d0, %r3
	.word 0xa2aa0009  ! 619: ANDNcc_R	andncc 	%r8, %r9, %r17
	.word 0x85782401  ! 619: MOVR_I	move	%r0, 0x9, %r2
	.word 0x88420009  ! 619: ADDC_R	addc 	%r8, %r9, %r4
	.word 0x853a2001  ! 619: SRA_I	sra 	%r8, 0x0001, %r2
	.word 0x828a2360  ! 619: ANDcc_I	andcc 	%r8, 0x0360, %r1
	.word 0x8a422294  ! 619: ADDC_I	addc 	%r8, 0x0294, %r5
	.word 0xa64220c4  ! 619: ADDC_I	addc 	%r8, 0x00c4, %r19
	.word 0xbaaa0009  ! 619: ANDNcc_R	andncc 	%r8, %r9, %r29
	.word 0x97780409  ! 619: MOVR_R	move	%r0, %r9, %r11
	.word 0xc73a0009  ! 624: STDF_R	std	%f3, [%r9, %r8]
	.word 0xd9020009  ! 624: LDF_R	ld	[%r8, %r9], %f12
	.word 0x88fa2fd4  ! 624: SDIVcc_I	sdivcc 	%r8, 0x0fd4, %r4
	.word 0x8c72237c  ! 624: UDIV_I	udiv 	%r8, 0x037c, %r6
	.word 0xc2220009  ! 628: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xce4a0009  ! 628: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0x966a2e38  ! 628: UDIVX_I	udivx 	%r8, 0x0e38, %r11
	.word 0x9cf20009  ! 628: UDIVcc_R	udivcc 	%r8, %r9, %r14
	.word 0x8a022c7c  ! 632: ADD_I	add 	%r8, 0x0c7c, %r5
	.word 0xa81a2b6c  ! 632: XOR_I	xor 	%r8, 0x0b6c, %r20
	.word 0x85321009  ! 632: SRLX_R	srlx	%r8, %r9, %r2
	.word 0x8c120009  ! 632: OR_R	or 	%r8, %r9, %r6
	.word 0xb8222824  ! 632: SUB_I	sub 	%r8, 0x0824, %r28
	.word 0x83780409  ! 632: MOVR_R	move	%r0, %r9, %r1
	.word 0x88c22134  ! 632: ADDCcc_I	addccc 	%r8, 0x0134, %r4
	.word 0x82420009  ! 632: ADDC_R	addc 	%r8, %r9, %r1
	.word 0x9aba0009  ! 632: XNORcc_R	xnorcc 	%r8, %r9, %r13
	.word 0x8ca22f44  ! 632: SUBcc_I	subcc 	%r8, 0x0f44, %r6
	.word 0x9eaa266c  ! 632: ANDNcc_I	andncc 	%r8, 0x066c, %r15
	.word 0x8c3224ec  ! 632: ORN_I	orn 	%r8, 0x04ec, %r6
	.word 0xb92a1009  ! 632: SLLX_R	sllx	%r8, %r9, %r28
	.word 0x833a0009  ! 632: SRA_R	sra 	%r8, %r9, %r1
	.word 0x849224a4  ! 632: ORcc_I	orcc 	%r8, 0x04a4, %r2
	.word 0xce220009  ! 643: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc65a0009  ! 643: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0x84720009  ! 643: UDIV_R	udiv 	%r8, %r9, %r2
	.word 0x84fa2ac0  ! 643: SDIVcc_I	sdivcc 	%r8, 0x0ac0, %r2
	.word 0x26c20001  ! 647: BRLZ	brlz,a,nt	%8,<label_0x20001>
	.word 0x8e7224c0  ! 647: UDIV_I	udiv 	%r8, 0x04c0, %r7
	.word 0x24c20001  ! 652: BRLEZ	brlez,a,nt	%8,<label_0x20001>
	.word 0x826a2e9c  ! 652: UDIVX_I	udivx 	%r8, 0x0e9c, %r1
	.word 0xa32a0009  ! 655: SLL_R	sll 	%r8, %r9, %r17
	.word 0xb72a0009  ! 655: SLL_R	sll 	%r8, %r9, %r27
	.word 0x9c822e6c  ! 655: ADDcc_I	addcc 	%r8, 0x0e6c, %r14
	.word 0x889a2f38  ! 655: XORcc_I	xorcc 	%r8, 0x0f38, %r4
	.word 0x868220bc  ! 655: ADDcc_I	addcc 	%r8, 0x00bc, %r3
	.word 0x89323001  ! 655: SRLX_I	srlx	%r8, 0x0001, %r4
	.word 0x86120009  ! 655: OR_R	or 	%r8, %r9, %r3
	.word 0x832a3001  ! 655: SLLX_I	sllx	%r8, 0x0001, %r1
	.word 0x84020009  ! 655: ADD_R	add 	%r8, %r9, %r2
	.word 0xa40a25ec  ! 655: AND_I	and 	%r8, 0x05ec, %r18
	.word 0xc9220009  ! 659: STF_R	st	%f4, [%r9, %r8]
	.word 0xc81a0009  ! 659: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x8d780409  ! 659: MOVR_R	move	%r0, %r9, %r6
	.word 0xa07a0009  ! 659: SDIV_R	sdiv 	%r8, %r9, %r16
	.word 0xea720009  ! 665: STX_R	stx	%r21, [%r8 + %r9]
	.word 0xcf1a0009  ! 665: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0x88720009  ! 665: UDIV_R	udiv 	%r8, %r9, %r4
	.word 0x84722190  ! 665: UDIV_I	udiv 	%r8, 0x0190, %r2
	.word 0x40000001  ! 667: CALL	call	disp30_1
	.word 0x896a2984  ! 667: SDIVX_I	sdivx	%r8, 0x0984, %r4
	.word 0xbcba2ffc  ! 668: XNORcc_I	xnorcc 	%r8, 0x0ffc, %r30
	.word 0x820a256c  ! 668: AND_I	and 	%r8, 0x056c, %r1
	.word 0x868a2708  ! 668: ANDcc_I	andcc 	%r8, 0x0708, %r3
	.word 0x9aba2298  ! 668: XNORcc_I	xnorcc 	%r8, 0x0298, %r13
	.word 0x86822918  ! 668: ADDcc_I	addcc 	%r8, 0x0918, %r3
	.word 0xb2320009  ! 668: SUBC_R	orn 	%r8, %r9, %r25
	.word 0x940a0009  ! 668: AND_R	and 	%r8, %r9, %r10
	.word 0x86a20009  ! 668: SUBcc_R	subcc 	%r8, %r9, %r3
	.word 0xbcb20009  ! 668: ORNcc_R	orncc 	%r8, %r9, %r30
	.word 0xac8a23a4  ! 668: ANDcc_I	andcc 	%r8, 0x03a4, %r22
	.word 0x8e1228b0  ! 668: OR_I	or 	%r8, 0x08b0, %r7
	.word 0x8b780409  ! 670: MOVR_R	move	%r0, %r9, %r5
	.word 0x8c0225f4  ! 670: ADD_I	add 	%r8, 0x05f4, %r6
	.word 0x87323001  ! 670: SRLX_I	srlx	%r8, 0x0001, %r3
	.word 0x85321009  ! 670: SRLX_R	srlx	%r8, %r9, %r2
	.word 0x8e0a22cc  ! 670: AND_I	and 	%r8, 0x02cc, %r7
	.word 0x8d780409  ! 670: MOVR_R	move	%r0, %r9, %r6
	.word 0xb63225c0  ! 670: ORN_I	orn 	%r8, 0x05c0, %r27
	.word 0x8c8a0009  ! 670: ANDcc_R	andcc 	%r8, %r9, %r6
	.word 0x8c3a2ba0  ! 670: XNOR_I	xnor 	%r8, 0x0ba0, %r6
	.word 0x84222750  ! 670: SUB_I	sub 	%r8, 0x0750, %r2
	.word 0x8ca22c8c  ! 670: SUBcc_I	subcc 	%r8, 0x0c8c, %r6
	.word 0x88320009  ! 670: SUBC_R	orn 	%r8, %r9, %r4
	.word 0x89643801  ! 670: MOVcc_I	<illegal instruction>
	.word 0x9d2a0009  ! 672: SLL_R	sll 	%r8, %r9, %r14
	.word 0x8b321009  ! 672: SRLX_R	srlx	%r8, %r9, %r5
	.word 0x82ba2618  ! 672: XNORcc_I	xnorcc 	%r8, 0x0618, %r1
	.word 0x833a3001  ! 672: SRAX_I	srax	%r8, 0x0001, %r1
	.word 0x848a0009  ! 672: ANDcc_R	andcc 	%r8, %r9, %r2
	.word 0x863a0009  ! 672: XNOR_R	xnor 	%r8, %r9, %r3
	.word 0x880a0009  ! 672: AND_R	and 	%r8, %r9, %r4
	.word 0x862a0009  ! 672: ANDN_R	andn 	%r8, %r9, %r3
	.word 0x8c820009  ! 672: ADDcc_R	addcc 	%r8, %r9, %r6
	.word 0x84820009  ! 672: ADDcc_R	addcc 	%r8, %r9, %r2
	.word 0xc2220009  ! 677: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xee5a0009  ! 677: LDX_R	ldx	[%r8 + %r9], %r23
	.word 0x8a720009  ! 677: UDIV_R	udiv 	%r8, %r9, %r5
	.word 0x98f225b8  ! 677: UDIVcc_I	udivcc 	%r8, 0x05b8, %r12
	.word 0x83643801  ! 683: MOVcc_I	<illegal instruction>
	.word 0x8ab22394  ! 683: SUBCcc_I	orncc 	%r8, 0x0394, %r5
	.word 0xaa820009  ! 683: ADDcc_R	addcc 	%r8, %r9, %r21
	.word 0xab782401  ! 683: MOVR_I	move	%r0, 0x9, %r21
	.word 0x9a420009  ! 683: ADDC_R	addc 	%r8, %r9, %r13
	.word 0x9e120009  ! 683: OR_R	or 	%r8, %r9, %r15
	.word 0x8cb20009  ! 683: SUBCcc_R	orncc 	%r8, %r9, %r6
	.word 0x8a120009  ! 683: OR_R	or 	%r8, %r9, %r5
	.word 0xb6320009  ! 683: ORN_R	orn 	%r8, %r9, %r27
	.word 0xbf3a1009  ! 683: SRAX_R	srax	%r8, %r9, %r31
	.word 0xb0a222e8  ! 683: SUBcc_I	subcc 	%r8, 0x02e8, %r24
	.word 0x892a0009  ! 683: SLL_R	sll 	%r8, %r9, %r4
	.word 0x84c22458  ! 685: ADDCcc_I	addccc 	%r8, 0x0458, %r2
	.word 0xa2320009  ! 685: SUBC_R	orn 	%r8, %r9, %r17
	.word 0xbf641809  ! 685: MOVcc_R	<illegal instruction>
	.word 0x82020009  ! 685: ADD_R	add 	%r8, %r9, %r1
	.word 0x832a0009  ! 685: SLL_R	sll 	%r8, %r9, %r1
	.word 0x881a2d24  ! 685: XOR_I	xor 	%r8, 0x0d24, %r4
	.word 0x8e022328  ! 685: ADD_I	add 	%r8, 0x0328, %r7
	.word 0x86a20009  ! 685: SUBcc_R	subcc 	%r8, %r9, %r3
	.word 0xb1320009  ! 685: SRL_R	srl 	%r8, %r9, %r24
	.word 0x82222528  ! 685: SUB_I	sub 	%r8, 0x0528, %r1
	.word 0x868a0009  ! 685: ANDcc_R	andcc 	%r8, %r9, %r3
	.word 0xa0322808  ! 685: ORN_I	orn 	%r8, 0x0808, %r16
	.word 0xa0a20009  ! 685: SUBcc_R	subcc 	%r8, %r9, %r16
	.word 0x88a20009  ! 685: SUBcc_R	subcc 	%r8, %r9, %r4
	.word 0xce220009  ! 689: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xec420009  ! 689: LDSW_R	ldsw	[%r8 + %r9], %r22
	.word 0xce020009  ! 689: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0x98fa2680  ! 689: SDIVcc_I	sdivcc 	%r8, 0x0680, %r12
	.word 0x18800001  ! 691: BGU	bgu  	<label_0x1>
	.word 0x956a0009  ! 691: SDIVX_R	sdivx	%r8, %r9, %r10
	.word 0x0c800002  ! 695: BNEG	bneg  	<label_0x2>
	.word 0x826a0009  ! 695: UDIVX_R	udivx 	%r8, %r9, %r1
	.word 0x24800001  ! 700: BLE	ble,a	<label_0x1>
	.word 0x967a0009  ! 700: SDIV_R	sdiv 	%r8, %r9, %r11
	.word 0xa93a0009  ! 702: SRA_R	sra 	%r8, %r9, %r20
	.word 0x8b782401  ! 702: MOVR_I	move	%r0, 0x9, %r5
	.word 0x8b320009  ! 702: SRL_R	srl 	%r8, %r9, %r5
	.word 0x8a920009  ! 702: ORcc_R	orcc 	%r8, %r9, %r5
	.word 0x88b2255c  ! 702: ORNcc_I	orncc 	%r8, 0x055c, %r4
	.word 0x8caa2788  ! 702: ANDNcc_I	andncc 	%r8, 0x0788, %r6
	.word 0x86c224d8  ! 702: ADDCcc_I	addccc 	%r8, 0x04d8, %r3
	.word 0x828a28bc  ! 702: ANDcc_I	andcc 	%r8, 0x08bc, %r1
	.word 0x8cb22c1c  ! 702: ORNcc_I	orncc 	%r8, 0x0c1c, %r6
	.word 0x853a3001  ! 702: SRAX_I	srax	%r8, 0x0001, %r2
	.word 0x9a1229d4  ! 703: OR_I	or 	%r8, 0x09d4, %r13
	.word 0x880a2198  ! 703: AND_I	and 	%r8, 0x0198, %r4
	.word 0x9e8a2d70  ! 703: ANDcc_I	andcc 	%r8, 0x0d70, %r15
	.word 0x87322001  ! 703: SRL_I	srl 	%r8, 0x0001, %r3
	.word 0xb93a2001  ! 703: SRA_I	sra 	%r8, 0x0001, %r28
	.word 0xbf2a1009  ! 703: SLLX_R	sllx	%r8, %r9, %r31
	.word 0x82c222f8  ! 703: ADDCcc_I	addccc 	%r8, 0x02f8, %r1
	.word 0x8e0223a0  ! 703: ADD_I	add 	%r8, 0x03a0, %r7
	.word 0x82aa0009  ! 703: ANDNcc_R	andncc 	%r8, %r9, %r1
	.word 0x8c922378  ! 703: ORcc_I	orcc 	%r8, 0x0378, %r6
	.word 0x87323001  ! 703: SRLX_I	srlx	%r8, 0x0001, %r3
	.word 0x8e4226e0  ! 703: ADDC_I	addc 	%r8, 0x06e0, %r7
	.word 0x82b20009  ! 703: ORNcc_R	orncc 	%r8, %r9, %r1
	.word 0x868a270c  ! 703: ANDcc_I	andcc 	%r8, 0x070c, %r3
	.word 0xb4320009  ! 708: ORN_R	orn 	%r8, %r9, %r26
	.word 0xae322b04  ! 708: SUBC_I	orn 	%r8, 0x0b04, %r23
	.word 0x86320009  ! 708: SUBC_R	orn 	%r8, %r9, %r3
	.word 0x85322001  ! 708: SRL_I	srl 	%r8, 0x0001, %r2
	.word 0x98a20009  ! 708: SUBcc_R	subcc 	%r8, %r9, %r12
	.word 0x86ba0009  ! 708: XNORcc_R	xnorcc 	%r8, %r9, %r3
	.word 0x86322680  ! 708: ORN_I	orn 	%r8, 0x0680, %r3
	.word 0x9c220009  ! 708: SUB_R	sub 	%r8, %r9, %r14
	.word 0x8aa22b0c  ! 708: SUBcc_I	subcc 	%r8, 0x0b0c, %r5
	.word 0x8a320009  ! 708: SUBC_R	orn 	%r8, %r9, %r5
	.word 0x8b3a2001  ! 708: SRA_I	sra 	%r8, 0x0001, %r5
	.word 0x83641809  ! 708: MOVcc_R	<illegal instruction>
	.word 0x06ca0001  ! 714: BRLZ	brlz  ,pt	%8,<label_0xa0001>
	.word 0x8d6a29a4  ! 714: SDIVX_I	sdivx	%r8, 0x09a4, %r6
	.word 0xef3a0009  ! 718: STDF_R	std	%f23, [%r9, %r8]
	.word 0xc81a0009  ! 718: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x820a0009  ! 718: AND_R	and 	%r8, %r9, %r1
	.word 0xbc6a22e0  ! 718: UDIVX_I	udivx 	%r8, 0x02e0, %r30
	.word 0xca720009  ! 723: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc9020009  ! 723: LDF_R	ld	[%r8, %r9], %f4
	.word 0xa4fa0009  ! 723: SDIVcc_R	sdivcc 	%r8, %r9, %r18
	.word 0x8cfa2070  ! 723: SDIVcc_I	sdivcc 	%r8, 0x0070, %r6
	.word 0x8c020009  ! 729: ADD_R	add 	%r8, %r9, %r6
	.word 0xaaa20009  ! 729: SUBcc_R	subcc 	%r8, %r9, %r21
	.word 0x8d782401  ! 729: MOVR_I	move	%r0, 0x9, %r6
	.word 0x86aa0009  ! 729: ANDNcc_R	andncc 	%r8, %r9, %r3
	.word 0x832a1009  ! 729: SLLX_R	sllx	%r8, %r9, %r1
	.word 0x85320009  ! 729: SRL_R	srl 	%r8, %r9, %r2
	.word 0x96b20009  ! 729: SUBCcc_R	orncc 	%r8, %r9, %r11
	.word 0x9f322001  ! 729: SRL_I	srl 	%r8, 0x0001, %r15
	.word 0x882a0009  ! 729: ANDN_R	andn 	%r8, %r9, %r4
	.word 0xacb20009  ! 729: ORNcc_R	orncc 	%r8, %r9, %r22
	.word 0xae820009  ! 729: ADDcc_R	addcc 	%r8, %r9, %r23
	.word 0x82120009  ! 729: OR_R	or 	%r8, %r9, %r1
	.word 0x8e320009  ! 729: SUBC_R	orn 	%r8, %r9, %r7
	.word 0xcc320009  ! 733: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc4520009  ! 733: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0x8a7a0009  ! 733: SDIV_R	sdiv 	%r8, %r9, %r5
	.word 0x866a0009  ! 733: UDIVX_R	udivx 	%r8, %r9, %r3
	.word 0xce720009  ! 739: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc3020009  ! 739: LDF_R	ld	[%r8, %r9], %f1
	.word 0x996a2908  ! 739: SDIVX_I	sdivx	%r8, 0x0908, %r12
	.word 0xa8722390  ! 739: UDIV_I	udiv 	%r8, 0x0390, %r20
	.word 0x02ca0001  ! 741: BRZ	brz  ,pt	%8,<label_0xa0001>
	.word 0xa2f22f28  ! 741: UDIVcc_I	udivcc 	%r8, 0x0f28, %r17
	.word 0xec320009  ! 745: STH_R	sth	%r22, [%r8 + %r9]
	.word 0xc8020009  ! 745: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0x886a2a68  ! 745: UDIVX_I	udivx 	%r8, 0x0a68, %r4
	.word 0x88720009  ! 745: UDIV_R	udiv 	%r8, %r9, %r4
	.word 0x20800001  ! 748: BN	bn,a	<label_0x1>
	.word 0x876a0009  ! 748: SDIVX_R	sdivx	%r8, %r9, %r3
	.word 0x38800001  ! 754: BGU	bgu,a	<label_0x1>
	.word 0x8d6a0009  ! 754: SDIVX_R	sdivx	%r8, %r9, %r6
	.word 0xc8220009  ! 759: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xca420009  ! 759: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0x8af22a20  ! 759: UDIVcc_I	udivcc 	%r8, 0x0a20, %r5
	.word 0x8c6a0009  ! 759: UDIVX_R	udivx 	%r8, %r9, %r6
	.word 0x12800001  ! 761: BNE	bne  	<label_0x1>
	.word 0xbf6a0009  ! 761: SDIVX_R	sdivx	%r8, %r9, %r31
	.word 0xce2a0009  ! 765: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc41a0009  ! 765: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xaaf2291c  ! 765: UDIVcc_I	udivcc 	%r8, 0x091c, %r21
	.word 0x996a0009  ! 765: SDIVX_R	sdivx	%r8, %r9, %r12
	.word 0x40000001  ! 767: CALL	call	disp30_1
	.word 0x8cf223f8  ! 767: UDIVcc_I	udivcc 	%r8, 0x03f8, %r6
	.word 0x16800001  ! 769: BGE	bge  	<label_0x1>
	.word 0x86722294  ! 769: UDIV_I	udiv 	%r8, 0x0294, %r3
	.word 0x3c800001  ! 771: BPOS	bpos,a	<label_0x1>
	.word 0x986a2ed4  ! 771: UDIVX_I	udivx 	%r8, 0x0ed4, %r12
	.word 0x893a2001  ! 772: SRA_I	sra 	%r8, 0x0001, %r4
	.word 0xaa020009  ! 772: ADD_R	add 	%r8, %r9, %r21
	.word 0x9ab20009  ! 772: ORNcc_R	orncc 	%r8, %r9, %r13
	.word 0x852a2001  ! 772: SLL_I	sll 	%r8, 0x0001, %r2
	.word 0x8e2a0009  ! 772: ANDN_R	andn 	%r8, %r9, %r7
	.word 0x8a1a2950  ! 772: XOR_I	xor 	%r8, 0x0950, %r5
	.word 0xbd2a3001  ! 772: SLLX_I	sllx	%r8, 0x0001, %r30
	.word 0xa2320009  ! 772: SUBC_R	orn 	%r8, %r9, %r17
	.word 0x9f2a1009  ! 772: SLLX_R	sllx	%r8, %r9, %r15
	.word 0x833a2001  ! 772: SRA_I	sra 	%r8, 0x0001, %r1
	.word 0x8ab20009  ! 772: SUBCcc_R	orncc 	%r8, %r9, %r5
	.word 0xce2a0009  ! 776: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc41a0009  ! 776: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xaef20009  ! 776: UDIVcc_R	udivcc 	%r8, %r9, %r23
	.word 0x84720009  ! 776: UDIV_R	udiv 	%r8, %r9, %r2
	.word 0xc7220009  ! 780: STF_R	st	%f3, [%r9, %r8]
	.word 0xc41a0009  ! 780: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x8c7224ac  ! 780: UDIV_I	udiv 	%r8, 0x04ac, %r6
	.word 0x9b6a0009  ! 780: SDIVX_R	sdivx	%r8, %r9, %r13
	.word 0x8a8a0009  ! 782: ANDcc_R	andcc 	%r8, %r9, %r5
	.word 0x853a0009  ! 782: SRA_R	sra 	%r8, %r9, %r2
	.word 0x8a420009  ! 782: ADDC_R	addc 	%r8, %r9, %r5
	.word 0x83321009  ! 782: SRLX_R	srlx	%r8, %r9, %r1
	.word 0x82922d5c  ! 782: ORcc_I	orcc 	%r8, 0x0d5c, %r1
	.word 0x82b20009  ! 782: ORNcc_R	orncc 	%r8, %r9, %r1
	.word 0x84ba2fcc  ! 782: XNORcc_I	xnorcc 	%r8, 0x0fcc, %r2
	.word 0xad320009  ! 782: SRL_R	srl 	%r8, %r9, %r22
	.word 0x860a2ac0  ! 782: AND_I	and 	%r8, 0x0ac0, %r3
	.word 0x84c20009  ! 782: ADDCcc_R	addccc 	%r8, %r9, %r2
	.word 0x88b2209c  ! 782: ORNcc_I	orncc 	%r8, 0x009c, %r4
	.word 0x832a2001  ! 782: SLL_I	sll 	%r8, 0x0001, %r1
	.word 0x843a2630  ! 782: XNOR_I	xnor 	%r8, 0x0630, %r2
	.word 0x8aa20009  ! 783: SUBcc_R	subcc 	%r8, %r9, %r5
	.word 0x8a420009  ! 783: ADDC_R	addc 	%r8, %r9, %r5
	.word 0x8ab20009  ! 783: SUBCcc_R	orncc 	%r8, %r9, %r5
	.word 0xbc9a0009  ! 783: XORcc_R	xorcc 	%r8, %r9, %r30
	.word 0xb29a2afc  ! 783: XORcc_I	xorcc 	%r8, 0x0afc, %r25
	.word 0x8cc20009  ! 783: ADDCcc_R	addccc 	%r8, %r9, %r6
	.word 0x84422e9c  ! 783: ADDC_I	addc 	%r8, 0x0e9c, %r2
	.word 0xa53a0009  ! 783: SRA_R	sra 	%r8, %r9, %r18
	.word 0x862a0009  ! 783: ANDN_R	andn 	%r8, %r9, %r3
	.word 0x83320009  ! 783: SRL_R	srl 	%r8, %r9, %r1
	.word 0x82b20009  ! 783: SUBCcc_R	orncc 	%r8, %r9, %r1
	.word 0x85321009  ! 783: SRLX_R	srlx	%r8, %r9, %r2
	.word 0x881a0009  ! 783: XOR_R	xor 	%r8, %r9, %r4
	.word 0x881a0009  ! 783: XOR_R	xor 	%r8, %r9, %r4
	.word 0xb0a2239c  ! 785: SUBcc_I	subcc 	%r8, 0x039c, %r24
	.word 0x873a2001  ! 785: SRA_I	sra 	%r8, 0x0001, %r3
	.word 0x89780409  ! 785: MOVR_R	move	%r0, %r9, %r4
	.word 0xb0b20009  ! 785: SUBCcc_R	orncc 	%r8, %r9, %r24
	.word 0x86320009  ! 785: ORN_R	orn 	%r8, %r9, %r3
	.word 0xa0822330  ! 785: ADDcc_I	addcc 	%r8, 0x0330, %r16
	.word 0xac120009  ! 785: OR_R	or 	%r8, %r9, %r22
	.word 0x86422d74  ! 785: ADDC_I	addc 	%r8, 0x0d74, %r3
	.word 0x8cb22794  ! 785: ORNcc_I	orncc 	%r8, 0x0794, %r6
	.word 0x8aaa2354  ! 785: ANDNcc_I	andncc 	%r8, 0x0354, %r5
	.word 0x88b22838  ! 785: SUBCcc_I	orncc 	%r8, 0x0838, %r4
	.word 0xad3a1009  ! 785: SRAX_R	srax	%r8, %r9, %r22
	.word 0x88220009  ! 785: SUB_R	sub 	%r8, %r9, %r4
	.word 0x36800001  ! 787: BGE	bge,a	<label_0x1>
	.word 0xbe7a2e94  ! 787: SDIV_I	sdiv 	%r8, 0x0e94, %r31
	.word 0xcc720009  ! 793: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc81a0009  ! 793: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x82720009  ! 793: UDIV_R	udiv 	%r8, %r9, %r1
	.word 0x8c722adc  ! 793: UDIV_I	udiv 	%r8, 0x0adc, %r6
	.word 0x8a422ab0  ! 794: ADDC_I	addc 	%r8, 0x0ab0, %r5
	.word 0x860a0009  ! 794: AND_R	and 	%r8, %r9, %r3
	.word 0x8e820009  ! 794: ADDcc_R	addcc 	%r8, %r9, %r7
	.word 0x882a0009  ! 794: ANDN_R	andn 	%r8, %r9, %r4
	.word 0xbb321009  ! 794: SRLX_R	srlx	%r8, %r9, %r29
	.word 0x849a0009  ! 794: XORcc_R	xorcc 	%r8, %r9, %r2
	.word 0x8eb20009  ! 794: ORNcc_R	orncc 	%r8, %r9, %r7
	.word 0xbd782401  ! 794: MOVR_I	move	%r0, 0x9, %r30
	.word 0x84aa0009  ! 794: ANDNcc_R	andncc 	%r8, %r9, %r2
	.word 0xbe3a0009  ! 794: XNOR_R	xnor 	%r8, %r9, %r31
	.word 0x88b2243c  ! 795: SUBCcc_I	orncc 	%r8, 0x043c, %r4
	.word 0xb52a3001  ! 795: SLLX_I	sllx	%r8, 0x0001, %r26
	.word 0x8eb20009  ! 795: ORNcc_R	orncc 	%r8, %r9, %r7
	.word 0x832a0009  ! 795: SLL_R	sll 	%r8, %r9, %r1
	.word 0x89643801  ! 795: MOVcc_I	<illegal instruction>
	.word 0x8c920009  ! 795: ORcc_R	orcc 	%r8, %r9, %r6
	.word 0x84822f74  ! 795: ADDcc_I	addcc 	%r8, 0x0f74, %r2
	.word 0x8d323001  ! 795: SRLX_I	srlx	%r8, 0x0001, %r6
	.word 0x8ea20009  ! 795: SUBcc_R	subcc 	%r8, %r9, %r7
	.word 0x8a9a2d5c  ! 795: XORcc_I	xorcc 	%r8, 0x0d5c, %r5
	.word 0xc6320009  ! 799: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xf1020009  ! 799: LDF_R	ld	[%r8, %r9], %f24
	.word 0x827a2648  ! 799: SDIV_I	sdiv 	%r8, 0x0648, %r1
	.word 0xa87a0009  ! 799: SDIV_R	sdiv 	%r8, %r9, %r20
	.word 0xc73a0009  ! 803: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc41a0009  ! 803: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x9a722b40  ! 803: UDIV_I	udiv 	%r8, 0x0b40, %r13
	.word 0x82f20009  ! 803: UDIVcc_R	udivcc 	%r8, %r9, %r1
	.word 0x89643801  ! 807: MOVcc_I	<illegal instruction>
	.word 0x94b20009  ! 807: ORNcc_R	orncc 	%r8, %r9, %r10
	.word 0x88a22fd4  ! 807: SUBcc_I	subcc 	%r8, 0x0fd4, %r4
	.word 0x860a0009  ! 807: AND_R	and 	%r8, %r9, %r3
	.word 0xb48226e4  ! 807: ADDcc_I	addcc 	%r8, 0x06e4, %r26
	.word 0xb4920009  ! 807: ORcc_R	orcc 	%r8, %r9, %r26
	.word 0x8ac20009  ! 807: ADDCcc_R	addccc 	%r8, %r9, %r5
	.word 0x88322c34  ! 807: SUBC_I	orn 	%r8, 0x0c34, %r4
	.word 0x8a8a2ee8  ! 807: ANDcc_I	andcc 	%r8, 0x0ee8, %r5
	.word 0xbd3a3001  ! 807: SRAX_I	srax	%r8, 0x0001, %r30
	.word 0x8d3a3001  ! 807: SRAX_I	srax	%r8, 0x0001, %r6
	.word 0x88820009  ! 807: ADDcc_R	addcc 	%r8, %r9, %r4
	.word 0xac8a2400  ! 807: ANDcc_I	andcc 	%r8, 0x0400, %r22
	.word 0x8cba0009  ! 807: XNORcc_R	xnorcc 	%r8, %r9, %r6
	.word 0x94322a1c  ! 807: SUBC_I	orn 	%r8, 0x0a1c, %r10
	.word 0xc8720009  ! 812: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xce4a0009  ! 812: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xdf020009  ! 812: LDF_R	ld	[%r8, %r9], %f15
	.word 0x8efa2038  ! 812: SDIVcc_I	sdivcc 	%r8, 0x0038, %r7
	.word 0xe2220009  ! 818: STW_R	stw	%r17, [%r8 + %r9]
	.word 0xc65a0009  ! 818: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0x887a0009  ! 818: SDIV_R	sdiv 	%r8, %r9, %r4
	.word 0x8afa0009  ! 818: SDIVcc_R	sdivcc 	%r8, %r9, %r5
	.word 0xce220009  ! 829: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc91a0009  ! 829: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0x827229a8  ! 829: UDIV_I	udiv 	%r8, 0x09a8, %r1
	.word 0x8c6a2190  ! 829: UDIVX_I	udivx 	%r8, 0x0190, %r6
	.word 0x0ac20001  ! 831: BRNZ	brnz  ,nt	%8,<label_0x20001>
	.word 0xad6a2330  ! 831: SDIVX_I	sdivx	%r8, 0x0330, %r22
	.word 0x14800001  ! 840: BG	bg  	<label_0x1>
	.word 0x827a28c4  ! 840: SDIV_I	sdiv 	%r8, 0x08c4, %r1
	.word 0xc33a0009  ! 844: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc41a0009  ! 844: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x8efa2a9c  ! 844: SDIVcc_I	sdivcc 	%r8, 0x0a9c, %r7
	.word 0x8afa20f8  ! 844: SDIVcc_I	sdivcc 	%r8, 0x00f8, %r5
	.word 0x8b2a3001  ! 846: SLLX_I	sllx	%r8, 0x0001, %r5
	.word 0x9a3a0009  ! 846: XNOR_R	xnor 	%r8, %r9, %r13
	.word 0xb24223ec  ! 846: ADDC_I	addc 	%r8, 0x03ec, %r25
	.word 0x88420009  ! 846: ADDC_R	addc 	%r8, %r9, %r4
	.word 0x84aa224c  ! 846: ANDNcc_I	andncc 	%r8, 0x024c, %r2
	.word 0x88a22884  ! 846: SUBcc_I	subcc 	%r8, 0x0884, %r4
	.word 0x821a0009  ! 846: XOR_R	xor 	%r8, %r9, %r1
	.word 0x8cc20009  ! 846: ADDCcc_R	addccc 	%r8, %r9, %r6
	.word 0x880a0009  ! 846: AND_R	and 	%r8, %r9, %r4
	.word 0x8e220009  ! 846: SUB_R	sub 	%r8, %r9, %r7
	.word 0x8e120009  ! 846: OR_R	or 	%r8, %r9, %r7
	.word 0x8d3a2001  ! 846: SRA_I	sra 	%r8, 0x0001, %r6
	.word 0x869a2618  ! 846: XORcc_I	xorcc 	%r8, 0x0618, %r3
	.word 0x88b20009  ! 846: SUBCcc_R	orncc 	%r8, %r9, %r4
	.word 0xcf3a0009  ! 850: STDF_R	std	%f7, [%r9, %r8]
	.word 0xf85a0009  ! 850: LDX_R	ldx	[%r8 + %r9], %r28
	.word 0xaafa0009  ! 850: SDIVcc_R	sdivcc 	%r8, %r9, %r21
	.word 0xb6720009  ! 850: UDIV_R	udiv 	%r8, %r9, %r27
	.word 0xa83228ac  ! 851: ORN_I	orn 	%r8, 0x08ac, %r20
	.word 0xb0aa26d4  ! 851: ANDNcc_I	andncc 	%r8, 0x06d4, %r24
	.word 0x8c1a2e60  ! 851: XOR_I	xor 	%r8, 0x0e60, %r6
	.word 0x82b20009  ! 851: ORNcc_R	orncc 	%r8, %r9, %r1
	.word 0xb0b22784  ! 851: ORNcc_I	orncc 	%r8, 0x0784, %r24
	.word 0x8aa22988  ! 851: SUBcc_I	subcc 	%r8, 0x0988, %r5
	.word 0x88b2255c  ! 851: ORNcc_I	orncc 	%r8, 0x055c, %r4
	.word 0xaab20009  ! 851: ORNcc_R	orncc 	%r8, %r9, %r21
	.word 0x94322378  ! 851: ORN_I	orn 	%r8, 0x0378, %r10
	.word 0x86b20009  ! 851: ORNcc_R	orncc 	%r8, %r9, %r3
	.word 0xa03a0009  ! 851: XNOR_R	xnor 	%r8, %r9, %r16
	.word 0x88120009  ! 851: OR_R	or 	%r8, %r9, %r4
	.word 0x88020009  ! 851: ADD_R	add 	%r8, %r9, %r4
	.word 0xb4ba2fb0  ! 851: XNORcc_I	xnorcc 	%r8, 0x0fb0, %r26
	.word 0xcf3a0009  ! 856: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc8520009  ! 856: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xc41a2100  ! 856: LDD_I	ldd	[%r8 + 0x0100], %r2
	.word 0x8efa2fb0  ! 856: SDIVcc_I	sdivcc 	%r8, 0x0fb0, %r7
	.word 0x882a2e74  ! 857: ANDN_I	andn 	%r8, 0x0e74, %r4
	.word 0x94c20009  ! 857: ADDCcc_R	addccc 	%r8, %r9, %r10
	.word 0xab321009  ! 857: SRLX_R	srlx	%r8, %r9, %r21
	.word 0x8b780409  ! 857: MOVR_R	move	%r0, %r9, %r5
	.word 0x8e222518  ! 857: SUB_I	sub 	%r8, 0x0518, %r7
	.word 0x86322058  ! 857: SUBC_I	orn 	%r8, 0x0058, %r3
	.word 0x9c9a2dac  ! 857: XORcc_I	xorcc 	%r8, 0x0dac, %r14
	.word 0x82222fdc  ! 857: SUB_I	sub 	%r8, 0x0fdc, %r1
	.word 0x8f322001  ! 857: SRL_I	srl 	%r8, 0x0001, %r7
	.word 0xb4c22e84  ! 857: ADDCcc_I	addccc 	%r8, 0x0e84, %r26
	.word 0x82aa2604  ! 857: ANDNcc_I	andncc 	%r8, 0x0604, %r1
	.word 0x832a1009  ! 857: SLLX_R	sllx	%r8, %r9, %r1
	.word 0x9c920009  ! 857: ORcc_R	orcc 	%r8, %r9, %r14
	.word 0x82420009  ! 857: ADDC_R	addc 	%r8, %r9, %r1
	.word 0x88b20009  ! 857: ORNcc_R	orncc 	%r8, %r9, %r4
	.word 0x2cc20001  ! 861: BRGZ	brgz,a,nt	%8,<label_0x20001>
	.word 0xa6720009  ! 861: UDIV_R	udiv 	%r8, %r9, %r19
	.word 0xc8320009  ! 865: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xda020009  ! 865: LDUW_R	lduw	[%r8 + %r9], %r13
	.word 0x8b6a0009  ! 865: SDIVX_R	sdivx	%r8, %r9, %r5
	.word 0x827a2090  ! 865: SDIV_I	sdiv 	%r8, 0x0090, %r1
	.word 0xb83a0009  ! 867: XNOR_R	xnor 	%r8, %r9, %r28
	.word 0x872a3001  ! 867: SLLX_I	sllx	%r8, 0x0001, %r3
	.word 0x84020009  ! 867: ADD_R	add 	%r8, %r9, %r2
	.word 0xbd782401  ! 867: MOVR_I	move	%r0, 0x9, %r30
	.word 0xbaa20009  ! 867: SUBcc_R	subcc 	%r8, %r9, %r29
	.word 0x888a0009  ! 867: ANDcc_R	andcc 	%r8, %r9, %r4
	.word 0xb2aa0009  ! 867: ANDNcc_R	andncc 	%r8, %r9, %r25
	.word 0x89782401  ! 867: MOVR_I	move	%r0, 0x9, %r4
	.word 0xa33a1009  ! 867: SRAX_R	srax	%r8, %r9, %r17
	.word 0x8b2a0009  ! 867: SLL_R	sll 	%r8, %r9, %r5
	.word 0xa2320009  ! 867: ORN_R	orn 	%r8, %r9, %r17
	.word 0x8ac22594  ! 867: ADDCcc_I	addccc 	%r8, 0x0594, %r5
	.word 0x04800002  ! 870: BLE	ble  	<label_0x2>
	.word 0x86f22d04  ! 870: UDIVcc_I	udivcc 	%r8, 0x0d04, %r3
	.word 0x3c800002  ! 872: BPOS	bpos,a	<label_0x2>
	.word 0x966a2164  ! 872: UDIVX_I	udivx 	%r8, 0x0164, %r11
	.word 0x873a1009  ! 873: SRAX_R	srax	%r8, %r9, %r3
	.word 0x841a276c  ! 873: XOR_I	xor 	%r8, 0x076c, %r2
	.word 0x863a202c  ! 873: XNOR_I	xnor 	%r8, 0x002c, %r3
	.word 0x872a1009  ! 873: SLLX_R	sllx	%r8, %r9, %r3
	.word 0x83643801  ! 873: MOVcc_I	<illegal instruction>
	.word 0x892a3001  ! 873: SLLX_I	sllx	%r8, 0x0001, %r4
	.word 0x87321009  ! 873: SRLX_R	srlx	%r8, %r9, %r3
	.word 0xa2c222d8  ! 873: ADDCcc_I	addccc 	%r8, 0x02d8, %r17
	.word 0x88020009  ! 873: ADD_R	add 	%r8, %r9, %r4
	.word 0x8a1a2738  ! 873: XOR_I	xor 	%r8, 0x0738, %r5
	.word 0xb0820009  ! 873: ADDcc_R	addcc 	%r8, %r9, %r24
	.word 0xa2aa0009  ! 873: ANDNcc_R	andncc 	%r8, %r9, %r17
	.word 0x8f2a2001  ! 874: SLL_I	sll 	%r8, 0x0001, %r7
	.word 0x893a0009  ! 874: SRA_R	sra 	%r8, %r9, %r4
	.word 0x873a1009  ! 874: SRAX_R	srax	%r8, %r9, %r3
	.word 0x8cc20009  ! 874: ADDCcc_R	addccc 	%r8, %r9, %r6
	.word 0xb80a0009  ! 874: AND_R	and 	%r8, %r9, %r28
	.word 0x821228c4  ! 874: OR_I	or 	%r8, 0x08c4, %r1
	.word 0xb8c22898  ! 874: ADDCcc_I	addccc 	%r8, 0x0898, %r28
	.word 0xbd3a1009  ! 874: SRAX_R	srax	%r8, %r9, %r30
	.word 0xba220009  ! 874: SUB_R	sub 	%r8, %r9, %r29
	.word 0x87323001  ! 874: SRLX_I	srlx	%r8, 0x0001, %r3
	.word 0xbd3a0009  ! 874: SRA_R	sra 	%r8, %r9, %r30
	.word 0x8eba0009  ! 874: XNORcc_R	xnorcc 	%r8, %r9, %r7
	.word 0x87323001  ! 874: SRLX_I	srlx	%r8, 0x0001, %r3
	.word 0x893a3001  ! 874: SRAX_I	srax	%r8, 0x0001, %r4
	.word 0x84322970  ! 874: SUBC_I	orn 	%r8, 0x0970, %r2
	.word 0xd4720009  ! 884: STX_R	stx	%r10, [%r8 + %r9]
	.word 0xcc120009  ! 884: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0x82f22ba8  ! 884: UDIVcc_I	udivcc 	%r8, 0x0ba8, %r1
	.word 0x82fa29bc  ! 884: SDIVcc_I	sdivcc 	%r8, 0x09bc, %r1
	.word 0xcb220009  ! 889: STF_R	st	%f5, [%r9, %r8]
	.word 0xcc020009  ! 889: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0x8e7a2d40  ! 889: SDIV_I	sdiv 	%r8, 0x0d40, %r7
	.word 0xbc722010  ! 889: UDIV_I	udiv 	%r8, 0x0010, %r30
	.word 0x8b3a2001  ! 891: SRA_I	sra 	%r8, 0x0001, %r5
	.word 0x88120009  ! 891: OR_R	or 	%r8, %r9, %r4
	.word 0x88b20009  ! 891: SUBCcc_R	orncc 	%r8, %r9, %r4
	.word 0x8d782401  ! 891: MOVR_I	move	%r0, 0x9, %r6
	.word 0x82aa0009  ! 891: ANDNcc_R	andncc 	%r8, %r9, %r1
	.word 0x83782401  ! 891: MOVR_I	move	%r0, 0x9, %r1
	.word 0xb08a2c4c  ! 891: ANDcc_I	andcc 	%r8, 0x0c4c, %r24
	.word 0x8b641809  ! 891: MOVcc_R	<illegal instruction>
	.word 0x8a1a2b14  ! 891: XOR_I	xor 	%r8, 0x0b14, %r5
	.word 0xa92a2001  ! 891: SLL_I	sll 	%r8, 0x0001, %r20
	.word 0x8f643801  ! 891: MOVcc_I	<illegal instruction>
	.word 0x86c22f90  ! 891: ADDCcc_I	addccc 	%r8, 0x0f90, %r3
	.word 0xc42a0009  ! 897: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xcc4a0009  ! 897: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0x8e7a0009  ! 897: SDIV_R	sdiv 	%r8, %r9, %r7
	.word 0x856a0009  ! 897: SDIVX_R	sdivx	%r8, %r9, %r2
	.word 0x8cb2225c  ! 900: ORNcc_I	orncc 	%r8, 0x025c, %r6
	.word 0x87782401  ! 900: MOVR_I	move	%r0, 0xfffffe5c, %r3
	.word 0x841a0009  ! 900: XOR_R	xor 	%r8, %r9, %r2
	.word 0x8a222144  ! 900: SUB_I	sub 	%r8, 0x0144, %r5
	.word 0x872a1009  ! 900: SLLX_R	sllx	%r8, %r9, %r3
	.word 0x8eb22544  ! 900: ORNcc_I	orncc 	%r8, 0x0544, %r7
	.word 0x98422448  ! 900: ADDC_I	addc 	%r8, 0x0448, %r12
	.word 0xa2b20009  ! 900: ORNcc_R	orncc 	%r8, %r9, %r17
	.word 0x840a0009  ! 900: AND_R	and 	%r8, %r9, %r2
	.word 0x87780409  ! 900: MOVR_R	move	%r0, %r9, %r3
	.word 0x8eb220fc  ! 900: ORNcc_I	orncc 	%r8, 0x00fc, %r7
	.word 0x9caa0009  ! 900: ANDNcc_R	andncc 	%r8, %r9, %r14
	.word 0x823a0009  ! 900: XNOR_R	xnor 	%r8, %r9, %r1
	.word 0x32800001  ! 902: BNE	bne,a	<label_0x1>
	.word 0x8c6a2f54  ! 902: UDIVX_I	udivx 	%r8, 0x0f54, %r6
	.word 0x20800001  ! 905: BN	bn,a	<label_0x1>
	.word 0x8e6a208c  ! 905: UDIVX_I	udivx 	%r8, 0x008c, %r7
	.word 0x8e3a0009  ! 908: XNOR_R	xnor 	%r8, %r9, %r7
	.word 0xad3a3001  ! 908: SRAX_I	srax	%r8, 0x0001, %r22
	.word 0x86420009  ! 908: ADDC_R	addc 	%r8, %r9, %r3
	.word 0xb33a2001  ! 908: SRA_I	sra 	%r8, 0x0001, %r25
	.word 0xb8222d6c  ! 908: SUB_I	sub 	%r8, 0x0d6c, %r28
	.word 0x86320009  ! 908: SUBC_R	orn 	%r8, %r9, %r3
	.word 0xb88a2068  ! 908: ANDcc_I	andcc 	%r8, 0x0068, %r28
	.word 0x8d641809  ! 908: MOVcc_R	<illegal instruction>
	.word 0x86a227c4  ! 908: SUBcc_I	subcc 	%r8, 0x07c4, %r3
	.word 0x9e8a0009  ! 908: ANDcc_R	andcc 	%r8, %r9, %r15
	.word 0xc9220009  ! 913: STF_R	st	%f4, [%r9, %r8]
	.word 0xc6120009  ! 913: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0x8a720009  ! 913: UDIV_R	udiv 	%r8, %r9, %r5
	.word 0x82720009  ! 913: UDIV_R	udiv 	%r8, %r9, %r1
	.word 0x8e2a20e0  ! 916: ANDN_I	andn 	%r8, 0x00e0, %r7
	.word 0x8e0a0009  ! 916: AND_R	and 	%r8, %r9, %r7
	.word 0xa8c20009  ! 916: ADDCcc_R	addccc 	%r8, %r9, %r20
	.word 0xbc320009  ! 916: SUBC_R	orn 	%r8, %r9, %r30
	.word 0x8d641809  ! 916: MOVcc_R	<illegal instruction>
	.word 0x86820009  ! 916: ADDcc_R	addcc 	%r8, %r9, %r3
	.word 0x85641809  ! 916: MOVcc_R	<illegal instruction>
	.word 0xbd2a3001  ! 916: SLLX_I	sllx	%r8, 0x0001, %r30
	.word 0xb9641809  ! 916: MOVcc_R	<illegal instruction>
	.word 0x9a2a2b30  ! 916: ANDN_I	andn 	%r8, 0x0b30, %r13
	.word 0x87322001  ! 916: SRL_I	srl 	%r8, 0x0001, %r3
	.word 0xa2320009  ! 916: SUBC_R	orn 	%r8, %r9, %r17
	.word 0xa3643801  ! 916: MOVcc_I	<illegal instruction>
	.word 0x9a9a0009  ! 916: XORcc_R	xorcc 	%r8, %r9, %r13
	.word 0xa53a0009  ! 916: SRA_R	sra 	%r8, %r9, %r18
	.word 0x829a29b0  ! 917: XORcc_I	xorcc 	%r8, 0x09b0, %r1
	.word 0x84b20009  ! 917: ORNcc_R	orncc 	%r8, %r9, %r2
	.word 0x86420009  ! 917: ADDC_R	addc 	%r8, %r9, %r3
	.word 0x86b22f60  ! 917: ORNcc_I	orncc 	%r8, 0x0f60, %r3
	.word 0xa0aa27f8  ! 917: ANDNcc_I	andncc 	%r8, 0x07f8, %r16
	.word 0x88822af4  ! 917: ADDcc_I	addcc 	%r8, 0x0af4, %r4
	.word 0x8c322648  ! 917: ORN_I	orn 	%r8, 0x0648, %r6
	.word 0x8c3a273c  ! 917: XNOR_I	xnor 	%r8, 0x073c, %r6
	.word 0x822a2dcc  ! 917: ANDN_I	andn 	%r8, 0x0dcc, %r1
	.word 0x87322001  ! 917: SRL_I	srl 	%r8, 0x0001, %r3
	.word 0x832a2001  ! 917: SLL_I	sll 	%r8, 0x0001, %r1
	.word 0xcd3a0009  ! 922: STDF_R	std	%f6, [%r9, %r8]
	.word 0xcb020009  ! 922: LDF_R	ld	[%r8, %r9], %f5
	.word 0x8d6a2498  ! 922: SDIVX_I	sdivx	%r8, 0x0498, %r6
	.word 0x8e6a0009  ! 922: UDIVX_R	udivx 	%r8, %r9, %r7
	.word 0x2c800002  ! 925: BNEG	bneg,a	<label_0x2>
	.word 0x86fa0009  ! 925: SDIVcc_R	sdivcc 	%r8, %r9, %r3
	.word 0x8f322001  ! 926: SRL_I	srl 	%r8, 0x0001, %r7
	.word 0x85323001  ! 926: SRLX_I	srlx	%r8, 0x0001, %r2
	.word 0x832a1009  ! 926: SLLX_R	sllx	%r8, %r9, %r1
	.word 0x848a291c  ! 926: ANDcc_I	andcc 	%r8, 0x091c, %r2
	.word 0x8c2a23bc  ! 926: ANDN_I	andn 	%r8, 0x03bc, %r6
	.word 0xa0b222f4  ! 926: SUBCcc_I	orncc 	%r8, 0x02f4, %r16
	.word 0x9ca20009  ! 926: SUBcc_R	subcc 	%r8, %r9, %r14
	.word 0xaab20009  ! 926: SUBCcc_R	orncc 	%r8, %r9, %r21
	.word 0x9d322001  ! 926: SRL_I	srl 	%r8, 0x0001, %r14
	.word 0x8e822d4c  ! 926: ADDcc_I	addcc 	%r8, 0x0d4c, %r7
	.word 0x833a2001  ! 926: SRA_I	sra 	%r8, 0x0001, %r1
	.word 0x8e022554  ! 926: ADD_I	add 	%r8, 0x0554, %r7
	.word 0x820225a0  ! 926: ADD_I	add 	%r8, 0x05a0, %r1
	.word 0x26800001  ! 930: BL	bl,a	<label_0x1>
	.word 0xb0720009  ! 930: UDIV_R	udiv 	%r8, %r9, %r24
	.word 0xda220009  ! 934: STW_R	stw	%r13, [%r8 + %r9]
	.word 0xc4120009  ! 934: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xbcfa2410  ! 934: SDIVcc_I	sdivcc 	%r8, 0x0410, %r30
	.word 0x8af20009  ! 934: UDIVcc_R	udivcc 	%r8, %r9, %r5
	.word 0x00800001  ! 937: BN	bn  	<label_0x1>
	.word 0xb26a0009  ! 937: UDIVX_R	udivx 	%r8, %r9, %r25
	.word 0xce320009  ! 942: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc45a0009  ! 942: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xfc120009  ! 942: LDUH_R	lduh	[%r8 + %r9], %r30
	.word 0x84722804  ! 942: UDIV_I	udiv 	%r8, 0x0804, %r2
	.word 0xc8220009  ! 947: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xe65a0009  ! 947: LDX_R	ldx	[%r8 + %r9], %r19
	.word 0xb6220009  ! 947: SUB_R	sub 	%r8, %r9, %r27
	.word 0x887a0009  ! 947: SDIV_R	sdiv 	%r8, %r9, %r4
	.word 0x24800001  ! 950: BLE	ble,a	<label_0x1>
	.word 0xae6a0009  ! 950: UDIVX_R	udivx 	%r8, %r9, %r23
	.word 0xc33a0009  ! 955: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc80a0009  ! 955: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xc652214c  ! 955: LDSH_I	ldsh	[%r8 + 0x014c], %r3
	.word 0x94f221e0  ! 955: UDIVcc_I	udivcc 	%r8, 0x01e0, %r10
	.word 0x8f2a1009  ! 956: SLLX_R	sllx	%r8, %r9, %r7
	.word 0xa4822990  ! 956: ADDcc_I	addcc 	%r8, 0x0990, %r18
	.word 0x8c120009  ! 956: OR_R	or 	%r8, %r9, %r6
	.word 0x8a2a0009  ! 956: ANDN_R	andn 	%r8, %r9, %r5
	.word 0x943a2cdc  ! 956: XNOR_I	xnor 	%r8, 0x0cdc, %r10
	.word 0x8e3a0009  ! 956: XNOR_R	xnor 	%r8, %r9, %r7
	.word 0x8c222a44  ! 956: SUB_I	sub 	%r8, 0x0a44, %r6
	.word 0x85323001  ! 956: SRLX_I	srlx	%r8, 0x0001, %r2
	.word 0xa4ba0009  ! 956: XNORcc_R	xnorcc 	%r8, %r9, %r18
	.word 0xbaaa25d8  ! 956: ANDNcc_I	andncc 	%r8, 0x05d8, %r29
	.word 0x821a2580  ! 956: XOR_I	xor 	%r8, 0x0580, %r1
	.word 0x8e022f7c  ! 956: ADD_I	add 	%r8, 0x0f7c, %r7
	.word 0xa6920009  ! 956: ORcc_R	orcc 	%r8, %r9, %r19
	.word 0x9ca22d38  ! 956: SUBcc_I	subcc 	%r8, 0x0d38, %r14
	.word 0x8aa228dc  ! 956: SUBcc_I	subcc 	%r8, 0x08dc, %r5
	.word 0x14800001  ! 961: BG	bg  	<label_0x1>
	.word 0x8e6a2160  ! 961: UDIVX_I	udivx 	%r8, 0x0160, %r7
	.word 0x18800001  ! 963: BGU	bgu  	<label_0x1>
	.word 0x9d6a26e4  ! 963: SDIVX_I	sdivx	%r8, 0x06e4, %r14
	.word 0xa3643801  ! 965: MOVcc_I	<illegal instruction>
	.word 0xa4b20009  ! 965: SUBCcc_R	orncc 	%r8, %r9, %r18
	.word 0x9b3a0009  ! 965: SRA_R	sra 	%r8, %r9, %r13
	.word 0x85321009  ! 965: SRLX_R	srlx	%r8, %r9, %r2
	.word 0x8aaa0009  ! 965: ANDNcc_R	andncc 	%r8, %r9, %r5
	.word 0x8aba0009  ! 965: XNORcc_R	xnorcc 	%r8, %r9, %r5
	.word 0xb49222d8  ! 965: ORcc_I	orcc 	%r8, 0x02d8, %r26
	.word 0x86122248  ! 965: OR_I	or 	%r8, 0x0248, %r3
	.word 0x8832274c  ! 965: ORN_I	orn 	%r8, 0x074c, %r4
	.word 0x8aa20009  ! 965: SUBcc_R	subcc 	%r8, %r9, %r5
	.word 0xbeaa2f8c  ! 965: ANDNcc_I	andncc 	%r8, 0x0f8c, %r31
	.word 0x84c22110  ! 965: ADDCcc_I	addccc 	%r8, 0x0110, %r2
	.word 0xaf2a0009  ! 965: SLL_R	sll 	%r8, %r9, %r23
	.word 0x8e920009  ! 965: ORcc_R	orcc 	%r8, %r9, %r7
	.word 0x82220009  ! 967: SUB_R	sub 	%r8, %r9, %r1
	.word 0x96b22868  ! 967: ORNcc_I	orncc 	%r8, 0x0868, %r11
	.word 0x821a2c74  ! 967: XOR_I	xor 	%r8, 0x0c74, %r1
	.word 0x9ab20009  ! 967: SUBCcc_R	orncc 	%r8, %r9, %r13
	.word 0x88320009  ! 967: SUBC_R	orn 	%r8, %r9, %r4
	.word 0x8eba0009  ! 967: XNORcc_R	xnorcc 	%r8, %r9, %r7
	.word 0x88b20009  ! 967: ORNcc_R	orncc 	%r8, %r9, %r4
	.word 0xbeba0009  ! 967: XNORcc_R	xnorcc 	%r8, %r9, %r31
	.word 0xa8420009  ! 967: ADDC_R	addc 	%r8, %r9, %r20
	.word 0x84b22f44  ! 967: ORNcc_I	orncc 	%r8, 0x0f44, %r2
	.word 0xab782401  ! 967: MOVR_I	move	%r0, 0xffffff44, %r21
	.word 0xb4422394  ! 967: ADDC_I	addc 	%r8, 0x0394, %r26
	.word 0x8c1a0009  ! 968: XOR_R	xor 	%r8, %r9, %r6
	.word 0x82920009  ! 968: ORcc_R	orcc 	%r8, %r9, %r1
	.word 0x8b320009  ! 968: SRL_R	srl 	%r8, %r9, %r5
	.word 0x89323001  ! 968: SRLX_I	srlx	%r8, 0x0001, %r4
	.word 0xa0aa2f50  ! 968: ANDNcc_I	andncc 	%r8, 0x0f50, %r16
	.word 0x95320009  ! 968: SRL_R	srl 	%r8, %r9, %r10
	.word 0x88b22a58  ! 968: ORNcc_I	orncc 	%r8, 0x0a58, %r4
	.word 0xb5320009  ! 968: SRL_R	srl 	%r8, %r9, %r26
	.word 0xb92a0009  ! 968: SLL_R	sll 	%r8, %r9, %r28
	.word 0x8e920009  ! 968: ORcc_R	orcc 	%r8, %r9, %r7
	.word 0x8c422174  ! 968: ADDC_I	addc 	%r8, 0x0174, %r6
	.word 0x832a2001  ! 968: SLL_I	sll 	%r8, 0x0001, %r1
	.word 0xb4222f68  ! 968: SUB_I	sub 	%r8, 0x0f68, %r26
	.word 0x85322001  ! 968: SRL_I	srl 	%r8, 0x0001, %r2
	.word 0xaab20009  ! 969: SUBCcc_R	orncc 	%r8, %r9, %r21
	.word 0x8a020009  ! 969: ADD_R	add 	%r8, %r9, %r5
	.word 0x8eaa24f8  ! 969: ANDNcc_I	andncc 	%r8, 0x04f8, %r7
	.word 0x869224a4  ! 969: ORcc_I	orcc 	%r8, 0x04a4, %r3
	.word 0x893a1009  ! 969: SRAX_R	srax	%r8, %r9, %r4
	.word 0xaf782401  ! 969: MOVR_I	move	%r0, 0x9, %r23
	.word 0x8a320009  ! 969: ORN_R	orn 	%r8, %r9, %r5
	.word 0xb32a2001  ! 969: SLL_I	sll 	%r8, 0x0001, %r25
	.word 0x98a20009  ! 969: SUBcc_R	subcc 	%r8, %r9, %r12
	.word 0x8442239c  ! 969: ADDC_I	addc 	%r8, 0x039c, %r2
	.word 0x889a0009  ! 970: XORcc_R	xorcc 	%r8, %r9, %r4
	.word 0x872a2001  ! 970: SLL_I	sll 	%r8, 0x0001, %r3
	.word 0x8a920009  ! 970: ORcc_R	orcc 	%r8, %r9, %r5
	.word 0x88422b6c  ! 970: ADDC_I	addc 	%r8, 0x0b6c, %r4
	.word 0x8c922bf8  ! 970: ORcc_I	orcc 	%r8, 0x0bf8, %r6
	.word 0x98922d68  ! 970: ORcc_I	orcc 	%r8, 0x0d68, %r12
	.word 0x872a1009  ! 970: SLLX_R	sllx	%r8, %r9, %r3
	.word 0x969a2aa0  ! 970: XORcc_I	xorcc 	%r8, 0x0aa0, %r11
	.word 0x8f323001  ! 970: SRLX_I	srlx	%r8, 0x0001, %r7
	.word 0x9ca20009  ! 970: SUBcc_R	subcc 	%r8, %r9, %r14
	.word 0x98322268  ! 970: SUBC_I	orn 	%r8, 0x0268, %r12
	.word 0x8c420009  ! 970: ADDC_R	addc 	%r8, %r9, %r6
	.word 0x8b643801  ! 970: MOVcc_I	<illegal instruction>
	.word 0xb1782401  ! 970: MOVR_I	move	%r0, 0x74, %r24
	.word 0x853a2001  ! 970: SRA_I	sra 	%r8, 0x0001, %r2
	.word 0x24c20001  ! 973: BRLEZ	brlez,a,nt	%8,<label_0x20001>
	.word 0xb87a2f40  ! 973: SDIV_I	sdiv 	%r8, 0x0f40, %r28
	.word 0xac8a0009  ! 975: ANDcc_R	andcc 	%r8, %r9, %r22
	.word 0x84322c24  ! 975: ORN_I	orn 	%r8, 0x0c24, %r2
	.word 0x8a1a0009  ! 975: XOR_R	xor 	%r8, %r9, %r5
	.word 0x88822cd8  ! 975: ADDcc_I	addcc 	%r8, 0x0cd8, %r4
	.word 0x832a1009  ! 975: SLLX_R	sllx	%r8, %r9, %r1
	.word 0x8a122e84  ! 975: OR_I	or 	%r8, 0x0e84, %r5
	.word 0x8d3a0009  ! 975: SRA_R	sra 	%r8, %r9, %r6
	.word 0x8a320009  ! 975: ORN_R	orn 	%r8, %r9, %r5
	.word 0x88b20009  ! 975: SUBCcc_R	orncc 	%r8, %r9, %r4
	.word 0x8c320009  ! 975: SUBC_R	orn 	%r8, %r9, %r6
	.word 0x82aa0009  ! 975: ANDNcc_R	andncc 	%r8, %r9, %r1
	.word 0xa69a0009  ! 975: XORcc_R	xorcc 	%r8, %r9, %r19
	.word 0x8a9a0009  ! 975: XORcc_R	xorcc 	%r8, %r9, %r5
	.word 0x24800001  ! 977: BLE	ble,a	<label_0x1>
	.word 0x8a7a0009  ! 977: SDIV_R	sdiv 	%r8, %r9, %r5
	.word 0xc6720009  ! 982: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xec020009  ! 982: LDUW_R	lduw	[%r8 + %r9], %r22
	.word 0x82722f4c  ! 982: UDIV_I	udiv 	%r8, 0x0f4c, %r1
	.word 0x8b6a23cc  ! 982: SDIVX_I	sdivx	%r8, 0x03cc, %r5
	.word 0x84020009  ! 986: ADD_R	add 	%r8, %r9, %r2
	.word 0xb81a2478  ! 986: XOR_I	xor 	%r8, 0x0478, %r28
	.word 0x9e120009  ! 986: OR_R	or 	%r8, %r9, %r15
	.word 0x8ec20009  ! 986: ADDCcc_R	addccc 	%r8, %r9, %r7
	.word 0x8ec22cbc  ! 986: ADDCcc_I	addccc 	%r8, 0x0cbc, %r7
	.word 0x89322001  ! 986: SRL_I	srl 	%r8, 0x0001, %r4
	.word 0xb6a20009  ! 986: SUBcc_R	subcc 	%r8, %r9, %r27
	.word 0x8b323001  ! 986: SRLX_I	srlx	%r8, 0x0001, %r5
	.word 0x8e322434  ! 986: ORN_I	orn 	%r8, 0x0434, %r7
	.word 0x9e922058  ! 986: ORcc_I	orcc 	%r8, 0x0058, %r15
	.word 0x8aa20009  ! 986: SUBcc_R	subcc 	%r8, %r9, %r5
	.word 0x86022094  ! 986: ADD_I	add 	%r8, 0x0094, %r3
	.word 0xa8320009  ! 986: SUBC_R	orn 	%r8, %r9, %r20
	.word 0x8a920009  ! 986: ORcc_R	orcc 	%r8, %r9, %r5
	.word 0x823a0009  ! 986: XNOR_R	xnor 	%r8, %r9, %r1
	.word 0xc6220009  ! 990: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xe25a0009  ! 990: LDX_R	ldx	[%r8 + %r9], %r17
	.word 0xa8f22a14  ! 990: UDIVcc_I	udivcc 	%r8, 0x0a14, %r20
	.word 0x8a6a0009  ! 990: UDIVX_R	udivx 	%r8, %r9, %r5
	.word 0xc7220009  ! 994: STF_R	st	%f3, [%r9, %r8]
	.word 0xd41a0009  ! 994: LDD_R	ldd	[%r8 + %r9], %r10
	.word 0x8efa266c  ! 994: SDIVcc_I	sdivcc 	%r8, 0x066c, %r7
	.word 0xb6fa2848  ! 994: SDIVcc_I	sdivcc 	%r8, 0x0848, %r27
	.word 0xcf220009  ! 998: STF_R	st	%f7, [%r9, %r8]
	.word 0xcc5a0009  ! 998: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0x8e7a2988  ! 998: SDIV_I	sdiv 	%r8, 0x0988, %r7
	.word 0xb66a0009  ! 998: UDIVX_R	udivx 	%r8, %r9, %r27
	nop
	nop
	nop
        ta      T_GOOD_TRAP

th_main_3:
        setx  MAIN_BASE_DATA_VA, %r1, %r8
        setx  0x0000000000000000, %g1, %r9
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
        setx  0x0c51cfcf9d57f32c, %g1, %r0
        setx  0xf46b0705ac9087bc, %g1, %r1
        setx  0xadfcd966617ae86a, %g1, %r2
        setx  0x0fcc4658daf29213, %g1, %r3
        setx  0xff0451eb3c8e5463, %g1, %r4
        setx  0xed94271f38f0e1bb, %g1, %r5
        setx  0x5ced1245b1f3df55, %g1, %r6
        setx  0xfdbd2a2cabf1992d, %g1, %r7
        setx  0x83f9a6ae31e8ac51, %g1, %r10
        setx  0x35a289757330f770, %g1, %r11
        setx  0xf002fb2d16d83a6a, %g1, %r12
        setx  0xe9c01fd1a5cfcbbe, %g1, %r13
        setx  0xe8fa26872e6ef502, %g1, %r14
        setx  0x97bb62c49e7bbf8d, %g1, %r15
        setx  0x35a0e5f5a4b11afe, %g1, %r16
        setx  0x44737f7c730e402e, %g1, %r17
        setx  0xec12ac101c91c309, %g1, %r18
        setx  0xee3be91b14775be9, %g1, %r19
        setx  0x7d4259b85fa2a4df, %g1, %r20
        setx  0x0a92956dcbeb1ace, %g1, %r21
        setx  0xe935e1b3d31f58b1, %g1, %r22
        setx  0xe12f6842e9231ca3, %g1, %r23
        setx  0xda614dfec9fdf539, %g1, %r24
        setx  0x764a60dc4dfe08c2, %g1, %r25
        setx  0xa8f321d83aa29542, %g1, %r26
        setx  0xc9a5797f00972f8f, %g1, %r27
        setx  0x5821c091648996a5, %g1, %r28
        setx  0xd4d8babfac116b82, %g1, %r29
        setx  0x5afe8fb30bb3f02c, %g1, %r30
        setx  0x57305e358d4bc4b8, %g1, %r31
	.word 0x16800001  ! 7: BGE	bge  	<label_0x1>
	.word 0x856a2a88  ! 7: SDIVX_I	sdivx	%r8, 0x0a88, %r2
	.word 0x0c800001  ! 13: BNEG	bneg  	<label_0x1>
	.word 0x82fa0009  ! 13: SDIVcc_R	sdivcc 	%r8, %r9, %r1
	.word 0x18800001  ! 15: BGU	bgu  	<label_0x1>
	.word 0x8e72221c  ! 15: UDIV_I	udiv 	%r8, 0x021c, %r7
	.word 0x22800001  ! 17: BE	be,a	<label_0x1>
	.word 0x8cf22d78  ! 17: UDIVcc_I	udivcc 	%r8, 0x0d78, %r6
	.word 0x04800002  ! 19: BLE	ble  	<label_0x2>
	.word 0x8c6a22b4  ! 19: UDIVX_I	udivx 	%r8, 0x02b4, %r6
	.word 0xbe322420  ! 20: SUBC_I	orn 	%r8, 0x0420, %r31
	.word 0xa8122d48  ! 20: OR_I	or 	%r8, 0x0d48, %r20
	.word 0x8a820009  ! 20: ADDcc_R	addcc 	%r8, %r9, %r5
	.word 0x842226d8  ! 20: SUB_I	sub 	%r8, 0x06d8, %r2
	.word 0x8b782401  ! 20: MOVR_I	move	%r0, 0xfffffed8, %r5
	.word 0x8d3a1009  ! 20: SRAX_R	srax	%r8, %r9, %r6
	.word 0x8a020009  ! 20: ADD_R	add 	%r8, %r9, %r5
	.word 0x833a2001  ! 20: SRA_I	sra 	%r8, 0x0001, %r1
	.word 0x88c20009  ! 20: ADDCcc_R	addccc 	%r8, %r9, %r4
	.word 0x86a20009  ! 20: SUBcc_R	subcc 	%r8, %r9, %r3
	.word 0x98122538  ! 20: OR_I	or 	%r8, 0x0538, %r12
	.word 0xae322b08  ! 20: SUBC_I	orn 	%r8, 0x0b08, %r23
	.word 0x84ba0009  ! 20: XNORcc_R	xnorcc 	%r8, %r9, %r2
	.word 0xad2a2001  ! 20: SLL_I	sll 	%r8, 0x0001, %r22
	.word 0xc82a0009  ! 24: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xcc520009  ! 24: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0x8e122ef4  ! 24: OR_I	or 	%r8, 0x0ef4, %r7
	.word 0x866a2834  ! 24: UDIVX_I	udivx 	%r8, 0x0834, %r3
	.word 0x32800001  ! 26: BNE	bne,a	<label_0x1>
	.word 0x82720009  ! 26: UDIV_R	udiv 	%r8, %r9, %r1
	.word 0x04800001  ! 28: BLE	ble  	<label_0x1>
	.word 0x8c720009  ! 28: UDIV_R	udiv 	%r8, %r9, %r6
	.word 0x829a295c  ! 30: XORcc_I	xorcc 	%r8, 0x095c, %r1
	.word 0x820a0009  ! 30: AND_R	and 	%r8, %r9, %r1
	.word 0x94422e3c  ! 30: ADDC_I	addc 	%r8, 0x0e3c, %r10
	.word 0x8eaa218c  ! 30: ANDNcc_I	andncc 	%r8, 0x018c, %r7
	.word 0x8cb22918  ! 30: SUBCcc_I	orncc 	%r8, 0x0918, %r6
	.word 0xaab22b78  ! 30: ORNcc_I	orncc 	%r8, 0x0b78, %r21
	.word 0x820a0009  ! 30: AND_R	and 	%r8, %r9, %r1
	.word 0x88220009  ! 30: SUB_R	sub 	%r8, %r9, %r4
	.word 0x8622280c  ! 30: SUB_I	sub 	%r8, 0x080c, %r3
	.word 0x86222890  ! 30: SUB_I	sub 	%r8, 0x0890, %r3
	.word 0x8a8225fc  ! 30: ADDcc_I	addcc 	%r8, 0x05fc, %r5
	.word 0x22c20001  ! 32: BRZ	brz,a,nt	%8,<label_0x20001>
	.word 0x8af22524  ! 32: UDIVcc_I	udivcc 	%r8, 0x0524, %r5
	.word 0xc42a0009  ! 40: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc20a0009  ! 40: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xc9020009  ! 40: LDF_R	ld	[%r8, %r9], %f4
	.word 0x9a7a0009  ! 40: SDIV_R	sdiv 	%r8, %r9, %r13
	.word 0x3a800002  ! 44: BCC	bcc,a	<label_0x2>
	.word 0x856a2710  ! 44: SDIVX_I	sdivx	%r8, 0x0710, %r2
	.word 0x22800001  ! 48: BE	be,a	<label_0x1>
	.word 0x86722594  ! 48: UDIV_I	udiv 	%r8, 0x0594, %r3
	.word 0x88b20009  ! 50: SUBCcc_R	orncc 	%r8, %r9, %r4
	.word 0x8d2a1009  ! 50: SLLX_R	sllx	%r8, %r9, %r6
	.word 0xa00a2be4  ! 50: AND_I	and 	%r8, 0x0be4, %r16
	.word 0x86320009  ! 50: SUBC_R	orn 	%r8, %r9, %r3
	.word 0x8a320009  ! 50: ORN_R	orn 	%r8, %r9, %r5
	.word 0xab641809  ! 50: MOVcc_R	<illegal instruction>
	.word 0x8d321009  ! 50: SRLX_R	srlx	%r8, %r9, %r6
	.word 0xbc0a26c4  ! 50: AND_I	and 	%r8, 0x06c4, %r30
	.word 0xb22a2d18  ! 50: ANDN_I	andn 	%r8, 0x0d18, %r25
	.word 0x98420009  ! 50: ADDC_R	addc 	%r8, %r9, %r12
	.word 0x2a800001  ! 52: BCS	bcs,a	<label_0x1>
	.word 0x876a0009  ! 52: SDIVX_R	sdivx	%r8, %r9, %r3
	.word 0x2a800002  ! 54: BCS	bcs,a	<label_0x2>
	.word 0x827a0009  ! 54: SDIV_R	sdiv 	%r8, %r9, %r1
	.word 0x8ab20009  ! 55: ORNcc_R	orncc 	%r8, %r9, %r5
	.word 0x88b20009  ! 55: SUBCcc_R	orncc 	%r8, %r9, %r4
	.word 0xba120009  ! 55: OR_R	or 	%r8, %r9, %r29
	.word 0x9a320009  ! 55: ORN_R	orn 	%r8, %r9, %r13
	.word 0x8d643801  ! 55: MOVcc_I	<illegal instruction>
	.word 0x88420009  ! 55: ADDC_R	addc 	%r8, %r9, %r4
	.word 0x86b228f8  ! 55: SUBCcc_I	orncc 	%r8, 0x08f8, %r3
	.word 0x88220009  ! 55: SUB_R	sub 	%r8, %r9, %r4
	.word 0x8d2a0009  ! 55: SLL_R	sll 	%r8, %r9, %r6
	.word 0x8aa20009  ! 55: SUBcc_R	subcc 	%r8, %r9, %r5
	.word 0xa1782401  ! 55: MOVR_I	move	%r0, 0x9, %r16
	.word 0x8caa2028  ! 55: ANDNcc_I	andncc 	%r8, 0x0028, %r6
	.word 0xcc2a0009  ! 59: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc6420009  ! 59: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xbafa292c  ! 59: SDIVcc_I	sdivcc 	%r8, 0x092c, %r29
	.word 0x84fa26b0  ! 59: SDIVcc_I	sdivcc 	%r8, 0x06b0, %r2
	.word 0xb8220009  ! 63: SUB_R	sub 	%r8, %r9, %r28
	.word 0x8e3224b0  ! 63: ORN_I	orn 	%r8, 0x04b0, %r7
	.word 0xaa120009  ! 63: OR_R	or 	%r8, %r9, %r21
	.word 0x889a2160  ! 63: XORcc_I	xorcc 	%r8, 0x0160, %r4
	.word 0x888a0009  ! 63: ANDcc_R	andcc 	%r8, %r9, %r4
	.word 0x88b20009  ! 63: SUBCcc_R	orncc 	%r8, %r9, %r4
	.word 0x982a0009  ! 63: ANDN_R	andn 	%r8, %r9, %r12
	.word 0xae322bd4  ! 63: ORN_I	orn 	%r8, 0x0bd4, %r23
	.word 0xb09a0009  ! 63: XORcc_R	xorcc 	%r8, %r9, %r24
	.word 0x86320009  ! 63: SUBC_R	orn 	%r8, %r9, %r3
	.word 0x82820009  ! 63: ADDcc_R	addcc 	%r8, %r9, %r1
	.word 0x8f3a3001  ! 63: SRAX_I	srax	%r8, 0x0001, %r7
	.word 0x1e800001  ! 66: BVC	bvc  	<label_0x1>
	.word 0x867a21ac  ! 66: SDIV_I	sdiv 	%r8, 0x01ac, %r3
	.word 0xa4b20009  ! 68: ORNcc_R	orncc 	%r8, %r9, %r18
	.word 0x952a0009  ! 68: SLL_R	sll 	%r8, %r9, %r10
	.word 0x88b20009  ! 68: SUBCcc_R	orncc 	%r8, %r9, %r4
	.word 0x86b20009  ! 68: ORNcc_R	orncc 	%r8, %r9, %r3
	.word 0xbd323001  ! 68: SRLX_I	srlx	%r8, 0x0001, %r30
	.word 0xa13a3001  ! 68: SRAX_I	srax	%r8, 0x0001, %r16
	.word 0x89320009  ! 68: SRL_R	srl 	%r8, %r9, %r4
	.word 0x8a420009  ! 68: ADDC_R	addc 	%r8, %r9, %r5
	.word 0x8e220009  ! 68: SUB_R	sub 	%r8, %r9, %r7
	.word 0xbb782401  ! 68: MOVR_I	move	%r0, 0x9, %r29
	.word 0x8cb223b4  ! 68: SUBCcc_I	orncc 	%r8, 0x03b4, %r6
	.word 0x8c320009  ! 68: SUBC_R	orn 	%r8, %r9, %r6
	.word 0x8a2a2650  ! 68: ANDN_I	andn 	%r8, 0x0650, %r5
	.word 0x20800001  ! 72: BN	bn,a	<label_0x1>
	.word 0xa0fa0009  ! 72: SDIVcc_R	sdivcc 	%r8, %r9, %r16
	.word 0x869a2e9c  ! 79: XORcc_I	xorcc 	%r8, 0x0e9c, %r3
	.word 0x8c2a0009  ! 79: ANDN_R	andn 	%r8, %r9, %r6
	.word 0x821a2c74  ! 79: XOR_I	xor 	%r8, 0x0c74, %r1
	.word 0xa0aa283c  ! 79: ANDNcc_I	andncc 	%r8, 0x083c, %r16
	.word 0x8d641809  ! 79: MOVcc_R	<illegal instruction>
	.word 0x8c322098  ! 79: ORN_I	orn 	%r8, 0x0098, %r6
	.word 0x8cba21d0  ! 79: XNORcc_I	xnorcc 	%r8, 0x01d0, %r6
	.word 0x82aa0009  ! 79: ANDNcc_R	andncc 	%r8, %r9, %r1
	.word 0x8b320009  ! 79: SRL_R	srl 	%r8, %r9, %r5
	.word 0x82220009  ! 79: SUB_R	sub 	%r8, %r9, %r1
	.word 0x8a2a26fc  ! 79: ANDN_I	andn 	%r8, 0x06fc, %r5
	.word 0x848223a4  ! 80: ADDcc_I	addcc 	%r8, 0x03a4, %r2
	.word 0x88220009  ! 80: SUB_R	sub 	%r8, %r9, %r4
	.word 0x8d3a0009  ! 80: SRA_R	sra 	%r8, %r9, %r6
	.word 0x88b22aec  ! 80: ORNcc_I	orncc 	%r8, 0x0aec, %r4
	.word 0x883a23b8  ! 80: XNOR_I	xnor 	%r8, 0x03b8, %r4
	.word 0xaa822174  ! 80: ADDcc_I	addcc 	%r8, 0x0174, %r21
	.word 0x88a227d8  ! 80: SUBcc_I	subcc 	%r8, 0x07d8, %r4
	.word 0xa68a2b68  ! 80: ANDcc_I	andcc 	%r8, 0x0b68, %r19
	.word 0x9d3a3001  ! 80: SRAX_I	srax	%r8, 0x0001, %r14
	.word 0x89641809  ! 80: MOVcc_R	<illegal instruction>
	.word 0xae320009  ! 80: ORN_R	orn 	%r8, %r9, %r23
	.word 0x89643801  ! 80: MOVcc_I	<illegal instruction>
	.word 0x8d321009  ! 80: SRLX_R	srlx	%r8, %r9, %r6
	.word 0x8c320009  ! 80: SUBC_R	orn 	%r8, %r9, %r6
	.word 0xa09a2dec  ! 80: XORcc_I	xorcc 	%r8, 0x0dec, %r16
	.word 0x82b20009  ! 86: SUBCcc_R	orncc 	%r8, %r9, %r1
	.word 0xb6b20009  ! 86: SUBCcc_R	orncc 	%r8, %r9, %r27
	.word 0x84420009  ! 86: ADDC_R	addc 	%r8, %r9, %r2
	.word 0x9e1a2818  ! 86: XOR_I	xor 	%r8, 0x0818, %r15
	.word 0xb4122034  ! 86: OR_I	or 	%r8, 0x0034, %r26
	.word 0x8b2a3001  ! 86: SLLX_I	sllx	%r8, 0x0001, %r5
	.word 0xbcc22ca4  ! 86: ADDCcc_I	addccc 	%r8, 0x0ca4, %r30
	.word 0x832a1009  ! 86: SLLX_R	sllx	%r8, %r9, %r1
	.word 0x83641809  ! 86: MOVcc_R	<illegal instruction>
	.word 0x8a320009  ! 86: ORN_R	orn 	%r8, %r9, %r5
	.word 0xb4320009  ! 88: ORN_R	orn 	%r8, %r9, %r26
	.word 0x8cb22980  ! 88: SUBCcc_I	orncc 	%r8, 0x0980, %r6
	.word 0x840a0009  ! 88: AND_R	and 	%r8, %r9, %r2
	.word 0x8d641809  ! 88: MOVcc_R	<illegal instruction>
	.word 0xb6920009  ! 88: ORcc_R	orcc 	%r8, %r9, %r27
	.word 0x82c2242c  ! 88: ADDCcc_I	addccc 	%r8, 0x042c, %r1
	.word 0x8cba0009  ! 88: XNORcc_R	xnorcc 	%r8, %r9, %r6
	.word 0x8e220009  ! 88: SUB_R	sub 	%r8, %r9, %r7
	.word 0x8c822424  ! 88: ADDcc_I	addcc 	%r8, 0x0424, %r6
	.word 0x8f323001  ! 88: SRLX_I	srlx	%r8, 0x0001, %r7
	.word 0x8b3a2001  ! 88: SRA_I	sra 	%r8, 0x0001, %r5
	.word 0x86922b20  ! 88: ORcc_I	orcc 	%r8, 0x0b20, %r3
	.word 0x84022cd8  ! 88: ADD_I	add 	%r8, 0x0cd8, %r2
	.word 0x00800001  ! 90: BN	bn  	<label_0x1>
	.word 0x866a0009  ! 90: UDIVX_R	udivx 	%r8, %r9, %r3
	.word 0x0eca0001  ! 92: BRGEZ	brgez  ,pt	%8,<label_0xa0001>
	.word 0xa2722680  ! 92: UDIV_I	udiv 	%r8, 0x0680, %r17
	.word 0xa9782401  ! 95: MOVR_I	move	%r0, 0x9, %r20
	.word 0x8a320009  ! 95: ORN_R	orn 	%r8, %r9, %r5
	.word 0xbc122ee8  ! 95: OR_I	or 	%r8, 0x0ee8, %r30
	.word 0x883a2a0c  ! 95: XNOR_I	xnor 	%r8, 0x0a0c, %r4
	.word 0x843a2a54  ! 95: XNOR_I	xnor 	%r8, 0x0a54, %r2
	.word 0xa49a0009  ! 95: XORcc_R	xorcc 	%r8, %r9, %r18
	.word 0x8e8a26b8  ! 95: ANDcc_I	andcc 	%r8, 0x06b8, %r7
	.word 0x84022a50  ! 95: ADD_I	add 	%r8, 0x0a50, %r2
	.word 0x98320009  ! 95: ORN_R	orn 	%r8, %r9, %r12
	.word 0x881a0009  ! 95: XOR_R	xor 	%r8, %r9, %r4
	.word 0xc73a0009  ! 100: STDF_R	std	%f3, [%r9, %r8]
	.word 0xeb020009  ! 100: LDF_R	ld	[%r8, %r9], %f21
	.word 0xb32a2001  ! 100: SLL_I	sll 	%r8, 0x0001, %r25
	.word 0x9ef22a68  ! 100: UDIVcc_I	udivcc 	%r8, 0x0a68, %r15
	.word 0x8eb20009  ! 104: SUBCcc_R	orncc 	%r8, %r9, %r7
	.word 0xa4220009  ! 104: SUB_R	sub 	%r8, %r9, %r18
	.word 0x84820009  ! 104: ADDcc_R	addcc 	%r8, %r9, %r2
	.word 0x83641809  ! 104: MOVcc_R	<illegal instruction>
	.word 0x840a2414  ! 104: AND_I	and 	%r8, 0x0414, %r2
	.word 0x849a0009  ! 104: XORcc_R	xorcc 	%r8, %r9, %r2
	.word 0x89780409  ! 104: MOVR_R	move	%r0, %r9, %r4
	.word 0xb7780409  ! 104: MOVR_R	move	%r0, %r9, %r27
	.word 0xacaa23c8  ! 104: ANDNcc_I	andncc 	%r8, 0x03c8, %r22
	.word 0xae222990  ! 104: SUB_I	sub 	%r8, 0x0990, %r23
	.word 0x82320009  ! 104: SUBC_R	orn 	%r8, %r9, %r1
	.word 0x8c0a0009  ! 105: AND_R	and 	%r8, %r9, %r6
	.word 0x8e820009  ! 105: ADDcc_R	addcc 	%r8, %r9, %r7
	.word 0x889a0009  ! 105: XORcc_R	xorcc 	%r8, %r9, %r4
	.word 0x889a21b8  ! 105: XORcc_I	xorcc 	%r8, 0x01b8, %r4
	.word 0xbc320009  ! 105: SUBC_R	orn 	%r8, %r9, %r30
	.word 0x9a1a2de0  ! 105: XOR_I	xor 	%r8, 0x0de0, %r13
	.word 0x8f323001  ! 105: SRLX_I	srlx	%r8, 0x0001, %r7
	.word 0xa72a0009  ! 105: SLL_R	sll 	%r8, %r9, %r19
	.word 0x85780409  ! 105: MOVR_R	move	%r0, %r9, %r2
	.word 0x843220f8  ! 105: ORN_I	orn 	%r8, 0x00f8, %r2
	.word 0x98aa0009  ! 105: ANDNcc_R	andncc 	%r8, %r9, %r12
	.word 0x0ac20001  ! 111: BRNZ	brnz  ,nt	%8,<label_0x20001>
	.word 0x88f20009  ! 111: UDIVcc_R	udivcc 	%r8, %r9, %r4
	.word 0xbeaa0009  ! 113: ANDNcc_R	andncc 	%r8, %r9, %r31
	.word 0x893a3001  ! 113: SRAX_I	srax	%r8, 0x0001, %r4
	.word 0x8ab20009  ! 113: ORNcc_R	orncc 	%r8, %r9, %r5
	.word 0x8a222a78  ! 113: SUB_I	sub 	%r8, 0x0a78, %r5
	.word 0x8e3a0009  ! 113: XNOR_R	xnor 	%r8, %r9, %r7
	.word 0x843a0009  ! 113: XNOR_R	xnor 	%r8, %r9, %r2
	.word 0x84c22654  ! 113: ADDCcc_I	addccc 	%r8, 0x0654, %r2
	.word 0x8f322001  ! 113: SRL_I	srl 	%r8, 0x0001, %r7
	.word 0x873a0009  ! 113: SRA_R	sra 	%r8, %r9, %r3
	.word 0x84c22774  ! 113: ADDCcc_I	addccc 	%r8, 0x0774, %r2
	.word 0xbcba0009  ! 113: XNORcc_R	xnorcc 	%r8, %r9, %r30
	.word 0xa2320009  ! 113: ORN_R	orn 	%r8, %r9, %r17
	.word 0xc2320009  ! 123: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xe6520009  ! 123: LDSH_R	ldsh	[%r8 + %r9], %r19
	.word 0x8a7a0009  ! 123: SDIV_R	sdiv 	%r8, %r9, %r5
	.word 0x8c6a0009  ! 123: UDIVX_R	udivx 	%r8, %r9, %r6
	.word 0x2a800001  ! 127: BCS	bcs,a	<label_0x1>
	.word 0x86fa0009  ! 127: SDIVcc_R	sdivcc 	%r8, %r9, %r3
	.word 0x06ca0001  ! 131: BRLZ	brlz  ,pt	%8,<label_0xa0001>
	.word 0x887a2320  ! 131: SDIV_I	sdiv 	%r8, 0x0320, %r4
	.word 0x8a020009  ! 132: ADD_R	add 	%r8, %r9, %r5
	.word 0xa80a267c  ! 132: AND_I	and 	%r8, 0x067c, %r20
	.word 0x8d2a0009  ! 132: SLL_R	sll 	%r8, %r9, %r6
	.word 0x86120009  ! 132: OR_R	or 	%r8, %r9, %r3
	.word 0x849a0009  ! 132: XORcc_R	xorcc 	%r8, %r9, %r2
	.word 0x8e8a0009  ! 132: ANDcc_R	andcc 	%r8, %r9, %r7
	.word 0xbd3a2001  ! 132: SRA_I	sra 	%r8, 0x0001, %r30
	.word 0xb7321009  ! 132: SRLX_R	srlx	%r8, %r9, %r27
	.word 0x993a0009  ! 132: SRA_R	sra 	%r8, %r9, %r12
	.word 0x86ba0009  ! 132: XNORcc_R	xnorcc 	%r8, %r9, %r3
	.word 0x8c320009  ! 132: ORN_R	orn 	%r8, %r9, %r6
	.word 0x8f321009  ! 132: SRLX_R	srlx	%r8, %r9, %r7
	.word 0x82a20009  ! 132: SUBcc_R	subcc 	%r8, %r9, %r1
	.word 0x2a800001  ! 134: BCS	bcs,a	<label_0x1>
	.word 0xbe7a0009  ! 134: SDIV_R	sdiv 	%r8, %r9, %r31
	.word 0x8a320009  ! 135: ORN_R	orn 	%r8, %r9, %r5
	.word 0x8ec20009  ! 135: ADDCcc_R	addccc 	%r8, %r9, %r7
	.word 0x84022f34  ! 135: ADD_I	add 	%r8, 0x0f34, %r2
	.word 0x9aba2ae8  ! 135: XNORcc_I	xnorcc 	%r8, 0x0ae8, %r13
	.word 0x823a2df8  ! 135: XNOR_I	xnor 	%r8, 0x0df8, %r1
	.word 0xbc120009  ! 135: OR_R	or 	%r8, %r9, %r30
	.word 0x8d3a3001  ! 135: SRAX_I	srax	%r8, 0x0001, %r6
	.word 0x8ca226b8  ! 135: SUBcc_I	subcc 	%r8, 0x06b8, %r6
	.word 0x892a3001  ! 135: SLLX_I	sllx	%r8, 0x0001, %r4
	.word 0x98920009  ! 135: ORcc_R	orcc 	%r8, %r9, %r12
	.word 0x84aa0009  ! 135: ANDNcc_R	andncc 	%r8, %r9, %r2
	.word 0xbe0a22cc  ! 135: AND_I	and 	%r8, 0x02cc, %r31
	.word 0x8a1a2000  ! 135: XOR_I	xor 	%r8, 0x0000, %r5
	.word 0x83321009  ! 135: SRLX_R	srlx	%r8, %r9, %r1
	.word 0x880a0009  ! 135: AND_R	and 	%r8, %r9, %r4
	.word 0x22800002  ! 137: BE	be,a	<label_0x2>
	.word 0x8e6a0009  ! 137: UDIVX_R	udivx 	%r8, %r9, %r7
	.word 0x32800001  ! 139: BNE	bne,a	<label_0x1>
	.word 0x8cfa0009  ! 139: SDIVcc_R	sdivcc 	%r8, %r9, %r6
	.word 0x849224e0  ! 141: ORcc_I	orcc 	%r8, 0x04e0, %r2
	.word 0x9b3a3001  ! 141: SRAX_I	srax	%r8, 0x0001, %r13
	.word 0xbd2a1009  ! 141: SLLX_R	sllx	%r8, %r9, %r30
	.word 0xbab20009  ! 141: SUBCcc_R	orncc 	%r8, %r9, %r29
	.word 0x87780409  ! 141: MOVR_R	move	%r0, %r9, %r3
	.word 0xa72a0009  ! 141: SLL_R	sll 	%r8, %r9, %r19
	.word 0xab323001  ! 141: SRLX_I	srlx	%r8, 0x0001, %r21
	.word 0x9a0a2428  ! 141: AND_I	and 	%r8, 0x0428, %r13
	.word 0x88122224  ! 141: OR_I	or 	%r8, 0x0224, %r4
	.word 0x88222968  ! 141: SUB_I	sub 	%r8, 0x0968, %r4
	.word 0x18800001  ! 145: BGU	bgu  	<label_0x1>
	.word 0x8f6a0009  ! 145: SDIVX_R	sdivx	%r8, %r9, %r7
	.word 0xca320009  ! 152: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xcd1a0009  ! 152: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0x86fa0009  ! 152: SDIVcc_R	sdivcc 	%r8, %r9, %r3
	.word 0x82f20009  ! 152: UDIVcc_R	udivcc 	%r8, %r9, %r1
	.word 0x04800001  ! 154: BLE	ble  	<label_0x1>
	.word 0x867a0009  ! 154: SDIV_R	sdiv 	%r8, %r9, %r3
	.word 0x3c800002  ! 156: BPOS	bpos,a	<label_0x2>
	.word 0x866a0009  ! 156: UDIVX_R	udivx 	%r8, %r9, %r3
	.word 0x40000001  ! 158: CALL	call	disp30_1
	.word 0xa2fa0009  ! 158: SDIVcc_R	sdivcc 	%r8, %r9, %r17
	.word 0x86ba0009  ! 159: XNORcc_R	xnorcc 	%r8, %r9, %r3
	.word 0x8e2a0009  ! 159: ANDN_R	andn 	%r8, %r9, %r7
	.word 0xb6b20009  ! 159: SUBCcc_R	orncc 	%r8, %r9, %r27
	.word 0x8d323001  ! 159: SRLX_I	srlx	%r8, 0x0001, %r6
	.word 0x892a0009  ! 159: SLL_R	sll 	%r8, %r9, %r4
	.word 0x892a2001  ! 159: SLL_I	sll 	%r8, 0x0001, %r4
	.word 0x8c222d2c  ! 159: SUB_I	sub 	%r8, 0x0d2c, %r6
	.word 0xbc0a0009  ! 159: AND_R	and 	%r8, %r9, %r30
	.word 0x98a224fc  ! 159: SUBcc_I	subcc 	%r8, 0x04fc, %r12
	.word 0x86320009  ! 159: ORN_R	orn 	%r8, %r9, %r3
	.word 0x8a0a29dc  ! 159: AND_I	and 	%r8, 0x09dc, %r5
	.word 0xa0ba23ac  ! 159: XNORcc_I	xnorcc 	%r8, 0x03ac, %r16
	.word 0x9aa22394  ! 159: SUBcc_I	subcc 	%r8, 0x0394, %r13
	.word 0x20800001  ! 161: BN	bn,a	<label_0x1>
	.word 0x836a2594  ! 161: SDIVX_I	sdivx	%r8, 0x0594, %r1
	.word 0xc2320009  ! 165: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc01a0009  ! 165: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0x88f22774  ! 165: UDIVcc_I	udivcc 	%r8, 0x0774, %r4
	.word 0x88fa2728  ! 165: SDIVcc_I	sdivcc 	%r8, 0x0728, %r4
	.word 0xfa2a0009  ! 169: STB_R	stb	%r29, [%r8 + %r9]
	.word 0xf6520009  ! 169: LDSH_R	ldsh	[%r8 + %r9], %r27
	.word 0x8ab20009  ! 169: ORNcc_R	orncc 	%r8, %r9, %r5
	.word 0xac7a0009  ! 169: SDIV_R	sdiv 	%r8, %r9, %r22
	.word 0xcd220009  ! 176: STF_R	st	%f6, [%r9, %r8]
	.word 0xcc520009  ! 176: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0x887a0009  ! 176: SDIV_R	sdiv 	%r8, %r9, %r4
	.word 0x8af220b0  ! 176: UDIVcc_I	udivcc 	%r8, 0x00b0, %r5
	.word 0xec320009  ! 180: STH_R	sth	%r22, [%r8 + %r9]
	.word 0xc9020009  ! 180: LDF_R	ld	[%r8, %r9], %f4
	.word 0xa3321009  ! 180: SRLX_R	srlx	%r8, %r9, %r17
	.word 0x8c6a0009  ! 180: UDIVX_R	udivx 	%r8, %r9, %r6
	.word 0x832a2001  ! 181: SLL_I	sll 	%r8, 0x0001, %r1
	.word 0x992a2001  ! 181: SLL_I	sll 	%r8, 0x0001, %r12
	.word 0x8eba2804  ! 181: XNORcc_I	xnorcc 	%r8, 0x0804, %r7
	.word 0x8e8a22d4  ! 181: ANDcc_I	andcc 	%r8, 0x02d4, %r7
	.word 0x84820009  ! 181: ADDcc_R	addcc 	%r8, %r9, %r2
	.word 0x83782401  ! 181: MOVR_I	move	%r0, 0x9, %r1
	.word 0x862a0009  ! 181: ANDN_R	andn 	%r8, %r9, %r3
	.word 0x8d2a0009  ! 181: SLL_R	sll 	%r8, %r9, %r6
	.word 0xb2b22484  ! 181: SUBCcc_I	orncc 	%r8, 0x0484, %r25
	.word 0x853a0009  ! 181: SRA_R	sra 	%r8, %r9, %r2
	.word 0x8b2a0009  ! 181: SLL_R	sll 	%r8, %r9, %r5
	.word 0x8c420009  ! 181: ADDC_R	addc 	%r8, %r9, %r6
	.word 0xf5220009  ! 189: STF_R	st	%f26, [%r9, %r8]
	.word 0xdc020009  ! 189: LDUW_R	lduw	[%r8 + %r9], %r14
	.word 0x8a3a0009  ! 189: XNOR_R	xnor 	%r8, %r9, %r5
	.word 0x8672240c  ! 189: UDIV_I	udiv 	%r8, 0x040c, %r3
	.word 0x38800001  ! 192: BGU	bgu,a	<label_0x1>
	.word 0xb07223b8  ! 192: UDIV_I	udiv 	%r8, 0x03b8, %r24
	.word 0x833a0009  ! 193: SRA_R	sra 	%r8, %r9, %r1
	.word 0x880a0009  ! 193: AND_R	and 	%r8, %r9, %r4
	.word 0xa33a3001  ! 193: SRAX_I	srax	%r8, 0x0001, %r17
	.word 0x8b2a3001  ! 193: SLLX_I	sllx	%r8, 0x0001, %r5
	.word 0x8a020009  ! 193: ADD_R	add 	%r8, %r9, %r5
	.word 0x843a0009  ! 193: XNOR_R	xnor 	%r8, %r9, %r2
	.word 0x89320009  ! 193: SRL_R	srl 	%r8, %r9, %r4
	.word 0x980a0009  ! 193: AND_R	and 	%r8, %r9, %r12
	.word 0xb80223e0  ! 193: ADD_I	add 	%r8, 0x03e0, %r28
	.word 0x863227b4  ! 193: SUBC_I	orn 	%r8, 0x07b4, %r3
	.word 0x861a0009  ! 193: XOR_R	xor 	%r8, %r9, %r3
	.word 0x848a0009  ! 193: ANDcc_R	andcc 	%r8, %r9, %r2
	.word 0x94b20009  ! 193: SUBCcc_R	orncc 	%r8, %r9, %r10
	.word 0xc4720009  ! 198: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xe31a0009  ! 198: LDDF_R	ldd	[%r8, %r9], %f17
	.word 0xd60a2df8  ! 198: LDUB_I	ldub	[%r8 + 0x0df8], %r11
	.word 0x867a2020  ! 198: SDIV_I	sdiv 	%r8, 0x0020, %r3
	.word 0xb01a24ac  ! 200: XOR_I	xor 	%r8, 0x04ac, %r24
	.word 0x82322218  ! 200: ORN_I	orn 	%r8, 0x0218, %r1
	.word 0x8c3a0009  ! 200: XNOR_R	xnor 	%r8, %r9, %r6
	.word 0x88120009  ! 200: OR_R	or 	%r8, %r9, %r4
	.word 0xb6020009  ! 200: ADD_R	add 	%r8, %r9, %r27
	.word 0xaa320009  ! 200: SUBC_R	orn 	%r8, %r9, %r21
	.word 0x8c820009  ! 200: ADDcc_R	addcc 	%r8, %r9, %r6
	.word 0x83320009  ! 200: SRL_R	srl 	%r8, %r9, %r1
	.word 0x8b3a0009  ! 200: SRA_R	sra 	%r8, %r9, %r5
	.word 0x97641809  ! 200: MOVcc_R	<illegal instruction>
	.word 0x889a0009  ! 200: XORcc_R	xorcc 	%r8, %r9, %r4
	.word 0x8e32200c  ! 200: SUBC_I	orn 	%r8, 0x000c, %r7
	.word 0x8e3a0009  ! 200: XNOR_R	xnor 	%r8, %r9, %r7
	.word 0xb48a27d0  ! 200: ANDcc_I	andcc 	%r8, 0x07d0, %r26
	.word 0x0cca0001  ! 204: BRGZ	brgz  ,pt	%8,<label_0xa0001>
	.word 0x876a0009  ! 204: SDIVX_R	sdivx	%r8, %r9, %r3
	.word 0x0ac20001  ! 206: BRNZ	brnz  ,nt	%8,<label_0x20001>
	.word 0xa47a2b94  ! 206: SDIV_I	sdiv 	%r8, 0x0b94, %r18
	.word 0xca320009  ! 213: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc85a0009  ! 213: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0x88c22950  ! 213: ADDCcc_I	addccc 	%r8, 0x0950, %r4
	.word 0xb2722b38  ! 213: UDIV_I	udiv 	%r8, 0x0b38, %r25
	.word 0xcb220009  ! 217: STF_R	st	%f5, [%r9, %r8]
	.word 0xcc420009  ! 217: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xb27a0009  ! 217: SDIV_R	sdiv 	%r8, %r9, %r25
	.word 0x84fa0009  ! 217: SDIVcc_R	sdivcc 	%r8, %r9, %r2
	.word 0xc82a0009  ! 221: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xe64a0009  ! 221: LDSB_R	ldsb	[%r8 + %r9], %r19
	.word 0x86f20009  ! 221: UDIVcc_R	udivcc 	%r8, %r9, %r3
	.word 0x88f2219c  ! 221: UDIVcc_I	udivcc 	%r8, 0x019c, %r4
	.word 0x28800001  ! 223: BLEU	bleu,a	<label_0x1>
	.word 0x88fa2cd0  ! 223: SDIVcc_I	sdivcc 	%r8, 0x0cd0, %r4
	.word 0x8e320009  ! 224: ORN_R	orn 	%r8, %r9, %r7
	.word 0x8c1a0009  ! 224: XOR_R	xor 	%r8, %r9, %r6
	.word 0x8e922a4c  ! 224: ORcc_I	orcc 	%r8, 0x0a4c, %r7
	.word 0x868229f8  ! 224: ADDcc_I	addcc 	%r8, 0x09f8, %r3
	.word 0x8e222384  ! 224: SUB_I	sub 	%r8, 0x0384, %r7
	.word 0xb73a1009  ! 224: SRAX_R	srax	%r8, %r9, %r27
	.word 0x88c22970  ! 224: ADDCcc_I	addccc 	%r8, 0x0970, %r4
	.word 0xbd321009  ! 224: SRLX_R	srlx	%r8, %r9, %r30
	.word 0x94a20009  ! 224: SUBcc_R	subcc 	%r8, %r9, %r10
	.word 0xb72a2001  ! 224: SLL_I	sll 	%r8, 0x0001, %r27
	.word 0x88220009  ! 224: SUB_R	sub 	%r8, %r9, %r4
	.word 0x87323001  ! 224: SRLX_I	srlx	%r8, 0x0001, %r3
	.word 0xa32a2001  ! 224: SLL_I	sll 	%r8, 0x0001, %r17
	.word 0x8aba0009  ! 224: XNORcc_R	xnorcc 	%r8, %r9, %r5
	.word 0x86220009  ! 224: SUB_R	sub 	%r8, %r9, %r3
	.word 0x1c800001  ! 227: BPOS	bpos  	<label_0x1>
	.word 0x8cf224b0  ! 227: UDIVcc_I	udivcc 	%r8, 0x04b0, %r6
	.word 0xcb220009  ! 231: STF_R	st	%f5, [%r9, %r8]
	.word 0xf7020009  ! 231: LDF_R	ld	[%r8, %r9], %f27
	.word 0xb8720009  ! 231: UDIV_R	udiv 	%r8, %r9, %r28
	.word 0x8b6a0009  ! 231: SDIVX_R	sdivx	%r8, %r9, %r5
	.word 0xf4320009  ! 235: STH_R	sth	%r26, [%r8 + %r9]
	.word 0xcc0a0009  ! 235: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xb5641809  ! 235: MOVcc_R	<illegal instruction>
	.word 0x876a20f0  ! 235: SDIVX_I	sdivx	%r8, 0x00f0, %r3
	.word 0x88322e70  ! 236: SUBC_I	orn 	%r8, 0x0e70, %r4
	.word 0x888a2b14  ! 236: ANDcc_I	andcc 	%r8, 0x0b14, %r4
	.word 0xaf2a3001  ! 236: SLLX_I	sllx	%r8, 0x0001, %r23
	.word 0x8c0a2900  ! 236: AND_I	and 	%r8, 0x0900, %r6
	.word 0x8b321009  ! 236: SRLX_R	srlx	%r8, %r9, %r5
	.word 0x9c320009  ! 236: SUBC_R	orn 	%r8, %r9, %r14
	.word 0x9d641809  ! 236: MOVcc_R	<illegal instruction>
	.word 0x86420009  ! 236: ADDC_R	addc 	%r8, %r9, %r3
	.word 0x852a0009  ! 236: SLL_R	sll 	%r8, %r9, %r2
	.word 0x9ab228f0  ! 236: ORNcc_I	orncc 	%r8, 0x08f0, %r13
	.word 0x8e220009  ! 236: SUB_R	sub 	%r8, %r9, %r7
	.word 0x8ca22470  ! 236: SUBcc_I	subcc 	%r8, 0x0470, %r6
	.word 0x822a0009  ! 238: ANDN_R	andn 	%r8, %r9, %r1
	.word 0xa0322620  ! 238: ORN_I	orn 	%r8, 0x0620, %r16
	.word 0x8a120009  ! 238: OR_R	or 	%r8, %r9, %r5
	.word 0xa09a2fe4  ! 238: XORcc_I	xorcc 	%r8, 0x0fe4, %r16
	.word 0x8c0227a8  ! 238: ADD_I	add 	%r8, 0x07a8, %r6
	.word 0xaa1a2334  ! 238: XOR_I	xor 	%r8, 0x0334, %r21
	.word 0x86920009  ! 238: ORcc_R	orcc 	%r8, %r9, %r3
	.word 0x83320009  ! 238: SRL_R	srl 	%r8, %r9, %r1
	.word 0x9d643801  ! 238: MOVcc_I	<illegal instruction>
	.word 0xb01a0009  ! 238: XOR_R	xor 	%r8, %r9, %r24
	.word 0x852a3001  ! 238: SLLX_I	sllx	%r8, 0x0001, %r2
	.word 0x852a1009  ! 238: SLLX_R	sllx	%r8, %r9, %r2
	.word 0x2eca0001  ! 240: BRGEZ	brgez,a,pt	%8,<label_0xa0001>
	.word 0xb2f20009  ! 240: UDIVcc_R	udivcc 	%r8, %r9, %r25
	.word 0x04ca0001  ! 243: BRLEZ	brlez  ,pt	%8,<label_0xa0001>
	.word 0x82fa0009  ! 243: SDIVcc_R	sdivcc 	%r8, %r9, %r1
	.word 0x3e800001  ! 245: BVC	bvc,a	<label_0x1>
	.word 0x8a6a2aa0  ! 245: UDIVX_I	udivx 	%r8, 0x0aa0, %r5
	.word 0xc42a0009  ! 250: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc60a0009  ! 250: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0x84aa0009  ! 250: ANDNcc_R	andncc 	%r8, %r9, %r2
	.word 0x827a0009  ! 250: SDIV_R	sdiv 	%r8, %r9, %r1
	.word 0x8cba0009  ! 251: XNORcc_R	xnorcc 	%r8, %r9, %r6
	.word 0xa43a0009  ! 251: XNOR_R	xnor 	%r8, %r9, %r18
	.word 0x8a2a2744  ! 251: ANDN_I	andn 	%r8, 0x0744, %r5
	.word 0x82420009  ! 251: ADDC_R	addc 	%r8, %r9, %r1
	.word 0xbcc22f30  ! 251: ADDCcc_I	addccc 	%r8, 0x0f30, %r30
	.word 0x9cc22540  ! 251: ADDCcc_I	addccc 	%r8, 0x0540, %r14
	.word 0x8e822d20  ! 251: ADDcc_I	addcc 	%r8, 0x0d20, %r7
	.word 0xbab20009  ! 251: SUBCcc_R	orncc 	%r8, %r9, %r29
	.word 0x89643801  ! 251: MOVcc_I	<illegal instruction>
	.word 0x82922924  ! 251: ORcc_I	orcc 	%r8, 0x0924, %r1
	.word 0x8e420009  ! 251: ADDC_R	addc 	%r8, %r9, %r7
	.word 0x86b20009  ! 251: SUBCcc_R	orncc 	%r8, %r9, %r3
	.word 0xb4322594  ! 251: ORN_I	orn 	%r8, 0x0594, %r26
	.word 0x86020009  ! 251: ADD_R	add 	%r8, %r9, %r3
	.word 0x8e420009  ! 253: ADDC_R	addc 	%r8, %r9, %r7
	.word 0xba2a289c  ! 253: ANDN_I	andn 	%r8, 0x089c, %r29
	.word 0x8b3a2001  ! 253: SRA_I	sra 	%r8, 0x0001, %r5
	.word 0x82b22200  ! 253: SUBCcc_I	orncc 	%r8, 0x0200, %r1
	.word 0x84220009  ! 253: SUB_R	sub 	%r8, %r9, %r2
	.word 0x8e0a2d10  ! 253: AND_I	and 	%r8, 0x0d10, %r7
	.word 0x98820009  ! 253: ADDcc_R	addcc 	%r8, %r9, %r12
	.word 0x821a2180  ! 253: XOR_I	xor 	%r8, 0x0180, %r1
	.word 0x8a8a25dc  ! 253: ANDcc_I	andcc 	%r8, 0x05dc, %r5
	.word 0x8d780409  ! 253: MOVR_R	move	%r0, %r9, %r6
	.word 0x94b20009  ! 253: SUBCcc_R	orncc 	%r8, %r9, %r10
	.word 0xa7320009  ! 253: SRL_R	srl 	%r8, %r9, %r19
	.word 0xbd782401  ! 253: MOVR_I	move	%r0, 0x74, %r30
	.word 0x86322f00  ! 253: SUBC_I	orn 	%r8, 0x0f00, %r3
	.word 0x82422ea8  ! 253: ADDC_I	addc 	%r8, 0x0ea8, %r1
	.word 0xc73a0009  ! 258: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc6420009  ! 258: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xff020009  ! 258: LDF_R	ld	[%r8, %r9], %f31
	.word 0x8b6a0009  ! 258: SDIVX_R	sdivx	%r8, %r9, %r5
	.word 0x88aa27c4  ! 261: ANDNcc_I	andncc 	%r8, 0x07c4, %r4
	.word 0x843223cc  ! 261: SUBC_I	orn 	%r8, 0x03cc, %r2
	.word 0x84aa0009  ! 261: ANDNcc_R	andncc 	%r8, %r9, %r2
	.word 0x87641809  ! 261: MOVcc_R	<illegal instruction>
	.word 0x8c3a2b70  ! 261: XNOR_I	xnor 	%r8, 0x0b70, %r6
	.word 0x83321009  ! 261: SRLX_R	srlx	%r8, %r9, %r1
	.word 0x87322001  ! 261: SRL_I	srl 	%r8, 0x0001, %r3
	.word 0xbcb20009  ! 261: SUBCcc_R	orncc 	%r8, %r9, %r30
	.word 0xad2a3001  ! 261: SLLX_I	sllx	%r8, 0x0001, %r22
	.word 0x861a0009  ! 261: XOR_R	xor 	%r8, %r9, %r3
	.word 0x22800001  ! 264: BE	be,a	<label_0x1>
	.word 0x96f22184  ! 264: UDIVcc_I	udivcc 	%r8, 0x0184, %r11
	.word 0x2c800001  ! 267: BNEG	bneg,a	<label_0x1>
	.word 0x847a20dc  ! 267: SDIV_I	sdiv 	%r8, 0x00dc, %r2
	.word 0x2cca0001  ! 269: BRGZ	brgz,a,pt	%8,<label_0xa0001>
	.word 0x856a0009  ! 269: SDIVX_R	sdivx	%r8, %r9, %r2
	.word 0xd6220009  ! 276: STW_R	stw	%r11, [%r8 + %r9]
	.word 0xc6020009  ! 276: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xdc1a0009  ! 276: LDD_R	ldd	[%r8 + %r9], %r14
	.word 0x86722d3c  ! 276: UDIV_I	udiv 	%r8, 0x0d3c, %r3
	.word 0x82b20009  ! 277: SUBCcc_R	orncc 	%r8, %r9, %r1
	.word 0xbc3a2c68  ! 277: XNOR_I	xnor 	%r8, 0x0c68, %r30
	.word 0x8c320009  ! 277: ORN_R	orn 	%r8, %r9, %r6
	.word 0xb2320009  ! 277: ORN_R	orn 	%r8, %r9, %r25
	.word 0x8e3a25a4  ! 277: XNOR_I	xnor 	%r8, 0x05a4, %r7
	.word 0x8cba0009  ! 277: XNORcc_R	xnorcc 	%r8, %r9, %r6
	.word 0xa1320009  ! 277: SRL_R	srl 	%r8, %r9, %r16
	.word 0x86022568  ! 277: ADD_I	add 	%r8, 0x0568, %r3
	.word 0xbe0a2b3c  ! 277: AND_I	and 	%r8, 0x0b3c, %r31
	.word 0x892a1009  ! 277: SLLX_R	sllx	%r8, %r9, %r4
	.word 0x8d782401  ! 277: MOVR_I	move	%r0, 0x9, %r6
	.word 0x840a218c  ! 277: AND_I	and 	%r8, 0x018c, %r2
	.word 0xa2c22580  ! 277: ADDCcc_I	addccc 	%r8, 0x0580, %r17
	.word 0x12800001  ! 279: BNE	bne  	<label_0x1>
	.word 0x84f220a0  ! 279: UDIVcc_I	udivcc 	%r8, 0x00a0, %r2
	.word 0x8a9a2534  ! 282: XORcc_I	xorcc 	%r8, 0x0534, %r5
	.word 0x84c20009  ! 282: ADDCcc_R	addccc 	%r8, %r9, %r2
	.word 0x8b643801  ! 282: MOVcc_I	<illegal instruction>
	.word 0x8a422c4c  ! 282: ADDC_I	addc 	%r8, 0x0c4c, %r5
	.word 0x861a0009  ! 282: XOR_R	xor 	%r8, %r9, %r3
	.word 0x8e1a2a28  ! 282: XOR_I	xor 	%r8, 0x0a28, %r7
	.word 0x8832276c  ! 282: ORN_I	orn 	%r8, 0x076c, %r4
	.word 0x892a2001  ! 282: SLL_I	sll 	%r8, 0x0001, %r4
	.word 0x89780409  ! 282: MOVR_R	move	%r0, %r9, %r4
	.word 0x8eb20009  ! 282: SUBCcc_R	orncc 	%r8, %r9, %r7
	.word 0x86022e9c  ! 282: ADD_I	add 	%r8, 0x0e9c, %r3
	.word 0x8eaa0009  ! 282: ANDNcc_R	andncc 	%r8, %r9, %r7
	.word 0x04800001  ! 284: BLE	ble  	<label_0x1>
	.word 0x9ef22c34  ! 284: UDIVcc_I	udivcc 	%r8, 0x0c34, %r15
	.word 0xcf3a0009  ! 288: STDF_R	std	%f7, [%r9, %r8]
	.word 0xce4a0009  ! 288: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xbea22688  ! 288: SUBcc_I	subcc 	%r8, 0x0688, %r31
	.word 0x8c7a2ad0  ! 288: SDIV_I	sdiv 	%r8, 0x0ad0, %r6
	.word 0xc9220009  ! 292: STF_R	st	%f4, [%r9, %r8]
	.word 0xfc1a0009  ! 292: LDD_R	ldd	[%r8 + %r9], %r30
	.word 0x886a0009  ! 292: UDIVX_R	udivx 	%r8, %r9, %r4
	.word 0x867a0009  ! 292: SDIV_R	sdiv 	%r8, %r9, %r3
	.word 0x8c220009  ! 293: SUB_R	sub 	%r8, %r9, %r6
	.word 0x88120009  ! 293: OR_R	or 	%r8, %r9, %r4
	.word 0x82920009  ! 293: ORcc_R	orcc 	%r8, %r9, %r1
	.word 0xbc122464  ! 293: OR_I	or 	%r8, 0x0464, %r30
	.word 0x8b2a2001  ! 293: SLL_I	sll 	%r8, 0x0001, %r5
	.word 0x94b20009  ! 293: ORNcc_R	orncc 	%r8, %r9, %r10
	.word 0x8222214c  ! 293: SUB_I	sub 	%r8, 0x014c, %r1
	.word 0xa12a0009  ! 293: SLL_R	sll 	%r8, %r9, %r16
	.word 0xae1a2274  ! 293: XOR_I	xor 	%r8, 0x0274, %r23
	.word 0xb88a2200  ! 293: ANDcc_I	andcc 	%r8, 0x0200, %r28
	.word 0xbf2a0009  ! 293: SLL_R	sll 	%r8, %r9, %r31
	.word 0xb6b20009  ! 293: SUBCcc_R	orncc 	%r8, %r9, %r27
	.word 0x86822f1c  ! 293: ADDcc_I	addcc 	%r8, 0x0f1c, %r3
	.word 0x86b20009  ! 293: ORNcc_R	orncc 	%r8, %r9, %r3
	.word 0xb83a2754  ! 293: XNOR_I	xnor 	%r8, 0x0754, %r28
	.word 0x86ba2884  ! 295: XNORcc_I	xnorcc 	%r8, 0x0884, %r3
	.word 0x97780409  ! 295: MOVR_R	move	%r0, %r9, %r11
	.word 0xa0320009  ! 295: ORN_R	orn 	%r8, %r9, %r16
	.word 0x84c22a68  ! 295: ADDCcc_I	addccc 	%r8, 0x0a68, %r2
	.word 0x832a0009  ! 295: SLL_R	sll 	%r8, %r9, %r1
	.word 0x853a0009  ! 295: SRA_R	sra 	%r8, %r9, %r2
	.word 0x8d322001  ! 295: SRL_I	srl 	%r8, 0x0001, %r6
	.word 0xb02a0009  ! 295: ANDN_R	andn 	%r8, %r9, %r24
	.word 0x88220009  ! 295: SUB_R	sub 	%r8, %r9, %r4
	.word 0x8d3a0009  ! 295: SRA_R	sra 	%r8, %r9, %r6
	.word 0x88320009  ! 297: SUBC_R	orn 	%r8, %r9, %r4
	.word 0x892a1009  ! 297: SLLX_R	sllx	%r8, %r9, %r4
	.word 0x8e8a2778  ! 297: ANDcc_I	andcc 	%r8, 0x0778, %r7
	.word 0x9b323001  ! 297: SRLX_I	srlx	%r8, 0x0001, %r13
	.word 0x832a1009  ! 297: SLLX_R	sllx	%r8, %r9, %r1
	.word 0x84922f38  ! 297: ORcc_I	orcc 	%r8, 0x0f38, %r2
	.word 0x84b22070  ! 297: SUBCcc_I	orncc 	%r8, 0x0070, %r2
	.word 0x86922f18  ! 297: ORcc_I	orcc 	%r8, 0x0f18, %r3
	.word 0x8aba0009  ! 297: XNORcc_R	xnorcc 	%r8, %r9, %r5
	.word 0x8b2a0009  ! 297: SLL_R	sll 	%r8, %r9, %r5
	.word 0x88920009  ! 297: ORcc_R	orcc 	%r8, %r9, %r4
	.word 0xa60a0009  ! 300: AND_R	and 	%r8, %r9, %r19
	.word 0x860a2590  ! 300: AND_I	and 	%r8, 0x0590, %r3
	.word 0x86a20009  ! 300: SUBcc_R	subcc 	%r8, %r9, %r3
	.word 0xb2320009  ! 300: SUBC_R	orn 	%r8, %r9, %r25
	.word 0xb4022c7c  ! 300: ADD_I	add 	%r8, 0x0c7c, %r26
	.word 0x848221e8  ! 300: ADDcc_I	addcc 	%r8, 0x01e8, %r2
	.word 0x833a0009  ! 300: SRA_R	sra 	%r8, %r9, %r1
	.word 0x97641809  ! 300: MOVcc_R	<illegal instruction>
	.word 0x849a2aa4  ! 300: XORcc_I	xorcc 	%r8, 0x0aa4, %r2
	.word 0x9caa0009  ! 300: ANDNcc_R	andncc 	%r8, %r9, %r14
	.word 0x832a0009  ! 300: SLL_R	sll 	%r8, %r9, %r1
	.word 0x9e0a2bd0  ! 300: AND_I	and 	%r8, 0x0bd0, %r15
	.word 0x892a2001  ! 300: SLL_I	sll 	%r8, 0x0001, %r4
	.word 0xb4a20009  ! 301: SUBcc_R	subcc 	%r8, %r9, %r26
	.word 0x82b22c64  ! 301: SUBCcc_I	orncc 	%r8, 0x0c64, %r1
	.word 0x84a20009  ! 301: SUBcc_R	subcc 	%r8, %r9, %r2
	.word 0x832a1009  ! 301: SLLX_R	sllx	%r8, %r9, %r1
	.word 0x84220009  ! 301: SUB_R	sub 	%r8, %r9, %r2
	.word 0xa0b22c40  ! 301: SUBCcc_I	orncc 	%r8, 0x0c40, %r16
	.word 0x89322001  ! 301: SRL_I	srl 	%r8, 0x0001, %r4
	.word 0x82120009  ! 301: OR_R	or 	%r8, %r9, %r1
	.word 0x85782401  ! 301: MOVR_I	move	%r0, 0x9, %r2
	.word 0x973a0009  ! 301: SRA_R	sra 	%r8, %r9, %r11
	.word 0x89320009  ! 301: SRL_R	srl 	%r8, %r9, %r4
	.word 0x89641809  ! 301: MOVcc_R	<illegal instruction>
	.word 0x1a800001  ! 303: BCC	bcc  	<label_0x1>
	.word 0xa672204c  ! 303: UDIV_I	udiv 	%r8, 0x004c, %r19
	.word 0x1c800001  ! 305: BPOS	bpos  	<label_0x1>
	.word 0x866a0009  ! 305: UDIVX_R	udivx 	%r8, %r9, %r3
	.word 0xc33a0009  ! 309: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc2120009  ! 309: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0x866a0009  ! 309: UDIVX_R	udivx 	%r8, %r9, %r3
	.word 0xae7a29ac  ! 309: SDIV_I	sdiv 	%r8, 0x09ac, %r23
	.word 0xce2a0009  ! 313: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc4520009  ! 313: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0x8d3a0009  ! 313: SRA_R	sra 	%r8, %r9, %r6
	.word 0x8472259c  ! 313: UDIV_I	udiv 	%r8, 0x059c, %r2
	.word 0x3e800001  ! 319: BVC	bvc,a	<label_0x1>
	.word 0x96720009  ! 319: UDIV_R	udiv 	%r8, %r9, %r11
	.word 0xf3220009  ! 323: STF_R	st	%f25, [%r9, %r8]
	.word 0xca420009  ! 323: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xb2fa0009  ! 323: SDIVcc_R	sdivcc 	%r8, %r9, %r25
	.word 0x82fa22a8  ! 323: SDIVcc_I	sdivcc 	%r8, 0x02a8, %r1
	.word 0x86aa0009  ! 325: ANDNcc_R	andncc 	%r8, %r9, %r3
	.word 0x88220009  ! 325: SUB_R	sub 	%r8, %r9, %r4
	.word 0x84b22fa8  ! 325: SUBCcc_I	orncc 	%r8, 0x0fa8, %r2
	.word 0xb12a2001  ! 325: SLL_I	sll 	%r8, 0x0001, %r24
	.word 0x823a2a04  ! 325: XNOR_I	xnor 	%r8, 0x0a04, %r1
	.word 0x96b20009  ! 325: SUBCcc_R	orncc 	%r8, %r9, %r11
	.word 0x8c2a0009  ! 325: ANDN_R	andn 	%r8, %r9, %r6
	.word 0xbcb20009  ! 325: SUBCcc_R	orncc 	%r8, %r9, %r30
	.word 0xb21a0009  ! 325: XOR_R	xor 	%r8, %r9, %r25
	.word 0x84420009  ! 325: ADDC_R	addc 	%r8, %r9, %r2
	.word 0x82022388  ! 325: ADD_I	add 	%r8, 0x0388, %r1
	.word 0x83320009  ! 325: SRL_R	srl 	%r8, %r9, %r1
	.word 0x943a0009  ! 327: XNOR_R	xnor 	%r8, %r9, %r10
	.word 0x82a20009  ! 327: SUBcc_R	subcc 	%r8, %r9, %r1
	.word 0x8e8a0009  ! 327: ANDcc_R	andcc 	%r8, %r9, %r7
	.word 0x88c22e94  ! 327: ADDCcc_I	addccc 	%r8, 0x0e94, %r4
	.word 0x86820009  ! 327: ADDcc_R	addcc 	%r8, %r9, %r3
	.word 0x8f3a1009  ! 327: SRAX_R	srax	%r8, %r9, %r7
	.word 0x9f323001  ! 327: SRLX_I	srlx	%r8, 0x0001, %r15
	.word 0x98420009  ! 327: ADDC_R	addc 	%r8, %r9, %r12
	.word 0x9a420009  ! 327: ADDC_R	addc 	%r8, %r9, %r13
	.word 0x9b320009  ! 327: SRL_R	srl 	%r8, %r9, %r13
	.word 0xbf641809  ! 327: MOVcc_R	<illegal instruction>
	.word 0xb2c22b0c  ! 327: ADDCcc_I	addccc 	%r8, 0x0b0c, %r25
	.word 0x40000002  ! 331: CALL	call	disp30_2
	.word 0xaafa2144  ! 331: SDIVcc_I	sdivcc 	%r8, 0x0144, %r21
	.word 0x02c20001  ! 334: BRZ	brz  ,nt	%8,<label_0x20001>
	.word 0x836a29b0  ! 334: SDIVX_I	sdivx	%r8, 0x09b0, %r1
	.word 0x8b323001  ! 335: SRLX_I	srlx	%r8, 0x0001, %r5
	.word 0x973a3001  ! 335: SRAX_I	srax	%r8, 0x0001, %r11
	.word 0x9e0a0009  ! 335: AND_R	and 	%r8, %r9, %r15
	.word 0x840a0009  ! 335: AND_R	and 	%r8, %r9, %r2
	.word 0xaec20009  ! 335: ADDCcc_R	addccc 	%r8, %r9, %r23
	.word 0x868a2ed4  ! 335: ANDcc_I	andcc 	%r8, 0x0ed4, %r3
	.word 0x853a0009  ! 335: SRA_R	sra 	%r8, %r9, %r2
	.word 0x86420009  ! 335: ADDC_R	addc 	%r8, %r9, %r3
	.word 0x883a0009  ! 335: XNOR_R	xnor 	%r8, %r9, %r4
	.word 0x88b20009  ! 335: ORNcc_R	orncc 	%r8, %r9, %r4
	.word 0x26800001  ! 337: BL	bl,a	<label_0x1>
	.word 0x8e7a0009  ! 337: SDIV_R	sdiv 	%r8, %r9, %r7
	.word 0xc8220009  ! 341: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xcc0a0009  ! 341: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0x8afa0009  ! 341: SDIVcc_R	sdivcc 	%r8, %r9, %r5
	.word 0x8e6a28c0  ! 341: UDIVX_I	udivx 	%r8, 0x08c0, %r7
	.word 0x1e800001  ! 346: BVC	bvc  	<label_0x1>
	.word 0x8afa22dc  ! 346: SDIVcc_I	sdivcc 	%r8, 0x02dc, %r5
	.word 0x8a9a0009  ! 347: XORcc_R	xorcc 	%r8, %r9, %r5
	.word 0x83320009  ! 347: SRL_R	srl 	%r8, %r9, %r1
	.word 0x8c0a0009  ! 347: AND_R	and 	%r8, %r9, %r6
	.word 0xbec22f1c  ! 347: ADDCcc_I	addccc 	%r8, 0x0f1c, %r31
	.word 0x82322a3c  ! 347: ORN_I	orn 	%r8, 0x0a3c, %r1
	.word 0x8ec22de8  ! 347: ADDCcc_I	addccc 	%r8, 0x0de8, %r7
	.word 0x829a0009  ! 347: XORcc_R	xorcc 	%r8, %r9, %r1
	.word 0xa0ba2634  ! 347: XNORcc_I	xnorcc 	%r8, 0x0634, %r16
	.word 0x8c122150  ! 347: OR_I	or 	%r8, 0x0150, %r6
	.word 0x8c022184  ! 347: ADD_I	add 	%r8, 0x0184, %r6
	.word 0x83323001  ! 347: SRLX_I	srlx	%r8, 0x0001, %r1
	.word 0x89320009  ! 347: SRL_R	srl 	%r8, %r9, %r4
	.word 0x06c20001  ! 350: BRLZ	brlz  ,nt	%8,<label_0x20001>
	.word 0x886a2784  ! 350: UDIVX_I	udivx 	%r8, 0x0784, %r4
	.word 0x86120009  ! 357: OR_R	or 	%r8, %r9, %r3
	.word 0xa2a20009  ! 357: SUBcc_R	subcc 	%r8, %r9, %r17
	.word 0x853a2001  ! 357: SRA_I	sra 	%r8, 0x0001, %r2
	.word 0x8c2a2140  ! 357: ANDN_I	andn 	%r8, 0x0140, %r6
	.word 0x982a0009  ! 357: ANDN_R	andn 	%r8, %r9, %r12
	.word 0x83782401  ! 357: MOVR_I	move	%r0, 0x9, %r1
	.word 0xb9643801  ! 357: MOVcc_I	<illegal instruction>
	.word 0xab321009  ! 357: SRLX_R	srlx	%r8, %r9, %r21
	.word 0x8aba2a50  ! 357: XNORcc_I	xnorcc 	%r8, 0x0a50, %r5
	.word 0x9a0a0009  ! 357: AND_R	and 	%r8, %r9, %r13
	.word 0xa00a2938  ! 357: AND_I	and 	%r8, 0x0938, %r16
	.word 0xa89229a0  ! 357: ORcc_I	orcc 	%r8, 0x09a0, %r20
	.word 0xa7780409  ! 357: MOVR_R	move	%r0, %r9, %r19
	.word 0x86a22ce8  ! 357: SUBcc_I	subcc 	%r8, 0x0ce8, %r3
	.word 0xc33a0009  ! 362: STDF_R	std	%f1, [%r9, %r8]
	.word 0xfd020009  ! 362: LDF_R	ld	[%r8, %r9], %f30
	.word 0x826a2dd0  ! 362: UDIVX_I	udivx 	%r8, 0x0dd0, %r1
	.word 0xbc6a0009  ! 362: UDIVX_R	udivx 	%r8, %r9, %r30
	.word 0xa2320009  ! 363: ORN_R	orn 	%r8, %r9, %r17
	.word 0x861a0009  ! 363: XOR_R	xor 	%r8, %r9, %r3
	.word 0xae1a23e0  ! 363: XOR_I	xor 	%r8, 0x03e0, %r23
	.word 0x8cba2ba8  ! 363: XNORcc_I	xnorcc 	%r8, 0x0ba8, %r6
	.word 0xb6ba2848  ! 363: XNORcc_I	xnorcc 	%r8, 0x0848, %r27
	.word 0x86b20009  ! 363: ORNcc_R	orncc 	%r8, %r9, %r3
	.word 0x8432280c  ! 363: SUBC_I	orn 	%r8, 0x080c, %r2
	.word 0xa20a2e78  ! 363: AND_I	and 	%r8, 0x0e78, %r17
	.word 0x8eb226e4  ! 363: ORNcc_I	orncc 	%r8, 0x06e4, %r7
	.word 0x993a2001  ! 363: SRA_I	sra 	%r8, 0x0001, %r12
	.word 0xb32a2001  ! 363: SLL_I	sll 	%r8, 0x0001, %r25
	.word 0x00800002  ! 366: BN	bn  	<label_0x2>
	.word 0xa0720009  ! 366: UDIV_R	udiv 	%r8, %r9, %r16
	.word 0x8e2a2e90  ! 368: ANDN_I	andn 	%r8, 0x0e90, %r7
	.word 0x8e922d08  ! 368: ORcc_I	orcc 	%r8, 0x0d08, %r7
	.word 0x8d641809  ! 368: MOVcc_R	<illegal instruction>
	.word 0x82b223a8  ! 368: SUBCcc_I	orncc 	%r8, 0x03a8, %r1
	.word 0xb83a234c  ! 368: XNOR_I	xnor 	%r8, 0x034c, %r28
	.word 0xb8b20009  ! 368: ORNcc_R	orncc 	%r8, %r9, %r28
	.word 0x8f3a1009  ! 368: SRAX_R	srax	%r8, %r9, %r7
	.word 0x89323001  ! 368: SRLX_I	srlx	%r8, 0x0001, %r4
	.word 0x86a22870  ! 368: SUBcc_I	subcc 	%r8, 0x0870, %r3
	.word 0xaa0a2cf4  ! 368: AND_I	and 	%r8, 0x0cf4, %r21
	.word 0xa2c20009  ! 368: ADDCcc_R	addccc 	%r8, %r9, %r17
	.word 0xce220009  ! 375: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xe8120009  ! 375: LDUH_R	lduh	[%r8 + %r9], %r20
	.word 0xe8020009  ! 375: LDUW_R	lduw	[%r8 + %r9], %r20
	.word 0xbaf20009  ! 375: UDIVcc_R	udivcc 	%r8, %r9, %r29
	.word 0x8eba0009  ! 376: XNORcc_R	xnorcc 	%r8, %r9, %r7
	.word 0x84ba2b10  ! 376: XNORcc_I	xnorcc 	%r8, 0x0b10, %r2
	.word 0x892a3001  ! 376: SLLX_I	sllx	%r8, 0x0001, %r4
	.word 0x8b780409  ! 376: MOVR_R	move	%r0, %r9, %r5
	.word 0x8c2a0009  ! 376: ANDN_R	andn 	%r8, %r9, %r6
	.word 0x88a20009  ! 376: SUBcc_R	subcc 	%r8, %r9, %r4
	.word 0x82ba2164  ! 376: XNORcc_I	xnorcc 	%r8, 0x0164, %r1
	.word 0x82222b84  ! 376: SUB_I	sub 	%r8, 0x0b84, %r1
	.word 0xb9323001  ! 376: SRLX_I	srlx	%r8, 0x0001, %r28
	.word 0xbc820009  ! 376: ADDcc_R	addcc 	%r8, %r9, %r30
	.word 0x98c22a44  ! 376: ADDCcc_I	addccc 	%r8, 0x0a44, %r12
	.word 0x8cba2448  ! 376: XNORcc_I	xnorcc 	%r8, 0x0448, %r6
	.word 0x88b224f0  ! 376: SUBCcc_I	orncc 	%r8, 0x04f0, %r4
	.word 0x34800001  ! 378: BG	bg,a	<label_0x1>
	.word 0xab6a2190  ! 378: SDIVX_I	sdivx	%r8, 0x0190, %r21
	.word 0xbd3a1009  ! 379: SRAX_R	srax	%r8, %r9, %r30
	.word 0xa2b20009  ! 379: SUBCcc_R	orncc 	%r8, %r9, %r17
	.word 0x8ac20009  ! 379: ADDCcc_R	addccc 	%r8, %r9, %r5
	.word 0x88822400  ! 379: ADDcc_I	addcc 	%r8, 0x0400, %r4
	.word 0x8c2a2640  ! 379: ANDN_I	andn 	%r8, 0x0640, %r6
	.word 0x8d2a1009  ! 379: SLLX_R	sllx	%r8, %r9, %r6
	.word 0x888a2564  ! 379: ANDcc_I	andcc 	%r8, 0x0564, %r4
	.word 0x9e0a2f84  ! 379: AND_I	and 	%r8, 0x0f84, %r15
	.word 0xa22a0009  ! 379: ANDN_R	andn 	%r8, %r9, %r17
	.word 0x861a270c  ! 379: XOR_I	xor 	%r8, 0x070c, %r3
	.word 0x84aa0009  ! 379: ANDNcc_R	andncc 	%r8, %r9, %r2
	.word 0x8c4226ac  ! 379: ADDC_I	addc 	%r8, 0x06ac, %r6
	.word 0x8aba0009  ! 379: XNORcc_R	xnorcc 	%r8, %r9, %r5
	.word 0x8d641809  ! 379: MOVcc_R	<illegal instruction>
	.word 0x16800001  ! 384: BGE	bge  	<label_0x1>
	.word 0x88720009  ! 384: UDIV_R	udiv 	%r8, %r9, %r4
	.word 0xc7220009  ! 388: STF_R	st	%f3, [%r9, %r8]
	.word 0xc44a0009  ! 388: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xbc7a2198  ! 388: SDIV_I	sdiv 	%r8, 0x0198, %r30
	.word 0x846a29c0  ! 388: UDIVX_I	udivx 	%r8, 0x09c0, %r2
	.word 0x2e800001  ! 391: BVS	bvs,a	<label_0x1>
	.word 0x827a2ba4  ! 391: SDIV_I	sdiv 	%r8, 0x0ba4, %r1
	.word 0xbc020009  ! 398: ADD_R	add 	%r8, %r9, %r30
	.word 0xb72a2001  ! 398: SLL_I	sll 	%r8, 0x0001, %r27
	.word 0xa6322f74  ! 398: SUBC_I	orn 	%r8, 0x0f74, %r19
	.word 0x833a1009  ! 398: SRAX_R	srax	%r8, %r9, %r1
	.word 0x8e3221c4  ! 398: ORN_I	orn 	%r8, 0x01c4, %r7
	.word 0x993a0009  ! 398: SRA_R	sra 	%r8, %r9, %r12
	.word 0x82420009  ! 398: ADDC_R	addc 	%r8, %r9, %r1
	.word 0x8f643801  ! 398: MOVcc_I	<illegal instruction>
	.word 0x9c0a0009  ! 398: AND_R	and 	%r8, %r9, %r14
	.word 0x84ba2ca4  ! 398: XNORcc_I	xnorcc 	%r8, 0x0ca4, %r2
	.word 0x86222aa8  ! 398: SUB_I	sub 	%r8, 0x0aa8, %r3
	.word 0x8d320009  ! 398: SRL_R	srl 	%r8, %r9, %r6
	.word 0x893a2001  ! 399: SRA_I	sra 	%r8, 0x0001, %r4
	.word 0x892a2001  ! 399: SLL_I	sll 	%r8, 0x0001, %r4
	.word 0x86820009  ! 399: ADDcc_R	addcc 	%r8, %r9, %r3
	.word 0x8c922020  ! 399: ORcc_I	orcc 	%r8, 0x0020, %r6
	.word 0x8f2a3001  ! 399: SLLX_I	sllx	%r8, 0x0001, %r7
	.word 0x82320009  ! 399: ORN_R	orn 	%r8, %r9, %r1
	.word 0x863a2e2c  ! 399: XNOR_I	xnor 	%r8, 0x0e2c, %r3
	.word 0x88b20009  ! 399: SUBCcc_R	orncc 	%r8, %r9, %r4
	.word 0xbaa226d8  ! 399: SUBcc_I	subcc 	%r8, 0x06d8, %r29
	.word 0x84420009  ! 399: ADDC_R	addc 	%r8, %r9, %r2
	.word 0xa52a3001  ! 399: SLLX_I	sllx	%r8, 0x0001, %r18
	.word 0xb2322e2c  ! 399: SUBC_I	orn 	%r8, 0x0e2c, %r25
	.word 0xa53a3001  ! 399: SRAX_I	srax	%r8, 0x0001, %r18
	.word 0x8e9a25c4  ! 402: XORcc_I	xorcc 	%r8, 0x05c4, %r7
	.word 0x8a8a0009  ! 402: ANDcc_R	andcc 	%r8, %r9, %r5
	.word 0xad3a3001  ! 402: SRAX_I	srax	%r8, 0x0001, %r22
	.word 0x87322001  ! 402: SRL_I	srl 	%r8, 0x0001, %r3
	.word 0x8b3a3001  ! 402: SRAX_I	srax	%r8, 0x0001, %r5
	.word 0x94022144  ! 402: ADD_I	add 	%r8, 0x0144, %r10
	.word 0x8eb20009  ! 402: SUBCcc_R	orncc 	%r8, %r9, %r7
	.word 0xbd3a3001  ! 402: SRAX_I	srax	%r8, 0x0001, %r30
	.word 0xa8aa0009  ! 402: ANDNcc_R	andncc 	%r8, %r9, %r20
	.word 0x8e222d04  ! 402: SUB_I	sub 	%r8, 0x0d04, %r7
	.word 0xc4720009  ! 406: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc51a0009  ! 406: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0x8e7a2360  ! 406: SDIV_I	sdiv 	%r8, 0x0360, %r7
	.word 0x896a2384  ! 406: SDIVX_I	sdivx	%r8, 0x0384, %r4
	.word 0xcf3a0009  ! 410: STDF_R	std	%f7, [%r9, %r8]
	.word 0xcd1a0009  ! 410: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xc25a2d88  ! 410: LDX_I	ldx	[%r8 + 0x0d88], %r1
	.word 0x86fa2b04  ! 410: SDIVcc_I	sdivcc 	%r8, 0x0b04, %r3
	.word 0x9ab20009  ! 411: SUBCcc_R	orncc 	%r8, %r9, %r13
	.word 0x8c2a2a78  ! 411: ANDN_I	andn 	%r8, 0x0a78, %r6
	.word 0x89320009  ! 411: SRL_R	srl 	%r8, %r9, %r4
	.word 0xb62a2c70  ! 411: ANDN_I	andn 	%r8, 0x0c70, %r27
	.word 0xb8322c54  ! 411: ORN_I	orn 	%r8, 0x0c54, %r28
	.word 0x8d2a2001  ! 411: SLL_I	sll 	%r8, 0x0001, %r6
	.word 0x96922094  ! 411: ORcc_I	orcc 	%r8, 0x0094, %r11
	.word 0x8eb22d18  ! 411: SUBCcc_I	orncc 	%r8, 0x0d18, %r7
	.word 0xa12a2001  ! 411: SLL_I	sll 	%r8, 0x0001, %r16
	.word 0x88320009  ! 411: SUBC_R	orn 	%r8, %r9, %r4
	.word 0x99780409  ! 411: MOVR_R	move	%r0, %r9, %r12
	.word 0xb0a22878  ! 411: SUBcc_I	subcc 	%r8, 0x0878, %r24
	.word 0xc53a0009  ! 415: STDF_R	std	%f2, [%r9, %r8]
	.word 0xda0a0009  ! 415: LDUB_R	ldub	[%r8 + %r9], %r13
	.word 0xac720009  ! 415: UDIV_R	udiv 	%r8, %r9, %r22
	.word 0x846a0009  ! 415: UDIVX_R	udivx 	%r8, %r9, %r2
	.word 0xa88a2d38  ! 416: ANDcc_I	andcc 	%r8, 0x0d38, %r20
	.word 0x86a22030  ! 416: SUBcc_I	subcc 	%r8, 0x0030, %r3
	.word 0xa4920009  ! 416: ORcc_R	orcc 	%r8, %r9, %r18
	.word 0xa2c20009  ! 416: ADDCcc_R	addccc 	%r8, %r9, %r17
	.word 0x9b782401  ! 416: MOVR_I	move	%r0, 0x9, %r13
	.word 0x9f322001  ! 416: SRL_I	srl 	%r8, 0x0001, %r15
	.word 0xab321009  ! 416: SRLX_R	srlx	%r8, %r9, %r21
	.word 0x952a1009  ! 416: SLLX_R	sllx	%r8, %r9, %r10
	.word 0x869a0009  ! 416: XORcc_R	xorcc 	%r8, %r9, %r3
	.word 0xa02a0009  ! 416: ANDN_R	andn 	%r8, %r9, %r16
	.word 0xc2320009  ! 420: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc3020009  ! 420: LDF_R	ld	[%r8, %r9], %f1
	.word 0xdc4a240c  ! 420: LDSB_I	ldsb	[%r8 + 0x040c], %r14
	.word 0x8e7227f0  ! 420: UDIV_I	udiv 	%r8, 0x07f0, %r7
	.word 0x8f2a2001  ! 421: SLL_I	sll 	%r8, 0x0001, %r7
	.word 0x881a2e3c  ! 421: XOR_I	xor 	%r8, 0x0e3c, %r4
	.word 0xbf782401  ! 421: MOVR_I	move	%r0, 0xfffffe3c, %r31
	.word 0x893a3001  ! 421: SRAX_I	srax	%r8, 0x0001, %r4
	.word 0x8aba2f24  ! 421: XNORcc_I	xnorcc 	%r8, 0x0f24, %r5
	.word 0x8f322001  ! 421: SRL_I	srl 	%r8, 0x0001, %r7
	.word 0x873a2001  ! 421: SRA_I	sra 	%r8, 0x0001, %r3
	.word 0x85320009  ! 421: SRL_R	srl 	%r8, %r9, %r2
	.word 0xa6322250  ! 421: SUBC_I	orn 	%r8, 0x0250, %r19
	.word 0x99780409  ! 421: MOVR_R	move	%r0, %r9, %r12
	.word 0x892a1009  ! 421: SLLX_R	sllx	%r8, %r9, %r4
	.word 0x40000001  ! 423: CALL	call	disp30_1
	.word 0xbcf22f34  ! 423: UDIVcc_I	udivcc 	%r8, 0x0f34, %r30
	.word 0xdf3a0009  ! 427: STDF_R	std	%f15, [%r9, %r8]
	.word 0xd80a0009  ! 427: LDUB_R	ldub	[%r8 + %r9], %r12
	.word 0xd85a2118  ! 427: LDX_I	ldx	[%r8 + 0x0118], %r12
	.word 0x84fa2e68  ! 427: SDIVcc_I	sdivcc 	%r8, 0x0e68, %r2
	.word 0x88b20009  ! 429: SUBCcc_R	orncc 	%r8, %r9, %r4
	.word 0x8e0a0009  ! 429: AND_R	and 	%r8, %r9, %r7
	.word 0xae922cc8  ! 429: ORcc_I	orcc 	%r8, 0x0cc8, %r23
	.word 0x86220009  ! 429: SUB_R	sub 	%r8, %r9, %r3
	.word 0x8f780409  ! 429: MOVR_R	move	%r0, %r9, %r7
	.word 0xb83a20a4  ! 429: XNOR_I	xnor 	%r8, 0x00a4, %r28
	.word 0x84022014  ! 429: ADD_I	add 	%r8, 0x0014, %r2
	.word 0xbc2226c4  ! 429: SUB_I	sub 	%r8, 0x06c4, %r30
	.word 0x84822bdc  ! 429: ADDcc_I	addcc 	%r8, 0x0bdc, %r2
	.word 0xbd321009  ! 429: SRLX_R	srlx	%r8, %r9, %r30
	.word 0xb82a0009  ! 429: ANDN_R	andn 	%r8, %r9, %r28
	.word 0x87323001  ! 429: SRLX_I	srlx	%r8, 0x0001, %r3
	.word 0x85782401  ! 429: MOVR_I	move	%r0, 0x1, %r2
	.word 0x8a320009  ! 429: ORN_R	orn 	%r8, %r9, %r5
	.word 0x8a0a0009  ! 437: AND_R	and 	%r8, %r9, %r5
	.word 0xb00a0009  ! 437: AND_R	and 	%r8, %r9, %r24
	.word 0x83643801  ! 437: MOVcc_I	<illegal instruction>
	.word 0x88420009  ! 437: ADDC_R	addc 	%r8, %r9, %r4
	.word 0x8f780409  ! 437: MOVR_R	move	%r0, %r9, %r7
	.word 0x86820009  ! 437: ADDcc_R	addcc 	%r8, %r9, %r3
	.word 0x82320009  ! 437: SUBC_R	orn 	%r8, %r9, %r1
	.word 0x84b20009  ! 437: ORNcc_R	orncc 	%r8, %r9, %r2
	.word 0x893a0009  ! 437: SRA_R	sra 	%r8, %r9, %r4
	.word 0x86120009  ! 437: OR_R	or 	%r8, %r9, %r3
	.word 0x8e22281c  ! 437: SUB_I	sub 	%r8, 0x081c, %r7
	.word 0x00800002  ! 440: BN	bn  	<label_0x2>
	.word 0x886a0009  ! 440: UDIVX_R	udivx 	%r8, %r9, %r4
	.word 0x8e0a21fc  ! 444: AND_I	and 	%r8, 0x01fc, %r7
	.word 0x8a922dfc  ! 444: ORcc_I	orcc 	%r8, 0x0dfc, %r5
	.word 0x873a2001  ! 444: SRA_I	sra 	%r8, 0x0001, %r3
	.word 0x8ac20009  ! 444: ADDCcc_R	addccc 	%r8, %r9, %r5
	.word 0x89322001  ! 444: SRL_I	srl 	%r8, 0x0001, %r4
	.word 0x8c4222bc  ! 444: ADDC_I	addc 	%r8, 0x02bc, %r6
	.word 0xb73a2001  ! 444: SRA_I	sra 	%r8, 0x0001, %r27
	.word 0x99643801  ! 444: MOVcc_I	<illegal instruction>
	.word 0x85323001  ! 444: SRLX_I	srlx	%r8, 0x0001, %r2
	.word 0x8ab221b0  ! 444: ORNcc_I	orncc 	%r8, 0x01b0, %r5
	.word 0xa0b22950  ! 444: SUBCcc_I	orncc 	%r8, 0x0950, %r16
	.word 0xa02a0009  ! 444: ANDN_R	andn 	%r8, %r9, %r16
	.word 0x82b20009  ! 444: SUBCcc_R	orncc 	%r8, %r9, %r1
	.word 0x88c22aa8  ! 444: ADDCcc_I	addccc 	%r8, 0x0aa8, %r4
	.word 0xbb3a2001  ! 445: SRA_I	sra 	%r8, 0x0001, %r29
	.word 0x8f641809  ! 445: MOVcc_R	<illegal instruction>
	.word 0x9b3a2001  ! 445: SRA_I	sra 	%r8, 0x0001, %r13
	.word 0xb60a2790  ! 445: AND_I	and 	%r8, 0x0790, %r27
	.word 0xb80a0009  ! 445: AND_R	and 	%r8, %r9, %r28
	.word 0xa48a24ac  ! 445: ANDcc_I	andcc 	%r8, 0x04ac, %r18
	.word 0x87780409  ! 445: MOVR_R	move	%r0, %r9, %r3
	.word 0x82222e38  ! 445: SUB_I	sub 	%r8, 0x0e38, %r1
	.word 0x89320009  ! 445: SRL_R	srl 	%r8, %r9, %r4
	.word 0xbd643801  ! 445: MOVcc_I	<illegal instruction>
	.word 0x8e0a2a34  ! 445: AND_I	and 	%r8, 0x0a34, %r7
	.word 0xb9643801  ! 445: MOVcc_I	<illegal instruction>
	.word 0x2e800001  ! 447: BVS	bvs,a	<label_0x1>
	.word 0x84720009  ! 447: UDIV_R	udiv 	%r8, %r9, %r2
	.word 0x04ca0001  ! 450: BRLEZ	brlez  ,pt	%8,<label_0xa0001>
	.word 0x846a0009  ! 450: UDIVX_R	udivx 	%r8, %r9, %r2
	.word 0x8b3a3001  ! 452: SRAX_I	srax	%r8, 0x0001, %r5
	.word 0x86120009  ! 452: OR_R	or 	%r8, %r9, %r3
	.word 0xa7320009  ! 452: SRL_R	srl 	%r8, %r9, %r19
	.word 0xb2a20009  ! 452: SUBcc_R	subcc 	%r8, %r9, %r25
	.word 0xa88a2a38  ! 452: ANDcc_I	andcc 	%r8, 0x0a38, %r20
	.word 0x8ea22a2c  ! 452: SUBcc_I	subcc 	%r8, 0x0a2c, %r7
	.word 0xbaa20009  ! 452: SUBcc_R	subcc 	%r8, %r9, %r29
	.word 0xa6920009  ! 452: ORcc_R	orcc 	%r8, %r9, %r19
	.word 0xba1a22ac  ! 452: XOR_I	xor 	%r8, 0x02ac, %r29
	.word 0x82922c58  ! 452: ORcc_I	orcc 	%r8, 0x0c58, %r1
	.word 0x833a3001  ! 452: SRAX_I	srax	%r8, 0x0001, %r1
	.word 0x873a0009  ! 452: SRA_R	sra 	%r8, %r9, %r3
	.word 0xa02a0009  ! 452: ANDN_R	andn 	%r8, %r9, %r16
	.word 0xa08a0009  ! 452: ANDcc_R	andcc 	%r8, %r9, %r16
	.word 0x8b2a0009  ! 452: SLL_R	sll 	%r8, %r9, %r5
	.word 0x32800001  ! 454: BNE	bne,a	<label_0x1>
	.word 0x867a2f74  ! 454: SDIV_I	sdiv 	%r8, 0x0f74, %r3
	.word 0xa88a0009  ! 455: ANDcc_R	andcc 	%r8, %r9, %r20
	.word 0x8a1a0009  ! 455: XOR_R	xor 	%r8, %r9, %r5
	.word 0xaa4221e8  ! 455: ADDC_I	addc 	%r8, 0x01e8, %r21
	.word 0x8cc20009  ! 455: ADDCcc_R	addccc 	%r8, %r9, %r6
	.word 0x87321009  ! 455: SRLX_R	srlx	%r8, %r9, %r3
	.word 0x88c20009  ! 455: ADDCcc_R	addccc 	%r8, %r9, %r4
	.word 0x82920009  ! 455: ORcc_R	orcc 	%r8, %r9, %r1
	.word 0x832a0009  ! 455: SLL_R	sll 	%r8, %r9, %r1
	.word 0x8c1a0009  ! 455: XOR_R	xor 	%r8, %r9, %r6
	.word 0x9e122424  ! 455: OR_I	or 	%r8, 0x0424, %r15
	.word 0x8c0222fc  ! 458: ADD_I	add 	%r8, 0x02fc, %r6
	.word 0x853a0009  ! 458: SRA_R	sra 	%r8, %r9, %r2
	.word 0x862a21d0  ! 458: ANDN_I	andn 	%r8, 0x01d0, %r3
	.word 0x8c1a0009  ! 458: XOR_R	xor 	%r8, %r9, %r6
	.word 0x953a3001  ! 458: SRAX_I	srax	%r8, 0x0001, %r10
	.word 0x8f321009  ! 458: SRLX_R	srlx	%r8, %r9, %r7
	.word 0x888a0009  ! 458: ANDcc_R	andcc 	%r8, %r9, %r4
	.word 0x863a2c5c  ! 458: XNOR_I	xnor 	%r8, 0x0c5c, %r3
	.word 0x9e120009  ! 458: OR_R	or 	%r8, %r9, %r15
	.word 0xba822c88  ! 458: ADDcc_I	addcc 	%r8, 0x0c88, %r29
	.word 0xb0120009  ! 458: OR_R	or 	%r8, %r9, %r24
	.word 0x87323001  ! 458: SRLX_I	srlx	%r8, 0x0001, %r3
	.word 0xb4a220f4  ! 458: SUBcc_I	subcc 	%r8, 0x00f4, %r26
	.word 0x8aa22a6c  ! 458: SUBcc_I	subcc 	%r8, 0x0a6c, %r5
	.word 0xb20a2090  ! 460: AND_I	and 	%r8, 0x0090, %r25
	.word 0x963a0009  ! 460: XNOR_R	xnor 	%r8, %r9, %r11
	.word 0x873a2001  ! 460: SRA_I	sra 	%r8, 0x0001, %r3
	.word 0x8ab20009  ! 460: ORNcc_R	orncc 	%r8, %r9, %r5
	.word 0x82320009  ! 460: ORN_R	orn 	%r8, %r9, %r1
	.word 0x88120009  ! 460: OR_R	or 	%r8, %r9, %r4
	.word 0x943a0009  ! 460: XNOR_R	xnor 	%r8, %r9, %r10
	.word 0x84120009  ! 460: OR_R	or 	%r8, %r9, %r2
	.word 0xb68a27b0  ! 460: ANDcc_I	andcc 	%r8, 0x07b0, %r27
	.word 0x84220009  ! 460: SUB_R	sub 	%r8, %r9, %r2
	.word 0x828a2268  ! 460: ANDcc_I	andcc 	%r8, 0x0268, %r1
	.word 0xa8820009  ! 460: ADDcc_R	addcc 	%r8, %r9, %r20
	.word 0xc82a0009  ! 469: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xd80a0009  ! 469: LDUB_R	ldub	[%r8 + %r9], %r12
	.word 0x8eb22270  ! 469: SUBCcc_I	orncc 	%r8, 0x0270, %r7
	.word 0x827225b8  ! 469: UDIV_I	udiv 	%r8, 0x05b8, %r1
	.word 0xc42a0009  ! 475: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xe91a0009  ! 475: LDDF_R	ldd	[%r8, %r9], %f20
	.word 0xe0420009  ! 475: LDSW_R	ldsw	[%r8 + %r9], %r16
	.word 0x94fa2d08  ! 475: SDIVcc_I	sdivcc 	%r8, 0x0d08, %r10
	.word 0x34800001  ! 478: BG	bg,a	<label_0x1>
	.word 0xa2fa2428  ! 478: SDIVcc_I	sdivcc 	%r8, 0x0428, %r17
	.word 0x1a800001  ! 481: BCC	bcc  	<label_0x1>
	.word 0x8cf229a0  ! 481: UDIVcc_I	udivcc 	%r8, 0x09a0, %r6
	.word 0x8caa247c  ! 484: ANDNcc_I	andncc 	%r8, 0x047c, %r6
	.word 0x8c3a0009  ! 484: XNOR_R	xnor 	%r8, %r9, %r6
	.word 0xb7320009  ! 484: SRL_R	srl 	%r8, %r9, %r27
	.word 0x86a22968  ! 484: SUBcc_I	subcc 	%r8, 0x0968, %r3
	.word 0x8e020009  ! 484: ADD_R	add 	%r8, %r9, %r7
	.word 0x8b2a1009  ! 484: SLLX_R	sllx	%r8, %r9, %r5
	.word 0x892a0009  ! 484: SLL_R	sll 	%r8, %r9, %r4
	.word 0x8aa2297c  ! 484: SUBcc_I	subcc 	%r8, 0x097c, %r5
	.word 0xa7782401  ! 484: MOVR_I	move	%r0, 0x97c, %r19
	.word 0x862a0009  ! 484: ANDN_R	andn 	%r8, %r9, %r3
	.word 0xbd2a1009  ! 484: SLLX_R	sllx	%r8, %r9, %r30
	.word 0x8b323001  ! 484: SRLX_I	srlx	%r8, 0x0001, %r5
	.word 0x852a0009  ! 484: SLL_R	sll 	%r8, %r9, %r2
	.word 0x2ac20001  ! 487: BRNZ	brnz,a,nt	%8,<label_0x20001>
	.word 0xb8fa2c88  ! 487: SDIVcc_I	sdivcc 	%r8, 0x0c88, %r28
	.word 0xe42a0009  ! 493: STB_R	stb	%r18, [%r8 + %r9]
	.word 0xc81a0009  ! 493: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xc642220c  ! 493: LDSW_I	ldsw	[%r8 + 0x020c], %r3
	.word 0x8e7a2988  ! 493: SDIV_I	sdiv 	%r8, 0x0988, %r7
	.word 0xca2a0009  ! 499: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xde420009  ! 499: LDSW_R	ldsw	[%r8 + %r9], %r15
	.word 0x8f780409  ! 499: MOVR_R	move	%r0, %r9, %r7
	.word 0x8c72226c  ! 499: UDIV_I	udiv 	%r8, 0x026c, %r6
	.word 0xeb220009  ! 507: STF_R	st	%f21, [%r9, %r8]
	.word 0xc20a0009  ! 507: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0x98aa0009  ! 507: ANDNcc_R	andncc 	%r8, %r9, %r12
	.word 0x88720009  ! 507: UDIV_R	udiv 	%r8, %r9, %r4
	.word 0xc2220009  ! 513: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc60a0009  ! 513: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0x8b6a0009  ! 513: SDIVX_R	sdivx	%r8, %r9, %r5
	.word 0xa27a20d8  ! 513: SDIV_I	sdiv 	%r8, 0x00d8, %r17
	.word 0xc8720009  ! 517: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc8020009  ! 517: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0x88f22508  ! 517: UDIVcc_I	udivcc 	%r8, 0x0508, %r4
	.word 0x88720009  ! 517: UDIV_R	udiv 	%r8, %r9, %r4
	.word 0x40000001  ! 520: CALL	call	disp30_1
	.word 0x94720009  ! 520: UDIV_R	udiv 	%r8, %r9, %r10
	.word 0x872a3001  ! 521: SLLX_I	sllx	%r8, 0x0001, %r3
	.word 0x9b782401  ! 521: MOVR_I	move	%r0, 0x1, %r13
	.word 0xa9320009  ! 521: SRL_R	srl 	%r8, %r9, %r20
	.word 0xb09a2ed4  ! 521: XORcc_I	xorcc 	%r8, 0x0ed4, %r24
	.word 0x82820009  ! 521: ADDcc_R	addcc 	%r8, %r9, %r1
	.word 0x84320009  ! 521: ORN_R	orn 	%r8, %r9, %r2
	.word 0x88c22400  ! 521: ADDCcc_I	addccc 	%r8, 0x0400, %r4
	.word 0x840a23c4  ! 521: AND_I	and 	%r8, 0x03c4, %r2
	.word 0xb22220c8  ! 521: SUB_I	sub 	%r8, 0x00c8, %r25
	.word 0xb21a2dc0  ! 521: XOR_I	xor 	%r8, 0x0dc0, %r25
	.word 0xaf3a1009  ! 521: SRAX_R	srax	%r8, %r9, %r23
	.word 0x1e800002  ! 529: BVC	bvc  	<label_0x2>
	.word 0x8a7a2460  ! 529: SDIV_I	sdiv 	%r8, 0x0460, %r5
	.word 0x22800001  ! 531: BE	be,a	<label_0x1>
	.word 0x866a0009  ! 531: UDIVX_R	udivx 	%r8, %r9, %r3
	.word 0xf4320009  ! 535: STH_R	sth	%r26, [%r8 + %r9]
	.word 0xcd020009  ! 535: LDF_R	ld	[%r8, %r9], %f6
	.word 0x887a2b7c  ! 535: SDIV_I	sdiv 	%r8, 0x0b7c, %r4
	.word 0xa56a0009  ! 535: SDIVX_R	sdivx	%r8, %r9, %r18
	.word 0xe1220009  ! 539: STF_R	st	%f16, [%r9, %r8]
	.word 0xce4a0009  ! 539: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0x8cfa28fc  ! 539: SDIVcc_I	sdivcc 	%r8, 0x08fc, %r6
	.word 0x887a0009  ! 539: SDIV_R	sdiv 	%r8, %r9, %r4
	.word 0xca2a0009  ! 543: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xcd1a0009  ! 543: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0x9a720009  ! 543: UDIV_R	udiv 	%r8, %r9, %r13
	.word 0xbefa0009  ! 543: SDIVcc_R	sdivcc 	%r8, %r9, %r31
	.word 0xed220009  ! 548: STF_R	st	%f22, [%r9, %r8]
	.word 0xc4420009  ! 548: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0x826a0009  ! 548: UDIVX_R	udivx 	%r8, %r9, %r1
	.word 0x8c7a0009  ! 548: SDIV_R	sdiv 	%r8, %r9, %r6
	.word 0x32800001  ! 550: BNE	bne,a	<label_0x1>
	.word 0xa67a2dcc  ! 550: SDIV_I	sdiv 	%r8, 0x0dcc, %r19
	.word 0x40000001  ! 554: CALL	call	disp30_1
	.word 0x8efa0009  ! 554: SDIVcc_R	sdivcc 	%r8, %r9, %r7
	.word 0x0c800002  ! 557: BNEG	bneg  	<label_0x2>
	.word 0x9ef220b0  ! 557: UDIVcc_I	udivcc 	%r8, 0x00b0, %r15
	.word 0xc93a0009  ! 561: STDF_R	std	%f4, [%r9, %r8]
	.word 0xcc0a0009  ! 561: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0x94f22054  ! 561: UDIVcc_I	udivcc 	%r8, 0x0054, %r10
	.word 0xacfa23b8  ! 561: SDIVcc_I	sdivcc 	%r8, 0x03b8, %r22
	.word 0x8d3a1009  ! 562: SRAX_R	srax	%r8, %r9, %r6
	.word 0x83322001  ! 562: SRL_I	srl 	%r8, 0x0001, %r1
	.word 0xa5782401  ! 562: MOVR_I	move	%r0, 0x1, %r18
	.word 0xa53a3001  ! 562: SRAX_I	srax	%r8, 0x0001, %r18
	.word 0xbc1a23c0  ! 562: XOR_I	xor 	%r8, 0x03c0, %r30
	.word 0x85321009  ! 562: SRLX_R	srlx	%r8, %r9, %r2
	.word 0xbd3a3001  ! 562: SRAX_I	srax	%r8, 0x0001, %r30
	.word 0x8ec20009  ! 562: ADDCcc_R	addccc 	%r8, %r9, %r7
	.word 0x86ba0009  ! 562: XNORcc_R	xnorcc 	%r8, %r9, %r3
	.word 0xae122fe0  ! 562: OR_I	or 	%r8, 0x0fe0, %r23
	.word 0x2cc20001  ! 568: BRGZ	brgz,a,nt	%8,<label_0x20001>
	.word 0x84720009  ! 568: UDIV_R	udiv 	%r8, %r9, %r2
	.word 0x02800001  ! 572: BE	be  	<label_0x1>
	.word 0x876a0009  ! 572: SDIVX_R	sdivx	%r8, %r9, %r3
	.word 0x888a293c  ! 574: ANDcc_I	andcc 	%r8, 0x093c, %r4
	.word 0x843a0009  ! 574: XNOR_R	xnor 	%r8, %r9, %r2
	.word 0x86220009  ! 574: SUB_R	sub 	%r8, %r9, %r3
	.word 0xac220009  ! 574: SUB_R	sub 	%r8, %r9, %r22
	.word 0x9aaa0009  ! 574: ANDNcc_R	andncc 	%r8, %r9, %r13
	.word 0xaea20009  ! 574: SUBcc_R	subcc 	%r8, %r9, %r23
	.word 0x8b322001  ! 574: SRL_I	srl 	%r8, 0x0001, %r5
	.word 0x94c225cc  ! 574: ADDCcc_I	addccc 	%r8, 0x05cc, %r10
	.word 0xb21a26ec  ! 574: XOR_I	xor 	%r8, 0x06ec, %r25
	.word 0xa53a3001  ! 574: SRAX_I	srax	%r8, 0x0001, %r18
	.word 0x8c022160  ! 574: ADD_I	add 	%r8, 0x0160, %r6
	.word 0x9ab223b4  ! 574: SUBCcc_I	orncc 	%r8, 0x03b4, %r13
	.word 0x88220009  ! 574: SUB_R	sub 	%r8, %r9, %r4
	.word 0x8e3a23d0  ! 574: XNOR_I	xnor 	%r8, 0x03d0, %r7
	.word 0xcd220009  ! 578: STF_R	st	%f6, [%r9, %r8]
	.word 0xcd1a0009  ! 578: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0x847a0009  ! 578: SDIV_R	sdiv 	%r8, %r9, %r2
	.word 0x847a22e0  ! 578: SDIV_I	sdiv 	%r8, 0x02e0, %r2
	.word 0x87641809  ! 582: MOVcc_R	<illegal instruction>
	.word 0xaa320009  ! 582: SUBC_R	orn 	%r8, %r9, %r21
	.word 0x83321009  ! 582: SRLX_R	srlx	%r8, %r9, %r1
	.word 0x863a29d4  ! 582: XNOR_I	xnor 	%r8, 0x09d4, %r3
	.word 0xb0c225a0  ! 582: ADDCcc_I	addccc 	%r8, 0x05a0, %r24
	.word 0x8ca22c68  ! 582: SUBcc_I	subcc 	%r8, 0x0c68, %r6
	.word 0xa0c20009  ! 582: ADDCcc_R	addccc 	%r8, %r9, %r16
	.word 0x88ba0009  ! 582: XNORcc_R	xnorcc 	%r8, %r9, %r4
	.word 0x8c420009  ! 582: ADDC_R	addc 	%r8, %r9, %r6
	.word 0xb32a3001  ! 582: SLLX_I	sllx	%r8, 0x0001, %r25
	.word 0x8a1a0009  ! 582: XOR_R	xor 	%r8, %r9, %r5
	.word 0xb62a2a24  ! 582: ANDN_I	andn 	%r8, 0x0a24, %r27
	.word 0x8e922024  ! 582: ORcc_I	orcc 	%r8, 0x0024, %r7
	.word 0xbb3a0009  ! 582: SRA_R	sra 	%r8, %r9, %r29
	.word 0x86320009  ! 582: ORN_R	orn 	%r8, %r9, %r3
	.word 0x883a2868  ! 585: XNOR_I	xnor 	%r8, 0x0868, %r4
	.word 0x86120009  ! 585: OR_R	or 	%r8, %r9, %r3
	.word 0x8caa2d94  ! 585: ANDNcc_I	andncc 	%r8, 0x0d94, %r6
	.word 0x840a0009  ! 585: AND_R	and 	%r8, %r9, %r2
	.word 0x8e1a0009  ! 585: XOR_R	xor 	%r8, %r9, %r7
	.word 0x8c322b74  ! 585: SUBC_I	orn 	%r8, 0x0b74, %r6
	.word 0x8f782401  ! 585: MOVR_I	move	%r0, 0xffffff74, %r7
	.word 0x85322001  ! 585: SRL_I	srl 	%r8, 0x0001, %r2
	.word 0x823223e4  ! 585: ORN_I	orn 	%r8, 0x03e4, %r1
	.word 0x88120009  ! 585: OR_R	or 	%r8, %r9, %r4
	.word 0xa41a0009  ! 585: XOR_R	xor 	%r8, %r9, %r18
	.word 0x88122e64  ! 585: OR_I	or 	%r8, 0x0e64, %r4
	.word 0x8e1a247c  ! 585: XOR_I	xor 	%r8, 0x047c, %r7
	.word 0xa4822064  ! 585: ADDcc_I	addcc 	%r8, 0x0064, %r18
	.word 0x88b22c08  ! 588: SUBCcc_I	orncc 	%r8, 0x0c08, %r4
	.word 0x89321009  ! 588: SRLX_R	srlx	%r8, %r9, %r4
	.word 0x94322250  ! 588: SUBC_I	orn 	%r8, 0x0250, %r10
	.word 0x99641809  ! 588: MOVcc_R	<illegal instruction>
	.word 0x84c22500  ! 588: ADDCcc_I	addccc 	%r8, 0x0500, %r2
	.word 0x99643801  ! 588: MOVcc_I	<illegal instruction>
	.word 0x8a9a0009  ! 588: XORcc_R	xorcc 	%r8, %r9, %r5
	.word 0xaec20009  ! 588: ADDCcc_R	addccc 	%r8, %r9, %r23
	.word 0x87782401  ! 588: MOVR_I	move	%r0, 0x9, %r3
	.word 0x8b2a0009  ! 588: SLL_R	sll 	%r8, %r9, %r5
	.word 0x9aa222a8  ! 588: SUBcc_I	subcc 	%r8, 0x02a8, %r13
	.word 0x8ab20009  ! 590: ORNcc_R	orncc 	%r8, %r9, %r5
	.word 0x8e1220f4  ! 590: OR_I	or 	%r8, 0x00f4, %r7
	.word 0x8ac22710  ! 590: ADDCcc_I	addccc 	%r8, 0x0710, %r5
	.word 0x880a2e38  ! 590: AND_I	and 	%r8, 0x0e38, %r4
	.word 0xb03a21f0  ! 590: XNOR_I	xnor 	%r8, 0x01f0, %r24
	.word 0x83321009  ! 590: SRLX_R	srlx	%r8, %r9, %r1
	.word 0xb08a0009  ! 590: ANDcc_R	andcc 	%r8, %r9, %r24
	.word 0x8e8225e0  ! 590: ADDcc_I	addcc 	%r8, 0x05e0, %r7
	.word 0xb5782401  ! 590: MOVR_I	move	%r0, 0x5e0, %r26
	.word 0xac3225cc  ! 590: SUBC_I	orn 	%r8, 0x05cc, %r22
	.word 0x85320009  ! 590: SRL_R	srl 	%r8, %r9, %r2
	.word 0x889a0009  ! 591: XORcc_R	xorcc 	%r8, %r9, %r4
	.word 0x8b323001  ! 591: SRLX_I	srlx	%r8, 0x0001, %r5
	.word 0x84b20009  ! 591: SUBCcc_R	orncc 	%r8, %r9, %r2
	.word 0xacba2468  ! 591: XNORcc_I	xnorcc 	%r8, 0x0468, %r22
	.word 0x84b221b8  ! 591: ORNcc_I	orncc 	%r8, 0x01b8, %r2
	.word 0x853a1009  ! 591: SRAX_R	srax	%r8, %r9, %r2
	.word 0xa2120009  ! 591: OR_R	or 	%r8, %r9, %r17
	.word 0x84222f50  ! 591: SUB_I	sub 	%r8, 0x0f50, %r2
	.word 0xac2a2394  ! 591: ANDN_I	andn 	%r8, 0x0394, %r22
	.word 0x8a8a2bfc  ! 591: ANDcc_I	andcc 	%r8, 0x0bfc, %r5
	.word 0x8c020009  ! 591: ADD_R	add 	%r8, %r9, %r6
	.word 0xcc320009  ! 598: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xdc020009  ! 598: LDUW_R	lduw	[%r8 + %r9], %r14
	.word 0xa0b22670  ! 598: SUBCcc_I	orncc 	%r8, 0x0670, %r16
	.word 0x856a2ee8  ! 598: SDIVX_I	sdivx	%r8, 0x0ee8, %r2
	.word 0x86a20009  ! 599: SUBcc_R	subcc 	%r8, %r9, %r3
	.word 0x8f641809  ! 599: MOVcc_R	<illegal instruction>
	.word 0xb9320009  ! 599: SRL_R	srl 	%r8, %r9, %r28
	.word 0x85643801  ! 599: MOVcc_I	<illegal instruction>
	.word 0x962a2028  ! 599: ANDN_I	andn 	%r8, 0x0028, %r11
	.word 0x8a1a2b18  ! 599: XOR_I	xor 	%r8, 0x0b18, %r5
	.word 0x889a2ec8  ! 599: XORcc_I	xorcc 	%r8, 0x0ec8, %r4
	.word 0x881a0009  ! 599: XOR_R	xor 	%r8, %r9, %r4
	.word 0x9d321009  ! 599: SRLX_R	srlx	%r8, %r9, %r14
	.word 0xbe220009  ! 599: SUB_R	sub 	%r8, %r9, %r31
	.word 0x9e022128  ! 599: ADD_I	add 	%r8, 0x0128, %r15
	.word 0x8f321009  ! 599: SRLX_R	srlx	%r8, %r9, %r7
	.word 0x86322154  ! 599: SUBC_I	orn 	%r8, 0x0154, %r3
	.word 0x84c20009  ! 599: ADDCcc_R	addccc 	%r8, %r9, %r2
	.word 0xc8220009  ! 603: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc40a0009  ! 603: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xca5a0009  ! 603: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0x847a2c1c  ! 603: SDIV_I	sdiv 	%r8, 0x0c1c, %r2
	.word 0x8eb20009  ! 605: SUBCcc_R	orncc 	%r8, %r9, %r7
	.word 0xac122f38  ! 605: OR_I	or 	%r8, 0x0f38, %r22
	.word 0xa8ba2154  ! 605: XNORcc_I	xnorcc 	%r8, 0x0154, %r20
	.word 0x8b320009  ! 605: SRL_R	srl 	%r8, %r9, %r5
	.word 0x841a0009  ! 605: XOR_R	xor 	%r8, %r9, %r2
	.word 0xa0ba2afc  ! 605: XNORcc_I	xnorcc 	%r8, 0x0afc, %r16
	.word 0x889a28dc  ! 605: XORcc_I	xorcc 	%r8, 0x08dc, %r4
	.word 0x8eaa0009  ! 605: ANDNcc_R	andncc 	%r8, %r9, %r7
	.word 0x82322f10  ! 605: SUBC_I	orn 	%r8, 0x0f10, %r1
	.word 0x8e922268  ! 605: ORcc_I	orcc 	%r8, 0x0268, %r7
	.word 0xa8c20009  ! 605: ADDCcc_R	addccc 	%r8, %r9, %r20
	.word 0x8b2a1009  ! 605: SLLX_R	sllx	%r8, %r9, %r5
	.word 0xc42a0009  ! 609: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc45a0009  ! 609: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0x867a26c4  ! 609: SDIV_I	sdiv 	%r8, 0x06c4, %r3
	.word 0x8c7a234c  ! 609: SDIV_I	sdiv 	%r8, 0x034c, %r6
	.word 0xc4720009  ! 615: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xca5a0009  ! 615: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0x8c6a269c  ! 615: UDIVX_I	udivx 	%r8, 0x069c, %r6
	.word 0x966a0009  ! 615: UDIVX_R	udivx 	%r8, %r9, %r11
	.word 0x1c800001  ! 618: BPOS	bpos  	<label_0x1>
	.word 0xa96a0009  ! 618: SDIVX_R	sdivx	%r8, %r9, %r20
	.word 0x83780409  ! 619: MOVR_R	move	%r0, %r9, %r1
	.word 0xba0a2b28  ! 619: AND_I	and 	%r8, 0x0b28, %r29
	.word 0x8f643801  ! 619: MOVcc_I	<illegal instruction>
	.word 0x849a0009  ! 619: XORcc_R	xorcc 	%r8, %r9, %r2
	.word 0x84420009  ! 619: ADDC_R	addc 	%r8, %r9, %r2
	.word 0x86920009  ! 619: ORcc_R	orcc 	%r8, %r9, %r3
	.word 0x829a0009  ! 619: XORcc_R	xorcc 	%r8, %r9, %r1
	.word 0x86ba0009  ! 619: XNORcc_R	xnorcc 	%r8, %r9, %r3
	.word 0x842a0009  ! 619: ANDN_R	andn 	%r8, %r9, %r2
	.word 0xa1641809  ! 619: MOVcc_R	<illegal instruction>
	.word 0x9d782401  ! 619: MOVR_I	move	%r0, 0x9, %r14
	.word 0xcf3a0009  ! 624: STDF_R	std	%f7, [%r9, %r8]
	.word 0xcd020009  ! 624: LDF_R	ld	[%r8, %r9], %f6
	.word 0x8afa2780  ! 624: SDIVcc_I	sdivcc 	%r8, 0x0780, %r5
	.word 0x86722c54  ! 624: UDIV_I	udiv 	%r8, 0x0c54, %r3
	.word 0xd6220009  ! 628: STW_R	stw	%r11, [%r8 + %r9]
	.word 0xcc4a0009  ! 628: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0x8e6a2f34  ! 628: UDIVX_I	udivx 	%r8, 0x0f34, %r7
	.word 0x8cf20009  ! 628: UDIVcc_R	udivcc 	%r8, %r9, %r6
	.word 0xaa3a0009  ! 632: XNOR_R	xnor 	%r8, %r9, %r21
	.word 0x9d321009  ! 632: SRLX_R	srlx	%r8, %r9, %r14
	.word 0xb4aa2918  ! 632: ANDNcc_I	andncc 	%r8, 0x0918, %r26
	.word 0x944229b8  ! 632: ADDC_I	addc 	%r8, 0x09b8, %r10
	.word 0x9d321009  ! 632: SRLX_R	srlx	%r8, %r9, %r14
	.word 0x892a3001  ! 632: SLLX_I	sllx	%r8, 0x0001, %r4
	.word 0x860a0009  ! 632: AND_R	and 	%r8, %r9, %r3
	.word 0x82b20009  ! 632: SUBCcc_R	orncc 	%r8, %r9, %r1
	.word 0x84322f88  ! 632: ORN_I	orn 	%r8, 0x0f88, %r2
	.word 0x882a2fb8  ! 632: ANDN_I	andn 	%r8, 0x0fb8, %r4
	.word 0x86220009  ! 632: SUB_R	sub 	%r8, %r9, %r3
	.word 0x8c2a0009  ! 632: ANDN_R	andn 	%r8, %r9, %r6
	.word 0xb0b20009  ! 632: SUBCcc_R	orncc 	%r8, %r9, %r24
	.word 0x820227bc  ! 632: ADD_I	add 	%r8, 0x07bc, %r1
	.word 0x8c2a29a4  ! 632: ANDN_I	andn 	%r8, 0x09a4, %r6
	.word 0xf4220009  ! 643: STW_R	stw	%r26, [%r8 + %r9]
	.word 0xc45a0009  ! 643: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0x98720009  ! 643: UDIV_R	udiv 	%r8, %r9, %r12
	.word 0x88fa2ff8  ! 643: SDIVcc_I	sdivcc 	%r8, 0x0ff8, %r4
	.word 0x06c20001  ! 647: BRLZ	brlz  ,nt	%8,<label_0x20001>
	.word 0xb4722dd0  ! 647: UDIV_I	udiv 	%r8, 0x0dd0, %r26
	.word 0x24c20001  ! 652: BRLEZ	brlez,a,nt	%8,<label_0x20001>
	.word 0x866a2fb0  ! 652: UDIVX_I	udivx 	%r8, 0x0fb0, %r3
	.word 0x8e02257c  ! 655: ADD_I	add 	%r8, 0x057c, %r7
	.word 0x8b780409  ! 655: MOVR_R	move	%r0, %r9, %r5
	.word 0x8aba0009  ! 655: XNORcc_R	xnorcc 	%r8, %r9, %r5
	.word 0x8d641809  ! 655: MOVcc_R	<illegal instruction>
	.word 0x8f782401  ! 655: MOVR_I	move	%r0, 0x9, %r7
	.word 0x94c20009  ! 655: ADDCcc_R	addccc 	%r8, %r9, %r10
	.word 0x860225a4  ! 655: ADD_I	add 	%r8, 0x05a4, %r3
	.word 0xa1321009  ! 655: SRLX_R	srlx	%r8, %r9, %r16
	.word 0x89780409  ! 655: MOVR_R	move	%r0, %r9, %r4
	.word 0x832a1009  ! 655: SLLX_R	sllx	%r8, %r9, %r1
	.word 0xcb220009  ! 659: STF_R	st	%f5, [%r9, %r8]
	.word 0xc41a0009  ! 659: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xa9780409  ! 659: MOVR_R	move	%r0, %r9, %r20
	.word 0x847a0009  ! 659: SDIV_R	sdiv 	%r8, %r9, %r2
	.word 0xc8720009  ! 665: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc51a0009  ! 665: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0x8e720009  ! 665: UDIV_R	udiv 	%r8, %r9, %r7
	.word 0x84722ab0  ! 665: UDIV_I	udiv 	%r8, 0x0ab0, %r2
	.word 0x40000001  ! 667: CALL	call	disp30_1
	.word 0x856a25a8  ! 667: SDIVX_I	sdivx	%r8, 0x05a8, %r2
	.word 0x82820009  ! 668: ADDcc_R	addcc 	%r8, %r9, %r1
	.word 0xa3320009  ! 668: SRL_R	srl 	%r8, %r9, %r17
	.word 0x873a1009  ! 668: SRAX_R	srax	%r8, %r9, %r3
	.word 0x8ca22560  ! 668: SUBcc_I	subcc 	%r8, 0x0560, %r6
	.word 0x82c22df8  ! 668: ADDCcc_I	addccc 	%r8, 0x0df8, %r1
	.word 0xa88a239c  ! 668: ANDcc_I	andcc 	%r8, 0x039c, %r20
	.word 0xbeba0009  ! 668: XNORcc_R	xnorcc 	%r8, %r9, %r31
	.word 0x8b2a0009  ! 668: SLL_R	sll 	%r8, %r9, %r5
	.word 0x952a0009  ! 668: SLL_R	sll 	%r8, %r9, %r10
	.word 0xba3a26b8  ! 668: XNOR_I	xnor 	%r8, 0x06b8, %r29
	.word 0x8a9a268c  ! 668: XORcc_I	xorcc 	%r8, 0x068c, %r5
	.word 0x8f2a1009  ! 670: SLLX_R	sllx	%r8, %r9, %r7
	.word 0x8aa20009  ! 670: SUBcc_R	subcc 	%r8, %r9, %r5
	.word 0xa88a0009  ! 670: ANDcc_R	andcc 	%r8, %r9, %r20
	.word 0xb2ba232c  ! 670: XNORcc_I	xnorcc 	%r8, 0x032c, %r25
	.word 0x821a2a40  ! 670: XOR_I	xor 	%r8, 0x0a40, %r1
	.word 0xb23a0009  ! 670: XNOR_R	xnor 	%r8, %r9, %r25
	.word 0xa21a0009  ! 670: XOR_R	xor 	%r8, %r9, %r17
	.word 0x84820009  ! 670: ADDcc_R	addcc 	%r8, %r9, %r2
	.word 0x8eb225d0  ! 670: SUBCcc_I	orncc 	%r8, 0x05d0, %r7
	.word 0x8632222c  ! 670: SUBC_I	orn 	%r8, 0x022c, %r3
	.word 0x88ba0009  ! 670: XNORcc_R	xnorcc 	%r8, %r9, %r4
	.word 0x8f2a0009  ! 670: SLL_R	sll 	%r8, %r9, %r7
	.word 0x8e020009  ! 670: ADD_R	add 	%r8, %r9, %r7
	.word 0x87641809  ! 672: MOVcc_R	<illegal instruction>
	.word 0xa2022788  ! 672: ADD_I	add 	%r8, 0x0788, %r17
	.word 0x9f322001  ! 672: SRL_I	srl 	%r8, 0x0001, %r15
	.word 0x8d3a1009  ! 672: SRAX_R	srax	%r8, %r9, %r6
	.word 0xa01a0009  ! 672: XOR_R	xor 	%r8, %r9, %r16
	.word 0x88920009  ! 672: ORcc_R	orcc 	%r8, %r9, %r4
	.word 0x8e120009  ! 672: OR_R	or 	%r8, %r9, %r7
	.word 0x88b20009  ! 672: SUBCcc_R	orncc 	%r8, %r9, %r4
	.word 0xa0420009  ! 672: ADDC_R	addc 	%r8, %r9, %r16
	.word 0x881a0009  ! 672: XOR_R	xor 	%r8, %r9, %r4
	.word 0xc6220009  ! 677: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc65a0009  ! 677: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0x8c720009  ! 677: UDIV_R	udiv 	%r8, %r9, %r6
	.word 0x88f22cbc  ! 677: UDIVcc_I	udivcc 	%r8, 0x0cbc, %r4
	.word 0x82320009  ! 683: SUBC_R	orn 	%r8, %r9, %r1
	.word 0xa52a2001  ! 683: SLL_I	sll 	%r8, 0x0001, %r18
	.word 0x8a1a2e78  ! 683: XOR_I	xor 	%r8, 0x0e78, %r5
	.word 0x968a22d4  ! 683: ANDcc_I	andcc 	%r8, 0x02d4, %r11
	.word 0x8cb20009  ! 683: SUBCcc_R	orncc 	%r8, %r9, %r6
	.word 0x8a120009  ! 683: OR_R	or 	%r8, %r9, %r5
	.word 0x8e420009  ! 683: ADDC_R	addc 	%r8, %r9, %r7
	.word 0x9b3a3001  ! 683: SRAX_I	srax	%r8, 0x0001, %r13
	.word 0x98920009  ! 683: ORcc_R	orcc 	%r8, %r9, %r12
	.word 0x842222dc  ! 683: SUB_I	sub 	%r8, 0x02dc, %r2
	.word 0x969a0009  ! 683: XORcc_R	xorcc 	%r8, %r9, %r11
	.word 0x881a0009  ! 683: XOR_R	xor 	%r8, %r9, %r4
	.word 0xa1643801  ! 685: MOVcc_I	<illegal instruction>
	.word 0x8b780409  ! 685: MOVR_R	move	%r0, %r9, %r5
	.word 0xa3641809  ! 685: MOVcc_R	<illegal instruction>
	.word 0x8e022ae4  ! 685: ADD_I	add 	%r8, 0x0ae4, %r7
	.word 0xb4ba2a08  ! 685: XNORcc_I	xnorcc 	%r8, 0x0a08, %r26
	.word 0x8a8223b4  ! 685: ADDcc_I	addcc 	%r8, 0x03b4, %r5
	.word 0x87321009  ! 685: SRLX_R	srlx	%r8, %r9, %r3
	.word 0x99780409  ! 685: MOVR_R	move	%r0, %r9, %r12
	.word 0x820229b8  ! 685: ADD_I	add 	%r8, 0x09b8, %r1
	.word 0xbe3a2db4  ! 685: XNOR_I	xnor 	%r8, 0x0db4, %r31
	.word 0x82b20009  ! 685: SUBCcc_R	orncc 	%r8, %r9, %r1
	.word 0xa4c224c8  ! 685: ADDCcc_I	addccc 	%r8, 0x04c8, %r18
	.word 0xb40a0009  ! 685: AND_R	and 	%r8, %r9, %r26
	.word 0xbc0223ec  ! 685: ADD_I	add 	%r8, 0x03ec, %r30
	.word 0xfe220009  ! 689: STW_R	stw	%r31, [%r8 + %r9]
	.word 0xc4420009  ! 689: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xce020009  ! 689: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0x8afa2304  ! 689: SDIVcc_I	sdivcc 	%r8, 0x0304, %r5
	.word 0x18800001  ! 691: BGU	bgu  	<label_0x1>
	.word 0x856a0009  ! 691: SDIVX_R	sdivx	%r8, %r9, %r2
	.word 0x2c800001  ! 695: BNEG	bneg,a	<label_0x1>
	.word 0xbc6a0009  ! 695: UDIVX_R	udivx 	%r8, %r9, %r30
	.word 0x24800002  ! 700: BLE	ble,a	<label_0x2>
	.word 0x8c7a0009  ! 700: SDIV_R	sdiv 	%r8, %r9, %r6
	.word 0x88c22e3c  ! 702: ADDCcc_I	addccc 	%r8, 0x0e3c, %r4
	.word 0x8aa22d68  ! 702: SUBcc_I	subcc 	%r8, 0x0d68, %r5
	.word 0xac0224b8  ! 702: ADD_I	add 	%r8, 0x04b8, %r22
	.word 0x82a22ca4  ! 702: SUBcc_I	subcc 	%r8, 0x0ca4, %r1
	.word 0x833a2001  ! 702: SRA_I	sra 	%r8, 0x0001, %r1
	.word 0x82a22da8  ! 702: SUBcc_I	subcc 	%r8, 0x0da8, %r1
	.word 0x8ea20009  ! 702: SUBcc_R	subcc 	%r8, %r9, %r7
	.word 0x833a3001  ! 702: SRAX_I	srax	%r8, 0x0001, %r1
	.word 0x82920009  ! 702: ORcc_R	orcc 	%r8, %r9, %r1
	.word 0xaf3a3001  ! 702: SRAX_I	srax	%r8, 0x0001, %r23
	.word 0xb82a2920  ! 703: ANDN_I	andn 	%r8, 0x0920, %r28
	.word 0x8c1222c4  ! 703: OR_I	or 	%r8, 0x02c4, %r6
	.word 0x829a0009  ! 703: XORcc_R	xorcc 	%r8, %r9, %r1
	.word 0x821a0009  ! 703: XOR_R	xor 	%r8, %r9, %r1
	.word 0x86aa29bc  ! 703: ANDNcc_I	andncc 	%r8, 0x09bc, %r3
	.word 0x86922318  ! 703: ORcc_I	orcc 	%r8, 0x0318, %r3
	.word 0x8c922a44  ! 703: ORcc_I	orcc 	%r8, 0x0a44, %r6
	.word 0x861a0009  ! 703: XOR_R	xor 	%r8, %r9, %r3
	.word 0x9c220009  ! 703: SUB_R	sub 	%r8, %r9, %r14
	.word 0xac0a0009  ! 703: AND_R	and 	%r8, %r9, %r22
	.word 0x8a820009  ! 703: ADDcc_R	addcc 	%r8, %r9, %r5
	.word 0xbe920009  ! 703: ORcc_R	orcc 	%r8, %r9, %r31
	.word 0xbd3a1009  ! 703: SRAX_R	srax	%r8, %r9, %r30
	.word 0x99782401  ! 703: MOVR_I	move	%r0, 0x9, %r12
	.word 0xa0aa0009  ! 708: ANDNcc_R	andncc 	%r8, %r9, %r16
	.word 0x9d322001  ! 708: SRL_I	srl 	%r8, 0x0001, %r14
	.word 0x832a2001  ! 708: SLL_I	sll 	%r8, 0x0001, %r1
	.word 0x8b3a2001  ! 708: SRA_I	sra 	%r8, 0x0001, %r5
	.word 0xaeb20009  ! 708: ORNcc_R	orncc 	%r8, %r9, %r23
	.word 0xa53a0009  ! 708: SRA_R	sra 	%r8, %r9, %r18
	.word 0x8d780409  ! 708: MOVR_R	move	%r0, %r9, %r6
	.word 0xa3321009  ! 708: SRLX_R	srlx	%r8, %r9, %r17
	.word 0x9e9a0009  ! 708: XORcc_R	xorcc 	%r8, %r9, %r15
	.word 0xa22a22a8  ! 708: ANDN_I	andn 	%r8, 0x02a8, %r17
	.word 0x973a3001  ! 708: SRAX_I	srax	%r8, 0x0001, %r11
	.word 0xaca22200  ! 708: SUBcc_I	subcc 	%r8, 0x0200, %r22
	.word 0x06ca0001  ! 714: BRLZ	brlz  ,pt	%8,<label_0xa0001>
	.word 0x896a2d98  ! 714: SDIVX_I	sdivx	%r8, 0x0d98, %r4
	.word 0xcf3a0009  ! 718: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc81a0009  ! 718: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x880a0009  ! 718: AND_R	and 	%r8, %r9, %r4
	.word 0x846a249c  ! 718: UDIVX_I	udivx 	%r8, 0x049c, %r2
	.word 0xca720009  ! 723: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc7020009  ! 723: LDF_R	ld	[%r8, %r9], %f3
	.word 0x98fa0009  ! 723: SDIVcc_R	sdivcc 	%r8, %r9, %r12
	.word 0xaafa2928  ! 723: SDIVcc_I	sdivcc 	%r8, 0x0928, %r21
	.word 0x84220009  ! 729: SUB_R	sub 	%r8, %r9, %r2
	.word 0x8e8a0009  ! 729: ANDcc_R	andcc 	%r8, %r9, %r7
	.word 0x8d3a0009  ! 729: SRA_R	sra 	%r8, %r9, %r6
	.word 0xb63a0009  ! 729: XNOR_R	xnor 	%r8, %r9, %r27
	.word 0xa72a1009  ! 729: SLLX_R	sllx	%r8, %r9, %r19
	.word 0x873a3001  ! 729: SRAX_I	srax	%r8, 0x0001, %r3
	.word 0xb02a2654  ! 729: ANDN_I	andn 	%r8, 0x0654, %r24
	.word 0xb2920009  ! 729: ORcc_R	orcc 	%r8, %r9, %r25
	.word 0x8eb20009  ! 729: ORNcc_R	orncc 	%r8, %r9, %r7
	.word 0x9f320009  ! 729: SRL_R	srl 	%r8, %r9, %r15
	.word 0xb72a1009  ! 729: SLLX_R	sllx	%r8, %r9, %r27
	.word 0x880a0009  ! 729: AND_R	and 	%r8, %r9, %r4
	.word 0x84a20009  ! 729: SUBcc_R	subcc 	%r8, %r9, %r2
	.word 0xc4320009  ! 733: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xcc520009  ! 733: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0x887a0009  ! 733: SDIV_R	sdiv 	%r8, %r9, %r4
	.word 0x8a6a0009  ! 733: UDIVX_R	udivx 	%r8, %r9, %r5
	.word 0xc4720009  ! 739: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xdf020009  ! 739: LDF_R	ld	[%r8, %r9], %f15
	.word 0xad6a2b8c  ! 739: SDIVX_I	sdivx	%r8, 0x0b8c, %r22
	.word 0x82722108  ! 739: UDIV_I	udiv 	%r8, 0x0108, %r1
	.word 0x02c20001  ! 741: BRZ	brz  ,nt	%8,<label_0x20001>
	.word 0x82f22af0  ! 741: UDIVcc_I	udivcc 	%r8, 0x0af0, %r1
	.word 0xc4320009  ! 745: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xcc020009  ! 745: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xac6a20b0  ! 745: UDIVX_I	udivx 	%r8, 0x00b0, %r22
	.word 0x82720009  ! 745: UDIV_R	udiv 	%r8, %r9, %r1
	.word 0x00800001  ! 748: BN	bn  	<label_0x1>
	.word 0x8d6a0009  ! 748: SDIVX_R	sdivx	%r8, %r9, %r6
	.word 0x38800001  ! 754: BGU	bgu,a	<label_0x1>
	.word 0xb36a0009  ! 754: SDIVX_R	sdivx	%r8, %r9, %r25
	.word 0xf2220009  ! 759: STW_R	stw	%r25, [%r8 + %r9]
	.word 0xc8420009  ! 759: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xbcf22e78  ! 759: UDIVcc_I	udivcc 	%r8, 0x0e78, %r30
	.word 0xaa6a0009  ! 759: UDIVX_R	udivx 	%r8, %r9, %r21
	.word 0x32800001  ! 761: BNE	bne,a	<label_0x1>
	.word 0x836a0009  ! 761: SDIVX_R	sdivx	%r8, %r9, %r1
	.word 0xc82a0009  ! 765: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc81a0009  ! 765: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x88f227ac  ! 765: UDIVcc_I	udivcc 	%r8, 0x07ac, %r4
	.word 0x8f6a0009  ! 765: SDIVX_R	sdivx	%r8, %r9, %r7
	.word 0x40000002  ! 767: CALL	call	disp30_2
	.word 0x8af22f40  ! 767: UDIVcc_I	udivcc 	%r8, 0x0f40, %r5
	.word 0x16800001  ! 769: BGE	bge  	<label_0x1>
	.word 0xae722b08  ! 769: UDIV_I	udiv 	%r8, 0x0b08, %r23
	.word 0x3c800002  ! 771: BPOS	bpos,a	<label_0x2>
	.word 0xba6a2cec  ! 771: UDIVX_I	udivx 	%r8, 0x0cec, %r29
	.word 0x840a0009  ! 772: AND_R	and 	%r8, %r9, %r2
	.word 0x94322e00  ! 772: ORN_I	orn 	%r8, 0x0e00, %r10
	.word 0x84322654  ! 772: SUBC_I	orn 	%r8, 0x0654, %r2
	.word 0x840a2150  ! 772: AND_I	and 	%r8, 0x0150, %r2
	.word 0x86c20009  ! 772: ADDCcc_R	addccc 	%r8, %r9, %r3
	.word 0x853a0009  ! 772: SRA_R	sra 	%r8, %r9, %r2
	.word 0x8a9a0009  ! 772: XORcc_R	xorcc 	%r8, %r9, %r5
	.word 0x9b780409  ! 772: MOVR_R	move	%r0, %r9, %r13
	.word 0x841a0009  ! 772: XOR_R	xor 	%r8, %r9, %r2
	.word 0x84120009  ! 772: OR_R	or 	%r8, %r9, %r2
	.word 0xac1a2f6c  ! 772: XOR_I	xor 	%r8, 0x0f6c, %r22
	.word 0xc62a0009  ! 776: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xf01a0009  ! 776: LDD_R	ldd	[%r8 + %r9], %r24
	.word 0xb2f20009  ! 776: UDIVcc_R	udivcc 	%r8, %r9, %r25
	.word 0x84720009  ! 776: UDIV_R	udiv 	%r8, %r9, %r2
	.word 0xc9220009  ! 780: STF_R	st	%f4, [%r9, %r8]
	.word 0xc41a0009  ! 780: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x8c722c9c  ! 780: UDIV_I	udiv 	%r8, 0x0c9c, %r6
	.word 0xbd6a0009  ! 780: SDIVX_R	sdivx	%r8, %r9, %r30
	.word 0x86920009  ! 782: ORcc_R	orcc 	%r8, %r9, %r3
	.word 0x86322894  ! 782: ORN_I	orn 	%r8, 0x0894, %r3
	.word 0x8e4226bc  ! 782: ADDC_I	addc 	%r8, 0x06bc, %r7
	.word 0x98b20009  ! 782: SUBCcc_R	orncc 	%r8, %r9, %r12
	.word 0x888a0009  ! 782: ANDcc_R	andcc 	%r8, %r9, %r4
	.word 0x88820009  ! 782: ADDcc_R	addcc 	%r8, %r9, %r4
	.word 0xa3322001  ! 782: SRL_I	srl 	%r8, 0x0001, %r17
	.word 0x8caa0009  ! 782: ANDNcc_R	andncc 	%r8, %r9, %r6
	.word 0x86aa0009  ! 782: ANDNcc_R	andncc 	%r8, %r9, %r3
	.word 0x893a3001  ! 782: SRAX_I	srax	%r8, 0x0001, %r4
	.word 0x8cb2249c  ! 782: SUBCcc_I	orncc 	%r8, 0x049c, %r6
	.word 0x8a9a21b8  ! 782: XORcc_I	xorcc 	%r8, 0x01b8, %r5
	.word 0x8c822e6c  ! 782: ADDcc_I	addcc 	%r8, 0x0e6c, %r6
	.word 0x8e420009  ! 783: ADDC_R	addc 	%r8, %r9, %r7
	.word 0x8b643801  ! 783: MOVcc_I	<illegal instruction>
	.word 0x883a0009  ! 783: XNOR_R	xnor 	%r8, %r9, %r4
	.word 0x89320009  ! 783: SRL_R	srl 	%r8, %r9, %r4
	.word 0x8232233c  ! 783: SUBC_I	orn 	%r8, 0x033c, %r1
	.word 0x9c120009  ! 783: OR_R	or 	%r8, %r9, %r14
	.word 0xa5322001  ! 783: SRL_I	srl 	%r8, 0x0001, %r18
	.word 0x823a2e30  ! 783: XNOR_I	xnor 	%r8, 0x0e30, %r1
	.word 0x9c92293c  ! 783: ORcc_I	orcc 	%r8, 0x093c, %r14
	.word 0x8eb20009  ! 783: SUBCcc_R	orncc 	%r8, %r9, %r7
	.word 0x8d323001  ! 783: SRLX_I	srlx	%r8, 0x0001, %r6
	.word 0xac820009  ! 783: ADDcc_R	addcc 	%r8, %r9, %r22
	.word 0x8b782401  ! 783: MOVR_I	move	%r0, 0x9, %r5
	.word 0xbb3a2001  ! 783: SRA_I	sra 	%r8, 0x0001, %r29
	.word 0x86c20009  ! 785: ADDCcc_R	addccc 	%r8, %r9, %r3
	.word 0xa6020009  ! 785: ADD_R	add 	%r8, %r9, %r19
	.word 0xb0b20009  ! 785: SUBCcc_R	orncc 	%r8, %r9, %r24
	.word 0x8b320009  ! 785: SRL_R	srl 	%r8, %r9, %r5
	.word 0x96322ff0  ! 785: SUBC_I	orn 	%r8, 0x0ff0, %r11
	.word 0x86120009  ! 785: OR_R	or 	%r8, %r9, %r3
	.word 0x8f782401  ! 785: MOVR_I	move	%r0, 0x9, %r7
	.word 0x9e820009  ! 785: ADDcc_R	addcc 	%r8, %r9, %r15
	.word 0xaeaa267c  ! 785: ANDNcc_I	andncc 	%r8, 0x067c, %r23
	.word 0x8d321009  ! 785: SRLX_R	srlx	%r8, %r9, %r6
	.word 0x8a0a0009  ! 785: AND_R	and 	%r8, %r9, %r5
	.word 0xb49a25d0  ! 785: XORcc_I	xorcc 	%r8, 0x05d0, %r26
	.word 0x84b22050  ! 785: ORNcc_I	orncc 	%r8, 0x0050, %r2
	.word 0x16800001  ! 787: BGE	bge  	<label_0x1>
	.word 0x8e7a2300  ! 787: SDIV_I	sdiv 	%r8, 0x0300, %r7
	.word 0xca720009  ! 793: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc01a0009  ! 793: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0x8a720009  ! 793: UDIV_R	udiv 	%r8, %r9, %r5
	.word 0x82722e04  ! 793: UDIV_I	udiv 	%r8, 0x0e04, %r1
	.word 0x8a320009  ! 794: SUBC_R	orn 	%r8, %r9, %r5
	.word 0x873a2001  ! 794: SRA_I	sra 	%r8, 0x0001, %r3
	.word 0xa2b20009  ! 794: SUBCcc_R	orncc 	%r8, %r9, %r17
	.word 0x8c220009  ! 794: SUB_R	sub 	%r8, %r9, %r6
	.word 0x952a3001  ! 794: SLLX_I	sllx	%r8, 0x0001, %r10
	.word 0x8e020009  ! 794: ADD_R	add 	%r8, %r9, %r7
	.word 0xb032211c  ! 794: ORN_I	orn 	%r8, 0x011c, %r24
	.word 0x8eb22440  ! 794: ORNcc_I	orncc 	%r8, 0x0440, %r7
	.word 0x89323001  ! 794: SRLX_I	srlx	%r8, 0x0001, %r4
	.word 0x8ec20009  ! 794: ADDCcc_R	addccc 	%r8, %r9, %r7
	.word 0x8a3a0009  ! 795: XNOR_R	xnor 	%r8, %r9, %r5
	.word 0xb9323001  ! 795: SRLX_I	srlx	%r8, 0x0001, %r28
	.word 0xae9a2e2c  ! 795: XORcc_I	xorcc 	%r8, 0x0e2c, %r23
	.word 0x852a0009  ! 795: SLL_R	sll 	%r8, %r9, %r2
	.word 0x86aa0009  ! 795: ANDNcc_R	andncc 	%r8, %r9, %r3
	.word 0x8cb20009  ! 795: SUBCcc_R	orncc 	%r8, %r9, %r6
	.word 0x840227a4  ! 795: ADD_I	add 	%r8, 0x07a4, %r2
	.word 0x8f322001  ! 795: SRL_I	srl 	%r8, 0x0001, %r7
	.word 0x87323001  ! 795: SRLX_I	srlx	%r8, 0x0001, %r3
	.word 0xaaa221e4  ! 795: SUBcc_I	subcc 	%r8, 0x01e4, %r21
	.word 0xca320009  ! 799: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xdd020009  ! 799: LDF_R	ld	[%r8, %r9], %f14
	.word 0x887a2270  ! 799: SDIV_I	sdiv 	%r8, 0x0270, %r4
	.word 0x987a0009  ! 799: SDIV_R	sdiv 	%r8, %r9, %r12
	.word 0xcf3a0009  ! 803: STDF_R	std	%f7, [%r9, %r8]
	.word 0xcc1a0009  ! 803: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0x867229e0  ! 803: UDIV_I	udiv 	%r8, 0x09e0, %r3
	.word 0xa8f20009  ! 803: UDIVcc_R	udivcc 	%r8, %r9, %r20
	.word 0xa12a0009  ! 807: SLL_R	sll 	%r8, %r9, %r16
	.word 0x88aa2cd4  ! 807: ANDNcc_I	andncc 	%r8, 0x0cd4, %r4
	.word 0xbc2a0009  ! 807: ANDN_R	andn 	%r8, %r9, %r30
	.word 0x841a0009  ! 807: XOR_R	xor 	%r8, %r9, %r2
	.word 0x823a2118  ! 807: XNOR_I	xnor 	%r8, 0x0118, %r1
	.word 0x86aa2314  ! 807: ANDNcc_I	andncc 	%r8, 0x0314, %r3
	.word 0xbaaa0009  ! 807: ANDNcc_R	andncc 	%r8, %r9, %r29
	.word 0x84b22f18  ! 807: ORNcc_I	orncc 	%r8, 0x0f18, %r2
	.word 0x8e1a2778  ! 807: XOR_I	xor 	%r8, 0x0778, %r7
	.word 0x8d3a3001  ! 807: SRAX_I	srax	%r8, 0x0001, %r6
	.word 0x99641809  ! 807: MOVcc_R	<illegal instruction>
	.word 0x882a0009  ! 807: ANDN_R	andn 	%r8, %r9, %r4
	.word 0x869a2938  ! 807: XORcc_I	xorcc 	%r8, 0x0938, %r3
	.word 0x8a320009  ! 807: SUBC_R	orn 	%r8, %r9, %r5
	.word 0x84822548  ! 807: ADDcc_I	addcc 	%r8, 0x0548, %r2
	.word 0xca720009  ! 812: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xfe4a0009  ! 812: LDSB_R	ldsb	[%r8 + %r9], %r31
	.word 0xc3020009  ! 812: LDF_R	ld	[%r8, %r9], %f1
	.word 0x8efa2828  ! 812: SDIVcc_I	sdivcc 	%r8, 0x0828, %r7
	.word 0xde220009  ! 818: STW_R	stw	%r15, [%r8 + %r9]
	.word 0xc65a0009  ! 818: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0x8c7a0009  ! 818: SDIV_R	sdiv 	%r8, %r9, %r6
	.word 0x94fa0009  ! 818: SDIVcc_R	sdivcc 	%r8, %r9, %r10
	.word 0xc8220009  ! 829: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc51a0009  ! 829: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0x8a7221b4  ! 829: UDIV_I	udiv 	%r8, 0x01b4, %r5
	.word 0xb46a2580  ! 829: UDIVX_I	udivx 	%r8, 0x0580, %r26
	.word 0x2ac20001  ! 831: BRNZ	brnz,a,nt	%8,<label_0x20001>
	.word 0x896a26d4  ! 831: SDIVX_I	sdivx	%r8, 0x06d4, %r4
	.word 0x34800001  ! 840: BG	bg,a	<label_0x1>
	.word 0xbe7a24d8  ! 840: SDIV_I	sdiv 	%r8, 0x04d8, %r31
	.word 0xfb3a0009  ! 844: STDF_R	std	%f29, [%r9, %r8]
	.word 0xc81a0009  ! 844: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x86fa2380  ! 844: SDIVcc_I	sdivcc 	%r8, 0x0380, %r3
	.word 0x88fa2184  ! 844: SDIVcc_I	sdivcc 	%r8, 0x0184, %r4
	.word 0xb3780409  ! 846: MOVR_R	move	%r0, %r9, %r25
	.word 0xbe2a2b64  ! 846: ANDN_I	andn 	%r8, 0x0b64, %r31
	.word 0xb0020009  ! 846: ADD_R	add 	%r8, %r9, %r24
	.word 0xa2222080  ! 846: SUB_I	sub 	%r8, 0x0080, %r17
	.word 0x82c20009  ! 846: ADDCcc_R	addccc 	%r8, %r9, %r1
	.word 0x9d2a3001  ! 846: SLLX_I	sllx	%r8, 0x0001, %r14
	.word 0x86020009  ! 846: ADD_R	add 	%r8, %r9, %r3
	.word 0x88422aa4  ! 846: ADDC_I	addc 	%r8, 0x0aa4, %r4
	.word 0x84ba2e74  ! 846: XNORcc_I	xnorcc 	%r8, 0x0e74, %r2
	.word 0x832a2001  ! 846: SLL_I	sll 	%r8, 0x0001, %r1
	.word 0x8f782401  ! 846: MOVR_I	move	%r0, 0x1, %r7
	.word 0xb0122cf8  ! 846: OR_I	or 	%r8, 0x0cf8, %r24
	.word 0x8a322b44  ! 846: ORN_I	orn 	%r8, 0x0b44, %r5
	.word 0x883224e4  ! 846: ORN_I	orn 	%r8, 0x04e4, %r4
	.word 0xe93a0009  ! 850: STDF_R	std	%f20, [%r9, %r8]
	.word 0xda5a0009  ! 850: LDX_R	ldx	[%r8 + %r9], %r13
	.word 0x82fa0009  ! 850: SDIVcc_R	sdivcc 	%r8, %r9, %r1
	.word 0x94720009  ! 850: UDIV_R	udiv 	%r8, %r9, %r10
	.word 0xbf323001  ! 851: SRLX_I	srlx	%r8, 0x0001, %r31
	.word 0x84320009  ! 851: SUBC_R	orn 	%r8, %r9, %r2
	.word 0x8f320009  ! 851: SRL_R	srl 	%r8, %r9, %r7
	.word 0xaf3a3001  ! 851: SRAX_I	srax	%r8, 0x0001, %r23
	.word 0x862a2560  ! 851: ANDN_I	andn 	%r8, 0x0560, %r3
	.word 0x8ab20009  ! 851: ORNcc_R	orncc 	%r8, %r9, %r5
	.word 0xbe920009  ! 851: ORcc_R	orcc 	%r8, %r9, %r31
	.word 0x8ca20009  ! 851: SUBcc_R	subcc 	%r8, %r9, %r6
	.word 0x852a0009  ! 851: SLL_R	sll 	%r8, %r9, %r2
	.word 0x88b22594  ! 851: SUBCcc_I	orncc 	%r8, 0x0594, %r4
	.word 0x9e3224b8  ! 851: SUBC_I	orn 	%r8, 0x04b8, %r15
	.word 0x8e0a2564  ! 851: AND_I	and 	%r8, 0x0564, %r7
	.word 0x86b20009  ! 851: SUBCcc_R	orncc 	%r8, %r9, %r3
	.word 0x8c820009  ! 851: ADDcc_R	addcc 	%r8, %r9, %r6
	.word 0xef3a0009  ! 856: STDF_R	std	%f23, [%r9, %r8]
	.word 0xc6520009  ! 856: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xd41a2b78  ! 856: LDD_I	ldd	[%r8 + 0x0b78], %r10
	.word 0x8efa2294  ! 856: SDIVcc_I	sdivcc 	%r8, 0x0294, %r7
	.word 0x82922dc0  ! 857: ORcc_I	orcc 	%r8, 0x0dc0, %r1
	.word 0x9aaa0009  ! 857: ANDNcc_R	andncc 	%r8, %r9, %r13
	.word 0x852a3001  ! 857: SLLX_I	sllx	%r8, 0x0001, %r2
	.word 0xbac20009  ! 857: ADDCcc_R	addccc 	%r8, %r9, %r29
	.word 0x8cb20009  ! 857: SUBCcc_R	orncc 	%r8, %r9, %r6
	.word 0x842a0009  ! 857: ANDN_R	andn 	%r8, %r9, %r2
	.word 0xaa320009  ! 857: ORN_R	orn 	%r8, %r9, %r21
	.word 0x8f322001  ! 857: SRL_I	srl 	%r8, 0x0001, %r7
	.word 0x83643801  ! 857: MOVcc_I	<illegal instruction>
	.word 0x84320009  ! 857: ORN_R	orn 	%r8, %r9, %r2
	.word 0x86b20009  ! 857: ORNcc_R	orncc 	%r8, %r9, %r3
	.word 0x87643801  ! 857: MOVcc_I	<illegal instruction>
	.word 0x89780409  ! 857: MOVR_R	move	%r0, %r9, %r4
	.word 0x961a0009  ! 857: XOR_R	xor 	%r8, %r9, %r11
	.word 0x833a0009  ! 857: SRA_R	sra 	%r8, %r9, %r1
	.word 0x2cc20001  ! 861: BRGZ	brgz,a,nt	%8,<label_0x20001>
	.word 0xa0720009  ! 861: UDIV_R	udiv 	%r8, %r9, %r16
	.word 0xc4320009  ! 865: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xca020009  ! 865: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0x8d6a0009  ! 865: SDIVX_R	sdivx	%r8, %r9, %r6
	.word 0x9a7a2c78  ! 865: SDIV_I	sdiv 	%r8, 0x0c78, %r13
	.word 0xa9323001  ! 867: SRLX_I	srlx	%r8, 0x0001, %r20
	.word 0xac920009  ! 867: ORcc_R	orcc 	%r8, %r9, %r22
	.word 0xb13a1009  ! 867: SRAX_R	srax	%r8, %r9, %r24
	.word 0x87641809  ! 867: MOVcc_R	<illegal instruction>
	.word 0xaa8a0009  ! 867: ANDcc_R	andcc 	%r8, %r9, %r21
	.word 0xbe322b18  ! 867: ORN_I	orn 	%r8, 0x0b18, %r31
	.word 0x948a2b28  ! 867: ANDcc_I	andcc 	%r8, 0x0b28, %r10
	.word 0x9e422930  ! 867: ADDC_I	addc 	%r8, 0x0930, %r15
	.word 0x8a0a0009  ! 867: AND_R	and 	%r8, %r9, %r5
	.word 0x8f2a2001  ! 867: SLL_I	sll 	%r8, 0x0001, %r7
	.word 0x82b20009  ! 867: SUBCcc_R	orncc 	%r8, %r9, %r1
	.word 0x8a022afc  ! 867: ADD_I	add 	%r8, 0x0afc, %r5
	.word 0x24800002  ! 870: BLE	ble,a	<label_0x2>
	.word 0x84f22284  ! 870: UDIVcc_I	udivcc 	%r8, 0x0284, %r2
	.word 0x1c800002  ! 872: BPOS	bpos  	<label_0x2>
	.word 0x846a283c  ! 872: UDIVX_I	udivx 	%r8, 0x083c, %r2
	.word 0x8a220009  ! 873: SUB_R	sub 	%r8, %r9, %r5
	.word 0xacb20009  ! 873: ORNcc_R	orncc 	%r8, %r9, %r22
	.word 0x87780409  ! 873: MOVR_R	move	%r0, %r9, %r3
	.word 0xb21a28c4  ! 873: XOR_I	xor 	%r8, 0x08c4, %r25
	.word 0xbb2a3001  ! 873: SLLX_I	sllx	%r8, 0x0001, %r29
	.word 0xbeb20009  ! 873: SUBCcc_R	orncc 	%r8, %r9, %r31
	.word 0x99323001  ! 873: SRLX_I	srlx	%r8, 0x0001, %r12
	.word 0xaa220009  ! 873: SUB_R	sub 	%r8, %r9, %r21
	.word 0xa6c20009  ! 873: ADDCcc_R	addccc 	%r8, %r9, %r19
	.word 0x85320009  ! 873: SRL_R	srl 	%r8, %r9, %r2
	.word 0x82aa0009  ! 873: ANDNcc_R	andncc 	%r8, %r9, %r1
	.word 0x82022250  ! 873: ADD_I	add 	%r8, 0x0250, %r1
	.word 0x8a3223c0  ! 874: SUBC_I	orn 	%r8, 0x03c0, %r5
	.word 0xa5323001  ! 874: SRLX_I	srlx	%r8, 0x0001, %r18
	.word 0x888a0009  ! 874: ANDcc_R	andcc 	%r8, %r9, %r4
	.word 0xa4020009  ! 874: ADD_R	add 	%r8, %r9, %r18
	.word 0x82322ca4  ! 874: ORN_I	orn 	%r8, 0x0ca4, %r1
	.word 0x8d321009  ! 874: SRLX_R	srlx	%r8, %r9, %r6
	.word 0x86120009  ! 874: OR_R	or 	%r8, %r9, %r3
	.word 0x83780409  ! 874: MOVR_R	move	%r0, %r9, %r1
	.word 0x8a32298c  ! 874: ORN_I	orn 	%r8, 0x098c, %r5
	.word 0x860a0009  ! 874: AND_R	and 	%r8, %r9, %r3
	.word 0xbf782401  ! 874: MOVR_I	move	%r0, 0x9, %r31
	.word 0x828a2778  ! 874: ANDcc_I	andcc 	%r8, 0x0778, %r1
	.word 0xa63225b4  ! 874: ORN_I	orn 	%r8, 0x05b4, %r19
	.word 0x8b2a0009  ! 874: SLL_R	sll 	%r8, %r9, %r5
	.word 0x8e2a0009  ! 874: ANDN_R	andn 	%r8, %r9, %r7
	.word 0xe4720009  ! 884: STX_R	stx	%r18, [%r8 + %r9]
	.word 0xce120009  ! 884: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0x8af2258c  ! 884: UDIVcc_I	udivcc 	%r8, 0x058c, %r5
	.word 0x8efa2634  ! 884: SDIVcc_I	sdivcc 	%r8, 0x0634, %r7
	.word 0xcf220009  ! 889: STF_R	st	%f7, [%r9, %r8]
	.word 0xdc020009  ! 889: LDUW_R	lduw	[%r8 + %r9], %r14
	.word 0x8c7a27cc  ! 889: SDIV_I	sdiv 	%r8, 0x07cc, %r6
	.word 0x827226a0  ! 889: UDIV_I	udiv 	%r8, 0x06a0, %r1
	.word 0xbe2a0009  ! 891: ANDN_R	andn 	%r8, %r9, %r31
	.word 0xbe220009  ! 891: SUB_R	sub 	%r8, %r9, %r31
	.word 0x86222750  ! 891: SUB_I	sub 	%r8, 0x0750, %r3
	.word 0xa6b220b0  ! 891: ORNcc_I	orncc 	%r8, 0x00b0, %r19
	.word 0x84920009  ! 891: ORcc_R	orcc 	%r8, %r9, %r2
	.word 0xa4822694  ! 891: ADDcc_I	addcc 	%r8, 0x0694, %r18
	.word 0xa2c229f4  ! 891: ADDCcc_I	addccc 	%r8, 0x09f4, %r17
	.word 0x873a2001  ! 891: SRA_I	sra 	%r8, 0x0001, %r3
	.word 0x84820009  ! 891: ADDcc_R	addcc 	%r8, %r9, %r2
	.word 0x8a3a0009  ! 891: XNOR_R	xnor 	%r8, %r9, %r5
	.word 0x8ca20009  ! 891: SUBcc_R	subcc 	%r8, %r9, %r6
	.word 0xa09a24a0  ! 891: XORcc_I	xorcc 	%r8, 0x04a0, %r16
	.word 0xdc2a0009  ! 897: STB_R	stb	%r14, [%r8 + %r9]
	.word 0xce4a0009  ! 897: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0x867a0009  ! 897: SDIV_R	sdiv 	%r8, %r9, %r3
	.word 0x9b6a0009  ! 897: SDIVX_R	sdivx	%r8, %r9, %r13
	.word 0x88822698  ! 900: ADDcc_I	addcc 	%r8, 0x0698, %r4
	.word 0x88320009  ! 900: ORN_R	orn 	%r8, %r9, %r4
	.word 0x88320009  ! 900: SUBC_R	orn 	%r8, %r9, %r4
	.word 0xb08a0009  ! 900: ANDcc_R	andcc 	%r8, %r9, %r24
	.word 0x86b226bc  ! 900: SUBCcc_I	orncc 	%r8, 0x06bc, %r3
	.word 0x8d641809  ! 900: MOVcc_R	<illegal instruction>
	.word 0x9b2a0009  ! 900: SLL_R	sll 	%r8, %r9, %r13
	.word 0x88c22404  ! 900: ADDCcc_I	addccc 	%r8, 0x0404, %r4
	.word 0x8c2a0009  ! 900: ANDN_R	andn 	%r8, %r9, %r6
	.word 0x8c8a2538  ! 900: ANDcc_I	andcc 	%r8, 0x0538, %r6
	.word 0xb0420009  ! 900: ADDC_R	addc 	%r8, %r9, %r24
	.word 0xa72a1009  ! 900: SLLX_R	sllx	%r8, %r9, %r19
	.word 0x880a2e18  ! 900: AND_I	and 	%r8, 0x0e18, %r4
	.word 0x32800002  ! 902: BNE	bne,a	<label_0x2>
	.word 0x826a2b30  ! 902: UDIVX_I	udivx 	%r8, 0x0b30, %r1
	.word 0x00800001  ! 905: BN	bn  	<label_0x1>
	.word 0xba6a2260  ! 905: UDIVX_I	udivx 	%r8, 0x0260, %r29
	.word 0x893a1009  ! 908: SRAX_R	srax	%r8, %r9, %r4
	.word 0x893a3001  ! 908: SRAX_I	srax	%r8, 0x0001, %r4
	.word 0x8f3a3001  ! 908: SRAX_I	srax	%r8, 0x0001, %r7
	.word 0x82ba0009  ! 908: XNORcc_R	xnorcc 	%r8, %r9, %r1
	.word 0x8d780409  ! 908: MOVR_R	move	%r0, %r9, %r6
	.word 0x852a3001  ! 908: SLLX_I	sllx	%r8, 0x0001, %r2
	.word 0x823226b0  ! 908: SUBC_I	orn 	%r8, 0x06b0, %r1
	.word 0xab2a1009  ! 908: SLLX_R	sllx	%r8, %r9, %r21
	.word 0xac120009  ! 908: OR_R	or 	%r8, %r9, %r22
	.word 0xb8220009  ! 908: SUB_R	sub 	%r8, %r9, %r28
	.word 0xcb220009  ! 913: STF_R	st	%f5, [%r9, %r8]
	.word 0xce120009  ! 913: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0x86720009  ! 913: UDIV_R	udiv 	%r8, %r9, %r3
	.word 0x82720009  ! 913: UDIV_R	udiv 	%r8, %r9, %r1
	.word 0x8aba2e04  ! 916: XNORcc_I	xnorcc 	%r8, 0x0e04, %r5
	.word 0xb6320009  ! 916: SUBC_R	orn 	%r8, %r9, %r27
	.word 0x892a2001  ! 916: SLL_I	sll 	%r8, 0x0001, %r4
	.word 0x9b2a3001  ! 916: SLLX_I	sllx	%r8, 0x0001, %r13
	.word 0x8aaa2900  ! 916: ANDNcc_I	andncc 	%r8, 0x0900, %r5
	.word 0xa24223d4  ! 916: ADDC_I	addc 	%r8, 0x03d4, %r17
	.word 0xa7643801  ! 916: MOVcc_I	<illegal instruction>
	.word 0xa24227b4  ! 916: ADDC_I	addc 	%r8, 0x07b4, %r17
	.word 0x83780409  ! 916: MOVR_R	move	%r0, %r9, %r1
	.word 0x8b641809  ! 916: MOVcc_R	<illegal instruction>
	.word 0x82022fd0  ! 916: ADD_I	add 	%r8, 0x0fd0, %r1
	.word 0x833a3001  ! 916: SRAX_I	srax	%r8, 0x0001, %r1
	.word 0xa6920009  ! 916: ORcc_R	orcc 	%r8, %r9, %r19
	.word 0xa0aa2dd8  ! 916: ANDNcc_I	andncc 	%r8, 0x0dd8, %r16
	.word 0x8e822890  ! 916: ADDcc_I	addcc 	%r8, 0x0890, %r7
	.word 0x8c3225ac  ! 917: SUBC_I	orn 	%r8, 0x05ac, %r6
	.word 0xbc3a0009  ! 917: XNOR_R	xnor 	%r8, %r9, %r30
	.word 0xa5782401  ! 917: MOVR_I	move	%r0, 0x9, %r18
	.word 0x98420009  ! 917: ADDC_R	addc 	%r8, %r9, %r12
	.word 0x85322001  ! 917: SRL_I	srl 	%r8, 0x0001, %r2
	.word 0x82b22474  ! 917: ORNcc_I	orncc 	%r8, 0x0474, %r1
	.word 0xbe920009  ! 917: ORcc_R	orcc 	%r8, %r9, %r31
	.word 0x882a24c0  ! 917: ANDN_I	andn 	%r8, 0x04c0, %r4
	.word 0xb29a26a8  ! 917: XORcc_I	xorcc 	%r8, 0x06a8, %r25
	.word 0x9b643801  ! 917: MOVcc_I	<illegal instruction>
	.word 0xac220009  ! 917: SUB_R	sub 	%r8, %r9, %r22
	.word 0xc53a0009  ! 922: STDF_R	std	%f2, [%r9, %r8]
	.word 0xcf020009  ! 922: LDF_R	ld	[%r8, %r9], %f7
	.word 0x996a2b00  ! 922: SDIVX_I	sdivx	%r8, 0x0b00, %r12
	.word 0x8e6a0009  ! 922: UDIVX_R	udivx 	%r8, %r9, %r7
	.word 0x0c800002  ! 925: BNEG	bneg  	<label_0x2>
	.word 0x88fa0009  ! 925: SDIVcc_R	sdivcc 	%r8, %r9, %r4
	.word 0x848a2de0  ! 926: ANDcc_I	andcc 	%r8, 0x0de0, %r2
	.word 0x94b20009  ! 926: SUBCcc_R	orncc 	%r8, %r9, %r10
	.word 0xa6820009  ! 926: ADDcc_R	addcc 	%r8, %r9, %r19
	.word 0x8b3a0009  ! 926: SRA_R	sra 	%r8, %r9, %r5
	.word 0xbab20009  ! 926: ORNcc_R	orncc 	%r8, %r9, %r29
	.word 0x872a3001  ! 926: SLLX_I	sllx	%r8, 0x0001, %r3
	.word 0x843226d0  ! 926: SUBC_I	orn 	%r8, 0x06d0, %r2
	.word 0x9e8228ac  ! 926: ADDcc_I	addcc 	%r8, 0x08ac, %r15
	.word 0xa81a22a4  ! 926: XOR_I	xor 	%r8, 0x02a4, %r20
	.word 0x881a0009  ! 926: XOR_R	xor 	%r8, %r9, %r4
	.word 0xa8022de4  ! 926: ADD_I	add 	%r8, 0x0de4, %r20
	.word 0x88922508  ! 926: ORcc_I	orcc 	%r8, 0x0508, %r4
	.word 0x8e2a22cc  ! 926: ANDN_I	andn 	%r8, 0x02cc, %r7
	.word 0x26800002  ! 930: BL	bl,a	<label_0x2>
	.word 0x9c720009  ! 930: UDIV_R	udiv 	%r8, %r9, %r14
	.word 0xee220009  ! 934: STW_R	stw	%r23, [%r8 + %r9]
	.word 0xce120009  ! 934: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0x8cfa2f4c  ! 934: SDIVcc_I	sdivcc 	%r8, 0x0f4c, %r6
	.word 0x8ef20009  ! 934: UDIVcc_R	udivcc 	%r8, %r9, %r7
	.word 0x20800002  ! 937: BN	bn,a	<label_0x2>
	.word 0x966a0009  ! 937: UDIVX_R	udivx 	%r8, %r9, %r11
	.word 0xf8320009  ! 942: STH_R	sth	%r28, [%r8 + %r9]
	.word 0xce5a0009  ! 942: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xcc120009  ! 942: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0x847223b4  ! 942: UDIV_I	udiv 	%r8, 0x03b4, %r2
	.word 0xf0220009  ! 947: STW_R	stw	%r24, [%r8 + %r9]
	.word 0xfa5a0009  ! 947: LDX_R	ldx	[%r8 + %r9], %r29
	.word 0x84220009  ! 947: SUB_R	sub 	%r8, %r9, %r2
	.word 0x847a0009  ! 947: SDIV_R	sdiv 	%r8, %r9, %r2
	.word 0x24800002  ! 950: BLE	ble,a	<label_0x2>
	.word 0x8c6a0009  ! 950: UDIVX_R	udivx 	%r8, %r9, %r6
	.word 0xcf3a0009  ! 955: STDF_R	std	%f7, [%r9, %r8]
	.word 0xca0a0009  ! 955: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xc4522548  ! 955: LDSH_I	ldsh	[%r8 + 0x0548], %r2
	.word 0x88f22058  ! 955: UDIVcc_I	udivcc 	%r8, 0x0058, %r4
	.word 0x88322d5c  ! 956: ORN_I	orn 	%r8, 0x0d5c, %r4
	.word 0x89780409  ! 956: MOVR_R	move	%r0, %r9, %r4
	.word 0x8e322878  ! 956: ORN_I	orn 	%r8, 0x0878, %r7
	.word 0x84c22f3c  ! 956: ADDCcc_I	addccc 	%r8, 0x0f3c, %r2
	.word 0x8b3a0009  ! 956: SRA_R	sra 	%r8, %r9, %r5
	.word 0xba2a0009  ! 956: ANDN_R	andn 	%r8, %r9, %r29
	.word 0xa8222e68  ! 956: SUB_I	sub 	%r8, 0x0e68, %r20
	.word 0x8a2a0009  ! 956: ANDN_R	andn 	%r8, %r9, %r5
	.word 0x9e3a271c  ! 956: XNOR_I	xnor 	%r8, 0x071c, %r15
	.word 0x88322258  ! 956: ORN_I	orn 	%r8, 0x0258, %r4
	.word 0x88b20009  ! 956: SUBCcc_R	orncc 	%r8, %r9, %r4
	.word 0xb42a0009  ! 956: ANDN_R	andn 	%r8, %r9, %r26
	.word 0xad320009  ! 956: SRL_R	srl 	%r8, %r9, %r22
	.word 0x861a0009  ! 956: XOR_R	xor 	%r8, %r9, %r3
	.word 0x82320009  ! 956: ORN_R	orn 	%r8, %r9, %r1
	.word 0x34800001  ! 961: BG	bg,a	<label_0x1>
	.word 0x866a23f4  ! 961: UDIVX_I	udivx 	%r8, 0x03f4, %r3
	.word 0x38800002  ! 963: BGU	bgu,a	<label_0x2>
	.word 0x896a2dd8  ! 963: SDIVX_I	sdivx	%r8, 0x0dd8, %r4
	.word 0xb4320009  ! 965: ORN_R	orn 	%r8, %r9, %r26
	.word 0xa6820009  ! 965: ADDcc_R	addcc 	%r8, %r9, %r19
	.word 0x86122170  ! 965: OR_I	or 	%r8, 0x0170, %r3
	.word 0x884223bc  ! 965: ADDC_I	addc 	%r8, 0x03bc, %r4
	.word 0x84020009  ! 965: ADD_R	add 	%r8, %r9, %r2
	.word 0x869a2bd4  ! 965: XORcc_I	xorcc 	%r8, 0x0bd4, %r3
	.word 0x8c1a2e64  ! 965: XOR_I	xor 	%r8, 0x0e64, %r6
	.word 0xa2b20009  ! 965: SUBCcc_R	orncc 	%r8, %r9, %r17
	.word 0xb9322001  ! 965: SRL_I	srl 	%r8, 0x0001, %r28
	.word 0xb80a0009  ! 965: AND_R	and 	%r8, %r9, %r28
	.word 0x8aa228fc  ! 965: SUBcc_I	subcc 	%r8, 0x08fc, %r5
	.word 0x94920009  ! 965: ORcc_R	orcc 	%r8, %r9, %r10
	.word 0x863a249c  ! 965: XNOR_I	xnor 	%r8, 0x049c, %r3
	.word 0x86420009  ! 965: ADDC_R	addc 	%r8, %r9, %r3
	.word 0xbe422618  ! 967: ADDC_I	addc 	%r8, 0x0618, %r31
	.word 0x95780409  ! 967: MOVR_R	move	%r0, %r9, %r10
	.word 0xa0a22964  ! 967: SUBcc_I	subcc 	%r8, 0x0964, %r16
	.word 0x8ac2271c  ! 967: ADDCcc_I	addccc 	%r8, 0x071c, %r5
	.word 0x9c020009  ! 967: ADD_R	add 	%r8, %r9, %r14
	.word 0x8a022750  ! 967: ADD_I	add 	%r8, 0x0750, %r5
	.word 0x96320009  ! 967: SUBC_R	orn 	%r8, %r9, %r11
	.word 0x8ca22458  ! 967: SUBcc_I	subcc 	%r8, 0x0458, %r6
	.word 0xb032229c  ! 967: SUBC_I	orn 	%r8, 0x029c, %r24
	.word 0x8aaa0009  ! 967: ANDNcc_R	andncc 	%r8, %r9, %r5
	.word 0x88b22f28  ! 967: SUBCcc_I	orncc 	%r8, 0x0f28, %r4
	.word 0x8b643801  ! 967: MOVcc_I	<illegal instruction>
	.word 0xaa922188  ! 968: ORcc_I	orcc 	%r8, 0x0188, %r21
	.word 0xb4220009  ! 968: SUB_R	sub 	%r8, %r9, %r26
	.word 0x829a0009  ! 968: XORcc_R	xorcc 	%r8, %r9, %r1
	.word 0x8c9a0009  ! 968: XORcc_R	xorcc 	%r8, %r9, %r6
	.word 0x94c22e3c  ! 968: ADDCcc_I	addccc 	%r8, 0x0e3c, %r10
	.word 0x8e920009  ! 968: ORcc_R	orcc 	%r8, %r9, %r7
	.word 0x88b22470  ! 968: ORNcc_I	orncc 	%r8, 0x0470, %r4
	.word 0xa0ba2530  ! 968: XNORcc_I	xnorcc 	%r8, 0x0530, %r16
	.word 0xb0422478  ! 968: ADDC_I	addc 	%r8, 0x0478, %r24
	.word 0xbaba0009  ! 968: XNORcc_R	xnorcc 	%r8, %r9, %r29
	.word 0xb2c20009  ! 968: ADDCcc_R	addccc 	%r8, %r9, %r25
	.word 0x8d643801  ! 968: MOVcc_I	<illegal instruction>
	.word 0x88122bbc  ! 968: OR_I	or 	%r8, 0x0bbc, %r4
	.word 0x853a0009  ! 968: SRA_R	sra 	%r8, %r9, %r2
	.word 0xb6322b60  ! 969: SUBC_I	orn 	%r8, 0x0b60, %r27
	.word 0x8a8a2634  ! 969: ANDcc_I	andcc 	%r8, 0x0634, %r5
	.word 0x8a420009  ! 969: ADDC_R	addc 	%r8, %r9, %r5
	.word 0xb7641809  ! 969: MOVcc_R	<illegal instruction>
	.word 0x82422688  ! 969: ADDC_I	addc 	%r8, 0x0688, %r1
	.word 0xb2aa0009  ! 969: ANDNcc_R	andncc 	%r8, %r9, %r25
	.word 0x82c20009  ! 969: ADDCcc_R	addccc 	%r8, %r9, %r1
	.word 0xb5643801  ! 969: MOVcc_I	<illegal instruction>
	.word 0x8d780409  ! 969: MOVR_R	move	%r0, %r9, %r6
	.word 0xa0a20009  ! 969: SUBcc_R	subcc 	%r8, %r9, %r16
	.word 0x8d643801  ! 970: MOVcc_I	<illegal instruction>
	.word 0x87320009  ! 970: SRL_R	srl 	%r8, %r9, %r3
	.word 0x8aa20009  ! 970: SUBcc_R	subcc 	%r8, %r9, %r5
	.word 0x9b2a2001  ! 970: SLL_I	sll 	%r8, 0x0001, %r13
	.word 0xac420009  ! 970: ADDC_R	addc 	%r8, %r9, %r22
	.word 0x823a0009  ! 970: XNOR_R	xnor 	%r8, %r9, %r1
	.word 0xa2c20009  ! 970: ADDCcc_R	addccc 	%r8, %r9, %r17
	.word 0x84b20009  ! 970: SUBCcc_R	orncc 	%r8, %r9, %r2
	.word 0xbe32210c  ! 970: ORN_I	orn 	%r8, 0x010c, %r31
	.word 0x8b2a3001  ! 970: SLLX_I	sllx	%r8, 0x0001, %r5
	.word 0x89321009  ! 970: SRLX_R	srlx	%r8, %r9, %r4
	.word 0x953a3001  ! 970: SRAX_I	srax	%r8, 0x0001, %r10
	.word 0x852a1009  ! 970: SLLX_R	sllx	%r8, %r9, %r2
	.word 0x89641809  ! 970: MOVcc_R	<illegal instruction>
	.word 0xb68a21e0  ! 970: ANDcc_I	andcc 	%r8, 0x01e0, %r27
	.word 0x04ca0001  ! 973: BRLEZ	brlez  ,pt	%8,<label_0xa0001>
	.word 0x8a7a2d30  ! 973: SDIV_I	sdiv 	%r8, 0x0d30, %r5
	.word 0xbeb20009  ! 975: SUBCcc_R	orncc 	%r8, %r9, %r31
	.word 0x8c122b50  ! 975: OR_I	or 	%r8, 0x0b50, %r6
	.word 0xab320009  ! 975: SRL_R	srl 	%r8, %r9, %r21
	.word 0x9d780409  ! 975: MOVR_R	move	%r0, %r9, %r14
	.word 0xb6a20009  ! 975: SUBcc_R	subcc 	%r8, %r9, %r27
	.word 0xa2820009  ! 975: ADDcc_R	addcc 	%r8, %r9, %r17
	.word 0x9b323001  ! 975: SRLX_I	srlx	%r8, 0x0001, %r13
	.word 0xbf323001  ! 975: SRLX_I	srlx	%r8, 0x0001, %r31
	.word 0x88ba2028  ! 975: XNORcc_I	xnorcc 	%r8, 0x0028, %r4
	.word 0xb4b22fd0  ! 975: SUBCcc_I	orncc 	%r8, 0x0fd0, %r26
	.word 0x9b322001  ! 975: SRL_I	srl 	%r8, 0x0001, %r13
	.word 0x8a322624  ! 975: ORN_I	orn 	%r8, 0x0624, %r5
	.word 0x8e3a2250  ! 975: XNOR_I	xnor 	%r8, 0x0250, %r7
	.word 0x04800002  ! 977: BLE	ble  	<label_0x2>
	.word 0x827a0009  ! 977: SDIV_R	sdiv 	%r8, %r9, %r1
	.word 0xe8720009  ! 982: STX_R	stx	%r20, [%r8 + %r9]
	.word 0xe0020009  ! 982: LDUW_R	lduw	[%r8 + %r9], %r16
	.word 0x8a722008  ! 982: UDIV_I	udiv 	%r8, 0x0008, %r5
	.word 0x8f6a2a9c  ! 982: SDIVX_I	sdivx	%r8, 0x0a9c, %r7
	.word 0xa3641809  ! 986: MOVcc_R	<illegal instruction>
	.word 0xac020009  ! 986: ADD_R	add 	%r8, %r9, %r22
	.word 0x8e822360  ! 986: ADDcc_I	addcc 	%r8, 0x0360, %r7
	.word 0x8d2a3001  ! 986: SLLX_I	sllx	%r8, 0x0001, %r6
	.word 0x98a2293c  ! 986: SUBcc_I	subcc 	%r8, 0x093c, %r12
	.word 0x8eb20009  ! 986: SUBCcc_R	orncc 	%r8, %r9, %r7
	.word 0x8e020009  ! 986: ADD_R	add 	%r8, %r9, %r7
	.word 0x952a0009  ! 986: SLL_R	sll 	%r8, %r9, %r10
	.word 0x8ab223b4  ! 986: SUBCcc_I	orncc 	%r8, 0x03b4, %r5
	.word 0xaa320009  ! 986: ORN_R	orn 	%r8, %r9, %r21
	.word 0x85643801  ! 986: MOVcc_I	<illegal instruction>
	.word 0x89780409  ! 986: MOVR_R	move	%r0, %r9, %r4
	.word 0x8eaa20fc  ! 986: ANDNcc_I	andncc 	%r8, 0x00fc, %r7
	.word 0x9c1a273c  ! 986: XOR_I	xor 	%r8, 0x073c, %r14
	.word 0x8a922658  ! 986: ORcc_I	orcc 	%r8, 0x0658, %r5
	.word 0xc8220009  ! 990: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xd45a0009  ! 990: LDX_R	ldx	[%r8 + %r9], %r10
	.word 0xbcf22fec  ! 990: UDIVcc_I	udivcc 	%r8, 0x0fec, %r30
	.word 0x886a0009  ! 990: UDIVX_R	udivx 	%r8, %r9, %r4
	.word 0xdd220009  ! 994: STF_R	st	%f14, [%r9, %r8]
	.word 0xc41a0009  ! 994: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x8afa2d7c  ! 994: SDIVcc_I	sdivcc 	%r8, 0x0d7c, %r5
	.word 0x8cfa2b2c  ! 994: SDIVcc_I	sdivcc 	%r8, 0x0b2c, %r6
	.word 0xfd220009  ! 998: STF_R	st	%f30, [%r9, %r8]
	.word 0xe65a0009  ! 998: LDX_R	ldx	[%r8 + %r9], %r19
	.word 0xb87a2080  ! 998: SDIV_I	sdiv 	%r8, 0x0080, %r28
	.word 0x8e6a0009  ! 998: UDIVX_R	udivx 	%r8, %r9, %r7
	nop
	nop
	nop
        ta      T_GOOD_TRAP

.data
	.word  0x5658cb68,0x0b957a6e,0x38644953,0x9043f59b
	.word  0xd080b92b,0x89c9660a,0xfbfcfd94,0x29853818
	.word  0x13f18e78,0x07aa430b,0xdcdf74af,0xa8e35888
	.word  0x43641445,0x2e0f6b14,0x1f303e89,0x5a31e810
	.word  0xb636e276,0x52f36929,0x2d63d64d,0x3de557a8
	.word  0xcbb932da,0x570cb609,0xe7d91cdf,0x06cc0592
	.word  0x162ac3df,0xc7639629,0x879647f0,0xea7a34f8
	.word  0x187dcde4,0x2cf5d228,0x7c324783,0x42c498ed
	.word  0x7ba3ff02,0x27e268f4,0x17e5b50b,0xa5ed3a91
	.word  0xdf4bd532,0xe0b6e3ed,0x96f26b28,0xeec81164
	.word  0xe28f5acf,0x4e8f584f,0x71b46a0e,0x08d23384
	.word  0x3f8c88e7,0x2cdd29da,0x66111e98,0x883efc33
	.word  0x5f67c114,0xcb2a8a15,0xeadca1c1,0x626f3f8c
	.word  0xc09ba5af,0xce7bcdfe,0x52d9da9b,0x020e637f
	.word  0xf8ee6f69,0x0867a364,0x8f9d955d,0xcc7cd1de
	.word  0xd32ad713,0x072f8fc4,0xc4340f85,0x6e4f2fe0
	.word  0xda215ee6,0xb3d6bcd2,0x84e5e850,0xb54a8522
	.word  0x9ec4016c,0xd24595a3,0x151129ca,0x66ba164c
	.word  0x5d077ea5,0xa2f2b316,0x83474328,0xba6cdc37
	.word  0x7fa8e1b2,0xab85a435,0xb8ec2190,0xe0021151
	.word  0x7a2b1a5a,0x13bdd269,0xf762bd46,0x1f44806e
	.word  0xdcd34dd1,0xc493f818,0xbf647b5f,0xa182732e
	.word  0xf8be5551,0x134f606b,0xac35ba0d,0xe4ccd9e3
	.word  0xa7f3aec6,0xe2416a86,0x84fb7882,0x201af581
	.word  0x90affc53,0x7caf25f3,0x3502f372,0x908e9dd0
	.word  0x9c9fc3ea,0xdcea3387,0x62d82ae7,0x6afe526a
	.word  0x33b5c146,0x5b2f1632,0x9af8578b,0xdbcd528e
	.word  0x2d609187,0x216a9812,0xe8568549,0xd07f5676
	.word  0x866fa033,0x13e4a6a9,0x60bf7a56,0xc0762b75
	.word  0x4c03e36a,0x1685a7c2,0x3c889cb5,0x5e839291
	.word  0x5da47fdd,0x91d26b70,0x5dd19ca6,0x4e2f6c0e
	.word  0xd795554c,0x8da3e656,0x497b75cf,0xf68eb408
	.word  0x79c236b0,0x88469114,0xc559cc61,0x32414a99
	.word  0x5abf1641,0x8b280b84,0x37a465c5,0x5f684c6a
	.word  0x088da5a9,0x814cb4c4,0x737e7912,0x31e2b76b
	.word  0xbfd9c8e6,0x5c159d30,0x41a41890,0x6e66c3ba
	.word  0x3f1c5df4,0xfbea8cc0,0x61b1c935,0x8f03903e
	.word  0x063289b2,0xf0771a96,0x6b8c71bd,0x78dd5bef
	.word  0x0b1ad895,0x31e1f8f2,0xc04fb59c,0xfc761406
	.word  0x4a780555,0x1ff52eaa,0x5c2b292d,0xc92b8e29
	.word  0x3297a384,0xd2c622b6,0xd7200755,0xc85d59f9
	.word  0xb26da76a,0xf20f10b3,0x30cb885f,0xb9386516
	.word  0xc7350a28,0x58957ac8,0x96b61153,0xddb1655a
	.word  0xfd75b07d,0x124092e1,0xf0bdb9e1,0xc019b029
	.word  0xb745f68a,0xde28aec1,0x5763442f,0x9c635b06
	.word  0x75645032,0x2cea545b,0x36cfb552,0x615b53cc
	.word  0xaa80d427,0xfaa17fef,0x824ea261,0xd883e44b
	.word  0x96d6547c,0x511077a5,0x65802a33,0x19790aea
	.word  0xf32e103e,0xb62b87a6,0xf07666a4,0xa232a1cb
	.word  0xd358c98c,0x7b53bc84,0x0f978bd7,0xb51e558c
	.word  0x604f48e8,0xd119d123,0xa7cf2f3b,0x30c8f701
	.word  0xe8523e50,0x917436ce,0x8fd17b63,0xdf3f9dfc
	.word  0xba0ec098,0x563f734a,0xc85c108f,0x3c24fd6b
	.word  0x199668e8,0x459d9213,0xb5e6250d,0xbfa951a0
	.word  0x1959d335,0xd7249deb,0xee6f575f,0xad213c5c
	.word  0xf7fc9643,0xa6092721,0x2365178c,0xe7671804
	.word  0x6b3df028,0x1074318f,0xd713c600,0x8971eb30
	.word  0x6890eae3,0x42043583,0x0315e598,0xfe4c447f
	.word  0x52c41608,0x6ad9839f,0x6e9a5e91,0xba9d918b
	.word  0x50605da8,0x22da2ac3,0x01a2d8ad,0x88b0adb7
	.word  0x99092ce0,0x282d58a8,0xac0ea18a,0xed050606
	.word  0xf2db8b1d,0x934862f9,0x54f1818d,0x6496ae04
	.word  0x9b51ad87,0x43152d57,0x0041cf8a,0xa4e7cc35
	.word  0x1630b81e,0x9d62976f,0xfcd0ea64,0x478fb089
	.word  0xe0f1dfde,0x6c0c2ce0,0x38791910,0x5cc75b25
	.word  0xa88a2433,0x790129db,0x79e86bd9,0x0d0df004
	.word  0xfa057f62,0x7e58109d,0xafcd613b,0xcb84c642
	.word  0x9b15fbe7,0xbb6570e6,0x020473d8,0xf808c99d
	.word  0xea6b9c27,0x1e2f3f35,0xc440f747,0x5f2b1f80
	.word  0xb2f20d13,0x3c4edd5f,0x11469c37,0xcfd2ca9e
	.word  0x87e07548,0xdc439277,0x68651f31,0x9463ae62
	.word  0x70b91e2e,0x5d9ad252,0x435ffde2,0xa637c20b
	.word  0x9bde038b,0x7b5c611c,0xb70d4c8c,0x9abeaeff
	.word  0x608b2b4d,0x36b773eb,0x74071e4a,0x27f5aa8a
	.word  0xaaa74446,0x8d690c48,0xfef9a340,0x5c92b2e7
	.word  0x207e87ec,0x2e0855db,0xf3eac723,0xe4df5efa
	.word  0x0077c6ce,0xb3f7ae82,0xaa488d71,0xa3b1d768
	.word  0x7fec861b,0x450e149d,0xe0cfcbe6,0x47415c8c
	.word  0xeac3110b,0xd45c4305,0xc8b0727e,0x19671cc4
	.word  0x8458365e,0xb13a8758,0xd07e753a,0x7a9bd129
	.word  0x5dfed551,0xecaeac82,0xbab38c45,0x03c70c99
	.word  0x444b6d88,0x7284f442,0x51f72405,0xa76b655c
	.word  0x6fb87b79,0x5c059fd6,0x8d2a5f5c,0x8c54fe23
	.word  0x7aa283ae,0x8646c31b,0x586e708a,0x93ffd6a6
	.word  0xfcf820d5,0x85cb56c8,0x42a1f378,0x203deb8b
	.word  0x69bbb493,0xfa20f281,0xc09a9728,0x098d3dbf
	.word  0xdb587f4f,0x299659af,0x41a3ef63,0xe85c02f9
	.word  0x4a1f1c80,0xa5788cdb,0x52d93ed6,0xf1f16358
	.word  0xbfb000a7,0x345ecf41,0x3cc180bf,0xb3fc5d2c
	.word  0x9acad090,0x6997ad39,0x320a591e,0xfbae76fd
	.word  0x853b0019,0x7cc1e199,0xa4a15949,0xde512fbe
	.word  0xa2b25eb7,0xdbf89b4e,0x73152a86,0xca56c2c3
	.word  0x1276542f,0x08cde1db,0x6037e007,0x7cb54579
	.word  0x2b3e5c4d,0x6abd0a95,0xae2de104,0x949b3fcd
	.word  0x72b5fb5b,0xb4d2c010,0xa48c3b18,0xaa1b55cf
	.word  0xae86dfce,0x9e2bd913,0x4aeb49cd,0x6f5c2816
	.word  0xf8ab199f,0x20742181,0xf5a62584,0x482287b3
	.word  0x133435e1,0x8d9acb9b,0xe48683a0,0x66c13d7f
	.word  0x722a1f74,0x8bda38af,0x611eff46,0x8938b95a
	.word  0xbd60b643,0x01b25ec0,0xae73daa8,0xa55a8df2
	.word  0xbf563cdd,0xd0be7d47,0x602e7c99,0x154098e2
	.word  0xd188dd7e,0xd9f41bbc,0xe1a69104,0x96906086
	.word  0x285cd595,0xbfb1fe37,0x390021fa,0x87b153cf
	.word  0x04f25e13,0x56c60c7f,0xb1227ff2,0x567d9a12
	.word  0x357904e2,0xc096715e,0xddb3153d,0xade0e3c1
	.word  0x012d05db,0xca303d02,0xe2be9a0a,0xf66fe600
	.word  0xf6b92b85,0x37c2f2e7,0x8155e043,0x780b24d7
	.word  0x3e097232,0x096b3f48,0xd05b3565,0x6c8e91cf
	.word  0xab4b6d8c,0x1022d288,0xd67b5d75,0x9d6d34c5
	.word  0xac983d19,0xdf43604a,0x3abe60db,0x37cf50c7
	.word  0xb8b52e4d,0xd71b30eb,0xe9cec4a8,0xbe24ba9c
	.word  0x2f91b1f9,0x72d8d868,0x44139cff,0x4e18d131
	.word  0x4aa8fbd4,0x2fd12fa0,0xcea45037,0x58eb5e67
	.word  0xbce88edf,0x13cbb2dc,0x0e146cfd,0xf467e8a5
	.word  0x62194ccd,0x5ba50bb8,0xb76a1513,0x3a6e9008
	.word  0xf228faea,0x43df8c47,0x20bd5601,0x686821e0
	.word  0x220d7f24,0x9a69d2e0,0xa42626bb,0x4d647627
	.word  0x847cd7e9,0xbd074293,0x41be023e,0x5302c21a
	.word  0x67769405,0x19c26b85,0x14c68492,0x97fb2550
	.word  0x9100682a,0xf2c8709e,0x08371688,0xe75d9ff9
	.word  0xf92f698c,0x51b0535f,0x70680c03,0x71cfcb36
	.word  0x5eb6991a,0x42d2e138,0xc5f8116c,0xce180cb8
	.word  0xaadaa96c,0x6b422923,0x116d9d0e,0x247f225c
	.word  0x78f0dcd1,0x17b7ea82,0x0c3b0935,0x180be2ad
	.word  0x6c623b1c,0xadf8f710,0x49ae5156,0x056b8729
	.word  0xb484a7bc,0x863e23dd,0xaf4631a7,0xca593475
	.word  0xe9c9ab9a,0x30b159f1,0x4d2f2497,0x81cbba05
	.word  0x6598e63c,0xee662439,0x24a9c86a,0x027911de
	.word  0xe7890e32,0x4ca7f1d8,0xcb5f9ec6,0x51d1d239
	.word  0x964db1f8,0xe0a74b16,0xdfa310e7,0xd09d3bd8
	.word  0x69bda951,0xdf52576a,0x24f3c91f,0x86700185
	.word  0x38ee6664,0x1b025cb9,0x73b240e9,0xd2daeb1a
	.word  0x1c3d0913,0xca3d4995,0xf2723eaa,0x44ea0ed2
	.word  0xac422c89,0x02d76fe0,0x4b6a66a6,0x7f7f0bee
	.word  0xdd8455e4,0x641f2453,0x0b63e9f7,0x7c67a685
	.word  0x3959d579,0xc7623a6d,0x1bf6222e,0x8740ae89
	.word  0x8c371764,0x28aac189,0x2c8a31be,0x949fc2de
	.word  0x60e3f3bb,0x50f69356,0x6fd61805,0x9f0d0811
	.word  0xeb76dc3a,0x1cc39e67,0x2c432065,0x1d2bf4c8
	.word  0xee9ed3bd,0x8033f661,0xfcfe4836,0xa7003de4
	.word  0x850746d4,0x3e8dc1fe,0x3c9e8424,0x24274f86
	.word  0x32dfba3c,0x7b8c5710,0x52de5984,0x511f8f9c
	.word  0xffbe4c48,0x57b5a1cf,0x63f0d6ca,0x603fd9b0
	.word  0x5cfc7b08,0x80ec0448,0x3f6294ea,0xfebbdfcc
	.word  0xe4f3cd26,0x625471d1,0xb4db53f4,0x4bfb1a07
	.word  0x79f6404a,0x150fa0fa,0xeaa98058,0xa5930e11
	.word  0x0faae474,0x8daa6028,0x1efd9990,0xa7a258bd
	.word  0x436a865b,0x9047494a,0x61e83b8d,0xdfa92006
	.word  0x6fbfd152,0xd049688c,0xd415d8cd,0x26469a96
	.word  0x12ba2b0e,0x98ed23a5,0xf53bde97,0x9b6b978e
	.word  0xa698830d,0x7103f2a7,0x83640ce6,0xfb29bc59
	.word  0xf22c429d,0x772da509,0xc5a15559,0xb45bf64f
	.word  0x029a878d,0xc89ad6d3,0xbb2a8c99,0x48a8e17a
	.word  0xe55fd1bc,0x44ad2061,0x648b4156,0x350468ab
	.word  0xafce691c,0x387834b5,0xa2cc79ff,0xedc83995
	.word  0x54892493,0x1c0c7a1c,0x57cbefd4,0xa47e5a5b
	.word  0x458c6e80,0xa462168b,0x99c51510,0x6458c7f1
	.word  0x48d38573,0x79c0edcc,0x57c5f43b,0xbcf58541
	.word  0x4526633d,0xe8bb6916,0x4f487813,0x54eb67cf
	.word  0x04543c40,0xf1d7249d,0x20489d7c,0x0d242e85
	.word  0x82661973,0x54de3033,0x69398346,0x23a76e1d
	.word  0x95398e97,0x627d6c1f,0x56e3d7b4,0x366ac9f8
	.word  0x3ce620ef,0x2a7d8fb3,0x78703c50,0xfe7b4e76
	.word  0xa73dd084,0x74f6cf2c,0xf1046f8a,0xfe8e2372
	.word  0x01247bc9,0x93557ac6,0x05be5a6d,0xcd0c2630
	.word  0x27582883,0x39702df3,0xf0e8f482,0x7def6aec
	.word  0x78feeb1e,0xebe40e93,0x55178eb1,0x813db2cc
	.word  0xf4f16a9b,0x4840fda6,0x64ee0c17,0x04a7eb98
	.word  0xade940f9,0x82397b16,0x02c12311,0x54d852c8
	.word  0x3a36391c,0xb08ec6aa,0xe08bc679,0x286005c9
	.word  0x552e39cb,0x51890c55,0xf41f656d,0xf2ffbcdf
	.word  0xe97556dd,0x4ed38af7,0xe1e07b80,0x09126d3c
	.word  0x9bf1a659,0x68125637,0xd7e149d3,0xce441f8a
	.word  0xc570e23c,0xf33a9f05,0xf35d9fd5,0xb24194de
	.word  0x4c889116,0xf624f124,0x84563724,0xee7a6cee
	.word  0x127b3826,0xdbeeaf6b,0xafc1d5a9,0x68f06c2c
	.word  0xd017bb0f,0x0cd16312,0x62d3c43e,0xb34bb120
	.word  0xb338a02e,0x527dfa4a,0x9b299884,0x8d6d8c9a
	.word  0x298cc722,0xcb1f1426,0xc82d497f,0xe231fc9a
	.word  0xcf9ecc61,0xe33df9b9,0xb763ab9c,0xba387d77
	.word  0x536320f5,0xeaf23355,0xd961c6b9,0xe3faeeed
	.word  0x7d8f2c6f,0x4d3e781e,0xa3e44d74,0x1626f655
	.word  0x2748b7ed,0x49bbbfbe,0x558cc4ab,0xacadb0a3
	.word  0xd5eb8a28,0x80f4a5f8,0xef2aef85,0x1b145e51
	.word  0x32bae893,0x527b8cb4,0xf9bd9164,0x47a4f5ed
	.word  0xb293a49d,0xc8eb9d36,0x4232bebd,0x01abbfca
	.word  0x762d8718,0x6422e149,0xccd39f8d,0x361f48f1
	.word  0x76878c16,0xe41389d8,0x8d5d86d1,0x10b009f9
	.word  0xabb6d712,0x9f10b432,0xc2eec5fd,0x1f386620
	.word  0x34e70994,0x73798e96,0x7a598099,0x6e003ce8
	.word  0x8235cf67,0xe9f8109c,0x70578511,0xf351bcf9
	.word  0x62ed6724,0xca2ada96,0x51d78381,0xa0680f33
	.word  0x94c01517,0xa6e6626c,0xc91a5c1c,0xdf742719
	.word  0xb67c89c2,0x9170a917,0x99d0d0e0,0xf9db4e7e
	.word  0x42d097f2,0x12a313cb,0x8aed098b,0x6e067d52
	.word  0x1388e3fc,0xc3596285,0x174f81eb,0xa8f22074
	.word  0x2aba7935,0x59be127e,0x24639ccc,0x698d8583
	.word  0x237a1bbb,0x8e835331,0x26da64ad,0x121be4d4
	.word  0xb688a34d,0x27a69c0e,0x7aa7b195,0x783aeb41
	.word  0x43b4b598,0x2d9ebe6a,0x856d3e11,0x98896320
	.word  0x8f97863e,0xd554732a,0xe944160e,0x668d2188
	.word  0x54b7339d,0xc606453c,0x7d9a78ea,0xbc197ee9
	.word  0xd48cca9b,0x7cb5974d,0xa96e6247,0x54fc17d0
	.word  0xf54d77cf,0xce585cd6,0xbe796a0b,0x5a7562be
	.word  0x130a5f73,0x7ea73517,0x83a1cf82,0xb460c01c
	.word  0x0f768d94,0xc1858a57,0x26588afc,0xdd302b49
	.word  0x75298d91,0xfea33cb6,0x47c417af,0x0ba4f711
	.word  0x42c3c1be,0x891aae0f,0x3c99c873,0xe33f4313
	.word  0xf4df4a7c,0xd7b25610,0xbed9eb4a,0x51f94af0
	.word  0x30776ec1,0x09ee2a0f,0x2112b6ae,0x64f1a29d
	.word  0xfa16296f,0x0dbc604a,0x4907a18b,0x878fd85b
	.word  0x97cf23e5,0x5ba6373b,0x3e39e1ac,0xbef49b8f
	.word  0xef507856,0x20f5f072,0x14a058e5,0x62ebb9d7
	.word  0xf7c6e4f0,0xf570b782,0x49894760,0x7659f141
	.word  0x4395ef36,0x2f0f4068,0xadcadda1,0xe8c90ff0
	.word  0x19312a33,0xe76460f1,0x18bc1591,0xf4ca31e3
	.word  0x92b0f619,0xdfef493d,0x46c76706,0x1a25d247
	.word  0x567e3004,0x69ff3ff4,0x17a2befe,0xcb013eb3
	.word  0xe7cf85a3,0x1e48fae5,0xd26af248,0x200ccfb3
	.word  0x814f9b6d,0x8830972d,0x8c14c708,0x9e26f881
	.word  0x11f013b5,0x77b6f8f1,0x448cd9cc,0xa90957f2
	.word  0x7eb39d8d,0xfb78cee4,0x8acadec8,0x49f5babb
	.word  0x5653c915,0x2d84122a,0x7e620818,0x5556399d
	.word  0xd105910d,0xbbc03d54,0x8dcc9cc0,0x9767ccc4
	.word  0x4da277da,0xd125e5d6,0x6856872a,0x0426bc2c
	.word  0xaf5eee2d,0x52dc9885,0x226e634e,0x43b1a0d9
	.word  0x389b6f83,0xe42c1f0c,0x01d444a5,0x3c5a73f3
	.word  0x960ec74b,0xc6b24300,0x04bd4d12,0x41e9c834
	.word  0xf89254a9,0x4bbb077d,0x959c3c3b,0x3380055d
	.word  0x0ee79b58,0x9ef6a02d,0xa65bc386,0xcbe2bcd5
	.word  0x0fcc1a35,0x652d905d,0xf630dacc,0xb3f39f6b
	.word  0x9d14ab53,0x2d02b65a,0x588acd4d,0x198e2dc8
	.word  0x84cfe96e,0x71b43405,0x5d637440,0x9a73307d
	.word  0xbdc7ae18,0x0554de51,0xbb6766ae,0x27c7cb57
	.word  0x73643916,0xa0f42cb9,0x720b3e8e,0xe74de995
	.word  0x09cc2ad1,0xe6f30a8f,0x0f67bb0d,0xbbcfb212
	.word  0xabf5835b,0x42716161,0x1a1ec84a,0xb1a40268
	.word  0x15aad916,0x7f0bb24e,0xc28a167b,0xe4bf135d
	.word  0x5a2857d8,0x6c36d60c,0xca24277f,0x1467af6e
	.word  0xd52981d1,0x8ea3b1c6,0x79dc8751,0x4c5d7f39
	.word  0x04ab75c0,0x5800b2c0,0x9ae22c5b,0x8ffcf20f
	.word  0xda9d7523,0xaa84c0c3,0x73c2a319,0xb0b79900
	.word  0x7e32164d,0x88430965,0x01d82feb,0x8eb332eb
	.word  0x61786a01,0x126cb027,0x8d6246be,0xf9094104
	.word  0x05f3ec67,0xef7716cc,0x3b78a6ce,0x25a3d2c0
	.word  0x2cdc4027,0x8ed0eb72,0x23e1921a,0x6a06fe4a
	.word  0xd179a1e9,0x4ac2c1e9,0xf042d811,0x40801beb
	.word  0xf22dd8b8,0x2e4ea976,0x2fc68a83,0x9dcce796
	.word  0xcaad923d,0xc2363916,0xe3e073a2,0x50433c69
	.word  0x45533b62,0x007edf7f,0x2d0f3b7d,0x2c2fa975
	.word  0xc18096bb,0xd0650b4b,0x6e53b627,0xf13951fc
	.word  0xf8b9fb39,0xb63e8ee1,0xbcd149f5,0x5ea6d0aa
	.word  0x75347e3d,0x0a45d44b,0xcdf8dff3,0x0d3e1cda
	.word  0x7042e6cf,0x4ff4dce3,0x785fb8c2,0x3184f506
	.word  0x6e6e7ca2,0xec67419a,0x15d1e394,0x5632afa6
	.word  0xa02d0e2f,0x149d33a5,0x4cd8f036,0xf084b1fa

!!# /************************************************************
!!# *
!!# * File:         divs.j
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
!!#   IJ_set_ropr_fld (ijdefault, Fm_align_Simm13, "3'b111");
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
!! Rule   1 (line  117), Count:  1000  inst_block           -> inst_type 
!! Rule   2 (line  118), Count:  1000  inst_block           -> inst_block inst_type 
!! Rule   3 (line  121), Count:    90  inst_type            -> stb_raw_div 
!! Rule   5 (line  123), Count:    99  inst_type            -> br_div 
!! Rule   6 (line  124), Count:   106  inst_type            -> stb_raw_ld_div 
!! Rule   7 (line  125), Count:    17  inst_type            -> stb_raw_alu_div 
!! Rule   8 (line  126), Count:   106  inst_type            -> alu_burst 
!! Rule   9 (line  127), Count:   577  inst_type            -> div 
!! Rule  10 (line  133), Count:    99  load                 -> load_r 
!! Rule  11 (line  133), Count:     6  load                 -> load_i 
!! Rule  13 (line  136), Count:    48  div                  -> tUDIV_I 
!! Rule  14 (line  136), Count:    47  div                  -> tUDIV_R 
!! Rule  15 (line  136), Count:    55  div                  -> tSDIV_I 
!! Rule  16 (line  136), Count:    42  div                  -> tSDIV_R 
!! Rule  17 (line  136), Count:    47  div                  -> tSDIVX_R 
!! Rule  18 (line  136), Count:    45  div                  -> tSDIVX_I 
!! Rule  19 (line  136), Count:    54  div                  -> tUDIVX_R 
!! Rule  20 (line  136), Count:    41  div                  -> tUDIVX_I 
!! Rule  21 (line  136), Count:    53  div                  -> tUDIVcc_I 
!! Rule  22 (line  136), Count:    36  div                  -> tUDIVcc_R 
!! Rule  23 (line  136), Count:    58  div                  -> tSDIVcc_I 
!! Rule  24 (line  136), Count:    40  div                  -> tSDIVcc_R 
!! Rule  25 (line  139), Count:     0  load_i               -> tLDSB_I 
!! Rule  26 (line  139), Count:     0  load_i               -> tLDSH_I 
!! Rule  27 (line  139), Count:     0  load_i               -> tLDSW_I 
!! Rule  28 (line  139), Count:     0  load_i               -> tLDUB_I 
!! Rule  31 (line  139), Count:     1  load_i               -> tLDX_I 
!! Rule  32 (line  139), Count:     0  load_i               -> tLDD_I 
!! Rule  50 (line  145), Count:     7  br                   -> tBN 
!! Rule  51 (line  145), Count:     6  br                   -> tBNE 
!! Rule  52 (line  145), Count:     5  br                   -> tBE 
!! Rule  53 (line  145), Count:     3  br                   -> tBG 
!! Rule  54 (line  145), Count:     7  br                   -> tBLE 
!! Rule  55 (line  145), Count:     3  br                   -> tBGE 
!! Rule  56 (line  145), Count:     1  br                   -> tBL 
!! Rule  57 (line  145), Count:     5  br                   -> tBGU 
!! Rule  58 (line  145), Count:     0  br                   -> tBLEU 
!! Rule  59 (line  146), Count:     2  br                   -> tBCC 
!! Rule  60 (line  146), Count:     3  br                   -> tBCS 
!! Rule  61 (line  146), Count:     6  br                   -> tBPOS 
!! Rule  62 (line  146), Count:     4  br                   -> tBNEG 
!! Rule  63 (line  146), Count:     4  br                   -> tBVC 
!! Rule  64 (line  146), Count:     1  br                   -> tBVS 
!! Rule  65 (line  146), Count:     2  br                   -> tBRZ 
!! Rule  66 (line  146), Count:     3  br                   -> tBRLEZ 
!! Rule  67 (line  147), Count:     3  br                   -> tBRLZ 
!! Rule  68 (line  147), Count:     3  br                   -> tBRNZ 
!! Rule  69 (line  147), Count:     3  br                   -> tBRGZ 
!! Rule  70 (line  147), Count:     1  br                   -> tBRGEZ 
!! Rule  71 (line  147), Count:     6  br                   -> tCALL 
!! Rule  72 (line  150), Count:    15  store_r              -> tSTB_R 
!! Rule  73 (line  150), Count:    13  store_r              -> tSTH_R 
!! Rule  74 (line  150), Count:    15  store_r              -> tSTW_R 
!! Rule  75 (line  150), Count:    10  store_r              -> tSTX_R 
!! Rule  76 (line  150), Count:    16  store_r              -> tSTF_R 
!! Rule  77 (line  150), Count:    16  store_r              -> tSTDF_R 
!! Rule  78 (line  153), Count:     6  load_r               -> tLDSB_R 
!! Rule  79 (line  153), Count:     6  load_r               -> tLDSH_R 
!! Rule  80 (line  153), Count:     8  load_r               -> tLDSW_R 
!! Rule  81 (line  153), Count:    11  load_r               -> tLDUB_R 
!! Rule  82 (line  153), Count:     5  load_r               -> tLDUH_R 
!! Rule  83 (line  153), Count:     9  load_r               -> tLDUW_R 
!! Rule  84 (line  153), Count:    11  load_r               -> tLDX_R 
!! Rule  85 (line  153), Count:    12  load_r               -> tLDD_R 
!! Rule  86 (line  153), Count:    13  load_r               -> tLDF_R 
!! Rule  87 (line  153), Count:     9  load_r               -> tLDDF_R 
!! Rule  95 (line  156), Count:     0  alu                  -> tADDCcc_I 
!! Rule  96 (line  156), Count:     0  alu                  -> tAND_R 
!! Rule 102 (line  156), Count:     1  alu                  -> tANDNcc_R 
!! Rule 105 (line  156), Count:     0  alu                  -> tOR_I 
!! Rule 110 (line  156), Count:     0  alu                  -> tORNcc_R 
!! Rule 116 (line  156), Count:     0  alu                  -> tXNOR_R 
!! Rule 120 (line  156), Count:     0  alu                  -> tMOVcc_R 
!! Rule 122 (line  156), Count:     1  alu                  -> tMOVR_R 
!! Rule 125 (line  156), Count:     0  alu                  -> tSLL_I 
!! Rule 127 (line  156), Count:     0  alu                  -> tSRL_I 
!! Rule 128 (line  156), Count:     0  alu                  -> tSRA_R 
!! Rule 132 (line  156), Count:     0  alu                  -> tSRLX_R 
!! Rule 136 (line  156), Count:     0  alu                  -> tSUB_R 
!! Rule 139 (line  156), Count:     0  alu                  -> tSUBcc_I 
!! Rule 144 (line  156), Count:     1  alu                  -> tSUBCcc_I 
!! Rule 145 (line  159), Count:    99  br_div               -> br div 
!! Rule 146 (line  165), Count:    90  stb_raw_div          -> store_r load_r div 
!! Rule 148 (line  177), Count:   106  stb_raw_ld_div       -> store_r load_r load div 
!! Rule 149 (line  183), Count:    17  stb_raw_alu_div      -> store_r load_r alu div 
!! 
!!   257: Token tUDIV_I	Count = 49
!!   258: Token tUDIV_R	Count = 48
!!   259: Token tSDIV_I	Count = 56
!!   260: Token tSDIV_R	Count = 43
!!   261: Token tSDIVX_R	Count = 48
!!   262: Token tSDIVX_I	Count = 46
!!   263: Token tUDIVX_R	Count = 55
!!   264: Token tUDIVX_I	Count = 42
!!   265: Token tUDIVcc_I	Count = 54
!!   266: Token tUDIVcc_R	Count = 37
!!   267: Token tSDIVcc_I	Count = 59
!!   268: Token tSDIVcc_R	Count = 41
!!   269: Token tLDSB_I	Count = 1
!!   270: Token tLDSH_I	Count = 1
!!   271: Token tLDSW_I	Count = 1
!!   272: Token tLDUB_I	Count = 1
!!   273: Token tLDUH_I	Count = 0
!!   274: Token tLDUW_I	Count = 0
!!   275: Token tLDX_I	Count = 2
!!   276: Token tLDD_I	Count = 1
!!   277: Token tLDSBA_R	Count = 0
!!   278: Token tLDSBA_I	Count = 0
!!   279: Token tLDSHA_R	Count = 0
!!   280: Token tLDSHA_I	Count = 0
!!   281: Token tLDSWA_R	Count = 0
!!   282: Token tLDSWA_I	Count = 0
!!   283: Token tLDUBA_R	Count = 0
!!   284: Token tLDUBA_I	Count = 0
!!   285: Token tLDUHA_R	Count = 0
!!   286: Token tLDUHA_I	Count = 0
!!   287: Token tLDUWA_R	Count = 0
!!   288: Token tLDUWA_I	Count = 0
!!   289: Token tLDXA_R	Count = 0
!!   290: Token tLDXA_I	Count = 0
!!   291: Token tLDDA_R	Count = 0
!!   292: Token tLDDA_I	Count = 0
!!   293: Token tBA	Count = 0
!!   294: Token tBN	Count = 8
!!   295: Token tBNE	Count = 7
!!   296: Token tBE	Count = 6
!!   297: Token tBG	Count = 4
!!   298: Token tBLE	Count = 8
!!   299: Token tBGE	Count = 4
!!   300: Token tBL	Count = 2
!!   301: Token tBGU	Count = 6
!!   302: Token tBLEU	Count = 1
!!   303: Token tBCC	Count = 3
!!   304: Token tBCS	Count = 4
!!   305: Token tBPOS	Count = 7
!!   306: Token tBNEG	Count = 5
!!   307: Token tBVC	Count = 5
!!   308: Token tBVS	Count = 2
!!   309: Token tBRZ	Count = 3
!!   310: Token tBRLEZ	Count = 4
!!   311: Token tBRLZ	Count = 4
!!   312: Token tBRNZ	Count = 4
!!   313: Token tBRGZ	Count = 4
!!   314: Token tBRGEZ	Count = 2
!!   315: Token tCALL	Count = 7
!!   316: Token tSTB_R	Count = 16
!!   317: Token tSTH_R	Count = 14
!!   318: Token tSTW_R	Count = 16
!!   319: Token tSTX_R	Count = 11
!!   320: Token tSTF_R	Count = 17
!!   321: Token tSTDF_R	Count = 17
!!   322: Token tLDSB_R	Count = 7
!!   323: Token tLDSH_R	Count = 7
!!   324: Token tLDSW_R	Count = 9
!!   325: Token tLDUB_R	Count = 12
!!   326: Token tLDUH_R	Count = 6
!!   327: Token tLDUW_R	Count = 10
!!   328: Token tLDX_R	Count = 12
!!   329: Token tLDD_R	Count = 13
!!   330: Token tLDF_R	Count = 14
!!   331: Token tLDDF_R	Count = 10
!!   332: Token tADD_R	Count = 0
!!   333: Token tADD_I	Count = 0
!!   334: Token tADDcc_R	Count = 0
!!   335: Token tADDcc_I	Count = 0
!!   336: Token tADDC_R	Count = 0
!!   337: Token tADDC_I	Count = 0
!!   338: Token tADDCcc_R	Count = 0
!!   339: Token tADDCcc_I	Count = 1
!!   340: Token tAND_R	Count = 1
!!   341: Token tAND_I	Count = 0
!!   342: Token tANDcc_R	Count = 0
!!   343: Token tANDcc_I	Count = 0
!!   344: Token tANDN_R	Count = 0
!!   345: Token tANDN_I	Count = 0
!!   346: Token tANDNcc_R	Count = 2
!!   347: Token tANDNcc_I	Count = 0
!!   348: Token tOR_R	Count = 0
!!   349: Token tOR_I	Count = 1
!!   350: Token tORcc_R	Count = 0
!!   351: Token tORcc_I	Count = 0
!!   352: Token tORN_R	Count = 0
!!   353: Token tORN_I	Count = 0
!!   354: Token tORNcc_R	Count = 1
!!   355: Token tORNcc_I	Count = 0
!!   356: Token tXOR_R	Count = 0
!!   357: Token tXOR_I	Count = 0
!!   358: Token tXORcc_R	Count = 0
!!   359: Token tXORcc_I	Count = 0
!!   360: Token tXNOR_R	Count = 1
!!   361: Token tXNOR_I	Count = 0
!!   362: Token tXNORcc_R	Count = 0
!!   363: Token tXNORcc_I	Count = 0
!!   364: Token tMOVcc_R	Count = 1
!!   365: Token tMOVcc_I	Count = 0
!!   366: Token tMOVR_R	Count = 2
!!   367: Token tMOVR_I	Count = 0
!!   368: Token tSLL_R	Count = 0
!!   369: Token tSLL_I	Count = 1
!!   370: Token tSRL_R	Count = 0
!!   371: Token tSRL_I	Count = 1
!!   372: Token tSRA_R	Count = 1
!!   373: Token tSRA_I	Count = 0
!!   374: Token tSLLX_R	Count = 0
!!   375: Token tSLLX_I	Count = 0
!!   376: Token tSRLX_R	Count = 1
!!   377: Token tSRLX_I	Count = 0
!!   378: Token tSRAX_R	Count = 0
!!   379: Token tSRAX_I	Count = 0
!!   380: Token tSUB_R	Count = 1
!!   381: Token tSUB_I	Count = 0
!!   382: Token tSUBcc_R	Count = 0
!!   383: Token tSUBcc_I	Count = 1
!!   384: Token tSUBC_R	Count = 0
!!   385: Token tSUBC_I	Count = 0
!!   386: Token tSUBCcc_R	Count = 0
!!   387: Token tSUBCcc_I	Count = 2
!!   388: Token mMETA0	Count = 107
!! 
!! 
!! +++ finish +++

