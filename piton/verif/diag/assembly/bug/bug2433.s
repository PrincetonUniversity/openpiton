// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: bug2433.s
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
   random seed:	641143798
   Jal stb2.j:	
********************************************************************************/

#ifndef OVERRIDE_THREAD_COUNT
# define THREAD_COUNT 4
#endif
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
	rd %fprs, %g0
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
        setx  0x6a95a1544039128c, %g1, %r0
        setx  0x5da8eb4f087a0011, %g1, %r1
        setx  0xa3033408f154e7ee, %g1, %r2
        setx  0x609d086fc7f49efa, %g1, %r6
        setx  0x61227900b40ecc90, %g1, %r7
        setx  0xd86657fe9604d125, %g1, %r8
        setx  0x98f6335059052825, %g1, %r9
        setx  0x13f082876fa0e539, %g1, %r10
        setx  0xb74f0f949144f195, %g1, %r11
        setx  0x6599c9e2509a26de, %g1, %r12
        setx  0x45f7c2ccfa455393, %g1, %r13
        setx  0xd3fed12242f8b046, %g1, %r14
        setx  0xdfbe9df06ecb7f11, %g1, %r15
        setx  0x037c745a7c33e54e, %g1, %r16
        setx  0x85bb1b932194884f, %g1, %r17
        setx  0x5214e450bcab3804, %g1, %r18
        setx  0x89935d69ef5f4a0b, %g1, %r19
        setx  0x5348447f7551d33c, %g1, %r20
        setx  0x2365af61266fa5e6, %g1, %r21
        setx  0xf7ddcf45373b7d93, %g1, %r22
        setx  0x16816e8fdfec13a2, %g1, %r23
        setx  0xf3342ef25117e671, %g1, %r24
        setx  0xd9dc7ad542efaec0, %g1, %r25
        setx  0x8058e2197aa5587e, %g1, %r26
        setx  0x305cf2628bd7b9f8, %g1, %r27
        setx  0x1165eb2a4091eed8, %g1, %r28
        setx  0x6ca56e7cb79d8318, %g1, %r29
        setx  0x1fd5ea4653839560, %g1, %r30
        setx  0x36d2ce193205259a, %g1, %r31
	.word 0x87a109a5  ! 10: FDIVs	fdivs	%f4, %f5, %f3
	.word 0x81a10825  ! 11: FADDs	fadds	%f4, %f5, %f0
	.word 0x85a10825  ! 20: FADDs	fadds	%f4, %f5, %f2
	.word 0x81a109a5  ! 37: FDIVs	fdivs	%f4, %f5, %f0
	.word 0xef390005  ! 38: STDF_R	std	%f23, [%r5, %r4]
	.word 0x83a108a5  ! 39: FSUBs	fsubs	%f4, %f5, %f1
	.word 0xed210005  ! 40: STF_R	st	%f22, [%r5, %r4]
	.word 0x87a10925  ! 49: FMULs	fmuls	%f4, %f5, %f3
	.word 0xf32129c8  ! 74: STF_I	st	%f25, [0x09c8, %r4]
	.word 0xc3210005  ! 116: STF_R	st	%f1, [%r5, %r4]
	.word 0xc1390005  ! 117: STDF_R	std	%f0, [%r5, %r4]
	.word 0xc7392790  ! 127: STDF_I	std	%f3, [0x0790, %r4]
	.word 0xc3392358  ! 136: STDF_I	std	%f1, [0x0358, %r4]
	.word 0xbda109a5  ! 146: FDIVs	fdivs	%f4, %f5, %f30
	.word 0xbfa108a5  ! 147: FSUBs	fsubs	%f4, %f5, %f31
	.word 0xafa10925  ! 157: FMULs	fmuls	%f4, %f5, %f23
	.word 0xc1210005  ! 158: STF_R	st	%f0, [%r5, %r4]
	.word 0x85a10925  ! 167: FMULs	fmuls	%f4, %f5, %f2
	.word 0xb7a10925  ! 193: FMULs	fmuls	%f4, %f5, %f27
	.word 0xc1210005  ! 194: STF_R	st	%f0, [%r5, %r4]
	.word 0x85a109a5  ! 195: FDIVs	fdivs	%f4, %f5, %f2
	.word 0xaba10925  ! 196: FMULs	fmuls	%f4, %f5, %f21
	.word 0xe1392060  ! 214: STDF_I	std	%f16, [0x0060, %r4]
	.word 0xe5210005  ! 223: STF_R	st	%f18, [%r5, %r4]
	.word 0xc5210005  ! 224: STF_R	st	%f2, [%r5, %r4]
	.word 0xc3392510  ! 233: STDF_I	std	%f1, [0x0510, %r4]
	.word 0xc1210005  ! 234: STF_R	st	%f0, [%r5, %r4]
	.word 0xe73927f8  ! 244: STDF_I	std	%f19, [0x07f8, %r4]
	.word 0xc5210005  ! 245: STF_R	st	%f2, [%r5, %r4]
	.word 0xc5392520  ! 246: STDF_I	std	%f2, [0x0520, %r4]
	.word 0xa3a10825  ! 255: FADDs	fadds	%f4, %f5, %f17
	.word 0x87a10825  ! 273: FADDs	fadds	%f4, %f5, %f3
	.word 0xc3210005  ! 274: STF_R	st	%f1, [%r5, %r4]
	.word 0x87a10925  ! 291: FMULs	fmuls	%f4, %f5, %f3
	.word 0x85a108a5  ! 292: FSUBs	fsubs	%f4, %f5, %f2
	.word 0x87a10925  ! 293: FMULs	fmuls	%f4, %f5, %f3
	.word 0xff390005  ! 294: STDF_R	std	%f31, [%r5, %r4]
	.word 0xa5a108a5  ! 295: FSUBs	fsubs	%f4, %f5, %f18
	.word 0xd1390005  ! 304: STDF_R	std	%f8, [%r5, %r4]
	.word 0xc3392380  ! 314: STDF_I	std	%f1, [0x0380, %r4]
	.word 0x83a10825  ! 315: FADDs	fadds	%f4, %f5, %f1
	.word 0xcd212bdc  ! 316: STF_I	st	%f6, [0x0bdc, %r4]
	.word 0xc321264c  ! 326: STF_I	st	%f1, [0x064c, %r4]
	.word 0xc1390005  ! 327: STDF_R	std	%f0, [%r5, %r4]
	.word 0x9fa109a5  ! 337: FDIVs	fdivs	%f4, %f5, %f15
	.word 0xd9210005  ! 338: STF_R	st	%f12, [%r5, %r4]
	.word 0xc3212290  ! 339: STF_I	st	%f1, [0x0290, %r4]
	.word 0x95a108a5  ! 358: FSUBs	fsubs	%f4, %f5, %f10
	.word 0xc3210005  ! 359: STF_R	st	%f1, [%r5, %r4]
	.word 0x81a109a5  ! 360: FDIVs	fdivs	%f4, %f5, %f0
	.word 0xc3390005  ! 361: STDF_R	std	%f1, [%r5, %r4]
	.word 0x87a108a5  ! 362: FSUBs	fsubs	%f4, %f5, %f3
	.word 0xc5392a58  ! 363: STDF_I	std	%f2, [0x0a58, %r4]
	.word 0xc7210005  ! 372: STF_R	st	%f3, [%r5, %r4]
	.word 0x9fa10825  ! 415: FADDs	fadds	%f4, %f5, %f15
	.word 0x9fa10925  ! 416: FMULs	fmuls	%f4, %f5, %f15
	.word 0x83a10825  ! 417: FADDs	fadds	%f4, %f5, %f1
	.word 0xdf210005  ! 418: STF_R	st	%f15, [%r5, %r4]
	.word 0xc5390005  ! 419: STDF_R	std	%f2, [%r5, %r4]
	.word 0xcd210005  ! 428: STF_R	st	%f6, [%r5, %r4]
	.word 0xc13921b0  ! 446: STDF_I	std	%f0, [0x01b0, %r4]
	.word 0xc7210005  ! 456: STF_R	st	%f3, [%r5, %r4]
	.word 0xada109a5  ! 466: FDIVs	fdivs	%f4, %f5, %f22
	.word 0xa5a109a5  ! 467: FDIVs	fdivs	%f4, %f5, %f18
	.word 0xdd2121b0  ! 468: STF_I	st	%f14, [0x01b0, %r4]
	.word 0xd33922d8  ! 469: STDF_I	std	%f9, [0x02d8, %r4]
	.word 0xc3390005  ! 487: STDF_R	std	%f1, [%r5, %r4]
	.word 0xe9212a2c  ! 488: STF_I	st	%f20, [0x0a2c, %r4]
	.word 0xc7392450  ! 497: STDF_I	std	%f3, [0x0450, %r4]
	.word 0xc7390005  ! 507: STDF_R	std	%f3, [%r5, %r4]
	.word 0xc3392958  ! 516: STDF_I	std	%f1, [0x0958, %r4]
	.word 0xc1390005  ! 517: STDF_R	std	%f0, [%r5, %r4]
	.word 0xd7390005  ! 534: STDF_R	std	%f11, [%r5, %r4]
	.word 0x87a108a5  ! 586: FSUBs	fsubs	%f4, %f5, %f3
	.word 0x83a108a5  ! 595: FSUBs	fsubs	%f4, %f5, %f1
	.word 0x85a109a5  ! 613: FDIVs	fdivs	%f4, %f5, %f2
	.word 0xb5a10825  ! 622: FADDs	fadds	%f4, %f5, %f26
	.word 0xc1210005  ! 623: STF_R	st	%f0, [%r5, %r4]
	.word 0x93a10925  ! 624: FMULs	fmuls	%f4, %f5, %f9
	.word 0xd5392600  ! 625: STDF_I	std	%f10, [0x0600, %r4]
	.word 0xc1392c28  ! 626: STDF_I	std	%f0, [0x0c28, %r4]
	.word 0xc5390005  ! 643: STDF_R	std	%f2, [%r5, %r4]
	.word 0xc7210005  ! 652: STF_R	st	%f3, [%r5, %r4]
	.word 0xc5390005  ! 677: STDF_R	std	%f2, [%r5, %r4]
	.word 0xc7210005  ! 678: STF_R	st	%f3, [%r5, %r4]
	.word 0x87a10825  ! 679: FADDs	fadds	%f4, %f5, %f3
	.word 0x93a10925  ! 680: FMULs	fmuls	%f4, %f5, %f9
	.word 0x81a10925  ! 681: FMULs	fmuls	%f4, %f5, %f0
	.word 0xc7210005  ! 682: STF_R	st	%f3, [%r5, %r4]
	.word 0xbda108a5  ! 699: FSUBs	fsubs	%f4, %f5, %f30
	.word 0x87a109a5  ! 733: FDIVs	fdivs	%f4, %f5, %f3
	.word 0xa3a10825  ! 734: FADDs	fadds	%f4, %f5, %f17
	.word 0x87a10925  ! 735: FMULs	fmuls	%f4, %f5, %f3
	.word 0xc33921a8  ! 736: STDF_I	std	%f1, [0x01a8, %r4]
	.word 0x9ba10925  ! 762: FMULs	fmuls	%f4, %f5, %f13
	.word 0x85a10925  ! 763: FMULs	fmuls	%f4, %f5, %f2
	.word 0xc3390005  ! 764: STDF_R	std	%f1, [%r5, %r4]
	.word 0x99a109a5  ! 774: FDIVs	fdivs	%f4, %f5, %f12
	.word 0xc5210005  ! 775: STF_R	st	%f2, [%r5, %r4]
	.word 0x81a10825  ! 776: FADDs	fadds	%f4, %f5, %f0
	.word 0xc3390005  ! 801: STDF_R	std	%f1, [%r5, %r4]
	.word 0xc5392228  ! 802: STDF_I	std	%f2, [0x0228, %r4]
	.word 0xc3390005  ! 811: STDF_R	std	%f1, [%r5, %r4]
	.word 0xc3390005  ! 812: STDF_R	std	%f1, [%r5, %r4]
	.word 0xe1392570  ! 829: STDF_I	std	%f16, [0x0570, %r4]
	.word 0xa7a10825  ! 830: FADDs	fadds	%f4, %f5, %f19
	.word 0x87a109a5  ! 839: FDIVs	fdivs	%f4, %f5, %f3
	.word 0xc1210005  ! 858: STF_R	st	%f0, [%r5, %r4]
	.word 0x85a10925  ! 893: FMULs	fmuls	%f4, %f5, %f2
	.word 0x83a108a5  ! 918: FSUBs	fsubs	%f4, %f5, %f1
	.word 0xc1210005  ! 944: STF_R	st	%f0, [%r5, %r4]
	.word 0x87a10925  ! 945: FMULs	fmuls	%f4, %f5, %f3
	.word 0xf1390005  ! 970: STDF_R	std	%f24, [%r5, %r4]
	.word 0xb1a10825  ! 979: FADDs	fadds	%f4, %f5, %f24
	.word 0x85a109a5  ! 988: FDIVs	fdivs	%f4, %f5, %f2
	.word 0xc1392108  ! 989: STDF_I	std	%f0, [0x0108, %r4]
	.word 0x81a10925  ! 998: FMULs	fmuls	%f4, %f5, %f0
        ta      T_GOOD_TRAP

th_main_1:
        setx  MAIN_BASE_DATA_VA, %r1, %r4
	    setx  0x10, %r1, %r5
        setx  0x80, %g2, %g1
        wr  %g1, %g0, %asi
	    rd %fprs, %g0
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
        setx  0x6a95a1544039128c, %g1, %r0
        setx  0x5da8eb4f087a0011, %g1, %r1
        setx  0xa3033408f154e7ee, %g1, %r2
        setx  0x609d086fc7f49efa, %g1, %r6
        setx  0x61227900b40ecc90, %g1, %r7
        setx  0xd86657fe9604d125, %g1, %r8
        setx  0x98f6335059052825, %g1, %r9
        setx  0x13f082876fa0e539, %g1, %r10
        setx  0xb74f0f949144f195, %g1, %r11
        setx  0x6599c9e2509a26de, %g1, %r12
        setx  0x45f7c2ccfa455393, %g1, %r13
        setx  0xd3fed12242f8b046, %g1, %r14
        setx  0xdfbe9df06ecb7f11, %g1, %r15
        setx  0x037c745a7c33e54e, %g1, %r16
        setx  0x85bb1b932194884f, %g1, %r17
        setx  0x5214e450bcab3804, %g1, %r18
        setx  0x89935d69ef5f4a0b, %g1, %r19
        setx  0x5348447f7551d33c, %g1, %r20
        setx  0x2365af61266fa5e6, %g1, %r21
        setx  0xf7ddcf45373b7d93, %g1, %r22
        setx  0x16816e8fdfec13a2, %g1, %r23
        setx  0xf3342ef25117e671, %g1, %r24
        setx  0xd9dc7ad542efaec0, %g1, %r25
        setx  0x8058e2197aa5587e, %g1, %r26
        setx  0x305cf2628bd7b9f8, %g1, %r27
        setx  0x1165eb2a4091eed8, %g1, %r28
        setx  0x6ca56e7cb79d8318, %g1, %r29
        setx  0x1fd5ea4653839560, %g1, %r30
        setx  0x36d2ce193205259a, %g1, %r31
	.word 0x81a109a5  ! 10: FDIVs	fdivs	%f4, %f5, %f0
	.word 0x83a10825  ! 11: FADDs	fadds	%f4, %f5, %f1
	.word 0x85a10825  ! 20: FADDs	fadds	%f4, %f5, %f2
	.word 0x85a109a5  ! 37: FDIVs	fdivs	%f4, %f5, %f2
	.word 0xc1390005  ! 38: STDF_R	std	%f0, [%r5, %r4]
	.word 0xb5a108a5  ! 39: FSUBs	fsubs	%f4, %f5, %f26
	.word 0xd3210005  ! 40: STF_R	st	%f9, [%r5, %r4]
	.word 0xbda10925  ! 49: FMULs	fmuls	%f4, %f5, %f30
	.word 0xc5212908  ! 74: STF_I	st	%f2, [0x0908, %r4]
	.word 0xc7210005  ! 116: STF_R	st	%f3, [%r5, %r4]
	.word 0xc1390005  ! 117: STDF_R	std	%f0, [%r5, %r4]
	.word 0xc7392828  ! 127: STDF_I	std	%f3, [0x0828, %r4]
	.word 0xc5392dc8  ! 136: STDF_I	std	%f2, [0x0dc8, %r4]
	.word 0xbfa109a5  ! 146: FDIVs	fdivs	%f4, %f5, %f31
	.word 0xa1a108a5  ! 147: FSUBs	fsubs	%f4, %f5, %f16
	.word 0xa5a10925  ! 157: FMULs	fmuls	%f4, %f5, %f18
	.word 0xd1210005  ! 158: STF_R	st	%f8, [%r5, %r4]
	.word 0x85a10925  ! 167: FMULs	fmuls	%f4, %f5, %f2
	.word 0xb3a10925  ! 193: FMULs	fmuls	%f4, %f5, %f25
	.word 0xc7210005  ! 194: STF_R	st	%f3, [%r5, %r4]
	.word 0x85a109a5  ! 195: FDIVs	fdivs	%f4, %f5, %f2
	.word 0xb3a10925  ! 196: FMULs	fmuls	%f4, %f5, %f25
	.word 0xc1392b38  ! 214: STDF_I	std	%f0, [0x0b38, %r4]
	.word 0xfd210005  ! 223: STF_R	st	%f30, [%r5, %r4]
	.word 0xc7210005  ! 224: STF_R	st	%f3, [%r5, %r4]
	.word 0xc3392bc8  ! 233: STDF_I	std	%f1, [0x0bc8, %r4]
	.word 0xc1210005  ! 234: STF_R	st	%f0, [%r5, %r4]
	.word 0xf93920d8  ! 244: STDF_I	std	%f28, [0x00d8, %r4]
	.word 0xc7210005  ! 245: STF_R	st	%f3, [%r5, %r4]
	.word 0xf7392150  ! 246: STDF_I	std	%f27, [0x0150, %r4]
	.word 0xbfa10825  ! 255: FADDs	fadds	%f4, %f5, %f31
	.word 0xb3a10825  ! 273: FADDs	fadds	%f4, %f5, %f25
	.word 0xc5210005  ! 274: STF_R	st	%f2, [%r5, %r4]
	.word 0x83a10925  ! 291: FMULs	fmuls	%f4, %f5, %f1
	.word 0xb7a108a5  ! 292: FSUBs	fsubs	%f4, %f5, %f27
	.word 0x83a10925  ! 293: FMULs	fmuls	%f4, %f5, %f1
	.word 0xc1390005  ! 294: STDF_R	std	%f0, [%r5, %r4]
	.word 0xb3a108a5  ! 295: FSUBs	fsubs	%f4, %f5, %f25
	.word 0xc5390005  ! 304: STDF_R	std	%f2, [%r5, %r4]
	.word 0xd13921b8  ! 314: STDF_I	std	%f8, [0x01b8, %r4]
	.word 0x81a10825  ! 315: FADDs	fadds	%f4, %f5, %f0
	.word 0xc7212a30  ! 316: STF_I	st	%f3, [0x0a30, %r4]
	.word 0xcf212ecc  ! 326: STF_I	st	%f7, [0x0ecc, %r4]
	.word 0xc5390005  ! 327: STDF_R	std	%f2, [%r5, %r4]
	.word 0x87a109a5  ! 337: FDIVs	fdivs	%f4, %f5, %f3
	.word 0xd5210005  ! 338: STF_R	st	%f10, [%r5, %r4]
	.word 0xc5212904  ! 339: STF_I	st	%f2, [0x0904, %r4]
	.word 0x81a108a5  ! 358: FSUBs	fsubs	%f4, %f5, %f0
	.word 0xdd210005  ! 359: STF_R	st	%f14, [%r5, %r4]
	.word 0xb5a109a5  ! 360: FDIVs	fdivs	%f4, %f5, %f26
	.word 0xc5390005  ! 361: STDF_R	std	%f2, [%r5, %r4]
	.word 0x81a108a5  ! 362: FSUBs	fsubs	%f4, %f5, %f0
	.word 0xc53920f8  ! 363: STDF_I	std	%f2, [0x00f8, %r4]
	.word 0xc1210005  ! 372: STF_R	st	%f0, [%r5, %r4]
	.word 0x83a10825  ! 415: FADDs	fadds	%f4, %f5, %f1
	.word 0x83a10925  ! 416: FMULs	fmuls	%f4, %f5, %f1
	.word 0xaba10825  ! 417: FADDs	fadds	%f4, %f5, %f21
	.word 0xc5210005  ! 418: STF_R	st	%f2, [%r5, %r4]
	.word 0xc7390005  ! 419: STDF_R	std	%f3, [%r5, %r4]
	.word 0xc1210005  ! 428: STF_R	st	%f0, [%r5, %r4]
	.word 0xc5392920  ! 446: STDF_I	std	%f2, [0x0920, %r4]
	.word 0xdb210005  ! 456: STF_R	st	%f13, [%r5, %r4]
	.word 0x87a109a5  ! 466: FDIVs	fdivs	%f4, %f5, %f3
	.word 0x83a109a5  ! 467: FDIVs	fdivs	%f4, %f5, %f1
	.word 0xc3212cc4  ! 468: STF_I	st	%f1, [0x0cc4, %r4]
	.word 0xc3392670  ! 469: STDF_I	std	%f1, [0x0670, %r4]
	.word 0xc7390005  ! 487: STDF_R	std	%f3, [%r5, %r4]
	.word 0xc5212bf4  ! 488: STF_I	st	%f2, [0x0bf4, %r4]
	.word 0xdf392fd0  ! 497: STDF_I	std	%f15, [0x0fd0, %r4]
	.word 0xc1390005  ! 507: STDF_R	std	%f0, [%r5, %r4]
	.word 0xc3392098  ! 516: STDF_I	std	%f1, [0x0098, %r4]
	.word 0xfb390005  ! 517: STDF_R	std	%f29, [%r5, %r4]
	.word 0xc3390005  ! 534: STDF_R	std	%f1, [%r5, %r4]
	.word 0xb7a108a5  ! 586: FSUBs	fsubs	%f4, %f5, %f27
	.word 0x99a108a5  ! 595: FSUBs	fsubs	%f4, %f5, %f12
	.word 0x83a109a5  ! 613: FDIVs	fdivs	%f4, %f5, %f1
	.word 0x81a10825  ! 622: FADDs	fadds	%f4, %f5, %f0
	.word 0xc3210005  ! 623: STF_R	st	%f1, [%r5, %r4]
	.word 0x85a10925  ! 624: FMULs	fmuls	%f4, %f5, %f2
	.word 0xc1392338  ! 625: STDF_I	std	%f0, [0x0338, %r4]
	.word 0xf3392788  ! 626: STDF_I	std	%f25, [0x0788, %r4]
	.word 0xeb390005  ! 643: STDF_R	std	%f21, [%r5, %r4]
	.word 0xdf210005  ! 652: STF_R	st	%f15, [%r5, %r4]
	.word 0xc3390005  ! 677: STDF_R	std	%f1, [%r5, %r4]
	.word 0xc1210005  ! 678: STF_R	st	%f0, [%r5, %r4]
	.word 0x81a10825  ! 679: FADDs	fadds	%f4, %f5, %f0
	.word 0x87a10925  ! 680: FMULs	fmuls	%f4, %f5, %f3
	.word 0xbba10925  ! 681: FMULs	fmuls	%f4, %f5, %f29
	.word 0xd5210005  ! 682: STF_R	st	%f10, [%r5, %r4]
	.word 0x87a108a5  ! 699: FSUBs	fsubs	%f4, %f5, %f3
	.word 0x85a109a5  ! 733: FDIVs	fdivs	%f4, %f5, %f2
	.word 0xbda10825  ! 734: FADDs	fadds	%f4, %f5, %f30
	.word 0x87a10925  ! 735: FMULs	fmuls	%f4, %f5, %f3
	.word 0xc7392750  ! 736: STDF_I	std	%f3, [0x0750, %r4]
	.word 0x87a10925  ! 762: FMULs	fmuls	%f4, %f5, %f3
	.word 0xb5a10925  ! 763: FMULs	fmuls	%f4, %f5, %f26
	.word 0xc1390005  ! 764: STDF_R	std	%f0, [%r5, %r4]
	.word 0x87a109a5  ! 774: FDIVs	fdivs	%f4, %f5, %f3
	.word 0xf7210005  ! 775: STF_R	st	%f27, [%r5, %r4]
	.word 0xb1a10825  ! 776: FADDs	fadds	%f4, %f5, %f24
	.word 0xcd390005  ! 801: STDF_R	std	%f6, [%r5, %r4]
	.word 0xc3392578  ! 802: STDF_I	std	%f1, [0x0578, %r4]
	.word 0xc7390005  ! 811: STDF_R	std	%f3, [%r5, %r4]
	.word 0xc5390005  ! 812: STDF_R	std	%f2, [%r5, %r4]
	.word 0xc33928b0  ! 829: STDF_I	std	%f1, [0x08b0, %r4]
	.word 0x87a10825  ! 830: FADDs	fadds	%f4, %f5, %f3
	.word 0x85a109a5  ! 839: FDIVs	fdivs	%f4, %f5, %f2
	.word 0xc1210005  ! 858: STF_R	st	%f0, [%r5, %r4]
	.word 0xbda10925  ! 893: FMULs	fmuls	%f4, %f5, %f30
	.word 0xa5a108a5  ! 918: FSUBs	fsubs	%f4, %f5, %f18
	.word 0xc7210005  ! 944: STF_R	st	%f3, [%r5, %r4]
	.word 0x81a10925  ! 945: FMULs	fmuls	%f4, %f5, %f0
	.word 0xcd390005  ! 970: STDF_R	std	%f6, [%r5, %r4]
	.word 0x99a10825  ! 979: FADDs	fadds	%f4, %f5, %f12
	.word 0xb9a109a5  ! 988: FDIVs	fdivs	%f4, %f5, %f28
	.word 0xcf392598  ! 989: STDF_I	std	%f7, [0x0598, %r4]
	.word 0xaba10925  ! 998: FMULs	fmuls	%f4, %f5, %f21
        ta      T_GOOD_TRAP

