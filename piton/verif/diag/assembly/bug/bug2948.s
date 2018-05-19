// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: bug2948.s
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
   random seed:	473815917
   Jal stb_raw_1a.j:	
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
        setx  MAIN_BASE_DATA_VA, %r1, %r8
        setx  0x0000000000000dd0, %g1, %r9
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
        setx  0x433f041eb26f526e, %g1, %r0
        setx  0xb7a7775264677c29, %g1, %r1
        setx  0x69cc8728d77c1944, %g1, %r2
        setx  0x80d72a46197d2b67, %g1, %r3
        setx  0x995a5abf43fa899e, %g1, %r4
        setx  0x4605e04bec394ab3, %g1, %r5
        setx  0x96f513b3d1f3eaa3, %g1, %r6
        setx  0xdea05a436e2c8737, %g1, %r7
        setx  0xa37e00ef39ad62d1, %g1, %r10
        setx  0x60769bebe0912e43, %g1, %r11
        setx  0x714dc24cc57b1aac, %g1, %r12
        setx  0xe097fc0859d2e91c, %g1, %r13
        setx  0xb34e8c9c887f8dd4, %g1, %r14
        setx  0xc7daa1aa03d9f94a, %g1, %r15
        setx  0x67f2b9d3d76793a6, %g1, %r16
        setx  0xf2440916e548b801, %g1, %r17
        setx  0xdcfa67ee3de17f7e, %g1, %r18
        setx  0xcc9e89cfe6278bab, %g1, %r19
        setx  0x1933504f6b5d2098, %g1, %r20
        setx  0x26991119e3c57f9d, %g1, %r21
        setx  0x71a9cad6dfd8b10c, %g1, %r22
        setx  0x7fe0db5d60f34121, %g1, %r23
        setx  0x953d7f1f3fc9c1b1, %g1, %r24
        setx  0x0fb8a5452813196d, %g1, %r25
        setx  0x5b73e36a3329a9ed, %g1, %r26
        setx  0x27b609bee80a4932, %g1, %r27
        setx  0xe063ffddb52f3683, %g1, %r28
        setx  0x511ce819c6375957, %g1, %r29
        setx  0x6bd8fa0443388a5f, %g1, %r30
        setx  0x7304ac2cd5a8afd1, %g1, %r31
	.word 0xe4220009  ! 3: STW_R	stw	%r18, [%r8 + %r9]
	.word 0xc31a0009  ! 3: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0x2a800002  ! 3: BCS	bcs,a	<label_0x2>
	.word 0xd62a0009  ! 6: STB_R	stb	%r11, [%r8 + %r9]
	.word 0xce020009  ! 6: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0x16800002  ! 6: BGE	bge  	<label_0x2>
	.word 0xe3220009  ! 9: STF_R	st	%f17, [%r9, %r8]
	.word 0xec020009  ! 9: LDUW_R	lduw	[%r8 + %r9], %r22
	.word 0xc67a0009  ! 9: SWAP_R	swap	%r3, [%r8 + %r9]
	.word 0xc9220009  ! 12: STF_R	st	%f4, [%r9, %r8]
	.word 0xcf1a0009  ! 12: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0x9c5a0009  ! 12: SMUL_R	smul 	%r8, %r9, %r14
	.word 0xf8320009  ! 15: STH_R	sth	%r28, [%r8 + %r9]
	.word 0xc9020009  ! 15: LDF_R	ld	[%r8, %r9], %f4
	.word 0x8e6a2274  ! 15: UDIVX_I	udivx 	%r8, 0x0274, %r7
	.word 0xc73a0009  ! 18: STDF_R	std	%f3, [%r9, %r8]
	.word 0xce020009  ! 18: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0x0c800001  ! 18: BNEG	bneg  	<label_0x1>
	.word 0xc82a0009  ! 21: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xdc020009  ! 21: LDUW_R	lduw	[%r8 + %r9], %r14
	.word 0xc2f22410  ! 21: STXA_I	stxa	%r1, [%r8 + 0x0410] %asi
	.word 0xc22a0009  ! 24: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc2420009  ! 24: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xc8a21009  ! 24: STWA_R	stwa	%r4, [%r8 + %r9] 0x80
	.word 0xc7220009  ! 27: STF_R	st	%f3, [%r9, %r8]
	.word 0xc51a0009  ! 27: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xc66a21b4  ! 27: LDSTUB_I	ldstub	%r3, [%r8 + 0x01b4]
	.word 0xce220009  ! 30: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc91a0009  ! 30: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0x896a0009  ! 30: SDIVX_R	sdivx	%r8, %r9, %r4
	.word 0xc33a0009  ! 33: STDF_R	std	%f1, [%r9, %r8]
	.word 0xca120009  ! 33: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0x8a4a0009  ! 33: MULX_R	mulx 	%r8, %r9, %r5
	.word 0xc9220009  ! 36: STF_R	st	%f4, [%r9, %r8]
	.word 0xc31a0009  ! 36: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xc3ea268c  ! 36: PREFETCHA_I	prefetcha	[%r8, + 0x068c] %asi, #one_read
	.word 0xce2a0009  ! 39: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc3020009  ! 39: LDF_R	ld	[%r8, %r9], %f1
	.word 0xc60a2738  ! 39: LDUB_I	ldub	[%r8 + 0x0738], %r3
	.word 0xfe720009  ! 42: STX_R	stx	%r31, [%r8 + %r9]
	.word 0xe80a0009  ! 42: LDUB_R	ldub	[%r8 + %r9], %r20
	.word 0xc8ea1009  ! 42: LDSTUBA_R	ldstuba	%r4, [%r8 + %r9] 0x80
	.word 0xc8320009  ! 45: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xd91a0009  ! 45: LDDF_R	ldd	[%r8, %r9], %f12
	.word 0xccf21009  ! 45: STXA_R	stxa	%r6, [%r8 + %r9] 0x80
	.word 0xcd220009  ! 48: STF_R	st	%f6, [%r9, %r8]
	.word 0xcf1a0009  ! 48: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xc2d22480  ! 48: LDSHA_I	ldsha	[%r8, + 0x0480] %asi, %r1
	.word 0xe73a0009  ! 51: STDF_R	std	%f19, [%r9, %r8]
	.word 0xc5020009  ! 51: LDF_R	ld	[%r8, %r9], %f2
	.word 0x887220b8  ! 51: UDIV_I	udiv 	%r8, 0x00b8, %r4
	.word 0xce720009  ! 54: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xfa520009  ! 54: LDSH_R	ldsh	[%r8 + %r9], %r29
	.word 0xf2d22ee8  ! 54: LDSHA_I	ldsha	[%r8, + 0x0ee8] %asi, %r25
	.word 0xc62a0009  ! 57: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xcc5a0009  ! 57: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xccba1009  ! 57: STDA_R	stda	%r6, [%r8 + %r9] 0x80
	.word 0xc5220009  ! 60: STF_R	st	%f2, [%r9, %r8]
	.word 0xcc4a0009  ! 60: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xfc020009  ! 60: LDUW_R	lduw	[%r8 + %r9], %r30
	.word 0xfb3a0009  ! 63: STDF_R	std	%f29, [%r9, %r8]
	.word 0xc9020009  ! 63: LDF_R	ld	[%r8, %r9], %f4
	.word 0x2e800002  ! 63: BVS	bvs,a	<label_0x2>
	.word 0xc8320009  ! 66: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc91a0009  ! 66: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0x8ad20009  ! 66: UMULcc_R	umulcc 	%r8, %r9, %r5
	.word 0xe6320009  ! 69: STH_R	sth	%r19, [%r8 + %r9]
	.word 0xc84a0009  ! 69: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xc6422d94  ! 69: LDSW_I	ldsw	[%r8 + 0x0d94], %r3
	.word 0xcc320009  ! 72: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xde5a0009  ! 72: LDX_R	ldx	[%r8 + %r9], %r15
	.word 0xc3ea1009  ! 72: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc4720009  ! 75: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xd8420009  ! 75: LDSW_R	ldsw	[%r8 + %r9], %r12
	.word 0xc4d2270c  ! 75: LDSHA_I	ldsha	[%r8, + 0x070c] %asi, %r2
	.word 0xcf3a0009  ! 78: STDF_R	std	%f7, [%r9, %r8]
	.word 0xce4a0009  ! 78: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0x8143c000  ! 78: STBAR	stbar
	.word 0xc53a0009  ! 81: STDF_R	std	%f2, [%r9, %r8]
	.word 0xcc120009  ! 81: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0x8143e07a  ! 81: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xde320009  ! 84: STH_R	sth	%r15, [%r8 + %r9]
	.word 0xe6520009  ! 84: LDSH_R	ldsh	[%r8 + %r9], %r19
	.word 0xc702261c  ! 84: LDF_I	ld	[%r8, 0x061c], %f3
	.word 0xc9220009  ! 87: STF_R	st	%f4, [%r9, %r8]
	.word 0xe31a0009  ! 87: LDDF_R	ldd	[%r8, %r9], %f17
	.word 0xde420009  ! 87: LDSW_R	ldsw	[%r8 + %r9], %r15
	.word 0xc2220009  ! 90: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xcc5a0009  ! 90: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xc9222a78  ! 90: STF_I	st	%f4, [0x0a78, %r8]
	.word 0xc5220009  ! 93: STF_R	st	%f2, [%r9, %r8]
	.word 0xcc0a0009  ! 93: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xc4ba1009  ! 93: STDA_R	stda	%r2, [%r8 + %r9] 0x80
	.word 0xdb220009  ! 96: STF_R	st	%f13, [%r9, %r8]
	.word 0xc2020009  ! 96: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0x30800001  ! 96: BA	ba,a	<label_0x1>
	.word 0xf3220009  ! 99: STF_R	st	%f25, [%r9, %r8]
	.word 0xc6520009  ! 99: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xcd222a98  ! 99: STF_I	st	%f6, [0x0a98, %r8]
	.word 0xf8220009  ! 102: STW_R	stw	%r28, [%r8 + %r9]
	.word 0xc85a0009  ! 102: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xcab22510  ! 102: STHA_I	stha	%r5, [%r8 + 0x0510] %asi
	.word 0xc42a0009  ! 105: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xde4a0009  ! 105: LDSB_R	ldsb	[%r8 + %r9], %r15
	.word 0xa0fa2100  ! 105: SDIVcc_I	sdivcc 	%r8, 0x0100, %r16
	.word 0xce320009  ! 108: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xca5a0009  ! 108: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0x8143c000  ! 108: STBAR	stbar
	.word 0xfa2a0009  ! 111: STB_R	stb	%r29, [%r8 + %r9]
	.word 0xcc520009  ! 111: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xcbe21009  ! 111: CASA_I	casa	[%r8] 0x80, %r9, %r5
	.word 0xfe2a0009  ! 114: STB_R	stb	%r31, [%r8 + %r9]
	.word 0xc8120009  ! 114: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xfd222a30  ! 114: STF_I	st	%f30, [0x0a30, %r8]
	.word 0xcc2a0009  ! 117: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xd65a0009  ! 117: LDX_R	ldx	[%r8 + %r9], %r11
	.word 0xc8ba2ba8  ! 117: STDA_I	stda	%r4, [%r8 + 0x0ba8] %asi
	.word 0xc42a0009  ! 120: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc85a0009  ! 120: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xc0ba29a8  ! 120: STDA_I	stda	%r0, [%r8 + 0x09a8] %asi
	.word 0xfe2a0009  ! 123: STB_R	stb	%r31, [%r8 + %r9]
	.word 0xff1a0009  ! 123: LDDF_R	ldd	[%r8, %r9], %f31
	.word 0xf3e22009  ! 123: CASA_R	casa	[%r8] %asi, %r9, %r25
	.word 0xe0220009  ! 126: STW_R	stw	%r16, [%r8 + %r9]
	.word 0xc80a0009  ! 126: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0x8143e04f  ! 126: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #Sync 
	.word 0xc73a0009  ! 129: STDF_R	std	%f3, [%r9, %r8]
	.word 0xde0a0009  ! 129: LDUB_R	ldub	[%r8 + %r9], %r15
	.word 0xc3ea1009  ! 129: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xe22a0009  ! 132: STB_R	stb	%r17, [%r8 + %r9]
	.word 0xee4a0009  ! 132: LDSB_R	ldsb	[%r8 + %r9], %r23
	.word 0xbda208a9  ! 132: FSUBs	fsubs	%f8, %f9, %f30
	.word 0xc2220009  ! 135: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xcf020009  ! 135: LDF_R	ld	[%r8, %r9], %f7
	.word 0x83a20829  ! 135: FADDs	fadds	%f8, %f9, %f1
	.word 0xc22a0009  ! 138: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xea5a0009  ! 138: LDX_R	ldx	[%r8 + %r9], %r21
	.word 0xceea1009  ! 138: LDSTUBA_R	ldstuba	%r7, [%r8 + %r9] 0x80
	.word 0xfa320009  ! 141: STH_R	sth	%r29, [%r8 + %r9]
	.word 0xca5a0009  ! 141: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0x8143c000  ! 141: STBAR	stbar
	.word 0xf33a0009  ! 144: STDF_R	std	%f25, [%r9, %r8]
	.word 0xca4a0009  ! 144: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xc41a2168  ! 144: LDD_I	ldd	[%r8 + 0x0168], %r2
	.word 0xc42a0009  ! 147: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xd71a0009  ! 147: LDDF_R	ldd	[%r8, %r9], %f11
	.word 0xceca1009  ! 147: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r7
	.word 0xc82a0009  ! 150: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc44a0009  ! 150: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0x8a722ec4  ! 150: UDIV_I	udiv 	%r8, 0x0ec4, %r5
	.word 0xdc2a0009  ! 153: STB_R	stb	%r14, [%r8 + %r9]
	.word 0xcc520009  ! 153: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xca0a0009  ! 153: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xc8320009  ! 156: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc64a0009  ! 156: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0x82fa2048  ! 156: SDIVcc_I	sdivcc 	%r8, 0x0048, %r1
	.word 0xfe2a0009  ! 159: STB_R	stb	%r31, [%r8 + %r9]
	.word 0xc4020009  ! 159: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xecba1009  ! 159: STDA_R	stda	%r22, [%r8 + %r9] 0x80
	.word 0xf2220009  ! 162: STW_R	stw	%r25, [%r8 + %r9]
	.word 0xc2520009  ! 162: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xb4da0009  ! 162: SMULcc_R	smulcc 	%r8, %r9, %r26
	.word 0xc2320009  ! 165: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xf2520009  ! 165: LDSH_R	ldsh	[%r8 + %r9], %r25
	.word 0xfa520009  ! 165: LDSH_R	ldsh	[%r8 + %r9], %r29
	.word 0xc42a0009  ! 168: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xdf1a0009  ! 168: LDDF_R	ldd	[%r8, %r9], %f15
	.word 0x8a7a0009  ! 168: SDIV_R	sdiv 	%r8, %r9, %r5
	.word 0xcd3a0009  ! 171: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc91a0009  ! 171: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0x83a20829  ! 171: FADDs	fadds	%f8, %f9, %f1
	.word 0xce220009  ! 174: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc3020009  ! 174: LDF_R	ld	[%r8, %r9], %f1
	.word 0xcd220009  ! 174: STF_R	st	%f6, [%r9, %r8]
	.word 0xda2a0009  ! 177: STB_R	stb	%r13, [%r8 + %r9]
	.word 0xd84a0009  ! 177: LDSB_R	ldsb	[%r8 + %r9], %r12
	.word 0xc6f21009  ! 177: STXA_R	stxa	%r3, [%r8 + %r9] 0x80
	.word 0xc8720009  ! 180: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xce020009  ! 180: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xf06a0009  ! 180: LDSTUB_R	ldstub	%r24, [%r8 + %r9]
	.word 0xc4720009  ! 183: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc20a0009  ! 183: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xe6422c20  ! 183: LDSW_I	ldsw	[%r8 + 0x0c20], %r19
	.word 0xca220009  ! 186: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc91a0009  ! 186: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xc3ea1009  ! 186: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xcd3a0009  ! 189: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc44a0009  ! 189: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0x2c800001  ! 189: BNEG	bneg,a	<label_0x1>
	.word 0xde720009  ! 192: STX_R	stx	%r15, [%r8 + %r9]
	.word 0xe0020009  ! 192: LDUW_R	lduw	[%r8 + %r9], %r16
	.word 0xc9220009  ! 192: STF_R	st	%f4, [%r9, %r8]
	.word 0xc2320009  ! 195: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc4420009  ! 195: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xc8122f70  ! 195: LDUH_I	lduh	[%r8 + 0x0f70], %r4
	.word 0xfa720009  ! 198: STX_R	stx	%r29, [%r8 + %r9]
	.word 0xcc020009  ! 198: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xc73a26c0  ! 198: STDF_I	std	%f3, [0x06c0, %r8]
	.word 0xf2220009  ! 201: STW_R	stw	%r25, [%r8 + %r9]
	.word 0xc3020009  ! 201: LDF_R	ld	[%r8, %r9], %f1
	.word 0x86fa0009  ! 201: SDIVcc_R	sdivcc 	%r8, %r9, %r3
	.word 0xce220009  ! 204: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc44a0009  ! 204: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0x8efa2d78  ! 204: SDIVcc_I	sdivcc 	%r8, 0x0d78, %r7
	.word 0xc7220009  ! 207: STF_R	st	%f3, [%r9, %r8]
	.word 0xf0520009  ! 207: LDSH_R	ldsh	[%r8 + %r9], %r24
	.word 0x82f22670  ! 207: UDIVcc_I	udivcc 	%r8, 0x0670, %r1
	.word 0xfc720009  ! 210: STX_R	stx	%r30, [%r8 + %r9]
	.word 0xcf020009  ! 210: LDF_R	ld	[%r8, %r9], %f7
	.word 0xc36a26a0  ! 210: PREFETCH_I	prefetch	[%r8 + 0x06a0], #one_read
	.word 0xfe320009  ! 213: STH_R	sth	%r31, [%r8 + %r9]
	.word 0xcd020009  ! 213: LDF_R	ld	[%r8, %r9], %f6
	.word 0xa6520009  ! 213: UMUL_R	umul 	%r8, %r9, %r19
	.word 0xc82a0009  ! 216: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xca4a0009  ! 216: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0x0eca0001  ! 216: BRGEZ	brgez  ,pt	%8,<label_0xa0001>
	.word 0xce720009  ! 219: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xca4a0009  ! 219: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xd73a0009  ! 219: STDF_R	std	%f11, [%r9, %r8]
	.word 0xe42a0009  ! 222: STB_R	stb	%r18, [%r8 + %r9]
	.word 0xca020009  ! 222: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0x8ad20009  ! 222: UMULcc_R	umulcc 	%r8, %r9, %r5
	.word 0xc2320009  ! 225: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xe00a0009  ! 225: LDUB_R	ldub	[%r8 + %r9], %r16
	.word 0xa5a209a9  ! 225: FDIVs	fdivs	%f8, %f9, %f18
	.word 0xc22a0009  ! 228: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc60a0009  ! 228: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xa7a20929  ! 228: FMULs	fmuls	%f8, %f9, %f19
	.word 0xc8220009  ! 231: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xfe420009  ! 231: LDSW_R	ldsw	[%r8 + %r9], %r31
	.word 0xa7a209a9  ! 231: FDIVs	fdivs	%f8, %f9, %f19
	.word 0xcf220009  ! 234: STF_R	st	%f7, [%r9, %r8]
	.word 0xce0a0009  ! 234: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xe53a0009  ! 234: STDF_R	std	%f18, [%r9, %r8]
	.word 0xce320009  ! 237: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xcb1a0009  ! 237: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xaeda0009  ! 237: SMULcc_R	smulcc 	%r8, %r9, %r23
	.word 0xe6320009  ! 240: STH_R	sth	%r19, [%r8 + %r9]
	.word 0xe64a0009  ! 240: LDSB_R	ldsb	[%r8 + %r9], %r19
	.word 0xc8f21009  ! 240: STXA_R	stxa	%r4, [%r8 + %r9] 0x80
	.word 0xcb3a0009  ! 243: STDF_R	std	%f5, [%r9, %r8]
	.word 0xc60a0009  ! 243: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xceda2550  ! 243: LDXA_I	ldxa	[%r8, + 0x0550] %asi, %r7
	.word 0xe5220009  ! 246: STF_R	st	%f18, [%r9, %r8]
	.word 0xc4020009  ! 246: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xf4020009  ! 246: LDUW_R	lduw	[%r8 + %r9], %r26
	.word 0xc33a0009  ! 249: STDF_R	std	%f1, [%r9, %r8]
	.word 0xfb1a0009  ! 249: LDDF_R	ldd	[%r8, %r9], %f29
	.word 0xc2a22ad0  ! 249: STWA_I	stwa	%r1, [%r8 + 0x0ad0] %asi
	.word 0xd6220009  ! 252: STW_R	stw	%r11, [%r8 + %r9]
	.word 0xcc5a0009  ! 252: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0x8143e023  ! 252: MEMBAR	membar	#LoadLoad | #StoreLoad | #MemIssue 
	.word 0xdd220009  ! 255: STF_R	st	%f14, [%r9, %r8]
	.word 0xcc420009  ! 255: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0x846a2a3c  ! 255: UDIVX_I	udivx 	%r8, 0x0a3c, %r2
	.word 0xcb220009  ! 258: STF_R	st	%f5, [%r9, %r8]
	.word 0xcb1a0009  ! 258: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xc4022ee0  ! 258: LDUW_I	lduw	[%r8 + 0x0ee0], %r2
	.word 0xce320009  ! 261: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc8520009  ! 261: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0x8143c000  ! 261: STBAR	stbar
	.word 0xce320009  ! 264: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xcf020009  ! 264: LDF_R	ld	[%r8, %r9], %f7
	.word 0xacda0009  ! 264: SMULcc_R	smulcc 	%r8, %r9, %r22
	.word 0xd62a0009  ! 267: STB_R	stb	%r11, [%r8 + %r9]
	.word 0xc31a0009  ! 267: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0x2a800001  ! 267: BCS	bcs,a	<label_0x1>
	.word 0xd6720009  ! 270: STX_R	stx	%r11, [%r8 + %r9]
	.word 0xc65a0009  ! 270: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xc7f21009  ! 270: CASXA_I	casxa	[%r8] 0x80, %r9, %r3
	.word 0xdf220009  ! 273: STF_R	st	%f15, [%r9, %r8]
	.word 0xc60a0009  ! 273: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xe8f21009  ! 273: STXA_R	stxa	%r20, [%r8 + %r9] 0x80
	.word 0xca720009  ! 276: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xdf1a0009  ! 276: LDDF_R	ldd	[%r8, %r9], %f15
	.word 0x8143c000  ! 276: STBAR	stbar
	.word 0xca320009  ! 279: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xf24a0009  ! 279: LDSB_R	ldsb	[%r8 + %r9], %r25
	.word 0xc60228e8  ! 279: LDUW_I	lduw	[%r8 + 0x08e8], %r3
	.word 0xf33a0009  ! 282: STDF_R	std	%f25, [%r9, %r8]
	.word 0xe0120009  ! 282: LDUH_R	lduh	[%r8 + %r9], %r16
	.word 0xc6822128  ! 282: LDUWA_I	lduwa	[%r8, + 0x0128] %asi, %r3
	.word 0xc93a0009  ! 285: STDF_R	std	%f4, [%r9, %r8]
	.word 0xca4a0009  ! 285: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xc8b22258  ! 285: STHA_I	stha	%r4, [%r8 + 0x0258] %asi
	.word 0xcc320009  ! 288: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc44a0009  ! 288: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0x8d222ff0  ! 288: MULScc_I	mulscc 	%r8, 0x0ff0, %r6
	.word 0xc5220009  ! 291: STF_R	st	%f2, [%r9, %r8]
	.word 0xe20a0009  ! 291: LDUB_R	ldub	[%r8 + %r9], %r17
	.word 0x876a0009  ! 291: SDIVX_R	sdivx	%r8, %r9, %r3
	.word 0xcc2a0009  ! 294: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xfc020009  ! 294: LDUW_R	lduw	[%r8 + %r9], %r30
	.word 0x82da0009  ! 294: SMULcc_R	smulcc 	%r8, %r9, %r1
	.word 0xe2320009  ! 297: STH_R	sth	%r17, [%r8 + %r9]
	.word 0xcc020009  ! 297: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0x8143c000  ! 297: STBAR	stbar
	.word 0xc33a0009  ! 300: STDF_R	std	%f1, [%r9, %r8]
	.word 0xca5a0009  ! 300: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0x3c800001  ! 300: BPOS	bpos,a	<label_0x1>
	.word 0xee2a0009  ! 303: STB_R	stb	%r23, [%r8 + %r9]
	.word 0xc65a0009  ! 303: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0x8143c000  ! 303: STBAR	stbar
	.word 0xcf3a0009  ! 306: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc44a0009  ! 306: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xa5220009  ! 306: MULScc_R	mulscc 	%r8, %r9, %r18
	.word 0xcc2a0009  ! 309: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc20a0009  ! 309: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xc7f22009  ! 309: CASXA_R	casxa	[%r8]%asi, %r9, %r3
	.word 0xc9220009  ! 312: STF_R	st	%f4, [%r9, %r8]
	.word 0xc6420009  ! 312: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xca822528  ! 312: LDUWA_I	lduwa	[%r8, + 0x0528] %asi, %r5
	.word 0xc8720009  ! 315: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc4120009  ! 315: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0x00800001  ! 315: BN	bn  	<label_0x1>
	.word 0xc2720009  ! 318: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xf3020009  ! 318: LDF_R	ld	[%r8, %r9], %f25
	.word 0x3c800001  ! 318: BPOS	bpos,a	<label_0x1>
	.word 0xe22a0009  ! 321: STB_R	stb	%r17, [%r8 + %r9]
	.word 0xc4420009  ! 321: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0x24800001  ! 321: BLE	ble,a	<label_0x1>
	.word 0xc33a0009  ! 324: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc8520009  ! 324: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xe2022374  ! 324: LDUW_I	lduw	[%r8 + 0x0374], %r17
	.word 0xcc220009  ! 327: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc51a0009  ! 327: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0x8da209a9  ! 327: FDIVs	fdivs	%f8, %f9, %f6
	.word 0xcc720009  ! 330: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xfe4a0009  ! 330: LDSB_R	ldsb	[%r8 + %r9], %r31
	.word 0xb92228b0  ! 330: MULScc_I	mulscc 	%r8, 0x08b0, %r28
	.word 0xf6320009  ! 333: STH_R	sth	%r27, [%r8 + %r9]
	.word 0xc4020009  ! 333: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0x85a20929  ! 333: FMULs	fmuls	%f8, %f9, %f2
	.word 0xc93a0009  ! 336: STDF_R	std	%f4, [%r9, %r8]
	.word 0xfc020009  ! 336: LDUW_R	lduw	[%r8 + %r9], %r30
	.word 0xa9a20829  ! 336: FADDs	fadds	%f8, %f9, %f20
	.word 0xc8220009  ! 339: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc80a0009  ! 339: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xc2a21009  ! 339: STWA_R	stwa	%r1, [%r8 + %r9] 0x80
	.word 0xde720009  ! 342: STX_R	stx	%r15, [%r8 + %r9]
	.word 0xe4120009  ! 342: LDUH_R	lduh	[%r8 + %r9], %r18
	.word 0xf4520009  ! 342: LDSH_R	ldsh	[%r8 + %r9], %r26
	.word 0xe1220009  ! 345: STF_R	st	%f16, [%r9, %r8]
	.word 0xcc120009  ! 345: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xc36a2254  ! 345: PREFETCH_I	prefetch	[%r8 + 0x0254], #one_read
	.word 0xc42a0009  ! 348: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xd6520009  ! 348: LDSH_R	ldsh	[%r8 + %r9], %r11
	.word 0x8143c000  ! 348: STBAR	stbar
	.word 0xf8320009  ! 351: STH_R	sth	%r28, [%r8 + %r9]
	.word 0xee120009  ! 351: LDUH_R	lduh	[%r8 + %r9], %r23
	.word 0x9ba20829  ! 351: FADDs	fadds	%f8, %f9, %f13
	.word 0xcc220009  ! 354: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xcc5a0009  ! 354: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xcada1009  ! 354: LDXA_R	ldxa	[%r8, %r9] 0x80, %r5
	.word 0xcb220009  ! 357: STF_R	st	%f5, [%r9, %r8]
	.word 0xc91a0009  ! 357: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0x3a800001  ! 357: BCC	bcc,a	<label_0x1>
	.word 0xc4720009  ! 360: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xe11a0009  ! 360: LDDF_R	ldd	[%r8, %r9], %f16
	.word 0x12800001  ! 360: BNE	bne  	<label_0x1>
	.word 0xfd3a0009  ! 363: STDF_R	std	%f30, [%r9, %r8]
	.word 0xc6020009  ! 363: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xd6ca29e0  ! 363: LDSBA_I	ldsba	[%r8, + 0x09e0] %asi, %r11
	.word 0xd8720009  ! 366: STX_R	stx	%r12, [%r8 + %r9]
	.word 0xc80a0009  ! 366: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xc36a28e4  ! 366: PREFETCH_I	prefetch	[%r8 + 0x08e4], #one_read
	.word 0xce320009  ! 369: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xf2520009  ! 369: LDSH_R	ldsh	[%r8 + %r9], %r25
	.word 0x3e800001  ! 369: BVC	bvc,a	<label_0x1>
	.word 0xc7220009  ! 372: STF_R	st	%f3, [%r9, %r8]
	.word 0xfe5a0009  ! 372: LDX_R	ldx	[%r8 + %r9], %r31
	.word 0x8143e058  ! 372: MEMBAR	membar	#StoreStore | #Lookaside | #Sync 
	.word 0xca2a0009  ! 375: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc4520009  ! 375: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0x8ba20929  ! 375: FMULs	fmuls	%f8, %f9, %f5
	.word 0xce720009  ! 378: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xf9020009  ! 378: LDF_R	ld	[%r8, %r9], %f28
	.word 0x88720009  ! 378: UDIV_R	udiv 	%r8, %r9, %r4
	.word 0xca220009  ! 381: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xca0a0009  ! 381: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0x8c522d34  ! 381: UMUL_I	umul 	%r8, 0x0d34, %r6
	.word 0xca720009  ! 384: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xf4520009  ! 384: LDSH_R	ldsh	[%r8 + %r9], %r26
	.word 0x8143e004  ! 384: MEMBAR	membar	#LoadStore 
	.word 0xc62a0009  ! 387: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xcd1a0009  ! 387: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0x8143c000  ! 387: STBAR	stbar
	.word 0xcc2a0009  ! 390: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xcc5a0009  ! 390: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0x8f222000  ! 390: MULScc_I	mulscc 	%r8, 0x0000, %r7
	.word 0xd9220009  ! 393: STF_R	st	%f12, [%r9, %r8]
	.word 0xcb1a0009  ! 393: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0x04c20001  ! 393: BRLEZ	brlez  ,nt	%8,<label_0x20001>
	.word 0xcc220009  ! 396: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xce420009  ! 396: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xeb3a0009  ! 396: STDF_R	std	%f21, [%r9, %r8]
	.word 0xde320009  ! 399: STH_R	sth	%r15, [%r8 + %r9]
	.word 0xcc420009  ! 399: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0x8143c000  ! 399: STBAR	stbar
	.word 0xce320009  ! 402: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xce020009  ! 402: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0x826a20ac  ! 402: UDIVX_I	udivx 	%r8, 0x00ac, %r1
	.word 0xf0720009  ! 405: STX_R	stx	%r24, [%r8 + %r9]
	.word 0xf51a0009  ! 405: LDDF_R	ldd	[%r8, %r9], %f26
	.word 0xc93a0009  ! 405: STDF_R	std	%f4, [%r9, %r8]
	.word 0xca720009  ! 408: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc45a0009  ! 408: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0x9ba20929  ! 408: FMULs	fmuls	%f8, %f9, %f13
	.word 0xc53a0009  ! 411: STDF_R	std	%f2, [%r9, %r8]
	.word 0xcc520009  ! 411: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0x8143e052  ! 411: MEMBAR	membar	#StoreLoad | #Lookaside | #Sync 
	.word 0xce220009  ! 414: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xe04a0009  ! 414: LDSB_R	ldsb	[%r8 + %r9], %r16
	.word 0xb84a2c30  ! 414: MULX_I	mulx 	%r8, 0x0c30, %r28
	.word 0xdc220009  ! 417: STW_R	stw	%r14, [%r8 + %r9]
	.word 0xc3020009  ! 417: LDF_R	ld	[%r8, %r9], %f1
	.word 0xdcca2454  ! 417: LDSBA_I	ldsba	[%r8, + 0x0454] %asi, %r14
	.word 0xc7220009  ! 420: STF_R	st	%f3, [%r9, %r8]
	.word 0xf25a0009  ! 420: LDX_R	ldx	[%r8 + %r9], %r25
	.word 0xc36a26fc  ! 420: PREFETCH_I	prefetch	[%r8 + 0x06fc], #one_read
	.word 0xc33a0009  ! 423: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc24a0009  ! 423: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xc6ea1009  ! 423: LDSTUBA_R	ldstuba	%r3, [%r8 + %r9] 0x80
	.word 0xc4320009  ! 426: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc7020009  ! 426: LDF_R	ld	[%r8, %r9], %f3
	.word 0xc3ea241c  ! 426: PREFETCHA_I	prefetcha	[%r8, + 0x041c] %asi, #one_read
	.word 0xc3220009  ! 429: STF_R	st	%f1, [%r9, %r8]
	.word 0xcc520009  ! 429: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0x84da2b50  ! 429: SMULcc_I	smulcc 	%r8, 0x0b50, %r2
	.word 0xc6720009  ! 432: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc5020009  ! 432: LDF_R	ld	[%r8, %r9], %f2
	.word 0xc36a2bb8  ! 432: PREFETCH_I	prefetch	[%r8 + 0x0bb8], #one_read
	.word 0xe4720009  ! 435: STX_R	stx	%r18, [%r8 + %r9]
	.word 0xcf020009  ! 435: LDF_R	ld	[%r8, %r9], %f7
	.word 0xc3ea1009  ! 435: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xf6220009  ! 438: STW_R	stw	%r27, [%r8 + %r9]
	.word 0xc60a0009  ! 438: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0x3e800002  ! 438: BVC	bvc,a	<label_0x2>
	.word 0xcc320009  ! 441: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xfa420009  ! 441: LDSW_R	ldsw	[%r8 + %r9], %r29
	.word 0xe0b22a28  ! 441: STHA_I	stha	%r16, [%r8 + 0x0a28] %asi
	.word 0xd62a0009  ! 444: STB_R	stb	%r11, [%r8 + %r9]
	.word 0xc51a0009  ! 444: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0x8ad20009  ! 444: UMULcc_R	umulcc 	%r8, %r9, %r5
	.word 0xf53a0009  ! 447: STDF_R	std	%f26, [%r9, %r8]
	.word 0xca0a0009  ! 447: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xe04a29ec  ! 447: LDSB_I	ldsb	[%r8 + 0x09ec], %r16
	.word 0xc5220009  ! 450: STF_R	st	%f2, [%r9, %r8]
	.word 0xc6120009  ! 450: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xc4d21009  ! 450: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r2
	.word 0xd6720009  ! 453: STX_R	stx	%r11, [%r8 + %r9]
	.word 0xc8420009  ! 453: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0x8143e029  ! 453: MEMBAR	membar	#LoadLoad | #StoreStore | #MemIssue 
	.word 0xce2a0009  ! 456: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xea0a0009  ! 456: LDUB_R	ldub	[%r8 + %r9], %r21
	.word 0xceda2498  ! 456: LDXA_I	ldxa	[%r8, + 0x0498] %asi, %r7
	.word 0xca320009  ! 459: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc3020009  ! 459: LDF_R	ld	[%r8, %r9], %f1
	.word 0x8a4a0009  ! 459: MULX_R	mulx 	%r8, %r9, %r5
	.word 0xc8720009  ! 462: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc5020009  ! 462: LDF_R	ld	[%r8, %r9], %f2
	.word 0xb24a0009  ! 462: MULX_R	mulx 	%r8, %r9, %r25
	.word 0xda720009  ! 465: STX_R	stx	%r13, [%r8 + %r9]
	.word 0xef020009  ! 465: LDF_R	ld	[%r8, %r9], %f23
	.word 0xe45a27a8  ! 465: LDX_I	ldx	[%r8 + 0x07a8], %r18
	.word 0xc7220009  ! 468: STF_R	st	%f3, [%r9, %r8]
	.word 0xcb1a0009  ! 468: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0x8ba20929  ! 468: FMULs	fmuls	%f8, %f9, %f5
	.word 0xc42a0009  ! 471: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xcc020009  ! 471: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0x8fa20929  ! 471: FMULs	fmuls	%f8, %f9, %f7
	.word 0xc8220009  ! 474: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc8520009  ! 474: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xcf1a22d0  ! 474: LDDF_I	ldd	[%r8, 0x02d0], %f7
	.word 0xce220009  ! 477: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xca120009  ! 477: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xdc4226b0  ! 477: LDSW_I	ldsw	[%r8 + 0x06b0], %r14
	.word 0xc4320009  ! 480: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc9020009  ! 480: LDF_R	ld	[%r8, %r9], %f4
	.word 0xcc0226d8  ! 480: LDUW_I	lduw	[%r8 + 0x06d8], %r6
	.word 0xcf220009  ! 483: STF_R	st	%f7, [%r9, %r8]
	.word 0xcc5a0009  ! 483: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0x0eca0001  ! 483: BRGEZ	brgez  ,pt	%8,<label_0xa0001>
	.word 0xc7220009  ! 486: STF_R	st	%f3, [%r9, %r8]
	.word 0xfb1a0009  ! 486: LDDF_R	ldd	[%r8, %r9], %f29
	.word 0xce7a0009  ! 486: SWAP_R	swap	%r7, [%r8 + %r9]
	.word 0xc9220009  ! 489: STF_R	st	%f4, [%r9, %r8]
	.word 0xd60a0009  ! 489: LDUB_R	ldub	[%r8 + %r9], %r11
	.word 0x8143e01a  ! 489: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside 
	.word 0xc4220009  ! 492: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xe2120009  ! 492: LDUH_R	lduh	[%r8 + %r9], %r17
	.word 0x9e4a2b20  ! 492: MULX_I	mulx 	%r8, 0x0b20, %r15
	.word 0xc6720009  ! 495: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xcc020009  ! 495: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xa6722c28  ! 495: UDIV_I	udiv 	%r8, 0x0c28, %r19
	.word 0xca320009  ! 498: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xfc120009  ! 498: LDUH_R	lduh	[%r8 + %r9], %r30
	.word 0xdbf21009  ! 498: CASXA_I	casxa	[%r8] 0x80, %r9, %r13
	.word 0xc8220009  ! 501: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xf4420009  ! 501: LDSW_R	ldsw	[%r8 + %r9], %r26
	.word 0x24800001  ! 501: BLE	ble,a	<label_0x1>
	.word 0xea320009  ! 504: STH_R	sth	%r21, [%r8 + %r9]
	.word 0xf85a0009  ! 504: LDX_R	ldx	[%r8 + %r9], %r28
	.word 0xf8b2258c  ! 504: STHA_I	stha	%r28, [%r8 + 0x058c] %asi
	.word 0xc2720009  ! 507: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xca420009  ! 507: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xceea2d3c  ! 507: LDSTUBA_I	ldstuba	%r7, [%r8 + 0x0d3c] %asi
	.word 0xca2a0009  ! 510: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc84a0009  ! 510: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xf53a0009  ! 510: STDF_R	std	%f26, [%r9, %r8]
	.word 0xe22a0009  ! 513: STB_R	stb	%r17, [%r8 + %r9]
	.word 0xce420009  ! 513: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xdea21009  ! 513: STWA_R	stwa	%r15, [%r8 + %r9] 0x80
	.word 0xf62a0009  ! 516: STB_R	stb	%r27, [%r8 + %r9]
	.word 0xc8420009  ! 516: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0x24800001  ! 516: BLE	ble,a	<label_0x1>
	.word 0xd6320009  ! 519: STH_R	sth	%r11, [%r8 + %r9]
	.word 0xe25a0009  ! 519: LDX_R	ldx	[%r8 + %r9], %r17
	.word 0xc36a2848  ! 519: PREFETCH_I	prefetch	[%r8 + 0x0848], #one_read
	.word 0xf53a0009  ! 522: STDF_R	std	%f26, [%r9, %r8]
	.word 0xf8520009  ! 522: LDSH_R	ldsh	[%r8 + %r9], %r28
	.word 0x88d20009  ! 522: UMULcc_R	umulcc 	%r8, %r9, %r4
	.word 0xc6320009  ! 525: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xeb1a0009  ! 525: LDDF_R	ldd	[%r8, %r9], %f21
	.word 0xfd3a2708  ! 525: STDF_I	std	%f30, [0x0708, %r8]
	.word 0xcc220009  ! 528: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xcc020009  ! 528: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0x84da24c4  ! 528: SMULcc_I	smulcc 	%r8, 0x04c4, %r2
	.word 0xca320009  ! 531: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xcc020009  ! 531: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0x8143c000  ! 531: STBAR	stbar
	.word 0xc6320009  ! 534: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xcd020009  ! 534: LDF_R	ld	[%r8, %r9], %f6
	.word 0xc36a0009  ! 534: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xf2320009  ! 537: STH_R	sth	%r25, [%r8 + %r9]
	.word 0xce0a0009  ! 537: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0x85220009  ! 537: MULScc_R	mulscc 	%r8, %r9, %r2
	.word 0xc22a0009  ! 540: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc40a0009  ! 540: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xc27a0009  ! 540: SWAP_R	swap	%r1, [%r8 + %r9]
	.word 0xca720009  ! 543: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xfa120009  ! 543: LDUH_R	lduh	[%r8 + %r9], %r29
	.word 0xc6c21009  ! 543: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r3
	.word 0xf4320009  ! 546: STH_R	sth	%r26, [%r8 + %r9]
	.word 0xe05a0009  ! 546: LDX_R	ldx	[%r8 + %r9], %r16
	.word 0x8143e058  ! 546: MEMBAR	membar	#StoreStore | #Lookaside | #Sync 
	.word 0xea720009  ! 549: STX_R	stx	%r21, [%r8 + %r9]
	.word 0xc8120009  ! 549: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xcef21009  ! 549: STXA_R	stxa	%r7, [%r8 + %r9] 0x80
	.word 0xce320009  ! 552: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc60a0009  ! 552: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0x8143e056  ! 552: MEMBAR	membar	#StoreLoad | #LoadStore | #Lookaside | #Sync 
	.word 0xf0220009  ! 555: STW_R	stw	%r24, [%r8 + %r9]
	.word 0xf00a0009  ! 555: LDUB_R	ldub	[%r8 + %r9], %r24
	.word 0xcc0a0009  ! 555: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xf9220009  ! 558: STF_R	st	%f28, [%r9, %r8]
	.word 0xfb1a0009  ! 558: LDDF_R	ldd	[%r8, %r9], %f29
	.word 0xcec22ba0  ! 558: LDSWA_I	ldswa	[%r8, + 0x0ba0] %asi, %r7
	.word 0xca220009  ! 561: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xce0a0009  ! 561: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xceaa1009  ! 561: STBA_R	stba	%r7, [%r8 + %r9] 0x80
	.word 0xc6320009  ! 564: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc2120009  ! 564: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0x8143e045  ! 564: MEMBAR	membar	#LoadLoad | #LoadStore | #Sync 
	.word 0xcc720009  ! 567: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xda120009  ! 567: LDUH_R	lduh	[%r8 + %r9], %r13
	.word 0x1c800001  ! 567: BPOS	bpos  	<label_0x1>
	.word 0xf8220009  ! 570: STW_R	stw	%r28, [%r8 + %r9]
	.word 0xf05a0009  ! 570: LDX_R	ldx	[%r8 + %r9], %r24
	.word 0xecaa1009  ! 570: STBA_R	stba	%r22, [%r8 + %r9] 0x80
	.word 0xce2a0009  ! 573: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xf8120009  ! 573: LDUH_R	lduh	[%r8 + %r9], %r28
	.word 0x22800001  ! 573: BE	be,a	<label_0x1>
	.word 0xdc720009  ! 576: STX_R	stx	%r14, [%r8 + %r9]
	.word 0xce4a0009  ! 576: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xc36a0009  ! 576: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc5220009  ! 579: STF_R	st	%f2, [%r9, %r8]
	.word 0xfe420009  ! 579: LDSW_R	ldsw	[%r8 + %r9], %r31
	.word 0xca8a1009  ! 579: LDUBA_R	lduba	[%r8, %r9] 0x80, %r5
	.word 0xc3220009  ! 582: STF_R	st	%f1, [%r9, %r8]
	.word 0xce5a0009  ! 582: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xc3ea1009  ! 582: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xf8220009  ! 585: STW_R	stw	%r28, [%r8 + %r9]
	.word 0xc24a0009  ! 585: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xa8d2293c  ! 585: UMULcc_I	umulcc 	%r8, 0x093c, %r20
	.word 0xca220009  ! 588: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc3020009  ! 588: LDF_R	ld	[%r8, %r9], %f1
	.word 0x20800001  ! 588: BN	bn,a	<label_0x1>
	.word 0xf0320009  ! 591: STH_R	sth	%r24, [%r8 + %r9]
	.word 0xf9020009  ! 591: LDF_R	ld	[%r8, %r9], %f28
	.word 0xbef20009  ! 591: UDIVcc_R	udivcc 	%r8, %r9, %r31
	.word 0xfe320009  ! 594: STH_R	sth	%r31, [%r8 + %r9]
	.word 0xf11a0009  ! 594: LDDF_R	ldd	[%r8, %r9], %f24
	.word 0x825a0009  ! 594: SMUL_R	smul 	%r8, %r9, %r1
	.word 0xf8720009  ! 597: STX_R	stx	%r28, [%r8 + %r9]
	.word 0xc80a0009  ! 597: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0x89a20929  ! 597: FMULs	fmuls	%f8, %f9, %f4
	.word 0xff220009  ! 600: STF_R	st	%f31, [%r9, %r8]
	.word 0xf60a0009  ! 600: LDUB_R	ldub	[%r8 + %r9], %r27
	.word 0xc3ea1009  ! 600: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xec220009  ! 603: STW_R	stw	%r22, [%r8 + %r9]
	.word 0xcc4a0009  ! 603: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0x8cf20009  ! 603: UDIVcc_R	udivcc 	%r8, %r9, %r6
	.word 0xc62a0009  ! 606: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xda020009  ! 606: LDUW_R	lduw	[%r8 + %r9], %r13
	.word 0xe64a0009  ! 606: LDSB_R	ldsb	[%r8 + %r9], %r19
	.word 0xc4720009  ! 609: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc85a0009  ! 609: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0x3a800001  ! 609: BCC	bcc,a	<label_0x1>
	.word 0xe33a0009  ! 612: STDF_R	std	%f17, [%r9, %r8]
	.word 0xc4020009  ! 612: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xc6da2800  ! 612: LDXA_I	ldxa	[%r8, + 0x0800] %asi, %r3
	.word 0xda220009  ! 615: STW_R	stw	%r13, [%r8 + %r9]
	.word 0xfa520009  ! 615: LDSH_R	ldsh	[%r8 + %r9], %r29
	.word 0xc3ea2344  ! 615: PREFETCHA_I	prefetcha	[%r8, + 0x0344] %asi, #one_read
	.word 0xce220009  ! 618: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc5020009  ! 618: LDF_R	ld	[%r8, %r9], %f2
	.word 0xcbe22009  ! 618: CASA_R	casa	[%r8] %asi, %r9, %r5
	.word 0xca2a0009  ! 621: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xdd1a0009  ! 621: LDDF_R	ldd	[%r8, %r9], %f14
	.word 0x2c800001  ! 621: BNEG	bneg,a	<label_0x1>
	.word 0xda2a0009  ! 624: STB_R	stb	%r13, [%r8 + %r9]
	.word 0xe2120009  ! 624: LDUH_R	lduh	[%r8 + %r9], %r17
	.word 0xa1a20929  ! 624: FMULs	fmuls	%f8, %f9, %f16
	.word 0xfc720009  ! 627: STX_R	stx	%r30, [%r8 + %r9]
	.word 0xc8420009  ! 627: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xa4d227bc  ! 627: UMULcc_I	umulcc 	%r8, 0x07bc, %r18
	.word 0xfa320009  ! 630: STH_R	sth	%r29, [%r8 + %r9]
	.word 0xc6120009  ! 630: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xc84a0009  ! 630: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xdb220009  ! 633: STF_R	st	%f13, [%r9, %r8]
	.word 0xd8120009  ! 633: LDUH_R	lduh	[%r8 + %r9], %r12
	.word 0xee5a0009  ! 633: LDX_R	ldx	[%r8 + %r9], %r23
	.word 0xca720009  ! 636: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc45a0009  ! 636: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0x28800001  ! 636: BLEU	bleu,a	<label_0x1>
	.word 0xde320009  ! 639: STH_R	sth	%r15, [%r8 + %r9]
	.word 0xe5020009  ! 639: LDF_R	ld	[%r8, %r9], %f18
	.word 0x83a20929  ! 639: FMULs	fmuls	%f8, %f9, %f1
	.word 0xe2320009  ! 642: STH_R	sth	%r17, [%r8 + %r9]
	.word 0xde4a0009  ! 642: LDSB_R	ldsb	[%r8 + %r9], %r15
	.word 0xd6b226bc  ! 642: STHA_I	stha	%r11, [%r8 + 0x06bc] %asi
	.word 0xca720009  ! 645: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc71a0009  ! 645: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xc0ba1009  ! 645: STDA_R	stda	%r0, [%r8 + %r9] 0x80
	.word 0xce320009  ! 648: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc8020009  ! 648: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0x82fa0009  ! 648: SDIVcc_R	sdivcc 	%r8, %r9, %r1
	.word 0xec220009  ! 651: STW_R	stw	%r22, [%r8 + %r9]
	.word 0xca4a0009  ! 651: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0x8143e07b  ! 651: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xc2720009  ! 654: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc31a0009  ! 654: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0x8452265c  ! 654: UMUL_I	umul 	%r8, 0x065c, %r2
	.word 0xc2220009  ! 657: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc65a0009  ! 657: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xc8ba2ec8  ! 657: STDA_I	stda	%r4, [%r8 + 0x0ec8] %asi
	.word 0xca320009  ! 660: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc64a0009  ! 660: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xc4da1009  ! 660: LDXA_R	ldxa	[%r8, %r9] 0x80, %r2
	.word 0xf6720009  ! 663: STX_R	stx	%r27, [%r8 + %r9]
	.word 0xc71a0009  ! 663: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0x825a29c0  ! 663: SMUL_I	smul 	%r8, 0x09c0, %r1
	.word 0xf13a0009  ! 666: STDF_R	std	%f24, [%r9, %r8]
	.word 0xc20a0009  ! 666: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0x28800001  ! 666: BLEU	bleu,a	<label_0x1>
	.word 0xf8720009  ! 669: STX_R	stx	%r28, [%r8 + %r9]
	.word 0xc71a0009  ! 669: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0x87a209a9  ! 669: FDIVs	fdivs	%f8, %f9, %f3
	.word 0xe13a0009  ! 672: STDF_R	std	%f16, [%r9, %r8]
	.word 0xf11a0009  ! 672: LDDF_R	ldd	[%r8, %r9], %f24
	.word 0xc25a2030  ! 672: LDX_I	ldx	[%r8 + 0x0030], %r1
	.word 0xcb3a0009  ! 675: STDF_R	std	%f5, [%r9, %r8]
	.word 0xfe420009  ! 675: LDSW_R	ldsw	[%r8 + %r9], %r31
	.word 0x86da26d0  ! 675: SMULcc_I	smulcc 	%r8, 0x06d0, %r3
	.word 0xcc720009  ! 678: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xca4a0009  ! 678: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xceb21009  ! 678: STHA_R	stha	%r7, [%r8 + %r9] 0x80
	.word 0xc22a0009  ! 681: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xfc0a0009  ! 681: LDUB_R	ldub	[%r8 + %r9], %r30
	.word 0x8143c000  ! 681: STBAR	stbar
	.word 0xe42a0009  ! 684: STB_R	stb	%r18, [%r8 + %r9]
	.word 0xc9020009  ! 684: LDF_R	ld	[%r8, %r9], %f4
	.word 0xc2b21009  ! 684: STHA_R	stha	%r1, [%r8 + %r9] 0x80
	.word 0xf0220009  ! 687: STW_R	stw	%r24, [%r8 + %r9]
	.word 0xcc0a0009  ! 687: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xdeb226fc  ! 687: STHA_I	stha	%r15, [%r8 + 0x06fc] %asi
	.word 0xce220009  ! 690: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc6520009  ! 690: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xacda0009  ! 690: SMULcc_R	smulcc 	%r8, %r9, %r22
	.word 0xc2720009  ! 693: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xce020009  ! 693: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xfa822ec8  ! 693: LDUWA_I	lduwa	[%r8, + 0x0ec8] %asi, %r29
	.word 0xc8720009  ! 696: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc6120009  ! 696: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0x8c720009  ! 696: UDIV_R	udiv 	%r8, %r9, %r6
	.word 0xfc720009  ! 699: STX_R	stx	%r30, [%r8 + %r9]
	.word 0xed1a0009  ! 699: LDDF_R	ldd	[%r8, %r9], %f22
	.word 0x8e7a0009  ! 699: SDIV_R	sdiv 	%r8, %r9, %r7
	.word 0xc2220009  ! 702: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xcd1a0009  ! 702: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0x8143c000  ! 702: STBAR	stbar
	.word 0xed3a0009  ! 705: STDF_R	std	%f22, [%r9, %r8]
	.word 0xcc5a0009  ! 705: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0x12800001  ! 705: BNE	bne  	<label_0x1>
	.word 0xc3220009  ! 708: STF_R	st	%f1, [%r9, %r8]
	.word 0xc4020009  ! 708: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0x85a209a9  ! 708: FDIVs	fdivs	%f8, %f9, %f2
	.word 0xce220009  ! 711: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc65a0009  ! 711: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xe46a0009  ! 711: LDSTUB_R	ldstub	%r18, [%r8 + %r9]
	.word 0xed3a0009  ! 714: STDF_R	std	%f22, [%r9, %r8]
	.word 0xca0a0009  ! 714: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0x88f222b8  ! 714: UDIVcc_I	udivcc 	%r8, 0x02b8, %r4
	.word 0xc7220009  ! 717: STF_R	st	%f3, [%r9, %r8]
	.word 0xc64a0009  ! 717: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0x8143c000  ! 717: STBAR	stbar
	.word 0xc3220009  ! 720: STF_R	st	%f1, [%r9, %r8]
	.word 0xc2520009  ! 720: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xc52227f4  ! 720: STF_I	st	%f2, [0x07f4, %r8]
	.word 0xf6720009  ! 723: STX_R	stx	%r27, [%r8 + %r9]
	.word 0xf05a0009  ! 723: LDX_R	ldx	[%r8 + %r9], %r24
	.word 0x8da209a9  ! 723: FDIVs	fdivs	%f8, %f9, %f6
	.word 0xe53a0009  ! 726: STDF_R	std	%f18, [%r9, %r8]
	.word 0xe9020009  ! 726: LDF_R	ld	[%r8, %r9], %f20
	.word 0xc3ea29cc  ! 726: PREFETCHA_I	prefetcha	[%r8, + 0x09cc] %asi, #one_read
	.word 0xf8320009  ! 729: STH_R	sth	%r28, [%r8 + %r9]
	.word 0xe84a0009  ! 729: LDSB_R	ldsb	[%r8 + %r9], %r20
	.word 0x04800001  ! 729: BLE	ble  	<label_0x1>
	.word 0xc33a0009  ! 732: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc6020009  ! 732: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xdc7a2ffc  ! 732: SWAP_I	swap	%r14, [%r8 + 0x0ffc]
	.word 0xca320009  ! 735: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc6520009  ! 735: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0x9cfa0009  ! 735: SDIVcc_R	sdivcc 	%r8, %r9, %r14
	.word 0xcc720009  ! 738: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xcc4a0009  ! 738: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xccba1009  ! 738: STDA_R	stda	%r6, [%r8 + %r9] 0x80
	.word 0xc8220009  ! 741: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xf6420009  ! 741: LDSW_R	ldsw	[%r8 + %r9], %r27
	.word 0x85222624  ! 741: MULScc_I	mulscc 	%r8, 0x0624, %r2
	.word 0xc73a0009  ! 744: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc84a0009  ! 744: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xe68224f8  ! 744: LDUWA_I	lduwa	[%r8, + 0x04f8] %asi, %r19
	.word 0xc53a0009  ! 747: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc2120009  ! 747: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0x85a20929  ! 747: FMULs	fmuls	%f8, %f9, %f2
	.word 0xce220009  ! 750: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xd6120009  ! 750: LDUH_R	lduh	[%r8 + %r9], %r11
	.word 0xe6f22210  ! 750: STXA_I	stxa	%r19, [%r8 + 0x0210] %asi
	.word 0xc5220009  ! 753: STF_R	st	%f2, [%r9, %r8]
	.word 0xca4a0009  ! 753: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xa67a2698  ! 753: SDIV_I	sdiv 	%r8, 0x0698, %r19
	.word 0xc6320009  ! 756: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xdc5a0009  ! 756: LDX_R	ldx	[%r8 + %r9], %r14
	.word 0xc8da1009  ! 756: LDXA_R	ldxa	[%r8, %r9] 0x80, %r4
	.word 0xcc320009  ! 759: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xcc5a0009  ! 759: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xccaa1009  ! 759: STBA_R	stba	%r6, [%r8 + %r9] 0x80
	.word 0xce320009  ! 762: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xdf020009  ! 762: LDF_R	ld	[%r8, %r9], %f15
	.word 0xce6a27c0  ! 762: LDSTUB_I	ldstub	%r7, [%r8 + 0x07c0]
	.word 0xe82a0009  ! 765: STB_R	stb	%r20, [%r8 + %r9]
	.word 0xe24a0009  ! 765: LDSB_R	ldsb	[%r8 + %r9], %r17
	.word 0xc4ba2890  ! 765: STDA_I	stda	%r2, [%r8 + 0x0890] %asi
	.word 0xcb220009  ! 768: STF_R	st	%f5, [%r9, %r8]
	.word 0xc24a0009  ! 768: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xc6fa2bb8  ! 768: SWAPA_I	swapa	%r3, [%r8 + 0x0bb8] %asi
	.word 0xce320009  ! 771: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc6520009  ! 771: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0x0e800002  ! 771: BVS	bvs  	<label_0x2>
	.word 0xcf3a0009  ! 774: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc3020009  ! 774: LDF_R	ld	[%r8, %r9], %f1
	.word 0xc8ca1009  ! 774: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r4
	.word 0xce720009  ! 777: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc8120009  ! 777: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xa0522144  ! 777: UMUL_I	umul 	%r8, 0x0144, %r16
	.word 0xcc2a0009  ! 780: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xce4a0009  ! 780: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xcaea2b34  ! 780: LDSTUBA_I	ldstuba	%r5, [%r8 + 0x0b34] %asi
	.word 0xca220009  ! 783: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xce520009  ! 783: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xca8222dc  ! 783: LDUWA_I	lduwa	[%r8, + 0x02dc] %asi, %r5
	.word 0xc73a0009  ! 786: STDF_R	std	%f3, [%r9, %r8]
	.word 0xef1a0009  ! 786: LDDF_R	ldd	[%r8, %r9], %f23
	.word 0xcf3a2600  ! 786: STDF_I	std	%f7, [0x0600, %r8]
	.word 0xcf3a0009  ! 789: STDF_R	std	%f7, [%r9, %r8]
	.word 0xf20a0009  ! 789: LDUB_R	ldub	[%r8 + %r9], %r25
	.word 0xa5a209a9  ! 789: FDIVs	fdivs	%f8, %f9, %f18
	.word 0xd6720009  ! 792: STX_R	stx	%r11, [%r8 + %r9]
	.word 0xcc5a0009  ! 792: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xc3ea1009  ! 792: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xe8720009  ! 795: STX_R	stx	%r20, [%r8 + %r9]
	.word 0xc84a0009  ! 795: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xc36a0009  ! 795: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xef3a0009  ! 798: STDF_R	std	%f23, [%r9, %r8]
	.word 0xc20a0009  ! 798: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xc32225a0  ! 798: STF_I	st	%f1, [0x05a0, %r8]
	.word 0xcd220009  ! 801: STF_R	st	%f6, [%r9, %r8]
	.word 0xcc5a0009  ! 801: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0x8e7a0009  ! 801: SDIV_R	sdiv 	%r8, %r9, %r7
	.word 0xdc720009  ! 804: STX_R	stx	%r14, [%r8 + %r9]
	.word 0xce0a0009  ! 804: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0x8c520009  ! 804: UMUL_R	umul 	%r8, %r9, %r6
	.word 0xf33a0009  ! 807: STDF_R	std	%f25, [%r9, %r8]
	.word 0xc9020009  ! 807: LDF_R	ld	[%r8, %r9], %f4
	.word 0xceea29c0  ! 807: LDSTUBA_I	ldstuba	%r7, [%r8 + 0x09c0] %asi
	.word 0xc4220009  ! 810: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xcc120009  ! 810: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xf4aa2954  ! 810: STBA_I	stba	%r26, [%r8 + 0x0954] %asi
	.word 0xd6720009  ! 813: STX_R	stx	%r11, [%r8 + %r9]
	.word 0xf6120009  ! 813: LDUH_R	lduh	[%r8 + %r9], %r27
	.word 0xf3222a58  ! 813: STF_I	st	%f25, [0x0a58, %r8]
	.word 0xdc2a0009  ! 816: STB_R	stb	%r14, [%r8 + %r9]
	.word 0xc71a0009  ! 816: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xc7e22009  ! 816: CASA_R	casa	[%r8] %asi, %r9, %r3
	.word 0xcc220009  ! 819: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xec0a0009  ! 819: LDUB_R	ldub	[%r8 + %r9], %r22
	.word 0x00800002  ! 819: BN	bn  	<label_0x2>
	.word 0xf0320009  ! 822: STH_R	sth	%r24, [%r8 + %r9]
	.word 0xc4020009  ! 822: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xc24a2e7c  ! 822: LDSB_I	ldsb	[%r8 + 0x0e7c], %r1
	.word 0xcc220009  ! 825: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc6420009  ! 825: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xfc0a2030  ! 825: LDUB_I	ldub	[%r8 + 0x0030], %r30
	.word 0xca220009  ! 828: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc3020009  ! 828: LDF_R	ld	[%r8, %r9], %f1
	.word 0x98da0009  ! 828: SMULcc_R	smulcc 	%r8, %r9, %r12
	.word 0xce220009  ! 831: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc7020009  ! 831: LDF_R	ld	[%r8, %r9], %f3
	.word 0xad220009  ! 831: MULScc_R	mulscc 	%r8, %r9, %r22
	.word 0xc82a0009  ! 834: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xe71a0009  ! 834: LDDF_R	ldd	[%r8, %r9], %f19
	.word 0xcea22720  ! 834: STWA_I	stwa	%r7, [%r8 + 0x0720] %asi
	.word 0xe8220009  ! 837: STW_R	stw	%r20, [%r8 + %r9]
	.word 0xd8420009  ! 837: LDSW_R	ldsw	[%r8 + %r9], %r12
	.word 0xc3ea201c  ! 837: PREFETCHA_I	prefetcha	[%r8, + 0x001c] %asi, #one_read
	.word 0xc93a0009  ! 840: STDF_R	std	%f4, [%r9, %r8]
	.word 0xff1a0009  ! 840: LDDF_R	ldd	[%r8, %r9], %f31
	.word 0x0e800001  ! 840: BVS	bvs  	<label_0x1>
	.word 0xc6720009  ! 843: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xfc420009  ! 843: LDSW_R	ldsw	[%r8 + %r9], %r30
	.word 0xb07a2200  ! 843: SDIV_I	sdiv 	%r8, 0x0200, %r24
	.word 0xca720009  ! 846: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xe05a0009  ! 846: LDX_R	ldx	[%r8 + %r9], %r16
	.word 0x8143c000  ! 846: STBAR	stbar
	.word 0xc42a0009  ! 849: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xca420009  ! 849: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0x8143c000  ! 849: STBAR	stbar
	.word 0xca320009  ! 852: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xfd1a0009  ! 852: LDDF_R	ldd	[%r8, %r9], %f30
	.word 0x1e800002  ! 852: BVC	bvc  	<label_0x2>
	.word 0xdf220009  ! 855: STF_R	st	%f15, [%r9, %r8]
	.word 0xcc4a0009  ! 855: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xd8ca1009  ! 855: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r12
	.word 0xc2720009  ! 858: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xf65a0009  ! 858: LDX_R	ldx	[%r8 + %r9], %r27
	.word 0xcde21009  ! 858: CASA_I	casa	[%r8] 0x80, %r9, %r6
	.word 0xc33a0009  ! 861: STDF_R	std	%f1, [%r9, %r8]
	.word 0xe6020009  ! 861: LDUW_R	lduw	[%r8 + %r9], %r19
	.word 0xf6fa1009  ! 861: SWAPA_R	swapa	%r27, [%r8 + %r9] 0x80
	.word 0xc62a0009  ! 864: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xce420009  ! 864: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xc6020009  ! 864: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xcb3a0009  ! 867: STDF_R	std	%f5, [%r9, %r8]
	.word 0xc6120009  ! 867: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0x8a4a278c  ! 867: MULX_I	mulx 	%r8, 0x078c, %r5
	.word 0xcb220009  ! 870: STF_R	st	%f5, [%r9, %r8]
	.word 0xe8020009  ! 870: LDUW_R	lduw	[%r8 + %r9], %r20
	.word 0x8f220009  ! 870: MULScc_R	mulscc 	%r8, %r9, %r7
	.word 0xc62a0009  ! 873: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc60a0009  ! 873: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xe402217c  ! 873: LDUW_I	lduw	[%r8 + 0x017c], %r18
	.word 0xc9220009  ! 876: STF_R	st	%f4, [%r9, %r8]
	.word 0xc8120009  ! 876: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xc3ea2d7c  ! 876: PREFETCHA_I	prefetcha	[%r8, + 0x0d7c] %asi, #one_read
	.word 0xfa220009  ! 879: STW_R	stw	%r29, [%r8 + %r9]
	.word 0xc7020009  ! 879: LDF_R	ld	[%r8, %r9], %f3
	.word 0x8a4a29c8  ! 879: MULX_I	mulx 	%r8, 0x09c8, %r5
	.word 0xe4720009  ! 882: STX_R	stx	%r18, [%r8 + %r9]
	.word 0xc80a0009  ! 882: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xc2ca2bc0  ! 882: LDSBA_I	ldsba	[%r8, + 0x0bc0] %asi, %r1
	.word 0xcf3a0009  ! 885: STDF_R	std	%f7, [%r9, %r8]
	.word 0xcd1a0009  ! 885: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0x8143c000  ! 885: STBAR	stbar
	.word 0xc53a0009  ! 888: STDF_R	std	%f2, [%r9, %r8]
	.word 0xf45a0009  ! 888: LDX_R	ldx	[%r8 + %r9], %r26
	.word 0xc4822250  ! 888: LDUWA_I	lduwa	[%r8, + 0x0250] %asi, %r2
	.word 0xee720009  ! 891: STX_R	stx	%r23, [%r8 + %r9]
	.word 0xe2520009  ! 891: LDSH_R	ldsh	[%r8 + %r9], %r17
	.word 0xcaea1009  ! 891: LDSTUBA_R	ldstuba	%r5, [%r8 + %r9] 0x80
	.word 0xc8320009  ! 894: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xee420009  ! 894: LDSW_R	ldsw	[%r8 + %r9], %r23
	.word 0x9a520009  ! 894: UMUL_R	umul 	%r8, %r9, %r13
	.word 0xff3a0009  ! 897: STDF_R	std	%f31, [%r9, %r8]
	.word 0xce420009  ! 897: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0x2eca0001  ! 897: BRGEZ	brgez,a,pt	%8,<label_0xa0001>
	.word 0xca220009  ! 900: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xe0420009  ! 900: LDSW_R	ldsw	[%r8 + %r9], %r16
	.word 0xc36a21cc  ! 900: PREFETCH_I	prefetch	[%r8 + 0x01cc], #one_read
	.word 0xdd3a0009  ! 903: STDF_R	std	%f14, [%r9, %r8]
	.word 0xc85a0009  ! 903: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0x3a800001  ! 903: BCC	bcc,a	<label_0x1>
	.word 0xda320009  ! 906: STH_R	sth	%r13, [%r8 + %r9]
	.word 0xc25a0009  ! 906: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xcea22cc4  ! 906: STWA_I	stwa	%r7, [%r8 + 0x0cc4] %asi
	.word 0xcd3a0009  ! 909: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc7020009  ! 909: LDF_R	ld	[%r8, %r9], %f3
	.word 0xc6b22d24  ! 909: STHA_I	stha	%r3, [%r8 + 0x0d24] %asi
	.word 0xc33a0009  ! 912: STDF_R	std	%f1, [%r9, %r8]
	.word 0xca4a0009  ! 912: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xbeda0009  ! 912: SMULcc_R	smulcc 	%r8, %r9, %r31
	.word 0xc6720009  ! 915: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc20a0009  ! 915: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xc47a246c  ! 915: SWAP_I	swap	%r2, [%r8 + 0x046c]
	.word 0xce320009  ! 918: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xca520009  ! 918: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xc71a0009  ! 918: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xcc320009  ! 921: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xcc5a0009  ! 921: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xc4fa1009  ! 921: SWAPA_R	swapa	%r2, [%r8 + %r9] 0x80
	.word 0xc2320009  ! 924: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc24a0009  ! 924: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0x8c5a20ac  ! 924: SMUL_I	smul 	%r8, 0x00ac, %r6
	.word 0xce2a0009  ! 927: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc6420009  ! 927: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0x0e800001  ! 927: BVS	bvs  	<label_0x1>
	.word 0xc2320009  ! 930: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc31a0009  ! 930: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0x85a209a9  ! 930: FDIVs	fdivs	%f8, %f9, %f2
	.word 0xe6320009  ! 933: STH_R	sth	%r19, [%r8 + %r9]
	.word 0xf0420009  ! 933: LDSW_R	ldsw	[%r8 + %r9], %r24
	.word 0x8ef20009  ! 933: UDIVcc_R	udivcc 	%r8, %r9, %r7
	.word 0xcd3a0009  ! 936: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc6120009  ! 936: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xcca22728  ! 936: STWA_I	stwa	%r6, [%r8 + 0x0728] %asi
	.word 0xcf220009  ! 939: STF_R	st	%f7, [%r9, %r8]
	.word 0xce0a0009  ! 939: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0x26800002  ! 939: BL	bl,a	<label_0x2>
	.word 0xc5220009  ! 942: STF_R	st	%f2, [%r9, %r8]
	.word 0xee5a0009  ! 942: LDX_R	ldx	[%r8 + %r9], %r23
	.word 0xd8520009  ! 942: LDSH_R	ldsh	[%r8 + %r9], %r12
	.word 0xca2a0009  ! 945: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc40a0009  ! 945: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xcde21009  ! 945: CASA_I	casa	[%r8] 0x80, %r9, %r6
	.word 0xc6720009  ! 948: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc8020009  ! 948: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xc6a21009  ! 948: STWA_R	stwa	%r3, [%r8 + %r9] 0x80
	.word 0xc4220009  ! 951: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc6520009  ! 951: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0x8143e012  ! 951: MEMBAR	membar	#StoreLoad | #Lookaside 
	.word 0xf9220009  ! 954: STF_R	st	%f28, [%r9, %r8]
	.word 0xe24a0009  ! 954: LDSB_R	ldsb	[%r8 + %r9], %r17
	.word 0x867a20d8  ! 954: SDIV_I	sdiv 	%r8, 0x00d8, %r3
	.word 0xe0720009  ! 957: STX_R	stx	%r16, [%r8 + %r9]
	.word 0xc91a0009  ! 957: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xce020009  ! 957: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xc22a0009  ! 960: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xca120009  ! 960: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xfdf21009  ! 960: CASXA_I	casxa	[%r8] 0x80, %r9, %r30
	.word 0xc5220009  ! 963: STF_R	st	%f2, [%r9, %r8]
	.word 0xf05a0009  ! 963: LDX_R	ldx	[%r8 + %r9], %r24
	.word 0xca5a28e0  ! 963: LDX_I	ldx	[%r8 + 0x08e0], %r5
	.word 0xc62a0009  ! 966: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xcc120009  ! 966: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xde522748  ! 966: LDSH_I	ldsh	[%r8 + 0x0748], %r15
	.word 0xd8220009  ! 969: STW_R	stw	%r12, [%r8 + %r9]
	.word 0xe6020009  ! 969: LDUW_R	lduw	[%r8 + %r9], %r19
	.word 0xc20a2cc0  ! 969: LDUB_I	ldub	[%r8 + 0x0cc0], %r1
	.word 0xf3220009  ! 972: STF_R	st	%f25, [%r9, %r8]
	.word 0xc25a0009  ! 972: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0x16800001  ! 972: BGE	bge  	<label_0x1>
	.word 0xed220009  ! 975: STF_R	st	%f22, [%r9, %r8]
	.word 0xca520009  ! 975: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xead22638  ! 975: LDSHA_I	ldsha	[%r8, + 0x0638] %asi, %r21
	.word 0xc2320009  ! 978: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc51a0009  ! 978: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xb8720009  ! 978: UDIV_R	udiv 	%r8, %r9, %r28
	.word 0xc9220009  ! 981: STF_R	st	%f4, [%r9, %r8]
	.word 0xc24a0009  ! 981: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xfcd22b5c  ! 981: LDSHA_I	ldsha	[%r8, + 0x0b5c] %asi, %r30
	.word 0xcc720009  ! 984: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc31a0009  ! 984: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xc4ea1009  ! 984: LDSTUBA_R	ldstuba	%r2, [%r8 + %r9] 0x80
	.word 0xf6320009  ! 987: STH_R	sth	%r27, [%r8 + %r9]
	.word 0xc3020009  ! 987: LDF_R	ld	[%r8, %r9], %f1
	.word 0xca922fe8  ! 987: LDUHA_I	lduha	[%r8, + 0x0fe8] %asi, %r5
	.word 0xec720009  ! 990: STX_R	stx	%r22, [%r8 + %r9]
	.word 0xf00a0009  ! 990: LDUB_R	ldub	[%r8 + %r9], %r24
	.word 0x8143e014  ! 990: MEMBAR	membar	#LoadStore | #Lookaside 
	.word 0xff220009  ! 993: STF_R	st	%f31, [%r9, %r8]
	.word 0xc64a0009  ! 993: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0x8143e032  ! 993: MEMBAR	membar	#StoreLoad | #Lookaside | #MemIssue 
	.word 0xcf3a0009  ! 996: STDF_R	std	%f7, [%r9, %r8]
	.word 0xcf020009  ! 996: LDF_R	ld	[%r8, %r9], %f7
	.word 0x28800001  ! 996: BLEU	bleu,a	<label_0x1>
	.word 0xc62a0009  ! 999: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xca020009  ! 999: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xc2ea1009  ! 999: LDSTUBA_R	ldstuba	%r1, [%r8 + %r9] 0x80
	.word 0xc5220009  ! 1002: STF_R	st	%f2, [%r9, %r8]
	.word 0xcc120009  ! 1002: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xf4420009  ! 1002: LDSW_R	ldsw	[%r8 + %r9], %r26
	.word 0xcb220009  ! 1005: STF_R	st	%f5, [%r9, %r8]
	.word 0xfa020009  ! 1005: LDUW_R	lduw	[%r8 + %r9], %r29
	.word 0x00800001  ! 1005: BN	bn  	<label_0x1>
	.word 0xd6220009  ! 1008: STW_R	stw	%r11, [%r8 + %r9]
	.word 0xc6020009  ! 1008: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xf2520009  ! 1008: LDSH_R	ldsh	[%r8 + %r9], %r25
	.word 0xca320009  ! 1011: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc6120009  ! 1011: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xe0122350  ! 1011: LDUH_I	lduh	[%r8 + 0x0350], %r16
	.word 0xd6320009  ! 1014: STH_R	sth	%r11, [%r8 + %r9]
	.word 0xc2120009  ! 1014: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0x8143c000  ! 1014: STBAR	stbar
	.word 0xca220009  ! 1017: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc8020009  ! 1017: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xc2020009  ! 1017: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xc4320009  ! 1020: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc44a0009  ! 1020: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xca1228d8  ! 1020: LDUH_I	lduh	[%r8 + 0x08d8], %r5
	.word 0xc2320009  ! 1023: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xf20a0009  ! 1023: LDUB_R	ldub	[%r8 + %r9], %r25
	.word 0x99220009  ! 1023: MULScc_R	mulscc 	%r8, %r9, %r12
	.word 0xc8320009  ! 1026: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xcf020009  ! 1026: LDF_R	ld	[%r8, %r9], %f7
	.word 0xc6da1009  ! 1026: LDXA_R	ldxa	[%r8, %r9] 0x80, %r3
	.word 0xc2320009  ! 1029: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xf60a0009  ! 1029: LDUB_R	ldub	[%r8 + %r9], %r27
	.word 0xcad220f0  ! 1029: LDSHA_I	ldsha	[%r8, + 0x00f0] %asi, %r5
	.word 0xcc720009  ! 1032: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xca0a0009  ! 1032: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xc4d21009  ! 1032: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r2
	.word 0xce220009  ! 1035: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xcf020009  ! 1035: LDF_R	ld	[%r8, %r9], %f7
	.word 0x8143c000  ! 1035: STBAR	stbar
	.word 0xc6720009  ! 1038: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xf71a0009  ! 1038: LDDF_R	ldd	[%r8, %r9], %f27
	.word 0x8fa208a9  ! 1038: FSUBs	fsubs	%f8, %f9, %f7
	.word 0xfa220009  ! 1041: STW_R	stw	%r29, [%r8 + %r9]
	.word 0xc2520009  ! 1041: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xc3ea1009  ! 1041: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xca720009  ! 1044: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc2020009  ! 1044: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xf7f22009  ! 1044: CASXA_R	casxa	[%r8]%asi, %r9, %r27
	.word 0xc5220009  ! 1047: STF_R	st	%f2, [%r9, %r8]
	.word 0xc80a0009  ! 1047: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xc2da27e0  ! 1047: LDXA_I	ldxa	[%r8, + 0x07e0] %asi, %r1
	.word 0xcb220009  ! 1050: STF_R	st	%f5, [%r9, %r8]
	.word 0xca4a0009  ! 1050: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xdc8a2000  ! 1050: LDUBA_I	lduba	[%r8, + 0x0000] %asi, %r14
	.word 0xd6320009  ! 1053: STH_R	sth	%r11, [%r8 + %r9]
	.word 0xf2020009  ! 1053: LDUW_R	lduw	[%r8 + %r9], %r25
	.word 0xc4f225c8  ! 1053: STXA_I	stxa	%r2, [%r8 + 0x05c8] %asi
	.word 0xc82a0009  ! 1056: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc71a0009  ! 1056: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xc28a2314  ! 1056: LDUBA_I	lduba	[%r8, + 0x0314] %asi, %r1
	.word 0xc82a0009  ! 1059: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xe6520009  ! 1059: LDSH_R	ldsh	[%r8 + %r9], %r19
	.word 0x9fa209a9  ! 1059: FDIVs	fdivs	%f8, %f9, %f15
	.word 0xe8220009  ! 1062: STW_R	stw	%r20, [%r8 + %r9]
	.word 0xe60a0009  ! 1062: LDUB_R	ldub	[%r8 + %r9], %r19
	.word 0x9c4a2bc0  ! 1062: MULX_I	mulx 	%r8, 0x0bc0, %r14
	.word 0xc2220009  ! 1065: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xcf1a0009  ! 1065: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0x8ba20829  ! 1065: FADDs	fadds	%f8, %f9, %f5
	.word 0xca2a0009  ! 1068: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xfa5a0009  ! 1068: LDX_R	ldx	[%r8 + %r9], %r29
	.word 0xceea2858  ! 1068: LDSTUBA_I	ldstuba	%r7, [%r8 + 0x0858] %asi
	.word 0xcf220009  ! 1071: STF_R	st	%f7, [%r9, %r8]
	.word 0xcc5a0009  ! 1071: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xc3ea1009  ! 1071: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xda2a0009  ! 1074: STB_R	stb	%r13, [%r8 + %r9]
	.word 0xc4020009  ! 1074: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xce4224a0  ! 1074: LDSW_I	ldsw	[%r8 + 0x04a0], %r7
	.word 0xda220009  ! 1077: STW_R	stw	%r13, [%r8 + %r9]
	.word 0xfc4a0009  ! 1077: LDSB_R	ldsb	[%r8 + %r9], %r30
	.word 0xc36a0009  ! 1077: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xf6320009  ! 1080: STH_R	sth	%r27, [%r8 + %r9]
	.word 0xc6120009  ! 1080: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xccaa21c8  ! 1080: STBA_I	stba	%r6, [%r8 + 0x01c8] %asi
	.word 0xec720009  ! 1083: STX_R	stx	%r22, [%r8 + %r9]
	.word 0xcc0a0009  ! 1083: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0x8da209a9  ! 1083: FDIVs	fdivs	%f8, %f9, %f6
	.word 0xe2220009  ! 1086: STW_R	stw	%r17, [%r8 + %r9]
	.word 0xda0a0009  ! 1086: LDUB_R	ldub	[%r8 + %r9], %r13
	.word 0xccf221e0  ! 1086: STXA_I	stxa	%r6, [%r8 + 0x01e0] %asi
	.word 0xd6720009  ! 1089: STX_R	stx	%r11, [%r8 + %r9]
	.word 0xe4420009  ! 1089: LDSW_R	ldsw	[%r8 + %r9], %r18
	.word 0xc3ea1009  ! 1089: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xcc220009  ! 1092: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xe65a0009  ! 1092: LDX_R	ldx	[%r8 + %r9], %r19
	.word 0x8e4a0009  ! 1092: MULX_R	mulx 	%r8, %r9, %r7
	.word 0xcf3a0009  ! 1095: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc24a0009  ! 1095: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0x82f22968  ! 1095: UDIVcc_I	udivcc 	%r8, 0x0968, %r1
	.word 0xc22a0009  ! 1098: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xe00a0009  ! 1098: LDUB_R	ldub	[%r8 + %r9], %r16
	.word 0xc68a1009  ! 1098: LDUBA_R	lduba	[%r8, %r9] 0x80, %r3
	.word 0xda320009  ! 1101: STH_R	sth	%r13, [%r8 + %r9]
	.word 0xce5a0009  ! 1101: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xc53a0009  ! 1101: STDF_R	std	%f2, [%r9, %r8]
	.word 0xe6320009  ! 1104: STH_R	sth	%r19, [%r8 + %r9]
	.word 0xfa5a0009  ! 1104: LDX_R	ldx	[%r8 + %r9], %r29
	.word 0x847a222c  ! 1104: SDIV_I	sdiv 	%r8, 0x022c, %r2
	.word 0xcc320009  ! 1107: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc9020009  ! 1107: LDF_R	ld	[%r8, %r9], %f4
	.word 0xbd6a0009  ! 1107: SDIVX_R	sdivx	%r8, %r9, %r30
	.word 0xc8320009  ! 1110: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc3020009  ! 1110: LDF_R	ld	[%r8, %r9], %f1
	.word 0xf93a20d8  ! 1110: STDF_I	std	%f28, [0x00d8, %r8]
	.word 0xcc2a0009  ! 1113: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xe8420009  ! 1113: LDSW_R	ldsw	[%r8 + %r9], %r20
	.word 0xc4022628  ! 1113: LDUW_I	lduw	[%r8 + 0x0628], %r2
	.word 0xc62a0009  ! 1116: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xdc0a0009  ! 1116: LDUB_R	ldub	[%r8 + %r9], %r14
	.word 0x8143c000  ! 1116: STBAR	stbar
	.word 0xca220009  ! 1119: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xca520009  ! 1119: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xc4022a34  ! 1119: LDUW_I	lduw	[%r8 + 0x0a34], %r2
	.word 0xe62a0009  ! 1122: STB_R	stb	%r19, [%r8 + %r9]
	.word 0xe31a0009  ! 1122: LDDF_R	ldd	[%r8, %r9], %f17
	.word 0xa8d221bc  ! 1122: UMULcc_I	umulcc 	%r8, 0x01bc, %r20
	.word 0xf0720009  ! 1125: STX_R	stx	%r24, [%r8 + %r9]
	.word 0xc24a0009  ! 1125: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0x82720009  ! 1125: UDIV_R	udiv 	%r8, %r9, %r1
	.word 0xca2a0009  ! 1128: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xca5a0009  ! 1128: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0x83220009  ! 1128: MULScc_R	mulscc 	%r8, %r9, %r1
	.word 0xcf3a0009  ! 1131: STDF_R	std	%f7, [%r9, %r8]
	.word 0xfc0a0009  ! 1131: LDUB_R	ldub	[%r8 + %r9], %r30
	.word 0xc73a0009  ! 1131: STDF_R	std	%f3, [%r9, %r8]
	.word 0xca320009  ! 1134: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xf4420009  ! 1134: LDSW_R	ldsw	[%r8 + %r9], %r26
	.word 0x06ca0001  ! 1134: BRLZ	brlz  ,pt	%8,<label_0xa0001>
	.word 0xc4320009  ! 1137: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc6120009  ! 1137: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xc4ba2e18  ! 1137: STDA_I	stda	%r2, [%r8 + 0x0e18] %asi
	.word 0xc33a0009  ! 1140: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc44a0009  ! 1140: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xc0ba2320  ! 1140: STDA_I	stda	%r0, [%r8 + 0x0320] %asi
	.word 0xde720009  ! 1143: STX_R	stx	%r15, [%r8 + %r9]
	.word 0xe8020009  ! 1143: LDUW_R	lduw	[%r8 + %r9], %r20
	.word 0xc8b22784  ! 1143: STHA_I	stha	%r4, [%r8 + 0x0784] %asi
	.word 0xe3220009  ! 1146: STF_R	st	%f17, [%r9, %r8]
	.word 0xc71a0009  ! 1146: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xf6522ae8  ! 1146: LDSH_I	ldsh	[%r8 + 0x0ae8], %r27
	.word 0xfc2a0009  ! 1149: STB_R	stb	%r30, [%r8 + %r9]
	.word 0xc3020009  ! 1149: LDF_R	ld	[%r8, %r9], %f1
	.word 0x8ba20829  ! 1149: FADDs	fadds	%f8, %f9, %f5
	.word 0xc62a0009  ! 1152: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xdd1a0009  ! 1152: LDDF_R	ldd	[%r8, %r9], %f14
	.word 0xc36a0009  ! 1152: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xcb3a0009  ! 1155: STDF_R	std	%f5, [%r9, %r8]
	.word 0xc2420009  ! 1155: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xcab2286c  ! 1155: STHA_I	stha	%r5, [%r8 + 0x086c] %asi
	.word 0xc4220009  ! 1158: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc4520009  ! 1158: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0x8e522770  ! 1158: UMUL_I	umul 	%r8, 0x0770, %r7
	.word 0xfe2a0009  ! 1161: STB_R	stb	%r31, [%r8 + %r9]
	.word 0xd91a0009  ! 1161: LDDF_R	ldd	[%r8, %r9], %f12
	.word 0x827a2de8  ! 1161: SDIV_I	sdiv 	%r8, 0x0de8, %r1
	.word 0xc8220009  ! 1164: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc8420009  ! 1164: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0x8af22128  ! 1164: UDIVcc_I	udivcc 	%r8, 0x0128, %r5
	.word 0xe42a0009  ! 1167: STB_R	stb	%r18, [%r8 + %r9]
	.word 0xc25a0009  ! 1167: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xce6a2118  ! 1167: LDSTUB_I	ldstub	%r7, [%r8 + 0x0118]
	.word 0xf4220009  ! 1170: STW_R	stw	%r26, [%r8 + %r9]
	.word 0xcc020009  ! 1170: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0x8fa20829  ! 1170: FADDs	fadds	%f8, %f9, %f7
	.word 0xc9220009  ! 1173: STF_R	st	%f4, [%r9, %r8]
	.word 0xc8520009  ! 1173: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0x86720009  ! 1173: UDIV_R	udiv 	%r8, %r9, %r3
	.word 0xc4220009  ! 1176: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xce020009  ! 1176: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0x28800001  ! 1176: BLEU	bleu,a	<label_0x1>
	.word 0xc3220009  ! 1179: STF_R	st	%f1, [%r9, %r8]
	.word 0xe4420009  ! 1179: LDSW_R	ldsw	[%r8 + %r9], %r18
	.word 0xc36a0009  ! 1179: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xca720009  ! 1182: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xdc520009  ! 1182: LDSH_R	ldsh	[%r8 + %r9], %r14
	.word 0xc922266c  ! 1182: STF_I	st	%f4, [0x066c, %r8]
	.word 0xfd220009  ! 1185: STF_R	st	%f30, [%r9, %r8]
	.word 0xe84a0009  ! 1185: LDSB_R	ldsb	[%r8 + %r9], %r20
	.word 0xbba209a9  ! 1185: FDIVs	fdivs	%f8, %f9, %f29
	.word 0xd8320009  ! 1188: STH_R	sth	%r12, [%r8 + %r9]
	.word 0xce0a0009  ! 1188: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0x9a522dd0  ! 1188: UMUL_I	umul 	%r8, 0x0dd0, %r13
	.word 0xc62a0009  ! 1191: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xce5a0009  ! 1191: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0x88f20009  ! 1191: UDIVcc_R	udivcc 	%r8, %r9, %r4
	.word 0xcc720009  ! 1194: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xde420009  ! 1194: LDSW_R	ldsw	[%r8 + %r9], %r15
	.word 0x88fa0009  ! 1194: SDIVcc_R	sdivcc 	%r8, %r9, %r4
	.word 0xc8220009  ! 1197: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xff020009  ! 1197: LDF_R	ld	[%r8, %r9], %f31
	.word 0xf5222674  ! 1197: STF_I	st	%f26, [0x0674, %r8]
	.word 0xcd220009  ! 1200: STF_R	st	%f6, [%r9, %r8]
	.word 0xc6120009  ! 1200: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xc5f22009  ! 1200: CASXA_R	casxa	[%r8]%asi, %r9, %r2
	.word 0xca2a0009  ! 1203: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xe71a0009  ! 1203: LDDF_R	ldd	[%r8, %r9], %f19
	.word 0x32800001  ! 1203: BNE	bne,a	<label_0x1>
	.word 0xfe2a0009  ! 1206: STB_R	stb	%r31, [%r8 + %r9]
	.word 0xc51a0009  ! 1206: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xdc0a0009  ! 1206: LDUB_R	ldub	[%r8 + %r9], %r14
	.word 0xc4220009  ! 1209: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc2420009  ! 1209: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xc3222468  ! 1209: STF_I	st	%f1, [0x0468, %r8]
	.word 0xdc2a0009  ! 1212: STB_R	stb	%r14, [%r8 + %r9]
	.word 0xcb1a0009  ! 1212: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0x87a20929  ! 1212: FMULs	fmuls	%f8, %f9, %f3
	.word 0xc8720009  ! 1215: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc60a0009  ! 1215: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xd6f220c8  ! 1215: STXA_I	stxa	%r11, [%r8 + 0x00c8] %asi
	.word 0xcc720009  ! 1218: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xe25a0009  ! 1218: LDX_R	ldx	[%r8 + %r9], %r17
	.word 0xfcaa221c  ! 1218: STBA_I	stba	%r30, [%r8 + 0x021c] %asi
	.word 0xe53a0009  ! 1221: STDF_R	std	%f18, [%r9, %r8]
	.word 0xe20a0009  ! 1221: LDUB_R	ldub	[%r8 + %r9], %r17
	.word 0xc3e22009  ! 1221: CASA_R	casa	[%r8] %asi, %r9, %r1
	.word 0xd8220009  ! 1224: STW_R	stw	%r12, [%r8 + %r9]
	.word 0xc4420009  ! 1224: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xf3022858  ! 1224: LDF_I	ld	[%r8, 0x0858], %f25
	.word 0xc9220009  ! 1227: STF_R	st	%f4, [%r9, %r8]
	.word 0xc2020009  ! 1227: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xcbf22009  ! 1227: CASXA_R	casxa	[%r8]%asi, %r9, %r5
	.word 0xce720009  ! 1230: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc8420009  ! 1230: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0x3e800001  ! 1230: BVC	bvc,a	<label_0x1>
	.word 0xc4220009  ! 1233: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xce120009  ! 1233: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0x87a20829  ! 1233: FADDs	fadds	%f8, %f9, %f3
	.word 0xf33a0009  ! 1236: STDF_R	std	%f25, [%r9, %r8]
	.word 0xc4520009  ! 1236: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xcd222d5c  ! 1236: STF_I	st	%f6, [0x0d5c, %r8]
	.word 0xc4220009  ! 1239: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xce020009  ! 1239: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0x8da209a9  ! 1239: FDIVs	fdivs	%f8, %f9, %f6
	.word 0xca320009  ! 1242: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc40a0009  ! 1242: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xc6d21009  ! 1242: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r3
	.word 0xff3a0009  ! 1245: STDF_R	std	%f31, [%r9, %r8]
	.word 0xc9020009  ! 1245: LDF_R	ld	[%r8, %r9], %f4
	.word 0x8143c000  ! 1245: STBAR	stbar
	.word 0xec220009  ! 1248: STW_R	stw	%r22, [%r8 + %r9]
	.word 0xc2420009  ! 1248: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xb3a20829  ! 1248: FADDs	fadds	%f8, %f9, %f25
	.word 0xcc320009  ! 1251: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xf0020009  ! 1251: LDUW_R	lduw	[%r8 + %r9], %r24
	.word 0xc6f21009  ! 1251: STXA_R	stxa	%r3, [%r8 + %r9] 0x80
	.word 0xca2a0009  ! 1254: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xf6120009  ! 1254: LDUH_R	lduh	[%r8 + %r9], %r27
	.word 0x8143c000  ! 1254: STBAR	stbar
	.word 0xce320009  ! 1257: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xcd020009  ! 1257: LDF_R	ld	[%r8, %r9], %f6
	.word 0xcc0a2ee8  ! 1257: LDUB_I	ldub	[%r8 + 0x0ee8], %r6
	.word 0xfa2a0009  ! 1260: STB_R	stb	%r29, [%r8 + %r9]
	.word 0xc4120009  ! 1260: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0x88d20009  ! 1260: UMULcc_R	umulcc 	%r8, %r9, %r4
	.word 0xc2220009  ! 1263: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xca4a0009  ! 1263: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xc36a0009  ! 1263: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xfe720009  ! 1266: STX_R	stx	%r31, [%r8 + %r9]
	.word 0xcb1a0009  ! 1266: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0x8143c000  ! 1266: STBAR	stbar
	.word 0xc33a0009  ! 1269: STDF_R	std	%f1, [%r9, %r8]
	.word 0xdf1a0009  ! 1269: LDDF_R	ldd	[%r8, %r9], %f15
	.word 0x0e800002  ! 1269: BVS	bvs  	<label_0x2>
	.word 0xc6720009  ! 1272: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xce020009  ! 1272: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xc3f21009  ! 1272: CASXA_I	casxa	[%r8] 0x80, %r9, %r1
	.word 0xf4220009  ! 1275: STW_R	stw	%r26, [%r8 + %r9]
	.word 0xfa420009  ! 1275: LDSW_R	ldsw	[%r8 + %r9], %r29
	.word 0x8143e037  ! 1275: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside | #MemIssue 
	.word 0xca220009  ! 1278: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc80a0009  ! 1278: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0x84da2e58  ! 1278: SMULcc_I	smulcc 	%r8, 0x0e58, %r2
	.word 0xca320009  ! 1281: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xf85a0009  ! 1281: LDX_R	ldx	[%r8 + %r9], %r28
	.word 0x8143c000  ! 1281: STBAR	stbar
	.word 0xc22a0009  ! 1284: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc80a0009  ! 1284: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xc3ea1009  ! 1284: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xe6320009  ! 1287: STH_R	sth	%r19, [%r8 + %r9]
	.word 0xce520009  ! 1287: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xf6022528  ! 1287: LDUW_I	lduw	[%r8 + 0x0528], %r27
	.word 0xc62a0009  ! 1290: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc7020009  ! 1290: LDF_R	ld	[%r8, %r9], %f3
	.word 0xca520009  ! 1290: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xc3220009  ! 1293: STF_R	st	%f1, [%r9, %r8]
	.word 0xfa4a0009  ! 1293: LDSB_R	ldsb	[%r8 + %r9], %r29
	.word 0xdaa22658  ! 1293: STWA_I	stwa	%r13, [%r8 + 0x0658] %asi
	.word 0xf8220009  ! 1296: STW_R	stw	%r28, [%r8 + %r9]
	.word 0xc31a0009  ! 1296: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xc8ba2cf8  ! 1296: STDA_I	stda	%r4, [%r8 + 0x0cf8] %asi
	.word 0xf6720009  ! 1299: STX_R	stx	%r27, [%r8 + %r9]
	.word 0xc7020009  ! 1299: LDF_R	ld	[%r8, %r9], %f3
	.word 0x8143c000  ! 1299: STBAR	stbar
	.word 0xcc2a0009  ! 1302: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc44a0009  ! 1302: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xc3ea279c  ! 1302: PREFETCHA_I	prefetcha	[%r8, + 0x079c] %asi, #one_read
	.word 0xf0220009  ! 1305: STW_R	stw	%r24, [%r8 + %r9]
	.word 0xea0a0009  ! 1305: LDUB_R	ldub	[%r8 + %r9], %r21
	.word 0x8143c000  ! 1305: STBAR	stbar
	.word 0xc6220009  ! 1308: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xdb020009  ! 1308: LDF_R	ld	[%r8, %r9], %f13
	.word 0xab222f28  ! 1308: MULScc_I	mulscc 	%r8, 0x0f28, %r21
	.word 0xc8320009  ! 1311: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xcc5a0009  ! 1311: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xc2aa2a0c  ! 1311: STBA_I	stba	%r1, [%r8 + 0x0a0c] %asi
	.word 0xfa720009  ! 1314: STX_R	stx	%r29, [%r8 + %r9]
	.word 0xe71a0009  ! 1314: LDDF_R	ldd	[%r8, %r9], %f19
	.word 0xbefa0009  ! 1314: SDIVcc_R	sdivcc 	%r8, %r9, %r31
	.word 0xf02a0009  ! 1317: STB_R	stb	%r24, [%r8 + %r9]
	.word 0xce5a0009  ! 1317: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0x8af20009  ! 1317: UDIVcc_R	udivcc 	%r8, %r9, %r5
	.word 0xcd220009  ! 1320: STF_R	st	%f6, [%r9, %r8]
	.word 0xfa520009  ! 1320: LDSH_R	ldsh	[%r8 + %r9], %r29
	.word 0x08800001  ! 1320: BLEU	bleu  	<label_0x1>
	.word 0xef220009  ! 1323: STF_R	st	%f23, [%r9, %r8]
	.word 0xcb020009  ! 1323: LDF_R	ld	[%r8, %r9], %f5
	.word 0xcca21009  ! 1323: STWA_R	stwa	%r6, [%r8 + %r9] 0x80
	.word 0xce320009  ! 1326: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xcc120009  ! 1326: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xc36a2df4  ! 1326: PREFETCH_I	prefetch	[%r8 + 0x0df4], #one_read
	.word 0xfd220009  ! 1329: STF_R	st	%f30, [%r9, %r8]
	.word 0xfc520009  ! 1329: LDSH_R	ldsh	[%r8 + %r9], %r30
	.word 0x9cda0009  ! 1329: SMULcc_R	smulcc 	%r8, %r9, %r14
	.word 0xff220009  ! 1332: STF_R	st	%f31, [%r9, %r8]
	.word 0xf2420009  ! 1332: LDSW_R	ldsw	[%r8 + %r9], %r25
	.word 0x8ad20009  ! 1332: UMULcc_R	umulcc 	%r8, %r9, %r5
	.word 0xcb3a0009  ! 1335: STDF_R	std	%f5, [%r9, %r8]
	.word 0xed1a0009  ! 1335: LDDF_R	ldd	[%r8, %r9], %f22
	.word 0xfd1a0009  ! 1335: LDDF_R	ldd	[%r8, %r9], %f30
	.word 0xc8320009  ! 1338: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xe4420009  ! 1338: LDSW_R	ldsw	[%r8 + %r9], %r18
	.word 0xd8f21009  ! 1338: STXA_R	stxa	%r12, [%r8 + %r9] 0x80
	.word 0xcf3a0009  ! 1341: STDF_R	std	%f7, [%r9, %r8]
	.word 0xfa020009  ! 1341: LDUW_R	lduw	[%r8 + %r9], %r29
	.word 0xf6f22910  ! 1341: STXA_I	stxa	%r27, [%r8 + 0x0910] %asi
	.word 0xc7220009  ! 1344: STF_R	st	%f3, [%r9, %r8]
	.word 0xe0120009  ! 1344: LDUH_R	lduh	[%r8 + %r9], %r16
	.word 0xc46a2108  ! 1344: LDSTUB_I	ldstub	%r2, [%r8 + 0x0108]
	.word 0xda2a0009  ! 1347: STB_R	stb	%r13, [%r8 + %r9]
	.word 0xc4420009  ! 1347: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0x2a800001  ! 1347: BCS	bcs,a	<label_0x1>
	.word 0xc8320009  ! 1350: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc4520009  ! 1350: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0x8ba20829  ! 1350: FADDs	fadds	%f8, %f9, %f5
	.word 0xf4720009  ! 1353: STX_R	stx	%r26, [%r8 + %r9]
	.word 0xc2520009  ! 1353: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xc2fa1009  ! 1353: SWAPA_R	swapa	%r1, [%r8 + %r9] 0x80
	.word 0xc2720009  ! 1356: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc8420009  ! 1356: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xb4da0009  ! 1356: SMULcc_R	smulcc 	%r8, %r9, %r26
	.word 0xcd220009  ! 1359: STF_R	st	%f6, [%r9, %r8]
	.word 0xc9020009  ! 1359: LDF_R	ld	[%r8, %r9], %f4
	.word 0x82da2fc0  ! 1359: SMULcc_I	smulcc 	%r8, 0x0fc0, %r1
	.word 0xe4720009  ! 1362: STX_R	stx	%r18, [%r8 + %r9]
	.word 0xce4a0009  ! 1362: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xc4f226c8  ! 1362: STXA_I	stxa	%r2, [%r8 + 0x06c8] %asi
	.word 0xce2a0009  ! 1365: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xee020009  ! 1365: LDUW_R	lduw	[%r8 + %r9], %r23
	.word 0xc91a2308  ! 1365: LDDF_I	ldd	[%r8, 0x0308], %f4
	.word 0xf93a0009  ! 1368: STDF_R	std	%f28, [%r9, %r8]
	.word 0xc6120009  ! 1368: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xc8822bb0  ! 1368: LDUWA_I	lduwa	[%r8, + 0x0bb0] %asi, %r4
	.word 0xc22a0009  ! 1371: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xcf020009  ! 1371: LDF_R	ld	[%r8, %r9], %f7
	.word 0x2e800001  ! 1371: BVS	bvs,a	<label_0x1>
	.word 0xc6220009  ! 1374: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xca4a0009  ! 1374: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xcada2098  ! 1374: LDXA_I	ldxa	[%r8, + 0x0098] %asi, %r5
	.word 0xc6720009  ! 1377: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xcc520009  ! 1377: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xc8c21009  ! 1377: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r4
	.word 0xfa2a0009  ! 1380: STB_R	stb	%r29, [%r8 + %r9]
	.word 0xcf1a0009  ! 1380: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0x22800001  ! 1380: BE	be,a	<label_0x1>
	.word 0xc2320009  ! 1383: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc91a0009  ! 1383: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0x9a720009  ! 1383: UDIV_R	udiv 	%r8, %r9, %r13
	.word 0xcf3a0009  ! 1386: STDF_R	std	%f7, [%r9, %r8]
	.word 0xce520009  ! 1386: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0x8143c000  ! 1386: STBAR	stbar
	.word 0xcc2a0009  ! 1389: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xcb020009  ! 1389: LDF_R	ld	[%r8, %r9], %f5
	.word 0x8143e076  ! 1389: MEMBAR	membar	#StoreLoad | #LoadStore | #Lookaside | #MemIssue | #Sync 
	.word 0xca2a0009  ! 1392: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xcd1a0009  ! 1392: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xc36a2fc0  ! 1392: PREFETCH_I	prefetch	[%r8 + 0x0fc0], #one_read
	.word 0xce320009  ! 1395: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xcc420009  ! 1395: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xeaea1009  ! 1395: LDSTUBA_R	ldstuba	%r21, [%r8 + %r9] 0x80
	.word 0xf4220009  ! 1398: STW_R	stw	%r26, [%r8 + %r9]
	.word 0xcd020009  ! 1398: LDF_R	ld	[%r8, %r9], %f6
	.word 0xbcf20009  ! 1398: UDIVcc_R	udivcc 	%r8, %r9, %r30
	.word 0xe4320009  ! 1401: STH_R	sth	%r18, [%r8 + %r9]
	.word 0xcc020009  ! 1401: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xcb222d48  ! 1401: STF_I	st	%f5, [0x0d48, %r8]
	.word 0xc7220009  ! 1404: STF_R	st	%f3, [%r9, %r8]
	.word 0xc71a0009  ! 1404: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0x8143c000  ! 1404: STBAR	stbar
	.word 0xc73a0009  ! 1407: STDF_R	std	%f3, [%r9, %r8]
	.word 0xda420009  ! 1407: LDSW_R	ldsw	[%r8 + %r9], %r13
	.word 0x8b2221bc  ! 1407: MULScc_I	mulscc 	%r8, 0x01bc, %r5
	.word 0xca220009  ! 1410: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xe1020009  ! 1410: LDF_R	ld	[%r8, %r9], %f16
	.word 0x26800001  ! 1410: BL	bl,a	<label_0x1>
	.word 0xce220009  ! 1413: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xde020009  ! 1413: LDUW_R	lduw	[%r8 + %r9], %r15
	.word 0x885a2b64  ! 1413: SMUL_I	smul 	%r8, 0x0b64, %r4
	.word 0xc82a0009  ! 1416: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc80a0009  ! 1416: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xecfa2d1c  ! 1416: SWAPA_I	swapa	%r22, [%r8 + 0x0d1c] %asi
	.word 0xd7220009  ! 1419: STF_R	st	%f11, [%r9, %r8]
	.word 0xc4020009  ! 1419: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xc36a28e0  ! 1419: PREFETCH_I	prefetch	[%r8 + 0x08e0], #one_read
	.word 0xce720009  ! 1422: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc84a0009  ! 1422: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0x8143c000  ! 1422: STBAR	stbar
	.word 0xf3220009  ! 1425: STF_R	st	%f25, [%r9, %r8]
	.word 0xc85a0009  ! 1425: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xc36a2d14  ! 1425: PREFETCH_I	prefetch	[%r8 + 0x0d14], #one_read
	.word 0xc9220009  ! 1428: STF_R	st	%f4, [%r9, %r8]
	.word 0xcd1a0009  ! 1428: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0x876a0009  ! 1428: SDIVX_R	sdivx	%r8, %r9, %r3
	.word 0xc2720009  ! 1431: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc80a0009  ! 1431: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xc3e21009  ! 1431: CASA_I	casa	[%r8] 0x80, %r9, %r1
	.word 0xcd3a0009  ! 1434: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc7020009  ! 1434: LDF_R	ld	[%r8, %r9], %f3
	.word 0xd8a22fb4  ! 1434: STWA_I	stwa	%r12, [%r8 + 0x0fb4] %asi
	.word 0xc3220009  ! 1437: STF_R	st	%f1, [%r9, %r8]
	.word 0xfe120009  ! 1437: LDUH_R	lduh	[%r8 + %r9], %r31
	.word 0xca7a2468  ! 1437: SWAP_I	swap	%r5, [%r8 + 0x0468]
	.word 0xcf3a0009  ! 1440: STDF_R	std	%f7, [%r9, %r8]
	.word 0xec0a0009  ! 1440: LDUB_R	ldub	[%r8 + %r9], %r22
	.word 0xc3ea2d04  ! 1440: PREFETCHA_I	prefetcha	[%r8, + 0x0d04] %asi, #one_read
	.word 0xdc720009  ! 1443: STX_R	stx	%r14, [%r8 + %r9]
	.word 0xcd1a0009  ! 1443: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0x8ba208a9  ! 1443: FSUBs	fsubs	%f8, %f9, %f5
	.word 0xc4320009  ! 1446: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xf4420009  ! 1446: LDSW_R	ldsw	[%r8 + %r9], %r26
	.word 0xdc5a0009  ! 1446: LDX_R	ldx	[%r8 + %r9], %r14
	.word 0xfe720009  ! 1449: STX_R	stx	%r31, [%r8 + %r9]
	.word 0xf8520009  ! 1449: LDSH_R	ldsh	[%r8 + %r9], %r28
	.word 0x847a2090  ! 1449: SDIV_I	sdiv 	%r8, 0x0090, %r2
	.word 0xe8320009  ! 1452: STH_R	sth	%r20, [%r8 + %r9]
	.word 0xe5020009  ! 1452: LDF_R	ld	[%r8, %r9], %f18
	.word 0xc26a218c  ! 1452: LDSTUB_I	ldstub	%r1, [%r8 + 0x018c]
	.word 0xce320009  ! 1455: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xcc120009  ! 1455: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xc3ea1009  ! 1455: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xe0220009  ! 1458: STW_R	stw	%r16, [%r8 + %r9]
	.word 0xc7020009  ! 1458: LDF_R	ld	[%r8, %r9], %f3
	.word 0x83a20829  ! 1458: FADDs	fadds	%f8, %f9, %f1
	.word 0xe8220009  ! 1461: STW_R	stw	%r20, [%r8 + %r9]
	.word 0xcc520009  ! 1461: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xc3ea25a4  ! 1461: PREFETCHA_I	prefetcha	[%r8, + 0x05a4] %asi, #one_read
	.word 0xca720009  ! 1464: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc6020009  ! 1464: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0x8143e04e  ! 1464: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Sync 
	.word 0xea720009  ! 1467: STX_R	stx	%r21, [%r8 + %r9]
	.word 0xcc120009  ! 1467: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0x06ca0001  ! 1467: BRLZ	brlz  ,pt	%8,<label_0xa0001>
	.word 0xee220009  ! 1470: STW_R	stw	%r23, [%r8 + %r9]
	.word 0xcb1a0009  ! 1470: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0x8143e077  ! 1470: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside | #MemIssue | #Sync 
	.word 0xf62a0009  ! 1473: STB_R	stb	%r27, [%r8 + %r9]
	.word 0xc4020009  ! 1473: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xcc9a2ab8  ! 1473: LDDA_I	ldda	[%r8, + 0x0ab8] %asi, %r6
	.word 0xc4320009  ! 1476: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xd71a0009  ! 1476: LDDF_R	ldd	[%r8, %r9], %f11
	.word 0x83a20929  ! 1476: FMULs	fmuls	%f8, %f9, %f1
	.word 0xc62a0009  ! 1479: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xf0020009  ! 1479: LDUW_R	lduw	[%r8 + %r9], %r24
	.word 0xc3ea1009  ! 1479: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xec720009  ! 1482: STX_R	stx	%r22, [%r8 + %r9]
	.word 0xea020009  ! 1482: LDUW_R	lduw	[%r8 + %r9], %r21
	.word 0xd93a2730  ! 1482: STDF_I	std	%f12, [0x0730, %r8]
	.word 0xc8720009  ! 1485: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xd85a0009  ! 1485: LDX_R	ldx	[%r8 + %r9], %r12
	.word 0xc6da21d8  ! 1485: LDXA_I	ldxa	[%r8, + 0x01d8] %asi, %r3
	.word 0xc42a0009  ! 1488: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xca420009  ! 1488: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xccba1009  ! 1488: STDA_R	stda	%r6, [%r8 + %r9] 0x80
	.word 0xc82a0009  ! 1491: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xf9020009  ! 1491: LDF_R	ld	[%r8, %r9], %f28
	.word 0xcea22ab4  ! 1491: STWA_I	stwa	%r7, [%r8 + 0x0ab4] %asi
	.word 0xca2a0009  ! 1494: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xfe0a0009  ! 1494: LDUB_R	ldub	[%r8 + %r9], %r31
	.word 0xc9e21009  ! 1494: CASA_I	casa	[%r8] 0x80, %r9, %r4
	.word 0xc7220009  ! 1497: STF_R	st	%f3, [%r9, %r8]
	.word 0xc45a0009  ! 1497: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xccfa2e7c  ! 1497: SWAPA_I	swapa	%r6, [%r8 + 0x0e7c] %asi
	.word 0xcb3a0009  ! 1500: STDF_R	std	%f5, [%r9, %r8]
	.word 0xc91a0009  ! 1500: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0x22800001  ! 1500: BE	be,a	<label_0x1>
	.word 0xc62a0009  ! 1503: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xcc0a0009  ! 1503: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xcf022614  ! 1503: LDF_I	ld	[%r8, 0x0614], %f7
	.word 0xc6320009  ! 1506: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xea4a0009  ! 1506: LDSB_R	ldsb	[%r8 + %r9], %r21
	.word 0x8fa20829  ! 1506: FADDs	fadds	%f8, %f9, %f7
	.word 0xda2a0009  ! 1509: STB_R	stb	%r13, [%r8 + %r9]
	.word 0xc8020009  ! 1509: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xe86a2a64  ! 1509: LDSTUB_I	ldstub	%r20, [%r8 + 0x0a64]
	.word 0xc2720009  ! 1512: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc44a0009  ! 1512: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xc6ca1009  ! 1512: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r3
	.word 0xca720009  ! 1515: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xee520009  ! 1515: LDSH_R	ldsh	[%r8 + %r9], %r23
	.word 0x887a0009  ! 1515: SDIV_R	sdiv 	%r8, %r9, %r4
	.word 0xc9220009  ! 1518: STF_R	st	%f4, [%r9, %r8]
	.word 0xd91a0009  ! 1518: LDDF_R	ldd	[%r8, %r9], %f12
	.word 0x04c20001  ! 1518: BRLEZ	brlez  ,nt	%8,<label_0x20001>
	.word 0xee320009  ! 1521: STH_R	sth	%r23, [%r8 + %r9]
	.word 0xcb020009  ! 1521: LDF_R	ld	[%r8, %r9], %f5
	.word 0x16800001  ! 1521: BGE	bge  	<label_0x1>
	.word 0xdf3a0009  ! 1524: STDF_R	std	%f15, [%r9, %r8]
	.word 0xcf020009  ! 1524: LDF_R	ld	[%r8, %r9], %f7
	.word 0x16800001  ! 1524: BGE	bge  	<label_0x1>
	.word 0xc9220009  ! 1527: STF_R	st	%f4, [%r9, %r8]
	.word 0xec520009  ! 1527: LDSH_R	ldsh	[%r8 + %r9], %r22
	.word 0xcf3a0009  ! 1527: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc5220009  ! 1530: STF_R	st	%f2, [%r9, %r8]
	.word 0xdc0a0009  ! 1530: LDUB_R	ldub	[%r8 + %r9], %r14
	.word 0x3c800002  ! 1530: BPOS	bpos,a	<label_0x2>
	.word 0xc2720009  ! 1533: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc4020009  ! 1533: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0x8ed22cc4  ! 1533: UMULcc_I	umulcc 	%r8, 0x0cc4, %r7
	.word 0xcf3a0009  ! 1536: STDF_R	std	%f7, [%r9, %r8]
	.word 0xcc120009  ! 1536: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xce420009  ! 1536: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xc8320009  ! 1539: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc2420009  ! 1539: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0x98da0009  ! 1539: SMULcc_R	smulcc 	%r8, %r9, %r12
	.word 0xea720009  ! 1542: STX_R	stx	%r21, [%r8 + %r9]
	.word 0xe0020009  ! 1542: LDUW_R	lduw	[%r8 + %r9], %r16
	.word 0xc8c2286c  ! 1542: LDSWA_I	ldswa	[%r8, + 0x086c] %asi, %r4
	.word 0xe4220009  ! 1545: STW_R	stw	%r18, [%r8 + %r9]
	.word 0xe44a0009  ! 1545: LDSB_R	ldsb	[%r8 + %r9], %r18
	.word 0xcff22009  ! 1545: CASXA_R	casxa	[%r8]%asi, %r9, %r7
	.word 0xe82a0009  ! 1548: STB_R	stb	%r20, [%r8 + %r9]
	.word 0xe25a0009  ! 1548: LDX_R	ldx	[%r8 + %r9], %r17
	.word 0xa4522578  ! 1548: UMUL_I	umul 	%r8, 0x0578, %r18
	.word 0xc42a0009  ! 1551: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc51a0009  ! 1551: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0x24800002  ! 1551: BLE	ble,a	<label_0x2>
	.word 0xc4320009  ! 1554: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xfc5a0009  ! 1554: LDX_R	ldx	[%r8 + %r9], %r30
	.word 0xbe520009  ! 1554: UMUL_R	umul 	%r8, %r9, %r31
	.word 0xc73a0009  ! 1557: STDF_R	std	%f3, [%r9, %r8]
	.word 0xca020009  ! 1557: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xc36a2b68  ! 1557: PREFETCH_I	prefetch	[%r8 + 0x0b68], #one_read
	.word 0xcc2a0009  ! 1560: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xfe420009  ! 1560: LDSW_R	ldsw	[%r8 + %r9], %r31
	.word 0xcc4a238c  ! 1560: LDSB_I	ldsb	[%r8 + 0x038c], %r6
	.word 0xc4720009  ! 1563: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xcf020009  ! 1563: LDF_R	ld	[%r8, %r9], %f7
	.word 0x8143c000  ! 1563: STBAR	stbar
	.word 0xc6720009  ! 1566: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc6520009  ! 1566: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xdc520009  ! 1566: LDSH_R	ldsh	[%r8 + %r9], %r14
	.word 0xcf3a0009  ! 1569: STDF_R	std	%f7, [%r9, %r8]
	.word 0xf25a0009  ! 1569: LDX_R	ldx	[%r8 + %r9], %r25
	.word 0xdcf22560  ! 1569: STXA_I	stxa	%r14, [%r8 + 0x0560] %asi
	.word 0xca2a0009  ! 1572: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc6020009  ! 1572: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0x02c20001  ! 1572: BRZ	brz  ,nt	%8,<label_0x20001>
	.word 0xdc220009  ! 1575: STW_R	stw	%r14, [%r8 + %r9]
	.word 0xcc4a0009  ! 1575: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xcf220009  ! 1575: STF_R	st	%f7, [%r9, %r8]
	.word 0xc82a0009  ! 1578: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xda120009  ! 1578: LDUH_R	lduh	[%r8 + %r9], %r13
	.word 0x87a208a9  ! 1578: FSUBs	fsubs	%f8, %f9, %f3
	.word 0xca2a0009  ! 1581: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xf4420009  ! 1581: LDSW_R	ldsw	[%r8 + %r9], %r26
	.word 0xc3ea1009  ! 1581: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xce220009  ! 1584: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc3020009  ! 1584: LDF_R	ld	[%r8, %r9], %f1
	.word 0xc47a0009  ! 1584: SWAP_R	swap	%r2, [%r8 + %r9]
	.word 0xed220009  ! 1587: STF_R	st	%f22, [%r9, %r8]
	.word 0xcc120009  ! 1587: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0x8143c000  ! 1587: STBAR	stbar
	.word 0xcc2a0009  ! 1590: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xf51a0009  ! 1590: LDDF_R	ldd	[%r8, %r9], %f26
	.word 0xecf21009  ! 1590: STXA_R	stxa	%r22, [%r8 + %r9] 0x80
	.word 0xe6720009  ! 1593: STX_R	stx	%r19, [%r8 + %r9]
	.word 0xc24a0009  ! 1593: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xc36a2420  ! 1593: PREFETCH_I	prefetch	[%r8 + 0x0420], #one_read
	.word 0xdf3a0009  ! 1596: STDF_R	std	%f15, [%r9, %r8]
	.word 0xe8420009  ! 1596: LDSW_R	ldsw	[%r8 + %r9], %r20
	.word 0xc3e22009  ! 1596: CASA_R	casa	[%r8] %asi, %r9, %r1
	.word 0xf4220009  ! 1599: STW_R	stw	%r26, [%r8 + %r9]
	.word 0xda4a0009  ! 1599: LDSB_R	ldsb	[%r8 + %r9], %r13
	.word 0xc2922dbc  ! 1599: LDUHA_I	lduha	[%r8, + 0x0dbc] %asi, %r1
	.word 0xc73a0009  ! 1602: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc2520009  ! 1602: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xcac229f0  ! 1602: LDSWA_I	ldswa	[%r8, + 0x09f0] %asi, %r5
	.word 0xee220009  ! 1605: STW_R	stw	%r23, [%r8 + %r9]
	.word 0xea520009  ! 1605: LDSH_R	ldsh	[%r8 + %r9], %r21
	.word 0x8ba20829  ! 1605: FADDs	fadds	%f8, %f9, %f5
	.word 0xdd3a0009  ! 1608: STDF_R	std	%f14, [%r9, %r8]
	.word 0xcc020009  ! 1608: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xceb21009  ! 1608: STHA_R	stha	%r7, [%r8 + %r9] 0x80
	.word 0xec320009  ! 1611: STH_R	sth	%r22, [%r8 + %r9]
	.word 0xd6120009  ! 1611: LDUH_R	lduh	[%r8 + %r9], %r11
	.word 0xc8422c40  ! 1611: LDSW_I	ldsw	[%r8 + 0x0c40], %r4
	.word 0xcb3a0009  ! 1614: STDF_R	std	%f5, [%r9, %r8]
	.word 0xc45a0009  ! 1614: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0x864a2e8c  ! 1614: MULX_I	mulx 	%r8, 0x0e8c, %r3
	.word 0xea220009  ! 1617: STW_R	stw	%r21, [%r8 + %r9]
	.word 0xc44a0009  ! 1617: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xc6d22c5c  ! 1617: LDSHA_I	ldsha	[%r8, + 0x0c5c] %asi, %r3
	.word 0xce2a0009  ! 1620: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xee520009  ! 1620: LDSH_R	ldsh	[%r8 + %r9], %r23
	.word 0x84d224bc  ! 1620: UMULcc_I	umulcc 	%r8, 0x04bc, %r2
	.word 0xcc720009  ! 1623: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xff1a0009  ! 1623: LDDF_R	ldd	[%r8, %r9], %f31
	.word 0xc70226dc  ! 1623: LDF_I	ld	[%r8, 0x06dc], %f3
	.word 0xd8720009  ! 1626: STX_R	stx	%r12, [%r8 + %r9]
	.word 0xc71a0009  ! 1626: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xe3e21009  ! 1626: CASA_I	casa	[%r8] 0x80, %r9, %r17
	.word 0xe8720009  ! 1629: STX_R	stx	%r20, [%r8 + %r9]
	.word 0xcd020009  ! 1629: LDF_R	ld	[%r8, %r9], %f6
	.word 0x85222624  ! 1629: MULScc_I	mulscc 	%r8, 0x0624, %r2
	.word 0xc73a0009  ! 1632: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc4520009  ! 1632: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xcbe21009  ! 1632: CASA_I	casa	[%r8] 0x80, %r9, %r5
	.word 0xcd3a0009  ! 1635: STDF_R	std	%f6, [%r9, %r8]
	.word 0xe84a0009  ! 1635: LDSB_R	ldsb	[%r8 + %r9], %r20
	.word 0x8c520009  ! 1635: UMUL_R	umul 	%r8, %r9, %r6
	.word 0xde720009  ! 1638: STX_R	stx	%r15, [%r8 + %r9]
	.word 0xc25a0009  ! 1638: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xc4ba2bf8  ! 1638: STDA_I	stda	%r2, [%r8 + 0x0bf8] %asi
	.word 0xc42a0009  ! 1641: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xdc420009  ! 1641: LDSW_R	ldsw	[%r8 + %r9], %r14
	.word 0x22c20001  ! 1641: BRZ	brz,a,nt	%8,<label_0x20001>
	.word 0xee720009  ! 1644: STX_R	stx	%r23, [%r8 + %r9]
	.word 0xc3020009  ! 1644: LDF_R	ld	[%r8, %r9], %f1
	.word 0xc85a2d20  ! 1644: LDX_I	ldx	[%r8 + 0x0d20], %r4
	.word 0xc9220009  ! 1647: STF_R	st	%f4, [%r9, %r8]
	.word 0xc6520009  ! 1647: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0x04800001  ! 1647: BLE	ble  	<label_0x1>
	.word 0xca320009  ! 1650: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xca520009  ! 1650: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xf4ba1009  ! 1650: STDA_R	stda	%r26, [%r8 + %r9] 0x80
	.word 0xf4320009  ! 1653: STH_R	sth	%r26, [%r8 + %r9]
	.word 0xca520009  ! 1653: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0x0c800002  ! 1653: BNEG	bneg  	<label_0x2>
	.word 0xc8220009  ! 1656: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc84a0009  ! 1656: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0x9cd20009  ! 1656: UMULcc_R	umulcc 	%r8, %r9, %r14
	.word 0xf5220009  ! 1659: STF_R	st	%f26, [%r9, %r8]
	.word 0xcb020009  ! 1659: LDF_R	ld	[%r8, %r9], %f5
	.word 0x26c20001  ! 1659: BRLZ	brlz,a,nt	%8,<label_0x20001>
	.word 0xc82a0009  ! 1662: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xcc020009  ! 1662: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xc3ea21a0  ! 1662: PREFETCHA_I	prefetcha	[%r8, + 0x01a0] %asi, #one_read
	.word 0xcf220009  ! 1665: STF_R	st	%f7, [%r9, %r8]
	.word 0xd91a0009  ! 1665: LDDF_R	ldd	[%r8, %r9], %f12
	.word 0xce7a22ac  ! 1665: SWAP_I	swap	%r7, [%r8 + 0x02ac]
	.word 0xc8320009  ! 1668: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc51a0009  ! 1668: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xc36a20e0  ! 1668: PREFETCH_I	prefetch	[%r8 + 0x00e0], #one_read
	.word 0xc5220009  ! 1671: STF_R	st	%f2, [%r9, %r8]
	.word 0xdc420009  ! 1671: LDSW_R	ldsw	[%r8 + %r9], %r14
	.word 0xc2922030  ! 1671: LDUHA_I	lduha	[%r8, + 0x0030] %asi, %r1
	.word 0xf9220009  ! 1674: STF_R	st	%f28, [%r9, %r8]
	.word 0xcb1a0009  ! 1674: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xc24a28cc  ! 1674: LDSB_I	ldsb	[%r8 + 0x08cc], %r1
	.word 0xf8220009  ! 1677: STW_R	stw	%r28, [%r8 + %r9]
	.word 0xc5020009  ! 1677: LDF_R	ld	[%r8, %r9], %f2
	.word 0x8143c000  ! 1677: STBAR	stbar
	.word 0xc4220009  ! 1680: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xcc420009  ! 1680: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0x8143c000  ! 1680: STBAR	stbar
	.word 0xe4720009  ! 1683: STX_R	stx	%r18, [%r8 + %r9]
	.word 0xce120009  ! 1683: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0x06800001  ! 1683: BL	bl  	<label_0x1>
	.word 0xcc720009  ! 1686: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xe8420009  ! 1686: LDSW_R	ldsw	[%r8 + %r9], %r20
	.word 0xcf2224b4  ! 1686: STF_I	st	%f7, [0x04b4, %r8]
	.word 0xfe320009  ! 1689: STH_R	sth	%r31, [%r8 + %r9]
	.word 0xfa020009  ! 1689: LDUW_R	lduw	[%r8 + %r9], %r29
	.word 0xc80a2ca4  ! 1689: LDUB_I	ldub	[%r8 + 0x0ca4], %r4
	.word 0xc2720009  ! 1692: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc7020009  ! 1692: LDF_R	ld	[%r8, %r9], %f3
	.word 0xf25a26e8  ! 1692: LDX_I	ldx	[%r8 + 0x06e8], %r25
	.word 0xdf220009  ! 1695: STF_R	st	%f15, [%r9, %r8]
	.word 0xc80a0009  ! 1695: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xaed22884  ! 1695: UMULcc_I	umulcc 	%r8, 0x0884, %r23
	.word 0xcf3a0009  ! 1698: STDF_R	std	%f7, [%r9, %r8]
	.word 0xcd1a0009  ! 1698: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xc8aa1009  ! 1698: STBA_R	stba	%r4, [%r8 + %r9] 0x80
	.word 0xf93a0009  ! 1701: STDF_R	std	%f28, [%r9, %r8]
	.word 0xe0120009  ! 1701: LDUH_R	lduh	[%r8 + %r9], %r16
	.word 0xc2ca2840  ! 1701: LDSBA_I	ldsba	[%r8, + 0x0840] %asi, %r1
	.word 0xc3220009  ! 1704: STF_R	st	%f1, [%r9, %r8]
	.word 0xc31a0009  ! 1704: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xdc821009  ! 1704: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r14
	.word 0xc2320009  ! 1707: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xce0a0009  ! 1707: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xd72220a4  ! 1707: STF_I	st	%f11, [0x00a4, %r8]
	.word 0xc62a0009  ! 1710: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc31a0009  ! 1710: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0x9d6a2ae4  ! 1710: SDIVX_I	sdivx	%r8, 0x0ae4, %r14
	.word 0xc53a0009  ! 1713: STDF_R	std	%f2, [%r9, %r8]
	.word 0xf91a0009  ! 1713: LDDF_R	ldd	[%r8, %r9], %f28
	.word 0x24ca0001  ! 1713: BRLEZ	brlez,a,pt	%8,<label_0xa0001>
	.word 0xc42a0009  ! 1716: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xf4020009  ! 1716: LDUW_R	lduw	[%r8 + %r9], %r26
	.word 0x83a209a9  ! 1716: FDIVs	fdivs	%f8, %f9, %f1
	.word 0xde2a0009  ! 1719: STB_R	stb	%r15, [%r8 + %r9]
	.word 0xc6420009  ! 1719: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xa16a2764  ! 1719: SDIVX_I	sdivx	%r8, 0x0764, %r16
	.word 0xe02a0009  ! 1722: STB_R	stb	%r16, [%r8 + %r9]
	.word 0xca020009  ! 1722: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xa8520009  ! 1722: UMUL_R	umul 	%r8, %r9, %r20
	.word 0xec320009  ! 1725: STH_R	sth	%r22, [%r8 + %r9]
	.word 0xf24a0009  ! 1725: LDSB_R	ldsb	[%r8 + %r9], %r25
	.word 0x8b222094  ! 1725: MULScc_I	mulscc 	%r8, 0x0094, %r5
	.word 0xc2720009  ! 1728: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc64a0009  ! 1728: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xfea21009  ! 1728: STWA_R	stwa	%r31, [%r8 + %r9] 0x80
	.word 0xfc2a0009  ! 1731: STB_R	stb	%r30, [%r8 + %r9]
	.word 0xe04a0009  ! 1731: LDSB_R	ldsb	[%r8 + %r9], %r16
	.word 0x06800002  ! 1731: BL	bl  	<label_0x2>
	.word 0xd8720009  ! 1734: STX_R	stx	%r12, [%r8 + %r9]
	.word 0xc4420009  ! 1734: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xc44221c0  ! 1734: LDSW_I	ldsw	[%r8 + 0x01c0], %r2
	.word 0xf7220009  ! 1737: STF_R	st	%f27, [%r9, %r8]
	.word 0xc31a0009  ! 1737: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0x87a20929  ! 1737: FMULs	fmuls	%f8, %f9, %f3
	.word 0xfe2a0009  ! 1740: STB_R	stb	%r31, [%r8 + %r9]
	.word 0xc4020009  ! 1740: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0x8b220009  ! 1740: MULScc_R	mulscc 	%r8, %r9, %r5
	.word 0xca2a0009  ! 1743: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xda4a0009  ! 1743: LDSB_R	ldsb	[%r8 + %r9], %r13
	.word 0xfaea21c4  ! 1743: LDSTUBA_I	ldstuba	%r29, [%r8 + 0x01c4] %asi
	.word 0xc93a0009  ! 1746: STDF_R	std	%f4, [%r9, %r8]
	.word 0xc64a0009  ! 1746: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xccf21009  ! 1746: STXA_R	stxa	%r6, [%r8 + %r9] 0x80
	.word 0xda720009  ! 1749: STX_R	stx	%r13, [%r8 + %r9]
	.word 0xca120009  ! 1749: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xfc8a1009  ! 1749: LDUBA_R	lduba	[%r8, %r9] 0x80, %r30
	.word 0xc62a0009  ! 1752: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc7020009  ! 1752: LDF_R	ld	[%r8, %r9], %f3
	.word 0x8c522bdc  ! 1752: UMUL_I	umul 	%r8, 0x0bdc, %r6
	.word 0xce2a0009  ! 1755: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc44a0009  ! 1755: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0x88d20009  ! 1755: UMULcc_R	umulcc 	%r8, %r9, %r4
	.word 0xc8220009  ! 1758: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc51a0009  ! 1758: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xc3ea2830  ! 1758: PREFETCHA_I	prefetcha	[%r8, + 0x0830] %asi, #one_read
	.word 0xc33a0009  ! 1761: STDF_R	std	%f1, [%r9, %r8]
	.word 0xcc420009  ! 1761: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xada209a9  ! 1761: FDIVs	fdivs	%f8, %f9, %f22
	.word 0xc2220009  ! 1764: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc64a0009  ! 1764: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0x8cda25d4  ! 1764: SMULcc_I	smulcc 	%r8, 0x05d4, %r6
	.word 0xf8320009  ! 1767: STH_R	sth	%r28, [%r8 + %r9]
	.word 0xc25a0009  ! 1767: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xfa120009  ! 1767: LDUH_R	lduh	[%r8 + %r9], %r29
	.word 0xc4220009  ! 1770: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xf7020009  ! 1770: LDF_R	ld	[%r8, %r9], %f27
	.word 0xe71a0009  ! 1770: LDDF_R	ldd	[%r8, %r9], %f19
	.word 0xcb220009  ! 1773: STF_R	st	%f5, [%r9, %r8]
	.word 0xc4120009  ! 1773: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xe5222b68  ! 1773: STF_I	st	%f18, [0x0b68, %r8]
	.word 0xcd3a0009  ! 1776: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc8020009  ! 1776: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xc3ea280c  ! 1776: PREFETCHA_I	prefetcha	[%r8, + 0x080c] %asi, #one_read
	.word 0xcd220009  ! 1779: STF_R	st	%f6, [%r9, %r8]
	.word 0xf85a0009  ! 1779: LDX_R	ldx	[%r8 + %r9], %r28
	.word 0x02ca0001  ! 1779: BRZ	brz  ,pt	%8,<label_0xa0001>
	.word 0xe42a0009  ! 1782: STB_R	stb	%r18, [%r8 + %r9]
	.word 0xc44a0009  ! 1782: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0x04ca0001  ! 1782: BRLEZ	brlez  ,pt	%8,<label_0xa0001>
	.word 0xcc2a0009  ! 1785: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc8120009  ! 1785: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xf1220009  ! 1785: STF_R	st	%f24, [%r9, %r8]
	.word 0xf0720009  ! 1788: STX_R	stx	%r24, [%r8 + %r9]
	.word 0xc4020009  ! 1788: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xaba20929  ! 1788: FMULs	fmuls	%f8, %f9, %f21
	.word 0xf8220009  ! 1791: STW_R	stw	%r28, [%r8 + %r9]
	.word 0xcc020009  ! 1791: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xdec22e5c  ! 1791: LDSWA_I	ldswa	[%r8, + 0x0e5c] %asi, %r15
	.word 0xcf220009  ! 1794: STF_R	st	%f7, [%r9, %r8]
	.word 0xcb020009  ! 1794: LDF_R	ld	[%r8, %r9], %f5
	.word 0xaed20009  ! 1794: UMULcc_R	umulcc 	%r8, %r9, %r23
	.word 0xc2320009  ! 1797: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc44a0009  ! 1797: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xcaaa2d9c  ! 1797: STBA_I	stba	%r5, [%r8 + 0x0d9c] %asi
	.word 0xc8220009  ! 1800: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xf0520009  ! 1800: LDSH_R	ldsh	[%r8 + %r9], %r24
	.word 0xc8ba23c8  ! 1800: STDA_I	stda	%r4, [%r8 + 0x03c8] %asi
	.word 0xc6320009  ! 1803: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc9020009  ! 1803: LDF_R	ld	[%r8, %r9], %f4
	.word 0xccda1009  ! 1803: LDXA_R	ldxa	[%r8, %r9] 0x80, %r6
	.word 0xcb3a0009  ! 1806: STDF_R	std	%f5, [%r9, %r8]
	.word 0xee420009  ! 1806: LDSW_R	ldsw	[%r8 + %r9], %r23
	.word 0x1a800001  ! 1806: BCC	bcc  	<label_0x1>
	.word 0xc6720009  ! 1809: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xca120009  ! 1809: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0x84da2b7c  ! 1809: SMULcc_I	smulcc 	%r8, 0x0b7c, %r2
	.word 0xed3a0009  ! 1812: STDF_R	std	%f22, [%r9, %r8]
	.word 0xc51a0009  ! 1812: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0x82f20009  ! 1812: UDIVcc_R	udivcc 	%r8, %r9, %r1
	.word 0xcc320009  ! 1815: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xcc120009  ! 1815: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0x22c20001  ! 1815: BRZ	brz,a,nt	%8,<label_0x20001>
	.word 0xc6720009  ! 1818: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xcd020009  ! 1818: LDF_R	ld	[%r8, %r9], %f6
	.word 0xe6821009  ! 1818: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r19
	.word 0xc8320009  ! 1821: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc60a0009  ! 1821: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xb6520009  ! 1821: UMUL_R	umul 	%r8, %r9, %r27
	.word 0xc2220009  ! 1824: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc31a0009  ! 1824: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xc3ea1009  ! 1824: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xcf3a0009  ! 1827: STDF_R	std	%f7, [%r9, %r8]
	.word 0xcc120009  ! 1827: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0x8143c000  ! 1827: STBAR	stbar
	.word 0xc2320009  ! 1830: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xcf1a0009  ! 1830: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xe6ca1009  ! 1830: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r19
	.word 0xef220009  ! 1833: STF_R	st	%f23, [%r9, %r8]
	.word 0xc51a0009  ! 1833: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0x2c800001  ! 1833: BNEG	bneg,a	<label_0x1>
	.word 0xce720009  ! 1836: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc4520009  ! 1836: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xd8fa1009  ! 1836: SWAPA_R	swapa	%r12, [%r8 + %r9] 0x80
	.word 0xca720009  ! 1839: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc45a0009  ! 1839: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xf28a1009  ! 1839: LDUBA_R	lduba	[%r8, %r9] 0x80, %r25
	.word 0xce720009  ! 1842: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xcc5a0009  ! 1842: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xcaea21d4  ! 1842: LDSTUBA_I	ldstuba	%r5, [%r8 + 0x01d4] %asi
	.word 0xce720009  ! 1845: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xe00a0009  ! 1845: LDUB_R	ldub	[%r8 + %r9], %r16
	.word 0xceb21009  ! 1845: STHA_R	stha	%r7, [%r8 + %r9] 0x80
	.word 0xc2720009  ! 1848: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xcd020009  ! 1848: LDF_R	ld	[%r8, %r9], %f6
	.word 0xc4ea2be4  ! 1848: LDSTUBA_I	ldstuba	%r2, [%r8 + 0x0be4] %asi
	.word 0xc8720009  ! 1851: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc8020009  ! 1851: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xe8f225d8  ! 1851: STXA_I	stxa	%r20, [%r8 + 0x05d8] %asi
	.word 0xfa2a0009  ! 1854: STB_R	stb	%r29, [%r8 + %r9]
	.word 0xd60a0009  ! 1854: LDUB_R	ldub	[%r8 + %r9], %r11
	.word 0x8143c000  ! 1854: STBAR	stbar
	.word 0xc5220009  ! 1857: STF_R	st	%f2, [%r9, %r8]
	.word 0xcf020009  ! 1857: LDF_R	ld	[%r8, %r9], %f7
	.word 0xceea1009  ! 1857: LDSTUBA_R	ldstuba	%r7, [%r8 + %r9] 0x80
	.word 0xc2320009  ! 1860: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc24a0009  ! 1860: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xc36a0009  ! 1860: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc8320009  ! 1863: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xcc0a0009  ! 1863: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xc2da1009  ! 1863: LDXA_R	ldxa	[%r8, %r9] 0x80, %r1
	.word 0xed220009  ! 1866: STF_R	st	%f22, [%r9, %r8]
	.word 0xca420009  ! 1866: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0x26800001  ! 1866: BL	bl,a	<label_0x1>
	.word 0xd93a0009  ! 1869: STDF_R	std	%f12, [%r9, %r8]
	.word 0xc84a0009  ! 1869: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xccf21009  ! 1869: STXA_R	stxa	%r6, [%r8 + %r9] 0x80
	.word 0xf7220009  ! 1872: STF_R	st	%f27, [%r9, %r8]
	.word 0xcf020009  ! 1872: LDF_R	ld	[%r8, %r9], %f7
	.word 0x87a209a9  ! 1872: FDIVs	fdivs	%f8, %f9, %f3
	.word 0xcf220009  ! 1875: STF_R	st	%f7, [%r9, %r8]
	.word 0xea120009  ! 1875: LDUH_R	lduh	[%r8 + %r9], %r21
	.word 0xc2c21009  ! 1875: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r1
	.word 0xc73a0009  ! 1878: STDF_R	std	%f3, [%r9, %r8]
	.word 0xd6420009  ! 1878: LDSW_R	ldsw	[%r8 + %r9], %r11
	.word 0xf6f21009  ! 1878: STXA_R	stxa	%r27, [%r8 + %r9] 0x80
	.word 0xc7220009  ! 1881: STF_R	st	%f3, [%r9, %r8]
	.word 0xc6520009  ! 1881: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xc36a0009  ! 1881: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xd6720009  ! 1884: STX_R	stx	%r11, [%r8 + %r9]
	.word 0xc2520009  ! 1884: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0x8143e058  ! 1884: MEMBAR	membar	#StoreStore | #Lookaside | #Sync 
	.word 0xec220009  ! 1887: STW_R	stw	%r22, [%r8 + %r9]
	.word 0xc45a0009  ! 1887: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xc7f21009  ! 1887: CASXA_I	casxa	[%r8] 0x80, %r9, %r3
	.word 0xf33a0009  ! 1890: STDF_R	std	%f25, [%r9, %r8]
	.word 0xc6420009  ! 1890: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xcef21009  ! 1890: STXA_R	stxa	%r7, [%r8 + %r9] 0x80
	.word 0xcc320009  ! 1893: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xfc520009  ! 1893: LDSH_R	ldsh	[%r8 + %r9], %r30
	.word 0xf1f22009  ! 1893: CASXA_R	casxa	[%r8]%asi, %r9, %r24
	.word 0xea320009  ! 1896: STH_R	sth	%r21, [%r8 + %r9]
	.word 0xcc520009  ! 1896: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xc2ea2cf0  ! 1896: LDSTUBA_I	ldstuba	%r1, [%r8 + 0x0cf0] %asi
	.word 0xcd220009  ! 1899: STF_R	st	%f6, [%r9, %r8]
	.word 0xc20a0009  ! 1899: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0x8143c000  ! 1899: STBAR	stbar
	.word 0xcf220009  ! 1902: STF_R	st	%f7, [%r9, %r8]
	.word 0xcc420009  ! 1902: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0x8143e00b  ! 1902: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore 
	.word 0xeb220009  ! 1905: STF_R	st	%f21, [%r9, %r8]
	.word 0xce520009  ! 1905: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xcf3a0009  ! 1905: STDF_R	std	%f7, [%r9, %r8]
	.word 0xcd3a0009  ! 1908: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc8520009  ! 1908: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0x9e522d0c  ! 1908: UMUL_I	umul 	%r8, 0x0d0c, %r15
	.word 0xc5220009  ! 1911: STF_R	st	%f2, [%r9, %r8]
	.word 0xfa020009  ! 1911: LDUW_R	lduw	[%r8 + %r9], %r29
	.word 0xea922420  ! 1911: LDUHA_I	lduha	[%r8, + 0x0420] %asi, %r21
	.word 0xf1220009  ! 1914: STF_R	st	%f24, [%r9, %r8]
	.word 0xc8120009  ! 1914: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xc5e22009  ! 1914: CASA_R	casa	[%r8] %asi, %r9, %r2
	.word 0xc2320009  ! 1917: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xcc520009  ! 1917: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0x824a26dc  ! 1917: MULX_I	mulx 	%r8, 0x06dc, %r1
	.word 0xeb3a0009  ! 1920: STDF_R	std	%f21, [%r9, %r8]
	.word 0xc6520009  ! 1920: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0x8e5a2f90  ! 1920: SMUL_I	smul 	%r8, 0x0f90, %r7
	.word 0xc2220009  ! 1923: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc20a0009  ! 1923: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xcc7a27dc  ! 1923: SWAP_I	swap	%r6, [%r8 + 0x07dc]
	.word 0xcf220009  ! 1926: STF_R	st	%f7, [%r9, %r8]
	.word 0xf25a0009  ! 1926: LDX_R	ldx	[%r8 + %r9], %r25
	.word 0x2aca0001  ! 1926: BRNZ	brnz,a,pt	%8,<label_0xa0001>
	.word 0xdd220009  ! 1929: STF_R	st	%f14, [%r9, %r8]
	.word 0xcd1a0009  ! 1929: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0x82520009  ! 1929: UMUL_R	umul 	%r8, %r9, %r1
	.word 0xc6720009  ! 1932: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc4420009  ! 1932: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xc9f21009  ! 1932: CASXA_I	casxa	[%r8] 0x80, %r9, %r4
	.word 0xcd220009  ! 1935: STF_R	st	%f6, [%r9, %r8]
	.word 0xca0a0009  ! 1935: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xcaa22b54  ! 1935: STWA_I	stwa	%r5, [%r8 + 0x0b54] %asi
	.word 0xec2a0009  ! 1938: STB_R	stb	%r22, [%r8 + %r9]
	.word 0xc6120009  ! 1938: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xcd220009  ! 1938: STF_R	st	%f6, [%r9, %r8]
	.word 0xc5220009  ! 1941: STF_R	st	%f2, [%r9, %r8]
	.word 0xde5a0009  ! 1941: LDX_R	ldx	[%r8 + %r9], %r15
	.word 0xebf22009  ! 1941: CASXA_R	casxa	[%r8]%asi, %r9, %r21
	.word 0xc9220009  ! 1944: STF_R	st	%f4, [%r9, %r8]
	.word 0xc31a0009  ! 1944: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xcc7a228c  ! 1944: SWAP_I	swap	%r6, [%r8 + 0x028c]
	.word 0xca2a0009  ! 1947: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xf0020009  ! 1947: LDUW_R	lduw	[%r8 + %r9], %r24
	.word 0xdb020009  ! 1947: LDF_R	ld	[%r8, %r9], %f13
	.word 0xef3a0009  ! 1950: STDF_R	std	%f23, [%r9, %r8]
	.word 0xc8520009  ! 1950: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xec1224e0  ! 1950: LDUH_I	lduh	[%r8 + 0x04e0], %r22
	.word 0xc42a0009  ! 1953: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc9020009  ! 1953: LDF_R	ld	[%r8, %r9], %f4
	.word 0xf4922c30  ! 1953: LDUHA_I	lduha	[%r8, + 0x0c30] %asi, %r26
	.word 0xcc2a0009  ! 1956: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc8420009  ! 1956: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0x8143e012  ! 1956: MEMBAR	membar	#StoreLoad | #Lookaside 
	.word 0xf4320009  ! 1959: STH_R	sth	%r26, [%r8 + %r9]
	.word 0xcc5a0009  ! 1959: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xc66a24a4  ! 1959: LDSTUB_I	ldstub	%r3, [%r8 + 0x04a4]
	.word 0xe2220009  ! 1962: STW_R	stw	%r17, [%r8 + %r9]
	.word 0xc51a0009  ! 1962: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xc93a0009  ! 1962: STDF_R	std	%f4, [%r9, %r8]
	.word 0xd73a0009  ! 1965: STDF_R	std	%f11, [%r9, %r8]
	.word 0xfc420009  ! 1965: LDSW_R	ldsw	[%r8 + %r9], %r30
	.word 0xc4ea28b4  ! 1965: LDSTUBA_I	ldstuba	%r2, [%r8 + 0x08b4] %asi
	.word 0xe42a0009  ! 1968: STB_R	stb	%r18, [%r8 + %r9]
	.word 0xec020009  ! 1968: LDUW_R	lduw	[%r8 + %r9], %r22
	.word 0xc4420009  ! 1968: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xce320009  ! 1971: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xea020009  ! 1971: LDUW_R	lduw	[%r8 + %r9], %r21
	.word 0xc36a0009  ! 1971: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xe6320009  ! 1974: STH_R	sth	%r19, [%r8 + %r9]
	.word 0xc2020009  ! 1974: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xc48a29c8  ! 1974: LDUBA_I	lduba	[%r8, + 0x09c8] %asi, %r2
	.word 0xc8220009  ! 1977: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xcb020009  ! 1977: LDF_R	ld	[%r8, %r9], %f5
	.word 0x847a0009  ! 1977: SDIV_R	sdiv 	%r8, %r9, %r2
	.word 0xfe320009  ! 1980: STH_R	sth	%r31, [%r8 + %r9]
	.word 0xea420009  ! 1980: LDSW_R	ldsw	[%r8 + %r9], %r21
	.word 0xc3ea2674  ! 1980: PREFETCHA_I	prefetcha	[%r8, + 0x0674] %asi, #one_read
	.word 0xf6320009  ! 1983: STH_R	sth	%r27, [%r8 + %r9]
	.word 0xc2020009  ! 1983: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xc8c227b4  ! 1983: LDSWA_I	ldswa	[%r8, + 0x07b4] %asi, %r4
	.word 0xd9220009  ! 1986: STF_R	st	%f12, [%r9, %r8]
	.word 0xe0520009  ! 1986: LDSH_R	ldsh	[%r8 + %r9], %r16
	.word 0x84f20009  ! 1986: UDIVcc_R	udivcc 	%r8, %r9, %r2
	.word 0xf6320009  ! 1989: STH_R	sth	%r27, [%r8 + %r9]
	.word 0xca5a0009  ! 1989: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0x8143e014  ! 1989: MEMBAR	membar	#LoadStore | #Lookaside 
	.word 0xc2720009  ! 1992: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xda020009  ! 1992: LDUW_R	lduw	[%r8 + %r9], %r13
	.word 0x40000001  ! 1992: CALL	call	disp30_1
	.word 0xc2320009  ! 1995: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xcc4a0009  ! 1995: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xd8ea2540  ! 1995: LDSTUBA_I	ldstuba	%r12, [%r8 + 0x0540] %asi
	.word 0xff3a0009  ! 1998: STDF_R	std	%f31, [%r9, %r8]
	.word 0xc6420009  ! 1998: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xc3ea2334  ! 1998: PREFETCHA_I	prefetcha	[%r8, + 0x0334] %asi, #one_read
	.word 0xc82a0009  ! 2001: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xcb1a0009  ! 2001: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0x8143e071  ! 2001: MEMBAR	membar	#LoadLoad | #Lookaside | #MemIssue | #Sync 
	.word 0xcf3a0009  ! 2004: STDF_R	std	%f7, [%r9, %r8]
	.word 0xde5a0009  ! 2004: LDX_R	ldx	[%r8 + %r9], %r15
	.word 0x8ed22de0  ! 2004: UMULcc_I	umulcc 	%r8, 0x0de0, %r7
	.word 0xc8720009  ! 2007: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc7020009  ! 2007: LDF_R	ld	[%r8, %r9], %f3
	.word 0x86fa0009  ! 2007: SDIVcc_R	sdivcc 	%r8, %r9, %r3
	.word 0xc73a0009  ! 2010: STDF_R	std	%f3, [%r9, %r8]
	.word 0xca020009  ! 2010: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xc6da22e0  ! 2010: LDXA_I	ldxa	[%r8, + 0x02e0] %asi, %r3
	.word 0xc4220009  ! 2013: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc91a0009  ! 2013: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0x9da20929  ! 2013: FMULs	fmuls	%f8, %f9, %f14
	.word 0xd93a0009  ! 2016: STDF_R	std	%f12, [%r9, %r8]
	.word 0xf0120009  ! 2016: LDUH_R	lduh	[%r8 + %r9], %r24
	.word 0x2cc20001  ! 2016: BRGZ	brgz,a,nt	%8,<label_0x20001>
	.word 0xc93a0009  ! 2019: STDF_R	std	%f4, [%r9, %r8]
	.word 0xc20a0009  ! 2019: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xcd1a2878  ! 2019: LDDF_I	ldd	[%r8, 0x0878], %f6
	.word 0xf4320009  ! 2022: STH_R	sth	%r26, [%r8 + %r9]
	.word 0xc8420009  ! 2022: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xca822bb4  ! 2022: LDUWA_I	lduwa	[%r8, + 0x0bb4] %asi, %r5
	.word 0xc82a0009  ! 2025: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xff1a0009  ! 2025: LDDF_R	ldd	[%r8, %r9], %f31
	.word 0xe8fa1009  ! 2025: SWAPA_R	swapa	%r20, [%r8 + %r9] 0x80
	.word 0xc4220009  ! 2028: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xca420009  ! 2028: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xf8da1009  ! 2028: LDXA_R	ldxa	[%r8, %r9] 0x80, %r28
	.word 0xe0320009  ! 2031: STH_R	sth	%r16, [%r8 + %r9]
	.word 0xcc020009  ! 2031: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xeed22824  ! 2031: LDSHA_I	ldsha	[%r8, + 0x0824] %asi, %r23
	.word 0xd6220009  ! 2034: STW_R	stw	%r11, [%r8 + %r9]
	.word 0xcc0a0009  ! 2034: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0x8143c000  ! 2034: STBAR	stbar
	.word 0xc8320009  ! 2037: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xcc420009  ! 2037: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xca120009  ! 2037: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xc42a0009  ! 2040: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xce120009  ! 2040: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xe4fa2924  ! 2040: SWAPA_I	swapa	%r18, [%r8 + 0x0924] %asi
	.word 0xcc720009  ! 2043: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc3020009  ! 2043: LDF_R	ld	[%r8, %r9], %f1
	.word 0xc3ea2b34  ! 2043: PREFETCHA_I	prefetcha	[%r8, + 0x0b34] %asi, #one_read
	.word 0xcb220009  ! 2046: STF_R	st	%f5, [%r9, %r8]
	.word 0xc4120009  ! 2046: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xced22718  ! 2046: LDSHA_I	ldsha	[%r8, + 0x0718] %asi, %r7
	.word 0xcd3a0009  ! 2049: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc5020009  ! 2049: LDF_R	ld	[%r8, %r9], %f2
	.word 0xcc922730  ! 2049: LDUHA_I	lduha	[%r8, + 0x0730] %asi, %r6
	.word 0xf4220009  ! 2052: STW_R	stw	%r26, [%r8 + %r9]
	.word 0xfb1a0009  ! 2052: LDDF_R	ldd	[%r8, %r9], %f29
	.word 0xce8a2b20  ! 2052: LDUBA_I	lduba	[%r8, + 0x0b20] %asi, %r7
	.word 0xf2720009  ! 2055: STX_R	stx	%r25, [%r8 + %r9]
	.word 0xc45a0009  ! 2055: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xcaaa1009  ! 2055: STBA_R	stba	%r5, [%r8 + %r9] 0x80
	.word 0xcc220009  ! 2058: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc2020009  ! 2058: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xc47a0009  ! 2058: SWAP_R	swap	%r2, [%r8 + %r9]
	.word 0xc6720009  ! 2061: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xcc5a0009  ! 2061: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xc46a0009  ! 2061: LDSTUB_R	ldstub	%r2, [%r8 + %r9]
	.word 0xc6220009  ! 2064: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xed020009  ! 2064: LDF_R	ld	[%r8, %r9], %f22
	.word 0xfa522174  ! 2064: LDSH_I	ldsh	[%r8 + 0x0174], %r29
	.word 0xca2a0009  ! 2067: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xce5a0009  ! 2067: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0x8ba20929  ! 2067: FMULs	fmuls	%f8, %f9, %f5
	.word 0xc6220009  ! 2070: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xca520009  ! 2070: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xc5f22009  ! 2070: CASXA_R	casxa	[%r8]%asi, %r9, %r2
	.word 0xc82a0009  ! 2073: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xce4a0009  ! 2073: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xe4122ad0  ! 2073: LDUH_I	lduh	[%r8 + 0x0ad0], %r18
	.word 0xc2720009  ! 2076: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc91a0009  ! 2076: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xccfa2af8  ! 2076: SWAPA_I	swapa	%r6, [%r8 + 0x0af8] %asi
	.word 0xc8220009  ! 2079: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xe60a0009  ! 2079: LDUB_R	ldub	[%r8 + %r9], %r19
	.word 0xcab22fb8  ! 2079: STHA_I	stha	%r5, [%r8 + 0x0fb8] %asi
	.word 0xde720009  ! 2082: STX_R	stx	%r15, [%r8 + %r9]
	.word 0xe1020009  ! 2082: LDF_R	ld	[%r8, %r9], %f16
	.word 0xe00222c4  ! 2082: LDUW_I	lduw	[%r8 + 0x02c4], %r16
	.word 0xde2a0009  ! 2085: STB_R	stb	%r15, [%r8 + %r9]
	.word 0xc8020009  ! 2085: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xc8b21009  ! 2085: STHA_R	stha	%r4, [%r8 + %r9] 0x80
	.word 0xc7220009  ! 2088: STF_R	st	%f3, [%r9, %r8]
	.word 0xd65a0009  ! 2088: LDX_R	ldx	[%r8 + %r9], %r11
	.word 0x8143e049  ! 2088: MEMBAR	membar	#LoadLoad | #StoreStore | #Sync 
	.word 0xf4320009  ! 2091: STH_R	sth	%r26, [%r8 + %r9]
	.word 0xc84a0009  ! 2091: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xc81a2198  ! 2091: LDD_I	ldd	[%r8 + 0x0198], %r4
	.word 0xc33a0009  ! 2094: STDF_R	std	%f1, [%r9, %r8]
	.word 0xcd1a0009  ! 2094: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0x00800001  ! 2094: BN	bn  	<label_0x1>
	.word 0xfb3a0009  ! 2097: STDF_R	std	%f29, [%r9, %r8]
	.word 0xc85a0009  ! 2097: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0x844a0009  ! 2097: MULX_R	mulx 	%r8, %r9, %r2
	.word 0xc33a0009  ! 2100: STDF_R	std	%f1, [%r9, %r8]
	.word 0xcc4a0009  ! 2100: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xc53a2968  ! 2100: STDF_I	std	%f2, [0x0968, %r8]
	.word 0xf82a0009  ! 2103: STB_R	stb	%r28, [%r8 + %r9]
	.word 0xc64a0009  ! 2103: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xca6a2de4  ! 2103: LDSTUB_I	ldstub	%r5, [%r8 + 0x0de4]
	.word 0xcc220009  ! 2106: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc8120009  ! 2106: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0x9b6a0009  ! 2106: SDIVX_R	sdivx	%r8, %r9, %r13
	.word 0xf5220009  ! 2109: STF_R	st	%f26, [%r9, %r8]
	.word 0xc8120009  ! 2109: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xc6b226e0  ! 2109: STHA_I	stha	%r3, [%r8 + 0x06e0] %asi
	.word 0xf42a0009  ! 2112: STB_R	stb	%r26, [%r8 + %r9]
	.word 0xf2420009  ! 2112: LDSW_R	ldsw	[%r8 + %r9], %r25
	.word 0xc6fa1009  ! 2112: SWAPA_R	swapa	%r3, [%r8 + %r9] 0x80
	.word 0xf4220009  ! 2115: STW_R	stw	%r26, [%r8 + %r9]
	.word 0xc65a0009  ! 2115: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xc4ca1009  ! 2115: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r2
	.word 0xc62a0009  ! 2118: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xee0a0009  ! 2118: LDUB_R	ldub	[%r8 + %r9], %r23
	.word 0xc8da1009  ! 2118: LDXA_R	ldxa	[%r8, %r9] 0x80, %r4
	.word 0xc3220009  ! 2121: STF_R	st	%f1, [%r9, %r8]
	.word 0xd6020009  ! 2121: LDUW_R	lduw	[%r8 + %r9], %r11
	.word 0x8143e026  ! 2121: MEMBAR	membar	#StoreLoad | #LoadStore | #MemIssue 
	.word 0xc8220009  ! 2124: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xcc520009  ! 2124: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xc9e22009  ! 2124: CASA_R	casa	[%r8] %asi, %r9, %r4
	.word 0xcb3a0009  ! 2127: STDF_R	std	%f5, [%r9, %r8]
	.word 0xe4120009  ! 2127: LDUH_R	lduh	[%r8 + %r9], %r18
	.word 0xe2b22b7c  ! 2127: STHA_I	stha	%r17, [%r8 + 0x0b7c] %asi
	.word 0xcd3a0009  ! 2130: STDF_R	std	%f6, [%r9, %r8]
	.word 0xf24a0009  ! 2130: LDSB_R	ldsb	[%r8 + %r9], %r25
	.word 0xc8ba2650  ! 2130: STDA_I	stda	%r4, [%r8 + 0x0650] %asi
	.word 0xc5220009  ! 2133: STF_R	st	%f2, [%r9, %r8]
	.word 0xc4420009  ! 2133: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xa5a209a9  ! 2133: FDIVs	fdivs	%f8, %f9, %f18
	.word 0xfe320009  ! 2136: STH_R	sth	%r31, [%r8 + %r9]
	.word 0xca5a0009  ! 2136: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0x8da209a9  ! 2136: FDIVs	fdivs	%f8, %f9, %f6
	.word 0xec720009  ! 2139: STX_R	stx	%r22, [%r8 + %r9]
	.word 0xf7020009  ! 2139: LDF_R	ld	[%r8, %r9], %f27
	.word 0x86722dbc  ! 2139: UDIV_I	udiv 	%r8, 0x0dbc, %r3
	.word 0xc2720009  ! 2142: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xe8420009  ! 2142: LDSW_R	ldsw	[%r8 + %r9], %r20
	.word 0xcaa21009  ! 2142: STWA_R	stwa	%r5, [%r8 + %r9] 0x80
	.word 0xe33a0009  ! 2145: STDF_R	std	%f17, [%r9, %r8]
	.word 0xc8120009  ! 2145: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0x85a20829  ! 2145: FADDs	fadds	%f8, %f9, %f2
	.word 0xc22a0009  ! 2148: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xe51a0009  ! 2148: LDDF_R	ldd	[%r8, %r9], %f18
	.word 0xc7222ae8  ! 2148: STF_I	st	%f3, [0x0ae8, %r8]
	.word 0xca220009  ! 2151: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc6120009  ! 2151: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0x99222640  ! 2151: MULScc_I	mulscc 	%r8, 0x0640, %r12
	.word 0xce720009  ! 2154: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc71a0009  ! 2154: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0x0cc20001  ! 2154: BRGZ	brgz  ,nt	%8,<label_0x20001>
	.word 0xca320009  ! 2157: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xcc5a0009  ! 2157: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0x8ed22c24  ! 2157: UMULcc_I	umulcc 	%r8, 0x0c24, %r7
	.word 0xde320009  ! 2160: STH_R	sth	%r15, [%r8 + %r9]
	.word 0xc91a0009  ! 2160: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xf89a2da0  ! 2160: LDDA_I	ldda	[%r8, + 0x0da0] %asi, %r28
	.word 0xe02a0009  ! 2163: STB_R	stb	%r16, [%r8 + %r9]
	.word 0xda5a0009  ! 2163: LDX_R	ldx	[%r8 + %r9], %r13
	.word 0xc36a0009  ! 2163: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xff3a0009  ! 2166: STDF_R	std	%f31, [%r9, %r8]
	.word 0xf2520009  ! 2166: LDSH_R	ldsh	[%r8 + %r9], %r25
	.word 0xc3ea1009  ! 2166: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xcc2a0009  ! 2169: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xf20a0009  ! 2169: LDUB_R	ldub	[%r8 + %r9], %r25
	.word 0xc3ea1009  ! 2169: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc2220009  ! 2172: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xcc4a0009  ! 2172: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xcb222908  ! 2172: STF_I	st	%f5, [0x0908, %r8]
	.word 0xf5220009  ! 2175: STF_R	st	%f26, [%r9, %r8]
	.word 0xe4520009  ! 2175: LDSH_R	ldsh	[%r8 + %r9], %r18
	.word 0x8ba209a9  ! 2175: FDIVs	fdivs	%f8, %f9, %f5
	.word 0xc9220009  ! 2178: STF_R	st	%f4, [%r9, %r8]
	.word 0xc85a0009  ! 2178: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xcd1a28c0  ! 2178: LDDF_I	ldd	[%r8, 0x08c0], %f6
	.word 0xcb3a0009  ! 2181: STDF_R	std	%f5, [%r9, %r8]
	.word 0xc6420009  ! 2181: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xc3ea1009  ! 2181: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xf8720009  ! 2184: STX_R	stx	%r28, [%r8 + %r9]
	.word 0xc60a0009  ! 2184: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0x985a0009  ! 2184: SMUL_R	smul 	%r8, %r9, %r12
	.word 0xcc220009  ! 2187: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xca5a0009  ! 2187: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xc65a0009  ! 2187: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xd7220009  ! 2190: STF_R	st	%f11, [%r9, %r8]
	.word 0xc3020009  ! 2190: LDF_R	ld	[%r8, %r9], %f1
	.word 0x8fa209a9  ! 2190: FDIVs	fdivs	%f8, %f9, %f7
	.word 0xef3a0009  ! 2193: STDF_R	std	%f23, [%r9, %r8]
	.word 0xf2420009  ! 2193: LDSW_R	ldsw	[%r8 + %r9], %r25
	.word 0x8b6a0009  ! 2193: SDIVX_R	sdivx	%r8, %r9, %r5
	.word 0xc42a0009  ! 2196: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc65a0009  ! 2196: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xc4ba1009  ! 2196: STDA_R	stda	%r2, [%r8 + %r9] 0x80
	.word 0xca2a0009  ! 2199: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xca020009  ! 2199: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0x3a800001  ! 2199: BCC	bcc,a	<label_0x1>
	.word 0xc33a0009  ! 2202: STDF_R	std	%f1, [%r9, %r8]
	.word 0xcb020009  ! 2202: LDF_R	ld	[%r8, %r9], %f5
	.word 0x8143c000  ! 2202: STBAR	stbar
	.word 0xf8720009  ! 2205: STX_R	stx	%r28, [%r8 + %r9]
	.word 0xf91a0009  ! 2205: LDDF_R	ldd	[%r8, %r9], %f28
	.word 0x3c800001  ! 2205: BPOS	bpos,a	<label_0x1>
	.word 0xff3a0009  ! 2208: STDF_R	std	%f31, [%r9, %r8]
	.word 0xc6120009  ! 2208: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xae6a0009  ! 2208: UDIVX_R	udivx 	%r8, %r9, %r23
	.word 0xc73a0009  ! 2211: STDF_R	std	%f3, [%r9, %r8]
	.word 0xee020009  ! 2211: LDUW_R	lduw	[%r8 + %r9], %r23
	.word 0xc26a0009  ! 2211: LDSTUB_R	ldstub	%r1, [%r8 + %r9]
	.word 0xe53a0009  ! 2214: STDF_R	std	%f18, [%r9, %r8]
	.word 0xc84a0009  ! 2214: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0x8c5a2408  ! 2214: SMUL_I	smul 	%r8, 0x0408, %r6
	.word 0xcd3a0009  ! 2217: STDF_R	std	%f6, [%r9, %r8]
	.word 0xea0a0009  ! 2217: LDUB_R	ldub	[%r8 + %r9], %r21
	.word 0xc36a21e4  ! 2217: PREFETCH_I	prefetch	[%r8 + 0x01e4], #one_read
	.word 0xf33a0009  ! 2220: STDF_R	std	%f25, [%r9, %r8]
	.word 0xc8120009  ! 2220: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0x2c800001  ! 2220: BNEG	bneg,a	<label_0x1>
	.word 0xc22a0009  ! 2223: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xfe5a0009  ! 2223: LDX_R	ldx	[%r8 + %r9], %r31
	.word 0xc3ea2c38  ! 2223: PREFETCHA_I	prefetcha	[%r8, + 0x0c38] %asi, #one_read
	.word 0xdc720009  ! 2226: STX_R	stx	%r14, [%r8 + %r9]
	.word 0xcb020009  ! 2226: LDF_R	ld	[%r8, %r9], %f5
	.word 0xc3ea2168  ! 2226: PREFETCHA_I	prefetcha	[%r8, + 0x0168] %asi, #one_read
	.word 0xc33a0009  ! 2229: STDF_R	std	%f1, [%r9, %r8]
	.word 0xf91a0009  ! 2229: LDDF_R	ldd	[%r8, %r9], %f28
	.word 0xcc1a2bb8  ! 2229: LDD_I	ldd	[%r8 + 0x0bb8], %r6
	.word 0xfb3a0009  ! 2232: STDF_R	std	%f29, [%r9, %r8]
	.word 0xdc5a0009  ! 2232: LDX_R	ldx	[%r8 + %r9], %r14
	.word 0xba720009  ! 2232: UDIV_R	udiv 	%r8, %r9, %r29
	.word 0xca220009  ! 2235: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc24a0009  ! 2235: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xcec21009  ! 2235: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r7
	.word 0xc62a0009  ! 2238: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc85a0009  ! 2238: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xce020009  ! 2238: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xfc320009  ! 2241: STH_R	sth	%r30, [%r8 + %r9]
	.word 0xce120009  ! 2241: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xc4ba1009  ! 2241: STDA_R	stda	%r2, [%r8 + %r9] 0x80
	.word 0xce2a0009  ! 2244: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xce120009  ! 2244: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xc6520009  ! 2244: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xcc320009  ! 2247: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc44a0009  ! 2247: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xeeaa1009  ! 2247: STBA_R	stba	%r23, [%r8 + %r9] 0x80
	.word 0xc4220009  ! 2250: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xd6120009  ! 2250: LDUH_R	lduh	[%r8 + %r9], %r11
	.word 0xc36a2e4c  ! 2250: PREFETCH_I	prefetch	[%r8 + 0x0e4c], #one_read
	.word 0xf0320009  ! 2253: STH_R	sth	%r24, [%r8 + %r9]
	.word 0xcb020009  ! 2253: LDF_R	ld	[%r8, %r9], %f5
	.word 0x84da21ac  ! 2253: SMULcc_I	smulcc 	%r8, 0x01ac, %r2
	.word 0xc53a0009  ! 2256: STDF_R	std	%f2, [%r9, %r8]
	.word 0xca520009  ! 2256: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xdc921009  ! 2256: LDUHA_R	lduha	[%r8, %r9] 0x80, %r14
	.word 0xc53a0009  ! 2259: STDF_R	std	%f2, [%r9, %r8]
	.word 0xe9020009  ! 2259: LDF_R	ld	[%r8, %r9], %f20
	.word 0xcef21009  ! 2259: STXA_R	stxa	%r7, [%r8 + %r9] 0x80
	.word 0xf4720009  ! 2262: STX_R	stx	%r26, [%r8 + %r9]
	.word 0xfa020009  ! 2262: LDUW_R	lduw	[%r8 + %r9], %r29
	.word 0x8e520009  ! 2262: UMUL_R	umul 	%r8, %r9, %r7
	.word 0xea720009  ! 2265: STX_R	stx	%r21, [%r8 + %r9]
	.word 0xd8120009  ! 2265: LDUH_R	lduh	[%r8 + %r9], %r12
	.word 0x02800002  ! 2265: BE	be  	<label_0x2>
	.word 0xda220009  ! 2268: STW_R	stw	%r13, [%r8 + %r9]
	.word 0xcf1a0009  ! 2268: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xc6f21009  ! 2268: STXA_R	stxa	%r3, [%r8 + %r9] 0x80
	.word 0xe13a0009  ! 2271: STDF_R	std	%f16, [%r9, %r8]
	.word 0xc9020009  ! 2271: LDF_R	ld	[%r8, %r9], %f4
	.word 0xcefa21e4  ! 2271: SWAPA_I	swapa	%r7, [%r8 + 0x01e4] %asi
	.word 0xc33a0009  ! 2274: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc2120009  ! 2274: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xc36a0009  ! 2274: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc22a0009  ! 2277: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc25a0009  ! 2277: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0x82522c88  ! 2277: UMUL_I	umul 	%r8, 0x0c88, %r1
	.word 0xc7220009  ! 2280: STF_R	st	%f3, [%r9, %r8]
	.word 0xce5a0009  ! 2280: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xb2522e60  ! 2280: UMUL_I	umul 	%r8, 0x0e60, %r25
	.word 0xe6720009  ! 2283: STX_R	stx	%r19, [%r8 + %r9]
	.word 0xc8120009  ! 2283: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xcc9a2ff8  ! 2283: LDDA_I	ldda	[%r8, + 0x0ff8] %asi, %r6
	.word 0xc6220009  ! 2286: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xce4a0009  ! 2286: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0x8143c000  ! 2286: STBAR	stbar
	.word 0xc33a0009  ! 2289: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc65a0009  ! 2289: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xc3ea2124  ! 2289: PREFETCHA_I	prefetcha	[%r8, + 0x0124] %asi, #one_read
	.word 0xfa320009  ! 2292: STH_R	sth	%r29, [%r8 + %r9]
	.word 0xc80a0009  ! 2292: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xc322294c  ! 2292: STF_I	st	%f1, [0x094c, %r8]
	.word 0xc8220009  ! 2295: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc6420009  ! 2295: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0x85a208a9  ! 2295: FSUBs	fsubs	%f8, %f9, %f2
	.word 0xe8720009  ! 2298: STX_R	stx	%r20, [%r8 + %r9]
	.word 0xc4420009  ! 2298: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0x97220009  ! 2298: MULScc_R	mulscc 	%r8, %r9, %r11
	.word 0xc2220009  ! 2301: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc64a0009  ! 2301: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xfc6a2488  ! 2301: LDSTUB_I	ldstub	%r30, [%r8 + 0x0488]
	.word 0xc53a0009  ! 2304: STDF_R	std	%f2, [%r9, %r8]
	.word 0xcc420009  ! 2304: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xc3ea1009  ! 2304: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xca220009  ! 2307: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc4520009  ! 2307: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xc9220009  ! 2307: STF_R	st	%f4, [%r9, %r8]
	.word 0xcd220009  ! 2310: STF_R	st	%f6, [%r9, %r8]
	.word 0xe6020009  ! 2310: LDUW_R	lduw	[%r8 + %r9], %r19
	.word 0x08800001  ! 2310: BLEU	bleu  	<label_0x1>
	.word 0xee2a0009  ! 2313: STB_R	stb	%r23, [%r8 + %r9]
	.word 0xe20a0009  ! 2313: LDUB_R	ldub	[%r8 + %r9], %r17
	.word 0xe6b21009  ! 2313: STHA_R	stha	%r19, [%r8 + %r9] 0x80
	.word 0xc82a0009  ! 2316: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xca5a0009  ! 2316: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0x0a800001  ! 2316: BCS	bcs  	<label_0x1>
	.word 0xc93a0009  ! 2319: STDF_R	std	%f4, [%r9, %r8]
	.word 0xe80a0009  ! 2319: LDUB_R	ldub	[%r8 + %r9], %r20
	.word 0x00800002  ! 2319: BN	bn  	<label_0x2>
	.word 0xc3220009  ! 2322: STF_R	st	%f1, [%r9, %r8]
	.word 0xd64a0009  ! 2322: LDSB_R	ldsb	[%r8 + %r9], %r11
	.word 0xafa209a9  ! 2322: FDIVs	fdivs	%f8, %f9, %f23
	.word 0xf4220009  ! 2325: STW_R	stw	%r26, [%r8 + %r9]
	.word 0xee020009  ! 2325: LDUW_R	lduw	[%r8 + %r9], %r23
	.word 0x8143e019  ! 2325: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside 
	.word 0xcc2a0009  ! 2328: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xca020009  ! 2328: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xf7e22009  ! 2328: CASA_R	casa	[%r8] %asi, %r9, %r27
	.word 0xc62a0009  ! 2331: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xcc520009  ! 2331: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xc36a0009  ! 2331: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc6320009  ! 2334: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xde520009  ! 2334: LDSH_R	ldsh	[%r8 + %r9], %r15
	.word 0x97a20829  ! 2334: FADDs	fadds	%f8, %f9, %f11
	.word 0xf13a0009  ! 2337: STDF_R	std	%f24, [%r9, %r8]
	.word 0xc8520009  ! 2337: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0x892221f4  ! 2337: MULScc_I	mulscc 	%r8, 0x01f4, %r4
	.word 0xf2220009  ! 2340: STW_R	stw	%r25, [%r8 + %r9]
	.word 0xc8120009  ! 2340: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xc36a2f6c  ! 2340: PREFETCH_I	prefetch	[%r8 + 0x0f6c], #one_read
	.word 0xed220009  ! 2343: STF_R	st	%f22, [%r9, %r8]
	.word 0xcf1a0009  ! 2343: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0x40000002  ! 2343: CALL	call	disp30_2
	.word 0xec320009  ! 2346: STH_R	sth	%r22, [%r8 + %r9]
	.word 0xcc420009  ! 2346: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xde822db0  ! 2346: LDUWA_I	lduwa	[%r8, + 0x0db0] %asi, %r15
	.word 0xcc720009  ! 2349: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xce5a0009  ! 2349: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0x8143e004  ! 2349: MEMBAR	membar	#LoadStore 
	.word 0xc6320009  ! 2352: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xf8520009  ! 2352: LDSH_R	ldsh	[%r8 + %r9], %r28
	.word 0xdde22009  ! 2352: CASA_R	casa	[%r8] %asi, %r9, %r14
	.word 0xcc2a0009  ! 2355: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xfa520009  ! 2355: LDSH_R	ldsh	[%r8 + %r9], %r29
	.word 0xb07a0009  ! 2355: SDIV_R	sdiv 	%r8, %r9, %r24
	.word 0xc73a0009  ! 2358: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc4020009  ! 2358: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xc73a0009  ! 2358: STDF_R	std	%f3, [%r9, %r8]
	.word 0xcb220009  ! 2361: STF_R	st	%f5, [%r9, %r8]
	.word 0xc91a0009  ! 2361: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xce0225ec  ! 2361: LDUW_I	lduw	[%r8 + 0x05ec], %r7
	.word 0xc4320009  ! 2364: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xf65a0009  ! 2364: LDX_R	ldx	[%r8 + %r9], %r27
	.word 0xcbf21009  ! 2364: CASXA_I	casxa	[%r8] 0x80, %r9, %r5
	.word 0xfa2a0009  ! 2367: STB_R	stb	%r29, [%r8 + %r9]
	.word 0xca0a0009  ! 2367: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0x8cd20009  ! 2367: UMULcc_R	umulcc 	%r8, %r9, %r6
	.word 0xd6220009  ! 2370: STW_R	stw	%r11, [%r8 + %r9]
	.word 0xc20a0009  ! 2370: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0x827a2ccc  ! 2370: SDIV_I	sdiv 	%r8, 0x0ccc, %r1
	.word 0xc7220009  ! 2373: STF_R	st	%f3, [%r9, %r8]
	.word 0xc6420009  ! 2373: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0x82da0009  ! 2373: SMULcc_R	smulcc 	%r8, %r9, %r1
	.word 0xc6720009  ! 2376: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xca5a0009  ! 2376: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0x8143e074  ! 2376: MEMBAR	membar	#LoadStore | #Lookaside | #MemIssue | #Sync 
	.word 0xc2220009  ! 2379: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc3020009  ! 2379: LDF_R	ld	[%r8, %r9], %f1
	.word 0x1e800001  ! 2379: BVC	bvc  	<label_0x1>
	.word 0xc2720009  ! 2382: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xfe0a0009  ! 2382: LDUB_R	ldub	[%r8 + %r9], %r31
	.word 0xfe821009  ! 2382: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r31
	.word 0xca2a0009  ! 2385: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xcf020009  ! 2385: LDF_R	ld	[%r8, %r9], %f7
	.word 0xcc7a0009  ! 2385: SWAP_R	swap	%r6, [%r8 + %r9]
	.word 0xc6720009  ! 2388: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc84a0009  ! 2388: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0x8143e02e  ! 2388: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #MemIssue 
	.word 0xe6720009  ! 2391: STX_R	stx	%r19, [%r8 + %r9]
	.word 0xcd1a0009  ! 2391: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xc3ea1009  ! 2391: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xda220009  ! 2394: STW_R	stw	%r13, [%r8 + %r9]
	.word 0xc2420009  ! 2394: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0x38800002  ! 2394: BGU	bgu,a	<label_0x2>
	.word 0xfc220009  ! 2397: STW_R	stw	%r30, [%r8 + %r9]
	.word 0xc91a0009  ! 2397: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xc36a27e0  ! 2397: PREFETCH_I	prefetch	[%r8 + 0x07e0], #one_read
	.word 0xce320009  ! 2400: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xd8520009  ! 2400: LDSH_R	ldsh	[%r8 + %r9], %r12
	.word 0xc3ea2574  ! 2400: PREFETCHA_I	prefetcha	[%r8, + 0x0574] %asi, #one_read
	.word 0xc42a0009  ! 2403: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc24a0009  ! 2403: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xc3ea26b8  ! 2403: PREFETCHA_I	prefetcha	[%r8, + 0x06b8] %asi, #one_read
	.word 0xc4720009  ! 2406: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xf0120009  ! 2406: LDUH_R	lduh	[%r8 + %r9], %r24
	.word 0xed3a2450  ! 2406: STDF_I	std	%f22, [0x0450, %r8]
	.word 0xc8220009  ! 2409: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xe2420009  ! 2409: LDSW_R	ldsw	[%r8 + %r9], %r17
	.word 0xc36a0009  ! 2409: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xe0720009  ! 2412: STX_R	stx	%r16, [%r8 + %r9]
	.word 0xcc4a0009  ! 2412: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xecda2a60  ! 2412: LDXA_I	ldxa	[%r8, + 0x0a60] %asi, %r22
	.word 0xc5220009  ! 2415: STF_R	st	%f2, [%r9, %r8]
	.word 0xca420009  ! 2415: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xcafa27cc  ! 2415: SWAPA_I	swapa	%r5, [%r8 + 0x07cc] %asi
	.word 0xc4320009  ! 2418: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xdf020009  ! 2418: LDF_R	ld	[%r8, %r9], %f15
	.word 0xcc9a2970  ! 2418: LDDA_I	ldda	[%r8, + 0x0970] %asi, %r6
	.word 0xc42a0009  ! 2421: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xe2120009  ! 2421: LDUH_R	lduh	[%r8 + %r9], %r17
	.word 0x1e800002  ! 2421: BVC	bvc  	<label_0x2>
	.word 0xc8220009  ! 2424: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc2520009  ! 2424: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xe48a1009  ! 2424: LDUBA_R	lduba	[%r8, %r9] 0x80, %r18
	.word 0xda2a0009  ! 2427: STB_R	stb	%r13, [%r8 + %r9]
	.word 0xc8520009  ! 2427: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0x2a800001  ! 2427: BCS	bcs,a	<label_0x1>
	.word 0xc2720009  ! 2430: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc60a0009  ! 2430: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xc3ea1009  ! 2430: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc6320009  ! 2433: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc84a0009  ! 2433: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0x8143e079  ! 2433: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xcd220009  ! 2436: STF_R	st	%f6, [%r9, %r8]
	.word 0xca520009  ! 2436: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xfaaa282c  ! 2436: STBA_I	stba	%r29, [%r8 + 0x082c] %asi
	.word 0xdc720009  ! 2439: STX_R	stx	%r14, [%r8 + %r9]
	.word 0xc71a0009  ! 2439: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xc3ea2a84  ! 2439: PREFETCHA_I	prefetcha	[%r8, + 0x0a84] %asi, #one_read
	.word 0xe4320009  ! 2442: STH_R	sth	%r18, [%r8 + %r9]
	.word 0xcb1a0009  ! 2442: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0x06c20001  ! 2442: BRLZ	brlz  ,nt	%8,<label_0x20001>
	.word 0xf8320009  ! 2445: STH_R	sth	%r28, [%r8 + %r9]
	.word 0xce0a0009  ! 2445: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xc31a0009  ! 2445: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xe0320009  ! 2448: STH_R	sth	%r16, [%r8 + %r9]
	.word 0xc60a0009  ! 2448: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xcca22678  ! 2448: STWA_I	stwa	%r6, [%r8 + 0x0678] %asi
	.word 0xca220009  ! 2451: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc4020009  ! 2451: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xb2520009  ! 2451: UMUL_R	umul 	%r8, %r9, %r25
	.word 0xce2a0009  ! 2454: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xcc120009  ! 2454: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xc93a0009  ! 2454: STDF_R	std	%f4, [%r9, %r8]
	.word 0xdc720009  ! 2457: STX_R	stx	%r14, [%r8 + %r9]
	.word 0xcc0a0009  ! 2457: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xc89a2a90  ! 2457: LDDA_I	ldda	[%r8, + 0x0a90] %asi, %r4
	.word 0xe6320009  ! 2460: STH_R	sth	%r19, [%r8 + %r9]
	.word 0xcc4a0009  ! 2460: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0x84da2a38  ! 2460: SMULcc_I	smulcc 	%r8, 0x0a38, %r2
	.word 0xc62a0009  ! 2463: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xf00a0009  ! 2463: LDUB_R	ldub	[%r8 + %r9], %r24
	.word 0xc5220009  ! 2463: STF_R	st	%f2, [%r9, %r8]
	.word 0xcc320009  ! 2466: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc45a0009  ! 2466: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xc5220009  ! 2466: STF_R	st	%f2, [%r9, %r8]
	.word 0xca720009  ! 2469: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xca120009  ! 2469: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xee122328  ! 2469: LDUH_I	lduh	[%r8 + 0x0328], %r23
	.word 0xe4220009  ! 2472: STW_R	stw	%r18, [%r8 + %r9]
	.word 0xeb020009  ! 2472: LDF_R	ld	[%r8, %r9], %f21
	.word 0xee8a2b10  ! 2472: LDUBA_I	lduba	[%r8, + 0x0b10] %asi, %r23
	.word 0xe6720009  ! 2475: STX_R	stx	%r19, [%r8 + %r9]
	.word 0xe20a0009  ! 2475: LDUB_R	ldub	[%r8 + %r9], %r17
	.word 0x36800001  ! 2475: BGE	bge,a	<label_0x1>
	.word 0xec720009  ! 2478: STX_R	stx	%r22, [%r8 + %r9]
	.word 0xc4420009  ! 2478: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xc3ea1009  ! 2478: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xcb220009  ! 2481: STF_R	st	%f5, [%r9, %r8]
	.word 0xc2520009  ! 2481: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xfeb21009  ! 2481: STHA_R	stha	%r31, [%r8 + %r9] 0x80
	.word 0xcc220009  ! 2484: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xce520009  ! 2484: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0x8e520009  ! 2484: UMUL_R	umul 	%r8, %r9, %r7
	.word 0xc6320009  ! 2487: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xfe120009  ! 2487: LDUH_R	lduh	[%r8 + %r9], %r31
	.word 0x02c20001  ! 2487: BRZ	brz  ,nt	%8,<label_0x20001>
	.word 0xcc720009  ! 2490: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc4020009  ! 2490: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0x04ca0001  ! 2490: BRLEZ	brlez  ,pt	%8,<label_0xa0001>
	.word 0xf2720009  ! 2493: STX_R	stx	%r25, [%r8 + %r9]
	.word 0xc60a0009  ! 2493: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xc36a0009  ! 2493: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xda220009  ! 2496: STW_R	stw	%r13, [%r8 + %r9]
	.word 0xc65a0009  ! 2496: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xc3022a1c  ! 2496: LDF_I	ld	[%r8, 0x0a1c], %f1
	.word 0xc6720009  ! 2499: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xda020009  ! 2499: LDUW_R	lduw	[%r8 + %r9], %r13
	.word 0xc36a222c  ! 2499: PREFETCH_I	prefetch	[%r8 + 0x022c], #one_read
	.word 0xc82a0009  ! 2502: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc44a0009  ! 2502: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0x2a800001  ! 2502: BCS	bcs,a	<label_0x1>
	.word 0xdc220009  ! 2505: STW_R	stw	%r14, [%r8 + %r9]
	.word 0xc40a0009  ! 2505: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0x8143e056  ! 2505: MEMBAR	membar	#StoreLoad | #LoadStore | #Lookaside | #Sync 
	.word 0xca220009  ! 2508: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xca0a0009  ! 2508: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0x8143c000  ! 2508: STBAR	stbar
	.word 0xc4320009  ! 2511: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xce020009  ! 2511: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xe1e22009  ! 2511: CASA_R	casa	[%r8] %asi, %r9, %r16
	.word 0xe2320009  ! 2514: STH_R	sth	%r17, [%r8 + %r9]
	.word 0xcc420009  ! 2514: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xca821009  ! 2514: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r5
	.word 0xca320009  ! 2517: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xdb020009  ! 2517: LDF_R	ld	[%r8, %r9], %f13
	.word 0x86da2928  ! 2517: SMULcc_I	smulcc 	%r8, 0x0928, %r3
	.word 0xc2320009  ! 2520: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xce4a0009  ! 2520: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xc36a0009  ! 2520: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc82a0009  ! 2523: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc8520009  ! 2523: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0x2a800001  ! 2523: BCS	bcs,a	<label_0x1>
	.word 0xdc220009  ! 2526: STW_R	stw	%r14, [%r8 + %r9]
	.word 0xfc120009  ! 2526: LDUH_R	lduh	[%r8 + %r9], %r30
	.word 0xc2aa1009  ! 2526: STBA_R	stba	%r1, [%r8 + %r9] 0x80
	.word 0xeb3a0009  ! 2529: STDF_R	std	%f21, [%r9, %r8]
	.word 0xe60a0009  ! 2529: LDUB_R	ldub	[%r8 + %r9], %r19
	.word 0xf51a0009  ! 2529: LDDF_R	ldd	[%r8, %r9], %f26
	.word 0xc9220009  ! 2532: STF_R	st	%f4, [%r9, %r8]
	.word 0xce420009  ! 2532: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xcab2252c  ! 2532: STHA_I	stha	%r5, [%r8 + 0x052c] %asi
	.word 0xc4720009  ! 2535: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc2020009  ! 2535: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xc93a0009  ! 2535: STDF_R	std	%f4, [%r9, %r8]
	.word 0xc2320009  ! 2538: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xcc0a0009  ! 2538: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0x845a2510  ! 2538: SMUL_I	smul 	%r8, 0x0510, %r2
	.word 0xc73a0009  ! 2541: STDF_R	std	%f3, [%r9, %r8]
	.word 0xca420009  ! 2541: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xd84a0009  ! 2541: LDSB_R	ldsb	[%r8 + %r9], %r12
	.word 0xce320009  ! 2544: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc84a0009  ! 2544: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0x38800002  ! 2544: BGU	bgu,a	<label_0x2>
	.word 0xd9220009  ! 2547: STF_R	st	%f12, [%r9, %r8]
	.word 0xc8520009  ! 2547: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0x8143c000  ! 2547: STBAR	stbar
	.word 0xca2a0009  ! 2550: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xfc0a0009  ! 2550: LDUB_R	ldub	[%r8 + %r9], %r30
	.word 0xc46a0009  ! 2550: LDSTUB_R	ldstub	%r2, [%r8 + %r9]
	.word 0xf8320009  ! 2553: STH_R	sth	%r28, [%r8 + %r9]
	.word 0xca5a0009  ! 2553: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0x8a520009  ! 2553: UMUL_R	umul 	%r8, %r9, %r5
	.word 0xcc2a0009  ! 2556: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc51a0009  ! 2556: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xca6a0009  ! 2556: LDSTUB_R	ldstub	%r5, [%r8 + %r9]
	.word 0xf62a0009  ! 2559: STB_R	stb	%r27, [%r8 + %r9]
	.word 0xf31a0009  ! 2559: LDDF_R	ldd	[%r8, %r9], %f25
	.word 0xcc6a0009  ! 2559: LDSTUB_R	ldstub	%r6, [%r8 + %r9]
	.word 0xc8320009  ! 2562: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc8120009  ! 2562: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xcf3a2f60  ! 2562: STDF_I	std	%f7, [0x0f60, %r8]
	.word 0xe1220009  ! 2565: STF_R	st	%f16, [%r9, %r8]
	.word 0xc20a0009  ! 2565: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xc3ea2ae4  ! 2565: PREFETCHA_I	prefetcha	[%r8, + 0x0ae4] %asi, #one_read
	.word 0xcc320009  ! 2568: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc25a0009  ! 2568: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0x86720009  ! 2568: UDIV_R	udiv 	%r8, %r9, %r3
	.word 0xca220009  ! 2571: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xd7020009  ! 2571: LDF_R	ld	[%r8, %r9], %f11
	.word 0xc66a2d34  ! 2571: LDSTUB_I	ldstub	%r3, [%r8 + 0x0d34]
	.word 0xce2a0009  ! 2574: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xee5a0009  ! 2574: LDX_R	ldx	[%r8 + %r9], %r23
	.word 0xc8a220e0  ! 2574: STWA_I	stwa	%r4, [%r8 + 0x00e0] %asi
	.word 0xca320009  ! 2577: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xcf1a0009  ! 2577: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xe6ea1009  ! 2577: LDSTUBA_R	ldstuba	%r19, [%r8 + %r9] 0x80
	.word 0xe13a0009  ! 2580: STDF_R	std	%f16, [%r9, %r8]
	.word 0xf8120009  ! 2580: LDUH_R	lduh	[%r8 + %r9], %r28
	.word 0xc3ea1009  ! 2580: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc8720009  ! 2583: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc2520009  ! 2583: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0x8a7a0009  ! 2583: SDIV_R	sdiv 	%r8, %r9, %r5
	.word 0xcc220009  ! 2586: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xce120009  ! 2586: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xc3ea1009  ! 2586: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc6720009  ! 2589: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xed020009  ! 2589: LDF_R	ld	[%r8, %r9], %f22
	.word 0x9cfa0009  ! 2589: SDIVcc_R	sdivcc 	%r8, %r9, %r14
	.word 0xdc2a0009  ! 2592: STB_R	stb	%r14, [%r8 + %r9]
	.word 0xca420009  ! 2592: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0x886a26c4  ! 2592: UDIVX_I	udivx 	%r8, 0x06c4, %r4
	.word 0xcd220009  ! 2595: STF_R	st	%f6, [%r9, %r8]
	.word 0xc6120009  ! 2595: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xac7a2468  ! 2595: SDIV_I	sdiv 	%r8, 0x0468, %r22
	.word 0xcd3a0009  ! 2598: STDF_R	std	%f6, [%r9, %r8]
	.word 0xcc5a0009  ! 2598: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xc67a26d8  ! 2598: SWAP_I	swap	%r3, [%r8 + 0x06d8]
	.word 0xc6720009  ! 2601: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xca020009  ! 2601: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xa25a298c  ! 2601: SMUL_I	smul 	%r8, 0x098c, %r17
	.word 0xde320009  ! 2604: STH_R	sth	%r15, [%r8 + %r9]
	.word 0xee4a0009  ! 2604: LDSB_R	ldsb	[%r8 + %r9], %r23
	.word 0xc36a0009  ! 2604: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc9220009  ! 2607: STF_R	st	%f4, [%r9, %r8]
	.word 0xc7020009  ! 2607: LDF_R	ld	[%r8, %r9], %f3
	.word 0xf46a0009  ! 2607: LDSTUB_R	ldstub	%r26, [%r8 + %r9]
	.word 0xc7220009  ! 2610: STF_R	st	%f3, [%r9, %r8]
	.word 0xce5a0009  ! 2610: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0x8143e024  ! 2610: MEMBAR	membar	#LoadStore | #MemIssue 
	.word 0xc4220009  ! 2613: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xf4020009  ! 2613: LDUW_R	lduw	[%r8 + %r9], %r26
	.word 0xef3a2fc0  ! 2613: STDF_I	std	%f23, [0x0fc0, %r8]
	.word 0xc6220009  ! 2616: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xce520009  ! 2616: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0x8a522ea8  ! 2616: UMUL_I	umul 	%r8, 0x0ea8, %r5
	.word 0xc22a0009  ! 2619: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc31a0009  ! 2619: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xfa0a0009  ! 2619: LDUB_R	ldub	[%r8 + %r9], %r29
	.word 0xca320009  ! 2622: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc40a0009  ! 2622: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0x8143c000  ! 2622: STBAR	stbar
	.word 0xcf220009  ! 2625: STF_R	st	%f7, [%r9, %r8]
	.word 0xf4420009  ! 2625: LDSW_R	ldsw	[%r8 + %r9], %r26
	.word 0xc33a2c40  ! 2625: STDF_I	std	%f1, [0x0c40, %r8]
	.word 0xcc2a0009  ! 2628: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xcc520009  ! 2628: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xc3ea1009  ! 2628: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc4720009  ! 2631: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc4120009  ! 2631: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xc5220009  ! 2631: STF_R	st	%f2, [%r9, %r8]
	.word 0xc6320009  ! 2634: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xf8420009  ! 2634: LDSW_R	ldsw	[%r8 + %r9], %r28
	.word 0xca921009  ! 2634: LDUHA_R	lduha	[%r8, %r9] 0x80, %r5
	.word 0xcf220009  ! 2637: STF_R	st	%f7, [%r9, %r8]
	.word 0xcc0a0009  ! 2637: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xc47a2e1c  ! 2637: SWAP_I	swap	%r2, [%r8 + 0x0e1c]
	.word 0xc82a0009  ! 2640: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xe45a0009  ! 2640: LDX_R	ldx	[%r8 + %r9], %r18
	.word 0x8143c000  ! 2640: STBAR	stbar
	.word 0xda2a0009  ! 2643: STB_R	stb	%r13, [%r8 + %r9]
	.word 0xce120009  ! 2643: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xa8720009  ! 2643: UDIV_R	udiv 	%r8, %r9, %r20
	.word 0xea720009  ! 2646: STX_R	stx	%r21, [%r8 + %r9]
	.word 0xf6520009  ! 2646: LDSH_R	ldsh	[%r8 + %r9], %r27
	.word 0x87222bf8  ! 2646: MULScc_I	mulscc 	%r8, 0x0bf8, %r3
	.word 0xce720009  ! 2649: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xec0a0009  ! 2649: LDUB_R	ldub	[%r8 + %r9], %r22
	.word 0x86f2226c  ! 2649: UDIVcc_I	udivcc 	%r8, 0x026c, %r3
	.word 0xcd3a0009  ! 2652: STDF_R	std	%f6, [%r9, %r8]
	.word 0xca020009  ! 2652: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0x8efa2c6c  ! 2652: SDIVcc_I	sdivcc 	%r8, 0x0c6c, %r7
	.word 0xc73a0009  ! 2655: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc25a0009  ! 2655: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0x0c800001  ! 2655: BNEG	bneg  	<label_0x1>
	.word 0xd9220009  ! 2658: STF_R	st	%f12, [%r9, %r8]
	.word 0xd65a0009  ! 2658: LDX_R	ldx	[%r8 + %r9], %r11
	.word 0xcca222fc  ! 2658: STWA_I	stwa	%r6, [%r8 + 0x02fc] %asi
	.word 0xe7220009  ! 2661: STF_R	st	%f19, [%r9, %r8]
	.word 0xd65a0009  ! 2661: LDX_R	ldx	[%r8 + %r9], %r11
	.word 0xce821009  ! 2661: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r7
	.word 0xdf220009  ! 2664: STF_R	st	%f15, [%r9, %r8]
	.word 0xe44a0009  ! 2664: LDSB_R	ldsb	[%r8 + %r9], %r18
	.word 0xfbf21009  ! 2664: CASXA_I	casxa	[%r8] 0x80, %r9, %r29
	.word 0xfc2a0009  ! 2667: STB_R	stb	%r30, [%r8 + %r9]
	.word 0xde120009  ! 2667: LDUH_R	lduh	[%r8 + %r9], %r15
	.word 0xc8ea2da0  ! 2667: LDSTUBA_I	ldstuba	%r4, [%r8 + 0x0da0] %asi
	.word 0xff3a0009  ! 2670: STDF_R	std	%f31, [%r9, %r8]
	.word 0xce5a0009  ! 2670: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xaa7a0009  ! 2670: SDIV_R	sdiv 	%r8, %r9, %r21
	.word 0xc4720009  ! 2673: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc4120009  ! 2673: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xc66a0009  ! 2673: LDSTUB_R	ldstub	%r3, [%r8 + %r9]
	.word 0xcb220009  ! 2676: STF_R	st	%f5, [%r9, %r8]
	.word 0xe4420009  ! 2676: LDSW_R	ldsw	[%r8 + %r9], %r18
	.word 0xc36a0009  ! 2676: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xce320009  ! 2679: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xfe120009  ! 2679: LDUH_R	lduh	[%r8 + %r9], %r31
	.word 0x3e800001  ! 2679: BVC	bvc,a	<label_0x1>
	.word 0xca220009  ! 2682: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc25a0009  ! 2682: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xbe6a276c  ! 2682: UDIVX_I	udivx 	%r8, 0x076c, %r31
	.word 0xcd220009  ! 2685: STF_R	st	%f6, [%r9, %r8]
	.word 0xcb020009  ! 2685: LDF_R	ld	[%r8, %r9], %f5
	.word 0xc46a0009  ! 2685: LDSTUB_R	ldstub	%r2, [%r8 + %r9]
	.word 0xc4220009  ! 2688: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc2020009  ! 2688: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xa3a209a9  ! 2688: FDIVs	fdivs	%f8, %f9, %f17
	.word 0xea220009  ! 2691: STW_R	stw	%r21, [%r8 + %r9]
	.word 0xca520009  ! 2691: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0x8afa0009  ! 2691: SDIVcc_R	sdivcc 	%r8, %r9, %r5
	.word 0xec720009  ! 2694: STX_R	stx	%r22, [%r8 + %r9]
	.word 0xca120009  ! 2694: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0x02800001  ! 2694: BE	be  	<label_0x1>
	.word 0xc2720009  ! 2697: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xee120009  ! 2697: LDUH_R	lduh	[%r8 + %r9], %r23
	.word 0x8d222408  ! 2697: MULScc_I	mulscc 	%r8, 0x0408, %r6
	.word 0xca2a0009  ! 2700: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc7020009  ! 2700: LDF_R	ld	[%r8, %r9], %f3
	.word 0xc9e22009  ! 2700: CASA_R	casa	[%r8] %asi, %r9, %r4
	.word 0xc4220009  ! 2703: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xca120009  ! 2703: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xc66a0009  ! 2703: LDSTUB_R	ldstub	%r3, [%r8 + %r9]
	.word 0xdb220009  ! 2706: STF_R	st	%f13, [%r9, %r8]
	.word 0xd60a0009  ! 2706: LDUB_R	ldub	[%r8 + %r9], %r11
	.word 0xe0b22a84  ! 2706: STHA_I	stha	%r16, [%r8 + 0x0a84] %asi
	.word 0xe33a0009  ! 2709: STDF_R	std	%f17, [%r9, %r8]
	.word 0xc6420009  ! 2709: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xc36a2024  ! 2709: PREFETCH_I	prefetch	[%r8 + 0x0024], #one_read
	.word 0xe8720009  ! 2712: STX_R	stx	%r20, [%r8 + %r9]
	.word 0xc5020009  ! 2712: LDF_R	ld	[%r8, %r9], %f2
	.word 0xc3ea1009  ! 2712: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xf8220009  ! 2715: STW_R	stw	%r28, [%r8 + %r9]
	.word 0xf3020009  ! 2715: LDF_R	ld	[%r8, %r9], %f25
	.word 0xc36a2700  ! 2715: PREFETCH_I	prefetch	[%r8 + 0x0700], #one_read
	.word 0xc62a0009  ! 2718: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc3020009  ! 2718: LDF_R	ld	[%r8, %r9], %f1
	.word 0xc36a2abc  ! 2718: PREFETCH_I	prefetch	[%r8 + 0x0abc], #one_read
	.word 0xce220009  ! 2721: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xe00a0009  ! 2721: LDUB_R	ldub	[%r8 + %r9], %r16
	.word 0x8e4a23a0  ! 2721: MULX_I	mulx 	%r8, 0x03a0, %r7
	.word 0xd82a0009  ! 2724: STB_R	stb	%r12, [%r8 + %r9]
	.word 0xcc020009  ! 2724: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xce4225a8  ! 2724: LDSW_I	ldsw	[%r8 + 0x05a8], %r7
	.word 0xd9220009  ! 2727: STF_R	st	%f12, [%r9, %r8]
	.word 0xce520009  ! 2727: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xfbf22009  ! 2727: CASXA_R	casxa	[%r8]%asi, %r9, %r29
	.word 0xda720009  ! 2730: STX_R	stx	%r13, [%r8 + %r9]
	.word 0xda5a0009  ! 2730: LDX_R	ldx	[%r8 + %r9], %r13
	.word 0xc3ea1009  ! 2730: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc4320009  ! 2733: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xcc020009  ! 2733: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0x82da2150  ! 2733: SMULcc_I	smulcc 	%r8, 0x0150, %r1
	.word 0xc8720009  ! 2736: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc8120009  ! 2736: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0x884a0009  ! 2736: MULX_R	mulx 	%r8, %r9, %r4
	.word 0xd9220009  ! 2739: STF_R	st	%f12, [%r9, %r8]
	.word 0xca020009  ! 2739: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0x8143e035  ! 2739: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside | #MemIssue 
	.word 0xc73a0009  ! 2742: STDF_R	std	%f3, [%r9, %r8]
	.word 0xcc020009  ! 2742: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xcca21009  ! 2742: STWA_R	stwa	%r6, [%r8 + %r9] 0x80
	.word 0xee2a0009  ! 2745: STB_R	stb	%r23, [%r8 + %r9]
	.word 0xcd1a0009  ! 2745: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0x89a20929  ! 2745: FMULs	fmuls	%f8, %f9, %f4
	.word 0xf02a0009  ! 2748: STB_R	stb	%r24, [%r8 + %r9]
	.word 0xe8020009  ! 2748: LDUW_R	lduw	[%r8 + %r9], %r20
	.word 0xc3ea25a8  ! 2748: PREFETCHA_I	prefetcha	[%r8, + 0x05a8] %asi, #one_read
	.word 0xcb220009  ! 2751: STF_R	st	%f5, [%r9, %r8]
	.word 0xcc5a0009  ! 2751: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0x26ca0001  ! 2751: BRLZ	brlz,a,pt	%8,<label_0xa0001>
	.word 0xcb220009  ! 2754: STF_R	st	%f5, [%r9, %r8]
	.word 0xf71a0009  ! 2754: LDDF_R	ldd	[%r8, %r9], %f27
	.word 0xdea22858  ! 2754: STWA_I	stwa	%r15, [%r8 + 0x0858] %asi
	.word 0xcf3a0009  ! 2757: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc85a0009  ! 2757: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xde8a1009  ! 2757: LDUBA_R	lduba	[%r8, %r9] 0x80, %r15
	.word 0xcd3a0009  ! 2760: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc31a0009  ! 2760: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xcab22558  ! 2760: STHA_I	stha	%r5, [%r8 + 0x0558] %asi
	.word 0xde2a0009  ! 2763: STB_R	stb	%r15, [%r8 + %r9]
	.word 0xf11a0009  ! 2763: LDDF_R	ldd	[%r8, %r9], %f24
	.word 0xb9222fec  ! 2763: MULScc_I	mulscc 	%r8, 0x0fec, %r28
	.word 0xc4220009  ! 2766: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc8120009  ! 2766: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xc8aa1009  ! 2766: STBA_R	stba	%r4, [%r8 + %r9] 0x80
	.word 0xc3220009  ! 2769: STF_R	st	%f1, [%r9, %r8]
	.word 0xce4a0009  ! 2769: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xc4da1009  ! 2769: LDXA_R	ldxa	[%r8, %r9] 0x80, %r2
	.word 0xeb3a0009  ! 2772: STDF_R	std	%f21, [%r9, %r8]
	.word 0xc2020009  ! 2772: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xc3ea1009  ! 2772: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xe2720009  ! 2775: STX_R	stx	%r17, [%r8 + %r9]
	.word 0xca4a0009  ! 2775: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xce8a1009  ! 2775: LDUBA_R	lduba	[%r8, %r9] 0x80, %r7
	.word 0xc22a0009  ! 2778: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xea520009  ! 2778: LDSH_R	ldsh	[%r8 + %r9], %r21
	.word 0xa47a0009  ! 2778: SDIV_R	sdiv 	%r8, %r9, %r18
	.word 0xe2220009  ! 2781: STW_R	stw	%r17, [%r8 + %r9]
	.word 0xdc420009  ! 2781: LDSW_R	ldsw	[%r8 + %r9], %r14
	.word 0x8efa27fc  ! 2781: SDIVcc_I	sdivcc 	%r8, 0x07fc, %r7
	.word 0xf2320009  ! 2784: STH_R	sth	%r25, [%r8 + %r9]
	.word 0xc45a0009  ! 2784: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0x847a0009  ! 2784: SDIV_R	sdiv 	%r8, %r9, %r2
	.word 0xcb220009  ! 2787: STF_R	st	%f5, [%r9, %r8]
	.word 0xe8520009  ! 2787: LDSH_R	ldsh	[%r8 + %r9], %r20
	.word 0xcad21009  ! 2787: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r5
	.word 0xce220009  ! 2790: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc3020009  ! 2790: LDF_R	ld	[%r8, %r9], %f1
	.word 0x40000002  ! 2790: CALL	call	disp30_2
	.word 0xc62a0009  ! 2793: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc45a0009  ! 2793: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0x824a0009  ! 2793: MULX_R	mulx 	%r8, %r9, %r1
	.word 0xc2720009  ! 2796: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xce120009  ! 2796: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0x8143e01d  ! 2796: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside 
	.word 0xfe320009  ! 2799: STH_R	sth	%r31, [%r8 + %r9]
	.word 0xda420009  ! 2799: LDSW_R	ldsw	[%r8 + %r9], %r13
	.word 0xfc922ee4  ! 2799: LDUHA_I	lduha	[%r8, + 0x0ee4] %asi, %r30
	.word 0xca320009  ! 2802: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xca0a0009  ! 2802: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xceea1009  ! 2802: LDSTUBA_R	ldstuba	%r7, [%r8 + %r9] 0x80
	.word 0xdc220009  ! 2805: STW_R	stw	%r14, [%r8 + %r9]
	.word 0xc60a0009  ! 2805: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xf2aa2608  ! 2805: STBA_I	stba	%r25, [%r8 + 0x0608] %asi
	.word 0xea220009  ! 2808: STW_R	stw	%r21, [%r8 + %r9]
	.word 0xe8120009  ! 2808: LDUH_R	lduh	[%r8 + %r9], %r20
	.word 0x8143c000  ! 2808: STBAR	stbar
	.word 0xc2320009  ! 2811: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xce4a0009  ! 2811: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0x8143e04b  ! 2811: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Sync 
	.word 0xc33a0009  ! 2814: STDF_R	std	%f1, [%r9, %r8]
	.word 0xfc4a0009  ! 2814: LDSB_R	ldsb	[%r8 + %r9], %r30
	.word 0xf6821009  ! 2814: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r27
	.word 0xc9220009  ! 2817: STF_R	st	%f4, [%r9, %r8]
	.word 0xcd1a0009  ! 2817: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xccc22f20  ! 2817: LDSWA_I	ldswa	[%r8, + 0x0f20] %asi, %r6
	.word 0xea2a0009  ! 2820: STB_R	stb	%r21, [%r8 + %r9]
	.word 0xc20a0009  ! 2820: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xc2420009  ! 2820: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xc82a0009  ! 2823: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc80a0009  ! 2823: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xbcda0009  ! 2823: SMULcc_R	smulcc 	%r8, %r9, %r30
	.word 0xe2320009  ! 2826: STH_R	sth	%r17, [%r8 + %r9]
	.word 0xca020009  ! 2826: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xe47a28ac  ! 2826: SWAP_I	swap	%r18, [%r8 + 0x08ac]
	.word 0xc93a0009  ! 2829: STDF_R	std	%f4, [%r9, %r8]
	.word 0xc4420009  ! 2829: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xfa6a0009  ! 2829: LDSTUB_R	ldstub	%r29, [%r8 + %r9]
	.word 0xda320009  ! 2832: STH_R	sth	%r13, [%r8 + %r9]
	.word 0xf6020009  ! 2832: LDUW_R	lduw	[%r8 + %r9], %r27
	.word 0x2aca0001  ! 2832: BRNZ	brnz,a,pt	%8,<label_0xa0001>
	.word 0xeb3a0009  ! 2835: STDF_R	std	%f21, [%r9, %r8]
	.word 0xc6520009  ! 2835: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0x1c800002  ! 2835: BPOS	bpos  	<label_0x2>
	.word 0xc42a0009  ! 2838: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xf6020009  ! 2838: LDUW_R	lduw	[%r8 + %r9], %r27
	.word 0xc93a2958  ! 2838: STDF_I	std	%f4, [0x0958, %r8]
	.word 0xca720009  ! 2841: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xef1a0009  ! 2841: LDDF_R	ldd	[%r8, %r9], %f23
	.word 0xc4ba1009  ! 2841: STDA_R	stda	%r2, [%r8 + %r9] 0x80
	.word 0xc8220009  ! 2844: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc31a0009  ! 2844: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0x8a4a2d48  ! 2844: MULX_I	mulx 	%r8, 0x0d48, %r5
	.word 0xc4320009  ! 2847: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xca120009  ! 2847: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0x8e5a26d0  ! 2847: SMUL_I	smul 	%r8, 0x06d0, %r7
	.word 0xef220009  ! 2850: STF_R	st	%f23, [%r9, %r8]
	.word 0xe9020009  ! 2850: LDF_R	ld	[%r8, %r9], %f20
	.word 0xccba2008  ! 2850: STDA_I	stda	%r6, [%r8 + 0x0008] %asi
	.word 0xf5220009  ! 2853: STF_R	st	%f26, [%r9, %r8]
	.word 0xc71a0009  ! 2853: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0x8143c000  ! 2853: STBAR	stbar
	.word 0xe02a0009  ! 2856: STB_R	stb	%r16, [%r8 + %r9]
	.word 0xf64a0009  ! 2856: LDSB_R	ldsb	[%r8 + %r9], %r27
	.word 0xc36a21a8  ! 2856: PREFETCH_I	prefetch	[%r8 + 0x01a8], #one_read
	.word 0xcc220009  ! 2859: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xce5a0009  ! 2859: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xa04a0009  ! 2859: MULX_R	mulx 	%r8, %r9, %r16
	.word 0xce720009  ! 2862: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xce0a0009  ! 2862: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xc3ea2f90  ! 2862: PREFETCHA_I	prefetcha	[%r8, + 0x0f90] %asi, #one_read
	.word 0xc4720009  ! 2865: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xca0a0009  ! 2865: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xec4a0009  ! 2865: LDSB_R	ldsb	[%r8 + %r9], %r22
	.word 0xc2220009  ! 2868: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc2520009  ! 2868: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xc3ea1009  ! 2868: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc9220009  ! 2871: STF_R	st	%f4, [%r9, %r8]
	.word 0xcf1a0009  ! 2871: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0x8143e055  ! 2871: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside | #Sync 
	.word 0xf8320009  ! 2874: STH_R	sth	%r28, [%r8 + %r9]
	.word 0xf11a0009  ! 2874: LDDF_R	ldd	[%r8, %r9], %f24
	.word 0x2a800001  ! 2874: BCS	bcs,a	<label_0x1>
	.word 0xce320009  ! 2877: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xea020009  ! 2877: LDUW_R	lduw	[%r8 + %r9], %r21
	.word 0xc3ea28dc  ! 2877: PREFETCHA_I	prefetcha	[%r8, + 0x08dc] %asi, #one_read
	.word 0xcc320009  ! 2880: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc64a0009  ! 2880: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0x32800001  ! 2880: BNE	bne,a	<label_0x1>
	.word 0xc5220009  ! 2883: STF_R	st	%f2, [%r9, %r8]
	.word 0xde120009  ! 2883: LDUH_R	lduh	[%r8 + %r9], %r15
	.word 0xf8d21009  ! 2883: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r28
	.word 0xc73a0009  ! 2886: STDF_R	std	%f3, [%r9, %r8]
	.word 0xcd1a0009  ! 2886: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xaad20009  ! 2886: UMULcc_R	umulcc 	%r8, %r9, %r21
	.word 0xe93a0009  ! 2889: STDF_R	std	%f20, [%r9, %r8]
	.word 0xca520009  ! 2889: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xc36a25e4  ! 2889: PREFETCH_I	prefetch	[%r8 + 0x05e4], #one_read
	.word 0xc5220009  ! 2892: STF_R	st	%f2, [%r9, %r8]
	.word 0xca020009  ! 2892: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0x8fa20829  ! 2892: FADDs	fadds	%f8, %f9, %f7
	.word 0xc73a0009  ! 2895: STDF_R	std	%f3, [%r9, %r8]
	.word 0xd71a0009  ! 2895: LDDF_R	ldd	[%r8, %r9], %f11
	.word 0xc3ea1009  ! 2895: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc9220009  ! 2898: STF_R	st	%f4, [%r9, %r8]
	.word 0xec020009  ! 2898: LDUW_R	lduw	[%r8 + %r9], %r22
	.word 0x8143c000  ! 2898: STBAR	stbar
	.word 0xf42a0009  ! 2901: STB_R	stb	%r26, [%r8 + %r9]
	.word 0xce120009  ! 2901: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0x836a2428  ! 2901: SDIVX_I	sdivx	%r8, 0x0428, %r1
	.word 0xcd220009  ! 2904: STF_R	st	%f6, [%r9, %r8]
	.word 0xc2120009  ! 2904: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0x8cfa0009  ! 2904: SDIVcc_R	sdivcc 	%r8, %r9, %r6
	.word 0xce720009  ! 2907: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc60a0009  ! 2907: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xc73a2f50  ! 2907: STDF_I	std	%f3, [0x0f50, %r8]
	.word 0xc9220009  ! 2910: STF_R	st	%f4, [%r9, %r8]
	.word 0xda020009  ! 2910: LDUW_R	lduw	[%r8 + %r9], %r13
	.word 0xdb222494  ! 2910: STF_I	st	%f13, [0x0494, %r8]
	.word 0xc8720009  ! 2913: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xce020009  ! 2913: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0x844a0009  ! 2913: MULX_R	mulx 	%r8, %r9, %r2
	.word 0xfe220009  ! 2916: STW_R	stw	%r31, [%r8 + %r9]
	.word 0xc71a0009  ! 2916: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xdca22fa8  ! 2916: STWA_I	stwa	%r14, [%r8 + 0x0fa8] %asi
	.word 0xee320009  ! 2919: STH_R	sth	%r23, [%r8 + %r9]
	.word 0xcd020009  ! 2919: LDF_R	ld	[%r8, %r9], %f6
	.word 0x34800001  ! 2919: BG	bg,a	<label_0x1>
	.word 0xe4320009  ! 2922: STH_R	sth	%r18, [%r8 + %r9]
	.word 0xcc120009  ! 2922: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xc53a0009  ! 2922: STDF_R	std	%f2, [%r9, %r8]
	.word 0xcd3a0009  ! 2925: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc6120009  ! 2925: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xe6aa2688  ! 2925: STBA_I	stba	%r19, [%r8 + 0x0688] %asi
	.word 0xcf3a0009  ! 2928: STDF_R	std	%f7, [%r9, %r8]
	.word 0xe3020009  ! 2928: LDF_R	ld	[%r8, %r9], %f17
	.word 0xc8aa1009  ! 2928: STBA_R	stba	%r4, [%r8 + %r9] 0x80
	.word 0xc8720009  ! 2931: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc8520009  ! 2931: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0x8eda0009  ! 2931: SMULcc_R	smulcc 	%r8, %r9, %r7
	.word 0xcb220009  ! 2934: STF_R	st	%f5, [%r9, %r8]
	.word 0xce0a0009  ! 2934: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xd8fa1009  ! 2934: SWAPA_R	swapa	%r12, [%r8 + %r9] 0x80
	.word 0xce320009  ! 2937: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc9020009  ! 2937: LDF_R	ld	[%r8, %r9], %f4
	.word 0x8c7a0009  ! 2937: SDIV_R	sdiv 	%r8, %r9, %r6
	.word 0xc6320009  ! 2940: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xcd1a0009  ! 2940: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0x88520009  ! 2940: UMUL_R	umul 	%r8, %r9, %r4
	.word 0xc8220009  ! 2943: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc8520009  ! 2943: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0x38800002  ! 2943: BGU	bgu,a	<label_0x2>
	.word 0xcb220009  ! 2946: STF_R	st	%f5, [%r9, %r8]
	.word 0xc44a0009  ! 2946: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0x8143e017  ! 2946: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside 
	.word 0xea720009  ! 2949: STX_R	stx	%r21, [%r8 + %r9]
	.word 0xce4a0009  ! 2949: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0x8143c000  ! 2949: STBAR	stbar
	.word 0xf0320009  ! 2952: STH_R	sth	%r24, [%r8 + %r9]
	.word 0xc91a0009  ! 2952: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xcada20a8  ! 2952: LDXA_I	ldxa	[%r8, + 0x00a8] %asi, %r5
	.word 0xf8220009  ! 2955: STW_R	stw	%r28, [%r8 + %r9]
	.word 0xf4420009  ! 2955: LDSW_R	ldsw	[%r8 + %r9], %r26
	.word 0xc36a2a68  ! 2955: PREFETCH_I	prefetch	[%r8 + 0x0a68], #one_read
	.word 0xf8220009  ! 2958: STW_R	stw	%r28, [%r8 + %r9]
	.word 0xce5a0009  ! 2958: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0x8da209a9  ! 2958: FDIVs	fdivs	%f8, %f9, %f6
	.word 0xdd3a0009  ! 2961: STDF_R	std	%f14, [%r9, %r8]
	.word 0xc40a0009  ! 2961: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0x86522b34  ! 2961: UMUL_I	umul 	%r8, 0x0b34, %r3
	.word 0xc42a0009  ! 2964: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xee5a0009  ! 2964: LDX_R	ldx	[%r8 + %r9], %r23
	.word 0xc68a2f00  ! 2964: LDUBA_I	lduba	[%r8, + 0x0f00] %asi, %r3
	.word 0xc2720009  ! 2967: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xf45a0009  ! 2967: LDX_R	ldx	[%r8 + %r9], %r26
	.word 0xc84a2438  ! 2967: LDSB_I	ldsb	[%r8 + 0x0438], %r4
	.word 0xeb3a0009  ! 2970: STDF_R	std	%f21, [%r9, %r8]
	.word 0xc65a0009  ! 2970: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xc6a220e0  ! 2970: STWA_I	stwa	%r3, [%r8 + 0x00e0] %asi
	.word 0xcd3a0009  ! 2973: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc8520009  ! 2973: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xecaa2e54  ! 2973: STBA_I	stba	%r22, [%r8 + 0x0e54] %asi
	.word 0xc8720009  ! 2976: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc8420009  ! 2976: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xc36a0009  ! 2976: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xdc320009  ! 2979: STH_R	sth	%r14, [%r8 + %r9]
	.word 0xc2520009  ! 2979: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0x8ef20009  ! 2979: UDIVcc_R	udivcc 	%r8, %r9, %r7
	.word 0xf4220009  ! 2982: STW_R	stw	%r26, [%r8 + %r9]
	.word 0xc45a0009  ! 2982: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0x97a20929  ! 2982: FMULs	fmuls	%f8, %f9, %f11
	.word 0xeb3a0009  ! 2985: STDF_R	std	%f21, [%r9, %r8]
	.word 0xd8520009  ! 2985: LDSH_R	ldsh	[%r8 + %r9], %r12
	.word 0x8143c000  ! 2985: STBAR	stbar
	.word 0xcb3a0009  ! 2988: STDF_R	std	%f5, [%r9, %r8]
	.word 0xc3020009  ! 2988: LDF_R	ld	[%r8, %r9], %f1
	.word 0xf6ca2844  ! 2988: LDSBA_I	ldsba	[%r8, + 0x0844] %asi, %r27
	.word 0xc4220009  ! 2991: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xdc0a0009  ! 2991: LDUB_R	ldub	[%r8 + %r9], %r14
	.word 0xc4821009  ! 2991: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r2
	.word 0xf5220009  ! 2994: STF_R	st	%f26, [%r9, %r8]
	.word 0xc8520009  ! 2994: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0x8eda2028  ! 2994: SMULcc_I	smulcc 	%r8, 0x0028, %r7
	.word 0xcd220009  ! 2997: STF_R	st	%f6, [%r9, %r8]
	.word 0xc5020009  ! 2997: LDF_R	ld	[%r8, %r9], %f2
	.word 0x82d20009  ! 2997: UMULcc_R	umulcc 	%r8, %r9, %r1
	.word 0xcb220009  ! 3000: STF_R	st	%f5, [%r9, %r8]
	.word 0xc64a0009  ! 3000: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0x84fa0009  ! 3000: SDIVcc_R	sdivcc 	%r8, %r9, %r2
	.word 0xc7220009  ! 3003: STF_R	st	%f3, [%r9, %r8]
	.word 0xca4a0009  ! 3003: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0x82722900  ! 3003: UDIV_I	udiv 	%r8, 0x0900, %r1
	.word 0xc6320009  ! 3006: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc4120009  ! 3006: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0x8143c000  ! 3006: STBAR	stbar
	.word 0xc82a0009  ! 3009: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc24a0009  ! 3009: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0x8143e011  ! 3009: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xc22a0009  ! 3012: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xfc420009  ! 3012: LDSW_R	ldsw	[%r8 + %r9], %r30
	.word 0xc36a2c14  ! 3012: PREFETCH_I	prefetch	[%r8 + 0x0c14], #one_read
	.word 0xc4220009  ! 3015: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xcd020009  ! 3015: LDF_R	ld	[%r8, %r9], %f6
	.word 0x0e800001  ! 3015: BVS	bvs  	<label_0x1>
	.word 0xc2320009  ! 3018: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xce520009  ! 3018: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xc3ea1009  ! 3018: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xd6220009  ! 3021: STW_R	stw	%r11, [%r8 + %r9]
	.word 0xf6420009  ! 3021: LDSW_R	ldsw	[%r8 + %r9], %r27
	.word 0xc9220009  ! 3021: STF_R	st	%f4, [%r9, %r8]
	.word 0xc4320009  ! 3024: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xec5a0009  ! 3024: LDX_R	ldx	[%r8 + %r9], %r22
	.word 0xf60a0009  ! 3024: LDUB_R	ldub	[%r8 + %r9], %r27
	.word 0xf4220009  ! 3027: STW_R	stw	%r26, [%r8 + %r9]
	.word 0xce4a0009  ! 3027: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xf40a2270  ! 3027: LDUB_I	ldub	[%r8 + 0x0270], %r26
	.word 0xca720009  ! 3030: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc71a0009  ! 3030: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0x8143c000  ! 3030: STBAR	stbar
	.word 0xc8220009  ! 3033: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc4520009  ! 3033: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0x845a2694  ! 3033: SMUL_I	smul 	%r8, 0x0694, %r2
	.word 0xca2a0009  ! 3036: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc71a0009  ! 3036: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xccba2ab8  ! 3036: STDA_I	stda	%r6, [%r8 + 0x0ab8] %asi
	.word 0xf9220009  ! 3039: STF_R	st	%f28, [%r9, %r8]
	.word 0xc3020009  ! 3039: LDF_R	ld	[%r8, %r9], %f1
	.word 0xc3f22009  ! 3039: CASXA_R	casxa	[%r8]%asi, %r9, %r1
	.word 0xf2220009  ! 3042: STW_R	stw	%r25, [%r8 + %r9]
	.word 0xca520009  ! 3042: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xeeb22e98  ! 3042: STHA_I	stha	%r23, [%r8 + 0x0e98] %asi
	.word 0xc8220009  ! 3045: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xcd020009  ! 3045: LDF_R	ld	[%r8, %r9], %f6
	.word 0xf51a2610  ! 3045: LDDF_I	ldd	[%r8, 0x0610], %f26
	.word 0xc6320009  ! 3048: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc6520009  ! 3048: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xceda1009  ! 3048: LDXA_R	ldxa	[%r8, %r9] 0x80, %r7
	.word 0xc8320009  ! 3051: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc4120009  ! 3051: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xa2d20009  ! 3051: UMULcc_R	umulcc 	%r8, %r9, %r17
	.word 0xe42a0009  ! 3054: STB_R	stb	%r18, [%r8 + %r9]
	.word 0xc91a0009  ! 3054: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xe33a2cd8  ! 3054: STDF_I	std	%f17, [0x0cd8, %r8]
	.word 0xda720009  ! 3057: STX_R	stx	%r13, [%r8 + %r9]
	.word 0xca020009  ! 3057: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0x36800001  ! 3057: BGE	bge,a	<label_0x1>
	.word 0xc6720009  ! 3060: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xde420009  ! 3060: LDSW_R	ldsw	[%r8 + %r9], %r15
	.word 0xa87a0009  ! 3060: SDIV_R	sdiv 	%r8, %r9, %r20
	.word 0xc53a0009  ! 3063: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc4520009  ! 3063: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xc93a0009  ! 3063: STDF_R	std	%f4, [%r9, %r8]
	.word 0xc62a0009  ! 3066: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xfa0a0009  ! 3066: LDUB_R	ldub	[%r8 + %r9], %r29
	.word 0xdbf22009  ! 3066: CASXA_R	casxa	[%r8]%asi, %r9, %r13
	.word 0xc6220009  ! 3069: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xda4a0009  ! 3069: LDSB_R	ldsb	[%r8 + %r9], %r13
	.word 0xaba208a9  ! 3069: FSUBs	fsubs	%f8, %f9, %f21
	.word 0xc2320009  ! 3072: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xce120009  ! 3072: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0x88fa20a8  ! 3072: SDIVcc_I	sdivcc 	%r8, 0x00a8, %r4
	.word 0xc6220009  ! 3075: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xeb020009  ! 3075: LDF_R	ld	[%r8, %r9], %f21
	.word 0xf8ba2d18  ! 3075: STDA_I	stda	%r28, [%r8 + 0x0d18] %asi
	.word 0xc2220009  ! 3078: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xcc520009  ! 3078: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xca120009  ! 3078: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xca320009  ! 3081: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xfa020009  ! 3081: LDUW_R	lduw	[%r8 + %r9], %r29
	.word 0x8143e03a  ! 3081: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside | #MemIssue 
	.word 0xcf3a0009  ! 3084: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc60a0009  ! 3084: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xc6aa27f4  ! 3084: STBA_I	stba	%r3, [%r8 + 0x07f4] %asi
	.word 0xc4220009  ! 3087: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xf8420009  ! 3087: LDSW_R	ldsw	[%r8 + %r9], %r28
	.word 0x8143e016  ! 3087: MEMBAR	membar	#StoreLoad | #LoadStore | #Lookaside 
	.word 0xce2a0009  ! 3090: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc45a0009  ! 3090: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0x24800001  ! 3090: BLE	ble,a	<label_0x1>
	.word 0xcc320009  ! 3093: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc6120009  ! 3093: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0x864a2d7c  ! 3093: MULX_I	mulx 	%r8, 0x0d7c, %r3
	.word 0xce2a0009  ! 3096: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xca5a0009  ! 3096: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xc3ea2110  ! 3096: PREFETCHA_I	prefetcha	[%r8, + 0x0110] %asi, #one_read
	.word 0xce720009  ! 3099: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc44a0009  ! 3099: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xc36a0009  ! 3099: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xff3a0009  ! 3102: STDF_R	std	%f31, [%r9, %r8]
	.word 0xcb1a0009  ! 3102: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xcd3a2ee8  ! 3102: STDF_I	std	%f6, [0x0ee8, %r8]
	.word 0xdd220009  ! 3105: STF_R	st	%f14, [%r9, %r8]
	.word 0xca5a0009  ! 3105: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xd9f22009  ! 3105: CASXA_R	casxa	[%r8]%asi, %r9, %r12
	.word 0xcf220009  ! 3108: STF_R	st	%f7, [%r9, %r8]
	.word 0xc84a0009  ! 3108: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xc36a2714  ! 3108: PREFETCH_I	prefetch	[%r8 + 0x0714], #one_read
	.word 0xc5220009  ! 3111: STF_R	st	%f2, [%r9, %r8]
	.word 0xc51a0009  ! 3111: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0x8143e067  ! 3111: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #MemIssue | #Sync 
	.word 0xcf3a0009  ! 3114: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc8120009  ! 3114: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xc92228c8  ! 3114: STF_I	st	%f4, [0x08c8, %r8]
	.word 0xcd220009  ! 3117: STF_R	st	%f6, [%r9, %r8]
	.word 0xd85a0009  ! 3117: LDX_R	ldx	[%r8 + %r9], %r12
	.word 0x8143c000  ! 3117: STBAR	stbar
	.word 0xff220009  ! 3120: STF_R	st	%f31, [%r9, %r8]
	.word 0xc2420009  ! 3120: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0x887a2420  ! 3120: SDIV_I	sdiv 	%r8, 0x0420, %r4
	.word 0xcc2a0009  ! 3123: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xd85a0009  ! 3123: LDX_R	ldx	[%r8 + %r9], %r12
	.word 0xc3ea1009  ! 3123: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xcb220009  ! 3126: STF_R	st	%f5, [%r9, %r8]
	.word 0xc64a0009  ! 3126: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0x8143c000  ! 3126: STBAR	stbar
	.word 0xca2a0009  ! 3129: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xce4a0009  ! 3129: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xc3ea1009  ! 3129: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xdc320009  ! 3132: STH_R	sth	%r14, [%r8 + %r9]
	.word 0xc4120009  ! 3132: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xc2520009  ! 3132: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xfc320009  ! 3135: STH_R	sth	%r30, [%r8 + %r9]
	.word 0xc8420009  ! 3135: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0x82da2c70  ! 3135: SMULcc_I	smulcc 	%r8, 0x0c70, %r1
	.word 0xf9220009  ! 3138: STF_R	st	%f28, [%r9, %r8]
	.word 0xe8020009  ! 3138: LDUW_R	lduw	[%r8 + %r9], %r20
	.word 0xc36a0009  ! 3138: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xce220009  ! 3141: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc4120009  ! 3141: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0x8143e063  ! 3141: MEMBAR	membar	#LoadLoad | #StoreLoad | #MemIssue | #Sync 
	.word 0xe2720009  ! 3144: STX_R	stx	%r17, [%r8 + %r9]
	.word 0xee5a0009  ! 3144: LDX_R	ldx	[%r8 + %r9], %r23
	.word 0x8143e073  ! 3144: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside | #MemIssue | #Sync 
	.word 0xcb3a0009  ! 3147: STDF_R	std	%f5, [%r9, %r8]
	.word 0xcc5a0009  ! 3147: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0x884a0009  ! 3147: MULX_R	mulx 	%r8, %r9, %r4
	.word 0xf42a0009  ! 3150: STB_R	stb	%r26, [%r8 + %r9]
	.word 0xca0a0009  ! 3150: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xcd1a0009  ! 3150: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xce320009  ! 3153: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xca020009  ! 3153: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0x8da208a9  ! 3153: FSUBs	fsubs	%f8, %f9, %f6
	.word 0xee2a0009  ! 3156: STB_R	stb	%r23, [%r8 + %r9]
	.word 0xf4420009  ! 3156: LDSW_R	ldsw	[%r8 + %r9], %r26
	.word 0x8d220009  ! 3156: MULScc_R	mulscc 	%r8, %r9, %r6
	.word 0xca220009  ! 3159: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xca420009  ! 3159: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xc3ea1009  ! 3159: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc6220009  ! 3162: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xda4a0009  ! 3162: LDSB_R	ldsb	[%r8 + %r9], %r13
	.word 0xc8ca1009  ! 3162: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r4
	.word 0xcc320009  ! 3165: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc85a0009  ! 3165: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xc3ea2668  ! 3165: PREFETCHA_I	prefetcha	[%r8, + 0x0668] %asi, #one_read
	.word 0xfd3a0009  ! 3168: STDF_R	std	%f30, [%r9, %r8]
	.word 0xe8120009  ! 3168: LDUH_R	lduh	[%r8 + %r9], %r20
	.word 0x8143e066  ! 3168: MEMBAR	membar	#StoreLoad | #LoadStore | #MemIssue | #Sync 
	.word 0xf22a0009  ! 3171: STB_R	stb	%r25, [%r8 + %r9]
	.word 0xc51a0009  ! 3171: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xc66a0009  ! 3171: LDSTUB_R	ldstub	%r3, [%r8 + %r9]
	.word 0xc6720009  ! 3174: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xce4a0009  ! 3174: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xc36a2668  ! 3174: PREFETCH_I	prefetch	[%r8 + 0x0668], #one_read
	.word 0xd8320009  ! 3177: STH_R	sth	%r12, [%r8 + %r9]
	.word 0xea120009  ! 3177: LDUH_R	lduh	[%r8 + %r9], %r21
	.word 0xce8a1009  ! 3177: LDUBA_R	lduba	[%r8, %r9] 0x80, %r7
	.word 0xca720009  ! 3180: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc6120009  ! 3180: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0x89a20929  ! 3180: FMULs	fmuls	%f8, %f9, %f4
	.word 0xc53a0009  ! 3183: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc24a0009  ! 3183: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0x8a7a2634  ! 3183: SDIV_I	sdiv 	%r8, 0x0634, %r5
	.word 0xc8320009  ! 3186: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xde420009  ! 3186: LDSW_R	ldsw	[%r8 + %r9], %r15
	.word 0x83a20829  ! 3186: FADDs	fadds	%f8, %f9, %f1
	.word 0xc42a0009  ! 3189: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xce420009  ! 3189: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0x87220009  ! 3189: MULScc_R	mulscc 	%r8, %r9, %r3
	.word 0xce720009  ! 3192: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc85a0009  ! 3192: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0x26800001  ! 3192: BL	bl,a	<label_0x1>
	.word 0xc8320009  ! 3195: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xe8420009  ! 3195: LDSW_R	ldsw	[%r8 + %r9], %r20
	.word 0xc4ba1009  ! 3195: STDA_R	stda	%r2, [%r8 + %r9] 0x80
	.word 0xe53a0009  ! 3198: STDF_R	std	%f18, [%r9, %r8]
	.word 0xc91a0009  ! 3198: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xc4020009  ! 3198: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xc4720009  ! 3201: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xff020009  ! 3201: LDF_R	ld	[%r8, %r9], %f31
	.word 0xf3e22009  ! 3201: CASA_R	casa	[%r8] %asi, %r9, %r25
	.word 0xfb3a0009  ! 3204: STDF_R	std	%f29, [%r9, %r8]
	.word 0xda5a0009  ! 3204: LDX_R	ldx	[%r8 + %r9], %r13
	.word 0xccba1009  ! 3204: STDA_R	stda	%r6, [%r8 + %r9] 0x80
	.word 0xec2a0009  ! 3207: STB_R	stb	%r22, [%r8 + %r9]
	.word 0xce520009  ! 3207: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0x8143e059  ! 3207: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside | #Sync 
	.word 0xf62a0009  ! 3210: STB_R	stb	%r27, [%r8 + %r9]
	.word 0xe60a0009  ! 3210: LDUB_R	ldub	[%r8 + %r9], %r19
	.word 0x8f6a26e8  ! 3210: SDIVX_I	sdivx	%r8, 0x06e8, %r7
	.word 0xca720009  ! 3213: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xfa120009  ! 3213: LDUH_R	lduh	[%r8 + %r9], %r29
	.word 0xcff21009  ! 3213: CASXA_I	casxa	[%r8] 0x80, %r9, %r7
	.word 0xcd220009  ! 3216: STF_R	st	%f6, [%r9, %r8]
	.word 0xd80a0009  ! 3216: LDUB_R	ldub	[%r8 + %r9], %r12
	.word 0x8b222f1c  ! 3216: MULScc_I	mulscc 	%r8, 0x0f1c, %r5
	.word 0xc8720009  ! 3219: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc31a0009  ! 3219: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xc2a22538  ! 3219: STWA_I	stwa	%r1, [%r8 + 0x0538] %asi
	.word 0xc82a0009  ! 3222: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc6020009  ! 3222: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xfcc21009  ! 3222: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r30
	.word 0xed3a0009  ! 3225: STDF_R	std	%f22, [%r9, %r8]
	.word 0xce520009  ! 3225: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xb0fa0009  ! 3225: SDIVcc_R	sdivcc 	%r8, %r9, %r24
	.word 0xf2320009  ! 3228: STH_R	sth	%r25, [%r8 + %r9]
	.word 0xdc420009  ! 3228: LDSW_R	ldsw	[%r8 + %r9], %r14
	.word 0x826a0009  ! 3228: UDIVX_R	udivx 	%r8, %r9, %r1
	.word 0xfa320009  ! 3231: STH_R	sth	%r29, [%r8 + %r9]
	.word 0xc6420009  ! 3231: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xc36a25dc  ! 3231: PREFETCH_I	prefetch	[%r8 + 0x05dc], #one_read
	.word 0xcf220009  ! 3234: STF_R	st	%f7, [%r9, %r8]
	.word 0xc8520009  ! 3234: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0x8eda0009  ! 3234: SMULcc_R	smulcc 	%r8, %r9, %r7
	.word 0xca220009  ! 3237: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc64a0009  ! 3237: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0x8143e017  ! 3237: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside 
	.word 0xcf3a0009  ! 3240: STDF_R	std	%f7, [%r9, %r8]
	.word 0xca520009  ! 3240: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0x8143e077  ! 3240: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside | #MemIssue | #Sync 
	.word 0xca320009  ! 3243: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xe60a0009  ! 3243: LDUB_R	ldub	[%r8 + %r9], %r19
	.word 0x8143c000  ! 3243: STBAR	stbar
	.word 0xcb220009  ! 3246: STF_R	st	%f5, [%r9, %r8]
	.word 0xdb020009  ! 3246: LDF_R	ld	[%r8, %r9], %f13
	.word 0x40000001  ! 3246: CALL	call	disp30_1
	.word 0xd82a0009  ! 3249: STB_R	stb	%r12, [%r8 + %r9]
	.word 0xc65a0009  ! 3249: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xc3ea27bc  ! 3249: PREFETCHA_I	prefetcha	[%r8, + 0x07bc] %asi, #one_read
	.word 0xfe320009  ! 3252: STH_R	sth	%r31, [%r8 + %r9]
	.word 0xc44a0009  ! 3252: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0x824a2170  ! 3252: MULX_I	mulx 	%r8, 0x0170, %r1
	.word 0xce720009  ! 3255: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xcd020009  ! 3255: LDF_R	ld	[%r8, %r9], %f6
	.word 0x22c20001  ! 3255: BRZ	brz,a,nt	%8,<label_0x20001>
	.word 0xc93a0009  ! 3258: STDF_R	std	%f4, [%r9, %r8]
	.word 0xc6420009  ! 3258: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0x0c800002  ! 3258: BNEG	bneg  	<label_0x2>
	.word 0xcc2a0009  ! 3261: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xf84a0009  ! 3261: LDSB_R	ldsb	[%r8 + %r9], %r28
	.word 0xc3ea1009  ! 3261: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc9220009  ! 3264: STF_R	st	%f4, [%r9, %r8]
	.word 0xce020009  ! 3264: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xc9222e84  ! 3264: STF_I	st	%f4, [0x0e84, %r8]
	.word 0xeb220009  ! 3267: STF_R	st	%f21, [%r9, %r8]
	.word 0xce020009  ! 3267: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xc2a226fc  ! 3267: STWA_I	stwa	%r1, [%r8 + 0x06fc] %asi
	.word 0xc8720009  ! 3270: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc3020009  ! 3270: LDF_R	ld	[%r8, %r9], %f1
	.word 0xf4ea1009  ! 3270: LDSTUBA_R	ldstuba	%r26, [%r8 + %r9] 0x80
	.word 0xce2a0009  ! 3273: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xcd020009  ! 3273: LDF_R	ld	[%r8, %r9], %f6
	.word 0x8f220009  ! 3273: MULScc_R	mulscc 	%r8, %r9, %r7
	.word 0xc2720009  ! 3276: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xfa5a0009  ! 3276: LDX_R	ldx	[%r8 + %r9], %r29
	.word 0xc4ba2450  ! 3276: STDA_I	stda	%r2, [%r8 + 0x0450] %asi
	.word 0xc9220009  ! 3279: STF_R	st	%f4, [%r9, %r8]
	.word 0xcf1a0009  ! 3279: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xc2f21009  ! 3279: STXA_R	stxa	%r1, [%r8 + %r9] 0x80
	.word 0xf4720009  ! 3282: STX_R	stx	%r26, [%r8 + %r9]
	.word 0xed1a0009  ! 3282: LDDF_R	ldd	[%r8, %r9], %f22
	.word 0xc8b21009  ! 3282: STHA_R	stha	%r4, [%r8 + %r9] 0x80
	.word 0xe2720009  ! 3285: STX_R	stx	%r17, [%r8 + %r9]
	.word 0xc84a0009  ! 3285: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xfd020009  ! 3285: LDF_R	ld	[%r8, %r9], %f30
	.word 0xcf220009  ! 3288: STF_R	st	%f7, [%r9, %r8]
	.word 0xc2020009  ! 3288: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0x8ad20009  ! 3288: UMULcc_R	umulcc 	%r8, %r9, %r5
	.word 0xc4320009  ! 3291: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc64a0009  ! 3291: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xc3ea2924  ! 3291: PREFETCHA_I	prefetcha	[%r8, + 0x0924] %asi, #one_read
	.word 0xf8720009  ! 3294: STX_R	stx	%r28, [%r8 + %r9]
	.word 0xfc4a0009  ! 3294: LDSB_R	ldsb	[%r8 + %r9], %r30
	.word 0xc93a2cc0  ! 3294: STDF_I	std	%f4, [0x0cc0, %r8]
	.word 0xce320009  ! 3297: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xcd1a0009  ! 3297: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xc9e22009  ! 3297: CASA_R	casa	[%r8] %asi, %r9, %r4
	.word 0xc22a0009  ! 3300: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xce4a0009  ! 3300: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xcd02293c  ! 3300: LDF_I	ld	[%r8, 0x093c], %f6
	.word 0xca2a0009  ! 3303: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc4520009  ! 3303: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xc85222b0  ! 3303: LDSH_I	ldsh	[%r8 + 0x02b0], %r4
	.word 0xd62a0009  ! 3306: STB_R	stb	%r11, [%r8 + %r9]
	.word 0xca0a0009  ! 3306: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0x8143c000  ! 3306: STBAR	stbar
	.word 0xc82a0009  ! 3309: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xce520009  ! 3309: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xe8022d70  ! 3309: LDUW_I	lduw	[%r8 + 0x0d70], %r20
	.word 0xc82a0009  ! 3312: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc4520009  ! 3312: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xcd3a2620  ! 3312: STDF_I	std	%f6, [0x0620, %r8]
	.word 0xc33a0009  ! 3315: STDF_R	std	%f1, [%r9, %r8]
	.word 0xf45a0009  ! 3315: LDX_R	ldx	[%r8 + %r9], %r26
	.word 0x9e5a274c  ! 3315: SMUL_I	smul 	%r8, 0x074c, %r15
	.word 0xf13a0009  ! 3318: STDF_R	std	%f24, [%r9, %r8]
	.word 0xc85a0009  ! 3318: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xce921009  ! 3318: LDUHA_R	lduha	[%r8, %r9] 0x80, %r7
	.word 0xef3a0009  ! 3321: STDF_R	std	%f23, [%r9, %r8]
	.word 0xce120009  ! 3321: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0x28800001  ! 3321: BLEU	bleu,a	<label_0x1>
	.word 0xcd220009  ! 3324: STF_R	st	%f6, [%r9, %r8]
	.word 0xc4420009  ! 3324: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xcc420009  ! 3324: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xcc2a0009  ! 3327: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc2420009  ! 3327: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0x8eda0009  ! 3327: SMULcc_R	smulcc 	%r8, %r9, %r7
	.word 0xcd3a0009  ! 3330: STDF_R	std	%f6, [%r9, %r8]
	.word 0xca4a0009  ! 3330: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xc3ea1009  ! 3330: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xd6720009  ! 3333: STX_R	stx	%r11, [%r8 + %r9]
	.word 0xc25a0009  ! 3333: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0x87a20829  ! 3333: FADDs	fadds	%f8, %f9, %f3
	.word 0xf6720009  ! 3336: STX_R	stx	%r27, [%r8 + %r9]
	.word 0xcb1a0009  ! 3336: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xf4ba2b70  ! 3336: STDA_I	stda	%r26, [%r8 + 0x0b70] %asi
	.word 0xc2220009  ! 3339: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xdc0a0009  ! 3339: LDUB_R	ldub	[%r8 + %r9], %r14
	.word 0xd8da2e48  ! 3339: LDXA_I	ldxa	[%r8, + 0x0e48] %asi, %r12
	.word 0xc3220009  ! 3342: STF_R	st	%f1, [%r9, %r8]
	.word 0xc6120009  ! 3342: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xfea21009  ! 3342: STWA_R	stwa	%r31, [%r8 + %r9] 0x80
	.word 0xc4320009  ! 3345: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc6420009  ! 3345: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xca7a2c18  ! 3345: SWAP_I	swap	%r5, [%r8 + 0x0c18]
	.word 0xcb3a0009  ! 3348: STDF_R	std	%f5, [%r9, %r8]
	.word 0xdc420009  ! 3348: LDSW_R	ldsw	[%r8 + %r9], %r14
	.word 0x8143e063  ! 3348: MEMBAR	membar	#LoadLoad | #StoreLoad | #MemIssue | #Sync 
	.word 0xc8220009  ! 3351: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xed1a0009  ! 3351: LDDF_R	ldd	[%r8, %r9], %f22
	.word 0x8c5228a4  ! 3351: UMUL_I	umul 	%r8, 0x08a4, %r6
	.word 0xc6220009  ! 3354: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xfc420009  ! 3354: LDSW_R	ldsw	[%r8 + %r9], %r30
	.word 0xd6120009  ! 3354: LDUH_R	lduh	[%r8 + %r9], %r11
	.word 0xcd220009  ! 3357: STF_R	st	%f6, [%r9, %r8]
	.word 0xca420009  ! 3357: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xcc420009  ! 3357: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xce320009  ! 3360: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xfc020009  ! 3360: LDUW_R	lduw	[%r8 + %r9], %r30
	.word 0xf5e21009  ! 3360: CASA_I	casa	[%r8] 0x80, %r9, %r26
	.word 0xf62a0009  ! 3363: STB_R	stb	%r27, [%r8 + %r9]
	.word 0xc8420009  ! 3363: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xc3ea1009  ! 3363: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xec720009  ! 3366: STX_R	stx	%r22, [%r8 + %r9]
	.word 0xca0a0009  ! 3366: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0x827a0009  ! 3366: SDIV_R	sdiv 	%r8, %r9, %r1
	.word 0xc6320009  ! 3369: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xcc5a0009  ! 3369: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0x38800001  ! 3369: BGU	bgu,a	<label_0x1>
	.word 0xf4220009  ! 3372: STW_R	stw	%r26, [%r8 + %r9]
	.word 0xca020009  ! 3372: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xca7a0009  ! 3372: SWAP_R	swap	%r5, [%r8 + %r9]
	.word 0xce2a0009  ! 3375: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xcb020009  ! 3375: LDF_R	ld	[%r8, %r9], %f5
	.word 0xcaaa2600  ! 3375: STBA_I	stba	%r5, [%r8 + 0x0600] %asi
	.word 0xcd3a0009  ! 3378: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc8520009  ! 3378: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xc6ca1009  ! 3378: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r3
	.word 0xc22a0009  ! 3381: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xe24a0009  ! 3381: LDSB_R	ldsb	[%r8 + %r9], %r17
	.word 0xc0ba22b0  ! 3381: STDA_I	stda	%r0, [%r8 + 0x02b0] %asi
	.word 0xd6720009  ! 3384: STX_R	stx	%r11, [%r8 + %r9]
	.word 0xc5020009  ! 3384: LDF_R	ld	[%r8, %r9], %f2
	.word 0xc3ea1009  ! 3384: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xce720009  ! 3387: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc31a0009  ! 3387: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xce8a25b4  ! 3387: LDUBA_I	lduba	[%r8, + 0x05b4] %asi, %r7
	.word 0xfb220009  ! 3390: STF_R	st	%f29, [%r9, %r8]
	.word 0xca0a0009  ! 3390: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xc3e22009  ! 3390: CASA_R	casa	[%r8] %asi, %r9, %r1
	.word 0xfc220009  ! 3393: STW_R	stw	%r30, [%r8 + %r9]
	.word 0xcc4a0009  ! 3393: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xc3e22009  ! 3393: CASA_R	casa	[%r8] %asi, %r9, %r1
	.word 0xca2a0009  ! 3396: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xd71a0009  ! 3396: LDDF_R	ldd	[%r8, %r9], %f11
	.word 0xc2da1009  ! 3396: LDXA_R	ldxa	[%r8, %r9] 0x80, %r1
	.word 0xc93a0009  ! 3399: STDF_R	std	%f4, [%r9, %r8]
	.word 0xc4020009  ! 3399: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xe0aa2498  ! 3399: STBA_I	stba	%r16, [%r8 + 0x0498] %asi
	.word 0xfe2a0009  ! 3402: STB_R	stb	%r31, [%r8 + %r9]
	.word 0xc2520009  ! 3402: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0x02ca0001  ! 3402: BRZ	brz  ,pt	%8,<label_0xa0001>
	.word 0xf4220009  ! 3405: STW_R	stw	%r26, [%r8 + %r9]
	.word 0xec120009  ! 3405: LDUH_R	lduh	[%r8 + %r9], %r22
	.word 0xc6020009  ! 3405: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xe9220009  ! 3408: STF_R	st	%f20, [%r9, %r8]
	.word 0xe45a0009  ! 3408: LDX_R	ldx	[%r8 + %r9], %r18
	.word 0x24c20001  ! 3408: BRLEZ	brlez,a,nt	%8,<label_0x20001>
	.word 0xc42a0009  ! 3411: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xce4a0009  ! 3411: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xfaea1009  ! 3411: LDSTUBA_R	ldstuba	%r29, [%r8 + %r9] 0x80
	.word 0xce220009  ! 3414: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xcc0a0009  ! 3414: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xf33a0009  ! 3414: STDF_R	std	%f25, [%r9, %r8]
	.word 0xe4320009  ! 3417: STH_R	sth	%r18, [%r8 + %r9]
	.word 0xda4a0009  ! 3417: LDSB_R	ldsb	[%r8 + %r9], %r13
	.word 0x827a0009  ! 3417: SDIV_R	sdiv 	%r8, %r9, %r1
	.word 0xed3a0009  ! 3420: STDF_R	std	%f22, [%r9, %r8]
	.word 0xc4420009  ! 3420: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xcde21009  ! 3420: CASA_I	casa	[%r8] 0x80, %r9, %r6
	.word 0xe53a0009  ! 3423: STDF_R	std	%f18, [%r9, %r8]
	.word 0xf0420009  ! 3423: LDSW_R	ldsw	[%r8 + %r9], %r24
	.word 0xc4d21009  ! 3423: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r2
	.word 0xf6320009  ! 3426: STH_R	sth	%r27, [%r8 + %r9]
	.word 0xc85a0009  ! 3426: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xde520009  ! 3426: LDSH_R	ldsh	[%r8 + %r9], %r15
	.word 0xfe2a0009  ! 3429: STB_R	stb	%r31, [%r8 + %r9]
	.word 0xd60a0009  ! 3429: LDUB_R	ldub	[%r8 + %r9], %r11
	.word 0xe8aa1009  ! 3429: STBA_R	stba	%r20, [%r8 + %r9] 0x80
	.word 0xca320009  ! 3432: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc64a0009  ! 3432: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xa9a208a9  ! 3432: FSUBs	fsubs	%f8, %f9, %f20
	.word 0xd7220009  ! 3435: STF_R	st	%f11, [%r9, %r8]
	.word 0xcd1a0009  ! 3435: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xc3ea21a4  ! 3435: PREFETCHA_I	prefetcha	[%r8, + 0x01a4] %asi, #one_read
	.word 0xe5220009  ! 3438: STF_R	st	%f18, [%r9, %r8]
	.word 0xc85a0009  ! 3438: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xcf222668  ! 3438: STF_I	st	%f7, [0x0668, %r8]
	.word 0xe2320009  ! 3441: STH_R	sth	%r17, [%r8 + %r9]
	.word 0xc51a0009  ! 3441: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xc36a0009  ! 3441: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xe5220009  ! 3444: STF_R	st	%f18, [%r9, %r8]
	.word 0xf0520009  ! 3444: LDSH_R	ldsh	[%r8 + %r9], %r24
	.word 0x85a208a9  ! 3444: FSUBs	fsubs	%f8, %f9, %f2
	.word 0xca220009  ! 3447: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xca120009  ! 3447: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0x04c20001  ! 3447: BRLEZ	brlez  ,nt	%8,<label_0x20001>
	.word 0xc53a0009  ! 3450: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc2120009  ! 3450: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xcf3a2f60  ! 3450: STDF_I	std	%f7, [0x0f60, %r8]
	.word 0xee220009  ! 3453: STW_R	stw	%r23, [%r8 + %r9]
	.word 0xde5a0009  ! 3453: LDX_R	ldx	[%r8 + %r9], %r15
	.word 0x8143e00e  ! 3453: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore 
	.word 0xcf220009  ! 3456: STF_R	st	%f7, [%r9, %r8]
	.word 0xfb1a0009  ! 3456: LDDF_R	ldd	[%r8, %r9], %f29
	.word 0xf9f22009  ! 3456: CASXA_R	casxa	[%r8]%asi, %r9, %r28
	.word 0xce2a0009  ! 3459: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xda120009  ! 3459: LDUH_R	lduh	[%r8 + %r9], %r13
	.word 0x36800002  ! 3459: BGE	bge,a	<label_0x2>
	.word 0xc3220009  ! 3462: STF_R	st	%f1, [%r9, %r8]
	.word 0xea520009  ! 3462: LDSH_R	ldsh	[%r8 + %r9], %r21
	.word 0xda520009  ! 3462: LDSH_R	ldsh	[%r8 + %r9], %r13
	.word 0xcc2a0009  ! 3465: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc8120009  ! 3465: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0x16800001  ! 3465: BGE	bge  	<label_0x1>
	.word 0xc4320009  ! 3468: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc51a0009  ! 3468: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xc4420009  ! 3468: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xca220009  ! 3471: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc2520009  ! 3471: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0x2c800001  ! 3471: BNEG	bneg,a	<label_0x1>
	.word 0xc6720009  ! 3474: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc7020009  ! 3474: LDF_R	ld	[%r8, %r9], %f3
	.word 0x8143e007  ! 3474: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore 
	.word 0xc93a0009  ! 3477: STDF_R	std	%f4, [%r9, %r8]
	.word 0xc8420009  ! 3477: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0x36800001  ! 3477: BGE	bge,a	<label_0x1>
	.word 0xf13a0009  ! 3480: STDF_R	std	%f24, [%r9, %r8]
	.word 0xec420009  ! 3480: LDSW_R	ldsw	[%r8 + %r9], %r22
	.word 0xda522d64  ! 3480: LDSH_I	ldsh	[%r8 + 0x0d64], %r13
	.word 0xfd3a0009  ! 3483: STDF_R	std	%f30, [%r9, %r8]
	.word 0xca5a0009  ! 3483: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0x8e7a2b7c  ! 3483: SDIV_I	sdiv 	%r8, 0x0b7c, %r7
	.word 0xca2a0009  ! 3486: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xca120009  ! 3486: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0x8e522d0c  ! 3486: UMUL_I	umul 	%r8, 0x0d0c, %r7
	.word 0xcf3a0009  ! 3489: STDF_R	std	%f7, [%r9, %r8]
	.word 0xe0020009  ! 3489: LDUW_R	lduw	[%r8 + %r9], %r16
	.word 0xc41a2a48  ! 3489: LDD_I	ldd	[%r8 + 0x0a48], %r2
	.word 0xca320009  ! 3492: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc91a0009  ! 3492: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0x8143c000  ! 3492: STBAR	stbar
	.word 0xcd3a0009  ! 3495: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc9020009  ! 3495: LDF_R	ld	[%r8, %r9], %f4
	.word 0x84720009  ! 3495: UDIV_R	udiv 	%r8, %r9, %r2
	.word 0xc3220009  ! 3498: STF_R	st	%f1, [%r9, %r8]
	.word 0xdc520009  ! 3498: LDSH_R	ldsh	[%r8 + %r9], %r14
	.word 0x0a800001  ! 3498: BCS	bcs  	<label_0x1>
	.word 0xc2220009  ! 3501: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc84a0009  ! 3501: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xcec21009  ! 3501: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r7
	.word 0xc9220009  ! 3504: STF_R	st	%f4, [%r9, %r8]
	.word 0xc64a0009  ! 3504: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0x82f20009  ! 3504: UDIVcc_R	udivcc 	%r8, %r9, %r1
	.word 0xc6220009  ! 3507: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xcd020009  ! 3507: LDF_R	ld	[%r8, %r9], %f6
	.word 0x89a20929  ! 3507: FMULs	fmuls	%f8, %f9, %f4
	.word 0xc82a0009  ! 3510: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xde4a0009  ! 3510: LDSB_R	ldsb	[%r8 + %r9], %r15
	.word 0x8143c000  ! 3510: STBAR	stbar
	.word 0xca320009  ! 3513: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xca420009  ! 3513: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xc7e21009  ! 3513: CASA_I	casa	[%r8] 0x80, %r9, %r3
	.word 0xc2320009  ! 3516: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xce0a0009  ! 3516: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xc4fa1009  ! 3516: SWAPA_R	swapa	%r2, [%r8 + %r9] 0x80
	.word 0xc33a0009  ! 3519: STDF_R	std	%f1, [%r9, %r8]
	.word 0xde0a0009  ! 3519: LDUB_R	ldub	[%r8 + %r9], %r15
	.word 0xc2f21009  ! 3519: STXA_R	stxa	%r1, [%r8 + %r9] 0x80
	.word 0xcc2a0009  ! 3522: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc8520009  ! 3522: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xc9e21009  ! 3522: CASA_I	casa	[%r8] 0x80, %r9, %r4
	.word 0xeb3a0009  ! 3525: STDF_R	std	%f21, [%r9, %r8]
	.word 0xe80a0009  ! 3525: LDUB_R	ldub	[%r8 + %r9], %r20
	.word 0x8b6a2dc0  ! 3525: SDIVX_I	sdivx	%r8, 0x0dc0, %r5
	.word 0xca220009  ! 3528: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xca4a0009  ! 3528: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0x24c20001  ! 3528: BRLEZ	brlez,a,nt	%8,<label_0x20001>
	.word 0xce2a0009  ! 3531: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc45a0009  ! 3531: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xea921009  ! 3531: LDUHA_R	lduha	[%r8, %r9] 0x80, %r21
	.word 0xc6320009  ! 3534: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xf3020009  ! 3534: LDF_R	ld	[%r8, %r9], %f25
	.word 0xd65a2e68  ! 3534: LDX_I	ldx	[%r8 + 0x0e68], %r11
	.word 0xfb220009  ! 3537: STF_R	st	%f29, [%r9, %r8]
	.word 0xc6420009  ! 3537: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xc3ea1009  ! 3537: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc9220009  ! 3540: STF_R	st	%f4, [%r9, %r8]
	.word 0xc2420009  ! 3540: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xc3ea22e8  ! 3540: PREFETCHA_I	prefetcha	[%r8, + 0x02e8] %asi, #one_read
	.word 0xea2a0009  ! 3543: STB_R	stb	%r21, [%r8 + %r9]
	.word 0xc25a0009  ! 3543: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0x96722fc0  ! 3543: UDIV_I	udiv 	%r8, 0x0fc0, %r11
	.word 0xce320009  ! 3546: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc44a0009  ! 3546: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0x0cca0001  ! 3546: BRGZ	brgz  ,pt	%8,<label_0xa0001>
	.word 0xc73a0009  ! 3549: STDF_R	std	%f3, [%r9, %r8]
	.word 0xf8420009  ! 3549: LDSW_R	ldsw	[%r8 + %r9], %r28
	.word 0x8c6a2f30  ! 3549: UDIVX_I	udivx 	%r8, 0x0f30, %r6
	.word 0xd82a0009  ! 3552: STB_R	stb	%r12, [%r8 + %r9]
	.word 0xfe520009  ! 3552: LDSH_R	ldsh	[%r8 + %r9], %r31
	.word 0xce6a24b8  ! 3552: LDSTUB_I	ldstub	%r7, [%r8 + 0x04b8]
	.word 0xca320009  ! 3555: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xe9020009  ! 3555: LDF_R	ld	[%r8, %r9], %f20
	.word 0xcd222f98  ! 3555: STF_I	st	%f6, [0x0f98, %r8]
	.word 0xc2320009  ! 3558: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xeb020009  ! 3558: LDF_R	ld	[%r8, %r9], %f21
	.word 0xc3ea1009  ! 3558: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xcb3a0009  ! 3561: STDF_R	std	%f5, [%r9, %r8]
	.word 0xc4520009  ! 3561: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xc2822f70  ! 3561: LDUWA_I	lduwa	[%r8, + 0x0f70] %asi, %r1
	.word 0xcc2a0009  ! 3564: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xcb020009  ! 3564: LDF_R	ld	[%r8, %r9], %f5
	.word 0x2cca0001  ! 3564: BRGZ	brgz,a,pt	%8,<label_0xa0001>
	.word 0xcc320009  ! 3567: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xca120009  ! 3567: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xc3ea26c4  ! 3567: PREFETCHA_I	prefetcha	[%r8, + 0x06c4] %asi, #one_read
	.word 0xc3220009  ! 3570: STF_R	st	%f1, [%r9, %r8]
	.word 0xc20a0009  ! 3570: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xc46a2614  ! 3570: LDSTUB_I	ldstub	%r2, [%r8 + 0x0614]
	.word 0xcc320009  ! 3573: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xca520009  ! 3573: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xc49227b8  ! 3573: LDUHA_I	lduha	[%r8, + 0x07b8] %asi, %r2
	.word 0xca2a0009  ! 3576: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xdc0a0009  ! 3576: LDUB_R	ldub	[%r8 + %r9], %r14
	.word 0xc80a2a40  ! 3576: LDUB_I	ldub	[%r8 + 0x0a40], %r4
	.word 0xea720009  ! 3579: STX_R	stx	%r21, [%r8 + %r9]
	.word 0xe8020009  ! 3579: LDUW_R	lduw	[%r8 + %r9], %r20
	.word 0xca420009  ! 3579: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xc4320009  ! 3582: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xcf1a0009  ! 3582: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0x8143c000  ! 3582: STBAR	stbar
	.word 0xdb220009  ! 3585: STF_R	st	%f13, [%r9, %r8]
	.word 0xcc120009  ! 3585: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xf5f21009  ! 3585: CASXA_I	casxa	[%r8] 0x80, %r9, %r26
	.word 0xcd3a0009  ! 3588: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc2420009  ! 3588: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xb32222b0  ! 3588: MULScc_I	mulscc 	%r8, 0x02b0, %r25
	.word 0xc9220009  ! 3591: STF_R	st	%f4, [%r9, %r8]
	.word 0xc4420009  ! 3591: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xc27a0009  ! 3591: SWAP_R	swap	%r1, [%r8 + %r9]
	.word 0xca220009  ! 3594: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xea120009  ! 3594: LDUH_R	lduh	[%r8 + %r9], %r21
	.word 0x8c7a0009  ! 3594: SDIV_R	sdiv 	%r8, %r9, %r6
	.word 0xc8320009  ! 3597: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc2020009  ! 3597: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0x86f2242c  ! 3597: UDIVcc_I	udivcc 	%r8, 0x042c, %r3
	.word 0xc62a0009  ! 3600: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xca120009  ! 3600: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0x83220009  ! 3600: MULScc_R	mulscc 	%r8, %r9, %r1
	.word 0xcf220009  ! 3603: STF_R	st	%f7, [%r9, %r8]
	.word 0xce420009  ! 3603: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0x22800001  ! 3603: BE	be,a	<label_0x1>
	.word 0xf93a0009  ! 3606: STDF_R	std	%f28, [%r9, %r8]
	.word 0xc64a0009  ! 3606: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xc8ca1009  ! 3606: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r4
	.word 0xcd220009  ! 3609: STF_R	st	%f6, [%r9, %r8]
	.word 0xc84a0009  ! 3609: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xc8f22aa8  ! 3609: STXA_I	stxa	%r4, [%r8 + 0x0aa8] %asi
	.word 0xcd220009  ! 3612: STF_R	st	%f6, [%r9, %r8]
	.word 0xde420009  ! 3612: LDSW_R	ldsw	[%r8 + %r9], %r15
	.word 0xc36a2ec8  ! 3612: PREFETCH_I	prefetch	[%r8 + 0x0ec8], #one_read
	.word 0xc9220009  ! 3615: STF_R	st	%f4, [%r9, %r8]
	.word 0xf45a0009  ! 3615: LDX_R	ldx	[%r8 + %r9], %r26
	.word 0x8143c000  ! 3615: STBAR	stbar
	.word 0xc8720009  ! 3618: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xcc120009  ! 3618: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0x88720009  ! 3618: UDIV_R	udiv 	%r8, %r9, %r4
	.word 0xcf3a0009  ! 3621: STDF_R	std	%f7, [%r9, %r8]
	.word 0xfa0a0009  ! 3621: LDUB_R	ldub	[%r8 + %r9], %r29
	.word 0xcc5a2c50  ! 3621: LDX_I	ldx	[%r8 + 0x0c50], %r6
	.word 0xcc320009  ! 3624: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xca120009  ! 3624: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xc4ba20b0  ! 3624: STDA_I	stda	%r2, [%r8 + 0x00b0] %asi
	.word 0xcd3a0009  ! 3627: STDF_R	std	%f6, [%r9, %r8]
	.word 0xcc520009  ! 3627: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0x9ba20829  ! 3627: FADDs	fadds	%f8, %f9, %f13
	.word 0xc42a0009  ! 3630: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc6520009  ! 3630: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xc3ea22a0  ! 3630: PREFETCHA_I	prefetcha	[%r8, + 0x02a0] %asi, #one_read
	.word 0xc8720009  ! 3633: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc64a0009  ! 3633: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xc3ea20ec  ! 3633: PREFETCHA_I	prefetcha	[%r8, + 0x00ec] %asi, #one_read
	.word 0xca720009  ! 3636: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xde5a0009  ! 3636: LDX_R	ldx	[%r8 + %r9], %r15
	.word 0xc68a1009  ! 3636: LDUBA_R	lduba	[%r8, %r9] 0x80, %r3
	.word 0xc53a0009  ! 3639: STDF_R	std	%f2, [%r9, %r8]
	.word 0xe8120009  ! 3639: LDUH_R	lduh	[%r8 + %r9], %r20
	.word 0xc2821009  ! 3639: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r1
	.word 0xc6320009  ! 3642: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xca420009  ! 3642: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xc3ea1009  ! 3642: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc93a0009  ! 3645: STDF_R	std	%f4, [%r9, %r8]
	.word 0xc4520009  ! 3645: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0x8143e07e  ! 3645: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xcc220009  ! 3648: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc6420009  ! 3648: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0x26ca0001  ! 3648: BRLZ	brlz,a,pt	%8,<label_0xa0001>
	.word 0xcc320009  ! 3651: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xea4a0009  ! 3651: LDSB_R	ldsb	[%r8 + %r9], %r21
	.word 0xb0720009  ! 3651: UDIV_R	udiv 	%r8, %r9, %r24
	.word 0xcc220009  ! 3654: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xce4a0009  ! 3654: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0x0ac20001  ! 3654: BRNZ	brnz  ,nt	%8,<label_0x20001>
	.word 0xc3220009  ! 3657: STF_R	st	%f1, [%r9, %r8]
	.word 0xf3020009  ! 3657: LDF_R	ld	[%r8, %r9], %f25
	.word 0xf71a0009  ! 3657: LDDF_R	ldd	[%r8, %r9], %f27
	.word 0xe53a0009  ! 3660: STDF_R	std	%f18, [%r9, %r8]
	.word 0xc31a0009  ! 3660: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xf88a2178  ! 3660: LDUBA_I	lduba	[%r8, + 0x0178] %asi, %r28
	.word 0xc33a0009  ! 3663: STDF_R	std	%f1, [%r9, %r8]
	.word 0xca420009  ! 3663: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xc68227cc  ! 3663: LDUWA_I	lduwa	[%r8, + 0x07cc] %asi, %r3
	.word 0xe13a0009  ! 3666: STDF_R	std	%f16, [%r9, %r8]
	.word 0xc80a0009  ! 3666: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xf8aa2e48  ! 3666: STBA_I	stba	%r28, [%r8 + 0x0e48] %asi
	.word 0xc2720009  ! 3669: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc85a0009  ! 3669: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0x8143c000  ! 3669: STBAR	stbar
	.word 0xca320009  ! 3672: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xfa4a0009  ! 3672: LDSB_R	ldsb	[%r8 + %r9], %r29
	.word 0x8143c000  ! 3672: STBAR	stbar
	.word 0xcc220009  ! 3675: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc4520009  ! 3675: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0x1c800001  ! 3675: BPOS	bpos  	<label_0x1>
	.word 0xc3220009  ! 3678: STF_R	st	%f1, [%r9, %r8]
	.word 0xc4520009  ! 3678: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xc8ba24a8  ! 3678: STDA_I	stda	%r4, [%r8 + 0x04a8] %asi
	.word 0xf73a0009  ! 3681: STDF_R	std	%f27, [%r9, %r8]
	.word 0xc60a0009  ! 3681: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xe9220009  ! 3681: STF_R	st	%f20, [%r9, %r8]
	.word 0xd8720009  ! 3684: STX_R	stx	%r12, [%r8 + %r9]
	.word 0xcd1a0009  ! 3684: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0x865224dc  ! 3684: UMUL_I	umul 	%r8, 0x04dc, %r3
	.word 0xcb220009  ! 3687: STF_R	st	%f5, [%r9, %r8]
	.word 0xcc5a0009  ! 3687: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xccea22cc  ! 3687: LDSTUBA_I	ldstuba	%r6, [%r8 + 0x02cc] %asi
	.word 0xfd220009  ! 3690: STF_R	st	%f30, [%r9, %r8]
	.word 0xcc020009  ! 3690: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xcff21009  ! 3690: CASXA_I	casxa	[%r8] 0x80, %r9, %r7
	.word 0xcc2a0009  ! 3693: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xcc0a0009  ! 3693: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0x856a2b84  ! 3693: SDIVX_I	sdivx	%r8, 0x0b84, %r2
	.word 0xca320009  ! 3696: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc45a0009  ! 3696: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xcbe22009  ! 3696: CASA_R	casa	[%r8] %asi, %r9, %r5
	.word 0xce320009  ! 3699: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc4520009  ! 3699: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xeafa2614  ! 3699: SWAPA_I	swapa	%r21, [%r8 + 0x0614] %asi
	.word 0xc73a0009  ! 3702: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc45a0009  ! 3702: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0x3c800001  ! 3702: BPOS	bpos,a	<label_0x1>
	.word 0xc8720009  ! 3705: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xed1a0009  ! 3705: LDDF_R	ldd	[%r8, %r9], %f22
	.word 0xc36a2ef4  ! 3705: PREFETCH_I	prefetch	[%r8 + 0x0ef4], #one_read
	.word 0xf6320009  ! 3708: STH_R	sth	%r27, [%r8 + %r9]
	.word 0xc25a0009  ! 3708: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0x8143c000  ! 3708: STBAR	stbar
	.word 0xc62a0009  ! 3711: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xca0a0009  ! 3711: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xcada1009  ! 3711: LDXA_R	ldxa	[%r8, %r9] 0x80, %r5
	.word 0xc2220009  ! 3714: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xca5a0009  ! 3714: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xdc42206c  ! 3714: LDSW_I	ldsw	[%r8 + 0x006c], %r14
	.word 0xea220009  ! 3717: STW_R	stw	%r21, [%r8 + %r9]
	.word 0xe2520009  ! 3717: LDSH_R	ldsh	[%r8 + %r9], %r17
	.word 0xa6720009  ! 3717: UDIV_R	udiv 	%r8, %r9, %r19
	.word 0xd73a0009  ! 3720: STDF_R	std	%f11, [%r9, %r8]
	.word 0xe6120009  ! 3720: LDUH_R	lduh	[%r8 + %r9], %r19
	.word 0xc80a2a64  ! 3720: LDUB_I	ldub	[%r8 + 0x0a64], %r4
	.word 0xcf3a0009  ! 3723: STDF_R	std	%f7, [%r9, %r8]
	.word 0xcb020009  ! 3723: LDF_R	ld	[%r8, %r9], %f5
	.word 0x1a800002  ! 3723: BCC	bcc  	<label_0x2>
	.word 0xc22a0009  ! 3726: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xca5a0009  ! 3726: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xc8a22af0  ! 3726: STWA_I	stwa	%r4, [%r8 + 0x0af0] %asi
	.word 0xcb220009  ! 3729: STF_R	st	%f5, [%r9, %r8]
	.word 0xcc5a0009  ! 3729: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xdc4a0009  ! 3729: LDSB_R	ldsb	[%r8 + %r9], %r14
	.word 0xc82a0009  ! 3732: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc64a0009  ! 3732: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xc3220009  ! 3732: STF_R	st	%f1, [%r9, %r8]
	.word 0xc9220009  ! 3735: STF_R	st	%f4, [%r9, %r8]
	.word 0xca020009  ! 3735: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0x9ba20829  ! 3735: FADDs	fadds	%f8, %f9, %f13
	.word 0xc6720009  ! 3738: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc24a0009  ! 3738: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xf87a29a0  ! 3738: SWAP_I	swap	%r28, [%r8 + 0x09a0]
	.word 0xc8220009  ! 3741: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc31a0009  ! 3741: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xdca21009  ! 3741: STWA_R	stwa	%r14, [%r8 + %r9] 0x80
	.word 0xcd220009  ! 3744: STF_R	st	%f6, [%r9, %r8]
	.word 0xc8520009  ! 3744: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xc7e22009  ! 3744: CASA_R	casa	[%r8] %asi, %r9, %r3
	.word 0xce720009  ! 3747: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xcc520009  ! 3747: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0x40000002  ! 3747: CALL	call	disp30_2
	.word 0xcb3a0009  ! 3750: STDF_R	std	%f5, [%r9, %r8]
	.word 0xce020009  ! 3750: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xc36a2390  ! 3750: PREFETCH_I	prefetch	[%r8 + 0x0390], #one_read
	.word 0xca2a0009  ! 3753: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xf8420009  ! 3753: LDSW_R	ldsw	[%r8 + %r9], %r28
	.word 0x8143e039  ! 3753: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside | #MemIssue 
	.word 0xd62a0009  ! 3756: STB_R	stb	%r11, [%r8 + %r9]
	.word 0xce120009  ! 3756: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0x88fa0009  ! 3756: SDIVcc_R	sdivcc 	%r8, %r9, %r4
	.word 0xc53a0009  ! 3759: STDF_R	std	%f2, [%r9, %r8]
	.word 0xce120009  ! 3759: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0x846a0009  ! 3759: UDIVX_R	udivx 	%r8, %r9, %r2
	.word 0xc4220009  ! 3762: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xce4a0009  ! 3762: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xc3e22009  ! 3762: CASA_R	casa	[%r8] %asi, %r9, %r1
	.word 0xc73a0009  ! 3765: STDF_R	std	%f3, [%r9, %r8]
	.word 0xce4a0009  ! 3765: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xcde21009  ! 3765: CASA_I	casa	[%r8] 0x80, %r9, %r6
	.word 0xc8720009  ! 3768: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xcf020009  ! 3768: LDF_R	ld	[%r8, %r9], %f7
	.word 0xc36a2e40  ! 3768: PREFETCH_I	prefetch	[%r8 + 0x0e40], #one_read
	.word 0xc6320009  ! 3771: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xcf1a0009  ! 3771: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xe26a0009  ! 3771: LDSTUB_R	ldstub	%r17, [%r8 + %r9]
	.word 0xf62a0009  ! 3774: STB_R	stb	%r27, [%r8 + %r9]
	.word 0xc4420009  ! 3774: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0x8a5a0009  ! 3774: SMUL_R	smul 	%r8, %r9, %r5
	.word 0xc93a0009  ! 3777: STDF_R	std	%f4, [%r9, %r8]
	.word 0xc3020009  ! 3777: LDF_R	ld	[%r8, %r9], %f1
	.word 0xc2b22970  ! 3777: STHA_I	stha	%r1, [%r8 + 0x0970] %asi
	.word 0xc7220009  ! 3780: STF_R	st	%f3, [%r9, %r8]
	.word 0xc4120009  ! 3780: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xc89a2fe8  ! 3780: LDDA_I	ldda	[%r8, + 0x0fe8] %asi, %r4
	.word 0xcc720009  ! 3783: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc24a0009  ! 3783: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0x0ec20001  ! 3783: BRGEZ	brgez  ,nt	%8,<label_0x20001>
	.word 0xcf3a0009  ! 3786: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc9020009  ! 3786: LDF_R	ld	[%r8, %r9], %f4
	.word 0xc88a1009  ! 3786: LDUBA_R	lduba	[%r8, %r9] 0x80, %r4
	.word 0xca220009  ! 3789: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc24a0009  ! 3789: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xccba1009  ! 3789: STDA_R	stda	%r6, [%r8 + %r9] 0x80
	.word 0xc93a0009  ! 3792: STDF_R	std	%f4, [%r9, %r8]
	.word 0xe4420009  ! 3792: LDSW_R	ldsw	[%r8 + %r9], %r18
	.word 0x887a2354  ! 3792: SDIV_I	sdiv 	%r8, 0x0354, %r4
	.word 0xc2320009  ! 3795: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc2420009  ! 3795: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xcc520009  ! 3795: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xe2220009  ! 3798: STW_R	stw	%r17, [%r8 + %r9]
	.word 0xca020009  ! 3798: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0x826a0009  ! 3798: UDIVX_R	udivx 	%r8, %r9, %r1
	.word 0xc22a0009  ! 3801: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xcc420009  ! 3801: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xa16a0009  ! 3801: SDIVX_R	sdivx	%r8, %r9, %r16
	.word 0xf3220009  ! 3804: STF_R	st	%f25, [%r9, %r8]
	.word 0xf40a0009  ! 3804: LDUB_R	ldub	[%r8 + %r9], %r26
	.word 0xcaaa2eb0  ! 3804: STBA_I	stba	%r5, [%r8 + 0x0eb0] %asi
	.word 0xf6320009  ! 3807: STH_R	sth	%r27, [%r8 + %r9]
	.word 0xcf020009  ! 3807: LDF_R	ld	[%r8, %r9], %f7
	.word 0x2cc20001  ! 3807: BRGZ	brgz,a,nt	%8,<label_0x20001>
	.word 0xcc2a0009  ! 3810: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc64a0009  ! 3810: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xc36a2110  ! 3810: PREFETCH_I	prefetch	[%r8 + 0x0110], #one_read
	.word 0xfe720009  ! 3813: STX_R	stx	%r31, [%r8 + %r9]
	.word 0xc8020009  ! 3813: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xa1a209a9  ! 3813: FDIVs	fdivs	%f8, %f9, %f16
	.word 0xc3220009  ! 3816: STF_R	st	%f1, [%r9, %r8]
	.word 0xee5a0009  ! 3816: LDX_R	ldx	[%r8 + %r9], %r23
	.word 0xc3ea1009  ! 3816: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xf7220009  ! 3819: STF_R	st	%f27, [%r9, %r8]
	.word 0xc91a0009  ! 3819: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xc36a2bc0  ! 3819: PREFETCH_I	prefetch	[%r8 + 0x0bc0], #one_read
	.word 0xdc720009  ! 3822: STX_R	stx	%r14, [%r8 + %r9]
	.word 0xc40a0009  ! 3822: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0x8143c000  ! 3822: STBAR	stbar
	.word 0xef220009  ! 3825: STF_R	st	%f23, [%r9, %r8]
	.word 0xc2120009  ! 3825: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xf41a2588  ! 3825: LDD_I	ldd	[%r8 + 0x0588], %r26
	.word 0xcb3a0009  ! 3828: STDF_R	std	%f5, [%r9, %r8]
	.word 0xe64a0009  ! 3828: LDSB_R	ldsb	[%r8 + %r9], %r19
	.word 0x992223e0  ! 3828: MULScc_I	mulscc 	%r8, 0x03e0, %r12
	.word 0xde220009  ! 3831: STW_R	stw	%r15, [%r8 + %r9]
	.word 0xc6120009  ! 3831: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xc4aa2384  ! 3831: STBA_I	stba	%r2, [%r8 + 0x0384] %asi
	.word 0xf02a0009  ! 3834: STB_R	stb	%r24, [%r8 + %r9]
	.word 0xc8420009  ! 3834: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xca420009  ! 3834: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xcc220009  ! 3837: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc45a0009  ! 3837: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xc3ea1009  ! 3837: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xcd220009  ! 3840: STF_R	st	%f6, [%r9, %r8]
	.word 0xcf020009  ! 3840: LDF_R	ld	[%r8, %r9], %f7
	.word 0x26800001  ! 3840: BL	bl,a	<label_0x1>
	.word 0xc2320009  ! 3843: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xca5a0009  ! 3843: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0x8143e059  ! 3843: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside | #Sync 
	.word 0xf0320009  ! 3846: STH_R	sth	%r24, [%r8 + %r9]
	.word 0xfc4a0009  ! 3846: LDSB_R	ldsb	[%r8 + %r9], %r30
	.word 0x8e522970  ! 3846: UMUL_I	umul 	%r8, 0x0970, %r7
	.word 0xd6220009  ! 3849: STW_R	stw	%r11, [%r8 + %r9]
	.word 0xcb020009  ! 3849: LDF_R	ld	[%r8, %r9], %f5
	.word 0x9da209a9  ! 3849: FDIVs	fdivs	%f8, %f9, %f14
	.word 0xde2a0009  ! 3852: STB_R	stb	%r15, [%r8 + %r9]
	.word 0xca520009  ! 3852: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xafa20829  ! 3852: FADDs	fadds	%f8, %f9, %f23
	.word 0xe1220009  ! 3855: STF_R	st	%f16, [%r9, %r8]
	.word 0xd85a0009  ! 3855: LDX_R	ldx	[%r8 + %r9], %r12
	.word 0x8143e008  ! 3855: MEMBAR	membar	#StoreStore 
	.word 0xc82a0009  ! 3858: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc84a0009  ! 3858: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xc3022cdc  ! 3858: LDF_I	ld	[%r8, 0x0cdc], %f1
	.word 0xdf220009  ! 3861: STF_R	st	%f15, [%r9, %r8]
	.word 0xc20a0009  ! 3861: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0x827a0009  ! 3861: SDIV_R	sdiv 	%r8, %r9, %r1
	.word 0xce320009  ! 3864: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xda4a0009  ! 3864: LDSB_R	ldsb	[%r8 + %r9], %r13
	.word 0xcca21009  ! 3864: STWA_R	stwa	%r6, [%r8 + %r9] 0x80
	.word 0xc6720009  ! 3867: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xcc420009  ! 3867: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0x8143c000  ! 3867: STBAR	stbar
	.word 0xcb220009  ! 3870: STF_R	st	%f5, [%r9, %r8]
	.word 0xc6520009  ! 3870: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xc2aa2c70  ! 3870: STBA_I	stba	%r1, [%r8 + 0x0c70] %asi
	.word 0xcd3a0009  ! 3873: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc8520009  ! 3873: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xccf21009  ! 3873: STXA_R	stxa	%r6, [%r8 + %r9] 0x80
	.word 0xcc320009  ! 3876: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc6120009  ! 3876: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xc3ea1009  ! 3876: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xe7220009  ! 3879: STF_R	st	%f19, [%r9, %r8]
	.word 0xcc020009  ! 3879: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xc3ea1009  ! 3879: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc2720009  ! 3882: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xe3020009  ! 3882: LDF_R	ld	[%r8, %r9], %f17
	.word 0x8a5a0009  ! 3882: SMUL_R	smul 	%r8, %r9, %r5
	.word 0xe5220009  ! 3885: STF_R	st	%f18, [%r9, %r8]
	.word 0xc8520009  ! 3885: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xee520009  ! 3885: LDSH_R	ldsh	[%r8 + %r9], %r23
	.word 0xc5220009  ! 3888: STF_R	st	%f2, [%r9, %r8]
	.word 0xea120009  ! 3888: LDUH_R	lduh	[%r8 + %r9], %r21
	.word 0x8143e013  ! 3888: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside 
	.word 0xf4320009  ! 3891: STH_R	sth	%r26, [%r8 + %r9]
	.word 0xf0120009  ! 3891: LDUH_R	lduh	[%r8 + %r9], %r24
	.word 0xc26a2f2c  ! 3891: LDSTUB_I	ldstub	%r1, [%r8 + 0x0f2c]
	.word 0xda220009  ! 3894: STW_R	stw	%r13, [%r8 + %r9]
	.word 0xc60a0009  ! 3894: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0x8143e021  ! 3894: MEMBAR	membar	#LoadLoad | #MemIssue 
	.word 0xca2a0009  ! 3897: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xce020009  ! 3897: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xcd2226b8  ! 3897: STF_I	st	%f6, [0x06b8, %r8]
	.word 0xca220009  ! 3900: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc6120009  ! 3900: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0x26ca0001  ! 3900: BRLZ	brlz,a,pt	%8,<label_0xa0001>
	.word 0xe93a0009  ! 3903: STDF_R	std	%f20, [%r9, %r8]
	.word 0xc8020009  ! 3903: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0x8e5a26cc  ! 3903: SMUL_I	smul 	%r8, 0x06cc, %r7
	.word 0xc6320009  ! 3906: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xe9020009  ! 3906: LDF_R	ld	[%r8, %r9], %f20
	.word 0x26c20001  ! 3906: BRLZ	brlz,a,nt	%8,<label_0x20001>
	.word 0xc7220009  ! 3909: STF_R	st	%f3, [%r9, %r8]
	.word 0xca0a0009  ! 3909: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xff220009  ! 3909: STF_R	st	%f31, [%r9, %r8]
	.word 0xcd220009  ! 3912: STF_R	st	%f6, [%r9, %r8]
	.word 0xca120009  ! 3912: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xc3ea258c  ! 3912: PREFETCHA_I	prefetcha	[%r8, + 0x058c] %asi, #one_read
	.word 0xcb3a0009  ! 3915: STDF_R	std	%f5, [%r9, %r8]
	.word 0xe0120009  ! 3915: LDUH_R	lduh	[%r8 + %r9], %r16
	.word 0xfa7a2e50  ! 3915: SWAP_I	swap	%r29, [%r8 + 0x0e50]
	.word 0xc42a0009  ! 3918: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc8120009  ! 3918: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xcab21009  ! 3918: STHA_R	stha	%r5, [%r8 + %r9] 0x80
	.word 0xc6220009  ! 3921: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xce4a0009  ! 3921: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0x8b222410  ! 3921: MULScc_I	mulscc 	%r8, 0x0410, %r5
	.word 0xcc320009  ! 3924: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xf6020009  ! 3924: LDUW_R	lduw	[%r8 + %r9], %r27
	.word 0xa6720009  ! 3924: UDIV_R	udiv 	%r8, %r9, %r19
	.word 0xcb3a0009  ! 3927: STDF_R	std	%f5, [%r9, %r8]
	.word 0xf6020009  ! 3927: LDUW_R	lduw	[%r8 + %r9], %r27
	.word 0xf9f22009  ! 3927: CASXA_R	casxa	[%r8]%asi, %r9, %r28
	.word 0xc7220009  ! 3930: STF_R	st	%f3, [%r9, %r8]
	.word 0xf40a0009  ! 3930: LDUB_R	ldub	[%r8 + %r9], %r26
	.word 0xc24a0009  ! 3930: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xc7220009  ! 3933: STF_R	st	%f3, [%r9, %r8]
	.word 0xf4120009  ! 3933: LDUH_R	lduh	[%r8 + %r9], %r26
	.word 0x8da209a9  ! 3933: FDIVs	fdivs	%f8, %f9, %f6
	.word 0xd73a0009  ! 3936: STDF_R	std	%f11, [%r9, %r8]
	.word 0xc84a0009  ! 3936: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xc3ea1009  ! 3936: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc8220009  ! 3939: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc6420009  ! 3939: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xc7f22009  ! 3939: CASXA_R	casxa	[%r8]%asi, %r9, %r3
	.word 0xc33a0009  ! 3942: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc7020009  ! 3942: LDF_R	ld	[%r8, %r9], %f3
	.word 0x14800002  ! 3942: BG	bg  	<label_0x2>
	.word 0xe6220009  ! 3945: STW_R	stw	%r19, [%r8 + %r9]
	.word 0xf40a0009  ! 3945: LDUB_R	ldub	[%r8 + %r9], %r26
	.word 0xc8020009  ! 3945: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xce320009  ! 3948: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc4120009  ! 3948: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xe0ba23e0  ! 3948: STDA_I	stda	%r16, [%r8 + 0x03e0] %asi
	.word 0xc5220009  ! 3951: STF_R	st	%f2, [%r9, %r8]
	.word 0xc4420009  ! 3951: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xc26a28c4  ! 3951: LDSTUB_I	ldstub	%r1, [%r8 + 0x08c4]
	.word 0xe8720009  ! 3954: STX_R	stx	%r20, [%r8 + %r9]
	.word 0xcb020009  ! 3954: LDF_R	ld	[%r8, %r9], %f5
	.word 0xec1a2360  ! 3954: LDD_I	ldd	[%r8 + 0x0360], %r22
	.word 0xc22a0009  ! 3957: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xcd020009  ! 3957: LDF_R	ld	[%r8, %r9], %f6
	.word 0xa3220009  ! 3957: MULScc_R	mulscc 	%r8, %r9, %r17
	.word 0xcc220009  ! 3960: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc2520009  ! 3960: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xc65a2840  ! 3960: LDX_I	ldx	[%r8 + 0x0840], %r3
	.word 0xe62a0009  ! 3963: STB_R	stb	%r19, [%r8 + %r9]
	.word 0xc7020009  ! 3963: LDF_R	ld	[%r8, %r9], %f3
	.word 0x0aca0001  ! 3963: BRNZ	brnz  ,pt	%8,<label_0xa0001>
	.word 0xfb220009  ! 3966: STF_R	st	%f29, [%r9, %r8]
	.word 0xde420009  ! 3966: LDSW_R	ldsw	[%r8 + %r9], %r15
	.word 0xcf2223e0  ! 3966: STF_I	st	%f7, [0x03e0, %r8]
	.word 0xc4220009  ! 3969: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc2420009  ! 3969: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xb8522810  ! 3969: UMUL_I	umul 	%r8, 0x0810, %r28
	.word 0xc2220009  ! 3972: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc8420009  ! 3972: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xc36a2d64  ! 3972: PREFETCH_I	prefetch	[%r8 + 0x0d64], #one_read
	.word 0xc4720009  ! 3975: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xe1020009  ! 3975: LDF_R	ld	[%r8, %r9], %f16
	.word 0xc8a22060  ! 3975: STWA_I	stwa	%r4, [%r8 + 0x0060] %asi
	.word 0xcd220009  ! 3978: STF_R	st	%f6, [%r9, %r8]
	.word 0xfa020009  ! 3978: LDUW_R	lduw	[%r8 + %r9], %r29
	.word 0xc3ea1009  ! 3978: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xf2320009  ! 3981: STH_R	sth	%r25, [%r8 + %r9]
	.word 0xc24a0009  ! 3981: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xb8d20009  ! 3981: UMULcc_R	umulcc 	%r8, %r9, %r28
	.word 0xca320009  ! 3984: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc8120009  ! 3984: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xc9e22009  ! 3984: CASA_R	casa	[%r8] %asi, %r9, %r4
	.word 0xc93a0009  ! 3987: STDF_R	std	%f4, [%r9, %r8]
	.word 0xf2020009  ! 3987: LDUW_R	lduw	[%r8 + %r9], %r25
	.word 0xde921009  ! 3987: LDUHA_R	lduha	[%r8, %r9] 0x80, %r15
	.word 0xf22a0009  ! 3990: STB_R	stb	%r25, [%r8 + %r9]
	.word 0xc8020009  ! 3990: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xd8822f80  ! 3990: LDUWA_I	lduwa	[%r8, + 0x0f80] %asi, %r12
	.word 0xcf3a0009  ! 3993: STDF_R	std	%f7, [%r9, %r8]
	.word 0xea520009  ! 3993: LDSH_R	ldsh	[%r8 + %r9], %r21
	.word 0xc4ba1009  ! 3993: STDA_R	stda	%r2, [%r8 + %r9] 0x80
	.word 0xdb3a0009  ! 3996: STDF_R	std	%f13, [%r9, %r8]
	.word 0xc20a0009  ! 3996: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0x8f222054  ! 3996: MULScc_I	mulscc 	%r8, 0x0054, %r7
	.word 0xc93a0009  ! 3999: STDF_R	std	%f4, [%r9, %r8]
	.word 0xf05a0009  ! 3999: LDX_R	ldx	[%r8 + %r9], %r24
	.word 0xc6a222a0  ! 3999: STWA_I	stwa	%r3, [%r8 + 0x02a0] %asi
        ta      T_GOOD_TRAP

th_main_1:
        setx  MAIN_BASE_DATA_VA, %r1, %r8
        setx  0x0000000000000dd0, %g1, %r9
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
        setx  0x433f041eb26f526e, %g1, %r0
        setx  0xb7a7775264677c29, %g1, %r1
        setx  0x69cc8728d77c1944, %g1, %r2
        setx  0x80d72a46197d2b67, %g1, %r3
        setx  0x995a5abf43fa899e, %g1, %r4
        setx  0x4605e04bec394ab3, %g1, %r5
        setx  0x96f513b3d1f3eaa3, %g1, %r6
        setx  0xdea05a436e2c8737, %g1, %r7
        setx  0xa37e00ef39ad62d1, %g1, %r10
        setx  0x60769bebe0912e43, %g1, %r11
        setx  0x714dc24cc57b1aac, %g1, %r12
        setx  0xe097fc0859d2e91c, %g1, %r13
        setx  0xb34e8c9c887f8dd4, %g1, %r14
        setx  0xc7daa1aa03d9f94a, %g1, %r15
        setx  0x67f2b9d3d76793a6, %g1, %r16
        setx  0xf2440916e548b801, %g1, %r17
        setx  0xdcfa67ee3de17f7e, %g1, %r18
        setx  0xcc9e89cfe6278bab, %g1, %r19
        setx  0x1933504f6b5d2098, %g1, %r20
        setx  0x26991119e3c57f9d, %g1, %r21
        setx  0x71a9cad6dfd8b10c, %g1, %r22
        setx  0x7fe0db5d60f34121, %g1, %r23
        setx  0x953d7f1f3fc9c1b1, %g1, %r24
        setx  0x0fb8a5452813196d, %g1, %r25
        setx  0x5b73e36a3329a9ed, %g1, %r26
        setx  0x27b609bee80a4932, %g1, %r27
        setx  0xe063ffddb52f3683, %g1, %r28
        setx  0x511ce819c6375957, %g1, %r29
        setx  0x6bd8fa0443388a5f, %g1, %r30
        setx  0x7304ac2cd5a8afd1, %g1, %r31
	.word 0xce220009  ! 3: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc91a0009  ! 3: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0x0a800001  ! 3: BCS	bcs  	<label_0x1>
	.word 0xe22a0009  ! 6: STB_R	stb	%r17, [%r8 + %r9]
	.word 0xc2020009  ! 6: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0x36800001  ! 6: BGE	bge,a	<label_0x1>
	.word 0xfb220009  ! 9: STF_R	st	%f29, [%r9, %r8]
	.word 0xce020009  ! 9: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xc67a0009  ! 9: SWAP_R	swap	%r3, [%r8 + %r9]
	.word 0xdd220009  ! 12: STF_R	st	%f14, [%r9, %r8]
	.word 0xc51a0009  ! 12: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xb25a0009  ! 12: SMUL_R	smul 	%r8, %r9, %r25
	.word 0xcc320009  ! 15: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc9020009  ! 15: LDF_R	ld	[%r8, %r9], %f4
	.word 0x8a6a2db4  ! 15: UDIVX_I	udivx 	%r8, 0x0db4, %r5
	.word 0xc33a0009  ! 18: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc2020009  ! 18: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0x0c800002  ! 18: BNEG	bneg  	<label_0x2>
	.word 0xcc2a0009  ! 21: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc8020009  ! 21: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xccf22718  ! 21: STXA_I	stxa	%r6, [%r8 + 0x0718] %asi
	.word 0xf82a0009  ! 24: STB_R	stb	%r28, [%r8 + %r9]
	.word 0xcc420009  ! 24: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xc6a21009  ! 24: STWA_R	stwa	%r3, [%r8 + %r9] 0x80
	.word 0xcd220009  ! 27: STF_R	st	%f6, [%r9, %r8]
	.word 0xcb1a0009  ! 27: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xc46a22a4  ! 27: LDSTUB_I	ldstub	%r2, [%r8 + 0x02a4]
	.word 0xce220009  ! 30: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xdb1a0009  ! 30: LDDF_R	ldd	[%r8, %r9], %f13
	.word 0xbf6a0009  ! 30: SDIVX_R	sdivx	%r8, %r9, %r31
	.word 0xc33a0009  ! 33: STDF_R	std	%f1, [%r9, %r8]
	.word 0xfc120009  ! 33: LDUH_R	lduh	[%r8 + %r9], %r30
	.word 0x8a4a0009  ! 33: MULX_R	mulx 	%r8, %r9, %r5
	.word 0xcf220009  ! 36: STF_R	st	%f7, [%r9, %r8]
	.word 0xc71a0009  ! 36: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xc3ea245c  ! 36: PREFETCHA_I	prefetcha	[%r8, + 0x045c] %asi, #one_read
	.word 0xf42a0009  ! 39: STB_R	stb	%r26, [%r8 + %r9]
	.word 0xcf020009  ! 39: LDF_R	ld	[%r8, %r9], %f7
	.word 0xc80a2c1c  ! 39: LDUB_I	ldub	[%r8 + 0x0c1c], %r4
	.word 0xc6720009  ! 42: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xea0a0009  ! 42: LDUB_R	ldub	[%r8 + %r9], %r21
	.word 0xcaea1009  ! 42: LDSTUBA_R	ldstuba	%r5, [%r8 + %r9] 0x80
	.word 0xce320009  ! 45: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc31a0009  ! 45: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xcef21009  ! 45: STXA_R	stxa	%r7, [%r8 + %r9] 0x80
	.word 0xcb220009  ! 48: STF_R	st	%f5, [%r9, %r8]
	.word 0xc91a0009  ! 48: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xccd22fac  ! 48: LDSHA_I	ldsha	[%r8, + 0x0fac] %asi, %r6
	.word 0xcb3a0009  ! 51: STDF_R	std	%f5, [%r9, %r8]
	.word 0xcb020009  ! 51: LDF_R	ld	[%r8, %r9], %f5
	.word 0x9a722054  ! 51: UDIV_I	udiv 	%r8, 0x0054, %r13
	.word 0xc4720009  ! 54: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc8520009  ! 54: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xf8d224bc  ! 54: LDSHA_I	ldsha	[%r8, + 0x04bc] %asi, %r28
	.word 0xc82a0009  ! 57: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xde5a0009  ! 57: LDX_R	ldx	[%r8 + %r9], %r15
	.word 0xc0ba1009  ! 57: STDA_R	stda	%r0, [%r8 + %r9] 0x80
	.word 0xcb220009  ! 60: STF_R	st	%f5, [%r9, %r8]
	.word 0xee4a0009  ! 60: LDSB_R	ldsb	[%r8 + %r9], %r23
	.word 0xe2020009  ! 60: LDUW_R	lduw	[%r8 + %r9], %r17
	.word 0xfd3a0009  ! 63: STDF_R	std	%f30, [%r9, %r8]
	.word 0xcf020009  ! 63: LDF_R	ld	[%r8, %r9], %f7
	.word 0x2e800001  ! 63: BVS	bvs,a	<label_0x1>
	.word 0xca320009  ! 66: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc51a0009  ! 66: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xa0d20009  ! 66: UMULcc_R	umulcc 	%r8, %r9, %r16
	.word 0xc2320009  ! 69: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xcc4a0009  ! 69: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xf2422e78  ! 69: LDSW_I	ldsw	[%r8 + 0x0e78], %r25
	.word 0xe6320009  ! 72: STH_R	sth	%r19, [%r8 + %r9]
	.word 0xd65a0009  ! 72: LDX_R	ldx	[%r8 + %r9], %r11
	.word 0xc3ea1009  ! 72: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc6720009  ! 75: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xf6420009  ! 75: LDSW_R	ldsw	[%r8 + %r9], %r27
	.word 0xf2d225fc  ! 75: LDSHA_I	ldsha	[%r8, + 0x05fc] %asi, %r25
	.word 0xcd3a0009  ! 78: STDF_R	std	%f6, [%r9, %r8]
	.word 0xf44a0009  ! 78: LDSB_R	ldsb	[%r8 + %r9], %r26
	.word 0x8143c000  ! 78: STBAR	stbar
	.word 0xc93a0009  ! 81: STDF_R	std	%f4, [%r9, %r8]
	.word 0xc8120009  ! 81: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0x8143e011  ! 81: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xc4320009  ! 84: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xcc520009  ! 84: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xcf0229d8  ! 84: LDF_I	ld	[%r8, 0x09d8], %f7
	.word 0xf5220009  ! 87: STF_R	st	%f26, [%r9, %r8]
	.word 0xcf1a0009  ! 87: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xe4420009  ! 87: LDSW_R	ldsw	[%r8 + %r9], %r18
	.word 0xcc220009  ! 90: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc65a0009  ! 90: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xcf222264  ! 90: STF_I	st	%f7, [0x0264, %r8]
	.word 0xcd220009  ! 93: STF_R	st	%f6, [%r9, %r8]
	.word 0xca0a0009  ! 93: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xf4ba1009  ! 93: STDA_R	stda	%r26, [%r8 + %r9] 0x80
	.word 0xcd220009  ! 96: STF_R	st	%f6, [%r9, %r8]
	.word 0xca020009  ! 96: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0x30800002  ! 96: BA	ba,a	<label_0x2>
	.word 0xc9220009  ! 99: STF_R	st	%f4, [%r9, %r8]
	.word 0xc4520009  ! 99: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xdd222e54  ! 99: STF_I	st	%f14, [0x0e54, %r8]
	.word 0xfc220009  ! 102: STW_R	stw	%r30, [%r8 + %r9]
	.word 0xc45a0009  ! 102: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xcab22588  ! 102: STHA_I	stha	%r5, [%r8 + 0x0588] %asi
	.word 0xde2a0009  ! 105: STB_R	stb	%r15, [%r8 + %r9]
	.word 0xc64a0009  ! 105: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0x98fa2ad4  ! 105: SDIVcc_I	sdivcc 	%r8, 0x0ad4, %r12
	.word 0xc8320009  ! 108: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xca5a0009  ! 108: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0x8143c000  ! 108: STBAR	stbar
	.word 0xcc2a0009  ! 111: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xfe520009  ! 111: LDSH_R	ldsh	[%r8 + %r9], %r31
	.word 0xcbe21009  ! 111: CASA_I	casa	[%r8] 0x80, %r9, %r5
	.word 0xc62a0009  ! 114: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xcc120009  ! 114: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xc5222680  ! 114: STF_I	st	%f2, [0x0680, %r8]
	.word 0xc42a0009  ! 117: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xca5a0009  ! 117: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xf0ba2f38  ! 117: STDA_I	stda	%r24, [%r8 + 0x0f38] %asi
	.word 0xc22a0009  ! 120: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xf45a0009  ! 120: LDX_R	ldx	[%r8 + %r9], %r26
	.word 0xccba2a10  ! 120: STDA_I	stda	%r6, [%r8 + 0x0a10] %asi
	.word 0xe22a0009  ! 123: STB_R	stb	%r17, [%r8 + %r9]
	.word 0xc91a0009  ! 123: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xc3e22009  ! 123: CASA_R	casa	[%r8] %asi, %r9, %r1
	.word 0xc6220009  ! 126: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xee0a0009  ! 126: LDUB_R	ldub	[%r8 + %r9], %r23
	.word 0x8143e05e  ! 126: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0xc93a0009  ! 129: STDF_R	std	%f4, [%r9, %r8]
	.word 0xe20a0009  ! 129: LDUB_R	ldub	[%r8 + %r9], %r17
	.word 0xc3ea1009  ! 129: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xde2a0009  ! 132: STB_R	stb	%r15, [%r8 + %r9]
	.word 0xc44a0009  ! 132: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0x89a208a9  ! 132: FSUBs	fsubs	%f8, %f9, %f4
	.word 0xcc220009  ! 135: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xcb020009  ! 135: LDF_R	ld	[%r8, %r9], %f5
	.word 0x97a20829  ! 135: FADDs	fadds	%f8, %f9, %f11
	.word 0xc82a0009  ! 138: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xe85a0009  ! 138: LDX_R	ldx	[%r8 + %r9], %r20
	.word 0xccea1009  ! 138: LDSTUBA_R	ldstuba	%r6, [%r8 + %r9] 0x80
	.word 0xc8320009  ! 141: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xcc5a0009  ! 141: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0x8143c000  ! 141: STBAR	stbar
	.word 0xc73a0009  ! 144: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc24a0009  ! 144: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xc81a2908  ! 144: LDD_I	ldd	[%r8 + 0x0908], %r4
	.word 0xca2a0009  ! 147: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xef1a0009  ! 147: LDDF_R	ldd	[%r8, %r9], %f23
	.word 0xcaca1009  ! 147: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r5
	.word 0xf62a0009  ! 150: STB_R	stb	%r27, [%r8 + %r9]
	.word 0xec4a0009  ! 150: LDSB_R	ldsb	[%r8 + %r9], %r22
	.word 0xaa722d90  ! 150: UDIV_I	udiv 	%r8, 0x0d90, %r21
	.word 0xc22a0009  ! 153: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xce520009  ! 153: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xd60a0009  ! 153: LDUB_R	ldub	[%r8 + %r9], %r11
	.word 0xf0320009  ! 156: STH_R	sth	%r24, [%r8 + %r9]
	.word 0xc64a0009  ! 156: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0x84fa29d8  ! 156: SDIVcc_I	sdivcc 	%r8, 0x09d8, %r2
	.word 0xe62a0009  ! 159: STB_R	stb	%r19, [%r8 + %r9]
	.word 0xc4020009  ! 159: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xc4ba1009  ! 159: STDA_R	stda	%r2, [%r8 + %r9] 0x80
	.word 0xf6220009  ! 162: STW_R	stw	%r27, [%r8 + %r9]
	.word 0xc4520009  ! 162: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0x8cda0009  ! 162: SMULcc_R	smulcc 	%r8, %r9, %r6
	.word 0xca320009  ! 165: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc8520009  ! 165: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xf6520009  ! 165: LDSH_R	ldsh	[%r8 + %r9], %r27
	.word 0xc42a0009  ! 168: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc51a0009  ! 168: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0x887a0009  ! 168: SDIV_R	sdiv 	%r8, %r9, %r4
	.word 0xc93a0009  ! 171: STDF_R	std	%f4, [%r9, %r8]
	.word 0xc91a0009  ! 171: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xada20829  ! 171: FADDs	fadds	%f8, %f9, %f22
	.word 0xce220009  ! 174: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xcd020009  ! 174: LDF_R	ld	[%r8, %r9], %f6
	.word 0xcf220009  ! 174: STF_R	st	%f7, [%r9, %r8]
	.word 0xea2a0009  ! 177: STB_R	stb	%r21, [%r8 + %r9]
	.word 0xcc4a0009  ! 177: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xdaf21009  ! 177: STXA_R	stxa	%r13, [%r8 + %r9] 0x80
	.word 0xce720009  ! 180: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc2020009  ! 180: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xcc6a0009  ! 180: LDSTUB_R	ldstub	%r6, [%r8 + %r9]
	.word 0xc8720009  ! 183: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xce0a0009  ! 183: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xc2422ef4  ! 183: LDSW_I	ldsw	[%r8 + 0x0ef4], %r1
	.word 0xcc220009  ! 186: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xcf1a0009  ! 186: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xc3ea1009  ! 186: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xe53a0009  ! 189: STDF_R	std	%f18, [%r9, %r8]
	.word 0xc84a0009  ! 189: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0x2c800002  ! 189: BNEG	bneg,a	<label_0x2>
	.word 0xdc720009  ! 192: STX_R	stx	%r14, [%r8 + %r9]
	.word 0xca020009  ! 192: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xc7220009  ! 192: STF_R	st	%f3, [%r9, %r8]
	.word 0xce320009  ! 195: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xca420009  ! 195: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xce1225d8  ! 195: LDUH_I	lduh	[%r8 + 0x05d8], %r7
	.word 0xce720009  ! 198: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc4020009  ! 198: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xfd3a2970  ! 198: STDF_I	std	%f30, [0x0970, %r8]
	.word 0xe8220009  ! 201: STW_R	stw	%r20, [%r8 + %r9]
	.word 0xc5020009  ! 201: LDF_R	ld	[%r8, %r9], %f2
	.word 0xaefa0009  ! 201: SDIVcc_R	sdivcc 	%r8, %r9, %r23
	.word 0xc6220009  ! 204: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xee4a0009  ! 204: LDSB_R	ldsb	[%r8 + %r9], %r23
	.word 0x8efa2548  ! 204: SDIVcc_I	sdivcc 	%r8, 0x0548, %r7
	.word 0xcd220009  ! 207: STF_R	st	%f6, [%r9, %r8]
	.word 0xfc520009  ! 207: LDSH_R	ldsh	[%r8 + %r9], %r30
	.word 0x88f224a4  ! 207: UDIVcc_I	udivcc 	%r8, 0x04a4, %r4
	.word 0xc4720009  ! 210: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xe9020009  ! 210: LDF_R	ld	[%r8, %r9], %f20
	.word 0xc36a2098  ! 210: PREFETCH_I	prefetch	[%r8 + 0x0098], #one_read
	.word 0xcc320009  ! 213: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xcd020009  ! 213: LDF_R	ld	[%r8, %r9], %f6
	.word 0x84520009  ! 213: UMUL_R	umul 	%r8, %r9, %r2
	.word 0xce2a0009  ! 216: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xd84a0009  ! 216: LDSB_R	ldsb	[%r8 + %r9], %r12
	.word 0x2ec20001  ! 216: BRGEZ	brgez,a,nt	%8,<label_0x20001>
	.word 0xc2720009  ! 219: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xf44a0009  ! 219: LDSB_R	ldsb	[%r8 + %r9], %r26
	.word 0xe13a0009  ! 219: STDF_R	std	%f16, [%r9, %r8]
	.word 0xf22a0009  ! 222: STB_R	stb	%r25, [%r8 + %r9]
	.word 0xce020009  ! 222: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0x8cd20009  ! 222: UMULcc_R	umulcc 	%r8, %r9, %r6
	.word 0xc2320009  ! 225: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xf80a0009  ! 225: LDUB_R	ldub	[%r8 + %r9], %r28
	.word 0x87a209a9  ! 225: FDIVs	fdivs	%f8, %f9, %f3
	.word 0xc22a0009  ! 228: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xee0a0009  ! 228: LDUB_R	ldub	[%r8 + %r9], %r23
	.word 0x8fa20929  ! 228: FMULs	fmuls	%f8, %f9, %f7
	.word 0xce220009  ! 231: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xe8420009  ! 231: LDSW_R	ldsw	[%r8 + %r9], %r20
	.word 0x85a209a9  ! 231: FDIVs	fdivs	%f8, %f9, %f2
	.word 0xe7220009  ! 234: STF_R	st	%f19, [%r9, %r8]
	.word 0xce0a0009  ! 234: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xc33a0009  ! 234: STDF_R	std	%f1, [%r9, %r8]
	.word 0xce320009  ! 237: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc31a0009  ! 237: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xa8da0009  ! 237: SMULcc_R	smulcc 	%r8, %r9, %r20
	.word 0xc8320009  ! 240: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xce4a0009  ! 240: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xcef21009  ! 240: STXA_R	stxa	%r7, [%r8 + %r9] 0x80
	.word 0xc53a0009  ! 243: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc80a0009  ! 243: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xe0da2b30  ! 243: LDXA_I	ldxa	[%r8, + 0x0b30] %asi, %r16
	.word 0xf3220009  ! 246: STF_R	st	%f25, [%r9, %r8]
	.word 0xf8020009  ! 246: LDUW_R	lduw	[%r8 + %r9], %r28
	.word 0xc8020009  ! 246: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xcd3a0009  ! 249: STDF_R	std	%f6, [%r9, %r8]
	.word 0xcf1a0009  ! 249: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xcea220b4  ! 249: STWA_I	stwa	%r7, [%r8 + 0x00b4] %asi
	.word 0xc2220009  ! 252: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xd85a0009  ! 252: LDX_R	ldx	[%r8 + %r9], %r12
	.word 0x8143e00d  ! 252: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore 
	.word 0xe9220009  ! 255: STF_R	st	%f20, [%r9, %r8]
	.word 0xc2420009  ! 255: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0x8e6a2c28  ! 255: UDIVX_I	udivx 	%r8, 0x0c28, %r7
	.word 0xcd220009  ! 258: STF_R	st	%f6, [%r9, %r8]
	.word 0xc31a0009  ! 258: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xce0220d0  ! 258: LDUW_I	lduw	[%r8 + 0x00d0], %r7
	.word 0xc6320009  ! 261: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc8520009  ! 261: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0x8143c000  ! 261: STBAR	stbar
	.word 0xde320009  ! 264: STH_R	sth	%r15, [%r8 + %r9]
	.word 0xdd020009  ! 264: LDF_R	ld	[%r8, %r9], %f14
	.word 0x9ada0009  ! 264: SMULcc_R	smulcc 	%r8, %r9, %r13
	.word 0xce2a0009  ! 267: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xd71a0009  ! 267: LDDF_R	ldd	[%r8, %r9], %f11
	.word 0x2a800001  ! 267: BCS	bcs,a	<label_0x1>
	.word 0xfa720009  ! 270: STX_R	stx	%r29, [%r8 + %r9]
	.word 0xce5a0009  ! 270: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xeff21009  ! 270: CASXA_I	casxa	[%r8] 0x80, %r9, %r23
	.word 0xc9220009  ! 273: STF_R	st	%f4, [%r9, %r8]
	.word 0xf20a0009  ! 273: LDUB_R	ldub	[%r8 + %r9], %r25
	.word 0xc2f21009  ! 273: STXA_R	stxa	%r1, [%r8 + %r9] 0x80
	.word 0xf2720009  ! 276: STX_R	stx	%r25, [%r8 + %r9]
	.word 0xc31a0009  ! 276: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0x8143c000  ! 276: STBAR	stbar
	.word 0xfa320009  ! 279: STH_R	sth	%r29, [%r8 + %r9]
	.word 0xcc4a0009  ! 279: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xf4022814  ! 279: LDUW_I	lduw	[%r8 + 0x0814], %r26
	.word 0xeb3a0009  ! 282: STDF_R	std	%f21, [%r9, %r8]
	.word 0xd8120009  ! 282: LDUH_R	lduh	[%r8 + %r9], %r12
	.word 0xe4822c4c  ! 282: LDUWA_I	lduwa	[%r8, + 0x0c4c] %asi, %r18
	.word 0xcf3a0009  ! 285: STDF_R	std	%f7, [%r9, %r8]
	.word 0xca4a0009  ! 285: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xf0b228e8  ! 285: STHA_I	stha	%r24, [%r8 + 0x08e8] %asi
	.word 0xf0320009  ! 288: STH_R	sth	%r24, [%r8 + %r9]
	.word 0xfc4a0009  ! 288: LDSB_R	ldsb	[%r8 + %r9], %r30
	.word 0xa1222180  ! 288: MULScc_I	mulscc 	%r8, 0x0180, %r16
	.word 0xc7220009  ! 291: STF_R	st	%f3, [%r9, %r8]
	.word 0xd80a0009  ! 291: LDUB_R	ldub	[%r8 + %r9], %r12
	.word 0x876a0009  ! 291: SDIVX_R	sdivx	%r8, %r9, %r3
	.word 0xcc2a0009  ! 294: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xce020009  ! 294: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0x82da0009  ! 294: SMULcc_R	smulcc 	%r8, %r9, %r1
	.word 0xc8320009  ! 297: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc8020009  ! 297: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0x8143c000  ! 297: STBAR	stbar
	.word 0xeb3a0009  ! 300: STDF_R	std	%f21, [%r9, %r8]
	.word 0xcc5a0009  ! 300: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0x1c800001  ! 300: BPOS	bpos  	<label_0x1>
	.word 0xc42a0009  ! 303: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc45a0009  ! 303: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0x8143c000  ! 303: STBAR	stbar
	.word 0xdf3a0009  ! 306: STDF_R	std	%f15, [%r9, %r8]
	.word 0xc64a0009  ! 306: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xa3220009  ! 306: MULScc_R	mulscc 	%r8, %r9, %r17
	.word 0xdc2a0009  ! 309: STB_R	stb	%r14, [%r8 + %r9]
	.word 0xcc0a0009  ! 309: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xfdf22009  ! 309: CASXA_R	casxa	[%r8]%asi, %r9, %r30
	.word 0xdb220009  ! 312: STF_R	st	%f13, [%r9, %r8]
	.word 0xca420009  ! 312: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xfe822fa8  ! 312: LDUWA_I	lduwa	[%r8, + 0x0fa8] %asi, %r31
	.word 0xea720009  ! 315: STX_R	stx	%r21, [%r8 + %r9]
	.word 0xc8120009  ! 315: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0x20800001  ! 315: BN	bn,a	<label_0x1>
	.word 0xe6720009  ! 318: STX_R	stx	%r19, [%r8 + %r9]
	.word 0xc7020009  ! 318: LDF_R	ld	[%r8, %r9], %f3
	.word 0x1c800002  ! 318: BPOS	bpos  	<label_0x2>
	.word 0xc82a0009  ! 321: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc2420009  ! 321: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0x04800001  ! 321: BLE	ble  	<label_0x1>
	.word 0xc73a0009  ! 324: STDF_R	std	%f3, [%r9, %r8]
	.word 0xdc520009  ! 324: LDSH_R	ldsh	[%r8 + %r9], %r14
	.word 0xcc0222ac  ! 324: LDUW_I	lduw	[%r8 + 0x02ac], %r6
	.word 0xca220009  ! 327: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xf71a0009  ! 327: LDDF_R	ldd	[%r8, %r9], %f27
	.word 0xa1a209a9  ! 327: FDIVs	fdivs	%f8, %f9, %f16
	.word 0xe0720009  ! 330: STX_R	stx	%r16, [%r8 + %r9]
	.word 0xc84a0009  ! 330: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xaf2227f0  ! 330: MULScc_I	mulscc 	%r8, 0x07f0, %r23
	.word 0xcc320009  ! 333: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xf8020009  ! 333: LDUW_R	lduw	[%r8 + %r9], %r28
	.word 0x8ba20929  ! 333: FMULs	fmuls	%f8, %f9, %f5
	.word 0xcf3a0009  ! 336: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc6020009  ! 336: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0x89a20829  ! 336: FADDs	fadds	%f8, %f9, %f4
	.word 0xc6220009  ! 339: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xcc0a0009  ! 339: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xe4a21009  ! 339: STWA_R	stwa	%r18, [%r8 + %r9] 0x80
	.word 0xc8720009  ! 342: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xd8120009  ! 342: LDUH_R	lduh	[%r8 + %r9], %r12
	.word 0xea520009  ! 342: LDSH_R	ldsh	[%r8 + %r9], %r21
	.word 0xf7220009  ! 345: STF_R	st	%f27, [%r9, %r8]
	.word 0xc8120009  ! 345: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xc36a2b70  ! 345: PREFETCH_I	prefetch	[%r8 + 0x0b70], #one_read
	.word 0xca2a0009  ! 348: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc4520009  ! 348: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0x8143c000  ! 348: STBAR	stbar
	.word 0xc8320009  ! 351: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xca120009  ! 351: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xada20829  ! 351: FADDs	fadds	%f8, %f9, %f22
	.word 0xfe220009  ! 354: STW_R	stw	%r31, [%r8 + %r9]
	.word 0xec5a0009  ! 354: LDX_R	ldx	[%r8 + %r9], %r22
	.word 0xc2da1009  ! 354: LDXA_R	ldxa	[%r8, %r9] 0x80, %r1
	.word 0xc5220009  ! 357: STF_R	st	%f2, [%r9, %r8]
	.word 0xf51a0009  ! 357: LDDF_R	ldd	[%r8, %r9], %f26
	.word 0x3a800001  ! 357: BCC	bcc,a	<label_0x1>
	.word 0xc6720009  ! 360: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xeb1a0009  ! 360: LDDF_R	ldd	[%r8, %r9], %f21
	.word 0x32800002  ! 360: BNE	bne,a	<label_0x2>
	.word 0xcf3a0009  ! 363: STDF_R	std	%f7, [%r9, %r8]
	.word 0xea020009  ! 363: LDUW_R	lduw	[%r8 + %r9], %r21
	.word 0xe6ca2ac4  ! 363: LDSBA_I	ldsba	[%r8, + 0x0ac4] %asi, %r19
	.word 0xc4720009  ! 366: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xf40a0009  ! 366: LDUB_R	ldub	[%r8 + %r9], %r26
	.word 0xc36a22a4  ! 366: PREFETCH_I	prefetch	[%r8 + 0x02a4], #one_read
	.word 0xe0320009  ! 369: STH_R	sth	%r16, [%r8 + %r9]
	.word 0xee520009  ! 369: LDSH_R	ldsh	[%r8 + %r9], %r23
	.word 0x3e800001  ! 369: BVC	bvc,a	<label_0x1>
	.word 0xc5220009  ! 372: STF_R	st	%f2, [%r9, %r8]
	.word 0xc45a0009  ! 372: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0x8143e056  ! 372: MEMBAR	membar	#StoreLoad | #LoadStore | #Lookaside | #Sync 
	.word 0xce2a0009  ! 375: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xe0520009  ! 375: LDSH_R	ldsh	[%r8 + %r9], %r16
	.word 0xbba20929  ! 375: FMULs	fmuls	%f8, %f9, %f29
	.word 0xf2720009  ! 378: STX_R	stx	%r25, [%r8 + %r9]
	.word 0xcd020009  ! 378: LDF_R	ld	[%r8, %r9], %f6
	.word 0x8c720009  ! 378: UDIV_R	udiv 	%r8, %r9, %r6
	.word 0xda220009  ! 381: STW_R	stw	%r13, [%r8 + %r9]
	.word 0xce0a0009  ! 381: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0x8a522ae4  ! 381: UMUL_I	umul 	%r8, 0x0ae4, %r5
	.word 0xca720009  ! 384: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc8520009  ! 384: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0x8143e01e  ! 384: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside 
	.word 0xc42a0009  ! 387: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc51a0009  ! 387: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0x8143c000  ! 387: STBAR	stbar
	.word 0xe22a0009  ! 390: STB_R	stb	%r17, [%r8 + %r9]
	.word 0xc25a0009  ! 390: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0x972221dc  ! 390: MULScc_I	mulscc 	%r8, 0x01dc, %r11
	.word 0xc7220009  ! 393: STF_R	st	%f3, [%r9, %r8]
	.word 0xdb1a0009  ! 393: LDDF_R	ldd	[%r8, %r9], %f13
	.word 0x24ca0001  ! 393: BRLEZ	brlez,a,pt	%8,<label_0xa0001>
	.word 0xca220009  ! 396: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xd6420009  ! 396: LDSW_R	ldsw	[%r8 + %r9], %r11
	.word 0xc33a0009  ! 396: STDF_R	std	%f1, [%r9, %r8]
	.word 0xcc320009  ! 399: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc2420009  ! 399: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0x8143c000  ! 399: STBAR	stbar
	.word 0xd6320009  ! 402: STH_R	sth	%r11, [%r8 + %r9]
	.word 0xd8020009  ! 402: LDUW_R	lduw	[%r8 + %r9], %r12
	.word 0xa86a208c  ! 402: UDIVX_I	udivx 	%r8, 0x008c, %r20
	.word 0xc2720009  ! 405: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xcf1a0009  ! 405: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xc53a0009  ! 405: STDF_R	std	%f2, [%r9, %r8]
	.word 0xe4720009  ! 408: STX_R	stx	%r18, [%r8 + %r9]
	.word 0xc25a0009  ! 408: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0x8ba20929  ! 408: FMULs	fmuls	%f8, %f9, %f5
	.word 0xcd3a0009  ! 411: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc8520009  ! 411: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0x8143e04b  ! 411: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Sync 
	.word 0xfc220009  ! 414: STW_R	stw	%r30, [%r8 + %r9]
	.word 0xf84a0009  ! 414: LDSB_R	ldsb	[%r8 + %r9], %r28
	.word 0x8c4a2230  ! 414: MULX_I	mulx 	%r8, 0x0230, %r6
	.word 0xc6220009  ! 417: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xcb020009  ! 417: LDF_R	ld	[%r8, %r9], %f5
	.word 0xc4ca2a68  ! 417: LDSBA_I	ldsba	[%r8, + 0x0a68] %asi, %r2
	.word 0xeb220009  ! 420: STF_R	st	%f21, [%r9, %r8]
	.word 0xca5a0009  ! 420: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xc36a2fb8  ! 420: PREFETCH_I	prefetch	[%r8 + 0x0fb8], #one_read
	.word 0xc73a0009  ! 423: STDF_R	std	%f3, [%r9, %r8]
	.word 0xfe4a0009  ! 423: LDSB_R	ldsb	[%r8 + %r9], %r31
	.word 0xd6ea1009  ! 423: LDSTUBA_R	ldstuba	%r11, [%r8 + %r9] 0x80
	.word 0xcc320009  ! 426: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc7020009  ! 426: LDF_R	ld	[%r8, %r9], %f3
	.word 0xc3ea29a8  ! 426: PREFETCHA_I	prefetcha	[%r8, + 0x09a8] %asi, #one_read
	.word 0xc3220009  ! 429: STF_R	st	%f1, [%r9, %r8]
	.word 0xde520009  ! 429: LDSH_R	ldsh	[%r8 + %r9], %r15
	.word 0x8ada284c  ! 429: SMULcc_I	smulcc 	%r8, 0x084c, %r5
	.word 0xca720009  ! 432: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xe5020009  ! 432: LDF_R	ld	[%r8, %r9], %f18
	.word 0xc36a2030  ! 432: PREFETCH_I	prefetch	[%r8 + 0x0030], #one_read
	.word 0xf4720009  ! 435: STX_R	stx	%r26, [%r8 + %r9]
	.word 0xc9020009  ! 435: LDF_R	ld	[%r8, %r9], %f4
	.word 0xc3ea1009  ! 435: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc2220009  ! 438: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xce0a0009  ! 438: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0x1e800001  ! 438: BVC	bvc  	<label_0x1>
	.word 0xf6320009  ! 441: STH_R	sth	%r27, [%r8 + %r9]
	.word 0xea420009  ! 441: LDSW_R	ldsw	[%r8 + %r9], %r21
	.word 0xceb2227c  ! 441: STHA_I	stha	%r7, [%r8 + 0x027c] %asi
	.word 0xc62a0009  ! 444: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xcb1a0009  ! 444: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xaed20009  ! 444: UMULcc_R	umulcc 	%r8, %r9, %r23
	.word 0xef3a0009  ! 447: STDF_R	std	%f23, [%r9, %r8]
	.word 0xe40a0009  ! 447: LDUB_R	ldub	[%r8 + %r9], %r18
	.word 0xe04a2bdc  ! 447: LDSB_I	ldsb	[%r8 + 0x0bdc], %r16
	.word 0xc9220009  ! 450: STF_R	st	%f4, [%r9, %r8]
	.word 0xc8120009  ! 450: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xcad21009  ! 450: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r5
	.word 0xc6720009  ! 453: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc4420009  ! 453: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0x8143e02d  ! 453: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #MemIssue 
	.word 0xc62a0009  ! 456: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc80a0009  ! 456: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xf8da21a0  ! 456: LDXA_I	ldxa	[%r8, + 0x01a0] %asi, %r28
	.word 0xc6320009  ! 459: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xcd020009  ! 459: LDF_R	ld	[%r8, %r9], %f6
	.word 0xa24a0009  ! 459: MULX_R	mulx 	%r8, %r9, %r17
	.word 0xce720009  ! 462: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xcf020009  ! 462: LDF_R	ld	[%r8, %r9], %f7
	.word 0x864a0009  ! 462: MULX_R	mulx 	%r8, %r9, %r3
	.word 0xca720009  ! 465: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xcd020009  ! 465: LDF_R	ld	[%r8, %r9], %f6
	.word 0xde5a27c8  ! 465: LDX_I	ldx	[%r8 + 0x07c8], %r15
	.word 0xc7220009  ! 468: STF_R	st	%f3, [%r9, %r8]
	.word 0xe51a0009  ! 468: LDDF_R	ldd	[%r8, %r9], %f18
	.word 0xb1a20929  ! 468: FMULs	fmuls	%f8, %f9, %f24
	.word 0xca2a0009  ! 471: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xd8020009  ! 471: LDUW_R	lduw	[%r8 + %r9], %r12
	.word 0xafa20929  ! 471: FMULs	fmuls	%f8, %f9, %f23
	.word 0xfe220009  ! 474: STW_R	stw	%r31, [%r8 + %r9]
	.word 0xc6520009  ! 474: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xc31a2548  ! 474: LDDF_I	ldd	[%r8, 0x0548], %f1
	.word 0xc8220009  ! 477: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc6120009  ! 477: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xc6422aa0  ! 477: LDSW_I	ldsw	[%r8 + 0x0aa0], %r3
	.word 0xcc320009  ! 480: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xe9020009  ! 480: LDF_R	ld	[%r8, %r9], %f20
	.word 0xf2022010  ! 480: LDUW_I	lduw	[%r8 + 0x0010], %r25
	.word 0xe7220009  ! 483: STF_R	st	%f19, [%r9, %r8]
	.word 0xca5a0009  ! 483: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0x2ec20001  ! 483: BRGEZ	brgez,a,nt	%8,<label_0x20001>
	.word 0xcd220009  ! 486: STF_R	st	%f6, [%r9, %r8]
	.word 0xdb1a0009  ! 486: LDDF_R	ldd	[%r8, %r9], %f13
	.word 0xca7a0009  ! 486: SWAP_R	swap	%r5, [%r8 + %r9]
	.word 0xc7220009  ! 489: STF_R	st	%f3, [%r9, %r8]
	.word 0xce0a0009  ! 489: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0x8143e064  ! 489: MEMBAR	membar	#LoadStore | #MemIssue | #Sync 
	.word 0xc2220009  ! 492: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xfc120009  ! 492: LDUH_R	lduh	[%r8 + %r9], %r30
	.word 0x8c4a229c  ! 492: MULX_I	mulx 	%r8, 0x029c, %r6
	.word 0xca720009  ! 495: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc2020009  ! 495: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0x887227c8  ! 495: UDIV_I	udiv 	%r8, 0x07c8, %r4
	.word 0xcc320009  ! 498: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc8120009  ! 498: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xf1f21009  ! 498: CASXA_I	casxa	[%r8] 0x80, %r9, %r24
	.word 0xfc220009  ! 501: STW_R	stw	%r30, [%r8 + %r9]
	.word 0xcc420009  ! 501: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0x24800001  ! 501: BLE	ble,a	<label_0x1>
	.word 0xca320009  ! 504: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xca5a0009  ! 504: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xccb22770  ! 504: STHA_I	stha	%r6, [%r8 + 0x0770] %asi
	.word 0xc2720009  ! 507: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xca420009  ! 507: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xccea2f78  ! 507: LDSTUBA_I	ldstuba	%r6, [%r8 + 0x0f78] %asi
	.word 0xc82a0009  ! 510: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xda4a0009  ! 510: LDSB_R	ldsb	[%r8 + %r9], %r13
	.word 0xc33a0009  ! 510: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc82a0009  ! 513: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xce420009  ! 513: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xcca21009  ! 513: STWA_R	stwa	%r6, [%r8 + %r9] 0x80
	.word 0xc42a0009  ! 516: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc2420009  ! 516: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0x24800001  ! 516: BLE	ble,a	<label_0x1>
	.word 0xce320009  ! 519: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xce5a0009  ! 519: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xc36a25b0  ! 519: PREFETCH_I	prefetch	[%r8 + 0x05b0], #one_read
	.word 0xcb3a0009  ! 522: STDF_R	std	%f5, [%r9, %r8]
	.word 0xc4520009  ! 522: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0x8ad20009  ! 522: UMULcc_R	umulcc 	%r8, %r9, %r5
	.word 0xca320009  ! 525: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xff1a0009  ! 525: LDDF_R	ldd	[%r8, %r9], %f31
	.word 0xcd3a2e20  ! 525: STDF_I	std	%f6, [0x0e20, %r8]
	.word 0xca220009  ! 528: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xd6020009  ! 528: LDUW_R	lduw	[%r8 + %r9], %r11
	.word 0x88da2260  ! 528: SMULcc_I	smulcc 	%r8, 0x0260, %r4
	.word 0xfe320009  ! 531: STH_R	sth	%r31, [%r8 + %r9]
	.word 0xce020009  ! 531: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0x8143c000  ! 531: STBAR	stbar
	.word 0xc8320009  ! 534: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xf1020009  ! 534: LDF_R	ld	[%r8, %r9], %f24
	.word 0xc36a0009  ! 534: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc8320009  ! 537: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc20a0009  ! 537: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0x8f220009  ! 537: MULScc_R	mulscc 	%r8, %r9, %r7
	.word 0xc82a0009  ! 540: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc80a0009  ! 540: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xc27a0009  ! 540: SWAP_R	swap	%r1, [%r8 + %r9]
	.word 0xce720009  ! 543: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xe6120009  ! 543: LDUH_R	lduh	[%r8 + %r9], %r19
	.word 0xcac21009  ! 543: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r5
	.word 0xc6320009  ! 546: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xce5a0009  ! 546: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0x8143e032  ! 546: MEMBAR	membar	#StoreLoad | #Lookaside | #MemIssue 
	.word 0xcc720009  ! 549: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xcc120009  ! 549: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xcef21009  ! 549: STXA_R	stxa	%r7, [%r8 + %r9] 0x80
	.word 0xc2320009  ! 552: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc40a0009  ! 552: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0x8143e02d  ! 552: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #MemIssue 
	.word 0xce220009  ! 555: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc40a0009  ! 555: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xdc0a0009  ! 555: LDUB_R	ldub	[%r8 + %r9], %r14
	.word 0xe5220009  ! 558: STF_R	st	%f18, [%r9, %r8]
	.word 0xcd1a0009  ! 558: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xc2c2279c  ! 558: LDSWA_I	ldswa	[%r8, + 0x079c] %asi, %r1
	.word 0xc8220009  ! 561: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc40a0009  ! 561: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xc6aa1009  ! 561: STBA_R	stba	%r3, [%r8 + %r9] 0x80
	.word 0xce320009  ! 564: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xca120009  ! 564: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0x8143e056  ! 564: MEMBAR	membar	#StoreLoad | #LoadStore | #Lookaside | #Sync 
	.word 0xda720009  ! 567: STX_R	stx	%r13, [%r8 + %r9]
	.word 0xce120009  ! 567: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0x3c800001  ! 567: BPOS	bpos,a	<label_0x1>
	.word 0xe2220009  ! 570: STW_R	stw	%r17, [%r8 + %r9]
	.word 0xd65a0009  ! 570: LDX_R	ldx	[%r8 + %r9], %r11
	.word 0xc2aa1009  ! 570: STBA_R	stba	%r1, [%r8 + %r9] 0x80
	.word 0xcc2a0009  ! 573: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xf8120009  ! 573: LDUH_R	lduh	[%r8 + %r9], %r28
	.word 0x22800002  ! 573: BE	be,a	<label_0x2>
	.word 0xea720009  ! 576: STX_R	stx	%r21, [%r8 + %r9]
	.word 0xca4a0009  ! 576: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xc36a0009  ! 576: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xd9220009  ! 579: STF_R	st	%f12, [%r9, %r8]
	.word 0xc4420009  ! 579: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xca8a1009  ! 579: LDUBA_R	lduba	[%r8, %r9] 0x80, %r5
	.word 0xcd220009  ! 582: STF_R	st	%f6, [%r9, %r8]
	.word 0xc45a0009  ! 582: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xc3ea1009  ! 582: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc6220009  ! 585: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xde4a0009  ! 585: LDSB_R	ldsb	[%r8 + %r9], %r15
	.word 0x88d229b4  ! 585: UMULcc_I	umulcc 	%r8, 0x09b4, %r4
	.word 0xc8220009  ! 588: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xcd020009  ! 588: LDF_R	ld	[%r8, %r9], %f6
	.word 0x00800001  ! 588: BN	bn  	<label_0x1>
	.word 0xe2320009  ! 591: STH_R	sth	%r17, [%r8 + %r9]
	.word 0xcb020009  ! 591: LDF_R	ld	[%r8, %r9], %f5
	.word 0x8ef20009  ! 591: UDIVcc_R	udivcc 	%r8, %r9, %r7
	.word 0xea320009  ! 594: STH_R	sth	%r21, [%r8 + %r9]
	.word 0xed1a0009  ! 594: LDDF_R	ldd	[%r8, %r9], %f22
	.word 0xb25a0009  ! 594: SMUL_R	smul 	%r8, %r9, %r25
	.word 0xc6720009  ! 597: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc40a0009  ! 597: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0x85a20929  ! 597: FMULs	fmuls	%f8, %f9, %f2
	.word 0xe5220009  ! 600: STF_R	st	%f18, [%r9, %r8]
	.word 0xde0a0009  ! 600: LDUB_R	ldub	[%r8 + %r9], %r15
	.word 0xc3ea1009  ! 600: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xca220009  ! 603: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc24a0009  ! 603: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0x8ef20009  ! 603: UDIVcc_R	udivcc 	%r8, %r9, %r7
	.word 0xce2a0009  ! 606: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xf4020009  ! 606: LDUW_R	lduw	[%r8 + %r9], %r26
	.word 0xc84a0009  ! 606: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xf6720009  ! 609: STX_R	stx	%r27, [%r8 + %r9]
	.word 0xc65a0009  ! 609: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0x1a800001  ! 609: BCC	bcc  	<label_0x1>
	.word 0xdb3a0009  ! 612: STDF_R	std	%f13, [%r9, %r8]
	.word 0xdc020009  ! 612: LDUW_R	lduw	[%r8 + %r9], %r14
	.word 0xc4da2180  ! 612: LDXA_I	ldxa	[%r8, + 0x0180] %asi, %r2
	.word 0xce220009  ! 615: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xee520009  ! 615: LDSH_R	ldsh	[%r8 + %r9], %r23
	.word 0xc3ea2870  ! 615: PREFETCHA_I	prefetcha	[%r8, + 0x0870] %asi, #one_read
	.word 0xcc220009  ! 618: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc5020009  ! 618: LDF_R	ld	[%r8, %r9], %f2
	.word 0xdbe22009  ! 618: CASA_R	casa	[%r8] %asi, %r9, %r13
	.word 0xc22a0009  ! 621: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xfd1a0009  ! 621: LDDF_R	ldd	[%r8, %r9], %f30
	.word 0x2c800001  ! 621: BNEG	bneg,a	<label_0x1>
	.word 0xce2a0009  ! 624: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xca120009  ! 624: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xa1a20929  ! 624: FMULs	fmuls	%f8, %f9, %f16
	.word 0xca720009  ! 627: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc4420009  ! 627: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0x8ad22ce0  ! 627: UMULcc_I	umulcc 	%r8, 0x0ce0, %r5
	.word 0xc8320009  ! 630: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc8120009  ! 630: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xca4a0009  ! 630: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xcb220009  ! 633: STF_R	st	%f5, [%r9, %r8]
	.word 0xfe120009  ! 633: LDUH_R	lduh	[%r8 + %r9], %r31
	.word 0xcc5a0009  ! 633: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xc4720009  ! 636: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xea5a0009  ! 636: LDX_R	ldx	[%r8 + %r9], %r21
	.word 0x08800001  ! 636: BLEU	bleu  	<label_0x1>
	.word 0xc6320009  ! 639: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc9020009  ! 639: LDF_R	ld	[%r8, %r9], %f4
	.word 0x89a20929  ! 639: FMULs	fmuls	%f8, %f9, %f4
	.word 0xf6320009  ! 642: STH_R	sth	%r27, [%r8 + %r9]
	.word 0xce4a0009  ! 642: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xcab22008  ! 642: STHA_I	stha	%r5, [%r8 + 0x0008] %asi
	.word 0xc2720009  ! 645: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc31a0009  ! 645: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xd4ba1009  ! 645: STDA_R	stda	%r10, [%r8 + %r9] 0x80
	.word 0xe6320009  ! 648: STH_R	sth	%r19, [%r8 + %r9]
	.word 0xca020009  ! 648: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0x82fa0009  ! 648: SDIVcc_R	sdivcc 	%r8, %r9, %r1
	.word 0xca220009  ! 651: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xe24a0009  ! 651: LDSB_R	ldsb	[%r8 + %r9], %r17
	.word 0x8143e07a  ! 651: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xc4720009  ! 654: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xff1a0009  ! 654: LDDF_R	ldd	[%r8, %r9], %f31
	.word 0x82522518  ! 654: UMUL_I	umul 	%r8, 0x0518, %r1
	.word 0xc2220009  ! 657: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc85a0009  ! 657: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xd4ba2750  ! 657: STDA_I	stda	%r10, [%r8 + 0x0750] %asi
	.word 0xe0320009  ! 660: STH_R	sth	%r16, [%r8 + %r9]
	.word 0xda4a0009  ! 660: LDSB_R	ldsb	[%r8 + %r9], %r13
	.word 0xc6da1009  ! 660: LDXA_R	ldxa	[%r8, %r9] 0x80, %r3
	.word 0xc2720009  ! 663: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xcf1a0009  ! 663: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0x8e5a2adc  ! 663: SMUL_I	smul 	%r8, 0x0adc, %r7
	.word 0xe13a0009  ! 666: STDF_R	std	%f16, [%r9, %r8]
	.word 0xcc0a0009  ! 666: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0x28800001  ! 666: BLEU	bleu,a	<label_0x1>
	.word 0xce720009  ! 669: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xe91a0009  ! 669: LDDF_R	ldd	[%r8, %r9], %f20
	.word 0x8ba209a9  ! 669: FDIVs	fdivs	%f8, %f9, %f5
	.word 0xd93a0009  ! 672: STDF_R	std	%f12, [%r9, %r8]
	.word 0xfb1a0009  ! 672: LDDF_R	ldd	[%r8, %r9], %f29
	.word 0xcc5a20a8  ! 672: LDX_I	ldx	[%r8 + 0x00a8], %r6
	.word 0xcd3a0009  ! 675: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc8420009  ! 675: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0x8eda2450  ! 675: SMULcc_I	smulcc 	%r8, 0x0450, %r7
	.word 0xf8720009  ! 678: STX_R	stx	%r28, [%r8 + %r9]
	.word 0xc44a0009  ! 678: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xc6b21009  ! 678: STHA_R	stha	%r3, [%r8 + %r9] 0x80
	.word 0xc82a0009  ! 681: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc80a0009  ! 681: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0x8143c000  ! 681: STBAR	stbar
	.word 0xe62a0009  ! 684: STB_R	stb	%r19, [%r8 + %r9]
	.word 0xef020009  ! 684: LDF_R	ld	[%r8, %r9], %f23
	.word 0xccb21009  ! 684: STHA_R	stha	%r6, [%r8 + %r9] 0x80
	.word 0xf6220009  ! 687: STW_R	stw	%r27, [%r8 + %r9]
	.word 0xc40a0009  ! 687: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xd6b2277c  ! 687: STHA_I	stha	%r11, [%r8 + 0x077c] %asi
	.word 0xc4220009  ! 690: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xca520009  ! 690: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0x8ada0009  ! 690: SMULcc_R	smulcc 	%r8, %r9, %r5
	.word 0xca720009  ! 693: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xf4020009  ! 693: LDUW_R	lduw	[%r8 + %r9], %r26
	.word 0xc2822978  ! 693: LDUWA_I	lduwa	[%r8, + 0x0978] %asi, %r1
	.word 0xc8720009  ! 696: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc8120009  ! 696: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xa8720009  ! 696: UDIV_R	udiv 	%r8, %r9, %r20
	.word 0xce720009  ! 699: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc71a0009  ! 699: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0x867a0009  ! 699: SDIV_R	sdiv 	%r8, %r9, %r3
	.word 0xce220009  ! 702: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xdd1a0009  ! 702: LDDF_R	ldd	[%r8, %r9], %f14
	.word 0x8143c000  ! 702: STBAR	stbar
	.word 0xe73a0009  ! 705: STDF_R	std	%f19, [%r9, %r8]
	.word 0xc65a0009  ! 705: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0x32800002  ! 705: BNE	bne,a	<label_0x2>
	.word 0xcd220009  ! 708: STF_R	st	%f6, [%r9, %r8]
	.word 0xc8020009  ! 708: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0x8da209a9  ! 708: FDIVs	fdivs	%f8, %f9, %f6
	.word 0xc4220009  ! 711: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc65a0009  ! 711: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xdc6a0009  ! 711: LDSTUB_R	ldstub	%r14, [%r8 + %r9]
	.word 0xc73a0009  ! 714: STDF_R	std	%f3, [%r9, %r8]
	.word 0xca0a0009  ! 714: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0x84f224bc  ! 714: UDIVcc_I	udivcc 	%r8, 0x04bc, %r2
	.word 0xc7220009  ! 717: STF_R	st	%f3, [%r9, %r8]
	.word 0xc24a0009  ! 717: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0x8143c000  ! 717: STBAR	stbar
	.word 0xcf220009  ! 720: STF_R	st	%f7, [%r9, %r8]
	.word 0xc2520009  ! 720: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xf3222354  ! 720: STF_I	st	%f25, [0x0354, %r8]
	.word 0xc4720009  ! 723: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc65a0009  ! 723: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0x8da209a9  ! 723: FDIVs	fdivs	%f8, %f9, %f6
	.word 0xc33a0009  ! 726: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc7020009  ! 726: LDF_R	ld	[%r8, %r9], %f3
	.word 0xc3ea25f4  ! 726: PREFETCHA_I	prefetcha	[%r8, + 0x05f4] %asi, #one_read
	.word 0xcc320009  ! 729: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xce4a0009  ! 729: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0x24800001  ! 729: BLE	ble,a	<label_0x1>
	.word 0xcb3a0009  ! 732: STDF_R	std	%f5, [%r9, %r8]
	.word 0xca020009  ! 732: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xc67a29cc  ! 732: SWAP_I	swap	%r3, [%r8 + 0x09cc]
	.word 0xc4320009  ! 735: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc6520009  ! 735: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0x84fa0009  ! 735: SDIVcc_R	sdivcc 	%r8, %r9, %r2
	.word 0xcc720009  ! 738: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xce4a0009  ! 738: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xc4ba1009  ! 738: STDA_R	stda	%r2, [%r8 + %r9] 0x80
	.word 0xc4220009  ! 741: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xcc420009  ! 741: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xa9222dd8  ! 741: MULScc_I	mulscc 	%r8, 0x0dd8, %r20
	.word 0xed3a0009  ! 744: STDF_R	std	%f22, [%r9, %r8]
	.word 0xc64a0009  ! 744: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xf4822a38  ! 744: LDUWA_I	lduwa	[%r8, + 0x0a38] %asi, %r26
	.word 0xc53a0009  ! 747: STDF_R	std	%f2, [%r9, %r8]
	.word 0xea120009  ! 747: LDUH_R	lduh	[%r8 + %r9], %r21
	.word 0x85a20929  ! 747: FMULs	fmuls	%f8, %f9, %f2
	.word 0xf8220009  ! 750: STW_R	stw	%r28, [%r8 + %r9]
	.word 0xcc120009  ! 750: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xc2f22b20  ! 750: STXA_I	stxa	%r1, [%r8 + 0x0b20] %asi
	.word 0xc9220009  ! 753: STF_R	st	%f4, [%r9, %r8]
	.word 0xf24a0009  ! 753: LDSB_R	ldsb	[%r8 + %r9], %r25
	.word 0xb07a2948  ! 753: SDIV_I	sdiv 	%r8, 0x0948, %r24
	.word 0xc4320009  ! 756: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xce5a0009  ! 756: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xc6da1009  ! 756: LDXA_R	ldxa	[%r8, %r9] 0x80, %r3
	.word 0xf6320009  ! 759: STH_R	sth	%r27, [%r8 + %r9]
	.word 0xf85a0009  ! 759: LDX_R	ldx	[%r8 + %r9], %r28
	.word 0xf4aa1009  ! 759: STBA_R	stba	%r26, [%r8 + %r9] 0x80
	.word 0xc6320009  ! 762: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc5020009  ! 762: LDF_R	ld	[%r8, %r9], %f2
	.word 0xc46a279c  ! 762: LDSTUB_I	ldstub	%r2, [%r8 + 0x079c]
	.word 0xe02a0009  ! 765: STB_R	stb	%r16, [%r8 + %r9]
	.word 0xca4a0009  ! 765: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xccba2410  ! 765: STDA_I	stda	%r6, [%r8 + 0x0410] %asi
	.word 0xe7220009  ! 768: STF_R	st	%f19, [%r9, %r8]
	.word 0xe04a0009  ! 768: LDSB_R	ldsb	[%r8 + %r9], %r16
	.word 0xc2fa2080  ! 768: SWAPA_I	swapa	%r1, [%r8 + 0x0080] %asi
	.word 0xca320009  ! 771: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xf2520009  ! 771: LDSH_R	ldsh	[%r8 + %r9], %r25
	.word 0x0e800001  ! 771: BVS	bvs  	<label_0x1>
	.word 0xc33a0009  ! 774: STDF_R	std	%f1, [%r9, %r8]
	.word 0xe7020009  ! 774: LDF_R	ld	[%r8, %r9], %f19
	.word 0xccca1009  ! 774: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r6
	.word 0xf2720009  ! 777: STX_R	stx	%r25, [%r8 + %r9]
	.word 0xda120009  ! 777: LDUH_R	lduh	[%r8 + %r9], %r13
	.word 0x9c5227c8  ! 777: UMUL_I	umul 	%r8, 0x07c8, %r14
	.word 0xf22a0009  ! 780: STB_R	stb	%r25, [%r8 + %r9]
	.word 0xc84a0009  ! 780: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xc4ea2554  ! 780: LDSTUBA_I	ldstuba	%r2, [%r8 + 0x0554] %asi
	.word 0xec220009  ! 783: STW_R	stw	%r22, [%r8 + %r9]
	.word 0xee520009  ! 783: LDSH_R	ldsh	[%r8 + %r9], %r23
	.word 0xc4822f68  ! 783: LDUWA_I	lduwa	[%r8, + 0x0f68] %asi, %r2
	.word 0xc53a0009  ! 786: STDF_R	std	%f2, [%r9, %r8]
	.word 0xed1a0009  ! 786: LDDF_R	ldd	[%r8, %r9], %f22
	.word 0xc93a2d00  ! 786: STDF_I	std	%f4, [0x0d00, %r8]
	.word 0xc93a0009  ! 789: STDF_R	std	%f4, [%r9, %r8]
	.word 0xc60a0009  ! 789: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0x83a209a9  ! 789: FDIVs	fdivs	%f8, %f9, %f1
	.word 0xc6720009  ! 792: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xca5a0009  ! 792: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xc3ea1009  ! 792: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xf8720009  ! 795: STX_R	stx	%r28, [%r8 + %r9]
	.word 0xce4a0009  ! 795: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xc36a0009  ! 795: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xcf3a0009  ! 798: STDF_R	std	%f7, [%r9, %r8]
	.word 0xf60a0009  ! 798: LDUB_R	ldub	[%r8 + %r9], %r27
	.word 0xc5222e58  ! 798: STF_I	st	%f2, [0x0e58, %r8]
	.word 0xc5220009  ! 801: STF_R	st	%f2, [%r9, %r8]
	.word 0xf25a0009  ! 801: LDX_R	ldx	[%r8 + %r9], %r25
	.word 0x9c7a0009  ! 801: SDIV_R	sdiv 	%r8, %r9, %r14
	.word 0xca720009  ! 804: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xce0a0009  ! 804: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0x8c520009  ! 804: UMUL_R	umul 	%r8, %r9, %r6
	.word 0xc93a0009  ! 807: STDF_R	std	%f4, [%r9, %r8]
	.word 0xcf020009  ! 807: LDF_R	ld	[%r8, %r9], %f7
	.word 0xc2ea2b8c  ! 807: LDSTUBA_I	ldstuba	%r1, [%r8 + 0x0b8c] %asi
	.word 0xc8220009  ! 810: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xf4120009  ! 810: LDUH_R	lduh	[%r8 + %r9], %r26
	.word 0xc2aa29c8  ! 810: STBA_I	stba	%r1, [%r8 + 0x09c8] %asi
	.word 0xc6720009  ! 813: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc6120009  ! 813: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xcb222360  ! 813: STF_I	st	%f5, [0x0360, %r8]
	.word 0xc82a0009  ! 816: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xcd1a0009  ! 816: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xcbe22009  ! 816: CASA_R	casa	[%r8] %asi, %r9, %r5
	.word 0xcc220009  ! 819: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xda0a0009  ! 819: LDUB_R	ldub	[%r8 + %r9], %r13
	.word 0x00800001  ! 819: BN	bn  	<label_0x1>
	.word 0xe6320009  ! 822: STH_R	sth	%r19, [%r8 + %r9]
	.word 0xc2020009  ! 822: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xe24a2a88  ! 822: LDSB_I	ldsb	[%r8 + 0x0a88], %r17
	.word 0xca220009  ! 825: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc2420009  ! 825: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xe20a29a4  ! 825: LDUB_I	ldub	[%r8 + 0x09a4], %r17
	.word 0xe6220009  ! 828: STW_R	stw	%r19, [%r8 + %r9]
	.word 0xc9020009  ! 828: LDF_R	ld	[%r8, %r9], %f4
	.word 0x88da0009  ! 828: SMULcc_R	smulcc 	%r8, %r9, %r4
	.word 0xce220009  ! 831: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xf7020009  ! 831: LDF_R	ld	[%r8, %r9], %f27
	.word 0x87220009  ! 831: MULScc_R	mulscc 	%r8, %r9, %r3
	.word 0xcc2a0009  ! 834: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xe91a0009  ! 834: LDDF_R	ldd	[%r8, %r9], %f20
	.word 0xc2a22d5c  ! 834: STWA_I	stwa	%r1, [%r8 + 0x0d5c] %asi
	.word 0xea220009  ! 837: STW_R	stw	%r21, [%r8 + %r9]
	.word 0xfe420009  ! 837: LDSW_R	ldsw	[%r8 + %r9], %r31
	.word 0xc3ea2c8c  ! 837: PREFETCHA_I	prefetcha	[%r8, + 0x0c8c] %asi, #one_read
	.word 0xcf3a0009  ! 840: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc31a0009  ! 840: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0x0e800002  ! 840: BVS	bvs  	<label_0x2>
	.word 0xc2720009  ! 843: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xce420009  ! 843: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0x827a2aec  ! 843: SDIV_I	sdiv 	%r8, 0x0aec, %r1
	.word 0xc4720009  ! 846: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc65a0009  ! 846: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0x8143c000  ! 846: STBAR	stbar
	.word 0xea2a0009  ! 849: STB_R	stb	%r21, [%r8 + %r9]
	.word 0xf6420009  ! 849: LDSW_R	ldsw	[%r8 + %r9], %r27
	.word 0x8143c000  ! 849: STBAR	stbar
	.word 0xf4320009  ! 852: STH_R	sth	%r26, [%r8 + %r9]
	.word 0xcb1a0009  ! 852: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0x1e800001  ! 852: BVC	bvc  	<label_0x1>
	.word 0xd7220009  ! 855: STF_R	st	%f11, [%r9, %r8]
	.word 0xc84a0009  ! 855: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xe8ca1009  ! 855: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r20
	.word 0xe2720009  ! 858: STX_R	stx	%r17, [%r8 + %r9]
	.word 0xce5a0009  ! 858: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xefe21009  ! 858: CASA_I	casa	[%r8] 0x80, %r9, %r23
	.word 0xc53a0009  ! 861: STDF_R	std	%f2, [%r9, %r8]
	.word 0xf0020009  ! 861: LDUW_R	lduw	[%r8 + %r9], %r24
	.word 0xcefa1009  ! 861: SWAPA_R	swapa	%r7, [%r8 + %r9] 0x80
	.word 0xc22a0009  ! 864: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc4420009  ! 864: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xe0020009  ! 864: LDUW_R	lduw	[%r8 + %r9], %r16
	.word 0xf73a0009  ! 867: STDF_R	std	%f27, [%r9, %r8]
	.word 0xc4120009  ! 867: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0x884a2190  ! 867: MULX_I	mulx 	%r8, 0x0190, %r4
	.word 0xc9220009  ! 870: STF_R	st	%f4, [%r9, %r8]
	.word 0xc4020009  ! 870: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0x87220009  ! 870: MULScc_R	mulscc 	%r8, %r9, %r3
	.word 0xc62a0009  ! 873: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc60a0009  ! 873: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xc6022798  ! 873: LDUW_I	lduw	[%r8 + 0x0798], %r3
	.word 0xc9220009  ! 876: STF_R	st	%f4, [%r9, %r8]
	.word 0xce120009  ! 876: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xc3ea2af8  ! 876: PREFETCHA_I	prefetcha	[%r8, + 0x0af8] %asi, #one_read
	.word 0xc2220009  ! 879: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xeb020009  ! 879: LDF_R	ld	[%r8, %r9], %f21
	.word 0x8e4a2edc  ! 879: MULX_I	mulx 	%r8, 0x0edc, %r7
	.word 0xce720009  ! 882: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xca0a0009  ! 882: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xeeca2a00  ! 882: LDSBA_I	ldsba	[%r8, + 0x0a00] %asi, %r23
	.word 0xc33a0009  ! 885: STDF_R	std	%f1, [%r9, %r8]
	.word 0xf31a0009  ! 885: LDDF_R	ldd	[%r8, %r9], %f25
	.word 0x8143c000  ! 885: STBAR	stbar
	.word 0xdb3a0009  ! 888: STDF_R	std	%f13, [%r9, %r8]
	.word 0xc85a0009  ! 888: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xcc822344  ! 888: LDUWA_I	lduwa	[%r8, + 0x0344] %asi, %r6
	.word 0xce720009  ! 891: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xe2520009  ! 891: LDSH_R	ldsh	[%r8 + %r9], %r17
	.word 0xccea1009  ! 891: LDSTUBA_R	ldstuba	%r6, [%r8 + %r9] 0x80
	.word 0xc6320009  ! 894: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xf2420009  ! 894: LDSW_R	ldsw	[%r8 + %r9], %r25
	.word 0xb8520009  ! 894: UMUL_R	umul 	%r8, %r9, %r28
	.word 0xf53a0009  ! 897: STDF_R	std	%f26, [%r9, %r8]
	.word 0xce420009  ! 897: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0x2ec20001  ! 897: BRGEZ	brgez,a,nt	%8,<label_0x20001>
	.word 0xc6220009  ! 900: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc8420009  ! 900: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xc36a24c0  ! 900: PREFETCH_I	prefetch	[%r8 + 0x04c0], #one_read
	.word 0xcb3a0009  ! 903: STDF_R	std	%f5, [%r9, %r8]
	.word 0xca5a0009  ! 903: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0x3a800001  ! 903: BCC	bcc,a	<label_0x1>
	.word 0xca320009  ! 906: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc25a0009  ! 906: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xcca223d0  ! 906: STWA_I	stwa	%r6, [%r8 + 0x03d0] %asi
	.word 0xdf3a0009  ! 909: STDF_R	std	%f15, [%r9, %r8]
	.word 0xc9020009  ! 909: LDF_R	ld	[%r8, %r9], %f4
	.word 0xceb22e54  ! 909: STHA_I	stha	%r7, [%r8 + 0x0e54] %asi
	.word 0xf33a0009  ! 912: STDF_R	std	%f25, [%r9, %r8]
	.word 0xe44a0009  ! 912: LDSB_R	ldsb	[%r8 + %r9], %r18
	.word 0x8cda0009  ! 912: SMULcc_R	smulcc 	%r8, %r9, %r6
	.word 0xc2720009  ! 915: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xe00a0009  ! 915: LDUB_R	ldub	[%r8 + %r9], %r16
	.word 0xc67a2db4  ! 915: SWAP_I	swap	%r3, [%r8 + 0x0db4]
	.word 0xe6320009  ! 918: STH_R	sth	%r19, [%r8 + %r9]
	.word 0xec520009  ! 918: LDSH_R	ldsh	[%r8 + %r9], %r22
	.word 0xcf1a0009  ! 918: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xd6320009  ! 921: STH_R	sth	%r11, [%r8 + %r9]
	.word 0xcc5a0009  ! 921: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xe8fa1009  ! 921: SWAPA_R	swapa	%r20, [%r8 + %r9] 0x80
	.word 0xc4320009  ! 924: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xcc4a0009  ! 924: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0x825a2b1c  ! 924: SMUL_I	smul 	%r8, 0x0b1c, %r1
	.word 0xc22a0009  ! 927: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xf6420009  ! 927: LDSW_R	ldsw	[%r8 + %r9], %r27
	.word 0x0e800002  ! 927: BVS	bvs  	<label_0x2>
	.word 0xe0320009  ! 930: STH_R	sth	%r16, [%r8 + %r9]
	.word 0xc91a0009  ! 930: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0x8fa209a9  ! 930: FDIVs	fdivs	%f8, %f9, %f7
	.word 0xf0320009  ! 933: STH_R	sth	%r24, [%r8 + %r9]
	.word 0xca420009  ! 933: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xa6f20009  ! 933: UDIVcc_R	udivcc 	%r8, %r9, %r19
	.word 0xf93a0009  ! 936: STDF_R	std	%f28, [%r9, %r8]
	.word 0xc4120009  ! 936: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xc8a22b40  ! 936: STWA_I	stwa	%r4, [%r8 + 0x0b40] %asi
	.word 0xcd220009  ! 939: STF_R	st	%f6, [%r9, %r8]
	.word 0xc60a0009  ! 939: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0x06800001  ! 939: BL	bl  	<label_0x1>
	.word 0xc5220009  ! 942: STF_R	st	%f2, [%r9, %r8]
	.word 0xc65a0009  ! 942: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xc2520009  ! 942: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xc42a0009  ! 945: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xe80a0009  ! 945: LDUB_R	ldub	[%r8 + %r9], %r20
	.word 0xcde21009  ! 945: CASA_I	casa	[%r8] 0x80, %r9, %r6
	.word 0xe4720009  ! 948: STX_R	stx	%r18, [%r8 + %r9]
	.word 0xc8020009  ! 948: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xcca21009  ! 948: STWA_R	stwa	%r6, [%r8 + %r9] 0x80
	.word 0xc6220009  ! 951: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xe0520009  ! 951: LDSH_R	ldsh	[%r8 + %r9], %r16
	.word 0x8143e03d  ! 951: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0xdb220009  ! 954: STF_R	st	%f13, [%r9, %r8]
	.word 0xca4a0009  ! 954: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xa07a20c4  ! 954: SDIV_I	sdiv 	%r8, 0x00c4, %r16
	.word 0xdc720009  ! 957: STX_R	stx	%r14, [%r8 + %r9]
	.word 0xcf1a0009  ! 957: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xc4020009  ! 957: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xcc2a0009  ! 960: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc8120009  ! 960: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xddf21009  ! 960: CASXA_I	casxa	[%r8] 0x80, %r9, %r14
	.word 0xcf220009  ! 963: STF_R	st	%f7, [%r9, %r8]
	.word 0xc25a0009  ! 963: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xce5a2a18  ! 963: LDX_I	ldx	[%r8 + 0x0a18], %r7
	.word 0xe42a0009  ! 966: STB_R	stb	%r18, [%r8 + %r9]
	.word 0xc2120009  ! 966: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xf45226d8  ! 966: LDSH_I	ldsh	[%r8 + 0x06d8], %r26
	.word 0xe2220009  ! 969: STW_R	stw	%r17, [%r8 + %r9]
	.word 0xc2020009  ! 969: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xf40a240c  ! 969: LDUB_I	ldub	[%r8 + 0x040c], %r26
	.word 0xf5220009  ! 972: STF_R	st	%f26, [%r9, %r8]
	.word 0xc25a0009  ! 972: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0x36800001  ! 972: BGE	bge,a	<label_0x1>
	.word 0xc5220009  ! 975: STF_R	st	%f2, [%r9, %r8]
	.word 0xc2520009  ! 975: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xccd22bb0  ! 975: LDSHA_I	ldsha	[%r8, + 0x0bb0] %asi, %r6
	.word 0xfe320009  ! 978: STH_R	sth	%r31, [%r8 + %r9]
	.word 0xc91a0009  ! 978: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0x8a720009  ! 978: UDIV_R	udiv 	%r8, %r9, %r5
	.word 0xeb220009  ! 981: STF_R	st	%f21, [%r9, %r8]
	.word 0xfa4a0009  ! 981: LDSB_R	ldsb	[%r8 + %r9], %r29
	.word 0xced22cdc  ! 981: LDSHA_I	ldsha	[%r8, + 0x0cdc] %asi, %r7
	.word 0xf4720009  ! 984: STX_R	stx	%r26, [%r8 + %r9]
	.word 0xfb1a0009  ! 984: LDDF_R	ldd	[%r8, %r9], %f29
	.word 0xceea1009  ! 984: LDSTUBA_R	ldstuba	%r7, [%r8 + %r9] 0x80
	.word 0xc4320009  ! 987: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc3020009  ! 987: LDF_R	ld	[%r8, %r9], %f1
	.word 0xf0922a38  ! 987: LDUHA_I	lduha	[%r8, + 0x0a38] %asi, %r24
	.word 0xce720009  ! 990: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xf20a0009  ! 990: LDUB_R	ldub	[%r8 + %r9], %r25
	.word 0x8143e055  ! 990: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside | #Sync 
	.word 0xeb220009  ! 993: STF_R	st	%f21, [%r9, %r8]
	.word 0xda4a0009  ! 993: LDSB_R	ldsb	[%r8 + %r9], %r13
	.word 0x8143e065  ! 993: MEMBAR	membar	#LoadLoad | #LoadStore | #MemIssue | #Sync 
	.word 0xc53a0009  ! 996: STDF_R	std	%f2, [%r9, %r8]
	.word 0xcb020009  ! 996: LDF_R	ld	[%r8, %r9], %f5
	.word 0x28800001  ! 996: BLEU	bleu,a	<label_0x1>
	.word 0xc62a0009  ! 999: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xf8020009  ! 999: LDUW_R	lduw	[%r8 + %r9], %r28
	.word 0xceea1009  ! 999: LDSTUBA_R	ldstuba	%r7, [%r8 + %r9] 0x80
	.word 0xe7220009  ! 1002: STF_R	st	%f19, [%r9, %r8]
	.word 0xca120009  ! 1002: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xee420009  ! 1002: LDSW_R	ldsw	[%r8 + %r9], %r23
	.word 0xc9220009  ! 1005: STF_R	st	%f4, [%r9, %r8]
	.word 0xd6020009  ! 1005: LDUW_R	lduw	[%r8 + %r9], %r11
	.word 0x20800001  ! 1005: BN	bn,a	<label_0x1>
	.word 0xc2220009  ! 1008: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc8020009  ! 1008: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xd6520009  ! 1008: LDSH_R	ldsh	[%r8 + %r9], %r11
	.word 0xf2320009  ! 1011: STH_R	sth	%r25, [%r8 + %r9]
	.word 0xca120009  ! 1011: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xe4122a3c  ! 1011: LDUH_I	lduh	[%r8 + 0x0a3c], %r18
	.word 0xcc320009  ! 1014: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc4120009  ! 1014: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0x8143c000  ! 1014: STBAR	stbar
	.word 0xc8220009  ! 1017: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc6020009  ! 1017: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xc4020009  ! 1017: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xcc320009  ! 1020: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xd84a0009  ! 1020: LDSB_R	ldsb	[%r8 + %r9], %r12
	.word 0xfc122114  ! 1020: LDUH_I	lduh	[%r8 + 0x0114], %r30
	.word 0xcc320009  ! 1023: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc20a0009  ! 1023: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0x8d220009  ! 1023: MULScc_R	mulscc 	%r8, %r9, %r6
	.word 0xe8320009  ! 1026: STH_R	sth	%r20, [%r8 + %r9]
	.word 0xc5020009  ! 1026: LDF_R	ld	[%r8, %r9], %f2
	.word 0xfeda1009  ! 1026: LDXA_R	ldxa	[%r8, %r9] 0x80, %r31
	.word 0xc6320009  ! 1029: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xde0a0009  ! 1029: LDUB_R	ldub	[%r8 + %r9], %r15
	.word 0xced222c8  ! 1029: LDSHA_I	ldsha	[%r8, + 0x02c8] %asi, %r7
	.word 0xc6720009  ! 1032: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc60a0009  ! 1032: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xead21009  ! 1032: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r21
	.word 0xcc220009  ! 1035: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xf9020009  ! 1035: LDF_R	ld	[%r8, %r9], %f28
	.word 0x8143c000  ! 1035: STBAR	stbar
	.word 0xea720009  ! 1038: STX_R	stx	%r21, [%r8 + %r9]
	.word 0xc91a0009  ! 1038: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0x8ba208a9  ! 1038: FSUBs	fsubs	%f8, %f9, %f5
	.word 0xca220009  ! 1041: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xcc520009  ! 1041: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xc3ea1009  ! 1041: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc6720009  ! 1044: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xcc020009  ! 1044: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xcbf22009  ! 1044: CASXA_R	casxa	[%r8]%asi, %r9, %r5
	.word 0xcd220009  ! 1047: STF_R	st	%f6, [%r9, %r8]
	.word 0xc40a0009  ! 1047: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xe4da2350  ! 1047: LDXA_I	ldxa	[%r8, + 0x0350] %asi, %r18
	.word 0xc5220009  ! 1050: STF_R	st	%f2, [%r9, %r8]
	.word 0xc84a0009  ! 1050: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xce8a27ec  ! 1050: LDUBA_I	lduba	[%r8, + 0x07ec] %asi, %r7
	.word 0xc4320009  ! 1053: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xf4020009  ! 1053: LDUW_R	lduw	[%r8 + %r9], %r26
	.word 0xecf22780  ! 1053: STXA_I	stxa	%r22, [%r8 + 0x0780] %asi
	.word 0xd82a0009  ! 1056: STB_R	stb	%r12, [%r8 + %r9]
	.word 0xe91a0009  ! 1056: LDDF_R	ldd	[%r8, %r9], %f20
	.word 0xf28a20e0  ! 1056: LDUBA_I	lduba	[%r8, + 0x00e0] %asi, %r25
	.word 0xca2a0009  ! 1059: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xcc520009  ! 1059: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xa3a209a9  ! 1059: FDIVs	fdivs	%f8, %f9, %f17
	.word 0xd6220009  ! 1062: STW_R	stw	%r11, [%r8 + %r9]
	.word 0xcc0a0009  ! 1062: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xaa4a2170  ! 1062: MULX_I	mulx 	%r8, 0x0170, %r21
	.word 0xc4220009  ! 1065: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xeb1a0009  ! 1065: LDDF_R	ldd	[%r8, %r9], %f21
	.word 0x8ba20829  ! 1065: FADDs	fadds	%f8, %f9, %f5
	.word 0xee2a0009  ! 1068: STB_R	stb	%r23, [%r8 + %r9]
	.word 0xcc5a0009  ! 1068: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xf6ea211c  ! 1068: LDSTUBA_I	ldstuba	%r27, [%r8 + 0x011c] %asi
	.word 0xf5220009  ! 1071: STF_R	st	%f26, [%r9, %r8]
	.word 0xc25a0009  ! 1071: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xc3ea1009  ! 1071: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xfa2a0009  ! 1074: STB_R	stb	%r29, [%r8 + %r9]
	.word 0xc6020009  ! 1074: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xc6422050  ! 1074: LDSW_I	ldsw	[%r8 + 0x0050], %r3
	.word 0xfc220009  ! 1077: STW_R	stw	%r30, [%r8 + %r9]
	.word 0xc44a0009  ! 1077: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xc36a0009  ! 1077: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xe4320009  ! 1080: STH_R	sth	%r18, [%r8 + %r9]
	.word 0xcc120009  ! 1080: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xcaaa27a4  ! 1080: STBA_I	stba	%r5, [%r8 + 0x07a4] %asi
	.word 0xc2720009  ! 1083: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xfe0a0009  ! 1083: LDUB_R	ldub	[%r8 + %r9], %r31
	.word 0xa9a209a9  ! 1083: FDIVs	fdivs	%f8, %f9, %f20
	.word 0xec220009  ! 1086: STW_R	stw	%r22, [%r8 + %r9]
	.word 0xdc0a0009  ! 1086: LDUB_R	ldub	[%r8 + %r9], %r14
	.word 0xcef22900  ! 1086: STXA_I	stxa	%r7, [%r8 + 0x0900] %asi
	.word 0xc8720009  ! 1089: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xf0420009  ! 1089: LDSW_R	ldsw	[%r8 + %r9], %r24
	.word 0xc3ea1009  ! 1089: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xf4220009  ! 1092: STW_R	stw	%r26, [%r8 + %r9]
	.word 0xca5a0009  ! 1092: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xa64a0009  ! 1092: MULX_R	mulx 	%r8, %r9, %r19
	.word 0xc33a0009  ! 1095: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc84a0009  ! 1095: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0x86f22a10  ! 1095: UDIVcc_I	udivcc 	%r8, 0x0a10, %r3
	.word 0xca2a0009  ! 1098: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xda0a0009  ! 1098: LDUB_R	ldub	[%r8 + %r9], %r13
	.word 0xc48a1009  ! 1098: LDUBA_R	lduba	[%r8, %r9] 0x80, %r2
	.word 0xd6320009  ! 1101: STH_R	sth	%r11, [%r8 + %r9]
	.word 0xc45a0009  ! 1101: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xf93a0009  ! 1101: STDF_R	std	%f28, [%r9, %r8]
	.word 0xca320009  ! 1104: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xfa5a0009  ! 1104: LDX_R	ldx	[%r8 + %r9], %r29
	.word 0xa47a2a8c  ! 1104: SDIV_I	sdiv 	%r8, 0x0a8c, %r18
	.word 0xee320009  ! 1107: STH_R	sth	%r23, [%r8 + %r9]
	.word 0xfb020009  ! 1107: LDF_R	ld	[%r8, %r9], %f29
	.word 0x8b6a0009  ! 1107: SDIVX_R	sdivx	%r8, %r9, %r5
	.word 0xc4320009  ! 1110: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xe3020009  ! 1110: LDF_R	ld	[%r8, %r9], %f17
	.word 0xcd3a2e78  ! 1110: STDF_I	std	%f6, [0x0e78, %r8]
	.word 0xee2a0009  ! 1113: STB_R	stb	%r23, [%r8 + %r9]
	.word 0xc8420009  ! 1113: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xf0022834  ! 1113: LDUW_I	lduw	[%r8 + 0x0834], %r24
	.word 0xce2a0009  ! 1116: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xca0a0009  ! 1116: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0x8143c000  ! 1116: STBAR	stbar
	.word 0xdc220009  ! 1119: STW_R	stw	%r14, [%r8 + %r9]
	.word 0xfe520009  ! 1119: LDSH_R	ldsh	[%r8 + %r9], %r31
	.word 0xea0223a4  ! 1119: LDUW_I	lduw	[%r8 + 0x03a4], %r21
	.word 0xfc2a0009  ! 1122: STB_R	stb	%r30, [%r8 + %r9]
	.word 0xcf1a0009  ! 1122: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0x88d22510  ! 1122: UMULcc_I	umulcc 	%r8, 0x0510, %r4
	.word 0xec720009  ! 1125: STX_R	stx	%r22, [%r8 + %r9]
	.word 0xca4a0009  ! 1125: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0x8e720009  ! 1125: UDIV_R	udiv 	%r8, %r9, %r7
	.word 0xcc2a0009  ! 1128: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc65a0009  ! 1128: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0x99220009  ! 1128: MULScc_R	mulscc 	%r8, %r9, %r12
	.word 0xcd3a0009  ! 1131: STDF_R	std	%f6, [%r9, %r8]
	.word 0xfc0a0009  ! 1131: LDUB_R	ldub	[%r8 + %r9], %r30
	.word 0xc93a0009  ! 1131: STDF_R	std	%f4, [%r9, %r8]
	.word 0xce320009  ! 1134: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xd8420009  ! 1134: LDSW_R	ldsw	[%r8 + %r9], %r12
	.word 0x26c20001  ! 1134: BRLZ	brlz,a,nt	%8,<label_0x20001>
	.word 0xce320009  ! 1137: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xcc120009  ! 1137: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xc8ba2768  ! 1137: STDA_I	stda	%r4, [%r8 + 0x0768] %asi
	.word 0xed3a0009  ! 1140: STDF_R	std	%f22, [%r9, %r8]
	.word 0xe24a0009  ! 1140: LDSB_R	ldsb	[%r8 + %r9], %r17
	.word 0xccba2690  ! 1140: STDA_I	stda	%r6, [%r8 + 0x0690] %asi
	.word 0xc6720009  ! 1143: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xca020009  ! 1143: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xccb22e88  ! 1143: STHA_I	stha	%r6, [%r8 + 0x0e88] %asi
	.word 0xcd220009  ! 1146: STF_R	st	%f6, [%r9, %r8]
	.word 0xcb1a0009  ! 1146: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xcc5222b8  ! 1146: LDSH_I	ldsh	[%r8 + 0x02b8], %r6
	.word 0xf22a0009  ! 1149: STB_R	stb	%r25, [%r8 + %r9]
	.word 0xc7020009  ! 1149: LDF_R	ld	[%r8, %r9], %f3
	.word 0xafa20829  ! 1149: FADDs	fadds	%f8, %f9, %f23
	.word 0xc82a0009  ! 1152: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xdd1a0009  ! 1152: LDDF_R	ldd	[%r8, %r9], %f14
	.word 0xc36a0009  ! 1152: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xf53a0009  ! 1155: STDF_R	std	%f26, [%r9, %r8]
	.word 0xca420009  ! 1155: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xc8b225c8  ! 1155: STHA_I	stha	%r4, [%r8 + 0x05c8] %asi
	.word 0xca220009  ! 1158: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xfa520009  ! 1158: LDSH_R	ldsh	[%r8 + %r9], %r29
	.word 0x98522de8  ! 1158: UMUL_I	umul 	%r8, 0x0de8, %r12
	.word 0xfc2a0009  ! 1161: STB_R	stb	%r30, [%r8 + %r9]
	.word 0xcb1a0009  ! 1161: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0x827a2bac  ! 1161: SDIV_I	sdiv 	%r8, 0x0bac, %r1
	.word 0xce220009  ! 1164: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xcc420009  ! 1164: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0x96f227f8  ! 1164: UDIVcc_I	udivcc 	%r8, 0x07f8, %r11
	.word 0xc42a0009  ! 1167: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xce5a0009  ! 1167: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xe06a2370  ! 1167: LDSTUB_I	ldstub	%r16, [%r8 + 0x0370]
	.word 0xc2220009  ! 1170: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc8020009  ! 1170: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0x9fa20829  ! 1170: FADDs	fadds	%f8, %f9, %f15
	.word 0xff220009  ! 1173: STF_R	st	%f31, [%r9, %r8]
	.word 0xcc520009  ! 1173: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0x8a720009  ! 1173: UDIV_R	udiv 	%r8, %r9, %r5
	.word 0xf4220009  ! 1176: STW_R	stw	%r26, [%r8 + %r9]
	.word 0xc4020009  ! 1176: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0x08800001  ! 1176: BLEU	bleu  	<label_0x1>
	.word 0xdd220009  ! 1179: STF_R	st	%f14, [%r9, %r8]
	.word 0xc8420009  ! 1179: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xc36a0009  ! 1179: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc8720009  ! 1182: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xce520009  ! 1182: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xd72225e8  ! 1182: STF_I	st	%f11, [0x05e8, %r8]
	.word 0xf5220009  ! 1185: STF_R	st	%f26, [%r9, %r8]
	.word 0xca4a0009  ! 1185: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0x89a209a9  ! 1185: FDIVs	fdivs	%f8, %f9, %f4
	.word 0xdc320009  ! 1188: STH_R	sth	%r14, [%r8 + %r9]
	.word 0xe20a0009  ! 1188: LDUB_R	ldub	[%r8 + %r9], %r17
	.word 0xae522ef0  ! 1188: UMUL_I	umul 	%r8, 0x0ef0, %r23
	.word 0xde2a0009  ! 1191: STB_R	stb	%r15, [%r8 + %r9]
	.word 0xfe5a0009  ! 1191: LDX_R	ldx	[%r8 + %r9], %r31
	.word 0x86f20009  ! 1191: UDIVcc_R	udivcc 	%r8, %r9, %r3
	.word 0xc8720009  ! 1194: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc4420009  ! 1194: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0x86fa0009  ! 1194: SDIVcc_R	sdivcc 	%r8, %r9, %r3
	.word 0xe0220009  ! 1197: STW_R	stw	%r16, [%r8 + %r9]
	.word 0xfd020009  ! 1197: LDF_R	ld	[%r8, %r9], %f30
	.word 0xc52226fc  ! 1197: STF_I	st	%f2, [0x06fc, %r8]
	.word 0xe9220009  ! 1200: STF_R	st	%f20, [%r9, %r8]
	.word 0xc2120009  ! 1200: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xcff22009  ! 1200: CASXA_R	casxa	[%r8]%asi, %r9, %r7
	.word 0xc82a0009  ! 1203: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc51a0009  ! 1203: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0x32800002  ! 1203: BNE	bne,a	<label_0x2>
	.word 0xcc2a0009  ! 1206: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc31a0009  ! 1206: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xe20a0009  ! 1206: LDUB_R	ldub	[%r8 + %r9], %r17
	.word 0xca220009  ! 1209: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc4420009  ! 1209: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xcf222540  ! 1209: STF_I	st	%f7, [0x0540, %r8]
	.word 0xc22a0009  ! 1212: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xf31a0009  ! 1212: LDDF_R	ldd	[%r8, %r9], %f25
	.word 0x85a20929  ! 1212: FMULs	fmuls	%f8, %f9, %f2
	.word 0xd8720009  ! 1215: STX_R	stx	%r12, [%r8 + %r9]
	.word 0xfc0a0009  ! 1215: LDUB_R	ldub	[%r8 + %r9], %r30
	.word 0xccf22e08  ! 1215: STXA_I	stxa	%r6, [%r8 + 0x0e08] %asi
	.word 0xe6720009  ! 1218: STX_R	stx	%r19, [%r8 + %r9]
	.word 0xc25a0009  ! 1218: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xeeaa2fa8  ! 1218: STBA_I	stba	%r23, [%r8 + 0x0fa8] %asi
	.word 0xfd3a0009  ! 1221: STDF_R	std	%f30, [%r9, %r8]
	.word 0xc20a0009  ! 1221: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xebe22009  ! 1221: CASA_R	casa	[%r8] %asi, %r9, %r21
	.word 0xcc220009  ! 1224: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xca420009  ! 1224: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xc7022460  ! 1224: LDF_I	ld	[%r8, 0x0460], %f3
	.word 0xfd220009  ! 1227: STF_R	st	%f30, [%r9, %r8]
	.word 0xe4020009  ! 1227: LDUW_R	lduw	[%r8 + %r9], %r18
	.word 0xc7f22009  ! 1227: CASXA_R	casxa	[%r8]%asi, %r9, %r3
	.word 0xdc720009  ! 1230: STX_R	stx	%r14, [%r8 + %r9]
	.word 0xce420009  ! 1230: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0x1e800001  ! 1230: BVC	bvc  	<label_0x1>
	.word 0xc2220009  ! 1233: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xe4120009  ! 1233: LDUH_R	lduh	[%r8 + %r9], %r18
	.word 0xada20829  ! 1233: FADDs	fadds	%f8, %f9, %f22
	.word 0xc73a0009  ! 1236: STDF_R	std	%f3, [%r9, %r8]
	.word 0xcc520009  ! 1236: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xc92220d4  ! 1236: STF_I	st	%f4, [0x00d4, %r8]
	.word 0xce220009  ! 1239: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xcc020009  ! 1239: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0x8ba209a9  ! 1239: FDIVs	fdivs	%f8, %f9, %f5
	.word 0xca320009  ! 1242: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xfe0a0009  ! 1242: LDUB_R	ldub	[%r8 + %r9], %r31
	.word 0xe4d21009  ! 1242: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r18
	.word 0xfb3a0009  ! 1245: STDF_R	std	%f29, [%r9, %r8]
	.word 0xf9020009  ! 1245: LDF_R	ld	[%r8, %r9], %f28
	.word 0x8143c000  ! 1245: STBAR	stbar
	.word 0xf6220009  ! 1248: STW_R	stw	%r27, [%r8 + %r9]
	.word 0xce420009  ! 1248: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xa9a20829  ! 1248: FADDs	fadds	%f8, %f9, %f20
	.word 0xca320009  ! 1251: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xf4020009  ! 1251: LDUW_R	lduw	[%r8 + %r9], %r26
	.word 0xcef21009  ! 1251: STXA_R	stxa	%r7, [%r8 + %r9] 0x80
	.word 0xec2a0009  ! 1254: STB_R	stb	%r22, [%r8 + %r9]
	.word 0xc6120009  ! 1254: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0x8143c000  ! 1254: STBAR	stbar
	.word 0xe2320009  ! 1257: STH_R	sth	%r17, [%r8 + %r9]
	.word 0xf1020009  ! 1257: LDF_R	ld	[%r8, %r9], %f24
	.word 0xee0a2758  ! 1257: LDUB_I	ldub	[%r8 + 0x0758], %r23
	.word 0xe82a0009  ! 1260: STB_R	stb	%r20, [%r8 + %r9]
	.word 0xde120009  ! 1260: LDUH_R	lduh	[%r8 + %r9], %r15
	.word 0xa0d20009  ! 1260: UMULcc_R	umulcc 	%r8, %r9, %r16
	.word 0xc8220009  ! 1263: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xf84a0009  ! 1263: LDSB_R	ldsb	[%r8 + %r9], %r28
	.word 0xc36a0009  ! 1263: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xf0720009  ! 1266: STX_R	stx	%r24, [%r8 + %r9]
	.word 0xc91a0009  ! 1266: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0x8143c000  ! 1266: STBAR	stbar
	.word 0xef3a0009  ! 1269: STDF_R	std	%f23, [%r9, %r8]
	.word 0xcd1a0009  ! 1269: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0x2e800002  ! 1269: BVS	bvs,a	<label_0x2>
	.word 0xc2720009  ! 1272: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc2020009  ! 1272: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xf1f21009  ! 1272: CASXA_I	casxa	[%r8] 0x80, %r9, %r24
	.word 0xc8220009  ! 1275: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xd8420009  ! 1275: LDSW_R	ldsw	[%r8 + %r9], %r12
	.word 0x8143e003  ! 1275: MEMBAR	membar	#LoadLoad | #StoreLoad 
	.word 0xca220009  ! 1278: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc40a0009  ! 1278: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0x8cda2da8  ! 1278: SMULcc_I	smulcc 	%r8, 0x0da8, %r6
	.word 0xc6320009  ! 1281: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xcc5a0009  ! 1281: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0x8143c000  ! 1281: STBAR	stbar
	.word 0xc42a0009  ! 1284: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xfe0a0009  ! 1284: LDUB_R	ldub	[%r8 + %r9], %r31
	.word 0xc3ea1009  ! 1284: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc6320009  ! 1287: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc8520009  ! 1287: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xc20227b8  ! 1287: LDUW_I	lduw	[%r8 + 0x07b8], %r1
	.word 0xc82a0009  ! 1290: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xcb020009  ! 1290: LDF_R	ld	[%r8, %r9], %f5
	.word 0xc6520009  ! 1290: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xc9220009  ! 1293: STF_R	st	%f4, [%r9, %r8]
	.word 0xe04a0009  ! 1293: LDSB_R	ldsb	[%r8 + %r9], %r16
	.word 0xe6a221e0  ! 1293: STWA_I	stwa	%r19, [%r8 + 0x01e0] %asi
	.word 0xd6220009  ! 1296: STW_R	stw	%r11, [%r8 + %r9]
	.word 0xc71a0009  ! 1296: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xc8ba2440  ! 1296: STDA_I	stda	%r4, [%r8 + 0x0440] %asi
	.word 0xce720009  ! 1299: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc9020009  ! 1299: LDF_R	ld	[%r8, %r9], %f4
	.word 0x8143c000  ! 1299: STBAR	stbar
	.word 0xca2a0009  ! 1302: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xcc4a0009  ! 1302: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xc3ea2930  ! 1302: PREFETCHA_I	prefetcha	[%r8, + 0x0930] %asi, #one_read
	.word 0xc6220009  ! 1305: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xe20a0009  ! 1305: LDUB_R	ldub	[%r8 + %r9], %r17
	.word 0x8143c000  ! 1305: STBAR	stbar
	.word 0xc6220009  ! 1308: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc3020009  ! 1308: LDF_R	ld	[%r8, %r9], %f1
	.word 0xb922224c  ! 1308: MULScc_I	mulscc 	%r8, 0x024c, %r28
	.word 0xca320009  ! 1311: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xea5a0009  ! 1311: LDX_R	ldx	[%r8 + %r9], %r21
	.word 0xc4aa2790  ! 1311: STBA_I	stba	%r2, [%r8 + 0x0790] %asi
	.word 0xca720009  ! 1314: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xcb1a0009  ! 1314: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0x86fa0009  ! 1314: SDIVcc_R	sdivcc 	%r8, %r9, %r3
	.word 0xc82a0009  ! 1317: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc45a0009  ! 1317: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xb2f20009  ! 1317: UDIVcc_R	udivcc 	%r8, %r9, %r25
	.word 0xed220009  ! 1320: STF_R	st	%f22, [%r9, %r8]
	.word 0xc2520009  ! 1320: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0x08800002  ! 1320: BLEU	bleu  	<label_0x2>
	.word 0xc5220009  ! 1323: STF_R	st	%f2, [%r9, %r8]
	.word 0xc7020009  ! 1323: LDF_R	ld	[%r8, %r9], %f3
	.word 0xcaa21009  ! 1323: STWA_R	stwa	%r5, [%r8 + %r9] 0x80
	.word 0xc8320009  ! 1326: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xcc120009  ! 1326: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xc36a2120  ! 1326: PREFETCH_I	prefetch	[%r8 + 0x0120], #one_read
	.word 0xcb220009  ! 1329: STF_R	st	%f5, [%r9, %r8]
	.word 0xcc520009  ! 1329: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0x88da0009  ! 1329: SMULcc_R	smulcc 	%r8, %r9, %r4
	.word 0xf7220009  ! 1332: STF_R	st	%f27, [%r9, %r8]
	.word 0xea420009  ! 1332: LDSW_R	ldsw	[%r8 + %r9], %r21
	.word 0x9ed20009  ! 1332: UMULcc_R	umulcc 	%r8, %r9, %r15
	.word 0xdf3a0009  ! 1335: STDF_R	std	%f15, [%r9, %r8]
	.word 0xe71a0009  ! 1335: LDDF_R	ldd	[%r8, %r9], %f19
	.word 0xc31a0009  ! 1335: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xc8320009  ! 1338: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc2420009  ! 1338: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xc4f21009  ! 1338: STXA_R	stxa	%r2, [%r8 + %r9] 0x80
	.word 0xc73a0009  ! 1341: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc2020009  ! 1341: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xf0f22d28  ! 1341: STXA_I	stxa	%r24, [%r8 + 0x0d28] %asi
	.word 0xe3220009  ! 1344: STF_R	st	%f17, [%r9, %r8]
	.word 0xe2120009  ! 1344: LDUH_R	lduh	[%r8 + %r9], %r17
	.word 0xe86a2744  ! 1344: LDSTUB_I	ldstub	%r20, [%r8 + 0x0744]
	.word 0xfe2a0009  ! 1347: STB_R	stb	%r31, [%r8 + %r9]
	.word 0xcc420009  ! 1347: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0x0a800002  ! 1347: BCS	bcs  	<label_0x2>
	.word 0xc8320009  ! 1350: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xf0520009  ! 1350: LDSH_R	ldsh	[%r8 + %r9], %r24
	.word 0x8ba20829  ! 1350: FADDs	fadds	%f8, %f9, %f5
	.word 0xce720009  ! 1353: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc8520009  ! 1353: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xc2fa1009  ! 1353: SWAPA_R	swapa	%r1, [%r8 + %r9] 0x80
	.word 0xca720009  ! 1356: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xcc420009  ! 1356: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0x84da0009  ! 1356: SMULcc_R	smulcc 	%r8, %r9, %r2
	.word 0xcf220009  ! 1359: STF_R	st	%f7, [%r9, %r8]
	.word 0xc3020009  ! 1359: LDF_R	ld	[%r8, %r9], %f1
	.word 0x82da2c8c  ! 1359: SMULcc_I	smulcc 	%r8, 0x0c8c, %r1
	.word 0xc6720009  ! 1362: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xce4a0009  ! 1362: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xc8f22480  ! 1362: STXA_I	stxa	%r4, [%r8 + 0x0480] %asi
	.word 0xc42a0009  ! 1365: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xe6020009  ! 1365: LDUW_R	lduw	[%r8 + %r9], %r19
	.word 0xcb1a29c8  ! 1365: LDDF_I	ldd	[%r8, 0x09c8], %f5
	.word 0xcb3a0009  ! 1368: STDF_R	std	%f5, [%r9, %r8]
	.word 0xe0120009  ! 1368: LDUH_R	lduh	[%r8 + %r9], %r16
	.word 0xce822788  ! 1368: LDUWA_I	lduwa	[%r8, + 0x0788] %asi, %r7
	.word 0xc22a0009  ! 1371: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xed020009  ! 1371: LDF_R	ld	[%r8, %r9], %f22
	.word 0x2e800002  ! 1371: BVS	bvs,a	<label_0x2>
	.word 0xcc220009  ! 1374: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xf24a0009  ! 1374: LDSB_R	ldsb	[%r8 + %r9], %r25
	.word 0xc2da24b0  ! 1374: LDXA_I	ldxa	[%r8, + 0x04b0] %asi, %r1
	.word 0xca720009  ! 1377: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xde520009  ! 1377: LDSH_R	ldsh	[%r8 + %r9], %r15
	.word 0xfec21009  ! 1377: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r31
	.word 0xe22a0009  ! 1380: STB_R	stb	%r17, [%r8 + %r9]
	.word 0xc71a0009  ! 1380: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0x22800002  ! 1380: BE	be,a	<label_0x2>
	.word 0xce320009  ! 1383: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xcb1a0009  ! 1383: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xb8720009  ! 1383: UDIV_R	udiv 	%r8, %r9, %r28
	.word 0xc53a0009  ! 1386: STDF_R	std	%f2, [%r9, %r8]
	.word 0xee520009  ! 1386: LDSH_R	ldsh	[%r8 + %r9], %r23
	.word 0x8143c000  ! 1386: STBAR	stbar
	.word 0xca2a0009  ! 1389: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xe7020009  ! 1389: LDF_R	ld	[%r8, %r9], %f19
	.word 0x8143e062  ! 1389: MEMBAR	membar	#StoreLoad | #MemIssue | #Sync 
	.word 0xe42a0009  ! 1392: STB_R	stb	%r18, [%r8 + %r9]
	.word 0xe11a0009  ! 1392: LDDF_R	ldd	[%r8, %r9], %f16
	.word 0xc36a2048  ! 1392: PREFETCH_I	prefetch	[%r8 + 0x0048], #one_read
	.word 0xca320009  ! 1395: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xf4420009  ! 1395: LDSW_R	ldsw	[%r8 + %r9], %r26
	.word 0xf4ea1009  ! 1395: LDSTUBA_R	ldstuba	%r26, [%r8 + %r9] 0x80
	.word 0xcc220009  ! 1398: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc5020009  ! 1398: LDF_R	ld	[%r8, %r9], %f2
	.word 0x82f20009  ! 1398: UDIVcc_R	udivcc 	%r8, %r9, %r1
	.word 0xe8320009  ! 1401: STH_R	sth	%r20, [%r8 + %r9]
	.word 0xde020009  ! 1401: LDUW_R	lduw	[%r8 + %r9], %r15
	.word 0xcd222eb8  ! 1401: STF_I	st	%f6, [0x0eb8, %r8]
	.word 0xcb220009  ! 1404: STF_R	st	%f5, [%r9, %r8]
	.word 0xcb1a0009  ! 1404: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0x8143c000  ! 1404: STBAR	stbar
	.word 0xf33a0009  ! 1407: STDF_R	std	%f25, [%r9, %r8]
	.word 0xca420009  ! 1407: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xbd222078  ! 1407: MULScc_I	mulscc 	%r8, 0x0078, %r30
	.word 0xc2220009  ! 1410: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xe5020009  ! 1410: LDF_R	ld	[%r8, %r9], %f18
	.word 0x06800002  ! 1410: BL	bl  	<label_0x2>
	.word 0xc6220009  ! 1413: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xe8020009  ! 1413: LDUW_R	lduw	[%r8 + %r9], %r20
	.word 0x8e5a28cc  ! 1413: SMUL_I	smul 	%r8, 0x08cc, %r7
	.word 0xc22a0009  ! 1416: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xce0a0009  ! 1416: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xc2fa24ec  ! 1416: SWAPA_I	swapa	%r1, [%r8 + 0x04ec] %asi
	.word 0xed220009  ! 1419: STF_R	st	%f22, [%r9, %r8]
	.word 0xc4020009  ! 1419: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xc36a2ccc  ! 1419: PREFETCH_I	prefetch	[%r8 + 0x0ccc], #one_read
	.word 0xee720009  ! 1422: STX_R	stx	%r23, [%r8 + %r9]
	.word 0xca4a0009  ! 1422: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0x8143c000  ! 1422: STBAR	stbar
	.word 0xc7220009  ! 1425: STF_R	st	%f3, [%r9, %r8]
	.word 0xc25a0009  ! 1425: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xc36a2af0  ! 1425: PREFETCH_I	prefetch	[%r8 + 0x0af0], #one_read
	.word 0xcb220009  ! 1428: STF_R	st	%f5, [%r9, %r8]
	.word 0xcf1a0009  ! 1428: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0x876a0009  ! 1428: SDIVX_R	sdivx	%r8, %r9, %r3
	.word 0xe0720009  ! 1431: STX_R	stx	%r16, [%r8 + %r9]
	.word 0xc40a0009  ! 1431: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xe9e21009  ! 1431: CASA_I	casa	[%r8] 0x80, %r9, %r20
	.word 0xc93a0009  ! 1434: STDF_R	std	%f4, [%r9, %r8]
	.word 0xcf020009  ! 1434: LDF_R	ld	[%r8, %r9], %f7
	.word 0xc4a22410  ! 1434: STWA_I	stwa	%r2, [%r8 + 0x0410] %asi
	.word 0xc7220009  ! 1437: STF_R	st	%f3, [%r9, %r8]
	.word 0xcc120009  ! 1437: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xfc7a2fc8  ! 1437: SWAP_I	swap	%r30, [%r8 + 0x0fc8]
	.word 0xeb3a0009  ! 1440: STDF_R	std	%f21, [%r9, %r8]
	.word 0xc60a0009  ! 1440: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xc3ea2bac  ! 1440: PREFETCHA_I	prefetcha	[%r8, + 0x0bac] %asi, #one_read
	.word 0xca720009  ! 1443: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xf11a0009  ! 1443: LDDF_R	ldd	[%r8, %r9], %f24
	.word 0xafa208a9  ! 1443: FSUBs	fsubs	%f8, %f9, %f23
	.word 0xee320009  ! 1446: STH_R	sth	%r23, [%r8 + %r9]
	.word 0xc6420009  ! 1446: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xc45a0009  ! 1446: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xce720009  ! 1449: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xee520009  ! 1449: LDSH_R	ldsh	[%r8 + %r9], %r23
	.word 0x8e7a254c  ! 1449: SDIV_I	sdiv 	%r8, 0x054c, %r7
	.word 0xfe320009  ! 1452: STH_R	sth	%r31, [%r8 + %r9]
	.word 0xe1020009  ! 1452: LDF_R	ld	[%r8, %r9], %f16
	.word 0xca6a2430  ! 1452: LDSTUB_I	ldstub	%r5, [%r8 + 0x0430]
	.word 0xe4320009  ! 1455: STH_R	sth	%r18, [%r8 + %r9]
	.word 0xc6120009  ! 1455: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xc3ea1009  ! 1455: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xea220009  ! 1458: STW_R	stw	%r21, [%r8 + %r9]
	.word 0xfd020009  ! 1458: LDF_R	ld	[%r8, %r9], %f30
	.word 0x89a20829  ! 1458: FADDs	fadds	%f8, %f9, %f4
	.word 0xc6220009  ! 1461: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xcc520009  ! 1461: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xc3ea2f48  ! 1461: PREFETCHA_I	prefetcha	[%r8, + 0x0f48] %asi, #one_read
	.word 0xc8720009  ! 1464: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xf4020009  ! 1464: LDUW_R	lduw	[%r8 + %r9], %r26
	.word 0x8143e026  ! 1464: MEMBAR	membar	#StoreLoad | #LoadStore | #MemIssue 
	.word 0xca720009  ! 1467: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xe6120009  ! 1467: LDUH_R	lduh	[%r8 + %r9], %r19
	.word 0x06c20001  ! 1467: BRLZ	brlz  ,nt	%8,<label_0x20001>
	.word 0xcc220009  ! 1470: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xcd1a0009  ! 1470: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0x8143e00f  ! 1470: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore 
	.word 0xc82a0009  ! 1473: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xce020009  ! 1473: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xc89a2ad8  ! 1473: LDDA_I	ldda	[%r8, + 0x0ad8] %asi, %r4
	.word 0xc2320009  ! 1476: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xcf1a0009  ! 1476: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0x83a20929  ! 1476: FMULs	fmuls	%f8, %f9, %f1
	.word 0xce2a0009  ! 1479: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc6020009  ! 1479: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xc3ea1009  ! 1479: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xce720009  ! 1482: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xde020009  ! 1482: LDUW_R	lduw	[%r8 + %r9], %r15
	.word 0xc53a20c8  ! 1482: STDF_I	std	%f2, [0x00c8, %r8]
	.word 0xc2720009  ! 1485: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xee5a0009  ! 1485: LDX_R	ldx	[%r8 + %r9], %r23
	.word 0xc4da2d88  ! 1485: LDXA_I	ldxa	[%r8, + 0x0d88] %asi, %r2
	.word 0xe62a0009  ! 1488: STB_R	stb	%r19, [%r8 + %r9]
	.word 0xc6420009  ! 1488: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xecba1009  ! 1488: STDA_R	stda	%r22, [%r8 + %r9] 0x80
	.word 0xda2a0009  ! 1491: STB_R	stb	%r13, [%r8 + %r9]
	.word 0xd7020009  ! 1491: LDF_R	ld	[%r8, %r9], %f11
	.word 0xf2a22c60  ! 1491: STWA_I	stwa	%r25, [%r8 + 0x0c60] %asi
	.word 0xc82a0009  ! 1494: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xcc0a0009  ! 1494: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xcbe21009  ! 1494: CASA_I	casa	[%r8] 0x80, %r9, %r5
	.word 0xc3220009  ! 1497: STF_R	st	%f1, [%r9, %r8]
	.word 0xc85a0009  ! 1497: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xc8fa2eec  ! 1497: SWAPA_I	swapa	%r4, [%r8 + 0x0eec] %asi
	.word 0xfb3a0009  ! 1500: STDF_R	std	%f29, [%r9, %r8]
	.word 0xcb1a0009  ! 1500: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0x02800001  ! 1500: BE	be  	<label_0x1>
	.word 0xc82a0009  ! 1503: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc40a0009  ! 1503: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xc902291c  ! 1503: LDF_I	ld	[%r8, 0x091c], %f4
	.word 0xf4320009  ! 1506: STH_R	sth	%r26, [%r8 + %r9]
	.word 0xf84a0009  ! 1506: LDSB_R	ldsb	[%r8 + %r9], %r28
	.word 0xb7a20829  ! 1506: FADDs	fadds	%f8, %f9, %f27
	.word 0xe22a0009  ! 1509: STB_R	stb	%r17, [%r8 + %r9]
	.word 0xce020009  ! 1509: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xc66a210c  ! 1509: LDSTUB_I	ldstub	%r3, [%r8 + 0x010c]
	.word 0xe6720009  ! 1512: STX_R	stx	%r19, [%r8 + %r9]
	.word 0xc24a0009  ! 1512: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xc2ca1009  ! 1512: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r1
	.word 0xf2720009  ! 1515: STX_R	stx	%r25, [%r8 + %r9]
	.word 0xc6520009  ! 1515: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0x847a0009  ! 1515: SDIV_R	sdiv 	%r8, %r9, %r2
	.word 0xcf220009  ! 1518: STF_R	st	%f7, [%r9, %r8]
	.word 0xe71a0009  ! 1518: LDDF_R	ldd	[%r8, %r9], %f19
	.word 0x04ca0001  ! 1518: BRLEZ	brlez  ,pt	%8,<label_0xa0001>
	.word 0xcc320009  ! 1521: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xef020009  ! 1521: LDF_R	ld	[%r8, %r9], %f23
	.word 0x16800002  ! 1521: BGE	bge  	<label_0x2>
	.word 0xcd3a0009  ! 1524: STDF_R	std	%f6, [%r9, %r8]
	.word 0xf5020009  ! 1524: LDF_R	ld	[%r8, %r9], %f26
	.word 0x16800001  ! 1524: BGE	bge  	<label_0x1>
	.word 0xcb220009  ! 1527: STF_R	st	%f5, [%r9, %r8]
	.word 0xce520009  ! 1527: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xd93a0009  ! 1527: STDF_R	std	%f12, [%r9, %r8]
	.word 0xcd220009  ! 1530: STF_R	st	%f6, [%r9, %r8]
	.word 0xce0a0009  ! 1530: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0x1c800001  ! 1530: BPOS	bpos  	<label_0x1>
	.word 0xf4720009  ! 1533: STX_R	stx	%r26, [%r8 + %r9]
	.word 0xca020009  ! 1533: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0x8cd22590  ! 1533: UMULcc_I	umulcc 	%r8, 0x0590, %r6
	.word 0xc53a0009  ! 1536: STDF_R	std	%f2, [%r9, %r8]
	.word 0xce120009  ! 1536: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xce420009  ! 1536: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xca320009  ! 1539: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xe4420009  ! 1539: LDSW_R	ldsw	[%r8 + %r9], %r18
	.word 0xa4da0009  ! 1539: SMULcc_R	smulcc 	%r8, %r9, %r18
	.word 0xc8720009  ! 1542: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xce020009  ! 1542: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xc8c22724  ! 1542: LDSWA_I	ldswa	[%r8, + 0x0724] %asi, %r4
	.word 0xce220009  ! 1545: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xca4a0009  ! 1545: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xf5f22009  ! 1545: CASXA_R	casxa	[%r8]%asi, %r9, %r26
	.word 0xc42a0009  ! 1548: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xe85a0009  ! 1548: LDX_R	ldx	[%r8 + %r9], %r20
	.word 0xb8522228  ! 1548: UMUL_I	umul 	%r8, 0x0228, %r28
	.word 0xc22a0009  ! 1551: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xfd1a0009  ! 1551: LDDF_R	ldd	[%r8, %r9], %f30
	.word 0x24800001  ! 1551: BLE	ble,a	<label_0x1>
	.word 0xc8320009  ! 1554: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc25a0009  ! 1554: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0x84520009  ! 1554: UMUL_R	umul 	%r8, %r9, %r2
	.word 0xc33a0009  ! 1557: STDF_R	std	%f1, [%r9, %r8]
	.word 0xf0020009  ! 1557: LDUW_R	lduw	[%r8 + %r9], %r24
	.word 0xc36a2878  ! 1557: PREFETCH_I	prefetch	[%r8 + 0x0878], #one_read
	.word 0xc62a0009  ! 1560: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc8420009  ! 1560: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xf44a2b80  ! 1560: LDSB_I	ldsb	[%r8 + 0x0b80], %r26
	.word 0xde720009  ! 1563: STX_R	stx	%r15, [%r8 + %r9]
	.word 0xf7020009  ! 1563: LDF_R	ld	[%r8, %r9], %f27
	.word 0x8143c000  ! 1563: STBAR	stbar
	.word 0xd8720009  ! 1566: STX_R	stx	%r12, [%r8 + %r9]
	.word 0xca520009  ! 1566: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xc4520009  ! 1566: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xc93a0009  ! 1569: STDF_R	std	%f4, [%r9, %r8]
	.word 0xec5a0009  ! 1569: LDX_R	ldx	[%r8 + %r9], %r22
	.word 0xc2f228b0  ! 1569: STXA_I	stxa	%r1, [%r8 + 0x08b0] %asi
	.word 0xf22a0009  ! 1572: STB_R	stb	%r25, [%r8 + %r9]
	.word 0xcc020009  ! 1572: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0x02ca0001  ! 1572: BRZ	brz  ,pt	%8,<label_0xa0001>
	.word 0xc8220009  ! 1575: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc24a0009  ! 1575: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xdd220009  ! 1575: STF_R	st	%f14, [%r9, %r8]
	.word 0xc42a0009  ! 1578: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xd6120009  ! 1578: LDUH_R	lduh	[%r8 + %r9], %r11
	.word 0x8fa208a9  ! 1578: FSUBs	fsubs	%f8, %f9, %f7
	.word 0xca2a0009  ! 1581: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xce420009  ! 1581: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xc3ea1009  ! 1581: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xf2220009  ! 1584: STW_R	stw	%r25, [%r8 + %r9]
	.word 0xcd020009  ! 1584: LDF_R	ld	[%r8, %r9], %f6
	.word 0xce7a0009  ! 1584: SWAP_R	swap	%r7, [%r8 + %r9]
	.word 0xd7220009  ! 1587: STF_R	st	%f11, [%r9, %r8]
	.word 0xc2120009  ! 1587: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0x8143c000  ! 1587: STBAR	stbar
	.word 0xc42a0009  ! 1590: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc31a0009  ! 1590: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xf4f21009  ! 1590: STXA_R	stxa	%r26, [%r8 + %r9] 0x80
	.word 0xfc720009  ! 1593: STX_R	stx	%r30, [%r8 + %r9]
	.word 0xc44a0009  ! 1593: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xc36a2b48  ! 1593: PREFETCH_I	prefetch	[%r8 + 0x0b48], #one_read
	.word 0xc73a0009  ! 1596: STDF_R	std	%f3, [%r9, %r8]
	.word 0xea420009  ! 1596: LDSW_R	ldsw	[%r8 + %r9], %r21
	.word 0xd7e22009  ! 1596: CASA_R	casa	[%r8] %asi, %r9, %r11
	.word 0xc6220009  ! 1599: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xce4a0009  ! 1599: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xda922844  ! 1599: LDUHA_I	lduha	[%r8, + 0x0844] %asi, %r13
	.word 0xf73a0009  ! 1602: STDF_R	std	%f27, [%r9, %r8]
	.word 0xc8520009  ! 1602: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xc2c22b68  ! 1602: LDSWA_I	ldswa	[%r8, + 0x0b68] %asi, %r1
	.word 0xc4220009  ! 1605: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xde520009  ! 1605: LDSH_R	ldsh	[%r8 + %r9], %r15
	.word 0x89a20829  ! 1605: FADDs	fadds	%f8, %f9, %f4
	.word 0xc93a0009  ! 1608: STDF_R	std	%f4, [%r9, %r8]
	.word 0xea020009  ! 1608: LDUW_R	lduw	[%r8 + %r9], %r21
	.word 0xc2b21009  ! 1608: STHA_R	stha	%r1, [%r8 + %r9] 0x80
	.word 0xda320009  ! 1611: STH_R	sth	%r13, [%r8 + %r9]
	.word 0xc6120009  ! 1611: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xcc42297c  ! 1611: LDSW_I	ldsw	[%r8 + 0x097c], %r6
	.word 0xc33a0009  ! 1614: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc25a0009  ! 1614: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0x884a2f20  ! 1614: MULX_I	mulx 	%r8, 0x0f20, %r4
	.word 0xcc220009  ! 1617: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xea4a0009  ! 1617: LDSB_R	ldsb	[%r8 + %r9], %r21
	.word 0xdcd22120  ! 1617: LDSHA_I	ldsha	[%r8, + 0x0120] %asi, %r14
	.word 0xe02a0009  ! 1620: STB_R	stb	%r16, [%r8 + %r9]
	.word 0xd8520009  ! 1620: LDSH_R	ldsh	[%r8 + %r9], %r12
	.word 0x84d222d4  ! 1620: UMULcc_I	umulcc 	%r8, 0x02d4, %r2
	.word 0xfa720009  ! 1623: STX_R	stx	%r29, [%r8 + %r9]
	.word 0xcd1a0009  ! 1623: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xeb022a78  ! 1623: LDF_I	ld	[%r8, 0x0a78], %f21
	.word 0xc8720009  ! 1626: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xd91a0009  ! 1626: LDDF_R	ldd	[%r8, %r9], %f12
	.word 0xc3e21009  ! 1626: CASA_I	casa	[%r8] 0x80, %r9, %r1
	.word 0xc4720009  ! 1629: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xe7020009  ! 1629: LDF_R	ld	[%r8, %r9], %f19
	.word 0xa5222490  ! 1629: MULScc_I	mulscc 	%r8, 0x0490, %r18
	.word 0xd93a0009  ! 1632: STDF_R	std	%f12, [%r9, %r8]
	.word 0xc6520009  ! 1632: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xcde21009  ! 1632: CASA_I	casa	[%r8] 0x80, %r9, %r6
	.word 0xfd3a0009  ! 1635: STDF_R	std	%f30, [%r9, %r8]
	.word 0xcc4a0009  ! 1635: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xb0520009  ! 1635: UMUL_R	umul 	%r8, %r9, %r24
	.word 0xce720009  ! 1638: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc25a0009  ! 1638: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xc8ba22c0  ! 1638: STDA_I	stda	%r4, [%r8 + 0x02c0] %asi
	.word 0xc82a0009  ! 1641: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xca420009  ! 1641: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0x22ca0001  ! 1641: BRZ	brz,a,pt	%8,<label_0xa0001>
	.word 0xca720009  ! 1644: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xf9020009  ! 1644: LDF_R	ld	[%r8, %r9], %f28
	.word 0xc45a2c08  ! 1644: LDX_I	ldx	[%r8 + 0x0c08], %r2
	.word 0xe7220009  ! 1647: STF_R	st	%f19, [%r9, %r8]
	.word 0xdc520009  ! 1647: LDSH_R	ldsh	[%r8 + %r9], %r14
	.word 0x24800001  ! 1647: BLE	ble,a	<label_0x1>
	.word 0xca320009  ! 1650: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc2520009  ! 1650: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xe4ba1009  ! 1650: STDA_R	stda	%r18, [%r8 + %r9] 0x80
	.word 0xca320009  ! 1653: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc2520009  ! 1653: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0x0c800002  ! 1653: BNEG	bneg  	<label_0x2>
	.word 0xca220009  ! 1656: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xcc4a0009  ! 1656: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0x8ad20009  ! 1656: UMULcc_R	umulcc 	%r8, %r9, %r5
	.word 0xe1220009  ! 1659: STF_R	st	%f16, [%r9, %r8]
	.word 0xf3020009  ! 1659: LDF_R	ld	[%r8, %r9], %f25
	.word 0x06ca0001  ! 1659: BRLZ	brlz  ,pt	%8,<label_0xa0001>
	.word 0xe22a0009  ! 1662: STB_R	stb	%r17, [%r8 + %r9]
	.word 0xce020009  ! 1662: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xc3ea2af0  ! 1662: PREFETCHA_I	prefetcha	[%r8, + 0x0af0] %asi, #one_read
	.word 0xcb220009  ! 1665: STF_R	st	%f5, [%r9, %r8]
	.word 0xcd1a0009  ! 1665: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xcc7a2970  ! 1665: SWAP_I	swap	%r6, [%r8 + 0x0970]
	.word 0xca320009  ! 1668: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xcd1a0009  ! 1668: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xc36a2ebc  ! 1668: PREFETCH_I	prefetch	[%r8 + 0x0ebc], #one_read
	.word 0xfb220009  ! 1671: STF_R	st	%f29, [%r9, %r8]
	.word 0xf0420009  ! 1671: LDSW_R	ldsw	[%r8 + %r9], %r24
	.word 0xc6922e50  ! 1671: LDUHA_I	lduha	[%r8, + 0x0e50] %asi, %r3
	.word 0xc5220009  ! 1674: STF_R	st	%f2, [%r9, %r8]
	.word 0xc31a0009  ! 1674: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xde4a2794  ! 1674: LDSB_I	ldsb	[%r8 + 0x0794], %r15
	.word 0xca220009  ! 1677: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xdb020009  ! 1677: LDF_R	ld	[%r8, %r9], %f13
	.word 0x8143c000  ! 1677: STBAR	stbar
	.word 0xc4220009  ! 1680: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xcc420009  ! 1680: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0x8143c000  ! 1680: STBAR	stbar
	.word 0xc2720009  ! 1683: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xce120009  ! 1683: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0x06800002  ! 1683: BL	bl  	<label_0x2>
	.word 0xda720009  ! 1686: STX_R	stx	%r13, [%r8 + %r9]
	.word 0xc8420009  ! 1686: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xcf222878  ! 1686: STF_I	st	%f7, [0x0878, %r8]
	.word 0xc4320009  ! 1689: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xf0020009  ! 1689: LDUW_R	lduw	[%r8 + %r9], %r24
	.word 0xce0a2848  ! 1689: LDUB_I	ldub	[%r8 + 0x0848], %r7
	.word 0xc4720009  ! 1692: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xcb020009  ! 1692: LDF_R	ld	[%r8, %r9], %f5
	.word 0xc85a2d48  ! 1692: LDX_I	ldx	[%r8 + 0x0d48], %r4
	.word 0xed220009  ! 1695: STF_R	st	%f22, [%r9, %r8]
	.word 0xfc0a0009  ! 1695: LDUB_R	ldub	[%r8 + %r9], %r30
	.word 0x86d22f70  ! 1695: UMULcc_I	umulcc 	%r8, 0x0f70, %r3
	.word 0xc93a0009  ! 1698: STDF_R	std	%f4, [%r9, %r8]
	.word 0xc31a0009  ! 1698: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xccaa1009  ! 1698: STBA_R	stba	%r6, [%r8 + %r9] 0x80
	.word 0xff3a0009  ! 1701: STDF_R	std	%f31, [%r9, %r8]
	.word 0xc6120009  ! 1701: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xe0ca207c  ! 1701: LDSBA_I	ldsba	[%r8, + 0x007c] %asi, %r16
	.word 0xc7220009  ! 1704: STF_R	st	%f3, [%r9, %r8]
	.word 0xc91a0009  ! 1704: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xdc821009  ! 1704: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r14
	.word 0xda320009  ! 1707: STH_R	sth	%r13, [%r8 + %r9]
	.word 0xe20a0009  ! 1707: LDUB_R	ldub	[%r8 + %r9], %r17
	.word 0xc7222e4c  ! 1707: STF_I	st	%f3, [0x0e4c, %r8]
	.word 0xca2a0009  ! 1710: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc91a0009  ! 1710: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0x8b6a2184  ! 1710: SDIVX_I	sdivx	%r8, 0x0184, %r5
	.word 0xe13a0009  ! 1713: STDF_R	std	%f16, [%r9, %r8]
	.word 0xdf1a0009  ! 1713: LDDF_R	ldd	[%r8, %r9], %f15
	.word 0x24ca0001  ! 1713: BRLEZ	brlez,a,pt	%8,<label_0xa0001>
	.word 0xee2a0009  ! 1716: STB_R	stb	%r23, [%r8 + %r9]
	.word 0xcc020009  ! 1716: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xafa209a9  ! 1716: FDIVs	fdivs	%f8, %f9, %f23
	.word 0xc82a0009  ! 1719: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc4420009  ! 1719: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0x896a227c  ! 1719: SDIVX_I	sdivx	%r8, 0x027c, %r4
	.word 0xda2a0009  ! 1722: STB_R	stb	%r13, [%r8 + %r9]
	.word 0xc4020009  ! 1722: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0x8c520009  ! 1722: UMUL_R	umul 	%r8, %r9, %r6
	.word 0xf0320009  ! 1725: STH_R	sth	%r24, [%r8 + %r9]
	.word 0xd84a0009  ! 1725: LDSB_R	ldsb	[%r8 + %r9], %r12
	.word 0x872227d8  ! 1725: MULScc_I	mulscc 	%r8, 0x07d8, %r3
	.word 0xd6720009  ! 1728: STX_R	stx	%r11, [%r8 + %r9]
	.word 0xea4a0009  ! 1728: LDSB_R	ldsb	[%r8 + %r9], %r21
	.word 0xf4a21009  ! 1728: STWA_R	stwa	%r26, [%r8 + %r9] 0x80
	.word 0xc42a0009  ! 1731: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xcc4a0009  ! 1731: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0x26800001  ! 1731: BL	bl,a	<label_0x1>
	.word 0xc6720009  ! 1734: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xcc420009  ! 1734: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xce422a90  ! 1734: LDSW_I	ldsw	[%r8 + 0x0a90], %r7
	.word 0xc7220009  ! 1737: STF_R	st	%f3, [%r9, %r8]
	.word 0xcb1a0009  ! 1737: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xb1a20929  ! 1737: FMULs	fmuls	%f8, %f9, %f24
	.word 0xe82a0009  ! 1740: STB_R	stb	%r20, [%r8 + %r9]
	.word 0xca020009  ! 1740: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0x87220009  ! 1740: MULScc_R	mulscc 	%r8, %r9, %r3
	.word 0xc22a0009  ! 1743: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xca4a0009  ! 1743: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xfeea2ed8  ! 1743: LDSTUBA_I	ldstuba	%r31, [%r8 + 0x0ed8] %asi
	.word 0xc33a0009  ! 1746: STDF_R	std	%f1, [%r9, %r8]
	.word 0xee4a0009  ! 1746: LDSB_R	ldsb	[%r8 + %r9], %r23
	.word 0xccf21009  ! 1746: STXA_R	stxa	%r6, [%r8 + %r9] 0x80
	.word 0xcc720009  ! 1749: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc4120009  ! 1749: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xc88a1009  ! 1749: LDUBA_R	lduba	[%r8, %r9] 0x80, %r4
	.word 0xc42a0009  ! 1752: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc3020009  ! 1752: LDF_R	ld	[%r8, %r9], %f1
	.word 0x8652291c  ! 1752: UMUL_I	umul 	%r8, 0x091c, %r3
	.word 0xea2a0009  ! 1755: STB_R	stb	%r21, [%r8 + %r9]
	.word 0xec4a0009  ! 1755: LDSB_R	ldsb	[%r8 + %r9], %r22
	.word 0xa0d20009  ! 1755: UMULcc_R	umulcc 	%r8, %r9, %r16
	.word 0xd8220009  ! 1758: STW_R	stw	%r12, [%r8 + %r9]
	.word 0xe71a0009  ! 1758: LDDF_R	ldd	[%r8, %r9], %f19
	.word 0xc3ea29e8  ! 1758: PREFETCHA_I	prefetcha	[%r8, + 0x09e8] %asi, #one_read
	.word 0xeb3a0009  ! 1761: STDF_R	std	%f21, [%r9, %r8]
	.word 0xc2420009  ! 1761: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xa5a209a9  ! 1761: FDIVs	fdivs	%f8, %f9, %f18
	.word 0xc2220009  ! 1764: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xf24a0009  ! 1764: LDSB_R	ldsb	[%r8 + %r9], %r25
	.word 0x86da2350  ! 1764: SMULcc_I	smulcc 	%r8, 0x0350, %r3
	.word 0xc4320009  ! 1767: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xcc5a0009  ! 1767: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xcc120009  ! 1767: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xfa220009  ! 1770: STW_R	stw	%r29, [%r8 + %r9]
	.word 0xf9020009  ! 1770: LDF_R	ld	[%r8, %r9], %f28
	.word 0xc91a0009  ! 1770: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xe5220009  ! 1773: STF_R	st	%f18, [%r9, %r8]
	.word 0xc8120009  ! 1773: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xd7222568  ! 1773: STF_I	st	%f11, [0x0568, %r8]
	.word 0xcd3a0009  ! 1776: STDF_R	std	%f6, [%r9, %r8]
	.word 0xee020009  ! 1776: LDUW_R	lduw	[%r8 + %r9], %r23
	.word 0xc3ea2be8  ! 1776: PREFETCHA_I	prefetcha	[%r8, + 0x0be8] %asi, #one_read
	.word 0xc3220009  ! 1779: STF_R	st	%f1, [%r9, %r8]
	.word 0xf25a0009  ! 1779: LDX_R	ldx	[%r8 + %r9], %r25
	.word 0x22c20001  ! 1779: BRZ	brz,a,nt	%8,<label_0x20001>
	.word 0xc62a0009  ! 1782: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc64a0009  ! 1782: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0x04ca0001  ! 1782: BRLEZ	brlez  ,pt	%8,<label_0xa0001>
	.word 0xcc2a0009  ! 1785: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc4120009  ! 1785: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xc7220009  ! 1785: STF_R	st	%f3, [%r9, %r8]
	.word 0xce720009  ! 1788: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc2020009  ! 1788: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0x85a20929  ! 1788: FMULs	fmuls	%f8, %f9, %f2
	.word 0xca220009  ! 1791: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xce020009  ! 1791: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xccc22800  ! 1791: LDSWA_I	ldswa	[%r8, + 0x0800] %asi, %r6
	.word 0xc7220009  ! 1794: STF_R	st	%f3, [%r9, %r8]
	.word 0xc3020009  ! 1794: LDF_R	ld	[%r8, %r9], %f1
	.word 0xb4d20009  ! 1794: UMULcc_R	umulcc 	%r8, %r9, %r26
	.word 0xc2320009  ! 1797: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xcc4a0009  ! 1797: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xc2aa2514  ! 1797: STBA_I	stba	%r1, [%r8 + 0x0514] %asi
	.word 0xc6220009  ! 1800: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc4520009  ! 1800: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xc0ba28f8  ! 1800: STDA_I	stda	%r0, [%r8 + 0x08f8] %asi
	.word 0xcc320009  ! 1803: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xdd020009  ! 1803: LDF_R	ld	[%r8, %r9], %f14
	.word 0xc8da1009  ! 1803: LDXA_R	ldxa	[%r8, %r9] 0x80, %r4
	.word 0xcb3a0009  ! 1806: STDF_R	std	%f5, [%r9, %r8]
	.word 0xe6420009  ! 1806: LDSW_R	ldsw	[%r8 + %r9], %r19
	.word 0x1a800001  ! 1806: BCC	bcc  	<label_0x1>
	.word 0xce720009  ! 1809: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xfe120009  ! 1809: LDUH_R	lduh	[%r8 + %r9], %r31
	.word 0xa6da2118  ! 1809: SMULcc_I	smulcc 	%r8, 0x0118, %r19
	.word 0xc33a0009  ! 1812: STDF_R	std	%f1, [%r9, %r8]
	.word 0xdb1a0009  ! 1812: LDDF_R	ldd	[%r8, %r9], %f13
	.word 0x82f20009  ! 1812: UDIVcc_R	udivcc 	%r8, %r9, %r1
	.word 0xce320009  ! 1815: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc6120009  ! 1815: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0x22ca0001  ! 1815: BRZ	brz,a,pt	%8,<label_0xa0001>
	.word 0xea720009  ! 1818: STX_R	stx	%r21, [%r8 + %r9]
	.word 0xeb020009  ! 1818: LDF_R	ld	[%r8, %r9], %f21
	.word 0xcc821009  ! 1818: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r6
	.word 0xcc320009  ! 1821: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xfc0a0009  ! 1821: LDUB_R	ldub	[%r8 + %r9], %r30
	.word 0xa4520009  ! 1821: UMUL_R	umul 	%r8, %r9, %r18
	.word 0xfa220009  ! 1824: STW_R	stw	%r29, [%r8 + %r9]
	.word 0xc91a0009  ! 1824: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xc3ea1009  ! 1824: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xcd3a0009  ! 1827: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc2120009  ! 1827: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0x8143c000  ! 1827: STBAR	stbar
	.word 0xcc320009  ! 1830: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xd71a0009  ! 1830: LDDF_R	ldd	[%r8, %r9], %f11
	.word 0xcaca1009  ! 1830: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r5
	.word 0xe7220009  ! 1833: STF_R	st	%f19, [%r9, %r8]
	.word 0xcb1a0009  ! 1833: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0x2c800001  ! 1833: BNEG	bneg,a	<label_0x1>
	.word 0xf8720009  ! 1836: STX_R	stx	%r28, [%r8 + %r9]
	.word 0xd6520009  ! 1836: LDSH_R	ldsh	[%r8 + %r9], %r11
	.word 0xcafa1009  ! 1836: SWAPA_R	swapa	%r5, [%r8 + %r9] 0x80
	.word 0xc6720009  ! 1839: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc45a0009  ! 1839: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xc48a1009  ! 1839: LDUBA_R	lduba	[%r8, %r9] 0x80, %r2
	.word 0xc2720009  ! 1842: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc65a0009  ! 1842: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xe8ea2660  ! 1842: LDSTUBA_I	ldstuba	%r20, [%r8 + 0x0660] %asi
	.word 0xc8720009  ! 1845: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xe20a0009  ! 1845: LDUB_R	ldub	[%r8 + %r9], %r17
	.word 0xc4b21009  ! 1845: STHA_R	stha	%r2, [%r8 + %r9] 0x80
	.word 0xf6720009  ! 1848: STX_R	stx	%r27, [%r8 + %r9]
	.word 0xf9020009  ! 1848: LDF_R	ld	[%r8, %r9], %f28
	.word 0xfcea20b0  ! 1848: LDSTUBA_I	ldstuba	%r30, [%r8 + 0x00b0] %asi
	.word 0xc2720009  ! 1851: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xca020009  ! 1851: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xf4f22538  ! 1851: STXA_I	stxa	%r26, [%r8 + 0x0538] %asi
	.word 0xc42a0009  ! 1854: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc20a0009  ! 1854: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0x8143c000  ! 1854: STBAR	stbar
	.word 0xcb220009  ! 1857: STF_R	st	%f5, [%r9, %r8]
	.word 0xc7020009  ! 1857: LDF_R	ld	[%r8, %r9], %f3
	.word 0xccea1009  ! 1857: LDSTUBA_R	ldstuba	%r6, [%r8 + %r9] 0x80
	.word 0xc8320009  ! 1860: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xde4a0009  ! 1860: LDSB_R	ldsb	[%r8 + %r9], %r15
	.word 0xc36a0009  ! 1860: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc4320009  ! 1863: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xea0a0009  ! 1863: LDUB_R	ldub	[%r8 + %r9], %r21
	.word 0xfeda1009  ! 1863: LDXA_R	ldxa	[%r8, %r9] 0x80, %r31
	.word 0xe7220009  ! 1866: STF_R	st	%f19, [%r9, %r8]
	.word 0xcc420009  ! 1866: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0x26800001  ! 1866: BL	bl,a	<label_0x1>
	.word 0xc93a0009  ! 1869: STDF_R	std	%f4, [%r9, %r8]
	.word 0xc64a0009  ! 1869: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xccf21009  ! 1869: STXA_R	stxa	%r6, [%r8 + %r9] 0x80
	.word 0xf7220009  ! 1872: STF_R	st	%f27, [%r9, %r8]
	.word 0xed020009  ! 1872: LDF_R	ld	[%r8, %r9], %f22
	.word 0x87a209a9  ! 1872: FDIVs	fdivs	%f8, %f9, %f3
	.word 0xcb220009  ! 1875: STF_R	st	%f5, [%r9, %r8]
	.word 0xf2120009  ! 1875: LDUH_R	lduh	[%r8 + %r9], %r25
	.word 0xc2c21009  ! 1875: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r1
	.word 0xcf3a0009  ! 1878: STDF_R	std	%f7, [%r9, %r8]
	.word 0xf2420009  ! 1878: LDSW_R	ldsw	[%r8 + %r9], %r25
	.word 0xe6f21009  ! 1878: STXA_R	stxa	%r19, [%r8 + %r9] 0x80
	.word 0xf7220009  ! 1881: STF_R	st	%f27, [%r9, %r8]
	.word 0xfa520009  ! 1881: LDSH_R	ldsh	[%r8 + %r9], %r29
	.word 0xc36a0009  ! 1881: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xee720009  ! 1884: STX_R	stx	%r23, [%r8 + %r9]
	.word 0xda520009  ! 1884: LDSH_R	ldsh	[%r8 + %r9], %r13
	.word 0x8143e028  ! 1884: MEMBAR	membar	#StoreStore | #MemIssue 
	.word 0xe8220009  ! 1887: STW_R	stw	%r20, [%r8 + %r9]
	.word 0xce5a0009  ! 1887: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xcff21009  ! 1887: CASXA_I	casxa	[%r8] 0x80, %r9, %r7
	.word 0xc33a0009  ! 1890: STDF_R	std	%f1, [%r9, %r8]
	.word 0xce420009  ! 1890: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xeef21009  ! 1890: STXA_R	stxa	%r23, [%r8 + %r9] 0x80
	.word 0xc2320009  ! 1893: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xe0520009  ! 1893: LDSH_R	ldsh	[%r8 + %r9], %r16
	.word 0xcbf22009  ! 1893: CASXA_R	casxa	[%r8]%asi, %r9, %r5
	.word 0xee320009  ! 1896: STH_R	sth	%r23, [%r8 + %r9]
	.word 0xc8520009  ! 1896: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xf2ea280c  ! 1896: LDSTUBA_I	ldstuba	%r25, [%r8 + 0x080c] %asi
	.word 0xc3220009  ! 1899: STF_R	st	%f1, [%r9, %r8]
	.word 0xc80a0009  ! 1899: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0x8143c000  ! 1899: STBAR	stbar
	.word 0xc7220009  ! 1902: STF_R	st	%f3, [%r9, %r8]
	.word 0xcc420009  ! 1902: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0x8143e03b  ! 1902: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Lookaside | #MemIssue 
	.word 0xf9220009  ! 1905: STF_R	st	%f28, [%r9, %r8]
	.word 0xc2520009  ! 1905: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xc73a0009  ! 1905: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc53a0009  ! 1908: STDF_R	std	%f2, [%r9, %r8]
	.word 0xcc520009  ! 1908: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0x86522e68  ! 1908: UMUL_I	umul 	%r8, 0x0e68, %r3
	.word 0xdf220009  ! 1911: STF_R	st	%f15, [%r9, %r8]
	.word 0xe0020009  ! 1911: LDUW_R	lduw	[%r8 + %r9], %r16
	.word 0xc2922f14  ! 1911: LDUHA_I	lduha	[%r8, + 0x0f14] %asi, %r1
	.word 0xc5220009  ! 1914: STF_R	st	%f2, [%r9, %r8]
	.word 0xce120009  ! 1914: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xcbe22009  ! 1914: CASA_R	casa	[%r8] %asi, %r9, %r5
	.word 0xc8320009  ! 1917: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xcc520009  ! 1917: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0x8e4a2bd0  ! 1917: MULX_I	mulx 	%r8, 0x0bd0, %r7
	.word 0xc93a0009  ! 1920: STDF_R	std	%f4, [%r9, %r8]
	.word 0xc2520009  ! 1920: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0x865a2d38  ! 1920: SMUL_I	smul 	%r8, 0x0d38, %r3
	.word 0xc6220009  ! 1923: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc40a0009  ! 1923: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xca7a2358  ! 1923: SWAP_I	swap	%r5, [%r8 + 0x0358]
	.word 0xcf220009  ! 1926: STF_R	st	%f7, [%r9, %r8]
	.word 0xc65a0009  ! 1926: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0x2aca0001  ! 1926: BRNZ	brnz,a,pt	%8,<label_0xa0001>
	.word 0xc7220009  ! 1929: STF_R	st	%f3, [%r9, %r8]
	.word 0xc51a0009  ! 1929: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0x84520009  ! 1929: UMUL_R	umul 	%r8, %r9, %r2
	.word 0xc6720009  ! 1932: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xca420009  ! 1932: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xcbf21009  ! 1932: CASXA_I	casxa	[%r8] 0x80, %r9, %r5
	.word 0xcf220009  ! 1935: STF_R	st	%f7, [%r9, %r8]
	.word 0xc40a0009  ! 1935: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xc4a22384  ! 1935: STWA_I	stwa	%r2, [%r8 + 0x0384] %asi
	.word 0xfa2a0009  ! 1938: STB_R	stb	%r29, [%r8 + %r9]
	.word 0xca120009  ! 1938: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xcf220009  ! 1938: STF_R	st	%f7, [%r9, %r8]
	.word 0xdf220009  ! 1941: STF_R	st	%f15, [%r9, %r8]
	.word 0xca5a0009  ! 1941: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xc9f22009  ! 1941: CASXA_R	casxa	[%r8]%asi, %r9, %r4
	.word 0xc3220009  ! 1944: STF_R	st	%f1, [%r9, %r8]
	.word 0xdb1a0009  ! 1944: LDDF_R	ldd	[%r8, %r9], %f13
	.word 0xcc7a22a8  ! 1944: SWAP_I	swap	%r6, [%r8 + 0x02a8]
	.word 0xc82a0009  ! 1947: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xce020009  ! 1947: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xcb020009  ! 1947: LDF_R	ld	[%r8, %r9], %f5
	.word 0xc73a0009  ! 1950: STDF_R	std	%f3, [%r9, %r8]
	.word 0xcc520009  ! 1950: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xf8122fbc  ! 1950: LDUH_I	lduh	[%r8 + 0x0fbc], %r28
	.word 0xc62a0009  ! 1953: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xf5020009  ! 1953: LDF_R	ld	[%r8, %r9], %f26
	.word 0xe2922484  ! 1953: LDUHA_I	lduha	[%r8, + 0x0484] %asi, %r17
	.word 0xf62a0009  ! 1956: STB_R	stb	%r27, [%r8 + %r9]
	.word 0xc4420009  ! 1956: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0x8143e059  ! 1956: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside | #Sync 
	.word 0xcc320009  ! 1959: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xce5a0009  ! 1959: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xc66a29c0  ! 1959: LDSTUB_I	ldstub	%r3, [%r8 + 0x09c0]
	.word 0xcc220009  ! 1962: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xcd1a0009  ! 1962: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xc73a0009  ! 1962: STDF_R	std	%f3, [%r9, %r8]
	.word 0xcf3a0009  ! 1965: STDF_R	std	%f7, [%r9, %r8]
	.word 0xdc420009  ! 1965: LDSW_R	ldsw	[%r8 + %r9], %r14
	.word 0xceea20ec  ! 1965: LDSTUBA_I	ldstuba	%r7, [%r8 + 0x00ec] %asi
	.word 0xc62a0009  ! 1968: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xf8020009  ! 1968: LDUW_R	lduw	[%r8 + %r9], %r28
	.word 0xc6420009  ! 1968: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xca320009  ! 1971: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc8020009  ! 1971: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xc36a0009  ! 1971: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xce320009  ! 1974: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc6020009  ! 1974: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xc68a2738  ! 1974: LDUBA_I	lduba	[%r8, + 0x0738] %asi, %r3
	.word 0xf6220009  ! 1977: STW_R	stw	%r27, [%r8 + %r9]
	.word 0xcb020009  ! 1977: LDF_R	ld	[%r8, %r9], %f5
	.word 0xa87a0009  ! 1977: SDIV_R	sdiv 	%r8, %r9, %r20
	.word 0xc2320009  ! 1980: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xce420009  ! 1980: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xc3ea2c58  ! 1980: PREFETCHA_I	prefetcha	[%r8, + 0x0c58] %asi, #one_read
	.word 0xcc320009  ! 1983: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xce020009  ! 1983: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xdec22520  ! 1983: LDSWA_I	ldswa	[%r8, + 0x0520] %asi, %r15
	.word 0xc3220009  ! 1986: STF_R	st	%f1, [%r9, %r8]
	.word 0xc8520009  ! 1986: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xbcf20009  ! 1986: UDIVcc_R	udivcc 	%r8, %r9, %r30
	.word 0xce320009  ! 1989: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xf05a0009  ! 1989: LDX_R	ldx	[%r8 + %r9], %r24
	.word 0x8143e01a  ! 1989: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside 
	.word 0xc8720009  ! 1992: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xca020009  ! 1992: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0x40000001  ! 1992: CALL	call	disp30_1
	.word 0xde320009  ! 1995: STH_R	sth	%r15, [%r8 + %r9]
	.word 0xe64a0009  ! 1995: LDSB_R	ldsb	[%r8 + %r9], %r19
	.word 0xeeea267c  ! 1995: LDSTUBA_I	ldstuba	%r23, [%r8 + 0x067c] %asi
	.word 0xef3a0009  ! 1998: STDF_R	std	%f23, [%r9, %r8]
	.word 0xc4420009  ! 1998: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xc3ea29a4  ! 1998: PREFETCHA_I	prefetcha	[%r8, + 0x09a4] %asi, #one_read
	.word 0xce2a0009  ! 2001: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xdf1a0009  ! 2001: LDDF_R	ldd	[%r8, %r9], %f15
	.word 0x8143e004  ! 2001: MEMBAR	membar	#LoadStore 
	.word 0xdf3a0009  ! 2004: STDF_R	std	%f15, [%r9, %r8]
	.word 0xd85a0009  ! 2004: LDX_R	ldx	[%r8 + %r9], %r12
	.word 0x86d22624  ! 2004: UMULcc_I	umulcc 	%r8, 0x0624, %r3
	.word 0xe2720009  ! 2007: STX_R	stx	%r17, [%r8 + %r9]
	.word 0xc9020009  ! 2007: LDF_R	ld	[%r8, %r9], %f4
	.word 0x84fa0009  ! 2007: SDIVcc_R	sdivcc 	%r8, %r9, %r2
	.word 0xc33a0009  ! 2010: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc4020009  ! 2010: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xe4da2930  ! 2010: LDXA_I	ldxa	[%r8, + 0x0930] %asi, %r18
	.word 0xe8220009  ! 2013: STW_R	stw	%r20, [%r8 + %r9]
	.word 0xc71a0009  ! 2013: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0x89a20929  ! 2013: FMULs	fmuls	%f8, %f9, %f4
	.word 0xf13a0009  ! 2016: STDF_R	std	%f24, [%r9, %r8]
	.word 0xc4120009  ! 2016: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0x2cca0001  ! 2016: BRGZ	brgz,a,pt	%8,<label_0xa0001>
	.word 0xc33a0009  ! 2019: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc40a0009  ! 2019: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xc71a23f0  ! 2019: LDDF_I	ldd	[%r8, 0x03f0], %f3
	.word 0xc6320009  ! 2022: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xe4420009  ! 2022: LDSW_R	ldsw	[%r8 + %r9], %r18
	.word 0xc4822268  ! 2022: LDUWA_I	lduwa	[%r8, + 0x0268] %asi, %r2
	.word 0xd62a0009  ! 2025: STB_R	stb	%r11, [%r8 + %r9]
	.word 0xf91a0009  ! 2025: LDDF_R	ldd	[%r8, %r9], %f28
	.word 0xc8fa1009  ! 2025: SWAPA_R	swapa	%r4, [%r8 + %r9] 0x80
	.word 0xc4220009  ! 2028: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xdc420009  ! 2028: LDSW_R	ldsw	[%r8 + %r9], %r14
	.word 0xe8da1009  ! 2028: LDXA_R	ldxa	[%r8, %r9] 0x80, %r20
	.word 0xf0320009  ! 2031: STH_R	sth	%r24, [%r8 + %r9]
	.word 0xee020009  ! 2031: LDUW_R	lduw	[%r8 + %r9], %r23
	.word 0xc4d22b00  ! 2031: LDSHA_I	ldsha	[%r8, + 0x0b00] %asi, %r2
	.word 0xf6220009  ! 2034: STW_R	stw	%r27, [%r8 + %r9]
	.word 0xc60a0009  ! 2034: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0x8143c000  ! 2034: STBAR	stbar
	.word 0xe4320009  ! 2037: STH_R	sth	%r18, [%r8 + %r9]
	.word 0xc4420009  ! 2037: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xc4120009  ! 2037: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xd82a0009  ! 2040: STB_R	stb	%r12, [%r8 + %r9]
	.word 0xd8120009  ! 2040: LDUH_R	lduh	[%r8 + %r9], %r12
	.word 0xcafa2500  ! 2040: SWAPA_I	swapa	%r5, [%r8 + 0x0500] %asi
	.word 0xc2720009  ! 2043: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc3020009  ! 2043: LDF_R	ld	[%r8, %r9], %f1
	.word 0xc3ea2cbc  ! 2043: PREFETCHA_I	prefetcha	[%r8, + 0x0cbc] %asi, #one_read
	.word 0xeb220009  ! 2046: STF_R	st	%f21, [%r9, %r8]
	.word 0xc8120009  ! 2046: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xccd22324  ! 2046: LDSHA_I	ldsha	[%r8, + 0x0324] %asi, %r6
	.word 0xc33a0009  ! 2049: STDF_R	std	%f1, [%r9, %r8]
	.word 0xcb020009  ! 2049: LDF_R	ld	[%r8, %r9], %f5
	.word 0xcc922008  ! 2049: LDUHA_I	lduha	[%r8, + 0x0008] %asi, %r6
	.word 0xce220009  ! 2052: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xf11a0009  ! 2052: LDDF_R	ldd	[%r8, %r9], %f24
	.word 0xce8a21b8  ! 2052: LDUBA_I	lduba	[%r8, + 0x01b8] %asi, %r7
	.word 0xc8720009  ! 2055: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc85a0009  ! 2055: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xe0aa1009  ! 2055: STBA_R	stba	%r16, [%r8 + %r9] 0x80
	.word 0xf8220009  ! 2058: STW_R	stw	%r28, [%r8 + %r9]
	.word 0xdc020009  ! 2058: LDUW_R	lduw	[%r8 + %r9], %r14
	.word 0xca7a0009  ! 2058: SWAP_R	swap	%r5, [%r8 + %r9]
	.word 0xc4720009  ! 2061: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xcc5a0009  ! 2061: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xca6a0009  ! 2061: LDSTUB_R	ldstub	%r5, [%r8 + %r9]
	.word 0xc6220009  ! 2064: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xe3020009  ! 2064: LDF_R	ld	[%r8, %r9], %f17
	.word 0xce522524  ! 2064: LDSH_I	ldsh	[%r8 + 0x0524], %r7
	.word 0xf62a0009  ! 2067: STB_R	stb	%r27, [%r8 + %r9]
	.word 0xfa5a0009  ! 2067: LDX_R	ldx	[%r8 + %r9], %r29
	.word 0x8da20929  ! 2067: FMULs	fmuls	%f8, %f9, %f6
	.word 0xee220009  ! 2070: STW_R	stw	%r23, [%r8 + %r9]
	.word 0xcc520009  ! 2070: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xcdf22009  ! 2070: CASXA_R	casxa	[%r8]%asi, %r9, %r6
	.word 0xc82a0009  ! 2073: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xcc4a0009  ! 2073: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xce122a7c  ! 2073: LDUH_I	lduh	[%r8 + 0x0a7c], %r7
	.word 0xce720009  ! 2076: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc71a0009  ! 2076: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xc6fa2bb0  ! 2076: SWAPA_I	swapa	%r3, [%r8 + 0x0bb0] %asi
	.word 0xca220009  ! 2079: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xe20a0009  ! 2079: LDUB_R	ldub	[%r8 + %r9], %r17
	.word 0xc4b22e1c  ! 2079: STHA_I	stha	%r2, [%r8 + 0x0e1c] %asi
	.word 0xce720009  ! 2082: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xdf020009  ! 2082: LDF_R	ld	[%r8, %r9], %f15
	.word 0xc402299c  ! 2082: LDUW_I	lduw	[%r8 + 0x099c], %r2
	.word 0xf82a0009  ! 2085: STB_R	stb	%r28, [%r8 + %r9]
	.word 0xce020009  ! 2085: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xceb21009  ! 2085: STHA_R	stha	%r7, [%r8 + %r9] 0x80
	.word 0xc9220009  ! 2088: STF_R	st	%f4, [%r9, %r8]
	.word 0xc45a0009  ! 2088: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0x8143e02b  ! 2088: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #MemIssue 
	.word 0xf8320009  ! 2091: STH_R	sth	%r28, [%r8 + %r9]
	.word 0xec4a0009  ! 2091: LDSB_R	ldsb	[%r8 + %r9], %r22
	.word 0xf81a2038  ! 2091: LDD_I	ldd	[%r8 + 0x0038], %r28
	.word 0xd93a0009  ! 2094: STDF_R	std	%f12, [%r9, %r8]
	.word 0xe51a0009  ! 2094: LDDF_R	ldd	[%r8, %r9], %f18
	.word 0x00800001  ! 2094: BN	bn  	<label_0x1>
	.word 0xcf3a0009  ! 2097: STDF_R	std	%f7, [%r9, %r8]
	.word 0xca5a0009  ! 2097: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0x884a0009  ! 2097: MULX_R	mulx 	%r8, %r9, %r4
	.word 0xff3a0009  ! 2100: STDF_R	std	%f31, [%r9, %r8]
	.word 0xec4a0009  ! 2100: LDSB_R	ldsb	[%r8 + %r9], %r22
	.word 0xdf3a2e88  ! 2100: STDF_I	std	%f15, [0x0e88, %r8]
	.word 0xfc2a0009  ! 2103: STB_R	stb	%r30, [%r8 + %r9]
	.word 0xc84a0009  ! 2103: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xdc6a2f70  ! 2103: LDSTUB_I	ldstub	%r14, [%r8 + 0x0f70]
	.word 0xfe220009  ! 2106: STW_R	stw	%r31, [%r8 + %r9]
	.word 0xce120009  ! 2106: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xa96a0009  ! 2106: SDIVX_R	sdivx	%r8, %r9, %r20
	.word 0xcd220009  ! 2109: STF_R	st	%f6, [%r9, %r8]
	.word 0xc4120009  ! 2109: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xccb2236c  ! 2109: STHA_I	stha	%r6, [%r8 + 0x036c] %asi
	.word 0xdc2a0009  ! 2112: STB_R	stb	%r14, [%r8 + %r9]
	.word 0xc6420009  ! 2112: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xecfa1009  ! 2112: SWAPA_R	swapa	%r22, [%r8 + %r9] 0x80
	.word 0xc4220009  ! 2115: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xd85a0009  ! 2115: LDX_R	ldx	[%r8 + %r9], %r12
	.word 0xfaca1009  ! 2115: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r29
	.word 0xcc2a0009  ! 2118: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc40a0009  ! 2118: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xfeda1009  ! 2118: LDXA_R	ldxa	[%r8, %r9] 0x80, %r31
	.word 0xcf220009  ! 2121: STF_R	st	%f7, [%r9, %r8]
	.word 0xe6020009  ! 2121: LDUW_R	lduw	[%r8 + %r9], %r19
	.word 0x8143e00e  ! 2121: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore 
	.word 0xce220009  ! 2124: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc8520009  ! 2124: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xc3e22009  ! 2124: CASA_R	casa	[%r8] %asi, %r9, %r1
	.word 0xfd3a0009  ! 2127: STDF_R	std	%f30, [%r9, %r8]
	.word 0xc2120009  ! 2127: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xf2b223f0  ! 2127: STHA_I	stha	%r25, [%r8 + 0x03f0] %asi
	.word 0xc53a0009  ! 2130: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc84a0009  ! 2130: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xd4ba2388  ! 2130: STDA_I	stda	%r10, [%r8 + 0x0388] %asi
	.word 0xc5220009  ! 2133: STF_R	st	%f2, [%r9, %r8]
	.word 0xda420009  ! 2133: LDSW_R	ldsw	[%r8 + %r9], %r13
	.word 0x89a209a9  ! 2133: FDIVs	fdivs	%f8, %f9, %f4
	.word 0xfe320009  ! 2136: STH_R	sth	%r31, [%r8 + %r9]
	.word 0xe05a0009  ! 2136: LDX_R	ldx	[%r8 + %r9], %r16
	.word 0x8da209a9  ! 2136: FDIVs	fdivs	%f8, %f9, %f6
	.word 0xda720009  ! 2139: STX_R	stx	%r13, [%r8 + %r9]
	.word 0xc9020009  ! 2139: LDF_R	ld	[%r8, %r9], %f4
	.word 0x8472273c  ! 2139: UDIV_I	udiv 	%r8, 0x073c, %r2
	.word 0xc6720009  ! 2142: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xca420009  ! 2142: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xeea21009  ! 2142: STWA_R	stwa	%r23, [%r8 + %r9] 0x80
	.word 0xcd3a0009  ! 2145: STDF_R	std	%f6, [%r9, %r8]
	.word 0xce120009  ! 2145: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0x83a20829  ! 2145: FADDs	fadds	%f8, %f9, %f1
	.word 0xe82a0009  ! 2148: STB_R	stb	%r20, [%r8 + %r9]
	.word 0xe11a0009  ! 2148: LDDF_R	ldd	[%r8, %r9], %f16
	.word 0xcd2221b4  ! 2148: STF_I	st	%f6, [0x01b4, %r8]
	.word 0xc4220009  ! 2151: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xca120009  ! 2151: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xad222354  ! 2151: MULScc_I	mulscc 	%r8, 0x0354, %r22
	.word 0xec720009  ! 2154: STX_R	stx	%r22, [%r8 + %r9]
	.word 0xc51a0009  ! 2154: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0x0cca0001  ! 2154: BRGZ	brgz  ,pt	%8,<label_0xa0001>
	.word 0xc6320009  ! 2157: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc85a0009  ! 2157: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0x82d225a0  ! 2157: UMULcc_I	umulcc 	%r8, 0x05a0, %r1
	.word 0xce320009  ! 2160: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xd71a0009  ! 2160: LDDF_R	ldd	[%r8, %r9], %f11
	.word 0xf89a2ba8  ! 2160: LDDA_I	ldda	[%r8, + 0x0ba8] %asi, %r28
	.word 0xc82a0009  ! 2163: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xce5a0009  ! 2163: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xc36a0009  ! 2163: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xef3a0009  ! 2166: STDF_R	std	%f23, [%r9, %r8]
	.word 0xc6520009  ! 2166: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xc3ea1009  ! 2166: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xcc2a0009  ! 2169: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc80a0009  ! 2169: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xc3ea1009  ! 2169: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xce220009  ! 2172: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xce4a0009  ! 2172: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xeb2223cc  ! 2172: STF_I	st	%f21, [0x03cc, %r8]
	.word 0xe1220009  ! 2175: STF_R	st	%f16, [%r9, %r8]
	.word 0xf6520009  ! 2175: LDSH_R	ldsh	[%r8 + %r9], %r27
	.word 0x83a209a9  ! 2175: FDIVs	fdivs	%f8, %f9, %f1
	.word 0xcd220009  ! 2178: STF_R	st	%f6, [%r9, %r8]
	.word 0xfc5a0009  ! 2178: LDX_R	ldx	[%r8 + %r9], %r30
	.word 0xcb1a24e8  ! 2178: LDDF_I	ldd	[%r8, 0x04e8], %f5
	.word 0xdb3a0009  ! 2181: STDF_R	std	%f13, [%r9, %r8]
	.word 0xce420009  ! 2181: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xc3ea1009  ! 2181: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xf2720009  ! 2184: STX_R	stx	%r25, [%r8 + %r9]
	.word 0xc40a0009  ! 2184: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0x8a5a0009  ! 2184: SMUL_R	smul 	%r8, %r9, %r5
	.word 0xc2220009  ! 2187: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc45a0009  ! 2187: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xc85a0009  ! 2187: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xc5220009  ! 2190: STF_R	st	%f2, [%r9, %r8]
	.word 0xc3020009  ! 2190: LDF_R	ld	[%r8, %r9], %f1
	.word 0x85a209a9  ! 2190: FDIVs	fdivs	%f8, %f9, %f2
	.word 0xc93a0009  ! 2193: STDF_R	std	%f4, [%r9, %r8]
	.word 0xc6420009  ! 2193: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0x896a0009  ! 2193: SDIVX_R	sdivx	%r8, %r9, %r4
	.word 0xc62a0009  ! 2196: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xe85a0009  ! 2196: LDX_R	ldx	[%r8 + %r9], %r20
	.word 0xd4ba1009  ! 2196: STDA_R	stda	%r10, [%r8 + %r9] 0x80
	.word 0xe62a0009  ! 2199: STB_R	stb	%r19, [%r8 + %r9]
	.word 0xe4020009  ! 2199: LDUW_R	lduw	[%r8 + %r9], %r18
	.word 0x1a800002  ! 2199: BCC	bcc  	<label_0x2>
	.word 0xc73a0009  ! 2202: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc7020009  ! 2202: LDF_R	ld	[%r8, %r9], %f3
	.word 0x8143c000  ! 2202: STBAR	stbar
	.word 0xc8720009  ! 2205: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xf71a0009  ! 2205: LDDF_R	ldd	[%r8, %r9], %f27
	.word 0x1c800002  ! 2205: BPOS	bpos  	<label_0x2>
	.word 0xcf3a0009  ! 2208: STDF_R	std	%f7, [%r9, %r8]
	.word 0xf4120009  ! 2208: LDUH_R	lduh	[%r8 + %r9], %r26
	.word 0xac6a0009  ! 2208: UDIVX_R	udivx 	%r8, %r9, %r22
	.word 0xcb3a0009  ! 2211: STDF_R	std	%f5, [%r9, %r8]
	.word 0xd6020009  ! 2211: LDUW_R	lduw	[%r8 + %r9], %r11
	.word 0xc66a0009  ! 2211: LDSTUB_R	ldstub	%r3, [%r8 + %r9]
	.word 0xcf3a0009  ! 2214: STDF_R	std	%f7, [%r9, %r8]
	.word 0xce4a0009  ! 2214: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xbc5a2338  ! 2214: SMUL_I	smul 	%r8, 0x0338, %r30
	.word 0xcb3a0009  ! 2217: STDF_R	std	%f5, [%r9, %r8]
	.word 0xde0a0009  ! 2217: LDUB_R	ldub	[%r8 + %r9], %r15
	.word 0xc36a204c  ! 2217: PREFETCH_I	prefetch	[%r8 + 0x004c], #one_read
	.word 0xcb3a0009  ! 2220: STDF_R	std	%f5, [%r9, %r8]
	.word 0xdc120009  ! 2220: LDUH_R	lduh	[%r8 + %r9], %r14
	.word 0x2c800001  ! 2220: BNEG	bneg,a	<label_0x1>
	.word 0xca2a0009  ! 2223: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc25a0009  ! 2223: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xc3ea2e34  ! 2223: PREFETCHA_I	prefetcha	[%r8, + 0x0e34] %asi, #one_read
	.word 0xf0720009  ! 2226: STX_R	stx	%r24, [%r8 + %r9]
	.word 0xe9020009  ! 2226: LDF_R	ld	[%r8, %r9], %f20
	.word 0xc3ea285c  ! 2226: PREFETCHA_I	prefetcha	[%r8, + 0x085c] %asi, #one_read
	.word 0xfd3a0009  ! 2229: STDF_R	std	%f30, [%r9, %r8]
	.word 0xc91a0009  ! 2229: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xd41a2e68  ! 2229: LDD_I	ldd	[%r8 + 0x0e68], %r10
	.word 0xc53a0009  ! 2232: STDF_R	std	%f2, [%r9, %r8]
	.word 0xea5a0009  ! 2232: LDX_R	ldx	[%r8 + %r9], %r21
	.word 0x86720009  ! 2232: UDIV_R	udiv 	%r8, %r9, %r3
	.word 0xcc220009  ! 2235: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xe44a0009  ! 2235: LDSB_R	ldsb	[%r8 + %r9], %r18
	.word 0xc4c21009  ! 2235: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r2
	.word 0xee2a0009  ! 2238: STB_R	stb	%r23, [%r8 + %r9]
	.word 0xda5a0009  ! 2238: LDX_R	ldx	[%r8 + %r9], %r13
	.word 0xc4020009  ! 2238: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xc4320009  ! 2241: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc2120009  ! 2241: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xc4ba1009  ! 2241: STDA_R	stda	%r2, [%r8 + %r9] 0x80
	.word 0xde2a0009  ! 2244: STB_R	stb	%r15, [%r8 + %r9]
	.word 0xf2120009  ! 2244: LDUH_R	lduh	[%r8 + %r9], %r25
	.word 0xe8520009  ! 2244: LDSH_R	ldsh	[%r8 + %r9], %r20
	.word 0xc4320009  ! 2247: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc84a0009  ! 2247: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xd6aa1009  ! 2247: STBA_R	stba	%r11, [%r8 + %r9] 0x80
	.word 0xf4220009  ! 2250: STW_R	stw	%r26, [%r8 + %r9]
	.word 0xcc120009  ! 2250: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xc36a2794  ! 2250: PREFETCH_I	prefetch	[%r8 + 0x0794], #one_read
	.word 0xc6320009  ! 2253: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xcf020009  ! 2253: LDF_R	ld	[%r8, %r9], %f7
	.word 0x84da2de4  ! 2253: SMULcc_I	smulcc 	%r8, 0x0de4, %r2
	.word 0xcd3a0009  ! 2256: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc6520009  ! 2256: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xce921009  ! 2256: LDUHA_R	lduha	[%r8, %r9] 0x80, %r7
	.word 0xe93a0009  ! 2259: STDF_R	std	%f20, [%r9, %r8]
	.word 0xc9020009  ! 2259: LDF_R	ld	[%r8, %r9], %f4
	.word 0xc4f21009  ! 2259: STXA_R	stxa	%r2, [%r8 + %r9] 0x80
	.word 0xce720009  ! 2262: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xfa020009  ! 2262: LDUW_R	lduw	[%r8 + %r9], %r29
	.word 0x82520009  ! 2262: UMUL_R	umul 	%r8, %r9, %r1
	.word 0xc4720009  ! 2265: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc8120009  ! 2265: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0x22800002  ! 2265: BE	be,a	<label_0x2>
	.word 0xce220009  ! 2268: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc71a0009  ! 2268: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xdef21009  ! 2268: STXA_R	stxa	%r15, [%r8 + %r9] 0x80
	.word 0xcb3a0009  ! 2271: STDF_R	std	%f5, [%r9, %r8]
	.word 0xff020009  ! 2271: LDF_R	ld	[%r8, %r9], %f31
	.word 0xc2fa2998  ! 2271: SWAPA_I	swapa	%r1, [%r8 + 0x0998] %asi
	.word 0xcb3a0009  ! 2274: STDF_R	std	%f5, [%r9, %r8]
	.word 0xde120009  ! 2274: LDUH_R	lduh	[%r8 + %r9], %r15
	.word 0xc36a0009  ! 2274: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc62a0009  ! 2277: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc45a0009  ! 2277: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0x8a522bac  ! 2277: UMUL_I	umul 	%r8, 0x0bac, %r5
	.word 0xdb220009  ! 2280: STF_R	st	%f13, [%r9, %r8]
	.word 0xd65a0009  ! 2280: LDX_R	ldx	[%r8 + %r9], %r11
	.word 0x8e52251c  ! 2280: UMUL_I	umul 	%r8, 0x051c, %r7
	.word 0xca720009  ! 2283: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc2120009  ! 2283: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xc89a2658  ! 2283: LDDA_I	ldda	[%r8, + 0x0658] %asi, %r4
	.word 0xca220009  ! 2286: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc64a0009  ! 2286: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0x8143c000  ! 2286: STBAR	stbar
	.word 0xe73a0009  ! 2289: STDF_R	std	%f19, [%r9, %r8]
	.word 0xfe5a0009  ! 2289: LDX_R	ldx	[%r8 + %r9], %r31
	.word 0xc3ea233c  ! 2289: PREFETCHA_I	prefetcha	[%r8, + 0x033c] %asi, #one_read
	.word 0xc4320009  ! 2292: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xd80a0009  ! 2292: LDUB_R	ldub	[%r8 + %r9], %r12
	.word 0xff222e1c  ! 2292: STF_I	st	%f31, [0x0e1c, %r8]
	.word 0xca220009  ! 2295: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xf4420009  ! 2295: LDSW_R	ldsw	[%r8 + %r9], %r26
	.word 0x8da208a9  ! 2295: FSUBs	fsubs	%f8, %f9, %f6
	.word 0xce720009  ! 2298: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xf2420009  ! 2298: LDSW_R	ldsw	[%r8 + %r9], %r25
	.word 0x85220009  ! 2298: MULScc_R	mulscc 	%r8, %r9, %r2
	.word 0xc4220009  ! 2301: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc84a0009  ! 2301: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xc86a2400  ! 2301: LDSTUB_I	ldstub	%r4, [%r8 + 0x0400]
	.word 0xcf3a0009  ! 2304: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc2420009  ! 2304: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xc3ea1009  ! 2304: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xcc220009  ! 2307: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xcc520009  ! 2307: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xc5220009  ! 2307: STF_R	st	%f2, [%r9, %r8]
	.word 0xc9220009  ! 2310: STF_R	st	%f4, [%r9, %r8]
	.word 0xdc020009  ! 2310: LDUW_R	lduw	[%r8 + %r9], %r14
	.word 0x28800002  ! 2310: BLEU	bleu,a	<label_0x2>
	.word 0xcc2a0009  ! 2313: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xcc0a0009  ! 2313: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xeab21009  ! 2313: STHA_R	stha	%r21, [%r8 + %r9] 0x80
	.word 0xc42a0009  ! 2316: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xf05a0009  ! 2316: LDX_R	ldx	[%r8 + %r9], %r24
	.word 0x2a800002  ! 2316: BCS	bcs,a	<label_0x2>
	.word 0xf13a0009  ! 2319: STDF_R	std	%f24, [%r9, %r8]
	.word 0xc80a0009  ! 2319: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0x20800001  ! 2319: BN	bn,a	<label_0x1>
	.word 0xf5220009  ! 2322: STF_R	st	%f26, [%r9, %r8]
	.word 0xc64a0009  ! 2322: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0x9fa209a9  ! 2322: FDIVs	fdivs	%f8, %f9, %f15
	.word 0xc2220009  ! 2325: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xd8020009  ! 2325: LDUW_R	lduw	[%r8 + %r9], %r12
	.word 0x8143e047  ! 2325: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Sync 
	.word 0xc22a0009  ! 2328: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc8020009  ! 2328: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xcfe22009  ! 2328: CASA_R	casa	[%r8] %asi, %r9, %r7
	.word 0xd62a0009  ! 2331: STB_R	stb	%r11, [%r8 + %r9]
	.word 0xde520009  ! 2331: LDSH_R	ldsh	[%r8 + %r9], %r15
	.word 0xc36a0009  ! 2331: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xce320009  ! 2334: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc8520009  ! 2334: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0x8da20829  ! 2334: FADDs	fadds	%f8, %f9, %f6
	.word 0xc93a0009  ! 2337: STDF_R	std	%f4, [%r9, %r8]
	.word 0xcc520009  ! 2337: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0x83222c64  ! 2337: MULScc_I	mulscc 	%r8, 0x0c64, %r1
	.word 0xc4220009  ! 2340: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xce120009  ! 2340: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xc36a2e70  ! 2340: PREFETCH_I	prefetch	[%r8 + 0x0e70], #one_read
	.word 0xcf220009  ! 2343: STF_R	st	%f7, [%r9, %r8]
	.word 0xc91a0009  ! 2343: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0x40000002  ! 2343: CALL	call	disp30_2
	.word 0xf6320009  ! 2346: STH_R	sth	%r27, [%r8 + %r9]
	.word 0xc6420009  ! 2346: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xc48228a0  ! 2346: LDUWA_I	lduwa	[%r8, + 0x08a0] %asi, %r2
	.word 0xc2720009  ! 2349: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xca5a0009  ! 2349: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0x8143e062  ! 2349: MEMBAR	membar	#StoreLoad | #MemIssue | #Sync 
	.word 0xfe320009  ! 2352: STH_R	sth	%r31, [%r8 + %r9]
	.word 0xc2520009  ! 2352: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xc9e22009  ! 2352: CASA_R	casa	[%r8] %asi, %r9, %r4
	.word 0xcc2a0009  ! 2355: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc6520009  ! 2355: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xb27a0009  ! 2355: SDIV_R	sdiv 	%r8, %r9, %r25
	.word 0xfb3a0009  ! 2358: STDF_R	std	%f29, [%r9, %r8]
	.word 0xc8020009  ! 2358: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xcf3a0009  ! 2358: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc7220009  ! 2361: STF_R	st	%f3, [%r9, %r8]
	.word 0xd71a0009  ! 2361: LDDF_R	ldd	[%r8, %r9], %f11
	.word 0xc6022a04  ! 2361: LDUW_I	lduw	[%r8 + 0x0a04], %r3
	.word 0xce320009  ! 2364: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc45a0009  ! 2364: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xcdf21009  ! 2364: CASXA_I	casxa	[%r8] 0x80, %r9, %r6
	.word 0xe22a0009  ! 2367: STB_R	stb	%r17, [%r8 + %r9]
	.word 0xe40a0009  ! 2367: LDUB_R	ldub	[%r8 + %r9], %r18
	.word 0x88d20009  ! 2367: UMULcc_R	umulcc 	%r8, %r9, %r4
	.word 0xc8220009  ! 2370: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc80a0009  ! 2370: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xa67a2c74  ! 2370: SDIV_I	sdiv 	%r8, 0x0c74, %r19
	.word 0xcf220009  ! 2373: STF_R	st	%f7, [%r9, %r8]
	.word 0xc8420009  ! 2373: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0x8eda0009  ! 2373: SMULcc_R	smulcc 	%r8, %r9, %r7
	.word 0xe4720009  ! 2376: STX_R	stx	%r18, [%r8 + %r9]
	.word 0xec5a0009  ! 2376: LDX_R	ldx	[%r8 + %r9], %r22
	.word 0x8143e014  ! 2376: MEMBAR	membar	#LoadStore | #Lookaside 
	.word 0xc6220009  ! 2379: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc7020009  ! 2379: LDF_R	ld	[%r8, %r9], %f3
	.word 0x1e800001  ! 2379: BVC	bvc  	<label_0x1>
	.word 0xcc720009  ! 2382: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xcc0a0009  ! 2382: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xf0821009  ! 2382: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r24
	.word 0xf62a0009  ! 2385: STB_R	stb	%r27, [%r8 + %r9]
	.word 0xcf020009  ! 2385: LDF_R	ld	[%r8, %r9], %f7
	.word 0xce7a0009  ! 2385: SWAP_R	swap	%r7, [%r8 + %r9]
	.word 0xc2720009  ! 2388: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc64a0009  ! 2388: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0x8143e027  ! 2388: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #MemIssue 
	.word 0xc8720009  ! 2391: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xcd1a0009  ! 2391: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xc3ea1009  ! 2391: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xca220009  ! 2394: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc6420009  ! 2394: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0x18800001  ! 2394: BGU	bgu  	<label_0x1>
	.word 0xca220009  ! 2397: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xe71a0009  ! 2397: LDDF_R	ldd	[%r8, %r9], %f19
	.word 0xc36a2284  ! 2397: PREFETCH_I	prefetch	[%r8 + 0x0284], #one_read
	.word 0xd6320009  ! 2400: STH_R	sth	%r11, [%r8 + %r9]
	.word 0xfe520009  ! 2400: LDSH_R	ldsh	[%r8 + %r9], %r31
	.word 0xc3ea24a0  ! 2400: PREFETCHA_I	prefetcha	[%r8, + 0x04a0] %asi, #one_read
	.word 0xda2a0009  ! 2403: STB_R	stb	%r13, [%r8 + %r9]
	.word 0xc84a0009  ! 2403: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xc3ea2218  ! 2403: PREFETCHA_I	prefetcha	[%r8, + 0x0218] %asi, #one_read
	.word 0xf0720009  ! 2406: STX_R	stx	%r24, [%r8 + %r9]
	.word 0xc6120009  ! 2406: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xf13a2028  ! 2406: STDF_I	std	%f24, [0x0028, %r8]
	.word 0xee220009  ! 2409: STW_R	stw	%r23, [%r8 + %r9]
	.word 0xea420009  ! 2409: LDSW_R	ldsw	[%r8 + %r9], %r21
	.word 0xc36a0009  ! 2409: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xdc720009  ! 2412: STX_R	stx	%r14, [%r8 + %r9]
	.word 0xe24a0009  ! 2412: LDSB_R	ldsb	[%r8 + %r9], %r17
	.word 0xeeda2400  ! 2412: LDXA_I	ldxa	[%r8, + 0x0400] %asi, %r23
	.word 0xcb220009  ! 2415: STF_R	st	%f5, [%r9, %r8]
	.word 0xcc420009  ! 2415: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xf4fa2dc0  ! 2415: SWAPA_I	swapa	%r26, [%r8 + 0x0dc0] %asi
	.word 0xce320009  ! 2418: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc3020009  ! 2418: LDF_R	ld	[%r8, %r9], %f1
	.word 0xc89a29b8  ! 2418: LDDA_I	ldda	[%r8, + 0x09b8] %asi, %r4
	.word 0xd82a0009  ! 2421: STB_R	stb	%r12, [%r8 + %r9]
	.word 0xe0120009  ! 2421: LDUH_R	lduh	[%r8 + %r9], %r16
	.word 0x1e800001  ! 2421: BVC	bvc  	<label_0x1>
	.word 0xf2220009  ! 2424: STW_R	stw	%r25, [%r8 + %r9]
	.word 0xc2520009  ! 2424: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xc48a1009  ! 2424: LDUBA_R	lduba	[%r8, %r9] 0x80, %r2
	.word 0xce2a0009  ! 2427: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xe8520009  ! 2427: LDSH_R	ldsh	[%r8 + %r9], %r20
	.word 0x0a800001  ! 2427: BCS	bcs  	<label_0x1>
	.word 0xda720009  ! 2430: STX_R	stx	%r13, [%r8 + %r9]
	.word 0xc80a0009  ! 2430: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xc3ea1009  ! 2430: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc2320009  ! 2433: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc24a0009  ! 2433: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0x8143e050  ! 2433: MEMBAR	membar	#Lookaside | #Sync 
	.word 0xcf220009  ! 2436: STF_R	st	%f7, [%r9, %r8]
	.word 0xc2520009  ! 2436: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xeaaa2ea8  ! 2436: STBA_I	stba	%r21, [%r8 + 0x0ea8] %asi
	.word 0xfa720009  ! 2439: STX_R	stx	%r29, [%r8 + %r9]
	.word 0xc31a0009  ! 2439: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xc3ea29f8  ! 2439: PREFETCHA_I	prefetcha	[%r8, + 0x09f8] %asi, #one_read
	.word 0xcc320009  ! 2442: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xcd1a0009  ! 2442: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0x06c20001  ! 2442: BRLZ	brlz  ,nt	%8,<label_0x20001>
	.word 0xd6320009  ! 2445: STH_R	sth	%r11, [%r8 + %r9]
	.word 0xfc0a0009  ! 2445: LDUB_R	ldub	[%r8 + %r9], %r30
	.word 0xef1a0009  ! 2445: LDDF_R	ldd	[%r8, %r9], %f23
	.word 0xc6320009  ! 2448: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xce0a0009  ! 2448: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xfaa22b4c  ! 2448: STWA_I	stwa	%r29, [%r8 + 0x0b4c] %asi
	.word 0xcc220009  ! 2451: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xce020009  ! 2451: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0x82520009  ! 2451: UMUL_R	umul 	%r8, %r9, %r1
	.word 0xce2a0009  ! 2454: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xf2120009  ! 2454: LDUH_R	lduh	[%r8 + %r9], %r25
	.word 0xeb3a0009  ! 2454: STDF_R	std	%f21, [%r9, %r8]
	.word 0xf6720009  ! 2457: STX_R	stx	%r27, [%r8 + %r9]
	.word 0xca0a0009  ! 2457: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xe49a2628  ! 2457: LDDA_I	ldda	[%r8, + 0x0628] %asi, %r18
	.word 0xe6320009  ! 2460: STH_R	sth	%r19, [%r8 + %r9]
	.word 0xca4a0009  ! 2460: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0x8cda2ef8  ! 2460: SMULcc_I	smulcc 	%r8, 0x0ef8, %r6
	.word 0xc82a0009  ! 2463: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xcc0a0009  ! 2463: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xc9220009  ! 2463: STF_R	st	%f4, [%r9, %r8]
	.word 0xc2320009  ! 2466: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xfa5a0009  ! 2466: LDX_R	ldx	[%r8 + %r9], %r29
	.word 0xc5220009  ! 2466: STF_R	st	%f2, [%r9, %r8]
	.word 0xe0720009  ! 2469: STX_R	stx	%r16, [%r8 + %r9]
	.word 0xc4120009  ! 2469: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xca12231c  ! 2469: LDUH_I	lduh	[%r8 + 0x031c], %r5
	.word 0xc4220009  ! 2472: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc9020009  ! 2472: LDF_R	ld	[%r8, %r9], %f4
	.word 0xc48a28c4  ! 2472: LDUBA_I	lduba	[%r8, + 0x08c4] %asi, %r2
	.word 0xc6720009  ! 2475: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xca0a0009  ! 2475: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0x36800001  ! 2475: BGE	bge,a	<label_0x1>
	.word 0xe4720009  ! 2478: STX_R	stx	%r18, [%r8 + %r9]
	.word 0xce420009  ! 2478: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xc3ea1009  ! 2478: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc3220009  ! 2481: STF_R	st	%f1, [%r9, %r8]
	.word 0xda520009  ! 2481: LDSH_R	ldsh	[%r8 + %r9], %r13
	.word 0xc4b21009  ! 2481: STHA_R	stha	%r2, [%r8 + %r9] 0x80
	.word 0xe6220009  ! 2484: STW_R	stw	%r19, [%r8 + %r9]
	.word 0xe8520009  ! 2484: LDSH_R	ldsh	[%r8 + %r9], %r20
	.word 0x96520009  ! 2484: UMUL_R	umul 	%r8, %r9, %r11
	.word 0xfe320009  ! 2487: STH_R	sth	%r31, [%r8 + %r9]
	.word 0xc8120009  ! 2487: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0x22c20001  ! 2487: BRZ	brz,a,nt	%8,<label_0x20001>
	.word 0xfe720009  ! 2490: STX_R	stx	%r31, [%r8 + %r9]
	.word 0xe0020009  ! 2490: LDUW_R	lduw	[%r8 + %r9], %r16
	.word 0x24ca0001  ! 2490: BRLEZ	brlez,a,pt	%8,<label_0xa0001>
	.word 0xce720009  ! 2493: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xca0a0009  ! 2493: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xc36a0009  ! 2493: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xcc220009  ! 2496: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xee5a0009  ! 2496: LDX_R	ldx	[%r8 + %r9], %r23
	.word 0xd9022208  ! 2496: LDF_I	ld	[%r8, 0x0208], %f12
	.word 0xc4720009  ! 2499: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xde020009  ! 2499: LDUW_R	lduw	[%r8 + %r9], %r15
	.word 0xc36a2528  ! 2499: PREFETCH_I	prefetch	[%r8 + 0x0528], #one_read
	.word 0xfa2a0009  ! 2502: STB_R	stb	%r29, [%r8 + %r9]
	.word 0xce4a0009  ! 2502: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0x0a800002  ! 2502: BCS	bcs  	<label_0x2>
	.word 0xfe220009  ! 2505: STW_R	stw	%r31, [%r8 + %r9]
	.word 0xca0a0009  ! 2505: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0x8143e035  ! 2505: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside | #MemIssue 
	.word 0xc6220009  ! 2508: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xf80a0009  ! 2508: LDUB_R	ldub	[%r8 + %r9], %r28
	.word 0x8143c000  ! 2508: STBAR	stbar
	.word 0xcc320009  ! 2511: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc4020009  ! 2511: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xd9e22009  ! 2511: CASA_R	casa	[%r8] %asi, %r9, %r12
	.word 0xc2320009  ! 2514: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xf4420009  ! 2514: LDSW_R	ldsw	[%r8 + %r9], %r26
	.word 0xf8821009  ! 2514: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r28
	.word 0xec320009  ! 2517: STH_R	sth	%r22, [%r8 + %r9]
	.word 0xf5020009  ! 2517: LDF_R	ld	[%r8, %r9], %f26
	.word 0x8eda2aa4  ! 2517: SMULcc_I	smulcc 	%r8, 0x0aa4, %r7
	.word 0xce320009  ! 2520: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xca4a0009  ! 2520: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xc36a0009  ! 2520: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xe22a0009  ! 2523: STB_R	stb	%r17, [%r8 + %r9]
	.word 0xe8520009  ! 2523: LDSH_R	ldsh	[%r8 + %r9], %r20
	.word 0x0a800001  ! 2523: BCS	bcs  	<label_0x1>
	.word 0xe6220009  ! 2526: STW_R	stw	%r19, [%r8 + %r9]
	.word 0xc6120009  ! 2526: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xcaaa1009  ! 2526: STBA_R	stba	%r5, [%r8 + %r9] 0x80
	.word 0xe73a0009  ! 2529: STDF_R	std	%f19, [%r9, %r8]
	.word 0xc80a0009  ! 2529: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xcd1a0009  ! 2529: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xcf220009  ! 2532: STF_R	st	%f7, [%r9, %r8]
	.word 0xc8420009  ! 2532: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xccb22868  ! 2532: STHA_I	stha	%r6, [%r8 + 0x0868] %asi
	.word 0xf4720009  ! 2535: STX_R	stx	%r26, [%r8 + %r9]
	.word 0xec020009  ! 2535: LDUW_R	lduw	[%r8 + %r9], %r22
	.word 0xd73a0009  ! 2535: STDF_R	std	%f11, [%r9, %r8]
	.word 0xc4320009  ! 2538: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xcc0a0009  ! 2538: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0x845a2f50  ! 2538: SMUL_I	smul 	%r8, 0x0f50, %r2
	.word 0xc33a0009  ! 2541: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc4420009  ! 2541: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xc64a0009  ! 2541: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xfe320009  ! 2544: STH_R	sth	%r31, [%r8 + %r9]
	.word 0xc64a0009  ! 2544: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0x18800002  ! 2544: BGU	bgu  	<label_0x2>
	.word 0xed220009  ! 2547: STF_R	st	%f22, [%r9, %r8]
	.word 0xc8520009  ! 2547: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0x8143c000  ! 2547: STBAR	stbar
	.word 0xca2a0009  ! 2550: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xfe0a0009  ! 2550: LDUB_R	ldub	[%r8 + %r9], %r31
	.word 0xca6a0009  ! 2550: LDSTUB_R	ldstub	%r5, [%r8 + %r9]
	.word 0xc6320009  ! 2553: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xde5a0009  ! 2553: LDX_R	ldx	[%r8 + %r9], %r15
	.word 0xaa520009  ! 2553: UMUL_R	umul 	%r8, %r9, %r21
	.word 0xc42a0009  ! 2556: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xcf1a0009  ! 2556: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xc46a0009  ! 2556: LDSTUB_R	ldstub	%r2, [%r8 + %r9]
	.word 0xc22a0009  ! 2559: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xcf1a0009  ! 2559: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xca6a0009  ! 2559: LDSTUB_R	ldstub	%r5, [%r8 + %r9]
	.word 0xfe320009  ! 2562: STH_R	sth	%r31, [%r8 + %r9]
	.word 0xe6120009  ! 2562: LDUH_R	lduh	[%r8 + %r9], %r19
	.word 0xc93a2408  ! 2562: STDF_I	std	%f4, [0x0408, %r8]
	.word 0xc7220009  ! 2565: STF_R	st	%f3, [%r9, %r8]
	.word 0xc80a0009  ! 2565: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xc3ea22b8  ! 2565: PREFETCHA_I	prefetcha	[%r8, + 0x02b8] %asi, #one_read
	.word 0xf2320009  ! 2568: STH_R	sth	%r25, [%r8 + %r9]
	.word 0xce5a0009  ! 2568: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0x8a720009  ! 2568: UDIV_R	udiv 	%r8, %r9, %r5
	.word 0xcc220009  ! 2571: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xf3020009  ! 2571: LDF_R	ld	[%r8, %r9], %f25
	.word 0xcc6a2b28  ! 2571: LDSTUB_I	ldstub	%r6, [%r8 + 0x0b28]
	.word 0xcc2a0009  ! 2574: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xea5a0009  ! 2574: LDX_R	ldx	[%r8 + %r9], %r21
	.word 0xcea22d84  ! 2574: STWA_I	stwa	%r7, [%r8 + 0x0d84] %asi
	.word 0xe2320009  ! 2577: STH_R	sth	%r17, [%r8 + %r9]
	.word 0xc31a0009  ! 2577: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xceea1009  ! 2577: LDSTUBA_R	ldstuba	%r7, [%r8 + %r9] 0x80
	.word 0xc73a0009  ! 2580: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc6120009  ! 2580: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xc3ea1009  ! 2580: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc2720009  ! 2583: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xcc520009  ! 2583: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0x827a0009  ! 2583: SDIV_R	sdiv 	%r8, %r9, %r1
	.word 0xca220009  ! 2586: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xcc120009  ! 2586: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xc3ea1009  ! 2586: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xcc720009  ! 2589: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xcb020009  ! 2589: LDF_R	ld	[%r8, %r9], %f5
	.word 0x8efa0009  ! 2589: SDIVcc_R	sdivcc 	%r8, %r9, %r7
	.word 0xcc2a0009  ! 2592: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc8420009  ! 2592: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xa06a2590  ! 2592: UDIVX_I	udivx 	%r8, 0x0590, %r16
	.word 0xff220009  ! 2595: STF_R	st	%f31, [%r9, %r8]
	.word 0xca120009  ! 2595: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0x847a2be0  ! 2595: SDIV_I	sdiv 	%r8, 0x0be0, %r2
	.word 0xf53a0009  ! 2598: STDF_R	std	%f26, [%r9, %r8]
	.word 0xc45a0009  ! 2598: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xca7a2628  ! 2598: SWAP_I	swap	%r5, [%r8 + 0x0628]
	.word 0xc8720009  ! 2601: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc6020009  ! 2601: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0x825a2f48  ! 2601: SMUL_I	smul 	%r8, 0x0f48, %r1
	.word 0xcc320009  ! 2604: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc84a0009  ! 2604: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xc36a0009  ! 2604: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc9220009  ! 2607: STF_R	st	%f4, [%r9, %r8]
	.word 0xeb020009  ! 2607: LDF_R	ld	[%r8, %r9], %f21
	.word 0xc86a0009  ! 2607: LDSTUB_R	ldstub	%r4, [%r8 + %r9]
	.word 0xdd220009  ! 2610: STF_R	st	%f14, [%r9, %r8]
	.word 0xfa5a0009  ! 2610: LDX_R	ldx	[%r8 + %r9], %r29
	.word 0x8143e061  ! 2610: MEMBAR	membar	#LoadLoad | #MemIssue | #Sync 
	.word 0xc2220009  ! 2613: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc6020009  ! 2613: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xe93a2358  ! 2613: STDF_I	std	%f20, [0x0358, %r8]
	.word 0xc4220009  ! 2616: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xce520009  ! 2616: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0x8a5224bc  ! 2616: UMUL_I	umul 	%r8, 0x04bc, %r5
	.word 0xc22a0009  ! 2619: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc91a0009  ! 2619: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xf60a0009  ! 2619: LDUB_R	ldub	[%r8 + %r9], %r27
	.word 0xc6320009  ! 2622: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xcc0a0009  ! 2622: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0x8143c000  ! 2622: STBAR	stbar
	.word 0xc5220009  ! 2625: STF_R	st	%f2, [%r9, %r8]
	.word 0xda420009  ! 2625: LDSW_R	ldsw	[%r8 + %r9], %r13
	.word 0xcd3a2510  ! 2625: STDF_I	std	%f6, [0x0510, %r8]
	.word 0xfe2a0009  ! 2628: STB_R	stb	%r31, [%r8 + %r9]
	.word 0xc2520009  ! 2628: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xc3ea1009  ! 2628: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc8720009  ! 2631: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xda120009  ! 2631: LDUH_R	lduh	[%r8 + %r9], %r13
	.word 0xff220009  ! 2631: STF_R	st	%f31, [%r9, %r8]
	.word 0xc8320009  ! 2634: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc4420009  ! 2634: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xc2921009  ! 2634: LDUHA_R	lduha	[%r8, %r9] 0x80, %r1
	.word 0xcd220009  ! 2637: STF_R	st	%f6, [%r9, %r8]
	.word 0xce0a0009  ! 2637: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xc87a2628  ! 2637: SWAP_I	swap	%r4, [%r8 + 0x0628]
	.word 0xce2a0009  ! 2640: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xca5a0009  ! 2640: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0x8143c000  ! 2640: STBAR	stbar
	.word 0xfc2a0009  ! 2643: STB_R	stb	%r30, [%r8 + %r9]
	.word 0xca120009  ! 2643: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0x84720009  ! 2643: UDIV_R	udiv 	%r8, %r9, %r2
	.word 0xce720009  ! 2646: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc2520009  ! 2646: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xa3222ca0  ! 2646: MULScc_I	mulscc 	%r8, 0x0ca0, %r17
	.word 0xc8720009  ! 2649: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc80a0009  ! 2649: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0x96f22194  ! 2649: UDIVcc_I	udivcc 	%r8, 0x0194, %r11
	.word 0xc73a0009  ! 2652: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc6020009  ! 2652: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xa0fa24d4  ! 2652: SDIVcc_I	sdivcc 	%r8, 0x04d4, %r16
	.word 0xcb3a0009  ! 2655: STDF_R	std	%f5, [%r9, %r8]
	.word 0xfc5a0009  ! 2655: LDX_R	ldx	[%r8 + %r9], %r30
	.word 0x0c800002  ! 2655: BNEG	bneg  	<label_0x2>
	.word 0xf9220009  ! 2658: STF_R	st	%f28, [%r9, %r8]
	.word 0xc45a0009  ! 2658: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xf4a2271c  ! 2658: STWA_I	stwa	%r26, [%r8 + 0x071c] %asi
	.word 0xcd220009  ! 2661: STF_R	st	%f6, [%r9, %r8]
	.word 0xc25a0009  ! 2661: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xea821009  ! 2661: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r21
	.word 0xeb220009  ! 2664: STF_R	st	%f21, [%r9, %r8]
	.word 0xc64a0009  ! 2664: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xedf21009  ! 2664: CASXA_I	casxa	[%r8] 0x80, %r9, %r22
	.word 0xce2a0009  ! 2667: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xca120009  ! 2667: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xf0ea2cc0  ! 2667: LDSTUBA_I	ldstuba	%r24, [%r8 + 0x0cc0] %asi
	.word 0xdb3a0009  ! 2670: STDF_R	std	%f13, [%r9, %r8]
	.word 0xc25a0009  ! 2670: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0x827a0009  ! 2670: SDIV_R	sdiv 	%r8, %r9, %r1
	.word 0xc8720009  ! 2673: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xca120009  ! 2673: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xc26a0009  ! 2673: LDSTUB_R	ldstub	%r1, [%r8 + %r9]
	.word 0xf1220009  ! 2676: STF_R	st	%f24, [%r9, %r8]
	.word 0xf8420009  ! 2676: LDSW_R	ldsw	[%r8 + %r9], %r28
	.word 0xc36a0009  ! 2676: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xca320009  ! 2679: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc4120009  ! 2679: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0x1e800002  ! 2679: BVC	bvc  	<label_0x2>
	.word 0xc4220009  ! 2682: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc65a0009  ! 2682: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xb46a2aac  ! 2682: UDIVX_I	udivx 	%r8, 0x0aac, %r26
	.word 0xf3220009  ! 2685: STF_R	st	%f25, [%r9, %r8]
	.word 0xed020009  ! 2685: LDF_R	ld	[%r8, %r9], %f22
	.word 0xc26a0009  ! 2685: LDSTUB_R	ldstub	%r1, [%r8 + %r9]
	.word 0xc6220009  ! 2688: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xce020009  ! 2688: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0x83a209a9  ! 2688: FDIVs	fdivs	%f8, %f9, %f1
	.word 0xca220009  ! 2691: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc2520009  ! 2691: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0x86fa0009  ! 2691: SDIVcc_R	sdivcc 	%r8, %r9, %r3
	.word 0xc8720009  ! 2694: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xcc120009  ! 2694: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0x02800001  ! 2694: BE	be  	<label_0x1>
	.word 0xc4720009  ! 2697: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xf2120009  ! 2697: LDUH_R	lduh	[%r8 + %r9], %r25
	.word 0x9f222380  ! 2697: MULScc_I	mulscc 	%r8, 0x0380, %r15
	.word 0xc62a0009  ! 2700: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xf1020009  ! 2700: LDF_R	ld	[%r8, %r9], %f24
	.word 0xcfe22009  ! 2700: CASA_R	casa	[%r8] %asi, %r9, %r7
	.word 0xce220009  ! 2703: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xf2120009  ! 2703: LDUH_R	lduh	[%r8 + %r9], %r25
	.word 0xc86a0009  ! 2703: LDSTUB_R	ldstub	%r4, [%r8 + %r9]
	.word 0xe9220009  ! 2706: STF_R	st	%f20, [%r9, %r8]
	.word 0xc40a0009  ! 2706: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xc4b226a8  ! 2706: STHA_I	stha	%r2, [%r8 + 0x06a8] %asi
	.word 0xc73a0009  ! 2709: STDF_R	std	%f3, [%r9, %r8]
	.word 0xcc420009  ! 2709: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xc36a2c30  ! 2709: PREFETCH_I	prefetch	[%r8 + 0x0c30], #one_read
	.word 0xf4720009  ! 2712: STX_R	stx	%r26, [%r8 + %r9]
	.word 0xf5020009  ! 2712: LDF_R	ld	[%r8, %r9], %f26
	.word 0xc3ea1009  ! 2712: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xce220009  ! 2715: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xcb020009  ! 2715: LDF_R	ld	[%r8, %r9], %f5
	.word 0xc36a2aa8  ! 2715: PREFETCH_I	prefetch	[%r8 + 0x0aa8], #one_read
	.word 0xda2a0009  ! 2718: STB_R	stb	%r13, [%r8 + %r9]
	.word 0xeb020009  ! 2718: LDF_R	ld	[%r8, %r9], %f21
	.word 0xc36a2978  ! 2718: PREFETCH_I	prefetch	[%r8 + 0x0978], #one_read
	.word 0xc4220009  ! 2721: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc40a0009  ! 2721: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xb24a2110  ! 2721: MULX_I	mulx 	%r8, 0x0110, %r25
	.word 0xc82a0009  ! 2724: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc6020009  ! 2724: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xcc422788  ! 2724: LDSW_I	ldsw	[%r8 + 0x0788], %r6
	.word 0xc3220009  ! 2727: STF_R	st	%f1, [%r9, %r8]
	.word 0xc6520009  ! 2727: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xcdf22009  ! 2727: CASXA_R	casxa	[%r8]%asi, %r9, %r6
	.word 0xf0720009  ! 2730: STX_R	stx	%r24, [%r8 + %r9]
	.word 0xe25a0009  ! 2730: LDX_R	ldx	[%r8 + %r9], %r17
	.word 0xc3ea1009  ! 2730: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc4320009  ! 2733: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc8020009  ! 2733: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0x86da2754  ! 2733: SMULcc_I	smulcc 	%r8, 0x0754, %r3
	.word 0xda720009  ! 2736: STX_R	stx	%r13, [%r8 + %r9]
	.word 0xc8120009  ! 2736: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0x8c4a0009  ! 2736: MULX_R	mulx 	%r8, %r9, %r6
	.word 0xd9220009  ! 2739: STF_R	st	%f12, [%r9, %r8]
	.word 0xd8020009  ! 2739: LDUW_R	lduw	[%r8 + %r9], %r12
	.word 0x8143e077  ! 2739: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside | #MemIssue | #Sync 
	.word 0xcd3a0009  ! 2742: STDF_R	std	%f6, [%r9, %r8]
	.word 0xfc020009  ! 2742: LDUW_R	lduw	[%r8 + %r9], %r30
	.word 0xdca21009  ! 2742: STWA_R	stwa	%r14, [%r8 + %r9] 0x80
	.word 0xc82a0009  ! 2745: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xcf1a0009  ! 2745: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0x83a20929  ! 2745: FMULs	fmuls	%f8, %f9, %f1
	.word 0xcc2a0009  ! 2748: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc6020009  ! 2748: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xc3ea2750  ! 2748: PREFETCHA_I	prefetcha	[%r8, + 0x0750] %asi, #one_read
	.word 0xc9220009  ! 2751: STF_R	st	%f4, [%r9, %r8]
	.word 0xcc5a0009  ! 2751: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0x06ca0001  ! 2751: BRLZ	brlz  ,pt	%8,<label_0xa0001>
	.word 0xcf220009  ! 2754: STF_R	st	%f7, [%r9, %r8]
	.word 0xcd1a0009  ! 2754: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xcea22900  ! 2754: STWA_I	stwa	%r7, [%r8 + 0x0900] %asi
	.word 0xcd3a0009  ! 2757: STDF_R	std	%f6, [%r9, %r8]
	.word 0xec5a0009  ! 2757: LDX_R	ldx	[%r8 + %r9], %r22
	.word 0xc28a1009  ! 2757: LDUBA_R	lduba	[%r8, %r9] 0x80, %r1
	.word 0xcf3a0009  ! 2760: STDF_R	std	%f7, [%r9, %r8]
	.word 0xcd1a0009  ! 2760: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xc6b22854  ! 2760: STHA_I	stha	%r3, [%r8 + 0x0854] %asi
	.word 0xea2a0009  ! 2763: STB_R	stb	%r21, [%r8 + %r9]
	.word 0xcd1a0009  ! 2763: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0x852225a8  ! 2763: MULScc_I	mulscc 	%r8, 0x05a8, %r2
	.word 0xe6220009  ! 2766: STW_R	stw	%r19, [%r8 + %r9]
	.word 0xcc120009  ! 2766: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xc6aa1009  ! 2766: STBA_R	stba	%r3, [%r8 + %r9] 0x80
	.word 0xc5220009  ! 2769: STF_R	st	%f2, [%r9, %r8]
	.word 0xcc4a0009  ! 2769: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xcada1009  ! 2769: LDXA_R	ldxa	[%r8, %r9] 0x80, %r5
	.word 0xc93a0009  ! 2772: STDF_R	std	%f4, [%r9, %r8]
	.word 0xc4020009  ! 2772: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xc3ea1009  ! 2772: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xfa720009  ! 2775: STX_R	stx	%r29, [%r8 + %r9]
	.word 0xcc4a0009  ! 2775: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xfc8a1009  ! 2775: LDUBA_R	lduba	[%r8, %r9] 0x80, %r30
	.word 0xf62a0009  ! 2778: STB_R	stb	%r27, [%r8 + %r9]
	.word 0xc6520009  ! 2778: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xa47a0009  ! 2778: SDIV_R	sdiv 	%r8, %r9, %r18
	.word 0xda220009  ! 2781: STW_R	stw	%r13, [%r8 + %r9]
	.word 0xe8420009  ! 2781: LDSW_R	ldsw	[%r8 + %r9], %r20
	.word 0x82fa2ec8  ! 2781: SDIVcc_I	sdivcc 	%r8, 0x0ec8, %r1
	.word 0xcc320009  ! 2784: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xce5a0009  ! 2784: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0x847a0009  ! 2784: SDIV_R	sdiv 	%r8, %r9, %r2
	.word 0xcb220009  ! 2787: STF_R	st	%f5, [%r9, %r8]
	.word 0xf2520009  ! 2787: LDSH_R	ldsh	[%r8 + %r9], %r25
	.word 0xced21009  ! 2787: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r7
	.word 0xec220009  ! 2790: STW_R	stw	%r22, [%r8 + %r9]
	.word 0xcb020009  ! 2790: LDF_R	ld	[%r8, %r9], %f5
	.word 0x40000002  ! 2790: CALL	call	disp30_2
	.word 0xcc2a0009  ! 2793: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc45a0009  ! 2793: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0x8e4a0009  ! 2793: MULX_R	mulx 	%r8, %r9, %r7
	.word 0xca720009  ! 2796: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc8120009  ! 2796: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0x8143e030  ! 2796: MEMBAR	membar	#Lookaside | #MemIssue 
	.word 0xf4320009  ! 2799: STH_R	sth	%r26, [%r8 + %r9]
	.word 0xe2420009  ! 2799: LDSW_R	ldsw	[%r8 + %r9], %r17
	.word 0xc8922178  ! 2799: LDUHA_I	lduha	[%r8, + 0x0178] %asi, %r4
	.word 0xc2320009  ! 2802: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xca0a0009  ! 2802: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xc6ea1009  ! 2802: LDSTUBA_R	ldstuba	%r3, [%r8 + %r9] 0x80
	.word 0xc4220009  ! 2805: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc20a0009  ! 2805: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xc2aa2d1c  ! 2805: STBA_I	stba	%r1, [%r8 + 0x0d1c] %asi
	.word 0xce220009  ! 2808: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xec120009  ! 2808: LDUH_R	lduh	[%r8 + %r9], %r22
	.word 0x8143c000  ! 2808: STBAR	stbar
	.word 0xc2320009  ! 2811: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc84a0009  ! 2811: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0x8143e00a  ! 2811: MEMBAR	membar	#StoreLoad | #StoreStore 
	.word 0xc73a0009  ! 2814: STDF_R	std	%f3, [%r9, %r8]
	.word 0xdc4a0009  ! 2814: LDSB_R	ldsb	[%r8 + %r9], %r14
	.word 0xe0821009  ! 2814: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r16
	.word 0xf1220009  ! 2817: STF_R	st	%f24, [%r9, %r8]
	.word 0xf91a0009  ! 2817: LDDF_R	ldd	[%r8, %r9], %f28
	.word 0xc6c22e64  ! 2817: LDSWA_I	ldswa	[%r8, + 0x0e64] %asi, %r3
	.word 0xca2a0009  ! 2820: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xcc0a0009  ! 2820: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xfc420009  ! 2820: LDSW_R	ldsw	[%r8 + %r9], %r30
	.word 0xc22a0009  ! 2823: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc20a0009  ! 2823: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0x86da0009  ! 2823: SMULcc_R	smulcc 	%r8, %r9, %r3
	.word 0xdc320009  ! 2826: STH_R	sth	%r14, [%r8 + %r9]
	.word 0xe4020009  ! 2826: LDUW_R	lduw	[%r8 + %r9], %r18
	.word 0xc47a2888  ! 2826: SWAP_I	swap	%r2, [%r8 + 0x0888]
	.word 0xc93a0009  ! 2829: STDF_R	std	%f4, [%r9, %r8]
	.word 0xc2420009  ! 2829: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xcc6a0009  ! 2829: LDSTUB_R	ldstub	%r6, [%r8 + %r9]
	.word 0xc8320009  ! 2832: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc8020009  ! 2832: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0x2ac20001  ! 2832: BRNZ	brnz,a,nt	%8,<label_0x20001>
	.word 0xfb3a0009  ! 2835: STDF_R	std	%f29, [%r9, %r8]
	.word 0xc4520009  ! 2835: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0x1c800001  ! 2835: BPOS	bpos  	<label_0x1>
	.word 0xee2a0009  ! 2838: STB_R	stb	%r23, [%r8 + %r9]
	.word 0xc6020009  ! 2838: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xcb3a25c8  ! 2838: STDF_I	std	%f5, [0x05c8, %r8]
	.word 0xfa720009  ! 2841: STX_R	stx	%r29, [%r8 + %r9]
	.word 0xcb1a0009  ! 2841: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xccba1009  ! 2841: STDA_R	stda	%r6, [%r8 + %r9] 0x80
	.word 0xc2220009  ! 2844: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xcf1a0009  ! 2844: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0x844a2b78  ! 2844: MULX_I	mulx 	%r8, 0x0b78, %r2
	.word 0xc6320009  ! 2847: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc2120009  ! 2847: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0x885a20ac  ! 2847: SMUL_I	smul 	%r8, 0x00ac, %r4
	.word 0xd7220009  ! 2850: STF_R	st	%f11, [%r9, %r8]
	.word 0xeb020009  ! 2850: LDF_R	ld	[%r8, %r9], %f21
	.word 0xccba23a8  ! 2850: STDA_I	stda	%r6, [%r8 + 0x03a8] %asi
	.word 0xc7220009  ! 2853: STF_R	st	%f3, [%r9, %r8]
	.word 0xed1a0009  ! 2853: LDDF_R	ldd	[%r8, %r9], %f22
	.word 0x8143c000  ! 2853: STBAR	stbar
	.word 0xc22a0009  ! 2856: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc44a0009  ! 2856: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xc36a2e84  ! 2856: PREFETCH_I	prefetch	[%r8 + 0x0e84], #one_read
	.word 0xc6220009  ! 2859: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc45a0009  ! 2859: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xb04a0009  ! 2859: MULX_R	mulx 	%r8, %r9, %r24
	.word 0xf0720009  ! 2862: STX_R	stx	%r24, [%r8 + %r9]
	.word 0xce0a0009  ! 2862: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xc3ea2f68  ! 2862: PREFETCHA_I	prefetcha	[%r8, + 0x0f68] %asi, #one_read
	.word 0xfc720009  ! 2865: STX_R	stx	%r30, [%r8 + %r9]
	.word 0xe80a0009  ! 2865: LDUB_R	ldub	[%r8 + %r9], %r20
	.word 0xce4a0009  ! 2865: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xc4220009  ! 2868: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xcc520009  ! 2868: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xc3ea1009  ! 2868: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xcf220009  ! 2871: STF_R	st	%f7, [%r9, %r8]
	.word 0xcf1a0009  ! 2871: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0x8143e005  ! 2871: MEMBAR	membar	#LoadLoad | #LoadStore 
	.word 0xf2320009  ! 2874: STH_R	sth	%r25, [%r8 + %r9]
	.word 0xcb1a0009  ! 2874: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0x2a800001  ! 2874: BCS	bcs,a	<label_0x1>
	.word 0xc4320009  ! 2877: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xca020009  ! 2877: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xc3ea26c8  ! 2877: PREFETCHA_I	prefetcha	[%r8, + 0x06c8] %asi, #one_read
	.word 0xc6320009  ! 2880: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xce4a0009  ! 2880: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0x12800001  ! 2880: BNE	bne  	<label_0x1>
	.word 0xd9220009  ! 2883: STF_R	st	%f12, [%r9, %r8]
	.word 0xfe120009  ! 2883: LDUH_R	lduh	[%r8 + %r9], %r31
	.word 0xced21009  ! 2883: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r7
	.word 0xeb3a0009  ! 2886: STDF_R	std	%f21, [%r9, %r8]
	.word 0xc71a0009  ! 2886: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0x88d20009  ! 2886: UMULcc_R	umulcc 	%r8, %r9, %r4
	.word 0xdb3a0009  ! 2889: STDF_R	std	%f13, [%r9, %r8]
	.word 0xc6520009  ! 2889: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xc36a2cdc  ! 2889: PREFETCH_I	prefetch	[%r8 + 0x0cdc], #one_read
	.word 0xcd220009  ! 2892: STF_R	st	%f6, [%r9, %r8]
	.word 0xc2020009  ! 2892: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0x8da20829  ! 2892: FADDs	fadds	%f8, %f9, %f6
	.word 0xcd3a0009  ! 2895: STDF_R	std	%f6, [%r9, %r8]
	.word 0xe11a0009  ! 2895: LDDF_R	ldd	[%r8, %r9], %f16
	.word 0xc3ea1009  ! 2895: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc7220009  ! 2898: STF_R	st	%f3, [%r9, %r8]
	.word 0xce020009  ! 2898: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0x8143c000  ! 2898: STBAR	stbar
	.word 0xca2a0009  ! 2901: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xca120009  ! 2901: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xa96a2a10  ! 2901: SDIVX_I	sdivx	%r8, 0x0a10, %r20
	.word 0xdf220009  ! 2904: STF_R	st	%f15, [%r9, %r8]
	.word 0xd6120009  ! 2904: LDUH_R	lduh	[%r8 + %r9], %r11
	.word 0xa6fa0009  ! 2904: SDIVcc_R	sdivcc 	%r8, %r9, %r19
	.word 0xcc720009  ! 2907: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc80a0009  ! 2907: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xc53a2c00  ! 2907: STDF_I	std	%f2, [0x0c00, %r8]
	.word 0xc5220009  ! 2910: STF_R	st	%f2, [%r9, %r8]
	.word 0xcc020009  ! 2910: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xc32223c4  ! 2910: STF_I	st	%f1, [0x03c4, %r8]
	.word 0xcc720009  ! 2913: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc2020009  ! 2913: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0x8a4a0009  ! 2913: MULX_R	mulx 	%r8, %r9, %r5
	.word 0xc8220009  ! 2916: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xdb1a0009  ! 2916: LDDF_R	ldd	[%r8, %r9], %f13
	.word 0xdca2259c  ! 2916: STWA_I	stwa	%r14, [%r8 + 0x059c] %asi
	.word 0xea320009  ! 2919: STH_R	sth	%r21, [%r8 + %r9]
	.word 0xe3020009  ! 2919: LDF_R	ld	[%r8, %r9], %f17
	.word 0x34800001  ! 2919: BG	bg,a	<label_0x1>
	.word 0xc4320009  ! 2922: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xca120009  ! 2922: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xc33a0009  ! 2922: STDF_R	std	%f1, [%r9, %r8]
	.word 0xf13a0009  ! 2925: STDF_R	std	%f24, [%r9, %r8]
	.word 0xf6120009  ! 2925: LDUH_R	lduh	[%r8 + %r9], %r27
	.word 0xc4aa2c8c  ! 2925: STBA_I	stba	%r2, [%r8 + 0x0c8c] %asi
	.word 0xc73a0009  ! 2928: STDF_R	std	%f3, [%r9, %r8]
	.word 0xcd020009  ! 2928: LDF_R	ld	[%r8, %r9], %f6
	.word 0xd8aa1009  ! 2928: STBA_R	stba	%r12, [%r8 + %r9] 0x80
	.word 0xec720009  ! 2931: STX_R	stx	%r22, [%r8 + %r9]
	.word 0xdc520009  ! 2931: LDSH_R	ldsh	[%r8 + %r9], %r14
	.word 0x82da0009  ! 2931: SMULcc_R	smulcc 	%r8, %r9, %r1
	.word 0xcd220009  ! 2934: STF_R	st	%f6, [%r9, %r8]
	.word 0xc80a0009  ! 2934: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xcafa1009  ! 2934: SWAPA_R	swapa	%r5, [%r8 + %r9] 0x80
	.word 0xc2320009  ! 2937: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc5020009  ! 2937: LDF_R	ld	[%r8, %r9], %f2
	.word 0x827a0009  ! 2937: SDIV_R	sdiv 	%r8, %r9, %r1
	.word 0xe6320009  ! 2940: STH_R	sth	%r19, [%r8 + %r9]
	.word 0xed1a0009  ! 2940: LDDF_R	ldd	[%r8, %r9], %f22
	.word 0x86520009  ! 2940: UMUL_R	umul 	%r8, %r9, %r3
	.word 0xc8220009  ! 2943: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc8520009  ! 2943: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0x38800001  ! 2943: BGU	bgu,a	<label_0x1>
	.word 0xc3220009  ! 2946: STF_R	st	%f1, [%r9, %r8]
	.word 0xc64a0009  ! 2946: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0x8143e072  ! 2946: MEMBAR	membar	#StoreLoad | #Lookaside | #MemIssue | #Sync 
	.word 0xce720009  ! 2949: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xec4a0009  ! 2949: LDSB_R	ldsb	[%r8 + %r9], %r22
	.word 0x8143c000  ! 2949: STBAR	stbar
	.word 0xca320009  ! 2952: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc91a0009  ! 2952: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xeeda2770  ! 2952: LDXA_I	ldxa	[%r8, + 0x0770] %asi, %r23
	.word 0xca220009  ! 2955: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc8420009  ! 2955: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xc36a2c64  ! 2955: PREFETCH_I	prefetch	[%r8 + 0x0c64], #one_read
	.word 0xcc220009  ! 2958: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc25a0009  ! 2958: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xa5a209a9  ! 2958: FDIVs	fdivs	%f8, %f9, %f18
	.word 0xdd3a0009  ! 2961: STDF_R	std	%f14, [%r9, %r8]
	.word 0xce0a0009  ! 2961: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xaa52246c  ! 2961: UMUL_I	umul 	%r8, 0x046c, %r21
	.word 0xca2a0009  ! 2964: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc65a0009  ! 2964: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xce8a264c  ! 2964: LDUBA_I	lduba	[%r8, + 0x064c] %asi, %r7
	.word 0xf8720009  ! 2967: STX_R	stx	%r28, [%r8 + %r9]
	.word 0xc45a0009  ! 2967: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xce4a2e04  ! 2967: LDSB_I	ldsb	[%r8 + 0x0e04], %r7
	.word 0xe53a0009  ! 2970: STDF_R	std	%f18, [%r9, %r8]
	.word 0xce5a0009  ! 2970: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xc8a22c0c  ! 2970: STWA_I	stwa	%r4, [%r8 + 0x0c0c] %asi
	.word 0xcd3a0009  ! 2973: STDF_R	std	%f6, [%r9, %r8]
	.word 0xe4520009  ! 2973: LDSH_R	ldsh	[%r8 + %r9], %r18
	.word 0xfeaa2ba4  ! 2973: STBA_I	stba	%r31, [%r8 + 0x0ba4] %asi
	.word 0xfa720009  ! 2976: STX_R	stx	%r29, [%r8 + %r9]
	.word 0xca420009  ! 2976: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xc36a0009  ! 2976: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xf0320009  ! 2979: STH_R	sth	%r24, [%r8 + %r9]
	.word 0xda520009  ! 2979: LDSH_R	ldsh	[%r8 + %r9], %r13
	.word 0xa8f20009  ! 2979: UDIVcc_R	udivcc 	%r8, %r9, %r20
	.word 0xc6220009  ! 2982: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xf85a0009  ! 2982: LDX_R	ldx	[%r8 + %r9], %r28
	.word 0x85a20929  ! 2982: FMULs	fmuls	%f8, %f9, %f2
	.word 0xcd3a0009  ! 2985: STDF_R	std	%f6, [%r9, %r8]
	.word 0xf0520009  ! 2985: LDSH_R	ldsh	[%r8 + %r9], %r24
	.word 0x8143c000  ! 2985: STBAR	stbar
	.word 0xcd3a0009  ! 2988: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc7020009  ! 2988: LDF_R	ld	[%r8, %r9], %f3
	.word 0xcaca24d8  ! 2988: LDSBA_I	ldsba	[%r8, + 0x04d8] %asi, %r5
	.word 0xfc220009  ! 2991: STW_R	stw	%r30, [%r8 + %r9]
	.word 0xcc0a0009  ! 2991: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xda821009  ! 2991: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r13
	.word 0xc9220009  ! 2994: STF_R	st	%f4, [%r9, %r8]
	.word 0xc6520009  ! 2994: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0x86da2dc4  ! 2994: SMULcc_I	smulcc 	%r8, 0x0dc4, %r3
	.word 0xed220009  ! 2997: STF_R	st	%f22, [%r9, %r8]
	.word 0xc5020009  ! 2997: LDF_R	ld	[%r8, %r9], %f2
	.word 0xa0d20009  ! 2997: UMULcc_R	umulcc 	%r8, %r9, %r16
	.word 0xc7220009  ! 3000: STF_R	st	%f3, [%r9, %r8]
	.word 0xfa4a0009  ! 3000: LDSB_R	ldsb	[%r8 + %r9], %r29
	.word 0xa6fa0009  ! 3000: SDIVcc_R	sdivcc 	%r8, %r9, %r19
	.word 0xe7220009  ! 3003: STF_R	st	%f19, [%r9, %r8]
	.word 0xda4a0009  ! 3003: LDSB_R	ldsb	[%r8 + %r9], %r13
	.word 0x82722174  ! 3003: UDIV_I	udiv 	%r8, 0x0174, %r1
	.word 0xca320009  ! 3006: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc4120009  ! 3006: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0x8143c000  ! 3006: STBAR	stbar
	.word 0xc42a0009  ! 3009: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xca4a0009  ! 3009: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0x8143e02c  ! 3009: MEMBAR	membar	#LoadStore | #StoreStore | #MemIssue 
	.word 0xc42a0009  ! 3012: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc6420009  ! 3012: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xc36a29b8  ! 3012: PREFETCH_I	prefetch	[%r8 + 0x09b8], #one_read
	.word 0xfc220009  ! 3015: STW_R	stw	%r30, [%r8 + %r9]
	.word 0xed020009  ! 3015: LDF_R	ld	[%r8, %r9], %f22
	.word 0x2e800002  ! 3015: BVS	bvs,a	<label_0x2>
	.word 0xc2320009  ! 3018: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc6520009  ! 3018: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xc3ea1009  ! 3018: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xcc220009  ! 3021: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xec420009  ! 3021: LDSW_R	ldsw	[%r8 + %r9], %r22
	.word 0xcb220009  ! 3021: STF_R	st	%f5, [%r9, %r8]
	.word 0xf6320009  ! 3024: STH_R	sth	%r27, [%r8 + %r9]
	.word 0xc65a0009  ! 3024: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xce0a0009  ! 3024: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xc2220009  ! 3027: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc24a0009  ! 3027: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xca0a2268  ! 3027: LDUB_I	ldub	[%r8 + 0x0268], %r5
	.word 0xcc720009  ! 3030: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc91a0009  ! 3030: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0x8143c000  ! 3030: STBAR	stbar
	.word 0xc6220009  ! 3033: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xce520009  ! 3033: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xa85a2524  ! 3033: SMUL_I	smul 	%r8, 0x0524, %r20
	.word 0xc42a0009  ! 3036: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xcd1a0009  ! 3036: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xc8ba27e8  ! 3036: STDA_I	stda	%r4, [%r8 + 0x07e8] %asi
	.word 0xcf220009  ! 3039: STF_R	st	%f7, [%r9, %r8]
	.word 0xe7020009  ! 3039: LDF_R	ld	[%r8, %r9], %f19
	.word 0xc9f22009  ! 3039: CASXA_R	casxa	[%r8]%asi, %r9, %r4
	.word 0xca220009  ! 3042: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc6520009  ! 3042: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xeeb22790  ! 3042: STHA_I	stha	%r23, [%r8 + 0x0790] %asi
	.word 0xf6220009  ! 3045: STW_R	stw	%r27, [%r8 + %r9]
	.word 0xff020009  ! 3045: LDF_R	ld	[%r8, %r9], %f31
	.word 0xcf1a2be0  ! 3045: LDDF_I	ldd	[%r8, 0x0be0], %f7
	.word 0xde320009  ! 3048: STH_R	sth	%r15, [%r8 + %r9]
	.word 0xc2520009  ! 3048: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xeeda1009  ! 3048: LDXA_R	ldxa	[%r8, %r9] 0x80, %r23
	.word 0xe8320009  ! 3051: STH_R	sth	%r20, [%r8 + %r9]
	.word 0xce120009  ! 3051: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xacd20009  ! 3051: UMULcc_R	umulcc 	%r8, %r9, %r22
	.word 0xe22a0009  ! 3054: STB_R	stb	%r17, [%r8 + %r9]
	.word 0xc31a0009  ! 3054: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xcd3a2320  ! 3054: STDF_I	std	%f6, [0x0320, %r8]
	.word 0xe6720009  ! 3057: STX_R	stx	%r19, [%r8 + %r9]
	.word 0xfa020009  ! 3057: LDUW_R	lduw	[%r8 + %r9], %r29
	.word 0x36800001  ! 3057: BGE	bge,a	<label_0x1>
	.word 0xd8720009  ! 3060: STX_R	stx	%r12, [%r8 + %r9]
	.word 0xfe420009  ! 3060: LDSW_R	ldsw	[%r8 + %r9], %r31
	.word 0xa47a0009  ! 3060: SDIV_R	sdiv 	%r8, %r9, %r18
	.word 0xcd3a0009  ! 3063: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc8520009  ! 3063: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xe93a0009  ! 3063: STDF_R	std	%f20, [%r9, %r8]
	.word 0xc62a0009  ! 3066: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc80a0009  ! 3066: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xc5f22009  ! 3066: CASXA_R	casxa	[%r8]%asi, %r9, %r2
	.word 0xea220009  ! 3069: STW_R	stw	%r21, [%r8 + %r9]
	.word 0xf84a0009  ! 3069: LDSB_R	ldsb	[%r8 + %r9], %r28
	.word 0x85a208a9  ! 3069: FSUBs	fsubs	%f8, %f9, %f2
	.word 0xcc320009  ! 3072: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xea120009  ! 3072: LDUH_R	lduh	[%r8 + %r9], %r21
	.word 0x88fa2f40  ! 3072: SDIVcc_I	sdivcc 	%r8, 0x0f40, %r4
	.word 0xcc220009  ! 3075: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc5020009  ! 3075: LDF_R	ld	[%r8, %r9], %f2
	.word 0xd8ba2790  ! 3075: STDA_I	stda	%r12, [%r8 + 0x0790] %asi
	.word 0xc4220009  ! 3078: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc6520009  ! 3078: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xee120009  ! 3078: LDUH_R	lduh	[%r8 + %r9], %r23
	.word 0xce320009  ! 3081: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xcc020009  ! 3081: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0x8143e04f  ! 3081: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #Sync 
	.word 0xcd3a0009  ! 3084: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc80a0009  ! 3084: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xe6aa2ee8  ! 3084: STBA_I	stba	%r19, [%r8 + 0x0ee8] %asi
	.word 0xc2220009  ! 3087: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xe0420009  ! 3087: LDSW_R	ldsw	[%r8 + %r9], %r16
	.word 0x8143e004  ! 3087: MEMBAR	membar	#LoadStore 
	.word 0xd62a0009  ! 3090: STB_R	stb	%r11, [%r8 + %r9]
	.word 0xe85a0009  ! 3090: LDX_R	ldx	[%r8 + %r9], %r20
	.word 0x24800002  ! 3090: BLE	ble,a	<label_0x2>
	.word 0xc4320009  ! 3093: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xce120009  ! 3093: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xb84a2c8c  ! 3093: MULX_I	mulx 	%r8, 0x0c8c, %r28
	.word 0xc22a0009  ! 3096: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xee5a0009  ! 3096: LDX_R	ldx	[%r8 + %r9], %r23
	.word 0xc3ea2d88  ! 3096: PREFETCHA_I	prefetcha	[%r8, + 0x0d88] %asi, #one_read
	.word 0xc6720009  ! 3099: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xe24a0009  ! 3099: LDSB_R	ldsb	[%r8 + %r9], %r17
	.word 0xc36a0009  ! 3099: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc73a0009  ! 3102: STDF_R	std	%f3, [%r9, %r8]
	.word 0xcb1a0009  ! 3102: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xcb3a2550  ! 3102: STDF_I	std	%f5, [0x0550, %r8]
	.word 0xc5220009  ! 3105: STF_R	st	%f2, [%r9, %r8]
	.word 0xe45a0009  ! 3105: LDX_R	ldx	[%r8 + %r9], %r18
	.word 0xc3f22009  ! 3105: CASXA_R	casxa	[%r8]%asi, %r9, %r1
	.word 0xc9220009  ! 3108: STF_R	st	%f4, [%r9, %r8]
	.word 0xfc4a0009  ! 3108: LDSB_R	ldsb	[%r8 + %r9], %r30
	.word 0xc36a2b3c  ! 3108: PREFETCH_I	prefetch	[%r8 + 0x0b3c], #one_read
	.word 0xd7220009  ! 3111: STF_R	st	%f11, [%r9, %r8]
	.word 0xf51a0009  ! 3111: LDDF_R	ldd	[%r8, %r9], %f26
	.word 0x8143e027  ! 3111: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #MemIssue 
	.word 0xf33a0009  ! 3114: STDF_R	std	%f25, [%r9, %r8]
	.word 0xe8120009  ! 3114: LDUH_R	lduh	[%r8 + %r9], %r20
	.word 0xe72222c4  ! 3114: STF_I	st	%f19, [0x02c4, %r8]
	.word 0xc9220009  ! 3117: STF_R	st	%f4, [%r9, %r8]
	.word 0xc45a0009  ! 3117: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0x8143c000  ! 3117: STBAR	stbar
	.word 0xc7220009  ! 3120: STF_R	st	%f3, [%r9, %r8]
	.word 0xc6420009  ! 3120: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xa27a2980  ! 3120: SDIV_I	sdiv 	%r8, 0x0980, %r17
	.word 0xca2a0009  ! 3123: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xca5a0009  ! 3123: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xc3ea1009  ! 3123: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc7220009  ! 3126: STF_R	st	%f3, [%r9, %r8]
	.word 0xe24a0009  ! 3126: LDSB_R	ldsb	[%r8 + %r9], %r17
	.word 0x8143c000  ! 3126: STBAR	stbar
	.word 0xc42a0009  ! 3129: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xf64a0009  ! 3129: LDSB_R	ldsb	[%r8 + %r9], %r27
	.word 0xc3ea1009  ! 3129: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xce320009  ! 3132: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc8120009  ! 3132: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xf8520009  ! 3132: LDSH_R	ldsh	[%r8 + %r9], %r28
	.word 0xd6320009  ! 3135: STH_R	sth	%r11, [%r8 + %r9]
	.word 0xc4420009  ! 3135: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0x8ada2a0c  ! 3135: SMULcc_I	smulcc 	%r8, 0x0a0c, %r5
	.word 0xcf220009  ! 3138: STF_R	st	%f7, [%r9, %r8]
	.word 0xf6020009  ! 3138: LDUW_R	lduw	[%r8 + %r9], %r27
	.word 0xc36a0009  ! 3138: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xce220009  ! 3141: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xce120009  ! 3141: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0x8143e000  ! 3141: MEMBAR	membar	
	.word 0xce720009  ! 3144: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc25a0009  ! 3144: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0x8143e07e  ! 3144: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xfb3a0009  ! 3147: STDF_R	std	%f29, [%r9, %r8]
	.word 0xf45a0009  ! 3147: LDX_R	ldx	[%r8 + %r9], %r26
	.word 0x964a0009  ! 3147: MULX_R	mulx 	%r8, %r9, %r11
	.word 0xda2a0009  ! 3150: STB_R	stb	%r13, [%r8 + %r9]
	.word 0xcc0a0009  ! 3150: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xc51a0009  ! 3150: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xcc320009  ! 3153: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xe0020009  ! 3153: LDUW_R	lduw	[%r8 + %r9], %r16
	.word 0x8ba208a9  ! 3153: FSUBs	fsubs	%f8, %f9, %f5
	.word 0xc82a0009  ! 3156: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xec420009  ! 3156: LDSW_R	ldsw	[%r8 + %r9], %r22
	.word 0xbf220009  ! 3156: MULScc_R	mulscc 	%r8, %r9, %r31
	.word 0xd8220009  ! 3159: STW_R	stw	%r12, [%r8 + %r9]
	.word 0xc6420009  ! 3159: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xc3ea1009  ! 3159: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xfc220009  ! 3162: STW_R	stw	%r30, [%r8 + %r9]
	.word 0xc64a0009  ! 3162: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xfaca1009  ! 3162: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r29
	.word 0xee320009  ! 3165: STH_R	sth	%r23, [%r8 + %r9]
	.word 0xc85a0009  ! 3165: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xc3ea2920  ! 3165: PREFETCHA_I	prefetcha	[%r8, + 0x0920] %asi, #one_read
	.word 0xcd3a0009  ! 3168: STDF_R	std	%f6, [%r9, %r8]
	.word 0xfa120009  ! 3168: LDUH_R	lduh	[%r8 + %r9], %r29
	.word 0x8143e065  ! 3168: MEMBAR	membar	#LoadLoad | #LoadStore | #MemIssue | #Sync 
	.word 0xca2a0009  ! 3171: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc51a0009  ! 3171: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xc86a0009  ! 3171: LDSTUB_R	ldstub	%r4, [%r8 + %r9]
	.word 0xfa720009  ! 3174: STX_R	stx	%r29, [%r8 + %r9]
	.word 0xde4a0009  ! 3174: LDSB_R	ldsb	[%r8 + %r9], %r15
	.word 0xc36a24d0  ! 3174: PREFETCH_I	prefetch	[%r8 + 0x04d0], #one_read
	.word 0xc4320009  ! 3177: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc2120009  ! 3177: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xc48a1009  ! 3177: LDUBA_R	lduba	[%r8, %r9] 0x80, %r2
	.word 0xda720009  ! 3180: STX_R	stx	%r13, [%r8 + %r9]
	.word 0xc2120009  ! 3180: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0x85a20929  ! 3180: FMULs	fmuls	%f8, %f9, %f2
	.word 0xeb3a0009  ! 3183: STDF_R	std	%f21, [%r9, %r8]
	.word 0xc24a0009  ! 3183: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0x8c7a226c  ! 3183: SDIV_I	sdiv 	%r8, 0x026c, %r6
	.word 0xee320009  ! 3186: STH_R	sth	%r23, [%r8 + %r9]
	.word 0xc4420009  ! 3186: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0x8da20829  ! 3186: FADDs	fadds	%f8, %f9, %f6
	.word 0xca2a0009  ! 3189: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xcc420009  ! 3189: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0x85220009  ! 3189: MULScc_R	mulscc 	%r8, %r9, %r2
	.word 0xec720009  ! 3192: STX_R	stx	%r22, [%r8 + %r9]
	.word 0xc45a0009  ! 3192: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0x26800001  ! 3192: BL	bl,a	<label_0x1>
	.word 0xc2320009  ! 3195: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc2420009  ! 3195: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xfcba1009  ! 3195: STDA_R	stda	%r30, [%r8 + %r9] 0x80
	.word 0xcb3a0009  ! 3198: STDF_R	std	%f5, [%r9, %r8]
	.word 0xed1a0009  ! 3198: LDDF_R	ldd	[%r8, %r9], %f22
	.word 0xce020009  ! 3198: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xfe720009  ! 3201: STX_R	stx	%r31, [%r8 + %r9]
	.word 0xc5020009  ! 3201: LDF_R	ld	[%r8, %r9], %f2
	.word 0xc7e22009  ! 3201: CASA_R	casa	[%r8] %asi, %r9, %r3
	.word 0xc53a0009  ! 3204: STDF_R	std	%f2, [%r9, %r8]
	.word 0xcc5a0009  ! 3204: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xc0ba1009  ! 3204: STDA_R	stda	%r0, [%r8 + %r9] 0x80
	.word 0xc42a0009  ! 3207: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xca520009  ! 3207: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0x8143e01c  ! 3207: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside 
	.word 0xcc2a0009  ! 3210: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc20a0009  ! 3210: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0x856a2afc  ! 3210: SDIVX_I	sdivx	%r8, 0x0afc, %r2
	.word 0xe8720009  ! 3213: STX_R	stx	%r20, [%r8 + %r9]
	.word 0xd8120009  ! 3213: LDUH_R	lduh	[%r8 + %r9], %r12
	.word 0xfbf21009  ! 3213: CASXA_I	casxa	[%r8] 0x80, %r9, %r29
	.word 0xc9220009  ! 3216: STF_R	st	%f4, [%r9, %r8]
	.word 0xc40a0009  ! 3216: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xbb222504  ! 3216: MULScc_I	mulscc 	%r8, 0x0504, %r29
	.word 0xca720009  ! 3219: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xe11a0009  ! 3219: LDDF_R	ldd	[%r8, %r9], %f16
	.word 0xe4a22f34  ! 3219: STWA_I	stwa	%r18, [%r8 + 0x0f34] %asi
	.word 0xd62a0009  ! 3222: STB_R	stb	%r11, [%r8 + %r9]
	.word 0xce020009  ! 3222: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xcec21009  ! 3222: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r7
	.word 0xc73a0009  ! 3225: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc4520009  ! 3225: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0x9afa0009  ! 3225: SDIVcc_R	sdivcc 	%r8, %r9, %r13
	.word 0xe8320009  ! 3228: STH_R	sth	%r20, [%r8 + %r9]
	.word 0xcc420009  ! 3228: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0x8e6a0009  ! 3228: UDIVX_R	udivx 	%r8, %r9, %r7
	.word 0xc8320009  ! 3231: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xcc420009  ! 3231: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xc36a2c84  ! 3231: PREFETCH_I	prefetch	[%r8 + 0x0c84], #one_read
	.word 0xc3220009  ! 3234: STF_R	st	%f1, [%r9, %r8]
	.word 0xc4520009  ! 3234: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xbeda0009  ! 3234: SMULcc_R	smulcc 	%r8, %r9, %r31
	.word 0xcc220009  ! 3237: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc44a0009  ! 3237: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0x8143e063  ! 3237: MEMBAR	membar	#LoadLoad | #StoreLoad | #MemIssue | #Sync 
	.word 0xc73a0009  ! 3240: STDF_R	std	%f3, [%r9, %r8]
	.word 0xf8520009  ! 3240: LDSH_R	ldsh	[%r8 + %r9], %r28
	.word 0x8143e053  ! 3240: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside | #Sync 
	.word 0xca320009  ! 3243: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xce0a0009  ! 3243: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0x8143c000  ! 3243: STBAR	stbar
	.word 0xcb220009  ! 3246: STF_R	st	%f5, [%r9, %r8]
	.word 0xc9020009  ! 3246: LDF_R	ld	[%r8, %r9], %f4
	.word 0x40000001  ! 3246: CALL	call	disp30_1
	.word 0xc82a0009  ! 3249: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc65a0009  ! 3249: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xc3ea24a8  ! 3249: PREFETCHA_I	prefetcha	[%r8, + 0x04a8] %asi, #one_read
	.word 0xca320009  ! 3252: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xec4a0009  ! 3252: LDSB_R	ldsb	[%r8 + %r9], %r22
	.word 0x864a2a38  ! 3252: MULX_I	mulx 	%r8, 0x0a38, %r3
	.word 0xc2720009  ! 3255: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xd7020009  ! 3255: LDF_R	ld	[%r8, %r9], %f11
	.word 0x02c20001  ! 3255: BRZ	brz  ,nt	%8,<label_0x20001>
	.word 0xf73a0009  ! 3258: STDF_R	std	%f27, [%r9, %r8]
	.word 0xc4420009  ! 3258: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0x0c800002  ! 3258: BNEG	bneg  	<label_0x2>
	.word 0xf82a0009  ! 3261: STB_R	stb	%r28, [%r8 + %r9]
	.word 0xc84a0009  ! 3261: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xc3ea1009  ! 3261: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc9220009  ! 3264: STF_R	st	%f4, [%r9, %r8]
	.word 0xdc020009  ! 3264: LDUW_R	lduw	[%r8 + %r9], %r14
	.word 0xc9222908  ! 3264: STF_I	st	%f4, [0x0908, %r8]
	.word 0xcf220009  ! 3267: STF_R	st	%f7, [%r9, %r8]
	.word 0xc8020009  ! 3267: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xcea22c10  ! 3267: STWA_I	stwa	%r7, [%r8 + 0x0c10] %asi
	.word 0xc6720009  ! 3270: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc9020009  ! 3270: LDF_R	ld	[%r8, %r9], %f4
	.word 0xc2ea1009  ! 3270: LDSTUBA_R	ldstuba	%r1, [%r8 + %r9] 0x80
	.word 0xd62a0009  ! 3273: STB_R	stb	%r11, [%r8 + %r9]
	.word 0xef020009  ! 3273: LDF_R	ld	[%r8, %r9], %f23
	.word 0xa9220009  ! 3273: MULScc_R	mulscc 	%r8, %r9, %r20
	.word 0xc8720009  ! 3276: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc85a0009  ! 3276: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xd8ba23e0  ! 3276: STDA_I	stda	%r12, [%r8 + 0x03e0] %asi
	.word 0xf9220009  ! 3279: STF_R	st	%f28, [%r9, %r8]
	.word 0xfd1a0009  ! 3279: LDDF_R	ldd	[%r8, %r9], %f30
	.word 0xcef21009  ! 3279: STXA_R	stxa	%r7, [%r8 + %r9] 0x80
	.word 0xca720009  ! 3282: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xdd1a0009  ! 3282: LDDF_R	ldd	[%r8, %r9], %f14
	.word 0xcab21009  ! 3282: STHA_R	stha	%r5, [%r8 + %r9] 0x80
	.word 0xe8720009  ! 3285: STX_R	stx	%r20, [%r8 + %r9]
	.word 0xe24a0009  ! 3285: LDSB_R	ldsb	[%r8 + %r9], %r17
	.word 0xc3020009  ! 3285: LDF_R	ld	[%r8, %r9], %f1
	.word 0xdd220009  ! 3288: STF_R	st	%f14, [%r9, %r8]
	.word 0xea020009  ! 3288: LDUW_R	lduw	[%r8 + %r9], %r21
	.word 0x84d20009  ! 3288: UMULcc_R	umulcc 	%r8, %r9, %r2
	.word 0xce320009  ! 3291: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xde4a0009  ! 3291: LDSB_R	ldsb	[%r8 + %r9], %r15
	.word 0xc3ea2e3c  ! 3291: PREFETCHA_I	prefetcha	[%r8, + 0x0e3c] %asi, #one_read
	.word 0xc4720009  ! 3294: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xfa4a0009  ! 3294: LDSB_R	ldsb	[%r8 + %r9], %r29
	.word 0xf73a2660  ! 3294: STDF_I	std	%f27, [0x0660, %r8]
	.word 0xde320009  ! 3297: STH_R	sth	%r15, [%r8 + %r9]
	.word 0xc71a0009  ! 3297: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xc7e22009  ! 3297: CASA_R	casa	[%r8] %asi, %r9, %r3
	.word 0xca2a0009  ! 3300: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xf84a0009  ! 3300: LDSB_R	ldsb	[%r8 + %r9], %r28
	.word 0xcf022148  ! 3300: LDF_I	ld	[%r8, 0x0148], %f7
	.word 0xfc2a0009  ! 3303: STB_R	stb	%r30, [%r8 + %r9]
	.word 0xca520009  ! 3303: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xc6522490  ! 3303: LDSH_I	ldsh	[%r8 + 0x0490], %r3
	.word 0xc22a0009  ! 3306: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xca0a0009  ! 3306: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0x8143c000  ! 3306: STBAR	stbar
	.word 0xc82a0009  ! 3309: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xca520009  ! 3309: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xcc022c3c  ! 3309: LDUW_I	lduw	[%r8 + 0x0c3c], %r6
	.word 0xc22a0009  ! 3312: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xcc520009  ! 3312: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xe33a27b0  ! 3312: STDF_I	std	%f17, [0x07b0, %r8]
	.word 0xe73a0009  ! 3315: STDF_R	std	%f19, [%r9, %r8]
	.word 0xce5a0009  ! 3315: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xb85a2ae4  ! 3315: SMUL_I	smul 	%r8, 0x0ae4, %r28
	.word 0xf93a0009  ! 3318: STDF_R	std	%f28, [%r9, %r8]
	.word 0xc25a0009  ! 3318: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xc6921009  ! 3318: LDUHA_R	lduha	[%r8, %r9] 0x80, %r3
	.word 0xcf3a0009  ! 3321: STDF_R	std	%f7, [%r9, %r8]
	.word 0xce120009  ! 3321: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0x08800002  ! 3321: BLEU	bleu  	<label_0x2>
	.word 0xc7220009  ! 3324: STF_R	st	%f3, [%r9, %r8]
	.word 0xca420009  ! 3324: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xca420009  ! 3324: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xd82a0009  ! 3327: STB_R	stb	%r12, [%r8 + %r9]
	.word 0xc6420009  ! 3327: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0x8eda0009  ! 3327: SMULcc_R	smulcc 	%r8, %r9, %r7
	.word 0xc33a0009  ! 3330: STDF_R	std	%f1, [%r9, %r8]
	.word 0xf44a0009  ! 3330: LDSB_R	ldsb	[%r8 + %r9], %r26
	.word 0xc3ea1009  ! 3330: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xf2720009  ! 3333: STX_R	stx	%r25, [%r8 + %r9]
	.word 0xca5a0009  ! 3333: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xa1a20829  ! 3333: FADDs	fadds	%f8, %f9, %f16
	.word 0xce720009  ! 3336: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc31a0009  ! 3336: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xc4ba2980  ! 3336: STDA_I	stda	%r2, [%r8 + 0x0980] %asi
	.word 0xc4220009  ! 3339: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc40a0009  ! 3339: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xc6da25f0  ! 3339: LDXA_I	ldxa	[%r8, + 0x05f0] %asi, %r3
	.word 0xcd220009  ! 3342: STF_R	st	%f6, [%r9, %r8]
	.word 0xe6120009  ! 3342: LDUH_R	lduh	[%r8 + %r9], %r19
	.word 0xdca21009  ! 3342: STWA_R	stwa	%r14, [%r8 + %r9] 0x80
	.word 0xc6320009  ! 3345: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xca420009  ! 3345: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xc87a2ed8  ! 3345: SWAP_I	swap	%r4, [%r8 + 0x0ed8]
	.word 0xf53a0009  ! 3348: STDF_R	std	%f26, [%r9, %r8]
	.word 0xc6420009  ! 3348: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0x8143e059  ! 3348: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside | #Sync 
	.word 0xc4220009  ! 3351: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc31a0009  ! 3351: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0x9c522058  ! 3351: UMUL_I	umul 	%r8, 0x0058, %r14
	.word 0xfa220009  ! 3354: STW_R	stw	%r29, [%r8 + %r9]
	.word 0xc6420009  ! 3354: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xc8120009  ! 3354: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xc7220009  ! 3357: STF_R	st	%f3, [%r9, %r8]
	.word 0xc8420009  ! 3357: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xc8420009  ! 3357: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xc8320009  ! 3360: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc6020009  ! 3360: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xcde21009  ! 3360: CASA_I	casa	[%r8] 0x80, %r9, %r6
	.word 0xfc2a0009  ! 3363: STB_R	stb	%r30, [%r8 + %r9]
	.word 0xf6420009  ! 3363: LDSW_R	ldsw	[%r8 + %r9], %r27
	.word 0xc3ea1009  ! 3363: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xfa720009  ! 3366: STX_R	stx	%r29, [%r8 + %r9]
	.word 0xfa0a0009  ! 3366: LDUB_R	ldub	[%r8 + %r9], %r29
	.word 0xb07a0009  ! 3366: SDIV_R	sdiv 	%r8, %r9, %r24
	.word 0xc4320009  ! 3369: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc65a0009  ! 3369: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0x18800001  ! 3369: BGU	bgu  	<label_0x1>
	.word 0xce220009  ! 3372: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc6020009  ! 3372: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xfc7a0009  ! 3372: SWAP_R	swap	%r30, [%r8 + %r9]
	.word 0xc82a0009  ! 3375: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc3020009  ! 3375: LDF_R	ld	[%r8, %r9], %f1
	.word 0xc2aa21d4  ! 3375: STBA_I	stba	%r1, [%r8 + 0x01d4] %asi
	.word 0xcf3a0009  ! 3378: STDF_R	std	%f7, [%r9, %r8]
	.word 0xe4520009  ! 3378: LDSH_R	ldsh	[%r8 + %r9], %r18
	.word 0xf6ca1009  ! 3378: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r27
	.word 0xc62a0009  ! 3381: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc64a0009  ! 3381: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xc8ba20a0  ! 3381: STDA_I	stda	%r4, [%r8 + 0x00a0] %asi
	.word 0xe4720009  ! 3384: STX_R	stx	%r18, [%r8 + %r9]
	.word 0xe7020009  ! 3384: LDF_R	ld	[%r8, %r9], %f19
	.word 0xc3ea1009  ! 3384: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc4720009  ! 3387: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc51a0009  ! 3387: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xec8a2d84  ! 3387: LDUBA_I	lduba	[%r8, + 0x0d84] %asi, %r22
	.word 0xf7220009  ! 3390: STF_R	st	%f27, [%r9, %r8]
	.word 0xfe0a0009  ! 3390: LDUB_R	ldub	[%r8 + %r9], %r31
	.word 0xcde22009  ! 3390: CASA_R	casa	[%r8] %asi, %r9, %r6
	.word 0xce220009  ! 3393: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xce4a0009  ! 3393: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xc9e22009  ! 3393: CASA_R	casa	[%r8] %asi, %r9, %r4
	.word 0xcc2a0009  ! 3396: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc51a0009  ! 3396: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xc8da1009  ! 3396: LDXA_R	ldxa	[%r8, %r9] 0x80, %r4
	.word 0xf93a0009  ! 3399: STDF_R	std	%f28, [%r9, %r8]
	.word 0xce020009  ! 3399: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xfeaa2a8c  ! 3399: STBA_I	stba	%r31, [%r8 + 0x0a8c] %asi
	.word 0xec2a0009  ! 3402: STB_R	stb	%r22, [%r8 + %r9]
	.word 0xca520009  ! 3402: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0x02ca0001  ! 3402: BRZ	brz  ,pt	%8,<label_0xa0001>
	.word 0xc6220009  ! 3405: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xdc120009  ! 3405: LDUH_R	lduh	[%r8 + %r9], %r14
	.word 0xcc020009  ! 3405: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xc3220009  ! 3408: STF_R	st	%f1, [%r9, %r8]
	.word 0xc85a0009  ! 3408: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0x24c20001  ! 3408: BRLEZ	brlez,a,nt	%8,<label_0x20001>
	.word 0xc22a0009  ! 3411: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc64a0009  ! 3411: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xceea1009  ! 3411: LDSTUBA_R	ldstuba	%r7, [%r8 + %r9] 0x80
	.word 0xe8220009  ! 3414: STW_R	stw	%r20, [%r8 + %r9]
	.word 0xc60a0009  ! 3414: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xcf3a0009  ! 3414: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc2320009  ! 3417: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xce4a0009  ! 3417: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xbc7a0009  ! 3417: SDIV_R	sdiv 	%r8, %r9, %r30
	.word 0xdb3a0009  ! 3420: STDF_R	std	%f13, [%r9, %r8]
	.word 0xcc420009  ! 3420: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xc7e21009  ! 3420: CASA_I	casa	[%r8] 0x80, %r9, %r3
	.word 0xcd3a0009  ! 3423: STDF_R	std	%f6, [%r9, %r8]
	.word 0xf6420009  ! 3423: LDSW_R	ldsw	[%r8 + %r9], %r27
	.word 0xf8d21009  ! 3423: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r28
	.word 0xce320009  ! 3426: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xdc5a0009  ! 3426: LDX_R	ldx	[%r8 + %r9], %r14
	.word 0xf6520009  ! 3426: LDSH_R	ldsh	[%r8 + %r9], %r27
	.word 0xfe2a0009  ! 3429: STB_R	stb	%r31, [%r8 + %r9]
	.word 0xe60a0009  ! 3429: LDUB_R	ldub	[%r8 + %r9], %r19
	.word 0xceaa1009  ! 3429: STBA_R	stba	%r7, [%r8 + %r9] 0x80
	.word 0xc4320009  ! 3432: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc84a0009  ! 3432: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0x89a208a9  ! 3432: FSUBs	fsubs	%f8, %f9, %f4
	.word 0xcf220009  ! 3435: STF_R	st	%f7, [%r9, %r8]
	.word 0xc31a0009  ! 3435: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xc3ea2430  ! 3435: PREFETCHA_I	prefetcha	[%r8, + 0x0430] %asi, #one_read
	.word 0xc7220009  ! 3438: STF_R	st	%f3, [%r9, %r8]
	.word 0xc45a0009  ! 3438: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xf92227ac  ! 3438: STF_I	st	%f28, [0x07ac, %r8]
	.word 0xee320009  ! 3441: STH_R	sth	%r23, [%r8 + %r9]
	.word 0xc71a0009  ! 3441: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xc36a0009  ! 3441: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xcb220009  ! 3444: STF_R	st	%f5, [%r9, %r8]
	.word 0xfa520009  ! 3444: LDSH_R	ldsh	[%r8 + %r9], %r29
	.word 0x8da208a9  ! 3444: FSUBs	fsubs	%f8, %f9, %f6
	.word 0xc6220009  ! 3447: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc8120009  ! 3447: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0x24c20001  ! 3447: BRLEZ	brlez,a,nt	%8,<label_0x20001>
	.word 0xcd3a0009  ! 3450: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc6120009  ! 3450: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xcf3a2068  ! 3450: STDF_I	std	%f7, [0x0068, %r8]
	.word 0xc6220009  ! 3453: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc25a0009  ! 3453: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0x8143e023  ! 3453: MEMBAR	membar	#LoadLoad | #StoreLoad | #MemIssue 
	.word 0xdd220009  ! 3456: STF_R	st	%f14, [%r9, %r8]
	.word 0xc31a0009  ! 3456: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xc3f22009  ! 3456: CASXA_R	casxa	[%r8]%asi, %r9, %r1
	.word 0xc42a0009  ! 3459: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xfa120009  ! 3459: LDUH_R	lduh	[%r8 + %r9], %r29
	.word 0x16800001  ! 3459: BGE	bge  	<label_0x1>
	.word 0xcd220009  ! 3462: STF_R	st	%f6, [%r9, %r8]
	.word 0xe2520009  ! 3462: LDSH_R	ldsh	[%r8 + %r9], %r17
	.word 0xc2520009  ! 3462: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xd62a0009  ! 3465: STB_R	stb	%r11, [%r8 + %r9]
	.word 0xda120009  ! 3465: LDUH_R	lduh	[%r8 + %r9], %r13
	.word 0x36800002  ! 3465: BGE	bge,a	<label_0x2>
	.word 0xe0320009  ! 3468: STH_R	sth	%r16, [%r8 + %r9]
	.word 0xf71a0009  ! 3468: LDDF_R	ldd	[%r8, %r9], %f27
	.word 0xec420009  ! 3468: LDSW_R	ldsw	[%r8 + %r9], %r22
	.word 0xc6220009  ! 3471: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xca520009  ! 3471: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0x2c800001  ! 3471: BNEG	bneg,a	<label_0x1>
	.word 0xe8720009  ! 3474: STX_R	stx	%r20, [%r8 + %r9]
	.word 0xf7020009  ! 3474: LDF_R	ld	[%r8, %r9], %f27
	.word 0x8143e05a  ! 3474: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside | #Sync 
	.word 0xcf3a0009  ! 3477: STDF_R	std	%f7, [%r9, %r8]
	.word 0xca420009  ! 3477: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0x36800001  ! 3477: BGE	bge,a	<label_0x1>
	.word 0xc33a0009  ! 3480: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc2420009  ! 3480: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xc6522444  ! 3480: LDSH_I	ldsh	[%r8 + 0x0444], %r3
	.word 0xdd3a0009  ! 3483: STDF_R	std	%f14, [%r9, %r8]
	.word 0xc85a0009  ! 3483: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xbe7a2c04  ! 3483: SDIV_I	sdiv 	%r8, 0x0c04, %r31
	.word 0xc42a0009  ! 3486: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc2120009  ! 3486: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0x84522838  ! 3486: UMUL_I	umul 	%r8, 0x0838, %r2
	.word 0xc53a0009  ! 3489: STDF_R	std	%f2, [%r9, %r8]
	.word 0xe4020009  ! 3489: LDUW_R	lduw	[%r8 + %r9], %r18
	.word 0xc41a2900  ! 3489: LDD_I	ldd	[%r8 + 0x0900], %r2
	.word 0xfe320009  ! 3492: STH_R	sth	%r31, [%r8 + %r9]
	.word 0xe11a0009  ! 3492: LDDF_R	ldd	[%r8, %r9], %f16
	.word 0x8143c000  ! 3492: STBAR	stbar
	.word 0xcb3a0009  ! 3495: STDF_R	std	%f5, [%r9, %r8]
	.word 0xc9020009  ! 3495: LDF_R	ld	[%r8, %r9], %f4
	.word 0x9e720009  ! 3495: UDIV_R	udiv 	%r8, %r9, %r15
	.word 0xcd220009  ! 3498: STF_R	st	%f6, [%r9, %r8]
	.word 0xe8520009  ! 3498: LDSH_R	ldsh	[%r8 + %r9], %r20
	.word 0x0a800002  ! 3498: BCS	bcs  	<label_0x2>
	.word 0xfa220009  ! 3501: STW_R	stw	%r29, [%r8 + %r9]
	.word 0xcc4a0009  ! 3501: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xc2c21009  ! 3501: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r1
	.word 0xc3220009  ! 3504: STF_R	st	%f1, [%r9, %r8]
	.word 0xc44a0009  ! 3504: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0x8ef20009  ! 3504: UDIVcc_R	udivcc 	%r8, %r9, %r7
	.word 0xe6220009  ! 3507: STW_R	stw	%r19, [%r8 + %r9]
	.word 0xcd020009  ! 3507: LDF_R	ld	[%r8, %r9], %f6
	.word 0xb1a20929  ! 3507: FMULs	fmuls	%f8, %f9, %f24
	.word 0xf22a0009  ! 3510: STB_R	stb	%r25, [%r8 + %r9]
	.word 0xd84a0009  ! 3510: LDSB_R	ldsb	[%r8 + %r9], %r12
	.word 0x8143c000  ! 3510: STBAR	stbar
	.word 0xc4320009  ! 3513: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc2420009  ! 3513: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xc9e21009  ! 3513: CASA_I	casa	[%r8] 0x80, %r9, %r4
	.word 0xcc320009  ! 3516: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc40a0009  ! 3516: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xcafa1009  ! 3516: SWAPA_R	swapa	%r5, [%r8 + %r9] 0x80
	.word 0xc73a0009  ! 3519: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc20a0009  ! 3519: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xfef21009  ! 3519: STXA_R	stxa	%r31, [%r8 + %r9] 0x80
	.word 0xe62a0009  ! 3522: STB_R	stb	%r19, [%r8 + %r9]
	.word 0xca520009  ! 3522: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xc9e21009  ! 3522: CASA_I	casa	[%r8] 0x80, %r9, %r4
	.word 0xc93a0009  ! 3525: STDF_R	std	%f4, [%r9, %r8]
	.word 0xc80a0009  ! 3525: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xa56a275c  ! 3525: SDIVX_I	sdivx	%r8, 0x075c, %r18
	.word 0xfe220009  ! 3528: STW_R	stw	%r31, [%r8 + %r9]
	.word 0xce4a0009  ! 3528: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0x04ca0001  ! 3528: BRLEZ	brlez  ,pt	%8,<label_0xa0001>
	.word 0xca2a0009  ! 3531: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xcc5a0009  ! 3531: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xc2921009  ! 3531: LDUHA_R	lduha	[%r8, %r9] 0x80, %r1
	.word 0xce320009  ! 3534: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xcf020009  ! 3534: LDF_R	ld	[%r8, %r9], %f7
	.word 0xde5a2298  ! 3534: LDX_I	ldx	[%r8 + 0x0298], %r15
	.word 0xc7220009  ! 3537: STF_R	st	%f3, [%r9, %r8]
	.word 0xfe420009  ! 3537: LDSW_R	ldsw	[%r8 + %r9], %r31
	.word 0xc3ea1009  ! 3537: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc5220009  ! 3540: STF_R	st	%f2, [%r9, %r8]
	.word 0xf0420009  ! 3540: LDSW_R	ldsw	[%r8 + %r9], %r24
	.word 0xc3ea2be8  ! 3540: PREFETCHA_I	prefetcha	[%r8, + 0x0be8] %asi, #one_read
	.word 0xf82a0009  ! 3543: STB_R	stb	%r28, [%r8 + %r9]
	.word 0xfc5a0009  ! 3543: LDX_R	ldx	[%r8 + %r9], %r30
	.word 0xaa722fc8  ! 3543: UDIV_I	udiv 	%r8, 0x0fc8, %r21
	.word 0xce320009  ! 3546: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xca4a0009  ! 3546: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0x2cca0001  ! 3546: BRGZ	brgz,a,pt	%8,<label_0xa0001>
	.word 0xc73a0009  ! 3549: STDF_R	std	%f3, [%r9, %r8]
	.word 0xce420009  ! 3549: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0x8e6a2138  ! 3549: UDIVX_I	udivx 	%r8, 0x0138, %r7
	.word 0xfa2a0009  ! 3552: STB_R	stb	%r29, [%r8 + %r9]
	.word 0xc2520009  ! 3552: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xc66a2a44  ! 3552: LDSTUB_I	ldstub	%r3, [%r8 + 0x0a44]
	.word 0xc4320009  ! 3555: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xcd020009  ! 3555: LDF_R	ld	[%r8, %r9], %f6
	.word 0xcb222800  ! 3555: STF_I	st	%f5, [0x0800, %r8]
	.word 0xc4320009  ! 3558: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xd9020009  ! 3558: LDF_R	ld	[%r8, %r9], %f12
	.word 0xc3ea1009  ! 3558: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc53a0009  ! 3561: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc8520009  ! 3561: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xc4822020  ! 3561: LDUWA_I	lduwa	[%r8, + 0x0020] %asi, %r2
	.word 0xc42a0009  ! 3564: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc7020009  ! 3564: LDF_R	ld	[%r8, %r9], %f3
	.word 0x2cc20001  ! 3564: BRGZ	brgz,a,nt	%8,<label_0x20001>
	.word 0xc8320009  ! 3567: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc2120009  ! 3567: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xc3ea2fdc  ! 3567: PREFETCHA_I	prefetcha	[%r8, + 0x0fdc] %asi, #one_read
	.word 0xc7220009  ! 3570: STF_R	st	%f3, [%r9, %r8]
	.word 0xc20a0009  ! 3570: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xca6a2e30  ! 3570: LDSTUB_I	ldstub	%r5, [%r8 + 0x0e30]
	.word 0xfe320009  ! 3573: STH_R	sth	%r31, [%r8 + %r9]
	.word 0xc8520009  ! 3573: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xc89220c4  ! 3573: LDUHA_I	lduha	[%r8, + 0x00c4] %asi, %r4
	.word 0xca2a0009  ! 3576: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xca0a0009  ! 3576: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xcc0a25c8  ! 3576: LDUB_I	ldub	[%r8 + 0x05c8], %r6
	.word 0xcc720009  ! 3579: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc6020009  ! 3579: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xce420009  ! 3579: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xce320009  ! 3582: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xcb1a0009  ! 3582: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0x8143c000  ! 3582: STBAR	stbar
	.word 0xc7220009  ! 3585: STF_R	st	%f3, [%r9, %r8]
	.word 0xc4120009  ! 3585: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xc9f21009  ! 3585: CASXA_I	casxa	[%r8] 0x80, %r9, %r4
	.word 0xcb3a0009  ! 3588: STDF_R	std	%f5, [%r9, %r8]
	.word 0xf0420009  ! 3588: LDSW_R	ldsw	[%r8 + %r9], %r24
	.word 0x8f222cb8  ! 3588: MULScc_I	mulscc 	%r8, 0x0cb8, %r7
	.word 0xc9220009  ! 3591: STF_R	st	%f4, [%r9, %r8]
	.word 0xc6420009  ! 3591: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xc67a0009  ! 3591: SWAP_R	swap	%r3, [%r8 + %r9]
	.word 0xc6220009  ! 3594: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xca120009  ! 3594: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0x827a0009  ! 3594: SDIV_R	sdiv 	%r8, %r9, %r1
	.word 0xde320009  ! 3597: STH_R	sth	%r15, [%r8 + %r9]
	.word 0xe8020009  ! 3597: LDUW_R	lduw	[%r8 + %r9], %r20
	.word 0x86f22d24  ! 3597: UDIVcc_I	udivcc 	%r8, 0x0d24, %r3
	.word 0xc22a0009  ! 3600: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xe4120009  ! 3600: LDUH_R	lduh	[%r8 + %r9], %r18
	.word 0x89220009  ! 3600: MULScc_R	mulscc 	%r8, %r9, %r4
	.word 0xcf220009  ! 3603: STF_R	st	%f7, [%r9, %r8]
	.word 0xd8420009  ! 3603: LDSW_R	ldsw	[%r8 + %r9], %r12
	.word 0x22800002  ! 3603: BE	be,a	<label_0x2>
	.word 0xc93a0009  ! 3606: STDF_R	std	%f4, [%r9, %r8]
	.word 0xc44a0009  ! 3606: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xceca1009  ! 3606: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r7
	.word 0xc5220009  ! 3609: STF_R	st	%f2, [%r9, %r8]
	.word 0xdc4a0009  ! 3609: LDSB_R	ldsb	[%r8 + %r9], %r14
	.word 0xc6f22c70  ! 3609: STXA_I	stxa	%r3, [%r8 + 0x0c70] %asi
	.word 0xc9220009  ! 3612: STF_R	st	%f4, [%r9, %r8]
	.word 0xc4420009  ! 3612: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xc36a2e00  ! 3612: PREFETCH_I	prefetch	[%r8 + 0x0e00], #one_read
	.word 0xe9220009  ! 3615: STF_R	st	%f20, [%r9, %r8]
	.word 0xf45a0009  ! 3615: LDX_R	ldx	[%r8 + %r9], %r26
	.word 0x8143c000  ! 3615: STBAR	stbar
	.word 0xcc720009  ! 3618: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xfc120009  ! 3618: LDUH_R	lduh	[%r8 + %r9], %r30
	.word 0x84720009  ! 3618: UDIV_R	udiv 	%r8, %r9, %r2
	.word 0xc93a0009  ! 3621: STDF_R	std	%f4, [%r9, %r8]
	.word 0xe80a0009  ! 3621: LDUB_R	ldub	[%r8 + %r9], %r20
	.word 0xf65a27e8  ! 3621: LDX_I	ldx	[%r8 + 0x07e8], %r27
	.word 0xc8320009  ! 3624: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xf4120009  ! 3624: LDUH_R	lduh	[%r8 + %r9], %r26
	.word 0xe4ba2c78  ! 3624: STDA_I	stda	%r18, [%r8 + 0x0c78] %asi
	.word 0xcb3a0009  ! 3627: STDF_R	std	%f5, [%r9, %r8]
	.word 0xc8520009  ! 3627: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xbda20829  ! 3627: FADDs	fadds	%f8, %f9, %f30
	.word 0xc62a0009  ! 3630: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xce520009  ! 3630: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xc3ea2464  ! 3630: PREFETCHA_I	prefetcha	[%r8, + 0x0464] %asi, #one_read
	.word 0xfa720009  ! 3633: STX_R	stx	%r29, [%r8 + %r9]
	.word 0xce4a0009  ! 3633: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xc3ea2c9c  ! 3633: PREFETCHA_I	prefetcha	[%r8, + 0x0c9c] %asi, #one_read
	.word 0xcc720009  ! 3636: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc25a0009  ! 3636: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xcc8a1009  ! 3636: LDUBA_R	lduba	[%r8, %r9] 0x80, %r6
	.word 0xfb3a0009  ! 3639: STDF_R	std	%f29, [%r9, %r8]
	.word 0xce120009  ! 3639: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xcc821009  ! 3639: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r6
	.word 0xe2320009  ! 3642: STH_R	sth	%r17, [%r8 + %r9]
	.word 0xc4420009  ! 3642: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xc3ea1009  ! 3642: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc33a0009  ! 3645: STDF_R	std	%f1, [%r9, %r8]
	.word 0xde520009  ! 3645: LDSH_R	ldsh	[%r8 + %r9], %r15
	.word 0x8143e053  ! 3645: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside | #Sync 
	.word 0xca220009  ! 3648: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xf2420009  ! 3648: LDSW_R	ldsw	[%r8 + %r9], %r25
	.word 0x26ca0001  ! 3648: BRLZ	brlz,a,pt	%8,<label_0xa0001>
	.word 0xc6320009  ! 3651: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc64a0009  ! 3651: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0x8a720009  ! 3651: UDIV_R	udiv 	%r8, %r9, %r5
	.word 0xee220009  ! 3654: STW_R	stw	%r23, [%r8 + %r9]
	.word 0xc24a0009  ! 3654: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0x0ac20001  ! 3654: BRNZ	brnz  ,nt	%8,<label_0x20001>
	.word 0xe9220009  ! 3657: STF_R	st	%f20, [%r9, %r8]
	.word 0xfd020009  ! 3657: LDF_R	ld	[%r8, %r9], %f30
	.word 0xc71a0009  ! 3657: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xc33a0009  ! 3660: STDF_R	std	%f1, [%r9, %r8]
	.word 0xdf1a0009  ! 3660: LDDF_R	ldd	[%r8, %r9], %f15
	.word 0xcc8a2004  ! 3660: LDUBA_I	lduba	[%r8, + 0x0004] %asi, %r6
	.word 0xc93a0009  ! 3663: STDF_R	std	%f4, [%r9, %r8]
	.word 0xca420009  ! 3663: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xc88222c8  ! 3663: LDUWA_I	lduwa	[%r8, + 0x02c8] %asi, %r4
	.word 0xc53a0009  ! 3666: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc80a0009  ! 3666: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xccaa2a14  ! 3666: STBA_I	stba	%r6, [%r8 + 0x0a14] %asi
	.word 0xca720009  ! 3669: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc45a0009  ! 3669: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0x8143c000  ! 3669: STBAR	stbar
	.word 0xc8320009  ! 3672: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc24a0009  ! 3672: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0x8143c000  ! 3672: STBAR	stbar
	.word 0xc4220009  ! 3675: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xcc520009  ! 3675: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0x3c800002  ! 3675: BPOS	bpos,a	<label_0x2>
	.word 0xd7220009  ! 3678: STF_R	st	%f11, [%r9, %r8]
	.word 0xc2520009  ! 3678: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xc4ba2580  ! 3678: STDA_I	stda	%r2, [%r8 + 0x0580] %asi
	.word 0xcb3a0009  ! 3681: STDF_R	std	%f5, [%r9, %r8]
	.word 0xce0a0009  ! 3681: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xf1220009  ! 3681: STF_R	st	%f24, [%r9, %r8]
	.word 0xce720009  ! 3684: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xcf1a0009  ! 3684: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xa4522660  ! 3684: UMUL_I	umul 	%r8, 0x0660, %r18
	.word 0xcb220009  ! 3687: STF_R	st	%f5, [%r9, %r8]
	.word 0xf45a0009  ! 3687: LDX_R	ldx	[%r8 + %r9], %r26
	.word 0xf4ea2ec0  ! 3687: LDSTUBA_I	ldstuba	%r26, [%r8 + 0x0ec0] %asi
	.word 0xf9220009  ! 3690: STF_R	st	%f28, [%r9, %r8]
	.word 0xcc020009  ! 3690: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xdff21009  ! 3690: CASXA_I	casxa	[%r8] 0x80, %r9, %r15
	.word 0xc22a0009  ! 3693: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc40a0009  ! 3693: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0x9f6a22e8  ! 3693: SDIVX_I	sdivx	%r8, 0x02e8, %r15
	.word 0xe4320009  ! 3696: STH_R	sth	%r18, [%r8 + %r9]
	.word 0xce5a0009  ! 3696: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xc7e22009  ! 3696: CASA_R	casa	[%r8] %asi, %r9, %r3
	.word 0xea320009  ! 3699: STH_R	sth	%r21, [%r8 + %r9]
	.word 0xe8520009  ! 3699: LDSH_R	ldsh	[%r8 + %r9], %r20
	.word 0xc2fa2790  ! 3699: SWAPA_I	swapa	%r1, [%r8 + 0x0790] %asi
	.word 0xc53a0009  ! 3702: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc25a0009  ! 3702: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0x1c800001  ! 3702: BPOS	bpos  	<label_0x1>
	.word 0xca720009  ! 3705: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xcb1a0009  ! 3705: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xc36a2dd4  ! 3705: PREFETCH_I	prefetch	[%r8 + 0x0dd4], #one_read
	.word 0xc6320009  ! 3708: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xf65a0009  ! 3708: LDX_R	ldx	[%r8 + %r9], %r27
	.word 0x8143c000  ! 3708: STBAR	stbar
	.word 0xce2a0009  ! 3711: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc40a0009  ! 3711: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xceda1009  ! 3711: LDXA_R	ldxa	[%r8, %r9] 0x80, %r7
	.word 0xe4220009  ! 3714: STW_R	stw	%r18, [%r8 + %r9]
	.word 0xcc5a0009  ! 3714: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xc8422d88  ! 3714: LDSW_I	ldsw	[%r8 + 0x0d88], %r4
	.word 0xc2220009  ! 3717: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xde520009  ! 3717: LDSH_R	ldsh	[%r8 + %r9], %r15
	.word 0x88720009  ! 3717: UDIV_R	udiv 	%r8, %r9, %r4
	.word 0xc73a0009  ! 3720: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc4120009  ! 3720: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xc80a24ec  ! 3720: LDUB_I	ldub	[%r8 + 0x04ec], %r4
	.word 0xcf3a0009  ! 3723: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc3020009  ! 3723: LDF_R	ld	[%r8, %r9], %f1
	.word 0x3a800001  ! 3723: BCC	bcc,a	<label_0x1>
	.word 0xce2a0009  ! 3726: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xca5a0009  ! 3726: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xc2a2259c  ! 3726: STWA_I	stwa	%r1, [%r8 + 0x059c] %asi
	.word 0xc3220009  ! 3729: STF_R	st	%f1, [%r9, %r8]
	.word 0xc65a0009  ! 3729: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xda4a0009  ! 3729: LDSB_R	ldsb	[%r8 + %r9], %r13
	.word 0xc22a0009  ! 3732: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc84a0009  ! 3732: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xcd220009  ! 3732: STF_R	st	%f6, [%r9, %r8]
	.word 0xdd220009  ! 3735: STF_R	st	%f14, [%r9, %r8]
	.word 0xcc020009  ! 3735: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0x8ba20829  ! 3735: FADDs	fadds	%f8, %f9, %f5
	.word 0xc8720009  ! 3738: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xcc4a0009  ! 3738: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xc47a2b90  ! 3738: SWAP_I	swap	%r2, [%r8 + 0x0b90]
	.word 0xcc220009  ! 3741: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xcf1a0009  ! 3741: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xc2a21009  ! 3741: STWA_R	stwa	%r1, [%r8 + %r9] 0x80
	.word 0xfb220009  ! 3744: STF_R	st	%f29, [%r9, %r8]
	.word 0xca520009  ! 3744: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xc7e22009  ! 3744: CASA_R	casa	[%r8] %asi, %r9, %r3
	.word 0xcc720009  ! 3747: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc4520009  ! 3747: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0x40000002  ! 3747: CALL	call	disp30_2
	.word 0xe13a0009  ! 3750: STDF_R	std	%f16, [%r9, %r8]
	.word 0xc4020009  ! 3750: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xc36a2edc  ! 3750: PREFETCH_I	prefetch	[%r8 + 0x0edc], #one_read
	.word 0xca2a0009  ! 3753: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xe8420009  ! 3753: LDSW_R	ldsw	[%r8 + %r9], %r20
	.word 0x8143e070  ! 3753: MEMBAR	membar	#Lookaside | #MemIssue | #Sync 
	.word 0xc62a0009  ! 3756: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc2120009  ! 3756: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0x8cfa0009  ! 3756: SDIVcc_R	sdivcc 	%r8, %r9, %r6
	.word 0xc73a0009  ! 3759: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc4120009  ! 3759: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xbc6a0009  ! 3759: UDIVX_R	udivx 	%r8, %r9, %r30
	.word 0xc4220009  ! 3762: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xdc4a0009  ! 3762: LDSB_R	ldsb	[%r8 + %r9], %r14
	.word 0xc7e22009  ! 3762: CASA_R	casa	[%r8] %asi, %r9, %r3
	.word 0xcb3a0009  ! 3765: STDF_R	std	%f5, [%r9, %r8]
	.word 0xfc4a0009  ! 3765: LDSB_R	ldsb	[%r8 + %r9], %r30
	.word 0xfbe21009  ! 3765: CASA_I	casa	[%r8] 0x80, %r9, %r29
	.word 0xce720009  ! 3768: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc5020009  ! 3768: LDF_R	ld	[%r8, %r9], %f2
	.word 0xc36a25e0  ! 3768: PREFETCH_I	prefetch	[%r8 + 0x05e0], #one_read
	.word 0xc2320009  ! 3771: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc51a0009  ! 3771: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xe86a0009  ! 3771: LDSTUB_R	ldstub	%r20, [%r8 + %r9]
	.word 0xc82a0009  ! 3774: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xcc420009  ! 3774: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0x8a5a0009  ! 3774: SMUL_R	smul 	%r8, %r9, %r5
	.word 0xc73a0009  ! 3777: STDF_R	std	%f3, [%r9, %r8]
	.word 0xcf020009  ! 3777: LDF_R	ld	[%r8, %r9], %f7
	.word 0xc6b22fd0  ! 3777: STHA_I	stha	%r3, [%r8 + 0x0fd0] %asi
	.word 0xcd220009  ! 3780: STF_R	st	%f6, [%r9, %r8]
	.word 0xca120009  ! 3780: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xdc9a2188  ! 3780: LDDA_I	ldda	[%r8, + 0x0188] %asi, %r14
	.word 0xc8720009  ! 3783: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xca4a0009  ! 3783: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0x2eca0001  ! 3783: BRGEZ	brgez,a,pt	%8,<label_0xa0001>
	.word 0xe93a0009  ! 3786: STDF_R	std	%f20, [%r9, %r8]
	.word 0xcd020009  ! 3786: LDF_R	ld	[%r8, %r9], %f6
	.word 0xc68a1009  ! 3786: LDUBA_R	lduba	[%r8, %r9] 0x80, %r3
	.word 0xce220009  ! 3789: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc44a0009  ! 3789: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xc8ba1009  ! 3789: STDA_R	stda	%r4, [%r8 + %r9] 0x80
	.word 0xc53a0009  ! 3792: STDF_R	std	%f2, [%r9, %r8]
	.word 0xda420009  ! 3792: LDSW_R	ldsw	[%r8 + %r9], %r13
	.word 0xb27a2cd4  ! 3792: SDIV_I	sdiv 	%r8, 0x0cd4, %r25
	.word 0xca320009  ! 3795: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xe8420009  ! 3795: LDSW_R	ldsw	[%r8 + %r9], %r20
	.word 0xe4520009  ! 3795: LDSH_R	ldsh	[%r8 + %r9], %r18
	.word 0xca220009  ! 3798: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc2020009  ! 3798: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xb26a0009  ! 3798: UDIVX_R	udivx 	%r8, %r9, %r25
	.word 0xc22a0009  ! 3801: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xce420009  ! 3801: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xa56a0009  ! 3801: SDIVX_R	sdivx	%r8, %r9, %r18
	.word 0xf1220009  ! 3804: STF_R	st	%f24, [%r9, %r8]
	.word 0xfc0a0009  ! 3804: LDUB_R	ldub	[%r8 + %r9], %r30
	.word 0xf6aa2ab0  ! 3804: STBA_I	stba	%r27, [%r8 + 0x0ab0] %asi
	.word 0xfe320009  ! 3807: STH_R	sth	%r31, [%r8 + %r9]
	.word 0xed020009  ! 3807: LDF_R	ld	[%r8, %r9], %f22
	.word 0x0cca0001  ! 3807: BRGZ	brgz  ,pt	%8,<label_0xa0001>
	.word 0xc82a0009  ! 3810: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xf64a0009  ! 3810: LDSB_R	ldsb	[%r8 + %r9], %r27
	.word 0xc36a2868  ! 3810: PREFETCH_I	prefetch	[%r8 + 0x0868], #one_read
	.word 0xc4720009  ! 3813: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xf2020009  ! 3813: LDUW_R	lduw	[%r8 + %r9], %r25
	.word 0x83a209a9  ! 3813: FDIVs	fdivs	%f8, %f9, %f1
	.word 0xc5220009  ! 3816: STF_R	st	%f2, [%r9, %r8]
	.word 0xc85a0009  ! 3816: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xc3ea1009  ! 3816: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc3220009  ! 3819: STF_R	st	%f1, [%r9, %r8]
	.word 0xcb1a0009  ! 3819: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xc36a2488  ! 3819: PREFETCH_I	prefetch	[%r8 + 0x0488], #one_read
	.word 0xc2720009  ! 3822: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc60a0009  ! 3822: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0x8143c000  ! 3822: STBAR	stbar
	.word 0xc7220009  ! 3825: STF_R	st	%f3, [%r9, %r8]
	.word 0xc4120009  ! 3825: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xf41a2f30  ! 3825: LDD_I	ldd	[%r8 + 0x0f30], %r26
	.word 0xcd3a0009  ! 3828: STDF_R	std	%f6, [%r9, %r8]
	.word 0xf84a0009  ! 3828: LDSB_R	ldsb	[%r8 + %r9], %r28
	.word 0x8322288c  ! 3828: MULScc_I	mulscc 	%r8, 0x088c, %r1
	.word 0xf2220009  ! 3831: STW_R	stw	%r25, [%r8 + %r9]
	.word 0xc8120009  ! 3831: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xc8aa2d88  ! 3831: STBA_I	stba	%r4, [%r8 + 0x0d88] %asi
	.word 0xcc2a0009  ! 3834: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xce420009  ! 3834: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xcc420009  ! 3834: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xc6220009  ! 3837: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xca5a0009  ! 3837: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xc3ea1009  ! 3837: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xff220009  ! 3840: STF_R	st	%f31, [%r9, %r8]
	.word 0xcb020009  ! 3840: LDF_R	ld	[%r8, %r9], %f5
	.word 0x26800001  ! 3840: BL	bl,a	<label_0x1>
	.word 0xce320009  ! 3843: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc45a0009  ! 3843: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0x8143e073  ! 3843: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside | #MemIssue | #Sync 
	.word 0xce320009  ! 3846: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc44a0009  ! 3846: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0x82522068  ! 3846: UMUL_I	umul 	%r8, 0x0068, %r1
	.word 0xc4220009  ! 3849: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc9020009  ! 3849: LDF_R	ld	[%r8, %r9], %f4
	.word 0xa1a209a9  ! 3849: FDIVs	fdivs	%f8, %f9, %f16
	.word 0xce2a0009  ! 3852: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xfa520009  ! 3852: LDSH_R	ldsh	[%r8 + %r9], %r29
	.word 0xa7a20829  ! 3852: FADDs	fadds	%f8, %f9, %f19
	.word 0xc7220009  ! 3855: STF_R	st	%f3, [%r9, %r8]
	.word 0xc85a0009  ! 3855: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0x8143e00f  ! 3855: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore 
	.word 0xcc2a0009  ! 3858: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xdc4a0009  ! 3858: LDSB_R	ldsb	[%r8 + %r9], %r14
	.word 0xcf022904  ! 3858: LDF_I	ld	[%r8, 0x0904], %f7
	.word 0xfb220009  ! 3861: STF_R	st	%f29, [%r9, %r8]
	.word 0xec0a0009  ! 3861: LDUB_R	ldub	[%r8 + %r9], %r22
	.word 0x887a0009  ! 3861: SDIV_R	sdiv 	%r8, %r9, %r4
	.word 0xf2320009  ! 3864: STH_R	sth	%r25, [%r8 + %r9]
	.word 0xc44a0009  ! 3864: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xfaa21009  ! 3864: STWA_R	stwa	%r29, [%r8 + %r9] 0x80
	.word 0xc2720009  ! 3867: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xce420009  ! 3867: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0x8143c000  ! 3867: STBAR	stbar
	.word 0xcb220009  ! 3870: STF_R	st	%f5, [%r9, %r8]
	.word 0xd6520009  ! 3870: LDSH_R	ldsh	[%r8 + %r9], %r11
	.word 0xc8aa29c8  ! 3870: STBA_I	stba	%r4, [%r8 + 0x09c8] %asi
	.word 0xcd3a0009  ! 3873: STDF_R	std	%f6, [%r9, %r8]
	.word 0xe4520009  ! 3873: LDSH_R	ldsh	[%r8 + %r9], %r18
	.word 0xc6f21009  ! 3873: STXA_R	stxa	%r3, [%r8 + %r9] 0x80
	.word 0xe8320009  ! 3876: STH_R	sth	%r20, [%r8 + %r9]
	.word 0xc2120009  ! 3876: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xc3ea1009  ! 3876: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xcf220009  ! 3879: STF_R	st	%f7, [%r9, %r8]
	.word 0xc4020009  ! 3879: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xc3ea1009  ! 3879: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xcc720009  ! 3882: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc7020009  ! 3882: LDF_R	ld	[%r8, %r9], %f3
	.word 0x885a0009  ! 3882: SMUL_R	smul 	%r8, %r9, %r4
	.word 0xc5220009  ! 3885: STF_R	st	%f2, [%r9, %r8]
	.word 0xc8520009  ! 3885: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xce520009  ! 3885: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xfd220009  ! 3888: STF_R	st	%f30, [%r9, %r8]
	.word 0xc2120009  ! 3888: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0x8143e004  ! 3888: MEMBAR	membar	#LoadStore 
	.word 0xf0320009  ! 3891: STH_R	sth	%r24, [%r8 + %r9]
	.word 0xc2120009  ! 3891: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xc46a2d24  ! 3891: LDSTUB_I	ldstub	%r2, [%r8 + 0x0d24]
	.word 0xca220009  ! 3894: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc80a0009  ! 3894: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0x8143e066  ! 3894: MEMBAR	membar	#StoreLoad | #LoadStore | #MemIssue | #Sync 
	.word 0xdc2a0009  ! 3897: STB_R	stb	%r14, [%r8 + %r9]
	.word 0xf4020009  ! 3897: LDUW_R	lduw	[%r8 + %r9], %r26
	.word 0xe3222520  ! 3897: STF_I	st	%f17, [0x0520, %r8]
	.word 0xc2220009  ! 3900: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc6120009  ! 3900: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0x06ca0001  ! 3900: BRLZ	brlz  ,pt	%8,<label_0xa0001>
	.word 0xe93a0009  ! 3903: STDF_R	std	%f20, [%r9, %r8]
	.word 0xce020009  ! 3903: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0x8e5a2e34  ! 3903: SMUL_I	smul 	%r8, 0x0e34, %r7
	.word 0xc6320009  ! 3906: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xf5020009  ! 3906: LDF_R	ld	[%r8, %r9], %f26
	.word 0x06ca0001  ! 3906: BRLZ	brlz  ,pt	%8,<label_0xa0001>
	.word 0xe1220009  ! 3909: STF_R	st	%f16, [%r9, %r8]
	.word 0xda0a0009  ! 3909: LDUB_R	ldub	[%r8 + %r9], %r13
	.word 0xcf220009  ! 3909: STF_R	st	%f7, [%r9, %r8]
	.word 0xcd220009  ! 3912: STF_R	st	%f6, [%r9, %r8]
	.word 0xf0120009  ! 3912: LDUH_R	lduh	[%r8 + %r9], %r24
	.word 0xc3ea2074  ! 3912: PREFETCHA_I	prefetcha	[%r8, + 0x0074] %asi, #one_read
	.word 0xeb3a0009  ! 3915: STDF_R	std	%f21, [%r9, %r8]
	.word 0xcc120009  ! 3915: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xc27a25c0  ! 3915: SWAP_I	swap	%r1, [%r8 + 0x05c0]
	.word 0xd62a0009  ! 3918: STB_R	stb	%r11, [%r8 + %r9]
	.word 0xf6120009  ! 3918: LDUH_R	lduh	[%r8 + %r9], %r27
	.word 0xfab21009  ! 3918: STHA_R	stha	%r29, [%r8 + %r9] 0x80
	.word 0xce220009  ! 3921: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xe04a0009  ! 3921: LDSB_R	ldsb	[%r8 + %r9], %r16
	.word 0xbb22295c  ! 3921: MULScc_I	mulscc 	%r8, 0x095c, %r29
	.word 0xea320009  ! 3924: STH_R	sth	%r21, [%r8 + %r9]
	.word 0xe4020009  ! 3924: LDUW_R	lduw	[%r8 + %r9], %r18
	.word 0x9a720009  ! 3924: UDIV_R	udiv 	%r8, %r9, %r13
	.word 0xef3a0009  ! 3927: STDF_R	std	%f23, [%r9, %r8]
	.word 0xce020009  ! 3927: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xcff22009  ! 3927: CASXA_R	casxa	[%r8]%asi, %r9, %r7
	.word 0xc3220009  ! 3930: STF_R	st	%f1, [%r9, %r8]
	.word 0xc80a0009  ! 3930: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xcc4a0009  ! 3930: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xc3220009  ! 3933: STF_R	st	%f1, [%r9, %r8]
	.word 0xce120009  ! 3933: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0x83a209a9  ! 3933: FDIVs	fdivs	%f8, %f9, %f1
	.word 0xc73a0009  ! 3936: STDF_R	std	%f3, [%r9, %r8]
	.word 0xd84a0009  ! 3936: LDSB_R	ldsb	[%r8 + %r9], %r12
	.word 0xc3ea1009  ! 3936: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xcc220009  ! 3939: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xcc420009  ! 3939: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xfff22009  ! 3939: CASXA_R	casxa	[%r8]%asi, %r9, %r31
	.word 0xc33a0009  ! 3942: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc9020009  ! 3942: LDF_R	ld	[%r8, %r9], %f4
	.word 0x14800002  ! 3942: BG	bg  	<label_0x2>
	.word 0xc2220009  ! 3945: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xca0a0009  ! 3945: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xc8020009  ! 3945: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xda320009  ! 3948: STH_R	sth	%r13, [%r8 + %r9]
	.word 0xfc120009  ! 3948: LDUH_R	lduh	[%r8 + %r9], %r30
	.word 0xdcba2350  ! 3948: STDA_I	stda	%r14, [%r8 + 0x0350] %asi
	.word 0xe1220009  ! 3951: STF_R	st	%f16, [%r9, %r8]
	.word 0xcc420009  ! 3951: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xf66a2298  ! 3951: LDSTUB_I	ldstub	%r27, [%r8 + 0x0298]
	.word 0xcc720009  ! 3954: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xed020009  ! 3954: LDF_R	ld	[%r8, %r9], %f22
	.word 0xf81a2c00  ! 3954: LDD_I	ldd	[%r8 + 0x0c00], %r28
	.word 0xce2a0009  ! 3957: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc3020009  ! 3957: LDF_R	ld	[%r8, %r9], %f1
	.word 0x8b220009  ! 3957: MULScc_R	mulscc 	%r8, %r9, %r5
	.word 0xc4220009  ! 3960: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xf2520009  ! 3960: LDSH_R	ldsh	[%r8 + %r9], %r25
	.word 0xe05a2588  ! 3960: LDX_I	ldx	[%r8 + 0x0588], %r16
	.word 0xc62a0009  ! 3963: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc5020009  ! 3963: LDF_R	ld	[%r8, %r9], %f2
	.word 0x0aca0001  ! 3963: BRNZ	brnz  ,pt	%8,<label_0xa0001>
	.word 0xcf220009  ! 3966: STF_R	st	%f7, [%r9, %r8]
	.word 0xce420009  ! 3966: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xcd222748  ! 3966: STF_I	st	%f6, [0x0748, %r8]
	.word 0xc2220009  ! 3969: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xfe420009  ! 3969: LDSW_R	ldsw	[%r8 + %r9], %r31
	.word 0x8c5224cc  ! 3969: UMUL_I	umul 	%r8, 0x04cc, %r6
	.word 0xec220009  ! 3972: STW_R	stw	%r22, [%r8 + %r9]
	.word 0xea420009  ! 3972: LDSW_R	ldsw	[%r8 + %r9], %r21
	.word 0xc36a266c  ! 3972: PREFETCH_I	prefetch	[%r8 + 0x066c], #one_read
	.word 0xcc720009  ! 3975: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc3020009  ! 3975: LDF_R	ld	[%r8, %r9], %f1
	.word 0xc8a22b94  ! 3975: STWA_I	stwa	%r4, [%r8 + 0x0b94] %asi
	.word 0xc7220009  ! 3978: STF_R	st	%f3, [%r9, %r8]
	.word 0xf0020009  ! 3978: LDUW_R	lduw	[%r8 + %r9], %r24
	.word 0xc3ea1009  ! 3978: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc2320009  ! 3981: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xf04a0009  ! 3981: LDSB_R	ldsb	[%r8 + %r9], %r24
	.word 0x9cd20009  ! 3981: UMULcc_R	umulcc 	%r8, %r9, %r14
	.word 0xda320009  ! 3984: STH_R	sth	%r13, [%r8 + %r9]
	.word 0xca120009  ! 3984: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xffe22009  ! 3984: CASA_R	casa	[%r8] %asi, %r9, %r31
	.word 0xcb3a0009  ! 3987: STDF_R	std	%f5, [%r9, %r8]
	.word 0xc2020009  ! 3987: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xf0921009  ! 3987: LDUHA_R	lduha	[%r8, %r9] 0x80, %r24
	.word 0xfa2a0009  ! 3990: STB_R	stb	%r29, [%r8 + %r9]
	.word 0xc8020009  ! 3990: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xca82237c  ! 3990: LDUWA_I	lduwa	[%r8, + 0x037c] %asi, %r5
	.word 0xc73a0009  ! 3993: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc4520009  ! 3993: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xccba1009  ! 3993: STDA_R	stda	%r6, [%r8 + %r9] 0x80
	.word 0xcb3a0009  ! 3996: STDF_R	std	%f5, [%r9, %r8]
	.word 0xc40a0009  ! 3996: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0x8f2226b4  ! 3996: MULScc_I	mulscc 	%r8, 0x06b4, %r7
	.word 0xe53a0009  ! 3999: STDF_R	std	%f18, [%r9, %r8]
	.word 0xc45a0009  ! 3999: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xcea22030  ! 3999: STWA_I	stwa	%r7, [%r8 + 0x0030] %asi
        ta      T_GOOD_TRAP

th_main_2:
        setx  MAIN_BASE_DATA_VA, %r1, %r8
        setx  0x0000000000000dd0, %g1, %r9
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
        setx  0x433f041eb26f526e, %g1, %r0
        setx  0xb7a7775264677c29, %g1, %r1
        setx  0x69cc8728d77c1944, %g1, %r2
        setx  0x80d72a46197d2b67, %g1, %r3
        setx  0x995a5abf43fa899e, %g1, %r4
        setx  0x4605e04bec394ab3, %g1, %r5
        setx  0x96f513b3d1f3eaa3, %g1, %r6
        setx  0xdea05a436e2c8737, %g1, %r7
        setx  0xa37e00ef39ad62d1, %g1, %r10
        setx  0x60769bebe0912e43, %g1, %r11
        setx  0x714dc24cc57b1aac, %g1, %r12
        setx  0xe097fc0859d2e91c, %g1, %r13
        setx  0xb34e8c9c887f8dd4, %g1, %r14
        setx  0xc7daa1aa03d9f94a, %g1, %r15
        setx  0x67f2b9d3d76793a6, %g1, %r16
        setx  0xf2440916e548b801, %g1, %r17
        setx  0xdcfa67ee3de17f7e, %g1, %r18
        setx  0xcc9e89cfe6278bab, %g1, %r19
        setx  0x1933504f6b5d2098, %g1, %r20
        setx  0x26991119e3c57f9d, %g1, %r21
        setx  0x71a9cad6dfd8b10c, %g1, %r22
        setx  0x7fe0db5d60f34121, %g1, %r23
        setx  0x953d7f1f3fc9c1b1, %g1, %r24
        setx  0x0fb8a5452813196d, %g1, %r25
        setx  0x5b73e36a3329a9ed, %g1, %r26
        setx  0x27b609bee80a4932, %g1, %r27
        setx  0xe063ffddb52f3683, %g1, %r28
        setx  0x511ce819c6375957, %g1, %r29
        setx  0x6bd8fa0443388a5f, %g1, %r30
        setx  0x7304ac2cd5a8afd1, %g1, %r31
	.word 0xec220009  ! 3: STW_R	stw	%r22, [%r8 + %r9]
	.word 0xcd1a0009  ! 3: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0x2a800002  ! 3: BCS	bcs,a	<label_0x2>
	.word 0xc82a0009  ! 6: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xec020009  ! 6: LDUW_R	lduw	[%r8 + %r9], %r22
	.word 0x16800001  ! 6: BGE	bge  	<label_0x1>
	.word 0xdf220009  ! 9: STF_R	st	%f15, [%r9, %r8]
	.word 0xcc020009  ! 9: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xe47a0009  ! 9: SWAP_R	swap	%r18, [%r8 + %r9]
	.word 0xc3220009  ! 12: STF_R	st	%f1, [%r9, %r8]
	.word 0xd91a0009  ! 12: LDDF_R	ldd	[%r8, %r9], %f12
	.word 0x8c5a0009  ! 12: SMUL_R	smul 	%r8, %r9, %r6
	.word 0xca320009  ! 15: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc9020009  ! 15: LDF_R	ld	[%r8, %r9], %f4
	.word 0x886a22dc  ! 15: UDIVX_I	udivx 	%r8, 0x02dc, %r4
	.word 0xff3a0009  ! 18: STDF_R	std	%f31, [%r9, %r8]
	.word 0xe8020009  ! 18: LDUW_R	lduw	[%r8 + %r9], %r20
	.word 0x2c800002  ! 18: BNEG	bneg,a	<label_0x2>
	.word 0xc42a0009  ! 21: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc2020009  ! 21: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xe4f227a8  ! 21: STXA_I	stxa	%r18, [%r8 + 0x07a8] %asi
	.word 0xc82a0009  ! 24: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xd8420009  ! 24: LDSW_R	ldsw	[%r8 + %r9], %r12
	.word 0xc4a21009  ! 24: STWA_R	stwa	%r2, [%r8 + %r9] 0x80
	.word 0xc9220009  ! 27: STF_R	st	%f4, [%r9, %r8]
	.word 0xcf1a0009  ! 27: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xc86a24dc  ! 27: LDSTUB_I	ldstub	%r4, [%r8 + 0x04dc]
	.word 0xda220009  ! 30: STW_R	stw	%r13, [%r8 + %r9]
	.word 0xc51a0009  ! 30: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0x896a0009  ! 30: SDIVX_R	sdivx	%r8, %r9, %r4
	.word 0xcb3a0009  ! 33: STDF_R	std	%f5, [%r9, %r8]
	.word 0xdc120009  ! 33: LDUH_R	lduh	[%r8 + %r9], %r14
	.word 0x844a0009  ! 33: MULX_R	mulx 	%r8, %r9, %r2
	.word 0xc9220009  ! 36: STF_R	st	%f4, [%r9, %r8]
	.word 0xc91a0009  ! 36: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xc3ea2da4  ! 36: PREFETCHA_I	prefetcha	[%r8, + 0x0da4] %asi, #one_read
	.word 0xe42a0009  ! 39: STB_R	stb	%r18, [%r8 + %r9]
	.word 0xdb020009  ! 39: LDF_R	ld	[%r8, %r9], %f13
	.word 0xc80a2724  ! 39: LDUB_I	ldub	[%r8 + 0x0724], %r4
	.word 0xc8720009  ! 42: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc20a0009  ! 42: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xc4ea1009  ! 42: LDSTUBA_R	ldstuba	%r2, [%r8 + %r9] 0x80
	.word 0xc6320009  ! 45: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc91a0009  ! 45: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xc8f21009  ! 45: STXA_R	stxa	%r4, [%r8 + %r9] 0x80
	.word 0xef220009  ! 48: STF_R	st	%f23, [%r9, %r8]
	.word 0xd71a0009  ! 48: LDDF_R	ldd	[%r8, %r9], %f11
	.word 0xc2d222cc  ! 48: LDSHA_I	ldsha	[%r8, + 0x02cc] %asi, %r1
	.word 0xcf3a0009  ! 51: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc9020009  ! 51: LDF_R	ld	[%r8, %r9], %f4
	.word 0x8a722db8  ! 51: UDIV_I	udiv 	%r8, 0x0db8, %r5
	.word 0xce720009  ! 54: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc8520009  ! 54: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xccd22a20  ! 54: LDSHA_I	ldsha	[%r8, + 0x0a20] %asi, %r6
	.word 0xfc2a0009  ! 57: STB_R	stb	%r30, [%r8 + %r9]
	.word 0xcc5a0009  ! 57: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xc4ba1009  ! 57: STDA_R	stda	%r2, [%r8 + %r9] 0x80
	.word 0xed220009  ! 60: STF_R	st	%f22, [%r9, %r8]
	.word 0xce4a0009  ! 60: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xf6020009  ! 60: LDUW_R	lduw	[%r8 + %r9], %r27
	.word 0xeb3a0009  ! 63: STDF_R	std	%f21, [%r9, %r8]
	.word 0xc9020009  ! 63: LDF_R	ld	[%r8, %r9], %f4
	.word 0x0e800001  ! 63: BVS	bvs  	<label_0x1>
	.word 0xda320009  ! 66: STH_R	sth	%r13, [%r8 + %r9]
	.word 0xc31a0009  ! 66: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0x82d20009  ! 66: UMULcc_R	umulcc 	%r8, %r9, %r1
	.word 0xc2320009  ! 69: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xce4a0009  ! 69: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xcc4227d8  ! 69: LDSW_I	ldsw	[%r8 + 0x07d8], %r6
	.word 0xce320009  ! 72: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc45a0009  ! 72: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xc3ea1009  ! 72: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xce720009  ! 75: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xf4420009  ! 75: LDSW_R	ldsw	[%r8 + %r9], %r26
	.word 0xd8d22990  ! 75: LDSHA_I	ldsha	[%r8, + 0x0990] %asi, %r12
	.word 0xcd3a0009  ! 78: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc64a0009  ! 78: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0x8143c000  ! 78: STBAR	stbar
	.word 0xc53a0009  ! 81: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc8120009  ! 81: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0x8143e00e  ! 81: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore 
	.word 0xcc320009  ! 84: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xf0520009  ! 84: LDSH_R	ldsh	[%r8 + %r9], %r24
	.word 0xeb02221c  ! 84: LDF_I	ld	[%r8, 0x021c], %f21
	.word 0xcd220009  ! 87: STF_R	st	%f6, [%r9, %r8]
	.word 0xdf1a0009  ! 87: LDDF_R	ldd	[%r8, %r9], %f15
	.word 0xc4420009  ! 87: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xc4220009  ! 90: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xce5a0009  ! 90: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xe72227d4  ! 90: STF_I	st	%f19, [0x07d4, %r8]
	.word 0xd9220009  ! 93: STF_R	st	%f12, [%r9, %r8]
	.word 0xe60a0009  ! 93: LDUB_R	ldub	[%r8 + %r9], %r19
	.word 0xccba1009  ! 93: STDA_R	stda	%r6, [%r8 + %r9] 0x80
	.word 0xe9220009  ! 96: STF_R	st	%f20, [%r9, %r8]
	.word 0xca020009  ! 96: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0x10800001  ! 96: BA	ba  	<label_0x1>
	.word 0xff220009  ! 99: STF_R	st	%f31, [%r9, %r8]
	.word 0xc6520009  ! 99: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xc3222ce0  ! 99: STF_I	st	%f1, [0x0ce0, %r8]
	.word 0xc8220009  ! 102: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc65a0009  ! 102: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xc4b22808  ! 102: STHA_I	stha	%r2, [%r8 + 0x0808] %asi
	.word 0xdc2a0009  ! 105: STB_R	stb	%r14, [%r8 + %r9]
	.word 0xc44a0009  ! 105: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0x8cfa2a60  ! 105: SDIVcc_I	sdivcc 	%r8, 0x0a60, %r6
	.word 0xc4320009  ! 108: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc85a0009  ! 108: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0x8143c000  ! 108: STBAR	stbar
	.word 0xc82a0009  ! 111: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc6520009  ! 111: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xc5e21009  ! 111: CASA_I	casa	[%r8] 0x80, %r9, %r2
	.word 0xc22a0009  ! 114: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc8120009  ! 114: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xfd222168  ! 114: STF_I	st	%f30, [0x0168, %r8]
	.word 0xfe2a0009  ! 117: STB_R	stb	%r31, [%r8 + %r9]
	.word 0xce5a0009  ! 117: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xccba2f98  ! 117: STDA_I	stda	%r6, [%r8 + 0x0f98] %asi
	.word 0xce2a0009  ! 120: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xd85a0009  ! 120: LDX_R	ldx	[%r8 + %r9], %r12
	.word 0xc8ba2a08  ! 120: STDA_I	stda	%r4, [%r8 + 0x0a08] %asi
	.word 0xc22a0009  ! 123: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xcd1a0009  ! 123: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xe7e22009  ! 123: CASA_R	casa	[%r8] %asi, %r9, %r19
	.word 0xf0220009  ! 126: STW_R	stw	%r24, [%r8 + %r9]
	.word 0xcc0a0009  ! 126: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0x8143e078  ! 126: MEMBAR	membar	#StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xc93a0009  ! 129: STDF_R	std	%f4, [%r9, %r8]
	.word 0xce0a0009  ! 129: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xc3ea1009  ! 129: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xfa2a0009  ! 132: STB_R	stb	%r29, [%r8 + %r9]
	.word 0xc84a0009  ! 132: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0x8ba208a9  ! 132: FSUBs	fsubs	%f8, %f9, %f5
	.word 0xc6220009  ! 135: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc7020009  ! 135: LDF_R	ld	[%r8, %r9], %f3
	.word 0x8fa20829  ! 135: FADDs	fadds	%f8, %f9, %f7
	.word 0xc62a0009  ! 138: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xda5a0009  ! 138: LDX_R	ldx	[%r8 + %r9], %r13
	.word 0xc2ea1009  ! 138: LDSTUBA_R	ldstuba	%r1, [%r8 + %r9] 0x80
	.word 0xde320009  ! 141: STH_R	sth	%r15, [%r8 + %r9]
	.word 0xc65a0009  ! 141: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0x8143c000  ! 141: STBAR	stbar
	.word 0xc53a0009  ! 144: STDF_R	std	%f2, [%r9, %r8]
	.word 0xcc4a0009  ! 144: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xf41a27c8  ! 144: LDD_I	ldd	[%r8 + 0x07c8], %r26
	.word 0xc42a0009  ! 147: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xdb1a0009  ! 147: LDDF_R	ldd	[%r8, %r9], %f13
	.word 0xc8ca1009  ! 147: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r4
	.word 0xc82a0009  ! 150: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xe24a0009  ! 150: LDSB_R	ldsb	[%r8 + %r9], %r17
	.word 0x84722550  ! 150: UDIV_I	udiv 	%r8, 0x0550, %r2
	.word 0xdc2a0009  ! 153: STB_R	stb	%r14, [%r8 + %r9]
	.word 0xce520009  ! 153: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xf40a0009  ! 153: LDUB_R	ldub	[%r8 + %r9], %r26
	.word 0xcc320009  ! 156: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc44a0009  ! 156: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0x88fa2d80  ! 156: SDIVcc_I	sdivcc 	%r8, 0x0d80, %r4
	.word 0xc82a0009  ! 159: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xdc020009  ! 159: LDUW_R	lduw	[%r8 + %r9], %r14
	.word 0xccba1009  ! 159: STDA_R	stda	%r6, [%r8 + %r9] 0x80
	.word 0xc8220009  ! 162: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xca520009  ! 162: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xaeda0009  ! 162: SMULcc_R	smulcc 	%r8, %r9, %r23
	.word 0xe4320009  ! 165: STH_R	sth	%r18, [%r8 + %r9]
	.word 0xc4520009  ! 165: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xf8520009  ! 165: LDSH_R	ldsh	[%r8 + %r9], %r28
	.word 0xce2a0009  ! 168: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xcb1a0009  ! 168: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xb07a0009  ! 168: SDIV_R	sdiv 	%r8, %r9, %r24
	.word 0xc53a0009  ! 171: STDF_R	std	%f2, [%r9, %r8]
	.word 0xcd1a0009  ! 171: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xaba20829  ! 171: FADDs	fadds	%f8, %f9, %f21
	.word 0xc6220009  ! 174: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xf9020009  ! 174: LDF_R	ld	[%r8, %r9], %f28
	.word 0xcd220009  ! 174: STF_R	st	%f6, [%r9, %r8]
	.word 0xc82a0009  ! 177: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc44a0009  ! 177: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xe4f21009  ! 177: STXA_R	stxa	%r18, [%r8 + %r9] 0x80
	.word 0xcc720009  ! 180: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc6020009  ! 180: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xc66a0009  ! 180: LDSTUB_R	ldstub	%r3, [%r8 + %r9]
	.word 0xcc720009  ! 183: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc20a0009  ! 183: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xf64229dc  ! 183: LDSW_I	ldsw	[%r8 + 0x09dc], %r27
	.word 0xf6220009  ! 186: STW_R	stw	%r27, [%r8 + %r9]
	.word 0xe71a0009  ! 186: LDDF_R	ldd	[%r8, %r9], %f19
	.word 0xc3ea1009  ! 186: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xcd3a0009  ! 189: STDF_R	std	%f6, [%r9, %r8]
	.word 0xca4a0009  ! 189: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0x2c800002  ! 189: BNEG	bneg,a	<label_0x2>
	.word 0xc2720009  ! 192: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xe2020009  ! 192: LDUW_R	lduw	[%r8 + %r9], %r17
	.word 0xcd220009  ! 192: STF_R	st	%f6, [%r9, %r8]
	.word 0xcc320009  ! 195: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xf2420009  ! 195: LDSW_R	ldsw	[%r8 + %r9], %r25
	.word 0xc8122bec  ! 195: LDUH_I	lduh	[%r8 + 0x0bec], %r4
	.word 0xcc720009  ! 198: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xcc020009  ! 198: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xc33a2040  ! 198: STDF_I	std	%f1, [0x0040, %r8]
	.word 0xcc220009  ! 201: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xcd020009  ! 201: LDF_R	ld	[%r8, %r9], %f6
	.word 0x8cfa0009  ! 201: SDIVcc_R	sdivcc 	%r8, %r9, %r6
	.word 0xf0220009  ! 204: STW_R	stw	%r24, [%r8 + %r9]
	.word 0xce4a0009  ! 204: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0x8efa2954  ! 204: SDIVcc_I	sdivcc 	%r8, 0x0954, %r7
	.word 0xe5220009  ! 207: STF_R	st	%f18, [%r9, %r8]
	.word 0xde520009  ! 207: LDSH_R	ldsh	[%r8 + %r9], %r15
	.word 0x88f22268  ! 207: UDIVcc_I	udivcc 	%r8, 0x0268, %r4
	.word 0xd6720009  ! 210: STX_R	stx	%r11, [%r8 + %r9]
	.word 0xfb020009  ! 210: LDF_R	ld	[%r8, %r9], %f29
	.word 0xc36a2284  ! 210: PREFETCH_I	prefetch	[%r8 + 0x0284], #one_read
	.word 0xcc320009  ! 213: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc3020009  ! 213: LDF_R	ld	[%r8, %r9], %f1
	.word 0x84520009  ! 213: UMUL_R	umul 	%r8, %r9, %r2
	.word 0xe62a0009  ! 216: STB_R	stb	%r19, [%r8 + %r9]
	.word 0xee4a0009  ! 216: LDSB_R	ldsb	[%r8 + %r9], %r23
	.word 0x2ec20001  ! 216: BRGEZ	brgez,a,nt	%8,<label_0x20001>
	.word 0xcc720009  ! 219: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc84a0009  ! 219: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xdf3a0009  ! 219: STDF_R	std	%f15, [%r9, %r8]
	.word 0xe42a0009  ! 222: STB_R	stb	%r18, [%r8 + %r9]
	.word 0xca020009  ! 222: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0x88d20009  ! 222: UMULcc_R	umulcc 	%r8, %r9, %r4
	.word 0xea320009  ! 225: STH_R	sth	%r21, [%r8 + %r9]
	.word 0xc60a0009  ! 225: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0x8fa209a9  ! 225: FDIVs	fdivs	%f8, %f9, %f7
	.word 0xdc2a0009  ! 228: STB_R	stb	%r14, [%r8 + %r9]
	.word 0xca0a0009  ! 228: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xa5a20929  ! 228: FMULs	fmuls	%f8, %f9, %f18
	.word 0xcc220009  ! 231: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc4420009  ! 231: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0x87a209a9  ! 231: FDIVs	fdivs	%f8, %f9, %f3
	.word 0xdb220009  ! 234: STF_R	st	%f13, [%r9, %r8]
	.word 0xc20a0009  ! 234: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xc73a0009  ! 234: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc2320009  ! 237: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xe91a0009  ! 237: LDDF_R	ldd	[%r8, %r9], %f20
	.word 0x84da0009  ! 237: SMULcc_R	smulcc 	%r8, %r9, %r2
	.word 0xc4320009  ! 240: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xca4a0009  ! 240: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xc4f21009  ! 240: STXA_R	stxa	%r2, [%r8 + %r9] 0x80
	.word 0xc33a0009  ! 243: STDF_R	std	%f1, [%r9, %r8]
	.word 0xcc0a0009  ! 243: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xd8da27b0  ! 243: LDXA_I	ldxa	[%r8, + 0x07b0] %asi, %r12
	.word 0xc7220009  ! 246: STF_R	st	%f3, [%r9, %r8]
	.word 0xf0020009  ! 246: LDUW_R	lduw	[%r8 + %r9], %r24
	.word 0xe4020009  ! 246: LDUW_R	lduw	[%r8 + %r9], %r18
	.word 0xcb3a0009  ! 249: STDF_R	std	%f5, [%r9, %r8]
	.word 0xcf1a0009  ! 249: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xc4a22dc4  ! 249: STWA_I	stwa	%r2, [%r8 + 0x0dc4] %asi
	.word 0xc6220009  ! 252: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc65a0009  ! 252: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0x8143e04b  ! 252: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Sync 
	.word 0xc7220009  ! 255: STF_R	st	%f3, [%r9, %r8]
	.word 0xcc420009  ! 255: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0x986a27d4  ! 255: UDIVX_I	udivx 	%r8, 0x07d4, %r12
	.word 0xfd220009  ! 258: STF_R	st	%f30, [%r9, %r8]
	.word 0xc31a0009  ! 258: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xc4022bf8  ! 258: LDUW_I	lduw	[%r8 + 0x0bf8], %r2
	.word 0xc2320009  ! 261: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xe6520009  ! 261: LDSH_R	ldsh	[%r8 + %r9], %r19
	.word 0x8143c000  ! 261: STBAR	stbar
	.word 0xcc320009  ! 264: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xcb020009  ! 264: LDF_R	ld	[%r8, %r9], %f5
	.word 0x8ada0009  ! 264: SMULcc_R	smulcc 	%r8, %r9, %r5
	.word 0xe42a0009  ! 267: STB_R	stb	%r18, [%r8 + %r9]
	.word 0xfb1a0009  ! 267: LDDF_R	ldd	[%r8, %r9], %f29
	.word 0x0a800001  ! 267: BCS	bcs  	<label_0x1>
	.word 0xd6720009  ! 270: STX_R	stx	%r11, [%r8 + %r9]
	.word 0xe65a0009  ! 270: LDX_R	ldx	[%r8 + %r9], %r19
	.word 0xc9f21009  ! 270: CASXA_I	casxa	[%r8] 0x80, %r9, %r4
	.word 0xc5220009  ! 273: STF_R	st	%f2, [%r9, %r8]
	.word 0xec0a0009  ! 273: LDUB_R	ldub	[%r8 + %r9], %r22
	.word 0xd6f21009  ! 273: STXA_R	stxa	%r11, [%r8 + %r9] 0x80
	.word 0xee720009  ! 276: STX_R	stx	%r23, [%r8 + %r9]
	.word 0xe91a0009  ! 276: LDDF_R	ldd	[%r8, %r9], %f20
	.word 0x8143c000  ! 276: STBAR	stbar
	.word 0xce320009  ! 279: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc64a0009  ! 279: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xca022f2c  ! 279: LDUW_I	lduw	[%r8 + 0x0f2c], %r5
	.word 0xc33a0009  ! 282: STDF_R	std	%f1, [%r9, %r8]
	.word 0xcc120009  ! 282: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xf0822a0c  ! 282: LDUWA_I	lduwa	[%r8, + 0x0a0c] %asi, %r24
	.word 0xd93a0009  ! 285: STDF_R	std	%f12, [%r9, %r8]
	.word 0xc64a0009  ! 285: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xc8b22cc4  ! 285: STHA_I	stha	%r4, [%r8 + 0x0cc4] %asi
	.word 0xdc320009  ! 288: STH_R	sth	%r14, [%r8 + %r9]
	.word 0xca4a0009  ! 288: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0x8f222418  ! 288: MULScc_I	mulscc 	%r8, 0x0418, %r7
	.word 0xc5220009  ! 291: STF_R	st	%f2, [%r9, %r8]
	.word 0xc20a0009  ! 291: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xbb6a0009  ! 291: SDIVX_R	sdivx	%r8, %r9, %r29
	.word 0xe62a0009  ! 294: STB_R	stb	%r19, [%r8 + %r9]
	.word 0xfa020009  ! 294: LDUW_R	lduw	[%r8 + %r9], %r29
	.word 0x8eda0009  ! 294: SMULcc_R	smulcc 	%r8, %r9, %r7
	.word 0xc6320009  ! 297: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xfa020009  ! 297: LDUW_R	lduw	[%r8 + %r9], %r29
	.word 0x8143c000  ! 297: STBAR	stbar
	.word 0xf33a0009  ! 300: STDF_R	std	%f25, [%r9, %r8]
	.word 0xc25a0009  ! 300: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0x1c800001  ! 300: BPOS	bpos  	<label_0x1>
	.word 0xe82a0009  ! 303: STB_R	stb	%r20, [%r8 + %r9]
	.word 0xda5a0009  ! 303: LDX_R	ldx	[%r8 + %r9], %r13
	.word 0x8143c000  ! 303: STBAR	stbar
	.word 0xcf3a0009  ! 306: STDF_R	std	%f7, [%r9, %r8]
	.word 0xfe4a0009  ! 306: LDSB_R	ldsb	[%r8 + %r9], %r31
	.word 0x85220009  ! 306: MULScc_R	mulscc 	%r8, %r9, %r2
	.word 0xe82a0009  ! 309: STB_R	stb	%r20, [%r8 + %r9]
	.word 0xca0a0009  ! 309: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xcff22009  ! 309: CASXA_R	casxa	[%r8]%asi, %r9, %r7
	.word 0xcf220009  ! 312: STF_R	st	%f7, [%r9, %r8]
	.word 0xc8420009  ! 312: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xc48229a8  ! 312: LDUWA_I	lduwa	[%r8, + 0x09a8] %asi, %r2
	.word 0xc6720009  ! 315: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc6120009  ! 315: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0x00800002  ! 315: BN	bn  	<label_0x2>
	.word 0xca720009  ! 318: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc7020009  ! 318: LDF_R	ld	[%r8, %r9], %f3
	.word 0x3c800001  ! 318: BPOS	bpos,a	<label_0x1>
	.word 0xc82a0009  ! 321: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xe6420009  ! 321: LDSW_R	ldsw	[%r8 + %r9], %r19
	.word 0x24800002  ! 321: BLE	ble,a	<label_0x2>
	.word 0xcb3a0009  ! 324: STDF_R	std	%f5, [%r9, %r8]
	.word 0xe4520009  ! 324: LDSH_R	ldsh	[%r8 + %r9], %r18
	.word 0xfe0228ac  ! 324: LDUW_I	lduw	[%r8 + 0x08ac], %r31
	.word 0xc6220009  ! 327: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xcf1a0009  ! 327: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0x87a209a9  ! 327: FDIVs	fdivs	%f8, %f9, %f3
	.word 0xc4720009  ! 330: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc24a0009  ! 330: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xa522262c  ! 330: MULScc_I	mulscc 	%r8, 0x062c, %r18
	.word 0xc6320009  ! 333: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc2020009  ! 333: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0x89a20929  ! 333: FMULs	fmuls	%f8, %f9, %f4
	.word 0xcf3a0009  ! 336: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc4020009  ! 336: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0x8ba20829  ! 336: FADDs	fadds	%f8, %f9, %f5
	.word 0xca220009  ! 339: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc60a0009  ! 339: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xfca21009  ! 339: STWA_R	stwa	%r30, [%r8 + %r9] 0x80
	.word 0xec720009  ! 342: STX_R	stx	%r22, [%r8 + %r9]
	.word 0xce120009  ! 342: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xc6520009  ! 342: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xcd220009  ! 345: STF_R	st	%f6, [%r9, %r8]
	.word 0xcc120009  ! 345: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xc36a2c9c  ! 345: PREFETCH_I	prefetch	[%r8 + 0x0c9c], #one_read
	.word 0xc82a0009  ! 348: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc2520009  ! 348: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0x8143c000  ! 348: STBAR	stbar
	.word 0xfe320009  ! 351: STH_R	sth	%r31, [%r8 + %r9]
	.word 0xfc120009  ! 351: LDUH_R	lduh	[%r8 + %r9], %r30
	.word 0x83a20829  ! 351: FADDs	fadds	%f8, %f9, %f1
	.word 0xca220009  ! 354: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xca5a0009  ! 354: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xf4da1009  ! 354: LDXA_R	ldxa	[%r8, %r9] 0x80, %r26
	.word 0xcd220009  ! 357: STF_R	st	%f6, [%r9, %r8]
	.word 0xc91a0009  ! 357: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0x3a800001  ! 357: BCC	bcc,a	<label_0x1>
	.word 0xca720009  ! 360: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc71a0009  ! 360: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0x12800001  ! 360: BNE	bne  	<label_0x1>
	.word 0xd93a0009  ! 363: STDF_R	std	%f12, [%r9, %r8]
	.word 0xc4020009  ! 363: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xcaca2edc  ! 363: LDSBA_I	ldsba	[%r8, + 0x0edc] %asi, %r5
	.word 0xcc720009  ! 366: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xcc0a0009  ! 366: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xc36a20ac  ! 366: PREFETCH_I	prefetch	[%r8 + 0x00ac], #one_read
	.word 0xc6320009  ! 369: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc4520009  ! 369: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0x1e800002  ! 369: BVC	bvc  	<label_0x2>
	.word 0xcd220009  ! 372: STF_R	st	%f6, [%r9, %r8]
	.word 0xc65a0009  ! 372: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0x8143e062  ! 372: MEMBAR	membar	#StoreLoad | #MemIssue | #Sync 
	.word 0xc22a0009  ! 375: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xce520009  ! 375: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0x83a20929  ! 375: FMULs	fmuls	%f8, %f9, %f1
	.word 0xce720009  ! 378: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xf1020009  ! 378: LDF_R	ld	[%r8, %r9], %f24
	.word 0x96720009  ! 378: UDIV_R	udiv 	%r8, %r9, %r11
	.word 0xc6220009  ! 381: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc20a0009  ! 381: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xb45228d4  ! 381: UMUL_I	umul 	%r8, 0x08d4, %r26
	.word 0xce720009  ! 384: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc8520009  ! 384: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0x8143e05b  ! 384: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Lookaside | #Sync 
	.word 0xca2a0009  ! 387: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xe31a0009  ! 387: LDDF_R	ldd	[%r8, %r9], %f17
	.word 0x8143c000  ! 387: STBAR	stbar
	.word 0xd82a0009  ! 390: STB_R	stb	%r12, [%r8 + %r9]
	.word 0xe45a0009  ! 390: LDX_R	ldx	[%r8 + %r9], %r18
	.word 0xb52228ac  ! 390: MULScc_I	mulscc 	%r8, 0x08ac, %r26
	.word 0xc9220009  ! 393: STF_R	st	%f4, [%r9, %r8]
	.word 0xc51a0009  ! 393: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0x04c20001  ! 393: BRLEZ	brlez  ,nt	%8,<label_0x20001>
	.word 0xf4220009  ! 396: STW_R	stw	%r26, [%r8 + %r9]
	.word 0xd6420009  ! 396: LDSW_R	ldsw	[%r8 + %r9], %r11
	.word 0xcf3a0009  ! 396: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc4320009  ! 399: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xce420009  ! 399: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0x8143c000  ! 399: STBAR	stbar
	.word 0xc2320009  ! 402: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc4020009  ! 402: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0x886a2938  ! 402: UDIVX_I	udivx 	%r8, 0x0938, %r4
	.word 0xdc720009  ! 405: STX_R	stx	%r14, [%r8 + %r9]
	.word 0xc71a0009  ! 405: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xc53a0009  ! 405: STDF_R	std	%f2, [%r9, %r8]
	.word 0xe8720009  ! 408: STX_R	stx	%r20, [%r8 + %r9]
	.word 0xc85a0009  ! 408: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xb1a20929  ! 408: FMULs	fmuls	%f8, %f9, %f24
	.word 0xc93a0009  ! 411: STDF_R	std	%f4, [%r9, %r8]
	.word 0xcc520009  ! 411: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0x8143e055  ! 411: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside | #Sync 
	.word 0xc6220009  ! 414: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xe04a0009  ! 414: LDSB_R	ldsb	[%r8 + %r9], %r16
	.word 0x8a4a2188  ! 414: MULX_I	mulx 	%r8, 0x0188, %r5
	.word 0xca220009  ! 417: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc5020009  ! 417: LDF_R	ld	[%r8, %r9], %f2
	.word 0xceca2d44  ! 417: LDSBA_I	ldsba	[%r8, + 0x0d44] %asi, %r7
	.word 0xc7220009  ! 420: STF_R	st	%f3, [%r9, %r8]
	.word 0xcc5a0009  ! 420: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xc36a2cfc  ! 420: PREFETCH_I	prefetch	[%r8 + 0x0cfc], #one_read
	.word 0xc53a0009  ! 423: STDF_R	std	%f2, [%r9, %r8]
	.word 0xcc4a0009  ! 423: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xcaea1009  ! 423: LDSTUBA_R	ldstuba	%r5, [%r8 + %r9] 0x80
	.word 0xe8320009  ! 426: STH_R	sth	%r20, [%r8 + %r9]
	.word 0xe3020009  ! 426: LDF_R	ld	[%r8, %r9], %f17
	.word 0xc3ea29ac  ! 426: PREFETCHA_I	prefetcha	[%r8, + 0x09ac] %asi, #one_read
	.word 0xe3220009  ! 429: STF_R	st	%f17, [%r9, %r8]
	.word 0xce520009  ! 429: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xa4da2d54  ! 429: SMULcc_I	smulcc 	%r8, 0x0d54, %r18
	.word 0xf6720009  ! 432: STX_R	stx	%r27, [%r8 + %r9]
	.word 0xe7020009  ! 432: LDF_R	ld	[%r8, %r9], %f19
	.word 0xc36a2684  ! 432: PREFETCH_I	prefetch	[%r8 + 0x0684], #one_read
	.word 0xc8720009  ! 435: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc5020009  ! 435: LDF_R	ld	[%r8, %r9], %f2
	.word 0xc3ea1009  ! 435: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xd8220009  ! 438: STW_R	stw	%r12, [%r8 + %r9]
	.word 0xc20a0009  ! 438: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0x1e800001  ! 438: BVC	bvc  	<label_0x1>
	.word 0xee320009  ! 441: STH_R	sth	%r23, [%r8 + %r9]
	.word 0xe0420009  ! 441: LDSW_R	ldsw	[%r8 + %r9], %r16
	.word 0xf4b22128  ! 441: STHA_I	stha	%r26, [%r8 + 0x0128] %asi
	.word 0xcc2a0009  ! 444: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xcd1a0009  ! 444: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xacd20009  ! 444: UMULcc_R	umulcc 	%r8, %r9, %r22
	.word 0xe53a0009  ! 447: STDF_R	std	%f18, [%r9, %r8]
	.word 0xcc0a0009  ! 447: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xc64a2bf4  ! 447: LDSB_I	ldsb	[%r8 + 0x0bf4], %r3
	.word 0xcb220009  ! 450: STF_R	st	%f5, [%r9, %r8]
	.word 0xee120009  ! 450: LDUH_R	lduh	[%r8 + %r9], %r23
	.word 0xc2d21009  ! 450: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r1
	.word 0xc8720009  ! 453: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc4420009  ! 453: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0x8143e00d  ! 453: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore 
	.word 0xce2a0009  ! 456: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc40a0009  ! 456: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xf0da2998  ! 456: LDXA_I	ldxa	[%r8, + 0x0998] %asi, %r24
	.word 0xc2320009  ! 459: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xfd020009  ! 459: LDF_R	ld	[%r8, %r9], %f30
	.word 0x8c4a0009  ! 459: MULX_R	mulx 	%r8, %r9, %r6
	.word 0xd8720009  ! 462: STX_R	stx	%r12, [%r8 + %r9]
	.word 0xe5020009  ! 462: LDF_R	ld	[%r8, %r9], %f18
	.word 0x8c4a0009  ! 462: MULX_R	mulx 	%r8, %r9, %r6
	.word 0xe2720009  ! 465: STX_R	stx	%r17, [%r8 + %r9]
	.word 0xc9020009  ! 465: LDF_R	ld	[%r8, %r9], %f4
	.word 0xc65a2828  ! 465: LDX_I	ldx	[%r8 + 0x0828], %r3
	.word 0xcd220009  ! 468: STF_R	st	%f6, [%r9, %r8]
	.word 0xe11a0009  ! 468: LDDF_R	ldd	[%r8, %r9], %f16
	.word 0x89a20929  ! 468: FMULs	fmuls	%f8, %f9, %f4
	.word 0xca2a0009  ! 471: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xce020009  ! 471: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0x87a20929  ! 471: FMULs	fmuls	%f8, %f9, %f3
	.word 0xf2220009  ! 474: STW_R	stw	%r25, [%r8 + %r9]
	.word 0xcc520009  ! 474: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xc91a2038  ! 474: LDDF_I	ldd	[%r8, 0x0038], %f4
	.word 0xc6220009  ! 477: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xe8120009  ! 477: LDUH_R	lduh	[%r8 + %r9], %r20
	.word 0xc8422190  ! 477: LDSW_I	ldsw	[%r8 + 0x0190], %r4
	.word 0xe2320009  ! 480: STH_R	sth	%r17, [%r8 + %r9]
	.word 0xc3020009  ! 480: LDF_R	ld	[%r8, %r9], %f1
	.word 0xca022628  ! 480: LDUW_I	lduw	[%r8 + 0x0628], %r5
	.word 0xe1220009  ! 483: STF_R	st	%f16, [%r9, %r8]
	.word 0xca5a0009  ! 483: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0x2eca0001  ! 483: BRGEZ	brgez,a,pt	%8,<label_0xa0001>
	.word 0xcd220009  ! 486: STF_R	st	%f6, [%r9, %r8]
	.word 0xc51a0009  ! 486: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xc67a0009  ! 486: SWAP_R	swap	%r3, [%r8 + %r9]
	.word 0xc7220009  ! 489: STF_R	st	%f3, [%r9, %r8]
	.word 0xc40a0009  ! 489: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0x8143e017  ! 489: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside 
	.word 0xca220009  ! 492: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc4120009  ! 492: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xba4a27f4  ! 492: MULX_I	mulx 	%r8, 0x07f4, %r29
	.word 0xfa720009  ! 495: STX_R	stx	%r29, [%r8 + %r9]
	.word 0xe0020009  ! 495: LDUW_R	lduw	[%r8 + %r9], %r16
	.word 0x8e722074  ! 495: UDIV_I	udiv 	%r8, 0x0074, %r7
	.word 0xcc320009  ! 498: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xce120009  ! 498: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xcdf21009  ! 498: CASXA_I	casxa	[%r8] 0x80, %r9, %r6
	.word 0xe6220009  ! 501: STW_R	stw	%r19, [%r8 + %r9]
	.word 0xcc420009  ! 501: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0x24800001  ! 501: BLE	ble,a	<label_0x1>
	.word 0xc2320009  ! 504: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xfc5a0009  ! 504: LDX_R	ldx	[%r8 + %r9], %r30
	.word 0xcab226b0  ! 504: STHA_I	stha	%r5, [%r8 + 0x06b0] %asi
	.word 0xce720009  ! 507: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xe4420009  ! 507: LDSW_R	ldsw	[%r8 + %r9], %r18
	.word 0xc2ea2d64  ! 507: LDSTUBA_I	ldstuba	%r1, [%r8 + 0x0d64] %asi
	.word 0xcc2a0009  ! 510: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xd64a0009  ! 510: LDSB_R	ldsb	[%r8 + %r9], %r11
	.word 0xd93a0009  ! 510: STDF_R	std	%f12, [%r9, %r8]
	.word 0xce2a0009  ! 513: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xd6420009  ! 513: LDSW_R	ldsw	[%r8 + %r9], %r11
	.word 0xc8a21009  ! 513: STWA_R	stwa	%r4, [%r8 + %r9] 0x80
	.word 0xc82a0009  ! 516: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc4420009  ! 516: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0x24800002  ! 516: BLE	ble,a	<label_0x2>
	.word 0xe2320009  ! 519: STH_R	sth	%r17, [%r8 + %r9]
	.word 0xcc5a0009  ! 519: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xc36a2934  ! 519: PREFETCH_I	prefetch	[%r8 + 0x0934], #one_read
	.word 0xcf3a0009  ! 522: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc8520009  ! 522: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0x8ad20009  ! 522: UMULcc_R	umulcc 	%r8, %r9, %r5
	.word 0xca320009  ! 525: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xcf1a0009  ! 525: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xc53a2a90  ! 525: STDF_I	std	%f2, [0x0a90, %r8]
	.word 0xc4220009  ! 528: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xca020009  ! 528: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0x9eda2b24  ! 528: SMULcc_I	smulcc 	%r8, 0x0b24, %r15
	.word 0xf2320009  ! 531: STH_R	sth	%r25, [%r8 + %r9]
	.word 0xd8020009  ! 531: LDUW_R	lduw	[%r8 + %r9], %r12
	.word 0x8143c000  ! 531: STBAR	stbar
	.word 0xc4320009  ! 534: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xf3020009  ! 534: LDF_R	ld	[%r8, %r9], %f25
	.word 0xc36a0009  ! 534: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xd8320009  ! 537: STH_R	sth	%r12, [%r8 + %r9]
	.word 0xc20a0009  ! 537: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xa7220009  ! 537: MULScc_R	mulscc 	%r8, %r9, %r19
	.word 0xca2a0009  ! 540: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xce0a0009  ! 540: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xc47a0009  ! 540: SWAP_R	swap	%r2, [%r8 + %r9]
	.word 0xcc720009  ! 543: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xee120009  ! 543: LDUH_R	lduh	[%r8 + %r9], %r23
	.word 0xc6c21009  ! 543: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r3
	.word 0xc6320009  ! 546: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xcc5a0009  ! 546: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0x8143e062  ! 546: MEMBAR	membar	#StoreLoad | #MemIssue | #Sync 
	.word 0xce720009  ! 549: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xcc120009  ! 549: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xe0f21009  ! 549: STXA_R	stxa	%r16, [%r8 + %r9] 0x80
	.word 0xec320009  ! 552: STH_R	sth	%r22, [%r8 + %r9]
	.word 0xfa0a0009  ! 552: LDUB_R	ldub	[%r8 + %r9], %r29
	.word 0x8143e01f  ! 552: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #Lookaside 
	.word 0xdc220009  ! 555: STW_R	stw	%r14, [%r8 + %r9]
	.word 0xcc0a0009  ! 555: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xc60a0009  ! 555: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xcf220009  ! 558: STF_R	st	%f7, [%r9, %r8]
	.word 0xc31a0009  ! 558: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xcec22734  ! 558: LDSWA_I	ldswa	[%r8, + 0x0734] %asi, %r7
	.word 0xc4220009  ! 561: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xda0a0009  ! 561: LDUB_R	ldub	[%r8 + %r9], %r13
	.word 0xc8aa1009  ! 561: STBA_R	stba	%r4, [%r8 + %r9] 0x80
	.word 0xc2320009  ! 564: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc2120009  ! 564: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0x8143e05f  ! 564: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0xcc720009  ! 567: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xea120009  ! 567: LDUH_R	lduh	[%r8 + %r9], %r21
	.word 0x1c800002  ! 567: BPOS	bpos  	<label_0x2>
	.word 0xcc220009  ! 570: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc25a0009  ! 570: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xc6aa1009  ! 570: STBA_R	stba	%r3, [%r8 + %r9] 0x80
	.word 0xfc2a0009  ! 573: STB_R	stb	%r30, [%r8 + %r9]
	.word 0xca120009  ! 573: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0x02800002  ! 573: BE	be  	<label_0x2>
	.word 0xfe720009  ! 576: STX_R	stx	%r31, [%r8 + %r9]
	.word 0xc44a0009  ! 576: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xc36a0009  ! 576: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc3220009  ! 579: STF_R	st	%f1, [%r9, %r8]
	.word 0xea420009  ! 579: LDSW_R	ldsw	[%r8 + %r9], %r21
	.word 0xc68a1009  ! 579: LDUBA_R	lduba	[%r8, %r9] 0x80, %r3
	.word 0xdf220009  ! 582: STF_R	st	%f15, [%r9, %r8]
	.word 0xcc5a0009  ! 582: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xc3ea1009  ! 582: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc4220009  ! 585: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xf04a0009  ! 585: LDSB_R	ldsb	[%r8 + %r9], %r24
	.word 0x84d22c8c  ! 585: UMULcc_I	umulcc 	%r8, 0x0c8c, %r2
	.word 0xe4220009  ! 588: STW_R	stw	%r18, [%r8 + %r9]
	.word 0xc7020009  ! 588: LDF_R	ld	[%r8, %r9], %f3
	.word 0x20800001  ! 588: BN	bn,a	<label_0x1>
	.word 0xcc320009  ! 591: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xdb020009  ! 591: LDF_R	ld	[%r8, %r9], %f13
	.word 0x82f20009  ! 591: UDIVcc_R	udivcc 	%r8, %r9, %r1
	.word 0xfe320009  ! 594: STH_R	sth	%r31, [%r8 + %r9]
	.word 0xdb1a0009  ! 594: LDDF_R	ldd	[%r8, %r9], %f13
	.word 0x8e5a0009  ! 594: SMUL_R	smul 	%r8, %r9, %r7
	.word 0xe0720009  ! 597: STX_R	stx	%r16, [%r8 + %r9]
	.word 0xe20a0009  ! 597: LDUB_R	ldub	[%r8 + %r9], %r17
	.word 0x8ba20929  ! 597: FMULs	fmuls	%f8, %f9, %f5
	.word 0xf1220009  ! 600: STF_R	st	%f24, [%r9, %r8]
	.word 0xec0a0009  ! 600: LDUB_R	ldub	[%r8 + %r9], %r22
	.word 0xc3ea1009  ! 600: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xcc220009  ! 603: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xe44a0009  ! 603: LDSB_R	ldsb	[%r8 + %r9], %r18
	.word 0x82f20009  ! 603: UDIVcc_R	udivcc 	%r8, %r9, %r1
	.word 0xcc2a0009  ! 606: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xec020009  ! 606: LDUW_R	lduw	[%r8 + %r9], %r22
	.word 0xec4a0009  ! 606: LDSB_R	ldsb	[%r8 + %r9], %r22
	.word 0xfa720009  ! 609: STX_R	stx	%r29, [%r8 + %r9]
	.word 0xca5a0009  ! 609: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0x3a800001  ! 609: BCC	bcc,a	<label_0x1>
	.word 0xc53a0009  ! 612: STDF_R	std	%f2, [%r9, %r8]
	.word 0xce020009  ! 612: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xe8da22d0  ! 612: LDXA_I	ldxa	[%r8, + 0x02d0] %asi, %r20
	.word 0xea220009  ! 615: STW_R	stw	%r21, [%r8 + %r9]
	.word 0xc2520009  ! 615: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xc3ea2a14  ! 615: PREFETCHA_I	prefetcha	[%r8, + 0x0a14] %asi, #one_read
	.word 0xe8220009  ! 618: STW_R	stw	%r20, [%r8 + %r9]
	.word 0xc9020009  ! 618: LDF_R	ld	[%r8, %r9], %f4
	.word 0xcbe22009  ! 618: CASA_R	casa	[%r8] %asi, %r9, %r5
	.word 0xde2a0009  ! 621: STB_R	stb	%r15, [%r8 + %r9]
	.word 0xc91a0009  ! 621: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0x0c800001  ! 621: BNEG	bneg  	<label_0x1>
	.word 0xe62a0009  ! 624: STB_R	stb	%r19, [%r8 + %r9]
	.word 0xc6120009  ! 624: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0x99a20929  ! 624: FMULs	fmuls	%f8, %f9, %f12
	.word 0xfa720009  ! 627: STX_R	stx	%r29, [%r8 + %r9]
	.word 0xc8420009  ! 627: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0x8ed22228  ! 627: UMULcc_I	umulcc 	%r8, 0x0228, %r7
	.word 0xc6320009  ! 630: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc8120009  ! 630: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xe84a0009  ! 630: LDSB_R	ldsb	[%r8 + %r9], %r20
	.word 0xc9220009  ! 633: STF_R	st	%f4, [%r9, %r8]
	.word 0xe0120009  ! 633: LDUH_R	lduh	[%r8 + %r9], %r16
	.word 0xda5a0009  ! 633: LDX_R	ldx	[%r8 + %r9], %r13
	.word 0xfe720009  ! 636: STX_R	stx	%r31, [%r8 + %r9]
	.word 0xc65a0009  ! 636: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0x08800001  ! 636: BLEU	bleu  	<label_0x1>
	.word 0xfc320009  ! 639: STH_R	sth	%r30, [%r8 + %r9]
	.word 0xc9020009  ! 639: LDF_R	ld	[%r8, %r9], %f4
	.word 0x9ba20929  ! 639: FMULs	fmuls	%f8, %f9, %f13
	.word 0xcc320009  ! 642: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xe24a0009  ! 642: LDSB_R	ldsb	[%r8 + %r9], %r17
	.word 0xceb22154  ! 642: STHA_I	stha	%r7, [%r8 + 0x0154] %asi
	.word 0xe2720009  ! 645: STX_R	stx	%r17, [%r8 + %r9]
	.word 0xcd1a0009  ! 645: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xccba1009  ! 645: STDA_R	stda	%r6, [%r8 + %r9] 0x80
	.word 0xf4320009  ! 648: STH_R	sth	%r26, [%r8 + %r9]
	.word 0xe8020009  ! 648: LDUW_R	lduw	[%r8 + %r9], %r20
	.word 0x8efa0009  ! 648: SDIVcc_R	sdivcc 	%r8, %r9, %r7
	.word 0xc2220009  ! 651: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc24a0009  ! 651: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0x8143e022  ! 651: MEMBAR	membar	#StoreLoad | #MemIssue 
	.word 0xf6720009  ! 654: STX_R	stx	%r27, [%r8 + %r9]
	.word 0xc71a0009  ! 654: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0x88522924  ! 654: UMUL_I	umul 	%r8, 0x0924, %r4
	.word 0xca220009  ! 657: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc45a0009  ! 657: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xdcba25b0  ! 657: STDA_I	stda	%r14, [%r8 + 0x05b0] %asi
	.word 0xf2320009  ! 660: STH_R	sth	%r25, [%r8 + %r9]
	.word 0xe44a0009  ! 660: LDSB_R	ldsb	[%r8 + %r9], %r18
	.word 0xc6da1009  ! 660: LDXA_R	ldxa	[%r8, %r9] 0x80, %r3
	.word 0xca720009  ! 663: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xf91a0009  ! 663: LDDF_R	ldd	[%r8, %r9], %f28
	.word 0x825a253c  ! 663: SMUL_I	smul 	%r8, 0x053c, %r1
	.word 0xc73a0009  ! 666: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc40a0009  ! 666: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0x08800001  ! 666: BLEU	bleu  	<label_0x1>
	.word 0xfa720009  ! 669: STX_R	stx	%r29, [%r8 + %r9]
	.word 0xc31a0009  ! 669: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0x85a209a9  ! 669: FDIVs	fdivs	%f8, %f9, %f2
	.word 0xd73a0009  ! 672: STDF_R	std	%f11, [%r9, %r8]
	.word 0xf71a0009  ! 672: LDDF_R	ldd	[%r8, %r9], %f27
	.word 0xf05a2438  ! 672: LDX_I	ldx	[%r8 + 0x0438], %r24
	.word 0xc33a0009  ! 675: STDF_R	std	%f1, [%r9, %r8]
	.word 0xce420009  ! 675: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0x96da2bd4  ! 675: SMULcc_I	smulcc 	%r8, 0x0bd4, %r11
	.word 0xf4720009  ! 678: STX_R	stx	%r26, [%r8 + %r9]
	.word 0xd84a0009  ! 678: LDSB_R	ldsb	[%r8 + %r9], %r12
	.word 0xf8b21009  ! 678: STHA_R	stha	%r28, [%r8 + %r9] 0x80
	.word 0xc42a0009  ! 681: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc40a0009  ! 681: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0x8143c000  ! 681: STBAR	stbar
	.word 0xca2a0009  ! 684: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc3020009  ! 684: LDF_R	ld	[%r8, %r9], %f1
	.word 0xf6b21009  ! 684: STHA_R	stha	%r27, [%r8 + %r9] 0x80
	.word 0xc4220009  ! 687: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc60a0009  ! 687: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xc4b22498  ! 687: STHA_I	stha	%r2, [%r8 + 0x0498] %asi
	.word 0xc8220009  ! 690: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc4520009  ! 690: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0x84da0009  ! 690: SMULcc_R	smulcc 	%r8, %r9, %r2
	.word 0xce720009  ! 693: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xf2020009  ! 693: LDUW_R	lduw	[%r8 + %r9], %r25
	.word 0xca822b28  ! 693: LDUWA_I	lduwa	[%r8, + 0x0b28] %asi, %r5
	.word 0xc2720009  ! 696: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xe2120009  ! 696: LDUH_R	lduh	[%r8 + %r9], %r17
	.word 0x86720009  ! 696: UDIV_R	udiv 	%r8, %r9, %r3
	.word 0xec720009  ! 699: STX_R	stx	%r22, [%r8 + %r9]
	.word 0xc51a0009  ! 699: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xba7a0009  ! 699: SDIV_R	sdiv 	%r8, %r9, %r29
	.word 0xc6220009  ! 702: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xeb1a0009  ! 702: LDDF_R	ldd	[%r8, %r9], %f21
	.word 0x8143c000  ! 702: STBAR	stbar
	.word 0xf93a0009  ! 705: STDF_R	std	%f28, [%r9, %r8]
	.word 0xce5a0009  ! 705: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0x32800001  ! 705: BNE	bne,a	<label_0x1>
	.word 0xc5220009  ! 708: STF_R	st	%f2, [%r9, %r8]
	.word 0xc6020009  ! 708: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0x9da209a9  ! 708: FDIVs	fdivs	%f8, %f9, %f14
	.word 0xc4220009  ! 711: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xce5a0009  ! 711: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xc66a0009  ! 711: LDSTUB_R	ldstub	%r3, [%r8 + %r9]
	.word 0xeb3a0009  ! 714: STDF_R	std	%f21, [%r9, %r8]
	.word 0xe20a0009  ! 714: LDUB_R	ldub	[%r8 + %r9], %r17
	.word 0x96f228f0  ! 714: UDIVcc_I	udivcc 	%r8, 0x08f0, %r11
	.word 0xc9220009  ! 717: STF_R	st	%f4, [%r9, %r8]
	.word 0xee4a0009  ! 717: LDSB_R	ldsb	[%r8 + %r9], %r23
	.word 0x8143c000  ! 717: STBAR	stbar
	.word 0xf1220009  ! 720: STF_R	st	%f24, [%r9, %r8]
	.word 0xee520009  ! 720: LDSH_R	ldsh	[%r8 + %r9], %r23
	.word 0xcf2225cc  ! 720: STF_I	st	%f7, [0x05cc, %r8]
	.word 0xca720009  ! 723: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc65a0009  ! 723: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0x8da209a9  ! 723: FDIVs	fdivs	%f8, %f9, %f6
	.word 0xff3a0009  ! 726: STDF_R	std	%f31, [%r9, %r8]
	.word 0xc3020009  ! 726: LDF_R	ld	[%r8, %r9], %f1
	.word 0xc3ea2014  ! 726: PREFETCHA_I	prefetcha	[%r8, + 0x0014] %asi, #one_read
	.word 0xca320009  ! 729: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xe24a0009  ! 729: LDSB_R	ldsb	[%r8 + %r9], %r17
	.word 0x04800002  ! 729: BLE	ble  	<label_0x2>
	.word 0xf13a0009  ! 732: STDF_R	std	%f24, [%r9, %r8]
	.word 0xc8020009  ! 732: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xec7a2550  ! 732: SWAP_I	swap	%r22, [%r8 + 0x0550]
	.word 0xc6320009  ! 735: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc6520009  ! 735: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0x8afa0009  ! 735: SDIVcc_R	sdivcc 	%r8, %r9, %r5
	.word 0xf0720009  ! 738: STX_R	stx	%r24, [%r8 + %r9]
	.word 0xc64a0009  ! 738: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xf0ba1009  ! 738: STDA_R	stda	%r24, [%r8 + %r9] 0x80
	.word 0xf6220009  ! 741: STW_R	stw	%r27, [%r8 + %r9]
	.word 0xd6420009  ! 741: LDSW_R	ldsw	[%r8 + %r9], %r11
	.word 0x85222a9c  ! 741: MULScc_I	mulscc 	%r8, 0x0a9c, %r2
	.word 0xcf3a0009  ! 744: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc24a0009  ! 744: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xe0822394  ! 744: LDUWA_I	lduwa	[%r8, + 0x0394] %asi, %r16
	.word 0xc33a0009  ! 747: STDF_R	std	%f1, [%r9, %r8]
	.word 0xce120009  ! 747: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0x97a20929  ! 747: FMULs	fmuls	%f8, %f9, %f11
	.word 0xce220009  ! 750: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc4120009  ! 750: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xd6f223e0  ! 750: STXA_I	stxa	%r11, [%r8 + 0x03e0] %asi
	.word 0xdd220009  ! 753: STF_R	st	%f14, [%r9, %r8]
	.word 0xc64a0009  ! 753: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0x827a2094  ! 753: SDIV_I	sdiv 	%r8, 0x0094, %r1
	.word 0xde320009  ! 756: STH_R	sth	%r15, [%r8 + %r9]
	.word 0xc85a0009  ! 756: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xe2da1009  ! 756: LDXA_R	ldxa	[%r8, %r9] 0x80, %r17
	.word 0xcc320009  ! 759: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc65a0009  ! 759: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xc8aa1009  ! 759: STBA_R	stba	%r4, [%r8 + %r9] 0x80
	.word 0xc4320009  ! 762: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xd7020009  ! 762: LDF_R	ld	[%r8, %r9], %f11
	.word 0xc46a2024  ! 762: LDSTUB_I	ldstub	%r2, [%r8 + 0x0024]
	.word 0xce2a0009  ! 765: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xfe4a0009  ! 765: LDSB_R	ldsb	[%r8 + %r9], %r31
	.word 0xd8ba2dd8  ! 765: STDA_I	stda	%r12, [%r8 + 0x0dd8] %asi
	.word 0xcf220009  ! 768: STF_R	st	%f7, [%r9, %r8]
	.word 0xc64a0009  ! 768: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xc6fa2fdc  ! 768: SWAPA_I	swapa	%r3, [%r8 + 0x0fdc] %asi
	.word 0xc6320009  ! 771: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc4520009  ! 771: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0x0e800001  ! 771: BVS	bvs  	<label_0x1>
	.word 0xdf3a0009  ! 774: STDF_R	std	%f15, [%r9, %r8]
	.word 0xe5020009  ! 774: LDF_R	ld	[%r8, %r9], %f18
	.word 0xe2ca1009  ! 774: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r17
	.word 0xe2720009  ! 777: STX_R	stx	%r17, [%r8 + %r9]
	.word 0xfe120009  ! 777: LDUH_R	lduh	[%r8 + %r9], %r31
	.word 0x8c522c90  ! 777: UMUL_I	umul 	%r8, 0x0c90, %r6
	.word 0xe62a0009  ! 780: STB_R	stb	%r19, [%r8 + %r9]
	.word 0xda4a0009  ! 780: LDSB_R	ldsb	[%r8 + %r9], %r13
	.word 0xcaea2708  ! 780: LDSTUBA_I	ldstuba	%r5, [%r8 + 0x0708] %asi
	.word 0xe0220009  ! 783: STW_R	stw	%r16, [%r8 + %r9]
	.word 0xce520009  ! 783: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xc6822cf4  ! 783: LDUWA_I	lduwa	[%r8, + 0x0cf4] %asi, %r3
	.word 0xf33a0009  ! 786: STDF_R	std	%f25, [%r9, %r8]
	.word 0xc71a0009  ! 786: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xef3a2228  ! 786: STDF_I	std	%f23, [0x0228, %r8]
	.word 0xcf3a0009  ! 789: STDF_R	std	%f7, [%r9, %r8]
	.word 0xd80a0009  ! 789: LDUB_R	ldub	[%r8 + %r9], %r12
	.word 0x8fa209a9  ! 789: FDIVs	fdivs	%f8, %f9, %f7
	.word 0xca720009  ! 792: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xca5a0009  ! 792: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xc3ea1009  ! 792: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xcc720009  ! 795: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc84a0009  ! 795: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xc36a0009  ! 795: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xeb3a0009  ! 798: STDF_R	std	%f21, [%r9, %r8]
	.word 0xe00a0009  ! 798: LDUB_R	ldub	[%r8 + %r9], %r16
	.word 0xe9222b34  ! 798: STF_I	st	%f20, [0x0b34, %r8]
	.word 0xdb220009  ! 801: STF_R	st	%f13, [%r9, %r8]
	.word 0xce5a0009  ! 801: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xb87a0009  ! 801: SDIV_R	sdiv 	%r8, %r9, %r28
	.word 0xd8720009  ! 804: STX_R	stx	%r12, [%r8 + %r9]
	.word 0xe00a0009  ! 804: LDUB_R	ldub	[%r8 + %r9], %r16
	.word 0x86520009  ! 804: UMUL_R	umul 	%r8, %r9, %r3
	.word 0xe93a0009  ! 807: STDF_R	std	%f20, [%r9, %r8]
	.word 0xcb020009  ! 807: LDF_R	ld	[%r8, %r9], %f5
	.word 0xc6ea2280  ! 807: LDSTUBA_I	ldstuba	%r3, [%r8 + 0x0280] %asi
	.word 0xc4220009  ! 810: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc6120009  ! 810: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xc2aa203c  ! 810: STBA_I	stba	%r1, [%r8 + 0x003c] %asi
	.word 0xc4720009  ! 813: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc8120009  ! 813: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xf5222968  ! 813: STF_I	st	%f26, [0x0968, %r8]
	.word 0xcc2a0009  ! 816: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc51a0009  ! 816: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xc9e22009  ! 816: CASA_R	casa	[%r8] %asi, %r9, %r4
	.word 0xc6220009  ! 819: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xe40a0009  ! 819: LDUB_R	ldub	[%r8 + %r9], %r18
	.word 0x20800001  ! 819: BN	bn,a	<label_0x1>
	.word 0xf2320009  ! 822: STH_R	sth	%r25, [%r8 + %r9]
	.word 0xcc020009  ! 822: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xcc4a2090  ! 822: LDSB_I	ldsb	[%r8 + 0x0090], %r6
	.word 0xce220009  ! 825: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xcc420009  ! 825: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xd60a2230  ! 825: LDUB_I	ldub	[%r8 + 0x0230], %r11
	.word 0xe0220009  ! 828: STW_R	stw	%r16, [%r8 + %r9]
	.word 0xc9020009  ! 828: LDF_R	ld	[%r8, %r9], %f4
	.word 0x88da0009  ! 828: SMULcc_R	smulcc 	%r8, %r9, %r4
	.word 0xc4220009  ! 831: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc9020009  ! 831: LDF_R	ld	[%r8, %r9], %f4
	.word 0x8b220009  ! 831: MULScc_R	mulscc 	%r8, %r9, %r5
	.word 0xca2a0009  ! 834: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xe11a0009  ! 834: LDDF_R	ldd	[%r8, %r9], %f16
	.word 0xfca22a88  ! 834: STWA_I	stwa	%r30, [%r8 + 0x0a88] %asi
	.word 0xc4220009  ! 837: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc4420009  ! 837: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xc3ea2708  ! 837: PREFETCHA_I	prefetcha	[%r8, + 0x0708] %asi, #one_read
	.word 0xc33a0009  ! 840: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc71a0009  ! 840: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0x0e800001  ! 840: BVS	bvs  	<label_0x1>
	.word 0xc4720009  ! 843: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xca420009  ! 843: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0x827a2ea4  ! 843: SDIV_I	sdiv 	%r8, 0x0ea4, %r1
	.word 0xde720009  ! 846: STX_R	stx	%r15, [%r8 + %r9]
	.word 0xc85a0009  ! 846: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0x8143c000  ! 846: STBAR	stbar
	.word 0xf22a0009  ! 849: STB_R	stb	%r25, [%r8 + %r9]
	.word 0xde420009  ! 849: LDSW_R	ldsw	[%r8 + %r9], %r15
	.word 0x8143c000  ! 849: STBAR	stbar
	.word 0xca320009  ! 852: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xcf1a0009  ! 852: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0x3e800001  ! 852: BVC	bvc,a	<label_0x1>
	.word 0xc3220009  ! 855: STF_R	st	%f1, [%r9, %r8]
	.word 0xca4a0009  ! 855: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xfaca1009  ! 855: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r29
	.word 0xd8720009  ! 858: STX_R	stx	%r12, [%r8 + %r9]
	.word 0xcc5a0009  ! 858: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xcbe21009  ! 858: CASA_I	casa	[%r8] 0x80, %r9, %r5
	.word 0xeb3a0009  ! 861: STDF_R	std	%f21, [%r9, %r8]
	.word 0xc2020009  ! 861: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xc4fa1009  ! 861: SWAPA_R	swapa	%r2, [%r8 + %r9] 0x80
	.word 0xcc2a0009  ! 864: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xce420009  ! 864: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xe0020009  ! 864: LDUW_R	lduw	[%r8 + %r9], %r16
	.word 0xcf3a0009  ! 867: STDF_R	std	%f7, [%r9, %r8]
	.word 0xd6120009  ! 867: LDUH_R	lduh	[%r8 + %r9], %r11
	.word 0x864a213c  ! 867: MULX_I	mulx 	%r8, 0x013c, %r3
	.word 0xfd220009  ! 870: STF_R	st	%f30, [%r9, %r8]
	.word 0xfe020009  ! 870: LDUW_R	lduw	[%r8 + %r9], %r31
	.word 0x8f220009  ! 870: MULScc_R	mulscc 	%r8, %r9, %r7
	.word 0xce2a0009  ! 873: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc20a0009  ! 873: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xfc0220c8  ! 873: LDUW_I	lduw	[%r8 + 0x00c8], %r30
	.word 0xc5220009  ! 876: STF_R	st	%f2, [%r9, %r8]
	.word 0xf6120009  ! 876: LDUH_R	lduh	[%r8 + %r9], %r27
	.word 0xc3ea2194  ! 876: PREFETCHA_I	prefetcha	[%r8, + 0x0194] %asi, #one_read
	.word 0xc4220009  ! 879: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xe3020009  ! 879: LDF_R	ld	[%r8, %r9], %f17
	.word 0xa84a2c10  ! 879: MULX_I	mulx 	%r8, 0x0c10, %r20
	.word 0xc6720009  ! 882: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc40a0009  ! 882: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xc6ca2114  ! 882: LDSBA_I	ldsba	[%r8, + 0x0114] %asi, %r3
	.word 0xe53a0009  ! 885: STDF_R	std	%f18, [%r9, %r8]
	.word 0xe91a0009  ! 885: LDDF_R	ldd	[%r8, %r9], %f20
	.word 0x8143c000  ! 885: STBAR	stbar
	.word 0xcb3a0009  ! 888: STDF_R	std	%f5, [%r9, %r8]
	.word 0xc25a0009  ! 888: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xca82235c  ! 888: LDUWA_I	lduwa	[%r8, + 0x035c] %asi, %r5
	.word 0xce720009  ! 891: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc2520009  ! 891: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xc6ea1009  ! 891: LDSTUBA_R	ldstuba	%r3, [%r8 + %r9] 0x80
	.word 0xc8320009  ! 894: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xca420009  ! 894: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0x86520009  ! 894: UMUL_R	umul 	%r8, %r9, %r3
	.word 0xcb3a0009  ! 897: STDF_R	std	%f5, [%r9, %r8]
	.word 0xc4420009  ! 897: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0x0eca0001  ! 897: BRGEZ	brgez  ,pt	%8,<label_0xa0001>
	.word 0xd6220009  ! 900: STW_R	stw	%r11, [%r8 + %r9]
	.word 0xf8420009  ! 900: LDSW_R	ldsw	[%r8 + %r9], %r28
	.word 0xc36a2704  ! 900: PREFETCH_I	prefetch	[%r8 + 0x0704], #one_read
	.word 0xc33a0009  ! 903: STDF_R	std	%f1, [%r9, %r8]
	.word 0xfc5a0009  ! 903: LDX_R	ldx	[%r8 + %r9], %r30
	.word 0x3a800001  ! 903: BCC	bcc,a	<label_0x1>
	.word 0xe6320009  ! 906: STH_R	sth	%r19, [%r8 + %r9]
	.word 0xc45a0009  ! 906: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xcaa22790  ! 906: STWA_I	stwa	%r5, [%r8 + 0x0790] %asi
	.word 0xc33a0009  ! 909: STDF_R	std	%f1, [%r9, %r8]
	.word 0xe3020009  ! 909: LDF_R	ld	[%r8, %r9], %f17
	.word 0xf8b22424  ! 909: STHA_I	stha	%r28, [%r8 + 0x0424] %asi
	.word 0xc73a0009  ! 912: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc84a0009  ! 912: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xa4da0009  ! 912: SMULcc_R	smulcc 	%r8, %r9, %r18
	.word 0xc4720009  ! 915: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xd60a0009  ! 915: LDUB_R	ldub	[%r8 + %r9], %r11
	.word 0xee7a28c0  ! 915: SWAP_I	swap	%r23, [%r8 + 0x08c0]
	.word 0xcc320009  ! 918: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc4520009  ! 918: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xcf1a0009  ! 918: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xcc320009  ! 921: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xca5a0009  ! 921: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xcefa1009  ! 921: SWAPA_R	swapa	%r7, [%r8 + %r9] 0x80
	.word 0xf0320009  ! 924: STH_R	sth	%r24, [%r8 + %r9]
	.word 0xce4a0009  ! 924: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0x845a214c  ! 924: SMUL_I	smul 	%r8, 0x014c, %r2
	.word 0xcc2a0009  ! 927: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xcc420009  ! 927: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0x2e800002  ! 927: BVS	bvs,a	<label_0x2>
	.word 0xc2320009  ! 930: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xcd1a0009  ! 930: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0x8ba209a9  ! 930: FDIVs	fdivs	%f8, %f9, %f5
	.word 0xe2320009  ! 933: STH_R	sth	%r17, [%r8 + %r9]
	.word 0xcc420009  ! 933: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0x84f20009  ! 933: UDIVcc_R	udivcc 	%r8, %r9, %r2
	.word 0xcb3a0009  ! 936: STDF_R	std	%f5, [%r9, %r8]
	.word 0xca120009  ! 936: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xc2a22628  ! 936: STWA_I	stwa	%r1, [%r8 + 0x0628] %asi
	.word 0xe7220009  ! 939: STF_R	st	%f19, [%r9, %r8]
	.word 0xc80a0009  ! 939: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0x26800002  ! 939: BL	bl,a	<label_0x2>
	.word 0xc5220009  ! 942: STF_R	st	%f2, [%r9, %r8]
	.word 0xfa5a0009  ! 942: LDX_R	ldx	[%r8 + %r9], %r29
	.word 0xc8520009  ! 942: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xe62a0009  ! 945: STB_R	stb	%r19, [%r8 + %r9]
	.word 0xcc0a0009  ! 945: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xc9e21009  ! 945: CASA_I	casa	[%r8] 0x80, %r9, %r4
	.word 0xfa720009  ! 948: STX_R	stx	%r29, [%r8 + %r9]
	.word 0xc6020009  ! 948: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xc2a21009  ! 948: STWA_R	stwa	%r1, [%r8 + %r9] 0x80
	.word 0xca220009  ! 951: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc4520009  ! 951: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0x8143e025  ! 951: MEMBAR	membar	#LoadLoad | #LoadStore | #MemIssue 
	.word 0xc5220009  ! 954: STF_R	st	%f2, [%r9, %r8]
	.word 0xc44a0009  ! 954: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0x8c7a25b4  ! 954: SDIV_I	sdiv 	%r8, 0x05b4, %r6
	.word 0xc2720009  ! 957: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc91a0009  ! 957: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xc4020009  ! 957: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xea2a0009  ! 960: STB_R	stb	%r21, [%r8 + %r9]
	.word 0xc6120009  ! 960: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xdbf21009  ! 960: CASXA_I	casxa	[%r8] 0x80, %r9, %r13
	.word 0xc3220009  ! 963: STF_R	st	%f1, [%r9, %r8]
	.word 0xc25a0009  ! 963: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xf05a2578  ! 963: LDX_I	ldx	[%r8 + 0x0578], %r24
	.word 0xca2a0009  ! 966: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc8120009  ! 966: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xee522298  ! 966: LDSH_I	ldsh	[%r8 + 0x0298], %r23
	.word 0xd8220009  ! 969: STW_R	stw	%r12, [%r8 + %r9]
	.word 0xca020009  ! 969: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xdc0a2ee0  ! 969: LDUB_I	ldub	[%r8 + 0x0ee0], %r14
	.word 0xc9220009  ! 972: STF_R	st	%f4, [%r9, %r8]
	.word 0xc25a0009  ! 972: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0x16800001  ! 972: BGE	bge  	<label_0x1>
	.word 0xf9220009  ! 975: STF_R	st	%f28, [%r9, %r8]
	.word 0xca520009  ! 975: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xc4d22db0  ! 975: LDSHA_I	ldsha	[%r8, + 0x0db0] %asi, %r2
	.word 0xee320009  ! 978: STH_R	sth	%r23, [%r8 + %r9]
	.word 0xcf1a0009  ! 978: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0x8a720009  ! 978: UDIV_R	udiv 	%r8, %r9, %r5
	.word 0xe7220009  ! 981: STF_R	st	%f19, [%r9, %r8]
	.word 0xe04a0009  ! 981: LDSB_R	ldsb	[%r8 + %r9], %r16
	.word 0xced2286c  ! 981: LDSHA_I	ldsha	[%r8, + 0x086c] %asi, %r7
	.word 0xca720009  ! 984: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xcb1a0009  ! 984: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xf8ea1009  ! 984: LDSTUBA_R	ldstuba	%r28, [%r8 + %r9] 0x80
	.word 0xca320009  ! 987: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc9020009  ! 987: LDF_R	ld	[%r8, %r9], %f4
	.word 0xc2922d54  ! 987: LDUHA_I	lduha	[%r8, + 0x0d54] %asi, %r1
	.word 0xc2720009  ! 990: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xfa0a0009  ! 990: LDUB_R	ldub	[%r8 + %r9], %r29
	.word 0x8143e05d  ! 990: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0xe5220009  ! 993: STF_R	st	%f18, [%r9, %r8]
	.word 0xf84a0009  ! 993: LDSB_R	ldsb	[%r8 + %r9], %r28
	.word 0x8143e078  ! 993: MEMBAR	membar	#StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xc53a0009  ! 996: STDF_R	std	%f2, [%r9, %r8]
	.word 0xcf020009  ! 996: LDF_R	ld	[%r8, %r9], %f7
	.word 0x28800001  ! 996: BLEU	bleu,a	<label_0x1>
	.word 0xc42a0009  ! 999: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc8020009  ! 999: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xeeea1009  ! 999: LDSTUBA_R	ldstuba	%r23, [%r8 + %r9] 0x80
	.word 0xef220009  ! 1002: STF_R	st	%f23, [%r9, %r8]
	.word 0xc2120009  ! 1002: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xc2420009  ! 1002: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xe7220009  ! 1005: STF_R	st	%f19, [%r9, %r8]
	.word 0xc6020009  ! 1005: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0x00800001  ! 1005: BN	bn  	<label_0x1>
	.word 0xc6220009  ! 1008: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xd6020009  ! 1008: LDUW_R	lduw	[%r8 + %r9], %r11
	.word 0xc6520009  ! 1008: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xfe320009  ! 1011: STH_R	sth	%r31, [%r8 + %r9]
	.word 0xf0120009  ! 1011: LDUH_R	lduh	[%r8 + %r9], %r24
	.word 0xc2122ec0  ! 1011: LDUH_I	lduh	[%r8 + 0x0ec0], %r1
	.word 0xca320009  ! 1014: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xf2120009  ! 1014: LDUH_R	lduh	[%r8 + %r9], %r25
	.word 0x8143c000  ! 1014: STBAR	stbar
	.word 0xfe220009  ! 1017: STW_R	stw	%r31, [%r8 + %r9]
	.word 0xce020009  ! 1017: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xcc020009  ! 1017: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xda320009  ! 1020: STH_R	sth	%r13, [%r8 + %r9]
	.word 0xcc4a0009  ! 1020: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xc612263c  ! 1020: LDUH_I	lduh	[%r8 + 0x063c], %r3
	.word 0xc6320009  ! 1023: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xcc0a0009  ! 1023: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0x8d220009  ! 1023: MULScc_R	mulscc 	%r8, %r9, %r6
	.word 0xce320009  ! 1026: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc5020009  ! 1026: LDF_R	ld	[%r8, %r9], %f2
	.word 0xc6da1009  ! 1026: LDXA_R	ldxa	[%r8, %r9] 0x80, %r3
	.word 0xca320009  ! 1029: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc80a0009  ! 1029: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xd8d22adc  ! 1029: LDSHA_I	ldsha	[%r8, + 0x0adc] %asi, %r12
	.word 0xc2720009  ! 1032: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xcc0a0009  ! 1032: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xc2d21009  ! 1032: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r1
	.word 0xce220009  ! 1035: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xcd020009  ! 1035: LDF_R	ld	[%r8, %r9], %f6
	.word 0x8143c000  ! 1035: STBAR	stbar
	.word 0xec720009  ! 1038: STX_R	stx	%r22, [%r8 + %r9]
	.word 0xeb1a0009  ! 1038: LDDF_R	ldd	[%r8, %r9], %f21
	.word 0x83a208a9  ! 1038: FSUBs	fsubs	%f8, %f9, %f1
	.word 0xcc220009  ! 1041: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xce520009  ! 1041: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xc3ea1009  ! 1041: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xcc720009  ! 1044: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xda020009  ! 1044: LDUW_R	lduw	[%r8 + %r9], %r13
	.word 0xcdf22009  ! 1044: CASXA_R	casxa	[%r8]%asi, %r9, %r6
	.word 0xcf220009  ! 1047: STF_R	st	%f7, [%r9, %r8]
	.word 0xc60a0009  ! 1047: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xf6da2a38  ! 1047: LDXA_I	ldxa	[%r8, + 0x0a38] %asi, %r27
	.word 0xeb220009  ! 1050: STF_R	st	%f21, [%r9, %r8]
	.word 0xca4a0009  ! 1050: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xd88a2918  ! 1050: LDUBA_I	lduba	[%r8, + 0x0918] %asi, %r12
	.word 0xcc320009  ! 1053: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xee020009  ! 1053: LDUW_R	lduw	[%r8 + %r9], %r23
	.word 0xcef22e90  ! 1053: STXA_I	stxa	%r7, [%r8 + 0x0e90] %asi
	.word 0xc22a0009  ! 1056: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xff1a0009  ! 1056: LDDF_R	ldd	[%r8, %r9], %f31
	.word 0xc68a2d68  ! 1056: LDUBA_I	lduba	[%r8, + 0x0d68] %asi, %r3
	.word 0xc62a0009  ! 1059: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc8520009  ! 1059: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0x87a209a9  ! 1059: FDIVs	fdivs	%f8, %f9, %f3
	.word 0xc6220009  ! 1062: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc40a0009  ! 1062: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0x8a4a21b4  ! 1062: MULX_I	mulx 	%r8, 0x01b4, %r5
	.word 0xca220009  ! 1065: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xcd1a0009  ! 1065: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0x8fa20829  ! 1065: FADDs	fadds	%f8, %f9, %f7
	.word 0xd82a0009  ! 1068: STB_R	stb	%r12, [%r8 + %r9]
	.word 0xca5a0009  ! 1068: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xc2ea28a8  ! 1068: LDSTUBA_I	ldstuba	%r1, [%r8 + 0x08a8] %asi
	.word 0xcb220009  ! 1071: STF_R	st	%f5, [%r9, %r8]
	.word 0xc65a0009  ! 1071: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xc3ea1009  ! 1071: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xf02a0009  ! 1074: STB_R	stb	%r24, [%r8 + %r9]
	.word 0xdc020009  ! 1074: LDUW_R	lduw	[%r8 + %r9], %r14
	.word 0xec422514  ! 1074: LDSW_I	ldsw	[%r8 + 0x0514], %r22
	.word 0xc8220009  ! 1077: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xda4a0009  ! 1077: LDSB_R	ldsb	[%r8 + %r9], %r13
	.word 0xc36a0009  ! 1077: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xce320009  ! 1080: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc6120009  ! 1080: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xfaaa236c  ! 1080: STBA_I	stba	%r29, [%r8 + 0x036c] %asi
	.word 0xe6720009  ! 1083: STX_R	stx	%r19, [%r8 + %r9]
	.word 0xcc0a0009  ! 1083: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0x87a209a9  ! 1083: FDIVs	fdivs	%f8, %f9, %f3
	.word 0xc8220009  ! 1086: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xda0a0009  ! 1086: LDUB_R	ldub	[%r8 + %r9], %r13
	.word 0xc4f22a20  ! 1086: STXA_I	stxa	%r2, [%r8 + 0x0a20] %asi
	.word 0xf8720009  ! 1089: STX_R	stx	%r28, [%r8 + %r9]
	.word 0xcc420009  ! 1089: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xc3ea1009  ! 1089: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xdc220009  ! 1092: STW_R	stw	%r14, [%r8 + %r9]
	.word 0xc45a0009  ! 1092: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0x864a0009  ! 1092: MULX_R	mulx 	%r8, %r9, %r3
	.word 0xcd3a0009  ! 1095: STDF_R	std	%f6, [%r9, %r8]
	.word 0xca4a0009  ! 1095: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0x88f22e24  ! 1095: UDIVcc_I	udivcc 	%r8, 0x0e24, %r4
	.word 0xc82a0009  ! 1098: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xf80a0009  ! 1098: LDUB_R	ldub	[%r8 + %r9], %r28
	.word 0xc88a1009  ! 1098: LDUBA_R	lduba	[%r8, %r9] 0x80, %r4
	.word 0xca320009  ! 1101: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xd85a0009  ! 1101: LDX_R	ldx	[%r8 + %r9], %r12
	.word 0xdf3a0009  ! 1101: STDF_R	std	%f15, [%r9, %r8]
	.word 0xca320009  ! 1104: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xf05a0009  ! 1104: LDX_R	ldx	[%r8 + %r9], %r24
	.word 0x847a28e8  ! 1104: SDIV_I	sdiv 	%r8, 0x08e8, %r2
	.word 0xdc320009  ! 1107: STH_R	sth	%r14, [%r8 + %r9]
	.word 0xe7020009  ! 1107: LDF_R	ld	[%r8, %r9], %f19
	.word 0x876a0009  ! 1107: SDIVX_R	sdivx	%r8, %r9, %r3
	.word 0xec320009  ! 1110: STH_R	sth	%r22, [%r8 + %r9]
	.word 0xc7020009  ! 1110: LDF_R	ld	[%r8, %r9], %f3
	.word 0xcf3a2340  ! 1110: STDF_I	std	%f7, [0x0340, %r8]
	.word 0xca2a0009  ! 1113: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xe6420009  ! 1113: LDSW_R	ldsw	[%r8 + %r9], %r19
	.word 0xca022900  ! 1113: LDUW_I	lduw	[%r8 + 0x0900], %r5
	.word 0xce2a0009  ! 1116: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc40a0009  ! 1116: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0x8143c000  ! 1116: STBAR	stbar
	.word 0xcc220009  ! 1119: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xce520009  ! 1119: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xcc0224f8  ! 1119: LDUW_I	lduw	[%r8 + 0x04f8], %r6
	.word 0xca2a0009  ! 1122: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xcf1a0009  ! 1122: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0x8ed2235c  ! 1122: UMULcc_I	umulcc 	%r8, 0x035c, %r7
	.word 0xc6720009  ! 1125: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xfa4a0009  ! 1125: LDSB_R	ldsb	[%r8 + %r9], %r29
	.word 0xbe720009  ! 1125: UDIV_R	udiv 	%r8, %r9, %r31
	.word 0xc42a0009  ! 1128: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc45a0009  ! 1128: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0x8b220009  ! 1128: MULScc_R	mulscc 	%r8, %r9, %r5
	.word 0xc73a0009  ! 1131: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc60a0009  ! 1131: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xcb3a0009  ! 1131: STDF_R	std	%f5, [%r9, %r8]
	.word 0xea320009  ! 1134: STH_R	sth	%r21, [%r8 + %r9]
	.word 0xc6420009  ! 1134: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0x06ca0001  ! 1134: BRLZ	brlz  ,pt	%8,<label_0xa0001>
	.word 0xca320009  ! 1137: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc4120009  ! 1137: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xccba2890  ! 1137: STDA_I	stda	%r6, [%r8 + 0x0890] %asi
	.word 0xc93a0009  ! 1140: STDF_R	std	%f4, [%r9, %r8]
	.word 0xf64a0009  ! 1140: LDSB_R	ldsb	[%r8 + %r9], %r27
	.word 0xe4ba2eb8  ! 1140: STDA_I	stda	%r18, [%r8 + 0x0eb8] %asi
	.word 0xc2720009  ! 1143: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xce020009  ! 1143: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xccb22a7c  ! 1143: STHA_I	stha	%r6, [%r8 + 0x0a7c] %asi
	.word 0xeb220009  ! 1146: STF_R	st	%f21, [%r9, %r8]
	.word 0xc71a0009  ! 1146: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xca5229b4  ! 1146: LDSH_I	ldsh	[%r8 + 0x09b4], %r5
	.word 0xc62a0009  ! 1149: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xf9020009  ! 1149: LDF_R	ld	[%r8, %r9], %f28
	.word 0x8ba20829  ! 1149: FADDs	fadds	%f8, %f9, %f5
	.word 0xca2a0009  ! 1152: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xe11a0009  ! 1152: LDDF_R	ldd	[%r8, %r9], %f16
	.word 0xc36a0009  ! 1152: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xcd3a0009  ! 1155: STDF_R	std	%f6, [%r9, %r8]
	.word 0xca420009  ! 1155: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xf8b22dd4  ! 1155: STHA_I	stha	%r28, [%r8 + 0x0dd4] %asi
	.word 0xca220009  ! 1158: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xca520009  ! 1158: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xac5221b4  ! 1158: UMUL_I	umul 	%r8, 0x01b4, %r22
	.word 0xca2a0009  ! 1161: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc31a0009  ! 1161: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xb07a2ea0  ! 1161: SDIV_I	sdiv 	%r8, 0x0ea0, %r24
	.word 0xc8220009  ! 1164: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xfc420009  ! 1164: LDSW_R	ldsw	[%r8 + %r9], %r30
	.word 0x9cf22370  ! 1164: UDIVcc_I	udivcc 	%r8, 0x0370, %r14
	.word 0xd82a0009  ! 1167: STB_R	stb	%r12, [%r8 + %r9]
	.word 0xde5a0009  ! 1167: LDX_R	ldx	[%r8 + %r9], %r15
	.word 0xc46a2544  ! 1167: LDSTUB_I	ldstub	%r2, [%r8 + 0x0544]
	.word 0xc8220009  ! 1170: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xde020009  ! 1170: LDUW_R	lduw	[%r8 + %r9], %r15
	.word 0x97a20829  ! 1170: FADDs	fadds	%f8, %f9, %f11
	.word 0xcf220009  ! 1173: STF_R	st	%f7, [%r9, %r8]
	.word 0xf2520009  ! 1173: LDSH_R	ldsh	[%r8 + %r9], %r25
	.word 0x8a720009  ! 1173: UDIV_R	udiv 	%r8, %r9, %r5
	.word 0xce220009  ! 1176: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc6020009  ! 1176: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0x08800002  ! 1176: BLEU	bleu  	<label_0x2>
	.word 0xc3220009  ! 1179: STF_R	st	%f1, [%r9, %r8]
	.word 0xc6420009  ! 1179: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xc36a0009  ! 1179: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xcc720009  ! 1182: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc8520009  ! 1182: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xc3222428  ! 1182: STF_I	st	%f1, [0x0428, %r8]
	.word 0xc9220009  ! 1185: STF_R	st	%f4, [%r9, %r8]
	.word 0xde4a0009  ! 1185: LDSB_R	ldsb	[%r8 + %r9], %r15
	.word 0x87a209a9  ! 1185: FDIVs	fdivs	%f8, %f9, %f3
	.word 0xce320009  ! 1188: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc80a0009  ! 1188: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0x8a522da4  ! 1188: UMUL_I	umul 	%r8, 0x0da4, %r5
	.word 0xcc2a0009  ! 1191: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xcc5a0009  ! 1191: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xbcf20009  ! 1191: UDIVcc_R	udivcc 	%r8, %r9, %r30
	.word 0xc8720009  ! 1194: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc4420009  ! 1194: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xacfa0009  ! 1194: SDIVcc_R	sdivcc 	%r8, %r9, %r22
	.word 0xce220009  ! 1197: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xcd020009  ! 1197: LDF_R	ld	[%r8, %r9], %f6
	.word 0xc3222818  ! 1197: STF_I	st	%f1, [0x0818, %r8]
	.word 0xc7220009  ! 1200: STF_R	st	%f3, [%r9, %r8]
	.word 0xe6120009  ! 1200: LDUH_R	lduh	[%r8 + %r9], %r19
	.word 0xcff22009  ! 1200: CASXA_R	casxa	[%r8]%asi, %r9, %r7
	.word 0xf82a0009  ! 1203: STB_R	stb	%r28, [%r8 + %r9]
	.word 0xdb1a0009  ! 1203: LDDF_R	ldd	[%r8, %r9], %f13
	.word 0x32800002  ! 1203: BNE	bne,a	<label_0x2>
	.word 0xc22a0009  ! 1206: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xf11a0009  ! 1206: LDDF_R	ldd	[%r8, %r9], %f24
	.word 0xc20a0009  ! 1206: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xc2220009  ! 1209: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xda420009  ! 1209: LDSW_R	ldsw	[%r8 + %r9], %r13
	.word 0xcf222c94  ! 1209: STF_I	st	%f7, [0x0c94, %r8]
	.word 0xc42a0009  ! 1212: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xcb1a0009  ! 1212: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0x97a20929  ! 1212: FMULs	fmuls	%f8, %f9, %f11
	.word 0xc4720009  ! 1215: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc20a0009  ! 1215: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xe8f22508  ! 1215: STXA_I	stxa	%r20, [%r8 + 0x0508] %asi
	.word 0xca720009  ! 1218: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xda5a0009  ! 1218: LDX_R	ldx	[%r8 + %r9], %r13
	.word 0xccaa2ed8  ! 1218: STBA_I	stba	%r6, [%r8 + 0x0ed8] %asi
	.word 0xc33a0009  ! 1221: STDF_R	std	%f1, [%r9, %r8]
	.word 0xee0a0009  ! 1221: LDUB_R	ldub	[%r8 + %r9], %r23
	.word 0xcde22009  ! 1221: CASA_R	casa	[%r8] %asi, %r9, %r6
	.word 0xda220009  ! 1224: STW_R	stw	%r13, [%r8 + %r9]
	.word 0xec420009  ! 1224: LDSW_R	ldsw	[%r8 + %r9], %r22
	.word 0xc3022a98  ! 1224: LDF_I	ld	[%r8, 0x0a98], %f1
	.word 0xc9220009  ! 1227: STF_R	st	%f4, [%r9, %r8]
	.word 0xc6020009  ! 1227: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xd9f22009  ! 1227: CASXA_R	casxa	[%r8]%asi, %r9, %r12
	.word 0xca720009  ! 1230: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc4420009  ! 1230: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0x3e800001  ! 1230: BVC	bvc,a	<label_0x1>
	.word 0xca220009  ! 1233: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc6120009  ! 1233: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0x85a20829  ! 1233: FADDs	fadds	%f8, %f9, %f2
	.word 0xc53a0009  ! 1236: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc4520009  ! 1236: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xcb222c94  ! 1236: STF_I	st	%f5, [0x0c94, %r8]
	.word 0xe8220009  ! 1239: STW_R	stw	%r20, [%r8 + %r9]
	.word 0xe8020009  ! 1239: LDUW_R	lduw	[%r8 + %r9], %r20
	.word 0x8da209a9  ! 1239: FDIVs	fdivs	%f8, %f9, %f6
	.word 0xc6320009  ! 1242: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc80a0009  ! 1242: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xdad21009  ! 1242: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r13
	.word 0xef3a0009  ! 1245: STDF_R	std	%f23, [%r9, %r8]
	.word 0xff020009  ! 1245: LDF_R	ld	[%r8, %r9], %f31
	.word 0x8143c000  ! 1245: STBAR	stbar
	.word 0xe8220009  ! 1248: STW_R	stw	%r20, [%r8 + %r9]
	.word 0xe4420009  ! 1248: LDSW_R	ldsw	[%r8 + %r9], %r18
	.word 0x99a20829  ! 1248: FADDs	fadds	%f8, %f9, %f12
	.word 0xc4320009  ! 1251: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc4020009  ! 1251: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xecf21009  ! 1251: STXA_R	stxa	%r22, [%r8 + %r9] 0x80
	.word 0xe22a0009  ! 1254: STB_R	stb	%r17, [%r8 + %r9]
	.word 0xcc120009  ! 1254: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0x8143c000  ! 1254: STBAR	stbar
	.word 0xc6320009  ! 1257: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xcf020009  ! 1257: LDF_R	ld	[%r8, %r9], %f7
	.word 0xd80a2458  ! 1257: LDUB_I	ldub	[%r8 + 0x0458], %r12
	.word 0xcc2a0009  ! 1260: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc8120009  ! 1260: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0x9ad20009  ! 1260: UMULcc_R	umulcc 	%r8, %r9, %r13
	.word 0xc4220009  ! 1263: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xe64a0009  ! 1263: LDSB_R	ldsb	[%r8 + %r9], %r19
	.word 0xc36a0009  ! 1263: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xcc720009  ! 1266: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc51a0009  ! 1266: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0x8143c000  ! 1266: STBAR	stbar
	.word 0xcf3a0009  ! 1269: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc71a0009  ! 1269: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0x0e800001  ! 1269: BVS	bvs  	<label_0x1>
	.word 0xc2720009  ! 1272: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xd8020009  ! 1272: LDUW_R	lduw	[%r8 + %r9], %r12
	.word 0xcbf21009  ! 1272: CASXA_I	casxa	[%r8] 0x80, %r9, %r5
	.word 0xcc220009  ! 1275: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xe6420009  ! 1275: LDSW_R	ldsw	[%r8 + %r9], %r19
	.word 0x8143e029  ! 1275: MEMBAR	membar	#LoadLoad | #StoreStore | #MemIssue 
	.word 0xc4220009  ! 1278: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc20a0009  ! 1278: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0x82da2964  ! 1278: SMULcc_I	smulcc 	%r8, 0x0964, %r1
	.word 0xca320009  ! 1281: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc25a0009  ! 1281: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0x8143c000  ! 1281: STBAR	stbar
	.word 0xfa2a0009  ! 1284: STB_R	stb	%r29, [%r8 + %r9]
	.word 0xfe0a0009  ! 1284: LDUB_R	ldub	[%r8 + %r9], %r31
	.word 0xc3ea1009  ! 1284: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc6320009  ! 1287: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xce520009  ! 1287: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xcc022af8  ! 1287: LDUW_I	lduw	[%r8 + 0x0af8], %r6
	.word 0xc82a0009  ! 1290: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xe3020009  ! 1290: LDF_R	ld	[%r8, %r9], %f17
	.word 0xc8520009  ! 1290: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xeb220009  ! 1293: STF_R	st	%f21, [%r9, %r8]
	.word 0xca4a0009  ! 1293: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xcaa229ec  ! 1293: STWA_I	stwa	%r5, [%r8 + 0x09ec] %asi
	.word 0xc2220009  ! 1296: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xfb1a0009  ! 1296: LDDF_R	ldd	[%r8, %r9], %f29
	.word 0xc4ba22f8  ! 1296: STDA_I	stda	%r2, [%r8 + 0x02f8] %asi
	.word 0xce720009  ! 1299: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xe9020009  ! 1299: LDF_R	ld	[%r8, %r9], %f20
	.word 0x8143c000  ! 1299: STBAR	stbar
	.word 0xcc2a0009  ! 1302: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xcc4a0009  ! 1302: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xc3ea25b0  ! 1302: PREFETCHA_I	prefetcha	[%r8, + 0x05b0] %asi, #one_read
	.word 0xcc220009  ! 1305: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xe80a0009  ! 1305: LDUB_R	ldub	[%r8 + %r9], %r20
	.word 0x8143c000  ! 1305: STBAR	stbar
	.word 0xca220009  ! 1308: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc3020009  ! 1308: LDF_R	ld	[%r8, %r9], %f1
	.word 0x8522269c  ! 1308: MULScc_I	mulscc 	%r8, 0x069c, %r2
	.word 0xec320009  ! 1311: STH_R	sth	%r22, [%r8 + %r9]
	.word 0xc25a0009  ! 1311: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xcaaa2234  ! 1311: STBA_I	stba	%r5, [%r8 + 0x0234] %asi
	.word 0xc2720009  ! 1314: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xf71a0009  ! 1314: LDDF_R	ldd	[%r8, %r9], %f27
	.word 0x82fa0009  ! 1314: SDIVcc_R	sdivcc 	%r8, %r9, %r1
	.word 0xe42a0009  ! 1317: STB_R	stb	%r18, [%r8 + %r9]
	.word 0xe45a0009  ! 1317: LDX_R	ldx	[%r8 + %r9], %r18
	.word 0x82f20009  ! 1317: UDIVcc_R	udivcc 	%r8, %r9, %r1
	.word 0xc9220009  ! 1320: STF_R	st	%f4, [%r9, %r8]
	.word 0xc6520009  ! 1320: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0x08800001  ! 1320: BLEU	bleu  	<label_0x1>
	.word 0xe7220009  ! 1323: STF_R	st	%f19, [%r9, %r8]
	.word 0xcd020009  ! 1323: LDF_R	ld	[%r8, %r9], %f6
	.word 0xcaa21009  ! 1323: STWA_R	stwa	%r5, [%r8 + %r9] 0x80
	.word 0xc6320009  ! 1326: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xf8120009  ! 1326: LDUH_R	lduh	[%r8 + %r9], %r28
	.word 0xc36a2cd0  ! 1326: PREFETCH_I	prefetch	[%r8 + 0x0cd0], #one_read
	.word 0xcd220009  ! 1329: STF_R	st	%f6, [%r9, %r8]
	.word 0xea520009  ! 1329: LDSH_R	ldsh	[%r8 + %r9], %r21
	.word 0x84da0009  ! 1329: SMULcc_R	smulcc 	%r8, %r9, %r2
	.word 0xcd220009  ! 1332: STF_R	st	%f6, [%r9, %r8]
	.word 0xf6420009  ! 1332: LDSW_R	ldsw	[%r8 + %r9], %r27
	.word 0xaad20009  ! 1332: UMULcc_R	umulcc 	%r8, %r9, %r21
	.word 0xe33a0009  ! 1335: STDF_R	std	%f17, [%r9, %r8]
	.word 0xc71a0009  ! 1335: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xcb1a0009  ! 1335: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xc2320009  ! 1338: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xf2420009  ! 1338: LDSW_R	ldsw	[%r8 + %r9], %r25
	.word 0xfcf21009  ! 1338: STXA_R	stxa	%r30, [%r8 + %r9] 0x80
	.word 0xcf3a0009  ! 1341: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc2020009  ! 1341: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xc8f22fd0  ! 1341: STXA_I	stxa	%r4, [%r8 + 0x0fd0] %asi
	.word 0xc5220009  ! 1344: STF_R	st	%f2, [%r9, %r8]
	.word 0xf8120009  ! 1344: LDUH_R	lduh	[%r8 + %r9], %r28
	.word 0xd86a20a0  ! 1344: LDSTUB_I	ldstub	%r12, [%r8 + 0x00a0]
	.word 0xe82a0009  ! 1347: STB_R	stb	%r20, [%r8 + %r9]
	.word 0xc6420009  ! 1347: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0x0a800001  ! 1347: BCS	bcs  	<label_0x1>
	.word 0xf8320009  ! 1350: STH_R	sth	%r28, [%r8 + %r9]
	.word 0xce520009  ! 1350: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0x85a20829  ! 1350: FADDs	fadds	%f8, %f9, %f2
	.word 0xf8720009  ! 1353: STX_R	stx	%r28, [%r8 + %r9]
	.word 0xc4520009  ! 1353: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xccfa1009  ! 1353: SWAPA_R	swapa	%r6, [%r8 + %r9] 0x80
	.word 0xdc720009  ! 1356: STX_R	stx	%r14, [%r8 + %r9]
	.word 0xc8420009  ! 1356: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0x9ada0009  ! 1356: SMULcc_R	smulcc 	%r8, %r9, %r13
	.word 0xc7220009  ! 1359: STF_R	st	%f3, [%r9, %r8]
	.word 0xc3020009  ! 1359: LDF_R	ld	[%r8, %r9], %f1
	.word 0xa2da299c  ! 1359: SMULcc_I	smulcc 	%r8, 0x099c, %r17
	.word 0xe0720009  ! 1362: STX_R	stx	%r16, [%r8 + %r9]
	.word 0xcc4a0009  ! 1362: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xfef22e00  ! 1362: STXA_I	stxa	%r31, [%r8 + 0x0e00] %asi
	.word 0xce2a0009  ! 1365: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc6020009  ! 1365: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xc91a23e0  ! 1365: LDDF_I	ldd	[%r8, 0x03e0], %f4
	.word 0xc93a0009  ! 1368: STDF_R	std	%f4, [%r9, %r8]
	.word 0xc6120009  ! 1368: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xcc822efc  ! 1368: LDUWA_I	lduwa	[%r8, + 0x0efc] %asi, %r6
	.word 0xce2a0009  ! 1371: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xcf020009  ! 1371: LDF_R	ld	[%r8, %r9], %f7
	.word 0x0e800002  ! 1371: BVS	bvs  	<label_0x2>
	.word 0xd8220009  ! 1374: STW_R	stw	%r12, [%r8 + %r9]
	.word 0xca4a0009  ! 1374: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xdada2b38  ! 1374: LDXA_I	ldxa	[%r8, + 0x0b38] %asi, %r13
	.word 0xc2720009  ! 1377: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xf8520009  ! 1377: LDSH_R	ldsh	[%r8 + %r9], %r28
	.word 0xe8c21009  ! 1377: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r20
	.word 0xca2a0009  ! 1380: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc91a0009  ! 1380: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0x02800001  ! 1380: BE	be  	<label_0x1>
	.word 0xcc320009  ! 1383: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xeb1a0009  ! 1383: LDDF_R	ldd	[%r8, %r9], %f21
	.word 0x88720009  ! 1383: UDIV_R	udiv 	%r8, %r9, %r4
	.word 0xe73a0009  ! 1386: STDF_R	std	%f19, [%r9, %r8]
	.word 0xc8520009  ! 1386: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0x8143c000  ! 1386: STBAR	stbar
	.word 0xc82a0009  ! 1389: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xcb020009  ! 1389: LDF_R	ld	[%r8, %r9], %f5
	.word 0x8143e02f  ! 1389: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #MemIssue 
	.word 0xcc2a0009  ! 1392: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc51a0009  ! 1392: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xc36a2218  ! 1392: PREFETCH_I	prefetch	[%r8 + 0x0218], #one_read
	.word 0xc2320009  ! 1395: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xe8420009  ! 1395: LDSW_R	ldsw	[%r8 + %r9], %r20
	.word 0xc8ea1009  ! 1395: LDSTUBA_R	ldstuba	%r4, [%r8 + %r9] 0x80
	.word 0xcc220009  ! 1398: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xf9020009  ! 1398: LDF_R	ld	[%r8, %r9], %f28
	.word 0x84f20009  ! 1398: UDIVcc_R	udivcc 	%r8, %r9, %r2
	.word 0xc8320009  ! 1401: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xcc020009  ! 1401: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xcf222100  ! 1401: STF_I	st	%f7, [0x0100, %r8]
	.word 0xcf220009  ! 1404: STF_R	st	%f7, [%r9, %r8]
	.word 0xcf1a0009  ! 1404: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0x8143c000  ! 1404: STBAR	stbar
	.word 0xdb3a0009  ! 1407: STDF_R	std	%f13, [%r9, %r8]
	.word 0xcc420009  ! 1407: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0x85222458  ! 1407: MULScc_I	mulscc 	%r8, 0x0458, %r2
	.word 0xd6220009  ! 1410: STW_R	stw	%r11, [%r8 + %r9]
	.word 0xc3020009  ! 1410: LDF_R	ld	[%r8, %r9], %f1
	.word 0x26800002  ! 1410: BL	bl,a	<label_0x2>
	.word 0xfc220009  ! 1413: STW_R	stw	%r30, [%r8 + %r9]
	.word 0xe2020009  ! 1413: LDUW_R	lduw	[%r8 + %r9], %r17
	.word 0x8a5a2d5c  ! 1413: SMUL_I	smul 	%r8, 0x0d5c, %r5
	.word 0xc62a0009  ! 1416: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xe80a0009  ! 1416: LDUB_R	ldub	[%r8 + %r9], %r20
	.word 0xcafa2070  ! 1416: SWAPA_I	swapa	%r5, [%r8 + 0x0070] %asi
	.word 0xc9220009  ! 1419: STF_R	st	%f4, [%r9, %r8]
	.word 0xce020009  ! 1419: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xc36a2810  ! 1419: PREFETCH_I	prefetch	[%r8 + 0x0810], #one_read
	.word 0xc6720009  ! 1422: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc24a0009  ! 1422: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0x8143c000  ! 1422: STBAR	stbar
	.word 0xd9220009  ! 1425: STF_R	st	%f12, [%r9, %r8]
	.word 0xc25a0009  ! 1425: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xc36a2c54  ! 1425: PREFETCH_I	prefetch	[%r8 + 0x0c54], #one_read
	.word 0xc7220009  ! 1428: STF_R	st	%f3, [%r9, %r8]
	.word 0xc71a0009  ! 1428: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0x876a0009  ! 1428: SDIVX_R	sdivx	%r8, %r9, %r3
	.word 0xc2720009  ! 1431: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xf60a0009  ! 1431: LDUB_R	ldub	[%r8 + %r9], %r27
	.word 0xdbe21009  ! 1431: CASA_I	casa	[%r8] 0x80, %r9, %r13
	.word 0xe73a0009  ! 1434: STDF_R	std	%f19, [%r9, %r8]
	.word 0xd9020009  ! 1434: LDF_R	ld	[%r8, %r9], %f12
	.word 0xcaa220f0  ! 1434: STWA_I	stwa	%r5, [%r8 + 0x00f0] %asi
	.word 0xc5220009  ! 1437: STF_R	st	%f2, [%r9, %r8]
	.word 0xcc120009  ! 1437: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xcc7a2a98  ! 1437: SWAP_I	swap	%r6, [%r8 + 0x0a98]
	.word 0xc93a0009  ! 1440: STDF_R	std	%f4, [%r9, %r8]
	.word 0xfc0a0009  ! 1440: LDUB_R	ldub	[%r8 + %r9], %r30
	.word 0xc3ea21f4  ! 1440: PREFETCHA_I	prefetcha	[%r8, + 0x01f4] %asi, #one_read
	.word 0xc8720009  ! 1443: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc71a0009  ! 1443: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0x8ba208a9  ! 1443: FSUBs	fsubs	%f8, %f9, %f5
	.word 0xe6320009  ! 1446: STH_R	sth	%r19, [%r8 + %r9]
	.word 0xce420009  ! 1446: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xc45a0009  ! 1446: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xe4720009  ! 1449: STX_R	stx	%r18, [%r8 + %r9]
	.word 0xc2520009  ! 1449: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0x867a27e0  ! 1449: SDIV_I	sdiv 	%r8, 0x07e0, %r3
	.word 0xcc320009  ! 1452: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xe3020009  ! 1452: LDF_R	ld	[%r8, %r9], %f17
	.word 0xdc6a2558  ! 1452: LDSTUB_I	ldstub	%r14, [%r8 + 0x0558]
	.word 0xc2320009  ! 1455: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc4120009  ! 1455: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xc3ea1009  ! 1455: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xca220009  ! 1458: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xe5020009  ! 1458: LDF_R	ld	[%r8, %r9], %f18
	.word 0x89a20829  ! 1458: FADDs	fadds	%f8, %f9, %f4
	.word 0xc2220009  ! 1461: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xcc520009  ! 1461: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xc3ea26c8  ! 1461: PREFETCHA_I	prefetcha	[%r8, + 0x06c8] %asi, #one_read
	.word 0xcc720009  ! 1464: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xca020009  ! 1464: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0x8143e009  ! 1464: MEMBAR	membar	#LoadLoad | #StoreStore 
	.word 0xee720009  ! 1467: STX_R	stx	%r23, [%r8 + %r9]
	.word 0xca120009  ! 1467: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0x06c20001  ! 1467: BRLZ	brlz  ,nt	%8,<label_0x20001>
	.word 0xc8220009  ! 1470: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc51a0009  ! 1470: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0x8143e00a  ! 1470: MEMBAR	membar	#StoreLoad | #StoreStore 
	.word 0xc22a0009  ! 1473: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xca020009  ! 1473: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xc89a29c0  ! 1473: LDDA_I	ldda	[%r8, + 0x09c0] %asi, %r4
	.word 0xd8320009  ! 1476: STH_R	sth	%r12, [%r8 + %r9]
	.word 0xcf1a0009  ! 1476: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0x89a20929  ! 1476: FMULs	fmuls	%f8, %f9, %f4
	.word 0xe02a0009  ! 1479: STB_R	stb	%r16, [%r8 + %r9]
	.word 0xc4020009  ! 1479: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xc3ea1009  ! 1479: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xca720009  ! 1482: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xcc020009  ! 1482: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xd73a2650  ! 1482: STDF_I	std	%f11, [0x0650, %r8]
	.word 0xe8720009  ! 1485: STX_R	stx	%r20, [%r8 + %r9]
	.word 0xce5a0009  ! 1485: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xc8da2028  ! 1485: LDXA_I	ldxa	[%r8, + 0x0028] %asi, %r4
	.word 0xf42a0009  ! 1488: STB_R	stb	%r26, [%r8 + %r9]
	.word 0xe0420009  ! 1488: LDSW_R	ldsw	[%r8 + %r9], %r16
	.word 0xecba1009  ! 1488: STDA_R	stda	%r22, [%r8 + %r9] 0x80
	.word 0xce2a0009  ! 1491: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xcb020009  ! 1491: LDF_R	ld	[%r8, %r9], %f5
	.word 0xc8a22bb8  ! 1491: STWA_I	stwa	%r4, [%r8 + 0x0bb8] %asi
	.word 0xfc2a0009  ! 1494: STB_R	stb	%r30, [%r8 + %r9]
	.word 0xc60a0009  ! 1494: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xcfe21009  ! 1494: CASA_I	casa	[%r8] 0x80, %r9, %r7
	.word 0xc9220009  ! 1497: STF_R	st	%f4, [%r9, %r8]
	.word 0xd65a0009  ! 1497: LDX_R	ldx	[%r8 + %r9], %r11
	.word 0xc8fa200c  ! 1497: SWAPA_I	swapa	%r4, [%r8 + 0x000c] %asi
	.word 0xe93a0009  ! 1500: STDF_R	std	%f20, [%r9, %r8]
	.word 0xef1a0009  ! 1500: LDDF_R	ldd	[%r8, %r9], %f23
	.word 0x02800002  ! 1500: BE	be  	<label_0x2>
	.word 0xcc2a0009  ! 1503: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xda0a0009  ! 1503: LDUB_R	ldub	[%r8 + %r9], %r13
	.word 0xf5022a88  ! 1503: LDF_I	ld	[%r8, 0x0a88], %f26
	.word 0xc8320009  ! 1506: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xca4a0009  ! 1506: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0x87a20829  ! 1506: FADDs	fadds	%f8, %f9, %f3
	.word 0xe02a0009  ! 1509: STB_R	stb	%r16, [%r8 + %r9]
	.word 0xce020009  ! 1509: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xc86a20b0  ! 1509: LDSTUB_I	ldstub	%r4, [%r8 + 0x00b0]
	.word 0xc2720009  ! 1512: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xca4a0009  ! 1512: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xceca1009  ! 1512: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r7
	.word 0xcc720009  ! 1515: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xf0520009  ! 1515: LDSH_R	ldsh	[%r8 + %r9], %r24
	.word 0x8a7a0009  ! 1515: SDIV_R	sdiv 	%r8, %r9, %r5
	.word 0xf7220009  ! 1518: STF_R	st	%f27, [%r9, %r8]
	.word 0xfb1a0009  ! 1518: LDDF_R	ldd	[%r8, %r9], %f29
	.word 0x04c20001  ! 1518: BRLEZ	brlez  ,nt	%8,<label_0x20001>
	.word 0xec320009  ! 1521: STH_R	sth	%r22, [%r8 + %r9]
	.word 0xff020009  ! 1521: LDF_R	ld	[%r8, %r9], %f31
	.word 0x36800002  ! 1521: BGE	bge,a	<label_0x2>
	.word 0xcf3a0009  ! 1524: STDF_R	std	%f7, [%r9, %r8]
	.word 0xfd020009  ! 1524: LDF_R	ld	[%r8, %r9], %f30
	.word 0x16800001  ! 1524: BGE	bge  	<label_0x1>
	.word 0xcd220009  ! 1527: STF_R	st	%f6, [%r9, %r8]
	.word 0xfa520009  ! 1527: LDSH_R	ldsh	[%r8 + %r9], %r29
	.word 0xcf3a0009  ! 1527: STDF_R	std	%f7, [%r9, %r8]
	.word 0xcd220009  ! 1530: STF_R	st	%f6, [%r9, %r8]
	.word 0xca0a0009  ! 1530: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0x1c800002  ! 1530: BPOS	bpos  	<label_0x2>
	.word 0xc6720009  ! 1533: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xcc020009  ! 1533: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0x84d22b44  ! 1533: UMULcc_I	umulcc 	%r8, 0x0b44, %r2
	.word 0xcf3a0009  ! 1536: STDF_R	std	%f7, [%r9, %r8]
	.word 0xd6120009  ! 1536: LDUH_R	lduh	[%r8 + %r9], %r11
	.word 0xce420009  ! 1536: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xdc320009  ! 1539: STH_R	sth	%r14, [%r8 + %r9]
	.word 0xc8420009  ! 1539: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0x86da0009  ! 1539: SMULcc_R	smulcc 	%r8, %r9, %r3
	.word 0xc6720009  ! 1542: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc6020009  ! 1542: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xccc22a18  ! 1542: LDSWA_I	ldswa	[%r8, + 0x0a18] %asi, %r6
	.word 0xd6220009  ! 1545: STW_R	stw	%r11, [%r8 + %r9]
	.word 0xea4a0009  ! 1545: LDSB_R	ldsb	[%r8 + %r9], %r21
	.word 0xc3f22009  ! 1545: CASXA_R	casxa	[%r8]%asi, %r9, %r1
	.word 0xfa2a0009  ! 1548: STB_R	stb	%r29, [%r8 + %r9]
	.word 0xc65a0009  ! 1548: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0x8e52245c  ! 1548: UMUL_I	umul 	%r8, 0x045c, %r7
	.word 0xc82a0009  ! 1551: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xf91a0009  ! 1551: LDDF_R	ldd	[%r8, %r9], %f28
	.word 0x24800002  ! 1551: BLE	ble,a	<label_0x2>
	.word 0xc2320009  ! 1554: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc45a0009  ! 1554: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0x8a520009  ! 1554: UMUL_R	umul 	%r8, %r9, %r5
	.word 0xcb3a0009  ! 1557: STDF_R	std	%f5, [%r9, %r8]
	.word 0xcc020009  ! 1557: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xc36a2300  ! 1557: PREFETCH_I	prefetch	[%r8 + 0x0300], #one_read
	.word 0xce2a0009  ! 1560: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc8420009  ! 1560: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xce4a200c  ! 1560: LDSB_I	ldsb	[%r8 + 0x000c], %r7
	.word 0xc4720009  ! 1563: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xe1020009  ! 1563: LDF_R	ld	[%r8, %r9], %f16
	.word 0x8143c000  ! 1563: STBAR	stbar
	.word 0xc2720009  ! 1566: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xca520009  ! 1566: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xc6520009  ! 1566: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xc33a0009  ! 1569: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc25a0009  ! 1569: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xcaf228b8  ! 1569: STXA_I	stxa	%r5, [%r8 + 0x08b8] %asi
	.word 0xda2a0009  ! 1572: STB_R	stb	%r13, [%r8 + %r9]
	.word 0xc6020009  ! 1572: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0x02c20001  ! 1572: BRZ	brz  ,nt	%8,<label_0x20001>
	.word 0xec220009  ! 1575: STW_R	stw	%r22, [%r8 + %r9]
	.word 0xea4a0009  ! 1575: LDSB_R	ldsb	[%r8 + %r9], %r21
	.word 0xcd220009  ! 1575: STF_R	st	%f6, [%r9, %r8]
	.word 0xd62a0009  ! 1578: STB_R	stb	%r11, [%r8 + %r9]
	.word 0xca120009  ! 1578: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0x8da208a9  ! 1578: FSUBs	fsubs	%f8, %f9, %f6
	.word 0xce2a0009  ! 1581: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc6420009  ! 1581: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xc3ea1009  ! 1581: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xca220009  ! 1584: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xcb020009  ! 1584: LDF_R	ld	[%r8, %r9], %f5
	.word 0xcc7a0009  ! 1584: SWAP_R	swap	%r6, [%r8 + %r9]
	.word 0xe1220009  ! 1587: STF_R	st	%f16, [%r9, %r8]
	.word 0xe6120009  ! 1587: LDUH_R	lduh	[%r8 + %r9], %r19
	.word 0x8143c000  ! 1587: STBAR	stbar
	.word 0xde2a0009  ! 1590: STB_R	stb	%r15, [%r8 + %r9]
	.word 0xe31a0009  ! 1590: LDDF_R	ldd	[%r8, %r9], %f17
	.word 0xccf21009  ! 1590: STXA_R	stxa	%r6, [%r8 + %r9] 0x80
	.word 0xc2720009  ! 1593: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xcc4a0009  ! 1593: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xc36a2ed8  ! 1593: PREFETCH_I	prefetch	[%r8 + 0x0ed8], #one_read
	.word 0xf13a0009  ! 1596: STDF_R	std	%f24, [%r9, %r8]
	.word 0xc6420009  ! 1596: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xcde22009  ! 1596: CASA_R	casa	[%r8] %asi, %r9, %r6
	.word 0xc6220009  ! 1599: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc24a0009  ! 1599: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xcc92248c  ! 1599: LDUHA_I	lduha	[%r8, + 0x048c] %asi, %r6
	.word 0xf13a0009  ! 1602: STDF_R	std	%f24, [%r9, %r8]
	.word 0xc2520009  ! 1602: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xccc222a4  ! 1602: LDSWA_I	ldswa	[%r8, + 0x02a4] %asi, %r6
	.word 0xc2220009  ! 1605: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc2520009  ! 1605: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0x83a20829  ! 1605: FADDs	fadds	%f8, %f9, %f1
	.word 0xc73a0009  ! 1608: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc6020009  ! 1608: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xdab21009  ! 1608: STHA_R	stha	%r13, [%r8 + %r9] 0x80
	.word 0xd8320009  ! 1611: STH_R	sth	%r12, [%r8 + %r9]
	.word 0xcc120009  ! 1611: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xc6422c6c  ! 1611: LDSW_I	ldsw	[%r8 + 0x0c6c], %r3
	.word 0xcd3a0009  ! 1614: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc85a0009  ! 1614: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0x824a2ff4  ! 1614: MULX_I	mulx 	%r8, 0x0ff4, %r1
	.word 0xc4220009  ! 1617: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xce4a0009  ! 1617: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xcad220dc  ! 1617: LDSHA_I	ldsha	[%r8, + 0x00dc] %asi, %r5
	.word 0xc22a0009  ! 1620: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xfa520009  ! 1620: LDSH_R	ldsh	[%r8 + %r9], %r29
	.word 0x88d22900  ! 1620: UMULcc_I	umulcc 	%r8, 0x0900, %r4
	.word 0xcc720009  ! 1623: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xf71a0009  ! 1623: LDDF_R	ldd	[%r8, %r9], %f27
	.word 0xf7022df0  ! 1623: LDF_I	ld	[%r8, 0x0df0], %f27
	.word 0xf8720009  ! 1626: STX_R	stx	%r28, [%r8 + %r9]
	.word 0xfb1a0009  ! 1626: LDDF_R	ldd	[%r8, %r9], %f29
	.word 0xcbe21009  ! 1626: CASA_I	casa	[%r8] 0x80, %r9, %r5
	.word 0xec720009  ! 1629: STX_R	stx	%r22, [%r8 + %r9]
	.word 0xc3020009  ! 1629: LDF_R	ld	[%r8, %r9], %f1
	.word 0xa522271c  ! 1629: MULScc_I	mulscc 	%r8, 0x071c, %r18
	.word 0xcb3a0009  ! 1632: STDF_R	std	%f5, [%r9, %r8]
	.word 0xea520009  ! 1632: LDSH_R	ldsh	[%r8 + %r9], %r21
	.word 0xcfe21009  ! 1632: CASA_I	casa	[%r8] 0x80, %r9, %r7
	.word 0xcd3a0009  ! 1635: STDF_R	std	%f6, [%r9, %r8]
	.word 0xe24a0009  ! 1635: LDSB_R	ldsb	[%r8 + %r9], %r17
	.word 0x98520009  ! 1635: UMUL_R	umul 	%r8, %r9, %r12
	.word 0xc6720009  ! 1638: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xe05a0009  ! 1638: LDX_R	ldx	[%r8 + %r9], %r16
	.word 0xc8ba2478  ! 1638: STDA_I	stda	%r4, [%r8 + 0x0478] %asi
	.word 0xc82a0009  ! 1641: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xfc420009  ! 1641: LDSW_R	ldsw	[%r8 + %r9], %r30
	.word 0x02c20001  ! 1641: BRZ	brz  ,nt	%8,<label_0x20001>
	.word 0xc8720009  ! 1644: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xcf020009  ! 1644: LDF_R	ld	[%r8, %r9], %f7
	.word 0xc25a2db8  ! 1644: LDX_I	ldx	[%r8 + 0x0db8], %r1
	.word 0xcf220009  ! 1647: STF_R	st	%f7, [%r9, %r8]
	.word 0xec520009  ! 1647: LDSH_R	ldsh	[%r8 + %r9], %r22
	.word 0x04800001  ! 1647: BLE	ble  	<label_0x1>
	.word 0xc4320009  ! 1650: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xce520009  ! 1650: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xccba1009  ! 1650: STDA_R	stda	%r6, [%r8 + %r9] 0x80
	.word 0xc8320009  ! 1653: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xde520009  ! 1653: LDSH_R	ldsh	[%r8 + %r9], %r15
	.word 0x0c800001  ! 1653: BNEG	bneg  	<label_0x1>
	.word 0xc2220009  ! 1656: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xd84a0009  ! 1656: LDSB_R	ldsb	[%r8 + %r9], %r12
	.word 0xa0d20009  ! 1656: UMULcc_R	umulcc 	%r8, %r9, %r16
	.word 0xc3220009  ! 1659: STF_R	st	%f1, [%r9, %r8]
	.word 0xc9020009  ! 1659: LDF_R	ld	[%r8, %r9], %f4
	.word 0x26ca0001  ! 1659: BRLZ	brlz,a,pt	%8,<label_0xa0001>
	.word 0xcc2a0009  ! 1662: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xdc020009  ! 1662: LDUW_R	lduw	[%r8 + %r9], %r14
	.word 0xc3ea2374  ! 1662: PREFETCHA_I	prefetcha	[%r8, + 0x0374] %asi, #one_read
	.word 0xc3220009  ! 1665: STF_R	st	%f1, [%r9, %r8]
	.word 0xcd1a0009  ! 1665: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xec7a2094  ! 1665: SWAP_I	swap	%r22, [%r8 + 0x0094]
	.word 0xc2320009  ! 1668: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xdb1a0009  ! 1668: LDDF_R	ldd	[%r8, %r9], %f13
	.word 0xc36a274c  ! 1668: PREFETCH_I	prefetch	[%r8 + 0x074c], #one_read
	.word 0xcf220009  ! 1671: STF_R	st	%f7, [%r9, %r8]
	.word 0xee420009  ! 1671: LDSW_R	ldsw	[%r8 + %r9], %r23
	.word 0xea9226c4  ! 1671: LDUHA_I	lduha	[%r8, + 0x06c4] %asi, %r21
	.word 0xcf220009  ! 1674: STF_R	st	%f7, [%r9, %r8]
	.word 0xe31a0009  ! 1674: LDDF_R	ldd	[%r8, %r9], %f17
	.word 0xce4a23cc  ! 1674: LDSB_I	ldsb	[%r8 + 0x03cc], %r7
	.word 0xc6220009  ! 1677: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc7020009  ! 1677: LDF_R	ld	[%r8, %r9], %f3
	.word 0x8143c000  ! 1677: STBAR	stbar
	.word 0xc8220009  ! 1680: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xec420009  ! 1680: LDSW_R	ldsw	[%r8 + %r9], %r22
	.word 0x8143c000  ! 1680: STBAR	stbar
	.word 0xce720009  ! 1683: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc8120009  ! 1683: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0x26800002  ! 1683: BL	bl,a	<label_0x2>
	.word 0xc4720009  ! 1686: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xcc420009  ! 1686: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xcb22263c  ! 1686: STF_I	st	%f5, [0x063c, %r8]
	.word 0xcc320009  ! 1689: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc4020009  ! 1689: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xde0a25f8  ! 1689: LDUB_I	ldub	[%r8 + 0x05f8], %r15
	.word 0xc2720009  ! 1692: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xcd020009  ! 1692: LDF_R	ld	[%r8, %r9], %f6
	.word 0xc85a20b8  ! 1692: LDX_I	ldx	[%r8 + 0x00b8], %r4
	.word 0xcb220009  ! 1695: STF_R	st	%f5, [%r9, %r8]
	.word 0xe40a0009  ! 1695: LDUB_R	ldub	[%r8 + %r9], %r18
	.word 0x8ad22edc  ! 1695: UMULcc_I	umulcc 	%r8, 0x0edc, %r5
	.word 0xc73a0009  ! 1698: STDF_R	std	%f3, [%r9, %r8]
	.word 0xef1a0009  ! 1698: LDDF_R	ldd	[%r8, %r9], %f23
	.word 0xcaaa1009  ! 1698: STBA_R	stba	%r5, [%r8 + %r9] 0x80
	.word 0xcd3a0009  ! 1701: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc2120009  ! 1701: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xc2ca2af0  ! 1701: LDSBA_I	ldsba	[%r8, + 0x0af0] %asi, %r1
	.word 0xc3220009  ! 1704: STF_R	st	%f1, [%r9, %r8]
	.word 0xcd1a0009  ! 1704: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xc2821009  ! 1704: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r1
	.word 0xc2320009  ! 1707: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xf80a0009  ! 1707: LDUB_R	ldub	[%r8 + %r9], %r28
	.word 0xe722286c  ! 1707: STF_I	st	%f19, [0x086c, %r8]
	.word 0xcc2a0009  ! 1710: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc31a0009  ! 1710: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0x856a2d30  ! 1710: SDIVX_I	sdivx	%r8, 0x0d30, %r2
	.word 0xc73a0009  ! 1713: STDF_R	std	%f3, [%r9, %r8]
	.word 0xfb1a0009  ! 1713: LDDF_R	ldd	[%r8, %r9], %f29
	.word 0x24c20001  ! 1713: BRLEZ	brlez,a,nt	%8,<label_0x20001>
	.word 0xc22a0009  ! 1716: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc4020009  ! 1716: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0x83a209a9  ! 1716: FDIVs	fdivs	%f8, %f9, %f1
	.word 0xdc2a0009  ! 1719: STB_R	stb	%r14, [%r8 + %r9]
	.word 0xc8420009  ! 1719: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0x856a2170  ! 1719: SDIVX_I	sdivx	%r8, 0x0170, %r2
	.word 0xd82a0009  ! 1722: STB_R	stb	%r12, [%r8 + %r9]
	.word 0xc6020009  ! 1722: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0x86520009  ! 1722: UMUL_R	umul 	%r8, %r9, %r3
	.word 0xea320009  ! 1725: STH_R	sth	%r21, [%r8 + %r9]
	.word 0xc84a0009  ! 1725: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0x832221c4  ! 1725: MULScc_I	mulscc 	%r8, 0x01c4, %r1
	.word 0xc2720009  ! 1728: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xf64a0009  ! 1728: LDSB_R	ldsb	[%r8 + %r9], %r27
	.word 0xcaa21009  ! 1728: STWA_R	stwa	%r5, [%r8 + %r9] 0x80
	.word 0xc42a0009  ! 1731: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc44a0009  ! 1731: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0x06800002  ! 1731: BL	bl  	<label_0x2>
	.word 0xca720009  ! 1734: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xcc420009  ! 1734: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xe44228e8  ! 1734: LDSW_I	ldsw	[%r8 + 0x08e8], %r18
	.word 0xc9220009  ! 1737: STF_R	st	%f4, [%r9, %r8]
	.word 0xef1a0009  ! 1737: LDDF_R	ldd	[%r8, %r9], %f23
	.word 0xa7a20929  ! 1737: FMULs	fmuls	%f8, %f9, %f19
	.word 0xce2a0009  ! 1740: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xf8020009  ! 1740: LDUW_R	lduw	[%r8 + %r9], %r28
	.word 0x89220009  ! 1740: MULScc_R	mulscc 	%r8, %r9, %r4
	.word 0xf22a0009  ! 1743: STB_R	stb	%r25, [%r8 + %r9]
	.word 0xce4a0009  ! 1743: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xcaea2134  ! 1743: LDSTUBA_I	ldstuba	%r5, [%r8 + 0x0134] %asi
	.word 0xcd3a0009  ! 1746: STDF_R	std	%f6, [%r9, %r8]
	.word 0xcc4a0009  ! 1746: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xdcf21009  ! 1746: STXA_R	stxa	%r14, [%r8 + %r9] 0x80
	.word 0xf8720009  ! 1749: STX_R	stx	%r28, [%r8 + %r9]
	.word 0xfa120009  ! 1749: LDUH_R	lduh	[%r8 + %r9], %r29
	.word 0xf28a1009  ! 1749: LDUBA_R	lduba	[%r8, %r9] 0x80, %r25
	.word 0xd82a0009  ! 1752: STB_R	stb	%r12, [%r8 + %r9]
	.word 0xcf020009  ! 1752: LDF_R	ld	[%r8, %r9], %f7
	.word 0x86522e48  ! 1752: UMUL_I	umul 	%r8, 0x0e48, %r3
	.word 0xce2a0009  ! 1755: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xf04a0009  ! 1755: LDSB_R	ldsb	[%r8 + %r9], %r24
	.word 0xacd20009  ! 1755: UMULcc_R	umulcc 	%r8, %r9, %r22
	.word 0xca220009  ! 1758: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xcf1a0009  ! 1758: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xc3ea2c50  ! 1758: PREFETCHA_I	prefetcha	[%r8, + 0x0c50] %asi, #one_read
	.word 0xfd3a0009  ! 1761: STDF_R	std	%f30, [%r9, %r8]
	.word 0xf0420009  ! 1761: LDSW_R	ldsw	[%r8 + %r9], %r24
	.word 0x8da209a9  ! 1761: FDIVs	fdivs	%f8, %f9, %f6
	.word 0xc6220009  ! 1764: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xcc4a0009  ! 1764: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0x8ada2ffc  ! 1764: SMULcc_I	smulcc 	%r8, 0x0ffc, %r5
	.word 0xda320009  ! 1767: STH_R	sth	%r13, [%r8 + %r9]
	.word 0xc85a0009  ! 1767: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xc6120009  ! 1767: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xe0220009  ! 1770: STW_R	stw	%r16, [%r8 + %r9]
	.word 0xc5020009  ! 1770: LDF_R	ld	[%r8, %r9], %f2
	.word 0xcf1a0009  ! 1770: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xf7220009  ! 1773: STF_R	st	%f27, [%r9, %r8]
	.word 0xee120009  ! 1773: LDUH_R	lduh	[%r8 + %r9], %r23
	.word 0xcf222148  ! 1773: STF_I	st	%f7, [0x0148, %r8]
	.word 0xc53a0009  ! 1776: STDF_R	std	%f2, [%r9, %r8]
	.word 0xca020009  ! 1776: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xc3ea2dbc  ! 1776: PREFETCHA_I	prefetcha	[%r8, + 0x0dbc] %asi, #one_read
	.word 0xcb220009  ! 1779: STF_R	st	%f5, [%r9, %r8]
	.word 0xcc5a0009  ! 1779: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0x02c20001  ! 1779: BRZ	brz  ,nt	%8,<label_0x20001>
	.word 0xde2a0009  ! 1782: STB_R	stb	%r15, [%r8 + %r9]
	.word 0xce4a0009  ! 1782: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0x24c20001  ! 1782: BRLEZ	brlez,a,nt	%8,<label_0x20001>
	.word 0xc62a0009  ! 1785: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xcc120009  ! 1785: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xcf220009  ! 1785: STF_R	st	%f7, [%r9, %r8]
	.word 0xca720009  ! 1788: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc4020009  ! 1788: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xa1a20929  ! 1788: FMULs	fmuls	%f8, %f9, %f16
	.word 0xc8220009  ! 1791: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xce020009  ! 1791: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xc6c22b8c  ! 1791: LDSWA_I	ldswa	[%r8, + 0x0b8c] %asi, %r3
	.word 0xcb220009  ! 1794: STF_R	st	%f5, [%r9, %r8]
	.word 0xc7020009  ! 1794: LDF_R	ld	[%r8, %r9], %f3
	.word 0x8ed20009  ! 1794: UMULcc_R	umulcc 	%r8, %r9, %r7
	.word 0xca320009  ! 1797: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc84a0009  ! 1797: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xcaaa2118  ! 1797: STBA_I	stba	%r5, [%r8 + 0x0118] %asi
	.word 0xd6220009  ! 1800: STW_R	stw	%r11, [%r8 + %r9]
	.word 0xee520009  ! 1800: LDSH_R	ldsh	[%r8 + %r9], %r23
	.word 0xd8ba2f40  ! 1800: STDA_I	stda	%r12, [%r8 + 0x0f40] %asi
	.word 0xca320009  ! 1803: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xcf020009  ! 1803: LDF_R	ld	[%r8, %r9], %f7
	.word 0xc6da1009  ! 1803: LDXA_R	ldxa	[%r8, %r9] 0x80, %r3
	.word 0xdb3a0009  ! 1806: STDF_R	std	%f13, [%r9, %r8]
	.word 0xec420009  ! 1806: LDSW_R	ldsw	[%r8 + %r9], %r22
	.word 0x1a800002  ! 1806: BCC	bcc  	<label_0x2>
	.word 0xc2720009  ! 1809: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xce120009  ! 1809: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0x84da22d0  ! 1809: SMULcc_I	smulcc 	%r8, 0x02d0, %r2
	.word 0xed3a0009  ! 1812: STDF_R	std	%f22, [%r9, %r8]
	.word 0xef1a0009  ! 1812: LDDF_R	ldd	[%r8, %r9], %f23
	.word 0x86f20009  ! 1812: UDIVcc_R	udivcc 	%r8, %r9, %r3
	.word 0xe8320009  ! 1815: STH_R	sth	%r20, [%r8 + %r9]
	.word 0xc2120009  ! 1815: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0x02c20001  ! 1815: BRZ	brz  ,nt	%8,<label_0x20001>
	.word 0xc2720009  ! 1818: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xcd020009  ! 1818: LDF_R	ld	[%r8, %r9], %f6
	.word 0xea821009  ! 1818: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r21
	.word 0xc4320009  ! 1821: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xd60a0009  ! 1821: LDUB_R	ldub	[%r8 + %r9], %r11
	.word 0x8e520009  ! 1821: UMUL_R	umul 	%r8, %r9, %r7
	.word 0xd6220009  ! 1824: STW_R	stw	%r11, [%r8 + %r9]
	.word 0xcf1a0009  ! 1824: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xc3ea1009  ! 1824: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xcd3a0009  ! 1827: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc6120009  ! 1827: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0x8143c000  ! 1827: STBAR	stbar
	.word 0xea320009  ! 1830: STH_R	sth	%r21, [%r8 + %r9]
	.word 0xc31a0009  ! 1830: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xeaca1009  ! 1830: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r21
	.word 0xe3220009  ! 1833: STF_R	st	%f17, [%r9, %r8]
	.word 0xe71a0009  ! 1833: LDDF_R	ldd	[%r8, %r9], %f19
	.word 0x0c800001  ! 1833: BNEG	bneg  	<label_0x1>
	.word 0xca720009  ! 1836: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xe0520009  ! 1836: LDSH_R	ldsh	[%r8 + %r9], %r16
	.word 0xcefa1009  ! 1836: SWAPA_R	swapa	%r7, [%r8 + %r9] 0x80
	.word 0xc4720009  ! 1839: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xe05a0009  ! 1839: LDX_R	ldx	[%r8 + %r9], %r16
	.word 0xc88a1009  ! 1839: LDUBA_R	lduba	[%r8, %r9] 0x80, %r4
	.word 0xcc720009  ! 1842: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc85a0009  ! 1842: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xcaea2058  ! 1842: LDSTUBA_I	ldstuba	%r5, [%r8 + 0x0058] %asi
	.word 0xc6720009  ! 1845: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xca0a0009  ! 1845: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xc4b21009  ! 1845: STHA_R	stha	%r2, [%r8 + %r9] 0x80
	.word 0xe8720009  ! 1848: STX_R	stx	%r20, [%r8 + %r9]
	.word 0xcb020009  ! 1848: LDF_R	ld	[%r8, %r9], %f5
	.word 0xd6ea2228  ! 1848: LDSTUBA_I	ldstuba	%r11, [%r8 + 0x0228] %asi
	.word 0xc8720009  ! 1851: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xe2020009  ! 1851: LDUW_R	lduw	[%r8 + %r9], %r17
	.word 0xf0f22c00  ! 1851: STXA_I	stxa	%r24, [%r8 + 0x0c00] %asi
	.word 0xc42a0009  ! 1854: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc80a0009  ! 1854: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0x8143c000  ! 1854: STBAR	stbar
	.word 0xcf220009  ! 1857: STF_R	st	%f7, [%r9, %r8]
	.word 0xc9020009  ! 1857: LDF_R	ld	[%r8, %r9], %f4
	.word 0xc8ea1009  ! 1857: LDSTUBA_R	ldstuba	%r4, [%r8 + %r9] 0x80
	.word 0xce320009  ! 1860: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xca4a0009  ! 1860: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xc36a0009  ! 1860: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xde320009  ! 1863: STH_R	sth	%r15, [%r8 + %r9]
	.word 0xc40a0009  ! 1863: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xc6da1009  ! 1863: LDXA_R	ldxa	[%r8, %r9] 0x80, %r3
	.word 0xc9220009  ! 1866: STF_R	st	%f4, [%r9, %r8]
	.word 0xe8420009  ! 1866: LDSW_R	ldsw	[%r8 + %r9], %r20
	.word 0x26800001  ! 1866: BL	bl,a	<label_0x1>
	.word 0xcf3a0009  ! 1869: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc44a0009  ! 1869: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xf6f21009  ! 1869: STXA_R	stxa	%r27, [%r8 + %r9] 0x80
	.word 0xcb220009  ! 1872: STF_R	st	%f5, [%r9, %r8]
	.word 0xc3020009  ! 1872: LDF_R	ld	[%r8, %r9], %f1
	.word 0x83a209a9  ! 1872: FDIVs	fdivs	%f8, %f9, %f1
	.word 0xd7220009  ! 1875: STF_R	st	%f11, [%r9, %r8]
	.word 0xca120009  ! 1875: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xc2c21009  ! 1875: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r1
	.word 0xc73a0009  ! 1878: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc6420009  ! 1878: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xccf21009  ! 1878: STXA_R	stxa	%r6, [%r8 + %r9] 0x80
	.word 0xcd220009  ! 1881: STF_R	st	%f6, [%r9, %r8]
	.word 0xc8520009  ! 1881: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xc36a0009  ! 1881: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xca720009  ! 1884: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xce520009  ! 1884: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0x8143e04d  ! 1884: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Sync 
	.word 0xc6220009  ! 1887: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc85a0009  ! 1887: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xfdf21009  ! 1887: CASXA_I	casxa	[%r8] 0x80, %r9, %r30
	.word 0xcf3a0009  ! 1890: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc8420009  ! 1890: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xf4f21009  ! 1890: STXA_R	stxa	%r26, [%r8 + %r9] 0x80
	.word 0xc2320009  ! 1893: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xca520009  ! 1893: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xc5f22009  ! 1893: CASXA_R	casxa	[%r8]%asi, %r9, %r2
	.word 0xc8320009  ! 1896: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xca520009  ! 1896: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xf8ea264c  ! 1896: LDSTUBA_I	ldstuba	%r28, [%r8 + 0x064c] %asi
	.word 0xcb220009  ! 1899: STF_R	st	%f5, [%r9, %r8]
	.word 0xde0a0009  ! 1899: LDUB_R	ldub	[%r8 + %r9], %r15
	.word 0x8143c000  ! 1899: STBAR	stbar
	.word 0xcf220009  ! 1902: STF_R	st	%f7, [%r9, %r8]
	.word 0xe4420009  ! 1902: LDSW_R	ldsw	[%r8 + %r9], %r18
	.word 0x8143e076  ! 1902: MEMBAR	membar	#StoreLoad | #LoadStore | #Lookaside | #MemIssue | #Sync 
	.word 0xcd220009  ! 1905: STF_R	st	%f6, [%r9, %r8]
	.word 0xfa520009  ! 1905: LDSH_R	ldsh	[%r8 + %r9], %r29
	.word 0xcd3a0009  ! 1905: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc93a0009  ! 1908: STDF_R	std	%f4, [%r9, %r8]
	.word 0xca520009  ! 1908: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0x9a5225a8  ! 1908: UMUL_I	umul 	%r8, 0x05a8, %r13
	.word 0xdf220009  ! 1911: STF_R	st	%f15, [%r9, %r8]
	.word 0xec020009  ! 1911: LDUW_R	lduw	[%r8 + %r9], %r22
	.word 0xc69225d4  ! 1911: LDUHA_I	lduha	[%r8, + 0x05d4] %asi, %r3
	.word 0xc7220009  ! 1914: STF_R	st	%f3, [%r9, %r8]
	.word 0xc8120009  ! 1914: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xcbe22009  ! 1914: CASA_R	casa	[%r8] %asi, %r9, %r5
	.word 0xe8320009  ! 1917: STH_R	sth	%r20, [%r8 + %r9]
	.word 0xe0520009  ! 1917: LDSH_R	ldsh	[%r8 + %r9], %r16
	.word 0x844a2cb4  ! 1917: MULX_I	mulx 	%r8, 0x0cb4, %r2
	.word 0xfb3a0009  ! 1920: STDF_R	std	%f29, [%r9, %r8]
	.word 0xfc520009  ! 1920: LDSH_R	ldsh	[%r8 + %r9], %r30
	.word 0xb25a2bb0  ! 1920: SMUL_I	smul 	%r8, 0x0bb0, %r25
	.word 0xc6220009  ! 1923: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xf80a0009  ! 1923: LDUB_R	ldub	[%r8 + %r9], %r28
	.word 0xdc7a2b98  ! 1923: SWAP_I	swap	%r14, [%r8 + 0x0b98]
	.word 0xff220009  ! 1926: STF_R	st	%f31, [%r9, %r8]
	.word 0xe05a0009  ! 1926: LDX_R	ldx	[%r8 + %r9], %r16
	.word 0x2ac20001  ! 1926: BRNZ	brnz,a,nt	%8,<label_0x20001>
	.word 0xcb220009  ! 1929: STF_R	st	%f5, [%r9, %r8]
	.word 0xc91a0009  ! 1929: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0x86520009  ! 1929: UMUL_R	umul 	%r8, %r9, %r3
	.word 0xc4720009  ! 1932: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xfe420009  ! 1932: LDSW_R	ldsw	[%r8 + %r9], %r31
	.word 0xcbf21009  ! 1932: CASXA_I	casxa	[%r8] 0x80, %r9, %r5
	.word 0xe7220009  ! 1935: STF_R	st	%f19, [%r9, %r8]
	.word 0xe60a0009  ! 1935: LDUB_R	ldub	[%r8 + %r9], %r19
	.word 0xcca22574  ! 1935: STWA_I	stwa	%r6, [%r8 + 0x0574] %asi
	.word 0xe62a0009  ! 1938: STB_R	stb	%r19, [%r8 + %r9]
	.word 0xce120009  ! 1938: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xcf220009  ! 1938: STF_R	st	%f7, [%r9, %r8]
	.word 0xc5220009  ! 1941: STF_R	st	%f2, [%r9, %r8]
	.word 0xc25a0009  ! 1941: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xc3f22009  ! 1941: CASXA_R	casxa	[%r8]%asi, %r9, %r1
	.word 0xcf220009  ! 1944: STF_R	st	%f7, [%r9, %r8]
	.word 0xc91a0009  ! 1944: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xc67a2474  ! 1944: SWAP_I	swap	%r3, [%r8 + 0x0474]
	.word 0xf22a0009  ! 1947: STB_R	stb	%r25, [%r8 + %r9]
	.word 0xc2020009  ! 1947: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xdd020009  ! 1947: LDF_R	ld	[%r8, %r9], %f14
	.word 0xc33a0009  ! 1950: STDF_R	std	%f1, [%r9, %r8]
	.word 0xcc520009  ! 1950: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xc6122eec  ! 1950: LDUH_I	lduh	[%r8 + 0x0eec], %r3
	.word 0xce2a0009  ! 1953: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xf9020009  ! 1953: LDF_R	ld	[%r8, %r9], %f28
	.word 0xcc9222c4  ! 1953: LDUHA_I	lduha	[%r8, + 0x02c4] %asi, %r6
	.word 0xe02a0009  ! 1956: STB_R	stb	%r16, [%r8 + %r9]
	.word 0xca420009  ! 1956: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0x8143e00e  ! 1956: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore 
	.word 0xc8320009  ! 1959: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xca5a0009  ! 1959: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xd86a2dcc  ! 1959: LDSTUB_I	ldstub	%r12, [%r8 + 0x0dcc]
	.word 0xc4220009  ! 1962: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xe51a0009  ! 1962: LDDF_R	ldd	[%r8, %r9], %f18
	.word 0xf73a0009  ! 1962: STDF_R	std	%f27, [%r9, %r8]
	.word 0xe33a0009  ! 1965: STDF_R	std	%f17, [%r9, %r8]
	.word 0xda420009  ! 1965: LDSW_R	ldsw	[%r8 + %r9], %r13
	.word 0xeeea2944  ! 1965: LDSTUBA_I	ldstuba	%r23, [%r8 + 0x0944] %asi
	.word 0xcc2a0009  ! 1968: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc8020009  ! 1968: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xc8420009  ! 1968: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xc4320009  ! 1971: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xfa020009  ! 1971: LDUW_R	lduw	[%r8 + %r9], %r29
	.word 0xc36a0009  ! 1971: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xe4320009  ! 1974: STH_R	sth	%r18, [%r8 + %r9]
	.word 0xe2020009  ! 1974: LDUW_R	lduw	[%r8 + %r9], %r17
	.word 0xc88a2138  ! 1974: LDUBA_I	lduba	[%r8, + 0x0138] %asi, %r4
	.word 0xc4220009  ! 1977: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xdf020009  ! 1977: LDF_R	ld	[%r8, %r9], %f15
	.word 0x8a7a0009  ! 1977: SDIV_R	sdiv 	%r8, %r9, %r5
	.word 0xc8320009  ! 1980: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc2420009  ! 1980: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xc3ea2998  ! 1980: PREFETCHA_I	prefetcha	[%r8, + 0x0998] %asi, #one_read
	.word 0xce320009  ! 1983: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xfe020009  ! 1983: LDUW_R	lduw	[%r8 + %r9], %r31
	.word 0xc4c22634  ! 1983: LDSWA_I	ldswa	[%r8, + 0x0634] %asi, %r2
	.word 0xc3220009  ! 1986: STF_R	st	%f1, [%r9, %r8]
	.word 0xe2520009  ! 1986: LDSH_R	ldsh	[%r8 + %r9], %r17
	.word 0x8ef20009  ! 1986: UDIVcc_R	udivcc 	%r8, %r9, %r7
	.word 0xc8320009  ! 1989: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc45a0009  ! 1989: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0x8143e049  ! 1989: MEMBAR	membar	#LoadLoad | #StoreStore | #Sync 
	.word 0xc2720009  ! 1992: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xe0020009  ! 1992: LDUW_R	lduw	[%r8 + %r9], %r16
	.word 0x40000001  ! 1992: CALL	call	disp30_1
	.word 0xce320009  ! 1995: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xcc4a0009  ! 1995: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xc2ea2ea8  ! 1995: LDSTUBA_I	ldstuba	%r1, [%r8 + 0x0ea8] %asi
	.word 0xc33a0009  ! 1998: STDF_R	std	%f1, [%r9, %r8]
	.word 0xca420009  ! 1998: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xc3ea2418  ! 1998: PREFETCHA_I	prefetcha	[%r8, + 0x0418] %asi, #one_read
	.word 0xe42a0009  ! 2001: STB_R	stb	%r18, [%r8 + %r9]
	.word 0xcb1a0009  ! 2001: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0x8143e039  ! 2001: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside | #MemIssue 
	.word 0xed3a0009  ! 2004: STDF_R	std	%f22, [%r9, %r8]
	.word 0xcc5a0009  ! 2004: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xbad229b8  ! 2004: UMULcc_I	umulcc 	%r8, 0x09b8, %r29
	.word 0xce720009  ! 2007: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xcd020009  ! 2007: LDF_R	ld	[%r8, %r9], %f6
	.word 0x84fa0009  ! 2007: SDIVcc_R	sdivcc 	%r8, %r9, %r2
	.word 0xf93a0009  ! 2010: STDF_R	std	%f28, [%r9, %r8]
	.word 0xcc020009  ! 2010: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xe2da2218  ! 2010: LDXA_I	ldxa	[%r8, + 0x0218] %asi, %r17
	.word 0xf2220009  ! 2013: STW_R	stw	%r25, [%r8 + %r9]
	.word 0xcb1a0009  ! 2013: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0x8da20929  ! 2013: FMULs	fmuls	%f8, %f9, %f6
	.word 0xcf3a0009  ! 2016: STDF_R	std	%f7, [%r9, %r8]
	.word 0xd8120009  ! 2016: LDUH_R	lduh	[%r8 + %r9], %r12
	.word 0x0cca0001  ! 2016: BRGZ	brgz  ,pt	%8,<label_0xa0001>
	.word 0xf33a0009  ! 2019: STDF_R	std	%f25, [%r9, %r8]
	.word 0xf20a0009  ! 2019: LDUB_R	ldub	[%r8 + %r9], %r25
	.word 0xcb1a2db8  ! 2019: LDDF_I	ldd	[%r8, 0x0db8], %f5
	.word 0xc4320009  ! 2022: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc4420009  ! 2022: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xc2822b30  ! 2022: LDUWA_I	lduwa	[%r8, + 0x0b30] %asi, %r1
	.word 0xca2a0009  ! 2025: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xcb1a0009  ! 2025: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xfcfa1009  ! 2025: SWAPA_R	swapa	%r30, [%r8 + %r9] 0x80
	.word 0xe6220009  ! 2028: STW_R	stw	%r19, [%r8 + %r9]
	.word 0xd8420009  ! 2028: LDSW_R	ldsw	[%r8 + %r9], %r12
	.word 0xc8da1009  ! 2028: LDXA_R	ldxa	[%r8, %r9] 0x80, %r4
	.word 0xca320009  ! 2031: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xcc020009  ! 2031: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xf2d22da8  ! 2031: LDSHA_I	ldsha	[%r8, + 0x0da8] %asi, %r25
	.word 0xfa220009  ! 2034: STW_R	stw	%r29, [%r8 + %r9]
	.word 0xc60a0009  ! 2034: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0x8143c000  ! 2034: STBAR	stbar
	.word 0xcc320009  ! 2037: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xce420009  ! 2037: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xf8120009  ! 2037: LDUH_R	lduh	[%r8 + %r9], %r28
	.word 0xc22a0009  ! 2040: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xce120009  ! 2040: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xdcfa2980  ! 2040: SWAPA_I	swapa	%r14, [%r8 + 0x0980] %asi
	.word 0xc8720009  ! 2043: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xe9020009  ! 2043: LDF_R	ld	[%r8, %r9], %f20
	.word 0xc3ea2fe0  ! 2043: PREFETCHA_I	prefetcha	[%r8, + 0x0fe0] %asi, #one_read
	.word 0xd9220009  ! 2046: STF_R	st	%f12, [%r9, %r8]
	.word 0xcc120009  ! 2046: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xc2d229d8  ! 2046: LDSHA_I	ldsha	[%r8, + 0x09d8] %asi, %r1
	.word 0xcf3a0009  ! 2049: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc5020009  ! 2049: LDF_R	ld	[%r8, %r9], %f2
	.word 0xc2922e7c  ! 2049: LDUHA_I	lduha	[%r8, + 0x0e7c] %asi, %r1
	.word 0xea220009  ! 2052: STW_R	stw	%r21, [%r8 + %r9]
	.word 0xcb1a0009  ! 2052: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xc48a2c00  ! 2052: LDUBA_I	lduba	[%r8, + 0x0c00] %asi, %r2
	.word 0xf6720009  ! 2055: STX_R	stx	%r27, [%r8 + %r9]
	.word 0xc45a0009  ! 2055: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xf0aa1009  ! 2055: STBA_R	stba	%r24, [%r8 + %r9] 0x80
	.word 0xc6220009  ! 2058: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc4020009  ! 2058: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xe87a0009  ! 2058: SWAP_R	swap	%r20, [%r8 + %r9]
	.word 0xcc720009  ! 2061: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc25a0009  ! 2061: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xf86a0009  ! 2061: LDSTUB_R	ldstub	%r28, [%r8 + %r9]
	.word 0xc2220009  ! 2064: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xed020009  ! 2064: LDF_R	ld	[%r8, %r9], %f22
	.word 0xce522378  ! 2064: LDSH_I	ldsh	[%r8 + 0x0378], %r7
	.word 0xcc2a0009  ! 2067: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xcc5a0009  ! 2067: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0x8da20929  ! 2067: FMULs	fmuls	%f8, %f9, %f6
	.word 0xc4220009  ! 2070: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xfa520009  ! 2070: LDSH_R	ldsh	[%r8 + %r9], %r29
	.word 0xcbf22009  ! 2070: CASXA_R	casxa	[%r8]%asi, %r9, %r5
	.word 0xce2a0009  ! 2073: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xe04a0009  ! 2073: LDSB_R	ldsb	[%r8 + %r9], %r16
	.word 0xe812263c  ! 2073: LDUH_I	lduh	[%r8 + 0x063c], %r20
	.word 0xc4720009  ! 2076: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xcd1a0009  ! 2076: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xeafa2228  ! 2076: SWAPA_I	swapa	%r21, [%r8 + 0x0228] %asi
	.word 0xdc220009  ! 2079: STW_R	stw	%r14, [%r8 + %r9]
	.word 0xca0a0009  ! 2079: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xc2b22ca0  ! 2079: STHA_I	stha	%r1, [%r8 + 0x0ca0] %asi
	.word 0xca720009  ! 2082: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc7020009  ! 2082: LDF_R	ld	[%r8, %r9], %f3
	.word 0xc4022e78  ! 2082: LDUW_I	lduw	[%r8 + 0x0e78], %r2
	.word 0xe02a0009  ! 2085: STB_R	stb	%r16, [%r8 + %r9]
	.word 0xe8020009  ! 2085: LDUW_R	lduw	[%r8 + %r9], %r20
	.word 0xc2b21009  ! 2085: STHA_R	stha	%r1, [%r8 + %r9] 0x80
	.word 0xdf220009  ! 2088: STF_R	st	%f15, [%r9, %r8]
	.word 0xc85a0009  ! 2088: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0x8143e051  ! 2088: MEMBAR	membar	#LoadLoad | #Lookaside | #Sync 
	.word 0xce320009  ! 2091: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xf44a0009  ! 2091: LDSB_R	ldsb	[%r8 + %r9], %r26
	.word 0xe01a25c0  ! 2091: LDD_I	ldd	[%r8 + 0x05c0], %r16
	.word 0xc73a0009  ! 2094: STDF_R	std	%f3, [%r9, %r8]
	.word 0xef1a0009  ! 2094: LDDF_R	ldd	[%r8, %r9], %f23
	.word 0x00800001  ! 2094: BN	bn  	<label_0x1>
	.word 0xc33a0009  ! 2097: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc65a0009  ! 2097: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0x9a4a0009  ! 2097: MULX_R	mulx 	%r8, %r9, %r13
	.word 0xc33a0009  ! 2100: STDF_R	std	%f1, [%r9, %r8]
	.word 0xe64a0009  ! 2100: LDSB_R	ldsb	[%r8 + %r9], %r19
	.word 0xcd3a28e0  ! 2100: STDF_I	std	%f6, [0x08e0, %r8]
	.word 0xce2a0009  ! 2103: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc44a0009  ! 2103: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xc26a249c  ! 2103: LDSTUB_I	ldstub	%r1, [%r8 + 0x049c]
	.word 0xc6220009  ! 2106: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xca120009  ! 2106: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xb76a0009  ! 2106: SDIVX_R	sdivx	%r8, %r9, %r27
	.word 0xc7220009  ! 2109: STF_R	st	%f3, [%r9, %r8]
	.word 0xfc120009  ! 2109: LDUH_R	lduh	[%r8 + %r9], %r30
	.word 0xdcb2279c  ! 2109: STHA_I	stha	%r14, [%r8 + 0x079c] %asi
	.word 0xf62a0009  ! 2112: STB_R	stb	%r27, [%r8 + %r9]
	.word 0xc6420009  ! 2112: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xc8fa1009  ! 2112: SWAPA_R	swapa	%r4, [%r8 + %r9] 0x80
	.word 0xc6220009  ! 2115: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xd85a0009  ! 2115: LDX_R	ldx	[%r8 + %r9], %r12
	.word 0xe6ca1009  ! 2115: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r19
	.word 0xcc2a0009  ! 2118: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc40a0009  ! 2118: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xc6da1009  ! 2118: LDXA_R	ldxa	[%r8, %r9] 0x80, %r3
	.word 0xc7220009  ! 2121: STF_R	st	%f3, [%r9, %r8]
	.word 0xe2020009  ! 2121: LDUW_R	lduw	[%r8 + %r9], %r17
	.word 0x8143e029  ! 2121: MEMBAR	membar	#LoadLoad | #StoreStore | #MemIssue 
	.word 0xf6220009  ! 2124: STW_R	stw	%r27, [%r8 + %r9]
	.word 0xca520009  ! 2124: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xf5e22009  ! 2124: CASA_R	casa	[%r8] %asi, %r9, %r26
	.word 0xef3a0009  ! 2127: STDF_R	std	%f23, [%r9, %r8]
	.word 0xea120009  ! 2127: LDUH_R	lduh	[%r8 + %r9], %r21
	.word 0xdeb224cc  ! 2127: STHA_I	stha	%r15, [%r8 + 0x04cc] %asi
	.word 0xc93a0009  ! 2130: STDF_R	std	%f4, [%r9, %r8]
	.word 0xce4a0009  ! 2130: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xccba27c0  ! 2130: STDA_I	stda	%r6, [%r8 + 0x07c0] %asi
	.word 0xc7220009  ! 2133: STF_R	st	%f3, [%r9, %r8]
	.word 0xc6420009  ! 2133: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0x83a209a9  ! 2133: FDIVs	fdivs	%f8, %f9, %f1
	.word 0xce320009  ! 2136: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xce5a0009  ! 2136: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0x85a209a9  ! 2136: FDIVs	fdivs	%f8, %f9, %f2
	.word 0xc2720009  ! 2139: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc5020009  ! 2139: LDF_R	ld	[%r8, %r9], %f2
	.word 0x8e7229a8  ! 2139: UDIV_I	udiv 	%r8, 0x09a8, %r7
	.word 0xe4720009  ! 2142: STX_R	stx	%r18, [%r8 + %r9]
	.word 0xca420009  ! 2142: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xeea21009  ! 2142: STWA_R	stwa	%r23, [%r8 + %r9] 0x80
	.word 0xcb3a0009  ! 2145: STDF_R	std	%f5, [%r9, %r8]
	.word 0xc8120009  ! 2145: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0x87a20829  ! 2145: FADDs	fadds	%f8, %f9, %f3
	.word 0xcc2a0009  ! 2148: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc71a0009  ! 2148: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xcd222608  ! 2148: STF_I	st	%f6, [0x0608, %r8]
	.word 0xce220009  ! 2151: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xcc120009  ! 2151: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0x9d222844  ! 2151: MULScc_I	mulscc 	%r8, 0x0844, %r14
	.word 0xce720009  ! 2154: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xdf1a0009  ! 2154: LDDF_R	ldd	[%r8, %r9], %f15
	.word 0x0cc20001  ! 2154: BRGZ	brgz  ,nt	%8,<label_0x20001>
	.word 0xfa320009  ! 2157: STH_R	sth	%r29, [%r8 + %r9]
	.word 0xcc5a0009  ! 2157: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xaad22ef4  ! 2157: UMULcc_I	umulcc 	%r8, 0x0ef4, %r21
	.word 0xcc320009  ! 2160: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xf51a0009  ! 2160: LDDF_R	ldd	[%r8, %r9], %f26
	.word 0xc49a2ca0  ! 2160: LDDA_I	ldda	[%r8, + 0x0ca0] %asi, %r2
	.word 0xc62a0009  ! 2163: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xea5a0009  ! 2163: LDX_R	ldx	[%r8 + %r9], %r21
	.word 0xc36a0009  ! 2163: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xf73a0009  ! 2166: STDF_R	std	%f27, [%r9, %r8]
	.word 0xcc520009  ! 2166: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xc3ea1009  ! 2166: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xde2a0009  ! 2169: STB_R	stb	%r15, [%r8 + %r9]
	.word 0xc20a0009  ! 2169: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xc3ea1009  ! 2169: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc2220009  ! 2172: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc44a0009  ! 2172: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xcb2222bc  ! 2172: STF_I	st	%f5, [0x02bc, %r8]
	.word 0xe3220009  ! 2175: STF_R	st	%f17, [%r9, %r8]
	.word 0xce520009  ! 2175: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xa9a209a9  ! 2175: FDIVs	fdivs	%f8, %f9, %f20
	.word 0xe7220009  ! 2178: STF_R	st	%f19, [%r9, %r8]
	.word 0xc65a0009  ! 2178: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xcd1a2748  ! 2178: LDDF_I	ldd	[%r8, 0x0748], %f6
	.word 0xc93a0009  ! 2181: STDF_R	std	%f4, [%r9, %r8]
	.word 0xe0420009  ! 2181: LDSW_R	ldsw	[%r8 + %r9], %r16
	.word 0xc3ea1009  ! 2181: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc2720009  ! 2184: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xf40a0009  ! 2184: LDUB_R	ldub	[%r8 + %r9], %r26
	.word 0x8c5a0009  ! 2184: SMUL_R	smul 	%r8, %r9, %r6
	.word 0xe6220009  ! 2187: STW_R	stw	%r19, [%r8 + %r9]
	.word 0xf85a0009  ! 2187: LDX_R	ldx	[%r8 + %r9], %r28
	.word 0xc45a0009  ! 2187: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xc5220009  ! 2190: STF_R	st	%f2, [%r9, %r8]
	.word 0xcf020009  ! 2190: LDF_R	ld	[%r8, %r9], %f7
	.word 0x8da209a9  ! 2190: FDIVs	fdivs	%f8, %f9, %f6
	.word 0xcd3a0009  ! 2193: STDF_R	std	%f6, [%r9, %r8]
	.word 0xcc420009  ! 2193: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0x836a0009  ! 2193: SDIVX_R	sdivx	%r8, %r9, %r1
	.word 0xc42a0009  ! 2196: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xce5a0009  ! 2196: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xccba1009  ! 2196: STDA_R	stda	%r6, [%r8 + %r9] 0x80
	.word 0xce2a0009  ! 2199: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc8020009  ! 2199: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0x1a800001  ! 2199: BCC	bcc  	<label_0x1>
	.word 0xc93a0009  ! 2202: STDF_R	std	%f4, [%r9, %r8]
	.word 0xcf020009  ! 2202: LDF_R	ld	[%r8, %r9], %f7
	.word 0x8143c000  ! 2202: STBAR	stbar
	.word 0xcc720009  ! 2205: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xfd1a0009  ! 2205: LDDF_R	ldd	[%r8, %r9], %f30
	.word 0x1c800001  ! 2205: BPOS	bpos  	<label_0x1>
	.word 0xcd3a0009  ! 2208: STDF_R	std	%f6, [%r9, %r8]
	.word 0xde120009  ! 2208: LDUH_R	lduh	[%r8 + %r9], %r15
	.word 0x986a0009  ! 2208: UDIVX_R	udivx 	%r8, %r9, %r12
	.word 0xcf3a0009  ! 2211: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc8020009  ! 2211: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xc86a0009  ! 2211: LDSTUB_R	ldstub	%r4, [%r8 + %r9]
	.word 0xcf3a0009  ! 2214: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc64a0009  ! 2214: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0x845a2218  ! 2214: SMUL_I	smul 	%r8, 0x0218, %r2
	.word 0xdf3a0009  ! 2217: STDF_R	std	%f15, [%r9, %r8]
	.word 0xc60a0009  ! 2217: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xc36a25c4  ! 2217: PREFETCH_I	prefetch	[%r8 + 0x05c4], #one_read
	.word 0xcf3a0009  ! 2220: STDF_R	std	%f7, [%r9, %r8]
	.word 0xea120009  ! 2220: LDUH_R	lduh	[%r8 + %r9], %r21
	.word 0x0c800001  ! 2220: BNEG	bneg  	<label_0x1>
	.word 0xe02a0009  ! 2223: STB_R	stb	%r16, [%r8 + %r9]
	.word 0xce5a0009  ! 2223: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xc3ea2954  ! 2223: PREFETCHA_I	prefetcha	[%r8, + 0x0954] %asi, #one_read
	.word 0xc6720009  ! 2226: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xe9020009  ! 2226: LDF_R	ld	[%r8, %r9], %f20
	.word 0xc3ea2258  ! 2226: PREFETCHA_I	prefetcha	[%r8, + 0x0258] %asi, #one_read
	.word 0xed3a0009  ! 2229: STDF_R	std	%f22, [%r9, %r8]
	.word 0xe91a0009  ! 2229: LDDF_R	ldd	[%r8, %r9], %f20
	.word 0xe01a2da8  ! 2229: LDD_I	ldd	[%r8 + 0x0da8], %r16
	.word 0xdd3a0009  ! 2232: STDF_R	std	%f14, [%r9, %r8]
	.word 0xca5a0009  ! 2232: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0x8a720009  ! 2232: UDIV_R	udiv 	%r8, %r9, %r5
	.word 0xcc220009  ! 2235: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc64a0009  ! 2235: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xf8c21009  ! 2235: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r28
	.word 0xee2a0009  ! 2238: STB_R	stb	%r23, [%r8 + %r9]
	.word 0xcc5a0009  ! 2238: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xc8020009  ! 2238: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xc4320009  ! 2241: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc2120009  ! 2241: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xc8ba1009  ! 2241: STDA_R	stda	%r4, [%r8 + %r9] 0x80
	.word 0xec2a0009  ! 2244: STB_R	stb	%r22, [%r8 + %r9]
	.word 0xc4120009  ! 2244: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xce520009  ! 2244: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xca320009  ! 2247: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc24a0009  ! 2247: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xc8aa1009  ! 2247: STBA_R	stba	%r4, [%r8 + %r9] 0x80
	.word 0xce220009  ! 2250: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xcc120009  ! 2250: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xc36a2c2c  ! 2250: PREFETCH_I	prefetch	[%r8 + 0x0c2c], #one_read
	.word 0xc2320009  ! 2253: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc5020009  ! 2253: LDF_R	ld	[%r8, %r9], %f2
	.word 0x8ada26b0  ! 2253: SMULcc_I	smulcc 	%r8, 0x06b0, %r5
	.word 0xc93a0009  ! 2256: STDF_R	std	%f4, [%r9, %r8]
	.word 0xca520009  ! 2256: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xcc921009  ! 2256: LDUHA_R	lduha	[%r8, %r9] 0x80, %r6
	.word 0xc53a0009  ! 2259: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc9020009  ! 2259: LDF_R	ld	[%r8, %r9], %f4
	.word 0xd8f21009  ! 2259: STXA_R	stxa	%r12, [%r8 + %r9] 0x80
	.word 0xca720009  ! 2262: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xca020009  ! 2262: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0x8e520009  ! 2262: UMUL_R	umul 	%r8, %r9, %r7
	.word 0xc6720009  ! 2265: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc4120009  ! 2265: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0x22800001  ! 2265: BE	be,a	<label_0x1>
	.word 0xc6220009  ! 2268: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xf31a0009  ! 2268: LDDF_R	ldd	[%r8, %r9], %f25
	.word 0xcaf21009  ! 2268: STXA_R	stxa	%r5, [%r8 + %r9] 0x80
	.word 0xcb3a0009  ! 2271: STDF_R	std	%f5, [%r9, %r8]
	.word 0xd9020009  ! 2271: LDF_R	ld	[%r8, %r9], %f12
	.word 0xcafa2ccc  ! 2271: SWAPA_I	swapa	%r5, [%r8 + 0x0ccc] %asi
	.word 0xcf3a0009  ! 2274: STDF_R	std	%f7, [%r9, %r8]
	.word 0xce120009  ! 2274: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xc36a0009  ! 2274: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xca2a0009  ! 2277: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc25a0009  ! 2277: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0x86522fd4  ! 2277: UMUL_I	umul 	%r8, 0x0fd4, %r3
	.word 0xfd220009  ! 2280: STF_R	st	%f30, [%r9, %r8]
	.word 0xca5a0009  ! 2280: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0x88522e08  ! 2280: UMUL_I	umul 	%r8, 0x0e08, %r4
	.word 0xc8720009  ! 2283: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xcc120009  ! 2283: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xc49a2748  ! 2283: LDDA_I	ldda	[%r8, + 0x0748] %asi, %r2
	.word 0xf8220009  ! 2286: STW_R	stw	%r28, [%r8 + %r9]
	.word 0xee4a0009  ! 2286: LDSB_R	ldsb	[%r8 + %r9], %r23
	.word 0x8143c000  ! 2286: STBAR	stbar
	.word 0xe13a0009  ! 2289: STDF_R	std	%f16, [%r9, %r8]
	.word 0xc25a0009  ! 2289: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xc3ea255c  ! 2289: PREFETCHA_I	prefetcha	[%r8, + 0x055c] %asi, #one_read
	.word 0xf2320009  ! 2292: STH_R	sth	%r25, [%r8 + %r9]
	.word 0xc80a0009  ! 2292: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xcd222abc  ! 2292: STF_I	st	%f6, [0x0abc, %r8]
	.word 0xce220009  ! 2295: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xce420009  ! 2295: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0x8da208a9  ! 2295: FSUBs	fsubs	%f8, %f9, %f6
	.word 0xf4720009  ! 2298: STX_R	stx	%r26, [%r8 + %r9]
	.word 0xe2420009  ! 2298: LDSW_R	ldsw	[%r8 + %r9], %r17
	.word 0xab220009  ! 2298: MULScc_R	mulscc 	%r8, %r9, %r21
	.word 0xf4220009  ! 2301: STW_R	stw	%r26, [%r8 + %r9]
	.word 0xc64a0009  ! 2301: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xec6a2ab4  ! 2301: LDSTUB_I	ldstub	%r22, [%r8 + 0x0ab4]
	.word 0xed3a0009  ! 2304: STDF_R	std	%f22, [%r9, %r8]
	.word 0xcc420009  ! 2304: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xc3ea1009  ! 2304: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xfa220009  ! 2307: STW_R	stw	%r29, [%r8 + %r9]
	.word 0xc6520009  ! 2307: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xff220009  ! 2307: STF_R	st	%f31, [%r9, %r8]
	.word 0xc9220009  ! 2310: STF_R	st	%f4, [%r9, %r8]
	.word 0xe2020009  ! 2310: LDUW_R	lduw	[%r8 + %r9], %r17
	.word 0x08800001  ! 2310: BLEU	bleu  	<label_0x1>
	.word 0xcc2a0009  ! 2313: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xee0a0009  ! 2313: LDUB_R	ldub	[%r8 + %r9], %r23
	.word 0xc6b21009  ! 2313: STHA_R	stha	%r3, [%r8 + %r9] 0x80
	.word 0xce2a0009  ! 2316: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc45a0009  ! 2316: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0x0a800001  ! 2316: BCS	bcs  	<label_0x1>
	.word 0xf53a0009  ! 2319: STDF_R	std	%f26, [%r9, %r8]
	.word 0xc80a0009  ! 2319: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0x20800001  ! 2319: BN	bn,a	<label_0x1>
	.word 0xcd220009  ! 2322: STF_R	st	%f6, [%r9, %r8]
	.word 0xc64a0009  ! 2322: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0x8da209a9  ! 2322: FDIVs	fdivs	%f8, %f9, %f6
	.word 0xea220009  ! 2325: STW_R	stw	%r21, [%r8 + %r9]
	.word 0xcc020009  ! 2325: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0x8143e051  ! 2325: MEMBAR	membar	#LoadLoad | #Lookaside | #Sync 
	.word 0xce2a0009  ! 2328: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xca020009  ! 2328: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xc5e22009  ! 2328: CASA_R	casa	[%r8] %asi, %r9, %r2
	.word 0xcc2a0009  ! 2331: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xda520009  ! 2331: LDSH_R	ldsh	[%r8 + %r9], %r13
	.word 0xc36a0009  ! 2331: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xce320009  ! 2334: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc6520009  ! 2334: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0x87a20829  ! 2334: FADDs	fadds	%f8, %f9, %f3
	.word 0xc33a0009  ! 2337: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc2520009  ! 2337: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0x8522227c  ! 2337: MULScc_I	mulscc 	%r8, 0x027c, %r2
	.word 0xc2220009  ! 2340: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc4120009  ! 2340: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xc36a21d8  ! 2340: PREFETCH_I	prefetch	[%r8 + 0x01d8], #one_read
	.word 0xc7220009  ! 2343: STF_R	st	%f3, [%r9, %r8]
	.word 0xc91a0009  ! 2343: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0x40000001  ! 2343: CALL	call	disp30_1
	.word 0xca320009  ! 2346: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xce420009  ! 2346: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xc28229dc  ! 2346: LDUWA_I	lduwa	[%r8, + 0x09dc] %asi, %r1
	.word 0xc2720009  ! 2349: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xca5a0009  ! 2349: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0x8143e00a  ! 2349: MEMBAR	membar	#StoreLoad | #StoreStore 
	.word 0xcc320009  ! 2352: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xf6520009  ! 2352: LDSH_R	ldsh	[%r8 + %r9], %r27
	.word 0xc5e22009  ! 2352: CASA_R	casa	[%r8] %asi, %r9, %r2
	.word 0xc82a0009  ! 2355: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc2520009  ! 2355: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0x8c7a0009  ! 2355: SDIV_R	sdiv 	%r8, %r9, %r6
	.word 0xf73a0009  ! 2358: STDF_R	std	%f27, [%r9, %r8]
	.word 0xd8020009  ! 2358: LDUW_R	lduw	[%r8 + %r9], %r12
	.word 0xc53a0009  ! 2358: STDF_R	std	%f2, [%r9, %r8]
	.word 0xe1220009  ! 2361: STF_R	st	%f16, [%r9, %r8]
	.word 0xcf1a0009  ! 2361: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xc8022d4c  ! 2361: LDUW_I	lduw	[%r8 + 0x0d4c], %r4
	.word 0xf4320009  ! 2364: STH_R	sth	%r26, [%r8 + %r9]
	.word 0xca5a0009  ! 2364: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xebf21009  ! 2364: CASXA_I	casxa	[%r8] 0x80, %r9, %r21
	.word 0xc62a0009  ! 2367: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc60a0009  ! 2367: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0x8ad20009  ! 2367: UMULcc_R	umulcc 	%r8, %r9, %r5
	.word 0xcc220009  ! 2370: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xfe0a0009  ! 2370: LDUB_R	ldub	[%r8 + %r9], %r31
	.word 0x8e7a2a98  ! 2370: SDIV_I	sdiv 	%r8, 0x0a98, %r7
	.word 0xc9220009  ! 2373: STF_R	st	%f4, [%r9, %r8]
	.word 0xc8420009  ! 2373: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0x8cda0009  ! 2373: SMULcc_R	smulcc 	%r8, %r9, %r6
	.word 0xf8720009  ! 2376: STX_R	stx	%r28, [%r8 + %r9]
	.word 0xdc5a0009  ! 2376: LDX_R	ldx	[%r8 + %r9], %r14
	.word 0x8143e007  ! 2376: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore 
	.word 0xc8220009  ! 2379: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc9020009  ! 2379: LDF_R	ld	[%r8, %r9], %f4
	.word 0x1e800002  ! 2379: BVC	bvc  	<label_0x2>
	.word 0xc2720009  ! 2382: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc40a0009  ! 2382: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xc4821009  ! 2382: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r2
	.word 0xca2a0009  ! 2385: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc7020009  ! 2385: LDF_R	ld	[%r8, %r9], %f3
	.word 0xc67a0009  ! 2385: SWAP_R	swap	%r3, [%r8 + %r9]
	.word 0xe8720009  ! 2388: STX_R	stx	%r20, [%r8 + %r9]
	.word 0xc84a0009  ! 2388: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0x8143e007  ! 2388: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore 
	.word 0xc6720009  ! 2391: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xe51a0009  ! 2391: LDDF_R	ldd	[%r8, %r9], %f18
	.word 0xc3ea1009  ! 2391: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xde220009  ! 2394: STW_R	stw	%r15, [%r8 + %r9]
	.word 0xc8420009  ! 2394: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0x38800002  ! 2394: BGU	bgu,a	<label_0x2>
	.word 0xcc220009  ! 2397: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc91a0009  ! 2397: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xc36a2fc8  ! 2397: PREFETCH_I	prefetch	[%r8 + 0x0fc8], #one_read
	.word 0xcc320009  ! 2400: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xe4520009  ! 2400: LDSH_R	ldsh	[%r8 + %r9], %r18
	.word 0xc3ea2ec8  ! 2400: PREFETCHA_I	prefetcha	[%r8, + 0x0ec8] %asi, #one_read
	.word 0xfe2a0009  ! 2403: STB_R	stb	%r31, [%r8 + %r9]
	.word 0xca4a0009  ! 2403: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xc3ea2348  ! 2403: PREFETCHA_I	prefetcha	[%r8, + 0x0348] %asi, #one_read
	.word 0xe6720009  ! 2406: STX_R	stx	%r19, [%r8 + %r9]
	.word 0xf6120009  ! 2406: LDUH_R	lduh	[%r8 + %r9], %r27
	.word 0xcf3a2900  ! 2406: STDF_I	std	%f7, [0x0900, %r8]
	.word 0xc6220009  ! 2409: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xce420009  ! 2409: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xc36a0009  ! 2409: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xfc720009  ! 2412: STX_R	stx	%r30, [%r8 + %r9]
	.word 0xe44a0009  ! 2412: LDSB_R	ldsb	[%r8 + %r9], %r18
	.word 0xcada25a0  ! 2412: LDXA_I	ldxa	[%r8, + 0x05a0] %asi, %r5
	.word 0xcd220009  ! 2415: STF_R	st	%f6, [%r9, %r8]
	.word 0xce420009  ! 2415: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xe0fa2298  ! 2415: SWAPA_I	swapa	%r16, [%r8 + 0x0298] %asi
	.word 0xc2320009  ! 2418: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xd9020009  ! 2418: LDF_R	ld	[%r8, %r9], %f12
	.word 0xdc9a2698  ! 2418: LDDA_I	ldda	[%r8, + 0x0698] %asi, %r14
	.word 0xf42a0009  ! 2421: STB_R	stb	%r26, [%r8 + %r9]
	.word 0xf4120009  ! 2421: LDUH_R	lduh	[%r8 + %r9], %r26
	.word 0x3e800001  ! 2421: BVC	bvc,a	<label_0x1>
	.word 0xd8220009  ! 2424: STW_R	stw	%r12, [%r8 + %r9]
	.word 0xc8520009  ! 2424: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xce8a1009  ! 2424: LDUBA_R	lduba	[%r8, %r9] 0x80, %r7
	.word 0xca2a0009  ! 2427: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc4520009  ! 2427: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0x2a800001  ! 2427: BCS	bcs,a	<label_0x1>
	.word 0xc4720009  ! 2430: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xf20a0009  ! 2430: LDUB_R	ldub	[%r8 + %r9], %r25
	.word 0xc3ea1009  ! 2430: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xda320009  ! 2433: STH_R	sth	%r13, [%r8 + %r9]
	.word 0xc64a0009  ! 2433: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0x8143e066  ! 2433: MEMBAR	membar	#StoreLoad | #LoadStore | #MemIssue | #Sync 
	.word 0xcf220009  ! 2436: STF_R	st	%f7, [%r9, %r8]
	.word 0xf6520009  ! 2436: LDSH_R	ldsh	[%r8 + %r9], %r27
	.word 0xf8aa2a9c  ! 2436: STBA_I	stba	%r28, [%r8 + 0x0a9c] %asi
	.word 0xec720009  ! 2439: STX_R	stx	%r22, [%r8 + %r9]
	.word 0xc31a0009  ! 2439: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xc3ea24ec  ! 2439: PREFETCHA_I	prefetcha	[%r8, + 0x04ec] %asi, #one_read
	.word 0xf6320009  ! 2442: STH_R	sth	%r27, [%r8 + %r9]
	.word 0xf31a0009  ! 2442: LDDF_R	ldd	[%r8, %r9], %f25
	.word 0x06ca0001  ! 2442: BRLZ	brlz  ,pt	%8,<label_0xa0001>
	.word 0xc8320009  ! 2445: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xce0a0009  ! 2445: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xc51a0009  ! 2445: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xca320009  ! 2448: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc40a0009  ! 2448: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xc2a22430  ! 2448: STWA_I	stwa	%r1, [%r8 + 0x0430] %asi
	.word 0xec220009  ! 2451: STW_R	stw	%r22, [%r8 + %r9]
	.word 0xcc020009  ! 2451: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0x86520009  ! 2451: UMUL_R	umul 	%r8, %r9, %r3
	.word 0xce2a0009  ! 2454: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc6120009  ! 2454: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xc73a0009  ! 2454: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc4720009  ! 2457: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc60a0009  ! 2457: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xfc9a2af8  ! 2457: LDDA_I	ldda	[%r8, + 0x0af8] %asi, %r30
	.word 0xd6320009  ! 2460: STH_R	sth	%r11, [%r8 + %r9]
	.word 0xc64a0009  ! 2460: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0x9ada25d0  ! 2460: SMULcc_I	smulcc 	%r8, 0x05d0, %r13
	.word 0xf02a0009  ! 2463: STB_R	stb	%r24, [%r8 + %r9]
	.word 0xfc0a0009  ! 2463: LDUB_R	ldub	[%r8 + %r9], %r30
	.word 0xc3220009  ! 2463: STF_R	st	%f1, [%r9, %r8]
	.word 0xf2320009  ! 2466: STH_R	sth	%r25, [%r8 + %r9]
	.word 0xca5a0009  ! 2466: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xcd220009  ! 2466: STF_R	st	%f6, [%r9, %r8]
	.word 0xda720009  ! 2469: STX_R	stx	%r13, [%r8 + %r9]
	.word 0xc2120009  ! 2469: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xf0122d78  ! 2469: LDUH_I	lduh	[%r8 + 0x0d78], %r24
	.word 0xca220009  ! 2472: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc5020009  ! 2472: LDF_R	ld	[%r8, %r9], %f2
	.word 0xea8a2320  ! 2472: LDUBA_I	lduba	[%r8, + 0x0320] %asi, %r21
	.word 0xc8720009  ! 2475: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xe00a0009  ! 2475: LDUB_R	ldub	[%r8 + %r9], %r16
	.word 0x16800001  ! 2475: BGE	bge  	<label_0x1>
	.word 0xca720009  ! 2478: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc4420009  ! 2478: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xc3ea1009  ! 2478: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xcb220009  ! 2481: STF_R	st	%f5, [%r9, %r8]
	.word 0xc2520009  ! 2481: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xdcb21009  ! 2481: STHA_R	stha	%r14, [%r8 + %r9] 0x80
	.word 0xc4220009  ! 2484: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xce520009  ! 2484: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0x82520009  ! 2484: UMUL_R	umul 	%r8, %r9, %r1
	.word 0xcc320009  ! 2487: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc2120009  ! 2487: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0x22c20001  ! 2487: BRZ	brz,a,nt	%8,<label_0x20001>
	.word 0xe2720009  ! 2490: STX_R	stx	%r17, [%r8 + %r9]
	.word 0xce020009  ! 2490: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0x24c20001  ! 2490: BRLEZ	brlez,a,nt	%8,<label_0x20001>
	.word 0xcc720009  ! 2493: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc60a0009  ! 2493: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xc36a0009  ! 2493: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc2220009  ! 2496: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xca5a0009  ! 2496: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xc50229dc  ! 2496: LDF_I	ld	[%r8, 0x09dc], %f2
	.word 0xfa720009  ! 2499: STX_R	stx	%r29, [%r8 + %r9]
	.word 0xc2020009  ! 2499: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xc36a2158  ! 2499: PREFETCH_I	prefetch	[%r8 + 0x0158], #one_read
	.word 0xc62a0009  ! 2502: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xf44a0009  ! 2502: LDSB_R	ldsb	[%r8 + %r9], %r26
	.word 0x0a800002  ! 2502: BCS	bcs  	<label_0x2>
	.word 0xc8220009  ! 2505: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xde0a0009  ! 2505: LDUB_R	ldub	[%r8 + %r9], %r15
	.word 0x8143e06d  ! 2505: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #MemIssue | #Sync 
	.word 0xca220009  ! 2508: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xfe0a0009  ! 2508: LDUB_R	ldub	[%r8 + %r9], %r31
	.word 0x8143c000  ! 2508: STBAR	stbar
	.word 0xcc320009  ! 2511: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xcc020009  ! 2511: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xc3e22009  ! 2511: CASA_R	casa	[%r8] %asi, %r9, %r1
	.word 0xf4320009  ! 2514: STH_R	sth	%r26, [%r8 + %r9]
	.word 0xf8420009  ! 2514: LDSW_R	ldsw	[%r8 + %r9], %r28
	.word 0xcc821009  ! 2514: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r6
	.word 0xe8320009  ! 2517: STH_R	sth	%r20, [%r8 + %r9]
	.word 0xc9020009  ! 2517: LDF_R	ld	[%r8, %r9], %f4
	.word 0xbeda2bd8  ! 2517: SMULcc_I	smulcc 	%r8, 0x0bd8, %r31
	.word 0xce320009  ! 2520: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc24a0009  ! 2520: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xc36a0009  ! 2520: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc82a0009  ! 2523: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xe2520009  ! 2523: LDSH_R	ldsh	[%r8 + %r9], %r17
	.word 0x0a800002  ! 2523: BCS	bcs  	<label_0x2>
	.word 0xd6220009  ! 2526: STW_R	stw	%r11, [%r8 + %r9]
	.word 0xe6120009  ! 2526: LDUH_R	lduh	[%r8 + %r9], %r19
	.word 0xcaaa1009  ! 2526: STBA_R	stba	%r5, [%r8 + %r9] 0x80
	.word 0xdd3a0009  ! 2529: STDF_R	std	%f14, [%r9, %r8]
	.word 0xca0a0009  ! 2529: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xf51a0009  ! 2529: LDDF_R	ldd	[%r8, %r9], %f26
	.word 0xcb220009  ! 2532: STF_R	st	%f5, [%r9, %r8]
	.word 0xfe420009  ! 2532: LDSW_R	ldsw	[%r8 + %r9], %r31
	.word 0xc4b22828  ! 2532: STHA_I	stha	%r2, [%r8 + 0x0828] %asi
	.word 0xc8720009  ! 2535: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xca020009  ! 2535: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xe53a0009  ! 2535: STDF_R	std	%f18, [%r9, %r8]
	.word 0xcc320009  ! 2538: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc80a0009  ! 2538: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0x825a2514  ! 2538: SMUL_I	smul 	%r8, 0x0514, %r1
	.word 0xdf3a0009  ! 2541: STDF_R	std	%f15, [%r9, %r8]
	.word 0xce420009  ! 2541: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xf64a0009  ! 2541: LDSB_R	ldsb	[%r8 + %r9], %r27
	.word 0xca320009  ! 2544: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xce4a0009  ! 2544: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0x38800002  ! 2544: BGU	bgu,a	<label_0x2>
	.word 0xc3220009  ! 2547: STF_R	st	%f1, [%r9, %r8]
	.word 0xce520009  ! 2547: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0x8143c000  ! 2547: STBAR	stbar
	.word 0xc22a0009  ! 2550: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xe00a0009  ! 2550: LDUB_R	ldub	[%r8 + %r9], %r16
	.word 0xce6a0009  ! 2550: LDSTUB_R	ldstub	%r7, [%r8 + %r9]
	.word 0xc2320009  ! 2553: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc85a0009  ! 2553: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xae520009  ! 2553: UMUL_R	umul 	%r8, %r9, %r23
	.word 0xc42a0009  ! 2556: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xfb1a0009  ! 2556: LDDF_R	ldd	[%r8, %r9], %f29
	.word 0xc86a0009  ! 2556: LDSTUB_R	ldstub	%r4, [%r8 + %r9]
	.word 0xc22a0009  ! 2559: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc51a0009  ! 2559: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xe66a0009  ! 2559: LDSTUB_R	ldstub	%r19, [%r8 + %r9]
	.word 0xe0320009  ! 2562: STH_R	sth	%r16, [%r8 + %r9]
	.word 0xd6120009  ! 2562: LDUH_R	lduh	[%r8 + %r9], %r11
	.word 0xe13a2dd8  ! 2562: STDF_I	std	%f16, [0x0dd8, %r8]
	.word 0xcb220009  ! 2565: STF_R	st	%f5, [%r9, %r8]
	.word 0xc60a0009  ! 2565: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xc3ea2e60  ! 2565: PREFETCHA_I	prefetcha	[%r8, + 0x0e60] %asi, #one_read
	.word 0xc4320009  ! 2568: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xce5a0009  ! 2568: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0x86720009  ! 2568: UDIV_R	udiv 	%r8, %r9, %r3
	.word 0xec220009  ! 2571: STW_R	stw	%r22, [%r8 + %r9]
	.word 0xc7020009  ! 2571: LDF_R	ld	[%r8, %r9], %f3
	.word 0xf26a2184  ! 2571: LDSTUB_I	ldstub	%r25, [%r8 + 0x0184]
	.word 0xf22a0009  ! 2574: STB_R	stb	%r25, [%r8 + %r9]
	.word 0xc65a0009  ! 2574: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xcaa22f00  ! 2574: STWA_I	stwa	%r5, [%r8 + 0x0f00] %asi
	.word 0xc8320009  ! 2577: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xfd1a0009  ! 2577: LDDF_R	ldd	[%r8, %r9], %f30
	.word 0xc8ea1009  ! 2577: LDSTUBA_R	ldstuba	%r4, [%r8 + %r9] 0x80
	.word 0xdf3a0009  ! 2580: STDF_R	std	%f15, [%r9, %r8]
	.word 0xe2120009  ! 2580: LDUH_R	lduh	[%r8 + %r9], %r17
	.word 0xc3ea1009  ! 2580: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc8720009  ! 2583: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xe2520009  ! 2583: LDSH_R	ldsh	[%r8 + %r9], %r17
	.word 0x8a7a0009  ! 2583: SDIV_R	sdiv 	%r8, %r9, %r5
	.word 0xf6220009  ! 2586: STW_R	stw	%r27, [%r8 + %r9]
	.word 0xca120009  ! 2586: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xc3ea1009  ! 2586: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc6720009  ! 2589: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc7020009  ! 2589: LDF_R	ld	[%r8, %r9], %f3
	.word 0x84fa0009  ! 2589: SDIVcc_R	sdivcc 	%r8, %r9, %r2
	.word 0xc22a0009  ! 2592: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xda420009  ! 2592: LDSW_R	ldsw	[%r8 + %r9], %r13
	.word 0x846a2b80  ! 2592: UDIVX_I	udivx 	%r8, 0x0b80, %r2
	.word 0xc5220009  ! 2595: STF_R	st	%f2, [%r9, %r8]
	.word 0xcc120009  ! 2595: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0x887a225c  ! 2595: SDIV_I	sdiv 	%r8, 0x025c, %r4
	.word 0xed3a0009  ! 2598: STDF_R	std	%f22, [%r9, %r8]
	.word 0xc65a0009  ! 2598: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xce7a212c  ! 2598: SWAP_I	swap	%r7, [%r8 + 0x012c]
	.word 0xc8720009  ! 2601: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xec020009  ! 2601: LDUW_R	lduw	[%r8 + %r9], %r22
	.word 0x845a2bb8  ! 2601: SMUL_I	smul 	%r8, 0x0bb8, %r2
	.word 0xce320009  ! 2604: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xe04a0009  ! 2604: LDSB_R	ldsb	[%r8 + %r9], %r16
	.word 0xc36a0009  ! 2604: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xff220009  ! 2607: STF_R	st	%f31, [%r9, %r8]
	.word 0xc3020009  ! 2607: LDF_R	ld	[%r8, %r9], %f1
	.word 0xc26a0009  ! 2607: LDSTUB_R	ldstub	%r1, [%r8 + %r9]
	.word 0xc9220009  ! 2610: STF_R	st	%f4, [%r9, %r8]
	.word 0xe85a0009  ! 2610: LDX_R	ldx	[%r8 + %r9], %r20
	.word 0x8143e03e  ! 2610: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0xc6220009  ! 2613: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xfe020009  ! 2613: LDUW_R	lduw	[%r8 + %r9], %r31
	.word 0xc73a2fe0  ! 2613: STDF_I	std	%f3, [0x0fe0, %r8]
	.word 0xce220009  ! 2616: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc8520009  ! 2616: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0x88522ab0  ! 2616: UMUL_I	umul 	%r8, 0x0ab0, %r4
	.word 0xca2a0009  ! 2619: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xeb1a0009  ! 2619: LDDF_R	ldd	[%r8, %r9], %f21
	.word 0xc20a0009  ! 2619: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xf4320009  ! 2622: STH_R	sth	%r26, [%r8 + %r9]
	.word 0xe60a0009  ! 2622: LDUB_R	ldub	[%r8 + %r9], %r19
	.word 0x8143c000  ! 2622: STBAR	stbar
	.word 0xf7220009  ! 2625: STF_R	st	%f27, [%r9, %r8]
	.word 0xce420009  ! 2625: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xeb3a25f0  ! 2625: STDF_I	std	%f21, [0x05f0, %r8]
	.word 0xea2a0009  ! 2628: STB_R	stb	%r21, [%r8 + %r9]
	.word 0xc8520009  ! 2628: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xc3ea1009  ! 2628: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xfa720009  ! 2631: STX_R	stx	%r29, [%r8 + %r9]
	.word 0xc6120009  ! 2631: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xc5220009  ! 2631: STF_R	st	%f2, [%r9, %r8]
	.word 0xc4320009  ! 2634: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xce420009  ! 2634: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xea921009  ! 2634: LDUHA_R	lduha	[%r8, %r9] 0x80, %r21
	.word 0xcb220009  ! 2637: STF_R	st	%f5, [%r9, %r8]
	.word 0xce0a0009  ! 2637: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xc87a223c  ! 2637: SWAP_I	swap	%r4, [%r8 + 0x023c]
	.word 0xc82a0009  ! 2640: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xec5a0009  ! 2640: LDX_R	ldx	[%r8 + %r9], %r22
	.word 0x8143c000  ! 2640: STBAR	stbar
	.word 0xc42a0009  ! 2643: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xea120009  ! 2643: LDUH_R	lduh	[%r8 + %r9], %r21
	.word 0x82720009  ! 2643: UDIV_R	udiv 	%r8, %r9, %r1
	.word 0xca720009  ! 2646: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xce520009  ! 2646: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0x892224bc  ! 2646: MULScc_I	mulscc 	%r8, 0x04bc, %r4
	.word 0xcc720009  ! 2649: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xce0a0009  ! 2649: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xa6f224fc  ! 2649: UDIVcc_I	udivcc 	%r8, 0x04fc, %r19
	.word 0xc73a0009  ! 2652: STDF_R	std	%f3, [%r9, %r8]
	.word 0xca020009  ! 2652: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0x82fa2a24  ! 2652: SDIVcc_I	sdivcc 	%r8, 0x0a24, %r1
	.word 0xdf3a0009  ! 2655: STDF_R	std	%f15, [%r9, %r8]
	.word 0xfe5a0009  ! 2655: LDX_R	ldx	[%r8 + %r9], %r31
	.word 0x2c800001  ! 2655: BNEG	bneg,a	<label_0x1>
	.word 0xe9220009  ! 2658: STF_R	st	%f20, [%r9, %r8]
	.word 0xfc5a0009  ! 2658: LDX_R	ldx	[%r8 + %r9], %r30
	.word 0xcca22db8  ! 2658: STWA_I	stwa	%r6, [%r8 + 0x0db8] %asi
	.word 0xc5220009  ! 2661: STF_R	st	%f2, [%r9, %r8]
	.word 0xce5a0009  ! 2661: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xc6821009  ! 2661: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r3
	.word 0xc5220009  ! 2664: STF_R	st	%f2, [%r9, %r8]
	.word 0xe64a0009  ! 2664: LDSB_R	ldsb	[%r8 + %r9], %r19
	.word 0xc9f21009  ! 2664: CASXA_I	casxa	[%r8] 0x80, %r9, %r4
	.word 0xc82a0009  ! 2667: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc8120009  ! 2667: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xc4ea203c  ! 2667: LDSTUBA_I	ldstuba	%r2, [%r8 + 0x003c] %asi
	.word 0xc33a0009  ! 2670: STDF_R	std	%f1, [%r9, %r8]
	.word 0xca5a0009  ! 2670: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0x8a7a0009  ! 2670: SDIV_R	sdiv 	%r8, %r9, %r5
	.word 0xf8720009  ! 2673: STX_R	stx	%r28, [%r8 + %r9]
	.word 0xc8120009  ! 2673: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xc46a0009  ! 2673: LDSTUB_R	ldstub	%r2, [%r8 + %r9]
	.word 0xe1220009  ! 2676: STF_R	st	%f16, [%r9, %r8]
	.word 0xe6420009  ! 2676: LDSW_R	ldsw	[%r8 + %r9], %r19
	.word 0xc36a0009  ! 2676: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xf8320009  ! 2679: STH_R	sth	%r28, [%r8 + %r9]
	.word 0xc2120009  ! 2679: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0x3e800001  ! 2679: BVC	bvc,a	<label_0x1>
	.word 0xc6220009  ! 2682: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xe05a0009  ! 2682: LDX_R	ldx	[%r8 + %r9], %r16
	.word 0x886a2c84  ! 2682: UDIVX_I	udivx 	%r8, 0x0c84, %r4
	.word 0xfb220009  ! 2685: STF_R	st	%f29, [%r9, %r8]
	.word 0xcf020009  ! 2685: LDF_R	ld	[%r8, %r9], %f7
	.word 0xfa6a0009  ! 2685: LDSTUB_R	ldstub	%r29, [%r8 + %r9]
	.word 0xc8220009  ! 2688: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xf0020009  ! 2688: LDUW_R	lduw	[%r8 + %r9], %r24
	.word 0xb1a209a9  ! 2688: FDIVs	fdivs	%f8, %f9, %f24
	.word 0xea220009  ! 2691: STW_R	stw	%r21, [%r8 + %r9]
	.word 0xcc520009  ! 2691: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0x8afa0009  ! 2691: SDIVcc_R	sdivcc 	%r8, %r9, %r5
	.word 0xe6720009  ! 2694: STX_R	stx	%r19, [%r8 + %r9]
	.word 0xc2120009  ! 2694: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0x22800001  ! 2694: BE	be,a	<label_0x1>
	.word 0xc2720009  ! 2697: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc8120009  ! 2697: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0x85222054  ! 2697: MULScc_I	mulscc 	%r8, 0x0054, %r2
	.word 0xe42a0009  ! 2700: STB_R	stb	%r18, [%r8 + %r9]
	.word 0xcd020009  ! 2700: LDF_R	ld	[%r8, %r9], %f6
	.word 0xcde22009  ! 2700: CASA_R	casa	[%r8] %asi, %r9, %r6
	.word 0xc6220009  ! 2703: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xcc120009  ! 2703: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xe86a0009  ! 2703: LDSTUB_R	ldstub	%r20, [%r8 + %r9]
	.word 0xcb220009  ! 2706: STF_R	st	%f5, [%r9, %r8]
	.word 0xce0a0009  ! 2706: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xc8b22374  ! 2706: STHA_I	stha	%r4, [%r8 + 0x0374] %asi
	.word 0xcf3a0009  ! 2709: STDF_R	std	%f7, [%r9, %r8]
	.word 0xfc420009  ! 2709: LDSW_R	ldsw	[%r8 + %r9], %r30
	.word 0xc36a27a0  ! 2709: PREFETCH_I	prefetch	[%r8 + 0x07a0], #one_read
	.word 0xcc720009  ! 2712: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xcb020009  ! 2712: LDF_R	ld	[%r8, %r9], %f5
	.word 0xc3ea1009  ! 2712: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xce220009  ! 2715: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xcb020009  ! 2715: LDF_R	ld	[%r8, %r9], %f5
	.word 0xc36a203c  ! 2715: PREFETCH_I	prefetch	[%r8 + 0x003c], #one_read
	.word 0xd82a0009  ! 2718: STB_R	stb	%r12, [%r8 + %r9]
	.word 0xe7020009  ! 2718: LDF_R	ld	[%r8, %r9], %f19
	.word 0xc36a2acc  ! 2718: PREFETCH_I	prefetch	[%r8 + 0x0acc], #one_read
	.word 0xc2220009  ! 2721: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc40a0009  ! 2721: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xaa4a2d48  ! 2721: MULX_I	mulx 	%r8, 0x0d48, %r21
	.word 0xc82a0009  ! 2724: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc6020009  ! 2724: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xc242286c  ! 2724: LDSW_I	ldsw	[%r8 + 0x086c], %r1
	.word 0xc9220009  ! 2727: STF_R	st	%f4, [%r9, %r8]
	.word 0xca520009  ! 2727: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xe5f22009  ! 2727: CASXA_R	casxa	[%r8]%asi, %r9, %r18
	.word 0xdc720009  ! 2730: STX_R	stx	%r14, [%r8 + %r9]
	.word 0xfa5a0009  ! 2730: LDX_R	ldx	[%r8 + %r9], %r29
	.word 0xc3ea1009  ! 2730: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xcc320009  ! 2733: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xca020009  ! 2733: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0x84da2660  ! 2733: SMULcc_I	smulcc 	%r8, 0x0660, %r2
	.word 0xce720009  ! 2736: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc6120009  ! 2736: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0x8e4a0009  ! 2736: MULX_R	mulx 	%r8, %r9, %r7
	.word 0xcb220009  ! 2739: STF_R	st	%f5, [%r9, %r8]
	.word 0xd6020009  ! 2739: LDUW_R	lduw	[%r8 + %r9], %r11
	.word 0x8143e02b  ! 2739: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #MemIssue 
	.word 0xf53a0009  ! 2742: STDF_R	std	%f26, [%r9, %r8]
	.word 0xce020009  ! 2742: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xc6a21009  ! 2742: STWA_R	stwa	%r3, [%r8 + %r9] 0x80
	.word 0xc82a0009  ! 2745: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc51a0009  ! 2745: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0x8fa20929  ! 2745: FMULs	fmuls	%f8, %f9, %f7
	.word 0xc22a0009  ! 2748: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xca020009  ! 2748: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xc3ea295c  ! 2748: PREFETCHA_I	prefetcha	[%r8, + 0x095c] %asi, #one_read
	.word 0xff220009  ! 2751: STF_R	st	%f31, [%r9, %r8]
	.word 0xf05a0009  ! 2751: LDX_R	ldx	[%r8 + %r9], %r24
	.word 0x06c20001  ! 2751: BRLZ	brlz  ,nt	%8,<label_0x20001>
	.word 0xe5220009  ! 2754: STF_R	st	%f18, [%r9, %r8]
	.word 0xcf1a0009  ! 2754: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xdca22284  ! 2754: STWA_I	stwa	%r14, [%r8 + 0x0284] %asi
	.word 0xcb3a0009  ! 2757: STDF_R	std	%f5, [%r9, %r8]
	.word 0xe85a0009  ! 2757: LDX_R	ldx	[%r8 + %r9], %r20
	.word 0xc28a1009  ! 2757: LDUBA_R	lduba	[%r8, %r9] 0x80, %r1
	.word 0xeb3a0009  ! 2760: STDF_R	std	%f21, [%r9, %r8]
	.word 0xe11a0009  ! 2760: LDDF_R	ldd	[%r8, %r9], %f16
	.word 0xdeb2282c  ! 2760: STHA_I	stha	%r15, [%r8 + 0x082c] %asi
	.word 0xc82a0009  ! 2763: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xcf1a0009  ! 2763: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0x852227d0  ! 2763: MULScc_I	mulscc 	%r8, 0x07d0, %r2
	.word 0xc8220009  ! 2766: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc2120009  ! 2766: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xceaa1009  ! 2766: STBA_R	stba	%r7, [%r8 + %r9] 0x80
	.word 0xc3220009  ! 2769: STF_R	st	%f1, [%r9, %r8]
	.word 0xc24a0009  ! 2769: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xc2da1009  ! 2769: LDXA_R	ldxa	[%r8, %r9] 0x80, %r1
	.word 0xff3a0009  ! 2772: STDF_R	std	%f31, [%r9, %r8]
	.word 0xf2020009  ! 2772: LDUW_R	lduw	[%r8 + %r9], %r25
	.word 0xc3ea1009  ! 2772: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xcc720009  ! 2775: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc84a0009  ! 2775: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xde8a1009  ! 2775: LDUBA_R	lduba	[%r8, %r9] 0x80, %r15
	.word 0xc22a0009  ! 2778: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xcc520009  ! 2778: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0x9a7a0009  ! 2778: SDIV_R	sdiv 	%r8, %r9, %r13
	.word 0xca220009  ! 2781: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xee420009  ! 2781: LDSW_R	ldsw	[%r8 + %r9], %r23
	.word 0x8efa2354  ! 2781: SDIVcc_I	sdivcc 	%r8, 0x0354, %r7
	.word 0xc6320009  ! 2784: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc85a0009  ! 2784: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0x8a7a0009  ! 2784: SDIV_R	sdiv 	%r8, %r9, %r5
	.word 0xe1220009  ! 2787: STF_R	st	%f16, [%r9, %r8]
	.word 0xcc520009  ! 2787: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xc4d21009  ! 2787: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r2
	.word 0xcc220009  ! 2790: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xf3020009  ! 2790: LDF_R	ld	[%r8, %r9], %f25
	.word 0x40000001  ! 2790: CALL	call	disp30_1
	.word 0xcc2a0009  ! 2793: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xce5a0009  ! 2793: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0x864a0009  ! 2793: MULX_R	mulx 	%r8, %r9, %r3
	.word 0xe6720009  ! 2796: STX_R	stx	%r19, [%r8 + %r9]
	.word 0xfe120009  ! 2796: LDUH_R	lduh	[%r8 + %r9], %r31
	.word 0x8143e053  ! 2796: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside | #Sync 
	.word 0xea320009  ! 2799: STH_R	sth	%r21, [%r8 + %r9]
	.word 0xca420009  ! 2799: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xce922e2c  ! 2799: LDUHA_I	lduha	[%r8, + 0x0e2c] %asi, %r7
	.word 0xc6320009  ! 2802: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xfc0a0009  ! 2802: LDUB_R	ldub	[%r8 + %r9], %r30
	.word 0xc2ea1009  ! 2802: LDSTUBA_R	ldstuba	%r1, [%r8 + %r9] 0x80
	.word 0xec220009  ! 2805: STW_R	stw	%r22, [%r8 + %r9]
	.word 0xca0a0009  ! 2805: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xc4aa2dcc  ! 2805: STBA_I	stba	%r2, [%r8 + 0x0dcc] %asi
	.word 0xc2220009  ! 2808: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xf4120009  ! 2808: LDUH_R	lduh	[%r8 + %r9], %r26
	.word 0x8143c000  ! 2808: STBAR	stbar
	.word 0xc8320009  ! 2811: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc44a0009  ! 2811: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0x8143e069  ! 2811: MEMBAR	membar	#LoadLoad | #StoreStore | #MemIssue | #Sync 
	.word 0xc93a0009  ! 2814: STDF_R	std	%f4, [%r9, %r8]
	.word 0xcc4a0009  ! 2814: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xfc821009  ! 2814: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r30
	.word 0xcd220009  ! 2817: STF_R	st	%f6, [%r9, %r8]
	.word 0xd91a0009  ! 2817: LDDF_R	ldd	[%r8, %r9], %f12
	.word 0xccc22fe0  ! 2817: LDSWA_I	ldswa	[%r8, + 0x0fe0] %asi, %r6
	.word 0xca2a0009  ! 2820: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc80a0009  ! 2820: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xca420009  ! 2820: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xc22a0009  ! 2823: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xca0a0009  ! 2823: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0x88da0009  ! 2823: SMULcc_R	smulcc 	%r8, %r9, %r4
	.word 0xc4320009  ! 2826: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc6020009  ! 2826: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xca7a294c  ! 2826: SWAP_I	swap	%r5, [%r8 + 0x094c]
	.word 0xcb3a0009  ! 2829: STDF_R	std	%f5, [%r9, %r8]
	.word 0xce420009  ! 2829: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xca6a0009  ! 2829: LDSTUB_R	ldstub	%r5, [%r8 + %r9]
	.word 0xc4320009  ! 2832: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xda020009  ! 2832: LDUW_R	lduw	[%r8 + %r9], %r13
	.word 0x0aca0001  ! 2832: BRNZ	brnz  ,pt	%8,<label_0xa0001>
	.word 0xcd3a0009  ! 2835: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc8520009  ! 2835: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0x1c800001  ! 2835: BPOS	bpos  	<label_0x1>
	.word 0xe02a0009  ! 2838: STB_R	stb	%r16, [%r8 + %r9]
	.word 0xc2020009  ! 2838: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xd73a2b78  ! 2838: STDF_I	std	%f11, [0x0b78, %r8]
	.word 0xdc720009  ! 2841: STX_R	stx	%r14, [%r8 + %r9]
	.word 0xdd1a0009  ! 2841: LDDF_R	ldd	[%r8, %r9], %f14
	.word 0xccba1009  ! 2841: STDA_R	stda	%r6, [%r8 + %r9] 0x80
	.word 0xc6220009  ! 2844: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc91a0009  ! 2844: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0x8a4a29f0  ! 2844: MULX_I	mulx 	%r8, 0x09f0, %r5
	.word 0xc6320009  ! 2847: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xce120009  ! 2847: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0x8c5a2a90  ! 2847: SMUL_I	smul 	%r8, 0x0a90, %r6
	.word 0xc5220009  ! 2850: STF_R	st	%f2, [%r9, %r8]
	.word 0xf1020009  ! 2850: LDF_R	ld	[%r8, %r9], %f24
	.word 0xc4ba2d68  ! 2850: STDA_I	stda	%r2, [%r8 + 0x0d68] %asi
	.word 0xc3220009  ! 2853: STF_R	st	%f1, [%r9, %r8]
	.word 0xcb1a0009  ! 2853: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0x8143c000  ! 2853: STBAR	stbar
	.word 0xf62a0009  ! 2856: STB_R	stb	%r27, [%r8 + %r9]
	.word 0xce4a0009  ! 2856: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xc36a229c  ! 2856: PREFETCH_I	prefetch	[%r8 + 0x029c], #one_read
	.word 0xca220009  ! 2859: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xce5a0009  ! 2859: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0x884a0009  ! 2859: MULX_R	mulx 	%r8, %r9, %r4
	.word 0xc8720009  ! 2862: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc60a0009  ! 2862: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xc3ea296c  ! 2862: PREFETCHA_I	prefetcha	[%r8, + 0x096c] %asi, #one_read
	.word 0xca720009  ! 2865: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xd80a0009  ! 2865: LDUB_R	ldub	[%r8 + %r9], %r12
	.word 0xe84a0009  ! 2865: LDSB_R	ldsb	[%r8 + %r9], %r20
	.word 0xc4220009  ! 2868: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xf2520009  ! 2868: LDSH_R	ldsh	[%r8 + %r9], %r25
	.word 0xc3ea1009  ! 2868: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc3220009  ! 2871: STF_R	st	%f1, [%r9, %r8]
	.word 0xc91a0009  ! 2871: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0x8143e024  ! 2871: MEMBAR	membar	#LoadStore | #MemIssue 
	.word 0xce320009  ! 2874: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc71a0009  ! 2874: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0x2a800002  ! 2874: BCS	bcs,a	<label_0x2>
	.word 0xe6320009  ! 2877: STH_R	sth	%r19, [%r8 + %r9]
	.word 0xc8020009  ! 2877: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xc3ea20dc  ! 2877: PREFETCHA_I	prefetcha	[%r8, + 0x00dc] %asi, #one_read
	.word 0xc4320009  ! 2880: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xca4a0009  ! 2880: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0x32800002  ! 2880: BNE	bne,a	<label_0x2>
	.word 0xc7220009  ! 2883: STF_R	st	%f3, [%r9, %r8]
	.word 0xca120009  ! 2883: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xf2d21009  ! 2883: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r25
	.word 0xf53a0009  ! 2886: STDF_R	std	%f26, [%r9, %r8]
	.word 0xcf1a0009  ! 2886: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xa0d20009  ! 2886: UMULcc_R	umulcc 	%r8, %r9, %r16
	.word 0xc33a0009  ! 2889: STDF_R	std	%f1, [%r9, %r8]
	.word 0xcc520009  ! 2889: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xc36a2c34  ! 2889: PREFETCH_I	prefetch	[%r8 + 0x0c34], #one_read
	.word 0xe5220009  ! 2892: STF_R	st	%f18, [%r9, %r8]
	.word 0xde020009  ! 2892: LDUW_R	lduw	[%r8 + %r9], %r15
	.word 0xb7a20829  ! 2892: FADDs	fadds	%f8, %f9, %f27
	.word 0xfd3a0009  ! 2895: STDF_R	std	%f30, [%r9, %r8]
	.word 0xcf1a0009  ! 2895: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xc3ea1009  ! 2895: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc3220009  ! 2898: STF_R	st	%f1, [%r9, %r8]
	.word 0xcc020009  ! 2898: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0x8143c000  ! 2898: STBAR	stbar
	.word 0xc62a0009  ! 2901: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xd8120009  ! 2901: LDUH_R	lduh	[%r8 + %r9], %r12
	.word 0x856a2508  ! 2901: SDIVX_I	sdivx	%r8, 0x0508, %r2
	.word 0xc5220009  ! 2904: STF_R	st	%f2, [%r9, %r8]
	.word 0xc8120009  ! 2904: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0x84fa0009  ! 2904: SDIVcc_R	sdivcc 	%r8, %r9, %r2
	.word 0xca720009  ! 2907: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc60a0009  ! 2907: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xc73a20b0  ! 2907: STDF_I	std	%f3, [0x00b0, %r8]
	.word 0xc9220009  ! 2910: STF_R	st	%f4, [%r9, %r8]
	.word 0xe8020009  ! 2910: LDUW_R	lduw	[%r8 + %r9], %r20
	.word 0xc3222088  ! 2910: STF_I	st	%f1, [0x0088, %r8]
	.word 0xf8720009  ! 2913: STX_R	stx	%r28, [%r8 + %r9]
	.word 0xce020009  ! 2913: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0x8e4a0009  ! 2913: MULX_R	mulx 	%r8, %r9, %r7
	.word 0xd6220009  ! 2916: STW_R	stw	%r11, [%r8 + %r9]
	.word 0xc51a0009  ! 2916: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xc6a223ec  ! 2916: STWA_I	stwa	%r3, [%r8 + 0x03ec] %asi
	.word 0xc4320009  ! 2919: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xf9020009  ! 2919: LDF_R	ld	[%r8, %r9], %f28
	.word 0x34800001  ! 2919: BG	bg,a	<label_0x1>
	.word 0xda320009  ! 2922: STH_R	sth	%r13, [%r8 + %r9]
	.word 0xc8120009  ! 2922: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xcb3a0009  ! 2922: STDF_R	std	%f5, [%r9, %r8]
	.word 0xdf3a0009  ! 2925: STDF_R	std	%f15, [%r9, %r8]
	.word 0xc8120009  ! 2925: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xdeaa244c  ! 2925: STBA_I	stba	%r15, [%r8 + 0x044c] %asi
	.word 0xdb3a0009  ! 2928: STDF_R	std	%f13, [%r9, %r8]
	.word 0xc7020009  ! 2928: LDF_R	ld	[%r8, %r9], %f3
	.word 0xceaa1009  ! 2928: STBA_R	stba	%r7, [%r8 + %r9] 0x80
	.word 0xc6720009  ! 2931: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc6520009  ! 2931: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0x9ada0009  ! 2931: SMULcc_R	smulcc 	%r8, %r9, %r13
	.word 0xc7220009  ! 2934: STF_R	st	%f3, [%r9, %r8]
	.word 0xda0a0009  ! 2934: LDUB_R	ldub	[%r8 + %r9], %r13
	.word 0xc2fa1009  ! 2934: SWAPA_R	swapa	%r1, [%r8 + %r9] 0x80
	.word 0xfa320009  ! 2937: STH_R	sth	%r29, [%r8 + %r9]
	.word 0xdd020009  ! 2937: LDF_R	ld	[%r8, %r9], %f14
	.word 0xba7a0009  ! 2937: SDIV_R	sdiv 	%r8, %r9, %r29
	.word 0xcc320009  ! 2940: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xcb1a0009  ! 2940: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xaa520009  ! 2940: UMUL_R	umul 	%r8, %r9, %r21
	.word 0xc6220009  ! 2943: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc4520009  ! 2943: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0x38800002  ! 2943: BGU	bgu,a	<label_0x2>
	.word 0xd7220009  ! 2946: STF_R	st	%f11, [%r9, %r8]
	.word 0xf04a0009  ! 2946: LDSB_R	ldsb	[%r8 + %r9], %r24
	.word 0x8143e069  ! 2946: MEMBAR	membar	#LoadLoad | #StoreStore | #MemIssue | #Sync 
	.word 0xc6720009  ! 2949: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xea4a0009  ! 2949: LDSB_R	ldsb	[%r8 + %r9], %r21
	.word 0x8143c000  ! 2949: STBAR	stbar
	.word 0xca320009  ! 2952: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xdb1a0009  ! 2952: LDDF_R	ldd	[%r8, %r9], %f13
	.word 0xdada24a0  ! 2952: LDXA_I	ldxa	[%r8, + 0x04a0] %asi, %r13
	.word 0xea220009  ! 2955: STW_R	stw	%r21, [%r8 + %r9]
	.word 0xc6420009  ! 2955: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xc36a23b0  ! 2955: PREFETCH_I	prefetch	[%r8 + 0x03b0], #one_read
	.word 0xe0220009  ! 2958: STW_R	stw	%r16, [%r8 + %r9]
	.word 0xf45a0009  ! 2958: LDX_R	ldx	[%r8 + %r9], %r26
	.word 0x8fa209a9  ! 2958: FDIVs	fdivs	%f8, %f9, %f7
	.word 0xc53a0009  ! 2961: STDF_R	std	%f2, [%r9, %r8]
	.word 0xce0a0009  ! 2961: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0x8c52280c  ! 2961: UMUL_I	umul 	%r8, 0x080c, %r6
	.word 0xc82a0009  ! 2964: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xce5a0009  ! 2964: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xc28a2878  ! 2964: LDUBA_I	lduba	[%r8, + 0x0878] %asi, %r1
	.word 0xf6720009  ! 2967: STX_R	stx	%r27, [%r8 + %r9]
	.word 0xc65a0009  ! 2967: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xc64a2908  ! 2967: LDSB_I	ldsb	[%r8 + 0x0908], %r3
	.word 0xc33a0009  ! 2970: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc85a0009  ! 2970: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xcea22da8  ! 2970: STWA_I	stwa	%r7, [%r8 + 0x0da8] %asi
	.word 0xc53a0009  ! 2973: STDF_R	std	%f2, [%r9, %r8]
	.word 0xee520009  ! 2973: LDSH_R	ldsh	[%r8 + %r9], %r23
	.word 0xccaa25c0  ! 2973: STBA_I	stba	%r6, [%r8 + 0x05c0] %asi
	.word 0xc4720009  ! 2976: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc4420009  ! 2976: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xc36a0009  ! 2976: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xcc320009  ! 2979: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xf0520009  ! 2979: LDSH_R	ldsh	[%r8 + %r9], %r24
	.word 0x8cf20009  ! 2979: UDIVcc_R	udivcc 	%r8, %r9, %r6
	.word 0xce220009  ! 2982: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xcc5a0009  ! 2982: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xa9a20929  ! 2982: FMULs	fmuls	%f8, %f9, %f20
	.word 0xe13a0009  ! 2985: STDF_R	std	%f16, [%r9, %r8]
	.word 0xc4520009  ! 2985: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0x8143c000  ! 2985: STBAR	stbar
	.word 0xe53a0009  ! 2988: STDF_R	std	%f18, [%r9, %r8]
	.word 0xcf020009  ! 2988: LDF_R	ld	[%r8, %r9], %f7
	.word 0xc2ca2700  ! 2988: LDSBA_I	ldsba	[%r8, + 0x0700] %asi, %r1
	.word 0xf2220009  ! 2991: STW_R	stw	%r25, [%r8 + %r9]
	.word 0xc60a0009  ! 2991: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xfa821009  ! 2991: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r29
	.word 0xf1220009  ! 2994: STF_R	st	%f24, [%r9, %r8]
	.word 0xe0520009  ! 2994: LDSH_R	ldsh	[%r8 + %r9], %r16
	.word 0xaada2b4c  ! 2994: SMULcc_I	smulcc 	%r8, 0x0b4c, %r21
	.word 0xc5220009  ! 2997: STF_R	st	%f2, [%r9, %r8]
	.word 0xc5020009  ! 2997: LDF_R	ld	[%r8, %r9], %f2
	.word 0x82d20009  ! 2997: UMULcc_R	umulcc 	%r8, %r9, %r1
	.word 0xc7220009  ! 3000: STF_R	st	%f3, [%r9, %r8]
	.word 0xc44a0009  ! 3000: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xa0fa0009  ! 3000: SDIVcc_R	sdivcc 	%r8, %r9, %r16
	.word 0xcb220009  ! 3003: STF_R	st	%f5, [%r9, %r8]
	.word 0xcc4a0009  ! 3003: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0x8c722f1c  ! 3003: UDIV_I	udiv 	%r8, 0x0f1c, %r6
	.word 0xe2320009  ! 3006: STH_R	sth	%r17, [%r8 + %r9]
	.word 0xce120009  ! 3006: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0x8143c000  ! 3006: STBAR	stbar
	.word 0xc42a0009  ! 3009: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xfc4a0009  ! 3009: LDSB_R	ldsb	[%r8 + %r9], %r30
	.word 0x8143e03d  ! 3009: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0xce2a0009  ! 3012: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc6420009  ! 3012: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xc36a2d6c  ! 3012: PREFETCH_I	prefetch	[%r8 + 0x0d6c], #one_read
	.word 0xca220009  ! 3015: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xe9020009  ! 3015: LDF_R	ld	[%r8, %r9], %f20
	.word 0x0e800001  ! 3015: BVS	bvs  	<label_0x1>
	.word 0xce320009  ! 3018: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xf8520009  ! 3018: LDSH_R	ldsh	[%r8 + %r9], %r28
	.word 0xc3ea1009  ! 3018: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc8220009  ! 3021: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xcc420009  ! 3021: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xc7220009  ! 3021: STF_R	st	%f3, [%r9, %r8]
	.word 0xc4320009  ! 3024: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc85a0009  ! 3024: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xce0a0009  ! 3024: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xca220009  ! 3027: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xce4a0009  ! 3027: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xe20a2608  ! 3027: LDUB_I	ldub	[%r8 + 0x0608], %r17
	.word 0xc8720009  ! 3030: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xcb1a0009  ! 3030: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0x8143c000  ! 3030: STBAR	stbar
	.word 0xf6220009  ! 3033: STW_R	stw	%r27, [%r8 + %r9]
	.word 0xee520009  ! 3033: LDSH_R	ldsh	[%r8 + %r9], %r23
	.word 0x8c5a2cc0  ! 3033: SMUL_I	smul 	%r8, 0x0cc0, %r6
	.word 0xe62a0009  ! 3036: STB_R	stb	%r19, [%r8 + %r9]
	.word 0xe71a0009  ! 3036: LDDF_R	ldd	[%r8, %r9], %f19
	.word 0xc8ba2660  ! 3036: STDA_I	stda	%r4, [%r8 + 0x0660] %asi
	.word 0xcf220009  ! 3039: STF_R	st	%f7, [%r9, %r8]
	.word 0xc9020009  ! 3039: LDF_R	ld	[%r8, %r9], %f4
	.word 0xc7f22009  ! 3039: CASXA_R	casxa	[%r8]%asi, %r9, %r3
	.word 0xc4220009  ! 3042: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xca520009  ! 3042: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xccb225a4  ! 3042: STHA_I	stha	%r6, [%r8 + 0x05a4] %asi
	.word 0xcc220009  ! 3045: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc5020009  ! 3045: LDF_R	ld	[%r8, %r9], %f2
	.word 0xc31a25e8  ! 3045: LDDF_I	ldd	[%r8, 0x05e8], %f1
	.word 0xc2320009  ! 3048: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xe2520009  ! 3048: LDSH_R	ldsh	[%r8 + %r9], %r17
	.word 0xccda1009  ! 3048: LDXA_R	ldxa	[%r8, %r9] 0x80, %r6
	.word 0xf0320009  ! 3051: STH_R	sth	%r24, [%r8 + %r9]
	.word 0xde120009  ! 3051: LDUH_R	lduh	[%r8 + %r9], %r15
	.word 0xbcd20009  ! 3051: UMULcc_R	umulcc 	%r8, %r9, %r30
	.word 0xfa2a0009  ! 3054: STB_R	stb	%r29, [%r8 + %r9]
	.word 0xc31a0009  ! 3054: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xc53a27d8  ! 3054: STDF_I	std	%f2, [0x07d8, %r8]
	.word 0xe4720009  ! 3057: STX_R	stx	%r18, [%r8 + %r9]
	.word 0xc6020009  ! 3057: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0x16800001  ! 3057: BGE	bge  	<label_0x1>
	.word 0xc4720009  ! 3060: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xe2420009  ! 3060: LDSW_R	ldsw	[%r8 + %r9], %r17
	.word 0x967a0009  ! 3060: SDIV_R	sdiv 	%r8, %r9, %r11
	.word 0xfd3a0009  ! 3063: STDF_R	std	%f30, [%r9, %r8]
	.word 0xe8520009  ! 3063: LDSH_R	ldsh	[%r8 + %r9], %r20
	.word 0xc53a0009  ! 3063: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc42a0009  ! 3066: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xce0a0009  ! 3066: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xe9f22009  ! 3066: CASXA_R	casxa	[%r8]%asi, %r9, %r20
	.word 0xc8220009  ! 3069: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc84a0009  ! 3069: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0x8fa208a9  ! 3069: FSUBs	fsubs	%f8, %f9, %f7
	.word 0xc8320009  ! 3072: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc6120009  ! 3072: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xa0fa2bcc  ! 3072: SDIVcc_I	sdivcc 	%r8, 0x0bcc, %r16
	.word 0xf8220009  ! 3075: STW_R	stw	%r28, [%r8 + %r9]
	.word 0xd7020009  ! 3075: LDF_R	ld	[%r8, %r9], %f11
	.word 0xccba2400  ! 3075: STDA_I	stda	%r6, [%r8 + 0x0400] %asi
	.word 0xc2220009  ! 3078: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc8520009  ! 3078: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xc8120009  ! 3078: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xf0320009  ! 3081: STH_R	sth	%r24, [%r8 + %r9]
	.word 0xc8020009  ! 3081: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0x8143e05e  ! 3081: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0xc53a0009  ! 3084: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc80a0009  ! 3084: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xf0aa28ac  ! 3084: STBA_I	stba	%r24, [%r8 + 0x08ac] %asi
	.word 0xcc220009  ! 3087: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc2420009  ! 3087: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0x8143e05c  ! 3087: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0xe42a0009  ! 3090: STB_R	stb	%r18, [%r8 + %r9]
	.word 0xc25a0009  ! 3090: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0x04800001  ! 3090: BLE	ble  	<label_0x1>
	.word 0xf0320009  ! 3093: STH_R	sth	%r24, [%r8 + %r9]
	.word 0xc6120009  ! 3093: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xb84a2990  ! 3093: MULX_I	mulx 	%r8, 0x0990, %r28
	.word 0xc62a0009  ! 3096: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xcc5a0009  ! 3096: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xc3ea2d0c  ! 3096: PREFETCHA_I	prefetcha	[%r8, + 0x0d0c] %asi, #one_read
	.word 0xcc720009  ! 3099: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xda4a0009  ! 3099: LDSB_R	ldsb	[%r8 + %r9], %r13
	.word 0xc36a0009  ! 3099: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xcb3a0009  ! 3102: STDF_R	std	%f5, [%r9, %r8]
	.word 0xcd1a0009  ! 3102: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xe33a2868  ! 3102: STDF_I	std	%f17, [0x0868, %r8]
	.word 0xc9220009  ! 3105: STF_R	st	%f4, [%r9, %r8]
	.word 0xc25a0009  ! 3105: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xedf22009  ! 3105: CASXA_R	casxa	[%r8]%asi, %r9, %r22
	.word 0xcb220009  ! 3108: STF_R	st	%f5, [%r9, %r8]
	.word 0xc24a0009  ! 3108: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xc36a28a8  ! 3108: PREFETCH_I	prefetch	[%r8 + 0x08a8], #one_read
	.word 0xcd220009  ! 3111: STF_R	st	%f6, [%r9, %r8]
	.word 0xcf1a0009  ! 3111: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0x8143e05a  ! 3111: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside | #Sync 
	.word 0xfb3a0009  ! 3114: STDF_R	std	%f29, [%r9, %r8]
	.word 0xc4120009  ! 3114: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xe12229d4  ! 3114: STF_I	st	%f16, [0x09d4, %r8]
	.word 0xcf220009  ! 3117: STF_R	st	%f7, [%r9, %r8]
	.word 0xc45a0009  ! 3117: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0x8143c000  ! 3117: STBAR	stbar
	.word 0xcb220009  ! 3120: STF_R	st	%f5, [%r9, %r8]
	.word 0xd6420009  ! 3120: LDSW_R	ldsw	[%r8 + %r9], %r11
	.word 0x8c7a2080  ! 3120: SDIV_I	sdiv 	%r8, 0x0080, %r6
	.word 0xd62a0009  ! 3123: STB_R	stb	%r11, [%r8 + %r9]
	.word 0xd85a0009  ! 3123: LDX_R	ldx	[%r8 + %r9], %r12
	.word 0xc3ea1009  ! 3123: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc7220009  ! 3126: STF_R	st	%f3, [%r9, %r8]
	.word 0xf24a0009  ! 3126: LDSB_R	ldsb	[%r8 + %r9], %r25
	.word 0x8143c000  ! 3126: STBAR	stbar
	.word 0xcc2a0009  ! 3129: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xca4a0009  ! 3129: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xc3ea1009  ! 3129: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc8320009  ! 3132: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xcc120009  ! 3132: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xc6520009  ! 3132: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xce320009  ! 3135: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc8420009  ! 3135: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0x82da2034  ! 3135: SMULcc_I	smulcc 	%r8, 0x0034, %r1
	.word 0xcb220009  ! 3138: STF_R	st	%f5, [%r9, %r8]
	.word 0xc6020009  ! 3138: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xc36a0009  ! 3138: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xca220009  ! 3141: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc4120009  ! 3141: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0x8143e067  ! 3141: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #MemIssue | #Sync 
	.word 0xc6720009  ! 3144: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc45a0009  ! 3144: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0x8143e076  ! 3144: MEMBAR	membar	#StoreLoad | #LoadStore | #Lookaside | #MemIssue | #Sync 
	.word 0xcb3a0009  ! 3147: STDF_R	std	%f5, [%r9, %r8]
	.word 0xcc5a0009  ! 3147: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0x824a0009  ! 3147: MULX_R	mulx 	%r8, %r9, %r1
	.word 0xc22a0009  ! 3150: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xcc0a0009  ! 3150: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xfd1a0009  ! 3150: LDDF_R	ldd	[%r8, %r9], %f30
	.word 0xca320009  ! 3153: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xf8020009  ! 3153: LDUW_R	lduw	[%r8 + %r9], %r28
	.word 0x8ba208a9  ! 3153: FSUBs	fsubs	%f8, %f9, %f5
	.word 0xcc2a0009  ! 3156: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xcc420009  ! 3156: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0x8d220009  ! 3156: MULScc_R	mulscc 	%r8, %r9, %r6
	.word 0xd6220009  ! 3159: STW_R	stw	%r11, [%r8 + %r9]
	.word 0xc4420009  ! 3159: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xc3ea1009  ! 3159: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xce220009  ! 3162: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc64a0009  ! 3162: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xc4ca1009  ! 3162: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r2
	.word 0xc8320009  ! 3165: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xcc5a0009  ! 3165: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xc3ea2040  ! 3165: PREFETCHA_I	prefetcha	[%r8, + 0x0040] %asi, #one_read
	.word 0xcd3a0009  ! 3168: STDF_R	std	%f6, [%r9, %r8]
	.word 0xcc120009  ! 3168: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0x8143e07e  ! 3168: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xc82a0009  ! 3171: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xcf1a0009  ! 3171: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xce6a0009  ! 3171: LDSTUB_R	ldstub	%r7, [%r8 + %r9]
	.word 0xf8720009  ! 3174: STX_R	stx	%r28, [%r8 + %r9]
	.word 0xc44a0009  ! 3174: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xc36a2c70  ! 3174: PREFETCH_I	prefetch	[%r8 + 0x0c70], #one_read
	.word 0xc4320009  ! 3177: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xfa120009  ! 3177: LDUH_R	lduh	[%r8 + %r9], %r29
	.word 0xe08a1009  ! 3177: LDUBA_R	lduba	[%r8, %r9] 0x80, %r16
	.word 0xda720009  ! 3180: STX_R	stx	%r13, [%r8 + %r9]
	.word 0xea120009  ! 3180: LDUH_R	lduh	[%r8 + %r9], %r21
	.word 0x85a20929  ! 3180: FMULs	fmuls	%f8, %f9, %f2
	.word 0xcd3a0009  ! 3183: STDF_R	std	%f6, [%r9, %r8]
	.word 0xca4a0009  ! 3183: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0x867a2fac  ! 3183: SDIV_I	sdiv 	%r8, 0x0fac, %r3
	.word 0xd6320009  ! 3186: STH_R	sth	%r11, [%r8 + %r9]
	.word 0xc8420009  ! 3186: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0x83a20829  ! 3186: FADDs	fadds	%f8, %f9, %f1
	.word 0xfe2a0009  ! 3189: STB_R	stb	%r31, [%r8 + %r9]
	.word 0xf6420009  ! 3189: LDSW_R	ldsw	[%r8 + %r9], %r27
	.word 0x8b220009  ! 3189: MULScc_R	mulscc 	%r8, %r9, %r5
	.word 0xd8720009  ! 3192: STX_R	stx	%r12, [%r8 + %r9]
	.word 0xe85a0009  ! 3192: LDX_R	ldx	[%r8 + %r9], %r20
	.word 0x26800001  ! 3192: BL	bl,a	<label_0x1>
	.word 0xce320009  ! 3195: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xf4420009  ! 3195: LDSW_R	ldsw	[%r8 + %r9], %r26
	.word 0xc4ba1009  ! 3195: STDA_R	stda	%r2, [%r8 + %r9] 0x80
	.word 0xcf3a0009  ! 3198: STDF_R	std	%f7, [%r9, %r8]
	.word 0xfb1a0009  ! 3198: LDDF_R	ldd	[%r8, %r9], %f29
	.word 0xc8020009  ! 3198: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xc4720009  ! 3201: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc7020009  ! 3201: LDF_R	ld	[%r8, %r9], %f3
	.word 0xc7e22009  ! 3201: CASA_R	casa	[%r8] %asi, %r9, %r3
	.word 0xdd3a0009  ! 3204: STDF_R	std	%f14, [%r9, %r8]
	.word 0xcc5a0009  ! 3204: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xc4ba1009  ! 3204: STDA_R	stda	%r2, [%r8 + %r9] 0x80
	.word 0xcc2a0009  ! 3207: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xca520009  ! 3207: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0x8143e022  ! 3207: MEMBAR	membar	#StoreLoad | #MemIssue 
	.word 0xfa2a0009  ! 3210: STB_R	stb	%r29, [%r8 + %r9]
	.word 0xca0a0009  ! 3210: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0x8f6a2e34  ! 3210: SDIVX_I	sdivx	%r8, 0x0e34, %r7
	.word 0xc4720009  ! 3213: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xd8120009  ! 3213: LDUH_R	lduh	[%r8 + %r9], %r12
	.word 0xcdf21009  ! 3213: CASXA_I	casxa	[%r8] 0x80, %r9, %r6
	.word 0xcb220009  ! 3216: STF_R	st	%f5, [%r9, %r8]
	.word 0xcc0a0009  ! 3216: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xb3222844  ! 3216: MULScc_I	mulscc 	%r8, 0x0844, %r25
	.word 0xc2720009  ! 3219: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xef1a0009  ! 3219: LDDF_R	ldd	[%r8, %r9], %f23
	.word 0xf8a22560  ! 3219: STWA_I	stwa	%r28, [%r8 + 0x0560] %asi
	.word 0xcc2a0009  ! 3222: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xce020009  ! 3222: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xccc21009  ! 3222: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r6
	.word 0xc73a0009  ! 3225: STDF_R	std	%f3, [%r9, %r8]
	.word 0xe0520009  ! 3225: LDSH_R	ldsh	[%r8 + %r9], %r16
	.word 0x8cfa0009  ! 3225: SDIVcc_R	sdivcc 	%r8, %r9, %r6
	.word 0xc6320009  ! 3228: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xcc420009  ! 3228: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0x866a0009  ! 3228: UDIVX_R	udivx 	%r8, %r9, %r3
	.word 0xce320009  ! 3231: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xf2420009  ! 3231: LDSW_R	ldsw	[%r8 + %r9], %r25
	.word 0xc36a2bdc  ! 3231: PREFETCH_I	prefetch	[%r8 + 0x0bdc], #one_read
	.word 0xc3220009  ! 3234: STF_R	st	%f1, [%r9, %r8]
	.word 0xc4520009  ! 3234: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0x86da0009  ! 3234: SMULcc_R	smulcc 	%r8, %r9, %r3
	.word 0xca220009  ! 3237: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xce4a0009  ! 3237: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0x8143e04e  ! 3237: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Sync 
	.word 0xdf3a0009  ! 3240: STDF_R	std	%f15, [%r9, %r8]
	.word 0xea520009  ! 3240: LDSH_R	ldsh	[%r8 + %r9], %r21
	.word 0x8143e06a  ! 3240: MEMBAR	membar	#StoreLoad | #StoreStore | #MemIssue | #Sync 
	.word 0xc2320009  ! 3243: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xcc0a0009  ! 3243: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0x8143c000  ! 3243: STBAR	stbar
	.word 0xc5220009  ! 3246: STF_R	st	%f2, [%r9, %r8]
	.word 0xcf020009  ! 3246: LDF_R	ld	[%r8, %r9], %f7
	.word 0x40000001  ! 3246: CALL	call	disp30_1
	.word 0xc22a0009  ! 3249: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc85a0009  ! 3249: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xc3ea2970  ! 3249: PREFETCHA_I	prefetcha	[%r8, + 0x0970] %asi, #one_read
	.word 0xe6320009  ! 3252: STH_R	sth	%r19, [%r8 + %r9]
	.word 0xc24a0009  ! 3252: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0x884a269c  ! 3252: MULX_I	mulx 	%r8, 0x069c, %r4
	.word 0xc2720009  ! 3255: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xf3020009  ! 3255: LDF_R	ld	[%r8, %r9], %f25
	.word 0x02c20001  ! 3255: BRZ	brz  ,nt	%8,<label_0x20001>
	.word 0xcd3a0009  ! 3258: STDF_R	std	%f6, [%r9, %r8]
	.word 0xfe420009  ! 3258: LDSW_R	ldsw	[%r8 + %r9], %r31
	.word 0x0c800001  ! 3258: BNEG	bneg  	<label_0x1>
	.word 0xdc2a0009  ! 3261: STB_R	stb	%r14, [%r8 + %r9]
	.word 0xc44a0009  ! 3261: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xc3ea1009  ! 3261: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xeb220009  ! 3264: STF_R	st	%f21, [%r9, %r8]
	.word 0xf0020009  ! 3264: LDUW_R	lduw	[%r8 + %r9], %r24
	.word 0xef222d00  ! 3264: STF_I	st	%f23, [0x0d00, %r8]
	.word 0xcb220009  ! 3267: STF_R	st	%f5, [%r9, %r8]
	.word 0xf2020009  ! 3267: LDUW_R	lduw	[%r8 + %r9], %r25
	.word 0xeca22ca4  ! 3267: STWA_I	stwa	%r22, [%r8 + 0x0ca4] %asi
	.word 0xcc720009  ! 3270: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc7020009  ! 3270: LDF_R	ld	[%r8, %r9], %f3
	.word 0xc8ea1009  ! 3270: LDSTUBA_R	ldstuba	%r4, [%r8 + %r9] 0x80
	.word 0xce2a0009  ! 3273: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xdf020009  ! 3273: LDF_R	ld	[%r8, %r9], %f15
	.word 0x89220009  ! 3273: MULScc_R	mulscc 	%r8, %r9, %r4
	.word 0xea720009  ! 3276: STX_R	stx	%r21, [%r8 + %r9]
	.word 0xf85a0009  ! 3276: LDX_R	ldx	[%r8 + %r9], %r28
	.word 0xc4ba2158  ! 3276: STDA_I	stda	%r2, [%r8 + 0x0158] %asi
	.word 0xc3220009  ! 3279: STF_R	st	%f1, [%r9, %r8]
	.word 0xc91a0009  ! 3279: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xc2f21009  ! 3279: STXA_R	stxa	%r1, [%r8 + %r9] 0x80
	.word 0xce720009  ! 3282: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xdd1a0009  ! 3282: LDDF_R	ldd	[%r8, %r9], %f14
	.word 0xdab21009  ! 3282: STHA_R	stha	%r13, [%r8 + %r9] 0x80
	.word 0xcc720009  ! 3285: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc44a0009  ! 3285: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xc3020009  ! 3285: LDF_R	ld	[%r8, %r9], %f1
	.word 0xc7220009  ! 3288: STF_R	st	%f3, [%r9, %r8]
	.word 0xf8020009  ! 3288: LDUW_R	lduw	[%r8 + %r9], %r28
	.word 0xacd20009  ! 3288: UMULcc_R	umulcc 	%r8, %r9, %r22
	.word 0xee320009  ! 3291: STH_R	sth	%r23, [%r8 + %r9]
	.word 0xc64a0009  ! 3291: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xc3ea2a00  ! 3291: PREFETCHA_I	prefetcha	[%r8, + 0x0a00] %asi, #one_read
	.word 0xc6720009  ! 3294: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xf44a0009  ! 3294: LDSB_R	ldsb	[%r8 + %r9], %r26
	.word 0xcb3a2ea0  ! 3294: STDF_I	std	%f5, [0x0ea0, %r8]
	.word 0xec320009  ! 3297: STH_R	sth	%r22, [%r8 + %r9]
	.word 0xc71a0009  ! 3297: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xcfe22009  ! 3297: CASA_R	casa	[%r8] %asi, %r9, %r7
	.word 0xf62a0009  ! 3300: STB_R	stb	%r27, [%r8 + %r9]
	.word 0xc24a0009  ! 3300: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xf3022ebc  ! 3300: LDF_I	ld	[%r8, 0x0ebc], %f25
	.word 0xda2a0009  ! 3303: STB_R	stb	%r13, [%r8 + %r9]
	.word 0xf8520009  ! 3303: LDSH_R	ldsh	[%r8 + %r9], %r28
	.word 0xc4522f44  ! 3303: LDSH_I	ldsh	[%r8 + 0x0f44], %r2
	.word 0xc22a0009  ! 3306: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc40a0009  ! 3306: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0x8143c000  ! 3306: STBAR	stbar
	.word 0xcc2a0009  ! 3309: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc6520009  ! 3309: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xca022090  ! 3309: LDUW_I	lduw	[%r8 + 0x0090], %r5
	.word 0xc82a0009  ! 3312: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc8520009  ! 3312: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xdf3a2c60  ! 3312: STDF_I	std	%f15, [0x0c60, %r8]
	.word 0xcb3a0009  ! 3315: STDF_R	std	%f5, [%r9, %r8]
	.word 0xce5a0009  ! 3315: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0x9e5a2f8c  ! 3315: SMUL_I	smul 	%r8, 0x0f8c, %r15
	.word 0xe13a0009  ! 3318: STDF_R	std	%f16, [%r9, %r8]
	.word 0xec5a0009  ! 3318: LDX_R	ldx	[%r8 + %r9], %r22
	.word 0xcc921009  ! 3318: LDUHA_R	lduha	[%r8, %r9] 0x80, %r6
	.word 0xc53a0009  ! 3321: STDF_R	std	%f2, [%r9, %r8]
	.word 0xf2120009  ! 3321: LDUH_R	lduh	[%r8 + %r9], %r25
	.word 0x08800001  ! 3321: BLEU	bleu  	<label_0x1>
	.word 0xcf220009  ! 3324: STF_R	st	%f7, [%r9, %r8]
	.word 0xc6420009  ! 3324: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xce420009  ! 3324: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xcc2a0009  ! 3327: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc6420009  ! 3327: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0x82da0009  ! 3327: SMULcc_R	smulcc 	%r8, %r9, %r1
	.word 0xcf3a0009  ! 3330: STDF_R	std	%f7, [%r9, %r8]
	.word 0xcc4a0009  ! 3330: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xc3ea1009  ! 3330: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xe0720009  ! 3333: STX_R	stx	%r16, [%r8 + %r9]
	.word 0xd85a0009  ! 3333: LDX_R	ldx	[%r8 + %r9], %r12
	.word 0x83a20829  ! 3333: FADDs	fadds	%f8, %f9, %f1
	.word 0xce720009  ! 3336: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xf51a0009  ! 3336: LDDF_R	ldd	[%r8, %r9], %f26
	.word 0xc8ba2540  ! 3336: STDA_I	stda	%r4, [%r8 + 0x0540] %asi
	.word 0xc6220009  ! 3339: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xde0a0009  ! 3339: LDUB_R	ldub	[%r8 + %r9], %r15
	.word 0xceda2f50  ! 3339: LDXA_I	ldxa	[%r8, + 0x0f50] %asi, %r7
	.word 0xc7220009  ! 3342: STF_R	st	%f3, [%r9, %r8]
	.word 0xca120009  ! 3342: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xcea21009  ! 3342: STWA_R	stwa	%r7, [%r8 + %r9] 0x80
	.word 0xc8320009  ! 3345: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc6420009  ! 3345: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xf87a2dd8  ! 3345: SWAP_I	swap	%r28, [%r8 + 0x0dd8]
	.word 0xc93a0009  ! 3348: STDF_R	std	%f4, [%r9, %r8]
	.word 0xfe420009  ! 3348: LDSW_R	ldsw	[%r8 + %r9], %r31
	.word 0x8143e01c  ! 3348: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside 
	.word 0xcc220009  ! 3351: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xcd1a0009  ! 3351: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0x8c522f5c  ! 3351: UMUL_I	umul 	%r8, 0x0f5c, %r6
	.word 0xce220009  ! 3354: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc6420009  ! 3354: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xda120009  ! 3354: LDUH_R	lduh	[%r8 + %r9], %r13
	.word 0xcb220009  ! 3357: STF_R	st	%f5, [%r9, %r8]
	.word 0xca420009  ! 3357: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xc2420009  ! 3357: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xce320009  ! 3360: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xea020009  ! 3360: LDUW_R	lduw	[%r8 + %r9], %r21
	.word 0xf9e21009  ! 3360: CASA_I	casa	[%r8] 0x80, %r9, %r28
	.word 0xf42a0009  ! 3363: STB_R	stb	%r26, [%r8 + %r9]
	.word 0xc8420009  ! 3363: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xc3ea1009  ! 3363: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xce720009  ! 3366: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xe60a0009  ! 3366: LDUB_R	ldub	[%r8 + %r9], %r19
	.word 0x867a0009  ! 3366: SDIV_R	sdiv 	%r8, %r9, %r3
	.word 0xc4320009  ! 3369: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xe25a0009  ! 3369: LDX_R	ldx	[%r8 + %r9], %r17
	.word 0x38800002  ! 3369: BGU	bgu,a	<label_0x2>
	.word 0xce220009  ! 3372: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xca020009  ! 3372: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xc67a0009  ! 3372: SWAP_R	swap	%r3, [%r8 + %r9]
	.word 0xfe2a0009  ! 3375: STB_R	stb	%r31, [%r8 + %r9]
	.word 0xc9020009  ! 3375: LDF_R	ld	[%r8, %r9], %f4
	.word 0xcaaa21d4  ! 3375: STBA_I	stba	%r5, [%r8 + 0x01d4] %asi
	.word 0xc93a0009  ! 3378: STDF_R	std	%f4, [%r9, %r8]
	.word 0xc2520009  ! 3378: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xe0ca1009  ! 3378: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r16
	.word 0xce2a0009  ! 3381: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc84a0009  ! 3381: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xccba2748  ! 3381: STDA_I	stda	%r6, [%r8 + 0x0748] %asi
	.word 0xc2720009  ! 3384: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xf5020009  ! 3384: LDF_R	ld	[%r8, %r9], %f26
	.word 0xc3ea1009  ! 3384: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xce720009  ! 3387: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc71a0009  ! 3387: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xc68a26a8  ! 3387: LDUBA_I	lduba	[%r8, + 0x06a8] %asi, %r3
	.word 0xc7220009  ! 3390: STF_R	st	%f3, [%r9, %r8]
	.word 0xf00a0009  ! 3390: LDUB_R	ldub	[%r8 + %r9], %r24
	.word 0xc3e22009  ! 3390: CASA_R	casa	[%r8] %asi, %r9, %r1
	.word 0xc8220009  ! 3393: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc84a0009  ! 3393: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xede22009  ! 3393: CASA_R	casa	[%r8] %asi, %r9, %r22
	.word 0xc82a0009  ! 3396: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xcb1a0009  ! 3396: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xc6da1009  ! 3396: LDXA_R	ldxa	[%r8, %r9] 0x80, %r3
	.word 0xc73a0009  ! 3399: STDF_R	std	%f3, [%r9, %r8]
	.word 0xce020009  ! 3399: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xcaaa2d84  ! 3399: STBA_I	stba	%r5, [%r8 + 0x0d84] %asi
	.word 0xce2a0009  ! 3402: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xce520009  ! 3402: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0x02ca0001  ! 3402: BRZ	brz  ,pt	%8,<label_0xa0001>
	.word 0xcc220009  ! 3405: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc2120009  ! 3405: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xfc020009  ! 3405: LDUW_R	lduw	[%r8 + %r9], %r30
	.word 0xcb220009  ! 3408: STF_R	st	%f5, [%r9, %r8]
	.word 0xc25a0009  ! 3408: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0x24c20001  ! 3408: BRLEZ	brlez,a,nt	%8,<label_0x20001>
	.word 0xca2a0009  ! 3411: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc44a0009  ! 3411: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xd8ea1009  ! 3411: LDSTUBA_R	ldstuba	%r12, [%r8 + %r9] 0x80
	.word 0xe2220009  ! 3414: STW_R	stw	%r17, [%r8 + %r9]
	.word 0xce0a0009  ! 3414: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xcb3a0009  ! 3414: STDF_R	std	%f5, [%r9, %r8]
	.word 0xe6320009  ! 3417: STH_R	sth	%r19, [%r8 + %r9]
	.word 0xce4a0009  ! 3417: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xb47a0009  ! 3417: SDIV_R	sdiv 	%r8, %r9, %r26
	.word 0xc73a0009  ! 3420: STDF_R	std	%f3, [%r9, %r8]
	.word 0xca420009  ! 3420: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xc7e21009  ! 3420: CASA_I	casa	[%r8] 0x80, %r9, %r3
	.word 0xcb3a0009  ! 3423: STDF_R	std	%f5, [%r9, %r8]
	.word 0xc6420009  ! 3423: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xccd21009  ! 3423: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r6
	.word 0xdc320009  ! 3426: STH_R	sth	%r14, [%r8 + %r9]
	.word 0xf85a0009  ! 3426: LDX_R	ldx	[%r8 + %r9], %r28
	.word 0xda520009  ! 3426: LDSH_R	ldsh	[%r8 + %r9], %r13
	.word 0xc82a0009  ! 3429: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc40a0009  ! 3429: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xc8aa1009  ! 3429: STBA_R	stba	%r4, [%r8 + %r9] 0x80
	.word 0xcc320009  ! 3432: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xcc4a0009  ! 3432: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xb1a208a9  ! 3432: FSUBs	fsubs	%f8, %f9, %f24
	.word 0xc3220009  ! 3435: STF_R	st	%f1, [%r9, %r8]
	.word 0xc91a0009  ! 3435: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xc3ea2ad4  ! 3435: PREFETCHA_I	prefetcha	[%r8, + 0x0ad4] %asi, #one_read
	.word 0xcd220009  ! 3438: STF_R	st	%f6, [%r9, %r8]
	.word 0xdc5a0009  ! 3438: LDX_R	ldx	[%r8 + %r9], %r14
	.word 0xc7222e08  ! 3438: STF_I	st	%f3, [0x0e08, %r8]
	.word 0xc2320009  ! 3441: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc31a0009  ! 3441: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xc36a0009  ! 3441: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xcb220009  ! 3444: STF_R	st	%f5, [%r9, %r8]
	.word 0xe2520009  ! 3444: LDSH_R	ldsh	[%r8 + %r9], %r17
	.word 0x83a208a9  ! 3444: FSUBs	fsubs	%f8, %f9, %f1
	.word 0xe8220009  ! 3447: STW_R	stw	%r20, [%r8 + %r9]
	.word 0xce120009  ! 3447: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0x04c20001  ! 3447: BRLEZ	brlez  ,nt	%8,<label_0x20001>
	.word 0xcf3a0009  ! 3450: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc4120009  ! 3450: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xc33a2530  ! 3450: STDF_I	std	%f1, [0x0530, %r8]
	.word 0xc6220009  ! 3453: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc45a0009  ! 3453: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0x8143e004  ! 3453: MEMBAR	membar	#LoadStore 
	.word 0xc5220009  ! 3456: STF_R	st	%f2, [%r9, %r8]
	.word 0xc51a0009  ! 3456: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xdff22009  ! 3456: CASXA_R	casxa	[%r8]%asi, %r9, %r15
	.word 0xe62a0009  ! 3459: STB_R	stb	%r19, [%r8 + %r9]
	.word 0xee120009  ! 3459: LDUH_R	lduh	[%r8 + %r9], %r23
	.word 0x16800001  ! 3459: BGE	bge  	<label_0x1>
	.word 0xed220009  ! 3462: STF_R	st	%f22, [%r9, %r8]
	.word 0xe2520009  ! 3462: LDSH_R	ldsh	[%r8 + %r9], %r17
	.word 0xcc520009  ! 3462: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xc62a0009  ! 3465: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xca120009  ! 3465: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0x36800002  ! 3465: BGE	bge,a	<label_0x2>
	.word 0xfc320009  ! 3468: STH_R	sth	%r30, [%r8 + %r9]
	.word 0xfb1a0009  ! 3468: LDDF_R	ldd	[%r8, %r9], %f29
	.word 0xd8420009  ! 3468: LDSW_R	ldsw	[%r8 + %r9], %r12
	.word 0xc8220009  ! 3471: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc8520009  ! 3471: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0x0c800001  ! 3471: BNEG	bneg  	<label_0x1>
	.word 0xc8720009  ! 3474: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xcf020009  ! 3474: LDF_R	ld	[%r8, %r9], %f7
	.word 0x8143e03e  ! 3474: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0xc93a0009  ! 3477: STDF_R	std	%f4, [%r9, %r8]
	.word 0xec420009  ! 3477: LDSW_R	ldsw	[%r8 + %r9], %r22
	.word 0x16800001  ! 3477: BGE	bge  	<label_0x1>
	.word 0xd73a0009  ! 3480: STDF_R	std	%f11, [%r9, %r8]
	.word 0xca420009  ! 3480: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xe2522560  ! 3480: LDSH_I	ldsh	[%r8 + 0x0560], %r17
	.word 0xcb3a0009  ! 3483: STDF_R	std	%f5, [%r9, %r8]
	.word 0xce5a0009  ! 3483: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0x8a7a27a8  ! 3483: SDIV_I	sdiv 	%r8, 0x07a8, %r5
	.word 0xce2a0009  ! 3486: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xf4120009  ! 3486: LDUH_R	lduh	[%r8 + %r9], %r26
	.word 0x88522c08  ! 3486: UMUL_I	umul 	%r8, 0x0c08, %r4
	.word 0xc93a0009  ! 3489: STDF_R	std	%f4, [%r9, %r8]
	.word 0xe8020009  ! 3489: LDUW_R	lduw	[%r8 + %r9], %r20
	.word 0xc81a2858  ! 3489: LDD_I	ldd	[%r8 + 0x0858], %r4
	.word 0xca320009  ! 3492: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xcf1a0009  ! 3492: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0x8143c000  ! 3492: STBAR	stbar
	.word 0xc93a0009  ! 3495: STDF_R	std	%f4, [%r9, %r8]
	.word 0xc9020009  ! 3495: LDF_R	ld	[%r8, %r9], %f4
	.word 0x86720009  ! 3495: UDIV_R	udiv 	%r8, %r9, %r3
	.word 0xe3220009  ! 3498: STF_R	st	%f17, [%r9, %r8]
	.word 0xc8520009  ! 3498: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0x0a800001  ! 3498: BCS	bcs  	<label_0x1>
	.word 0xcc220009  ! 3501: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xca4a0009  ! 3501: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xc4c21009  ! 3501: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r2
	.word 0xc5220009  ! 3504: STF_R	st	%f2, [%r9, %r8]
	.word 0xfe4a0009  ! 3504: LDSB_R	ldsb	[%r8 + %r9], %r31
	.word 0x86f20009  ! 3504: UDIVcc_R	udivcc 	%r8, %r9, %r3
	.word 0xce220009  ! 3507: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xcb020009  ! 3507: LDF_R	ld	[%r8, %r9], %f5
	.word 0x87a20929  ! 3507: FMULs	fmuls	%f8, %f9, %f3
	.word 0xcc2a0009  ! 3510: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xd64a0009  ! 3510: LDSB_R	ldsb	[%r8 + %r9], %r11
	.word 0x8143c000  ! 3510: STBAR	stbar
	.word 0xdc320009  ! 3513: STH_R	sth	%r14, [%r8 + %r9]
	.word 0xde420009  ! 3513: LDSW_R	ldsw	[%r8 + %r9], %r15
	.word 0xfbe21009  ! 3513: CASA_I	casa	[%r8] 0x80, %r9, %r29
	.word 0xc2320009  ! 3516: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc20a0009  ! 3516: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xc4fa1009  ! 3516: SWAPA_R	swapa	%r2, [%r8 + %r9] 0x80
	.word 0xed3a0009  ! 3519: STDF_R	std	%f22, [%r9, %r8]
	.word 0xc60a0009  ! 3519: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xccf21009  ! 3519: STXA_R	stxa	%r6, [%r8 + %r9] 0x80
	.word 0xca2a0009  ! 3522: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xf6520009  ! 3522: LDSH_R	ldsh	[%r8 + %r9], %r27
	.word 0xc9e21009  ! 3522: CASA_I	casa	[%r8] 0x80, %r9, %r4
	.word 0xcf3a0009  ! 3525: STDF_R	std	%f7, [%r9, %r8]
	.word 0xea0a0009  ! 3525: LDUB_R	ldub	[%r8 + %r9], %r21
	.word 0x8b6a2044  ! 3525: SDIVX_I	sdivx	%r8, 0x0044, %r5
	.word 0xc8220009  ! 3528: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc84a0009  ! 3528: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0x04c20001  ! 3528: BRLEZ	brlez  ,nt	%8,<label_0x20001>
	.word 0xe62a0009  ! 3531: STB_R	stb	%r19, [%r8 + %r9]
	.word 0xc45a0009  ! 3531: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xca921009  ! 3531: LDUHA_R	lduha	[%r8, %r9] 0x80, %r5
	.word 0xce320009  ! 3534: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xef020009  ! 3534: LDF_R	ld	[%r8, %r9], %f23
	.word 0xce5a2e60  ! 3534: LDX_I	ldx	[%r8 + 0x0e60], %r7
	.word 0xc3220009  ! 3537: STF_R	st	%f1, [%r9, %r8]
	.word 0xe6420009  ! 3537: LDSW_R	ldsw	[%r8 + %r9], %r19
	.word 0xc3ea1009  ! 3537: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xcf220009  ! 3540: STF_R	st	%f7, [%r9, %r8]
	.word 0xda420009  ! 3540: LDSW_R	ldsw	[%r8 + %r9], %r13
	.word 0xc3ea275c  ! 3540: PREFETCHA_I	prefetcha	[%r8, + 0x075c] %asi, #one_read
	.word 0xfa2a0009  ! 3543: STB_R	stb	%r29, [%r8 + %r9]
	.word 0xc45a0009  ! 3543: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0x8a722020  ! 3543: UDIV_I	udiv 	%r8, 0x0020, %r5
	.word 0xc2320009  ! 3546: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc84a0009  ! 3546: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0x2cca0001  ! 3546: BRGZ	brgz,a,pt	%8,<label_0xa0001>
	.word 0xcf3a0009  ! 3549: STDF_R	std	%f7, [%r9, %r8]
	.word 0xea420009  ! 3549: LDSW_R	ldsw	[%r8 + %r9], %r21
	.word 0xa86a2e18  ! 3549: UDIVX_I	udivx 	%r8, 0x0e18, %r20
	.word 0xc82a0009  ! 3552: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xf0520009  ! 3552: LDSH_R	ldsh	[%r8 + %r9], %r24
	.word 0xfa6a22e8  ! 3552: LDSTUB_I	ldstub	%r29, [%r8 + 0x02e8]
	.word 0xf6320009  ! 3555: STH_R	sth	%r27, [%r8 + %r9]
	.word 0xc5020009  ! 3555: LDF_R	ld	[%r8, %r9], %f2
	.word 0xcf222cf8  ! 3555: STF_I	st	%f7, [0x0cf8, %r8]
	.word 0xc4320009  ! 3558: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xdf020009  ! 3558: LDF_R	ld	[%r8, %r9], %f15
	.word 0xc3ea1009  ! 3558: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc53a0009  ! 3561: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc2520009  ! 3561: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xe28229e8  ! 3561: LDUWA_I	lduwa	[%r8, + 0x09e8] %asi, %r17
	.word 0xc82a0009  ! 3564: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xfb020009  ! 3564: LDF_R	ld	[%r8, %r9], %f29
	.word 0x0cca0001  ! 3564: BRGZ	brgz  ,pt	%8,<label_0xa0001>
	.word 0xc2320009  ! 3567: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc4120009  ! 3567: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xc3ea24d0  ! 3567: PREFETCHA_I	prefetcha	[%r8, + 0x04d0] %asi, #one_read
	.word 0xcb220009  ! 3570: STF_R	st	%f5, [%r9, %r8]
	.word 0xf00a0009  ! 3570: LDUB_R	ldub	[%r8 + %r9], %r24
	.word 0xc46a2a24  ! 3570: LDSTUB_I	ldstub	%r2, [%r8 + 0x0a24]
	.word 0xe4320009  ! 3573: STH_R	sth	%r18, [%r8 + %r9]
	.word 0xcc520009  ! 3573: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xc492212c  ! 3573: LDUHA_I	lduha	[%r8, + 0x012c] %asi, %r2
	.word 0xca2a0009  ! 3576: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xce0a0009  ! 3576: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xc60a2084  ! 3576: LDUB_I	ldub	[%r8 + 0x0084], %r3
	.word 0xf2720009  ! 3579: STX_R	stx	%r25, [%r8 + %r9]
	.word 0xe8020009  ! 3579: LDUW_R	lduw	[%r8 + %r9], %r20
	.word 0xe8420009  ! 3579: LDSW_R	ldsw	[%r8 + %r9], %r20
	.word 0xee320009  ! 3582: STH_R	sth	%r23, [%r8 + %r9]
	.word 0xcd1a0009  ! 3582: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0x8143c000  ! 3582: STBAR	stbar
	.word 0xfd220009  ! 3585: STF_R	st	%f30, [%r9, %r8]
	.word 0xca120009  ! 3585: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xe7f21009  ! 3585: CASXA_I	casxa	[%r8] 0x80, %r9, %r19
	.word 0xc73a0009  ! 3588: STDF_R	std	%f3, [%r9, %r8]
	.word 0xcc420009  ! 3588: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0x8d222138  ! 3588: MULScc_I	mulscc 	%r8, 0x0138, %r6
	.word 0xcf220009  ! 3591: STF_R	st	%f7, [%r9, %r8]
	.word 0xca420009  ! 3591: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xc67a0009  ! 3591: SWAP_R	swap	%r3, [%r8 + %r9]
	.word 0xe8220009  ! 3594: STW_R	stw	%r20, [%r8 + %r9]
	.word 0xcc120009  ! 3594: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0x827a0009  ! 3594: SDIV_R	sdiv 	%r8, %r9, %r1
	.word 0xe6320009  ! 3597: STH_R	sth	%r19, [%r8 + %r9]
	.word 0xf2020009  ! 3597: LDUW_R	lduw	[%r8 + %r9], %r25
	.word 0xbaf220c4  ! 3597: UDIVcc_I	udivcc 	%r8, 0x00c4, %r29
	.word 0xc22a0009  ! 3600: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc4120009  ! 3600: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0x97220009  ! 3600: MULScc_R	mulscc 	%r8, %r9, %r11
	.word 0xc7220009  ! 3603: STF_R	st	%f3, [%r9, %r8]
	.word 0xc4420009  ! 3603: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0x02800001  ! 3603: BE	be  	<label_0x1>
	.word 0xe93a0009  ! 3606: STDF_R	std	%f20, [%r9, %r8]
	.word 0xce4a0009  ! 3606: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xe6ca1009  ! 3606: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r19
	.word 0xc5220009  ! 3609: STF_R	st	%f2, [%r9, %r8]
	.word 0xea4a0009  ! 3609: LDSB_R	ldsb	[%r8 + %r9], %r21
	.word 0xc4f22658  ! 3609: STXA_I	stxa	%r2, [%r8 + 0x0658] %asi
	.word 0xcd220009  ! 3612: STF_R	st	%f6, [%r9, %r8]
	.word 0xc8420009  ! 3612: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xc36a22e0  ! 3612: PREFETCH_I	prefetch	[%r8 + 0x02e0], #one_read
	.word 0xf1220009  ! 3615: STF_R	st	%f24, [%r9, %r8]
	.word 0xea5a0009  ! 3615: LDX_R	ldx	[%r8 + %r9], %r21
	.word 0x8143c000  ! 3615: STBAR	stbar
	.word 0xc2720009  ! 3618: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc6120009  ! 3618: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xb6720009  ! 3618: UDIV_R	udiv 	%r8, %r9, %r27
	.word 0xc53a0009  ! 3621: STDF_R	std	%f2, [%r9, %r8]
	.word 0xd80a0009  ! 3621: LDUB_R	ldub	[%r8 + %r9], %r12
	.word 0xcc5a20c8  ! 3621: LDX_I	ldx	[%r8 + 0x00c8], %r6
	.word 0xce320009  ! 3624: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xcc120009  ! 3624: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xccba28b8  ! 3624: STDA_I	stda	%r6, [%r8 + 0x08b8] %asi
	.word 0xdb3a0009  ! 3627: STDF_R	std	%f13, [%r9, %r8]
	.word 0xdc520009  ! 3627: LDSH_R	ldsh	[%r8 + %r9], %r14
	.word 0x8ba20829  ! 3627: FADDs	fadds	%f8, %f9, %f5
	.word 0xc82a0009  ! 3630: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xfe520009  ! 3630: LDSH_R	ldsh	[%r8 + %r9], %r31
	.word 0xc3ea2f00  ! 3630: PREFETCHA_I	prefetcha	[%r8, + 0x0f00] %asi, #one_read
	.word 0xc8720009  ! 3633: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xf04a0009  ! 3633: LDSB_R	ldsb	[%r8 + %r9], %r24
	.word 0xc3ea2e38  ! 3633: PREFETCHA_I	prefetcha	[%r8, + 0x0e38] %asi, #one_read
	.word 0xe8720009  ! 3636: STX_R	stx	%r20, [%r8 + %r9]
	.word 0xe45a0009  ! 3636: LDX_R	ldx	[%r8 + %r9], %r18
	.word 0xcc8a1009  ! 3636: LDUBA_R	lduba	[%r8, %r9] 0x80, %r6
	.word 0xf93a0009  ! 3639: STDF_R	std	%f28, [%r9, %r8]
	.word 0xe4120009  ! 3639: LDUH_R	lduh	[%r8 + %r9], %r18
	.word 0xc8821009  ! 3639: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r4
	.word 0xc8320009  ! 3642: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xf0420009  ! 3642: LDSW_R	ldsw	[%r8 + %r9], %r24
	.word 0xc3ea1009  ! 3642: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xf93a0009  ! 3645: STDF_R	std	%f28, [%r9, %r8]
	.word 0xc8520009  ! 3645: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0x8143e03d  ! 3645: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0xc2220009  ! 3648: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc8420009  ! 3648: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0x26ca0001  ! 3648: BRLZ	brlz,a,pt	%8,<label_0xa0001>
	.word 0xc4320009  ! 3651: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc24a0009  ! 3651: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0x8c720009  ! 3651: UDIV_R	udiv 	%r8, %r9, %r6
	.word 0xc6220009  ! 3654: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xe64a0009  ! 3654: LDSB_R	ldsb	[%r8 + %r9], %r19
	.word 0x2ac20001  ! 3654: BRNZ	brnz,a,nt	%8,<label_0x20001>
	.word 0xe1220009  ! 3657: STF_R	st	%f16, [%r9, %r8]
	.word 0xc7020009  ! 3657: LDF_R	ld	[%r8, %r9], %f3
	.word 0xc71a0009  ! 3657: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xcd3a0009  ! 3660: STDF_R	std	%f6, [%r9, %r8]
	.word 0xf31a0009  ! 3660: LDDF_R	ldd	[%r8, %r9], %f25
	.word 0xec8a2ec0  ! 3660: LDUBA_I	lduba	[%r8, + 0x0ec0] %asi, %r22
	.word 0xcb3a0009  ! 3663: STDF_R	std	%f5, [%r9, %r8]
	.word 0xec420009  ! 3663: LDSW_R	ldsw	[%r8 + %r9], %r22
	.word 0xc4822b00  ! 3663: LDUWA_I	lduwa	[%r8, + 0x0b00] %asi, %r2
	.word 0xf73a0009  ! 3666: STDF_R	std	%f27, [%r9, %r8]
	.word 0xfe0a0009  ! 3666: LDUB_R	ldub	[%r8 + %r9], %r31
	.word 0xf0aa2bcc  ! 3666: STBA_I	stba	%r24, [%r8 + 0x0bcc] %asi
	.word 0xc2720009  ! 3669: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc65a0009  ! 3669: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0x8143c000  ! 3669: STBAR	stbar
	.word 0xc4320009  ! 3672: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xce4a0009  ! 3672: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0x8143c000  ! 3672: STBAR	stbar
	.word 0xc8220009  ! 3675: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xda520009  ! 3675: LDSH_R	ldsh	[%r8 + %r9], %r13
	.word 0x1c800001  ! 3675: BPOS	bpos  	<label_0x1>
	.word 0xc5220009  ! 3678: STF_R	st	%f2, [%r9, %r8]
	.word 0xca520009  ! 3678: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xccba2378  ! 3678: STDA_I	stda	%r6, [%r8 + 0x0378] %asi
	.word 0xe13a0009  ! 3681: STDF_R	std	%f16, [%r9, %r8]
	.word 0xc20a0009  ! 3681: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xf5220009  ! 3681: STF_R	st	%f26, [%r9, %r8]
	.word 0xc2720009  ! 3684: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc31a0009  ! 3684: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xb6522d40  ! 3684: UMUL_I	umul 	%r8, 0x0d40, %r27
	.word 0xc5220009  ! 3687: STF_R	st	%f2, [%r9, %r8]
	.word 0xf05a0009  ! 3687: LDX_R	ldx	[%r8 + %r9], %r24
	.word 0xccea29c4  ! 3687: LDSTUBA_I	ldstuba	%r6, [%r8 + 0x09c4] %asi
	.word 0xc5220009  ! 3690: STF_R	st	%f2, [%r9, %r8]
	.word 0xe0020009  ! 3690: LDUW_R	lduw	[%r8 + %r9], %r16
	.word 0xc7f21009  ! 3690: CASXA_I	casxa	[%r8] 0x80, %r9, %r3
	.word 0xce2a0009  ! 3693: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc60a0009  ! 3693: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0x8f6a2020  ! 3693: SDIVX_I	sdivx	%r8, 0x0020, %r7
	.word 0xc2320009  ! 3696: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc25a0009  ! 3696: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xc5e22009  ! 3696: CASA_R	casa	[%r8] %asi, %r9, %r2
	.word 0xce320009  ! 3699: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xca520009  ! 3699: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xe4fa24e0  ! 3699: SWAPA_I	swapa	%r18, [%r8 + 0x04e0] %asi
	.word 0xc53a0009  ! 3702: STDF_R	std	%f2, [%r9, %r8]
	.word 0xf05a0009  ! 3702: LDX_R	ldx	[%r8 + %r9], %r24
	.word 0x3c800001  ! 3702: BPOS	bpos,a	<label_0x1>
	.word 0xd8720009  ! 3705: STX_R	stx	%r12, [%r8 + %r9]
	.word 0xeb1a0009  ! 3705: LDDF_R	ldd	[%r8, %r9], %f21
	.word 0xc36a272c  ! 3705: PREFETCH_I	prefetch	[%r8 + 0x072c], #one_read
	.word 0xc4320009  ! 3708: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xe65a0009  ! 3708: LDX_R	ldx	[%r8 + %r9], %r19
	.word 0x8143c000  ! 3708: STBAR	stbar
	.word 0xce2a0009  ! 3711: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xd60a0009  ! 3711: LDUB_R	ldub	[%r8 + %r9], %r11
	.word 0xc6da1009  ! 3711: LDXA_R	ldxa	[%r8, %r9] 0x80, %r3
	.word 0xda220009  ! 3714: STW_R	stw	%r13, [%r8 + %r9]
	.word 0xe45a0009  ! 3714: LDX_R	ldx	[%r8 + %r9], %r18
	.word 0xc2422d9c  ! 3714: LDSW_I	ldsw	[%r8 + 0x0d9c], %r1
	.word 0xe0220009  ! 3717: STW_R	stw	%r16, [%r8 + %r9]
	.word 0xee520009  ! 3717: LDSH_R	ldsh	[%r8 + %r9], %r23
	.word 0xb0720009  ! 3717: UDIV_R	udiv 	%r8, %r9, %r24
	.word 0xc73a0009  ! 3720: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc8120009  ! 3720: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xce0a2ad4  ! 3720: LDUB_I	ldub	[%r8 + 0x0ad4], %r7
	.word 0xd73a0009  ! 3723: STDF_R	std	%f11, [%r9, %r8]
	.word 0xed020009  ! 3723: LDF_R	ld	[%r8, %r9], %f22
	.word 0x1a800001  ! 3723: BCC	bcc  	<label_0x1>
	.word 0xc22a0009  ! 3726: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc65a0009  ! 3726: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xe2a2298c  ! 3726: STWA_I	stwa	%r17, [%r8 + 0x098c] %asi
	.word 0xcb220009  ! 3729: STF_R	st	%f5, [%r9, %r8]
	.word 0xfa5a0009  ! 3729: LDX_R	ldx	[%r8 + %r9], %r29
	.word 0xf64a0009  ! 3729: LDSB_R	ldsb	[%r8 + %r9], %r27
	.word 0xc82a0009  ! 3732: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xfa4a0009  ! 3732: LDSB_R	ldsb	[%r8 + %r9], %r29
	.word 0xe3220009  ! 3732: STF_R	st	%f17, [%r9, %r8]
	.word 0xcd220009  ! 3735: STF_R	st	%f6, [%r9, %r8]
	.word 0xca020009  ! 3735: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0x9ba20829  ! 3735: FADDs	fadds	%f8, %f9, %f13
	.word 0xda720009  ! 3738: STX_R	stx	%r13, [%r8 + %r9]
	.word 0xc64a0009  ! 3738: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xd87a2270  ! 3738: SWAP_I	swap	%r12, [%r8 + 0x0270]
	.word 0xce220009  ! 3741: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xcb1a0009  ! 3741: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xcaa21009  ! 3741: STWA_R	stwa	%r5, [%r8 + %r9] 0x80
	.word 0xcd220009  ! 3744: STF_R	st	%f6, [%r9, %r8]
	.word 0xc4520009  ! 3744: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xcfe22009  ! 3744: CASA_R	casa	[%r8] %asi, %r9, %r7
	.word 0xc6720009  ! 3747: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc8520009  ! 3747: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0x40000001  ! 3747: CALL	call	disp30_1
	.word 0xcf3a0009  ! 3750: STDF_R	std	%f7, [%r9, %r8]
	.word 0xce020009  ! 3750: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xc36a2958  ! 3750: PREFETCH_I	prefetch	[%r8 + 0x0958], #one_read
	.word 0xc62a0009  ! 3753: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xea420009  ! 3753: LDSW_R	ldsw	[%r8 + %r9], %r21
	.word 0x8143e055  ! 3753: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside | #Sync 
	.word 0xf62a0009  ! 3756: STB_R	stb	%r27, [%r8 + %r9]
	.word 0xf0120009  ! 3756: LDUH_R	lduh	[%r8 + %r9], %r24
	.word 0x82fa0009  ! 3756: SDIVcc_R	sdivcc 	%r8, %r9, %r1
	.word 0xdd3a0009  ! 3759: STDF_R	std	%f14, [%r9, %r8]
	.word 0xf2120009  ! 3759: LDUH_R	lduh	[%r8 + %r9], %r25
	.word 0x8e6a0009  ! 3759: UDIVX_R	udivx 	%r8, %r9, %r7
	.word 0xca220009  ! 3762: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xca4a0009  ! 3762: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xcbe22009  ! 3762: CASA_R	casa	[%r8] %asi, %r9, %r5
	.word 0xe93a0009  ! 3765: STDF_R	std	%f20, [%r9, %r8]
	.word 0xdc4a0009  ! 3765: LDSB_R	ldsb	[%r8 + %r9], %r14
	.word 0xc7e21009  ! 3765: CASA_I	casa	[%r8] 0x80, %r9, %r3
	.word 0xda720009  ! 3768: STX_R	stx	%r13, [%r8 + %r9]
	.word 0xd7020009  ! 3768: LDF_R	ld	[%r8, %r9], %f11
	.word 0xc36a22bc  ! 3768: PREFETCH_I	prefetch	[%r8 + 0x02bc], #one_read
	.word 0xc4320009  ! 3771: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xfb1a0009  ! 3771: LDDF_R	ldd	[%r8, %r9], %f29
	.word 0xce6a0009  ! 3771: LDSTUB_R	ldstub	%r7, [%r8 + %r9]
	.word 0xce2a0009  ! 3774: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xf0420009  ! 3774: LDSW_R	ldsw	[%r8 + %r9], %r24
	.word 0xac5a0009  ! 3774: SMUL_R	smul 	%r8, %r9, %r22
	.word 0xcb3a0009  ! 3777: STDF_R	std	%f5, [%r9, %r8]
	.word 0xc3020009  ! 3777: LDF_R	ld	[%r8, %r9], %f1
	.word 0xccb226b0  ! 3777: STHA_I	stha	%r6, [%r8 + 0x06b0] %asi
	.word 0xfd220009  ! 3780: STF_R	st	%f30, [%r9, %r8]
	.word 0xce120009  ! 3780: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xc89a2860  ! 3780: LDDA_I	ldda	[%r8, + 0x0860] %asi, %r4
	.word 0xf6720009  ! 3783: STX_R	stx	%r27, [%r8 + %r9]
	.word 0xcc4a0009  ! 3783: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0x2eca0001  ! 3783: BRGEZ	brgez,a,pt	%8,<label_0xa0001>
	.word 0xcb3a0009  ! 3786: STDF_R	std	%f5, [%r9, %r8]
	.word 0xcb020009  ! 3786: LDF_R	ld	[%r8, %r9], %f5
	.word 0xdc8a1009  ! 3786: LDUBA_R	lduba	[%r8, %r9] 0x80, %r14
	.word 0xca220009  ! 3789: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xdc4a0009  ! 3789: LDSB_R	ldsb	[%r8 + %r9], %r14
	.word 0xe8ba1009  ! 3789: STDA_R	stda	%r20, [%r8 + %r9] 0x80
	.word 0xeb3a0009  ! 3792: STDF_R	std	%f21, [%r9, %r8]
	.word 0xc2420009  ! 3792: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0x827a23a8  ! 3792: SDIV_I	sdiv 	%r8, 0x03a8, %r1
	.word 0xc8320009  ! 3795: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xca420009  ! 3795: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xe8520009  ! 3795: LDSH_R	ldsh	[%r8 + %r9], %r20
	.word 0xc2220009  ! 3798: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xde020009  ! 3798: LDUW_R	lduw	[%r8 + %r9], %r15
	.word 0x8e6a0009  ! 3798: UDIVX_R	udivx 	%r8, %r9, %r7
	.word 0xc42a0009  ! 3801: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc4420009  ! 3801: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0x856a0009  ! 3801: SDIVX_R	sdivx	%r8, %r9, %r2
	.word 0xcf220009  ! 3804: STF_R	st	%f7, [%r9, %r8]
	.word 0xce0a0009  ! 3804: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xdeaa2424  ! 3804: STBA_I	stba	%r15, [%r8 + 0x0424] %asi
	.word 0xc2320009  ! 3807: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xdd020009  ! 3807: LDF_R	ld	[%r8, %r9], %f14
	.word 0x0cc20001  ! 3807: BRGZ	brgz  ,nt	%8,<label_0x20001>
	.word 0xce2a0009  ! 3810: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc84a0009  ! 3810: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xc36a23fc  ! 3810: PREFETCH_I	prefetch	[%r8 + 0x03fc], #one_read
	.word 0xc2720009  ! 3813: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xee020009  ! 3813: LDUW_R	lduw	[%r8 + %r9], %r23
	.word 0x8da209a9  ! 3813: FDIVs	fdivs	%f8, %f9, %f6
	.word 0xcb220009  ! 3816: STF_R	st	%f5, [%r9, %r8]
	.word 0xce5a0009  ! 3816: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xc3ea1009  ! 3816: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xcf220009  ! 3819: STF_R	st	%f7, [%r9, %r8]
	.word 0xfb1a0009  ! 3819: LDDF_R	ldd	[%r8, %r9], %f29
	.word 0xc36a2900  ! 3819: PREFETCH_I	prefetch	[%r8 + 0x0900], #one_read
	.word 0xea720009  ! 3822: STX_R	stx	%r21, [%r8 + %r9]
	.word 0xc80a0009  ! 3822: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0x8143c000  ! 3822: STBAR	stbar
	.word 0xcd220009  ! 3825: STF_R	st	%f6, [%r9, %r8]
	.word 0xce120009  ! 3825: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xc01a22d0  ! 3825: LDD_I	ldd	[%r8 + 0x02d0], %r0
	.word 0xcb3a0009  ! 3828: STDF_R	std	%f5, [%r9, %r8]
	.word 0xda4a0009  ! 3828: LDSB_R	ldsb	[%r8 + %r9], %r13
	.word 0x87222828  ! 3828: MULScc_I	mulscc 	%r8, 0x0828, %r3
	.word 0xc6220009  ! 3831: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xca120009  ! 3831: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xe8aa2a5c  ! 3831: STBA_I	stba	%r20, [%r8 + 0x0a5c] %asi
	.word 0xc62a0009  ! 3834: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xca420009  ! 3834: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xce420009  ! 3834: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xfc220009  ! 3837: STW_R	stw	%r30, [%r8 + %r9]
	.word 0xdc5a0009  ! 3837: LDX_R	ldx	[%r8 + %r9], %r14
	.word 0xc3ea1009  ! 3837: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xfb220009  ! 3840: STF_R	st	%f29, [%r9, %r8]
	.word 0xcf020009  ! 3840: LDF_R	ld	[%r8, %r9], %f7
	.word 0x26800001  ! 3840: BL	bl,a	<label_0x1>
	.word 0xce320009  ! 3843: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xce5a0009  ! 3843: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0x8143e047  ! 3843: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Sync 
	.word 0xcc320009  ! 3846: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc64a0009  ! 3846: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xbc5225ac  ! 3846: UMUL_I	umul 	%r8, 0x05ac, %r30
	.word 0xee220009  ! 3849: STW_R	stw	%r23, [%r8 + %r9]
	.word 0xd7020009  ! 3849: LDF_R	ld	[%r8, %r9], %f11
	.word 0x99a209a9  ! 3849: FDIVs	fdivs	%f8, %f9, %f12
	.word 0xc42a0009  ! 3852: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xd8520009  ! 3852: LDSH_R	ldsh	[%r8 + %r9], %r12
	.word 0xaba20829  ! 3852: FADDs	fadds	%f8, %f9, %f21
	.word 0xf3220009  ! 3855: STF_R	st	%f25, [%r9, %r8]
	.word 0xc25a0009  ! 3855: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0x8143e042  ! 3855: MEMBAR	membar	#StoreLoad | #Sync 
	.word 0xc22a0009  ! 3858: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xf64a0009  ! 3858: LDSB_R	ldsb	[%r8 + %r9], %r27
	.word 0xcf022434  ! 3858: LDF_I	ld	[%r8, 0x0434], %f7
	.word 0xcb220009  ! 3861: STF_R	st	%f5, [%r9, %r8]
	.word 0xce0a0009  ! 3861: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0x827a0009  ! 3861: SDIV_R	sdiv 	%r8, %r9, %r1
	.word 0xfe320009  ! 3864: STH_R	sth	%r31, [%r8 + %r9]
	.word 0xdc4a0009  ! 3864: LDSB_R	ldsb	[%r8 + %r9], %r14
	.word 0xcca21009  ! 3864: STWA_R	stwa	%r6, [%r8 + %r9] 0x80
	.word 0xce720009  ! 3867: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc8420009  ! 3867: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0x8143c000  ! 3867: STBAR	stbar
	.word 0xcf220009  ! 3870: STF_R	st	%f7, [%r9, %r8]
	.word 0xc2520009  ! 3870: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xeeaa20dc  ! 3870: STBA_I	stba	%r23, [%r8 + 0x00dc] %asi
	.word 0xc33a0009  ! 3873: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc4520009  ! 3873: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xc6f21009  ! 3873: STXA_R	stxa	%r3, [%r8 + %r9] 0x80
	.word 0xe6320009  ! 3876: STH_R	sth	%r19, [%r8 + %r9]
	.word 0xde120009  ! 3876: LDUH_R	lduh	[%r8 + %r9], %r15
	.word 0xc3ea1009  ! 3876: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xdb220009  ! 3879: STF_R	st	%f13, [%r9, %r8]
	.word 0xf0020009  ! 3879: LDUW_R	lduw	[%r8 + %r9], %r24
	.word 0xc3ea1009  ! 3879: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc2720009  ! 3882: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xf3020009  ! 3882: LDF_R	ld	[%r8, %r9], %f25
	.word 0x9a5a0009  ! 3882: SMUL_R	smul 	%r8, %r9, %r13
	.word 0xcb220009  ! 3885: STF_R	st	%f5, [%r9, %r8]
	.word 0xfa520009  ! 3885: LDSH_R	ldsh	[%r8 + %r9], %r29
	.word 0xca520009  ! 3885: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xcd220009  ! 3888: STF_R	st	%f6, [%r9, %r8]
	.word 0xc2120009  ! 3888: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0x8143e023  ! 3888: MEMBAR	membar	#LoadLoad | #StoreLoad | #MemIssue 
	.word 0xc6320009  ! 3891: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xca120009  ! 3891: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xfc6a25c4  ! 3891: LDSTUB_I	ldstub	%r30, [%r8 + 0x05c4]
	.word 0xca220009  ! 3894: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc40a0009  ! 3894: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0x8143e01d  ! 3894: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside 
	.word 0xe42a0009  ! 3897: STB_R	stb	%r18, [%r8 + %r9]
	.word 0xce020009  ! 3897: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xe3222a00  ! 3897: STF_I	st	%f17, [0x0a00, %r8]
	.word 0xf0220009  ! 3900: STW_R	stw	%r24, [%r8 + %r9]
	.word 0xc8120009  ! 3900: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0x06ca0001  ! 3900: BRLZ	brlz  ,pt	%8,<label_0xa0001>
	.word 0xe53a0009  ! 3903: STDF_R	std	%f18, [%r9, %r8]
	.word 0xc4020009  ! 3903: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0x9e5a2a08  ! 3903: SMUL_I	smul 	%r8, 0x0a08, %r15
	.word 0xee320009  ! 3906: STH_R	sth	%r23, [%r8 + %r9]
	.word 0xf9020009  ! 3906: LDF_R	ld	[%r8, %r9], %f28
	.word 0x26c20001  ! 3906: BRLZ	brlz,a,nt	%8,<label_0x20001>
	.word 0xe9220009  ! 3909: STF_R	st	%f20, [%r9, %r8]
	.word 0xce0a0009  ! 3909: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xf1220009  ! 3909: STF_R	st	%f24, [%r9, %r8]
	.word 0xe3220009  ! 3912: STF_R	st	%f17, [%r9, %r8]
	.word 0xcc120009  ! 3912: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xc3ea2a04  ! 3912: PREFETCHA_I	prefetcha	[%r8, + 0x0a04] %asi, #one_read
	.word 0xcd3a0009  ! 3915: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc6120009  ! 3915: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xee7a28d4  ! 3915: SWAP_I	swap	%r23, [%r8 + 0x08d4]
	.word 0xce2a0009  ! 3918: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc8120009  ! 3918: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xdab21009  ! 3918: STHA_R	stha	%r13, [%r8 + %r9] 0x80
	.word 0xfa220009  ! 3921: STW_R	stw	%r29, [%r8 + %r9]
	.word 0xcc4a0009  ! 3921: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xa3222ce4  ! 3921: MULScc_I	mulscc 	%r8, 0x0ce4, %r17
	.word 0xe8320009  ! 3924: STH_R	sth	%r20, [%r8 + %r9]
	.word 0xc4020009  ! 3924: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xb4720009  ! 3924: UDIV_R	udiv 	%r8, %r9, %r26
	.word 0xdb3a0009  ! 3927: STDF_R	std	%f13, [%r9, %r8]
	.word 0xca020009  ! 3927: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xfdf22009  ! 3927: CASXA_R	casxa	[%r8]%asi, %r9, %r30
	.word 0xc3220009  ! 3930: STF_R	st	%f1, [%r9, %r8]
	.word 0xc20a0009  ! 3930: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xc84a0009  ! 3930: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xfd220009  ! 3933: STF_R	st	%f30, [%r9, %r8]
	.word 0xf0120009  ! 3933: LDUH_R	lduh	[%r8 + %r9], %r24
	.word 0x8ba209a9  ! 3933: FDIVs	fdivs	%f8, %f9, %f5
	.word 0xe33a0009  ! 3936: STDF_R	std	%f17, [%r9, %r8]
	.word 0xd64a0009  ! 3936: LDSB_R	ldsb	[%r8 + %r9], %r11
	.word 0xc3ea1009  ! 3936: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xca220009  ! 3939: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xce420009  ! 3939: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xcbf22009  ! 3939: CASXA_R	casxa	[%r8]%asi, %r9, %r5
	.word 0xcb3a0009  ! 3942: STDF_R	std	%f5, [%r9, %r8]
	.word 0xdd020009  ! 3942: LDF_R	ld	[%r8, %r9], %f14
	.word 0x14800002  ! 3942: BG	bg  	<label_0x2>
	.word 0xd6220009  ! 3945: STW_R	stw	%r11, [%r8 + %r9]
	.word 0xf80a0009  ! 3945: LDUB_R	ldub	[%r8 + %r9], %r28
	.word 0xc2020009  ! 3945: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xe6320009  ! 3948: STH_R	sth	%r19, [%r8 + %r9]
	.word 0xea120009  ! 3948: LDUH_R	lduh	[%r8 + %r9], %r21
	.word 0xc8ba2f40  ! 3948: STDA_I	stda	%r4, [%r8 + 0x0f40] %asi
	.word 0xcb220009  ! 3951: STF_R	st	%f5, [%r9, %r8]
	.word 0xc8420009  ! 3951: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xc26a2cec  ! 3951: LDSTUB_I	ldstub	%r1, [%r8 + 0x0cec]
	.word 0xf2720009  ! 3954: STX_R	stx	%r25, [%r8 + %r9]
	.word 0xc5020009  ! 3954: LDF_R	ld	[%r8, %r9], %f2
	.word 0xf01a29a8  ! 3954: LDD_I	ldd	[%r8 + 0x09a8], %r24
	.word 0xc82a0009  ! 3957: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xcb020009  ! 3957: LDF_R	ld	[%r8, %r9], %f5
	.word 0x83220009  ! 3957: MULScc_R	mulscc 	%r8, %r9, %r1
	.word 0xfe220009  ! 3960: STW_R	stw	%r31, [%r8 + %r9]
	.word 0xca520009  ! 3960: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xe45a2600  ! 3960: LDX_I	ldx	[%r8 + 0x0600], %r18
	.word 0xc42a0009  ! 3963: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xdb020009  ! 3963: LDF_R	ld	[%r8, %r9], %f13
	.word 0x0aca0001  ! 3963: BRNZ	brnz  ,pt	%8,<label_0xa0001>
	.word 0xc5220009  ! 3966: STF_R	st	%f2, [%r9, %r8]
	.word 0xdc420009  ! 3966: LDSW_R	ldsw	[%r8 + %r9], %r14
	.word 0xcb222d90  ! 3966: STF_I	st	%f5, [0x0d90, %r8]
	.word 0xe6220009  ! 3969: STW_R	stw	%r19, [%r8 + %r9]
	.word 0xce420009  ! 3969: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xb4522924  ! 3969: UMUL_I	umul 	%r8, 0x0924, %r26
	.word 0xe0220009  ! 3972: STW_R	stw	%r16, [%r8 + %r9]
	.word 0xca420009  ! 3972: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xc36a2a70  ! 3972: PREFETCH_I	prefetch	[%r8 + 0x0a70], #one_read
	.word 0xc2720009  ! 3975: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc9020009  ! 3975: LDF_R	ld	[%r8, %r9], %f4
	.word 0xe4a221c0  ! 3975: STWA_I	stwa	%r18, [%r8 + 0x01c0] %asi
	.word 0xf9220009  ! 3978: STF_R	st	%f28, [%r9, %r8]
	.word 0xd6020009  ! 3978: LDUW_R	lduw	[%r8 + %r9], %r11
	.word 0xc3ea1009  ! 3978: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xca320009  ! 3981: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc64a0009  ! 3981: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xa0d20009  ! 3981: UMULcc_R	umulcc 	%r8, %r9, %r16
	.word 0xec320009  ! 3984: STH_R	sth	%r22, [%r8 + %r9]
	.word 0xca120009  ! 3984: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xe9e22009  ! 3984: CASA_R	casa	[%r8] %asi, %r9, %r20
	.word 0xcd3a0009  ! 3987: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc8020009  ! 3987: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xe2921009  ! 3987: LDUHA_R	lduha	[%r8, %r9] 0x80, %r17
	.word 0xfc2a0009  ! 3990: STB_R	stb	%r30, [%r8 + %r9]
	.word 0xc4020009  ! 3990: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xca822da0  ! 3990: LDUWA_I	lduwa	[%r8, + 0x0da0] %asi, %r5
	.word 0xe33a0009  ! 3993: STDF_R	std	%f17, [%r9, %r8]
	.word 0xc8520009  ! 3993: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xccba1009  ! 3993: STDA_R	stda	%r6, [%r8 + %r9] 0x80
	.word 0xe53a0009  ! 3996: STDF_R	std	%f18, [%r9, %r8]
	.word 0xf80a0009  ! 3996: LDUB_R	ldub	[%r8 + %r9], %r28
	.word 0x89222d20  ! 3996: MULScc_I	mulscc 	%r8, 0x0d20, %r4
	.word 0xef3a0009  ! 3999: STDF_R	std	%f23, [%r9, %r8]
	.word 0xf45a0009  ! 3999: LDX_R	ldx	[%r8 + %r9], %r26
	.word 0xc4a22e34  ! 3999: STWA_I	stwa	%r2, [%r8 + 0x0e34] %asi
        ta      T_GOOD_TRAP

th_main_3:
        setx  MAIN_BASE_DATA_VA, %r1, %r8
        setx  0x0000000000000dd0, %g1, %r9
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
        setx  0x433f041eb26f526e, %g1, %r0
        setx  0xb7a7775264677c29, %g1, %r1
        setx  0x69cc8728d77c1944, %g1, %r2
        setx  0x80d72a46197d2b67, %g1, %r3
        setx  0x995a5abf43fa899e, %g1, %r4
        setx  0x4605e04bec394ab3, %g1, %r5
        setx  0x96f513b3d1f3eaa3, %g1, %r6
        setx  0xdea05a436e2c8737, %g1, %r7
        setx  0xa37e00ef39ad62d1, %g1, %r10
        setx  0x60769bebe0912e43, %g1, %r11
        setx  0x714dc24cc57b1aac, %g1, %r12
        setx  0xe097fc0859d2e91c, %g1, %r13
        setx  0xb34e8c9c887f8dd4, %g1, %r14
        setx  0xc7daa1aa03d9f94a, %g1, %r15
        setx  0x67f2b9d3d76793a6, %g1, %r16
        setx  0xf2440916e548b801, %g1, %r17
        setx  0xdcfa67ee3de17f7e, %g1, %r18
        setx  0xcc9e89cfe6278bab, %g1, %r19
        setx  0x1933504f6b5d2098, %g1, %r20
        setx  0x26991119e3c57f9d, %g1, %r21
        setx  0x71a9cad6dfd8b10c, %g1, %r22
        setx  0x7fe0db5d60f34121, %g1, %r23
        setx  0x953d7f1f3fc9c1b1, %g1, %r24
        setx  0x0fb8a5452813196d, %g1, %r25
        setx  0x5b73e36a3329a9ed, %g1, %r26
        setx  0x27b609bee80a4932, %g1, %r27
        setx  0xe063ffddb52f3683, %g1, %r28
        setx  0x511ce819c6375957, %g1, %r29
        setx  0x6bd8fa0443388a5f, %g1, %r30
        setx  0x7304ac2cd5a8afd1, %g1, %r31
	.word 0xcc220009  ! 3: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc91a0009  ! 3: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0x2a800001  ! 3: BCS	bcs,a	<label_0x1>
	.word 0xca2a0009  ! 6: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xca020009  ! 6: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0x16800001  ! 6: BGE	bge  	<label_0x1>
	.word 0xf7220009  ! 9: STF_R	st	%f27, [%r9, %r8]
	.word 0xf4020009  ! 9: LDUW_R	lduw	[%r8 + %r9], %r26
	.word 0xc47a0009  ! 9: SWAP_R	swap	%r2, [%r8 + %r9]
	.word 0xc9220009  ! 12: STF_R	st	%f4, [%r9, %r8]
	.word 0xe31a0009  ! 12: LDDF_R	ldd	[%r8, %r9], %f17
	.word 0xb45a0009  ! 12: SMUL_R	smul 	%r8, %r9, %r26
	.word 0xc8320009  ! 15: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xd9020009  ! 15: LDF_R	ld	[%r8, %r9], %f12
	.word 0x846a2310  ! 15: UDIVX_I	udivx 	%r8, 0x0310, %r2
	.word 0xed3a0009  ! 18: STDF_R	std	%f22, [%r9, %r8]
	.word 0xf2020009  ! 18: LDUW_R	lduw	[%r8 + %r9], %r25
	.word 0x2c800002  ! 18: BNEG	bneg,a	<label_0x2>
	.word 0xf82a0009  ! 21: STB_R	stb	%r28, [%r8 + %r9]
	.word 0xc6020009  ! 21: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xe8f222e0  ! 21: STXA_I	stxa	%r20, [%r8 + 0x02e0] %asi
	.word 0xc62a0009  ! 24: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xe0420009  ! 24: LDSW_R	ldsw	[%r8 + %r9], %r16
	.word 0xe6a21009  ! 24: STWA_R	stwa	%r19, [%r8 + %r9] 0x80
	.word 0xf3220009  ! 27: STF_R	st	%f25, [%r9, %r8]
	.word 0xdd1a0009  ! 27: LDDF_R	ldd	[%r8, %r9], %f14
	.word 0xc46a29e4  ! 27: LDSTUB_I	ldstub	%r2, [%r8 + 0x09e4]
	.word 0xc8220009  ! 30: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xf51a0009  ! 30: LDDF_R	ldd	[%r8, %r9], %f26
	.word 0x8d6a0009  ! 30: SDIVX_R	sdivx	%r8, %r9, %r6
	.word 0xc93a0009  ! 33: STDF_R	std	%f4, [%r9, %r8]
	.word 0xca120009  ! 33: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xb24a0009  ! 33: MULX_R	mulx 	%r8, %r9, %r25
	.word 0xcf220009  ! 36: STF_R	st	%f7, [%r9, %r8]
	.word 0xcd1a0009  ! 36: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xc3ea248c  ! 36: PREFETCHA_I	prefetcha	[%r8, + 0x048c] %asi, #one_read
	.word 0xc82a0009  ! 39: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xcf020009  ! 39: LDF_R	ld	[%r8, %r9], %f7
	.word 0xc20a27a0  ! 39: LDUB_I	ldub	[%r8 + 0x07a0], %r1
	.word 0xc4720009  ! 42: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xe80a0009  ! 42: LDUB_R	ldub	[%r8 + %r9], %r20
	.word 0xc4ea1009  ! 42: LDSTUBA_R	ldstuba	%r2, [%r8 + %r9] 0x80
	.word 0xc4320009  ! 45: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc71a0009  ! 45: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xcaf21009  ! 45: STXA_R	stxa	%r5, [%r8 + %r9] 0x80
	.word 0xcd220009  ! 48: STF_R	st	%f6, [%r9, %r8]
	.word 0xc51a0009  ! 48: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xc6d2290c  ! 48: LDSHA_I	ldsha	[%r8, + 0x090c] %asi, %r3
	.word 0xfb3a0009  ! 51: STDF_R	std	%f29, [%r9, %r8]
	.word 0xcf020009  ! 51: LDF_R	ld	[%r8, %r9], %f7
	.word 0x8c7226c4  ! 51: UDIV_I	udiv 	%r8, 0x06c4, %r6
	.word 0xee720009  ! 54: STX_R	stx	%r23, [%r8 + %r9]
	.word 0xce520009  ! 54: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xccd22098  ! 54: LDSHA_I	ldsha	[%r8, + 0x0098] %asi, %r6
	.word 0xc42a0009  ! 57: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc65a0009  ! 57: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xccba1009  ! 57: STDA_R	stda	%r6, [%r8 + %r9] 0x80
	.word 0xc7220009  ! 60: STF_R	st	%f3, [%r9, %r8]
	.word 0xce4a0009  ! 60: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xfe020009  ! 60: LDUW_R	lduw	[%r8 + %r9], %r31
	.word 0xe73a0009  ! 63: STDF_R	std	%f19, [%r9, %r8]
	.word 0xc9020009  ! 63: LDF_R	ld	[%r8, %r9], %f4
	.word 0x0e800001  ! 63: BVS	bvs  	<label_0x1>
	.word 0xc6320009  ! 66: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xf51a0009  ! 66: LDDF_R	ldd	[%r8, %r9], %f26
	.word 0xaad20009  ! 66: UMULcc_R	umulcc 	%r8, %r9, %r21
	.word 0xc2320009  ! 69: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xe24a0009  ! 69: LDSB_R	ldsb	[%r8 + %r9], %r17
	.word 0xc6422628  ! 69: LDSW_I	ldsw	[%r8 + 0x0628], %r3
	.word 0xc8320009  ! 72: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xcc5a0009  ! 72: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xc3ea1009  ! 72: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xce720009  ! 75: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xe2420009  ! 75: LDSW_R	ldsw	[%r8 + %r9], %r17
	.word 0xccd22434  ! 75: LDSHA_I	ldsha	[%r8, + 0x0434] %asi, %r6
	.word 0xcd3a0009  ! 78: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc64a0009  ! 78: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0x8143c000  ! 78: STBAR	stbar
	.word 0xc73a0009  ! 81: STDF_R	std	%f3, [%r9, %r8]
	.word 0xec120009  ! 81: LDUH_R	lduh	[%r8 + %r9], %r22
	.word 0x8143e066  ! 81: MEMBAR	membar	#StoreLoad | #LoadStore | #MemIssue | #Sync 
	.word 0xcc320009  ! 84: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xee520009  ! 84: LDSH_R	ldsh	[%r8 + %r9], %r23
	.word 0xc902274c  ! 84: LDF_I	ld	[%r8, 0x074c], %f4
	.word 0xc3220009  ! 87: STF_R	st	%f1, [%r9, %r8]
	.word 0xe71a0009  ! 87: LDDF_R	ldd	[%r8, %r9], %f19
	.word 0xc2420009  ! 87: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xc6220009  ! 90: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc85a0009  ! 90: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xcb22262c  ! 90: STF_I	st	%f5, [0x062c, %r8]
	.word 0xc5220009  ! 93: STF_R	st	%f2, [%r9, %r8]
	.word 0xc80a0009  ! 93: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xc8ba1009  ! 93: STDA_R	stda	%r4, [%r8 + %r9] 0x80
	.word 0xcf220009  ! 96: STF_R	st	%f7, [%r9, %r8]
	.word 0xce020009  ! 96: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0x30800001  ! 96: BA	ba,a	<label_0x1>
	.word 0xf1220009  ! 99: STF_R	st	%f24, [%r9, %r8]
	.word 0xc8520009  ! 99: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xe3222994  ! 99: STF_I	st	%f17, [0x0994, %r8]
	.word 0xc8220009  ! 102: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc85a0009  ! 102: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xdeb22bac  ! 102: STHA_I	stha	%r15, [%r8 + 0x0bac] %asi
	.word 0xca2a0009  ! 105: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xe24a0009  ! 105: LDSB_R	ldsb	[%r8 + %r9], %r17
	.word 0x88fa2bc8  ! 105: SDIVcc_I	sdivcc 	%r8, 0x0bc8, %r4
	.word 0xc8320009  ! 108: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xcc5a0009  ! 108: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0x8143c000  ! 108: STBAR	stbar
	.word 0xc62a0009  ! 111: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xcc520009  ! 111: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xc9e21009  ! 111: CASA_I	casa	[%r8] 0x80, %r9, %r4
	.word 0xc22a0009  ! 114: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xe2120009  ! 114: LDUH_R	lduh	[%r8 + %r9], %r17
	.word 0xc72223a4  ! 114: STF_I	st	%f3, [0x03a4, %r8]
	.word 0xcc2a0009  ! 117: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xf25a0009  ! 117: LDX_R	ldx	[%r8 + %r9], %r25
	.word 0xccba2918  ! 117: STDA_I	stda	%r6, [%r8 + 0x0918] %asi
	.word 0xc22a0009  ! 120: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xce5a0009  ! 120: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xc8ba2718  ! 120: STDA_I	stda	%r4, [%r8 + 0x0718] %asi
	.word 0xc22a0009  ! 123: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xcd1a0009  ! 123: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xc3e22009  ! 123: CASA_R	casa	[%r8] %asi, %r9, %r1
	.word 0xca220009  ! 126: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xcc0a0009  ! 126: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0x8143e00b  ! 126: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore 
	.word 0xe53a0009  ! 129: STDF_R	std	%f18, [%r9, %r8]
	.word 0xda0a0009  ! 129: LDUB_R	ldub	[%r8 + %r9], %r13
	.word 0xc3ea1009  ! 129: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc22a0009  ! 132: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xcc4a0009  ! 132: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0x8da208a9  ! 132: FSUBs	fsubs	%f8, %f9, %f6
	.word 0xce220009  ! 135: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc7020009  ! 135: LDF_R	ld	[%r8, %r9], %f3
	.word 0x83a20829  ! 135: FADDs	fadds	%f8, %f9, %f1
	.word 0xca2a0009  ! 138: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xce5a0009  ! 138: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xccea1009  ! 138: LDSTUBA_R	ldstuba	%r6, [%r8 + %r9] 0x80
	.word 0xc2320009  ! 141: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xea5a0009  ! 141: LDX_R	ldx	[%r8 + %r9], %r21
	.word 0x8143c000  ! 141: STBAR	stbar
	.word 0xcb3a0009  ! 144: STDF_R	std	%f5, [%r9, %r8]
	.word 0xc84a0009  ! 144: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xfc1a2bf8  ! 144: LDD_I	ldd	[%r8 + 0x0bf8], %r30
	.word 0xda2a0009  ! 147: STB_R	stb	%r13, [%r8 + %r9]
	.word 0xdd1a0009  ! 147: LDDF_R	ldd	[%r8, %r9], %f14
	.word 0xc8ca1009  ! 147: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r4
	.word 0xe62a0009  ! 150: STB_R	stb	%r19, [%r8 + %r9]
	.word 0xce4a0009  ! 150: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0x84722c3c  ! 150: UDIV_I	udiv 	%r8, 0x0c3c, %r2
	.word 0xe42a0009  ! 153: STB_R	stb	%r18, [%r8 + %r9]
	.word 0xc4520009  ! 153: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xcc0a0009  ! 153: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xc2320009  ! 156: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xe24a0009  ! 156: LDSB_R	ldsb	[%r8 + %r9], %r17
	.word 0x88fa21dc  ! 156: SDIVcc_I	sdivcc 	%r8, 0x01dc, %r4
	.word 0xce2a0009  ! 159: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc6020009  ! 159: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xc4ba1009  ! 159: STDA_R	stda	%r2, [%r8 + %r9] 0x80
	.word 0xce220009  ! 162: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc8520009  ! 162: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0x8eda0009  ! 162: SMULcc_R	smulcc 	%r8, %r9, %r7
	.word 0xc6320009  ! 165: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xce520009  ! 165: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xc8520009  ! 165: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xcc2a0009  ! 168: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xcd1a0009  ! 168: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xa67a0009  ! 168: SDIV_R	sdiv 	%r8, %r9, %r19
	.word 0xff3a0009  ! 171: STDF_R	std	%f31, [%r9, %r8]
	.word 0xdd1a0009  ! 171: LDDF_R	ldd	[%r8, %r9], %f14
	.word 0x9ba20829  ! 171: FADDs	fadds	%f8, %f9, %f13
	.word 0xc4220009  ! 174: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc9020009  ! 174: LDF_R	ld	[%r8, %r9], %f4
	.word 0xcf220009  ! 174: STF_R	st	%f7, [%r9, %r8]
	.word 0xca2a0009  ! 177: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xf04a0009  ! 177: LDSB_R	ldsb	[%r8 + %r9], %r24
	.word 0xcef21009  ! 177: STXA_R	stxa	%r7, [%r8 + %r9] 0x80
	.word 0xe4720009  ! 180: STX_R	stx	%r18, [%r8 + %r9]
	.word 0xca020009  ! 180: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xc46a0009  ! 180: LDSTUB_R	ldstub	%r2, [%r8 + %r9]
	.word 0xca720009  ! 183: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc40a0009  ! 183: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xd642228c  ! 183: LDSW_I	ldsw	[%r8 + 0x028c], %r11
	.word 0xc8220009  ! 186: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xd71a0009  ! 186: LDDF_R	ldd	[%r8, %r9], %f11
	.word 0xc3ea1009  ! 186: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xcf3a0009  ! 189: STDF_R	std	%f7, [%r9, %r8]
	.word 0xd64a0009  ! 189: LDSB_R	ldsb	[%r8 + %r9], %r11
	.word 0x2c800001  ! 189: BNEG	bneg,a	<label_0x1>
	.word 0xf4720009  ! 192: STX_R	stx	%r26, [%r8 + %r9]
	.word 0xce020009  ! 192: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xc5220009  ! 192: STF_R	st	%f2, [%r9, %r8]
	.word 0xc6320009  ! 195: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xca420009  ! 195: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xc81221c8  ! 195: LDUH_I	lduh	[%r8 + 0x01c8], %r4
	.word 0xc4720009  ! 198: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xe6020009  ! 198: LDUW_R	lduw	[%r8 + %r9], %r19
	.word 0xed3a2f28  ! 198: STDF_I	std	%f22, [0x0f28, %r8]
	.word 0xc8220009  ! 201: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xd7020009  ! 201: LDF_R	ld	[%r8, %r9], %f11
	.word 0x84fa0009  ! 201: SDIVcc_R	sdivcc 	%r8, %r9, %r2
	.word 0xc8220009  ! 204: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xfc4a0009  ! 204: LDSB_R	ldsb	[%r8 + %r9], %r30
	.word 0x82fa238c  ! 204: SDIVcc_I	sdivcc 	%r8, 0x038c, %r1
	.word 0xe7220009  ! 207: STF_R	st	%f19, [%r9, %r8]
	.word 0xca520009  ! 207: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0x8ef22730  ! 207: UDIVcc_I	udivcc 	%r8, 0x0730, %r7
	.word 0xc2720009  ! 210: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xcd020009  ! 210: LDF_R	ld	[%r8, %r9], %f6
	.word 0xc36a2dd0  ! 210: PREFETCH_I	prefetch	[%r8 + 0x0dd0], #one_read
	.word 0xc8320009  ! 213: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xf9020009  ! 213: LDF_R	ld	[%r8, %r9], %f28
	.word 0x82520009  ! 213: UMUL_R	umul 	%r8, %r9, %r1
	.word 0xc22a0009  ! 216: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xca4a0009  ! 216: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0x2eca0001  ! 216: BRGEZ	brgez,a,pt	%8,<label_0xa0001>
	.word 0xc4720009  ! 219: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc64a0009  ! 219: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xc73a0009  ! 219: STDF_R	std	%f3, [%r9, %r8]
	.word 0xe42a0009  ! 222: STB_R	stb	%r18, [%r8 + %r9]
	.word 0xfe020009  ! 222: LDUW_R	lduw	[%r8 + %r9], %r31
	.word 0xbad20009  ! 222: UMULcc_R	umulcc 	%r8, %r9, %r29
	.word 0xf6320009  ! 225: STH_R	sth	%r27, [%r8 + %r9]
	.word 0xc40a0009  ! 225: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0x89a209a9  ! 225: FDIVs	fdivs	%f8, %f9, %f4
	.word 0xc82a0009  ! 228: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xce0a0009  ! 228: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xb1a20929  ! 228: FMULs	fmuls	%f8, %f9, %f24
	.word 0xfe220009  ! 231: STW_R	stw	%r31, [%r8 + %r9]
	.word 0xfc420009  ! 231: LDSW_R	ldsw	[%r8 + %r9], %r30
	.word 0x85a209a9  ! 231: FDIVs	fdivs	%f8, %f9, %f2
	.word 0xc7220009  ! 234: STF_R	st	%f3, [%r9, %r8]
	.word 0xc80a0009  ! 234: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xc33a0009  ! 234: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc6320009  ! 237: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xcf1a0009  ! 237: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0x82da0009  ! 237: SMULcc_R	smulcc 	%r8, %r9, %r1
	.word 0xc2320009  ! 240: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc84a0009  ! 240: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xf0f21009  ! 240: STXA_R	stxa	%r24, [%r8 + %r9] 0x80
	.word 0xc73a0009  ! 243: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc40a0009  ! 243: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xccda26f0  ! 243: LDXA_I	ldxa	[%r8, + 0x06f0] %asi, %r6
	.word 0xcb220009  ! 246: STF_R	st	%f5, [%r9, %r8]
	.word 0xc4020009  ! 246: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xca020009  ! 246: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xc33a0009  ! 249: STDF_R	std	%f1, [%r9, %r8]
	.word 0xd91a0009  ! 249: LDDF_R	ldd	[%r8, %r9], %f12
	.word 0xcca22644  ! 249: STWA_I	stwa	%r6, [%r8 + 0x0644] %asi
	.word 0xc4220009  ! 252: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xce5a0009  ! 252: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0x8143e076  ! 252: MEMBAR	membar	#StoreLoad | #LoadStore | #Lookaside | #MemIssue | #Sync 
	.word 0xc9220009  ! 255: STF_R	st	%f4, [%r9, %r8]
	.word 0xe0420009  ! 255: LDSW_R	ldsw	[%r8 + %r9], %r16
	.word 0x866a201c  ! 255: UDIVX_I	udivx 	%r8, 0x001c, %r3
	.word 0xcd220009  ! 258: STF_R	st	%f6, [%r9, %r8]
	.word 0xcb1a0009  ! 258: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xce022bc0  ! 258: LDUW_I	lduw	[%r8 + 0x0bc0], %r7
	.word 0xc6320009  ! 261: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc4520009  ! 261: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0x8143c000  ! 261: STBAR	stbar
	.word 0xc6320009  ! 264: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc3020009  ! 264: LDF_R	ld	[%r8, %r9], %f1
	.word 0x84da0009  ! 264: SMULcc_R	smulcc 	%r8, %r9, %r2
	.word 0xca2a0009  ! 267: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc31a0009  ! 267: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0x2a800002  ! 267: BCS	bcs,a	<label_0x2>
	.word 0xc6720009  ! 270: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xf25a0009  ! 270: LDX_R	ldx	[%r8 + %r9], %r25
	.word 0xedf21009  ! 270: CASXA_I	casxa	[%r8] 0x80, %r9, %r22
	.word 0xc5220009  ! 273: STF_R	st	%f2, [%r9, %r8]
	.word 0xc40a0009  ! 273: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xd8f21009  ! 273: STXA_R	stxa	%r12, [%r8 + %r9] 0x80
	.word 0xc8720009  ! 276: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xcb1a0009  ! 276: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0x8143c000  ! 276: STBAR	stbar
	.word 0xc8320009  ! 279: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc64a0009  ! 279: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xde02211c  ! 279: LDUW_I	lduw	[%r8 + 0x011c], %r15
	.word 0xcf3a0009  ! 282: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc2120009  ! 282: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xe4822d1c  ! 282: LDUWA_I	lduwa	[%r8, + 0x0d1c] %asi, %r18
	.word 0xe73a0009  ! 285: STDF_R	std	%f19, [%r9, %r8]
	.word 0xc24a0009  ! 285: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xf4b22d40  ! 285: STHA_I	stha	%r26, [%r8 + 0x0d40] %asi
	.word 0xee320009  ! 288: STH_R	sth	%r23, [%r8 + %r9]
	.word 0xca4a0009  ! 288: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0x8b2229e0  ! 288: MULScc_I	mulscc 	%r8, 0x09e0, %r5
	.word 0xfd220009  ! 291: STF_R	st	%f30, [%r9, %r8]
	.word 0xc40a0009  ! 291: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0x896a0009  ! 291: SDIVX_R	sdivx	%r8, %r9, %r4
	.word 0xc22a0009  ! 294: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xec020009  ! 294: LDUW_R	lduw	[%r8 + %r9], %r22
	.word 0x82da0009  ! 294: SMULcc_R	smulcc 	%r8, %r9, %r1
	.word 0xce320009  ! 297: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xca020009  ! 297: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0x8143c000  ! 297: STBAR	stbar
	.word 0xc33a0009  ! 300: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc85a0009  ! 300: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0x1c800001  ! 300: BPOS	bpos  	<label_0x1>
	.word 0xc22a0009  ! 303: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xe65a0009  ! 303: LDX_R	ldx	[%r8 + %r9], %r19
	.word 0x8143c000  ! 303: STBAR	stbar
	.word 0xc93a0009  ! 306: STDF_R	std	%f4, [%r9, %r8]
	.word 0xcc4a0009  ! 306: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0x87220009  ! 306: MULScc_R	mulscc 	%r8, %r9, %r3
	.word 0xde2a0009  ! 309: STB_R	stb	%r15, [%r8 + %r9]
	.word 0xca0a0009  ! 309: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xc9f22009  ! 309: CASXA_R	casxa	[%r8]%asi, %r9, %r4
	.word 0xc9220009  ! 312: STF_R	st	%f4, [%r9, %r8]
	.word 0xca420009  ! 312: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xc28222c0  ! 312: LDUWA_I	lduwa	[%r8, + 0x02c0] %asi, %r1
	.word 0xc8720009  ! 315: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xf2120009  ! 315: LDUH_R	lduh	[%r8 + %r9], %r25
	.word 0x00800002  ! 315: BN	bn  	<label_0x2>
	.word 0xc2720009  ! 318: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xcd020009  ! 318: LDF_R	ld	[%r8, %r9], %f6
	.word 0x3c800002  ! 318: BPOS	bpos,a	<label_0x2>
	.word 0xce2a0009  ! 321: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xcc420009  ! 321: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0x24800001  ! 321: BLE	ble,a	<label_0x1>
	.word 0xcb3a0009  ! 324: STDF_R	std	%f5, [%r9, %r8]
	.word 0xda520009  ! 324: LDSH_R	ldsh	[%r8 + %r9], %r13
	.word 0xc4022bac  ! 324: LDUW_I	lduw	[%r8 + 0x0bac], %r2
	.word 0xf4220009  ! 327: STW_R	stw	%r26, [%r8 + %r9]
	.word 0xcb1a0009  ! 327: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0x85a209a9  ! 327: FDIVs	fdivs	%f8, %f9, %f2
	.word 0xee720009  ! 330: STX_R	stx	%r23, [%r8 + %r9]
	.word 0xca4a0009  ! 330: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0x83222668  ! 330: MULScc_I	mulscc 	%r8, 0x0668, %r1
	.word 0xde320009  ! 333: STH_R	sth	%r15, [%r8 + %r9]
	.word 0xc8020009  ! 333: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xa3a20929  ! 333: FMULs	fmuls	%f8, %f9, %f17
	.word 0xcb3a0009  ! 336: STDF_R	std	%f5, [%r9, %r8]
	.word 0xea020009  ! 336: LDUW_R	lduw	[%r8 + %r9], %r21
	.word 0x8fa20829  ! 336: FADDs	fadds	%f8, %f9, %f7
	.word 0xc2220009  ! 339: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc40a0009  ! 339: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xc2a21009  ! 339: STWA_R	stwa	%r1, [%r8 + %r9] 0x80
	.word 0xc6720009  ! 342: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc8120009  ! 342: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xc4520009  ! 342: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xcd220009  ! 345: STF_R	st	%f6, [%r9, %r8]
	.word 0xfa120009  ! 345: LDUH_R	lduh	[%r8 + %r9], %r29
	.word 0xc36a2068  ! 345: PREFETCH_I	prefetch	[%r8 + 0x0068], #one_read
	.word 0xc62a0009  ! 348: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xe4520009  ! 348: LDSH_R	ldsh	[%r8 + %r9], %r18
	.word 0x8143c000  ! 348: STBAR	stbar
	.word 0xf2320009  ! 351: STH_R	sth	%r25, [%r8 + %r9]
	.word 0xc4120009  ! 351: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0x8ba20829  ! 351: FADDs	fadds	%f8, %f9, %f5
	.word 0xe4220009  ! 354: STW_R	stw	%r18, [%r8 + %r9]
	.word 0xc65a0009  ! 354: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xccda1009  ! 354: LDXA_R	ldxa	[%r8, %r9] 0x80, %r6
	.word 0xc5220009  ! 357: STF_R	st	%f2, [%r9, %r8]
	.word 0xc51a0009  ! 357: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0x3a800001  ! 357: BCC	bcc,a	<label_0x1>
	.word 0xe2720009  ! 360: STX_R	stx	%r17, [%r8 + %r9]
	.word 0xc71a0009  ! 360: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0x32800001  ! 360: BNE	bne,a	<label_0x1>
	.word 0xc73a0009  ! 363: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc8020009  ! 363: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xc8ca2bc4  ! 363: LDSBA_I	ldsba	[%r8, + 0x0bc4] %asi, %r4
	.word 0xce720009  ! 366: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xdc0a0009  ! 366: LDUB_R	ldub	[%r8 + %r9], %r14
	.word 0xc36a2dbc  ! 366: PREFETCH_I	prefetch	[%r8 + 0x0dbc], #one_read
	.word 0xee320009  ! 369: STH_R	sth	%r23, [%r8 + %r9]
	.word 0xcc520009  ! 369: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0x3e800002  ! 369: BVC	bvc,a	<label_0x2>
	.word 0xdb220009  ! 372: STF_R	st	%f13, [%r9, %r8]
	.word 0xcc5a0009  ! 372: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0x8143e006  ! 372: MEMBAR	membar	#StoreLoad | #LoadStore 
	.word 0xce2a0009  ! 375: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xfc520009  ! 375: LDSH_R	ldsh	[%r8 + %r9], %r30
	.word 0x8da20929  ! 375: FMULs	fmuls	%f8, %f9, %f6
	.word 0xc8720009  ! 378: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc5020009  ! 378: LDF_R	ld	[%r8, %r9], %f2
	.word 0xa2720009  ! 378: UDIV_R	udiv 	%r8, %r9, %r17
	.word 0xc4220009  ! 381: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xca0a0009  ! 381: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0x8e522954  ! 381: UMUL_I	umul 	%r8, 0x0954, %r7
	.word 0xc4720009  ! 384: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc6520009  ! 384: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0x8143e031  ! 384: MEMBAR	membar	#LoadLoad | #Lookaside | #MemIssue 
	.word 0xc62a0009  ! 387: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xf91a0009  ! 387: LDDF_R	ldd	[%r8, %r9], %f28
	.word 0x8143c000  ! 387: STBAR	stbar
	.word 0xf82a0009  ! 390: STB_R	stb	%r28, [%r8 + %r9]
	.word 0xc45a0009  ! 390: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0x8f222b68  ! 390: MULScc_I	mulscc 	%r8, 0x0b68, %r7
	.word 0xc7220009  ! 393: STF_R	st	%f3, [%r9, %r8]
	.word 0xc51a0009  ! 393: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0x04c20001  ! 393: BRLEZ	brlez  ,nt	%8,<label_0x20001>
	.word 0xcc220009  ! 396: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xcc420009  ! 396: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xc53a0009  ! 396: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc6320009  ! 399: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc6420009  ! 399: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0x8143c000  ! 399: STBAR	stbar
	.word 0xf0320009  ! 402: STH_R	sth	%r24, [%r8 + %r9]
	.word 0xf0020009  ! 402: LDUW_R	lduw	[%r8 + %r9], %r24
	.word 0x8c6a2c6c  ! 402: UDIVX_I	udivx 	%r8, 0x0c6c, %r6
	.word 0xfe720009  ! 405: STX_R	stx	%r31, [%r8 + %r9]
	.word 0xe11a0009  ! 405: LDDF_R	ldd	[%r8, %r9], %f16
	.word 0xc53a0009  ! 405: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc6720009  ! 408: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xee5a0009  ! 408: LDX_R	ldx	[%r8 + %r9], %r23
	.word 0x89a20929  ! 408: FMULs	fmuls	%f8, %f9, %f4
	.word 0xc33a0009  ! 411: STDF_R	std	%f1, [%r9, %r8]
	.word 0xf4520009  ! 411: LDSH_R	ldsh	[%r8 + %r9], %r26
	.word 0x8143e039  ! 411: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside | #MemIssue 
	.word 0xc6220009  ! 414: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc84a0009  ! 414: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0x864a2b28  ! 414: MULX_I	mulx 	%r8, 0x0b28, %r3
	.word 0xcc220009  ! 417: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc5020009  ! 417: LDF_R	ld	[%r8, %r9], %f2
	.word 0xc6ca20d0  ! 417: LDSBA_I	ldsba	[%r8, + 0x00d0] %asi, %r3
	.word 0xf9220009  ! 420: STF_R	st	%f28, [%r9, %r8]
	.word 0xc45a0009  ! 420: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xc36a2c6c  ! 420: PREFETCH_I	prefetch	[%r8 + 0x0c6c], #one_read
	.word 0xf73a0009  ! 423: STDF_R	std	%f27, [%r9, %r8]
	.word 0xcc4a0009  ! 423: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xe4ea1009  ! 423: LDSTUBA_R	ldstuba	%r18, [%r8 + %r9] 0x80
	.word 0xd6320009  ! 426: STH_R	sth	%r11, [%r8 + %r9]
	.word 0xd9020009  ! 426: LDF_R	ld	[%r8, %r9], %f12
	.word 0xc3ea2bb4  ! 426: PREFETCHA_I	prefetcha	[%r8, + 0x0bb4] %asi, #one_read
	.word 0xe1220009  ! 429: STF_R	st	%f16, [%r9, %r8]
	.word 0xde520009  ! 429: LDSH_R	ldsh	[%r8 + %r9], %r15
	.word 0xa2da25d4  ! 429: SMULcc_I	smulcc 	%r8, 0x05d4, %r17
	.word 0xc4720009  ! 432: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xcb020009  ! 432: LDF_R	ld	[%r8, %r9], %f5
	.word 0xc36a2f48  ! 432: PREFETCH_I	prefetch	[%r8 + 0x0f48], #one_read
	.word 0xc4720009  ! 435: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xcb020009  ! 435: LDF_R	ld	[%r8, %r9], %f5
	.word 0xc3ea1009  ! 435: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xe2220009  ! 438: STW_R	stw	%r17, [%r8 + %r9]
	.word 0xf00a0009  ! 438: LDUB_R	ldub	[%r8 + %r9], %r24
	.word 0x3e800001  ! 438: BVC	bvc,a	<label_0x1>
	.word 0xec320009  ! 441: STH_R	sth	%r22, [%r8 + %r9]
	.word 0xe0420009  ! 441: LDSW_R	ldsw	[%r8 + %r9], %r16
	.word 0xc8b226dc  ! 441: STHA_I	stha	%r4, [%r8 + 0x06dc] %asi
	.word 0xc22a0009  ! 444: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xcd1a0009  ! 444: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0x84d20009  ! 444: UMULcc_R	umulcc 	%r8, %r9, %r2
	.word 0xc33a0009  ! 447: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc80a0009  ! 447: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xc44a2998  ! 447: LDSB_I	ldsb	[%r8 + 0x0998], %r2
	.word 0xe7220009  ! 450: STF_R	st	%f19, [%r9, %r8]
	.word 0xce120009  ! 450: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xe0d21009  ! 450: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r16
	.word 0xcc720009  ! 453: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xca420009  ! 453: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0x8143e068  ! 453: MEMBAR	membar	#StoreStore | #MemIssue | #Sync 
	.word 0xc22a0009  ! 456: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xdc0a0009  ! 456: LDUB_R	ldub	[%r8 + %r9], %r14
	.word 0xcada2e98  ! 456: LDXA_I	ldxa	[%r8, + 0x0e98] %asi, %r5
	.word 0xce320009  ! 459: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xf7020009  ! 459: LDF_R	ld	[%r8, %r9], %f27
	.word 0x8c4a0009  ! 459: MULX_R	mulx 	%r8, %r9, %r6
	.word 0xc2720009  ! 462: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc3020009  ! 462: LDF_R	ld	[%r8, %r9], %f1
	.word 0x8c4a0009  ! 462: MULX_R	mulx 	%r8, %r9, %r6
	.word 0xe2720009  ! 465: STX_R	stx	%r17, [%r8 + %r9]
	.word 0xc5020009  ! 465: LDF_R	ld	[%r8, %r9], %f2
	.word 0xca5a2820  ! 465: LDX_I	ldx	[%r8 + 0x0820], %r5
	.word 0xf5220009  ! 468: STF_R	st	%f26, [%r9, %r8]
	.word 0xfd1a0009  ! 468: LDDF_R	ldd	[%r8, %r9], %f30
	.word 0xa9a20929  ! 468: FMULs	fmuls	%f8, %f9, %f20
	.word 0xc62a0009  ! 471: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xe8020009  ! 471: LDUW_R	lduw	[%r8 + %r9], %r20
	.word 0x9ba20929  ! 471: FMULs	fmuls	%f8, %f9, %f13
	.word 0xce220009  ! 474: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc2520009  ! 474: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xcb1a2fe8  ! 474: LDDF_I	ldd	[%r8, 0x0fe8], %f5
	.word 0xc2220009  ! 477: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xce120009  ! 477: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xc4422ad8  ! 477: LDSW_I	ldsw	[%r8 + 0x0ad8], %r2
	.word 0xc6320009  ! 480: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xdb020009  ! 480: LDF_R	ld	[%r8, %r9], %f13
	.word 0xcc0225fc  ! 480: LDUW_I	lduw	[%r8 + 0x05fc], %r6
	.word 0xc7220009  ! 483: STF_R	st	%f3, [%r9, %r8]
	.word 0xc65a0009  ! 483: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0x2eca0001  ! 483: BRGEZ	brgez,a,pt	%8,<label_0xa0001>
	.word 0xcb220009  ! 486: STF_R	st	%f5, [%r9, %r8]
	.word 0xcd1a0009  ! 486: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xf27a0009  ! 486: SWAP_R	swap	%r25, [%r8 + %r9]
	.word 0xc9220009  ! 489: STF_R	st	%f4, [%r9, %r8]
	.word 0xde0a0009  ! 489: LDUB_R	ldub	[%r8 + %r9], %r15
	.word 0x8143e01a  ! 489: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside 
	.word 0xc4220009  ! 492: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xcc120009  ! 492: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0x8c4a26a4  ! 492: MULX_I	mulx 	%r8, 0x06a4, %r6
	.word 0xc8720009  ! 495: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xe2020009  ! 495: LDUW_R	lduw	[%r8 + %r9], %r17
	.word 0xa6722214  ! 495: UDIV_I	udiv 	%r8, 0x0214, %r19
	.word 0xe6320009  ! 498: STH_R	sth	%r19, [%r8 + %r9]
	.word 0xc4120009  ! 498: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xcff21009  ! 498: CASXA_I	casxa	[%r8] 0x80, %r9, %r7
	.word 0xec220009  ! 501: STW_R	stw	%r22, [%r8 + %r9]
	.word 0xcc420009  ! 501: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0x04800002  ! 501: BLE	ble  	<label_0x2>
	.word 0xc2320009  ! 504: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xde5a0009  ! 504: LDX_R	ldx	[%r8 + %r9], %r15
	.word 0xcab22b3c  ! 504: STHA_I	stha	%r5, [%r8 + 0x0b3c] %asi
	.word 0xce720009  ! 507: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc4420009  ! 507: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xf0ea233c  ! 507: LDSTUBA_I	ldstuba	%r24, [%r8 + 0x033c] %asi
	.word 0xc22a0009  ! 510: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc64a0009  ! 510: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xc73a0009  ! 510: STDF_R	std	%f3, [%r9, %r8]
	.word 0xcc2a0009  ! 513: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xec420009  ! 513: LDSW_R	ldsw	[%r8 + %r9], %r22
	.word 0xf2a21009  ! 513: STWA_R	stwa	%r25, [%r8 + %r9] 0x80
	.word 0xe42a0009  ! 516: STB_R	stb	%r18, [%r8 + %r9]
	.word 0xc8420009  ! 516: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0x04800001  ! 516: BLE	ble  	<label_0x1>
	.word 0xc2320009  ! 519: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xca5a0009  ! 519: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xc36a25d8  ! 519: PREFETCH_I	prefetch	[%r8 + 0x05d8], #one_read
	.word 0xc53a0009  ! 522: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc2520009  ! 522: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0x8cd20009  ! 522: UMULcc_R	umulcc 	%r8, %r9, %r6
	.word 0xc6320009  ! 525: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xeb1a0009  ! 525: LDDF_R	ldd	[%r8, %r9], %f21
	.word 0xcf3a2a00  ! 525: STDF_I	std	%f7, [0x0a00, %r8]
	.word 0xce220009  ! 528: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc6020009  ! 528: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0x88da262c  ! 528: SMULcc_I	smulcc 	%r8, 0x062c, %r4
	.word 0xc6320009  ! 531: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc6020009  ! 531: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0x8143c000  ! 531: STBAR	stbar
	.word 0xc2320009  ! 534: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc5020009  ! 534: LDF_R	ld	[%r8, %r9], %f2
	.word 0xc36a0009  ! 534: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc6320009  ! 537: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc60a0009  ! 537: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0x8d220009  ! 537: MULScc_R	mulscc 	%r8, %r9, %r6
	.word 0xce2a0009  ! 540: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc40a0009  ! 540: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xc67a0009  ! 540: SWAP_R	swap	%r3, [%r8 + %r9]
	.word 0xf4720009  ! 543: STX_R	stx	%r26, [%r8 + %r9]
	.word 0xc4120009  ! 543: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xccc21009  ! 543: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r6
	.word 0xc4320009  ! 546: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc25a0009  ! 546: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0x8143e036  ! 546: MEMBAR	membar	#StoreLoad | #LoadStore | #Lookaside | #MemIssue 
	.word 0xf2720009  ! 549: STX_R	stx	%r25, [%r8 + %r9]
	.word 0xc2120009  ! 549: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xc2f21009  ! 549: STXA_R	stxa	%r1, [%r8 + %r9] 0x80
	.word 0xc4320009  ! 552: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xcc0a0009  ! 552: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0x8143e046  ! 552: MEMBAR	membar	#StoreLoad | #LoadStore | #Sync 
	.word 0xc8220009  ! 555: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xce0a0009  ! 555: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xc40a0009  ! 555: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xcb220009  ! 558: STF_R	st	%f5, [%r9, %r8]
	.word 0xc71a0009  ! 558: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xd6c220a0  ! 558: LDSWA_I	ldswa	[%r8, + 0x00a0] %asi, %r11
	.word 0xdc220009  ! 561: STW_R	stw	%r14, [%r8 + %r9]
	.word 0xce0a0009  ! 561: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xe6aa1009  ! 561: STBA_R	stba	%r19, [%r8 + %r9] 0x80
	.word 0xe8320009  ! 564: STH_R	sth	%r20, [%r8 + %r9]
	.word 0xcc120009  ! 564: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0x8143e043  ! 564: MEMBAR	membar	#LoadLoad | #StoreLoad | #Sync 
	.word 0xd6720009  ! 567: STX_R	stx	%r11, [%r8 + %r9]
	.word 0xce120009  ! 567: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0x3c800001  ! 567: BPOS	bpos,a	<label_0x1>
	.word 0xc6220009  ! 570: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc65a0009  ! 570: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xceaa1009  ! 570: STBA_R	stba	%r7, [%r8 + %r9] 0x80
	.word 0xca2a0009  ! 573: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xe6120009  ! 573: LDUH_R	lduh	[%r8 + %r9], %r19
	.word 0x22800001  ! 573: BE	be,a	<label_0x1>
	.word 0xdc720009  ! 576: STX_R	stx	%r14, [%r8 + %r9]
	.word 0xc24a0009  ! 576: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xc36a0009  ! 576: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xed220009  ! 579: STF_R	st	%f22, [%r9, %r8]
	.word 0xda420009  ! 579: LDSW_R	ldsw	[%r8 + %r9], %r13
	.word 0xc68a1009  ! 579: LDUBA_R	lduba	[%r8, %r9] 0x80, %r3
	.word 0xe5220009  ! 582: STF_R	st	%f18, [%r9, %r8]
	.word 0xe45a0009  ! 582: LDX_R	ldx	[%r8 + %r9], %r18
	.word 0xc3ea1009  ! 582: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xcc220009  ! 585: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc44a0009  ! 585: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xbad22134  ! 585: UMULcc_I	umulcc 	%r8, 0x0134, %r29
	.word 0xc2220009  ! 588: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xcd020009  ! 588: LDF_R	ld	[%r8, %r9], %f6
	.word 0x20800001  ! 588: BN	bn,a	<label_0x1>
	.word 0xee320009  ! 591: STH_R	sth	%r23, [%r8 + %r9]
	.word 0xc9020009  ! 591: LDF_R	ld	[%r8, %r9], %f4
	.word 0x8ef20009  ! 591: UDIVcc_R	udivcc 	%r8, %r9, %r7
	.word 0xda320009  ! 594: STH_R	sth	%r13, [%r8 + %r9]
	.word 0xc71a0009  ! 594: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0x8e5a0009  ! 594: SMUL_R	smul 	%r8, %r9, %r7
	.word 0xfe720009  ! 597: STX_R	stx	%r31, [%r8 + %r9]
	.word 0xf40a0009  ! 597: LDUB_R	ldub	[%r8 + %r9], %r26
	.word 0x8fa20929  ! 597: FMULs	fmuls	%f8, %f9, %f7
	.word 0xcd220009  ! 600: STF_R	st	%f6, [%r9, %r8]
	.word 0xce0a0009  ! 600: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xc3ea1009  ! 600: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xca220009  ! 603: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xce4a0009  ! 603: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0x8af20009  ! 603: UDIVcc_R	udivcc 	%r8, %r9, %r5
	.word 0xca2a0009  ! 606: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xfe020009  ! 606: LDUW_R	lduw	[%r8 + %r9], %r31
	.word 0xda4a0009  ! 606: LDSB_R	ldsb	[%r8 + %r9], %r13
	.word 0xca720009  ! 609: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xce5a0009  ! 609: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0x3a800002  ! 609: BCC	bcc,a	<label_0x2>
	.word 0xc33a0009  ! 612: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc8020009  ! 612: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xf2da2120  ! 612: LDXA_I	ldxa	[%r8, + 0x0120] %asi, %r25
	.word 0xc8220009  ! 615: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xd6520009  ! 615: LDSH_R	ldsh	[%r8 + %r9], %r11
	.word 0xc3ea2f7c  ! 615: PREFETCHA_I	prefetcha	[%r8, + 0x0f7c] %asi, #one_read
	.word 0xf2220009  ! 618: STW_R	stw	%r25, [%r8 + %r9]
	.word 0xdd020009  ! 618: LDF_R	ld	[%r8, %r9], %f14
	.word 0xf5e22009  ! 618: CASA_R	casa	[%r8] %asi, %r9, %r26
	.word 0xce2a0009  ! 621: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xcd1a0009  ! 621: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0x0c800002  ! 621: BNEG	bneg  	<label_0x2>
	.word 0xc22a0009  ! 624: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xf8120009  ! 624: LDUH_R	lduh	[%r8 + %r9], %r28
	.word 0xa1a20929  ! 624: FMULs	fmuls	%f8, %f9, %f16
	.word 0xce720009  ! 627: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc8420009  ! 627: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0x8ad22644  ! 627: UMULcc_I	umulcc 	%r8, 0x0644, %r5
	.word 0xe4320009  ! 630: STH_R	sth	%r18, [%r8 + %r9]
	.word 0xce120009  ! 630: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xcc4a0009  ! 630: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xcb220009  ! 633: STF_R	st	%f5, [%r9, %r8]
	.word 0xce120009  ! 633: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xc45a0009  ! 633: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xcc720009  ! 636: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc25a0009  ! 636: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0x28800001  ! 636: BLEU	bleu,a	<label_0x1>
	.word 0xe6320009  ! 639: STH_R	sth	%r19, [%r8 + %r9]
	.word 0xc5020009  ! 639: LDF_R	ld	[%r8, %r9], %f2
	.word 0x89a20929  ! 639: FMULs	fmuls	%f8, %f9, %f4
	.word 0xea320009  ! 642: STH_R	sth	%r21, [%r8 + %r9]
	.word 0xc24a0009  ! 642: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xf6b227ec  ! 642: STHA_I	stha	%r27, [%r8 + 0x07ec] %asi
	.word 0xf4720009  ! 645: STX_R	stx	%r26, [%r8 + %r9]
	.word 0xd71a0009  ! 645: LDDF_R	ldd	[%r8, %r9], %f11
	.word 0xfcba1009  ! 645: STDA_R	stda	%r30, [%r8 + %r9] 0x80
	.word 0xc2320009  ! 648: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc8020009  ! 648: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0x84fa0009  ! 648: SDIVcc_R	sdivcc 	%r8, %r9, %r2
	.word 0xc6220009  ! 651: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc84a0009  ! 651: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0x8143e021  ! 651: MEMBAR	membar	#LoadLoad | #MemIssue 
	.word 0xc2720009  ! 654: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc71a0009  ! 654: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0x885227e8  ! 654: UMUL_I	umul 	%r8, 0x07e8, %r4
	.word 0xe2220009  ! 657: STW_R	stw	%r17, [%r8 + %r9]
	.word 0xce5a0009  ! 657: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xccba25c8  ! 657: STDA_I	stda	%r6, [%r8 + 0x05c8] %asi
	.word 0xf0320009  ! 660: STH_R	sth	%r24, [%r8 + %r9]
	.word 0xf44a0009  ! 660: LDSB_R	ldsb	[%r8 + %r9], %r26
	.word 0xceda1009  ! 660: LDXA_R	ldxa	[%r8, %r9] 0x80, %r7
	.word 0xd8720009  ! 663: STX_R	stx	%r12, [%r8 + %r9]
	.word 0xd91a0009  ! 663: LDDF_R	ldd	[%r8, %r9], %f12
	.word 0x8e5a247c  ! 663: SMUL_I	smul 	%r8, 0x047c, %r7
	.word 0xd73a0009  ! 666: STDF_R	std	%f11, [%r9, %r8]
	.word 0xc40a0009  ! 666: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0x28800001  ! 666: BLEU	bleu,a	<label_0x1>
	.word 0xc4720009  ! 669: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xcd1a0009  ! 669: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xb9a209a9  ! 669: FDIVs	fdivs	%f8, %f9, %f28
	.word 0xcd3a0009  ! 672: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc31a0009  ! 672: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xde5a2420  ! 672: LDX_I	ldx	[%r8 + 0x0420], %r15
	.word 0xcb3a0009  ! 675: STDF_R	std	%f5, [%r9, %r8]
	.word 0xc8420009  ! 675: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0x9ada23e4  ! 675: SMULcc_I	smulcc 	%r8, 0x03e4, %r13
	.word 0xc4720009  ! 678: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc44a0009  ! 678: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xdab21009  ! 678: STHA_R	stha	%r13, [%r8 + %r9] 0x80
	.word 0xe42a0009  ! 681: STB_R	stb	%r18, [%r8 + %r9]
	.word 0xca0a0009  ! 681: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0x8143c000  ! 681: STBAR	stbar
	.word 0xc42a0009  ! 684: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xdb020009  ! 684: LDF_R	ld	[%r8, %r9], %f13
	.word 0xdab21009  ! 684: STHA_R	stha	%r13, [%r8 + %r9] 0x80
	.word 0xca220009  ! 687: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc40a0009  ! 687: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xc2b22498  ! 687: STHA_I	stha	%r1, [%r8 + 0x0498] %asi
	.word 0xc6220009  ! 690: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc8520009  ! 690: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0x88da0009  ! 690: SMULcc_R	smulcc 	%r8, %r9, %r4
	.word 0xc6720009  ! 693: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xf0020009  ! 693: LDUW_R	lduw	[%r8 + %r9], %r24
	.word 0xd6822490  ! 693: LDUWA_I	lduwa	[%r8, + 0x0490] %asi, %r11
	.word 0xc4720009  ! 696: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xcc120009  ! 696: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0x8a720009  ! 696: UDIV_R	udiv 	%r8, %r9, %r5
	.word 0xce720009  ! 699: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xff1a0009  ! 699: LDDF_R	ldd	[%r8, %r9], %f31
	.word 0xb27a0009  ! 699: SDIV_R	sdiv 	%r8, %r9, %r25
	.word 0xd6220009  ! 702: STW_R	stw	%r11, [%r8 + %r9]
	.word 0xc31a0009  ! 702: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0x8143c000  ! 702: STBAR	stbar
	.word 0xfb3a0009  ! 705: STDF_R	std	%f29, [%r9, %r8]
	.word 0xfa5a0009  ! 705: LDX_R	ldx	[%r8 + %r9], %r29
	.word 0x32800001  ! 705: BNE	bne,a	<label_0x1>
	.word 0xcb220009  ! 708: STF_R	st	%f5, [%r9, %r8]
	.word 0xde020009  ! 708: LDUW_R	lduw	[%r8 + %r9], %r15
	.word 0xb5a209a9  ! 708: FDIVs	fdivs	%f8, %f9, %f26
	.word 0xca220009  ! 711: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc45a0009  ! 711: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xc26a0009  ! 711: LDSTUB_R	ldstub	%r1, [%r8 + %r9]
	.word 0xc33a0009  ! 714: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc60a0009  ! 714: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0x84f22374  ! 714: UDIVcc_I	udivcc 	%r8, 0x0374, %r2
	.word 0xc7220009  ! 717: STF_R	st	%f3, [%r9, %r8]
	.word 0xc64a0009  ! 717: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0x8143c000  ! 717: STBAR	stbar
	.word 0xed220009  ! 720: STF_R	st	%f22, [%r9, %r8]
	.word 0xcc520009  ! 720: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xef222148  ! 720: STF_I	st	%f23, [0x0148, %r8]
	.word 0xec720009  ! 723: STX_R	stx	%r22, [%r8 + %r9]
	.word 0xe25a0009  ! 723: LDX_R	ldx	[%r8 + %r9], %r17
	.word 0x87a209a9  ! 723: FDIVs	fdivs	%f8, %f9, %f3
	.word 0xef3a0009  ! 726: STDF_R	std	%f23, [%r9, %r8]
	.word 0xd9020009  ! 726: LDF_R	ld	[%r8, %r9], %f12
	.word 0xc3ea2850  ! 726: PREFETCHA_I	prefetcha	[%r8, + 0x0850] %asi, #one_read
	.word 0xc4320009  ! 729: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xfe4a0009  ! 729: LDSB_R	ldsb	[%r8 + %r9], %r31
	.word 0x04800001  ! 729: BLE	ble  	<label_0x1>
	.word 0xc53a0009  ! 732: STDF_R	std	%f2, [%r9, %r8]
	.word 0xcc020009  ! 732: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xe47a2158  ! 732: SWAP_I	swap	%r18, [%r8 + 0x0158]
	.word 0xce320009  ! 735: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xec520009  ! 735: LDSH_R	ldsh	[%r8 + %r9], %r22
	.word 0x82fa0009  ! 735: SDIVcc_R	sdivcc 	%r8, %r9, %r1
	.word 0xe0720009  ! 738: STX_R	stx	%r16, [%r8 + %r9]
	.word 0xf04a0009  ! 738: LDSB_R	ldsb	[%r8 + %r9], %r24
	.word 0xd8ba1009  ! 738: STDA_R	stda	%r12, [%r8 + %r9] 0x80
	.word 0xce220009  ! 741: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xf0420009  ! 741: LDSW_R	ldsw	[%r8 + %r9], %r24
	.word 0x99222594  ! 741: MULScc_I	mulscc 	%r8, 0x0594, %r12
	.word 0xcf3a0009  ! 744: STDF_R	std	%f7, [%r9, %r8]
	.word 0xdc4a0009  ! 744: LDSB_R	ldsb	[%r8 + %r9], %r14
	.word 0xc4822478  ! 744: LDUWA_I	lduwa	[%r8, + 0x0478] %asi, %r2
	.word 0xc93a0009  ! 747: STDF_R	std	%f4, [%r9, %r8]
	.word 0xc2120009  ! 747: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0x8ba20929  ! 747: FMULs	fmuls	%f8, %f9, %f5
	.word 0xcc220009  ! 750: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xca120009  ! 750: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xecf220f8  ! 750: STXA_I	stxa	%r22, [%r8 + 0x00f8] %asi
	.word 0xc9220009  ! 753: STF_R	st	%f4, [%r9, %r8]
	.word 0xc44a0009  ! 753: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0x967a23e4  ! 753: SDIV_I	sdiv 	%r8, 0x03e4, %r11
	.word 0xc2320009  ! 756: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xd85a0009  ! 756: LDX_R	ldx	[%r8 + %r9], %r12
	.word 0xc2da1009  ! 756: LDXA_R	ldxa	[%r8, %r9] 0x80, %r1
	.word 0xf4320009  ! 759: STH_R	sth	%r26, [%r8 + %r9]
	.word 0xca5a0009  ! 759: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xc6aa1009  ! 759: STBA_R	stba	%r3, [%r8 + %r9] 0x80
	.word 0xcc320009  ! 762: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xe1020009  ! 762: LDF_R	ld	[%r8, %r9], %f16
	.word 0xc86a2318  ! 762: LDSTUB_I	ldstub	%r4, [%r8 + 0x0318]
	.word 0xca2a0009  ! 765: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc24a0009  ! 765: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xc4ba2c70  ! 765: STDA_I	stda	%r2, [%r8 + 0x0c70] %asi
	.word 0xcf220009  ! 768: STF_R	st	%f7, [%r9, %r8]
	.word 0xc84a0009  ! 768: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xc6fa23ac  ! 768: SWAPA_I	swapa	%r3, [%r8 + 0x03ac] %asi
	.word 0xcc320009  ! 771: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xf4520009  ! 771: LDSH_R	ldsh	[%r8 + %r9], %r26
	.word 0x0e800001  ! 771: BVS	bvs  	<label_0x1>
	.word 0xed3a0009  ! 774: STDF_R	std	%f22, [%r9, %r8]
	.word 0xe9020009  ! 774: LDF_R	ld	[%r8, %r9], %f20
	.word 0xc6ca1009  ! 774: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r3
	.word 0xce720009  ! 777: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xcc120009  ! 777: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0x8e522c5c  ! 777: UMUL_I	umul 	%r8, 0x0c5c, %r7
	.word 0xca2a0009  ! 780: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xea4a0009  ! 780: LDSB_R	ldsb	[%r8 + %r9], %r21
	.word 0xcaea23f4  ! 780: LDSTUBA_I	ldstuba	%r5, [%r8 + 0x03f4] %asi
	.word 0xc6220009  ! 783: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc4520009  ! 783: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xe0822824  ! 783: LDUWA_I	lduwa	[%r8, + 0x0824] %asi, %r16
	.word 0xc33a0009  ! 786: STDF_R	std	%f1, [%r9, %r8]
	.word 0xe31a0009  ! 786: LDDF_R	ldd	[%r8, %r9], %f17
	.word 0xe73a2eb0  ! 786: STDF_I	std	%f19, [0x0eb0, %r8]
	.word 0xc33a0009  ! 789: STDF_R	std	%f1, [%r9, %r8]
	.word 0xce0a0009  ! 789: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0x8ba209a9  ! 789: FDIVs	fdivs	%f8, %f9, %f5
	.word 0xc6720009  ! 792: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc25a0009  ! 792: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xc3ea1009  ! 792: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc6720009  ! 795: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xca4a0009  ! 795: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xc36a0009  ! 795: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xcd3a0009  ! 798: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc80a0009  ! 798: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xc722276c  ! 798: STF_I	st	%f3, [0x076c, %r8]
	.word 0xc7220009  ! 801: STF_R	st	%f3, [%r9, %r8]
	.word 0xf65a0009  ! 801: LDX_R	ldx	[%r8 + %r9], %r27
	.word 0x827a0009  ! 801: SDIV_R	sdiv 	%r8, %r9, %r1
	.word 0xc8720009  ! 804: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc80a0009  ! 804: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0x8a520009  ! 804: UMUL_R	umul 	%r8, %r9, %r5
	.word 0xed3a0009  ! 807: STDF_R	std	%f22, [%r9, %r8]
	.word 0xc5020009  ! 807: LDF_R	ld	[%r8, %r9], %f2
	.word 0xc4ea2bb8  ! 807: LDSTUBA_I	ldstuba	%r2, [%r8 + 0x0bb8] %asi
	.word 0xc2220009  ! 810: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xfa120009  ! 810: LDUH_R	lduh	[%r8 + %r9], %r29
	.word 0xecaa22fc  ! 810: STBA_I	stba	%r22, [%r8 + 0x02fc] %asi
	.word 0xce720009  ! 813: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xce120009  ! 813: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xc9222f9c  ! 813: STF_I	st	%f4, [0x0f9c, %r8]
	.word 0xcc2a0009  ! 816: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xf31a0009  ! 816: LDDF_R	ldd	[%r8, %r9], %f25
	.word 0xcbe22009  ! 816: CASA_R	casa	[%r8] %asi, %r9, %r5
	.word 0xc6220009  ! 819: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc60a0009  ! 819: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0x20800001  ! 819: BN	bn,a	<label_0x1>
	.word 0xc2320009  ! 822: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xce020009  ! 822: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xd64a2334  ! 822: LDSB_I	ldsb	[%r8 + 0x0334], %r11
	.word 0xc2220009  ! 825: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc4420009  ! 825: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xe20a2324  ! 825: LDUB_I	ldub	[%r8 + 0x0324], %r17
	.word 0xd6220009  ! 828: STW_R	stw	%r11, [%r8 + %r9]
	.word 0xc5020009  ! 828: LDF_R	ld	[%r8, %r9], %f2
	.word 0x8ada0009  ! 828: SMULcc_R	smulcc 	%r8, %r9, %r5
	.word 0xfe220009  ! 831: STW_R	stw	%r31, [%r8 + %r9]
	.word 0xc7020009  ! 831: LDF_R	ld	[%r8, %r9], %f3
	.word 0xa7220009  ! 831: MULScc_R	mulscc 	%r8, %r9, %r19
	.word 0xfc2a0009  ! 834: STB_R	stb	%r30, [%r8 + %r9]
	.word 0xc91a0009  ! 834: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xc2a22c08  ! 834: STWA_I	stwa	%r1, [%r8 + 0x0c08] %asi
	.word 0xc4220009  ! 837: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xca420009  ! 837: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xc3ea2aa0  ! 837: PREFETCHA_I	prefetcha	[%r8, + 0x0aa0] %asi, #one_read
	.word 0xc33a0009  ! 840: STDF_R	std	%f1, [%r9, %r8]
	.word 0xcf1a0009  ! 840: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0x0e800002  ! 840: BVS	bvs  	<label_0x2>
	.word 0xcc720009  ! 843: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xdc420009  ! 843: LDSW_R	ldsw	[%r8 + %r9], %r14
	.word 0x967a2c4c  ! 843: SDIV_I	sdiv 	%r8, 0x0c4c, %r11
	.word 0xc4720009  ! 846: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xcc5a0009  ! 846: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0x8143c000  ! 846: STBAR	stbar
	.word 0xc82a0009  ! 849: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xd8420009  ! 849: LDSW_R	ldsw	[%r8 + %r9], %r12
	.word 0x8143c000  ! 849: STBAR	stbar
	.word 0xce320009  ! 852: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xd91a0009  ! 852: LDDF_R	ldd	[%r8, %r9], %f12
	.word 0x3e800001  ! 852: BVC	bvc,a	<label_0x1>
	.word 0xcf220009  ! 855: STF_R	st	%f7, [%r9, %r8]
	.word 0xce4a0009  ! 855: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xc6ca1009  ! 855: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r3
	.word 0xc2720009  ! 858: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xcc5a0009  ! 858: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xcfe21009  ! 858: CASA_I	casa	[%r8] 0x80, %r9, %r7
	.word 0xe13a0009  ! 861: STDF_R	std	%f16, [%r9, %r8]
	.word 0xc2020009  ! 861: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xfafa1009  ! 861: SWAPA_R	swapa	%r29, [%r8 + %r9] 0x80
	.word 0xea2a0009  ! 864: STB_R	stb	%r21, [%r8 + %r9]
	.word 0xcc420009  ! 864: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xea020009  ! 864: LDUW_R	lduw	[%r8 + %r9], %r21
	.word 0xcd3a0009  ! 867: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc8120009  ! 867: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0x884a2d78  ! 867: MULX_I	mulx 	%r8, 0x0d78, %r4
	.word 0xc7220009  ! 870: STF_R	st	%f3, [%r9, %r8]
	.word 0xc6020009  ! 870: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0x97220009  ! 870: MULScc_R	mulscc 	%r8, %r9, %r11
	.word 0xc62a0009  ! 873: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xfe0a0009  ! 873: LDUB_R	ldub	[%r8 + %r9], %r31
	.word 0xf802210c  ! 873: LDUW_I	lduw	[%r8 + 0x010c], %r28
	.word 0xf7220009  ! 876: STF_R	st	%f27, [%r9, %r8]
	.word 0xe6120009  ! 876: LDUH_R	lduh	[%r8 + %r9], %r19
	.word 0xc3ea2844  ! 876: PREFETCHA_I	prefetcha	[%r8, + 0x0844] %asi, #one_read
	.word 0xf0220009  ! 879: STW_R	stw	%r24, [%r8 + %r9]
	.word 0xc3020009  ! 879: LDF_R	ld	[%r8, %r9], %f1
	.word 0x984a2f64  ! 879: MULX_I	mulx 	%r8, 0x0f64, %r12
	.word 0xce720009  ! 882: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc60a0009  ! 882: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xc8ca2f08  ! 882: LDSBA_I	ldsba	[%r8, + 0x0f08] %asi, %r4
	.word 0xcf3a0009  ! 885: STDF_R	std	%f7, [%r9, %r8]
	.word 0xeb1a0009  ! 885: LDDF_R	ldd	[%r8, %r9], %f21
	.word 0x8143c000  ! 885: STBAR	stbar
	.word 0xcb3a0009  ! 888: STDF_R	std	%f5, [%r9, %r8]
	.word 0xc85a0009  ! 888: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xfc8220f8  ! 888: LDUWA_I	lduwa	[%r8, + 0x00f8] %asi, %r30
	.word 0xcc720009  ! 891: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xfa520009  ! 891: LDSH_R	ldsh	[%r8 + %r9], %r29
	.word 0xc2ea1009  ! 891: LDSTUBA_R	ldstuba	%r1, [%r8 + %r9] 0x80
	.word 0xcc320009  ! 894: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc4420009  ! 894: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xae520009  ! 894: UMUL_R	umul 	%r8, %r9, %r23
	.word 0xe33a0009  ! 897: STDF_R	std	%f17, [%r9, %r8]
	.word 0xe2420009  ! 897: LDSW_R	ldsw	[%r8 + %r9], %r17
	.word 0x2ec20001  ! 897: BRGEZ	brgez,a,nt	%8,<label_0x20001>
	.word 0xcc220009  ! 900: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc4420009  ! 900: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xc36a2b8c  ! 900: PREFETCH_I	prefetch	[%r8 + 0x0b8c], #one_read
	.word 0xc73a0009  ! 903: STDF_R	std	%f3, [%r9, %r8]
	.word 0xd85a0009  ! 903: LDX_R	ldx	[%r8 + %r9], %r12
	.word 0x1a800002  ! 903: BCC	bcc  	<label_0x2>
	.word 0xe4320009  ! 906: STH_R	sth	%r18, [%r8 + %r9]
	.word 0xf85a0009  ! 906: LDX_R	ldx	[%r8 + %r9], %r28
	.word 0xcea22500  ! 906: STWA_I	stwa	%r7, [%r8 + 0x0500] %asi
	.word 0xc93a0009  ! 909: STDF_R	std	%f4, [%r9, %r8]
	.word 0xcf020009  ! 909: LDF_R	ld	[%r8, %r9], %f7
	.word 0xccb22184  ! 909: STHA_I	stha	%r6, [%r8 + 0x0184] %asi
	.word 0xc33a0009  ! 912: STDF_R	std	%f1, [%r9, %r8]
	.word 0xcc4a0009  ! 912: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xacda0009  ! 912: SMULcc_R	smulcc 	%r8, %r9, %r22
	.word 0xc2720009  ! 915: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xca0a0009  ! 915: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xe87a2d88  ! 915: SWAP_I	swap	%r20, [%r8 + 0x0d88]
	.word 0xe6320009  ! 918: STH_R	sth	%r19, [%r8 + %r9]
	.word 0xc4520009  ! 918: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xcd1a0009  ! 918: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xce320009  ! 921: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xde5a0009  ! 921: LDX_R	ldx	[%r8 + %r9], %r15
	.word 0xc6fa1009  ! 921: SWAPA_R	swapa	%r3, [%r8 + %r9] 0x80
	.word 0xc4320009  ! 924: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xec4a0009  ! 924: LDSB_R	ldsb	[%r8 + %r9], %r22
	.word 0x885a2244  ! 924: SMUL_I	smul 	%r8, 0x0244, %r4
	.word 0xcc2a0009  ! 927: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xcc420009  ! 927: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0x2e800001  ! 927: BVS	bvs,a	<label_0x1>
	.word 0xf0320009  ! 930: STH_R	sth	%r24, [%r8 + %r9]
	.word 0xe31a0009  ! 930: LDDF_R	ldd	[%r8, %r9], %f17
	.word 0x89a209a9  ! 930: FDIVs	fdivs	%f8, %f9, %f4
	.word 0xe8320009  ! 933: STH_R	sth	%r20, [%r8 + %r9]
	.word 0xc2420009  ! 933: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0x82f20009  ! 933: UDIVcc_R	udivcc 	%r8, %r9, %r1
	.word 0xe13a0009  ! 936: STDF_R	std	%f16, [%r9, %r8]
	.word 0xc6120009  ! 936: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xcca22b90  ! 936: STWA_I	stwa	%r6, [%r8 + 0x0b90] %asi
	.word 0xc3220009  ! 939: STF_R	st	%f1, [%r9, %r8]
	.word 0xcc0a0009  ! 939: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0x26800001  ! 939: BL	bl,a	<label_0x1>
	.word 0xcd220009  ! 942: STF_R	st	%f6, [%r9, %r8]
	.word 0xce5a0009  ! 942: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xd8520009  ! 942: LDSH_R	ldsh	[%r8 + %r9], %r12
	.word 0xca2a0009  ! 945: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xca0a0009  ! 945: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xf5e21009  ! 945: CASA_I	casa	[%r8] 0x80, %r9, %r26
	.word 0xce720009  ! 948: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc4020009  ! 948: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xc8a21009  ! 948: STWA_R	stwa	%r4, [%r8 + %r9] 0x80
	.word 0xc6220009  ! 951: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc6520009  ! 951: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0x8143e070  ! 951: MEMBAR	membar	#Lookaside | #MemIssue | #Sync 
	.word 0xcf220009  ! 954: STF_R	st	%f7, [%r9, %r8]
	.word 0xc84a0009  ! 954: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xb07a2800  ! 954: SDIV_I	sdiv 	%r8, 0x0800, %r24
	.word 0xce720009  ! 957: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xd91a0009  ! 957: LDDF_R	ldd	[%r8, %r9], %f12
	.word 0xc4020009  ! 957: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xea2a0009  ! 960: STB_R	stb	%r21, [%r8 + %r9]
	.word 0xc6120009  ! 960: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xedf21009  ! 960: CASXA_I	casxa	[%r8] 0x80, %r9, %r22
	.word 0xf9220009  ! 963: STF_R	st	%f28, [%r9, %r8]
	.word 0xc65a0009  ! 963: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xc45a20d8  ! 963: LDX_I	ldx	[%r8 + 0x00d8], %r2
	.word 0xf62a0009  ! 966: STB_R	stb	%r27, [%r8 + %r9]
	.word 0xfe120009  ! 966: LDUH_R	lduh	[%r8 + %r9], %r31
	.word 0xfe5222b4  ! 966: LDSH_I	ldsh	[%r8 + 0x02b4], %r31
	.word 0xe6220009  ! 969: STW_R	stw	%r19, [%r8 + %r9]
	.word 0xca020009  ! 969: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xce0a259c  ! 969: LDUB_I	ldub	[%r8 + 0x059c], %r7
	.word 0xf7220009  ! 972: STF_R	st	%f27, [%r9, %r8]
	.word 0xcc5a0009  ! 972: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0x16800001  ! 972: BGE	bge  	<label_0x1>
	.word 0xdb220009  ! 975: STF_R	st	%f13, [%r9, %r8]
	.word 0xee520009  ! 975: LDSH_R	ldsh	[%r8 + %r9], %r23
	.word 0xf6d22a9c  ! 975: LDSHA_I	ldsha	[%r8, + 0x0a9c] %asi, %r27
	.word 0xce320009  ! 978: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xcb1a0009  ! 978: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xb6720009  ! 978: UDIV_R	udiv 	%r8, %r9, %r27
	.word 0xc5220009  ! 981: STF_R	st	%f2, [%r9, %r8]
	.word 0xcc4a0009  ! 981: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xd8d22718  ! 981: LDSHA_I	ldsha	[%r8, + 0x0718] %asi, %r12
	.word 0xce720009  ! 984: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc71a0009  ! 984: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xc6ea1009  ! 984: LDSTUBA_R	ldstuba	%r3, [%r8 + %r9] 0x80
	.word 0xcc320009  ! 987: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xdf020009  ! 987: LDF_R	ld	[%r8, %r9], %f15
	.word 0xc2922510  ! 987: LDUHA_I	lduha	[%r8, + 0x0510] %asi, %r1
	.word 0xca720009  ! 990: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xee0a0009  ! 990: LDUB_R	ldub	[%r8 + %r9], %r23
	.word 0x8143e044  ! 990: MEMBAR	membar	#LoadStore | #Sync 
	.word 0xc9220009  ! 993: STF_R	st	%f4, [%r9, %r8]
	.word 0xcc4a0009  ! 993: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0x8143e072  ! 993: MEMBAR	membar	#StoreLoad | #Lookaside | #MemIssue | #Sync 
	.word 0xc53a0009  ! 996: STDF_R	std	%f2, [%r9, %r8]
	.word 0xcd020009  ! 996: LDF_R	ld	[%r8, %r9], %f6
	.word 0x28800001  ! 996: BLEU	bleu,a	<label_0x1>
	.word 0xca2a0009  ! 999: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc6020009  ! 999: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xceea1009  ! 999: LDSTUBA_R	ldstuba	%r7, [%r8 + %r9] 0x80
	.word 0xe5220009  ! 1002: STF_R	st	%f18, [%r9, %r8]
	.word 0xce120009  ! 1002: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xc6420009  ! 1002: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xcb220009  ! 1005: STF_R	st	%f5, [%r9, %r8]
	.word 0xc8020009  ! 1005: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0x00800001  ! 1005: BN	bn  	<label_0x1>
	.word 0xce220009  ! 1008: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc6020009  ! 1008: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xc4520009  ! 1008: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xce320009  ! 1011: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc2120009  ! 1011: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xca1222b0  ! 1011: LDUH_I	lduh	[%r8 + 0x02b0], %r5
	.word 0xc8320009  ! 1014: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xec120009  ! 1014: LDUH_R	lduh	[%r8 + %r9], %r22
	.word 0x8143c000  ! 1014: STBAR	stbar
	.word 0xce220009  ! 1017: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xfc020009  ! 1017: LDUW_R	lduw	[%r8 + %r9], %r30
	.word 0xc4020009  ! 1017: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xca320009  ! 1020: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc84a0009  ! 1020: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xc61226c4  ! 1020: LDUH_I	lduh	[%r8 + 0x06c4], %r3
	.word 0xc8320009  ! 1023: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xe40a0009  ! 1023: LDUB_R	ldub	[%r8 + %r9], %r18
	.word 0xb9220009  ! 1023: MULScc_R	mulscc 	%r8, %r9, %r28
	.word 0xc4320009  ! 1026: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc9020009  ! 1026: LDF_R	ld	[%r8, %r9], %f4
	.word 0xfeda1009  ! 1026: LDXA_R	ldxa	[%r8, %r9] 0x80, %r31
	.word 0xca320009  ! 1029: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xca0a0009  ! 1029: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xc6d22b90  ! 1029: LDSHA_I	ldsha	[%r8, + 0x0b90] %asi, %r3
	.word 0xc4720009  ! 1032: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xf20a0009  ! 1032: LDUB_R	ldub	[%r8 + %r9], %r25
	.word 0xfad21009  ! 1032: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r29
	.word 0xd6220009  ! 1035: STW_R	stw	%r11, [%r8 + %r9]
	.word 0xef020009  ! 1035: LDF_R	ld	[%r8, %r9], %f23
	.word 0x8143c000  ! 1035: STBAR	stbar
	.word 0xf4720009  ! 1038: STX_R	stx	%r26, [%r8 + %r9]
	.word 0xcf1a0009  ! 1038: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0x85a208a9  ! 1038: FSUBs	fsubs	%f8, %f9, %f2
	.word 0xce220009  ! 1041: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc6520009  ! 1041: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xc3ea1009  ! 1041: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xce720009  ! 1044: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc8020009  ! 1044: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xebf22009  ! 1044: CASXA_R	casxa	[%r8]%asi, %r9, %r21
	.word 0xc7220009  ! 1047: STF_R	st	%f3, [%r9, %r8]
	.word 0xea0a0009  ! 1047: LDUB_R	ldub	[%r8 + %r9], %r21
	.word 0xc4da2f78  ! 1047: LDXA_I	ldxa	[%r8, + 0x0f78] %asi, %r2
	.word 0xcb220009  ! 1050: STF_R	st	%f5, [%r9, %r8]
	.word 0xd84a0009  ! 1050: LDSB_R	ldsb	[%r8 + %r9], %r12
	.word 0xd68a29e8  ! 1050: LDUBA_I	lduba	[%r8, + 0x09e8] %asi, %r11
	.word 0xde320009  ! 1053: STH_R	sth	%r15, [%r8 + %r9]
	.word 0xc4020009  ! 1053: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xc6f22b08  ! 1053: STXA_I	stxa	%r3, [%r8 + 0x0b08] %asi
	.word 0xc82a0009  ! 1056: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xdf1a0009  ! 1056: LDDF_R	ldd	[%r8, %r9], %f15
	.word 0xc28a2204  ! 1056: LDUBA_I	lduba	[%r8, + 0x0204] %asi, %r1
	.word 0xc62a0009  ! 1059: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xce520009  ! 1059: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xafa209a9  ! 1059: FDIVs	fdivs	%f8, %f9, %f23
	.word 0xf0220009  ! 1062: STW_R	stw	%r24, [%r8 + %r9]
	.word 0xe20a0009  ! 1062: LDUB_R	ldub	[%r8 + %r9], %r17
	.word 0x8e4a2388  ! 1062: MULX_I	mulx 	%r8, 0x0388, %r7
	.word 0xf0220009  ! 1065: STW_R	stw	%r24, [%r8 + %r9]
	.word 0xf91a0009  ! 1065: LDDF_R	ldd	[%r8, %r9], %f28
	.word 0x87a20829  ! 1065: FADDs	fadds	%f8, %f9, %f3
	.word 0xc22a0009  ! 1068: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc85a0009  ! 1068: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xfeea2a58  ! 1068: LDSTUBA_I	ldstuba	%r31, [%r8 + 0x0a58] %asi
	.word 0xed220009  ! 1071: STF_R	st	%f22, [%r9, %r8]
	.word 0xc85a0009  ! 1071: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xc3ea1009  ! 1071: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xd82a0009  ! 1074: STB_R	stb	%r12, [%r8 + %r9]
	.word 0xee020009  ! 1074: LDUW_R	lduw	[%r8 + %r9], %r23
	.word 0xc8422eb4  ! 1074: LDSW_I	ldsw	[%r8 + 0x0eb4], %r4
	.word 0xe4220009  ! 1077: STW_R	stw	%r18, [%r8 + %r9]
	.word 0xca4a0009  ! 1077: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xc36a0009  ! 1077: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xfe320009  ! 1080: STH_R	sth	%r31, [%r8 + %r9]
	.word 0xfa120009  ! 1080: LDUH_R	lduh	[%r8 + %r9], %r29
	.word 0xccaa2528  ! 1080: STBA_I	stba	%r6, [%r8 + 0x0528] %asi
	.word 0xc6720009  ! 1083: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xde0a0009  ! 1083: LDUB_R	ldub	[%r8 + %r9], %r15
	.word 0xa1a209a9  ! 1083: FDIVs	fdivs	%f8, %f9, %f16
	.word 0xfc220009  ! 1086: STW_R	stw	%r30, [%r8 + %r9]
	.word 0xce0a0009  ! 1086: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xccf22e88  ! 1086: STXA_I	stxa	%r6, [%r8 + 0x0e88] %asi
	.word 0xec720009  ! 1089: STX_R	stx	%r22, [%r8 + %r9]
	.word 0xc6420009  ! 1089: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xc3ea1009  ! 1089: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xfc220009  ! 1092: STW_R	stw	%r30, [%r8 + %r9]
	.word 0xe25a0009  ! 1092: LDX_R	ldx	[%r8 + %r9], %r17
	.word 0xb04a0009  ! 1092: MULX_R	mulx 	%r8, %r9, %r24
	.word 0xcd3a0009  ! 1095: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc24a0009  ! 1095: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0x8af225b0  ! 1095: UDIVcc_I	udivcc 	%r8, 0x05b0, %r5
	.word 0xc62a0009  ! 1098: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc60a0009  ! 1098: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xc68a1009  ! 1098: LDUBA_R	lduba	[%r8, %r9] 0x80, %r3
	.word 0xce320009  ! 1101: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc65a0009  ! 1101: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xc33a0009  ! 1101: STDF_R	std	%f1, [%r9, %r8]
	.word 0xea320009  ! 1104: STH_R	sth	%r21, [%r8 + %r9]
	.word 0xcc5a0009  ! 1104: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0x867a2400  ! 1104: SDIV_I	sdiv 	%r8, 0x0400, %r3
	.word 0xc6320009  ! 1107: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc7020009  ! 1107: LDF_R	ld	[%r8, %r9], %f3
	.word 0xa56a0009  ! 1107: SDIVX_R	sdivx	%r8, %r9, %r18
	.word 0xcc320009  ! 1110: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc7020009  ! 1110: LDF_R	ld	[%r8, %r9], %f3
	.word 0xc73a2ec8  ! 1110: STDF_I	std	%f3, [0x0ec8, %r8]
	.word 0xdc2a0009  ! 1113: STB_R	stb	%r14, [%r8 + %r9]
	.word 0xde420009  ! 1113: LDSW_R	ldsw	[%r8 + %r9], %r15
	.word 0xfc022a0c  ! 1113: LDUW_I	lduw	[%r8 + 0x0a0c], %r30
	.word 0xc62a0009  ! 1116: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xde0a0009  ! 1116: LDUB_R	ldub	[%r8 + %r9], %r15
	.word 0x8143c000  ! 1116: STBAR	stbar
	.word 0xc2220009  ! 1119: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xcc520009  ! 1119: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xdc022c30  ! 1119: LDUW_I	lduw	[%r8 + 0x0c30], %r14
	.word 0xc22a0009  ! 1122: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xf11a0009  ! 1122: LDDF_R	ldd	[%r8, %r9], %f24
	.word 0xa0d2217c  ! 1122: UMULcc_I	umulcc 	%r8, 0x017c, %r16
	.word 0xc2720009  ! 1125: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xce4a0009  ! 1125: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0x96720009  ! 1125: UDIV_R	udiv 	%r8, %r9, %r11
	.word 0xe02a0009  ! 1128: STB_R	stb	%r16, [%r8 + %r9]
	.word 0xce5a0009  ! 1128: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0x89220009  ! 1128: MULScc_R	mulscc 	%r8, %r9, %r4
	.word 0xcd3a0009  ! 1131: STDF_R	std	%f6, [%r9, %r8]
	.word 0xde0a0009  ! 1131: LDUB_R	ldub	[%r8 + %r9], %r15
	.word 0xc53a0009  ! 1131: STDF_R	std	%f2, [%r9, %r8]
	.word 0xf6320009  ! 1134: STH_R	sth	%r27, [%r8 + %r9]
	.word 0xc2420009  ! 1134: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0x26c20001  ! 1134: BRLZ	brlz,a,nt	%8,<label_0x20001>
	.word 0xf8320009  ! 1137: STH_R	sth	%r28, [%r8 + %r9]
	.word 0xea120009  ! 1137: LDUH_R	lduh	[%r8 + %r9], %r21
	.word 0xfcba2980  ! 1137: STDA_I	stda	%r30, [%r8 + 0x0980] %asi
	.word 0xc53a0009  ! 1140: STDF_R	std	%f2, [%r9, %r8]
	.word 0xf04a0009  ! 1140: LDSB_R	ldsb	[%r8 + %r9], %r24
	.word 0xccba2408  ! 1140: STDA_I	stda	%r6, [%r8 + 0x0408] %asi
	.word 0xc2720009  ! 1143: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc8020009  ! 1143: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xf2b22418  ! 1143: STHA_I	stha	%r25, [%r8 + 0x0418] %asi
	.word 0xc7220009  ! 1146: STF_R	st	%f3, [%r9, %r8]
	.word 0xc31a0009  ! 1146: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xc2522040  ! 1146: LDSH_I	ldsh	[%r8 + 0x0040], %r1
	.word 0xcc2a0009  ! 1149: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xcd020009  ! 1149: LDF_R	ld	[%r8, %r9], %f6
	.word 0x89a20829  ! 1149: FADDs	fadds	%f8, %f9, %f4
	.word 0xc42a0009  ! 1152: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xcb1a0009  ! 1152: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xc36a0009  ! 1152: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xfb3a0009  ! 1155: STDF_R	std	%f29, [%r9, %r8]
	.word 0xf8420009  ! 1155: LDSW_R	ldsw	[%r8 + %r9], %r28
	.word 0xe4b22d10  ! 1155: STHA_I	stha	%r18, [%r8 + 0x0d10] %asi
	.word 0xc4220009  ! 1158: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc6520009  ! 1158: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0x8c52276c  ! 1158: UMUL_I	umul 	%r8, 0x076c, %r6
	.word 0xde2a0009  ! 1161: STB_R	stb	%r15, [%r8 + %r9]
	.word 0xc71a0009  ! 1161: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0x8a7a26c0  ! 1161: SDIV_I	sdiv 	%r8, 0x06c0, %r5
	.word 0xca220009  ! 1164: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc8420009  ! 1164: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0x84f22050  ! 1164: UDIVcc_I	udivcc 	%r8, 0x0050, %r2
	.word 0xf62a0009  ! 1167: STB_R	stb	%r27, [%r8 + %r9]
	.word 0xce5a0009  ! 1167: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xc26a2efc  ! 1167: LDSTUB_I	ldstub	%r1, [%r8 + 0x0efc]
	.word 0xcc220009  ! 1170: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xd8020009  ! 1170: LDUW_R	lduw	[%r8 + %r9], %r12
	.word 0x85a20829  ! 1170: FADDs	fadds	%f8, %f9, %f2
	.word 0xcf220009  ! 1173: STF_R	st	%f7, [%r9, %r8]
	.word 0xc4520009  ! 1173: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xb8720009  ! 1173: UDIV_R	udiv 	%r8, %r9, %r28
	.word 0xca220009  ! 1176: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xfe020009  ! 1176: LDUW_R	lduw	[%r8 + %r9], %r31
	.word 0x08800002  ! 1176: BLEU	bleu  	<label_0x2>
	.word 0xc5220009  ! 1179: STF_R	st	%f2, [%r9, %r8]
	.word 0xc4420009  ! 1179: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xc36a0009  ! 1179: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc4720009  ! 1182: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xce520009  ! 1182: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xe9222a70  ! 1182: STF_I	st	%f20, [0x0a70, %r8]
	.word 0xcb220009  ! 1185: STF_R	st	%f5, [%r9, %r8]
	.word 0xce4a0009  ! 1185: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xbba209a9  ! 1185: FDIVs	fdivs	%f8, %f9, %f29
	.word 0xf4320009  ! 1188: STH_R	sth	%r26, [%r8 + %r9]
	.word 0xce0a0009  ! 1188: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xb0522320  ! 1188: UMUL_I	umul 	%r8, 0x0320, %r24
	.word 0xf82a0009  ! 1191: STB_R	stb	%r28, [%r8 + %r9]
	.word 0xcc5a0009  ! 1191: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0x88f20009  ! 1191: UDIVcc_R	udivcc 	%r8, %r9, %r4
	.word 0xea720009  ! 1194: STX_R	stx	%r21, [%r8 + %r9]
	.word 0xe0420009  ! 1194: LDSW_R	ldsw	[%r8 + %r9], %r16
	.word 0x9afa0009  ! 1194: SDIVcc_R	sdivcc 	%r8, %r9, %r13
	.word 0xec220009  ! 1197: STW_R	stw	%r22, [%r8 + %r9]
	.word 0xc5020009  ! 1197: LDF_R	ld	[%r8, %r9], %f2
	.word 0xc7222a30  ! 1197: STF_I	st	%f3, [0x0a30, %r8]
	.word 0xfd220009  ! 1200: STF_R	st	%f30, [%r9, %r8]
	.word 0xcc120009  ! 1200: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xdbf22009  ! 1200: CASXA_R	casxa	[%r8]%asi, %r9, %r13
	.word 0xc42a0009  ! 1203: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc51a0009  ! 1203: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0x32800001  ! 1203: BNE	bne,a	<label_0x1>
	.word 0xce2a0009  ! 1206: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc71a0009  ! 1206: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xcc0a0009  ! 1206: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xdc220009  ! 1209: STW_R	stw	%r14, [%r8 + %r9]
	.word 0xee420009  ! 1209: LDSW_R	ldsw	[%r8 + %r9], %r23
	.word 0xe5222f50  ! 1209: STF_I	st	%f18, [0x0f50, %r8]
	.word 0xc82a0009  ! 1212: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xfd1a0009  ! 1212: LDDF_R	ldd	[%r8, %r9], %f30
	.word 0x85a20929  ! 1212: FMULs	fmuls	%f8, %f9, %f2
	.word 0xca720009  ! 1215: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc40a0009  ! 1215: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xc4f22d28  ! 1215: STXA_I	stxa	%r2, [%r8 + 0x0d28] %asi
	.word 0xc6720009  ! 1218: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xce5a0009  ! 1218: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xc2aa28b0  ! 1218: STBA_I	stba	%r1, [%r8 + 0x08b0] %asi
	.word 0xcb3a0009  ! 1221: STDF_R	std	%f5, [%r9, %r8]
	.word 0xc20a0009  ! 1221: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xc3e22009  ! 1221: CASA_R	casa	[%r8] %asi, %r9, %r1
	.word 0xc2220009  ! 1224: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc6420009  ! 1224: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xcf022978  ! 1224: LDF_I	ld	[%r8, 0x0978], %f7
	.word 0xcf220009  ! 1227: STF_R	st	%f7, [%r9, %r8]
	.word 0xc4020009  ! 1227: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xf3f22009  ! 1227: CASXA_R	casxa	[%r8]%asi, %r9, %r25
	.word 0xf0720009  ! 1230: STX_R	stx	%r24, [%r8 + %r9]
	.word 0xca420009  ! 1230: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0x1e800002  ! 1230: BVC	bvc  	<label_0x2>
	.word 0xf8220009  ! 1233: STW_R	stw	%r28, [%r8 + %r9]
	.word 0xd6120009  ! 1233: LDUH_R	lduh	[%r8 + %r9], %r11
	.word 0x87a20829  ! 1233: FADDs	fadds	%f8, %f9, %f3
	.word 0xc73a0009  ! 1236: STDF_R	std	%f3, [%r9, %r8]
	.word 0xd8520009  ! 1236: LDSH_R	ldsh	[%r8 + %r9], %r12
	.word 0xc7222288  ! 1236: STF_I	st	%f3, [0x0288, %r8]
	.word 0xc4220009  ! 1239: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc6020009  ! 1239: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xa3a209a9  ! 1239: FDIVs	fdivs	%f8, %f9, %f17
	.word 0xe8320009  ! 1242: STH_R	sth	%r20, [%r8 + %r9]
	.word 0xc20a0009  ! 1242: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xc8d21009  ! 1242: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r4
	.word 0xf13a0009  ! 1245: STDF_R	std	%f24, [%r9, %r8]
	.word 0xcd020009  ! 1245: LDF_R	ld	[%r8, %r9], %f6
	.word 0x8143c000  ! 1245: STBAR	stbar
	.word 0xfc220009  ! 1248: STW_R	stw	%r30, [%r8 + %r9]
	.word 0xca420009  ! 1248: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xb3a20829  ! 1248: FADDs	fadds	%f8, %f9, %f25
	.word 0xfa320009  ! 1251: STH_R	sth	%r29, [%r8 + %r9]
	.word 0xc6020009  ! 1251: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xe0f21009  ! 1251: STXA_R	stxa	%r16, [%r8 + %r9] 0x80
	.word 0xec2a0009  ! 1254: STB_R	stb	%r22, [%r8 + %r9]
	.word 0xcc120009  ! 1254: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0x8143c000  ! 1254: STBAR	stbar
	.word 0xcc320009  ! 1257: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc7020009  ! 1257: LDF_R	ld	[%r8, %r9], %f3
	.word 0xf20a203c  ! 1257: LDUB_I	ldub	[%r8 + 0x003c], %r25
	.word 0xde2a0009  ! 1260: STB_R	stb	%r15, [%r8 + %r9]
	.word 0xc4120009  ! 1260: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0x8cd20009  ! 1260: UMULcc_R	umulcc 	%r8, %r9, %r6
	.word 0xf4220009  ! 1263: STW_R	stw	%r26, [%r8 + %r9]
	.word 0xde4a0009  ! 1263: LDSB_R	ldsb	[%r8 + %r9], %r15
	.word 0xc36a0009  ! 1263: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc6720009  ! 1266: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc31a0009  ! 1266: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0x8143c000  ! 1266: STBAR	stbar
	.word 0xcf3a0009  ! 1269: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc31a0009  ! 1269: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0x0e800002  ! 1269: BVS	bvs  	<label_0x2>
	.word 0xc2720009  ! 1272: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xcc020009  ! 1272: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xf3f21009  ! 1272: CASXA_I	casxa	[%r8] 0x80, %r9, %r25
	.word 0xca220009  ! 1275: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xea420009  ! 1275: LDSW_R	ldsw	[%r8 + %r9], %r21
	.word 0x8143e073  ! 1275: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside | #MemIssue | #Sync 
	.word 0xcc220009  ! 1278: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc20a0009  ! 1278: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0x84da2664  ! 1278: SMULcc_I	smulcc 	%r8, 0x0664, %r2
	.word 0xc4320009  ! 1281: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xde5a0009  ! 1281: LDX_R	ldx	[%r8 + %r9], %r15
	.word 0x8143c000  ! 1281: STBAR	stbar
	.word 0xc42a0009  ! 1284: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc20a0009  ! 1284: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xc3ea1009  ! 1284: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xfa320009  ! 1287: STH_R	sth	%r29, [%r8 + %r9]
	.word 0xcc520009  ! 1287: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xf4022080  ! 1287: LDUW_I	lduw	[%r8 + 0x0080], %r26
	.word 0xce2a0009  ! 1290: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xdb020009  ! 1290: LDF_R	ld	[%r8, %r9], %f13
	.word 0xe4520009  ! 1290: LDSH_R	ldsh	[%r8 + %r9], %r18
	.word 0xf5220009  ! 1293: STF_R	st	%f26, [%r9, %r8]
	.word 0xc64a0009  ! 1293: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xcea220c4  ! 1293: STWA_I	stwa	%r7, [%r8 + 0x00c4] %asi
	.word 0xca220009  ! 1296: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc51a0009  ! 1296: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xc0ba2130  ! 1296: STDA_I	stda	%r0, [%r8 + 0x0130] %asi
	.word 0xcc720009  ! 1299: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xcb020009  ! 1299: LDF_R	ld	[%r8, %r9], %f5
	.word 0x8143c000  ! 1299: STBAR	stbar
	.word 0xfa2a0009  ! 1302: STB_R	stb	%r29, [%r8 + %r9]
	.word 0xc64a0009  ! 1302: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xc3ea29d0  ! 1302: PREFETCHA_I	prefetcha	[%r8, + 0x09d0] %asi, #one_read
	.word 0xe6220009  ! 1305: STW_R	stw	%r19, [%r8 + %r9]
	.word 0xca0a0009  ! 1305: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0x8143c000  ! 1305: STBAR	stbar
	.word 0xc4220009  ! 1308: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xe5020009  ! 1308: LDF_R	ld	[%r8, %r9], %f18
	.word 0x8b2225dc  ! 1308: MULScc_I	mulscc 	%r8, 0x05dc, %r5
	.word 0xce320009  ! 1311: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xe85a0009  ! 1311: LDX_R	ldx	[%r8 + %r9], %r20
	.word 0xcaaa2998  ! 1311: STBA_I	stba	%r5, [%r8 + 0x0998] %asi
	.word 0xce720009  ! 1314: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc91a0009  ! 1314: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0x9efa0009  ! 1314: SDIVcc_R	sdivcc 	%r8, %r9, %r15
	.word 0xc82a0009  ! 1317: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xcc5a0009  ! 1317: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0x8af20009  ! 1317: UDIVcc_R	udivcc 	%r8, %r9, %r5
	.word 0xc7220009  ! 1320: STF_R	st	%f3, [%r9, %r8]
	.word 0xe0520009  ! 1320: LDSH_R	ldsh	[%r8 + %r9], %r16
	.word 0x08800002  ! 1320: BLEU	bleu  	<label_0x2>
	.word 0xc7220009  ! 1323: STF_R	st	%f3, [%r9, %r8]
	.word 0xcd020009  ! 1323: LDF_R	ld	[%r8, %r9], %f6
	.word 0xe6a21009  ! 1323: STWA_R	stwa	%r19, [%r8 + %r9] 0x80
	.word 0xda320009  ! 1326: STH_R	sth	%r13, [%r8 + %r9]
	.word 0xc8120009  ! 1326: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xc36a2c38  ! 1326: PREFETCH_I	prefetch	[%r8 + 0x0c38], #one_read
	.word 0xc3220009  ! 1329: STF_R	st	%f1, [%r9, %r8]
	.word 0xc4520009  ! 1329: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xa8da0009  ! 1329: SMULcc_R	smulcc 	%r8, %r9, %r20
	.word 0xc7220009  ! 1332: STF_R	st	%f3, [%r9, %r8]
	.word 0xc8420009  ! 1332: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0x86d20009  ! 1332: UMULcc_R	umulcc 	%r8, %r9, %r3
	.word 0xc53a0009  ! 1335: STDF_R	std	%f2, [%r9, %r8]
	.word 0xdb1a0009  ! 1335: LDDF_R	ldd	[%r8, %r9], %f13
	.word 0xcb1a0009  ! 1335: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xfa320009  ! 1338: STH_R	sth	%r29, [%r8 + %r9]
	.word 0xc8420009  ! 1338: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xcef21009  ! 1338: STXA_R	stxa	%r7, [%r8 + %r9] 0x80
	.word 0xc53a0009  ! 1341: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc6020009  ! 1341: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xc4f22348  ! 1341: STXA_I	stxa	%r2, [%r8 + 0x0348] %asi
	.word 0xcd220009  ! 1344: STF_R	st	%f6, [%r9, %r8]
	.word 0xc2120009  ! 1344: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xc86a2c24  ! 1344: LDSTUB_I	ldstub	%r4, [%r8 + 0x0c24]
	.word 0xc22a0009  ! 1347: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc4420009  ! 1347: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0x0a800001  ! 1347: BCS	bcs  	<label_0x1>
	.word 0xca320009  ! 1350: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xe4520009  ! 1350: LDSH_R	ldsh	[%r8 + %r9], %r18
	.word 0xbba20829  ! 1350: FADDs	fadds	%f8, %f9, %f29
	.word 0xc2720009  ! 1353: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc6520009  ! 1353: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xc8fa1009  ! 1353: SWAPA_R	swapa	%r4, [%r8 + %r9] 0x80
	.word 0xc4720009  ! 1356: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xce420009  ! 1356: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0x88da0009  ! 1356: SMULcc_R	smulcc 	%r8, %r9, %r4
	.word 0xf7220009  ! 1359: STF_R	st	%f27, [%r9, %r8]
	.word 0xcb020009  ! 1359: LDF_R	ld	[%r8, %r9], %f5
	.word 0x8ada219c  ! 1359: SMULcc_I	smulcc 	%r8, 0x019c, %r5
	.word 0xcc720009  ! 1362: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xde4a0009  ! 1362: LDSB_R	ldsb	[%r8 + %r9], %r15
	.word 0xcef22be8  ! 1362: STXA_I	stxa	%r7, [%r8 + 0x0be8] %asi
	.word 0xc22a0009  ! 1365: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xca020009  ! 1365: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xe91a2c20  ! 1365: LDDF_I	ldd	[%r8, 0x0c20], %f20
	.word 0xc33a0009  ! 1368: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc8120009  ! 1368: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xc8822130  ! 1368: LDUWA_I	lduwa	[%r8, + 0x0130] %asi, %r4
	.word 0xc62a0009  ! 1371: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xf9020009  ! 1371: LDF_R	ld	[%r8, %r9], %f28
	.word 0x2e800002  ! 1371: BVS	bvs,a	<label_0x2>
	.word 0xcc220009  ! 1374: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xce4a0009  ! 1374: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xdeda2808  ! 1374: LDXA_I	ldxa	[%r8, + 0x0808] %asi, %r15
	.word 0xc6720009  ! 1377: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xca520009  ! 1377: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xc4c21009  ! 1377: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r2
	.word 0xfe2a0009  ! 1380: STB_R	stb	%r31, [%r8 + %r9]
	.word 0xcf1a0009  ! 1380: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0x02800002  ! 1380: BE	be  	<label_0x2>
	.word 0xce320009  ! 1383: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xf11a0009  ! 1383: LDDF_R	ldd	[%r8, %r9], %f24
	.word 0xac720009  ! 1383: UDIV_R	udiv 	%r8, %r9, %r22
	.word 0xc33a0009  ! 1386: STDF_R	std	%f1, [%r9, %r8]
	.word 0xca520009  ! 1386: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0x8143c000  ! 1386: STBAR	stbar
	.word 0xcc2a0009  ! 1389: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xfd020009  ! 1389: LDF_R	ld	[%r8, %r9], %f30
	.word 0x8143e043  ! 1389: MEMBAR	membar	#LoadLoad | #StoreLoad | #Sync 
	.word 0xcc2a0009  ! 1392: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xcd1a0009  ! 1392: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xc36a2258  ! 1392: PREFETCH_I	prefetch	[%r8 + 0x0258], #one_read
	.word 0xe4320009  ! 1395: STH_R	sth	%r18, [%r8 + %r9]
	.word 0xfc420009  ! 1395: LDSW_R	ldsw	[%r8 + %r9], %r30
	.word 0xe8ea1009  ! 1395: LDSTUBA_R	ldstuba	%r20, [%r8 + %r9] 0x80
	.word 0xce220009  ! 1398: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc7020009  ! 1398: LDF_R	ld	[%r8, %r9], %f3
	.word 0x82f20009  ! 1398: UDIVcc_R	udivcc 	%r8, %r9, %r1
	.word 0xc4320009  ! 1401: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc8020009  ! 1401: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xf12221ec  ! 1401: STF_I	st	%f24, [0x01ec, %r8]
	.word 0xe1220009  ! 1404: STF_R	st	%f16, [%r9, %r8]
	.word 0xcd1a0009  ! 1404: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0x8143c000  ! 1404: STBAR	stbar
	.word 0xc53a0009  ! 1407: STDF_R	std	%f2, [%r9, %r8]
	.word 0xcc420009  ! 1407: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0x85222b70  ! 1407: MULScc_I	mulscc 	%r8, 0x0b70, %r2
	.word 0xfc220009  ! 1410: STW_R	stw	%r30, [%r8 + %r9]
	.word 0xc7020009  ! 1410: LDF_R	ld	[%r8, %r9], %f3
	.word 0x06800002  ! 1410: BL	bl  	<label_0x2>
	.word 0xc8220009  ! 1413: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc6020009  ! 1413: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xb85a234c  ! 1413: SMUL_I	smul 	%r8, 0x034c, %r28
	.word 0xcc2a0009  ! 1416: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xca0a0009  ! 1416: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xc2fa2d80  ! 1416: SWAPA_I	swapa	%r1, [%r8 + 0x0d80] %asi
	.word 0xc3220009  ! 1419: STF_R	st	%f1, [%r9, %r8]
	.word 0xfe020009  ! 1419: LDUW_R	lduw	[%r8 + %r9], %r31
	.word 0xc36a29a4  ! 1419: PREFETCH_I	prefetch	[%r8 + 0x09a4], #one_read
	.word 0xfc720009  ! 1422: STX_R	stx	%r30, [%r8 + %r9]
	.word 0xc24a0009  ! 1422: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0x8143c000  ! 1422: STBAR	stbar
	.word 0xe7220009  ! 1425: STF_R	st	%f19, [%r9, %r8]
	.word 0xc25a0009  ! 1425: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xc36a241c  ! 1425: PREFETCH_I	prefetch	[%r8 + 0x041c], #one_read
	.word 0xe1220009  ! 1428: STF_R	st	%f16, [%r9, %r8]
	.word 0xc91a0009  ! 1428: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0x8d6a0009  ! 1428: SDIVX_R	sdivx	%r8, %r9, %r6
	.word 0xee720009  ! 1431: STX_R	stx	%r23, [%r8 + %r9]
	.word 0xe40a0009  ! 1431: LDUB_R	ldub	[%r8 + %r9], %r18
	.word 0xc9e21009  ! 1431: CASA_I	casa	[%r8] 0x80, %r9, %r4
	.word 0xc33a0009  ! 1434: STDF_R	std	%f1, [%r9, %r8]
	.word 0xf7020009  ! 1434: LDF_R	ld	[%r8, %r9], %f27
	.word 0xe8a227c0  ! 1434: STWA_I	stwa	%r20, [%r8 + 0x07c0] %asi
	.word 0xc9220009  ! 1437: STF_R	st	%f4, [%r9, %r8]
	.word 0xca120009  ! 1437: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xce7a27c8  ! 1437: SWAP_I	swap	%r7, [%r8 + 0x07c8]
	.word 0xcb3a0009  ! 1440: STDF_R	std	%f5, [%r9, %r8]
	.word 0xc80a0009  ! 1440: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xc3ea221c  ! 1440: PREFETCHA_I	prefetcha	[%r8, + 0x021c] %asi, #one_read
	.word 0xc4720009  ! 1443: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xcf1a0009  ! 1443: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0x8ba208a9  ! 1443: FSUBs	fsubs	%f8, %f9, %f5
	.word 0xd6320009  ! 1446: STH_R	sth	%r11, [%r8 + %r9]
	.word 0xf4420009  ! 1446: LDSW_R	ldsw	[%r8 + %r9], %r26
	.word 0xc45a0009  ! 1446: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xc4720009  ! 1449: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xca520009  ! 1449: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xae7a2e98  ! 1449: SDIV_I	sdiv 	%r8, 0x0e98, %r23
	.word 0xde320009  ! 1452: STH_R	sth	%r15, [%r8 + %r9]
	.word 0xcd020009  ! 1452: LDF_R	ld	[%r8, %r9], %f6
	.word 0xc46a2ce4  ! 1452: LDSTUB_I	ldstub	%r2, [%r8 + 0x0ce4]
	.word 0xfc320009  ! 1455: STH_R	sth	%r30, [%r8 + %r9]
	.word 0xc6120009  ! 1455: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xc3ea1009  ! 1455: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xf2220009  ! 1458: STW_R	stw	%r25, [%r8 + %r9]
	.word 0xe5020009  ! 1458: LDF_R	ld	[%r8, %r9], %f18
	.word 0x8da20829  ! 1458: FADDs	fadds	%f8, %f9, %f6
	.word 0xea220009  ! 1461: STW_R	stw	%r21, [%r8 + %r9]
	.word 0xf4520009  ! 1461: LDSH_R	ldsh	[%r8 + %r9], %r26
	.word 0xc3ea2f34  ! 1461: PREFETCHA_I	prefetcha	[%r8, + 0x0f34] %asi, #one_read
	.word 0xc2720009  ! 1464: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xca020009  ! 1464: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0x8143e029  ! 1464: MEMBAR	membar	#LoadLoad | #StoreStore | #MemIssue 
	.word 0xcc720009  ! 1467: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xcc120009  ! 1467: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0x06c20001  ! 1467: BRLZ	brlz  ,nt	%8,<label_0x20001>
	.word 0xc6220009  ! 1470: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc51a0009  ! 1470: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0x8143e066  ! 1470: MEMBAR	membar	#StoreLoad | #LoadStore | #MemIssue | #Sync 
	.word 0xc22a0009  ! 1473: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc6020009  ! 1473: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xc49a2ee8  ! 1473: LDDA_I	ldda	[%r8, + 0x0ee8] %asi, %r2
	.word 0xc8320009  ! 1476: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xd91a0009  ! 1476: LDDF_R	ldd	[%r8, %r9], %f12
	.word 0x89a20929  ! 1476: FMULs	fmuls	%f8, %f9, %f4
	.word 0xea2a0009  ! 1479: STB_R	stb	%r21, [%r8 + %r9]
	.word 0xcc020009  ! 1479: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xc3ea1009  ! 1479: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xca720009  ! 1482: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xca020009  ! 1482: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xc33a2818  ! 1482: STDF_I	std	%f1, [0x0818, %r8]
	.word 0xde720009  ! 1485: STX_R	stx	%r15, [%r8 + %r9]
	.word 0xca5a0009  ! 1485: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xcada20a8  ! 1485: LDXA_I	ldxa	[%r8, + 0x00a8] %asi, %r5
	.word 0xd82a0009  ! 1488: STB_R	stb	%r12, [%r8 + %r9]
	.word 0xcc420009  ! 1488: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xc8ba1009  ! 1488: STDA_R	stda	%r4, [%r8 + %r9] 0x80
	.word 0xca2a0009  ! 1491: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xcf020009  ! 1491: LDF_R	ld	[%r8, %r9], %f7
	.word 0xc8a222fc  ! 1491: STWA_I	stwa	%r4, [%r8 + 0x02fc] %asi
	.word 0xc82a0009  ! 1494: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc60a0009  ! 1494: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xc7e21009  ! 1494: CASA_I	casa	[%r8] 0x80, %r9, %r3
	.word 0xef220009  ! 1497: STF_R	st	%f23, [%r9, %r8]
	.word 0xc45a0009  ! 1497: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xcafa2f74  ! 1497: SWAPA_I	swapa	%r5, [%r8 + 0x0f74] %asi
	.word 0xef3a0009  ! 1500: STDF_R	std	%f23, [%r9, %r8]
	.word 0xc51a0009  ! 1500: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0x02800001  ! 1500: BE	be  	<label_0x1>
	.word 0xfa2a0009  ! 1503: STB_R	stb	%r29, [%r8 + %r9]
	.word 0xc40a0009  ! 1503: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xcb022fa8  ! 1503: LDF_I	ld	[%r8, 0x0fa8], %f5
	.word 0xce320009  ! 1506: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xca4a0009  ! 1506: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0x8da20829  ! 1506: FADDs	fadds	%f8, %f9, %f6
	.word 0xc62a0009  ! 1509: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xcc020009  ! 1509: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xca6a26f8  ! 1509: LDSTUB_I	ldstub	%r5, [%r8 + 0x06f8]
	.word 0xce720009  ! 1512: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc24a0009  ! 1512: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xccca1009  ! 1512: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r6
	.word 0xee720009  ! 1515: STX_R	stx	%r23, [%r8 + %r9]
	.word 0xcc520009  ! 1515: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0x987a0009  ! 1515: SDIV_R	sdiv 	%r8, %r9, %r12
	.word 0xcf220009  ! 1518: STF_R	st	%f7, [%r9, %r8]
	.word 0xcb1a0009  ! 1518: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0x24c20001  ! 1518: BRLEZ	brlez,a,nt	%8,<label_0x20001>
	.word 0xcc320009  ! 1521: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc9020009  ! 1521: LDF_R	ld	[%r8, %r9], %f4
	.word 0x36800002  ! 1521: BGE	bge,a	<label_0x2>
	.word 0xd93a0009  ! 1524: STDF_R	std	%f12, [%r9, %r8]
	.word 0xd7020009  ! 1524: LDF_R	ld	[%r8, %r9], %f11
	.word 0x36800001  ! 1524: BGE	bge,a	<label_0x1>
	.word 0xcb220009  ! 1527: STF_R	st	%f5, [%r9, %r8]
	.word 0xc4520009  ! 1527: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xc53a0009  ! 1527: STDF_R	std	%f2, [%r9, %r8]
	.word 0xd7220009  ! 1530: STF_R	st	%f11, [%r9, %r8]
	.word 0xca0a0009  ! 1530: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0x3c800001  ! 1530: BPOS	bpos,a	<label_0x1>
	.word 0xca720009  ! 1533: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xd6020009  ! 1533: LDUW_R	lduw	[%r8 + %r9], %r11
	.word 0x96d22580  ! 1533: UMULcc_I	umulcc 	%r8, 0x0580, %r11
	.word 0xdf3a0009  ! 1536: STDF_R	std	%f15, [%r9, %r8]
	.word 0xe6120009  ! 1536: LDUH_R	lduh	[%r8 + %r9], %r19
	.word 0xc8420009  ! 1536: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xf2320009  ! 1539: STH_R	sth	%r25, [%r8 + %r9]
	.word 0xdc420009  ! 1539: LDSW_R	ldsw	[%r8 + %r9], %r14
	.word 0x8cda0009  ! 1539: SMULcc_R	smulcc 	%r8, %r9, %r6
	.word 0xfa720009  ! 1542: STX_R	stx	%r29, [%r8 + %r9]
	.word 0xc4020009  ! 1542: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xc8c228f8  ! 1542: LDSWA_I	ldswa	[%r8, + 0x08f8] %asi, %r4
	.word 0xca220009  ! 1545: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xca4a0009  ! 1545: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xf3f22009  ! 1545: CASXA_R	casxa	[%r8]%asi, %r9, %r25
	.word 0xe02a0009  ! 1548: STB_R	stb	%r16, [%r8 + %r9]
	.word 0xc25a0009  ! 1548: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xaa522234  ! 1548: UMUL_I	umul 	%r8, 0x0234, %r21
	.word 0xe42a0009  ! 1551: STB_R	stb	%r18, [%r8 + %r9]
	.word 0xcd1a0009  ! 1551: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0x24800002  ! 1551: BLE	ble,a	<label_0x2>
	.word 0xe8320009  ! 1554: STH_R	sth	%r20, [%r8 + %r9]
	.word 0xe45a0009  ! 1554: LDX_R	ldx	[%r8 + %r9], %r18
	.word 0x82520009  ! 1554: UMUL_R	umul 	%r8, %r9, %r1
	.word 0xf73a0009  ! 1557: STDF_R	std	%f27, [%r9, %r8]
	.word 0xc8020009  ! 1557: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xc36a2294  ! 1557: PREFETCH_I	prefetch	[%r8 + 0x0294], #one_read
	.word 0xca2a0009  ! 1560: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xcc420009  ! 1560: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xc44a217c  ! 1560: LDSB_I	ldsb	[%r8 + 0x017c], %r2
	.word 0xca720009  ! 1563: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xdd020009  ! 1563: LDF_R	ld	[%r8, %r9], %f14
	.word 0x8143c000  ! 1563: STBAR	stbar
	.word 0xea720009  ! 1566: STX_R	stx	%r21, [%r8 + %r9]
	.word 0xf8520009  ! 1566: LDSH_R	ldsh	[%r8 + %r9], %r28
	.word 0xf8520009  ! 1566: LDSH_R	ldsh	[%r8 + %r9], %r28
	.word 0xc73a0009  ! 1569: STDF_R	std	%f3, [%r9, %r8]
	.word 0xfc5a0009  ! 1569: LDX_R	ldx	[%r8 + %r9], %r30
	.word 0xcaf22280  ! 1569: STXA_I	stxa	%r5, [%r8 + 0x0280] %asi
	.word 0xf02a0009  ! 1572: STB_R	stb	%r24, [%r8 + %r9]
	.word 0xc2020009  ! 1572: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0x02c20001  ! 1572: BRZ	brz  ,nt	%8,<label_0x20001>
	.word 0xd6220009  ! 1575: STW_R	stw	%r11, [%r8 + %r9]
	.word 0xca4a0009  ! 1575: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xc5220009  ! 1575: STF_R	st	%f2, [%r9, %r8]
	.word 0xe42a0009  ! 1578: STB_R	stb	%r18, [%r8 + %r9]
	.word 0xe8120009  ! 1578: LDUH_R	lduh	[%r8 + %r9], %r20
	.word 0x85a208a9  ! 1578: FSUBs	fsubs	%f8, %f9, %f2
	.word 0xca2a0009  ! 1581: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc6420009  ! 1581: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xc3ea1009  ! 1581: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xcc220009  ! 1584: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc3020009  ! 1584: LDF_R	ld	[%r8, %r9], %f1
	.word 0xde7a0009  ! 1584: SWAP_R	swap	%r15, [%r8 + %r9]
	.word 0xc7220009  ! 1587: STF_R	st	%f3, [%r9, %r8]
	.word 0xee120009  ! 1587: LDUH_R	lduh	[%r8 + %r9], %r23
	.word 0x8143c000  ! 1587: STBAR	stbar
	.word 0xf42a0009  ! 1590: STB_R	stb	%r26, [%r8 + %r9]
	.word 0xcf1a0009  ! 1590: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xfcf21009  ! 1590: STXA_R	stxa	%r30, [%r8 + %r9] 0x80
	.word 0xc2720009  ! 1593: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xd64a0009  ! 1593: LDSB_R	ldsb	[%r8 + %r9], %r11
	.word 0xc36a2a40  ! 1593: PREFETCH_I	prefetch	[%r8 + 0x0a40], #one_read
	.word 0xdf3a0009  ! 1596: STDF_R	std	%f15, [%r9, %r8]
	.word 0xc6420009  ! 1596: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xcde22009  ! 1596: CASA_R	casa	[%r8] %asi, %r9, %r6
	.word 0xc4220009  ! 1599: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc44a0009  ! 1599: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xfe922d58  ! 1599: LDUHA_I	lduha	[%r8, + 0x0d58] %asi, %r31
	.word 0xc73a0009  ! 1602: STDF_R	std	%f3, [%r9, %r8]
	.word 0xf2520009  ! 1602: LDSH_R	ldsh	[%r8 + %r9], %r25
	.word 0xe4c2208c  ! 1602: LDSWA_I	ldswa	[%r8, + 0x008c] %asi, %r18
	.word 0xd6220009  ! 1605: STW_R	stw	%r11, [%r8 + %r9]
	.word 0xcc520009  ! 1605: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0x99a20829  ! 1605: FADDs	fadds	%f8, %f9, %f12
	.word 0xc93a0009  ! 1608: STDF_R	std	%f4, [%r9, %r8]
	.word 0xfa020009  ! 1608: LDUW_R	lduw	[%r8 + %r9], %r29
	.word 0xdeb21009  ! 1608: STHA_R	stha	%r15, [%r8 + %r9] 0x80
	.word 0xe2320009  ! 1611: STH_R	sth	%r17, [%r8 + %r9]
	.word 0xfa120009  ! 1611: LDUH_R	lduh	[%r8 + %r9], %r29
	.word 0xee4222ac  ! 1611: LDSW_I	ldsw	[%r8 + 0x02ac], %r23
	.word 0xc93a0009  ! 1614: STDF_R	std	%f4, [%r9, %r8]
	.word 0xce5a0009  ! 1614: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0x884a2d0c  ! 1614: MULX_I	mulx 	%r8, 0x0d0c, %r4
	.word 0xc6220009  ! 1617: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xda4a0009  ! 1617: LDSB_R	ldsb	[%r8 + %r9], %r13
	.word 0xcad222b4  ! 1617: LDSHA_I	ldsha	[%r8, + 0x02b4] %asi, %r5
	.word 0xe42a0009  ! 1620: STB_R	stb	%r18, [%r8 + %r9]
	.word 0xf8520009  ! 1620: LDSH_R	ldsh	[%r8 + %r9], %r28
	.word 0x86d225dc  ! 1620: UMULcc_I	umulcc 	%r8, 0x05dc, %r3
	.word 0xc8720009  ! 1623: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xfb1a0009  ! 1623: LDDF_R	ldd	[%r8, %r9], %f29
	.word 0xe5022eb4  ! 1623: LDF_I	ld	[%r8, 0x0eb4], %f18
	.word 0xf4720009  ! 1626: STX_R	stx	%r26, [%r8 + %r9]
	.word 0xc31a0009  ! 1626: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xc7e21009  ! 1626: CASA_I	casa	[%r8] 0x80, %r9, %r3
	.word 0xce720009  ! 1629: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc5020009  ! 1629: LDF_R	ld	[%r8, %r9], %f2
	.word 0xb12223f4  ! 1629: MULScc_I	mulscc 	%r8, 0x03f4, %r24
	.word 0xc93a0009  ! 1632: STDF_R	std	%f4, [%r9, %r8]
	.word 0xe4520009  ! 1632: LDSH_R	ldsh	[%r8 + %r9], %r18
	.word 0xcfe21009  ! 1632: CASA_I	casa	[%r8] 0x80, %r9, %r7
	.word 0xdf3a0009  ! 1635: STDF_R	std	%f15, [%r9, %r8]
	.word 0xe84a0009  ! 1635: LDSB_R	ldsb	[%r8 + %r9], %r20
	.word 0xb0520009  ! 1635: UMUL_R	umul 	%r8, %r9, %r24
	.word 0xc8720009  ! 1638: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xf25a0009  ! 1638: LDX_R	ldx	[%r8 + %r9], %r25
	.word 0xc8ba2840  ! 1638: STDA_I	stda	%r4, [%r8 + 0x0840] %asi
	.word 0xe02a0009  ! 1641: STB_R	stb	%r16, [%r8 + %r9]
	.word 0xca420009  ! 1641: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0x22c20001  ! 1641: BRZ	brz,a,nt	%8,<label_0x20001>
	.word 0xdc720009  ! 1644: STX_R	stx	%r14, [%r8 + %r9]
	.word 0xcb020009  ! 1644: LDF_R	ld	[%r8, %r9], %f5
	.word 0xc65a2358  ! 1644: LDX_I	ldx	[%r8 + 0x0358], %r3
	.word 0xc5220009  ! 1647: STF_R	st	%f2, [%r9, %r8]
	.word 0xde520009  ! 1647: LDSH_R	ldsh	[%r8 + %r9], %r15
	.word 0x04800001  ! 1647: BLE	ble  	<label_0x1>
	.word 0xc2320009  ! 1650: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xec520009  ! 1650: LDSH_R	ldsh	[%r8 + %r9], %r22
	.word 0xc4ba1009  ! 1650: STDA_R	stda	%r2, [%r8 + %r9] 0x80
	.word 0xc6320009  ! 1653: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xcc520009  ! 1653: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0x0c800002  ! 1653: BNEG	bneg  	<label_0x2>
	.word 0xc6220009  ! 1656: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xfc4a0009  ! 1656: LDSB_R	ldsb	[%r8 + %r9], %r30
	.word 0x82d20009  ! 1656: UMULcc_R	umulcc 	%r8, %r9, %r1
	.word 0xcb220009  ! 1659: STF_R	st	%f5, [%r9, %r8]
	.word 0xc3020009  ! 1659: LDF_R	ld	[%r8, %r9], %f1
	.word 0x26c20001  ! 1659: BRLZ	brlz,a,nt	%8,<label_0x20001>
	.word 0xc42a0009  ! 1662: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xe4020009  ! 1662: LDUW_R	lduw	[%r8 + %r9], %r18
	.word 0xc3ea2c10  ! 1662: PREFETCHA_I	prefetcha	[%r8, + 0x0c10] %asi, #one_read
	.word 0xc7220009  ! 1665: STF_R	st	%f3, [%r9, %r8]
	.word 0xc91a0009  ! 1665: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xcc7a29f0  ! 1665: SWAP_I	swap	%r6, [%r8 + 0x09f0]
	.word 0xc4320009  ! 1668: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xf31a0009  ! 1668: LDDF_R	ldd	[%r8, %r9], %f25
	.word 0xc36a22f8  ! 1668: PREFETCH_I	prefetch	[%r8 + 0x02f8], #one_read
	.word 0xcb220009  ! 1671: STF_R	st	%f5, [%r9, %r8]
	.word 0xc8420009  ! 1671: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xca9227cc  ! 1671: LDUHA_I	lduha	[%r8, + 0x07cc] %asi, %r5
	.word 0xc5220009  ! 1674: STF_R	st	%f2, [%r9, %r8]
	.word 0xc51a0009  ! 1674: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xe84a2074  ! 1674: LDSB_I	ldsb	[%r8 + 0x0074], %r20
	.word 0xf2220009  ! 1677: STW_R	stw	%r25, [%r8 + %r9]
	.word 0xdd020009  ! 1677: LDF_R	ld	[%r8, %r9], %f14
	.word 0x8143c000  ! 1677: STBAR	stbar
	.word 0xce220009  ! 1680: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xf2420009  ! 1680: LDSW_R	ldsw	[%r8 + %r9], %r25
	.word 0x8143c000  ! 1680: STBAR	stbar
	.word 0xd8720009  ! 1683: STX_R	stx	%r12, [%r8 + %r9]
	.word 0xc2120009  ! 1683: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0x06800001  ! 1683: BL	bl  	<label_0x1>
	.word 0xc4720009  ! 1686: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc2420009  ! 1686: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xc7222e90  ! 1686: STF_I	st	%f3, [0x0e90, %r8]
	.word 0xca320009  ! 1689: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc4020009  ! 1689: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xee0a2d84  ! 1689: LDUB_I	ldub	[%r8 + 0x0d84], %r23
	.word 0xfe720009  ! 1692: STX_R	stx	%r31, [%r8 + %r9]
	.word 0xc3020009  ! 1692: LDF_R	ld	[%r8, %r9], %f1
	.word 0xe25a2660  ! 1692: LDX_I	ldx	[%r8 + 0x0660], %r17
	.word 0xcb220009  ! 1695: STF_R	st	%f5, [%r9, %r8]
	.word 0xc20a0009  ! 1695: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0x86d22830  ! 1695: UMULcc_I	umulcc 	%r8, 0x0830, %r3
	.word 0xeb3a0009  ! 1698: STDF_R	std	%f21, [%r9, %r8]
	.word 0xcb1a0009  ! 1698: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xc8aa1009  ! 1698: STBA_R	stba	%r4, [%r8 + %r9] 0x80
	.word 0xe33a0009  ! 1701: STDF_R	std	%f17, [%r9, %r8]
	.word 0xcc120009  ! 1701: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xd6ca28e4  ! 1701: LDSBA_I	ldsba	[%r8, + 0x08e4] %asi, %r11
	.word 0xcd220009  ! 1704: STF_R	st	%f6, [%r9, %r8]
	.word 0xff1a0009  ! 1704: LDDF_R	ldd	[%r8, %r9], %f31
	.word 0xca821009  ! 1704: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r5
	.word 0xc6320009  ! 1707: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xe40a0009  ! 1707: LDUB_R	ldub	[%r8 + %r9], %r18
	.word 0xc52227a8  ! 1707: STF_I	st	%f2, [0x07a8, %r8]
	.word 0xe62a0009  ! 1710: STB_R	stb	%r19, [%r8 + %r9]
	.word 0xcb1a0009  ! 1710: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0x8f6a279c  ! 1710: SDIVX_I	sdivx	%r8, 0x079c, %r7
	.word 0xc73a0009  ! 1713: STDF_R	std	%f3, [%r9, %r8]
	.word 0xe71a0009  ! 1713: LDDF_R	ldd	[%r8, %r9], %f19
	.word 0x24ca0001  ! 1713: BRLEZ	brlez,a,pt	%8,<label_0xa0001>
	.word 0xcc2a0009  ! 1716: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xcc020009  ! 1716: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0x85a209a9  ! 1716: FDIVs	fdivs	%f8, %f9, %f2
	.word 0xca2a0009  ! 1719: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xce420009  ! 1719: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0x8d6a20a8  ! 1719: SDIVX_I	sdivx	%r8, 0x00a8, %r6
	.word 0xcc2a0009  ! 1722: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc2020009  ! 1722: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0x8e520009  ! 1722: UMUL_R	umul 	%r8, %r9, %r7
	.word 0xce320009  ! 1725: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc84a0009  ! 1725: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0x8f22277c  ! 1725: MULScc_I	mulscc 	%r8, 0x077c, %r7
	.word 0xc6720009  ! 1728: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc64a0009  ! 1728: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xe4a21009  ! 1728: STWA_R	stwa	%r18, [%r8 + %r9] 0x80
	.word 0xe22a0009  ! 1731: STB_R	stb	%r17, [%r8 + %r9]
	.word 0xf84a0009  ! 1731: LDSB_R	ldsb	[%r8 + %r9], %r28
	.word 0x26800001  ! 1731: BL	bl,a	<label_0x1>
	.word 0xde720009  ! 1734: STX_R	stx	%r15, [%r8 + %r9]
	.word 0xfc420009  ! 1734: LDSW_R	ldsw	[%r8 + %r9], %r30
	.word 0xc642213c  ! 1734: LDSW_I	ldsw	[%r8 + 0x013c], %r3
	.word 0xf9220009  ! 1737: STF_R	st	%f28, [%r9, %r8]
	.word 0xcb1a0009  ! 1737: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xb9a20929  ! 1737: FMULs	fmuls	%f8, %f9, %f28
	.word 0xc22a0009  ! 1740: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xea020009  ! 1740: LDUW_R	lduw	[%r8 + %r9], %r21
	.word 0x8d220009  ! 1740: MULScc_R	mulscc 	%r8, %r9, %r6
	.word 0xf22a0009  ! 1743: STB_R	stb	%r25, [%r8 + %r9]
	.word 0xc84a0009  ! 1743: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xceea2dfc  ! 1743: LDSTUBA_I	ldstuba	%r7, [%r8 + 0x0dfc] %asi
	.word 0xc93a0009  ! 1746: STDF_R	std	%f4, [%r9, %r8]
	.word 0xe84a0009  ! 1746: LDSB_R	ldsb	[%r8 + %r9], %r20
	.word 0xe8f21009  ! 1746: STXA_R	stxa	%r20, [%r8 + %r9] 0x80
	.word 0xcc720009  ! 1749: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xca120009  ! 1749: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xce8a1009  ! 1749: LDUBA_R	lduba	[%r8, %r9] 0x80, %r7
	.word 0xc42a0009  ! 1752: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xcd020009  ! 1752: LDF_R	ld	[%r8, %r9], %f6
	.word 0xa25228ec  ! 1752: UMUL_I	umul 	%r8, 0x08ec, %r17
	.word 0xc42a0009  ! 1755: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xce4a0009  ! 1755: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0x98d20009  ! 1755: UMULcc_R	umulcc 	%r8, %r9, %r12
	.word 0xcc220009  ! 1758: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xfd1a0009  ! 1758: LDDF_R	ldd	[%r8, %r9], %f30
	.word 0xc3ea2fe4  ! 1758: PREFETCHA_I	prefetcha	[%r8, + 0x0fe4] %asi, #one_read
	.word 0xf33a0009  ! 1761: STDF_R	std	%f25, [%r9, %r8]
	.word 0xe8420009  ! 1761: LDSW_R	ldsw	[%r8 + %r9], %r20
	.word 0x8da209a9  ! 1761: FDIVs	fdivs	%f8, %f9, %f6
	.word 0xcc220009  ! 1764: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xca4a0009  ! 1764: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0x86da2614  ! 1764: SMULcc_I	smulcc 	%r8, 0x0614, %r3
	.word 0xce320009  ! 1767: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xe05a0009  ! 1767: LDX_R	ldx	[%r8 + %r9], %r16
	.word 0xc2120009  ! 1767: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xc8220009  ! 1770: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xcf020009  ! 1770: LDF_R	ld	[%r8, %r9], %f7
	.word 0xed1a0009  ! 1770: LDDF_R	ldd	[%r8, %r9], %f22
	.word 0xcd220009  ! 1773: STF_R	st	%f6, [%r9, %r8]
	.word 0xcc120009  ! 1773: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xc5222f58  ! 1773: STF_I	st	%f2, [0x0f58, %r8]
	.word 0xe73a0009  ! 1776: STDF_R	std	%f19, [%r9, %r8]
	.word 0xcc020009  ! 1776: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xc3ea2368  ! 1776: PREFETCHA_I	prefetcha	[%r8, + 0x0368] %asi, #one_read
	.word 0xc3220009  ! 1779: STF_R	st	%f1, [%r9, %r8]
	.word 0xc65a0009  ! 1779: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0x22ca0001  ! 1779: BRZ	brz,a,pt	%8,<label_0xa0001>
	.word 0xea2a0009  ! 1782: STB_R	stb	%r21, [%r8 + %r9]
	.word 0xc64a0009  ! 1782: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0x04c20001  ! 1782: BRLEZ	brlez  ,nt	%8,<label_0x20001>
	.word 0xc22a0009  ! 1785: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xe6120009  ! 1785: LDUH_R	lduh	[%r8 + %r9], %r19
	.word 0xc7220009  ! 1785: STF_R	st	%f3, [%r9, %r8]
	.word 0xcc720009  ! 1788: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xfe020009  ! 1788: LDUW_R	lduw	[%r8 + %r9], %r31
	.word 0x8da20929  ! 1788: FMULs	fmuls	%f8, %f9, %f6
	.word 0xee220009  ! 1791: STW_R	stw	%r23, [%r8 + %r9]
	.word 0xca020009  ! 1791: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xccc22a30  ! 1791: LDSWA_I	ldswa	[%r8, + 0x0a30] %asi, %r6
	.word 0xc7220009  ! 1794: STF_R	st	%f3, [%r9, %r8]
	.word 0xc3020009  ! 1794: LDF_R	ld	[%r8, %r9], %f1
	.word 0xa4d20009  ! 1794: UMULcc_R	umulcc 	%r8, %r9, %r18
	.word 0xe6320009  ! 1797: STH_R	sth	%r19, [%r8 + %r9]
	.word 0xca4a0009  ! 1797: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xc6aa2598  ! 1797: STBA_I	stba	%r3, [%r8 + 0x0598] %asi
	.word 0xc2220009  ! 1800: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc2520009  ! 1800: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xc8ba26e0  ! 1800: STDA_I	stda	%r4, [%r8 + 0x06e0] %asi
	.word 0xc2320009  ! 1803: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc5020009  ! 1803: LDF_R	ld	[%r8, %r9], %f2
	.word 0xeeda1009  ! 1803: LDXA_R	ldxa	[%r8, %r9] 0x80, %r23
	.word 0xc73a0009  ! 1806: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc4420009  ! 1806: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0x1a800001  ! 1806: BCC	bcc  	<label_0x1>
	.word 0xcc720009  ! 1809: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xce120009  ! 1809: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0x8ada2bf4  ! 1809: SMULcc_I	smulcc 	%r8, 0x0bf4, %r5
	.word 0xc73a0009  ! 1812: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc31a0009  ! 1812: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0x8ef20009  ! 1812: UDIVcc_R	udivcc 	%r8, %r9, %r7
	.word 0xea320009  ! 1815: STH_R	sth	%r21, [%r8 + %r9]
	.word 0xce120009  ! 1815: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0x22c20001  ! 1815: BRZ	brz,a,nt	%8,<label_0x20001>
	.word 0xc4720009  ! 1818: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xcf020009  ! 1818: LDF_R	ld	[%r8, %r9], %f7
	.word 0xc6821009  ! 1818: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r3
	.word 0xc2320009  ! 1821: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xf60a0009  ! 1821: LDUB_R	ldub	[%r8 + %r9], %r27
	.word 0x86520009  ! 1821: UMUL_R	umul 	%r8, %r9, %r3
	.word 0xd6220009  ! 1824: STW_R	stw	%r11, [%r8 + %r9]
	.word 0xe11a0009  ! 1824: LDDF_R	ldd	[%r8, %r9], %f16
	.word 0xc3ea1009  ! 1824: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xe73a0009  ! 1827: STDF_R	std	%f19, [%r9, %r8]
	.word 0xc8120009  ! 1827: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0x8143c000  ! 1827: STBAR	stbar
	.word 0xce320009  ! 1830: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xcb1a0009  ! 1830: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xcaca1009  ! 1830: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r5
	.word 0xc3220009  ! 1833: STF_R	st	%f1, [%r9, %r8]
	.word 0xff1a0009  ! 1833: LDDF_R	ldd	[%r8, %r9], %f31
	.word 0x2c800001  ! 1833: BNEG	bneg,a	<label_0x1>
	.word 0xce720009  ! 1836: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xde520009  ! 1836: LDSH_R	ldsh	[%r8 + %r9], %r15
	.word 0xcafa1009  ! 1836: SWAPA_R	swapa	%r5, [%r8 + %r9] 0x80
	.word 0xc6720009  ! 1839: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xe05a0009  ! 1839: LDX_R	ldx	[%r8 + %r9], %r16
	.word 0xc88a1009  ! 1839: LDUBA_R	lduba	[%r8, %r9] 0x80, %r4
	.word 0xc2720009  ! 1842: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xf45a0009  ! 1842: LDX_R	ldx	[%r8 + %r9], %r26
	.word 0xccea2f18  ! 1842: LDSTUBA_I	ldstuba	%r6, [%r8 + 0x0f18] %asi
	.word 0xcc720009  ! 1845: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xce0a0009  ! 1845: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xfab21009  ! 1845: STHA_R	stha	%r29, [%r8 + %r9] 0x80
	.word 0xdc720009  ! 1848: STX_R	stx	%r14, [%r8 + %r9]
	.word 0xc9020009  ! 1848: LDF_R	ld	[%r8, %r9], %f4
	.word 0xceea2b1c  ! 1848: LDSTUBA_I	ldstuba	%r7, [%r8 + 0x0b1c] %asi
	.word 0xcc720009  ! 1851: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc4020009  ! 1851: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xc2f22948  ! 1851: STXA_I	stxa	%r1, [%r8 + 0x0948] %asi
	.word 0xc42a0009  ! 1854: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc80a0009  ! 1854: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0x8143c000  ! 1854: STBAR	stbar
	.word 0xcf220009  ! 1857: STF_R	st	%f7, [%r9, %r8]
	.word 0xc5020009  ! 1857: LDF_R	ld	[%r8, %r9], %f2
	.word 0xc6ea1009  ! 1857: LDSTUBA_R	ldstuba	%r3, [%r8 + %r9] 0x80
	.word 0xc4320009  ! 1860: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xcc4a0009  ! 1860: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xc36a0009  ! 1860: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xca320009  ! 1863: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc20a0009  ! 1863: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xe6da1009  ! 1863: LDXA_R	ldxa	[%r8, %r9] 0x80, %r19
	.word 0xcb220009  ! 1866: STF_R	st	%f5, [%r9, %r8]
	.word 0xf0420009  ! 1866: LDSW_R	ldsw	[%r8 + %r9], %r24
	.word 0x06800001  ! 1866: BL	bl  	<label_0x1>
	.word 0xc33a0009  ! 1869: STDF_R	std	%f1, [%r9, %r8]
	.word 0xe44a0009  ! 1869: LDSB_R	ldsb	[%r8 + %r9], %r18
	.word 0xd8f21009  ! 1869: STXA_R	stxa	%r12, [%r8 + %r9] 0x80
	.word 0xd9220009  ! 1872: STF_R	st	%f12, [%r9, %r8]
	.word 0xc5020009  ! 1872: LDF_R	ld	[%r8, %r9], %f2
	.word 0x97a209a9  ! 1872: FDIVs	fdivs	%f8, %f9, %f11
	.word 0xd9220009  ! 1875: STF_R	st	%f12, [%r9, %r8]
	.word 0xc2120009  ! 1875: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xecc21009  ! 1875: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r22
	.word 0xe33a0009  ! 1878: STDF_R	std	%f17, [%r9, %r8]
	.word 0xce420009  ! 1878: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xf4f21009  ! 1878: STXA_R	stxa	%r26, [%r8 + %r9] 0x80
	.word 0xef220009  ! 1881: STF_R	st	%f23, [%r9, %r8]
	.word 0xe4520009  ! 1881: LDSH_R	ldsh	[%r8 + %r9], %r18
	.word 0xc36a0009  ! 1881: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc6720009  ! 1884: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xe8520009  ! 1884: LDSH_R	ldsh	[%r8 + %r9], %r20
	.word 0x8143e07b  ! 1884: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xf4220009  ! 1887: STW_R	stw	%r26, [%r8 + %r9]
	.word 0xc65a0009  ! 1887: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xcbf21009  ! 1887: CASXA_I	casxa	[%r8] 0x80, %r9, %r5
	.word 0xf33a0009  ! 1890: STDF_R	std	%f25, [%r9, %r8]
	.word 0xfa420009  ! 1890: LDSW_R	ldsw	[%r8 + %r9], %r29
	.word 0xc6f21009  ! 1890: STXA_R	stxa	%r3, [%r8 + %r9] 0x80
	.word 0xc8320009  ! 1893: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xee520009  ! 1893: LDSH_R	ldsh	[%r8 + %r9], %r23
	.word 0xcff22009  ! 1893: CASXA_R	casxa	[%r8]%asi, %r9, %r7
	.word 0xda320009  ! 1896: STH_R	sth	%r13, [%r8 + %r9]
	.word 0xf8520009  ! 1896: LDSH_R	ldsh	[%r8 + %r9], %r28
	.word 0xfcea28c0  ! 1896: LDSTUBA_I	ldstuba	%r30, [%r8 + 0x08c0] %asi
	.word 0xcb220009  ! 1899: STF_R	st	%f5, [%r9, %r8]
	.word 0xc20a0009  ! 1899: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0x8143c000  ! 1899: STBAR	stbar
	.word 0xcb220009  ! 1902: STF_R	st	%f5, [%r9, %r8]
	.word 0xc8420009  ! 1902: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0x8143e062  ! 1902: MEMBAR	membar	#StoreLoad | #MemIssue | #Sync 
	.word 0xeb220009  ! 1905: STF_R	st	%f21, [%r9, %r8]
	.word 0xf0520009  ! 1905: LDSH_R	ldsh	[%r8 + %r9], %r24
	.word 0xe53a0009  ! 1905: STDF_R	std	%f18, [%r9, %r8]
	.word 0xcf3a0009  ! 1908: STDF_R	std	%f7, [%r9, %r8]
	.word 0xfa520009  ! 1908: LDSH_R	ldsh	[%r8 + %r9], %r29
	.word 0x8a52216c  ! 1908: UMUL_I	umul 	%r8, 0x016c, %r5
	.word 0xcb220009  ! 1911: STF_R	st	%f5, [%r9, %r8]
	.word 0xc2020009  ! 1911: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xc8922490  ! 1911: LDUHA_I	lduha	[%r8, + 0x0490] %asi, %r4
	.word 0xed220009  ! 1914: STF_R	st	%f22, [%r9, %r8]
	.word 0xf4120009  ! 1914: LDUH_R	lduh	[%r8 + %r9], %r26
	.word 0xd7e22009  ! 1914: CASA_R	casa	[%r8] %asi, %r9, %r11
	.word 0xc2320009  ! 1917: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc2520009  ! 1917: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0x8a4a2edc  ! 1917: MULX_I	mulx 	%r8, 0x0edc, %r5
	.word 0xc53a0009  ! 1920: STDF_R	std	%f2, [%r9, %r8]
	.word 0xce520009  ! 1920: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0x845a2940  ! 1920: SMUL_I	smul 	%r8, 0x0940, %r2
	.word 0xfc220009  ! 1923: STW_R	stw	%r30, [%r8 + %r9]
	.word 0xe80a0009  ! 1923: LDUB_R	ldub	[%r8 + %r9], %r20
	.word 0xee7a2e20  ! 1923: SWAP_I	swap	%r23, [%r8 + 0x0e20]
	.word 0xc7220009  ! 1926: STF_R	st	%f3, [%r9, %r8]
	.word 0xec5a0009  ! 1926: LDX_R	ldx	[%r8 + %r9], %r22
	.word 0x2aca0001  ! 1926: BRNZ	brnz,a,pt	%8,<label_0xa0001>
	.word 0xff220009  ! 1929: STF_R	st	%f31, [%r9, %r8]
	.word 0xc91a0009  ! 1929: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xaa520009  ! 1929: UMUL_R	umul 	%r8, %r9, %r21
	.word 0xe0720009  ! 1932: STX_R	stx	%r16, [%r8 + %r9]
	.word 0xca420009  ! 1932: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xc5f21009  ! 1932: CASXA_I	casxa	[%r8] 0x80, %r9, %r2
	.word 0xe9220009  ! 1935: STF_R	st	%f20, [%r9, %r8]
	.word 0xc40a0009  ! 1935: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xc8a22fdc  ! 1935: STWA_I	stwa	%r4, [%r8 + 0x0fdc] %asi
	.word 0xe22a0009  ! 1938: STB_R	stb	%r17, [%r8 + %r9]
	.word 0xcc120009  ! 1938: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xcb220009  ! 1938: STF_R	st	%f5, [%r9, %r8]
	.word 0xcd220009  ! 1941: STF_R	st	%f6, [%r9, %r8]
	.word 0xee5a0009  ! 1941: LDX_R	ldx	[%r8 + %r9], %r23
	.word 0xc3f22009  ! 1941: CASXA_R	casxa	[%r8]%asi, %r9, %r1
	.word 0xcf220009  ! 1944: STF_R	st	%f7, [%r9, %r8]
	.word 0xef1a0009  ! 1944: LDDF_R	ldd	[%r8, %r9], %f23
	.word 0xc27a2054  ! 1944: SWAP_I	swap	%r1, [%r8 + 0x0054]
	.word 0xce2a0009  ! 1947: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xdc020009  ! 1947: LDUW_R	lduw	[%r8 + %r9], %r14
	.word 0xcf020009  ! 1947: LDF_R	ld	[%r8, %r9], %f7
	.word 0xc33a0009  ! 1950: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc2520009  ! 1950: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xc2122de8  ! 1950: LDUH_I	lduh	[%r8 + 0x0de8], %r1
	.word 0xc22a0009  ! 1953: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xcb020009  ! 1953: LDF_R	ld	[%r8, %r9], %f5
	.word 0xee922034  ! 1953: LDUHA_I	lduha	[%r8, + 0x0034] %asi, %r23
	.word 0xc82a0009  ! 1956: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xea420009  ! 1956: LDSW_R	ldsw	[%r8 + %r9], %r21
	.word 0x8143e00e  ! 1956: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore 
	.word 0xc6320009  ! 1959: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc65a0009  ! 1959: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xcc6a27a0  ! 1959: LDSTUB_I	ldstub	%r6, [%r8 + 0x07a0]
	.word 0xc6220009  ! 1962: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc31a0009  ! 1962: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xc33a0009  ! 1962: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc33a0009  ! 1965: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc2420009  ! 1965: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xc6ea2c78  ! 1965: LDSTUBA_I	ldstuba	%r3, [%r8 + 0x0c78] %asi
	.word 0xce2a0009  ! 1968: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc4020009  ! 1968: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xce420009  ! 1968: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xc8320009  ! 1971: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xd6020009  ! 1971: LDUW_R	lduw	[%r8 + %r9], %r11
	.word 0xc36a0009  ! 1971: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc6320009  ! 1974: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc8020009  ! 1974: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xca8a29f0  ! 1974: LDUBA_I	lduba	[%r8, + 0x09f0] %asi, %r5
	.word 0xc6220009  ! 1977: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xff020009  ! 1977: LDF_R	ld	[%r8, %r9], %f31
	.word 0x887a0009  ! 1977: SDIV_R	sdiv 	%r8, %r9, %r4
	.word 0xc2320009  ! 1980: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc6420009  ! 1980: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xc3ea243c  ! 1980: PREFETCHA_I	prefetcha	[%r8, + 0x043c] %asi, #one_read
	.word 0xc4320009  ! 1983: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xcc020009  ! 1983: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xcac22098  ! 1983: LDSWA_I	ldswa	[%r8, + 0x0098] %asi, %r5
	.word 0xef220009  ! 1986: STF_R	st	%f23, [%r9, %r8]
	.word 0xe0520009  ! 1986: LDSH_R	ldsh	[%r8 + %r9], %r16
	.word 0xaef20009  ! 1986: UDIVcc_R	udivcc 	%r8, %r9, %r23
	.word 0xcc320009  ! 1989: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xca5a0009  ! 1989: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0x8143e005  ! 1989: MEMBAR	membar	#LoadLoad | #LoadStore 
	.word 0xc2720009  ! 1992: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc4020009  ! 1992: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0x40000002  ! 1992: CALL	call	disp30_2
	.word 0xc4320009  ! 1995: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xea4a0009  ! 1995: LDSB_R	ldsb	[%r8 + %r9], %r21
	.word 0xc6ea2714  ! 1995: LDSTUBA_I	ldstuba	%r3, [%r8 + 0x0714] %asi
	.word 0xcd3a0009  ! 1998: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc4420009  ! 1998: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xc3ea2834  ! 1998: PREFETCHA_I	prefetcha	[%r8, + 0x0834] %asi, #one_read
	.word 0xfe2a0009  ! 2001: STB_R	stb	%r31, [%r8 + %r9]
	.word 0xef1a0009  ! 2001: LDDF_R	ldd	[%r8, %r9], %f23
	.word 0x8143e072  ! 2001: MEMBAR	membar	#StoreLoad | #Lookaside | #MemIssue | #Sync 
	.word 0xc33a0009  ! 2004: STDF_R	std	%f1, [%r9, %r8]
	.word 0xce5a0009  ! 2004: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0x82d22c44  ! 2004: UMULcc_I	umulcc 	%r8, 0x0c44, %r1
	.word 0xda720009  ! 2007: STX_R	stx	%r13, [%r8 + %r9]
	.word 0xd7020009  ! 2007: LDF_R	ld	[%r8, %r9], %f11
	.word 0x8afa0009  ! 2007: SDIVcc_R	sdivcc 	%r8, %r9, %r5
	.word 0xc53a0009  ! 2010: STDF_R	std	%f2, [%r9, %r8]
	.word 0xcc020009  ! 2010: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xf2da2598  ! 2010: LDXA_I	ldxa	[%r8, + 0x0598] %asi, %r25
	.word 0xc2220009  ! 2013: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xcf1a0009  ! 2013: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0x85a20929  ! 2013: FMULs	fmuls	%f8, %f9, %f2
	.word 0xcb3a0009  ! 2016: STDF_R	std	%f5, [%r9, %r8]
	.word 0xce120009  ! 2016: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0x2cca0001  ! 2016: BRGZ	brgz,a,pt	%8,<label_0xa0001>
	.word 0xc33a0009  ! 2019: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc80a0009  ! 2019: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xfd1a2668  ! 2019: LDDF_I	ldd	[%r8, 0x0668], %f30
	.word 0xc8320009  ! 2022: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc2420009  ! 2022: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xcc822bd4  ! 2022: LDUWA_I	lduwa	[%r8, + 0x0bd4] %asi, %r6
	.word 0xc42a0009  ! 2025: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xf11a0009  ! 2025: LDDF_R	ldd	[%r8, %r9], %f24
	.word 0xc2fa1009  ! 2025: SWAPA_R	swapa	%r1, [%r8 + %r9] 0x80
	.word 0xc8220009  ! 2028: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xce420009  ! 2028: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xceda1009  ! 2028: LDXA_R	ldxa	[%r8, %r9] 0x80, %r7
	.word 0xd8320009  ! 2031: STH_R	sth	%r12, [%r8 + %r9]
	.word 0xca020009  ! 2031: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xc2d226fc  ! 2031: LDSHA_I	ldsha	[%r8, + 0x06fc] %asi, %r1
	.word 0xc2220009  ! 2034: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xf80a0009  ! 2034: LDUB_R	ldub	[%r8 + %r9], %r28
	.word 0x8143c000  ! 2034: STBAR	stbar
	.word 0xde320009  ! 2037: STH_R	sth	%r15, [%r8 + %r9]
	.word 0xce420009  ! 2037: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xc2120009  ! 2037: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xe42a0009  ! 2040: STB_R	stb	%r18, [%r8 + %r9]
	.word 0xcc120009  ! 2040: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xfafa28e0  ! 2040: SWAPA_I	swapa	%r29, [%r8 + 0x08e0] %asi
	.word 0xc4720009  ! 2043: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc3020009  ! 2043: LDF_R	ld	[%r8, %r9], %f1
	.word 0xc3ea25f4  ! 2043: PREFETCHA_I	prefetcha	[%r8, + 0x05f4] %asi, #one_read
	.word 0xc3220009  ! 2046: STF_R	st	%f1, [%r9, %r8]
	.word 0xe2120009  ! 2046: LDUH_R	lduh	[%r8 + %r9], %r17
	.word 0xc2d22c8c  ! 2046: LDSHA_I	ldsha	[%r8, + 0x0c8c] %asi, %r1
	.word 0xeb3a0009  ! 2049: STDF_R	std	%f21, [%r9, %r8]
	.word 0xf7020009  ! 2049: LDF_R	ld	[%r8, %r9], %f27
	.word 0xc8922cec  ! 2049: LDUHA_I	lduha	[%r8, + 0x0cec] %asi, %r4
	.word 0xc8220009  ! 2052: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc71a0009  ! 2052: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xcc8a2d94  ! 2052: LDUBA_I	lduba	[%r8, + 0x0d94] %asi, %r6
	.word 0xfc720009  ! 2055: STX_R	stx	%r30, [%r8 + %r9]
	.word 0xee5a0009  ! 2055: LDX_R	ldx	[%r8 + %r9], %r23
	.word 0xdeaa1009  ! 2055: STBA_R	stba	%r15, [%r8 + %r9] 0x80
	.word 0xde220009  ! 2058: STW_R	stw	%r15, [%r8 + %r9]
	.word 0xca020009  ! 2058: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xc87a0009  ! 2058: SWAP_R	swap	%r4, [%r8 + %r9]
	.word 0xc8720009  ! 2061: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xce5a0009  ! 2061: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xc86a0009  ! 2061: LDSTUB_R	ldstub	%r4, [%r8 + %r9]
	.word 0xd6220009  ! 2064: STW_R	stw	%r11, [%r8 + %r9]
	.word 0xc7020009  ! 2064: LDF_R	ld	[%r8, %r9], %f3
	.word 0xc452219c  ! 2064: LDSH_I	ldsh	[%r8 + 0x019c], %r2
	.word 0xe82a0009  ! 2067: STB_R	stb	%r20, [%r8 + %r9]
	.word 0xce5a0009  ! 2067: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0x8fa20929  ! 2067: FMULs	fmuls	%f8, %f9, %f7
	.word 0xcc220009  ! 2070: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xf0520009  ! 2070: LDSH_R	ldsh	[%r8 + %r9], %r24
	.word 0xc5f22009  ! 2070: CASXA_R	casxa	[%r8]%asi, %r9, %r2
	.word 0xca2a0009  ! 2073: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xce4a0009  ! 2073: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xe01223a8  ! 2073: LDUH_I	lduh	[%r8 + 0x03a8], %r16
	.word 0xc6720009  ! 2076: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc91a0009  ! 2076: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xcafa20a4  ! 2076: SWAPA_I	swapa	%r5, [%r8 + 0x00a4] %asi
	.word 0xe0220009  ! 2079: STW_R	stw	%r16, [%r8 + %r9]
	.word 0xfa0a0009  ! 2079: LDUB_R	ldub	[%r8 + %r9], %r29
	.word 0xc8b223d8  ! 2079: STHA_I	stha	%r4, [%r8 + 0x03d8] %asi
	.word 0xc4720009  ! 2082: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xcb020009  ! 2082: LDF_R	ld	[%r8, %r9], %f5
	.word 0xca0222fc  ! 2082: LDUW_I	lduw	[%r8 + 0x02fc], %r5
	.word 0xc22a0009  ! 2085: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xce020009  ! 2085: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xf8b21009  ! 2085: STHA_R	stha	%r28, [%r8 + %r9] 0x80
	.word 0xcd220009  ! 2088: STF_R	st	%f6, [%r9, %r8]
	.word 0xce5a0009  ! 2088: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0x8143e041  ! 2088: MEMBAR	membar	#LoadLoad | #Sync 
	.word 0xc6320009  ! 2091: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc44a0009  ! 2091: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xe41a2970  ! 2091: LDD_I	ldd	[%r8 + 0x0970], %r18
	.word 0xc53a0009  ! 2094: STDF_R	std	%f2, [%r9, %r8]
	.word 0xff1a0009  ! 2094: LDDF_R	ldd	[%r8, %r9], %f31
	.word 0x00800001  ! 2094: BN	bn  	<label_0x1>
	.word 0xc53a0009  ! 2097: STDF_R	std	%f2, [%r9, %r8]
	.word 0xcc5a0009  ! 2097: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xa44a0009  ! 2097: MULX_R	mulx 	%r8, %r9, %r18
	.word 0xff3a0009  ! 2100: STDF_R	std	%f31, [%r9, %r8]
	.word 0xcc4a0009  ! 2100: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xcf3a28d0  ! 2100: STDF_I	std	%f7, [0x08d0, %r8]
	.word 0xce2a0009  ! 2103: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xcc4a0009  ! 2103: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xc46a21dc  ! 2103: LDSTUB_I	ldstub	%r2, [%r8 + 0x01dc]
	.word 0xd6220009  ! 2106: STW_R	stw	%r11, [%r8 + %r9]
	.word 0xce120009  ! 2106: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0x8b6a0009  ! 2106: SDIVX_R	sdivx	%r8, %r9, %r5
	.word 0xcb220009  ! 2109: STF_R	st	%f5, [%r9, %r8]
	.word 0xca120009  ! 2109: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xccb224f4  ! 2109: STHA_I	stha	%r6, [%r8 + 0x04f4] %asi
	.word 0xc82a0009  ! 2112: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc2420009  ! 2112: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xc2fa1009  ! 2112: SWAPA_R	swapa	%r1, [%r8 + %r9] 0x80
	.word 0xdc220009  ! 2115: STW_R	stw	%r14, [%r8 + %r9]
	.word 0xe45a0009  ! 2115: LDX_R	ldx	[%r8 + %r9], %r18
	.word 0xeeca1009  ! 2115: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r23
	.word 0xca2a0009  ! 2118: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc60a0009  ! 2118: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xceda1009  ! 2118: LDXA_R	ldxa	[%r8, %r9] 0x80, %r7
	.word 0xc5220009  ! 2121: STF_R	st	%f2, [%r9, %r8]
	.word 0xc4020009  ! 2121: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0x8143e032  ! 2121: MEMBAR	membar	#StoreLoad | #Lookaside | #MemIssue 
	.word 0xc8220009  ! 2124: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc2520009  ! 2124: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xf3e22009  ! 2124: CASA_R	casa	[%r8] %asi, %r9, %r25
	.word 0xc53a0009  ! 2127: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc8120009  ! 2127: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xf6b22db8  ! 2127: STHA_I	stha	%r27, [%r8 + 0x0db8] %asi
	.word 0xc73a0009  ! 2130: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc84a0009  ! 2130: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xc8ba24b8  ! 2130: STDA_I	stda	%r4, [%r8 + 0x04b8] %asi
	.word 0xc3220009  ! 2133: STF_R	st	%f1, [%r9, %r8]
	.word 0xde420009  ! 2133: LDSW_R	ldsw	[%r8 + %r9], %r15
	.word 0x83a209a9  ! 2133: FDIVs	fdivs	%f8, %f9, %f1
	.word 0xe8320009  ! 2136: STH_R	sth	%r20, [%r8 + %r9]
	.word 0xc85a0009  ! 2136: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0x8ba209a9  ! 2136: FDIVs	fdivs	%f8, %f9, %f5
	.word 0xc8720009  ! 2139: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xcd020009  ! 2139: LDF_R	ld	[%r8, %r9], %f6
	.word 0xa472233c  ! 2139: UDIV_I	udiv 	%r8, 0x033c, %r18
	.word 0xce720009  ! 2142: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc2420009  ! 2142: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xc8a21009  ! 2142: STWA_R	stwa	%r4, [%r8 + %r9] 0x80
	.word 0xc53a0009  ! 2145: STDF_R	std	%f2, [%r9, %r8]
	.word 0xda120009  ! 2145: LDUH_R	lduh	[%r8 + %r9], %r13
	.word 0x8ba20829  ! 2145: FADDs	fadds	%f8, %f9, %f5
	.word 0xfe2a0009  ! 2148: STB_R	stb	%r31, [%r8 + %r9]
	.word 0xdb1a0009  ! 2148: LDDF_R	ldd	[%r8, %r9], %f13
	.word 0xf522269c  ! 2148: STF_I	st	%f26, [0x069c, %r8]
	.word 0xfa220009  ! 2151: STW_R	stw	%r29, [%r8 + %r9]
	.word 0xca120009  ! 2151: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0x85222444  ! 2151: MULScc_I	mulscc 	%r8, 0x0444, %r2
	.word 0xc8720009  ! 2154: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xcb1a0009  ! 2154: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0x0cca0001  ! 2154: BRGZ	brgz  ,pt	%8,<label_0xa0001>
	.word 0xee320009  ! 2157: STH_R	sth	%r23, [%r8 + %r9]
	.word 0xca5a0009  ! 2157: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0x88d22934  ! 2157: UMULcc_I	umulcc 	%r8, 0x0934, %r4
	.word 0xc6320009  ! 2160: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xdf1a0009  ! 2160: LDDF_R	ldd	[%r8, %r9], %f15
	.word 0xc49a2310  ! 2160: LDDA_I	ldda	[%r8, + 0x0310] %asi, %r2
	.word 0xe02a0009  ! 2163: STB_R	stb	%r16, [%r8 + %r9]
	.word 0xe45a0009  ! 2163: LDX_R	ldx	[%r8 + %r9], %r18
	.word 0xc36a0009  ! 2163: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xe33a0009  ! 2166: STDF_R	std	%f17, [%r9, %r8]
	.word 0xc4520009  ! 2166: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xc3ea1009  ! 2166: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc42a0009  ! 2169: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xce0a0009  ! 2169: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xc3ea1009  ! 2169: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xf4220009  ! 2172: STW_R	stw	%r26, [%r8 + %r9]
	.word 0xcc4a0009  ! 2172: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xeb222b80  ! 2172: STF_I	st	%f21, [0x0b80, %r8]
	.word 0xcf220009  ! 2175: STF_R	st	%f7, [%r9, %r8]
	.word 0xc2520009  ! 2175: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0x8fa209a9  ! 2175: FDIVs	fdivs	%f8, %f9, %f7
	.word 0xc5220009  ! 2178: STF_R	st	%f2, [%r9, %r8]
	.word 0xc65a0009  ! 2178: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xc51a23c0  ! 2178: LDDF_I	ldd	[%r8, 0x03c0], %f2
	.word 0xcb3a0009  ! 2181: STDF_R	std	%f5, [%r9, %r8]
	.word 0xcc420009  ! 2181: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xc3ea1009  ! 2181: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc6720009  ! 2184: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc40a0009  ! 2184: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0x9a5a0009  ! 2184: SMUL_R	smul 	%r8, %r9, %r13
	.word 0xce220009  ! 2187: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xcc5a0009  ! 2187: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xc25a0009  ! 2187: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xcb220009  ! 2190: STF_R	st	%f5, [%r9, %r8]
	.word 0xcd020009  ! 2190: LDF_R	ld	[%r8, %r9], %f6
	.word 0x8fa209a9  ! 2190: FDIVs	fdivs	%f8, %f9, %f7
	.word 0xdf3a0009  ! 2193: STDF_R	std	%f15, [%r9, %r8]
	.word 0xca420009  ! 2193: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xbb6a0009  ! 2193: SDIVX_R	sdivx	%r8, %r9, %r29
	.word 0xca2a0009  ! 2196: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xd85a0009  ! 2196: LDX_R	ldx	[%r8 + %r9], %r12
	.word 0xc4ba1009  ! 2196: STDA_R	stda	%r2, [%r8 + %r9] 0x80
	.word 0xf82a0009  ! 2199: STB_R	stb	%r28, [%r8 + %r9]
	.word 0xce020009  ! 2199: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0x1a800001  ! 2199: BCC	bcc  	<label_0x1>
	.word 0xc33a0009  ! 2202: STDF_R	std	%f1, [%r9, %r8]
	.word 0xe5020009  ! 2202: LDF_R	ld	[%r8, %r9], %f18
	.word 0x8143c000  ! 2202: STBAR	stbar
	.word 0xe2720009  ! 2205: STX_R	stx	%r17, [%r8 + %r9]
	.word 0xcb1a0009  ! 2205: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0x1c800001  ! 2205: BPOS	bpos  	<label_0x1>
	.word 0xe73a0009  ! 2208: STDF_R	std	%f19, [%r9, %r8]
	.word 0xc2120009  ! 2208: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0x826a0009  ! 2208: UDIVX_R	udivx 	%r8, %r9, %r1
	.word 0xef3a0009  ! 2211: STDF_R	std	%f23, [%r9, %r8]
	.word 0xca020009  ! 2211: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xca6a0009  ! 2211: LDSTUB_R	ldstub	%r5, [%r8 + %r9]
	.word 0xc33a0009  ! 2214: STDF_R	std	%f1, [%r9, %r8]
	.word 0xce4a0009  ! 2214: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0x865a2c8c  ! 2214: SMUL_I	smul 	%r8, 0x0c8c, %r3
	.word 0xcd3a0009  ! 2217: STDF_R	std	%f6, [%r9, %r8]
	.word 0xca0a0009  ! 2217: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xc36a27c0  ! 2217: PREFETCH_I	prefetch	[%r8 + 0x07c0], #one_read
	.word 0xc53a0009  ! 2220: STDF_R	std	%f2, [%r9, %r8]
	.word 0xcc120009  ! 2220: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0x0c800001  ! 2220: BNEG	bneg  	<label_0x1>
	.word 0xdc2a0009  ! 2223: STB_R	stb	%r14, [%r8 + %r9]
	.word 0xde5a0009  ! 2223: LDX_R	ldx	[%r8 + %r9], %r15
	.word 0xc3ea2bc8  ! 2223: PREFETCHA_I	prefetcha	[%r8, + 0x0bc8] %asi, #one_read
	.word 0xc2720009  ! 2226: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc3020009  ! 2226: LDF_R	ld	[%r8, %r9], %f1
	.word 0xc3ea2248  ! 2226: PREFETCHA_I	prefetcha	[%r8, + 0x0248] %asi, #one_read
	.word 0xc53a0009  ! 2229: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc31a0009  ! 2229: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xc41a2218  ! 2229: LDD_I	ldd	[%r8 + 0x0218], %r2
	.word 0xeb3a0009  ! 2232: STDF_R	std	%f21, [%r9, %r8]
	.word 0xca5a0009  ! 2232: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0x8e720009  ! 2232: UDIV_R	udiv 	%r8, %r9, %r7
	.word 0xc8220009  ! 2235: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc24a0009  ! 2235: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xc2c21009  ! 2235: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r1
	.word 0xcc2a0009  ! 2238: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xd65a0009  ! 2238: LDX_R	ldx	[%r8 + %r9], %r11
	.word 0xc2020009  ! 2238: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xc8320009  ! 2241: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc4120009  ! 2241: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xccba1009  ! 2241: STDA_R	stda	%r6, [%r8 + %r9] 0x80
	.word 0xce2a0009  ! 2244: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xe0120009  ! 2244: LDUH_R	lduh	[%r8 + %r9], %r16
	.word 0xea520009  ! 2244: LDSH_R	ldsh	[%r8 + %r9], %r21
	.word 0xe6320009  ! 2247: STH_R	sth	%r19, [%r8 + %r9]
	.word 0xc64a0009  ! 2247: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xc8aa1009  ! 2247: STBA_R	stba	%r4, [%r8 + %r9] 0x80
	.word 0xce220009  ! 2250: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xce120009  ! 2250: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xc36a2f38  ! 2250: PREFETCH_I	prefetch	[%r8 + 0x0f38], #one_read
	.word 0xfe320009  ! 2253: STH_R	sth	%r31, [%r8 + %r9]
	.word 0xcd020009  ! 2253: LDF_R	ld	[%r8, %r9], %f6
	.word 0x82da2ad4  ! 2253: SMULcc_I	smulcc 	%r8, 0x0ad4, %r1
	.word 0xc93a0009  ! 2256: STDF_R	std	%f4, [%r9, %r8]
	.word 0xc8520009  ! 2256: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xc4921009  ! 2256: LDUHA_R	lduha	[%r8, %r9] 0x80, %r2
	.word 0xc93a0009  ! 2259: STDF_R	std	%f4, [%r9, %r8]
	.word 0xc9020009  ! 2259: LDF_R	ld	[%r8, %r9], %f4
	.word 0xf6f21009  ! 2259: STXA_R	stxa	%r27, [%r8 + %r9] 0x80
	.word 0xec720009  ! 2262: STX_R	stx	%r22, [%r8 + %r9]
	.word 0xec020009  ! 2262: LDUW_R	lduw	[%r8 + %r9], %r22
	.word 0x88520009  ! 2262: UMUL_R	umul 	%r8, %r9, %r4
	.word 0xcc720009  ! 2265: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc2120009  ! 2265: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0x22800001  ! 2265: BE	be,a	<label_0x1>
	.word 0xc2220009  ! 2268: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xdd1a0009  ! 2268: LDDF_R	ldd	[%r8, %r9], %f14
	.word 0xf0f21009  ! 2268: STXA_R	stxa	%r24, [%r8 + %r9] 0x80
	.word 0xc33a0009  ! 2271: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc9020009  ! 2271: LDF_R	ld	[%r8, %r9], %f4
	.word 0xc6fa25ac  ! 2271: SWAPA_I	swapa	%r3, [%r8 + 0x05ac] %asi
	.word 0xef3a0009  ! 2274: STDF_R	std	%f23, [%r9, %r8]
	.word 0xea120009  ! 2274: LDUH_R	lduh	[%r8 + %r9], %r21
	.word 0xc36a0009  ! 2274: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xce2a0009  ! 2277: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xfa5a0009  ! 2277: LDX_R	ldx	[%r8 + %r9], %r29
	.word 0xbe522a58  ! 2277: UMUL_I	umul 	%r8, 0x0a58, %r31
	.word 0xc7220009  ! 2280: STF_R	st	%f3, [%r9, %r8]
	.word 0xc85a0009  ! 2280: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0x9a522b50  ! 2280: UMUL_I	umul 	%r8, 0x0b50, %r13
	.word 0xc2720009  ! 2283: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc8120009  ! 2283: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xcc9a2c28  ! 2283: LDDA_I	ldda	[%r8, + 0x0c28] %asi, %r6
	.word 0xca220009  ! 2286: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc24a0009  ! 2286: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0x8143c000  ! 2286: STBAR	stbar
	.word 0xcd3a0009  ! 2289: STDF_R	std	%f6, [%r9, %r8]
	.word 0xf85a0009  ! 2289: LDX_R	ldx	[%r8 + %r9], %r28
	.word 0xc3ea2f1c  ! 2289: PREFETCHA_I	prefetcha	[%r8, + 0x0f1c] %asi, #one_read
	.word 0xfc320009  ! 2292: STH_R	sth	%r30, [%r8 + %r9]
	.word 0xc40a0009  ! 2292: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xc92225b0  ! 2292: STF_I	st	%f4, [0x05b0, %r8]
	.word 0xcc220009  ! 2295: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xfe420009  ! 2295: LDSW_R	ldsw	[%r8 + %r9], %r31
	.word 0x8ba208a9  ! 2295: FSUBs	fsubs	%f8, %f9, %f5
	.word 0xf4720009  ! 2298: STX_R	stx	%r26, [%r8 + %r9]
	.word 0xce420009  ! 2298: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0x83220009  ! 2298: MULScc_R	mulscc 	%r8, %r9, %r1
	.word 0xc8220009  ! 2301: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc44a0009  ! 2301: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xde6a21b4  ! 2301: LDSTUB_I	ldstub	%r15, [%r8 + 0x01b4]
	.word 0xc73a0009  ! 2304: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc8420009  ! 2304: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xc3ea1009  ! 2304: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xcc220009  ! 2307: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc4520009  ! 2307: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xd7220009  ! 2307: STF_R	st	%f11, [%r9, %r8]
	.word 0xcb220009  ! 2310: STF_R	st	%f5, [%r9, %r8]
	.word 0xe2020009  ! 2310: LDUW_R	lduw	[%r8 + %r9], %r17
	.word 0x28800002  ! 2310: BLEU	bleu,a	<label_0x2>
	.word 0xce2a0009  ! 2313: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xe80a0009  ! 2313: LDUB_R	ldub	[%r8 + %r9], %r20
	.word 0xccb21009  ! 2313: STHA_R	stha	%r6, [%r8 + %r9] 0x80
	.word 0xc42a0009  ! 2316: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc45a0009  ! 2316: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0x2a800001  ! 2316: BCS	bcs,a	<label_0x1>
	.word 0xc53a0009  ! 2319: STDF_R	std	%f2, [%r9, %r8]
	.word 0xca0a0009  ! 2319: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0x20800001  ! 2319: BN	bn,a	<label_0x1>
	.word 0xc9220009  ! 2322: STF_R	st	%f4, [%r9, %r8]
	.word 0xee4a0009  ! 2322: LDSB_R	ldsb	[%r8 + %r9], %r23
	.word 0xa1a209a9  ! 2322: FDIVs	fdivs	%f8, %f9, %f16
	.word 0xca220009  ! 2325: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xf6020009  ! 2325: LDUW_R	lduw	[%r8 + %r9], %r27
	.word 0x8143e00c  ! 2325: MEMBAR	membar	#LoadStore | #StoreStore 
	.word 0xc42a0009  ! 2328: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xfe020009  ! 2328: LDUW_R	lduw	[%r8 + %r9], %r31
	.word 0xc7e22009  ! 2328: CASA_R	casa	[%r8] %asi, %r9, %r3
	.word 0xc42a0009  ! 2331: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xca520009  ! 2331: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xc36a0009  ! 2331: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc2320009  ! 2334: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xe0520009  ! 2334: LDSH_R	ldsh	[%r8 + %r9], %r16
	.word 0xbba20829  ! 2334: FADDs	fadds	%f8, %f9, %f29
	.word 0xe93a0009  ! 2337: STDF_R	std	%f20, [%r9, %r8]
	.word 0xca520009  ! 2337: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0x892222a0  ! 2337: MULScc_I	mulscc 	%r8, 0x02a0, %r4
	.word 0xee220009  ! 2340: STW_R	stw	%r23, [%r8 + %r9]
	.word 0xc2120009  ! 2340: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xc36a2aa0  ! 2340: PREFETCH_I	prefetch	[%r8 + 0x0aa0], #one_read
	.word 0xf7220009  ! 2343: STF_R	st	%f27, [%r9, %r8]
	.word 0xc91a0009  ! 2343: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0x40000001  ! 2343: CALL	call	disp30_1
	.word 0xe6320009  ! 2346: STH_R	sth	%r19, [%r8 + %r9]
	.word 0xc6420009  ! 2346: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xca8223d0  ! 2346: LDUWA_I	lduwa	[%r8, + 0x03d0] %asi, %r5
	.word 0xf0720009  ! 2349: STX_R	stx	%r24, [%r8 + %r9]
	.word 0xc85a0009  ! 2349: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0x8143e057  ! 2349: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside | #Sync 
	.word 0xcc320009  ! 2352: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xcc520009  ! 2352: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xcfe22009  ! 2352: CASA_R	casa	[%r8] %asi, %r9, %r7
	.word 0xc62a0009  ! 2355: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc8520009  ! 2355: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xac7a0009  ! 2355: SDIV_R	sdiv 	%r8, %r9, %r22
	.word 0xcf3a0009  ! 2358: STDF_R	std	%f7, [%r9, %r8]
	.word 0xf2020009  ! 2358: LDUW_R	lduw	[%r8 + %r9], %r25
	.word 0xe93a0009  ! 2358: STDF_R	std	%f20, [%r9, %r8]
	.word 0xc9220009  ! 2361: STF_R	st	%f4, [%r9, %r8]
	.word 0xc51a0009  ! 2361: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xcc0222c0  ! 2361: LDUW_I	lduw	[%r8 + 0x02c0], %r6
	.word 0xda320009  ! 2364: STH_R	sth	%r13, [%r8 + %r9]
	.word 0xe25a0009  ! 2364: LDX_R	ldx	[%r8 + %r9], %r17
	.word 0xc3f21009  ! 2364: CASXA_I	casxa	[%r8] 0x80, %r9, %r1
	.word 0xd62a0009  ! 2367: STB_R	stb	%r11, [%r8 + %r9]
	.word 0xfa0a0009  ! 2367: LDUB_R	ldub	[%r8 + %r9], %r29
	.word 0x84d20009  ! 2367: UMULcc_R	umulcc 	%r8, %r9, %r2
	.word 0xf4220009  ! 2370: STW_R	stw	%r26, [%r8 + %r9]
	.word 0xf80a0009  ! 2370: LDUB_R	ldub	[%r8 + %r9], %r28
	.word 0x8a7a2054  ! 2370: SDIV_I	sdiv 	%r8, 0x0054, %r5
	.word 0xef220009  ! 2373: STF_R	st	%f23, [%r9, %r8]
	.word 0xda420009  ! 2373: LDSW_R	ldsw	[%r8 + %r9], %r13
	.word 0x8eda0009  ! 2373: SMULcc_R	smulcc 	%r8, %r9, %r7
	.word 0xc8720009  ! 2376: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xea5a0009  ! 2376: LDX_R	ldx	[%r8 + %r9], %r21
	.word 0x8143e075  ! 2376: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside | #MemIssue | #Sync 
	.word 0xca220009  ! 2379: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xcf020009  ! 2379: LDF_R	ld	[%r8, %r9], %f7
	.word 0x1e800001  ! 2379: BVC	bvc  	<label_0x1>
	.word 0xce720009  ! 2382: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xe60a0009  ! 2382: LDUB_R	ldub	[%r8 + %r9], %r19
	.word 0xc8821009  ! 2382: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r4
	.word 0xd82a0009  ! 2385: STB_R	stb	%r12, [%r8 + %r9]
	.word 0xcf020009  ! 2385: LDF_R	ld	[%r8, %r9], %f7
	.word 0xcc7a0009  ! 2385: SWAP_R	swap	%r6, [%r8 + %r9]
	.word 0xca720009  ! 2388: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xd64a0009  ! 2388: LDSB_R	ldsb	[%r8 + %r9], %r11
	.word 0x8143e05d  ! 2388: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0xc2720009  ! 2391: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xcd1a0009  ! 2391: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xc3ea1009  ! 2391: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc8220009  ! 2394: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xe0420009  ! 2394: LDSW_R	ldsw	[%r8 + %r9], %r16
	.word 0x18800002  ! 2394: BGU	bgu  	<label_0x2>
	.word 0xfa220009  ! 2397: STW_R	stw	%r29, [%r8 + %r9]
	.word 0xdb1a0009  ! 2397: LDDF_R	ldd	[%r8, %r9], %f13
	.word 0xc36a2154  ! 2397: PREFETCH_I	prefetch	[%r8 + 0x0154], #one_read
	.word 0xf0320009  ! 2400: STH_R	sth	%r24, [%r8 + %r9]
	.word 0xf0520009  ! 2400: LDSH_R	ldsh	[%r8 + %r9], %r24
	.word 0xc3ea24b0  ! 2400: PREFETCHA_I	prefetcha	[%r8, + 0x04b0] %asi, #one_read
	.word 0xf62a0009  ! 2403: STB_R	stb	%r27, [%r8 + %r9]
	.word 0xf44a0009  ! 2403: LDSB_R	ldsb	[%r8 + %r9], %r26
	.word 0xc3ea24bc  ! 2403: PREFETCHA_I	prefetcha	[%r8, + 0x04bc] %asi, #one_read
	.word 0xce720009  ! 2406: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xe2120009  ! 2406: LDUH_R	lduh	[%r8 + %r9], %r17
	.word 0xcf3a2750  ! 2406: STDF_I	std	%f7, [0x0750, %r8]
	.word 0xcc220009  ! 2409: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xca420009  ! 2409: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xc36a0009  ! 2409: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xf6720009  ! 2412: STX_R	stx	%r27, [%r8 + %r9]
	.word 0xf04a0009  ! 2412: LDSB_R	ldsb	[%r8 + %r9], %r24
	.word 0xdeda24f8  ! 2412: LDXA_I	ldxa	[%r8, + 0x04f8] %asi, %r15
	.word 0xe3220009  ! 2415: STF_R	st	%f17, [%r9, %r8]
	.word 0xc2420009  ! 2415: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xc6fa262c  ! 2415: SWAPA_I	swapa	%r3, [%r8 + 0x062c] %asi
	.word 0xc2320009  ! 2418: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xcd020009  ! 2418: LDF_R	ld	[%r8, %r9], %f6
	.word 0xc09a2168  ! 2418: LDDA_I	ldda	[%r8, + 0x0168] %asi, %r0
	.word 0xce2a0009  ! 2421: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xca120009  ! 2421: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0x1e800002  ! 2421: BVC	bvc  	<label_0x2>
	.word 0xda220009  ! 2424: STW_R	stw	%r13, [%r8 + %r9]
	.word 0xc6520009  ! 2424: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xc88a1009  ! 2424: LDUBA_R	lduba	[%r8, %r9] 0x80, %r4
	.word 0xca2a0009  ! 2427: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xea520009  ! 2427: LDSH_R	ldsh	[%r8 + %r9], %r21
	.word 0x2a800001  ! 2427: BCS	bcs,a	<label_0x1>
	.word 0xce720009  ! 2430: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc80a0009  ! 2430: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xc3ea1009  ! 2430: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc2320009  ! 2433: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc84a0009  ! 2433: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0x8143e01d  ! 2433: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside 
	.word 0xc5220009  ! 2436: STF_R	st	%f2, [%r9, %r8]
	.word 0xf0520009  ! 2436: LDSH_R	ldsh	[%r8 + %r9], %r24
	.word 0xc2aa21d4  ! 2436: STBA_I	stba	%r1, [%r8 + 0x01d4] %asi
	.word 0xc6720009  ! 2439: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xdf1a0009  ! 2439: LDDF_R	ldd	[%r8, %r9], %f15
	.word 0xc3ea2a84  ! 2439: PREFETCHA_I	prefetcha	[%r8, + 0x0a84] %asi, #one_read
	.word 0xce320009  ! 2442: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc71a0009  ! 2442: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0x06ca0001  ! 2442: BRLZ	brlz  ,pt	%8,<label_0xa0001>
	.word 0xce320009  ! 2445: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xf40a0009  ! 2445: LDUB_R	ldub	[%r8 + %r9], %r26
	.word 0xc51a0009  ! 2445: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xc8320009  ! 2448: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc60a0009  ! 2448: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xc4a22318  ! 2448: STWA_I	stwa	%r2, [%r8 + 0x0318] %asi
	.word 0xda220009  ! 2451: STW_R	stw	%r13, [%r8 + %r9]
	.word 0xce020009  ! 2451: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0x82520009  ! 2451: UMUL_R	umul 	%r8, %r9, %r1
	.word 0xea2a0009  ! 2454: STB_R	stb	%r21, [%r8 + %r9]
	.word 0xfe120009  ! 2454: LDUH_R	lduh	[%r8 + %r9], %r31
	.word 0xfb3a0009  ! 2454: STDF_R	std	%f29, [%r9, %r8]
	.word 0xcc720009  ! 2457: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xf40a0009  ! 2457: LDUB_R	ldub	[%r8 + %r9], %r26
	.word 0xe89a22e0  ! 2457: LDDA_I	ldda	[%r8, + 0x02e0] %asi, %r20
	.word 0xf2320009  ! 2460: STH_R	sth	%r25, [%r8 + %r9]
	.word 0xc84a0009  ! 2460: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xb0da2630  ! 2460: SMULcc_I	smulcc 	%r8, 0x0630, %r24
	.word 0xce2a0009  ! 2463: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xce0a0009  ! 2463: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xed220009  ! 2463: STF_R	st	%f22, [%r9, %r8]
	.word 0xc6320009  ! 2466: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc25a0009  ! 2466: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xc5220009  ! 2466: STF_R	st	%f2, [%r9, %r8]
	.word 0xc8720009  ! 2469: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xcc120009  ! 2469: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xce122244  ! 2469: LDUH_I	lduh	[%r8 + 0x0244], %r7
	.word 0xc8220009  ! 2472: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xcb020009  ! 2472: LDF_R	ld	[%r8, %r9], %f5
	.word 0xc48a2a2c  ! 2472: LDUBA_I	lduba	[%r8, + 0x0a2c] %asi, %r2
	.word 0xea720009  ! 2475: STX_R	stx	%r21, [%r8 + %r9]
	.word 0xcc0a0009  ! 2475: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0x36800001  ! 2475: BGE	bge,a	<label_0x1>
	.word 0xce720009  ! 2478: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xca420009  ! 2478: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xc3ea1009  ! 2478: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc3220009  ! 2481: STF_R	st	%f1, [%r9, %r8]
	.word 0xe2520009  ! 2481: LDSH_R	ldsh	[%r8 + %r9], %r17
	.word 0xc4b21009  ! 2481: STHA_R	stha	%r2, [%r8 + %r9] 0x80
	.word 0xce220009  ! 2484: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc4520009  ! 2484: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0x88520009  ! 2484: UMUL_R	umul 	%r8, %r9, %r4
	.word 0xfe320009  ! 2487: STH_R	sth	%r31, [%r8 + %r9]
	.word 0xea120009  ! 2487: LDUH_R	lduh	[%r8 + %r9], %r21
	.word 0x02c20001  ! 2487: BRZ	brz  ,nt	%8,<label_0x20001>
	.word 0xf0720009  ! 2490: STX_R	stx	%r24, [%r8 + %r9]
	.word 0xce020009  ! 2490: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0x04ca0001  ! 2490: BRLEZ	brlez  ,pt	%8,<label_0xa0001>
	.word 0xd8720009  ! 2493: STX_R	stx	%r12, [%r8 + %r9]
	.word 0xcc0a0009  ! 2493: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xc36a0009  ! 2493: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc2220009  ! 2496: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc85a0009  ! 2496: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xcb022970  ! 2496: LDF_I	ld	[%r8, 0x0970], %f5
	.word 0xc2720009  ! 2499: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc6020009  ! 2499: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xc36a2d7c  ! 2499: PREFETCH_I	prefetch	[%r8 + 0x0d7c], #one_read
	.word 0xcc2a0009  ! 2502: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xec4a0009  ! 2502: LDSB_R	ldsb	[%r8 + %r9], %r22
	.word 0x0a800002  ! 2502: BCS	bcs  	<label_0x2>
	.word 0xfa220009  ! 2505: STW_R	stw	%r29, [%r8 + %r9]
	.word 0xc20a0009  ! 2505: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0x8143e059  ! 2505: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside | #Sync 
	.word 0xfe220009  ! 2508: STW_R	stw	%r31, [%r8 + %r9]
	.word 0xe40a0009  ! 2508: LDUB_R	ldub	[%r8 + %r9], %r18
	.word 0x8143c000  ! 2508: STBAR	stbar
	.word 0xca320009  ! 2511: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xce020009  ! 2511: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xc9e22009  ! 2511: CASA_R	casa	[%r8] %asi, %r9, %r4
	.word 0xc4320009  ! 2514: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xf0420009  ! 2514: LDSW_R	ldsw	[%r8 + %r9], %r24
	.word 0xcc821009  ! 2514: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r6
	.word 0xc4320009  ! 2517: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc7020009  ! 2517: LDF_R	ld	[%r8, %r9], %f3
	.word 0x86da2540  ! 2517: SMULcc_I	smulcc 	%r8, 0x0540, %r3
	.word 0xca320009  ! 2520: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc24a0009  ! 2520: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xc36a0009  ! 2520: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xcc2a0009  ! 2523: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc4520009  ! 2523: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0x2a800002  ! 2523: BCS	bcs,a	<label_0x2>
	.word 0xc4220009  ! 2526: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc2120009  ! 2526: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xe8aa1009  ! 2526: STBA_R	stba	%r20, [%r8 + %r9] 0x80
	.word 0xc93a0009  ! 2529: STDF_R	std	%f4, [%r9, %r8]
	.word 0xec0a0009  ! 2529: LDUB_R	ldub	[%r8 + %r9], %r22
	.word 0xc71a0009  ! 2529: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xcd220009  ! 2532: STF_R	st	%f6, [%r9, %r8]
	.word 0xca420009  ! 2532: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xc2b22ba4  ! 2532: STHA_I	stha	%r1, [%r8 + 0x0ba4] %asi
	.word 0xf8720009  ! 2535: STX_R	stx	%r28, [%r8 + %r9]
	.word 0xc6020009  ! 2535: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xc33a0009  ! 2535: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc4320009  ! 2538: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc20a0009  ! 2538: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xb85a2ad8  ! 2538: SMUL_I	smul 	%r8, 0x0ad8, %r28
	.word 0xc73a0009  ! 2541: STDF_R	std	%f3, [%r9, %r8]
	.word 0xfe420009  ! 2541: LDSW_R	ldsw	[%r8 + %r9], %r31
	.word 0xc64a0009  ! 2541: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xc4320009  ! 2544: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xf24a0009  ! 2544: LDSB_R	ldsb	[%r8 + %r9], %r25
	.word 0x38800002  ! 2544: BGU	bgu,a	<label_0x2>
	.word 0xc9220009  ! 2547: STF_R	st	%f4, [%r9, %r8]
	.word 0xce520009  ! 2547: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0x8143c000  ! 2547: STBAR	stbar
	.word 0xfa2a0009  ! 2550: STB_R	stb	%r29, [%r8 + %r9]
	.word 0xe40a0009  ! 2550: LDUB_R	ldub	[%r8 + %r9], %r18
	.word 0xee6a0009  ! 2550: LDSTUB_R	ldstub	%r23, [%r8 + %r9]
	.word 0xc2320009  ! 2553: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc85a0009  ! 2553: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xac520009  ! 2553: UMUL_R	umul 	%r8, %r9, %r22
	.word 0xca2a0009  ! 2556: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xf71a0009  ! 2556: LDDF_R	ldd	[%r8, %r9], %f27
	.word 0xcc6a0009  ! 2556: LDSTUB_R	ldstub	%r6, [%r8 + %r9]
	.word 0xe02a0009  ! 2559: STB_R	stb	%r16, [%r8 + %r9]
	.word 0xff1a0009  ! 2559: LDDF_R	ldd	[%r8, %r9], %f31
	.word 0xcc6a0009  ! 2559: LDSTUB_R	ldstub	%r6, [%r8 + %r9]
	.word 0xf0320009  ! 2562: STH_R	sth	%r24, [%r8 + %r9]
	.word 0xc2120009  ! 2562: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xf53a2f10  ! 2562: STDF_I	std	%f26, [0x0f10, %r8]
	.word 0xcf220009  ! 2565: STF_R	st	%f7, [%r9, %r8]
	.word 0xcc0a0009  ! 2565: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xc3ea2e9c  ! 2565: PREFETCHA_I	prefetcha	[%r8, + 0x0e9c] %asi, #one_read
	.word 0xc6320009  ! 2568: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xe65a0009  ! 2568: LDX_R	ldx	[%r8 + %r9], %r19
	.word 0x8e720009  ! 2568: UDIV_R	udiv 	%r8, %r9, %r7
	.word 0xc4220009  ! 2571: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xff020009  ! 2571: LDF_R	ld	[%r8, %r9], %f31
	.word 0xfe6a2768  ! 2571: LDSTUB_I	ldstub	%r31, [%r8 + 0x0768]
	.word 0xc22a0009  ! 2574: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc45a0009  ! 2574: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xc6a22558  ! 2574: STWA_I	stwa	%r3, [%r8 + 0x0558] %asi
	.word 0xc2320009  ! 2577: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xcd1a0009  ! 2577: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xc6ea1009  ! 2577: LDSTUBA_R	ldstuba	%r3, [%r8 + %r9] 0x80
	.word 0xc53a0009  ! 2580: STDF_R	std	%f2, [%r9, %r8]
	.word 0xda120009  ! 2580: LDUH_R	lduh	[%r8 + %r9], %r13
	.word 0xc3ea1009  ! 2580: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xcc720009  ! 2583: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xd8520009  ! 2583: LDSH_R	ldsh	[%r8 + %r9], %r12
	.word 0x887a0009  ! 2583: SDIV_R	sdiv 	%r8, %r9, %r4
	.word 0xda220009  ! 2586: STW_R	stw	%r13, [%r8 + %r9]
	.word 0xc4120009  ! 2586: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xc3ea1009  ! 2586: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc4720009  ! 2589: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc7020009  ! 2589: LDF_R	ld	[%r8, %r9], %f3
	.word 0x88fa0009  ! 2589: SDIVcc_R	sdivcc 	%r8, %r9, %r4
	.word 0xc62a0009  ! 2592: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc2420009  ! 2592: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0x886a2540  ! 2592: UDIVX_I	udivx 	%r8, 0x0540, %r4
	.word 0xcf220009  ! 2595: STF_R	st	%f7, [%r9, %r8]
	.word 0xc8120009  ! 2595: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xbe7a2090  ! 2595: SDIV_I	sdiv 	%r8, 0x0090, %r31
	.word 0xc93a0009  ! 2598: STDF_R	std	%f4, [%r9, %r8]
	.word 0xc25a0009  ! 2598: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xfe7a22e4  ! 2598: SWAP_I	swap	%r31, [%r8 + 0x02e4]
	.word 0xc4720009  ! 2601: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xce020009  ! 2601: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xb45a2414  ! 2601: SMUL_I	smul 	%r8, 0x0414, %r26
	.word 0xda320009  ! 2604: STH_R	sth	%r13, [%r8 + %r9]
	.word 0xc84a0009  ! 2604: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xc36a0009  ! 2604: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc9220009  ! 2607: STF_R	st	%f4, [%r9, %r8]
	.word 0xf9020009  ! 2607: LDF_R	ld	[%r8, %r9], %f28
	.word 0xc86a0009  ! 2607: LDSTUB_R	ldstub	%r4, [%r8 + %r9]
	.word 0xeb220009  ! 2610: STF_R	st	%f21, [%r9, %r8]
	.word 0xcc5a0009  ! 2610: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0x8143e002  ! 2610: MEMBAR	membar	#StoreLoad 
	.word 0xd8220009  ! 2613: STW_R	stw	%r12, [%r8 + %r9]
	.word 0xf0020009  ! 2613: LDUW_R	lduw	[%r8 + %r9], %r24
	.word 0xf13a2dd0  ! 2613: STDF_I	std	%f24, [0x0dd0, %r8]
	.word 0xce220009  ! 2616: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xca520009  ! 2616: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0x8c522e4c  ! 2616: UMUL_I	umul 	%r8, 0x0e4c, %r6
	.word 0xcc2a0009  ! 2619: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xff1a0009  ! 2619: LDDF_R	ldd	[%r8, %r9], %f31
	.word 0xd60a0009  ! 2619: LDUB_R	ldub	[%r8 + %r9], %r11
	.word 0xcc320009  ! 2622: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xf80a0009  ! 2622: LDUB_R	ldub	[%r8 + %r9], %r28
	.word 0x8143c000  ! 2622: STBAR	stbar
	.word 0xcf220009  ! 2625: STF_R	st	%f7, [%r9, %r8]
	.word 0xfc420009  ! 2625: LDSW_R	ldsw	[%r8 + %r9], %r30
	.word 0xc53a2cc8  ! 2625: STDF_I	std	%f2, [0x0cc8, %r8]
	.word 0xd62a0009  ! 2628: STB_R	stb	%r11, [%r8 + %r9]
	.word 0xc4520009  ! 2628: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xc3ea1009  ! 2628: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xca720009  ! 2631: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc4120009  ! 2631: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xe9220009  ! 2631: STF_R	st	%f20, [%r9, %r8]
	.word 0xc4320009  ! 2634: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xca420009  ! 2634: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xc4921009  ! 2634: LDUHA_R	lduha	[%r8, %r9] 0x80, %r2
	.word 0xc7220009  ! 2637: STF_R	st	%f3, [%r9, %r8]
	.word 0xfe0a0009  ! 2637: LDUB_R	ldub	[%r8 + %r9], %r31
	.word 0xc27a2fac  ! 2637: SWAP_I	swap	%r1, [%r8 + 0x0fac]
	.word 0xfa2a0009  ! 2640: STB_R	stb	%r29, [%r8 + %r9]
	.word 0xce5a0009  ! 2640: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0x8143c000  ! 2640: STBAR	stbar
	.word 0xc22a0009  ! 2643: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xca120009  ! 2643: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0x84720009  ! 2643: UDIV_R	udiv 	%r8, %r9, %r2
	.word 0xce720009  ! 2646: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xca520009  ! 2646: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0x8b222990  ! 2646: MULScc_I	mulscc 	%r8, 0x0990, %r5
	.word 0xc6720009  ! 2649: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xf20a0009  ! 2649: LDUB_R	ldub	[%r8 + %r9], %r25
	.word 0x8af228d4  ! 2649: UDIVcc_I	udivcc 	%r8, 0x08d4, %r5
	.word 0xf13a0009  ! 2652: STDF_R	std	%f24, [%r9, %r8]
	.word 0xfc020009  ! 2652: LDUW_R	lduw	[%r8 + %r9], %r30
	.word 0xaefa2bc8  ! 2652: SDIVcc_I	sdivcc 	%r8, 0x0bc8, %r23
	.word 0xcb3a0009  ! 2655: STDF_R	std	%f5, [%r9, %r8]
	.word 0xce5a0009  ! 2655: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0x2c800002  ! 2655: BNEG	bneg,a	<label_0x2>
	.word 0xc7220009  ! 2658: STF_R	st	%f3, [%r9, %r8]
	.word 0xd85a0009  ! 2658: LDX_R	ldx	[%r8 + %r9], %r12
	.word 0xf4a223e0  ! 2658: STWA_I	stwa	%r26, [%r8 + 0x03e0] %asi
	.word 0xe1220009  ! 2661: STF_R	st	%f16, [%r9, %r8]
	.word 0xf25a0009  ! 2661: LDX_R	ldx	[%r8 + %r9], %r25
	.word 0xc4821009  ! 2661: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r2
	.word 0xcf220009  ! 2664: STF_R	st	%f7, [%r9, %r8]
	.word 0xc84a0009  ! 2664: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xdff21009  ! 2664: CASXA_I	casxa	[%r8] 0x80, %r9, %r15
	.word 0xca2a0009  ! 2667: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc6120009  ! 2667: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xc2ea25ec  ! 2667: LDSTUBA_I	ldstuba	%r1, [%r8 + 0x05ec] %asi
	.word 0xc93a0009  ! 2670: STDF_R	std	%f4, [%r9, %r8]
	.word 0xcc5a0009  ! 2670: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0x8c7a0009  ! 2670: SDIV_R	sdiv 	%r8, %r9, %r6
	.word 0xca720009  ! 2673: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xe6120009  ! 2673: LDUH_R	lduh	[%r8 + %r9], %r19
	.word 0xc26a0009  ! 2673: LDSTUB_R	ldstub	%r1, [%r8 + %r9]
	.word 0xf3220009  ! 2676: STF_R	st	%f25, [%r9, %r8]
	.word 0xca420009  ! 2676: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xc36a0009  ! 2676: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xda320009  ! 2679: STH_R	sth	%r13, [%r8 + %r9]
	.word 0xce120009  ! 2679: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0x1e800001  ! 2679: BVC	bvc  	<label_0x1>
	.word 0xce220009  ! 2682: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc25a0009  ! 2682: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xa46a2f44  ! 2682: UDIVX_I	udivx 	%r8, 0x0f44, %r18
	.word 0xef220009  ! 2685: STF_R	st	%f23, [%r9, %r8]
	.word 0xcd020009  ! 2685: LDF_R	ld	[%r8, %r9], %f6
	.word 0xfc6a0009  ! 2685: LDSTUB_R	ldstub	%r30, [%r8 + %r9]
	.word 0xce220009  ! 2688: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc4020009  ! 2688: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0x8fa209a9  ! 2688: FDIVs	fdivs	%f8, %f9, %f7
	.word 0xce220009  ! 2691: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xf2520009  ! 2691: LDSH_R	ldsh	[%r8 + %r9], %r25
	.word 0x86fa0009  ! 2691: SDIVcc_R	sdivcc 	%r8, %r9, %r3
	.word 0xc6720009  ! 2694: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xfa120009  ! 2694: LDUH_R	lduh	[%r8 + %r9], %r29
	.word 0x22800001  ! 2694: BE	be,a	<label_0x1>
	.word 0xca720009  ! 2697: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc4120009  ! 2697: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0x99222a5c  ! 2697: MULScc_I	mulscc 	%r8, 0x0a5c, %r12
	.word 0xca2a0009  ! 2700: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc3020009  ! 2700: LDF_R	ld	[%r8, %r9], %f1
	.word 0xe3e22009  ! 2700: CASA_R	casa	[%r8] %asi, %r9, %r17
	.word 0xc4220009  ! 2703: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc2120009  ! 2703: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xca6a0009  ! 2703: LDSTUB_R	ldstub	%r5, [%r8 + %r9]
	.word 0xcb220009  ! 2706: STF_R	st	%f5, [%r9, %r8]
	.word 0xe00a0009  ! 2706: LDUB_R	ldub	[%r8 + %r9], %r16
	.word 0xc4b22ff8  ! 2706: STHA_I	stha	%r2, [%r8 + 0x0ff8] %asi
	.word 0xc33a0009  ! 2709: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc4420009  ! 2709: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xc36a2780  ! 2709: PREFETCH_I	prefetch	[%r8 + 0x0780], #one_read
	.word 0xc4720009  ! 2712: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xf7020009  ! 2712: LDF_R	ld	[%r8, %r9], %f27
	.word 0xc3ea1009  ! 2712: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc6220009  ! 2715: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xcf020009  ! 2715: LDF_R	ld	[%r8, %r9], %f7
	.word 0xc36a2850  ! 2715: PREFETCH_I	prefetch	[%r8 + 0x0850], #one_read
	.word 0xc62a0009  ! 2718: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xe5020009  ! 2718: LDF_R	ld	[%r8, %r9], %f18
	.word 0xc36a2cb4  ! 2718: PREFETCH_I	prefetch	[%r8 + 0x0cb4], #one_read
	.word 0xe2220009  ! 2721: STW_R	stw	%r17, [%r8 + %r9]
	.word 0xc80a0009  ! 2721: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0x8a4a2768  ! 2721: MULX_I	mulx 	%r8, 0x0768, %r5
	.word 0xce2a0009  ! 2724: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xd8020009  ! 2724: LDUW_R	lduw	[%r8 + %r9], %r12
	.word 0xd8422534  ! 2724: LDSW_I	ldsw	[%r8 + 0x0534], %r12
	.word 0xc7220009  ! 2727: STF_R	st	%f3, [%r9, %r8]
	.word 0xe6520009  ! 2727: LDSH_R	ldsh	[%r8 + %r9], %r19
	.word 0xc5f22009  ! 2727: CASXA_R	casxa	[%r8]%asi, %r9, %r2
	.word 0xce720009  ! 2730: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc65a0009  ! 2730: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xc3ea1009  ! 2730: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xcc320009  ! 2733: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc6020009  ! 2733: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xb0da276c  ! 2733: SMULcc_I	smulcc 	%r8, 0x076c, %r24
	.word 0xc2720009  ! 2736: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xce120009  ! 2736: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0x824a0009  ! 2736: MULX_R	mulx 	%r8, %r9, %r1
	.word 0xcd220009  ! 2739: STF_R	st	%f6, [%r9, %r8]
	.word 0xe8020009  ! 2739: LDUW_R	lduw	[%r8 + %r9], %r20
	.word 0x8143e006  ! 2739: MEMBAR	membar	#StoreLoad | #LoadStore 
	.word 0xd93a0009  ! 2742: STDF_R	std	%f12, [%r9, %r8]
	.word 0xc6020009  ! 2742: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xc4a21009  ! 2742: STWA_R	stwa	%r2, [%r8 + %r9] 0x80
	.word 0xcc2a0009  ! 2745: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xfb1a0009  ! 2745: LDDF_R	ldd	[%r8, %r9], %f29
	.word 0xb3a20929  ! 2745: FMULs	fmuls	%f8, %f9, %f25
	.word 0xd62a0009  ! 2748: STB_R	stb	%r11, [%r8 + %r9]
	.word 0xc8020009  ! 2748: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xc3ea2e94  ! 2748: PREFETCHA_I	prefetcha	[%r8, + 0x0e94] %asi, #one_read
	.word 0xc5220009  ! 2751: STF_R	st	%f2, [%r9, %r8]
	.word 0xc45a0009  ! 2751: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0x06c20001  ! 2751: BRLZ	brlz  ,nt	%8,<label_0x20001>
	.word 0xc5220009  ! 2754: STF_R	st	%f2, [%r9, %r8]
	.word 0xf51a0009  ! 2754: LDDF_R	ldd	[%r8, %r9], %f26
	.word 0xcca22ecc  ! 2754: STWA_I	stwa	%r6, [%r8 + 0x0ecc] %asi
	.word 0xcb3a0009  ! 2757: STDF_R	std	%f5, [%r9, %r8]
	.word 0xc85a0009  ! 2757: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xc48a1009  ! 2757: LDUBA_R	lduba	[%r8, %r9] 0x80, %r2
	.word 0xcb3a0009  ! 2760: STDF_R	std	%f5, [%r9, %r8]
	.word 0xc91a0009  ! 2760: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xcab225d0  ! 2760: STHA_I	stha	%r5, [%r8 + 0x05d0] %asi
	.word 0xda2a0009  ! 2763: STB_R	stb	%r13, [%r8 + %r9]
	.word 0xc31a0009  ! 2763: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0x89222d68  ! 2763: MULScc_I	mulscc 	%r8, 0x0d68, %r4
	.word 0xce220009  ! 2766: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xde120009  ! 2766: LDUH_R	lduh	[%r8 + %r9], %r15
	.word 0xceaa1009  ! 2766: STBA_R	stba	%r7, [%r8 + %r9] 0x80
	.word 0xc9220009  ! 2769: STF_R	st	%f4, [%r9, %r8]
	.word 0xc24a0009  ! 2769: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xcada1009  ! 2769: LDXA_R	ldxa	[%r8, %r9] 0x80, %r5
	.word 0xcd3a0009  ! 2772: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc4020009  ! 2772: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xc3ea1009  ! 2772: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xce720009  ! 2775: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xe84a0009  ! 2775: LDSB_R	ldsb	[%r8 + %r9], %r20
	.word 0xc88a1009  ! 2775: LDUBA_R	lduba	[%r8, %r9] 0x80, %r4
	.word 0xc62a0009  ! 2778: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xf6520009  ! 2778: LDSH_R	ldsh	[%r8 + %r9], %r27
	.word 0x867a0009  ! 2778: SDIV_R	sdiv 	%r8, %r9, %r3
	.word 0xca220009  ! 2781: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xec420009  ! 2781: LDSW_R	ldsw	[%r8 + %r9], %r22
	.word 0xbafa2ce4  ! 2781: SDIVcc_I	sdivcc 	%r8, 0x0ce4, %r29
	.word 0xc4320009  ! 2784: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xd65a0009  ! 2784: LDX_R	ldx	[%r8 + %r9], %r11
	.word 0xaa7a0009  ! 2784: SDIV_R	sdiv 	%r8, %r9, %r21
	.word 0xc7220009  ! 2787: STF_R	st	%f3, [%r9, %r8]
	.word 0xf0520009  ! 2787: LDSH_R	ldsh	[%r8 + %r9], %r24
	.word 0xc6d21009  ! 2787: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r3
	.word 0xe0220009  ! 2790: STW_R	stw	%r16, [%r8 + %r9]
	.word 0xf7020009  ! 2790: LDF_R	ld	[%r8, %r9], %f27
	.word 0x40000001  ! 2790: CALL	call	disp30_1
	.word 0xca2a0009  ! 2793: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xfe5a0009  ! 2793: LDX_R	ldx	[%r8 + %r9], %r31
	.word 0x8e4a0009  ! 2793: MULX_R	mulx 	%r8, %r9, %r7
	.word 0xe6720009  ! 2796: STX_R	stx	%r19, [%r8 + %r9]
	.word 0xc4120009  ! 2796: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0x8143e075  ! 2796: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside | #MemIssue | #Sync 
	.word 0xc4320009  ! 2799: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xe6420009  ! 2799: LDSW_R	ldsw	[%r8 + %r9], %r19
	.word 0xcc922e90  ! 2799: LDUHA_I	lduha	[%r8, + 0x0e90] %asi, %r6
	.word 0xc6320009  ! 2802: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xce0a0009  ! 2802: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xc8ea1009  ! 2802: LDSTUBA_R	ldstuba	%r4, [%r8 + %r9] 0x80
	.word 0xc4220009  ! 2805: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc20a0009  ! 2805: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xfaaa28fc  ! 2805: STBA_I	stba	%r29, [%r8 + 0x08fc] %asi
	.word 0xe4220009  ! 2808: STW_R	stw	%r18, [%r8 + %r9]
	.word 0xce120009  ! 2808: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0x8143c000  ! 2808: STBAR	stbar
	.word 0xc4320009  ! 2811: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc24a0009  ! 2811: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0x8143e026  ! 2811: MEMBAR	membar	#StoreLoad | #LoadStore | #MemIssue 
	.word 0xdb3a0009  ! 2814: STDF_R	std	%f13, [%r9, %r8]
	.word 0xce4a0009  ! 2814: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xd6821009  ! 2814: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r11
	.word 0xc5220009  ! 2817: STF_R	st	%f2, [%r9, %r8]
	.word 0xc71a0009  ! 2817: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xc2c22e30  ! 2817: LDSWA_I	ldswa	[%r8, + 0x0e30] %asi, %r1
	.word 0xee2a0009  ! 2820: STB_R	stb	%r23, [%r8 + %r9]
	.word 0xfe0a0009  ! 2820: LDUB_R	ldub	[%r8 + %r9], %r31
	.word 0xc4420009  ! 2820: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xee2a0009  ! 2823: STB_R	stb	%r23, [%r8 + %r9]
	.word 0xf60a0009  ! 2823: LDUB_R	ldub	[%r8 + %r9], %r27
	.word 0x8ada0009  ! 2823: SMULcc_R	smulcc 	%r8, %r9, %r5
	.word 0xf6320009  ! 2826: STH_R	sth	%r27, [%r8 + %r9]
	.word 0xce020009  ! 2826: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xc27a2328  ! 2826: SWAP_I	swap	%r1, [%r8 + 0x0328]
	.word 0xcb3a0009  ! 2829: STDF_R	std	%f5, [%r9, %r8]
	.word 0xce420009  ! 2829: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xc46a0009  ! 2829: LDSTUB_R	ldstub	%r2, [%r8 + %r9]
	.word 0xc4320009  ! 2832: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc6020009  ! 2832: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0x0aca0001  ! 2832: BRNZ	brnz  ,pt	%8,<label_0xa0001>
	.word 0xc33a0009  ! 2835: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc8520009  ! 2835: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0x3c800001  ! 2835: BPOS	bpos,a	<label_0x1>
	.word 0xe22a0009  ! 2838: STB_R	stb	%r17, [%r8 + %r9]
	.word 0xc4020009  ! 2838: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xe13a2ae0  ! 2838: STDF_I	std	%f16, [0x0ae0, %r8]
	.word 0xc2720009  ! 2841: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xcb1a0009  ! 2841: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xecba1009  ! 2841: STDA_R	stda	%r22, [%r8 + %r9] 0x80
	.word 0xc6220009  ! 2844: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc71a0009  ! 2844: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0x844a24b4  ! 2844: MULX_I	mulx 	%r8, 0x04b4, %r2
	.word 0xcc320009  ! 2847: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xcc120009  ! 2847: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0x8a5a2c30  ! 2847: SMUL_I	smul 	%r8, 0x0c30, %r5
	.word 0xc3220009  ! 2850: STF_R	st	%f1, [%r9, %r8]
	.word 0xc5020009  ! 2850: LDF_R	ld	[%r8, %r9], %f2
	.word 0xc8ba27b0  ! 2850: STDA_I	stda	%r4, [%r8 + 0x07b0] %asi
	.word 0xcd220009  ! 2853: STF_R	st	%f6, [%r9, %r8]
	.word 0xe71a0009  ! 2853: LDDF_R	ldd	[%r8, %r9], %f19
	.word 0x8143c000  ! 2853: STBAR	stbar
	.word 0xe62a0009  ! 2856: STB_R	stb	%r19, [%r8 + %r9]
	.word 0xce4a0009  ! 2856: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xc36a2308  ! 2856: PREFETCH_I	prefetch	[%r8 + 0x0308], #one_read
	.word 0xfe220009  ! 2859: STW_R	stw	%r31, [%r8 + %r9]
	.word 0xc45a0009  ! 2859: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0x8e4a0009  ! 2859: MULX_R	mulx 	%r8, %r9, %r7
	.word 0xc2720009  ! 2862: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xce0a0009  ! 2862: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xc3ea26b0  ! 2862: PREFETCHA_I	prefetcha	[%r8, + 0x06b0] %asi, #one_read
	.word 0xde720009  ! 2865: STX_R	stx	%r15, [%r8 + %r9]
	.word 0xde0a0009  ! 2865: LDUB_R	ldub	[%r8 + %r9], %r15
	.word 0xec4a0009  ! 2865: LDSB_R	ldsb	[%r8 + %r9], %r22
	.word 0xc4220009  ! 2868: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xf0520009  ! 2868: LDSH_R	ldsh	[%r8 + %r9], %r24
	.word 0xc3ea1009  ! 2868: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc7220009  ! 2871: STF_R	st	%f3, [%r9, %r8]
	.word 0xc71a0009  ! 2871: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0x8143e043  ! 2871: MEMBAR	membar	#LoadLoad | #StoreLoad | #Sync 
	.word 0xc8320009  ! 2874: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xcf1a0009  ! 2874: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0x0a800002  ! 2874: BCS	bcs  	<label_0x2>
	.word 0xc8320009  ! 2877: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc8020009  ! 2877: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xc3ea2e48  ! 2877: PREFETCHA_I	prefetcha	[%r8, + 0x0e48] %asi, #one_read
	.word 0xfe320009  ! 2880: STH_R	sth	%r31, [%r8 + %r9]
	.word 0xfe4a0009  ! 2880: LDSB_R	ldsb	[%r8 + %r9], %r31
	.word 0x12800002  ! 2880: BNE	bne  	<label_0x2>
	.word 0xeb220009  ! 2883: STF_R	st	%f21, [%r9, %r8]
	.word 0xca120009  ! 2883: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xe4d21009  ! 2883: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r18
	.word 0xcb3a0009  ! 2886: STDF_R	std	%f5, [%r9, %r8]
	.word 0xcf1a0009  ! 2886: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0x9cd20009  ! 2886: UMULcc_R	umulcc 	%r8, %r9, %r14
	.word 0xc53a0009  ! 2889: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc8520009  ! 2889: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xc36a2fc0  ! 2889: PREFETCH_I	prefetch	[%r8 + 0x0fc0], #one_read
	.word 0xc9220009  ! 2892: STF_R	st	%f4, [%r9, %r8]
	.word 0xc4020009  ! 2892: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0x89a20829  ! 2892: FADDs	fadds	%f8, %f9, %f4
	.word 0xf13a0009  ! 2895: STDF_R	std	%f24, [%r9, %r8]
	.word 0xc31a0009  ! 2895: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xc3ea1009  ! 2895: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc9220009  ! 2898: STF_R	st	%f4, [%r9, %r8]
	.word 0xe4020009  ! 2898: LDUW_R	lduw	[%r8 + %r9], %r18
	.word 0x8143c000  ! 2898: STBAR	stbar
	.word 0xc82a0009  ! 2901: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xe6120009  ! 2901: LDUH_R	lduh	[%r8 + %r9], %r19
	.word 0x856a2c74  ! 2901: SDIVX_I	sdivx	%r8, 0x0c74, %r2
	.word 0xf9220009  ! 2904: STF_R	st	%f28, [%r9, %r8]
	.word 0xcc120009  ! 2904: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0x86fa0009  ! 2904: SDIVcc_R	sdivcc 	%r8, %r9, %r3
	.word 0xdc720009  ! 2907: STX_R	stx	%r14, [%r8 + %r9]
	.word 0xf20a0009  ! 2907: LDUB_R	ldub	[%r8 + %r9], %r25
	.word 0xf13a2a20  ! 2907: STDF_I	std	%f24, [0x0a20, %r8]
	.word 0xc9220009  ! 2910: STF_R	st	%f4, [%r9, %r8]
	.word 0xe6020009  ! 2910: LDUW_R	lduw	[%r8 + %r9], %r19
	.word 0xc5222f00  ! 2910: STF_I	st	%f2, [0x0f00, %r8]
	.word 0xfa720009  ! 2913: STX_R	stx	%r29, [%r8 + %r9]
	.word 0xc2020009  ! 2913: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0x864a0009  ! 2913: MULX_R	mulx 	%r8, %r9, %r3
	.word 0xd6220009  ! 2916: STW_R	stw	%r11, [%r8 + %r9]
	.word 0xdd1a0009  ! 2916: LDDF_R	ldd	[%r8, %r9], %f14
	.word 0xcca22f84  ! 2916: STWA_I	stwa	%r6, [%r8 + 0x0f84] %asi
	.word 0xca320009  ! 2919: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xed020009  ! 2919: LDF_R	ld	[%r8, %r9], %f22
	.word 0x34800001  ! 2919: BG	bg,a	<label_0x1>
	.word 0xca320009  ! 2922: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xd8120009  ! 2922: LDUH_R	lduh	[%r8 + %r9], %r12
	.word 0xc53a0009  ! 2922: STDF_R	std	%f2, [%r9, %r8]
	.word 0xcd3a0009  ! 2925: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc8120009  ! 2925: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xceaa2fdc  ! 2925: STBA_I	stba	%r7, [%r8 + 0x0fdc] %asi
	.word 0xc53a0009  ! 2928: STDF_R	std	%f2, [%r9, %r8]
	.word 0xe5020009  ! 2928: LDF_R	ld	[%r8, %r9], %f18
	.word 0xc8aa1009  ! 2928: STBA_R	stba	%r4, [%r8 + %r9] 0x80
	.word 0xde720009  ! 2931: STX_R	stx	%r15, [%r8 + %r9]
	.word 0xc8520009  ! 2931: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0x8cda0009  ! 2931: SMULcc_R	smulcc 	%r8, %r9, %r6
	.word 0xc9220009  ! 2934: STF_R	st	%f4, [%r9, %r8]
	.word 0xca0a0009  ! 2934: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xc4fa1009  ! 2934: SWAPA_R	swapa	%r2, [%r8 + %r9] 0x80
	.word 0xea320009  ! 2937: STH_R	sth	%r21, [%r8 + %r9]
	.word 0xc9020009  ! 2937: LDF_R	ld	[%r8, %r9], %f4
	.word 0x8c7a0009  ! 2937: SDIV_R	sdiv 	%r8, %r9, %r6
	.word 0xce320009  ! 2940: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc71a0009  ! 2940: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0x8e520009  ! 2940: UMUL_R	umul 	%r8, %r9, %r7
	.word 0xcc220009  ! 2943: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc8520009  ! 2943: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0x18800001  ! 2943: BGU	bgu  	<label_0x1>
	.word 0xeb220009  ! 2946: STF_R	st	%f21, [%r9, %r8]
	.word 0xc24a0009  ! 2946: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0x8143e01a  ! 2946: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside 
	.word 0xc4720009  ! 2949: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xf84a0009  ! 2949: LDSB_R	ldsb	[%r8 + %r9], %r28
	.word 0x8143c000  ! 2949: STBAR	stbar
	.word 0xc2320009  ! 2952: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xef1a0009  ! 2952: LDDF_R	ldd	[%r8, %r9], %f23
	.word 0xcada2320  ! 2952: LDXA_I	ldxa	[%r8, + 0x0320] %asi, %r5
	.word 0xc8220009  ! 2955: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc2420009  ! 2955: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xc36a2878  ! 2955: PREFETCH_I	prefetch	[%r8 + 0x0878], #one_read
	.word 0xf0220009  ! 2958: STW_R	stw	%r24, [%r8 + %r9]
	.word 0xce5a0009  ! 2958: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xb5a209a9  ! 2958: FDIVs	fdivs	%f8, %f9, %f26
	.word 0xc53a0009  ! 2961: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc80a0009  ! 2961: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0x985223b0  ! 2961: UMUL_I	umul 	%r8, 0x03b0, %r12
	.word 0xfa2a0009  ! 2964: STB_R	stb	%r29, [%r8 + %r9]
	.word 0xee5a0009  ! 2964: LDX_R	ldx	[%r8 + %r9], %r23
	.word 0xe08a2cd8  ! 2964: LDUBA_I	lduba	[%r8, + 0x0cd8] %asi, %r16
	.word 0xcc720009  ! 2967: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc25a0009  ! 2967: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xc84a2ce8  ! 2967: LDSB_I	ldsb	[%r8 + 0x0ce8], %r4
	.word 0xc33a0009  ! 2970: STDF_R	std	%f1, [%r9, %r8]
	.word 0xcc5a0009  ! 2970: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xeaa22260  ! 2970: STWA_I	stwa	%r21, [%r8 + 0x0260] %asi
	.word 0xcb3a0009  ! 2973: STDF_R	std	%f5, [%r9, %r8]
	.word 0xe8520009  ! 2973: LDSH_R	ldsh	[%r8 + %r9], %r20
	.word 0xeeaa24e0  ! 2973: STBA_I	stba	%r23, [%r8 + 0x04e0] %asi
	.word 0xf2720009  ! 2976: STX_R	stx	%r25, [%r8 + %r9]
	.word 0xc2420009  ! 2976: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xc36a0009  ! 2976: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xea320009  ! 2979: STH_R	sth	%r21, [%r8 + %r9]
	.word 0xc2520009  ! 2979: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0x82f20009  ! 2979: UDIVcc_R	udivcc 	%r8, %r9, %r1
	.word 0xce220009  ! 2982: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc45a0009  ! 2982: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0x99a20929  ! 2982: FMULs	fmuls	%f8, %f9, %f12
	.word 0xcd3a0009  ! 2985: STDF_R	std	%f6, [%r9, %r8]
	.word 0xe0520009  ! 2985: LDSH_R	ldsh	[%r8 + %r9], %r16
	.word 0x8143c000  ! 2985: STBAR	stbar
	.word 0xc93a0009  ! 2988: STDF_R	std	%f4, [%r9, %r8]
	.word 0xcb020009  ! 2988: LDF_R	ld	[%r8, %r9], %f5
	.word 0xdaca2b90  ! 2988: LDSBA_I	ldsba	[%r8, + 0x0b90] %asi, %r13
	.word 0xca220009  ! 2991: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xd60a0009  ! 2991: LDUB_R	ldub	[%r8 + %r9], %r11
	.word 0xc6821009  ! 2991: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r3
	.word 0xc3220009  ! 2994: STF_R	st	%f1, [%r9, %r8]
	.word 0xc8520009  ! 2994: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0x86da2178  ! 2994: SMULcc_I	smulcc 	%r8, 0x0178, %r3
	.word 0xe5220009  ! 2997: STF_R	st	%f18, [%r9, %r8]
	.word 0xd7020009  ! 2997: LDF_R	ld	[%r8, %r9], %f11
	.word 0x88d20009  ! 2997: UMULcc_R	umulcc 	%r8, %r9, %r4
	.word 0xcf220009  ! 3000: STF_R	st	%f7, [%r9, %r8]
	.word 0xec4a0009  ! 3000: LDSB_R	ldsb	[%r8 + %r9], %r22
	.word 0x8afa0009  ! 3000: SDIVcc_R	sdivcc 	%r8, %r9, %r5
	.word 0xfb220009  ! 3003: STF_R	st	%f29, [%r9, %r8]
	.word 0xc84a0009  ! 3003: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xbc722378  ! 3003: UDIV_I	udiv 	%r8, 0x0378, %r30
	.word 0xdc320009  ! 3006: STH_R	sth	%r14, [%r8 + %r9]
	.word 0xc8120009  ! 3006: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0x8143c000  ! 3006: STBAR	stbar
	.word 0xc82a0009  ! 3009: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xe64a0009  ! 3009: LDSB_R	ldsb	[%r8 + %r9], %r19
	.word 0x8143e012  ! 3009: MEMBAR	membar	#StoreLoad | #Lookaside 
	.word 0xca2a0009  ! 3012: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xe6420009  ! 3012: LDSW_R	ldsw	[%r8 + %r9], %r19
	.word 0xc36a2a90  ! 3012: PREFETCH_I	prefetch	[%r8 + 0x0a90], #one_read
	.word 0xcc220009  ! 3015: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc5020009  ! 3015: LDF_R	ld	[%r8, %r9], %f2
	.word 0x0e800002  ! 3015: BVS	bvs  	<label_0x2>
	.word 0xe2320009  ! 3018: STH_R	sth	%r17, [%r8 + %r9]
	.word 0xe8520009  ! 3018: LDSH_R	ldsh	[%r8 + %r9], %r20
	.word 0xc3ea1009  ! 3018: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xf2220009  ! 3021: STW_R	stw	%r25, [%r8 + %r9]
	.word 0xca420009  ! 3021: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xc9220009  ! 3021: STF_R	st	%f4, [%r9, %r8]
	.word 0xc8320009  ! 3024: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc25a0009  ! 3024: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xd60a0009  ! 3024: LDUB_R	ldub	[%r8 + %r9], %r11
	.word 0xfe220009  ! 3027: STW_R	stw	%r31, [%r8 + %r9]
	.word 0xc44a0009  ! 3027: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xee0a2b18  ! 3027: LDUB_I	ldub	[%r8 + 0x0b18], %r23
	.word 0xc4720009  ! 3030: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xf51a0009  ! 3030: LDDF_R	ldd	[%r8, %r9], %f26
	.word 0x8143c000  ! 3030: STBAR	stbar
	.word 0xf8220009  ! 3033: STW_R	stw	%r28, [%r8 + %r9]
	.word 0xc4520009  ! 3033: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0x8e5a25c4  ! 3033: SMUL_I	smul 	%r8, 0x05c4, %r7
	.word 0xd62a0009  ! 3036: STB_R	stb	%r11, [%r8 + %r9]
	.word 0xcf1a0009  ! 3036: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xd8ba2718  ! 3036: STDA_I	stda	%r12, [%r8 + 0x0718] %asi
	.word 0xc5220009  ! 3039: STF_R	st	%f2, [%r9, %r8]
	.word 0xcb020009  ! 3039: LDF_R	ld	[%r8, %r9], %f5
	.word 0xcff22009  ! 3039: CASXA_R	casxa	[%r8]%asi, %r9, %r7
	.word 0xce220009  ! 3042: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xe0520009  ! 3042: LDSH_R	ldsh	[%r8 + %r9], %r16
	.word 0xc8b22280  ! 3042: STHA_I	stha	%r4, [%r8 + 0x0280] %asi
	.word 0xc6220009  ! 3045: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xe5020009  ! 3045: LDF_R	ld	[%r8, %r9], %f18
	.word 0xcd1a28e0  ! 3045: LDDF_I	ldd	[%r8, 0x08e0], %f6
	.word 0xc4320009  ! 3048: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc2520009  ! 3048: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xc4da1009  ! 3048: LDXA_R	ldxa	[%r8, %r9] 0x80, %r2
	.word 0xc2320009  ! 3051: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xdc120009  ! 3051: LDUH_R	lduh	[%r8 + %r9], %r14
	.word 0xb0d20009  ! 3051: UMULcc_R	umulcc 	%r8, %r9, %r24
	.word 0xc42a0009  ! 3054: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xf91a0009  ! 3054: LDDF_R	ldd	[%r8, %r9], %f28
	.word 0xe93a2f88  ! 3054: STDF_I	std	%f20, [0x0f88, %r8]
	.word 0xcc720009  ! 3057: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xce020009  ! 3057: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0x16800001  ! 3057: BGE	bge  	<label_0x1>
	.word 0xce720009  ! 3060: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc8420009  ! 3060: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xa07a0009  ! 3060: SDIV_R	sdiv 	%r8, %r9, %r16
	.word 0xc33a0009  ! 3063: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc6520009  ! 3063: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xcb3a0009  ! 3063: STDF_R	std	%f5, [%r9, %r8]
	.word 0xe22a0009  ! 3066: STB_R	stb	%r17, [%r8 + %r9]
	.word 0xc80a0009  ! 3066: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xcff22009  ! 3066: CASXA_R	casxa	[%r8]%asi, %r9, %r7
	.word 0xca220009  ! 3069: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xfa4a0009  ! 3069: LDSB_R	ldsb	[%r8 + %r9], %r29
	.word 0x87a208a9  ! 3069: FSUBs	fsubs	%f8, %f9, %f3
	.word 0xce320009  ! 3072: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc4120009  ! 3072: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0x8cfa20ac  ! 3072: SDIVcc_I	sdivcc 	%r8, 0x00ac, %r6
	.word 0xde220009  ! 3075: STW_R	stw	%r15, [%r8 + %r9]
	.word 0xc9020009  ! 3075: LDF_R	ld	[%r8, %r9], %f4
	.word 0xc0ba2988  ! 3075: STDA_I	stda	%r0, [%r8 + 0x0988] %asi
	.word 0xc6220009  ! 3078: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc2520009  ! 3078: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xc8120009  ! 3078: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xca320009  ! 3081: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc8020009  ! 3081: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0x8143e02b  ! 3081: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #MemIssue 
	.word 0xe33a0009  ! 3084: STDF_R	std	%f17, [%r9, %r8]
	.word 0xda0a0009  ! 3084: LDUB_R	ldub	[%r8 + %r9], %r13
	.word 0xccaa23fc  ! 3084: STBA_I	stba	%r6, [%r8 + 0x03fc] %asi
	.word 0xc8220009  ! 3087: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xfa420009  ! 3087: LDSW_R	ldsw	[%r8 + %r9], %r29
	.word 0x8143e04e  ! 3087: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Sync 
	.word 0xf62a0009  ! 3090: STB_R	stb	%r27, [%r8 + %r9]
	.word 0xce5a0009  ! 3090: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0x24800002  ! 3090: BLE	ble,a	<label_0x2>
	.word 0xc2320009  ! 3093: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xe4120009  ! 3093: LDUH_R	lduh	[%r8 + %r9], %r18
	.word 0xa84a2188  ! 3093: MULX_I	mulx 	%r8, 0x0188, %r20
	.word 0xc62a0009  ! 3096: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc85a0009  ! 3096: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xc3ea2318  ! 3096: PREFETCHA_I	prefetcha	[%r8, + 0x0318] %asi, #one_read
	.word 0xc4720009  ! 3099: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xde4a0009  ! 3099: LDSB_R	ldsb	[%r8 + %r9], %r15
	.word 0xc36a0009  ! 3099: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xcd3a0009  ! 3102: STDF_R	std	%f6, [%r9, %r8]
	.word 0xcb1a0009  ! 3102: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xcb3a2060  ! 3102: STDF_I	std	%f5, [0x0060, %r8]
	.word 0xe1220009  ! 3105: STF_R	st	%f16, [%r9, %r8]
	.word 0xc25a0009  ! 3105: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xe5f22009  ! 3105: CASXA_R	casxa	[%r8]%asi, %r9, %r18
	.word 0xe9220009  ! 3108: STF_R	st	%f20, [%r9, %r8]
	.word 0xc84a0009  ! 3108: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xc36a2480  ! 3108: PREFETCH_I	prefetch	[%r8 + 0x0480], #one_read
	.word 0xcb220009  ! 3111: STF_R	st	%f5, [%r9, %r8]
	.word 0xd91a0009  ! 3111: LDDF_R	ldd	[%r8, %r9], %f12
	.word 0x8143e022  ! 3111: MEMBAR	membar	#StoreLoad | #MemIssue 
	.word 0xc93a0009  ! 3114: STDF_R	std	%f4, [%r9, %r8]
	.word 0xce120009  ! 3114: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xcb222e14  ! 3114: STF_I	st	%f5, [0x0e14, %r8]
	.word 0xdf220009  ! 3117: STF_R	st	%f15, [%r9, %r8]
	.word 0xc85a0009  ! 3117: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0x8143c000  ! 3117: STBAR	stbar
	.word 0xc5220009  ! 3120: STF_R	st	%f2, [%r9, %r8]
	.word 0xca420009  ! 3120: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xae7a250c  ! 3120: SDIV_I	sdiv 	%r8, 0x050c, %r23
	.word 0xf02a0009  ! 3123: STB_R	stb	%r24, [%r8 + %r9]
	.word 0xce5a0009  ! 3123: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xc3ea1009  ! 3123: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xfd220009  ! 3126: STF_R	st	%f30, [%r9, %r8]
	.word 0xc84a0009  ! 3126: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0x8143c000  ! 3126: STBAR	stbar
	.word 0xe22a0009  ! 3129: STB_R	stb	%r17, [%r8 + %r9]
	.word 0xfe4a0009  ! 3129: LDSB_R	ldsb	[%r8 + %r9], %r31
	.word 0xc3ea1009  ! 3129: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xea320009  ! 3132: STH_R	sth	%r21, [%r8 + %r9]
	.word 0xcc120009  ! 3132: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xc4520009  ! 3132: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xc8320009  ! 3135: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc2420009  ! 3135: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0x84da22d0  ! 3135: SMULcc_I	smulcc 	%r8, 0x02d0, %r2
	.word 0xe1220009  ! 3138: STF_R	st	%f16, [%r9, %r8]
	.word 0xc8020009  ! 3138: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xc36a0009  ! 3138: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc4220009  ! 3141: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xcc120009  ! 3141: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0x8143e065  ! 3141: MEMBAR	membar	#LoadLoad | #LoadStore | #MemIssue | #Sync 
	.word 0xf2720009  ! 3144: STX_R	stx	%r25, [%r8 + %r9]
	.word 0xce5a0009  ! 3144: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0x8143e05b  ! 3144: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Lookaside | #Sync 
	.word 0xdb3a0009  ! 3147: STDF_R	std	%f13, [%r9, %r8]
	.word 0xd85a0009  ! 3147: LDX_R	ldx	[%r8 + %r9], %r12
	.word 0x8c4a0009  ! 3147: MULX_R	mulx 	%r8, %r9, %r6
	.word 0xcc2a0009  ! 3150: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xfa0a0009  ! 3150: LDUB_R	ldub	[%r8 + %r9], %r29
	.word 0xc71a0009  ! 3150: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xca320009  ! 3153: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc2020009  ! 3153: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0x83a208a9  ! 3153: FSUBs	fsubs	%f8, %f9, %f1
	.word 0xc42a0009  ! 3156: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc4420009  ! 3156: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xb5220009  ! 3156: MULScc_R	mulscc 	%r8, %r9, %r26
	.word 0xce220009  ! 3159: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc2420009  ! 3159: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xc3ea1009  ! 3159: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xce220009  ! 3162: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xcc4a0009  ! 3162: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xe2ca1009  ! 3162: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r17
	.word 0xce320009  ! 3165: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xcc5a0009  ! 3165: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xc3ea2b6c  ! 3165: PREFETCHA_I	prefetcha	[%r8, + 0x0b6c] %asi, #one_read
	.word 0xff3a0009  ! 3168: STDF_R	std	%f31, [%r9, %r8]
	.word 0xc6120009  ! 3168: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0x8143e02e  ! 3168: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #MemIssue 
	.word 0xc22a0009  ! 3171: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc51a0009  ! 3171: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xca6a0009  ! 3171: LDSTUB_R	ldstub	%r5, [%r8 + %r9]
	.word 0xc4720009  ! 3174: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xe64a0009  ! 3174: LDSB_R	ldsb	[%r8 + %r9], %r19
	.word 0xc36a29ac  ! 3174: PREFETCH_I	prefetch	[%r8 + 0x09ac], #one_read
	.word 0xe4320009  ! 3177: STH_R	sth	%r18, [%r8 + %r9]
	.word 0xd6120009  ! 3177: LDUH_R	lduh	[%r8 + %r9], %r11
	.word 0xce8a1009  ! 3177: LDUBA_R	lduba	[%r8, %r9] 0x80, %r7
	.word 0xca720009  ! 3180: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xfe120009  ! 3180: LDUH_R	lduh	[%r8 + %r9], %r31
	.word 0x83a20929  ! 3180: FMULs	fmuls	%f8, %f9, %f1
	.word 0xed3a0009  ! 3183: STDF_R	std	%f22, [%r9, %r8]
	.word 0xcc4a0009  ! 3183: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0x8c7a236c  ! 3183: SDIV_I	sdiv 	%r8, 0x036c, %r6
	.word 0xcc320009  ! 3186: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xec420009  ! 3186: LDSW_R	ldsw	[%r8 + %r9], %r22
	.word 0x83a20829  ! 3186: FADDs	fadds	%f8, %f9, %f1
	.word 0xc82a0009  ! 3189: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xe6420009  ! 3189: LDSW_R	ldsw	[%r8 + %r9], %r19
	.word 0x87220009  ! 3189: MULScc_R	mulscc 	%r8, %r9, %r3
	.word 0xea720009  ! 3192: STX_R	stx	%r21, [%r8 + %r9]
	.word 0xc25a0009  ! 3192: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0x26800001  ! 3192: BL	bl,a	<label_0x1>
	.word 0xc4320009  ! 3195: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc2420009  ! 3195: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xc8ba1009  ! 3195: STDA_R	stda	%r4, [%r8 + %r9] 0x80
	.word 0xe93a0009  ! 3198: STDF_R	std	%f20, [%r9, %r8]
	.word 0xf71a0009  ! 3198: LDDF_R	ldd	[%r8, %r9], %f27
	.word 0xc8020009  ! 3198: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xcc720009  ! 3201: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc7020009  ! 3201: LDF_R	ld	[%r8, %r9], %f3
	.word 0xc3e22009  ! 3201: CASA_R	casa	[%r8] %asi, %r9, %r1
	.word 0xcb3a0009  ! 3204: STDF_R	std	%f5, [%r9, %r8]
	.word 0xca5a0009  ! 3204: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xccba1009  ! 3204: STDA_R	stda	%r6, [%r8 + %r9] 0x80
	.word 0xf82a0009  ! 3207: STB_R	stb	%r28, [%r8 + %r9]
	.word 0xc8520009  ! 3207: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0x8143e07c  ! 3207: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xcc2a0009  ! 3210: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xce0a0009  ! 3210: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0x896a2c80  ! 3210: SDIVX_I	sdivx	%r8, 0x0c80, %r4
	.word 0xca720009  ! 3213: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xf2120009  ! 3213: LDUH_R	lduh	[%r8 + %r9], %r25
	.word 0xc7f21009  ! 3213: CASXA_I	casxa	[%r8] 0x80, %r9, %r3
	.word 0xdb220009  ! 3216: STF_R	st	%f13, [%r9, %r8]
	.word 0xc20a0009  ! 3216: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0x87222f18  ! 3216: MULScc_I	mulscc 	%r8, 0x0f18, %r3
	.word 0xf0720009  ! 3219: STX_R	stx	%r24, [%r8 + %r9]
	.word 0xdd1a0009  ! 3219: LDDF_R	ldd	[%r8, %r9], %f14
	.word 0xc6a222dc  ! 3219: STWA_I	stwa	%r3, [%r8 + 0x02dc] %asi
	.word 0xc22a0009  ! 3222: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xde020009  ! 3222: LDUW_R	lduw	[%r8 + %r9], %r15
	.word 0xc8c21009  ! 3222: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r4
	.word 0xc33a0009  ! 3225: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc4520009  ! 3225: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0x8cfa0009  ! 3225: SDIVcc_R	sdivcc 	%r8, %r9, %r6
	.word 0xda320009  ! 3228: STH_R	sth	%r13, [%r8 + %r9]
	.word 0xe8420009  ! 3228: LDSW_R	ldsw	[%r8 + %r9], %r20
	.word 0xbc6a0009  ! 3228: UDIVX_R	udivx 	%r8, %r9, %r30
	.word 0xee320009  ! 3231: STH_R	sth	%r23, [%r8 + %r9]
	.word 0xcc420009  ! 3231: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xc36a2388  ! 3231: PREFETCH_I	prefetch	[%r8 + 0x0388], #one_read
	.word 0xe5220009  ! 3234: STF_R	st	%f18, [%r9, %r8]
	.word 0xc6520009  ! 3234: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0x84da0009  ! 3234: SMULcc_R	smulcc 	%r8, %r9, %r2
	.word 0xc4220009  ! 3237: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xe64a0009  ! 3237: LDSB_R	ldsb	[%r8 + %r9], %r19
	.word 0x8143e06d  ! 3237: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #MemIssue | #Sync 
	.word 0xe13a0009  ! 3240: STDF_R	std	%f16, [%r9, %r8]
	.word 0xc4520009  ! 3240: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0x8143e002  ! 3240: MEMBAR	membar	#StoreLoad 
	.word 0xdc320009  ! 3243: STH_R	sth	%r14, [%r8 + %r9]
	.word 0xc40a0009  ! 3243: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0x8143c000  ! 3243: STBAR	stbar
	.word 0xcf220009  ! 3246: STF_R	st	%f7, [%r9, %r8]
	.word 0xe7020009  ! 3246: LDF_R	ld	[%r8, %r9], %f19
	.word 0x40000001  ! 3246: CALL	call	disp30_1
	.word 0xc82a0009  ! 3249: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xf85a0009  ! 3249: LDX_R	ldx	[%r8 + %r9], %r28
	.word 0xc3ea228c  ! 3249: PREFETCHA_I	prefetcha	[%r8, + 0x028c] %asi, #one_read
	.word 0xd6320009  ! 3252: STH_R	sth	%r11, [%r8 + %r9]
	.word 0xde4a0009  ! 3252: LDSB_R	ldsb	[%r8 + %r9], %r15
	.word 0x8e4a2524  ! 3252: MULX_I	mulx 	%r8, 0x0524, %r7
	.word 0xee720009  ! 3255: STX_R	stx	%r23, [%r8 + %r9]
	.word 0xcb020009  ! 3255: LDF_R	ld	[%r8, %r9], %f5
	.word 0x22c20001  ! 3255: BRZ	brz,a,nt	%8,<label_0x20001>
	.word 0xcf3a0009  ! 3258: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc8420009  ! 3258: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0x0c800002  ! 3258: BNEG	bneg  	<label_0x2>
	.word 0xc62a0009  ! 3261: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xe84a0009  ! 3261: LDSB_R	ldsb	[%r8 + %r9], %r20
	.word 0xc3ea1009  ! 3261: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xd9220009  ! 3264: STF_R	st	%f12, [%r9, %r8]
	.word 0xca020009  ! 3264: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xdb222fd0  ! 3264: STF_I	st	%f13, [0x0fd0, %r8]
	.word 0xcf220009  ! 3267: STF_R	st	%f7, [%r9, %r8]
	.word 0xc4020009  ! 3267: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xc8a22924  ! 3267: STWA_I	stwa	%r4, [%r8 + 0x0924] %asi
	.word 0xe8720009  ! 3270: STX_R	stx	%r20, [%r8 + %r9]
	.word 0xcb020009  ! 3270: LDF_R	ld	[%r8, %r9], %f5
	.word 0xe4ea1009  ! 3270: LDSTUBA_R	ldstuba	%r18, [%r8 + %r9] 0x80
	.word 0xc62a0009  ! 3273: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xef020009  ! 3273: LDF_R	ld	[%r8, %r9], %f23
	.word 0x8d220009  ! 3273: MULScc_R	mulscc 	%r8, %r9, %r6
	.word 0xce720009  ! 3276: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc85a0009  ! 3276: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xc4ba2dc0  ! 3276: STDA_I	stda	%r2, [%r8 + 0x0dc0] %asi
	.word 0xe5220009  ! 3279: STF_R	st	%f18, [%r9, %r8]
	.word 0xcf1a0009  ! 3279: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xfcf21009  ! 3279: STXA_R	stxa	%r30, [%r8 + %r9] 0x80
	.word 0xce720009  ! 3282: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc71a0009  ! 3282: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xdab21009  ! 3282: STHA_R	stha	%r13, [%r8 + %r9] 0x80
	.word 0xc2720009  ! 3285: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xcc4a0009  ! 3285: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xdb020009  ! 3285: LDF_R	ld	[%r8, %r9], %f13
	.word 0xc3220009  ! 3288: STF_R	st	%f1, [%r9, %r8]
	.word 0xe4020009  ! 3288: LDUW_R	lduw	[%r8 + %r9], %r18
	.word 0xb2d20009  ! 3288: UMULcc_R	umulcc 	%r8, %r9, %r25
	.word 0xf2320009  ! 3291: STH_R	sth	%r25, [%r8 + %r9]
	.word 0xf24a0009  ! 3291: LDSB_R	ldsb	[%r8 + %r9], %r25
	.word 0xc3ea2218  ! 3291: PREFETCHA_I	prefetcha	[%r8, + 0x0218] %asi, #one_read
	.word 0xca720009  ! 3294: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xec4a0009  ! 3294: LDSB_R	ldsb	[%r8 + %r9], %r22
	.word 0xc53a2970  ! 3294: STDF_I	std	%f2, [0x0970, %r8]
	.word 0xd8320009  ! 3297: STH_R	sth	%r12, [%r8 + %r9]
	.word 0xc51a0009  ! 3297: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xc9e22009  ! 3297: CASA_R	casa	[%r8] %asi, %r9, %r4
	.word 0xf02a0009  ! 3300: STB_R	stb	%r24, [%r8 + %r9]
	.word 0xca4a0009  ! 3300: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xc3022cd8  ! 3300: LDF_I	ld	[%r8, 0x0cd8], %f1
	.word 0xfc2a0009  ! 3303: STB_R	stb	%r30, [%r8 + %r9]
	.word 0xc6520009  ! 3303: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xe45227d0  ! 3303: LDSH_I	ldsh	[%r8 + 0x07d0], %r18
	.word 0xea2a0009  ! 3306: STB_R	stb	%r21, [%r8 + %r9]
	.word 0xcc0a0009  ! 3306: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0x8143c000  ! 3306: STBAR	stbar
	.word 0xc42a0009  ! 3309: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xf2520009  ! 3309: LDSH_R	ldsh	[%r8 + %r9], %r25
	.word 0xc8022908  ! 3309: LDUW_I	lduw	[%r8 + 0x0908], %r4
	.word 0xc42a0009  ! 3312: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xcc520009  ! 3312: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xcf3a2840  ! 3312: STDF_I	std	%f7, [0x0840, %r8]
	.word 0xc33a0009  ! 3315: STDF_R	std	%f1, [%r9, %r8]
	.word 0xcc5a0009  ! 3315: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0x865a27a8  ! 3315: SMUL_I	smul 	%r8, 0x07a8, %r3
	.word 0xf53a0009  ! 3318: STDF_R	std	%f26, [%r9, %r8]
	.word 0xc65a0009  ! 3318: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xd8921009  ! 3318: LDUHA_R	lduha	[%r8, %r9] 0x80, %r12
	.word 0xe33a0009  ! 3321: STDF_R	std	%f17, [%r9, %r8]
	.word 0xf6120009  ! 3321: LDUH_R	lduh	[%r8 + %r9], %r27
	.word 0x28800001  ! 3321: BLEU	bleu,a	<label_0x1>
	.word 0xfb220009  ! 3324: STF_R	st	%f29, [%r9, %r8]
	.word 0xe8420009  ! 3324: LDSW_R	ldsw	[%r8 + %r9], %r20
	.word 0xce420009  ! 3324: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xc42a0009  ! 3327: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xce420009  ! 3327: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xb6da0009  ! 3327: SMULcc_R	smulcc 	%r8, %r9, %r27
	.word 0xc73a0009  ! 3330: STDF_R	std	%f3, [%r9, %r8]
	.word 0xe64a0009  ! 3330: LDSB_R	ldsb	[%r8 + %r9], %r19
	.word 0xc3ea1009  ! 3330: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc2720009  ! 3333: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xce5a0009  ! 3333: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0x85a20829  ! 3333: FADDs	fadds	%f8, %f9, %f2
	.word 0xf4720009  ! 3336: STX_R	stx	%r26, [%r8 + %r9]
	.word 0xc51a0009  ! 3336: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xd4ba25b8  ! 3336: STDA_I	stda	%r10, [%r8 + 0x05b8] %asi
	.word 0xc8220009  ! 3339: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xfe0a0009  ! 3339: LDUB_R	ldub	[%r8 + %r9], %r31
	.word 0xccda27f8  ! 3339: LDXA_I	ldxa	[%r8, + 0x07f8] %asi, %r6
	.word 0xf7220009  ! 3342: STF_R	st	%f27, [%r9, %r8]
	.word 0xc2120009  ! 3342: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xc6a21009  ! 3342: STWA_R	stwa	%r3, [%r8 + %r9] 0x80
	.word 0xca320009  ! 3345: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xca420009  ! 3345: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xca7a292c  ! 3345: SWAP_I	swap	%r5, [%r8 + 0x092c]
	.word 0xc73a0009  ! 3348: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc2420009  ! 3348: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0x8143e075  ! 3348: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside | #MemIssue | #Sync 
	.word 0xce220009  ! 3351: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xdb1a0009  ! 3351: LDDF_R	ldd	[%r8, %r9], %f13
	.word 0x88522460  ! 3351: UMUL_I	umul 	%r8, 0x0460, %r4
	.word 0xc4220009  ! 3354: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc2420009  ! 3354: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xc6120009  ! 3354: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xdd220009  ! 3357: STF_R	st	%f14, [%r9, %r8]
	.word 0xc4420009  ! 3357: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xce420009  ! 3357: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xfe320009  ! 3360: STH_R	sth	%r31, [%r8 + %r9]
	.word 0xc6020009  ! 3360: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xcde21009  ! 3360: CASA_I	casa	[%r8] 0x80, %r9, %r6
	.word 0xfe2a0009  ! 3363: STB_R	stb	%r31, [%r8 + %r9]
	.word 0xf0420009  ! 3363: LDSW_R	ldsw	[%r8 + %r9], %r24
	.word 0xc3ea1009  ! 3363: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xd6720009  ! 3366: STX_R	stx	%r11, [%r8 + %r9]
	.word 0xcc0a0009  ! 3366: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xac7a0009  ! 3366: SDIV_R	sdiv 	%r8, %r9, %r22
	.word 0xc4320009  ! 3369: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xda5a0009  ! 3369: LDX_R	ldx	[%r8 + %r9], %r13
	.word 0x38800001  ! 3369: BGU	bgu,a	<label_0x1>
	.word 0xde220009  ! 3372: STW_R	stw	%r15, [%r8 + %r9]
	.word 0xca020009  ! 3372: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xfe7a0009  ! 3372: SWAP_R	swap	%r31, [%r8 + %r9]
	.word 0xce2a0009  ! 3375: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xfb020009  ! 3375: LDF_R	ld	[%r8, %r9], %f29
	.word 0xc6aa252c  ! 3375: STBA_I	stba	%r3, [%r8 + 0x052c] %asi
	.word 0xf93a0009  ! 3378: STDF_R	std	%f28, [%r9, %r8]
	.word 0xec520009  ! 3378: LDSH_R	ldsh	[%r8 + %r9], %r22
	.word 0xc8ca1009  ! 3378: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r4
	.word 0xc42a0009  ! 3381: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xce4a0009  ! 3381: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xd8ba2728  ! 3381: STDA_I	stda	%r12, [%r8 + 0x0728] %asi
	.word 0xe6720009  ! 3384: STX_R	stx	%r19, [%r8 + %r9]
	.word 0xcf020009  ! 3384: LDF_R	ld	[%r8, %r9], %f7
	.word 0xc3ea1009  ! 3384: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xdc720009  ! 3387: STX_R	stx	%r14, [%r8 + %r9]
	.word 0xc51a0009  ! 3387: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xc88a28c8  ! 3387: LDUBA_I	lduba	[%r8, + 0x08c8] %asi, %r4
	.word 0xcf220009  ! 3390: STF_R	st	%f7, [%r9, %r8]
	.word 0xe60a0009  ! 3390: LDUB_R	ldub	[%r8 + %r9], %r19
	.word 0xcbe22009  ! 3390: CASA_R	casa	[%r8] %asi, %r9, %r5
	.word 0xcc220009  ! 3393: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xe64a0009  ! 3393: LDSB_R	ldsb	[%r8 + %r9], %r19
	.word 0xcfe22009  ! 3393: CASA_R	casa	[%r8] %asi, %r9, %r7
	.word 0xce2a0009  ! 3396: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xe71a0009  ! 3396: LDDF_R	ldd	[%r8, %r9], %f19
	.word 0xc8da1009  ! 3396: LDXA_R	ldxa	[%r8, %r9] 0x80, %r4
	.word 0xcb3a0009  ! 3399: STDF_R	std	%f5, [%r9, %r8]
	.word 0xe8020009  ! 3399: LDUW_R	lduw	[%r8 + %r9], %r20
	.word 0xc2aa2054  ! 3399: STBA_I	stba	%r1, [%r8 + 0x0054] %asi
	.word 0xc82a0009  ! 3402: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xce520009  ! 3402: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0x22ca0001  ! 3402: BRZ	brz,a,pt	%8,<label_0xa0001>
	.word 0xc6220009  ! 3405: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xce120009  ! 3405: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xe4020009  ! 3405: LDUW_R	lduw	[%r8 + %r9], %r18
	.word 0xc9220009  ! 3408: STF_R	st	%f4, [%r9, %r8]
	.word 0xfe5a0009  ! 3408: LDX_R	ldx	[%r8 + %r9], %r31
	.word 0x04ca0001  ! 3408: BRLEZ	brlez  ,pt	%8,<label_0xa0001>
	.word 0xd62a0009  ! 3411: STB_R	stb	%r11, [%r8 + %r9]
	.word 0xee4a0009  ! 3411: LDSB_R	ldsb	[%r8 + %r9], %r23
	.word 0xc8ea1009  ! 3411: LDSTUBA_R	ldstuba	%r4, [%r8 + %r9] 0x80
	.word 0xcc220009  ! 3414: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xce0a0009  ! 3414: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xdb3a0009  ! 3414: STDF_R	std	%f13, [%r9, %r8]
	.word 0xdc320009  ! 3417: STH_R	sth	%r14, [%r8 + %r9]
	.word 0xc84a0009  ! 3417: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xb47a0009  ! 3417: SDIV_R	sdiv 	%r8, %r9, %r26
	.word 0xfd3a0009  ! 3420: STDF_R	std	%f30, [%r9, %r8]
	.word 0xe4420009  ! 3420: LDSW_R	ldsw	[%r8 + %r9], %r18
	.word 0xc9e21009  ! 3420: CASA_I	casa	[%r8] 0x80, %r9, %r4
	.word 0xd93a0009  ! 3423: STDF_R	std	%f12, [%r9, %r8]
	.word 0xfe420009  ! 3423: LDSW_R	ldsw	[%r8 + %r9], %r31
	.word 0xc8d21009  ! 3423: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r4
	.word 0xc6320009  ! 3426: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc85a0009  ! 3426: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xc4520009  ! 3426: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xc82a0009  ! 3429: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc20a0009  ! 3429: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xceaa1009  ! 3429: STBA_R	stba	%r7, [%r8 + %r9] 0x80
	.word 0xcc320009  ! 3432: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc64a0009  ! 3432: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xafa208a9  ! 3432: FSUBs	fsubs	%f8, %f9, %f23
	.word 0xf1220009  ! 3435: STF_R	st	%f24, [%r9, %r8]
	.word 0xc71a0009  ! 3435: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xc3ea2540  ! 3435: PREFETCHA_I	prefetcha	[%r8, + 0x0540] %asi, #one_read
	.word 0xc5220009  ! 3438: STF_R	st	%f2, [%r9, %r8]
	.word 0xc25a0009  ! 3438: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xcb2221cc  ! 3438: STF_I	st	%f5, [0x01cc, %r8]
	.word 0xf6320009  ! 3441: STH_R	sth	%r27, [%r8 + %r9]
	.word 0xfb1a0009  ! 3441: LDDF_R	ldd	[%r8, %r9], %f29
	.word 0xc36a0009  ! 3441: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xcb220009  ! 3444: STF_R	st	%f5, [%r9, %r8]
	.word 0xc6520009  ! 3444: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0x83a208a9  ! 3444: FSUBs	fsubs	%f8, %f9, %f1
	.word 0xc4220009  ! 3447: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc4120009  ! 3447: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0x04c20001  ! 3447: BRLEZ	brlez  ,nt	%8,<label_0x20001>
	.word 0xcb3a0009  ! 3450: STDF_R	std	%f5, [%r9, %r8]
	.word 0xc6120009  ! 3450: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xc53a2538  ! 3450: STDF_I	std	%f2, [0x0538, %r8]
	.word 0xd6220009  ! 3453: STW_R	stw	%r11, [%r8 + %r9]
	.word 0xc65a0009  ! 3453: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0x8143e071  ! 3453: MEMBAR	membar	#LoadLoad | #Lookaside | #MemIssue | #Sync 
	.word 0xc5220009  ! 3456: STF_R	st	%f2, [%r9, %r8]
	.word 0xdb1a0009  ! 3456: LDDF_R	ldd	[%r8, %r9], %f13
	.word 0xc3f22009  ! 3456: CASXA_R	casxa	[%r8]%asi, %r9, %r1
	.word 0xc22a0009  ! 3459: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xe4120009  ! 3459: LDUH_R	lduh	[%r8 + %r9], %r18
	.word 0x36800002  ! 3459: BGE	bge,a	<label_0x2>
	.word 0xed220009  ! 3462: STF_R	st	%f22, [%r9, %r8]
	.word 0xc2520009  ! 3462: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xca520009  ! 3462: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xca2a0009  ! 3465: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xce120009  ! 3465: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0x16800002  ! 3465: BGE	bge  	<label_0x2>
	.word 0xce320009  ! 3468: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xe11a0009  ! 3468: LDDF_R	ldd	[%r8, %r9], %f16
	.word 0xdc420009  ! 3468: LDSW_R	ldsw	[%r8 + %r9], %r14
	.word 0xec220009  ! 3471: STW_R	stw	%r22, [%r8 + %r9]
	.word 0xc8520009  ! 3471: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0x2c800001  ! 3471: BNEG	bneg,a	<label_0x1>
	.word 0xda720009  ! 3474: STX_R	stx	%r13, [%r8 + %r9]
	.word 0xc3020009  ! 3474: LDF_R	ld	[%r8, %r9], %f1
	.word 0x8143e078  ! 3474: MEMBAR	membar	#StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xcb3a0009  ! 3477: STDF_R	std	%f5, [%r9, %r8]
	.word 0xec420009  ! 3477: LDSW_R	ldsw	[%r8 + %r9], %r22
	.word 0x36800001  ! 3477: BGE	bge,a	<label_0x1>
	.word 0xf13a0009  ! 3480: STDF_R	std	%f24, [%r9, %r8]
	.word 0xca420009  ! 3480: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xf0522d84  ! 3480: LDSH_I	ldsh	[%r8 + 0x0d84], %r24
	.word 0xf33a0009  ! 3483: STDF_R	std	%f25, [%r9, %r8]
	.word 0xe65a0009  ! 3483: LDX_R	ldx	[%r8 + %r9], %r19
	.word 0x867a2b64  ! 3483: SDIV_I	sdiv 	%r8, 0x0b64, %r3
	.word 0xe22a0009  ! 3486: STB_R	stb	%r17, [%r8 + %r9]
	.word 0xca120009  ! 3486: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0x88522818  ! 3486: UMUL_I	umul 	%r8, 0x0818, %r4
	.word 0xfd3a0009  ! 3489: STDF_R	std	%f30, [%r9, %r8]
	.word 0xce020009  ! 3489: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xdc1a28e0  ! 3489: LDD_I	ldd	[%r8 + 0x08e0], %r14
	.word 0xda320009  ! 3492: STH_R	sth	%r13, [%r8 + %r9]
	.word 0xc31a0009  ! 3492: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0x8143c000  ! 3492: STBAR	stbar
	.word 0xc53a0009  ! 3495: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc5020009  ! 3495: LDF_R	ld	[%r8, %r9], %f2
	.word 0x8a720009  ! 3495: UDIV_R	udiv 	%r8, %r9, %r5
	.word 0xc7220009  ! 3498: STF_R	st	%f3, [%r9, %r8]
	.word 0xc6520009  ! 3498: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0x2a800001  ! 3498: BCS	bcs,a	<label_0x1>
	.word 0xce220009  ! 3501: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc44a0009  ! 3501: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xccc21009  ! 3501: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r6
	.word 0xcd220009  ! 3504: STF_R	st	%f6, [%r9, %r8]
	.word 0xc84a0009  ! 3504: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xbaf20009  ! 3504: UDIVcc_R	udivcc 	%r8, %r9, %r29
	.word 0xc6220009  ! 3507: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xeb020009  ! 3507: LDF_R	ld	[%r8, %r9], %f21
	.word 0x8fa20929  ! 3507: FMULs	fmuls	%f8, %f9, %f7
	.word 0xc42a0009  ! 3510: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc24a0009  ! 3510: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0x8143c000  ! 3510: STBAR	stbar
	.word 0xc4320009  ! 3513: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc4420009  ! 3513: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xc9e21009  ! 3513: CASA_I	casa	[%r8] 0x80, %r9, %r4
	.word 0xc4320009  ! 3516: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc60a0009  ! 3516: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xcafa1009  ! 3516: SWAPA_R	swapa	%r5, [%r8 + %r9] 0x80
	.word 0xdd3a0009  ! 3519: STDF_R	std	%f14, [%r9, %r8]
	.word 0xe40a0009  ! 3519: LDUB_R	ldub	[%r8 + %r9], %r18
	.word 0xeaf21009  ! 3519: STXA_R	stxa	%r21, [%r8 + %r9] 0x80
	.word 0xca2a0009  ! 3522: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc4520009  ! 3522: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xcfe21009  ! 3522: CASA_I	casa	[%r8] 0x80, %r9, %r7
	.word 0xc73a0009  ! 3525: STDF_R	std	%f3, [%r9, %r8]
	.word 0xca0a0009  ! 3525: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0x836a2e58  ! 3525: SDIVX_I	sdivx	%r8, 0x0e58, %r1
	.word 0xd8220009  ! 3528: STW_R	stw	%r12, [%r8 + %r9]
	.word 0xc64a0009  ! 3528: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0x04c20001  ! 3528: BRLEZ	brlez  ,nt	%8,<label_0x20001>
	.word 0xe82a0009  ! 3531: STB_R	stb	%r20, [%r8 + %r9]
	.word 0xcc5a0009  ! 3531: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xcc921009  ! 3531: LDUHA_R	lduha	[%r8, %r9] 0x80, %r6
	.word 0xc8320009  ! 3534: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc9020009  ! 3534: LDF_R	ld	[%r8, %r9], %f4
	.word 0xc65a22a0  ! 3534: LDX_I	ldx	[%r8 + 0x02a0], %r3
	.word 0xf3220009  ! 3537: STF_R	st	%f25, [%r9, %r8]
	.word 0xca420009  ! 3537: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xc3ea1009  ! 3537: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc9220009  ! 3540: STF_R	st	%f4, [%r9, %r8]
	.word 0xe6420009  ! 3540: LDSW_R	ldsw	[%r8 + %r9], %r19
	.word 0xc3ea2cd8  ! 3540: PREFETCHA_I	prefetcha	[%r8, + 0x0cd8] %asi, #one_read
	.word 0xc42a0009  ! 3543: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xd85a0009  ! 3543: LDX_R	ldx	[%r8 + %r9], %r12
	.word 0xbc722b50  ! 3543: UDIV_I	udiv 	%r8, 0x0b50, %r30
	.word 0xe4320009  ! 3546: STH_R	sth	%r18, [%r8 + %r9]
	.word 0xe64a0009  ! 3546: LDSB_R	ldsb	[%r8 + %r9], %r19
	.word 0x0cca0001  ! 3546: BRGZ	brgz  ,pt	%8,<label_0xa0001>
	.word 0xcd3a0009  ! 3549: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc4420009  ! 3549: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xbe6a2fe0  ! 3549: UDIVX_I	udivx 	%r8, 0x0fe0, %r31
	.word 0xf62a0009  ! 3552: STB_R	stb	%r27, [%r8 + %r9]
	.word 0xc4520009  ! 3552: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xc86a2918  ! 3552: LDSTUB_I	ldstub	%r4, [%r8 + 0x0918]
	.word 0xc4320009  ! 3555: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc3020009  ! 3555: LDF_R	ld	[%r8, %r9], %f1
	.word 0xdd222ce4  ! 3555: STF_I	st	%f14, [0x0ce4, %r8]
	.word 0xc2320009  ! 3558: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc7020009  ! 3558: LDF_R	ld	[%r8, %r9], %f3
	.word 0xc3ea1009  ! 3558: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc33a0009  ! 3561: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc6520009  ! 3561: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xe0822d9c  ! 3561: LDUWA_I	lduwa	[%r8, + 0x0d9c] %asi, %r16
	.word 0xc22a0009  ! 3564: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xfd020009  ! 3564: LDF_R	ld	[%r8, %r9], %f30
	.word 0x2cca0001  ! 3564: BRGZ	brgz,a,pt	%8,<label_0xa0001>
	.word 0xfe320009  ! 3567: STH_R	sth	%r31, [%r8 + %r9]
	.word 0xca120009  ! 3567: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xc3ea247c  ! 3567: PREFETCHA_I	prefetcha	[%r8, + 0x047c] %asi, #one_read
	.word 0xfb220009  ! 3570: STF_R	st	%f29, [%r9, %r8]
	.word 0xf40a0009  ! 3570: LDUB_R	ldub	[%r8 + %r9], %r26
	.word 0xcc6a2f08  ! 3570: LDSTUB_I	ldstub	%r6, [%r8 + 0x0f08]
	.word 0xd6320009  ! 3573: STH_R	sth	%r11, [%r8 + %r9]
	.word 0xdc520009  ! 3573: LDSH_R	ldsh	[%r8 + %r9], %r14
	.word 0xc8922070  ! 3573: LDUHA_I	lduha	[%r8, + 0x0070] %asi, %r4
	.word 0xce2a0009  ! 3576: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xd80a0009  ! 3576: LDUB_R	ldub	[%r8 + %r9], %r12
	.word 0xc60a2d34  ! 3576: LDUB_I	ldub	[%r8 + 0x0d34], %r3
	.word 0xc2720009  ! 3579: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xcc020009  ! 3579: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xce420009  ! 3579: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xc6320009  ! 3582: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc31a0009  ! 3582: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0x8143c000  ! 3582: STBAR	stbar
	.word 0xcf220009  ! 3585: STF_R	st	%f7, [%r9, %r8]
	.word 0xcc120009  ! 3585: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xc3f21009  ! 3585: CASXA_I	casxa	[%r8] 0x80, %r9, %r1
	.word 0xc73a0009  ! 3588: STDF_R	std	%f3, [%r9, %r8]
	.word 0xca420009  ! 3588: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0x8d222430  ! 3588: MULScc_I	mulscc 	%r8, 0x0430, %r6
	.word 0xcb220009  ! 3591: STF_R	st	%f5, [%r9, %r8]
	.word 0xc8420009  ! 3591: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xd87a0009  ! 3591: SWAP_R	swap	%r12, [%r8 + %r9]
	.word 0xfa220009  ! 3594: STW_R	stw	%r29, [%r8 + %r9]
	.word 0xfa120009  ! 3594: LDUH_R	lduh	[%r8 + %r9], %r29
	.word 0xb67a0009  ! 3594: SDIV_R	sdiv 	%r8, %r9, %r27
	.word 0xc4320009  ! 3597: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc2020009  ! 3597: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0x86f222b4  ! 3597: UDIVcc_I	udivcc 	%r8, 0x02b4, %r3
	.word 0xc22a0009  ! 3600: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc2120009  ! 3600: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0x85220009  ! 3600: MULScc_R	mulscc 	%r8, %r9, %r2
	.word 0xc5220009  ! 3603: STF_R	st	%f2, [%r9, %r8]
	.word 0xca420009  ! 3603: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0x22800002  ! 3603: BE	be,a	<label_0x2>
	.word 0xcf3a0009  ! 3606: STDF_R	std	%f7, [%r9, %r8]
	.word 0xe84a0009  ! 3606: LDSB_R	ldsb	[%r8 + %r9], %r20
	.word 0xe4ca1009  ! 3606: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r18
	.word 0xf5220009  ! 3609: STF_R	st	%f26, [%r9, %r8]
	.word 0xcc4a0009  ! 3609: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xcaf22320  ! 3609: STXA_I	stxa	%r5, [%r8 + 0x0320] %asi
	.word 0xfb220009  ! 3612: STF_R	st	%f29, [%r9, %r8]
	.word 0xcc420009  ! 3612: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xc36a2d88  ! 3612: PREFETCH_I	prefetch	[%r8 + 0x0d88], #one_read
	.word 0xc9220009  ! 3615: STF_R	st	%f4, [%r9, %r8]
	.word 0xc25a0009  ! 3615: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0x8143c000  ! 3615: STBAR	stbar
	.word 0xc8720009  ! 3618: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xfe120009  ! 3618: LDUH_R	lduh	[%r8 + %r9], %r31
	.word 0xa2720009  ! 3618: UDIV_R	udiv 	%r8, %r9, %r17
	.word 0xcf3a0009  ! 3621: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc60a0009  ! 3621: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xc45a2648  ! 3621: LDX_I	ldx	[%r8 + 0x0648], %r2
	.word 0xcc320009  ! 3624: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xf2120009  ! 3624: LDUH_R	lduh	[%r8 + %r9], %r25
	.word 0xe0ba20c0  ! 3624: STDA_I	stda	%r16, [%r8 + 0x00c0] %asi
	.word 0xcd3a0009  ! 3627: STDF_R	std	%f6, [%r9, %r8]
	.word 0xce520009  ! 3627: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xbba20829  ! 3627: FADDs	fadds	%f8, %f9, %f29
	.word 0xea2a0009  ! 3630: STB_R	stb	%r21, [%r8 + %r9]
	.word 0xde520009  ! 3630: LDSH_R	ldsh	[%r8 + %r9], %r15
	.word 0xc3ea228c  ! 3630: PREFETCHA_I	prefetcha	[%r8, + 0x028c] %asi, #one_read
	.word 0xca720009  ! 3633: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc24a0009  ! 3633: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xc3ea2de0  ! 3633: PREFETCHA_I	prefetcha	[%r8, + 0x0de0] %asi, #one_read
	.word 0xda720009  ! 3636: STX_R	stx	%r13, [%r8 + %r9]
	.word 0xce5a0009  ! 3636: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xcc8a1009  ! 3636: LDUBA_R	lduba	[%r8, %r9] 0x80, %r6
	.word 0xc33a0009  ! 3639: STDF_R	std	%f1, [%r9, %r8]
	.word 0xee120009  ! 3639: LDUH_R	lduh	[%r8 + %r9], %r23
	.word 0xde821009  ! 3639: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r15
	.word 0xc2320009  ! 3642: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xca420009  ! 3642: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xc3ea1009  ! 3642: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xfd3a0009  ! 3645: STDF_R	std	%f30, [%r9, %r8]
	.word 0xee520009  ! 3645: LDSH_R	ldsh	[%r8 + %r9], %r23
	.word 0x8143e04d  ! 3645: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Sync 
	.word 0xc2220009  ! 3648: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc8420009  ! 3648: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0x26c20001  ! 3648: BRLZ	brlz,a,nt	%8,<label_0x20001>
	.word 0xe0320009  ! 3651: STH_R	sth	%r16, [%r8 + %r9]
	.word 0xce4a0009  ! 3651: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0x82720009  ! 3651: UDIV_R	udiv 	%r8, %r9, %r1
	.word 0xea220009  ! 3654: STW_R	stw	%r21, [%r8 + %r9]
	.word 0xea4a0009  ! 3654: LDSB_R	ldsb	[%r8 + %r9], %r21
	.word 0x2aca0001  ! 3654: BRNZ	brnz,a,pt	%8,<label_0xa0001>
	.word 0xcb220009  ! 3657: STF_R	st	%f5, [%r9, %r8]
	.word 0xc3020009  ! 3657: LDF_R	ld	[%r8, %r9], %f1
	.word 0xc51a0009  ! 3657: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xc73a0009  ! 3660: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc51a0009  ! 3660: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xca8a22f4  ! 3660: LDUBA_I	lduba	[%r8, + 0x02f4] %asi, %r5
	.word 0xcb3a0009  ! 3663: STDF_R	std	%f5, [%r9, %r8]
	.word 0xc8420009  ! 3663: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xc4822888  ! 3663: LDUWA_I	lduwa	[%r8, + 0x0888] %asi, %r2
	.word 0xc73a0009  ! 3666: STDF_R	std	%f3, [%r9, %r8]
	.word 0xd80a0009  ! 3666: LDUB_R	ldub	[%r8 + %r9], %r12
	.word 0xf4aa2558  ! 3666: STBA_I	stba	%r26, [%r8 + 0x0558] %asi
	.word 0xe8720009  ! 3669: STX_R	stx	%r20, [%r8 + %r9]
	.word 0xdc5a0009  ! 3669: LDX_R	ldx	[%r8 + %r9], %r14
	.word 0x8143c000  ! 3669: STBAR	stbar
	.word 0xc6320009  ! 3672: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc44a0009  ! 3672: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0x8143c000  ! 3672: STBAR	stbar
	.word 0xca220009  ! 3675: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc8520009  ! 3675: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0x3c800002  ! 3675: BPOS	bpos,a	<label_0x2>
	.word 0xc3220009  ! 3678: STF_R	st	%f1, [%r9, %r8]
	.word 0xc2520009  ! 3678: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xccba2f08  ! 3678: STDA_I	stda	%r6, [%r8 + 0x0f08] %asi
	.word 0xc73a0009  ! 3681: STDF_R	std	%f3, [%r9, %r8]
	.word 0xe40a0009  ! 3681: LDUB_R	ldub	[%r8 + %r9], %r18
	.word 0xe1220009  ! 3681: STF_R	st	%f16, [%r9, %r8]
	.word 0xcc720009  ! 3684: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xcb1a0009  ! 3684: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0x8a522e58  ! 3684: UMUL_I	umul 	%r8, 0x0e58, %r5
	.word 0xe1220009  ! 3687: STF_R	st	%f16, [%r9, %r8]
	.word 0xc85a0009  ! 3687: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xc8ea22f8  ! 3687: LDSTUBA_I	ldstuba	%r4, [%r8 + 0x02f8] %asi
	.word 0xc9220009  ! 3690: STF_R	st	%f4, [%r9, %r8]
	.word 0xc6020009  ! 3690: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xcff21009  ! 3690: CASXA_I	casxa	[%r8] 0x80, %r9, %r7
	.word 0xdc2a0009  ! 3693: STB_R	stb	%r14, [%r8 + %r9]
	.word 0xce0a0009  ! 3693: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0x8b6a25b8  ! 3693: SDIVX_I	sdivx	%r8, 0x05b8, %r5
	.word 0xda320009  ! 3696: STH_R	sth	%r13, [%r8 + %r9]
	.word 0xf05a0009  ! 3696: LDX_R	ldx	[%r8 + %r9], %r24
	.word 0xc3e22009  ! 3696: CASA_R	casa	[%r8] %asi, %r9, %r1
	.word 0xca320009  ! 3699: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc6520009  ! 3699: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xc6fa2c3c  ! 3699: SWAPA_I	swapa	%r3, [%r8 + 0x0c3c] %asi
	.word 0xff3a0009  ! 3702: STDF_R	std	%f31, [%r9, %r8]
	.word 0xce5a0009  ! 3702: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0x3c800002  ! 3702: BPOS	bpos,a	<label_0x2>
	.word 0xc4720009  ! 3705: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xcf1a0009  ! 3705: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xc36a2908  ! 3705: PREFETCH_I	prefetch	[%r8 + 0x0908], #one_read
	.word 0xce320009  ! 3708: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xce5a0009  ! 3708: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0x8143c000  ! 3708: STBAR	stbar
	.word 0xc62a0009  ! 3711: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc80a0009  ! 3711: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xc4da1009  ! 3711: LDXA_R	ldxa	[%r8, %r9] 0x80, %r2
	.word 0xfe220009  ! 3714: STW_R	stw	%r31, [%r8 + %r9]
	.word 0xe05a0009  ! 3714: LDX_R	ldx	[%r8 + %r9], %r16
	.word 0xc2422b50  ! 3714: LDSW_I	ldsw	[%r8 + 0x0b50], %r1
	.word 0xce220009  ! 3717: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc4520009  ! 3717: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0x84720009  ! 3717: UDIV_R	udiv 	%r8, %r9, %r2
	.word 0xcb3a0009  ! 3720: STDF_R	std	%f5, [%r9, %r8]
	.word 0xfa120009  ! 3720: LDUH_R	lduh	[%r8 + %r9], %r29
	.word 0xcc0a2df4  ! 3720: LDUB_I	ldub	[%r8 + 0x0df4], %r6
	.word 0xc33a0009  ! 3723: STDF_R	std	%f1, [%r9, %r8]
	.word 0xcd020009  ! 3723: LDF_R	ld	[%r8, %r9], %f6
	.word 0x3a800001  ! 3723: BCC	bcc,a	<label_0x1>
	.word 0xc42a0009  ! 3726: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xfe5a0009  ! 3726: LDX_R	ldx	[%r8 + %r9], %r31
	.word 0xc6a22108  ! 3726: STWA_I	stwa	%r3, [%r8 + 0x0108] %asi
	.word 0xd7220009  ! 3729: STF_R	st	%f11, [%r9, %r8]
	.word 0xc25a0009  ! 3729: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xec4a0009  ! 3729: LDSB_R	ldsb	[%r8 + %r9], %r22
	.word 0xc22a0009  ! 3732: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc24a0009  ! 3732: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xc9220009  ! 3732: STF_R	st	%f4, [%r9, %r8]
	.word 0xed220009  ! 3735: STF_R	st	%f22, [%r9, %r8]
	.word 0xce020009  ! 3735: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0x8da20829  ! 3735: FADDs	fadds	%f8, %f9, %f6
	.word 0xea720009  ! 3738: STX_R	stx	%r21, [%r8 + %r9]
	.word 0xd64a0009  ! 3738: LDSB_R	ldsb	[%r8 + %r9], %r11
	.word 0xee7a2240  ! 3738: SWAP_I	swap	%r23, [%r8 + 0x0240]
	.word 0xc6220009  ! 3741: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc71a0009  ! 3741: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xf8a21009  ! 3741: STWA_R	stwa	%r28, [%r8 + %r9] 0x80
	.word 0xc5220009  ! 3744: STF_R	st	%f2, [%r9, %r8]
	.word 0xd6520009  ! 3744: LDSH_R	ldsh	[%r8 + %r9], %r11
	.word 0xc5e22009  ! 3744: CASA_R	casa	[%r8] %asi, %r9, %r2
	.word 0xc8720009  ! 3747: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xcc520009  ! 3747: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0x40000001  ! 3747: CALL	call	disp30_1
	.word 0xcf3a0009  ! 3750: STDF_R	std	%f7, [%r9, %r8]
	.word 0xcc020009  ! 3750: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xc36a2c98  ! 3750: PREFETCH_I	prefetch	[%r8 + 0x0c98], #one_read
	.word 0xec2a0009  ! 3753: STB_R	stb	%r22, [%r8 + %r9]
	.word 0xca420009  ! 3753: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0x8143e06f  ! 3753: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #MemIssue | #Sync 
	.word 0xc62a0009  ! 3756: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xce120009  ! 3756: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0x82fa0009  ! 3756: SDIVcc_R	sdivcc 	%r8, %r9, %r1
	.word 0xf33a0009  ! 3759: STDF_R	std	%f25, [%r9, %r8]
	.word 0xde120009  ! 3759: LDUH_R	lduh	[%r8 + %r9], %r15
	.word 0x8c6a0009  ! 3759: UDIVX_R	udivx 	%r8, %r9, %r6
	.word 0xce220009  ! 3762: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xca4a0009  ! 3762: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xc7e22009  ! 3762: CASA_R	casa	[%r8] %asi, %r9, %r3
	.word 0xcd3a0009  ! 3765: STDF_R	std	%f6, [%r9, %r8]
	.word 0xca4a0009  ! 3765: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xf5e21009  ! 3765: CASA_I	casa	[%r8] 0x80, %r9, %r26
	.word 0xf4720009  ! 3768: STX_R	stx	%r26, [%r8 + %r9]
	.word 0xcb020009  ! 3768: LDF_R	ld	[%r8, %r9], %f5
	.word 0xc36a201c  ! 3768: PREFETCH_I	prefetch	[%r8 + 0x001c], #one_read
	.word 0xd6320009  ! 3771: STH_R	sth	%r11, [%r8 + %r9]
	.word 0xcd1a0009  ! 3771: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xc46a0009  ! 3771: LDSTUB_R	ldstub	%r2, [%r8 + %r9]
	.word 0xca2a0009  ! 3774: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xca420009  ! 3774: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0x845a0009  ! 3774: SMUL_R	smul 	%r8, %r9, %r2
	.word 0xc93a0009  ! 3777: STDF_R	std	%f4, [%r9, %r8]
	.word 0xcd020009  ! 3777: LDF_R	ld	[%r8, %r9], %f6
	.word 0xdeb22cc8  ! 3777: STHA_I	stha	%r15, [%r8 + 0x0cc8] %asi
	.word 0xc7220009  ! 3780: STF_R	st	%f3, [%r9, %r8]
	.word 0xdc120009  ! 3780: LDUH_R	lduh	[%r8 + %r9], %r14
	.word 0xcc9a28a0  ! 3780: LDDA_I	ldda	[%r8, + 0x08a0] %asi, %r6
	.word 0xce720009  ! 3783: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc84a0009  ! 3783: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0x2ec20001  ! 3783: BRGEZ	brgez,a,nt	%8,<label_0x20001>
	.word 0xf53a0009  ! 3786: STDF_R	std	%f26, [%r9, %r8]
	.word 0xc7020009  ! 3786: LDF_R	ld	[%r8, %r9], %f3
	.word 0xc88a1009  ! 3786: LDUBA_R	lduba	[%r8, %r9] 0x80, %r4
	.word 0xf6220009  ! 3789: STW_R	stw	%r27, [%r8 + %r9]
	.word 0xcc4a0009  ! 3789: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xf4ba1009  ! 3789: STDA_R	stda	%r26, [%r8 + %r9] 0x80
	.word 0xdf3a0009  ! 3792: STDF_R	std	%f15, [%r9, %r8]
	.word 0xce420009  ! 3792: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0x8e7a2158  ! 3792: SDIV_I	sdiv 	%r8, 0x0158, %r7
	.word 0xca320009  ! 3795: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc6420009  ! 3795: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xc6520009  ! 3795: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xce220009  ! 3798: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc6020009  ! 3798: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0x8c6a0009  ! 3798: UDIVX_R	udivx 	%r8, %r9, %r6
	.word 0xde2a0009  ! 3801: STB_R	stb	%r15, [%r8 + %r9]
	.word 0xd8420009  ! 3801: LDSW_R	ldsw	[%r8 + %r9], %r12
	.word 0x876a0009  ! 3801: SDIVX_R	sdivx	%r8, %r9, %r3
	.word 0xc5220009  ! 3804: STF_R	st	%f2, [%r9, %r8]
	.word 0xf40a0009  ! 3804: LDUB_R	ldub	[%r8 + %r9], %r26
	.word 0xc2aa28ac  ! 3804: STBA_I	stba	%r1, [%r8 + 0x08ac] %asi
	.word 0xdc320009  ! 3807: STH_R	sth	%r14, [%r8 + %r9]
	.word 0xed020009  ! 3807: LDF_R	ld	[%r8, %r9], %f22
	.word 0x2cc20001  ! 3807: BRGZ	brgz,a,nt	%8,<label_0x20001>
	.word 0xc62a0009  ! 3810: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xce4a0009  ! 3810: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xc36a2ca0  ! 3810: PREFETCH_I	prefetch	[%r8 + 0x0ca0], #one_read
	.word 0xc6720009  ! 3813: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xca020009  ! 3813: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0x87a209a9  ! 3813: FDIVs	fdivs	%f8, %f9, %f3
	.word 0xcf220009  ! 3816: STF_R	st	%f7, [%r9, %r8]
	.word 0xce5a0009  ! 3816: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xc3ea1009  ! 3816: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc3220009  ! 3819: STF_R	st	%f1, [%r9, %r8]
	.word 0xc51a0009  ! 3819: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xc36a26cc  ! 3819: PREFETCH_I	prefetch	[%r8 + 0x06cc], #one_read
	.word 0xda720009  ! 3822: STX_R	stx	%r13, [%r8 + %r9]
	.word 0xc60a0009  ! 3822: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0x8143c000  ! 3822: STBAR	stbar
	.word 0xc5220009  ! 3825: STF_R	st	%f2, [%r9, %r8]
	.word 0xc6120009  ! 3825: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xc41a2378  ! 3825: LDD_I	ldd	[%r8 + 0x0378], %r2
	.word 0xc33a0009  ! 3828: STDF_R	std	%f1, [%r9, %r8]
	.word 0xce4a0009  ! 3828: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0x89222b2c  ! 3828: MULScc_I	mulscc 	%r8, 0x0b2c, %r4
	.word 0xc4220009  ! 3831: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xcc120009  ! 3831: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xcaaa22cc  ! 3831: STBA_I	stba	%r5, [%r8 + 0x02cc] %asi
	.word 0xee2a0009  ! 3834: STB_R	stb	%r23, [%r8 + %r9]
	.word 0xcc420009  ! 3834: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xe2420009  ! 3834: LDSW_R	ldsw	[%r8 + %r9], %r17
	.word 0xca220009  ! 3837: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc65a0009  ! 3837: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xc3ea1009  ! 3837: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xd7220009  ! 3840: STF_R	st	%f11, [%r9, %r8]
	.word 0xc5020009  ! 3840: LDF_R	ld	[%r8, %r9], %f2
	.word 0x06800002  ! 3840: BL	bl  	<label_0x2>
	.word 0xda320009  ! 3843: STH_R	sth	%r13, [%r8 + %r9]
	.word 0xce5a0009  ! 3843: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0x8143e037  ! 3843: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside | #MemIssue 
	.word 0xf2320009  ! 3846: STH_R	sth	%r25, [%r8 + %r9]
	.word 0xca4a0009  ! 3846: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0x8a52232c  ! 3846: UMUL_I	umul 	%r8, 0x032c, %r5
	.word 0xce220009  ! 3849: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc3020009  ! 3849: LDF_R	ld	[%r8, %r9], %f1
	.word 0xada209a9  ! 3849: FDIVs	fdivs	%f8, %f9, %f22
	.word 0xce2a0009  ! 3852: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc2520009  ! 3852: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xb1a20829  ! 3852: FADDs	fadds	%f8, %f9, %f24
	.word 0xc9220009  ! 3855: STF_R	st	%f4, [%r9, %r8]
	.word 0xe05a0009  ! 3855: LDX_R	ldx	[%r8 + %r9], %r16
	.word 0x8143e049  ! 3855: MEMBAR	membar	#LoadLoad | #StoreStore | #Sync 
	.word 0xca2a0009  ! 3858: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc24a0009  ! 3858: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xc9022fcc  ! 3858: LDF_I	ld	[%r8, 0x0fcc], %f4
	.word 0xc9220009  ! 3861: STF_R	st	%f4, [%r9, %r8]
	.word 0xc80a0009  ! 3861: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0x827a0009  ! 3861: SDIV_R	sdiv 	%r8, %r9, %r1
	.word 0xca320009  ! 3864: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xe44a0009  ! 3864: LDSB_R	ldsb	[%r8 + %r9], %r18
	.word 0xcaa21009  ! 3864: STWA_R	stwa	%r5, [%r8 + %r9] 0x80
	.word 0xc4720009  ! 3867: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc4420009  ! 3867: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0x8143c000  ! 3867: STBAR	stbar
	.word 0xc3220009  ! 3870: STF_R	st	%f1, [%r9, %r8]
	.word 0xc8520009  ! 3870: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xc2aa2490  ! 3870: STBA_I	stba	%r1, [%r8 + 0x0490] %asi
	.word 0xc53a0009  ! 3873: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc8520009  ! 3873: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xcef21009  ! 3873: STXA_R	stxa	%r7, [%r8 + %r9] 0x80
	.word 0xfe320009  ! 3876: STH_R	sth	%r31, [%r8 + %r9]
	.word 0xce120009  ! 3876: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xc3ea1009  ! 3876: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc3220009  ! 3879: STF_R	st	%f1, [%r9, %r8]
	.word 0xdc020009  ! 3879: LDUW_R	lduw	[%r8 + %r9], %r14
	.word 0xc3ea1009  ! 3879: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xcc720009  ! 3882: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xef020009  ! 3882: LDF_R	ld	[%r8, %r9], %f23
	.word 0x825a0009  ! 3882: SMUL_R	smul 	%r8, %r9, %r1
	.word 0xcf220009  ! 3885: STF_R	st	%f7, [%r9, %r8]
	.word 0xc4520009  ! 3885: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xc2520009  ! 3885: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xe5220009  ! 3888: STF_R	st	%f18, [%r9, %r8]
	.word 0xca120009  ! 3888: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0x8143e03a  ! 3888: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside | #MemIssue 
	.word 0xc4320009  ! 3891: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xca120009  ! 3891: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xc66a2c40  ! 3891: LDSTUB_I	ldstub	%r3, [%r8 + 0x0c40]
	.word 0xdc220009  ! 3894: STW_R	stw	%r14, [%r8 + %r9]
	.word 0xc20a0009  ! 3894: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0x8143e058  ! 3894: MEMBAR	membar	#StoreStore | #Lookaside | #Sync 
	.word 0xc22a0009  ! 3897: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc6020009  ! 3897: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xc72220c0  ! 3897: STF_I	st	%f3, [0x00c0, %r8]
	.word 0xcc220009  ! 3900: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xcc120009  ! 3900: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0x26c20001  ! 3900: BRLZ	brlz,a,nt	%8,<label_0x20001>
	.word 0xcb3a0009  ! 3903: STDF_R	std	%f5, [%r9, %r8]
	.word 0xd6020009  ! 3903: LDUW_R	lduw	[%r8 + %r9], %r11
	.word 0x8e5a2f34  ! 3903: SMUL_I	smul 	%r8, 0x0f34, %r7
	.word 0xf0320009  ! 3906: STH_R	sth	%r24, [%r8 + %r9]
	.word 0xcb020009  ! 3906: LDF_R	ld	[%r8, %r9], %f5
	.word 0x26ca0001  ! 3906: BRLZ	brlz,a,pt	%8,<label_0xa0001>
	.word 0xe1220009  ! 3909: STF_R	st	%f16, [%r9, %r8]
	.word 0xca0a0009  ! 3909: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xf1220009  ! 3909: STF_R	st	%f24, [%r9, %r8]
	.word 0xf1220009  ! 3912: STF_R	st	%f24, [%r9, %r8]
	.word 0xce120009  ! 3912: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xc3ea2208  ! 3912: PREFETCHA_I	prefetcha	[%r8, + 0x0208] %asi, #one_read
	.word 0xc73a0009  ! 3915: STDF_R	std	%f3, [%r9, %r8]
	.word 0xe6120009  ! 3915: LDUH_R	lduh	[%r8 + %r9], %r19
	.word 0xe87a2504  ! 3915: SWAP_I	swap	%r20, [%r8 + 0x0504]
	.word 0xd62a0009  ! 3918: STB_R	stb	%r11, [%r8 + %r9]
	.word 0xc6120009  ! 3918: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xe2b21009  ! 3918: STHA_R	stha	%r17, [%r8 + %r9] 0x80
	.word 0xc4220009  ! 3921: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc64a0009  ! 3921: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0x892222ac  ! 3921: MULScc_I	mulscc 	%r8, 0x02ac, %r4
	.word 0xc6320009  ! 3924: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xf8020009  ! 3924: LDUW_R	lduw	[%r8 + %r9], %r28
	.word 0xb2720009  ! 3924: UDIV_R	udiv 	%r8, %r9, %r25
	.word 0xc53a0009  ! 3927: STDF_R	std	%f2, [%r9, %r8]
	.word 0xcc020009  ! 3927: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xcdf22009  ! 3927: CASXA_R	casxa	[%r8]%asi, %r9, %r6
	.word 0xed220009  ! 3930: STF_R	st	%f22, [%r9, %r8]
	.word 0xdc0a0009  ! 3930: LDUB_R	ldub	[%r8 + %r9], %r14
	.word 0xc84a0009  ! 3930: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xc9220009  ! 3933: STF_R	st	%f4, [%r9, %r8]
	.word 0xce120009  ! 3933: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0x8ba209a9  ! 3933: FDIVs	fdivs	%f8, %f9, %f5
	.word 0xc33a0009  ! 3936: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc64a0009  ! 3936: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xc3ea1009  ! 3936: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xee220009  ! 3939: STW_R	stw	%r23, [%r8 + %r9]
	.word 0xf2420009  ! 3939: LDSW_R	ldsw	[%r8 + %r9], %r25
	.word 0xcbf22009  ! 3939: CASXA_R	casxa	[%r8]%asi, %r9, %r5
	.word 0xd93a0009  ! 3942: STDF_R	std	%f12, [%r9, %r8]
	.word 0xc9020009  ! 3942: LDF_R	ld	[%r8, %r9], %f4
	.word 0x34800001  ! 3942: BG	bg,a	<label_0x1>
	.word 0xf0220009  ! 3945: STW_R	stw	%r24, [%r8 + %r9]
	.word 0xc80a0009  ! 3945: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xc8020009  ! 3945: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xc4320009  ! 3948: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xcc120009  ! 3948: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xc4ba2768  ! 3948: STDA_I	stda	%r2, [%r8 + 0x0768] %asi
	.word 0xcd220009  ! 3951: STF_R	st	%f6, [%r9, %r8]
	.word 0xc2420009  ! 3951: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xc46a2428  ! 3951: LDSTUB_I	ldstub	%r2, [%r8 + 0x0428]
	.word 0xce720009  ! 3954: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc3020009  ! 3954: LDF_R	ld	[%r8, %r9], %f1
	.word 0xc41a2868  ! 3954: LDD_I	ldd	[%r8 + 0x0868], %r2
	.word 0xcc2a0009  ! 3957: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc9020009  ! 3957: LDF_R	ld	[%r8, %r9], %f4
	.word 0x89220009  ! 3957: MULScc_R	mulscc 	%r8, %r9, %r4
	.word 0xc2220009  ! 3960: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xda520009  ! 3960: LDSH_R	ldsh	[%r8 + %r9], %r13
	.word 0xc45a24e8  ! 3960: LDX_I	ldx	[%r8 + 0x04e8], %r2
	.word 0xc62a0009  ! 3963: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc3020009  ! 3963: LDF_R	ld	[%r8, %r9], %f1
	.word 0x2aca0001  ! 3963: BRNZ	brnz,a,pt	%8,<label_0xa0001>
	.word 0xff220009  ! 3966: STF_R	st	%f31, [%r9, %r8]
	.word 0xe0420009  ! 3966: LDSW_R	ldsw	[%r8 + %r9], %r16
	.word 0xc72228b8  ! 3966: STF_I	st	%f3, [0x08b8, %r8]
	.word 0xf4220009  ! 3969: STW_R	stw	%r26, [%r8 + %r9]
	.word 0xca420009  ! 3969: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0x965221bc  ! 3969: UMUL_I	umul 	%r8, 0x01bc, %r11
	.word 0xec220009  ! 3972: STW_R	stw	%r22, [%r8 + %r9]
	.word 0xc2420009  ! 3972: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xc36a27ec  ! 3972: PREFETCH_I	prefetch	[%r8 + 0x07ec], #one_read
	.word 0xec720009  ! 3975: STX_R	stx	%r22, [%r8 + %r9]
	.word 0xc5020009  ! 3975: LDF_R	ld	[%r8, %r9], %f2
	.word 0xeea22cf0  ! 3975: STWA_I	stwa	%r23, [%r8 + 0x0cf0] %asi
	.word 0xcd220009  ! 3978: STF_R	st	%f6, [%r9, %r8]
	.word 0xc8020009  ! 3978: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xc3ea1009  ! 3978: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xdc320009  ! 3981: STH_R	sth	%r14, [%r8 + %r9]
	.word 0xc24a0009  ! 3981: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0x84d20009  ! 3981: UMULcc_R	umulcc 	%r8, %r9, %r2
	.word 0xda320009  ! 3984: STH_R	sth	%r13, [%r8 + %r9]
	.word 0xf4120009  ! 3984: LDUH_R	lduh	[%r8 + %r9], %r26
	.word 0xc3e22009  ! 3984: CASA_R	casa	[%r8] %asi, %r9, %r1
	.word 0xc93a0009  ! 3987: STDF_R	std	%f4, [%r9, %r8]
	.word 0xe8020009  ! 3987: LDUW_R	lduw	[%r8 + %r9], %r20
	.word 0xe8921009  ! 3987: LDUHA_R	lduha	[%r8, %r9] 0x80, %r20
	.word 0xca2a0009  ! 3990: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xfe020009  ! 3990: LDUW_R	lduw	[%r8 + %r9], %r31
	.word 0xc8822bc8  ! 3990: LDUWA_I	lduwa	[%r8, + 0x0bc8] %asi, %r4
	.word 0xcd3a0009  ! 3993: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc8520009  ! 3993: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xe8ba1009  ! 3993: STDA_R	stda	%r20, [%r8 + %r9] 0x80
	.word 0xff3a0009  ! 3996: STDF_R	std	%f31, [%r9, %r8]
	.word 0xf00a0009  ! 3996: LDUB_R	ldub	[%r8 + %r9], %r24
	.word 0x872222e0  ! 3996: MULScc_I	mulscc 	%r8, 0x02e0, %r3
	.word 0xf73a0009  ! 3999: STDF_R	std	%f27, [%r9, %r8]
	.word 0xde5a0009  ! 3999: LDX_R	ldx	[%r8 + %r9], %r15
	.word 0xdaa22690  ! 3999: STWA_I	stwa	%r13, [%r8 + 0x0690] %asi
        ta      T_GOOD_TRAP

.data
	.word  0xdb804306,0x9dd54974,0x0b9247e8,0x01b578eb
	.word  0x8b9297d1,0x16dfa9d3,0x773946d6,0x579ecd34
	.word  0x790cc16c,0xbb0b18aa,0xbbe412eb,0xd79dd079
	.word  0x45437144,0xed1a593d,0x70fb0506,0xde635fef
	.word  0xdcdaf706,0x955e3e4c,0x4deabcc5,0xc5f9ab8b
	.word  0x298a1066,0xcf3df3c8,0xc6019459,0xd5d897d3
	.word  0x000cd78a,0xb5443c5b,0x9becb14b,0xe73bc1ec
	.word  0xf722a0b0,0xee0c53ec,0xc195ad94,0x0750858f
	.word  0x450f3075,0xab7e87a4,0xc671187c,0xacd59009
	.word  0xf13fc387,0xf7ca440a,0x5bea4e47,0x1a22f30a
	.word  0x607762ae,0xcac4c761,0xc95e7f13,0xfd5c2220
	.word  0x7b53462e,0x17235cdd,0x75f6f85a,0x03038ef0
	.word  0xdcb8674f,0x0f0a8058,0x2aaf7987,0x6f8e4543
	.word  0x3d414dc2,0xeb0e065d,0x6ce0939c,0x1f15978d
	.word  0x127110f5,0x6195470d,0x9b90a80e,0x2427dacb
	.word  0x19894716,0x9940920d,0xccf92562,0xd853eb85
	.word  0xa34e3dcc,0xc4ccb844,0xb11073d0,0x07e6c916
	.word  0x555c4894,0x603f7e78,0xaa77473f,0xe7f33f02
	.word  0x4975531e,0xb5c0edf9,0xa4254fb0,0x88525be0
	.word  0xb9c2ea25,0xdccc3b0c,0x0b467401,0x13f7e2a6
	.word  0x1ae8a817,0x8e5ce350,0x07490985,0x28da5ede
	.word  0xd77023de,0xfe9d313f,0x03d0feba,0xbab138d5
	.word  0xf7dd0910,0xb4404999,0x4e2d8b57,0x59ad36b3
	.word  0x559db08d,0xbcd7eb14,0xd445cd98,0xd9fe9d18
	.word  0x92054241,0xb41bfc6f,0xbfe0e063,0x1ea8698c
	.word  0xb9313350,0x2251c516,0x98dac3c5,0x49e24ab5
	.word  0x66b9ba4e,0x415a0cfa,0xaf3f5338,0xd3415bb5
	.word  0x53eca780,0xb77e4015,0xe4139e8e,0x36dec895
	.word  0xd191c23e,0xe7de1903,0x5dd176d5,0x28e47c56
	.word  0x7261a7af,0xefcf16f8,0xae5ad050,0x46e93e35
	.word  0x428bdaeb,0x0ad0724f,0xb3f416ce,0x7dcf23f6
	.word  0x8e9a00ba,0xd70baf58,0x0497a890,0xc5b9ac13
	.word  0x00dc6940,0xeaf9285a,0xf580e372,0xe9aae411
	.word  0xb1029ccf,0x8fefa2d1,0x07e7d8b6,0x7e46c8d3
	.word  0x589ba796,0x6353abed,0xa20c0638,0x96ad65cc
	.word  0xef011a1d,0x718ff976,0xdcf38a4e,0xf812ba26
	.word  0x2bad5cc2,0x1174e64e,0x76b1639a,0x3e9c897b
	.word  0xfaa08e26,0xebd965b6,0x96b7086c,0x9564dabb
	.word  0xcb0feb51,0x38d7a9d1,0x77b01870,0x267cc4ea
	.word  0x69355faa,0x26d58291,0xe1839b84,0x2b165c85
	.word  0x817530db,0xa8214bb4,0x5bb2fdf2,0xe66f5ed1
	.word  0xc0be3a7d,0x3908bde0,0xd6dedabd,0x9e86137b
	.word  0x1347cd8c,0x1dc52dda,0x9af3c396,0x7eadcec7
	.word  0x4178f2a0,0x79e6ba01,0x93b7c53b,0x1f55493b
	.word  0x0e6008a7,0x6d9b3a0a,0x67033f91,0x46f919fd
	.word  0x55a3ceda,0x7f96ffb0,0xc16235eb,0x297824f4
	.word  0xd8082abe,0xc3d04821,0x93dbe613,0x417107bb
	.word  0x5b72be89,0xc394b78e,0x0258dac7,0x9aea5c47
	.word  0xcdc0cf40,0x2bed17c0,0x91b385d6,0x3bae9bb6
	.word  0x126d9fbf,0xe6fd0a56,0x19c5a766,0xd99bb7f1
	.word  0xfc6fd3b4,0x5eaca8b4,0x872e0185,0xfdd48f41
	.word  0x0483727d,0x14897fe0,0x1f68148a,0xde8b1d79
	.word  0xc4422a34,0xa3dd9a78,0x86625fea,0xf9f69413
	.word  0x41940e75,0x1b08f0d0,0x08f3d7cd,0x6f441885
	.word  0x4e575546,0xca69efa3,0xaf56d545,0x1c38fc57
	.word  0x5957acf0,0xc5f44f1f,0x657aa89d,0x74ec9f66
	.word  0xb7435a8e,0x20e9ef34,0x56af40db,0x20787cee
	.word  0x21375196,0xdca23d0d,0x24cc50fb,0x76a4b4ea
	.word  0x28b0b5f5,0x055c98ae,0xb021ee33,0xf0554d3f
	.word  0x1e2a0c49,0x28e22688,0x2bec246f,0x9b4306b3
	.word  0x289f28ab,0xab8037a8,0xf7d6829a,0xfd841c68
	.word  0xea50d6ca,0xa4210cb5,0x85afc4f3,0x6c439def
	.word  0x3569600e,0x4bf2f2e7,0x3a91fed5,0xaea2f318
	.word  0x36290e65,0xd5e29ecc,0xadbc92a7,0xa8c6a08e
	.word  0x7d3cb307,0xea7bcfda,0x949a8ea0,0x3c2c6e98
	.word  0xfe810faf,0x866d083b,0x150e8d55,0x707b3ba5
	.word  0x160339ae,0x8db7c834,0x2f9a7bf7,0x491946bf
	.word  0x225e3118,0x5b1d2c0d,0x549a9a14,0x1abb9b3a
	.word  0xf6721fd7,0x578e6cab,0xf0eba57d,0xfa3395c5
	.word  0xd80ad854,0xcce2fa19,0x301743c7,0xea48a951
	.word  0xc0a1dc7c,0xbc050342,0x63977013,0x188e500b
	.word  0xcfd99e0a,0x8151d47e,0x399214f2,0x4deda0e4
	.word  0xf6170c8b,0x6dcd7817,0xc1eb175e,0x9cd951de
	.word  0x4a0c654f,0xedb64b41,0x7a091a85,0x6d052a1c
	.word  0x1c275af4,0xa94e7546,0x8e3f7d5a,0x69edc490
	.word  0xf18c6d81,0xadd6081c,0x60f5114d,0x7b943d6f
	.word  0x77ac4d1a,0xf969ff18,0x7b16692c,0x3b013479
	.word  0x3d0aadcc,0x6b3a6b2d,0x8740dc5f,0x68d2830c
	.word  0x27f0024c,0x0c2c7d05,0x1033e5cd,0xa463e002
	.word  0x37b2e176,0x03461392,0x7e918276,0xc23f7428
	.word  0x8a251801,0x2a7b4489,0xf90cd266,0xd9aae1b1
	.word  0xc0117f7d,0x003a96ee,0x6315d19c,0x4f2c3e7f
	.word  0x6bf28bde,0xa83c6b05,0xa6ace544,0x28251b88
	.word  0x742f2757,0xce72fe32,0xadbc3983,0xb3cacae2
	.word  0x2f3e1990,0xab5ee7e7,0x81d82c60,0x44c8bcfe
	.word  0xc42aaad7,0xd2b29105,0x43ab5a59,0x05732fd8
	.word  0xb91e84c7,0x911e427b,0x692ad7e3,0xd5415629
	.word  0x1a167491,0xbe551e3a,0xdb66ab7f,0xec8a09c6
	.word  0xdbab6962,0x9f85f59b,0x26bd45c1,0xf1c164fd
	.word  0x76d7990a,0x93c6543a,0x526d949d,0xc2992156
	.word  0xc7e16deb,0x0fa99803,0x7226d6ad,0x1c682aeb
	.word  0x8257d120,0x8591f5c3,0x899fcf7c,0xd2f82652
	.word  0x3cd75751,0x4f99a2c1,0x30ce682d,0x67cb2b21
	.word  0xbe204601,0x7f6cc55b,0x0b8aa673,0xc7854b5c
	.word  0x29396737,0xae1d5601,0x10fc8902,0xe2e0bd52
	.word  0x293403fb,0xd04abb80,0xcc4866d5,0xbafdf34f
	.word  0x688cdff4,0x949c5ebd,0x2444ed25,0x5ee5f20c
	.word  0xa906aae7,0x45f77411,0x01145417,0xf8d2556e
	.word  0x112e8e49,0xf89d0e90,0x60caf483,0x560c805e
	.word  0x8d65546e,0xae1ea665,0xc5feef18,0x702cbc76
	.word  0xa20549aa,0x733a5feb,0x87a95693,0x84e66aa9
	.word  0xbd6d324e,0x989e6ec8,0x05a3fd9c,0x6b5515d2
	.word  0xec016242,0xe02b8d13,0x92c9a3d7,0xcea68332
	.word  0xb9b7f40f,0xd61c9c0d,0xa64c8065,0xeaa82fa0
	.word  0x15624986,0x68e019e4,0xa85237a8,0x716aef45
	.word  0x7eefef83,0x7ec38f71,0x67665b14,0x45c361b6
	.word  0x4cd6d3be,0xc15c5623,0xda0776bf,0x9803bbbd
	.word  0xa5b529ff,0x478fbaaa,0xef91c654,0x48635299
	.word  0xe56b1ce1,0xd5bdbea4,0x6e92c450,0xacff9be7
	.word  0xa368bed7,0x5761b1fd,0x77a9fe66,0x25ee3a4d
	.word  0xc8d63e31,0x5b4fdeb5,0xcb4558f9,0x5ba90962
	.word  0xcfd50082,0x5a54419d,0x02600830,0xc4c33881
	.word  0x15c30437,0x959f8852,0xf1bb14a2,0xd19cc1f7
	.word  0xfc9c301f,0x6deda7e7,0x5f957548,0x40be46db
	.word  0x0eb798df,0xa50c6c15,0xa0b16df8,0x60324549
	.word  0x09fd96b4,0xcb2437ea,0x037a01f9,0x7d5fe1d7
	.word  0xe08f193c,0xf0b29c9a,0xbd554c1c,0x6ec2b35d
	.word  0xbc12ab79,0x2d91e139,0x67944ac7,0xc0a245ca
	.word  0x6409a686,0xf24a8593,0xb5f285d3,0x6a182c3c
	.word  0xa352cdd6,0xa51eba70,0x8e09d582,0x1da33318
	.word  0xff303839,0xe7c1b54a,0x9b61a6a3,0x711ccff3
	.word  0x6cf0e9d0,0x941bef1e,0x200666a6,0x2e936108
	.word  0x92ab3e0c,0x4fc7faba,0x22b23ab9,0x355ecf42
	.word  0x17abb3fe,0x36f61e9d,0x92099128,0x91e890eb
	.word  0xea9ea0b7,0x551ac346,0xe58974c4,0x6abd604a
	.word  0x6aecb233,0x8e45a788,0xfe38f10d,0x6142a581
	.word  0x931095cf,0x00aad8e0,0xd0e14d01,0x7a78cb03
	.word  0x0e65ada1,0x8b4866bc,0xede4d45d,0xfe5c330a
	.word  0xb596ec70,0x5a36ed56,0xd01122a4,0xecc365d2
	.word  0x7c1e3981,0x228c806e,0x85634c0e,0x5b12c2fb
	.word  0x2ad55970,0x6c699463,0x7fd331ee,0x8ebf5719
	.word  0x4aa7c123,0xbf954956,0x247a1c49,0x777ec309
	.word  0x479abc1e,0x97205a0b,0x65838901,0x178a47d8
	.word  0x75e0a09e,0x2d6e199d,0xe28ff074,0xe3e313e4
	.word  0xc1d37c28,0xd27ea8a8,0x7468e5e9,0xddf9f875
	.word  0x09f1aa55,0xeb546857,0x6924f607,0x65cab350
	.word  0x580e0fbb,0x41ef9842,0xdcc558ff,0x0e82b058
	.word  0x41fc5016,0x90108811,0x90d5b3fc,0x0342dd85
	.word  0x089d6905,0x8c773028,0xb2f7ad51,0xc017a4ab
	.word  0x3e24de24,0x83157f0f,0x122b292b,0x957b22a2
	.word  0x2c10ce9a,0x2769e626,0x760e8e54,0x31f4db7a
	.word  0xac916870,0x38a6b966,0x9b6fb920,0x652102bc
	.word  0xf17e035a,0xc469332e,0x00d60ca9,0x85ba81e4
	.word  0xb75dbf10,0xbd6a39d4,0x4691c470,0x4dc5ae60
	.word  0x18b059ce,0xeeb7a120,0xad62afad,0x041fe902
	.word  0x66676cf3,0xc17be638,0xab41990c,0xb2fa2bb8
	.word  0xb1fd9ef5,0x7997ff24,0xe5006fb2,0x8add57ec
	.word  0x720ca813,0x9b1e0d0f,0x09e27e2a,0xe6f74721
	.word  0xae158710,0xc96d04ac,0x3dd969aa,0xd0c013d1
	.word  0x10bf5bf6,0x1ceddaa4,0xa8c141ad,0xbc94ea49
	.word  0xa41d08b2,0x3a66423f,0x00d3ec6b,0x92bbffe6
	.word  0x5a6e39c7,0xa23b9675,0x8c6e7c7f,0xd2806a61
	.word  0x94b2fb09,0x0a65c9e3,0x6557747d,0x63a827cb
	.word  0x6eb08f7e,0x14c6f908,0x188c058f,0x9d58f5de
	.word  0x9ee98bf3,0x69eaaf94,0xc36d48c5,0x97bcca7d
	.word  0xbe532489,0x21b61357,0x7c3b80ce,0xcefb376e
	.word  0x7481a4b1,0x1ef57e34,0x98e8407d,0x7a71b802
	.word  0x29d5e51f,0xb27e0e5d,0xa339eb00,0x1a6877f1
	.word  0xe9b26c3d,0x299fe8c5,0x538b54dc,0x3cc3f895
	.word  0x000dcf5b,0xe313da6c,0xf27188cf,0x42ea87f6
	.word  0x6faa2173,0x6cd0e70b,0xa82098c7,0xe675de1c
	.word  0xceff5095,0x7d1213c5,0xb83cdb71,0x3cf000e4
	.word  0xb8e8ad82,0x04cb3131,0x00565cd1,0xda112ffa
	.word  0x42795f70,0x951ea4bc,0xe7671828,0x0d1647d6
	.word  0x415c8eb2,0x82f2b72b,0x37492e14,0x723b8f63
	.word  0x18dabe68,0x33b8290d,0x458f1283,0x0c075d2a
	.word  0xc8d8d566,0x2b254e20,0xbac2e759,0xb811cd4b
	.word  0xc2b755ce,0xbe02573f,0x9e488532,0x20da3e77
	.word  0x2b6d8264,0x35d95821,0x5b718fb8,0x26a88df9
	.word  0xcd282bc2,0xe35bffc8,0xf4467fb6,0x9f9115fd
	.word  0x2a055037,0xf5454719,0x11215f37,0x543baad1
	.word  0x1da9cd89,0x5610522f,0x2aee2b07,0xdafcdce2
	.word  0x0c83b808,0xd8f2a117,0xe7b2d28f,0xf17bf7e3
	.word  0x0a1cdf72,0x053329e0,0x3d9d355d,0xc2aa98a7
	.word  0xfc0c8d2c,0xc08cc2b0,0x4394107c,0x725e4f58
	.word  0x3d6b474c,0x35d12436,0x5a09f15b,0x70a7ca13
	.word  0xee42cc28,0x9125c389,0x9bd4ce38,0x8831de7c
	.word  0x0c00d4ce,0xe7b6bfe8,0x12a3791c,0x8fe7ddd8
	.word  0x5f17f73e,0xae15cd4a,0x36f5478a,0xcb607445
	.word  0xd9602884,0xca674e91,0x3d95def9,0x49446802
	.word  0xfceb7341,0x4904ca6d,0x20205e37,0xd905d75f
	.word  0x3f8c1ba5,0x3c42ae55,0x710f695a,0x0d6b5f0e
	.word  0x1581037d,0xf26464d9,0xdbd2ca3c,0xc37682a1
	.word  0x55f04283,0x8858b572,0xa3d4d300,0x2cf392c9
	.word  0xc5cbac39,0xa25b8fe5,0x3d74ef76,0xfafb150e
	.word  0x7987b69d,0x5b544c99,0x9c92c758,0x097c1879
	.word  0xdf9fd9b2,0xab93947e,0xd446571b,0xa14193b3
	.word  0x1d2627d3,0xf05ba568,0x8b2adeb0,0x515095e5
	.word  0x0fc7dd43,0x723720dc,0xfc294950,0xbc53107b
	.word  0xf6bad514,0xea2080ce,0x5eca513e,0x48967899
	.word  0xf86c30d6,0xbade4b75,0x45511106,0x218ae35b
	.word  0xc99de32d,0x4726836a,0x11eb4de8,0x071b0925
	.word  0xdfc6c943,0x7e70f77f,0xcc682016,0x2185dbe0
	.word  0x473b6101,0xcb2c6256,0x7f4ae403,0xb615ec48
	.word  0xc8b2ea88,0xda3706bc,0xfecd93a5,0x6d913c6b
	.word  0xb1ebade2,0xf5d9aade,0xcc59e19d,0xdf9d8a01
	.word  0xd6d21fc0,0x3f929083,0xb1a40d52,0x2cb70898
	.word  0xd2076fdb,0xe768ae7f,0x8691105d,0x5972f3d3
	.word  0x8a0b41d6,0xa2a03217,0x01561e32,0x4b36940f
	.word  0x916022e1,0xdfb0704e,0x9e8b0e24,0x2ccb4a01
	.word  0x35e7ddfa,0xd71e2caa,0x5f0d9762,0x3f6dc570
	.word  0xe4558100,0xca872241,0xecfeae7e,0xcc94e184
	.word  0x7ca103d3,0xe7a5773b,0x6fc6b89b,0x22330e99
	.word  0x6188e84e,0x39f30f4d,0xe9ae15b2,0xacd4ee99
	.word  0x557abe3a,0x051e9daf,0xa59f0751,0x32e9c90e
	.word  0xddc6d480,0xc372b42a,0x50df79a1,0x4a140746
	.word  0x75aef23d,0x320feac3,0xbe3a46ca,0x5bfbc40f
	.word  0x8dda58ad,0xdee74d20,0x43d3100b,0x0a9a4dd1
	.word  0x49be7d25,0xe6fd6ca0,0x1e7b02c0,0x9ad33d80
	.word  0xd0e56a28,0xac459cc3,0xd15da6c3,0xe05d4b4c
	.word  0xd8c7959b,0xcd9a6411,0x84fb1696,0xb0545c1f
	.word  0x5080624b,0xe74fff45,0x246ea0b1,0x8deab9f0
	.word  0x083e9b7f,0xa9e88c32,0xf9280c02,0x9e434501
	.word  0x5e8003ed,0xf461ff12,0x0a7f0604,0xa593c2da
	.word  0xb6a0b189,0x35d2b9e0,0x86be8b8e,0xdf7a86d5
	.word  0xb20d7e34,0x2d1ab9ed,0x885d622b,0x3480790b
	.word  0xfbb8ae39,0xaaa538f3,0x3c97a065,0x4dc7a92c
	.word  0x6afdfaa3,0x3b45f7d4,0x9f3414cc,0x4167245c
	.word  0xf1127b69,0x41204a4f,0xebd5b42b,0xb521f52a
	.word  0x7036fd4f,0x10526ae1,0xad01ab87,0x45334bb8
	.word  0x88cc5c6d,0x43ee2563,0x5331b369,0x0045ad7e
	.word  0x91a6648e,0x574ac57f,0xbecf8e48,0xbb476e94
	.word  0xfc36c64b,0xb547fb0b,0x2b870ba2,0x8d9b2460
	.word  0x90864569,0x19fd288f,0xca29117e,0x4927c57e
	.word  0xd3599ae8,0xf7d1b734,0x685c1fc6,0x0c6d601a
	.word  0x36ab2212,0xfc0449cd,0x0dd32c77,0x586a1b2a
	.word  0x9154ab05,0xd6075bab,0x57d95c7e,0xee294d8d
	.word  0xc7793e6f,0xca3ad2e7,0x1370796c,0x599ee826
	.word  0xb92e031a,0x57bcef2d,0xf083180f,0x46012afd
	.word  0x1e57b44b,0x23b992fa,0x0da5ef33,0x8827fd18
	.word  0x45e38c95,0xab7d5713,0x3f43ffbf,0x56465e94
	.word  0x11fb13bb,0x21b707cf,0xa2160ec8,0x56198561
	.word  0x41197c9e,0x369422d8,0xadd0a469,0xc80702c0
	.word  0x465f964b,0x420347b2,0x53dd4fa9,0x8e2c212c
	.word  0xbf50bfd5,0x990545c0,0x0a624c73,0x604c1644
	.word  0x26233ed3,0xec32da9f,0x661aba51,0xd260e395
	.word  0x7f2cd23c,0x65c4fa43,0x1962bd07,0x3ccabb42
	.word  0xf4969e5a,0x9acfa2be,0x481fa764,0x7440dc45
	.word  0x9e74ddf7,0x6cc7d08c,0x819d6dd2,0x5a259b25
	.word  0xc2c6ca92,0xed7da7c1,0x1c1ac6dc,0x960b2e0f
	.word  0x59696733,0x73c048c6,0xda34cabe,0xed66dcaf
	.word  0xef1c32cf,0x499addb5,0xa6903a1d,0x905a923b
	.word  0xeb6b39b8,0x97d109f5,0x05343f95,0x51c7d33d
	.word  0x7619dc45,0xbd15985b,0xf64f84d9,0x3443f9b6
	.word  0xa522c68a,0x99899493,0xd98a21d8,0xb96e6912
	.word  0x0fd1e31c,0x125bf2f1,0x940efacc,0xfb346c6c
	.word  0xdec78a24,0xe60455f1,0x24ac2541,0x39610fcf
	.word  0x78ab83ff,0xb8196a9a,0x2462bbe6,0xb4b83b8d
	.word  0xe7b50856,0xcc5597b7,0x06b5f8c4,0xca82f372
	.word  0x7c4000b5,0x4b9441f2,0xb2b57565,0x26730ca5
	.word  0x7f5f0211,0x84544ee5,0x29ef7625,0xf07e12e5
	.word  0xad922fdc,0x9e6ae225,0x555977fb,0x75e8ea43
	.word  0xd914d39e,0xf8260a43,0x38a5c2a9,0xa039ee57
	.word  0xb9a858e2,0xeb186e4f,0xeddc01b9,0x2a05d780
	.word  0x9b264b86,0x6b61c578,0xc468409a,0x3c18e3bc
	.word  0xe1cd849a,0x105ea7af,0x551bf657,0x7c88cc86

!!# /************************************************************
!!# *
!!# * File:         stb_raw_1.j
!!# *
!!# * Description:  
!!# *
!!# * Test cases for stb raws with different lops in following 
!!# * stages
!!# *
!!# **************************************************************/
!!# 
!!# --c_declarations
!!# 
!!#   int i;
!!#   int pref_cnt = 0;
!!#   int is_prefetch = 0;
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
!!#   IJ_set_ropr_fld (ijdefault, Ft_Rd, "{1..7, 11..31}"); 
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
!!# --finish
!!# ;
!!# 
!!# --diag_ini
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
!!#             ;
!!# 
!!# inst_type: store_r load_r lop
!!# {
!!#    IJ_generate_va ("th", $1, $2, $3, NULL);
!!# }
!!# ;
!!# 
!!# lop: mul | div | fpop | load | asi_load | asi_st | br | membar | atomic	| prefetch
!!# ;
!!# 
!!# store_r: tSTB_R | tSTH_R | tSTW_R | tSTX_R | tSTF_R | tSTDF_R
!!# ;
!!# 
!!# load_r: tLDSB_R | tLDSH_R | tLDSW_R | tLDUB_R | tLDUH_R | tLDUW_R | tLDX_R | tLDF_R | tLDDF_R
!!# ;
!!# 
!!# fpop:st_fp | arith_fp
!!# ;
!!# 
!!# mul: tMULX_R | tMULX_I | tUMUL_R | tUMUL_I | tSMUL_R | tSMUL_I | tUMULcc_R | tUMULcc_I | tSMULcc_R | tSMULcc_I | tMULScc_R | tMULScc_I
!!# ;
!!# 
!!# div: tUDIV_I | tUDIV_R | tSDIV_I | tSDIV_R | tSDIVX_R | tSDIVX_I | tUDIVX_R | tUDIVX_I | tUDIVcc_I | tUDIVcc_R | tSDIVcc_I | tSDIVcc_R
!!# ;
!!# 
!!# load: tLDSB_R | tLDSB_I | tLDSH_R | tLDSH_I | tLDSW_R | tLDSW_I | tLDUB_R | tLDUB_I | tLDUH_R | tLDUH_I | tLDUW_R | tLDUW_I | tLDX_R | tLDX_I | tLDD_I | tLDF_I | tLDF_R | tLDDF_I | tLDDF_R
!!# ;
!!# 
!!# asi_load: tLDSBA_R | tLDSBA_I | tLDSHA_R | tLDSHA_I | tLDSWA_R | tLDSWA_I | tLDUBA_R | tLDUBA_I | tLDUHA_R | tLDUHA_I | tLDUWA_R | tLDUWA_I | tLDXA_R | tLDXA_I | tLDDA_I 
!!# ;
!!# 
!!# asi_st: tSTBA_R | tSTBA_I | tSTHA_R | tSTHA_I | tSTWA_R | tSTWA_I | tSTXA_R | tSTXA_I | tSTDA_R | tSTDA_I 
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
!!# atomic: tCASA_R | tCASA_I | tCASXA_R | tCASXA_I | tLDSTUBA_I | tLDSTUB_I | tLDSTUB_R | tLDSTUBA_R | tSWAP_I | tSWAP_R | tSWAPA_I | tSWAPA_R
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
!! Token Generation Statistics
!! ---------------------------------
!! 
!! Rule   1 (line  115), Count:  4000  inst_block           -> inst_type 
!! Rule   2 (line  116), Count:  4000  inst_block           -> inst_block inst_type 
!! Rule   3 (line  119), Count:  4000  inst_type            -> store_r load_r lop 
!! Rule   4 (line  125), Count:   148  lop                  -> mul 
!! Rule   5 (line  125), Count:   104  lop                  -> div 
!! Rule   6 (line  125), Count:   144  lop                  -> fpop 
!! Rule   7 (line  125), Count:   126  lop                  -> load 
!! Rule   8 (line  125), Count:   119  lop                  -> asi_load 
!! Rule   9 (line  125), Count:   141  lop                  -> asi_st 
!! Rule  10 (line  125), Count:   139  lop                  -> br 
!! Rule  11 (line  125), Count:   119  lop                  -> membar 
!! Rule  12 (line  125), Count:   144  lop                  -> atomic 
!! Rule  13 (line  125), Count:   139  lop                  -> prefetch 
!! Rule  14 (line  128), Count:   237  store_r              -> tSTB_R 
!! Rule  15 (line  128), Count:   237  store_r              -> tSTH_R 
!! Rule  16 (line  128), Count:   212  store_r              -> tSTW_R 
!! Rule  17 (line  128), Count:   214  store_r              -> tSTX_R 
!! Rule  18 (line  128), Count:   220  store_r              -> tSTF_R 
!! Rule  19 (line  128), Count:   208  store_r              -> tSTDF_R 
!! Rule  20 (line  131), Count:   157  load_r               -> tLDSB_R 
!! Rule  21 (line  131), Count:   139  load_r               -> tLDSH_R 
!! Rule  22 (line  131), Count:   147  load_r               -> tLDSW_R 
!! Rule  23 (line  131), Count:   142  load_r               -> tLDUB_R 
!! Rule  24 (line  131), Count:   147  load_r               -> tLDUH_R 
!! Rule  25 (line  131), Count:   138  load_r               -> tLDUW_R 
!! Rule  26 (line  131), Count:   157  load_r               -> tLDX_R 
!! Rule  27 (line  131), Count:   141  load_r               -> tLDF_R 
!! Rule  28 (line  131), Count:   157  load_r               -> tLDDF_R 
!! Rule  29 (line  134), Count:    69  fpop                 -> st_fp 
!! Rule  30 (line  134), Count:    74  fpop                 -> arith_fp 
!! Rule  31 (line  137), Count:     9  mul                  -> tMULX_R 
!! Rule  32 (line  137), Count:    10  mul                  -> tMULX_I 
!! Rule  33 (line  137), Count:    12  mul                  -> tUMUL_R 
!! Rule  34 (line  137), Count:    16  mul                  -> tUMUL_I 
!! Rule  35 (line  137), Count:     4  mul                  -> tSMUL_R 
!! Rule  36 (line  137), Count:    10  mul                  -> tSMUL_I 
!! Rule  37 (line  137), Count:    14  mul                  -> tUMULcc_R 
!! Rule  38 (line  137), Count:     7  mul                  -> tUMULcc_I 
!! Rule  39 (line  137), Count:    14  mul                  -> tSMULcc_R 
!! Rule  40 (line  137), Count:    12  mul                  -> tSMULcc_I 
!! Rule  41 (line  137), Count:    12  mul                  -> tMULScc_R 
!! Rule  42 (line  137), Count:    17  mul                  -> tMULScc_I 
!! Rule  43 (line  140), Count:     5  div                  -> tUDIV_I 
!! Rule  44 (line  140), Count:    13  div                  -> tUDIV_R 
!! Rule  45 (line  140), Count:    11  div                  -> tSDIV_I 
!! Rule  46 (line  140), Count:    15  div                  -> tSDIV_R 
!! Rule  47 (line  140), Count:     6  div                  -> tSDIVX_R 
!! Rule  48 (line  140), Count:     5  div                  -> tSDIVX_I 
!! Rule  49 (line  140), Count:     3  div                  -> tUDIVX_R 
!! Rule  50 (line  140), Count:     5  div                  -> tUDIVX_I 
!! Rule  51 (line  140), Count:     5  div                  -> tUDIVcc_I 
!! Rule  52 (line  140), Count:     9  div                  -> tUDIVcc_R 
!! Rule  53 (line  140), Count:     5  div                  -> tSDIVcc_I 
!! Rule  54 (line  140), Count:    11  div                  -> tSDIVcc_R 
!! Rule  55 (line  143), Count:     5  load                 -> tLDSB_R 
!! Rule  56 (line  143), Count:     4  load                 -> tLDSB_I 
!! Rule  57 (line  143), Count:    11  load                 -> tLDSH_R 
!! Rule  58 (line  143), Count:     4  load                 -> tLDSH_I 
!! Rule  59 (line  143), Count:     9  load                 -> tLDSW_R 
!! Rule  60 (line  143), Count:     7  load                 -> tLDSW_I 
!! Rule  61 (line  143), Count:     4  load                 -> tLDUB_R 
!! Rule  62 (line  143), Count:     7  load                 -> tLDUB_I 
!! Rule  63 (line  143), Count:     3  load                 -> tLDUH_R 
!! Rule  64 (line  143), Count:     5  load                 -> tLDUH_I 
!! Rule  65 (line  143), Count:     8  load                 -> tLDUW_R 
!! Rule  66 (line  143), Count:    10  load                 -> tLDUW_I 
!! Rule  67 (line  143), Count:     2  load                 -> tLDX_R 
!! Rule  68 (line  143), Count:     7  load                 -> tLDX_I 
!! Rule  69 (line  143), Count:     5  load                 -> tLDD_I 
!! Rule  70 (line  143), Count:     6  load                 -> tLDF_I 
!! Rule  71 (line  143), Count:     1  load                 -> tLDF_R 
!! Rule  72 (line  143), Count:     4  load                 -> tLDDF_I 
!! Rule  73 (line  143), Count:     6  load                 -> tLDDF_R 
!! Rule  74 (line  146), Count:     8  asi_load             -> tLDSBA_R 
!! Rule  75 (line  146), Count:     4  asi_load             -> tLDSBA_I 
!! Rule  76 (line  146), Count:     5  asi_load             -> tLDSHA_R 
!! Rule  77 (line  146), Count:     8  asi_load             -> tLDSHA_I 
!! Rule  78 (line  146), Count:     5  asi_load             -> tLDSWA_R 
!! Rule  79 (line  146), Count:     5  asi_load             -> tLDSWA_I 
!! Rule  80 (line  146), Count:     9  asi_load             -> tLDUBA_R 
!! Rule  81 (line  146), Count:     7  asi_load             -> tLDUBA_I 
!! Rule  82 (line  146), Count:     4  asi_load             -> tLDUHA_R 
!! Rule  83 (line  146), Count:     7  asi_load             -> tLDUHA_I 
!! Rule  84 (line  146), Count:     7  asi_load             -> tLDUWA_R 
!! Rule  85 (line  146), Count:    11  asi_load             -> tLDUWA_I 
!! Rule  86 (line  146), Count:    11  asi_load             -> tLDXA_R 
!! Rule  87 (line  146), Count:     9  asi_load             -> tLDXA_I 
!! Rule  88 (line  146), Count:     5  asi_load             -> tLDDA_I 
!! Rule  89 (line  149), Count:     9  asi_st               -> tSTBA_R 
!! Rule  90 (line  149), Count:    15  asi_st               -> tSTBA_I 
!! Rule  91 (line  149), Count:     8  asi_st               -> tSTHA_R 
!! Rule  92 (line  149), Count:    16  asi_st               -> tSTHA_I 
!! Rule  93 (line  149), Count:    10  asi_st               -> tSTWA_R 
!! Rule  94 (line  149), Count:    18  asi_st               -> tSTWA_I 
!! Rule  95 (line  149), Count:    16  asi_st               -> tSTXA_R 
!! Rule  96 (line  149), Count:     9  asi_st               -> tSTXA_I 
!! Rule  97 (line  149), Count:    13  asi_st               -> tSTDA_R 
!! Rule  98 (line  149), Count:    18  asi_st               -> tSTDA_I 
!! Rule  99 (line  152), Count:     0  br                   -> tBA 
!! Rule 100 (line  152), Count:     5  br                   -> tBN 
!! Rule 101 (line  152), Count:     3  br                   -> tBNE 
!! Rule 102 (line  152), Count:     5  br                   -> tBE 
!! Rule 103 (line  152), Count:     1  br                   -> tBG 
!! Rule 104 (line  152), Count:     6  br                   -> tBLE 
!! Rule 105 (line  152), Count:     8  br                   -> tBGE 
!! Rule 106 (line  152), Count:     6  br                   -> tBL 
!! Rule 107 (line  152), Count:     3  br                   -> tBGU 
!! Rule 108 (line  152), Count:     6  br                   -> tBLEU 
!! Rule 109 (line  153), Count:     5  br                   -> tBCC 
!! Rule 110 (line  153), Count:     8  br                   -> tBCS 
!! Rule 111 (line  153), Count:     7  br                   -> tBPOS 
!! Rule 112 (line  153), Count:     8  br                   -> tBNEG 
!! Rule 113 (line  153), Count:     6  br                   -> tBVC 
!! Rule 114 (line  153), Count:     6  br                   -> tBVS 
!! Rule 115 (line  153), Count:     6  br                   -> tBRZ 
!! Rule 116 (line  153), Count:     7  br                   -> tBRLEZ 
!! Rule 117 (line  154), Count:     7  br                   -> tBRLZ 
!! Rule 118 (line  154), Count:     3  br                   -> tBRNZ 
!! Rule 119 (line  154), Count:     4  br                   -> tBRGZ 
!! Rule 120 (line  154), Count:     3  br                   -> tBRGEZ 
!! Rule 121 (line  154), Count:     4  br                   -> tCALL 
!! Rule 122 (line  157), Count:    56  membar               -> tMEMBAR 
!! Rule 123 (line  157), Count:    62  membar               -> tSTBAR 
!! Rule 124 (line  160), Count:    18  atomic               -> tCASA_R 
!! Rule 125 (line  160), Count:    11  atomic               -> tCASA_I 
!! Rule 126 (line  160), Count:    14  atomic               -> tCASXA_R 
!! Rule 127 (line  160), Count:    10  atomic               -> tCASXA_I 
!! Rule 128 (line  160), Count:    11  atomic               -> tLDSTUBA_I 
!! Rule 129 (line  160), Count:    13  atomic               -> tLDSTUB_I 
!! Rule 130 (line  160), Count:    13  atomic               -> tLDSTUB_R 
!! Rule 131 (line  160), Count:    11  atomic               -> tLDSTUBA_R 
!! Rule 132 (line  160), Count:    11  atomic               -> tSWAP_I 
!! Rule 133 (line  160), Count:     7  atomic               -> tSWAP_R 
!! Rule 134 (line  160), Count:     7  atomic               -> tSWAPA_I 
!! Rule 135 (line  160), Count:     7  atomic               -> tSWAPA_R 
!! Rule 136 (line  163), Count:    12  st_fp                -> tSTF_R 
!! Rule 137 (line  163), Count:    23  st_fp                -> tSTF_I 
!! Rule 138 (line  163), Count:    16  st_fp                -> tSTDF_I 
!! Rule 139 (line  163), Count:    15  st_fp                -> tSTDF_R 
!! Rule 140 (line  166), Count:    20  arith_fp             -> tFADDs 
!! Rule 141 (line  166), Count:     8  arith_fp             -> tFSUBs 
!! Rule 142 (line  166), Count:    19  arith_fp             -> tFMULs 
!! Rule 143 (line  166), Count:    24  arith_fp             -> tFDIVs 
!! Rule 144 (line  169), Count:    35  prefetch             -> tPREFETCH_I 
!! Rule 145 (line  169), Count:    21  prefetch             -> tPREFETCH_R 
!! Rule 146 (line  169), Count:    34  prefetch             -> tPREFETCHA_I 
!! 
!!   257: Token tSTB_R	Count = 238
!!   258: Token tSTH_R	Count = 238
!!   259: Token tSTW_R	Count = 213
!!   260: Token tSTX_R	Count = 215
!!   261: Token tSTF_R	Count = 234
!!   262: Token tSTDF_R	Count = 225
!!   263: Token tLDSB_R	Count = 164
!!   264: Token tLDSH_R	Count = 152
!!   265: Token tLDSW_R	Count = 158
!!   266: Token tLDUB_R	Count = 148
!!   267: Token tLDUH_R	Count = 152
!!   268: Token tLDUW_R	Count = 148
!!   269: Token tLDX_R	Count = 161
!!   270: Token tLDF_R	Count = 144
!!   271: Token tLDDF_R	Count = 165
!!   272: Token tMULX_R	Count = 10
!!   273: Token tMULX_I	Count = 11
!!   274: Token tUMUL_R	Count = 13
!!   275: Token tUMUL_I	Count = 17
!!   276: Token tSMUL_R	Count = 5
!!   277: Token tSMUL_I	Count = 11
!!   278: Token tUMULcc_R	Count = 15
!!   279: Token tUMULcc_I	Count = 8
!!   280: Token tSMULcc_R	Count = 15
!!   281: Token tSMULcc_I	Count = 13
!!   282: Token tMULScc_R	Count = 13
!!   283: Token tMULScc_I	Count = 18
!!   284: Token tUDIV_I	Count = 6
!!   285: Token tUDIV_R	Count = 14
!!   286: Token tSDIV_I	Count = 12
!!   287: Token tSDIV_R	Count = 16
!!   288: Token tSDIVX_R	Count = 7
!!   289: Token tSDIVX_I	Count = 6
!!   290: Token tUDIVX_R	Count = 4
!!   291: Token tUDIVX_I	Count = 6
!!   292: Token tUDIVcc_I	Count = 6
!!   293: Token tUDIVcc_R	Count = 10
!!   294: Token tSDIVcc_I	Count = 6
!!   295: Token tSDIVcc_R	Count = 12
!!   296: Token tLDSB_I	Count = 5
!!   297: Token tLDSH_I	Count = 5
!!   298: Token tLDSW_I	Count = 8
!!   299: Token tLDUB_I	Count = 8
!!   300: Token tLDUH_I	Count = 6
!!   301: Token tLDUW_I	Count = 11
!!   302: Token tLDX_I	Count = 8
!!   303: Token tLDD_I	Count = 6
!!   304: Token tLDF_I	Count = 7
!!   305: Token tLDDF_I	Count = 5
!!   306: Token tLDSBA_R	Count = 9
!!   307: Token tLDSBA_I	Count = 5
!!   308: Token tLDSHA_R	Count = 6
!!   309: Token tLDSHA_I	Count = 9
!!   310: Token tLDSWA_R	Count = 6
!!   311: Token tLDSWA_I	Count = 6
!!   312: Token tLDUBA_R	Count = 10
!!   313: Token tLDUBA_I	Count = 8
!!   314: Token tLDUHA_R	Count = 5
!!   315: Token tLDUHA_I	Count = 8
!!   316: Token tLDUWA_R	Count = 8
!!   317: Token tLDUWA_I	Count = 12
!!   318: Token tLDXA_R	Count = 12
!!   319: Token tLDXA_I	Count = 10
!!   320: Token tLDDA_I	Count = 6
!!   321: Token tSTBA_R	Count = 10
!!   322: Token tSTBA_I	Count = 16
!!   323: Token tSTHA_R	Count = 9
!!   324: Token tSTHA_I	Count = 17
!!   325: Token tSTWA_R	Count = 11
!!   326: Token tSTWA_I	Count = 19
!!   327: Token tSTXA_R	Count = 17
!!   328: Token tSTXA_I	Count = 10
!!   329: Token tSTDA_R	Count = 14
!!   330: Token tSTDA_I	Count = 19
!!   331: Token tBA	Count = 1
!!   332: Token tBN	Count = 6
!!   333: Token tBNE	Count = 4
!!   334: Token tBE	Count = 6
!!   335: Token tBG	Count = 2
!!   336: Token tBLE	Count = 7
!!   337: Token tBGE	Count = 9
!!   338: Token tBL	Count = 7
!!   339: Token tBGU	Count = 4
!!   340: Token tBLEU	Count = 7
!!   341: Token tBCC	Count = 6
!!   342: Token tBCS	Count = 9
!!   343: Token tBPOS	Count = 8
!!   344: Token tBNEG	Count = 9
!!   345: Token tBVC	Count = 7
!!   346: Token tBVS	Count = 7
!!   347: Token tBRZ	Count = 7
!!   348: Token tBRLEZ	Count = 8
!!   349: Token tBRLZ	Count = 8
!!   350: Token tBRNZ	Count = 4
!!   351: Token tBRGZ	Count = 5
!!   352: Token tBRGEZ	Count = 4
!!   353: Token tCALL	Count = 5
!!   354: Token tMEMBAR	Count = 57
!!   355: Token tSTBAR	Count = 63
!!   356: Token tCASA_R	Count = 19
!!   357: Token tCASA_I	Count = 12
!!   358: Token tCASXA_R	Count = 15
!!   359: Token tCASXA_I	Count = 11
!!   360: Token tLDSTUBA_I	Count = 12
!!   361: Token tLDSTUB_I	Count = 14
!!   362: Token tLDSTUB_R	Count = 14
!!   363: Token tLDSTUBA_R	Count = 12
!!   364: Token tSWAP_I	Count = 12
!!   365: Token tSWAP_R	Count = 8
!!   366: Token tSWAPA_I	Count = 8
!!   367: Token tSWAPA_R	Count = 8
!!   368: Token tSTF_I	Count = 24
!!   369: Token tSTDF_I	Count = 17
!!   370: Token tFADDs	Count = 21
!!   371: Token tFSUBs	Count = 9
!!   372: Token tFMULs	Count = 20
!!   373: Token tFDIVs	Count = 25
!!   374: Token tPREFETCH_I	Count = 36
!!   375: Token tPREFETCH_R	Count = 22
!!   376: Token tPREFETCHA_I	Count = 35
!!   377: Token tPREFETCHA_R	Count = 47
!! 
!! 
!! +++ finish +++

