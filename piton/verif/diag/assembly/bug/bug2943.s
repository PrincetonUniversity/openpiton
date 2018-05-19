// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: bug2943.s
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
   random seed:	752990722
   Jal stb_raw_1.j:	
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
        setx  0x0000000000000e90, %g1, %r9
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
        setx  0xa3ebdb60d41597dc, %g1, %r0
        setx  0xc124f87d11c01650, %g1, %r1
        setx  0x8e0bf84ffe38a44a, %g1, %r2
        setx  0x18c081b1f6696e5c, %g1, %r3
        setx  0xf0644f6ebb9d718a, %g1, %r4
        setx  0x872e01c5958d49dd, %g1, %r5
        setx  0x051d0cb99882d72c, %g1, %r6
        setx  0x005dd6f810e18ce1, %g1, %r7
        setx  0xefd78acd5517ad67, %g1, %r10
        setx  0x3cb076207951adc9, %g1, %r11
        setx  0x17b922ff5eb9b6d1, %g1, %r12
        setx  0x70d307ea19a96cfd, %g1, %r13
        setx  0x1b4cd3bdd3304710, %g1, %r14
        setx  0x03ae3734e52377ef, %g1, %r15
        setx  0x71f11ddeb1f55ea7, %g1, %r16
        setx  0x7be27d94cb4418e4, %g1, %r17
        setx  0x46fdcd16c2a5e064, %g1, %r18
        setx  0xf6116b7a3ee283e8, %g1, %r19
        setx  0xd006665ab5e3b5b8, %g1, %r20
        setx  0x189baaeed7625ee9, %g1, %r21
        setx  0x45609c708d41b7ed, %g1, %r22
        setx  0x779aae64f72241b4, %g1, %r23
        setx  0xd9581a7a0c6b6c0f, %g1, %r24
        setx  0x5db9dcf4b5417028, %g1, %r25
        setx  0x34df23b4cfbe694a, %g1, %r26
        setx  0x9265cc517032488f, %g1, %r27
        setx  0xd0319b4267f2a22a, %g1, %r28
        setx  0xbf68fd926133733e, %g1, %r29
        setx  0xbf1ee33213002f8c, %g1, %r30
        setx  0xe6f34474d97a25f7, %g1, %r31
	.word 0xfa2a0009  ! 3: STB_R	stb	%r29, [%r8 + %r9]
	.word 0xc41a0009  ! 3: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x8ba20829  ! 3: FADDs	fadds	%f8, %f9, %f5
	.word 0xc4720009  ! 6: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xe41a0009  ! 6: LDD_R	ldd	[%r8 + %r9], %r18
	.word 0x18800001  ! 6: BGU	bgu  	<label_0x1>
	.word 0xc22a0009  ! 9: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc2020009  ! 9: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0x8143e06d  ! 9: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #MemIssue | #Sync 
	.word 0xc8720009  ! 12: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xe0120009  ! 12: LDUH_R	lduh	[%r8 + %r9], %r16
	.word 0xc36a0009  ! 12: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xce720009  ! 15: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc7020009  ! 15: LDF_R	ld	[%r8, %r9], %f3
	.word 0xc3ea2cfc  ! 15: PREFETCHA_I	prefetcha	[%r8, + 0x0cfc] %asi, #one_read
	.word 0xc6320009  ! 18: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc5020009  ! 18: LDF_R	ld	[%r8, %r9], %f2
	.word 0xa0fa2510  ! 18: SDIVcc_I	sdivcc 	%r8, 0x0510, %r16
	.word 0xcf220009  ! 21: STF_R	st	%f7, [%r9, %r8]
	.word 0xc91a0009  ! 21: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xcbf22009  ! 21: CASXA_R	casxa	[%r8]%asi, %r9, %r5
	.word 0xde320009  ! 24: STH_R	sth	%r15, [%r8 + %r9]
	.word 0xc81a0009  ! 24: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xe13a0009  ! 24: STDF_R	std	%f16, [%r9, %r8]
	.word 0xf93a0009  ! 27: STDF_R	std	%f28, [%r9, %r8]
	.word 0xc4420009  ! 27: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xccea23a8  ! 27: LDSTUBA_I	ldstuba	%r6, [%r8 + 0x03a8] %asi
	.word 0xc4220009  ! 30: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xf2420009  ! 30: LDSW_R	ldsw	[%r8 + %r9], %r25
	.word 0x0cc20001  ! 30: BRGZ	brgz  ,nt	%8,<label_0x20001>
	.word 0xdc220009  ! 33: STW_R	stw	%r14, [%r8 + %r9]
	.word 0xc4120009  ! 33: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xc2b22058  ! 33: STHA_I	stha	%r1, [%r8 + 0x0058] %asi
	.word 0xc5220009  ! 36: STF_R	st	%f2, [%r9, %r8]
	.word 0xc84a0009  ! 36: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xc3ea1009  ! 36: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc6720009  ! 39: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc7020009  ! 39: LDF_R	ld	[%r8, %r9], %f3
	.word 0x8143c000  ! 39: STBAR	stbar
	.word 0xc2720009  ! 42: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xf45a0009  ! 42: LDX_R	ldx	[%r8 + %r9], %r26
	.word 0xa7a208a9  ! 42: FSUBs	fsubs	%f8, %f9, %f19
	.word 0xe82a0009  ! 45: STB_R	stb	%r20, [%r8 + %r9]
	.word 0xc25a0009  ! 45: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xc6d21009  ! 45: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r3
	.word 0xcd220009  ! 48: STF_R	st	%f6, [%r9, %r8]
	.word 0xc4020009  ! 48: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xc4ba1009  ! 48: STDA_R	stda	%r2, [%r8 + %r9] 0x80
	.word 0xcc720009  ! 51: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xfd020009  ! 51: LDF_R	ld	[%r8, %r9], %f30
	.word 0xccda2600  ! 51: LDXA_I	ldxa	[%r8, + 0x0600] %asi, %r6
	.word 0xd62a0009  ! 54: STB_R	stb	%r11, [%r8 + %r9]
	.word 0xcc420009  ! 54: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xcea21009  ! 54: STWA_R	stwa	%r7, [%r8 + %r9] 0x80
	.word 0xfe720009  ! 57: STX_R	stx	%r31, [%r8 + %r9]
	.word 0xc85a0009  ! 57: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xcd220009  ! 57: STF_R	st	%f6, [%r9, %r8]
	.word 0xf8220009  ! 60: STW_R	stw	%r28, [%r8 + %r9]
	.word 0xc60a0009  ! 60: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xc2b21009  ! 60: STHA_R	stha	%r1, [%r8 + %r9] 0x80
	.word 0xe2320009  ! 63: STH_R	sth	%r17, [%r8 + %r9]
	.word 0xcb1a0009  ! 63: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xc33a0009  ! 63: STDF_R	std	%f1, [%r9, %r8]
	.word 0xcb220009  ! 66: STF_R	st	%f5, [%r9, %r8]
	.word 0xc6020009  ! 66: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xc4fa2cc0  ! 66: SWAPA_I	swapa	%r2, [%r8 + 0x0cc0] %asi
	.word 0xc93a0009  ! 69: STDF_R	std	%f4, [%r9, %r8]
	.word 0xfc420009  ! 69: LDSW_R	ldsw	[%r8 + %r9], %r30
	.word 0x8143c000  ! 69: STBAR	stbar
	.word 0xcc320009  ! 72: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xe00a0009  ! 72: LDUB_R	ldub	[%r8 + %r9], %r16
	.word 0xc3ea2948  ! 72: PREFETCHA_I	prefetcha	[%r8, + 0x0948] %asi, #one_read
	.word 0xca720009  ! 75: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc4120009  ! 75: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xca7a0009  ! 75: SWAP_R	swap	%r5, [%r8 + %r9]
	.word 0xcd220009  ! 78: STF_R	st	%f6, [%r9, %r8]
	.word 0xee0a0009  ! 78: LDUB_R	ldub	[%r8 + %r9], %r23
	.word 0xc36a0009  ! 78: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc22a0009  ! 81: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xd9020009  ! 81: LDF_R	ld	[%r8, %r9], %f12
	.word 0xc36a2224  ! 81: PREFETCH_I	prefetch	[%r8 + 0x0224], #one_read
	.word 0xe6720009  ! 84: STX_R	stx	%r19, [%r8 + %r9]
	.word 0xc4520009  ! 84: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0x8143e009  ! 84: MEMBAR	membar	#LoadLoad | #StoreStore 
	.word 0xcb3a0009  ! 87: STDF_R	std	%f5, [%r9, %r8]
	.word 0xe8020009  ! 87: LDUW_R	lduw	[%r8 + %r9], %r20
	.word 0xc72223d8  ! 87: STF_I	st	%f3, [0x03d8, %r8]
	.word 0xc8220009  ! 90: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xd7020009  ! 90: LDF_R	ld	[%r8, %r9], %f11
	.word 0xccba1009  ! 90: STDA_R	stda	%r6, [%r8 + %r9] 0x80
	.word 0xcf220009  ! 93: STF_R	st	%f7, [%r9, %r8]
	.word 0xf0020009  ! 93: LDUW_R	lduw	[%r8 + %r9], %r24
	.word 0xdef22b68  ! 93: STXA_I	stxa	%r15, [%r8 + 0x0b68] %asi
	.word 0xe4720009  ! 96: STX_R	stx	%r18, [%r8 + %r9]
	.word 0xca420009  ! 96: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0x867a203c  ! 96: SDIV_I	sdiv 	%r8, 0x003c, %r3
	.word 0xc8720009  ! 99: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xe65a0009  ! 99: LDX_R	ldx	[%r8 + %r9], %r19
	.word 0x0cca0001  ! 99: BRGZ	brgz  ,pt	%8,<label_0xa0001>
	.word 0xe8220009  ! 102: STW_R	stw	%r20, [%r8 + %r9]
	.word 0xc81a0009  ! 102: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xa6fa0009  ! 102: SDIVcc_R	sdivcc 	%r8, %r9, %r19
	.word 0xca720009  ! 105: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc41a0009  ! 105: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xcdf21009  ! 105: CASXA_I	casxa	[%r8] 0x80, %r9, %r6
	.word 0xdc720009  ! 108: STX_R	stx	%r14, [%r8 + %r9]
	.word 0xc64a0009  ! 108: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xdec21009  ! 108: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r15
	.word 0xec720009  ! 111: STX_R	stx	%r22, [%r8 + %r9]
	.word 0xc81a0009  ! 111: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xccda1009  ! 111: LDXA_R	ldxa	[%r8, %r9] 0x80, %r6
	.word 0xfd220009  ! 114: STF_R	st	%f30, [%r9, %r8]
	.word 0xcc520009  ! 114: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0x8da20929  ! 114: FMULs	fmuls	%f8, %f9, %f6
	.word 0xed220009  ! 117: STF_R	st	%f22, [%r9, %r8]
	.word 0xc41a0009  ! 117: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x82fa26a4  ! 117: SDIVcc_I	sdivcc 	%r8, 0x06a4, %r1
	.word 0xe4220009  ! 120: STW_R	stw	%r18, [%r8 + %r9]
	.word 0xcd020009  ! 120: LDF_R	ld	[%r8, %r9], %f6
	.word 0xfaa21009  ! 120: STWA_R	stwa	%r29, [%r8 + %r9] 0x80
	.word 0xc4220009  ! 123: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xcf1a0009  ! 123: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xc3ea1009  ! 123: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xfc220009  ! 126: STW_R	stw	%r30, [%r8 + %r9]
	.word 0xce5a0009  ! 126: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xfeea1009  ! 126: LDSTUBA_R	ldstuba	%r31, [%r8 + %r9] 0x80
	.word 0xc6220009  ! 129: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xf81a0009  ! 129: LDD_R	ldd	[%r8 + %r9], %r28
	.word 0xcaa22640  ! 129: STWA_I	stwa	%r5, [%r8 + 0x0640] %asi
	.word 0xce220009  ! 132: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc85a0009  ! 132: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0x8b220009  ! 132: MULScc_R	mulscc 	%r8, %r9, %r5
	.word 0xc93a0009  ! 135: STDF_R	std	%f4, [%r9, %r8]
	.word 0xea120009  ! 135: LDUH_R	lduh	[%r8 + %r9], %r21
	.word 0xd71a0009  ! 135: LDDF_R	ldd	[%r8, %r9], %f11
	.word 0xe5220009  ! 138: STF_R	st	%f18, [%r9, %r8]
	.word 0xe2520009  ! 138: LDSH_R	ldsh	[%r8 + %r9], %r17
	.word 0xcc9a2100  ! 138: LDDA_I	ldda	[%r8, + 0x0100] %asi, %r6
	.word 0xca2a0009  ! 141: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xd6520009  ! 141: LDSH_R	ldsh	[%r8 + %r9], %r11
	.word 0xc2da1009  ! 141: LDXA_R	ldxa	[%r8, %r9] 0x80, %r1
	.word 0xcb220009  ! 144: STF_R	st	%f5, [%r9, %r8]
	.word 0xee520009  ! 144: LDSH_R	ldsh	[%r8 + %r9], %r23
	.word 0xeed21009  ! 144: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r23
	.word 0xca720009  ! 147: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc7020009  ! 147: LDF_R	ld	[%r8, %r9], %f3
	.word 0x8c722920  ! 147: UDIV_I	udiv 	%r8, 0x0920, %r6
	.word 0xde220009  ! 150: STW_R	stw	%r15, [%r8 + %r9]
	.word 0xc71a0009  ! 150: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xf67a2b38  ! 150: SWAP_I	swap	%r27, [%r8 + 0x0b38]
	.word 0xce720009  ! 153: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc25a0009  ! 153: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xc3ea23f4  ! 153: PREFETCHA_I	prefetcha	[%r8, + 0x03f4] %asi, #one_read
	.word 0xe7220009  ! 156: STF_R	st	%f19, [%r9, %r8]
	.word 0xe4520009  ! 156: LDSH_R	ldsh	[%r8 + %r9], %r18
	.word 0x0c800001  ! 156: BNEG	bneg  	<label_0x1>
	.word 0xc42a0009  ! 159: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xca4a0009  ! 159: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0x8143e06a  ! 159: MEMBAR	membar	#StoreLoad | #StoreStore | #MemIssue | #Sync 
	.word 0xc4220009  ! 162: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xf80a0009  ! 162: LDUB_R	ldub	[%r8 + %r9], %r28
	.word 0x0aca0001  ! 162: BRNZ	brnz  ,pt	%8,<label_0xa0001>
	.word 0xe33a0009  ! 165: STDF_R	std	%f17, [%r9, %r8]
	.word 0xc4420009  ! 165: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xb1a208a9  ! 165: FSUBs	fsubs	%f8, %f9, %f24
	.word 0xce2a0009  ! 168: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc71a0009  ! 168: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0x82d20009  ! 168: UMULcc_R	umulcc 	%r8, %r9, %r1
	.word 0xc6220009  ! 171: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc8020009  ! 171: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xc89a26c0  ! 171: LDDA_I	ldda	[%r8, + 0x06c0] %asi, %r4
	.word 0xcc220009  ! 174: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xdb020009  ! 174: LDF_R	ld	[%r8, %r9], %f13
	.word 0x8cf225ac  ! 174: UDIVcc_I	udivcc 	%r8, 0x05ac, %r6
	.word 0xfb220009  ! 177: STF_R	st	%f29, [%r9, %r8]
	.word 0xf9020009  ! 177: LDF_R	ld	[%r8, %r9], %f28
	.word 0xf60a2e80  ! 177: LDUB_I	ldub	[%r8 + 0x0e80], %r27
	.word 0xce720009  ! 180: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xda020009  ! 180: LDUW_R	lduw	[%r8 + %r9], %r13
	.word 0x8c5a0009  ! 180: SMUL_R	smul 	%r8, %r9, %r6
	.word 0xc82a0009  ! 183: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xf31a0009  ! 183: LDDF_R	ldd	[%r8, %r9], %f25
	.word 0x96d20009  ! 183: UMULcc_R	umulcc 	%r8, %r9, %r11
	.word 0xc62a0009  ! 186: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xde0a0009  ! 186: LDUB_R	ldub	[%r8 + %r9], %r15
	.word 0xca0a0009  ! 186: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xde720009  ! 189: STX_R	stx	%r15, [%r8 + %r9]
	.word 0xc65a0009  ! 189: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xce4a21f0  ! 189: LDSB_I	ldsb	[%r8 + 0x01f0], %r7
	.word 0xc8220009  ! 192: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc9020009  ! 192: LDF_R	ld	[%r8, %r9], %f4
	.word 0x8cfa0009  ! 192: SDIVcc_R	sdivcc 	%r8, %r9, %r6
	.word 0xca220009  ! 195: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xee120009  ! 195: LDUH_R	lduh	[%r8 + %r9], %r23
	.word 0xaa4a0009  ! 195: MULX_R	mulx 	%r8, %r9, %r21
	.word 0xc4720009  ! 198: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xe84a0009  ! 198: LDSB_R	ldsb	[%r8 + %r9], %r20
	.word 0x8143e020  ! 198: MEMBAR	membar	#MemIssue 
	.word 0xf8220009  ! 201: STW_R	stw	%r28, [%r8 + %r9]
	.word 0xc2120009  ! 201: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0x83a209a9  ! 201: FDIVs	fdivs	%f8, %f9, %f1
	.word 0xcd220009  ! 204: STF_R	st	%f6, [%r9, %r8]
	.word 0xc84a0009  ! 204: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xca8a2268  ! 204: LDUBA_I	lduba	[%r8, + 0x0268] %asi, %r5
	.word 0xe2720009  ! 207: STX_R	stx	%r17, [%r8 + %r9]
	.word 0xc91a0009  ! 207: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xc7222f34  ! 207: STF_I	st	%f3, [0x0f34, %r8]
	.word 0xf6320009  ! 210: STH_R	sth	%r27, [%r8 + %r9]
	.word 0xcc020009  ! 210: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xfb1a2a90  ! 210: LDDF_I	ldd	[%r8, 0x0a90], %f29
	.word 0xee320009  ! 213: STH_R	sth	%r23, [%r8 + %r9]
	.word 0xf20a0009  ! 213: LDUB_R	ldub	[%r8 + %r9], %r25
	.word 0xc36a0009  ! 213: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xda2a0009  ! 216: STB_R	stb	%r13, [%r8 + %r9]
	.word 0xcc420009  ! 216: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xeeca1009  ! 216: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r23
	.word 0xc73a0009  ! 219: STDF_R	std	%f3, [%r9, %r8]
	.word 0xda5a0009  ! 219: LDX_R	ldx	[%r8 + %r9], %r13
	.word 0xc73a2370  ! 219: STDF_I	std	%f3, [0x0370, %r8]
	.word 0xcf220009  ! 222: STF_R	st	%f7, [%r9, %r8]
	.word 0xf31a0009  ! 222: LDDF_R	ldd	[%r8, %r9], %f25
	.word 0x8143e042  ! 222: MEMBAR	membar	#StoreLoad | #Sync 
	.word 0xc2320009  ! 225: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xca0a0009  ! 225: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xc9220009  ! 225: STF_R	st	%f4, [%r9, %r8]
	.word 0xcc2a0009  ! 228: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc6420009  ! 228: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0x885229d8  ! 228: UMUL_I	umul 	%r8, 0x09d8, %r4
	.word 0xc53a0009  ! 231: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc31a0009  ! 231: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xde8a246c  ! 231: LDUBA_I	lduba	[%r8, + 0x046c] %asi, %r15
	.word 0xce720009  ! 234: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xd91a0009  ! 234: LDDF_R	ldd	[%r8, %r9], %f12
	.word 0xc8b21009  ! 234: STHA_R	stha	%r4, [%r8 + %r9] 0x80
	.word 0xcd3a0009  ! 237: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc41a0009  ! 237: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x8da20829  ! 237: FADDs	fadds	%f8, %f9, %f6
	.word 0xcc2a0009  ! 240: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xca0a0009  ! 240: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xc33a0009  ! 240: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc93a0009  ! 243: STDF_R	std	%f4, [%r9, %r8]
	.word 0xcc020009  ! 243: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0x8a4a0009  ! 243: MULX_R	mulx 	%r8, %r9, %r5
	.word 0xce320009  ! 246: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xee020009  ! 246: LDUW_R	lduw	[%r8 + %r9], %r23
	.word 0xeafa1009  ! 246: SWAPA_R	swapa	%r21, [%r8 + %r9] 0x80
	.word 0xce220009  ! 249: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xd91a0009  ! 249: LDDF_R	ldd	[%r8, %r9], %f12
	.word 0xc53a0009  ! 249: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc62a0009  ! 252: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xe2120009  ! 252: LDUH_R	lduh	[%r8 + %r9], %r17
	.word 0xccfa2d1c  ! 252: SWAPA_I	swapa	%r6, [%r8 + 0x0d1c] %asi
	.word 0xc2220009  ! 255: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xcc420009  ! 255: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0x84522258  ! 255: UMUL_I	umul 	%r8, 0x0258, %r2
	.word 0xee2a0009  ! 258: STB_R	stb	%r23, [%r8 + %r9]
	.word 0xe1020009  ! 258: LDF_R	ld	[%r8, %r9], %f16
	.word 0xcff22009  ! 258: CASXA_R	casxa	[%r8]%asi, %r9, %r7
	.word 0xdf220009  ! 261: STF_R	st	%f15, [%r9, %r8]
	.word 0xdc5a0009  ! 261: LDX_R	ldx	[%r8 + %r9], %r14
	.word 0xc21225ac  ! 261: LDUH_I	lduh	[%r8 + 0x05ac], %r1
	.word 0xee320009  ! 264: STH_R	sth	%r23, [%r8 + %r9]
	.word 0xc40a0009  ! 264: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xc36a273c  ! 264: PREFETCH_I	prefetch	[%r8 + 0x073c], #one_read
	.word 0xc3220009  ! 267: STF_R	st	%f1, [%r9, %r8]
	.word 0xe4120009  ! 267: LDUH_R	lduh	[%r8 + %r9], %r18
	.word 0xf0ba1009  ! 267: STDA_R	stda	%r24, [%r8 + %r9] 0x80
	.word 0xce320009  ! 270: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc25a0009  ! 270: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0x85a20829  ! 270: FADDs	fadds	%f8, %f9, %f2
	.word 0xc42a0009  ! 273: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xca4a0009  ! 273: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xeaea1009  ! 273: LDSTUBA_R	ldstuba	%r21, [%r8 + %r9] 0x80
	.word 0xc6220009  ! 276: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xfa520009  ! 276: LDSH_R	ldsh	[%r8 + %r9], %r29
	.word 0xf27a27c0  ! 276: SWAP_I	swap	%r25, [%r8 + 0x07c0]
	.word 0xc6720009  ! 279: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xcc0a0009  ! 279: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0x18800001  ! 279: BGU	bgu  	<label_0x1>
	.word 0xde220009  ! 282: STW_R	stw	%r15, [%r8 + %r9]
	.word 0xcc420009  ! 282: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xee0a2024  ! 282: LDUB_I	ldub	[%r8 + 0x0024], %r23
	.word 0xc22a0009  ! 285: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xe41a0009  ! 285: LDD_R	ldd	[%r8 + %r9], %r18
	.word 0xc36a22a4  ! 285: PREFETCH_I	prefetch	[%r8 + 0x02a4], #one_read
	.word 0xc4320009  ! 288: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xf25a0009  ! 288: LDX_R	ldx	[%r8 + %r9], %r25
	.word 0x8143c000  ! 288: STBAR	stbar
	.word 0xcb3a0009  ! 291: STDF_R	std	%f5, [%r9, %r8]
	.word 0xcc120009  ! 291: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xc8fa2b78  ! 291: SWAPA_I	swapa	%r4, [%r8 + 0x0b78] %asi
	.word 0xfb220009  ! 294: STF_R	st	%f29, [%r9, %r8]
	.word 0xf8120009  ! 294: LDUH_R	lduh	[%r8 + %r9], %r28
	.word 0xc49a27f0  ! 294: LDDA_I	ldda	[%r8, + 0x07f0] %asi, %r2
	.word 0xc2720009  ! 297: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xf84a0009  ! 297: LDSB_R	ldsb	[%r8 + %r9], %r28
	.word 0x872228b0  ! 297: MULScc_I	mulscc 	%r8, 0x08b0, %r3
	.word 0xd93a0009  ! 300: STDF_R	std	%f12, [%r9, %r8]
	.word 0xc5020009  ! 300: LDF_R	ld	[%r8, %r9], %f2
	.word 0xce5a2e68  ! 300: LDX_I	ldx	[%r8 + 0x0e68], %r7
	.word 0xca720009  ! 303: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc71a0009  ! 303: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xecea2294  ! 303: LDSTUBA_I	ldstuba	%r22, [%r8 + 0x0294] %asi
	.word 0xc4320009  ! 306: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xca520009  ! 306: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xb1220009  ! 306: MULScc_R	mulscc 	%r8, %r9, %r24
	.word 0xca720009  ! 309: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc81a0009  ! 309: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xfc1a0009  ! 309: LDD_R	ldd	[%r8 + %r9], %r30
	.word 0xf53a0009  ! 312: STDF_R	std	%f26, [%r9, %r8]
	.word 0xe8420009  ! 312: LDSW_R	ldsw	[%r8 + %r9], %r20
	.word 0x1a800001  ! 312: BCC	bcc  	<label_0x1>
	.word 0xf0320009  ! 315: STH_R	sth	%r24, [%r8 + %r9]
	.word 0xec520009  ! 315: LDSH_R	ldsh	[%r8 + %r9], %r22
	.word 0xc20a0009  ! 315: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xc8220009  ! 318: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xf20a0009  ! 318: LDUB_R	ldub	[%r8 + %r9], %r25
	.word 0xde4a2054  ! 318: LDSB_I	ldsb	[%r8 + 0x0054], %r15
	.word 0xc53a0009  ! 321: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc4120009  ! 321: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xc3ea2a1c  ! 321: PREFETCHA_I	prefetcha	[%r8, + 0x0a1c] %asi, #one_read
	.word 0xcd220009  ! 324: STF_R	st	%f6, [%r9, %r8]
	.word 0xe04a0009  ! 324: LDSB_R	ldsb	[%r8 + %r9], %r16
	.word 0xc2aa286c  ! 324: STBA_I	stba	%r1, [%r8 + 0x086c] %asi
	.word 0xc2220009  ! 327: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xcc420009  ! 327: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0x89a20929  ! 327: FMULs	fmuls	%f8, %f9, %f4
	.word 0xd82a0009  ! 330: STB_R	stb	%r12, [%r8 + %r9]
	.word 0xc5020009  ! 330: LDF_R	ld	[%r8, %r9], %f2
	.word 0xc3ea1009  ! 330: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc9220009  ! 333: STF_R	st	%f4, [%r9, %r8]
	.word 0xc80a0009  ! 333: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0x0a800002  ! 333: BCS	bcs  	<label_0x2>
	.word 0xf7220009  ! 336: STF_R	st	%f27, [%r9, %r8]
	.word 0xce020009  ! 336: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xfeea1009  ! 336: LDSTUBA_R	ldstuba	%r31, [%r8 + %r9] 0x80
	.word 0xc2720009  ! 339: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xec520009  ! 339: LDSH_R	ldsh	[%r8 + %r9], %r22
	.word 0xae4a0009  ! 339: MULX_R	mulx 	%r8, %r9, %r23
	.word 0xce320009  ! 342: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xcc0a0009  ! 342: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0x8b6a0009  ! 342: SDIVX_R	sdivx	%r8, %r9, %r5
	.word 0xff3a0009  ! 345: STDF_R	std	%f31, [%r9, %r8]
	.word 0xc80a0009  ! 345: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0x8143c000  ! 345: STBAR	stbar
	.word 0xc4220009  ! 348: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc81a0009  ! 348: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xe4b21009  ! 348: STHA_R	stha	%r18, [%r8 + %r9] 0x80
	.word 0xcb220009  ! 351: STF_R	st	%f5, [%r9, %r8]
	.word 0xfa5a0009  ! 351: LDX_R	ldx	[%r8 + %r9], %r29
	.word 0x8143e033  ! 351: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside | #MemIssue 
	.word 0xe2320009  ! 354: STH_R	sth	%r17, [%r8 + %r9]
	.word 0xcd1a0009  ! 354: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0x8e5a0009  ! 354: SMUL_R	smul 	%r8, %r9, %r7
	.word 0xe2720009  ! 357: STX_R	stx	%r17, [%r8 + %r9]
	.word 0xc6520009  ! 357: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xc36a2004  ! 357: PREFETCH_I	prefetch	[%r8 + 0x0004], #one_read
	.word 0xc6220009  ! 360: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xcf020009  ! 360: LDF_R	ld	[%r8, %r9], %f7
	.word 0xad220009  ! 360: MULScc_R	mulscc 	%r8, %r9, %r22
	.word 0xe7220009  ! 363: STF_R	st	%f19, [%r9, %r8]
	.word 0xc44a0009  ! 363: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0x82da0009  ! 363: SMULcc_R	smulcc 	%r8, %r9, %r1
	.word 0xc53a0009  ! 366: STDF_R	std	%f2, [%r9, %r8]
	.word 0xde120009  ! 366: LDUH_R	lduh	[%r8 + %r9], %r15
	.word 0x0a800002  ! 366: BCS	bcs  	<label_0x2>
	.word 0xc4720009  ! 369: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc41a0009  ! 369: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xcfe21009  ! 369: CASA_I	casa	[%r8] 0x80, %r9, %r7
	.word 0xc62a0009  ! 372: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xe2120009  ! 372: LDUH_R	lduh	[%r8 + %r9], %r17
	.word 0x02800001  ! 372: BE	be  	<label_0x1>
	.word 0xce320009  ! 375: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xca020009  ! 375: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0x84722d78  ! 375: UDIV_I	udiv 	%r8, 0x0d78, %r2
	.word 0xc2320009  ! 378: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc41a0009  ! 378: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x32800001  ! 378: BNE	bne,a	<label_0x1>
	.word 0xc62a0009  ! 381: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc81a0009  ! 381: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xcbe22009  ! 381: CASA_R	casa	[%r8] %asi, %r9, %r5
	.word 0xc7220009  ! 384: STF_R	st	%f3, [%r9, %r8]
	.word 0xc80a0009  ! 384: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0x8da208a9  ! 384: FSUBs	fsubs	%f8, %f9, %f6
	.word 0xde2a0009  ! 387: STB_R	stb	%r15, [%r8 + %r9]
	.word 0xc5020009  ! 387: LDF_R	ld	[%r8, %r9], %f2
	.word 0xc3ea1009  ! 387: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xce320009  ! 390: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xce120009  ! 390: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xc3ea2960  ! 390: PREFETCHA_I	prefetcha	[%r8, + 0x0960] %asi, #one_read
	.word 0xf0720009  ! 393: STX_R	stx	%r24, [%r8 + %r9]
	.word 0xc25a0009  ! 393: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xc3ea2fd4  ! 393: PREFETCHA_I	prefetcha	[%r8, + 0x0fd4] %asi, #one_read
	.word 0xf0220009  ! 396: STW_R	stw	%r24, [%r8 + %r9]
	.word 0xe8020009  ! 396: LDUW_R	lduw	[%r8 + %r9], %r20
	.word 0x8ba208a9  ! 396: FSUBs	fsubs	%f8, %f9, %f5
	.word 0xc93a0009  ! 399: STDF_R	std	%f4, [%r9, %r8]
	.word 0xf0520009  ! 399: LDSH_R	ldsh	[%r8 + %r9], %r24
	.word 0x87a209a9  ! 399: FDIVs	fdivs	%f8, %f9, %f3
	.word 0xea2a0009  ! 402: STB_R	stb	%r21, [%r8 + %r9]
	.word 0xef1a0009  ! 402: LDDF_R	ldd	[%r8, %r9], %f23
	.word 0x82522a98  ! 402: UMUL_I	umul 	%r8, 0x0a98, %r1
	.word 0xcf3a0009  ! 405: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc2120009  ! 405: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xcb022948  ! 405: LDF_I	ld	[%r8, 0x0948], %f5
	.word 0xf6220009  ! 408: STW_R	stw	%r27, [%r8 + %r9]
	.word 0xce020009  ! 408: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0x8e520009  ! 408: UMUL_R	umul 	%r8, %r9, %r7
	.word 0xfe220009  ! 411: STW_R	stw	%r31, [%r8 + %r9]
	.word 0xd8120009  ! 411: LDUH_R	lduh	[%r8 + %r9], %r12
	.word 0x0eca0001  ! 411: BRGEZ	brgez  ,pt	%8,<label_0xa0001>
	.word 0xcf220009  ! 414: STF_R	st	%f7, [%r9, %r8]
	.word 0xc3020009  ! 414: LDF_R	ld	[%r8, %r9], %f1
	.word 0x8d220009  ! 414: MULScc_R	mulscc 	%r8, %r9, %r6
	.word 0xf93a0009  ! 417: STDF_R	std	%f28, [%r9, %r8]
	.word 0xcc4a0009  ! 417: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xb3a20829  ! 417: FADDs	fadds	%f8, %f9, %f25
	.word 0xca220009  ! 420: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xf2120009  ! 420: LDUH_R	lduh	[%r8 + %r9], %r25
	.word 0xc8d22838  ! 420: LDSHA_I	ldsha	[%r8, + 0x0838] %asi, %r4
	.word 0xfc320009  ! 423: STH_R	sth	%r30, [%r8 + %r9]
	.word 0xeb020009  ! 423: LDF_R	ld	[%r8, %r9], %f21
	.word 0x8652263c  ! 423: UMUL_I	umul 	%r8, 0x063c, %r3
	.word 0xc73a0009  ! 426: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc31a0009  ! 426: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xfd3a2a88  ! 426: STDF_I	std	%f30, [0x0a88, %r8]
	.word 0xca220009  ! 429: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xfa020009  ! 429: LDUW_R	lduw	[%r8 + %r9], %r29
	.word 0x24800001  ! 429: BLE	ble,a	<label_0x1>
	.word 0xf4220009  ! 432: STW_R	stw	%r26, [%r8 + %r9]
	.word 0xcf1a0009  ! 432: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xfd3a2500  ! 432: STDF_I	std	%f30, [0x0500, %r8]
	.word 0xc2320009  ! 435: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xf8420009  ! 435: LDSW_R	ldsw	[%r8 + %r9], %r28
	.word 0xc6aa1009  ! 435: STBA_R	stba	%r3, [%r8 + %r9] 0x80
	.word 0xde220009  ! 438: STW_R	stw	%r15, [%r8 + %r9]
	.word 0xee520009  ! 438: LDSH_R	ldsh	[%r8 + %r9], %r23
	.word 0xf0ca1009  ! 438: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r24
	.word 0xc42a0009  ! 441: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc6020009  ! 441: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0x0c800001  ! 441: BNEG	bneg  	<label_0x1>
	.word 0xc5220009  ! 444: STF_R	st	%f2, [%r9, %r8]
	.word 0xc24a0009  ! 444: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xa85a2418  ! 444: SMUL_I	smul 	%r8, 0x0418, %r20
	.word 0xcc320009  ! 447: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xcc520009  ! 447: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xf4fa1009  ! 447: SWAPA_R	swapa	%r26, [%r8 + %r9] 0x80
	.word 0xc2320009  ! 450: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xcc0a0009  ! 450: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0x8143e034  ! 450: MEMBAR	membar	#LoadStore | #Lookaside | #MemIssue 
	.word 0xca320009  ! 453: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc4520009  ! 453: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0x8ba208a9  ! 453: FSUBs	fsubs	%f8, %f9, %f5
	.word 0xc6220009  ! 456: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xcc4a0009  ! 456: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xcb3a0009  ! 456: STDF_R	std	%f5, [%r9, %r8]
	.word 0xc42a0009  ! 459: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc2020009  ! 459: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xf2f21009  ! 459: STXA_R	stxa	%r25, [%r8 + %r9] 0x80
	.word 0xc2720009  ! 462: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xda0a0009  ! 462: LDUB_R	ldub	[%r8 + %r9], %r13
	.word 0xc4020009  ! 462: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xc33a0009  ! 465: STDF_R	std	%f1, [%r9, %r8]
	.word 0xca020009  ! 465: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0x8143c000  ! 465: STBAR	stbar
	.word 0xea220009  ! 468: STW_R	stw	%r21, [%r8 + %r9]
	.word 0xfa420009  ! 468: LDSW_R	ldsw	[%r8 + %r9], %r29
	.word 0x1a800001  ! 468: BCC	bcc  	<label_0x1>
	.word 0xcf220009  ! 471: STF_R	st	%f7, [%r9, %r8]
	.word 0xc2420009  ! 471: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0x844a2b54  ! 471: MULX_I	mulx 	%r8, 0x0b54, %r2
	.word 0xce720009  ! 474: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xeb020009  ! 474: LDF_R	ld	[%r8, %r9], %f21
	.word 0xe4ca2038  ! 474: LDSBA_I	ldsba	[%r8, + 0x0038] %asi, %r18
	.word 0xce320009  ! 477: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xde120009  ! 477: LDUH_R	lduh	[%r8 + %r9], %r15
	.word 0xc36a0009  ! 477: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc22a0009  ! 480: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc20a0009  ! 480: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xb84a2c00  ! 480: MULX_I	mulx 	%r8, 0x0c00, %r28
	.word 0xc8320009  ! 483: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc85a0009  ! 483: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0x8143c000  ! 483: STBAR	stbar
	.word 0xc42a0009  ! 486: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc60a0009  ! 486: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xcaf21009  ! 486: STXA_R	stxa	%r5, [%r8 + %r9] 0x80
	.word 0xe8720009  ! 489: STX_R	stx	%r20, [%r8 + %r9]
	.word 0xc8020009  ! 489: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xc5220009  ! 489: STF_R	st	%f2, [%r9, %r8]
	.word 0xca720009  ! 492: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xe45a0009  ! 492: LDX_R	ldx	[%r8 + %r9], %r18
	.word 0xccda2e80  ! 492: LDXA_I	ldxa	[%r8, + 0x0e80] %asi, %r6
	.word 0xca720009  ! 495: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xd8020009  ! 495: LDUW_R	lduw	[%r8 + %r9], %r12
	.word 0x2a800001  ! 495: BCS	bcs,a	<label_0x1>
	.word 0xcd220009  ! 498: STF_R	st	%f6, [%r9, %r8]
	.word 0xf51a0009  ! 498: LDDF_R	ldd	[%r8, %r9], %f26
	.word 0x06800001  ! 498: BL	bl  	<label_0x1>
	.word 0xc33a0009  ! 501: STDF_R	std	%f1, [%r9, %r8]
	.word 0xcc4a0009  ! 501: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xdefa1009  ! 501: SWAPA_R	swapa	%r15, [%r8 + %r9] 0x80
	.word 0xe5220009  ! 504: STF_R	st	%f18, [%r9, %r8]
	.word 0xc2120009  ! 504: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0x8a6a0009  ! 504: UDIVX_R	udivx 	%r8, %r9, %r5
	.word 0xfd220009  ! 507: STF_R	st	%f30, [%r9, %r8]
	.word 0xc41a0009  ! 507: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x0a800002  ! 507: BCS	bcs  	<label_0x2>
	.word 0xc3220009  ! 510: STF_R	st	%f1, [%r9, %r8]
	.word 0xc40a0009  ! 510: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xcde21009  ! 510: CASA_I	casa	[%r8] 0x80, %r9, %r6
	.word 0xc2320009  ! 513: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc2520009  ! 513: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xcea22d28  ! 513: STWA_I	stwa	%r7, [%r8 + 0x0d28] %asi
	.word 0xc3220009  ! 516: STF_R	st	%f1, [%r9, %r8]
	.word 0xea420009  ! 516: LDSW_R	ldsw	[%r8 + %r9], %r21
	.word 0xc3ea2470  ! 516: PREFETCHA_I	prefetcha	[%r8, + 0x0470] %asi, #one_read
	.word 0xc2220009  ! 519: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc20a0009  ! 519: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xc6da1009  ! 519: LDXA_R	ldxa	[%r8, %r9] 0x80, %r3
	.word 0xe8320009  ! 522: STH_R	sth	%r20, [%r8 + %r9]
	.word 0xf20a0009  ! 522: LDUB_R	ldub	[%r8 + %r9], %r25
	.word 0x8143e00e  ! 522: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore 
	.word 0xc2320009  ! 525: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xfc4a0009  ! 525: LDSB_R	ldsb	[%r8 + %r9], %r30
	.word 0xe8b226f8  ! 525: STHA_I	stha	%r20, [%r8 + 0x06f8] %asi
	.word 0xe2220009  ! 528: STW_R	stw	%r17, [%r8 + %r9]
	.word 0xf7020009  ! 528: LDF_R	ld	[%r8, %r9], %f27
	.word 0xf8922fd4  ! 528: LDUHA_I	lduha	[%r8, + 0x0fd4] %asi, %r28
	.word 0xcf220009  ! 531: STF_R	st	%f7, [%r9, %r8]
	.word 0xcf020009  ! 531: LDF_R	ld	[%r8, %r9], %f7
	.word 0xdc0a2c60  ! 531: LDUB_I	ldub	[%r8 + 0x0c60], %r14
	.word 0xee2a0009  ! 534: STB_R	stb	%r23, [%r8 + %r9]
	.word 0xea0a0009  ! 534: LDUB_R	ldub	[%r8 + %r9], %r21
	.word 0xc4ba2ab0  ! 534: STDA_I	stda	%r2, [%r8 + 0x0ab0] %asi
	.word 0xf0720009  ! 537: STX_R	stx	%r24, [%r8 + %r9]
	.word 0xe64a0009  ! 537: LDSB_R	ldsb	[%r8 + %r9], %r19
	.word 0x8143c000  ! 537: STBAR	stbar
	.word 0xf8720009  ! 540: STX_R	stx	%r28, [%r8 + %r9]
	.word 0xcf020009  ! 540: LDF_R	ld	[%r8, %r9], %f7
	.word 0xaaf20009  ! 540: UDIVcc_R	udivcc 	%r8, %r9, %r21
	.word 0xc3220009  ! 543: STF_R	st	%f1, [%r9, %r8]
	.word 0xc51a0009  ! 543: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0x22ca0001  ! 543: BRZ	brz,a,pt	%8,<label_0xa0001>
	.word 0xc4220009  ! 546: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xcf1a0009  ! 546: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0x8143e02d  ! 546: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #MemIssue 
	.word 0xcf220009  ! 549: STF_R	st	%f7, [%r9, %r8]
	.word 0xce420009  ! 549: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xf2921009  ! 549: LDUHA_R	lduha	[%r8, %r9] 0x80, %r25
	.word 0xe22a0009  ! 552: STB_R	stb	%r17, [%r8 + %r9]
	.word 0xcc420009  ! 552: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xcc6a2fa8  ! 552: LDSTUB_I	ldstub	%r6, [%r8 + 0x0fa8]
	.word 0xf6320009  ! 555: STH_R	sth	%r27, [%r8 + %r9]
	.word 0xc5020009  ! 555: LDF_R	ld	[%r8, %r9], %f2
	.word 0xc8d21009  ! 555: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r4
	.word 0xca220009  ! 558: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xfa520009  ! 558: LDSH_R	ldsh	[%r8 + %r9], %r29
	.word 0xe4420009  ! 558: LDSW_R	ldsw	[%r8 + %r9], %r18
	.word 0xc2220009  ! 561: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xf65a0009  ! 561: LDX_R	ldx	[%r8 + %r9], %r27
	.word 0xeb220009  ! 561: STF_R	st	%f21, [%r9, %r8]
	.word 0xcc720009  ! 564: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc4020009  ! 564: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xccca202c  ! 564: LDSBA_I	ldsba	[%r8, + 0x002c] %asi, %r6
	.word 0xcd220009  ! 567: STF_R	st	%f6, [%r9, %r8]
	.word 0xdf020009  ! 567: LDF_R	ld	[%r8, %r9], %f15
	.word 0xc26a0009  ! 567: LDSTUB_R	ldstub	%r1, [%r8 + %r9]
	.word 0xcd220009  ! 570: STF_R	st	%f6, [%r9, %r8]
	.word 0xc51a0009  ! 570: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0x3e800001  ! 570: BVC	bvc,a	<label_0x1>
	.word 0xc53a0009  ! 573: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc20a0009  ! 573: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xc2422700  ! 573: LDSW_I	ldsw	[%r8 + 0x0700], %r1
	.word 0xe2220009  ! 576: STW_R	stw	%r17, [%r8 + %r9]
	.word 0xc84a0009  ! 576: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xff220009  ! 576: STF_R	st	%f31, [%r9, %r8]
	.word 0xc42a0009  ! 579: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xef1a0009  ! 579: LDDF_R	ldd	[%r8, %r9], %f23
	.word 0x8143e011  ! 579: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xcb3a0009  ! 582: STDF_R	std	%f5, [%r9, %r8]
	.word 0xe9020009  ! 582: LDF_R	ld	[%r8, %r9], %f20
	.word 0x8143e06a  ! 582: MEMBAR	membar	#StoreLoad | #StoreStore | #MemIssue | #Sync 
	.word 0xcc320009  ! 585: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc6520009  ! 585: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xf4b225a4  ! 585: STHA_I	stha	%r26, [%r8 + 0x05a4] %asi
	.word 0xc6720009  ! 588: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xfa0a0009  ! 588: LDUB_R	ldub	[%r8 + %r9], %r29
	.word 0x14800002  ! 588: BG	bg  	<label_0x2>
	.word 0xc9220009  ! 591: STF_R	st	%f4, [%r9, %r8]
	.word 0xd41a0009  ! 591: LDD_R	ldd	[%r8 + %r9], %r10
	.word 0xce921009  ! 591: LDUHA_R	lduha	[%r8, %r9] 0x80, %r7
	.word 0xce720009  ! 594: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xf85a0009  ! 594: LDX_R	ldx	[%r8 + %r9], %r28
	.word 0x8143c000  ! 594: STBAR	stbar
	.word 0xc53a0009  ! 597: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc6020009  ! 597: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xc36a2d4c  ! 597: PREFETCH_I	prefetch	[%r8 + 0x0d4c], #one_read
	.word 0xc3220009  ! 600: STF_R	st	%f1, [%r9, %r8]
	.word 0xcc0a0009  ! 600: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0x87a209a9  ! 600: FDIVs	fdivs	%f8, %f9, %f3
	.word 0xca320009  ! 603: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xe4120009  ! 603: LDUH_R	lduh	[%r8 + %r9], %r18
	.word 0x84f2263c  ! 603: UDIVcc_I	udivcc 	%r8, 0x063c, %r2
	.word 0xdc220009  ! 606: STW_R	stw	%r14, [%r8 + %r9]
	.word 0xe3020009  ! 606: LDF_R	ld	[%r8, %r9], %f17
	.word 0x8143c000  ! 606: STBAR	stbar
	.word 0xc8720009  ! 609: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xec0a0009  ! 609: LDUB_R	ldub	[%r8 + %r9], %r22
	.word 0xc8420009  ! 609: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xc2720009  ! 612: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc4420009  ! 612: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0x10800001  ! 612: BA	ba  	<label_0x1>
	.word 0xde2a0009  ! 615: STB_R	stb	%r15, [%r8 + %r9]
	.word 0xc81a0009  ! 615: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xcb0223e0  ! 615: LDF_I	ld	[%r8, 0x03e0], %f5
	.word 0xce2a0009  ! 618: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xcc120009  ! 618: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xc48a2afc  ! 618: LDUBA_I	lduba	[%r8, + 0x0afc] %asi, %r2
	.word 0xdc220009  ! 621: STW_R	stw	%r14, [%r8 + %r9]
	.word 0xe4020009  ! 621: LDUW_R	lduw	[%r8 + %r9], %r18
	.word 0x826a2bc0  ! 621: UDIVX_I	udivx 	%r8, 0x0bc0, %r1
	.word 0xea220009  ! 624: STW_R	stw	%r21, [%r8 + %r9]
	.word 0xe6020009  ! 624: LDUW_R	lduw	[%r8 + %r9], %r19
	.word 0x86d22360  ! 624: UMULcc_I	umulcc 	%r8, 0x0360, %r3
	.word 0xc2320009  ! 627: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xcb020009  ! 627: LDF_R	ld	[%r8, %r9], %f5
	.word 0x8143e073  ! 627: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside | #MemIssue | #Sync 
	.word 0xf1220009  ! 630: STF_R	st	%f24, [%r9, %r8]
	.word 0xdf020009  ! 630: LDF_R	ld	[%r8, %r9], %f15
	.word 0xcfe21009  ! 630: CASA_I	casa	[%r8] 0x80, %r9, %r7
	.word 0xca2a0009  ! 633: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc4520009  ! 633: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xced22b90  ! 633: LDSHA_I	ldsha	[%r8, + 0x0b90] %asi, %r7
	.word 0xc73a0009  ! 636: STDF_R	std	%f3, [%r9, %r8]
	.word 0xea420009  ! 636: LDSW_R	ldsw	[%r8 + %r9], %r21
	.word 0x8143c000  ! 636: STBAR	stbar
	.word 0xe0220009  ! 639: STW_R	stw	%r16, [%r8 + %r9]
	.word 0xd6120009  ! 639: LDUH_R	lduh	[%r8 + %r9], %r11
	.word 0x3c800001  ! 639: BPOS	bpos,a	<label_0x1>
	.word 0xfa720009  ! 642: STX_R	stx	%r29, [%r8 + %r9]
	.word 0xc9020009  ! 642: LDF_R	ld	[%r8, %r9], %f4
	.word 0x8143c000  ! 642: STBAR	stbar
	.word 0xfa720009  ! 645: STX_R	stx	%r29, [%r8 + %r9]
	.word 0xce0a0009  ! 645: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0x8143c000  ! 645: STBAR	stbar
	.word 0xc6220009  ! 648: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xec120009  ! 648: LDUH_R	lduh	[%r8 + %r9], %r22
	.word 0xceca1009  ! 648: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r7
	.word 0xfa2a0009  ! 651: STB_R	stb	%r29, [%r8 + %r9]
	.word 0xc31a0009  ! 651: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0x8143c000  ! 651: STBAR	stbar
	.word 0xca220009  ! 654: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xde020009  ! 654: LDUW_R	lduw	[%r8 + %r9], %r15
	.word 0x8143c000  ! 654: STBAR	stbar
	.word 0xce720009  ! 657: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc40a0009  ! 657: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0x8f222624  ! 657: MULScc_I	mulscc 	%r8, 0x0624, %r7
	.word 0xce220009  ! 660: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc71a0009  ! 660: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0x82d22530  ! 660: UMULcc_I	umulcc 	%r8, 0x0530, %r1
	.word 0xc4220009  ! 663: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc85a0009  ! 663: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xccb22390  ! 663: STHA_I	stha	%r6, [%r8 + 0x0390] %asi
	.word 0xca320009  ! 666: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xcc520009  ! 666: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0x24800001  ! 666: BLE	ble,a	<label_0x1>
	.word 0xc2220009  ! 669: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xce4a0009  ! 669: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0x836a0009  ! 669: SDIVX_R	sdivx	%r8, %r9, %r1
	.word 0xce220009  ! 672: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xd8020009  ! 672: LDUW_R	lduw	[%r8 + %r9], %r12
	.word 0x8143e04a  ! 672: MEMBAR	membar	#StoreLoad | #StoreStore | #Sync 
	.word 0xee720009  ! 675: STX_R	stx	%r23, [%r8 + %r9]
	.word 0xc91a0009  ! 675: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0x8143c000  ! 675: STBAR	stbar
	.word 0xc82a0009  ! 678: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xca4a0009  ! 678: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xc36a26d8  ! 678: PREFETCH_I	prefetch	[%r8 + 0x06d8], #one_read
	.word 0xcc320009  ! 681: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc80a0009  ! 681: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xc4ea1009  ! 681: LDSTUBA_R	ldstuba	%r2, [%r8 + %r9] 0x80
	.word 0xf4220009  ! 684: STW_R	stw	%r26, [%r8 + %r9]
	.word 0xcc0a0009  ! 684: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xc36a0009  ! 684: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc3220009  ! 687: STF_R	st	%f1, [%r9, %r8]
	.word 0xcd020009  ! 687: LDF_R	ld	[%r8, %r9], %f6
	.word 0x836a0009  ! 687: SDIVX_R	sdivx	%r8, %r9, %r1
	.word 0xf33a0009  ! 690: STDF_R	std	%f25, [%r9, %r8]
	.word 0xe01a0009  ! 690: LDD_R	ldd	[%r8 + %r9], %r16
	.word 0xfea227c8  ! 690: STWA_I	stwa	%r31, [%r8 + 0x07c8] %asi
	.word 0xc4320009  ! 693: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xcc420009  ! 693: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xea420009  ! 693: LDSW_R	ldsw	[%r8 + %r9], %r21
	.word 0xff3a0009  ! 696: STDF_R	std	%f31, [%r9, %r8]
	.word 0xc41a0009  ! 696: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xc3ea1009  ! 696: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xe13a0009  ! 699: STDF_R	std	%f16, [%r9, %r8]
	.word 0xc71a0009  ! 699: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xc3ea1009  ! 699: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xff220009  ! 702: STF_R	st	%f31, [%r9, %r8]
	.word 0xc4020009  ! 702: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xc4020009  ! 702: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xca720009  ! 705: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc24a0009  ! 705: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xccaa1009  ! 705: STBA_R	stba	%r6, [%r8 + %r9] 0x80
	.word 0xc8720009  ! 708: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xfb020009  ! 708: LDF_R	ld	[%r8, %r9], %f29
	.word 0xacd2287c  ! 708: UMULcc_I	umulcc 	%r8, 0x087c, %r22
	.word 0xc8720009  ! 711: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xce420009  ! 711: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xccba23d0  ! 711: STDA_I	stda	%r6, [%r8 + 0x03d0] %asi
	.word 0xce320009  ! 714: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc84a0009  ! 714: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0x40000002  ! 714: CALL	call	disp30_2
	.word 0xe93a0009  ! 717: STDF_R	std	%f20, [%r9, %r8]
	.word 0xcc0a0009  ! 717: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0x85a208a9  ! 717: FSUBs	fsubs	%f8, %f9, %f2
	.word 0xdb3a0009  ! 720: STDF_R	std	%f13, [%r9, %r8]
	.word 0xc7020009  ! 720: LDF_R	ld	[%r8, %r9], %f3
	.word 0xc88a2948  ! 720: LDUBA_I	lduba	[%r8, + 0x0948] %asi, %r4
	.word 0xf2320009  ! 723: STH_R	sth	%r25, [%r8 + %r9]
	.word 0xc6120009  ! 723: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xacd22418  ! 723: UMULcc_I	umulcc 	%r8, 0x0418, %r22
	.word 0xdd220009  ! 726: STF_R	st	%f14, [%r9, %r8]
	.word 0xcd1a0009  ! 726: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0x8143e039  ! 726: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside | #MemIssue 
	.word 0xcc720009  ! 729: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xe41a0009  ! 729: LDD_R	ldd	[%r8 + %r9], %r18
	.word 0xc36a0009  ! 729: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xe1220009  ! 732: STF_R	st	%f16, [%r9, %r8]
	.word 0xce520009  ! 732: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0x9e5a0009  ! 732: SMUL_R	smul 	%r8, %r9, %r15
	.word 0xe4320009  ! 735: STH_R	sth	%r18, [%r8 + %r9]
	.word 0xdd1a0009  ! 735: LDDF_R	ldd	[%r8, %r9], %f14
	.word 0xcc4a224c  ! 735: LDSB_I	ldsb	[%r8 + 0x024c], %r6
	.word 0xce2a0009  ! 738: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xf24a0009  ! 738: LDSB_R	ldsb	[%r8 + %r9], %r25
	.word 0x85a208a9  ! 738: FSUBs	fsubs	%f8, %f9, %f2
	.word 0xf0220009  ! 741: STW_R	stw	%r24, [%r8 + %r9]
	.word 0xc81a0009  ! 741: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xfcf22288  ! 741: STXA_I	stxa	%r30, [%r8 + 0x0288] %asi
	.word 0xe2320009  ! 744: STH_R	sth	%r17, [%r8 + %r9]
	.word 0xca020009  ! 744: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xd80a0009  ! 744: LDUB_R	ldub	[%r8 + %r9], %r12
	.word 0xcc320009  ! 747: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xcc520009  ! 747: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xcd222db8  ! 747: STF_I	st	%f6, [0x0db8, %r8]
	.word 0xc3220009  ! 750: STF_R	st	%f1, [%r9, %r8]
	.word 0xce520009  ! 750: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xcc9a2480  ! 750: LDDA_I	ldda	[%r8, + 0x0480] %asi, %r6
	.word 0xca220009  ! 753: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xe41a0009  ! 753: LDD_R	ldd	[%r8 + %r9], %r18
	.word 0xcab21009  ! 753: STHA_R	stha	%r5, [%r8 + %r9] 0x80
	.word 0xc73a0009  ! 756: STDF_R	std	%f3, [%r9, %r8]
	.word 0xda520009  ! 756: LDSH_R	ldsh	[%r8 + %r9], %r13
	.word 0xc3ea1009  ! 756: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc73a0009  ! 759: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc8120009  ! 759: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0x87222c7c  ! 759: MULScc_I	mulscc 	%r8, 0x0c7c, %r3
	.word 0xc3220009  ! 762: STF_R	st	%f1, [%r9, %r8]
	.word 0xcc4a0009  ! 762: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0x83222d60  ! 762: MULScc_I	mulscc 	%r8, 0x0d60, %r1
	.word 0xcc720009  ! 765: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xf5020009  ! 765: LDF_R	ld	[%r8, %r9], %f26
	.word 0x8143e021  ! 765: MEMBAR	membar	#LoadLoad | #MemIssue 
	.word 0xdc720009  ! 768: STX_R	stx	%r14, [%r8 + %r9]
	.word 0xf25a0009  ! 768: LDX_R	ldx	[%r8 + %r9], %r25
	.word 0xc5220009  ! 768: STF_R	st	%f2, [%r9, %r8]
	.word 0xd6720009  ! 771: STX_R	stx	%r11, [%r8 + %r9]
	.word 0xc6420009  ! 771: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xccaa1009  ! 771: STBA_R	stba	%r6, [%r8 + %r9] 0x80
	.word 0xcc220009  ! 774: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xcc420009  ! 774: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0x8cd22d48  ! 774: UMULcc_I	umulcc 	%r8, 0x0d48, %r6
	.word 0xcc2a0009  ! 777: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xce120009  ! 777: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0x89a209a9  ! 777: FDIVs	fdivs	%f8, %f9, %f4
	.word 0xc2220009  ! 780: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc9020009  ! 780: LDF_R	ld	[%r8, %r9], %f4
	.word 0x84da0009  ! 780: SMULcc_R	smulcc 	%r8, %r9, %r2
	.word 0xc8220009  ! 783: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xd8420009  ! 783: LDSW_R	ldsw	[%r8 + %r9], %r12
	.word 0xef2220c8  ! 783: STF_I	st	%f23, [0x00c8, %r8]
	.word 0xe33a0009  ! 786: STDF_R	std	%f17, [%r9, %r8]
	.word 0xcc5a0009  ! 786: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0x8c6a21e4  ! 786: UDIVX_I	udivx 	%r8, 0x01e4, %r6
	.word 0xcf220009  ! 789: STF_R	st	%f7, [%r9, %r8]
	.word 0xcc4a0009  ! 789: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0x8143c000  ! 789: STBAR	stbar
	.word 0xc6720009  ! 792: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc25a0009  ! 792: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0x8ad20009  ! 792: UMULcc_R	umulcc 	%r8, %r9, %r5
	.word 0xf82a0009  ! 795: STB_R	stb	%r28, [%r8 + %r9]
	.word 0xc20a0009  ! 795: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0x8143e01b  ! 795: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Lookaside 
	.word 0xcd3a0009  ! 798: STDF_R	std	%f6, [%r9, %r8]
	.word 0xcf1a0009  ! 798: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xc36a2b7c  ! 798: PREFETCH_I	prefetch	[%r8 + 0x0b7c], #one_read
	.word 0xf4320009  ! 801: STH_R	sth	%r26, [%r8 + %r9]
	.word 0xcc520009  ! 801: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xac6a28d0  ! 801: UDIVX_I	udivx 	%r8, 0x08d0, %r22
	.word 0xcc220009  ! 804: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xfa0a0009  ! 804: LDUB_R	ldub	[%r8 + %r9], %r29
	.word 0x87a20829  ! 804: FADDs	fadds	%f8, %f9, %f3
	.word 0xc8220009  ! 807: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xcb1a0009  ! 807: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xc93a0009  ! 807: STDF_R	std	%f4, [%r9, %r8]
	.word 0xe02a0009  ! 810: STB_R	stb	%r16, [%r8 + %r9]
	.word 0xcc4a0009  ! 810: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xc36a0009  ! 810: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xf0220009  ! 813: STW_R	stw	%r24, [%r8 + %r9]
	.word 0xc41a0009  ! 813: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xa07223c4  ! 813: UDIV_I	udiv 	%r8, 0x03c4, %r16
	.word 0xee2a0009  ! 816: STB_R	stb	%r23, [%r8 + %r9]
	.word 0xc85a0009  ! 816: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xaa7a2b44  ! 816: SDIV_I	sdiv 	%r8, 0x0b44, %r21
	.word 0xca320009  ! 819: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xce020009  ! 819: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xc49a1009  ! 819: LDDA_R	ldda	[%r8, %r9] 0x80, %r2
	.word 0xf3220009  ! 822: STF_R	st	%f25, [%r9, %r8]
	.word 0xec120009  ! 822: LDUH_R	lduh	[%r8 + %r9], %r22
	.word 0x8143e026  ! 822: MEMBAR	membar	#StoreLoad | #LoadStore | #MemIssue 
	.word 0xc62a0009  ! 825: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xfd020009  ! 825: LDF_R	ld	[%r8, %r9], %f30
	.word 0xce8225a0  ! 825: LDUWA_I	lduwa	[%r8, + 0x05a0] %asi, %r7
	.word 0xcf3a0009  ! 828: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc4420009  ! 828: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xe08a2130  ! 828: LDUBA_I	lduba	[%r8, + 0x0130] %asi, %r16
	.word 0xe2220009  ! 831: STW_R	stw	%r17, [%r8 + %r9]
	.word 0xf8020009  ! 831: LDUW_R	lduw	[%r8 + %r9], %r28
	.word 0xc66a261c  ! 831: LDSTUB_I	ldstub	%r3, [%r8 + 0x061c]
	.word 0xc8220009  ! 834: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xd8420009  ! 834: LDSW_R	ldsw	[%r8 + %r9], %r12
	.word 0xb4fa2580  ! 834: SDIVcc_I	sdivcc 	%r8, 0x0580, %r26
	.word 0xcd220009  ! 837: STF_R	st	%f6, [%r9, %r8]
	.word 0xc6520009  ! 837: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xf0ba2be8  ! 837: STDA_I	stda	%r24, [%r8 + 0x0be8] %asi
	.word 0xc3220009  ! 840: STF_R	st	%f1, [%r9, %r8]
	.word 0xf0420009  ! 840: LDSW_R	ldsw	[%r8 + %r9], %r24
	.word 0xf4921009  ! 840: LDUHA_R	lduha	[%r8, %r9] 0x80, %r26
	.word 0xc8220009  ! 843: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc3020009  ! 843: LDF_R	ld	[%r8, %r9], %f1
	.word 0x0ac20001  ! 843: BRNZ	brnz  ,nt	%8,<label_0x20001>
	.word 0xc4320009  ! 846: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xca020009  ! 846: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xa8720009  ! 846: UDIV_R	udiv 	%r8, %r9, %r20
	.word 0xfa220009  ! 849: STW_R	stw	%r29, [%r8 + %r9]
	.word 0xdc420009  ! 849: LDSW_R	ldsw	[%r8 + %r9], %r14
	.word 0x827221c4  ! 849: UDIV_I	udiv 	%r8, 0x01c4, %r1
	.word 0xc6220009  ! 852: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc6520009  ! 852: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0x22800001  ! 852: BE	be,a	<label_0x1>
	.word 0xfc720009  ! 855: STX_R	stx	%r30, [%r8 + %r9]
	.word 0xc25a0009  ! 855: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xeefa1009  ! 855: SWAPA_R	swapa	%r23, [%r8 + %r9] 0x80
	.word 0xce320009  ! 858: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xcb020009  ! 858: LDF_R	ld	[%r8, %r9], %f5
	.word 0x8b222e38  ! 858: MULScc_I	mulscc 	%r8, 0x0e38, %r5
	.word 0xcb3a0009  ! 861: STDF_R	std	%f5, [%r9, %r8]
	.word 0xca420009  ! 861: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xc3ea1009  ! 861: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc5220009  ! 864: STF_R	st	%f2, [%r9, %r8]
	.word 0xcd1a0009  ! 864: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0x36800001  ! 864: BGE	bge,a	<label_0x1>
	.word 0xd93a0009  ! 867: STDF_R	std	%f12, [%r9, %r8]
	.word 0xc8020009  ! 867: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xce0a2f10  ! 867: LDUB_I	ldub	[%r8 + 0x0f10], %r7
	.word 0xca220009  ! 870: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xf40a0009  ! 870: LDUB_R	ldub	[%r8 + %r9], %r26
	.word 0xc73a2260  ! 870: STDF_I	std	%f3, [0x0260, %r8]
	.word 0xcc320009  ! 873: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xcc520009  ! 873: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0x86da2338  ! 873: SMULcc_I	smulcc 	%r8, 0x0338, %r3
	.word 0xfa320009  ! 876: STH_R	sth	%r29, [%r8 + %r9]
	.word 0xcd020009  ! 876: LDF_R	ld	[%r8, %r9], %f6
	.word 0xfeb21009  ! 876: STHA_R	stha	%r31, [%r8 + %r9] 0x80
	.word 0xcd3a0009  ! 879: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc01a0009  ! 879: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0xc36a0009  ! 879: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc6720009  ! 882: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc24a0009  ! 882: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0x26ca0001  ! 882: BRLZ	brlz,a,pt	%8,<label_0xa0001>
	.word 0xdb220009  ! 885: STF_R	st	%f13, [%r9, %r8]
	.word 0xce5a0009  ! 885: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xbed20009  ! 885: UMULcc_R	umulcc 	%r8, %r9, %r31
	.word 0xff3a0009  ! 888: STDF_R	std	%f31, [%r9, %r8]
	.word 0xc84a0009  ! 888: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xde422d68  ! 888: LDSW_I	ldsw	[%r8 + 0x0d68], %r15
	.word 0xf13a0009  ! 891: STDF_R	std	%f24, [%r9, %r8]
	.word 0xc8420009  ! 891: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0x966a2510  ! 891: UDIVX_I	udivx 	%r8, 0x0510, %r11
	.word 0xdb220009  ! 894: STF_R	st	%f13, [%r9, %r8]
	.word 0xe51a0009  ! 894: LDDF_R	ldd	[%r8, %r9], %f18
	.word 0x0ac20001  ! 894: BRNZ	brnz  ,nt	%8,<label_0x20001>
	.word 0xe13a0009  ! 897: STDF_R	std	%f16, [%r9, %r8]
	.word 0xca020009  ! 897: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xb1a208a9  ! 897: FSUBs	fsubs	%f8, %f9, %f24
	.word 0xc8220009  ! 900: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xca0a0009  ! 900: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xa5a209a9  ! 900: FDIVs	fdivs	%f8, %f9, %f18
	.word 0xea220009  ! 903: STW_R	stw	%r21, [%r8 + %r9]
	.word 0xc6520009  ! 903: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0x02800001  ! 903: BE	be  	<label_0x1>
	.word 0xcc320009  ! 906: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc2520009  ! 906: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xc4ca24a8  ! 906: LDSBA_I	ldsba	[%r8, + 0x04a8] %asi, %r2
	.word 0xcb220009  ! 909: STF_R	st	%f5, [%r9, %r8]
	.word 0xe2120009  ! 909: LDUH_R	lduh	[%r8 + %r9], %r17
	.word 0x85a20829  ! 909: FADDs	fadds	%f8, %f9, %f2
	.word 0xca720009  ! 912: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xcb1a0009  ! 912: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xcf1a2920  ! 912: LDDF_I	ldd	[%r8, 0x0920], %f7
	.word 0xe7220009  ! 915: STF_R	st	%f19, [%r9, %r8]
	.word 0xcd1a0009  ! 915: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xba520009  ! 915: UMUL_R	umul 	%r8, %r9, %r29
	.word 0xc3220009  ! 918: STF_R	st	%f1, [%r9, %r8]
	.word 0xcb020009  ! 918: LDF_R	ld	[%r8, %r9], %f5
	.word 0x9ba20829  ! 918: FADDs	fadds	%f8, %f9, %f13
	.word 0xc6220009  ! 921: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc2520009  ! 921: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xde0a0009  ! 921: LDUB_R	ldub	[%r8 + %r9], %r15
	.word 0xc3220009  ! 924: STF_R	st	%f1, [%r9, %r8]
	.word 0xcb020009  ! 924: LDF_R	ld	[%r8, %r9], %f5
	.word 0xf89a27c0  ! 924: LDDA_I	ldda	[%r8, + 0x07c0] %asi, %r28
	.word 0xca320009  ! 927: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc6420009  ! 927: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xc80223e8  ! 927: LDUW_I	lduw	[%r8 + 0x03e8], %r4
	.word 0xe8320009  ! 930: STH_R	sth	%r20, [%r8 + %r9]
	.word 0xc3020009  ! 930: LDF_R	ld	[%r8, %r9], %f1
	.word 0xc3ea1009  ! 930: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc2220009  ! 933: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc7020009  ! 933: LDF_R	ld	[%r8, %r9], %f3
	.word 0x8143c000  ! 933: STBAR	stbar
	.word 0xec320009  ! 936: STH_R	sth	%r22, [%r8 + %r9]
	.word 0xc80a0009  ! 936: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xc6d21009  ! 936: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r3
	.word 0xfe2a0009  ! 939: STB_R	stb	%r31, [%r8 + %r9]
	.word 0xc2520009  ! 939: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0x9fa209a9  ! 939: FDIVs	fdivs	%f8, %f9, %f15
	.word 0xcc320009  ! 942: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xca020009  ! 942: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0x24800001  ! 942: BLE	ble,a	<label_0x1>
	.word 0xc6720009  ! 945: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc84a0009  ! 945: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0x00800001  ! 945: BN	bn  	<label_0x1>
	.word 0xc62a0009  ! 948: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xd6520009  ! 948: LDSH_R	ldsh	[%r8 + %r9], %r11
	.word 0xc36a0009  ! 948: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xce220009  ! 951: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xcf020009  ! 951: LDF_R	ld	[%r8, %r9], %f7
	.word 0xd6ea1009  ! 951: LDSTUBA_R	ldstuba	%r11, [%r8 + %r9] 0x80
	.word 0xc4320009  ! 954: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc8120009  ! 954: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0x8f222b0c  ! 954: MULScc_I	mulscc 	%r8, 0x0b0c, %r7
	.word 0xf9220009  ! 957: STF_R	st	%f28, [%r9, %r8]
	.word 0xec4a0009  ! 957: LDSB_R	ldsb	[%r8 + %r9], %r22
	.word 0x8efa0009  ! 957: SDIVcc_R	sdivcc 	%r8, %r9, %r7
	.word 0xca2a0009  ! 960: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xcc1a0009  ! 960: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xec821009  ! 960: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r22
	.word 0xfa720009  ! 963: STX_R	stx	%r29, [%r8 + %r9]
	.word 0xc20a0009  ! 963: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0x8a4a0009  ! 963: MULX_R	mulx 	%r8, %r9, %r5
	.word 0xc9220009  ! 966: STF_R	st	%f4, [%r9, %r8]
	.word 0xc2120009  ! 966: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xe4f21009  ! 966: STXA_R	stxa	%r18, [%r8 + %r9] 0x80
	.word 0xc6220009  ! 969: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xd84a0009  ! 969: LDSB_R	ldsb	[%r8 + %r9], %r12
	.word 0x8e7a2b08  ! 969: SDIV_I	sdiv 	%r8, 0x0b08, %r7
	.word 0xcf220009  ! 972: STF_R	st	%f7, [%r9, %r8]
	.word 0xc80a0009  ! 972: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xbda20829  ! 972: FADDs	fadds	%f8, %f9, %f30
	.word 0xc8320009  ! 975: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xce0a0009  ! 975: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0x8d6a2434  ! 975: SDIVX_I	sdivx	%r8, 0x0434, %r6
	.word 0xe62a0009  ! 978: STB_R	stb	%r19, [%r8 + %r9]
	.word 0xcf020009  ! 978: LDF_R	ld	[%r8, %r9], %f7
	.word 0xaeda2db8  ! 978: SMULcc_I	smulcc 	%r8, 0x0db8, %r23
	.word 0xca720009  ! 981: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xe8020009  ! 981: LDUW_R	lduw	[%r8 + %r9], %r20
	.word 0xe49a1009  ! 981: LDDA_R	ldda	[%r8, %r9] 0x80, %r18
	.word 0xd6320009  ! 984: STH_R	sth	%r11, [%r8 + %r9]
	.word 0xc6120009  ! 984: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xea0a2de8  ! 984: LDUB_I	ldub	[%r8 + 0x0de8], %r21
	.word 0xc2320009  ! 987: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc81a0009  ! 987: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xcb3a0009  ! 987: STDF_R	std	%f5, [%r9, %r8]
	.word 0xc9220009  ! 990: STF_R	st	%f4, [%r9, %r8]
	.word 0xee0a0009  ! 990: LDUB_R	ldub	[%r8 + %r9], %r23
	.word 0xb67229dc  ! 990: UDIV_I	udiv 	%r8, 0x09dc, %r27
	.word 0xc93a0009  ! 993: STDF_R	std	%f4, [%r9, %r8]
	.word 0xc60a0009  ! 993: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xccfa2f88  ! 993: SWAPA_I	swapa	%r6, [%r8 + 0x0f88] %asi
	.word 0xc2220009  ! 996: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xce120009  ! 996: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0x84da0009  ! 996: SMULcc_R	smulcc 	%r8, %r9, %r2
	.word 0xc2220009  ! 999: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xce420009  ! 999: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0x0e800001  ! 999: BVS	bvs  	<label_0x1>
	.word 0xcf220009  ! 1002: STF_R	st	%f7, [%r9, %r8]
	.word 0xde5a0009  ! 1002: LDX_R	ldx	[%r8 + %r9], %r15
	.word 0xc36a29c4  ! 1002: PREFETCH_I	prefetch	[%r8 + 0x09c4], #one_read
	.word 0xf6220009  ! 1005: STW_R	stw	%r27, [%r8 + %r9]
	.word 0xcc120009  ! 1005: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xe8821009  ! 1005: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r20
	.word 0xe2720009  ! 1008: STX_R	stx	%r17, [%r8 + %r9]
	.word 0xc4020009  ! 1008: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0x8143c000  ! 1008: STBAR	stbar
	.word 0xc62a0009  ! 1011: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc45a0009  ! 1011: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xc3ea2e20  ! 1011: PREFETCHA_I	prefetcha	[%r8, + 0x0e20] %asi, #one_read
	.word 0xc2320009  ! 1014: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xe71a0009  ! 1014: LDDF_R	ldd	[%r8, %r9], %f19
	.word 0x8143e072  ! 1014: MEMBAR	membar	#StoreLoad | #Lookaside | #MemIssue | #Sync 
	.word 0xce320009  ! 1017: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xca120009  ! 1017: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xac7a249c  ! 1017: SDIV_I	sdiv 	%r8, 0x049c, %r22
	.word 0xc62a0009  ! 1020: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc8020009  ! 1020: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0x825220d8  ! 1020: UMUL_I	umul 	%r8, 0x00d8, %r1
	.word 0xc5220009  ! 1023: STF_R	st	%f2, [%r9, %r8]
	.word 0xc4020009  ! 1023: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xc3ea1009  ! 1023: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc6320009  ! 1026: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xca120009  ! 1026: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0x8fa20929  ! 1026: FMULs	fmuls	%f8, %f9, %f7
	.word 0xc93a0009  ! 1029: STDF_R	std	%f4, [%r9, %r8]
	.word 0xc80a0009  ! 1029: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0x8cd20009  ! 1029: UMULcc_R	umulcc 	%r8, %r9, %r6
	.word 0xce320009  ! 1032: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc24a0009  ! 1032: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xbfa20829  ! 1032: FADDs	fadds	%f8, %f9, %f31
	.word 0xc2320009  ! 1035: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xd81a0009  ! 1035: LDD_R	ldd	[%r8 + %r9], %r12
	.word 0x8143e048  ! 1035: MEMBAR	membar	#StoreStore | #Sync 
	.word 0xd6720009  ! 1038: STX_R	stx	%r11, [%r8 + %r9]
	.word 0xc2020009  ! 1038: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xceea1009  ! 1038: LDSTUBA_R	ldstuba	%r7, [%r8 + %r9] 0x80
	.word 0xca220009  ! 1041: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc45a0009  ! 1041: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0x08800001  ! 1041: BLEU	bleu  	<label_0x1>
	.word 0xc33a0009  ! 1044: STDF_R	std	%f1, [%r9, %r8]
	.word 0xcc0a0009  ! 1044: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xe2020009  ! 1044: LDUW_R	lduw	[%r8 + %r9], %r17
	.word 0xc4320009  ! 1047: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xee520009  ! 1047: LDSH_R	ldsh	[%r8 + %r9], %r23
	.word 0xc36a2534  ! 1047: PREFETCH_I	prefetch	[%r8 + 0x0534], #one_read
	.word 0xc82a0009  ! 1050: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xcc0a0009  ! 1050: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0x40000001  ! 1050: CALL	call	disp30_1
	.word 0xdc720009  ! 1053: STX_R	stx	%r14, [%r8 + %r9]
	.word 0xe4120009  ! 1053: LDUH_R	lduh	[%r8 + %r9], %r18
	.word 0xceaa2774  ! 1053: STBA_I	stba	%r7, [%r8 + 0x0774] %asi
	.word 0xc8320009  ! 1056: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xca0a0009  ! 1056: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0x8a4a0009  ! 1056: MULX_R	mulx 	%r8, %r9, %r5
	.word 0xc4720009  ! 1059: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xda5a0009  ! 1059: LDX_R	ldx	[%r8 + %r9], %r13
	.word 0x08800002  ! 1059: BLEU	bleu  	<label_0x2>
	.word 0xcd3a0009  ! 1062: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc60a0009  ! 1062: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0x85220009  ! 1062: MULScc_R	mulscc 	%r8, %r9, %r2
	.word 0xfe720009  ! 1065: STX_R	stx	%r31, [%r8 + %r9]
	.word 0xc2120009  ! 1065: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0x34800002  ! 1065: BG	bg,a	<label_0x2>
	.word 0xc42a0009  ! 1068: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc2420009  ! 1068: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xc3ea2d04  ! 1068: PREFETCHA_I	prefetcha	[%r8, + 0x0d04] %asi, #one_read
	.word 0xeb220009  ! 1071: STF_R	st	%f21, [%r9, %r8]
	.word 0xcc1a0009  ! 1071: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xbba20829  ! 1071: FADDs	fadds	%f8, %f9, %f29
	.word 0xf82a0009  ! 1074: STB_R	stb	%r28, [%r8 + %r9]
	.word 0xc8120009  ! 1074: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0x8c7a0009  ! 1074: SDIV_R	sdiv 	%r8, %r9, %r6
	.word 0xfe720009  ! 1077: STX_R	stx	%r31, [%r8 + %r9]
	.word 0xc2520009  ! 1077: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xc36a2248  ! 1077: PREFETCH_I	prefetch	[%r8 + 0x0248], #one_read
	.word 0xc9220009  ! 1080: STF_R	st	%f4, [%r9, %r8]
	.word 0xca4a0009  ! 1080: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xe4aa2998  ! 1080: STBA_I	stba	%r18, [%r8 + 0x0998] %asi
	.word 0xcc2a0009  ! 1083: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc6520009  ! 1083: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xe6f22a88  ! 1083: STXA_I	stxa	%r19, [%r8 + 0x0a88] %asi
	.word 0xc73a0009  ! 1086: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc71a0009  ! 1086: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0x8143e035  ! 1086: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside | #MemIssue 
	.word 0xc6320009  ! 1089: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc7020009  ! 1089: LDF_R	ld	[%r8, %r9], %f3
	.word 0xc2f22330  ! 1089: STXA_I	stxa	%r1, [%r8 + 0x0330] %asi
	.word 0xcd220009  ! 1092: STF_R	st	%f6, [%r9, %r8]
	.word 0xf51a0009  ! 1092: LDDF_R	ldd	[%r8, %r9], %f26
	.word 0xcc922154  ! 1092: LDUHA_I	lduha	[%r8, + 0x0154] %asi, %r6
	.word 0xfc320009  ! 1095: STH_R	sth	%r30, [%r8 + %r9]
	.word 0xf64a0009  ! 1095: LDSB_R	ldsb	[%r8 + %r9], %r27
	.word 0xb87a271c  ! 1095: SDIV_I	sdiv 	%r8, 0x071c, %r28
	.word 0xf73a0009  ! 1098: STDF_R	std	%f27, [%r9, %r8]
	.word 0xc85a0009  ! 1098: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0x24ca0001  ! 1098: BRLEZ	brlez,a,pt	%8,<label_0xa0001>
	.word 0xc53a0009  ! 1101: STDF_R	std	%f2, [%r9, %r8]
	.word 0xeb020009  ! 1101: LDF_R	ld	[%r8, %r9], %f21
	.word 0xc3ea2d88  ! 1101: PREFETCHA_I	prefetcha	[%r8, + 0x0d88] %asi, #one_read
	.word 0xf2320009  ! 1104: STH_R	sth	%r25, [%r8 + %r9]
	.word 0xdc020009  ! 1104: LDUW_R	lduw	[%r8 + %r9], %r14
	.word 0x867a21f4  ! 1104: SDIV_I	sdiv 	%r8, 0x01f4, %r3
	.word 0xd6220009  ! 1107: STW_R	stw	%r11, [%r8 + %r9]
	.word 0xca520009  ! 1107: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xc36a0009  ! 1107: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xcc2a0009  ! 1110: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xfc420009  ! 1110: LDSW_R	ldsw	[%r8 + %r9], %r30
	.word 0xf0921009  ! 1110: LDUHA_R	lduha	[%r8, %r9] 0x80, %r24
	.word 0xc22a0009  ! 1113: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc9020009  ! 1113: LDF_R	ld	[%r8, %r9], %f4
	.word 0xc3ea2544  ! 1113: PREFETCHA_I	prefetcha	[%r8, + 0x0544] %asi, #one_read
	.word 0xcd220009  ! 1116: STF_R	st	%f6, [%r9, %r8]
	.word 0xc4420009  ! 1116: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xcaaa1009  ! 1116: STBA_R	stba	%r5, [%r8 + %r9] 0x80
	.word 0xf42a0009  ! 1119: STB_R	stb	%r26, [%r8 + %r9]
	.word 0xe84a0009  ! 1119: LDSB_R	ldsb	[%r8 + %r9], %r20
	.word 0xce7a0009  ! 1119: SWAP_R	swap	%r7, [%r8 + %r9]
	.word 0xf0320009  ! 1122: STH_R	sth	%r24, [%r8 + %r9]
	.word 0xcd020009  ! 1122: LDF_R	ld	[%r8, %r9], %f6
	.word 0x2cc20001  ! 1122: BRGZ	brgz,a,nt	%8,<label_0x20001>
	.word 0xc2220009  ! 1125: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc45a0009  ! 1125: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xd9e22009  ! 1125: CASA_R	casa	[%r8] %asi, %r9, %r12
	.word 0xc2720009  ! 1128: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xfc4a0009  ! 1128: LDSB_R	ldsb	[%r8 + %r9], %r30
	.word 0xe2822928  ! 1128: LDUWA_I	lduwa	[%r8, + 0x0928] %asi, %r17
	.word 0xcc2a0009  ! 1131: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xf24a0009  ! 1131: LDSB_R	ldsb	[%r8 + %r9], %r25
	.word 0xe46a0009  ! 1131: LDSTUB_R	ldstub	%r18, [%r8 + %r9]
	.word 0xc4320009  ! 1134: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xcc520009  ! 1134: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xa2f22ef4  ! 1134: UDIVcc_I	udivcc 	%r8, 0x0ef4, %r17
	.word 0xc6320009  ! 1137: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xca5a0009  ! 1137: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xdaea20b8  ! 1137: LDSTUBA_I	ldstuba	%r13, [%r8 + 0x00b8] %asi
	.word 0xec220009  ! 1140: STW_R	stw	%r22, [%r8 + %r9]
	.word 0xcc4a0009  ! 1140: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0x06800002  ! 1140: BL	bl  	<label_0x2>
	.word 0xe5220009  ! 1143: STF_R	st	%f18, [%r9, %r8]
	.word 0xce0a0009  ! 1143: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0x8da20829  ! 1143: FADDs	fadds	%f8, %f9, %f6
	.word 0xf8220009  ! 1146: STW_R	stw	%r28, [%r8 + %r9]
	.word 0xec1a0009  ! 1146: LDD_R	ldd	[%r8 + %r9], %r22
	.word 0xc44a0009  ! 1146: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xce320009  ! 1149: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc41a0009  ! 1149: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x8b222fe0  ! 1149: MULScc_I	mulscc 	%r8, 0x0fe0, %r5
	.word 0xc8720009  ! 1152: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc4420009  ! 1152: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0x06800001  ! 1152: BL	bl  	<label_0x1>
	.word 0xcb3a0009  ! 1155: STDF_R	std	%f5, [%r9, %r8]
	.word 0xcc420009  ! 1155: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xecca2aa8  ! 1155: LDSBA_I	ldsba	[%r8, + 0x0aa8] %asi, %r22
	.word 0xc62a0009  ! 1158: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xe0420009  ! 1158: LDSW_R	ldsw	[%r8 + %r9], %r16
	.word 0xccf21009  ! 1158: STXA_R	stxa	%r6, [%r8 + %r9] 0x80
	.word 0xe9220009  ! 1161: STF_R	st	%f20, [%r9, %r8]
	.word 0xcb1a0009  ! 1161: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0x84fa2da0  ! 1161: SDIVcc_I	sdivcc 	%r8, 0x0da0, %r2
	.word 0xfa2a0009  ! 1164: STB_R	stb	%r29, [%r8 + %r9]
	.word 0xec020009  ! 1164: LDUW_R	lduw	[%r8 + %r9], %r22
	.word 0x8143e055  ! 1164: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside | #Sync 
	.word 0xc62a0009  ! 1167: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc85a0009  ! 1167: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xdcb22994  ! 1167: STHA_I	stha	%r14, [%r8 + 0x0994] %asi
	.word 0xde720009  ! 1170: STX_R	stx	%r15, [%r8 + %r9]
	.word 0xca020009  ! 1170: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0x22800002  ! 1170: BE	be,a	<label_0x2>
	.word 0xcb3a0009  ! 1173: STDF_R	std	%f5, [%r9, %r8]
	.word 0xc41a0009  ! 1173: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xdaf21009  ! 1173: STXA_R	stxa	%r13, [%r8 + %r9] 0x80
	.word 0xc42a0009  ! 1176: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc4020009  ! 1176: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xbafa29b8  ! 1176: SDIVcc_I	sdivcc 	%r8, 0x09b8, %r29
	.word 0xe7220009  ! 1179: STF_R	st	%f19, [%r9, %r8]
	.word 0xc6420009  ! 1179: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0x8e7a0009  ! 1179: SDIV_R	sdiv 	%r8, %r9, %r7
	.word 0xc8720009  ! 1182: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xfe5a0009  ! 1182: LDX_R	ldx	[%r8 + %r9], %r31
	.word 0xe49a1009  ! 1182: LDDA_R	ldda	[%r8, %r9] 0x80, %r18
	.word 0xc2720009  ! 1185: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc41a0009  ! 1185: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x8143e05a  ! 1185: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside | #Sync 
	.word 0xcc220009  ! 1188: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xcc020009  ! 1188: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xc0ba2398  ! 1188: STDA_I	stda	%r0, [%r8 + 0x0398] %asi
	.word 0xf5220009  ! 1191: STF_R	st	%f26, [%r9, %r8]
	.word 0xc65a0009  ! 1191: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0x8143c000  ! 1191: STBAR	stbar
	.word 0xf1220009  ! 1194: STF_R	st	%f24, [%r9, %r8]
	.word 0xca120009  ! 1194: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xae5a2f88  ! 1194: SMUL_I	smul 	%r8, 0x0f88, %r23
	.word 0xc22a0009  ! 1197: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xe4420009  ! 1197: LDSW_R	ldsw	[%r8 + %r9], %r18
	.word 0x26800002  ! 1197: BL	bl,a	<label_0x2>
	.word 0xe22a0009  ! 1200: STB_R	stb	%r17, [%r8 + %r9]
	.word 0xca4a0009  ! 1200: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0x8143c000  ! 1200: STBAR	stbar
	.word 0xca320009  ! 1203: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xfa520009  ! 1203: LDSH_R	ldsh	[%r8 + %r9], %r29
	.word 0x964a2b18  ! 1203: MULX_I	mulx 	%r8, 0x0b18, %r11
	.word 0xec220009  ! 1206: STW_R	stw	%r22, [%r8 + %r9]
	.word 0xc2020009  ! 1206: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xc3ea1009  ! 1206: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc42a0009  ! 1209: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc8520009  ! 1209: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0x8e6a2c3c  ! 1209: UDIVX_I	udivx 	%r8, 0x0c3c, %r7
	.word 0xdb220009  ! 1212: STF_R	st	%f13, [%r9, %r8]
	.word 0xf71a0009  ! 1212: LDDF_R	ldd	[%r8, %r9], %f27
	.word 0x8a7228c8  ! 1212: UDIV_I	udiv 	%r8, 0x08c8, %r5
	.word 0xce2a0009  ! 1215: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xce0a0009  ! 1215: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0x865a2f30  ! 1215: SMUL_I	smul 	%r8, 0x0f30, %r3
	.word 0xce720009  ! 1218: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xca4a0009  ! 1218: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xe2d227ac  ! 1218: LDSHA_I	ldsha	[%r8, + 0x07ac] %asi, %r17
	.word 0xf02a0009  ! 1221: STB_R	stb	%r24, [%r8 + %r9]
	.word 0xc8120009  ! 1221: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xc3ea1009  ! 1221: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xfa2a0009  ! 1224: STB_R	stb	%r29, [%r8 + %r9]
	.word 0xc4020009  ! 1224: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xccea22c4  ! 1224: LDSTUBA_I	ldstuba	%r6, [%r8 + 0x02c4] %asi
	.word 0xfb220009  ! 1227: STF_R	st	%f29, [%r9, %r8]
	.word 0xcd020009  ! 1227: LDF_R	ld	[%r8, %r9], %f6
	.word 0xc66a24e8  ! 1227: LDSTUB_I	ldstub	%r3, [%r8 + 0x04e8]
	.word 0xc33a0009  ! 1230: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc60a0009  ! 1230: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xc3ea2cb4  ! 1230: PREFETCHA_I	prefetcha	[%r8, + 0x0cb4] %asi, #one_read
	.word 0xc8720009  ! 1233: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xfc0a0009  ! 1233: LDUB_R	ldub	[%r8 + %r9], %r30
	.word 0x12800002  ! 1233: BNE	bne  	<label_0x2>
	.word 0xdc220009  ! 1236: STW_R	stw	%r14, [%r8 + %r9]
	.word 0xe80a0009  ! 1236: LDUB_R	ldub	[%r8 + %r9], %r20
	.word 0x8143e074  ! 1236: MEMBAR	membar	#LoadStore | #Lookaside | #MemIssue | #Sync 
	.word 0xde320009  ! 1239: STH_R	sth	%r15, [%r8 + %r9]
	.word 0xcb1a0009  ! 1239: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xc68a2334  ! 1239: LDUBA_I	lduba	[%r8, + 0x0334] %asi, %r3
	.word 0xe4720009  ! 1242: STX_R	stx	%r18, [%r8 + %r9]
	.word 0xca020009  ! 1242: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xc3ea1009  ! 1242: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xca320009  ! 1245: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xcc520009  ! 1245: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xcac22100  ! 1245: LDSWA_I	ldswa	[%r8, + 0x0100] %asi, %r5
	.word 0xc6720009  ! 1248: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc2520009  ! 1248: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xc2d21009  ! 1248: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r1
	.word 0xc4320009  ! 1251: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xce520009  ! 1251: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0x8a5a215c  ! 1251: SMUL_I	smul 	%r8, 0x015c, %r5
	.word 0xc8220009  ! 1254: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xfd020009  ! 1254: LDF_R	ld	[%r8, %r9], %f30
	.word 0xceea24b0  ! 1254: LDSTUBA_I	ldstuba	%r7, [%r8 + 0x04b0] %asi
	.word 0xc73a0009  ! 1257: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc6020009  ! 1257: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xc2522874  ! 1257: LDSH_I	ldsh	[%r8 + 0x0874], %r1
	.word 0xf82a0009  ! 1260: STB_R	stb	%r28, [%r8 + %r9]
	.word 0xc2120009  ! 1260: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xc73a0009  ! 1260: STDF_R	std	%f3, [%r9, %r8]
	.word 0xcf220009  ! 1263: STF_R	st	%f7, [%r9, %r8]
	.word 0xcf020009  ! 1263: LDF_R	ld	[%r8, %r9], %f7
	.word 0xcaea2500  ! 1263: LDSTUBA_I	ldstuba	%r5, [%r8 + 0x0500] %asi
	.word 0xc22a0009  ! 1266: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc2120009  ! 1266: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xa1222f9c  ! 1266: MULScc_I	mulscc 	%r8, 0x0f9c, %r16
	.word 0xda720009  ! 1269: STX_R	stx	%r13, [%r8 + %r9]
	.word 0xe0120009  ! 1269: LDUH_R	lduh	[%r8 + %r9], %r16
	.word 0x85a208a9  ! 1269: FSUBs	fsubs	%f8, %f9, %f2
	.word 0xe4320009  ! 1272: STH_R	sth	%r18, [%r8 + %r9]
	.word 0xc44a0009  ! 1272: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xb8520009  ! 1272: UMUL_R	umul 	%r8, %r9, %r28
	.word 0xce2a0009  ! 1275: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xf2120009  ! 1275: LDUH_R	lduh	[%r8 + %r9], %r25
	.word 0xb8fa0009  ! 1275: SDIVcc_R	sdivcc 	%r8, %r9, %r28
	.word 0xc73a0009  ! 1278: STDF_R	std	%f3, [%r9, %r8]
	.word 0xd84a0009  ! 1278: LDSB_R	ldsb	[%r8 + %r9], %r12
	.word 0x28800001  ! 1278: BLEU	bleu,a	<label_0x1>
	.word 0xc93a0009  ! 1281: STDF_R	std	%f4, [%r9, %r8]
	.word 0xca4a0009  ! 1281: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xced21009  ! 1281: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r7
	.word 0xea720009  ! 1284: STX_R	stx	%r21, [%r8 + %r9]
	.word 0xcb020009  ! 1284: LDF_R	ld	[%r8, %r9], %f5
	.word 0x84d20009  ! 1284: UMULcc_R	umulcc 	%r8, %r9, %r2
	.word 0xec220009  ! 1287: STW_R	stw	%r22, [%r8 + %r9]
	.word 0xc6020009  ! 1287: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0x9a4a0009  ! 1287: MULX_R	mulx 	%r8, %r9, %r13
	.word 0xcc320009  ! 1290: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xcf1a0009  ! 1290: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xfd020009  ! 1290: LDF_R	ld	[%r8, %r9], %f30
	.word 0xff220009  ! 1293: STF_R	st	%f31, [%r9, %r8]
	.word 0xce420009  ! 1293: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0x85a209a9  ! 1293: FDIVs	fdivs	%f8, %f9, %f2
	.word 0xe6220009  ! 1296: STW_R	stw	%r19, [%r8 + %r9]
	.word 0xc4120009  ! 1296: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0x8143c000  ! 1296: STBAR	stbar
	.word 0xc42a0009  ! 1299: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc64a0009  ! 1299: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xceaa2a38  ! 1299: STBA_I	stba	%r7, [%r8 + 0x0a38] %asi
	.word 0xc82a0009  ! 1302: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xce4a0009  ! 1302: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xc8921009  ! 1302: LDUHA_R	lduha	[%r8, %r9] 0x80, %r4
	.word 0xe73a0009  ! 1305: STDF_R	std	%f19, [%r9, %r8]
	.word 0xc7020009  ! 1305: LDF_R	ld	[%r8, %r9], %f3
	.word 0xc2da2a28  ! 1305: LDXA_I	ldxa	[%r8, + 0x0a28] %asi, %r1
	.word 0xe6220009  ! 1308: STW_R	stw	%r19, [%r8 + %r9]
	.word 0xc44a0009  ! 1308: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xfcf229a8  ! 1308: STXA_I	stxa	%r30, [%r8 + 0x09a8] %asi
	.word 0xc6220009  ! 1311: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc2420009  ! 1311: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xa5a209a9  ! 1311: FDIVs	fdivs	%f8, %f9, %f18
	.word 0xf22a0009  ! 1314: STB_R	stb	%r25, [%r8 + %r9]
	.word 0xca0a0009  ! 1314: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0x9c7a2d54  ! 1314: SDIV_I	sdiv 	%r8, 0x0d54, %r14
	.word 0xc62a0009  ! 1317: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xf91a0009  ! 1317: LDDF_R	ldd	[%r8, %r9], %f28
	.word 0x24800001  ! 1317: BLE	ble,a	<label_0x1>
	.word 0xdf220009  ! 1320: STF_R	st	%f15, [%r9, %r8]
	.word 0xce420009  ! 1320: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xca120009  ! 1320: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xc9220009  ! 1323: STF_R	st	%f4, [%r9, %r8]
	.word 0xc41a0009  ! 1323: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xc44a2644  ! 1323: LDSB_I	ldsb	[%r8 + 0x0644], %r2
	.word 0xc22a0009  ! 1326: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xf0520009  ! 1326: LDSH_R	ldsh	[%r8 + %r9], %r24
	.word 0xb76a2694  ! 1326: SDIVX_I	sdivx	%r8, 0x0694, %r27
	.word 0xc73a0009  ! 1329: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc6520009  ! 1329: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xf242200c  ! 1329: LDSW_I	ldsw	[%r8 + 0x000c], %r25
	.word 0xf62a0009  ! 1332: STB_R	stb	%r27, [%r8 + %r9]
	.word 0xc24a0009  ! 1332: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xeeea1009  ! 1332: LDSTUBA_R	ldstuba	%r23, [%r8 + %r9] 0x80
	.word 0xdd220009  ! 1335: STF_R	st	%f14, [%r9, %r8]
	.word 0xc6420009  ! 1335: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xc86a0009  ! 1335: LDSTUB_R	ldstub	%r4, [%r8 + %r9]
	.word 0xc93a0009  ! 1338: STDF_R	std	%f4, [%r9, %r8]
	.word 0xc44a0009  ! 1338: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xceaa1009  ! 1338: STBA_R	stba	%r7, [%r8 + %r9] 0x80
	.word 0xca720009  ! 1341: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc6020009  ! 1341: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0x8f6a2998  ! 1341: SDIVX_I	sdivx	%r8, 0x0998, %r7
	.word 0xc8220009  ! 1344: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc2020009  ! 1344: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0x8a6a0009  ! 1344: UDIVX_R	udivx 	%r8, %r9, %r5
	.word 0xe02a0009  ! 1347: STB_R	stb	%r16, [%r8 + %r9]
	.word 0xc6120009  ! 1347: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xc3ea246c  ! 1347: PREFETCHA_I	prefetcha	[%r8, + 0x046c] %asi, #one_read
	.word 0xc33a0009  ! 1350: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc6520009  ! 1350: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xc7022f60  ! 1350: LDF_I	ld	[%r8, 0x0f60], %f3
	.word 0xc22a0009  ! 1353: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xcc120009  ! 1353: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xc4ba1009  ! 1353: STDA_R	stda	%r2, [%r8 + %r9] 0x80
	.word 0xe5220009  ! 1356: STF_R	st	%f18, [%r9, %r8]
	.word 0xc85a0009  ! 1356: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xccea1009  ! 1356: LDSTUBA_R	ldstuba	%r6, [%r8 + %r9] 0x80
	.word 0xcb3a0009  ! 1359: STDF_R	std	%f5, [%r9, %r8]
	.word 0xc51a0009  ! 1359: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0x8143c000  ! 1359: STBAR	stbar
	.word 0xed220009  ! 1362: STF_R	st	%f22, [%r9, %r8]
	.word 0xf4020009  ! 1362: LDUW_R	lduw	[%r8 + %r9], %r26
	.word 0xdcea1009  ! 1362: LDSTUBA_R	ldstuba	%r14, [%r8 + %r9] 0x80
	.word 0xc2320009  ! 1365: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc41a0009  ! 1365: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x8c720009  ! 1365: UDIV_R	udiv 	%r8, %r9, %r6
	.word 0xf0720009  ! 1368: STX_R	stx	%r24, [%r8 + %r9]
	.word 0xf11a0009  ! 1368: LDDF_R	ldd	[%r8, %r9], %f24
	.word 0x84da2ae8  ! 1368: SMULcc_I	smulcc 	%r8, 0x0ae8, %r2
	.word 0xc7220009  ! 1371: STF_R	st	%f3, [%r9, %r8]
	.word 0xc2520009  ! 1371: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0x992226b0  ! 1371: MULScc_I	mulscc 	%r8, 0x06b0, %r12
	.word 0xfc2a0009  ! 1374: STB_R	stb	%r30, [%r8 + %r9]
	.word 0xc4420009  ! 1374: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xc6f22ad0  ! 1374: STXA_I	stxa	%r3, [%r8 + 0x0ad0] %asi
	.word 0xc2320009  ! 1377: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xce0a0009  ! 1377: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0x28800001  ! 1377: BLEU	bleu,a	<label_0x1>
	.word 0xc82a0009  ! 1380: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xe4120009  ! 1380: LDUH_R	lduh	[%r8 + %r9], %r18
	.word 0x84fa2670  ! 1380: SDIVcc_I	sdivcc 	%r8, 0x0670, %r2
	.word 0xcd3a0009  ! 1383: STDF_R	std	%f6, [%r9, %r8]
	.word 0xcf1a0009  ! 1383: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xce520009  ! 1383: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xca2a0009  ! 1386: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xe00a0009  ! 1386: LDUB_R	ldub	[%r8 + %r9], %r16
	.word 0xc36a0009  ! 1386: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc93a0009  ! 1389: STDF_R	std	%f4, [%r9, %r8]
	.word 0xc2020009  ! 1389: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xc3ea2340  ! 1389: PREFETCHA_I	prefetcha	[%r8, + 0x0340] %asi, #one_read
	.word 0xc33a0009  ! 1392: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc25a0009  ! 1392: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xe13a2458  ! 1392: STDF_I	std	%f16, [0x0458, %r8]
	.word 0xca2a0009  ! 1395: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc41a0009  ! 1395: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x856a205c  ! 1395: SDIVX_I	sdivx	%r8, 0x005c, %r2
	.word 0xe1220009  ! 1398: STF_R	st	%f16, [%r9, %r8]
	.word 0xfe420009  ! 1398: LDSW_R	ldsw	[%r8 + %r9], %r31
	.word 0x18800001  ! 1398: BGU	bgu  	<label_0x1>
	.word 0xfd220009  ! 1401: STF_R	st	%f30, [%r9, %r8]
	.word 0xcc1a0009  ! 1401: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0x20800001  ! 1401: BN	bn,a	<label_0x1>
	.word 0xd6720009  ! 1404: STX_R	stx	%r11, [%r8 + %r9]
	.word 0xd8020009  ! 1404: LDUW_R	lduw	[%r8 + %r9], %r12
	.word 0xeada1009  ! 1404: LDXA_R	ldxa	[%r8, %r9] 0x80, %r21
	.word 0xc6720009  ! 1407: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xe91a0009  ! 1407: LDDF_R	ldd	[%r8, %r9], %f20
	.word 0xea0a0009  ! 1407: LDUB_R	ldub	[%r8 + %r9], %r21
	.word 0xc2320009  ! 1410: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xcc1a0009  ! 1410: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xc65a2cf0  ! 1410: LDX_I	ldx	[%r8 + 0x0cf0], %r3
	.word 0xca220009  ! 1413: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xcf020009  ! 1413: LDF_R	ld	[%r8, %r9], %f7
	.word 0x8143c000  ! 1413: STBAR	stbar
	.word 0xd8720009  ! 1416: STX_R	stx	%r12, [%r8 + %r9]
	.word 0xcc4a0009  ! 1416: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xc36a29d8  ! 1416: PREFETCH_I	prefetch	[%r8 + 0x09d8], #one_read
	.word 0xc22a0009  ! 1419: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xcc420009  ! 1419: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xc3ea2cd0  ! 1419: PREFETCHA_I	prefetcha	[%r8, + 0x0cd0] %asi, #one_read
	.word 0xc4720009  ! 1422: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc6120009  ! 1422: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0x8143e00a  ! 1422: MEMBAR	membar	#StoreLoad | #StoreStore 
	.word 0xca720009  ! 1425: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xe71a0009  ! 1425: LDDF_R	ldd	[%r8, %r9], %f19
	.word 0xc6420009  ! 1425: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xcc220009  ! 1428: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc31a0009  ! 1428: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0x9e522224  ! 1428: UMUL_I	umul 	%r8, 0x0224, %r15
	.word 0xc2220009  ! 1431: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc8420009  ! 1431: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0x8c722778  ! 1431: UDIV_I	udiv 	%r8, 0x0778, %r6
	.word 0xc6220009  ! 1434: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xcc4a0009  ! 1434: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xcb222130  ! 1434: STF_I	st	%f5, [0x0130, %r8]
	.word 0xc4220009  ! 1437: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc80a0009  ! 1437: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xc5220009  ! 1437: STF_R	st	%f2, [%r9, %r8]
	.word 0xf42a0009  ! 1440: STB_R	stb	%r26, [%r8 + %r9]
	.word 0xc81a0009  ! 1440: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x8143c000  ! 1440: STBAR	stbar
	.word 0xca320009  ! 1443: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xec5a0009  ! 1443: LDX_R	ldx	[%r8 + %r9], %r22
	.word 0xc36a20e0  ! 1443: PREFETCH_I	prefetch	[%r8 + 0x00e0], #one_read
	.word 0xca220009  ! 1446: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc8420009  ! 1446: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0x02800001  ! 1446: BE	be  	<label_0x1>
	.word 0xe2720009  ! 1449: STX_R	stx	%r17, [%r8 + %r9]
	.word 0xc8420009  ! 1449: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0x8a6a2358  ! 1449: UDIVX_I	udivx 	%r8, 0x0358, %r5
	.word 0xc2320009  ! 1452: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc45a0009  ! 1452: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0x8143e013  ! 1452: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside 
	.word 0xc2320009  ! 1455: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc81a0009  ! 1455: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xeaf21009  ! 1455: STXA_R	stxa	%r21, [%r8 + %r9] 0x80
	.word 0xcd3a0009  ! 1458: STDF_R	std	%f6, [%r9, %r8]
	.word 0xe31a0009  ! 1458: LDDF_R	ldd	[%r8, %r9], %f17
	.word 0x96fa2374  ! 1458: SDIVcc_I	sdivcc 	%r8, 0x0374, %r11
	.word 0xcb220009  ! 1461: STF_R	st	%f5, [%r9, %r8]
	.word 0xc60a0009  ! 1461: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xccb21009  ! 1461: STHA_R	stha	%r6, [%r8 + %r9] 0x80
	.word 0xd6220009  ! 1464: STW_R	stw	%r11, [%r8 + %r9]
	.word 0xc2420009  ! 1464: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xc9f22009  ! 1464: CASXA_R	casxa	[%r8]%asi, %r9, %r4
	.word 0xcf220009  ! 1467: STF_R	st	%f7, [%r9, %r8]
	.word 0xc51a0009  ! 1467: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xbe720009  ! 1467: UDIV_R	udiv 	%r8, %r9, %r31
	.word 0xe93a0009  ! 1470: STDF_R	std	%f20, [%r9, %r8]
	.word 0xd8020009  ! 1470: LDUW_R	lduw	[%r8 + %r9], %r12
	.word 0x9cfa2258  ! 1470: SDIVcc_I	sdivcc 	%r8, 0x0258, %r14
	.word 0xca2a0009  ! 1473: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc5020009  ! 1473: LDF_R	ld	[%r8, %r9], %f2
	.word 0xc2120009  ! 1473: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xca220009  ! 1476: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xfd1a0009  ! 1476: LDDF_R	ldd	[%r8, %r9], %f30
	.word 0xf73a0009  ! 1476: STDF_R	std	%f27, [%r9, %r8]
	.word 0xc2720009  ! 1479: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xf1020009  ! 1479: LDF_R	ld	[%r8, %r9], %f24
	.word 0xc49a2fe0  ! 1479: LDDA_I	ldda	[%r8, + 0x0fe0] %asi, %r2
	.word 0xcf3a0009  ! 1482: STDF_R	std	%f7, [%r9, %r8]
	.word 0xca520009  ! 1482: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0x0e800001  ! 1482: BVS	bvs  	<label_0x1>
	.word 0xc4320009  ! 1485: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xec020009  ! 1485: LDUW_R	lduw	[%r8 + %r9], %r22
	.word 0x8b220009  ! 1485: MULScc_R	mulscc 	%r8, %r9, %r5
	.word 0xc93a0009  ! 1488: STDF_R	std	%f4, [%r9, %r8]
	.word 0xc5020009  ! 1488: LDF_R	ld	[%r8, %r9], %f2
	.word 0x0cc20001  ! 1488: BRGZ	brgz  ,nt	%8,<label_0x20001>
	.word 0xc6720009  ! 1491: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc5020009  ! 1491: LDF_R	ld	[%r8, %r9], %f2
	.word 0xca921009  ! 1491: LDUHA_R	lduha	[%r8, %r9] 0x80, %r5
	.word 0xec220009  ! 1494: STW_R	stw	%r22, [%r8 + %r9]
	.word 0xec1a0009  ! 1494: LDD_R	ldd	[%r8 + %r9], %r22
	.word 0x8143c000  ! 1494: STBAR	stbar
	.word 0xcf3a0009  ! 1497: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc71a0009  ! 1497: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0x9a520009  ! 1497: UMUL_R	umul 	%r8, %r9, %r13
	.word 0xe13a0009  ! 1500: STDF_R	std	%f16, [%r9, %r8]
	.word 0xc6020009  ! 1500: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xc3ea2198  ! 1500: PREFETCHA_I	prefetcha	[%r8, + 0x0198] %asi, #one_read
	.word 0xce720009  ! 1503: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xf0020009  ! 1503: LDUW_R	lduw	[%r8 + %r9], %r24
	.word 0xce6a0009  ! 1503: LDSTUB_R	ldstub	%r7, [%r8 + %r9]
	.word 0xc2320009  ! 1506: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc71a0009  ! 1506: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xc60a0009  ! 1506: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xc2720009  ! 1509: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xfe020009  ! 1509: LDUW_R	lduw	[%r8 + %r9], %r31
	.word 0xc3ea2890  ! 1509: PREFETCHA_I	prefetcha	[%r8, + 0x0890] %asi, #one_read
	.word 0xc6720009  ! 1512: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xca4a0009  ! 1512: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0x9a5a289c  ! 1512: SMUL_I	smul 	%r8, 0x089c, %r13
	.word 0xc8220009  ! 1515: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xde120009  ! 1515: LDUH_R	lduh	[%r8 + %r9], %r15
	.word 0x8af22da8  ! 1515: UDIVcc_I	udivcc 	%r8, 0x0da8, %r5
	.word 0xc8220009  ! 1518: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xce4a0009  ! 1518: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xd73a0009  ! 1518: STDF_R	std	%f11, [%r9, %r8]
	.word 0xc6220009  ! 1521: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xce520009  ! 1521: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0x20800002  ! 1521: BN	bn,a	<label_0x2>
	.word 0xe8320009  ! 1524: STH_R	sth	%r20, [%r8 + %r9]
	.word 0xc2520009  ! 1524: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0x8c5a2488  ! 1524: SMUL_I	smul 	%r8, 0x0488, %r6
	.word 0xf7220009  ! 1527: STF_R	st	%f27, [%r9, %r8]
	.word 0xcb1a0009  ! 1527: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0x8143e036  ! 1527: MEMBAR	membar	#StoreLoad | #LoadStore | #Lookaside | #MemIssue 
	.word 0xfe320009  ! 1530: STH_R	sth	%r31, [%r8 + %r9]
	.word 0xcb1a0009  ! 1530: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0x0a800002  ! 1530: BCS	bcs  	<label_0x2>
	.word 0xdb3a0009  ! 1533: STDF_R	std	%f13, [%r9, %r8]
	.word 0xcd020009  ! 1533: LDF_R	ld	[%r8, %r9], %f6
	.word 0x8143c000  ! 1533: STBAR	stbar
	.word 0xcf220009  ! 1536: STF_R	st	%f7, [%r9, %r8]
	.word 0xc7020009  ! 1536: LDF_R	ld	[%r8, %r9], %f3
	.word 0xc46a2d7c  ! 1536: LDSTUB_I	ldstub	%r2, [%r8 + 0x0d7c]
	.word 0xca220009  ! 1539: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc3020009  ! 1539: LDF_R	ld	[%r8, %r9], %f1
	.word 0xcaf21009  ! 1539: STXA_R	stxa	%r5, [%r8 + %r9] 0x80
	.word 0xc2320009  ! 1542: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc40a0009  ! 1542: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xc4a21009  ! 1542: STWA_R	stwa	%r2, [%r8 + %r9] 0x80
	.word 0xc2220009  ! 1545: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xe85a0009  ! 1545: LDX_R	ldx	[%r8 + %r9], %r20
	.word 0x2eca0001  ! 1545: BRGEZ	brgez,a,pt	%8,<label_0xa0001>
	.word 0xc2720009  ! 1548: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc8420009  ! 1548: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xc6aa2ff4  ! 1548: STBA_I	stba	%r3, [%r8 + 0x0ff4] %asi
	.word 0xcf220009  ! 1551: STF_R	st	%f7, [%r9, %r8]
	.word 0xea0a0009  ! 1551: LDUB_R	ldub	[%r8 + %r9], %r21
	.word 0x8efa0009  ! 1551: SDIVcc_R	sdivcc 	%r8, %r9, %r7
	.word 0xce220009  ! 1554: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xf40a0009  ! 1554: LDUB_R	ldub	[%r8 + %r9], %r26
	.word 0xc8ba21f8  ! 1554: STDA_I	stda	%r4, [%r8 + 0x01f8] %asi
	.word 0xc8720009  ! 1557: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc51a0009  ! 1557: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xcaf21009  ! 1557: STXA_R	stxa	%r5, [%r8 + %r9] 0x80
	.word 0xce720009  ! 1560: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xcf1a0009  ! 1560: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0x2ac20001  ! 1560: BRNZ	brnz,a,nt	%8,<label_0x20001>
	.word 0xfd220009  ! 1563: STF_R	st	%f30, [%r9, %r8]
	.word 0xcc020009  ! 1563: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xc3ea1009  ! 1563: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc6320009  ! 1566: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xcc5a0009  ! 1566: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0x8e6a2c4c  ! 1566: UDIVX_I	udivx 	%r8, 0x0c4c, %r7
	.word 0xdb220009  ! 1569: STF_R	st	%f13, [%r9, %r8]
	.word 0xcf020009  ! 1569: LDF_R	ld	[%r8, %r9], %f7
	.word 0x8143e008  ! 1569: MEMBAR	membar	#StoreStore 
	.word 0xf13a0009  ! 1572: STDF_R	std	%f24, [%r9, %r8]
	.word 0xe7020009  ! 1572: LDF_R	ld	[%r8, %r9], %f19
	.word 0x84f20009  ! 1572: UDIVcc_R	udivcc 	%r8, %r9, %r2
	.word 0xc4720009  ! 1575: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xfa020009  ! 1575: LDUW_R	lduw	[%r8 + %r9], %r29
	.word 0xf46a0009  ! 1575: LDSTUB_R	ldstub	%r26, [%r8 + %r9]
	.word 0xf4220009  ! 1578: STW_R	stw	%r26, [%r8 + %r9]
	.word 0xfd1a0009  ! 1578: LDDF_R	ldd	[%r8, %r9], %f30
	.word 0x8e720009  ! 1578: UDIV_R	udiv 	%r8, %r9, %r7
	.word 0xce320009  ! 1581: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xe5020009  ! 1581: LDF_R	ld	[%r8, %r9], %f18
	.word 0xe2d22d1c  ! 1581: LDSHA_I	ldsha	[%r8, + 0x0d1c] %asi, %r17
	.word 0xe0720009  ! 1584: STX_R	stx	%r16, [%r8 + %r9]
	.word 0xcc1a0009  ! 1584: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xce0226cc  ! 1584: LDUW_I	lduw	[%r8 + 0x06cc], %r7
	.word 0xc93a0009  ! 1587: STDF_R	std	%f4, [%r9, %r8]
	.word 0xc24a0009  ! 1587: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xdeea2e6c  ! 1587: LDSTUBA_I	ldstuba	%r15, [%r8 + 0x0e6c] %asi
	.word 0xcf3a0009  ! 1590: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc2420009  ! 1590: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0x845a0009  ! 1590: SMUL_R	smul 	%r8, %r9, %r2
	.word 0xc2720009  ! 1593: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xe0520009  ! 1593: LDSH_R	ldsh	[%r8 + %r9], %r16
	.word 0xe00a0009  ! 1593: LDUB_R	ldub	[%r8 + %r9], %r16
	.word 0xca720009  ! 1596: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc4420009  ! 1596: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xc36a0009  ! 1596: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xca2a0009  ! 1599: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc2120009  ! 1599: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xc8fa24d4  ! 1599: SWAPA_I	swapa	%r4, [%r8 + 0x04d4] %asi
	.word 0xc9220009  ! 1602: STF_R	st	%f4, [%r9, %r8]
	.word 0xc4020009  ! 1602: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0x8e5a0009  ! 1602: SMUL_R	smul 	%r8, %r9, %r7
	.word 0xe62a0009  ! 1605: STB_R	stb	%r19, [%r8 + %r9]
	.word 0xc40a0009  ! 1605: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0x84520009  ! 1605: UMUL_R	umul 	%r8, %r9, %r2
	.word 0xc22a0009  ! 1608: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xf31a0009  ! 1608: LDDF_R	ldd	[%r8, %r9], %f25
	.word 0x83220009  ! 1608: MULScc_R	mulscc 	%r8, %r9, %r1
	.word 0xe42a0009  ! 1611: STB_R	stb	%r18, [%r8 + %r9]
	.word 0xfc1a0009  ! 1611: LDD_R	ldd	[%r8 + %r9], %r30
	.word 0xc36a2200  ! 1611: PREFETCH_I	prefetch	[%r8 + 0x0200], #one_read
	.word 0xc7220009  ! 1614: STF_R	st	%f3, [%r9, %r8]
	.word 0xcd1a0009  ! 1614: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xdff22009  ! 1614: CASXA_R	casxa	[%r8]%asi, %r9, %r15
	.word 0xc73a0009  ! 1617: STDF_R	std	%f3, [%r9, %r8]
	.word 0xcf1a0009  ! 1617: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xc41a0009  ! 1617: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xca220009  ! 1620: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xcc4a0009  ! 1620: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xe2a21009  ! 1620: STWA_R	stwa	%r17, [%r8 + %r9] 0x80
	.word 0xf4720009  ! 1623: STX_R	stx	%r26, [%r8 + %r9]
	.word 0xdb1a0009  ! 1623: LDDF_R	ldd	[%r8, %r9], %f13
	.word 0x8143c000  ! 1623: STBAR	stbar
	.word 0xc2720009  ! 1626: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xde120009  ! 1626: LDUH_R	lduh	[%r8 + %r9], %r15
	.word 0x8143e043  ! 1626: MEMBAR	membar	#LoadLoad | #StoreLoad | #Sync 
	.word 0xf8320009  ! 1629: STH_R	sth	%r28, [%r8 + %r9]
	.word 0xc64a0009  ! 1629: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0x86f20009  ! 1629: UDIVcc_R	udivcc 	%r8, %r9, %r3
	.word 0xdc720009  ! 1632: STX_R	stx	%r14, [%r8 + %r9]
	.word 0xfa120009  ! 1632: LDUH_R	lduh	[%r8 + %r9], %r29
	.word 0xc2a22c6c  ! 1632: STWA_I	stwa	%r1, [%r8 + 0x0c6c] %asi
	.word 0xe4320009  ! 1635: STH_R	sth	%r18, [%r8 + %r9]
	.word 0xdc4a0009  ! 1635: LDSB_R	ldsb	[%r8 + %r9], %r14
	.word 0x8c5a2000  ! 1635: SMUL_I	smul 	%r8, 0x0000, %r6
	.word 0xc6220009  ! 1638: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc8120009  ! 1638: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0x30800001  ! 1638: BA	ba,a	<label_0x1>
	.word 0xfe720009  ! 1641: STX_R	stx	%r31, [%r8 + %r9]
	.word 0xc81a0009  ! 1641: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x3c800001  ! 1641: BPOS	bpos,a	<label_0x1>
	.word 0xeb220009  ! 1644: STF_R	st	%f21, [%r9, %r8]
	.word 0xc24a0009  ! 1644: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0x8143e050  ! 1644: MEMBAR	membar	#Lookaside | #Sync 
	.word 0xc9220009  ! 1647: STF_R	st	%f4, [%r9, %r8]
	.word 0xc8120009  ! 1647: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xf4b21009  ! 1647: STHA_R	stha	%r26, [%r8 + %r9] 0x80
	.word 0xc2720009  ! 1650: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xf1020009  ! 1650: LDF_R	ld	[%r8, %r9], %f24
	.word 0xfff21009  ! 1650: CASXA_I	casxa	[%r8] 0x80, %r9, %r31
	.word 0xc4320009  ! 1653: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xec420009  ! 1653: LDSW_R	ldsw	[%r8 + %r9], %r22
	.word 0x8a520009  ! 1653: UMUL_R	umul 	%r8, %r9, %r5
	.word 0xd62a0009  ! 1656: STB_R	stb	%r11, [%r8 + %r9]
	.word 0xdf020009  ! 1656: LDF_R	ld	[%r8, %r9], %f15
	.word 0xcb1a0009  ! 1656: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xca2a0009  ! 1659: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc4020009  ! 1659: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0x24c20001  ! 1659: BRLEZ	brlez,a,nt	%8,<label_0x20001>
	.word 0xce720009  ! 1662: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc41a0009  ! 1662: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xf0ba1009  ! 1662: STDA_R	stda	%r24, [%r8 + %r9] 0x80
	.word 0xc6720009  ! 1665: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xec120009  ! 1665: LDUH_R	lduh	[%r8 + %r9], %r22
	.word 0xfac21009  ! 1665: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r29
	.word 0xca320009  ! 1668: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xcd020009  ! 1668: LDF_R	ld	[%r8, %r9], %f6
	.word 0xdff22009  ! 1668: CASXA_R	casxa	[%r8]%asi, %r9, %r15
	.word 0xce320009  ! 1671: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xe05a0009  ! 1671: LDX_R	ldx	[%r8 + %r9], %r16
	.word 0xeb3a23e0  ! 1671: STDF_I	std	%f21, [0x03e0, %r8]
	.word 0xcf220009  ! 1674: STF_R	st	%f7, [%r9, %r8]
	.word 0xc85a0009  ! 1674: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xe88a1009  ! 1674: LDUBA_R	lduba	[%r8, %r9] 0x80, %r20
	.word 0xca320009  ! 1677: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xe41a0009  ! 1677: LDD_R	ldd	[%r8 + %r9], %r18
	.word 0xc36a0009  ! 1677: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc9220009  ! 1680: STF_R	st	%f4, [%r9, %r8]
	.word 0xee4a0009  ! 1680: LDSB_R	ldsb	[%r8 + %r9], %r23
	.word 0xa8fa0009  ! 1680: SDIVcc_R	sdivcc 	%r8, %r9, %r20
	.word 0xc6320009  ! 1683: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xca4a0009  ! 1683: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xcc9226a0  ! 1683: LDUHA_I	lduha	[%r8, + 0x06a0] %asi, %r6
	.word 0xc93a0009  ! 1686: STDF_R	std	%f4, [%r9, %r8]
	.word 0xca4a0009  ! 1686: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xc73a0009  ! 1686: STDF_R	std	%f3, [%r9, %r8]
	.word 0xee220009  ! 1689: STW_R	stw	%r23, [%r8 + %r9]
	.word 0xf01a0009  ! 1689: LDD_R	ldd	[%r8 + %r9], %r24
	.word 0x8fa20929  ! 1689: FMULs	fmuls	%f8, %f9, %f7
	.word 0xce720009  ! 1692: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xed1a0009  ! 1692: LDDF_R	ldd	[%r8, %r9], %f22
	.word 0xb9a20829  ! 1692: FADDs	fadds	%f8, %f9, %f28
	.word 0xc33a0009  ! 1695: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc9020009  ! 1695: LDF_R	ld	[%r8, %r9], %f4
	.word 0xcefa1009  ! 1695: SWAPA_R	swapa	%r7, [%r8 + %r9] 0x80
	.word 0xcc320009  ! 1698: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xcc0a0009  ! 1698: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xc09a2038  ! 1698: LDDA_I	ldda	[%r8, + 0x0038] %asi, %r0
	.word 0xed3a0009  ! 1701: STDF_R	std	%f22, [%r9, %r8]
	.word 0xce420009  ! 1701: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xce7a2458  ! 1701: SWAP_I	swap	%r7, [%r8 + 0x0458]
	.word 0xe2220009  ! 1704: STW_R	stw	%r17, [%r8 + %r9]
	.word 0xce520009  ! 1704: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xc4ba27d0  ! 1704: STDA_I	stda	%r2, [%r8 + 0x07d0] %asi
	.word 0xc6320009  ! 1707: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc65a0009  ! 1707: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xe2fa2200  ! 1707: SWAPA_I	swapa	%r17, [%r8 + 0x0200] %asi
	.word 0xc42a0009  ! 1710: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xce4a0009  ! 1710: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xc36a0009  ! 1710: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xce220009  ! 1713: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc85a0009  ! 1713: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xc4522078  ! 1713: LDSH_I	ldsh	[%r8 + 0x0078], %r2
	.word 0xe4220009  ! 1716: STW_R	stw	%r18, [%r8 + %r9]
	.word 0xc8120009  ! 1716: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xa65a2484  ! 1716: SMUL_I	smul 	%r8, 0x0484, %r19
	.word 0xcb220009  ! 1719: STF_R	st	%f5, [%r9, %r8]
	.word 0xf11a0009  ! 1719: LDDF_R	ldd	[%r8, %r9], %f24
	.word 0x8143c000  ! 1719: STBAR	stbar
	.word 0xc8320009  ! 1722: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc40a0009  ! 1722: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0x87a20929  ! 1722: FMULs	fmuls	%f8, %f9, %f3
	.word 0xe2320009  ! 1725: STH_R	sth	%r17, [%r8 + %r9]
	.word 0xfb020009  ! 1725: LDF_R	ld	[%r8, %r9], %f29
	.word 0x2aca0001  ! 1725: BRNZ	brnz,a,pt	%8,<label_0xa0001>
	.word 0xce2a0009  ! 1728: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc3020009  ! 1728: LDF_R	ld	[%r8, %r9], %f1
	.word 0xc3ea2634  ! 1728: PREFETCHA_I	prefetcha	[%r8, + 0x0634] %asi, #one_read
	.word 0xc6220009  ! 1731: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xe64a0009  ! 1731: LDSB_R	ldsb	[%r8 + %r9], %r19
	.word 0xcd1a0009  ! 1731: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xc3220009  ! 1734: STF_R	st	%f1, [%r9, %r8]
	.word 0xc3020009  ! 1734: LDF_R	ld	[%r8, %r9], %f1
	.word 0x887a0009  ! 1734: SDIV_R	sdiv 	%r8, %r9, %r4
	.word 0xc8220009  ! 1737: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc6420009  ! 1737: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xc8c22a08  ! 1737: LDSWA_I	ldswa	[%r8, + 0x0a08] %asi, %r4
	.word 0xed220009  ! 1740: STF_R	st	%f22, [%r9, %r8]
	.word 0xe65a0009  ! 1740: LDX_R	ldx	[%r8 + %r9], %r19
	.word 0xd61223bc  ! 1740: LDUH_I	lduh	[%r8 + 0x03bc], %r11
	.word 0xc4320009  ! 1743: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc8020009  ! 1743: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0x8a5a2074  ! 1743: SMUL_I	smul 	%r8, 0x0074, %r5
	.word 0xc4220009  ! 1746: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc7020009  ! 1746: LDF_R	ld	[%r8, %r9], %f3
	.word 0xc8522668  ! 1746: LDSH_I	ldsh	[%r8 + 0x0668], %r4
	.word 0xc22a0009  ! 1749: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc2120009  ! 1749: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xf73a0009  ! 1749: STDF_R	std	%f27, [%r9, %r8]
	.word 0xcb3a0009  ! 1752: STDF_R	std	%f5, [%r9, %r8]
	.word 0xce020009  ! 1752: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0x845228d4  ! 1752: UMUL_I	umul 	%r8, 0x08d4, %r2
	.word 0xf8320009  ! 1755: STH_R	sth	%r28, [%r8 + %r9]
	.word 0xe4120009  ! 1755: LDUH_R	lduh	[%r8 + %r9], %r18
	.word 0xc5020009  ! 1755: LDF_R	ld	[%r8, %r9], %f2
	.word 0xfd220009  ! 1758: STF_R	st	%f30, [%r9, %r8]
	.word 0xf5020009  ! 1758: LDF_R	ld	[%r8, %r9], %f26
	.word 0xccc21009  ! 1758: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r6
	.word 0xd82a0009  ! 1761: STB_R	stb	%r12, [%r8 + %r9]
	.word 0xc81a0009  ! 1761: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x8a720009  ! 1761: UDIV_R	udiv 	%r8, %r9, %r5
	.word 0xd9220009  ! 1764: STF_R	st	%f12, [%r9, %r8]
	.word 0xc24a0009  ! 1764: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xc5e21009  ! 1764: CASA_I	casa	[%r8] 0x80, %r9, %r2
	.word 0xf13a0009  ! 1767: STDF_R	std	%f24, [%r9, %r8]
	.word 0xed020009  ! 1767: LDF_R	ld	[%r8, %r9], %f22
	.word 0x827a0009  ! 1767: SDIV_R	sdiv 	%r8, %r9, %r1
	.word 0xe8720009  ! 1770: STX_R	stx	%r20, [%r8 + %r9]
	.word 0xe00a0009  ! 1770: LDUB_R	ldub	[%r8 + %r9], %r16
	.word 0xc7e21009  ! 1770: CASA_I	casa	[%r8] 0x80, %r9, %r3
	.word 0xc6320009  ! 1773: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xec420009  ! 1773: LDSW_R	ldsw	[%r8 + %r9], %r22
	.word 0x38800001  ! 1773: BGU	bgu,a	<label_0x1>
	.word 0xc8720009  ! 1776: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xea420009  ! 1776: LDSW_R	ldsw	[%r8 + %r9], %r21
	.word 0xfeb22858  ! 1776: STHA_I	stha	%r31, [%r8 + 0x0858] %asi
	.word 0xce220009  ! 1779: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc4520009  ! 1779: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xc4c21009  ! 1779: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r2
	.word 0xc4720009  ! 1782: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xe0420009  ! 1782: LDSW_R	ldsw	[%r8 + %r9], %r16
	.word 0xc36a0009  ! 1782: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xea2a0009  ! 1785: STB_R	stb	%r21, [%r8 + %r9]
	.word 0xc81a0009  ! 1785: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xc4420009  ! 1785: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xce2a0009  ! 1788: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc8020009  ! 1788: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xcaf21009  ! 1788: STXA_R	stxa	%r5, [%r8 + %r9] 0x80
	.word 0xc7220009  ! 1791: STF_R	st	%f3, [%r9, %r8]
	.word 0xe2520009  ! 1791: LDSH_R	ldsh	[%r8 + %r9], %r17
	.word 0x36800001  ! 1791: BGE	bge,a	<label_0x1>
	.word 0xcc2a0009  ! 1794: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xfa5a0009  ! 1794: LDX_R	ldx	[%r8 + %r9], %r29
	.word 0xa4522d18  ! 1794: UMUL_I	umul 	%r8, 0x0d18, %r18
	.word 0xc5220009  ! 1797: STF_R	st	%f2, [%r9, %r8]
	.word 0xc6520009  ! 1797: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0x8143c000  ! 1797: STBAR	stbar
	.word 0xc4720009  ! 1800: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xcb1a0009  ! 1800: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0x89220009  ! 1800: MULScc_R	mulscc 	%r8, %r9, %r4
	.word 0xf73a0009  ! 1803: STDF_R	std	%f27, [%r9, %r8]
	.word 0xc7020009  ! 1803: LDF_R	ld	[%r8, %r9], %f3
	.word 0x0aca0001  ! 1803: BRNZ	brnz  ,pt	%8,<label_0xa0001>
	.word 0xe6720009  ! 1806: STX_R	stx	%r19, [%r8 + %r9]
	.word 0xc71a0009  ! 1806: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xd8ea1009  ! 1806: LDSTUBA_R	ldstuba	%r12, [%r8 + %r9] 0x80
	.word 0xe42a0009  ! 1809: STB_R	stb	%r18, [%r8 + %r9]
	.word 0xca4a0009  ! 1809: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xc28a2bdc  ! 1809: LDUBA_I	lduba	[%r8, + 0x0bdc] %asi, %r1
	.word 0xed3a0009  ! 1812: STDF_R	std	%f22, [%r9, %r8]
	.word 0xca0a0009  ! 1812: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0x8143e02d  ! 1812: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #MemIssue 
	.word 0xce320009  ! 1815: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xda120009  ! 1815: LDUH_R	lduh	[%r8 + %r9], %r13
	.word 0xec120009  ! 1815: LDUH_R	lduh	[%r8 + %r9], %r22
	.word 0xc42a0009  ! 1818: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xdc1a0009  ! 1818: LDD_R	ldd	[%r8 + %r9], %r14
	.word 0x82da2404  ! 1818: SMULcc_I	smulcc 	%r8, 0x0404, %r1
	.word 0xc6220009  ! 1821: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc40a0009  ! 1821: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xa7a208a9  ! 1821: FSUBs	fsubs	%f8, %f9, %f19
	.word 0xcf3a0009  ! 1824: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc6520009  ! 1824: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xfea22234  ! 1824: STWA_I	stwa	%r31, [%r8 + 0x0234] %asi
	.word 0xc3220009  ! 1827: STF_R	st	%f1, [%r9, %r8]
	.word 0xca5a0009  ! 1827: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0x8143c000  ! 1827: STBAR	stbar
	.word 0xc42a0009  ! 1830: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xe7020009  ! 1830: LDF_R	ld	[%r8, %r9], %f19
	.word 0xc28a1009  ! 1830: LDUBA_R	lduba	[%r8, %r9] 0x80, %r1
	.word 0xcb220009  ! 1833: STF_R	st	%f5, [%r9, %r8]
	.word 0xce0a0009  ! 1833: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xc36a2098  ! 1833: PREFETCH_I	prefetch	[%r8 + 0x0098], #one_read
	.word 0xc7220009  ! 1836: STF_R	st	%f3, [%r9, %r8]
	.word 0xda4a0009  ! 1836: LDSB_R	ldsb	[%r8 + %r9], %r13
	.word 0xe2d22700  ! 1836: LDSHA_I	ldsha	[%r8, + 0x0700] %asi, %r17
	.word 0xca2a0009  ! 1839: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc6420009  ! 1839: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xeaaa1009  ! 1839: STBA_R	stba	%r21, [%r8 + %r9] 0x80
	.word 0xec320009  ! 1842: STH_R	sth	%r22, [%r8 + %r9]
	.word 0xc6020009  ! 1842: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xf9e21009  ! 1842: CASA_I	casa	[%r8] 0x80, %r9, %r28
	.word 0xca2a0009  ! 1845: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xca020009  ! 1845: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xe28a1009  ! 1845: LDUBA_R	lduba	[%r8, %r9] 0x80, %r17
	.word 0xea2a0009  ! 1848: STB_R	stb	%r21, [%r8 + %r9]
	.word 0xc81a0009  ! 1848: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x82f222f8  ! 1848: UDIVcc_I	udivcc 	%r8, 0x02f8, %r1
	.word 0xcc2a0009  ! 1851: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xde420009  ! 1851: LDSW_R	ldsw	[%r8 + %r9], %r15
	.word 0xcafa1009  ! 1851: SWAPA_R	swapa	%r5, [%r8 + %r9] 0x80
	.word 0xce220009  ! 1854: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc44a0009  ! 1854: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0x88f22a28  ! 1854: UDIVcc_I	udivcc 	%r8, 0x0a28, %r4
	.word 0xf7220009  ! 1857: STF_R	st	%f27, [%r9, %r8]
	.word 0xc60a0009  ! 1857: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0x97a20829  ! 1857: FADDs	fadds	%f8, %f9, %f11
	.word 0xdf3a0009  ! 1860: STDF_R	std	%f15, [%r9, %r8]
	.word 0xcc120009  ! 1860: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0x8143c000  ! 1860: STBAR	stbar
	.word 0xe5220009  ! 1863: STF_R	st	%f18, [%r9, %r8]
	.word 0xe64a0009  ! 1863: LDSB_R	ldsb	[%r8 + %r9], %r19
	.word 0xca6a0009  ! 1863: LDSTUB_R	ldstub	%r5, [%r8 + %r9]
	.word 0xc6320009  ! 1866: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc01a0009  ! 1866: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0x887a0009  ! 1866: SDIV_R	sdiv 	%r8, %r9, %r4
	.word 0xcc320009  ! 1869: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xd65a0009  ! 1869: LDX_R	ldx	[%r8 + %r9], %r11
	.word 0xc20a0009  ! 1869: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xca320009  ! 1872: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xfe5a0009  ! 1872: LDX_R	ldx	[%r8 + %r9], %r31
	.word 0xc2a21009  ! 1872: STWA_R	stwa	%r1, [%r8 + %r9] 0x80
	.word 0xc42a0009  ! 1875: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xcc420009  ! 1875: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0x12800002  ! 1875: BNE	bne  	<label_0x2>
	.word 0xc6320009  ! 1878: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xcc4a0009  ! 1878: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xd81a2998  ! 1878: LDD_I	ldd	[%r8 + 0x0998], %r12
	.word 0xee720009  ! 1881: STX_R	stx	%r23, [%r8 + %r9]
	.word 0xc40a0009  ! 1881: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xc3ea20b0  ! 1881: PREFETCHA_I	prefetcha	[%r8, + 0x00b0] %asi, #one_read
	.word 0xd8220009  ! 1884: STW_R	stw	%r12, [%r8 + %r9]
	.word 0xc40a0009  ! 1884: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xe2ea1009  ! 1884: LDSTUBA_R	ldstuba	%r17, [%r8 + %r9] 0x80
	.word 0xcc320009  ! 1887: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc9020009  ! 1887: LDF_R	ld	[%r8, %r9], %f4
	.word 0xe0821009  ! 1887: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r16
	.word 0xd73a0009  ! 1890: STDF_R	std	%f11, [%r9, %r8]
	.word 0xc91a0009  ! 1890: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0x8e5a2574  ! 1890: SMUL_I	smul 	%r8, 0x0574, %r7
	.word 0xc2320009  ! 1893: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc2120009  ! 1893: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xc36a2004  ! 1893: PREFETCH_I	prefetch	[%r8 + 0x0004], #one_read
	.word 0xc2220009  ! 1896: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xcf1a0009  ! 1896: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0x0eca0001  ! 1896: BRGEZ	brgez  ,pt	%8,<label_0xa0001>
	.word 0xc4720009  ! 1899: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xda020009  ! 1899: LDUW_R	lduw	[%r8 + %r9], %r13
	.word 0xc8ca1009  ! 1899: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r4
	.word 0xd8320009  ! 1902: STH_R	sth	%r12, [%r8 + %r9]
	.word 0xfc5a0009  ! 1902: LDX_R	ldx	[%r8 + %r9], %r30
	.word 0xcac22264  ! 1902: LDSWA_I	ldswa	[%r8, + 0x0264] %asi, %r5
	.word 0xc6320009  ! 1905: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc4520009  ! 1905: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xfa9223ac  ! 1905: LDUHA_I	lduha	[%r8, + 0x03ac] %asi, %r29
	.word 0xce2a0009  ! 1908: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xce420009  ! 1908: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0x24800001  ! 1908: BLE	ble,a	<label_0x1>
	.word 0xce320009  ! 1911: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xe4520009  ! 1911: LDSH_R	ldsh	[%r8 + %r9], %r18
	.word 0xc3ea2f9c  ! 1911: PREFETCHA_I	prefetcha	[%r8, + 0x0f9c] %asi, #one_read
	.word 0xc2220009  ! 1914: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc45a0009  ! 1914: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0x8ba209a9  ! 1914: FDIVs	fdivs	%f8, %f9, %f5
	.word 0xc9220009  ! 1917: STF_R	st	%f4, [%r9, %r8]
	.word 0xc4520009  ! 1917: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xceda2890  ! 1917: LDXA_I	ldxa	[%r8, + 0x0890] %asi, %r7
	.word 0xe53a0009  ! 1920: STDF_R	std	%f18, [%r9, %r8]
	.word 0xc4520009  ! 1920: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0x9eda24b0  ! 1920: SMULcc_I	smulcc 	%r8, 0x04b0, %r15
	.word 0xcb220009  ! 1923: STF_R	st	%f5, [%r9, %r8]
	.word 0xca0a0009  ! 1923: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0x12800002  ! 1923: BNE	bne  	<label_0x2>
	.word 0xec2a0009  ! 1926: STB_R	stb	%r22, [%r8 + %r9]
	.word 0xca020009  ! 1926: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xdab21009  ! 1926: STHA_R	stha	%r13, [%r8 + %r9] 0x80
	.word 0xdb3a0009  ! 1929: STDF_R	std	%f13, [%r9, %r8]
	.word 0xc6420009  ! 1929: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xa45a2990  ! 1929: SMUL_I	smul 	%r8, 0x0990, %r18
	.word 0xc93a0009  ! 1932: STDF_R	std	%f4, [%r9, %r8]
	.word 0xce120009  ! 1932: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xc3ea2694  ! 1932: PREFETCHA_I	prefetcha	[%r8, + 0x0694] %asi, #one_read
	.word 0xc7220009  ! 1935: STF_R	st	%f3, [%r9, %r8]
	.word 0xe80a0009  ! 1935: LDUB_R	ldub	[%r8 + %r9], %r20
	.word 0xc3ea2544  ! 1935: PREFETCHA_I	prefetcha	[%r8, + 0x0544] %asi, #one_read
	.word 0xec320009  ! 1938: STH_R	sth	%r22, [%r8 + %r9]
	.word 0xc01a0009  ! 1938: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0xca120009  ! 1938: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xe7220009  ! 1941: STF_R	st	%f19, [%r9, %r8]
	.word 0xc6520009  ! 1941: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0x86f20009  ! 1941: UDIVcc_R	udivcc 	%r8, %r9, %r3
	.word 0xcc320009  ! 1944: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xca520009  ! 1944: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0x8143e01f  ! 1944: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #Lookaside 
	.word 0xf4720009  ! 1947: STX_R	stx	%r26, [%r8 + %r9]
	.word 0xc25a0009  ! 1947: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0x8c720009  ! 1947: UDIV_R	udiv 	%r8, %r9, %r6
	.word 0xce720009  ! 1950: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xfe020009  ! 1950: LDUW_R	lduw	[%r8 + %r9], %r31
	.word 0x28800001  ! 1950: BLEU	bleu,a	<label_0x1>
	.word 0xcc220009  ! 1953: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc9020009  ! 1953: LDF_R	ld	[%r8, %r9], %f4
	.word 0xec5a2de0  ! 1953: LDX_I	ldx	[%r8 + 0x0de0], %r22
	.word 0xe7220009  ! 1956: STF_R	st	%f19, [%r9, %r8]
	.word 0xc24a0009  ! 1956: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xc8922038  ! 1956: LDUHA_I	lduha	[%r8, + 0x0038] %asi, %r4
	.word 0xc2220009  ! 1959: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xce020009  ! 1959: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xcd220009  ! 1959: STF_R	st	%f6, [%r9, %r8]
	.word 0xf22a0009  ! 1962: STB_R	stb	%r25, [%r8 + %r9]
	.word 0xc4520009  ! 1962: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0x8143e07b  ! 1962: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xce220009  ! 1965: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xf04a0009  ! 1965: LDSB_R	ldsb	[%r8 + %r9], %r24
	.word 0x89a209a9  ! 1965: FDIVs	fdivs	%f8, %f9, %f4
	.word 0xf62a0009  ! 1968: STB_R	stb	%r27, [%r8 + %r9]
	.word 0xcc5a0009  ! 1968: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xa1a20829  ! 1968: FADDs	fadds	%f8, %f9, %f16
	.word 0xc82a0009  ! 1971: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xfa020009  ! 1971: LDUW_R	lduw	[%r8 + %r9], %r29
	.word 0x85220009  ! 1971: MULScc_R	mulscc 	%r8, %r9, %r2
	.word 0xc2220009  ! 1974: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc2120009  ! 1974: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xe1e21009  ! 1974: CASA_I	casa	[%r8] 0x80, %r9, %r16
	.word 0xc62a0009  ! 1977: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc84a0009  ! 1977: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xc3ea27a8  ! 1977: PREFETCHA_I	prefetcha	[%r8, + 0x07a8] %asi, #one_read
	.word 0xd73a0009  ! 1980: STDF_R	std	%f11, [%r9, %r8]
	.word 0xc60a0009  ! 1980: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0x38800001  ! 1980: BGU	bgu,a	<label_0x1>
	.word 0xcc720009  ! 1983: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xed1a0009  ! 1983: LDDF_R	ldd	[%r8, %r9], %f22
	.word 0xc2f21009  ! 1983: STXA_R	stxa	%r1, [%r8 + %r9] 0x80
	.word 0xfd3a0009  ! 1986: STDF_R	std	%f30, [%r9, %r8]
	.word 0xc80a0009  ! 1986: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xc4da1009  ! 1986: LDXA_R	ldxa	[%r8, %r9] 0x80, %r2
	.word 0xc4720009  ! 1989: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xf00a0009  ! 1989: LDUB_R	ldub	[%r8 + %r9], %r24
	.word 0xcc420009  ! 1989: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xcf3a0009  ! 1992: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc45a0009  ! 1992: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xf2da1009  ! 1992: LDXA_R	ldxa	[%r8, %r9] 0x80, %r25
	.word 0xcb3a0009  ! 1995: STDF_R	std	%f5, [%r9, %r8]
	.word 0xc2520009  ! 1995: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xcd02265c  ! 1995: LDF_I	ld	[%r8, 0x065c], %f6
	.word 0xca220009  ! 1998: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc6120009  ! 1998: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0x8143e05f  ! 1998: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0xc4720009  ! 2001: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc24a0009  ! 2001: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xc36a0009  ! 2001: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xee2a0009  ! 2004: STB_R	stb	%r23, [%r8 + %r9]
	.word 0xca4a0009  ! 2004: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0x02ca0001  ! 2004: BRZ	brz  ,pt	%8,<label_0xa0001>
	.word 0xcb3a0009  ! 2007: STDF_R	std	%f5, [%r9, %r8]
	.word 0xd84a0009  ! 2007: LDSB_R	ldsb	[%r8 + %r9], %r12
	.word 0xc8921009  ! 2007: LDUHA_R	lduha	[%r8, %r9] 0x80, %r4
	.word 0xcb3a0009  ! 2010: STDF_R	std	%f5, [%r9, %r8]
	.word 0xcc0a0009  ! 2010: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xdb220009  ! 2010: STF_R	st	%f13, [%r9, %r8]
	.word 0xce320009  ! 2013: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc91a0009  ! 2013: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xc3ea2dd8  ! 2013: PREFETCHA_I	prefetcha	[%r8, + 0x0dd8] %asi, #one_read
	.word 0xe62a0009  ! 2016: STB_R	stb	%r19, [%r8 + %r9]
	.word 0xca120009  ! 2016: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xf00a0009  ! 2016: LDUB_R	ldub	[%r8 + %r9], %r24
	.word 0xc22a0009  ! 2019: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xdb1a0009  ! 2019: LDDF_R	ldd	[%r8, %r9], %f13
	.word 0x856a0009  ! 2019: SDIVX_R	sdivx	%r8, %r9, %r2
	.word 0xc6320009  ! 2022: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc6120009  ! 2022: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0x8e5a2ec8  ! 2022: SMUL_I	smul 	%r8, 0x0ec8, %r7
	.word 0xc2320009  ! 2025: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc51a0009  ! 2025: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xcfe21009  ! 2025: CASA_I	casa	[%r8] 0x80, %r9, %r7
	.word 0xdc320009  ! 2028: STH_R	sth	%r14, [%r8 + %r9]
	.word 0xcd1a0009  ! 2028: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xeca22560  ! 2028: STWA_I	stwa	%r22, [%r8 + 0x0560] %asi
	.word 0xe4720009  ! 2031: STX_R	stx	%r18, [%r8 + %r9]
	.word 0xc4020009  ! 2031: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0x18800001  ! 2031: BGU	bgu  	<label_0x1>
	.word 0xc2320009  ! 2034: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xf5020009  ! 2034: LDF_R	ld	[%r8, %r9], %f26
	.word 0xede22009  ! 2034: CASA_R	casa	[%r8] %asi, %r9, %r22
	.word 0xf0720009  ! 2037: STX_R	stx	%r24, [%r8 + %r9]
	.word 0xe2420009  ! 2037: LDSW_R	ldsw	[%r8 + %r9], %r17
	.word 0xccd21009  ! 2037: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r6
	.word 0xf4720009  ! 2040: STX_R	stx	%r26, [%r8 + %r9]
	.word 0xe05a0009  ! 2040: LDX_R	ldx	[%r8 + %r9], %r16
	.word 0x8143c000  ! 2040: STBAR	stbar
	.word 0xd62a0009  ! 2043: STB_R	stb	%r11, [%r8 + %r9]
	.word 0xcc420009  ! 2043: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0x8c7a290c  ! 2043: SDIV_I	sdiv 	%r8, 0x090c, %r6
	.word 0xc33a0009  ! 2046: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc8120009  ! 2046: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xc7020009  ! 2046: LDF_R	ld	[%r8, %r9], %f3
	.word 0xc6720009  ! 2049: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xde120009  ! 2049: LDUH_R	lduh	[%r8 + %r9], %r15
	.word 0xc36a0009  ! 2049: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc93a0009  ! 2052: STDF_R	std	%f4, [%r9, %r8]
	.word 0xd81a0009  ! 2052: LDD_R	ldd	[%r8 + %r9], %r12
	.word 0x1c800001  ! 2052: BPOS	bpos  	<label_0x1>
	.word 0xc82a0009  ! 2055: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xcb020009  ! 2055: LDF_R	ld	[%r8, %r9], %f5
	.word 0x8a4a2d90  ! 2055: MULX_I	mulx 	%r8, 0x0d90, %r5
	.word 0xec720009  ! 2058: STX_R	stx	%r22, [%r8 + %r9]
	.word 0xc24a0009  ! 2058: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xc7222bd4  ! 2058: STF_I	st	%f3, [0x0bd4, %r8]
	.word 0xcc320009  ! 2061: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xce0a0009  ! 2061: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xe6da2c10  ! 2061: LDXA_I	ldxa	[%r8, + 0x0c10] %asi, %r19
	.word 0xcc220009  ! 2064: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xca120009  ! 2064: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0x0aca0001  ! 2064: BRNZ	brnz  ,pt	%8,<label_0xa0001>
	.word 0xc6720009  ! 2067: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc8120009  ! 2067: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xc85a0009  ! 2067: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xca320009  ! 2070: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xdc1a0009  ! 2070: LDD_R	ldd	[%r8 + %r9], %r14
	.word 0xc4b22928  ! 2070: STHA_I	stha	%r2, [%r8 + 0x0928] %asi
	.word 0xca220009  ! 2073: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xcc520009  ! 2073: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xc9e22009  ! 2073: CASA_R	casa	[%r8] %asi, %r9, %r4
	.word 0xd8220009  ! 2076: STW_R	stw	%r12, [%r8 + %r9]
	.word 0xf9020009  ! 2076: LDF_R	ld	[%r8, %r9], %f28
	.word 0xe8120009  ! 2076: LDUH_R	lduh	[%r8 + %r9], %r20
	.word 0xcb220009  ! 2079: STF_R	st	%f5, [%r9, %r8]
	.word 0xe25a0009  ! 2079: LDX_R	ldx	[%r8 + %r9], %r17
	.word 0xe2c21009  ! 2079: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r17
	.word 0xc2720009  ! 2082: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc4120009  ! 2082: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0x04800002  ! 2082: BLE	ble  	<label_0x2>
	.word 0xcc220009  ! 2085: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xee420009  ! 2085: LDSW_R	ldsw	[%r8 + %r9], %r23
	.word 0xc68a2bf0  ! 2085: LDUBA_I	lduba	[%r8, + 0x0bf0] %asi, %r3
	.word 0xc2220009  ! 2088: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc65a0009  ! 2088: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xe12227cc  ! 2088: STF_I	st	%f16, [0x07cc, %r8]
	.word 0xc22a0009  ! 2091: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc8420009  ! 2091: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xd87a0009  ! 2091: SWAP_R	swap	%r12, [%r8 + %r9]
	.word 0xca320009  ! 2094: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xe60a0009  ! 2094: LDUB_R	ldub	[%r8 + %r9], %r19
	.word 0xccfa2da0  ! 2094: SWAPA_I	swapa	%r6, [%r8 + 0x0da0] %asi
	.word 0xc4220009  ! 2097: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xda120009  ! 2097: LDUH_R	lduh	[%r8 + %r9], %r13
	.word 0x3c800001  ! 2097: BPOS	bpos,a	<label_0x1>
	.word 0xc3220009  ! 2100: STF_R	st	%f1, [%r9, %r8]
	.word 0xe04a0009  ! 2100: LDSB_R	ldsb	[%r8 + %r9], %r16
	.word 0x8af20009  ! 2100: UDIVcc_R	udivcc 	%r8, %r9, %r5
	.word 0xc33a0009  ! 2103: STDF_R	std	%f1, [%r9, %r8]
	.word 0xca120009  ! 2103: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xc3ea23c0  ! 2103: PREFETCHA_I	prefetcha	[%r8, + 0x03c0] %asi, #one_read
	.word 0xc6320009  ! 2106: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xcc5a0009  ! 2106: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xf2ea2064  ! 2106: LDSTUBA_I	ldstuba	%r25, [%r8 + 0x0064] %asi
	.word 0xf53a0009  ! 2109: STDF_R	std	%f26, [%r9, %r8]
	.word 0xf6420009  ! 2109: LDSW_R	ldsw	[%r8 + %r9], %r27
	.word 0xe4da1009  ! 2109: LDXA_R	ldxa	[%r8, %r9] 0x80, %r18
	.word 0xc4720009  ! 2112: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc25a0009  ! 2112: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xcf220009  ! 2112: STF_R	st	%f7, [%r9, %r8]
	.word 0xc93a0009  ! 2115: STDF_R	std	%f4, [%r9, %r8]
	.word 0xe71a0009  ! 2115: LDDF_R	ldd	[%r8, %r9], %f19
	.word 0xc3ea23bc  ! 2115: PREFETCHA_I	prefetcha	[%r8, + 0x03bc] %asi, #one_read
	.word 0xc5220009  ! 2118: STF_R	st	%f2, [%r9, %r8]
	.word 0xcc520009  ! 2118: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xc2a22d24  ! 2118: STWA_I	stwa	%r1, [%r8 + 0x0d24] %asi
	.word 0xf2320009  ! 2121: STH_R	sth	%r25, [%r8 + %r9]
	.word 0xc84a0009  ! 2121: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0x06ca0001  ! 2121: BRLZ	brlz  ,pt	%8,<label_0xa0001>
	.word 0xc4720009  ! 2124: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xce020009  ! 2124: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xdc4a0009  ! 2124: LDSB_R	ldsb	[%r8 + %r9], %r14
	.word 0xde320009  ! 2127: STH_R	sth	%r15, [%r8 + %r9]
	.word 0xde020009  ! 2127: LDUW_R	lduw	[%r8 + %r9], %r15
	.word 0x88da244c  ! 2127: SMULcc_I	smulcc 	%r8, 0x044c, %r4
	.word 0xce220009  ! 2130: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xca4a0009  ! 2130: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xc36a2b0c  ! 2130: PREFETCH_I	prefetch	[%r8 + 0x0b0c], #one_read
	.word 0xc53a0009  ! 2133: STDF_R	std	%f2, [%r9, %r8]
	.word 0xce420009  ! 2133: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xc3ea2ad4  ! 2133: PREFETCHA_I	prefetcha	[%r8, + 0x0ad4] %asi, #one_read
	.word 0xc82a0009  ! 2136: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xde420009  ! 2136: LDSW_R	ldsw	[%r8 + %r9], %r15
	.word 0x88fa2f08  ! 2136: SDIVcc_I	sdivcc 	%r8, 0x0f08, %r4
	.word 0xc2320009  ! 2139: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xca5a0009  ! 2139: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xd8b21009  ! 2139: STHA_R	stha	%r12, [%r8 + %r9] 0x80
	.word 0xd6320009  ! 2142: STH_R	sth	%r11, [%r8 + %r9]
	.word 0xc4520009  ! 2142: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xd87a0009  ! 2142: SWAP_R	swap	%r12, [%r8 + %r9]
	.word 0xc5220009  ! 2145: STF_R	st	%f2, [%r9, %r8]
	.word 0xc6120009  ! 2145: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xc3e21009  ! 2145: CASA_I	casa	[%r8] 0x80, %r9, %r1
	.word 0xca320009  ! 2148: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xe31a0009  ! 2148: LDDF_R	ldd	[%r8, %r9], %f17
	.word 0xcaf227e0  ! 2148: STXA_I	stxa	%r5, [%r8 + 0x07e0] %asi
	.word 0xe8320009  ! 2151: STH_R	sth	%r20, [%r8 + %r9]
	.word 0xc45a0009  ! 2151: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0x8143c000  ! 2151: STBAR	stbar
	.word 0xc2320009  ! 2154: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xca120009  ! 2154: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xe46a27dc  ! 2154: LDSTUB_I	ldstub	%r18, [%r8 + 0x07dc]
	.word 0xcb3a0009  ! 2157: STDF_R	std	%f5, [%r9, %r8]
	.word 0xcb1a0009  ! 2157: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xc47a0009  ! 2157: SWAP_R	swap	%r2, [%r8 + %r9]
	.word 0xc62a0009  ! 2160: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc41a0009  ! 2160: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xde8a1009  ! 2160: LDUBA_R	lduba	[%r8, %r9] 0x80, %r15
	.word 0xc62a0009  ! 2163: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xcc020009  ! 2163: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0x04ca0001  ! 2163: BRLEZ	brlez  ,pt	%8,<label_0xa0001>
	.word 0xf1220009  ! 2166: STF_R	st	%f24, [%r9, %r8]
	.word 0xe6420009  ! 2166: LDSW_R	ldsw	[%r8 + %r9], %r19
	.word 0x8143c000  ! 2166: STBAR	stbar
	.word 0xcc320009  ! 2169: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xcc4a0009  ! 2169: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xcd1a0009  ! 2169: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xe02a0009  ! 2172: STB_R	stb	%r16, [%r8 + %r9]
	.word 0xce420009  ! 2172: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xcaaa2e64  ! 2172: STBA_I	stba	%r5, [%r8 + 0x0e64] %asi
	.word 0xce320009  ! 2175: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc3020009  ! 2175: LDF_R	ld	[%r8, %r9], %f1
	.word 0xcc4a2ba4  ! 2175: LDSB_I	ldsb	[%r8 + 0x0ba4], %r6
	.word 0xc93a0009  ! 2178: STDF_R	std	%f4, [%r9, %r8]
	.word 0xf24a0009  ! 2178: LDSB_R	ldsb	[%r8 + %r9], %r25
	.word 0xcff22009  ! 2178: CASXA_R	casxa	[%r8]%asi, %r9, %r7
	.word 0xc2720009  ! 2181: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xca4a0009  ! 2181: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xa8520009  ! 2181: UMUL_R	umul 	%r8, %r9, %r20
	.word 0xc82a0009  ! 2184: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc2020009  ! 2184: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xc28a1009  ! 2184: LDUBA_R	lduba	[%r8, %r9] 0x80, %r1
	.word 0xc4720009  ! 2187: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xce4a0009  ! 2187: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xc4ba2618  ! 2187: STDA_I	stda	%r2, [%r8 + 0x0618] %asi
	.word 0xe0720009  ! 2190: STX_R	stx	%r16, [%r8 + %r9]
	.word 0xf81a0009  ! 2190: LDD_R	ldd	[%r8 + %r9], %r28
	.word 0x8143e06c  ! 2190: MEMBAR	membar	#LoadStore | #StoreStore | #MemIssue | #Sync 
	.word 0xc7220009  ! 2193: STF_R	st	%f3, [%r9, %r8]
	.word 0xcf020009  ! 2193: LDF_R	ld	[%r8, %r9], %f7
	.word 0xc36a0009  ! 2193: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xce220009  ! 2196: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xdf020009  ! 2196: LDF_R	ld	[%r8, %r9], %f15
	.word 0xca420009  ! 2196: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xca2a0009  ! 2199: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc8020009  ! 2199: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xf8ba1009  ! 2199: STDA_R	stda	%r28, [%r8 + %r9] 0x80
	.word 0xc93a0009  ! 2202: STDF_R	std	%f4, [%r9, %r8]
	.word 0xcc120009  ! 2202: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xa2520009  ! 2202: UMUL_R	umul 	%r8, %r9, %r17
	.word 0xc2320009  ! 2205: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xca120009  ! 2205: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0x827a2a6c  ! 2205: SDIV_I	sdiv 	%r8, 0x0a6c, %r1
	.word 0xcc320009  ! 2208: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc45a0009  ! 2208: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0x2cca0001  ! 2208: BRGZ	brgz,a,pt	%8,<label_0xa0001>
	.word 0xe53a0009  ! 2211: STDF_R	std	%f18, [%r9, %r8]
	.word 0xec020009  ! 2211: LDUW_R	lduw	[%r8 + %r9], %r22
	.word 0x8143e07b  ! 2211: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xfa720009  ! 2214: STX_R	stx	%r29, [%r8 + %r9]
	.word 0xc4020009  ! 2214: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0x827a0009  ! 2214: SDIV_R	sdiv 	%r8, %r9, %r1
	.word 0xcc220009  ! 2217: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xcf020009  ! 2217: LDF_R	ld	[%r8, %r9], %f7
	.word 0xc4ba2eb0  ! 2217: STDA_I	stda	%r2, [%r8 + 0x0eb0] %asi
	.word 0xcf220009  ! 2220: STF_R	st	%f7, [%r9, %r8]
	.word 0xc4520009  ! 2220: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0x8e7a2f40  ! 2220: SDIV_I	sdiv 	%r8, 0x0f40, %r7
	.word 0xcc220009  ! 2223: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xec420009  ! 2223: LDSW_R	ldsw	[%r8 + %r9], %r22
	.word 0xc6f22e68  ! 2223: STXA_I	stxa	%r3, [%r8 + 0x0e68] %asi
	.word 0xc5220009  ! 2226: STF_R	st	%f2, [%r9, %r8]
	.word 0xc71a0009  ! 2226: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xc7e22009  ! 2226: CASA_R	casa	[%r8] %asi, %r9, %r3
	.word 0xee720009  ! 2229: STX_R	stx	%r23, [%r8 + %r9]
	.word 0xcc1a0009  ! 2229: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0x3c800001  ! 2229: BPOS	bpos,a	<label_0x1>
	.word 0xd7220009  ! 2232: STF_R	st	%f11, [%r9, %r8]
	.word 0xc24a0009  ! 2232: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0x876a2d64  ! 2232: SDIVX_I	sdivx	%r8, 0x0d64, %r3
	.word 0xc33a0009  ! 2235: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc5020009  ! 2235: LDF_R	ld	[%r8, %r9], %f2
	.word 0x8143e065  ! 2235: MEMBAR	membar	#LoadLoad | #LoadStore | #MemIssue | #Sync 
	.word 0xcc220009  ! 2238: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xcc0a0009  ! 2238: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0x8143c000  ! 2238: STBAR	stbar
	.word 0xc4320009  ! 2241: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xf4420009  ! 2241: LDSW_R	ldsw	[%r8 + %r9], %r26
	.word 0xcc1a0009  ! 2241: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xc4220009  ! 2244: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc80a0009  ! 2244: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xc53a0009  ! 2244: STDF_R	std	%f2, [%r9, %r8]
	.word 0xe62a0009  ! 2247: STB_R	stb	%r19, [%r8 + %r9]
	.word 0xce4a0009  ! 2247: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xca6a0009  ! 2247: LDSTUB_R	ldstub	%r5, [%r8 + %r9]
	.word 0xca320009  ! 2250: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc8020009  ! 2250: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xc6da1009  ! 2250: LDXA_R	ldxa	[%r8, %r9] 0x80, %r3
	.word 0xe0720009  ! 2253: STX_R	stx	%r16, [%r8 + %r9]
	.word 0xcc420009  ! 2253: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0x8d220009  ! 2253: MULScc_R	mulscc 	%r8, %r9, %r6
	.word 0xca220009  ! 2256: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc8020009  ! 2256: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0x8143e01b  ! 2256: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Lookaside 
	.word 0xc2220009  ! 2259: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xce020009  ! 2259: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xc36a0009  ! 2259: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xea320009  ! 2262: STH_R	sth	%r21, [%r8 + %r9]
	.word 0xc64a0009  ! 2262: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0x8143e069  ! 2262: MEMBAR	membar	#LoadLoad | #StoreStore | #MemIssue | #Sync 
	.word 0xcc2a0009  ! 2265: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc4520009  ! 2265: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0x8143c000  ! 2265: STBAR	stbar
	.word 0xce320009  ! 2268: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xfe4a0009  ! 2268: LDSB_R	ldsb	[%r8 + %r9], %r31
	.word 0xc9220009  ! 2268: STF_R	st	%f4, [%r9, %r8]
	.word 0xc4320009  ! 2271: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xe2120009  ! 2271: LDUH_R	lduh	[%r8 + %r9], %r17
	.word 0x8143c000  ! 2271: STBAR	stbar
	.word 0xc2720009  ! 2274: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc80a0009  ! 2274: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xc40a221c  ! 2274: LDUB_I	ldub	[%r8 + 0x021c], %r2
	.word 0xc82a0009  ! 2277: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc2420009  ! 2277: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0x87220009  ! 2277: MULScc_R	mulscc 	%r8, %r9, %r3
	.word 0xe6320009  ! 2280: STH_R	sth	%r19, [%r8 + %r9]
	.word 0xd6520009  ! 2280: LDSH_R	ldsh	[%r8 + %r9], %r11
	.word 0x8f6a2bb0  ! 2280: SDIVX_I	sdivx	%r8, 0x0bb0, %r7
	.word 0xf8720009  ! 2283: STX_R	stx	%r28, [%r8 + %r9]
	.word 0xf4420009  ! 2283: LDSW_R	ldsw	[%r8 + %r9], %r26
	.word 0x8c4a0009  ! 2283: MULX_R	mulx 	%r8, %r9, %r6
	.word 0xc73a0009  ! 2286: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc7020009  ! 2286: LDF_R	ld	[%r8, %r9], %f3
	.word 0xe68a2604  ! 2286: LDUBA_I	lduba	[%r8, + 0x0604] %asi, %r19
	.word 0xc3220009  ! 2289: STF_R	st	%f1, [%r9, %r8]
	.word 0xcc0a0009  ! 2289: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0x84fa0009  ! 2289: SDIVcc_R	sdivcc 	%r8, %r9, %r2
	.word 0xc6220009  ! 2292: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xe81a0009  ! 2292: LDD_R	ldd	[%r8 + %r9], %r20
	.word 0xe6fa1009  ! 2292: SWAPA_R	swapa	%r19, [%r8 + %r9] 0x80
	.word 0xcf3a0009  ! 2295: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc4520009  ! 2295: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xf7f22009  ! 2295: CASXA_R	casxa	[%r8]%asi, %r9, %r27
	.word 0xc4720009  ! 2298: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xcd1a0009  ! 2298: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xcbe22009  ! 2298: CASA_R	casa	[%r8] %asi, %r9, %r5
	.word 0xcd220009  ! 2301: STF_R	st	%f6, [%r9, %r8]
	.word 0xcd020009  ! 2301: LDF_R	ld	[%r8, %r9], %f6
	.word 0xe93a0009  ! 2301: STDF_R	std	%f20, [%r9, %r8]
	.word 0xc7220009  ! 2304: STF_R	st	%f3, [%r9, %r8]
	.word 0xc5020009  ! 2304: LDF_R	ld	[%r8, %r9], %f2
	.word 0xc0ba1009  ! 2304: STDA_R	stda	%r0, [%r8 + %r9] 0x80
	.word 0xea2a0009  ! 2307: STB_R	stb	%r21, [%r8 + %r9]
	.word 0xc71a0009  ! 2307: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0x8c4a0009  ! 2307: MULX_R	mulx 	%r8, %r9, %r6
	.word 0xcf220009  ! 2310: STF_R	st	%f7, [%r9, %r8]
	.word 0xcc4a0009  ! 2310: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xcb020009  ! 2310: LDF_R	ld	[%r8, %r9], %f5
	.word 0xcb3a0009  ! 2313: STDF_R	std	%f5, [%r9, %r8]
	.word 0xe6120009  ! 2313: LDUH_R	lduh	[%r8 + %r9], %r19
	.word 0xc4ba2230  ! 2313: STDA_I	stda	%r2, [%r8 + 0x0230] %asi
	.word 0xc9220009  ! 2316: STF_R	st	%f4, [%r9, %r8]
	.word 0xd8420009  ! 2316: LDSW_R	ldsw	[%r8 + %r9], %r12
	.word 0xf8aa2ff8  ! 2316: STBA_I	stba	%r28, [%r8 + 0x0ff8] %asi
	.word 0xdf220009  ! 2319: STF_R	st	%f15, [%r9, %r8]
	.word 0xc20a0009  ! 2319: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0x8143e02f  ! 2319: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #MemIssue 
	.word 0xe6320009  ! 2322: STH_R	sth	%r19, [%r8 + %r9]
	.word 0xc60a0009  ! 2322: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xc3020009  ! 2322: LDF_R	ld	[%r8, %r9], %f1
	.word 0xcc320009  ! 2325: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xca020009  ! 2325: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0x2eca0001  ! 2325: BRGEZ	brgez,a,pt	%8,<label_0xa0001>
	.word 0xf0320009  ! 2328: STH_R	sth	%r24, [%r8 + %r9]
	.word 0xfc520009  ! 2328: LDSH_R	ldsh	[%r8 + %r9], %r30
	.word 0x867220f4  ! 2328: UDIV_I	udiv 	%r8, 0x00f4, %r3
	.word 0xcb3a0009  ! 2331: STDF_R	std	%f5, [%r9, %r8]
	.word 0xc81a0009  ! 2331: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xc84a2cec  ! 2331: LDSB_I	ldsb	[%r8 + 0x0cec], %r4
	.word 0xf0220009  ! 2334: STW_R	stw	%r24, [%r8 + %r9]
	.word 0xca420009  ! 2334: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0x866a2d40  ! 2334: UDIVX_I	udivx 	%r8, 0x0d40, %r3
	.word 0xca720009  ! 2337: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xef020009  ! 2337: LDF_R	ld	[%r8, %r9], %f23
	.word 0x8143c000  ! 2337: STBAR	stbar
	.word 0xf4220009  ! 2340: STW_R	stw	%r26, [%r8 + %r9]
	.word 0xfc1a0009  ! 2340: LDD_R	ldd	[%r8 + %r9], %r30
	.word 0x8a520009  ! 2340: UMUL_R	umul 	%r8, %r9, %r5
	.word 0xe4220009  ! 2343: STW_R	stw	%r18, [%r8 + %r9]
	.word 0xf6420009  ! 2343: LDSW_R	ldsw	[%r8 + %r9], %r27
	.word 0x8872232c  ! 2343: UDIV_I	udiv 	%r8, 0x032c, %r4
	.word 0xec320009  ! 2346: STH_R	sth	%r22, [%r8 + %r9]
	.word 0xf8020009  ! 2346: LDUW_R	lduw	[%r8 + %r9], %r28
	.word 0x8143e026  ! 2346: MEMBAR	membar	#StoreLoad | #LoadStore | #MemIssue 
	.word 0xf82a0009  ! 2349: STB_R	stb	%r28, [%r8 + %r9]
	.word 0xca420009  ! 2349: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xc27a0009  ! 2349: SWAP_R	swap	%r1, [%r8 + %r9]
	.word 0xcd3a0009  ! 2352: STDF_R	std	%f6, [%r9, %r8]
	.word 0xea520009  ! 2352: LDSH_R	ldsh	[%r8 + %r9], %r21
	.word 0xcaa21009  ! 2352: STWA_R	stwa	%r5, [%r8 + %r9] 0x80
	.word 0xce320009  ! 2355: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xf0120009  ! 2355: LDUH_R	lduh	[%r8 + %r9], %r24
	.word 0xcc9a1009  ! 2355: LDDA_R	ldda	[%r8, %r9] 0x80, %r6
	.word 0xd6320009  ! 2358: STH_R	sth	%r11, [%r8 + %r9]
	.word 0xc2120009  ! 2358: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xdd3a0009  ! 2358: STDF_R	std	%f14, [%r9, %r8]
	.word 0xc82a0009  ! 2361: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xcc4a0009  ! 2361: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xc2a22250  ! 2361: STWA_I	stwa	%r1, [%r8 + 0x0250] %asi
	.word 0xf8720009  ! 2364: STX_R	stx	%r28, [%r8 + %r9]
	.word 0xd8420009  ! 2364: LDSW_R	ldsw	[%r8 + %r9], %r12
	.word 0x87a20829  ! 2364: FADDs	fadds	%f8, %f9, %f3
	.word 0xca220009  ! 2367: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xee5a0009  ! 2367: LDX_R	ldx	[%r8 + %r9], %r23
	.word 0x89220009  ! 2367: MULScc_R	mulscc 	%r8, %r9, %r4
	.word 0xcb220009  ! 2370: STF_R	st	%f5, [%r9, %r8]
	.word 0xc9020009  ! 2370: LDF_R	ld	[%r8, %r9], %f4
	.word 0xc36a0009  ! 2370: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xfc2a0009  ! 2373: STB_R	stb	%r30, [%r8 + %r9]
	.word 0xc31a0009  ! 2373: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xe0ba2368  ! 2373: STDA_I	stda	%r16, [%r8 + 0x0368] %asi
	.word 0xf22a0009  ! 2376: STB_R	stb	%r25, [%r8 + %r9]
	.word 0xe31a0009  ! 2376: LDDF_R	ldd	[%r8, %r9], %f17
	.word 0xcac21009  ! 2376: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r5
	.word 0xf3220009  ! 2379: STF_R	st	%f25, [%r9, %r8]
	.word 0xc3020009  ! 2379: LDF_R	ld	[%r8, %r9], %f1
	.word 0x8143c000  ! 2379: STBAR	stbar
	.word 0xc4220009  ! 2382: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc84a0009  ! 2382: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xaba209a9  ! 2382: FDIVs	fdivs	%f8, %f9, %f21
	.word 0xcc220009  ! 2385: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc8020009  ! 2385: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0x98d221e8  ! 2385: UMULcc_I	umulcc 	%r8, 0x01e8, %r12
	.word 0xce720009  ! 2388: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc45a0009  ! 2388: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0x8a7a0009  ! 2388: SDIV_R	sdiv 	%r8, %r9, %r5
	.word 0xc4220009  ! 2391: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xf11a0009  ! 2391: LDDF_R	ldd	[%r8, %r9], %f24
	.word 0xc2f22008  ! 2391: STXA_I	stxa	%r1, [%r8 + 0x0008] %asi
	.word 0xee2a0009  ! 2394: STB_R	stb	%r23, [%r8 + %r9]
	.word 0xc3020009  ! 2394: LDF_R	ld	[%r8, %r9], %f1
	.word 0x04c20001  ! 2394: BRLEZ	brlez  ,nt	%8,<label_0x20001>
	.word 0xc2220009  ! 2397: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xf80a0009  ! 2397: LDUB_R	ldub	[%r8 + %r9], %r28
	.word 0x9e720009  ! 2397: UDIV_R	udiv 	%r8, %r9, %r15
	.word 0xfc2a0009  ! 2400: STB_R	stb	%r30, [%r8 + %r9]
	.word 0xc44a0009  ! 2400: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xf0a2241c  ! 2400: STWA_I	stwa	%r24, [%r8 + 0x041c] %asi
	.word 0xdf3a0009  ! 2403: STDF_R	std	%f15, [%r9, %r8]
	.word 0xee0a0009  ! 2403: LDUB_R	ldub	[%r8 + %r9], %r23
	.word 0x88d22e68  ! 2403: UMULcc_I	umulcc 	%r8, 0x0e68, %r4
	.word 0xc8220009  ! 2406: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xe25a0009  ! 2406: LDX_R	ldx	[%r8 + %r9], %r17
	.word 0xaeda0009  ! 2406: SMULcc_R	smulcc 	%r8, %r9, %r23
	.word 0xc3220009  ! 2409: STF_R	st	%f1, [%r9, %r8]
	.word 0xc51a0009  ! 2409: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xc8522910  ! 2409: LDSH_I	ldsh	[%r8 + 0x0910], %r4
	.word 0xca2a0009  ! 2412: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xd8420009  ! 2412: LDSW_R	ldsw	[%r8 + %r9], %r12
	.word 0xcaea1009  ! 2412: LDSTUBA_R	ldstuba	%r5, [%r8 + %r9] 0x80
	.word 0xca320009  ! 2415: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xcc1a0009  ! 2415: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0x8143c000  ! 2415: STBAR	stbar
	.word 0xc3220009  ! 2418: STF_R	st	%f1, [%r9, %r8]
	.word 0xfc1a0009  ! 2418: LDD_R	ldd	[%r8 + %r9], %r30
	.word 0xc45a0009  ! 2418: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xd8220009  ! 2421: STW_R	stw	%r12, [%r8 + %r9]
	.word 0xc91a0009  ! 2421: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0x0a800002  ! 2421: BCS	bcs  	<label_0x2>
	.word 0xc2220009  ! 2424: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xde0a0009  ! 2424: LDUB_R	ldub	[%r8 + %r9], %r15
	.word 0xf8b22598  ! 2424: STHA_I	stha	%r28, [%r8 + 0x0598] %asi
	.word 0xe53a0009  ! 2427: STDF_R	std	%f18, [%r9, %r8]
	.word 0xc84a0009  ! 2427: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0x82fa0009  ! 2427: SDIVcc_R	sdivcc 	%r8, %r9, %r1
	.word 0xce320009  ! 2430: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xcd020009  ! 2430: LDF_R	ld	[%r8, %r9], %f6
	.word 0xca921009  ! 2430: LDUHA_R	lduha	[%r8, %r9] 0x80, %r5
	.word 0xcc720009  ! 2433: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xe80a0009  ! 2433: LDUB_R	ldub	[%r8 + %r9], %r20
	.word 0xceea1009  ! 2433: LDSTUBA_R	ldstuba	%r7, [%r8 + %r9] 0x80
	.word 0xc6720009  ! 2436: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc44a0009  ! 2436: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xc8ea2534  ! 2436: LDSTUBA_I	ldstuba	%r4, [%r8 + 0x0534] %asi
	.word 0xcb3a0009  ! 2439: STDF_R	std	%f5, [%r9, %r8]
	.word 0xf31a0009  ! 2439: LDDF_R	ldd	[%r8, %r9], %f25
	.word 0x8c4a2108  ! 2439: MULX_I	mulx 	%r8, 0x0108, %r6
	.word 0xec720009  ! 2442: STX_R	stx	%r22, [%r8 + %r9]
	.word 0xcc420009  ! 2442: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xccb22cb0  ! 2442: STHA_I	stha	%r6, [%r8 + 0x0cb0] %asi
	.word 0xc6220009  ! 2445: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc3020009  ! 2445: LDF_R	ld	[%r8, %r9], %f1
	.word 0x8143e074  ! 2445: MEMBAR	membar	#LoadStore | #Lookaside | #MemIssue | #Sync 
	.word 0xcf3a0009  ! 2448: STDF_R	std	%f7, [%r9, %r8]
	.word 0xcc420009  ! 2448: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0x836a0009  ! 2448: SDIVX_R	sdivx	%r8, %r9, %r1
	.word 0xe33a0009  ! 2451: STDF_R	std	%f17, [%r9, %r8]
	.word 0xc41a0009  ! 2451: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xcb222088  ! 2451: STF_I	st	%f5, [0x0088, %r8]
	.word 0xc8720009  ! 2454: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xcc420009  ! 2454: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0x14800001  ! 2454: BG	bg  	<label_0x1>
	.word 0xc8320009  ! 2457: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc9020009  ! 2457: LDF_R	ld	[%r8, %r9], %f4
	.word 0xd67a0009  ! 2457: SWAP_R	swap	%r11, [%r8 + %r9]
	.word 0xc2720009  ! 2460: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xcc4a0009  ! 2460: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xc36a20d4  ! 2460: PREFETCH_I	prefetch	[%r8 + 0x00d4], #one_read
	.word 0xc42a0009  ! 2463: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc3020009  ! 2463: LDF_R	ld	[%r8, %r9], %f1
	.word 0xceea1009  ! 2463: LDSTUBA_R	ldstuba	%r7, [%r8 + %r9] 0x80
	.word 0xc22a0009  ! 2466: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xca420009  ! 2466: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xf05a2348  ! 2466: LDX_I	ldx	[%r8 + 0x0348], %r24
	.word 0xe8320009  ! 2469: STH_R	sth	%r20, [%r8 + %r9]
	.word 0xe0520009  ! 2469: LDSH_R	ldsh	[%r8 + %r9], %r16
	.word 0x8a6a0009  ! 2469: UDIVX_R	udivx 	%r8, %r9, %r5
	.word 0xf42a0009  ! 2472: STB_R	stb	%r26, [%r8 + %r9]
	.word 0xce120009  ! 2472: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0x8143e009  ! 2472: MEMBAR	membar	#LoadLoad | #StoreStore 
	.word 0xc82a0009  ! 2475: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xd41a0009  ! 2475: LDD_R	ldd	[%r8 + %r9], %r10
	.word 0xf13a2820  ! 2475: STDF_I	std	%f24, [0x0820, %r8]
	.word 0xc33a0009  ! 2478: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc4120009  ! 2478: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0x8143c000  ! 2478: STBAR	stbar
	.word 0xce220009  ! 2481: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc9020009  ! 2481: LDF_R	ld	[%r8, %r9], %f4
	.word 0xc3ea1009  ! 2481: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc2320009  ! 2484: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc91a0009  ! 2484: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xcc9a2f40  ! 2484: LDDA_I	ldda	[%r8, + 0x0f40] %asi, %r6
	.word 0xcf3a0009  ! 2487: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc81a0009  ! 2487: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xd602254c  ! 2487: LDUW_I	lduw	[%r8 + 0x054c], %r11
	.word 0xce320009  ! 2490: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc25a0009  ! 2490: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xc2ea2170  ! 2490: LDSTUBA_I	ldstuba	%r1, [%r8 + 0x0170] %asi
	.word 0xc8320009  ! 2493: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xff020009  ! 2493: LDF_R	ld	[%r8, %r9], %f31
	.word 0xc93a2b50  ! 2493: STDF_I	std	%f4, [0x0b50, %r8]
	.word 0xc73a0009  ! 2496: STDF_R	std	%f3, [%r9, %r8]
	.word 0xee5a0009  ! 2496: LDX_R	ldx	[%r8 + %r9], %r23
	.word 0xc3ea1009  ! 2496: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc4220009  ! 2499: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xe40a0009  ! 2499: LDUB_R	ldub	[%r8 + %r9], %r18
	.word 0x8143e020  ! 2499: MEMBAR	membar	#MemIssue 
	.word 0xc42a0009  ! 2502: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xca4a0009  ! 2502: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xcbe21009  ! 2502: CASA_I	casa	[%r8] 0x80, %r9, %r5
	.word 0xe6220009  ! 2505: STW_R	stw	%r19, [%r8 + %r9]
	.word 0xca0a0009  ! 2505: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xec8a21fc  ! 2505: LDUBA_I	lduba	[%r8, + 0x01fc] %asi, %r22
	.word 0xd73a0009  ! 2508: STDF_R	std	%f11, [%r9, %r8]
	.word 0xee020009  ! 2508: LDUW_R	lduw	[%r8 + %r9], %r23
	.word 0xc8c22828  ! 2508: LDSWA_I	ldswa	[%r8, + 0x0828] %asi, %r4
	.word 0xe53a0009  ! 2511: STDF_R	std	%f18, [%r9, %r8]
	.word 0xc6520009  ! 2511: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0x14800002  ! 2511: BG	bg  	<label_0x2>
	.word 0xcc2a0009  ! 2514: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc6120009  ! 2514: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0x8e720009  ! 2514: UDIV_R	udiv 	%r8, %r9, %r7
	.word 0xc8220009  ! 2517: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc4020009  ! 2517: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0x87a209a9  ! 2517: FDIVs	fdivs	%f8, %f9, %f3
	.word 0xcd220009  ! 2520: STF_R	st	%f6, [%r9, %r8]
	.word 0xca0a0009  ! 2520: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0x8c520009  ! 2520: UMUL_R	umul 	%r8, %r9, %r6
	.word 0xcf3a0009  ! 2523: STDF_R	std	%f7, [%r9, %r8]
	.word 0xde5a0009  ! 2523: LDX_R	ldx	[%r8 + %r9], %r15
	.word 0xf80a0009  ! 2523: LDUB_R	ldub	[%r8 + %r9], %r28
	.word 0xd8220009  ! 2526: STW_R	stw	%r12, [%r8 + %r9]
	.word 0xca120009  ! 2526: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xf2ea2d24  ! 2526: LDSTUBA_I	ldstuba	%r25, [%r8 + 0x0d24] %asi
	.word 0xc2220009  ! 2529: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xcc020009  ! 2529: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xa5220009  ! 2529: MULScc_R	mulscc 	%r8, %r9, %r18
	.word 0xf4220009  ! 2532: STW_R	stw	%r26, [%r8 + %r9]
	.word 0xc7020009  ! 2532: LDF_R	ld	[%r8, %r9], %f3
	.word 0xdad22424  ! 2532: LDSHA_I	ldsha	[%r8, + 0x0424] %asi, %r13
	.word 0xf2720009  ! 2535: STX_R	stx	%r25, [%r8 + %r9]
	.word 0xca420009  ! 2535: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xc4b2221c  ! 2535: STHA_I	stha	%r2, [%r8 + 0x021c] %asi
	.word 0xcf220009  ! 2538: STF_R	st	%f7, [%r9, %r8]
	.word 0xc8520009  ! 2538: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0x985a2b0c  ! 2538: SMUL_I	smul 	%r8, 0x0b0c, %r12
	.word 0xfe220009  ! 2541: STW_R	stw	%r31, [%r8 + %r9]
	.word 0xc8120009  ! 2541: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xb25a0009  ! 2541: SMUL_R	smul 	%r8, %r9, %r25
	.word 0xc5220009  ! 2544: STF_R	st	%f2, [%r9, %r8]
	.word 0xf65a0009  ! 2544: LDX_R	ldx	[%r8 + %r9], %r27
	.word 0xe89a1009  ! 2544: LDDA_R	ldda	[%r8, %r9] 0x80, %r20
	.word 0xc8720009  ! 2547: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc9020009  ! 2547: LDF_R	ld	[%r8, %r9], %f4
	.word 0xc4a22e68  ! 2547: STWA_I	stwa	%r2, [%r8 + 0x0e68] %asi
	.word 0xc2220009  ! 2550: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xcc0a0009  ! 2550: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xdc822a58  ! 2550: LDUWA_I	lduwa	[%r8, + 0x0a58] %asi, %r14
	.word 0xce320009  ! 2553: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc80a0009  ! 2553: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xc4a21009  ! 2553: STWA_R	stwa	%r2, [%r8 + %r9] 0x80
	.word 0xcc220009  ! 2556: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xcd020009  ! 2556: LDF_R	ld	[%r8, %r9], %f6
	.word 0xccfa1009  ! 2556: SWAPA_R	swapa	%r6, [%r8 + %r9] 0x80
	.word 0xda720009  ! 2559: STX_R	stx	%r13, [%r8 + %r9]
	.word 0xc84a0009  ! 2559: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xc5f21009  ! 2559: CASXA_I	casxa	[%r8] 0x80, %r9, %r2
	.word 0xcf220009  ! 2562: STF_R	st	%f7, [%r9, %r8]
	.word 0xc65a0009  ! 2562: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xfa420009  ! 2562: LDSW_R	ldsw	[%r8 + %r9], %r29
	.word 0xc53a0009  ! 2565: STDF_R	std	%f2, [%r9, %r8]
	.word 0xec4a0009  ! 2565: LDSB_R	ldsb	[%r8 + %r9], %r22
	.word 0xc36a22cc  ! 2565: PREFETCH_I	prefetch	[%r8 + 0x02cc], #one_read
	.word 0xcc320009  ! 2568: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xcc020009  ! 2568: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0x8143c000  ! 2568: STBAR	stbar
	.word 0xc7220009  ! 2571: STF_R	st	%f3, [%r9, %r8]
	.word 0xcb1a0009  ! 2571: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0x8143e056  ! 2571: MEMBAR	membar	#StoreLoad | #LoadStore | #Lookaside | #Sync 
	.word 0xc62a0009  ! 2574: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc91a0009  ! 2574: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0x827a2bcc  ! 2574: SDIV_I	sdiv 	%r8, 0x0bcc, %r1
	.word 0xc5220009  ! 2577: STF_R	st	%f2, [%r9, %r8]
	.word 0xe04a0009  ! 2577: LDSB_R	ldsb	[%r8 + %r9], %r16
	.word 0x1a800001  ! 2577: BCC	bcc  	<label_0x1>
	.word 0xc8220009  ! 2580: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc44a0009  ! 2580: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xd8ea244c  ! 2580: LDSTUBA_I	ldstuba	%r12, [%r8 + 0x044c] %asi
	.word 0xfc220009  ! 2583: STW_R	stw	%r30, [%r8 + %r9]
	.word 0xfe120009  ! 2583: LDUH_R	lduh	[%r8 + %r9], %r31
	.word 0x36800001  ! 2583: BGE	bge,a	<label_0x1>
	.word 0xcf220009  ! 2586: STF_R	st	%f7, [%r9, %r8]
	.word 0xfc020009  ! 2586: LDUW_R	lduw	[%r8 + %r9], %r30
	.word 0x8da209a9  ! 2586: FDIVs	fdivs	%f8, %f9, %f6
	.word 0xe22a0009  ! 2589: STB_R	stb	%r17, [%r8 + %r9]
	.word 0xcc4a0009  ! 2589: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xc6f229a8  ! 2589: STXA_I	stxa	%r3, [%r8 + 0x09a8] %asi
	.word 0xc53a0009  ! 2592: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc4520009  ! 2592: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0x85a20929  ! 2592: FMULs	fmuls	%f8, %f9, %f2
	.word 0xc62a0009  ! 2595: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xe3020009  ! 2595: LDF_R	ld	[%r8, %r9], %f17
	.word 0xbb222984  ! 2595: MULScc_I	mulscc 	%r8, 0x0984, %r29
	.word 0xc6320009  ! 2598: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc6020009  ! 2598: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0x3c800001  ! 2598: BPOS	bpos,a	<label_0x1>
	.word 0xcd220009  ! 2601: STF_R	st	%f6, [%r9, %r8]
	.word 0xc8420009  ! 2601: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xde821009  ! 2601: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r15
	.word 0xe6320009  ! 2604: STH_R	sth	%r19, [%r8 + %r9]
	.word 0xce420009  ! 2604: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0x32800001  ! 2604: BNE	bne,a	<label_0x1>
	.word 0xca220009  ! 2607: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc9020009  ! 2607: LDF_R	ld	[%r8, %r9], %f4
	.word 0xc2822898  ! 2607: LDUWA_I	lduwa	[%r8, + 0x0898] %asi, %r1
	.word 0xdc2a0009  ! 2610: STB_R	stb	%r14, [%r8 + %r9]
	.word 0xc31a0009  ! 2610: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0x8afa0009  ! 2610: SDIVcc_R	sdivcc 	%r8, %r9, %r5
	.word 0xda2a0009  ! 2613: STB_R	stb	%r13, [%r8 + %r9]
	.word 0xc85a0009  ! 2613: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xcea220d8  ! 2613: STWA_I	stwa	%r7, [%r8 + 0x00d8] %asi
	.word 0xcb220009  ! 2616: STF_R	st	%f5, [%r9, %r8]
	.word 0xc2420009  ! 2616: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xa6f20009  ! 2616: UDIVcc_R	udivcc 	%r8, %r9, %r19
	.word 0xc93a0009  ! 2619: STDF_R	std	%f4, [%r9, %r8]
	.word 0xc4520009  ! 2619: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0x8143e02d  ! 2619: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #MemIssue 
	.word 0xc4720009  ! 2622: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xe2120009  ! 2622: LDUH_R	lduh	[%r8 + %r9], %r17
	.word 0xca922b18  ! 2622: LDUHA_I	lduha	[%r8, + 0x0b18] %asi, %r5
	.word 0xce220009  ! 2625: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xca420009  ! 2625: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xc8520009  ! 2625: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xc4320009  ! 2628: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xee4a0009  ! 2628: LDSB_R	ldsb	[%r8 + %r9], %r23
	.word 0xc49a1009  ! 2628: LDDA_R	ldda	[%r8, %r9] 0x80, %r2
	.word 0xc42a0009  ! 2631: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc85a0009  ! 2631: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xe6ea1009  ! 2631: LDSTUBA_R	ldstuba	%r19, [%r8 + %r9] 0x80
	.word 0xc42a0009  ! 2634: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc6420009  ! 2634: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0x89a20929  ! 2634: FMULs	fmuls	%f8, %f9, %f4
	.word 0xce2a0009  ! 2637: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xca5a0009  ! 2637: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xccc21009  ! 2637: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r6
	.word 0xc62a0009  ! 2640: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xec420009  ! 2640: LDSW_R	ldsw	[%r8 + %r9], %r22
	.word 0xe5f21009  ! 2640: CASXA_I	casxa	[%r8] 0x80, %r9, %r18
	.word 0xc6220009  ! 2643: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xcc520009  ! 2643: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0x3c800001  ! 2643: BPOS	bpos,a	<label_0x1>
	.word 0xc7220009  ! 2646: STF_R	st	%f3, [%r9, %r8]
	.word 0xf4120009  ! 2646: LDUH_R	lduh	[%r8 + %r9], %r26
	.word 0xc80a0009  ! 2646: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xc6320009  ! 2649: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xe51a0009  ! 2649: LDDF_R	ldd	[%r8, %r9], %f18
	.word 0x8a720009  ! 2649: UDIV_R	udiv 	%r8, %r9, %r5
	.word 0xcd220009  ! 2652: STF_R	st	%f6, [%r9, %r8]
	.word 0xfc020009  ! 2652: LDUW_R	lduw	[%r8 + %r9], %r30
	.word 0xe06a0009  ! 2652: LDSTUB_R	ldstub	%r16, [%r8 + %r9]
	.word 0xc6220009  ! 2655: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xca120009  ! 2655: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xcf3a2158  ! 2655: STDF_I	std	%f7, [0x0158, %r8]
	.word 0xe42a0009  ! 2658: STB_R	stb	%r18, [%r8 + %r9]
	.word 0xd6420009  ! 2658: LDSW_R	ldsw	[%r8 + %r9], %r11
	.word 0x8143e069  ! 2658: MEMBAR	membar	#LoadLoad | #StoreStore | #MemIssue | #Sync 
	.word 0xcd3a0009  ! 2661: STDF_R	std	%f6, [%r9, %r8]
	.word 0xfb1a0009  ! 2661: LDDF_R	ldd	[%r8, %r9], %f29
	.word 0x88f20009  ! 2661: UDIVcc_R	udivcc 	%r8, %r9, %r4
	.word 0xc4720009  ! 2664: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xcc4a0009  ! 2664: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xcc1a28e0  ! 2664: LDD_I	ldd	[%r8 + 0x08e0], %r6
	.word 0xe4720009  ! 2667: STX_R	stx	%r18, [%r8 + %r9]
	.word 0xcc1a0009  ! 2667: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0x865a0009  ! 2667: SMUL_R	smul 	%r8, %r9, %r3
	.word 0xf2320009  ! 2670: STH_R	sth	%r25, [%r8 + %r9]
	.word 0xfd1a0009  ! 2670: LDDF_R	ldd	[%r8, %r9], %f30
	.word 0xcaea2ab4  ! 2670: LDSTUBA_I	ldstuba	%r5, [%r8 + 0x0ab4] %asi
	.word 0xcd220009  ! 2673: STF_R	st	%f6, [%r9, %r8]
	.word 0xc44a0009  ! 2673: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0x2a800001  ! 2673: BCS	bcs,a	<label_0x1>
	.word 0xcc320009  ! 2676: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xe40a0009  ! 2676: LDUB_R	ldub	[%r8 + %r9], %r18
	.word 0xfc120009  ! 2676: LDUH_R	lduh	[%r8 + %r9], %r30
	.word 0xee2a0009  ! 2679: STB_R	stb	%r23, [%r8 + %r9]
	.word 0xc2020009  ! 2679: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0x844a2568  ! 2679: MULX_I	mulx 	%r8, 0x0568, %r2
	.word 0xcc220009  ! 2682: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xdd1a0009  ! 2682: LDDF_R	ldd	[%r8, %r9], %f14
	.word 0x2aca0001  ! 2682: BRNZ	brnz,a,pt	%8,<label_0xa0001>
	.word 0xc82a0009  ! 2685: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc2520009  ! 2685: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xf0aa1009  ! 2685: STBA_R	stba	%r24, [%r8 + %r9] 0x80
	.word 0xc73a0009  ! 2688: STDF_R	std	%f3, [%r9, %r8]
	.word 0xd41a0009  ! 2688: LDD_R	ldd	[%r8 + %r9], %r10
	.word 0xcafa1009  ! 2688: SWAPA_R	swapa	%r5, [%r8 + %r9] 0x80
	.word 0xca2a0009  ! 2691: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xe81a0009  ! 2691: LDD_R	ldd	[%r8 + %r9], %r20
	.word 0x86522850  ! 2691: UMUL_I	umul 	%r8, 0x0850, %r3
	.word 0xc33a0009  ! 2694: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc81a0009  ! 2694: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xc3ea1009  ! 2694: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc6320009  ! 2697: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc4120009  ! 2697: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xcb3a0009  ! 2697: STDF_R	std	%f5, [%r9, %r8]
	.word 0xf13a0009  ! 2700: STDF_R	std	%f24, [%r9, %r8]
	.word 0xcc1a0009  ! 2700: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xc2ea1009  ! 2700: LDSTUBA_R	ldstuba	%r1, [%r8 + %r9] 0x80
	.word 0xe02a0009  ! 2703: STB_R	stb	%r16, [%r8 + %r9]
	.word 0xce0a0009  ! 2703: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xa46a2030  ! 2703: UDIVX_I	udivx 	%r8, 0x0030, %r18
	.word 0xe82a0009  ! 2706: STB_R	stb	%r20, [%r8 + %r9]
	.word 0xc65a0009  ! 2706: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xcb3a0009  ! 2706: STDF_R	std	%f5, [%r9, %r8]
	.word 0xcc220009  ! 2709: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc01a0009  ! 2709: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0xdf220009  ! 2709: STF_R	st	%f15, [%r9, %r8]
	.word 0xe73a0009  ! 2712: STDF_R	std	%f19, [%r9, %r8]
	.word 0xd6420009  ! 2712: LDSW_R	ldsw	[%r8 + %r9], %r11
	.word 0x884a0009  ! 2712: MULX_R	mulx 	%r8, %r9, %r4
	.word 0xfb3a0009  ! 2715: STDF_R	std	%f29, [%r9, %r8]
	.word 0xf64a0009  ! 2715: LDSB_R	ldsb	[%r8 + %r9], %r27
	.word 0xf4b21009  ! 2715: STHA_R	stha	%r26, [%r8 + %r9] 0x80
	.word 0xfe720009  ! 2718: STX_R	stx	%r31, [%r8 + %r9]
	.word 0xc60a0009  ! 2718: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xc3ea2d6c  ! 2718: PREFETCHA_I	prefetcha	[%r8, + 0x0d6c] %asi, #one_read
	.word 0xc8320009  ! 2721: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc24a0009  ! 2721: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xc2da1009  ! 2721: LDXA_R	ldxa	[%r8, %r9] 0x80, %r1
	.word 0xda720009  ! 2724: STX_R	stx	%r13, [%r8 + %r9]
	.word 0xc31a0009  ! 2724: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0x22ca0001  ! 2724: BRZ	brz,a,pt	%8,<label_0xa0001>
	.word 0xc8720009  ! 2727: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xea020009  ! 2727: LDUW_R	lduw	[%r8 + %r9], %r21
	.word 0x83220009  ! 2727: MULScc_R	mulscc 	%r8, %r9, %r1
	.word 0xe73a0009  ! 2730: STDF_R	std	%f19, [%r9, %r8]
	.word 0xca420009  ! 2730: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xd6ca1009  ! 2730: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r11
	.word 0xce2a0009  ! 2733: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xfc5a0009  ! 2733: LDX_R	ldx	[%r8 + %r9], %r30
	.word 0xb4720009  ! 2733: UDIV_R	udiv 	%r8, %r9, %r26
	.word 0xce720009  ! 2736: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc5020009  ! 2736: LDF_R	ld	[%r8, %r9], %f2
	.word 0xeca22db0  ! 2736: STWA_I	stwa	%r22, [%r8 + 0x0db0] %asi
	.word 0xc2220009  ! 2739: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xd91a0009  ! 2739: LDDF_R	ldd	[%r8, %r9], %f12
	.word 0xcb3a0009  ! 2739: STDF_R	std	%f5, [%r9, %r8]
	.word 0xf7220009  ! 2742: STF_R	st	%f27, [%r9, %r8]
	.word 0xe01a0009  ! 2742: LDD_R	ldd	[%r8 + %r9], %r16
	.word 0xcf1a0009  ! 2742: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xe73a0009  ! 2745: STDF_R	std	%f19, [%r9, %r8]
	.word 0xd6020009  ! 2745: LDUW_R	lduw	[%r8 + %r9], %r11
	.word 0x8143e033  ! 2745: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside | #MemIssue 
	.word 0xea2a0009  ! 2748: STB_R	stb	%r21, [%r8 + %r9]
	.word 0xc6520009  ! 2748: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0x26c20001  ! 2748: BRLZ	brlz,a,nt	%8,<label_0x20001>
	.word 0xea2a0009  ! 2751: STB_R	stb	%r21, [%r8 + %r9]
	.word 0xf1020009  ! 2751: LDF_R	ld	[%r8, %r9], %f24
	.word 0xaa722cf0  ! 2751: UDIV_I	udiv 	%r8, 0x0cf0, %r21
	.word 0xc82a0009  ! 2754: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc8020009  ! 2754: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0x8143e000  ! 2754: MEMBAR	membar	
	.word 0xe0220009  ! 2757: STW_R	stw	%r16, [%r8 + %r9]
	.word 0xc2120009  ! 2757: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xc6da2290  ! 2757: LDXA_I	ldxa	[%r8, + 0x0290] %asi, %r3
	.word 0xc8220009  ! 2760: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc8520009  ! 2760: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xc3ea2534  ! 2760: PREFETCHA_I	prefetcha	[%r8, + 0x0534] %asi, #one_read
	.word 0xcd3a0009  ! 2763: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc41a0009  ! 2763: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x8143c000  ! 2763: STBAR	stbar
	.word 0xe9220009  ! 2766: STF_R	st	%f20, [%r9, %r8]
	.word 0xda4a0009  ! 2766: LDSB_R	ldsb	[%r8 + %r9], %r13
	.word 0xfcd21009  ! 2766: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r30
	.word 0xee220009  ! 2769: STW_R	stw	%r23, [%r8 + %r9]
	.word 0xc31a0009  ! 2769: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xc8ca2240  ! 2769: LDSBA_I	ldsba	[%r8, + 0x0240] %asi, %r4
	.word 0xe33a0009  ! 2772: STDF_R	std	%f17, [%r9, %r8]
	.word 0xcc420009  ! 2772: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xa0fa0009  ! 2772: SDIVcc_R	sdivcc 	%r8, %r9, %r16
	.word 0xc5220009  ! 2775: STF_R	st	%f2, [%r9, %r8]
	.word 0xce5a0009  ! 2775: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xc8ba1009  ! 2775: STDA_R	stda	%r4, [%r8 + %r9] 0x80
	.word 0xc8320009  ! 2778: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xce020009  ! 2778: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xc33a2b20  ! 2778: STDF_I	std	%f1, [0x0b20, %r8]
	.word 0xde2a0009  ! 2781: STB_R	stb	%r15, [%r8 + %r9]
	.word 0xf51a0009  ! 2781: LDDF_R	ldd	[%r8, %r9], %f26
	.word 0xf41a0009  ! 2781: LDD_R	ldd	[%r8 + %r9], %r26
	.word 0xc73a0009  ! 2784: STDF_R	std	%f3, [%r9, %r8]
	.word 0xe9020009  ! 2784: LDF_R	ld	[%r8, %r9], %f20
	.word 0x8d2226a8  ! 2784: MULScc_I	mulscc 	%r8, 0x06a8, %r6
	.word 0xe4220009  ! 2787: STW_R	stw	%r18, [%r8 + %r9]
	.word 0xe0420009  ! 2787: LDSW_R	ldsw	[%r8 + %r9], %r16
	.word 0x8cfa279c  ! 2787: SDIVcc_I	sdivcc 	%r8, 0x079c, %r6
	.word 0xce220009  ! 2790: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xe85a0009  ! 2790: LDX_R	ldx	[%r8 + %r9], %r20
	.word 0x8e7a0009  ! 2790: SDIV_R	sdiv 	%r8, %r9, %r7
	.word 0xca320009  ! 2793: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xe41a0009  ! 2793: LDD_R	ldd	[%r8 + %r9], %r18
	.word 0x0cc20001  ! 2793: BRGZ	brgz  ,nt	%8,<label_0x20001>
	.word 0xce2a0009  ! 2796: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc40a0009  ! 2796: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0x8143e074  ! 2796: MEMBAR	membar	#LoadStore | #Lookaside | #MemIssue | #Sync 
	.word 0xd6220009  ! 2799: STW_R	stw	%r11, [%r8 + %r9]
	.word 0xcc520009  ! 2799: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xceca1009  ! 2799: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r7
	.word 0xd8320009  ! 2802: STH_R	sth	%r12, [%r8 + %r9]
	.word 0xe4420009  ! 2802: LDSW_R	ldsw	[%r8 + %r9], %r18
	.word 0xcbf22009  ! 2802: CASXA_R	casxa	[%r8]%asi, %r9, %r5
	.word 0xf9220009  ! 2805: STF_R	st	%f28, [%r9, %r8]
	.word 0xf6120009  ! 2805: LDUH_R	lduh	[%r8 + %r9], %r27
	.word 0x8143e050  ! 2805: MEMBAR	membar	#Lookaside | #Sync 
	.word 0xc9220009  ! 2808: STF_R	st	%f4, [%r9, %r8]
	.word 0xcf1a0009  ! 2808: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xc36a0009  ! 2808: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xf6320009  ! 2811: STH_R	sth	%r27, [%r8 + %r9]
	.word 0xce4a0009  ! 2811: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xc28a1009  ! 2811: LDUBA_R	lduba	[%r8, %r9] 0x80, %r1
	.word 0xea320009  ! 2814: STH_R	sth	%r21, [%r8 + %r9]
	.word 0xf2020009  ! 2814: LDUW_R	lduw	[%r8 + %r9], %r25
	.word 0xccea28f4  ! 2814: LDSTUBA_I	ldstuba	%r6, [%r8 + 0x08f4] %asi
	.word 0xd82a0009  ! 2817: STB_R	stb	%r12, [%r8 + %r9]
	.word 0xe41a0009  ! 2817: LDD_R	ldd	[%r8 + %r9], %r18
	.word 0x8143c000  ! 2817: STBAR	stbar
	.word 0xe0720009  ! 2820: STX_R	stx	%r16, [%r8 + %r9]
	.word 0xcf1a0009  ! 2820: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xc6921009  ! 2820: LDUHA_R	lduha	[%r8, %r9] 0x80, %r3
	.word 0xca320009  ! 2823: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc6120009  ! 2823: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xe4d21009  ! 2823: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r18
	.word 0xc93a0009  ! 2826: STDF_R	std	%f4, [%r9, %r8]
	.word 0xce5a0009  ! 2826: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xc9f22009  ! 2826: CASXA_R	casxa	[%r8]%asi, %r9, %r4
	.word 0xca220009  ! 2829: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc5020009  ! 2829: LDF_R	ld	[%r8, %r9], %f2
	.word 0xc5e22009  ! 2829: CASA_R	casa	[%r8] %asi, %r9, %r2
	.word 0xce320009  ! 2832: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xce020009  ! 2832: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0x88f20009  ! 2832: UDIVcc_R	udivcc 	%r8, %r9, %r4
	.word 0xcd3a0009  ! 2835: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc80a0009  ! 2835: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0x8cd22ee0  ! 2835: UMULcc_I	umulcc 	%r8, 0x0ee0, %r6
	.word 0xc2320009  ! 2838: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xd60a0009  ! 2838: LDUB_R	ldub	[%r8 + %r9], %r11
	.word 0xf4f21009  ! 2838: STXA_R	stxa	%r26, [%r8 + %r9] 0x80
	.word 0xcf220009  ! 2841: STF_R	st	%f7, [%r9, %r8]
	.word 0xf64a0009  ! 2841: LDSB_R	ldsb	[%r8 + %r9], %r27
	.word 0x8cfa2e10  ! 2841: SDIVcc_I	sdivcc 	%r8, 0x0e10, %r6
	.word 0xc4720009  ! 2844: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xcb1a0009  ! 2844: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0x845a0009  ! 2844: SMUL_R	smul 	%r8, %r9, %r2
	.word 0xc33a0009  ! 2847: STDF_R	std	%f1, [%r9, %r8]
	.word 0xce520009  ! 2847: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0x8143e045  ! 2847: MEMBAR	membar	#LoadLoad | #LoadStore | #Sync 
	.word 0xcc2a0009  ! 2850: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xd91a0009  ! 2850: LDDF_R	ldd	[%r8, %r9], %f12
	.word 0xcefa1009  ! 2850: SWAPA_R	swapa	%r7, [%r8 + %r9] 0x80
	.word 0xd93a0009  ! 2853: STDF_R	std	%f12, [%r9, %r8]
	.word 0xe84a0009  ! 2853: LDSB_R	ldsb	[%r8 + %r9], %r20
	.word 0x1e800001  ! 2853: BVC	bvc  	<label_0x1>
	.word 0xc4720009  ! 2856: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc81a0009  ! 2856: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x02800002  ! 2856: BE	be  	<label_0x2>
	.word 0xce320009  ! 2859: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc01a0009  ! 2859: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0xdcf22268  ! 2859: STXA_I	stxa	%r14, [%r8 + 0x0268] %asi
	.word 0xdf220009  ! 2862: STF_R	st	%f15, [%r9, %r8]
	.word 0xea120009  ! 2862: LDUH_R	lduh	[%r8 + %r9], %r21
	.word 0xcf3a0009  ! 2862: STDF_R	std	%f7, [%r9, %r8]
	.word 0xca720009  ! 2865: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xf0120009  ! 2865: LDUH_R	lduh	[%r8 + %r9], %r24
	.word 0x8e72272c  ! 2865: UDIV_I	udiv 	%r8, 0x072c, %r7
	.word 0xe8720009  ! 2868: STX_R	stx	%r20, [%r8 + %r9]
	.word 0xc31a0009  ! 2868: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xc3ea1009  ! 2868: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xcc320009  ! 2871: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xe8020009  ! 2871: LDUW_R	lduw	[%r8 + %r9], %r20
	.word 0x8da209a9  ! 2871: FDIVs	fdivs	%f8, %f9, %f6
	.word 0xc6720009  ! 2874: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xcf020009  ! 2874: LDF_R	ld	[%r8, %r9], %f7
	.word 0xe4022d44  ! 2874: LDUW_I	lduw	[%r8 + 0x0d44], %r18
	.word 0xc3220009  ! 2877: STF_R	st	%f1, [%r9, %r8]
	.word 0xc6120009  ! 2877: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0x8c720009  ! 2877: UDIV_R	udiv 	%r8, %r9, %r6
	.word 0xe4220009  ! 2880: STW_R	stw	%r18, [%r8 + %r9]
	.word 0xc31a0009  ! 2880: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0x8e72280c  ! 2880: UDIV_I	udiv 	%r8, 0x080c, %r7
	.word 0xfc320009  ! 2883: STH_R	sth	%r30, [%r8 + %r9]
	.word 0xce4a0009  ! 2883: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0x00800001  ! 2883: BN	bn  	<label_0x1>
	.word 0xee720009  ! 2886: STX_R	stx	%r23, [%r8 + %r9]
	.word 0xed1a0009  ! 2886: LDDF_R	ldd	[%r8, %r9], %f22
	.word 0xc3ea1009  ! 2886: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xe73a0009  ! 2889: STDF_R	std	%f19, [%r9, %r8]
	.word 0xd6420009  ! 2889: LDSW_R	ldsw	[%r8 + %r9], %r11
	.word 0xccf22110  ! 2889: STXA_I	stxa	%r6, [%r8 + 0x0110] %asi
	.word 0xf5220009  ! 2892: STF_R	st	%f26, [%r9, %r8]
	.word 0xdc120009  ! 2892: LDUH_R	lduh	[%r8 + %r9], %r14
	.word 0xecfa27b4  ! 2892: SWAPA_I	swapa	%r22, [%r8 + 0x07b4] %asi
	.word 0xf33a0009  ! 2895: STDF_R	std	%f25, [%r9, %r8]
	.word 0xc9020009  ! 2895: LDF_R	ld	[%r8, %r9], %f4
	.word 0xc3ea1009  ! 2895: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc2220009  ! 2898: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xca5a0009  ! 2898: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0x8efa2dc8  ! 2898: SDIVcc_I	sdivcc 	%r8, 0x0dc8, %r7
	.word 0xca320009  ! 2901: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc45a0009  ! 2901: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0x8f220009  ! 2901: MULScc_R	mulscc 	%r8, %r9, %r7
	.word 0xc22a0009  ! 2904: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xf8020009  ! 2904: LDUW_R	lduw	[%r8 + %r9], %r28
	.word 0x8ada2098  ! 2904: SMULcc_I	smulcc 	%r8, 0x0098, %r5
	.word 0xe42a0009  ! 2907: STB_R	stb	%r18, [%r8 + %r9]
	.word 0xc4120009  ! 2907: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0x06c20001  ! 2907: BRLZ	brlz  ,nt	%8,<label_0x20001>
	.word 0xc42a0009  ! 2910: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xe8020009  ! 2910: LDUW_R	lduw	[%r8 + %r9], %r20
	.word 0xc27a28a8  ! 2910: SWAP_I	swap	%r1, [%r8 + 0x08a8]
	.word 0xc33a0009  ! 2913: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc6520009  ! 2913: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xc3ea2448  ! 2913: PREFETCHA_I	prefetcha	[%r8, + 0x0448] %asi, #one_read
	.word 0xd93a0009  ! 2916: STDF_R	std	%f12, [%r9, %r8]
	.word 0xc64a0009  ! 2916: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xb4522124  ! 2916: UMUL_I	umul 	%r8, 0x0124, %r26
	.word 0xc22a0009  ! 2919: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xcc020009  ! 2919: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xcb220009  ! 2919: STF_R	st	%f5, [%r9, %r8]
	.word 0xdc2a0009  ! 2922: STB_R	stb	%r14, [%r8 + %r9]
	.word 0xe4420009  ! 2922: LDSW_R	ldsw	[%r8 + %r9], %r18
	.word 0xee921009  ! 2922: LDUHA_R	lduha	[%r8, %r9] 0x80, %r23
	.word 0xcc320009  ! 2925: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xf8520009  ! 2925: LDSH_R	ldsh	[%r8 + %r9], %r28
	.word 0x04ca0001  ! 2925: BRLEZ	brlez  ,pt	%8,<label_0xa0001>
	.word 0xc6320009  ! 2928: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xcc020009  ! 2928: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0x9f220009  ! 2928: MULScc_R	mulscc 	%r8, %r9, %r15
	.word 0xc5220009  ! 2931: STF_R	st	%f2, [%r9, %r8]
	.word 0xe00a0009  ! 2931: LDUB_R	ldub	[%r8 + %r9], %r16
	.word 0xce52235c  ! 2931: LDSH_I	ldsh	[%r8 + 0x035c], %r7
	.word 0xfd220009  ! 2934: STF_R	st	%f30, [%r9, %r8]
	.word 0xc8520009  ! 2934: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0x3e800002  ! 2934: BVC	bvc,a	<label_0x2>
	.word 0xe93a0009  ! 2937: STDF_R	std	%f20, [%r9, %r8]
	.word 0xdc420009  ! 2937: LDSW_R	ldsw	[%r8 + %r9], %r14
	.word 0xc2a22634  ! 2937: STWA_I	stwa	%r1, [%r8 + 0x0634] %asi
	.word 0xce2a0009  ! 2940: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xf6120009  ! 2940: LDUH_R	lduh	[%r8 + %r9], %r27
	.word 0xcc420009  ! 2940: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xc5220009  ! 2943: STF_R	st	%f2, [%r9, %r8]
	.word 0xc6420009  ! 2943: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0x8cf20009  ! 2943: UDIVcc_R	udivcc 	%r8, %r9, %r6
	.word 0xf53a0009  ! 2946: STDF_R	std	%f26, [%r9, %r8]
	.word 0xe6020009  ! 2946: LDUW_R	lduw	[%r8 + %r9], %r19
	.word 0xc49227e0  ! 2946: LDUHA_I	lduha	[%r8, + 0x07e0] %asi, %r2
	.word 0xdc320009  ! 2949: STH_R	sth	%r14, [%r8 + %r9]
	.word 0xcc5a0009  ! 2949: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xc40a0009  ! 2949: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xc53a0009  ! 2952: STDF_R	std	%f2, [%r9, %r8]
	.word 0xf45a0009  ! 2952: LDX_R	ldx	[%r8 + %r9], %r26
	.word 0x886a2a00  ! 2952: UDIVX_I	udivx 	%r8, 0x0a00, %r4
	.word 0xce220009  ! 2955: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xec420009  ! 2955: LDSW_R	ldsw	[%r8 + %r9], %r22
	.word 0x18800002  ! 2955: BGU	bgu  	<label_0x2>
	.word 0xc7220009  ! 2958: STF_R	st	%f3, [%r9, %r8]
	.word 0xc9020009  ! 2958: LDF_R	ld	[%r8, %r9], %f4
	.word 0xc3ea2b10  ! 2958: PREFETCHA_I	prefetcha	[%r8, + 0x0b10] %asi, #one_read
	.word 0xc8320009  ! 2961: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xcc0a0009  ! 2961: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xe2ca25f0  ! 2961: LDSBA_I	ldsba	[%r8, + 0x05f0] %asi, %r17
	.word 0xc8320009  ! 2964: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xec1a0009  ! 2964: LDD_R	ldd	[%r8 + %r9], %r22
	.word 0x99222670  ! 2964: MULScc_I	mulscc 	%r8, 0x0670, %r12
	.word 0xc6320009  ! 2967: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xfc420009  ! 2967: LDSW_R	ldsw	[%r8 + %r9], %r30
	.word 0xe8b21009  ! 2967: STHA_R	stha	%r20, [%r8 + %r9] 0x80
	.word 0xc6720009  ! 2970: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xca4a0009  ! 2970: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0x98d20009  ! 2970: UMULcc_R	umulcc 	%r8, %r9, %r12
	.word 0xc62a0009  ! 2973: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc44a0009  ! 2973: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0x8af20009  ! 2973: UDIVcc_R	udivcc 	%r8, %r9, %r5
	.word 0xe6220009  ! 2976: STW_R	stw	%r19, [%r8 + %r9]
	.word 0xf2120009  ! 2976: LDUH_R	lduh	[%r8 + %r9], %r25
	.word 0xb1220009  ! 2976: MULScc_R	mulscc 	%r8, %r9, %r24
	.word 0xc22a0009  ! 2979: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xcd1a0009  ! 2979: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xc6a2205c  ! 2979: STWA_I	stwa	%r3, [%r8 + 0x005c] %asi
	.word 0xc53a0009  ! 2982: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc3020009  ! 2982: LDF_R	ld	[%r8, %r9], %f1
	.word 0xe86a2b4c  ! 2982: LDSTUB_I	ldstub	%r20, [%r8 + 0x0b4c]
	.word 0xce720009  ! 2985: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xce0a0009  ! 2985: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xc4aa1009  ! 2985: STBA_R	stba	%r2, [%r8 + %r9] 0x80
	.word 0xf2720009  ! 2988: STX_R	stx	%r25, [%r8 + %r9]
	.word 0xc01a0009  ! 2988: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0xef3a27b0  ! 2988: STDF_I	std	%f23, [0x07b0, %r8]
	.word 0xc8320009  ! 2991: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xe84a0009  ! 2991: LDSB_R	ldsb	[%r8 + %r9], %r20
	.word 0xc3ea1009  ! 2991: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xe02a0009  ! 2994: STB_R	stb	%r16, [%r8 + %r9]
	.word 0xf71a0009  ! 2994: LDDF_R	ldd	[%r8, %r9], %f27
	.word 0xd81a0009  ! 2994: LDD_R	ldd	[%r8 + %r9], %r12
	.word 0xf0220009  ! 2997: STW_R	stw	%r24, [%r8 + %r9]
	.word 0xea520009  ! 2997: LDSH_R	ldsh	[%r8 + %r9], %r21
	.word 0xc8ba1009  ! 2997: STDA_R	stda	%r4, [%r8 + %r9] 0x80
	.word 0xf4320009  ! 3000: STH_R	sth	%r26, [%r8 + %r9]
	.word 0xc6520009  ! 3000: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xcada26a8  ! 3000: LDXA_I	ldxa	[%r8, + 0x06a8] %asi, %r5
	.word 0xc62a0009  ! 3003: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xca4a0009  ! 3003: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xcc8a1009  ! 3003: LDUBA_R	lduba	[%r8, %r9] 0x80, %r6
	.word 0xd62a0009  ! 3006: STB_R	stb	%r11, [%r8 + %r9]
	.word 0xca4a0009  ! 3006: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0x87a208a9  ! 3006: FSUBs	fsubs	%f8, %f9, %f3
	.word 0xc82a0009  ! 3009: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc25a0009  ! 3009: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xc53a26a0  ! 3009: STDF_I	std	%f2, [0x06a0, %r8]
	.word 0xda320009  ! 3012: STH_R	sth	%r13, [%r8 + %r9]
	.word 0xc41a0009  ! 3012: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xc36a0009  ! 3012: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc33a0009  ! 3015: STDF_R	std	%f1, [%r9, %r8]
	.word 0xfa5a0009  ! 3015: LDX_R	ldx	[%r8 + %r9], %r29
	.word 0xc46a2e80  ! 3015: LDSTUB_I	ldstub	%r2, [%r8 + 0x0e80]
	.word 0xc8320009  ! 3018: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xca4a0009  ! 3018: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xc36a0009  ! 3018: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc4220009  ! 3021: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xe81a0009  ! 3021: LDD_R	ldd	[%r8 + %r9], %r20
	.word 0x87222afc  ! 3021: MULScc_I	mulscc 	%r8, 0x0afc, %r3
	.word 0xc42a0009  ! 3024: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xea020009  ! 3024: LDUW_R	lduw	[%r8 + %r9], %r21
	.word 0xc09a2970  ! 3024: LDDA_I	ldda	[%r8, + 0x0970] %asi, %r0
	.word 0xc2320009  ! 3027: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xd41a0009  ! 3027: LDD_R	ldd	[%r8 + %r9], %r10
	.word 0xa05a2d94  ! 3027: SMUL_I	smul 	%r8, 0x0d94, %r16
	.word 0xc2320009  ! 3030: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xe6020009  ! 3030: LDUW_R	lduw	[%r8 + %r9], %r19
	.word 0xc36a0009  ! 3030: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xce220009  ! 3033: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc4120009  ! 3033: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xfaf22568  ! 3033: STXA_I	stxa	%r29, [%r8 + 0x0568] %asi
	.word 0xce720009  ! 3036: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc84a0009  ! 3036: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xcc1a0009  ! 3036: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xc2320009  ! 3039: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xf24a0009  ! 3039: LDSB_R	ldsb	[%r8 + %r9], %r25
	.word 0xc3ea2604  ! 3039: PREFETCHA_I	prefetcha	[%r8, + 0x0604] %asi, #one_read
	.word 0xdb220009  ! 3042: STF_R	st	%f13, [%r9, %r8]
	.word 0xc8020009  ! 3042: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xc8822a20  ! 3042: LDUWA_I	lduwa	[%r8, + 0x0a20] %asi, %r4
	.word 0xfc2a0009  ! 3045: STB_R	stb	%r30, [%r8 + %r9]
	.word 0xe41a0009  ! 3045: LDD_R	ldd	[%r8 + %r9], %r18
	.word 0x887a0009  ! 3045: SDIV_R	sdiv 	%r8, %r9, %r4
	.word 0xc6720009  ! 3048: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xf6520009  ! 3048: LDSH_R	ldsh	[%r8 + %r9], %r27
	.word 0x865a0009  ! 3048: SMUL_R	smul 	%r8, %r9, %r3
	.word 0xc4320009  ! 3051: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc51a0009  ! 3051: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xc6120009  ! 3051: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xf0220009  ! 3054: STW_R	stw	%r24, [%r8 + %r9]
	.word 0xcf020009  ! 3054: LDF_R	ld	[%r8, %r9], %f7
	.word 0x884a2c78  ! 3054: MULX_I	mulx 	%r8, 0x0c78, %r4
	.word 0xde2a0009  ! 3057: STB_R	stb	%r15, [%r8 + %r9]
	.word 0xea420009  ! 3057: LDSW_R	ldsw	[%r8 + %r9], %r21
	.word 0xc4f227b0  ! 3057: STXA_I	stxa	%r2, [%r8 + 0x07b0] %asi
	.word 0xca720009  ! 3060: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc2120009  ! 3060: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0x8ada0009  ! 3060: SMULcc_R	smulcc 	%r8, %r9, %r5
	.word 0xe62a0009  ! 3063: STB_R	stb	%r19, [%r8 + %r9]
	.word 0xcd1a0009  ! 3063: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0x22c20001  ! 3063: BRZ	brz,a,nt	%8,<label_0x20001>
	.word 0xca320009  ! 3066: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xda4a0009  ! 3066: LDSB_R	ldsb	[%r8 + %r9], %r13
	.word 0x8143c000  ! 3066: STBAR	stbar
	.word 0xc53a0009  ! 3069: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc6120009  ! 3069: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xc3ea1009  ! 3069: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xf9220009  ! 3072: STF_R	st	%f28, [%r9, %r8]
	.word 0xca5a0009  ! 3072: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xcdf22009  ! 3072: CASXA_R	casxa	[%r8]%asi, %r9, %r6
	.word 0xf93a0009  ! 3075: STDF_R	std	%f28, [%r9, %r8]
	.word 0xcb1a0009  ! 3075: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xceb21009  ! 3075: STHA_R	stha	%r7, [%r8 + %r9] 0x80
	.word 0xca320009  ! 3078: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc4020009  ! 3078: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xb36a2428  ! 3078: SDIVX_I	sdivx	%r8, 0x0428, %r25
	.word 0xce220009  ! 3081: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xe7020009  ! 3081: LDF_R	ld	[%r8, %r9], %f19
	.word 0xccaa2fd4  ! 3081: STBA_I	stba	%r6, [%r8 + 0x0fd4] %asi
	.word 0xc8220009  ! 3084: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xf11a0009  ! 3084: LDDF_R	ldd	[%r8, %r9], %f24
	.word 0xb852231c  ! 3084: UMUL_I	umul 	%r8, 0x031c, %r28
	.word 0xfc2a0009  ! 3087: STB_R	stb	%r30, [%r8 + %r9]
	.word 0xf0520009  ! 3087: LDSH_R	ldsh	[%r8 + %r9], %r24
	.word 0x8143e071  ! 3087: MEMBAR	membar	#LoadLoad | #Lookaside | #MemIssue | #Sync 
	.word 0xce320009  ! 3090: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xeb1a0009  ! 3090: LDDF_R	ldd	[%r8, %r9], %f21
	.word 0xc25a0009  ! 3090: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xf5220009  ! 3093: STF_R	st	%f26, [%r9, %r8]
	.word 0xc40a0009  ! 3093: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0x8ad2215c  ! 3093: UMULcc_I	umulcc 	%r8, 0x015c, %r5
	.word 0xea220009  ! 3096: STW_R	stw	%r21, [%r8 + %r9]
	.word 0xc85a0009  ! 3096: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xceb22c20  ! 3096: STHA_I	stha	%r7, [%r8 + 0x0c20] %asi
	.word 0xe8220009  ! 3099: STW_R	stw	%r20, [%r8 + %r9]
	.word 0xc40a0009  ! 3099: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0x8143e049  ! 3099: MEMBAR	membar	#LoadLoad | #StoreStore | #Sync 
	.word 0xc5220009  ! 3102: STF_R	st	%f2, [%r9, %r8]
	.word 0xce5a0009  ! 3102: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xc36a0009  ! 3102: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xf5220009  ! 3105: STF_R	st	%f26, [%r9, %r8]
	.word 0xce120009  ! 3105: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0x88d20009  ! 3105: UMULcc_R	umulcc 	%r8, %r9, %r4
	.word 0xc2320009  ! 3108: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xce4a0009  ! 3108: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0x8143c000  ! 3108: STBAR	stbar
	.word 0xe8220009  ! 3111: STW_R	stw	%r20, [%r8 + %r9]
	.word 0xfe420009  ! 3111: LDSW_R	ldsw	[%r8 + %r9], %r31
	.word 0xc8a21009  ! 3111: STWA_R	stwa	%r4, [%r8 + %r9] 0x80
	.word 0xcb3a0009  ! 3114: STDF_R	std	%f5, [%r9, %r8]
	.word 0xcc5a0009  ! 3114: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0x8143e03b  ! 3114: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Lookaside | #MemIssue 
	.word 0xc62a0009  ! 3117: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xfa0a0009  ! 3117: LDUB_R	ldub	[%r8 + %r9], %r29
	.word 0x8e720009  ! 3117: UDIV_R	udiv 	%r8, %r9, %r7
	.word 0xcd220009  ! 3120: STF_R	st	%f6, [%r9, %r8]
	.word 0xc2120009  ! 3120: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0x86f22184  ! 3120: UDIVcc_I	udivcc 	%r8, 0x0184, %r3
	.word 0xca2a0009  ! 3123: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xf24a0009  ! 3123: LDSB_R	ldsb	[%r8 + %r9], %r25
	.word 0xf13a2150  ! 3123: STDF_I	std	%f24, [0x0150, %r8]
	.word 0xc2220009  ! 3126: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc20a0009  ! 3126: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xc8ba2558  ! 3126: STDA_I	stda	%r4, [%r8 + 0x0558] %asi
	.word 0xe4220009  ! 3129: STW_R	stw	%r18, [%r8 + %r9]
	.word 0xdb020009  ! 3129: LDF_R	ld	[%r8, %r9], %f13
	.word 0x8143e004  ! 3129: MEMBAR	membar	#LoadStore 
	.word 0xc62a0009  ! 3132: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xca420009  ! 3132: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0x8143e073  ! 3132: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside | #MemIssue | #Sync 
	.word 0xe4220009  ! 3135: STW_R	stw	%r18, [%r8 + %r9]
	.word 0xc64a0009  ! 3135: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xba6a0009  ! 3135: UDIVX_R	udivx 	%r8, %r9, %r29
	.word 0xf6720009  ! 3138: STX_R	stx	%r27, [%r8 + %r9]
	.word 0xf2120009  ! 3138: LDUH_R	lduh	[%r8 + %r9], %r25
	.word 0x8143c000  ! 3138: STBAR	stbar
	.word 0xc8320009  ! 3141: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc85a0009  ! 3141: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xd6b21009  ! 3141: STHA_R	stha	%r11, [%r8 + %r9] 0x80
	.word 0xca720009  ! 3144: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xe4020009  ! 3144: LDUW_R	lduw	[%r8 + %r9], %r18
	.word 0xdb020009  ! 3144: LDF_R	ld	[%r8, %r9], %f13
	.word 0xf3220009  ! 3147: STF_R	st	%f25, [%r9, %r8]
	.word 0xf45a0009  ! 3147: LDX_R	ldx	[%r8 + %r9], %r26
	.word 0x8143e039  ! 3147: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside | #MemIssue 
	.word 0xcd220009  ! 3150: STF_R	st	%f6, [%r9, %r8]
	.word 0xc41a0009  ! 3150: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xc89a1009  ! 3150: LDDA_R	ldda	[%r8, %r9] 0x80, %r4
	.word 0xc4220009  ! 3153: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xce020009  ! 3153: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0x0c800002  ! 3153: BNEG	bneg  	<label_0x2>
	.word 0xc8320009  ! 3156: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xe45a0009  ! 3156: LDX_R	ldx	[%r8 + %r9], %r18
	.word 0xc36a23cc  ! 3156: PREFETCH_I	prefetch	[%r8 + 0x03cc], #one_read
	.word 0xc8720009  ! 3159: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xe5020009  ! 3159: LDF_R	ld	[%r8, %r9], %f18
	.word 0x8c7a21b8  ! 3159: SDIV_I	sdiv 	%r8, 0x01b8, %r6
	.word 0xed3a0009  ! 3162: STDF_R	std	%f22, [%r9, %r8]
	.word 0xf6520009  ! 3162: LDSH_R	ldsh	[%r8 + %r9], %r27
	.word 0xdc9a2188  ! 3162: LDDA_I	ldda	[%r8, + 0x0188] %asi, %r14
	.word 0xf6220009  ! 3165: STW_R	stw	%r27, [%r8 + %r9]
	.word 0xfe420009  ! 3165: LDSW_R	ldsw	[%r8 + %r9], %r31
	.word 0xc8a21009  ! 3165: STWA_R	stwa	%r4, [%r8 + %r9] 0x80
	.word 0xef220009  ! 3168: STF_R	st	%f23, [%r9, %r8]
	.word 0xcf020009  ! 3168: LDF_R	ld	[%r8, %r9], %f7
	.word 0x83a208a9  ! 3168: FSUBs	fsubs	%f8, %f9, %f1
	.word 0xca2a0009  ! 3171: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xca5a0009  ! 3171: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0x8143c000  ! 3171: STBAR	stbar
	.word 0xce720009  ! 3174: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xca420009  ! 3174: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xe1f22009  ! 3174: CASXA_R	casxa	[%r8]%asi, %r9, %r16
	.word 0xcd220009  ! 3177: STF_R	st	%f6, [%r9, %r8]
	.word 0xe5020009  ! 3177: LDF_R	ld	[%r8, %r9], %f18
	.word 0x8fa20929  ! 3177: FMULs	fmuls	%f8, %f9, %f7
	.word 0xc93a0009  ! 3180: STDF_R	std	%f4, [%r9, %r8]
	.word 0xd81a0009  ! 3180: LDD_R	ldd	[%r8 + %r9], %r12
	.word 0xc73a0009  ! 3180: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc9220009  ! 3183: STF_R	st	%f4, [%r9, %r8]
	.word 0xc64a0009  ! 3183: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xc3ea1009  ! 3183: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xce2a0009  ! 3186: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xce4a0009  ! 3186: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0x87a20829  ! 3186: FADDs	fadds	%f8, %f9, %f3
	.word 0xd8320009  ! 3189: STH_R	sth	%r12, [%r8 + %r9]
	.word 0xca120009  ! 3189: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0x8c720009  ! 3189: UDIV_R	udiv 	%r8, %r9, %r6
	.word 0xe9220009  ! 3192: STF_R	st	%f20, [%r9, %r8]
	.word 0xce4a0009  ! 3192: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0x8a520009  ! 3192: UMUL_R	umul 	%r8, %r9, %r5
	.word 0xe62a0009  ! 3195: STB_R	stb	%r19, [%r8 + %r9]
	.word 0xc31a0009  ! 3195: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0x30800001  ! 3195: BA	ba,a	<label_0x1>
	.word 0xde320009  ! 3198: STH_R	sth	%r15, [%r8 + %r9]
	.word 0xca0a0009  ! 3198: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0x04ca0001  ! 3198: BRLEZ	brlez  ,pt	%8,<label_0xa0001>
	.word 0xcf3a0009  ! 3201: STDF_R	std	%f7, [%r9, %r8]
	.word 0xf2520009  ! 3201: LDSH_R	ldsh	[%r8 + %r9], %r25
	.word 0xb2fa0009  ! 3201: SDIVcc_R	sdivcc 	%r8, %r9, %r25
	.word 0xc4220009  ! 3204: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc2420009  ! 3204: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0x8e4a22fc  ! 3204: MULX_I	mulx 	%r8, 0x02fc, %r7
	.word 0xc6720009  ! 3207: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc4520009  ! 3207: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0x847a2b74  ! 3207: SDIV_I	sdiv 	%r8, 0x0b74, %r2
	.word 0xe0320009  ! 3210: STH_R	sth	%r16, [%r8 + %r9]
	.word 0xed020009  ! 3210: LDF_R	ld	[%r8, %r9], %f22
	.word 0xc28a2d80  ! 3210: LDUBA_I	lduba	[%r8, + 0x0d80] %asi, %r1
	.word 0xfc320009  ! 3213: STH_R	sth	%r30, [%r8 + %r9]
	.word 0xc4420009  ! 3213: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xc53a0009  ! 3213: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc8720009  ! 3216: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xce520009  ! 3216: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xaa520009  ! 3216: UMUL_R	umul 	%r8, %r9, %r21
	.word 0xda720009  ! 3219: STX_R	stx	%r13, [%r8 + %r9]
	.word 0xc4020009  ! 3219: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0x8e520009  ! 3219: UMUL_R	umul 	%r8, %r9, %r7
	.word 0xcb3a0009  ! 3222: STDF_R	std	%f5, [%r9, %r8]
	.word 0xcc4a0009  ! 3222: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0x2eca0001  ! 3222: BRGEZ	brgez,a,pt	%8,<label_0xa0001>
	.word 0xc53a0009  ! 3225: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc71a0009  ! 3225: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xb46a2bec  ! 3225: UDIVX_I	udivx 	%r8, 0x0bec, %r26
	.word 0xc6720009  ! 3228: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xcb1a0009  ! 3228: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0x8143e008  ! 3228: MEMBAR	membar	#StoreStore 
	.word 0xc22a0009  ! 3231: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xcb020009  ! 3231: LDF_R	ld	[%r8, %r9], %f5
	.word 0xc36a29ec  ! 3231: PREFETCH_I	prefetch	[%r8 + 0x09ec], #one_read
	.word 0xe1220009  ! 3234: STF_R	st	%f16, [%r9, %r8]
	.word 0xc8020009  ! 3234: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0x84da0009  ! 3234: SMULcc_R	smulcc 	%r8, %r9, %r2
	.word 0xc93a0009  ! 3237: STDF_R	std	%f4, [%r9, %r8]
	.word 0xca5a0009  ! 3237: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0x8143c000  ! 3237: STBAR	stbar
	.word 0xcc720009  ! 3240: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xf84a0009  ! 3240: LDSB_R	ldsb	[%r8 + %r9], %r28
	.word 0xf1222140  ! 3240: STF_I	st	%f24, [0x0140, %r8]
	.word 0xcc720009  ! 3243: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xf7020009  ! 3243: LDF_R	ld	[%r8, %r9], %f27
	.word 0xbcfa2778  ! 3243: SDIVcc_I	sdivcc 	%r8, 0x0778, %r30
	.word 0xd6320009  ! 3246: STH_R	sth	%r11, [%r8 + %r9]
	.word 0xce420009  ! 3246: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0x964a2f28  ! 3246: MULX_I	mulx 	%r8, 0x0f28, %r11
	.word 0xc82a0009  ! 3249: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc8120009  ! 3249: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0x8e4a0009  ! 3249: MULX_R	mulx 	%r8, %r9, %r7
	.word 0xc82a0009  ! 3252: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc81a0009  ! 3252: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x0e800002  ! 3252: BVS	bvs  	<label_0x2>
	.word 0xcd220009  ! 3255: STF_R	st	%f6, [%r9, %r8]
	.word 0xda4a0009  ! 3255: LDSB_R	ldsb	[%r8 + %r9], %r13
	.word 0xad222be8  ! 3255: MULScc_I	mulscc 	%r8, 0x0be8, %r22
	.word 0xc8720009  ! 3258: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xf60a0009  ! 3258: LDUB_R	ldub	[%r8 + %r9], %r27
	.word 0xca0a21e4  ! 3258: LDUB_I	ldub	[%r8 + 0x01e4], %r5
	.word 0xc2320009  ! 3261: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xda520009  ! 3261: LDSH_R	ldsh	[%r8 + %r9], %r13
	.word 0xcd3a2cb0  ! 3261: STDF_I	std	%f6, [0x0cb0, %r8]
	.word 0xcd220009  ! 3264: STF_R	st	%f6, [%r9, %r8]
	.word 0xd8420009  ! 3264: LDSW_R	ldsw	[%r8 + %r9], %r12
	.word 0xe0f21009  ! 3264: STXA_R	stxa	%r16, [%r8 + %r9] 0x80
	.word 0xca2a0009  ! 3267: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc31a0009  ! 3267: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xc36a0009  ! 3267: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xe1220009  ! 3270: STF_R	st	%f16, [%r9, %r8]
	.word 0xc2120009  ! 3270: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0x8ad20009  ! 3270: UMULcc_R	umulcc 	%r8, %r9, %r5
	.word 0xcc220009  ! 3273: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc81a0009  ! 3273: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xcc120009  ! 3273: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xc62a0009  ! 3276: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xcc120009  ! 3276: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xb9a20929  ! 3276: FMULs	fmuls	%f8, %f9, %f28
	.word 0xc6320009  ! 3279: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xcd1a0009  ! 3279: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xc4c21009  ! 3279: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r2
	.word 0xc2320009  ! 3282: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xcc020009  ! 3282: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0x8a72257c  ! 3282: UDIV_I	udiv 	%r8, 0x057c, %r5
	.word 0xcb220009  ! 3285: STF_R	st	%f5, [%r9, %r8]
	.word 0xdf1a0009  ! 3285: LDDF_R	ldd	[%r8, %r9], %f15
	.word 0x884a0009  ! 3285: MULX_R	mulx 	%r8, %r9, %r4
	.word 0xce720009  ! 3288: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc2120009  ! 3288: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xc86a25b0  ! 3288: LDSTUB_I	ldstub	%r4, [%r8 + 0x05b0]
	.word 0xcf3a0009  ! 3291: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc44a0009  ! 3291: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xbc7a0009  ! 3291: SDIV_R	sdiv 	%r8, %r9, %r30
	.word 0xce720009  ! 3294: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc4420009  ! 3294: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0x8143c000  ! 3294: STBAR	stbar
	.word 0xdc220009  ! 3297: STW_R	stw	%r14, [%r8 + %r9]
	.word 0xc6020009  ! 3297: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0x28800001  ! 3297: BLEU	bleu,a	<label_0x1>
	.word 0xda720009  ! 3300: STX_R	stx	%r13, [%r8 + %r9]
	.word 0xc8520009  ! 3300: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0x8143c000  ! 3300: STBAR	stbar
	.word 0xcb3a0009  ! 3303: STDF_R	std	%f5, [%r9, %r8]
	.word 0xcc120009  ! 3303: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xd8b22b00  ! 3303: STHA_I	stha	%r12, [%r8 + 0x0b00] %asi
	.word 0xc22a0009  ! 3306: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xcc5a0009  ! 3306: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xcc5a2070  ! 3306: LDX_I	ldx	[%r8 + 0x0070], %r6
	.word 0xd8720009  ! 3309: STX_R	stx	%r12, [%r8 + %r9]
	.word 0xce420009  ! 3309: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0x8143c000  ! 3309: STBAR	stbar
	.word 0xc9220009  ! 3312: STF_R	st	%f4, [%r9, %r8]
	.word 0xee520009  ! 3312: LDSH_R	ldsh	[%r8 + %r9], %r23
	.word 0x864a2e38  ! 3312: MULX_I	mulx 	%r8, 0x0e38, %r3
	.word 0xc3220009  ! 3315: STF_R	st	%f1, [%r9, %r8]
	.word 0xec4a0009  ! 3315: LDSB_R	ldsb	[%r8 + %r9], %r22
	.word 0xc36a2644  ! 3315: PREFETCH_I	prefetch	[%r8 + 0x0644], #one_read
	.word 0xc6220009  ! 3318: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xcf020009  ! 3318: LDF_R	ld	[%r8, %r9], %f7
	.word 0xc36a0009  ! 3318: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xca220009  ! 3321: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc51a0009  ! 3321: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xc36a2ea8  ! 3321: PREFETCH_I	prefetch	[%r8 + 0x0ea8], #one_read
	.word 0xf0220009  ! 3324: STW_R	stw	%r24, [%r8 + %r9]
	.word 0xca520009  ! 3324: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xc3ea1009  ! 3324: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc4220009  ! 3327: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xca020009  ! 3327: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xd6fa1009  ! 3327: SWAPA_R	swapa	%r11, [%r8 + %r9] 0x80
	.word 0xce320009  ! 3330: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xce0a0009  ! 3330: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xe0ea1009  ! 3330: LDSTUBA_R	ldstuba	%r16, [%r8 + %r9] 0x80
	.word 0xca220009  ! 3333: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xde5a0009  ! 3333: LDX_R	ldx	[%r8 + %r9], %r15
	.word 0xc3ea1009  ! 3333: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc82a0009  ! 3336: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc4120009  ! 3336: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xc89a1009  ! 3336: LDDA_R	ldda	[%r8, %r9] 0x80, %r4
	.word 0xdd220009  ! 3339: STF_R	st	%f14, [%r9, %r8]
	.word 0xc6120009  ! 3339: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0x86722e48  ! 3339: UDIV_I	udiv 	%r8, 0x0e48, %r3
	.word 0xe6720009  ! 3342: STX_R	stx	%r19, [%r8 + %r9]
	.word 0xcd020009  ! 3342: LDF_R	ld	[%r8, %r9], %f6
	.word 0xc88a1009  ! 3342: LDUBA_R	lduba	[%r8, %r9] 0x80, %r4
	.word 0xdd3a0009  ! 3345: STDF_R	std	%f14, [%r9, %r8]
	.word 0xce120009  ! 3345: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xf27a0009  ! 3345: SWAP_R	swap	%r25, [%r8 + %r9]
	.word 0xca2a0009  ! 3348: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xca120009  ! 3348: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0x8143c000  ! 3348: STBAR	stbar
	.word 0xcf220009  ! 3351: STF_R	st	%f7, [%r9, %r8]
	.word 0xe44a0009  ! 3351: LDSB_R	ldsb	[%r8 + %r9], %r18
	.word 0xa9a20929  ! 3351: FMULs	fmuls	%f8, %f9, %f20
	.word 0xc33a0009  ! 3354: STDF_R	std	%f1, [%r9, %r8]
	.word 0xe6020009  ! 3354: LDUW_R	lduw	[%r8 + %r9], %r19
	.word 0xc3ea27b0  ! 3354: PREFETCHA_I	prefetcha	[%r8, + 0x07b0] %asi, #one_read
	.word 0xc4720009  ! 3357: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc31a0009  ! 3357: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xf6a21009  ! 3357: STWA_R	stwa	%r27, [%r8 + %r9] 0x80
	.word 0xda2a0009  ! 3360: STB_R	stb	%r13, [%r8 + %r9]
	.word 0xd85a0009  ! 3360: LDX_R	ldx	[%r8 + %r9], %r12
	.word 0xa5220009  ! 3360: MULScc_R	mulscc 	%r8, %r9, %r18
	.word 0xfc320009  ! 3363: STH_R	sth	%r30, [%r8 + %r9]
	.word 0xc41a0009  ! 3363: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x9a6a2d58  ! 3363: UDIVX_I	udivx 	%r8, 0x0d58, %r13
	.word 0xc93a0009  ! 3366: STDF_R	std	%f4, [%r9, %r8]
	.word 0xe00a0009  ! 3366: LDUB_R	ldub	[%r8 + %r9], %r16
	.word 0x04800002  ! 3366: BLE	ble  	<label_0x2>
	.word 0xcc220009  ! 3369: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xcc520009  ! 3369: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0x8a722880  ! 3369: UDIV_I	udiv 	%r8, 0x0880, %r5
	.word 0xca220009  ! 3372: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc51a0009  ! 3372: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xc36a0009  ! 3372: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xf9220009  ! 3375: STF_R	st	%f28, [%r9, %r8]
	.word 0xc31a0009  ! 3375: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xf47a2cfc  ! 3375: SWAP_I	swap	%r26, [%r8 + 0x0cfc]
	.word 0xc3220009  ! 3378: STF_R	st	%f1, [%r9, %r8]
	.word 0xc20a0009  ! 3378: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xc3ea2798  ! 3378: PREFETCHA_I	prefetcha	[%r8, + 0x0798] %asi, #one_read
	.word 0xc6720009  ! 3381: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xce120009  ! 3381: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xf0ba2130  ! 3381: STDA_I	stda	%r24, [%r8 + 0x0130] %asi
	.word 0xc62a0009  ! 3384: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xf65a0009  ! 3384: LDX_R	ldx	[%r8 + %r9], %r27
	.word 0xe0f22d18  ! 3384: STXA_I	stxa	%r16, [%r8 + 0x0d18] %asi
	.word 0xcc2a0009  ! 3387: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xdc1a0009  ! 3387: LDD_R	ldd	[%r8 + %r9], %r14
	.word 0xce8a1009  ! 3387: LDUBA_R	lduba	[%r8, %r9] 0x80, %r7
	.word 0xce2a0009  ! 3390: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc6420009  ! 3390: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0x26c20001  ! 3390: BRLZ	brlz,a,nt	%8,<label_0x20001>
	.word 0xd93a0009  ! 3393: STDF_R	std	%f12, [%r9, %r8]
	.word 0xce4a0009  ! 3393: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xa9a20829  ! 3393: FADDs	fadds	%f8, %f9, %f20
	.word 0xc53a0009  ! 3396: STDF_R	std	%f2, [%r9, %r8]
	.word 0xec4a0009  ! 3396: LDSB_R	ldsb	[%r8 + %r9], %r22
	.word 0xc8c21009  ! 3396: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r4
	.word 0xcc2a0009  ! 3399: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xda4a0009  ! 3399: LDSB_R	ldsb	[%r8 + %r9], %r13
	.word 0xc2922b74  ! 3399: LDUHA_I	lduha	[%r8, + 0x0b74] %asi, %r1
	.word 0xc4320009  ! 3402: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xe25a0009  ! 3402: LDX_R	ldx	[%r8 + %r9], %r17
	.word 0xc85a0009  ! 3402: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xc8220009  ! 3405: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc2120009  ! 3405: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0x8143c000  ! 3405: STBAR	stbar
	.word 0xf5220009  ! 3408: STF_R	st	%f26, [%r9, %r8]
	.word 0xf05a0009  ! 3408: LDX_R	ldx	[%r8 + %r9], %r24
	.word 0x87a20829  ! 3408: FADDs	fadds	%f8, %f9, %f3
	.word 0xc6320009  ! 3411: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xea5a0009  ! 3411: LDX_R	ldx	[%r8 + %r9], %r21
	.word 0xcb3a2948  ! 3411: STDF_I	std	%f5, [0x0948, %r8]
	.word 0xc53a0009  ! 3414: STDF_R	std	%f2, [%r9, %r8]
	.word 0xcf020009  ! 3414: LDF_R	ld	[%r8, %r9], %f7
	.word 0x85222ee8  ! 3414: MULScc_I	mulscc 	%r8, 0x0ee8, %r2
	.word 0xc9220009  ! 3417: STF_R	st	%f4, [%r9, %r8]
	.word 0xc91a0009  ! 3417: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xcaf21009  ! 3417: STXA_R	stxa	%r5, [%r8 + %r9] 0x80
	.word 0xf1220009  ! 3420: STF_R	st	%f24, [%r9, %r8]
	.word 0xc4120009  ! 3420: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0x8143e057  ! 3420: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside | #Sync 
	.word 0xc4320009  ! 3423: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xf8420009  ! 3423: LDSW_R	ldsw	[%r8 + %r9], %r28
	.word 0x36800001  ! 3423: BGE	bge,a	<label_0x1>
	.word 0xda720009  ! 3426: STX_R	stx	%r13, [%r8 + %r9]
	.word 0xec1a0009  ! 3426: LDD_R	ldd	[%r8 + %r9], %r22
	.word 0xc64a2a5c  ! 3426: LDSB_I	ldsb	[%r8 + 0x0a5c], %r3
	.word 0xf4320009  ! 3429: STH_R	sth	%r26, [%r8 + %r9]
	.word 0xfe0a0009  ! 3429: LDUB_R	ldub	[%r8 + %r9], %r31
	.word 0x8143e000  ! 3429: MEMBAR	membar	
	.word 0xc4220009  ! 3432: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xe20a0009  ! 3432: LDUB_R	ldub	[%r8 + %r9], %r17
	.word 0x8143c000  ! 3432: STBAR	stbar
	.word 0xc42a0009  ! 3435: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xcc5a0009  ! 3435: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xb8fa2b74  ! 3435: SDIVcc_I	sdivcc 	%r8, 0x0b74, %r28
	.word 0xf2720009  ! 3438: STX_R	stx	%r25, [%r8 + %r9]
	.word 0xcf1a0009  ! 3438: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0x88d22d38  ! 3438: UMULcc_I	umulcc 	%r8, 0x0d38, %r4
	.word 0xc8220009  ! 3441: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xf20a0009  ! 3441: LDUB_R	ldub	[%r8 + %r9], %r25
	.word 0x826a2684  ! 3441: UDIVX_I	udivx 	%r8, 0x0684, %r1
	.word 0xc82a0009  ! 3444: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xe24a0009  ! 3444: LDSB_R	ldsb	[%r8 + %r9], %r17
	.word 0xf0fa2b8c  ! 3444: SWAPA_I	swapa	%r24, [%r8 + 0x0b8c] %asi
	.word 0xeb220009  ! 3447: STF_R	st	%f21, [%r9, %r8]
	.word 0xc2420009  ! 3447: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xfe0a0009  ! 3447: LDUB_R	ldub	[%r8 + %r9], %r31
	.word 0xc4320009  ! 3450: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xca520009  ! 3450: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0x06ca0001  ! 3450: BRLZ	brlz  ,pt	%8,<label_0xa0001>
	.word 0xc62a0009  ! 3453: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc41a0009  ! 3453: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x867a0009  ! 3453: SDIV_R	sdiv 	%r8, %r9, %r3
	.word 0xc4720009  ! 3456: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc01a0009  ! 3456: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0x864a2ec0  ! 3456: MULX_I	mulx 	%r8, 0x0ec0, %r3
	.word 0xc2220009  ! 3459: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc40a0009  ! 3459: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0x9c7a25b4  ! 3459: SDIV_I	sdiv 	%r8, 0x05b4, %r14
	.word 0xc6220009  ! 3462: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xf51a0009  ! 3462: LDDF_R	ldd	[%r8, %r9], %f26
	.word 0x8da20829  ! 3462: FADDs	fadds	%f8, %f9, %f6
	.word 0xc6320009  ! 3465: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xce020009  ! 3465: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0x9da209a9  ! 3465: FDIVs	fdivs	%f8, %f9, %f14
	.word 0xf73a0009  ! 3468: STDF_R	std	%f27, [%r9, %r8]
	.word 0xec020009  ! 3468: LDUW_R	lduw	[%r8 + %r9], %r22
	.word 0x8fa20929  ! 3468: FMULs	fmuls	%f8, %f9, %f7
	.word 0xcf220009  ! 3471: STF_R	st	%f7, [%r9, %r8]
	.word 0xc9020009  ! 3471: LDF_R	ld	[%r8, %r9], %f4
	.word 0x8ada2160  ! 3471: SMULcc_I	smulcc 	%r8, 0x0160, %r5
	.word 0xdd220009  ! 3474: STF_R	st	%f14, [%r9, %r8]
	.word 0xec4a0009  ! 3474: LDSB_R	ldsb	[%r8 + %r9], %r22
	.word 0x8143c000  ! 3474: STBAR	stbar
	.word 0xc8720009  ! 3477: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xcc1a0009  ! 3477: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0x02c20001  ! 3477: BRZ	brz  ,nt	%8,<label_0x20001>
	.word 0xc6720009  ! 3480: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xe8120009  ! 3480: LDUH_R	lduh	[%r8 + %r9], %r20
	.word 0xc3e21009  ! 3480: CASA_I	casa	[%r8] 0x80, %r9, %r1
	.word 0xc5220009  ! 3483: STF_R	st	%f2, [%r9, %r8]
	.word 0xfe0a0009  ! 3483: LDUB_R	ldub	[%r8 + %r9], %r31
	.word 0x836a2910  ! 3483: SDIVX_I	sdivx	%r8, 0x0910, %r1
	.word 0xe8320009  ! 3486: STH_R	sth	%r20, [%r8 + %r9]
	.word 0xca120009  ! 3486: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xfe0224a4  ! 3486: LDUW_I	lduw	[%r8 + 0x04a4], %r31
	.word 0xcc320009  ! 3489: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xce120009  ! 3489: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0x845a2114  ! 3489: SMUL_I	smul 	%r8, 0x0114, %r2
	.word 0xc5220009  ! 3492: STF_R	st	%f2, [%r9, %r8]
	.word 0xca520009  ! 3492: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xcf3a25b0  ! 3492: STDF_I	std	%f7, [0x05b0, %r8]
	.word 0xc33a0009  ! 3495: STDF_R	std	%f1, [%r9, %r8]
	.word 0xca020009  ! 3495: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xb2d20009  ! 3495: UMULcc_R	umulcc 	%r8, %r9, %r25
	.word 0xcc320009  ! 3498: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xec520009  ! 3498: LDSH_R	ldsh	[%r8 + %r9], %r22
	.word 0x836a2f2c  ! 3498: SDIVX_I	sdivx	%r8, 0x0f2c, %r1
	.word 0xf93a0009  ! 3501: STDF_R	std	%f28, [%r9, %r8]
	.word 0xc24a0009  ! 3501: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xc8ba25e0  ! 3501: STDA_I	stda	%r4, [%r8 + 0x05e0] %asi
	.word 0xc4320009  ! 3504: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc80a0009  ! 3504: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xcfe22009  ! 3504: CASA_R	casa	[%r8] %asi, %r9, %r7
	.word 0xcd220009  ! 3507: STF_R	st	%f6, [%r9, %r8]
	.word 0xf8420009  ! 3507: LDSW_R	ldsw	[%r8 + %r9], %r28
	.word 0xcc522e48  ! 3507: LDSH_I	ldsh	[%r8 + 0x0e48], %r6
	.word 0xc4220009  ! 3510: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc64a0009  ! 3510: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xfb3a0009  ! 3510: STDF_R	std	%f29, [%r9, %r8]
	.word 0xc33a0009  ! 3513: STDF_R	std	%f1, [%r9, %r8]
	.word 0xcb1a0009  ! 3513: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xeb220009  ! 3513: STF_R	st	%f21, [%r9, %r8]
	.word 0xc82a0009  ! 3516: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xcc0a0009  ! 3516: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xc4da2bb8  ! 3516: LDXA_I	ldxa	[%r8, + 0x0bb8] %asi, %r2
	.word 0xfe220009  ! 3519: STW_R	stw	%r31, [%r8 + %r9]
	.word 0xc4420009  ! 3519: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0x83a209a9  ! 3519: FDIVs	fdivs	%f8, %f9, %f1
	.word 0xcf220009  ! 3522: STF_R	st	%f7, [%r9, %r8]
	.word 0xc2420009  ! 3522: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xb4f20009  ! 3522: UDIVcc_R	udivcc 	%r8, %r9, %r26
	.word 0xc53a0009  ! 3525: STDF_R	std	%f2, [%r9, %r8]
	.word 0xcb020009  ! 3525: LDF_R	ld	[%r8, %r9], %f5
	.word 0xc8922550  ! 3525: LDUHA_I	lduha	[%r8, + 0x0550] %asi, %r4
	.word 0xc8220009  ! 3528: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xcf1a0009  ! 3528: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0x2a800001  ! 3528: BCS	bcs,a	<label_0x1>
	.word 0xc3220009  ! 3531: STF_R	st	%f1, [%r9, %r8]
	.word 0xc6420009  ! 3531: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xc8921009  ! 3531: LDUHA_R	lduha	[%r8, %r9] 0x80, %r4
	.word 0xc4320009  ! 3534: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xcc020009  ! 3534: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0x85a20929  ! 3534: FMULs	fmuls	%f8, %f9, %f2
	.word 0xcc2a0009  ! 3537: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xcc4a0009  ! 3537: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0x8143c000  ! 3537: STBAR	stbar
	.word 0xfa2a0009  ! 3540: STB_R	stb	%r29, [%r8 + %r9]
	.word 0xc24a0009  ! 3540: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xc6520009  ! 3540: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xe93a0009  ! 3543: STDF_R	std	%f20, [%r9, %r8]
	.word 0xe1020009  ! 3543: LDF_R	ld	[%r8, %r9], %f16
	.word 0xcd3a2360  ! 3543: STDF_I	std	%f6, [0x0360, %r8]
	.word 0xe6220009  ! 3546: STW_R	stw	%r19, [%r8 + %r9]
	.word 0xce020009  ! 3546: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xc3ea23c8  ! 3546: PREFETCHA_I	prefetcha	[%r8, + 0x03c8] %asi, #one_read
	.word 0xc3220009  ! 3549: STF_R	st	%f1, [%r9, %r8]
	.word 0xc44a0009  ! 3549: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xc36a0009  ! 3549: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xfe2a0009  ! 3552: STB_R	stb	%r31, [%r8 + %r9]
	.word 0xc44a0009  ! 3552: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xe6da1009  ! 3552: LDXA_R	ldxa	[%r8, %r9] 0x80, %r19
	.word 0xc6720009  ! 3555: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc44a0009  ! 3555: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0x8143e058  ! 3555: MEMBAR	membar	#StoreStore | #Lookaside | #Sync 
	.word 0xf62a0009  ! 3558: STB_R	stb	%r27, [%r8 + %r9]
	.word 0xc91a0009  ! 3558: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0x2eca0001  ! 3558: BRGEZ	brgez,a,pt	%8,<label_0xa0001>
	.word 0xc4220009  ! 3561: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xca5a0009  ! 3561: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xceda2720  ! 3561: LDXA_I	ldxa	[%r8, + 0x0720] %asi, %r7
	.word 0xc4720009  ! 3564: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc25a0009  ! 3564: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xfca21009  ! 3564: STWA_R	stwa	%r30, [%r8 + %r9] 0x80
	.word 0xdd220009  ! 3567: STF_R	st	%f14, [%r9, %r8]
	.word 0xcd020009  ! 3567: LDF_R	ld	[%r8, %r9], %f6
	.word 0xc3ea1009  ! 3567: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xce2a0009  ! 3570: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xcd020009  ! 3570: LDF_R	ld	[%r8, %r9], %f6
	.word 0x24800001  ! 3570: BLE	ble,a	<label_0x1>
	.word 0xc33a0009  ! 3573: STDF_R	std	%f1, [%r9, %r8]
	.word 0xe2120009  ! 3573: LDUH_R	lduh	[%r8 + %r9], %r17
	.word 0xb4fa2868  ! 3573: SDIVcc_I	sdivcc 	%r8, 0x0868, %r26
	.word 0xc2320009  ! 3576: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc44a0009  ! 3576: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0x9b6a0009  ! 3576: SDIVX_R	sdivx	%r8, %r9, %r13
	.word 0xcf3a0009  ! 3579: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc81a0009  ! 3579: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x8ad22f40  ! 3579: UMULcc_I	umulcc 	%r8, 0x0f40, %r5
	.word 0xc6320009  ! 3582: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xcf1a0009  ! 3582: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xca6a2d00  ! 3582: LDSTUB_I	ldstub	%r5, [%r8 + 0x0d00]
	.word 0xf8720009  ! 3585: STX_R	stx	%r28, [%r8 + %r9]
	.word 0xc81a0009  ! 3585: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xfd3a0009  ! 3585: STDF_R	std	%f30, [%r9, %r8]
	.word 0xda720009  ! 3588: STX_R	stx	%r13, [%r8 + %r9]
	.word 0xc64a0009  ! 3588: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0x8ada2b60  ! 3588: SMULcc_I	smulcc 	%r8, 0x0b60, %r5
	.word 0xcf220009  ! 3591: STF_R	st	%f7, [%r9, %r8]
	.word 0xc25a0009  ! 3591: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xc2da1009  ! 3591: LDXA_R	ldxa	[%r8, %r9] 0x80, %r1
	.word 0xe8720009  ! 3594: STX_R	stx	%r20, [%r8 + %r9]
	.word 0xcc520009  ! 3594: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xc3ea1009  ! 3594: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xf2220009  ! 3597: STW_R	stw	%r25, [%r8 + %r9]
	.word 0xc80a0009  ! 3597: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0x8143c000  ! 3597: STBAR	stbar
	.word 0xc22a0009  ! 3600: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xe6020009  ! 3600: LDUW_R	lduw	[%r8 + %r9], %r19
	.word 0x84d22ed0  ! 3600: UMULcc_I	umulcc 	%r8, 0x0ed0, %r2
	.word 0xf53a0009  ! 3603: STDF_R	std	%f26, [%r9, %r8]
	.word 0xc2020009  ! 3603: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xb67a21a8  ! 3603: SDIV_I	sdiv 	%r8, 0x01a8, %r27
	.word 0xc7220009  ! 3606: STF_R	st	%f3, [%r9, %r8]
	.word 0xcb1a0009  ! 3606: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xc9e22009  ! 3606: CASA_R	casa	[%r8] %asi, %r9, %r4
	.word 0xce2a0009  ! 3609: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xcc020009  ! 3609: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xc6ca1009  ! 3609: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r3
	.word 0xc73a0009  ! 3612: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc45a0009  ! 3612: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0x8c7a2b44  ! 3612: SDIV_I	sdiv 	%r8, 0x0b44, %r6
	.word 0xfd220009  ! 3615: STF_R	st	%f30, [%r9, %r8]
	.word 0xc91a0009  ! 3615: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0x8143e06b  ! 3615: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #MemIssue | #Sync 
	.word 0xc73a0009  ! 3618: STDF_R	std	%f3, [%r9, %r8]
	.word 0xf6020009  ! 3618: LDUW_R	lduw	[%r8 + %r9], %r27
	.word 0xef3a0009  ! 3618: STDF_R	std	%f23, [%r9, %r8]
	.word 0xfc220009  ! 3621: STW_R	stw	%r30, [%r8 + %r9]
	.word 0xe6020009  ! 3621: LDUW_R	lduw	[%r8 + %r9], %r19
	.word 0xb9a20929  ! 3621: FMULs	fmuls	%f8, %f9, %f28
	.word 0xca2a0009  ! 3624: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xdc5a0009  ! 3624: LDX_R	ldx	[%r8 + %r9], %r14
	.word 0xc4a22b7c  ! 3624: STWA_I	stwa	%r2, [%r8 + 0x0b7c] %asi
	.word 0xc4320009  ! 3627: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc91a0009  ! 3627: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xc36a0009  ! 3627: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc4220009  ! 3630: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc6420009  ! 3630: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xc3ea1009  ! 3630: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc53a0009  ! 3633: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc2020009  ! 3633: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xc4ba1009  ! 3633: STDA_R	stda	%r2, [%r8 + %r9] 0x80
	.word 0xc73a0009  ! 3636: STDF_R	std	%f3, [%r9, %r8]
	.word 0xce0a0009  ! 3636: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xc2aa1009  ! 3636: STBA_R	stba	%r1, [%r8 + %r9] 0x80
	.word 0xe8220009  ! 3639: STW_R	stw	%r20, [%r8 + %r9]
	.word 0xcc5a0009  ! 3639: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xc3ea25e0  ! 3639: PREFETCHA_I	prefetcha	[%r8, + 0x05e0] %asi, #one_read
	.word 0xe6320009  ! 3642: STH_R	sth	%r19, [%r8 + %r9]
	.word 0xc4420009  ! 3642: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0x8ba209a9  ! 3642: FDIVs	fdivs	%f8, %f9, %f5
	.word 0xc2320009  ! 3645: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xee020009  ! 3645: LDUW_R	lduw	[%r8 + %r9], %r23
	.word 0xcefa1009  ! 3645: SWAPA_R	swapa	%r7, [%r8 + %r9] 0x80
	.word 0xcd220009  ! 3648: STF_R	st	%f6, [%r9, %r8]
	.word 0xc2420009  ! 3648: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0x8fa20829  ! 3648: FADDs	fadds	%f8, %f9, %f7
	.word 0xfb3a0009  ! 3651: STDF_R	std	%f29, [%r9, %r8]
	.word 0xe11a0009  ! 3651: LDDF_R	ldd	[%r8, %r9], %f16
	.word 0x846a20a4  ! 3651: UDIVX_I	udivx 	%r8, 0x00a4, %r2
	.word 0xfe320009  ! 3654: STH_R	sth	%r31, [%r8 + %r9]
	.word 0xfc420009  ! 3654: LDSW_R	ldsw	[%r8 + %r9], %r30
	.word 0x8cfa229c  ! 3654: SDIVcc_I	sdivcc 	%r8, 0x029c, %r6
	.word 0xc2720009  ! 3657: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc8120009  ! 3657: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xc7f21009  ! 3657: CASXA_I	casxa	[%r8] 0x80, %r9, %r3
	.word 0xc8320009  ! 3660: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc41a0009  ! 3660: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xad220009  ! 3660: MULScc_R	mulscc 	%r8, %r9, %r22
	.word 0xfc720009  ! 3663: STX_R	stx	%r30, [%r8 + %r9]
	.word 0xca420009  ! 3663: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xc3ea2fd4  ! 3663: PREFETCHA_I	prefetcha	[%r8, + 0x0fd4] %asi, #one_read
	.word 0xe7220009  ! 3666: STF_R	st	%f19, [%r9, %r8]
	.word 0xca420009  ! 3666: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xc36a2120  ! 3666: PREFETCH_I	prefetch	[%r8 + 0x0120], #one_read
	.word 0xc62a0009  ! 3669: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc2420009  ! 3669: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xcafa1009  ! 3669: SWAPA_R	swapa	%r5, [%r8 + %r9] 0x80
	.word 0xcf220009  ! 3672: STF_R	st	%f7, [%r9, %r8]
	.word 0xfa5a0009  ! 3672: LDX_R	ldx	[%r8 + %r9], %r29
	.word 0x8143c000  ! 3672: STBAR	stbar
	.word 0xe33a0009  ! 3675: STDF_R	std	%f17, [%r9, %r8]
	.word 0xc8520009  ! 3675: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xdc9a1009  ! 3675: LDDA_R	ldda	[%r8, %r9] 0x80, %r14
	.word 0xfc2a0009  ! 3678: STB_R	stb	%r30, [%r8 + %r9]
	.word 0xf65a0009  ! 3678: LDX_R	ldx	[%r8 + %r9], %r27
	.word 0xc2b21009  ! 3678: STHA_R	stha	%r1, [%r8 + %r9] 0x80
	.word 0xc7220009  ! 3681: STF_R	st	%f3, [%r9, %r8]
	.word 0xda120009  ! 3681: LDUH_R	lduh	[%r8 + %r9], %r13
	.word 0xb87a2588  ! 3681: SDIV_I	sdiv 	%r8, 0x0588, %r28
	.word 0xe0220009  ! 3684: STW_R	stw	%r16, [%r8 + %r9]
	.word 0xcc0a0009  ! 3684: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0x9da20829  ! 3684: FADDs	fadds	%f8, %f9, %f14
	.word 0xca720009  ! 3687: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xd8020009  ! 3687: LDUW_R	lduw	[%r8 + %r9], %r12
	.word 0xae7a0009  ! 3687: SDIV_R	sdiv 	%r8, %r9, %r23
	.word 0xf4320009  ! 3690: STH_R	sth	%r26, [%r8 + %r9]
	.word 0xd7020009  ! 3690: LDF_R	ld	[%r8, %r9], %f11
	.word 0xc36a0009  ! 3690: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xcb3a0009  ! 3693: STDF_R	std	%f5, [%r9, %r8]
	.word 0xe2420009  ! 3693: LDSW_R	ldsw	[%r8 + %r9], %r17
	.word 0x89a209a9  ! 3693: FDIVs	fdivs	%f8, %f9, %f4
	.word 0xed220009  ! 3696: STF_R	st	%f22, [%r9, %r8]
	.word 0xc41a0009  ! 3696: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x8a4a0009  ! 3696: MULX_R	mulx 	%r8, %r9, %r5
	.word 0xc82a0009  ! 3699: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc6020009  ! 3699: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xef220009  ! 3699: STF_R	st	%f23, [%r9, %r8]
	.word 0xce320009  ! 3702: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc60a0009  ! 3702: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xd8422fac  ! 3702: LDSW_I	ldsw	[%r8 + 0x0fac], %r12
	.word 0xe8720009  ! 3705: STX_R	stx	%r20, [%r8 + %r9]
	.word 0xce520009  ! 3705: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xc3ea1009  ! 3705: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xca2a0009  ! 3708: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xcf020009  ! 3708: LDF_R	ld	[%r8, %r9], %f7
	.word 0x16800002  ! 3708: BGE	bge  	<label_0x2>
	.word 0xe8720009  ! 3711: STX_R	stx	%r20, [%r8 + %r9]
	.word 0xda420009  ! 3711: LDSW_R	ldsw	[%r8 + %r9], %r13
	.word 0x8ad20009  ! 3711: UMULcc_R	umulcc 	%r8, %r9, %r5
	.word 0xce2a0009  ! 3714: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc2120009  ! 3714: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0x22ca0001  ! 3714: BRZ	brz,a,pt	%8,<label_0xa0001>
	.word 0xc5220009  ! 3717: STF_R	st	%f2, [%r9, %r8]
	.word 0xcc5a0009  ! 3717: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xcc92235c  ! 3717: LDUHA_I	lduha	[%r8, + 0x035c] %asi, %r6
	.word 0xc42a0009  ! 3720: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc5020009  ! 3720: LDF_R	ld	[%r8, %r9], %f2
	.word 0xdada1009  ! 3720: LDXA_R	ldxa	[%r8, %r9] 0x80, %r13
	.word 0xfb3a0009  ! 3723: STDF_R	std	%f29, [%r9, %r8]
	.word 0xcc520009  ! 3723: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0x8da20829  ! 3723: FADDs	fadds	%f8, %f9, %f6
	.word 0xda320009  ! 3726: STH_R	sth	%r13, [%r8 + %r9]
	.word 0xfa5a0009  ! 3726: LDX_R	ldx	[%r8 + %r9], %r29
	.word 0x82da0009  ! 3726: SMULcc_R	smulcc 	%r8, %r9, %r1
	.word 0xcc220009  ! 3729: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xfe5a0009  ! 3729: LDX_R	ldx	[%r8 + %r9], %r31
	.word 0xc26a0009  ! 3729: LDSTUB_R	ldstub	%r1, [%r8 + %r9]
	.word 0xcf220009  ! 3732: STF_R	st	%f7, [%r9, %r8]
	.word 0xec520009  ! 3732: LDSH_R	ldsh	[%r8 + %r9], %r22
	.word 0xc3ea233c  ! 3732: PREFETCHA_I	prefetcha	[%r8, + 0x033c] %asi, #one_read
	.word 0xc62a0009  ! 3735: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc40a0009  ! 3735: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0x8143e06f  ! 3735: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #MemIssue | #Sync 
	.word 0xce720009  ! 3738: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xca020009  ! 3738: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xcde21009  ! 3738: CASA_I	casa	[%r8] 0x80, %r9, %r6
	.word 0xc7220009  ! 3741: STF_R	st	%f3, [%r9, %r8]
	.word 0xce4a0009  ! 3741: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xfb022424  ! 3741: LDF_I	ld	[%r8, 0x0424], %f29
	.word 0xf4720009  ! 3744: STX_R	stx	%r26, [%r8 + %r9]
	.word 0xcc120009  ! 3744: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0x8eda0009  ! 3744: SMULcc_R	smulcc 	%r8, %r9, %r7
	.word 0xff3a0009  ! 3747: STDF_R	std	%f31, [%r9, %r8]
	.word 0xd6120009  ! 3747: LDUH_R	lduh	[%r8 + %r9], %r11
	.word 0x8143e01a  ! 3747: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside 
	.word 0xc7220009  ! 3750: STF_R	st	%f3, [%r9, %r8]
	.word 0xca4a0009  ! 3750: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0x82fa2070  ! 3750: SDIVcc_I	sdivcc 	%r8, 0x0070, %r1
	.word 0xc2720009  ! 3753: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc65a0009  ! 3753: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xccfa2034  ! 3753: SWAPA_I	swapa	%r6, [%r8 + 0x0034] %asi
	.word 0xce720009  ! 3756: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xdc5a0009  ! 3756: LDX_R	ldx	[%r8 + %r9], %r14
	.word 0x8143e07f  ! 3756: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xf33a0009  ! 3759: STDF_R	std	%f25, [%r9, %r8]
	.word 0xe40a0009  ! 3759: LDUB_R	ldub	[%r8 + %r9], %r18
	.word 0xceea1009  ! 3759: LDSTUBA_R	ldstuba	%r7, [%r8 + %r9] 0x80
	.word 0xc53a0009  ! 3762: STDF_R	std	%f2, [%r9, %r8]
	.word 0xca420009  ! 3762: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0x8da208a9  ! 3762: FSUBs	fsubs	%f8, %f9, %f6
	.word 0xc2720009  ! 3765: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc8020009  ! 3765: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xc9e22009  ! 3765: CASA_R	casa	[%r8] %asi, %r9, %r4
	.word 0xc6220009  ! 3768: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xec1a0009  ! 3768: LDD_R	ldd	[%r8 + %r9], %r22
	.word 0xc6fa1009  ! 3768: SWAPA_R	swapa	%r3, [%r8 + %r9] 0x80
	.word 0xde320009  ! 3771: STH_R	sth	%r15, [%r8 + %r9]
	.word 0xc71a0009  ! 3771: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0x8143e033  ! 3771: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside | #MemIssue 
	.word 0xda320009  ! 3774: STH_R	sth	%r13, [%r8 + %r9]
	.word 0xc24a0009  ! 3774: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xbe7a0009  ! 3774: SDIV_R	sdiv 	%r8, %r9, %r31
	.word 0xc4320009  ! 3777: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc84a0009  ! 3777: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xe8ca1009  ! 3777: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r20
	.word 0xc2220009  ! 3780: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc7020009  ! 3780: LDF_R	ld	[%r8, %r9], %f3
	.word 0xf47a0009  ! 3780: SWAP_R	swap	%r26, [%r8 + %r9]
	.word 0xe4720009  ! 3783: STX_R	stx	%r18, [%r8 + %r9]
	.word 0xcd1a0009  ! 3783: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xc8fa1009  ! 3783: SWAPA_R	swapa	%r4, [%r8 + %r9] 0x80
	.word 0xcf220009  ! 3786: STF_R	st	%f7, [%r9, %r8]
	.word 0xca4a0009  ! 3786: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xcd3a28b8  ! 3786: STDF_I	std	%f6, [0x08b8, %r8]
	.word 0xcc2a0009  ! 3789: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xce020009  ! 3789: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xc4da2908  ! 3789: LDXA_I	ldxa	[%r8, + 0x0908] %asi, %r2
	.word 0xcc220009  ! 3792: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xee0a0009  ! 3792: LDUB_R	ldub	[%r8 + %r9], %r23
	.word 0xca5a0009  ! 3792: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xc7220009  ! 3795: STF_R	st	%f3, [%r9, %r8]
	.word 0xda0a0009  ! 3795: LDUB_R	ldub	[%r8 + %r9], %r13
	.word 0x864a0009  ! 3795: MULX_R	mulx 	%r8, %r9, %r3
	.word 0xcf220009  ! 3798: STF_R	st	%f7, [%r9, %r8]
	.word 0xde120009  ! 3798: LDUH_R	lduh	[%r8 + %r9], %r15
	.word 0xb0720009  ! 3798: UDIV_R	udiv 	%r8, %r9, %r24
	.word 0xda720009  ! 3801: STX_R	stx	%r13, [%r8 + %r9]
	.word 0xe11a0009  ! 3801: LDDF_R	ldd	[%r8, %r9], %f16
	.word 0x8a7a2194  ! 3801: SDIV_I	sdiv 	%r8, 0x0194, %r5
	.word 0xc7220009  ! 3804: STF_R	st	%f3, [%r9, %r8]
	.word 0xe0120009  ! 3804: LDUH_R	lduh	[%r8 + %r9], %r16
	.word 0xcc822200  ! 3804: LDUWA_I	lduwa	[%r8, + 0x0200] %asi, %r6
	.word 0xc6320009  ! 3807: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc84a0009  ! 3807: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0x96520009  ! 3807: UMUL_R	umul 	%r8, %r9, %r11
	.word 0xc42a0009  ! 3810: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xd65a0009  ! 3810: LDX_R	ldx	[%r8 + %r9], %r11
	.word 0xc36a27e8  ! 3810: PREFETCH_I	prefetch	[%r8 + 0x07e8], #one_read
	.word 0xcb3a0009  ! 3813: STDF_R	std	%f5, [%r9, %r8]
	.word 0xcb020009  ! 3813: LDF_R	ld	[%r8, %r9], %f5
	.word 0xcd3a0009  ! 3813: STDF_R	std	%f6, [%r9, %r8]
	.word 0xe93a0009  ! 3816: STDF_R	std	%f20, [%r9, %r8]
	.word 0xc5020009  ! 3816: LDF_R	ld	[%r8, %r9], %f2
	.word 0x26800001  ! 3816: BL	bl,a	<label_0x1>
	.word 0xfb3a0009  ! 3819: STDF_R	std	%f29, [%r9, %r8]
	.word 0xee0a0009  ! 3819: LDUB_R	ldub	[%r8 + %r9], %r23
	.word 0x87220009  ! 3819: MULScc_R	mulscc 	%r8, %r9, %r3
	.word 0xcc220009  ! 3822: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xe60a0009  ! 3822: LDUB_R	ldub	[%r8 + %r9], %r19
	.word 0x82520009  ! 3822: UMUL_R	umul 	%r8, %r9, %r1
	.word 0xc6720009  ! 3825: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xdf1a0009  ! 3825: LDDF_R	ldd	[%r8, %r9], %f15
	.word 0xc2ea2fe8  ! 3825: LDSTUBA_I	ldstuba	%r1, [%r8 + 0x0fe8] %asi
	.word 0xc6320009  ! 3828: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xca520009  ! 3828: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xc6b21009  ! 3828: STHA_R	stha	%r3, [%r8 + %r9] 0x80
	.word 0xc9220009  ! 3831: STF_R	st	%f4, [%r9, %r8]
	.word 0xf9020009  ! 3831: LDF_R	ld	[%r8, %r9], %f28
	.word 0x86fa0009  ! 3831: SDIVcc_R	sdivcc 	%r8, %r9, %r3
	.word 0xc9220009  ! 3834: STF_R	st	%f4, [%r9, %r8]
	.word 0xf8020009  ! 3834: LDUW_R	lduw	[%r8 + %r9], %r28
	.word 0x8143e05e  ! 3834: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0xd8320009  ! 3837: STH_R	sth	%r12, [%r8 + %r9]
	.word 0xea020009  ! 3837: LDUW_R	lduw	[%r8 + %r9], %r21
	.word 0xc3ea1009  ! 3837: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xf02a0009  ! 3840: STB_R	stb	%r24, [%r8 + %r9]
	.word 0xc45a0009  ! 3840: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0x8143e00a  ! 3840: MEMBAR	membar	#StoreLoad | #StoreStore 
	.word 0xcb3a0009  ! 3843: STDF_R	std	%f5, [%r9, %r8]
	.word 0xfc520009  ! 3843: LDSH_R	ldsh	[%r8 + %r9], %r30
	.word 0xc36a0009  ! 3843: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc93a0009  ! 3846: STDF_R	std	%f4, [%r9, %r8]
	.word 0xca120009  ! 3846: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0x8b2221e0  ! 3846: MULScc_I	mulscc 	%r8, 0x01e0, %r5
	.word 0xc6720009  ! 3849: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xe25a0009  ! 3849: LDX_R	ldx	[%r8 + %r9], %r17
	.word 0x8cd22bcc  ! 3849: UMULcc_I	umulcc 	%r8, 0x0bcc, %r6
	.word 0xc2720009  ! 3852: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xcc1a0009  ! 3852: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xea4a2fd4  ! 3852: LDSB_I	ldsb	[%r8 + 0x0fd4], %r21
	.word 0xd8220009  ! 3855: STW_R	stw	%r12, [%r8 + %r9]
	.word 0xf45a0009  ! 3855: LDX_R	ldx	[%r8 + %r9], %r26
	.word 0xc8f22ca0  ! 3855: STXA_I	stxa	%r4, [%r8 + 0x0ca0] %asi
	.word 0xcb220009  ! 3858: STF_R	st	%f5, [%r9, %r8]
	.word 0xc65a0009  ! 3858: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xa4d226ac  ! 3858: UMULcc_I	umulcc 	%r8, 0x06ac, %r18
	.word 0xcc220009  ! 3861: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xdc120009  ! 3861: LDUH_R	lduh	[%r8 + %r9], %r14
	.word 0x89a20929  ! 3861: FMULs	fmuls	%f8, %f9, %f4
	.word 0xc9220009  ! 3864: STF_R	st	%f4, [%r9, %r8]
	.word 0xc51a0009  ! 3864: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0x8c520009  ! 3864: UMUL_R	umul 	%r8, %r9, %r6
	.word 0xcb220009  ! 3867: STF_R	st	%f5, [%r9, %r8]
	.word 0xc8520009  ! 3867: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xcef22f50  ! 3867: STXA_I	stxa	%r7, [%r8 + 0x0f50] %asi
	.word 0xf0320009  ! 3870: STH_R	sth	%r24, [%r8 + %r9]
	.word 0xd80a0009  ! 3870: LDUB_R	ldub	[%r8 + %r9], %r12
	.word 0xc8922cd4  ! 3870: LDUHA_I	lduha	[%r8, + 0x0cd4] %asi, %r4
	.word 0xc8320009  ! 3873: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xcf1a0009  ! 3873: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xc6da1009  ! 3873: LDXA_R	ldxa	[%r8, %r9] 0x80, %r3
	.word 0xec720009  ! 3876: STX_R	stx	%r22, [%r8 + %r9]
	.word 0xf25a0009  ! 3876: LDX_R	ldx	[%r8 + %r9], %r25
	.word 0xdb22281c  ! 3876: STF_I	st	%f13, [0x081c, %r8]
	.word 0xfd3a0009  ! 3879: STDF_R	std	%f30, [%r9, %r8]
	.word 0xda5a0009  ! 3879: LDX_R	ldx	[%r8 + %r9], %r13
	.word 0x8143e020  ! 3879: MEMBAR	membar	#MemIssue 
	.word 0xcf3a0009  ! 3882: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc40a0009  ! 3882: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xccba25f8  ! 3882: STDA_I	stda	%r6, [%r8 + 0x05f8] %asi
	.word 0xc73a0009  ! 3885: STDF_R	std	%f3, [%r9, %r8]
	.word 0xff020009  ! 3885: LDF_R	ld	[%r8, %r9], %f31
	.word 0xc33a2e18  ! 3885: STDF_I	std	%f1, [0x0e18, %r8]
	.word 0xcd220009  ! 3888: STF_R	st	%f6, [%r9, %r8]
	.word 0xc9020009  ! 3888: LDF_R	ld	[%r8, %r9], %f4
	.word 0xc3ea1009  ! 3888: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xda220009  ! 3891: STW_R	stw	%r13, [%r8 + %r9]
	.word 0xca5a0009  ! 3891: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0x08800001  ! 3891: BLEU	bleu  	<label_0x1>
	.word 0xc2720009  ! 3894: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc40a0009  ! 3894: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xc2da1009  ! 3894: LDXA_R	ldxa	[%r8, %r9] 0x80, %r1
	.word 0xc3220009  ! 3897: STF_R	st	%f1, [%r9, %r8]
	.word 0xc65a0009  ! 3897: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xc36a2d8c  ! 3897: PREFETCH_I	prefetch	[%r8 + 0x0d8c], #one_read
	.word 0xc6720009  ! 3900: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc41a0009  ! 3900: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xc3ea28d8  ! 3900: PREFETCHA_I	prefetcha	[%r8, + 0x08d8] %asi, #one_read
	.word 0xcf3a0009  ! 3903: STDF_R	std	%f7, [%r9, %r8]
	.word 0xcc4a0009  ! 3903: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xc67a2210  ! 3903: SWAP_I	swap	%r3, [%r8 + 0x0210]
	.word 0xda720009  ! 3906: STX_R	stx	%r13, [%r8 + %r9]
	.word 0xcc020009  ! 3906: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0x844a0009  ! 3906: MULX_R	mulx 	%r8, %r9, %r2
	.word 0xcb220009  ! 3909: STF_R	st	%f5, [%r9, %r8]
	.word 0xcd020009  ! 3909: LDF_R	ld	[%r8, %r9], %f6
	.word 0x856a0009  ! 3909: SDIVX_R	sdivx	%r8, %r9, %r2
	.word 0xcc220009  ! 3912: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xfa420009  ! 3912: LDSW_R	ldsw	[%r8 + %r9], %r29
	.word 0x8143e03e  ! 3912: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0xc82a0009  ! 3915: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xce5a0009  ! 3915: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0x89a20829  ! 3915: FADDs	fadds	%f8, %f9, %f4
	.word 0xd6220009  ! 3918: STW_R	stw	%r11, [%r8 + %r9]
	.word 0xc2520009  ! 3918: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xce7a0009  ! 3918: SWAP_R	swap	%r7, [%r8 + %r9]
	.word 0xca320009  ! 3921: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xcc420009  ! 3921: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0x8143c000  ! 3921: STBAR	stbar
	.word 0xdc2a0009  ! 3924: STB_R	stb	%r14, [%r8 + %r9]
	.word 0xc80a0009  ! 3924: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0x24c20001  ! 3924: BRLEZ	brlez,a,nt	%8,<label_0x20001>
	.word 0xc6720009  ! 3927: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xf01a0009  ! 3927: LDD_R	ldd	[%r8 + %r9], %r24
	.word 0x8143c000  ! 3927: STBAR	stbar
	.word 0xe4220009  ! 3930: STW_R	stw	%r18, [%r8 + %r9]
	.word 0xc3020009  ! 3930: LDF_R	ld	[%r8, %r9], %f1
	.word 0xc36a269c  ! 3930: PREFETCH_I	prefetch	[%r8 + 0x069c], #one_read
	.word 0xcd3a0009  ! 3933: STDF_R	std	%f6, [%r9, %r8]
	.word 0xca4a0009  ! 3933: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0x8143c000  ! 3933: STBAR	stbar
	.word 0xce720009  ! 3936: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc85a0009  ! 3936: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xc9220009  ! 3936: STF_R	st	%f4, [%r9, %r8]
	.word 0xc8720009  ! 3939: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xe6420009  ! 3939: LDSW_R	ldsw	[%r8 + %r9], %r19
	.word 0x8143e054  ! 3939: MEMBAR	membar	#LoadStore | #Lookaside | #Sync 
	.word 0xd8320009  ! 3942: STH_R	sth	%r12, [%r8 + %r9]
	.word 0xc91a0009  ! 3942: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xef220009  ! 3942: STF_R	st	%f23, [%r9, %r8]
	.word 0xff3a0009  ! 3945: STDF_R	std	%f31, [%r9, %r8]
	.word 0xce420009  ! 3945: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xb05a2300  ! 3945: SMUL_I	smul 	%r8, 0x0300, %r24
	.word 0xc3220009  ! 3948: STF_R	st	%f1, [%r9, %r8]
	.word 0xce0a0009  ! 3948: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xa4522be4  ! 3948: UMUL_I	umul 	%r8, 0x0be4, %r18
	.word 0xcc2a0009  ! 3951: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xe01a0009  ! 3951: LDD_R	ldd	[%r8 + %r9], %r16
	.word 0xc68a287c  ! 3951: LDUBA_I	lduba	[%r8, + 0x087c] %asi, %r3
	.word 0xcf220009  ! 3954: STF_R	st	%f7, [%r9, %r8]
	.word 0xc44a0009  ! 3954: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xceaa1009  ! 3954: STBA_R	stba	%r7, [%r8 + %r9] 0x80
	.word 0xc2320009  ! 3957: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc80a0009  ! 3957: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xc3ea25e4  ! 3957: PREFETCHA_I	prefetcha	[%r8, + 0x05e4] %asi, #one_read
	.word 0xc82a0009  ! 3960: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc64a0009  ! 3960: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0x8c7a0009  ! 3960: SDIV_R	sdiv 	%r8, %r9, %r6
	.word 0xc2720009  ! 3963: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xca020009  ! 3963: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0x8143e017  ! 3963: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside 
	.word 0xf0720009  ! 3966: STX_R	stx	%r24, [%r8 + %r9]
	.word 0xce4a0009  ! 3966: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xae7a21d8  ! 3966: SDIV_I	sdiv 	%r8, 0x01d8, %r23
	.word 0xce320009  ! 3969: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xce020009  ! 3969: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xc36a0009  ! 3969: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xcc220009  ! 3972: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xcc520009  ! 3972: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xc8ca1009  ! 3972: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r4
	.word 0xcb3a0009  ! 3975: STDF_R	std	%f5, [%r9, %r8]
	.word 0xc01a0009  ! 3975: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0x1c800001  ! 3975: BPOS	bpos  	<label_0x1>
	.word 0xc2320009  ! 3978: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xcc420009  ! 3978: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0x86520009  ! 3978: UMUL_R	umul 	%r8, %r9, %r3
	.word 0xfc720009  ! 3981: STX_R	stx	%r30, [%r8 + %r9]
	.word 0xc6020009  ! 3981: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0x836a0009  ! 3981: SDIVX_R	sdivx	%r8, %r9, %r1
	.word 0xc93a0009  ! 3984: STDF_R	std	%f4, [%r9, %r8]
	.word 0xc8020009  ! 3984: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0x866a2598  ! 3984: UDIVX_I	udivx 	%r8, 0x0598, %r3
	.word 0xe5220009  ! 3987: STF_R	st	%f18, [%r9, %r8]
	.word 0xda4a0009  ! 3987: LDSB_R	ldsb	[%r8 + %r9], %r13
	.word 0xc36a2c74  ! 3987: PREFETCH_I	prefetch	[%r8 + 0x0c74], #one_read
	.word 0xfc2a0009  ! 3990: STB_R	stb	%r30, [%r8 + %r9]
	.word 0xec0a0009  ! 3990: LDUB_R	ldub	[%r8 + %r9], %r22
	.word 0xc8821009  ! 3990: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r4
	.word 0xf0220009  ! 3993: STW_R	stw	%r24, [%r8 + %r9]
	.word 0xf0420009  ! 3993: LDSW_R	ldsw	[%r8 + %r9], %r24
	.word 0xd84a27f8  ! 3993: LDSB_I	ldsb	[%r8 + 0x07f8], %r12
	.word 0xc6220009  ! 3996: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc51a0009  ! 3996: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xa9a20829  ! 3996: FADDs	fadds	%f8, %f9, %f20
	.word 0xce2a0009  ! 3999: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc81a0009  ! 3999: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x8143e065  ! 3999: MEMBAR	membar	#LoadLoad | #LoadStore | #MemIssue | #Sync 
        ta      T_GOOD_TRAP

th_main_1:
        setx  MAIN_BASE_DATA_VA, %r1, %r8
        setx  0x0000000000000e90, %g1, %r9
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
        setx  0xa3ebdb60d41597dc, %g1, %r0
        setx  0xc124f87d11c01650, %g1, %r1
        setx  0x8e0bf84ffe38a44a, %g1, %r2
        setx  0x18c081b1f6696e5c, %g1, %r3
        setx  0xf0644f6ebb9d718a, %g1, %r4
        setx  0x872e01c5958d49dd, %g1, %r5
        setx  0x051d0cb99882d72c, %g1, %r6
        setx  0x005dd6f810e18ce1, %g1, %r7
        setx  0xefd78acd5517ad67, %g1, %r10
        setx  0x3cb076207951adc9, %g1, %r11
        setx  0x17b922ff5eb9b6d1, %g1, %r12
        setx  0x70d307ea19a96cfd, %g1, %r13
        setx  0x1b4cd3bdd3304710, %g1, %r14
        setx  0x03ae3734e52377ef, %g1, %r15
        setx  0x71f11ddeb1f55ea7, %g1, %r16
        setx  0x7be27d94cb4418e4, %g1, %r17
        setx  0x46fdcd16c2a5e064, %g1, %r18
        setx  0xf6116b7a3ee283e8, %g1, %r19
        setx  0xd006665ab5e3b5b8, %g1, %r20
        setx  0x189baaeed7625ee9, %g1, %r21
        setx  0x45609c708d41b7ed, %g1, %r22
        setx  0x779aae64f72241b4, %g1, %r23
        setx  0xd9581a7a0c6b6c0f, %g1, %r24
        setx  0x5db9dcf4b5417028, %g1, %r25
        setx  0x34df23b4cfbe694a, %g1, %r26
        setx  0x9265cc517032488f, %g1, %r27
        setx  0xd0319b4267f2a22a, %g1, %r28
        setx  0xbf68fd926133733e, %g1, %r29
        setx  0xbf1ee33213002f8c, %g1, %r30
        setx  0xe6f34474d97a25f7, %g1, %r31
	.word 0xcc2a0009  ! 3: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc81a0009  ! 3: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x85a20829  ! 3: FADDs	fadds	%f8, %f9, %f2
	.word 0xc8720009  ! 6: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xe81a0009  ! 6: LDD_R	ldd	[%r8 + %r9], %r20
	.word 0x38800001  ! 6: BGU	bgu,a	<label_0x1>
	.word 0xc82a0009  ! 9: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xd8020009  ! 9: LDUW_R	lduw	[%r8 + %r9], %r12
	.word 0x8143e040  ! 9: MEMBAR	membar	#Sync 
	.word 0xc4720009  ! 12: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xd6120009  ! 12: LDUH_R	lduh	[%r8 + %r9], %r11
	.word 0xc36a0009  ! 12: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xec720009  ! 15: STX_R	stx	%r22, [%r8 + %r9]
	.word 0xc9020009  ! 15: LDF_R	ld	[%r8, %r9], %f4
	.word 0xc3ea2edc  ! 15: PREFETCHA_I	prefetcha	[%r8, + 0x0edc] %asi, #one_read
	.word 0xe2320009  ! 18: STH_R	sth	%r17, [%r8 + %r9]
	.word 0xc9020009  ! 18: LDF_R	ld	[%r8, %r9], %f4
	.word 0x86fa2470  ! 18: SDIVcc_I	sdivcc 	%r8, 0x0470, %r3
	.word 0xc5220009  ! 21: STF_R	st	%f2, [%r9, %r8]
	.word 0xdf1a0009  ! 21: LDDF_R	ldd	[%r8, %r9], %f15
	.word 0xeff22009  ! 21: CASXA_R	casxa	[%r8]%asi, %r9, %r23
	.word 0xcc320009  ! 24: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc41a0009  ! 24: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xc93a0009  ! 24: STDF_R	std	%f4, [%r9, %r8]
	.word 0xc53a0009  ! 27: STDF_R	std	%f2, [%r9, %r8]
	.word 0xe8420009  ! 27: LDSW_R	ldsw	[%r8 + %r9], %r20
	.word 0xc8ea21f4  ! 27: LDSTUBA_I	ldstuba	%r4, [%r8 + 0x01f4] %asi
	.word 0xe2220009  ! 30: STW_R	stw	%r17, [%r8 + %r9]
	.word 0xc4420009  ! 30: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0x2cc20001  ! 30: BRGZ	brgz,a,nt	%8,<label_0x20001>
	.word 0xde220009  ! 33: STW_R	stw	%r15, [%r8 + %r9]
	.word 0xca120009  ! 33: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xccb228b8  ! 33: STHA_I	stha	%r6, [%r8 + 0x08b8] %asi
	.word 0xc9220009  ! 36: STF_R	st	%f4, [%r9, %r8]
	.word 0xc44a0009  ! 36: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xc3ea1009  ! 36: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc8720009  ! 39: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xcb020009  ! 39: LDF_R	ld	[%r8, %r9], %f5
	.word 0x8143c000  ! 39: STBAR	stbar
	.word 0xce720009  ! 42: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc65a0009  ! 42: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0x8ba208a9  ! 42: FSUBs	fsubs	%f8, %f9, %f5
	.word 0xf82a0009  ! 45: STB_R	stb	%r28, [%r8 + %r9]
	.word 0xea5a0009  ! 45: LDX_R	ldx	[%r8 + %r9], %r21
	.word 0xc8d21009  ! 45: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r4
	.word 0xfd220009  ! 48: STF_R	st	%f30, [%r9, %r8]
	.word 0xca020009  ! 48: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xc4ba1009  ! 48: STDA_R	stda	%r2, [%r8 + %r9] 0x80
	.word 0xc4720009  ! 51: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xcd020009  ! 51: LDF_R	ld	[%r8, %r9], %f6
	.word 0xccda2290  ! 51: LDXA_I	ldxa	[%r8, + 0x0290] %asi, %r6
	.word 0xc22a0009  ! 54: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xf8420009  ! 54: LDSW_R	ldsw	[%r8 + %r9], %r28
	.word 0xe0a21009  ! 54: STWA_R	stwa	%r16, [%r8 + %r9] 0x80
	.word 0xca720009  ! 57: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc45a0009  ! 57: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xc7220009  ! 57: STF_R	st	%f3, [%r9, %r8]
	.word 0xc6220009  ! 60: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc40a0009  ! 60: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xceb21009  ! 60: STHA_R	stha	%r7, [%r8 + %r9] 0x80
	.word 0xc4320009  ! 63: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xcd1a0009  ! 63: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xc73a0009  ! 63: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc7220009  ! 66: STF_R	st	%f3, [%r9, %r8]
	.word 0xc2020009  ! 66: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xcafa2294  ! 66: SWAPA_I	swapa	%r5, [%r8 + 0x0294] %asi
	.word 0xd93a0009  ! 69: STDF_R	std	%f12, [%r9, %r8]
	.word 0xc8420009  ! 69: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0x8143c000  ! 69: STBAR	stbar
	.word 0xc4320009  ! 72: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xe40a0009  ! 72: LDUB_R	ldub	[%r8 + %r9], %r18
	.word 0xc3ea285c  ! 72: PREFETCHA_I	prefetcha	[%r8, + 0x085c] %asi, #one_read
	.word 0xc4720009  ! 75: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xcc120009  ! 75: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xcc7a0009  ! 75: SWAP_R	swap	%r6, [%r8 + %r9]
	.word 0xf7220009  ! 78: STF_R	st	%f27, [%r9, %r8]
	.word 0xc80a0009  ! 78: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xc36a0009  ! 78: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc42a0009  ! 81: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xf3020009  ! 81: LDF_R	ld	[%r8, %r9], %f25
	.word 0xc36a28ac  ! 81: PREFETCH_I	prefetch	[%r8 + 0x08ac], #one_read
	.word 0xfa720009  ! 84: STX_R	stx	%r29, [%r8 + %r9]
	.word 0xc2520009  ! 84: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0x8143e067  ! 84: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #MemIssue | #Sync 
	.word 0xcb3a0009  ! 87: STDF_R	std	%f5, [%r9, %r8]
	.word 0xde020009  ! 87: LDUW_R	lduw	[%r8 + %r9], %r15
	.word 0xcb222370  ! 87: STF_I	st	%f5, [0x0370, %r8]
	.word 0xc8220009  ! 90: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xcb020009  ! 90: LDF_R	ld	[%r8, %r9], %f5
	.word 0xc4ba1009  ! 90: STDA_R	stda	%r2, [%r8 + %r9] 0x80
	.word 0xcf220009  ! 93: STF_R	st	%f7, [%r9, %r8]
	.word 0xc6020009  ! 93: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xc2f221a8  ! 93: STXA_I	stxa	%r1, [%r8 + 0x01a8] %asi
	.word 0xca720009  ! 96: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc6420009  ! 96: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0x8a7a2814  ! 96: SDIV_I	sdiv 	%r8, 0x0814, %r5
	.word 0xcc720009  ! 99: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xcc5a0009  ! 99: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0x0cc20001  ! 99: BRGZ	brgz  ,nt	%8,<label_0x20001>
	.word 0xea220009  ! 102: STW_R	stw	%r21, [%r8 + %r9]
	.word 0xc41a0009  ! 102: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x8efa0009  ! 102: SDIVcc_R	sdivcc 	%r8, %r9, %r7
	.word 0xda720009  ! 105: STX_R	stx	%r13, [%r8 + %r9]
	.word 0xe81a0009  ! 105: LDD_R	ldd	[%r8 + %r9], %r20
	.word 0xd7f21009  ! 105: CASXA_I	casxa	[%r8] 0x80, %r9, %r11
	.word 0xfa720009  ! 108: STX_R	stx	%r29, [%r8 + %r9]
	.word 0xc44a0009  ! 108: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xc6c21009  ! 108: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r3
	.word 0xce720009  ! 111: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc41a0009  ! 111: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xceda1009  ! 111: LDXA_R	ldxa	[%r8, %r9] 0x80, %r7
	.word 0xcb220009  ! 114: STF_R	st	%f5, [%r9, %r8]
	.word 0xe6520009  ! 114: LDSH_R	ldsh	[%r8 + %r9], %r19
	.word 0x8da20929  ! 114: FMULs	fmuls	%f8, %f9, %f6
	.word 0xcf220009  ! 117: STF_R	st	%f7, [%r9, %r8]
	.word 0xe41a0009  ! 117: LDD_R	ldd	[%r8 + %r9], %r18
	.word 0xb0fa2d68  ! 117: SDIVcc_I	sdivcc 	%r8, 0x0d68, %r24
	.word 0xce220009  ! 120: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc7020009  ! 120: LDF_R	ld	[%r8, %r9], %f3
	.word 0xf6a21009  ! 120: STWA_R	stwa	%r27, [%r8 + %r9] 0x80
	.word 0xce220009  ! 123: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xcb1a0009  ! 123: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xc3ea1009  ! 123: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc8220009  ! 126: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc65a0009  ! 126: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xe4ea1009  ! 126: LDSTUBA_R	ldstuba	%r18, [%r8 + %r9] 0x80
	.word 0xe0220009  ! 129: STW_R	stw	%r16, [%r8 + %r9]
	.word 0xdc1a0009  ! 129: LDD_R	ldd	[%r8 + %r9], %r14
	.word 0xc8a22984  ! 129: STWA_I	stwa	%r4, [%r8 + 0x0984] %asi
	.word 0xc6220009  ! 132: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc85a0009  ! 132: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0x85220009  ! 132: MULScc_R	mulscc 	%r8, %r9, %r2
	.word 0xc73a0009  ! 135: STDF_R	std	%f3, [%r9, %r8]
	.word 0xfe120009  ! 135: LDUH_R	lduh	[%r8 + %r9], %r31
	.word 0xcd1a0009  ! 135: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xc9220009  ! 138: STF_R	st	%f4, [%r9, %r8]
	.word 0xcc520009  ! 138: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xc49a2748  ! 138: LDDA_I	ldda	[%r8, + 0x0748] %asi, %r2
	.word 0xc82a0009  ! 141: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xca520009  ! 141: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xccda1009  ! 141: LDXA_R	ldxa	[%r8, %r9] 0x80, %r6
	.word 0xc7220009  ! 144: STF_R	st	%f3, [%r9, %r8]
	.word 0xc4520009  ! 144: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xdcd21009  ! 144: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r14
	.word 0xc8720009  ! 147: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc3020009  ! 147: LDF_R	ld	[%r8, %r9], %f1
	.word 0x8a722d7c  ! 147: UDIV_I	udiv 	%r8, 0x0d7c, %r5
	.word 0xce220009  ! 150: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc91a0009  ! 150: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xc27a29f0  ! 150: SWAP_I	swap	%r1, [%r8 + 0x09f0]
	.word 0xc6720009  ! 153: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xce5a0009  ! 153: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xc3ea2fa8  ! 153: PREFETCHA_I	prefetcha	[%r8, + 0x0fa8] %asi, #one_read
	.word 0xc9220009  ! 156: STF_R	st	%f4, [%r9, %r8]
	.word 0xc2520009  ! 156: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0x2c800001  ! 156: BNEG	bneg,a	<label_0x1>
	.word 0xc42a0009  ! 159: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xcc4a0009  ! 159: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0x8143e04c  ! 159: MEMBAR	membar	#LoadStore | #StoreStore | #Sync 
	.word 0xcc220009  ! 162: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc60a0009  ! 162: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0x2aca0001  ! 162: BRNZ	brnz,a,pt	%8,<label_0xa0001>
	.word 0xc73a0009  ! 165: STDF_R	std	%f3, [%r9, %r8]
	.word 0xcc420009  ! 165: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0x8fa208a9  ! 165: FSUBs	fsubs	%f8, %f9, %f7
	.word 0xe42a0009  ! 168: STB_R	stb	%r18, [%r8 + %r9]
	.word 0xc91a0009  ! 168: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0x86d20009  ! 168: UMULcc_R	umulcc 	%r8, %r9, %r3
	.word 0xdc220009  ! 171: STW_R	stw	%r14, [%r8 + %r9]
	.word 0xce020009  ! 171: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xc49a2080  ! 171: LDDA_I	ldda	[%r8, + 0x0080] %asi, %r2
	.word 0xc6220009  ! 174: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc5020009  ! 174: LDF_R	ld	[%r8, %r9], %f2
	.word 0x82f22858  ! 174: UDIVcc_I	udivcc 	%r8, 0x0858, %r1
	.word 0xe7220009  ! 177: STF_R	st	%f19, [%r9, %r8]
	.word 0xcf020009  ! 177: LDF_R	ld	[%r8, %r9], %f7
	.word 0xea0a28e4  ! 177: LDUB_I	ldub	[%r8 + 0x08e4], %r21
	.word 0xc6720009  ! 180: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xf4020009  ! 180: LDUW_R	lduw	[%r8 + %r9], %r26
	.word 0x8e5a0009  ! 180: SMUL_R	smul 	%r8, %r9, %r7
	.word 0xca2a0009  ! 183: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc51a0009  ! 183: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0x8ed20009  ! 183: UMULcc_R	umulcc 	%r8, %r9, %r7
	.word 0xce2a0009  ! 186: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xf80a0009  ! 186: LDUB_R	ldub	[%r8 + %r9], %r28
	.word 0xc20a0009  ! 186: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xd8720009  ! 189: STX_R	stx	%r12, [%r8 + %r9]
	.word 0xfa5a0009  ! 189: LDX_R	ldx	[%r8 + %r9], %r29
	.word 0xe84a2edc  ! 189: LDSB_I	ldsb	[%r8 + 0x0edc], %r20
	.word 0xca220009  ! 192: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xcb020009  ! 192: LDF_R	ld	[%r8, %r9], %f5
	.word 0x8cfa0009  ! 192: SDIVcc_R	sdivcc 	%r8, %r9, %r6
	.word 0xee220009  ! 195: STW_R	stw	%r23, [%r8 + %r9]
	.word 0xc6120009  ! 195: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xba4a0009  ! 195: MULX_R	mulx 	%r8, %r9, %r29
	.word 0xc2720009  ! 198: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xfc4a0009  ! 198: LDSB_R	ldsb	[%r8 + %r9], %r30
	.word 0x8143e045  ! 198: MEMBAR	membar	#LoadLoad | #LoadStore | #Sync 
	.word 0xe2220009  ! 201: STW_R	stw	%r17, [%r8 + %r9]
	.word 0xcc120009  ! 201: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0x83a209a9  ! 201: FDIVs	fdivs	%f8, %f9, %f1
	.word 0xcd220009  ! 204: STF_R	st	%f6, [%r9, %r8]
	.word 0xdc4a0009  ! 204: LDSB_R	ldsb	[%r8 + %r9], %r14
	.word 0xc68a29b8  ! 204: LDUBA_I	lduba	[%r8, + 0x09b8] %asi, %r3
	.word 0xfa720009  ! 207: STX_R	stx	%r29, [%r8 + %r9]
	.word 0xfd1a0009  ! 207: LDDF_R	ldd	[%r8, %r9], %f30
	.word 0xc7222ff0  ! 207: STF_I	st	%f3, [0x0ff0, %r8]
	.word 0xc8320009  ! 210: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xf2020009  ! 210: LDUW_R	lduw	[%r8 + %r9], %r25
	.word 0xc91a2030  ! 210: LDDF_I	ldd	[%r8, 0x0030], %f4
	.word 0xe4320009  ! 213: STH_R	sth	%r18, [%r8 + %r9]
	.word 0xca0a0009  ! 213: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xc36a0009  ! 213: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xcc2a0009  ! 216: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xe8420009  ! 216: LDSW_R	ldsw	[%r8 + %r9], %r20
	.word 0xc2ca1009  ! 216: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r1
	.word 0xc93a0009  ! 219: STDF_R	std	%f4, [%r9, %r8]
	.word 0xe05a0009  ! 219: LDX_R	ldx	[%r8 + %r9], %r16
	.word 0xc93a23e0  ! 219: STDF_I	std	%f4, [0x03e0, %r8]
	.word 0xcd220009  ! 222: STF_R	st	%f6, [%r9, %r8]
	.word 0xc31a0009  ! 222: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0x8143e07f  ! 222: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xc8320009  ! 225: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc40a0009  ! 225: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xff220009  ! 225: STF_R	st	%f31, [%r9, %r8]
	.word 0xc82a0009  ! 228: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xda420009  ! 228: LDSW_R	ldsw	[%r8 + %r9], %r13
	.word 0x865222b8  ! 228: UMUL_I	umul 	%r8, 0x02b8, %r3
	.word 0xc73a0009  ! 231: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc71a0009  ! 231: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xea8a239c  ! 231: LDUBA_I	lduba	[%r8, + 0x039c] %asi, %r21
	.word 0xfa720009  ! 234: STX_R	stx	%r29, [%r8 + %r9]
	.word 0xc31a0009  ! 234: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xc6b21009  ! 234: STHA_R	stha	%r3, [%r8 + %r9] 0x80
	.word 0xc33a0009  ! 237: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc41a0009  ! 237: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x8da20829  ! 237: FADDs	fadds	%f8, %f9, %f6
	.word 0xc82a0009  ! 240: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc80a0009  ! 240: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xe73a0009  ! 240: STDF_R	std	%f19, [%r9, %r8]
	.word 0xcf3a0009  ! 243: STDF_R	std	%f7, [%r9, %r8]
	.word 0xf4020009  ! 243: LDUW_R	lduw	[%r8 + %r9], %r26
	.word 0x824a0009  ! 243: MULX_R	mulx 	%r8, %r9, %r1
	.word 0xca320009  ! 246: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xca020009  ! 246: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xcafa1009  ! 246: SWAPA_R	swapa	%r5, [%r8 + %r9] 0x80
	.word 0xc6220009  ! 249: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc91a0009  ! 249: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xc93a0009  ! 249: STDF_R	std	%f4, [%r9, %r8]
	.word 0xca2a0009  ! 252: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc4120009  ! 252: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xcefa2ce4  ! 252: SWAPA_I	swapa	%r7, [%r8 + 0x0ce4] %asi
	.word 0xc2220009  ! 255: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc8420009  ! 255: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0x88522900  ! 255: UMUL_I	umul 	%r8, 0x0900, %r4
	.word 0xc82a0009  ! 258: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc7020009  ! 258: LDF_R	ld	[%r8, %r9], %f3
	.word 0xc7f22009  ! 258: CASXA_R	casxa	[%r8]%asi, %r9, %r3
	.word 0xcf220009  ! 261: STF_R	st	%f7, [%r9, %r8]
	.word 0xde5a0009  ! 261: LDX_R	ldx	[%r8 + %r9], %r15
	.word 0xc6122858  ! 261: LDUH_I	lduh	[%r8 + 0x0858], %r3
	.word 0xcc320009  ! 264: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc40a0009  ! 264: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xc36a25a4  ! 264: PREFETCH_I	prefetch	[%r8 + 0x05a4], #one_read
	.word 0xc7220009  ! 267: STF_R	st	%f3, [%r9, %r8]
	.word 0xcc120009  ! 267: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xccba1009  ! 267: STDA_R	stda	%r6, [%r8 + %r9] 0x80
	.word 0xfc320009  ! 270: STH_R	sth	%r30, [%r8 + %r9]
	.word 0xc25a0009  ! 270: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xb3a20829  ! 270: FADDs	fadds	%f8, %f9, %f25
	.word 0xc22a0009  ! 273: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xce4a0009  ! 273: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xc2ea1009  ! 273: LDSTUBA_R	ldstuba	%r1, [%r8 + %r9] 0x80
	.word 0xca220009  ! 276: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc8520009  ! 276: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xf67a2500  ! 276: SWAP_I	swap	%r27, [%r8 + 0x0500]
	.word 0xce720009  ! 279: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xcc0a0009  ! 279: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0x18800002  ! 279: BGU	bgu  	<label_0x2>
	.word 0xca220009  ! 282: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xe0420009  ! 282: LDSW_R	ldsw	[%r8 + %r9], %r16
	.word 0xee0a2400  ! 282: LDUB_I	ldub	[%r8 + 0x0400], %r23
	.word 0xca2a0009  ! 285: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xe41a0009  ! 285: LDD_R	ldd	[%r8 + %r9], %r18
	.word 0xc36a22b4  ! 285: PREFETCH_I	prefetch	[%r8 + 0x02b4], #one_read
	.word 0xfa320009  ! 288: STH_R	sth	%r29, [%r8 + %r9]
	.word 0xc25a0009  ! 288: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0x8143c000  ! 288: STBAR	stbar
	.word 0xc93a0009  ! 291: STDF_R	std	%f4, [%r9, %r8]
	.word 0xcc120009  ! 291: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xecfa22e8  ! 291: SWAPA_I	swapa	%r22, [%r8 + 0x02e8] %asi
	.word 0xe3220009  ! 294: STF_R	st	%f17, [%r9, %r8]
	.word 0xc2120009  ! 294: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xc89a2ff8  ! 294: LDDA_I	ldda	[%r8, + 0x0ff8] %asi, %r4
	.word 0xc8720009  ! 297: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xe84a0009  ! 297: LDSB_R	ldsb	[%r8 + %r9], %r20
	.word 0xb72226d4  ! 297: MULScc_I	mulscc 	%r8, 0x06d4, %r27
	.word 0xf33a0009  ! 300: STDF_R	std	%f25, [%r9, %r8]
	.word 0xd7020009  ! 300: LDF_R	ld	[%r8, %r9], %f11
	.word 0xc25a2e78  ! 300: LDX_I	ldx	[%r8 + 0x0e78], %r1
	.word 0xcc720009  ! 303: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xdd1a0009  ! 303: LDDF_R	ldd	[%r8, %r9], %f14
	.word 0xcaea2094  ! 303: LDSTUBA_I	ldstuba	%r5, [%r8 + 0x0094] %asi
	.word 0xc2320009  ! 306: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc6520009  ! 306: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xb7220009  ! 306: MULScc_R	mulscc 	%r8, %r9, %r27
	.word 0xda720009  ! 309: STX_R	stx	%r13, [%r8 + %r9]
	.word 0xc41a0009  ! 309: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xc81a0009  ! 309: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xfb3a0009  ! 312: STDF_R	std	%f29, [%r9, %r8]
	.word 0xca420009  ! 312: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0x3a800001  ! 312: BCC	bcc,a	<label_0x1>
	.word 0xc4320009  ! 315: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc4520009  ! 315: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xee0a0009  ! 315: LDUB_R	ldub	[%r8 + %r9], %r23
	.word 0xcc220009  ! 318: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc60a0009  ! 318: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xcc4a25dc  ! 318: LDSB_I	ldsb	[%r8 + 0x05dc], %r6
	.word 0xc73a0009  ! 321: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc8120009  ! 321: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xc3ea2ae4  ! 321: PREFETCHA_I	prefetcha	[%r8, + 0x0ae4] %asi, #one_read
	.word 0xc5220009  ! 324: STF_R	st	%f2, [%r9, %r8]
	.word 0xc84a0009  ! 324: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xd8aa27d4  ! 324: STBA_I	stba	%r12, [%r8 + 0x07d4] %asi
	.word 0xca220009  ! 327: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xca420009  ! 327: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0x83a20929  ! 327: FMULs	fmuls	%f8, %f9, %f1
	.word 0xde2a0009  ! 330: STB_R	stb	%r15, [%r8 + %r9]
	.word 0xc9020009  ! 330: LDF_R	ld	[%r8, %r9], %f4
	.word 0xc3ea1009  ! 330: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xe1220009  ! 333: STF_R	st	%f16, [%r9, %r8]
	.word 0xf00a0009  ! 333: LDUB_R	ldub	[%r8 + %r9], %r24
	.word 0x0a800002  ! 333: BCS	bcs  	<label_0x2>
	.word 0xcb220009  ! 336: STF_R	st	%f5, [%r9, %r8]
	.word 0xca020009  ! 336: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xccea1009  ! 336: LDSTUBA_R	ldstuba	%r6, [%r8 + %r9] 0x80
	.word 0xc6720009  ! 339: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xca520009  ! 339: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0x8e4a0009  ! 339: MULX_R	mulx 	%r8, %r9, %r7
	.word 0xe6320009  ! 342: STH_R	sth	%r19, [%r8 + %r9]
	.word 0xf80a0009  ! 342: LDUB_R	ldub	[%r8 + %r9], %r28
	.word 0xbf6a0009  ! 342: SDIVX_R	sdivx	%r8, %r9, %r31
	.word 0xcb3a0009  ! 345: STDF_R	std	%f5, [%r9, %r8]
	.word 0xd60a0009  ! 345: LDUB_R	ldub	[%r8 + %r9], %r11
	.word 0x8143c000  ! 345: STBAR	stbar
	.word 0xc6220009  ! 348: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xdc1a0009  ! 348: LDD_R	ldd	[%r8 + %r9], %r14
	.word 0xeab21009  ! 348: STHA_R	stha	%r21, [%r8 + %r9] 0x80
	.word 0xe9220009  ! 351: STF_R	st	%f20, [%r9, %r8]
	.word 0xc45a0009  ! 351: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0x8143e056  ! 351: MEMBAR	membar	#StoreLoad | #LoadStore | #Lookaside | #Sync 
	.word 0xc2320009  ! 354: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc51a0009  ! 354: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0x8e5a0009  ! 354: SMUL_R	smul 	%r8, %r9, %r7
	.word 0xcc720009  ! 357: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xca520009  ! 357: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xc36a2150  ! 357: PREFETCH_I	prefetch	[%r8 + 0x0150], #one_read
	.word 0xde220009  ! 360: STW_R	stw	%r15, [%r8 + %r9]
	.word 0xf3020009  ! 360: LDF_R	ld	[%r8, %r9], %f25
	.word 0x83220009  ! 360: MULScc_R	mulscc 	%r8, %r9, %r1
	.word 0xcd220009  ! 363: STF_R	st	%f6, [%r9, %r8]
	.word 0xf64a0009  ! 363: LDSB_R	ldsb	[%r8 + %r9], %r27
	.word 0x8ada0009  ! 363: SMULcc_R	smulcc 	%r8, %r9, %r5
	.word 0xcb3a0009  ! 366: STDF_R	std	%f5, [%r9, %r8]
	.word 0xe2120009  ! 366: LDUH_R	lduh	[%r8 + %r9], %r17
	.word 0x2a800001  ! 366: BCS	bcs,a	<label_0x1>
	.word 0xc2720009  ! 369: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc41a0009  ! 369: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xc9e21009  ! 369: CASA_I	casa	[%r8] 0x80, %r9, %r4
	.word 0xc62a0009  ! 372: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xce120009  ! 372: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0x22800001  ! 372: BE	be,a	<label_0x1>
	.word 0xdc320009  ! 375: STH_R	sth	%r14, [%r8 + %r9]
	.word 0xc4020009  ! 375: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0x8c7227bc  ! 375: UDIV_I	udiv 	%r8, 0x07bc, %r6
	.word 0xc6320009  ! 378: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc41a0009  ! 378: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x32800001  ! 378: BNE	bne,a	<label_0x1>
	.word 0xc42a0009  ! 381: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xec1a0009  ! 381: LDD_R	ldd	[%r8 + %r9], %r22
	.word 0xc5e22009  ! 381: CASA_R	casa	[%r8] %asi, %r9, %r2
	.word 0xcb220009  ! 384: STF_R	st	%f5, [%r9, %r8]
	.word 0xcc0a0009  ! 384: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xa5a208a9  ! 384: FSUBs	fsubs	%f8, %f9, %f18
	.word 0xfc2a0009  ! 387: STB_R	stb	%r30, [%r8 + %r9]
	.word 0xcb020009  ! 387: LDF_R	ld	[%r8, %r9], %f5
	.word 0xc3ea1009  ! 387: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc6320009  ! 390: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xcc120009  ! 390: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xc3ea2768  ! 390: PREFETCHA_I	prefetcha	[%r8, + 0x0768] %asi, #one_read
	.word 0xc4720009  ! 393: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xdc5a0009  ! 393: LDX_R	ldx	[%r8 + %r9], %r14
	.word 0xc3ea2cec  ! 393: PREFETCHA_I	prefetcha	[%r8, + 0x0cec] %asi, #one_read
	.word 0xc2220009  ! 396: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc2020009  ! 396: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0x89a208a9  ! 396: FSUBs	fsubs	%f8, %f9, %f4
	.word 0xef3a0009  ! 399: STDF_R	std	%f23, [%r9, %r8]
	.word 0xe0520009  ! 399: LDSH_R	ldsh	[%r8 + %r9], %r16
	.word 0x87a209a9  ! 399: FDIVs	fdivs	%f8, %f9, %f3
	.word 0xc62a0009  ! 402: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xf11a0009  ! 402: LDDF_R	ldd	[%r8, %r9], %f24
	.word 0x8e522c90  ! 402: UMUL_I	umul 	%r8, 0x0c90, %r7
	.word 0xc53a0009  ! 405: STDF_R	std	%f2, [%r9, %r8]
	.word 0xee120009  ! 405: LDUH_R	lduh	[%r8 + %r9], %r23
	.word 0xdb022b78  ! 405: LDF_I	ld	[%r8, 0x0b78], %f13
	.word 0xcc220009  ! 408: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc6020009  ! 408: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0x88520009  ! 408: UMUL_R	umul 	%r8, %r9, %r4
	.word 0xc4220009  ! 411: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc4120009  ! 411: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0x0eca0001  ! 411: BRGEZ	brgez  ,pt	%8,<label_0xa0001>
	.word 0xc7220009  ! 414: STF_R	st	%f3, [%r9, %r8]
	.word 0xcb020009  ! 414: LDF_R	ld	[%r8, %r9], %f5
	.word 0x8f220009  ! 414: MULScc_R	mulscc 	%r8, %r9, %r7
	.word 0xcf3a0009  ! 417: STDF_R	std	%f7, [%r9, %r8]
	.word 0xca4a0009  ! 417: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0x89a20829  ! 417: FADDs	fadds	%f8, %f9, %f4
	.word 0xda220009  ! 420: STW_R	stw	%r13, [%r8 + %r9]
	.word 0xca120009  ! 420: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xf4d22b64  ! 420: LDSHA_I	ldsha	[%r8, + 0x0b64] %asi, %r26
	.word 0xca320009  ! 423: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xcb020009  ! 423: LDF_R	ld	[%r8, %r9], %f5
	.word 0x86522c30  ! 423: UMUL_I	umul 	%r8, 0x0c30, %r3
	.word 0xf93a0009  ! 426: STDF_R	std	%f28, [%r9, %r8]
	.word 0xc51a0009  ! 426: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xcb3a2f18  ! 426: STDF_I	std	%f5, [0x0f18, %r8]
	.word 0xc8220009  ! 429: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xe6020009  ! 429: LDUW_R	lduw	[%r8 + %r9], %r19
	.word 0x24800001  ! 429: BLE	ble,a	<label_0x1>
	.word 0xc2220009  ! 432: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc71a0009  ! 432: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xcd3a29f8  ! 432: STDF_I	std	%f6, [0x09f8, %r8]
	.word 0xee320009  ! 435: STH_R	sth	%r23, [%r8 + %r9]
	.word 0xc2420009  ! 435: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xe6aa1009  ! 435: STBA_R	stba	%r19, [%r8 + %r9] 0x80
	.word 0xc4220009  ! 438: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc6520009  ! 438: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xf0ca1009  ! 438: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r24
	.word 0xc42a0009  ! 441: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xcc020009  ! 441: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0x2c800001  ! 441: BNEG	bneg,a	<label_0x1>
	.word 0xcb220009  ! 444: STF_R	st	%f5, [%r9, %r8]
	.word 0xcc4a0009  ! 444: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xa85a2894  ! 444: SMUL_I	smul 	%r8, 0x0894, %r20
	.word 0xe2320009  ! 447: STH_R	sth	%r17, [%r8 + %r9]
	.word 0xce520009  ! 447: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xe4fa1009  ! 447: SWAPA_R	swapa	%r18, [%r8 + %r9] 0x80
	.word 0xf6320009  ! 450: STH_R	sth	%r27, [%r8 + %r9]
	.word 0xc80a0009  ! 450: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0x8143e05d  ! 450: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0xcc320009  ! 453: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xfe520009  ! 453: LDSH_R	ldsh	[%r8 + %r9], %r31
	.word 0x89a208a9  ! 453: FSUBs	fsubs	%f8, %f9, %f4
	.word 0xc4220009  ! 456: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xca4a0009  ! 456: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xcb3a0009  ! 456: STDF_R	std	%f5, [%r9, %r8]
	.word 0xca2a0009  ! 459: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xce020009  ! 459: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xdaf21009  ! 459: STXA_R	stxa	%r13, [%r8 + %r9] 0x80
	.word 0xcc720009  ! 462: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xcc0a0009  ! 462: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xf6020009  ! 462: LDUW_R	lduw	[%r8 + %r9], %r27
	.word 0xcb3a0009  ! 465: STDF_R	std	%f5, [%r9, %r8]
	.word 0xde020009  ! 465: LDUW_R	lduw	[%r8 + %r9], %r15
	.word 0x8143c000  ! 465: STBAR	stbar
	.word 0xf4220009  ! 468: STW_R	stw	%r26, [%r8 + %r9]
	.word 0xcc420009  ! 468: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0x1a800002  ! 468: BCC	bcc  	<label_0x2>
	.word 0xc3220009  ! 471: STF_R	st	%f1, [%r9, %r8]
	.word 0xfa420009  ! 471: LDSW_R	ldsw	[%r8 + %r9], %r29
	.word 0x884a205c  ! 471: MULX_I	mulx 	%r8, 0x005c, %r4
	.word 0xc8720009  ! 474: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xcf020009  ! 474: LDF_R	ld	[%r8, %r9], %f7
	.word 0xdcca2d14  ! 474: LDSBA_I	ldsba	[%r8, + 0x0d14] %asi, %r14
	.word 0xda320009  ! 477: STH_R	sth	%r13, [%r8 + %r9]
	.word 0xf4120009  ! 477: LDUH_R	lduh	[%r8 + %r9], %r26
	.word 0xc36a0009  ! 477: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xdc2a0009  ! 480: STB_R	stb	%r14, [%r8 + %r9]
	.word 0xfa0a0009  ! 480: LDUB_R	ldub	[%r8 + %r9], %r29
	.word 0x8c4a2514  ! 480: MULX_I	mulx 	%r8, 0x0514, %r6
	.word 0xf0320009  ! 483: STH_R	sth	%r24, [%r8 + %r9]
	.word 0xca5a0009  ! 483: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0x8143c000  ! 483: STBAR	stbar
	.word 0xdc2a0009  ! 486: STB_R	stb	%r14, [%r8 + %r9]
	.word 0xca0a0009  ! 486: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xe0f21009  ! 486: STXA_R	stxa	%r16, [%r8 + %r9] 0x80
	.word 0xca720009  ! 489: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xce020009  ! 489: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xc3220009  ! 489: STF_R	st	%f1, [%r9, %r8]
	.word 0xc4720009  ! 492: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc45a0009  ! 492: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xc2da2bd8  ! 492: LDXA_I	ldxa	[%r8, + 0x0bd8] %asi, %r1
	.word 0xc2720009  ! 495: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc8020009  ! 495: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0x2a800001  ! 495: BCS	bcs,a	<label_0x1>
	.word 0xcb220009  ! 498: STF_R	st	%f5, [%r9, %r8]
	.word 0xfb1a0009  ! 498: LDDF_R	ldd	[%r8, %r9], %f29
	.word 0x26800001  ! 498: BL	bl,a	<label_0x1>
	.word 0xe33a0009  ! 501: STDF_R	std	%f17, [%r9, %r8]
	.word 0xc24a0009  ! 501: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xc6fa1009  ! 501: SWAPA_R	swapa	%r3, [%r8 + %r9] 0x80
	.word 0xc5220009  ! 504: STF_R	st	%f2, [%r9, %r8]
	.word 0xc2120009  ! 504: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0x8c6a0009  ! 504: UDIVX_R	udivx 	%r8, %r9, %r6
	.word 0xc5220009  ! 507: STF_R	st	%f2, [%r9, %r8]
	.word 0xe41a0009  ! 507: LDD_R	ldd	[%r8 + %r9], %r18
	.word 0x2a800001  ! 507: BCS	bcs,a	<label_0x1>
	.word 0xcd220009  ! 510: STF_R	st	%f6, [%r9, %r8]
	.word 0xc40a0009  ! 510: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xcfe21009  ! 510: CASA_I	casa	[%r8] 0x80, %r9, %r7
	.word 0xe6320009  ! 513: STH_R	sth	%r19, [%r8 + %r9]
	.word 0xfa520009  ! 513: LDSH_R	ldsh	[%r8 + %r9], %r29
	.word 0xc2a22c98  ! 513: STWA_I	stwa	%r1, [%r8 + 0x0c98] %asi
	.word 0xe1220009  ! 516: STF_R	st	%f16, [%r9, %r8]
	.word 0xc4420009  ! 516: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xc3ea2a80  ! 516: PREFETCHA_I	prefetcha	[%r8, + 0x0a80] %asi, #one_read
	.word 0xc2220009  ! 519: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xec0a0009  ! 519: LDUB_R	ldub	[%r8 + %r9], %r22
	.word 0xc8da1009  ! 519: LDXA_R	ldxa	[%r8, %r9] 0x80, %r4
	.word 0xe4320009  ! 522: STH_R	sth	%r18, [%r8 + %r9]
	.word 0xce0a0009  ! 522: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0x8143e03e  ! 522: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0xca320009  ! 525: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xfa4a0009  ! 525: LDSB_R	ldsb	[%r8 + %r9], %r29
	.word 0xcab223e0  ! 525: STHA_I	stha	%r5, [%r8 + 0x03e0] %asi
	.word 0xcc220009  ! 528: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xdf020009  ! 528: LDF_R	ld	[%r8, %r9], %f15
	.word 0xce922828  ! 528: LDUHA_I	lduha	[%r8, + 0x0828] %asi, %r7
	.word 0xc7220009  ! 531: STF_R	st	%f3, [%r9, %r8]
	.word 0xc3020009  ! 531: LDF_R	ld	[%r8, %r9], %f1
	.word 0xc20a2254  ! 531: LDUB_I	ldub	[%r8 + 0x0254], %r1
	.word 0xe62a0009  ! 534: STB_R	stb	%r19, [%r8 + %r9]
	.word 0xe60a0009  ! 534: LDUB_R	ldub	[%r8 + %r9], %r19
	.word 0xf8ba2260  ! 534: STDA_I	stda	%r28, [%r8 + 0x0260] %asi
	.word 0xc8720009  ! 537: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xe84a0009  ! 537: LDSB_R	ldsb	[%r8 + %r9], %r20
	.word 0x8143c000  ! 537: STBAR	stbar
	.word 0xf8720009  ! 540: STX_R	stx	%r28, [%r8 + %r9]
	.word 0xcb020009  ! 540: LDF_R	ld	[%r8, %r9], %f5
	.word 0x8af20009  ! 540: UDIVcc_R	udivcc 	%r8, %r9, %r5
	.word 0xcb220009  ! 543: STF_R	st	%f5, [%r9, %r8]
	.word 0xcf1a0009  ! 543: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0x22ca0001  ! 543: BRZ	brz,a,pt	%8,<label_0xa0001>
	.word 0xfc220009  ! 546: STW_R	stw	%r30, [%r8 + %r9]
	.word 0xe71a0009  ! 546: LDDF_R	ldd	[%r8, %r9], %f19
	.word 0x8143e008  ! 546: MEMBAR	membar	#StoreStore 
	.word 0xc3220009  ! 549: STF_R	st	%f1, [%r9, %r8]
	.word 0xc6420009  ! 549: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xcc921009  ! 549: LDUHA_R	lduha	[%r8, %r9] 0x80, %r6
	.word 0xc22a0009  ! 552: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc6420009  ! 552: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xc26a2654  ! 552: LDSTUB_I	ldstub	%r1, [%r8 + 0x0654]
	.word 0xd8320009  ! 555: STH_R	sth	%r12, [%r8 + %r9]
	.word 0xd9020009  ! 555: LDF_R	ld	[%r8, %r9], %f12
	.word 0xc4d21009  ! 555: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r2
	.word 0xc8220009  ! 558: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xf4520009  ! 558: LDSH_R	ldsh	[%r8 + %r9], %r26
	.word 0xc8420009  ! 558: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xc6220009  ! 561: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xcc5a0009  ! 561: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xed220009  ! 561: STF_R	st	%f22, [%r9, %r8]
	.word 0xc4720009  ! 564: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc6020009  ! 564: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xe0ca2048  ! 564: LDSBA_I	ldsba	[%r8, + 0x0048] %asi, %r16
	.word 0xcd220009  ! 567: STF_R	st	%f6, [%r9, %r8]
	.word 0xf3020009  ! 567: LDF_R	ld	[%r8, %r9], %f25
	.word 0xc86a0009  ! 567: LDSTUB_R	ldstub	%r4, [%r8 + %r9]
	.word 0xc5220009  ! 570: STF_R	st	%f2, [%r9, %r8]
	.word 0xcd1a0009  ! 570: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0x1e800001  ! 570: BVC	bvc  	<label_0x1>
	.word 0xe93a0009  ! 573: STDF_R	std	%f20, [%r9, %r8]
	.word 0xfe0a0009  ! 573: LDUB_R	ldub	[%r8 + %r9], %r31
	.word 0xfa422640  ! 573: LDSW_I	ldsw	[%r8 + 0x0640], %r29
	.word 0xc6220009  ! 576: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xe64a0009  ! 576: LDSB_R	ldsb	[%r8 + %r9], %r19
	.word 0xc9220009  ! 576: STF_R	st	%f4, [%r9, %r8]
	.word 0xca2a0009  ! 579: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xf11a0009  ! 579: LDDF_R	ldd	[%r8, %r9], %f24
	.word 0x8143e05e  ! 579: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0xc73a0009  ! 582: STDF_R	std	%f3, [%r9, %r8]
	.word 0xed020009  ! 582: LDF_R	ld	[%r8, %r9], %f22
	.word 0x8143e00a  ! 582: MEMBAR	membar	#StoreLoad | #StoreStore 
	.word 0xcc320009  ! 585: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc8520009  ! 585: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xeab22cb0  ! 585: STHA_I	stha	%r21, [%r8 + 0x0cb0] %asi
	.word 0xda720009  ! 588: STX_R	stx	%r13, [%r8 + %r9]
	.word 0xf20a0009  ! 588: LDUB_R	ldub	[%r8 + %r9], %r25
	.word 0x14800001  ! 588: BG	bg  	<label_0x1>
	.word 0xf1220009  ! 591: STF_R	st	%f24, [%r9, %r8]
	.word 0xc41a0009  ! 591: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xea921009  ! 591: LDUHA_R	lduha	[%r8, %r9] 0x80, %r21
	.word 0xce720009  ! 594: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xcc5a0009  ! 594: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0x8143c000  ! 594: STBAR	stbar
	.word 0xcf3a0009  ! 597: STDF_R	std	%f7, [%r9, %r8]
	.word 0xcc020009  ! 597: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xc36a21d0  ! 597: PREFETCH_I	prefetch	[%r8 + 0x01d0], #one_read
	.word 0xc9220009  ! 600: STF_R	st	%f4, [%r9, %r8]
	.word 0xc60a0009  ! 600: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xafa209a9  ! 600: FDIVs	fdivs	%f8, %f9, %f23
	.word 0xf0320009  ! 603: STH_R	sth	%r24, [%r8 + %r9]
	.word 0xc4120009  ! 603: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xa4f22d60  ! 603: UDIVcc_I	udivcc 	%r8, 0x0d60, %r18
	.word 0xcc220009  ! 606: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc3020009  ! 606: LDF_R	ld	[%r8, %r9], %f1
	.word 0x8143c000  ! 606: STBAR	stbar
	.word 0xca720009  ! 609: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xca0a0009  ! 609: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xc2420009  ! 609: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xcc720009  ! 612: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xcc420009  ! 612: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0x10800001  ! 612: BA	ba  	<label_0x1>
	.word 0xee2a0009  ! 615: STB_R	stb	%r23, [%r8 + %r9]
	.word 0xe01a0009  ! 615: LDD_R	ldd	[%r8 + %r9], %r16
	.word 0xc70221d4  ! 615: LDF_I	ld	[%r8, 0x01d4], %f3
	.word 0xf62a0009  ! 618: STB_R	stb	%r27, [%r8 + %r9]
	.word 0xfa120009  ! 618: LDUH_R	lduh	[%r8 + %r9], %r29
	.word 0xec8a2114  ! 618: LDUBA_I	lduba	[%r8, + 0x0114] %asi, %r22
	.word 0xca220009  ! 621: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xf0020009  ! 621: LDUW_R	lduw	[%r8 + %r9], %r24
	.word 0x826a29e8  ! 621: UDIVX_I	udivx 	%r8, 0x09e8, %r1
	.word 0xca220009  ! 624: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc2020009  ! 624: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0x8ed22f8c  ! 624: UMULcc_I	umulcc 	%r8, 0x0f8c, %r7
	.word 0xe4320009  ! 627: STH_R	sth	%r18, [%r8 + %r9]
	.word 0xc5020009  ! 627: LDF_R	ld	[%r8, %r9], %f2
	.word 0x8143e06e  ! 627: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #MemIssue | #Sync 
	.word 0xc5220009  ! 630: STF_R	st	%f2, [%r9, %r8]
	.word 0xc7020009  ! 630: LDF_R	ld	[%r8, %r9], %f3
	.word 0xc3e21009  ! 630: CASA_I	casa	[%r8] 0x80, %r9, %r1
	.word 0xc22a0009  ! 633: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xf6520009  ! 633: LDSH_R	ldsh	[%r8 + %r9], %r27
	.word 0xf0d227f0  ! 633: LDSHA_I	ldsha	[%r8, + 0x07f0] %asi, %r24
	.word 0xd73a0009  ! 636: STDF_R	std	%f11, [%r9, %r8]
	.word 0xc4420009  ! 636: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0x8143c000  ! 636: STBAR	stbar
	.word 0xe2220009  ! 639: STW_R	stw	%r17, [%r8 + %r9]
	.word 0xc4120009  ! 639: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0x3c800001  ! 639: BPOS	bpos,a	<label_0x1>
	.word 0xf0720009  ! 642: STX_R	stx	%r24, [%r8 + %r9]
	.word 0xcd020009  ! 642: LDF_R	ld	[%r8, %r9], %f6
	.word 0x8143c000  ! 642: STBAR	stbar
	.word 0xc6720009  ! 645: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xce0a0009  ! 645: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0x8143c000  ! 645: STBAR	stbar
	.word 0xce220009  ! 648: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xf2120009  ! 648: LDUH_R	lduh	[%r8 + %r9], %r25
	.word 0xc6ca1009  ! 648: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r3
	.word 0xde2a0009  ! 651: STB_R	stb	%r15, [%r8 + %r9]
	.word 0xf11a0009  ! 651: LDDF_R	ldd	[%r8, %r9], %f24
	.word 0x8143c000  ! 651: STBAR	stbar
	.word 0xee220009  ! 654: STW_R	stw	%r23, [%r8 + %r9]
	.word 0xca020009  ! 654: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0x8143c000  ! 654: STBAR	stbar
	.word 0xc2720009  ! 657: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc40a0009  ! 657: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0x8f2226c8  ! 657: MULScc_I	mulscc 	%r8, 0x06c8, %r7
	.word 0xc4220009  ! 660: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xcb1a0009  ! 660: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0x82d22188  ! 660: UMULcc_I	umulcc 	%r8, 0x0188, %r1
	.word 0xc8220009  ! 663: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xee5a0009  ! 663: LDX_R	ldx	[%r8 + %r9], %r23
	.word 0xecb2290c  ! 663: STHA_I	stha	%r22, [%r8 + 0x090c] %asi
	.word 0xce320009  ! 666: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xcc520009  ! 666: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0x24800001  ! 666: BLE	ble,a	<label_0x1>
	.word 0xf6220009  ! 669: STW_R	stw	%r27, [%r8 + %r9]
	.word 0xce4a0009  ! 669: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0x856a0009  ! 669: SDIVX_R	sdivx	%r8, %r9, %r2
	.word 0xe0220009  ! 672: STW_R	stw	%r16, [%r8 + %r9]
	.word 0xce020009  ! 672: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0x8143e010  ! 672: MEMBAR	membar	#Lookaside 
	.word 0xf4720009  ! 675: STX_R	stx	%r26, [%r8 + %r9]
	.word 0xc31a0009  ! 675: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0x8143c000  ! 675: STBAR	stbar
	.word 0xd62a0009  ! 678: STB_R	stb	%r11, [%r8 + %r9]
	.word 0xec4a0009  ! 678: LDSB_R	ldsb	[%r8 + %r9], %r22
	.word 0xc36a2d54  ! 678: PREFETCH_I	prefetch	[%r8 + 0x0d54], #one_read
	.word 0xfc320009  ! 681: STH_R	sth	%r30, [%r8 + %r9]
	.word 0xc80a0009  ! 681: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xc4ea1009  ! 681: LDSTUBA_R	ldstuba	%r2, [%r8 + %r9] 0x80
	.word 0xc8220009  ! 684: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xca0a0009  ! 684: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xc36a0009  ! 684: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xf9220009  ! 687: STF_R	st	%f28, [%r9, %r8]
	.word 0xcf020009  ! 687: LDF_R	ld	[%r8, %r9], %f7
	.word 0x8b6a0009  ! 687: SDIVX_R	sdivx	%r8, %r9, %r5
	.word 0xcb3a0009  ! 690: STDF_R	std	%f5, [%r9, %r8]
	.word 0xec1a0009  ! 690: LDD_R	ldd	[%r8 + %r9], %r22
	.word 0xc8a2231c  ! 690: STWA_I	stwa	%r4, [%r8 + 0x031c] %asi
	.word 0xde320009  ! 693: STH_R	sth	%r15, [%r8 + %r9]
	.word 0xc4420009  ! 693: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xe8420009  ! 693: LDSW_R	ldsw	[%r8 + %r9], %r20
	.word 0xe93a0009  ! 696: STDF_R	std	%f20, [%r9, %r8]
	.word 0xc41a0009  ! 696: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xc3ea1009  ! 696: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xe93a0009  ! 699: STDF_R	std	%f20, [%r9, %r8]
	.word 0xf71a0009  ! 699: LDDF_R	ldd	[%r8, %r9], %f27
	.word 0xc3ea1009  ! 699: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xcf220009  ! 702: STF_R	st	%f7, [%r9, %r8]
	.word 0xcc020009  ! 702: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xc2020009  ! 702: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xd6720009  ! 705: STX_R	stx	%r11, [%r8 + %r9]
	.word 0xca4a0009  ! 705: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xcaaa1009  ! 705: STBA_R	stba	%r5, [%r8 + %r9] 0x80
	.word 0xf4720009  ! 708: STX_R	stx	%r26, [%r8 + %r9]
	.word 0xcb020009  ! 708: LDF_R	ld	[%r8, %r9], %f5
	.word 0x88d22470  ! 708: UMULcc_I	umulcc 	%r8, 0x0470, %r4
	.word 0xc2720009  ! 711: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xce420009  ! 711: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xc4ba2828  ! 711: STDA_I	stda	%r2, [%r8 + 0x0828] %asi
	.word 0xc4320009  ! 714: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc44a0009  ! 714: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0x40000002  ! 714: CALL	call	disp30_2
	.word 0xcb3a0009  ! 717: STDF_R	std	%f5, [%r9, %r8]
	.word 0xca0a0009  ! 717: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0x85a208a9  ! 717: FSUBs	fsubs	%f8, %f9, %f2
	.word 0xc73a0009  ! 720: STDF_R	std	%f3, [%r9, %r8]
	.word 0xdd020009  ! 720: LDF_R	ld	[%r8, %r9], %f14
	.word 0xc88a2364  ! 720: LDUBA_I	lduba	[%r8, + 0x0364] %asi, %r4
	.word 0xfc320009  ! 723: STH_R	sth	%r30, [%r8 + %r9]
	.word 0xc2120009  ! 723: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0x8cd224b0  ! 723: UMULcc_I	umulcc 	%r8, 0x04b0, %r6
	.word 0xc5220009  ! 726: STF_R	st	%f2, [%r9, %r8]
	.word 0xcd1a0009  ! 726: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0x8143e077  ! 726: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside | #MemIssue | #Sync 
	.word 0xc8720009  ! 729: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xcc1a0009  ! 729: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xc36a0009  ! 729: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xcb220009  ! 732: STF_R	st	%f5, [%r9, %r8]
	.word 0xcc520009  ! 732: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0x825a0009  ! 732: SMUL_R	smul 	%r8, %r9, %r1
	.word 0xc6320009  ! 735: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xf71a0009  ! 735: LDDF_R	ldd	[%r8, %r9], %f27
	.word 0xce4a25dc  ! 735: LDSB_I	ldsb	[%r8 + 0x05dc], %r7
	.word 0xf02a0009  ! 738: STB_R	stb	%r24, [%r8 + %r9]
	.word 0xc64a0009  ! 738: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0x87a208a9  ! 738: FSUBs	fsubs	%f8, %f9, %f3
	.word 0xde220009  ! 741: STW_R	stw	%r15, [%r8 + %r9]
	.word 0xc41a0009  ! 741: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xe6f22f08  ! 741: STXA_I	stxa	%r19, [%r8 + 0x0f08] %asi
	.word 0xc4320009  ! 744: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc8020009  ! 744: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xc80a0009  ! 744: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xce320009  ! 747: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xcc520009  ! 747: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xfb222db0  ! 747: STF_I	st	%f29, [0x0db0, %r8]
	.word 0xf3220009  ! 750: STF_R	st	%f25, [%r9, %r8]
	.word 0xec520009  ! 750: LDSH_R	ldsh	[%r8 + %r9], %r22
	.word 0xf89a2478  ! 750: LDDA_I	ldda	[%r8, + 0x0478] %asi, %r28
	.word 0xd6220009  ! 753: STW_R	stw	%r11, [%r8 + %r9]
	.word 0xe01a0009  ! 753: LDD_R	ldd	[%r8 + %r9], %r16
	.word 0xceb21009  ! 753: STHA_R	stha	%r7, [%r8 + %r9] 0x80
	.word 0xcf3a0009  ! 756: STDF_R	std	%f7, [%r9, %r8]
	.word 0xca520009  ! 756: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xc3ea1009  ! 756: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xfb3a0009  ! 759: STDF_R	std	%f29, [%r9, %r8]
	.word 0xcc120009  ! 759: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0x83222630  ! 759: MULScc_I	mulscc 	%r8, 0x0630, %r1
	.word 0xc3220009  ! 762: STF_R	st	%f1, [%r9, %r8]
	.word 0xc64a0009  ! 762: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0x89222380  ! 762: MULScc_I	mulscc 	%r8, 0x0380, %r4
	.word 0xce720009  ! 765: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc5020009  ! 765: LDF_R	ld	[%r8, %r9], %f2
	.word 0x8143e01b  ! 765: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Lookaside 
	.word 0xca720009  ! 768: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xfa5a0009  ! 768: LDX_R	ldx	[%r8 + %r9], %r29
	.word 0xc5220009  ! 768: STF_R	st	%f2, [%r9, %r8]
	.word 0xf8720009  ! 771: STX_R	stx	%r28, [%r8 + %r9]
	.word 0xcc420009  ! 771: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xccaa1009  ! 771: STBA_R	stba	%r6, [%r8 + %r9] 0x80
	.word 0xc8220009  ! 774: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xea420009  ! 774: LDSW_R	ldsw	[%r8 + %r9], %r21
	.word 0x8cd22f00  ! 774: UMULcc_I	umulcc 	%r8, 0x0f00, %r6
	.word 0xe82a0009  ! 777: STB_R	stb	%r20, [%r8 + %r9]
	.word 0xe6120009  ! 777: LDUH_R	lduh	[%r8 + %r9], %r19
	.word 0x8fa209a9  ! 777: FDIVs	fdivs	%f8, %f9, %f7
	.word 0xca220009  ! 780: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xcb020009  ! 780: LDF_R	ld	[%r8, %r9], %f5
	.word 0x8eda0009  ! 780: SMULcc_R	smulcc 	%r8, %r9, %r7
	.word 0xda220009  ! 783: STW_R	stw	%r13, [%r8 + %r9]
	.word 0xcc420009  ! 783: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xc522217c  ! 783: STF_I	st	%f2, [0x017c, %r8]
	.word 0xc93a0009  ! 786: STDF_R	std	%f4, [%r9, %r8]
	.word 0xc85a0009  ! 786: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xac6a28b0  ! 786: UDIVX_I	udivx 	%r8, 0x08b0, %r22
	.word 0xc7220009  ! 789: STF_R	st	%f3, [%r9, %r8]
	.word 0xc44a0009  ! 789: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0x8143c000  ! 789: STBAR	stbar
	.word 0xce720009  ! 792: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xce5a0009  ! 792: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0x8ed20009  ! 792: UMULcc_R	umulcc 	%r8, %r9, %r7
	.word 0xc82a0009  ! 795: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xfa0a0009  ! 795: LDUB_R	ldub	[%r8 + %r9], %r29
	.word 0x8143e02d  ! 795: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #MemIssue 
	.word 0xc73a0009  ! 798: STDF_R	std	%f3, [%r9, %r8]
	.word 0xfd1a0009  ! 798: LDDF_R	ldd	[%r8, %r9], %f30
	.word 0xc36a2fdc  ! 798: PREFETCH_I	prefetch	[%r8 + 0x0fdc], #one_read
	.word 0xc2320009  ! 801: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xcc520009  ! 801: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xa06a2128  ! 801: UDIVX_I	udivx 	%r8, 0x0128, %r16
	.word 0xc6220009  ! 804: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xcc0a0009  ! 804: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0x8fa20829  ! 804: FADDs	fadds	%f8, %f9, %f7
	.word 0xe2220009  ! 807: STW_R	stw	%r17, [%r8 + %r9]
	.word 0xc31a0009  ! 807: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xcb3a0009  ! 807: STDF_R	std	%f5, [%r9, %r8]
	.word 0xea2a0009  ! 810: STB_R	stb	%r21, [%r8 + %r9]
	.word 0xc44a0009  ! 810: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xc36a0009  ! 810: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc6220009  ! 813: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xe41a0009  ! 813: LDD_R	ldd	[%r8 + %r9], %r18
	.word 0x887229c8  ! 813: UDIV_I	udiv 	%r8, 0x09c8, %r4
	.word 0xc82a0009  ! 816: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc85a0009  ! 816: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0x867a2790  ! 816: SDIV_I	sdiv 	%r8, 0x0790, %r3
	.word 0xec320009  ! 819: STH_R	sth	%r22, [%r8 + %r9]
	.word 0xc6020009  ! 819: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xc49a1009  ! 819: LDDA_R	ldda	[%r8, %r9] 0x80, %r2
	.word 0xe7220009  ! 822: STF_R	st	%f19, [%r9, %r8]
	.word 0xf2120009  ! 822: LDUH_R	lduh	[%r8 + %r9], %r25
	.word 0x8143e06f  ! 822: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #MemIssue | #Sync 
	.word 0xc62a0009  ! 825: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc9020009  ! 825: LDF_R	ld	[%r8, %r9], %f4
	.word 0xee8221e0  ! 825: LDUWA_I	lduwa	[%r8, + 0x01e0] %asi, %r23
	.word 0xe93a0009  ! 828: STDF_R	std	%f20, [%r9, %r8]
	.word 0xc2420009  ! 828: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xce8a2180  ! 828: LDUBA_I	lduba	[%r8, + 0x0180] %asi, %r7
	.word 0xce220009  ! 831: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xea020009  ! 831: LDUW_R	lduw	[%r8 + %r9], %r21
	.word 0xe06a284c  ! 831: LDSTUB_I	ldstub	%r16, [%r8 + 0x084c]
	.word 0xe2220009  ! 834: STW_R	stw	%r17, [%r8 + %r9]
	.word 0xea420009  ! 834: LDSW_R	ldsw	[%r8 + %r9], %r21
	.word 0x8efa2ce0  ! 834: SDIVcc_I	sdivcc 	%r8, 0x0ce0, %r7
	.word 0xd7220009  ! 837: STF_R	st	%f11, [%r9, %r8]
	.word 0xc8520009  ! 837: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xecba2ba0  ! 837: STDA_I	stda	%r22, [%r8 + 0x0ba0] %asi
	.word 0xe3220009  ! 840: STF_R	st	%f17, [%r9, %r8]
	.word 0xca420009  ! 840: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xce921009  ! 840: LDUHA_R	lduha	[%r8, %r9] 0x80, %r7
	.word 0xdc220009  ! 843: STW_R	stw	%r14, [%r8 + %r9]
	.word 0xc7020009  ! 843: LDF_R	ld	[%r8, %r9], %f3
	.word 0x2ac20001  ! 843: BRNZ	brnz,a,nt	%8,<label_0x20001>
	.word 0xcc320009  ! 846: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xde020009  ! 846: LDUW_R	lduw	[%r8 + %r9], %r15
	.word 0x86720009  ! 846: UDIV_R	udiv 	%r8, %r9, %r3
	.word 0xc8220009  ! 849: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc2420009  ! 849: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xbe7225d8  ! 849: UDIV_I	udiv 	%r8, 0x05d8, %r31
	.word 0xca220009  ! 852: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xcc520009  ! 852: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0x22800001  ! 852: BE	be,a	<label_0x1>
	.word 0xc4720009  ! 855: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc85a0009  ! 855: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xcafa1009  ! 855: SWAPA_R	swapa	%r5, [%r8 + %r9] 0x80
	.word 0xce320009  ! 858: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xdf020009  ! 858: LDF_R	ld	[%r8, %r9], %f15
	.word 0x85222690  ! 858: MULScc_I	mulscc 	%r8, 0x0690, %r2
	.word 0xd73a0009  ! 861: STDF_R	std	%f11, [%r9, %r8]
	.word 0xde420009  ! 861: LDSW_R	ldsw	[%r8 + %r9], %r15
	.word 0xc3ea1009  ! 861: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc9220009  ! 864: STF_R	st	%f4, [%r9, %r8]
	.word 0xcd1a0009  ! 864: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0x16800002  ! 864: BGE	bge  	<label_0x2>
	.word 0xc73a0009  ! 867: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc8020009  ! 867: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xc40a2e94  ! 867: LDUB_I	ldub	[%r8 + 0x0e94], %r2
	.word 0xc6220009  ! 870: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xf40a0009  ! 870: LDUB_R	ldub	[%r8 + %r9], %r26
	.word 0xe93a21c0  ! 870: STDF_I	std	%f20, [0x01c0, %r8]
	.word 0xd8320009  ! 873: STH_R	sth	%r12, [%r8 + %r9]
	.word 0xc6520009  ! 873: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xbeda2af0  ! 873: SMULcc_I	smulcc 	%r8, 0x0af0, %r31
	.word 0xc8320009  ! 876: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc5020009  ! 876: LDF_R	ld	[%r8, %r9], %f2
	.word 0xcab21009  ! 876: STHA_R	stha	%r5, [%r8 + %r9] 0x80
	.word 0xc73a0009  ! 879: STDF_R	std	%f3, [%r9, %r8]
	.word 0xd81a0009  ! 879: LDD_R	ldd	[%r8 + %r9], %r12
	.word 0xc36a0009  ! 879: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xcc720009  ! 882: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xda4a0009  ! 882: LDSB_R	ldsb	[%r8 + %r9], %r13
	.word 0x26c20001  ! 882: BRLZ	brlz,a,nt	%8,<label_0x20001>
	.word 0xc5220009  ! 885: STF_R	st	%f2, [%r9, %r8]
	.word 0xc85a0009  ! 885: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0x88d20009  ! 885: UMULcc_R	umulcc 	%r8, %r9, %r4
	.word 0xc53a0009  ! 888: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc24a0009  ! 888: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xc44229a0  ! 888: LDSW_I	ldsw	[%r8 + 0x09a0], %r2
	.word 0xe93a0009  ! 891: STDF_R	std	%f20, [%r9, %r8]
	.word 0xc2420009  ! 891: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0x826a25c4  ! 891: UDIVX_I	udivx 	%r8, 0x05c4, %r1
	.word 0xf1220009  ! 894: STF_R	st	%f24, [%r9, %r8]
	.word 0xe71a0009  ! 894: LDDF_R	ldd	[%r8, %r9], %f19
	.word 0x0ac20001  ! 894: BRNZ	brnz  ,nt	%8,<label_0x20001>
	.word 0xc73a0009  ! 897: STDF_R	std	%f3, [%r9, %r8]
	.word 0xee020009  ! 897: LDUW_R	lduw	[%r8 + %r9], %r23
	.word 0x8fa208a9  ! 897: FSUBs	fsubs	%f8, %f9, %f7
	.word 0xcc220009  ! 900: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc80a0009  ! 900: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0x83a209a9  ! 900: FDIVs	fdivs	%f8, %f9, %f1
	.word 0xc2220009  ! 903: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xec520009  ! 903: LDSH_R	ldsh	[%r8 + %r9], %r22
	.word 0x02800002  ! 903: BE	be  	<label_0x2>
	.word 0xf4320009  ! 906: STH_R	sth	%r26, [%r8 + %r9]
	.word 0xc8520009  ! 906: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xceca2864  ! 906: LDSBA_I	ldsba	[%r8, + 0x0864] %asi, %r7
	.word 0xeb220009  ! 909: STF_R	st	%f21, [%r9, %r8]
	.word 0xc2120009  ! 909: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0x9da20829  ! 909: FADDs	fadds	%f8, %f9, %f14
	.word 0xc2720009  ! 912: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xcf1a0009  ! 912: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xe71a28b0  ! 912: LDDF_I	ldd	[%r8, 0x08b0], %f19
	.word 0xc3220009  ! 915: STF_R	st	%f1, [%r9, %r8]
	.word 0xc31a0009  ! 915: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0x8e520009  ! 915: UMUL_R	umul 	%r8, %r9, %r7
	.word 0xcf220009  ! 918: STF_R	st	%f7, [%r9, %r8]
	.word 0xf9020009  ! 918: LDF_R	ld	[%r8, %r9], %f28
	.word 0x85a20829  ! 918: FADDs	fadds	%f8, %f9, %f2
	.word 0xc4220009  ! 921: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xca520009  ! 921: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xde0a0009  ! 921: LDUB_R	ldub	[%r8 + %r9], %r15
	.word 0xf9220009  ! 924: STF_R	st	%f28, [%r9, %r8]
	.word 0xc5020009  ! 924: LDF_R	ld	[%r8, %r9], %f2
	.word 0xcc9a2150  ! 924: LDDA_I	ldda	[%r8, + 0x0150] %asi, %r6
	.word 0xcc320009  ! 927: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xe0420009  ! 927: LDSW_R	ldsw	[%r8 + %r9], %r16
	.word 0xc402264c  ! 927: LDUW_I	lduw	[%r8 + 0x064c], %r2
	.word 0xcc320009  ! 930: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xcd020009  ! 930: LDF_R	ld	[%r8, %r9], %f6
	.word 0xc3ea1009  ! 930: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc6220009  ! 933: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xd9020009  ! 933: LDF_R	ld	[%r8, %r9], %f12
	.word 0x8143c000  ! 933: STBAR	stbar
	.word 0xc6320009  ! 936: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xf60a0009  ! 936: LDUB_R	ldub	[%r8 + %r9], %r27
	.word 0xd6d21009  ! 936: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r11
	.word 0xc42a0009  ! 939: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xe6520009  ! 939: LDSH_R	ldsh	[%r8 + %r9], %r19
	.word 0x97a209a9  ! 939: FDIVs	fdivs	%f8, %f9, %f11
	.word 0xce320009  ! 942: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc6020009  ! 942: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0x04800001  ! 942: BLE	ble  	<label_0x1>
	.word 0xe2720009  ! 945: STX_R	stx	%r17, [%r8 + %r9]
	.word 0xc44a0009  ! 945: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0x00800001  ! 945: BN	bn  	<label_0x1>
	.word 0xc42a0009  ! 948: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xcc520009  ! 948: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xc36a0009  ! 948: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xcc220009  ! 951: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc7020009  ! 951: LDF_R	ld	[%r8, %r9], %f3
	.word 0xc8ea1009  ! 951: LDSTUBA_R	ldstuba	%r4, [%r8 + %r9] 0x80
	.word 0xc2320009  ! 954: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xca120009  ! 954: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0x872225ec  ! 954: MULScc_I	mulscc 	%r8, 0x05ec, %r3
	.word 0xc5220009  ! 957: STF_R	st	%f2, [%r9, %r8]
	.word 0xfe4a0009  ! 957: LDSB_R	ldsb	[%r8 + %r9], %r31
	.word 0x86fa0009  ! 957: SDIVcc_R	sdivcc 	%r8, %r9, %r3
	.word 0xf42a0009  ! 960: STB_R	stb	%r26, [%r8 + %r9]
	.word 0xd81a0009  ! 960: LDD_R	ldd	[%r8 + %r9], %r12
	.word 0xcc821009  ! 960: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r6
	.word 0xc2720009  ! 963: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xce0a0009  ! 963: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0x8a4a0009  ! 963: MULX_R	mulx 	%r8, %r9, %r5
	.word 0xcd220009  ! 966: STF_R	st	%f6, [%r9, %r8]
	.word 0xc6120009  ! 966: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xe6f21009  ! 966: STXA_R	stxa	%r19, [%r8 + %r9] 0x80
	.word 0xc8220009  ! 969: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xcc4a0009  ! 969: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xb27a2bb0  ! 969: SDIV_I	sdiv 	%r8, 0x0bb0, %r25
	.word 0xc5220009  ! 972: STF_R	st	%f2, [%r9, %r8]
	.word 0xf20a0009  ! 972: LDUB_R	ldub	[%r8 + %r9], %r25
	.word 0x8fa20829  ! 972: FADDs	fadds	%f8, %f9, %f7
	.word 0xdc320009  ! 975: STH_R	sth	%r14, [%r8 + %r9]
	.word 0xc60a0009  ! 975: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0x996a27ac  ! 975: SDIVX_I	sdivx	%r8, 0x07ac, %r12
	.word 0xca2a0009  ! 978: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc3020009  ! 978: LDF_R	ld	[%r8, %r9], %f1
	.word 0x82da2168  ! 978: SMULcc_I	smulcc 	%r8, 0x0168, %r1
	.word 0xca720009  ! 981: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc4020009  ! 981: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xc09a1009  ! 981: LDDA_R	ldda	[%r8, %r9] 0x80, %r0
	.word 0xd8320009  ! 984: STH_R	sth	%r12, [%r8 + %r9]
	.word 0xc6120009  ! 984: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xc80a2cd0  ! 984: LDUB_I	ldub	[%r8 + 0x0cd0], %r4
	.word 0xce320009  ! 987: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc41a0009  ! 987: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xc33a0009  ! 987: STDF_R	std	%f1, [%r9, %r8]
	.word 0xcd220009  ! 990: STF_R	st	%f6, [%r9, %r8]
	.word 0xe80a0009  ! 990: LDUB_R	ldub	[%r8 + %r9], %r20
	.word 0xb0722658  ! 990: UDIV_I	udiv 	%r8, 0x0658, %r24
	.word 0xc53a0009  ! 993: STDF_R	std	%f2, [%r9, %r8]
	.word 0xe20a0009  ! 993: LDUB_R	ldub	[%r8 + %r9], %r17
	.word 0xf2fa2ed0  ! 993: SWAPA_I	swapa	%r25, [%r8 + 0x0ed0] %asi
	.word 0xca220009  ! 996: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xca120009  ! 996: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0x8ada0009  ! 996: SMULcc_R	smulcc 	%r8, %r9, %r5
	.word 0xfa220009  ! 999: STW_R	stw	%r29, [%r8 + %r9]
	.word 0xc2420009  ! 999: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0x2e800001  ! 999: BVS	bvs,a	<label_0x1>
	.word 0xc9220009  ! 1002: STF_R	st	%f4, [%r9, %r8]
	.word 0xf45a0009  ! 1002: LDX_R	ldx	[%r8 + %r9], %r26
	.word 0xc36a2564  ! 1002: PREFETCH_I	prefetch	[%r8 + 0x0564], #one_read
	.word 0xea220009  ! 1005: STW_R	stw	%r21, [%r8 + %r9]
	.word 0xca120009  ! 1005: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xce821009  ! 1005: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r7
	.word 0xc6720009  ! 1008: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xec020009  ! 1008: LDUW_R	lduw	[%r8 + %r9], %r22
	.word 0x8143c000  ! 1008: STBAR	stbar
	.word 0xec2a0009  ! 1011: STB_R	stb	%r22, [%r8 + %r9]
	.word 0xc65a0009  ! 1011: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xc3ea2134  ! 1011: PREFETCHA_I	prefetcha	[%r8, + 0x0134] %asi, #one_read
	.word 0xde320009  ! 1014: STH_R	sth	%r15, [%r8 + %r9]
	.word 0xcf1a0009  ! 1014: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0x8143e033  ! 1014: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside | #MemIssue 
	.word 0xc8320009  ! 1017: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xf2120009  ! 1017: LDUH_R	lduh	[%r8 + %r9], %r25
	.word 0x887a2a40  ! 1017: SDIV_I	sdiv 	%r8, 0x0a40, %r4
	.word 0xca2a0009  ! 1020: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc2020009  ! 1020: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0x84522f4c  ! 1020: UMUL_I	umul 	%r8, 0x0f4c, %r2
	.word 0xcd220009  ! 1023: STF_R	st	%f6, [%r9, %r8]
	.word 0xc2020009  ! 1023: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xc3ea1009  ! 1023: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xd6320009  ! 1026: STH_R	sth	%r11, [%r8 + %r9]
	.word 0xc4120009  ! 1026: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0x9fa20929  ! 1026: FMULs	fmuls	%f8, %f9, %f15
	.word 0xc33a0009  ! 1029: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc60a0009  ! 1029: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0x82d20009  ! 1029: UMULcc_R	umulcc 	%r8, %r9, %r1
	.word 0xc8320009  ! 1032: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xd64a0009  ! 1032: LDSB_R	ldsb	[%r8 + %r9], %r11
	.word 0x8ba20829  ! 1032: FADDs	fadds	%f8, %f9, %f5
	.word 0xfa320009  ! 1035: STH_R	sth	%r29, [%r8 + %r9]
	.word 0xcc1a0009  ! 1035: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0x8143e06a  ! 1035: MEMBAR	membar	#StoreLoad | #StoreStore | #MemIssue | #Sync 
	.word 0xc8720009  ! 1038: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc6020009  ! 1038: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xe2ea1009  ! 1038: LDSTUBA_R	ldstuba	%r17, [%r8 + %r9] 0x80
	.word 0xce220009  ! 1041: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc45a0009  ! 1041: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0x08800002  ! 1041: BLEU	bleu  	<label_0x2>
	.word 0xc73a0009  ! 1044: STDF_R	std	%f3, [%r9, %r8]
	.word 0xe20a0009  ! 1044: LDUB_R	ldub	[%r8 + %r9], %r17
	.word 0xda020009  ! 1044: LDUW_R	lduw	[%r8 + %r9], %r13
	.word 0xc6320009  ! 1047: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xd6520009  ! 1047: LDSH_R	ldsh	[%r8 + %r9], %r11
	.word 0xc36a2660  ! 1047: PREFETCH_I	prefetch	[%r8 + 0x0660], #one_read
	.word 0xde2a0009  ! 1050: STB_R	stb	%r15, [%r8 + %r9]
	.word 0xc60a0009  ! 1050: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0x40000001  ! 1050: CALL	call	disp30_1
	.word 0xf6720009  ! 1053: STX_R	stx	%r27, [%r8 + %r9]
	.word 0xec120009  ! 1053: LDUH_R	lduh	[%r8 + %r9], %r22
	.word 0xc2aa2a5c  ! 1053: STBA_I	stba	%r1, [%r8 + 0x0a5c] %asi
	.word 0xc8320009  ! 1056: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xca0a0009  ! 1056: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0x8e4a0009  ! 1056: MULX_R	mulx 	%r8, %r9, %r7
	.word 0xce720009  ! 1059: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xcc5a0009  ! 1059: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0x28800002  ! 1059: BLEU	bleu,a	<label_0x2>
	.word 0xc33a0009  ! 1062: STDF_R	std	%f1, [%r9, %r8]
	.word 0xca0a0009  ! 1062: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xbd220009  ! 1062: MULScc_R	mulscc 	%r8, %r9, %r30
	.word 0xee720009  ! 1065: STX_R	stx	%r23, [%r8 + %r9]
	.word 0xda120009  ! 1065: LDUH_R	lduh	[%r8 + %r9], %r13
	.word 0x34800001  ! 1065: BG	bg,a	<label_0x1>
	.word 0xe42a0009  ! 1068: STB_R	stb	%r18, [%r8 + %r9]
	.word 0xc2420009  ! 1068: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xc3ea2e40  ! 1068: PREFETCHA_I	prefetcha	[%r8, + 0x0e40] %asi, #one_read
	.word 0xcf220009  ! 1071: STF_R	st	%f7, [%r9, %r8]
	.word 0xcc1a0009  ! 1071: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0x8da20829  ! 1071: FADDs	fadds	%f8, %f9, %f6
	.word 0xe22a0009  ! 1074: STB_R	stb	%r17, [%r8 + %r9]
	.word 0xc2120009  ! 1074: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xa27a0009  ! 1074: SDIV_R	sdiv 	%r8, %r9, %r17
	.word 0xdc720009  ! 1077: STX_R	stx	%r14, [%r8 + %r9]
	.word 0xcc520009  ! 1077: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xc36a2948  ! 1077: PREFETCH_I	prefetch	[%r8 + 0x0948], #one_read
	.word 0xcb220009  ! 1080: STF_R	st	%f5, [%r9, %r8]
	.word 0xde4a0009  ! 1080: LDSB_R	ldsb	[%r8 + %r9], %r15
	.word 0xc6aa2f0c  ! 1080: STBA_I	stba	%r3, [%r8 + 0x0f0c] %asi
	.word 0xc82a0009  ! 1083: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc6520009  ! 1083: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xc2f22100  ! 1083: STXA_I	stxa	%r1, [%r8 + 0x0100] %asi
	.word 0xf53a0009  ! 1086: STDF_R	std	%f26, [%r9, %r8]
	.word 0xf31a0009  ! 1086: LDDF_R	ldd	[%r8, %r9], %f25
	.word 0x8143e001  ! 1086: MEMBAR	membar	#LoadLoad 
	.word 0xca320009  ! 1089: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc7020009  ! 1089: LDF_R	ld	[%r8, %r9], %f3
	.word 0xccf221d8  ! 1089: STXA_I	stxa	%r6, [%r8 + 0x01d8] %asi
	.word 0xe9220009  ! 1092: STF_R	st	%f20, [%r9, %r8]
	.word 0xc91a0009  ! 1092: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xda922ec4  ! 1092: LDUHA_I	lduha	[%r8, + 0x0ec4] %asi, %r13
	.word 0xda320009  ! 1095: STH_R	sth	%r13, [%r8 + %r9]
	.word 0xf04a0009  ! 1095: LDSB_R	ldsb	[%r8 + %r9], %r24
	.word 0x8c7a2404  ! 1095: SDIV_I	sdiv 	%r8, 0x0404, %r6
	.word 0xcb3a0009  ! 1098: STDF_R	std	%f5, [%r9, %r8]
	.word 0xc25a0009  ! 1098: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0x24ca0001  ! 1098: BRLEZ	brlez,a,pt	%8,<label_0xa0001>
	.word 0xc33a0009  ! 1101: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc9020009  ! 1101: LDF_R	ld	[%r8, %r9], %f4
	.word 0xc3ea24e0  ! 1101: PREFETCHA_I	prefetcha	[%r8, + 0x04e0] %asi, #one_read
	.word 0xea320009  ! 1104: STH_R	sth	%r21, [%r8 + %r9]
	.word 0xe8020009  ! 1104: LDUW_R	lduw	[%r8 + %r9], %r20
	.word 0x8a7a22d0  ! 1104: SDIV_I	sdiv 	%r8, 0x02d0, %r5
	.word 0xc8220009  ! 1107: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xca520009  ! 1107: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xc36a0009  ! 1107: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xce2a0009  ! 1110: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xf0420009  ! 1110: LDSW_R	ldsw	[%r8 + %r9], %r24
	.word 0xce921009  ! 1110: LDUHA_R	lduha	[%r8, %r9] 0x80, %r7
	.word 0xec2a0009  ! 1113: STB_R	stb	%r22, [%r8 + %r9]
	.word 0xcd020009  ! 1113: LDF_R	ld	[%r8, %r9], %f6
	.word 0xc3ea27bc  ! 1113: PREFETCHA_I	prefetcha	[%r8, + 0x07bc] %asi, #one_read
	.word 0xcd220009  ! 1116: STF_R	st	%f6, [%r9, %r8]
	.word 0xc6420009  ! 1116: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xfcaa1009  ! 1116: STBA_R	stba	%r30, [%r8 + %r9] 0x80
	.word 0xda2a0009  ! 1119: STB_R	stb	%r13, [%r8 + %r9]
	.word 0xe64a0009  ! 1119: LDSB_R	ldsb	[%r8 + %r9], %r19
	.word 0xca7a0009  ! 1119: SWAP_R	swap	%r5, [%r8 + %r9]
	.word 0xc6320009  ! 1122: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc3020009  ! 1122: LDF_R	ld	[%r8, %r9], %f1
	.word 0x2cca0001  ! 1122: BRGZ	brgz,a,pt	%8,<label_0xa0001>
	.word 0xce220009  ! 1125: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc25a0009  ! 1125: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xd7e22009  ! 1125: CASA_R	casa	[%r8] %asi, %r9, %r11
	.word 0xc8720009  ! 1128: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xe24a0009  ! 1128: LDSB_R	ldsb	[%r8 + %r9], %r17
	.word 0xea822a04  ! 1128: LDUWA_I	lduwa	[%r8, + 0x0a04] %asi, %r21
	.word 0xe42a0009  ! 1131: STB_R	stb	%r18, [%r8 + %r9]
	.word 0xcc4a0009  ! 1131: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xdc6a0009  ! 1131: LDSTUB_R	ldstub	%r14, [%r8 + %r9]
	.word 0xc8320009  ! 1134: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xca520009  ! 1134: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xaaf22de8  ! 1134: UDIVcc_I	udivcc 	%r8, 0x0de8, %r21
	.word 0xe6320009  ! 1137: STH_R	sth	%r19, [%r8 + %r9]
	.word 0xc85a0009  ! 1137: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xe4ea2ddc  ! 1137: LDSTUBA_I	ldstuba	%r18, [%r8 + 0x0ddc] %asi
	.word 0xc6220009  ! 1140: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xcc4a0009  ! 1140: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0x26800002  ! 1140: BL	bl,a	<label_0x2>
	.word 0xf5220009  ! 1143: STF_R	st	%f26, [%r9, %r8]
	.word 0xcc0a0009  ! 1143: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0x8da20829  ! 1143: FADDs	fadds	%f8, %f9, %f6
	.word 0xd8220009  ! 1146: STW_R	stw	%r12, [%r8 + %r9]
	.word 0xc41a0009  ! 1146: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xc84a0009  ! 1146: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xf2320009  ! 1149: STH_R	sth	%r25, [%r8 + %r9]
	.word 0xcc1a0009  ! 1149: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xbb222614  ! 1149: MULScc_I	mulscc 	%r8, 0x0614, %r29
	.word 0xc2720009  ! 1152: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc2420009  ! 1152: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0x06800001  ! 1152: BL	bl  	<label_0x1>
	.word 0xfb3a0009  ! 1155: STDF_R	std	%f29, [%r9, %r8]
	.word 0xc4420009  ! 1155: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xceca2b10  ! 1155: LDSBA_I	ldsba	[%r8, + 0x0b10] %asi, %r7
	.word 0xc82a0009  ! 1158: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xca420009  ! 1158: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xccf21009  ! 1158: STXA_R	stxa	%r6, [%r8 + %r9] 0x80
	.word 0xd9220009  ! 1161: STF_R	st	%f12, [%r9, %r8]
	.word 0xcf1a0009  ! 1161: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0x84fa2ef4  ! 1161: SDIVcc_I	sdivcc 	%r8, 0x0ef4, %r2
	.word 0xc82a0009  ! 1164: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xca020009  ! 1164: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0x8143e058  ! 1164: MEMBAR	membar	#StoreStore | #Lookaside | #Sync 
	.word 0xce2a0009  ! 1167: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xca5a0009  ! 1167: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xf8b22fb0  ! 1167: STHA_I	stha	%r28, [%r8 + 0x0fb0] %asi
	.word 0xce720009  ! 1170: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xce020009  ! 1170: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0x22800001  ! 1170: BE	be,a	<label_0x1>
	.word 0xc93a0009  ! 1173: STDF_R	std	%f4, [%r9, %r8]
	.word 0xc01a0009  ! 1173: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0xc4f21009  ! 1173: STXA_R	stxa	%r2, [%r8 + %r9] 0x80
	.word 0xc62a0009  ! 1176: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc4020009  ! 1176: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0x96fa23f8  ! 1176: SDIVcc_I	sdivcc 	%r8, 0x03f8, %r11
	.word 0xcf220009  ! 1179: STF_R	st	%f7, [%r9, %r8]
	.word 0xcc420009  ! 1179: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0x867a0009  ! 1179: SDIV_R	sdiv 	%r8, %r9, %r3
	.word 0xc8720009  ! 1182: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xd85a0009  ! 1182: LDX_R	ldx	[%r8 + %r9], %r12
	.word 0xd89a1009  ! 1182: LDDA_R	ldda	[%r8, %r9] 0x80, %r12
	.word 0xc2720009  ! 1185: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xf81a0009  ! 1185: LDD_R	ldd	[%r8 + %r9], %r28
	.word 0x8143e07c  ! 1185: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xc2220009  ! 1188: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc2020009  ! 1188: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xccba2ce8  ! 1188: STDA_I	stda	%r6, [%r8 + 0x0ce8] %asi
	.word 0xc5220009  ! 1191: STF_R	st	%f2, [%r9, %r8]
	.word 0xcc5a0009  ! 1191: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0x8143c000  ! 1191: STBAR	stbar
	.word 0xc7220009  ! 1194: STF_R	st	%f3, [%r9, %r8]
	.word 0xdc120009  ! 1194: LDUH_R	lduh	[%r8 + %r9], %r14
	.word 0x8c5a217c  ! 1194: SMUL_I	smul 	%r8, 0x017c, %r6
	.word 0xcc2a0009  ! 1197: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc6420009  ! 1197: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0x26800002  ! 1197: BL	bl,a	<label_0x2>
	.word 0xc62a0009  ! 1200: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xca4a0009  ! 1200: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0x8143c000  ! 1200: STBAR	stbar
	.word 0xec320009  ! 1203: STH_R	sth	%r22, [%r8 + %r9]
	.word 0xca520009  ! 1203: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0x884a2e74  ! 1203: MULX_I	mulx 	%r8, 0x0e74, %r4
	.word 0xc6220009  ! 1206: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xce020009  ! 1206: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xc3ea1009  ! 1206: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xca2a0009  ! 1209: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xd8520009  ! 1209: LDSH_R	ldsh	[%r8 + %r9], %r12
	.word 0x826a20e0  ! 1209: UDIVX_I	udivx 	%r8, 0x00e0, %r1
	.word 0xc5220009  ! 1212: STF_R	st	%f2, [%r9, %r8]
	.word 0xc71a0009  ! 1212: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0x84722f78  ! 1212: UDIV_I	udiv 	%r8, 0x0f78, %r2
	.word 0xde2a0009  ! 1215: STB_R	stb	%r15, [%r8 + %r9]
	.word 0xc60a0009  ! 1215: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xa45a29ec  ! 1215: SMUL_I	smul 	%r8, 0x09ec, %r18
	.word 0xca720009  ! 1218: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc44a0009  ! 1218: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xc2d22538  ! 1218: LDSHA_I	ldsha	[%r8, + 0x0538] %asi, %r1
	.word 0xc22a0009  ! 1221: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xce120009  ! 1221: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xc3ea1009  ! 1221: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xee2a0009  ! 1224: STB_R	stb	%r23, [%r8 + %r9]
	.word 0xc8020009  ! 1224: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xc8ea2acc  ! 1224: LDSTUBA_I	ldstuba	%r4, [%r8 + 0x0acc] %asi
	.word 0xc3220009  ! 1227: STF_R	st	%f1, [%r9, %r8]
	.word 0xc5020009  ! 1227: LDF_R	ld	[%r8, %r9], %f2
	.word 0xf46a2b84  ! 1227: LDSTUB_I	ldstub	%r26, [%r8 + 0x0b84]
	.word 0xef3a0009  ! 1230: STDF_R	std	%f23, [%r9, %r8]
	.word 0xc20a0009  ! 1230: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xc3ea221c  ! 1230: PREFETCHA_I	prefetcha	[%r8, + 0x021c] %asi, #one_read
	.word 0xf6720009  ! 1233: STX_R	stx	%r27, [%r8 + %r9]
	.word 0xd80a0009  ! 1233: LDUB_R	ldub	[%r8 + %r9], %r12
	.word 0x12800002  ! 1233: BNE	bne  	<label_0x2>
	.word 0xc6220009  ! 1236: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xee0a0009  ! 1236: LDUB_R	ldub	[%r8 + %r9], %r23
	.word 0x8143e003  ! 1236: MEMBAR	membar	#LoadLoad | #StoreLoad 
	.word 0xc4320009  ! 1239: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xcb1a0009  ! 1239: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xf28a20fc  ! 1239: LDUBA_I	lduba	[%r8, + 0x00fc] %asi, %r25
	.word 0xcc720009  ! 1242: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc8020009  ! 1242: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xc3ea1009  ! 1242: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xda320009  ! 1245: STH_R	sth	%r13, [%r8 + %r9]
	.word 0xee520009  ! 1245: LDSH_R	ldsh	[%r8 + %r9], %r23
	.word 0xc4c22bac  ! 1245: LDSWA_I	ldswa	[%r8, + 0x0bac] %asi, %r2
	.word 0xc6720009  ! 1248: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc6520009  ! 1248: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xc8d21009  ! 1248: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r4
	.word 0xce320009  ! 1251: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc2520009  ! 1251: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xbe5a23b0  ! 1251: SMUL_I	smul 	%r8, 0x03b0, %r31
	.word 0xc2220009  ! 1254: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc5020009  ! 1254: LDF_R	ld	[%r8, %r9], %f2
	.word 0xf6ea28c4  ! 1254: LDSTUBA_I	ldstuba	%r27, [%r8 + 0x08c4] %asi
	.word 0xc33a0009  ! 1257: STDF_R	std	%f1, [%r9, %r8]
	.word 0xce020009  ! 1257: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xca5226f0  ! 1257: LDSH_I	ldsh	[%r8 + 0x06f0], %r5
	.word 0xde2a0009  ! 1260: STB_R	stb	%r15, [%r8 + %r9]
	.word 0xee120009  ! 1260: LDUH_R	lduh	[%r8 + %r9], %r23
	.word 0xcf3a0009  ! 1260: STDF_R	std	%f7, [%r9, %r8]
	.word 0xf1220009  ! 1263: STF_R	st	%f24, [%r9, %r8]
	.word 0xc9020009  ! 1263: LDF_R	ld	[%r8, %r9], %f4
	.word 0xccea2558  ! 1263: LDSTUBA_I	ldstuba	%r6, [%r8 + 0x0558] %asi
	.word 0xc82a0009  ! 1266: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc8120009  ! 1266: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0x8f222328  ! 1266: MULScc_I	mulscc 	%r8, 0x0328, %r7
	.word 0xc6720009  ! 1269: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xf0120009  ! 1269: LDUH_R	lduh	[%r8 + %r9], %r24
	.word 0xa3a208a9  ! 1269: FSUBs	fsubs	%f8, %f9, %f17
	.word 0xd8320009  ! 1272: STH_R	sth	%r12, [%r8 + %r9]
	.word 0xc84a0009  ! 1272: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0x9c520009  ! 1272: UMUL_R	umul 	%r8, %r9, %r14
	.word 0xcc2a0009  ! 1275: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc8120009  ! 1275: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0x86fa0009  ! 1275: SDIVcc_R	sdivcc 	%r8, %r9, %r3
	.word 0xc53a0009  ! 1278: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc44a0009  ! 1278: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0x28800001  ! 1278: BLEU	bleu,a	<label_0x1>
	.word 0xe33a0009  ! 1281: STDF_R	std	%f17, [%r9, %r8]
	.word 0xc24a0009  ! 1281: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xf0d21009  ! 1281: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r24
	.word 0xf8720009  ! 1284: STX_R	stx	%r28, [%r8 + %r9]
	.word 0xf5020009  ! 1284: LDF_R	ld	[%r8, %r9], %f26
	.word 0x88d20009  ! 1284: UMULcc_R	umulcc 	%r8, %r9, %r4
	.word 0xf6220009  ! 1287: STW_R	stw	%r27, [%r8 + %r9]
	.word 0xf4020009  ! 1287: LDUW_R	lduw	[%r8 + %r9], %r26
	.word 0x864a0009  ! 1287: MULX_R	mulx 	%r8, %r9, %r3
	.word 0xc8320009  ! 1290: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xfd1a0009  ! 1290: LDDF_R	ldd	[%r8, %r9], %f30
	.word 0xcb020009  ! 1290: LDF_R	ld	[%r8, %r9], %f5
	.word 0xcd220009  ! 1293: STF_R	st	%f6, [%r9, %r8]
	.word 0xca420009  ! 1293: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xb3a209a9  ! 1293: FDIVs	fdivs	%f8, %f9, %f25
	.word 0xce220009  ! 1296: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xfe120009  ! 1296: LDUH_R	lduh	[%r8 + %r9], %r31
	.word 0x8143c000  ! 1296: STBAR	stbar
	.word 0xc42a0009  ! 1299: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc44a0009  ! 1299: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xcaaa2654  ! 1299: STBA_I	stba	%r5, [%r8 + 0x0654] %asi
	.word 0xc62a0009  ! 1302: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xca4a0009  ! 1302: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xe6921009  ! 1302: LDUHA_R	lduha	[%r8, %r9] 0x80, %r19
	.word 0xcf3a0009  ! 1305: STDF_R	std	%f7, [%r9, %r8]
	.word 0xcb020009  ! 1305: LDF_R	ld	[%r8, %r9], %f5
	.word 0xe8da25f0  ! 1305: LDXA_I	ldxa	[%r8, + 0x05f0] %asi, %r20
	.word 0xcc220009  ! 1308: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc44a0009  ! 1308: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xc2f22d70  ! 1308: STXA_I	stxa	%r1, [%r8 + 0x0d70] %asi
	.word 0xce220009  ! 1311: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc6420009  ! 1311: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0x89a209a9  ! 1311: FDIVs	fdivs	%f8, %f9, %f4
	.word 0xf42a0009  ! 1314: STB_R	stb	%r26, [%r8 + %r9]
	.word 0xcc0a0009  ! 1314: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0x987a2550  ! 1314: SDIV_I	sdiv 	%r8, 0x0550, %r12
	.word 0xc42a0009  ! 1317: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xcf1a0009  ! 1317: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0x04800002  ! 1317: BLE	ble  	<label_0x2>
	.word 0xcf220009  ! 1320: STF_R	st	%f7, [%r9, %r8]
	.word 0xf0420009  ! 1320: LDSW_R	ldsw	[%r8 + %r9], %r24
	.word 0xf8120009  ! 1320: LDUH_R	lduh	[%r8 + %r9], %r28
	.word 0xdd220009  ! 1323: STF_R	st	%f14, [%r9, %r8]
	.word 0xcc1a0009  ! 1323: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xe04a2f2c  ! 1323: LDSB_I	ldsb	[%r8 + 0x0f2c], %r16
	.word 0xc62a0009  ! 1326: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xea520009  ! 1326: LDSH_R	ldsh	[%r8 + %r9], %r21
	.word 0xa36a2ccc  ! 1326: SDIVX_I	sdivx	%r8, 0x0ccc, %r17
	.word 0xcf3a0009  ! 1329: STDF_R	std	%f7, [%r9, %r8]
	.word 0xdc520009  ! 1329: LDSH_R	ldsh	[%r8 + %r9], %r14
	.word 0xf0422460  ! 1329: LDSW_I	ldsw	[%r8 + 0x0460], %r24
	.word 0xcc2a0009  ! 1332: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc64a0009  ! 1332: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xc8ea1009  ! 1332: LDSTUBA_R	ldstuba	%r4, [%r8 + %r9] 0x80
	.word 0xe5220009  ! 1335: STF_R	st	%f18, [%r9, %r8]
	.word 0xc6420009  ! 1335: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xca6a0009  ! 1335: LDSTUB_R	ldstub	%r5, [%r8 + %r9]
	.word 0xcd3a0009  ! 1338: STDF_R	std	%f6, [%r9, %r8]
	.word 0xcc4a0009  ! 1338: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xc8aa1009  ! 1338: STBA_R	stba	%r4, [%r8 + %r9] 0x80
	.word 0xc4720009  ! 1341: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc6020009  ! 1341: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xad6a2150  ! 1341: SDIVX_I	sdivx	%r8, 0x0150, %r22
	.word 0xc4220009  ! 1344: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc8020009  ! 1344: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xb66a0009  ! 1344: UDIVX_R	udivx 	%r8, %r9, %r27
	.word 0xc42a0009  ! 1347: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc4120009  ! 1347: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xc3ea2af0  ! 1347: PREFETCHA_I	prefetcha	[%r8, + 0x0af0] %asi, #one_read
	.word 0xed3a0009  ! 1350: STDF_R	std	%f22, [%r9, %r8]
	.word 0xca520009  ! 1350: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xcd022d24  ! 1350: LDF_I	ld	[%r8, 0x0d24], %f6
	.word 0xee2a0009  ! 1353: STB_R	stb	%r23, [%r8 + %r9]
	.word 0xe4120009  ! 1353: LDUH_R	lduh	[%r8 + %r9], %r18
	.word 0xc8ba1009  ! 1353: STDA_R	stda	%r4, [%r8 + %r9] 0x80
	.word 0xed220009  ! 1356: STF_R	st	%f22, [%r9, %r8]
	.word 0xce5a0009  ! 1356: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xc4ea1009  ! 1356: LDSTUBA_R	ldstuba	%r2, [%r8 + %r9] 0x80
	.word 0xcd3a0009  ! 1359: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc31a0009  ! 1359: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0x8143c000  ! 1359: STBAR	stbar
	.word 0xc9220009  ! 1362: STF_R	st	%f4, [%r9, %r8]
	.word 0xc8020009  ! 1362: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xceea1009  ! 1362: LDSTUBA_R	ldstuba	%r7, [%r8 + %r9] 0x80
	.word 0xcc320009  ! 1365: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc81a0009  ! 1365: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xbc720009  ! 1365: UDIV_R	udiv 	%r8, %r9, %r30
	.word 0xf6720009  ! 1368: STX_R	stx	%r27, [%r8 + %r9]
	.word 0xf31a0009  ! 1368: LDDF_R	ldd	[%r8, %r9], %f25
	.word 0x8cda2444  ! 1368: SMULcc_I	smulcc 	%r8, 0x0444, %r6
	.word 0xe1220009  ! 1371: STF_R	st	%f16, [%r9, %r8]
	.word 0xdc520009  ! 1371: LDSH_R	ldsh	[%r8 + %r9], %r14
	.word 0x89222804  ! 1371: MULScc_I	mulscc 	%r8, 0x0804, %r4
	.word 0xc22a0009  ! 1374: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc6420009  ! 1374: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xc8f220b0  ! 1374: STXA_I	stxa	%r4, [%r8 + 0x00b0] %asi
	.word 0xc6320009  ! 1377: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc40a0009  ! 1377: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0x08800001  ! 1377: BLEU	bleu  	<label_0x1>
	.word 0xc42a0009  ! 1380: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc8120009  ! 1380: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0x8efa2e10  ! 1380: SDIVcc_I	sdivcc 	%r8, 0x0e10, %r7
	.word 0xc53a0009  ! 1383: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc31a0009  ! 1383: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xc8520009  ! 1383: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xc22a0009  ! 1386: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc20a0009  ! 1386: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xc36a0009  ! 1386: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc33a0009  ! 1389: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc2020009  ! 1389: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xc3ea2ccc  ! 1389: PREFETCHA_I	prefetcha	[%r8, + 0x0ccc] %asi, #one_read
	.word 0xc93a0009  ! 1392: STDF_R	std	%f4, [%r9, %r8]
	.word 0xf65a0009  ! 1392: LDX_R	ldx	[%r8 + %r9], %r27
	.word 0xc53a22c0  ! 1392: STDF_I	std	%f2, [0x02c0, %r8]
	.word 0xce2a0009  ! 1395: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xdc1a0009  ! 1395: LDD_R	ldd	[%r8 + %r9], %r14
	.word 0x856a21d8  ! 1395: SDIVX_I	sdivx	%r8, 0x01d8, %r2
	.word 0xc5220009  ! 1398: STF_R	st	%f2, [%r9, %r8]
	.word 0xd8420009  ! 1398: LDSW_R	ldsw	[%r8 + %r9], %r12
	.word 0x18800001  ! 1398: BGU	bgu  	<label_0x1>
	.word 0xe1220009  ! 1401: STF_R	st	%f16, [%r9, %r8]
	.word 0xc81a0009  ! 1401: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x00800002  ! 1401: BN	bn  	<label_0x2>
	.word 0xc8720009  ! 1404: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc4020009  ! 1404: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xc2da1009  ! 1404: LDXA_R	ldxa	[%r8, %r9] 0x80, %r1
	.word 0xce720009  ! 1407: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc31a0009  ! 1407: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xcc0a0009  ! 1407: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xca320009  ! 1410: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc81a0009  ! 1410: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xfc5a22b0  ! 1410: LDX_I	ldx	[%r8 + 0x02b0], %r30
	.word 0xc4220009  ! 1413: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xdb020009  ! 1413: LDF_R	ld	[%r8, %r9], %f13
	.word 0x8143c000  ! 1413: STBAR	stbar
	.word 0xc4720009  ! 1416: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xce4a0009  ! 1416: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xc36a24f0  ! 1416: PREFETCH_I	prefetch	[%r8 + 0x04f0], #one_read
	.word 0xc62a0009  ! 1419: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc2420009  ! 1419: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xc3ea2698  ! 1419: PREFETCHA_I	prefetcha	[%r8, + 0x0698] %asi, #one_read
	.word 0xc6720009  ! 1422: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc2120009  ! 1422: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0x8143e009  ! 1422: MEMBAR	membar	#LoadLoad | #StoreStore 
	.word 0xd6720009  ! 1425: STX_R	stx	%r11, [%r8 + %r9]
	.word 0xe71a0009  ! 1425: LDDF_R	ldd	[%r8, %r9], %f19
	.word 0xca420009  ! 1425: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xc4220009  ! 1428: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc91a0009  ! 1428: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xbe522320  ! 1428: UMUL_I	umul 	%r8, 0x0320, %r31
	.word 0xc4220009  ! 1431: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xcc420009  ! 1431: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xa0722d5c  ! 1431: UDIV_I	udiv 	%r8, 0x0d5c, %r16
	.word 0xd8220009  ! 1434: STW_R	stw	%r12, [%r8 + %r9]
	.word 0xea4a0009  ! 1434: LDSB_R	ldsb	[%r8 + %r9], %r21
	.word 0xff222338  ! 1434: STF_I	st	%f31, [0x0338, %r8]
	.word 0xc4220009  ! 1437: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc20a0009  ! 1437: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xcf220009  ! 1437: STF_R	st	%f7, [%r9, %r8]
	.word 0xca2a0009  ! 1440: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc41a0009  ! 1440: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x8143c000  ! 1440: STBAR	stbar
	.word 0xc8320009  ! 1443: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc85a0009  ! 1443: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xc36a2ec0  ! 1443: PREFETCH_I	prefetch	[%r8 + 0x0ec0], #one_read
	.word 0xe4220009  ! 1446: STW_R	stw	%r18, [%r8 + %r9]
	.word 0xca420009  ! 1446: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0x02800001  ! 1446: BE	be  	<label_0x1>
	.word 0xcc720009  ! 1449: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc4420009  ! 1449: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xb06a2b0c  ! 1449: UDIVX_I	udivx 	%r8, 0x0b0c, %r24
	.word 0xc8320009  ! 1452: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc25a0009  ! 1452: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0x8143e055  ! 1452: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside | #Sync 
	.word 0xfe320009  ! 1455: STH_R	sth	%r31, [%r8 + %r9]
	.word 0xc41a0009  ! 1455: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xeef21009  ! 1455: STXA_R	stxa	%r23, [%r8 + %r9] 0x80
	.word 0xe73a0009  ! 1458: STDF_R	std	%f19, [%r9, %r8]
	.word 0xdb1a0009  ! 1458: LDDF_R	ldd	[%r8, %r9], %f13
	.word 0x86fa2868  ! 1458: SDIVcc_I	sdivcc 	%r8, 0x0868, %r3
	.word 0xe7220009  ! 1461: STF_R	st	%f19, [%r9, %r8]
	.word 0xca0a0009  ! 1461: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xc6b21009  ! 1461: STHA_R	stha	%r3, [%r8 + %r9] 0x80
	.word 0xc2220009  ! 1464: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xf8420009  ! 1464: LDSW_R	ldsw	[%r8 + %r9], %r28
	.word 0xc7f22009  ! 1464: CASXA_R	casxa	[%r8]%asi, %r9, %r3
	.word 0xcd220009  ! 1467: STF_R	st	%f6, [%r9, %r8]
	.word 0xcf1a0009  ! 1467: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0x8c720009  ! 1467: UDIV_R	udiv 	%r8, %r9, %r6
	.word 0xff3a0009  ! 1470: STDF_R	std	%f31, [%r9, %r8]
	.word 0xc4020009  ! 1470: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xb2fa24c8  ! 1470: SDIVcc_I	sdivcc 	%r8, 0x04c8, %r25
	.word 0xda2a0009  ! 1473: STB_R	stb	%r13, [%r8 + %r9]
	.word 0xc3020009  ! 1473: LDF_R	ld	[%r8, %r9], %f1
	.word 0xc6120009  ! 1473: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xfa220009  ! 1476: STW_R	stw	%r29, [%r8 + %r9]
	.word 0xdb1a0009  ! 1476: LDDF_R	ldd	[%r8, %r9], %f13
	.word 0xe73a0009  ! 1476: STDF_R	std	%f19, [%r9, %r8]
	.word 0xca720009  ! 1479: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc3020009  ! 1479: LDF_R	ld	[%r8, %r9], %f1
	.word 0xcc9a2d40  ! 1479: LDDA_I	ldda	[%r8, + 0x0d40] %asi, %r6
	.word 0xc73a0009  ! 1482: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc2520009  ! 1482: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0x0e800001  ! 1482: BVS	bvs  	<label_0x1>
	.word 0xca320009  ! 1485: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xcc020009  ! 1485: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0x85220009  ! 1485: MULScc_R	mulscc 	%r8, %r9, %r2
	.word 0xc33a0009  ! 1488: STDF_R	std	%f1, [%r9, %r8]
	.word 0xcd020009  ! 1488: LDF_R	ld	[%r8, %r9], %f6
	.word 0x0cca0001  ! 1488: BRGZ	brgz  ,pt	%8,<label_0xa0001>
	.word 0xde720009  ! 1491: STX_R	stx	%r15, [%r8 + %r9]
	.word 0xff020009  ! 1491: LDF_R	ld	[%r8, %r9], %f31
	.word 0xe4921009  ! 1491: LDUHA_R	lduha	[%r8, %r9] 0x80, %r18
	.word 0xc6220009  ! 1494: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xcc1a0009  ! 1494: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0x8143c000  ! 1494: STBAR	stbar
	.word 0xcb3a0009  ! 1497: STDF_R	std	%f5, [%r9, %r8]
	.word 0xc91a0009  ! 1497: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0x9e520009  ! 1497: UMUL_R	umul 	%r8, %r9, %r15
	.word 0xf53a0009  ! 1500: STDF_R	std	%f26, [%r9, %r8]
	.word 0xe8020009  ! 1500: LDUW_R	lduw	[%r8 + %r9], %r20
	.word 0xc3ea2c40  ! 1500: PREFETCHA_I	prefetcha	[%r8, + 0x0c40] %asi, #one_read
	.word 0xc8720009  ! 1503: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc4020009  ! 1503: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xcc6a0009  ! 1503: LDSTUB_R	ldstub	%r6, [%r8 + %r9]
	.word 0xc2320009  ! 1506: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc71a0009  ! 1506: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xc20a0009  ! 1506: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xc6720009  ! 1509: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xea020009  ! 1509: LDUW_R	lduw	[%r8 + %r9], %r21
	.word 0xc3ea265c  ! 1509: PREFETCHA_I	prefetcha	[%r8, + 0x065c] %asi, #one_read
	.word 0xce720009  ! 1512: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xe84a0009  ! 1512: LDSB_R	ldsb	[%r8 + %r9], %r20
	.word 0x8a5a2388  ! 1512: SMUL_I	smul 	%r8, 0x0388, %r5
	.word 0xc2220009  ! 1515: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xdc120009  ! 1515: LDUH_R	lduh	[%r8 + %r9], %r14
	.word 0xb4f22678  ! 1515: UDIVcc_I	udivcc 	%r8, 0x0678, %r26
	.word 0xc2220009  ! 1518: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xcc4a0009  ! 1518: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xf73a0009  ! 1518: STDF_R	std	%f27, [%r9, %r8]
	.word 0xe6220009  ! 1521: STW_R	stw	%r19, [%r8 + %r9]
	.word 0xc6520009  ! 1521: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0x20800001  ! 1521: BN	bn,a	<label_0x1>
	.word 0xca320009  ! 1524: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc6520009  ! 1524: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0x845a2e50  ! 1524: SMUL_I	smul 	%r8, 0x0e50, %r2
	.word 0xcb220009  ! 1527: STF_R	st	%f5, [%r9, %r8]
	.word 0xfb1a0009  ! 1527: LDDF_R	ldd	[%r8, %r9], %f29
	.word 0x8143e012  ! 1527: MEMBAR	membar	#StoreLoad | #Lookaside 
	.word 0xf6320009  ! 1530: STH_R	sth	%r27, [%r8 + %r9]
	.word 0xcb1a0009  ! 1530: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0x0a800001  ! 1530: BCS	bcs  	<label_0x1>
	.word 0xc53a0009  ! 1533: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc5020009  ! 1533: LDF_R	ld	[%r8, %r9], %f2
	.word 0x8143c000  ! 1533: STBAR	stbar
	.word 0xc7220009  ! 1536: STF_R	st	%f3, [%r9, %r8]
	.word 0xcf020009  ! 1536: LDF_R	ld	[%r8, %r9], %f7
	.word 0xc46a2198  ! 1536: LDSTUB_I	ldstub	%r2, [%r8 + 0x0198]
	.word 0xe2220009  ! 1539: STW_R	stw	%r17, [%r8 + %r9]
	.word 0xc3020009  ! 1539: LDF_R	ld	[%r8, %r9], %f1
	.word 0xecf21009  ! 1539: STXA_R	stxa	%r22, [%r8 + %r9] 0x80
	.word 0xc8320009  ! 1542: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc20a0009  ! 1542: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xc4a21009  ! 1542: STWA_R	stwa	%r2, [%r8 + %r9] 0x80
	.word 0xc2220009  ! 1545: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xfa5a0009  ! 1545: LDX_R	ldx	[%r8 + %r9], %r29
	.word 0x2ec20001  ! 1545: BRGEZ	brgez,a,nt	%8,<label_0x20001>
	.word 0xc8720009  ! 1548: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc8420009  ! 1548: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xf0aa29dc  ! 1548: STBA_I	stba	%r24, [%r8 + 0x09dc] %asi
	.word 0xe9220009  ! 1551: STF_R	st	%f20, [%r9, %r8]
	.word 0xf60a0009  ! 1551: LDUB_R	ldub	[%r8 + %r9], %r27
	.word 0x88fa0009  ! 1551: SDIVcc_R	sdivcc 	%r8, %r9, %r4
	.word 0xce220009  ! 1554: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xf20a0009  ! 1554: LDUB_R	ldub	[%r8 + %r9], %r25
	.word 0xccba2ea0  ! 1554: STDA_I	stda	%r6, [%r8 + 0x0ea0] %asi
	.word 0xce720009  ! 1557: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xcd1a0009  ! 1557: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xc2f21009  ! 1557: STXA_R	stxa	%r1, [%r8 + %r9] 0x80
	.word 0xca720009  ! 1560: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc71a0009  ! 1560: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0x2ac20001  ! 1560: BRNZ	brnz,a,nt	%8,<label_0x20001>
	.word 0xe9220009  ! 1563: STF_R	st	%f20, [%r9, %r8]
	.word 0xc4020009  ! 1563: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xc3ea1009  ! 1563: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc2320009  ! 1566: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xce5a0009  ! 1566: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0x886a28c0  ! 1566: UDIVX_I	udivx 	%r8, 0x08c0, %r4
	.word 0xeb220009  ! 1569: STF_R	st	%f21, [%r9, %r8]
	.word 0xef020009  ! 1569: LDF_R	ld	[%r8, %r9], %f23
	.word 0x8143e03d  ! 1569: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0xcf3a0009  ! 1572: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc9020009  ! 1572: LDF_R	ld	[%r8, %r9], %f4
	.word 0xaef20009  ! 1572: UDIVcc_R	udivcc 	%r8, %r9, %r23
	.word 0xce720009  ! 1575: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc8020009  ! 1575: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xe86a0009  ! 1575: LDSTUB_R	ldstub	%r20, [%r8 + %r9]
	.word 0xe6220009  ! 1578: STW_R	stw	%r19, [%r8 + %r9]
	.word 0xf51a0009  ! 1578: LDDF_R	ldd	[%r8, %r9], %f26
	.word 0x8c720009  ! 1578: UDIV_R	udiv 	%r8, %r9, %r6
	.word 0xd8320009  ! 1581: STH_R	sth	%r12, [%r8 + %r9]
	.word 0xdd020009  ! 1581: LDF_R	ld	[%r8, %r9], %f14
	.word 0xced22ef0  ! 1581: LDSHA_I	ldsha	[%r8, + 0x0ef0] %asi, %r7
	.word 0xc2720009  ! 1584: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc41a0009  ! 1584: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xf8022704  ! 1584: LDUW_I	lduw	[%r8 + 0x0704], %r28
	.word 0xcb3a0009  ! 1587: STDF_R	std	%f5, [%r9, %r8]
	.word 0xf84a0009  ! 1587: LDSB_R	ldsb	[%r8 + %r9], %r28
	.word 0xc2ea2920  ! 1587: LDSTUBA_I	ldstuba	%r1, [%r8 + 0x0920] %asi
	.word 0xdb3a0009  ! 1590: STDF_R	std	%f13, [%r9, %r8]
	.word 0xce420009  ! 1590: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0x845a0009  ! 1590: SMUL_R	smul 	%r8, %r9, %r2
	.word 0xcc720009  ! 1593: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc6520009  ! 1593: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xd80a0009  ! 1593: LDUB_R	ldub	[%r8 + %r9], %r12
	.word 0xc8720009  ! 1596: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xee420009  ! 1596: LDSW_R	ldsw	[%r8 + %r9], %r23
	.word 0xc36a0009  ! 1596: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xe02a0009  ! 1599: STB_R	stb	%r16, [%r8 + %r9]
	.word 0xe0120009  ! 1599: LDUH_R	lduh	[%r8 + %r9], %r16
	.word 0xdcfa2040  ! 1599: SWAPA_I	swapa	%r14, [%r8 + 0x0040] %asi
	.word 0xcf220009  ! 1602: STF_R	st	%f7, [%r9, %r8]
	.word 0xe0020009  ! 1602: LDUW_R	lduw	[%r8 + %r9], %r16
	.word 0x8a5a0009  ! 1602: SMUL_R	smul 	%r8, %r9, %r5
	.word 0xcc2a0009  ! 1605: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc40a0009  ! 1605: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0x82520009  ! 1605: UMUL_R	umul 	%r8, %r9, %r1
	.word 0xcc2a0009  ! 1608: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xcb1a0009  ! 1608: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xb9220009  ! 1608: MULScc_R	mulscc 	%r8, %r9, %r28
	.word 0xee2a0009  ! 1611: STB_R	stb	%r23, [%r8 + %r9]
	.word 0xd41a0009  ! 1611: LDD_R	ldd	[%r8 + %r9], %r10
	.word 0xc36a2498  ! 1611: PREFETCH_I	prefetch	[%r8 + 0x0498], #one_read
	.word 0xc7220009  ! 1614: STF_R	st	%f3, [%r9, %r8]
	.word 0xcf1a0009  ! 1614: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xcff22009  ! 1614: CASXA_R	casxa	[%r8]%asi, %r9, %r7
	.word 0xc93a0009  ! 1617: STDF_R	std	%f4, [%r9, %r8]
	.word 0xe31a0009  ! 1617: LDDF_R	ldd	[%r8, %r9], %f17
	.word 0xc41a0009  ! 1617: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xc6220009  ! 1620: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xf64a0009  ! 1620: LDSB_R	ldsb	[%r8 + %r9], %r27
	.word 0xc8a21009  ! 1620: STWA_R	stwa	%r4, [%r8 + %r9] 0x80
	.word 0xcc720009  ! 1623: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xe31a0009  ! 1623: LDDF_R	ldd	[%r8, %r9], %f17
	.word 0x8143c000  ! 1623: STBAR	stbar
	.word 0xc8720009  ! 1626: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xca120009  ! 1626: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0x8143e072  ! 1626: MEMBAR	membar	#StoreLoad | #Lookaside | #MemIssue | #Sync 
	.word 0xc8320009  ! 1629: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xf64a0009  ! 1629: LDSB_R	ldsb	[%r8 + %r9], %r27
	.word 0x8ef20009  ! 1629: UDIVcc_R	udivcc 	%r8, %r9, %r7
	.word 0xc2720009  ! 1632: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xf6120009  ! 1632: LDUH_R	lduh	[%r8 + %r9], %r27
	.word 0xc8a22594  ! 1632: STWA_I	stwa	%r4, [%r8 + 0x0594] %asi
	.word 0xca320009  ! 1635: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc64a0009  ! 1635: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0x8c5a2624  ! 1635: SMUL_I	smul 	%r8, 0x0624, %r6
	.word 0xc8220009  ! 1638: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc4120009  ! 1638: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0x30800001  ! 1638: BA	ba,a	<label_0x1>
	.word 0xf0720009  ! 1641: STX_R	stx	%r24, [%r8 + %r9]
	.word 0xc41a0009  ! 1641: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x1c800002  ! 1641: BPOS	bpos  	<label_0x2>
	.word 0xc3220009  ! 1644: STF_R	st	%f1, [%r9, %r8]
	.word 0xe64a0009  ! 1644: LDSB_R	ldsb	[%r8 + %r9], %r19
	.word 0x8143e028  ! 1644: MEMBAR	membar	#StoreStore | #MemIssue 
	.word 0xc5220009  ! 1647: STF_R	st	%f2, [%r9, %r8]
	.word 0xdc120009  ! 1647: LDUH_R	lduh	[%r8 + %r9], %r14
	.word 0xccb21009  ! 1647: STHA_R	stha	%r6, [%r8 + %r9] 0x80
	.word 0xc6720009  ! 1650: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xcd020009  ! 1650: LDF_R	ld	[%r8, %r9], %f6
	.word 0xfbf21009  ! 1650: CASXA_I	casxa	[%r8] 0x80, %r9, %r29
	.word 0xd8320009  ! 1653: STH_R	sth	%r12, [%r8 + %r9]
	.word 0xec420009  ! 1653: LDSW_R	ldsw	[%r8 + %r9], %r22
	.word 0x96520009  ! 1653: UMUL_R	umul 	%r8, %r9, %r11
	.word 0xf82a0009  ! 1656: STB_R	stb	%r28, [%r8 + %r9]
	.word 0xd9020009  ! 1656: LDF_R	ld	[%r8, %r9], %f12
	.word 0xcd1a0009  ! 1656: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xe02a0009  ! 1659: STB_R	stb	%r16, [%r8 + %r9]
	.word 0xf8020009  ! 1659: LDUW_R	lduw	[%r8 + %r9], %r28
	.word 0x04c20001  ! 1659: BRLEZ	brlez  ,nt	%8,<label_0x20001>
	.word 0xcc720009  ! 1662: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xe81a0009  ! 1662: LDD_R	ldd	[%r8 + %r9], %r20
	.word 0xe4ba1009  ! 1662: STDA_R	stda	%r18, [%r8 + %r9] 0x80
	.word 0xce720009  ! 1665: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xf6120009  ! 1665: LDUH_R	lduh	[%r8 + %r9], %r27
	.word 0xccc21009  ! 1665: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r6
	.word 0xca320009  ! 1668: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xcb020009  ! 1668: LDF_R	ld	[%r8, %r9], %f5
	.word 0xe5f22009  ! 1668: CASXA_R	casxa	[%r8]%asi, %r9, %r18
	.word 0xea320009  ! 1671: STH_R	sth	%r21, [%r8 + %r9]
	.word 0xc65a0009  ! 1671: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xc33a2fc0  ! 1671: STDF_I	std	%f1, [0x0fc0, %r8]
	.word 0xc7220009  ! 1674: STF_R	st	%f3, [%r9, %r8]
	.word 0xca5a0009  ! 1674: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xca8a1009  ! 1674: LDUBA_R	lduba	[%r8, %r9] 0x80, %r5
	.word 0xce320009  ! 1677: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc41a0009  ! 1677: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xc36a0009  ! 1677: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc5220009  ! 1680: STF_R	st	%f2, [%r9, %r8]
	.word 0xc44a0009  ! 1680: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0x8cfa0009  ! 1680: SDIVcc_R	sdivcc 	%r8, %r9, %r6
	.word 0xc2320009  ! 1683: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc24a0009  ! 1683: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xfe922d2c  ! 1683: LDUHA_I	lduha	[%r8, + 0x0d2c] %asi, %r31
	.word 0xcb3a0009  ! 1686: STDF_R	std	%f5, [%r9, %r8]
	.word 0xd84a0009  ! 1686: LDSB_R	ldsb	[%r8 + %r9], %r12
	.word 0xc73a0009  ! 1686: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc6220009  ! 1689: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc81a0009  ! 1689: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xada20929  ! 1689: FMULs	fmuls	%f8, %f9, %f22
	.word 0xc2720009  ! 1692: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xcb1a0009  ! 1692: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0x89a20829  ! 1692: FADDs	fadds	%f8, %f9, %f4
	.word 0xc93a0009  ! 1695: STDF_R	std	%f4, [%r9, %r8]
	.word 0xfd020009  ! 1695: LDF_R	ld	[%r8, %r9], %f30
	.word 0xc6fa1009  ! 1695: SWAPA_R	swapa	%r3, [%r8 + %r9] 0x80
	.word 0xec320009  ! 1698: STH_R	sth	%r22, [%r8 + %r9]
	.word 0xce0a0009  ! 1698: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xe89a2240  ! 1698: LDDA_I	ldda	[%r8, + 0x0240] %asi, %r20
	.word 0xc33a0009  ! 1701: STDF_R	std	%f1, [%r9, %r8]
	.word 0xcc420009  ! 1701: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xe87a2c4c  ! 1701: SWAP_I	swap	%r20, [%r8 + 0x0c4c]
	.word 0xe6220009  ! 1704: STW_R	stw	%r19, [%r8 + %r9]
	.word 0xc8520009  ! 1704: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xc0ba2290  ! 1704: STDA_I	stda	%r0, [%r8 + 0x0290] %asi
	.word 0xf4320009  ! 1707: STH_R	sth	%r26, [%r8 + %r9]
	.word 0xcc5a0009  ! 1707: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xc6fa2f58  ! 1707: SWAPA_I	swapa	%r3, [%r8 + 0x0f58] %asi
	.word 0xc22a0009  ! 1710: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xea4a0009  ! 1710: LDSB_R	ldsb	[%r8 + %r9], %r21
	.word 0xc36a0009  ! 1710: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc8220009  ! 1713: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xfc5a0009  ! 1713: LDX_R	ldx	[%r8 + %r9], %r30
	.word 0xec522a04  ! 1713: LDSH_I	ldsh	[%r8 + 0x0a04], %r22
	.word 0xcc220009  ! 1716: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xe6120009  ! 1716: LDUH_R	lduh	[%r8 + %r9], %r19
	.word 0x8c5a2a88  ! 1716: SMUL_I	smul 	%r8, 0x0a88, %r6
	.word 0xc9220009  ! 1719: STF_R	st	%f4, [%r9, %r8]
	.word 0xcb1a0009  ! 1719: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0x8143c000  ! 1719: STBAR	stbar
	.word 0xce320009  ! 1722: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xf00a0009  ! 1722: LDUB_R	ldub	[%r8 + %r9], %r24
	.word 0xaba20929  ! 1722: FMULs	fmuls	%f8, %f9, %f21
	.word 0xde320009  ! 1725: STH_R	sth	%r15, [%r8 + %r9]
	.word 0xfb020009  ! 1725: LDF_R	ld	[%r8, %r9], %f29
	.word 0x0ac20001  ! 1725: BRNZ	brnz  ,nt	%8,<label_0x20001>
	.word 0xf82a0009  ! 1728: STB_R	stb	%r28, [%r8 + %r9]
	.word 0xc9020009  ! 1728: LDF_R	ld	[%r8, %r9], %f4
	.word 0xc3ea2d80  ! 1728: PREFETCHA_I	prefetcha	[%r8, + 0x0d80] %asi, #one_read
	.word 0xca220009  ! 1731: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xcc4a0009  ! 1731: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xc51a0009  ! 1731: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xc3220009  ! 1734: STF_R	st	%f1, [%r9, %r8]
	.word 0xeb020009  ! 1734: LDF_R	ld	[%r8, %r9], %f21
	.word 0x847a0009  ! 1734: SDIV_R	sdiv 	%r8, %r9, %r2
	.word 0xce220009  ! 1737: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc6420009  ! 1737: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xc6c22bdc  ! 1737: LDSWA_I	ldswa	[%r8, + 0x0bdc] %asi, %r3
	.word 0xcb220009  ! 1740: STF_R	st	%f5, [%r9, %r8]
	.word 0xce5a0009  ! 1740: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xca122210  ! 1740: LDUH_I	lduh	[%r8 + 0x0210], %r5
	.word 0xfe320009  ! 1743: STH_R	sth	%r31, [%r8 + %r9]
	.word 0xc6020009  ! 1743: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0x8a5a2348  ! 1743: SMUL_I	smul 	%r8, 0x0348, %r5
	.word 0xf4220009  ! 1746: STW_R	stw	%r26, [%r8 + %r9]
	.word 0xe3020009  ! 1746: LDF_R	ld	[%r8, %r9], %f17
	.word 0xc2522bb4  ! 1746: LDSH_I	ldsh	[%r8 + 0x0bb4], %r1
	.word 0xce2a0009  ! 1749: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc4120009  ! 1749: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xcb3a0009  ! 1749: STDF_R	std	%f5, [%r9, %r8]
	.word 0xe53a0009  ! 1752: STDF_R	std	%f18, [%r9, %r8]
	.word 0xce020009  ! 1752: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0x8a522818  ! 1752: UMUL_I	umul 	%r8, 0x0818, %r5
	.word 0xca320009  ! 1755: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc6120009  ! 1755: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xf7020009  ! 1755: LDF_R	ld	[%r8, %r9], %f27
	.word 0xeb220009  ! 1758: STF_R	st	%f21, [%r9, %r8]
	.word 0xc9020009  ! 1758: LDF_R	ld	[%r8, %r9], %f4
	.word 0xc8c21009  ! 1758: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r4
	.word 0xcc2a0009  ! 1761: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xd81a0009  ! 1761: LDD_R	ldd	[%r8 + %r9], %r12
	.word 0x8e720009  ! 1761: UDIV_R	udiv 	%r8, %r9, %r7
	.word 0xfb220009  ! 1764: STF_R	st	%f29, [%r9, %r8]
	.word 0xc24a0009  ! 1764: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xdde21009  ! 1764: CASA_I	casa	[%r8] 0x80, %r9, %r14
	.word 0xc93a0009  ! 1767: STDF_R	std	%f4, [%r9, %r8]
	.word 0xcf020009  ! 1767: LDF_R	ld	[%r8, %r9], %f7
	.word 0x8c7a0009  ! 1767: SDIV_R	sdiv 	%r8, %r9, %r6
	.word 0xf6720009  ! 1770: STX_R	stx	%r27, [%r8 + %r9]
	.word 0xc40a0009  ! 1770: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xc3e21009  ! 1770: CASA_I	casa	[%r8] 0x80, %r9, %r1
	.word 0xc6320009  ! 1773: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xf0420009  ! 1773: LDSW_R	ldsw	[%r8 + %r9], %r24
	.word 0x18800001  ! 1773: BGU	bgu  	<label_0x1>
	.word 0xea720009  ! 1776: STX_R	stx	%r21, [%r8 + %r9]
	.word 0xd6420009  ! 1776: LDSW_R	ldsw	[%r8 + %r9], %r11
	.word 0xeeb2234c  ! 1776: STHA_I	stha	%r23, [%r8 + 0x034c] %asi
	.word 0xce220009  ! 1779: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc4520009  ! 1779: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xecc21009  ! 1779: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r22
	.word 0xc4720009  ! 1782: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xf8420009  ! 1782: LDSW_R	ldsw	[%r8 + %r9], %r28
	.word 0xc36a0009  ! 1782: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xdc2a0009  ! 1785: STB_R	stb	%r14, [%r8 + %r9]
	.word 0xcc1a0009  ! 1785: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xc8420009  ! 1785: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xcc2a0009  ! 1788: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xcc020009  ! 1788: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xecf21009  ! 1788: STXA_R	stxa	%r22, [%r8 + %r9] 0x80
	.word 0xc5220009  ! 1791: STF_R	st	%f2, [%r9, %r8]
	.word 0xc4520009  ! 1791: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0x36800001  ! 1791: BGE	bge,a	<label_0x1>
	.word 0xf42a0009  ! 1794: STB_R	stb	%r26, [%r8 + %r9]
	.word 0xce5a0009  ! 1794: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0x8e522c9c  ! 1794: UMUL_I	umul 	%r8, 0x0c9c, %r7
	.word 0xc9220009  ! 1797: STF_R	st	%f4, [%r9, %r8]
	.word 0xc2520009  ! 1797: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0x8143c000  ! 1797: STBAR	stbar
	.word 0xca720009  ! 1800: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xcd1a0009  ! 1800: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0x8d220009  ! 1800: MULScc_R	mulscc 	%r8, %r9, %r6
	.word 0xd93a0009  ! 1803: STDF_R	std	%f12, [%r9, %r8]
	.word 0xd9020009  ! 1803: LDF_R	ld	[%r8, %r9], %f12
	.word 0x2aca0001  ! 1803: BRNZ	brnz,a,pt	%8,<label_0xa0001>
	.word 0xc2720009  ! 1806: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc71a0009  ! 1806: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xcaea1009  ! 1806: LDSTUBA_R	ldstuba	%r5, [%r8 + %r9] 0x80
	.word 0xc82a0009  ! 1809: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xe64a0009  ! 1809: LDSB_R	ldsb	[%r8 + %r9], %r19
	.word 0xf68a267c  ! 1809: LDUBA_I	lduba	[%r8, + 0x067c] %asi, %r27
	.word 0xf33a0009  ! 1812: STDF_R	std	%f25, [%r9, %r8]
	.word 0xcc0a0009  ! 1812: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0x8143e017  ! 1812: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside 
	.word 0xc6320009  ! 1815: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc8120009  ! 1815: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xcc120009  ! 1815: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xc82a0009  ! 1818: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xcc1a0009  ! 1818: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0x8ada2848  ! 1818: SMULcc_I	smulcc 	%r8, 0x0848, %r5
	.word 0xe0220009  ! 1821: STW_R	stw	%r16, [%r8 + %r9]
	.word 0xcc0a0009  ! 1821: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0x85a208a9  ! 1821: FSUBs	fsubs	%f8, %f9, %f2
	.word 0xc73a0009  ! 1824: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc2520009  ! 1824: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xcca229d4  ! 1824: STWA_I	stwa	%r6, [%r8 + 0x09d4] %asi
	.word 0xcd220009  ! 1827: STF_R	st	%f6, [%r9, %r8]
	.word 0xce5a0009  ! 1827: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0x8143c000  ! 1827: STBAR	stbar
	.word 0xfe2a0009  ! 1830: STB_R	stb	%r31, [%r8 + %r9]
	.word 0xc7020009  ! 1830: LDF_R	ld	[%r8, %r9], %f3
	.word 0xce8a1009  ! 1830: LDUBA_R	lduba	[%r8, %r9] 0x80, %r7
	.word 0xc3220009  ! 1833: STF_R	st	%f1, [%r9, %r8]
	.word 0xc60a0009  ! 1833: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xc36a23e0  ! 1833: PREFETCH_I	prefetch	[%r8 + 0x03e0], #one_read
	.word 0xeb220009  ! 1836: STF_R	st	%f21, [%r9, %r8]
	.word 0xcc4a0009  ! 1836: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xced22ab0  ! 1836: LDSHA_I	ldsha	[%r8, + 0x0ab0] %asi, %r7
	.word 0xda2a0009  ! 1839: STB_R	stb	%r13, [%r8 + %r9]
	.word 0xfe420009  ! 1839: LDSW_R	ldsw	[%r8 + %r9], %r31
	.word 0xe0aa1009  ! 1839: STBA_R	stba	%r16, [%r8 + %r9] 0x80
	.word 0xc2320009  ! 1842: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xca020009  ! 1842: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xcde21009  ! 1842: CASA_I	casa	[%r8] 0x80, %r9, %r6
	.word 0xe62a0009  ! 1845: STB_R	stb	%r19, [%r8 + %r9]
	.word 0xf4020009  ! 1845: LDUW_R	lduw	[%r8 + %r9], %r26
	.word 0xc68a1009  ! 1845: LDUBA_R	lduba	[%r8, %r9] 0x80, %r3
	.word 0xce2a0009  ! 1848: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xf41a0009  ! 1848: LDD_R	ldd	[%r8 + %r9], %r26
	.word 0x88f228c8  ! 1848: UDIVcc_I	udivcc 	%r8, 0x08c8, %r4
	.word 0xf02a0009  ! 1851: STB_R	stb	%r24, [%r8 + %r9]
	.word 0xca420009  ! 1851: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xcafa1009  ! 1851: SWAPA_R	swapa	%r5, [%r8 + %r9] 0x80
	.word 0xfa220009  ! 1854: STW_R	stw	%r29, [%r8 + %r9]
	.word 0xc44a0009  ! 1854: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0x8af22854  ! 1854: UDIVcc_I	udivcc 	%r8, 0x0854, %r5
	.word 0xfb220009  ! 1857: STF_R	st	%f29, [%r9, %r8]
	.word 0xcc0a0009  ! 1857: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xb3a20829  ! 1857: FADDs	fadds	%f8, %f9, %f25
	.word 0xf53a0009  ! 1860: STDF_R	std	%f26, [%r9, %r8]
	.word 0xf2120009  ! 1860: LDUH_R	lduh	[%r8 + %r9], %r25
	.word 0x8143c000  ! 1860: STBAR	stbar
	.word 0xff220009  ! 1863: STF_R	st	%f31, [%r9, %r8]
	.word 0xca4a0009  ! 1863: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xca6a0009  ! 1863: LDSTUB_R	ldstub	%r5, [%r8 + %r9]
	.word 0xc8320009  ! 1866: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc81a0009  ! 1866: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x8e7a0009  ! 1866: SDIV_R	sdiv 	%r8, %r9, %r7
	.word 0xfe320009  ! 1869: STH_R	sth	%r31, [%r8 + %r9]
	.word 0xc65a0009  ! 1869: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xca0a0009  ! 1869: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xf4320009  ! 1872: STH_R	sth	%r26, [%r8 + %r9]
	.word 0xc25a0009  ! 1872: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xcca21009  ! 1872: STWA_R	stwa	%r6, [%r8 + %r9] 0x80
	.word 0xe02a0009  ! 1875: STB_R	stb	%r16, [%r8 + %r9]
	.word 0xd6420009  ! 1875: LDSW_R	ldsw	[%r8 + %r9], %r11
	.word 0x12800002  ! 1875: BNE	bne  	<label_0x2>
	.word 0xf0320009  ! 1878: STH_R	sth	%r24, [%r8 + %r9]
	.word 0xdc4a0009  ! 1878: LDSB_R	ldsb	[%r8 + %r9], %r14
	.word 0xc41a2b68  ! 1878: LDD_I	ldd	[%r8 + 0x0b68], %r2
	.word 0xf6720009  ! 1881: STX_R	stx	%r27, [%r8 + %r9]
	.word 0xc60a0009  ! 1881: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xc3ea2580  ! 1881: PREFETCHA_I	prefetcha	[%r8, + 0x0580] %asi, #one_read
	.word 0xca220009  ! 1884: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xce0a0009  ! 1884: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xcaea1009  ! 1884: LDSTUBA_R	ldstuba	%r5, [%r8 + %r9] 0x80
	.word 0xc2320009  ! 1887: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xd9020009  ! 1887: LDF_R	ld	[%r8, %r9], %f12
	.word 0xcc821009  ! 1887: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r6
	.word 0xc93a0009  ! 1890: STDF_R	std	%f4, [%r9, %r8]
	.word 0xc91a0009  ! 1890: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xb85a2490  ! 1890: SMUL_I	smul 	%r8, 0x0490, %r28
	.word 0xe8320009  ! 1893: STH_R	sth	%r20, [%r8 + %r9]
	.word 0xc4120009  ! 1893: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xc36a2084  ! 1893: PREFETCH_I	prefetch	[%r8 + 0x0084], #one_read
	.word 0xc2220009  ! 1896: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xcd1a0009  ! 1896: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0x0ec20001  ! 1896: BRGEZ	brgez  ,nt	%8,<label_0x20001>
	.word 0xe2720009  ! 1899: STX_R	stx	%r17, [%r8 + %r9]
	.word 0xca020009  ! 1899: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xc8ca1009  ! 1899: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r4
	.word 0xc6320009  ! 1902: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xe45a0009  ! 1902: LDX_R	ldx	[%r8 + %r9], %r18
	.word 0xccc2222c  ! 1902: LDSWA_I	ldswa	[%r8, + 0x022c] %asi, %r6
	.word 0xc8320009  ! 1905: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc8520009  ! 1905: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xcc922f28  ! 1905: LDUHA_I	lduha	[%r8, + 0x0f28] %asi, %r6
	.word 0xc42a0009  ! 1908: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xf8420009  ! 1908: LDSW_R	ldsw	[%r8 + %r9], %r28
	.word 0x04800001  ! 1908: BLE	ble  	<label_0x1>
	.word 0xca320009  ! 1911: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc8520009  ! 1911: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xc3ea2a94  ! 1911: PREFETCHA_I	prefetcha	[%r8, + 0x0a94] %asi, #one_read
	.word 0xc8220009  ! 1914: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc25a0009  ! 1914: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0x99a209a9  ! 1914: FDIVs	fdivs	%f8, %f9, %f12
	.word 0xc5220009  ! 1917: STF_R	st	%f2, [%r9, %r8]
	.word 0xc8520009  ! 1917: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xc6da2ca0  ! 1917: LDXA_I	ldxa	[%r8, + 0x0ca0] %asi, %r3
	.word 0xc93a0009  ! 1920: STDF_R	std	%f4, [%r9, %r8]
	.word 0xcc520009  ! 1920: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0x8ada20bc  ! 1920: SMULcc_I	smulcc 	%r8, 0x00bc, %r5
	.word 0xeb220009  ! 1923: STF_R	st	%f21, [%r9, %r8]
	.word 0xcc0a0009  ! 1923: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0x12800001  ! 1923: BNE	bne  	<label_0x1>
	.word 0xc22a0009  ! 1926: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xce020009  ! 1926: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xd6b21009  ! 1926: STHA_R	stha	%r11, [%r8 + %r9] 0x80
	.word 0xcd3a0009  ! 1929: STDF_R	std	%f6, [%r9, %r8]
	.word 0xee420009  ! 1929: LDSW_R	ldsw	[%r8 + %r9], %r23
	.word 0x845a2ee0  ! 1929: SMUL_I	smul 	%r8, 0x0ee0, %r2
	.word 0xcb3a0009  ! 1932: STDF_R	std	%f5, [%r9, %r8]
	.word 0xf2120009  ! 1932: LDUH_R	lduh	[%r8 + %r9], %r25
	.word 0xc3ea232c  ! 1932: PREFETCHA_I	prefetcha	[%r8, + 0x032c] %asi, #one_read
	.word 0xcf220009  ! 1935: STF_R	st	%f7, [%r9, %r8]
	.word 0xcc0a0009  ! 1935: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xc3ea2a80  ! 1935: PREFETCHA_I	prefetcha	[%r8, + 0x0a80] %asi, #one_read
	.word 0xc6320009  ! 1938: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc81a0009  ! 1938: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xc4120009  ! 1938: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xc5220009  ! 1941: STF_R	st	%f2, [%r9, %r8]
	.word 0xce520009  ! 1941: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0x9af20009  ! 1941: UDIVcc_R	udivcc 	%r8, %r9, %r13
	.word 0xf0320009  ! 1944: STH_R	sth	%r24, [%r8 + %r9]
	.word 0xf2520009  ! 1944: LDSH_R	ldsh	[%r8 + %r9], %r25
	.word 0x8143e043  ! 1944: MEMBAR	membar	#LoadLoad | #StoreLoad | #Sync 
	.word 0xc2720009  ! 1947: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc25a0009  ! 1947: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0x88720009  ! 1947: UDIV_R	udiv 	%r8, %r9, %r4
	.word 0xce720009  ! 1950: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xcc020009  ! 1950: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0x28800002  ! 1950: BLEU	bleu,a	<label_0x2>
	.word 0xe2220009  ! 1953: STW_R	stw	%r17, [%r8 + %r9]
	.word 0xc5020009  ! 1953: LDF_R	ld	[%r8, %r9], %f2
	.word 0xea5a2768  ! 1953: LDX_I	ldx	[%r8 + 0x0768], %r21
	.word 0xcf220009  ! 1956: STF_R	st	%f7, [%r9, %r8]
	.word 0xc84a0009  ! 1956: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xcc922a64  ! 1956: LDUHA_I	lduha	[%r8, + 0x0a64] %asi, %r6
	.word 0xca220009  ! 1959: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xce020009  ! 1959: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xc9220009  ! 1959: STF_R	st	%f4, [%r9, %r8]
	.word 0xfc2a0009  ! 1962: STB_R	stb	%r30, [%r8 + %r9]
	.word 0xcc520009  ! 1962: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0x8143e05d  ! 1962: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0xca220009  ! 1965: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc64a0009  ! 1965: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0x89a209a9  ! 1965: FDIVs	fdivs	%f8, %f9, %f4
	.word 0xe82a0009  ! 1968: STB_R	stb	%r20, [%r8 + %r9]
	.word 0xce5a0009  ! 1968: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0x87a20829  ! 1968: FADDs	fadds	%f8, %f9, %f3
	.word 0xfa2a0009  ! 1971: STB_R	stb	%r29, [%r8 + %r9]
	.word 0xca020009  ! 1971: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0x89220009  ! 1971: MULScc_R	mulscc 	%r8, %r9, %r4
	.word 0xc8220009  ! 1974: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc2120009  ! 1974: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xc9e21009  ! 1974: CASA_I	casa	[%r8] 0x80, %r9, %r4
	.word 0xf62a0009  ! 1977: STB_R	stb	%r27, [%r8 + %r9]
	.word 0xca4a0009  ! 1977: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xc3ea28f4  ! 1977: PREFETCHA_I	prefetcha	[%r8, + 0x08f4] %asi, #one_read
	.word 0xcb3a0009  ! 1980: STDF_R	std	%f5, [%r9, %r8]
	.word 0xfa0a0009  ! 1980: LDUB_R	ldub	[%r8 + %r9], %r29
	.word 0x18800001  ! 1980: BGU	bgu  	<label_0x1>
	.word 0xce720009  ! 1983: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc31a0009  ! 1983: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xd6f21009  ! 1983: STXA_R	stxa	%r11, [%r8 + %r9] 0x80
	.word 0xcd3a0009  ! 1986: STDF_R	std	%f6, [%r9, %r8]
	.word 0xce0a0009  ! 1986: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xf6da1009  ! 1986: LDXA_R	ldxa	[%r8, %r9] 0x80, %r27
	.word 0xf2720009  ! 1989: STX_R	stx	%r25, [%r8 + %r9]
	.word 0xc20a0009  ! 1989: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xcc420009  ! 1989: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xcb3a0009  ! 1992: STDF_R	std	%f5, [%r9, %r8]
	.word 0xda5a0009  ! 1992: LDX_R	ldx	[%r8 + %r9], %r13
	.word 0xe0da1009  ! 1992: LDXA_R	ldxa	[%r8, %r9] 0x80, %r16
	.word 0xcd3a0009  ! 1995: STDF_R	std	%f6, [%r9, %r8]
	.word 0xfa520009  ! 1995: LDSH_R	ldsh	[%r8 + %r9], %r29
	.word 0xc7022f94  ! 1995: LDF_I	ld	[%r8, 0x0f94], %f3
	.word 0xcc220009  ! 1998: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc2120009  ! 1998: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0x8143e06b  ! 1998: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #MemIssue | #Sync 
	.word 0xf4720009  ! 2001: STX_R	stx	%r26, [%r8 + %r9]
	.word 0xca4a0009  ! 2001: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xc36a0009  ! 2001: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc62a0009  ! 2004: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xca4a0009  ! 2004: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0x02ca0001  ! 2004: BRZ	brz  ,pt	%8,<label_0xa0001>
	.word 0xcf3a0009  ! 2007: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc64a0009  ! 2007: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xcc921009  ! 2007: LDUHA_R	lduha	[%r8, %r9] 0x80, %r6
	.word 0xdd3a0009  ! 2010: STDF_R	std	%f14, [%r9, %r8]
	.word 0xdc0a0009  ! 2010: LDUB_R	ldub	[%r8 + %r9], %r14
	.word 0xc3220009  ! 2010: STF_R	st	%f1, [%r9, %r8]
	.word 0xc4320009  ! 2013: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xcb1a0009  ! 2013: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xc3ea29e8  ! 2013: PREFETCHA_I	prefetcha	[%r8, + 0x09e8] %asi, #one_read
	.word 0xee2a0009  ! 2016: STB_R	stb	%r23, [%r8 + %r9]
	.word 0xc8120009  ! 2016: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xc40a0009  ! 2016: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xcc2a0009  ! 2019: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xf71a0009  ! 2019: LDDF_R	ldd	[%r8, %r9], %f27
	.word 0x836a0009  ! 2019: SDIVX_R	sdivx	%r8, %r9, %r1
	.word 0xce320009  ! 2022: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc4120009  ! 2022: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0x885a2548  ! 2022: SMUL_I	smul 	%r8, 0x0548, %r4
	.word 0xc8320009  ! 2025: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xeb1a0009  ! 2025: LDDF_R	ldd	[%r8, %r9], %f21
	.word 0xc7e21009  ! 2025: CASA_I	casa	[%r8] 0x80, %r9, %r3
	.word 0xc4320009  ! 2028: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xcd1a0009  ! 2028: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xcca22f0c  ! 2028: STWA_I	stwa	%r6, [%r8 + 0x0f0c] %asi
	.word 0xf2720009  ! 2031: STX_R	stx	%r25, [%r8 + %r9]
	.word 0xcc020009  ! 2031: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0x18800001  ! 2031: BGU	bgu  	<label_0x1>
	.word 0xc2320009  ! 2034: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc7020009  ! 2034: LDF_R	ld	[%r8, %r9], %f3
	.word 0xc5e22009  ! 2034: CASA_R	casa	[%r8] %asi, %r9, %r2
	.word 0xc2720009  ! 2037: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc2420009  ! 2037: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xfed21009  ! 2037: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r31
	.word 0xfe720009  ! 2040: STX_R	stx	%r31, [%r8 + %r9]
	.word 0xde5a0009  ! 2040: LDX_R	ldx	[%r8 + %r9], %r15
	.word 0x8143c000  ! 2040: STBAR	stbar
	.word 0xfa2a0009  ! 2043: STB_R	stb	%r29, [%r8 + %r9]
	.word 0xc2420009  ! 2043: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0x8c7a2454  ! 2043: SDIV_I	sdiv 	%r8, 0x0454, %r6
	.word 0xdb3a0009  ! 2046: STDF_R	std	%f13, [%r9, %r8]
	.word 0xca120009  ! 2046: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xc7020009  ! 2046: LDF_R	ld	[%r8, %r9], %f3
	.word 0xc2720009  ! 2049: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xdc120009  ! 2049: LDUH_R	lduh	[%r8 + %r9], %r14
	.word 0xc36a0009  ! 2049: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xcd3a0009  ! 2052: STDF_R	std	%f6, [%r9, %r8]
	.word 0xe01a0009  ! 2052: LDD_R	ldd	[%r8 + %r9], %r16
	.word 0x1c800001  ! 2052: BPOS	bpos  	<label_0x1>
	.word 0xce2a0009  ! 2055: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc5020009  ! 2055: LDF_R	ld	[%r8, %r9], %f2
	.word 0x824a224c  ! 2055: MULX_I	mulx 	%r8, 0x024c, %r1
	.word 0xce720009  ! 2058: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc84a0009  ! 2058: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xc9222bf0  ! 2058: STF_I	st	%f4, [0x0bf0, %r8]
	.word 0xce320009  ! 2061: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc40a0009  ! 2061: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xc6da2930  ! 2061: LDXA_I	ldxa	[%r8, + 0x0930] %asi, %r3
	.word 0xf6220009  ! 2064: STW_R	stw	%r27, [%r8 + %r9]
	.word 0xca120009  ! 2064: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0x0aca0001  ! 2064: BRNZ	brnz  ,pt	%8,<label_0xa0001>
	.word 0xc6720009  ! 2067: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xe4120009  ! 2067: LDUH_R	lduh	[%r8 + %r9], %r18
	.word 0xc65a0009  ! 2067: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xce320009  ! 2070: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc81a0009  ! 2070: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xceb22714  ! 2070: STHA_I	stha	%r7, [%r8 + 0x0714] %asi
	.word 0xc8220009  ! 2073: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xda520009  ! 2073: LDSH_R	ldsh	[%r8 + %r9], %r13
	.word 0xfde22009  ! 2073: CASA_R	casa	[%r8] %asi, %r9, %r30
	.word 0xd6220009  ! 2076: STW_R	stw	%r11, [%r8 + %r9]
	.word 0xdf020009  ! 2076: LDF_R	ld	[%r8, %r9], %f15
	.word 0xea120009  ! 2076: LDUH_R	lduh	[%r8 + %r9], %r21
	.word 0xf1220009  ! 2079: STF_R	st	%f24, [%r9, %r8]
	.word 0xc85a0009  ! 2079: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xdcc21009  ! 2079: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r14
	.word 0xc2720009  ! 2082: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc6120009  ! 2082: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0x04800001  ! 2082: BLE	ble  	<label_0x1>
	.word 0xe4220009  ! 2085: STW_R	stw	%r18, [%r8 + %r9]
	.word 0xc6420009  ! 2085: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xca8a21c8  ! 2085: LDUBA_I	lduba	[%r8, + 0x01c8] %asi, %r5
	.word 0xda220009  ! 2088: STW_R	stw	%r13, [%r8 + %r9]
	.word 0xee5a0009  ! 2088: LDX_R	ldx	[%r8 + %r9], %r23
	.word 0xc5222b44  ! 2088: STF_I	st	%f2, [0x0b44, %r8]
	.word 0xce2a0009  ! 2091: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc2420009  ! 2091: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xc27a0009  ! 2091: SWAP_R	swap	%r1, [%r8 + %r9]
	.word 0xcc320009  ! 2094: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xcc0a0009  ! 2094: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xccfa2b88  ! 2094: SWAPA_I	swapa	%r6, [%r8 + 0x0b88] %asi
	.word 0xdc220009  ! 2097: STW_R	stw	%r14, [%r8 + %r9]
	.word 0xf0120009  ! 2097: LDUH_R	lduh	[%r8 + %r9], %r24
	.word 0x1c800001  ! 2097: BPOS	bpos  	<label_0x1>
	.word 0xc3220009  ! 2100: STF_R	st	%f1, [%r9, %r8]
	.word 0xce4a0009  ! 2100: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0x82f20009  ! 2100: UDIVcc_R	udivcc 	%r8, %r9, %r1
	.word 0xfd3a0009  ! 2103: STDF_R	std	%f30, [%r9, %r8]
	.word 0xce120009  ! 2103: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xc3ea2608  ! 2103: PREFETCHA_I	prefetcha	[%r8, + 0x0608] %asi, #one_read
	.word 0xcc320009  ! 2106: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc25a0009  ! 2106: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xccea2638  ! 2106: LDSTUBA_I	ldstuba	%r6, [%r8 + 0x0638] %asi
	.word 0xdb3a0009  ! 2109: STDF_R	std	%f13, [%r9, %r8]
	.word 0xda420009  ! 2109: LDSW_R	ldsw	[%r8 + %r9], %r13
	.word 0xcada1009  ! 2109: LDXA_R	ldxa	[%r8, %r9] 0x80, %r5
	.word 0xec720009  ! 2112: STX_R	stx	%r22, [%r8 + %r9]
	.word 0xf25a0009  ! 2112: LDX_R	ldx	[%r8 + %r9], %r25
	.word 0xc3220009  ! 2112: STF_R	st	%f1, [%r9, %r8]
	.word 0xc73a0009  ! 2115: STDF_R	std	%f3, [%r9, %r8]
	.word 0xf71a0009  ! 2115: LDDF_R	ldd	[%r8, %r9], %f27
	.word 0xc3ea2bd4  ! 2115: PREFETCHA_I	prefetcha	[%r8, + 0x0bd4] %asi, #one_read
	.word 0xcd220009  ! 2118: STF_R	st	%f6, [%r9, %r8]
	.word 0xe4520009  ! 2118: LDSH_R	ldsh	[%r8 + %r9], %r18
	.word 0xcaa22e3c  ! 2118: STWA_I	stwa	%r5, [%r8 + 0x0e3c] %asi
	.word 0xc4320009  ! 2121: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xde4a0009  ! 2121: LDSB_R	ldsb	[%r8 + %r9], %r15
	.word 0x26ca0001  ! 2121: BRLZ	brlz,a,pt	%8,<label_0xa0001>
	.word 0xcc720009  ! 2124: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xe4020009  ! 2124: LDUW_R	lduw	[%r8 + %r9], %r18
	.word 0xce4a0009  ! 2124: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xe4320009  ! 2127: STH_R	sth	%r18, [%r8 + %r9]
	.word 0xc4020009  ! 2127: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xb8da2178  ! 2127: SMULcc_I	smulcc 	%r8, 0x0178, %r28
	.word 0xc6220009  ! 2130: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc84a0009  ! 2130: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xc36a21cc  ! 2130: PREFETCH_I	prefetch	[%r8 + 0x01cc], #one_read
	.word 0xc73a0009  ! 2133: STDF_R	std	%f3, [%r9, %r8]
	.word 0xce420009  ! 2133: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xc3ea260c  ! 2133: PREFETCHA_I	prefetcha	[%r8, + 0x060c] %asi, #one_read
	.word 0xc82a0009  ! 2136: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xca420009  ! 2136: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0x9efa2468  ! 2136: SDIVcc_I	sdivcc 	%r8, 0x0468, %r15
	.word 0xce320009  ! 2139: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xcc5a0009  ! 2139: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xf2b21009  ! 2139: STHA_R	stha	%r25, [%r8 + %r9] 0x80
	.word 0xcc320009  ! 2142: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc8520009  ! 2142: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xce7a0009  ! 2142: SWAP_R	swap	%r7, [%r8 + %r9]
	.word 0xc9220009  ! 2145: STF_R	st	%f4, [%r9, %r8]
	.word 0xc4120009  ! 2145: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xc7e21009  ! 2145: CASA_I	casa	[%r8] 0x80, %r9, %r3
	.word 0xce320009  ! 2148: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xcf1a0009  ! 2148: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xccf22c10  ! 2148: STXA_I	stxa	%r6, [%r8 + 0x0c10] %asi
	.word 0xc4320009  ! 2151: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xda5a0009  ! 2151: LDX_R	ldx	[%r8 + %r9], %r13
	.word 0x8143c000  ! 2151: STBAR	stbar
	.word 0xcc320009  ! 2154: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc4120009  ! 2154: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xea6a2e40  ! 2154: LDSTUB_I	ldstub	%r21, [%r8 + 0x0e40]
	.word 0xcd3a0009  ! 2157: STDF_R	std	%f6, [%r9, %r8]
	.word 0xed1a0009  ! 2157: LDDF_R	ldd	[%r8, %r9], %f22
	.word 0xf27a0009  ! 2157: SWAP_R	swap	%r25, [%r8 + %r9]
	.word 0xca2a0009  ! 2160: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xcc1a0009  ! 2160: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xee8a1009  ! 2160: LDUBA_R	lduba	[%r8, %r9] 0x80, %r23
	.word 0xc22a0009  ! 2163: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc8020009  ! 2163: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0x24ca0001  ! 2163: BRLEZ	brlez,a,pt	%8,<label_0xa0001>
	.word 0xc5220009  ! 2166: STF_R	st	%f2, [%r9, %r8]
	.word 0xd8420009  ! 2166: LDSW_R	ldsw	[%r8 + %r9], %r12
	.word 0x8143c000  ! 2166: STBAR	stbar
	.word 0xf8320009  ! 2169: STH_R	sth	%r28, [%r8 + %r9]
	.word 0xce4a0009  ! 2169: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xc71a0009  ! 2169: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xce2a0009  ! 2172: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xea420009  ! 2172: LDSW_R	ldsw	[%r8 + %r9], %r21
	.word 0xf0aa27c8  ! 2172: STBA_I	stba	%r24, [%r8 + 0x07c8] %asi
	.word 0xdc320009  ! 2175: STH_R	sth	%r14, [%r8 + %r9]
	.word 0xcb020009  ! 2175: LDF_R	ld	[%r8, %r9], %f5
	.word 0xce4a2704  ! 2175: LDSB_I	ldsb	[%r8 + 0x0704], %r7
	.word 0xc33a0009  ! 2178: STDF_R	std	%f1, [%r9, %r8]
	.word 0xcc4a0009  ! 2178: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xe7f22009  ! 2178: CASXA_R	casxa	[%r8]%asi, %r9, %r19
	.word 0xfc720009  ! 2181: STX_R	stx	%r30, [%r8 + %r9]
	.word 0xfe4a0009  ! 2181: LDSB_R	ldsb	[%r8 + %r9], %r31
	.word 0xa2520009  ! 2181: UMUL_R	umul 	%r8, %r9, %r17
	.word 0xe42a0009  ! 2184: STB_R	stb	%r18, [%r8 + %r9]
	.word 0xf2020009  ! 2184: LDUW_R	lduw	[%r8 + %r9], %r25
	.word 0xca8a1009  ! 2184: LDUBA_R	lduba	[%r8, %r9] 0x80, %r5
	.word 0xcc720009  ! 2187: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xdc4a0009  ! 2187: LDSB_R	ldsb	[%r8 + %r9], %r14
	.word 0xc8ba21f0  ! 2187: STDA_I	stda	%r4, [%r8 + 0x01f0] %asi
	.word 0xcc720009  ! 2190: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc41a0009  ! 2190: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x8143e02e  ! 2190: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #MemIssue 
	.word 0xc3220009  ! 2193: STF_R	st	%f1, [%r9, %r8]
	.word 0xcd020009  ! 2193: LDF_R	ld	[%r8, %r9], %f6
	.word 0xc36a0009  ! 2193: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xe4220009  ! 2196: STW_R	stw	%r18, [%r8 + %r9]
	.word 0xef020009  ! 2196: LDF_R	ld	[%r8, %r9], %f23
	.word 0xea420009  ! 2196: LDSW_R	ldsw	[%r8 + %r9], %r21
	.word 0xc42a0009  ! 2199: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xce020009  ! 2199: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xc0ba1009  ! 2199: STDA_R	stda	%r0, [%r8 + %r9] 0x80
	.word 0xc33a0009  ! 2202: STDF_R	std	%f1, [%r9, %r8]
	.word 0xf0120009  ! 2202: LDUH_R	lduh	[%r8 + %r9], %r24
	.word 0xb6520009  ! 2202: UMUL_R	umul 	%r8, %r9, %r27
	.word 0xc6320009  ! 2205: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc2120009  ! 2205: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0x887a204c  ! 2205: SDIV_I	sdiv 	%r8, 0x004c, %r4
	.word 0xcc320009  ! 2208: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xce5a0009  ! 2208: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0x0cc20001  ! 2208: BRGZ	brgz  ,nt	%8,<label_0x20001>
	.word 0xdf3a0009  ! 2211: STDF_R	std	%f15, [%r9, %r8]
	.word 0xc4020009  ! 2211: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0x8143e000  ! 2211: MEMBAR	membar	
	.word 0xf2720009  ! 2214: STX_R	stx	%r25, [%r8 + %r9]
	.word 0xc8020009  ! 2214: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0x827a0009  ! 2214: SDIV_R	sdiv 	%r8, %r9, %r1
	.word 0xfe220009  ! 2217: STW_R	stw	%r31, [%r8 + %r9]
	.word 0xdd020009  ! 2217: LDF_R	ld	[%r8, %r9], %f14
	.word 0xc8ba2700  ! 2217: STDA_I	stda	%r4, [%r8 + 0x0700] %asi
	.word 0xc9220009  ! 2220: STF_R	st	%f4, [%r9, %r8]
	.word 0xc2520009  ! 2220: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xba7a276c  ! 2220: SDIV_I	sdiv 	%r8, 0x076c, %r29
	.word 0xc6220009  ! 2223: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc8420009  ! 2223: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xccf22160  ! 2223: STXA_I	stxa	%r6, [%r8 + 0x0160] %asi
	.word 0xfd220009  ! 2226: STF_R	st	%f30, [%r9, %r8]
	.word 0xc71a0009  ! 2226: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xefe22009  ! 2226: CASA_R	casa	[%r8] %asi, %r9, %r23
	.word 0xce720009  ! 2229: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xcc1a0009  ! 2229: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0x1c800001  ! 2229: BPOS	bpos  	<label_0x1>
	.word 0xf9220009  ! 2232: STF_R	st	%f28, [%r9, %r8]
	.word 0xe04a0009  ! 2232: LDSB_R	ldsb	[%r8 + %r9], %r16
	.word 0x896a2fa0  ! 2232: SDIVX_I	sdivx	%r8, 0x0fa0, %r4
	.word 0xc73a0009  ! 2235: STDF_R	std	%f3, [%r9, %r8]
	.word 0xfd020009  ! 2235: LDF_R	ld	[%r8, %r9], %f30
	.word 0x8143e079  ! 2235: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xf2220009  ! 2238: STW_R	stw	%r25, [%r8 + %r9]
	.word 0xf40a0009  ! 2238: LDUB_R	ldub	[%r8 + %r9], %r26
	.word 0x8143c000  ! 2238: STBAR	stbar
	.word 0xc8320009  ! 2241: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xca420009  ! 2241: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xf41a0009  ! 2241: LDD_R	ldd	[%r8 + %r9], %r26
	.word 0xce220009  ! 2244: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xfc0a0009  ! 2244: LDUB_R	ldub	[%r8 + %r9], %r30
	.word 0xcd3a0009  ! 2244: STDF_R	std	%f6, [%r9, %r8]
	.word 0xce2a0009  ! 2247: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xcc4a0009  ! 2247: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xe46a0009  ! 2247: LDSTUB_R	ldstub	%r18, [%r8 + %r9]
	.word 0xe6320009  ! 2250: STH_R	sth	%r19, [%r8 + %r9]
	.word 0xc8020009  ! 2250: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xf6da1009  ! 2250: LDXA_R	ldxa	[%r8, %r9] 0x80, %r27
	.word 0xd6720009  ! 2253: STX_R	stx	%r11, [%r8 + %r9]
	.word 0xc2420009  ! 2253: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0x83220009  ! 2253: MULScc_R	mulscc 	%r8, %r9, %r1
	.word 0xd6220009  ! 2256: STW_R	stw	%r11, [%r8 + %r9]
	.word 0xfc020009  ! 2256: LDUW_R	lduw	[%r8 + %r9], %r30
	.word 0x8143e02d  ! 2256: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #MemIssue 
	.word 0xc8220009  ! 2259: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xd8020009  ! 2259: LDUW_R	lduw	[%r8 + %r9], %r12
	.word 0xc36a0009  ! 2259: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xda320009  ! 2262: STH_R	sth	%r13, [%r8 + %r9]
	.word 0xcc4a0009  ! 2262: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0x8143e066  ! 2262: MEMBAR	membar	#StoreLoad | #LoadStore | #MemIssue | #Sync 
	.word 0xda2a0009  ! 2265: STB_R	stb	%r13, [%r8 + %r9]
	.word 0xce520009  ! 2265: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0x8143c000  ! 2265: STBAR	stbar
	.word 0xe0320009  ! 2268: STH_R	sth	%r16, [%r8 + %r9]
	.word 0xc24a0009  ! 2268: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xeb220009  ! 2268: STF_R	st	%f21, [%r9, %r8]
	.word 0xcc320009  ! 2271: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xe6120009  ! 2271: LDUH_R	lduh	[%r8 + %r9], %r19
	.word 0x8143c000  ! 2271: STBAR	stbar
	.word 0xec720009  ! 2274: STX_R	stx	%r22, [%r8 + %r9]
	.word 0xf20a0009  ! 2274: LDUB_R	ldub	[%r8 + %r9], %r25
	.word 0xc60a2fac  ! 2274: LDUB_I	ldub	[%r8 + 0x0fac], %r3
	.word 0xe82a0009  ! 2277: STB_R	stb	%r20, [%r8 + %r9]
	.word 0xc4420009  ! 2277: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0x8d220009  ! 2277: MULScc_R	mulscc 	%r8, %r9, %r6
	.word 0xc8320009  ! 2280: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc4520009  ! 2280: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0x836a27dc  ! 2280: SDIVX_I	sdivx	%r8, 0x07dc, %r1
	.word 0xcc720009  ! 2283: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xcc420009  ! 2283: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xb64a0009  ! 2283: MULX_R	mulx 	%r8, %r9, %r27
	.word 0xc73a0009  ! 2286: STDF_R	std	%f3, [%r9, %r8]
	.word 0xd7020009  ! 2286: LDF_R	ld	[%r8, %r9], %f11
	.word 0xce8a22ac  ! 2286: LDUBA_I	lduba	[%r8, + 0x02ac] %asi, %r7
	.word 0xcf220009  ! 2289: STF_R	st	%f7, [%r9, %r8]
	.word 0xce0a0009  ! 2289: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0x9cfa0009  ! 2289: SDIVcc_R	sdivcc 	%r8, %r9, %r14
	.word 0xcc220009  ! 2292: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xe81a0009  ! 2292: LDD_R	ldd	[%r8 + %r9], %r20
	.word 0xc2fa1009  ! 2292: SWAPA_R	swapa	%r1, [%r8 + %r9] 0x80
	.word 0xcb3a0009  ! 2295: STDF_R	std	%f5, [%r9, %r8]
	.word 0xc6520009  ! 2295: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xcdf22009  ! 2295: CASXA_R	casxa	[%r8]%asi, %r9, %r6
	.word 0xc8720009  ! 2298: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xe71a0009  ! 2298: LDDF_R	ldd	[%r8, %r9], %f19
	.word 0xc3e22009  ! 2298: CASA_R	casa	[%r8] %asi, %r9, %r1
	.word 0xcb220009  ! 2301: STF_R	st	%f5, [%r9, %r8]
	.word 0xcb020009  ! 2301: LDF_R	ld	[%r8, %r9], %f5
	.word 0xfd3a0009  ! 2301: STDF_R	std	%f30, [%r9, %r8]
	.word 0xff220009  ! 2304: STF_R	st	%f31, [%r9, %r8]
	.word 0xcd020009  ! 2304: LDF_R	ld	[%r8, %r9], %f6
	.word 0xc8ba1009  ! 2304: STDA_R	stda	%r4, [%r8 + %r9] 0x80
	.word 0xfe2a0009  ! 2307: STB_R	stb	%r31, [%r8 + %r9]
	.word 0xc91a0009  ! 2307: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0x8a4a0009  ! 2307: MULX_R	mulx 	%r8, %r9, %r5
	.word 0xc7220009  ! 2310: STF_R	st	%f3, [%r9, %r8]
	.word 0xea4a0009  ! 2310: LDSB_R	ldsb	[%r8 + %r9], %r21
	.word 0xe1020009  ! 2310: LDF_R	ld	[%r8, %r9], %f16
	.word 0xf13a0009  ! 2313: STDF_R	std	%f24, [%r9, %r8]
	.word 0xc6120009  ! 2313: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xccba2768  ! 2313: STDA_I	stda	%r6, [%r8 + 0x0768] %asi
	.word 0xcf220009  ! 2316: STF_R	st	%f7, [%r9, %r8]
	.word 0xcc420009  ! 2316: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xceaa2aa4  ! 2316: STBA_I	stba	%r7, [%r8 + 0x0aa4] %asi
	.word 0xcd220009  ! 2319: STF_R	st	%f6, [%r9, %r8]
	.word 0xea0a0009  ! 2319: LDUB_R	ldub	[%r8 + %r9], %r21
	.word 0x8143e04a  ! 2319: MEMBAR	membar	#StoreLoad | #StoreStore | #Sync 
	.word 0xca320009  ! 2322: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xfa0a0009  ! 2322: LDUB_R	ldub	[%r8 + %r9], %r29
	.word 0xf5020009  ! 2322: LDF_R	ld	[%r8, %r9], %f26
	.word 0xda320009  ! 2325: STH_R	sth	%r13, [%r8 + %r9]
	.word 0xf4020009  ! 2325: LDUW_R	lduw	[%r8 + %r9], %r26
	.word 0x0ec20001  ! 2325: BRGEZ	brgez  ,nt	%8,<label_0x20001>
	.word 0xce320009  ! 2328: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xcc520009  ! 2328: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0x82722b50  ! 2328: UDIV_I	udiv 	%r8, 0x0b50, %r1
	.word 0xf13a0009  ! 2331: STDF_R	std	%f24, [%r9, %r8]
	.word 0xc81a0009  ! 2331: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xfe4a2d60  ! 2331: LDSB_I	ldsb	[%r8 + 0x0d60], %r31
	.word 0xce220009  ! 2334: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc4420009  ! 2334: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0x846a2fb4  ! 2334: UDIVX_I	udivx 	%r8, 0x0fb4, %r2
	.word 0xc8720009  ! 2337: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc5020009  ! 2337: LDF_R	ld	[%r8, %r9], %f2
	.word 0x8143c000  ! 2337: STBAR	stbar
	.word 0xce220009  ! 2340: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xcc1a0009  ! 2340: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0x88520009  ! 2340: UMUL_R	umul 	%r8, %r9, %r4
	.word 0xd6220009  ! 2343: STW_R	stw	%r11, [%r8 + %r9]
	.word 0xce420009  ! 2343: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0x9e72230c  ! 2343: UDIV_I	udiv 	%r8, 0x030c, %r15
	.word 0xf4320009  ! 2346: STH_R	sth	%r26, [%r8 + %r9]
	.word 0xe6020009  ! 2346: LDUW_R	lduw	[%r8 + %r9], %r19
	.word 0x8143e072  ! 2346: MEMBAR	membar	#StoreLoad | #Lookaside | #MemIssue | #Sync 
	.word 0xf42a0009  ! 2349: STB_R	stb	%r26, [%r8 + %r9]
	.word 0xd6420009  ! 2349: LDSW_R	ldsw	[%r8 + %r9], %r11
	.word 0xc47a0009  ! 2349: SWAP_R	swap	%r2, [%r8 + %r9]
	.word 0xeb3a0009  ! 2352: STDF_R	std	%f21, [%r9, %r8]
	.word 0xc6520009  ! 2352: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xc8a21009  ! 2352: STWA_R	stwa	%r4, [%r8 + %r9] 0x80
	.word 0xca320009  ! 2355: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xca120009  ! 2355: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xec9a1009  ! 2355: LDDA_R	ldda	[%r8, %r9] 0x80, %r22
	.word 0xfc320009  ! 2358: STH_R	sth	%r30, [%r8 + %r9]
	.word 0xc6120009  ! 2358: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xc73a0009  ! 2358: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc22a0009  ! 2361: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc64a0009  ! 2361: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xc4a22504  ! 2361: STWA_I	stwa	%r2, [%r8 + 0x0504] %asi
	.word 0xc4720009  ! 2364: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xd6420009  ! 2364: LDSW_R	ldsw	[%r8 + %r9], %r11
	.word 0x83a20829  ! 2364: FADDs	fadds	%f8, %f9, %f1
	.word 0xfa220009  ! 2367: STW_R	stw	%r29, [%r8 + %r9]
	.word 0xfa5a0009  ! 2367: LDX_R	ldx	[%r8 + %r9], %r29
	.word 0x8b220009  ! 2367: MULScc_R	mulscc 	%r8, %r9, %r5
	.word 0xcd220009  ! 2370: STF_R	st	%f6, [%r9, %r8]
	.word 0xcd020009  ! 2370: LDF_R	ld	[%r8, %r9], %f6
	.word 0xc36a0009  ! 2370: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xca2a0009  ! 2373: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xef1a0009  ! 2373: LDDF_R	ldd	[%r8, %r9], %f23
	.word 0xc8ba2e28  ! 2373: STDA_I	stda	%r4, [%r8 + 0x0e28] %asi
	.word 0xd62a0009  ! 2376: STB_R	stb	%r11, [%r8 + %r9]
	.word 0xc31a0009  ! 2376: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xc4c21009  ! 2376: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r2
	.word 0xcb220009  ! 2379: STF_R	st	%f5, [%r9, %r8]
	.word 0xcf020009  ! 2379: LDF_R	ld	[%r8, %r9], %f7
	.word 0x8143c000  ! 2379: STBAR	stbar
	.word 0xc4220009  ! 2382: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc24a0009  ! 2382: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xb5a209a9  ! 2382: FDIVs	fdivs	%f8, %f9, %f26
	.word 0xfe220009  ! 2385: STW_R	stw	%r31, [%r8 + %r9]
	.word 0xe2020009  ! 2385: LDUW_R	lduw	[%r8 + %r9], %r17
	.word 0x8cd228b4  ! 2385: UMULcc_I	umulcc 	%r8, 0x08b4, %r6
	.word 0xe4720009  ! 2388: STX_R	stx	%r18, [%r8 + %r9]
	.word 0xc25a0009  ! 2388: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0x8e7a0009  ! 2388: SDIV_R	sdiv 	%r8, %r9, %r7
	.word 0xce220009  ! 2391: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xcd1a0009  ! 2391: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xfaf229b8  ! 2391: STXA_I	stxa	%r29, [%r8 + 0x09b8] %asi
	.word 0xc42a0009  ! 2394: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xeb020009  ! 2394: LDF_R	ld	[%r8, %r9], %f21
	.word 0x24c20001  ! 2394: BRLEZ	brlez,a,nt	%8,<label_0x20001>
	.word 0xca220009  ! 2397: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xce0a0009  ! 2397: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0x82720009  ! 2397: UDIV_R	udiv 	%r8, %r9, %r1
	.word 0xc62a0009  ! 2400: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xdc4a0009  ! 2400: LDSB_R	ldsb	[%r8 + %r9], %r14
	.word 0xeea223f0  ! 2400: STWA_I	stwa	%r23, [%r8 + 0x03f0] %asi
	.word 0xcf3a0009  ! 2403: STDF_R	std	%f7, [%r9, %r8]
	.word 0xda0a0009  ! 2403: LDUB_R	ldub	[%r8 + %r9], %r13
	.word 0x96d22cb8  ! 2403: UMULcc_I	umulcc 	%r8, 0x0cb8, %r11
	.word 0xc6220009  ! 2406: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xe25a0009  ! 2406: LDX_R	ldx	[%r8 + %r9], %r17
	.word 0x82da0009  ! 2406: SMULcc_R	smulcc 	%r8, %r9, %r1
	.word 0xcf220009  ! 2409: STF_R	st	%f7, [%r9, %r8]
	.word 0xff1a0009  ! 2409: LDDF_R	ldd	[%r8, %r9], %f31
	.word 0xca5226c8  ! 2409: LDSH_I	ldsh	[%r8 + 0x06c8], %r5
	.word 0xc42a0009  ! 2412: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xcc420009  ! 2412: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xcaea1009  ! 2412: LDSTUBA_R	ldstuba	%r5, [%r8 + %r9] 0x80
	.word 0xe0320009  ! 2415: STH_R	sth	%r16, [%r8 + %r9]
	.word 0xcc1a0009  ! 2415: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0x8143c000  ! 2415: STBAR	stbar
	.word 0xe7220009  ! 2418: STF_R	st	%f19, [%r9, %r8]
	.word 0xcc1a0009  ! 2418: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xc45a0009  ! 2418: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xca220009  ! 2421: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc31a0009  ! 2421: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0x0a800001  ! 2421: BCS	bcs  	<label_0x1>
	.word 0xfc220009  ! 2424: STW_R	stw	%r30, [%r8 + %r9]
	.word 0xce0a0009  ! 2424: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xdeb222a8  ! 2424: STHA_I	stha	%r15, [%r8 + 0x02a8] %asi
	.word 0xc53a0009  ! 2427: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc44a0009  ! 2427: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0x88fa0009  ! 2427: SDIVcc_R	sdivcc 	%r8, %r9, %r4
	.word 0xce320009  ! 2430: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc9020009  ! 2430: LDF_R	ld	[%r8, %r9], %f4
	.word 0xce921009  ! 2430: LDUHA_R	lduha	[%r8, %r9] 0x80, %r7
	.word 0xf4720009  ! 2433: STX_R	stx	%r26, [%r8 + %r9]
	.word 0xf20a0009  ! 2433: LDUB_R	ldub	[%r8 + %r9], %r25
	.word 0xc8ea1009  ! 2433: LDSTUBA_R	ldstuba	%r4, [%r8 + %r9] 0x80
	.word 0xc2720009  ! 2436: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xec4a0009  ! 2436: LDSB_R	ldsb	[%r8 + %r9], %r22
	.word 0xcaea2f7c  ! 2436: LDSTUBA_I	ldstuba	%r5, [%r8 + 0x0f7c] %asi
	.word 0xc73a0009  ! 2439: STDF_R	std	%f3, [%r9, %r8]
	.word 0xff1a0009  ! 2439: LDDF_R	ldd	[%r8, %r9], %f31
	.word 0x8c4a233c  ! 2439: MULX_I	mulx 	%r8, 0x033c, %r6
	.word 0xc2720009  ! 2442: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xee420009  ! 2442: LDSW_R	ldsw	[%r8 + %r9], %r23
	.word 0xf2b22394  ! 2442: STHA_I	stha	%r25, [%r8 + 0x0394] %asi
	.word 0xc8220009  ! 2445: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xdf020009  ! 2445: LDF_R	ld	[%r8, %r9], %f15
	.word 0x8143e075  ! 2445: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside | #MemIssue | #Sync 
	.word 0xed3a0009  ! 2448: STDF_R	std	%f22, [%r9, %r8]
	.word 0xe6420009  ! 2448: LDSW_R	ldsw	[%r8 + %r9], %r19
	.word 0x856a0009  ! 2448: SDIVX_R	sdivx	%r8, %r9, %r2
	.word 0xc53a0009  ! 2451: STDF_R	std	%f2, [%r9, %r8]
	.word 0xd81a0009  ! 2451: LDD_R	ldd	[%r8 + %r9], %r12
	.word 0xfb222d78  ! 2451: STF_I	st	%f29, [0x0d78, %r8]
	.word 0xc6720009  ! 2454: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc8420009  ! 2454: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0x34800002  ! 2454: BG	bg,a	<label_0x2>
	.word 0xc6320009  ! 2457: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xcd020009  ! 2457: LDF_R	ld	[%r8, %r9], %f6
	.word 0xc67a0009  ! 2457: SWAP_R	swap	%r3, [%r8 + %r9]
	.word 0xc8720009  ! 2460: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xce4a0009  ! 2460: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xc36a294c  ! 2460: PREFETCH_I	prefetch	[%r8 + 0x094c], #one_read
	.word 0xf02a0009  ! 2463: STB_R	stb	%r24, [%r8 + %r9]
	.word 0xc7020009  ! 2463: LDF_R	ld	[%r8, %r9], %f3
	.word 0xd8ea1009  ! 2463: LDSTUBA_R	ldstuba	%r12, [%r8 + %r9] 0x80
	.word 0xdc2a0009  ! 2466: STB_R	stb	%r14, [%r8 + %r9]
	.word 0xee420009  ! 2466: LDSW_R	ldsw	[%r8 + %r9], %r23
	.word 0xea5a2028  ! 2466: LDX_I	ldx	[%r8 + 0x0028], %r21
	.word 0xce320009  ! 2469: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xe8520009  ! 2469: LDSH_R	ldsh	[%r8 + %r9], %r20
	.word 0x8c6a0009  ! 2469: UDIVX_R	udivx 	%r8, %r9, %r6
	.word 0xe62a0009  ! 2472: STB_R	stb	%r19, [%r8 + %r9]
	.word 0xc6120009  ! 2472: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0x8143e03e  ! 2472: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0xfc2a0009  ! 2475: STB_R	stb	%r30, [%r8 + %r9]
	.word 0xdc1a0009  ! 2475: LDD_R	ldd	[%r8 + %r9], %r14
	.word 0xfb3a2218  ! 2475: STDF_I	std	%f29, [0x0218, %r8]
	.word 0xcb3a0009  ! 2478: STDF_R	std	%f5, [%r9, %r8]
	.word 0xcc120009  ! 2478: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0x8143c000  ! 2478: STBAR	stbar
	.word 0xc2220009  ! 2481: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xf5020009  ! 2481: LDF_R	ld	[%r8, %r9], %f26
	.word 0xc3ea1009  ! 2481: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xee320009  ! 2484: STH_R	sth	%r23, [%r8 + %r9]
	.word 0xd91a0009  ! 2484: LDDF_R	ldd	[%r8, %r9], %f12
	.word 0xdc9a27f0  ! 2484: LDDA_I	ldda	[%r8, + 0x07f0] %asi, %r14
	.word 0xe33a0009  ! 2487: STDF_R	std	%f17, [%r9, %r8]
	.word 0xc01a0009  ! 2487: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0xe802291c  ! 2487: LDUW_I	lduw	[%r8 + 0x091c], %r20
	.word 0xec320009  ! 2490: STH_R	sth	%r22, [%r8 + %r9]
	.word 0xc45a0009  ! 2490: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xfaea2338  ! 2490: LDSTUBA_I	ldstuba	%r29, [%r8 + 0x0338] %asi
	.word 0xf0320009  ! 2493: STH_R	sth	%r24, [%r8 + %r9]
	.word 0xc5020009  ! 2493: LDF_R	ld	[%r8, %r9], %f2
	.word 0xcf3a2058  ! 2493: STDF_I	std	%f7, [0x0058, %r8]
	.word 0xc93a0009  ! 2496: STDF_R	std	%f4, [%r9, %r8]
	.word 0xce5a0009  ! 2496: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xc3ea1009  ! 2496: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc2220009  ! 2499: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xfa0a0009  ! 2499: LDUB_R	ldub	[%r8 + %r9], %r29
	.word 0x8143e037  ! 2499: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside | #MemIssue 
	.word 0xf82a0009  ! 2502: STB_R	stb	%r28, [%r8 + %r9]
	.word 0xfc4a0009  ! 2502: LDSB_R	ldsb	[%r8 + %r9], %r30
	.word 0xc7e21009  ! 2502: CASA_I	casa	[%r8] 0x80, %r9, %r3
	.word 0xda220009  ! 2505: STW_R	stw	%r13, [%r8 + %r9]
	.word 0xce0a0009  ! 2505: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xc48a2b90  ! 2505: LDUBA_I	lduba	[%r8, + 0x0b90] %asi, %r2
	.word 0xcf3a0009  ! 2508: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc4020009  ! 2508: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xccc22698  ! 2508: LDSWA_I	ldswa	[%r8, + 0x0698] %asi, %r6
	.word 0xc33a0009  ! 2511: STDF_R	std	%f1, [%r9, %r8]
	.word 0xca520009  ! 2511: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0x14800001  ! 2511: BG	bg  	<label_0x1>
	.word 0xec2a0009  ! 2514: STB_R	stb	%r22, [%r8 + %r9]
	.word 0xcc120009  ! 2514: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0x86720009  ! 2514: UDIV_R	udiv 	%r8, %r9, %r3
	.word 0xcc220009  ! 2517: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xea020009  ! 2517: LDUW_R	lduw	[%r8 + %r9], %r21
	.word 0x85a209a9  ! 2517: FDIVs	fdivs	%f8, %f9, %f2
	.word 0xf1220009  ! 2520: STF_R	st	%f24, [%r9, %r8]
	.word 0xc60a0009  ! 2520: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xb8520009  ! 2520: UMUL_R	umul 	%r8, %r9, %r28
	.word 0xc93a0009  ! 2523: STDF_R	std	%f4, [%r9, %r8]
	.word 0xc65a0009  ! 2523: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xc60a0009  ! 2523: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xc4220009  ! 2526: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xe4120009  ! 2526: LDUH_R	lduh	[%r8 + %r9], %r18
	.word 0xceea22cc  ! 2526: LDSTUBA_I	ldstuba	%r7, [%r8 + 0x02cc] %asi
	.word 0xe2220009  ! 2529: STW_R	stw	%r17, [%r8 + %r9]
	.word 0xd6020009  ! 2529: LDUW_R	lduw	[%r8 + %r9], %r11
	.word 0x8f220009  ! 2529: MULScc_R	mulscc 	%r8, %r9, %r7
	.word 0xce220009  ! 2532: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xcf020009  ! 2532: LDF_R	ld	[%r8, %r9], %f7
	.word 0xcad22b48  ! 2532: LDSHA_I	ldsha	[%r8, + 0x0b48] %asi, %r5
	.word 0xc6720009  ! 2535: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xca420009  ! 2535: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xc8b221a0  ! 2535: STHA_I	stha	%r4, [%r8 + 0x01a0] %asi
	.word 0xcb220009  ! 2538: STF_R	st	%f5, [%r9, %r8]
	.word 0xc6520009  ! 2538: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0x8c5a29d4  ! 2538: SMUL_I	smul 	%r8, 0x09d4, %r6
	.word 0xca220009  ! 2541: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc8120009  ! 2541: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0x8a5a0009  ! 2541: SMUL_R	smul 	%r8, %r9, %r5
	.word 0xc9220009  ! 2544: STF_R	st	%f4, [%r9, %r8]
	.word 0xca5a0009  ! 2544: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xcc9a1009  ! 2544: LDDA_R	ldda	[%r8, %r9] 0x80, %r6
	.word 0xc4720009  ! 2547: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xcf020009  ! 2547: LDF_R	ld	[%r8, %r9], %f7
	.word 0xeea22f04  ! 2547: STWA_I	stwa	%r23, [%r8 + 0x0f04] %asi
	.word 0xc6220009  ! 2550: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xde0a0009  ! 2550: LDUB_R	ldub	[%r8 + %r9], %r15
	.word 0xce8226c0  ! 2550: LDUWA_I	lduwa	[%r8, + 0x06c0] %asi, %r7
	.word 0xc2320009  ! 2553: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc20a0009  ! 2553: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xc6a21009  ! 2553: STWA_R	stwa	%r3, [%r8 + %r9] 0x80
	.word 0xf8220009  ! 2556: STW_R	stw	%r28, [%r8 + %r9]
	.word 0xe3020009  ! 2556: LDF_R	ld	[%r8, %r9], %f17
	.word 0xccfa1009  ! 2556: SWAPA_R	swapa	%r6, [%r8 + %r9] 0x80
	.word 0xc8720009  ! 2559: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xce4a0009  ! 2559: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xcff21009  ! 2559: CASXA_I	casxa	[%r8] 0x80, %r9, %r7
	.word 0xcd220009  ! 2562: STF_R	st	%f6, [%r9, %r8]
	.word 0xcc5a0009  ! 2562: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xca420009  ! 2562: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xc33a0009  ! 2565: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc44a0009  ! 2565: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xc36a28f0  ! 2565: PREFETCH_I	prefetch	[%r8 + 0x08f0], #one_read
	.word 0xc6320009  ! 2568: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xe2020009  ! 2568: LDUW_R	lduw	[%r8 + %r9], %r17
	.word 0x8143c000  ! 2568: STBAR	stbar
	.word 0xfd220009  ! 2571: STF_R	st	%f30, [%r9, %r8]
	.word 0xf71a0009  ! 2571: LDDF_R	ldd	[%r8, %r9], %f27
	.word 0x8143e051  ! 2571: MEMBAR	membar	#LoadLoad | #Lookaside | #Sync 
	.word 0xce2a0009  ! 2574: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xcd1a0009  ! 2574: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0x8c7a28d8  ! 2574: SDIV_I	sdiv 	%r8, 0x08d8, %r6
	.word 0xcb220009  ! 2577: STF_R	st	%f5, [%r9, %r8]
	.word 0xce4a0009  ! 2577: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0x1a800001  ! 2577: BCC	bcc  	<label_0x1>
	.word 0xc8220009  ! 2580: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xf24a0009  ! 2580: LDSB_R	ldsb	[%r8 + %r9], %r25
	.word 0xc6ea2058  ! 2580: LDSTUBA_I	ldstuba	%r3, [%r8 + 0x0058] %asi
	.word 0xfc220009  ! 2583: STW_R	stw	%r30, [%r8 + %r9]
	.word 0xf6120009  ! 2583: LDUH_R	lduh	[%r8 + %r9], %r27
	.word 0x36800001  ! 2583: BGE	bge,a	<label_0x1>
	.word 0xcf220009  ! 2586: STF_R	st	%f7, [%r9, %r8]
	.word 0xe8020009  ! 2586: LDUW_R	lduw	[%r8 + %r9], %r20
	.word 0xb1a209a9  ! 2586: FDIVs	fdivs	%f8, %f9, %f24
	.word 0xc42a0009  ! 2589: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xf64a0009  ! 2589: LDSB_R	ldsb	[%r8 + %r9], %r27
	.word 0xcaf22bd0  ! 2589: STXA_I	stxa	%r5, [%r8 + 0x0bd0] %asi
	.word 0xe33a0009  ! 2592: STDF_R	std	%f17, [%r9, %r8]
	.word 0xc6520009  ! 2592: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xa5a20929  ! 2592: FMULs	fmuls	%f8, %f9, %f18
	.word 0xce2a0009  ! 2595: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc9020009  ! 2595: LDF_R	ld	[%r8, %r9], %f4
	.word 0x83222d98  ! 2595: MULScc_I	mulscc 	%r8, 0x0d98, %r1
	.word 0xdc320009  ! 2598: STH_R	sth	%r14, [%r8 + %r9]
	.word 0xf0020009  ! 2598: LDUW_R	lduw	[%r8 + %r9], %r24
	.word 0x1c800001  ! 2598: BPOS	bpos  	<label_0x1>
	.word 0xc3220009  ! 2601: STF_R	st	%f1, [%r9, %r8]
	.word 0xca420009  ! 2601: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xe8821009  ! 2601: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r20
	.word 0xda320009  ! 2604: STH_R	sth	%r13, [%r8 + %r9]
	.word 0xdc420009  ! 2604: LDSW_R	ldsw	[%r8 + %r9], %r14
	.word 0x32800002  ! 2604: BNE	bne,a	<label_0x2>
	.word 0xc6220009  ! 2607: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xcf020009  ! 2607: LDF_R	ld	[%r8, %r9], %f7
	.word 0xcc822e50  ! 2607: LDUWA_I	lduwa	[%r8, + 0x0e50] %asi, %r6
	.word 0xea2a0009  ! 2610: STB_R	stb	%r21, [%r8 + %r9]
	.word 0xd91a0009  ! 2610: LDDF_R	ldd	[%r8, %r9], %f12
	.word 0x82fa0009  ! 2610: SDIVcc_R	sdivcc 	%r8, %r9, %r1
	.word 0xca2a0009  ! 2613: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xce5a0009  ! 2613: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xcca22450  ! 2613: STWA_I	stwa	%r6, [%r8 + 0x0450] %asi
	.word 0xc7220009  ! 2616: STF_R	st	%f3, [%r9, %r8]
	.word 0xc2420009  ! 2616: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0x98f20009  ! 2616: UDIVcc_R	udivcc 	%r8, %r9, %r12
	.word 0xc73a0009  ! 2619: STDF_R	std	%f3, [%r9, %r8]
	.word 0xdc520009  ! 2619: LDSH_R	ldsh	[%r8 + %r9], %r14
	.word 0x8143e046  ! 2619: MEMBAR	membar	#StoreLoad | #LoadStore | #Sync 
	.word 0xe8720009  ! 2622: STX_R	stx	%r20, [%r8 + %r9]
	.word 0xc4120009  ! 2622: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xc4922334  ! 2622: LDUHA_I	lduha	[%r8, + 0x0334] %asi, %r2
	.word 0xd6220009  ! 2625: STW_R	stw	%r11, [%r8 + %r9]
	.word 0xe6420009  ! 2625: LDSW_R	ldsw	[%r8 + %r9], %r19
	.word 0xc6520009  ! 2625: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xc4320009  ! 2628: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xe24a0009  ! 2628: LDSB_R	ldsb	[%r8 + %r9], %r17
	.word 0xcc9a1009  ! 2628: LDDA_R	ldda	[%r8, %r9] 0x80, %r6
	.word 0xc82a0009  ! 2631: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xea5a0009  ! 2631: LDX_R	ldx	[%r8 + %r9], %r21
	.word 0xe4ea1009  ! 2631: LDSTUBA_R	ldstuba	%r18, [%r8 + %r9] 0x80
	.word 0xc42a0009  ! 2634: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xca420009  ! 2634: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0x8da20929  ! 2634: FMULs	fmuls	%f8, %f9, %f6
	.word 0xcc2a0009  ! 2637: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xe65a0009  ! 2637: LDX_R	ldx	[%r8 + %r9], %r19
	.word 0xc2c21009  ! 2637: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r1
	.word 0xc82a0009  ! 2640: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xca420009  ! 2640: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xc9f21009  ! 2640: CASXA_I	casxa	[%r8] 0x80, %r9, %r4
	.word 0xc2220009  ! 2643: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xcc520009  ! 2643: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0x1c800001  ! 2643: BPOS	bpos  	<label_0x1>
	.word 0xc3220009  ! 2646: STF_R	st	%f1, [%r9, %r8]
	.word 0xca120009  ! 2646: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xfc0a0009  ! 2646: LDUB_R	ldub	[%r8 + %r9], %r30
	.word 0xc2320009  ! 2649: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc31a0009  ! 2649: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xa8720009  ! 2649: UDIV_R	udiv 	%r8, %r9, %r20
	.word 0xcb220009  ! 2652: STF_R	st	%f5, [%r9, %r8]
	.word 0xc2020009  ! 2652: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xc26a0009  ! 2652: LDSTUB_R	ldstub	%r1, [%r8 + %r9]
	.word 0xce220009  ! 2655: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc6120009  ! 2655: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xf33a29d0  ! 2655: STDF_I	std	%f25, [0x09d0, %r8]
	.word 0xc82a0009  ! 2658: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xcc420009  ! 2658: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0x8143e02e  ! 2658: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #MemIssue 
	.word 0xc53a0009  ! 2661: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc51a0009  ! 2661: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0x88f20009  ! 2661: UDIVcc_R	udivcc 	%r8, %r9, %r4
	.word 0xe2720009  ! 2664: STX_R	stx	%r17, [%r8 + %r9]
	.word 0xc64a0009  ! 2664: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xc81a20d8  ! 2664: LDD_I	ldd	[%r8 + 0x00d8], %r4
	.word 0xce720009  ! 2667: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xcc1a0009  ! 2667: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0x985a0009  ! 2667: SMUL_R	smul 	%r8, %r9, %r12
	.word 0xc8320009  ! 2670: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xf91a0009  ! 2670: LDDF_R	ldd	[%r8, %r9], %f28
	.word 0xcaea2b0c  ! 2670: LDSTUBA_I	ldstuba	%r5, [%r8 + 0x0b0c] %asi
	.word 0xe7220009  ! 2673: STF_R	st	%f19, [%r9, %r8]
	.word 0xce4a0009  ! 2673: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0x0a800001  ! 2673: BCS	bcs  	<label_0x1>
	.word 0xc8320009  ! 2676: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xf40a0009  ! 2676: LDUB_R	ldub	[%r8 + %r9], %r26
	.word 0xc2120009  ! 2676: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xca2a0009  ! 2679: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc4020009  ! 2679: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0x8c4a267c  ! 2679: MULX_I	mulx 	%r8, 0x067c, %r6
	.word 0xec220009  ! 2682: STW_R	stw	%r22, [%r8 + %r9]
	.word 0xe71a0009  ! 2682: LDDF_R	ldd	[%r8, %r9], %f19
	.word 0x2ac20001  ! 2682: BRNZ	brnz,a,nt	%8,<label_0x20001>
	.word 0xc22a0009  ! 2685: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xfa520009  ! 2685: LDSH_R	ldsh	[%r8 + %r9], %r29
	.word 0xc4aa1009  ! 2685: STBA_R	stba	%r2, [%r8 + %r9] 0x80
	.word 0xe73a0009  ! 2688: STDF_R	std	%f19, [%r9, %r8]
	.word 0xc01a0009  ! 2688: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0xccfa1009  ! 2688: SWAPA_R	swapa	%r6, [%r8 + %r9] 0x80
	.word 0xc62a0009  ! 2691: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc81a0009  ! 2691: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xb2522288  ! 2691: UMUL_I	umul 	%r8, 0x0288, %r25
	.word 0xc33a0009  ! 2694: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc81a0009  ! 2694: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xc3ea1009  ! 2694: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc2320009  ! 2697: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xec120009  ! 2697: LDUH_R	lduh	[%r8 + %r9], %r22
	.word 0xcb3a0009  ! 2697: STDF_R	std	%f5, [%r9, %r8]
	.word 0xe93a0009  ! 2700: STDF_R	std	%f20, [%r9, %r8]
	.word 0xc41a0009  ! 2700: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xc4ea1009  ! 2700: LDSTUBA_R	ldstuba	%r2, [%r8 + %r9] 0x80
	.word 0xe22a0009  ! 2703: STB_R	stb	%r17, [%r8 + %r9]
	.word 0xe60a0009  ! 2703: LDUB_R	ldub	[%r8 + %r9], %r19
	.word 0x8c6a2d3c  ! 2703: UDIVX_I	udivx 	%r8, 0x0d3c, %r6
	.word 0xc82a0009  ! 2706: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xf65a0009  ! 2706: LDX_R	ldx	[%r8 + %r9], %r27
	.word 0xc93a0009  ! 2706: STDF_R	std	%f4, [%r9, %r8]
	.word 0xd8220009  ! 2709: STW_R	stw	%r12, [%r8 + %r9]
	.word 0xc81a0009  ! 2709: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xc3220009  ! 2709: STF_R	st	%f1, [%r9, %r8]
	.word 0xed3a0009  ! 2712: STDF_R	std	%f22, [%r9, %r8]
	.word 0xc2420009  ! 2712: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xac4a0009  ! 2712: MULX_R	mulx 	%r8, %r9, %r22
	.word 0xcb3a0009  ! 2715: STDF_R	std	%f5, [%r9, %r8]
	.word 0xc64a0009  ! 2715: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xccb21009  ! 2715: STHA_R	stha	%r6, [%r8 + %r9] 0x80
	.word 0xf8720009  ! 2718: STX_R	stx	%r28, [%r8 + %r9]
	.word 0xce0a0009  ! 2718: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xc3ea22b0  ! 2718: PREFETCHA_I	prefetcha	[%r8, + 0x02b0] %asi, #one_read
	.word 0xce320009  ! 2721: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xcc4a0009  ! 2721: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xfeda1009  ! 2721: LDXA_R	ldxa	[%r8, %r9] 0x80, %r31
	.word 0xc6720009  ! 2724: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xcd1a0009  ! 2724: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0x22c20001  ! 2724: BRZ	brz,a,nt	%8,<label_0x20001>
	.word 0xca720009  ! 2727: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc2020009  ! 2727: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0x8b220009  ! 2727: MULScc_R	mulscc 	%r8, %r9, %r5
	.word 0xc33a0009  ! 2730: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc2420009  ! 2730: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xe6ca1009  ! 2730: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r19
	.word 0xcc2a0009  ! 2733: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc25a0009  ! 2733: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0x88720009  ! 2733: UDIV_R	udiv 	%r8, %r9, %r4
	.word 0xc4720009  ! 2736: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xdf020009  ! 2736: LDF_R	ld	[%r8, %r9], %f15
	.word 0xc8a22b2c  ! 2736: STWA_I	stwa	%r4, [%r8 + 0x0b2c] %asi
	.word 0xe0220009  ! 2739: STW_R	stw	%r16, [%r8 + %r9]
	.word 0xd91a0009  ! 2739: LDDF_R	ldd	[%r8, %r9], %f12
	.word 0xcb3a0009  ! 2739: STDF_R	std	%f5, [%r9, %r8]
	.word 0xf5220009  ! 2742: STF_R	st	%f26, [%r9, %r8]
	.word 0xc41a0009  ! 2742: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xc91a0009  ! 2742: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xff3a0009  ! 2745: STDF_R	std	%f31, [%r9, %r8]
	.word 0xe2020009  ! 2745: LDUW_R	lduw	[%r8 + %r9], %r17
	.word 0x8143e048  ! 2745: MEMBAR	membar	#StoreStore | #Sync 
	.word 0xcc2a0009  ! 2748: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc8520009  ! 2748: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0x26ca0001  ! 2748: BRLZ	brlz,a,pt	%8,<label_0xa0001>
	.word 0xe82a0009  ! 2751: STB_R	stb	%r20, [%r8 + %r9]
	.word 0xc3020009  ! 2751: LDF_R	ld	[%r8, %r9], %f1
	.word 0x8a722168  ! 2751: UDIV_I	udiv 	%r8, 0x0168, %r5
	.word 0xce2a0009  ! 2754: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xce020009  ! 2754: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0x8143e01c  ! 2754: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside 
	.word 0xfe220009  ! 2757: STW_R	stw	%r31, [%r8 + %r9]
	.word 0xc8120009  ! 2757: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xdeda29e8  ! 2757: LDXA_I	ldxa	[%r8, + 0x09e8] %asi, %r15
	.word 0xc4220009  ! 2760: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xcc520009  ! 2760: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xc3ea2628  ! 2760: PREFETCHA_I	prefetcha	[%r8, + 0x0628] %asi, #one_read
	.word 0xc93a0009  ! 2763: STDF_R	std	%f4, [%r9, %r8]
	.word 0xc41a0009  ! 2763: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x8143c000  ! 2763: STBAR	stbar
	.word 0xf7220009  ! 2766: STF_R	st	%f27, [%r9, %r8]
	.word 0xcc4a0009  ! 2766: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xfad21009  ! 2766: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r29
	.word 0xec220009  ! 2769: STW_R	stw	%r22, [%r8 + %r9]
	.word 0xcb1a0009  ! 2769: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xfeca29ac  ! 2769: LDSBA_I	ldsba	[%r8, + 0x09ac] %asi, %r31
	.word 0xcf3a0009  ! 2772: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc2420009  ! 2772: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0x84fa0009  ! 2772: SDIVcc_R	sdivcc 	%r8, %r9, %r2
	.word 0xd7220009  ! 2775: STF_R	st	%f11, [%r9, %r8]
	.word 0xd65a0009  ! 2775: LDX_R	ldx	[%r8 + %r9], %r11
	.word 0xc4ba1009  ! 2775: STDA_R	stda	%r2, [%r8 + %r9] 0x80
	.word 0xd8320009  ! 2778: STH_R	sth	%r12, [%r8 + %r9]
	.word 0xf2020009  ! 2778: LDUW_R	lduw	[%r8 + %r9], %r25
	.word 0xcb3a2e58  ! 2778: STDF_I	std	%f5, [0x0e58, %r8]
	.word 0xc42a0009  ! 2781: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xcf1a0009  ! 2781: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xc41a0009  ! 2781: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xc93a0009  ! 2784: STDF_R	std	%f4, [%r9, %r8]
	.word 0xf1020009  ! 2784: LDF_R	ld	[%r8, %r9], %f24
	.word 0xa5222aac  ! 2784: MULScc_I	mulscc 	%r8, 0x0aac, %r18
	.word 0xcc220009  ! 2787: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc4420009  ! 2787: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0x8afa27f0  ! 2787: SDIVcc_I	sdivcc 	%r8, 0x07f0, %r5
	.word 0xce220009  ! 2790: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc65a0009  ! 2790: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xae7a0009  ! 2790: SDIV_R	sdiv 	%r8, %r9, %r23
	.word 0xc4320009  ! 2793: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc41a0009  ! 2793: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x2cc20001  ! 2793: BRGZ	brgz,a,nt	%8,<label_0x20001>
	.word 0xca2a0009  ! 2796: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc20a0009  ! 2796: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0x8143e01f  ! 2796: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #Lookaside 
	.word 0xc6220009  ! 2799: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xee520009  ! 2799: LDSH_R	ldsh	[%r8 + %r9], %r23
	.word 0xcaca1009  ! 2799: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r5
	.word 0xd6320009  ! 2802: STH_R	sth	%r11, [%r8 + %r9]
	.word 0xee420009  ! 2802: LDSW_R	ldsw	[%r8 + %r9], %r23
	.word 0xc7f22009  ! 2802: CASXA_R	casxa	[%r8]%asi, %r9, %r3
	.word 0xd7220009  ! 2805: STF_R	st	%f11, [%r9, %r8]
	.word 0xea120009  ! 2805: LDUH_R	lduh	[%r8 + %r9], %r21
	.word 0x8143e03f  ! 2805: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0xcb220009  ! 2808: STF_R	st	%f5, [%r9, %r8]
	.word 0xc51a0009  ! 2808: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xc36a0009  ! 2808: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xe2320009  ! 2811: STH_R	sth	%r17, [%r8 + %r9]
	.word 0xca4a0009  ! 2811: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xc68a1009  ! 2811: LDUBA_R	lduba	[%r8, %r9] 0x80, %r3
	.word 0xe2320009  ! 2814: STH_R	sth	%r17, [%r8 + %r9]
	.word 0xca020009  ! 2814: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xc2ea2970  ! 2814: LDSTUBA_I	ldstuba	%r1, [%r8 + 0x0970] %asi
	.word 0xc62a0009  ! 2817: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc81a0009  ! 2817: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x8143c000  ! 2817: STBAR	stbar
	.word 0xcc720009  ! 2820: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xf91a0009  ! 2820: LDDF_R	ldd	[%r8, %r9], %f28
	.word 0xe8921009  ! 2820: LDUHA_R	lduha	[%r8, %r9] 0x80, %r20
	.word 0xcc320009  ! 2823: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xce120009  ! 2823: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xc8d21009  ! 2823: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r4
	.word 0xc93a0009  ! 2826: STDF_R	std	%f4, [%r9, %r8]
	.word 0xca5a0009  ! 2826: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xc9f22009  ! 2826: CASXA_R	casxa	[%r8]%asi, %r9, %r4
	.word 0xf0220009  ! 2829: STW_R	stw	%r24, [%r8 + %r9]
	.word 0xcb020009  ! 2829: LDF_R	ld	[%r8, %r9], %f5
	.word 0xc9e22009  ! 2829: CASA_R	casa	[%r8] %asi, %r9, %r4
	.word 0xc4320009  ! 2832: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xf0020009  ! 2832: LDUW_R	lduw	[%r8 + %r9], %r24
	.word 0xb8f20009  ! 2832: UDIVcc_R	udivcc 	%r8, %r9, %r28
	.word 0xed3a0009  ! 2835: STDF_R	std	%f22, [%r9, %r8]
	.word 0xc40a0009  ! 2835: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0x82d225ac  ! 2835: UMULcc_I	umulcc 	%r8, 0x05ac, %r1
	.word 0xf8320009  ! 2838: STH_R	sth	%r28, [%r8 + %r9]
	.word 0xea0a0009  ! 2838: LDUB_R	ldub	[%r8 + %r9], %r21
	.word 0xc2f21009  ! 2838: STXA_R	stxa	%r1, [%r8 + %r9] 0x80
	.word 0xdb220009  ! 2841: STF_R	st	%f13, [%r9, %r8]
	.word 0xcc4a0009  ! 2841: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xb6fa2660  ! 2841: SDIVcc_I	sdivcc 	%r8, 0x0660, %r27
	.word 0xce720009  ! 2844: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xef1a0009  ! 2844: LDDF_R	ldd	[%r8, %r9], %f23
	.word 0xae5a0009  ! 2844: SMUL_R	smul 	%r8, %r9, %r23
	.word 0xc93a0009  ! 2847: STDF_R	std	%f4, [%r9, %r8]
	.word 0xf6520009  ! 2847: LDSH_R	ldsh	[%r8 + %r9], %r27
	.word 0x8143e06c  ! 2847: MEMBAR	membar	#LoadStore | #StoreStore | #MemIssue | #Sync 
	.word 0xcc2a0009  ! 2850: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc91a0009  ! 2850: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xd6fa1009  ! 2850: SWAPA_R	swapa	%r11, [%r8 + %r9] 0x80
	.word 0xc53a0009  ! 2853: STDF_R	std	%f2, [%r9, %r8]
	.word 0xf44a0009  ! 2853: LDSB_R	ldsb	[%r8 + %r9], %r26
	.word 0x3e800002  ! 2853: BVC	bvc,a	<label_0x2>
	.word 0xc6720009  ! 2856: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xcc1a0009  ! 2856: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0x02800001  ! 2856: BE	be  	<label_0x1>
	.word 0xc2320009  ! 2859: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xf41a0009  ! 2859: LDD_R	ldd	[%r8 + %r9], %r26
	.word 0xcef22c08  ! 2859: STXA_I	stxa	%r7, [%r8 + 0x0c08] %asi
	.word 0xdd220009  ! 2862: STF_R	st	%f14, [%r9, %r8]
	.word 0xca120009  ! 2862: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xcb3a0009  ! 2862: STDF_R	std	%f5, [%r9, %r8]
	.word 0xee720009  ! 2865: STX_R	stx	%r23, [%r8 + %r9]
	.word 0xc4120009  ! 2865: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0x8e722290  ! 2865: UDIV_I	udiv 	%r8, 0x0290, %r7
	.word 0xf2720009  ! 2868: STX_R	stx	%r25, [%r8 + %r9]
	.word 0xc51a0009  ! 2868: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xc3ea1009  ! 2868: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xca320009  ! 2871: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc2020009  ! 2871: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0x8ba209a9  ! 2871: FDIVs	fdivs	%f8, %f9, %f5
	.word 0xca720009  ! 2874: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc5020009  ! 2874: LDF_R	ld	[%r8, %r9], %f2
	.word 0xc60224b8  ! 2874: LDUW_I	lduw	[%r8 + 0x04b8], %r3
	.word 0xcb220009  ! 2877: STF_R	st	%f5, [%r9, %r8]
	.word 0xc2120009  ! 2877: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xbe720009  ! 2877: UDIV_R	udiv 	%r8, %r9, %r31
	.word 0xc4220009  ! 2880: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xcd1a0009  ! 2880: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0x8a722ab8  ! 2880: UDIV_I	udiv 	%r8, 0x0ab8, %r5
	.word 0xea320009  ! 2883: STH_R	sth	%r21, [%r8 + %r9]
	.word 0xc84a0009  ! 2883: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0x20800001  ! 2883: BN	bn,a	<label_0x1>
	.word 0xc6720009  ! 2886: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xcf1a0009  ! 2886: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xc3ea1009  ! 2886: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc73a0009  ! 2889: STDF_R	std	%f3, [%r9, %r8]
	.word 0xf0420009  ! 2889: LDSW_R	ldsw	[%r8 + %r9], %r24
	.word 0xccf22680  ! 2889: STXA_I	stxa	%r6, [%r8 + 0x0680] %asi
	.word 0xcf220009  ! 2892: STF_R	st	%f7, [%r9, %r8]
	.word 0xde120009  ! 2892: LDUH_R	lduh	[%r8 + %r9], %r15
	.word 0xc6fa2d18  ! 2892: SWAPA_I	swapa	%r3, [%r8 + 0x0d18] %asi
	.word 0xff3a0009  ! 2895: STDF_R	std	%f31, [%r9, %r8]
	.word 0xfb020009  ! 2895: LDF_R	ld	[%r8, %r9], %f29
	.word 0xc3ea1009  ! 2895: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc8220009  ! 2898: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xe65a0009  ! 2898: LDX_R	ldx	[%r8 + %r9], %r19
	.word 0x8efa2150  ! 2898: SDIVcc_I	sdivcc 	%r8, 0x0150, %r7
	.word 0xf8320009  ! 2901: STH_R	sth	%r28, [%r8 + %r9]
	.word 0xee5a0009  ! 2901: LDX_R	ldx	[%r8 + %r9], %r23
	.word 0x8f220009  ! 2901: MULScc_R	mulscc 	%r8, %r9, %r7
	.word 0xce2a0009  ! 2904: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc2020009  ! 2904: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0x8ada2df0  ! 2904: SMULcc_I	smulcc 	%r8, 0x0df0, %r5
	.word 0xce2a0009  ! 2907: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc6120009  ! 2907: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0x06ca0001  ! 2907: BRLZ	brlz  ,pt	%8,<label_0xa0001>
	.word 0xe82a0009  ! 2910: STB_R	stb	%r20, [%r8 + %r9]
	.word 0xe6020009  ! 2910: LDUW_R	lduw	[%r8 + %r9], %r19
	.word 0xfa7a22c8  ! 2910: SWAP_I	swap	%r29, [%r8 + 0x02c8]
	.word 0xfd3a0009  ! 2913: STDF_R	std	%f30, [%r9, %r8]
	.word 0xcc520009  ! 2913: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xc3ea2844  ! 2913: PREFETCHA_I	prefetcha	[%r8, + 0x0844] %asi, #one_read
	.word 0xcd3a0009  ! 2916: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc24a0009  ! 2916: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0x8a5226d0  ! 2916: UMUL_I	umul 	%r8, 0x06d0, %r5
	.word 0xc42a0009  ! 2919: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xe6020009  ! 2919: LDUW_R	lduw	[%r8 + %r9], %r19
	.word 0xcb220009  ! 2919: STF_R	st	%f5, [%r9, %r8]
	.word 0xc82a0009  ! 2922: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc4420009  ! 2922: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xf6921009  ! 2922: LDUHA_R	lduha	[%r8, %r9] 0x80, %r27
	.word 0xcc320009  ! 2925: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xca520009  ! 2925: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0x04ca0001  ! 2925: BRLEZ	brlez  ,pt	%8,<label_0xa0001>
	.word 0xce320009  ! 2928: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc6020009  ! 2928: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0x83220009  ! 2928: MULScc_R	mulscc 	%r8, %r9, %r1
	.word 0xc7220009  ! 2931: STF_R	st	%f3, [%r9, %r8]
	.word 0xfa0a0009  ! 2931: LDUB_R	ldub	[%r8 + %r9], %r29
	.word 0xc2522824  ! 2931: LDSH_I	ldsh	[%r8 + 0x0824], %r1
	.word 0xcb220009  ! 2934: STF_R	st	%f5, [%r9, %r8]
	.word 0xc8520009  ! 2934: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0x1e800001  ! 2934: BVC	bvc  	<label_0x1>
	.word 0xcb3a0009  ! 2937: STDF_R	std	%f5, [%r9, %r8]
	.word 0xf8420009  ! 2937: LDSW_R	ldsw	[%r8 + %r9], %r28
	.word 0xcca22d38  ! 2937: STWA_I	stwa	%r6, [%r8 + 0x0d38] %asi
	.word 0xf22a0009  ! 2940: STB_R	stb	%r25, [%r8 + %r9]
	.word 0xfe120009  ! 2940: LDUH_R	lduh	[%r8 + %r9], %r31
	.word 0xe0420009  ! 2940: LDSW_R	ldsw	[%r8 + %r9], %r16
	.word 0xcf220009  ! 2943: STF_R	st	%f7, [%r9, %r8]
	.word 0xda420009  ! 2943: LDSW_R	ldsw	[%r8 + %r9], %r13
	.word 0x8ef20009  ! 2943: UDIVcc_R	udivcc 	%r8, %r9, %r7
	.word 0xc53a0009  ! 2946: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc2020009  ! 2946: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xc2922214  ! 2946: LDUHA_I	lduha	[%r8, + 0x0214] %asi, %r1
	.word 0xce320009  ! 2949: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xe65a0009  ! 2949: LDX_R	ldx	[%r8 + %r9], %r19
	.word 0xca0a0009  ! 2949: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xcf3a0009  ! 2952: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc85a0009  ! 2952: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0x826a2b80  ! 2952: UDIVX_I	udivx 	%r8, 0x0b80, %r1
	.word 0xc8220009  ! 2955: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xca420009  ! 2955: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0x18800001  ! 2955: BGU	bgu  	<label_0x1>
	.word 0xcf220009  ! 2958: STF_R	st	%f7, [%r9, %r8]
	.word 0xcd020009  ! 2958: LDF_R	ld	[%r8, %r9], %f6
	.word 0xc3ea2c98  ! 2958: PREFETCHA_I	prefetcha	[%r8, + 0x0c98] %asi, #one_read
	.word 0xce320009  ! 2961: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xdc0a0009  ! 2961: LDUB_R	ldub	[%r8 + %r9], %r14
	.word 0xf6ca2564  ! 2961: LDSBA_I	ldsba	[%r8, + 0x0564] %asi, %r27
	.word 0xda320009  ! 2964: STH_R	sth	%r13, [%r8 + %r9]
	.word 0xc81a0009  ! 2964: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x9f222130  ! 2964: MULScc_I	mulscc 	%r8, 0x0130, %r15
	.word 0xc6320009  ! 2967: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xe2420009  ! 2967: LDSW_R	ldsw	[%r8 + %r9], %r17
	.word 0xceb21009  ! 2967: STHA_R	stha	%r7, [%r8 + %r9] 0x80
	.word 0xca720009  ! 2970: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xcc4a0009  ! 2970: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xb2d20009  ! 2970: UMULcc_R	umulcc 	%r8, %r9, %r25
	.word 0xce2a0009  ! 2973: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc24a0009  ! 2973: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xa0f20009  ! 2973: UDIVcc_R	udivcc 	%r8, %r9, %r16
	.word 0xfc220009  ! 2976: STW_R	stw	%r30, [%r8 + %r9]
	.word 0xcc120009  ! 2976: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xa9220009  ! 2976: MULScc_R	mulscc 	%r8, %r9, %r20
	.word 0xc62a0009  ! 2979: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xd71a0009  ! 2979: LDDF_R	ldd	[%r8, %r9], %f11
	.word 0xc2a2234c  ! 2979: STWA_I	stwa	%r1, [%r8 + 0x034c] %asi
	.word 0xc73a0009  ! 2982: STDF_R	std	%f3, [%r9, %r8]
	.word 0xcb020009  ! 2982: LDF_R	ld	[%r8, %r9], %f5
	.word 0xcc6a2e40  ! 2982: LDSTUB_I	ldstub	%r6, [%r8 + 0x0e40]
	.word 0xcc720009  ! 2985: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xce0a0009  ! 2985: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xc8aa1009  ! 2985: STBA_R	stba	%r4, [%r8 + %r9] 0x80
	.word 0xc6720009  ! 2988: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc41a0009  ! 2988: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xcf3a2c50  ! 2988: STDF_I	std	%f7, [0x0c50, %r8]
	.word 0xc4320009  ! 2991: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xfa4a0009  ! 2991: LDSB_R	ldsb	[%r8 + %r9], %r29
	.word 0xc3ea1009  ! 2991: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xce2a0009  ! 2994: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc91a0009  ! 2994: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xc41a0009  ! 2994: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xc6220009  ! 2997: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xec520009  ! 2997: LDSH_R	ldsh	[%r8 + %r9], %r22
	.word 0xf0ba1009  ! 2997: STDA_R	stda	%r24, [%r8 + %r9] 0x80
	.word 0xd6320009  ! 3000: STH_R	sth	%r11, [%r8 + %r9]
	.word 0xfa520009  ! 3000: LDSH_R	ldsh	[%r8 + %r9], %r29
	.word 0xd8da2838  ! 3000: LDXA_I	ldxa	[%r8, + 0x0838] %asi, %r12
	.word 0xc42a0009  ! 3003: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xcc4a0009  ! 3003: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xc68a1009  ! 3003: LDUBA_R	lduba	[%r8, %r9] 0x80, %r3
	.word 0xc82a0009  ! 3006: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xec4a0009  ! 3006: LDSB_R	ldsb	[%r8 + %r9], %r22
	.word 0x89a208a9  ! 3006: FSUBs	fsubs	%f8, %f9, %f4
	.word 0xc62a0009  ! 3009: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc45a0009  ! 3009: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xf93a22d8  ! 3009: STDF_I	std	%f28, [0x02d8, %r8]
	.word 0xcc320009  ! 3012: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc41a0009  ! 3012: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xc36a0009  ! 3012: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xcf3a0009  ! 3015: STDF_R	std	%f7, [%r9, %r8]
	.word 0xcc5a0009  ! 3015: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xe46a26e4  ! 3015: LDSTUB_I	ldstub	%r18, [%r8 + 0x06e4]
	.word 0xec320009  ! 3018: STH_R	sth	%r22, [%r8 + %r9]
	.word 0xea4a0009  ! 3018: LDSB_R	ldsb	[%r8 + %r9], %r21
	.word 0xc36a0009  ! 3018: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc6220009  ! 3021: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc81a0009  ! 3021: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x8d222e8c  ! 3021: MULScc_I	mulscc 	%r8, 0x0e8c, %r6
	.word 0xce2a0009  ! 3024: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc4020009  ! 3024: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xc09a2e10  ! 3024: LDDA_I	ldda	[%r8, + 0x0e10] %asi, %r0
	.word 0xc4320009  ! 3027: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xcc1a0009  ! 3027: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0x865a20c0  ! 3027: SMUL_I	smul 	%r8, 0x00c0, %r3
	.word 0xcc320009  ! 3030: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xcc020009  ! 3030: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xc36a0009  ! 3030: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc8220009  ! 3033: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc2120009  ! 3033: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xccf22328  ! 3033: STXA_I	stxa	%r6, [%r8 + 0x0328] %asi
	.word 0xfa720009  ! 3036: STX_R	stx	%r29, [%r8 + %r9]
	.word 0xca4a0009  ! 3036: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xe81a0009  ! 3036: LDD_R	ldd	[%r8 + %r9], %r20
	.word 0xfe320009  ! 3039: STH_R	sth	%r31, [%r8 + %r9]
	.word 0xc24a0009  ! 3039: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xc3ea2348  ! 3039: PREFETCHA_I	prefetcha	[%r8, + 0x0348] %asi, #one_read
	.word 0xc5220009  ! 3042: STF_R	st	%f2, [%r9, %r8]
	.word 0xc4020009  ! 3042: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xc4822a44  ! 3042: LDUWA_I	lduwa	[%r8, + 0x0a44] %asi, %r2
	.word 0xc82a0009  ! 3045: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xf01a0009  ! 3045: LDD_R	ldd	[%r8 + %r9], %r24
	.word 0x8a7a0009  ! 3045: SDIV_R	sdiv 	%r8, %r9, %r5
	.word 0xc8720009  ! 3048: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc6520009  ! 3048: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0x8a5a0009  ! 3048: SMUL_R	smul 	%r8, %r9, %r5
	.word 0xce320009  ! 3051: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xcf1a0009  ! 3051: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xd6120009  ! 3051: LDUH_R	lduh	[%r8 + %r9], %r11
	.word 0xe4220009  ! 3054: STW_R	stw	%r18, [%r8 + %r9]
	.word 0xff020009  ! 3054: LDF_R	ld	[%r8, %r9], %f31
	.word 0x8e4a2cb8  ! 3054: MULX_I	mulx 	%r8, 0x0cb8, %r7
	.word 0xce2a0009  ! 3057: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc4420009  ! 3057: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xcef22438  ! 3057: STXA_I	stxa	%r7, [%r8 + 0x0438] %asi
	.word 0xfa720009  ! 3060: STX_R	stx	%r29, [%r8 + %r9]
	.word 0xca120009  ! 3060: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0x88da0009  ! 3060: SMULcc_R	smulcc 	%r8, %r9, %r4
	.word 0xd62a0009  ! 3063: STB_R	stb	%r11, [%r8 + %r9]
	.word 0xcd1a0009  ! 3063: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0x02ca0001  ! 3063: BRZ	brz  ,pt	%8,<label_0xa0001>
	.word 0xdc320009  ! 3066: STH_R	sth	%r14, [%r8 + %r9]
	.word 0xd64a0009  ! 3066: LDSB_R	ldsb	[%r8 + %r9], %r11
	.word 0x8143c000  ! 3066: STBAR	stbar
	.word 0xc93a0009  ! 3069: STDF_R	std	%f4, [%r9, %r8]
	.word 0xce120009  ! 3069: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xc3ea1009  ! 3069: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xcd220009  ! 3072: STF_R	st	%f6, [%r9, %r8]
	.word 0xe85a0009  ! 3072: LDX_R	ldx	[%r8 + %r9], %r20
	.word 0xcff22009  ! 3072: CASXA_R	casxa	[%r8]%asi, %r9, %r7
	.word 0xc73a0009  ! 3075: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc51a0009  ! 3075: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xfcb21009  ! 3075: STHA_R	stha	%r30, [%r8 + %r9] 0x80
	.word 0xc6320009  ! 3078: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xec020009  ! 3078: LDUW_R	lduw	[%r8 + %r9], %r22
	.word 0x876a2b74  ! 3078: SDIVX_I	sdivx	%r8, 0x0b74, %r3
	.word 0xc8220009  ! 3081: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xcd020009  ! 3081: LDF_R	ld	[%r8, %r9], %f6
	.word 0xccaa249c  ! 3081: STBA_I	stba	%r6, [%r8 + 0x049c] %asi
	.word 0xc8220009  ! 3084: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xcb1a0009  ! 3084: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0x8c522b7c  ! 3084: UMUL_I	umul 	%r8, 0x0b7c, %r6
	.word 0xea2a0009  ! 3087: STB_R	stb	%r21, [%r8 + %r9]
	.word 0xc4520009  ! 3087: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0x8143e053  ! 3087: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside | #Sync 
	.word 0xe6320009  ! 3090: STH_R	sth	%r19, [%r8 + %r9]
	.word 0xdb1a0009  ! 3090: LDDF_R	ldd	[%r8, %r9], %f13
	.word 0xc85a0009  ! 3090: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xcf220009  ! 3093: STF_R	st	%f7, [%r9, %r8]
	.word 0xc80a0009  ! 3093: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0x8cd228fc  ! 3093: UMULcc_I	umulcc 	%r8, 0x08fc, %r6
	.word 0xc8220009  ! 3096: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xce5a0009  ! 3096: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xdab22318  ! 3096: STHA_I	stha	%r13, [%r8 + 0x0318] %asi
	.word 0xc2220009  ! 3099: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc80a0009  ! 3099: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0x8143e054  ! 3099: MEMBAR	membar	#LoadStore | #Lookaside | #Sync 
	.word 0xc9220009  ! 3102: STF_R	st	%f4, [%r9, %r8]
	.word 0xc65a0009  ! 3102: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xc36a0009  ! 3102: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xdb220009  ! 3105: STF_R	st	%f13, [%r9, %r8]
	.word 0xcc120009  ! 3105: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0x8cd20009  ! 3105: UMULcc_R	umulcc 	%r8, %r9, %r6
	.word 0xe0320009  ! 3108: STH_R	sth	%r16, [%r8 + %r9]
	.word 0xc64a0009  ! 3108: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0x8143c000  ! 3108: STBAR	stbar
	.word 0xe6220009  ! 3111: STW_R	stw	%r19, [%r8 + %r9]
	.word 0xfe420009  ! 3111: LDSW_R	ldsw	[%r8 + %r9], %r31
	.word 0xc6a21009  ! 3111: STWA_R	stwa	%r3, [%r8 + %r9] 0x80
	.word 0xc53a0009  ! 3114: STDF_R	std	%f2, [%r9, %r8]
	.word 0xca5a0009  ! 3114: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0x8143e05e  ! 3114: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0xc82a0009  ! 3117: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc60a0009  ! 3117: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0x84720009  ! 3117: UDIV_R	udiv 	%r8, %r9, %r2
	.word 0xfd220009  ! 3120: STF_R	st	%f30, [%r9, %r8]
	.word 0xf6120009  ! 3120: LDUH_R	lduh	[%r8 + %r9], %r27
	.word 0x84f22874  ! 3120: UDIVcc_I	udivcc 	%r8, 0x0874, %r2
	.word 0xe22a0009  ! 3123: STB_R	stb	%r17, [%r8 + %r9]
	.word 0xe04a0009  ! 3123: LDSB_R	ldsb	[%r8 + %r9], %r16
	.word 0xef3a2f58  ! 3123: STDF_I	std	%f23, [0x0f58, %r8]
	.word 0xc2220009  ! 3126: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc60a0009  ! 3126: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xc0ba26c0  ! 3126: STDA_I	stda	%r0, [%r8 + 0x06c0] %asi
	.word 0xdc220009  ! 3129: STW_R	stw	%r14, [%r8 + %r9]
	.word 0xc5020009  ! 3129: LDF_R	ld	[%r8, %r9], %f2
	.word 0x8143e03f  ! 3129: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0xc22a0009  ! 3132: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xfe420009  ! 3132: LDSW_R	ldsw	[%r8 + %r9], %r31
	.word 0x8143e057  ! 3132: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside | #Sync 
	.word 0xdc220009  ! 3135: STW_R	stw	%r14, [%r8 + %r9]
	.word 0xc44a0009  ! 3135: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0x866a0009  ! 3135: UDIVX_R	udivx 	%r8, %r9, %r3
	.word 0xe4720009  ! 3138: STX_R	stx	%r18, [%r8 + %r9]
	.word 0xc2120009  ! 3138: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0x8143c000  ! 3138: STBAR	stbar
	.word 0xc4320009  ! 3141: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xe05a0009  ! 3141: LDX_R	ldx	[%r8 + %r9], %r16
	.word 0xc4b21009  ! 3141: STHA_R	stha	%r2, [%r8 + %r9] 0x80
	.word 0xc4720009  ! 3144: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc6020009  ! 3144: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xc7020009  ! 3144: LDF_R	ld	[%r8, %r9], %f3
	.word 0xcf220009  ! 3147: STF_R	st	%f7, [%r9, %r8]
	.word 0xc85a0009  ! 3147: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0x8143e04d  ! 3147: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Sync 
	.word 0xc7220009  ! 3150: STF_R	st	%f3, [%r9, %r8]
	.word 0xe01a0009  ! 3150: LDD_R	ldd	[%r8 + %r9], %r16
	.word 0xc89a1009  ! 3150: LDDA_R	ldda	[%r8, %r9] 0x80, %r4
	.word 0xfe220009  ! 3153: STW_R	stw	%r31, [%r8 + %r9]
	.word 0xc8020009  ! 3153: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0x0c800001  ! 3153: BNEG	bneg  	<label_0x1>
	.word 0xc4320009  ! 3156: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc65a0009  ! 3156: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xc36a29e8  ! 3156: PREFETCH_I	prefetch	[%r8 + 0x09e8], #one_read
	.word 0xc2720009  ! 3159: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xdb020009  ! 3159: LDF_R	ld	[%r8, %r9], %f13
	.word 0x8e7a20b4  ! 3159: SDIV_I	sdiv 	%r8, 0x00b4, %r7
	.word 0xc73a0009  ! 3162: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc2520009  ! 3162: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xe49a2a00  ! 3162: LDDA_I	ldda	[%r8, + 0x0a00] %asi, %r18
	.word 0xcc220009  ! 3165: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xcc420009  ! 3165: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xcaa21009  ! 3165: STWA_R	stwa	%r5, [%r8 + %r9] 0x80
	.word 0xcb220009  ! 3168: STF_R	st	%f5, [%r9, %r8]
	.word 0xc9020009  ! 3168: LDF_R	ld	[%r8, %r9], %f4
	.word 0x8ba208a9  ! 3168: FSUBs	fsubs	%f8, %f9, %f5
	.word 0xee2a0009  ! 3171: STB_R	stb	%r23, [%r8 + %r9]
	.word 0xdc5a0009  ! 3171: LDX_R	ldx	[%r8 + %r9], %r14
	.word 0x8143c000  ! 3171: STBAR	stbar
	.word 0xfa720009  ! 3174: STX_R	stx	%r29, [%r8 + %r9]
	.word 0xc4420009  ! 3174: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xc9f22009  ! 3174: CASXA_R	casxa	[%r8]%asi, %r9, %r4
	.word 0xfd220009  ! 3177: STF_R	st	%f30, [%r9, %r8]
	.word 0xcb020009  ! 3177: LDF_R	ld	[%r8, %r9], %f5
	.word 0x8da20929  ! 3177: FMULs	fmuls	%f8, %f9, %f6
	.word 0xc93a0009  ! 3180: STDF_R	std	%f4, [%r9, %r8]
	.word 0xdc1a0009  ! 3180: LDD_R	ldd	[%r8 + %r9], %r14
	.word 0xcf3a0009  ! 3180: STDF_R	std	%f7, [%r9, %r8]
	.word 0xfb220009  ! 3183: STF_R	st	%f29, [%r9, %r8]
	.word 0xc44a0009  ! 3183: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xc3ea1009  ! 3183: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xce2a0009  ! 3186: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xce4a0009  ! 3186: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0x9ba20829  ! 3186: FADDs	fadds	%f8, %f9, %f13
	.word 0xc4320009  ! 3189: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc2120009  ! 3189: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0x8c720009  ! 3189: UDIV_R	udiv 	%r8, %r9, %r6
	.word 0xcd220009  ! 3192: STF_R	st	%f6, [%r9, %r8]
	.word 0xe84a0009  ! 3192: LDSB_R	ldsb	[%r8 + %r9], %r20
	.word 0xa8520009  ! 3192: UMUL_R	umul 	%r8, %r9, %r20
	.word 0xda2a0009  ! 3195: STB_R	stb	%r13, [%r8 + %r9]
	.word 0xc51a0009  ! 3195: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0x30800001  ! 3195: BA	ba,a	<label_0x1>
	.word 0xc4320009  ! 3198: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc80a0009  ! 3198: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0x24c20001  ! 3198: BRLEZ	brlez,a,nt	%8,<label_0x20001>
	.word 0xc33a0009  ! 3201: STDF_R	std	%f1, [%r9, %r8]
	.word 0xce520009  ! 3201: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0x86fa0009  ! 3201: SDIVcc_R	sdivcc 	%r8, %r9, %r3
	.word 0xf8220009  ! 3204: STW_R	stw	%r28, [%r8 + %r9]
	.word 0xc4420009  ! 3204: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0x8a4a2fc0  ! 3204: MULX_I	mulx 	%r8, 0x0fc0, %r5
	.word 0xe8720009  ! 3207: STX_R	stx	%r20, [%r8 + %r9]
	.word 0xc2520009  ! 3207: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xae7a2914  ! 3207: SDIV_I	sdiv 	%r8, 0x0914, %r23
	.word 0xc4320009  ! 3210: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xcd020009  ! 3210: LDF_R	ld	[%r8, %r9], %f6
	.word 0xca8a20ec  ! 3210: LDUBA_I	lduba	[%r8, + 0x00ec] %asi, %r5
	.word 0xe4320009  ! 3213: STH_R	sth	%r18, [%r8 + %r9]
	.word 0xcc420009  ! 3213: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xff3a0009  ! 3213: STDF_R	std	%f31, [%r9, %r8]
	.word 0xfe720009  ! 3216: STX_R	stx	%r31, [%r8 + %r9]
	.word 0xc2520009  ! 3216: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0x8c520009  ! 3216: UMUL_R	umul 	%r8, %r9, %r6
	.word 0xca720009  ! 3219: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc4020009  ! 3219: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0x86520009  ! 3219: UMUL_R	umul 	%r8, %r9, %r3
	.word 0xed3a0009  ! 3222: STDF_R	std	%f22, [%r9, %r8]
	.word 0xc84a0009  ! 3222: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0x0eca0001  ! 3222: BRGEZ	brgez  ,pt	%8,<label_0xa0001>
	.word 0xcf3a0009  ! 3225: STDF_R	std	%f7, [%r9, %r8]
	.word 0xcb1a0009  ! 3225: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xb06a2e48  ! 3225: UDIVX_I	udivx 	%r8, 0x0e48, %r24
	.word 0xdc720009  ! 3228: STX_R	stx	%r14, [%r8 + %r9]
	.word 0xc31a0009  ! 3228: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0x8143e067  ! 3228: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #MemIssue | #Sync 
	.word 0xf22a0009  ! 3231: STB_R	stb	%r25, [%r8 + %r9]
	.word 0xc7020009  ! 3231: LDF_R	ld	[%r8, %r9], %f3
	.word 0xc36a2fbc  ! 3231: PREFETCH_I	prefetch	[%r8 + 0x0fbc], #one_read
	.word 0xc9220009  ! 3234: STF_R	st	%f4, [%r9, %r8]
	.word 0xcc020009  ! 3234: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xbada0009  ! 3234: SMULcc_R	smulcc 	%r8, %r9, %r29
	.word 0xcd3a0009  ! 3237: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc85a0009  ! 3237: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0x8143c000  ! 3237: STBAR	stbar
	.word 0xe8720009  ! 3240: STX_R	stx	%r20, [%r8 + %r9]
	.word 0xc24a0009  ! 3240: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xc3222aec  ! 3240: STF_I	st	%f1, [0x0aec, %r8]
	.word 0xcc720009  ! 3243: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xff020009  ! 3243: LDF_R	ld	[%r8, %r9], %f31
	.word 0x88fa290c  ! 3243: SDIVcc_I	sdivcc 	%r8, 0x090c, %r4
	.word 0xcc320009  ! 3246: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc6420009  ! 3246: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0x884a2c00  ! 3246: MULX_I	mulx 	%r8, 0x0c00, %r4
	.word 0xca2a0009  ! 3249: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xdc120009  ! 3249: LDUH_R	lduh	[%r8 + %r9], %r14
	.word 0x824a0009  ! 3249: MULX_R	mulx 	%r8, %r9, %r1
	.word 0xe42a0009  ! 3252: STB_R	stb	%r18, [%r8 + %r9]
	.word 0xcc1a0009  ! 3252: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0x0e800002  ! 3252: BVS	bvs  	<label_0x2>
	.word 0xdf220009  ! 3255: STF_R	st	%f15, [%r9, %r8]
	.word 0xca4a0009  ! 3255: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xb72225f0  ! 3255: MULScc_I	mulscc 	%r8, 0x05f0, %r27
	.word 0xc2720009  ! 3258: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xda0a0009  ! 3258: LDUB_R	ldub	[%r8 + %r9], %r13
	.word 0xc20a2018  ! 3258: LDUB_I	ldub	[%r8 + 0x0018], %r1
	.word 0xcc320009  ! 3261: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xce520009  ! 3261: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xed3a2430  ! 3261: STDF_I	std	%f22, [0x0430, %r8]
	.word 0xcd220009  ! 3264: STF_R	st	%f6, [%r9, %r8]
	.word 0xf0420009  ! 3264: LDSW_R	ldsw	[%r8 + %r9], %r24
	.word 0xc8f21009  ! 3264: STXA_R	stxa	%r4, [%r8 + %r9] 0x80
	.word 0xf02a0009  ! 3267: STB_R	stb	%r24, [%r8 + %r9]
	.word 0xcb1a0009  ! 3267: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xc36a0009  ! 3267: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc3220009  ! 3270: STF_R	st	%f1, [%r9, %r8]
	.word 0xc6120009  ! 3270: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0x8ad20009  ! 3270: UMULcc_R	umulcc 	%r8, %r9, %r5
	.word 0xc4220009  ! 3273: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc81a0009  ! 3273: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xce120009  ! 3273: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xf62a0009  ! 3276: STB_R	stb	%r27, [%r8 + %r9]
	.word 0xfa120009  ! 3276: LDUH_R	lduh	[%r8 + %r9], %r29
	.word 0x9fa20929  ! 3276: FMULs	fmuls	%f8, %f9, %f15
	.word 0xcc320009  ! 3279: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xcb1a0009  ! 3279: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xe6c21009  ! 3279: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r19
	.word 0xc6320009  ! 3282: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xca020009  ! 3282: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0x9c722a50  ! 3282: UDIV_I	udiv 	%r8, 0x0a50, %r14
	.word 0xc9220009  ! 3285: STF_R	st	%f4, [%r9, %r8]
	.word 0xcd1a0009  ! 3285: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0x8c4a0009  ! 3285: MULX_R	mulx 	%r8, %r9, %r6
	.word 0xc8720009  ! 3288: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xca120009  ! 3288: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xce6a2378  ! 3288: LDSTUB_I	ldstub	%r7, [%r8 + 0x0378]
	.word 0xc73a0009  ! 3291: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc64a0009  ! 3291: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0x887a0009  ! 3291: SDIV_R	sdiv 	%r8, %r9, %r4
	.word 0xca720009  ! 3294: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xca420009  ! 3294: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0x8143c000  ! 3294: STBAR	stbar
	.word 0xde220009  ! 3297: STW_R	stw	%r15, [%r8 + %r9]
	.word 0xca020009  ! 3297: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0x08800002  ! 3297: BLEU	bleu  	<label_0x2>
	.word 0xc4720009  ! 3300: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xca520009  ! 3300: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0x8143c000  ! 3300: STBAR	stbar
	.word 0xe73a0009  ! 3303: STDF_R	std	%f19, [%r9, %r8]
	.word 0xec120009  ! 3303: LDUH_R	lduh	[%r8 + %r9], %r22
	.word 0xccb22f08  ! 3303: STHA_I	stha	%r6, [%r8 + 0x0f08] %asi
	.word 0xe22a0009  ! 3306: STB_R	stb	%r17, [%r8 + %r9]
	.word 0xe85a0009  ! 3306: LDX_R	ldx	[%r8 + %r9], %r20
	.word 0xca5a2cd0  ! 3306: LDX_I	ldx	[%r8 + 0x0cd0], %r5
	.word 0xe8720009  ! 3309: STX_R	stx	%r20, [%r8 + %r9]
	.word 0xc2420009  ! 3309: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0x8143c000  ! 3309: STBAR	stbar
	.word 0xc3220009  ! 3312: STF_R	st	%f1, [%r9, %r8]
	.word 0xc8520009  ! 3312: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0x864a2a7c  ! 3312: MULX_I	mulx 	%r8, 0x0a7c, %r3
	.word 0xcd220009  ! 3315: STF_R	st	%f6, [%r9, %r8]
	.word 0xce4a0009  ! 3315: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xc36a2850  ! 3315: PREFETCH_I	prefetch	[%r8 + 0x0850], #one_read
	.word 0xe2220009  ! 3318: STW_R	stw	%r17, [%r8 + %r9]
	.word 0xcd020009  ! 3318: LDF_R	ld	[%r8, %r9], %f6
	.word 0xc36a0009  ! 3318: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xd8220009  ! 3321: STW_R	stw	%r12, [%r8 + %r9]
	.word 0xeb1a0009  ! 3321: LDDF_R	ldd	[%r8, %r9], %f21
	.word 0xc36a2130  ! 3321: PREFETCH_I	prefetch	[%r8 + 0x0130], #one_read
	.word 0xce220009  ! 3324: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xd8520009  ! 3324: LDSH_R	ldsh	[%r8 + %r9], %r12
	.word 0xc3ea1009  ! 3324: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xcc220009  ! 3327: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xca020009  ! 3327: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xd6fa1009  ! 3327: SWAPA_R	swapa	%r11, [%r8 + %r9] 0x80
	.word 0xcc320009  ! 3330: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xca0a0009  ! 3330: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xccea1009  ! 3330: LDSTUBA_R	ldstuba	%r6, [%r8 + %r9] 0x80
	.word 0xc2220009  ! 3333: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc25a0009  ! 3333: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xc3ea1009  ! 3333: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xfe2a0009  ! 3336: STB_R	stb	%r31, [%r8 + %r9]
	.word 0xe8120009  ! 3336: LDUH_R	lduh	[%r8 + %r9], %r20
	.word 0xc49a1009  ! 3336: LDDA_R	ldda	[%r8, %r9] 0x80, %r2
	.word 0xc5220009  ! 3339: STF_R	st	%f2, [%r9, %r8]
	.word 0xc6120009  ! 3339: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0x867223e4  ! 3339: UDIV_I	udiv 	%r8, 0x03e4, %r3
	.word 0xc8720009  ! 3342: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xef020009  ! 3342: LDF_R	ld	[%r8, %r9], %f23
	.word 0xe08a1009  ! 3342: LDUBA_R	lduba	[%r8, %r9] 0x80, %r16
	.word 0xe33a0009  ! 3345: STDF_R	std	%f17, [%r9, %r8]
	.word 0xc2120009  ! 3345: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xc47a0009  ! 3345: SWAP_R	swap	%r2, [%r8 + %r9]
	.word 0xf42a0009  ! 3348: STB_R	stb	%r26, [%r8 + %r9]
	.word 0xf2120009  ! 3348: LDUH_R	lduh	[%r8 + %r9], %r25
	.word 0x8143c000  ! 3348: STBAR	stbar
	.word 0xf3220009  ! 3351: STF_R	st	%f25, [%r9, %r8]
	.word 0xdc4a0009  ! 3351: LDSB_R	ldsb	[%r8 + %r9], %r14
	.word 0xa9a20929  ! 3351: FMULs	fmuls	%f8, %f9, %f20
	.word 0xdd3a0009  ! 3354: STDF_R	std	%f14, [%r9, %r8]
	.word 0xc8020009  ! 3354: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xc3ea2884  ! 3354: PREFETCHA_I	prefetcha	[%r8, + 0x0884] %asi, #one_read
	.word 0xc2720009  ! 3357: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc31a0009  ! 3357: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xf8a21009  ! 3357: STWA_R	stwa	%r28, [%r8 + %r9] 0x80
	.word 0xc62a0009  ! 3360: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xcc5a0009  ! 3360: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0x83220009  ! 3360: MULScc_R	mulscc 	%r8, %r9, %r1
	.word 0xc4320009  ! 3363: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xf81a0009  ! 3363: LDD_R	ldd	[%r8 + %r9], %r28
	.word 0x866a2b8c  ! 3363: UDIVX_I	udivx 	%r8, 0x0b8c, %r3
	.word 0xcd3a0009  ! 3366: STDF_R	std	%f6, [%r9, %r8]
	.word 0xda0a0009  ! 3366: LDUB_R	ldub	[%r8 + %r9], %r13
	.word 0x24800001  ! 3366: BLE	ble,a	<label_0x1>
	.word 0xce220009  ! 3369: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xce520009  ! 3369: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0x88722448  ! 3369: UDIV_I	udiv 	%r8, 0x0448, %r4
	.word 0xfe220009  ! 3372: STW_R	stw	%r31, [%r8 + %r9]
	.word 0xdd1a0009  ! 3372: LDDF_R	ldd	[%r8, %r9], %f14
	.word 0xc36a0009  ! 3372: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xff220009  ! 3375: STF_R	st	%f31, [%r9, %r8]
	.word 0xcd1a0009  ! 3375: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xc87a2ef0  ! 3375: SWAP_I	swap	%r4, [%r8 + 0x0ef0]
	.word 0xc7220009  ! 3378: STF_R	st	%f3, [%r9, %r8]
	.word 0xc40a0009  ! 3378: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xc3ea253c  ! 3378: PREFETCHA_I	prefetcha	[%r8, + 0x053c] %asi, #one_read
	.word 0xcc720009  ! 3381: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xf8120009  ! 3381: LDUH_R	lduh	[%r8 + %r9], %r28
	.word 0xc8ba2e90  ! 3381: STDA_I	stda	%r4, [%r8 + 0x0e90] %asi
	.word 0xcc2a0009  ! 3384: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xf05a0009  ! 3384: LDX_R	ldx	[%r8 + %r9], %r24
	.word 0xf6f22748  ! 3384: STXA_I	stxa	%r27, [%r8 + 0x0748] %asi
	.word 0xcc2a0009  ! 3387: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xcc1a0009  ! 3387: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xce8a1009  ! 3387: LDUBA_R	lduba	[%r8, %r9] 0x80, %r7
	.word 0xe22a0009  ! 3390: STB_R	stb	%r17, [%r8 + %r9]
	.word 0xc2420009  ! 3390: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0x06ca0001  ! 3390: BRLZ	brlz  ,pt	%8,<label_0xa0001>
	.word 0xc33a0009  ! 3393: STDF_R	std	%f1, [%r9, %r8]
	.word 0xe84a0009  ! 3393: LDSB_R	ldsb	[%r8 + %r9], %r20
	.word 0xa9a20829  ! 3393: FADDs	fadds	%f8, %f9, %f20
	.word 0xc33a0009  ! 3396: STDF_R	std	%f1, [%r9, %r8]
	.word 0xd64a0009  ! 3396: LDSB_R	ldsb	[%r8 + %r9], %r11
	.word 0xdcc21009  ! 3396: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r14
	.word 0xfe2a0009  ! 3399: STB_R	stb	%r31, [%r8 + %r9]
	.word 0xcc4a0009  ! 3399: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xc692246c  ! 3399: LDUHA_I	lduha	[%r8, + 0x046c] %asi, %r3
	.word 0xe6320009  ! 3402: STH_R	sth	%r19, [%r8 + %r9]
	.word 0xce5a0009  ! 3402: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xdc5a0009  ! 3402: LDX_R	ldx	[%r8 + %r9], %r14
	.word 0xce220009  ! 3405: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xca120009  ! 3405: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0x8143c000  ! 3405: STBAR	stbar
	.word 0xc7220009  ! 3408: STF_R	st	%f3, [%r9, %r8]
	.word 0xca5a0009  ! 3408: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0x8da20829  ! 3408: FADDs	fadds	%f8, %f9, %f6
	.word 0xca320009  ! 3411: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc85a0009  ! 3411: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xfd3a22c8  ! 3411: STDF_I	std	%f30, [0x02c8, %r8]
	.word 0xc93a0009  ! 3414: STDF_R	std	%f4, [%r9, %r8]
	.word 0xdf020009  ! 3414: LDF_R	ld	[%r8, %r9], %f15
	.word 0x8f22276c  ! 3414: MULScc_I	mulscc 	%r8, 0x076c, %r7
	.word 0xc3220009  ! 3417: STF_R	st	%f1, [%r9, %r8]
	.word 0xed1a0009  ! 3417: LDDF_R	ldd	[%r8, %r9], %f22
	.word 0xcef21009  ! 3417: STXA_R	stxa	%r7, [%r8 + %r9] 0x80
	.word 0xfb220009  ! 3420: STF_R	st	%f29, [%r9, %r8]
	.word 0xce120009  ! 3420: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0x8143e05d  ! 3420: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0xf4320009  ! 3423: STH_R	sth	%r26, [%r8 + %r9]
	.word 0xc4420009  ! 3423: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0x16800001  ! 3423: BGE	bge  	<label_0x1>
	.word 0xf0720009  ! 3426: STX_R	stx	%r24, [%r8 + %r9]
	.word 0xc41a0009  ! 3426: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xc64a214c  ! 3426: LDSB_I	ldsb	[%r8 + 0x014c], %r3
	.word 0xca320009  ! 3429: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc20a0009  ! 3429: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0x8143e02f  ! 3429: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #MemIssue 
	.word 0xca220009  ! 3432: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc40a0009  ! 3432: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0x8143c000  ! 3432: STBAR	stbar
	.word 0xf82a0009  ! 3435: STB_R	stb	%r28, [%r8 + %r9]
	.word 0xc65a0009  ! 3435: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xa6fa22d0  ! 3435: SDIVcc_I	sdivcc 	%r8, 0x02d0, %r19
	.word 0xca720009  ! 3438: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc31a0009  ! 3438: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0x82d22360  ! 3438: UMULcc_I	umulcc 	%r8, 0x0360, %r1
	.word 0xca220009  ! 3441: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xce0a0009  ! 3441: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0x886a2f78  ! 3441: UDIVX_I	udivx 	%r8, 0x0f78, %r4
	.word 0xcc2a0009  ! 3444: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xf64a0009  ! 3444: LDSB_R	ldsb	[%r8 + %r9], %r27
	.word 0xccfa26bc  ! 3444: SWAPA_I	swapa	%r6, [%r8 + 0x06bc] %asi
	.word 0xcb220009  ! 3447: STF_R	st	%f5, [%r9, %r8]
	.word 0xca420009  ! 3447: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xec0a0009  ! 3447: LDUB_R	ldub	[%r8 + %r9], %r22
	.word 0xca320009  ! 3450: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xca520009  ! 3450: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0x26ca0001  ! 3450: BRLZ	brlz,a,pt	%8,<label_0xa0001>
	.word 0xcc2a0009  ! 3453: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc41a0009  ! 3453: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xaa7a0009  ! 3453: SDIV_R	sdiv 	%r8, %r9, %r21
	.word 0xca720009  ! 3456: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc01a0009  ! 3456: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0xb04a2068  ! 3456: MULX_I	mulx 	%r8, 0x0068, %r24
	.word 0xcc220009  ! 3459: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xce0a0009  ! 3459: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0x867a2f18  ! 3459: SDIV_I	sdiv 	%r8, 0x0f18, %r3
	.word 0xca220009  ! 3462: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xe51a0009  ! 3462: LDDF_R	ldd	[%r8, %r9], %f18
	.word 0x87a20829  ! 3462: FADDs	fadds	%f8, %f9, %f3
	.word 0xf8320009  ! 3465: STH_R	sth	%r28, [%r8 + %r9]
	.word 0xd6020009  ! 3465: LDUW_R	lduw	[%r8 + %r9], %r11
	.word 0x8da209a9  ! 3465: FDIVs	fdivs	%f8, %f9, %f6
	.word 0xc73a0009  ! 3468: STDF_R	std	%f3, [%r9, %r8]
	.word 0xcc020009  ! 3468: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0x8ba20929  ! 3468: FMULs	fmuls	%f8, %f9, %f5
	.word 0xe3220009  ! 3471: STF_R	st	%f17, [%r9, %r8]
	.word 0xc3020009  ! 3471: LDF_R	ld	[%r8, %r9], %f1
	.word 0x8eda28fc  ! 3471: SMULcc_I	smulcc 	%r8, 0x08fc, %r7
	.word 0xcd220009  ! 3474: STF_R	st	%f6, [%r9, %r8]
	.word 0xc64a0009  ! 3474: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0x8143c000  ! 3474: STBAR	stbar
	.word 0xe8720009  ! 3477: STX_R	stx	%r20, [%r8 + %r9]
	.word 0xc81a0009  ! 3477: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x22ca0001  ! 3477: BRZ	brz,a,pt	%8,<label_0xa0001>
	.word 0xc6720009  ! 3480: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xf4120009  ! 3480: LDUH_R	lduh	[%r8 + %r9], %r26
	.word 0xcde21009  ! 3480: CASA_I	casa	[%r8] 0x80, %r9, %r6
	.word 0xed220009  ! 3483: STF_R	st	%f22, [%r9, %r8]
	.word 0xf00a0009  ! 3483: LDUB_R	ldub	[%r8 + %r9], %r24
	.word 0x836a233c  ! 3483: SDIVX_I	sdivx	%r8, 0x033c, %r1
	.word 0xca320009  ! 3486: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc8120009  ! 3486: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xca02243c  ! 3486: LDUW_I	lduw	[%r8 + 0x043c], %r5
	.word 0xc6320009  ! 3489: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xfe120009  ! 3489: LDUH_R	lduh	[%r8 + %r9], %r31
	.word 0x9e5a2bf8  ! 3489: SMUL_I	smul 	%r8, 0x0bf8, %r15
	.word 0xcd220009  ! 3492: STF_R	st	%f6, [%r9, %r8]
	.word 0xce520009  ! 3492: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xc53a2ee8  ! 3492: STDF_I	std	%f2, [0x0ee8, %r8]
	.word 0xc33a0009  ! 3495: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc2020009  ! 3495: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0x8ad20009  ! 3495: UMULcc_R	umulcc 	%r8, %r9, %r5
	.word 0xc6320009  ! 3498: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc4520009  ! 3498: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0x8d6a27d0  ! 3498: SDIVX_I	sdivx	%r8, 0x07d0, %r6
	.word 0xc33a0009  ! 3501: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc84a0009  ! 3501: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xc4ba2320  ! 3501: STDA_I	stda	%r2, [%r8 + 0x0320] %asi
	.word 0xca320009  ! 3504: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xea0a0009  ! 3504: LDUB_R	ldub	[%r8 + %r9], %r21
	.word 0xcbe22009  ! 3504: CASA_R	casa	[%r8] %asi, %r9, %r5
	.word 0xc9220009  ! 3507: STF_R	st	%f4, [%r9, %r8]
	.word 0xe8420009  ! 3507: LDSW_R	ldsw	[%r8 + %r9], %r20
	.word 0xc8522bb4  ! 3507: LDSH_I	ldsh	[%r8 + 0x0bb4], %r4
	.word 0xea220009  ! 3510: STW_R	stw	%r21, [%r8 + %r9]
	.word 0xe84a0009  ! 3510: LDSB_R	ldsb	[%r8 + %r9], %r20
	.word 0xc53a0009  ! 3510: STDF_R	std	%f2, [%r9, %r8]
	.word 0xeb3a0009  ! 3513: STDF_R	std	%f21, [%r9, %r8]
	.word 0xcd1a0009  ! 3513: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xcd220009  ! 3513: STF_R	st	%f6, [%r9, %r8]
	.word 0xe02a0009  ! 3516: STB_R	stb	%r16, [%r8 + %r9]
	.word 0xc20a0009  ! 3516: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xfada2070  ! 3516: LDXA_I	ldxa	[%r8, + 0x0070] %asi, %r29
	.word 0xf6220009  ! 3519: STW_R	stw	%r27, [%r8 + %r9]
	.word 0xe8420009  ! 3519: LDSW_R	ldsw	[%r8 + %r9], %r20
	.word 0x8da209a9  ! 3519: FDIVs	fdivs	%f8, %f9, %f6
	.word 0xc9220009  ! 3522: STF_R	st	%f4, [%r9, %r8]
	.word 0xca420009  ! 3522: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0x8af20009  ! 3522: UDIVcc_R	udivcc 	%r8, %r9, %r5
	.word 0xc33a0009  ! 3525: STDF_R	std	%f1, [%r9, %r8]
	.word 0xcf020009  ! 3525: LDF_R	ld	[%r8, %r9], %f7
	.word 0xc6922f9c  ! 3525: LDUHA_I	lduha	[%r8, + 0x0f9c] %asi, %r3
	.word 0xe2220009  ! 3528: STW_R	stw	%r17, [%r8 + %r9]
	.word 0xcd1a0009  ! 3528: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0x2a800002  ! 3528: BCS	bcs,a	<label_0x2>
	.word 0xc9220009  ! 3531: STF_R	st	%f4, [%r9, %r8]
	.word 0xe8420009  ! 3531: LDSW_R	ldsw	[%r8 + %r9], %r20
	.word 0xce921009  ! 3531: LDUHA_R	lduha	[%r8, %r9] 0x80, %r7
	.word 0xc8320009  ! 3534: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc4020009  ! 3534: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0x99a20929  ! 3534: FMULs	fmuls	%f8, %f9, %f12
	.word 0xf82a0009  ! 3537: STB_R	stb	%r28, [%r8 + %r9]
	.word 0xc64a0009  ! 3537: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0x8143c000  ! 3537: STBAR	stbar
	.word 0xe62a0009  ! 3540: STB_R	stb	%r19, [%r8 + %r9]
	.word 0xf04a0009  ! 3540: LDSB_R	ldsb	[%r8 + %r9], %r24
	.word 0xc6520009  ! 3540: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xed3a0009  ! 3543: STDF_R	std	%f22, [%r9, %r8]
	.word 0xc7020009  ! 3543: LDF_R	ld	[%r8, %r9], %f3
	.word 0xc93a2808  ! 3543: STDF_I	std	%f4, [0x0808, %r8]
	.word 0xc4220009  ! 3546: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xda020009  ! 3546: LDUW_R	lduw	[%r8 + %r9], %r13
	.word 0xc3ea2c48  ! 3546: PREFETCHA_I	prefetcha	[%r8, + 0x0c48] %asi, #one_read
	.word 0xc5220009  ! 3549: STF_R	st	%f2, [%r9, %r8]
	.word 0xce4a0009  ! 3549: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xc36a0009  ! 3549: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xce2a0009  ! 3552: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc84a0009  ! 3552: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xe4da1009  ! 3552: LDXA_R	ldxa	[%r8, %r9] 0x80, %r18
	.word 0xc6720009  ! 3555: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xca4a0009  ! 3555: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0x8143e01e  ! 3555: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside 
	.word 0xca2a0009  ! 3558: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc91a0009  ! 3558: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0x0eca0001  ! 3558: BRGEZ	brgez  ,pt	%8,<label_0xa0001>
	.word 0xc8220009  ! 3561: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xf65a0009  ! 3561: LDX_R	ldx	[%r8 + %r9], %r27
	.word 0xc6da2ab0  ! 3561: LDXA_I	ldxa	[%r8, + 0x0ab0] %asi, %r3
	.word 0xc2720009  ! 3564: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xfc5a0009  ! 3564: LDX_R	ldx	[%r8 + %r9], %r30
	.word 0xe4a21009  ! 3564: STWA_R	stwa	%r18, [%r8 + %r9] 0x80
	.word 0xfb220009  ! 3567: STF_R	st	%f29, [%r9, %r8]
	.word 0xc7020009  ! 3567: LDF_R	ld	[%r8, %r9], %f3
	.word 0xc3ea1009  ! 3567: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xcc2a0009  ! 3570: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc5020009  ! 3570: LDF_R	ld	[%r8, %r9], %f2
	.word 0x04800002  ! 3570: BLE	ble  	<label_0x2>
	.word 0xcf3a0009  ! 3573: STDF_R	std	%f7, [%r9, %r8]
	.word 0xdc120009  ! 3573: LDUH_R	lduh	[%r8 + %r9], %r14
	.word 0x82fa2a44  ! 3573: SDIVcc_I	sdivcc 	%r8, 0x0a44, %r1
	.word 0xfe320009  ! 3576: STH_R	sth	%r31, [%r8 + %r9]
	.word 0xe24a0009  ! 3576: LDSB_R	ldsb	[%r8 + %r9], %r17
	.word 0x8f6a0009  ! 3576: SDIVX_R	sdivx	%r8, %r9, %r7
	.word 0xe93a0009  ! 3579: STDF_R	std	%f20, [%r9, %r8]
	.word 0xcc1a0009  ! 3579: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0x9ed22298  ! 3579: UMULcc_I	umulcc 	%r8, 0x0298, %r15
	.word 0xf2320009  ! 3582: STH_R	sth	%r25, [%r8 + %r9]
	.word 0xcb1a0009  ! 3582: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xce6a2ecc  ! 3582: LDSTUB_I	ldstub	%r7, [%r8 + 0x0ecc]
	.word 0xc8720009  ! 3585: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xcc1a0009  ! 3585: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xfd3a0009  ! 3585: STDF_R	std	%f30, [%r9, %r8]
	.word 0xe0720009  ! 3588: STX_R	stx	%r16, [%r8 + %r9]
	.word 0xdc4a0009  ! 3588: LDSB_R	ldsb	[%r8 + %r9], %r14
	.word 0x86da2020  ! 3588: SMULcc_I	smulcc 	%r8, 0x0020, %r3
	.word 0xc9220009  ! 3591: STF_R	st	%f4, [%r9, %r8]
	.word 0xf45a0009  ! 3591: LDX_R	ldx	[%r8 + %r9], %r26
	.word 0xeada1009  ! 3591: LDXA_R	ldxa	[%r8, %r9] 0x80, %r21
	.word 0xc6720009  ! 3594: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc6520009  ! 3594: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xc3ea1009  ! 3594: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xca220009  ! 3597: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xcc0a0009  ! 3597: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0x8143c000  ! 3597: STBAR	stbar
	.word 0xfc2a0009  ! 3600: STB_R	stb	%r30, [%r8 + %r9]
	.word 0xee020009  ! 3600: LDUW_R	lduw	[%r8 + %r9], %r23
	.word 0xb2d22874  ! 3600: UMULcc_I	umulcc 	%r8, 0x0874, %r25
	.word 0xc93a0009  ! 3603: STDF_R	std	%f4, [%r9, %r8]
	.word 0xc2020009  ! 3603: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0x887a2a64  ! 3603: SDIV_I	sdiv 	%r8, 0x0a64, %r4
	.word 0xef220009  ! 3606: STF_R	st	%f23, [%r9, %r8]
	.word 0xcd1a0009  ! 3606: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xd9e22009  ! 3606: CASA_R	casa	[%r8] %asi, %r9, %r12
	.word 0xc22a0009  ! 3609: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xf0020009  ! 3609: LDUW_R	lduw	[%r8 + %r9], %r24
	.word 0xe4ca1009  ! 3609: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r18
	.word 0xc93a0009  ! 3612: STDF_R	std	%f4, [%r9, %r8]
	.word 0xca5a0009  ! 3612: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0x8c7a23ec  ! 3612: SDIV_I	sdiv 	%r8, 0x03ec, %r6
	.word 0xfb220009  ! 3615: STF_R	st	%f29, [%r9, %r8]
	.word 0xf51a0009  ! 3615: LDDF_R	ldd	[%r8, %r9], %f26
	.word 0x8143e047  ! 3615: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Sync 
	.word 0xcb3a0009  ! 3618: STDF_R	std	%f5, [%r9, %r8]
	.word 0xcc020009  ! 3618: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xc73a0009  ! 3618: STDF_R	std	%f3, [%r9, %r8]
	.word 0xca220009  ! 3621: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xdc020009  ! 3621: LDUW_R	lduw	[%r8 + %r9], %r14
	.word 0xb7a20929  ! 3621: FMULs	fmuls	%f8, %f9, %f27
	.word 0xc82a0009  ! 3624: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc45a0009  ! 3624: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xcea224c4  ! 3624: STWA_I	stwa	%r7, [%r8 + 0x04c4] %asi
	.word 0xc2320009  ! 3627: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc31a0009  ! 3627: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xc36a0009  ! 3627: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xca220009  ! 3630: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc6420009  ! 3630: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xc3ea1009  ! 3630: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xe33a0009  ! 3633: STDF_R	std	%f17, [%r9, %r8]
	.word 0xc6020009  ! 3633: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xc4ba1009  ! 3633: STDA_R	stda	%r2, [%r8 + %r9] 0x80
	.word 0xc93a0009  ! 3636: STDF_R	std	%f4, [%r9, %r8]
	.word 0xce0a0009  ! 3636: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xc2aa1009  ! 3636: STBA_R	stba	%r1, [%r8 + %r9] 0x80
	.word 0xea220009  ! 3639: STW_R	stw	%r21, [%r8 + %r9]
	.word 0xfa5a0009  ! 3639: LDX_R	ldx	[%r8 + %r9], %r29
	.word 0xc3ea2e78  ! 3639: PREFETCHA_I	prefetcha	[%r8, + 0x0e78] %asi, #one_read
	.word 0xcc320009  ! 3642: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc4420009  ! 3642: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0x8da209a9  ! 3642: FDIVs	fdivs	%f8, %f9, %f6
	.word 0xcc320009  ! 3645: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xce020009  ! 3645: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xfafa1009  ! 3645: SWAPA_R	swapa	%r29, [%r8 + %r9] 0x80
	.word 0xcf220009  ! 3648: STF_R	st	%f7, [%r9, %r8]
	.word 0xca420009  ! 3648: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0x8fa20829  ! 3648: FADDs	fadds	%f8, %f9, %f7
	.word 0xc53a0009  ! 3651: STDF_R	std	%f2, [%r9, %r8]
	.word 0xcd1a0009  ! 3651: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0x8e6a2ae0  ! 3651: UDIVX_I	udivx 	%r8, 0x0ae0, %r7
	.word 0xde320009  ! 3654: STH_R	sth	%r15, [%r8 + %r9]
	.word 0xe6420009  ! 3654: LDSW_R	ldsw	[%r8 + %r9], %r19
	.word 0x86fa23b0  ! 3654: SDIVcc_I	sdivcc 	%r8, 0x03b0, %r3
	.word 0xca720009  ! 3657: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xdc120009  ! 3657: LDUH_R	lduh	[%r8 + %r9], %r14
	.word 0xcdf21009  ! 3657: CASXA_I	casxa	[%r8] 0x80, %r9, %r6
	.word 0xc6320009  ! 3660: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc41a0009  ! 3660: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x87220009  ! 3660: MULScc_R	mulscc 	%r8, %r9, %r3
	.word 0xc4720009  ! 3663: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xec420009  ! 3663: LDSW_R	ldsw	[%r8 + %r9], %r22
	.word 0xc3ea2c24  ! 3663: PREFETCHA_I	prefetcha	[%r8, + 0x0c24] %asi, #one_read
	.word 0xc5220009  ! 3666: STF_R	st	%f2, [%r9, %r8]
	.word 0xce420009  ! 3666: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xc36a2f78  ! 3666: PREFETCH_I	prefetch	[%r8 + 0x0f78], #one_read
	.word 0xc42a0009  ! 3669: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc2420009  ! 3669: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xc2fa1009  ! 3669: SWAPA_R	swapa	%r1, [%r8 + %r9] 0x80
	.word 0xc7220009  ! 3672: STF_R	st	%f3, [%r9, %r8]
	.word 0xc65a0009  ! 3672: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0x8143c000  ! 3672: STBAR	stbar
	.word 0xcd3a0009  ! 3675: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc6520009  ! 3675: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xc49a1009  ! 3675: LDDA_R	ldda	[%r8, %r9] 0x80, %r2
	.word 0xe42a0009  ! 3678: STB_R	stb	%r18, [%r8 + %r9]
	.word 0xc85a0009  ! 3678: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xdeb21009  ! 3678: STHA_R	stha	%r15, [%r8 + %r9] 0x80
	.word 0xcf220009  ! 3681: STF_R	st	%f7, [%r9, %r8]
	.word 0xe4120009  ! 3681: LDUH_R	lduh	[%r8 + %r9], %r18
	.word 0x8a7a237c  ! 3681: SDIV_I	sdiv 	%r8, 0x037c, %r5
	.word 0xd6220009  ! 3684: STW_R	stw	%r11, [%r8 + %r9]
	.word 0xcc0a0009  ! 3684: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0x8ba20829  ! 3684: FADDs	fadds	%f8, %f9, %f5
	.word 0xc4720009  ! 3687: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xd8020009  ! 3687: LDUW_R	lduw	[%r8 + %r9], %r12
	.word 0x8e7a0009  ! 3687: SDIV_R	sdiv 	%r8, %r9, %r7
	.word 0xd6320009  ! 3690: STH_R	sth	%r11, [%r8 + %r9]
	.word 0xc5020009  ! 3690: LDF_R	ld	[%r8, %r9], %f2
	.word 0xc36a0009  ! 3690: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xcf3a0009  ! 3693: STDF_R	std	%f7, [%r9, %r8]
	.word 0xe4420009  ! 3693: LDSW_R	ldsw	[%r8 + %r9], %r18
	.word 0xb5a209a9  ! 3693: FDIVs	fdivs	%f8, %f9, %f26
	.word 0xc3220009  ! 3696: STF_R	st	%f1, [%r9, %r8]
	.word 0xc41a0009  ! 3696: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xae4a0009  ! 3696: MULX_R	mulx 	%r8, %r9, %r23
	.word 0xc62a0009  ! 3699: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc8020009  ! 3699: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xf3220009  ! 3699: STF_R	st	%f25, [%r9, %r8]
	.word 0xe4320009  ! 3702: STH_R	sth	%r18, [%r8 + %r9]
	.word 0xc60a0009  ! 3702: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xe6422888  ! 3702: LDSW_I	ldsw	[%r8 + 0x0888], %r19
	.word 0xc4720009  ! 3705: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc6520009  ! 3705: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xc3ea1009  ! 3705: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc42a0009  ! 3708: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xf7020009  ! 3708: LDF_R	ld	[%r8, %r9], %f27
	.word 0x16800001  ! 3708: BGE	bge  	<label_0x1>
	.word 0xce720009  ! 3711: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xce420009  ! 3711: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0x98d20009  ! 3711: UMULcc_R	umulcc 	%r8, %r9, %r12
	.word 0xde2a0009  ! 3714: STB_R	stb	%r15, [%r8 + %r9]
	.word 0xfa120009  ! 3714: LDUH_R	lduh	[%r8 + %r9], %r29
	.word 0x02c20001  ! 3714: BRZ	brz  ,nt	%8,<label_0x20001>
	.word 0xf9220009  ! 3717: STF_R	st	%f28, [%r9, %r8]
	.word 0xcc5a0009  ! 3717: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xce922bb4  ! 3717: LDUHA_I	lduha	[%r8, + 0x0bb4] %asi, %r7
	.word 0xda2a0009  ! 3720: STB_R	stb	%r13, [%r8 + %r9]
	.word 0xcf020009  ! 3720: LDF_R	ld	[%r8, %r9], %f7
	.word 0xeeda1009  ! 3720: LDXA_R	ldxa	[%r8, %r9] 0x80, %r23
	.word 0xc33a0009  ! 3723: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc6520009  ! 3723: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0x83a20829  ! 3723: FADDs	fadds	%f8, %f9, %f1
	.word 0xc6320009  ! 3726: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xca5a0009  ! 3726: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xaada0009  ! 3726: SMULcc_R	smulcc 	%r8, %r9, %r21
	.word 0xcc220009  ! 3729: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xce5a0009  ! 3729: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xcc6a0009  ! 3729: LDSTUB_R	ldstub	%r6, [%r8 + %r9]
	.word 0xc7220009  ! 3732: STF_R	st	%f3, [%r9, %r8]
	.word 0xc4520009  ! 3732: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xc3ea2790  ! 3732: PREFETCHA_I	prefetcha	[%r8, + 0x0790] %asi, #one_read
	.word 0xca2a0009  ! 3735: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xf20a0009  ! 3735: LDUB_R	ldub	[%r8 + %r9], %r25
	.word 0x8143e048  ! 3735: MEMBAR	membar	#StoreStore | #Sync 
	.word 0xf2720009  ! 3738: STX_R	stx	%r25, [%r8 + %r9]
	.word 0xc2020009  ! 3738: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xc5e21009  ! 3738: CASA_I	casa	[%r8] 0x80, %r9, %r2
	.word 0xcb220009  ! 3741: STF_R	st	%f5, [%r9, %r8]
	.word 0xcc4a0009  ! 3741: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xcb0226e0  ! 3741: LDF_I	ld	[%r8, 0x06e0], %f5
	.word 0xf4720009  ! 3744: STX_R	stx	%r26, [%r8 + %r9]
	.word 0xc6120009  ! 3744: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xb0da0009  ! 3744: SMULcc_R	smulcc 	%r8, %r9, %r24
	.word 0xc93a0009  ! 3747: STDF_R	std	%f4, [%r9, %r8]
	.word 0xc2120009  ! 3747: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0x8143e011  ! 3747: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xc7220009  ! 3750: STF_R	st	%f3, [%r9, %r8]
	.word 0xc44a0009  ! 3750: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0x8afa2008  ! 3750: SDIVcc_I	sdivcc 	%r8, 0x0008, %r5
	.word 0xc6720009  ! 3753: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xfa5a0009  ! 3753: LDX_R	ldx	[%r8 + %r9], %r29
	.word 0xc4fa2788  ! 3753: SWAPA_I	swapa	%r2, [%r8 + 0x0788] %asi
	.word 0xca720009  ! 3756: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xfc5a0009  ! 3756: LDX_R	ldx	[%r8 + %r9], %r30
	.word 0x8143e053  ! 3756: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside | #Sync 
	.word 0xc93a0009  ! 3759: STDF_R	std	%f4, [%r9, %r8]
	.word 0xc20a0009  ! 3759: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xc4ea1009  ! 3759: LDSTUBA_R	ldstuba	%r2, [%r8 + %r9] 0x80
	.word 0xe13a0009  ! 3762: STDF_R	std	%f16, [%r9, %r8]
	.word 0xc6420009  ! 3762: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0x8fa208a9  ! 3762: FSUBs	fsubs	%f8, %f9, %f7
	.word 0xcc720009  ! 3765: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xca020009  ! 3765: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xdfe22009  ! 3765: CASA_R	casa	[%r8] %asi, %r9, %r15
	.word 0xc2220009  ! 3768: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xf81a0009  ! 3768: LDD_R	ldd	[%r8 + %r9], %r28
	.word 0xdafa1009  ! 3768: SWAPA_R	swapa	%r13, [%r8 + %r9] 0x80
	.word 0xc8320009  ! 3771: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xd71a0009  ! 3771: LDDF_R	ldd	[%r8, %r9], %f11
	.word 0x8143e015  ! 3771: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside 
	.word 0xc2320009  ! 3774: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xf64a0009  ! 3774: LDSB_R	ldsb	[%r8 + %r9], %r27
	.word 0x847a0009  ! 3774: SDIV_R	sdiv 	%r8, %r9, %r2
	.word 0xca320009  ! 3777: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc84a0009  ! 3777: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xc4ca1009  ! 3777: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r2
	.word 0xe2220009  ! 3780: STW_R	stw	%r17, [%r8 + %r9]
	.word 0xcf020009  ! 3780: LDF_R	ld	[%r8, %r9], %f7
	.word 0xc27a0009  ! 3780: SWAP_R	swap	%r1, [%r8 + %r9]
	.word 0xde720009  ! 3783: STX_R	stx	%r15, [%r8 + %r9]
	.word 0xcb1a0009  ! 3783: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xf4fa1009  ! 3783: SWAPA_R	swapa	%r26, [%r8 + %r9] 0x80
	.word 0xff220009  ! 3786: STF_R	st	%f31, [%r9, %r8]
	.word 0xc64a0009  ! 3786: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xe53a29a8  ! 3786: STDF_I	std	%f18, [0x09a8, %r8]
	.word 0xdc2a0009  ! 3789: STB_R	stb	%r14, [%r8 + %r9]
	.word 0xca020009  ! 3789: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xc6da28b0  ! 3789: LDXA_I	ldxa	[%r8, + 0x08b0] %asi, %r3
	.word 0xcc220009  ! 3792: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xce0a0009  ! 3792: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xc45a0009  ! 3792: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xc9220009  ! 3795: STF_R	st	%f4, [%r9, %r8]
	.word 0xfc0a0009  ! 3795: LDUB_R	ldub	[%r8 + %r9], %r30
	.word 0x8c4a0009  ! 3795: MULX_R	mulx 	%r8, %r9, %r6
	.word 0xc7220009  ! 3798: STF_R	st	%f3, [%r9, %r8]
	.word 0xc2120009  ! 3798: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0x88720009  ! 3798: UDIV_R	udiv 	%r8, %r9, %r4
	.word 0xc8720009  ! 3801: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc91a0009  ! 3801: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0x8a7a24dc  ! 3801: SDIV_I	sdiv 	%r8, 0x04dc, %r5
	.word 0xcf220009  ! 3804: STF_R	st	%f7, [%r9, %r8]
	.word 0xca120009  ! 3804: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xc4822644  ! 3804: LDUWA_I	lduwa	[%r8, + 0x0644] %asi, %r2
	.word 0xc2320009  ! 3807: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xcc4a0009  ! 3807: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xa8520009  ! 3807: UMUL_R	umul 	%r8, %r9, %r20
	.word 0xc22a0009  ! 3810: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xca5a0009  ! 3810: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xc36a2c4c  ! 3810: PREFETCH_I	prefetch	[%r8 + 0x0c4c], #one_read
	.word 0xf73a0009  ! 3813: STDF_R	std	%f27, [%r9, %r8]
	.word 0xc9020009  ! 3813: LDF_R	ld	[%r8, %r9], %f4
	.word 0xc73a0009  ! 3813: STDF_R	std	%f3, [%r9, %r8]
	.word 0xe33a0009  ! 3816: STDF_R	std	%f17, [%r9, %r8]
	.word 0xcd020009  ! 3816: LDF_R	ld	[%r8, %r9], %f6
	.word 0x06800002  ! 3816: BL	bl  	<label_0x2>
	.word 0xc73a0009  ! 3819: STDF_R	std	%f3, [%r9, %r8]
	.word 0xf60a0009  ! 3819: LDUB_R	ldub	[%r8 + %r9], %r27
	.word 0xa3220009  ! 3819: MULScc_R	mulscc 	%r8, %r9, %r17
	.word 0xc2220009  ! 3822: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xd80a0009  ! 3822: LDUB_R	ldub	[%r8 + %r9], %r12
	.word 0x8a520009  ! 3822: UMUL_R	umul 	%r8, %r9, %r5
	.word 0xc8720009  ! 3825: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc31a0009  ! 3825: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xc8ea2bf4  ! 3825: LDSTUBA_I	ldstuba	%r4, [%r8 + 0x0bf4] %asi
	.word 0xc6320009  ! 3828: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc6520009  ! 3828: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xd8b21009  ! 3828: STHA_R	stha	%r12, [%r8 + %r9] 0x80
	.word 0xc9220009  ! 3831: STF_R	st	%f4, [%r9, %r8]
	.word 0xc5020009  ! 3831: LDF_R	ld	[%r8, %r9], %f2
	.word 0x84fa0009  ! 3831: SDIVcc_R	sdivcc 	%r8, %r9, %r2
	.word 0xc3220009  ! 3834: STF_R	st	%f1, [%r9, %r8]
	.word 0xc6020009  ! 3834: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0x8143e02b  ! 3834: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #MemIssue 
	.word 0xc8320009  ! 3837: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xfa020009  ! 3837: LDUW_R	lduw	[%r8 + %r9], %r29
	.word 0xc3ea1009  ! 3837: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xee2a0009  ! 3840: STB_R	stb	%r23, [%r8 + %r9]
	.word 0xda5a0009  ! 3840: LDX_R	ldx	[%r8 + %r9], %r13
	.word 0x8143e03e  ! 3840: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0xcb3a0009  ! 3843: STDF_R	std	%f5, [%r9, %r8]
	.word 0xcc520009  ! 3843: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xc36a0009  ! 3843: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xcf3a0009  ! 3846: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc2120009  ! 3846: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0x8b222650  ! 3846: MULScc_I	mulscc 	%r8, 0x0650, %r5
	.word 0xcc720009  ! 3849: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc25a0009  ! 3849: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0x88d221a8  ! 3849: UMULcc_I	umulcc 	%r8, 0x01a8, %r4
	.word 0xee720009  ! 3852: STX_R	stx	%r23, [%r8 + %r9]
	.word 0xcc1a0009  ! 3852: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xcc4a23d8  ! 3852: LDSB_I	ldsb	[%r8 + 0x03d8], %r6
	.word 0xc4220009  ! 3855: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xce5a0009  ! 3855: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xf6f22bb0  ! 3855: STXA_I	stxa	%r27, [%r8 + 0x0bb0] %asi
	.word 0xc7220009  ! 3858: STF_R	st	%f3, [%r9, %r8]
	.word 0xca5a0009  ! 3858: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xaed221a8  ! 3858: UMULcc_I	umulcc 	%r8, 0x01a8, %r23
	.word 0xce220009  ! 3861: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xce120009  ! 3861: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0x99a20929  ! 3861: FMULs	fmuls	%f8, %f9, %f12
	.word 0xf7220009  ! 3864: STF_R	st	%f27, [%r9, %r8]
	.word 0xc91a0009  ! 3864: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0x86520009  ! 3864: UMUL_R	umul 	%r8, %r9, %r3
	.word 0xcd220009  ! 3867: STF_R	st	%f6, [%r9, %r8]
	.word 0xde520009  ! 3867: LDSH_R	ldsh	[%r8 + %r9], %r15
	.word 0xc8f22fc0  ! 3867: STXA_I	stxa	%r4, [%r8 + 0x0fc0] %asi
	.word 0xee320009  ! 3870: STH_R	sth	%r23, [%r8 + %r9]
	.word 0xee0a0009  ! 3870: LDUB_R	ldub	[%r8 + %r9], %r23
	.word 0xca9227bc  ! 3870: LDUHA_I	lduha	[%r8, + 0x07bc] %asi, %r5
	.word 0xfa320009  ! 3873: STH_R	sth	%r29, [%r8 + %r9]
	.word 0xff1a0009  ! 3873: LDDF_R	ldd	[%r8, %r9], %f31
	.word 0xe6da1009  ! 3873: LDXA_R	ldxa	[%r8, %r9] 0x80, %r19
	.word 0xca720009  ! 3876: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc65a0009  ! 3876: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xc92220d0  ! 3876: STF_I	st	%f4, [0x00d0, %r8]
	.word 0xc53a0009  ! 3879: STDF_R	std	%f2, [%r9, %r8]
	.word 0xd65a0009  ! 3879: LDX_R	ldx	[%r8 + %r9], %r11
	.word 0x8143e07e  ! 3879: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xc33a0009  ! 3882: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc80a0009  ! 3882: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xc8ba2e20  ! 3882: STDA_I	stda	%r4, [%r8 + 0x0e20] %asi
	.word 0xc33a0009  ! 3885: STDF_R	std	%f1, [%r9, %r8]
	.word 0xf1020009  ! 3885: LDF_R	ld	[%r8, %r9], %f24
	.word 0xe53a28c8  ! 3885: STDF_I	std	%f18, [0x08c8, %r8]
	.word 0xe3220009  ! 3888: STF_R	st	%f17, [%r9, %r8]
	.word 0xc7020009  ! 3888: LDF_R	ld	[%r8, %r9], %f3
	.word 0xc3ea1009  ! 3888: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc2220009  ! 3891: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc45a0009  ! 3891: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0x08800001  ! 3891: BLEU	bleu  	<label_0x1>
	.word 0xfa720009  ! 3894: STX_R	stx	%r29, [%r8 + %r9]
	.word 0xfa0a0009  ! 3894: LDUB_R	ldub	[%r8 + %r9], %r29
	.word 0xccda1009  ! 3894: LDXA_R	ldxa	[%r8, %r9] 0x80, %r6
	.word 0xc3220009  ! 3897: STF_R	st	%f1, [%r9, %r8]
	.word 0xc85a0009  ! 3897: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xc36a2adc  ! 3897: PREFETCH_I	prefetch	[%r8 + 0x0adc], #one_read
	.word 0xc2720009  ! 3900: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc41a0009  ! 3900: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xc3ea2550  ! 3900: PREFETCHA_I	prefetcha	[%r8, + 0x0550] %asi, #one_read
	.word 0xc53a0009  ! 3903: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc84a0009  ! 3903: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xc67a23a4  ! 3903: SWAP_I	swap	%r3, [%r8 + 0x03a4]
	.word 0xf8720009  ! 3906: STX_R	stx	%r28, [%r8 + %r9]
	.word 0xcc020009  ! 3906: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0x984a0009  ! 3906: MULX_R	mulx 	%r8, %r9, %r12
	.word 0xcf220009  ! 3909: STF_R	st	%f7, [%r9, %r8]
	.word 0xc3020009  ! 3909: LDF_R	ld	[%r8, %r9], %f1
	.word 0x876a0009  ! 3909: SDIVX_R	sdivx	%r8, %r9, %r3
	.word 0xc2220009  ! 3912: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xec420009  ! 3912: LDSW_R	ldsw	[%r8 + %r9], %r22
	.word 0x8143e066  ! 3912: MEMBAR	membar	#StoreLoad | #LoadStore | #MemIssue | #Sync 
	.word 0xda2a0009  ! 3915: STB_R	stb	%r13, [%r8 + %r9]
	.word 0xe05a0009  ! 3915: LDX_R	ldx	[%r8 + %r9], %r16
	.word 0x83a20829  ! 3915: FADDs	fadds	%f8, %f9, %f1
	.word 0xcc220009  ! 3918: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc8520009  ! 3918: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xca7a0009  ! 3918: SWAP_R	swap	%r5, [%r8 + %r9]
	.word 0xca320009  ! 3921: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xda420009  ! 3921: LDSW_R	ldsw	[%r8 + %r9], %r13
	.word 0x8143c000  ! 3921: STBAR	stbar
	.word 0xce2a0009  ! 3924: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xca0a0009  ! 3924: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0x04c20001  ! 3924: BRLEZ	brlez  ,nt	%8,<label_0x20001>
	.word 0xc6720009  ! 3927: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc81a0009  ! 3927: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x8143c000  ! 3927: STBAR	stbar
	.word 0xc4220009  ! 3930: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc7020009  ! 3930: LDF_R	ld	[%r8, %r9], %f3
	.word 0xc36a2ba8  ! 3930: PREFETCH_I	prefetch	[%r8 + 0x0ba8], #one_read
	.word 0xf13a0009  ! 3933: STDF_R	std	%f24, [%r9, %r8]
	.word 0xce4a0009  ! 3933: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0x8143c000  ! 3933: STBAR	stbar
	.word 0xd6720009  ! 3936: STX_R	stx	%r11, [%r8 + %r9]
	.word 0xe65a0009  ! 3936: LDX_R	ldx	[%r8 + %r9], %r19
	.word 0xe1220009  ! 3936: STF_R	st	%f16, [%r9, %r8]
	.word 0xd8720009  ! 3939: STX_R	stx	%r12, [%r8 + %r9]
	.word 0xc8420009  ! 3939: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0x8143e07b  ! 3939: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xfc320009  ! 3942: STH_R	sth	%r30, [%r8 + %r9]
	.word 0xcb1a0009  ! 3942: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xc3220009  ! 3942: STF_R	st	%f1, [%r9, %r8]
	.word 0xc33a0009  ! 3945: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc8420009  ! 3945: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0x885a2f24  ! 3945: SMUL_I	smul 	%r8, 0x0f24, %r4
	.word 0xff220009  ! 3948: STF_R	st	%f31, [%r9, %r8]
	.word 0xc40a0009  ! 3948: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xa6522c2c  ! 3948: UMUL_I	umul 	%r8, 0x0c2c, %r19
	.word 0xec2a0009  ! 3951: STB_R	stb	%r22, [%r8 + %r9]
	.word 0xc41a0009  ! 3951: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xcc8a2298  ! 3951: LDUBA_I	lduba	[%r8, + 0x0298] %asi, %r6
	.word 0xc7220009  ! 3954: STF_R	st	%f3, [%r9, %r8]
	.word 0xcc4a0009  ! 3954: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xdaaa1009  ! 3954: STBA_R	stba	%r13, [%r8 + %r9] 0x80
	.word 0xe0320009  ! 3957: STH_R	sth	%r16, [%r8 + %r9]
	.word 0xc80a0009  ! 3957: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xc3ea23ec  ! 3957: PREFETCHA_I	prefetcha	[%r8, + 0x03ec] %asi, #one_read
	.word 0xc62a0009  ! 3960: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc24a0009  ! 3960: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xaa7a0009  ! 3960: SDIV_R	sdiv 	%r8, %r9, %r21
	.word 0xcc720009  ! 3963: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xf2020009  ! 3963: LDUW_R	lduw	[%r8 + %r9], %r25
	.word 0x8143e024  ! 3963: MEMBAR	membar	#LoadStore | #MemIssue 
	.word 0xf4720009  ! 3966: STX_R	stx	%r26, [%r8 + %r9]
	.word 0xc84a0009  ! 3966: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0x887a2924  ! 3966: SDIV_I	sdiv 	%r8, 0x0924, %r4
	.word 0xca320009  ! 3969: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc6020009  ! 3969: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xc36a0009  ! 3969: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xca220009  ! 3972: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xcc520009  ! 3972: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xcaca1009  ! 3972: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r5
	.word 0xf53a0009  ! 3975: STDF_R	std	%f26, [%r9, %r8]
	.word 0xd41a0009  ! 3975: LDD_R	ldd	[%r8 + %r9], %r10
	.word 0x1c800001  ! 3975: BPOS	bpos  	<label_0x1>
	.word 0xd8320009  ! 3978: STH_R	sth	%r12, [%r8 + %r9]
	.word 0xca420009  ! 3978: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0x86520009  ! 3978: UMUL_R	umul 	%r8, %r9, %r3
	.word 0xce720009  ! 3981: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc2020009  ! 3981: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xb76a0009  ! 3981: SDIVX_R	sdivx	%r8, %r9, %r27
	.word 0xc33a0009  ! 3984: STDF_R	std	%f1, [%r9, %r8]
	.word 0xdc020009  ! 3984: LDUW_R	lduw	[%r8 + %r9], %r14
	.word 0x986a2fbc  ! 3984: UDIVX_I	udivx 	%r8, 0x0fbc, %r12
	.word 0xd7220009  ! 3987: STF_R	st	%f11, [%r9, %r8]
	.word 0xc44a0009  ! 3987: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xc36a2aec  ! 3987: PREFETCH_I	prefetch	[%r8 + 0x0aec], #one_read
	.word 0xce2a0009  ! 3990: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xce0a0009  ! 3990: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xc8821009  ! 3990: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r4
	.word 0xc2220009  ! 3993: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xca420009  ! 3993: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xea4a2f3c  ! 3993: LDSB_I	ldsb	[%r8 + 0x0f3c], %r21
	.word 0xca220009  ! 3996: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xcb1a0009  ! 3996: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0x85a20829  ! 3996: FADDs	fadds	%f8, %f9, %f2
	.word 0xc82a0009  ! 3999: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xf41a0009  ! 3999: LDD_R	ldd	[%r8 + %r9], %r26
	.word 0x8143e012  ! 3999: MEMBAR	membar	#StoreLoad | #Lookaside 
        ta      T_GOOD_TRAP

th_main_2:
        setx  MAIN_BASE_DATA_VA, %r1, %r8
        setx  0x0000000000000e90, %g1, %r9
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
        setx  0xa3ebdb60d41597dc, %g1, %r0
        setx  0xc124f87d11c01650, %g1, %r1
        setx  0x8e0bf84ffe38a44a, %g1, %r2
        setx  0x18c081b1f6696e5c, %g1, %r3
        setx  0xf0644f6ebb9d718a, %g1, %r4
        setx  0x872e01c5958d49dd, %g1, %r5
        setx  0x051d0cb99882d72c, %g1, %r6
        setx  0x005dd6f810e18ce1, %g1, %r7
        setx  0xefd78acd5517ad67, %g1, %r10
        setx  0x3cb076207951adc9, %g1, %r11
        setx  0x17b922ff5eb9b6d1, %g1, %r12
        setx  0x70d307ea19a96cfd, %g1, %r13
        setx  0x1b4cd3bdd3304710, %g1, %r14
        setx  0x03ae3734e52377ef, %g1, %r15
        setx  0x71f11ddeb1f55ea7, %g1, %r16
        setx  0x7be27d94cb4418e4, %g1, %r17
        setx  0x46fdcd16c2a5e064, %g1, %r18
        setx  0xf6116b7a3ee283e8, %g1, %r19
        setx  0xd006665ab5e3b5b8, %g1, %r20
        setx  0x189baaeed7625ee9, %g1, %r21
        setx  0x45609c708d41b7ed, %g1, %r22
        setx  0x779aae64f72241b4, %g1, %r23
        setx  0xd9581a7a0c6b6c0f, %g1, %r24
        setx  0x5db9dcf4b5417028, %g1, %r25
        setx  0x34df23b4cfbe694a, %g1, %r26
        setx  0x9265cc517032488f, %g1, %r27
        setx  0xd0319b4267f2a22a, %g1, %r28
        setx  0xbf68fd926133733e, %g1, %r29
        setx  0xbf1ee33213002f8c, %g1, %r30
        setx  0xe6f34474d97a25f7, %g1, %r31
	.word 0xc22a0009  ! 3: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc41a0009  ! 3: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xaba20829  ! 3: FADDs	fadds	%f8, %f9, %f21
	.word 0xd8720009  ! 6: STX_R	stx	%r12, [%r8 + %r9]
	.word 0xec1a0009  ! 6: LDD_R	ldd	[%r8 + %r9], %r22
	.word 0x38800001  ! 6: BGU	bgu,a	<label_0x1>
	.word 0xc62a0009  ! 9: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xec020009  ! 9: LDUW_R	lduw	[%r8 + %r9], %r22
	.word 0x8143e066  ! 9: MEMBAR	membar	#StoreLoad | #LoadStore | #MemIssue | #Sync 
	.word 0xc2720009  ! 12: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xf0120009  ! 12: LDUH_R	lduh	[%r8 + %r9], %r24
	.word 0xc36a0009  ! 12: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xf8720009  ! 15: STX_R	stx	%r28, [%r8 + %r9]
	.word 0xcd020009  ! 15: LDF_R	ld	[%r8, %r9], %f6
	.word 0xc3ea2168  ! 15: PREFETCHA_I	prefetcha	[%r8, + 0x0168] %asi, #one_read
	.word 0xc2320009  ! 18: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc9020009  ! 18: LDF_R	ld	[%r8, %r9], %f4
	.word 0xb6fa2138  ! 18: SDIVcc_I	sdivcc 	%r8, 0x0138, %r27
	.word 0xcf220009  ! 21: STF_R	st	%f7, [%r9, %r8]
	.word 0xc51a0009  ! 21: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xddf22009  ! 21: CASXA_R	casxa	[%r8]%asi, %r9, %r14
	.word 0xfa320009  ! 24: STH_R	sth	%r29, [%r8 + %r9]
	.word 0xe81a0009  ! 24: LDD_R	ldd	[%r8 + %r9], %r20
	.word 0xc73a0009  ! 24: STDF_R	std	%f3, [%r9, %r8]
	.word 0xd73a0009  ! 27: STDF_R	std	%f11, [%r9, %r8]
	.word 0xc4420009  ! 27: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xe8ea2000  ! 27: LDSTUBA_I	ldstuba	%r20, [%r8 + 0x0000] %asi
	.word 0xc2220009  ! 30: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xda420009  ! 30: LDSW_R	ldsw	[%r8 + %r9], %r13
	.word 0x0cca0001  ! 30: BRGZ	brgz  ,pt	%8,<label_0xa0001>
	.word 0xc8220009  ! 33: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc2120009  ! 33: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xc8b22730  ! 33: STHA_I	stha	%r4, [%r8 + 0x0730] %asi
	.word 0xe7220009  ! 36: STF_R	st	%f19, [%r9, %r8]
	.word 0xf84a0009  ! 36: LDSB_R	ldsb	[%r8 + %r9], %r28
	.word 0xc3ea1009  ! 36: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc2720009  ! 39: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc7020009  ! 39: LDF_R	ld	[%r8, %r9], %f3
	.word 0x8143c000  ! 39: STBAR	stbar
	.word 0xfa720009  ! 42: STX_R	stx	%r29, [%r8 + %r9]
	.word 0xde5a0009  ! 42: LDX_R	ldx	[%r8 + %r9], %r15
	.word 0xb3a208a9  ! 42: FSUBs	fsubs	%f8, %f9, %f25
	.word 0xc62a0009  ! 45: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xce5a0009  ! 45: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xc8d21009  ! 45: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r4
	.word 0xc9220009  ! 48: STF_R	st	%f4, [%r9, %r8]
	.word 0xc2020009  ! 48: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xfcba1009  ! 48: STDA_R	stda	%r30, [%r8 + %r9] 0x80
	.word 0xc6720009  ! 51: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc3020009  ! 51: LDF_R	ld	[%r8, %r9], %f1
	.word 0xc2da2be8  ! 51: LDXA_I	ldxa	[%r8, + 0x0be8] %asi, %r1
	.word 0xec2a0009  ! 54: STB_R	stb	%r22, [%r8 + %r9]
	.word 0xf0420009  ! 54: LDSW_R	ldsw	[%r8 + %r9], %r24
	.word 0xcea21009  ! 54: STWA_R	stwa	%r7, [%r8 + %r9] 0x80
	.word 0xc4720009  ! 57: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc25a0009  ! 57: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xc7220009  ! 57: STF_R	st	%f3, [%r9, %r8]
	.word 0xc6220009  ! 60: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc80a0009  ! 60: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xccb21009  ! 60: STHA_R	stha	%r6, [%r8 + %r9] 0x80
	.word 0xca320009  ! 63: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc91a0009  ! 63: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xdb3a0009  ! 63: STDF_R	std	%f13, [%r9, %r8]
	.word 0xcb220009  ! 66: STF_R	st	%f5, [%r9, %r8]
	.word 0xc6020009  ! 66: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xe0fa2540  ! 66: SWAPA_I	swapa	%r16, [%r8 + 0x0540] %asi
	.word 0xed3a0009  ! 69: STDF_R	std	%f22, [%r9, %r8]
	.word 0xce420009  ! 69: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0x8143c000  ! 69: STBAR	stbar
	.word 0xca320009  ! 72: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xea0a0009  ! 72: LDUB_R	ldub	[%r8 + %r9], %r21
	.word 0xc3ea2fd4  ! 72: PREFETCHA_I	prefetcha	[%r8, + 0x0fd4] %asi, #one_read
	.word 0xc2720009  ! 75: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xf6120009  ! 75: LDUH_R	lduh	[%r8 + %r9], %r27
	.word 0xc27a0009  ! 75: SWAP_R	swap	%r1, [%r8 + %r9]
	.word 0xc7220009  ! 78: STF_R	st	%f3, [%r9, %r8]
	.word 0xce0a0009  ! 78: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xc36a0009  ! 78: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xe62a0009  ! 81: STB_R	stb	%r19, [%r8 + %r9]
	.word 0xc5020009  ! 81: LDF_R	ld	[%r8, %r9], %f2
	.word 0xc36a2874  ! 81: PREFETCH_I	prefetch	[%r8 + 0x0874], #one_read
	.word 0xe4720009  ! 84: STX_R	stx	%r18, [%r8 + %r9]
	.word 0xc8520009  ! 84: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0x8143e070  ! 84: MEMBAR	membar	#Lookaside | #MemIssue | #Sync 
	.word 0xc93a0009  ! 87: STDF_R	std	%f4, [%r9, %r8]
	.word 0xc8020009  ! 87: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xcb222fc4  ! 87: STF_I	st	%f5, [0x0fc4, %r8]
	.word 0xec220009  ! 90: STW_R	stw	%r22, [%r8 + %r9]
	.word 0xc9020009  ! 90: LDF_R	ld	[%r8, %r9], %f4
	.word 0xc0ba1009  ! 90: STDA_R	stda	%r0, [%r8 + %r9] 0x80
	.word 0xd7220009  ! 93: STF_R	st	%f11, [%r9, %r8]
	.word 0xfe020009  ! 93: LDUW_R	lduw	[%r8 + %r9], %r31
	.word 0xfaf22e00  ! 93: STXA_I	stxa	%r29, [%r8 + 0x0e00] %asi
	.word 0xda720009  ! 96: STX_R	stx	%r13, [%r8 + %r9]
	.word 0xe2420009  ! 96: LDSW_R	ldsw	[%r8 + %r9], %r17
	.word 0x867a2590  ! 96: SDIV_I	sdiv 	%r8, 0x0590, %r3
	.word 0xce720009  ! 99: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc65a0009  ! 99: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0x0cca0001  ! 99: BRGZ	brgz  ,pt	%8,<label_0xa0001>
	.word 0xc8220009  ! 102: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xe41a0009  ! 102: LDD_R	ldd	[%r8 + %r9], %r18
	.word 0x82fa0009  ! 102: SDIVcc_R	sdivcc 	%r8, %r9, %r1
	.word 0xca720009  ! 105: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc41a0009  ! 105: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xcbf21009  ! 105: CASXA_I	casxa	[%r8] 0x80, %r9, %r5
	.word 0xc2720009  ! 108: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc64a0009  ! 108: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xc4c21009  ! 108: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r2
	.word 0xc2720009  ! 111: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xcc1a0009  ! 111: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xceda1009  ! 111: LDXA_R	ldxa	[%r8, %r9] 0x80, %r7
	.word 0xcb220009  ! 114: STF_R	st	%f5, [%r9, %r8]
	.word 0xcc520009  ! 114: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0x8ba20929  ! 114: FMULs	fmuls	%f8, %f9, %f5
	.word 0xf3220009  ! 117: STF_R	st	%f25, [%r9, %r8]
	.word 0xc81a0009  ! 117: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x84fa2f90  ! 117: SDIVcc_I	sdivcc 	%r8, 0x0f90, %r2
	.word 0xc2220009  ! 120: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xcb020009  ! 120: LDF_R	ld	[%r8, %r9], %f5
	.word 0xcea21009  ! 120: STWA_R	stwa	%r7, [%r8 + %r9] 0x80
	.word 0xc8220009  ! 123: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc51a0009  ! 123: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xc3ea1009  ! 123: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xce220009  ! 126: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc45a0009  ! 126: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xc8ea1009  ! 126: LDSTUBA_R	ldstuba	%r4, [%r8 + %r9] 0x80
	.word 0xcc220009  ! 129: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc01a0009  ! 129: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0xf2a22c64  ! 129: STWA_I	stwa	%r25, [%r8 + 0x0c64] %asi
	.word 0xca220009  ! 132: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xf45a0009  ! 132: LDX_R	ldx	[%r8 + %r9], %r26
	.word 0x89220009  ! 132: MULScc_R	mulscc 	%r8, %r9, %r4
	.word 0xc33a0009  ! 135: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc4120009  ! 135: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xcf1a0009  ! 135: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xe3220009  ! 138: STF_R	st	%f17, [%r9, %r8]
	.word 0xca520009  ! 138: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xc89a2fa8  ! 138: LDDA_I	ldda	[%r8, + 0x0fa8] %asi, %r4
	.word 0xe42a0009  ! 141: STB_R	stb	%r18, [%r8 + %r9]
	.word 0xce520009  ! 141: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xf8da1009  ! 141: LDXA_R	ldxa	[%r8, %r9] 0x80, %r28
	.word 0xdd220009  ! 144: STF_R	st	%f14, [%r9, %r8]
	.word 0xf0520009  ! 144: LDSH_R	ldsh	[%r8 + %r9], %r24
	.word 0xc4d21009  ! 144: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r2
	.word 0xd6720009  ! 147: STX_R	stx	%r11, [%r8 + %r9]
	.word 0xc3020009  ! 147: LDF_R	ld	[%r8, %r9], %f1
	.word 0x8e7225dc  ! 147: UDIV_I	udiv 	%r8, 0x05dc, %r7
	.word 0xcc220009  ! 150: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xcf1a0009  ! 150: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xce7a2994  ! 150: SWAP_I	swap	%r7, [%r8 + 0x0994]
	.word 0xc2720009  ! 153: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xcc5a0009  ! 153: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xc3ea2ad8  ! 153: PREFETCHA_I	prefetcha	[%r8, + 0x0ad8] %asi, #one_read
	.word 0xc3220009  ! 156: STF_R	st	%f1, [%r9, %r8]
	.word 0xf0520009  ! 156: LDSH_R	ldsh	[%r8 + %r9], %r24
	.word 0x2c800002  ! 156: BNEG	bneg,a	<label_0x2>
	.word 0xc22a0009  ! 159: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc84a0009  ! 159: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0x8143e00b  ! 159: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore 
	.word 0xcc220009  ! 162: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc40a0009  ! 162: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0x0ac20001  ! 162: BRNZ	brnz  ,nt	%8,<label_0x20001>
	.word 0xc93a0009  ! 165: STDF_R	std	%f4, [%r9, %r8]
	.word 0xcc420009  ! 165: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xada208a9  ! 165: FSUBs	fsubs	%f8, %f9, %f22
	.word 0xce2a0009  ! 168: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xcd1a0009  ! 168: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0x8cd20009  ! 168: UMULcc_R	umulcc 	%r8, %r9, %r6
	.word 0xcc220009  ! 171: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc6020009  ! 171: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xfc9a22d0  ! 171: LDDA_I	ldda	[%r8, + 0x02d0] %asi, %r30
	.word 0xc8220009  ! 174: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc9020009  ! 174: LDF_R	ld	[%r8, %r9], %f4
	.word 0x82f22324  ! 174: UDIVcc_I	udivcc 	%r8, 0x0324, %r1
	.word 0xcd220009  ! 177: STF_R	st	%f6, [%r9, %r8]
	.word 0xcf020009  ! 177: LDF_R	ld	[%r8, %r9], %f7
	.word 0xc60a2ba4  ! 177: LDUB_I	ldub	[%r8 + 0x0ba4], %r3
	.word 0xc6720009  ! 180: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xe0020009  ! 180: LDUW_R	lduw	[%r8 + %r9], %r16
	.word 0xb45a0009  ! 180: SMUL_R	smul 	%r8, %r9, %r26
	.word 0xcc2a0009  ! 183: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc31a0009  ! 183: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0x82d20009  ! 183: UMULcc_R	umulcc 	%r8, %r9, %r1
	.word 0xc22a0009  ! 186: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc60a0009  ! 186: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xcc0a0009  ! 186: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xc8720009  ! 189: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xce5a0009  ! 189: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xca4a2fdc  ! 189: LDSB_I	ldsb	[%r8 + 0x0fdc], %r5
	.word 0xce220009  ! 192: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xcd020009  ! 192: LDF_R	ld	[%r8, %r9], %f6
	.word 0x98fa0009  ! 192: SDIVcc_R	sdivcc 	%r8, %r9, %r12
	.word 0xe6220009  ! 195: STW_R	stw	%r19, [%r8 + %r9]
	.word 0xcc120009  ! 195: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0x864a0009  ! 195: MULX_R	mulx 	%r8, %r9, %r3
	.word 0xcc720009  ! 198: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc64a0009  ! 198: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0x8143e03c  ! 198: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0xc6220009  ! 201: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc8120009  ! 201: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0x87a209a9  ! 201: FDIVs	fdivs	%f8, %f9, %f3
	.word 0xe5220009  ! 204: STF_R	st	%f18, [%r9, %r8]
	.word 0xde4a0009  ! 204: LDSB_R	ldsb	[%r8 + %r9], %r15
	.word 0xca8a2564  ! 204: LDUBA_I	lduba	[%r8, + 0x0564] %asi, %r5
	.word 0xca720009  ! 207: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc91a0009  ! 207: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xcb222ed4  ! 207: STF_I	st	%f5, [0x0ed4, %r8]
	.word 0xcc320009  ! 210: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc2020009  ! 210: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xe11a22d8  ! 210: LDDF_I	ldd	[%r8, 0x02d8], %f16
	.word 0xc4320009  ! 213: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xcc0a0009  ! 213: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xc36a0009  ! 213: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc62a0009  ! 216: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xca420009  ! 216: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xceca1009  ! 216: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r7
	.word 0xe73a0009  ! 219: STDF_R	std	%f19, [%r9, %r8]
	.word 0xfc5a0009  ! 219: LDX_R	ldx	[%r8 + %r9], %r30
	.word 0xc93a26b0  ! 219: STDF_I	std	%f4, [0x06b0, %r8]
	.word 0xff220009  ! 222: STF_R	st	%f31, [%r9, %r8]
	.word 0xc31a0009  ! 222: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0x8143e031  ! 222: MEMBAR	membar	#LoadLoad | #Lookaside | #MemIssue 
	.word 0xc2320009  ! 225: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc40a0009  ! 225: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xc7220009  ! 225: STF_R	st	%f3, [%r9, %r8]
	.word 0xca2a0009  ! 228: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xdc420009  ! 228: LDSW_R	ldsw	[%r8 + %r9], %r14
	.word 0xa25223fc  ! 228: UMUL_I	umul 	%r8, 0x03fc, %r17
	.word 0xf13a0009  ! 231: STDF_R	std	%f24, [%r9, %r8]
	.word 0xcb1a0009  ! 231: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xf08a2f5c  ! 231: LDUBA_I	lduba	[%r8, + 0x0f5c] %asi, %r24
	.word 0xce720009  ! 234: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xeb1a0009  ! 234: LDDF_R	ldd	[%r8, %r9], %f21
	.word 0xf2b21009  ! 234: STHA_R	stha	%r25, [%r8 + %r9] 0x80
	.word 0xc33a0009  ! 237: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc81a0009  ! 237: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x8ba20829  ! 237: FADDs	fadds	%f8, %f9, %f5
	.word 0xda2a0009  ! 240: STB_R	stb	%r13, [%r8 + %r9]
	.word 0xce0a0009  ! 240: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xf73a0009  ! 240: STDF_R	std	%f27, [%r9, %r8]
	.word 0xdd3a0009  ! 243: STDF_R	std	%f14, [%r9, %r8]
	.word 0xcc020009  ! 243: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0x844a0009  ! 243: MULX_R	mulx 	%r8, %r9, %r2
	.word 0xc8320009  ! 246: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc8020009  ! 246: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xc8fa1009  ! 246: SWAPA_R	swapa	%r4, [%r8 + %r9] 0x80
	.word 0xc6220009  ! 249: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xfb1a0009  ! 249: LDDF_R	ldd	[%r8, %r9], %f29
	.word 0xc73a0009  ! 249: STDF_R	std	%f3, [%r9, %r8]
	.word 0xe82a0009  ! 252: STB_R	stb	%r20, [%r8 + %r9]
	.word 0xde120009  ! 252: LDUH_R	lduh	[%r8 + %r9], %r15
	.word 0xc4fa2720  ! 252: SWAPA_I	swapa	%r2, [%r8 + 0x0720] %asi
	.word 0xc2220009  ! 255: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xe4420009  ! 255: LDSW_R	ldsw	[%r8 + %r9], %r18
	.word 0x8e5221c0  ! 255: UMUL_I	umul 	%r8, 0x01c0, %r7
	.word 0xca2a0009  ! 258: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xe9020009  ! 258: LDF_R	ld	[%r8, %r9], %f20
	.word 0xc3f22009  ! 258: CASXA_R	casxa	[%r8]%asi, %r9, %r1
	.word 0xc5220009  ! 261: STF_R	st	%f2, [%r9, %r8]
	.word 0xca5a0009  ! 261: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xee122208  ! 261: LDUH_I	lduh	[%r8 + 0x0208], %r23
	.word 0xc8320009  ! 264: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xea0a0009  ! 264: LDUB_R	ldub	[%r8 + %r9], %r21
	.word 0xc36a2ae4  ! 264: PREFETCH_I	prefetch	[%r8 + 0x0ae4], #one_read
	.word 0xe9220009  ! 267: STF_R	st	%f20, [%r9, %r8]
	.word 0xca120009  ! 267: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xccba1009  ! 267: STDA_R	stda	%r6, [%r8 + %r9] 0x80
	.word 0xc4320009  ! 270: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xe45a0009  ! 270: LDX_R	ldx	[%r8 + %r9], %r18
	.word 0x89a20829  ! 270: FADDs	fadds	%f8, %f9, %f4
	.word 0xc82a0009  ! 273: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xf44a0009  ! 273: LDSB_R	ldsb	[%r8 + %r9], %r26
	.word 0xdaea1009  ! 273: LDSTUBA_R	ldstuba	%r13, [%r8 + %r9] 0x80
	.word 0xc4220009  ! 276: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xfc520009  ! 276: LDSH_R	ldsh	[%r8 + %r9], %r30
	.word 0xc27a2108  ! 276: SWAP_I	swap	%r1, [%r8 + 0x0108]
	.word 0xc4720009  ! 279: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc80a0009  ! 279: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0x18800002  ! 279: BGU	bgu  	<label_0x2>
	.word 0xc2220009  ! 282: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc6420009  ! 282: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xe20a2c94  ! 282: LDUB_I	ldub	[%r8 + 0x0c94], %r17
	.word 0xca2a0009  ! 285: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xe41a0009  ! 285: LDD_R	ldd	[%r8 + %r9], %r18
	.word 0xc36a2998  ! 285: PREFETCH_I	prefetch	[%r8 + 0x0998], #one_read
	.word 0xca320009  ! 288: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xca5a0009  ! 288: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0x8143c000  ! 288: STBAR	stbar
	.word 0xef3a0009  ! 291: STDF_R	std	%f23, [%r9, %r8]
	.word 0xc6120009  ! 291: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xf8fa236c  ! 291: SWAPA_I	swapa	%r28, [%r8 + 0x036c] %asi
	.word 0xc3220009  ! 294: STF_R	st	%f1, [%r9, %r8]
	.word 0xc2120009  ! 294: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xc89a2e00  ! 294: LDDA_I	ldda	[%r8, + 0x0e00] %asi, %r4
	.word 0xce720009  ! 297: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc64a0009  ! 297: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0x8f2224cc  ! 297: MULScc_I	mulscc 	%r8, 0x04cc, %r7
	.word 0xcd3a0009  ! 300: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc3020009  ! 300: LDF_R	ld	[%r8, %r9], %f1
	.word 0xf45a2738  ! 300: LDX_I	ldx	[%r8 + 0x0738], %r26
	.word 0xc2720009  ! 303: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xcf1a0009  ! 303: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xfaea21c4  ! 303: LDSTUBA_I	ldstuba	%r29, [%r8 + 0x01c4] %asi
	.word 0xd8320009  ! 306: STH_R	sth	%r12, [%r8 + %r9]
	.word 0xfe520009  ! 306: LDSH_R	ldsh	[%r8 + %r9], %r31
	.word 0x87220009  ! 306: MULScc_R	mulscc 	%r8, %r9, %r3
	.word 0xc2720009  ! 309: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xe81a0009  ! 309: LDD_R	ldd	[%r8 + %r9], %r20
	.word 0xe01a0009  ! 309: LDD_R	ldd	[%r8 + %r9], %r16
	.word 0xc53a0009  ! 312: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc4420009  ! 312: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0x1a800001  ! 312: BCC	bcc  	<label_0x1>
	.word 0xc6320009  ! 315: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xcc520009  ! 315: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xcc0a0009  ! 315: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xde220009  ! 318: STW_R	stw	%r15, [%r8 + %r9]
	.word 0xcc0a0009  ! 318: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xea4a29bc  ! 318: LDSB_I	ldsb	[%r8 + 0x09bc], %r21
	.word 0xcb3a0009  ! 321: STDF_R	std	%f5, [%r9, %r8]
	.word 0xc2120009  ! 321: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xc3ea2314  ! 321: PREFETCHA_I	prefetcha	[%r8, + 0x0314] %asi, #one_read
	.word 0xc9220009  ! 324: STF_R	st	%f4, [%r9, %r8]
	.word 0xc24a0009  ! 324: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xccaa29ec  ! 324: STBA_I	stba	%r6, [%r8 + 0x09ec] %asi
	.word 0xc8220009  ! 327: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc4420009  ! 327: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0x89a20929  ! 327: FMULs	fmuls	%f8, %f9, %f4
	.word 0xcc2a0009  ! 330: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xe9020009  ! 330: LDF_R	ld	[%r8, %r9], %f20
	.word 0xc3ea1009  ! 330: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xcf220009  ! 333: STF_R	st	%f7, [%r9, %r8]
	.word 0xcc0a0009  ! 333: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0x0a800002  ! 333: BCS	bcs  	<label_0x2>
	.word 0xf1220009  ! 336: STF_R	st	%f24, [%r9, %r8]
	.word 0xce020009  ! 336: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xc8ea1009  ! 336: LDSTUBA_R	ldstuba	%r4, [%r8 + %r9] 0x80
	.word 0xf0720009  ! 339: STX_R	stx	%r24, [%r8 + %r9]
	.word 0xcc520009  ! 339: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0x8e4a0009  ! 339: MULX_R	mulx 	%r8, %r9, %r7
	.word 0xc4320009  ! 342: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xca0a0009  ! 342: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0x9f6a0009  ! 342: SDIVX_R	sdivx	%r8, %r9, %r15
	.word 0xe33a0009  ! 345: STDF_R	std	%f17, [%r9, %r8]
	.word 0xc80a0009  ! 345: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0x8143c000  ! 345: STBAR	stbar
	.word 0xc4220009  ! 348: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xcc1a0009  ! 348: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xdeb21009  ! 348: STHA_R	stha	%r15, [%r8 + %r9] 0x80
	.word 0xf3220009  ! 351: STF_R	st	%f25, [%r9, %r8]
	.word 0xce5a0009  ! 351: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0x8143e01b  ! 351: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Lookaside 
	.word 0xc2320009  ! 354: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc71a0009  ! 354: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0x885a0009  ! 354: SMUL_R	smul 	%r8, %r9, %r4
	.word 0xc4720009  ! 357: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xce520009  ! 357: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xc36a25b4  ! 357: PREFETCH_I	prefetch	[%r8 + 0x05b4], #one_read
	.word 0xdc220009  ! 360: STW_R	stw	%r14, [%r8 + %r9]
	.word 0xc7020009  ! 360: LDF_R	ld	[%r8, %r9], %f3
	.word 0xb3220009  ! 360: MULScc_R	mulscc 	%r8, %r9, %r25
	.word 0xcf220009  ! 363: STF_R	st	%f7, [%r9, %r8]
	.word 0xc24a0009  ! 363: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0x84da0009  ! 363: SMULcc_R	smulcc 	%r8, %r9, %r2
	.word 0xe73a0009  ! 366: STDF_R	std	%f19, [%r9, %r8]
	.word 0xc2120009  ! 366: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0x0a800002  ! 366: BCS	bcs  	<label_0x2>
	.word 0xc6720009  ! 369: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xec1a0009  ! 369: LDD_R	ldd	[%r8 + %r9], %r22
	.word 0xc5e21009  ! 369: CASA_I	casa	[%r8] 0x80, %r9, %r2
	.word 0xfe2a0009  ! 372: STB_R	stb	%r31, [%r8 + %r9]
	.word 0xf0120009  ! 372: LDUH_R	lduh	[%r8 + %r9], %r24
	.word 0x02800001  ! 372: BE	be  	<label_0x1>
	.word 0xce320009  ! 375: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xcc020009  ! 375: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0x82722858  ! 375: UDIV_I	udiv 	%r8, 0x0858, %r1
	.word 0xea320009  ! 378: STH_R	sth	%r21, [%r8 + %r9]
	.word 0xe41a0009  ! 378: LDD_R	ldd	[%r8 + %r9], %r18
	.word 0x12800001  ! 378: BNE	bne  	<label_0x1>
	.word 0xd82a0009  ! 381: STB_R	stb	%r12, [%r8 + %r9]
	.word 0xcc1a0009  ! 381: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xc9e22009  ! 381: CASA_R	casa	[%r8] %asi, %r9, %r4
	.word 0xcd220009  ! 384: STF_R	st	%f6, [%r9, %r8]
	.word 0xec0a0009  ! 384: LDUB_R	ldub	[%r8 + %r9], %r22
	.word 0xb5a208a9  ! 384: FSUBs	fsubs	%f8, %f9, %f26
	.word 0xe02a0009  ! 387: STB_R	stb	%r16, [%r8 + %r9]
	.word 0xf7020009  ! 387: LDF_R	ld	[%r8, %r9], %f27
	.word 0xc3ea1009  ! 387: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xf4320009  ! 390: STH_R	sth	%r26, [%r8 + %r9]
	.word 0xca120009  ! 390: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xc3ea2c4c  ! 390: PREFETCHA_I	prefetcha	[%r8, + 0x0c4c] %asi, #one_read
	.word 0xe2720009  ! 393: STX_R	stx	%r17, [%r8 + %r9]
	.word 0xc45a0009  ! 393: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xc3ea26d8  ! 393: PREFETCHA_I	prefetcha	[%r8, + 0x06d8] %asi, #one_read
	.word 0xc4220009  ! 396: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc2020009  ! 396: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xb9a208a9  ! 396: FSUBs	fsubs	%f8, %f9, %f28
	.word 0xcf3a0009  ! 399: STDF_R	std	%f7, [%r9, %r8]
	.word 0xca520009  ! 399: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0x8fa209a9  ! 399: FDIVs	fdivs	%f8, %f9, %f7
	.word 0xca2a0009  ! 402: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xed1a0009  ! 402: LDDF_R	ldd	[%r8, %r9], %f22
	.word 0x86522fb0  ! 402: UMUL_I	umul 	%r8, 0x0fb0, %r3
	.word 0xf13a0009  ! 405: STDF_R	std	%f24, [%r9, %r8]
	.word 0xc2120009  ! 405: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xc702203c  ! 405: LDF_I	ld	[%r8, 0x003c], %f3
	.word 0xc8220009  ! 408: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc2020009  ! 408: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0x8c520009  ! 408: UMUL_R	umul 	%r8, %r9, %r6
	.word 0xf0220009  ! 411: STW_R	stw	%r24, [%r8 + %r9]
	.word 0xc8120009  ! 411: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0x2eca0001  ! 411: BRGEZ	brgez,a,pt	%8,<label_0xa0001>
	.word 0xc9220009  ! 414: STF_R	st	%f4, [%r9, %r8]
	.word 0xc3020009  ! 414: LDF_R	ld	[%r8, %r9], %f1
	.word 0xbf220009  ! 414: MULScc_R	mulscc 	%r8, %r9, %r31
	.word 0xcd3a0009  ! 417: STDF_R	std	%f6, [%r9, %r8]
	.word 0xec4a0009  ! 417: LDSB_R	ldsb	[%r8 + %r9], %r22
	.word 0xbda20829  ! 417: FADDs	fadds	%f8, %f9, %f30
	.word 0xca220009  ! 420: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xe6120009  ! 420: LDUH_R	lduh	[%r8 + %r9], %r19
	.word 0xc6d2269c  ! 420: LDSHA_I	ldsha	[%r8, + 0x069c] %asi, %r3
	.word 0xc2320009  ! 423: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xd9020009  ! 423: LDF_R	ld	[%r8, %r9], %f12
	.word 0xa6522944  ! 423: UMUL_I	umul 	%r8, 0x0944, %r19
	.word 0xcd3a0009  ! 426: STDF_R	std	%f6, [%r9, %r8]
	.word 0xf31a0009  ! 426: LDDF_R	ldd	[%r8, %r9], %f25
	.word 0xe93a2b98  ! 426: STDF_I	std	%f20, [0x0b98, %r8]
	.word 0xc4220009  ! 429: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xce020009  ! 429: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0x04800002  ! 429: BLE	ble  	<label_0x2>
	.word 0xc2220009  ! 432: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc51a0009  ! 432: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xc93a2c70  ! 432: STDF_I	std	%f4, [0x0c70, %r8]
	.word 0xc8320009  ! 435: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xdc420009  ! 435: LDSW_R	ldsw	[%r8 + %r9], %r14
	.word 0xc6aa1009  ! 435: STBA_R	stba	%r3, [%r8 + %r9] 0x80
	.word 0xf6220009  ! 438: STW_R	stw	%r27, [%r8 + %r9]
	.word 0xc6520009  ! 438: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xceca1009  ! 438: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r7
	.word 0xc42a0009  ! 441: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xce020009  ! 441: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0x0c800001  ! 441: BNEG	bneg  	<label_0x1>
	.word 0xcd220009  ! 444: STF_R	st	%f6, [%r9, %r8]
	.word 0xda4a0009  ! 444: LDSB_R	ldsb	[%r8 + %r9], %r13
	.word 0x825a26dc  ! 444: SMUL_I	smul 	%r8, 0x06dc, %r1
	.word 0xc8320009  ! 447: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc8520009  ! 447: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xd6fa1009  ! 447: SWAPA_R	swapa	%r11, [%r8 + %r9] 0x80
	.word 0xd6320009  ! 450: STH_R	sth	%r11, [%r8 + %r9]
	.word 0xce0a0009  ! 450: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0x8143e032  ! 450: MEMBAR	membar	#StoreLoad | #Lookaside | #MemIssue 
	.word 0xce320009  ! 453: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xcc520009  ! 453: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xafa208a9  ! 453: FSUBs	fsubs	%f8, %f9, %f23
	.word 0xca220009  ! 456: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc84a0009  ! 456: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xcb3a0009  ! 456: STDF_R	std	%f5, [%r9, %r8]
	.word 0xc22a0009  ! 459: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xea020009  ! 459: LDUW_R	lduw	[%r8 + %r9], %r21
	.word 0xc2f21009  ! 459: STXA_R	stxa	%r1, [%r8 + %r9] 0x80
	.word 0xd6720009  ! 462: STX_R	stx	%r11, [%r8 + %r9]
	.word 0xc20a0009  ! 462: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xce020009  ! 462: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xcf3a0009  ! 465: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc8020009  ! 465: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0x8143c000  ! 465: STBAR	stbar
	.word 0xc4220009  ! 468: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xec420009  ! 468: LDSW_R	ldsw	[%r8 + %r9], %r22
	.word 0x3a800001  ! 468: BCC	bcc,a	<label_0x1>
	.word 0xc3220009  ! 471: STF_R	st	%f1, [%r9, %r8]
	.word 0xca420009  ! 471: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xae4a2650  ! 471: MULX_I	mulx 	%r8, 0x0650, %r23
	.word 0xce720009  ! 474: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc9020009  ! 474: LDF_R	ld	[%r8, %r9], %f4
	.word 0xcaca2340  ! 474: LDSBA_I	ldsba	[%r8, + 0x0340] %asi, %r5
	.word 0xce320009  ! 477: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc2120009  ! 477: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xc36a0009  ! 477: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc22a0009  ! 480: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xca0a0009  ! 480: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0x864a20f4  ! 480: MULX_I	mulx 	%r8, 0x00f4, %r3
	.word 0xc4320009  ! 483: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc45a0009  ! 483: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0x8143c000  ! 483: STBAR	stbar
	.word 0xc62a0009  ! 486: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xf00a0009  ! 486: LDUB_R	ldub	[%r8 + %r9], %r24
	.word 0xc6f21009  ! 486: STXA_R	stxa	%r3, [%r8 + %r9] 0x80
	.word 0xcc720009  ! 489: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xcc020009  ! 489: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xcb220009  ! 489: STF_R	st	%f5, [%r9, %r8]
	.word 0xcc720009  ! 492: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc25a0009  ! 492: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xc8da2148  ! 492: LDXA_I	ldxa	[%r8, + 0x0148] %asi, %r4
	.word 0xfe720009  ! 495: STX_R	stx	%r31, [%r8 + %r9]
	.word 0xc4020009  ! 495: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0x2a800001  ! 495: BCS	bcs,a	<label_0x1>
	.word 0xf9220009  ! 498: STF_R	st	%f28, [%r9, %r8]
	.word 0xc91a0009  ! 498: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0x26800002  ! 498: BL	bl,a	<label_0x2>
	.word 0xe73a0009  ! 501: STDF_R	std	%f19, [%r9, %r8]
	.word 0xc44a0009  ! 501: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xc8fa1009  ! 501: SWAPA_R	swapa	%r4, [%r8 + %r9] 0x80
	.word 0xcb220009  ! 504: STF_R	st	%f5, [%r9, %r8]
	.word 0xfc120009  ! 504: LDUH_R	lduh	[%r8 + %r9], %r30
	.word 0x886a0009  ! 504: UDIVX_R	udivx 	%r8, %r9, %r4
	.word 0xc7220009  ! 507: STF_R	st	%f3, [%r9, %r8]
	.word 0xc81a0009  ! 507: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x2a800001  ! 507: BCS	bcs,a	<label_0x1>
	.word 0xc5220009  ! 510: STF_R	st	%f2, [%r9, %r8]
	.word 0xca0a0009  ! 510: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xc7e21009  ! 510: CASA_I	casa	[%r8] 0x80, %r9, %r3
	.word 0xd6320009  ! 513: STH_R	sth	%r11, [%r8 + %r9]
	.word 0xf0520009  ! 513: LDSH_R	ldsh	[%r8 + %r9], %r24
	.word 0xe2a22d50  ! 513: STWA_I	stwa	%r17, [%r8 + 0x0d50] %asi
	.word 0xcf220009  ! 516: STF_R	st	%f7, [%r9, %r8]
	.word 0xee420009  ! 516: LDSW_R	ldsw	[%r8 + %r9], %r23
	.word 0xc3ea2cd4  ! 516: PREFETCHA_I	prefetcha	[%r8, + 0x0cd4] %asi, #one_read
	.word 0xca220009  ! 519: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc20a0009  ! 519: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xc8da1009  ! 519: LDXA_R	ldxa	[%r8, %r9] 0x80, %r4
	.word 0xfa320009  ! 522: STH_R	sth	%r29, [%r8 + %r9]
	.word 0xc80a0009  ! 522: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0x8143e004  ! 522: MEMBAR	membar	#LoadStore 
	.word 0xe2320009  ! 525: STH_R	sth	%r17, [%r8 + %r9]
	.word 0xc24a0009  ! 525: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xceb229e0  ! 525: STHA_I	stha	%r7, [%r8 + 0x09e0] %asi
	.word 0xc6220009  ! 528: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xcb020009  ! 528: LDF_R	ld	[%r8, %r9], %f5
	.word 0xc6922c04  ! 528: LDUHA_I	lduha	[%r8, + 0x0c04] %asi, %r3
	.word 0xcf220009  ! 531: STF_R	st	%f7, [%r9, %r8]
	.word 0xcd020009  ! 531: LDF_R	ld	[%r8, %r9], %f6
	.word 0xc20a2bd8  ! 531: LDUB_I	ldub	[%r8 + 0x0bd8], %r1
	.word 0xce2a0009  ! 534: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc40a0009  ! 534: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xccba2420  ! 534: STDA_I	stda	%r6, [%r8 + 0x0420] %asi
	.word 0xcc720009  ! 537: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xce4a0009  ! 537: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0x8143c000  ! 537: STBAR	stbar
	.word 0xc6720009  ! 540: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xd7020009  ! 540: LDF_R	ld	[%r8, %r9], %f11
	.word 0x84f20009  ! 540: UDIVcc_R	udivcc 	%r8, %r9, %r2
	.word 0xcb220009  ! 543: STF_R	st	%f5, [%r9, %r8]
	.word 0xc71a0009  ! 543: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0x02c20001  ! 543: BRZ	brz  ,nt	%8,<label_0x20001>
	.word 0xc8220009  ! 546: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xe31a0009  ! 546: LDDF_R	ldd	[%r8, %r9], %f17
	.word 0x8143e01a  ! 546: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside 
	.word 0xc9220009  ! 549: STF_R	st	%f4, [%r9, %r8]
	.word 0xcc420009  ! 549: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xea921009  ! 549: LDUHA_R	lduha	[%r8, %r9] 0x80, %r21
	.word 0xc82a0009  ! 552: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xce420009  ! 552: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xda6a2ce4  ! 552: LDSTUB_I	ldstub	%r13, [%r8 + 0x0ce4]
	.word 0xc8320009  ! 555: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xcb020009  ! 555: LDF_R	ld	[%r8, %r9], %f5
	.word 0xc8d21009  ! 555: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r4
	.word 0xca220009  ! 558: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xda520009  ! 558: LDSH_R	ldsh	[%r8 + %r9], %r13
	.word 0xc8420009  ! 558: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xc6220009  ! 561: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xce5a0009  ! 561: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xe9220009  ! 561: STF_R	st	%f20, [%r9, %r8]
	.word 0xca720009  ! 564: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xca020009  ! 564: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xc8ca2dd4  ! 564: LDSBA_I	ldsba	[%r8, + 0x0dd4] %asi, %r4
	.word 0xcf220009  ! 567: STF_R	st	%f7, [%r9, %r8]
	.word 0xcf020009  ! 567: LDF_R	ld	[%r8, %r9], %f7
	.word 0xc46a0009  ! 567: LDSTUB_R	ldstub	%r2, [%r8 + %r9]
	.word 0xff220009  ! 570: STF_R	st	%f31, [%r9, %r8]
	.word 0xe71a0009  ! 570: LDDF_R	ldd	[%r8, %r9], %f19
	.word 0x1e800001  ! 570: BVC	bvc  	<label_0x1>
	.word 0xf53a0009  ! 573: STDF_R	std	%f26, [%r9, %r8]
	.word 0xc40a0009  ! 573: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xf0422c84  ! 573: LDSW_I	ldsw	[%r8 + 0x0c84], %r24
	.word 0xde220009  ! 576: STW_R	stw	%r15, [%r8 + %r9]
	.word 0xca4a0009  ! 576: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xcf220009  ! 576: STF_R	st	%f7, [%r9, %r8]
	.word 0xca2a0009  ! 579: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xf71a0009  ! 579: LDDF_R	ldd	[%r8, %r9], %f27
	.word 0x8143e079  ! 579: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xc93a0009  ! 582: STDF_R	std	%f4, [%r9, %r8]
	.word 0xcf020009  ! 582: LDF_R	ld	[%r8, %r9], %f7
	.word 0x8143e044  ! 582: MEMBAR	membar	#LoadStore | #Sync 
	.word 0xc2320009  ! 585: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc4520009  ! 585: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xc8b22a48  ! 585: STHA_I	stha	%r4, [%r8 + 0x0a48] %asi
	.word 0xcc720009  ! 588: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc60a0009  ! 588: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0x34800001  ! 588: BG	bg,a	<label_0x1>
	.word 0xc3220009  ! 591: STF_R	st	%f1, [%r9, %r8]
	.word 0xc81a0009  ! 591: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xdc921009  ! 591: LDUHA_R	lduha	[%r8, %r9] 0x80, %r14
	.word 0xfa720009  ! 594: STX_R	stx	%r29, [%r8 + %r9]
	.word 0xf45a0009  ! 594: LDX_R	ldx	[%r8 + %r9], %r26
	.word 0x8143c000  ! 594: STBAR	stbar
	.word 0xcd3a0009  ! 597: STDF_R	std	%f6, [%r9, %r8]
	.word 0xfa020009  ! 597: LDUW_R	lduw	[%r8 + %r9], %r29
	.word 0xc36a2548  ! 597: PREFETCH_I	prefetch	[%r8 + 0x0548], #one_read
	.word 0xf7220009  ! 600: STF_R	st	%f27, [%r9, %r8]
	.word 0xcc0a0009  ! 600: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0x87a209a9  ! 600: FDIVs	fdivs	%f8, %f9, %f3
	.word 0xc4320009  ! 603: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xcc120009  ! 603: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0x82f22130  ! 603: UDIVcc_I	udivcc 	%r8, 0x0130, %r1
	.word 0xc4220009  ! 606: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xcf020009  ! 606: LDF_R	ld	[%r8, %r9], %f7
	.word 0x8143c000  ! 606: STBAR	stbar
	.word 0xf8720009  ! 609: STX_R	stx	%r28, [%r8 + %r9]
	.word 0xc20a0009  ! 609: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xcc420009  ! 609: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xcc720009  ! 612: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xcc420009  ! 612: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0x10800001  ! 612: BA	ba  	<label_0x1>
	.word 0xe22a0009  ! 615: STB_R	stb	%r17, [%r8 + %r9]
	.word 0xc81a0009  ! 615: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xc502274c  ! 615: LDF_I	ld	[%r8, 0x074c], %f2
	.word 0xc82a0009  ! 618: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc6120009  ! 618: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xea8a273c  ! 618: LDUBA_I	lduba	[%r8, + 0x073c] %asi, %r21
	.word 0xe6220009  ! 621: STW_R	stw	%r19, [%r8 + %r9]
	.word 0xc8020009  ! 621: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0x8e6a2ab4  ! 621: UDIVX_I	udivx 	%r8, 0x0ab4, %r7
	.word 0xce220009  ! 624: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xd6020009  ! 624: LDUW_R	lduw	[%r8 + %r9], %r11
	.word 0x86d2212c  ! 624: UMULcc_I	umulcc 	%r8, 0x012c, %r3
	.word 0xc6320009  ! 627: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xcf020009  ! 627: LDF_R	ld	[%r8, %r9], %f7
	.word 0x8143e06f  ! 627: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #MemIssue | #Sync 
	.word 0xc5220009  ! 630: STF_R	st	%f2, [%r9, %r8]
	.word 0xcb020009  ! 630: LDF_R	ld	[%r8, %r9], %f5
	.word 0xcde21009  ! 630: CASA_I	casa	[%r8] 0x80, %r9, %r6
	.word 0xca2a0009  ! 633: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc2520009  ! 633: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xccd22850  ! 633: LDSHA_I	ldsha	[%r8, + 0x0850] %asi, %r6
	.word 0xc33a0009  ! 636: STDF_R	std	%f1, [%r9, %r8]
	.word 0xce420009  ! 636: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0x8143c000  ! 636: STBAR	stbar
	.word 0xce220009  ! 639: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc2120009  ! 639: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0x1c800001  ! 639: BPOS	bpos  	<label_0x1>
	.word 0xc8720009  ! 642: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc3020009  ! 642: LDF_R	ld	[%r8, %r9], %f1
	.word 0x8143c000  ! 642: STBAR	stbar
	.word 0xc8720009  ! 645: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc20a0009  ! 645: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0x8143c000  ! 645: STBAR	stbar
	.word 0xca220009  ! 648: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc6120009  ! 648: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xceca1009  ! 648: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r7
	.word 0xdc2a0009  ! 651: STB_R	stb	%r14, [%r8 + %r9]
	.word 0xe11a0009  ! 651: LDDF_R	ldd	[%r8, %r9], %f16
	.word 0x8143c000  ! 651: STBAR	stbar
	.word 0xcc220009  ! 654: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xca020009  ! 654: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0x8143c000  ! 654: STBAR	stbar
	.word 0xf8720009  ! 657: STX_R	stx	%r28, [%r8 + %r9]
	.word 0xc40a0009  ! 657: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0x89222074  ! 657: MULScc_I	mulscc 	%r8, 0x0074, %r4
	.word 0xf4220009  ! 660: STW_R	stw	%r26, [%r8 + %r9]
	.word 0xc31a0009  ! 660: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0x86d22148  ! 660: UMULcc_I	umulcc 	%r8, 0x0148, %r3
	.word 0xc2220009  ! 663: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc85a0009  ! 663: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xf2b22708  ! 663: STHA_I	stha	%r25, [%r8 + 0x0708] %asi
	.word 0xfa320009  ! 666: STH_R	sth	%r29, [%r8 + %r9]
	.word 0xce520009  ! 666: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0x24800002  ! 666: BLE	ble,a	<label_0x2>
	.word 0xec220009  ! 669: STW_R	stw	%r22, [%r8 + %r9]
	.word 0xce4a0009  ! 669: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0x8d6a0009  ! 669: SDIVX_R	sdivx	%r8, %r9, %r6
	.word 0xca220009  ! 672: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xce020009  ! 672: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0x8143e02c  ! 672: MEMBAR	membar	#LoadStore | #StoreStore | #MemIssue 
	.word 0xc2720009  ! 675: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc51a0009  ! 675: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0x8143c000  ! 675: STBAR	stbar
	.word 0xde2a0009  ! 678: STB_R	stb	%r15, [%r8 + %r9]
	.word 0xc64a0009  ! 678: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xc36a2880  ! 678: PREFETCH_I	prefetch	[%r8 + 0x0880], #one_read
	.word 0xc4320009  ! 681: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xce0a0009  ! 681: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xc4ea1009  ! 681: LDSTUBA_R	ldstuba	%r2, [%r8 + %r9] 0x80
	.word 0xe4220009  ! 684: STW_R	stw	%r18, [%r8 + %r9]
	.word 0xca0a0009  ! 684: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xc36a0009  ! 684: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc7220009  ! 687: STF_R	st	%f3, [%r9, %r8]
	.word 0xd7020009  ! 687: LDF_R	ld	[%r8, %r9], %f11
	.word 0x8f6a0009  ! 687: SDIVX_R	sdivx	%r8, %r9, %r7
	.word 0xcf3a0009  ! 690: STDF_R	std	%f7, [%r9, %r8]
	.word 0xdc1a0009  ! 690: LDD_R	ldd	[%r8 + %r9], %r14
	.word 0xcea22b08  ! 690: STWA_I	stwa	%r7, [%r8 + 0x0b08] %asi
	.word 0xfa320009  ! 693: STH_R	sth	%r29, [%r8 + %r9]
	.word 0xe8420009  ! 693: LDSW_R	ldsw	[%r8 + %r9], %r20
	.word 0xce420009  ! 693: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xcf3a0009  ! 696: STDF_R	std	%f7, [%r9, %r8]
	.word 0xf01a0009  ! 696: LDD_R	ldd	[%r8 + %r9], %r24
	.word 0xc3ea1009  ! 696: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc53a0009  ! 699: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc71a0009  ! 699: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xc3ea1009  ! 699: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xcb220009  ! 702: STF_R	st	%f5, [%r9, %r8]
	.word 0xc4020009  ! 702: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xc8020009  ! 702: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xe2720009  ! 705: STX_R	stx	%r17, [%r8 + %r9]
	.word 0xe84a0009  ! 705: LDSB_R	ldsb	[%r8 + %r9], %r20
	.word 0xc6aa1009  ! 705: STBA_R	stba	%r3, [%r8 + %r9] 0x80
	.word 0xc6720009  ! 708: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xcd020009  ! 708: LDF_R	ld	[%r8, %r9], %f6
	.word 0x82d22300  ! 708: UMULcc_I	umulcc 	%r8, 0x0300, %r1
	.word 0xca720009  ! 711: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xdc420009  ! 711: LDSW_R	ldsw	[%r8 + %r9], %r14
	.word 0xc8ba2818  ! 711: STDA_I	stda	%r4, [%r8 + 0x0818] %asi
	.word 0xe4320009  ! 714: STH_R	sth	%r18, [%r8 + %r9]
	.word 0xfc4a0009  ! 714: LDSB_R	ldsb	[%r8 + %r9], %r30
	.word 0x40000002  ! 714: CALL	call	disp30_2
	.word 0xdb3a0009  ! 717: STDF_R	std	%f13, [%r9, %r8]
	.word 0xce0a0009  ! 717: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0x9ba208a9  ! 717: FSUBs	fsubs	%f8, %f9, %f13
	.word 0xf33a0009  ! 720: STDF_R	std	%f25, [%r9, %r8]
	.word 0xc9020009  ! 720: LDF_R	ld	[%r8, %r9], %f4
	.word 0xf08a2128  ! 720: LDUBA_I	lduba	[%r8, + 0x0128] %asi, %r24
	.word 0xc6320009  ! 723: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc6120009  ! 723: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0x8ad225b0  ! 723: UMULcc_I	umulcc 	%r8, 0x05b0, %r5
	.word 0xc7220009  ! 726: STF_R	st	%f3, [%r9, %r8]
	.word 0xf51a0009  ! 726: LDDF_R	ldd	[%r8, %r9], %f26
	.word 0x8143e056  ! 726: MEMBAR	membar	#StoreLoad | #LoadStore | #Lookaside | #Sync 
	.word 0xd6720009  ! 729: STX_R	stx	%r11, [%r8 + %r9]
	.word 0xc81a0009  ! 729: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xc36a0009  ! 729: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc7220009  ! 732: STF_R	st	%f3, [%r9, %r8]
	.word 0xcc520009  ! 732: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0x8c5a0009  ! 732: SMUL_R	smul 	%r8, %r9, %r6
	.word 0xc4320009  ! 735: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xe11a0009  ! 735: LDDF_R	ldd	[%r8, %r9], %f16
	.word 0xc24a2980  ! 735: LDSB_I	ldsb	[%r8 + 0x0980], %r1
	.word 0xc22a0009  ! 738: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xce4a0009  ! 738: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0x87a208a9  ! 738: FSUBs	fsubs	%f8, %f9, %f3
	.word 0xcc220009  ! 741: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xcc1a0009  ! 741: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xc2f22dc0  ! 741: STXA_I	stxa	%r1, [%r8 + 0x0dc0] %asi
	.word 0xe8320009  ! 744: STH_R	sth	%r20, [%r8 + %r9]
	.word 0xce020009  ! 744: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xca0a0009  ! 744: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xc2320009  ! 747: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xf0520009  ! 747: LDSH_R	ldsh	[%r8 + %r9], %r24
	.word 0xff222330  ! 747: STF_I	st	%f31, [0x0330, %r8]
	.word 0xc9220009  ! 750: STF_R	st	%f4, [%r9, %r8]
	.word 0xc8520009  ! 750: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xc49a2a78  ! 750: LDDA_I	ldda	[%r8, + 0x0a78] %asi, %r2
	.word 0xec220009  ! 753: STW_R	stw	%r22, [%r8 + %r9]
	.word 0xcc1a0009  ! 753: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xf2b21009  ! 753: STHA_R	stha	%r25, [%r8 + %r9] 0x80
	.word 0xf93a0009  ! 756: STDF_R	std	%f28, [%r9, %r8]
	.word 0xdc520009  ! 756: LDSH_R	ldsh	[%r8 + %r9], %r14
	.word 0xc3ea1009  ! 756: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xe13a0009  ! 759: STDF_R	std	%f16, [%r9, %r8]
	.word 0xe6120009  ! 759: LDUH_R	lduh	[%r8 + %r9], %r19
	.word 0x8b222bf0  ! 759: MULScc_I	mulscc 	%r8, 0x0bf0, %r5
	.word 0xcf220009  ! 762: STF_R	st	%f7, [%r9, %r8]
	.word 0xd84a0009  ! 762: LDSB_R	ldsb	[%r8 + %r9], %r12
	.word 0x8f222f40  ! 762: MULScc_I	mulscc 	%r8, 0x0f40, %r7
	.word 0xfa720009  ! 765: STX_R	stx	%r29, [%r8 + %r9]
	.word 0xc7020009  ! 765: LDF_R	ld	[%r8, %r9], %f3
	.word 0x8143e02e  ! 765: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #MemIssue 
	.word 0xc4720009  ! 768: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xe65a0009  ! 768: LDX_R	ldx	[%r8 + %r9], %r19
	.word 0xef220009  ! 768: STF_R	st	%f23, [%r9, %r8]
	.word 0xc6720009  ! 771: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc4420009  ! 771: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xdaaa1009  ! 771: STBA_R	stba	%r13, [%r8 + %r9] 0x80
	.word 0xc4220009  ! 774: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc6420009  ! 774: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0x82d2260c  ! 774: UMULcc_I	umulcc 	%r8, 0x060c, %r1
	.word 0xc42a0009  ! 777: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc2120009  ! 777: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0x99a209a9  ! 777: FDIVs	fdivs	%f8, %f9, %f12
	.word 0xc2220009  ! 780: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xef020009  ! 780: LDF_R	ld	[%r8, %r9], %f23
	.word 0x8eda0009  ! 780: SMULcc_R	smulcc 	%r8, %r9, %r7
	.word 0xc6220009  ! 783: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc4420009  ! 783: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xcd2221d4  ! 783: STF_I	st	%f6, [0x01d4, %r8]
	.word 0xc33a0009  ! 786: STDF_R	std	%f1, [%r9, %r8]
	.word 0xf05a0009  ! 786: LDX_R	ldx	[%r8 + %r9], %r24
	.word 0xbe6a2218  ! 786: UDIVX_I	udivx 	%r8, 0x0218, %r31
	.word 0xc9220009  ! 789: STF_R	st	%f4, [%r9, %r8]
	.word 0xc84a0009  ! 789: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0x8143c000  ! 789: STBAR	stbar
	.word 0xfa720009  ! 792: STX_R	stx	%r29, [%r8 + %r9]
	.word 0xcc5a0009  ! 792: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0x8ad20009  ! 792: UMULcc_R	umulcc 	%r8, %r9, %r5
	.word 0xda2a0009  ! 795: STB_R	stb	%r13, [%r8 + %r9]
	.word 0xca0a0009  ! 795: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0x8143e04d  ! 795: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Sync 
	.word 0xc53a0009  ! 798: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc91a0009  ! 798: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xc36a216c  ! 798: PREFETCH_I	prefetch	[%r8 + 0x016c], #one_read
	.word 0xc2320009  ! 801: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xd8520009  ! 801: LDSH_R	ldsh	[%r8 + %r9], %r12
	.word 0x8a6a2fb0  ! 801: UDIVX_I	udivx 	%r8, 0x0fb0, %r5
	.word 0xea220009  ! 804: STW_R	stw	%r21, [%r8 + %r9]
	.word 0xca0a0009  ! 804: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0x85a20829  ! 804: FADDs	fadds	%f8, %f9, %f2
	.word 0xc4220009  ! 807: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xf11a0009  ! 807: LDDF_R	ldd	[%r8, %r9], %f24
	.word 0xc73a0009  ! 807: STDF_R	std	%f3, [%r9, %r8]
	.word 0xd62a0009  ! 810: STB_R	stb	%r11, [%r8 + %r9]
	.word 0xf44a0009  ! 810: LDSB_R	ldsb	[%r8 + %r9], %r26
	.word 0xc36a0009  ! 810: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xca220009  ! 813: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc41a0009  ! 813: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xba722a4c  ! 813: UDIV_I	udiv 	%r8, 0x0a4c, %r29
	.word 0xf42a0009  ! 816: STB_R	stb	%r26, [%r8 + %r9]
	.word 0xd85a0009  ! 816: LDX_R	ldx	[%r8 + %r9], %r12
	.word 0x887a2928  ! 816: SDIV_I	sdiv 	%r8, 0x0928, %r4
	.word 0xf0320009  ! 819: STH_R	sth	%r24, [%r8 + %r9]
	.word 0xe8020009  ! 819: LDUW_R	lduw	[%r8 + %r9], %r20
	.word 0xc89a1009  ! 819: LDDA_R	ldda	[%r8, %r9] 0x80, %r4
	.word 0xc5220009  ! 822: STF_R	st	%f2, [%r9, %r8]
	.word 0xcc120009  ! 822: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0x8143e02c  ! 822: MEMBAR	membar	#LoadStore | #StoreStore | #MemIssue 
	.word 0xe82a0009  ! 825: STB_R	stb	%r20, [%r8 + %r9]
	.word 0xc7020009  ! 825: LDF_R	ld	[%r8, %r9], %f3
	.word 0xc8822a74  ! 825: LDUWA_I	lduwa	[%r8, + 0x0a74] %asi, %r4
	.word 0xc33a0009  ! 828: STDF_R	std	%f1, [%r9, %r8]
	.word 0xfc420009  ! 828: LDSW_R	ldsw	[%r8 + %r9], %r30
	.word 0xcc8a23d8  ! 828: LDUBA_I	lduba	[%r8, + 0x03d8] %asi, %r6
	.word 0xce220009  ! 831: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xf8020009  ! 831: LDUW_R	lduw	[%r8 + %r9], %r28
	.word 0xd66a2d8c  ! 831: LDSTUB_I	ldstub	%r11, [%r8 + 0x0d8c]
	.word 0xc8220009  ! 834: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc6420009  ! 834: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0x88fa24ac  ! 834: SDIVcc_I	sdivcc 	%r8, 0x04ac, %r4
	.word 0xf7220009  ! 837: STF_R	st	%f27, [%r9, %r8]
	.word 0xcc520009  ! 837: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xe4ba2920  ! 837: STDA_I	stda	%r18, [%r8 + 0x0920] %asi
	.word 0xc3220009  ! 840: STF_R	st	%f1, [%r9, %r8]
	.word 0xce420009  ! 840: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xe6921009  ! 840: LDUHA_R	lduha	[%r8, %r9] 0x80, %r19
	.word 0xe8220009  ! 843: STW_R	stw	%r20, [%r8 + %r9]
	.word 0xc3020009  ! 843: LDF_R	ld	[%r8, %r9], %f1
	.word 0x2aca0001  ! 843: BRNZ	brnz,a,pt	%8,<label_0xa0001>
	.word 0xc4320009  ! 846: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc2020009  ! 846: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0x84720009  ! 846: UDIV_R	udiv 	%r8, %r9, %r2
	.word 0xc6220009  ! 849: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xe8420009  ! 849: LDSW_R	ldsw	[%r8 + %r9], %r20
	.word 0x82722d1c  ! 849: UDIV_I	udiv 	%r8, 0x0d1c, %r1
	.word 0xc2220009  ! 852: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xe0520009  ! 852: LDSH_R	ldsh	[%r8 + %r9], %r16
	.word 0x02800001  ! 852: BE	be  	<label_0x1>
	.word 0xc4720009  ! 855: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xf65a0009  ! 855: LDX_R	ldx	[%r8 + %r9], %r27
	.word 0xc2fa1009  ! 855: SWAPA_R	swapa	%r1, [%r8 + %r9] 0x80
	.word 0xe6320009  ! 858: STH_R	sth	%r19, [%r8 + %r9]
	.word 0xcf020009  ! 858: LDF_R	ld	[%r8, %r9], %f7
	.word 0x832222b0  ! 858: MULScc_I	mulscc 	%r8, 0x02b0, %r1
	.word 0xe73a0009  ! 861: STDF_R	std	%f19, [%r9, %r8]
	.word 0xc2420009  ! 861: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xc3ea1009  ! 861: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xcd220009  ! 864: STF_R	st	%f6, [%r9, %r8]
	.word 0xc91a0009  ! 864: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0x16800001  ! 864: BGE	bge  	<label_0x1>
	.word 0xc33a0009  ! 867: STDF_R	std	%f1, [%r9, %r8]
	.word 0xe8020009  ! 867: LDUW_R	lduw	[%r8 + %r9], %r20
	.word 0xe60a2998  ! 867: LDUB_I	ldub	[%r8 + 0x0998], %r19
	.word 0xcc220009  ! 870: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc80a0009  ! 870: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xc93a2028  ! 870: STDF_I	std	%f4, [0x0028, %r8]
	.word 0xce320009  ! 873: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc4520009  ! 873: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0x8ada234c  ! 873: SMULcc_I	smulcc 	%r8, 0x034c, %r5
	.word 0xc2320009  ! 876: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc3020009  ! 876: LDF_R	ld	[%r8, %r9], %f1
	.word 0xc8b21009  ! 876: STHA_R	stha	%r4, [%r8 + %r9] 0x80
	.word 0xe93a0009  ! 879: STDF_R	std	%f20, [%r9, %r8]
	.word 0xcc1a0009  ! 879: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xc36a0009  ! 879: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xd6720009  ! 882: STX_R	stx	%r11, [%r8 + %r9]
	.word 0xc44a0009  ! 882: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0x06ca0001  ! 882: BRLZ	brlz  ,pt	%8,<label_0xa0001>
	.word 0xf1220009  ! 885: STF_R	st	%f24, [%r9, %r8]
	.word 0xec5a0009  ! 885: LDX_R	ldx	[%r8 + %r9], %r22
	.word 0xa0d20009  ! 885: UMULcc_R	umulcc 	%r8, %r9, %r16
	.word 0xcf3a0009  ! 888: STDF_R	std	%f7, [%r9, %r8]
	.word 0xe44a0009  ! 888: LDSB_R	ldsb	[%r8 + %r9], %r18
	.word 0xc4422e1c  ! 888: LDSW_I	ldsw	[%r8 + 0x0e1c], %r2
	.word 0xcf3a0009  ! 891: STDF_R	std	%f7, [%r9, %r8]
	.word 0xfe420009  ! 891: LDSW_R	ldsw	[%r8 + %r9], %r31
	.word 0xb46a2b44  ! 891: UDIVX_I	udivx 	%r8, 0x0b44, %r26
	.word 0xc5220009  ! 894: STF_R	st	%f2, [%r9, %r8]
	.word 0xff1a0009  ! 894: LDDF_R	ldd	[%r8, %r9], %f31
	.word 0x2aca0001  ! 894: BRNZ	brnz,a,pt	%8,<label_0xa0001>
	.word 0xcd3a0009  ! 897: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc2020009  ! 897: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0x83a208a9  ! 897: FSUBs	fsubs	%f8, %f9, %f1
	.word 0xc4220009  ! 900: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc60a0009  ! 900: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0x87a209a9  ! 900: FDIVs	fdivs	%f8, %f9, %f3
	.word 0xea220009  ! 903: STW_R	stw	%r21, [%r8 + %r9]
	.word 0xfc520009  ! 903: LDSH_R	ldsh	[%r8 + %r9], %r30
	.word 0x22800001  ! 903: BE	be,a	<label_0x1>
	.word 0xca320009  ! 906: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xfa520009  ! 906: LDSH_R	ldsh	[%r8 + %r9], %r29
	.word 0xccca29dc  ! 906: LDSBA_I	ldsba	[%r8, + 0x09dc] %asi, %r6
	.word 0xcd220009  ! 909: STF_R	st	%f6, [%r9, %r8]
	.word 0xcc120009  ! 909: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0x8fa20829  ! 909: FADDs	fadds	%f8, %f9, %f7
	.word 0xc4720009  ! 912: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc31a0009  ! 912: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xed1a2f90  ! 912: LDDF_I	ldd	[%r8, 0x0f90], %f22
	.word 0xfb220009  ! 915: STF_R	st	%f29, [%r9, %r8]
	.word 0xc71a0009  ! 915: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0x9e520009  ! 915: UMUL_R	umul 	%r8, %r9, %r15
	.word 0xf7220009  ! 918: STF_R	st	%f27, [%r9, %r8]
	.word 0xe1020009  ! 918: LDF_R	ld	[%r8, %r9], %f16
	.word 0x87a20829  ! 918: FADDs	fadds	%f8, %f9, %f3
	.word 0xc2220009  ! 921: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xe8520009  ! 921: LDSH_R	ldsh	[%r8 + %r9], %r20
	.word 0xce0a0009  ! 921: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xc5220009  ! 924: STF_R	st	%f2, [%r9, %r8]
	.word 0xc3020009  ! 924: LDF_R	ld	[%r8, %r9], %f1
	.word 0xc49a2160  ! 924: LDDA_I	ldda	[%r8, + 0x0160] %asi, %r2
	.word 0xd8320009  ! 927: STH_R	sth	%r12, [%r8 + %r9]
	.word 0xc6420009  ! 927: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xe4022098  ! 927: LDUW_I	lduw	[%r8 + 0x0098], %r18
	.word 0xe2320009  ! 930: STH_R	sth	%r17, [%r8 + %r9]
	.word 0xef020009  ! 930: LDF_R	ld	[%r8, %r9], %f23
	.word 0xc3ea1009  ! 930: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc8220009  ! 933: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xd7020009  ! 933: LDF_R	ld	[%r8, %r9], %f11
	.word 0x8143c000  ! 933: STBAR	stbar
	.word 0xce320009  ! 936: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc80a0009  ! 936: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xf4d21009  ! 936: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r26
	.word 0xca2a0009  ! 939: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xde520009  ! 939: LDSH_R	ldsh	[%r8 + %r9], %r15
	.word 0x89a209a9  ! 939: FDIVs	fdivs	%f8, %f9, %f4
	.word 0xe4320009  ! 942: STH_R	sth	%r18, [%r8 + %r9]
	.word 0xf0020009  ! 942: LDUW_R	lduw	[%r8 + %r9], %r24
	.word 0x24800001  ! 942: BLE	ble,a	<label_0x1>
	.word 0xc8720009  ! 945: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xce4a0009  ! 945: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0x20800001  ! 945: BN	bn,a	<label_0x1>
	.word 0xc82a0009  ! 948: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc2520009  ! 948: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xc36a0009  ! 948: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xea220009  ! 951: STW_R	stw	%r21, [%r8 + %r9]
	.word 0xc3020009  ! 951: LDF_R	ld	[%r8, %r9], %f1
	.word 0xf0ea1009  ! 951: LDSTUBA_R	ldstuba	%r24, [%r8 + %r9] 0x80
	.word 0xf6320009  ! 954: STH_R	sth	%r27, [%r8 + %r9]
	.word 0xc2120009  ! 954: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0x852221d4  ! 954: MULScc_I	mulscc 	%r8, 0x01d4, %r2
	.word 0xcd220009  ! 957: STF_R	st	%f6, [%r9, %r8]
	.word 0xc64a0009  ! 957: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0x86fa0009  ! 957: SDIVcc_R	sdivcc 	%r8, %r9, %r3
	.word 0xc82a0009  ! 960: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xec1a0009  ! 960: LDD_R	ldd	[%r8 + %r9], %r22
	.word 0xc8821009  ! 960: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r4
	.word 0xca720009  ! 963: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xd60a0009  ! 963: LDUB_R	ldub	[%r8 + %r9], %r11
	.word 0xae4a0009  ! 963: MULX_R	mulx 	%r8, %r9, %r23
	.word 0xcb220009  ! 966: STF_R	st	%f5, [%r9, %r8]
	.word 0xce120009  ! 966: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xe6f21009  ! 966: STXA_R	stxa	%r19, [%r8 + %r9] 0x80
	.word 0xf4220009  ! 969: STW_R	stw	%r26, [%r8 + %r9]
	.word 0xcc4a0009  ! 969: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xa87a2f6c  ! 969: SDIV_I	sdiv 	%r8, 0x0f6c, %r20
	.word 0xc9220009  ! 972: STF_R	st	%f4, [%r9, %r8]
	.word 0xca0a0009  ! 972: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0x8ba20829  ! 972: FADDs	fadds	%f8, %f9, %f5
	.word 0xf2320009  ! 975: STH_R	sth	%r25, [%r8 + %r9]
	.word 0xc80a0009  ! 975: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0x8d6a27cc  ! 975: SDIVX_I	sdivx	%r8, 0x07cc, %r6
	.word 0xc82a0009  ! 978: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xe5020009  ! 978: LDF_R	ld	[%r8, %r9], %f18
	.word 0x88da230c  ! 978: SMULcc_I	smulcc 	%r8, 0x030c, %r4
	.word 0xce720009  ! 981: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc8020009  ! 981: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xcc9a1009  ! 981: LDDA_R	ldda	[%r8, %r9] 0x80, %r6
	.word 0xcc320009  ! 984: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc4120009  ! 984: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xca0a2a44  ! 984: LDUB_I	ldub	[%r8 + 0x0a44], %r5
	.word 0xc4320009  ! 987: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc81a0009  ! 987: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xcb3a0009  ! 987: STDF_R	std	%f5, [%r9, %r8]
	.word 0xc5220009  ! 990: STF_R	st	%f2, [%r9, %r8]
	.word 0xca0a0009  ! 990: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0x88722810  ! 990: UDIV_I	udiv 	%r8, 0x0810, %r4
	.word 0xcf3a0009  ! 993: STDF_R	std	%f7, [%r9, %r8]
	.word 0xe40a0009  ! 993: LDUB_R	ldub	[%r8 + %r9], %r18
	.word 0xc2fa2250  ! 993: SWAPA_I	swapa	%r1, [%r8 + 0x0250] %asi
	.word 0xc8220009  ! 996: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xf2120009  ! 996: LDUH_R	lduh	[%r8 + %r9], %r25
	.word 0x8eda0009  ! 996: SMULcc_R	smulcc 	%r8, %r9, %r7
	.word 0xee220009  ! 999: STW_R	stw	%r23, [%r8 + %r9]
	.word 0xce420009  ! 999: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0x0e800002  ! 999: BVS	bvs  	<label_0x2>
	.word 0xc7220009  ! 1002: STF_R	st	%f3, [%r9, %r8]
	.word 0xc25a0009  ! 1002: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xc36a2194  ! 1002: PREFETCH_I	prefetch	[%r8 + 0x0194], #one_read
	.word 0xc8220009  ! 1005: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xca120009  ! 1005: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xec821009  ! 1005: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r22
	.word 0xc8720009  ! 1008: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xca020009  ! 1008: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0x8143c000  ! 1008: STBAR	stbar
	.word 0xcc2a0009  ! 1011: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xcc5a0009  ! 1011: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xc3ea245c  ! 1011: PREFETCHA_I	prefetcha	[%r8, + 0x045c] %asi, #one_read
	.word 0xc4320009  ! 1014: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc91a0009  ! 1014: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0x8143e00d  ! 1014: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore 
	.word 0xcc320009  ! 1017: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc8120009  ! 1017: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0x9c7a2ae0  ! 1017: SDIV_I	sdiv 	%r8, 0x0ae0, %r14
	.word 0xfa2a0009  ! 1020: STB_R	stb	%r29, [%r8 + %r9]
	.word 0xc2020009  ! 1020: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xa4522fa4  ! 1020: UMUL_I	umul 	%r8, 0x0fa4, %r18
	.word 0xc5220009  ! 1023: STF_R	st	%f2, [%r9, %r8]
	.word 0xca020009  ! 1023: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xc3ea1009  ! 1023: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xca320009  ! 1026: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc4120009  ! 1026: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0x8fa20929  ! 1026: FMULs	fmuls	%f8, %f9, %f7
	.word 0xc33a0009  ! 1029: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc40a0009  ! 1029: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0x82d20009  ! 1029: UMULcc_R	umulcc 	%r8, %r9, %r1
	.word 0xc8320009  ! 1032: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xce4a0009  ! 1032: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0x8ba20829  ! 1032: FADDs	fadds	%f8, %f9, %f5
	.word 0xca320009  ! 1035: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc81a0009  ! 1035: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x8143e047  ! 1035: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Sync 
	.word 0xc8720009  ! 1038: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xf6020009  ! 1038: LDUW_R	lduw	[%r8 + %r9], %r27
	.word 0xc6ea1009  ! 1038: LDSTUBA_R	ldstuba	%r3, [%r8 + %r9] 0x80
	.word 0xc2220009  ! 1041: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xe65a0009  ! 1041: LDX_R	ldx	[%r8 + %r9], %r19
	.word 0x08800001  ! 1041: BLEU	bleu  	<label_0x1>
	.word 0xcb3a0009  ! 1044: STDF_R	std	%f5, [%r9, %r8]
	.word 0xde0a0009  ! 1044: LDUB_R	ldub	[%r8 + %r9], %r15
	.word 0xcc020009  ! 1044: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xc6320009  ! 1047: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xcc520009  ! 1047: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xc36a2430  ! 1047: PREFETCH_I	prefetch	[%r8 + 0x0430], #one_read
	.word 0xc22a0009  ! 1050: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xfc0a0009  ! 1050: LDUB_R	ldub	[%r8 + %r9], %r30
	.word 0x40000001  ! 1050: CALL	call	disp30_1
	.word 0xe0720009  ! 1053: STX_R	stx	%r16, [%r8 + %r9]
	.word 0xc8120009  ! 1053: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xccaa21d8  ! 1053: STBA_I	stba	%r6, [%r8 + 0x01d8] %asi
	.word 0xd6320009  ! 1056: STH_R	sth	%r11, [%r8 + %r9]
	.word 0xc60a0009  ! 1056: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xa04a0009  ! 1056: MULX_R	mulx 	%r8, %r9, %r16
	.word 0xea720009  ! 1059: STX_R	stx	%r21, [%r8 + %r9]
	.word 0xc65a0009  ! 1059: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0x28800002  ! 1059: BLEU	bleu,a	<label_0x2>
	.word 0xdf3a0009  ! 1062: STDF_R	std	%f15, [%r9, %r8]
	.word 0xdc0a0009  ! 1062: LDUB_R	ldub	[%r8 + %r9], %r14
	.word 0x8d220009  ! 1062: MULScc_R	mulscc 	%r8, %r9, %r6
	.word 0xc8720009  ! 1065: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc2120009  ! 1065: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0x14800001  ! 1065: BG	bg  	<label_0x1>
	.word 0xda2a0009  ! 1068: STB_R	stb	%r13, [%r8 + %r9]
	.word 0xec420009  ! 1068: LDSW_R	ldsw	[%r8 + %r9], %r22
	.word 0xc3ea2b24  ! 1068: PREFETCHA_I	prefetcha	[%r8, + 0x0b24] %asi, #one_read
	.word 0xe5220009  ! 1071: STF_R	st	%f18, [%r9, %r8]
	.word 0xdc1a0009  ! 1071: LDD_R	ldd	[%r8 + %r9], %r14
	.word 0xa1a20829  ! 1071: FADDs	fadds	%f8, %f9, %f16
	.word 0xc22a0009  ! 1074: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xcc120009  ! 1074: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xa07a0009  ! 1074: SDIV_R	sdiv 	%r8, %r9, %r16
	.word 0xe4720009  ! 1077: STX_R	stx	%r18, [%r8 + %r9]
	.word 0xe0520009  ! 1077: LDSH_R	ldsh	[%r8 + %r9], %r16
	.word 0xc36a2eb8  ! 1077: PREFETCH_I	prefetch	[%r8 + 0x0eb8], #one_read
	.word 0xe3220009  ! 1080: STF_R	st	%f17, [%r9, %r8]
	.word 0xda4a0009  ! 1080: LDSB_R	ldsb	[%r8 + %r9], %r13
	.word 0xccaa2df4  ! 1080: STBA_I	stba	%r6, [%r8 + 0x0df4] %asi
	.word 0xe22a0009  ! 1083: STB_R	stb	%r17, [%r8 + %r9]
	.word 0xc6520009  ! 1083: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xc4f22ee0  ! 1083: STXA_I	stxa	%r2, [%r8 + 0x0ee0] %asi
	.word 0xcd3a0009  ! 1086: STDF_R	std	%f6, [%r9, %r8]
	.word 0xcf1a0009  ! 1086: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0x8143e01d  ! 1086: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside 
	.word 0xc8320009  ! 1089: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc5020009  ! 1089: LDF_R	ld	[%r8, %r9], %f2
	.word 0xc6f228a0  ! 1089: STXA_I	stxa	%r3, [%r8 + 0x08a0] %asi
	.word 0xc7220009  ! 1092: STF_R	st	%f3, [%r9, %r8]
	.word 0xc91a0009  ! 1092: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xc29226e0  ! 1092: LDUHA_I	lduha	[%r8, + 0x06e0] %asi, %r1
	.word 0xfa320009  ! 1095: STH_R	sth	%r29, [%r8 + %r9]
	.word 0xca4a0009  ! 1095: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xb27a2468  ! 1095: SDIV_I	sdiv 	%r8, 0x0468, %r25
	.word 0xcb3a0009  ! 1098: STDF_R	std	%f5, [%r9, %r8]
	.word 0xe65a0009  ! 1098: LDX_R	ldx	[%r8 + %r9], %r19
	.word 0x24ca0001  ! 1098: BRLEZ	brlez,a,pt	%8,<label_0xa0001>
	.word 0xe93a0009  ! 1101: STDF_R	std	%f20, [%r9, %r8]
	.word 0xcd020009  ! 1101: LDF_R	ld	[%r8, %r9], %f6
	.word 0xc3ea2f78  ! 1101: PREFETCHA_I	prefetcha	[%r8, + 0x0f78] %asi, #one_read
	.word 0xce320009  ! 1104: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xcc020009  ! 1104: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xae7a2e88  ! 1104: SDIV_I	sdiv 	%r8, 0x0e88, %r23
	.word 0xfa220009  ! 1107: STW_R	stw	%r29, [%r8 + %r9]
	.word 0xc8520009  ! 1107: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xc36a0009  ! 1107: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc62a0009  ! 1110: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xce420009  ! 1110: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xc2921009  ! 1110: LDUHA_R	lduha	[%r8, %r9] 0x80, %r1
	.word 0xee2a0009  ! 1113: STB_R	stb	%r23, [%r8 + %r9]
	.word 0xe1020009  ! 1113: LDF_R	ld	[%r8, %r9], %f16
	.word 0xc3ea20e0  ! 1113: PREFETCHA_I	prefetcha	[%r8, + 0x00e0] %asi, #one_read
	.word 0xc9220009  ! 1116: STF_R	st	%f4, [%r9, %r8]
	.word 0xc4420009  ! 1116: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xccaa1009  ! 1116: STBA_R	stba	%r6, [%r8 + %r9] 0x80
	.word 0xc42a0009  ! 1119: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xe84a0009  ! 1119: LDSB_R	ldsb	[%r8 + %r9], %r20
	.word 0xca7a0009  ! 1119: SWAP_R	swap	%r5, [%r8 + %r9]
	.word 0xc4320009  ! 1122: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xfb020009  ! 1122: LDF_R	ld	[%r8, %r9], %f29
	.word 0x2cca0001  ! 1122: BRGZ	brgz,a,pt	%8,<label_0xa0001>
	.word 0xca220009  ! 1125: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc25a0009  ! 1125: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xcde22009  ! 1125: CASA_R	casa	[%r8] %asi, %r9, %r6
	.word 0xca720009  ! 1128: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xee4a0009  ! 1128: LDSB_R	ldsb	[%r8 + %r9], %r23
	.word 0xc28227e8  ! 1128: LDUWA_I	lduwa	[%r8, + 0x07e8] %asi, %r1
	.word 0xea2a0009  ! 1131: STB_R	stb	%r21, [%r8 + %r9]
	.word 0xcc4a0009  ! 1131: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xd86a0009  ! 1131: LDSTUB_R	ldstub	%r12, [%r8 + %r9]
	.word 0xc6320009  ! 1134: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xfa520009  ! 1134: LDSH_R	ldsh	[%r8 + %r9], %r29
	.word 0x84f22b60  ! 1134: UDIVcc_I	udivcc 	%r8, 0x0b60, %r2
	.word 0xce320009  ! 1137: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc85a0009  ! 1137: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xc4ea2f04  ! 1137: LDSTUBA_I	ldstuba	%r2, [%r8 + 0x0f04] %asi
	.word 0xc2220009  ! 1140: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc44a0009  ! 1140: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0x26800001  ! 1140: BL	bl,a	<label_0x1>
	.word 0xe9220009  ! 1143: STF_R	st	%f20, [%r9, %r8]
	.word 0xcc0a0009  ! 1143: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xa5a20829  ! 1143: FADDs	fadds	%f8, %f9, %f18
	.word 0xfa220009  ! 1146: STW_R	stw	%r29, [%r8 + %r9]
	.word 0xc41a0009  ! 1146: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xc44a0009  ! 1146: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xc6320009  ! 1149: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc81a0009  ! 1149: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x89222f20  ! 1149: MULScc_I	mulscc 	%r8, 0x0f20, %r4
	.word 0xc8720009  ! 1152: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc2420009  ! 1152: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0x26800001  ! 1152: BL	bl,a	<label_0x1>
	.word 0xcb3a0009  ! 1155: STDF_R	std	%f5, [%r9, %r8]
	.word 0xc6420009  ! 1155: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xecca2ac8  ! 1155: LDSBA_I	ldsba	[%r8, + 0x0ac8] %asi, %r22
	.word 0xf22a0009  ! 1158: STB_R	stb	%r25, [%r8 + %r9]
	.word 0xf8420009  ! 1158: LDSW_R	ldsw	[%r8 + %r9], %r28
	.word 0xc6f21009  ! 1158: STXA_R	stxa	%r3, [%r8 + %r9] 0x80
	.word 0xc5220009  ! 1161: STF_R	st	%f2, [%r9, %r8]
	.word 0xc71a0009  ! 1161: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0x88fa2d44  ! 1161: SDIVcc_I	sdivcc 	%r8, 0x0d44, %r4
	.word 0xcc2a0009  ! 1164: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc6020009  ! 1164: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0x8143e054  ! 1164: MEMBAR	membar	#LoadStore | #Lookaside | #Sync 
	.word 0xce2a0009  ! 1167: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc65a0009  ! 1167: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xc4b2220c  ! 1167: STHA_I	stha	%r2, [%r8 + 0x020c] %asi
	.word 0xca720009  ! 1170: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xdc020009  ! 1170: LDUW_R	lduw	[%r8 + %r9], %r14
	.word 0x22800002  ! 1170: BE	be,a	<label_0x2>
	.word 0xc33a0009  ! 1173: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc01a0009  ! 1173: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0xeaf21009  ! 1173: STXA_R	stxa	%r21, [%r8 + %r9] 0x80
	.word 0xc82a0009  ! 1176: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc8020009  ! 1176: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xa8fa27ac  ! 1176: SDIVcc_I	sdivcc 	%r8, 0x07ac, %r20
	.word 0xcf220009  ! 1179: STF_R	st	%f7, [%r9, %r8]
	.word 0xdc420009  ! 1179: LDSW_R	ldsw	[%r8 + %r9], %r14
	.word 0x847a0009  ! 1179: SDIV_R	sdiv 	%r8, %r9, %r2
	.word 0xc4720009  ! 1182: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xf05a0009  ! 1182: LDX_R	ldx	[%r8 + %r9], %r24
	.word 0xc09a1009  ! 1182: LDDA_R	ldda	[%r8, %r9] 0x80, %r0
	.word 0xca720009  ! 1185: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc41a0009  ! 1185: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x8143e00f  ! 1185: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore 
	.word 0xca220009  ! 1188: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc4020009  ! 1188: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xe4ba2328  ! 1188: STDA_I	stda	%r18, [%r8 + 0x0328] %asi
	.word 0xc3220009  ! 1191: STF_R	st	%f1, [%r9, %r8]
	.word 0xca5a0009  ! 1191: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0x8143c000  ! 1191: STBAR	stbar
	.word 0xef220009  ! 1194: STF_R	st	%f23, [%r9, %r8]
	.word 0xda120009  ! 1194: LDUH_R	lduh	[%r8 + %r9], %r13
	.word 0x8e5a2454  ! 1194: SMUL_I	smul 	%r8, 0x0454, %r7
	.word 0xc82a0009  ! 1197: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xe6420009  ! 1197: LDSW_R	ldsw	[%r8 + %r9], %r19
	.word 0x26800001  ! 1197: BL	bl,a	<label_0x1>
	.word 0xc42a0009  ! 1200: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xf24a0009  ! 1200: LDSB_R	ldsb	[%r8 + %r9], %r25
	.word 0x8143c000  ! 1200: STBAR	stbar
	.word 0xe2320009  ! 1203: STH_R	sth	%r17, [%r8 + %r9]
	.word 0xca520009  ! 1203: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xbe4a2528  ! 1203: MULX_I	mulx 	%r8, 0x0528, %r31
	.word 0xca220009  ! 1206: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xe2020009  ! 1206: LDUW_R	lduw	[%r8 + %r9], %r17
	.word 0xc3ea1009  ! 1206: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xf82a0009  ! 1209: STB_R	stb	%r28, [%r8 + %r9]
	.word 0xc4520009  ! 1209: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0x886a2744  ! 1209: UDIVX_I	udivx 	%r8, 0x0744, %r4
	.word 0xe9220009  ! 1212: STF_R	st	%f20, [%r9, %r8]
	.word 0xf51a0009  ! 1212: LDDF_R	ldd	[%r8, %r9], %f26
	.word 0x847225e8  ! 1212: UDIV_I	udiv 	%r8, 0x05e8, %r2
	.word 0xc82a0009  ! 1215: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xfa0a0009  ! 1215: LDUB_R	ldub	[%r8 + %r9], %r29
	.word 0xb45a28c4  ! 1215: SMUL_I	smul 	%r8, 0x08c4, %r26
	.word 0xe8720009  ! 1218: STX_R	stx	%r20, [%r8 + %r9]
	.word 0xcc4a0009  ! 1218: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xccd22380  ! 1218: LDSHA_I	ldsha	[%r8, + 0x0380] %asi, %r6
	.word 0xe62a0009  ! 1221: STB_R	stb	%r19, [%r8 + %r9]
	.word 0xc8120009  ! 1221: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xc3ea1009  ! 1221: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xfe2a0009  ! 1224: STB_R	stb	%r31, [%r8 + %r9]
	.word 0xe2020009  ! 1224: LDUW_R	lduw	[%r8 + %r9], %r17
	.word 0xc2ea2fe0  ! 1224: LDSTUBA_I	ldstuba	%r1, [%r8 + 0x0fe0] %asi
	.word 0xc3220009  ! 1227: STF_R	st	%f1, [%r9, %r8]
	.word 0xc7020009  ! 1227: LDF_R	ld	[%r8, %r9], %f3
	.word 0xc26a2120  ! 1227: LDSTUB_I	ldstub	%r1, [%r8 + 0x0120]
	.word 0xcd3a0009  ! 1230: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc20a0009  ! 1230: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xc3ea2bdc  ! 1230: PREFETCHA_I	prefetcha	[%r8, + 0x0bdc] %asi, #one_read
	.word 0xca720009  ! 1233: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xca0a0009  ! 1233: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0x12800001  ! 1233: BNE	bne  	<label_0x1>
	.word 0xfe220009  ! 1236: STW_R	stw	%r31, [%r8 + %r9]
	.word 0xe40a0009  ! 1236: LDUB_R	ldub	[%r8 + %r9], %r18
	.word 0x8143e022  ! 1236: MEMBAR	membar	#StoreLoad | #MemIssue 
	.word 0xc4320009  ! 1239: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xf71a0009  ! 1239: LDDF_R	ldd	[%r8, %r9], %f27
	.word 0xc68a2a70  ! 1239: LDUBA_I	lduba	[%r8, + 0x0a70] %asi, %r3
	.word 0xce720009  ! 1242: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xfe020009  ! 1242: LDUW_R	lduw	[%r8 + %r9], %r31
	.word 0xc3ea1009  ! 1242: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xca320009  ! 1245: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xe0520009  ! 1245: LDSH_R	ldsh	[%r8 + %r9], %r16
	.word 0xcac2278c  ! 1245: LDSWA_I	ldswa	[%r8, + 0x078c] %asi, %r5
	.word 0xc2720009  ! 1248: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xcc520009  ! 1248: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xeed21009  ! 1248: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r23
	.word 0xc4320009  ! 1251: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc6520009  ! 1251: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0x885a2b18  ! 1251: SMUL_I	smul 	%r8, 0x0b18, %r4
	.word 0xfe220009  ! 1254: STW_R	stw	%r31, [%r8 + %r9]
	.word 0xf1020009  ! 1254: LDF_R	ld	[%r8, %r9], %f24
	.word 0xc8ea2588  ! 1254: LDSTUBA_I	ldstuba	%r4, [%r8 + 0x0588] %asi
	.word 0xcb3a0009  ! 1257: STDF_R	std	%f5, [%r9, %r8]
	.word 0xc8020009  ! 1257: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xf8522494  ! 1257: LDSH_I	ldsh	[%r8 + 0x0494], %r28
	.word 0xfe2a0009  ! 1260: STB_R	stb	%r31, [%r8 + %r9]
	.word 0xca120009  ! 1260: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xeb3a0009  ! 1260: STDF_R	std	%f21, [%r9, %r8]
	.word 0xc7220009  ! 1263: STF_R	st	%f3, [%r9, %r8]
	.word 0xed020009  ! 1263: LDF_R	ld	[%r8, %r9], %f22
	.word 0xc8ea2f44  ! 1263: LDSTUBA_I	ldstuba	%r4, [%r8 + 0x0f44] %asi
	.word 0xe42a0009  ! 1266: STB_R	stb	%r18, [%r8 + %r9]
	.word 0xca120009  ! 1266: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0x87222bf0  ! 1266: MULScc_I	mulscc 	%r8, 0x0bf0, %r3
	.word 0xcc720009  ! 1269: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc8120009  ! 1269: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0x8ba208a9  ! 1269: FSUBs	fsubs	%f8, %f9, %f5
	.word 0xc2320009  ! 1272: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xf64a0009  ! 1272: LDSB_R	ldsb	[%r8 + %r9], %r27
	.word 0x8a520009  ! 1272: UMUL_R	umul 	%r8, %r9, %r5
	.word 0xe82a0009  ! 1275: STB_R	stb	%r20, [%r8 + %r9]
	.word 0xd6120009  ! 1275: LDUH_R	lduh	[%r8 + %r9], %r11
	.word 0x9afa0009  ! 1275: SDIVcc_R	sdivcc 	%r8, %r9, %r13
	.word 0xcb3a0009  ! 1278: STDF_R	std	%f5, [%r9, %r8]
	.word 0xc24a0009  ! 1278: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0x28800001  ! 1278: BLEU	bleu,a	<label_0x1>
	.word 0xcd3a0009  ! 1281: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc24a0009  ! 1281: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xced21009  ! 1281: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r7
	.word 0xc4720009  ! 1284: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xf5020009  ! 1284: LDF_R	ld	[%r8, %r9], %f26
	.word 0x86d20009  ! 1284: UMULcc_R	umulcc 	%r8, %r9, %r3
	.word 0xc4220009  ! 1287: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xca020009  ! 1287: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0x8a4a0009  ! 1287: MULX_R	mulx 	%r8, %r9, %r5
	.word 0xca320009  ! 1290: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc91a0009  ! 1290: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xc3020009  ! 1290: LDF_R	ld	[%r8, %r9], %f1
	.word 0xcb220009  ! 1293: STF_R	st	%f5, [%r9, %r8]
	.word 0xc4420009  ! 1293: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0x8da209a9  ! 1293: FDIVs	fdivs	%f8, %f9, %f6
	.word 0xe4220009  ! 1296: STW_R	stw	%r18, [%r8 + %r9]
	.word 0xc4120009  ! 1296: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0x8143c000  ! 1296: STBAR	stbar
	.word 0xc42a0009  ! 1299: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xce4a0009  ! 1299: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xe2aa2418  ! 1299: STBA_I	stba	%r17, [%r8 + 0x0418] %asi
	.word 0xca2a0009  ! 1302: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xf04a0009  ! 1302: LDSB_R	ldsb	[%r8 + %r9], %r24
	.word 0xc8921009  ! 1302: LDUHA_R	lduha	[%r8, %r9] 0x80, %r4
	.word 0xe33a0009  ! 1305: STDF_R	std	%f17, [%r9, %r8]
	.word 0xcf020009  ! 1305: LDF_R	ld	[%r8, %r9], %f7
	.word 0xc8da2988  ! 1305: LDXA_I	ldxa	[%r8, + 0x0988] %asi, %r4
	.word 0xd6220009  ! 1308: STW_R	stw	%r11, [%r8 + %r9]
	.word 0xf04a0009  ! 1308: LDSB_R	ldsb	[%r8 + %r9], %r24
	.word 0xc2f22ad8  ! 1308: STXA_I	stxa	%r1, [%r8 + 0x0ad8] %asi
	.word 0xc8220009  ! 1311: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xfa420009  ! 1311: LDSW_R	ldsw	[%r8 + %r9], %r29
	.word 0x85a209a9  ! 1311: FDIVs	fdivs	%f8, %f9, %f2
	.word 0xe62a0009  ! 1314: STB_R	stb	%r19, [%r8 + %r9]
	.word 0xc40a0009  ! 1314: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xb07a2d5c  ! 1314: SDIV_I	sdiv 	%r8, 0x0d5c, %r24
	.word 0xca2a0009  ! 1317: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xcf1a0009  ! 1317: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0x24800001  ! 1317: BLE	ble,a	<label_0x1>
	.word 0xcf220009  ! 1320: STF_R	st	%f7, [%r9, %r8]
	.word 0xc2420009  ! 1320: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xcc120009  ! 1320: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xc7220009  ! 1323: STF_R	st	%f3, [%r9, %r8]
	.word 0xc41a0009  ! 1323: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xc44a2fb8  ! 1323: LDSB_I	ldsb	[%r8 + 0x0fb8], %r2
	.word 0xce2a0009  ! 1326: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc2520009  ! 1326: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0x8f6a2178  ! 1326: SDIVX_I	sdivx	%r8, 0x0178, %r7
	.word 0xff3a0009  ! 1329: STDF_R	std	%f31, [%r9, %r8]
	.word 0xc8520009  ! 1329: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xc2422440  ! 1329: LDSW_I	ldsw	[%r8 + 0x0440], %r1
	.word 0xcc2a0009  ! 1332: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xde4a0009  ! 1332: LDSB_R	ldsb	[%r8 + %r9], %r15
	.word 0xfaea1009  ! 1332: LDSTUBA_R	ldstuba	%r29, [%r8 + %r9] 0x80
	.word 0xcf220009  ! 1335: STF_R	st	%f7, [%r9, %r8]
	.word 0xc8420009  ! 1335: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xfa6a0009  ! 1335: LDSTUB_R	ldstub	%r29, [%r8 + %r9]
	.word 0xcb3a0009  ! 1338: STDF_R	std	%f5, [%r9, %r8]
	.word 0xd64a0009  ! 1338: LDSB_R	ldsb	[%r8 + %r9], %r11
	.word 0xcaaa1009  ! 1338: STBA_R	stba	%r5, [%r8 + %r9] 0x80
	.word 0xca720009  ! 1341: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xe8020009  ! 1341: LDUW_R	lduw	[%r8 + %r9], %r20
	.word 0x896a2ff4  ! 1341: SDIVX_I	sdivx	%r8, 0x0ff4, %r4
	.word 0xc8220009  ! 1344: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xca020009  ! 1344: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xa86a0009  ! 1344: UDIVX_R	udivx 	%r8, %r9, %r20
	.word 0xca2a0009  ! 1347: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xee120009  ! 1347: LDUH_R	lduh	[%r8 + %r9], %r23
	.word 0xc3ea21d4  ! 1347: PREFETCHA_I	prefetcha	[%r8, + 0x01d4] %asi, #one_read
	.word 0xd93a0009  ! 1350: STDF_R	std	%f12, [%r9, %r8]
	.word 0xc6520009  ! 1350: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xcf022934  ! 1350: LDF_I	ld	[%r8, 0x0934], %f7
	.word 0xcc2a0009  ! 1353: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xea120009  ! 1353: LDUH_R	lduh	[%r8 + %r9], %r21
	.word 0xc8ba1009  ! 1353: STDA_R	stda	%r4, [%r8 + %r9] 0x80
	.word 0xcd220009  ! 1356: STF_R	st	%f6, [%r9, %r8]
	.word 0xc45a0009  ! 1356: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xc2ea1009  ! 1356: LDSTUBA_R	ldstuba	%r1, [%r8 + %r9] 0x80
	.word 0xc73a0009  ! 1359: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc91a0009  ! 1359: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0x8143c000  ! 1359: STBAR	stbar
	.word 0xc3220009  ! 1362: STF_R	st	%f1, [%r9, %r8]
	.word 0xfa020009  ! 1362: LDUW_R	lduw	[%r8 + %r9], %r29
	.word 0xceea1009  ! 1362: LDSTUBA_R	ldstuba	%r7, [%r8 + %r9] 0x80
	.word 0xd6320009  ! 1365: STH_R	sth	%r11, [%r8 + %r9]
	.word 0xcc1a0009  ! 1365: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0x84720009  ! 1365: UDIV_R	udiv 	%r8, %r9, %r2
	.word 0xca720009  ! 1368: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xcf1a0009  ! 1368: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0x9cda26e0  ! 1368: SMULcc_I	smulcc 	%r8, 0x06e0, %r14
	.word 0xcd220009  ! 1371: STF_R	st	%f6, [%r9, %r8]
	.word 0xf8520009  ! 1371: LDSH_R	ldsh	[%r8 + %r9], %r28
	.word 0x892224d8  ! 1371: MULScc_I	mulscc 	%r8, 0x04d8, %r4
	.word 0xc62a0009  ! 1374: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc6420009  ! 1374: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xccf22b10  ! 1374: STXA_I	stxa	%r6, [%r8 + 0x0b10] %asi
	.word 0xe2320009  ! 1377: STH_R	sth	%r17, [%r8 + %r9]
	.word 0xc20a0009  ! 1377: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0x08800001  ! 1377: BLEU	bleu  	<label_0x1>
	.word 0xf62a0009  ! 1380: STB_R	stb	%r27, [%r8 + %r9]
	.word 0xc2120009  ! 1380: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0x8cfa24ec  ! 1380: SDIVcc_I	sdivcc 	%r8, 0x04ec, %r6
	.word 0xdd3a0009  ! 1383: STDF_R	std	%f14, [%r9, %r8]
	.word 0xe31a0009  ! 1383: LDDF_R	ldd	[%r8, %r9], %f17
	.word 0xc8520009  ! 1383: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xc22a0009  ! 1386: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xf20a0009  ! 1386: LDUB_R	ldub	[%r8 + %r9], %r25
	.word 0xc36a0009  ! 1386: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xdb3a0009  ! 1389: STDF_R	std	%f13, [%r9, %r8]
	.word 0xc2020009  ! 1389: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xc3ea2a50  ! 1389: PREFETCHA_I	prefetcha	[%r8, + 0x0a50] %asi, #one_read
	.word 0xc73a0009  ! 1392: STDF_R	std	%f3, [%r9, %r8]
	.word 0xf65a0009  ! 1392: LDX_R	ldx	[%r8 + %r9], %r27
	.word 0xcd3a2180  ! 1392: STDF_I	std	%f6, [0x0180, %r8]
	.word 0xc62a0009  ! 1395: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc01a0009  ! 1395: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0x896a23cc  ! 1395: SDIVX_I	sdivx	%r8, 0x03cc, %r4
	.word 0xcd220009  ! 1398: STF_R	st	%f6, [%r9, %r8]
	.word 0xdc420009  ! 1398: LDSW_R	ldsw	[%r8 + %r9], %r14
	.word 0x38800001  ! 1398: BGU	bgu,a	<label_0x1>
	.word 0xe7220009  ! 1401: STF_R	st	%f19, [%r9, %r8]
	.word 0xe01a0009  ! 1401: LDD_R	ldd	[%r8 + %r9], %r16
	.word 0x00800001  ! 1401: BN	bn  	<label_0x1>
	.word 0xc4720009  ! 1404: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xca020009  ! 1404: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xc4da1009  ! 1404: LDXA_R	ldxa	[%r8, %r9] 0x80, %r2
	.word 0xda720009  ! 1407: STX_R	stx	%r13, [%r8 + %r9]
	.word 0xdf1a0009  ! 1407: LDDF_R	ldd	[%r8, %r9], %f15
	.word 0xc60a0009  ! 1407: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xe8320009  ! 1410: STH_R	sth	%r20, [%r8 + %r9]
	.word 0xc81a0009  ! 1410: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xc85a2fd8  ! 1410: LDX_I	ldx	[%r8 + 0x0fd8], %r4
	.word 0xc4220009  ! 1413: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xcf020009  ! 1413: LDF_R	ld	[%r8, %r9], %f7
	.word 0x8143c000  ! 1413: STBAR	stbar
	.word 0xfc720009  ! 1416: STX_R	stx	%r30, [%r8 + %r9]
	.word 0xc44a0009  ! 1416: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xc36a2e50  ! 1416: PREFETCH_I	prefetch	[%r8 + 0x0e50], #one_read
	.word 0xcc2a0009  ! 1419: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xda420009  ! 1419: LDSW_R	ldsw	[%r8 + %r9], %r13
	.word 0xc3ea2770  ! 1419: PREFETCHA_I	prefetcha	[%r8, + 0x0770] %asi, #one_read
	.word 0xc6720009  ! 1422: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xca120009  ! 1422: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0x8143e078  ! 1422: MEMBAR	membar	#StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xc6720009  ! 1425: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xf71a0009  ! 1425: LDDF_R	ldd	[%r8, %r9], %f27
	.word 0xc8420009  ! 1425: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xc6220009  ! 1428: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xed1a0009  ! 1428: LDDF_R	ldd	[%r8, %r9], %f22
	.word 0x8a522394  ! 1428: UMUL_I	umul 	%r8, 0x0394, %r5
	.word 0xc6220009  ! 1431: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xcc420009  ! 1431: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xb87222b4  ! 1431: UDIV_I	udiv 	%r8, 0x02b4, %r28
	.word 0xd6220009  ! 1434: STW_R	stw	%r11, [%r8 + %r9]
	.word 0xc24a0009  ! 1434: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xcb2221d4  ! 1434: STF_I	st	%f5, [0x01d4, %r8]
	.word 0xd6220009  ! 1437: STW_R	stw	%r11, [%r8 + %r9]
	.word 0xce0a0009  ! 1437: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xc5220009  ! 1437: STF_R	st	%f2, [%r9, %r8]
	.word 0xc22a0009  ! 1440: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xcc1a0009  ! 1440: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0x8143c000  ! 1440: STBAR	stbar
	.word 0xcc320009  ! 1443: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xca5a0009  ! 1443: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xc36a2c40  ! 1443: PREFETCH_I	prefetch	[%r8 + 0x0c40], #one_read
	.word 0xc6220009  ! 1446: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xe6420009  ! 1446: LDSW_R	ldsw	[%r8 + %r9], %r19
	.word 0x02800001  ! 1446: BE	be  	<label_0x1>
	.word 0xc4720009  ! 1449: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xcc420009  ! 1449: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0x826a2030  ! 1449: UDIVX_I	udivx 	%r8, 0x0030, %r1
	.word 0xd8320009  ! 1452: STH_R	sth	%r12, [%r8 + %r9]
	.word 0xce5a0009  ! 1452: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0x8143e03d  ! 1452: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0xe4320009  ! 1455: STH_R	sth	%r18, [%r8 + %r9]
	.word 0xc81a0009  ! 1455: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xccf21009  ! 1455: STXA_R	stxa	%r6, [%r8 + %r9] 0x80
	.word 0xf33a0009  ! 1458: STDF_R	std	%f25, [%r9, %r8]
	.word 0xc31a0009  ! 1458: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0x9afa2b68  ! 1458: SDIVcc_I	sdivcc 	%r8, 0x0b68, %r13
	.word 0xff220009  ! 1461: STF_R	st	%f31, [%r9, %r8]
	.word 0xec0a0009  ! 1461: LDUB_R	ldub	[%r8 + %r9], %r22
	.word 0xc6b21009  ! 1461: STHA_R	stha	%r3, [%r8 + %r9] 0x80
	.word 0xc2220009  ! 1464: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xcc420009  ! 1464: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xc3f22009  ! 1464: CASXA_R	casxa	[%r8]%asi, %r9, %r1
	.word 0xdf220009  ! 1467: STF_R	st	%f15, [%r9, %r8]
	.word 0xc51a0009  ! 1467: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0x84720009  ! 1467: UDIV_R	udiv 	%r8, %r9, %r2
	.word 0xf33a0009  ! 1470: STDF_R	std	%f25, [%r9, %r8]
	.word 0xd8020009  ! 1470: LDUW_R	lduw	[%r8 + %r9], %r12
	.word 0x82fa20d4  ! 1470: SDIVcc_I	sdivcc 	%r8, 0x00d4, %r1
	.word 0xf62a0009  ! 1473: STB_R	stb	%r27, [%r8 + %r9]
	.word 0xcb020009  ! 1473: LDF_R	ld	[%r8, %r9], %f5
	.word 0xcc120009  ! 1473: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xc8220009  ! 1476: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc91a0009  ! 1476: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xd93a0009  ! 1476: STDF_R	std	%f12, [%r9, %r8]
	.word 0xce720009  ! 1479: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xfb020009  ! 1479: LDF_R	ld	[%r8, %r9], %f29
	.word 0xdc9a23d8  ! 1479: LDDA_I	ldda	[%r8, + 0x03d8] %asi, %r14
	.word 0xf73a0009  ! 1482: STDF_R	std	%f27, [%r9, %r8]
	.word 0xca520009  ! 1482: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0x0e800001  ! 1482: BVS	bvs  	<label_0x1>
	.word 0xc8320009  ! 1485: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc4020009  ! 1485: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xb9220009  ! 1485: MULScc_R	mulscc 	%r8, %r9, %r28
	.word 0xe93a0009  ! 1488: STDF_R	std	%f20, [%r9, %r8]
	.word 0xe1020009  ! 1488: LDF_R	ld	[%r8, %r9], %f16
	.word 0x2cc20001  ! 1488: BRGZ	brgz,a,nt	%8,<label_0x20001>
	.word 0xe4720009  ! 1491: STX_R	stx	%r18, [%r8 + %r9]
	.word 0xc9020009  ! 1491: LDF_R	ld	[%r8, %r9], %f4
	.word 0xca921009  ! 1491: LDUHA_R	lduha	[%r8, %r9] 0x80, %r5
	.word 0xc6220009  ! 1494: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xcc1a0009  ! 1494: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0x8143c000  ! 1494: STBAR	stbar
	.word 0xc53a0009  ! 1497: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc91a0009  ! 1497: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0x86520009  ! 1497: UMUL_R	umul 	%r8, %r9, %r3
	.word 0xcd3a0009  ! 1500: STDF_R	std	%f6, [%r9, %r8]
	.word 0xce020009  ! 1500: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xc3ea22a0  ! 1500: PREFETCHA_I	prefetcha	[%r8, + 0x02a0] %asi, #one_read
	.word 0xfe720009  ! 1503: STX_R	stx	%r31, [%r8 + %r9]
	.word 0xce020009  ! 1503: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xce6a0009  ! 1503: LDSTUB_R	ldstub	%r7, [%r8 + %r9]
	.word 0xc4320009  ! 1506: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xcd1a0009  ! 1506: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xc60a0009  ! 1506: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xd6720009  ! 1509: STX_R	stx	%r11, [%r8 + %r9]
	.word 0xd6020009  ! 1509: LDUW_R	lduw	[%r8 + %r9], %r11
	.word 0xc3ea2eb4  ! 1509: PREFETCHA_I	prefetcha	[%r8, + 0x0eb4] %asi, #one_read
	.word 0xca720009  ! 1512: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xe64a0009  ! 1512: LDSB_R	ldsb	[%r8 + %r9], %r19
	.word 0xaa5a2dc8  ! 1512: SMUL_I	smul 	%r8, 0x0dc8, %r21
	.word 0xc8220009  ! 1515: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc2120009  ! 1515: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0x86f22e84  ! 1515: UDIVcc_I	udivcc 	%r8, 0x0e84, %r3
	.word 0xc4220009  ! 1518: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xcc4a0009  ! 1518: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xc53a0009  ! 1518: STDF_R	std	%f2, [%r9, %r8]
	.word 0xce220009  ! 1521: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xe0520009  ! 1521: LDSH_R	ldsh	[%r8 + %r9], %r16
	.word 0x00800001  ! 1521: BN	bn  	<label_0x1>
	.word 0xe6320009  ! 1524: STH_R	sth	%r19, [%r8 + %r9]
	.word 0xc6520009  ! 1524: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xa25a22cc  ! 1524: SMUL_I	smul 	%r8, 0x02cc, %r17
	.word 0xd9220009  ! 1527: STF_R	st	%f12, [%r9, %r8]
	.word 0xc31a0009  ! 1527: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0x8143e011  ! 1527: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xc6320009  ! 1530: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc51a0009  ! 1530: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0x2a800001  ! 1530: BCS	bcs,a	<label_0x1>
	.word 0xc93a0009  ! 1533: STDF_R	std	%f4, [%r9, %r8]
	.word 0xff020009  ! 1533: LDF_R	ld	[%r8, %r9], %f31
	.word 0x8143c000  ! 1533: STBAR	stbar
	.word 0xc3220009  ! 1536: STF_R	st	%f1, [%r9, %r8]
	.word 0xc7020009  ! 1536: LDF_R	ld	[%r8, %r9], %f3
	.word 0xda6a28f4  ! 1536: LDSTUB_I	ldstub	%r13, [%r8 + 0x08f4]
	.word 0xcc220009  ! 1539: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc5020009  ! 1539: LDF_R	ld	[%r8, %r9], %f2
	.word 0xc2f21009  ! 1539: STXA_R	stxa	%r1, [%r8 + %r9] 0x80
	.word 0xfc320009  ! 1542: STH_R	sth	%r30, [%r8 + %r9]
	.word 0xc80a0009  ! 1542: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xe0a21009  ! 1542: STWA_R	stwa	%r16, [%r8 + %r9] 0x80
	.word 0xca220009  ! 1545: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xec5a0009  ! 1545: LDX_R	ldx	[%r8 + %r9], %r22
	.word 0x0eca0001  ! 1545: BRGEZ	brgez  ,pt	%8,<label_0xa0001>
	.word 0xec720009  ! 1548: STX_R	stx	%r22, [%r8 + %r9]
	.word 0xcc420009  ! 1548: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xc6aa256c  ! 1548: STBA_I	stba	%r3, [%r8 + 0x056c] %asi
	.word 0xc5220009  ! 1551: STF_R	st	%f2, [%r9, %r8]
	.word 0xd60a0009  ! 1551: LDUB_R	ldub	[%r8 + %r9], %r11
	.word 0xbafa0009  ! 1551: SDIVcc_R	sdivcc 	%r8, %r9, %r29
	.word 0xc6220009  ! 1554: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xdc0a0009  ! 1554: LDUB_R	ldub	[%r8 + %r9], %r14
	.word 0xc4ba2f40  ! 1554: STDA_I	stda	%r2, [%r8 + 0x0f40] %asi
	.word 0xc6720009  ! 1557: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc71a0009  ! 1557: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xc8f21009  ! 1557: STXA_R	stxa	%r4, [%r8 + %r9] 0x80
	.word 0xf2720009  ! 1560: STX_R	stx	%r25, [%r8 + %r9]
	.word 0xc51a0009  ! 1560: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0x2ac20001  ! 1560: BRNZ	brnz,a,nt	%8,<label_0x20001>
	.word 0xe5220009  ! 1563: STF_R	st	%f18, [%r9, %r8]
	.word 0xce020009  ! 1563: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xc3ea1009  ! 1563: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xca320009  ! 1566: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc25a0009  ! 1566: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0x866a2580  ! 1566: UDIVX_I	udivx 	%r8, 0x0580, %r3
	.word 0xcb220009  ! 1569: STF_R	st	%f5, [%r9, %r8]
	.word 0xc7020009  ! 1569: LDF_R	ld	[%r8, %r9], %f3
	.word 0x8143e05c  ! 1569: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0xc93a0009  ! 1572: STDF_R	std	%f4, [%r9, %r8]
	.word 0xcd020009  ! 1572: LDF_R	ld	[%r8, %r9], %f6
	.word 0x86f20009  ! 1572: UDIVcc_R	udivcc 	%r8, %r9, %r3
	.word 0xc4720009  ! 1575: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc8020009  ! 1575: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xc26a0009  ! 1575: LDSTUB_R	ldstub	%r1, [%r8 + %r9]
	.word 0xcc220009  ! 1578: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xcd1a0009  ! 1578: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0x86720009  ! 1578: UDIV_R	udiv 	%r8, %r9, %r3
	.word 0xc4320009  ! 1581: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xed020009  ! 1581: LDF_R	ld	[%r8, %r9], %f22
	.word 0xc6d22c04  ! 1581: LDSHA_I	ldsha	[%r8, + 0x0c04] %asi, %r3
	.word 0xc4720009  ! 1584: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc81a0009  ! 1584: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xcc022efc  ! 1584: LDUW_I	lduw	[%r8 + 0x0efc], %r6
	.word 0xe73a0009  ! 1587: STDF_R	std	%f19, [%r9, %r8]
	.word 0xf44a0009  ! 1587: LDSB_R	ldsb	[%r8 + %r9], %r26
	.word 0xccea25d0  ! 1587: LDSTUBA_I	ldstuba	%r6, [%r8 + 0x05d0] %asi
	.word 0xc53a0009  ! 1590: STDF_R	std	%f2, [%r9, %r8]
	.word 0xce420009  ! 1590: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0x8e5a0009  ! 1590: SMUL_R	smul 	%r8, %r9, %r7
	.word 0xe6720009  ! 1593: STX_R	stx	%r19, [%r8 + %r9]
	.word 0xc4520009  ! 1593: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xc20a0009  ! 1593: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xee720009  ! 1596: STX_R	stx	%r23, [%r8 + %r9]
	.word 0xe4420009  ! 1596: LDSW_R	ldsw	[%r8 + %r9], %r18
	.word 0xc36a0009  ! 1596: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xf22a0009  ! 1599: STB_R	stb	%r25, [%r8 + %r9]
	.word 0xc8120009  ! 1599: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xc6fa2828  ! 1599: SWAPA_I	swapa	%r3, [%r8 + 0x0828] %asi
	.word 0xc5220009  ! 1602: STF_R	st	%f2, [%r9, %r8]
	.word 0xc6020009  ! 1602: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0x865a0009  ! 1602: SMUL_R	smul 	%r8, %r9, %r3
	.word 0xf22a0009  ! 1605: STB_R	stb	%r25, [%r8 + %r9]
	.word 0xce0a0009  ! 1605: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0x84520009  ! 1605: UMUL_R	umul 	%r8, %r9, %r2
	.word 0xe82a0009  ! 1608: STB_R	stb	%r20, [%r8 + %r9]
	.word 0xcb1a0009  ! 1608: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0x8d220009  ! 1608: MULScc_R	mulscc 	%r8, %r9, %r6
	.word 0xde2a0009  ! 1611: STB_R	stb	%r15, [%r8 + %r9]
	.word 0xc81a0009  ! 1611: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xc36a24a8  ! 1611: PREFETCH_I	prefetch	[%r8 + 0x04a8], #one_read
	.word 0xd9220009  ! 1614: STF_R	st	%f12, [%r9, %r8]
	.word 0xc51a0009  ! 1614: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xc3f22009  ! 1614: CASXA_R	casxa	[%r8]%asi, %r9, %r1
	.word 0xc33a0009  ! 1617: STDF_R	std	%f1, [%r9, %r8]
	.word 0xeb1a0009  ! 1617: LDDF_R	ldd	[%r8, %r9], %f21
	.word 0xd81a0009  ! 1617: LDD_R	ldd	[%r8 + %r9], %r12
	.word 0xfe220009  ! 1620: STW_R	stw	%r31, [%r8 + %r9]
	.word 0xcc4a0009  ! 1620: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xe8a21009  ! 1620: STWA_R	stwa	%r20, [%r8 + %r9] 0x80
	.word 0xea720009  ! 1623: STX_R	stx	%r21, [%r8 + %r9]
	.word 0xcd1a0009  ! 1623: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0x8143c000  ! 1623: STBAR	stbar
	.word 0xcc720009  ! 1626: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc8120009  ! 1626: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0x8143e00f  ! 1626: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore 
	.word 0xc6320009  ! 1629: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xce4a0009  ! 1629: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0x84f20009  ! 1629: UDIVcc_R	udivcc 	%r8, %r9, %r2
	.word 0xc2720009  ! 1632: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xda120009  ! 1632: LDUH_R	lduh	[%r8 + %r9], %r13
	.word 0xc8a22794  ! 1632: STWA_I	stwa	%r4, [%r8 + 0x0794] %asi
	.word 0xca320009  ! 1635: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc64a0009  ! 1635: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0x825a2014  ! 1635: SMUL_I	smul 	%r8, 0x0014, %r1
	.word 0xc8220009  ! 1638: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc8120009  ! 1638: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0x10800001  ! 1638: BA	ba  	<label_0x1>
	.word 0xc4720009  ! 1641: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc81a0009  ! 1641: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x1c800001  ! 1641: BPOS	bpos  	<label_0x1>
	.word 0xcd220009  ! 1644: STF_R	st	%f6, [%r9, %r8]
	.word 0xf64a0009  ! 1644: LDSB_R	ldsb	[%r8 + %r9], %r27
	.word 0x8143e070  ! 1644: MEMBAR	membar	#Lookaside | #MemIssue | #Sync 
	.word 0xcb220009  ! 1647: STF_R	st	%f5, [%r9, %r8]
	.word 0xc4120009  ! 1647: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xceb21009  ! 1647: STHA_R	stha	%r7, [%r8 + %r9] 0x80
	.word 0xca720009  ! 1650: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xcb020009  ! 1650: LDF_R	ld	[%r8, %r9], %f5
	.word 0xcdf21009  ! 1650: CASXA_I	casxa	[%r8] 0x80, %r9, %r6
	.word 0xc4320009  ! 1653: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xce420009  ! 1653: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0x82520009  ! 1653: UMUL_R	umul 	%r8, %r9, %r1
	.word 0xca2a0009  ! 1656: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xcd020009  ! 1656: LDF_R	ld	[%r8, %r9], %f6
	.word 0xc31a0009  ! 1656: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xf02a0009  ! 1659: STB_R	stb	%r24, [%r8 + %r9]
	.word 0xee020009  ! 1659: LDUW_R	lduw	[%r8 + %r9], %r23
	.word 0x04c20001  ! 1659: BRLEZ	brlez  ,nt	%8,<label_0x20001>
	.word 0xce720009  ! 1662: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xcc1a0009  ! 1662: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xe8ba1009  ! 1662: STDA_R	stda	%r20, [%r8 + %r9] 0x80
	.word 0xf6720009  ! 1665: STX_R	stx	%r27, [%r8 + %r9]
	.word 0xf8120009  ! 1665: LDUH_R	lduh	[%r8 + %r9], %r28
	.word 0xcac21009  ! 1665: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r5
	.word 0xca320009  ! 1668: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xcd020009  ! 1668: LDF_R	ld	[%r8, %r9], %f6
	.word 0xcbf22009  ! 1668: CASXA_R	casxa	[%r8]%asi, %r9, %r5
	.word 0xd8320009  ! 1671: STH_R	sth	%r12, [%r8 + %r9]
	.word 0xca5a0009  ! 1671: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xdd3a29d8  ! 1671: STDF_I	std	%f14, [0x09d8, %r8]
	.word 0xe7220009  ! 1674: STF_R	st	%f19, [%r9, %r8]
	.word 0xf05a0009  ! 1674: LDX_R	ldx	[%r8 + %r9], %r24
	.word 0xc48a1009  ! 1674: LDUBA_R	lduba	[%r8, %r9] 0x80, %r2
	.word 0xd6320009  ! 1677: STH_R	sth	%r11, [%r8 + %r9]
	.word 0xcc1a0009  ! 1677: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xc36a0009  ! 1677: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xef220009  ! 1680: STF_R	st	%f23, [%r9, %r8]
	.word 0xdc4a0009  ! 1680: LDSB_R	ldsb	[%r8 + %r9], %r14
	.word 0x88fa0009  ! 1680: SDIVcc_R	sdivcc 	%r8, %r9, %r4
	.word 0xcc320009  ! 1683: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xce4a0009  ! 1683: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xcc9226b8  ! 1683: LDUHA_I	lduha	[%r8, + 0x06b8] %asi, %r6
	.word 0xf53a0009  ! 1686: STDF_R	std	%f26, [%r9, %r8]
	.word 0xe84a0009  ! 1686: LDSB_R	ldsb	[%r8 + %r9], %r20
	.word 0xc73a0009  ! 1686: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc6220009  ! 1689: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xf01a0009  ! 1689: LDD_R	ldd	[%r8 + %r9], %r24
	.word 0x87a20929  ! 1689: FMULs	fmuls	%f8, %f9, %f3
	.word 0xca720009  ! 1692: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xf11a0009  ! 1692: LDDF_R	ldd	[%r8, %r9], %f24
	.word 0x87a20829  ! 1692: FADDs	fadds	%f8, %f9, %f3
	.word 0xc53a0009  ! 1695: STDF_R	std	%f2, [%r9, %r8]
	.word 0xcd020009  ! 1695: LDF_R	ld	[%r8, %r9], %f6
	.word 0xc8fa1009  ! 1695: SWAPA_R	swapa	%r4, [%r8 + %r9] 0x80
	.word 0xc8320009  ! 1698: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc20a0009  ! 1698: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xcc9a23c0  ! 1698: LDDA_I	ldda	[%r8, + 0x03c0] %asi, %r6
	.word 0xc73a0009  ! 1701: STDF_R	std	%f3, [%r9, %r8]
	.word 0xec420009  ! 1701: LDSW_R	ldsw	[%r8 + %r9], %r22
	.word 0xe27a2e10  ! 1701: SWAP_I	swap	%r17, [%r8 + 0x0e10]
	.word 0xca220009  ! 1704: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xce520009  ! 1704: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xe0ba24d8  ! 1704: STDA_I	stda	%r16, [%r8 + 0x04d8] %asi
	.word 0xc4320009  ! 1707: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc45a0009  ! 1707: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xc2fa22fc  ! 1707: SWAPA_I	swapa	%r1, [%r8 + 0x02fc] %asi
	.word 0xfe2a0009  ! 1710: STB_R	stb	%r31, [%r8 + %r9]
	.word 0xc24a0009  ! 1710: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xc36a0009  ! 1710: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xca220009  ! 1713: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xcc5a0009  ! 1713: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xc2522518  ! 1713: LDSH_I	ldsh	[%r8 + 0x0518], %r1
	.word 0xc8220009  ! 1716: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xca120009  ! 1716: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0x845a287c  ! 1716: SMUL_I	smul 	%r8, 0x087c, %r2
	.word 0xc5220009  ! 1719: STF_R	st	%f2, [%r9, %r8]
	.word 0xeb1a0009  ! 1719: LDDF_R	ldd	[%r8, %r9], %f21
	.word 0x8143c000  ! 1719: STBAR	stbar
	.word 0xe4320009  ! 1722: STH_R	sth	%r18, [%r8 + %r9]
	.word 0xc40a0009  ! 1722: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0x8da20929  ! 1722: FMULs	fmuls	%f8, %f9, %f6
	.word 0xfa320009  ! 1725: STH_R	sth	%r29, [%r8 + %r9]
	.word 0xdf020009  ! 1725: LDF_R	ld	[%r8, %r9], %f15
	.word 0x2aca0001  ! 1725: BRNZ	brnz,a,pt	%8,<label_0xa0001>
	.word 0xdc2a0009  ! 1728: STB_R	stb	%r14, [%r8 + %r9]
	.word 0xc7020009  ! 1728: LDF_R	ld	[%r8, %r9], %f3
	.word 0xc3ea2e18  ! 1728: PREFETCHA_I	prefetcha	[%r8, + 0x0e18] %asi, #one_read
	.word 0xd8220009  ! 1731: STW_R	stw	%r12, [%r8 + %r9]
	.word 0xe24a0009  ! 1731: LDSB_R	ldsb	[%r8 + %r9], %r17
	.word 0xc71a0009  ! 1731: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xcb220009  ! 1734: STF_R	st	%f5, [%r9, %r8]
	.word 0xc9020009  ! 1734: LDF_R	ld	[%r8, %r9], %f4
	.word 0x867a0009  ! 1734: SDIV_R	sdiv 	%r8, %r9, %r3
	.word 0xf4220009  ! 1737: STW_R	stw	%r26, [%r8 + %r9]
	.word 0xc4420009  ! 1737: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xc8c2243c  ! 1737: LDSWA_I	ldswa	[%r8, + 0x043c] %asi, %r4
	.word 0xcf220009  ! 1740: STF_R	st	%f7, [%r9, %r8]
	.word 0xc65a0009  ! 1740: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xcc1220b0  ! 1740: LDUH_I	lduh	[%r8 + 0x00b0], %r6
	.word 0xcc320009  ! 1743: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc4020009  ! 1743: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xa45a28f0  ! 1743: SMUL_I	smul 	%r8, 0x08f0, %r18
	.word 0xe4220009  ! 1746: STW_R	stw	%r18, [%r8 + %r9]
	.word 0xc7020009  ! 1746: LDF_R	ld	[%r8, %r9], %f3
	.word 0xd85223e0  ! 1746: LDSH_I	ldsh	[%r8 + 0x03e0], %r12
	.word 0xcc2a0009  ! 1749: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xce120009  ! 1749: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xcf3a0009  ! 1749: STDF_R	std	%f7, [%r9, %r8]
	.word 0xf13a0009  ! 1752: STDF_R	std	%f24, [%r9, %r8]
	.word 0xca020009  ! 1752: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xb0522620  ! 1752: UMUL_I	umul 	%r8, 0x0620, %r24
	.word 0xce320009  ! 1755: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xde120009  ! 1755: LDUH_R	lduh	[%r8 + %r9], %r15
	.word 0xc7020009  ! 1755: LDF_R	ld	[%r8, %r9], %f3
	.word 0xc7220009  ! 1758: STF_R	st	%f3, [%r9, %r8]
	.word 0xc7020009  ! 1758: LDF_R	ld	[%r8, %r9], %f3
	.word 0xccc21009  ! 1758: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r6
	.word 0xc62a0009  ! 1761: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc41a0009  ! 1761: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x8a720009  ! 1761: UDIV_R	udiv 	%r8, %r9, %r5
	.word 0xc7220009  ! 1764: STF_R	st	%f3, [%r9, %r8]
	.word 0xfc4a0009  ! 1764: LDSB_R	ldsb	[%r8 + %r9], %r30
	.word 0xc5e21009  ! 1764: CASA_I	casa	[%r8] 0x80, %r9, %r2
	.word 0xcd3a0009  ! 1767: STDF_R	std	%f6, [%r9, %r8]
	.word 0xcd020009  ! 1767: LDF_R	ld	[%r8, %r9], %f6
	.word 0xba7a0009  ! 1767: SDIV_R	sdiv 	%r8, %r9, %r29
	.word 0xc8720009  ! 1770: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc80a0009  ! 1770: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xcfe21009  ! 1770: CASA_I	casa	[%r8] 0x80, %r9, %r7
	.word 0xc2320009  ! 1773: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xf6420009  ! 1773: LDSW_R	ldsw	[%r8 + %r9], %r27
	.word 0x18800002  ! 1773: BGU	bgu  	<label_0x2>
	.word 0xcc720009  ! 1776: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc6420009  ! 1776: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xc6b22ec8  ! 1776: STHA_I	stha	%r3, [%r8 + 0x0ec8] %asi
	.word 0xc2220009  ! 1779: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xd6520009  ! 1779: LDSH_R	ldsh	[%r8 + %r9], %r11
	.word 0xe8c21009  ! 1779: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r20
	.word 0xf4720009  ! 1782: STX_R	stx	%r26, [%r8 + %r9]
	.word 0xcc420009  ! 1782: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xc36a0009  ! 1782: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc42a0009  ! 1785: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xcc1a0009  ! 1785: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xfa420009  ! 1785: LDSW_R	ldsw	[%r8 + %r9], %r29
	.word 0xcc2a0009  ! 1788: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc8020009  ! 1788: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xccf21009  ! 1788: STXA_R	stxa	%r6, [%r8 + %r9] 0x80
	.word 0xf5220009  ! 1791: STF_R	st	%f26, [%r9, %r8]
	.word 0xce520009  ! 1791: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0x16800001  ! 1791: BGE	bge  	<label_0x1>
	.word 0xf22a0009  ! 1794: STB_R	stb	%r25, [%r8 + %r9]
	.word 0xdc5a0009  ! 1794: LDX_R	ldx	[%r8 + %r9], %r14
	.word 0xb05229f0  ! 1794: UMUL_I	umul 	%r8, 0x09f0, %r24
	.word 0xcb220009  ! 1797: STF_R	st	%f5, [%r9, %r8]
	.word 0xe4520009  ! 1797: LDSH_R	ldsh	[%r8 + %r9], %r18
	.word 0x8143c000  ! 1797: STBAR	stbar
	.word 0xc2720009  ! 1800: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xcb1a0009  ! 1800: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0x8f220009  ! 1800: MULScc_R	mulscc 	%r8, %r9, %r7
	.word 0xc53a0009  ! 1803: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc9020009  ! 1803: LDF_R	ld	[%r8, %r9], %f4
	.word 0x2ac20001  ! 1803: BRNZ	brnz,a,nt	%8,<label_0x20001>
	.word 0xc8720009  ! 1806: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xcb1a0009  ! 1806: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xcaea1009  ! 1806: LDSTUBA_R	ldstuba	%r5, [%r8 + %r9] 0x80
	.word 0xcc2a0009  ! 1809: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc24a0009  ! 1809: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xd68a25b4  ! 1809: LDUBA_I	lduba	[%r8, + 0x05b4] %asi, %r11
	.word 0xcf3a0009  ! 1812: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc80a0009  ! 1812: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0x8143e059  ! 1812: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside | #Sync 
	.word 0xec320009  ! 1815: STH_R	sth	%r22, [%r8 + %r9]
	.word 0xc2120009  ! 1815: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xca120009  ! 1815: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xc82a0009  ! 1818: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc81a0009  ! 1818: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x84da2078  ! 1818: SMULcc_I	smulcc 	%r8, 0x0078, %r2
	.word 0xce220009  ! 1821: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xcc0a0009  ! 1821: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0x8fa208a9  ! 1821: FSUBs	fsubs	%f8, %f9, %f7
	.word 0xc53a0009  ! 1824: STDF_R	std	%f2, [%r9, %r8]
	.word 0xfe520009  ! 1824: LDSH_R	ldsh	[%r8 + %r9], %r31
	.word 0xc6a22190  ! 1824: STWA_I	stwa	%r3, [%r8 + 0x0190] %asi
	.word 0xd9220009  ! 1827: STF_R	st	%f12, [%r9, %r8]
	.word 0xcc5a0009  ! 1827: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0x8143c000  ! 1827: STBAR	stbar
	.word 0xcc2a0009  ! 1830: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc9020009  ! 1830: LDF_R	ld	[%r8, %r9], %f4
	.word 0xc48a1009  ! 1830: LDUBA_R	lduba	[%r8, %r9] 0x80, %r2
	.word 0xdd220009  ! 1833: STF_R	st	%f14, [%r9, %r8]
	.word 0xc20a0009  ! 1833: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xc36a26a0  ! 1833: PREFETCH_I	prefetch	[%r8 + 0x06a0], #one_read
	.word 0xef220009  ! 1836: STF_R	st	%f23, [%r9, %r8]
	.word 0xce4a0009  ! 1836: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xc2d224b4  ! 1836: LDSHA_I	ldsha	[%r8, + 0x04b4] %asi, %r1
	.word 0xc22a0009  ! 1839: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xca420009  ! 1839: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xcaaa1009  ! 1839: STBA_R	stba	%r5, [%r8 + %r9] 0x80
	.word 0xca320009  ! 1842: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xde020009  ! 1842: LDUW_R	lduw	[%r8 + %r9], %r15
	.word 0xc7e21009  ! 1842: CASA_I	casa	[%r8] 0x80, %r9, %r3
	.word 0xce2a0009  ! 1845: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc6020009  ! 1845: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xc48a1009  ! 1845: LDUBA_R	lduba	[%r8, %r9] 0x80, %r2
	.word 0xcc2a0009  ! 1848: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xd81a0009  ! 1848: LDD_R	ldd	[%r8 + %r9], %r12
	.word 0x84f22dd8  ! 1848: UDIVcc_I	udivcc 	%r8, 0x0dd8, %r2
	.word 0xc22a0009  ! 1851: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc4420009  ! 1851: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xc6fa1009  ! 1851: SWAPA_R	swapa	%r3, [%r8 + %r9] 0x80
	.word 0xce220009  ! 1854: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xce4a0009  ! 1854: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xb8f22b38  ! 1854: UDIVcc_I	udivcc 	%r8, 0x0b38, %r28
	.word 0xff220009  ! 1857: STF_R	st	%f31, [%r9, %r8]
	.word 0xee0a0009  ! 1857: LDUB_R	ldub	[%r8 + %r9], %r23
	.word 0x85a20829  ! 1857: FADDs	fadds	%f8, %f9, %f2
	.word 0xcd3a0009  ! 1860: STDF_R	std	%f6, [%r9, %r8]
	.word 0xfe120009  ! 1860: LDUH_R	lduh	[%r8 + %r9], %r31
	.word 0x8143c000  ! 1860: STBAR	stbar
	.word 0xcb220009  ! 1863: STF_R	st	%f5, [%r9, %r8]
	.word 0xd84a0009  ! 1863: LDSB_R	ldsb	[%r8 + %r9], %r12
	.word 0xcc6a0009  ! 1863: LDSTUB_R	ldstub	%r6, [%r8 + %r9]
	.word 0xca320009  ! 1866: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc41a0009  ! 1866: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x8c7a0009  ! 1866: SDIV_R	sdiv 	%r8, %r9, %r6
	.word 0xce320009  ! 1869: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc85a0009  ! 1869: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xc20a0009  ! 1869: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xcc320009  ! 1872: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc85a0009  ! 1872: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xf0a21009  ! 1872: STWA_R	stwa	%r24, [%r8 + %r9] 0x80
	.word 0xc82a0009  ! 1875: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc6420009  ! 1875: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0x12800002  ! 1875: BNE	bne  	<label_0x2>
	.word 0xca320009  ! 1878: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xcc4a0009  ! 1878: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xcc1a2208  ! 1878: LDD_I	ldd	[%r8 + 0x0208], %r6
	.word 0xea720009  ! 1881: STX_R	stx	%r21, [%r8 + %r9]
	.word 0xce0a0009  ! 1881: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xc3ea2acc  ! 1881: PREFETCHA_I	prefetcha	[%r8, + 0x0acc] %asi, #one_read
	.word 0xec220009  ! 1884: STW_R	stw	%r22, [%r8 + %r9]
	.word 0xc60a0009  ! 1884: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xc2ea1009  ! 1884: LDSTUBA_R	ldstuba	%r1, [%r8 + %r9] 0x80
	.word 0xcc320009  ! 1887: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc9020009  ! 1887: LDF_R	ld	[%r8, %r9], %f4
	.word 0xcc821009  ! 1887: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r6
	.word 0xc73a0009  ! 1890: STDF_R	std	%f3, [%r9, %r8]
	.word 0xdb1a0009  ! 1890: LDDF_R	ldd	[%r8, %r9], %f13
	.word 0x865a2824  ! 1890: SMUL_I	smul 	%r8, 0x0824, %r3
	.word 0xf4320009  ! 1893: STH_R	sth	%r26, [%r8 + %r9]
	.word 0xfe120009  ! 1893: LDUH_R	lduh	[%r8 + %r9], %r31
	.word 0xc36a2f54  ! 1893: PREFETCH_I	prefetch	[%r8 + 0x0f54], #one_read
	.word 0xc2220009  ! 1896: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xf91a0009  ! 1896: LDDF_R	ldd	[%r8, %r9], %f28
	.word 0x0ec20001  ! 1896: BRGEZ	brgez  ,nt	%8,<label_0x20001>
	.word 0xf8720009  ! 1899: STX_R	stx	%r28, [%r8 + %r9]
	.word 0xcc020009  ! 1899: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xfaca1009  ! 1899: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r29
	.word 0xca320009  ! 1902: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc65a0009  ! 1902: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xc6c22a80  ! 1902: LDSWA_I	ldswa	[%r8, + 0x0a80] %asi, %r3
	.word 0xfa320009  ! 1905: STH_R	sth	%r29, [%r8 + %r9]
	.word 0xf8520009  ! 1905: LDSH_R	ldsh	[%r8 + %r9], %r28
	.word 0xee922318  ! 1905: LDUHA_I	lduha	[%r8, + 0x0318] %asi, %r23
	.word 0xc82a0009  ! 1908: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xfc420009  ! 1908: LDSW_R	ldsw	[%r8 + %r9], %r30
	.word 0x04800001  ! 1908: BLE	ble  	<label_0x1>
	.word 0xdc320009  ! 1911: STH_R	sth	%r14, [%r8 + %r9]
	.word 0xe4520009  ! 1911: LDSH_R	ldsh	[%r8 + %r9], %r18
	.word 0xc3ea2bec  ! 1911: PREFETCHA_I	prefetcha	[%r8, + 0x0bec] %asi, #one_read
	.word 0xf2220009  ! 1914: STW_R	stw	%r25, [%r8 + %r9]
	.word 0xc85a0009  ! 1914: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0x8ba209a9  ! 1914: FDIVs	fdivs	%f8, %f9, %f5
	.word 0xc5220009  ! 1917: STF_R	st	%f2, [%r9, %r8]
	.word 0xc6520009  ! 1917: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xc8da2bd0  ! 1917: LDXA_I	ldxa	[%r8, + 0x0bd0] %asi, %r4
	.word 0xc73a0009  ! 1920: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc4520009  ! 1920: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0x84da2394  ! 1920: SMULcc_I	smulcc 	%r8, 0x0394, %r2
	.word 0xd7220009  ! 1923: STF_R	st	%f11, [%r9, %r8]
	.word 0xc60a0009  ! 1923: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0x32800002  ! 1923: BNE	bne,a	<label_0x2>
	.word 0xcc2a0009  ! 1926: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xce020009  ! 1926: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xc6b21009  ! 1926: STHA_R	stha	%r3, [%r8 + %r9] 0x80
	.word 0xc53a0009  ! 1929: STDF_R	std	%f2, [%r9, %r8]
	.word 0xca420009  ! 1929: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0x865a24d4  ! 1929: SMUL_I	smul 	%r8, 0x04d4, %r3
	.word 0xfb3a0009  ! 1932: STDF_R	std	%f29, [%r9, %r8]
	.word 0xf6120009  ! 1932: LDUH_R	lduh	[%r8 + %r9], %r27
	.word 0xc3ea2c60  ! 1932: PREFETCHA_I	prefetcha	[%r8, + 0x0c60] %asi, #one_read
	.word 0xc7220009  ! 1935: STF_R	st	%f3, [%r9, %r8]
	.word 0xca0a0009  ! 1935: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xc3ea29b4  ! 1935: PREFETCHA_I	prefetcha	[%r8, + 0x09b4] %asi, #one_read
	.word 0xec320009  ! 1938: STH_R	sth	%r22, [%r8 + %r9]
	.word 0xc81a0009  ! 1938: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xca120009  ! 1938: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xc5220009  ! 1941: STF_R	st	%f2, [%r9, %r8]
	.word 0xc2520009  ! 1941: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xbef20009  ! 1941: UDIVcc_R	udivcc 	%r8, %r9, %r31
	.word 0xc2320009  ! 1944: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xf0520009  ! 1944: LDSH_R	ldsh	[%r8 + %r9], %r24
	.word 0x8143e043  ! 1944: MEMBAR	membar	#LoadLoad | #StoreLoad | #Sync 
	.word 0xea720009  ! 1947: STX_R	stx	%r21, [%r8 + %r9]
	.word 0xcc5a0009  ! 1947: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0x88720009  ! 1947: UDIV_R	udiv 	%r8, %r9, %r4
	.word 0xfe720009  ! 1950: STX_R	stx	%r31, [%r8 + %r9]
	.word 0xc4020009  ! 1950: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0x08800002  ! 1950: BLEU	bleu  	<label_0x2>
	.word 0xcc220009  ! 1953: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xcd020009  ! 1953: LDF_R	ld	[%r8, %r9], %f6
	.word 0xcc5a2f60  ! 1953: LDX_I	ldx	[%r8 + 0x0f60], %r6
	.word 0xd7220009  ! 1956: STF_R	st	%f11, [%r9, %r8]
	.word 0xcc4a0009  ! 1956: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xcc922148  ! 1956: LDUHA_I	lduha	[%r8, + 0x0148] %asi, %r6
	.word 0xe2220009  ! 1959: STW_R	stw	%r17, [%r8 + %r9]
	.word 0xc8020009  ! 1959: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xcb220009  ! 1959: STF_R	st	%f5, [%r9, %r8]
	.word 0xca2a0009  ! 1962: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xca520009  ! 1962: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0x8143e02a  ! 1962: MEMBAR	membar	#StoreLoad | #StoreStore | #MemIssue 
	.word 0xfc220009  ! 1965: STW_R	stw	%r30, [%r8 + %r9]
	.word 0xca4a0009  ! 1965: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xb7a209a9  ! 1965: FDIVs	fdivs	%f8, %f9, %f27
	.word 0xfc2a0009  ! 1968: STB_R	stb	%r30, [%r8 + %r9]
	.word 0xda5a0009  ! 1968: LDX_R	ldx	[%r8 + %r9], %r13
	.word 0x83a20829  ! 1968: FADDs	fadds	%f8, %f9, %f1
	.word 0xfe2a0009  ! 1971: STB_R	stb	%r31, [%r8 + %r9]
	.word 0xfe020009  ! 1971: LDUW_R	lduw	[%r8 + %r9], %r31
	.word 0x8d220009  ! 1971: MULScc_R	mulscc 	%r8, %r9, %r6
	.word 0xc4220009  ! 1974: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xe4120009  ! 1974: LDUH_R	lduh	[%r8 + %r9], %r18
	.word 0xc3e21009  ! 1974: CASA_I	casa	[%r8] 0x80, %r9, %r1
	.word 0xce2a0009  ! 1977: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xca4a0009  ! 1977: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xc3ea21dc  ! 1977: PREFETCHA_I	prefetcha	[%r8, + 0x01dc] %asi, #one_read
	.word 0xc53a0009  ! 1980: STDF_R	std	%f2, [%r9, %r8]
	.word 0xce0a0009  ! 1980: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0x38800001  ! 1980: BGU	bgu,a	<label_0x1>
	.word 0xc2720009  ! 1983: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xcf1a0009  ! 1983: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xccf21009  ! 1983: STXA_R	stxa	%r6, [%r8 + %r9] 0x80
	.word 0xc93a0009  ! 1986: STDF_R	std	%f4, [%r9, %r8]
	.word 0xe00a0009  ! 1986: LDUB_R	ldub	[%r8 + %r9], %r16
	.word 0xcada1009  ! 1986: LDXA_R	ldxa	[%r8, %r9] 0x80, %r5
	.word 0xfc720009  ! 1989: STX_R	stx	%r30, [%r8 + %r9]
	.word 0xca0a0009  ! 1989: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xde420009  ! 1989: LDSW_R	ldsw	[%r8 + %r9], %r15
	.word 0xc93a0009  ! 1992: STDF_R	std	%f4, [%r9, %r8]
	.word 0xc45a0009  ! 1992: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xeeda1009  ! 1992: LDXA_R	ldxa	[%r8, %r9] 0x80, %r23
	.word 0xf33a0009  ! 1995: STDF_R	std	%f25, [%r9, %r8]
	.word 0xc2520009  ! 1995: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xe30227dc  ! 1995: LDF_I	ld	[%r8, 0x07dc], %f17
	.word 0xca220009  ! 1998: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc6120009  ! 1998: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0x8143e00d  ! 1998: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore 
	.word 0xfe720009  ! 2001: STX_R	stx	%r31, [%r8 + %r9]
	.word 0xce4a0009  ! 2001: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xc36a0009  ! 2001: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xe42a0009  ! 2004: STB_R	stb	%r18, [%r8 + %r9]
	.word 0xdc4a0009  ! 2004: LDSB_R	ldsb	[%r8 + %r9], %r14
	.word 0x02c20001  ! 2004: BRZ	brz  ,nt	%8,<label_0x20001>
	.word 0xcb3a0009  ! 2007: STDF_R	std	%f5, [%r9, %r8]
	.word 0xd64a0009  ! 2007: LDSB_R	ldsb	[%r8 + %r9], %r11
	.word 0xd6921009  ! 2007: LDUHA_R	lduha	[%r8, %r9] 0x80, %r11
	.word 0xcb3a0009  ! 2010: STDF_R	std	%f5, [%r9, %r8]
	.word 0xfa0a0009  ! 2010: LDUB_R	ldub	[%r8 + %r9], %r29
	.word 0xeb220009  ! 2010: STF_R	st	%f21, [%r9, %r8]
	.word 0xc4320009  ! 2013: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xf11a0009  ! 2013: LDDF_R	ldd	[%r8, %r9], %f24
	.word 0xc3ea2dd0  ! 2013: PREFETCHA_I	prefetcha	[%r8, + 0x0dd0] %asi, #one_read
	.word 0xc22a0009  ! 2016: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xca120009  ! 2016: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xcc0a0009  ! 2016: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xe02a0009  ! 2019: STB_R	stb	%r16, [%r8 + %r9]
	.word 0xcf1a0009  ! 2019: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0x836a0009  ! 2019: SDIVX_R	sdivx	%r8, %r9, %r1
	.word 0xfe320009  ! 2022: STH_R	sth	%r31, [%r8 + %r9]
	.word 0xce120009  ! 2022: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xb05a2340  ! 2022: SMUL_I	smul 	%r8, 0x0340, %r24
	.word 0xfc320009  ! 2025: STH_R	sth	%r30, [%r8 + %r9]
	.word 0xcf1a0009  ! 2025: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xcde21009  ! 2025: CASA_I	casa	[%r8] 0x80, %r9, %r6
	.word 0xc2320009  ! 2028: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xcb1a0009  ! 2028: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xcaa22d20  ! 2028: STWA_I	stwa	%r5, [%r8 + 0x0d20] %asi
	.word 0xc8720009  ! 2031: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc8020009  ! 2031: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0x38800001  ! 2031: BGU	bgu,a	<label_0x1>
	.word 0xc8320009  ! 2034: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xcb020009  ! 2034: LDF_R	ld	[%r8, %r9], %f5
	.word 0xcfe22009  ! 2034: CASA_R	casa	[%r8] %asi, %r9, %r7
	.word 0xcc720009  ! 2037: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc2420009  ! 2037: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xc8d21009  ! 2037: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r4
	.word 0xf6720009  ! 2040: STX_R	stx	%r27, [%r8 + %r9]
	.word 0xf85a0009  ! 2040: LDX_R	ldx	[%r8 + %r9], %r28
	.word 0x8143c000  ! 2040: STBAR	stbar
	.word 0xca2a0009  ! 2043: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc4420009  ! 2043: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0x8a7a2a00  ! 2043: SDIV_I	sdiv 	%r8, 0x0a00, %r5
	.word 0xcf3a0009  ! 2046: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc8120009  ! 2046: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xf7020009  ! 2046: LDF_R	ld	[%r8, %r9], %f27
	.word 0xc8720009  ! 2049: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xd6120009  ! 2049: LDUH_R	lduh	[%r8 + %r9], %r11
	.word 0xc36a0009  ! 2049: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xf33a0009  ! 2052: STDF_R	std	%f25, [%r9, %r8]
	.word 0xcc1a0009  ! 2052: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0x1c800001  ! 2052: BPOS	bpos  	<label_0x1>
	.word 0xc62a0009  ! 2055: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc9020009  ! 2055: LDF_R	ld	[%r8, %r9], %f4
	.word 0x8a4a22bc  ! 2055: MULX_I	mulx 	%r8, 0x02bc, %r5
	.word 0xc6720009  ! 2058: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xda4a0009  ! 2058: LDSB_R	ldsb	[%r8 + %r9], %r13
	.word 0xcd222314  ! 2058: STF_I	st	%f6, [0x0314, %r8]
	.word 0xcc320009  ! 2061: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc40a0009  ! 2061: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xcada2830  ! 2061: LDXA_I	ldxa	[%r8, + 0x0830] %asi, %r5
	.word 0xc2220009  ! 2064: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xcc120009  ! 2064: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0x2ac20001  ! 2064: BRNZ	brnz,a,nt	%8,<label_0x20001>
	.word 0xca720009  ! 2067: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xce120009  ! 2067: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xce5a0009  ! 2067: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xce320009  ! 2070: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xcc1a0009  ! 2070: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xc2b22e00  ! 2070: STHA_I	stha	%r1, [%r8 + 0x0e00] %asi
	.word 0xc6220009  ! 2073: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xfc520009  ! 2073: LDSH_R	ldsh	[%r8 + %r9], %r30
	.word 0xcde22009  ! 2073: CASA_R	casa	[%r8] %asi, %r9, %r6
	.word 0xc4220009  ! 2076: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xe5020009  ! 2076: LDF_R	ld	[%r8, %r9], %f18
	.word 0xf8120009  ! 2076: LDUH_R	lduh	[%r8 + %r9], %r28
	.word 0xe1220009  ! 2079: STF_R	st	%f16, [%r9, %r8]
	.word 0xce5a0009  ! 2079: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xc6c21009  ! 2079: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r3
	.word 0xc8720009  ! 2082: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc4120009  ! 2082: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0x04800001  ! 2082: BLE	ble  	<label_0x1>
	.word 0xc2220009  ! 2085: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc4420009  ! 2085: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xf28a2fb8  ! 2085: LDUBA_I	lduba	[%r8, + 0x0fb8] %asi, %r25
	.word 0xfc220009  ! 2088: STW_R	stw	%r30, [%r8 + %r9]
	.word 0xf85a0009  ! 2088: LDX_R	ldx	[%r8 + %r9], %r28
	.word 0xc52220c0  ! 2088: STF_I	st	%f2, [0x00c0, %r8]
	.word 0xc42a0009  ! 2091: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xca420009  ! 2091: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xc47a0009  ! 2091: SWAP_R	swap	%r2, [%r8 + %r9]
	.word 0xc2320009  ! 2094: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc40a0009  ! 2094: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xd6fa26f8  ! 2094: SWAPA_I	swapa	%r11, [%r8 + 0x06f8] %asi
	.word 0xe2220009  ! 2097: STW_R	stw	%r17, [%r8 + %r9]
	.word 0xcc120009  ! 2097: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0x1c800002  ! 2097: BPOS	bpos  	<label_0x2>
	.word 0xc9220009  ! 2100: STF_R	st	%f4, [%r9, %r8]
	.word 0xf84a0009  ! 2100: LDSB_R	ldsb	[%r8 + %r9], %r28
	.word 0xa4f20009  ! 2100: UDIVcc_R	udivcc 	%r8, %r9, %r18
	.word 0xcd3a0009  ! 2103: STDF_R	std	%f6, [%r9, %r8]
	.word 0xe6120009  ! 2103: LDUH_R	lduh	[%r8 + %r9], %r19
	.word 0xc3ea2d38  ! 2103: PREFETCHA_I	prefetcha	[%r8, + 0x0d38] %asi, #one_read
	.word 0xc2320009  ! 2106: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xee5a0009  ! 2106: LDX_R	ldx	[%r8 + %r9], %r23
	.word 0xfcea2b7c  ! 2106: LDSTUBA_I	ldstuba	%r30, [%r8 + 0x0b7c] %asi
	.word 0xc33a0009  ! 2109: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc4420009  ! 2109: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xcada1009  ! 2109: LDXA_R	ldxa	[%r8, %r9] 0x80, %r5
	.word 0xcc720009  ! 2112: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xca5a0009  ! 2112: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xc7220009  ! 2112: STF_R	st	%f3, [%r9, %r8]
	.word 0xf13a0009  ! 2115: STDF_R	std	%f24, [%r9, %r8]
	.word 0xcf1a0009  ! 2115: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xc3ea2af0  ! 2115: PREFETCHA_I	prefetcha	[%r8, + 0x0af0] %asi, #one_read
	.word 0xed220009  ! 2118: STF_R	st	%f22, [%r9, %r8]
	.word 0xdc520009  ! 2118: LDSH_R	ldsh	[%r8 + %r9], %r14
	.word 0xd6a22c9c  ! 2118: STWA_I	stwa	%r11, [%r8 + 0x0c9c] %asi
	.word 0xde320009  ! 2121: STH_R	sth	%r15, [%r8 + %r9]
	.word 0xfe4a0009  ! 2121: LDSB_R	ldsb	[%r8 + %r9], %r31
	.word 0x26c20001  ! 2121: BRLZ	brlz,a,nt	%8,<label_0x20001>
	.word 0xce720009  ! 2124: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xe0020009  ! 2124: LDUW_R	lduw	[%r8 + %r9], %r16
	.word 0xc24a0009  ! 2124: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xcc320009  ! 2127: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xf0020009  ! 2127: LDUW_R	lduw	[%r8 + %r9], %r24
	.word 0xbeda2ccc  ! 2127: SMULcc_I	smulcc 	%r8, 0x0ccc, %r31
	.word 0xce220009  ! 2130: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xe84a0009  ! 2130: LDSB_R	ldsb	[%r8 + %r9], %r20
	.word 0xc36a2f3c  ! 2130: PREFETCH_I	prefetch	[%r8 + 0x0f3c], #one_read
	.word 0xc73a0009  ! 2133: STDF_R	std	%f3, [%r9, %r8]
	.word 0xee420009  ! 2133: LDSW_R	ldsw	[%r8 + %r9], %r23
	.word 0xc3ea2ccc  ! 2133: PREFETCHA_I	prefetcha	[%r8, + 0x0ccc] %asi, #one_read
	.word 0xec2a0009  ! 2136: STB_R	stb	%r22, [%r8 + %r9]
	.word 0xc4420009  ! 2136: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0x8afa2d10  ! 2136: SDIVcc_I	sdivcc 	%r8, 0x0d10, %r5
	.word 0xc4320009  ! 2139: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xcc5a0009  ! 2139: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xe6b21009  ! 2139: STHA_R	stha	%r19, [%r8 + %r9] 0x80
	.word 0xce320009  ! 2142: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xec520009  ! 2142: LDSH_R	ldsh	[%r8 + %r9], %r22
	.word 0xfe7a0009  ! 2142: SWAP_R	swap	%r31, [%r8 + %r9]
	.word 0xed220009  ! 2145: STF_R	st	%f22, [%r9, %r8]
	.word 0xfa120009  ! 2145: LDUH_R	lduh	[%r8 + %r9], %r29
	.word 0xc7e21009  ! 2145: CASA_I	casa	[%r8] 0x80, %r9, %r3
	.word 0xee320009  ! 2148: STH_R	sth	%r23, [%r8 + %r9]
	.word 0xc71a0009  ! 2148: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xc4f22860  ! 2148: STXA_I	stxa	%r2, [%r8 + 0x0860] %asi
	.word 0xc4320009  ! 2151: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc25a0009  ! 2151: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0x8143c000  ! 2151: STBAR	stbar
	.word 0xd8320009  ! 2154: STH_R	sth	%r12, [%r8 + %r9]
	.word 0xd6120009  ! 2154: LDUH_R	lduh	[%r8 + %r9], %r11
	.word 0xc66a2684  ! 2154: LDSTUB_I	ldstub	%r3, [%r8 + 0x0684]
	.word 0xcb3a0009  ! 2157: STDF_R	std	%f5, [%r9, %r8]
	.word 0xc31a0009  ! 2157: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xe87a0009  ! 2157: SWAP_R	swap	%r20, [%r8 + %r9]
	.word 0xc82a0009  ! 2160: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc41a0009  ! 2160: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xca8a1009  ! 2160: LDUBA_R	lduba	[%r8, %r9] 0x80, %r5
	.word 0xce2a0009  ! 2163: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xfe020009  ! 2163: LDUW_R	lduw	[%r8 + %r9], %r31
	.word 0x04c20001  ! 2163: BRLEZ	brlez  ,nt	%8,<label_0x20001>
	.word 0xcb220009  ! 2166: STF_R	st	%f5, [%r9, %r8]
	.word 0xc6420009  ! 2166: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0x8143c000  ! 2166: STBAR	stbar
	.word 0xe6320009  ! 2169: STH_R	sth	%r19, [%r8 + %r9]
	.word 0xf04a0009  ! 2169: LDSB_R	ldsb	[%r8 + %r9], %r24
	.word 0xdf1a0009  ! 2169: LDDF_R	ldd	[%r8, %r9], %f15
	.word 0xc62a0009  ! 2172: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xca420009  ! 2172: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xeeaa209c  ! 2172: STBA_I	stba	%r23, [%r8 + 0x009c] %asi
	.word 0xf4320009  ! 2175: STH_R	sth	%r26, [%r8 + %r9]
	.word 0xcd020009  ! 2175: LDF_R	ld	[%r8, %r9], %f6
	.word 0xc24a2c74  ! 2175: LDSB_I	ldsb	[%r8 + 0x0c74], %r1
	.word 0xc73a0009  ! 2178: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc24a0009  ! 2178: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xc5f22009  ! 2178: CASXA_R	casxa	[%r8]%asi, %r9, %r2
	.word 0xc6720009  ! 2181: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc64a0009  ! 2181: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0x8e520009  ! 2181: UMUL_R	umul 	%r8, %r9, %r7
	.word 0xfe2a0009  ! 2184: STB_R	stb	%r31, [%r8 + %r9]
	.word 0xcc020009  ! 2184: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xce8a1009  ! 2184: LDUBA_R	lduba	[%r8, %r9] 0x80, %r7
	.word 0xf6720009  ! 2187: STX_R	stx	%r27, [%r8 + %r9]
	.word 0xcc4a0009  ! 2187: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xc4ba2748  ! 2187: STDA_I	stda	%r2, [%r8 + 0x0748] %asi
	.word 0xe8720009  ! 2190: STX_R	stx	%r20, [%r8 + %r9]
	.word 0xc01a0009  ! 2190: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0x8143e00d  ! 2190: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore 
	.word 0xe1220009  ! 2193: STF_R	st	%f16, [%r9, %r8]
	.word 0xcb020009  ! 2193: LDF_R	ld	[%r8, %r9], %f5
	.word 0xc36a0009  ! 2193: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc4220009  ! 2196: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xcb020009  ! 2196: LDF_R	ld	[%r8, %r9], %f5
	.word 0xfa420009  ! 2196: LDSW_R	ldsw	[%r8 + %r9], %r29
	.word 0xcc2a0009  ! 2199: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xe2020009  ! 2199: LDUW_R	lduw	[%r8 + %r9], %r17
	.word 0xc8ba1009  ! 2199: STDA_R	stda	%r4, [%r8 + %r9] 0x80
	.word 0xcd3a0009  ! 2202: STDF_R	std	%f6, [%r9, %r8]
	.word 0xcc120009  ! 2202: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0x8c520009  ! 2202: UMUL_R	umul 	%r8, %r9, %r6
	.word 0xfe320009  ! 2205: STH_R	sth	%r31, [%r8 + %r9]
	.word 0xfc120009  ! 2205: LDUH_R	lduh	[%r8 + %r9], %r30
	.word 0xac7a2d4c  ! 2205: SDIV_I	sdiv 	%r8, 0x0d4c, %r22
	.word 0xc2320009  ! 2208: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xd85a0009  ! 2208: LDX_R	ldx	[%r8 + %r9], %r12
	.word 0x0cca0001  ! 2208: BRGZ	brgz  ,pt	%8,<label_0xa0001>
	.word 0xf73a0009  ! 2211: STDF_R	std	%f27, [%r9, %r8]
	.word 0xcc020009  ! 2211: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0x8143e04d  ! 2211: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Sync 
	.word 0xc2720009  ! 2214: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xdc020009  ! 2214: LDUW_R	lduw	[%r8 + %r9], %r14
	.word 0x8e7a0009  ! 2214: SDIV_R	sdiv 	%r8, %r9, %r7
	.word 0xc4220009  ! 2217: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc5020009  ! 2217: LDF_R	ld	[%r8, %r9], %f2
	.word 0xccba2530  ! 2217: STDA_I	stda	%r6, [%r8 + 0x0530] %asi
	.word 0xcf220009  ! 2220: STF_R	st	%f7, [%r9, %r8]
	.word 0xd6520009  ! 2220: LDSH_R	ldsh	[%r8 + %r9], %r11
	.word 0x827a2fb0  ! 2220: SDIV_I	sdiv 	%r8, 0x0fb0, %r1
	.word 0xce220009  ! 2223: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xcc420009  ! 2223: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xc2f229f0  ! 2223: STXA_I	stxa	%r1, [%r8 + 0x09f0] %asi
	.word 0xe3220009  ! 2226: STF_R	st	%f17, [%r9, %r8]
	.word 0xc31a0009  ! 2226: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xede22009  ! 2226: CASA_R	casa	[%r8] %asi, %r9, %r22
	.word 0xc2720009  ! 2229: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xcc1a0009  ! 2229: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0x1c800001  ! 2229: BPOS	bpos  	<label_0x1>
	.word 0xc7220009  ! 2232: STF_R	st	%f3, [%r9, %r8]
	.word 0xc44a0009  ! 2232: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xaf6a21d8  ! 2232: SDIVX_I	sdivx	%r8, 0x01d8, %r23
	.word 0xc53a0009  ! 2235: STDF_R	std	%f2, [%r9, %r8]
	.word 0xcd020009  ! 2235: LDF_R	ld	[%r8, %r9], %f6
	.word 0x8143e07b  ! 2235: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xc4220009  ! 2238: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc40a0009  ! 2238: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0x8143c000  ! 2238: STBAR	stbar
	.word 0xc6320009  ! 2241: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xce420009  ! 2241: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xec1a0009  ! 2241: LDD_R	ldd	[%r8 + %r9], %r22
	.word 0xdc220009  ! 2244: STW_R	stw	%r14, [%r8 + %r9]
	.word 0xd60a0009  ! 2244: LDUB_R	ldub	[%r8 + %r9], %r11
	.word 0xc33a0009  ! 2244: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc42a0009  ! 2247: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xf84a0009  ! 2247: LDSB_R	ldsb	[%r8 + %r9], %r28
	.word 0xe46a0009  ! 2247: LDSTUB_R	ldstub	%r18, [%r8 + %r9]
	.word 0xd6320009  ! 2250: STH_R	sth	%r11, [%r8 + %r9]
	.word 0xca020009  ! 2250: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xc2da1009  ! 2250: LDXA_R	ldxa	[%r8, %r9] 0x80, %r1
	.word 0xda720009  ! 2253: STX_R	stx	%r13, [%r8 + %r9]
	.word 0xc2420009  ! 2253: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0x8d220009  ! 2253: MULScc_R	mulscc 	%r8, %r9, %r6
	.word 0xcc220009  ! 2256: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xce020009  ! 2256: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0x8143e024  ! 2256: MEMBAR	membar	#LoadStore | #MemIssue 
	.word 0xce220009  ! 2259: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc2020009  ! 2259: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xc36a0009  ! 2259: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xda320009  ! 2262: STH_R	sth	%r13, [%r8 + %r9]
	.word 0xfc4a0009  ! 2262: LDSB_R	ldsb	[%r8 + %r9], %r30
	.word 0x8143e05e  ! 2262: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0xf02a0009  ! 2265: STB_R	stb	%r24, [%r8 + %r9]
	.word 0xda520009  ! 2265: LDSH_R	ldsh	[%r8 + %r9], %r13
	.word 0x8143c000  ! 2265: STBAR	stbar
	.word 0xc2320009  ! 2268: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xce4a0009  ! 2268: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xc9220009  ! 2268: STF_R	st	%f4, [%r9, %r8]
	.word 0xee320009  ! 2271: STH_R	sth	%r23, [%r8 + %r9]
	.word 0xc4120009  ! 2271: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0x8143c000  ! 2271: STBAR	stbar
	.word 0xc6720009  ! 2274: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc40a0009  ! 2274: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xca0a2074  ! 2274: LDUB_I	ldub	[%r8 + 0x0074], %r5
	.word 0xda2a0009  ! 2277: STB_R	stb	%r13, [%r8 + %r9]
	.word 0xce420009  ! 2277: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xad220009  ! 2277: MULScc_R	mulscc 	%r8, %r9, %r22
	.word 0xf2320009  ! 2280: STH_R	sth	%r25, [%r8 + %r9]
	.word 0xd6520009  ! 2280: LDSH_R	ldsh	[%r8 + %r9], %r11
	.word 0x8d6a2360  ! 2280: SDIVX_I	sdivx	%r8, 0x0360, %r6
	.word 0xe8720009  ! 2283: STX_R	stx	%r20, [%r8 + %r9]
	.word 0xc4420009  ! 2283: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0x844a0009  ! 2283: MULX_R	mulx 	%r8, %r9, %r2
	.word 0xc53a0009  ! 2286: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc9020009  ! 2286: LDF_R	ld	[%r8, %r9], %f4
	.word 0xc68a2544  ! 2286: LDUBA_I	lduba	[%r8, + 0x0544] %asi, %r3
	.word 0xc3220009  ! 2289: STF_R	st	%f1, [%r9, %r8]
	.word 0xdc0a0009  ! 2289: LDUB_R	ldub	[%r8 + %r9], %r14
	.word 0x8afa0009  ! 2289: SDIVcc_R	sdivcc 	%r8, %r9, %r5
	.word 0xc4220009  ! 2292: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xcc1a0009  ! 2292: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xfafa1009  ! 2292: SWAPA_R	swapa	%r29, [%r8 + %r9] 0x80
	.word 0xc73a0009  ! 2295: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc8520009  ! 2295: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xf1f22009  ! 2295: CASXA_R	casxa	[%r8]%asi, %r9, %r24
	.word 0xf2720009  ! 2298: STX_R	stx	%r25, [%r8 + %r9]
	.word 0xc31a0009  ! 2298: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xcfe22009  ! 2298: CASA_R	casa	[%r8] %asi, %r9, %r7
	.word 0xc5220009  ! 2301: STF_R	st	%f2, [%r9, %r8]
	.word 0xcb020009  ! 2301: LDF_R	ld	[%r8, %r9], %f5
	.word 0xdf3a0009  ! 2301: STDF_R	std	%f15, [%r9, %r8]
	.word 0xfb220009  ! 2304: STF_R	st	%f29, [%r9, %r8]
	.word 0xcf020009  ! 2304: LDF_R	ld	[%r8, %r9], %f7
	.word 0xccba1009  ! 2304: STDA_R	stda	%r6, [%r8 + %r9] 0x80
	.word 0xc82a0009  ! 2307: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xff1a0009  ! 2307: LDDF_R	ldd	[%r8, %r9], %f31
	.word 0x8e4a0009  ! 2307: MULX_R	mulx 	%r8, %r9, %r7
	.word 0xdf220009  ! 2310: STF_R	st	%f15, [%r9, %r8]
	.word 0xc64a0009  ! 2310: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xcb020009  ! 2310: LDF_R	ld	[%r8, %r9], %f5
	.word 0xe93a0009  ! 2313: STDF_R	std	%f20, [%r9, %r8]
	.word 0xc8120009  ! 2313: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xccba2af0  ! 2313: STDA_I	stda	%r6, [%r8 + 0x0af0] %asi
	.word 0xcf220009  ! 2316: STF_R	st	%f7, [%r9, %r8]
	.word 0xc6420009  ! 2316: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xc6aa216c  ! 2316: STBA_I	stba	%r3, [%r8 + 0x016c] %asi
	.word 0xef220009  ! 2319: STF_R	st	%f23, [%r9, %r8]
	.word 0xce0a0009  ! 2319: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0x8143e039  ! 2319: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside | #MemIssue 
	.word 0xca320009  ! 2322: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xf80a0009  ! 2322: LDUB_R	ldub	[%r8 + %r9], %r28
	.word 0xc3020009  ! 2322: LDF_R	ld	[%r8, %r9], %f1
	.word 0xdc320009  ! 2325: STH_R	sth	%r14, [%r8 + %r9]
	.word 0xc4020009  ! 2325: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0x0ec20001  ! 2325: BRGEZ	brgez  ,nt	%8,<label_0x20001>
	.word 0xce320009  ! 2328: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xf4520009  ! 2328: LDSH_R	ldsh	[%r8 + %r9], %r26
	.word 0x8a722954  ! 2328: UDIV_I	udiv 	%r8, 0x0954, %r5
	.word 0xf53a0009  ! 2331: STDF_R	std	%f26, [%r9, %r8]
	.word 0xc81a0009  ! 2331: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xea4a2468  ! 2331: LDSB_I	ldsb	[%r8 + 0x0468], %r21
	.word 0xc8220009  ! 2334: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xca420009  ! 2334: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0x886a2d6c  ! 2334: UDIVX_I	udivx 	%r8, 0x0d6c, %r4
	.word 0xcc720009  ! 2337: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc5020009  ! 2337: LDF_R	ld	[%r8, %r9], %f2
	.word 0x8143c000  ! 2337: STBAR	stbar
	.word 0xcc220009  ! 2340: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xf81a0009  ! 2340: LDD_R	ldd	[%r8 + %r9], %r28
	.word 0x86520009  ! 2340: UMUL_R	umul 	%r8, %r9, %r3
	.word 0xc4220009  ! 2343: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc8420009  ! 2343: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0x86722858  ! 2343: UDIV_I	udiv 	%r8, 0x0858, %r3
	.word 0xda320009  ! 2346: STH_R	sth	%r13, [%r8 + %r9]
	.word 0xc4020009  ! 2346: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0x8143e029  ! 2346: MEMBAR	membar	#LoadLoad | #StoreStore | #MemIssue 
	.word 0xca2a0009  ! 2349: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xca420009  ! 2349: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xe67a0009  ! 2349: SWAP_R	swap	%r19, [%r8 + %r9]
	.word 0xc53a0009  ! 2352: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc2520009  ! 2352: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xc4a21009  ! 2352: STWA_R	stwa	%r2, [%r8 + %r9] 0x80
	.word 0xce320009  ! 2355: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xcc120009  ! 2355: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xc49a1009  ! 2355: LDDA_R	ldda	[%r8, %r9] 0x80, %r2
	.word 0xc2320009  ! 2358: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc4120009  ! 2358: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xc93a0009  ! 2358: STDF_R	std	%f4, [%r9, %r8]
	.word 0xc22a0009  ! 2361: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xcc4a0009  ! 2361: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xcea22f64  ! 2361: STWA_I	stwa	%r7, [%r8 + 0x0f64] %asi
	.word 0xc6720009  ! 2364: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc8420009  ! 2364: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0x83a20829  ! 2364: FADDs	fadds	%f8, %f9, %f1
	.word 0xc2220009  ! 2367: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xdc5a0009  ! 2367: LDX_R	ldx	[%r8 + %r9], %r14
	.word 0x85220009  ! 2367: MULScc_R	mulscc 	%r8, %r9, %r2
	.word 0xcb220009  ! 2370: STF_R	st	%f5, [%r9, %r8]
	.word 0xc7020009  ! 2370: LDF_R	ld	[%r8, %r9], %f3
	.word 0xc36a0009  ! 2370: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xce2a0009  ! 2373: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xe11a0009  ! 2373: LDDF_R	ldd	[%r8, %r9], %f16
	.word 0xd8ba2388  ! 2373: STDA_I	stda	%r12, [%r8 + 0x0388] %asi
	.word 0xf62a0009  ! 2376: STB_R	stb	%r27, [%r8 + %r9]
	.word 0xcb1a0009  ! 2376: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xcac21009  ! 2376: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r5
	.word 0xcf220009  ! 2379: STF_R	st	%f7, [%r9, %r8]
	.word 0xf1020009  ! 2379: LDF_R	ld	[%r8, %r9], %f24
	.word 0x8143c000  ! 2379: STBAR	stbar
	.word 0xcc220009  ! 2382: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc24a0009  ! 2382: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0x8fa209a9  ! 2382: FDIVs	fdivs	%f8, %f9, %f7
	.word 0xe4220009  ! 2385: STW_R	stw	%r18, [%r8 + %r9]
	.word 0xca020009  ! 2385: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xb6d227ac  ! 2385: UMULcc_I	umulcc 	%r8, 0x07ac, %r27
	.word 0xe2720009  ! 2388: STX_R	stx	%r17, [%r8 + %r9]
	.word 0xe25a0009  ! 2388: LDX_R	ldx	[%r8 + %r9], %r17
	.word 0x827a0009  ! 2388: SDIV_R	sdiv 	%r8, %r9, %r1
	.word 0xc2220009  ! 2391: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xdd1a0009  ! 2391: LDDF_R	ldd	[%r8, %r9], %f14
	.word 0xe0f22040  ! 2391: STXA_I	stxa	%r16, [%r8 + 0x0040] %asi
	.word 0xc62a0009  ! 2394: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc9020009  ! 2394: LDF_R	ld	[%r8, %r9], %f4
	.word 0x24ca0001  ! 2394: BRLEZ	brlez,a,pt	%8,<label_0xa0001>
	.word 0xc2220009  ! 2397: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xca0a0009  ! 2397: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0x8e720009  ! 2397: UDIV_R	udiv 	%r8, %r9, %r7
	.word 0xc42a0009  ! 2400: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xfa4a0009  ! 2400: LDSB_R	ldsb	[%r8 + %r9], %r29
	.word 0xc6a22684  ! 2400: STWA_I	stwa	%r3, [%r8 + 0x0684] %asi
	.word 0xc73a0009  ! 2403: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc60a0009  ! 2403: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0x84d2218c  ! 2403: UMULcc_I	umulcc 	%r8, 0x018c, %r2
	.word 0xfc220009  ! 2406: STW_R	stw	%r30, [%r8 + %r9]
	.word 0xe65a0009  ! 2406: LDX_R	ldx	[%r8 + %r9], %r19
	.word 0xaeda0009  ! 2406: SMULcc_R	smulcc 	%r8, %r9, %r23
	.word 0xc7220009  ! 2409: STF_R	st	%f3, [%r9, %r8]
	.word 0xcd1a0009  ! 2409: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xea522378  ! 2409: LDSH_I	ldsh	[%r8 + 0x0378], %r21
	.word 0xdc2a0009  ! 2412: STB_R	stb	%r14, [%r8 + %r9]
	.word 0xc8420009  ! 2412: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xe4ea1009  ! 2412: LDSTUBA_R	ldstuba	%r18, [%r8 + %r9] 0x80
	.word 0xc6320009  ! 2415: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xcc1a0009  ! 2415: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0x8143c000  ! 2415: STBAR	stbar
	.word 0xcd220009  ! 2418: STF_R	st	%f6, [%r9, %r8]
	.word 0xe81a0009  ! 2418: LDD_R	ldd	[%r8 + %r9], %r20
	.word 0xf85a0009  ! 2418: LDX_R	ldx	[%r8 + %r9], %r28
	.word 0xc2220009  ! 2421: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc51a0009  ! 2421: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0x0a800001  ! 2421: BCS	bcs  	<label_0x1>
	.word 0xca220009  ! 2424: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xca0a0009  ! 2424: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xe0b22124  ! 2424: STHA_I	stha	%r16, [%r8 + 0x0124] %asi
	.word 0xc73a0009  ! 2427: STDF_R	std	%f3, [%r9, %r8]
	.word 0xfe4a0009  ! 2427: LDSB_R	ldsb	[%r8 + %r9], %r31
	.word 0x86fa0009  ! 2427: SDIVcc_R	sdivcc 	%r8, %r9, %r3
	.word 0xe8320009  ! 2430: STH_R	sth	%r20, [%r8 + %r9]
	.word 0xcd020009  ! 2430: LDF_R	ld	[%r8, %r9], %f6
	.word 0xc6921009  ! 2430: LDUHA_R	lduha	[%r8, %r9] 0x80, %r3
	.word 0xcc720009  ! 2433: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc80a0009  ! 2433: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xc8ea1009  ! 2433: LDSTUBA_R	ldstuba	%r4, [%r8 + %r9] 0x80
	.word 0xc8720009  ! 2436: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc64a0009  ! 2436: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xe8ea239c  ! 2436: LDSTUBA_I	ldstuba	%r20, [%r8 + 0x039c] %asi
	.word 0xc53a0009  ! 2439: STDF_R	std	%f2, [%r9, %r8]
	.word 0xf71a0009  ! 2439: LDDF_R	ldd	[%r8, %r9], %f27
	.word 0x884a2eb4  ! 2439: MULX_I	mulx 	%r8, 0x0eb4, %r4
	.word 0xc8720009  ! 2442: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xca420009  ! 2442: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xf4b2233c  ! 2442: STHA_I	stha	%r26, [%r8 + 0x033c] %asi
	.word 0xcc220009  ! 2445: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xdb020009  ! 2445: LDF_R	ld	[%r8, %r9], %f13
	.word 0x8143e01e  ! 2445: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside 
	.word 0xe13a0009  ! 2448: STDF_R	std	%f16, [%r9, %r8]
	.word 0xf4420009  ! 2448: LDSW_R	ldsw	[%r8 + %r9], %r26
	.word 0x876a0009  ! 2448: SDIVX_R	sdivx	%r8, %r9, %r3
	.word 0xc73a0009  ! 2451: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc81a0009  ! 2451: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xcb222934  ! 2451: STF_I	st	%f5, [0x0934, %r8]
	.word 0xce720009  ! 2454: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc2420009  ! 2454: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0x34800001  ! 2454: BG	bg,a	<label_0x1>
	.word 0xc2320009  ! 2457: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc7020009  ! 2457: LDF_R	ld	[%r8, %r9], %f3
	.word 0xe27a0009  ! 2457: SWAP_R	swap	%r17, [%r8 + %r9]
	.word 0xc4720009  ! 2460: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc24a0009  ! 2460: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xc36a2690  ! 2460: PREFETCH_I	prefetch	[%r8 + 0x0690], #one_read
	.word 0xca2a0009  ! 2463: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc9020009  ! 2463: LDF_R	ld	[%r8, %r9], %f4
	.word 0xccea1009  ! 2463: LDSTUBA_R	ldstuba	%r6, [%r8 + %r9] 0x80
	.word 0xca2a0009  ! 2466: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xe2420009  ! 2466: LDSW_R	ldsw	[%r8 + %r9], %r17
	.word 0xc65a2a38  ! 2466: LDX_I	ldx	[%r8 + 0x0a38], %r3
	.word 0xca320009  ! 2469: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xcc520009  ! 2469: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0x8a6a0009  ! 2469: UDIVX_R	udivx 	%r8, %r9, %r5
	.word 0xc42a0009  ! 2472: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc8120009  ! 2472: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0x8143e030  ! 2472: MEMBAR	membar	#Lookaside | #MemIssue 
	.word 0xca2a0009  ! 2475: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc41a0009  ! 2475: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xc93a2610  ! 2475: STDF_I	std	%f4, [0x0610, %r8]
	.word 0xeb3a0009  ! 2478: STDF_R	std	%f21, [%r9, %r8]
	.word 0xca120009  ! 2478: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0x8143c000  ! 2478: STBAR	stbar
	.word 0xe0220009  ! 2481: STW_R	stw	%r16, [%r8 + %r9]
	.word 0xe1020009  ! 2481: LDF_R	ld	[%r8, %r9], %f16
	.word 0xc3ea1009  ! 2481: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xca320009  ! 2484: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xcf1a0009  ! 2484: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xc89a2e38  ! 2484: LDDA_I	ldda	[%r8, + 0x0e38] %asi, %r4
	.word 0xcb3a0009  ! 2487: STDF_R	std	%f5, [%r9, %r8]
	.word 0xd81a0009  ! 2487: LDD_R	ldd	[%r8 + %r9], %r12
	.word 0xc202251c  ! 2487: LDUW_I	lduw	[%r8 + 0x051c], %r1
	.word 0xce320009  ! 2490: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xca5a0009  ! 2490: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xceea2784  ! 2490: LDSTUBA_I	ldstuba	%r7, [%r8 + 0x0784] %asi
	.word 0xc8320009  ! 2493: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xcb020009  ! 2493: LDF_R	ld	[%r8, %r9], %f5
	.word 0xc93a2dc0  ! 2493: STDF_I	std	%f4, [0x0dc0, %r8]
	.word 0xcb3a0009  ! 2496: STDF_R	std	%f5, [%r9, %r8]
	.word 0xcc5a0009  ! 2496: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xc3ea1009  ! 2496: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xce220009  ! 2499: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc40a0009  ! 2499: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0x8143e039  ! 2499: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside | #MemIssue 
	.word 0xc62a0009  ! 2502: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xce4a0009  ! 2502: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xfbe21009  ! 2502: CASA_I	casa	[%r8] 0x80, %r9, %r29
	.word 0xe6220009  ! 2505: STW_R	stw	%r19, [%r8 + %r9]
	.word 0xc60a0009  ! 2505: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xde8a2d8c  ! 2505: LDUBA_I	lduba	[%r8, + 0x0d8c] %asi, %r15
	.word 0xcb3a0009  ! 2508: STDF_R	std	%f5, [%r9, %r8]
	.word 0xcc020009  ! 2508: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xc4c22a80  ! 2508: LDSWA_I	ldswa	[%r8, + 0x0a80] %asi, %r2
	.word 0xcf3a0009  ! 2511: STDF_R	std	%f7, [%r9, %r8]
	.word 0xfa520009  ! 2511: LDSH_R	ldsh	[%r8 + %r9], %r29
	.word 0x34800001  ! 2511: BG	bg,a	<label_0x1>
	.word 0xcc2a0009  ! 2514: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc4120009  ! 2514: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xaa720009  ! 2514: UDIV_R	udiv 	%r8, %r9, %r21
	.word 0xc6220009  ! 2517: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc2020009  ! 2517: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0x89a209a9  ! 2517: FDIVs	fdivs	%f8, %f9, %f4
	.word 0xc9220009  ! 2520: STF_R	st	%f4, [%r9, %r8]
	.word 0xc20a0009  ! 2520: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0x84520009  ! 2520: UMUL_R	umul 	%r8, %r9, %r2
	.word 0xc73a0009  ! 2523: STDF_R	std	%f3, [%r9, %r8]
	.word 0xec5a0009  ! 2523: LDX_R	ldx	[%r8 + %r9], %r22
	.word 0xc20a0009  ! 2523: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xcc220009  ! 2526: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xe4120009  ! 2526: LDUH_R	lduh	[%r8 + %r9], %r18
	.word 0xfeea23fc  ! 2526: LDSTUBA_I	ldstuba	%r31, [%r8 + 0x03fc] %asi
	.word 0xce220009  ! 2529: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xfa020009  ! 2529: LDUW_R	lduw	[%r8 + %r9], %r29
	.word 0xb9220009  ! 2529: MULScc_R	mulscc 	%r8, %r9, %r28
	.word 0xc6220009  ! 2532: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc7020009  ! 2532: LDF_R	ld	[%r8, %r9], %f3
	.word 0xf2d2254c  ! 2532: LDSHA_I	ldsha	[%r8, + 0x054c] %asi, %r25
	.word 0xc6720009  ! 2535: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc4420009  ! 2535: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xccb2288c  ! 2535: STHA_I	stha	%r6, [%r8 + 0x088c] %asi
	.word 0xeb220009  ! 2538: STF_R	st	%f21, [%r9, %r8]
	.word 0xce520009  ! 2538: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0x8e5a2d20  ! 2538: SMUL_I	smul 	%r8, 0x0d20, %r7
	.word 0xe8220009  ! 2541: STW_R	stw	%r20, [%r8 + %r9]
	.word 0xcc120009  ! 2541: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0x985a0009  ! 2541: SMUL_R	smul 	%r8, %r9, %r12
	.word 0xff220009  ! 2544: STF_R	st	%f31, [%r9, %r8]
	.word 0xee5a0009  ! 2544: LDX_R	ldx	[%r8 + %r9], %r23
	.word 0xec9a1009  ! 2544: LDDA_R	ldda	[%r8, %r9] 0x80, %r22
	.word 0xca720009  ! 2547: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xcd020009  ! 2547: LDF_R	ld	[%r8, %r9], %f6
	.word 0xcaa22394  ! 2547: STWA_I	stwa	%r5, [%r8 + 0x0394] %asi
	.word 0xdc220009  ! 2550: STW_R	stw	%r14, [%r8 + %r9]
	.word 0xc80a0009  ! 2550: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xc68224a8  ! 2550: LDUWA_I	lduwa	[%r8, + 0x04a8] %asi, %r3
	.word 0xc4320009  ! 2553: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc80a0009  ! 2553: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xc8a21009  ! 2553: STWA_R	stwa	%r4, [%r8 + %r9] 0x80
	.word 0xc4220009  ! 2556: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xf5020009  ! 2556: LDF_R	ld	[%r8, %r9], %f26
	.word 0xc2fa1009  ! 2556: SWAPA_R	swapa	%r1, [%r8 + %r9] 0x80
	.word 0xc2720009  ! 2559: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xca4a0009  ! 2559: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xc9f21009  ! 2559: CASXA_I	casxa	[%r8] 0x80, %r9, %r4
	.word 0xed220009  ! 2562: STF_R	st	%f22, [%r9, %r8]
	.word 0xe45a0009  ! 2562: LDX_R	ldx	[%r8 + %r9], %r18
	.word 0xce420009  ! 2562: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xcf3a0009  ! 2565: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc64a0009  ! 2565: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xc36a27a4  ! 2565: PREFETCH_I	prefetch	[%r8 + 0x07a4], #one_read
	.word 0xca320009  ! 2568: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc4020009  ! 2568: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0x8143c000  ! 2568: STBAR	stbar
	.word 0xc5220009  ! 2571: STF_R	st	%f2, [%r9, %r8]
	.word 0xcb1a0009  ! 2571: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0x8143e040  ! 2571: MEMBAR	membar	#Sync 
	.word 0xcc2a0009  ! 2574: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc91a0009  ! 2574: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0x847a24c4  ! 2574: SDIV_I	sdiv 	%r8, 0x04c4, %r2
	.word 0xe3220009  ! 2577: STF_R	st	%f17, [%r9, %r8]
	.word 0xc44a0009  ! 2577: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0x3a800001  ! 2577: BCC	bcc,a	<label_0x1>
	.word 0xf6220009  ! 2580: STW_R	stw	%r27, [%r8 + %r9]
	.word 0xfa4a0009  ! 2580: LDSB_R	ldsb	[%r8 + %r9], %r29
	.word 0xceea26c8  ! 2580: LDSTUBA_I	ldstuba	%r7, [%r8 + 0x06c8] %asi
	.word 0xf4220009  ! 2583: STW_R	stw	%r26, [%r8 + %r9]
	.word 0xc2120009  ! 2583: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0x36800001  ! 2583: BGE	bge,a	<label_0x1>
	.word 0xff220009  ! 2586: STF_R	st	%f31, [%r9, %r8]
	.word 0xe8020009  ! 2586: LDUW_R	lduw	[%r8 + %r9], %r20
	.word 0xbba209a9  ! 2586: FDIVs	fdivs	%f8, %f9, %f29
	.word 0xc62a0009  ! 2589: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xcc4a0009  ! 2589: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xcef22090  ! 2589: STXA_I	stxa	%r7, [%r8 + 0x0090] %asi
	.word 0xd73a0009  ! 2592: STDF_R	std	%f11, [%r9, %r8]
	.word 0xce520009  ! 2592: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0x8ba20929  ! 2592: FMULs	fmuls	%f8, %f9, %f5
	.word 0xc82a0009  ! 2595: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc3020009  ! 2595: LDF_R	ld	[%r8, %r9], %f1
	.word 0x8f222e84  ! 2595: MULScc_I	mulscc 	%r8, 0x0e84, %r7
	.word 0xcc320009  ! 2598: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xca020009  ! 2598: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0x1c800002  ! 2598: BPOS	bpos  	<label_0x2>
	.word 0xdb220009  ! 2601: STF_R	st	%f13, [%r9, %r8]
	.word 0xc4420009  ! 2601: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xc2821009  ! 2601: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r1
	.word 0xf0320009  ! 2604: STH_R	sth	%r24, [%r8 + %r9]
	.word 0xc4420009  ! 2604: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0x12800001  ! 2604: BNE	bne  	<label_0x1>
	.word 0xcc220009  ! 2607: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc7020009  ! 2607: LDF_R	ld	[%r8, %r9], %f3
	.word 0xc28221f8  ! 2607: LDUWA_I	lduwa	[%r8, + 0x01f8] %asi, %r1
	.word 0xc82a0009  ! 2610: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xcb1a0009  ! 2610: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xb4fa0009  ! 2610: SDIVcc_R	sdivcc 	%r8, %r9, %r26
	.word 0xe82a0009  ! 2613: STB_R	stb	%r20, [%r8 + %r9]
	.word 0xde5a0009  ! 2613: LDX_R	ldx	[%r8 + %r9], %r15
	.word 0xc2a22b34  ! 2613: STWA_I	stwa	%r1, [%r8 + 0x0b34] %asi
	.word 0xdb220009  ! 2616: STF_R	st	%f13, [%r9, %r8]
	.word 0xec420009  ! 2616: LDSW_R	ldsw	[%r8 + %r9], %r22
	.word 0x86f20009  ! 2616: UDIVcc_R	udivcc 	%r8, %r9, %r3
	.word 0xe93a0009  ! 2619: STDF_R	std	%f20, [%r9, %r8]
	.word 0xc8520009  ! 2619: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0x8143e056  ! 2619: MEMBAR	membar	#StoreLoad | #LoadStore | #Lookaside | #Sync 
	.word 0xc8720009  ! 2622: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xea120009  ! 2622: LDUH_R	lduh	[%r8 + %r9], %r21
	.word 0xc89227e0  ! 2622: LDUHA_I	lduha	[%r8, + 0x07e0] %asi, %r4
	.word 0xd6220009  ! 2625: STW_R	stw	%r11, [%r8 + %r9]
	.word 0xce420009  ! 2625: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xda520009  ! 2625: LDSH_R	ldsh	[%r8 + %r9], %r13
	.word 0xcc320009  ! 2628: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc84a0009  ! 2628: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xc09a1009  ! 2628: LDDA_R	ldda	[%r8, %r9] 0x80, %r0
	.word 0xca2a0009  ! 2631: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc45a0009  ! 2631: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xceea1009  ! 2631: LDSTUBA_R	ldstuba	%r7, [%r8 + %r9] 0x80
	.word 0xf02a0009  ! 2634: STB_R	stb	%r24, [%r8 + %r9]
	.word 0xce420009  ! 2634: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xb1a20929  ! 2634: FMULs	fmuls	%f8, %f9, %f24
	.word 0xc22a0009  ! 2637: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xca5a0009  ! 2637: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xcec21009  ! 2637: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r7
	.word 0xde2a0009  ! 2640: STB_R	stb	%r15, [%r8 + %r9]
	.word 0xc2420009  ! 2640: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xf1f21009  ! 2640: CASXA_I	casxa	[%r8] 0x80, %r9, %r24
	.word 0xc8220009  ! 2643: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xe0520009  ! 2643: LDSH_R	ldsh	[%r8 + %r9], %r16
	.word 0x3c800001  ! 2643: BPOS	bpos,a	<label_0x1>
	.word 0xc7220009  ! 2646: STF_R	st	%f3, [%r9, %r8]
	.word 0xc6120009  ! 2646: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xce0a0009  ! 2646: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xee320009  ! 2649: STH_R	sth	%r23, [%r8 + %r9]
	.word 0xc71a0009  ! 2649: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xbc720009  ! 2649: UDIV_R	udiv 	%r8, %r9, %r30
	.word 0xf3220009  ! 2652: STF_R	st	%f25, [%r9, %r8]
	.word 0xc8020009  ! 2652: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xc66a0009  ! 2652: LDSTUB_R	ldstub	%r3, [%r8 + %r9]
	.word 0xc8220009  ! 2655: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xca120009  ! 2655: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xc53a2d20  ! 2655: STDF_I	std	%f2, [0x0d20, %r8]
	.word 0xc82a0009  ! 2658: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xca420009  ! 2658: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0x8143e04b  ! 2658: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Sync 
	.word 0xd93a0009  ! 2661: STDF_R	std	%f12, [%r9, %r8]
	.word 0xcd1a0009  ! 2661: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0x96f20009  ! 2661: UDIVcc_R	udivcc 	%r8, %r9, %r11
	.word 0xc4720009  ! 2664: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xee4a0009  ! 2664: LDSB_R	ldsb	[%r8 + %r9], %r23
	.word 0xc81a2e00  ! 2664: LDD_I	ldd	[%r8 + 0x0e00], %r4
	.word 0xc2720009  ! 2667: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc81a0009  ! 2667: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x825a0009  ! 2667: SMUL_R	smul 	%r8, %r9, %r1
	.word 0xc6320009  ! 2670: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xcd1a0009  ! 2670: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xe8ea234c  ! 2670: LDSTUBA_I	ldstuba	%r20, [%r8 + 0x034c] %asi
	.word 0xf9220009  ! 2673: STF_R	st	%f28, [%r9, %r8]
	.word 0xc64a0009  ! 2673: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0x2a800002  ! 2673: BCS	bcs,a	<label_0x2>
	.word 0xc4320009  ! 2676: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xec0a0009  ! 2676: LDUB_R	ldub	[%r8 + %r9], %r22
	.word 0xc6120009  ! 2676: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xce2a0009  ! 2679: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xce020009  ! 2679: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0x844a2854  ! 2679: MULX_I	mulx 	%r8, 0x0854, %r2
	.word 0xc6220009  ! 2682: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xd71a0009  ! 2682: LDDF_R	ldd	[%r8, %r9], %f11
	.word 0x2aca0001  ! 2682: BRNZ	brnz,a,pt	%8,<label_0xa0001>
	.word 0xc62a0009  ! 2685: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc6520009  ! 2685: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xc4aa1009  ! 2685: STBA_R	stba	%r2, [%r8 + %r9] 0x80
	.word 0xc53a0009  ! 2688: STDF_R	std	%f2, [%r9, %r8]
	.word 0xe41a0009  ! 2688: LDD_R	ldd	[%r8 + %r9], %r18
	.word 0xe4fa1009  ! 2688: SWAPA_R	swapa	%r18, [%r8 + %r9] 0x80
	.word 0xc82a0009  ! 2691: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xec1a0009  ! 2691: LDD_R	ldd	[%r8 + %r9], %r22
	.word 0x9e522194  ! 2691: UMUL_I	umul 	%r8, 0x0194, %r15
	.word 0xc33a0009  ! 2694: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc41a0009  ! 2694: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xc3ea1009  ! 2694: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xf6320009  ! 2697: STH_R	sth	%r27, [%r8 + %r9]
	.word 0xe4120009  ! 2697: LDUH_R	lduh	[%r8 + %r9], %r18
	.word 0xe93a0009  ! 2697: STDF_R	std	%f20, [%r9, %r8]
	.word 0xcb3a0009  ! 2700: STDF_R	std	%f5, [%r9, %r8]
	.word 0xc41a0009  ! 2700: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xe6ea1009  ! 2700: LDSTUBA_R	ldstuba	%r19, [%r8 + %r9] 0x80
	.word 0xce2a0009  ! 2703: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc60a0009  ! 2703: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0x8e6a2a3c  ! 2703: UDIVX_I	udivx 	%r8, 0x0a3c, %r7
	.word 0xec2a0009  ! 2706: STB_R	stb	%r22, [%r8 + %r9]
	.word 0xcc5a0009  ! 2706: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xc73a0009  ! 2706: STDF_R	std	%f3, [%r9, %r8]
	.word 0xe6220009  ! 2709: STW_R	stw	%r19, [%r8 + %r9]
	.word 0xc41a0009  ! 2709: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xdb220009  ! 2709: STF_R	st	%f13, [%r9, %r8]
	.word 0xcf3a0009  ! 2712: STDF_R	std	%f7, [%r9, %r8]
	.word 0xcc420009  ! 2712: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xb84a0009  ! 2712: MULX_R	mulx 	%r8, %r9, %r28
	.word 0xd93a0009  ! 2715: STDF_R	std	%f12, [%r9, %r8]
	.word 0xca4a0009  ! 2715: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xc2b21009  ! 2715: STHA_R	stha	%r1, [%r8 + %r9] 0x80
	.word 0xca720009  ! 2718: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xca0a0009  ! 2718: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xc3ea2170  ! 2718: PREFETCHA_I	prefetcha	[%r8, + 0x0170] %asi, #one_read
	.word 0xca320009  ! 2721: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc44a0009  ! 2721: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xe0da1009  ! 2721: LDXA_R	ldxa	[%r8, %r9] 0x80, %r16
	.word 0xce720009  ! 2724: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xdb1a0009  ! 2724: LDDF_R	ldd	[%r8, %r9], %f13
	.word 0x22c20001  ! 2724: BRZ	brz,a,nt	%8,<label_0x20001>
	.word 0xe2720009  ! 2727: STX_R	stx	%r17, [%r8 + %r9]
	.word 0xca020009  ! 2727: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0x8b220009  ! 2727: MULScc_R	mulscc 	%r8, %r9, %r5
	.word 0xcb3a0009  ! 2730: STDF_R	std	%f5, [%r9, %r8]
	.word 0xce420009  ! 2730: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xecca1009  ! 2730: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r22
	.word 0xc62a0009  ! 2733: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xf05a0009  ! 2733: LDX_R	ldx	[%r8 + %r9], %r24
	.word 0x86720009  ! 2733: UDIV_R	udiv 	%r8, %r9, %r3
	.word 0xf8720009  ! 2736: STX_R	stx	%r28, [%r8 + %r9]
	.word 0xc3020009  ! 2736: LDF_R	ld	[%r8, %r9], %f1
	.word 0xfaa22ff0  ! 2736: STWA_I	stwa	%r29, [%r8 + 0x0ff0] %asi
	.word 0xc6220009  ! 2739: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xcb1a0009  ! 2739: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xe53a0009  ! 2739: STDF_R	std	%f18, [%r9, %r8]
	.word 0xff220009  ! 2742: STF_R	st	%f31, [%r9, %r8]
	.word 0xdc1a0009  ! 2742: LDD_R	ldd	[%r8 + %r9], %r14
	.word 0xcb1a0009  ! 2742: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xe53a0009  ! 2745: STDF_R	std	%f18, [%r9, %r8]
	.word 0xca020009  ! 2745: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0x8143e062  ! 2745: MEMBAR	membar	#StoreLoad | #MemIssue | #Sync 
	.word 0xde2a0009  ! 2748: STB_R	stb	%r15, [%r8 + %r9]
	.word 0xca520009  ! 2748: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0x06ca0001  ! 2748: BRLZ	brlz  ,pt	%8,<label_0xa0001>
	.word 0xe62a0009  ! 2751: STB_R	stb	%r19, [%r8 + %r9]
	.word 0xfd020009  ! 2751: LDF_R	ld	[%r8, %r9], %f30
	.word 0xa8722930  ! 2751: UDIV_I	udiv 	%r8, 0x0930, %r20
	.word 0xcc2a0009  ! 2754: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc6020009  ! 2754: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0x8143e022  ! 2754: MEMBAR	membar	#StoreLoad | #MemIssue 
	.word 0xca220009  ! 2757: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xcc120009  ! 2757: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xc8da2350  ! 2757: LDXA_I	ldxa	[%r8, + 0x0350] %asi, %r4
	.word 0xc8220009  ! 2760: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xec520009  ! 2760: LDSH_R	ldsh	[%r8 + %r9], %r22
	.word 0xc3ea2f9c  ! 2760: PREFETCHA_I	prefetcha	[%r8, + 0x0f9c] %asi, #one_read
	.word 0xc33a0009  ! 2763: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc81a0009  ! 2763: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x8143c000  ! 2763: STBAR	stbar
	.word 0xef220009  ! 2766: STF_R	st	%f23, [%r9, %r8]
	.word 0xec4a0009  ! 2766: LDSB_R	ldsb	[%r8 + %r9], %r22
	.word 0xc6d21009  ! 2766: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r3
	.word 0xca220009  ! 2769: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xf11a0009  ! 2769: LDDF_R	ldd	[%r8, %r9], %f24
	.word 0xe6ca2e90  ! 2769: LDSBA_I	ldsba	[%r8, + 0x0e90] %asi, %r19
	.word 0xcb3a0009  ! 2772: STDF_R	std	%f5, [%r9, %r8]
	.word 0xcc420009  ! 2772: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0x88fa0009  ! 2772: SDIVcc_R	sdivcc 	%r8, %r9, %r4
	.word 0xe5220009  ! 2775: STF_R	st	%f18, [%r9, %r8]
	.word 0xc65a0009  ! 2775: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xccba1009  ! 2775: STDA_R	stda	%r6, [%r8 + %r9] 0x80
	.word 0xe0320009  ! 2778: STH_R	sth	%r16, [%r8 + %r9]
	.word 0xcc020009  ! 2778: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xcf3a25a0  ! 2778: STDF_I	std	%f7, [0x05a0, %r8]
	.word 0xc22a0009  ! 2781: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xdb1a0009  ! 2781: LDDF_R	ldd	[%r8, %r9], %f13
	.word 0xdc1a0009  ! 2781: LDD_R	ldd	[%r8 + %r9], %r14
	.word 0xcd3a0009  ! 2784: STDF_R	std	%f6, [%r9, %r8]
	.word 0xdb020009  ! 2784: LDF_R	ld	[%r8, %r9], %f13
	.word 0x85222b24  ! 2784: MULScc_I	mulscc 	%r8, 0x0b24, %r2
	.word 0xc4220009  ! 2787: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xca420009  ! 2787: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0x84fa2b78  ! 2787: SDIVcc_I	sdivcc 	%r8, 0x0b78, %r2
	.word 0xca220009  ! 2790: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xcc5a0009  ! 2790: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xbc7a0009  ! 2790: SDIV_R	sdiv 	%r8, %r9, %r30
	.word 0xce320009  ! 2793: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xcc1a0009  ! 2793: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0x0cc20001  ! 2793: BRGZ	brgz  ,nt	%8,<label_0x20001>
	.word 0xc82a0009  ! 2796: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xca0a0009  ! 2796: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0x8143e070  ! 2796: MEMBAR	membar	#Lookaside | #MemIssue | #Sync 
	.word 0xcc220009  ! 2799: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xfa520009  ! 2799: LDSH_R	ldsh	[%r8 + %r9], %r29
	.word 0xc4ca1009  ! 2799: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r2
	.word 0xce320009  ! 2802: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xce420009  ! 2802: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xc9f22009  ! 2802: CASXA_R	casxa	[%r8]%asi, %r9, %r4
	.word 0xfb220009  ! 2805: STF_R	st	%f29, [%r9, %r8]
	.word 0xf2120009  ! 2805: LDUH_R	lduh	[%r8 + %r9], %r25
	.word 0x8143e027  ! 2805: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #MemIssue 
	.word 0xc7220009  ! 2808: STF_R	st	%f3, [%r9, %r8]
	.word 0xc71a0009  ! 2808: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xc36a0009  ! 2808: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xca320009  ! 2811: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xca4a0009  ! 2811: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xca8a1009  ! 2811: LDUBA_R	lduba	[%r8, %r9] 0x80, %r5
	.word 0xc2320009  ! 2814: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc8020009  ! 2814: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xcaea2b40  ! 2814: LDSTUBA_I	ldstuba	%r5, [%r8 + 0x0b40] %asi
	.word 0xc42a0009  ! 2817: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc41a0009  ! 2817: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x8143c000  ! 2817: STBAR	stbar
	.word 0xc2720009  ! 2820: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xdd1a0009  ! 2820: LDDF_R	ldd	[%r8, %r9], %f14
	.word 0xda921009  ! 2820: LDUHA_R	lduha	[%r8, %r9] 0x80, %r13
	.word 0xc6320009  ! 2823: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc2120009  ! 2823: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xced21009  ! 2823: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r7
	.word 0xcd3a0009  ! 2826: STDF_R	std	%f6, [%r9, %r8]
	.word 0xf85a0009  ! 2826: LDX_R	ldx	[%r8 + %r9], %r28
	.word 0xcff22009  ! 2826: CASXA_R	casxa	[%r8]%asi, %r9, %r7
	.word 0xc8220009  ! 2829: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc9020009  ! 2829: LDF_R	ld	[%r8, %r9], %f4
	.word 0xc7e22009  ! 2829: CASA_R	casa	[%r8] %asi, %r9, %r3
	.word 0xc4320009  ! 2832: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc2020009  ! 2832: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0x8cf20009  ! 2832: UDIVcc_R	udivcc 	%r8, %r9, %r6
	.word 0xfb3a0009  ! 2835: STDF_R	std	%f29, [%r9, %r8]
	.word 0xe00a0009  ! 2835: LDUB_R	ldub	[%r8 + %r9], %r16
	.word 0xaed22ccc  ! 2835: UMULcc_I	umulcc 	%r8, 0x0ccc, %r23
	.word 0xca320009  ! 2838: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xca0a0009  ! 2838: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xcaf21009  ! 2838: STXA_R	stxa	%r5, [%r8 + %r9] 0x80
	.word 0xcb220009  ! 2841: STF_R	st	%f5, [%r9, %r8]
	.word 0xcc4a0009  ! 2841: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xb0fa26b4  ! 2841: SDIVcc_I	sdivcc 	%r8, 0x06b4, %r24
	.word 0xee720009  ! 2844: STX_R	stx	%r23, [%r8 + %r9]
	.word 0xe91a0009  ! 2844: LDDF_R	ldd	[%r8, %r9], %f20
	.word 0x8c5a0009  ! 2844: SMUL_R	smul 	%r8, %r9, %r6
	.word 0xe53a0009  ! 2847: STDF_R	std	%f18, [%r9, %r8]
	.word 0xfe520009  ! 2847: LDSH_R	ldsh	[%r8 + %r9], %r31
	.word 0x8143e07c  ! 2847: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xf62a0009  ! 2850: STB_R	stb	%r27, [%r8 + %r9]
	.word 0xcb1a0009  ! 2850: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xcafa1009  ! 2850: SWAPA_R	swapa	%r5, [%r8 + %r9] 0x80
	.word 0xcf3a0009  ! 2853: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc64a0009  ! 2853: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0x1e800001  ! 2853: BVC	bvc  	<label_0x1>
	.word 0xe8720009  ! 2856: STX_R	stx	%r20, [%r8 + %r9]
	.word 0xcc1a0009  ! 2856: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0x02800001  ! 2856: BE	be  	<label_0x1>
	.word 0xca320009  ! 2859: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xe81a0009  ! 2859: LDD_R	ldd	[%r8 + %r9], %r20
	.word 0xf6f221a0  ! 2859: STXA_I	stxa	%r27, [%r8 + 0x01a0] %asi
	.word 0xcb220009  ! 2862: STF_R	st	%f5, [%r9, %r8]
	.word 0xce120009  ! 2862: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xcb3a0009  ! 2862: STDF_R	std	%f5, [%r9, %r8]
	.word 0xcc720009  ! 2865: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc2120009  ! 2865: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xa8722764  ! 2865: UDIV_I	udiv 	%r8, 0x0764, %r20
	.word 0xca720009  ! 2868: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xe71a0009  ! 2868: LDDF_R	ldd	[%r8, %r9], %f19
	.word 0xc3ea1009  ! 2868: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc8320009  ! 2871: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xca020009  ! 2871: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0x8ba209a9  ! 2871: FDIVs	fdivs	%f8, %f9, %f5
	.word 0xf2720009  ! 2874: STX_R	stx	%r25, [%r8 + %r9]
	.word 0xc5020009  ! 2874: LDF_R	ld	[%r8, %r9], %f2
	.word 0xfa022824  ! 2874: LDUW_I	lduw	[%r8 + 0x0824], %r29
	.word 0xcf220009  ! 2877: STF_R	st	%f7, [%r9, %r8]
	.word 0xc6120009  ! 2877: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0x88720009  ! 2877: UDIV_R	udiv 	%r8, %r9, %r4
	.word 0xcc220009  ! 2880: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc91a0009  ! 2880: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xb872298c  ! 2880: UDIV_I	udiv 	%r8, 0x098c, %r28
	.word 0xce320009  ! 2883: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc44a0009  ! 2883: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0x00800002  ! 2883: BN	bn  	<label_0x2>
	.word 0xc2720009  ! 2886: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xf91a0009  ! 2886: LDDF_R	ldd	[%r8, %r9], %f28
	.word 0xc3ea1009  ! 2886: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xcf3a0009  ! 2889: STDF_R	std	%f7, [%r9, %r8]
	.word 0xf2420009  ! 2889: LDSW_R	ldsw	[%r8 + %r9], %r25
	.word 0xe8f22598  ! 2889: STXA_I	stxa	%r20, [%r8 + 0x0598] %asi
	.word 0xc9220009  ! 2892: STF_R	st	%f4, [%r9, %r8]
	.word 0xee120009  ! 2892: LDUH_R	lduh	[%r8 + %r9], %r23
	.word 0xcafa262c  ! 2892: SWAPA_I	swapa	%r5, [%r8 + 0x062c] %asi
	.word 0xf13a0009  ! 2895: STDF_R	std	%f24, [%r9, %r8]
	.word 0xc9020009  ! 2895: LDF_R	ld	[%r8, %r9], %f4
	.word 0xc3ea1009  ! 2895: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc2220009  ! 2898: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc45a0009  ! 2898: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0x8cfa29a0  ! 2898: SDIVcc_I	sdivcc 	%r8, 0x09a0, %r6
	.word 0xce320009  ! 2901: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc65a0009  ! 2901: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0x99220009  ! 2901: MULScc_R	mulscc 	%r8, %r9, %r12
	.word 0xcc2a0009  ! 2904: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc4020009  ! 2904: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0x8ada2468  ! 2904: SMULcc_I	smulcc 	%r8, 0x0468, %r5
	.word 0xc22a0009  ! 2907: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xea120009  ! 2907: LDUH_R	lduh	[%r8 + %r9], %r21
	.word 0x06ca0001  ! 2907: BRLZ	brlz  ,pt	%8,<label_0xa0001>
	.word 0xc42a0009  ! 2910: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc4020009  ! 2910: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xf87a2434  ! 2910: SWAP_I	swap	%r28, [%r8 + 0x0434]
	.word 0xcb3a0009  ! 2913: STDF_R	std	%f5, [%r9, %r8]
	.word 0xce520009  ! 2913: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xc3ea2fc4  ! 2913: PREFETCHA_I	prefetcha	[%r8, + 0x0fc4] %asi, #one_read
	.word 0xcb3a0009  ! 2916: STDF_R	std	%f5, [%r9, %r8]
	.word 0xcc4a0009  ! 2916: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0x985225c4  ! 2916: UMUL_I	umul 	%r8, 0x05c4, %r12
	.word 0xc22a0009  ! 2919: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc8020009  ! 2919: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xcd220009  ! 2919: STF_R	st	%f6, [%r9, %r8]
	.word 0xe02a0009  ! 2922: STB_R	stb	%r16, [%r8 + %r9]
	.word 0xf6420009  ! 2922: LDSW_R	ldsw	[%r8 + %r9], %r27
	.word 0xca921009  ! 2922: LDUHA_R	lduha	[%r8, %r9] 0x80, %r5
	.word 0xc4320009  ! 2925: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xcc520009  ! 2925: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0x04c20001  ! 2925: BRLEZ	brlez  ,nt	%8,<label_0x20001>
	.word 0xf6320009  ! 2928: STH_R	sth	%r27, [%r8 + %r9]
	.word 0xda020009  ! 2928: LDUW_R	lduw	[%r8 + %r9], %r13
	.word 0xaf220009  ! 2928: MULScc_R	mulscc 	%r8, %r9, %r23
	.word 0xef220009  ! 2931: STF_R	st	%f23, [%r9, %r8]
	.word 0xf80a0009  ! 2931: LDUB_R	ldub	[%r8 + %r9], %r28
	.word 0xe6522c78  ! 2931: LDSH_I	ldsh	[%r8 + 0x0c78], %r19
	.word 0xcd220009  ! 2934: STF_R	st	%f6, [%r9, %r8]
	.word 0xc4520009  ! 2934: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0x3e800002  ! 2934: BVC	bvc,a	<label_0x2>
	.word 0xdb3a0009  ! 2937: STDF_R	std	%f13, [%r9, %r8]
	.word 0xc6420009  ! 2937: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xc2a224bc  ! 2937: STWA_I	stwa	%r1, [%r8 + 0x04bc] %asi
	.word 0xf82a0009  ! 2940: STB_R	stb	%r28, [%r8 + %r9]
	.word 0xc6120009  ! 2940: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xfe420009  ! 2940: LDSW_R	ldsw	[%r8 + %r9], %r31
	.word 0xc9220009  ! 2943: STF_R	st	%f4, [%r9, %r8]
	.word 0xc8420009  ! 2943: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0x82f20009  ! 2943: UDIVcc_R	udivcc 	%r8, %r9, %r1
	.word 0xc73a0009  ! 2946: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc2020009  ! 2946: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xd6922024  ! 2946: LDUHA_I	lduha	[%r8, + 0x0024] %asi, %r11
	.word 0xe0320009  ! 2949: STH_R	sth	%r16, [%r8 + %r9]
	.word 0xf85a0009  ! 2949: LDX_R	ldx	[%r8 + %r9], %r28
	.word 0xe80a0009  ! 2949: LDUB_R	ldub	[%r8 + %r9], %r20
	.word 0xf53a0009  ! 2952: STDF_R	std	%f26, [%r9, %r8]
	.word 0xdc5a0009  ! 2952: LDX_R	ldx	[%r8 + %r9], %r14
	.word 0x886a2990  ! 2952: UDIVX_I	udivx 	%r8, 0x0990, %r4
	.word 0xda220009  ! 2955: STW_R	stw	%r13, [%r8 + %r9]
	.word 0xc4420009  ! 2955: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0x18800001  ! 2955: BGU	bgu  	<label_0x1>
	.word 0xc3220009  ! 2958: STF_R	st	%f1, [%r9, %r8]
	.word 0xd7020009  ! 2958: LDF_R	ld	[%r8, %r9], %f11
	.word 0xc3ea266c  ! 2958: PREFETCHA_I	prefetcha	[%r8, + 0x066c] %asi, #one_read
	.word 0xca320009  ! 2961: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xe60a0009  ! 2961: LDUB_R	ldub	[%r8 + %r9], %r19
	.word 0xc2ca293c  ! 2961: LDSBA_I	ldsba	[%r8, + 0x093c] %asi, %r1
	.word 0xe2320009  ! 2964: STH_R	sth	%r17, [%r8 + %r9]
	.word 0xf41a0009  ! 2964: LDD_R	ldd	[%r8 + %r9], %r26
	.word 0xb922226c  ! 2964: MULScc_I	mulscc 	%r8, 0x026c, %r28
	.word 0xc4320009  ! 2967: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc4420009  ! 2967: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xc4b21009  ! 2967: STHA_R	stha	%r2, [%r8 + %r9] 0x80
	.word 0xc4720009  ! 2970: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xcc4a0009  ! 2970: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xb2d20009  ! 2970: UMULcc_R	umulcc 	%r8, %r9, %r25
	.word 0xc82a0009  ! 2973: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc24a0009  ! 2973: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0x86f20009  ! 2973: UDIVcc_R	udivcc 	%r8, %r9, %r3
	.word 0xc6220009  ! 2976: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xfa120009  ! 2976: LDUH_R	lduh	[%r8 + %r9], %r29
	.word 0x8f220009  ! 2976: MULScc_R	mulscc 	%r8, %r9, %r7
	.word 0xca2a0009  ! 2979: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc91a0009  ! 2979: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xcea220bc  ! 2979: STWA_I	stwa	%r7, [%r8 + 0x00bc] %asi
	.word 0xc73a0009  ! 2982: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc9020009  ! 2982: LDF_R	ld	[%r8, %r9], %f4
	.word 0xfc6a2008  ! 2982: LDSTUB_I	ldstub	%r30, [%r8 + 0x0008]
	.word 0xce720009  ! 2985: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc20a0009  ! 2985: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xf8aa1009  ! 2985: STBA_R	stba	%r28, [%r8 + %r9] 0x80
	.word 0xc4720009  ! 2988: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xfc1a0009  ! 2988: LDD_R	ldd	[%r8 + %r9], %r30
	.word 0xc93a2068  ! 2988: STDF_I	std	%f4, [0x0068, %r8]
	.word 0xc2320009  ! 2991: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xce4a0009  ! 2991: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xc3ea1009  ! 2991: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xee2a0009  ! 2994: STB_R	stb	%r23, [%r8 + %r9]
	.word 0xf71a0009  ! 2994: LDDF_R	ldd	[%r8, %r9], %f27
	.word 0xcc1a0009  ! 2994: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xd8220009  ! 2997: STW_R	stw	%r12, [%r8 + %r9]
	.word 0xe2520009  ! 2997: LDSH_R	ldsh	[%r8 + %r9], %r17
	.word 0xf0ba1009  ! 2997: STDA_R	stda	%r24, [%r8 + %r9] 0x80
	.word 0xf8320009  ! 3000: STH_R	sth	%r28, [%r8 + %r9]
	.word 0xc2520009  ! 3000: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xdada2d60  ! 3000: LDXA_I	ldxa	[%r8, + 0x0d60] %asi, %r13
	.word 0xc22a0009  ! 3003: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xf24a0009  ! 3003: LDSB_R	ldsb	[%r8 + %r9], %r25
	.word 0xcc8a1009  ! 3003: LDUBA_R	lduba	[%r8, %r9] 0x80, %r6
	.word 0xce2a0009  ! 3006: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc64a0009  ! 3006: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0x87a208a9  ! 3006: FSUBs	fsubs	%f8, %f9, %f3
	.word 0xc42a0009  ! 3009: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xce5a0009  ! 3009: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xc93a2490  ! 3009: STDF_I	std	%f4, [0x0490, %r8]
	.word 0xc6320009  ! 3012: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xe01a0009  ! 3012: LDD_R	ldd	[%r8 + %r9], %r16
	.word 0xc36a0009  ! 3012: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc53a0009  ! 3015: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc85a0009  ! 3015: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xf86a2428  ! 3015: LDSTUB_I	ldstub	%r28, [%r8 + 0x0428]
	.word 0xce320009  ! 3018: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xce4a0009  ! 3018: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xc36a0009  ! 3018: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xce220009  ! 3021: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xcc1a0009  ! 3021: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0x8d2224e4  ! 3021: MULScc_I	mulscc 	%r8, 0x04e4, %r6
	.word 0xda2a0009  ! 3024: STB_R	stb	%r13, [%r8 + %r9]
	.word 0xc6020009  ! 3024: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xc49a2ac8  ! 3024: LDDA_I	ldda	[%r8, + 0x0ac8] %asi, %r2
	.word 0xc6320009  ! 3027: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc81a0009  ! 3027: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xa45a2c9c  ! 3027: SMUL_I	smul 	%r8, 0x0c9c, %r18
	.word 0xce320009  ! 3030: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xe6020009  ! 3030: LDUW_R	lduw	[%r8 + %r9], %r19
	.word 0xc36a0009  ! 3030: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xe4220009  ! 3033: STW_R	stw	%r18, [%r8 + %r9]
	.word 0xc4120009  ! 3033: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xc4f22260  ! 3033: STXA_I	stxa	%r2, [%r8 + 0x0260] %asi
	.word 0xcc720009  ! 3036: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xe24a0009  ! 3036: LDSB_R	ldsb	[%r8 + %r9], %r17
	.word 0xc41a0009  ! 3036: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xce320009  ! 3039: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc24a0009  ! 3039: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xc3ea292c  ! 3039: PREFETCHA_I	prefetcha	[%r8, + 0x092c] %asi, #one_read
	.word 0xc7220009  ! 3042: STF_R	st	%f3, [%r9, %r8]
	.word 0xc8020009  ! 3042: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xce82286c  ! 3042: LDUWA_I	lduwa	[%r8, + 0x086c] %asi, %r7
	.word 0xc22a0009  ! 3045: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xf41a0009  ! 3045: LDD_R	ldd	[%r8 + %r9], %r26
	.word 0xa67a0009  ! 3045: SDIV_R	sdiv 	%r8, %r9, %r19
	.word 0xf2720009  ! 3048: STX_R	stx	%r25, [%r8 + %r9]
	.word 0xc4520009  ! 3048: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0x8e5a0009  ! 3048: SMUL_R	smul 	%r8, %r9, %r7
	.word 0xec320009  ! 3051: STH_R	sth	%r22, [%r8 + %r9]
	.word 0xff1a0009  ! 3051: LDDF_R	ldd	[%r8, %r9], %f31
	.word 0xda120009  ! 3051: LDUH_R	lduh	[%r8 + %r9], %r13
	.word 0xcc220009  ! 3054: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc7020009  ! 3054: LDF_R	ld	[%r8, %r9], %f3
	.word 0x864a2310  ! 3054: MULX_I	mulx 	%r8, 0x0310, %r3
	.word 0xfc2a0009  ! 3057: STB_R	stb	%r30, [%r8 + %r9]
	.word 0xec420009  ! 3057: LDSW_R	ldsw	[%r8 + %r9], %r22
	.word 0xcef22ae8  ! 3057: STXA_I	stxa	%r7, [%r8 + 0x0ae8] %asi
	.word 0xc6720009  ! 3060: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xcc120009  ! 3060: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0x8ada0009  ! 3060: SMULcc_R	smulcc 	%r8, %r9, %r5
	.word 0xca2a0009  ! 3063: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xf71a0009  ! 3063: LDDF_R	ldd	[%r8, %r9], %f27
	.word 0x02c20001  ! 3063: BRZ	brz  ,nt	%8,<label_0x20001>
	.word 0xc2320009  ! 3066: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc64a0009  ! 3066: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0x8143c000  ! 3066: STBAR	stbar
	.word 0xcf3a0009  ! 3069: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc6120009  ! 3069: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xc3ea1009  ! 3069: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc5220009  ! 3072: STF_R	st	%f2, [%r9, %r8]
	.word 0xc85a0009  ! 3072: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xfdf22009  ! 3072: CASXA_R	casxa	[%r8]%asi, %r9, %r30
	.word 0xc53a0009  ! 3075: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc91a0009  ! 3075: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xc6b21009  ! 3075: STHA_R	stha	%r3, [%r8 + %r9] 0x80
	.word 0xdc320009  ! 3078: STH_R	sth	%r14, [%r8 + %r9]
	.word 0xcc020009  ! 3078: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0x856a22d8  ! 3078: SDIVX_I	sdivx	%r8, 0x02d8, %r2
	.word 0xc2220009  ! 3081: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xcb020009  ! 3081: LDF_R	ld	[%r8, %r9], %f5
	.word 0xceaa2df4  ! 3081: STBA_I	stba	%r7, [%r8 + 0x0df4] %asi
	.word 0xc2220009  ! 3084: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xcd1a0009  ! 3084: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0x82522370  ! 3084: UMUL_I	umul 	%r8, 0x0370, %r1
	.word 0xfa2a0009  ! 3087: STB_R	stb	%r29, [%r8 + %r9]
	.word 0xca520009  ! 3087: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0x8143e00e  ! 3087: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore 
	.word 0xea320009  ! 3090: STH_R	sth	%r21, [%r8 + %r9]
	.word 0xcb1a0009  ! 3090: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xe45a0009  ! 3090: LDX_R	ldx	[%r8 + %r9], %r18
	.word 0xf9220009  ! 3093: STF_R	st	%f28, [%r9, %r8]
	.word 0xe00a0009  ! 3093: LDUB_R	ldub	[%r8 + %r9], %r16
	.word 0x88d22d48  ! 3093: UMULcc_I	umulcc 	%r8, 0x0d48, %r4
	.word 0xde220009  ! 3096: STW_R	stw	%r15, [%r8 + %r9]
	.word 0xc65a0009  ! 3096: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xcab229c0  ! 3096: STHA_I	stha	%r5, [%r8 + 0x09c0] %asi
	.word 0xee220009  ! 3099: STW_R	stw	%r23, [%r8 + %r9]
	.word 0xcc0a0009  ! 3099: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0x8143e02e  ! 3099: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #MemIssue 
	.word 0xcd220009  ! 3102: STF_R	st	%f6, [%r9, %r8]
	.word 0xe65a0009  ! 3102: LDX_R	ldx	[%r8 + %r9], %r19
	.word 0xc36a0009  ! 3102: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc5220009  ! 3105: STF_R	st	%f2, [%r9, %r8]
	.word 0xc2120009  ! 3105: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xa2d20009  ! 3105: UMULcc_R	umulcc 	%r8, %r9, %r17
	.word 0xc4320009  ! 3108: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xea4a0009  ! 3108: LDSB_R	ldsb	[%r8 + %r9], %r21
	.word 0x8143c000  ! 3108: STBAR	stbar
	.word 0xf4220009  ! 3111: STW_R	stw	%r26, [%r8 + %r9]
	.word 0xc6420009  ! 3111: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xdea21009  ! 3111: STWA_R	stwa	%r15, [%r8 + %r9] 0x80
	.word 0xc93a0009  ! 3114: STDF_R	std	%f4, [%r9, %r8]
	.word 0xe85a0009  ! 3114: LDX_R	ldx	[%r8 + %r9], %r20
	.word 0x8143e067  ! 3114: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #MemIssue | #Sync 
	.word 0xc62a0009  ! 3117: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xf60a0009  ! 3117: LDUB_R	ldub	[%r8 + %r9], %r27
	.word 0xa0720009  ! 3117: UDIV_R	udiv 	%r8, %r9, %r16
	.word 0xc5220009  ! 3120: STF_R	st	%f2, [%r9, %r8]
	.word 0xf0120009  ! 3120: LDUH_R	lduh	[%r8 + %r9], %r24
	.word 0x82f2277c  ! 3120: UDIVcc_I	udivcc 	%r8, 0x077c, %r1
	.word 0xfc2a0009  ! 3123: STB_R	stb	%r30, [%r8 + %r9]
	.word 0xca4a0009  ! 3123: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xc53a2608  ! 3123: STDF_I	std	%f2, [0x0608, %r8]
	.word 0xc8220009  ! 3126: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xca0a0009  ! 3126: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xc4ba20b8  ! 3126: STDA_I	stda	%r2, [%r8 + 0x00b8] %asi
	.word 0xc4220009  ! 3129: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc3020009  ! 3129: LDF_R	ld	[%r8, %r9], %f1
	.word 0x8143e07f  ! 3129: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xe02a0009  ! 3132: STB_R	stb	%r16, [%r8 + %r9]
	.word 0xec420009  ! 3132: LDSW_R	ldsw	[%r8 + %r9], %r22
	.word 0x8143e07a  ! 3132: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xc8220009  ! 3135: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xe84a0009  ! 3135: LDSB_R	ldsb	[%r8 + %r9], %r20
	.word 0x866a0009  ! 3135: UDIVX_R	udivx 	%r8, %r9, %r3
	.word 0xc2720009  ! 3138: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xca120009  ! 3138: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0x8143c000  ! 3138: STBAR	stbar
	.word 0xfc320009  ! 3141: STH_R	sth	%r30, [%r8 + %r9]
	.word 0xcc5a0009  ! 3141: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xc8b21009  ! 3141: STHA_R	stha	%r4, [%r8 + %r9] 0x80
	.word 0xce720009  ! 3144: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc8020009  ! 3144: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xcd020009  ! 3144: LDF_R	ld	[%r8, %r9], %f6
	.word 0xd9220009  ! 3147: STF_R	st	%f12, [%r9, %r8]
	.word 0xc25a0009  ! 3147: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0x8143e01c  ! 3147: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside 
	.word 0xc9220009  ! 3150: STF_R	st	%f4, [%r9, %r8]
	.word 0xc81a0009  ! 3150: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xdc9a1009  ! 3150: LDDA_R	ldda	[%r8, %r9] 0x80, %r14
	.word 0xc4220009  ! 3153: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xe0020009  ! 3153: LDUW_R	lduw	[%r8 + %r9], %r16
	.word 0x2c800002  ! 3153: BNEG	bneg,a	<label_0x2>
	.word 0xc8320009  ! 3156: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xca5a0009  ! 3156: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xc36a27f4  ! 3156: PREFETCH_I	prefetch	[%r8 + 0x07f4], #one_read
	.word 0xcc720009  ! 3159: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc3020009  ! 3159: LDF_R	ld	[%r8, %r9], %f1
	.word 0x887a20bc  ! 3159: SDIV_I	sdiv 	%r8, 0x00bc, %r4
	.word 0xc53a0009  ! 3162: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc2520009  ! 3162: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xf89a25d8  ! 3162: LDDA_I	ldda	[%r8, + 0x05d8] %asi, %r28
	.word 0xc6220009  ! 3165: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc2420009  ! 3165: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xcaa21009  ! 3165: STWA_R	stwa	%r5, [%r8 + %r9] 0x80
	.word 0xf9220009  ! 3168: STF_R	st	%f28, [%r9, %r8]
	.word 0xfd020009  ! 3168: LDF_R	ld	[%r8, %r9], %f30
	.word 0xbda208a9  ! 3168: FSUBs	fsubs	%f8, %f9, %f30
	.word 0xce2a0009  ! 3171: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xd85a0009  ! 3171: LDX_R	ldx	[%r8 + %r9], %r12
	.word 0x8143c000  ! 3171: STBAR	stbar
	.word 0xe2720009  ! 3174: STX_R	stx	%r17, [%r8 + %r9]
	.word 0xdc420009  ! 3174: LDSW_R	ldsw	[%r8 + %r9], %r14
	.word 0xc7f22009  ! 3174: CASXA_R	casxa	[%r8]%asi, %r9, %r3
	.word 0xcb220009  ! 3177: STF_R	st	%f5, [%r9, %r8]
	.word 0xed020009  ! 3177: LDF_R	ld	[%r8, %r9], %f22
	.word 0x87a20929  ! 3177: FMULs	fmuls	%f8, %f9, %f3
	.word 0xc33a0009  ! 3180: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc81a0009  ! 3180: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xff3a0009  ! 3180: STDF_R	std	%f31, [%r9, %r8]
	.word 0xdf220009  ! 3183: STF_R	st	%f15, [%r9, %r8]
	.word 0xce4a0009  ! 3183: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xc3ea1009  ! 3183: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc82a0009  ! 3186: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xe84a0009  ! 3186: LDSB_R	ldsb	[%r8 + %r9], %r20
	.word 0x89a20829  ! 3186: FADDs	fadds	%f8, %f9, %f4
	.word 0xda320009  ! 3189: STH_R	sth	%r13, [%r8 + %r9]
	.word 0xe0120009  ! 3189: LDUH_R	lduh	[%r8 + %r9], %r16
	.word 0x8c720009  ! 3189: UDIV_R	udiv 	%r8, %r9, %r6
	.word 0xe3220009  ! 3192: STF_R	st	%f17, [%r9, %r8]
	.word 0xe24a0009  ! 3192: LDSB_R	ldsb	[%r8 + %r9], %r17
	.word 0x8e520009  ! 3192: UMUL_R	umul 	%r8, %r9, %r7
	.word 0xc62a0009  ! 3195: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc91a0009  ! 3195: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0x10800002  ! 3195: BA	ba  	<label_0x2>
	.word 0xce320009  ! 3198: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc40a0009  ! 3198: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0x04ca0001  ! 3198: BRLEZ	brlez  ,pt	%8,<label_0xa0001>
	.word 0xfb3a0009  ! 3201: STDF_R	std	%f29, [%r9, %r8]
	.word 0xca520009  ! 3201: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0x8cfa0009  ! 3201: SDIVcc_R	sdivcc 	%r8, %r9, %r6
	.word 0xf4220009  ! 3204: STW_R	stw	%r26, [%r8 + %r9]
	.word 0xc6420009  ! 3204: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xac4a2860  ! 3204: MULX_I	mulx 	%r8, 0x0860, %r22
	.word 0xca720009  ! 3207: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xcc520009  ! 3207: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0x867a21c4  ! 3207: SDIV_I	sdiv 	%r8, 0x01c4, %r3
	.word 0xda320009  ! 3210: STH_R	sth	%r13, [%r8 + %r9]
	.word 0xcd020009  ! 3210: LDF_R	ld	[%r8, %r9], %f6
	.word 0xd88a22f0  ! 3210: LDUBA_I	lduba	[%r8, + 0x02f0] %asi, %r12
	.word 0xf8320009  ! 3213: STH_R	sth	%r28, [%r8 + %r9]
	.word 0xc6420009  ! 3213: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xc33a0009  ! 3213: STDF_R	std	%f1, [%r9, %r8]
	.word 0xf6720009  ! 3216: STX_R	stx	%r27, [%r8 + %r9]
	.word 0xc8520009  ! 3216: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0x8c520009  ! 3216: UMUL_R	umul 	%r8, %r9, %r6
	.word 0xc8720009  ! 3219: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xf2020009  ! 3219: LDUW_R	lduw	[%r8 + %r9], %r25
	.word 0x88520009  ! 3219: UMUL_R	umul 	%r8, %r9, %r4
	.word 0xcf3a0009  ! 3222: STDF_R	std	%f7, [%r9, %r8]
	.word 0xf04a0009  ! 3222: LDSB_R	ldsb	[%r8 + %r9], %r24
	.word 0x0ec20001  ! 3222: BRGEZ	brgez  ,nt	%8,<label_0x20001>
	.word 0xcf3a0009  ! 3225: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc31a0009  ! 3225: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0x826a2f5c  ! 3225: UDIVX_I	udivx 	%r8, 0x0f5c, %r1
	.word 0xf0720009  ! 3228: STX_R	stx	%r24, [%r8 + %r9]
	.word 0xc51a0009  ! 3228: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0x8143e00f  ! 3228: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore 
	.word 0xcc2a0009  ! 3231: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xcf020009  ! 3231: LDF_R	ld	[%r8, %r9], %f7
	.word 0xc36a2fd8  ! 3231: PREFETCH_I	prefetch	[%r8 + 0x0fd8], #one_read
	.word 0xc5220009  ! 3234: STF_R	st	%f2, [%r9, %r8]
	.word 0xda020009  ! 3234: LDUW_R	lduw	[%r8 + %r9], %r13
	.word 0xa8da0009  ! 3234: SMULcc_R	smulcc 	%r8, %r9, %r20
	.word 0xcb3a0009  ! 3237: STDF_R	std	%f5, [%r9, %r8]
	.word 0xee5a0009  ! 3237: LDX_R	ldx	[%r8 + %r9], %r23
	.word 0x8143c000  ! 3237: STBAR	stbar
	.word 0xfe720009  ! 3240: STX_R	stx	%r31, [%r8 + %r9]
	.word 0xf24a0009  ! 3240: LDSB_R	ldsb	[%r8 + %r9], %r25
	.word 0xc3222208  ! 3240: STF_I	st	%f1, [0x0208, %r8]
	.word 0xc4720009  ! 3243: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc5020009  ! 3243: LDF_R	ld	[%r8, %r9], %f2
	.word 0x86fa2e80  ! 3243: SDIVcc_I	sdivcc 	%r8, 0x0e80, %r3
	.word 0xe6320009  ! 3246: STH_R	sth	%r19, [%r8 + %r9]
	.word 0xe0420009  ! 3246: LDSW_R	ldsw	[%r8 + %r9], %r16
	.word 0xa84a2584  ! 3246: MULX_I	mulx 	%r8, 0x0584, %r20
	.word 0xc62a0009  ! 3249: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc6120009  ! 3249: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xb24a0009  ! 3249: MULX_R	mulx 	%r8, %r9, %r25
	.word 0xcc2a0009  ! 3252: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc41a0009  ! 3252: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x2e800001  ! 3252: BVS	bvs,a	<label_0x1>
	.word 0xcb220009  ! 3255: STF_R	st	%f5, [%r9, %r8]
	.word 0xec4a0009  ! 3255: LDSB_R	ldsb	[%r8 + %r9], %r22
	.word 0xa32221c8  ! 3255: MULScc_I	mulscc 	%r8, 0x01c8, %r17
	.word 0xc6720009  ! 3258: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xce0a0009  ! 3258: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xc60a2f3c  ! 3258: LDUB_I	ldub	[%r8 + 0x0f3c], %r3
	.word 0xe2320009  ! 3261: STH_R	sth	%r17, [%r8 + %r9]
	.word 0xce520009  ! 3261: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xef3a2020  ! 3261: STDF_I	std	%f23, [0x0020, %r8]
	.word 0xc5220009  ! 3264: STF_R	st	%f2, [%r9, %r8]
	.word 0xc2420009  ! 3264: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xd8f21009  ! 3264: STXA_R	stxa	%r12, [%r8 + %r9] 0x80
	.word 0xe02a0009  ! 3267: STB_R	stb	%r16, [%r8 + %r9]
	.word 0xc91a0009  ! 3267: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xc36a0009  ! 3267: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xe9220009  ! 3270: STF_R	st	%f20, [%r9, %r8]
	.word 0xfe120009  ! 3270: LDUH_R	lduh	[%r8 + %r9], %r31
	.word 0xb4d20009  ! 3270: UMULcc_R	umulcc 	%r8, %r9, %r26
	.word 0xea220009  ! 3273: STW_R	stw	%r21, [%r8 + %r9]
	.word 0xc01a0009  ! 3273: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0xfe120009  ! 3273: LDUH_R	lduh	[%r8 + %r9], %r31
	.word 0xc42a0009  ! 3276: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xea120009  ! 3276: LDUH_R	lduh	[%r8 + %r9], %r21
	.word 0xa5a20929  ! 3276: FMULs	fmuls	%f8, %f9, %f18
	.word 0xc2320009  ! 3279: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc31a0009  ! 3279: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xc4c21009  ! 3279: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r2
	.word 0xc2320009  ! 3282: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc6020009  ! 3282: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0x8a722ea8  ! 3282: UDIV_I	udiv 	%r8, 0x0ea8, %r5
	.word 0xcd220009  ! 3285: STF_R	st	%f6, [%r9, %r8]
	.word 0xcf1a0009  ! 3285: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xa24a0009  ! 3285: MULX_R	mulx 	%r8, %r9, %r17
	.word 0xca720009  ! 3288: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xcc120009  ! 3288: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xe06a2de8  ! 3288: LDSTUB_I	ldstub	%r16, [%r8 + 0x0de8]
	.word 0xdd3a0009  ! 3291: STDF_R	std	%f14, [%r9, %r8]
	.word 0xcc4a0009  ! 3291: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0x867a0009  ! 3291: SDIV_R	sdiv 	%r8, %r9, %r3
	.word 0xc8720009  ! 3294: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc8420009  ! 3294: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0x8143c000  ! 3294: STBAR	stbar
	.word 0xc2220009  ! 3297: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xca020009  ! 3297: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0x08800002  ! 3297: BLEU	bleu  	<label_0x2>
	.word 0xc4720009  ! 3300: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xfa520009  ! 3300: LDSH_R	ldsh	[%r8 + %r9], %r29
	.word 0x8143c000  ! 3300: STBAR	stbar
	.word 0xcf3a0009  ! 3303: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc6120009  ! 3303: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xe4b226c0  ! 3303: STHA_I	stha	%r18, [%r8 + 0x06c0] %asi
	.word 0xd82a0009  ! 3306: STB_R	stb	%r12, [%r8 + %r9]
	.word 0xcc5a0009  ! 3306: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xd85a2748  ! 3306: LDX_I	ldx	[%r8 + 0x0748], %r12
	.word 0xc2720009  ! 3309: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc6420009  ! 3309: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0x8143c000  ! 3309: STBAR	stbar
	.word 0xfb220009  ! 3312: STF_R	st	%f29, [%r9, %r8]
	.word 0xc8520009  ! 3312: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0x864a2cc0  ! 3312: MULX_I	mulx 	%r8, 0x0cc0, %r3
	.word 0xc7220009  ! 3315: STF_R	st	%f3, [%r9, %r8]
	.word 0xcc4a0009  ! 3315: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xc36a200c  ! 3315: PREFETCH_I	prefetch	[%r8 + 0x000c], #one_read
	.word 0xf0220009  ! 3318: STW_R	stw	%r24, [%r8 + %r9]
	.word 0xcb020009  ! 3318: LDF_R	ld	[%r8, %r9], %f5
	.word 0xc36a0009  ! 3318: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xce220009  ! 3321: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xcd1a0009  ! 3321: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xc36a20fc  ! 3321: PREFETCH_I	prefetch	[%r8 + 0x00fc], #one_read
	.word 0xc8220009  ! 3324: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xca520009  ! 3324: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xc3ea1009  ! 3324: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xe8220009  ! 3327: STW_R	stw	%r20, [%r8 + %r9]
	.word 0xca020009  ! 3327: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xc6fa1009  ! 3327: SWAPA_R	swapa	%r3, [%r8 + %r9] 0x80
	.word 0xca320009  ! 3330: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xd60a0009  ! 3330: LDUB_R	ldub	[%r8 + %r9], %r11
	.word 0xceea1009  ! 3330: LDSTUBA_R	ldstuba	%r7, [%r8 + %r9] 0x80
	.word 0xce220009  ! 3333: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc85a0009  ! 3333: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xc3ea1009  ! 3333: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc62a0009  ! 3336: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xe0120009  ! 3336: LDUH_R	lduh	[%r8 + %r9], %r16
	.word 0xe09a1009  ! 3336: LDDA_R	ldda	[%r8, %r9] 0x80, %r16
	.word 0xc9220009  ! 3339: STF_R	st	%f4, [%r9, %r8]
	.word 0xda120009  ! 3339: LDUH_R	lduh	[%r8 + %r9], %r13
	.word 0x86722d30  ! 3339: UDIV_I	udiv 	%r8, 0x0d30, %r3
	.word 0xce720009  ! 3342: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc5020009  ! 3342: LDF_R	ld	[%r8, %r9], %f2
	.word 0xc28a1009  ! 3342: LDUBA_R	lduba	[%r8, %r9] 0x80, %r1
	.word 0xcd3a0009  ! 3345: STDF_R	std	%f6, [%r9, %r8]
	.word 0xf2120009  ! 3345: LDUH_R	lduh	[%r8 + %r9], %r25
	.word 0xf67a0009  ! 3345: SWAP_R	swap	%r27, [%r8 + %r9]
	.word 0xf62a0009  ! 3348: STB_R	stb	%r27, [%r8 + %r9]
	.word 0xce120009  ! 3348: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0x8143c000  ! 3348: STBAR	stbar
	.word 0xcb220009  ! 3351: STF_R	st	%f5, [%r9, %r8]
	.word 0xe24a0009  ! 3351: LDSB_R	ldsb	[%r8 + %r9], %r17
	.word 0x83a20929  ! 3351: FMULs	fmuls	%f8, %f9, %f1
	.word 0xf53a0009  ! 3354: STDF_R	std	%f26, [%r9, %r8]
	.word 0xc8020009  ! 3354: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xc3ea23f0  ! 3354: PREFETCHA_I	prefetcha	[%r8, + 0x03f0] %asi, #one_read
	.word 0xec720009  ! 3357: STX_R	stx	%r22, [%r8 + %r9]
	.word 0xcb1a0009  ! 3357: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xcaa21009  ! 3357: STWA_R	stwa	%r5, [%r8 + %r9] 0x80
	.word 0xda2a0009  ! 3360: STB_R	stb	%r13, [%r8 + %r9]
	.word 0xc85a0009  ! 3360: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0x8f220009  ! 3360: MULScc_R	mulscc 	%r8, %r9, %r7
	.word 0xca320009  ! 3363: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc41a0009  ! 3363: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x866a297c  ! 3363: UDIVX_I	udivx 	%r8, 0x097c, %r3
	.word 0xc73a0009  ! 3366: STDF_R	std	%f3, [%r9, %r8]
	.word 0xca0a0009  ! 3366: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0x24800002  ! 3366: BLE	ble,a	<label_0x2>
	.word 0xf2220009  ! 3369: STW_R	stw	%r25, [%r8 + %r9]
	.word 0xc6520009  ! 3369: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xaa7225f4  ! 3369: UDIV_I	udiv 	%r8, 0x05f4, %r21
	.word 0xea220009  ! 3372: STW_R	stw	%r21, [%r8 + %r9]
	.word 0xfb1a0009  ! 3372: LDDF_R	ldd	[%r8, %r9], %f29
	.word 0xc36a0009  ! 3372: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc9220009  ! 3375: STF_R	st	%f4, [%r9, %r8]
	.word 0xdd1a0009  ! 3375: LDDF_R	ldd	[%r8, %r9], %f14
	.word 0xe87a270c  ! 3375: SWAP_I	swap	%r20, [%r8 + 0x070c]
	.word 0xc9220009  ! 3378: STF_R	st	%f4, [%r9, %r8]
	.word 0xc20a0009  ! 3378: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xc3ea2aa0  ! 3378: PREFETCHA_I	prefetcha	[%r8, + 0x0aa0] %asi, #one_read
	.word 0xee720009  ! 3381: STX_R	stx	%r23, [%r8 + %r9]
	.word 0xce120009  ! 3381: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xe4ba2880  ! 3381: STDA_I	stda	%r18, [%r8 + 0x0880] %asi
	.word 0xc42a0009  ! 3384: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc25a0009  ! 3384: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xc4f22fd0  ! 3384: STXA_I	stxa	%r2, [%r8 + 0x0fd0] %asi
	.word 0xe82a0009  ! 3387: STB_R	stb	%r20, [%r8 + %r9]
	.word 0xf81a0009  ! 3387: LDD_R	ldd	[%r8 + %r9], %r28
	.word 0xc48a1009  ! 3387: LDUBA_R	lduba	[%r8, %r9] 0x80, %r2
	.word 0xe02a0009  ! 3390: STB_R	stb	%r16, [%r8 + %r9]
	.word 0xd8420009  ! 3390: LDSW_R	ldsw	[%r8 + %r9], %r12
	.word 0x26ca0001  ! 3390: BRLZ	brlz,a,pt	%8,<label_0xa0001>
	.word 0xf93a0009  ! 3393: STDF_R	std	%f28, [%r9, %r8]
	.word 0xd64a0009  ! 3393: LDSB_R	ldsb	[%r8 + %r9], %r11
	.word 0x87a20829  ! 3393: FADDs	fadds	%f8, %f9, %f3
	.word 0xcb3a0009  ! 3396: STDF_R	std	%f5, [%r9, %r8]
	.word 0xec4a0009  ! 3396: LDSB_R	ldsb	[%r8 + %r9], %r22
	.word 0xcac21009  ! 3396: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r5
	.word 0xce2a0009  ! 3399: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xe44a0009  ! 3399: LDSB_R	ldsb	[%r8 + %r9], %r18
	.word 0xe0922484  ! 3399: LDUHA_I	lduha	[%r8, + 0x0484] %asi, %r16
	.word 0xc6320009  ! 3402: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xca5a0009  ! 3402: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xc85a0009  ! 3402: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xe0220009  ! 3405: STW_R	stw	%r16, [%r8 + %r9]
	.word 0xc4120009  ! 3405: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0x8143c000  ! 3405: STBAR	stbar
	.word 0xc3220009  ! 3408: STF_R	st	%f1, [%r9, %r8]
	.word 0xea5a0009  ! 3408: LDX_R	ldx	[%r8 + %r9], %r21
	.word 0x9fa20829  ! 3408: FADDs	fadds	%f8, %f9, %f15
	.word 0xcc320009  ! 3411: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc25a0009  ! 3411: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xc33a2c78  ! 3411: STDF_I	std	%f1, [0x0c78, %r8]
	.word 0xcf3a0009  ! 3414: STDF_R	std	%f7, [%r9, %r8]
	.word 0xcd020009  ! 3414: LDF_R	ld	[%r8, %r9], %f6
	.word 0x8b222edc  ! 3414: MULScc_I	mulscc 	%r8, 0x0edc, %r5
	.word 0xcb220009  ! 3417: STF_R	st	%f5, [%r9, %r8]
	.word 0xcf1a0009  ! 3417: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xcaf21009  ! 3417: STXA_R	stxa	%r5, [%r8 + %r9] 0x80
	.word 0xe1220009  ! 3420: STF_R	st	%f16, [%r9, %r8]
	.word 0xc2120009  ! 3420: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0x8143e028  ! 3420: MEMBAR	membar	#StoreStore | #MemIssue 
	.word 0xc4320009  ! 3423: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xce420009  ! 3423: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0x16800002  ! 3423: BGE	bge  	<label_0x2>
	.word 0xfa720009  ! 3426: STX_R	stx	%r29, [%r8 + %r9]
	.word 0xc81a0009  ! 3426: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xcc4a28d4  ! 3426: LDSB_I	ldsb	[%r8 + 0x08d4], %r6
	.word 0xca320009  ! 3429: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc40a0009  ! 3429: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0x8143e039  ! 3429: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside | #MemIssue 
	.word 0xc6220009  ! 3432: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc20a0009  ! 3432: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0x8143c000  ! 3432: STBAR	stbar
	.word 0xc42a0009  ! 3435: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xf65a0009  ! 3435: LDX_R	ldx	[%r8 + %r9], %r27
	.word 0x8cfa2778  ! 3435: SDIVcc_I	sdivcc 	%r8, 0x0778, %r6
	.word 0xea720009  ! 3438: STX_R	stx	%r21, [%r8 + %r9]
	.word 0xcb1a0009  ! 3438: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0x84d22cf4  ! 3438: UMULcc_I	umulcc 	%r8, 0x0cf4, %r2
	.word 0xc4220009  ! 3441: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xfa0a0009  ! 3441: LDUB_R	ldub	[%r8 + %r9], %r29
	.word 0xb66a20dc  ! 3441: UDIVX_I	udivx 	%r8, 0x00dc, %r27
	.word 0xc82a0009  ! 3444: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xca4a0009  ! 3444: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xc6fa2aac  ! 3444: SWAPA_I	swapa	%r3, [%r8 + 0x0aac] %asi
	.word 0xcf220009  ! 3447: STF_R	st	%f7, [%r9, %r8]
	.word 0xc8420009  ! 3447: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xc40a0009  ! 3447: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xc6320009  ! 3450: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc6520009  ! 3450: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0x06ca0001  ! 3450: BRLZ	brlz  ,pt	%8,<label_0xa0001>
	.word 0xf62a0009  ! 3453: STB_R	stb	%r27, [%r8 + %r9]
	.word 0xcc1a0009  ! 3453: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xbc7a0009  ! 3453: SDIV_R	sdiv 	%r8, %r9, %r30
	.word 0xc4720009  ! 3456: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc81a0009  ! 3456: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x844a29d4  ! 3456: MULX_I	mulx 	%r8, 0x09d4, %r2
	.word 0xc4220009  ! 3459: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xf60a0009  ! 3459: LDUB_R	ldub	[%r8 + %r9], %r27
	.word 0x8a7a2dd8  ! 3459: SDIV_I	sdiv 	%r8, 0x0dd8, %r5
	.word 0xca220009  ! 3462: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc71a0009  ! 3462: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xa3a20829  ! 3462: FADDs	fadds	%f8, %f9, %f17
	.word 0xc6320009  ! 3465: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc2020009  ! 3465: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0x8da209a9  ! 3465: FDIVs	fdivs	%f8, %f9, %f6
	.word 0xcb3a0009  ! 3468: STDF_R	std	%f5, [%r9, %r8]
	.word 0xc8020009  ! 3468: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0x85a20929  ! 3468: FMULs	fmuls	%f8, %f9, %f2
	.word 0xc9220009  ! 3471: STF_R	st	%f4, [%r9, %r8]
	.word 0xc5020009  ! 3471: LDF_R	ld	[%r8, %r9], %f2
	.word 0x84da27b4  ! 3471: SMULcc_I	smulcc 	%r8, 0x07b4, %r2
	.word 0xc5220009  ! 3474: STF_R	st	%f2, [%r9, %r8]
	.word 0xea4a0009  ! 3474: LDSB_R	ldsb	[%r8 + %r9], %r21
	.word 0x8143c000  ! 3474: STBAR	stbar
	.word 0xe0720009  ! 3477: STX_R	stx	%r16, [%r8 + %r9]
	.word 0xc81a0009  ! 3477: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x02ca0001  ! 3477: BRZ	brz  ,pt	%8,<label_0xa0001>
	.word 0xc8720009  ! 3480: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xfa120009  ! 3480: LDUH_R	lduh	[%r8 + %r9], %r29
	.word 0xc7e21009  ! 3480: CASA_I	casa	[%r8] 0x80, %r9, %r3
	.word 0xc5220009  ! 3483: STF_R	st	%f2, [%r9, %r8]
	.word 0xfe0a0009  ! 3483: LDUB_R	ldub	[%r8 + %r9], %r31
	.word 0xab6a22c4  ! 3483: SDIVX_I	sdivx	%r8, 0x02c4, %r21
	.word 0xce320009  ! 3486: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc8120009  ! 3486: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xf6022e94  ! 3486: LDUW_I	lduw	[%r8 + 0x0e94], %r27
	.word 0xd8320009  ! 3489: STH_R	sth	%r12, [%r8 + %r9]
	.word 0xe4120009  ! 3489: LDUH_R	lduh	[%r8 + %r9], %r18
	.word 0xa65a2144  ! 3489: SMUL_I	smul 	%r8, 0x0144, %r19
	.word 0xc3220009  ! 3492: STF_R	st	%f1, [%r9, %r8]
	.word 0xc4520009  ! 3492: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xc53a2cc8  ! 3492: STDF_I	std	%f2, [0x0cc8, %r8]
	.word 0xcf3a0009  ! 3495: STDF_R	std	%f7, [%r9, %r8]
	.word 0xd8020009  ! 3495: LDUW_R	lduw	[%r8 + %r9], %r12
	.word 0xa2d20009  ! 3495: UMULcc_R	umulcc 	%r8, %r9, %r17
	.word 0xce320009  ! 3498: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc4520009  ! 3498: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xb16a2b18  ! 3498: SDIVX_I	sdivx	%r8, 0x0b18, %r24
	.word 0xcd3a0009  ! 3501: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc84a0009  ! 3501: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xd8ba2c00  ! 3501: STDA_I	stda	%r12, [%r8 + 0x0c00] %asi
	.word 0xc2320009  ! 3504: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xd80a0009  ! 3504: LDUB_R	ldub	[%r8 + %r9], %r12
	.word 0xcde22009  ! 3504: CASA_R	casa	[%r8] %asi, %r9, %r6
	.word 0xe7220009  ! 3507: STF_R	st	%f19, [%r9, %r8]
	.word 0xca420009  ! 3507: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xce5229f0  ! 3507: LDSH_I	ldsh	[%r8 + 0x09f0], %r7
	.word 0xf0220009  ! 3510: STW_R	stw	%r24, [%r8 + %r9]
	.word 0xc64a0009  ! 3510: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xc33a0009  ! 3510: STDF_R	std	%f1, [%r9, %r8]
	.word 0xdf3a0009  ! 3513: STDF_R	std	%f15, [%r9, %r8]
	.word 0xf91a0009  ! 3513: LDDF_R	ldd	[%r8, %r9], %f28
	.word 0xc7220009  ! 3513: STF_R	st	%f3, [%r9, %r8]
	.word 0xc22a0009  ! 3516: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xce0a0009  ! 3516: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xc8da2578  ! 3516: LDXA_I	ldxa	[%r8, + 0x0578] %asi, %r4
	.word 0xca220009  ! 3519: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xf6420009  ! 3519: LDSW_R	ldsw	[%r8 + %r9], %r27
	.word 0x85a209a9  ! 3519: FDIVs	fdivs	%f8, %f9, %f2
	.word 0xc5220009  ! 3522: STF_R	st	%f2, [%r9, %r8]
	.word 0xc2420009  ! 3522: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0x86f20009  ! 3522: UDIVcc_R	udivcc 	%r8, %r9, %r3
	.word 0xcd3a0009  ! 3525: STDF_R	std	%f6, [%r9, %r8]
	.word 0xcb020009  ! 3525: LDF_R	ld	[%r8, %r9], %f5
	.word 0xc8922a24  ! 3525: LDUHA_I	lduha	[%r8, + 0x0a24] %asi, %r4
	.word 0xea220009  ! 3528: STW_R	stw	%r21, [%r8 + %r9]
	.word 0xf31a0009  ! 3528: LDDF_R	ldd	[%r8, %r9], %f25
	.word 0x0a800002  ! 3528: BCS	bcs  	<label_0x2>
	.word 0xc7220009  ! 3531: STF_R	st	%f3, [%r9, %r8]
	.word 0xc2420009  ! 3531: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xce921009  ! 3531: LDUHA_R	lduha	[%r8, %r9] 0x80, %r7
	.word 0xd6320009  ! 3534: STH_R	sth	%r11, [%r8 + %r9]
	.word 0xcc020009  ! 3534: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xa9a20929  ! 3534: FMULs	fmuls	%f8, %f9, %f20
	.word 0xfe2a0009  ! 3537: STB_R	stb	%r31, [%r8 + %r9]
	.word 0xc44a0009  ! 3537: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0x8143c000  ! 3537: STBAR	stbar
	.word 0xc82a0009  ! 3540: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xcc4a0009  ! 3540: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xfa520009  ! 3540: LDSH_R	ldsh	[%r8 + %r9], %r29
	.word 0xe33a0009  ! 3543: STDF_R	std	%f17, [%r9, %r8]
	.word 0xcd020009  ! 3543: LDF_R	ld	[%r8, %r9], %f6
	.word 0xc33a2860  ! 3543: STDF_I	std	%f1, [0x0860, %r8]
	.word 0xc6220009  ! 3546: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xce020009  ! 3546: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xc3ea2778  ! 3546: PREFETCHA_I	prefetcha	[%r8, + 0x0778] %asi, #one_read
	.word 0xc3220009  ! 3549: STF_R	st	%f1, [%r9, %r8]
	.word 0xc64a0009  ! 3549: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xc36a0009  ! 3549: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xd62a0009  ! 3552: STB_R	stb	%r11, [%r8 + %r9]
	.word 0xd84a0009  ! 3552: LDSB_R	ldsb	[%r8 + %r9], %r12
	.word 0xceda1009  ! 3552: LDXA_R	ldxa	[%r8, %r9] 0x80, %r7
	.word 0xc8720009  ! 3555: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc84a0009  ! 3555: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0x8143e040  ! 3555: MEMBAR	membar	#Sync 
	.word 0xc42a0009  ! 3558: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc51a0009  ! 3558: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0x0ec20001  ! 3558: BRGEZ	brgez  ,nt	%8,<label_0x20001>
	.word 0xf6220009  ! 3561: STW_R	stw	%r27, [%r8 + %r9]
	.word 0xda5a0009  ! 3561: LDX_R	ldx	[%r8 + %r9], %r13
	.word 0xceda2c88  ! 3561: LDXA_I	ldxa	[%r8, + 0x0c88] %asi, %r7
	.word 0xc8720009  ! 3564: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xde5a0009  ! 3564: LDX_R	ldx	[%r8 + %r9], %r15
	.word 0xc2a21009  ! 3564: STWA_R	stwa	%r1, [%r8 + %r9] 0x80
	.word 0xc5220009  ! 3567: STF_R	st	%f2, [%r9, %r8]
	.word 0xfb020009  ! 3567: LDF_R	ld	[%r8, %r9], %f29
	.word 0xc3ea1009  ! 3567: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xcc2a0009  ! 3570: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc3020009  ! 3570: LDF_R	ld	[%r8, %r9], %f1
	.word 0x24800002  ! 3570: BLE	ble,a	<label_0x2>
	.word 0xc33a0009  ! 3573: STDF_R	std	%f1, [%r9, %r8]
	.word 0xfa120009  ! 3573: LDUH_R	lduh	[%r8 + %r9], %r29
	.word 0x84fa2f68  ! 3573: SDIVcc_I	sdivcc 	%r8, 0x0f68, %r2
	.word 0xdc320009  ! 3576: STH_R	sth	%r14, [%r8 + %r9]
	.word 0xc44a0009  ! 3576: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xa36a0009  ! 3576: SDIVX_R	sdivx	%r8, %r9, %r17
	.word 0xef3a0009  ! 3579: STDF_R	std	%f23, [%r9, %r8]
	.word 0xe41a0009  ! 3579: LDD_R	ldd	[%r8 + %r9], %r18
	.word 0x82d220d0  ! 3579: UMULcc_I	umulcc 	%r8, 0x00d0, %r1
	.word 0xc4320009  ! 3582: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xcd1a0009  ! 3582: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xdc6a22e4  ! 3582: LDSTUB_I	ldstub	%r14, [%r8 + 0x02e4]
	.word 0xc6720009  ! 3585: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc81a0009  ! 3585: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xcb3a0009  ! 3585: STDF_R	std	%f5, [%r9, %r8]
	.word 0xe8720009  ! 3588: STX_R	stx	%r20, [%r8 + %r9]
	.word 0xc64a0009  ! 3588: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xa0da2810  ! 3588: SMULcc_I	smulcc 	%r8, 0x0810, %r16
	.word 0xed220009  ! 3591: STF_R	st	%f22, [%r9, %r8]
	.word 0xf25a0009  ! 3591: LDX_R	ldx	[%r8 + %r9], %r25
	.word 0xcada1009  ! 3591: LDXA_R	ldxa	[%r8, %r9] 0x80, %r5
	.word 0xf2720009  ! 3594: STX_R	stx	%r25, [%r8 + %r9]
	.word 0xc6520009  ! 3594: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xc3ea1009  ! 3594: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xca220009  ! 3597: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xca0a0009  ! 3597: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0x8143c000  ! 3597: STBAR	stbar
	.word 0xcc2a0009  ! 3600: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xca020009  ! 3600: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0x84d227ac  ! 3600: UMULcc_I	umulcc 	%r8, 0x07ac, %r2
	.word 0xcf3a0009  ! 3603: STDF_R	std	%f7, [%r9, %r8]
	.word 0xce020009  ! 3603: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xbc7a2974  ! 3603: SDIV_I	sdiv 	%r8, 0x0974, %r30
	.word 0xfd220009  ! 3606: STF_R	st	%f30, [%r9, %r8]
	.word 0xc31a0009  ! 3606: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xc5e22009  ! 3606: CASA_R	casa	[%r8] %asi, %r9, %r2
	.word 0xc62a0009  ! 3609: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xcc020009  ! 3609: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xceca1009  ! 3609: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r7
	.word 0xc33a0009  ! 3612: STDF_R	std	%f1, [%r9, %r8]
	.word 0xca5a0009  ! 3612: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0x867a29c8  ! 3612: SDIV_I	sdiv 	%r8, 0x09c8, %r3
	.word 0xfd220009  ! 3615: STF_R	st	%f30, [%r9, %r8]
	.word 0xcb1a0009  ! 3615: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0x8143e013  ! 3615: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside 
	.word 0xc33a0009  ! 3618: STDF_R	std	%f1, [%r9, %r8]
	.word 0xe2020009  ! 3618: LDUW_R	lduw	[%r8 + %r9], %r17
	.word 0xc73a0009  ! 3618: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc6220009  ! 3621: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xec020009  ! 3621: LDUW_R	lduw	[%r8 + %r9], %r22
	.word 0x8da20929  ! 3621: FMULs	fmuls	%f8, %f9, %f6
	.word 0xca2a0009  ! 3624: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc45a0009  ! 3624: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xf8a22300  ! 3624: STWA_I	stwa	%r28, [%r8 + 0x0300] %asi
	.word 0xce320009  ! 3627: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xf11a0009  ! 3627: LDDF_R	ldd	[%r8, %r9], %f24
	.word 0xc36a0009  ! 3627: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xce220009  ! 3630: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc2420009  ! 3630: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xc3ea1009  ! 3630: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc93a0009  ! 3633: STDF_R	std	%f4, [%r9, %r8]
	.word 0xc6020009  ! 3633: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xccba1009  ! 3633: STDA_R	stda	%r6, [%r8 + %r9] 0x80
	.word 0xcf3a0009  ! 3636: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc80a0009  ! 3636: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xf4aa1009  ! 3636: STBA_R	stba	%r26, [%r8 + %r9] 0x80
	.word 0xcc220009  ! 3639: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xce5a0009  ! 3639: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xc3ea2350  ! 3639: PREFETCHA_I	prefetcha	[%r8, + 0x0350] %asi, #one_read
	.word 0xca320009  ! 3642: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xf4420009  ! 3642: LDSW_R	ldsw	[%r8 + %r9], %r26
	.word 0x8ba209a9  ! 3642: FDIVs	fdivs	%f8, %f9, %f5
	.word 0xca320009  ! 3645: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xd8020009  ! 3645: LDUW_R	lduw	[%r8 + %r9], %r12
	.word 0xf0fa1009  ! 3645: SWAPA_R	swapa	%r24, [%r8 + %r9] 0x80
	.word 0xcf220009  ! 3648: STF_R	st	%f7, [%r9, %r8]
	.word 0xc2420009  ! 3648: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0x85a20829  ! 3648: FADDs	fadds	%f8, %f9, %f2
	.word 0xc33a0009  ! 3651: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc91a0009  ! 3651: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0x9c6a2094  ! 3651: UDIVX_I	udivx 	%r8, 0x0094, %r14
	.word 0xc8320009  ! 3654: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc2420009  ! 3654: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0x84fa2d70  ! 3654: SDIVcc_I	sdivcc 	%r8, 0x0d70, %r2
	.word 0xe0720009  ! 3657: STX_R	stx	%r16, [%r8 + %r9]
	.word 0xf4120009  ! 3657: LDUH_R	lduh	[%r8 + %r9], %r26
	.word 0xcff21009  ! 3657: CASXA_I	casxa	[%r8] 0x80, %r9, %r7
	.word 0xc6320009  ! 3660: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc01a0009  ! 3660: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0x8b220009  ! 3660: MULScc_R	mulscc 	%r8, %r9, %r5
	.word 0xc8720009  ! 3663: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc4420009  ! 3663: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xc3ea23b4  ! 3663: PREFETCHA_I	prefetcha	[%r8, + 0x03b4] %asi, #one_read
	.word 0xcb220009  ! 3666: STF_R	st	%f5, [%r9, %r8]
	.word 0xc4420009  ! 3666: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xc36a29e8  ! 3666: PREFETCH_I	prefetch	[%r8 + 0x09e8], #one_read
	.word 0xc62a0009  ! 3669: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xf2420009  ! 3669: LDSW_R	ldsw	[%r8 + %r9], %r25
	.word 0xf0fa1009  ! 3669: SWAPA_R	swapa	%r24, [%r8 + %r9] 0x80
	.word 0xcd220009  ! 3672: STF_R	st	%f6, [%r9, %r8]
	.word 0xc85a0009  ! 3672: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0x8143c000  ! 3672: STBAR	stbar
	.word 0xcf3a0009  ! 3675: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc4520009  ! 3675: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xcc9a1009  ! 3675: LDDA_R	ldda	[%r8, %r9] 0x80, %r6
	.word 0xf22a0009  ! 3678: STB_R	stb	%r25, [%r8 + %r9]
	.word 0xc25a0009  ! 3678: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xeeb21009  ! 3678: STHA_R	stha	%r23, [%r8 + %r9] 0x80
	.word 0xe7220009  ! 3681: STF_R	st	%f19, [%r9, %r8]
	.word 0xda120009  ! 3681: LDUH_R	lduh	[%r8 + %r9], %r13
	.word 0x8e7a2234  ! 3681: SDIV_I	sdiv 	%r8, 0x0234, %r7
	.word 0xc8220009  ! 3684: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xec0a0009  ! 3684: LDUB_R	ldub	[%r8 + %r9], %r22
	.word 0x9fa20829  ! 3684: FADDs	fadds	%f8, %f9, %f15
	.word 0xc4720009  ! 3687: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xd8020009  ! 3687: LDUW_R	lduw	[%r8 + %r9], %r12
	.word 0x887a0009  ! 3687: SDIV_R	sdiv 	%r8, %r9, %r4
	.word 0xc2320009  ! 3690: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xcb020009  ! 3690: LDF_R	ld	[%r8, %r9], %f5
	.word 0xc36a0009  ! 3690: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xe93a0009  ! 3693: STDF_R	std	%f20, [%r9, %r8]
	.word 0xdc420009  ! 3693: LDSW_R	ldsw	[%r8 + %r9], %r14
	.word 0x8da209a9  ! 3693: FDIVs	fdivs	%f8, %f9, %f6
	.word 0xcf220009  ! 3696: STF_R	st	%f7, [%r9, %r8]
	.word 0xc41a0009  ! 3696: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x8a4a0009  ! 3696: MULX_R	mulx 	%r8, %r9, %r5
	.word 0xcc2a0009  ! 3699: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc4020009  ! 3699: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xc3220009  ! 3699: STF_R	st	%f1, [%r9, %r8]
	.word 0xda320009  ! 3702: STH_R	sth	%r13, [%r8 + %r9]
	.word 0xcc0a0009  ! 3702: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xf2422e70  ! 3702: LDSW_I	ldsw	[%r8 + 0x0e70], %r25
	.word 0xd8720009  ! 3705: STX_R	stx	%r12, [%r8 + %r9]
	.word 0xc4520009  ! 3705: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xc3ea1009  ! 3705: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xca2a0009  ! 3708: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xed020009  ! 3708: LDF_R	ld	[%r8, %r9], %f22
	.word 0x16800002  ! 3708: BGE	bge  	<label_0x2>
	.word 0xcc720009  ! 3711: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xcc420009  ! 3711: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xacd20009  ! 3711: UMULcc_R	umulcc 	%r8, %r9, %r22
	.word 0xe02a0009  ! 3714: STB_R	stb	%r16, [%r8 + %r9]
	.word 0xc8120009  ! 3714: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0x02ca0001  ! 3714: BRZ	brz  ,pt	%8,<label_0xa0001>
	.word 0xcb220009  ! 3717: STF_R	st	%f5, [%r9, %r8]
	.word 0xce5a0009  ! 3717: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xdc92205c  ! 3717: LDUHA_I	lduha	[%r8, + 0x005c] %asi, %r14
	.word 0xfc2a0009  ! 3720: STB_R	stb	%r30, [%r8 + %r9]
	.word 0xcb020009  ! 3720: LDF_R	ld	[%r8, %r9], %f5
	.word 0xf6da1009  ! 3720: LDXA_R	ldxa	[%r8, %r9] 0x80, %r27
	.word 0xc93a0009  ! 3723: STDF_R	std	%f4, [%r9, %r8]
	.word 0xea520009  ! 3723: LDSH_R	ldsh	[%r8 + %r9], %r21
	.word 0xa1a20829  ! 3723: FADDs	fadds	%f8, %f9, %f16
	.word 0xe4320009  ! 3726: STH_R	sth	%r18, [%r8 + %r9]
	.word 0xd85a0009  ! 3726: LDX_R	ldx	[%r8 + %r9], %r12
	.word 0x8ada0009  ! 3726: SMULcc_R	smulcc 	%r8, %r9, %r5
	.word 0xca220009  ! 3729: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xce5a0009  ! 3729: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xc46a0009  ! 3729: LDSTUB_R	ldstub	%r2, [%r8 + %r9]
	.word 0xcb220009  ! 3732: STF_R	st	%f5, [%r9, %r8]
	.word 0xc6520009  ! 3732: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xc3ea28a0  ! 3732: PREFETCHA_I	prefetcha	[%r8, + 0x08a0] %asi, #one_read
	.word 0xc62a0009  ! 3735: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc40a0009  ! 3735: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0x8143e054  ! 3735: MEMBAR	membar	#LoadStore | #Lookaside | #Sync 
	.word 0xd8720009  ! 3738: STX_R	stx	%r12, [%r8 + %r9]
	.word 0xc2020009  ! 3738: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xcde21009  ! 3738: CASA_I	casa	[%r8] 0x80, %r9, %r6
	.word 0xcb220009  ! 3741: STF_R	st	%f5, [%r9, %r8]
	.word 0xc84a0009  ! 3741: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xf70226f4  ! 3741: LDF_I	ld	[%r8, 0x06f4], %f27
	.word 0xce720009  ! 3744: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc2120009  ! 3744: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0x86da0009  ! 3744: SMULcc_R	smulcc 	%r8, %r9, %r3
	.word 0xcf3a0009  ! 3747: STDF_R	std	%f7, [%r9, %r8]
	.word 0xfa120009  ! 3747: LDUH_R	lduh	[%r8 + %r9], %r29
	.word 0x8143e045  ! 3747: MEMBAR	membar	#LoadLoad | #LoadStore | #Sync 
	.word 0xcd220009  ! 3750: STF_R	st	%f6, [%r9, %r8]
	.word 0xc24a0009  ! 3750: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0x8cfa28f8  ! 3750: SDIVcc_I	sdivcc 	%r8, 0x08f8, %r6
	.word 0xde720009  ! 3753: STX_R	stx	%r15, [%r8 + %r9]
	.word 0xf85a0009  ! 3753: LDX_R	ldx	[%r8 + %r9], %r28
	.word 0xeafa23e0  ! 3753: SWAPA_I	swapa	%r21, [%r8 + 0x03e0] %asi
	.word 0xc8720009  ! 3756: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc45a0009  ! 3756: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0x8143e07a  ! 3756: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xcd3a0009  ! 3759: STDF_R	std	%f6, [%r9, %r8]
	.word 0xce0a0009  ! 3759: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xd8ea1009  ! 3759: LDSTUBA_R	ldstuba	%r12, [%r8 + %r9] 0x80
	.word 0xc33a0009  ! 3762: STDF_R	std	%f1, [%r9, %r8]
	.word 0xcc420009  ! 3762: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0x87a208a9  ! 3762: FSUBs	fsubs	%f8, %f9, %f3
	.word 0xce720009  ! 3765: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xca020009  ! 3765: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xcde22009  ! 3765: CASA_R	casa	[%r8] %asi, %r9, %r6
	.word 0xee220009  ! 3768: STW_R	stw	%r23, [%r8 + %r9]
	.word 0xc81a0009  ! 3768: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xccfa1009  ! 3768: SWAPA_R	swapa	%r6, [%r8 + %r9] 0x80
	.word 0xf2320009  ! 3771: STH_R	sth	%r25, [%r8 + %r9]
	.word 0xcd1a0009  ! 3771: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0x8143e05e  ! 3771: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0xf2320009  ! 3774: STH_R	sth	%r25, [%r8 + %r9]
	.word 0xf04a0009  ! 3774: LDSB_R	ldsb	[%r8 + %r9], %r24
	.word 0x8c7a0009  ! 3774: SDIV_R	sdiv 	%r8, %r9, %r6
	.word 0xc6320009  ! 3777: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc84a0009  ! 3777: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xceca1009  ! 3777: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r7
	.word 0xe6220009  ! 3780: STW_R	stw	%r19, [%r8 + %r9]
	.word 0xcd020009  ! 3780: LDF_R	ld	[%r8, %r9], %f6
	.word 0xc67a0009  ! 3780: SWAP_R	swap	%r3, [%r8 + %r9]
	.word 0xc6720009  ! 3783: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xcd1a0009  ! 3783: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xccfa1009  ! 3783: SWAPA_R	swapa	%r6, [%r8 + %r9] 0x80
	.word 0xc5220009  ! 3786: STF_R	st	%f2, [%r9, %r8]
	.word 0xc64a0009  ! 3786: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xdb3a25c8  ! 3786: STDF_I	std	%f13, [0x05c8, %r8]
	.word 0xca2a0009  ! 3789: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xf0020009  ! 3789: LDUW_R	lduw	[%r8 + %r9], %r24
	.word 0xc8da2b88  ! 3789: LDXA_I	ldxa	[%r8, + 0x0b88] %asi, %r4
	.word 0xfe220009  ! 3792: STW_R	stw	%r31, [%r8 + %r9]
	.word 0xca0a0009  ! 3792: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xce5a0009  ! 3792: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xc7220009  ! 3795: STF_R	st	%f3, [%r9, %r8]
	.word 0xc40a0009  ! 3795: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0x844a0009  ! 3795: MULX_R	mulx 	%r8, %r9, %r2
	.word 0xd9220009  ! 3798: STF_R	st	%f12, [%r9, %r8]
	.word 0xe2120009  ! 3798: LDUH_R	lduh	[%r8 + %r9], %r17
	.word 0xa8720009  ! 3798: UDIV_R	udiv 	%r8, %r9, %r20
	.word 0xc8720009  ! 3801: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc71a0009  ! 3801: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xbc7a212c  ! 3801: SDIV_I	sdiv 	%r8, 0x012c, %r30
	.word 0xef220009  ! 3804: STF_R	st	%f23, [%r9, %r8]
	.word 0xc4120009  ! 3804: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xc6822358  ! 3804: LDUWA_I	lduwa	[%r8, + 0x0358] %asi, %r3
	.word 0xfa320009  ! 3807: STH_R	sth	%r29, [%r8 + %r9]
	.word 0xd64a0009  ! 3807: LDSB_R	ldsb	[%r8 + %r9], %r11
	.word 0x8a520009  ! 3807: UMUL_R	umul 	%r8, %r9, %r5
	.word 0xce2a0009  ! 3810: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xd65a0009  ! 3810: LDX_R	ldx	[%r8 + %r9], %r11
	.word 0xc36a2138  ! 3810: PREFETCH_I	prefetch	[%r8 + 0x0138], #one_read
	.word 0xc93a0009  ! 3813: STDF_R	std	%f4, [%r9, %r8]
	.word 0xfd020009  ! 3813: LDF_R	ld	[%r8, %r9], %f30
	.word 0xdf3a0009  ! 3813: STDF_R	std	%f15, [%r9, %r8]
	.word 0xef3a0009  ! 3816: STDF_R	std	%f23, [%r9, %r8]
	.word 0xf9020009  ! 3816: LDF_R	ld	[%r8, %r9], %f28
	.word 0x26800002  ! 3816: BL	bl,a	<label_0x2>
	.word 0xcd3a0009  ! 3819: STDF_R	std	%f6, [%r9, %r8]
	.word 0xce0a0009  ! 3819: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0x87220009  ! 3819: MULScc_R	mulscc 	%r8, %r9, %r3
	.word 0xcc220009  ! 3822: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xca0a0009  ! 3822: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0x84520009  ! 3822: UMUL_R	umul 	%r8, %r9, %r2
	.word 0xc4720009  ! 3825: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xe11a0009  ! 3825: LDDF_R	ldd	[%r8, %r9], %f16
	.word 0xf0ea29f0  ! 3825: LDSTUBA_I	ldstuba	%r24, [%r8 + 0x09f0] %asi
	.word 0xe2320009  ! 3828: STH_R	sth	%r17, [%r8 + %r9]
	.word 0xf0520009  ! 3828: LDSH_R	ldsh	[%r8 + %r9], %r24
	.word 0xc4b21009  ! 3828: STHA_R	stha	%r2, [%r8 + %r9] 0x80
	.word 0xf7220009  ! 3831: STF_R	st	%f27, [%r9, %r8]
	.word 0xcb020009  ! 3831: LDF_R	ld	[%r8, %r9], %f5
	.word 0x84fa0009  ! 3831: SDIVcc_R	sdivcc 	%r8, %r9, %r2
	.word 0xcb220009  ! 3834: STF_R	st	%f5, [%r9, %r8]
	.word 0xc2020009  ! 3834: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0x8143e01b  ! 3834: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Lookaside 
	.word 0xc8320009  ! 3837: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xca020009  ! 3837: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xc3ea1009  ! 3837: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc22a0009  ! 3840: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xd65a0009  ! 3840: LDX_R	ldx	[%r8 + %r9], %r11
	.word 0x8143e01b  ! 3840: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Lookaside 
	.word 0xeb3a0009  ! 3843: STDF_R	std	%f21, [%r9, %r8]
	.word 0xce520009  ! 3843: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xc36a0009  ! 3843: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xcd3a0009  ! 3846: STDF_R	std	%f6, [%r9, %r8]
	.word 0xd6120009  ! 3846: LDUH_R	lduh	[%r8 + %r9], %r11
	.word 0x8b222ab0  ! 3846: MULScc_I	mulscc 	%r8, 0x0ab0, %r5
	.word 0xf0720009  ! 3849: STX_R	stx	%r24, [%r8 + %r9]
	.word 0xd65a0009  ! 3849: LDX_R	ldx	[%r8 + %r9], %r11
	.word 0x8cd22f70  ! 3849: UMULcc_I	umulcc 	%r8, 0x0f70, %r6
	.word 0xca720009  ! 3852: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc41a0009  ! 3852: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xdc4a2b2c  ! 3852: LDSB_I	ldsb	[%r8 + 0x0b2c], %r14
	.word 0xc4220009  ! 3855: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc25a0009  ! 3855: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xcef226e0  ! 3855: STXA_I	stxa	%r7, [%r8 + 0x06e0] %asi
	.word 0xcd220009  ! 3858: STF_R	st	%f6, [%r9, %r8]
	.word 0xec5a0009  ! 3858: LDX_R	ldx	[%r8 + %r9], %r22
	.word 0x8cd22a50  ! 3858: UMULcc_I	umulcc 	%r8, 0x0a50, %r6
	.word 0xce220009  ! 3861: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc4120009  ! 3861: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0x9da20929  ! 3861: FMULs	fmuls	%f8, %f9, %f14
	.word 0xc5220009  ! 3864: STF_R	st	%f2, [%r9, %r8]
	.word 0xc51a0009  ! 3864: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0x9c520009  ! 3864: UMUL_R	umul 	%r8, %r9, %r14
	.word 0xeb220009  ! 3867: STF_R	st	%f21, [%r9, %r8]
	.word 0xc8520009  ! 3867: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xe6f22d48  ! 3867: STXA_I	stxa	%r19, [%r8 + 0x0d48] %asi
	.word 0xcc320009  ! 3870: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xd80a0009  ! 3870: LDUB_R	ldub	[%r8 + %r9], %r12
	.word 0xc4922154  ! 3870: LDUHA_I	lduha	[%r8, + 0x0154] %asi, %r2
	.word 0xda320009  ! 3873: STH_R	sth	%r13, [%r8 + %r9]
	.word 0xdd1a0009  ! 3873: LDDF_R	ldd	[%r8, %r9], %f14
	.word 0xc6da1009  ! 3873: LDXA_R	ldxa	[%r8, %r9] 0x80, %r3
	.word 0xca720009  ! 3876: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xd85a0009  ! 3876: LDX_R	ldx	[%r8 + %r9], %r12
	.word 0xc5222af4  ! 3876: STF_I	st	%f2, [0x0af4, %r8]
	.word 0xc33a0009  ! 3879: STDF_R	std	%f1, [%r9, %r8]
	.word 0xca5a0009  ! 3879: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0x8143e05c  ! 3879: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0xcd3a0009  ! 3882: STDF_R	std	%f6, [%r9, %r8]
	.word 0xe20a0009  ! 3882: LDUB_R	ldub	[%r8 + %r9], %r17
	.word 0xccba2e68  ! 3882: STDA_I	stda	%r6, [%r8 + 0x0e68] %asi
	.word 0xc73a0009  ! 3885: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc9020009  ! 3885: LDF_R	ld	[%r8, %r9], %f4
	.word 0xc33a2c08  ! 3885: STDF_I	std	%f1, [0x0c08, %r8]
	.word 0xc9220009  ! 3888: STF_R	st	%f4, [%r9, %r8]
	.word 0xc5020009  ! 3888: LDF_R	ld	[%r8, %r9], %f2
	.word 0xc3ea1009  ! 3888: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xfa220009  ! 3891: STW_R	stw	%r29, [%r8 + %r9]
	.word 0xc65a0009  ! 3891: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0x08800002  ! 3891: BLEU	bleu  	<label_0x2>
	.word 0xc4720009  ! 3894: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xf60a0009  ! 3894: LDUB_R	ldub	[%r8 + %r9], %r27
	.word 0xc4da1009  ! 3894: LDXA_R	ldxa	[%r8, %r9] 0x80, %r2
	.word 0xcd220009  ! 3897: STF_R	st	%f6, [%r9, %r8]
	.word 0xe25a0009  ! 3897: LDX_R	ldx	[%r8 + %r9], %r17
	.word 0xc36a291c  ! 3897: PREFETCH_I	prefetch	[%r8 + 0x091c], #one_read
	.word 0xc2720009  ! 3900: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xcc1a0009  ! 3900: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xc3ea26e0  ! 3900: PREFETCHA_I	prefetcha	[%r8, + 0x06e0] %asi, #one_read
	.word 0xeb3a0009  ! 3903: STDF_R	std	%f21, [%r9, %r8]
	.word 0xc24a0009  ! 3903: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xcc7a2754  ! 3903: SWAP_I	swap	%r6, [%r8 + 0x0754]
	.word 0xc2720009  ! 3906: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xca020009  ! 3906: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0x8a4a0009  ! 3906: MULX_R	mulx 	%r8, %r9, %r5
	.word 0xcf220009  ! 3909: STF_R	st	%f7, [%r9, %r8]
	.word 0xcb020009  ! 3909: LDF_R	ld	[%r8, %r9], %f5
	.word 0xb76a0009  ! 3909: SDIVX_R	sdivx	%r8, %r9, %r27
	.word 0xf8220009  ! 3912: STW_R	stw	%r28, [%r8 + %r9]
	.word 0xc2420009  ! 3912: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0x8143e035  ! 3912: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside | #MemIssue 
	.word 0xc22a0009  ! 3915: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xca5a0009  ! 3915: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0x83a20829  ! 3915: FADDs	fadds	%f8, %f9, %f1
	.word 0xc6220009  ! 3918: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xf4520009  ! 3918: LDSH_R	ldsh	[%r8 + %r9], %r26
	.word 0xca7a0009  ! 3918: SWAP_R	swap	%r5, [%r8 + %r9]
	.word 0xfa320009  ! 3921: STH_R	sth	%r29, [%r8 + %r9]
	.word 0xee420009  ! 3921: LDSW_R	ldsw	[%r8 + %r9], %r23
	.word 0x8143c000  ! 3921: STBAR	stbar
	.word 0xc82a0009  ! 3924: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xd80a0009  ! 3924: LDUB_R	ldub	[%r8 + %r9], %r12
	.word 0x04c20001  ! 3924: BRLEZ	brlez  ,nt	%8,<label_0x20001>
	.word 0xc6720009  ! 3927: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xec1a0009  ! 3927: LDD_R	ldd	[%r8 + %r9], %r22
	.word 0x8143c000  ! 3927: STBAR	stbar
	.word 0xf8220009  ! 3930: STW_R	stw	%r28, [%r8 + %r9]
	.word 0xf1020009  ! 3930: LDF_R	ld	[%r8, %r9], %f24
	.word 0xc36a2c8c  ! 3930: PREFETCH_I	prefetch	[%r8 + 0x0c8c], #one_read
	.word 0xcd3a0009  ! 3933: STDF_R	std	%f6, [%r9, %r8]
	.word 0xce4a0009  ! 3933: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0x8143c000  ! 3933: STBAR	stbar
	.word 0xcc720009  ! 3936: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc65a0009  ! 3936: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xc7220009  ! 3936: STF_R	st	%f3, [%r9, %r8]
	.word 0xcc720009  ! 3939: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xcc420009  ! 3939: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0x8143e00e  ! 3939: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore 
	.word 0xea320009  ! 3942: STH_R	sth	%r21, [%r8 + %r9]
	.word 0xef1a0009  ! 3942: LDDF_R	ldd	[%r8, %r9], %f23
	.word 0xc7220009  ! 3942: STF_R	st	%f3, [%r9, %r8]
	.word 0xc33a0009  ! 3945: STDF_R	std	%f1, [%r9, %r8]
	.word 0xe2420009  ! 3945: LDSW_R	ldsw	[%r8 + %r9], %r17
	.word 0xa45a2b04  ! 3945: SMUL_I	smul 	%r8, 0x0b04, %r18
	.word 0xe5220009  ! 3948: STF_R	st	%f18, [%r9, %r8]
	.word 0xc60a0009  ! 3948: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0x88522934  ! 3948: UMUL_I	umul 	%r8, 0x0934, %r4
	.word 0xce2a0009  ! 3951: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc01a0009  ! 3951: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0xc28a2a74  ! 3951: LDUBA_I	lduba	[%r8, + 0x0a74] %asi, %r1
	.word 0xef220009  ! 3954: STF_R	st	%f23, [%r9, %r8]
	.word 0xc24a0009  ! 3954: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xc6aa1009  ! 3954: STBA_R	stba	%r3, [%r8 + %r9] 0x80
	.word 0xec320009  ! 3957: STH_R	sth	%r22, [%r8 + %r9]
	.word 0xc60a0009  ! 3957: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xc3ea2278  ! 3957: PREFETCHA_I	prefetcha	[%r8, + 0x0278] %asi, #one_read
	.word 0xc42a0009  ! 3960: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xcc4a0009  ! 3960: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0x827a0009  ! 3960: SDIV_R	sdiv 	%r8, %r9, %r1
	.word 0xca720009  ! 3963: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xce020009  ! 3963: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0x8143e036  ! 3963: MEMBAR	membar	#StoreLoad | #LoadStore | #Lookaside | #MemIssue 
	.word 0xde720009  ! 3966: STX_R	stx	%r15, [%r8 + %r9]
	.word 0xc64a0009  ! 3966: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xa07a20e0  ! 3966: SDIV_I	sdiv 	%r8, 0x00e0, %r16
	.word 0xda320009  ! 3969: STH_R	sth	%r13, [%r8 + %r9]
	.word 0xc8020009  ! 3969: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xc36a0009  ! 3969: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xfc220009  ! 3972: STW_R	stw	%r30, [%r8 + %r9]
	.word 0xec520009  ! 3972: LDSH_R	ldsh	[%r8 + %r9], %r22
	.word 0xc8ca1009  ! 3972: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r4
	.word 0xcd3a0009  ! 3975: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc41a0009  ! 3975: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x3c800001  ! 3975: BPOS	bpos,a	<label_0x1>
	.word 0xdc320009  ! 3978: STH_R	sth	%r14, [%r8 + %r9]
	.word 0xc4420009  ! 3978: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0x88520009  ! 3978: UMUL_R	umul 	%r8, %r9, %r4
	.word 0xc6720009  ! 3981: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xe4020009  ! 3981: LDUW_R	lduw	[%r8 + %r9], %r18
	.word 0x8f6a0009  ! 3981: SDIVX_R	sdivx	%r8, %r9, %r7
	.word 0xd73a0009  ! 3984: STDF_R	std	%f11, [%r9, %r8]
	.word 0xf4020009  ! 3984: LDUW_R	lduw	[%r8 + %r9], %r26
	.word 0x886a2540  ! 3984: UDIVX_I	udivx 	%r8, 0x0540, %r4
	.word 0xc7220009  ! 3987: STF_R	st	%f3, [%r9, %r8]
	.word 0xc64a0009  ! 3987: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xc36a2d64  ! 3987: PREFETCH_I	prefetch	[%r8 + 0x0d64], #one_read
	.word 0xfe2a0009  ! 3990: STB_R	stb	%r31, [%r8 + %r9]
	.word 0xde0a0009  ! 3990: LDUB_R	ldub	[%r8 + %r9], %r15
	.word 0xca821009  ! 3990: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r5
	.word 0xca220009  ! 3993: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xfa420009  ! 3993: LDSW_R	ldsw	[%r8 + %r9], %r29
	.word 0xc64a2bb8  ! 3993: LDSB_I	ldsb	[%r8 + 0x0bb8], %r3
	.word 0xc6220009  ! 3996: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xfd1a0009  ! 3996: LDDF_R	ldd	[%r8, %r9], %f30
	.word 0x85a20829  ! 3996: FADDs	fadds	%f8, %f9, %f2
	.word 0xdc2a0009  ! 3999: STB_R	stb	%r14, [%r8 + %r9]
	.word 0xf81a0009  ! 3999: LDD_R	ldd	[%r8 + %r9], %r28
	.word 0x8143e04e  ! 3999: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Sync 
        ta      T_GOOD_TRAP

th_main_3:
        setx  MAIN_BASE_DATA_VA, %r1, %r8
        setx  0x0000000000000e90, %g1, %r9
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
        setx  0xa3ebdb60d41597dc, %g1, %r0
        setx  0xc124f87d11c01650, %g1, %r1
        setx  0x8e0bf84ffe38a44a, %g1, %r2
        setx  0x18c081b1f6696e5c, %g1, %r3
        setx  0xf0644f6ebb9d718a, %g1, %r4
        setx  0x872e01c5958d49dd, %g1, %r5
        setx  0x051d0cb99882d72c, %g1, %r6
        setx  0x005dd6f810e18ce1, %g1, %r7
        setx  0xefd78acd5517ad67, %g1, %r10
        setx  0x3cb076207951adc9, %g1, %r11
        setx  0x17b922ff5eb9b6d1, %g1, %r12
        setx  0x70d307ea19a96cfd, %g1, %r13
        setx  0x1b4cd3bdd3304710, %g1, %r14
        setx  0x03ae3734e52377ef, %g1, %r15
        setx  0x71f11ddeb1f55ea7, %g1, %r16
        setx  0x7be27d94cb4418e4, %g1, %r17
        setx  0x46fdcd16c2a5e064, %g1, %r18
        setx  0xf6116b7a3ee283e8, %g1, %r19
        setx  0xd006665ab5e3b5b8, %g1, %r20
        setx  0x189baaeed7625ee9, %g1, %r21
        setx  0x45609c708d41b7ed, %g1, %r22
        setx  0x779aae64f72241b4, %g1, %r23
        setx  0xd9581a7a0c6b6c0f, %g1, %r24
        setx  0x5db9dcf4b5417028, %g1, %r25
        setx  0x34df23b4cfbe694a, %g1, %r26
        setx  0x9265cc517032488f, %g1, %r27
        setx  0xd0319b4267f2a22a, %g1, %r28
        setx  0xbf68fd926133733e, %g1, %r29
        setx  0xbf1ee33213002f8c, %g1, %r30
        setx  0xe6f34474d97a25f7, %g1, %r31
	.word 0xca2a0009  ! 3: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xdc1a0009  ! 3: LDD_R	ldd	[%r8 + %r9], %r14
	.word 0x89a20829  ! 3: FADDs	fadds	%f8, %f9, %f4
	.word 0xc4720009  ! 6: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xcc1a0009  ! 6: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0x18800001  ! 6: BGU	bgu  	<label_0x1>
	.word 0xca2a0009  ! 9: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xe8020009  ! 9: LDUW_R	lduw	[%r8 + %r9], %r20
	.word 0x8143e05f  ! 9: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0xe8720009  ! 12: STX_R	stx	%r20, [%r8 + %r9]
	.word 0xc6120009  ! 12: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xc36a0009  ! 12: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc6720009  ! 15: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xcd020009  ! 15: LDF_R	ld	[%r8, %r9], %f6
	.word 0xc3ea272c  ! 15: PREFETCHA_I	prefetcha	[%r8, + 0x072c] %asi, #one_read
	.word 0xee320009  ! 18: STH_R	sth	%r23, [%r8 + %r9]
	.word 0xc7020009  ! 18: LDF_R	ld	[%r8, %r9], %f3
	.word 0x8efa2010  ! 18: SDIVcc_I	sdivcc 	%r8, 0x0010, %r7
	.word 0xcb220009  ! 21: STF_R	st	%f5, [%r9, %r8]
	.word 0xc31a0009  ! 21: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xcff22009  ! 21: CASXA_R	casxa	[%r8]%asi, %r9, %r7
	.word 0xce320009  ! 24: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xe81a0009  ! 24: LDD_R	ldd	[%r8 + %r9], %r20
	.word 0xdb3a0009  ! 24: STDF_R	std	%f13, [%r9, %r8]
	.word 0xc53a0009  ! 27: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc4420009  ! 27: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xe2ea235c  ! 27: LDSTUBA_I	ldstuba	%r17, [%r8 + 0x035c] %asi
	.word 0xe8220009  ! 30: STW_R	stw	%r20, [%r8 + %r9]
	.word 0xc6420009  ! 30: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0x2cca0001  ! 30: BRGZ	brgz,a,pt	%8,<label_0xa0001>
	.word 0xcc220009  ! 33: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xf2120009  ! 33: LDUH_R	lduh	[%r8 + %r9], %r25
	.word 0xccb227dc  ! 33: STHA_I	stha	%r6, [%r8 + 0x07dc] %asi
	.word 0xc5220009  ! 36: STF_R	st	%f2, [%r9, %r8]
	.word 0xd84a0009  ! 36: LDSB_R	ldsb	[%r8 + %r9], %r12
	.word 0xc3ea1009  ! 36: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xdc720009  ! 39: STX_R	stx	%r14, [%r8 + %r9]
	.word 0xdf020009  ! 39: LDF_R	ld	[%r8, %r9], %f15
	.word 0x8143c000  ! 39: STBAR	stbar
	.word 0xe6720009  ! 42: STX_R	stx	%r19, [%r8 + %r9]
	.word 0xc45a0009  ! 42: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0x8fa208a9  ! 42: FSUBs	fsubs	%f8, %f9, %f7
	.word 0xc82a0009  ! 45: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xea5a0009  ! 45: LDX_R	ldx	[%r8 + %r9], %r21
	.word 0xc8d21009  ! 45: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r4
	.word 0xd7220009  ! 48: STF_R	st	%f11, [%r9, %r8]
	.word 0xc2020009  ! 48: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xc4ba1009  ! 48: STDA_R	stda	%r2, [%r8 + %r9] 0x80
	.word 0xce720009  ! 51: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xe9020009  ! 51: LDF_R	ld	[%r8, %r9], %f20
	.word 0xc8da2428  ! 51: LDXA_I	ldxa	[%r8, + 0x0428] %asi, %r4
	.word 0xf82a0009  ! 54: STB_R	stb	%r28, [%r8 + %r9]
	.word 0xda420009  ! 54: LDSW_R	ldsw	[%r8 + %r9], %r13
	.word 0xcca21009  ! 54: STWA_R	stwa	%r6, [%r8 + %r9] 0x80
	.word 0xc2720009  ! 57: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc45a0009  ! 57: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xc9220009  ! 57: STF_R	st	%f4, [%r9, %r8]
	.word 0xe2220009  ! 60: STW_R	stw	%r17, [%r8 + %r9]
	.word 0xce0a0009  ! 60: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xceb21009  ! 60: STHA_R	stha	%r7, [%r8 + %r9] 0x80
	.word 0xca320009  ! 63: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xe51a0009  ! 63: LDDF_R	ldd	[%r8, %r9], %f18
	.word 0xc33a0009  ! 63: STDF_R	std	%f1, [%r9, %r8]
	.word 0xef220009  ! 66: STF_R	st	%f23, [%r9, %r8]
	.word 0xc8020009  ! 66: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xc8fa2c8c  ! 66: SWAPA_I	swapa	%r4, [%r8 + 0x0c8c] %asi
	.word 0xc33a0009  ! 69: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc2420009  ! 69: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0x8143c000  ! 69: STBAR	stbar
	.word 0xc4320009  ! 72: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xf00a0009  ! 72: LDUB_R	ldub	[%r8 + %r9], %r24
	.word 0xc3ea2528  ! 72: PREFETCHA_I	prefetcha	[%r8, + 0x0528] %asi, #one_read
	.word 0xe6720009  ! 75: STX_R	stx	%r19, [%r8 + %r9]
	.word 0xc4120009  ! 75: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xca7a0009  ! 75: SWAP_R	swap	%r5, [%r8 + %r9]
	.word 0xcb220009  ! 78: STF_R	st	%f5, [%r9, %r8]
	.word 0xce0a0009  ! 78: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xc36a0009  ! 78: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xca2a0009  ! 81: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xcb020009  ! 81: LDF_R	ld	[%r8, %r9], %f5
	.word 0xc36a2480  ! 81: PREFETCH_I	prefetch	[%r8 + 0x0480], #one_read
	.word 0xce720009  ! 84: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xe6520009  ! 84: LDSH_R	ldsh	[%r8 + %r9], %r19
	.word 0x8143e020  ! 84: MEMBAR	membar	#MemIssue 
	.word 0xed3a0009  ! 87: STDF_R	std	%f22, [%r9, %r8]
	.word 0xc4020009  ! 87: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xf122240c  ! 87: STF_I	st	%f24, [0x040c, %r8]
	.word 0xce220009  ! 90: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc7020009  ! 90: LDF_R	ld	[%r8, %r9], %f3
	.word 0xc4ba1009  ! 90: STDA_R	stda	%r2, [%r8 + %r9] 0x80
	.word 0xcb220009  ! 93: STF_R	st	%f5, [%r9, %r8]
	.word 0xc2020009  ! 93: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xc8f22500  ! 93: STXA_I	stxa	%r4, [%r8 + 0x0500] %asi
	.word 0xc8720009  ! 96: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xdc420009  ! 96: LDSW_R	ldsw	[%r8 + %r9], %r14
	.word 0x8a7a2c14  ! 96: SDIV_I	sdiv 	%r8, 0x0c14, %r5
	.word 0xca720009  ! 99: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xcc5a0009  ! 99: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0x0cc20001  ! 99: BRGZ	brgz  ,nt	%8,<label_0x20001>
	.word 0xf8220009  ! 102: STW_R	stw	%r28, [%r8 + %r9]
	.word 0xc41a0009  ! 102: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x88fa0009  ! 102: SDIVcc_R	sdivcc 	%r8, %r9, %r4
	.word 0xc2720009  ! 105: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc01a0009  ! 105: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0xe9f21009  ! 105: CASXA_I	casxa	[%r8] 0x80, %r9, %r20
	.word 0xc6720009  ! 108: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc64a0009  ! 108: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xeac21009  ! 108: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r21
	.word 0xfa720009  ! 111: STX_R	stx	%r29, [%r8 + %r9]
	.word 0xc01a0009  ! 111: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0xcada1009  ! 111: LDXA_R	ldxa	[%r8, %r9] 0x80, %r5
	.word 0xcb220009  ! 114: STF_R	st	%f5, [%r9, %r8]
	.word 0xe0520009  ! 114: LDSH_R	ldsh	[%r8 + %r9], %r16
	.word 0x87a20929  ! 114: FMULs	fmuls	%f8, %f9, %f3
	.word 0xfd220009  ! 117: STF_R	st	%f30, [%r9, %r8]
	.word 0xc41a0009  ! 117: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x9efa2510  ! 117: SDIVcc_I	sdivcc 	%r8, 0x0510, %r15
	.word 0xc6220009  ! 120: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc3020009  ! 120: LDF_R	ld	[%r8, %r9], %f1
	.word 0xcca21009  ! 120: STWA_R	stwa	%r6, [%r8 + %r9] 0x80
	.word 0xc8220009  ! 123: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xd91a0009  ! 123: LDDF_R	ldd	[%r8, %r9], %f12
	.word 0xc3ea1009  ! 123: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc4220009  ! 126: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xd65a0009  ! 126: LDX_R	ldx	[%r8 + %r9], %r11
	.word 0xccea1009  ! 126: LDSTUBA_R	ldstuba	%r6, [%r8 + %r9] 0x80
	.word 0xce220009  ! 129: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xcc1a0009  ! 129: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xe6a22050  ! 129: STWA_I	stwa	%r19, [%r8 + 0x0050] %asi
	.word 0xc4220009  ! 132: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xca5a0009  ! 132: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xbd220009  ! 132: MULScc_R	mulscc 	%r8, %r9, %r30
	.word 0xc53a0009  ! 135: STDF_R	std	%f2, [%r9, %r8]
	.word 0xca120009  ! 135: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xc91a0009  ! 135: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xcd220009  ! 138: STF_R	st	%f6, [%r9, %r8]
	.word 0xc2520009  ! 138: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xcc9a2380  ! 138: LDDA_I	ldda	[%r8, + 0x0380] %asi, %r6
	.word 0xc22a0009  ! 141: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xfa520009  ! 141: LDSH_R	ldsh	[%r8 + %r9], %r29
	.word 0xf8da1009  ! 141: LDXA_R	ldxa	[%r8, %r9] 0x80, %r28
	.word 0xe3220009  ! 144: STF_R	st	%f17, [%r9, %r8]
	.word 0xce520009  ! 144: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xf0d21009  ! 144: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r24
	.word 0xfc720009  ! 147: STX_R	stx	%r30, [%r8 + %r9]
	.word 0xfd020009  ! 147: LDF_R	ld	[%r8, %r9], %f30
	.word 0x82722b7c  ! 147: UDIV_I	udiv 	%r8, 0x0b7c, %r1
	.word 0xc2220009  ! 150: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc31a0009  ! 150: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xc87a200c  ! 150: SWAP_I	swap	%r4, [%r8 + 0x000c]
	.word 0xd6720009  ! 153: STX_R	stx	%r11, [%r8 + %r9]
	.word 0xcc5a0009  ! 153: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xc3ea2dbc  ! 153: PREFETCHA_I	prefetcha	[%r8, + 0x0dbc] %asi, #one_read
	.word 0xc9220009  ! 156: STF_R	st	%f4, [%r9, %r8]
	.word 0xc6520009  ! 156: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0x2c800001  ! 156: BNEG	bneg,a	<label_0x1>
	.word 0xce2a0009  ! 159: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xd84a0009  ! 159: LDSB_R	ldsb	[%r8 + %r9], %r12
	.word 0x8143e000  ! 159: MEMBAR	membar	
	.word 0xe4220009  ! 162: STW_R	stw	%r18, [%r8 + %r9]
	.word 0xe20a0009  ! 162: LDUB_R	ldub	[%r8 + %r9], %r17
	.word 0x2aca0001  ! 162: BRNZ	brnz,a,pt	%8,<label_0xa0001>
	.word 0xc53a0009  ! 165: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc8420009  ! 165: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0x8fa208a9  ! 165: FSUBs	fsubs	%f8, %f9, %f7
	.word 0xca2a0009  ! 168: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xcb1a0009  ! 168: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xaed20009  ! 168: UMULcc_R	umulcc 	%r8, %r9, %r23
	.word 0xcc220009  ! 171: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc6020009  ! 171: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xe09a2650  ! 171: LDDA_I	ldda	[%r8, + 0x0650] %asi, %r16
	.word 0xe2220009  ! 174: STW_R	stw	%r17, [%r8 + %r9]
	.word 0xe3020009  ! 174: LDF_R	ld	[%r8, %r9], %f17
	.word 0x84f22f24  ! 174: UDIVcc_I	udivcc 	%r8, 0x0f24, %r2
	.word 0xcb220009  ! 177: STF_R	st	%f5, [%r9, %r8]
	.word 0xc5020009  ! 177: LDF_R	ld	[%r8, %r9], %f2
	.word 0xc20a2124  ! 177: LDUB_I	ldub	[%r8 + 0x0124], %r1
	.word 0xc4720009  ! 180: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xe6020009  ! 180: LDUW_R	lduw	[%r8 + %r9], %r19
	.word 0x8c5a0009  ! 180: SMUL_R	smul 	%r8, %r9, %r6
	.word 0xc82a0009  ! 183: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc91a0009  ! 183: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0x88d20009  ! 183: UMULcc_R	umulcc 	%r8, %r9, %r4
	.word 0xcc2a0009  ! 186: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xca0a0009  ! 186: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xc60a0009  ! 186: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xce720009  ! 189: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc65a0009  ! 189: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xd64a2428  ! 189: LDSB_I	ldsb	[%r8 + 0x0428], %r11
	.word 0xce220009  ! 192: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xcb020009  ! 192: LDF_R	ld	[%r8, %r9], %f5
	.word 0xa8fa0009  ! 192: SDIVcc_R	sdivcc 	%r8, %r9, %r20
	.word 0xea220009  ! 195: STW_R	stw	%r21, [%r8 + %r9]
	.word 0xc8120009  ! 195: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0x844a0009  ! 195: MULX_R	mulx 	%r8, %r9, %r2
	.word 0xca720009  ! 198: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xcc4a0009  ! 198: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0x8143e04b  ! 198: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Sync 
	.word 0xce220009  ! 201: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xe2120009  ! 201: LDUH_R	lduh	[%r8 + %r9], %r17
	.word 0x83a209a9  ! 201: FDIVs	fdivs	%f8, %f9, %f1
	.word 0xcb220009  ! 204: STF_R	st	%f5, [%r9, %r8]
	.word 0xda4a0009  ! 204: LDSB_R	ldsb	[%r8 + %r9], %r13
	.word 0xf08a2b64  ! 204: LDUBA_I	lduba	[%r8, + 0x0b64] %asi, %r24
	.word 0xce720009  ! 207: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc91a0009  ! 207: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xcf22262c  ! 207: STF_I	st	%f7, [0x062c, %r8]
	.word 0xc8320009  ! 210: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xca020009  ! 210: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xc51a2c88  ! 210: LDDF_I	ldd	[%r8, 0x0c88], %f2
	.word 0xc6320009  ! 213: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xce0a0009  ! 213: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xc36a0009  ! 213: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc22a0009  ! 216: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc4420009  ! 216: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xccca1009  ! 216: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r6
	.word 0xc53a0009  ! 219: STDF_R	std	%f2, [%r9, %r8]
	.word 0xcc5a0009  ! 219: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xcb3a2d70  ! 219: STDF_I	std	%f5, [0x0d70, %r8]
	.word 0xc9220009  ! 222: STF_R	st	%f4, [%r9, %r8]
	.word 0xc71a0009  ! 222: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0x8143e063  ! 222: MEMBAR	membar	#LoadLoad | #StoreLoad | #MemIssue | #Sync 
	.word 0xc8320009  ! 225: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc20a0009  ! 225: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xdf220009  ! 225: STF_R	st	%f15, [%r9, %r8]
	.word 0xce2a0009  ! 228: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc6420009  ! 228: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0x84522278  ! 228: UMUL_I	umul 	%r8, 0x0278, %r2
	.word 0xc93a0009  ! 231: STDF_R	std	%f4, [%r9, %r8]
	.word 0xe91a0009  ! 231: LDDF_R	ldd	[%r8, %r9], %f20
	.word 0xcc8a2c80  ! 231: LDUBA_I	lduba	[%r8, + 0x0c80] %asi, %r6
	.word 0xe2720009  ! 234: STX_R	stx	%r17, [%r8 + %r9]
	.word 0xc51a0009  ! 234: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xccb21009  ! 234: STHA_R	stha	%r6, [%r8 + %r9] 0x80
	.word 0xcb3a0009  ! 237: STDF_R	std	%f5, [%r9, %r8]
	.word 0xcc1a0009  ! 237: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0x85a20829  ! 237: FADDs	fadds	%f8, %f9, %f2
	.word 0xce2a0009  ! 240: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xda0a0009  ! 240: LDUB_R	ldub	[%r8 + %r9], %r13
	.word 0xf93a0009  ! 240: STDF_R	std	%f28, [%r9, %r8]
	.word 0xcd3a0009  ! 243: STDF_R	std	%f6, [%r9, %r8]
	.word 0xf4020009  ! 243: LDUW_R	lduw	[%r8 + %r9], %r26
	.word 0x9e4a0009  ! 243: MULX_R	mulx 	%r8, %r9, %r15
	.word 0xc4320009  ! 246: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xce020009  ! 246: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xc4fa1009  ! 246: SWAPA_R	swapa	%r2, [%r8 + %r9] 0x80
	.word 0xca220009  ! 249: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc71a0009  ! 249: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xc33a0009  ! 249: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc22a0009  ! 252: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xcc120009  ! 252: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xf8fa2d20  ! 252: SWAPA_I	swapa	%r28, [%r8 + 0x0d20] %asi
	.word 0xc8220009  ! 255: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xfa420009  ! 255: LDSW_R	ldsw	[%r8 + %r9], %r29
	.word 0x9a52229c  ! 255: UMUL_I	umul 	%r8, 0x029c, %r13
	.word 0xc82a0009  ! 258: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc7020009  ! 258: LDF_R	ld	[%r8, %r9], %f3
	.word 0xc7f22009  ! 258: CASXA_R	casxa	[%r8]%asi, %r9, %r3
	.word 0xc7220009  ! 261: STF_R	st	%f3, [%r9, %r8]
	.word 0xc85a0009  ! 261: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xf412287c  ! 261: LDUH_I	lduh	[%r8 + 0x087c], %r26
	.word 0xde320009  ! 264: STH_R	sth	%r15, [%r8 + %r9]
	.word 0xc20a0009  ! 264: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xc36a2658  ! 264: PREFETCH_I	prefetch	[%r8 + 0x0658], #one_read
	.word 0xcf220009  ! 267: STF_R	st	%f7, [%r9, %r8]
	.word 0xc2120009  ! 267: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xc8ba1009  ! 267: STDA_R	stda	%r4, [%r8 + %r9] 0x80
	.word 0xce320009  ! 270: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xcc5a0009  ! 270: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0x8ba20829  ! 270: FADDs	fadds	%f8, %f9, %f5
	.word 0xe22a0009  ! 273: STB_R	stb	%r17, [%r8 + %r9]
	.word 0xf84a0009  ! 273: LDSB_R	ldsb	[%r8 + %r9], %r28
	.word 0xc2ea1009  ! 273: LDSTUBA_R	ldstuba	%r1, [%r8 + %r9] 0x80
	.word 0xca220009  ! 276: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc8520009  ! 276: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xf07a2840  ! 276: SWAP_I	swap	%r24, [%r8 + 0x0840]
	.word 0xca720009  ! 279: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xdc0a0009  ! 279: LDUB_R	ldub	[%r8 + %r9], %r14
	.word 0x38800001  ! 279: BGU	bgu,a	<label_0x1>
	.word 0xca220009  ! 282: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xe4420009  ! 282: LDSW_R	ldsw	[%r8 + %r9], %r18
	.word 0xfe0a248c  ! 282: LDUB_I	ldub	[%r8 + 0x048c], %r31
	.word 0xfc2a0009  ! 285: STB_R	stb	%r30, [%r8 + %r9]
	.word 0xc01a0009  ! 285: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0xc36a2fe0  ! 285: PREFETCH_I	prefetch	[%r8 + 0x0fe0], #one_read
	.word 0xc8320009  ! 288: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc65a0009  ! 288: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0x8143c000  ! 288: STBAR	stbar
	.word 0xd93a0009  ! 291: STDF_R	std	%f12, [%r9, %r8]
	.word 0xc4120009  ! 291: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xecfa23b0  ! 291: SWAPA_I	swapa	%r22, [%r8 + 0x03b0] %asi
	.word 0xcf220009  ! 294: STF_R	st	%f7, [%r9, %r8]
	.word 0xce120009  ! 294: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xfc9a21d0  ! 294: LDDA_I	ldda	[%r8, + 0x01d0] %asi, %r30
	.word 0xcc720009  ! 297: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xf44a0009  ! 297: LDSB_R	ldsb	[%r8 + %r9], %r26
	.word 0x852223f4  ! 297: MULScc_I	mulscc 	%r8, 0x03f4, %r2
	.word 0xc33a0009  ! 300: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc5020009  ! 300: LDF_R	ld	[%r8, %r9], %f2
	.word 0xc45a2728  ! 300: LDX_I	ldx	[%r8 + 0x0728], %r2
	.word 0xca720009  ! 303: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xed1a0009  ! 303: LDDF_R	ldd	[%r8, %r9], %f22
	.word 0xf0ea23f4  ! 303: LDSTUBA_I	ldstuba	%r24, [%r8 + 0x03f4] %asi
	.word 0xda320009  ! 306: STH_R	sth	%r13, [%r8 + %r9]
	.word 0xc8520009  ! 306: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0x83220009  ! 306: MULScc_R	mulscc 	%r8, %r9, %r1
	.word 0xca720009  ! 309: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xe01a0009  ! 309: LDD_R	ldd	[%r8 + %r9], %r16
	.word 0xec1a0009  ! 309: LDD_R	ldd	[%r8 + %r9], %r22
	.word 0xc33a0009  ! 312: STDF_R	std	%f1, [%r9, %r8]
	.word 0xe2420009  ! 312: LDSW_R	ldsw	[%r8 + %r9], %r17
	.word 0x3a800001  ! 312: BCC	bcc,a	<label_0x1>
	.word 0xf4320009  ! 315: STH_R	sth	%r26, [%r8 + %r9]
	.word 0xf6520009  ! 315: LDSH_R	ldsh	[%r8 + %r9], %r27
	.word 0xd60a0009  ! 315: LDUB_R	ldub	[%r8 + %r9], %r11
	.word 0xda220009  ! 318: STW_R	stw	%r13, [%r8 + %r9]
	.word 0xde0a0009  ! 318: LDUB_R	ldub	[%r8 + %r9], %r15
	.word 0xc64a2c74  ! 318: LDSB_I	ldsb	[%r8 + 0x0c74], %r3
	.word 0xeb3a0009  ! 321: STDF_R	std	%f21, [%r9, %r8]
	.word 0xc4120009  ! 321: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xc3ea2310  ! 321: PREFETCHA_I	prefetcha	[%r8, + 0x0310] %asi, #one_read
	.word 0xcb220009  ! 324: STF_R	st	%f5, [%r9, %r8]
	.word 0xec4a0009  ! 324: LDSB_R	ldsb	[%r8 + %r9], %r22
	.word 0xecaa238c  ! 324: STBA_I	stba	%r22, [%r8 + 0x038c] %asi
	.word 0xf6220009  ! 327: STW_R	stw	%r27, [%r8 + %r9]
	.word 0xce420009  ! 327: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0x83a20929  ! 327: FMULs	fmuls	%f8, %f9, %f1
	.word 0xc62a0009  ! 330: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xcb020009  ! 330: LDF_R	ld	[%r8, %r9], %f5
	.word 0xc3ea1009  ! 330: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xcd220009  ! 333: STF_R	st	%f6, [%r9, %r8]
	.word 0xec0a0009  ! 333: LDUB_R	ldub	[%r8 + %r9], %r22
	.word 0x0a800002  ! 333: BCS	bcs  	<label_0x2>
	.word 0xc9220009  ! 336: STF_R	st	%f4, [%r9, %r8]
	.word 0xca020009  ! 336: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xceea1009  ! 336: LDSTUBA_R	ldstuba	%r7, [%r8 + %r9] 0x80
	.word 0xf4720009  ! 339: STX_R	stx	%r26, [%r8 + %r9]
	.word 0xce520009  ! 339: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0x844a0009  ! 339: MULX_R	mulx 	%r8, %r9, %r2
	.word 0xc6320009  ! 342: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc80a0009  ! 342: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0x856a0009  ! 342: SDIVX_R	sdivx	%r8, %r9, %r2
	.word 0xd73a0009  ! 345: STDF_R	std	%f11, [%r9, %r8]
	.word 0xec0a0009  ! 345: LDUB_R	ldub	[%r8 + %r9], %r22
	.word 0x8143c000  ! 345: STBAR	stbar
	.word 0xce220009  ! 348: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc41a0009  ! 348: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xceb21009  ! 348: STHA_R	stha	%r7, [%r8 + %r9] 0x80
	.word 0xc3220009  ! 351: STF_R	st	%f1, [%r9, %r8]
	.word 0xc25a0009  ! 351: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0x8143e046  ! 351: MEMBAR	membar	#StoreLoad | #LoadStore | #Sync 
	.word 0xc4320009  ! 354: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xcb1a0009  ! 354: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0x8c5a0009  ! 354: SMUL_R	smul 	%r8, %r9, %r6
	.word 0xc2720009  ! 357: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xfa520009  ! 357: LDSH_R	ldsh	[%r8 + %r9], %r29
	.word 0xc36a29b4  ! 357: PREFETCH_I	prefetch	[%r8 + 0x09b4], #one_read
	.word 0xf4220009  ! 360: STW_R	stw	%r26, [%r8 + %r9]
	.word 0xc9020009  ! 360: LDF_R	ld	[%r8, %r9], %f4
	.word 0x85220009  ! 360: MULScc_R	mulscc 	%r8, %r9, %r2
	.word 0xc5220009  ! 363: STF_R	st	%f2, [%r9, %r8]
	.word 0xce4a0009  ! 363: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0x82da0009  ! 363: SMULcc_R	smulcc 	%r8, %r9, %r1
	.word 0xe13a0009  ! 366: STDF_R	std	%f16, [%r9, %r8]
	.word 0xc2120009  ! 366: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0x2a800002  ! 366: BCS	bcs,a	<label_0x2>
	.word 0xc8720009  ! 369: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc41a0009  ! 369: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xdbe21009  ! 369: CASA_I	casa	[%r8] 0x80, %r9, %r13
	.word 0xc22a0009  ! 372: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc4120009  ! 372: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0x02800001  ! 372: BE	be  	<label_0x1>
	.word 0xda320009  ! 375: STH_R	sth	%r13, [%r8 + %r9]
	.word 0xde020009  ! 375: LDUW_R	lduw	[%r8 + %r9], %r15
	.word 0x8c722c70  ! 375: UDIV_I	udiv 	%r8, 0x0c70, %r6
	.word 0xc6320009  ! 378: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc41a0009  ! 378: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x12800002  ! 378: BNE	bne  	<label_0x2>
	.word 0xf42a0009  ! 381: STB_R	stb	%r26, [%r8 + %r9]
	.word 0xc81a0009  ! 381: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xfde22009  ! 381: CASA_R	casa	[%r8] %asi, %r9, %r30
	.word 0xcd220009  ! 384: STF_R	st	%f6, [%r9, %r8]
	.word 0xca0a0009  ! 384: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xb5a208a9  ! 384: FSUBs	fsubs	%f8, %f9, %f26
	.word 0xce2a0009  ! 387: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc9020009  ! 387: LDF_R	ld	[%r8, %r9], %f4
	.word 0xc3ea1009  ! 387: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xca320009  ! 390: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xfc120009  ! 390: LDUH_R	lduh	[%r8 + %r9], %r30
	.word 0xc3ea2a28  ! 390: PREFETCHA_I	prefetcha	[%r8, + 0x0a28] %asi, #one_read
	.word 0xf0720009  ! 393: STX_R	stx	%r24, [%r8 + %r9]
	.word 0xe05a0009  ! 393: LDX_R	ldx	[%r8 + %r9], %r16
	.word 0xc3ea2148  ! 393: PREFETCHA_I	prefetcha	[%r8, + 0x0148] %asi, #one_read
	.word 0xe0220009  ! 396: STW_R	stw	%r16, [%r8 + %r9]
	.word 0xc6020009  ! 396: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0x8ba208a9  ! 396: FSUBs	fsubs	%f8, %f9, %f5
	.word 0xcf3a0009  ! 399: STDF_R	std	%f7, [%r9, %r8]
	.word 0xf2520009  ! 399: LDSH_R	ldsh	[%r8 + %r9], %r25
	.word 0x89a209a9  ! 399: FDIVs	fdivs	%f8, %f9, %f4
	.word 0xc82a0009  ! 402: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xe31a0009  ! 402: LDDF_R	ldd	[%r8, %r9], %f17
	.word 0x84522bac  ! 402: UMUL_I	umul 	%r8, 0x0bac, %r2
	.word 0xc73a0009  ! 405: STDF_R	std	%f3, [%r9, %r8]
	.word 0xce120009  ! 405: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xc50221b8  ! 405: LDF_I	ld	[%r8, 0x01b8], %f2
	.word 0xe4220009  ! 408: STW_R	stw	%r18, [%r8 + %r9]
	.word 0xce020009  ! 408: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xa4520009  ! 408: UMUL_R	umul 	%r8, %r9, %r18
	.word 0xfa220009  ! 411: STW_R	stw	%r29, [%r8 + %r9]
	.word 0xf8120009  ! 411: LDUH_R	lduh	[%r8 + %r9], %r28
	.word 0x0ec20001  ! 411: BRGEZ	brgez  ,nt	%8,<label_0x20001>
	.word 0xc7220009  ! 414: STF_R	st	%f3, [%r9, %r8]
	.word 0xc9020009  ! 414: LDF_R	ld	[%r8, %r9], %f4
	.word 0xa5220009  ! 414: MULScc_R	mulscc 	%r8, %r9, %r18
	.word 0xcd3a0009  ! 417: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc64a0009  ! 417: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0x85a20829  ! 417: FADDs	fadds	%f8, %f9, %f2
	.word 0xca220009  ! 420: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xfc120009  ! 420: LDUH_R	lduh	[%r8 + %r9], %r30
	.word 0xe0d22a70  ! 420: LDSHA_I	ldsha	[%r8, + 0x0a70] %asi, %r16
	.word 0xf6320009  ! 423: STH_R	sth	%r27, [%r8 + %r9]
	.word 0xef020009  ! 423: LDF_R	ld	[%r8, %r9], %f23
	.word 0x8452277c  ! 423: UMUL_I	umul 	%r8, 0x077c, %r2
	.word 0xc53a0009  ! 426: STDF_R	std	%f2, [%r9, %r8]
	.word 0xe51a0009  ! 426: LDDF_R	ldd	[%r8, %r9], %f18
	.word 0xc93a2d70  ! 426: STDF_I	std	%f4, [0x0d70, %r8]
	.word 0xca220009  ! 429: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc4020009  ! 429: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0x04800002  ! 429: BLE	ble  	<label_0x2>
	.word 0xf0220009  ! 432: STW_R	stw	%r24, [%r8 + %r9]
	.word 0xc91a0009  ! 432: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xcd3a2b70  ! 432: STDF_I	std	%f6, [0x0b70, %r8]
	.word 0xec320009  ! 435: STH_R	sth	%r22, [%r8 + %r9]
	.word 0xee420009  ! 435: LDSW_R	ldsw	[%r8 + %r9], %r23
	.word 0xccaa1009  ! 435: STBA_R	stba	%r6, [%r8 + %r9] 0x80
	.word 0xc8220009  ! 438: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xf6520009  ! 438: LDSH_R	ldsh	[%r8 + %r9], %r27
	.word 0xccca1009  ! 438: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r6
	.word 0xf82a0009  ! 441: STB_R	stb	%r28, [%r8 + %r9]
	.word 0xcc020009  ! 441: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0x0c800001  ! 441: BNEG	bneg  	<label_0x1>
	.word 0xef220009  ! 444: STF_R	st	%f23, [%r9, %r8]
	.word 0xc84a0009  ! 444: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0x885a2144  ! 444: SMUL_I	smul 	%r8, 0x0144, %r4
	.word 0xc6320009  ! 447: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xcc520009  ! 447: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xccfa1009  ! 447: SWAPA_R	swapa	%r6, [%r8 + %r9] 0x80
	.word 0xc4320009  ! 450: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc60a0009  ! 450: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0x8143e075  ! 450: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside | #MemIssue | #Sync 
	.word 0xca320009  ! 453: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc8520009  ! 453: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0x8fa208a9  ! 453: FSUBs	fsubs	%f8, %f9, %f7
	.word 0xe8220009  ! 456: STW_R	stw	%r20, [%r8 + %r9]
	.word 0xf24a0009  ! 456: LDSB_R	ldsb	[%r8 + %r9], %r25
	.word 0xd93a0009  ! 456: STDF_R	std	%f12, [%r9, %r8]
	.word 0xe82a0009  ! 459: STB_R	stb	%r20, [%r8 + %r9]
	.word 0xce020009  ! 459: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xcaf21009  ! 459: STXA_R	stxa	%r5, [%r8 + %r9] 0x80
	.word 0xcc720009  ! 462: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xf20a0009  ! 462: LDUB_R	ldub	[%r8 + %r9], %r25
	.word 0xf2020009  ! 462: LDUW_R	lduw	[%r8 + %r9], %r25
	.word 0xf93a0009  ! 465: STDF_R	std	%f28, [%r9, %r8]
	.word 0xcc020009  ! 465: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0x8143c000  ! 465: STBAR	stbar
	.word 0xf0220009  ! 468: STW_R	stw	%r24, [%r8 + %r9]
	.word 0xcc420009  ! 468: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0x1a800002  ! 468: BCC	bcc  	<label_0x2>
	.word 0xc5220009  ! 471: STF_R	st	%f2, [%r9, %r8]
	.word 0xe0420009  ! 471: LDSW_R	ldsw	[%r8 + %r9], %r16
	.word 0x844a2798  ! 471: MULX_I	mulx 	%r8, 0x0798, %r2
	.word 0xc6720009  ! 474: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xcb020009  ! 474: LDF_R	ld	[%r8, %r9], %f5
	.word 0xc8ca2b68  ! 474: LDSBA_I	ldsba	[%r8, + 0x0b68] %asi, %r4
	.word 0xc8320009  ! 477: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc2120009  ! 477: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xc36a0009  ! 477: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xce2a0009  ! 480: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc40a0009  ! 480: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xa44a2a00  ! 480: MULX_I	mulx 	%r8, 0x0a00, %r18
	.word 0xcc320009  ! 483: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xcc5a0009  ! 483: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0x8143c000  ! 483: STBAR	stbar
	.word 0xce2a0009  ! 486: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xcc0a0009  ! 486: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xc6f21009  ! 486: STXA_R	stxa	%r3, [%r8 + %r9] 0x80
	.word 0xcc720009  ! 489: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xca020009  ! 489: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xcb220009  ! 489: STF_R	st	%f5, [%r9, %r8]
	.word 0xea720009  ! 492: STX_R	stx	%r21, [%r8 + %r9]
	.word 0xc85a0009  ! 492: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xfeda2b48  ! 492: LDXA_I	ldxa	[%r8, + 0x0b48] %asi, %r31
	.word 0xc6720009  ! 495: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc2020009  ! 495: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0x2a800001  ! 495: BCS	bcs,a	<label_0x1>
	.word 0xc3220009  ! 498: STF_R	st	%f1, [%r9, %r8]
	.word 0xcf1a0009  ! 498: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0x26800002  ! 498: BL	bl,a	<label_0x2>
	.word 0xc53a0009  ! 501: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc64a0009  ! 501: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xcefa1009  ! 501: SWAPA_R	swapa	%r7, [%r8 + %r9] 0x80
	.word 0xff220009  ! 504: STF_R	st	%f31, [%r9, %r8]
	.word 0xcc120009  ! 504: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0x986a0009  ! 504: UDIVX_R	udivx 	%r8, %r9, %r12
	.word 0xf5220009  ! 507: STF_R	st	%f26, [%r9, %r8]
	.word 0xc01a0009  ! 507: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0x2a800001  ! 507: BCS	bcs,a	<label_0x1>
	.word 0xf5220009  ! 510: STF_R	st	%f26, [%r9, %r8]
	.word 0xc40a0009  ! 510: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xcbe21009  ! 510: CASA_I	casa	[%r8] 0x80, %r9, %r5
	.word 0xc2320009  ! 513: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc2520009  ! 513: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xc2a2227c  ! 513: STWA_I	stwa	%r1, [%r8 + 0x027c] %asi
	.word 0xe1220009  ! 516: STF_R	st	%f16, [%r9, %r8]
	.word 0xc2420009  ! 516: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xc3ea2800  ! 516: PREFETCHA_I	prefetcha	[%r8, + 0x0800] %asi, #one_read
	.word 0xcc220009  ! 519: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xcc0a0009  ! 519: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xc6da1009  ! 519: LDXA_R	ldxa	[%r8, %r9] 0x80, %r3
	.word 0xc8320009  ! 522: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc60a0009  ! 522: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0x8143e03b  ! 522: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Lookaside | #MemIssue 
	.word 0xcc320009  ! 525: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xce4a0009  ! 525: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xe0b220cc  ! 525: STHA_I	stha	%r16, [%r8 + 0x00cc] %asi
	.word 0xfa220009  ! 528: STW_R	stw	%r29, [%r8 + %r9]
	.word 0xc7020009  ! 528: LDF_R	ld	[%r8, %r9], %f3
	.word 0xc292289c  ! 528: LDUHA_I	lduha	[%r8, + 0x089c] %asi, %r1
	.word 0xcb220009  ! 531: STF_R	st	%f5, [%r9, %r8]
	.word 0xfd020009  ! 531: LDF_R	ld	[%r8, %r9], %f30
	.word 0xc40a2548  ! 531: LDUB_I	ldub	[%r8 + 0x0548], %r2
	.word 0xc22a0009  ! 534: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xe20a0009  ! 534: LDUB_R	ldub	[%r8 + %r9], %r17
	.word 0xe0ba2d58  ! 534: STDA_I	stda	%r16, [%r8 + 0x0d58] %asi
	.word 0xcc720009  ! 537: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc64a0009  ! 537: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0x8143c000  ! 537: STBAR	stbar
	.word 0xc8720009  ! 540: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xfd020009  ! 540: LDF_R	ld	[%r8, %r9], %f30
	.word 0x8af20009  ! 540: UDIVcc_R	udivcc 	%r8, %r9, %r5
	.word 0xc7220009  ! 543: STF_R	st	%f3, [%r9, %r8]
	.word 0xcb1a0009  ! 543: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0x22ca0001  ! 543: BRZ	brz,a,pt	%8,<label_0xa0001>
	.word 0xfa220009  ! 546: STW_R	stw	%r29, [%r8 + %r9]
	.word 0xc31a0009  ! 546: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0x8143e011  ! 546: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xf3220009  ! 549: STF_R	st	%f25, [%r9, %r8]
	.word 0xcc420009  ! 549: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xc2921009  ! 549: LDUHA_R	lduha	[%r8, %r9] 0x80, %r1
	.word 0xc62a0009  ! 552: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc6420009  ! 552: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xfa6a2e90  ! 552: LDSTUB_I	ldstub	%r29, [%r8 + 0x0e90]
	.word 0xc8320009  ! 555: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc9020009  ! 555: LDF_R	ld	[%r8, %r9], %f4
	.word 0xc8d21009  ! 555: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r4
	.word 0xc8220009  ! 558: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xd8520009  ! 558: LDSH_R	ldsh	[%r8 + %r9], %r12
	.word 0xc8420009  ! 558: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xce220009  ! 561: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xee5a0009  ! 561: LDX_R	ldx	[%r8 + %r9], %r23
	.word 0xf5220009  ! 561: STF_R	st	%f26, [%r9, %r8]
	.word 0xc6720009  ! 564: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc8020009  ! 564: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xdeca296c  ! 564: LDSBA_I	ldsba	[%r8, + 0x096c] %asi, %r15
	.word 0xcf220009  ! 567: STF_R	st	%f7, [%r9, %r8]
	.word 0xe9020009  ! 567: LDF_R	ld	[%r8, %r9], %f20
	.word 0xc26a0009  ! 567: LDSTUB_R	ldstub	%r1, [%r8 + %r9]
	.word 0xcb220009  ! 570: STF_R	st	%f5, [%r9, %r8]
	.word 0xcf1a0009  ! 570: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0x3e800001  ! 570: BVC	bvc,a	<label_0x1>
	.word 0xc33a0009  ! 573: STDF_R	std	%f1, [%r9, %r8]
	.word 0xce0a0009  ! 573: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xe44220b8  ! 573: LDSW_I	ldsw	[%r8 + 0x00b8], %r18
	.word 0xc8220009  ! 576: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xdc4a0009  ! 576: LDSB_R	ldsb	[%r8 + %r9], %r14
	.word 0xe3220009  ! 576: STF_R	st	%f17, [%r9, %r8]
	.word 0xee2a0009  ! 579: STB_R	stb	%r23, [%r8 + %r9]
	.word 0xfd1a0009  ! 579: LDDF_R	ldd	[%r8, %r9], %f30
	.word 0x8143e03c  ! 579: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0xc93a0009  ! 582: STDF_R	std	%f4, [%r9, %r8]
	.word 0xf5020009  ! 582: LDF_R	ld	[%r8, %r9], %f26
	.word 0x8143e027  ! 582: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #MemIssue 
	.word 0xc8320009  ! 585: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc4520009  ! 585: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xc2b22e0c  ! 585: STHA_I	stha	%r1, [%r8 + 0x0e0c] %asi
	.word 0xc6720009  ! 588: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xee0a0009  ! 588: LDUB_R	ldub	[%r8 + %r9], %r23
	.word 0x34800001  ! 588: BG	bg,a	<label_0x1>
	.word 0xfb220009  ! 591: STF_R	st	%f29, [%r9, %r8]
	.word 0xec1a0009  ! 591: LDD_R	ldd	[%r8 + %r9], %r22
	.word 0xcc921009  ! 591: LDUHA_R	lduha	[%r8, %r9] 0x80, %r6
	.word 0xcc720009  ! 594: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xca5a0009  ! 594: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0x8143c000  ! 594: STBAR	stbar
	.word 0xc93a0009  ! 597: STDF_R	std	%f4, [%r9, %r8]
	.word 0xca020009  ! 597: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xc36a25f0  ! 597: PREFETCH_I	prefetch	[%r8 + 0x05f0], #one_read
	.word 0xcf220009  ! 600: STF_R	st	%f7, [%r9, %r8]
	.word 0xc40a0009  ! 600: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0x9da209a9  ! 600: FDIVs	fdivs	%f8, %f9, %f14
	.word 0xfc320009  ! 603: STH_R	sth	%r30, [%r8 + %r9]
	.word 0xc4120009  ! 603: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xb0f224bc  ! 603: UDIVcc_I	udivcc 	%r8, 0x04bc, %r24
	.word 0xfa220009  ! 606: STW_R	stw	%r29, [%r8 + %r9]
	.word 0xcf020009  ! 606: LDF_R	ld	[%r8, %r9], %f7
	.word 0x8143c000  ! 606: STBAR	stbar
	.word 0xfc720009  ! 609: STX_R	stx	%r30, [%r8 + %r9]
	.word 0xcc0a0009  ! 609: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xce420009  ! 609: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xc4720009  ! 612: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xf2420009  ! 612: LDSW_R	ldsw	[%r8 + %r9], %r25
	.word 0x30800001  ! 612: BA	ba,a	<label_0x1>
	.word 0xc82a0009  ! 615: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xcc1a0009  ! 615: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xf5022f50  ! 615: LDF_I	ld	[%r8, 0x0f50], %f26
	.word 0xc82a0009  ! 618: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc2120009  ! 618: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xc68a2bcc  ! 618: LDUBA_I	lduba	[%r8, + 0x0bcc] %asi, %r3
	.word 0xce220009  ! 621: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xfa020009  ! 621: LDUW_R	lduw	[%r8 + %r9], %r29
	.word 0x886a2ed8  ! 621: UDIVX_I	udivx 	%r8, 0x0ed8, %r4
	.word 0xe0220009  ! 624: STW_R	stw	%r16, [%r8 + %r9]
	.word 0xf6020009  ! 624: LDUW_R	lduw	[%r8 + %r9], %r27
	.word 0x86d22074  ! 624: UMULcc_I	umulcc 	%r8, 0x0074, %r3
	.word 0xde320009  ! 627: STH_R	sth	%r15, [%r8 + %r9]
	.word 0xc7020009  ! 627: LDF_R	ld	[%r8, %r9], %f3
	.word 0x8143e04b  ! 627: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Sync 
	.word 0xfb220009  ! 630: STF_R	st	%f29, [%r9, %r8]
	.word 0xe7020009  ! 630: LDF_R	ld	[%r8, %r9], %f19
	.word 0xdde21009  ! 630: CASA_I	casa	[%r8] 0x80, %r9, %r14
	.word 0xc42a0009  ! 633: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xde520009  ! 633: LDSH_R	ldsh	[%r8 + %r9], %r15
	.word 0xf6d22a10  ! 633: LDSHA_I	ldsha	[%r8, + 0x0a10] %asi, %r27
	.word 0xe53a0009  ! 636: STDF_R	std	%f18, [%r9, %r8]
	.word 0xcc420009  ! 636: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0x8143c000  ! 636: STBAR	stbar
	.word 0xdc220009  ! 639: STW_R	stw	%r14, [%r8 + %r9]
	.word 0xcc120009  ! 639: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0x1c800001  ! 639: BPOS	bpos  	<label_0x1>
	.word 0xf2720009  ! 642: STX_R	stx	%r25, [%r8 + %r9]
	.word 0xcd020009  ! 642: LDF_R	ld	[%r8, %r9], %f6
	.word 0x8143c000  ! 642: STBAR	stbar
	.word 0xd8720009  ! 645: STX_R	stx	%r12, [%r8 + %r9]
	.word 0xc40a0009  ! 645: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0x8143c000  ! 645: STBAR	stbar
	.word 0xd6220009  ! 648: STW_R	stw	%r11, [%r8 + %r9]
	.word 0xca120009  ! 648: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xceca1009  ! 648: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r7
	.word 0xe22a0009  ! 651: STB_R	stb	%r17, [%r8 + %r9]
	.word 0xcb1a0009  ! 651: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0x8143c000  ! 651: STBAR	stbar
	.word 0xe0220009  ! 654: STW_R	stw	%r16, [%r8 + %r9]
	.word 0xf8020009  ! 654: LDUW_R	lduw	[%r8 + %r9], %r28
	.word 0x8143c000  ! 654: STBAR	stbar
	.word 0xf8720009  ! 657: STX_R	stx	%r28, [%r8 + %r9]
	.word 0xd80a0009  ! 657: LDUB_R	ldub	[%r8 + %r9], %r12
	.word 0x8d222dc8  ! 657: MULScc_I	mulscc 	%r8, 0x0dc8, %r6
	.word 0xc8220009  ! 660: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xdf1a0009  ! 660: LDDF_R	ldd	[%r8, %r9], %f15
	.word 0x8ad22564  ! 660: UMULcc_I	umulcc 	%r8, 0x0564, %r5
	.word 0xe4220009  ! 663: STW_R	stw	%r18, [%r8 + %r9]
	.word 0xe45a0009  ! 663: LDX_R	ldx	[%r8 + %r9], %r18
	.word 0xeab22010  ! 663: STHA_I	stha	%r21, [%r8 + 0x0010] %asi
	.word 0xde320009  ! 666: STH_R	sth	%r15, [%r8 + %r9]
	.word 0xc8520009  ! 666: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0x04800002  ! 666: BLE	ble  	<label_0x2>
	.word 0xf8220009  ! 669: STW_R	stw	%r28, [%r8 + %r9]
	.word 0xca4a0009  ! 669: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xbf6a0009  ! 669: SDIVX_R	sdivx	%r8, %r9, %r31
	.word 0xd6220009  ! 672: STW_R	stw	%r11, [%r8 + %r9]
	.word 0xc6020009  ! 672: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0x8143e04b  ! 672: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Sync 
	.word 0xda720009  ! 675: STX_R	stx	%r13, [%r8 + %r9]
	.word 0xcd1a0009  ! 675: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0x8143c000  ! 675: STBAR	stbar
	.word 0xce2a0009  ! 678: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc64a0009  ! 678: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xc36a25dc  ! 678: PREFETCH_I	prefetch	[%r8 + 0x05dc], #one_read
	.word 0xc8320009  ! 681: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc60a0009  ! 681: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xc4ea1009  ! 681: LDSTUBA_R	ldstuba	%r2, [%r8 + %r9] 0x80
	.word 0xc4220009  ! 684: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xda0a0009  ! 684: LDUB_R	ldub	[%r8 + %r9], %r13
	.word 0xc36a0009  ! 684: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xfb220009  ! 687: STF_R	st	%f29, [%r9, %r8]
	.word 0xc7020009  ! 687: LDF_R	ld	[%r8, %r9], %f3
	.word 0x856a0009  ! 687: SDIVX_R	sdivx	%r8, %r9, %r2
	.word 0xc73a0009  ! 690: STDF_R	std	%f3, [%r9, %r8]
	.word 0xf81a0009  ! 690: LDD_R	ldd	[%r8 + %r9], %r28
	.word 0xc8a22604  ! 690: STWA_I	stwa	%r4, [%r8 + 0x0604] %asi
	.word 0xc2320009  ! 693: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xce420009  ! 693: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xc4420009  ! 693: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xc93a0009  ! 696: STDF_R	std	%f4, [%r9, %r8]
	.word 0xcc1a0009  ! 696: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xc3ea1009  ! 696: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xd73a0009  ! 699: STDF_R	std	%f11, [%r9, %r8]
	.word 0xc91a0009  ! 699: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xc3ea1009  ! 699: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc5220009  ! 702: STF_R	st	%f2, [%r9, %r8]
	.word 0xc6020009  ! 702: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xe6020009  ! 702: LDUW_R	lduw	[%r8 + %r9], %r19
	.word 0xfe720009  ! 705: STX_R	stx	%r31, [%r8 + %r9]
	.word 0xca4a0009  ! 705: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xe4aa1009  ! 705: STBA_R	stba	%r18, [%r8 + %r9] 0x80
	.word 0xc4720009  ! 708: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xfd020009  ! 708: LDF_R	ld	[%r8, %r9], %f30
	.word 0x9ad227fc  ! 708: UMULcc_I	umulcc 	%r8, 0x07fc, %r13
	.word 0xde720009  ! 711: STX_R	stx	%r15, [%r8 + %r9]
	.word 0xcc420009  ! 711: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xccba2400  ! 711: STDA_I	stda	%r6, [%r8 + 0x0400] %asi
	.word 0xe8320009  ! 714: STH_R	sth	%r20, [%r8 + %r9]
	.word 0xce4a0009  ! 714: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0x40000002  ! 714: CALL	call	disp30_2
	.word 0xc33a0009  ! 717: STDF_R	std	%f1, [%r9, %r8]
	.word 0xce0a0009  ! 717: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0x87a208a9  ! 717: FSUBs	fsubs	%f8, %f9, %f3
	.word 0xe33a0009  ! 720: STDF_R	std	%f17, [%r9, %r8]
	.word 0xc3020009  ! 720: LDF_R	ld	[%r8, %r9], %f1
	.word 0xee8a211c  ! 720: LDUBA_I	lduba	[%r8, + 0x011c] %asi, %r23
	.word 0xe2320009  ! 723: STH_R	sth	%r17, [%r8 + %r9]
	.word 0xca120009  ! 723: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xa6d2243c  ! 723: UMULcc_I	umulcc 	%r8, 0x043c, %r19
	.word 0xc5220009  ! 726: STF_R	st	%f2, [%r9, %r8]
	.word 0xc51a0009  ! 726: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0x8143e071  ! 726: MEMBAR	membar	#LoadLoad | #Lookaside | #MemIssue | #Sync 
	.word 0xfc720009  ! 729: STX_R	stx	%r30, [%r8 + %r9]
	.word 0xe41a0009  ! 729: LDD_R	ldd	[%r8 + %r9], %r18
	.word 0xc36a0009  ! 729: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc9220009  ! 732: STF_R	st	%f4, [%r9, %r8]
	.word 0xec520009  ! 732: LDSH_R	ldsh	[%r8 + %r9], %r22
	.word 0x825a0009  ! 732: SMUL_R	smul 	%r8, %r9, %r1
	.word 0xc6320009  ! 735: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xe91a0009  ! 735: LDDF_R	ldd	[%r8, %r9], %f20
	.word 0xca4a2324  ! 735: LDSB_I	ldsb	[%r8 + 0x0324], %r5
	.word 0xc42a0009  ! 738: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xca4a0009  ! 738: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0x8fa208a9  ! 738: FSUBs	fsubs	%f8, %f9, %f7
	.word 0xca220009  ! 741: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xcc1a0009  ! 741: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xc6f221a0  ! 741: STXA_I	stxa	%r3, [%r8 + 0x01a0] %asi
	.word 0xca320009  ! 744: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xdc020009  ! 744: LDUW_R	lduw	[%r8 + %r9], %r14
	.word 0xc80a0009  ! 744: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xc8320009  ! 747: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xf4520009  ! 747: LDSH_R	ldsh	[%r8 + %r9], %r26
	.word 0xc3222fc4  ! 747: STF_I	st	%f1, [0x0fc4, %r8]
	.word 0xcb220009  ! 750: STF_R	st	%f5, [%r9, %r8]
	.word 0xf6520009  ! 750: LDSH_R	ldsh	[%r8 + %r9], %r27
	.word 0xc89a2698  ! 750: LDDA_I	ldda	[%r8, + 0x0698] %asi, %r4
	.word 0xcc220009  ! 753: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xcc1a0009  ! 753: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xc2b21009  ! 753: STHA_R	stha	%r1, [%r8 + %r9] 0x80
	.word 0xcd3a0009  ! 756: STDF_R	std	%f6, [%r9, %r8]
	.word 0xea520009  ! 756: LDSH_R	ldsh	[%r8 + %r9], %r21
	.word 0xc3ea1009  ! 756: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xcf3a0009  ! 759: STDF_R	std	%f7, [%r9, %r8]
	.word 0xca120009  ! 759: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xb72226d4  ! 759: MULScc_I	mulscc 	%r8, 0x06d4, %r27
	.word 0xd7220009  ! 762: STF_R	st	%f11, [%r9, %r8]
	.word 0xca4a0009  ! 762: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xab222424  ! 762: MULScc_I	mulscc 	%r8, 0x0424, %r21
	.word 0xc6720009  ! 765: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc3020009  ! 765: LDF_R	ld	[%r8, %r9], %f1
	.word 0x8143e049  ! 765: MEMBAR	membar	#LoadLoad | #StoreStore | #Sync 
	.word 0xc4720009  ! 768: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc25a0009  ! 768: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xcb220009  ! 768: STF_R	st	%f5, [%r9, %r8]
	.word 0xfe720009  ! 771: STX_R	stx	%r31, [%r8 + %r9]
	.word 0xee420009  ! 771: LDSW_R	ldsw	[%r8 + %r9], %r23
	.word 0xc4aa1009  ! 771: STBA_R	stba	%r2, [%r8 + %r9] 0x80
	.word 0xce220009  ! 774: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc4420009  ! 774: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0x8ad22d20  ! 774: UMULcc_I	umulcc 	%r8, 0x0d20, %r5
	.word 0xe22a0009  ! 777: STB_R	stb	%r17, [%r8 + %r9]
	.word 0xc6120009  ! 777: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xbba209a9  ! 777: FDIVs	fdivs	%f8, %f9, %f29
	.word 0xea220009  ! 780: STW_R	stw	%r21, [%r8 + %r9]
	.word 0xcd020009  ! 780: LDF_R	ld	[%r8, %r9], %f6
	.word 0xb8da0009  ! 780: SMULcc_R	smulcc 	%r8, %r9, %r28
	.word 0xec220009  ! 783: STW_R	stw	%r22, [%r8 + %r9]
	.word 0xcc420009  ! 783: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xe9222118  ! 783: STF_I	st	%f20, [0x0118, %r8]
	.word 0xc73a0009  ! 786: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc25a0009  ! 786: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0x886a2614  ! 786: UDIVX_I	udivx 	%r8, 0x0614, %r4
	.word 0xcf220009  ! 789: STF_R	st	%f7, [%r9, %r8]
	.word 0xca4a0009  ! 789: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0x8143c000  ! 789: STBAR	stbar
	.word 0xc8720009  ! 792: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xca5a0009  ! 792: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0x8cd20009  ! 792: UMULcc_R	umulcc 	%r8, %r9, %r6
	.word 0xc42a0009  ! 795: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xf00a0009  ! 795: LDUB_R	ldub	[%r8 + %r9], %r24
	.word 0x8143e036  ! 795: MEMBAR	membar	#StoreLoad | #LoadStore | #Lookaside | #MemIssue 
	.word 0xe73a0009  ! 798: STDF_R	std	%f19, [%r9, %r8]
	.word 0xc31a0009  ! 798: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xc36a2dc0  ! 798: PREFETCH_I	prefetch	[%r8 + 0x0dc0], #one_read
	.word 0xc8320009  ! 801: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc2520009  ! 801: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0x8a6a2084  ! 801: UDIVX_I	udivx 	%r8, 0x0084, %r5
	.word 0xc2220009  ! 804: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xe60a0009  ! 804: LDUB_R	ldub	[%r8 + %r9], %r19
	.word 0x87a20829  ! 804: FADDs	fadds	%f8, %f9, %f3
	.word 0xc4220009  ! 807: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc51a0009  ! 807: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xef3a0009  ! 807: STDF_R	std	%f23, [%r9, %r8]
	.word 0xe62a0009  ! 810: STB_R	stb	%r19, [%r8 + %r9]
	.word 0xcc4a0009  ! 810: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xc36a0009  ! 810: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xfc220009  ! 813: STW_R	stw	%r30, [%r8 + %r9]
	.word 0xc41a0009  ! 813: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x88722ed8  ! 813: UDIV_I	udiv 	%r8, 0x0ed8, %r4
	.word 0xc22a0009  ! 816: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc65a0009  ! 816: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0x8e7a2440  ! 816: SDIV_I	sdiv 	%r8, 0x0440, %r7
	.word 0xc4320009  ! 819: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc6020009  ! 819: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xe09a1009  ! 819: LDDA_R	ldda	[%r8, %r9] 0x80, %r16
	.word 0xdf220009  ! 822: STF_R	st	%f15, [%r9, %r8]
	.word 0xc4120009  ! 822: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0x8143e021  ! 822: MEMBAR	membar	#LoadLoad | #MemIssue 
	.word 0xf22a0009  ! 825: STB_R	stb	%r25, [%r8 + %r9]
	.word 0xf7020009  ! 825: LDF_R	ld	[%r8, %r9], %f27
	.word 0xee822ee8  ! 825: LDUWA_I	lduwa	[%r8, + 0x0ee8] %asi, %r23
	.word 0xcb3a0009  ! 828: STDF_R	std	%f5, [%r9, %r8]
	.word 0xc8420009  ! 828: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xda8a29cc  ! 828: LDUBA_I	lduba	[%r8, + 0x09cc] %asi, %r13
	.word 0xce220009  ! 831: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc4020009  ! 831: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xc86a2d50  ! 831: LDSTUB_I	ldstub	%r4, [%r8 + 0x0d50]
	.word 0xc4220009  ! 834: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xe8420009  ! 834: LDSW_R	ldsw	[%r8 + %r9], %r20
	.word 0xb6fa2030  ! 834: SDIVcc_I	sdivcc 	%r8, 0x0030, %r27
	.word 0xfb220009  ! 837: STF_R	st	%f29, [%r9, %r8]
	.word 0xc8520009  ! 837: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xc0ba2e68  ! 837: STDA_I	stda	%r0, [%r8 + 0x0e68] %asi
	.word 0xcf220009  ! 840: STF_R	st	%f7, [%r9, %r8]
	.word 0xce420009  ! 840: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xc6921009  ! 840: LDUHA_R	lduha	[%r8, %r9] 0x80, %r3
	.word 0xc2220009  ! 843: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xcf020009  ! 843: LDF_R	ld	[%r8, %r9], %f7
	.word 0x0aca0001  ! 843: BRNZ	brnz  ,pt	%8,<label_0xa0001>
	.word 0xc6320009  ! 846: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xd6020009  ! 846: LDUW_R	lduw	[%r8 + %r9], %r11
	.word 0x8e720009  ! 846: UDIV_R	udiv 	%r8, %r9, %r7
	.word 0xce220009  ! 849: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc6420009  ! 849: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0x98722e44  ! 849: UDIV_I	udiv 	%r8, 0x0e44, %r12
	.word 0xc6220009  ! 852: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xe4520009  ! 852: LDSH_R	ldsh	[%r8 + %r9], %r18
	.word 0x22800002  ! 852: BE	be,a	<label_0x2>
	.word 0xdc720009  ! 855: STX_R	stx	%r14, [%r8 + %r9]
	.word 0xce5a0009  ! 855: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xdcfa1009  ! 855: SWAPA_R	swapa	%r14, [%r8 + %r9] 0x80
	.word 0xfe320009  ! 858: STH_R	sth	%r31, [%r8 + %r9]
	.word 0xc9020009  ! 858: LDF_R	ld	[%r8, %r9], %f4
	.word 0x8f222eac  ! 858: MULScc_I	mulscc 	%r8, 0x0eac, %r7
	.word 0xc73a0009  ! 861: STDF_R	std	%f3, [%r9, %r8]
	.word 0xea420009  ! 861: LDSW_R	ldsw	[%r8 + %r9], %r21
	.word 0xc3ea1009  ! 861: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xed220009  ! 864: STF_R	st	%f22, [%r9, %r8]
	.word 0xcd1a0009  ! 864: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0x16800001  ! 864: BGE	bge  	<label_0x1>
	.word 0xc53a0009  ! 867: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc8020009  ! 867: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xea0a282c  ! 867: LDUB_I	ldub	[%r8 + 0x082c], %r21
	.word 0xc8220009  ! 870: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xf00a0009  ! 870: LDUB_R	ldub	[%r8 + %r9], %r24
	.word 0xdb3a23f8  ! 870: STDF_I	std	%f13, [0x03f8, %r8]
	.word 0xf0320009  ! 873: STH_R	sth	%r24, [%r8 + %r9]
	.word 0xc8520009  ! 873: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0x84da2434  ! 873: SMULcc_I	smulcc 	%r8, 0x0434, %r2
	.word 0xea320009  ! 876: STH_R	sth	%r21, [%r8 + %r9]
	.word 0xc9020009  ! 876: LDF_R	ld	[%r8, %r9], %f4
	.word 0xf0b21009  ! 876: STHA_R	stha	%r24, [%r8 + %r9] 0x80
	.word 0xf53a0009  ! 879: STDF_R	std	%f26, [%r9, %r8]
	.word 0xc81a0009  ! 879: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xc36a0009  ! 879: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc2720009  ! 882: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xf24a0009  ! 882: LDSB_R	ldsb	[%r8 + %r9], %r25
	.word 0x06c20001  ! 882: BRLZ	brlz  ,nt	%8,<label_0x20001>
	.word 0xcd220009  ! 885: STF_R	st	%f6, [%r9, %r8]
	.word 0xc25a0009  ! 885: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xb8d20009  ! 885: UMULcc_R	umulcc 	%r8, %r9, %r28
	.word 0xc33a0009  ! 888: STDF_R	std	%f1, [%r9, %r8]
	.word 0xca4a0009  ! 888: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xce422114  ! 888: LDSW_I	ldsw	[%r8 + 0x0114], %r7
	.word 0xcb3a0009  ! 891: STDF_R	std	%f5, [%r9, %r8]
	.word 0xca420009  ! 891: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xac6a2e6c  ! 891: UDIVX_I	udivx 	%r8, 0x0e6c, %r22
	.word 0xc9220009  ! 894: STF_R	st	%f4, [%r9, %r8]
	.word 0xeb1a0009  ! 894: LDDF_R	ldd	[%r8, %r9], %f21
	.word 0x0aca0001  ! 894: BRNZ	brnz  ,pt	%8,<label_0xa0001>
	.word 0xcf3a0009  ! 897: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc4020009  ! 897: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0x8fa208a9  ! 897: FSUBs	fsubs	%f8, %f9, %f7
	.word 0xce220009  ! 900: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc40a0009  ! 900: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0x8da209a9  ! 900: FDIVs	fdivs	%f8, %f9, %f6
	.word 0xc8220009  ! 903: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xda520009  ! 903: LDSH_R	ldsh	[%r8 + %r9], %r13
	.word 0x02800001  ! 903: BE	be  	<label_0x1>
	.word 0xc6320009  ! 906: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xee520009  ! 906: LDSH_R	ldsh	[%r8 + %r9], %r23
	.word 0xccca246c  ! 906: LDSBA_I	ldsba	[%r8, + 0x046c] %asi, %r6
	.word 0xcd220009  ! 909: STF_R	st	%f6, [%r9, %r8]
	.word 0xc4120009  ! 909: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0x85a20829  ! 909: FADDs	fadds	%f8, %f9, %f2
	.word 0xf0720009  ! 912: STX_R	stx	%r24, [%r8 + %r9]
	.word 0xd91a0009  ! 912: LDDF_R	ldd	[%r8, %r9], %f12
	.word 0xc51a25a8  ! 912: LDDF_I	ldd	[%r8, 0x05a8], %f2
	.word 0xcf220009  ! 915: STF_R	st	%f7, [%r9, %r8]
	.word 0xc31a0009  ! 915: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0x9e520009  ! 915: UMUL_R	umul 	%r8, %r9, %r15
	.word 0xe7220009  ! 918: STF_R	st	%f19, [%r9, %r8]
	.word 0xc3020009  ! 918: LDF_R	ld	[%r8, %r9], %f1
	.word 0x97a20829  ! 918: FADDs	fadds	%f8, %f9, %f11
	.word 0xe2220009  ! 921: STW_R	stw	%r17, [%r8 + %r9]
	.word 0xce520009  ! 921: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xca0a0009  ! 921: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xc7220009  ! 924: STF_R	st	%f3, [%r9, %r8]
	.word 0xc7020009  ! 924: LDF_R	ld	[%r8, %r9], %f3
	.word 0xc89a20c0  ! 924: LDDA_I	ldda	[%r8, + 0x00c0] %asi, %r4
	.word 0xda320009  ! 927: STH_R	sth	%r13, [%r8 + %r9]
	.word 0xc6420009  ! 927: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xe40228ec  ! 927: LDUW_I	lduw	[%r8 + 0x08ec], %r18
	.word 0xee320009  ! 930: STH_R	sth	%r23, [%r8 + %r9]
	.word 0xf9020009  ! 930: LDF_R	ld	[%r8, %r9], %f28
	.word 0xc3ea1009  ! 930: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xf8220009  ! 933: STW_R	stw	%r28, [%r8 + %r9]
	.word 0xcd020009  ! 933: LDF_R	ld	[%r8, %r9], %f6
	.word 0x8143c000  ! 933: STBAR	stbar
	.word 0xca320009  ! 936: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xce0a0009  ! 936: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xcad21009  ! 936: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r5
	.word 0xce2a0009  ! 939: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xcc520009  ! 939: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0x9ba209a9  ! 939: FDIVs	fdivs	%f8, %f9, %f13
	.word 0xce320009  ! 942: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xee020009  ! 942: LDUW_R	lduw	[%r8 + %r9], %r23
	.word 0x24800001  ! 942: BLE	ble,a	<label_0x1>
	.word 0xc2720009  ! 945: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xf24a0009  ! 945: LDSB_R	ldsb	[%r8 + %r9], %r25
	.word 0x20800002  ! 945: BN	bn,a	<label_0x2>
	.word 0xca2a0009  ! 948: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xdc520009  ! 948: LDSH_R	ldsh	[%r8 + %r9], %r14
	.word 0xc36a0009  ! 948: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xfc220009  ! 951: STW_R	stw	%r30, [%r8 + %r9]
	.word 0xc3020009  ! 951: LDF_R	ld	[%r8, %r9], %f1
	.word 0xcaea1009  ! 951: LDSTUBA_R	ldstuba	%r5, [%r8 + %r9] 0x80
	.word 0xc4320009  ! 954: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xca120009  ! 954: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0x8b222c1c  ! 954: MULScc_I	mulscc 	%r8, 0x0c1c, %r5
	.word 0xf9220009  ! 957: STF_R	st	%f28, [%r9, %r8]
	.word 0xf64a0009  ! 957: LDSB_R	ldsb	[%r8 + %r9], %r27
	.word 0xa2fa0009  ! 957: SDIVcc_R	sdivcc 	%r8, %r9, %r17
	.word 0xc62a0009  ! 960: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xfc1a0009  ! 960: LDD_R	ldd	[%r8 + %r9], %r30
	.word 0xcc821009  ! 960: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r6
	.word 0xfe720009  ! 963: STX_R	stx	%r31, [%r8 + %r9]
	.word 0xc20a0009  ! 963: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0x8a4a0009  ! 963: MULX_R	mulx 	%r8, %r9, %r5
	.word 0xcd220009  ! 966: STF_R	st	%f6, [%r9, %r8]
	.word 0xe8120009  ! 966: LDUH_R	lduh	[%r8 + %r9], %r20
	.word 0xc4f21009  ! 966: STXA_R	stxa	%r2, [%r8 + %r9] 0x80
	.word 0xee220009  ! 969: STW_R	stw	%r23, [%r8 + %r9]
	.word 0xea4a0009  ! 969: LDSB_R	ldsb	[%r8 + %r9], %r21
	.word 0x827a2b2c  ! 969: SDIV_I	sdiv 	%r8, 0x0b2c, %r1
	.word 0xcb220009  ! 972: STF_R	st	%f5, [%r9, %r8]
	.word 0xcc0a0009  ! 972: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0x89a20829  ! 972: FADDs	fadds	%f8, %f9, %f4
	.word 0xcc320009  ! 975: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc20a0009  ! 975: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0x836a2510  ! 975: SDIVX_I	sdivx	%r8, 0x0510, %r1
	.word 0xc42a0009  ! 978: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xcd020009  ! 978: LDF_R	ld	[%r8, %r9], %f6
	.word 0x82da25c0  ! 978: SMULcc_I	smulcc 	%r8, 0x05c0, %r1
	.word 0xce720009  ! 981: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xce020009  ! 981: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xd49a1009  ! 981: LDDA_R	ldda	[%r8, %r9] 0x80, %r10
	.word 0xfe320009  ! 984: STH_R	sth	%r31, [%r8 + %r9]
	.word 0xc6120009  ! 984: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xf00a247c  ! 984: LDUB_I	ldub	[%r8 + 0x047c], %r24
	.word 0xc4320009  ! 987: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xcc1a0009  ! 987: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xc33a0009  ! 987: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc7220009  ! 990: STF_R	st	%f3, [%r9, %r8]
	.word 0xc20a0009  ! 990: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0x8c7223e4  ! 990: UDIV_I	udiv 	%r8, 0x03e4, %r6
	.word 0xcb3a0009  ! 993: STDF_R	std	%f5, [%r9, %r8]
	.word 0xc20a0009  ! 993: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xc8fa2f5c  ! 993: SWAPA_I	swapa	%r4, [%r8 + 0x0f5c] %asi
	.word 0xe6220009  ! 996: STW_R	stw	%r19, [%r8 + %r9]
	.word 0xc4120009  ! 996: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0x8cda0009  ! 996: SMULcc_R	smulcc 	%r8, %r9, %r6
	.word 0xce220009  ! 999: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xce420009  ! 999: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0x2e800001  ! 999: BVS	bvs,a	<label_0x1>
	.word 0xc3220009  ! 1002: STF_R	st	%f1, [%r9, %r8]
	.word 0xcc5a0009  ! 1002: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xc36a20b4  ! 1002: PREFETCH_I	prefetch	[%r8 + 0x00b4], #one_read
	.word 0xe6220009  ! 1005: STW_R	stw	%r19, [%r8 + %r9]
	.word 0xfa120009  ! 1005: LDUH_R	lduh	[%r8 + %r9], %r29
	.word 0xc8821009  ! 1005: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r4
	.word 0xce720009  ! 1008: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xe8020009  ! 1008: LDUW_R	lduw	[%r8 + %r9], %r20
	.word 0x8143c000  ! 1008: STBAR	stbar
	.word 0xf22a0009  ! 1011: STB_R	stb	%r25, [%r8 + %r9]
	.word 0xc65a0009  ! 1011: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xc3ea288c  ! 1011: PREFETCHA_I	prefetcha	[%r8, + 0x088c] %asi, #one_read
	.word 0xcc320009  ! 1014: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xcf1a0009  ! 1014: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0x8143e007  ! 1014: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore 
	.word 0xc2320009  ! 1017: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xca120009  ! 1017: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0x8e7a292c  ! 1017: SDIV_I	sdiv 	%r8, 0x092c, %r7
	.word 0xcc2a0009  ! 1020: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc2020009  ! 1020: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xbe52222c  ! 1020: UMUL_I	umul 	%r8, 0x022c, %r31
	.word 0xe7220009  ! 1023: STF_R	st	%f19, [%r9, %r8]
	.word 0xea020009  ! 1023: LDUW_R	lduw	[%r8 + %r9], %r21
	.word 0xc3ea1009  ! 1023: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xce320009  ! 1026: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc2120009  ! 1026: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0x8fa20929  ! 1026: FMULs	fmuls	%f8, %f9, %f7
	.word 0xed3a0009  ! 1029: STDF_R	std	%f22, [%r9, %r8]
	.word 0xcc0a0009  ! 1029: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0x84d20009  ! 1029: UMULcc_R	umulcc 	%r8, %r9, %r2
	.word 0xca320009  ! 1032: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc44a0009  ! 1032: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0x87a20829  ! 1032: FADDs	fadds	%f8, %f9, %f3
	.word 0xee320009  ! 1035: STH_R	sth	%r23, [%r8 + %r9]
	.word 0xe41a0009  ! 1035: LDD_R	ldd	[%r8 + %r9], %r18
	.word 0x8143e034  ! 1035: MEMBAR	membar	#LoadStore | #Lookaside | #MemIssue 
	.word 0xc6720009  ! 1038: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc8020009  ! 1038: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xc2ea1009  ! 1038: LDSTUBA_R	ldstuba	%r1, [%r8 + %r9] 0x80
	.word 0xcc220009  ! 1041: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc25a0009  ! 1041: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0x28800002  ! 1041: BLEU	bleu,a	<label_0x2>
	.word 0xdd3a0009  ! 1044: STDF_R	std	%f14, [%r9, %r8]
	.word 0xde0a0009  ! 1044: LDUB_R	ldub	[%r8 + %r9], %r15
	.word 0xce020009  ! 1044: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xc4320009  ! 1047: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xe8520009  ! 1047: LDSH_R	ldsh	[%r8 + %r9], %r20
	.word 0xc36a2a34  ! 1047: PREFETCH_I	prefetch	[%r8 + 0x0a34], #one_read
	.word 0xc22a0009  ! 1050: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc20a0009  ! 1050: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0x40000001  ! 1050: CALL	call	disp30_1
	.word 0xcc720009  ! 1053: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc2120009  ! 1053: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xccaa2b30  ! 1053: STBA_I	stba	%r6, [%r8 + 0x0b30] %asi
	.word 0xc4320009  ! 1056: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xd60a0009  ! 1056: LDUB_R	ldub	[%r8 + %r9], %r11
	.word 0xa44a0009  ! 1056: MULX_R	mulx 	%r8, %r9, %r18
	.word 0xf2720009  ! 1059: STX_R	stx	%r25, [%r8 + %r9]
	.word 0xc85a0009  ! 1059: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0x08800001  ! 1059: BLEU	bleu  	<label_0x1>
	.word 0xc33a0009  ! 1062: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc40a0009  ! 1062: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0x83220009  ! 1062: MULScc_R	mulscc 	%r8, %r9, %r1
	.word 0xd6720009  ! 1065: STX_R	stx	%r11, [%r8 + %r9]
	.word 0xf8120009  ! 1065: LDUH_R	lduh	[%r8 + %r9], %r28
	.word 0x34800001  ! 1065: BG	bg,a	<label_0x1>
	.word 0xe42a0009  ! 1068: STB_R	stb	%r18, [%r8 + %r9]
	.word 0xc4420009  ! 1068: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xc3ea2584  ! 1068: PREFETCHA_I	prefetcha	[%r8, + 0x0584] %asi, #one_read
	.word 0xcf220009  ! 1071: STF_R	st	%f7, [%r9, %r8]
	.word 0xd81a0009  ! 1071: LDD_R	ldd	[%r8 + %r9], %r12
	.word 0x85a20829  ! 1071: FADDs	fadds	%f8, %f9, %f2
	.word 0xc82a0009  ! 1074: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xf2120009  ! 1074: LDUH_R	lduh	[%r8 + %r9], %r25
	.word 0x827a0009  ! 1074: SDIV_R	sdiv 	%r8, %r9, %r1
	.word 0xc8720009  ! 1077: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc2520009  ! 1077: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xc36a20fc  ! 1077: PREFETCH_I	prefetch	[%r8 + 0x00fc], #one_read
	.word 0xcb220009  ! 1080: STF_R	st	%f5, [%r9, %r8]
	.word 0xcc4a0009  ! 1080: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xcaaa20cc  ! 1080: STBA_I	stba	%r5, [%r8 + 0x00cc] %asi
	.word 0xfe2a0009  ! 1083: STB_R	stb	%r31, [%r8 + %r9]
	.word 0xcc520009  ! 1083: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xdcf226d0  ! 1083: STXA_I	stxa	%r14, [%r8 + 0x06d0] %asi
	.word 0xcb3a0009  ! 1086: STDF_R	std	%f5, [%r9, %r8]
	.word 0xe31a0009  ! 1086: LDDF_R	ldd	[%r8, %r9], %f17
	.word 0x8143e052  ! 1086: MEMBAR	membar	#StoreLoad | #Lookaside | #Sync 
	.word 0xd6320009  ! 1089: STH_R	sth	%r11, [%r8 + %r9]
	.word 0xcb020009  ! 1089: LDF_R	ld	[%r8, %r9], %f5
	.word 0xc8f22c60  ! 1089: STXA_I	stxa	%r4, [%r8 + 0x0c60] %asi
	.word 0xc9220009  ! 1092: STF_R	st	%f4, [%r9, %r8]
	.word 0xcd1a0009  ! 1092: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xc6922558  ! 1092: LDUHA_I	lduha	[%r8, + 0x0558] %asi, %r3
	.word 0xc4320009  ! 1095: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xda4a0009  ! 1095: LDSB_R	ldsb	[%r8 + %r9], %r13
	.word 0xa07a20dc  ! 1095: SDIV_I	sdiv 	%r8, 0x00dc, %r16
	.word 0xe33a0009  ! 1098: STDF_R	std	%f17, [%r9, %r8]
	.word 0xc85a0009  ! 1098: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0x24ca0001  ! 1098: BRLEZ	brlez,a,pt	%8,<label_0xa0001>
	.word 0xc33a0009  ! 1101: STDF_R	std	%f1, [%r9, %r8]
	.word 0xcd020009  ! 1101: LDF_R	ld	[%r8, %r9], %f6
	.word 0xc3ea2058  ! 1101: PREFETCHA_I	prefetcha	[%r8, + 0x0058] %asi, #one_read
	.word 0xc2320009  ! 1104: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc8020009  ! 1104: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0x867a27c8  ! 1104: SDIV_I	sdiv 	%r8, 0x07c8, %r3
	.word 0xe0220009  ! 1107: STW_R	stw	%r16, [%r8 + %r9]
	.word 0xc6520009  ! 1107: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xc36a0009  ! 1107: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xe02a0009  ! 1110: STB_R	stb	%r16, [%r8 + %r9]
	.word 0xe4420009  ! 1110: LDSW_R	ldsw	[%r8 + %r9], %r18
	.word 0xca921009  ! 1110: LDUHA_R	lduha	[%r8, %r9] 0x80, %r5
	.word 0xca2a0009  ! 1113: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xd9020009  ! 1113: LDF_R	ld	[%r8, %r9], %f12
	.word 0xc3ea2620  ! 1113: PREFETCHA_I	prefetcha	[%r8, + 0x0620] %asi, #one_read
	.word 0xf5220009  ! 1116: STF_R	st	%f26, [%r9, %r8]
	.word 0xc8420009  ! 1116: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xccaa1009  ! 1116: STBA_R	stba	%r6, [%r8 + %r9] 0x80
	.word 0xc62a0009  ! 1119: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xde4a0009  ! 1119: LDSB_R	ldsb	[%r8 + %r9], %r15
	.word 0xc27a0009  ! 1119: SWAP_R	swap	%r1, [%r8 + %r9]
	.word 0xcc320009  ! 1122: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xdf020009  ! 1122: LDF_R	ld	[%r8, %r9], %f15
	.word 0x0cc20001  ! 1122: BRGZ	brgz  ,nt	%8,<label_0x20001>
	.word 0xca220009  ! 1125: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc85a0009  ! 1125: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xc3e22009  ! 1125: CASA_R	casa	[%r8] %asi, %r9, %r1
	.word 0xd8720009  ! 1128: STX_R	stx	%r12, [%r8 + %r9]
	.word 0xcc4a0009  ! 1128: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xc6822800  ! 1128: LDUWA_I	lduwa	[%r8, + 0x0800] %asi, %r3
	.word 0xf42a0009  ! 1131: STB_R	stb	%r26, [%r8 + %r9]
	.word 0xcc4a0009  ! 1131: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xc66a0009  ! 1131: LDSTUB_R	ldstub	%r3, [%r8 + %r9]
	.word 0xc6320009  ! 1134: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xcc520009  ! 1134: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0x88f22474  ! 1134: UDIVcc_I	udivcc 	%r8, 0x0474, %r4
	.word 0xc4320009  ! 1137: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xda5a0009  ! 1137: LDX_R	ldx	[%r8 + %r9], %r13
	.word 0xdcea205c  ! 1137: LDSTUBA_I	ldstuba	%r14, [%r8 + 0x005c] %asi
	.word 0xce220009  ! 1140: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xf64a0009  ! 1140: LDSB_R	ldsb	[%r8 + %r9], %r27
	.word 0x06800002  ! 1140: BL	bl  	<label_0x2>
	.word 0xc5220009  ! 1143: STF_R	st	%f2, [%r9, %r8]
	.word 0xd80a0009  ! 1143: LDUB_R	ldub	[%r8 + %r9], %r12
	.word 0x85a20829  ! 1143: FADDs	fadds	%f8, %f9, %f2
	.word 0xce220009  ! 1146: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xcc1a0009  ! 1146: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xce4a0009  ! 1146: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xc2320009  ! 1149: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xfc1a0009  ! 1149: LDD_R	ldd	[%r8 + %r9], %r30
	.word 0x852228e4  ! 1149: MULScc_I	mulscc 	%r8, 0x08e4, %r2
	.word 0xc6720009  ! 1152: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xe6420009  ! 1152: LDSW_R	ldsw	[%r8 + %r9], %r19
	.word 0x26800001  ! 1152: BL	bl,a	<label_0x1>
	.word 0xc53a0009  ! 1155: STDF_R	std	%f2, [%r9, %r8]
	.word 0xca420009  ! 1155: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xeaca273c  ! 1155: LDSBA_I	ldsba	[%r8, + 0x073c] %asi, %r21
	.word 0xcc2a0009  ! 1158: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xce420009  ! 1158: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xccf21009  ! 1158: STXA_R	stxa	%r6, [%r8 + %r9] 0x80
	.word 0xfb220009  ! 1161: STF_R	st	%f29, [%r9, %r8]
	.word 0xcb1a0009  ! 1161: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xbefa200c  ! 1161: SDIVcc_I	sdivcc 	%r8, 0x000c, %r31
	.word 0xca2a0009  ! 1164: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xca020009  ! 1164: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0x8143e035  ! 1164: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside | #MemIssue 
	.word 0xf42a0009  ! 1167: STB_R	stb	%r26, [%r8 + %r9]
	.word 0xe85a0009  ! 1167: LDX_R	ldx	[%r8 + %r9], %r20
	.word 0xf4b22aec  ! 1167: STHA_I	stha	%r26, [%r8 + 0x0aec] %asi
	.word 0xf0720009  ! 1170: STX_R	stx	%r24, [%r8 + %r9]
	.word 0xce020009  ! 1170: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0x22800002  ! 1170: BE	be,a	<label_0x2>
	.word 0xc73a0009  ! 1173: STDF_R	std	%f3, [%r9, %r8]
	.word 0xec1a0009  ! 1173: LDD_R	ldd	[%r8 + %r9], %r22
	.word 0xcef21009  ! 1173: STXA_R	stxa	%r7, [%r8 + %r9] 0x80
	.word 0xc22a0009  ! 1176: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc6020009  ! 1176: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0x84fa2700  ! 1176: SDIVcc_I	sdivcc 	%r8, 0x0700, %r2
	.word 0xc5220009  ! 1179: STF_R	st	%f2, [%r9, %r8]
	.word 0xf6420009  ! 1179: LDSW_R	ldsw	[%r8 + %r9], %r27
	.word 0x867a0009  ! 1179: SDIV_R	sdiv 	%r8, %r9, %r3
	.word 0xc8720009  ! 1182: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc85a0009  ! 1182: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xc89a1009  ! 1182: LDDA_R	ldda	[%r8, %r9] 0x80, %r4
	.word 0xc6720009  ! 1185: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xfc1a0009  ! 1185: LDD_R	ldd	[%r8 + %r9], %r30
	.word 0x8143e01d  ! 1185: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside 
	.word 0xc6220009  ! 1188: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xdc020009  ! 1188: LDUW_R	lduw	[%r8 + %r9], %r14
	.word 0xe8ba2d68  ! 1188: STDA_I	stda	%r20, [%r8 + 0x0d68] %asi
	.word 0xc7220009  ! 1191: STF_R	st	%f3, [%r9, %r8]
	.word 0xc65a0009  ! 1191: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0x8143c000  ! 1191: STBAR	stbar
	.word 0xc7220009  ! 1194: STF_R	st	%f3, [%r9, %r8]
	.word 0xf4120009  ! 1194: LDUH_R	lduh	[%r8 + %r9], %r26
	.word 0x8c5a2aec  ! 1194: SMUL_I	smul 	%r8, 0x0aec, %r6
	.word 0xcc2a0009  ! 1197: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xec420009  ! 1197: LDSW_R	ldsw	[%r8 + %r9], %r22
	.word 0x26800001  ! 1197: BL	bl,a	<label_0x1>
	.word 0xc22a0009  ! 1200: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xce4a0009  ! 1200: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0x8143c000  ! 1200: STBAR	stbar
	.word 0xc2320009  ! 1203: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xf4520009  ! 1203: LDSH_R	ldsh	[%r8 + %r9], %r26
	.word 0xba4a2610  ! 1203: MULX_I	mulx 	%r8, 0x0610, %r29
	.word 0xc6220009  ! 1206: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc6020009  ! 1206: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xc3ea1009  ! 1206: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xe02a0009  ! 1209: STB_R	stb	%r16, [%r8 + %r9]
	.word 0xce520009  ! 1209: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0x8a6a2d3c  ! 1209: UDIVX_I	udivx 	%r8, 0x0d3c, %r5
	.word 0xc9220009  ! 1212: STF_R	st	%f4, [%r9, %r8]
	.word 0xfd1a0009  ! 1212: LDDF_R	ldd	[%r8, %r9], %f30
	.word 0x84722580  ! 1212: UDIV_I	udiv 	%r8, 0x0580, %r2
	.word 0xda2a0009  ! 1215: STB_R	stb	%r13, [%r8 + %r9]
	.word 0xce0a0009  ! 1215: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0x845a2380  ! 1215: SMUL_I	smul 	%r8, 0x0380, %r2
	.word 0xec720009  ! 1218: STX_R	stx	%r22, [%r8 + %r9]
	.word 0xea4a0009  ! 1218: LDSB_R	ldsb	[%r8 + %r9], %r21
	.word 0xced224b8  ! 1218: LDSHA_I	ldsha	[%r8, + 0x04b8] %asi, %r7
	.word 0xca2a0009  ! 1221: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xf2120009  ! 1221: LDUH_R	lduh	[%r8 + %r9], %r25
	.word 0xc3ea1009  ! 1221: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc82a0009  ! 1224: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xec020009  ! 1224: LDUW_R	lduw	[%r8 + %r9], %r22
	.word 0xc8ea2acc  ! 1224: LDSTUBA_I	ldstuba	%r4, [%r8 + 0x0acc] %asi
	.word 0xc5220009  ! 1227: STF_R	st	%f2, [%r9, %r8]
	.word 0xcb020009  ! 1227: LDF_R	ld	[%r8, %r9], %f5
	.word 0xc26a2ff0  ! 1227: LDSTUB_I	ldstub	%r1, [%r8 + 0x0ff0]
	.word 0xc93a0009  ! 1230: STDF_R	std	%f4, [%r9, %r8]
	.word 0xfe0a0009  ! 1230: LDUB_R	ldub	[%r8 + %r9], %r31
	.word 0xc3ea23fc  ! 1230: PREFETCHA_I	prefetcha	[%r8, + 0x03fc] %asi, #one_read
	.word 0xc8720009  ! 1233: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xee0a0009  ! 1233: LDUB_R	ldub	[%r8 + %r9], %r23
	.word 0x32800001  ! 1233: BNE	bne,a	<label_0x1>
	.word 0xf2220009  ! 1236: STW_R	stw	%r25, [%r8 + %r9]
	.word 0xec0a0009  ! 1236: LDUB_R	ldub	[%r8 + %r9], %r22
	.word 0x8143e07f  ! 1236: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xcc320009  ! 1239: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc91a0009  ! 1239: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xc68a2058  ! 1239: LDUBA_I	lduba	[%r8, + 0x0058] %asi, %r3
	.word 0xce720009  ! 1242: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc8020009  ! 1242: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xc3ea1009  ! 1242: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xca320009  ! 1245: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xce520009  ! 1245: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xc2c222fc  ! 1245: LDSWA_I	ldswa	[%r8, + 0x02fc] %asi, %r1
	.word 0xfc720009  ! 1248: STX_R	stx	%r30, [%r8 + %r9]
	.word 0xc2520009  ! 1248: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xced21009  ! 1248: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r7
	.word 0xe8320009  ! 1251: STH_R	sth	%r20, [%r8 + %r9]
	.word 0xce520009  ! 1251: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0x9c5a2084  ! 1251: SMUL_I	smul 	%r8, 0x0084, %r14
	.word 0xf6220009  ! 1254: STW_R	stw	%r27, [%r8 + %r9]
	.word 0xcd020009  ! 1254: LDF_R	ld	[%r8, %r9], %f6
	.word 0xcaea24cc  ! 1254: LDSTUBA_I	ldstuba	%r5, [%r8 + 0x04cc] %asi
	.word 0xef3a0009  ! 1257: STDF_R	std	%f23, [%r9, %r8]
	.word 0xe4020009  ! 1257: LDUW_R	lduw	[%r8 + %r9], %r18
	.word 0xf452216c  ! 1257: LDSH_I	ldsh	[%r8 + 0x016c], %r26
	.word 0xcc2a0009  ! 1260: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc2120009  ! 1260: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xd93a0009  ! 1260: STDF_R	std	%f12, [%r9, %r8]
	.word 0xf9220009  ! 1263: STF_R	st	%f28, [%r9, %r8]
	.word 0xf9020009  ! 1263: LDF_R	ld	[%r8, %r9], %f28
	.word 0xd8ea2e1c  ! 1263: LDSTUBA_I	ldstuba	%r12, [%r8 + 0x0e1c] %asi
	.word 0xcc2a0009  ! 1266: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc4120009  ! 1266: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0x85222bf0  ! 1266: MULScc_I	mulscc 	%r8, 0x0bf0, %r2
	.word 0xcc720009  ! 1269: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xec120009  ! 1269: LDUH_R	lduh	[%r8 + %r9], %r22
	.word 0x85a208a9  ! 1269: FSUBs	fsubs	%f8, %f9, %f2
	.word 0xf8320009  ! 1272: STH_R	sth	%r28, [%r8 + %r9]
	.word 0xca4a0009  ! 1272: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0x9e520009  ! 1272: UMUL_R	umul 	%r8, %r9, %r15
	.word 0xc42a0009  ! 1275: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xca120009  ! 1275: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xacfa0009  ! 1275: SDIVcc_R	sdivcc 	%r8, %r9, %r22
	.word 0xc33a0009  ! 1278: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc84a0009  ! 1278: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0x08800002  ! 1278: BLEU	bleu  	<label_0x2>
	.word 0xdb3a0009  ! 1281: STDF_R	std	%f13, [%r9, %r8]
	.word 0xd84a0009  ! 1281: LDSB_R	ldsb	[%r8 + %r9], %r12
	.word 0xced21009  ! 1281: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r7
	.word 0xcc720009  ! 1284: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc9020009  ! 1284: LDF_R	ld	[%r8, %r9], %f4
	.word 0xa4d20009  ! 1284: UMULcc_R	umulcc 	%r8, %r9, %r18
	.word 0xce220009  ! 1287: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc2020009  ! 1287: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0x864a0009  ! 1287: MULX_R	mulx 	%r8, %r9, %r3
	.word 0xcc320009  ! 1290: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc31a0009  ! 1290: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xc9020009  ! 1290: LDF_R	ld	[%r8, %r9], %f4
	.word 0xcd220009  ! 1293: STF_R	st	%f6, [%r9, %r8]
	.word 0xcc420009  ! 1293: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xafa209a9  ! 1293: FDIVs	fdivs	%f8, %f9, %f23
	.word 0xcc220009  ! 1296: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc2120009  ! 1296: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0x8143c000  ! 1296: STBAR	stbar
	.word 0xfe2a0009  ! 1299: STB_R	stb	%r31, [%r8 + %r9]
	.word 0xfc4a0009  ! 1299: LDSB_R	ldsb	[%r8 + %r9], %r30
	.word 0xccaa29b0  ! 1299: STBA_I	stba	%r6, [%r8 + 0x09b0] %asi
	.word 0xf82a0009  ! 1302: STB_R	stb	%r28, [%r8 + %r9]
	.word 0xcc4a0009  ! 1302: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xc4921009  ! 1302: LDUHA_R	lduha	[%r8, %r9] 0x80, %r2
	.word 0xc93a0009  ! 1305: STDF_R	std	%f4, [%r9, %r8]
	.word 0xc3020009  ! 1305: LDF_R	ld	[%r8, %r9], %f1
	.word 0xccda2ad8  ! 1305: LDXA_I	ldxa	[%r8, + 0x0ad8] %asi, %r6
	.word 0xca220009  ! 1308: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xce4a0009  ! 1308: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xc4f22e40  ! 1308: STXA_I	stxa	%r2, [%r8 + 0x0e40] %asi
	.word 0xc6220009  ! 1311: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xde420009  ! 1311: LDSW_R	ldsw	[%r8 + %r9], %r15
	.word 0x87a209a9  ! 1311: FDIVs	fdivs	%f8, %f9, %f3
	.word 0xcc2a0009  ! 1314: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc80a0009  ! 1314: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0x967a25f0  ! 1314: SDIV_I	sdiv 	%r8, 0x05f0, %r11
	.word 0xc82a0009  ! 1317: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xdf1a0009  ! 1317: LDDF_R	ldd	[%r8, %r9], %f15
	.word 0x04800001  ! 1317: BLE	ble  	<label_0x1>
	.word 0xcb220009  ! 1320: STF_R	st	%f5, [%r9, %r8]
	.word 0xcc420009  ! 1320: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xde120009  ! 1320: LDUH_R	lduh	[%r8 + %r9], %r15
	.word 0xdb220009  ! 1323: STF_R	st	%f13, [%r9, %r8]
	.word 0xf41a0009  ! 1323: LDD_R	ldd	[%r8 + %r9], %r26
	.word 0xfc4a292c  ! 1323: LDSB_I	ldsb	[%r8 + 0x092c], %r30
	.word 0xca2a0009  ! 1326: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xca520009  ! 1326: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xbf6a225c  ! 1326: SDIVX_I	sdivx	%r8, 0x025c, %r31
	.word 0xe13a0009  ! 1329: STDF_R	std	%f16, [%r9, %r8]
	.word 0xc2520009  ! 1329: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xce422774  ! 1329: LDSW_I	ldsw	[%r8 + 0x0774], %r7
	.word 0xca2a0009  ! 1332: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xda4a0009  ! 1332: LDSB_R	ldsb	[%r8 + %r9], %r13
	.word 0xc6ea1009  ! 1332: LDSTUBA_R	ldstuba	%r3, [%r8 + %r9] 0x80
	.word 0xcf220009  ! 1335: STF_R	st	%f7, [%r9, %r8]
	.word 0xcc420009  ! 1335: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xda6a0009  ! 1335: LDSTUB_R	ldstub	%r13, [%r8 + %r9]
	.word 0xcd3a0009  ! 1338: STDF_R	std	%f6, [%r9, %r8]
	.word 0xcc4a0009  ! 1338: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xecaa1009  ! 1338: STBA_R	stba	%r22, [%r8 + %r9] 0x80
	.word 0xc8720009  ! 1341: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc6020009  ! 1341: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0x876a29dc  ! 1341: SDIVX_I	sdivx	%r8, 0x09dc, %r3
	.word 0xc8220009  ! 1344: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xce020009  ! 1344: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0x826a0009  ! 1344: UDIVX_R	udivx 	%r8, %r9, %r1
	.word 0xc42a0009  ! 1347: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xce120009  ! 1347: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xc3ea260c  ! 1347: PREFETCHA_I	prefetcha	[%r8, + 0x060c] %asi, #one_read
	.word 0xc73a0009  ! 1350: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc4520009  ! 1350: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xc7022588  ! 1350: LDF_I	ld	[%r8, 0x0588], %f3
	.word 0xfc2a0009  ! 1353: STB_R	stb	%r30, [%r8 + %r9]
	.word 0xce120009  ! 1353: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xe4ba1009  ! 1353: STDA_R	stda	%r18, [%r8 + %r9] 0x80
	.word 0xc7220009  ! 1356: STF_R	st	%f3, [%r9, %r8]
	.word 0xe85a0009  ! 1356: LDX_R	ldx	[%r8 + %r9], %r20
	.word 0xc4ea1009  ! 1356: LDSTUBA_R	ldstuba	%r2, [%r8 + %r9] 0x80
	.word 0xc73a0009  ! 1359: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc91a0009  ! 1359: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0x8143c000  ! 1359: STBAR	stbar
	.word 0xcb220009  ! 1362: STF_R	st	%f5, [%r9, %r8]
	.word 0xc4020009  ! 1362: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xcaea1009  ! 1362: LDSTUBA_R	ldstuba	%r5, [%r8 + %r9] 0x80
	.word 0xfe320009  ! 1365: STH_R	sth	%r31, [%r8 + %r9]
	.word 0xc41a0009  ! 1365: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xa0720009  ! 1365: UDIV_R	udiv 	%r8, %r9, %r16
	.word 0xc2720009  ! 1368: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xcf1a0009  ! 1368: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xbada2ce0  ! 1368: SMULcc_I	smulcc 	%r8, 0x0ce0, %r29
	.word 0xc9220009  ! 1371: STF_R	st	%f4, [%r9, %r8]
	.word 0xf0520009  ! 1371: LDSH_R	ldsh	[%r8 + %r9], %r24
	.word 0xa3222c3c  ! 1371: MULScc_I	mulscc 	%r8, 0x0c3c, %r17
	.word 0xe82a0009  ! 1374: STB_R	stb	%r20, [%r8 + %r9]
	.word 0xea420009  ! 1374: LDSW_R	ldsw	[%r8 + %r9], %r21
	.word 0xc4f22ed8  ! 1374: STXA_I	stxa	%r2, [%r8 + 0x0ed8] %asi
	.word 0xce320009  ! 1377: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xee0a0009  ! 1377: LDUB_R	ldub	[%r8 + %r9], %r23
	.word 0x08800001  ! 1377: BLEU	bleu  	<label_0x1>
	.word 0xf62a0009  ! 1380: STB_R	stb	%r27, [%r8 + %r9]
	.word 0xce120009  ! 1380: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0x84fa2f40  ! 1380: SDIVcc_I	sdivcc 	%r8, 0x0f40, %r2
	.word 0xc73a0009  ! 1383: STDF_R	std	%f3, [%r9, %r8]
	.word 0xcd1a0009  ! 1383: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xc6520009  ! 1383: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xc22a0009  ! 1386: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc60a0009  ! 1386: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xc36a0009  ! 1386: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xcb3a0009  ! 1389: STDF_R	std	%f5, [%r9, %r8]
	.word 0xf6020009  ! 1389: LDUW_R	lduw	[%r8 + %r9], %r27
	.word 0xc3ea274c  ! 1389: PREFETCHA_I	prefetcha	[%r8, + 0x074c] %asi, #one_read
	.word 0xcf3a0009  ! 1392: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc65a0009  ! 1392: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xc73a2260  ! 1392: STDF_I	std	%f3, [0x0260, %r8]
	.word 0xca2a0009  ! 1395: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xcc1a0009  ! 1395: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xbd6a2b20  ! 1395: SDIVX_I	sdivx	%r8, 0x0b20, %r30
	.word 0xe5220009  ! 1398: STF_R	st	%f18, [%r9, %r8]
	.word 0xf2420009  ! 1398: LDSW_R	ldsw	[%r8 + %r9], %r25
	.word 0x38800001  ! 1398: BGU	bgu,a	<label_0x1>
	.word 0xcf220009  ! 1401: STF_R	st	%f7, [%r9, %r8]
	.word 0xec1a0009  ! 1401: LDD_R	ldd	[%r8 + %r9], %r22
	.word 0x20800002  ! 1401: BN	bn,a	<label_0x2>
	.word 0xcc720009  ! 1404: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc6020009  ! 1404: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xecda1009  ! 1404: LDXA_R	ldxa	[%r8, %r9] 0x80, %r22
	.word 0xf4720009  ! 1407: STX_R	stx	%r26, [%r8 + %r9]
	.word 0xeb1a0009  ! 1407: LDDF_R	ldd	[%r8, %r9], %f21
	.word 0xfe0a0009  ! 1407: LDUB_R	ldub	[%r8 + %r9], %r31
	.word 0xca320009  ! 1410: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xe81a0009  ! 1410: LDD_R	ldd	[%r8 + %r9], %r20
	.word 0xca5a2d58  ! 1410: LDX_I	ldx	[%r8 + 0x0d58], %r5
	.word 0xcc220009  ! 1413: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xfd020009  ! 1413: LDF_R	ld	[%r8, %r9], %f30
	.word 0x8143c000  ! 1413: STBAR	stbar
	.word 0xdc720009  ! 1416: STX_R	stx	%r14, [%r8 + %r9]
	.word 0xe24a0009  ! 1416: LDSB_R	ldsb	[%r8 + %r9], %r17
	.word 0xc36a2140  ! 1416: PREFETCH_I	prefetch	[%r8 + 0x0140], #one_read
	.word 0xce2a0009  ! 1419: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xce420009  ! 1419: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xc3ea2c28  ! 1419: PREFETCHA_I	prefetcha	[%r8, + 0x0c28] %asi, #one_read
	.word 0xc6720009  ! 1422: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xce120009  ! 1422: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0x8143e062  ! 1422: MEMBAR	membar	#StoreLoad | #MemIssue | #Sync 
	.word 0xe4720009  ! 1425: STX_R	stx	%r18, [%r8 + %r9]
	.word 0xc71a0009  ! 1425: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xce420009  ! 1425: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xcc220009  ! 1428: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xcb1a0009  ! 1428: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0x8c522d60  ! 1428: UMUL_I	umul 	%r8, 0x0d60, %r6
	.word 0xca220009  ! 1431: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xca420009  ! 1431: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0x84722f14  ! 1431: UDIV_I	udiv 	%r8, 0x0f14, %r2
	.word 0xe0220009  ! 1434: STW_R	stw	%r16, [%r8 + %r9]
	.word 0xd84a0009  ! 1434: LDSB_R	ldsb	[%r8 + %r9], %r12
	.word 0xcf222ad8  ! 1434: STF_I	st	%f7, [0x0ad8, %r8]
	.word 0xc4220009  ! 1437: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xce0a0009  ! 1437: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xdf220009  ! 1437: STF_R	st	%f15, [%r9, %r8]
	.word 0xca2a0009  ! 1440: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xe81a0009  ! 1440: LDD_R	ldd	[%r8 + %r9], %r20
	.word 0x8143c000  ! 1440: STBAR	stbar
	.word 0xc4320009  ! 1443: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xd85a0009  ! 1443: LDX_R	ldx	[%r8 + %r9], %r12
	.word 0xc36a2e80  ! 1443: PREFETCH_I	prefetch	[%r8 + 0x0e80], #one_read
	.word 0xc4220009  ! 1446: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc4420009  ! 1446: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0x22800001  ! 1446: BE	be,a	<label_0x1>
	.word 0xde720009  ! 1449: STX_R	stx	%r15, [%r8 + %r9]
	.word 0xce420009  ! 1449: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0x8a6a2d54  ! 1449: UDIVX_I	udivx 	%r8, 0x0d54, %r5
	.word 0xd8320009  ! 1452: STH_R	sth	%r12, [%r8 + %r9]
	.word 0xc25a0009  ! 1452: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0x8143e070  ! 1452: MEMBAR	membar	#Lookaside | #MemIssue | #Sync 
	.word 0xca320009  ! 1455: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc41a0009  ! 1455: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xccf21009  ! 1455: STXA_R	stxa	%r6, [%r8 + %r9] 0x80
	.word 0xcf3a0009  ! 1458: STDF_R	std	%f7, [%r9, %r8]
	.word 0xcb1a0009  ! 1458: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0x84fa2768  ! 1458: SDIVcc_I	sdivcc 	%r8, 0x0768, %r2
	.word 0xfd220009  ! 1461: STF_R	st	%f30, [%r9, %r8]
	.word 0xc80a0009  ! 1461: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xc2b21009  ! 1461: STHA_R	stha	%r1, [%r8 + %r9] 0x80
	.word 0xe4220009  ! 1464: STW_R	stw	%r18, [%r8 + %r9]
	.word 0xca420009  ! 1464: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xcbf22009  ! 1464: CASXA_R	casxa	[%r8]%asi, %r9, %r5
	.word 0xc9220009  ! 1467: STF_R	st	%f4, [%r9, %r8]
	.word 0xc91a0009  ! 1467: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0x8c720009  ! 1467: UDIV_R	udiv 	%r8, %r9, %r6
	.word 0xc93a0009  ! 1470: STDF_R	std	%f4, [%r9, %r8]
	.word 0xde020009  ! 1470: LDUW_R	lduw	[%r8 + %r9], %r15
	.word 0x82fa2ac4  ! 1470: SDIVcc_I	sdivcc 	%r8, 0x0ac4, %r1
	.word 0xc22a0009  ! 1473: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xfd020009  ! 1473: LDF_R	ld	[%r8, %r9], %f30
	.word 0xc8120009  ! 1473: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xc4220009  ! 1476: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xf91a0009  ! 1476: LDDF_R	ldd	[%r8, %r9], %f28
	.word 0xc93a0009  ! 1476: STDF_R	std	%f4, [%r9, %r8]
	.word 0xf0720009  ! 1479: STX_R	stx	%r24, [%r8 + %r9]
	.word 0xfb020009  ! 1479: LDF_R	ld	[%r8, %r9], %f29
	.word 0xe89a25f0  ! 1479: LDDA_I	ldda	[%r8, + 0x05f0] %asi, %r20
	.word 0xf33a0009  ! 1482: STDF_R	std	%f25, [%r9, %r8]
	.word 0xc4520009  ! 1482: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0x0e800001  ! 1482: BVS	bvs  	<label_0x1>
	.word 0xcc320009  ! 1485: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xe6020009  ! 1485: LDUW_R	lduw	[%r8 + %r9], %r19
	.word 0x99220009  ! 1485: MULScc_R	mulscc 	%r8, %r9, %r12
	.word 0xf53a0009  ! 1488: STDF_R	std	%f26, [%r9, %r8]
	.word 0xcf020009  ! 1488: LDF_R	ld	[%r8, %r9], %f7
	.word 0x2cc20001  ! 1488: BRGZ	brgz,a,nt	%8,<label_0x20001>
	.word 0xd6720009  ! 1491: STX_R	stx	%r11, [%r8 + %r9]
	.word 0xfd020009  ! 1491: LDF_R	ld	[%r8, %r9], %f30
	.word 0xc6921009  ! 1491: LDUHA_R	lduha	[%r8, %r9] 0x80, %r3
	.word 0xca220009  ! 1494: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xe01a0009  ! 1494: LDD_R	ldd	[%r8 + %r9], %r16
	.word 0x8143c000  ! 1494: STBAR	stbar
	.word 0xc73a0009  ! 1497: STDF_R	std	%f3, [%r9, %r8]
	.word 0xcf1a0009  ! 1497: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0x8e520009  ! 1497: UMUL_R	umul 	%r8, %r9, %r7
	.word 0xe53a0009  ! 1500: STDF_R	std	%f18, [%r9, %r8]
	.word 0xc2020009  ! 1500: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xc3ea278c  ! 1500: PREFETCHA_I	prefetcha	[%r8, + 0x078c] %asi, #one_read
	.word 0xce720009  ! 1503: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xea020009  ! 1503: LDUW_R	lduw	[%r8 + %r9], %r21
	.word 0xc46a0009  ! 1503: LDSTUB_R	ldstub	%r2, [%r8 + %r9]
	.word 0xcc320009  ! 1506: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xe51a0009  ! 1506: LDDF_R	ldd	[%r8, %r9], %f18
	.word 0xe40a0009  ! 1506: LDUB_R	ldub	[%r8 + %r9], %r18
	.word 0xce720009  ! 1509: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc4020009  ! 1509: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xc3ea2218  ! 1509: PREFETCHA_I	prefetcha	[%r8, + 0x0218] %asi, #one_read
	.word 0xc2720009  ! 1512: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc64a0009  ! 1512: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xa65a2e0c  ! 1512: SMUL_I	smul 	%r8, 0x0e0c, %r19
	.word 0xc6220009  ! 1515: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xce120009  ! 1515: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0x8af22b28  ! 1515: UDIVcc_I	udivcc 	%r8, 0x0b28, %r5
	.word 0xc4220009  ! 1518: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc64a0009  ! 1518: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xe33a0009  ! 1518: STDF_R	std	%f17, [%r9, %r8]
	.word 0xc6220009  ! 1521: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xf4520009  ! 1521: LDSH_R	ldsh	[%r8 + %r9], %r26
	.word 0x00800001  ! 1521: BN	bn  	<label_0x1>
	.word 0xc8320009  ! 1524: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xca520009  ! 1524: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0x8e5a23b8  ! 1524: SMUL_I	smul 	%r8, 0x03b8, %r7
	.word 0xc5220009  ! 1527: STF_R	st	%f2, [%r9, %r8]
	.word 0xfd1a0009  ! 1527: LDDF_R	ldd	[%r8, %r9], %f30
	.word 0x8143e056  ! 1527: MEMBAR	membar	#StoreLoad | #LoadStore | #Lookaside | #Sync 
	.word 0xe6320009  ! 1530: STH_R	sth	%r19, [%r8 + %r9]
	.word 0xf71a0009  ! 1530: LDDF_R	ldd	[%r8, %r9], %f27
	.word 0x2a800001  ! 1530: BCS	bcs,a	<label_0x1>
	.word 0xd93a0009  ! 1533: STDF_R	std	%f12, [%r9, %r8]
	.word 0xc5020009  ! 1533: LDF_R	ld	[%r8, %r9], %f2
	.word 0x8143c000  ! 1533: STBAR	stbar
	.word 0xc7220009  ! 1536: STF_R	st	%f3, [%r9, %r8]
	.word 0xc3020009  ! 1536: LDF_R	ld	[%r8, %r9], %f1
	.word 0xca6a245c  ! 1536: LDSTUB_I	ldstub	%r5, [%r8 + 0x045c]
	.word 0xc6220009  ! 1539: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xdd020009  ! 1539: LDF_R	ld	[%r8, %r9], %f14
	.word 0xc8f21009  ! 1539: STXA_R	stxa	%r4, [%r8 + %r9] 0x80
	.word 0xd8320009  ! 1542: STH_R	sth	%r12, [%r8 + %r9]
	.word 0xca0a0009  ! 1542: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xdea21009  ! 1542: STWA_R	stwa	%r15, [%r8 + %r9] 0x80
	.word 0xee220009  ! 1545: STW_R	stw	%r23, [%r8 + %r9]
	.word 0xc25a0009  ! 1545: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0x2eca0001  ! 1545: BRGEZ	brgez,a,pt	%8,<label_0xa0001>
	.word 0xca720009  ! 1548: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xd6420009  ! 1548: LDSW_R	ldsw	[%r8 + %r9], %r11
	.word 0xc4aa2d44  ! 1548: STBA_I	stba	%r2, [%r8 + 0x0d44] %asi
	.word 0xc7220009  ! 1551: STF_R	st	%f3, [%r9, %r8]
	.word 0xce0a0009  ! 1551: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0x98fa0009  ! 1551: SDIVcc_R	sdivcc 	%r8, %r9, %r12
	.word 0xc2220009  ! 1554: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xca0a0009  ! 1554: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xdcba21b8  ! 1554: STDA_I	stda	%r14, [%r8 + 0x01b8] %asi
	.word 0xe6720009  ! 1557: STX_R	stx	%r19, [%r8 + %r9]
	.word 0xc71a0009  ! 1557: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xc8f21009  ! 1557: STXA_R	stxa	%r4, [%r8 + %r9] 0x80
	.word 0xca720009  ! 1560: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc71a0009  ! 1560: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0x2aca0001  ! 1560: BRNZ	brnz,a,pt	%8,<label_0xa0001>
	.word 0xcf220009  ! 1563: STF_R	st	%f7, [%r9, %r8]
	.word 0xc4020009  ! 1563: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xc3ea1009  ! 1563: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xcc320009  ! 1566: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xde5a0009  ! 1566: LDX_R	ldx	[%r8 + %r9], %r15
	.word 0xba6a21a8  ! 1566: UDIVX_I	udivx 	%r8, 0x01a8, %r29
	.word 0xed220009  ! 1569: STF_R	st	%f22, [%r9, %r8]
	.word 0xc3020009  ! 1569: LDF_R	ld	[%r8, %r9], %f1
	.word 0x8143e073  ! 1569: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside | #MemIssue | #Sync 
	.word 0xcb3a0009  ! 1572: STDF_R	std	%f5, [%r9, %r8]
	.word 0xef020009  ! 1572: LDF_R	ld	[%r8, %r9], %f23
	.word 0x86f20009  ! 1572: UDIVcc_R	udivcc 	%r8, %r9, %r3
	.word 0xc8720009  ! 1575: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xce020009  ! 1575: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xc66a0009  ! 1575: LDSTUB_R	ldstub	%r3, [%r8 + %r9]
	.word 0xce220009  ! 1578: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc71a0009  ! 1578: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0x88720009  ! 1578: UDIV_R	udiv 	%r8, %r9, %r4
	.word 0xc8320009  ! 1581: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xfb020009  ! 1581: LDF_R	ld	[%r8, %r9], %f29
	.word 0xcad22440  ! 1581: LDSHA_I	ldsha	[%r8, + 0x0440] %asi, %r5
	.word 0xc4720009  ! 1584: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xe81a0009  ! 1584: LDD_R	ldd	[%r8 + %r9], %r20
	.word 0xca022684  ! 1584: LDUW_I	lduw	[%r8 + 0x0684], %r5
	.word 0xe73a0009  ! 1587: STDF_R	std	%f19, [%r9, %r8]
	.word 0xcc4a0009  ! 1587: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xccea2734  ! 1587: LDSTUBA_I	ldstuba	%r6, [%r8 + 0x0734] %asi
	.word 0xd93a0009  ! 1590: STDF_R	std	%f12, [%r9, %r8]
	.word 0xc8420009  ! 1590: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0x885a0009  ! 1590: SMUL_R	smul 	%r8, %r9, %r4
	.word 0xce720009  ! 1593: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xea520009  ! 1593: LDSH_R	ldsh	[%r8 + %r9], %r21
	.word 0xd80a0009  ! 1593: LDUB_R	ldub	[%r8 + %r9], %r12
	.word 0xcc720009  ! 1596: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xe4420009  ! 1596: LDSW_R	ldsw	[%r8 + %r9], %r18
	.word 0xc36a0009  ! 1596: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xca2a0009  ! 1599: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xcc120009  ! 1599: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xc2fa28f4  ! 1599: SWAPA_I	swapa	%r1, [%r8 + 0x08f4] %asi
	.word 0xc7220009  ! 1602: STF_R	st	%f3, [%r9, %r8]
	.word 0xf0020009  ! 1602: LDUW_R	lduw	[%r8 + %r9], %r24
	.word 0x845a0009  ! 1602: SMUL_R	smul 	%r8, %r9, %r2
	.word 0xc62a0009  ! 1605: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xce0a0009  ! 1605: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0x86520009  ! 1605: UMUL_R	umul 	%r8, %r9, %r3
	.word 0xc42a0009  ! 1608: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xcf1a0009  ! 1608: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0x8f220009  ! 1608: MULScc_R	mulscc 	%r8, %r9, %r7
	.word 0xc62a0009  ! 1611: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xf41a0009  ! 1611: LDD_R	ldd	[%r8 + %r9], %r26
	.word 0xc36a2afc  ! 1611: PREFETCH_I	prefetch	[%r8 + 0x0afc], #one_read
	.word 0xc3220009  ! 1614: STF_R	st	%f1, [%r9, %r8]
	.word 0xd91a0009  ! 1614: LDDF_R	ldd	[%r8, %r9], %f12
	.word 0xc9f22009  ! 1614: CASXA_R	casxa	[%r8]%asi, %r9, %r4
	.word 0xfd3a0009  ! 1617: STDF_R	std	%f30, [%r9, %r8]
	.word 0xc51a0009  ! 1617: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xc01a0009  ! 1617: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0xc2220009  ! 1620: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xe04a0009  ! 1620: LDSB_R	ldsb	[%r8 + %r9], %r16
	.word 0xcea21009  ! 1620: STWA_R	stwa	%r7, [%r8 + %r9] 0x80
	.word 0xd6720009  ! 1623: STX_R	stx	%r11, [%r8 + %r9]
	.word 0xcb1a0009  ! 1623: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0x8143c000  ! 1623: STBAR	stbar
	.word 0xce720009  ! 1626: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc2120009  ! 1626: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0x8143e037  ! 1626: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside | #MemIssue 
	.word 0xca320009  ! 1629: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xea4a0009  ! 1629: LDSB_R	ldsb	[%r8 + %r9], %r21
	.word 0x84f20009  ! 1629: UDIVcc_R	udivcc 	%r8, %r9, %r2
	.word 0xc4720009  ! 1632: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc6120009  ! 1632: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xc4a223b0  ! 1632: STWA_I	stwa	%r2, [%r8 + 0x03b0] %asi
	.word 0xc4320009  ! 1635: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc64a0009  ! 1635: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0x9c5a2e74  ! 1635: SMUL_I	smul 	%r8, 0x0e74, %r14
	.word 0xca220009  ! 1638: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xce120009  ! 1638: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0x30800001  ! 1638: BA	ba,a	<label_0x1>
	.word 0xc6720009  ! 1641: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc01a0009  ! 1641: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0x1c800002  ! 1641: BPOS	bpos  	<label_0x2>
	.word 0xc5220009  ! 1644: STF_R	st	%f2, [%r9, %r8]
	.word 0xc64a0009  ! 1644: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0x8143e02c  ! 1644: MEMBAR	membar	#LoadStore | #StoreStore | #MemIssue 
	.word 0xdb220009  ! 1647: STF_R	st	%f13, [%r9, %r8]
	.word 0xc4120009  ! 1647: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xc6b21009  ! 1647: STHA_R	stha	%r3, [%r8 + %r9] 0x80
	.word 0xc8720009  ! 1650: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc9020009  ! 1650: LDF_R	ld	[%r8, %r9], %f4
	.word 0xfdf21009  ! 1650: CASXA_I	casxa	[%r8] 0x80, %r9, %r30
	.word 0xc8320009  ! 1653: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xf2420009  ! 1653: LDSW_R	ldsw	[%r8 + %r9], %r25
	.word 0x88520009  ! 1653: UMUL_R	umul 	%r8, %r9, %r4
	.word 0xc62a0009  ! 1656: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc7020009  ! 1656: LDF_R	ld	[%r8, %r9], %f3
	.word 0xc91a0009  ! 1656: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xc22a0009  ! 1659: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xce020009  ! 1659: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0x04c20001  ! 1659: BRLEZ	brlez  ,nt	%8,<label_0x20001>
	.word 0xc8720009  ! 1662: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc01a0009  ! 1662: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0xd8ba1009  ! 1662: STDA_R	stda	%r12, [%r8 + %r9] 0x80
	.word 0xc4720009  ! 1665: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xcc120009  ! 1665: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xc8c21009  ! 1665: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r4
	.word 0xca320009  ! 1668: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xcf020009  ! 1668: LDF_R	ld	[%r8, %r9], %f7
	.word 0xc7f22009  ! 1668: CASXA_R	casxa	[%r8]%asi, %r9, %r3
	.word 0xca320009  ! 1671: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc45a0009  ! 1671: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xc93a2680  ! 1671: STDF_I	std	%f4, [0x0680, %r8]
	.word 0xc3220009  ! 1674: STF_R	st	%f1, [%r9, %r8]
	.word 0xc45a0009  ! 1674: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xe88a1009  ! 1674: LDUBA_R	lduba	[%r8, %r9] 0x80, %r20
	.word 0xec320009  ! 1677: STH_R	sth	%r22, [%r8 + %r9]
	.word 0xc41a0009  ! 1677: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xc36a0009  ! 1677: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xcb220009  ! 1680: STF_R	st	%f5, [%r9, %r8]
	.word 0xcc4a0009  ! 1680: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0x88fa0009  ! 1680: SDIVcc_R	sdivcc 	%r8, %r9, %r4
	.word 0xe2320009  ! 1683: STH_R	sth	%r17, [%r8 + %r9]
	.word 0xe44a0009  ! 1683: LDSB_R	ldsb	[%r8 + %r9], %r18
	.word 0xd8922034  ! 1683: LDUHA_I	lduha	[%r8, + 0x0034] %asi, %r12
	.word 0xc73a0009  ! 1686: STDF_R	std	%f3, [%r9, %r8]
	.word 0xfc4a0009  ! 1686: LDSB_R	ldsb	[%r8 + %r9], %r30
	.word 0xcb3a0009  ! 1686: STDF_R	std	%f5, [%r9, %r8]
	.word 0xc4220009  ! 1689: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xfc1a0009  ! 1689: LDD_R	ldd	[%r8 + %r9], %r30
	.word 0x8fa20929  ! 1689: FMULs	fmuls	%f8, %f9, %f7
	.word 0xf0720009  ! 1692: STX_R	stx	%r24, [%r8 + %r9]
	.word 0xd91a0009  ! 1692: LDDF_R	ldd	[%r8, %r9], %f12
	.word 0x8da20829  ! 1692: FADDs	fadds	%f8, %f9, %f6
	.word 0xcf3a0009  ! 1695: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc7020009  ! 1695: LDF_R	ld	[%r8, %r9], %f3
	.word 0xcefa1009  ! 1695: SWAPA_R	swapa	%r7, [%r8 + %r9] 0x80
	.word 0xde320009  ! 1698: STH_R	sth	%r15, [%r8 + %r9]
	.word 0xc60a0009  ! 1698: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xcc9a2148  ! 1698: LDDA_I	ldda	[%r8, + 0x0148] %asi, %r6
	.word 0xe93a0009  ! 1701: STDF_R	std	%f20, [%r9, %r8]
	.word 0xea420009  ! 1701: LDSW_R	ldsw	[%r8 + %r9], %r21
	.word 0xce7a238c  ! 1701: SWAP_I	swap	%r7, [%r8 + 0x038c]
	.word 0xf6220009  ! 1704: STW_R	stw	%r27, [%r8 + %r9]
	.word 0xce520009  ! 1704: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xc4ba2540  ! 1704: STDA_I	stda	%r2, [%r8 + 0x0540] %asi
	.word 0xfa320009  ! 1707: STH_R	sth	%r29, [%r8 + %r9]
	.word 0xc85a0009  ! 1707: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xecfa2c64  ! 1707: SWAPA_I	swapa	%r22, [%r8 + 0x0c64] %asi
	.word 0xca2a0009  ! 1710: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xfc4a0009  ! 1710: LDSB_R	ldsb	[%r8 + %r9], %r30
	.word 0xc36a0009  ! 1710: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xea220009  ! 1713: STW_R	stw	%r21, [%r8 + %r9]
	.word 0xc85a0009  ! 1713: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xd85221fc  ! 1713: LDSH_I	ldsh	[%r8 + 0x01fc], %r12
	.word 0xde220009  ! 1716: STW_R	stw	%r15, [%r8 + %r9]
	.word 0xc2120009  ! 1716: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0x8e5a2d40  ! 1716: SMUL_I	smul 	%r8, 0x0d40, %r7
	.word 0xcd220009  ! 1719: STF_R	st	%f6, [%r9, %r8]
	.word 0xc71a0009  ! 1719: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0x8143c000  ! 1719: STBAR	stbar
	.word 0xf0320009  ! 1722: STH_R	sth	%r24, [%r8 + %r9]
	.word 0xc60a0009  ! 1722: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xb5a20929  ! 1722: FMULs	fmuls	%f8, %f9, %f26
	.word 0xc8320009  ! 1725: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xe5020009  ! 1725: LDF_R	ld	[%r8, %r9], %f18
	.word 0x2ac20001  ! 1725: BRNZ	brnz,a,nt	%8,<label_0x20001>
	.word 0xce2a0009  ! 1728: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc3020009  ! 1728: LDF_R	ld	[%r8, %r9], %f1
	.word 0xc3ea2c34  ! 1728: PREFETCHA_I	prefetcha	[%r8, + 0x0c34] %asi, #one_read
	.word 0xf0220009  ! 1731: STW_R	stw	%r24, [%r8 + %r9]
	.word 0xc24a0009  ! 1731: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xc51a0009  ! 1731: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xc3220009  ! 1734: STF_R	st	%f1, [%r9, %r8]
	.word 0xf9020009  ! 1734: LDF_R	ld	[%r8, %r9], %f28
	.word 0x8c7a0009  ! 1734: SDIV_R	sdiv 	%r8, %r9, %r6
	.word 0xc6220009  ! 1737: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xca420009  ! 1737: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xdac226b0  ! 1737: LDSWA_I	ldswa	[%r8, + 0x06b0] %asi, %r13
	.word 0xdb220009  ! 1740: STF_R	st	%f13, [%r9, %r8]
	.word 0xc25a0009  ! 1740: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xce122ad8  ! 1740: LDUH_I	lduh	[%r8 + 0x0ad8], %r7
	.word 0xc2320009  ! 1743: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc4020009  ! 1743: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0x8c5a208c  ! 1743: SMUL_I	smul 	%r8, 0x008c, %r6
	.word 0xce220009  ! 1746: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc5020009  ! 1746: LDF_R	ld	[%r8, %r9], %f2
	.word 0xcc5221b4  ! 1746: LDSH_I	ldsh	[%r8 + 0x01b4], %r6
	.word 0xf62a0009  ! 1749: STB_R	stb	%r27, [%r8 + %r9]
	.word 0xe0120009  ! 1749: LDUH_R	lduh	[%r8 + %r9], %r16
	.word 0xcd3a0009  ! 1749: STDF_R	std	%f6, [%r9, %r8]
	.word 0xcd3a0009  ! 1752: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc4020009  ! 1752: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0x8c522aac  ! 1752: UMUL_I	umul 	%r8, 0x0aac, %r6
	.word 0xc2320009  ! 1755: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xe8120009  ! 1755: LDUH_R	lduh	[%r8 + %r9], %r20
	.word 0xcd020009  ! 1755: LDF_R	ld	[%r8, %r9], %f6
	.word 0xc3220009  ! 1758: STF_R	st	%f1, [%r9, %r8]
	.word 0xcf020009  ! 1758: LDF_R	ld	[%r8, %r9], %f7
	.word 0xcec21009  ! 1758: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r7
	.word 0xcc2a0009  ! 1761: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc81a0009  ! 1761: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x8c720009  ! 1761: UDIV_R	udiv 	%r8, %r9, %r6
	.word 0xcb220009  ! 1764: STF_R	st	%f5, [%r9, %r8]
	.word 0xc64a0009  ! 1764: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xc7e21009  ! 1764: CASA_I	casa	[%r8] 0x80, %r9, %r3
	.word 0xc93a0009  ! 1767: STDF_R	std	%f4, [%r9, %r8]
	.word 0xdf020009  ! 1767: LDF_R	ld	[%r8, %r9], %f15
	.word 0x847a0009  ! 1767: SDIV_R	sdiv 	%r8, %r9, %r2
	.word 0xc4720009  ! 1770: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xec0a0009  ! 1770: LDUB_R	ldub	[%r8 + %r9], %r22
	.word 0xc7e21009  ! 1770: CASA_I	casa	[%r8] 0x80, %r9, %r3
	.word 0xc8320009  ! 1773: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc4420009  ! 1773: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0x38800001  ! 1773: BGU	bgu,a	<label_0x1>
	.word 0xfe720009  ! 1776: STX_R	stx	%r31, [%r8 + %r9]
	.word 0xce420009  ! 1776: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xccb22470  ! 1776: STHA_I	stha	%r6, [%r8 + 0x0470] %asi
	.word 0xf2220009  ! 1779: STW_R	stw	%r25, [%r8 + %r9]
	.word 0xce520009  ! 1779: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xc8c21009  ! 1779: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r4
	.word 0xc4720009  ! 1782: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc8420009  ! 1782: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xc36a0009  ! 1782: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xda2a0009  ! 1785: STB_R	stb	%r13, [%r8 + %r9]
	.word 0xc81a0009  ! 1785: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xca420009  ! 1785: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xc22a0009  ! 1788: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xca020009  ! 1788: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xc6f21009  ! 1788: STXA_R	stxa	%r3, [%r8 + %r9] 0x80
	.word 0xdf220009  ! 1791: STF_R	st	%f15, [%r9, %r8]
	.word 0xca520009  ! 1791: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0x36800001  ! 1791: BGE	bge,a	<label_0x1>
	.word 0xce2a0009  ! 1794: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xfe5a0009  ! 1794: LDX_R	ldx	[%r8 + %r9], %r31
	.word 0x88522e78  ! 1794: UMUL_I	umul 	%r8, 0x0e78, %r4
	.word 0xc5220009  ! 1797: STF_R	st	%f2, [%r9, %r8]
	.word 0xfa520009  ! 1797: LDSH_R	ldsh	[%r8 + %r9], %r29
	.word 0x8143c000  ! 1797: STBAR	stbar
	.word 0xc8720009  ! 1800: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc91a0009  ! 1800: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0x8b220009  ! 1800: MULScc_R	mulscc 	%r8, %r9, %r5
	.word 0xc73a0009  ! 1803: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc9020009  ! 1803: LDF_R	ld	[%r8, %r9], %f4
	.word 0x0ac20001  ! 1803: BRNZ	brnz  ,nt	%8,<label_0x20001>
	.word 0xc6720009  ! 1806: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xef1a0009  ! 1806: LDDF_R	ldd	[%r8, %r9], %f23
	.word 0xfeea1009  ! 1806: LDSTUBA_R	ldstuba	%r31, [%r8 + %r9] 0x80
	.word 0xf22a0009  ! 1809: STB_R	stb	%r25, [%r8 + %r9]
	.word 0xe84a0009  ! 1809: LDSB_R	ldsb	[%r8 + %r9], %r20
	.word 0xca8a2e84  ! 1809: LDUBA_I	lduba	[%r8, + 0x0e84] %asi, %r5
	.word 0xdb3a0009  ! 1812: STDF_R	std	%f13, [%r9, %r8]
	.word 0xca0a0009  ! 1812: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0x8143e03f  ! 1812: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0xc2320009  ! 1815: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc8120009  ! 1815: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xf6120009  ! 1815: LDUH_R	lduh	[%r8 + %r9], %r27
	.word 0xec2a0009  ! 1818: STB_R	stb	%r22, [%r8 + %r9]
	.word 0xcc1a0009  ! 1818: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xb2da25f8  ! 1818: SMULcc_I	smulcc 	%r8, 0x05f8, %r25
	.word 0xca220009  ! 1821: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xce0a0009  ! 1821: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xbba208a9  ! 1821: FSUBs	fsubs	%f8, %f9, %f29
	.word 0xcb3a0009  ! 1824: STDF_R	std	%f5, [%r9, %r8]
	.word 0xe8520009  ! 1824: LDSH_R	ldsh	[%r8 + %r9], %r20
	.word 0xf4a22914  ! 1824: STWA_I	stwa	%r26, [%r8 + 0x0914] %asi
	.word 0xc7220009  ! 1827: STF_R	st	%f3, [%r9, %r8]
	.word 0xcc5a0009  ! 1827: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0x8143c000  ! 1827: STBAR	stbar
	.word 0xc22a0009  ! 1830: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc3020009  ! 1830: LDF_R	ld	[%r8, %r9], %f1
	.word 0xee8a1009  ! 1830: LDUBA_R	lduba	[%r8, %r9] 0x80, %r23
	.word 0xdf220009  ! 1833: STF_R	st	%f15, [%r9, %r8]
	.word 0xee0a0009  ! 1833: LDUB_R	ldub	[%r8 + %r9], %r23
	.word 0xc36a2840  ! 1833: PREFETCH_I	prefetch	[%r8 + 0x0840], #one_read
	.word 0xc9220009  ! 1836: STF_R	st	%f4, [%r9, %r8]
	.word 0xfc4a0009  ! 1836: LDSB_R	ldsb	[%r8 + %r9], %r30
	.word 0xc8d222e8  ! 1836: LDSHA_I	ldsha	[%r8, + 0x02e8] %asi, %r4
	.word 0xfc2a0009  ! 1839: STB_R	stb	%r30, [%r8 + %r9]
	.word 0xc4420009  ! 1839: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xc6aa1009  ! 1839: STBA_R	stba	%r3, [%r8 + %r9] 0x80
	.word 0xca320009  ! 1842: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xe6020009  ! 1842: LDUW_R	lduw	[%r8 + %r9], %r19
	.word 0xefe21009  ! 1842: CASA_I	casa	[%r8] 0x80, %r9, %r23
	.word 0xcc2a0009  ! 1845: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xca020009  ! 1845: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xce8a1009  ! 1845: LDUBA_R	lduba	[%r8, %r9] 0x80, %r7
	.word 0xc22a0009  ! 1848: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xcc1a0009  ! 1848: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0x9cf22dec  ! 1848: UDIVcc_I	udivcc 	%r8, 0x0dec, %r14
	.word 0xc42a0009  ! 1851: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc8420009  ! 1851: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xc4fa1009  ! 1851: SWAPA_R	swapa	%r2, [%r8 + %r9] 0x80
	.word 0xf2220009  ! 1854: STW_R	stw	%r25, [%r8 + %r9]
	.word 0xca4a0009  ! 1854: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xacf22a04  ! 1854: UDIVcc_I	udivcc 	%r8, 0x0a04, %r22
	.word 0xf5220009  ! 1857: STF_R	st	%f26, [%r9, %r8]
	.word 0xc60a0009  ! 1857: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0x89a20829  ! 1857: FADDs	fadds	%f8, %f9, %f4
	.word 0xd93a0009  ! 1860: STDF_R	std	%f12, [%r9, %r8]
	.word 0xc6120009  ! 1860: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0x8143c000  ! 1860: STBAR	stbar
	.word 0xc7220009  ! 1863: STF_R	st	%f3, [%r9, %r8]
	.word 0xca4a0009  ! 1863: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xc26a0009  ! 1863: LDSTUB_R	ldstub	%r1, [%r8 + %r9]
	.word 0xc2320009  ! 1866: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xfc1a0009  ! 1866: LDD_R	ldd	[%r8 + %r9], %r30
	.word 0x8c7a0009  ! 1866: SDIV_R	sdiv 	%r8, %r9, %r6
	.word 0xc6320009  ! 1869: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xcc5a0009  ! 1869: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xc20a0009  ! 1869: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xd6320009  ! 1872: STH_R	sth	%r11, [%r8 + %r9]
	.word 0xe65a0009  ! 1872: LDX_R	ldx	[%r8 + %r9], %r19
	.word 0xcaa21009  ! 1872: STWA_R	stwa	%r5, [%r8 + %r9] 0x80
	.word 0xe02a0009  ! 1875: STB_R	stb	%r16, [%r8 + %r9]
	.word 0xd6420009  ! 1875: LDSW_R	ldsw	[%r8 + %r9], %r11
	.word 0x32800001  ! 1875: BNE	bne,a	<label_0x1>
	.word 0xee320009  ! 1878: STH_R	sth	%r23, [%r8 + %r9]
	.word 0xe04a0009  ! 1878: LDSB_R	ldsb	[%r8 + %r9], %r16
	.word 0xdc1a2258  ! 1878: LDD_I	ldd	[%r8 + 0x0258], %r14
	.word 0xc8720009  ! 1881: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc60a0009  ! 1881: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xc3ea221c  ! 1881: PREFETCHA_I	prefetcha	[%r8, + 0x021c] %asi, #one_read
	.word 0xcc220009  ! 1884: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc40a0009  ! 1884: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xc8ea1009  ! 1884: LDSTUBA_R	ldstuba	%r4, [%r8 + %r9] 0x80
	.word 0xe4320009  ! 1887: STH_R	sth	%r18, [%r8 + %r9]
	.word 0xc5020009  ! 1887: LDF_R	ld	[%r8, %r9], %f2
	.word 0xc6821009  ! 1887: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r3
	.word 0xcf3a0009  ! 1890: STDF_R	std	%f7, [%r9, %r8]
	.word 0xdf1a0009  ! 1890: LDDF_R	ldd	[%r8, %r9], %f15
	.word 0x8c5a2904  ! 1890: SMUL_I	smul 	%r8, 0x0904, %r6
	.word 0xc2320009  ! 1893: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xde120009  ! 1893: LDUH_R	lduh	[%r8 + %r9], %r15
	.word 0xc36a2994  ! 1893: PREFETCH_I	prefetch	[%r8 + 0x0994], #one_read
	.word 0xec220009  ! 1896: STW_R	stw	%r22, [%r8 + %r9]
	.word 0xc71a0009  ! 1896: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0x2eca0001  ! 1896: BRGEZ	brgez,a,pt	%8,<label_0xa0001>
	.word 0xc6720009  ! 1899: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xca020009  ! 1899: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xc4ca1009  ! 1899: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r2
	.word 0xc8320009  ! 1902: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xf05a0009  ! 1902: LDX_R	ldx	[%r8 + %r9], %r24
	.word 0xfac227e4  ! 1902: LDSWA_I	ldswa	[%r8, + 0x07e4] %asi, %r29
	.word 0xca320009  ! 1905: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xf2520009  ! 1905: LDSH_R	ldsh	[%r8 + %r9], %r25
	.word 0xee9228bc  ! 1905: LDUHA_I	lduha	[%r8, + 0x08bc] %asi, %r23
	.word 0xfc2a0009  ! 1908: STB_R	stb	%r30, [%r8 + %r9]
	.word 0xcc420009  ! 1908: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0x04800001  ! 1908: BLE	ble  	<label_0x1>
	.word 0xde320009  ! 1911: STH_R	sth	%r15, [%r8 + %r9]
	.word 0xcc520009  ! 1911: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xc3ea237c  ! 1911: PREFETCHA_I	prefetcha	[%r8, + 0x037c] %asi, #one_read
	.word 0xf6220009  ! 1914: STW_R	stw	%r27, [%r8 + %r9]
	.word 0xc85a0009  ! 1914: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xb9a209a9  ! 1914: FDIVs	fdivs	%f8, %f9, %f28
	.word 0xed220009  ! 1917: STF_R	st	%f22, [%r9, %r8]
	.word 0xc4520009  ! 1917: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xcada2c48  ! 1917: LDXA_I	ldxa	[%r8, + 0x0c48] %asi, %r5
	.word 0xc93a0009  ! 1920: STDF_R	std	%f4, [%r9, %r8]
	.word 0xca520009  ! 1920: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0x8eda2a50  ! 1920: SMULcc_I	smulcc 	%r8, 0x0a50, %r7
	.word 0xc9220009  ! 1923: STF_R	st	%f4, [%r9, %r8]
	.word 0xfe0a0009  ! 1923: LDUB_R	ldub	[%r8 + %r9], %r31
	.word 0x12800001  ! 1923: BNE	bne  	<label_0x1>
	.word 0xc82a0009  ! 1926: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xce020009  ! 1926: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xc2b21009  ! 1926: STHA_R	stha	%r1, [%r8 + %r9] 0x80
	.word 0xd93a0009  ! 1929: STDF_R	std	%f12, [%r9, %r8]
	.word 0xea420009  ! 1929: LDSW_R	ldsw	[%r8 + %r9], %r21
	.word 0xbe5a2a9c  ! 1929: SMUL_I	smul 	%r8, 0x0a9c, %r31
	.word 0xcb3a0009  ! 1932: STDF_R	std	%f5, [%r9, %r8]
	.word 0xe4120009  ! 1932: LDUH_R	lduh	[%r8 + %r9], %r18
	.word 0xc3ea2c38  ! 1932: PREFETCHA_I	prefetcha	[%r8, + 0x0c38] %asi, #one_read
	.word 0xcf220009  ! 1935: STF_R	st	%f7, [%r9, %r8]
	.word 0xc20a0009  ! 1935: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xc3ea2974  ! 1935: PREFETCHA_I	prefetcha	[%r8, + 0x0974] %asi, #one_read
	.word 0xc2320009  ! 1938: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xf81a0009  ! 1938: LDD_R	ldd	[%r8 + %r9], %r28
	.word 0xcc120009  ! 1938: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xe3220009  ! 1941: STF_R	st	%f17, [%r9, %r8]
	.word 0xc4520009  ! 1941: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0x86f20009  ! 1941: UDIVcc_R	udivcc 	%r8, %r9, %r3
	.word 0xf4320009  ! 1944: STH_R	sth	%r26, [%r8 + %r9]
	.word 0xcc520009  ! 1944: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0x8143e05e  ! 1944: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0xce720009  ! 1947: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xcc5a0009  ! 1947: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0x8e720009  ! 1947: UDIV_R	udiv 	%r8, %r9, %r7
	.word 0xee720009  ! 1950: STX_R	stx	%r23, [%r8 + %r9]
	.word 0xc8020009  ! 1950: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0x28800002  ! 1950: BLEU	bleu,a	<label_0x2>
	.word 0xe8220009  ! 1953: STW_R	stw	%r20, [%r8 + %r9]
	.word 0xfb020009  ! 1953: LDF_R	ld	[%r8, %r9], %f29
	.word 0xfc5a29c8  ! 1953: LDX_I	ldx	[%r8 + 0x09c8], %r30
	.word 0xf9220009  ! 1956: STF_R	st	%f28, [%r9, %r8]
	.word 0xc24a0009  ! 1956: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xda922ca4  ! 1956: LDUHA_I	lduha	[%r8, + 0x0ca4] %asi, %r13
	.word 0xcc220009  ! 1959: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xcc020009  ! 1959: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xc3220009  ! 1959: STF_R	st	%f1, [%r9, %r8]
	.word 0xc22a0009  ! 1962: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xce520009  ! 1962: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0x8143e029  ! 1962: MEMBAR	membar	#LoadLoad | #StoreStore | #MemIssue 
	.word 0xc2220009  ! 1965: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc24a0009  ! 1965: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xb3a209a9  ! 1965: FDIVs	fdivs	%f8, %f9, %f25
	.word 0xca2a0009  ! 1968: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xce5a0009  ! 1968: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0x8ba20829  ! 1968: FADDs	fadds	%f8, %f9, %f5
	.word 0xde2a0009  ! 1971: STB_R	stb	%r15, [%r8 + %r9]
	.word 0xc6020009  ! 1971: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0x99220009  ! 1971: MULScc_R	mulscc 	%r8, %r9, %r12
	.word 0xc8220009  ! 1974: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xe4120009  ! 1974: LDUH_R	lduh	[%r8 + %r9], %r18
	.word 0xf3e21009  ! 1974: CASA_I	casa	[%r8] 0x80, %r9, %r25
	.word 0xc42a0009  ! 1977: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xcc4a0009  ! 1977: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xc3ea228c  ! 1977: PREFETCHA_I	prefetcha	[%r8, + 0x028c] %asi, #one_read
	.word 0xff3a0009  ! 1980: STDF_R	std	%f31, [%r9, %r8]
	.word 0xda0a0009  ! 1980: LDUB_R	ldub	[%r8 + %r9], %r13
	.word 0x18800001  ! 1980: BGU	bgu  	<label_0x1>
	.word 0xca720009  ! 1983: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xff1a0009  ! 1983: LDDF_R	ldd	[%r8, %r9], %f31
	.word 0xcaf21009  ! 1983: STXA_R	stxa	%r5, [%r8 + %r9] 0x80
	.word 0xc53a0009  ! 1986: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc80a0009  ! 1986: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xceda1009  ! 1986: LDXA_R	ldxa	[%r8, %r9] 0x80, %r7
	.word 0xc2720009  ! 1989: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xca0a0009  ! 1989: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xc8420009  ! 1989: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xe93a0009  ! 1992: STDF_R	std	%f20, [%r9, %r8]
	.word 0xc45a0009  ! 1992: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xd8da1009  ! 1992: LDXA_R	ldxa	[%r8, %r9] 0x80, %r12
	.word 0xe93a0009  ! 1995: STDF_R	std	%f20, [%r9, %r8]
	.word 0xe4520009  ! 1995: LDSH_R	ldsh	[%r8 + %r9], %r18
	.word 0xcb022508  ! 1995: LDF_I	ld	[%r8, 0x0508], %f5
	.word 0xc2220009  ! 1998: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xcc120009  ! 1998: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0x8143e00e  ! 1998: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore 
	.word 0xc4720009  ! 2001: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xde4a0009  ! 2001: LDSB_R	ldsb	[%r8 + %r9], %r15
	.word 0xc36a0009  ! 2001: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xe82a0009  ! 2004: STB_R	stb	%r20, [%r8 + %r9]
	.word 0xf44a0009  ! 2004: LDSB_R	ldsb	[%r8 + %r9], %r26
	.word 0x02ca0001  ! 2004: BRZ	brz  ,pt	%8,<label_0xa0001>
	.word 0xc53a0009  ! 2007: STDF_R	std	%f2, [%r9, %r8]
	.word 0xda4a0009  ! 2007: LDSB_R	ldsb	[%r8 + %r9], %r13
	.word 0xdc921009  ! 2007: LDUHA_R	lduha	[%r8, %r9] 0x80, %r14
	.word 0xcf3a0009  ! 2010: STDF_R	std	%f7, [%r9, %r8]
	.word 0xec0a0009  ! 2010: LDUB_R	ldub	[%r8 + %r9], %r22
	.word 0xc3220009  ! 2010: STF_R	st	%f1, [%r9, %r8]
	.word 0xc6320009  ! 2013: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc51a0009  ! 2013: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xc3ea2084  ! 2013: PREFETCHA_I	prefetcha	[%r8, + 0x0084] %asi, #one_read
	.word 0xce2a0009  ! 2016: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xcc120009  ! 2016: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xc20a0009  ! 2016: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xfe2a0009  ! 2019: STB_R	stb	%r31, [%r8 + %r9]
	.word 0xc31a0009  ! 2019: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0x8f6a0009  ! 2019: SDIVX_R	sdivx	%r8, %r9, %r7
	.word 0xcc320009  ! 2022: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc4120009  ! 2022: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0x8c5a2a5c  ! 2022: SMUL_I	smul 	%r8, 0x0a5c, %r6
	.word 0xc8320009  ! 2025: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc91a0009  ! 2025: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xe3e21009  ! 2025: CASA_I	casa	[%r8] 0x80, %r9, %r17
	.word 0xc4320009  ! 2028: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc71a0009  ! 2028: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xc6a22aec  ! 2028: STWA_I	stwa	%r3, [%r8 + 0x0aec] %asi
	.word 0xca720009  ! 2031: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xde020009  ! 2031: LDUW_R	lduw	[%r8 + %r9], %r15
	.word 0x18800001  ! 2031: BGU	bgu  	<label_0x1>
	.word 0xc2320009  ! 2034: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xcf020009  ! 2034: LDF_R	ld	[%r8, %r9], %f7
	.word 0xf3e22009  ! 2034: CASA_R	casa	[%r8] %asi, %r9, %r25
	.word 0xcc720009  ! 2037: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc8420009  ! 2037: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xdad21009  ! 2037: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r13
	.word 0xf4720009  ! 2040: STX_R	stx	%r26, [%r8 + %r9]
	.word 0xc85a0009  ! 2040: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0x8143c000  ! 2040: STBAR	stbar
	.word 0xd82a0009  ! 2043: STB_R	stb	%r12, [%r8 + %r9]
	.word 0xf4420009  ! 2043: LDSW_R	ldsw	[%r8 + %r9], %r26
	.word 0x8e7a2330  ! 2043: SDIV_I	sdiv 	%r8, 0x0330, %r7
	.word 0xc33a0009  ! 2046: STDF_R	std	%f1, [%r9, %r8]
	.word 0xcc120009  ! 2046: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xc7020009  ! 2046: LDF_R	ld	[%r8, %r9], %f3
	.word 0xc2720009  ! 2049: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xdc120009  ! 2049: LDUH_R	lduh	[%r8 + %r9], %r14
	.word 0xc36a0009  ! 2049: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xf53a0009  ! 2052: STDF_R	std	%f26, [%r9, %r8]
	.word 0xc41a0009  ! 2052: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x3c800002  ! 2052: BPOS	bpos,a	<label_0x2>
	.word 0xca2a0009  ! 2055: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xff020009  ! 2055: LDF_R	ld	[%r8, %r9], %f31
	.word 0x8e4a24b8  ! 2055: MULX_I	mulx 	%r8, 0x04b8, %r7
	.word 0xc6720009  ! 2058: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc44a0009  ! 2058: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xc722262c  ! 2058: STF_I	st	%f3, [0x062c, %r8]
	.word 0xc2320009  ! 2061: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xe00a0009  ! 2061: LDUB_R	ldub	[%r8 + %r9], %r16
	.word 0xcada23a8  ! 2061: LDXA_I	ldxa	[%r8, + 0x03a8] %asi, %r5
	.word 0xc6220009  ! 2064: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xe0120009  ! 2064: LDUH_R	lduh	[%r8 + %r9], %r16
	.word 0x2aca0001  ! 2064: BRNZ	brnz,a,pt	%8,<label_0xa0001>
	.word 0xe8720009  ! 2067: STX_R	stx	%r20, [%r8 + %r9]
	.word 0xc6120009  ! 2067: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xc25a0009  ! 2067: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xc8320009  ! 2070: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc81a0009  ! 2070: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xccb221dc  ! 2070: STHA_I	stha	%r6, [%r8 + 0x01dc] %asi
	.word 0xc6220009  ! 2073: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xca520009  ! 2073: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xebe22009  ! 2073: CASA_R	casa	[%r8] %asi, %r9, %r21
	.word 0xcc220009  ! 2076: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc5020009  ! 2076: LDF_R	ld	[%r8, %r9], %f2
	.word 0xcc120009  ! 2076: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xcb220009  ! 2079: STF_R	st	%f5, [%r9, %r8]
	.word 0xf05a0009  ! 2079: LDX_R	ldx	[%r8 + %r9], %r24
	.word 0xcec21009  ! 2079: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r7
	.word 0xca720009  ! 2082: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc2120009  ! 2082: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0x24800001  ! 2082: BLE	ble,a	<label_0x1>
	.word 0xee220009  ! 2085: STW_R	stw	%r23, [%r8 + %r9]
	.word 0xe8420009  ! 2085: LDSW_R	ldsw	[%r8 + %r9], %r20
	.word 0xc48a2d18  ! 2085: LDUBA_I	lduba	[%r8, + 0x0d18] %asi, %r2
	.word 0xea220009  ! 2088: STW_R	stw	%r21, [%r8 + %r9]
	.word 0xdc5a0009  ! 2088: LDX_R	ldx	[%r8 + %r9], %r14
	.word 0xcf222e10  ! 2088: STF_I	st	%f7, [0x0e10, %r8]
	.word 0xc42a0009  ! 2091: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xdc420009  ! 2091: LDSW_R	ldsw	[%r8 + %r9], %r14
	.word 0xce7a0009  ! 2091: SWAP_R	swap	%r7, [%r8 + %r9]
	.word 0xc8320009  ! 2094: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xcc0a0009  ! 2094: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xcafa2d94  ! 2094: SWAPA_I	swapa	%r5, [%r8 + 0x0d94] %asi
	.word 0xc6220009  ! 2097: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc2120009  ! 2097: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0x3c800002  ! 2097: BPOS	bpos,a	<label_0x2>
	.word 0xc9220009  ! 2100: STF_R	st	%f4, [%r9, %r8]
	.word 0xce4a0009  ! 2100: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0x9cf20009  ! 2100: UDIVcc_R	udivcc 	%r8, %r9, %r14
	.word 0xc53a0009  ! 2103: STDF_R	std	%f2, [%r9, %r8]
	.word 0xca120009  ! 2103: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xc3ea2658  ! 2103: PREFETCHA_I	prefetcha	[%r8, + 0x0658] %asi, #one_read
	.word 0xdc320009  ! 2106: STH_R	sth	%r14, [%r8 + %r9]
	.word 0xc45a0009  ! 2106: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xeaea2964  ! 2106: LDSTUBA_I	ldstuba	%r21, [%r8 + 0x0964] %asi
	.word 0xc53a0009  ! 2109: STDF_R	std	%f2, [%r9, %r8]
	.word 0xfc420009  ! 2109: LDSW_R	ldsw	[%r8 + %r9], %r30
	.word 0xccda1009  ! 2109: LDXA_R	ldxa	[%r8, %r9] 0x80, %r6
	.word 0xfc720009  ! 2112: STX_R	stx	%r30, [%r8 + %r9]
	.word 0xc45a0009  ! 2112: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xe9220009  ! 2112: STF_R	st	%f20, [%r9, %r8]
	.word 0xff3a0009  ! 2115: STDF_R	std	%f31, [%r9, %r8]
	.word 0xcb1a0009  ! 2115: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xc3ea2c2c  ! 2115: PREFETCHA_I	prefetcha	[%r8, + 0x0c2c] %asi, #one_read
	.word 0xcf220009  ! 2118: STF_R	st	%f7, [%r9, %r8]
	.word 0xc6520009  ! 2118: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xe4a22d40  ! 2118: STWA_I	stwa	%r18, [%r8 + 0x0d40] %asi
	.word 0xc8320009  ! 2121: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc84a0009  ! 2121: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0x06c20001  ! 2121: BRLZ	brlz  ,nt	%8,<label_0x20001>
	.word 0xec720009  ! 2124: STX_R	stx	%r22, [%r8 + %r9]
	.word 0xda020009  ! 2124: LDUW_R	lduw	[%r8 + %r9], %r13
	.word 0xcc4a0009  ! 2124: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xde320009  ! 2127: STH_R	sth	%r15, [%r8 + %r9]
	.word 0xc6020009  ! 2127: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0x82da23fc  ! 2127: SMULcc_I	smulcc 	%r8, 0x03fc, %r1
	.word 0xca220009  ! 2130: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xca4a0009  ! 2130: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xc36a2340  ! 2130: PREFETCH_I	prefetch	[%r8 + 0x0340], #one_read
	.word 0xc33a0009  ! 2133: STDF_R	std	%f1, [%r9, %r8]
	.word 0xe2420009  ! 2133: LDSW_R	ldsw	[%r8 + %r9], %r17
	.word 0xc3ea23e8  ! 2133: PREFETCHA_I	prefetcha	[%r8, + 0x03e8] %asi, #one_read
	.word 0xf62a0009  ! 2136: STB_R	stb	%r27, [%r8 + %r9]
	.word 0xf0420009  ! 2136: LDSW_R	ldsw	[%r8 + %r9], %r24
	.word 0x88fa2014  ! 2136: SDIVcc_I	sdivcc 	%r8, 0x0014, %r4
	.word 0xc8320009  ! 2139: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc45a0009  ! 2139: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xc2b21009  ! 2139: STHA_R	stha	%r1, [%r8 + %r9] 0x80
	.word 0xcc320009  ! 2142: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xe4520009  ! 2142: LDSH_R	ldsh	[%r8 + %r9], %r18
	.word 0xf67a0009  ! 2142: SWAP_R	swap	%r27, [%r8 + %r9]
	.word 0xc9220009  ! 2145: STF_R	st	%f4, [%r9, %r8]
	.word 0xc2120009  ! 2145: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xcfe21009  ! 2145: CASA_I	casa	[%r8] 0x80, %r9, %r7
	.word 0xc6320009  ! 2148: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xcf1a0009  ! 2148: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xc2f22410  ! 2148: STXA_I	stxa	%r1, [%r8 + 0x0410] %asi
	.word 0xc8320009  ! 2151: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc85a0009  ! 2151: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0x8143c000  ! 2151: STBAR	stbar
	.word 0xc6320009  ! 2154: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc6120009  ! 2154: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xcc6a2918  ! 2154: LDSTUB_I	ldstub	%r6, [%r8 + 0x0918]
	.word 0xff3a0009  ! 2157: STDF_R	std	%f31, [%r9, %r8]
	.word 0xcd1a0009  ! 2157: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xc67a0009  ! 2157: SWAP_R	swap	%r3, [%r8 + %r9]
	.word 0xca2a0009  ! 2160: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xd81a0009  ! 2160: LDD_R	ldd	[%r8 + %r9], %r12
	.word 0xce8a1009  ! 2160: LDUBA_R	lduba	[%r8, %r9] 0x80, %r7
	.word 0xde2a0009  ! 2163: STB_R	stb	%r15, [%r8 + %r9]
	.word 0xdc020009  ! 2163: LDUW_R	lduw	[%r8 + %r9], %r14
	.word 0x04c20001  ! 2163: BRLEZ	brlez  ,nt	%8,<label_0x20001>
	.word 0xc5220009  ! 2166: STF_R	st	%f2, [%r9, %r8]
	.word 0xf0420009  ! 2166: LDSW_R	ldsw	[%r8 + %r9], %r24
	.word 0x8143c000  ! 2166: STBAR	stbar
	.word 0xc4320009  ! 2169: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xda4a0009  ! 2169: LDSB_R	ldsb	[%r8 + %r9], %r13
	.word 0xf11a0009  ! 2169: LDDF_R	ldd	[%r8, %r9], %f24
	.word 0xca2a0009  ! 2172: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc4420009  ! 2172: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xccaa28f8  ! 2172: STBA_I	stba	%r6, [%r8 + 0x08f8] %asi
	.word 0xd6320009  ! 2175: STH_R	sth	%r11, [%r8 + %r9]
	.word 0xc9020009  ! 2175: LDF_R	ld	[%r8, %r9], %f4
	.word 0xc64a29d0  ! 2175: LDSB_I	ldsb	[%r8 + 0x09d0], %r3
	.word 0xc33a0009  ! 2178: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc24a0009  ! 2178: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xdff22009  ! 2178: CASXA_R	casxa	[%r8]%asi, %r9, %r15
	.word 0xc8720009  ! 2181: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xec4a0009  ! 2181: LDSB_R	ldsb	[%r8 + %r9], %r22
	.word 0x8c520009  ! 2181: UMUL_R	umul 	%r8, %r9, %r6
	.word 0xc82a0009  ! 2184: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xf0020009  ! 2184: LDUW_R	lduw	[%r8 + %r9], %r24
	.word 0xca8a1009  ! 2184: LDUBA_R	lduba	[%r8, %r9] 0x80, %r5
	.word 0xce720009  ! 2187: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc44a0009  ! 2187: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xc4ba2a18  ! 2187: STDA_I	stda	%r2, [%r8 + 0x0a18] %asi
	.word 0xe2720009  ! 2190: STX_R	stx	%r17, [%r8 + %r9]
	.word 0xc41a0009  ! 2190: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x8143e05e  ! 2190: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0xcd220009  ! 2193: STF_R	st	%f6, [%r9, %r8]
	.word 0xeb020009  ! 2193: LDF_R	ld	[%r8, %r9], %f21
	.word 0xc36a0009  ! 2193: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xce220009  ! 2196: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xe1020009  ! 2196: LDF_R	ld	[%r8, %r9], %f16
	.word 0xc6420009  ! 2196: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xc82a0009  ! 2199: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xd8020009  ! 2199: LDUW_R	lduw	[%r8 + %r9], %r12
	.word 0xf0ba1009  ! 2199: STDA_R	stda	%r24, [%r8 + %r9] 0x80
	.word 0xcd3a0009  ! 2202: STDF_R	std	%f6, [%r9, %r8]
	.word 0xfc120009  ! 2202: LDUH_R	lduh	[%r8 + %r9], %r30
	.word 0x86520009  ! 2202: UMUL_R	umul 	%r8, %r9, %r3
	.word 0xc2320009  ! 2205: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc8120009  ! 2205: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0x987a26d8  ! 2205: SDIV_I	sdiv 	%r8, 0x06d8, %r12
	.word 0xc4320009  ! 2208: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xea5a0009  ! 2208: LDX_R	ldx	[%r8 + %r9], %r21
	.word 0x2cca0001  ! 2208: BRGZ	brgz,a,pt	%8,<label_0xa0001>
	.word 0xcb3a0009  ! 2211: STDF_R	std	%f5, [%r9, %r8]
	.word 0xe8020009  ! 2211: LDUW_R	lduw	[%r8 + %r9], %r20
	.word 0x8143e054  ! 2211: MEMBAR	membar	#LoadStore | #Lookaside | #Sync 
	.word 0xc4720009  ! 2214: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xec020009  ! 2214: LDUW_R	lduw	[%r8 + %r9], %r22
	.word 0x8a7a0009  ! 2214: SDIV_R	sdiv 	%r8, %r9, %r5
	.word 0xca220009  ! 2217: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xf3020009  ! 2217: LDF_R	ld	[%r8, %r9], %f25
	.word 0xe8ba2450  ! 2217: STDA_I	stda	%r20, [%r8 + 0x0450] %asi
	.word 0xcf220009  ! 2220: STF_R	st	%f7, [%r9, %r8]
	.word 0xf6520009  ! 2220: LDSH_R	ldsh	[%r8 + %r9], %r27
	.word 0xaa7a295c  ! 2220: SDIV_I	sdiv 	%r8, 0x095c, %r21
	.word 0xcc220009  ! 2223: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xe0420009  ! 2223: LDSW_R	ldsw	[%r8 + %r9], %r16
	.word 0xcef227a0  ! 2223: STXA_I	stxa	%r7, [%r8 + 0x07a0] %asi
	.word 0xc9220009  ! 2226: STF_R	st	%f4, [%r9, %r8]
	.word 0xcb1a0009  ! 2226: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xe1e22009  ! 2226: CASA_R	casa	[%r8] %asi, %r9, %r16
	.word 0xc4720009  ! 2229: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xcc1a0009  ! 2229: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0x1c800001  ! 2229: BPOS	bpos  	<label_0x1>
	.word 0xcf220009  ! 2232: STF_R	st	%f7, [%r9, %r8]
	.word 0xca4a0009  ! 2232: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0x8f6a2378  ! 2232: SDIVX_I	sdivx	%r8, 0x0378, %r7
	.word 0xc33a0009  ! 2235: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc7020009  ! 2235: LDF_R	ld	[%r8, %r9], %f3
	.word 0x8143e025  ! 2235: MEMBAR	membar	#LoadLoad | #LoadStore | #MemIssue 
	.word 0xce220009  ! 2238: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xec0a0009  ! 2238: LDUB_R	ldub	[%r8 + %r9], %r22
	.word 0x8143c000  ! 2238: STBAR	stbar
	.word 0xca320009  ! 2241: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xf6420009  ! 2241: LDSW_R	ldsw	[%r8 + %r9], %r27
	.word 0xe81a0009  ! 2241: LDD_R	ldd	[%r8 + %r9], %r20
	.word 0xc2220009  ! 2244: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc80a0009  ! 2244: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xc93a0009  ! 2244: STDF_R	std	%f4, [%r9, %r8]
	.word 0xc22a0009  ! 2247: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xea4a0009  ! 2247: LDSB_R	ldsb	[%r8 + %r9], %r21
	.word 0xfe6a0009  ! 2247: LDSTUB_R	ldstub	%r31, [%r8 + %r9]
	.word 0xc8320009  ! 2250: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc4020009  ! 2250: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xcada1009  ! 2250: LDXA_R	ldxa	[%r8, %r9] 0x80, %r5
	.word 0xce720009  ! 2253: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xca420009  ! 2253: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0x8d220009  ! 2253: MULScc_R	mulscc 	%r8, %r9, %r6
	.word 0xe6220009  ! 2256: STW_R	stw	%r19, [%r8 + %r9]
	.word 0xfe020009  ! 2256: LDUW_R	lduw	[%r8 + %r9], %r31
	.word 0x8143e00a  ! 2256: MEMBAR	membar	#StoreLoad | #StoreStore 
	.word 0xce220009  ! 2259: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xda020009  ! 2259: LDUW_R	lduw	[%r8 + %r9], %r13
	.word 0xc36a0009  ! 2259: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xe0320009  ! 2262: STH_R	sth	%r16, [%r8 + %r9]
	.word 0xd64a0009  ! 2262: LDSB_R	ldsb	[%r8 + %r9], %r11
	.word 0x8143e053  ! 2262: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside | #Sync 
	.word 0xc82a0009  ! 2265: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc8520009  ! 2265: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0x8143c000  ! 2265: STBAR	stbar
	.word 0xc6320009  ! 2268: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc84a0009  ! 2268: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xf3220009  ! 2268: STF_R	st	%f25, [%r9, %r8]
	.word 0xc2320009  ! 2271: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc2120009  ! 2271: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0x8143c000  ! 2271: STBAR	stbar
	.word 0xc6720009  ! 2274: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xce0a0009  ! 2274: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xcc0a2c5c  ! 2274: LDUB_I	ldub	[%r8 + 0x0c5c], %r6
	.word 0xc62a0009  ! 2277: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xcc420009  ! 2277: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0x8f220009  ! 2277: MULScc_R	mulscc 	%r8, %r9, %r7
	.word 0xf8320009  ! 2280: STH_R	sth	%r28, [%r8 + %r9]
	.word 0xca520009  ! 2280: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0x856a2ac4  ! 2280: SDIVX_I	sdivx	%r8, 0x0ac4, %r2
	.word 0xc8720009  ! 2283: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xcc420009  ! 2283: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0x9e4a0009  ! 2283: MULX_R	mulx 	%r8, %r9, %r15
	.word 0xcb3a0009  ! 2286: STDF_R	std	%f5, [%r9, %r8]
	.word 0xdb020009  ! 2286: LDF_R	ld	[%r8, %r9], %f13
	.word 0xe28a209c  ! 2286: LDUBA_I	lduba	[%r8, + 0x009c] %asi, %r17
	.word 0xc5220009  ! 2289: STF_R	st	%f2, [%r9, %r8]
	.word 0xcc0a0009  ! 2289: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xbefa0009  ! 2289: SDIVcc_R	sdivcc 	%r8, %r9, %r31
	.word 0xce220009  ! 2292: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xe01a0009  ! 2292: LDD_R	ldd	[%r8 + %r9], %r16
	.word 0xc4fa1009  ! 2292: SWAPA_R	swapa	%r2, [%r8 + %r9] 0x80
	.word 0xe53a0009  ! 2295: STDF_R	std	%f18, [%r9, %r8]
	.word 0xc6520009  ! 2295: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xcbf22009  ! 2295: CASXA_R	casxa	[%r8]%asi, %r9, %r5
	.word 0xfc720009  ! 2298: STX_R	stx	%r30, [%r8 + %r9]
	.word 0xc91a0009  ! 2298: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xcde22009  ! 2298: CASA_R	casa	[%r8] %asi, %r9, %r6
	.word 0xc7220009  ! 2301: STF_R	st	%f3, [%r9, %r8]
	.word 0xc9020009  ! 2301: LDF_R	ld	[%r8, %r9], %f4
	.word 0xf33a0009  ! 2301: STDF_R	std	%f25, [%r9, %r8]
	.word 0xcd220009  ! 2304: STF_R	st	%f6, [%r9, %r8]
	.word 0xd9020009  ! 2304: LDF_R	ld	[%r8, %r9], %f12
	.word 0xc4ba1009  ! 2304: STDA_R	stda	%r2, [%r8 + %r9] 0x80
	.word 0xc62a0009  ! 2307: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc51a0009  ! 2307: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0x8c4a0009  ! 2307: MULX_R	mulx 	%r8, %r9, %r6
	.word 0xf9220009  ! 2310: STF_R	st	%f28, [%r9, %r8]
	.word 0xfc4a0009  ! 2310: LDSB_R	ldsb	[%r8 + %r9], %r30
	.word 0xc9020009  ! 2310: LDF_R	ld	[%r8, %r9], %f4
	.word 0xc53a0009  ! 2313: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc6120009  ! 2313: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xc4ba22c8  ! 2313: STDA_I	stda	%r2, [%r8 + 0x02c8] %asi
	.word 0xe7220009  ! 2316: STF_R	st	%f19, [%r9, %r8]
	.word 0xca420009  ! 2316: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xc4aa22d0  ! 2316: STBA_I	stba	%r2, [%r8 + 0x02d0] %asi
	.word 0xc7220009  ! 2319: STF_R	st	%f3, [%r9, %r8]
	.word 0xca0a0009  ! 2319: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0x8143e038  ! 2319: MEMBAR	membar	#StoreStore | #Lookaside | #MemIssue 
	.word 0xc6320009  ! 2322: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc20a0009  ! 2322: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xc7020009  ! 2322: LDF_R	ld	[%r8, %r9], %f3
	.word 0xe0320009  ! 2325: STH_R	sth	%r16, [%r8 + %r9]
	.word 0xfc020009  ! 2325: LDUW_R	lduw	[%r8 + %r9], %r30
	.word 0x0eca0001  ! 2325: BRGEZ	brgez  ,pt	%8,<label_0xa0001>
	.word 0xc6320009  ! 2328: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xea520009  ! 2328: LDSH_R	ldsh	[%r8 + %r9], %r21
	.word 0x8a722d70  ! 2328: UDIV_I	udiv 	%r8, 0x0d70, %r5
	.word 0xc93a0009  ! 2331: STDF_R	std	%f4, [%r9, %r8]
	.word 0xc81a0009  ! 2331: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xc84a2714  ! 2331: LDSB_I	ldsb	[%r8 + 0x0714], %r4
	.word 0xc4220009  ! 2334: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xcc420009  ! 2334: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0x8a6a2cf4  ! 2334: UDIVX_I	udivx 	%r8, 0x0cf4, %r5
	.word 0xce720009  ! 2337: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc3020009  ! 2337: LDF_R	ld	[%r8, %r9], %f1
	.word 0x8143c000  ! 2337: STBAR	stbar
	.word 0xc8220009  ! 2340: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc41a0009  ! 2340: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x8c520009  ! 2340: UMUL_R	umul 	%r8, %r9, %r6
	.word 0xcc220009  ! 2343: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xda420009  ! 2343: LDSW_R	ldsw	[%r8 + %r9], %r13
	.word 0x8c72238c  ! 2343: UDIV_I	udiv 	%r8, 0x038c, %r6
	.word 0xcc320009  ! 2346: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc2020009  ! 2346: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0x8143e037  ! 2346: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside | #MemIssue 
	.word 0xfa2a0009  ! 2349: STB_R	stb	%r29, [%r8 + %r9]
	.word 0xea420009  ! 2349: LDSW_R	ldsw	[%r8 + %r9], %r21
	.word 0xea7a0009  ! 2349: SWAP_R	swap	%r21, [%r8 + %r9]
	.word 0xc73a0009  ! 2352: STDF_R	std	%f3, [%r9, %r8]
	.word 0xcc520009  ! 2352: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xcaa21009  ! 2352: STWA_R	stwa	%r5, [%r8 + %r9] 0x80
	.word 0xc6320009  ! 2355: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc8120009  ! 2355: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xdc9a1009  ! 2355: LDDA_R	ldda	[%r8, %r9] 0x80, %r14
	.word 0xc6320009  ! 2358: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xca120009  ! 2358: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xeb3a0009  ! 2358: STDF_R	std	%f21, [%r9, %r8]
	.word 0xe22a0009  ! 2361: STB_R	stb	%r17, [%r8 + %r9]
	.word 0xca4a0009  ! 2361: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xcaa22470  ! 2361: STWA_I	stwa	%r5, [%r8 + 0x0470] %asi
	.word 0xc4720009  ! 2364: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc2420009  ! 2364: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0x83a20829  ! 2364: FADDs	fadds	%f8, %f9, %f1
	.word 0xc8220009  ! 2367: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc45a0009  ! 2367: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0x89220009  ! 2367: MULScc_R	mulscc 	%r8, %r9, %r4
	.word 0xeb220009  ! 2370: STF_R	st	%f21, [%r9, %r8]
	.word 0xc9020009  ! 2370: LDF_R	ld	[%r8, %r9], %f4
	.word 0xc36a0009  ! 2370: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xfe2a0009  ! 2373: STB_R	stb	%r31, [%r8 + %r9]
	.word 0xef1a0009  ! 2373: LDDF_R	ldd	[%r8, %r9], %f23
	.word 0xdcba28d8  ! 2373: STDA_I	stda	%r14, [%r8 + 0x08d8] %asi
	.word 0xc22a0009  ! 2376: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc91a0009  ! 2376: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xcac21009  ! 2376: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r5
	.word 0xd7220009  ! 2379: STF_R	st	%f11, [%r9, %r8]
	.word 0xc7020009  ! 2379: LDF_R	ld	[%r8, %r9], %f3
	.word 0x8143c000  ! 2379: STBAR	stbar
	.word 0xca220009  ! 2382: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc84a0009  ! 2382: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xa3a209a9  ! 2382: FDIVs	fdivs	%f8, %f9, %f17
	.word 0xfe220009  ! 2385: STW_R	stw	%r31, [%r8 + %r9]
	.word 0xf6020009  ! 2385: LDUW_R	lduw	[%r8 + %r9], %r27
	.word 0xa4d22244  ! 2385: UMULcc_I	umulcc 	%r8, 0x0244, %r18
	.word 0xf6720009  ! 2388: STX_R	stx	%r27, [%r8 + %r9]
	.word 0xcc5a0009  ! 2388: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0x8a7a0009  ! 2388: SDIV_R	sdiv 	%r8, %r9, %r5
	.word 0xc6220009  ! 2391: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc71a0009  ! 2391: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xe0f22908  ! 2391: STXA_I	stxa	%r16, [%r8 + 0x0908] %asi
	.word 0xc42a0009  ! 2394: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc5020009  ! 2394: LDF_R	ld	[%r8, %r9], %f2
	.word 0x24ca0001  ! 2394: BRLEZ	brlez,a,pt	%8,<label_0xa0001>
	.word 0xee220009  ! 2397: STW_R	stw	%r23, [%r8 + %r9]
	.word 0xc80a0009  ! 2397: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xa0720009  ! 2397: UDIV_R	udiv 	%r8, %r9, %r16
	.word 0xc82a0009  ! 2400: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc64a0009  ! 2400: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xc4a22f30  ! 2400: STWA_I	stwa	%r2, [%r8 + 0x0f30] %asi
	.word 0xc93a0009  ! 2403: STDF_R	std	%f4, [%r9, %r8]
	.word 0xc40a0009  ! 2403: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0x8ed228ec  ! 2403: UMULcc_I	umulcc 	%r8, 0x08ec, %r7
	.word 0xea220009  ! 2406: STW_R	stw	%r21, [%r8 + %r9]
	.word 0xc45a0009  ! 2406: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0x84da0009  ! 2406: SMULcc_R	smulcc 	%r8, %r9, %r2
	.word 0xeb220009  ! 2409: STF_R	st	%f21, [%r9, %r8]
	.word 0xf91a0009  ! 2409: LDDF_R	ldd	[%r8, %r9], %f28
	.word 0xc4522c40  ! 2409: LDSH_I	ldsh	[%r8 + 0x0c40], %r2
	.word 0xc42a0009  ! 2412: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xce420009  ! 2412: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xccea1009  ! 2412: LDSTUBA_R	ldstuba	%r6, [%r8 + %r9] 0x80
	.word 0xcc320009  ! 2415: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xe41a0009  ! 2415: LDD_R	ldd	[%r8 + %r9], %r18
	.word 0x8143c000  ! 2415: STBAR	stbar
	.word 0xc7220009  ! 2418: STF_R	st	%f3, [%r9, %r8]
	.word 0xc41a0009  ! 2418: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xfc5a0009  ! 2418: LDX_R	ldx	[%r8 + %r9], %r30
	.word 0xcc220009  ! 2421: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xdd1a0009  ! 2421: LDDF_R	ldd	[%r8, %r9], %f14
	.word 0x2a800001  ! 2421: BCS	bcs,a	<label_0x1>
	.word 0xfc220009  ! 2424: STW_R	stw	%r30, [%r8 + %r9]
	.word 0xcc0a0009  ! 2424: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xcab222ac  ! 2424: STHA_I	stha	%r5, [%r8 + 0x02ac] %asi
	.word 0xcd3a0009  ! 2427: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc84a0009  ! 2427: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0x82fa0009  ! 2427: SDIVcc_R	sdivcc 	%r8, %r9, %r1
	.word 0xe2320009  ! 2430: STH_R	sth	%r17, [%r8 + %r9]
	.word 0xcb020009  ! 2430: LDF_R	ld	[%r8, %r9], %f5
	.word 0xc8921009  ! 2430: LDUHA_R	lduha	[%r8, %r9] 0x80, %r4
	.word 0xc2720009  ! 2433: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xce0a0009  ! 2433: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xccea1009  ! 2433: LDSTUBA_R	ldstuba	%r6, [%r8 + %r9] 0x80
	.word 0xc2720009  ! 2436: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xca4a0009  ! 2436: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xe6ea2bfc  ! 2436: LDSTUBA_I	ldstuba	%r19, [%r8 + 0x0bfc] %asi
	.word 0xc53a0009  ! 2439: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc51a0009  ! 2439: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0x844a26e8  ! 2439: MULX_I	mulx 	%r8, 0x06e8, %r2
	.word 0xce720009  ! 2442: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc8420009  ! 2442: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xe4b22f20  ! 2442: STHA_I	stha	%r18, [%r8 + 0x0f20] %asi
	.word 0xc4220009  ! 2445: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc7020009  ! 2445: LDF_R	ld	[%r8, %r9], %f3
	.word 0x8143e04e  ! 2445: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Sync 
	.word 0xcb3a0009  ! 2448: STDF_R	std	%f5, [%r9, %r8]
	.word 0xe2420009  ! 2448: LDSW_R	ldsw	[%r8 + %r9], %r17
	.word 0x876a0009  ! 2448: SDIVX_R	sdivx	%r8, %r9, %r3
	.word 0xdd3a0009  ! 2451: STDF_R	std	%f14, [%r9, %r8]
	.word 0xd41a0009  ! 2451: LDD_R	ldd	[%r8 + %r9], %r10
	.word 0xe3222654  ! 2451: STF_I	st	%f17, [0x0654, %r8]
	.word 0xec720009  ! 2454: STX_R	stx	%r22, [%r8 + %r9]
	.word 0xc6420009  ! 2454: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0x14800002  ! 2454: BG	bg  	<label_0x2>
	.word 0xc4320009  ! 2457: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc3020009  ! 2457: LDF_R	ld	[%r8, %r9], %f1
	.word 0xe67a0009  ! 2457: SWAP_R	swap	%r19, [%r8 + %r9]
	.word 0xf6720009  ! 2460: STX_R	stx	%r27, [%r8 + %r9]
	.word 0xf44a0009  ! 2460: LDSB_R	ldsb	[%r8 + %r9], %r26
	.word 0xc36a211c  ! 2460: PREFETCH_I	prefetch	[%r8 + 0x011c], #one_read
	.word 0xc62a0009  ! 2463: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xcb020009  ! 2463: LDF_R	ld	[%r8, %r9], %f5
	.word 0xcaea1009  ! 2463: LDSTUBA_R	ldstuba	%r5, [%r8 + %r9] 0x80
	.word 0xc22a0009  ! 2466: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc6420009  ! 2466: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xc25a26a0  ! 2466: LDX_I	ldx	[%r8 + 0x06a0], %r1
	.word 0xdc320009  ! 2469: STH_R	sth	%r14, [%r8 + %r9]
	.word 0xc4520009  ! 2469: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0x8e6a0009  ! 2469: UDIVX_R	udivx 	%r8, %r9, %r7
	.word 0xcc2a0009  ! 2472: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xe0120009  ! 2472: LDUH_R	lduh	[%r8 + %r9], %r16
	.word 0x8143e040  ! 2472: MEMBAR	membar	#Sync 
	.word 0xe62a0009  ! 2475: STB_R	stb	%r19, [%r8 + %r9]
	.word 0xc41a0009  ! 2475: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xc93a23d0  ! 2475: STDF_I	std	%f4, [0x03d0, %r8]
	.word 0xc53a0009  ! 2478: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc8120009  ! 2478: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0x8143c000  ! 2478: STBAR	stbar
	.word 0xce220009  ! 2481: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc3020009  ! 2481: LDF_R	ld	[%r8, %r9], %f1
	.word 0xc3ea1009  ! 2481: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xec320009  ! 2484: STH_R	sth	%r22, [%r8 + %r9]
	.word 0xf71a0009  ! 2484: LDDF_R	ldd	[%r8, %r9], %f27
	.word 0xcc9a2e08  ! 2484: LDDA_I	ldda	[%r8, + 0x0e08] %asi, %r6
	.word 0xcb3a0009  ! 2487: STDF_R	std	%f5, [%r9, %r8]
	.word 0xcc1a0009  ! 2487: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xc2022500  ! 2487: LDUW_I	lduw	[%r8 + 0x0500], %r1
	.word 0xc6320009  ! 2490: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc85a0009  ! 2490: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xcaea23bc  ! 2490: LDSTUBA_I	ldstuba	%r5, [%r8 + 0x03bc] %asi
	.word 0xc2320009  ! 2493: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xcb020009  ! 2493: LDF_R	ld	[%r8, %r9], %f5
	.word 0xcb3a2f38  ! 2493: STDF_I	std	%f5, [0x0f38, %r8]
	.word 0xef3a0009  ! 2496: STDF_R	std	%f23, [%r9, %r8]
	.word 0xc25a0009  ! 2496: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xc3ea1009  ! 2496: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xfc220009  ! 2499: STW_R	stw	%r30, [%r8 + %r9]
	.word 0xce0a0009  ! 2499: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0x8143e06a  ! 2499: MEMBAR	membar	#StoreLoad | #StoreStore | #MemIssue | #Sync 
	.word 0xc42a0009  ! 2502: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xea4a0009  ! 2502: LDSB_R	ldsb	[%r8 + %r9], %r21
	.word 0xcbe21009  ! 2502: CASA_I	casa	[%r8] 0x80, %r9, %r5
	.word 0xf8220009  ! 2505: STW_R	stw	%r28, [%r8 + %r9]
	.word 0xc60a0009  ! 2505: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xc88a23dc  ! 2505: LDUBA_I	lduba	[%r8, + 0x03dc] %asi, %r4
	.word 0xcd3a0009  ! 2508: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc6020009  ! 2508: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xdac22ec0  ! 2508: LDSWA_I	ldswa	[%r8, + 0x0ec0] %asi, %r13
	.word 0xeb3a0009  ! 2511: STDF_R	std	%f21, [%r9, %r8]
	.word 0xce520009  ! 2511: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0x14800001  ! 2511: BG	bg  	<label_0x1>
	.word 0xcc2a0009  ! 2514: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xca120009  ! 2514: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0x98720009  ! 2514: UDIV_R	udiv 	%r8, %r9, %r12
	.word 0xc2220009  ! 2517: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xcc020009  ! 2517: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0x89a209a9  ! 2517: FDIVs	fdivs	%f8, %f9, %f4
	.word 0xc7220009  ! 2520: STF_R	st	%f3, [%r9, %r8]
	.word 0xce0a0009  ! 2520: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0x8c520009  ! 2520: UMUL_R	umul 	%r8, %r9, %r6
	.word 0xdf3a0009  ! 2523: STDF_R	std	%f15, [%r9, %r8]
	.word 0xda5a0009  ! 2523: LDX_R	ldx	[%r8 + %r9], %r13
	.word 0xc80a0009  ! 2523: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xf8220009  ! 2526: STW_R	stw	%r28, [%r8 + %r9]
	.word 0xcc120009  ! 2526: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xceea2ab4  ! 2526: LDSTUBA_I	ldstuba	%r7, [%r8 + 0x0ab4] %asi
	.word 0xc4220009  ! 2529: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc8020009  ! 2529: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0x8f220009  ! 2529: MULScc_R	mulscc 	%r8, %r9, %r7
	.word 0xc8220009  ! 2532: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc7020009  ! 2532: LDF_R	ld	[%r8, %r9], %f3
	.word 0xc8d22644  ! 2532: LDSHA_I	ldsha	[%r8, + 0x0644] %asi, %r4
	.word 0xce720009  ! 2535: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc6420009  ! 2535: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xc8b22660  ! 2535: STHA_I	stha	%r4, [%r8 + 0x0660] %asi
	.word 0xcd220009  ! 2538: STF_R	st	%f6, [%r9, %r8]
	.word 0xcc520009  ! 2538: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0x8a5a28c4  ! 2538: SMUL_I	smul 	%r8, 0x08c4, %r5
	.word 0xc6220009  ! 2541: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xe2120009  ! 2541: LDUH_R	lduh	[%r8 + %r9], %r17
	.word 0x8c5a0009  ! 2541: SMUL_R	smul 	%r8, %r9, %r6
	.word 0xc9220009  ! 2544: STF_R	st	%f4, [%r9, %r8]
	.word 0xc65a0009  ! 2544: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xc89a1009  ! 2544: LDDA_R	ldda	[%r8, %r9] 0x80, %r4
	.word 0xca720009  ! 2547: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xeb020009  ! 2547: LDF_R	ld	[%r8, %r9], %f21
	.word 0xcca22b3c  ! 2547: STWA_I	stwa	%r6, [%r8 + 0x0b3c] %asi
	.word 0xca220009  ! 2550: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc60a0009  ! 2550: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xf4822548  ! 2550: LDUWA_I	lduwa	[%r8, + 0x0548] %asi, %r26
	.word 0xca320009  ! 2553: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xee0a0009  ! 2553: LDUB_R	ldub	[%r8 + %r9], %r23
	.word 0xc2a21009  ! 2553: STWA_R	stwa	%r1, [%r8 + %r9] 0x80
	.word 0xc6220009  ! 2556: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc7020009  ! 2556: LDF_R	ld	[%r8, %r9], %f3
	.word 0xcefa1009  ! 2556: SWAPA_R	swapa	%r7, [%r8 + %r9] 0x80
	.word 0xde720009  ! 2559: STX_R	stx	%r15, [%r8 + %r9]
	.word 0xd64a0009  ! 2559: LDSB_R	ldsb	[%r8 + %r9], %r11
	.word 0xe5f21009  ! 2559: CASXA_I	casxa	[%r8] 0x80, %r9, %r18
	.word 0xc3220009  ! 2562: STF_R	st	%f1, [%r9, %r8]
	.word 0xce5a0009  ! 2562: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xfc420009  ! 2562: LDSW_R	ldsw	[%r8 + %r9], %r30
	.word 0xcb3a0009  ! 2565: STDF_R	std	%f5, [%r9, %r8]
	.word 0xc24a0009  ! 2565: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xc36a2f68  ! 2565: PREFETCH_I	prefetch	[%r8 + 0x0f68], #one_read
	.word 0xcc320009  ! 2568: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc8020009  ! 2568: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0x8143c000  ! 2568: STBAR	stbar
	.word 0xc3220009  ! 2571: STF_R	st	%f1, [%r9, %r8]
	.word 0xc31a0009  ! 2571: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0x8143e029  ! 2571: MEMBAR	membar	#LoadLoad | #StoreStore | #MemIssue 
	.word 0xc22a0009  ! 2574: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xf91a0009  ! 2574: LDDF_R	ldd	[%r8, %r9], %f28
	.word 0x887a2b40  ! 2574: SDIV_I	sdiv 	%r8, 0x0b40, %r4
	.word 0xc9220009  ! 2577: STF_R	st	%f4, [%r9, %r8]
	.word 0xfa4a0009  ! 2577: LDSB_R	ldsb	[%r8 + %r9], %r29
	.word 0x3a800001  ! 2577: BCC	bcc,a	<label_0x1>
	.word 0xf2220009  ! 2580: STW_R	stw	%r25, [%r8 + %r9]
	.word 0xc44a0009  ! 2580: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xc2ea21c4  ! 2580: LDSTUBA_I	ldstuba	%r1, [%r8 + 0x01c4] %asi
	.word 0xc6220009  ! 2583: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc8120009  ! 2583: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0x16800001  ! 2583: BGE	bge  	<label_0x1>
	.word 0xf1220009  ! 2586: STF_R	st	%f24, [%r9, %r8]
	.word 0xc4020009  ! 2586: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0x99a209a9  ! 2586: FDIVs	fdivs	%f8, %f9, %f12
	.word 0xcc2a0009  ! 2589: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xca4a0009  ! 2589: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xccf22b90  ! 2589: STXA_I	stxa	%r6, [%r8 + 0x0b90] %asi
	.word 0xcf3a0009  ! 2592: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc2520009  ! 2592: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0x8ba20929  ! 2592: FMULs	fmuls	%f8, %f9, %f5
	.word 0xdc2a0009  ! 2595: STB_R	stb	%r14, [%r8 + %r9]
	.word 0xff020009  ! 2595: LDF_R	ld	[%r8, %r9], %f31
	.word 0xa5222a88  ! 2595: MULScc_I	mulscc 	%r8, 0x0a88, %r18
	.word 0xc8320009  ! 2598: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc2020009  ! 2598: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0x3c800001  ! 2598: BPOS	bpos,a	<label_0x1>
	.word 0xf7220009  ! 2601: STF_R	st	%f27, [%r9, %r8]
	.word 0xc4420009  ! 2601: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xce821009  ! 2601: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r7
	.word 0xf6320009  ! 2604: STH_R	sth	%r27, [%r8 + %r9]
	.word 0xfc420009  ! 2604: LDSW_R	ldsw	[%r8 + %r9], %r30
	.word 0x32800001  ! 2604: BNE	bne,a	<label_0x1>
	.word 0xe8220009  ! 2607: STW_R	stw	%r20, [%r8 + %r9]
	.word 0xcb020009  ! 2607: LDF_R	ld	[%r8, %r9], %f5
	.word 0xfc822908  ! 2607: LDUWA_I	lduwa	[%r8, + 0x0908] %asi, %r30
	.word 0xc42a0009  ! 2610: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xd91a0009  ! 2610: LDDF_R	ldd	[%r8, %r9], %f12
	.word 0x96fa0009  ! 2610: SDIVcc_R	sdivcc 	%r8, %r9, %r11
	.word 0xf42a0009  ! 2613: STB_R	stb	%r26, [%r8 + %r9]
	.word 0xec5a0009  ! 2613: LDX_R	ldx	[%r8 + %r9], %r22
	.word 0xc2a22178  ! 2613: STWA_I	stwa	%r1, [%r8 + 0x0178] %asi
	.word 0xc5220009  ! 2616: STF_R	st	%f2, [%r9, %r8]
	.word 0xc4420009  ! 2616: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0x86f20009  ! 2616: UDIVcc_R	udivcc 	%r8, %r9, %r3
	.word 0xcf3a0009  ! 2619: STDF_R	std	%f7, [%r9, %r8]
	.word 0xce520009  ! 2619: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0x8143e07a  ! 2619: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xfe720009  ! 2622: STX_R	stx	%r31, [%r8 + %r9]
	.word 0xda120009  ! 2622: LDUH_R	lduh	[%r8 + %r9], %r13
	.word 0xcc922328  ! 2622: LDUHA_I	lduha	[%r8, + 0x0328] %asi, %r6
	.word 0xc6220009  ! 2625: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xca420009  ! 2625: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xfa520009  ! 2625: LDSH_R	ldsh	[%r8 + %r9], %r29
	.word 0xd8320009  ! 2628: STH_R	sth	%r12, [%r8 + %r9]
	.word 0xc64a0009  ! 2628: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xc09a1009  ! 2628: LDDA_R	ldda	[%r8, %r9] 0x80, %r0
	.word 0xe22a0009  ! 2631: STB_R	stb	%r17, [%r8 + %r9]
	.word 0xca5a0009  ! 2631: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xfaea1009  ! 2631: LDSTUBA_R	ldstuba	%r29, [%r8 + %r9] 0x80
	.word 0xc22a0009  ! 2634: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xca420009  ! 2634: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xa1a20929  ! 2634: FMULs	fmuls	%f8, %f9, %f16
	.word 0xd62a0009  ! 2637: STB_R	stb	%r11, [%r8 + %r9]
	.word 0xce5a0009  ! 2637: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xc6c21009  ! 2637: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r3
	.word 0xc62a0009  ! 2640: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc2420009  ! 2640: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xe5f21009  ! 2640: CASXA_I	casxa	[%r8] 0x80, %r9, %r18
	.word 0xc2220009  ! 2643: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xe0520009  ! 2643: LDSH_R	ldsh	[%r8 + %r9], %r16
	.word 0x1c800002  ! 2643: BPOS	bpos  	<label_0x2>
	.word 0xcd220009  ! 2646: STF_R	st	%f6, [%r9, %r8]
	.word 0xca120009  ! 2646: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xcc0a0009  ! 2646: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xc2320009  ! 2649: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xdb1a0009  ! 2649: LDDF_R	ldd	[%r8, %r9], %f13
	.word 0x86720009  ! 2649: UDIV_R	udiv 	%r8, %r9, %r3
	.word 0xc9220009  ! 2652: STF_R	st	%f4, [%r9, %r8]
	.word 0xea020009  ! 2652: LDUW_R	lduw	[%r8 + %r9], %r21
	.word 0xc86a0009  ! 2652: LDSTUB_R	ldstub	%r4, [%r8 + %r9]
	.word 0xfa220009  ! 2655: STW_R	stw	%r29, [%r8 + %r9]
	.word 0xe4120009  ! 2655: LDUH_R	lduh	[%r8 + %r9], %r18
	.word 0xc93a2750  ! 2655: STDF_I	std	%f4, [0x0750, %r8]
	.word 0xc82a0009  ! 2658: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc6420009  ! 2658: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0x8143e04d  ! 2658: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Sync 
	.word 0xcb3a0009  ! 2661: STDF_R	std	%f5, [%r9, %r8]
	.word 0xc31a0009  ! 2661: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xa6f20009  ! 2661: UDIVcc_R	udivcc 	%r8, %r9, %r19
	.word 0xc6720009  ! 2664: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc84a0009  ! 2664: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xcc1a24b0  ! 2664: LDD_I	ldd	[%r8 + 0x04b0], %r6
	.word 0xfa720009  ! 2667: STX_R	stx	%r29, [%r8 + %r9]
	.word 0xc81a0009  ! 2667: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x885a0009  ! 2667: SMUL_R	smul 	%r8, %r9, %r4
	.word 0xc6320009  ! 2670: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xeb1a0009  ! 2670: LDDF_R	ldd	[%r8, %r9], %f21
	.word 0xecea2a70  ! 2670: LDSTUBA_I	ldstuba	%r22, [%r8 + 0x0a70] %asi
	.word 0xcf220009  ! 2673: STF_R	st	%f7, [%r9, %r8]
	.word 0xc84a0009  ! 2673: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0x0a800002  ! 2673: BCS	bcs  	<label_0x2>
	.word 0xca320009  ! 2676: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xee0a0009  ! 2676: LDUB_R	ldub	[%r8 + %r9], %r23
	.word 0xdc120009  ! 2676: LDUH_R	lduh	[%r8 + %r9], %r14
	.word 0xc42a0009  ! 2679: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xce020009  ! 2679: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xb64a21dc  ! 2679: MULX_I	mulx 	%r8, 0x01dc, %r27
	.word 0xf8220009  ! 2682: STW_R	stw	%r28, [%r8 + %r9]
	.word 0xed1a0009  ! 2682: LDDF_R	ldd	[%r8, %r9], %f22
	.word 0x0ac20001  ! 2682: BRNZ	brnz  ,nt	%8,<label_0x20001>
	.word 0xe22a0009  ! 2685: STB_R	stb	%r17, [%r8 + %r9]
	.word 0xce520009  ! 2685: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xc6aa1009  ! 2685: STBA_R	stba	%r3, [%r8 + %r9] 0x80
	.word 0xc73a0009  ! 2688: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc81a0009  ! 2688: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xc4fa1009  ! 2688: SWAPA_R	swapa	%r2, [%r8 + %r9] 0x80
	.word 0xce2a0009  ! 2691: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xf01a0009  ! 2691: LDD_R	ldd	[%r8 + %r9], %r24
	.word 0x88522d3c  ! 2691: UMUL_I	umul 	%r8, 0x0d3c, %r4
	.word 0xfd3a0009  ! 2694: STDF_R	std	%f30, [%r9, %r8]
	.word 0xcc1a0009  ! 2694: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xc3ea1009  ! 2694: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc4320009  ! 2697: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xca120009  ! 2697: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xe53a0009  ! 2697: STDF_R	std	%f18, [%r9, %r8]
	.word 0xc33a0009  ! 2700: STDF_R	std	%f1, [%r9, %r8]
	.word 0xcc1a0009  ! 2700: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xc2ea1009  ! 2700: LDSTUBA_R	ldstuba	%r1, [%r8 + %r9] 0x80
	.word 0xea2a0009  ! 2703: STB_R	stb	%r21, [%r8 + %r9]
	.word 0xde0a0009  ! 2703: LDUB_R	ldub	[%r8 + %r9], %r15
	.word 0x826a20e4  ! 2703: UDIVX_I	udivx 	%r8, 0x00e4, %r1
	.word 0xd62a0009  ! 2706: STB_R	stb	%r11, [%r8 + %r9]
	.word 0xfa5a0009  ! 2706: LDX_R	ldx	[%r8 + %r9], %r29
	.word 0xd93a0009  ! 2706: STDF_R	std	%f12, [%r9, %r8]
	.word 0xca220009  ! 2709: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xcc1a0009  ! 2709: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xeb220009  ! 2709: STF_R	st	%f21, [%r9, %r8]
	.word 0xc93a0009  ! 2712: STDF_R	std	%f4, [%r9, %r8]
	.word 0xf8420009  ! 2712: LDSW_R	ldsw	[%r8 + %r9], %r28
	.word 0x844a0009  ! 2712: MULX_R	mulx 	%r8, %r9, %r2
	.word 0xc73a0009  ! 2715: STDF_R	std	%f3, [%r9, %r8]
	.word 0xfe4a0009  ! 2715: LDSB_R	ldsb	[%r8 + %r9], %r31
	.word 0xeeb21009  ! 2715: STHA_R	stha	%r23, [%r8 + %r9] 0x80
	.word 0xce720009  ! 2718: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xca0a0009  ! 2718: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xc3ea2824  ! 2718: PREFETCHA_I	prefetcha	[%r8, + 0x0824] %asi, #one_read
	.word 0xe8320009  ! 2721: STH_R	sth	%r20, [%r8 + %r9]
	.word 0xce4a0009  ! 2721: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xceda1009  ! 2721: LDXA_R	ldxa	[%r8, %r9] 0x80, %r7
	.word 0xc8720009  ! 2724: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xe71a0009  ! 2724: LDDF_R	ldd	[%r8, %r9], %f19
	.word 0x02ca0001  ! 2724: BRZ	brz  ,pt	%8,<label_0xa0001>
	.word 0xfc720009  ! 2727: STX_R	stx	%r30, [%r8 + %r9]
	.word 0xc6020009  ! 2727: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0x85220009  ! 2727: MULScc_R	mulscc 	%r8, %r9, %r2
	.word 0xc33a0009  ! 2730: STDF_R	std	%f1, [%r9, %r8]
	.word 0xde420009  ! 2730: LDSW_R	ldsw	[%r8 + %r9], %r15
	.word 0xceca1009  ! 2730: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r7
	.word 0xce2a0009  ! 2733: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xca5a0009  ! 2733: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0x84720009  ! 2733: UDIV_R	udiv 	%r8, %r9, %r2
	.word 0xf6720009  ! 2736: STX_R	stx	%r27, [%r8 + %r9]
	.word 0xcf020009  ! 2736: LDF_R	ld	[%r8, %r9], %f7
	.word 0xc6a22a50  ! 2736: STWA_I	stwa	%r3, [%r8 + 0x0a50] %asi
	.word 0xcc220009  ! 2739: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc71a0009  ! 2739: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xcf3a0009  ! 2739: STDF_R	std	%f7, [%r9, %r8]
	.word 0xcd220009  ! 2742: STF_R	st	%f6, [%r9, %r8]
	.word 0xdc1a0009  ! 2742: LDD_R	ldd	[%r8 + %r9], %r14
	.word 0xdf1a0009  ! 2742: LDDF_R	ldd	[%r8, %r9], %f15
	.word 0xcb3a0009  ! 2745: STDF_R	std	%f5, [%r9, %r8]
	.word 0xc6020009  ! 2745: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0x8143e02b  ! 2745: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #MemIssue 
	.word 0xc82a0009  ! 2748: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc2520009  ! 2748: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0x26c20001  ! 2748: BRLZ	brlz,a,nt	%8,<label_0x20001>
	.word 0xd62a0009  ! 2751: STB_R	stb	%r11, [%r8 + %r9]
	.word 0xc7020009  ! 2751: LDF_R	ld	[%r8, %r9], %f3
	.word 0x84722830  ! 2751: UDIV_I	udiv 	%r8, 0x0830, %r2
	.word 0xce2a0009  ! 2754: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xcc020009  ! 2754: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0x8143e07b  ! 2754: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xc4220009  ! 2757: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc4120009  ! 2757: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xcada22d0  ! 2757: LDXA_I	ldxa	[%r8, + 0x02d0] %asi, %r5
	.word 0xc6220009  ! 2760: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc2520009  ! 2760: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xc3ea2f60  ! 2760: PREFETCHA_I	prefetcha	[%r8, + 0x0f60] %asi, #one_read
	.word 0xc53a0009  ! 2763: STDF_R	std	%f2, [%r9, %r8]
	.word 0xe81a0009  ! 2763: LDD_R	ldd	[%r8 + %r9], %r20
	.word 0x8143c000  ! 2763: STBAR	stbar
	.word 0xf3220009  ! 2766: STF_R	st	%f25, [%r9, %r8]
	.word 0xc24a0009  ! 2766: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xc8d21009  ! 2766: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r4
	.word 0xca220009  ! 2769: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xe11a0009  ! 2769: LDDF_R	ldd	[%r8, %r9], %f16
	.word 0xc8ca2a84  ! 2769: LDSBA_I	ldsba	[%r8, + 0x0a84] %asi, %r4
	.word 0xcd3a0009  ! 2772: STDF_R	std	%f6, [%r9, %r8]
	.word 0xca420009  ! 2772: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0x8cfa0009  ! 2772: SDIVcc_R	sdivcc 	%r8, %r9, %r6
	.word 0xcd220009  ! 2775: STF_R	st	%f6, [%r9, %r8]
	.word 0xea5a0009  ! 2775: LDX_R	ldx	[%r8 + %r9], %r21
	.word 0xccba1009  ! 2775: STDA_R	stda	%r6, [%r8 + %r9] 0x80
	.word 0xc4320009  ! 2778: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xd8020009  ! 2778: LDUW_R	lduw	[%r8 + %r9], %r12
	.word 0xcb3a20c0  ! 2778: STDF_I	std	%f5, [0x00c0, %r8]
	.word 0xc62a0009  ! 2781: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xcf1a0009  ! 2781: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xcc1a0009  ! 2781: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xcd3a0009  ! 2784: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc3020009  ! 2784: LDF_R	ld	[%r8, %r9], %f1
	.word 0x89222cc4  ! 2784: MULScc_I	mulscc 	%r8, 0x0cc4, %r4
	.word 0xc2220009  ! 2787: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xf2420009  ! 2787: LDSW_R	ldsw	[%r8 + %r9], %r25
	.word 0x84fa2794  ! 2787: SDIVcc_I	sdivcc 	%r8, 0x0794, %r2
	.word 0xe8220009  ! 2790: STW_R	stw	%r20, [%r8 + %r9]
	.word 0xca5a0009  ! 2790: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0x8c7a0009  ! 2790: SDIV_R	sdiv 	%r8, %r9, %r6
	.word 0xfa320009  ! 2793: STH_R	sth	%r29, [%r8 + %r9]
	.word 0xc41a0009  ! 2793: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x2cc20001  ! 2793: BRGZ	brgz,a,nt	%8,<label_0x20001>
	.word 0xc82a0009  ! 2796: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc80a0009  ! 2796: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0x8143e061  ! 2796: MEMBAR	membar	#LoadLoad | #MemIssue | #Sync 
	.word 0xc4220009  ! 2799: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xfe520009  ! 2799: LDSH_R	ldsh	[%r8 + %r9], %r31
	.word 0xc8ca1009  ! 2799: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r4
	.word 0xca320009  ! 2802: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc2420009  ! 2802: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xc7f22009  ! 2802: CASXA_R	casxa	[%r8]%asi, %r9, %r3
	.word 0xc9220009  ! 2805: STF_R	st	%f4, [%r9, %r8]
	.word 0xce120009  ! 2805: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0x8143e032  ! 2805: MEMBAR	membar	#StoreLoad | #Lookaside | #MemIssue 
	.word 0xc3220009  ! 2808: STF_R	st	%f1, [%r9, %r8]
	.word 0xc71a0009  ! 2808: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xc36a0009  ! 2808: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xfa320009  ! 2811: STH_R	sth	%r29, [%r8 + %r9]
	.word 0xe04a0009  ! 2811: LDSB_R	ldsb	[%r8 + %r9], %r16
	.word 0xe08a1009  ! 2811: LDUBA_R	lduba	[%r8, %r9] 0x80, %r16
	.word 0xca320009  ! 2814: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc8020009  ! 2814: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xcaea2cd0  ! 2814: LDSTUBA_I	ldstuba	%r5, [%r8 + 0x0cd0] %asi
	.word 0xce2a0009  ! 2817: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xcc1a0009  ! 2817: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0x8143c000  ! 2817: STBAR	stbar
	.word 0xf8720009  ! 2820: STX_R	stx	%r28, [%r8 + %r9]
	.word 0xc71a0009  ! 2820: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xf8921009  ! 2820: LDUHA_R	lduha	[%r8, %r9] 0x80, %r28
	.word 0xe2320009  ! 2823: STH_R	sth	%r17, [%r8 + %r9]
	.word 0xc6120009  ! 2823: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xcad21009  ! 2823: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r5
	.word 0xd73a0009  ! 2826: STDF_R	std	%f11, [%r9, %r8]
	.word 0xce5a0009  ! 2826: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xcff22009  ! 2826: CASXA_R	casxa	[%r8]%asi, %r9, %r7
	.word 0xe2220009  ! 2829: STW_R	stw	%r17, [%r8 + %r9]
	.word 0xcb020009  ! 2829: LDF_R	ld	[%r8, %r9], %f5
	.word 0xcde22009  ! 2829: CASA_R	casa	[%r8] %asi, %r9, %r6
	.word 0xca320009  ! 2832: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xdc020009  ! 2832: LDUW_R	lduw	[%r8 + %r9], %r14
	.word 0x8af20009  ! 2832: UDIVcc_R	udivcc 	%r8, %r9, %r5
	.word 0xf53a0009  ! 2835: STDF_R	std	%f26, [%r9, %r8]
	.word 0xde0a0009  ! 2835: LDUB_R	ldub	[%r8 + %r9], %r15
	.word 0x8ed22794  ! 2835: UMULcc_I	umulcc 	%r8, 0x0794, %r7
	.word 0xf6320009  ! 2838: STH_R	sth	%r27, [%r8 + %r9]
	.word 0xc60a0009  ! 2838: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xfaf21009  ! 2838: STXA_R	stxa	%r29, [%r8 + %r9] 0x80
	.word 0xcd220009  ! 2841: STF_R	st	%f6, [%r9, %r8]
	.word 0xe44a0009  ! 2841: LDSB_R	ldsb	[%r8 + %r9], %r18
	.word 0x8efa26ac  ! 2841: SDIVcc_I	sdivcc 	%r8, 0x06ac, %r7
	.word 0xcc720009  ! 2844: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc31a0009  ! 2844: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0x825a0009  ! 2844: SMUL_R	smul 	%r8, %r9, %r1
	.word 0xdf3a0009  ! 2847: STDF_R	std	%f15, [%r9, %r8]
	.word 0xf2520009  ! 2847: LDSH_R	ldsh	[%r8 + %r9], %r25
	.word 0x8143e07a  ! 2847: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xc62a0009  ! 2850: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xdf1a0009  ! 2850: LDDF_R	ldd	[%r8, %r9], %f15
	.word 0xc4fa1009  ! 2850: SWAPA_R	swapa	%r2, [%r8 + %r9] 0x80
	.word 0xfd3a0009  ! 2853: STDF_R	std	%f30, [%r9, %r8]
	.word 0xc64a0009  ! 2853: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0x3e800002  ! 2853: BVC	bvc,a	<label_0x2>
	.word 0xf8720009  ! 2856: STX_R	stx	%r28, [%r8 + %r9]
	.word 0xc41a0009  ! 2856: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x02800001  ! 2856: BE	be  	<label_0x1>
	.word 0xce320009  ! 2859: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xcc1a0009  ! 2859: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xc4f22128  ! 2859: STXA_I	stxa	%r2, [%r8 + 0x0128] %asi
	.word 0xc3220009  ! 2862: STF_R	st	%f1, [%r9, %r8]
	.word 0xce120009  ! 2862: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xc33a0009  ! 2862: STDF_R	std	%f1, [%r9, %r8]
	.word 0xca720009  ! 2865: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xe8120009  ! 2865: LDUH_R	lduh	[%r8 + %r9], %r20
	.word 0x847222dc  ! 2865: UDIV_I	udiv 	%r8, 0x02dc, %r2
	.word 0xcc720009  ! 2868: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc51a0009  ! 2868: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xc3ea1009  ! 2868: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc8320009  ! 2871: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc2020009  ! 2871: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xb1a209a9  ! 2871: FDIVs	fdivs	%f8, %f9, %f24
	.word 0xce720009  ! 2874: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xcb020009  ! 2874: LDF_R	ld	[%r8, %r9], %f5
	.word 0xec022e58  ! 2874: LDUW_I	lduw	[%r8 + 0x0e58], %r22
	.word 0xc3220009  ! 2877: STF_R	st	%f1, [%r9, %r8]
	.word 0xee120009  ! 2877: LDUH_R	lduh	[%r8 + %r9], %r23
	.word 0x8e720009  ! 2877: UDIV_R	udiv 	%r8, %r9, %r7
	.word 0xf4220009  ! 2880: STW_R	stw	%r26, [%r8 + %r9]
	.word 0xcd1a0009  ! 2880: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0x8c7229d4  ! 2880: UDIV_I	udiv 	%r8, 0x09d4, %r6
	.word 0xc2320009  ! 2883: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xce4a0009  ! 2883: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0x20800002  ! 2883: BN	bn,a	<label_0x2>
	.word 0xf0720009  ! 2886: STX_R	stx	%r24, [%r8 + %r9]
	.word 0xf71a0009  ! 2886: LDDF_R	ldd	[%r8, %r9], %f27
	.word 0xc3ea1009  ! 2886: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xed3a0009  ! 2889: STDF_R	std	%f22, [%r9, %r8]
	.word 0xce420009  ! 2889: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xe8f22c38  ! 2889: STXA_I	stxa	%r20, [%r8 + 0x0c38] %asi
	.word 0xc5220009  ! 2892: STF_R	st	%f2, [%r9, %r8]
	.word 0xe8120009  ! 2892: LDUH_R	lduh	[%r8 + %r9], %r20
	.word 0xe2fa27ec  ! 2892: SWAPA_I	swapa	%r17, [%r8 + 0x07ec] %asi
	.word 0xf13a0009  ! 2895: STDF_R	std	%f24, [%r9, %r8]
	.word 0xc9020009  ! 2895: LDF_R	ld	[%r8, %r9], %f4
	.word 0xc3ea1009  ! 2895: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xd6220009  ! 2898: STW_R	stw	%r11, [%r8 + %r9]
	.word 0xde5a0009  ! 2898: LDX_R	ldx	[%r8 + %r9], %r15
	.word 0x8efa259c  ! 2898: SDIVcc_I	sdivcc 	%r8, 0x059c, %r7
	.word 0xfc320009  ! 2901: STH_R	sth	%r30, [%r8 + %r9]
	.word 0xc45a0009  ! 2901: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0x8b220009  ! 2901: MULScc_R	mulscc 	%r8, %r9, %r5
	.word 0xc62a0009  ! 2904: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc6020009  ! 2904: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xbeda2244  ! 2904: SMULcc_I	smulcc 	%r8, 0x0244, %r31
	.word 0xd82a0009  ! 2907: STB_R	stb	%r12, [%r8 + %r9]
	.word 0xdc120009  ! 2907: LDUH_R	lduh	[%r8 + %r9], %r14
	.word 0x06c20001  ! 2907: BRLZ	brlz  ,nt	%8,<label_0x20001>
	.word 0xc22a0009  ! 2910: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc6020009  ! 2910: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xc47a2640  ! 2910: SWAP_I	swap	%r2, [%r8 + 0x0640]
	.word 0xff3a0009  ! 2913: STDF_R	std	%f31, [%r9, %r8]
	.word 0xc6520009  ! 2913: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xc3ea2104  ! 2913: PREFETCHA_I	prefetcha	[%r8, + 0x0104] %asi, #one_read
	.word 0xc53a0009  ! 2916: STDF_R	std	%f2, [%r9, %r8]
	.word 0xce4a0009  ! 2916: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0x84522620  ! 2916: UMUL_I	umul 	%r8, 0x0620, %r2
	.word 0xc82a0009  ! 2919: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xea020009  ! 2919: LDUW_R	lduw	[%r8 + %r9], %r21
	.word 0xcd220009  ! 2919: STF_R	st	%f6, [%r9, %r8]
	.word 0xca2a0009  ! 2922: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xe8420009  ! 2922: LDSW_R	ldsw	[%r8 + %r9], %r20
	.word 0xf2921009  ! 2922: LDUHA_R	lduha	[%r8, %r9] 0x80, %r25
	.word 0xf2320009  ! 2925: STH_R	sth	%r25, [%r8 + %r9]
	.word 0xca520009  ! 2925: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0x04c20001  ! 2925: BRLEZ	brlez  ,nt	%8,<label_0x20001>
	.word 0xf4320009  ! 2928: STH_R	sth	%r26, [%r8 + %r9]
	.word 0xc4020009  ! 2928: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0x8b220009  ! 2928: MULScc_R	mulscc 	%r8, %r9, %r5
	.word 0xcf220009  ! 2931: STF_R	st	%f7, [%r9, %r8]
	.word 0xe20a0009  ! 2931: LDUB_R	ldub	[%r8 + %r9], %r17
	.word 0xf6522960  ! 2931: LDSH_I	ldsh	[%r8 + 0x0960], %r27
	.word 0xcb220009  ! 2934: STF_R	st	%f5, [%r9, %r8]
	.word 0xcc520009  ! 2934: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0x1e800001  ! 2934: BVC	bvc  	<label_0x1>
	.word 0xdf3a0009  ! 2937: STDF_R	std	%f15, [%r9, %r8]
	.word 0xf8420009  ! 2937: LDSW_R	ldsw	[%r8 + %r9], %r28
	.word 0xf2a226bc  ! 2937: STWA_I	stwa	%r25, [%r8 + 0x06bc] %asi
	.word 0xca2a0009  ! 2940: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc8120009  ! 2940: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xca420009  ! 2940: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xc9220009  ! 2943: STF_R	st	%f4, [%r9, %r8]
	.word 0xc2420009  ! 2943: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xbef20009  ! 2943: UDIVcc_R	udivcc 	%r8, %r9, %r31
	.word 0xcf3a0009  ! 2946: STDF_R	std	%f7, [%r9, %r8]
	.word 0xda020009  ! 2946: LDUW_R	lduw	[%r8 + %r9], %r13
	.word 0xc4922a04  ! 2946: LDUHA_I	lduha	[%r8, + 0x0a04] %asi, %r2
	.word 0xc6320009  ! 2949: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xce5a0009  ! 2949: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xca0a0009  ! 2949: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xe33a0009  ! 2952: STDF_R	std	%f17, [%r9, %r8]
	.word 0xca5a0009  ! 2952: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0x8e6a2cc0  ! 2952: UDIVX_I	udivx 	%r8, 0x0cc0, %r7
	.word 0xca220009  ! 2955: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xda420009  ! 2955: LDSW_R	ldsw	[%r8 + %r9], %r13
	.word 0x18800001  ! 2955: BGU	bgu  	<label_0x1>
	.word 0xc9220009  ! 2958: STF_R	st	%f4, [%r9, %r8]
	.word 0xed020009  ! 2958: LDF_R	ld	[%r8, %r9], %f22
	.word 0xc3ea2ed8  ! 2958: PREFETCHA_I	prefetcha	[%r8, + 0x0ed8] %asi, #one_read
	.word 0xec320009  ! 2961: STH_R	sth	%r22, [%r8 + %r9]
	.word 0xf40a0009  ! 2961: LDUB_R	ldub	[%r8 + %r9], %r26
	.word 0xf8ca2504  ! 2961: LDSBA_I	ldsba	[%r8, + 0x0504] %asi, %r28
	.word 0xca320009  ! 2964: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc41a0009  ! 2964: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x89222a70  ! 2964: MULScc_I	mulscc 	%r8, 0x0a70, %r4
	.word 0xfa320009  ! 2967: STH_R	sth	%r29, [%r8 + %r9]
	.word 0xee420009  ! 2967: LDSW_R	ldsw	[%r8 + %r9], %r23
	.word 0xd6b21009  ! 2967: STHA_R	stha	%r11, [%r8 + %r9] 0x80
	.word 0xee720009  ! 2970: STX_R	stx	%r23, [%r8 + %r9]
	.word 0xcc4a0009  ! 2970: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0x8ed20009  ! 2970: UMULcc_R	umulcc 	%r8, %r9, %r7
	.word 0xd62a0009  ! 2973: STB_R	stb	%r11, [%r8 + %r9]
	.word 0xcc4a0009  ! 2973: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0x82f20009  ! 2973: UDIVcc_R	udivcc 	%r8, %r9, %r1
	.word 0xc2220009  ! 2976: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc2120009  ! 2976: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0x89220009  ! 2976: MULScc_R	mulscc 	%r8, %r9, %r4
	.word 0xea2a0009  ! 2979: STB_R	stb	%r21, [%r8 + %r9]
	.word 0xd91a0009  ! 2979: LDDF_R	ldd	[%r8, %r9], %f12
	.word 0xcca22e7c  ! 2979: STWA_I	stwa	%r6, [%r8 + 0x0e7c] %asi
	.word 0xf93a0009  ! 2982: STDF_R	std	%f28, [%r9, %r8]
	.word 0xcf020009  ! 2982: LDF_R	ld	[%r8, %r9], %f7
	.word 0xfc6a2d38  ! 2982: LDSTUB_I	ldstub	%r30, [%r8 + 0x0d38]
	.word 0xc6720009  ! 2985: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xce0a0009  ! 2985: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xc2aa1009  ! 2985: STBA_R	stba	%r1, [%r8 + %r9] 0x80
	.word 0xc4720009  ! 2988: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xcc1a0009  ! 2988: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xc53a27d8  ! 2988: STDF_I	std	%f2, [0x07d8, %r8]
	.word 0xc4320009  ! 2991: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc44a0009  ! 2991: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xc3ea1009  ! 2991: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xe82a0009  ! 2994: STB_R	stb	%r20, [%r8 + %r9]
	.word 0xf31a0009  ! 2994: LDDF_R	ldd	[%r8, %r9], %f25
	.word 0xc41a0009  ! 2994: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xe4220009  ! 2997: STW_R	stw	%r18, [%r8 + %r9]
	.word 0xde520009  ! 2997: LDSH_R	ldsh	[%r8 + %r9], %r15
	.word 0xccba1009  ! 2997: STDA_R	stda	%r6, [%r8 + %r9] 0x80
	.word 0xc6320009  ! 3000: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xf4520009  ! 3000: LDSH_R	ldsh	[%r8 + %r9], %r26
	.word 0xe0da2bf0  ! 3000: LDXA_I	ldxa	[%r8, + 0x0bf0] %asi, %r16
	.word 0xfc2a0009  ! 3003: STB_R	stb	%r30, [%r8 + %r9]
	.word 0xca4a0009  ! 3003: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xc68a1009  ! 3003: LDUBA_R	lduba	[%r8, %r9] 0x80, %r3
	.word 0xc42a0009  ! 3006: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xcc4a0009  ! 3006: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xb7a208a9  ! 3006: FSUBs	fsubs	%f8, %f9, %f27
	.word 0xc62a0009  ! 3009: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xfc5a0009  ! 3009: LDX_R	ldx	[%r8 + %r9], %r30
	.word 0xc33a2a30  ! 3009: STDF_I	std	%f1, [0x0a30, %r8]
	.word 0xf6320009  ! 3012: STH_R	sth	%r27, [%r8 + %r9]
	.word 0xc01a0009  ! 3012: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0xc36a0009  ! 3012: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xd73a0009  ! 3015: STDF_R	std	%f11, [%r9, %r8]
	.word 0xe25a0009  ! 3015: LDX_R	ldx	[%r8 + %r9], %r17
	.word 0xde6a2f98  ! 3015: LDSTUB_I	ldstub	%r15, [%r8 + 0x0f98]
	.word 0xce320009  ! 3018: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xf84a0009  ! 3018: LDSB_R	ldsb	[%r8 + %r9], %r28
	.word 0xc36a0009  ! 3018: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xf6220009  ! 3021: STW_R	stw	%r27, [%r8 + %r9]
	.word 0xc41a0009  ! 3021: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xad22212c  ! 3021: MULScc_I	mulscc 	%r8, 0x012c, %r22
	.word 0xcc2a0009  ! 3024: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc2020009  ! 3024: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xcc9a2008  ! 3024: LDDA_I	ldda	[%r8, + 0x0008] %asi, %r6
	.word 0xc6320009  ! 3027: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xcc1a0009  ! 3027: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0x8a5a2d34  ! 3027: SMUL_I	smul 	%r8, 0x0d34, %r5
	.word 0xf6320009  ! 3030: STH_R	sth	%r27, [%r8 + %r9]
	.word 0xc2020009  ! 3030: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xc36a0009  ! 3030: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xdc220009  ! 3033: STW_R	stw	%r14, [%r8 + %r9]
	.word 0xec120009  ! 3033: LDUH_R	lduh	[%r8 + %r9], %r22
	.word 0xe0f22de8  ! 3033: STXA_I	stxa	%r16, [%r8 + 0x0de8] %asi
	.word 0xc4720009  ! 3036: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc24a0009  ! 3036: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xcc1a0009  ! 3036: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xc2320009  ! 3039: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc24a0009  ! 3039: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xc3ea2494  ! 3039: PREFETCHA_I	prefetcha	[%r8, + 0x0494] %asi, #one_read
	.word 0xfd220009  ! 3042: STF_R	st	%f30, [%r9, %r8]
	.word 0xcc020009  ! 3042: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xc2822598  ! 3042: LDUWA_I	lduwa	[%r8, + 0x0598] %asi, %r1
	.word 0xc62a0009  ! 3045: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xdc1a0009  ! 3045: LDD_R	ldd	[%r8 + %r9], %r14
	.word 0x827a0009  ! 3045: SDIV_R	sdiv 	%r8, %r9, %r1
	.word 0xdc720009  ! 3048: STX_R	stx	%r14, [%r8 + %r9]
	.word 0xd6520009  ! 3048: LDSH_R	ldsh	[%r8 + %r9], %r11
	.word 0xb25a0009  ! 3048: SMUL_R	smul 	%r8, %r9, %r25
	.word 0xcc320009  ! 3051: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xcd1a0009  ! 3051: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xd8120009  ! 3051: LDUH_R	lduh	[%r8 + %r9], %r12
	.word 0xc6220009  ! 3054: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xcb020009  ! 3054: LDF_R	ld	[%r8, %r9], %f5
	.word 0x9a4a2ca8  ! 3054: MULX_I	mulx 	%r8, 0x0ca8, %r13
	.word 0xc42a0009  ! 3057: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xca420009  ! 3057: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xc2f22b18  ! 3057: STXA_I	stxa	%r1, [%r8 + 0x0b18] %asi
	.word 0xc8720009  ! 3060: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xcc120009  ! 3060: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xb4da0009  ! 3060: SMULcc_R	smulcc 	%r8, %r9, %r26
	.word 0xc82a0009  ! 3063: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xff1a0009  ! 3063: LDDF_R	ldd	[%r8, %r9], %f31
	.word 0x02c20001  ! 3063: BRZ	brz  ,nt	%8,<label_0x20001>
	.word 0xc2320009  ! 3066: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xd64a0009  ! 3066: LDSB_R	ldsb	[%r8 + %r9], %r11
	.word 0x8143c000  ! 3066: STBAR	stbar
	.word 0xe73a0009  ! 3069: STDF_R	std	%f19, [%r9, %r8]
	.word 0xc4120009  ! 3069: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xc3ea1009  ! 3069: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xf7220009  ! 3072: STF_R	st	%f27, [%r9, %r8]
	.word 0xca5a0009  ! 3072: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xc9f22009  ! 3072: CASXA_R	casxa	[%r8]%asi, %r9, %r4
	.word 0xc73a0009  ! 3075: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc71a0009  ! 3075: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xc4b21009  ! 3075: STHA_R	stha	%r2, [%r8 + %r9] 0x80
	.word 0xee320009  ! 3078: STH_R	sth	%r23, [%r8 + %r9]
	.word 0xfa020009  ! 3078: LDUW_R	lduw	[%r8 + %r9], %r29
	.word 0xa76a2684  ! 3078: SDIVX_I	sdivx	%r8, 0x0684, %r19
	.word 0xc4220009  ! 3081: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xcb020009  ! 3081: LDF_R	ld	[%r8, %r9], %f5
	.word 0xceaa2df0  ! 3081: STBA_I	stba	%r7, [%r8 + 0x0df0] %asi
	.word 0xc2220009  ! 3084: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc31a0009  ! 3084: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xb052277c  ! 3084: UMUL_I	umul 	%r8, 0x077c, %r24
	.word 0xea2a0009  ! 3087: STB_R	stb	%r21, [%r8 + %r9]
	.word 0xc6520009  ! 3087: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0x8143e00a  ! 3087: MEMBAR	membar	#StoreLoad | #StoreStore 
	.word 0xc2320009  ! 3090: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc71a0009  ! 3090: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xf45a0009  ! 3090: LDX_R	ldx	[%r8 + %r9], %r26
	.word 0xcb220009  ! 3093: STF_R	st	%f5, [%r9, %r8]
	.word 0xc20a0009  ! 3093: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xb2d22c58  ! 3093: UMULcc_I	umulcc 	%r8, 0x0c58, %r25
	.word 0xc6220009  ! 3096: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc25a0009  ! 3096: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xc2b2271c  ! 3096: STHA_I	stha	%r1, [%r8 + 0x071c] %asi
	.word 0xc2220009  ! 3099: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc80a0009  ! 3099: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0x8143e04e  ! 3099: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Sync 
	.word 0xcd220009  ! 3102: STF_R	st	%f6, [%r9, %r8]
	.word 0xf45a0009  ! 3102: LDX_R	ldx	[%r8 + %r9], %r26
	.word 0xc36a0009  ! 3102: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc3220009  ! 3105: STF_R	st	%f1, [%r9, %r8]
	.word 0xcc120009  ! 3105: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0x8ad20009  ! 3105: UMULcc_R	umulcc 	%r8, %r9, %r5
	.word 0xc4320009  ! 3108: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xda4a0009  ! 3108: LDSB_R	ldsb	[%r8 + %r9], %r13
	.word 0x8143c000  ! 3108: STBAR	stbar
	.word 0xc8220009  ! 3111: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xcc420009  ! 3111: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xc6a21009  ! 3111: STWA_R	stwa	%r3, [%r8 + %r9] 0x80
	.word 0xf73a0009  ! 3114: STDF_R	std	%f27, [%r9, %r8]
	.word 0xc45a0009  ! 3114: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0x8143e005  ! 3114: MEMBAR	membar	#LoadLoad | #LoadStore 
	.word 0xc42a0009  ! 3117: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xea0a0009  ! 3117: LDUB_R	ldub	[%r8 + %r9], %r21
	.word 0x84720009  ! 3117: UDIV_R	udiv 	%r8, %r9, %r2
	.word 0xc5220009  ! 3120: STF_R	st	%f2, [%r9, %r8]
	.word 0xc2120009  ! 3120: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0x8af221f4  ! 3120: UDIVcc_I	udivcc 	%r8, 0x01f4, %r5
	.word 0xcc2a0009  ! 3123: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xf84a0009  ! 3123: LDSB_R	ldsb	[%r8 + %r9], %r28
	.word 0xcb3a2c40  ! 3123: STDF_I	std	%f5, [0x0c40, %r8]
	.word 0xe0220009  ! 3126: STW_R	stw	%r16, [%r8 + %r9]
	.word 0xfe0a0009  ! 3126: LDUB_R	ldub	[%r8 + %r9], %r31
	.word 0xc8ba2598  ! 3126: STDA_I	stda	%r4, [%r8 + 0x0598] %asi
	.word 0xc8220009  ! 3129: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc9020009  ! 3129: LDF_R	ld	[%r8, %r9], %f4
	.word 0x8143e01a  ! 3129: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside 
	.word 0xcc2a0009  ! 3132: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc8420009  ! 3132: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0x8143e04c  ! 3132: MEMBAR	membar	#LoadStore | #StoreStore | #Sync 
	.word 0xce220009  ! 3135: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xd84a0009  ! 3135: LDSB_R	ldsb	[%r8 + %r9], %r12
	.word 0xb66a0009  ! 3135: UDIVX_R	udivx 	%r8, %r9, %r27
	.word 0xce720009  ! 3138: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc4120009  ! 3138: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0x8143c000  ! 3138: STBAR	stbar
	.word 0xd8320009  ! 3141: STH_R	sth	%r12, [%r8 + %r9]
	.word 0xc85a0009  ! 3141: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xceb21009  ! 3141: STHA_R	stha	%r7, [%r8 + %r9] 0x80
	.word 0xce720009  ! 3144: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc8020009  ! 3144: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xf7020009  ! 3144: LDF_R	ld	[%r8, %r9], %f27
	.word 0xf3220009  ! 3147: STF_R	st	%f25, [%r9, %r8]
	.word 0xe65a0009  ! 3147: LDX_R	ldx	[%r8 + %r9], %r19
	.word 0x8143e04b  ! 3147: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Sync 
	.word 0xeb220009  ! 3150: STF_R	st	%f21, [%r9, %r8]
	.word 0xfc1a0009  ! 3150: LDD_R	ldd	[%r8 + %r9], %r30
	.word 0xc89a1009  ! 3150: LDDA_R	ldda	[%r8, %r9] 0x80, %r4
	.word 0xc2220009  ! 3153: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xcc020009  ! 3153: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0x2c800002  ! 3153: BNEG	bneg,a	<label_0x2>
	.word 0xf4320009  ! 3156: STH_R	sth	%r26, [%r8 + %r9]
	.word 0xd65a0009  ! 3156: LDX_R	ldx	[%r8 + %r9], %r11
	.word 0xc36a28a0  ! 3156: PREFETCH_I	prefetch	[%r8 + 0x08a0], #one_read
	.word 0xc4720009  ! 3159: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xf7020009  ! 3159: LDF_R	ld	[%r8, %r9], %f27
	.word 0x847a2fe0  ! 3159: SDIV_I	sdiv 	%r8, 0x0fe0, %r2
	.word 0xcb3a0009  ! 3162: STDF_R	std	%f5, [%r9, %r8]
	.word 0xc6520009  ! 3162: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xcc9a25e8  ! 3162: LDDA_I	ldda	[%r8, + 0x05e8] %asi, %r6
	.word 0xcc220009  ! 3165: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xd8420009  ! 3165: LDSW_R	ldsw	[%r8 + %r9], %r12
	.word 0xcca21009  ! 3165: STWA_R	stwa	%r6, [%r8 + %r9] 0x80
	.word 0xcf220009  ! 3168: STF_R	st	%f7, [%r9, %r8]
	.word 0xf5020009  ! 3168: LDF_R	ld	[%r8, %r9], %f26
	.word 0x8da208a9  ! 3168: FSUBs	fsubs	%f8, %f9, %f6
	.word 0xc42a0009  ! 3171: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xf85a0009  ! 3171: LDX_R	ldx	[%r8 + %r9], %r28
	.word 0x8143c000  ! 3171: STBAR	stbar
	.word 0xc8720009  ! 3174: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xee420009  ! 3174: LDSW_R	ldsw	[%r8 + %r9], %r23
	.word 0xf5f22009  ! 3174: CASXA_R	casxa	[%r8]%asi, %r9, %r26
	.word 0xed220009  ! 3177: STF_R	st	%f22, [%r9, %r8]
	.word 0xcf020009  ! 3177: LDF_R	ld	[%r8, %r9], %f7
	.word 0x8da20929  ! 3177: FMULs	fmuls	%f8, %f9, %f6
	.word 0xc33a0009  ! 3180: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc01a0009  ! 3180: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0xc53a0009  ! 3180: STDF_R	std	%f2, [%r9, %r8]
	.word 0xeb220009  ! 3183: STF_R	st	%f21, [%r9, %r8]
	.word 0xc24a0009  ! 3183: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xc3ea1009  ! 3183: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xcc2a0009  ! 3186: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xd84a0009  ! 3186: LDSB_R	ldsb	[%r8 + %r9], %r12
	.word 0x8fa20829  ! 3186: FADDs	fadds	%f8, %f9, %f7
	.word 0xc2320009  ! 3189: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xca120009  ! 3189: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xa2720009  ! 3189: UDIV_R	udiv 	%r8, %r9, %r17
	.word 0xcd220009  ! 3192: STF_R	st	%f6, [%r9, %r8]
	.word 0xce4a0009  ! 3192: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0x8a520009  ! 3192: UMUL_R	umul 	%r8, %r9, %r5
	.word 0xc22a0009  ! 3195: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc51a0009  ! 3195: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0x10800002  ! 3195: BA	ba  	<label_0x2>
	.word 0xc6320009  ! 3198: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xf80a0009  ! 3198: LDUB_R	ldub	[%r8 + %r9], %r28
	.word 0x24c20001  ! 3198: BRLEZ	brlez,a,nt	%8,<label_0x20001>
	.word 0xfb3a0009  ! 3201: STDF_R	std	%f29, [%r9, %r8]
	.word 0xca520009  ! 3201: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0x8efa0009  ! 3201: SDIVcc_R	sdivcc 	%r8, %r9, %r7
	.word 0xca220009  ! 3204: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xdc420009  ! 3204: LDSW_R	ldsw	[%r8 + %r9], %r14
	.word 0x8c4a2088  ! 3204: MULX_I	mulx 	%r8, 0x0088, %r6
	.word 0xf8720009  ! 3207: STX_R	stx	%r28, [%r8 + %r9]
	.word 0xfc520009  ! 3207: LDSH_R	ldsh	[%r8 + %r9], %r30
	.word 0xbe7a2628  ! 3207: SDIV_I	sdiv 	%r8, 0x0628, %r31
	.word 0xe8320009  ! 3210: STH_R	sth	%r20, [%r8 + %r9]
	.word 0xcf020009  ! 3210: LDF_R	ld	[%r8, %r9], %f7
	.word 0xc88a2b5c  ! 3210: LDUBA_I	lduba	[%r8, + 0x0b5c] %asi, %r4
	.word 0xc4320009  ! 3213: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xca420009  ! 3213: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xcf3a0009  ! 3213: STDF_R	std	%f7, [%r9, %r8]
	.word 0xfc720009  ! 3216: STX_R	stx	%r30, [%r8 + %r9]
	.word 0xe8520009  ! 3216: LDSH_R	ldsh	[%r8 + %r9], %r20
	.word 0x82520009  ! 3216: UMUL_R	umul 	%r8, %r9, %r1
	.word 0xca720009  ! 3219: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xea020009  ! 3219: LDUW_R	lduw	[%r8 + %r9], %r21
	.word 0x82520009  ! 3219: UMUL_R	umul 	%r8, %r9, %r1
	.word 0xc53a0009  ! 3222: STDF_R	std	%f2, [%r9, %r8]
	.word 0xce4a0009  ! 3222: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0x2ec20001  ! 3222: BRGEZ	brgez,a,nt	%8,<label_0x20001>
	.word 0xc93a0009  ! 3225: STDF_R	std	%f4, [%r9, %r8]
	.word 0xcd1a0009  ! 3225: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0x846a21dc  ! 3225: UDIVX_I	udivx 	%r8, 0x01dc, %r2
	.word 0xca720009  ! 3228: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xf11a0009  ! 3228: LDDF_R	ldd	[%r8, %r9], %f24
	.word 0x8143e054  ! 3228: MEMBAR	membar	#LoadStore | #Lookaside | #Sync 
	.word 0xc62a0009  ! 3231: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc9020009  ! 3231: LDF_R	ld	[%r8, %r9], %f4
	.word 0xc36a28c8  ! 3231: PREFETCH_I	prefetch	[%r8 + 0x08c8], #one_read
	.word 0xcd220009  ! 3234: STF_R	st	%f6, [%r9, %r8]
	.word 0xc4020009  ! 3234: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0x88da0009  ! 3234: SMULcc_R	smulcc 	%r8, %r9, %r4
	.word 0xc73a0009  ! 3237: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc45a0009  ! 3237: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0x8143c000  ! 3237: STBAR	stbar
	.word 0xcc720009  ! 3240: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc44a0009  ! 3240: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xcf222c38  ! 3240: STF_I	st	%f7, [0x0c38, %r8]
	.word 0xca720009  ! 3243: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc9020009  ! 3243: LDF_R	ld	[%r8, %r9], %f4
	.word 0x8efa2b74  ! 3243: SDIVcc_I	sdivcc 	%r8, 0x0b74, %r7
	.word 0xd8320009  ! 3246: STH_R	sth	%r12, [%r8 + %r9]
	.word 0xc4420009  ! 3246: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0x8a4a2490  ! 3246: MULX_I	mulx 	%r8, 0x0490, %r5
	.word 0xce2a0009  ! 3249: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xfe120009  ! 3249: LDUH_R	lduh	[%r8 + %r9], %r31
	.word 0xbc4a0009  ! 3249: MULX_R	mulx 	%r8, %r9, %r30
	.word 0xf02a0009  ! 3252: STB_R	stb	%r24, [%r8 + %r9]
	.word 0xc41a0009  ! 3252: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x2e800002  ! 3252: BVS	bvs,a	<label_0x2>
	.word 0xeb220009  ! 3255: STF_R	st	%f21, [%r9, %r8]
	.word 0xf64a0009  ! 3255: LDSB_R	ldsb	[%r8 + %r9], %r27
	.word 0xa9222718  ! 3255: MULScc_I	mulscc 	%r8, 0x0718, %r20
	.word 0xc2720009  ! 3258: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xd80a0009  ! 3258: LDUB_R	ldub	[%r8 + %r9], %r12
	.word 0xca0a2edc  ! 3258: LDUB_I	ldub	[%r8 + 0x0edc], %r5
	.word 0xf0320009  ! 3261: STH_R	sth	%r24, [%r8 + %r9]
	.word 0xc2520009  ! 3261: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xcf3a2830  ! 3261: STDF_I	std	%f7, [0x0830, %r8]
	.word 0xc9220009  ! 3264: STF_R	st	%f4, [%r9, %r8]
	.word 0xc8420009  ! 3264: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xccf21009  ! 3264: STXA_R	stxa	%r6, [%r8 + %r9] 0x80
	.word 0xc62a0009  ! 3267: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xf31a0009  ! 3267: LDDF_R	ldd	[%r8, %r9], %f25
	.word 0xc36a0009  ! 3267: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xd9220009  ! 3270: STF_R	st	%f12, [%r9, %r8]
	.word 0xc8120009  ! 3270: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0x84d20009  ! 3270: UMULcc_R	umulcc 	%r8, %r9, %r2
	.word 0xce220009  ! 3273: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc41a0009  ! 3273: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xc8120009  ! 3273: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xc22a0009  ! 3276: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc2120009  ! 3276: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xada20929  ! 3276: FMULs	fmuls	%f8, %f9, %f22
	.word 0xe8320009  ! 3279: STH_R	sth	%r20, [%r8 + %r9]
	.word 0xc51a0009  ! 3279: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xcac21009  ! 3279: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r5
	.word 0xca320009  ! 3282: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc2020009  ! 3282: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xac722304  ! 3282: UDIV_I	udiv 	%r8, 0x0304, %r22
	.word 0xd9220009  ! 3285: STF_R	st	%f12, [%r9, %r8]
	.word 0xf51a0009  ! 3285: LDDF_R	ldd	[%r8, %r9], %f26
	.word 0xae4a0009  ! 3285: MULX_R	mulx 	%r8, %r9, %r23
	.word 0xcc720009  ! 3288: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc2120009  ! 3288: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xce6a2940  ! 3288: LDSTUB_I	ldstub	%r7, [%r8 + 0x0940]
	.word 0xc73a0009  ! 3291: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc24a0009  ! 3291: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0x9c7a0009  ! 3291: SDIV_R	sdiv 	%r8, %r9, %r14
	.word 0xcc720009  ! 3294: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xe6420009  ! 3294: LDSW_R	ldsw	[%r8 + %r9], %r19
	.word 0x8143c000  ! 3294: STBAR	stbar
	.word 0xcc220009  ! 3297: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xca020009  ! 3297: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0x08800001  ! 3297: BLEU	bleu  	<label_0x1>
	.word 0xc4720009  ! 3300: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xcc520009  ! 3300: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0x8143c000  ! 3300: STBAR	stbar
	.word 0xcb3a0009  ! 3303: STDF_R	std	%f5, [%r9, %r8]
	.word 0xcc120009  ! 3303: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xe8b22c48  ! 3303: STHA_I	stha	%r20, [%r8 + 0x0c48] %asi
	.word 0xca2a0009  ! 3306: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc65a0009  ! 3306: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xce5a2338  ! 3306: LDX_I	ldx	[%r8 + 0x0338], %r7
	.word 0xca720009  ! 3309: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xec420009  ! 3309: LDSW_R	ldsw	[%r8 + %r9], %r22
	.word 0x8143c000  ! 3309: STBAR	stbar
	.word 0xf1220009  ! 3312: STF_R	st	%f24, [%r9, %r8]
	.word 0xc2520009  ! 3312: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0x884a2bd0  ! 3312: MULX_I	mulx 	%r8, 0x0bd0, %r4
	.word 0xff220009  ! 3315: STF_R	st	%f31, [%r9, %r8]
	.word 0xce4a0009  ! 3315: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xc36a2fc0  ! 3315: PREFETCH_I	prefetch	[%r8 + 0x0fc0], #one_read
	.word 0xca220009  ! 3318: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xcf020009  ! 3318: LDF_R	ld	[%r8, %r9], %f7
	.word 0xc36a0009  ! 3318: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xcc220009  ! 3321: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xeb1a0009  ! 3321: LDDF_R	ldd	[%r8, %r9], %f21
	.word 0xc36a226c  ! 3321: PREFETCH_I	prefetch	[%r8 + 0x026c], #one_read
	.word 0xce220009  ! 3324: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xca520009  ! 3324: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xc3ea1009  ! 3324: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xe8220009  ! 3327: STW_R	stw	%r20, [%r8 + %r9]
	.word 0xea020009  ! 3327: LDUW_R	lduw	[%r8 + %r9], %r21
	.word 0xc8fa1009  ! 3327: SWAPA_R	swapa	%r4, [%r8 + %r9] 0x80
	.word 0xfc320009  ! 3330: STH_R	sth	%r30, [%r8 + %r9]
	.word 0xca0a0009  ! 3330: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xecea1009  ! 3330: LDSTUBA_R	ldstuba	%r22, [%r8 + %r9] 0x80
	.word 0xc6220009  ! 3333: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xce5a0009  ! 3333: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xc3ea1009  ! 3333: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xe82a0009  ! 3336: STB_R	stb	%r20, [%r8 + %r9]
	.word 0xfe120009  ! 3336: LDUH_R	lduh	[%r8 + %r9], %r31
	.word 0xf09a1009  ! 3336: LDDA_R	ldda	[%r8, %r9] 0x80, %r24
	.word 0xcf220009  ! 3339: STF_R	st	%f7, [%r9, %r8]
	.word 0xe6120009  ! 3339: LDUH_R	lduh	[%r8 + %r9], %r19
	.word 0x8a722f14  ! 3339: UDIV_I	udiv 	%r8, 0x0f14, %r5
	.word 0xe2720009  ! 3342: STX_R	stx	%r17, [%r8 + %r9]
	.word 0xdd020009  ! 3342: LDF_R	ld	[%r8, %r9], %f14
	.word 0xc48a1009  ! 3342: LDUBA_R	lduba	[%r8, %r9] 0x80, %r2
	.word 0xdf3a0009  ! 3345: STDF_R	std	%f15, [%r9, %r8]
	.word 0xe4120009  ! 3345: LDUH_R	lduh	[%r8 + %r9], %r18
	.word 0xc27a0009  ! 3345: SWAP_R	swap	%r1, [%r8 + %r9]
	.word 0xce2a0009  ! 3348: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc4120009  ! 3348: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0x8143c000  ! 3348: STBAR	stbar
	.word 0xef220009  ! 3351: STF_R	st	%f23, [%r9, %r8]
	.word 0xc24a0009  ! 3351: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0x9ba20929  ! 3351: FMULs	fmuls	%f8, %f9, %f13
	.word 0xeb3a0009  ! 3354: STDF_R	std	%f21, [%r9, %r8]
	.word 0xc4020009  ! 3354: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xc3ea2720  ! 3354: PREFETCHA_I	prefetcha	[%r8, + 0x0720] %asi, #one_read
	.word 0xc4720009  ! 3357: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xe71a0009  ! 3357: LDDF_R	ldd	[%r8, %r9], %f19
	.word 0xdca21009  ! 3357: STWA_R	stwa	%r14, [%r8 + %r9] 0x80
	.word 0xc82a0009  ! 3360: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xcc5a0009  ! 3360: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xb9220009  ! 3360: MULScc_R	mulscc 	%r8, %r9, %r28
	.word 0xce320009  ! 3363: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xcc1a0009  ! 3363: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0x8e6a2418  ! 3363: UDIVX_I	udivx 	%r8, 0x0418, %r7
	.word 0xe53a0009  ! 3366: STDF_R	std	%f18, [%r9, %r8]
	.word 0xf20a0009  ! 3366: LDUB_R	ldub	[%r8 + %r9], %r25
	.word 0x04800002  ! 3366: BLE	ble  	<label_0x2>
	.word 0xc6220009  ! 3369: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xe2520009  ! 3369: LDSH_R	ldsh	[%r8 + %r9], %r17
	.word 0x887226c4  ! 3369: UDIV_I	udiv 	%r8, 0x06c4, %r4
	.word 0xdc220009  ! 3372: STW_R	stw	%r14, [%r8 + %r9]
	.word 0xf51a0009  ! 3372: LDDF_R	ldd	[%r8, %r9], %f26
	.word 0xc36a0009  ! 3372: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xdf220009  ! 3375: STF_R	st	%f15, [%r9, %r8]
	.word 0xff1a0009  ! 3375: LDDF_R	ldd	[%r8, %r9], %f31
	.word 0xcc7a2900  ! 3375: SWAP_I	swap	%r6, [%r8 + 0x0900]
	.word 0xc5220009  ! 3378: STF_R	st	%f2, [%r9, %r8]
	.word 0xde0a0009  ! 3378: LDUB_R	ldub	[%r8 + %r9], %r15
	.word 0xc3ea2658  ! 3378: PREFETCHA_I	prefetcha	[%r8, + 0x0658] %asi, #one_read
	.word 0xc4720009  ! 3381: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc4120009  ! 3381: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xccba2548  ! 3381: STDA_I	stda	%r6, [%r8 + 0x0548] %asi
	.word 0xce2a0009  ! 3384: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xde5a0009  ! 3384: LDX_R	ldx	[%r8 + %r9], %r15
	.word 0xc6f22e38  ! 3384: STXA_I	stxa	%r3, [%r8 + 0x0e38] %asi
	.word 0xc62a0009  ! 3387: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xf01a0009  ! 3387: LDD_R	ldd	[%r8 + %r9], %r24
	.word 0xf28a1009  ! 3387: LDUBA_R	lduba	[%r8, %r9] 0x80, %r25
	.word 0xc82a0009  ! 3390: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xe0420009  ! 3390: LDSW_R	ldsw	[%r8 + %r9], %r16
	.word 0x06c20001  ! 3390: BRLZ	brlz  ,nt	%8,<label_0x20001>
	.word 0xc93a0009  ! 3393: STDF_R	std	%f4, [%r9, %r8]
	.word 0xcc4a0009  ! 3393: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0x8da20829  ! 3393: FADDs	fadds	%f8, %f9, %f6
	.word 0xff3a0009  ! 3396: STDF_R	std	%f31, [%r9, %r8]
	.word 0xca4a0009  ! 3396: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xc8c21009  ! 3396: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r4
	.word 0xda2a0009  ! 3399: STB_R	stb	%r13, [%r8 + %r9]
	.word 0xe24a0009  ! 3399: LDSB_R	ldsb	[%r8 + %r9], %r17
	.word 0xca922f40  ! 3399: LDUHA_I	lduha	[%r8, + 0x0f40] %asi, %r5
	.word 0xfa320009  ! 3402: STH_R	sth	%r29, [%r8 + %r9]
	.word 0xc65a0009  ! 3402: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xce5a0009  ! 3402: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xca220009  ! 3405: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc8120009  ! 3405: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0x8143c000  ! 3405: STBAR	stbar
	.word 0xc7220009  ! 3408: STF_R	st	%f3, [%r9, %r8]
	.word 0xf05a0009  ! 3408: LDX_R	ldx	[%r8 + %r9], %r24
	.word 0x85a20829  ! 3408: FADDs	fadds	%f8, %f9, %f2
	.word 0xd6320009  ! 3411: STH_R	sth	%r11, [%r8 + %r9]
	.word 0xc85a0009  ! 3411: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xcd3a2a28  ! 3411: STDF_I	std	%f6, [0x0a28, %r8]
	.word 0xcf3a0009  ! 3414: STDF_R	std	%f7, [%r9, %r8]
	.word 0xfb020009  ! 3414: LDF_R	ld	[%r8, %r9], %f29
	.word 0x87222f84  ! 3414: MULScc_I	mulscc 	%r8, 0x0f84, %r3
	.word 0xc7220009  ! 3417: STF_R	st	%f3, [%r9, %r8]
	.word 0xc31a0009  ! 3417: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xc4f21009  ! 3417: STXA_R	stxa	%r2, [%r8 + %r9] 0x80
	.word 0xc9220009  ! 3420: STF_R	st	%f4, [%r9, %r8]
	.word 0xf8120009  ! 3420: LDUH_R	lduh	[%r8 + %r9], %r28
	.word 0x8143e02a  ! 3420: MEMBAR	membar	#StoreLoad | #StoreStore | #MemIssue 
	.word 0xc6320009  ! 3423: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xea420009  ! 3423: LDSW_R	ldsw	[%r8 + %r9], %r21
	.word 0x16800001  ! 3423: BGE	bge  	<label_0x1>
	.word 0xf2720009  ! 3426: STX_R	stx	%r25, [%r8 + %r9]
	.word 0xc81a0009  ! 3426: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xcc4a291c  ! 3426: LDSB_I	ldsb	[%r8 + 0x091c], %r6
	.word 0xca320009  ! 3429: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xe20a0009  ! 3429: LDUB_R	ldub	[%r8 + %r9], %r17
	.word 0x8143e052  ! 3429: MEMBAR	membar	#StoreLoad | #Lookaside | #Sync 
	.word 0xcc220009  ! 3432: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xd60a0009  ! 3432: LDUB_R	ldub	[%r8 + %r9], %r11
	.word 0x8143c000  ! 3432: STBAR	stbar
	.word 0xc62a0009  ! 3435: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xca5a0009  ! 3435: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0x8afa2ff8  ! 3435: SDIVcc_I	sdivcc 	%r8, 0x0ff8, %r5
	.word 0xca720009  ! 3438: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xcb1a0009  ! 3438: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0x8ed22b1c  ! 3438: UMULcc_I	umulcc 	%r8, 0x0b1c, %r7
	.word 0xe6220009  ! 3441: STW_R	stw	%r19, [%r8 + %r9]
	.word 0xcc0a0009  ! 3441: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0x866a2340  ! 3441: UDIVX_I	udivx 	%r8, 0x0340, %r3
	.word 0xc62a0009  ! 3444: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xcc4a0009  ! 3444: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xc4fa2224  ! 3444: SWAPA_I	swapa	%r2, [%r8 + 0x0224] %asi
	.word 0xcf220009  ! 3447: STF_R	st	%f7, [%r9, %r8]
	.word 0xc2420009  ! 3447: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xcc0a0009  ! 3447: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xc2320009  ! 3450: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xf6520009  ! 3450: LDSH_R	ldsh	[%r8 + %r9], %r27
	.word 0x26ca0001  ! 3450: BRLZ	brlz,a,pt	%8,<label_0xa0001>
	.word 0xe62a0009  ! 3453: STB_R	stb	%r19, [%r8 + %r9]
	.word 0xe01a0009  ! 3453: LDD_R	ldd	[%r8 + %r9], %r16
	.word 0x8a7a0009  ! 3453: SDIV_R	sdiv 	%r8, %r9, %r5
	.word 0xce720009  ! 3456: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xfc1a0009  ! 3456: LDD_R	ldd	[%r8 + %r9], %r30
	.word 0x864a2228  ! 3456: MULX_I	mulx 	%r8, 0x0228, %r3
	.word 0xca220009  ! 3459: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xe40a0009  ! 3459: LDUB_R	ldub	[%r8 + %r9], %r18
	.word 0x9c7a2250  ! 3459: SDIV_I	sdiv 	%r8, 0x0250, %r14
	.word 0xe6220009  ! 3462: STW_R	stw	%r19, [%r8 + %r9]
	.word 0xf31a0009  ! 3462: LDDF_R	ldd	[%r8, %r9], %f25
	.word 0x8da20829  ! 3462: FADDs	fadds	%f8, %f9, %f6
	.word 0xf4320009  ! 3465: STH_R	sth	%r26, [%r8 + %r9]
	.word 0xc6020009  ! 3465: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0x8da209a9  ! 3465: FDIVs	fdivs	%f8, %f9, %f6
	.word 0xc33a0009  ! 3468: STDF_R	std	%f1, [%r9, %r8]
	.word 0xce020009  ! 3468: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xb3a20929  ! 3468: FMULs	fmuls	%f8, %f9, %f25
	.word 0xcb220009  ! 3471: STF_R	st	%f5, [%r9, %r8]
	.word 0xf9020009  ! 3471: LDF_R	ld	[%r8, %r9], %f28
	.word 0xaada2ee0  ! 3471: SMULcc_I	smulcc 	%r8, 0x0ee0, %r21
	.word 0xc7220009  ! 3474: STF_R	st	%f3, [%r9, %r8]
	.word 0xc84a0009  ! 3474: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0x8143c000  ! 3474: STBAR	stbar
	.word 0xc4720009  ! 3477: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xe81a0009  ! 3477: LDD_R	ldd	[%r8 + %r9], %r20
	.word 0x02c20001  ! 3477: BRZ	brz  ,nt	%8,<label_0x20001>
	.word 0xc2720009  ! 3480: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xf2120009  ! 3480: LDUH_R	lduh	[%r8 + %r9], %r25
	.word 0xc5e21009  ! 3480: CASA_I	casa	[%r8] 0x80, %r9, %r2
	.word 0xef220009  ! 3483: STF_R	st	%f23, [%r9, %r8]
	.word 0xfe0a0009  ! 3483: LDUB_R	ldub	[%r8 + %r9], %r31
	.word 0x896a2454  ! 3483: SDIVX_I	sdivx	%r8, 0x0454, %r4
	.word 0xe6320009  ! 3486: STH_R	sth	%r19, [%r8 + %r9]
	.word 0xe0120009  ! 3486: LDUH_R	lduh	[%r8 + %r9], %r16
	.word 0xf40228ac  ! 3486: LDUW_I	lduw	[%r8 + 0x08ac], %r26
	.word 0xf8320009  ! 3489: STH_R	sth	%r28, [%r8 + %r9]
	.word 0xce120009  ! 3489: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0x845a29a4  ! 3489: SMUL_I	smul 	%r8, 0x09a4, %r2
	.word 0xcb220009  ! 3492: STF_R	st	%f5, [%r9, %r8]
	.word 0xc8520009  ! 3492: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xf33a2228  ! 3492: STDF_I	std	%f25, [0x0228, %r8]
	.word 0xcb3a0009  ! 3495: STDF_R	std	%f5, [%r9, %r8]
	.word 0xec020009  ! 3495: LDUW_R	lduw	[%r8 + %r9], %r22
	.word 0xb2d20009  ! 3495: UMULcc_R	umulcc 	%r8, %r9, %r25
	.word 0xde320009  ! 3498: STH_R	sth	%r15, [%r8 + %r9]
	.word 0xec520009  ! 3498: LDSH_R	ldsh	[%r8 + %r9], %r22
	.word 0xb16a29ec  ! 3498: SDIVX_I	sdivx	%r8, 0x09ec, %r24
	.word 0xc93a0009  ! 3501: STDF_R	std	%f4, [%r9, %r8]
	.word 0xcc4a0009  ! 3501: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xfcba2708  ! 3501: STDA_I	stda	%r30, [%r8 + 0x0708] %asi
	.word 0xc4320009  ! 3504: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xcc0a0009  ! 3504: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xefe22009  ! 3504: CASA_R	casa	[%r8] %asi, %r9, %r23
	.word 0xd7220009  ! 3507: STF_R	st	%f11, [%r9, %r8]
	.word 0xc6420009  ! 3507: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xd6522b5c  ! 3507: LDSH_I	ldsh	[%r8 + 0x0b5c], %r11
	.word 0xc4220009  ! 3510: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xd64a0009  ! 3510: LDSB_R	ldsb	[%r8 + %r9], %r11
	.word 0xc93a0009  ! 3510: STDF_R	std	%f4, [%r9, %r8]
	.word 0xcd3a0009  ! 3513: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc71a0009  ! 3513: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xcd220009  ! 3513: STF_R	st	%f6, [%r9, %r8]
	.word 0xf42a0009  ! 3516: STB_R	stb	%r26, [%r8 + %r9]
	.word 0xc20a0009  ! 3516: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xc2da2c00  ! 3516: LDXA_I	ldxa	[%r8, + 0x0c00] %asi, %r1
	.word 0xc2220009  ! 3519: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xca420009  ! 3519: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xa1a209a9  ! 3519: FDIVs	fdivs	%f8, %f9, %f16
	.word 0xed220009  ! 3522: STF_R	st	%f22, [%r9, %r8]
	.word 0xcc420009  ! 3522: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0x84f20009  ! 3522: UDIVcc_R	udivcc 	%r8, %r9, %r2
	.word 0xc53a0009  ! 3525: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc7020009  ! 3525: LDF_R	ld	[%r8, %r9], %f3
	.word 0xc2922af4  ! 3525: LDUHA_I	lduha	[%r8, + 0x0af4] %asi, %r1
	.word 0xce220009  ! 3528: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xcd1a0009  ! 3528: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0x0a800002  ! 3528: BCS	bcs  	<label_0x2>
	.word 0xcf220009  ! 3531: STF_R	st	%f7, [%r9, %r8]
	.word 0xcc420009  ! 3531: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xec921009  ! 3531: LDUHA_R	lduha	[%r8, %r9] 0x80, %r22
	.word 0xce320009  ! 3534: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xe6020009  ! 3534: LDUW_R	lduw	[%r8 + %r9], %r19
	.word 0x83a20929  ! 3534: FMULs	fmuls	%f8, %f9, %f1
	.word 0xc22a0009  ! 3537: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xf04a0009  ! 3537: LDSB_R	ldsb	[%r8 + %r9], %r24
	.word 0x8143c000  ! 3537: STBAR	stbar
	.word 0xf42a0009  ! 3540: STB_R	stb	%r26, [%r8 + %r9]
	.word 0xe84a0009  ! 3540: LDSB_R	ldsb	[%r8 + %r9], %r20
	.word 0xc8520009  ! 3540: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xc53a0009  ! 3543: STDF_R	std	%f2, [%r9, %r8]
	.word 0xef020009  ! 3543: LDF_R	ld	[%r8, %r9], %f23
	.word 0xcd3a2750  ! 3543: STDF_I	std	%f6, [0x0750, %r8]
	.word 0xca220009  ! 3546: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xd8020009  ! 3546: LDUW_R	lduw	[%r8 + %r9], %r12
	.word 0xc3ea2a58  ! 3546: PREFETCHA_I	prefetcha	[%r8, + 0x0a58] %asi, #one_read
	.word 0xe9220009  ! 3549: STF_R	st	%f20, [%r9, %r8]
	.word 0xe04a0009  ! 3549: LDSB_R	ldsb	[%r8 + %r9], %r16
	.word 0xc36a0009  ! 3549: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xcc2a0009  ! 3552: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xcc4a0009  ! 3552: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xc2da1009  ! 3552: LDXA_R	ldxa	[%r8, %r9] 0x80, %r1
	.word 0xf4720009  ! 3555: STX_R	stx	%r26, [%r8 + %r9]
	.word 0xca4a0009  ! 3555: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0x8143e010  ! 3555: MEMBAR	membar	#Lookaside 
	.word 0xd82a0009  ! 3558: STB_R	stb	%r12, [%r8 + %r9]
	.word 0xfb1a0009  ! 3558: LDDF_R	ldd	[%r8, %r9], %f29
	.word 0x0eca0001  ! 3558: BRGEZ	brgez  ,pt	%8,<label_0xa0001>
	.word 0xc4220009  ! 3561: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xcc5a0009  ! 3561: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xccda2918  ! 3561: LDXA_I	ldxa	[%r8, + 0x0918] %asi, %r6
	.word 0xc8720009  ! 3564: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc85a0009  ! 3564: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xcea21009  ! 3564: STWA_R	stwa	%r7, [%r8 + %r9] 0x80
	.word 0xed220009  ! 3567: STF_R	st	%f22, [%r9, %r8]
	.word 0xd9020009  ! 3567: LDF_R	ld	[%r8, %r9], %f12
	.word 0xc3ea1009  ! 3567: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xf62a0009  ! 3570: STB_R	stb	%r27, [%r8 + %r9]
	.word 0xcf020009  ! 3570: LDF_R	ld	[%r8, %r9], %f7
	.word 0x24800002  ! 3570: BLE	ble,a	<label_0x2>
	.word 0xc53a0009  ! 3573: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc8120009  ! 3573: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0x88fa2930  ! 3573: SDIVcc_I	sdivcc 	%r8, 0x0930, %r4
	.word 0xc6320009  ! 3576: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc84a0009  ! 3576: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0x876a0009  ! 3576: SDIVX_R	sdivx	%r8, %r9, %r3
	.word 0xd73a0009  ! 3579: STDF_R	std	%f11, [%r9, %r8]
	.word 0xcc1a0009  ! 3579: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xbcd2223c  ! 3579: UMULcc_I	umulcc 	%r8, 0x023c, %r30
	.word 0xda320009  ! 3582: STH_R	sth	%r13, [%r8 + %r9]
	.word 0xe31a0009  ! 3582: LDDF_R	ldd	[%r8, %r9], %f17
	.word 0xc26a2948  ! 3582: LDSTUB_I	ldstub	%r1, [%r8 + 0x0948]
	.word 0xc4720009  ! 3585: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc81a0009  ! 3585: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xdf3a0009  ! 3585: STDF_R	std	%f15, [%r9, %r8]
	.word 0xca720009  ! 3588: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc24a0009  ! 3588: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xb4da2f60  ! 3588: SMULcc_I	smulcc 	%r8, 0x0f60, %r26
	.word 0xcd220009  ! 3591: STF_R	st	%f6, [%r9, %r8]
	.word 0xfc5a0009  ! 3591: LDX_R	ldx	[%r8 + %r9], %r30
	.word 0xc4da1009  ! 3591: LDXA_R	ldxa	[%r8, %r9] 0x80, %r2
	.word 0xc6720009  ! 3594: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc8520009  ! 3594: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xc3ea1009  ! 3594: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc4220009  ! 3597: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc40a0009  ! 3597: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0x8143c000  ! 3597: STBAR	stbar
	.word 0xe42a0009  ! 3600: STB_R	stb	%r18, [%r8 + %r9]
	.word 0xc2020009  ! 3600: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0x82d22214  ! 3600: UMULcc_I	umulcc 	%r8, 0x0214, %r1
	.word 0xc53a0009  ! 3603: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc2020009  ! 3603: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0x827a216c  ! 3603: SDIV_I	sdiv 	%r8, 0x016c, %r1
	.word 0xc5220009  ! 3606: STF_R	st	%f2, [%r9, %r8]
	.word 0xc91a0009  ! 3606: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xcde22009  ! 3606: CASA_R	casa	[%r8] %asi, %r9, %r6
	.word 0xe22a0009  ! 3609: STB_R	stb	%r17, [%r8 + %r9]
	.word 0xce020009  ! 3609: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xceca1009  ! 3609: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r7
	.word 0xc53a0009  ! 3612: STDF_R	std	%f2, [%r9, %r8]
	.word 0xca5a0009  ! 3612: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xa27a2294  ! 3612: SDIV_I	sdiv 	%r8, 0x0294, %r17
	.word 0xd7220009  ! 3615: STF_R	st	%f11, [%r9, %r8]
	.word 0xfb1a0009  ! 3615: LDDF_R	ldd	[%r8, %r9], %f29
	.word 0x8143e04f  ! 3615: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #Sync 
	.word 0xcd3a0009  ! 3618: STDF_R	std	%f6, [%r9, %r8]
	.word 0xf6020009  ! 3618: LDUW_R	lduw	[%r8 + %r9], %r27
	.word 0xc53a0009  ! 3618: STDF_R	std	%f2, [%r9, %r8]
	.word 0xda220009  ! 3621: STW_R	stw	%r13, [%r8 + %r9]
	.word 0xcc020009  ! 3621: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xa9a20929  ! 3621: FMULs	fmuls	%f8, %f9, %f20
	.word 0xd62a0009  ! 3624: STB_R	stb	%r11, [%r8 + %r9]
	.word 0xf05a0009  ! 3624: LDX_R	ldx	[%r8 + %r9], %r24
	.word 0xc4a2209c  ! 3624: STWA_I	stwa	%r2, [%r8 + 0x009c] %asi
	.word 0xf0320009  ! 3627: STH_R	sth	%r24, [%r8 + %r9]
	.word 0xc91a0009  ! 3627: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xc36a0009  ! 3627: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xd6220009  ! 3630: STW_R	stw	%r11, [%r8 + %r9]
	.word 0xe6420009  ! 3630: LDSW_R	ldsw	[%r8 + %r9], %r19
	.word 0xc3ea1009  ! 3630: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xdf3a0009  ! 3633: STDF_R	std	%f15, [%r9, %r8]
	.word 0xc2020009  ! 3633: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xccba1009  ! 3633: STDA_R	stda	%r6, [%r8 + %r9] 0x80
	.word 0xc73a0009  ! 3636: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc60a0009  ! 3636: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xc6aa1009  ! 3636: STBA_R	stba	%r3, [%r8 + %r9] 0x80
	.word 0xde220009  ! 3639: STW_R	stw	%r15, [%r8 + %r9]
	.word 0xc65a0009  ! 3639: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xc3ea2a7c  ! 3639: PREFETCHA_I	prefetcha	[%r8, + 0x0a7c] %asi, #one_read
	.word 0xfa320009  ! 3642: STH_R	sth	%r29, [%r8 + %r9]
	.word 0xc2420009  ! 3642: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0x87a209a9  ! 3642: FDIVs	fdivs	%f8, %f9, %f3
	.word 0xc6320009  ! 3645: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xf0020009  ! 3645: LDUW_R	lduw	[%r8 + %r9], %r24
	.word 0xccfa1009  ! 3645: SWAPA_R	swapa	%r6, [%r8 + %r9] 0x80
	.word 0xe7220009  ! 3648: STF_R	st	%f19, [%r9, %r8]
	.word 0xc2420009  ! 3648: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0x87a20829  ! 3648: FADDs	fadds	%f8, %f9, %f3
	.word 0xc73a0009  ! 3651: STDF_R	std	%f3, [%r9, %r8]
	.word 0xf31a0009  ! 3651: LDDF_R	ldd	[%r8, %r9], %f25
	.word 0x826a2be8  ! 3651: UDIVX_I	udivx 	%r8, 0x0be8, %r1
	.word 0xc4320009  ! 3654: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xcc420009  ! 3654: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0x84fa2b24  ! 3654: SDIVcc_I	sdivcc 	%r8, 0x0b24, %r2
	.word 0xc6720009  ! 3657: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc2120009  ! 3657: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xcbf21009  ! 3657: CASXA_I	casxa	[%r8] 0x80, %r9, %r5
	.word 0xc6320009  ! 3660: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xd81a0009  ! 3660: LDD_R	ldd	[%r8 + %r9], %r12
	.word 0x8d220009  ! 3660: MULScc_R	mulscc 	%r8, %r9, %r6
	.word 0xcc720009  ! 3663: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc6420009  ! 3663: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xc3ea2aa0  ! 3663: PREFETCHA_I	prefetcha	[%r8, + 0x0aa0] %asi, #one_read
	.word 0xc7220009  ! 3666: STF_R	st	%f3, [%r9, %r8]
	.word 0xcc420009  ! 3666: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xc36a2a74  ! 3666: PREFETCH_I	prefetch	[%r8 + 0x0a74], #one_read
	.word 0xcc2a0009  ! 3669: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xce420009  ! 3669: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xc2fa1009  ! 3669: SWAPA_R	swapa	%r1, [%r8 + %r9] 0x80
	.word 0xf3220009  ! 3672: STF_R	st	%f25, [%r9, %r8]
	.word 0xce5a0009  ! 3672: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0x8143c000  ! 3672: STBAR	stbar
	.word 0xcd3a0009  ! 3675: STDF_R	std	%f6, [%r9, %r8]
	.word 0xcc520009  ! 3675: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xfc9a1009  ! 3675: LDDA_R	ldda	[%r8, %r9] 0x80, %r30
	.word 0xf22a0009  ! 3678: STB_R	stb	%r25, [%r8 + %r9]
	.word 0xc65a0009  ! 3678: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xc2b21009  ! 3678: STHA_R	stha	%r1, [%r8 + %r9] 0x80
	.word 0xc7220009  ! 3681: STF_R	st	%f3, [%r9, %r8]
	.word 0xca120009  ! 3681: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0x8a7a2374  ! 3681: SDIV_I	sdiv 	%r8, 0x0374, %r5
	.word 0xec220009  ! 3684: STW_R	stw	%r22, [%r8 + %r9]
	.word 0xec0a0009  ! 3684: LDUB_R	ldub	[%r8 + %r9], %r22
	.word 0x8da20829  ! 3684: FADDs	fadds	%f8, %f9, %f6
	.word 0xc2720009  ! 3687: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xf2020009  ! 3687: LDUW_R	lduw	[%r8 + %r9], %r25
	.word 0x8a7a0009  ! 3687: SDIV_R	sdiv 	%r8, %r9, %r5
	.word 0xde320009  ! 3690: STH_R	sth	%r15, [%r8 + %r9]
	.word 0xfd020009  ! 3690: LDF_R	ld	[%r8, %r9], %f30
	.word 0xc36a0009  ! 3690: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc53a0009  ! 3693: STDF_R	std	%f2, [%r9, %r8]
	.word 0xca420009  ! 3693: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0x99a209a9  ! 3693: FDIVs	fdivs	%f8, %f9, %f12
	.word 0xcb220009  ! 3696: STF_R	st	%f5, [%r9, %r8]
	.word 0xc41a0009  ! 3696: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x8c4a0009  ! 3696: MULX_R	mulx 	%r8, %r9, %r6
	.word 0xcc2a0009  ! 3699: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xcc020009  ! 3699: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xc5220009  ! 3699: STF_R	st	%f2, [%r9, %r8]
	.word 0xc4320009  ! 3702: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xe60a0009  ! 3702: LDUB_R	ldub	[%r8 + %r9], %r19
	.word 0xc4422f60  ! 3702: LDSW_I	ldsw	[%r8 + 0x0f60], %r2
	.word 0xc4720009  ! 3705: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xf4520009  ! 3705: LDSH_R	ldsh	[%r8 + %r9], %r26
	.word 0xc3ea1009  ! 3705: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xfc2a0009  ! 3708: STB_R	stb	%r30, [%r8 + %r9]
	.word 0xcf020009  ! 3708: LDF_R	ld	[%r8, %r9], %f7
	.word 0x36800002  ! 3708: BGE	bge,a	<label_0x2>
	.word 0xca720009  ! 3711: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc4420009  ! 3711: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0x8ad20009  ! 3711: UMULcc_R	umulcc 	%r8, %r9, %r5
	.word 0xe02a0009  ! 3714: STB_R	stb	%r16, [%r8 + %r9]
	.word 0xce120009  ! 3714: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0x22c20001  ! 3714: BRZ	brz,a,nt	%8,<label_0x20001>
	.word 0xc3220009  ! 3717: STF_R	st	%f1, [%r9, %r8]
	.word 0xc25a0009  ! 3717: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xc4922004  ! 3717: LDUHA_I	lduha	[%r8, + 0x0004] %asi, %r2
	.word 0xc62a0009  ! 3720: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc7020009  ! 3720: LDF_R	ld	[%r8, %r9], %f3
	.word 0xcada1009  ! 3720: LDXA_R	ldxa	[%r8, %r9] 0x80, %r5
	.word 0xcd3a0009  ! 3723: STDF_R	std	%f6, [%r9, %r8]
	.word 0xcc520009  ! 3723: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0x9da20829  ! 3723: FADDs	fadds	%f8, %f9, %f14
	.word 0xea320009  ! 3726: STH_R	sth	%r21, [%r8 + %r9]
	.word 0xca5a0009  ! 3726: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xb6da0009  ! 3726: SMULcc_R	smulcc 	%r8, %r9, %r27
	.word 0xe0220009  ! 3729: STW_R	stw	%r16, [%r8 + %r9]
	.word 0xc85a0009  ! 3729: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xc86a0009  ! 3729: LDSTUB_R	ldstub	%r4, [%r8 + %r9]
	.word 0xc3220009  ! 3732: STF_R	st	%f1, [%r9, %r8]
	.word 0xe4520009  ! 3732: LDSH_R	ldsh	[%r8 + %r9], %r18
	.word 0xc3ea2910  ! 3732: PREFETCHA_I	prefetcha	[%r8, + 0x0910] %asi, #one_read
	.word 0xee2a0009  ! 3735: STB_R	stb	%r23, [%r8 + %r9]
	.word 0xe60a0009  ! 3735: LDUB_R	ldub	[%r8 + %r9], %r19
	.word 0x8143e039  ! 3735: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside | #MemIssue 
	.word 0xfe720009  ! 3738: STX_R	stx	%r31, [%r8 + %r9]
	.word 0xc6020009  ! 3738: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xefe21009  ! 3738: CASA_I	casa	[%r8] 0x80, %r9, %r23
	.word 0xcf220009  ! 3741: STF_R	st	%f7, [%r9, %r8]
	.word 0xc64a0009  ! 3741: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xe7022500  ! 3741: LDF_I	ld	[%r8, 0x0500], %f19
	.word 0xc8720009  ! 3744: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xca120009  ! 3744: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0x82da0009  ! 3744: SMULcc_R	smulcc 	%r8, %r9, %r1
	.word 0xcd3a0009  ! 3747: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc8120009  ! 3747: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0x8143e02e  ! 3747: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #MemIssue 
	.word 0xcb220009  ! 3750: STF_R	st	%f5, [%r9, %r8]
	.word 0xce4a0009  ! 3750: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0x82fa28b0  ! 3750: SDIVcc_I	sdivcc 	%r8, 0x08b0, %r1
	.word 0xf6720009  ! 3753: STX_R	stx	%r27, [%r8 + %r9]
	.word 0xc65a0009  ! 3753: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xcefa26b8  ! 3753: SWAPA_I	swapa	%r7, [%r8 + 0x06b8] %asi
	.word 0xf2720009  ! 3756: STX_R	stx	%r25, [%r8 + %r9]
	.word 0xc85a0009  ! 3756: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0x8143e050  ! 3756: MEMBAR	membar	#Lookaside | #Sync 
	.word 0xcf3a0009  ! 3759: STDF_R	std	%f7, [%r9, %r8]
	.word 0xd80a0009  ! 3759: LDUB_R	ldub	[%r8 + %r9], %r12
	.word 0xc6ea1009  ! 3759: LDSTUBA_R	ldstuba	%r3, [%r8 + %r9] 0x80
	.word 0xc33a0009  ! 3762: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc2420009  ! 3762: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xb7a208a9  ! 3762: FSUBs	fsubs	%f8, %f9, %f27
	.word 0xc4720009  ! 3765: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xe4020009  ! 3765: LDUW_R	lduw	[%r8 + %r9], %r18
	.word 0xefe22009  ! 3765: CASA_R	casa	[%r8] %asi, %r9, %r23
	.word 0xf2220009  ! 3768: STW_R	stw	%r25, [%r8 + %r9]
	.word 0xc41a0009  ! 3768: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xccfa1009  ! 3768: SWAPA_R	swapa	%r6, [%r8 + %r9] 0x80
	.word 0xd6320009  ! 3771: STH_R	sth	%r11, [%r8 + %r9]
	.word 0xcd1a0009  ! 3771: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0x8143e015  ! 3771: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside 
	.word 0xc2320009  ! 3774: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xce4a0009  ! 3774: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0x867a0009  ! 3774: SDIV_R	sdiv 	%r8, %r9, %r3
	.word 0xd6320009  ! 3777: STH_R	sth	%r11, [%r8 + %r9]
	.word 0xc44a0009  ! 3777: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xdcca1009  ! 3777: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r14
	.word 0xc6220009  ! 3780: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc5020009  ! 3780: LDF_R	ld	[%r8, %r9], %f2
	.word 0xc27a0009  ! 3780: SWAP_R	swap	%r1, [%r8 + %r9]
	.word 0xee720009  ! 3783: STX_R	stx	%r23, [%r8 + %r9]
	.word 0xdf1a0009  ! 3783: LDDF_R	ldd	[%r8, %r9], %f15
	.word 0xe8fa1009  ! 3783: SWAPA_R	swapa	%r20, [%r8 + %r9] 0x80
	.word 0xfb220009  ! 3786: STF_R	st	%f29, [%r9, %r8]
	.word 0xcc4a0009  ! 3786: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xcb3a2d90  ! 3786: STDF_I	std	%f5, [0x0d90, %r8]
	.word 0xe82a0009  ! 3789: STB_R	stb	%r20, [%r8 + %r9]
	.word 0xce020009  ! 3789: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xc6da2fd8  ! 3789: LDXA_I	ldxa	[%r8, + 0x0fd8] %asi, %r3
	.word 0xc2220009  ! 3792: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xce0a0009  ! 3792: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xcc5a0009  ! 3792: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xc5220009  ! 3795: STF_R	st	%f2, [%r9, %r8]
	.word 0xcc0a0009  ! 3795: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xae4a0009  ! 3795: MULX_R	mulx 	%r8, %r9, %r23
	.word 0xcb220009  ! 3798: STF_R	st	%f5, [%r9, %r8]
	.word 0xee120009  ! 3798: LDUH_R	lduh	[%r8 + %r9], %r23
	.word 0xa4720009  ! 3798: UDIV_R	udiv 	%r8, %r9, %r18
	.word 0xd8720009  ! 3801: STX_R	stx	%r12, [%r8 + %r9]
	.word 0xcb1a0009  ! 3801: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xaa7a2088  ! 3801: SDIV_I	sdiv 	%r8, 0x0088, %r21
	.word 0xc9220009  ! 3804: STF_R	st	%f4, [%r9, %r8]
	.word 0xc4120009  ! 3804: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xc8822d48  ! 3804: LDUWA_I	lduwa	[%r8, + 0x0d48] %asi, %r4
	.word 0xc2320009  ! 3807: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xcc4a0009  ! 3807: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0x82520009  ! 3807: UMUL_R	umul 	%r8, %r9, %r1
	.word 0xc62a0009  ! 3810: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc85a0009  ! 3810: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xc36a21f8  ! 3810: PREFETCH_I	prefetch	[%r8 + 0x01f8], #one_read
	.word 0xc53a0009  ! 3813: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc7020009  ! 3813: LDF_R	ld	[%r8, %r9], %f3
	.word 0xf13a0009  ! 3813: STDF_R	std	%f24, [%r9, %r8]
	.word 0xff3a0009  ! 3816: STDF_R	std	%f31, [%r9, %r8]
	.word 0xff020009  ! 3816: LDF_R	ld	[%r8, %r9], %f31
	.word 0x26800001  ! 3816: BL	bl,a	<label_0x1>
	.word 0xc33a0009  ! 3819: STDF_R	std	%f1, [%r9, %r8]
	.word 0xca0a0009  ! 3819: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xa1220009  ! 3819: MULScc_R	mulscc 	%r8, %r9, %r16
	.word 0xc2220009  ! 3822: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xe00a0009  ! 3822: LDUB_R	ldub	[%r8 + %r9], %r16
	.word 0x8a520009  ! 3822: UMUL_R	umul 	%r8, %r9, %r5
	.word 0xe2720009  ! 3825: STX_R	stx	%r17, [%r8 + %r9]
	.word 0xf11a0009  ! 3825: LDDF_R	ldd	[%r8, %r9], %f24
	.word 0xc4ea2f6c  ! 3825: LDSTUBA_I	ldstuba	%r2, [%r8 + 0x0f6c] %asi
	.word 0xc6320009  ! 3828: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc2520009  ! 3828: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xccb21009  ! 3828: STHA_R	stha	%r6, [%r8 + %r9] 0x80
	.word 0xfd220009  ! 3831: STF_R	st	%f30, [%r9, %r8]
	.word 0xc5020009  ! 3831: LDF_R	ld	[%r8, %r9], %f2
	.word 0xbcfa0009  ! 3831: SDIVcc_R	sdivcc 	%r8, %r9, %r30
	.word 0xc5220009  ! 3834: STF_R	st	%f2, [%r9, %r8]
	.word 0xc6020009  ! 3834: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0x8143e067  ! 3834: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #MemIssue | #Sync 
	.word 0xc4320009  ! 3837: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc2020009  ! 3837: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xc3ea1009  ! 3837: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc42a0009  ! 3840: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc85a0009  ! 3840: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0x8143e077  ! 3840: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside | #MemIssue | #Sync 
	.word 0xf33a0009  ! 3843: STDF_R	std	%f25, [%r9, %r8]
	.word 0xf4520009  ! 3843: LDSH_R	ldsh	[%r8 + %r9], %r26
	.word 0xc36a0009  ! 3843: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xcd3a0009  ! 3846: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc2120009  ! 3846: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0x8d222ee4  ! 3846: MULScc_I	mulscc 	%r8, 0x0ee4, %r6
	.word 0xf0720009  ! 3849: STX_R	stx	%r24, [%r8 + %r9]
	.word 0xc85a0009  ! 3849: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xb2d22f18  ! 3849: UMULcc_I	umulcc 	%r8, 0x0f18, %r25
	.word 0xca720009  ! 3852: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xcc1a0009  ! 3852: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xd84a220c  ! 3852: LDSB_I	ldsb	[%r8 + 0x020c], %r12
	.word 0xce220009  ! 3855: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xca5a0009  ! 3855: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xc4f22030  ! 3855: STXA_I	stxa	%r2, [%r8 + 0x0030] %asi
	.word 0xc3220009  ! 3858: STF_R	st	%f1, [%r9, %r8]
	.word 0xcc5a0009  ! 3858: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0x82d22de8  ! 3858: UMULcc_I	umulcc 	%r8, 0x0de8, %r1
	.word 0xda220009  ! 3861: STW_R	stw	%r13, [%r8 + %r9]
	.word 0xf2120009  ! 3861: LDUH_R	lduh	[%r8 + %r9], %r25
	.word 0xa7a20929  ! 3861: FMULs	fmuls	%f8, %f9, %f19
	.word 0xcb220009  ! 3864: STF_R	st	%f5, [%r9, %r8]
	.word 0xc31a0009  ! 3864: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0x8e520009  ! 3864: UMUL_R	umul 	%r8, %r9, %r7
	.word 0xff220009  ! 3867: STF_R	st	%f31, [%r9, %r8]
	.word 0xca520009  ! 3867: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xc4f22118  ! 3867: STXA_I	stxa	%r2, [%r8 + 0x0118] %asi
	.word 0xce320009  ! 3870: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xf00a0009  ! 3870: LDUB_R	ldub	[%r8 + %r9], %r24
	.word 0xe6922dbc  ! 3870: LDUHA_I	lduha	[%r8, + 0x0dbc] %asi, %r19
	.word 0xc4320009  ! 3873: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xcb1a0009  ! 3873: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xc8da1009  ! 3873: LDXA_R	ldxa	[%r8, %r9] 0x80, %r4
	.word 0xe2720009  ! 3876: STX_R	stx	%r17, [%r8 + %r9]
	.word 0xc25a0009  ! 3876: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xc7222390  ! 3876: STF_I	st	%f3, [0x0390, %r8]
	.word 0xc53a0009  ! 3879: STDF_R	std	%f2, [%r9, %r8]
	.word 0xfa5a0009  ! 3879: LDX_R	ldx	[%r8 + %r9], %r29
	.word 0x8143e06d  ! 3879: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #MemIssue | #Sync 
	.word 0xcd3a0009  ! 3882: STDF_R	std	%f6, [%r9, %r8]
	.word 0xca0a0009  ! 3882: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xc0ba27b8  ! 3882: STDA_I	stda	%r0, [%r8 + 0x07b8] %asi
	.word 0xcd3a0009  ! 3885: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc3020009  ! 3885: LDF_R	ld	[%r8, %r9], %f1
	.word 0xe33a2f28  ! 3885: STDF_I	std	%f17, [0x0f28, %r8]
	.word 0xc5220009  ! 3888: STF_R	st	%f2, [%r9, %r8]
	.word 0xcb020009  ! 3888: LDF_R	ld	[%r8, %r9], %f5
	.word 0xc3ea1009  ! 3888: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc2220009  ! 3891: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc85a0009  ! 3891: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0x28800001  ! 3891: BLEU	bleu,a	<label_0x1>
	.word 0xec720009  ! 3894: STX_R	stx	%r22, [%r8 + %r9]
	.word 0xde0a0009  ! 3894: LDUB_R	ldub	[%r8 + %r9], %r15
	.word 0xdcda1009  ! 3894: LDXA_R	ldxa	[%r8, %r9] 0x80, %r14
	.word 0xc3220009  ! 3897: STF_R	st	%f1, [%r9, %r8]
	.word 0xc85a0009  ! 3897: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xc36a2eec  ! 3897: PREFETCH_I	prefetch	[%r8 + 0x0eec], #one_read
	.word 0xc6720009  ! 3900: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc01a0009  ! 3900: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0xc3ea23c8  ! 3900: PREFETCHA_I	prefetcha	[%r8, + 0x03c8] %asi, #one_read
	.word 0xc73a0009  ! 3903: STDF_R	std	%f3, [%r9, %r8]
	.word 0xfc4a0009  ! 3903: LDSB_R	ldsb	[%r8 + %r9], %r30
	.word 0xe47a2d30  ! 3903: SWAP_I	swap	%r18, [%r8 + 0x0d30]
	.word 0xc2720009  ! 3906: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xca020009  ! 3906: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0x864a0009  ! 3906: MULX_R	mulx 	%r8, %r9, %r3
	.word 0xcd220009  ! 3909: STF_R	st	%f6, [%r9, %r8]
	.word 0xcd020009  ! 3909: LDF_R	ld	[%r8, %r9], %f6
	.word 0x896a0009  ! 3909: SDIVX_R	sdivx	%r8, %r9, %r4
	.word 0xc2220009  ! 3912: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xca420009  ! 3912: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0x8143e05d  ! 3912: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0xc42a0009  ! 3915: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xec5a0009  ! 3915: LDX_R	ldx	[%r8 + %r9], %r22
	.word 0x8fa20829  ! 3915: FADDs	fadds	%f8, %f9, %f7
	.word 0xd6220009  ! 3918: STW_R	stw	%r11, [%r8 + %r9]
	.word 0xc6520009  ! 3918: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xc47a0009  ! 3918: SWAP_R	swap	%r2, [%r8 + %r9]
	.word 0xee320009  ! 3921: STH_R	sth	%r23, [%r8 + %r9]
	.word 0xca420009  ! 3921: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0x8143c000  ! 3921: STBAR	stbar
	.word 0xc62a0009  ! 3924: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc20a0009  ! 3924: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0x04c20001  ! 3924: BRLEZ	brlez  ,nt	%8,<label_0x20001>
	.word 0xf0720009  ! 3927: STX_R	stx	%r24, [%r8 + %r9]
	.word 0xe41a0009  ! 3927: LDD_R	ldd	[%r8 + %r9], %r18
	.word 0x8143c000  ! 3927: STBAR	stbar
	.word 0xc2220009  ! 3930: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc5020009  ! 3930: LDF_R	ld	[%r8, %r9], %f2
	.word 0xc36a2a7c  ! 3930: PREFETCH_I	prefetch	[%r8 + 0x0a7c], #one_read
	.word 0xdf3a0009  ! 3933: STDF_R	std	%f15, [%r9, %r8]
	.word 0xcc4a0009  ! 3933: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0x8143c000  ! 3933: STBAR	stbar
	.word 0xfe720009  ! 3936: STX_R	stx	%r31, [%r8 + %r9]
	.word 0xd85a0009  ! 3936: LDX_R	ldx	[%r8 + %r9], %r12
	.word 0xc3220009  ! 3936: STF_R	st	%f1, [%r9, %r8]
	.word 0xc6720009  ! 3939: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xcc420009  ! 3939: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0x8143e026  ! 3939: MEMBAR	membar	#StoreLoad | #LoadStore | #MemIssue 
	.word 0xca320009  ! 3942: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xcf1a0009  ! 3942: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xcd220009  ! 3942: STF_R	st	%f6, [%r9, %r8]
	.word 0xe33a0009  ! 3945: STDF_R	std	%f17, [%r9, %r8]
	.word 0xdc420009  ! 3945: LDSW_R	ldsw	[%r8 + %r9], %r14
	.word 0x8e5a2bf8  ! 3945: SMUL_I	smul 	%r8, 0x0bf8, %r7
	.word 0xc3220009  ! 3948: STF_R	st	%f1, [%r9, %r8]
	.word 0xe60a0009  ! 3948: LDUB_R	ldub	[%r8 + %r9], %r19
	.word 0xb2522d7c  ! 3948: UMUL_I	umul 	%r8, 0x0d7c, %r25
	.word 0xda2a0009  ! 3951: STB_R	stb	%r13, [%r8 + %r9]
	.word 0xc81a0009  ! 3951: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xc68a2640  ! 3951: LDUBA_I	lduba	[%r8, + 0x0640] %asi, %r3
	.word 0xcb220009  ! 3954: STF_R	st	%f5, [%r9, %r8]
	.word 0xc64a0009  ! 3954: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xd6aa1009  ! 3954: STBA_R	stba	%r11, [%r8 + %r9] 0x80
	.word 0xe8320009  ! 3957: STH_R	sth	%r20, [%r8 + %r9]
	.word 0xcc0a0009  ! 3957: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xc3ea2d88  ! 3957: PREFETCHA_I	prefetcha	[%r8, + 0x0d88] %asi, #one_read
	.word 0xc22a0009  ! 3960: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc84a0009  ! 3960: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0x8e7a0009  ! 3960: SDIV_R	sdiv 	%r8, %r9, %r7
	.word 0xcc720009  ! 3963: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xcc020009  ! 3963: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0x8143e057  ! 3963: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside | #Sync 
	.word 0xca720009  ! 3966: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc44a0009  ! 3966: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0x847a2a8c  ! 3966: SDIV_I	sdiv 	%r8, 0x0a8c, %r2
	.word 0xcc320009  ! 3969: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xd6020009  ! 3969: LDUW_R	lduw	[%r8 + %r9], %r11
	.word 0xc36a0009  ! 3969: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc8220009  ! 3972: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xe0520009  ! 3972: LDSH_R	ldsh	[%r8 + %r9], %r16
	.word 0xcaca1009  ! 3972: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r5
	.word 0xc53a0009  ! 3975: STDF_R	std	%f2, [%r9, %r8]
	.word 0xfc1a0009  ! 3975: LDD_R	ldd	[%r8 + %r9], %r30
	.word 0x1c800001  ! 3975: BPOS	bpos  	<label_0x1>
	.word 0xd8320009  ! 3978: STH_R	sth	%r12, [%r8 + %r9]
	.word 0xfe420009  ! 3978: LDSW_R	ldsw	[%r8 + %r9], %r31
	.word 0x9c520009  ! 3978: UMUL_R	umul 	%r8, %r9, %r14
	.word 0xc8720009  ! 3981: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc8020009  ! 3981: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0x8d6a0009  ! 3981: SDIVX_R	sdivx	%r8, %r9, %r6
	.word 0xef3a0009  ! 3984: STDF_R	std	%f23, [%r9, %r8]
	.word 0xc4020009  ! 3984: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0x9c6a23e0  ! 3984: UDIVX_I	udivx 	%r8, 0x03e0, %r14
	.word 0xcd220009  ! 3987: STF_R	st	%f6, [%r9, %r8]
	.word 0xcc4a0009  ! 3987: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xc36a2bb4  ! 3987: PREFETCH_I	prefetch	[%r8 + 0x0bb4], #one_read
	.word 0xf22a0009  ! 3990: STB_R	stb	%r25, [%r8 + %r9]
	.word 0xfa0a0009  ! 3990: LDUB_R	ldub	[%r8 + %r9], %r29
	.word 0xcc821009  ! 3990: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r6
	.word 0xca220009  ! 3993: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xca420009  ! 3993: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xc44a2ab8  ! 3993: LDSB_I	ldsb	[%r8 + 0x0ab8], %r2
	.word 0xc8220009  ! 3996: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xf91a0009  ! 3996: LDDF_R	ldd	[%r8, %r9], %f28
	.word 0x87a20829  ! 3996: FADDs	fadds	%f8, %f9, %f3
	.word 0xe82a0009  ! 3999: STB_R	stb	%r20, [%r8 + %r9]
	.word 0xe01a0009  ! 3999: LDD_R	ldd	[%r8 + %r9], %r16
	.word 0x8143e036  ! 3999: MEMBAR	membar	#StoreLoad | #LoadStore | #Lookaside | #MemIssue 
        ta      T_GOOD_TRAP

.data
	.word  0xba53c63a,0xf3a597f3,0x1e4b0ec4,0x7a18a199
	.word  0x0ed6eb91,0x1c131e35,0xf55cdc4d,0x74f0e35c
	.word  0x41b998d5,0xe80c5084,0xcd3b7b93,0xaa3ebaba
	.word  0x5c05d1c7,0x24a7c10b,0xfe497a91,0x15991863
	.word  0x60d9321d,0xd27829f4,0x5df06e58,0x8211d5bc
	.word  0xccaeab47,0x3cff7fcd,0x3d3e2ffd,0x17eed7b4
	.word  0xc53ffba0,0x54d12056,0xb90c3cc9,0xe0e7f93f
	.word  0xe599ee7e,0x2196cebe,0xd5c9760b,0x2d3a7cf6
	.word  0x3fab1f8f,0xb03b7e02,0x10530376,0x0b4cdd92
	.word  0xf49ded46,0xae1a15f8,0xadb8b82c,0x836dd781
	.word  0x81a4ad66,0x937b433c,0x97f5bd60,0x8d60fff3
	.word  0xc435eb37,0x047aea35,0x1691a57a,0x42836ce6
	.word  0x766c8e22,0x09698a8d,0x59f34852,0x4ee52f39
	.word  0x739a8161,0xdea7bfaa,0xe10885b5,0x63aec428
	.word  0x02a174ed,0x0a214aca,0x8ac1942f,0x7291a029
	.word  0xe07b752c,0xb719b97a,0x4e338cb3,0x83daae05
	.word  0xb2a6fed3,0x03d56825,0x1cb95e7a,0xb253480a
	.word  0x2a257f1e,0xb6f40ed7,0x215c6bd2,0x83f18418
	.word  0x85dbc0f9,0x6cdf05ea,0xfe9160cd,0x5643ff76
	.word  0x517fb273,0x146d39f1,0xb120bdf8,0x5bbe19b6
	.word  0x3206700b,0xadebdd17,0xf4322480,0x8e5e3ce4
	.word  0xdf6bc3a2,0x0dc8c01d,0xc4193800,0x813ac885
	.word  0x5abaa2f7,0x8660f743,0x1cd445de,0x4acce9f7
	.word  0xdba98d4d,0xb0fdbc21,0x78b3e0a2,0x92b0b5a8
	.word  0xeda691d1,0x8079951a,0x7921d04f,0x8c0ae3a8
	.word  0x2ead0170,0x4f8d62ed,0xe988d726,0x0d17c3fa
	.word  0x18391e9b,0x0fd9f2fb,0x8909c4db,0x1e26c0ce
	.word  0x87a71c6a,0xcc89913b,0xd25d61c1,0x021877ec
	.word  0x733c93a8,0x75d56b0f,0x7ab20994,0x7910a6ae
	.word  0x21dd1c03,0xc6edcef5,0x6ca0b715,0x8eb87f3d
	.word  0xf8eb5d40,0x6f4c2001,0x1e10cdc7,0x4c14b122
	.word  0xe8b402f9,0xa4c99a27,0x5c876544,0x3539be40
	.word  0x6bd284ce,0x21d8bc8a,0x77c6ea53,0x5f6d2fd5
	.word  0x657992d6,0x970e8425,0x55fa2a68,0x84293130
	.word  0xce176b35,0x037e89f2,0x1be76ce1,0x5eee5021
	.word  0xd0672b98,0x48cf9692,0x2d63d147,0xba25f2a5
	.word  0x14b1d784,0x9948011a,0x99090ca7,0x37c290ce
	.word  0x254ca898,0xd3925ae3,0xa04f426c,0xf4ef5065
	.word  0xcf1441e0,0x2eec7374,0xc22fbbb1,0x92f30ef0
	.word  0xe4ea3817,0x71c118b4,0x7474c5a1,0x3f3d7c63
	.word  0xf3a417c5,0xb91d5c48,0x69c471bd,0x3b42bd3c
	.word  0x82aa066a,0x465d644f,0xb165956d,0xadbe5dee
	.word  0x8371da83,0x73c77875,0x82e9ecbc,0x1222b600
	.word  0xb9457d5b,0x95ef816e,0xa411e158,0x54675017
	.word  0xc5643b51,0x6a36d5aa,0x80d42d6d,0xe3ca6fcb
	.word  0x86460a03,0xba85c53a,0x4e9928ff,0xd841ba8a
	.word  0xdd957608,0xa2e045b5,0x988f9030,0x2c1e7760
	.word  0x1f185c0a,0x65820b20,0xabb860be,0xa87f9260
	.word  0x6b79bde0,0xcd655b7f,0x582c8e2a,0x25b68fc0
	.word  0x2ba2c5c0,0x20c28a46,0x84949074,0xcbd4e2fe
	.word  0x59b17ca6,0xefd9c19b,0x02f9ab23,0x21c05afd
	.word  0x1e8d8150,0xd9da8134,0x70e04f25,0x872b6909
	.word  0xb3554fe2,0xb7d5dfb0,0x8900f78a,0xc1433070
	.word  0xab77de65,0xc11e5962,0x84c32859,0xc13d310b
	.word  0xb0cc04f1,0x1beab5a1,0x3c3909c2,0xc6ff6af5
	.word  0x7751a399,0x08bdacaa,0x21124828,0x8b21a8ea
	.word  0xffcd119f,0x3e9cac3b,0x1ebe18a2,0xe8d5eef3
	.word  0x61211689,0xd3cb2c9d,0x404ca2d9,0xc8d02ca5
	.word  0x0f496a65,0x51ccc172,0x26e3140c,0x4e4eb7cd
	.word  0xa8ce0342,0xe5cf3570,0x0cea71be,0xecd4c617
	.word  0xb38dda4c,0x2e21aa5a,0xe40bd985,0x48c43a99
	.word  0xf3abbc67,0x03e573f3,0x79bb24cf,0x34b5854d
	.word  0x563ef3c6,0x975813b7,0xe4580a66,0xee7ca14e
	.word  0xbe813969,0x083335f9,0xebc9e71d,0x88e1855e
	.word  0x53bb6d30,0x67e48245,0x01263098,0x595c738a
	.word  0x98e318c0,0xd74f5c55,0x17a2d072,0x32edc094
	.word  0xefa223ee,0x3a78d377,0xa71854c4,0x381edf54
	.word  0x403f9237,0xb6eb32b1,0x89c2db22,0x870bca40
	.word  0x34519be4,0x5bc348d8,0x4341c90f,0xde2584ef
	.word  0xe44fc17d,0x59ad5324,0xd6a579a1,0x9d24b31e
	.word  0x9264739e,0x771eb677,0x88b69de6,0xfb7b6927
	.word  0xa0431024,0x44218be2,0x41f6df6a,0x44c91c23
	.word  0x814ee4ab,0xcf5ccfee,0xf3af8f85,0xf9e33e71
	.word  0x5f0cbf93,0x45088f7a,0x6d7b23ba,0x10c21097
	.word  0x25f5fc9d,0x1279f07e,0xb904e79d,0xc2157cec
	.word  0x866a9f86,0x5ef8f850,0x4ad0d150,0x69a0c486
	.word  0x3220825a,0x316b7f19,0x798172d5,0x0a29432b
	.word  0x31962819,0x154a2197,0x4102a0a5,0xc293b2df
	.word  0x16d5bfe4,0x01371a09,0x02555b97,0x186b263f
	.word  0x81cce9f9,0x19ab541b,0xbb04cab0,0xabdae6fe
	.word  0xba4508d7,0xb4b2c8e7,0x2f56613b,0xb0ab8930
	.word  0x549795ca,0xd194459a,0x0788aa08,0x9c144a3c
	.word  0xdd950bad,0xbccae1ec,0xfe077241,0x6a768657
	.word  0x6c775358,0x68e74e77,0x7a8b4fcd,0x70edac28
	.word  0x3a37b3e8,0xe42a7b72,0x67707c9e,0xc3307142
	.word  0x6be38a96,0xda148b07,0xa278b95f,0x3c0f80b4
	.word  0xf01a2739,0x8a7dde72,0x1cd395ac,0x27415a85
	.word  0xabf79f77,0xb6430f8f,0xd4466e1c,0xa672289a
	.word  0xb5ba0f9b,0xc7ab367c,0x3b22e421,0xe9cc1e9f
	.word  0x69fbc5d4,0x9930ceb2,0xc7c635fa,0x55c5beac
	.word  0xa444f849,0x0b586543,0xae5f5b16,0xa0be0bd1
	.word  0xd0102577,0x20dd3efa,0x7b8c65c2,0xfd61f141
	.word  0x59acdad7,0x18fe5d4c,0x2230ca6f,0xbda31f45
	.word  0x389d1783,0x10381079,0x35494b94,0x7fc8fa8a
	.word  0xb10918b7,0xd65c1d6c,0x180355e4,0x04369cbf
	.word  0x8bdca6d2,0xd66302da,0x240da25b,0x4bfda39d
	.word  0xeb4e3905,0xec64ea2e,0x8bbeea4a,0x11c1d7ce
	.word  0x2ff4a4d0,0x179c39ed,0xde7ec182,0x408bd704
	.word  0x7e80adfa,0x39e37e7b,0x326cb224,0x75705ccc
	.word  0xbbd993d7,0xcfb9eac3,0x784454ce,0xf0e03353
	.word  0x05c12a88,0xa0ddffc1,0x11fc730a,0xa9cd6185
	.word  0x46219bfd,0x6773c198,0xb03d3edc,0x698a5797
	.word  0xacf0821d,0xa539fbb5,0x11e4b517,0x0957ede8
	.word  0xc18d7a5f,0x155c616a,0xb76c39b9,0x151776ee
	.word  0xce7cacb7,0x158c8172,0x84263178,0x4b5b0f37
	.word  0x8b743e2a,0x13109309,0xaf73e996,0x10254d05
	.word  0x98e40757,0xaf9435c5,0x50911a15,0xfddb9fba
	.word  0xa7fb6401,0xdd0ba770,0x37f4c9f3,0x4626c5b2
	.word  0xff0525a3,0xa68526f2,0xc910ab32,0xbbbdc779
	.word  0x25ab51fa,0xe7d8e93a,0x4bf2f791,0xb2f71298
	.word  0x08855109,0x08e131b7,0x7b4581ce,0x4104bc4f
	.word  0x09eb9f3d,0xf355264a,0x32fd7512,0x7c9a17e8
	.word  0xbc6f96db,0x8c6b9ac3,0x226a9d38,0x5adae707
	.word  0x21870345,0xb0eefc09,0x2e41efaf,0xe33cad45
	.word  0x0dfa05b4,0xc2c8af57,0xfd97de40,0x539d09d0
	.word  0xd9330c3b,0xcc9769ca,0xfda759fb,0x030a541f
	.word  0x7abab73f,0xfcdb4c41,0x2c1bd967,0x73f39f44
	.word  0x676c900c,0x7fdfb2d5,0xd9c92388,0x853763c9
	.word  0x196666c5,0x174b4458,0x57907310,0xcf0a7034
	.word  0x3a9e97ba,0x3dec92fb,0xf9624057,0x16b0f1a4
	.word  0xe0edab49,0x5a362a4c,0xfcf43108,0x1e36fbcf
	.word  0x8321c23d,0x02c7374b,0xb214d73b,0xe159fa6b
	.word  0x1e9a9e65,0x51a292af,0x2ea33ca0,0xa351a663
	.word  0x3e0ca315,0x3c4859ac,0xc21883ab,0x1d8bb7c3
	.word  0x11f6ca07,0x7fe060c7,0x39950015,0x28f62483
	.word  0x70fd4473,0x4d0bba37,0xff2d2551,0x2bc1f71d
	.word  0x0299fe23,0x11368cfb,0x9d25c18d,0x1902d82a
	.word  0x809560e4,0x24218b1c,0x95e3caf2,0xdb5cb68a
	.word  0x2144c6e2,0x5ed0766b,0x8a61e673,0x8de3b4d9
	.word  0xdfac7a23,0xc352091e,0xb784a1fc,0x1c36289c
	.word  0x74f45846,0x47e19ea6,0xbeaf2273,0xab6f0995
	.word  0xfeb4245d,0x7e28f168,0xec4641c5,0x82173931
	.word  0x9d5c990b,0x6670a899,0x262cf6a8,0x1258b226
	.word  0xe639e475,0x23283a76,0xdeb81075,0x1e883b5e
	.word  0x6f1b4d6c,0x0923d36d,0xaf2ffb28,0xa2ea00be
	.word  0xbc6db469,0xb8b2db49,0xe7e21ae3,0x18039636
	.word  0x517b07ad,0xdf8b13bc,0x027aef57,0x5805f8dd
	.word  0xf8756664,0xb9fc5c40,0x2f5aa847,0x3924c965
	.word  0xfc77b356,0x1c254cb5,0x46a2b482,0x11b465fe
	.word  0x0a647e37,0x8389f629,0x273d8a8c,0xd5d95ba1
	.word  0x814a355a,0x14fc1ff1,0x05e4155b,0x3ef8f8d9
	.word  0xea9a0a91,0xffc0b7c7,0xedfcb344,0x505cf4da
	.word  0x805b0b3b,0xbba4048a,0x1dea490e,0x261ff518
	.word  0x54e87b88,0xcf6051e3,0x66a3d28a,0xf3a2854f
	.word  0x0a093404,0x9e3b989d,0xcf930c28,0x72fde38f
	.word  0xa87ccaca,0xe593a7ee,0x59bd7bdf,0xead4f010
	.word  0x6b36d0d2,0xe6715f38,0x83557a3a,0x70cace17
	.word  0x6c0f341a,0xea427100,0x4d50bb6a,0x69a073d2
	.word  0x37883818,0xe1665c28,0xb2bcbdac,0x22bfb31e
	.word  0x05cfeb06,0x1a9f21eb,0x7ee1371f,0x7a80549c
	.word  0x7e6cb7ff,0x81326f5a,0xc5cce048,0x5e435e26
	.word  0xb990cd44,0x25af1a83,0x917fe81f,0xc6480aa3
	.word  0x6bfe8c15,0xc6f9492a,0x6700f4bd,0xe924b09e
	.word  0x3c5844ab,0x9fdf533f,0xd42f32cd,0xe48d7fd0
	.word  0xb668fcad,0x49f65652,0x0b6e4be9,0x7bdf173f
	.word  0x75ad704a,0x5098bc74,0x08689e50,0x5532561a
	.word  0xb2dfbcb1,0x754a38f5,0x62c7f3f0,0x7959b64c
	.word  0x33fed2ed,0x009202ce,0xfc8faf29,0x73ac0678
	.word  0xb45356e0,0x84f554e7,0x343dda08,0x1fc3b54b
	.word  0x3fb7dec2,0x64e44663,0x201e94a1,0xd37fd313
	.word  0xe76395c8,0xc20930b1,0x5e9c0c08,0xa24577ac
	.word  0xbfb1f1e3,0xdff6e2b3,0xedfc15ec,0x1892da40
	.word  0xf6d7bac2,0xe5342d27,0xd8f697db,0xda199682
	.word  0x73325eb5,0x898adf62,0x39024f73,0x30167d4d
	.word  0xe0bdc0ba,0xca8d6812,0x2fafb279,0x2a7ed433
	.word  0x37e42bbe,0xeb4876de,0x915844e7,0x8cc7554c
	.word  0x1c21dd83,0x04a14ba6,0x1804882c,0xfa86dc6f
	.word  0x79cb436c,0xc339c704,0x3a4c7af9,0xd18e630f
	.word  0xec19e69b,0x39b1c03b,0xed5fc5bf,0xed578bbb
	.word  0xc3614236,0xcac235c7,0x1e0e677d,0xeafe218a
	.word  0x90a2ac44,0x2b2af47e,0x2e107345,0x5294507e
	.word  0x58f23442,0xf57822e9,0x6c9e000b,0xfd2622b1
	.word  0x4e0e2067,0x46b8a2e9,0x2bb5e93d,0x9c47c4d7
	.word  0xc4034644,0x29facfb5,0xc553245b,0xd125d7ca
	.word  0xb838b7e2,0xc4a1ea95,0xe198c35a,0x8d7babe1
	.word  0x328753fe,0xb5fe3f5a,0xc6a0ed6f,0x8604ad9c
	.word  0x1da533bb,0xa2507fed,0x078f8c3b,0x5004b05e
	.word  0x1cff0333,0xbfb23acd,0xc77d051f,0xf4593149
	.word  0xbbfb06f3,0x667ff164,0x3cfa9027,0xc05b94a8
	.word  0xa67f8b75,0x3f6c93a5,0xa8443411,0x76f2efa5
	.word  0x5c4f0a0a,0xadb5f92b,0x0517d886,0xec00924b
	.word  0xd1ec4fdb,0xe4a96740,0x67858115,0xa97e52eb
	.word  0x697c16bf,0x77cf9600,0x50f57b7d,0x1d38c770
	.word  0x2f2a2223,0x61db69fb,0x4ad21802,0x43d0c96e
	.word  0x35b344bb,0x52b2cf98,0x4827073d,0x66f81197
	.word  0x7d593161,0xb1bbf184,0x3ea71b37,0x33bc61e4
	.word  0xd75aa9ec,0x477c5201,0x4b5411b6,0x1f9d358e
	.word  0xf0a57479,0xcecbb7ea,0x92dbce8e,0x91186a4e
	.word  0x2b429d24,0x63aca23d,0xa38afe61,0x8a5ed6c5
	.word  0xb572251d,0xf981e8f2,0x2bdfc7d8,0x4e50eeb9
	.word  0x54294354,0xd4de0d8a,0x8fbc1e96,0x5318875b
	.word  0x8882d346,0x874d8c26,0x3e5185ba,0x4bae29a2
	.word  0x54730fd7,0xc97430b9,0xce187ecf,0x473b0ee5
	.word  0x2dd967bb,0xfc5ccebf,0xc46b80ea,0x93272b5a
	.word  0x11d054d0,0xefbfd244,0xe8a64089,0x1ca548eb
	.word  0x89cd0db6,0xcda0a16c,0xb966653b,0x5a1f35f9
	.word  0x98ed569f,0x753a6ef9,0x8e8404e3,0x0b8ad6c7
	.word  0x978eacd9,0x1e328984,0xd9a4ff2c,0x82a1d2f6
	.word  0x8287c144,0x413ec02f,0x25a31647,0xc155c2ac
	.word  0xf4783d61,0xb5c8494d,0x9cfb05c9,0x1fb3dd55
	.word  0xe92ede8f,0x23c63551,0x65116838,0x94ec32b6
	.word  0x364c66be,0xe09f2f3e,0x42ba35ac,0x140d6060
	.word  0x2edb1e0b,0x7a5b4f2b,0x03f0a120,0xdf3a7beb
	.word  0xcfaff267,0x50eb65bf,0xcc6c1ced,0x838e0b0f
	.word  0x9aae492d,0xd0bf0dba,0x96eb0c76,0x78dff3d5
	.word  0x3661bd3d,0x2ce1d33a,0xc18edc72,0x3c73059f
	.word  0xe773b96e,0x38db5d5e,0xe6d12433,0x940aeb87
	.word  0x292c1ae0,0x0ac16147,0x7bfdd7fe,0xffb4993a
	.word  0xa75603b8,0xcddf3d3d,0x46b3fb3c,0x9833c480
	.word  0x486a6036,0x53456251,0xbb99f5c4,0xfc8d7965
	.word  0xd344f764,0x3eafdf90,0x741d4a7d,0xa91a0b38
	.word  0x303ff0df,0xcb2d0e85,0xbe078b81,0xbbb842c5
	.word  0xc710319b,0x5f33dad5,0x36d39416,0x1b713b9c
	.word  0x17908945,0x93882e18,0xb213f95a,0x4b6f370e
	.word  0x802bc8bb,0x48353780,0xa1d76151,0x37d7bd6e
	.word  0x16d730b9,0x37355722,0xa15d9dbf,0x1df3c54f
	.word  0x5da5f889,0x41bdda67,0xaf5da8cf,0xb4c24f88
	.word  0x916b6ff6,0xeb9cfcb0,0x1b17571a,0xae704455
	.word  0xc3d59031,0x95e1b87e,0x85bb057e,0xc7b9cdc9
	.word  0x44d52cda,0x0eaa7a9a,0xfb095b4c,0x885d60fc
	.word  0xb22651c4,0xe384e1b0,0x785d1a0f,0xeb4d81f8
	.word  0xf7fd6cc9,0xc26020ea,0xb1143e5d,0x33db28ab
	.word  0x7d466b6f,0x96f1a4d2,0x2540a7b0,0x55662282
	.word  0xe04529d0,0xfbf0180e,0xd1eecdde,0x2b35afdf
	.word  0x58b85795,0x6fe115b1,0xfa76aa02,0x33149f76
	.word  0x8628416e,0x03421e65,0xf2aedb0a,0x6ec36355
	.word  0x525509b4,0x0aabdd25,0x4446ff71,0xedce2737
	.word  0xe0a0bf5a,0x00424d62,0x03acae73,0x96c43cb7
	.word  0xe55a0f75,0x6f049bc2,0x3f87a45a,0xc6e96e3b
	.word  0xaf059789,0x8f0cce81,0xabd01f67,0xaa92710a
	.word  0xb53c5305,0x9859f4a4,0x4530953d,0x04ae093e
	.word  0x5982213f,0x4aff57ca,0xda01c7f5,0x20473bc2
	.word  0x62a0b646,0xf9e90e19,0x49cd191e,0xa2f9b780
	.word  0x5de6f8f1,0x2800407e,0xb1149477,0x82aa9195
	.word  0x21f8159f,0xe15de099,0xe1f3c5b8,0x6759f77c
	.word  0xf87e4acd,0x4ed313ac,0xa7fa83bf,0x7b4b5447
	.word  0x443ed46c,0xd7a4dff5,0x4482581b,0xf330da88
	.word  0x78965ce4,0xe6e90200,0x54168934,0xd7e97cce
	.word  0x9b6c82bb,0x64d507ed,0x783aad6e,0xa5a135d1
	.word  0x903b808f,0x4821866d,0xfde332dc,0x2e969868
	.word  0x26787fef,0xe75db921,0x22eac287,0xb256d8d8
	.word  0x1cda553f,0x2449b1df,0x549e46ca,0x341acc7a
	.word  0xe7336e1e,0x0e45539f,0xd1fe2b51,0xec643277
	.word  0x16bbf9f1,0xc9b5b48f,0x311b882c,0x347d17bc
	.word  0x3dabd2ee,0xc2b63ad2,0xa005645f,0xf584997f
	.word  0x7d514f77,0x73291ea1,0xa5119010,0x9389da3e
	.word  0xd8a64e49,0xe2c6b48b,0x39415ecf,0xc20c3f08
	.word  0x3a2c9af0,0xc9f58360,0xbd817912,0x6dfcd785
	.word  0xc7c48526,0x67b6a1d3,0xa5bca8e2,0x1295390e
	.word  0x77940464,0x9c452b56,0xec9aa801,0x0c5114a7
	.word  0xc6e1483c,0xb4adbbf6,0x839d806a,0x08402f46
	.word  0x0450edfc,0x71598444,0x1119ed07,0x60899bf8
	.word  0xa1eb1bef,0xb8fe4a27,0xabe5004b,0x06c588ec
	.word  0xede79074,0x6a5d2b8f,0xff5b4288,0x4df87539
	.word  0x50d4c6ee,0x1f54a060,0x8d5661fa,0xaba1be1e
	.word  0xf3636ee3,0x4191ba8f,0xb73c6f41,0xef847b42

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
!!# load_r: tLDSB_R | tLDSH_R | tLDSW_R | tLDUB_R | tLDUH_R | tLDUW_R | tLDX_R | tLDD_R | tLDF_R | tLDDF_R
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
!!# load: tLDSB_R | tLDSB_I | tLDSH_R | tLDSH_I | tLDSW_R | tLDSW_I | tLDUB_R | tLDUB_I | tLDUH_R | tLDUH_I | tLDUW_R | tLDUW_I | tLDX_R | tLDX_I | tLDD_R | tLDD_I | tLDF_I | tLDF_R | tLDDF_I | tLDDF_R
!!# ;
!!# 
!!# asi_load: tLDSBA_R | tLDSBA_I | tLDSHA_R | tLDSHA_I | tLDSWA_R | tLDSWA_I | tLDUBA_R | tLDUBA_I | tLDUHA_R | tLDUHA_I | tLDUWA_R | tLDUWA_I | tLDXA_R | tLDXA_I | tLDDA_R | tLDDA_I 
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
!! Rule   4 (line  125), Count:   156  lop                  -> mul 
!! Rule   5 (line  125), Count:   144  lop                  -> div 
!! Rule   6 (line  125), Count:   139  lop                  -> fpop 
!! Rule   7 (line  125), Count:   106  lop                  -> load 
!! Rule   8 (line  125), Count:   139  lop                  -> asi_load 
!! Rule   9 (line  125), Count:   124  lop                  -> asi_st 
!! Rule  10 (line  125), Count:   122  lop                  -> br 
!! Rule  11 (line  125), Count:   134  lop                  -> membar 
!! Rule  12 (line  125), Count:   129  lop                  -> atomic 
!! Rule  13 (line  125), Count:   130  lop                  -> prefetch 
!! Rule  14 (line  128), Count:   224  store_r              -> tSTB_R 
!! Rule  15 (line  128), Count:   239  store_r              -> tSTH_R 
!! Rule  16 (line  128), Count:   233  store_r              -> tSTW_R 
!! Rule  17 (line  128), Count:   217  store_r              -> tSTX_R 
!! Rule  18 (line  128), Count:   220  store_r              -> tSTF_R 
!! Rule  19 (line  128), Count:   195  store_r              -> tSTDF_R 
!! Rule  20 (line  131), Count:   154  load_r               -> tLDSB_R 
!! Rule  21 (line  131), Count:   112  load_r               -> tLDSH_R 
!! Rule  22 (line  131), Count:   142  load_r               -> tLDSW_R 
!! Rule  23 (line  131), Count:   134  load_r               -> tLDUB_R 
!! Rule  24 (line  131), Count:   133  load_r               -> tLDUH_R 
!! Rule  25 (line  131), Count:   142  load_r               -> tLDUW_R 
!! Rule  26 (line  131), Count:   125  load_r               -> tLDX_R 
!! Rule  27 (line  131), Count:   105  load_r               -> tLDD_R 
!! Rule  28 (line  131), Count:   139  load_r               -> tLDF_R 
!! Rule  29 (line  131), Count:   138  load_r               -> tLDDF_R 
!! Rule  30 (line  134), Count:    70  fpop                 -> st_fp 
!! Rule  31 (line  134), Count:    68  fpop                 -> arith_fp 
!! Rule  32 (line  137), Count:    13  mul                  -> tMULX_R 
!! Rule  33 (line  137), Count:    10  mul                  -> tMULX_I 
!! Rule  34 (line  137), Count:    16  mul                  -> tUMUL_R 
!! Rule  35 (line  137), Count:    11  mul                  -> tUMUL_I 
!! Rule  36 (line  137), Count:     8  mul                  -> tSMUL_R 
!! Rule  37 (line  137), Count:    15  mul                  -> tSMUL_I 
!! Rule  38 (line  137), Count:    10  mul                  -> tUMULcc_R 
!! Rule  39 (line  137), Count:    13  mul                  -> tUMULcc_I 
!! Rule  40 (line  137), Count:     7  mul                  -> tSMULcc_R 
!! Rule  41 (line  137), Count:     8  mul                  -> tSMULcc_I 
!! Rule  42 (line  137), Count:    19  mul                  -> tMULScc_R 
!! Rule  43 (line  137), Count:    15  mul                  -> tMULScc_I 
!! Rule  44 (line  140), Count:    14  div                  -> tUDIV_I 
!! Rule  45 (line  140), Count:    13  div                  -> tUDIV_R 
!! Rule  46 (line  140), Count:    18  div                  -> tSDIV_I 
!! Rule  47 (line  140), Count:    13  div                  -> tSDIV_R 
!! Rule  48 (line  140), Count:     7  div                  -> tSDIVX_R 
!! Rule  49 (line  140), Count:     8  div                  -> tSDIVX_I 
!! Rule  50 (line  140), Count:     3  div                  -> tUDIVX_R 
!! Rule  51 (line  140), Count:    14  div                  -> tUDIVX_I 
!! Rule  52 (line  140), Count:     6  div                  -> tUDIVcc_I 
!! Rule  53 (line  140), Count:    10  div                  -> tUDIVcc_R 
!! Rule  54 (line  140), Count:    16  div                  -> tSDIVcc_I 
!! Rule  55 (line  140), Count:    11  div                  -> tSDIVcc_R 
!! Rule  56 (line  143), Count:     1  load                 -> tLDSB_R 
!! Rule  57 (line  143), Count:     8  load                 -> tLDSB_I 
!! Rule  58 (line  143), Count:     2  load                 -> tLDSH_R 
!! Rule  59 (line  143), Count:     5  load                 -> tLDSH_I 
!! Rule  60 (line  143), Count:     8  load                 -> tLDSW_R 
!! Rule  61 (line  143), Count:     3  load                 -> tLDSW_I 
!! Rule  62 (line  143), Count:    12  load                 -> tLDUB_R 
!! Rule  63 (line  143), Count:     6  load                 -> tLDUB_I 
!! Rule  64 (line  143), Count:     7  load                 -> tLDUH_R 
!! Rule  65 (line  143), Count:     1  load                 -> tLDUH_I 
!! Rule  66 (line  143), Count:     2  load                 -> tLDUW_R 
!! Rule  67 (line  143), Count:     4  load                 -> tLDUW_I 
!! Rule  68 (line  143), Count:     4  load                 -> tLDX_R 
!! Rule  69 (line  143), Count:     4  load                 -> tLDX_I 
!! Rule  70 (line  143), Count:     5  load                 -> tLDD_R 
!! Rule  71 (line  143), Count:     1  load                 -> tLDD_I 
!! Rule  72 (line  143), Count:     4  load                 -> tLDF_I 
!! Rule  73 (line  143), Count:     5  load                 -> tLDF_R 
!! Rule  74 (line  143), Count:     1  load                 -> tLDDF_I 
!! Rule  75 (line  143), Count:     4  load                 -> tLDDF_R 
!! Rule  76 (line  146), Count:     8  asi_load             -> tLDSBA_R 
!! Rule  77 (line  146), Count:     5  asi_load             -> tLDSBA_I 
!! Rule  78 (line  146), Count:     8  asi_load             -> tLDSHA_R 
!! Rule  79 (line  146), Count:     5  asi_load             -> tLDSHA_I 
!! Rule  80 (line  146), Count:     8  asi_load             -> tLDSWA_R 
!! Rule  81 (line  146), Count:     3  asi_load             -> tLDSWA_I 
!! Rule  82 (line  146), Count:     8  asi_load             -> tLDUBA_R 
!! Rule  83 (line  146), Count:    11  asi_load             -> tLDUBA_I 
!! Rule  84 (line  146), Count:    10  asi_load             -> tLDUHA_R 
!! Rule  85 (line  146), Count:    10  asi_load             -> tLDUHA_I 
!! Rule  86 (line  146), Count:     4  asi_load             -> tLDUWA_R 
!! Rule  87 (line  146), Count:     5  asi_load             -> tLDUWA_I 
!! Rule  88 (line  146), Count:    13  asi_load             -> tLDXA_R 
!! Rule  89 (line  146), Count:     9  asi_load             -> tLDXA_I 
!! Rule  90 (line  146), Count:     8  asi_load             -> tLDDA_R 
!! Rule  91 (line  146), Count:     9  asi_load             -> tLDDA_I 
!! Rule  92 (line  149), Count:     9  asi_st               -> tSTBA_R 
!! Rule  93 (line  149), Count:     7  asi_st               -> tSTBA_I 
!! Rule  94 (line  149), Count:    14  asi_st               -> tSTHA_R 
!! Rule  95 (line  149), Count:    11  asi_st               -> tSTHA_I 
!! Rule  96 (line  149), Count:    10  asi_st               -> tSTWA_R 
!! Rule  97 (line  149), Count:    14  asi_st               -> tSTWA_I 
!! Rule  98 (line  149), Count:    12  asi_st               -> tSTXA_R 
!! Rule  99 (line  149), Count:    16  asi_st               -> tSTXA_I 
!! Rule 100 (line  149), Count:     9  asi_st               -> tSTDA_R 
!! Rule 101 (line  149), Count:    13  asi_st               -> tSTDA_I 
!! Rule 102 (line  152), Count:     2  br                   -> tBA 
!! Rule 103 (line  152), Count:     3  br                   -> tBN 
!! Rule 104 (line  152), Count:     4  br                   -> tBNE 
!! Rule 105 (line  152), Count:     5  br                   -> tBE 
!! Rule 106 (line  152), Count:     3  br                   -> tBG 
!! Rule 107 (line  152), Count:     7  br                   -> tBLE 
!! Rule 108 (line  152), Count:     4  br                   -> tBGE 
!! Rule 109 (line  152), Count:     4  br                   -> tBL 
!! Rule 110 (line  152), Count:     6  br                   -> tBGU 
!! Rule 111 (line  152), Count:     6  br                   -> tBLEU 
!! Rule 112 (line  153), Count:     2  br                   -> tBCC 
!! Rule 113 (line  153), Count:     7  br                   -> tBCS 
!! Rule 114 (line  153), Count:     7  br                   -> tBPOS 
!! Rule 115 (line  153), Count:     2  br                   -> tBNEG 
!! Rule 116 (line  153), Count:     2  br                   -> tBVC 
!! Rule 117 (line  153), Count:     2  br                   -> tBVS 
!! Rule 118 (line  153), Count:     5  br                   -> tBRZ 
!! Rule 119 (line  153), Count:     6  br                   -> tBRLEZ 
!! Rule 120 (line  154), Count:     5  br                   -> tBRLZ 
!! Rule 121 (line  154), Count:     7  br                   -> tBRNZ 
!! Rule 122 (line  154), Count:     5  br                   -> tBRGZ 
!! Rule 123 (line  154), Count:     5  br                   -> tBRGEZ 
!! Rule 124 (line  154), Count:     1  br                   -> tCALL 
!! Rule 125 (line  157), Count:    72  membar               -> tMEMBAR 
!! Rule 126 (line  157), Count:    61  membar               -> tSTBAR 
!! Rule 127 (line  160), Count:     9  atomic               -> tCASA_R 
!! Rule 128 (line  160), Count:    11  atomic               -> tCASA_I 
!! Rule 129 (line  160), Count:    10  atomic               -> tCASXA_R 
!! Rule 130 (line  160), Count:     4  atomic               -> tCASXA_I 
!! Rule 131 (line  160), Count:    14  atomic               -> tLDSTUBA_I 
!! Rule 132 (line  160), Count:     8  atomic               -> tLDSTUB_I 
!! Rule 133 (line  160), Count:     8  atomic               -> tLDSTUB_R 
!! Rule 134 (line  160), Count:    17  atomic               -> tLDSTUBA_R 
!! Rule 135 (line  160), Count:     5  atomic               -> tSWAP_I 
!! Rule 136 (line  160), Count:     9  atomic               -> tSWAP_R 
!! Rule 137 (line  160), Count:     9  atomic               -> tSWAPA_I 
!! Rule 138 (line  160), Count:    14  atomic               -> tSWAPA_R 
!! Rule 139 (line  163), Count:    16  st_fp                -> tSTF_R 
!! Rule 140 (line  163), Count:     9  st_fp                -> tSTF_I 
!! Rule 141 (line  163), Count:    18  st_fp                -> tSTDF_I 
!! Rule 142 (line  163), Count:    24  st_fp                -> tSTDF_R 
!! Rule 143 (line  166), Count:    23  arith_fp             -> tFADDs 
!! Rule 144 (line  166), Count:    12  arith_fp             -> tFSUBs 
!! Rule 145 (line  166), Count:    13  arith_fp             -> tFMULs 
!! Rule 146 (line  166), Count:    17  arith_fp             -> tFDIVs 
!! Rule 147 (line  169), Count:    26  prefetch             -> tPREFETCH_I 
!! Rule 148 (line  169), Count:    32  prefetch             -> tPREFETCH_R 
!! Rule 149 (line  169), Count:    39  prefetch             -> tPREFETCHA_I 
!! 
!!   257: Token tSTB_R	Count = 225
!!   258: Token tSTH_R	Count = 240
!!   259: Token tSTW_R	Count = 234
!!   260: Token tSTX_R	Count = 218
!!   261: Token tSTF_R	Count = 238
!!   262: Token tSTDF_R	Count = 221
!!   263: Token tLDSB_R	Count = 157
!!   264: Token tLDSH_R	Count = 116
!!   265: Token tLDSW_R	Count = 152
!!   266: Token tLDUB_R	Count = 148
!!   267: Token tLDUH_R	Count = 142
!!   268: Token tLDUW_R	Count = 146
!!   269: Token tLDX_R	Count = 131
!!   270: Token tLDD_R	Count = 112
!!   271: Token tLDF_R	Count = 146
!!   272: Token tLDDF_R	Count = 144
!!   273: Token tMULX_R	Count = 14
!!   274: Token tMULX_I	Count = 11
!!   275: Token tUMUL_R	Count = 17
!!   276: Token tUMUL_I	Count = 12
!!   277: Token tSMUL_R	Count = 9
!!   278: Token tSMUL_I	Count = 16
!!   279: Token tUMULcc_R	Count = 11
!!   280: Token tUMULcc_I	Count = 14
!!   281: Token tSMULcc_R	Count = 8
!!   282: Token tSMULcc_I	Count = 9
!!   283: Token tMULScc_R	Count = 20
!!   284: Token tMULScc_I	Count = 16
!!   285: Token tUDIV_I	Count = 15
!!   286: Token tUDIV_R	Count = 14
!!   287: Token tSDIV_I	Count = 19
!!   288: Token tSDIV_R	Count = 14
!!   289: Token tSDIVX_R	Count = 8
!!   290: Token tSDIVX_I	Count = 9
!!   291: Token tUDIVX_R	Count = 4
!!   292: Token tUDIVX_I	Count = 15
!!   293: Token tUDIVcc_I	Count = 7
!!   294: Token tUDIVcc_R	Count = 11
!!   295: Token tSDIVcc_I	Count = 17
!!   296: Token tSDIVcc_R	Count = 12
!!   297: Token tLDSB_I	Count = 9
!!   298: Token tLDSH_I	Count = 6
!!   299: Token tLDSW_I	Count = 4
!!   300: Token tLDUB_I	Count = 7
!!   301: Token tLDUH_I	Count = 2
!!   302: Token tLDUW_I	Count = 5
!!   303: Token tLDX_I	Count = 5
!!   304: Token tLDD_I	Count = 2
!!   305: Token tLDF_I	Count = 5
!!   306: Token tLDDF_I	Count = 2
!!   307: Token tLDSBA_R	Count = 9
!!   308: Token tLDSBA_I	Count = 6
!!   309: Token tLDSHA_R	Count = 9
!!   310: Token tLDSHA_I	Count = 6
!!   311: Token tLDSWA_R	Count = 9
!!   312: Token tLDSWA_I	Count = 4
!!   313: Token tLDUBA_R	Count = 9
!!   314: Token tLDUBA_I	Count = 12
!!   315: Token tLDUHA_R	Count = 11
!!   316: Token tLDUHA_I	Count = 11
!!   317: Token tLDUWA_R	Count = 5
!!   318: Token tLDUWA_I	Count = 6
!!   319: Token tLDXA_R	Count = 14
!!   320: Token tLDXA_I	Count = 10
!!   321: Token tLDDA_R	Count = 9
!!   322: Token tLDDA_I	Count = 10
!!   323: Token tSTBA_R	Count = 10
!!   324: Token tSTBA_I	Count = 8
!!   325: Token tSTHA_R	Count = 15
!!   326: Token tSTHA_I	Count = 12
!!   327: Token tSTWA_R	Count = 11
!!   328: Token tSTWA_I	Count = 15
!!   329: Token tSTXA_R	Count = 13
!!   330: Token tSTXA_I	Count = 17
!!   331: Token tSTDA_R	Count = 10
!!   332: Token tSTDA_I	Count = 14
!!   333: Token tBA	Count = 3
!!   334: Token tBN	Count = 4
!!   335: Token tBNE	Count = 5
!!   336: Token tBE	Count = 6
!!   337: Token tBG	Count = 4
!!   338: Token tBLE	Count = 8
!!   339: Token tBGE	Count = 5
!!   340: Token tBL	Count = 5
!!   341: Token tBGU	Count = 7
!!   342: Token tBLEU	Count = 7
!!   343: Token tBCC	Count = 3
!!   344: Token tBCS	Count = 8
!!   345: Token tBPOS	Count = 8
!!   346: Token tBNEG	Count = 3
!!   347: Token tBVC	Count = 3
!!   348: Token tBVS	Count = 3
!!   349: Token tBRZ	Count = 6
!!   350: Token tBRLEZ	Count = 7
!!   351: Token tBRLZ	Count = 6
!!   352: Token tBRNZ	Count = 8
!!   353: Token tBRGZ	Count = 6
!!   354: Token tBRGEZ	Count = 6
!!   355: Token tCALL	Count = 2
!!   356: Token tMEMBAR	Count = 73
!!   357: Token tSTBAR	Count = 62
!!   358: Token tCASA_R	Count = 10
!!   359: Token tCASA_I	Count = 12
!!   360: Token tCASXA_R	Count = 11
!!   361: Token tCASXA_I	Count = 5
!!   362: Token tLDSTUBA_I	Count = 15
!!   363: Token tLDSTUB_I	Count = 9
!!   364: Token tLDSTUB_R	Count = 9
!!   365: Token tLDSTUBA_R	Count = 18
!!   366: Token tSWAP_I	Count = 6
!!   367: Token tSWAP_R	Count = 10
!!   368: Token tSWAPA_I	Count = 10
!!   369: Token tSWAPA_R	Count = 15
!!   370: Token tSTF_I	Count = 10
!!   371: Token tSTDF_I	Count = 19
!!   372: Token tFADDs	Count = 24
!!   373: Token tFSUBs	Count = 13
!!   374: Token tFMULs	Count = 14
!!   375: Token tFDIVs	Count = 18
!!   376: Token tPREFETCH_I	Count = 27
!!   377: Token tPREFETCH_R	Count = 33
!!   378: Token tPREFETCHA_I	Count = 40
!!   379: Token tPREFETCHA_R	Count = 31
!! 
!! 
!! +++ finish +++