th_main_2:
        setx  MAIN_BASE_DATA_VA, %r1, %r4
	    setx  0x10, %r1, %r5
        setx  0x80, %g2, %g1
        wr  %g1, %g0, %asi
	    rd %fprs, %g0
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
        setx  0x6a95a1544039128c, %g1, %r0
        setx  0x5da8eb4f087a0011, %g1, %r1
        setx  0xa3033408f154e7ee, %g1, %r2
        setx  0x609d086fc7f49efa, %g1, %r6
        setx  0x61227900b40ecc90, %g1, %r7
        setx  0xd86657fe9604d125, %g1, %r8
        setx  0x98f6335059052825, %g1, %r9
        setx  0x13f082876fa0e539, %g1, %r10
        setx  0xb74f0f949144f195, %g1, %r11
        setx  0x6599c9e2509a26de, %g1, %r12
        setx  0x45f7c2ccfa455393, %g1, %r13
        setx  0xd3fed12242f8b046, %g1, %r14
        setx  0xdfbe9df06ecb7f11, %g1, %r15
        setx  0x037c745a7c33e54e, %g1, %r16
        setx  0x85bb1b932194884f, %g1, %r17
        setx  0x5214e450bcab3804, %g1, %r18
        setx  0x89935d69ef5f4a0b, %g1, %r19
        setx  0x5348447f7551d33c, %g1, %r20
        setx  0x2365af61266fa5e6, %g1, %r21
        setx  0xf7ddcf45373b7d93, %g1, %r22
        setx  0x16816e8fdfec13a2, %g1, %r23
        setx  0xf3342ef25117e671, %g1, %r24
        setx  0xd9dc7ad542efaec0, %g1, %r25
        setx  0x8058e2197aa5587e, %g1, %r26
        setx  0x305cf2628bd7b9f8, %g1, %r27
        setx  0x1165eb2a4091eed8, %g1, %r28
        setx  0x6ca56e7cb79d8318, %g1, %r29
        setx  0x1fd5ea4653839560, %g1, %r30
        setx  0x36d2ce193205259a, %g1, %r31
	.word 0xdc210005  ! 9: STW_R	stw	%r14, [%r4 + %r5]
	.word 0xc0312794  ! 9: STH_I	sth	%r0, [%r4 + 0x0794]
	.word 0xc2712170  ! 9: STX_I	stx	%r1, [%r4 + 0x0170]
	.word 0xf8312e6e  ! 9: STH_I	sth	%r28, [%r4 + 0x0e6e]
	.word 0xc629208d  ! 9: STB_I	stb	%r3, [%r4 + 0x008d]
	.word 0xc4312fea  ! 9: STH_I	sth	%r2, [%r4 + 0x0fea]
	.word 0xc67923b8  ! 9: SWAP_I	swap	%r3, [%r4 + 0x03b8]
	.word 0xc42926c4  ! 9: STB_I	stb	%r2, [%r4 + 0x06c4]
	.word 0xe4212304  ! 19: STW_I	stw	%r18, [%r4 + 0x0304]
	.word 0xe8210005  ! 19: STW_R	stw	%r20, [%r4 + %r5]
	.word 0xc4212c2c  ! 19: STW_I	stw	%r2, [%r4 + 0x0c2c]
	.word 0xc2212a50  ! 19: STW_I	stw	%r1, [%r4 + 0x0a50]
	.word 0xc6212b00  ! 19: STW_I	stw	%r3, [%r4 + 0x0b00]
	.word 0xc2310005  ! 19: STH_R	sth	%r1, [%r4 + %r5]
	.word 0xf0790005  ! 19: SWAP_R	swap	%r24, [%r4 + %r5]
	.word 0xc0292aea  ! 19: STB_I	stb	%r0, [%r4 + 0x0aea]
	.word 0xc4290005  ! 28: STB_R	stb	%r2, [%r4 + %r5]
	.word 0xc2710005  ! 28: STX_R	stx	%r1, [%r4 + %r5]
	.word 0xc0210005  ! 28: STW_R	stw	%r0, [%r4 + %r5]
	.word 0xc2290005  ! 28: STB_R	stb	%r1, [%r4 + %r5]
	.word 0xc2312334  ! 28: STH_I	sth	%r1, [%r4 + 0x0334]
	.word 0xc02927da  ! 28: STB_I	stb	%r0, [%r4 + 0x07da]
	.word 0xd8790005  ! 28: SWAP_R	swap	%r12, [%r4 + %r5]
	.word 0xfa312ae0  ! 28: STH_I	sth	%r29, [%r4 + 0x0ae0]
	.word 0xc2212bb8  ! 36: STW_I	stw	%r1, [%r4 + 0x0bb8]
	.word 0xc0310005  ! 36: STH_R	sth	%r0, [%r4 + %r5]
	.word 0xc0710005  ! 36: STX_R	stx	%r0, [%r4 + %r5]
	.word 0xc6290005  ! 36: STB_R	stb	%r3, [%r4 + %r5]
	.word 0xf6710005  ! 36: STX_R	stx	%r27, [%r4 + %r5]
	.word 0xf4312602  ! 36: STH_I	sth	%r26, [%r4 + 0x0602]
	.word 0xc5e10025  ! 36: CASA_I	casa	[%r4] 0x 1, %r5, %r2
	.word 0xc0310005  ! 36: STH_R	sth	%r0, [%r4 + %r5]
	.word 0xc6212aa0  ! 48: STW_I	stw	%r3, [%r4 + 0x0aa0]
	.word 0xda290005  ! 48: STB_R	stb	%r13, [%r4 + %r5]
	.word 0xc0712060  ! 48: STX_I	stx	%r0, [%r4 + 0x0060]
	.word 0xe0710005  ! 48: STX_R	stx	%r16, [%r4 + %r5]
	.word 0xc2210005  ! 48: STW_R	stw	%r1, [%r4 + %r5]
	.word 0xc2292d5e  ! 48: STB_I	stb	%r1, [%r4 + 0x0d5e]
	.word 0xc5390005  ! 48: STDF_R	std	%f2, [%r5, %r4]
	.word 0xe8210005  ! 48: STW_R	stw	%r20, [%r4 + %r5]
	.word 0xf4310005  ! 57: STH_R	sth	%r26, [%r4 + %r5]
	.word 0xd0210005  ! 57: STW_R	stw	%r8, [%r4 + %r5]
	.word 0xc6710005  ! 57: STX_R	stx	%r3, [%r4 + %r5]
	.word 0xc4310005  ! 57: STH_R	sth	%r2, [%r4 + %r5]
	.word 0xcc310005  ! 57: STH_R	sth	%r6, [%r4 + %r5]
	.word 0xc4212b08  ! 57: STW_I	stw	%r2, [%r4 + 0x0b08]
	.word 0xc0e920c4  ! 57: LDSTUBA_I	ldstuba	%r0, [%r4 + 0x00c4] %asi
	.word 0xc6310005  ! 57: STH_R	sth	%r3, [%r4 + %r5]
	.word 0xc2712080  ! 65: STX_I	stx	%r1, [%r4 + 0x0080]
	.word 0xf2312a6e  ! 65: STH_I	sth	%r25, [%r4 + 0x0a6e]
	.word 0xc2210005  ! 65: STW_R	stw	%r1, [%r4 + %r5]
	.word 0xc621242c  ! 65: STW_I	stw	%r3, [%r4 + 0x042c]
	.word 0xdc310005  ! 65: STH_R	sth	%r14, [%r4 + %r5]
	.word 0xc4310005  ! 65: STH_R	sth	%r2, [%r4 + %r5]
	.word 0xc5390005  ! 65: STDF_R	std	%f2, [%r5, %r4]
	.word 0xd8212f4c  ! 65: STW_I	stw	%r12, [%r4 + 0x0f4c]
	.word 0xc0212d4c  ! 73: STW_I	stw	%r0, [%r4 + 0x0d4c]
	.word 0xc0290005  ! 73: STB_R	stb	%r0, [%r4 + %r5]
	.word 0xc0290005  ! 73: STB_R	stb	%r0, [%r4 + %r5]
	.word 0xe6312040  ! 73: STH_I	sth	%r19, [%r4 + 0x0040]
	.word 0xd2290005  ! 73: STB_R	stb	%r9, [%r4 + %r5]
	.word 0xf0290005  ! 73: STB_R	stb	%r24, [%r4 + %r5]
	.word 0xc3212918  ! 73: STF_I	st	%f1, [0x0918, %r4]
	.word 0xda310005  ! 73: STH_R	sth	%r13, [%r4 + %r5]
	.word 0xf6290005  ! 82: STB_R	stb	%r27, [%r4 + %r5]
	.word 0xc4292296  ! 82: STB_I	stb	%r2, [%r4 + 0x0296]
	.word 0xe0310005  ! 82: STH_R	sth	%r16, [%r4 + %r5]
	.word 0xc4710005  ! 82: STX_R	stx	%r2, [%r4 + %r5]
	.word 0xd8210005  ! 82: STW_R	stw	%r12, [%r4 + %r5]
	.word 0xc6290005  ! 82: STB_R	stb	%r3, [%r4 + %r5]
	.word 0xc7210005  ! 82: STF_R	st	%f3, [%r5, %r4]
	.word 0xec710005  ! 82: STX_R	stx	%r22, [%r4 + %r5]
	.word 0xc0290005  ! 90: STB_R	stb	%r0, [%r4 + %r5]
	.word 0xc0312e1e  ! 90: STH_I	sth	%r0, [%r4 + 0x0e1e]
	.word 0xc6210005  ! 90: STW_R	stw	%r3, [%r4 + %r5]
	.word 0xda310005  ! 90: STH_R	sth	%r13, [%r4 + %r5]
	.word 0xc4212514  ! 90: STW_I	stw	%r2, [%r4 + 0x0514]
	.word 0xc4212c70  ! 90: STW_I	stw	%r2, [%r4 + 0x0c70]
	.word 0xc72128b4  ! 90: STF_I	st	%f3, [0x08b4, %r4]
	.word 0xc0310005  ! 90: STH_R	sth	%r0, [%r4 + %r5]
	.word 0xe4712e98  ! 98: STX_I	stx	%r18, [%r4 + 0x0e98]
	.word 0xd6212504  ! 98: STW_I	stw	%r11, [%r4 + 0x0504]
	.word 0xc4710005  ! 98: STX_R	stx	%r2, [%r4 + %r5]
	.word 0xfa31285a  ! 98: STH_I	sth	%r29, [%r4 + 0x085a]
	.word 0xdc312afa  ! 98: STH_I	sth	%r14, [%r4 + 0x0afa]
	.word 0xec210005  ! 98: STW_R	stw	%r22, [%r4 + %r5]
	.word 0xc0792c80  ! 98: SWAP_I	swap	%r0, [%r4 + 0x0c80]
	.word 0xc0290005  ! 98: STB_R	stb	%r0, [%r4 + %r5]
	.word 0xf8210005  ! 106: STW_R	stw	%r28, [%r4 + %r5]
	.word 0xe0290005  ! 106: STB_R	stb	%r16, [%r4 + %r5]
	.word 0xc621283c  ! 106: STW_I	stw	%r3, [%r4 + 0x083c]
	.word 0xc4710005  ! 106: STX_R	stx	%r2, [%r4 + %r5]
	.word 0xde210005  ! 106: STW_R	stw	%r15, [%r4 + %r5]
	.word 0xe0210005  ! 106: STW_R	stw	%r16, [%r4 + %r5]
	.word 0xc7390005  ! 106: STDF_R	std	%f3, [%r5, %r4]
	.word 0xde212d64  ! 106: STW_I	stw	%r15, [%r4 + 0x0d64]
	.word 0xc4310005  ! 115: STH_R	sth	%r2, [%r4 + %r5]
	.word 0xfe712eb8  ! 115: STX_I	stx	%r31, [%r4 + 0x0eb8]
	.word 0xc2712d00  ! 115: STX_I	stx	%r1, [%r4 + 0x0d00]
	.word 0xc6712aa0  ! 115: STX_I	stx	%r3, [%r4 + 0x0aa0]
	.word 0xf2312838  ! 115: STH_I	sth	%r25, [%r4 + 0x0838]
	.word 0xea310005  ! 115: STH_R	sth	%r21, [%r4 + %r5]
	.word 0xfe2129cc  ! 115: STW_I	stw	%r31, [%r4 + 0x09cc]
	.word 0xdc710005  ! 115: STX_R	stx	%r14, [%r4 + %r5]
	.word 0xed390005  ! 115: STDF_R	std	%f22, [%r5, %r4]
	.word 0xc6210005  ! 126: STW_R	stw	%r3, [%r4 + %r5]
	.word 0xc2292624  ! 126: STB_I	stb	%r1, [%r4 + 0x0624]
	.word 0xc0210005  ! 126: STW_R	stw	%r0, [%r4 + %r5]
	.word 0xc2290005  ! 126: STB_R	stb	%r1, [%r4 + %r5]
	.word 0xe2212554  ! 126: STW_I	stw	%r17, [%r4 + 0x0554]
	.word 0xde290005  ! 126: STB_R	stb	%r15, [%r4 + %r5]
	.word 0xc0310005  ! 126: STH_R	sth	%r0, [%r4 + %r5]
	.word 0xc42126a0  ! 126: STW_I	stw	%r2, [%r4 + 0x06a0]
	.word 0xc7392618  ! 126: STDF_I	std	%f3, [0x0618, %r4]
	.word 0xc6310005  ! 135: STH_R	sth	%r3, [%r4 + %r5]
	.word 0xe2710005  ! 135: STX_R	stx	%r17, [%r4 + %r5]
	.word 0xc4210005  ! 135: STW_R	stw	%r2, [%r4 + %r5]
	.word 0xc43126d8  ! 135: STH_I	sth	%r2, [%r4 + 0x06d8]
	.word 0xe42928f7  ! 135: STB_I	stb	%r18, [%r4 + 0x08f7]
	.word 0xc0290005  ! 135: STB_R	stb	%r0, [%r4 + %r5]
	.word 0xc5210005  ! 135: STF_R	st	%f2, [%r5, %r4]
	.word 0xd2210005  ! 135: STW_R	stw	%r9, [%r4 + %r5]
	.word 0xc6210005  ! 145: STW_R	stw	%r3, [%r4 + %r5]
	.word 0xc2210005  ! 145: STW_R	stw	%r1, [%r4 + %r5]
	.word 0xc6712c10  ! 145: STX_I	stx	%r3, [%r4 + 0x0c10]
	.word 0xc4210005  ! 145: STW_R	stw	%r2, [%r4 + %r5]
	.word 0xc6710005  ! 145: STX_R	stx	%r3, [%r4 + %r5]
	.word 0xf82128cc  ! 145: STW_I	stw	%r28, [%r4 + 0x08cc]
	.word 0xc07120b8  ! 145: STX_I	stx	%r0, [%r4 + 0x00b8]
	.word 0xd829200a  ! 145: STB_I	stb	%r12, [%r4 + 0x000a]
	.word 0xdfe12005  ! 145: CASA_R	casa	[%r4] %asi, %r5, %r15
	.word 0xc6312654  ! 156: STH_I	sth	%r3, [%r4 + 0x0654]
	.word 0xc2710005  ! 156: STX_R	stx	%r1, [%r4 + %r5]
	.word 0xe2290005  ! 156: STB_R	stb	%r17, [%r4 + %r5]
	.word 0xc0712570  ! 156: STX_I	stx	%r0, [%r4 + 0x0570]
	.word 0xc2710005  ! 156: STX_R	stx	%r1, [%r4 + %r5]
	.word 0xde312e12  ! 156: STH_I	sth	%r15, [%r4 + 0x0e12]
	.word 0xc6312396  ! 156: STH_I	sth	%r3, [%r4 + 0x0396]
	.word 0xc72129a4  ! 156: STF_I	st	%f3, [0x09a4, %r4]
	.word 0xc0290005  ! 156: STB_R	stb	%r0, [%r4 + %r5]
	.word 0xc0710005  ! 166: STX_R	stx	%r0, [%r4 + %r5]
	.word 0xc0310005  ! 166: STH_R	sth	%r0, [%r4 + %r5]
	.word 0xc67129c8  ! 166: STX_I	stx	%r3, [%r4 + 0x09c8]
	.word 0xc6712308  ! 166: STX_I	stx	%r3, [%r4 + 0x0308]
	.word 0xd0212184  ! 166: STW_I	stw	%r8, [%r4 + 0x0184]
	.word 0xc2310005  ! 166: STH_R	sth	%r1, [%r4 + %r5]
	.word 0xc5390005  ! 166: STDF_R	std	%f2, [%r5, %r4]
	.word 0xea212f20  ! 166: STW_I	stw	%r21, [%r4 + 0x0f20]
	.word 0xf0292f2e  ! 176: STB_I	stb	%r24, [%r4 + 0x0f2e]
	.word 0xe03127de  ! 176: STH_I	sth	%r16, [%r4 + 0x07de]
	.word 0xc47128d0  ! 176: STX_I	stx	%r2, [%r4 + 0x08d0]
	.word 0xc0710005  ! 176: STX_R	stx	%r0, [%r4 + %r5]
	.word 0xc6292a8f  ! 176: STB_I	stb	%r3, [%r4 + 0x0a8f]
	.word 0xc4310005  ! 176: STH_R	sth	%r2, [%r4 + %r5]
	.word 0xc0710005  ! 176: STX_R	stx	%r0, [%r4 + %r5]
	.word 0xdcf92a58  ! 176: SWAPA_I	swapa	%r14, [%r4 + 0x0a58] %asi
	.word 0xc2290005  ! 176: STB_R	stb	%r1, [%r4 + %r5]
	.word 0xf0212e00  ! 184: STW_I	stw	%r24, [%r4 + 0x0e00]
	.word 0xc0210005  ! 184: STW_R	stw	%r0, [%r4 + %r5]
	.word 0xc2292a40  ! 184: STB_I	stb	%r1, [%r4 + 0x0a40]
	.word 0xf0210005  ! 184: STW_R	stw	%r24, [%r4 + %r5]
	.word 0xf82125dc  ! 184: STW_I	stw	%r28, [%r4 + 0x05dc]
	.word 0xc0710005  ! 184: STX_R	stx	%r0, [%r4 + %r5]
	.word 0xc2e92b71  ! 184: LDSTUBA_I	ldstuba	%r1, [%r4 + 0x0b71] %asi
	.word 0xc4210005  ! 184: STW_R	stw	%r2, [%r4 + %r5]
	.word 0xc27129d8  ! 192: STX_I	stx	%r1, [%r4 + 0x09d8]
	.word 0xc0210005  ! 192: STW_R	stw	%r0, [%r4 + %r5]
	.word 0xc2712488  ! 192: STX_I	stx	%r1, [%r4 + 0x0488]
	.word 0xc0710005  ! 192: STX_R	stx	%r0, [%r4 + %r5]
	.word 0xc4310005  ! 192: STH_R	sth	%r2, [%r4 + %r5]
	.word 0xc23127b8  ! 192: STH_I	sth	%r1, [%r4 + 0x07b8]
	.word 0xdbf10025  ! 192: CASXA_I	casxa	[%r4] 0x 1, %r5, %r13
	.word 0xc6710005  ! 192: STX_R	stx	%r3, [%r4 + %r5]
	.word 0xe6310005  ! 204: STH_R	sth	%r19, [%r4 + %r5]
	.word 0xc62127f0  ! 204: STW_I	stw	%r3, [%r4 + 0x07f0]
	.word 0xf4292762  ! 204: STB_I	stb	%r26, [%r4 + 0x0762]
	.word 0xc23126ec  ! 204: STH_I	sth	%r1, [%r4 + 0x06ec]
	.word 0xc029248f  ! 204: STB_I	stb	%r0, [%r4 + 0x048f]
	.word 0xc2210005  ! 204: STW_R	stw	%r1, [%r4 + %r5]
	.word 0xc5212860  ! 204: STF_I	st	%f2, [0x0860, %r4]
	.word 0xc0292425  ! 204: STB_I	stb	%r0, [%r4 + 0x0425]
	.word 0xc4310005  ! 213: STH_R	sth	%r2, [%r4 + %r5]
	.word 0xc6710005  ! 213: STX_R	stx	%r3, [%r4 + %r5]
	.word 0xc4310005  ! 213: STH_R	sth	%r2, [%r4 + %r5]
	.word 0xc22121b4  ! 213: STW_I	stw	%r1, [%r4 + 0x01b4]
	.word 0xee310005  ! 213: STH_R	sth	%r23, [%r4 + %r5]
	.word 0xc0290005  ! 213: STB_R	stb	%r0, [%r4 + %r5]
	.word 0xc2710005  ! 213: STX_R	stx	%r1, [%r4 + %r5]
	.word 0xc1210005  ! 213: STF_R	st	%f0, [%r5, %r4]
	.word 0xf2312980  ! 213: STH_I	sth	%r25, [%r4 + 0x0980]
	.word 0xc421254c  ! 222: STW_I	stw	%r2, [%r4 + 0x054c]
	.word 0xdc712948  ! 222: STX_I	stx	%r14, [%r4 + 0x0948]
	.word 0xc4310005  ! 222: STH_R	sth	%r2, [%r4 + %r5]
	.word 0xec310005  ! 222: STH_R	sth	%r22, [%r4 + %r5]
	.word 0xc2710005  ! 222: STX_R	stx	%r1, [%r4 + %r5]
	.word 0xf67120e0  ! 222: STX_I	stx	%r27, [%r4 + 0x00e0]
	.word 0xd1e12005  ! 222: CASA_R	casa	[%r4] %asi, %r5, %r8
	.word 0xc0292f94  ! 222: STB_I	stb	%r0, [%r4 + 0x0f94]
	.word 0xc22924d6  ! 232: STB_I	stb	%r1, [%r4 + 0x04d6]
	.word 0xd4210005  ! 232: STW_R	stw	%r10, [%r4 + %r5]
	.word 0xc4712f38  ! 232: STX_I	stx	%r2, [%r4 + 0x0f38]
	.word 0xc4710005  ! 232: STX_R	stx	%r2, [%r4 + %r5]
	.word 0xc4712f30  ! 232: STX_I	stx	%r2, [%r4 + 0x0f30]
	.word 0xc02926bc  ! 232: STB_I	stb	%r0, [%r4 + 0x06bc]
	.word 0xe9f12005  ! 232: CASXA_R	casxa	[%r4]%asi, %r5, %r20
	.word 0xf0212c00  ! 232: STW_I	stw	%r24, [%r4 + 0x0c00]
	.word 0xd4210005  ! 243: STW_R	stw	%r10, [%r4 + %r5]
	.word 0xd8210005  ! 243: STW_R	stw	%r12, [%r4 + %r5]
	.word 0xe4310005  ! 243: STH_R	sth	%r18, [%r4 + %r5]
	.word 0xc631229c  ! 243: STH_I	sth	%r3, [%r4 + 0x029c]
	.word 0xee290005  ! 243: STB_R	stb	%r23, [%r4 + %r5]
	.word 0xc6292ea5  ! 243: STB_I	stb	%r3, [%r4 + 0x0ea5]
	.word 0xc6310005  ! 243: STH_R	sth	%r3, [%r4 + %r5]
	.word 0xc4e92d67  ! 243: LDSTUBA_I	ldstuba	%r2, [%r4 + 0x0d67] %asi
	.word 0xc0290005  ! 243: STB_R	stb	%r0, [%r4 + %r5]
	.word 0xe8290005  ! 254: STB_R	stb	%r20, [%r4 + %r5]
	.word 0xd2710005  ! 254: STX_R	stx	%r9, [%r4 + %r5]
	.word 0xc6710005  ! 254: STX_R	stx	%r3, [%r4 + %r5]
	.word 0xc2292403  ! 254: STB_I	stb	%r1, [%r4 + 0x0403]
	.word 0xe22121e4  ! 254: STW_I	stw	%r17, [%r4 + 0x01e4]
	.word 0xc6212860  ! 254: STW_I	stw	%r3, [%r4 + 0x0860]
	.word 0xc3e12005  ! 254: CASA_R	casa	[%r4] %asi, %r5, %r1
	.word 0xf229256b  ! 254: STB_I	stb	%r25, [%r4 + 0x056b]
	.word 0xc0212820  ! 263: STW_I	stw	%r0, [%r4 + 0x0820]
	.word 0xc0210005  ! 263: STW_R	stw	%r0, [%r4 + %r5]
	.word 0xc63127de  ! 263: STH_I	sth	%r3, [%r4 + 0x07de]
	.word 0xc2710005  ! 263: STX_R	stx	%r1, [%r4 + %r5]
	.word 0xc0210005  ! 263: STW_R	stw	%r0, [%r4 + %r5]
	.word 0xda2126ec  ! 263: STW_I	stw	%r13, [%r4 + 0x06ec]
	.word 0xc3392df8  ! 263: STDF_I	std	%f1, [0x0df8, %r4]
	.word 0xd8710005  ! 263: STX_R	stx	%r12, [%r4 + %r5]
	.word 0xe8710005  ! 272: STX_R	stx	%r20, [%r4 + %r5]
	.word 0xc6292d9d  ! 272: STB_I	stb	%r3, [%r4 + 0x0d9d]
	.word 0xc4212e60  ! 272: STW_I	stw	%r2, [%r4 + 0x0e60]
	.word 0xf4212d80  ! 272: STW_I	stw	%r26, [%r4 + 0x0d80]
	.word 0xc02125cc  ! 272: STW_I	stw	%r0, [%r4 + 0x05cc]
	.word 0xc2212008  ! 272: STW_I	stw	%r1, [%r4 + 0x0008]
	.word 0xea310005  ! 272: STH_R	sth	%r21, [%r4 + %r5]
	.word 0xc6792598  ! 272: SWAP_I	swap	%r3, [%r4 + 0x0598]
	.word 0xc0290005  ! 272: STB_R	stb	%r0, [%r4 + %r5]
	.word 0xc42927ec  ! 282: STB_I	stb	%r2, [%r4 + 0x07ec]
	.word 0xc2212008  ! 282: STW_I	stw	%r1, [%r4 + 0x0008]
	.word 0xc6210005  ! 282: STW_R	stw	%r3, [%r4 + %r5]
	.word 0xc2290005  ! 282: STB_R	stb	%r1, [%r4 + %r5]
	.word 0xd629233c  ! 282: STB_I	stb	%r11, [%r4 + 0x033c]
	.word 0xc23128ca  ! 282: STH_I	sth	%r1, [%r4 + 0x08ca]
	.word 0xc12124e4  ! 282: STF_I	st	%f0, [0x04e4, %r4]
	.word 0xd2310005  ! 282: STH_R	sth	%r9, [%r4 + %r5]
	.word 0xc2212e34  ! 290: STW_I	stw	%r1, [%r4 + 0x0e34]
	.word 0xc6710005  ! 290: STX_R	stx	%r3, [%r4 + %r5]
	.word 0xc2290005  ! 290: STB_R	stb	%r1, [%r4 + %r5]
	.word 0xc0290005  ! 290: STB_R	stb	%r0, [%r4 + %r5]
	.word 0xd4290005  ! 290: STB_R	stb	%r10, [%r4 + %r5]
	.word 0xc0210005  ! 290: STW_R	stw	%r0, [%r4 + %r5]
	.word 0xeee928f2  ! 290: LDSTUBA_I	ldstuba	%r23, [%r4 + 0x08f2] %asi
	.word 0xfe210005  ! 290: STW_R	stw	%r31, [%r4 + %r5]
	.word 0xc429274b  ! 303: STB_I	stb	%r2, [%r4 + 0x074b]
	.word 0xce312c5c  ! 303: STH_I	sth	%r7, [%r4 + 0x0c5c]
	.word 0xf4210005  ! 303: STW_R	stw	%r26, [%r4 + %r5]
	.word 0xd4212058  ! 303: STW_I	stw	%r10, [%r4 + 0x0058]
	.word 0xc6310005  ! 303: STH_R	sth	%r3, [%r4 + %r5]
	.word 0xc231258e  ! 303: STH_I	sth	%r1, [%r4 + 0x058e]
	.word 0xc32121e8  ! 303: STF_I	st	%f1, [0x01e8, %r4]
	.word 0xda710005  ! 303: STX_R	stx	%r13, [%r4 + %r5]
	.word 0xc22925d7  ! 313: STB_I	stb	%r1, [%r4 + 0x05d7]
	.word 0xec212674  ! 313: STW_I	stw	%r22, [%r4 + 0x0674]
	.word 0xc6212084  ! 313: STW_I	stw	%r3, [%r4 + 0x0084]
	.word 0xfe290005  ! 313: STB_R	stb	%r31, [%r4 + %r5]
	.word 0xc6212b74  ! 313: STW_I	stw	%r3, [%r4 + 0x0b74]
	.word 0xc4712d18  ! 313: STX_I	stx	%r2, [%r4 + 0x0d18]
	.word 0xc0310005  ! 313: STH_R	sth	%r0, [%r4 + %r5]
	.word 0xd7390005  ! 313: STDF_R	std	%f11, [%r5, %r4]
	.word 0xc47127d8  ! 313: STX_I	stx	%r2, [%r4 + 0x07d8]
	.word 0xde310005  ! 325: STH_R	sth	%r15, [%r4 + %r5]
	.word 0xdc212248  ! 325: STW_I	stw	%r14, [%r4 + 0x0248]
	.word 0xc4292dd0  ! 325: STB_I	stb	%r2, [%r4 + 0x0dd0]
	.word 0xc03123ce  ! 325: STH_I	sth	%r0, [%r4 + 0x03ce]
	.word 0xf6710005  ! 325: STX_R	stx	%r27, [%r4 + %r5]
	.word 0xc2712430  ! 325: STX_I	stx	%r1, [%r4 + 0x0430]
	.word 0xc6212990  ! 325: STW_I	stw	%r3, [%r4 + 0x0990]
	.word 0xc47926c4  ! 325: SWAP_I	swap	%r2, [%r4 + 0x06c4]
	.word 0xe0210005  ! 325: STW_R	stw	%r16, [%r4 + %r5]
	.word 0xc6312ad4  ! 336: STH_I	sth	%r3, [%r4 + 0x0ad4]
	.word 0xc42129c4  ! 336: STW_I	stw	%r2, [%r4 + 0x09c4]
	.word 0xc6710005  ! 336: STX_R	stx	%r3, [%r4 + %r5]
	.word 0xd4710005  ! 336: STX_R	stx	%r10, [%r4 + %r5]
	.word 0xc2290005  ! 336: STB_R	stb	%r1, [%r4 + %r5]
	.word 0xc4290005  ! 336: STB_R	stb	%r2, [%r4 + %r5]
	.word 0xc6310005  ! 336: STH_R	sth	%r3, [%r4 + %r5]
	.word 0xe4210005  ! 336: STW_R	stw	%r18, [%r4 + %r5]
	.word 0xea710005  ! 336: STX_R	stx	%r21, [%r4 + %r5]
	.word 0xf0212fe0  ! 348: STW_I	stw	%r24, [%r4 + 0x0fe0]
	.word 0xc0290005  ! 348: STB_R	stb	%r0, [%r4 + %r5]
	.word 0xcc210005  ! 348: STW_R	stw	%r6, [%r4 + %r5]
	.word 0xc2310005  ! 348: STH_R	sth	%r1, [%r4 + %r5]
	.word 0xc6210005  ! 348: STW_R	stw	%r3, [%r4 + %r5]
	.word 0xc6712bf0  ! 348: STX_I	stx	%r3, [%r4 + 0x0bf0]
	.word 0xe0292178  ! 348: STB_I	stb	%r16, [%r4 + 0x0178]
	.word 0xea310005  ! 348: STH_R	sth	%r21, [%r4 + %r5]
	.word 0xdf390005  ! 348: STDF_R	std	%f15, [%r5, %r4]
	.word 0xc4210005  ! 357: STW_R	stw	%r2, [%r4 + %r5]
	.word 0xc0212ac8  ! 357: STW_I	stw	%r0, [%r4 + 0x0ac8]
	.word 0xf8292f73  ! 357: STB_I	stb	%r28, [%r4 + 0x0f73]
	.word 0xc6710005  ! 357: STX_R	stx	%r3, [%r4 + %r5]
	.word 0xec712848  ! 357: STX_I	stx	%r22, [%r4 + 0x0848]
	.word 0xc2712938  ! 357: STX_I	stx	%r1, [%r4 + 0x0938]
	.word 0xc42925f6  ! 357: STB_I	stb	%r2, [%r4 + 0x05f6]
	.word 0xc6710005  ! 357: STX_R	stx	%r3, [%r4 + %r5]
	.word 0xc0712078  ! 357: STX_I	stx	%r0, [%r4 + 0x0078]
	.word 0xc4212bd0  ! 371: STW_I	stw	%r2, [%r4 + 0x0bd0]
	.word 0xf0290005  ! 371: STB_R	stb	%r24, [%r4 + %r5]
	.word 0xc0312f0e  ! 371: STH_I	sth	%r0, [%r4 + 0x0f0e]
	.word 0xc6310005  ! 371: STH_R	sth	%r3, [%r4 + %r5]
	.word 0xe631230c  ! 371: STH_I	sth	%r19, [%r4 + 0x030c]
	.word 0xe2712c48  ! 371: STX_I	stx	%r17, [%r4 + 0x0c48]
	.word 0xc1212804  ! 371: STF_I	st	%f0, [0x0804, %r4]
	.word 0xc4310005  ! 371: STH_R	sth	%r2, [%r4 + %r5]
	.word 0xc629267d  ! 380: STB_I	stb	%r3, [%r4 + 0x067d]
	.word 0xc0292828  ! 380: STB_I	stb	%r0, [%r4 + 0x0828]
	.word 0xec210005  ! 380: STW_R	stw	%r22, [%r4 + %r5]
	.word 0xd4310005  ! 380: STH_R	sth	%r10, [%r4 + %r5]
	.word 0xdc210005  ! 380: STW_R	stw	%r14, [%r4 + %r5]
	.word 0xc229239b  ! 380: STB_I	stb	%r1, [%r4 + 0x039b]
	.word 0xc321214c  ! 380: STF_I	st	%f1, [0x014c, %r4]
	.word 0xc6210005  ! 380: STW_R	stw	%r3, [%r4 + %r5]
	.word 0xfa2926b7  ! 388: STB_I	stb	%r29, [%r4 + 0x06b7]
	.word 0xf2290005  ! 388: STB_R	stb	%r25, [%r4 + %r5]
	.word 0xc4212d44  ! 388: STW_I	stw	%r2, [%r4 + 0x0d44]
	.word 0xd63127fc  ! 388: STH_I	sth	%r11, [%r4 + 0x07fc]
	.word 0xea310005  ! 388: STH_R	sth	%r21, [%r4 + %r5]
	.word 0xc4292d39  ! 388: STB_I	stb	%r2, [%r4 + 0x0d39]
	.word 0xc5f12005  ! 388: CASXA_R	casxa	[%r4]%asi, %r5, %r2
	.word 0xc229275d  ! 388: STB_I	stb	%r1, [%r4 + 0x075d]
	.word 0xc6290005  ! 396: STB_R	stb	%r3, [%r4 + %r5]
	.word 0xc4290005  ! 396: STB_R	stb	%r2, [%r4 + %r5]
	.word 0xe0310005  ! 396: STH_R	sth	%r16, [%r4 + %r5]
	.word 0xfa290005  ! 396: STB_R	stb	%r29, [%r4 + %r5]
	.word 0xfc210005  ! 396: STW_R	stw	%r30, [%r4 + %r5]
	.word 0xc0710005  ! 396: STX_R	stx	%r0, [%r4 + %r5]
	.word 0xc7210005  ! 396: STF_R	st	%f3, [%r5, %r4]
	.word 0xc0290005  ! 396: STB_R	stb	%r0, [%r4 + %r5]
	.word 0xc6310005  ! 405: STH_R	sth	%r3, [%r4 + %r5]
	.word 0xc6312e9e  ! 405: STH_I	sth	%r3, [%r4 + 0x0e9e]
	.word 0xc2710005  ! 405: STX_R	stx	%r1, [%r4 + %r5]
	.word 0xc021277c  ! 405: STW_I	stw	%r0, [%r4 + 0x077c]
	.word 0xe0292daf  ! 405: STB_I	stb	%r16, [%r4 + 0x0daf]
	.word 0xc6712fe8  ! 405: STX_I	stx	%r3, [%r4 + 0x0fe8]
	.word 0xd42128a0  ! 405: STW_I	stw	%r10, [%r4 + 0x08a0]
	.word 0xc2790005  ! 405: SWAP_R	swap	%r1, [%r4 + %r5]
	.word 0xc4712078  ! 405: STX_I	stx	%r2, [%r4 + 0x0078]
	.word 0xce312120  ! 414: STH_I	sth	%r7, [%r4 + 0x0120]
	.word 0xc4712d88  ! 414: STX_I	stx	%r2, [%r4 + 0x0d88]
	.word 0xc0292662  ! 414: STB_I	stb	%r0, [%r4 + 0x0662]
	.word 0xc0292c7d  ! 414: STB_I	stb	%r0, [%r4 + 0x0c7d]
	.word 0xc6310005  ! 414: STH_R	sth	%r3, [%r4 + %r5]
	.word 0xc6312b50  ! 414: STH_I	sth	%r3, [%r4 + 0x0b50]
	.word 0xc0710005  ! 414: STX_R	stx	%r0, [%r4 + %r5]
	.word 0xff3922e8  ! 414: STDF_I	std	%f31, [0x02e8, %r4]
	.word 0xc4212f9c  ! 414: STW_I	stw	%r2, [%r4 + 0x0f9c]
	.word 0xe2710005  ! 427: STX_R	stx	%r17, [%r4 + %r5]
	.word 0xc6310005  ! 427: STH_R	sth	%r3, [%r4 + %r5]
	.word 0xfe292a92  ! 427: STB_I	stb	%r31, [%r4 + 0x0a92]
	.word 0xc4210005  ! 427: STW_R	stw	%r2, [%r4 + %r5]
	.word 0xc0290005  ! 427: STB_R	stb	%r0, [%r4 + %r5]
	.word 0xc631279e  ! 427: STH_I	sth	%r3, [%r4 + 0x079e]
	.word 0xc2792510  ! 427: SWAP_I	swap	%r1, [%r4 + 0x0510]
	.word 0xfc2126b8  ! 427: STW_I	stw	%r30, [%r4 + 0x06b8]
	.word 0xd4312e92  ! 436: STH_I	sth	%r10, [%r4 + 0x0e92]
	.word 0xc6210005  ! 436: STW_R	stw	%r3, [%r4 + %r5]
	.word 0xc2710005  ! 436: STX_R	stx	%r1, [%r4 + %r5]
	.word 0xc62127a4  ! 436: STW_I	stw	%r3, [%r4 + 0x07a4]
	.word 0xc2310005  ! 436: STH_R	sth	%r1, [%r4 + %r5]
	.word 0xc27125b0  ! 436: STX_I	stx	%r1, [%r4 + 0x05b0]
	.word 0xc1392360  ! 436: STDF_I	std	%f0, [0x0360, %r4]
	.word 0xf6290005  ! 436: STB_R	stb	%r27, [%r4 + %r5]
	.word 0xe4290005  ! 445: STB_R	stb	%r18, [%r4 + %r5]
	.word 0xc0292f8c  ! 445: STB_I	stb	%r0, [%r4 + 0x0f8c]
	.word 0xec290005  ! 445: STB_R	stb	%r22, [%r4 + %r5]
	.word 0xe4212750  ! 445: STW_I	stw	%r18, [%r4 + 0x0750]
	.word 0xfc210005  ! 445: STW_R	stw	%r30, [%r4 + %r5]
	.word 0xc2712520  ! 445: STX_I	stx	%r1, [%r4 + 0x0520]
	.word 0xf83122fe  ! 445: STH_I	sth	%r28, [%r4 + 0x02fe]
	.word 0xc6712430  ! 445: STX_I	stx	%r3, [%r4 + 0x0430]
	.word 0xc5e12005  ! 445: CASA_R	casa	[%r4] %asi, %r5, %r2
	.word 0xc0290005  ! 455: STB_R	stb	%r0, [%r4 + %r5]
	.word 0xc631254c  ! 455: STH_I	sth	%r3, [%r4 + 0x054c]
	.word 0xc62124b4  ! 455: STW_I	stw	%r3, [%r4 + 0x04b4]
	.word 0xc4292107  ! 455: STB_I	stb	%r2, [%r4 + 0x0107]
	.word 0xc6290005  ! 455: STB_R	stb	%r3, [%r4 + %r5]
	.word 0xec712bf0  ! 455: STX_I	stx	%r22, [%r4 + 0x0bf0]
	.word 0xfe292957  ! 455: STB_I	stb	%r31, [%r4 + 0x0957]
	.word 0xc5390005  ! 455: STDF_R	std	%f2, [%r5, %r4]
	.word 0xc4312668  ! 455: STH_I	sth	%r2, [%r4 + 0x0668]
	.word 0xf2710005  ! 465: STX_R	stx	%r25, [%r4 + %r5]
	.word 0xc0212d54  ! 465: STW_I	stw	%r0, [%r4 + 0x0d54]
	.word 0xc6712470  ! 465: STX_I	stx	%r3, [%r4 + 0x0470]
	.word 0xc4290005  ! 465: STB_R	stb	%r2, [%r4 + %r5]
	.word 0xc0210005  ! 465: STW_R	stw	%r0, [%r4 + %r5]
	.word 0xc4290005  ! 465: STB_R	stb	%r2, [%r4 + %r5]
	.word 0xe6312e9c  ! 465: STH_I	sth	%r19, [%r4 + 0x0e9c]
	.word 0xc6710005  ! 465: STX_R	stx	%r3, [%r4 + %r5]
	.word 0xd1212d08  ! 465: STF_I	st	%f8, [0x0d08, %r4]
	.word 0xc0710005  ! 478: STX_R	stx	%r0, [%r4 + %r5]
	.word 0xc4290005  ! 478: STB_R	stb	%r2, [%r4 + %r5]
	.word 0xc0210005  ! 478: STW_R	stw	%r0, [%r4 + %r5]
	.word 0xd02922c2  ! 478: STB_I	stb	%r8, [%r4 + 0x02c2]
	.word 0xd6290005  ! 478: STB_R	stb	%r11, [%r4 + %r5]
	.word 0xc0292c34  ! 478: STB_I	stb	%r0, [%r4 + 0x0c34]
	.word 0xc0710005  ! 478: STX_R	stx	%r0, [%r4 + %r5]
	.word 0xef3921c0  ! 478: STDF_I	std	%f23, [0x01c0, %r4]
	.word 0xc2212e28  ! 478: STW_I	stw	%r1, [%r4 + 0x0e28]
	.word 0xc6310005  ! 486: STH_R	sth	%r3, [%r4 + %r5]
	.word 0xc0712f80  ! 486: STX_I	stx	%r0, [%r4 + 0x0f80]
	.word 0xc42128a4  ! 486: STW_I	stw	%r2, [%r4 + 0x08a4]
	.word 0xc2710005  ! 486: STX_R	stx	%r1, [%r4 + %r5]
	.word 0xea210005  ! 486: STW_R	stw	%r21, [%r4 + %r5]
	.word 0xc6290005  ! 486: STB_R	stb	%r3, [%r4 + %r5]
	.word 0xc7210005  ! 486: STF_R	st	%f3, [%r5, %r4]
	.word 0xee712ea8  ! 486: STX_I	stx	%r23, [%r4 + 0x0ea8]
	.word 0xf4712e78  ! 496: STX_I	stx	%r26, [%r4 + 0x0e78]
	.word 0xc0212144  ! 496: STW_I	stw	%r0, [%r4 + 0x0144]
	.word 0xc6312626  ! 496: STH_I	sth	%r3, [%r4 + 0x0626]
	.word 0xf62923a3  ! 496: STB_I	stb	%r27, [%r4 + 0x03a3]
	.word 0xc0310005  ! 496: STH_R	sth	%r0, [%r4 + %r5]
	.word 0xcc210005  ! 496: STW_R	stw	%r6, [%r4 + %r5]
	.word 0xce792e48  ! 496: SWAP_I	swap	%r7, [%r4 + 0x0e48]
	.word 0xc0212894  ! 496: STW_I	stw	%r0, [%r4 + 0x0894]
	.word 0xc4310005  ! 506: STH_R	sth	%r2, [%r4 + %r5]
	.word 0xd0710005  ! 506: STX_R	stx	%r8, [%r4 + %r5]
	.word 0xc6712a10  ! 506: STX_I	stx	%r3, [%r4 + 0x0a10]
	.word 0xc2210005  ! 506: STW_R	stw	%r1, [%r4 + %r5]
	.word 0xde290005  ! 506: STB_R	stb	%r15, [%r4 + %r5]
	.word 0xc4312402  ! 506: STH_I	sth	%r2, [%r4 + 0x0402]
	.word 0xea712b20  ! 506: STX_I	stx	%r21, [%r4 + 0x0b20]
	.word 0xd7e12005  ! 506: CASA_R	casa	[%r4] %asi, %r5, %r11
	.word 0xc6712b88  ! 506: STX_I	stx	%r3, [%r4 + 0x0b88]
	.word 0xf8290005  ! 515: STB_R	stb	%r28, [%r4 + %r5]
	.word 0xc2310005  ! 515: STH_R	sth	%r1, [%r4 + %r5]
	.word 0xc2712538  ! 515: STX_I	stx	%r1, [%r4 + 0x0538]
	.word 0xf4712508  ! 515: STX_I	stx	%r26, [%r4 + 0x0508]
	.word 0xe8712ad0  ! 515: STX_I	stx	%r20, [%r4 + 0x0ad0]
	.word 0xc0212bcc  ! 515: STW_I	stw	%r0, [%r4 + 0x0bcc]
	.word 0xc1392068  ! 515: STDF_I	std	%f0, [0x0068, %r4]
	.word 0xc4212c6c  ! 515: STW_I	stw	%r2, [%r4 + 0x0c6c]
	.word 0xc67123e0  ! 525: STX_I	stx	%r3, [%r4 + 0x03e0]
	.word 0xc029224a  ! 525: STB_I	stb	%r0, [%r4 + 0x024a]
	.word 0xf4710005  ! 525: STX_R	stx	%r26, [%r4 + %r5]
	.word 0xf4710005  ! 525: STX_R	stx	%r26, [%r4 + %r5]
	.word 0xc6210005  ! 525: STW_R	stw	%r3, [%r4 + %r5]
	.word 0xfc210005  ! 525: STW_R	stw	%r30, [%r4 + %r5]
	.word 0xc6e90025  ! 525: LDSTUBA_R	ldstuba	%r3, [%r4 + %r5] 0x01
	.word 0xc02920ea  ! 525: STB_I	stb	%r0, [%r4 + 0x00ea]
	.word 0xe4712f58  ! 533: STX_I	stx	%r18, [%r4 + 0x0f58]
	.word 0xd0210005  ! 533: STW_R	stw	%r8, [%r4 + %r5]
	.word 0xc47120a0  ! 533: STX_I	stx	%r2, [%r4 + 0x00a0]
	.word 0xc42926f2  ! 533: STB_I	stb	%r2, [%r4 + 0x06f2]
	.word 0xc4312300  ! 533: STH_I	sth	%r2, [%r4 + 0x0300]
	.word 0xc2290005  ! 533: STB_R	stb	%r1, [%r4 + %r5]
	.word 0xc5210005  ! 533: STF_R	st	%f2, [%r5, %r4]
	.word 0xcc712858  ! 533: STX_I	stx	%r6, [%r4 + 0x0858]
	.word 0xea2123c4  ! 543: STW_I	stw	%r21, [%r4 + 0x03c4]
	.word 0xc0710005  ! 543: STX_R	stx	%r0, [%r4 + %r5]
	.word 0xc0710005  ! 543: STX_R	stx	%r0, [%r4 + %r5]
	.word 0xe4310005  ! 543: STH_R	sth	%r18, [%r4 + %r5]
	.word 0xc0290005  ! 543: STB_R	stb	%r0, [%r4 + %r5]
	.word 0xc6312732  ! 543: STH_I	sth	%r3, [%r4 + 0x0732]
	.word 0xc4710005  ! 543: STX_R	stx	%r2, [%r4 + %r5]
	.word 0xc23124d8  ! 543: STH_I	sth	%r1, [%r4 + 0x04d8]
	.word 0xc1210005  ! 543: STF_R	st	%f0, [%r5, %r4]
	.word 0xc0290005  ! 551: STB_R	stb	%r0, [%r4 + %r5]
	.word 0xc0292e81  ! 551: STB_I	stb	%r0, [%r4 + 0x0e81]
	.word 0xc23128c0  ! 551: STH_I	sth	%r1, [%r4 + 0x08c0]
	.word 0xc62929c8  ! 551: STB_I	stb	%r3, [%r4 + 0x09c8]
	.word 0xc6212170  ! 551: STW_I	stw	%r3, [%r4 + 0x0170]
	.word 0xde712320  ! 551: STX_I	stx	%r15, [%r4 + 0x0320]
	.word 0xd6790005  ! 551: SWAP_R	swap	%r11, [%r4 + %r5]
	.word 0xe6290005  ! 551: STB_R	stb	%r19, [%r4 + %r5]
	.word 0xc4310005  ! 560: STH_R	sth	%r2, [%r4 + %r5]
	.word 0xc4212830  ! 560: STW_I	stw	%r2, [%r4 + 0x0830]
	.word 0xc6712560  ! 560: STX_I	stx	%r3, [%r4 + 0x0560]
	.word 0xce2920a2  ! 560: STB_I	stb	%r7, [%r4 + 0x00a2]
	.word 0xc6290005  ! 560: STB_R	stb	%r3, [%r4 + %r5]
	.word 0xc6310005  ! 560: STH_R	sth	%r3, [%r4 + %r5]
	.word 0xc47126c0  ! 560: STX_I	stx	%r2, [%r4 + 0x06c0]
	.word 0xc0712bc0  ! 560: STX_I	stx	%r0, [%r4 + 0x0bc0]
	.word 0xc2712760  ! 560: STX_I	stx	%r1, [%r4 + 0x0760]
	.word 0xc0310005  ! 568: STH_R	sth	%r0, [%r4 + %r5]
	.word 0xc4292ed1  ! 568: STB_I	stb	%r2, [%r4 + 0x0ed1]
	.word 0xc2212da8  ! 568: STW_I	stw	%r1, [%r4 + 0x0da8]
	.word 0xd63128a0  ! 568: STH_I	sth	%r11, [%r4 + 0x08a0]
	.word 0xc6710005  ! 568: STX_R	stx	%r3, [%r4 + %r5]
	.word 0xc0212a24  ! 568: STW_I	stw	%r0, [%r4 + 0x0a24]
	.word 0xfce90025  ! 568: LDSTUBA_R	ldstuba	%r30, [%r4 + %r5] 0x01
	.word 0xc0292d31  ! 568: STB_I	stb	%r0, [%r4 + 0x0d31]
	.word 0xec712e58  ! 576: STX_I	stx	%r22, [%r4 + 0x0e58]
	.word 0xee210005  ! 576: STW_R	stw	%r23, [%r4 + %r5]
	.word 0xc4212830  ! 576: STW_I	stw	%r2, [%r4 + 0x0830]
	.word 0xc2310005  ! 576: STH_R	sth	%r1, [%r4 + %r5]
	.word 0xc021270c  ! 576: STW_I	stw	%r0, [%r4 + 0x070c]
	.word 0xfe2921ba  ! 576: STB_I	stb	%r31, [%r4 + 0x01ba]
	.word 0xeee92e0b  ! 576: LDSTUBA_I	ldstuba	%r23, [%r4 + 0x0e0b] %asi
	.word 0xc2710005  ! 576: STX_R	stx	%r1, [%r4 + %r5]
	.word 0xce21297c  ! 585: STW_I	stw	%r7, [%r4 + 0x097c]
	.word 0xc2310005  ! 585: STH_R	sth	%r1, [%r4 + %r5]
	.word 0xc6310005  ! 585: STH_R	sth	%r3, [%r4 + %r5]
	.word 0xfa290005  ! 585: STB_R	stb	%r29, [%r4 + %r5]
	.word 0xec310005  ! 585: STH_R	sth	%r22, [%r4 + %r5]
	.word 0xc6292549  ! 585: STB_I	stb	%r3, [%r4 + 0x0549]
	.word 0xc2712c50  ! 585: STX_I	stx	%r1, [%r4 + 0x0c50]
	.word 0xc4e921c5  ! 585: LDSTUBA_I	ldstuba	%r2, [%r4 + 0x01c5] %asi
	.word 0xc6210005  ! 585: STW_R	stw	%r3, [%r4 + %r5]
	.word 0xd4310005  ! 594: STH_R	sth	%r10, [%r4 + %r5]
	.word 0xe4310005  ! 594: STH_R	sth	%r18, [%r4 + %r5]
	.word 0xc0710005  ! 594: STX_R	stx	%r0, [%r4 + %r5]
	.word 0xc6290005  ! 594: STB_R	stb	%r3, [%r4 + %r5]
	.word 0xf2290005  ! 594: STB_R	stb	%r25, [%r4 + %r5]
	.word 0xc67121c8  ! 594: STX_I	stx	%r3, [%r4 + 0x01c8]
	.word 0xc7390005  ! 594: STDF_R	std	%f3, [%r5, %r4]
	.word 0xe43125aa  ! 594: STH_I	sth	%r18, [%r4 + 0x05aa]
	.word 0xc6712150  ! 604: STX_I	stx	%r3, [%r4 + 0x0150]
	.word 0xc0710005  ! 604: STX_R	stx	%r0, [%r4 + %r5]
	.word 0xd2210005  ! 604: STW_R	stw	%r9, [%r4 + %r5]
	.word 0xc621210c  ! 604: STW_I	stw	%r3, [%r4 + 0x010c]
	.word 0xdc310005  ! 604: STH_R	sth	%r14, [%r4 + %r5]
	.word 0xd621283c  ! 604: STW_I	stw	%r11, [%r4 + 0x083c]
	.word 0xda710005  ! 604: STX_R	stx	%r13, [%r4 + %r5]
	.word 0xc7390005  ! 604: STDF_R	std	%f3, [%r5, %r4]
	.word 0xc421210c  ! 604: STW_I	stw	%r2, [%r4 + 0x010c]
	.word 0xe2292db9  ! 612: STB_I	stb	%r17, [%r4 + 0x0db9]
	.word 0xf22928c3  ! 612: STB_I	stb	%r25, [%r4 + 0x08c3]
	.word 0xc2210005  ! 612: STW_R	stw	%r1, [%r4 + %r5]
	.word 0xf0212710  ! 612: STW_I	stw	%r24, [%r4 + 0x0710]
	.word 0xc6210005  ! 612: STW_R	stw	%r3, [%r4 + %r5]
	.word 0xc4290005  ! 612: STB_R	stb	%r2, [%r4 + %r5]
	.word 0xc53926c8  ! 612: STDF_I	std	%f2, [0x06c8, %r4]
	.word 0xea292f05  ! 612: STB_I	stb	%r21, [%r4 + 0x0f05]
	.word 0xc4310005  ! 621: STH_R	sth	%r2, [%r4 + %r5]
	.word 0xc6712d88  ! 621: STX_I	stx	%r3, [%r4 + 0x0d88]
	.word 0xc4210005  ! 621: STW_R	stw	%r2, [%r4 + %r5]
	.word 0xce292e53  ! 621: STB_I	stb	%r7, [%r4 + 0x0e53]
	.word 0xc0210005  ! 621: STW_R	stw	%r0, [%r4 + %r5]
	.word 0xc6710005  ! 621: STX_R	stx	%r3, [%r4 + %r5]
	.word 0xc7210005  ! 621: STF_R	st	%f3, [%r5, %r4]
	.word 0xe8710005  ! 621: STX_R	stx	%r20, [%r4 + %r5]
	.word 0xc6710005  ! 634: STX_R	stx	%r3, [%r4 + %r5]
	.word 0xc4210005  ! 634: STW_R	stw	%r2, [%r4 + %r5]
	.word 0xfa292906  ! 634: STB_I	stb	%r29, [%r4 + 0x0906]
	.word 0xde290005  ! 634: STB_R	stb	%r15, [%r4 + %r5]
	.word 0xcc212338  ! 634: STW_I	stw	%r6, [%r4 + 0x0338]
	.word 0xc021203c  ! 634: STW_I	stw	%r0, [%r4 + 0x003c]
	.word 0xc1210005  ! 634: STF_R	st	%f0, [%r5, %r4]
	.word 0xe8310005  ! 634: STH_R	sth	%r20, [%r4 + %r5]
	.word 0xc4310005  ! 642: STH_R	sth	%r2, [%r4 + %r5]
	.word 0xf2310005  ! 642: STH_R	sth	%r25, [%r4 + %r5]
	.word 0xc4292413  ! 642: STB_I	stb	%r2, [%r4 + 0x0413]
	.word 0xc2292a4a  ! 642: STB_I	stb	%r1, [%r4 + 0x0a4a]
	.word 0xc2210005  ! 642: STW_R	stw	%r1, [%r4 + %r5]
	.word 0xc4292656  ! 642: STB_I	stb	%r2, [%r4 + 0x0656]
	.word 0xc2f90025  ! 642: SWAPA_R	swapa	%r1, [%r4 + %r5] 0x01
	.word 0xd2290005  ! 642: STB_R	stb	%r9, [%r4 + %r5]
	.word 0xc47125a8  ! 651: STX_I	stx	%r2, [%r4 + 0x05a8]
	.word 0xc4212f7c  ! 651: STW_I	stw	%r2, [%r4 + 0x0f7c]
	.word 0xc4292e9c  ! 651: STB_I	stb	%r2, [%r4 + 0x0e9c]
	.word 0xc4312144  ! 651: STH_I	sth	%r2, [%r4 + 0x0144]
	.word 0xec310005  ! 651: STH_R	sth	%r22, [%r4 + %r5]
	.word 0xc4212668  ! 651: STW_I	stw	%r2, [%r4 + 0x0668]
	.word 0xc2e90025  ! 651: LDSTUBA_R	ldstuba	%r1, [%r4 + %r5] 0x01
	.word 0xc0712e60  ! 651: STX_I	stx	%r0, [%r4 + 0x0e60]
	.word 0xc2210005  ! 660: STW_R	stw	%r1, [%r4 + %r5]
	.word 0xc4212784  ! 660: STW_I	stw	%r2, [%r4 + 0x0784]
	.word 0xc6712258  ! 660: STX_I	stx	%r3, [%r4 + 0x0258]
	.word 0xc4292f1b  ! 660: STB_I	stb	%r2, [%r4 + 0x0f1b]
	.word 0xc6212b04  ! 660: STW_I	stw	%r3, [%r4 + 0x0b04]
	.word 0xc4712590  ! 660: STX_I	stx	%r2, [%r4 + 0x0590]
	.word 0xf479299c  ! 660: SWAP_I	swap	%r26, [%r4 + 0x099c]
	.word 0xe8712540  ! 660: STX_I	stx	%r20, [%r4 + 0x0540]
	.word 0xc6290005  ! 668: STB_R	stb	%r3, [%r4 + %r5]
	.word 0xda310005  ! 668: STH_R	sth	%r13, [%r4 + %r5]
	.word 0xc231241e  ! 668: STH_I	sth	%r1, [%r4 + 0x041e]
	.word 0xce712880  ! 668: STX_I	stx	%r7, [%r4 + 0x0880]
	.word 0xc2310005  ! 668: STH_R	sth	%r1, [%r4 + %r5]
	.word 0xc0210005  ! 668: STW_R	stw	%r0, [%r4 + %r5]
	.word 0xc1210005  ! 668: STF_R	st	%f0, [%r5, %r4]
	.word 0xda310005  ! 668: STH_R	sth	%r13, [%r4 + %r5]
	.word 0xc6710005  ! 676: STX_R	stx	%r3, [%r4 + %r5]
	.word 0xea29259e  ! 676: STB_I	stb	%r21, [%r4 + 0x059e]
	.word 0xc2292fc5  ! 676: STB_I	stb	%r1, [%r4 + 0x0fc5]
	.word 0xc22922f3  ! 676: STB_I	stb	%r1, [%r4 + 0x02f3]
	.word 0xd6310005  ! 676: STH_R	sth	%r11, [%r4 + %r5]
	.word 0xc0290005  ! 676: STB_R	stb	%r0, [%r4 + %r5]
	.word 0xe93925d0  ! 676: STDF_I	std	%f20, [0x05d0, %r4]
	.word 0xc0312e5a  ! 676: STH_I	sth	%r0, [%r4 + 0x0e5a]
	.word 0xc0212d44  ! 690: STW_I	stw	%r0, [%r4 + 0x0d44]
	.word 0xc2292308  ! 690: STB_I	stb	%r1, [%r4 + 0x0308]
	.word 0xc6292200  ! 690: STB_I	stb	%r3, [%r4 + 0x0200]
	.word 0xc4212520  ! 690: STW_I	stw	%r2, [%r4 + 0x0520]
	.word 0xc2710005  ! 690: STX_R	stx	%r1, [%r4 + %r5]
	.word 0xc0292d5a  ! 690: STB_I	stb	%r0, [%r4 + 0x0d5a]
	.word 0xc7212c98  ! 690: STF_I	st	%f3, [0x0c98, %r4]
	.word 0xc0210005  ! 690: STW_R	stw	%r0, [%r4 + %r5]
	.word 0xf42122c4  ! 698: STW_I	stw	%r26, [%r4 + 0x02c4]
	.word 0xc0710005  ! 698: STX_R	stx	%r0, [%r4 + %r5]
	.word 0xc0310005  ! 698: STH_R	sth	%r0, [%r4 + %r5]
	.word 0xc0712a20  ! 698: STX_I	stx	%r0, [%r4 + 0x0a20]
	.word 0xc2710005  ! 698: STX_R	stx	%r1, [%r4 + %r5]
	.word 0xc2290005  ! 698: STB_R	stb	%r1, [%r4 + %r5]
	.word 0xc4790005  ! 698: SWAP_R	swap	%r2, [%r4 + %r5]
	.word 0xc4212070  ! 698: STW_I	stw	%r2, [%r4 + 0x0070]
	.word 0xc62926da  ! 707: STB_I	stb	%r3, [%r4 + 0x06da]
	.word 0xc0290005  ! 707: STB_R	stb	%r0, [%r4 + %r5]
	.word 0xc6310005  ! 707: STH_R	sth	%r3, [%r4 + %r5]
	.word 0xc031288c  ! 707: STH_I	sth	%r0, [%r4 + 0x088c]
	.word 0xfa292353  ! 707: STB_I	stb	%r29, [%r4 + 0x0353]
	.word 0xce2124f8  ! 707: STW_I	stw	%r7, [%r4 + 0x04f8]
	.word 0xc0790005  ! 707: SWAP_R	swap	%r0, [%r4 + %r5]
	.word 0xc0710005  ! 707: STX_R	stx	%r0, [%r4 + %r5]
	.word 0xc6310005  ! 716: STH_R	sth	%r3, [%r4 + %r5]
	.word 0xc4292cc6  ! 716: STB_I	stb	%r2, [%r4 + 0x0cc6]
	.word 0xc0290005  ! 716: STB_R	stb	%r0, [%r4 + %r5]
	.word 0xc0292914  ! 716: STB_I	stb	%r0, [%r4 + 0x0914]
	.word 0xfc290005  ! 716: STB_R	stb	%r30, [%r4 + %r5]
	.word 0xc2210005  ! 716: STW_R	stw	%r1, [%r4 + %r5]
	.word 0xc2310005  ! 716: STH_R	sth	%r1, [%r4 + %r5]
	.word 0xe8210005  ! 716: STW_R	stw	%r20, [%r4 + %r5]
	.word 0xf4f92338  ! 716: SWAPA_I	swapa	%r26, [%r4 + 0x0338] %asi
	.word 0xc4292b73  ! 724: STB_I	stb	%r2, [%r4 + 0x0b73]
	.word 0xd82929cf  ! 724: STB_I	stb	%r12, [%r4 + 0x09cf]
	.word 0xc6712a48  ! 724: STX_I	stx	%r3, [%r4 + 0x0a48]
	.word 0xfc290005  ! 724: STB_R	stb	%r30, [%r4 + %r5]
	.word 0xc6310005  ! 724: STH_R	sth	%r3, [%r4 + %r5]
	.word 0xc47121a8  ! 724: STX_I	stx	%r2, [%r4 + 0x01a8]
	.word 0xdd2124f0  ! 724: STF_I	st	%f14, [0x04f0, %r4]
	.word 0xc0712cc8  ! 724: STX_I	stx	%r0, [%r4 + 0x0cc8]
	.word 0xc03127d0  ! 732: STH_I	sth	%r0, [%r4 + 0x07d0]
	.word 0xc4712f08  ! 732: STX_I	stx	%r2, [%r4 + 0x0f08]
	.word 0xe6712c98  ! 732: STX_I	stx	%r19, [%r4 + 0x0c98]
	.word 0xc6292786  ! 732: STB_I	stb	%r3, [%r4 + 0x0786]
	.word 0xc4210005  ! 732: STW_R	stw	%r2, [%r4 + %r5]
	.word 0xd0310005  ! 732: STH_R	sth	%r8, [%r4 + %r5]
	.word 0xc32127d4  ! 732: STF_I	st	%f1, [0x07d4, %r4]
	.word 0xc2310005  ! 732: STH_R	sth	%r1, [%r4 + %r5]
	.word 0xee712be0  ! 744: STX_I	stx	%r23, [%r4 + 0x0be0]
	.word 0xc2710005  ! 744: STX_R	stx	%r1, [%r4 + %r5]
	.word 0xfa710005  ! 744: STX_R	stx	%r29, [%r4 + %r5]
	.word 0xc42121e4  ! 744: STW_I	stw	%r2, [%r4 + 0x01e4]
	.word 0xc4712650  ! 744: STX_I	stx	%r2, [%r4 + 0x0650]
	.word 0xc03128ca  ! 744: STH_I	sth	%r0, [%r4 + 0x08ca]
	.word 0xf5f10025  ! 744: CASXA_I	casxa	[%r4] 0x 1, %r5, %r26
	.word 0xc6292c54  ! 744: STB_I	stb	%r3, [%r4 + 0x0c54]
	.word 0xc6292fcd  ! 752: STB_I	stb	%r3, [%r4 + 0x0fcd]
	.word 0xc6292924  ! 752: STB_I	stb	%r3, [%r4 + 0x0924]
	.word 0xc4210005  ! 752: STW_R	stw	%r2, [%r4 + %r5]
	.word 0xc2212a30  ! 752: STW_I	stw	%r1, [%r4 + 0x0a30]
	.word 0xda210005  ! 752: STW_R	stw	%r13, [%r4 + %r5]
	.word 0xc6710005  ! 752: STX_R	stx	%r3, [%r4 + %r5]
	.word 0xc6790005  ! 752: SWAP_R	swap	%r3, [%r4 + %r5]
	.word 0xfa2123e8  ! 752: STW_I	stw	%r29, [%r4 + 0x03e8]
	.word 0xc6712918  ! 761: STX_I	stx	%r3, [%r4 + 0x0918]
	.word 0xd2312812  ! 761: STH_I	sth	%r9, [%r4 + 0x0812]
	.word 0xc0210005  ! 761: STW_R	stw	%r0, [%r4 + %r5]
	.word 0xc4310005  ! 761: STH_R	sth	%r2, [%r4 + %r5]
	.word 0xce290005  ! 761: STB_R	stb	%r7, [%r4 + %r5]
	.word 0xc6310005  ! 761: STH_R	sth	%r3, [%r4 + %r5]
	.word 0xc23128fc  ! 761: STH_I	sth	%r1, [%r4 + 0x08fc]
	.word 0xc27122c0  ! 761: STX_I	stx	%r1, [%r4 + 0x02c0]
	.word 0xc3390005  ! 761: STDF_R	std	%f1, [%r5, %r4]
	.word 0xfe210005  ! 773: STW_R	stw	%r31, [%r4 + %r5]
	.word 0xc4290005  ! 773: STB_R	stb	%r2, [%r4 + %r5]
	.word 0xc4210005  ! 773: STW_R	stw	%r2, [%r4 + %r5]
	.word 0xc6210005  ! 773: STW_R	stw	%r3, [%r4 + %r5]
	.word 0xc2292629  ! 773: STB_I	stb	%r1, [%r4 + 0x0629]
	.word 0xc4290005  ! 773: STB_R	stb	%r2, [%r4 + %r5]
	.word 0xfa310005  ! 773: STH_R	sth	%r29, [%r4 + %r5]
	.word 0xd2790005  ! 773: SWAP_R	swap	%r9, [%r4 + %r5]
	.word 0xc4210005  ! 773: STW_R	stw	%r2, [%r4 + %r5]
	.word 0xc231252e  ! 784: STH_I	sth	%r1, [%r4 + 0x052e]
	.word 0xc429281e  ! 784: STB_I	stb	%r2, [%r4 + 0x081e]
	.word 0xfe292ee2  ! 784: STB_I	stb	%r31, [%r4 + 0x0ee2]
	.word 0xd0210005  ! 784: STW_R	stw	%r8, [%r4 + %r5]
	.word 0xc0712458  ! 784: STX_I	stx	%r0, [%r4 + 0x0458]
	.word 0xfa710005  ! 784: STX_R	stx	%r29, [%r4 + %r5]
	.word 0xc7392048  ! 784: STDF_I	std	%f3, [0x0048, %r4]
	.word 0xc6290005  ! 784: STB_R	stb	%r3, [%r4 + %r5]
	.word 0xc0310005  ! 792: STH_R	sth	%r0, [%r4 + %r5]
	.word 0xc2710005  ! 792: STX_R	stx	%r1, [%r4 + %r5]
	.word 0xc2290005  ! 792: STB_R	stb	%r1, [%r4 + %r5]
	.word 0xc4710005  ! 792: STX_R	stx	%r2, [%r4 + %r5]
	.word 0xda710005  ! 792: STX_R	stx	%r13, [%r4 + %r5]
	.word 0xc4210005  ! 792: STW_R	stw	%r2, [%r4 + %r5]
	.word 0xeb210005  ! 792: STF_R	st	%f21, [%r5, %r4]
	.word 0xc0210005  ! 792: STW_R	stw	%r0, [%r4 + %r5]
	.word 0xea29238e  ! 800: STB_I	stb	%r21, [%r4 + 0x038e]
	.word 0xc03121c0  ! 800: STH_I	sth	%r0, [%r4 + 0x01c0]
	.word 0xf2292ebd  ! 800: STB_I	stb	%r25, [%r4 + 0x0ebd]
	.word 0xc2310005  ! 800: STH_R	sth	%r1, [%r4 + %r5]
	.word 0xc4312332  ! 800: STH_I	sth	%r2, [%r4 + 0x0332]
	.word 0xc0710005  ! 800: STX_R	stx	%r0, [%r4 + %r5]
	.word 0xcf390005  ! 800: STDF_R	std	%f7, [%r5, %r4]
	.word 0xd2710005  ! 800: STX_R	stx	%r9, [%r4 + %r5]
	.word 0xde31258c  ! 810: STH_I	sth	%r15, [%r4 + 0x058c]
	.word 0xc4212744  ! 810: STW_I	stw	%r2, [%r4 + 0x0744]
	.word 0xc4710005  ! 810: STX_R	stx	%r2, [%r4 + %r5]
	.word 0xc2310005  ! 810: STH_R	sth	%r1, [%r4 + %r5]
	.word 0xe2210005  ! 810: STW_R	stw	%r17, [%r4 + %r5]
	.word 0xc6212580  ! 810: STW_I	stw	%r3, [%r4 + 0x0580]
	.word 0xc3e12005  ! 810: CASA_R	casa	[%r4] %asi, %r5, %r1
	.word 0xda710005  ! 810: STX_R	stx	%r13, [%r4 + %r5]
	.word 0xc27122a8  ! 820: STX_I	stx	%r1, [%r4 + 0x02a8]
	.word 0xf03128a8  ! 820: STH_I	sth	%r24, [%r4 + 0x08a8]
	.word 0xc6712a80  ! 820: STX_I	stx	%r3, [%r4 + 0x0a80]
	.word 0xd8712088  ! 820: STX_I	stx	%r12, [%r4 + 0x0088]
	.word 0xc0312368  ! 820: STH_I	sth	%r0, [%r4 + 0x0368]
	.word 0xc0212284  ! 820: STW_I	stw	%r0, [%r4 + 0x0284]
	.word 0xd5392bb0  ! 820: STDF_I	std	%f10, [0x0bb0, %r4]
	.word 0xc4292321  ! 820: STB_I	stb	%r2, [%r4 + 0x0321]
	.word 0xc231293c  ! 828: STH_I	sth	%r1, [%r4 + 0x093c]
	.word 0xc2210005  ! 828: STW_R	stw	%r1, [%r4 + %r5]
	.word 0xde290005  ! 828: STB_R	stb	%r15, [%r4 + %r5]
	.word 0xc429242a  ! 828: STB_I	stb	%r2, [%r4 + 0x042a]
	.word 0xc42125c0  ! 828: STW_I	stw	%r2, [%r4 + 0x05c0]
	.word 0xc4210005  ! 828: STW_R	stw	%r2, [%r4 + %r5]
	.word 0xfd392a38  ! 828: STDF_I	std	%f30, [0x0a38, %r4]
	.word 0xc23122c2  ! 828: STH_I	sth	%r1, [%r4 + 0x02c2]
	.word 0xc6290005  ! 838: STB_R	stb	%r3, [%r4 + %r5]
	.word 0xc0712d10  ! 838: STX_I	stx	%r0, [%r4 + 0x0d10]
	.word 0xf4310005  ! 838: STH_R	sth	%r26, [%r4 + %r5]
	.word 0xc43124bc  ! 838: STH_I	sth	%r2, [%r4 + 0x04bc]
	.word 0xc0212830  ! 838: STW_I	stw	%r0, [%r4 + 0x0830]
	.word 0xc6710005  ! 838: STX_R	stx	%r3, [%r4 + %r5]
	.word 0xc3390005  ! 838: STDF_R	std	%f1, [%r5, %r4]
	.word 0xc2292f21  ! 838: STB_I	stb	%r1, [%r4 + 0x0f21]
	.word 0xf4210005  ! 848: STW_R	stw	%r26, [%r4 + %r5]
	.word 0xc4210005  ! 848: STW_R	stw	%r2, [%r4 + %r5]
	.word 0xc6310005  ! 848: STH_R	sth	%r3, [%r4 + %r5]
	.word 0xc4292fd5  ! 848: STB_I	stb	%r2, [%r4 + 0x0fd5]
	.word 0xc4290005  ! 848: STB_R	stb	%r2, [%r4 + %r5]
	.word 0xd831234a  ! 848: STH_I	sth	%r12, [%r4 + 0x034a]
	.word 0xf8710005  ! 848: STX_R	stx	%r28, [%r4 + %r5]
	.word 0xdbf12005  ! 848: CASXA_R	casxa	[%r4]%asi, %r5, %r13
	.word 0xfa312c9c  ! 848: STH_I	sth	%r29, [%r4 + 0x0c9c]
	.word 0xce310005  ! 857: STH_R	sth	%r7, [%r4 + %r5]
	.word 0xd8712a60  ! 857: STX_I	stx	%r12, [%r4 + 0x0a60]
	.word 0xea312516  ! 857: STH_I	sth	%r21, [%r4 + 0x0516]
	.word 0xc0712a50  ! 857: STX_I	stx	%r0, [%r4 + 0x0a50]
	.word 0xe42925b3  ! 857: STB_I	stb	%r18, [%r4 + 0x05b3]
	.word 0xc6212a5c  ! 857: STW_I	stw	%r3, [%r4 + 0x0a5c]
	.word 0xdc310005  ! 857: STH_R	sth	%r14, [%r4 + %r5]
	.word 0xc2290005  ! 857: STB_R	stb	%r1, [%r4 + %r5]
	.word 0xc0712790  ! 857: STX_I	stx	%r0, [%r4 + 0x0790]
	.word 0xd0712048  ! 867: STX_I	stx	%r8, [%r4 + 0x0048]
	.word 0xc0292609  ! 867: STB_I	stb	%r0, [%r4 + 0x0609]
	.word 0xc22929b6  ! 867: STB_I	stb	%r1, [%r4 + 0x09b6]
	.word 0xc6290005  ! 867: STB_R	stb	%r3, [%r4 + %r5]
	.word 0xc4712a50  ! 867: STX_I	stx	%r2, [%r4 + 0x0a50]
	.word 0xd4310005  ! 867: STH_R	sth	%r10, [%r4 + %r5]
	.word 0xd62923c0  ! 867: STB_I	stb	%r11, [%r4 + 0x03c0]
	.word 0xdb390005  ! 867: STDF_R	std	%f13, [%r5, %r4]
	.word 0xc62122d8  ! 867: STW_I	stw	%r3, [%r4 + 0x02d8]
	.word 0xce312ac8  ! 875: STH_I	sth	%r7, [%r4 + 0x0ac8]
	.word 0xc62121c0  ! 875: STW_I	stw	%r3, [%r4 + 0x01c0]
	.word 0xc031203c  ! 875: STH_I	sth	%r0, [%r4 + 0x003c]
	.word 0xce292b84  ! 875: STB_I	stb	%r7, [%r4 + 0x0b84]
	.word 0xc4210005  ! 875: STW_R	stw	%r2, [%r4 + %r5]
	.word 0xc4710005  ! 875: STX_R	stx	%r2, [%r4 + %r5]
	.word 0xc6790005  ! 875: SWAP_R	swap	%r3, [%r4 + %r5]
	.word 0xc43121b6  ! 875: STH_I	sth	%r2, [%r4 + 0x01b6]
	.word 0xc2312f52  ! 883: STH_I	sth	%r1, [%r4 + 0x0f52]
	.word 0xc2310005  ! 883: STH_R	sth	%r1, [%r4 + %r5]
	.word 0xde290005  ! 883: STB_R	stb	%r15, [%r4 + %r5]
	.word 0xc6712550  ! 883: STX_I	stx	%r3, [%r4 + 0x0550]
	.word 0xc2312d46  ! 883: STH_I	sth	%r1, [%r4 + 0x0d46]
	.word 0xc4292c42  ! 883: STB_I	stb	%r2, [%r4 + 0x0c42]
	.word 0xc3210005  ! 883: STF_R	st	%f1, [%r5, %r4]
	.word 0xc2312dda  ! 883: STH_I	sth	%r1, [%r4 + 0x0dda]
	.word 0xc229296e  ! 892: STB_I	stb	%r1, [%r4 + 0x096e]
	.word 0xdc292ee5  ! 892: STB_I	stb	%r14, [%r4 + 0x0ee5]
	.word 0xe2710005  ! 892: STX_R	stx	%r17, [%r4 + %r5]
	.word 0xfa210005  ! 892: STW_R	stw	%r29, [%r4 + %r5]
	.word 0xf2312380  ! 892: STH_I	sth	%r25, [%r4 + 0x0380]
	.word 0xc43127dc  ! 892: STH_I	sth	%r2, [%r4 + 0x07dc]
	.word 0xf2712a20  ! 892: STX_I	stx	%r25, [%r4 + 0x0a20]
	.word 0xc7392a60  ! 892: STDF_I	std	%f3, [0x0a60, %r4]
	.word 0xc0712ba0  ! 892: STX_I	stx	%r0, [%r4 + 0x0ba0]
	.word 0xf82926b2  ! 901: STB_I	stb	%r28, [%r4 + 0x06b2]
	.word 0xc0292240  ! 901: STB_I	stb	%r0, [%r4 + 0x0240]
	.word 0xc0312fd8  ! 901: STH_I	sth	%r0, [%r4 + 0x0fd8]
	.word 0xe4310005  ! 901: STH_R	sth	%r18, [%r4 + %r5]
	.word 0xde710005  ! 901: STX_R	stx	%r15, [%r4 + %r5]
	.word 0xc4290005  ! 901: STB_R	stb	%r2, [%r4 + %r5]
	.word 0xc2e9269a  ! 901: LDSTUBA_I	ldstuba	%r1, [%r4 + 0x069a] %asi
	.word 0xc0312d18  ! 901: STH_I	sth	%r0, [%r4 + 0x0d18]
	.word 0xc6210005  ! 909: STW_R	stw	%r3, [%r4 + %r5]
	.word 0xc6210005  ! 909: STW_R	stw	%r3, [%r4 + %r5]
	.word 0xc4210005  ! 909: STW_R	stw	%r2, [%r4 + %r5]
	.word 0xc4290005  ! 909: STB_R	stb	%r2, [%r4 + %r5]
	.word 0xc47120f0  ! 909: STX_I	stx	%r2, [%r4 + 0x00f0]
	.word 0xc6290005  ! 909: STB_R	stb	%r3, [%r4 + %r5]
	.word 0xc5f12005  ! 909: CASXA_R	casxa	[%r4]%asi, %r5, %r2
	.word 0xf8310005  ! 909: STH_R	sth	%r28, [%r4 + %r5]
	.word 0xc0290005  ! 917: STB_R	stb	%r0, [%r4 + %r5]
	.word 0xc4710005  ! 917: STX_R	stx	%r2, [%r4 + %r5]
	.word 0xc4292a78  ! 917: STB_I	stb	%r2, [%r4 + 0x0a78]
	.word 0xc6312a82  ! 917: STH_I	sth	%r3, [%r4 + 0x0a82]
	.word 0xde212590  ! 917: STW_I	stw	%r15, [%r4 + 0x0590]
	.word 0xc6710005  ! 917: STX_R	stx	%r3, [%r4 + %r5]
	.word 0xe9210005  ! 917: STF_R	st	%f20, [%r5, %r4]
	.word 0xe0312c26  ! 917: STH_I	sth	%r16, [%r4 + 0x0c26]
	.word 0xc03122d4  ! 926: STH_I	sth	%r0, [%r4 + 0x02d4]
	.word 0xc0210005  ! 926: STW_R	stw	%r0, [%r4 + %r5]
	.word 0xdc710005  ! 926: STX_R	stx	%r14, [%r4 + %r5]
	.word 0xfe312320  ! 926: STH_I	sth	%r31, [%r4 + 0x0320]
	.word 0xc4712908  ! 926: STX_I	stx	%r2, [%r4 + 0x0908]
	.word 0xc4210005  ! 926: STW_R	stw	%r2, [%r4 + %r5]
	.word 0xdd212494  ! 926: STF_I	st	%f14, [0x0494, %r4]
	.word 0xd2310005  ! 926: STH_R	sth	%r9, [%r4 + %r5]
	.word 0xc42927b5  ! 935: STB_I	stb	%r2, [%r4 + 0x07b5]
	.word 0xc2310005  ! 935: STH_R	sth	%r1, [%r4 + %r5]
	.word 0xd6712718  ! 935: STX_I	stx	%r11, [%r4 + 0x0718]
	.word 0xc0312c24  ! 935: STH_I	sth	%r0, [%r4 + 0x0c24]
	.word 0xc2312d2c  ! 935: STH_I	sth	%r1, [%r4 + 0x0d2c]
	.word 0xe8292adf  ! 935: STB_I	stb	%r20, [%r4 + 0x0adf]
	.word 0xc6710005  ! 935: STX_R	stx	%r3, [%r4 + %r5]
	.word 0xd0e90025  ! 935: LDSTUBA_R	ldstuba	%r8, [%r4 + %r5] 0x01
	.word 0xc6712d80  ! 935: STX_I	stx	%r3, [%r4 + 0x0d80]
	.word 0xc6712308  ! 943: STX_I	stx	%r3, [%r4 + 0x0308]
	.word 0xc221268c  ! 943: STW_I	stw	%r1, [%r4 + 0x068c]
	.word 0xd4210005  ! 943: STW_R	stw	%r10, [%r4 + %r5]
	.word 0xc22926af  ! 943: STB_I	stb	%r1, [%r4 + 0x06af]
	.word 0xc6712e70  ! 943: STX_I	stx	%r3, [%r4 + 0x0e70]
	.word 0xde310005  ! 943: STH_R	sth	%r15, [%r4 + %r5]
	.word 0xc33927a8  ! 943: STDF_I	std	%f1, [0x07a8, %r4]
	.word 0xe8310005  ! 943: STH_R	sth	%r20, [%r4 + %r5]
	.word 0xdc212108  ! 953: STW_I	stw	%r14, [%r4 + 0x0108]
	.word 0xc2290005  ! 953: STB_R	stb	%r1, [%r4 + %r5]
	.word 0xc0210005  ! 953: STW_R	stw	%r0, [%r4 + %r5]
	.word 0xd0212654  ! 953: STW_I	stw	%r8, [%r4 + 0x0654]
	.word 0xec290005  ! 953: STB_R	stb	%r22, [%r4 + %r5]
	.word 0xce712508  ! 953: STX_I	stx	%r7, [%r4 + 0x0508]
	.word 0xc3f10025  ! 953: CASXA_I	casxa	[%r4] 0x 1, %r5, %r1
	.word 0xc2212cf4  ! 953: STW_I	stw	%r1, [%r4 + 0x0cf4]
	.word 0xe2312c0e  ! 961: STH_I	sth	%r17, [%r4 + 0x0c0e]
	.word 0xc42928cb  ! 961: STB_I	stb	%r2, [%r4 + 0x08cb]
	.word 0xd42927cb  ! 961: STB_I	stb	%r10, [%r4 + 0x07cb]
	.word 0xe0290005  ! 961: STB_R	stb	%r16, [%r4 + %r5]
	.word 0xd82123dc  ! 961: STW_I	stw	%r12, [%r4 + 0x03dc]
	.word 0xc2292b78  ! 961: STB_I	stb	%r1, [%r4 + 0x0b78]
	.word 0xd1e10025  ! 961: CASA_I	casa	[%r4] 0x 1, %r5, %r8
	.word 0xe0290005  ! 961: STB_R	stb	%r16, [%r4 + %r5]
	.word 0xc4212724  ! 969: STW_I	stw	%r2, [%r4 + 0x0724]
	.word 0xd829259e  ! 969: STB_I	stb	%r12, [%r4 + 0x059e]
	.word 0xd8712c38  ! 969: STX_I	stx	%r12, [%r4 + 0x0c38]
	.word 0xc0710005  ! 969: STX_R	stx	%r0, [%r4 + %r5]
	.word 0xc2312c2c  ! 969: STH_I	sth	%r1, [%r4 + 0x0c2c]
	.word 0xc27125e8  ! 969: STX_I	stx	%r1, [%r4 + 0x05e8]
	.word 0xc0e90025  ! 969: LDSTUBA_R	ldstuba	%r0, [%r4 + %r5] 0x01
	.word 0xd8292fdc  ! 969: STB_I	stb	%r12, [%r4 + 0x0fdc]
	.word 0xc0310005  ! 978: STH_R	sth	%r0, [%r4 + %r5]
	.word 0xc0710005  ! 978: STX_R	stx	%r0, [%r4 + %r5]
	.word 0xf4712978  ! 978: STX_I	stx	%r26, [%r4 + 0x0978]
	.word 0xc47123b8  ! 978: STX_I	stx	%r2, [%r4 + 0x03b8]
	.word 0xc4712180  ! 978: STX_I	stx	%r2, [%r4 + 0x0180]
	.word 0xe0710005  ! 978: STX_R	stx	%r16, [%r4 + %r5]
	.word 0xf4790005  ! 978: SWAP_R	swap	%r26, [%r4 + %r5]
	.word 0xf82125fc  ! 978: STW_I	stw	%r28, [%r4 + 0x05fc]
	.word 0xde710005  ! 987: STX_R	stx	%r15, [%r4 + %r5]
	.word 0xc2710005  ! 987: STX_R	stx	%r1, [%r4 + %r5]
	.word 0xd6310005  ! 987: STH_R	sth	%r11, [%r4 + %r5]
	.word 0xc6210005  ! 987: STW_R	stw	%r3, [%r4 + %r5]
	.word 0xec210005  ! 987: STW_R	stw	%r22, [%r4 + %r5]
	.word 0xc2210005  ! 987: STW_R	stw	%r1, [%r4 + %r5]
	.word 0xfee90025  ! 987: LDSTUBA_R	ldstuba	%r31, [%r4 + %r5] 0x01
	.word 0xcc2125ac  ! 987: STW_I	stw	%r6, [%r4 + 0x05ac]
	.word 0xc0710005  ! 997: STX_R	stx	%r0, [%r4 + %r5]
	.word 0xc0210005  ! 997: STW_R	stw	%r0, [%r4 + %r5]
	.word 0xec2122d4  ! 997: STW_I	stw	%r22, [%r4 + 0x02d4]
	.word 0xfe712430  ! 997: STX_I	stx	%r31, [%r4 + 0x0430]
	.word 0xd8712358  ! 997: STX_I	stx	%r12, [%r4 + 0x0358]
	.word 0xc6710005  ! 997: STX_R	stx	%r3, [%r4 + %r5]
	.word 0xc1212dcc  ! 997: STF_I	st	%f0, [0x0dcc, %r4]
	.word 0xc2210005  ! 997: STW_R	stw	%r1, [%r4 + %r5]
        ta      T_GOOD_TRAP

th_main_3:
        setx  MAIN_BASE_DATA_VA, %r1, %r4
	    setx  0x10, %r1, %r5
        setx  0x80, %g2, %g1
        wr  %g1, %g0, %asi
	    rd %fprs, %g0
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
        setx  0x6a95a1544039128c, %g1, %r0
        setx  0x5da8eb4f087a0011, %g1, %r1
        setx  0xa3033408f154e7ee, %g1, %r2
        setx  0x609d086fc7f49efa, %g1, %r6
        setx  0x61227900b40ecc90, %g1, %r7
        setx  0xd86657fe9604d125, %g1, %r8
        setx  0x98f6335059052825, %g1, %r9
        setx  0x13f082876fa0e539, %g1, %r10
        setx  0xb74f0f949144f195, %g1, %r11
        setx  0x6599c9e2509a26de, %g1, %r12
        setx  0x45f7c2ccfa455393, %g1, %r13
        setx  0xd3fed12242f8b046, %g1, %r14
        setx  0xdfbe9df06ecb7f11, %g1, %r15
        setx  0x037c745a7c33e54e, %g1, %r16
        setx  0x85bb1b932194884f, %g1, %r17
        setx  0x5214e450bcab3804, %g1, %r18
        setx  0x89935d69ef5f4a0b, %g1, %r19
        setx  0x5348447f7551d33c, %g1, %r20
        setx  0x2365af61266fa5e6, %g1, %r21
        setx  0xf7ddcf45373b7d93, %g1, %r22
        setx  0x16816e8fdfec13a2, %g1, %r23
        setx  0xf3342ef25117e671, %g1, %r24
        setx  0xd9dc7ad542efaec0, %g1, %r25
        setx  0x8058e2197aa5587e, %g1, %r26
        setx  0x305cf2628bd7b9f8, %g1, %r27
        setx  0x1165eb2a4091eed8, %g1, %r28
        setx  0x6ca56e7cb79d8318, %g1, %r29
        setx  0x1fd5ea4653839560, %g1, %r30
        setx  0x36d2ce193205259a, %g1, %r31
	.word 0xc0210005  ! 9: STW_R	stw	%r0, [%r4 + %r5]
	.word 0xfa3127ec  ! 9: STH_I	sth	%r29, [%r4 + 0x07ec]
	.word 0xe07123c8  ! 9: STX_I	stx	%r16, [%r4 + 0x03c8]
	.word 0xc4312f16  ! 9: STH_I	sth	%r2, [%r4 + 0x0f16]
	.word 0xc42921c4  ! 9: STB_I	stb	%r2, [%r4 + 0x01c4]
	.word 0xc43125d6  ! 9: STH_I	sth	%r2, [%r4 + 0x05d6]
	.word 0xc0792568  ! 9: SWAP_I	swap	%r0, [%r4 + 0x0568]
	.word 0xc6292934  ! 9: STB_I	stb	%r3, [%r4 + 0x0934]
	.word 0xde212200  ! 19: STW_I	stw	%r15, [%r4 + 0x0200]
	.word 0xc4210005  ! 19: STW_R	stw	%r2, [%r4 + %r5]
	.word 0xf0212da0  ! 19: STW_I	stw	%r24, [%r4 + 0x0da0]
	.word 0xc4212108  ! 19: STW_I	stw	%r2, [%r4 + 0x0108]
	.word 0xe62126e0  ! 19: STW_I	stw	%r19, [%r4 + 0x06e0]
	.word 0xc0310005  ! 19: STH_R	sth	%r0, [%r4 + %r5]
	.word 0xc0790005  ! 19: SWAP_R	swap	%r0, [%r4 + %r5]
	.word 0xd82929a7  ! 19: STB_I	stb	%r12, [%r4 + 0x09a7]
	.word 0xc0290005  ! 28: STB_R	stb	%r0, [%r4 + %r5]
	.word 0xfa710005  ! 28: STX_R	stx	%r29, [%r4 + %r5]
	.word 0xfe210005  ! 28: STW_R	stw	%r31, [%r4 + %r5]
	.word 0xc6290005  ! 28: STB_R	stb	%r3, [%r4 + %r5]
	.word 0xc2312230  ! 28: STH_I	sth	%r1, [%r4 + 0x0230]
	.word 0xf0292f72  ! 28: STB_I	stb	%r24, [%r4 + 0x0f72]
	.word 0xd4790005  ! 28: SWAP_R	swap	%r10, [%r4 + %r5]
	.word 0xda312a56  ! 28: STH_I	sth	%r13, [%r4 + 0x0a56]
	.word 0xc42120fc  ! 36: STW_I	stw	%r2, [%r4 + 0x00fc]
	.word 0xc6310005  ! 36: STH_R	sth	%r3, [%r4 + %r5]
	.word 0xc2710005  ! 36: STX_R	stx	%r1, [%r4 + %r5]
	.word 0xc0290005  ! 36: STB_R	stb	%r0, [%r4 + %r5]
	.word 0xfe710005  ! 36: STX_R	stx	%r31, [%r4 + %r5]
	.word 0xc4312a14  ! 36: STH_I	sth	%r2, [%r4 + 0x0a14]
	.word 0xc3e10025  ! 36: CASA_I	casa	[%r4] 0x 1, %r5, %r1
	.word 0xc0310005  ! 36: STH_R	sth	%r0, [%r4 + %r5]
	.word 0xc6212a34  ! 48: STW_I	stw	%r3, [%r4 + 0x0a34]
	.word 0xfe290005  ! 48: STB_R	stb	%r31, [%r4 + %r5]
	.word 0xc4712260  ! 48: STX_I	stx	%r2, [%r4 + 0x0260]
	.word 0xce710005  ! 48: STX_R	stx	%r7, [%r4 + %r5]
	.word 0xc6210005  ! 48: STW_R	stw	%r3, [%r4 + %r5]
	.word 0xdc2927d5  ! 48: STB_I	stb	%r14, [%r4 + 0x07d5]
	.word 0xdd390005  ! 48: STDF_R	std	%f14, [%r5, %r4]
	.word 0xd0210005  ! 48: STW_R	stw	%r8, [%r4 + %r5]
	.word 0xc4310005  ! 57: STH_R	sth	%r2, [%r4 + %r5]
	.word 0xc6210005  ! 57: STW_R	stw	%r3, [%r4 + %r5]
	.word 0xc2710005  ! 57: STX_R	stx	%r1, [%r4 + %r5]
	.word 0xcc310005  ! 57: STH_R	sth	%r6, [%r4 + %r5]
	.word 0xc0310005  ! 57: STH_R	sth	%r0, [%r4 + %r5]
	.word 0xc4212df4  ! 57: STW_I	stw	%r2, [%r4 + 0x0df4]
	.word 0xc2e92c5e  ! 57: LDSTUBA_I	ldstuba	%r1, [%r4 + 0x0c5e] %asi
	.word 0xc2310005  ! 57: STH_R	sth	%r1, [%r4 + %r5]
	.word 0xf8712408  ! 65: STX_I	stx	%r28, [%r4 + 0x0408]
	.word 0xcc312e14  ! 65: STH_I	sth	%r6, [%r4 + 0x0e14]
	.word 0xc2210005  ! 65: STW_R	stw	%r1, [%r4 + %r5]
	.word 0xd0212700  ! 65: STW_I	stw	%r8, [%r4 + 0x0700]
	.word 0xf6310005  ! 65: STH_R	sth	%r27, [%r4 + %r5]
	.word 0xc2310005  ! 65: STH_R	sth	%r1, [%r4 + %r5]
	.word 0xd3390005  ! 65: STDF_R	std	%f9, [%r5, %r4]
	.word 0xfa2125fc  ! 65: STW_I	stw	%r29, [%r4 + 0x05fc]
	.word 0xc221289c  ! 73: STW_I	stw	%r1, [%r4 + 0x089c]
	.word 0xc0290005  ! 73: STB_R	stb	%r0, [%r4 + %r5]
	.word 0xc0290005  ! 73: STB_R	stb	%r0, [%r4 + %r5]
	.word 0xce31279a  ! 73: STH_I	sth	%r7, [%r4 + 0x079a]
	.word 0xf0290005  ! 73: STB_R	stb	%r24, [%r4 + %r5]
	.word 0xc0290005  ! 73: STB_R	stb	%r0, [%r4 + %r5]
	.word 0xff2125b0  ! 73: STF_I	st	%f31, [0x05b0, %r4]
	.word 0xd6310005  ! 73: STH_R	sth	%r11, [%r4 + %r5]
	.word 0xc2290005  ! 82: STB_R	stb	%r1, [%r4 + %r5]
	.word 0xde2923a4  ! 82: STB_I	stb	%r15, [%r4 + 0x03a4]
	.word 0xde310005  ! 82: STH_R	sth	%r15, [%r4 + %r5]
	.word 0xc0710005  ! 82: STX_R	stx	%r0, [%r4 + %r5]
	.word 0xc2210005  ! 82: STW_R	stw	%r1, [%r4 + %r5]
	.word 0xc2290005  ! 82: STB_R	stb	%r1, [%r4 + %r5]
	.word 0xc7210005  ! 82: STF_R	st	%f3, [%r5, %r4]
	.word 0xc0710005  ! 82: STX_R	stx	%r0, [%r4 + %r5]
	.word 0xc2290005  ! 90: STB_R	stb	%r1, [%r4 + %r5]
	.word 0xc4312d30  ! 90: STH_I	sth	%r2, [%r4 + 0x0d30]
	.word 0xc0210005  ! 90: STW_R	stw	%r0, [%r4 + %r5]
	.word 0xc6310005  ! 90: STH_R	sth	%r3, [%r4 + %r5]
	.word 0xc221292c  ! 90: STW_I	stw	%r1, [%r4 + 0x092c]
	.word 0xc0212d44  ! 90: STW_I	stw	%r0, [%r4 + 0x0d44]
	.word 0xc7212c10  ! 90: STF_I	st	%f3, [0x0c10, %r4]
	.word 0xd0310005  ! 90: STH_R	sth	%r8, [%r4 + %r5]
	.word 0xee712888  ! 98: STX_I	stx	%r23, [%r4 + 0x0888]
	.word 0xfc212fa8  ! 98: STW_I	stw	%r30, [%r4 + 0x0fa8]
	.word 0xfc710005  ! 98: STX_R	stx	%r30, [%r4 + %r5]
	.word 0xc431287a  ! 98: STH_I	sth	%r2, [%r4 + 0x087a]
	.word 0xc23124f2  ! 98: STH_I	sth	%r1, [%r4 + 0x04f2]
	.word 0xc4210005  ! 98: STW_R	stw	%r2, [%r4 + %r5]
	.word 0xc0792f7c  ! 98: SWAP_I	swap	%r0, [%r4 + 0x0f7c]
	.word 0xd4290005  ! 98: STB_R	stb	%r10, [%r4 + %r5]
	.word 0xe2210005  ! 106: STW_R	stw	%r17, [%r4 + %r5]
	.word 0xf8290005  ! 106: STB_R	stb	%r28, [%r4 + %r5]
	.word 0xec212688  ! 106: STW_I	stw	%r22, [%r4 + 0x0688]
	.word 0xc2710005  ! 106: STX_R	stx	%r1, [%r4 + %r5]
	.word 0xc6210005  ! 106: STW_R	stw	%r3, [%r4 + %r5]
	.word 0xc6210005  ! 106: STW_R	stw	%r3, [%r4 + %r5]
	.word 0xc5390005  ! 106: STDF_R	std	%f2, [%r5, %r4]
	.word 0xc2212f5c  ! 106: STW_I	stw	%r1, [%r4 + 0x0f5c]
	.word 0xf4310005  ! 115: STH_R	sth	%r26, [%r4 + %r5]
	.word 0xc0712868  ! 115: STX_I	stx	%r0, [%r4 + 0x0868]
	.word 0xec712138  ! 115: STX_I	stx	%r22, [%r4 + 0x0138]
	.word 0xc2712560  ! 115: STX_I	stx	%r1, [%r4 + 0x0560]
	.word 0xc63124d0  ! 115: STH_I	sth	%r3, [%r4 + 0x04d0]
	.word 0xc0310005  ! 115: STH_R	sth	%r0, [%r4 + %r5]
	.word 0xc6212024  ! 115: STW_I	stw	%r3, [%r4 + 0x0024]
	.word 0xfa710005  ! 115: STX_R	stx	%r29, [%r4 + %r5]
	.word 0xc5390005  ! 115: STDF_R	std	%f2, [%r5, %r4]
	.word 0xc0210005  ! 126: STW_R	stw	%r0, [%r4 + %r5]
	.word 0xc62929e3  ! 126: STB_I	stb	%r3, [%r4 + 0x09e3]
	.word 0xc2210005  ! 126: STW_R	stw	%r1, [%r4 + %r5]
	.word 0xc4290005  ! 126: STB_R	stb	%r2, [%r4 + %r5]
	.word 0xc4212f20  ! 126: STW_I	stw	%r2, [%r4 + 0x0f20]
	.word 0xc0290005  ! 126: STB_R	stb	%r0, [%r4 + %r5]
	.word 0xc0310005  ! 126: STH_R	sth	%r0, [%r4 + %r5]
	.word 0xc0212488  ! 126: STW_I	stw	%r0, [%r4 + 0x0488]
	.word 0xe1392ca0  ! 126: STDF_I	std	%f16, [0x0ca0, %r4]
	.word 0xc6310005  ! 135: STH_R	sth	%r3, [%r4 + %r5]
	.word 0xc6710005  ! 135: STX_R	stx	%r3, [%r4 + %r5]
	.word 0xc0210005  ! 135: STW_R	stw	%r0, [%r4 + %r5]
	.word 0xc2312d16  ! 135: STH_I	sth	%r1, [%r4 + 0x0d16]
	.word 0xe42921e4  ! 135: STB_I	stb	%r18, [%r4 + 0x01e4]
	.word 0xc2290005  ! 135: STB_R	stb	%r1, [%r4 + %r5]
	.word 0xc5210005  ! 135: STF_R	st	%f2, [%r5, %r4]
	.word 0xe6210005  ! 135: STW_R	stw	%r19, [%r4 + %r5]
	.word 0xce210005  ! 145: STW_R	stw	%r7, [%r4 + %r5]
	.word 0xc0210005  ! 145: STW_R	stw	%r0, [%r4 + %r5]
	.word 0xc0712a90  ! 145: STX_I	stx	%r0, [%r4 + 0x0a90]
	.word 0xc0210005  ! 145: STW_R	stw	%r0, [%r4 + %r5]
	.word 0xd6710005  ! 145: STX_R	stx	%r11, [%r4 + %r5]
	.word 0xea2125bc  ! 145: STW_I	stw	%r21, [%r4 + 0x05bc]
	.word 0xc4712ea0  ! 145: STX_I	stx	%r2, [%r4 + 0x0ea0]
	.word 0xc02921a4  ! 145: STB_I	stb	%r0, [%r4 + 0x01a4]
	.word 0xc3e12005  ! 145: CASA_R	casa	[%r4] %asi, %r5, %r1
	.word 0xd8312c36  ! 156: STH_I	sth	%r12, [%r4 + 0x0c36]
	.word 0xc4710005  ! 156: STX_R	stx	%r2, [%r4 + %r5]
	.word 0xc4290005  ! 156: STB_R	stb	%r2, [%r4 + %r5]
	.word 0xf6712e60  ! 156: STX_I	stx	%r27, [%r4 + 0x0e60]
	.word 0xd0710005  ! 156: STX_R	stx	%r8, [%r4 + %r5]
	.word 0xc0312bf8  ! 156: STH_I	sth	%r0, [%r4 + 0x0bf8]
	.word 0xc2312d0e  ! 156: STH_I	sth	%r1, [%r4 + 0x0d0e]
	.word 0xc721289c  ! 156: STF_I	st	%f3, [0x089c, %r4]
	.word 0xc4290005  ! 156: STB_R	stb	%r2, [%r4 + %r5]
	.word 0xf4710005  ! 166: STX_R	stx	%r26, [%r4 + %r5]
	.word 0xea310005  ! 166: STH_R	sth	%r21, [%r4 + %r5]
	.word 0xc67124c8  ! 166: STX_I	stx	%r3, [%r4 + 0x04c8]
	.word 0xc2712fe8  ! 166: STX_I	stx	%r1, [%r4 + 0x0fe8]
	.word 0xc0212dc0  ! 166: STW_I	stw	%r0, [%r4 + 0x0dc0]
	.word 0xc4310005  ! 166: STH_R	sth	%r2, [%r4 + %r5]
	.word 0xdb390005  ! 166: STDF_R	std	%f13, [%r5, %r4]
	.word 0xc0212e98  ! 166: STW_I	stw	%r0, [%r4 + 0x0e98]
	.word 0xee2920b9  ! 176: STB_I	stb	%r23, [%r4 + 0x00b9]
	.word 0xc231227e  ! 176: STH_I	sth	%r1, [%r4 + 0x027e]
	.word 0xc2712c90  ! 176: STX_I	stx	%r1, [%r4 + 0x0c90]
	.word 0xc2710005  ! 176: STX_R	stx	%r1, [%r4 + %r5]
	.word 0xc6292d95  ! 176: STB_I	stb	%r3, [%r4 + 0x0d95]
	.word 0xc4310005  ! 176: STH_R	sth	%r2, [%r4 + %r5]
	.word 0xf0710005  ! 176: STX_R	stx	%r24, [%r4 + %r5]
	.word 0xc0f92300  ! 176: SWAPA_I	swapa	%r0, [%r4 + 0x0300] %asi
	.word 0xc0290005  ! 176: STB_R	stb	%r0, [%r4 + %r5]
	.word 0xc4212b08  ! 184: STW_I	stw	%r2, [%r4 + 0x0b08]
	.word 0xc6210005  ! 184: STW_R	stw	%r3, [%r4 + %r5]
	.word 0xc02927b4  ! 184: STB_I	stb	%r0, [%r4 + 0x07b4]
	.word 0xc0210005  ! 184: STW_R	stw	%r0, [%r4 + %r5]
	.word 0xda212f3c  ! 184: STW_I	stw	%r13, [%r4 + 0x0f3c]
	.word 0xe8710005  ! 184: STX_R	stx	%r20, [%r4 + %r5]
	.word 0xfce92804  ! 184: LDSTUBA_I	ldstuba	%r30, [%r4 + 0x0804] %asi
	.word 0xc6210005  ! 184: STW_R	stw	%r3, [%r4 + %r5]
	.word 0xc2712c58  ! 192: STX_I	stx	%r1, [%r4 + 0x0c58]
	.word 0xc4210005  ! 192: STW_R	stw	%r2, [%r4 + %r5]
	.word 0xe4712bc0  ! 192: STX_I	stx	%r18, [%r4 + 0x0bc0]
	.word 0xc0710005  ! 192: STX_R	stx	%r0, [%r4 + %r5]
	.word 0xdc310005  ! 192: STH_R	sth	%r14, [%r4 + %r5]
	.word 0xc4312820  ! 192: STH_I	sth	%r2, [%r4 + 0x0820]
	.word 0xc7f10025  ! 192: CASXA_I	casxa	[%r4] 0x 1, %r5, %r3
	.word 0xc4710005  ! 192: STX_R	stx	%r2, [%r4 + %r5]
	.word 0xc4310005  ! 204: STH_R	sth	%r2, [%r4 + %r5]
	.word 0xc6212260  ! 204: STW_I	stw	%r3, [%r4 + 0x0260]
	.word 0xd4292d40  ! 204: STB_I	stb	%r10, [%r4 + 0x0d40]
	.word 0xc0312b0e  ! 204: STH_I	sth	%r0, [%r4 + 0x0b0e]
	.word 0xce292a18  ! 204: STB_I	stb	%r7, [%r4 + 0x0a18]
	.word 0xc6210005  ! 204: STW_R	stw	%r3, [%r4 + %r5]
	.word 0xc1212f90  ! 204: STF_I	st	%f0, [0x0f90, %r4]
	.word 0xc229297e  ! 204: STB_I	stb	%r1, [%r4 + 0x097e]
	.word 0xc4310005  ! 213: STH_R	sth	%r2, [%r4 + %r5]
	.word 0xf8710005  ! 213: STX_R	stx	%r28, [%r4 + %r5]
	.word 0xfc310005  ! 213: STH_R	sth	%r30, [%r4 + %r5]
	.word 0xc2212d30  ! 213: STW_I	stw	%r1, [%r4 + 0x0d30]
	.word 0xfe310005  ! 213: STH_R	sth	%r31, [%r4 + %r5]
	.word 0xd0290005  ! 213: STB_R	stb	%r8, [%r4 + %r5]
	.word 0xc0710005  ! 213: STX_R	stx	%r0, [%r4 + %r5]
	.word 0xd1210005  ! 213: STF_R	st	%f8, [%r5, %r4]
	.word 0xce31205a  ! 213: STH_I	sth	%r7, [%r4 + 0x005a]
	.word 0xc42126a8  ! 222: STW_I	stw	%r2, [%r4 + 0x06a8]
	.word 0xe4712310  ! 222: STX_I	stx	%r18, [%r4 + 0x0310]
	.word 0xfe310005  ! 222: STH_R	sth	%r31, [%r4 + %r5]
	.word 0xc4310005  ! 222: STH_R	sth	%r2, [%r4 + %r5]
	.word 0xc0710005  ! 222: STX_R	stx	%r0, [%r4 + %r5]
	.word 0xc47124b0  ! 222: STX_I	stx	%r2, [%r4 + 0x04b0]
	.word 0xc1e12005  ! 222: CASA_R	casa	[%r4] %asi, %r5, %r0
	.word 0xc0292a0c  ! 222: STB_I	stb	%r0, [%r4 + 0x0a0c]
	.word 0xe6292664  ! 232: STB_I	stb	%r19, [%r4 + 0x0664]
	.word 0xea210005  ! 232: STW_R	stw	%r21, [%r4 + %r5]
	.word 0xc47122b8  ! 232: STX_I	stx	%r2, [%r4 + 0x02b8]
	.word 0xc0710005  ! 232: STX_R	stx	%r0, [%r4 + %r5]
	.word 0xc6712bf8  ! 232: STX_I	stx	%r3, [%r4 + 0x0bf8]
	.word 0xe629203f  ! 232: STB_I	stb	%r19, [%r4 + 0x003f]
	.word 0xc1f12005  ! 232: CASXA_R	casxa	[%r4]%asi, %r5, %r0
	.word 0xfa2120d4  ! 232: STW_I	stw	%r29, [%r4 + 0x00d4]
	.word 0xce210005  ! 243: STW_R	stw	%r7, [%r4 + %r5]
	.word 0xda210005  ! 243: STW_R	stw	%r13, [%r4 + %r5]
	.word 0xc0310005  ! 243: STH_R	sth	%r0, [%r4 + %r5]
	.word 0xc2312c56  ! 243: STH_I	sth	%r1, [%r4 + 0x0c56]
	.word 0xf2290005  ! 243: STB_R	stb	%r25, [%r4 + %r5]
	.word 0xc42927ec  ! 243: STB_I	stb	%r2, [%r4 + 0x07ec]
	.word 0xe8310005  ! 243: STH_R	sth	%r20, [%r4 + %r5]
	.word 0xc2e923bd  ! 243: LDSTUBA_I	ldstuba	%r1, [%r4 + 0x03bd] %asi
	.word 0xea290005  ! 243: STB_R	stb	%r21, [%r4 + %r5]
	.word 0xc6290005  ! 254: STB_R	stb	%r3, [%r4 + %r5]
	.word 0xd0710005  ! 254: STX_R	stx	%r8, [%r4 + %r5]
	.word 0xd0710005  ! 254: STX_R	stx	%r8, [%r4 + %r5]
	.word 0xc22921d6  ! 254: STB_I	stb	%r1, [%r4 + 0x01d6]
	.word 0xc6212688  ! 254: STW_I	stw	%r3, [%r4 + 0x0688]
	.word 0xf6212d58  ! 254: STW_I	stw	%r27, [%r4 + 0x0d58]
	.word 0xc1e12005  ! 254: CASA_R	casa	[%r4] %asi, %r5, %r0
	.word 0xc0292c7d  ! 254: STB_I	stb	%r0, [%r4 + 0x0c7d]
	.word 0xf02122a4  ! 263: STW_I	stw	%r24, [%r4 + 0x02a4]
	.word 0xc0210005  ! 263: STW_R	stw	%r0, [%r4 + %r5]
	.word 0xc43128d4  ! 263: STH_I	sth	%r2, [%r4 + 0x08d4]
	.word 0xda710005  ! 263: STX_R	stx	%r13, [%r4 + %r5]
	.word 0xfa210005  ! 263: STW_R	stw	%r29, [%r4 + %r5]
	.word 0xc0212560  ! 263: STW_I	stw	%r0, [%r4 + 0x0560]
	.word 0xc33927f8  ! 263: STDF_I	std	%f1, [0x07f8, %r4]
	.word 0xc2710005  ! 263: STX_R	stx	%r1, [%r4 + %r5]
	.word 0xec710005  ! 272: STX_R	stx	%r22, [%r4 + %r5]
	.word 0xee2922f2  ! 272: STB_I	stb	%r23, [%r4 + 0x02f2]
	.word 0xe821219c  ! 272: STW_I	stw	%r20, [%r4 + 0x019c]
	.word 0xc0212a54  ! 272: STW_I	stw	%r0, [%r4 + 0x0a54]
	.word 0xde212694  ! 272: STW_I	stw	%r15, [%r4 + 0x0694]
	.word 0xc0212a04  ! 272: STW_I	stw	%r0, [%r4 + 0x0a04]
	.word 0xd4310005  ! 272: STH_R	sth	%r10, [%r4 + %r5]
	.word 0xe07929e8  ! 272: SWAP_I	swap	%r16, [%r4 + 0x09e8]
	.word 0xde290005  ! 272: STB_R	stb	%r15, [%r4 + %r5]
	.word 0xc2292dea  ! 282: STB_I	stb	%r1, [%r4 + 0x0dea]
	.word 0xe62128c0  ! 282: STW_I	stw	%r19, [%r4 + 0x08c0]
	.word 0xc6210005  ! 282: STW_R	stw	%r3, [%r4 + %r5]
	.word 0xf6290005  ! 282: STB_R	stb	%r27, [%r4 + %r5]
	.word 0xc429256c  ! 282: STB_I	stb	%r2, [%r4 + 0x056c]
	.word 0xc6312188  ! 282: STH_I	sth	%r3, [%r4 + 0x0188]
	.word 0xc721229c  ! 282: STF_I	st	%f3, [0x029c, %r4]
	.word 0xc6310005  ! 282: STH_R	sth	%r3, [%r4 + %r5]
	.word 0xc42120b0  ! 290: STW_I	stw	%r2, [%r4 + 0x00b0]
	.word 0xfe710005  ! 290: STX_R	stx	%r31, [%r4 + %r5]
	.word 0xe0290005  ! 290: STB_R	stb	%r16, [%r4 + %r5]
	.word 0xc4290005  ! 290: STB_R	stb	%r2, [%r4 + %r5]
	.word 0xf4290005  ! 290: STB_R	stb	%r26, [%r4 + %r5]
	.word 0xc2210005  ! 290: STW_R	stw	%r1, [%r4 + %r5]
	.word 0xe6e92b40  ! 290: LDSTUBA_I	ldstuba	%r19, [%r4 + 0x0b40] %asi
	.word 0xdc210005  ! 290: STW_R	stw	%r14, [%r4 + %r5]
	.word 0xc22924a6  ! 303: STB_I	stb	%r1, [%r4 + 0x04a6]
	.word 0xc6312158  ! 303: STH_I	sth	%r3, [%r4 + 0x0158]
	.word 0xc0210005  ! 303: STW_R	stw	%r0, [%r4 + %r5]
	.word 0xd2212738  ! 303: STW_I	stw	%r9, [%r4 + 0x0738]
	.word 0xe6310005  ! 303: STH_R	sth	%r19, [%r4 + %r5]
	.word 0xc4312014  ! 303: STH_I	sth	%r2, [%r4 + 0x0014]
	.word 0xed2127a8  ! 303: STF_I	st	%f22, [0x07a8, %r4]
	.word 0xc2710005  ! 303: STX_R	stx	%r1, [%r4 + %r5]
	.word 0xe02926e8  ! 313: STB_I	stb	%r16, [%r4 + 0x06e8]
	.word 0xf22120d4  ! 313: STW_I	stw	%r25, [%r4 + 0x00d4]
	.word 0xc62124e0  ! 313: STW_I	stw	%r3, [%r4 + 0x04e0]
	.word 0xd0290005  ! 313: STB_R	stb	%r8, [%r4 + %r5]
	.word 0xc62123a0  ! 313: STW_I	stw	%r3, [%r4 + 0x03a0]
	.word 0xf8712e98  ! 313: STX_I	stx	%r28, [%r4 + 0x0e98]
	.word 0xc0310005  ! 313: STH_R	sth	%r0, [%r4 + %r5]
	.word 0xc5390005  ! 313: STDF_R	std	%f2, [%r5, %r4]
	.word 0xe8712548  ! 313: STX_I	stx	%r20, [%r4 + 0x0548]
	.word 0xc4310005  ! 325: STH_R	sth	%r2, [%r4 + %r5]
	.word 0xc4212b84  ! 325: STW_I	stw	%r2, [%r4 + 0x0b84]
	.word 0xec29254f  ! 325: STB_I	stb	%r22, [%r4 + 0x054f]
	.word 0xc431256c  ! 325: STH_I	sth	%r2, [%r4 + 0x056c]
	.word 0xc4710005  ! 325: STX_R	stx	%r2, [%r4 + %r5]
	.word 0xc0712420  ! 325: STX_I	stx	%r0, [%r4 + 0x0420]
	.word 0xc4212cc8  ! 325: STW_I	stw	%r2, [%r4 + 0x0cc8]
	.word 0xc6792cb0  ! 325: SWAP_I	swap	%r3, [%r4 + 0x0cb0]
	.word 0xec210005  ! 325: STW_R	stw	%r22, [%r4 + %r5]
	.word 0xc0312544  ! 336: STH_I	sth	%r0, [%r4 + 0x0544]
	.word 0xd621291c  ! 336: STW_I	stw	%r11, [%r4 + 0x091c]
	.word 0xde710005  ! 336: STX_R	stx	%r15, [%r4 + %r5]
	.word 0xc6710005  ! 336: STX_R	stx	%r3, [%r4 + %r5]
	.word 0xc4290005  ! 336: STB_R	stb	%r2, [%r4 + %r5]
	.word 0xc2290005  ! 336: STB_R	stb	%r1, [%r4 + %r5]
	.word 0xec310005  ! 336: STH_R	sth	%r22, [%r4 + %r5]
	.word 0xde210005  ! 336: STW_R	stw	%r15, [%r4 + %r5]
	.word 0xc6710005  ! 336: STX_R	stx	%r3, [%r4 + %r5]
	.word 0xf0212860  ! 348: STW_I	stw	%r24, [%r4 + 0x0860]
	.word 0xc2290005  ! 348: STB_R	stb	%r1, [%r4 + %r5]
	.word 0xdc210005  ! 348: STW_R	stw	%r14, [%r4 + %r5]
	.word 0xd8310005  ! 348: STH_R	sth	%r12, [%r4 + %r5]
	.word 0xc0210005  ! 348: STW_R	stw	%r0, [%r4 + %r5]
	.word 0xda712c50  ! 348: STX_I	stx	%r13, [%r4 + 0x0c50]
	.word 0xc2292bba  ! 348: STB_I	stb	%r1, [%r4 + 0x0bba]
	.word 0xc4310005  ! 348: STH_R	sth	%r2, [%r4 + %r5]
	.word 0xc1390005  ! 348: STDF_R	std	%f0, [%r5, %r4]
	.word 0xc6210005  ! 357: STW_R	stw	%r3, [%r4 + %r5]
	.word 0xc6212890  ! 357: STW_I	stw	%r3, [%r4 + 0x0890]
	.word 0xe02920b4  ! 357: STB_I	stb	%r16, [%r4 + 0x00b4]
	.word 0xc0710005  ! 357: STX_R	stx	%r0, [%r4 + %r5]
	.word 0xc4712e80  ! 357: STX_I	stx	%r2, [%r4 + 0x0e80]
	.word 0xd8712420  ! 357: STX_I	stx	%r12, [%r4 + 0x0420]
	.word 0xc4292e57  ! 357: STB_I	stb	%r2, [%r4 + 0x0e57]
	.word 0xec710005  ! 357: STX_R	stx	%r22, [%r4 + %r5]
	.word 0xcc712c80  ! 357: STX_I	stx	%r6, [%r4 + 0x0c80]
	.word 0xc02127a4  ! 371: STW_I	stw	%r0, [%r4 + 0x07a4]
	.word 0xfe290005  ! 371: STB_R	stb	%r31, [%r4 + %r5]
	.word 0xc631271c  ! 371: STH_I	sth	%r3, [%r4 + 0x071c]
	.word 0xde310005  ! 371: STH_R	sth	%r15, [%r4 + %r5]
	.word 0xc6312f2c  ! 371: STH_I	sth	%r3, [%r4 + 0x0f2c]
	.word 0xc47124c8  ! 371: STX_I	stx	%r2, [%r4 + 0x04c8]
	.word 0xc32124d4  ! 371: STF_I	st	%f1, [0x04d4, %r4]
	.word 0xc2310005  ! 371: STH_R	sth	%r1, [%r4 + %r5]
	.word 0xc2292647  ! 380: STB_I	stb	%r1, [%r4 + 0x0647]
	.word 0xea292605  ! 380: STB_I	stb	%r21, [%r4 + 0x0605]
	.word 0xc0210005  ! 380: STW_R	stw	%r0, [%r4 + %r5]
	.word 0xde310005  ! 380: STH_R	sth	%r15, [%r4 + %r5]
	.word 0xc2210005  ! 380: STW_R	stw	%r1, [%r4 + %r5]
	.word 0xc6292c2e  ! 380: STB_I	stb	%r3, [%r4 + 0x0c2e]
	.word 0xe32124c8  ! 380: STF_I	st	%f17, [0x04c8, %r4]
	.word 0xc4210005  ! 380: STW_R	stw	%r2, [%r4 + %r5]
	.word 0xc4292f1e  ! 388: STB_I	stb	%r2, [%r4 + 0x0f1e]
	.word 0xc2290005  ! 388: STB_R	stb	%r1, [%r4 + %r5]
	.word 0xc021210c  ! 388: STW_I	stw	%r0, [%r4 + 0x010c]
	.word 0xc03125aa  ! 388: STH_I	sth	%r0, [%r4 + 0x05aa]
	.word 0xc2310005  ! 388: STH_R	sth	%r1, [%r4 + %r5]
	.word 0xc2292d6d  ! 388: STB_I	stb	%r1, [%r4 + 0x0d6d]
	.word 0xc5f12005  ! 388: CASXA_R	casxa	[%r4]%asi, %r5, %r2
	.word 0xc0292ba8  ! 388: STB_I	stb	%r0, [%r4 + 0x0ba8]
	.word 0xc0290005  ! 396: STB_R	stb	%r0, [%r4 + %r5]
	.word 0xf4290005  ! 396: STB_R	stb	%r26, [%r4 + %r5]
	.word 0xea310005  ! 396: STH_R	sth	%r21, [%r4 + %r5]
	.word 0xec290005  ! 396: STB_R	stb	%r22, [%r4 + %r5]
	.word 0xc4210005  ! 396: STW_R	stw	%r2, [%r4 + %r5]
	.word 0xe4710005  ! 396: STX_R	stx	%r18, [%r4 + %r5]
	.word 0xc3210005  ! 396: STF_R	st	%f1, [%r5, %r4]
	.word 0xc6290005  ! 396: STB_R	stb	%r3, [%r4 + %r5]
	.word 0xfe310005  ! 405: STH_R	sth	%r31, [%r4 + %r5]
	.word 0xd23121ba  ! 405: STH_I	sth	%r9, [%r4 + 0x01ba]
	.word 0xfc710005  ! 405: STX_R	stx	%r30, [%r4 + %r5]
	.word 0xde212968  ! 405: STW_I	stw	%r15, [%r4 + 0x0968]
	.word 0xe8292468  ! 405: STB_I	stb	%r20, [%r4 + 0x0468]
	.word 0xc2712c60  ! 405: STX_I	stx	%r1, [%r4 + 0x0c60]
	.word 0xc2212dd4  ! 405: STW_I	stw	%r1, [%r4 + 0x0dd4]
	.word 0xd4790005  ! 405: SWAP_R	swap	%r10, [%r4 + %r5]
	.word 0xc6712e58  ! 405: STX_I	stx	%r3, [%r4 + 0x0e58]
	.word 0xc2312378  ! 414: STH_I	sth	%r1, [%r4 + 0x0378]
	.word 0xc0712ab8  ! 414: STX_I	stx	%r0, [%r4 + 0x0ab8]
	.word 0xc6292b02  ! 414: STB_I	stb	%r3, [%r4 + 0x0b02]
	.word 0xda2929a2  ! 414: STB_I	stb	%r13, [%r4 + 0x09a2]
	.word 0xc4310005  ! 414: STH_R	sth	%r2, [%r4 + %r5]
	.word 0xc4312a3c  ! 414: STH_I	sth	%r2, [%r4 + 0x0a3c]
	.word 0xe0710005  ! 414: STX_R	stx	%r16, [%r4 + %r5]
	.word 0xff392788  ! 414: STDF_I	std	%f31, [0x0788, %r4]
	.word 0xc02122b8  ! 414: STW_I	stw	%r0, [%r4 + 0x02b8]
	.word 0xc0710005  ! 427: STX_R	stx	%r0, [%r4 + %r5]
	.word 0xc4310005  ! 427: STH_R	sth	%r2, [%r4 + %r5]
	.word 0xfe292c4f  ! 427: STB_I	stb	%r31, [%r4 + 0x0c4f]
	.word 0xfe210005  ! 427: STW_R	stw	%r31, [%r4 + %r5]
	.word 0xf8290005  ! 427: STB_R	stb	%r28, [%r4 + %r5]
	.word 0xc2312a52  ! 427: STH_I	sth	%r1, [%r4 + 0x0a52]
	.word 0xe47926d4  ! 427: SWAP_I	swap	%r18, [%r4 + 0x06d4]
	.word 0xcc2127cc  ! 427: STW_I	stw	%r6, [%r4 + 0x07cc]
	.word 0xee312de8  ! 436: STH_I	sth	%r23, [%r4 + 0x0de8]
	.word 0xd0210005  ! 436: STW_R	stw	%r8, [%r4 + %r5]
	.word 0xdc710005  ! 436: STX_R	stx	%r14, [%r4 + %r5]
	.word 0xc021210c  ! 436: STW_I	stw	%r0, [%r4 + 0x010c]
	.word 0xc0310005  ! 436: STH_R	sth	%r0, [%r4 + %r5]
	.word 0xee712018  ! 436: STX_I	stx	%r23, [%r4 + 0x0018]
	.word 0xc5392898  ! 436: STDF_I	std	%f2, [0x0898, %r4]
	.word 0xc6290005  ! 436: STB_R	stb	%r3, [%r4 + %r5]
	.word 0xc6290005  ! 445: STB_R	stb	%r3, [%r4 + %r5]
	.word 0xc6292b98  ! 445: STB_I	stb	%r3, [%r4 + 0x0b98]
	.word 0xc2290005  ! 445: STB_R	stb	%r1, [%r4 + %r5]
	.word 0xc42128f8  ! 445: STW_I	stw	%r2, [%r4 + 0x08f8]
	.word 0xc0210005  ! 445: STW_R	stw	%r0, [%r4 + %r5]
	.word 0xc2712c30  ! 445: STX_I	stx	%r1, [%r4 + 0x0c30]
	.word 0xc6312276  ! 445: STH_I	sth	%r3, [%r4 + 0x0276]
	.word 0xc07122d8  ! 445: STX_I	stx	%r0, [%r4 + 0x02d8]
	.word 0xe3e12005  ! 445: CASA_R	casa	[%r4] %asi, %r5, %r17
	.word 0xfe290005  ! 455: STB_R	stb	%r31, [%r4 + %r5]
	.word 0xc4312342  ! 455: STH_I	sth	%r2, [%r4 + 0x0342]
	.word 0xc4212d18  ! 455: STW_I	stw	%r2, [%r4 + 0x0d18]
	.word 0xce29215b  ! 455: STB_I	stb	%r7, [%r4 + 0x015b]
	.word 0xc0290005  ! 455: STB_R	stb	%r0, [%r4 + %r5]
	.word 0xc6712d60  ! 455: STX_I	stx	%r3, [%r4 + 0x0d60]
	.word 0xe0292921  ! 455: STB_I	stb	%r16, [%r4 + 0x0921]
	.word 0xcf390005  ! 455: STDF_R	std	%f7, [%r5, %r4]
	.word 0xf23120ce  ! 455: STH_I	sth	%r25, [%r4 + 0x00ce]
	.word 0xc0710005  ! 465: STX_R	stx	%r0, [%r4 + %r5]
	.word 0xe6212970  ! 465: STW_I	stw	%r19, [%r4 + 0x0970]
	.word 0xc4712ad0  ! 465: STX_I	stx	%r2, [%r4 + 0x0ad0]
	.word 0xfe290005  ! 465: STB_R	stb	%r31, [%r4 + %r5]
	.word 0xee210005  ! 465: STW_R	stw	%r23, [%r4 + %r5]
	.word 0xe2290005  ! 465: STB_R	stb	%r17, [%r4 + %r5]
	.word 0xc431208c  ! 465: STH_I	sth	%r2, [%r4 + 0x008c]
	.word 0xc0710005  ! 465: STX_R	stx	%r0, [%r4 + %r5]
	.word 0xd1212bbc  ! 465: STF_I	st	%f8, [0x0bbc, %r4]
	.word 0xc0710005  ! 478: STX_R	stx	%r0, [%r4 + %r5]
	.word 0xc2290005  ! 478: STB_R	stb	%r1, [%r4 + %r5]
	.word 0xe8210005  ! 478: STW_R	stw	%r20, [%r4 + %r5]
	.word 0xcc292b51  ! 478: STB_I	stb	%r6, [%r4 + 0x0b51]
	.word 0xc4290005  ! 478: STB_R	stb	%r2, [%r4 + %r5]
	.word 0xc42926a7  ! 478: STB_I	stb	%r2, [%r4 + 0x06a7]
	.word 0xc6710005  ! 478: STX_R	stx	%r3, [%r4 + %r5]
	.word 0xc5392e78  ! 478: STDF_I	std	%f2, [0x0e78, %r4]
	.word 0xe0212e14  ! 478: STW_I	stw	%r16, [%r4 + 0x0e14]
	.word 0xc0310005  ! 486: STH_R	sth	%r0, [%r4 + %r5]
	.word 0xc0712920  ! 486: STX_I	stx	%r0, [%r4 + 0x0920]
	.word 0xfe212410  ! 486: STW_I	stw	%r31, [%r4 + 0x0410]
	.word 0xc2710005  ! 486: STX_R	stx	%r1, [%r4 + %r5]
	.word 0xc6210005  ! 486: STW_R	stw	%r3, [%r4 + %r5]
	.word 0xc0290005  ! 486: STB_R	stb	%r0, [%r4 + %r5]
	.word 0xe1210005  ! 486: STF_R	st	%f16, [%r5, %r4]
	.word 0xe6712ed0  ! 486: STX_I	stx	%r19, [%r4 + 0x0ed0]
	.word 0xd2712160  ! 496: STX_I	stx	%r9, [%r4 + 0x0160]
	.word 0xc2212d78  ! 496: STW_I	stw	%r1, [%r4 + 0x0d78]
	.word 0xc231200a  ! 496: STH_I	sth	%r1, [%r4 + 0x000a]
	.word 0xce29203d  ! 496: STB_I	stb	%r7, [%r4 + 0x003d]
	.word 0xc4310005  ! 496: STH_R	sth	%r2, [%r4 + %r5]
	.word 0xc4210005  ! 496: STW_R	stw	%r2, [%r4 + %r5]
	.word 0xd87924e4  ! 496: SWAP_I	swap	%r12, [%r4 + 0x04e4]
	.word 0xc42126b4  ! 496: STW_I	stw	%r2, [%r4 + 0x06b4]
	.word 0xd6310005  ! 506: STH_R	sth	%r11, [%r4 + %r5]
	.word 0xd4710005  ! 506: STX_R	stx	%r10, [%r4 + %r5]
	.word 0xc0712820  ! 506: STX_I	stx	%r0, [%r4 + 0x0820]
	.word 0xcc210005  ! 506: STW_R	stw	%r6, [%r4 + %r5]
	.word 0xea290005  ! 506: STB_R	stb	%r21, [%r4 + %r5]
	.word 0xc63125f6  ! 506: STH_I	sth	%r3, [%r4 + 0x05f6]
	.word 0xc4712088  ! 506: STX_I	stx	%r2, [%r4 + 0x0088]
	.word 0xc1e12005  ! 506: CASA_R	casa	[%r4] %asi, %r5, %r0
	.word 0xc2712740  ! 506: STX_I	stx	%r1, [%r4 + 0x0740]
	.word 0xc2290005  ! 515: STB_R	stb	%r1, [%r4 + %r5]
	.word 0xe2310005  ! 515: STH_R	sth	%r17, [%r4 + %r5]
	.word 0xc2712450  ! 515: STX_I	stx	%r1, [%r4 + 0x0450]
	.word 0xfe7125c0  ! 515: STX_I	stx	%r31, [%r4 + 0x05c0]
	.word 0xc4712398  ! 515: STX_I	stx	%r2, [%r4 + 0x0398]
	.word 0xc0212378  ! 515: STW_I	stw	%r0, [%r4 + 0x0378]
	.word 0xc5392410  ! 515: STDF_I	std	%f2, [0x0410, %r4]
	.word 0xe4212a10  ! 515: STW_I	stw	%r18, [%r4 + 0x0a10]
	.word 0xc4712b28  ! 525: STX_I	stx	%r2, [%r4 + 0x0b28]
	.word 0xf02921dc  ! 525: STB_I	stb	%r24, [%r4 + 0x01dc]
	.word 0xf2710005  ! 525: STX_R	stx	%r25, [%r4 + %r5]
	.word 0xcc710005  ! 525: STX_R	stx	%r6, [%r4 + %r5]
	.word 0xc2210005  ! 525: STW_R	stw	%r1, [%r4 + %r5]
	.word 0xc0210005  ! 525: STW_R	stw	%r0, [%r4 + %r5]
	.word 0xc0e90025  ! 525: LDSTUBA_R	ldstuba	%r0, [%r4 + %r5] 0x01
	.word 0xfc2929a5  ! 525: STB_I	stb	%r30, [%r4 + 0x09a5]
	.word 0xe4712888  ! 533: STX_I	stx	%r18, [%r4 + 0x0888]
	.word 0xc2210005  ! 533: STW_R	stw	%r1, [%r4 + %r5]
	.word 0xc4712800  ! 533: STX_I	stx	%r2, [%r4 + 0x0800]
	.word 0xc2292d60  ! 533: STB_I	stb	%r1, [%r4 + 0x0d60]
	.word 0xc23128f0  ! 533: STH_I	sth	%r1, [%r4 + 0x08f0]
	.word 0xf8290005  ! 533: STB_R	stb	%r28, [%r4 + %r5]
	.word 0xc3210005  ! 533: STF_R	st	%f1, [%r5, %r4]
	.word 0xc4712828  ! 533: STX_I	stx	%r2, [%r4 + 0x0828]
	.word 0xc2212a64  ! 543: STW_I	stw	%r1, [%r4 + 0x0a64]
	.word 0xc6710005  ! 543: STX_R	stx	%r3, [%r4 + %r5]
	.word 0xc2710005  ! 543: STX_R	stx	%r1, [%r4 + %r5]
	.word 0xc6310005  ! 543: STH_R	sth	%r3, [%r4 + %r5]
	.word 0xc4290005  ! 543: STB_R	stb	%r2, [%r4 + %r5]
	.word 0xe6312774  ! 543: STH_I	sth	%r19, [%r4 + 0x0774]
	.word 0xc2710005  ! 543: STX_R	stx	%r1, [%r4 + %r5]
	.word 0xe03121ba  ! 543: STH_I	sth	%r16, [%r4 + 0x01ba]
	.word 0xc1210005  ! 543: STF_R	st	%f0, [%r5, %r4]
	.word 0xc4290005  ! 551: STB_R	stb	%r2, [%r4 + %r5]
	.word 0xd4292755  ! 551: STB_I	stb	%r10, [%r4 + 0x0755]
	.word 0xc031228a  ! 551: STH_I	sth	%r0, [%r4 + 0x028a]
	.word 0xc42926b4  ! 551: STB_I	stb	%r2, [%r4 + 0x06b4]
	.word 0xc62121d4  ! 551: STW_I	stw	%r3, [%r4 + 0x01d4]
	.word 0xc0712a18  ! 551: STX_I	stx	%r0, [%r4 + 0x0a18]
	.word 0xc2790005  ! 551: SWAP_R	swap	%r1, [%r4 + %r5]
	.word 0xe4290005  ! 551: STB_R	stb	%r18, [%r4 + %r5]
	.word 0xde310005  ! 560: STH_R	sth	%r15, [%r4 + %r5]
	.word 0xde2127a8  ! 560: STW_I	stw	%r15, [%r4 + 0x07a8]
	.word 0xcc712ce8  ! 560: STX_I	stx	%r6, [%r4 + 0x0ce8]
	.word 0xc2292a56  ! 560: STB_I	stb	%r1, [%r4 + 0x0a56]
	.word 0xe8290005  ! 560: STB_R	stb	%r20, [%r4 + %r5]
	.word 0xc2310005  ! 560: STH_R	sth	%r1, [%r4 + %r5]
	.word 0xc4712668  ! 560: STX_I	stx	%r2, [%r4 + 0x0668]
	.word 0xe4712b08  ! 560: STX_I	stx	%r18, [%r4 + 0x0b08]
	.word 0xc07120e8  ! 560: STX_I	stx	%r0, [%r4 + 0x00e8]
	.word 0xc4310005  ! 568: STH_R	sth	%r2, [%r4 + %r5]
	.word 0xc629217e  ! 568: STB_I	stb	%r3, [%r4 + 0x017e]
	.word 0xfa212fd4  ! 568: STW_I	stw	%r29, [%r4 + 0x0fd4]
	.word 0xd8312a02  ! 568: STH_I	sth	%r12, [%r4 + 0x0a02]
	.word 0xce710005  ! 568: STX_R	stx	%r7, [%r4 + %r5]
	.word 0xc6212140  ! 568: STW_I	stw	%r3, [%r4 + 0x0140]
	.word 0xc2e90025  ! 568: LDSTUBA_R	ldstuba	%r1, [%r4 + %r5] 0x01
	.word 0xc22922f8  ! 568: STB_I	stb	%r1, [%r4 + 0x02f8]
	.word 0xe6712170  ! 576: STX_I	stx	%r19, [%r4 + 0x0170]
	.word 0xcc210005  ! 576: STW_R	stw	%r6, [%r4 + %r5]
	.word 0xc6212108  ! 576: STW_I	stw	%r3, [%r4 + 0x0108]
	.word 0xc6310005  ! 576: STH_R	sth	%r3, [%r4 + %r5]
	.word 0xf22125b0  ! 576: STW_I	stw	%r25, [%r4 + 0x05b0]
	.word 0xc2292811  ! 576: STB_I	stb	%r1, [%r4 + 0x0811]
	.word 0xc0e924f4  ! 576: LDSTUBA_I	ldstuba	%r0, [%r4 + 0x04f4] %asi
	.word 0xc0710005  ! 576: STX_R	stx	%r0, [%r4 + %r5]
	.word 0xc6212ee0  ! 585: STW_I	stw	%r3, [%r4 + 0x0ee0]
	.word 0xe6310005  ! 585: STH_R	sth	%r19, [%r4 + %r5]
	.word 0xc4310005  ! 585: STH_R	sth	%r2, [%r4 + %r5]
	.word 0xc6290005  ! 585: STB_R	stb	%r3, [%r4 + %r5]
	.word 0xc4310005  ! 585: STH_R	sth	%r2, [%r4 + %r5]
	.word 0xc429206a  ! 585: STB_I	stb	%r2, [%r4 + 0x006a]
	.word 0xd6712e68  ! 585: STX_I	stx	%r11, [%r4 + 0x0e68]
	.word 0xc6e92e8b  ! 585: LDSTUBA_I	ldstuba	%r3, [%r4 + 0x0e8b] %asi
	.word 0xec210005  ! 585: STW_R	stw	%r22, [%r4 + %r5]
	.word 0xc6310005  ! 594: STH_R	sth	%r3, [%r4 + %r5]
	.word 0xc4310005  ! 594: STH_R	sth	%r2, [%r4 + %r5]
	.word 0xf4710005  ! 594: STX_R	stx	%r26, [%r4 + %r5]
	.word 0xf6290005  ! 594: STB_R	stb	%r27, [%r4 + %r5]
	.word 0xc0290005  ! 594: STB_R	stb	%r0, [%r4 + %r5]
	.word 0xf2712078  ! 594: STX_I	stx	%r25, [%r4 + 0x0078]
	.word 0xc1390005  ! 594: STDF_R	std	%f0, [%r5, %r4]
	.word 0xc431241c  ! 594: STH_I	sth	%r2, [%r4 + 0x041c]
	.word 0xd6712bf0  ! 604: STX_I	stx	%r11, [%r4 + 0x0bf0]
	.word 0xc6710005  ! 604: STX_R	stx	%r3, [%r4 + %r5]
	.word 0xc4210005  ! 604: STW_R	stw	%r2, [%r4 + %r5]
	.word 0xc42126a8  ! 604: STW_I	stw	%r2, [%r4 + 0x06a8]
	.word 0xc4310005  ! 604: STH_R	sth	%r2, [%r4 + %r5]
	.word 0xda21211c  ! 604: STW_I	stw	%r13, [%r4 + 0x011c]
	.word 0xfe710005  ! 604: STX_R	stx	%r31, [%r4 + %r5]
	.word 0xc1390005  ! 604: STDF_R	std	%f0, [%r5, %r4]
	.word 0xc6212c50  ! 604: STW_I	stw	%r3, [%r4 + 0x0c50]
	.word 0xc4292256  ! 612: STB_I	stb	%r2, [%r4 + 0x0256]
	.word 0xc629280f  ! 612: STB_I	stb	%r3, [%r4 + 0x080f]
	.word 0xc4210005  ! 612: STW_R	stw	%r2, [%r4 + %r5]
	.word 0xd2212634  ! 612: STW_I	stw	%r9, [%r4 + 0x0634]
	.word 0xc6210005  ! 612: STW_R	stw	%r3, [%r4 + %r5]
	.word 0xcc290005  ! 612: STB_R	stb	%r6, [%r4 + %r5]
	.word 0xe5392c10  ! 612: STDF_I	std	%f18, [0x0c10, %r4]
	.word 0xc6292a2f  ! 612: STB_I	stb	%r3, [%r4 + 0x0a2f]
	.word 0xc0310005  ! 621: STH_R	sth	%r0, [%r4 + %r5]
	.word 0xc4712618  ! 621: STX_I	stx	%r2, [%r4 + 0x0618]
	.word 0xc6210005  ! 621: STW_R	stw	%r3, [%r4 + %r5]
	.word 0xc4292be7  ! 621: STB_I	stb	%r2, [%r4 + 0x0be7]
	.word 0xc2210005  ! 621: STW_R	stw	%r1, [%r4 + %r5]
	.word 0xc4710005  ! 621: STX_R	stx	%r2, [%r4 + %r5]
	.word 0xc3210005  ! 621: STF_R	st	%f1, [%r5, %r4]
	.word 0xc0710005  ! 621: STX_R	stx	%r0, [%r4 + %r5]
	.word 0xc6710005  ! 634: STX_R	stx	%r3, [%r4 + %r5]
	.word 0xc4210005  ! 634: STW_R	stw	%r2, [%r4 + %r5]
	.word 0xc229250c  ! 634: STB_I	stb	%r1, [%r4 + 0x050c]
	.word 0xc2290005  ! 634: STB_R	stb	%r1, [%r4 + %r5]
	.word 0xc0212150  ! 634: STW_I	stw	%r0, [%r4 + 0x0150]
	.word 0xc2212028  ! 634: STW_I	stw	%r1, [%r4 + 0x0028]
	.word 0xd7210005  ! 634: STF_R	st	%f11, [%r5, %r4]
	.word 0xc6310005  ! 634: STH_R	sth	%r3, [%r4 + %r5]
	.word 0xc2310005  ! 642: STH_R	sth	%r1, [%r4 + %r5]
	.word 0xfa310005  ! 642: STH_R	sth	%r29, [%r4 + %r5]
	.word 0xd8292613  ! 642: STB_I	stb	%r12, [%r4 + 0x0613]
	.word 0xc6292734  ! 642: STB_I	stb	%r3, [%r4 + 0x0734]
	.word 0xc4210005  ! 642: STW_R	stw	%r2, [%r4 + %r5]
	.word 0xc4292848  ! 642: STB_I	stb	%r2, [%r4 + 0x0848]
	.word 0xc4f90025  ! 642: SWAPA_R	swapa	%r2, [%r4 + %r5] 0x01
	.word 0xc6290005  ! 642: STB_R	stb	%r3, [%r4 + %r5]
	.word 0xc2712688  ! 651: STX_I	stx	%r1, [%r4 + 0x0688]
	.word 0xdc212330  ! 651: STW_I	stw	%r14, [%r4 + 0x0330]
	.word 0xc6292a29  ! 651: STB_I	stb	%r3, [%r4 + 0x0a29]
	.word 0xf2312e1a  ! 651: STH_I	sth	%r25, [%r4 + 0x0e1a]
	.word 0xc2310005  ! 651: STH_R	sth	%r1, [%r4 + %r5]
	.word 0xc22120b0  ! 651: STW_I	stw	%r1, [%r4 + 0x00b0]
	.word 0xc2e90025  ! 651: LDSTUBA_R	ldstuba	%r1, [%r4 + %r5] 0x01
	.word 0xf0712f70  ! 651: STX_I	stx	%r24, [%r4 + 0x0f70]
	.word 0xc2210005  ! 660: STW_R	stw	%r1, [%r4 + %r5]
	.word 0xc621267c  ! 660: STW_I	stw	%r3, [%r4 + 0x067c]
	.word 0xc4712788  ! 660: STX_I	stx	%r2, [%r4 + 0x0788]
	.word 0xc4292851  ! 660: STB_I	stb	%r2, [%r4 + 0x0851]
	.word 0xc4212b8c  ! 660: STW_I	stw	%r2, [%r4 + 0x0b8c]
	.word 0xfa712a60  ! 660: STX_I	stx	%r29, [%r4 + 0x0a60]
	.word 0xc0792bac  ! 660: SWAP_I	swap	%r0, [%r4 + 0x0bac]
	.word 0xc2712f30  ! 660: STX_I	stx	%r1, [%r4 + 0x0f30]
	.word 0xec290005  ! 668: STB_R	stb	%r22, [%r4 + %r5]
	.word 0xc4310005  ! 668: STH_R	sth	%r2, [%r4 + %r5]
	.word 0xc0312352  ! 668: STH_I	sth	%r0, [%r4 + 0x0352]
	.word 0xda712808  ! 668: STX_I	stx	%r13, [%r4 + 0x0808]
	.word 0xc2310005  ! 668: STH_R	sth	%r1, [%r4 + %r5]
	.word 0xc0210005  ! 668: STW_R	stw	%r0, [%r4 + %r5]
	.word 0xc5210005  ! 668: STF_R	st	%f2, [%r5, %r4]
	.word 0xc4310005  ! 668: STH_R	sth	%r2, [%r4 + %r5]
	.word 0xe4710005  ! 676: STX_R	stx	%r18, [%r4 + %r5]
	.word 0xf0292400  ! 676: STB_I	stb	%r24, [%r4 + 0x0400]
	.word 0xc4292354  ! 676: STB_I	stb	%r2, [%r4 + 0x0354]
	.word 0xd4292e2a  ! 676: STB_I	stb	%r10, [%r4 + 0x0e2a]
	.word 0xc2310005  ! 676: STH_R	sth	%r1, [%r4 + %r5]
	.word 0xe0290005  ! 676: STB_R	stb	%r16, [%r4 + %r5]
	.word 0xc1392bb8  ! 676: STDF_I	std	%f0, [0x0bb8, %r4]
	.word 0xc631244a  ! 676: STH_I	sth	%r3, [%r4 + 0x044a]
	.word 0xc6212f08  ! 690: STW_I	stw	%r3, [%r4 + 0x0f08]
	.word 0xf6292c0d  ! 690: STB_I	stb	%r27, [%r4 + 0x0c0d]
	.word 0xfc292d62  ! 690: STB_I	stb	%r30, [%r4 + 0x0d62]
	.word 0xc22128f4  ! 690: STW_I	stw	%r1, [%r4 + 0x08f4]
	.word 0xf2710005  ! 690: STX_R	stx	%r25, [%r4 + %r5]
	.word 0xc0292b9e  ! 690: STB_I	stb	%r0, [%r4 + 0x0b9e]
	.word 0xc7212220  ! 690: STF_I	st	%f3, [0x0220, %r4]
	.word 0xde210005  ! 690: STW_R	stw	%r15, [%r4 + %r5]
	.word 0xf2212838  ! 698: STW_I	stw	%r25, [%r4 + 0x0838]
	.word 0xe8710005  ! 698: STX_R	stx	%r20, [%r4 + %r5]
	.word 0xf8310005  ! 698: STH_R	sth	%r28, [%r4 + %r5]
	.word 0xc4712a60  ! 698: STX_I	stx	%r2, [%r4 + 0x0a60]
	.word 0xe2710005  ! 698: STX_R	stx	%r17, [%r4 + %r5]
	.word 0xda290005  ! 698: STB_R	stb	%r13, [%r4 + %r5]
	.word 0xf6790005  ! 698: SWAP_R	swap	%r27, [%r4 + %r5]
	.word 0xc421211c  ! 698: STW_I	stw	%r2, [%r4 + 0x011c]
	.word 0xc429250c  ! 707: STB_I	stb	%r2, [%r4 + 0x050c]
	.word 0xc4290005  ! 707: STB_R	stb	%r2, [%r4 + %r5]
	.word 0xc6310005  ! 707: STH_R	sth	%r3, [%r4 + %r5]
	.word 0xc6312dd4  ! 707: STH_I	sth	%r3, [%r4 + 0x0dd4]
	.word 0xcc292588  ! 707: STB_I	stb	%r6, [%r4 + 0x0588]
	.word 0xc0212fc0  ! 707: STW_I	stw	%r0, [%r4 + 0x0fc0]
	.word 0xc4790005  ! 707: SWAP_R	swap	%r2, [%r4 + %r5]
	.word 0xc6710005  ! 707: STX_R	stx	%r3, [%r4 + %r5]
	.word 0xc0310005  ! 716: STH_R	sth	%r0, [%r4 + %r5]
	.word 0xce292b31  ! 716: STB_I	stb	%r7, [%r4 + 0x0b31]
	.word 0xc4290005  ! 716: STB_R	stb	%r2, [%r4 + %r5]
	.word 0xc2292982  ! 716: STB_I	stb	%r1, [%r4 + 0x0982]
	.word 0xc6290005  ! 716: STB_R	stb	%r3, [%r4 + %r5]
	.word 0xc4210005  ! 716: STW_R	stw	%r2, [%r4 + %r5]
	.word 0xc4310005  ! 716: STH_R	sth	%r2, [%r4 + %r5]
	.word 0xe2210005  ! 716: STW_R	stw	%r17, [%r4 + %r5]
	.word 0xc6f923a8  ! 716: SWAPA_I	swapa	%r3, [%r4 + 0x03a8] %asi
	.word 0xc6292e22  ! 724: STB_I	stb	%r3, [%r4 + 0x0e22]
	.word 0xc2292f85  ! 724: STB_I	stb	%r1, [%r4 + 0x0f85]
	.word 0xee712f20  ! 724: STX_I	stx	%r23, [%r4 + 0x0f20]
	.word 0xe2290005  ! 724: STB_R	stb	%r17, [%r4 + %r5]
	.word 0xc4310005  ! 724: STH_R	sth	%r2, [%r4 + %r5]
	.word 0xc6712d20  ! 724: STX_I	stx	%r3, [%r4 + 0x0d20]
	.word 0xc3212248  ! 724: STF_I	st	%f1, [0x0248, %r4]
	.word 0xc2712128  ! 724: STX_I	stx	%r1, [%r4 + 0x0128]
	.word 0xc03122d0  ! 732: STH_I	sth	%r0, [%r4 + 0x02d0]
	.word 0xf07121a0  ! 732: STX_I	stx	%r24, [%r4 + 0x01a0]
	.word 0xc27120b0  ! 732: STX_I	stx	%r1, [%r4 + 0x00b0]
	.word 0xee2928e2  ! 732: STB_I	stb	%r23, [%r4 + 0x08e2]
	.word 0xc0210005  ! 732: STW_R	stw	%r0, [%r4 + %r5]
	.word 0xfc310005  ! 732: STH_R	sth	%r30, [%r4 + %r5]
	.word 0xc1212ee4  ! 732: STF_I	st	%f0, [0x0ee4, %r4]
	.word 0xc6310005  ! 732: STH_R	sth	%r3, [%r4 + %r5]
	.word 0xc67128b8  ! 744: STX_I	stx	%r3, [%r4 + 0x08b8]
	.word 0xf6710005  ! 744: STX_R	stx	%r27, [%r4 + %r5]
	.word 0xde710005  ! 744: STX_R	stx	%r15, [%r4 + %r5]
	.word 0xc22128c0  ! 744: STW_I	stw	%r1, [%r4 + 0x08c0]
	.word 0xd2712158  ! 744: STX_I	stx	%r9, [%r4 + 0x0158]
	.word 0xc6312492  ! 744: STH_I	sth	%r3, [%r4 + 0x0492]
	.word 0xc1f10025  ! 744: CASXA_I	casxa	[%r4] 0x 1, %r5, %r0
	.word 0xe4292746  ! 744: STB_I	stb	%r18, [%r4 + 0x0746]
	.word 0xd229214a  ! 752: STB_I	stb	%r9, [%r4 + 0x014a]
	.word 0xec292b37  ! 752: STB_I	stb	%r22, [%r4 + 0x0b37]
	.word 0xec210005  ! 752: STW_R	stw	%r22, [%r4 + %r5]
	.word 0xc6212278  ! 752: STW_I	stw	%r3, [%r4 + 0x0278]
	.word 0xc4210005  ! 752: STW_R	stw	%r2, [%r4 + %r5]
	.word 0xc6710005  ! 752: STX_R	stx	%r3, [%r4 + %r5]
	.word 0xc4790005  ! 752: SWAP_R	swap	%r2, [%r4 + %r5]
	.word 0xc6212ae8  ! 752: STW_I	stw	%r3, [%r4 + 0x0ae8]
	.word 0xc4712a10  ! 761: STX_I	stx	%r2, [%r4 + 0x0a10]
	.word 0xc2312182  ! 761: STH_I	sth	%r1, [%r4 + 0x0182]
	.word 0xc4210005  ! 761: STW_R	stw	%r2, [%r4 + %r5]
	.word 0xc6310005  ! 761: STH_R	sth	%r3, [%r4 + %r5]
	.word 0xc2290005  ! 761: STB_R	stb	%r1, [%r4 + %r5]
	.word 0xc2310005  ! 761: STH_R	sth	%r1, [%r4 + %r5]
	.word 0xc6312b20  ! 761: STH_I	sth	%r3, [%r4 + 0x0b20]
	.word 0xc6712f48  ! 761: STX_I	stx	%r3, [%r4 + 0x0f48]
	.word 0xc7390005  ! 761: STDF_R	std	%f3, [%r5, %r4]
	.word 0xe4210005  ! 773: STW_R	stw	%r18, [%r4 + %r5]
	.word 0xc6290005  ! 773: STB_R	stb	%r3, [%r4 + %r5]
	.word 0xde210005  ! 773: STW_R	stw	%r15, [%r4 + %r5]
	.word 0xc0210005  ! 773: STW_R	stw	%r0, [%r4 + %r5]
	.word 0xc4292dff  ! 773: STB_I	stb	%r2, [%r4 + 0x0dff]
	.word 0xd0290005  ! 773: STB_R	stb	%r8, [%r4 + %r5]
	.word 0xc6310005  ! 773: STH_R	sth	%r3, [%r4 + %r5]
	.word 0xc4790005  ! 773: SWAP_R	swap	%r2, [%r4 + %r5]
	.word 0xc4210005  ! 773: STW_R	stw	%r2, [%r4 + %r5]
	.word 0xc23124b4  ! 784: STH_I	sth	%r1, [%r4 + 0x04b4]
	.word 0xfc292492  ! 784: STB_I	stb	%r30, [%r4 + 0x0492]
	.word 0xc6292a56  ! 784: STB_I	stb	%r3, [%r4 + 0x0a56]
	.word 0xc4210005  ! 784: STW_R	stw	%r2, [%r4 + %r5]
	.word 0xc4712958  ! 784: STX_I	stx	%r2, [%r4 + 0x0958]
	.word 0xc4710005  ! 784: STX_R	stx	%r2, [%r4 + %r5]
	.word 0xc1392170  ! 784: STDF_I	std	%f0, [0x0170, %r4]
	.word 0xc0290005  ! 784: STB_R	stb	%r0, [%r4 + %r5]
	.word 0xc2310005  ! 792: STH_R	sth	%r1, [%r4 + %r5]
	.word 0xc0710005  ! 792: STX_R	stx	%r0, [%r4 + %r5]
	.word 0xc0290005  ! 792: STB_R	stb	%r0, [%r4 + %r5]
	.word 0xda710005  ! 792: STX_R	stx	%r13, [%r4 + %r5]
	.word 0xc2710005  ! 792: STX_R	stx	%r1, [%r4 + %r5]
	.word 0xc6210005  ! 792: STW_R	stw	%r3, [%r4 + %r5]
	.word 0xc1210005  ! 792: STF_R	st	%f0, [%r5, %r4]
	.word 0xfe210005  ! 792: STW_R	stw	%r31, [%r4 + %r5]
	.word 0xe8292bf7  ! 800: STB_I	stb	%r20, [%r4 + 0x0bf7]
	.word 0xc2312d5a  ! 800: STH_I	sth	%r1, [%r4 + 0x0d5a]
	.word 0xd429234b  ! 800: STB_I	stb	%r10, [%r4 + 0x034b]
	.word 0xc4310005  ! 800: STH_R	sth	%r2, [%r4 + %r5]
	.word 0xc631278a  ! 800: STH_I	sth	%r3, [%r4 + 0x078a]
	.word 0xc0710005  ! 800: STX_R	stx	%r0, [%r4 + %r5]
	.word 0xd7390005  ! 800: STDF_R	std	%f11, [%r5, %r4]
	.word 0xfa710005  ! 800: STX_R	stx	%r29, [%r4 + %r5]
	.word 0xc2312f90  ! 810: STH_I	sth	%r1, [%r4 + 0x0f90]
	.word 0xc0212df8  ! 810: STW_I	stw	%r0, [%r4 + 0x0df8]
	.word 0xe2710005  ! 810: STX_R	stx	%r17, [%r4 + %r5]
	.word 0xfe310005  ! 810: STH_R	sth	%r31, [%r4 + %r5]
	.word 0xc0210005  ! 810: STW_R	stw	%r0, [%r4 + %r5]
	.word 0xc2212274  ! 810: STW_I	stw	%r1, [%r4 + 0x0274]
	.word 0xf3e12005  ! 810: CASA_R	casa	[%r4] %asi, %r5, %r25
	.word 0xc2710005  ! 810: STX_R	stx	%r1, [%r4 + %r5]
	.word 0xc2712b68  ! 820: STX_I	stx	%r1, [%r4 + 0x0b68]
	.word 0xea3121d0  ! 820: STH_I	sth	%r21, [%r4 + 0x01d0]
	.word 0xdc712958  ! 820: STX_I	stx	%r14, [%r4 + 0x0958]
	.word 0xc07121b8  ! 820: STX_I	stx	%r0, [%r4 + 0x01b8]
	.word 0xd4312f4a  ! 820: STH_I	sth	%r10, [%r4 + 0x0f4a]
	.word 0xc021233c  ! 820: STW_I	stw	%r0, [%r4 + 0x033c]
	.word 0xff392a50  ! 820: STDF_I	std	%f31, [0x0a50, %r4]
	.word 0xde292968  ! 820: STB_I	stb	%r15, [%r4 + 0x0968]
	.word 0xf8312fe4  ! 828: STH_I	sth	%r28, [%r4 + 0x0fe4]
	.word 0xc6210005  ! 828: STW_R	stw	%r3, [%r4 + %r5]
	.word 0xc4290005  ! 828: STB_R	stb	%r2, [%r4 + %r5]
	.word 0xc2292c24  ! 828: STB_I	stb	%r1, [%r4 + 0x0c24]
	.word 0xc22123b0  ! 828: STW_I	stw	%r1, [%r4 + 0x03b0]
	.word 0xea210005  ! 828: STW_R	stw	%r21, [%r4 + %r5]
	.word 0xf7392158  ! 828: STDF_I	std	%f27, [0x0158, %r4]
	.word 0xc0312e92  ! 828: STH_I	sth	%r0, [%r4 + 0x0e92]
	.word 0xc6290005  ! 838: STB_R	stb	%r3, [%r4 + %r5]
	.word 0xe67120b0  ! 838: STX_I	stx	%r19, [%r4 + 0x00b0]
	.word 0xd4310005  ! 838: STH_R	sth	%r10, [%r4 + %r5]
	.word 0xc4312236  ! 838: STH_I	sth	%r2, [%r4 + 0x0236]
	.word 0xc221205c  ! 838: STW_I	stw	%r1, [%r4 + 0x005c]
	.word 0xc2710005  ! 838: STX_R	stx	%r1, [%r4 + %r5]
	.word 0xc5390005  ! 838: STDF_R	std	%f2, [%r5, %r4]
	.word 0xc2292ad7  ! 838: STB_I	stb	%r1, [%r4 + 0x0ad7]
	.word 0xc4210005  ! 848: STW_R	stw	%r2, [%r4 + %r5]
	.word 0xec210005  ! 848: STW_R	stw	%r22, [%r4 + %r5]
	.word 0xe4310005  ! 848: STH_R	sth	%r18, [%r4 + %r5]
	.word 0xf6292b80  ! 848: STB_I	stb	%r27, [%r4 + 0x0b80]
	.word 0xc6290005  ! 848: STB_R	stb	%r3, [%r4 + %r5]
	.word 0xc03126a0  ! 848: STH_I	sth	%r0, [%r4 + 0x06a0]
	.word 0xc6710005  ! 848: STX_R	stx	%r3, [%r4 + %r5]
	.word 0xf1f12005  ! 848: CASXA_R	casxa	[%r4]%asi, %r5, %r24
	.word 0xc03125b4  ! 848: STH_I	sth	%r0, [%r4 + 0x05b4]
	.word 0xc2310005  ! 857: STH_R	sth	%r1, [%r4 + %r5]
	.word 0xe4712538  ! 857: STX_I	stx	%r18, [%r4 + 0x0538]
	.word 0xe2312ab4  ! 857: STH_I	sth	%r17, [%r4 + 0x0ab4]
	.word 0xe6712fd8  ! 857: STX_I	stx	%r19, [%r4 + 0x0fd8]
	.word 0xc4292f29  ! 857: STB_I	stb	%r2, [%r4 + 0x0f29]
	.word 0xc4212ab8  ! 857: STW_I	stw	%r2, [%r4 + 0x0ab8]
	.word 0xc2310005  ! 857: STH_R	sth	%r1, [%r4 + %r5]
	.word 0xc6290005  ! 857: STB_R	stb	%r3, [%r4 + %r5]
	.word 0xc4712750  ! 857: STX_I	stx	%r2, [%r4 + 0x0750]
	.word 0xdc712e28  ! 867: STX_I	stx	%r14, [%r4 + 0x0e28]
	.word 0xfe29255d  ! 867: STB_I	stb	%r31, [%r4 + 0x055d]
	.word 0xe22924ec  ! 867: STB_I	stb	%r17, [%r4 + 0x04ec]
	.word 0xc2290005  ! 867: STB_R	stb	%r1, [%r4 + %r5]
	.word 0xee712888  ! 867: STX_I	stx	%r23, [%r4 + 0x0888]
	.word 0xd8310005  ! 867: STH_R	sth	%r12, [%r4 + %r5]
	.word 0xc0292900  ! 867: STB_I	stb	%r0, [%r4 + 0x0900]
	.word 0xc7390005  ! 867: STDF_R	std	%f3, [%r5, %r4]
	.word 0xc0212f04  ! 867: STW_I	stw	%r0, [%r4 + 0x0f04]
	.word 0xc6312924  ! 875: STH_I	sth	%r3, [%r4 + 0x0924]
	.word 0xc2212cc8  ! 875: STW_I	stw	%r1, [%r4 + 0x0cc8]
	.word 0xc6312f34  ! 875: STH_I	sth	%r3, [%r4 + 0x0f34]
	.word 0xe22924cd  ! 875: STB_I	stb	%r17, [%r4 + 0x04cd]
	.word 0xc6210005  ! 875: STW_R	stw	%r3, [%r4 + %r5]
	.word 0xc2710005  ! 875: STX_R	stx	%r1, [%r4 + %r5]
	.word 0xfe790005  ! 875: SWAP_R	swap	%r31, [%r4 + %r5]
	.word 0xf4312516  ! 875: STH_I	sth	%r26, [%r4 + 0x0516]
	.word 0xc2312f14  ! 883: STH_I	sth	%r1, [%r4 + 0x0f14]
	.word 0xc4310005  ! 883: STH_R	sth	%r2, [%r4 + %r5]
	.word 0xc6290005  ! 883: STB_R	stb	%r3, [%r4 + %r5]
	.word 0xda7122b0  ! 883: STX_I	stx	%r13, [%r4 + 0x02b0]
	.word 0xc03125c8  ! 883: STH_I	sth	%r0, [%r4 + 0x05c8]
	.word 0xe6292bcb  ! 883: STB_I	stb	%r19, [%r4 + 0x0bcb]
	.word 0xc3210005  ! 883: STF_R	st	%f1, [%r5, %r4]
	.word 0xe0312866  ! 883: STH_I	sth	%r16, [%r4 + 0x0866]
	.word 0xe0292885  ! 892: STB_I	stb	%r16, [%r4 + 0x0885]
	.word 0xe8292fa5  ! 892: STB_I	stb	%r20, [%r4 + 0x0fa5]
	.word 0xc2710005  ! 892: STX_R	stx	%r1, [%r4 + %r5]
	.word 0xc4210005  ! 892: STW_R	stw	%r2, [%r4 + %r5]
	.word 0xea312a54  ! 892: STH_I	sth	%r21, [%r4 + 0x0a54]
	.word 0xce312c9c  ! 892: STH_I	sth	%r7, [%r4 + 0x0c9c]
	.word 0xc6712758  ! 892: STX_I	stx	%r3, [%r4 + 0x0758]
	.word 0xeb3925c0  ! 892: STDF_I	std	%f21, [0x05c0, %r4]
	.word 0xc2712070  ! 892: STX_I	stx	%r1, [%r4 + 0x0070]
	.word 0xc029291b  ! 901: STB_I	stb	%r0, [%r4 + 0x091b]
	.word 0xe829245c  ! 901: STB_I	stb	%r20, [%r4 + 0x045c]
	.word 0xc6312270  ! 901: STH_I	sth	%r3, [%r4 + 0x0270]
	.word 0xec310005  ! 901: STH_R	sth	%r22, [%r4 + %r5]
	.word 0xc6710005  ! 901: STX_R	stx	%r3, [%r4 + %r5]
	.word 0xc4290005  ! 901: STB_R	stb	%r2, [%r4 + %r5]
	.word 0xfee926e0  ! 901: LDSTUBA_I	ldstuba	%r31, [%r4 + 0x06e0] %asi
	.word 0xc0312406  ! 901: STH_I	sth	%r0, [%r4 + 0x0406]
	.word 0xc4210005  ! 909: STW_R	stw	%r2, [%r4 + %r5]
	.word 0xc6210005  ! 909: STW_R	stw	%r3, [%r4 + %r5]
	.word 0xc0210005  ! 909: STW_R	stw	%r0, [%r4 + %r5]
	.word 0xc2290005  ! 909: STB_R	stb	%r1, [%r4 + %r5]
	.word 0xec712ee0  ! 909: STX_I	stx	%r22, [%r4 + 0x0ee0]
	.word 0xe8290005  ! 909: STB_R	stb	%r20, [%r4 + %r5]
	.word 0xc7f12005  ! 909: CASXA_R	casxa	[%r4]%asi, %r5, %r3
	.word 0xc0310005  ! 909: STH_R	sth	%r0, [%r4 + %r5]
	.word 0xc0290005  ! 917: STB_R	stb	%r0, [%r4 + %r5]
	.word 0xc4710005  ! 917: STX_R	stx	%r2, [%r4 + %r5]
	.word 0xc4292f3d  ! 917: STB_I	stb	%r2, [%r4 + 0x0f3d]
	.word 0xe031220c  ! 917: STH_I	sth	%r16, [%r4 + 0x020c]
	.word 0xc4212960  ! 917: STW_I	stw	%r2, [%r4 + 0x0960]
	.word 0xc4710005  ! 917: STX_R	stx	%r2, [%r4 + %r5]
	.word 0xc5210005  ! 917: STF_R	st	%f2, [%r5, %r4]
	.word 0xe031238a  ! 917: STH_I	sth	%r16, [%r4 + 0x038a]
	.word 0xc03124c4  ! 926: STH_I	sth	%r0, [%r4 + 0x04c4]
	.word 0xc6210005  ! 926: STW_R	stw	%r3, [%r4 + %r5]
	.word 0xc6710005  ! 926: STX_R	stx	%r3, [%r4 + %r5]
	.word 0xdc3120d2  ! 926: STH_I	sth	%r14, [%r4 + 0x00d2]
	.word 0xc07125d8  ! 926: STX_I	stx	%r0, [%r4 + 0x05d8]
	.word 0xe2210005  ! 926: STW_R	stw	%r17, [%r4 + %r5]
	.word 0xc3212938  ! 926: STF_I	st	%f1, [0x0938, %r4]
	.word 0xc2310005  ! 926: STH_R	sth	%r1, [%r4 + %r5]
	.word 0xc6292d92  ! 935: STB_I	stb	%r3, [%r4 + 0x0d92]
	.word 0xec310005  ! 935: STH_R	sth	%r22, [%r4 + %r5]
	.word 0xc6712ef8  ! 935: STX_I	stx	%r3, [%r4 + 0x0ef8]
	.word 0xc0312868  ! 935: STH_I	sth	%r0, [%r4 + 0x0868]
	.word 0xea312150  ! 935: STH_I	sth	%r21, [%r4 + 0x0150]
	.word 0xc0292358  ! 935: STB_I	stb	%r0, [%r4 + 0x0358]
	.word 0xfa710005  ! 935: STX_R	stx	%r29, [%r4 + %r5]
	.word 0xc4e90025  ! 935: LDSTUBA_R	ldstuba	%r2, [%r4 + %r5] 0x01
	.word 0xea712f30  ! 935: STX_I	stx	%r21, [%r4 + 0x0f30]
	.word 0xc2712030  ! 943: STX_I	stx	%r1, [%r4 + 0x0030]
	.word 0xc0212060  ! 943: STW_I	stw	%r0, [%r4 + 0x0060]
	.word 0xc4210005  ! 943: STW_R	stw	%r2, [%r4 + %r5]
	.word 0xc22927bb  ! 943: STB_I	stb	%r1, [%r4 + 0x07bb]
	.word 0xc6712988  ! 943: STX_I	stx	%r3, [%r4 + 0x0988]
	.word 0xc0310005  ! 943: STH_R	sth	%r0, [%r4 + %r5]
	.word 0xc3392208  ! 943: STDF_I	std	%f1, [0x0208, %r4]
	.word 0xc4310005  ! 943: STH_R	sth	%r2, [%r4 + %r5]
	.word 0xd0212bd8  ! 953: STW_I	stw	%r8, [%r4 + 0x0bd8]
	.word 0xf8290005  ! 953: STB_R	stb	%r28, [%r4 + %r5]
	.word 0xe6210005  ! 953: STW_R	stw	%r19, [%r4 + %r5]
	.word 0xd8212b30  ! 953: STW_I	stw	%r12, [%r4 + 0x0b30]
	.word 0xc0290005  ! 953: STB_R	stb	%r0, [%r4 + %r5]
	.word 0xc47120b8  ! 953: STX_I	stx	%r2, [%r4 + 0x00b8]
	.word 0xc1f10025  ! 953: CASXA_I	casxa	[%r4] 0x 1, %r5, %r0
	.word 0xc2212418  ! 953: STW_I	stw	%r1, [%r4 + 0x0418]
	.word 0xc4312106  ! 961: STH_I	sth	%r2, [%r4 + 0x0106]
	.word 0xc62928ab  ! 961: STB_I	stb	%r3, [%r4 + 0x08ab]
	.word 0xc2292a42  ! 961: STB_I	stb	%r1, [%r4 + 0x0a42]
	.word 0xc6290005  ! 961: STB_R	stb	%r3, [%r4 + %r5]
	.word 0xc42120b8  ! 961: STW_I	stw	%r2, [%r4 + 0x00b8]
	.word 0xf22925a4  ! 961: STB_I	stb	%r25, [%r4 + 0x05a4]
	.word 0xc7e10025  ! 961: CASA_I	casa	[%r4] 0x 1, %r5, %r3
	.word 0xea290005  ! 961: STB_R	stb	%r21, [%r4 + %r5]
	.word 0xc0212514  ! 969: STW_I	stw	%r0, [%r4 + 0x0514]
	.word 0xc22927aa  ! 969: STB_I	stb	%r1, [%r4 + 0x07aa]
	.word 0xc4712b90  ! 969: STX_I	stx	%r2, [%r4 + 0x0b90]
	.word 0xc4710005  ! 969: STX_R	stx	%r2, [%r4 + %r5]
	.word 0xc231207a  ! 969: STH_I	sth	%r1, [%r4 + 0x007a]
	.word 0xdc712420  ! 969: STX_I	stx	%r14, [%r4 + 0x0420]
	.word 0xc6e90025  ! 969: LDSTUBA_R	ldstuba	%r3, [%r4 + %r5] 0x01
	.word 0xfa292ec4  ! 969: STB_I	stb	%r29, [%r4 + 0x0ec4]
	.word 0xc2310005  ! 978: STH_R	sth	%r1, [%r4 + %r5]
	.word 0xe4710005  ! 978: STX_R	stx	%r18, [%r4 + %r5]
	.word 0xc6712828  ! 978: STX_I	stx	%r3, [%r4 + 0x0828]
	.word 0xc0712120  ! 978: STX_I	stx	%r0, [%r4 + 0x0120]
	.word 0xc27129a8  ! 978: STX_I	stx	%r1, [%r4 + 0x09a8]
	.word 0xc6710005  ! 978: STX_R	stx	%r3, [%r4 + %r5]
	.word 0xc6790005  ! 978: SWAP_R	swap	%r3, [%r4 + %r5]
	.word 0xd2212a48  ! 978: STW_I	stw	%r9, [%r4 + 0x0a48]
	.word 0xc6710005  ! 987: STX_R	stx	%r3, [%r4 + %r5]
	.word 0xc4710005  ! 987: STX_R	stx	%r2, [%r4 + %r5]
	.word 0xe2310005  ! 987: STH_R	sth	%r17, [%r4 + %r5]
	.word 0xc0210005  ! 987: STW_R	stw	%r0, [%r4 + %r5]
	.word 0xc4210005  ! 987: STW_R	stw	%r2, [%r4 + %r5]
	.word 0xe2210005  ! 987: STW_R	stw	%r17, [%r4 + %r5]
	.word 0xc6e90025  ! 987: LDSTUBA_R	ldstuba	%r3, [%r4 + %r5] 0x01
	.word 0xc4212344  ! 987: STW_I	stw	%r2, [%r4 + 0x0344]
	.word 0xc0710005  ! 997: STX_R	stx	%r0, [%r4 + %r5]
	.word 0xd2210005  ! 997: STW_R	stw	%r9, [%r4 + %r5]
	.word 0xc0212b78  ! 997: STW_I	stw	%r0, [%r4 + 0x0b78]
	.word 0xc0712c80  ! 997: STX_I	stx	%r0, [%r4 + 0x0c80]
	.word 0xc0712e18  ! 997: STX_I	stx	%r0, [%r4 + 0x0e18]
	.word 0xc4710005  ! 997: STX_R	stx	%r2, [%r4 + %r5]
	.word 0xc7212250  ! 997: STF_I	st	%f3, [0x0250, %r4]
	.word 0xc6210005  ! 997: STW_R	stw	%r3, [%r4 + %r5]
        ta      T_GOOD_TRAP

.data
	.word  0xd0539167,0xb3c1b658,0x75f37a74,0x780f887c
	.word  0xab561d27,0x7c341c11,0x64497888,0xca876bc4
	.word  0x1c0d46da,0x54555d5c,0x692f65e2,0x47c053af
	.word  0xd8fd0e3f,0x32801dc0,0x9a15352a,0xc7ca1def
	.word  0xa5ae4746,0xc1f7ab91,0x936fbcff,0x10359add
	.word  0xf1ed0969,0x396d7cfc,0xf7104699,0x50cea3de
	.word  0x99457ab3,0xdcca3acc,0xb038d253,0xf1c8ad83
	.word  0x084b288b,0xc8663781,0x3039a4cb,0x5928fac2
	.word  0x50bdf604,0x87e0a212,0x7850801d,0xcc67bef3
	.word  0x407e35cd,0xa2e90278,0xd2de85f8,0x97cdd282
	.word  0x7fe62393,0x1cc3266b,0xb0b72696,0x047ffe46
	.word  0x5a5fb647,0xba066af2,0xf8451c57,0x43d71ecc
	.word  0x45156d9e,0x919d64c8,0x0ae9f794,0xf26174d0
	.word  0xdb22dd8e,0x9762dd8b,0x494566f8,0xcdb21976
	.word  0xc79f8194,0xc5f5f2ad,0x1a080349,0xc958ad43
	.word  0xe0d379fa,0xeae6dafe,0xcf6c0e2e,0xd2f70b21
	.word  0x303f482c,0xdee5a6c3,0xb4a8f2cf,0x8ad93950
	.word  0x7374386b,0xda759282,0x1983681b,0xa7dd09fe
	.word  0x3bd3c9a1,0xb3d1cd4f,0xb294c284,0x89c2a6dc
	.word  0xb3cfdb49,0x09ee3005,0x67b157af,0x4f34f6fb
	.word  0x47f2e2d0,0x36c99a48,0x6255c638,0x00ef72b3
	.word  0x423e75de,0x24c91cf0,0x6ffd90b3,0xbd411f0e
	.word  0x51be8faf,0x207061ee,0x368fe5f9,0x46835ef3
	.word  0xceab6914,0x7708dae4,0x32a2a6c9,0x7600bde5
	.word  0x2250ef4c,0x481d33bc,0x5b646f72,0x426f36c3
	.word  0x1bc7d44a,0x64702373,0xcc9ca3e1,0xd9d76b6b
	.word  0x201414da,0x3f5e2ef5,0x9c8fa21f,0x00a80247
	.word  0x0f83ab5c,0x17ba8176,0x4fe20a11,0x925b6126
	.word  0xdfa91c7f,0xf096840a,0x35a8b9f0,0x93372c09
	.word  0xfee3521c,0x9a242100,0x69fcc9af,0xce45db9f
	.word  0x0bf4a759,0x503132c0,0x7dfa8904,0xc266c301
	.word  0xa7f1746d,0xc10233c8,0x38507f30,0xb89cd8bf
	.word  0xb36a0490,0x9efdceee,0x1b35ae85,0x74f719db
	.word  0xaaa30f3b,0xb63b36bd,0x7006a0e2,0xf2e62c9b
	.word  0xdfb6e3dd,0x7c53eb32,0x27321db5,0xc0b131e3
	.word  0xb1f33e86,0xf5c3a734,0x43306226,0xf421c9bc
	.word  0x523eec89,0x2c70c405,0x85bdcc24,0x219bc5b5
	.word  0x4e0462a2,0xd6fe95f6,0x584559f1,0xec179946
	.word  0x84a0b885,0x7a34a943,0x7400f9d2,0x0e7d6502
	.word  0x7a799b1d,0x766a4313,0x69a3b56c,0xdacb405c
	.word  0x1df8b109,0x5910238c,0x70026f60,0x667f1c37
	.word  0x87b2645a,0xcf0a0d5b,0x06210b0a,0x91964160
	.word  0x03cfb267,0x29a38e36,0x85981b8b,0x35f05240
	.word  0xb53ed143,0xfa0fd65b,0xf30b8cff,0x5851a638
	.word  0xa11c3e29,0x54721248,0x6a9cdd1e,0xc79b343d
	.word  0x68dc40bf,0x0c2c013a,0x31611cd1,0x0b275d4f
	.word  0x2a92cd62,0xa1497664,0xe735f8f9,0x88c29282
	.word  0xb23bfbba,0x4dc72fb9,0x7bc93f07,0x7258152a
	.word  0x9af466bd,0xacb676d1,0x2df0a747,0x45f777d0
	.word  0x375c498f,0x4b89c814,0xf1769582,0x35b3a3b7
	.word  0xd5af5164,0xe338b122,0x503291a0,0xfb1f6c3a
	.word  0xd25dfee8,0x193f4b64,0x49d03a6e,0x6a03ffa9
	.word  0xadb85aba,0xaa9797da,0xfbaf1aa4,0xdc548dd8
	.word  0xf0d0187e,0xc8023860,0xe9a7bcae,0x69774637
	.word  0xa670f9ed,0xc4418e5b,0x18e76bdc,0xf7270ba4
	.word  0xc368a971,0x3f50bbb7,0xa2c26d9a,0x698c79d0
	.word  0x5e399eea,0x59b7b044,0xdcefa8b7,0x0e601fca
	.word  0x360af29b,0x5117aa23,0x2c49ddef,0x46a087a7
	.word  0x548ef7e4,0xa348b30d,0x8ae1663d,0xdbf9e916
	.word  0xfbc4ec74,0xb705104c,0x7b66cef1,0x81587b37
	.word  0x4494ac5e,0x6e5e2e39,0xf0e4cca7,0x6187ecaf
	.word  0x58978131,0x3640fdbf,0xcc1c4593,0x05864290
	.word  0xbd579ef0,0x0868bb33,0xcc11bf58,0x21f19c10
	.word  0x1fdfc39a,0x386c27b5,0x8407a170,0xf1403c02
	.word  0xfe3403bf,0x6b19cc0f,0x052ec1fb,0x8449e54b
	.word  0x309eaef1,0x66010997,0x6c45eef8,0x22dca9d7
	.word  0xb03d477c,0xcbee1f54,0xb280a079,0x072e985f
	.word  0x193c5a35,0x3068ea50,0xa1a3a4e6,0x4115d4b1
	.word  0x1609f198,0x8bd401b2,0x7ffb78f2,0xe11162fd
	.word  0x4966c1f4,0x60ceda30,0xa8972c20,0xc6b1c031
	.word  0x9e0fbea6,0xf6638368,0x28622745,0x07c0fcef
	.word  0x4acea9c8,0x5777d9ca,0xe5bea2a6,0x0395028c
	.word  0xe62e85f7,0x01866705,0x79d9a701,0x3c1d67e2
	.word  0x6598b309,0x55d89a00,0xb3b3bcd4,0x936063b9
	.word  0x1b06c472,0xc3f2cf49,0x2309312c,0x75da5272
	.word  0xedc27f4a,0x5daaee8d,0x06afe12b,0x66ccb58a
	.word  0x01659aef,0x1b67bc8b,0x324b57a3,0x8f0ee37e
	.word  0x090d209c,0x7d1e2fd1,0xebcefaef,0xc8c728be
	.word  0xd5b6f417,0x3d465f9c,0x4fcc76a8,0x0749b540
	.word  0x7e59a6ca,0xd9f71cc2,0x085f6c7a,0x8b8d4eab
	.word  0x58573f87,0xd8886ff3,0x88a74a6d,0x25d8cc91
	.word  0xb8111ccf,0x57957f7d,0x4d5ddde4,0xffc2ea0b
	.word  0x6c68093f,0x9e79e293,0x0ac5a8d3,0x23944f5f
	.word  0xa9c12866,0x8f5b1664,0x70e2cccf,0x4be1fb3f
	.word  0x92099c2f,0xfec0cecc,0x1bcdb09e,0x5274ceb8
	.word  0x76507fca,0x7d13a23e,0x59a2ad37,0x94b16008
	.word  0xe5f86327,0x453c9393,0xb239d47c,0x0ab1e44b
	.word  0x1532a7d5,0xc4401260,0xae65ac5a,0x96137bac
	.word  0x792bf1d6,0x45f734c0,0x98edf3d2,0xb86be221
	.word  0xe375da97,0x6ea79da4,0x9c0b81e1,0xf3e3f5ee
	.word  0xf05b9670,0xca90a703,0x7ab7f3cf,0xea061931
	.word  0x92e9d210,0x11ea1cea,0x553610ad,0x53729920
	.word  0x45f10fa1,0x1c753575,0x2b14bc0a,0xa35ed3c4
	.word  0x724c68ae,0x4e21e744,0xcff1a18f,0xe4522295
	.word  0xce72447a,0xca4b6c5b,0xcd54cd01,0xdb4d1836
	.word  0xe3e2de88,0x9935a9fd,0x22c7617d,0xe8692146
	.word  0x4fd3e329,0x2835b567,0xbd7c15cb,0x07383b1f
	.word  0xceb854ea,0x5c6125a2,0x26899189,0x4a6fdf4a
	.word  0xc8f0f4be,0xdbcbf141,0x748e516e,0x02bce8f4
	.word  0xb2f106e5,0x17b95047,0xb3cff81b,0x77841324
	.word  0x6338fd9e,0xa74f9116,0xb2f6a214,0x907fbafd
	.word  0x108833ee,0x4b5e1c6a,0xfd5d75ac,0x3ae2f287
	.word  0x6b9a7888,0xea385bc4,0x8c20241b,0xe07bac0d
	.word  0x110e4906,0x96c89c59,0x374bb040,0x6e9c0cc7
	.word  0x6b2a47e6,0x1bfa4bb5,0x14415c19,0xfbcbc0ca
	.word  0xbc5723fc,0xd2637e3d,0x2d3f6b09,0xc4c3c34b
	.word  0x83a188b7,0x61cd6200,0x298e7d9f,0xe0efd40c
	.word  0x69391e97,0xecb75cd4,0xcfd8297b,0xa7481ddc
	.word  0x6bf2362a,0xccdc34df,0x60875534,0x8e981457
	.word  0x338c6b30,0x859c3f21,0xaf49b86d,0x0f3cb63b
	.word  0xf1c8710d,0x074707bc,0x498a82c9,0x6ecafae8
	.word  0x5f24a20f,0x59564d36,0x4c28dcbd,0x2f52cfea
	.word  0x07c6f67a,0x5184fdf3,0xc1dd90b4,0x314e98ee
	.word  0x2a0fb79d,0x0abcd312,0x26ae2f1b,0xbda6e89f
	.word  0x019b21f4,0xd6f5e211,0x01254a9b,0x7942db7e
	.word  0x9a157eda,0x504e4cb2,0xc98a9259,0x3a555699
	.word  0xd1a46f62,0x70ee0d47,0x554167bd,0x6de78751
	.word  0x044a032b,0x11ff195b,0xb00f1896,0x16d6761f
	.word  0xc2c4e840,0xea58bbde,0x0c07de17,0x156b78ca
	.word  0x99f470d5,0x718db5ad,0xa311784b,0x02b3754f
	.word  0x98a9e833,0x1977e5ce,0xfd70a306,0x261c5525
	.word  0xf4331dcc,0x7381b945,0xcfb73ba1,0x66c787fe
	.word  0x07564ed6,0x2801ffa6,0x03e90cb8,0x107fc4b9
	.word  0x528a958b,0xe8ca8bf4,0x93114489,0xe34f5722
	.word  0xce15783c,0xd11eeb9f,0x0a4700df,0xf94a379f
	.word  0x1b994181,0x3820a297,0x998d3d69,0x4128b335
	.word  0x256f82ce,0x8314f0e7,0xa0bd391f,0x2e953c28
	.word  0x4b061449,0x3ba9ebf1,0x83db27b9,0xb8b0d339
	.word  0xa5d33639,0xa4e13287,0xdc644da5,0x775f3b73
	.word  0x136ce641,0x49078cff,0x52229d85,0x0c2bcc19
	.word  0xb95c281d,0x47fd60a6,0xb0bfafb0,0x048e1c9c
	.word  0xcbdf32c6,0x9cfca26a,0x07f936bc,0x92a3be9f
	.word  0xd34d108f,0x8540d3d5,0xb929db6b,0x53d7f04c
	.word  0x55721454,0xebd8ffc0,0x0ea1819e,0xcf3499c0
	.word  0x3cfcdda7,0xce04bd97,0x68a98d93,0x4fd74ec2
	.word  0x0549c635,0x64a8c791,0x5f87075f,0xc4b2eb31
	.word  0x9b9a7824,0xba4a52ac,0x9bf34c31,0xfbd981da
	.word  0x7044e959,0x44a3a434,0xecab71ae,0x340a5681
	.word  0xfbbad1b6,0xc82f8ed4,0x26cfb2d9,0x0a5b7a5f
	.word  0xe5659785,0xdd097d00,0x51e67707,0x54dabfb2
	.word  0x86c5ce25,0x0c2e29ff,0xe5e6e53c,0x54d5068e
	.word  0xe2aa2c65,0x6c5bbbe5,0x8c30cfda,0xa1a328bb
	.word  0x7c762d54,0xd5a4653c,0x9b81fa83,0x77952603
	.word  0xb38aeabe,0xa3920fbd,0xd5fce6c8,0xdf08768b
	.word  0x2e47f2c9,0xef58b0c7,0xb804da83,0xa4fc8459
	.word  0x9eeabdb4,0x2c7e3a12,0x36c8d0d1,0x9257f068
	.word  0xe2419ad0,0xd0516fba,0xb18c4ee8,0xaa04257f
	.word  0x374dcfb2,0xa3d80e7d,0x25920fee,0xc912819f
	.word  0xee1a33d4,0x283f07f5,0xb1c92ae6,0x57cc8af4
	.word  0xe89a1219,0x5f8b08b0,0x2c15c9c6,0xb279e008
	.word  0xecbeadec,0xb3057763,0xbdc6e7e8,0xdd723864
	.word  0x12999a8a,0x861adef6,0xb015c6aa,0xfccf3b0a
	.word  0x3b4c91e2,0x23de2e52,0x720d99a6,0x328229d9
	.word  0xea68a6a7,0x09f3c436,0x0cd6abd3,0x9ce89c74
	.word  0x71737b5c,0x2dab3426,0xd6e9886a,0xa848047b
	.word  0x173de90d,0xb681c9eb,0xe2d7cfd7,0x0c579698
	.word  0xe30a608f,0x15169258,0x3efe3dff,0x45de747b
	.word  0xad5eec53,0x3c333938,0xe0db60d5,0xb15aa9ea
	.word  0x3e4dca19,0xd50a3395,0xd74ad7ce,0x4a265368
	.word  0x6a8338aa,0xd72ed1fc,0xe073f8ff,0x4a213b39
	.word  0x8dd9326a,0x7a7adf46,0x8cb56973,0xb083e980
	.word  0xe34403ed,0xea0fb3e6,0x6aef494c,0xda44b92f
	.word  0x641e0bc6,0x150f7975,0xb2dc5d3e,0xb72ecb3f
	.word  0xd16b42bb,0xa27ad195,0x03127bee,0x969b5209
	.word  0x78afeacc,0x2cdca31a,0xbc77b7fb,0xd61bf859
	.word  0x06893526,0xc4c95bd0,0xcf595df4,0x9edcc991
	.word  0xd4c74291,0xed7a8554,0xfa4dd837,0x567fdfba
	.word  0x1312dd1f,0xe2cce109,0xf54fba7a,0xcb7ed25c
	.word  0x0b2464bf,0x4044e861,0xc55e31d6,0x42b4f0b0
	.word  0xd26641f7,0x35354794,0xc2386e05,0x9b126a30
	.word  0x962f916a,0x704bbdb1,0x8da83576,0xa97b81f8
	.word  0xebd1c3f5,0x3fe6b86f,0xd1f0b0f7,0xe38e40e3
	.word  0x6ab367c9,0xb9f77643,0xf2b5ba78,0x6789dc83
	.word  0x9240dd79,0x48482ede,0xda9283aa,0x912ac2a4
	.word  0x5f78c44f,0x888e16b2,0xb18702b4,0x09a4c443
	.word  0xd072ae5b,0x4e5174bb,0xb54806c3,0x2749e0bf
	.word  0x3e310bb5,0x6b4c2b87,0x81fd096c,0x25371429
	.word  0x75952193,0x89119f84,0x5f091e48,0x740b5677
	.word  0xe8df2332,0xd4912725,0x2f3c8974,0x8451e72a
	.word  0x26b953df,0x6006950e,0x3a049de7,0x2f6e42af
	.word  0xcb8791d9,0x487d1474,0xb612e9f9,0x66336ccf
	.word  0x4940c159,0xcf78eaed,0x45593367,0xa3319eec
	.word  0x958d14db,0xa556e506,0xcd5e8547,0xd12e1c75
	.word  0x4cafe711,0x69e56423,0x0566c03c,0xc54a0e83
	.word  0x13db79f0,0x89e52aa9,0x00907b73,0x06471ede
	.word  0xc0593d81,0x48397b0d,0x46f55f67,0xad709d1c
	.word  0xd6ddfe53,0xf1bdc71e,0x27a85243,0xb60d3a4d
	.word  0x9c70b8aa,0xb8101002,0x10de2863,0x3a71dd32
	.word  0xbc2a8b87,0xfffe03a9,0x977ab591,0x34dc2ff0
	.word  0x09537441,0x95055b70,0xa77b8f94,0x9640675f
	.word  0x94a72870,0x9fe98eec,0x8919c563,0xbfc82264
	.word  0xb0779846,0x8a409e12,0x7ce11216,0xedb5402f
	.word  0xe41c9af7,0x9967001b,0xcdf268a1,0xb19e4b74
	.word  0xef2602a0,0x13ea62b9,0xfaa8ed9a,0xe35532b0
	.word  0x5379be68,0x6bc3a9cd,0xd496222a,0xe8e331e4
	.word  0x10be54b4,0x8d76ac76,0xd17bbf47,0x9ccaf1e1
	.word  0x1b2e4d21,0xe3c371d9,0x9c6a6903,0x970b0b43
	.word  0x9bbb76c6,0x42b41ae2,0xbf174fe2,0x390fb896
	.word  0xa93dd2eb,0x06bf5d0b,0xa6eb61c6,0xa9913a96
	.word  0x128efcd3,0x8fe9d127,0xf53eaf7b,0x4b04c79f
	.word  0x23559707,0xab2baba3,0xae7c5391,0x754ea1d8
	.word  0x52cc0008,0x7a51a494,0x9d2e486e,0xef4d35a1
	.word  0x883d7a9b,0x0270fd2e,0x48333f41,0x3838a45b
	.word  0x2ad4824b,0x38de1005,0x62c14b91,0xee1ba94d
	.word  0x36cce650,0xb7756d00,0xe4bd1596,0x02a720f2
	.word  0xdefb6336,0x0a81b442,0x738d2c9d,0x65f0444b
	.word  0x6ea9a3e6,0xf39ab945,0xdc7c0fbd,0x20ab4095
	.word  0x20933099,0xe66ea435,0x74e10519,0x429b2fc6
	.word  0xd8279af8,0xa16a19d1,0x68f61cb1,0x301fdf48
	.word  0xfe7350c4,0x5de0d811,0x3aed4632,0x49131d18
	.word  0xcc67eff7,0x77551367,0xa8813c8c,0xa2f96a11
	.word  0xa63d0f8a,0x21ca9a30,0x45b51fb2,0xb4574111
	.word  0x023cf7ac,0xd1a3d02e,0xdacbb80e,0x0750953b
	.word  0x6b6af808,0x1a23b6fb,0xcdb6feda,0xc7165bfa
	.word  0x2545a319,0xdca4bcdc,0xf55a746f,0x2bef4fa5
	.word  0xc541386f,0x60c69ef9,0x0844564b,0x8f76bcc1
	.word  0x4d2b6b26,0x45b423a8,0xa9cd73f3,0x75c375e2
	.word  0xb2c33b64,0x7df5c470,0x44d80103,0xca225192
	.word  0x51eeb84f,0x3a8966d2,0x211c74ad,0x6a12b5e4
	.word  0x070a0221,0x482ff331,0x91f6d3f7,0x78335cc9
	.word  0x642d33d7,0x32c704e6,0xd6ae2f22,0x3cee8c40
	.word  0xb2162472,0xa83c208b,0xf48050bf,0xfe6ad01a
	.word  0x5d35f33c,0x66933513,0x3d8426e6,0x34a9cf9e
	.word  0x1c3420ee,0xd9e3136c,0x47bd0be0,0xe6587856
	.word  0xd7788aa7,0x015ee692,0x9a9fdff5,0x306d98e4
	.word  0xa8ca93d1,0xed9e1267,0x77a0be7f,0x42b69980
	.word  0x46a3e288,0x07e57aaa,0x9374176c,0xb6b56538
	.word  0xb7644b10,0x5ac9b435,0x33775ce9,0x0d6f6153
	.word  0xa8e260b2,0xe6255e66,0xeb225c0c,0x20b787c5
	.word  0x30cdf084,0x84309ac1,0x4ca99b10,0x2850786d
	.word  0x9ae4710b,0x8fd9a23f,0x15cd2b66,0x24bf9c2e
	.word  0xa239740f,0x789c661b,0xbd2ef2d3,0x45ce53f6
	.word  0xe3c5dff4,0x2dc14645,0x6b8e598f,0xee03d30b
	.word  0x25642405,0x8869aa84,0x24bd69c5,0x39d5deba
	.word  0x078c3cc7,0x5de08586,0x6ccb608f,0x75165536
	.word  0x45ac75bb,0x0ee5a066,0xcefc7734,0xad6ae5eb
	.word  0xa99d9092,0xf8103080,0xdcff57b7,0xc026d600
	.word  0xd875f26f,0xf9fc05cb,0x37a1a435,0xce5f3c8b
	.word  0xbe148c7a,0xbcfbf82a,0xbc7935e3,0x157005b2
	.word  0xae0820c9,0x179013cf,0xf0bbf0de,0x963eaafd
	.word  0x5d6bcb79,0x153fb8a0,0xadcac55e,0x1265ffc8
	.word  0x092051e2,0x70a20e60,0x4d19fd1d,0x591c10d1
	.word  0xd59b60ec,0x6d92ca4f,0x58defaa3,0x66f8d33d
	.word  0x35c7698a,0xc61c317e,0xfa64eef1,0x47a944ff
	.word  0xe381c8bd,0x867f949c,0xbd9f72ff,0xac257559
	.word  0x3f8bfd0c,0x04ab7984,0x8fd53576,0xb186ee67
	.word  0xf5c6d4a1,0xcd7a2fb1,0x0ed967d3,0xafd4d591
	.word  0x4e301dc6,0x36e0c0d4,0x9c606a6c,0x02ab6c6e
	.word  0x2b10525b,0xd6ac7933,0x5883b4c3,0x12f9e313
	.word  0x077fc2b2,0x57449af8,0xa2857eeb,0x29ceb0f3
	.word  0xe04c1447,0x85f295fe,0x5f11b8f4,0x2d0bbf6a
	.word  0x1d3deca2,0x92760ad7,0x75c19de6,0xce8cc355
	.word  0x4b28fde8,0x03c2e4be,0x51e998c0,0x4063bd46
	.word  0xba19bf5f,0xf441096f,0xace6fb28,0x6bbe37c8
	.word  0x531fc58c,0x71fb459c,0x90d7e91c,0xd2f2f8e0
	.word  0x72285aa9,0x8ae345de,0xfecfcf73,0x0672e7c5


