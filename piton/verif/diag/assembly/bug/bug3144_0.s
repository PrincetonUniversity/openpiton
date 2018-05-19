// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: bug3144_0.s
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
   random seed:	536224365
   Jal lop2.j:	
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
        setx  MAIN_BASE_DATA_VA, %r1, %r10
        setx  0x0000000000000dd0, %g1, %r11
        setx  0x80, %g2, %g1
        wr  %g1, %g0, %asi
	    rd %fprs, %g1
        wr %g1, 0x4, %fprs
	ldd	[%r10 + 0], %f0
	ldd	[%r10 + 8], %f2
	ldd	[%r10 + 16], %f4
	ldd	[%r10 + 24], %f6
	ldd	[%r10 + 32], %f8
	ldd	[%r10 + 40], %f10
	ldd	[%r10 + 48], %f12
	ldd	[%r10 + 56], %f14
	ldd	[%r10 + 64], %f16
	ldd	[%r10 + 72], %f18
	ldd	[%r10 + 80], %f20
	ldd	[%r10 + 88], %f22
	ldd	[%r10 + 96], %f24
	ldd	[%r10 + 104], %f26
	ldd	[%r10 + 112], %f28
	ldd	[%r10 + 120], %f30
	ldd	[%r10 + 128], %f32
	ldd	[%r10 + 136], %f34
	ldd	[%r10 + 144], %f36
	ldd	[%r10 + 152], %f38
	ldd	[%r10 + 160], %f40
	ldd	[%r10 + 168], %f42
	ldd	[%r10 + 176], %f44
	ldd	[%r10 + 184], %f46
	ldd	[%r10 + 192], %f48
	ldd	[%r10 + 200], %f50
	ldd	[%r10 + 208], %f52
	ldd	[%r10 + 216], %f54
	ldd	[%r10 + 224], %f56
	ldd	[%r10 + 232], %f58
	ldd	[%r10 + 240], %f60
	ldd	[%r10 + 248], %f62
        setx  0x2cc3ca1e8a31ceee, %g1, %r0
        setx  0x60d0aed2c84f4f29, %g1, %r1
        setx  0x5f39ac28611f3b44, %g1, %r2
        setx  0x0a8b81462c50f867, %g1, %r3
        setx  0x6ee6fdbf856f5d9e, %g1, %r4
        setx  0x66b2464b11825a33, %g1, %r5
        setx  0x329911b352b7c1a3, %g1, %r6
        setx  0xf2723ec3e74d7d37, %g1, %r7
        setx  0x0281b86feb7c74d1, %g1, %r8
        setx  0xc836a16b60e1ac43, %g1, %r9
        setx  0x58350b4c34d88bac, %g1, %r12
        setx  0xc05ddb8840e2c39c, %g1, %r13
        setx  0x282bef1c0a8b8c54, %g1, %r14
        setx  0xb29397aaf0b53cca, %g1, %r15
        setx  0x190ea253b422d126, %g1, %r16
        setx  0x50e7f316effa1681, %g1, %r17
        setx  0x25a3a7eede236cfe, %g1, %r18
        setx  0x1267be4fae4348ab, %g1, %r19
        setx  0x7e2623cf81ce7518, %g1, %r20
        setx  0xe59a3b999c5ca39d, %g1, %r21
        setx  0x16ba08d64e26dc0c, %g1, %r22
        setx  0x4c5e005de7a3a0a1, %g1, %r23
        setx  0xa5b5a81f50a947b1, %g1, %r24
        setx  0xdf561a45a722106d, %g1, %r25
        setx  0xf52ed96aeb751d6d, %g1, %r26
        setx  0x7c8fbabefd070ab2, %g1, %r27
        setx  0xff15e25dbe91b803, %g1, %r28
        setx  0x67c505196e1e5257, %g1, %r29
        setx  0xbaa7f18456f8cedf, %g1, %r30
        setx  0x12a08c2c3fc82dd1, %g1, %r31
	.word 0x8143e07a  ! 6: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xc8b2900b  ! 7: STHA_R	stha	%r4, [%r10 + %r11] 0x80
	.word 0x9072ac74  ! 9: UDIV_I	udiv 	%r10, 0x0c74, %r8
	.word 0xd13a800b  ! 11: STDF_R	std	%f8, [%r11, %r10]
	.word 0xc33aa2a8  ! 12: STDF_I	std	%f1, [0x02a8, %r10]
	.word 0x8452ad94  ! 13: UMUL_I	umul 	%r10, 0x0d94, %r2
	.word 0xd052a5f8  ! 14: LDSH_I	ldsh	[%r10 + 0x05f8], %r8
	.word 0xc89aa128  ! 15: LDDA_I	ldda	[%r10, + 0x0128] %asi, %r4
	.word 0xec1aa300  ! 17: LDD_I	ldd	[%r10 + 0x0300], %r22
	.word 0x89a2882b  ! 18: FADDs	fadds	%f10, %f11, %f4
	.word 0xcf22800b  ! 19: STF_R	st	%f7, [%r11, %r10]
	.word 0xc36aa884  ! 20: PREFETCH_I	prefetch	[%r10 + 0x0884], #one_read
	.word 0x8a72800b  ! 21: UDIV_R	udiv 	%r10, %r11, %r5
	.word 0xcc7aa6dc  ! 22: SWAP_I	swap	%r6, [%r10 + 0x06dc]
	.word 0xfb3aab78  ! 23: STDF_I	std	%f29, [0x0b78, %r10]
	.word 0xc8aa900b  ! 24: STBA_R	stba	%r4, [%r10 + %r11] 0x80
	.word 0xe042800b  ! 25: LDSW_R	ldsw	[%r10 + %r11], %r16
	.word 0x2eca0001  ! 27: BRGEZ	brgez,a,pt	%8,<label_0xa0001>
	.word 0xdeca900b  ! 28: LDSBA_R	ldsba	[%r10, %r11] 0x80, %r15
	.word 0xc8f2af78  ! 29: STXA_I	stxa	%r4, [%r10 + 0x0f78] %asi
	.word 0x8cd2a1b8  ! 30: UMULcc_I	umulcc 	%r10, 0x01b8, %r6
	.word 0xf0caa674  ! 31: LDSBA_I	ldsba	[%r10, + 0x0674] %asi, %r24
	.word 0xe0ba900b  ! 32: STDA_R	stda	%r16, [%r10 + %r11] 0x80
	.word 0xd922a774  ! 33: STF_I	st	%f12, [0x0774, %r10]
	.word 0x9bda800b  ! 34: FLUSH_R	dis not found

	.word 0xd0da900b  ! 35: LDXA_R	ldxa	[%r10, %r11] 0x80, %r8
	.word 0xf492a2cc  ! 36: LDUHA_I	lduha	[%r10, + 0x02cc] %asi, %r26
	.word 0x865aaa88  ! 37: SMUL_I	smul 	%r10, 0x0a88, %r3
	.word 0x2c800001  ! 38: BNEG	bneg,a	<label_0x1>
	.word 0xc8aa900b  ! 39: STBA_R	stba	%r4, [%r10 + %r11] 0x80
	.word 0x91da800b  ! 40: FLUSH_R	dis not found

	.word 0x866aa14c  ! 41: UDIVX_I	udivx 	%r10, 0x014c, %r3
	.word 0x04c20001  ! 42: BRLEZ	brlez  ,nt	%8,<label_0x20001>
	.word 0xacdaaafc  ! 43: SMULcc_I	smulcc 	%r10, 0x0afc, %r22
	.word 0xf2fa900b  ! 44: SWAPA_R	swapa	%r25, [%r10 + %r11] 0x80
	.word 0xde0a800b  ! 45: LDUB_R	ldub	[%r10 + %r11], %r15
	.word 0xcaeaa4bc  ! 46: LDSTUBA_I	ldstuba	%r5, [%r10 + 0x04bc] %asi
	.word 0xadda800b  ! 47: FLUSH_R	dis not found

	.word 0x8852abf0  ! 48: UMUL_I	umul 	%r10, 0x0bf0, %r4
	.word 0xa44aafd4  ! 49: MULX_I	mulx 	%r10, 0x0fd4, %r18
	.word 0xcd22a4f4  ! 50: STF_I	st	%f6, [0x04f4, %r10]
	.word 0xd0aa900b  ! 51: STBA_R	stba	%r8, [%r10 + %r11] 0x80
	.word 0xc6fa900b  ! 52: SWAPA_R	swapa	%r3, [%r10 + %r11] 0x80
	.word 0xc41aa178  ! 53: LDD_I	ldd	[%r10 + 0x0178], %r2
	.word 0xc36a800b  ! 54: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x8143e037  ! 55: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside | #MemIssue 
	.word 0xf6daa3c8  ! 56: LDXA_I	ldxa	[%r10, + 0x03c8] %asi, %r27
	.word 0xeaea900b  ! 57: LDSTUBA_R	ldstuba	%r21, [%r10 + %r11] 0x80
	.word 0xc5f2a00b  ! 58: CASXA_R	casxa	[%r10]%asi, %r11, %r2
	.word 0x8ddaab3c  ! 59: FLUSH_I	dis not found

	.word 0xd2f2900b  ! 60: STXA_R	stxa	%r9, [%r10 + %r11] 0x80
	.word 0x8143e01a  ! 61: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside 
	.word 0xdafaa6dc  ! 62: SWAPA_I	swapa	%r13, [%r10 + 0x06dc] %asi
	.word 0xc412a920  ! 63: LDUH_I	lduh	[%r10 + 0x0920], %r2
	.word 0x8143c000  ! 64: STBAR	stbar
	.word 0xc442ac80  ! 65: LDSW_I	ldsw	[%r10 + 0x0c80], %r2
	.word 0xa24aa61c  ! 66: MULX_I	mulx 	%r10, 0x061c, %r17
	.word 0xc9e2900b  ! 67: CASA_I	casa	[%r10] 0x80, %r11, %r4
	.word 0xc36a800b  ! 68: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x90d2af28  ! 69: UMULcc_I	umulcc 	%r10, 0x0f28, %r8
	.word 0xd2fa900b  ! 70: SWAPA_R	swapa	%r9, [%r10 + %r11] 0x80
	.word 0xc922800b  ! 71: STF_R	st	%f4, [%r11, %r10]
	.word 0x8cda800b  ! 72: SMULcc_R	smulcc 	%r10, %r11, %r6
	.word 0xca42800b  ! 73: LDSW_R	ldsw	[%r10 + %r11], %r5
	.word 0xf922800b  ! 74: STF_R	st	%f28, [%r11, %r10]
	.word 0xdadaad70  ! 75: LDXA_I	ldxa	[%r10, + 0x0d70] %asi, %r13
	.word 0x8143c000  ! 76: STBAR	stbar
	.word 0x85daaeac  ! 77: FLUSH_I	dis not found

	.word 0xbfa2892b  ! 78: FMULs	fmuls	%f10, %f11, %f31
	.word 0xcc0aae6c  ! 79: LDUB_I	ldub	[%r10 + 0x0e6c], %r6
	.word 0xc3eaa2dc  ! 80: PREFETCHA_I	prefetcha	[%r10, + 0x02dc] %asi, #one_read
	.word 0x876a800b  ! 81: SDIVX_R	sdivx	%r10, %r11, %r3
	.word 0xca12ac4c  ! 82: LDUH_I	lduh	[%r10 + 0x0c4c], %r5
	.word 0xe00aa8dc  ! 83: LDUB_I	ldub	[%r10 + 0x08dc], %r16
	.word 0xcc6a800b  ! 84: LDSTUB_R	ldstub	%r6, [%r10 + %r11]
	.word 0xc892900b  ! 86: LDUHA_R	lduha	[%r10, %r11] 0x80, %r4
	.word 0xe242800b  ! 87: LDSW_R	ldsw	[%r10 + %r11], %r17
	.word 0x8143c000  ! 88: STBAR	stbar
	.word 0xf09a900b  ! 89: LDDA_R	ldda	[%r10, %r11] 0x80, %r24
	.word 0xc41aa150  ! 90: LDD_I	ldd	[%r10 + 0x0150], %r2
	.word 0xdde2900b  ! 91: CASA_I	casa	[%r10] 0x80, %r11, %r14
	.word 0xe20a800b  ! 92: LDUB_R	ldub	[%r10 + %r11], %r17
	.word 0xc36a800b  ! 93: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0xa9da800b  ! 94: FLUSH_R	dis not found

	.word 0xc522a694  ! 95: STF_I	st	%f2, [0x0694, %r10]
	.word 0x04800001  ! 96: BLE	ble  	<label_0x1>
	.word 0xd0d2900b  ! 97: LDSHA_R	ldsha	[%r10, %r11] 0x80, %r8
	.word 0xf0ba900b  ! 98: STDA_R	stda	%r24, [%r10 + %r11] 0x80
	.word 0x2c800001  ! 99: BNEG	bneg,a	<label_0x1>
	.word 0x8143e042  ! 100: MEMBAR	membar	#StoreLoad | #Sync 
	.word 0x28800003  ! 101: BLEU	bleu,a	<label_0x3>
	.word 0xb0da800b  ! 103: SMULcc_R	smulcc 	%r10, %r11, %r24
	.word 0xa44a800b  ! 104: MULX_R	mulx 	%r10, %r11, %r18
	.word 0x91da800b  ! 105: FLUSH_R	dis not found

	.word 0x1c800003  ! 106: BPOS	bpos  	<label_0x3>
	.word 0x8143e034  ! 107: MEMBAR	membar	#LoadStore | #Lookaside | #MemIssue 
	.word 0x8fda800b  ! 108: FLUSH_R	dis not found

	.word 0x20800003  ! 109: BN	bn,a	<label_0x3>
	.word 0x89da800b  ! 110: FLUSH_R	dis not found

	.word 0x876aa800  ! 111: SDIVX_I	sdivx	%r10, 0x0800, %r3
	.word 0x93da800b  ! 112: FLUSH_R	dis not found

	.word 0xc36aa1d4  ! 113: PREFETCH_I	prefetch	[%r10 + 0x01d4], #one_read
	.word 0xccbaa438  ! 114: STDA_I	stda	%r6, [%r10 + 0x0438] %asi
	.word 0xd292ab3c  ! 115: LDUHA_I	lduha	[%r10, + 0x0b3c] %asi, %r9
	.word 0xa9daa36c  ! 116: FLUSH_I	dis not found

	.word 0xc7f2900b  ! 117: CASXA_I	casxa	[%r10] 0x80, %r11, %r3
	.word 0x847a800b  ! 118: SDIV_R	sdiv 	%r10, %r11, %r2
	.word 0x92fa800b  ! 119: SDIVcc_R	sdivcc 	%r10, %r11, %r9
	.word 0xcb22800b  ! 120: STF_R	st	%f5, [%r11, %r10]
	.word 0x936a800b  ! 121: SDIVX_R	sdivx	%r10, %r11, %r9
	.word 0xb5a289ab  ! 122: FDIVs	fdivs	%f10, %f11, %f26
	.word 0x16800001  ! 123: BGE	bge  	<label_0x1>
	.word 0x9fdaab98  ! 124: FLUSH_I	dis not found

	.word 0xe6aaa52c  ! 125: STBA_I	stba	%r19, [%r10 + 0x052c] %asi
	.word 0xc3eaa07c  ! 126: PREFETCHA_I	prefetcha	[%r10, + 0x007c] %asi, #one_read
	.word 0xc692900b  ! 128: LDUHA_R	lduha	[%r10, %r11] 0x80, %r3
	.word 0x88f2800b  ! 129: UDIVcc_R	udivcc 	%r10, %r11, %r4
	.word 0x8a6aafe4  ! 130: UDIVX_I	udivx 	%r10, 0x0fe4, %r5
	.word 0xb9da800b  ! 131: FLUSH_R	dis not found

	.word 0xc48a900b  ! 132: LDUBA_R	lduba	[%r10, %r11] 0x80, %r2
	.word 0x30800001  ! 133: BA	ba,a	<label_0x1>
	.word 0xa472a2e4  ! 134: UDIV_I	udiv 	%r10, 0x02e4, %r18
	.word 0x8d22a90c  ! 135: MULScc_I	mulscc 	%r10, 0x090c, %r6
	.word 0xd2f2900b  ! 136: STXA_R	stxa	%r9, [%r10 + %r11] 0x80
	.word 0xc842800b  ! 137: LDSW_R	ldsw	[%r10 + %r11], %r4
	.word 0xacf2800b  ! 138: UDIVcc_R	udivcc 	%r10, %r11, %r22
	.word 0x99daa58c  ! 139: FLUSH_I	dis not found

	.word 0xc9f2900b  ! 140: CASXA_I	casxa	[%r10] 0x80, %r11, %r4
	.word 0x91a288ab  ! 141: FSUBs	fsubs	%f10, %f11, %f8
	.word 0xc882900b  ! 142: LDUWA_R	lduwa	[%r10, %r11] 0x80, %r4
	.word 0xb3a2882b  ! 143: FADDs	fadds	%f10, %f11, %f25
	.word 0xca52800b  ! 144: LDSH_R	ldsh	[%r10 + %r11], %r5
	.word 0x8143c000  ! 145: STBAR	stbar
	.word 0xcd22800b  ! 146: STF_R	st	%f6, [%r11, %r10]
	.word 0xf01a800b  ! 147: LDD_R	ldd	[%r10 + %r11], %r24
	.word 0xd2c2900b  ! 148: LDSWA_R	ldswa	[%r10, %r11] 0x80, %r9
	.word 0x08800001  ! 149: BLEU	bleu  	<label_0x1>
	.word 0x8bda800b  ! 150: FLUSH_R	dis not found

	.word 0x864a800b  ! 151: MULX_R	mulx 	%r10, %r11, %r3
	.word 0x93a2892b  ! 152: FMULs	fmuls	%f10, %f11, %f9
	.word 0xc73a800b  ! 153: STDF_R	std	%f3, [%r11, %r10]
	.word 0x8143e053  ! 154: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside | #Sync 
	.word 0x8452800b  ! 155: UMUL_R	umul 	%r10, %r11, %r2
	.word 0xc4d2900b  ! 156: LDSHA_R	ldsha	[%r10, %r11] 0x80, %r2
	.word 0xb6fa800b  ! 157: SDIVcc_R	sdivcc 	%r10, %r11, %r27
	.word 0xd0c2900b  ! 158: LDSWA_R	ldswa	[%r10, %r11] 0x80, %r8
	.word 0xc36a800b  ! 159: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x24800003  ! 160: BLE	ble,a	<label_0x3>
	.word 0x907a800b  ! 161: SDIV_R	sdiv 	%r10, %r11, %r8
	.word 0x8522aea4  ! 162: MULScc_I	mulscc 	%r10, 0x0ea4, %r2
	.word 0x89da800b  ! 163: FLUSH_R	dis not found

	.word 0xa9da800b  ! 164: FLUSH_R	dis not found

	.word 0xe66aa754  ! 165: LDSTUB_I	ldstub	%r19, [%r10 + 0x0754]
	.word 0xe442a314  ! 166: LDSW_I	ldsw	[%r10 + 0x0314], %r18
	.word 0x06c20001  ! 167: BRLZ	brlz  ,nt	%8,<label_0x20001>
	.word 0xd33aa5f8  ! 168: STDF_I	std	%f9, [0x05f8, %r10]
	.word 0x8bdaaed0  ! 169: FLUSH_I	dis not found

	.word 0x22c20001  ! 170: BRZ	brz,a,nt	%8,<label_0x20001>
	.word 0xc852a3f4  ! 171: LDSH_I	ldsh	[%r10 + 0x03f4], %r4
	.word 0xdcfa900b  ! 172: SWAPA_R	swapa	%r14, [%r10 + %r11] 0x80
	.word 0x0c800001  ! 173: BNEG	bneg  	<label_0x1>
	.word 0xc612800b  ! 174: LDUH_R	lduh	[%r10 + %r11], %r3
	.word 0xc4a2a1fc  ! 175: STWA_I	stwa	%r2, [%r10 + 0x01fc] %asi
	.word 0xc3ea900b  ! 176: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0x24c20003  ! 177: BRLEZ	brlez,a,nt	%8,<label_0x20003>
	.word 0xfc7a800b  ! 178: SWAP_R	swap	%r30, [%r10 + %r11]
	.word 0xca7a800b  ! 179: SWAP_R	swap	%r5, [%r10 + %r11]
	.word 0x8e4a800b  ! 180: MULX_R	mulx 	%r10, %r11, %r7
	.word 0x987aa200  ! 181: SDIV_I	sdiv 	%r10, 0x0200, %r12
	.word 0xe33aaca0  ! 182: STDF_I	std	%f17, [0x0ca0, %r10]
	.word 0xccba900b  ! 183: STDA_R	stda	%r6, [%r10 + %r11] 0x80
	.word 0xe2aa900b  ! 184: STBA_R	stba	%r17, [%r10 + %r11] 0x80
	.word 0xf9f2a00b  ! 186: CASXA_R	casxa	[%r10]%asi, %r11, %r28
	.word 0x02ca0003  ! 187: BRZ	brz  ,pt	%8,<label_0xa0003>
	.word 0xa3da800b  ! 188: FLUSH_R	dis not found

	.word 0x90da800b  ! 189: SMULcc_R	smulcc 	%r10, %r11, %r8
	.word 0xcd22ae0c  ! 190: STF_I	st	%f6, [0x0e0c, %r10]
	.word 0xd0d2a998  ! 191: LDSHA_I	ldsha	[%r10, + 0x0998] %asi, %r8
	.word 0xccf2900b  ! 192: STXA_R	stxa	%r6, [%r10 + %r11] 0x80
	.word 0x846a800b  ! 193: UDIVX_R	udivx 	%r10, %r11, %r2
	.word 0xe44a800b  ! 194: LDSB_R	ldsb	[%r10 + %r11], %r18
	.word 0xf7e2900b  ! 195: CASA_I	casa	[%r10] 0x80, %r11, %r27
	.word 0x8143c000  ! 196: STBAR	stbar
	.word 0xcc5a800b  ! 197: LDX_R	ldx	[%r10 + %r11], %r6
	.word 0xd2d2ac6c  ! 198: LDSHA_I	ldsha	[%r10, + 0x0c6c] %asi, %r9
	.word 0xc48aa994  ! 199: LDUBA_I	lduba	[%r10, + 0x0994] %asi, %r2
	.word 0x34800001  ! 200: BG	bg,a	<label_0x1>
	.word 0xccaa900b  ! 201: STBA_R	stba	%r6, [%r10 + %r11] 0x80
	.word 0xc9e2900b  ! 202: CASA_I	casa	[%r10] 0x80, %r11, %r4
	.word 0xb7daa4a0  ! 203: FLUSH_I	dis not found

	.word 0xc4c2900b  ! 204: LDSWA_R	ldswa	[%r10, %r11] 0x80, %r2
	.word 0xf4aaa590  ! 205: STBA_I	stba	%r26, [%r10 + 0x0590] %asi
	.word 0xc3ea900b  ! 206: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0x8b22ad9c  ! 208: MULScc_I	mulscc 	%r10, 0x0d9c, %r5
	.word 0xc47a800b  ! 209: SWAP_R	swap	%r2, [%r10 + %r11]
	.word 0xcad2a5a8  ! 210: LDSHA_I	ldsha	[%r10, + 0x05a8] %asi, %r5
	.word 0xc2d2a494  ! 211: LDSHA_I	ldsha	[%r10, + 0x0494] %asi, %r1
	.word 0xdcbaafb8  ! 212: STDA_I	stda	%r14, [%r10 + 0x0fb8] %asi
	.word 0xca4aad2c  ! 213: LDSB_I	ldsb	[%r10 + 0x0d2c], %r5
	.word 0x8143e076  ! 214: MEMBAR	membar	#StoreLoad | #LoadStore | #Lookaside | #MemIssue | #Sync 
	.word 0x93da800b  ! 215: FLUSH_R	dis not found

	.word 0xee8a900b  ! 216: LDUBA_R	lduba	[%r10, %r11] 0x80, %r23
	.word 0x93daa120  ! 217: FLUSH_I	dis not found

	.word 0xd2aaa1a8  ! 218: STBA_I	stba	%r9, [%r10 + 0x01a8] %asi
	.word 0x89daa674  ! 219: FLUSH_I	dis not found

	.word 0xc36aa058  ! 220: PREFETCH_I	prefetch	[%r10 + 0x0058], #one_read
	.word 0x86f2a418  ! 221: UDIVcc_I	udivcc 	%r10, 0x0418, %r3
	.word 0xfeb2aba0  ! 222: STHA_I	stha	%r31, [%r10 + 0x0ba0] %asi
	.word 0x8ddaa6f8  ! 223: FLUSH_I	dis not found

	.word 0xdeda900b  ! 224: LDXA_R	ldxa	[%r10, %r11] 0x80, %r15
	.word 0xad22800b  ! 225: MULScc_R	mulscc 	%r10, %r11, %r22
	.word 0x85daa4a8  ! 226: FLUSH_I	dis not found

	.word 0x91a288ab  ! 227: FSUBs	fsubs	%f10, %f11, %f8
	.word 0x907aa028  ! 228: SDIV_I	sdiv 	%r10, 0x0028, %r8
	.word 0xca92900b  ! 229: LDUHA_R	lduha	[%r10, %r11] 0x80, %r5
	.word 0xc4aa900b  ! 230: STBA_R	stba	%r2, [%r10 + %r11] 0x80
	.word 0xddf2900b  ! 231: CASXA_I	casxa	[%r10] 0x80, %r11, %r14
	.word 0xd2f2900b  ! 232: STXA_R	stxa	%r9, [%r10 + %r11] 0x80
	.word 0xa2f2aaec  ! 233: UDIVcc_I	udivcc 	%r10, 0x0aec, %r17
	.word 0x8ba2882b  ! 234: FADDs	fadds	%f10, %f11, %f5
	.word 0xa36aaa2c  ! 235: SDIVX_I	sdivx	%r10, 0x0a2c, %r17
	.word 0xc36aa330  ! 236: PREFETCH_I	prefetch	[%r10 + 0x0330], #one_read
	.word 0x85daa5a8  ! 237: FLUSH_I	dis not found

	.word 0xd25aa960  ! 238: LDX_I	ldx	[%r10 + 0x0960], %r9
	.word 0xfe92900b  ! 239: LDUHA_R	lduha	[%r10, %r11] 0x80, %r31
	.word 0xc2d2aad8  ! 240: LDSHA_I	ldsha	[%r10, + 0x0ad8] %asi, %r1
	.word 0x14800001  ! 241: BG	bg  	<label_0x1>
	.word 0x92f2800b  ! 242: UDIVcc_R	udivcc 	%r10, %r11, %r9
	.word 0xf89a900b  ! 243: LDDA_R	ldda	[%r10, %r11] 0x80, %r28
	.word 0xcde2900b  ! 244: CASA_I	casa	[%r10] 0x80, %r11, %r6
	.word 0x2c800001  ! 246: BNEG	bneg,a	<label_0x1>
	.word 0xc682900b  ! 248: LDUWA_R	lduwa	[%r10, %r11] 0x80, %r3
	.word 0x8c5a800b  ! 249: SMUL_R	smul 	%r10, %r11, %r6
	.word 0x8143e00e  ! 250: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore 
	.word 0xb36a800b  ! 251: SDIVX_R	sdivx	%r10, %r11, %r25
	.word 0x8143e070  ! 252: MEMBAR	membar	#Lookaside | #MemIssue | #Sync 
	.word 0x925aa11c  ! 253: SMUL_I	smul 	%r10, 0x011c, %r9
	.word 0xc3ea900b  ! 254: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0xc2f2900b  ! 255: STXA_R	stxa	%r1, [%r10 + %r11] 0x80
	.word 0x9a6aa644  ! 256: UDIVX_I	udivx 	%r10, 0x0644, %r13
	.word 0x16800001  ! 257: BGE	bge  	<label_0x1>
	.word 0xd04aad44  ! 258: LDSB_I	ldsb	[%r10 + 0x0d44], %r8
	.word 0x8da288ab  ! 259: FSUBs	fsubs	%f10, %f11, %f6
	.word 0x8522ae20  ! 260: MULScc_I	mulscc 	%r10, 0x0e20, %r2
	.word 0xc2caa380  ! 261: LDSBA_I	ldsba	[%r10, + 0x0380] %asi, %r1
	.word 0xd2ea900b  ! 262: LDSTUBA_R	ldstuba	%r9, [%r10 + %r11] 0x80
	.word 0x8143c000  ! 263: STBAR	stbar
	.word 0xf5f2a00b  ! 264: CASXA_R	casxa	[%r10]%asi, %r11, %r26
	.word 0x93da800b  ! 265: FLUSH_R	dis not found

	.word 0xb3da800b  ! 266: FLUSH_R	dis not found

	.word 0x9ef2800b  ! 267: UDIVcc_R	udivcc 	%r10, %r11, %r15
	.word 0xd0f2900b  ! 268: STXA_R	stxa	%r8, [%r10 + %r11] 0x80
	.word 0xf6da900b  ! 269: LDXA_R	ldxa	[%r10, %r11] 0x80, %r27
	.word 0x8143c000  ! 270: STBAR	stbar
	.word 0xe0a2aa5c  ! 271: STWA_I	stwa	%r16, [%r10 + 0x0a5c] %asi
	.word 0xc9f2900b  ! 272: CASXA_I	casxa	[%r10] 0x80, %r11, %r4
	.word 0xcc9aade8  ! 273: LDDA_I	ldda	[%r10, + 0x0de8] %asi, %r6
	.word 0xca5aaa08  ! 274: LDX_I	ldx	[%r10 + 0x0a08], %r5
	.word 0xede2a00b  ! 275: CASA_R	casa	[%r10] %asi, %r11, %r22
	.word 0xe692900b  ! 276: LDUHA_R	lduha	[%r10, %r11] 0x80, %r19
	.word 0xcf22800b  ! 277: STF_R	st	%f7, [%r11, %r10]
	.word 0x836aaf04  ! 278: SDIVX_I	sdivx	%r10, 0x0f04, %r1
	.word 0x8143e07f  ! 279: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xd2da900b  ! 280: LDXA_R	ldxa	[%r10, %r11] 0x80, %r9
	.word 0x8143c000  ! 281: STBAR	stbar
	.word 0xdcba900b  ! 282: STDA_R	stda	%r14, [%r10 + %r11] 0x80
	.word 0xada289ab  ! 283: FDIVs	fdivs	%f10, %f11, %f22
	.word 0x82fa800b  ! 284: SDIVcc_R	sdivcc 	%r10, %r11, %r1
	.word 0xc36aa6e4  ! 285: PREFETCH_I	prefetch	[%r10 + 0x06e4], #one_read
	.word 0xd01aac98  ! 286: LDD_I	ldd	[%r10 + 0x0c98], %r8
	.word 0x85da800b  ! 287: FLUSH_R	dis not found

	.word 0x8143e043  ! 288: MEMBAR	membar	#LoadLoad | #StoreLoad | #Sync 
	.word 0xfe8aa4cc  ! 289: LDUBA_I	lduba	[%r10, + 0x04cc] %asi, %r31
	.word 0x85a289ab  ! 290: FDIVs	fdivs	%f10, %f11, %f2
	.word 0x8143e008  ! 292: MEMBAR	membar	#StoreStore 
	.word 0xd0b2900b  ! 293: STHA_R	stha	%r8, [%r10 + %r11] 0x80
	.word 0xd2fa900b  ! 294: SWAPA_R	swapa	%r9, [%r10 + %r11] 0x80
	.word 0xc5e2900b  ! 296: CASA_I	casa	[%r10] 0x80, %r11, %r2
	.word 0xcc02af34  ! 297: LDUW_I	lduw	[%r10 + 0x0f34], %r6
	.word 0x8d6aa62c  ! 299: SDIVX_I	sdivx	%r10, 0x062c, %r6
	.word 0xf052a380  ! 300: LDSH_I	ldsh	[%r10 + 0x0380], %r24
	.word 0xcaeaae70  ! 301: LDSTUBA_I	ldstuba	%r5, [%r10 + 0x0e70] %asi
	.word 0x9922800b  ! 302: MULScc_R	mulscc 	%r10, %r11, %r12
	.word 0x20800001  ! 303: BN	bn,a	<label_0x1>
	.word 0xccea900b  ! 304: LDSTUBA_R	ldstuba	%r6, [%r10 + %r11] 0x80
	.word 0xc852800b  ! 305: LDSH_R	ldsh	[%r10 + %r11], %r4
	.word 0x904aab44  ! 306: MULX_I	mulx 	%r10, 0x0b44, %r8
	.word 0xc3ea900b  ! 307: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0xe4ba900b  ! 309: STDA_R	stda	%r18, [%r10 + %r11] 0x80
	.word 0xfea2ac4c  ! 310: STWA_I	stwa	%r31, [%r10 + 0x0c4c] %asi
	.word 0x89da800b  ! 311: FLUSH_R	dis not found

	.word 0xd0faaa0c  ! 312: SWAPA_I	swapa	%r8, [%r10 + 0x0a0c] %asi
	.word 0x93a288ab  ! 313: FSUBs	fsubs	%f10, %f11, %f9
	.word 0x86d2800b  ! 314: UMULcc_R	umulcc 	%r10, %r11, %r3
	.word 0x40000001  ! 315: CALL	call	disp30_1
	.word 0x3a800001  ! 318: BCC	bcc,a	<label_0x1>
	.word 0xd002a544  ! 319: LDUW_I	lduw	[%r10 + 0x0544], %r8
	.word 0x984aafb4  ! 320: MULX_I	mulx 	%r10, 0x0fb4, %r12
	.word 0xf282abd8  ! 321: LDUWA_I	lduwa	[%r10, + 0x0bd8] %asi, %r25
	.word 0x8143c000  ! 322: STBAR	stbar
	.word 0x36800001  ! 323: BGE	bge,a	<label_0x1>
	.word 0x8143c000  ! 324: STBAR	stbar
	.word 0x16800003  ! 325: BGE	bge  	<label_0x3>
	.word 0x2c800001  ! 326: BNEG	bneg,a	<label_0x1>
	.word 0x8fa289ab  ! 327: FDIVs	fdivs	%f10, %f11, %f7
	.word 0xcc12800b  ! 328: LDUH_R	lduh	[%r10 + %r11], %r6
	.word 0x8143e058  ! 329: MEMBAR	membar	#StoreStore | #Lookaside | #Sync 
	.word 0x0cca0001  ! 330: BRGZ	brgz  ,pt	%8,<label_0xa0001>
	.word 0xc36aa224  ! 331: PREFETCH_I	prefetch	[%r10 + 0x0224], #one_read
	.word 0xf53a800b  ! 332: STDF_R	std	%f26, [%r11, %r10]
	.word 0x93da800b  ! 333: FLUSH_R	dis not found

	.word 0x9272800b  ! 334: UDIV_R	udiv 	%r10, %r11, %r9
	.word 0x02c20003  ! 335: BRZ	brz  ,nt	%8,<label_0x20003>
	.word 0xe0a2900b  ! 336: STWA_R	stwa	%r16, [%r10 + %r11] 0x80
	.word 0x16800001  ! 337: BGE	bge  	<label_0x1>
	.word 0x9a6a800b  ! 338: UDIVX_R	udivx 	%r10, %r11, %r13
	.word 0x8722aecc  ! 339: MULScc_I	mulscc 	%r10, 0x0ecc, %r3
	.word 0xc522800b  ! 340: STF_R	st	%f2, [%r11, %r10]
	.word 0x85daad64  ! 341: FLUSH_I	dis not found

	.word 0xd2aaa324  ! 342: STBA_I	stba	%r9, [%r10 + 0x0324] %asi
	.word 0x28800001  ! 343: BLEU	bleu,a	<label_0x1>
	.word 0xc852ae4c  ! 344: LDSH_I	ldsh	[%r10 + 0x0e4c], %r4
	.word 0x14800001  ! 345: BG	bg  	<label_0x1>
	.word 0xb522800b  ! 346: MULScc_R	mulscc 	%r10, %r11, %r26
	.word 0x8fa289ab  ! 347: FDIVs	fdivs	%f10, %f11, %f7
	.word 0x8ba2882b  ! 348: FADDs	fadds	%f10, %f11, %f5
	.word 0xe8baaf00  ! 349: STDA_I	stda	%r20, [%r10 + 0x0f00] %asi
	.word 0x86d2800b  ! 350: UMULcc_R	umulcc 	%r10, %r11, %r3
	.word 0xce6aaed8  ! 351: LDSTUB_I	ldstub	%r7, [%r10 + 0x0ed8]
	.word 0x83da800b  ! 352: FLUSH_R	dis not found

	.word 0x8143c000  ! 353: STBAR	stbar
	.word 0xf2aaa73c  ! 354: STBA_I	stba	%r25, [%r10 + 0x073c] %asi
	.word 0x91daae18  ! 355: FLUSH_I	dis not found

	.word 0xec02800b  ! 356: LDUW_R	lduw	[%r10 + %r11], %r22
	.word 0xceb2900b  ! 357: STHA_R	stha	%r7, [%r10 + %r11] 0x80
	.word 0x9fda800b  ! 358: FLUSH_R	dis not found

	.word 0xf722800b  ! 359: STF_R	st	%f27, [%r11, %r10]
	.word 0xc36aad18  ! 360: PREFETCH_I	prefetch	[%r10 + 0x0d18], #one_read
	.word 0xc6d2a0f4  ! 361: LDSHA_I	ldsha	[%r10, + 0x00f4] %asi, %r3
	.word 0x34800001  ! 362: BG	bg,a	<label_0x1>
	.word 0xc66a800b  ! 363: LDSTUB_R	ldstub	%r3, [%r10 + %r11]
	.word 0x887aa740  ! 364: SDIV_I	sdiv 	%r10, 0x0740, %r4
	.word 0xb1daa938  ! 365: FLUSH_I	dis not found

	.word 0xba4aa518  ! 366: MULX_I	mulx 	%r10, 0x0518, %r29
	.word 0x87a2892b  ! 367: FMULs	fmuls	%f10, %f11, %f3
	.word 0xc4ea900b  ! 368: LDSTUBA_R	ldstuba	%r2, [%r10 + %r11] 0x80
	.word 0xc4caa928  ! 369: LDSBA_I	ldsba	[%r10, + 0x0928] %asi, %r2
	.word 0x8143e059  ! 370: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside | #Sync 
	.word 0xe7e2900b  ! 371: CASA_I	casa	[%r10] 0x80, %r11, %r19
	.word 0xd0b2a404  ! 372: STHA_I	stha	%r8, [%r10 + 0x0404] %asi
	.word 0xc36a800b  ! 373: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x06800001  ! 374: BL	bl  	<label_0x1>
	.word 0xd26aa82c  ! 375: LDSTUB_I	ldstub	%r9, [%r10 + 0x082c]
	.word 0x8a6a800b  ! 376: UDIVX_R	udivx 	%r10, %r11, %r5
	.word 0xc53a800b  ! 377: STDF_R	std	%f2, [%r11, %r10]
	.word 0xbe72a278  ! 378: UDIV_I	udiv 	%r10, 0x0278, %r31
	.word 0x8c6aad54  ! 379: UDIVX_I	udivx 	%r10, 0x0d54, %r6
	.word 0xef22800b  ! 380: STF_R	st	%f23, [%r11, %r10]
	.word 0x1a800001  ! 381: BCC	bcc  	<label_0x1>
	.word 0xf05aa760  ! 382: LDX_I	ldx	[%r10 + 0x0760], %r24
	.word 0xc9f2a00b  ! 383: CASXA_R	casxa	[%r10]%asi, %r11, %r4
	.word 0xc4eaaecc  ! 384: LDSTUBA_I	ldstuba	%r2, [%r10 + 0x0ecc] %asi
	.word 0xf4a2900b  ! 385: STWA_R	stwa	%r26, [%r10 + %r11] 0x80
	.word 0xc3f2900b  ! 386: CASXA_I	casxa	[%r10] 0x80, %r11, %r1
	.word 0x85a289ab  ! 387: FDIVs	fdivs	%f10, %f11, %f2
	.word 0x93a289ab  ! 388: FDIVs	fdivs	%f10, %f11, %f9
	.word 0x905aa6c4  ! 389: SMUL_I	smul 	%r10, 0x06c4, %r8
	.word 0x8143e058  ! 390: MEMBAR	membar	#StoreStore | #Lookaside | #Sync 
	.word 0x90faaaa0  ! 391: SDIVcc_I	sdivcc 	%r10, 0x0aa0, %r8
	.word 0xc36aa9a8  ! 392: PREFETCH_I	prefetch	[%r10 + 0x09a8], #one_read
	.word 0xb5da800b  ! 393: FLUSH_R	dis not found

	.word 0x8bdaafd4  ! 394: FLUSH_I	dis not found

	.word 0xdb22800b  ! 395: STF_R	st	%f13, [%r11, %r10]
	.word 0xc4b2a0d0  ! 396: STHA_I	stha	%r2, [%r10 + 0x00d0] %asi
	.word 0x87da800b  ! 397: FLUSH_R	dis not found

	.word 0xc2ca900b  ! 398: LDSBA_R	ldsba	[%r10, %r11] 0x80, %r1
	.word 0xae72800b  ! 399: UDIV_R	udiv 	%r10, %r11, %r23
	.word 0x84f2abe8  ! 400: UDIVcc_I	udivcc 	%r10, 0x0be8, %r2
	.word 0xccaa900b  ! 401: STBA_R	stba	%r6, [%r10 + %r11] 0x80
	.word 0xceaaa05c  ! 402: STBA_I	stba	%r7, [%r10 + 0x005c] %asi
	.word 0xc45a800b  ! 403: LDX_R	ldx	[%r10 + %r11], %r2
	.word 0x89da800b  ! 404: FLUSH_R	dis not found

	.word 0xf6b2900b  ! 405: STHA_R	stha	%r27, [%r10 + %r11] 0x80
	.word 0xcea2a5fc  ! 406: STWA_I	stwa	%r7, [%r10 + 0x05fc] %asi
	.word 0x8ef2aecc  ! 407: UDIVcc_I	udivcc 	%r10, 0x0ecc, %r7
	.word 0x8252afa4  ! 408: UMUL_I	umul 	%r10, 0x0fa4, %r1
	.word 0x8ddaaa80  ! 409: FLUSH_I	dis not found

	.word 0x8143c000  ! 410: STBAR	stbar
	.word 0x0a800001  ! 411: BCS	bcs  	<label_0x1>
	.word 0x926aab40  ! 412: UDIVX_I	udivx 	%r10, 0x0b40, %r9
	.word 0xcd3aa2a0  ! 413: STDF_I	std	%f6, [0x02a0, %r10]
	.word 0x3a800001  ! 414: BCC	bcc,a	<label_0x1>
	.word 0x8e7aabe8  ! 415: SDIV_I	sdiv 	%r10, 0x0be8, %r7
	.word 0xc3ea900b  ! 416: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0x90f2a1fc  ! 417: UDIVcc_I	udivcc 	%r10, 0x01fc, %r8
	.word 0x8143e016  ! 418: MEMBAR	membar	#StoreLoad | #LoadStore | #Lookaside 
	.word 0xdecaa6d0  ! 419: LDSBA_I	ldsba	[%r10, + 0x06d0] %asi, %r15
	.word 0x8dda800b  ! 420: FLUSH_R	dis not found

	.word 0xa46aa390  ! 421: UDIVX_I	udivx 	%r10, 0x0390, %r18
	.word 0xc922800b  ! 422: STF_R	st	%f4, [%r11, %r10]
	.word 0xe3f2900b  ! 423: CASXA_I	casxa	[%r10] 0x80, %r11, %r17
	.word 0x887a800b  ! 424: SDIV_R	sdiv 	%r10, %r11, %r4
	.word 0xf042ad04  ! 425: LDSW_I	ldsw	[%r10 + 0x0d04], %r24
	.word 0xfcaa900b  ! 426: STBA_R	stba	%r30, [%r10 + %r11] 0x80
	.word 0x8522ac3c  ! 427: MULScc_I	mulscc 	%r10, 0x0c3c, %r2
	.word 0xc36aa588  ! 428: PREFETCH_I	prefetch	[%r10 + 0x0588], #one_read
	.word 0x87daa34c  ! 429: FLUSH_I	dis not found

	.word 0xd2b2900b  ! 430: STHA_R	stha	%r9, [%r10 + %r11] 0x80
	.word 0xda6aa4ac  ! 432: LDSTUB_I	ldstub	%r13, [%r10 + 0x04ac]
	.word 0x8f6aaf8c  ! 433: SDIVX_I	sdivx	%r10, 0x0f8c, %r7
	.word 0xccca900b  ! 434: LDSBA_R	ldsba	[%r10, %r11] 0x80, %r6
	.word 0x0cca0001  ! 435: BRGZ	brgz  ,pt	%8,<label_0xa0001>
	.word 0xc4aaadd4  ! 436: STBA_I	stba	%r2, [%r10 + 0x0dd4] %asi
	.word 0x91da800b  ! 437: FLUSH_R	dis not found

	.word 0x8143e058  ! 438: MEMBAR	membar	#StoreStore | #Lookaside | #Sync 
	.word 0xca02a14c  ! 439: LDUW_I	lduw	[%r10 + 0x014c], %r5
	.word 0xe4ba900b  ! 440: STDA_R	stda	%r18, [%r10 + %r11] 0x80
	.word 0xceb2a77c  ! 441: STHA_I	stha	%r7, [%r10 + 0x077c] %asi
	.word 0xc3eaa510  ! 442: PREFETCHA_I	prefetcha	[%r10, + 0x0510] %asi, #one_read
	.word 0xe0a2a010  ! 443: STWA_I	stwa	%r16, [%r10 + 0x0010] %asi
	.word 0xfcea900b  ! 444: LDSTUBA_R	ldstuba	%r30, [%r10 + %r11] 0x80
	.word 0xc4ea900b  ! 445: LDSTUBA_R	ldstuba	%r2, [%r10 + %r11] 0x80
	.word 0x9afaa03c  ! 446: SDIVcc_I	sdivcc 	%r10, 0x003c, %r13
	.word 0x8143c000  ! 447: STBAR	stbar
	.word 0xc2b2900b  ! 448: STHA_R	stha	%r1, [%r10 + %r11] 0x80
	.word 0xce02800b  ! 449: LDUW_R	lduw	[%r10 + %r11], %r7
	.word 0x8143c000  ! 450: STBAR	stbar
	.word 0xd242800b  ! 451: LDSW_R	ldsw	[%r10 + %r11], %r9
	.word 0xc87aad50  ! 452: SWAP_I	swap	%r4, [%r10 + 0x0d50]
	.word 0xcc4aaf9c  ! 453: LDSB_I	ldsb	[%r10 + 0x0f9c], %r6
	.word 0x89a2882b  ! 454: FADDs	fadds	%f10, %f11, %f4
	.word 0xc66a800b  ! 455: LDSTUB_R	ldstub	%r3, [%r10 + %r11]
	.word 0x85daa31c  ! 456: FLUSH_I	dis not found

	.word 0xb44aa334  ! 457: MULX_I	mulx 	%r10, 0x0334, %r26
	.word 0xe8d2ada8  ! 458: LDSHA_I	ldsha	[%r10, + 0x0da8] %asi, %r20
	.word 0xdd22800b  ! 459: STF_R	st	%f14, [%r11, %r10]
	.word 0xd2b2acac  ! 460: STHA_I	stha	%r9, [%r10 + 0x0cac] %asi
	.word 0xc73a800b  ! 461: STDF_R	std	%f3, [%r11, %r10]
	.word 0x24c20001  ! 462: BRLEZ	brlez,a,nt	%8,<label_0x20001>
	.word 0xc93aaf98  ! 463: STDF_I	std	%f4, [0x0f98, %r10]
	.word 0xcf22800b  ! 464: STF_R	st	%f7, [%r11, %r10]
	.word 0xc202800b  ! 465: LDUW_R	lduw	[%r10 + %r11], %r1
	.word 0xdcfaa874  ! 466: SWAPA_I	swapa	%r14, [%r10 + 0x0874] %asi
	.word 0xd0f2900b  ! 467: STXA_R	stxa	%r8, [%r10 + %r11] 0x80
	.word 0xc36a800b  ! 468: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0xf2a2900b  ! 469: STWA_R	stwa	%r25, [%r10 + %r11] 0x80
	.word 0xe042800b  ! 470: LDSW_R	ldsw	[%r10 + %r11], %r16
	.word 0xc4ba900b  ! 471: STDA_R	stda	%r2, [%r10 + %r11] 0x80
	.word 0xccb2900b  ! 473: STHA_R	stha	%r6, [%r10 + %r11] 0x80
	.word 0xb5daadf0  ! 474: FLUSH_I	dis not found

	.word 0x8fa2882b  ! 475: FADDs	fadds	%f10, %f11, %f7
	.word 0x90fa800b  ! 476: SDIVcc_R	sdivcc 	%r10, %r11, %r8
	.word 0xc46a800b  ! 477: LDSTUB_R	ldstub	%r2, [%r10 + %r11]
	.word 0x91da800b  ! 478: FLUSH_R	dis not found

	.word 0xfad2900b  ! 479: LDSHA_R	ldsha	[%r10, %r11] 0x80, %r29
	.word 0xcc82a508  ! 480: LDUWA_I	lduwa	[%r10, + 0x0508] %asi, %r6
	.word 0xf0baae08  ! 481: STDA_I	stda	%r24, [%r10 + 0x0e08] %asi
	.word 0x8d6a800b  ! 482: SDIVX_R	sdivx	%r10, %r11, %r6
	.word 0x89daafb0  ! 483: FLUSH_I	dis not found

	.word 0xc8a2900b  ! 484: STWA_R	stwa	%r4, [%r10 + %r11] 0x80
	.word 0x06800003  ! 485: BL	bl  	<label_0x3>
	.word 0x30800001  ! 486: BA	ba,a	<label_0x1>
	.word 0xcd3a800b  ! 487: STDF_R	std	%f6, [%r11, %r10]
	.word 0x8143c000  ! 488: STBAR	stbar
	.word 0xca52ae40  ! 489: LDSH_I	ldsh	[%r10 + 0x0e40], %r5
	.word 0xd1f2900b  ! 490: CASXA_I	casxa	[%r10] 0x80, %r11, %r8
	.word 0xdc92900b  ! 491: LDUHA_R	lduha	[%r10, %r11] 0x80, %r14
	.word 0x866aa6bc  ! 492: UDIVX_I	udivx 	%r10, 0x06bc, %r3
	.word 0xe322aae8  ! 493: STF_I	st	%f17, [0x0ae8, %r10]
	.word 0x85a2882b  ! 494: FADDs	fadds	%f10, %f11, %f2
	.word 0xc3ea900b  ! 495: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0x8143e02f  ! 496: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #MemIssue 
	.word 0xeec2a2a0  ! 497: LDSWA_I	ldswa	[%r10, + 0x02a0] %asi, %r23
	.word 0x3c800001  ! 498: BPOS	bpos,a	<label_0x1>
	.word 0xc81a800b  ! 499: LDD_R	ldd	[%r10 + %r11], %r4
	.word 0xc88a900b  ! 500: LDUBA_R	lduba	[%r10, %r11] 0x80, %r4
	.word 0xc5e2900b  ! 501: CASA_I	casa	[%r10] 0x80, %r11, %r2
	.word 0x8ad2800b  ! 502: UMULcc_R	umulcc 	%r10, %r11, %r5
	.word 0xa472a4c4  ! 503: UDIV_I	udiv 	%r10, 0x04c4, %r18
	.word 0x8e4a800b  ! 504: MULX_R	mulx 	%r10, %r11, %r7
	.word 0xd06a800b  ! 505: LDSTUB_R	ldstub	%r8, [%r10 + %r11]
	.word 0x87a289ab  ! 506: FDIVs	fdivs	%f10, %f11, %f3
	.word 0x8da2882b  ! 507: FADDs	fadds	%f10, %f11, %f6
	.word 0x866aadec  ! 508: UDIVX_I	udivx 	%r10, 0x0dec, %r3
	.word 0xcca2900b  ! 509: STWA_R	stwa	%r6, [%r10 + %r11] 0x80
	.word 0x92faa050  ! 510: SDIVcc_I	sdivcc 	%r10, 0x0050, %r9
	.word 0xb5daa764  ! 511: FLUSH_I	dis not found

	.word 0xc36a800b  ! 512: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0xc6f2a088  ! 513: STXA_I	stxa	%r3, [%r10 + 0x0088] %asi
	.word 0x2a800001  ! 514: BCS	bcs,a	<label_0x1>
	.word 0x2aca0003  ! 515: BRNZ	brnz,a,pt	%8,<label_0xa0003>
	.word 0x1c800003  ! 516: BPOS	bpos  	<label_0x3>
	.word 0xf602ab2c  ! 518: LDUW_I	lduw	[%r10 + 0x0b2c], %r27
	.word 0xc85aa618  ! 519: LDX_I	ldx	[%r10 + 0x0618], %r4
	.word 0x8da2892b  ! 520: FMULs	fmuls	%f10, %f11, %f6
	.word 0x8922a9a0  ! 521: MULScc_I	mulscc 	%r10, 0x09a0, %r4
	.word 0xafdaaa58  ! 522: FLUSH_I	dis not found

	.word 0xea8a900b  ! 523: LDUBA_R	lduba	[%r10, %r11] 0x80, %r21
	.word 0xd8baa578  ! 524: STDA_I	stda	%r12, [%r10 + 0x0578] %asi
	.word 0x10800001  ! 525: BA	ba  	<label_0x1>
	.word 0x9e7aaa88  ! 526: SDIV_I	sdiv 	%r10, 0x0a88, %r15
	.word 0x2ec20001  ! 527: BRGEZ	brgez,a,nt	%8,<label_0x20001>
	.word 0x9a52a9e0  ! 528: UMUL_I	umul 	%r10, 0x09e0, %r13
	.word 0x10800003  ! 529: BA	ba  	<label_0x3>
	.word 0x8c72800b  ! 530: UDIV_R	udiv 	%r10, %r11, %r6
	.word 0x8143e00e  ! 531: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore 
	.word 0xa8faa318  ! 532: SDIVcc_I	sdivcc 	%r10, 0x0318, %r20
	.word 0x8cf2800b  ! 533: UDIVcc_R	udivcc 	%r10, %r11, %r6
	.word 0xf4ba900b  ! 534: STDA_R	stda	%r26, [%r10 + %r11] 0x80
	.word 0xc3eaa458  ! 535: PREFETCHA_I	prefetcha	[%r10, + 0x0458] %asi, #one_read
	.word 0x8afa800b  ! 536: SDIVcc_R	sdivcc 	%r10, %r11, %r5
	.word 0xc722ad9c  ! 537: STF_I	st	%f3, [0x0d9c, %r10]
	.word 0x8472a78c  ! 538: UDIV_I	udiv 	%r10, 0x078c, %r2
	.word 0xcc7a800b  ! 539: SWAP_R	swap	%r6, [%r10 + %r11]
	.word 0xd0da900b  ! 541: LDXA_R	ldxa	[%r10, %r11] 0x80, %r8
	.word 0x87da800b  ! 542: FLUSH_R	dis not found

	.word 0x8f22800b  ! 543: MULScc_R	mulscc 	%r10, %r11, %r7
	.word 0xe9e2900b  ! 544: CASA_I	casa	[%r10] 0x80, %r11, %r20
	.word 0xeb22800b  ! 546: STF_R	st	%f21, [%r11, %r10]
	.word 0x8143e029  ! 547: MEMBAR	membar	#LoadLoad | #StoreStore | #MemIssue 
	.word 0x8143e058  ! 548: MEMBAR	membar	#StoreStore | #Lookaside | #Sync 
	.word 0x8c4aa6b0  ! 549: MULX_I	mulx 	%r10, 0x06b0, %r6
	.word 0x34800003  ! 550: BG	bg,a	<label_0x3>
	.word 0x83a288ab  ! 551: FSUBs	fsubs	%f10, %f11, %f1
	.word 0xec6aaf94  ! 552: LDSTUB_I	ldstub	%r22, [%r10 + 0x0f94]
	.word 0xc3ea900b  ! 553: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0xeaea900b  ! 554: LDSTUBA_R	ldstuba	%r21, [%r10 + %r11] 0x80
	.word 0x10800003  ! 555: BA	ba  	<label_0x3>
	.word 0x88d2800b  ! 556: UMULcc_R	umulcc 	%r10, %r11, %r4
	.word 0xcdf2900b  ! 557: CASXA_I	casxa	[%r10] 0x80, %r11, %r6
	.word 0x8143c000  ! 558: STBAR	stbar
	.word 0x92da800b  ! 559: SMULcc_R	smulcc 	%r10, %r11, %r9
	.word 0xd09aaae8  ! 560: LDDA_I	ldda	[%r10, + 0x0ae8] %asi, %r8
	.word 0x896aad18  ! 561: SDIVX_I	sdivx	%r10, 0x0d18, %r4
	.word 0xce52ac00  ! 563: LDSH_I	ldsh	[%r10 + 0x0c00], %r7
	.word 0xc4aa900b  ! 564: STBA_R	stba	%r2, [%r10 + %r11] 0x80
	.word 0x2e800001  ! 565: BVS	bvs,a	<label_0x1>
	.word 0xd2f2900b  ! 566: STXA_R	stxa	%r9, [%r10 + %r11] 0x80
	.word 0x2ac20001  ! 567: BRNZ	brnz,a,nt	%8,<label_0x20001>
	.word 0x9d22abc8  ! 568: MULScc_I	mulscc 	%r10, 0x0bc8, %r14
	.word 0x87da800b  ! 569: FLUSH_R	dis not found

	.word 0x8cfa800b  ! 570: SDIVcc_R	sdivcc 	%r10, %r11, %r6
	.word 0xcec2a990  ! 571: LDSWA_I	ldswa	[%r10, + 0x0990] %asi, %r7
	.word 0xdec2af54  ! 572: LDSWA_I	ldswa	[%r10, + 0x0f54] %asi, %r15
	.word 0x925a800b  ! 573: SMUL_R	smul 	%r10, %r11, %r9
	.word 0x90faadb0  ! 574: SDIVcc_I	sdivcc 	%r10, 0x0db0, %r8
	.word 0x8fdaaaa8  ! 575: FLUSH_I	dis not found

	.word 0xca52ab14  ! 576: LDSH_I	ldsh	[%r10 + 0x0b14], %r5
	.word 0xc0ba900b  ! 577: STDA_R	stda	%r0, [%r10 + %r11] 0x80
	.word 0xff3aa498  ! 578: STDF_I	std	%f31, [0x0498, %r10]
	.word 0xf0c2a284  ! 579: LDSWA_I	ldswa	[%r10, + 0x0284] %asi, %r24
	.word 0xf4c2900b  ! 580: LDSWA_R	ldswa	[%r10, %r11] 0x80, %r26
	.word 0xe84aa188  ! 581: LDSB_I	ldsb	[%r10 + 0x0188], %r20
	.word 0x844aa14c  ! 582: MULX_I	mulx 	%r10, 0x014c, %r2
	.word 0x8143c000  ! 583: STBAR	stbar
	.word 0xcceaa0d4  ! 584: LDSTUBA_I	ldstuba	%r6, [%r10 + 0x00d4] %asi
	.word 0xe4baae88  ! 585: STDA_I	stda	%r18, [%r10 + 0x0e88] %asi
	.word 0x00800001  ! 586: BN	bn  	<label_0x1>
	.word 0xd212800b  ! 587: LDUH_R	lduh	[%r10 + %r11], %r9
	.word 0xc36a800b  ! 588: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0xcc1aa1a0  ! 589: LDD_I	ldd	[%r10 + 0x01a0], %r6
	.word 0xf66a800b  ! 590: LDSTUB_R	ldstub	%r27, [%r10 + %r11]
	.word 0xec92a524  ! 592: LDUHA_I	lduha	[%r10, + 0x0524] %asi, %r22
	.word 0x8bda800b  ! 593: FLUSH_R	dis not found

	.word 0x8afaa064  ! 594: SDIVcc_I	sdivcc 	%r10, 0x0064, %r5
	.word 0x985a800b  ! 595: SMUL_R	smul 	%r10, %r11, %r12
	.word 0x16800003  ! 597: BGE	bge  	<label_0x3>
	.word 0x8dda800b  ! 599: FLUSH_R	dis not found

	.word 0xc4ba900b  ! 600: STDA_R	stda	%r2, [%r10 + %r11] 0x80
	.word 0x8143c000  ! 601: STBAR	stbar
	.word 0x8143e05e  ! 602: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0x18800001  ! 603: BGU	bgu  	<label_0x1>
	.word 0xc3ea900b  ! 604: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0xe01aaa40  ! 605: LDD_I	ldd	[%r10 + 0x0a40], %r16
	.word 0x8672ada4  ! 606: UDIV_I	udiv 	%r10, 0x0da4, %r3
	.word 0xceb2a2a8  ! 607: STHA_I	stha	%r7, [%r10 + 0x02a8] %asi
	.word 0x8672a9e4  ! 608: UDIV_I	udiv 	%r10, 0x09e4, %r3
	.word 0x8143c000  ! 610: STBAR	stbar
	.word 0x904aaaf4  ! 611: MULX_I	mulx 	%r10, 0x0af4, %r8
	.word 0xfc9aa6a0  ! 613: LDDA_I	ldda	[%r10, + 0x06a0] %asi, %r30
	.word 0xe4faaa80  ! 614: SWAPA_I	swapa	%r18, [%r10 + 0x0a80] %asi
	.word 0xced2900b  ! 615: LDSHA_R	ldsha	[%r10, %r11] 0x80, %r7
	.word 0xd04aadd4  ! 616: LDSB_I	ldsb	[%r10 + 0x0dd4], %r8
	.word 0xc60a800b  ! 617: LDUB_R	ldub	[%r10 + %r11], %r3
	.word 0x9072800b  ! 618: UDIV_R	udiv 	%r10, %r11, %r8
	.word 0xd122800b  ! 619: STF_R	st	%f8, [%r11, %r10]
	.word 0x8da2892b  ! 620: FMULs	fmuls	%f10, %f11, %f6
	.word 0xd0c2ae64  ! 621: LDSWA_I	ldswa	[%r10, + 0x0e64] %asi, %r8
	.word 0xce8a900b  ! 622: LDUBA_R	lduba	[%r10, %r11] 0x80, %r7
	.word 0xc852800b  ! 623: LDSH_R	ldsh	[%r10 + %r11], %r4
	.word 0xcc9a900b  ! 624: LDDA_R	ldda	[%r10, %r11] 0x80, %r6
	.word 0x8b6aa760  ! 625: SDIVX_I	sdivx	%r10, 0x0760, %r5
	.word 0xb44aa8d8  ! 626: MULX_I	mulx 	%r10, 0x08d8, %r26
	.word 0x8143c000  ! 627: STBAR	stbar
	.word 0xd852a1d4  ! 628: LDSH_I	ldsh	[%r10 + 0x01d4], %r12
	.word 0xd202800b  ! 629: LDUW_R	lduw	[%r10 + %r11], %r9
	.word 0x9252800b  ! 630: UMUL_R	umul 	%r10, %r11, %r9
	.word 0x905a800b  ! 631: SMUL_R	smul 	%r10, %r11, %r8
	.word 0x02c20001  ! 632: BRZ	brz  ,nt	%8,<label_0x20001>
	.word 0xccda900b  ! 633: LDXA_R	ldxa	[%r10, %r11] 0x80, %r6
	.word 0xf27a800b  ! 634: SWAP_R	swap	%r25, [%r10 + %r11]
	.word 0xfa42a630  ! 635: LDSW_I	ldsw	[%r10 + 0x0630], %r29
	.word 0x8143c000  ! 636: STBAR	stbar
	.word 0xbafa800b  ! 637: SDIVcc_R	sdivcc 	%r10, %r11, %r29
	.word 0xf522a694  ! 638: STF_I	st	%f26, [0x0694, %r10]
	.word 0xb86aacc0  ! 639: UDIVX_I	udivx 	%r10, 0x0cc0, %r28
	.word 0xc84aabf8  ! 640: LDSB_I	ldsb	[%r10 + 0x0bf8], %r4
	.word 0x8143c000  ! 641: STBAR	stbar
	.word 0xbda2892b  ! 642: FMULs	fmuls	%f10, %f11, %f30
	.word 0xa2f2800b  ! 643: UDIVcc_R	udivcc 	%r10, %r11, %r17
	.word 0xc36aa188  ! 644: PREFETCH_I	prefetch	[%r10 + 0x0188], #one_read
	.word 0xee6a800b  ! 645: LDSTUB_R	ldstub	%r23, [%r10 + %r11]
	.word 0xb04a800b  ! 646: MULX_R	mulx 	%r10, %r11, %r24
	.word 0xa9a288ab  ! 647: FSUBs	fsubs	%f10, %f11, %f20
	.word 0x8143e037  ! 648: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside | #MemIssue 
	.word 0xd01aae10  ! 649: LDD_I	ldd	[%r10 + 0x0e10], %r8
	.word 0xe052af50  ! 650: LDSH_I	ldsh	[%r10 + 0x0f50], %r16
	.word 0x90faac80  ! 651: SDIVcc_I	sdivcc 	%r10, 0x0c80, %r8
	.word 0x34800003  ! 652: BG	bg,a	<label_0x3>
	.word 0xd01a800b  ! 653: LDD_R	ldd	[%r10 + %r11], %r8
	.word 0xeca2900b  ! 654: STWA_R	stwa	%r22, [%r10 + %r11] 0x80
	.word 0xd0a2aa6c  ! 655: STWA_I	stwa	%r8, [%r10 + 0x0a6c] %asi
	.word 0x8852a7b0  ! 656: UMUL_I	umul 	%r10, 0x07b0, %r4
	.word 0xc93a800b  ! 657: STDF_R	std	%f4, [%r11, %r10]
	.word 0x93a289ab  ! 658: FDIVs	fdivs	%f10, %f11, %f9
	.word 0xc36a800b  ! 659: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x8722800b  ! 660: MULScc_R	mulscc 	%r10, %r11, %r3
	.word 0xd212800b  ! 661: LDUH_R	lduh	[%r10 + %r11], %r9
	.word 0xa5da800b  ! 664: FLUSH_R	dis not found

	.word 0x8143e035  ! 665: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside | #MemIssue 
	.word 0x83da800b  ! 666: FLUSH_R	dis not found

	.word 0xc212800b  ! 667: LDUH_R	lduh	[%r10 + %r11], %r1
	.word 0xc24aaecc  ! 668: LDSB_I	ldsb	[%r10 + 0x0ecc], %r1
	.word 0x1e800001  ! 669: BVC	bvc  	<label_0x1>
	.word 0xd122a19c  ! 670: STF_I	st	%f8, [0x019c, %r10]
	.word 0xc8baa8b8  ! 671: STDA_I	stda	%r4, [%r10 + 0x08b8] %asi
	.word 0xd8eaaa08  ! 672: LDSTUBA_I	ldstuba	%r12, [%r10 + 0x0a08] %asi
	.word 0xc3eaa39c  ! 673: PREFETCHA_I	prefetcha	[%r10, + 0x039c] %asi, #one_read
	.word 0xfc0aaf70  ! 675: LDUB_I	ldub	[%r10 + 0x0f70], %r30
	.word 0xced2900b  ! 676: LDSHA_R	ldsha	[%r10, %r11] 0x80, %r7
	.word 0x28800001  ! 677: BLEU	bleu,a	<label_0x1>
	.word 0xa3daa2d4  ! 678: FLUSH_I	dis not found

	.word 0xc4faa320  ! 679: SWAPA_I	swapa	%r2, [%r10 + 0x0320] %asi
	.word 0xce42800b  ! 680: LDSW_R	ldsw	[%r10 + %r11], %r7
	.word 0xd27a800b  ! 681: SWAP_R	swap	%r9, [%r10 + %r11]
	.word 0xc2fa900b  ! 682: SWAPA_R	swapa	%r1, [%r10 + %r11] 0x80
	.word 0xcab2a1ec  ! 683: STHA_I	stha	%r5, [%r10 + 0x01ec] %asi
	.word 0xbefaa338  ! 684: SDIVcc_I	sdivcc 	%r10, 0x0338, %r31
	.word 0xc922800b  ! 685: STF_R	st	%f4, [%r11, %r10]
	.word 0xf2aaab98  ! 686: STBA_I	stba	%r25, [%r10 + 0x0b98] %asi
	.word 0xc36a800b  ! 687: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0xa7daac00  ! 688: FLUSH_I	dis not found

	.word 0xa1daafe0  ! 689: FLUSH_I	dis not found

	.word 0xfe6a800b  ! 690: LDSTUB_R	ldstub	%r31, [%r10 + %r11]
	.word 0xe0caa938  ! 691: LDSBA_I	ldsba	[%r10, + 0x0938] %asi, %r16
	.word 0xa472adb0  ! 693: UDIV_I	udiv 	%r10, 0x0db0, %r18
	.word 0xe692a74c  ! 694: LDUHA_I	lduha	[%r10, + 0x074c] %asi, %r19
	.word 0xd322a1d4  ! 695: STF_I	st	%f9, [0x01d4, %r10]
	.word 0xd27aac58  ! 696: SWAP_I	swap	%r9, [%r10 + 0x0c58]
	.word 0x9fda800b  ! 697: FLUSH_R	dis not found

	.word 0xf8c2a4e0  ! 698: LDSWA_I	ldswa	[%r10, + 0x04e0] %asi, %r28
	.word 0x8ef2affc  ! 699: UDIVcc_I	udivcc 	%r10, 0x0ffc, %r7
	.word 0xc3eaa0d4  ! 700: PREFETCHA_I	prefetcha	[%r10, + 0x00d4] %asi, #one_read
	.word 0x8143e064  ! 701: MEMBAR	membar	#LoadStore | #MemIssue | #Sync 
	.word 0x8cd2a5b8  ! 702: UMULcc_I	umulcc 	%r10, 0x05b8, %r6
	.word 0x88f2800b  ! 703: UDIVcc_R	udivcc 	%r10, %r11, %r4
	.word 0x84d2800b  ! 704: UMULcc_R	umulcc 	%r10, %r11, %r2
	.word 0x24ca0001  ! 705: BRLEZ	brlez,a,pt	%8,<label_0xa0001>
	.word 0xccb2ac8c  ! 706: STHA_I	stha	%r6, [%r10 + 0x0c8c] %asi
	.word 0x06800001  ! 707: BL	bl  	<label_0x1>
	.word 0x8e72a294  ! 708: UDIV_I	udiv 	%r10, 0x0294, %r7
	.word 0xd3e2900b  ! 709: CASA_I	casa	[%r10] 0x80, %r11, %r9
	.word 0xcec2ae08  ! 710: LDSWA_I	ldswa	[%r10, + 0x0e08] %asi, %r7
	.word 0xd0f2900b  ! 711: STXA_R	stxa	%r8, [%r10 + %r11] 0x80
	.word 0xca4a800b  ! 712: LDSB_R	ldsb	[%r10 + %r11], %r5
	.word 0x8ddaa384  ! 713: FLUSH_I	dis not found

	.word 0xa7a2892b  ! 714: FMULs	fmuls	%f10, %f11, %f19
	.word 0xc2faa634  ! 715: SWAPA_I	swapa	%r1, [%r10 + 0x0634] %asi
	.word 0xcaaa900b  ! 716: STBA_R	stba	%r5, [%r10 + %r11] 0x80
	.word 0xaddaacc8  ! 717: FLUSH_I	dis not found

	.word 0x8143e020  ! 718: MEMBAR	membar	#MemIssue 
	.word 0x8143e05c  ! 719: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0x856aa1d8  ! 720: SDIVX_I	sdivx	%r10, 0x01d8, %r2
	.word 0x916aa614  ! 721: SDIVX_I	sdivx	%r10, 0x0614, %r8
	.word 0xcc82900b  ! 722: LDUWA_R	lduwa	[%r10, %r11] 0x80, %r6
	.word 0xa5a289ab  ! 723: FDIVs	fdivs	%f10, %f11, %f18
	.word 0xc28a900b  ! 724: LDUBA_R	lduba	[%r10, %r11] 0x80, %r1
	.word 0x85a289ab  ! 725: FDIVs	fdivs	%f10, %f11, %f2
	.word 0xdbf2a00b  ! 726: CASXA_R	casxa	[%r10]%asi, %r11, %r13
	.word 0x86d2a934  ! 727: UMULcc_I	umulcc 	%r10, 0x0934, %r3
	.word 0xc3eaaa3c  ! 728: PREFETCHA_I	prefetcha	[%r10, + 0x0a3c] %asi, #one_read
	.word 0x83a2882b  ! 729: FADDs	fadds	%f10, %f11, %f1
	.word 0xced2900b  ! 730: LDSHA_R	ldsha	[%r10, %r11] 0x80, %r7
	.word 0x9da2892b  ! 731: FMULs	fmuls	%f10, %f11, %f14
	.word 0xa322800b  ! 732: MULScc_R	mulscc 	%r10, %r11, %r17
	.word 0x22c20003  ! 733: BRZ	brz,a,nt	%8,<label_0x20003>
	.word 0xc2f2900b  ! 734: STXA_R	stxa	%r1, [%r10 + %r11] 0x80
	.word 0x8e4aa4c8  ! 735: MULX_I	mulx 	%r10, 0x04c8, %r7
	.word 0x887aa984  ! 736: SDIV_I	sdiv 	%r10, 0x0984, %r4
	.word 0xcaf2ac18  ! 737: STXA_I	stxa	%r5, [%r10 + 0x0c18] %asi
	.word 0xb3a289ab  ! 738: FDIVs	fdivs	%f10, %f11, %f25
	.word 0xd2f2a0f0  ! 739: STXA_I	stxa	%r9, [%r10 + 0x00f0] %asi
	.word 0x93daae2c  ! 740: FLUSH_I	dis not found

	.word 0x9edaadf8  ! 741: SMULcc_I	smulcc 	%r10, 0x0df8, %r15
	.word 0xd26a800b  ! 742: LDSTUB_R	ldstub	%r9, [%r10 + %r11]
	.word 0xca52800b  ! 743: LDSH_R	ldsh	[%r10 + %r11], %r5
	.word 0xac7aa448  ! 744: SDIV_I	sdiv 	%r10, 0x0448, %r22
	.word 0xcea2ad30  ! 745: STWA_I	stwa	%r7, [%r10 + 0x0d30] %asi
	.word 0x8ed2800b  ! 746: UMULcc_R	umulcc 	%r10, %r11, %r7
	.word 0x9852800b  ! 747: UMUL_R	umul 	%r10, %r11, %r12
	.word 0xa052800b  ! 748: UMUL_R	umul 	%r10, %r11, %r16
	.word 0x826aa1f0  ! 749: UDIVX_I	udivx 	%r10, 0x01f0, %r1
	.word 0xc292abf8  ! 750: LDUHA_I	lduha	[%r10, + 0x0bf8] %asi, %r1
	.word 0x8143c000  ! 751: STBAR	stbar
	.word 0xccea900b  ! 752: LDSTUBA_R	ldstuba	%r6, [%r10 + %r11] 0x80
	.word 0xcc12800b  ! 753: LDUH_R	lduh	[%r10 + %r11], %r6
	.word 0xc3eaaaf8  ! 754: PREFETCHA_I	prefetcha	[%r10, + 0x0af8] %asi, #one_read
	.word 0x24800001  ! 755: BLE	ble,a	<label_0x1>
	.word 0xcd22800b  ! 756: STF_R	st	%f6, [%r11, %r10]
	.word 0x884aa0c4  ! 757: MULX_I	mulx 	%r10, 0x00c4, %r4
	.word 0x827aa684  ! 758: SDIV_I	sdiv 	%r10, 0x0684, %r1
	.word 0x9ada800b  ! 759: SMULcc_R	smulcc 	%r10, %r11, %r13
	.word 0xa8f2800b  ! 760: UDIVcc_R	udivcc 	%r10, %r11, %r20
	.word 0xd0c2ac74  ! 761: LDSWA_I	ldswa	[%r10, + 0x0c74] %asi, %r8
	.word 0xc2f2900b  ! 762: STXA_R	stxa	%r1, [%r10 + %r11] 0x80
	.word 0xe1f2900b  ! 763: CASXA_I	casxa	[%r10] 0x80, %r11, %r16
	.word 0xe45aa578  ! 764: LDX_I	ldx	[%r10 + 0x0578], %r18
	.word 0xb26a800b  ! 765: UDIVX_R	udivx 	%r10, %r11, %r25
	.word 0x93a2882b  ! 766: FADDs	fadds	%f10, %f11, %f9
	.word 0xc722a5a4  ! 767: STF_I	st	%f3, [0x05a4, %r10]
	.word 0xae7aa4d0  ! 768: SDIV_I	sdiv 	%r10, 0x04d0, %r23
	.word 0xda02800b  ! 769: LDUW_R	lduw	[%r10 + %r11], %r13
	.word 0xfa5a800b  ! 770: LDX_R	ldx	[%r10 + %r11], %r29
	.word 0xf4aa900b  ! 771: STBA_R	stba	%r26, [%r10 + %r11] 0x80
	.word 0xc402a580  ! 772: LDUW_I	lduw	[%r10 + 0x0580], %r2
	.word 0xde52a608  ! 773: LDSH_I	ldsh	[%r10 + 0x0608], %r15
	.word 0x8143c000  ! 774: STBAR	stbar
	.word 0xee8a900b  ! 775: LDUBA_R	lduba	[%r10, %r11] 0x80, %r23
	.word 0xd06a800b  ! 776: LDSTUB_R	ldstub	%r8, [%r10 + %r11]
	.word 0x936a800b  ! 777: SDIVX_R	sdivx	%r10, %r11, %r9
	.word 0xccea900b  ! 778: LDSTUBA_R	ldstuba	%r6, [%r10 + %r11] 0x80
	.word 0x9e72a7f8  ! 779: UDIV_I	udiv 	%r10, 0x07f8, %r15
	.word 0x926aa930  ! 780: UDIVX_I	udivx 	%r10, 0x0930, %r9
	.word 0xf8c2900b  ! 781: LDSWA_R	ldswa	[%r10, %r11] 0x80, %r28
	.word 0x84f2a81c  ! 782: UDIVcc_I	udivcc 	%r10, 0x081c, %r2
	.word 0x82daafa8  ! 783: SMULcc_I	smulcc 	%r10, 0x0fa8, %r1
	.word 0x85a289ab  ! 784: FDIVs	fdivs	%f10, %f11, %f2
	.word 0xfa7aaa80  ! 785: SWAP_I	swap	%r29, [%r10 + 0x0a80]
	.word 0x865aacc8  ! 786: SMUL_I	smul 	%r10, 0x0cc8, %r3
	.word 0x8ddaaa8c  ! 787: FLUSH_I	dis not found

	.word 0x8143e034  ! 788: MEMBAR	membar	#LoadStore | #Lookaside | #MemIssue 
	.word 0x8ad2800b  ! 789: UMULcc_R	umulcc 	%r10, %r11, %r5
	.word 0x8a52800b  ! 790: UMUL_R	umul 	%r10, %r11, %r5
	.word 0x0cca0001  ! 791: BRGZ	brgz  ,pt	%8,<label_0xa0001>
	.word 0xc09aab68  ! 792: LDDA_I	ldda	[%r10, + 0x0b68] %asi, %r0
	.word 0xccc2900b  ! 793: LDSWA_R	ldswa	[%r10, %r11] 0x80, %r6
	.word 0xee6a800b  ! 794: LDSTUB_R	ldstub	%r23, [%r10 + %r11]
	.word 0xe612a8c4  ! 795: LDUH_I	lduh	[%r10 + 0x08c4], %r19
	.word 0xd2eaacb0  ! 796: LDSTUBA_I	ldstuba	%r9, [%r10 + 0x0cb0] %asi
	.word 0xc3eaac4c  ! 797: PREFETCHA_I	prefetcha	[%r10, + 0x0c4c] %asi, #one_read
	.word 0xea12800b  ! 799: LDUH_R	lduh	[%r10 + %r11], %r21
	.word 0x83a288ab  ! 800: FSUBs	fsubs	%f10, %f11, %f1
	.word 0x8143e030  ! 801: MEMBAR	membar	#Lookaside | #MemIssue 
	.word 0xccca900b  ! 802: LDSBA_R	ldsba	[%r10, %r11] 0x80, %r6
	.word 0x8d6aa380  ! 803: SDIVX_I	sdivx	%r10, 0x0380, %r6
	.word 0xdcb2ac74  ! 804: STHA_I	stha	%r14, [%r10 + 0x0c74] %asi
	.word 0xd2aa900b  ! 805: STBA_R	stba	%r9, [%r10 + %r11] 0x80
	.word 0xa852800b  ! 806: UMUL_R	umul 	%r10, %r11, %r20
	.word 0xdbf2a00b  ! 807: CASXA_R	casxa	[%r10]%asi, %r11, %r13
	.word 0x8143c000  ! 808: STBAR	stbar
	.word 0x8ddaa624  ! 809: FLUSH_I	dis not found

	.word 0xc7e2a00b  ! 810: CASA_R	casa	[%r10] %asi, %r11, %r3
	.word 0x866a800b  ! 811: UDIVX_R	udivx 	%r10, %r11, %r3
	.word 0xfeea900b  ! 812: LDSTUBA_R	ldstuba	%r31, [%r10 + %r11] 0x80
	.word 0xce82ac14  ! 813: LDUWA_I	lduwa	[%r10, + 0x0c14] %asi, %r7
	.word 0xc3eaa918  ! 814: PREFETCHA_I	prefetcha	[%r10, + 0x0918] %asi, #one_read
	.word 0xbe4a800b  ! 815: MULX_R	mulx 	%r10, %r11, %r31
	.word 0x8143e06b  ! 816: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #MemIssue | #Sync 
	.word 0x8143e055  ! 817: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside | #Sync 
	.word 0x8143e020  ! 818: MEMBAR	membar	#MemIssue 
	.word 0xc28aa7a8  ! 819: LDUBA_I	lduba	[%r10, + 0x07a8] %asi, %r1
	.word 0xc8d2aba8  ! 820: LDSHA_I	ldsha	[%r10, + 0x0ba8] %asi, %r4
	.word 0xd06a800b  ! 821: LDSTUB_R	ldstub	%r8, [%r10 + %r11]
	.word 0xca0a800b  ! 822: LDUB_R	ldub	[%r10 + %r11], %r5
	.word 0xdafa900b  ! 823: SWAPA_R	swapa	%r13, [%r10 + %r11] 0x80
	.word 0xb26a800b  ! 824: UDIVX_R	udivx 	%r10, %r11, %r25
	.word 0xc2da900b  ! 825: LDXA_R	ldxa	[%r10, %r11] 0x80, %r1
	.word 0xc212a1cc  ! 826: LDUH_I	lduh	[%r10 + 0x01cc], %r1
	.word 0xe64a800b  ! 827: LDSB_R	ldsb	[%r10 + %r11], %r19
	.word 0xc66aabac  ! 828: LDSTUB_I	ldstub	%r3, [%r10 + 0x0bac]
	.word 0x04800001  ! 829: BLE	ble  	<label_0x1>
	.word 0x26ca0001  ! 830: BRLZ	brlz,a,pt	%8,<label_0xa0001>
	.word 0x8143c000  ! 831: STBAR	stbar
	.word 0xe06a800b  ! 832: LDSTUB_R	ldstub	%r16, [%r10 + %r11]
	.word 0xc36a800b  ! 833: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0xc7e2900b  ! 835: CASA_I	casa	[%r10] 0x80, %r11, %r3
	.word 0xcecaae9c  ! 836: LDSBA_I	ldsba	[%r10, + 0x0e9c] %asi, %r7
	.word 0x927aa52c  ! 837: SDIV_I	sdiv 	%r10, 0x052c, %r9
	.word 0xafa289ab  ! 838: FDIVs	fdivs	%f10, %f11, %f23
	.word 0xc25a800b  ! 839: LDX_R	ldx	[%r10 + %r11], %r1
	.word 0xca4a800b  ! 840: LDSB_R	ldsb	[%r10 + %r11], %r5
	.word 0x2ac20001  ! 841: BRNZ	brnz,a,nt	%8,<label_0x20001>
	.word 0xe922800b  ! 842: STF_R	st	%f20, [%r11, %r10]
	.word 0x8bdaaf64  ! 843: FLUSH_I	dis not found

	.word 0x8652a448  ! 844: UMUL_I	umul 	%r10, 0x0448, %r3
	.word 0x8143e034  ! 845: MEMBAR	membar	#LoadStore | #Lookaside | #MemIssue 
	.word 0xb87a800b  ! 846: SDIV_R	sdiv 	%r10, %r11, %r28
	.word 0x3c800001  ! 847: BPOS	bpos,a	<label_0x1>
	.word 0xf89aa9e0  ! 848: LDDA_I	ldda	[%r10, + 0x09e0] %asi, %r28
	.word 0xa0da800b  ! 849: SMULcc_R	smulcc 	%r10, %r11, %r16
	.word 0x88daaf90  ! 850: SMULcc_I	smulcc 	%r10, 0x0f90, %r4
	.word 0xe092a83c  ! 851: LDUHA_I	lduha	[%r10, + 0x083c] %asi, %r16
	.word 0xc36aab24  ! 852: PREFETCH_I	prefetch	[%r10 + 0x0b24], #one_read
	.word 0x9ba2892b  ! 853: FMULs	fmuls	%f10, %f11, %f13
	.word 0xeb3a800b  ! 854: STDF_R	std	%f21, [%r11, %r10]
	.word 0xc41a800b  ! 855: LDD_R	ldd	[%r10 + %r11], %r2
	.word 0x93a288ab  ! 856: FSUBs	fsubs	%f10, %f11, %f9
	.word 0xc612800b  ! 857: LDUH_R	lduh	[%r10 + %r11], %r3
	.word 0x10800003  ! 858: BA	ba  	<label_0x3>
	.word 0x1a800001  ! 859: BCC	bcc  	<label_0x1>
	.word 0xce92900b  ! 860: LDUHA_R	lduha	[%r10, %r11] 0x80, %r7
	.word 0xc4b2900b  ! 861: STHA_R	stha	%r2, [%r10 + %r11] 0x80
	.word 0x8143e00f  ! 862: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore 
	.word 0x8143c000  ! 863: STBAR	stbar
	.word 0xc412800b  ! 864: LDUH_R	lduh	[%r10 + %r11], %r2
	.word 0xd2ea900b  ! 865: LDSTUBA_R	ldstuba	%r9, [%r10 + %r11] 0x80
	.word 0x8d6a800b  ! 866: SDIVX_R	sdivx	%r10, %r11, %r6
	.word 0xa9daa024  ! 867: FLUSH_I	dis not found

	.word 0xfc5aaea0  ! 868: LDX_I	ldx	[%r10 + 0x0ea0], %r30
	.word 0xfc9aade0  ! 869: LDDA_I	ldda	[%r10, + 0x0de0] %asi, %r30
	.word 0xd2f2ab10  ! 870: STXA_I	stxa	%r9, [%r10 + 0x0b10] %asi
	.word 0x8eda800b  ! 871: SMULcc_R	smulcc 	%r10, %r11, %r7
	.word 0x84f2ac04  ! 872: UDIVcc_I	udivcc 	%r10, 0x0c04, %r2
	.word 0x9122a184  ! 873: MULScc_I	mulscc 	%r10, 0x0184, %r8
	.word 0x87a289ab  ! 874: FDIVs	fdivs	%f10, %f11, %f3
	.word 0xe802a004  ! 875: LDUW_I	lduw	[%r10 + 0x0004], %r20
	.word 0xeaea900b  ! 876: LDSTUBA_R	ldstuba	%r21, [%r10 + %r11] 0x80
	.word 0xbe52800b  ! 877: UMUL_R	umul 	%r10, %r11, %r31
	.word 0xd27aaaf0  ! 878: SWAP_I	swap	%r9, [%r10 + 0x0af0]
	.word 0x1c800001  ! 879: BPOS	bpos  	<label_0x1>
	.word 0x85daa5d4  ! 880: FLUSH_I	dis not found

	.word 0xcea2a000  ! 881: STWA_I	stwa	%r7, [%r10 + 0x0000] %asi
	.word 0xc36aa94c  ! 882: PREFETCH_I	prefetch	[%r10 + 0x094c], #one_read
	.word 0xf322a658  ! 883: STF_I	st	%f25, [0x0658, %r10]
	.word 0x93da800b  ! 884: FLUSH_R	dis not found

	.word 0x85a2892b  ! 886: FMULs	fmuls	%f10, %f11, %f2
	.word 0x8722a238  ! 887: MULScc_I	mulscc 	%r10, 0x0238, %r3
	.word 0xd0f2900b  ! 888: STXA_R	stxa	%r8, [%r10 + %r11] 0x80
	.word 0xc88a900b  ! 890: LDUBA_R	lduba	[%r10, %r11] 0x80, %r4
	.word 0xde4aaf34  ! 891: LDSB_I	ldsb	[%r10 + 0x0f34], %r15
	.word 0x24c20001  ! 893: BRLEZ	brlez,a,nt	%8,<label_0x20001>
	.word 0x34800003  ! 894: BG	bg,a	<label_0x3>
	.word 0x24800003  ! 895: BLE	ble,a	<label_0x3>
	.word 0xcc8a900b  ! 897: LDUBA_R	lduba	[%r10, %r11] 0x80, %r6
	.word 0x866aafc4  ! 898: UDIVX_I	udivx 	%r10, 0x0fc4, %r3
	.word 0xc3eaad20  ! 899: PREFETCHA_I	prefetcha	[%r10, + 0x0d20] %asi, #one_read
	.word 0xe002aa00  ! 900: LDUW_I	lduw	[%r10 + 0x0a00], %r16
	.word 0xb052800b  ! 901: UMUL_R	umul 	%r10, %r11, %r24
	.word 0x84daae3c  ! 902: SMULcc_I	smulcc 	%r10, 0x0e3c, %r2
	.word 0xbf6aa448  ! 903: SDIVX_I	sdivx	%r10, 0x0448, %r31
	.word 0x8143c000  ! 904: STBAR	stbar
	.word 0x8143e042  ! 905: MEMBAR	membar	#StoreLoad | #Sync 
	.word 0x0eca0001  ! 906: BRGEZ	brgez  ,pt	%8,<label_0xa0001>
	.word 0xb25a800b  ! 907: SMUL_R	smul 	%r10, %r11, %r25
	.word 0xe09aa880  ! 908: LDDA_I	ldda	[%r10, + 0x0880] %asi, %r16
	.word 0xc8a2900b  ! 909: STWA_R	stwa	%r4, [%r10 + %r11] 0x80
	.word 0x10800003  ! 910: BA	ba  	<label_0x3>
	.word 0x8d6a800b  ! 911: SDIVX_R	sdivx	%r10, %r11, %r6
	.word 0x846a800b  ! 912: UDIVX_R	udivx 	%r10, %r11, %r2
	.word 0x8922a6e0  ! 913: MULScc_I	mulscc 	%r10, 0x06e0, %r4
	.word 0xb66a800b  ! 914: UDIVX_R	udivx 	%r10, %r11, %r27
	.word 0x8fdaaabc  ! 915: FLUSH_I	dis not found

	.word 0xd24a800b  ! 916: LDSB_R	ldsb	[%r10 + %r11], %r9
	.word 0x2c800001  ! 917: BNEG	bneg,a	<label_0x1>
	.word 0xabdaaec8  ! 918: FLUSH_I	dis not found

	.word 0xeb3a800b  ! 919: STDF_R	std	%f21, [%r11, %r10]
	.word 0x85daa3a0  ! 920: FLUSH_I	dis not found

	.word 0x9ddaa1cc  ! 921: FLUSH_I	dis not found

	.word 0xc3ea900b  ! 922: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0x12800001  ! 923: BNE	bne  	<label_0x1>
	.word 0xda12800b  ! 924: LDUH_R	lduh	[%r10 + %r11], %r13
	.word 0x9f22800b  ! 925: MULScc_R	mulscc 	%r10, %r11, %r15
	.word 0xd0aa900b  ! 926: STBA_R	stba	%r8, [%r10 + %r11] 0x80
	.word 0x93da800b  ! 927: FLUSH_R	dis not found

	.word 0x8e72ab30  ! 928: UDIV_I	udiv 	%r10, 0x0b30, %r7
	.word 0x8143c000  ! 929: STBAR	stbar
	.word 0xca52800b  ! 930: LDSH_R	ldsh	[%r10 + %r11], %r5
	.word 0xcefa900b  ! 931: SWAPA_R	swapa	%r7, [%r10 + %r11] 0x80
	.word 0x8cf2800b  ! 933: UDIVcc_R	udivcc 	%r10, %r11, %r6
	.word 0x9ddaad50  ! 934: FLUSH_I	dis not found

	.word 0xc4c2900b  ! 935: LDSWA_R	ldswa	[%r10, %r11] 0x80, %r2
	.word 0xd2aa900b  ! 936: STBA_R	stba	%r9, [%r10 + %r11] 0x80
	.word 0x8143e046  ! 937: MEMBAR	membar	#StoreLoad | #LoadStore | #Sync 
	.word 0xc36aa698  ! 938: PREFETCH_I	prefetch	[%r10 + 0x0698], #one_read
	.word 0xcaca900b  ! 939: LDSBA_R	ldsba	[%r10, %r11] 0x80, %r5
	.word 0xd89a900b  ! 941: LDDA_R	ldda	[%r10, %r11] 0x80, %r12
	.word 0xc812800b  ! 942: LDUH_R	lduh	[%r10 + %r11], %r4
	.word 0xfcc2a2c0  ! 943: LDSWA_I	ldswa	[%r10, + 0x02c0] %asi, %r30
	.word 0xb1daa458  ! 944: FLUSH_I	dis not found

	.word 0x8a72800b  ! 945: UDIV_R	udiv 	%r10, %r11, %r5
	.word 0xd0ba900b  ! 946: STDA_R	stda	%r8, [%r10 + %r11] 0x80
	.word 0xc41aa100  ! 947: LDD_I	ldd	[%r10 + 0x0100], %r2
	.word 0x20800001  ! 948: BN	bn,a	<label_0x1>
	.word 0x86f2800b  ! 949: UDIVcc_R	udivcc 	%r10, %r11, %r3
	.word 0x845a800b  ! 950: SMUL_R	smul 	%r10, %r11, %r2
	.word 0x8143c000  ! 951: STBAR	stbar
	.word 0xc3eaae5c  ! 952: PREFETCHA_I	prefetcha	[%r10, + 0x0e5c] %asi, #one_read
	.word 0xa36a800b  ! 953: SDIVX_R	sdivx	%r10, %r11, %r17
	.word 0xbd22a284  ! 954: MULScc_I	mulscc 	%r10, 0x0284, %r30
	.word 0xe07a800b  ! 955: SWAP_R	swap	%r16, [%r10 + %r11]
	.word 0xcc82a190  ! 956: LDUWA_I	lduwa	[%r10, + 0x0190] %asi, %r6
	.word 0xba6aaa7c  ! 957: UDIVX_I	udivx 	%r10, 0x0a7c, %r29
	.word 0x82da800b  ! 958: SMULcc_R	smulcc 	%r10, %r11, %r1
	.word 0x8da2882b  ! 959: FADDs	fadds	%f10, %f11, %f6
	.word 0xa05a800b  ! 960: SMUL_R	smul 	%r10, %r11, %r16
	.word 0xdab2900b  ! 961: STHA_R	stha	%r13, [%r10 + %r11] 0x80
	.word 0x88d2a8ac  ! 962: UMULcc_I	umulcc 	%r10, 0x08ac, %r4
	.word 0x8143e07d  ! 963: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0x93da800b  ! 964: FLUSH_R	dis not found

	.word 0x8a72800b  ! 965: UDIV_R	udiv 	%r10, %r11, %r5
	.word 0x8143c000  ! 966: STBAR	stbar
	.word 0x876aa0e0  ! 967: SDIVX_I	sdivx	%r10, 0x00e0, %r3
	.word 0x8143c000  ! 968: STBAR	stbar
	.word 0x8272800b  ! 969: UDIV_R	udiv 	%r10, %r11, %r1
	.word 0xc44aa84c  ! 970: LDSB_I	ldsb	[%r10 + 0x084c], %r2
	.word 0xc3eaa9d8  ! 971: PREFETCHA_I	prefetcha	[%r10, + 0x09d8] %asi, #one_read
	.word 0x91a2882b  ! 972: FADDs	fadds	%f10, %f11, %f8
	.word 0xd092a118  ! 973: LDUHA_I	lduha	[%r10, + 0x0118] %asi, %r8
	.word 0xf412ab00  ! 974: LDUH_I	lduh	[%r10 + 0x0b00], %r26
	.word 0xa8daa3a8  ! 975: SMULcc_I	smulcc 	%r10, 0x03a8, %r20
	.word 0xc4aa900b  ! 976: STBA_R	stba	%r2, [%r10 + %r11] 0x80
	.word 0xe4fa900b  ! 977: SWAPA_R	swapa	%r18, [%r10 + %r11] 0x80
	.word 0xc8baa998  ! 978: STDA_I	stda	%r4, [%r10 + 0x0998] %asi
	.word 0x82da800b  ! 979: SMULcc_R	smulcc 	%r10, %r11, %r1
	.word 0xf722800b  ! 980: STF_R	st	%f27, [%r11, %r10]
	.word 0xc4fa900b  ! 981: SWAPA_R	swapa	%r2, [%r10 + %r11] 0x80
	.word 0x83a2892b  ! 982: FMULs	fmuls	%f10, %f11, %f1
	.word 0xc3eaabb4  ! 983: PREFETCHA_I	prefetcha	[%r10, + 0x0bb4] %asi, #one_read
	.word 0x0c800001  ! 984: BNEG	bneg  	<label_0x1>
	.word 0xc85aad70  ! 985: LDX_I	ldx	[%r10 + 0x0d70], %r4
	.word 0x8143c000  ! 986: STBAR	stbar
	.word 0xcb3aad00  ! 987: STDF_I	std	%f5, [0x0d00, %r10]
	.word 0xb5da800b  ! 988: FLUSH_R	dis not found

	.word 0xdcbaaa98  ! 989: STDA_I	stda	%r14, [%r10 + 0x0a98] %asi
	.word 0x91da800b  ! 990: FLUSH_R	dis not found

	.word 0xb1daab0c  ! 991: FLUSH_I	dis not found

	.word 0xccea900b  ! 992: LDSTUBA_R	ldstuba	%r6, [%r10 + %r11] 0x80
	.word 0xc882900b  ! 993: LDUWA_R	lduwa	[%r10, %r11] 0x80, %r4
	.word 0xe8ca900b  ! 994: LDSBA_R	ldsba	[%r10, %r11] 0x80, %r20
	.word 0xc3eaae78  ! 995: PREFETCHA_I	prefetcha	[%r10, + 0x0e78] %asi, #one_read
	.word 0xf8b2900b  ! 996: STHA_R	stha	%r28, [%r10 + %r11] 0x80
	.word 0xc53a800b  ! 997: STDF_R	std	%f2, [%r11, %r10]
	.word 0x06c20003  ! 998: BRLZ	brlz  ,nt	%8,<label_0x20003>
	.word 0xca82a5e8  ! 999: LDUWA_I	lduwa	[%r10, + 0x05e8] %asi, %r5
	nop
	nop
	nop
        ta      T_GOOD_TRAP
th_main_1:
        setx  MAIN_BASE_DATA_VA, %r1, %r10
        setx  0x0000000000000dd0, %g1, %r11
        setx  0x80, %g2, %g1
        wr  %g1, %g0, %asi
	    rd %fprs, %g1
        wr %g1, 0x4, %fprs
	ldd	[%r10 + 0], %f0
	ldd	[%r10 + 8], %f2
	ldd	[%r10 + 16], %f4
	ldd	[%r10 + 24], %f6
	ldd	[%r10 + 32], %f8
	ldd	[%r10 + 40], %f10
	ldd	[%r10 + 48], %f12
	ldd	[%r10 + 56], %f14
	ldd	[%r10 + 64], %f16
	ldd	[%r10 + 72], %f18
	ldd	[%r10 + 80], %f20
	ldd	[%r10 + 88], %f22
	ldd	[%r10 + 96], %f24
	ldd	[%r10 + 104], %f26
	ldd	[%r10 + 112], %f28
	ldd	[%r10 + 120], %f30
	ldd	[%r10 + 128], %f32
	ldd	[%r10 + 136], %f34
	ldd	[%r10 + 144], %f36
	ldd	[%r10 + 152], %f38
	ldd	[%r10 + 160], %f40
	ldd	[%r10 + 168], %f42
	ldd	[%r10 + 176], %f44
	ldd	[%r10 + 184], %f46
	ldd	[%r10 + 192], %f48
	ldd	[%r10 + 200], %f50
	ldd	[%r10 + 208], %f52
	ldd	[%r10 + 216], %f54
	ldd	[%r10 + 224], %f56
	ldd	[%r10 + 232], %f58
	ldd	[%r10 + 240], %f60
	ldd	[%r10 + 248], %f62
        setx  0x2cc3ca1e8a31ceee, %g1, %r0
        setx  0x60d0aed2c84f4f29, %g1, %r1
        setx  0x5f39ac28611f3b44, %g1, %r2
        setx  0x0a8b81462c50f867, %g1, %r3
        setx  0x6ee6fdbf856f5d9e, %g1, %r4
        setx  0x66b2464b11825a33, %g1, %r5
        setx  0x329911b352b7c1a3, %g1, %r6
        setx  0xf2723ec3e74d7d37, %g1, %r7
        setx  0x0281b86feb7c74d1, %g1, %r8
        setx  0xc836a16b60e1ac43, %g1, %r9
        setx  0x58350b4c34d88bac, %g1, %r12
        setx  0xc05ddb8840e2c39c, %g1, %r13
        setx  0x282bef1c0a8b8c54, %g1, %r14
        setx  0xb29397aaf0b53cca, %g1, %r15
        setx  0x190ea253b422d126, %g1, %r16
        setx  0x50e7f316effa1681, %g1, %r17
        setx  0x25a3a7eede236cfe, %g1, %r18
        setx  0x1267be4fae4348ab, %g1, %r19
        setx  0x7e2623cf81ce7518, %g1, %r20
        setx  0xe59a3b999c5ca39d, %g1, %r21
        setx  0x16ba08d64e26dc0c, %g1, %r22
        setx  0x4c5e005de7a3a0a1, %g1, %r23
        setx  0xa5b5a81f50a947b1, %g1, %r24
        setx  0xdf561a45a722106d, %g1, %r25
        setx  0xf52ed96aeb751d6d, %g1, %r26
        setx  0x7c8fbabefd070ab2, %g1, %r27
        setx  0xff15e25dbe91b803, %g1, %r28
        setx  0x67c505196e1e5257, %g1, %r29
        setx  0xbaa7f18456f8cedf, %g1, %r30
        setx  0x12a08c2c3fc82dd1, %g1, %r31
	.word 0x8143e03e  ! 6: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0xccb2900b  ! 7: STHA_R	stha	%r6, [%r10 + %r11] 0x80
	.word 0x8472a260  ! 9: UDIV_I	udiv 	%r10, 0x0260, %r2
	.word 0xd33a800b  ! 11: STDF_R	std	%f9, [%r11, %r10]
	.word 0xe53aab70  ! 12: STDF_I	std	%f18, [0x0b70, %r10]
	.word 0x8a52ac58  ! 13: UMUL_I	umul 	%r10, 0x0c58, %r5
	.word 0xc452a350  ! 14: LDSH_I	ldsh	[%r10 + 0x0350], %r2
	.word 0xcc9aae40  ! 15: LDDA_I	ldda	[%r10, + 0x0e40] %asi, %r6
	.word 0xe01aab50  ! 17: LDD_I	ldd	[%r10 + 0x0b50], %r16
	.word 0x89a2882b  ! 18: FADDs	fadds	%f10, %f11, %f4
	.word 0xd122800b  ! 19: STF_R	st	%f8, [%r11, %r10]
	.word 0xc36aa640  ! 20: PREFETCH_I	prefetch	[%r10 + 0x0640], #one_read
	.word 0x8c72800b  ! 21: UDIV_R	udiv 	%r10, %r11, %r6
	.word 0xfa7aabbc  ! 22: SWAP_I	swap	%r29, [%r10 + 0x0bbc]
	.word 0xe33aadc0  ! 23: STDF_I	std	%f17, [0x0dc0, %r10]
	.word 0xdaaa900b  ! 24: STBA_R	stba	%r13, [%r10 + %r11] 0x80
	.word 0xc842800b  ! 25: LDSW_R	ldsw	[%r10 + %r11], %r4
	.word 0x0ec20003  ! 27: BRGEZ	brgez  ,nt	%8,<label_0x20003>
	.word 0xceca900b  ! 28: LDSBA_R	ldsba	[%r10, %r11] 0x80, %r7
	.word 0xd0f2a2b0  ! 29: STXA_I	stxa	%r8, [%r10 + 0x02b0] %asi
	.word 0x90d2a584  ! 30: UMULcc_I	umulcc 	%r10, 0x0584, %r8
	.word 0xcacaa848  ! 31: LDSBA_I	ldsba	[%r10, + 0x0848] %asi, %r5
	.word 0xe4ba900b  ! 32: STDA_R	stda	%r18, [%r10 + %r11] 0x80
	.word 0xcb22a848  ! 33: STF_I	st	%f5, [0x0848, %r10]
	.word 0xadda800b  ! 34: FLUSH_R	dis not found

	.word 0xc6da900b  ! 35: LDXA_R	ldxa	[%r10, %r11] 0x80, %r3
	.word 0xce92a8d0  ! 36: LDUHA_I	lduha	[%r10, + 0x08d0] %asi, %r7
	.word 0xac5aadc8  ! 37: SMUL_I	smul 	%r10, 0x0dc8, %r22
	.word 0x2c800001  ! 38: BNEG	bneg,a	<label_0x1>
	.word 0xc6aa900b  ! 39: STBA_R	stba	%r3, [%r10 + %r11] 0x80
	.word 0x83da800b  ! 40: FLUSH_R	dis not found

	.word 0xa26aaa94  ! 41: UDIVX_I	udivx 	%r10, 0x0a94, %r17
	.word 0x04ca0001  ! 42: BRLEZ	brlez  ,pt	%8,<label_0xa0001>
	.word 0x92daa25c  ! 43: SMULcc_I	smulcc 	%r10, 0x025c, %r9
	.word 0xc6fa900b  ! 44: SWAPA_R	swapa	%r3, [%r10 + %r11] 0x80
	.word 0xd00a800b  ! 45: LDUB_R	ldub	[%r10 + %r11], %r8
	.word 0xcceaa5e8  ! 46: LDSTUBA_I	ldstuba	%r6, [%r10 + 0x05e8] %asi
	.word 0xa1da800b  ! 47: FLUSH_R	dis not found

	.word 0xbe52a58c  ! 48: UMUL_I	umul 	%r10, 0x058c, %r31
	.word 0xbc4aad90  ! 49: MULX_I	mulx 	%r10, 0x0d90, %r30
	.word 0xc722a430  ! 50: STF_I	st	%f3, [0x0430, %r10]
	.word 0xd0aa900b  ! 51: STBA_R	stba	%r8, [%r10 + %r11] 0x80
	.word 0xcafa900b  ! 52: SWAPA_R	swapa	%r5, [%r10 + %r11] 0x80
	.word 0xd01aa598  ! 53: LDD_I	ldd	[%r10 + 0x0598], %r8
	.word 0xc36a800b  ! 54: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x8143e025  ! 55: MEMBAR	membar	#LoadLoad | #LoadStore | #MemIssue 
	.word 0xc6daa940  ! 56: LDXA_I	ldxa	[%r10, + 0x0940] %asi, %r3
	.word 0xc2ea900b  ! 57: LDSTUBA_R	ldstuba	%r1, [%r10 + %r11] 0x80
	.word 0xcbf2a00b  ! 58: CASXA_R	casxa	[%r10]%asi, %r11, %r5
	.word 0x8bdaae40  ! 59: FLUSH_I	dis not found

	.word 0xf8f2900b  ! 60: STXA_R	stxa	%r28, [%r10 + %r11] 0x80
	.word 0x8143e00c  ! 61: MEMBAR	membar	#LoadStore | #StoreStore 
	.word 0xd0faa730  ! 62: SWAPA_I	swapa	%r8, [%r10 + 0x0730] %asi
	.word 0xd212a614  ! 63: LDUH_I	lduh	[%r10 + 0x0614], %r9
	.word 0x8143c000  ! 64: STBAR	stbar
	.word 0xda42aec0  ! 65: LDSW_I	ldsw	[%r10 + 0x0ec0], %r13
	.word 0xae4aa108  ! 66: MULX_I	mulx 	%r10, 0x0108, %r23
	.word 0xe1e2900b  ! 67: CASA_I	casa	[%r10] 0x80, %r11, %r16
	.word 0xc36a800b  ! 68: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x82d2a4a0  ! 69: UMULcc_I	umulcc 	%r10, 0x04a0, %r1
	.word 0xc2fa900b  ! 70: SWAPA_R	swapa	%r1, [%r10 + %r11] 0x80
	.word 0xe522800b  ! 71: STF_R	st	%f18, [%r11, %r10]
	.word 0x8ada800b  ! 72: SMULcc_R	smulcc 	%r10, %r11, %r5
	.word 0xe442800b  ! 73: LDSW_R	ldsw	[%r10 + %r11], %r18
	.word 0xcd22800b  ! 74: STF_R	st	%f6, [%r11, %r10]
	.word 0xcedaa1e0  ! 75: LDXA_I	ldxa	[%r10, + 0x01e0] %asi, %r7
	.word 0x8143c000  ! 76: STBAR	stbar
	.word 0xbbdaa8c4  ! 77: FLUSH_I	dis not found

	.word 0x93a2892b  ! 78: FMULs	fmuls	%f10, %f11, %f9
	.word 0xcc0aa514  ! 79: LDUB_I	ldub	[%r10 + 0x0514], %r6
	.word 0xc3eaa554  ! 80: PREFETCHA_I	prefetcha	[%r10, + 0x0554] %asi, #one_read
	.word 0x916a800b  ! 81: SDIVX_R	sdivx	%r10, %r11, %r8
	.word 0xf012a6cc  ! 82: LDUH_I	lduh	[%r10 + 0x06cc], %r24
	.word 0xc20aa3c0  ! 83: LDUB_I	ldub	[%r10 + 0x03c0], %r1
	.word 0xc26a800b  ! 84: LDSTUB_R	ldstub	%r1, [%r10 + %r11]
	.word 0xe292900b  ! 86: LDUHA_R	lduha	[%r10, %r11] 0x80, %r17
	.word 0xe642800b  ! 87: LDSW_R	ldsw	[%r10 + %r11], %r19
	.word 0x8143c000  ! 88: STBAR	stbar
	.word 0xd09a900b  ! 89: LDDA_R	ldda	[%r10, %r11] 0x80, %r8
	.word 0xd01aa218  ! 90: LDD_I	ldd	[%r10 + 0x0218], %r8
	.word 0xc5e2900b  ! 91: CASA_I	casa	[%r10] 0x80, %r11, %r2
	.word 0xdc0a800b  ! 92: LDUB_R	ldub	[%r10 + %r11], %r14
	.word 0xc36a800b  ! 93: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x8dda800b  ! 94: FLUSH_R	dis not found

	.word 0xcb22ae6c  ! 95: STF_I	st	%f5, [0x0e6c, %r10]
	.word 0x24800001  ! 96: BLE	ble,a	<label_0x1>
	.word 0xf4d2900b  ! 97: LDSHA_R	ldsha	[%r10, %r11] 0x80, %r26
	.word 0xd8ba900b  ! 98: STDA_R	stda	%r12, [%r10 + %r11] 0x80
	.word 0x2c800001  ! 99: BNEG	bneg,a	<label_0x1>
	.word 0x8143e057  ! 100: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside | #Sync 
	.word 0x28800001  ! 101: BLEU	bleu,a	<label_0x1>
	.word 0x86da800b  ! 103: SMULcc_R	smulcc 	%r10, %r11, %r3
	.word 0x924a800b  ! 104: MULX_R	mulx 	%r10, %r11, %r9
	.word 0xb5da800b  ! 105: FLUSH_R	dis not found

	.word 0x1c800003  ! 106: BPOS	bpos  	<label_0x3>
	.word 0x8143e041  ! 107: MEMBAR	membar	#LoadLoad | #Sync 
	.word 0x85da800b  ! 108: FLUSH_R	dis not found

	.word 0x00800003  ! 109: BN	bn  	<label_0x3>
	.word 0xb3da800b  ! 110: FLUSH_R	dis not found

	.word 0x836aaf70  ! 111: SDIVX_I	sdivx	%r10, 0x0f70, %r1
	.word 0xbbda800b  ! 112: FLUSH_R	dis not found

	.word 0xc36aae50  ! 113: PREFETCH_I	prefetch	[%r10 + 0x0e50], #one_read
	.word 0xc4baa130  ! 114: STDA_I	stda	%r2, [%r10 + 0x0130] %asi
	.word 0xce92a918  ! 115: LDUHA_I	lduha	[%r10, + 0x0918] %asi, %r7
	.word 0xaddaa2b8  ! 116: FLUSH_I	dis not found

	.word 0xcdf2900b  ! 117: CASXA_I	casxa	[%r10] 0x80, %r11, %r6
	.word 0x927a800b  ! 118: SDIV_R	sdiv 	%r10, %r11, %r9
	.word 0x8afa800b  ! 119: SDIVcc_R	sdivcc 	%r10, %r11, %r5
	.word 0xf522800b  ! 120: STF_R	st	%f26, [%r11, %r10]
	.word 0xab6a800b  ! 121: SDIVX_R	sdivx	%r10, %r11, %r21
	.word 0xb1a289ab  ! 122: FDIVs	fdivs	%f10, %f11, %f24
	.word 0x36800001  ! 123: BGE	bge,a	<label_0x1>
	.word 0x91daac1c  ! 124: FLUSH_I	dis not found

	.word 0xf4aaaf18  ! 125: STBA_I	stba	%r26, [%r10 + 0x0f18] %asi
	.word 0xc3eaae44  ! 126: PREFETCHA_I	prefetcha	[%r10, + 0x0e44] %asi, #one_read
	.word 0xc292900b  ! 128: LDUHA_R	lduha	[%r10, %r11] 0x80, %r1
	.word 0x90f2800b  ! 129: UDIVcc_R	udivcc 	%r10, %r11, %r8
	.word 0xa46aa06c  ! 130: UDIVX_I	udivx 	%r10, 0x006c, %r18
	.word 0x93da800b  ! 131: FLUSH_R	dis not found

	.word 0xe08a900b  ! 132: LDUBA_R	lduba	[%r10, %r11] 0x80, %r16
	.word 0x10800003  ! 133: BA	ba  	<label_0x3>
	.word 0x8472a2f4  ! 134: UDIV_I	udiv 	%r10, 0x02f4, %r2
	.word 0x8522a6d8  ! 135: MULScc_I	mulscc 	%r10, 0x06d8, %r2
	.word 0xccf2900b  ! 136: STXA_R	stxa	%r6, [%r10 + %r11] 0x80
	.word 0xcc42800b  ! 137: LDSW_R	ldsw	[%r10 + %r11], %r6
	.word 0x82f2800b  ! 138: UDIVcc_R	udivcc 	%r10, %r11, %r1
	.word 0xb3daa9cc  ! 139: FLUSH_I	dis not found

	.word 0xc9f2900b  ! 140: CASXA_I	casxa	[%r10] 0x80, %r11, %r4
	.word 0xa1a288ab  ! 141: FSUBs	fsubs	%f10, %f11, %f16
	.word 0xcc82900b  ! 142: LDUWA_R	lduwa	[%r10, %r11] 0x80, %r6
	.word 0x93a2882b  ! 143: FADDs	fadds	%f10, %f11, %f9
	.word 0xce52800b  ! 144: LDSH_R	ldsh	[%r10 + %r11], %r7
	.word 0x8143c000  ! 145: STBAR	stbar
	.word 0xd122800b  ! 146: STF_R	st	%f8, [%r11, %r10]
	.word 0xf81a800b  ! 147: LDD_R	ldd	[%r10 + %r11], %r28
	.word 0xc6c2900b  ! 148: LDSWA_R	ldswa	[%r10, %r11] 0x80, %r3
	.word 0x08800001  ! 149: BLEU	bleu  	<label_0x1>
	.word 0xbbda800b  ! 150: FLUSH_R	dis not found

	.word 0x864a800b  ! 151: MULX_R	mulx 	%r10, %r11, %r3
	.word 0x8ba2892b  ! 152: FMULs	fmuls	%f10, %f11, %f5
	.word 0xc33a800b  ! 153: STDF_R	std	%f1, [%r11, %r10]
	.word 0x8143e018  ! 154: MEMBAR	membar	#StoreStore | #Lookaside 
	.word 0x8c52800b  ! 155: UMUL_R	umul 	%r10, %r11, %r6
	.word 0xcad2900b  ! 156: LDSHA_R	ldsha	[%r10, %r11] 0x80, %r5
	.word 0x8efa800b  ! 157: SDIVcc_R	sdivcc 	%r10, %r11, %r7
	.word 0xc2c2900b  ! 158: LDSWA_R	ldswa	[%r10, %r11] 0x80, %r1
	.word 0xc36a800b  ! 159: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x24800001  ! 160: BLE	ble,a	<label_0x1>
	.word 0xaa7a800b  ! 161: SDIV_R	sdiv 	%r10, %r11, %r21
	.word 0x9922a380  ! 162: MULScc_I	mulscc 	%r10, 0x0380, %r12
	.word 0x8fda800b  ! 163: FLUSH_R	dis not found

	.word 0xa9da800b  ! 164: FLUSH_R	dis not found

	.word 0xcc6aa97c  ! 165: LDSTUB_I	ldstub	%r6, [%r10 + 0x097c]
	.word 0xca42a208  ! 166: LDSW_I	ldsw	[%r10 + 0x0208], %r5
	.word 0x26c20001  ! 167: BRLZ	brlz,a,nt	%8,<label_0x20001>
	.word 0xed3aafb0  ! 168: STDF_I	std	%f22, [0x0fb0, %r10]
	.word 0xbddaae54  ! 169: FLUSH_I	dis not found

	.word 0x22ca0001  ! 170: BRZ	brz,a,pt	%8,<label_0xa0001>
	.word 0xc652a550  ! 171: LDSH_I	ldsh	[%r10 + 0x0550], %r3
	.word 0xc4fa900b  ! 172: SWAPA_R	swapa	%r2, [%r10 + %r11] 0x80
	.word 0x0c800001  ! 173: BNEG	bneg  	<label_0x1>
	.word 0xf212800b  ! 174: LDUH_R	lduh	[%r10 + %r11], %r25
	.word 0xc2a2af80  ! 175: STWA_I	stwa	%r1, [%r10 + 0x0f80] %asi
	.word 0xc3ea900b  ! 176: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0x24c20001  ! 177: BRLEZ	brlez,a,nt	%8,<label_0x20001>
	.word 0xce7a800b  ! 178: SWAP_R	swap	%r7, [%r10 + %r11]
	.word 0xdc7a800b  ! 179: SWAP_R	swap	%r14, [%r10 + %r11]
	.word 0x884a800b  ! 180: MULX_R	mulx 	%r10, %r11, %r4
	.word 0xa07aa5b0  ! 181: SDIV_I	sdiv 	%r10, 0x05b0, %r16
	.word 0xfb3aa8d0  ! 182: STDF_I	std	%f29, [0x08d0, %r10]
	.word 0xf0ba900b  ! 183: STDA_R	stda	%r24, [%r10 + %r11] 0x80
	.word 0xe6aa900b  ! 184: STBA_R	stba	%r19, [%r10 + %r11] 0x80
	.word 0xe1f2a00b  ! 186: CASXA_R	casxa	[%r10]%asi, %r11, %r16
	.word 0x02c20003  ! 187: BRZ	brz  ,nt	%8,<label_0x20003>
	.word 0x8fda800b  ! 188: FLUSH_R	dis not found

	.word 0x82da800b  ! 189: SMULcc_R	smulcc 	%r10, %r11, %r1
	.word 0xed22a6ac  ! 190: STF_I	st	%f22, [0x06ac, %r10]
	.word 0xeed2a720  ! 191: LDSHA_I	ldsha	[%r10, + 0x0720] %asi, %r23
	.word 0xd2f2900b  ! 192: STXA_R	stxa	%r9, [%r10 + %r11] 0x80
	.word 0x9a6a800b  ! 193: UDIVX_R	udivx 	%r10, %r11, %r13
	.word 0xca4a800b  ! 194: LDSB_R	ldsb	[%r10 + %r11], %r5
	.word 0xcde2900b  ! 195: CASA_I	casa	[%r10] 0x80, %r11, %r6
	.word 0x8143c000  ! 196: STBAR	stbar
	.word 0xce5a800b  ! 197: LDX_R	ldx	[%r10 + %r11], %r7
	.word 0xced2ac80  ! 198: LDSHA_I	ldsha	[%r10, + 0x0c80] %asi, %r7
	.word 0xce8aa200  ! 199: LDUBA_I	lduba	[%r10, + 0x0200] %asi, %r7
	.word 0x34800003  ! 200: BG	bg,a	<label_0x3>
	.word 0xfcaa900b  ! 201: STBA_R	stba	%r30, [%r10 + %r11] 0x80
	.word 0xcfe2900b  ! 202: CASA_I	casa	[%r10] 0x80, %r11, %r7
	.word 0xb7daab7c  ! 203: FLUSH_I	dis not found

	.word 0xd0c2900b  ! 204: LDSWA_R	ldswa	[%r10, %r11] 0x80, %r8
	.word 0xd0aaa8ec  ! 205: STBA_I	stba	%r8, [%r10 + 0x08ec] %asi
	.word 0xc3ea900b  ! 206: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0x9f22ae30  ! 208: MULScc_I	mulscc 	%r10, 0x0e30, %r15
	.word 0xc47a800b  ! 209: SWAP_R	swap	%r2, [%r10 + %r11]
	.word 0xf8d2a428  ! 210: LDSHA_I	ldsha	[%r10, + 0x0428] %asi, %r28
	.word 0xced2a0f4  ! 211: LDSHA_I	ldsha	[%r10, + 0x00f4] %asi, %r7
	.word 0xf0baa600  ! 212: STDA_I	stda	%r24, [%r10 + 0x0600] %asi
	.word 0xc24aab94  ! 213: LDSB_I	ldsb	[%r10 + 0x0b94], %r1
	.word 0x8143e00a  ! 214: MEMBAR	membar	#StoreLoad | #StoreStore 
	.word 0xa5da800b  ! 215: FLUSH_R	dis not found

	.word 0xc68a900b  ! 216: LDUBA_R	lduba	[%r10, %r11] 0x80, %r3
	.word 0x83daaa20  ! 217: FLUSH_I	dis not found

	.word 0xccaaaa78  ! 218: STBA_I	stba	%r6, [%r10 + 0x0a78] %asi
	.word 0xb7daa1c8  ! 219: FLUSH_I	dis not found

	.word 0xc36aaaa0  ! 220: PREFETCH_I	prefetch	[%r10 + 0x0aa0], #one_read
	.word 0x8cf2acb0  ! 221: UDIVcc_I	udivcc 	%r10, 0x0cb0, %r6
	.word 0xceb2ae64  ! 222: STHA_I	stha	%r7, [%r10 + 0x0e64] %asi
	.word 0x87daa850  ! 223: FLUSH_I	dis not found

	.word 0xf0da900b  ! 224: LDXA_R	ldxa	[%r10, %r11] 0x80, %r24
	.word 0x8322800b  ! 225: MULScc_R	mulscc 	%r10, %r11, %r1
	.word 0x8ddaafa0  ! 226: FLUSH_I	dis not found

	.word 0xb1a288ab  ! 227: FSUBs	fsubs	%f10, %f11, %f24
	.word 0x8a7aaf4c  ! 228: SDIV_I	sdiv 	%r10, 0x0f4c, %r5
	.word 0xc492900b  ! 229: LDUHA_R	lduha	[%r10, %r11] 0x80, %r2
	.word 0xc2aa900b  ! 230: STBA_R	stba	%r1, [%r10 + %r11] 0x80
	.word 0xcbf2900b  ! 231: CASXA_I	casxa	[%r10] 0x80, %r11, %r5
	.word 0xc6f2900b  ! 232: STXA_R	stxa	%r3, [%r10 + %r11] 0x80
	.word 0xa4f2a834  ! 233: UDIVcc_I	udivcc 	%r10, 0x0834, %r18
	.word 0xa3a2882b  ! 234: FADDs	fadds	%f10, %f11, %f17
	.word 0x996aa088  ! 235: SDIVX_I	sdivx	%r10, 0x0088, %r12
	.word 0xc36aa4a8  ! 236: PREFETCH_I	prefetch	[%r10 + 0x04a8], #one_read
	.word 0x9fdaa314  ! 237: FLUSH_I	dis not found

	.word 0xdc5aa240  ! 238: LDX_I	ldx	[%r10 + 0x0240], %r14
	.word 0xd092900b  ! 239: LDUHA_R	lduha	[%r10, %r11] 0x80, %r8
	.word 0xccd2ade4  ! 240: LDSHA_I	ldsha	[%r10, + 0x0de4] %asi, %r6
	.word 0x14800003  ! 241: BG	bg  	<label_0x3>
	.word 0x8af2800b  ! 242: UDIVcc_R	udivcc 	%r10, %r11, %r5
	.word 0xc49a900b  ! 243: LDDA_R	ldda	[%r10, %r11] 0x80, %r2
	.word 0xc9e2900b  ! 244: CASA_I	casa	[%r10] 0x80, %r11, %r4
	.word 0x2c800001  ! 246: BNEG	bneg,a	<label_0x1>
	.word 0xc282900b  ! 248: LDUWA_R	lduwa	[%r10, %r11] 0x80, %r1
	.word 0x885a800b  ! 249: SMUL_R	smul 	%r10, %r11, %r4
	.word 0x8143e072  ! 250: MEMBAR	membar	#StoreLoad | #Lookaside | #MemIssue | #Sync 
	.word 0x876a800b  ! 251: SDIVX_R	sdivx	%r10, %r11, %r3
	.word 0x8143e05b  ! 252: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Lookaside | #Sync 
	.word 0xa25aa0c8  ! 253: SMUL_I	smul 	%r10, 0x00c8, %r17
	.word 0xc3ea900b  ! 254: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0xc8f2900b  ! 255: STXA_R	stxa	%r4, [%r10 + %r11] 0x80
	.word 0x826aaf44  ! 256: UDIVX_I	udivx 	%r10, 0x0f44, %r1
	.word 0x36800001  ! 257: BGE	bge,a	<label_0x1>
	.word 0xd24aaab8  ! 258: LDSB_I	ldsb	[%r10 + 0x0ab8], %r9
	.word 0xa5a288ab  ! 259: FSUBs	fsubs	%f10, %f11, %f18
	.word 0xbb22a5f4  ! 260: MULScc_I	mulscc 	%r10, 0x05f4, %r29
	.word 0xd8caa3dc  ! 261: LDSBA_I	ldsba	[%r10, + 0x03dc] %asi, %r12
	.word 0xceea900b  ! 262: LDSTUBA_R	ldstuba	%r7, [%r10 + %r11] 0x80
	.word 0x8143c000  ! 263: STBAR	stbar
	.word 0xc9f2a00b  ! 264: CASXA_R	casxa	[%r10]%asi, %r11, %r4
	.word 0x8bda800b  ! 265: FLUSH_R	dis not found

	.word 0x87da800b  ! 266: FLUSH_R	dis not found

	.word 0xbaf2800b  ! 267: UDIVcc_R	udivcc 	%r10, %r11, %r29
	.word 0xc4f2900b  ! 268: STXA_R	stxa	%r2, [%r10 + %r11] 0x80
	.word 0xd2da900b  ! 269: LDXA_R	ldxa	[%r10, %r11] 0x80, %r9
	.word 0x8143c000  ! 270: STBAR	stbar
	.word 0xf6a2a4c8  ! 271: STWA_I	stwa	%r27, [%r10 + 0x04c8] %asi
	.word 0xf5f2900b  ! 272: CASXA_I	casxa	[%r10] 0x80, %r11, %r26
	.word 0xec9aabf0  ! 273: LDDA_I	ldda	[%r10, + 0x0bf0] %asi, %r22
	.word 0xce5aa168  ! 274: LDX_I	ldx	[%r10 + 0x0168], %r7
	.word 0xd3e2a00b  ! 275: CASA_R	casa	[%r10] %asi, %r11, %r9
	.word 0xd292900b  ! 276: LDUHA_R	lduha	[%r10, %r11] 0x80, %r9
	.word 0xcf22800b  ! 277: STF_R	st	%f7, [%r11, %r10]
	.word 0xbd6aa62c  ! 278: SDIVX_I	sdivx	%r10, 0x062c, %r30
	.word 0x8143e009  ! 279: MEMBAR	membar	#LoadLoad | #StoreStore 
	.word 0xc2da900b  ! 280: LDXA_R	ldxa	[%r10, %r11] 0x80, %r1
	.word 0x8143c000  ! 281: STBAR	stbar
	.word 0xccba900b  ! 282: STDA_R	stda	%r6, [%r10 + %r11] 0x80
	.word 0x87a289ab  ! 283: FDIVs	fdivs	%f10, %f11, %f3
	.word 0x8efa800b  ! 284: SDIVcc_R	sdivcc 	%r10, %r11, %r7
	.word 0xc36aadb8  ! 285: PREFETCH_I	prefetch	[%r10 + 0x0db8], #one_read
	.word 0xfc1aac00  ! 286: LDD_I	ldd	[%r10 + 0x0c00], %r30
	.word 0xb9da800b  ! 287: FLUSH_R	dis not found

	.word 0x8143e070  ! 288: MEMBAR	membar	#Lookaside | #MemIssue | #Sync 
	.word 0xc68aa114  ! 289: LDUBA_I	lduba	[%r10, + 0x0114] %asi, %r3
	.word 0x89a289ab  ! 290: FDIVs	fdivs	%f10, %f11, %f4
	.word 0x8143e05f  ! 292: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0xccb2900b  ! 293: STHA_R	stha	%r6, [%r10 + %r11] 0x80
	.word 0xc8fa900b  ! 294: SWAPA_R	swapa	%r4, [%r10 + %r11] 0x80
	.word 0xd9e2900b  ! 296: CASA_I	casa	[%r10] 0x80, %r11, %r12
	.word 0xcc02afd4  ! 297: LDUW_I	lduw	[%r10 + 0x0fd4], %r6
	.word 0x8d6aa068  ! 299: SDIVX_I	sdivx	%r10, 0x0068, %r6
	.word 0xf052a218  ! 300: LDSH_I	ldsh	[%r10 + 0x0218], %r24
	.word 0xc8eaa818  ! 301: LDSTUBA_I	ldstuba	%r4, [%r10 + 0x0818] %asi
	.word 0x9322800b  ! 302: MULScc_R	mulscc 	%r10, %r11, %r9
	.word 0x00800001  ! 303: BN	bn  	<label_0x1>
	.word 0xcaea900b  ! 304: LDSTUBA_R	ldstuba	%r5, [%r10 + %r11] 0x80
	.word 0xce52800b  ! 305: LDSH_R	ldsh	[%r10 + %r11], %r7
	.word 0x884aa880  ! 306: MULX_I	mulx 	%r10, 0x0880, %r4
	.word 0xc3ea900b  ! 307: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0xc8ba900b  ! 309: STDA_R	stda	%r4, [%r10 + %r11] 0x80
	.word 0xcca2a40c  ! 310: STWA_I	stwa	%r6, [%r10 + 0x040c] %asi
	.word 0xb5da800b  ! 311: FLUSH_R	dis not found

	.word 0xc6faa93c  ! 312: SWAPA_I	swapa	%r3, [%r10 + 0x093c] %asi
	.word 0xbda288ab  ! 313: FSUBs	fsubs	%f10, %f11, %f30
	.word 0x86d2800b  ! 314: UMULcc_R	umulcc 	%r10, %r11, %r3
	.word 0x40000001  ! 315: CALL	call	disp30_1
	.word 0x3a800003  ! 318: BCC	bcc,a	<label_0x3>
	.word 0xe602a4a8  ! 319: LDUW_I	lduw	[%r10 + 0x04a8], %r19
	.word 0x9e4aaa2c  ! 320: MULX_I	mulx 	%r10, 0x0a2c, %r15
	.word 0xca82ab64  ! 321: LDUWA_I	lduwa	[%r10, + 0x0b64] %asi, %r5
	.word 0x8143c000  ! 322: STBAR	stbar
	.word 0x16800001  ! 323: BGE	bge  	<label_0x1>
	.word 0x8143c000  ! 324: STBAR	stbar
	.word 0x36800003  ! 325: BGE	bge,a	<label_0x3>
	.word 0x0c800001  ! 326: BNEG	bneg  	<label_0x1>
	.word 0x93a289ab  ! 327: FDIVs	fdivs	%f10, %f11, %f9
	.word 0xda12800b  ! 328: LDUH_R	lduh	[%r10 + %r11], %r13
	.word 0x8143e077  ! 329: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside | #MemIssue | #Sync 
	.word 0x0cca0001  ! 330: BRGZ	brgz  ,pt	%8,<label_0xa0001>
	.word 0xc36aa46c  ! 331: PREFETCH_I	prefetch	[%r10 + 0x046c], #one_read
	.word 0xcf3a800b  ! 332: STDF_R	std	%f7, [%r11, %r10]
	.word 0xa9da800b  ! 333: FLUSH_R	dis not found

	.word 0x8e72800b  ! 334: UDIV_R	udiv 	%r10, %r11, %r7
	.word 0x22ca0001  ! 335: BRZ	brz,a,pt	%8,<label_0xa0001>
	.word 0xeaa2900b  ! 336: STWA_R	stwa	%r21, [%r10 + %r11] 0x80
	.word 0x16800003  ! 337: BGE	bge  	<label_0x3>
	.word 0x886a800b  ! 338: UDIVX_R	udivx 	%r10, %r11, %r4
	.word 0x9122a05c  ! 339: MULScc_I	mulscc 	%r10, 0x005c, %r8
	.word 0xdf22800b  ! 340: STF_R	st	%f15, [%r11, %r10]
	.word 0x83daa358  ! 341: FLUSH_I	dis not found

	.word 0xf6aaa7a0  ! 342: STBA_I	stba	%r27, [%r10 + 0x07a0] %asi
	.word 0x08800001  ! 343: BLEU	bleu  	<label_0x1>
	.word 0xde52af2c  ! 344: LDSH_I	ldsh	[%r10 + 0x0f2c], %r15
	.word 0x34800001  ! 345: BG	bg,a	<label_0x1>
	.word 0x8d22800b  ! 346: MULScc_R	mulscc 	%r10, %r11, %r6
	.word 0x8fa289ab  ! 347: FDIVs	fdivs	%f10, %f11, %f7
	.word 0x83a2882b  ! 348: FADDs	fadds	%f10, %f11, %f1
	.word 0xccbaa880  ! 349: STDA_I	stda	%r6, [%r10 + 0x0880] %asi
	.word 0xa8d2800b  ! 350: UMULcc_R	umulcc 	%r10, %r11, %r20
	.word 0xcc6aa0c0  ! 351: LDSTUB_I	ldstub	%r6, [%r10 + 0x00c0]
	.word 0x9fda800b  ! 352: FLUSH_R	dis not found

	.word 0x8143c000  ! 353: STBAR	stbar
	.word 0xceaaa280  ! 354: STBA_I	stba	%r7, [%r10 + 0x0280] %asi
	.word 0x8bdaa3b0  ! 355: FLUSH_I	dis not found

	.word 0xca02800b  ! 356: LDUW_R	lduw	[%r10 + %r11], %r5
	.word 0xceb2900b  ! 357: STHA_R	stha	%r7, [%r10 + %r11] 0x80
	.word 0x9dda800b  ! 358: FLUSH_R	dis not found

	.word 0xc922800b  ! 359: STF_R	st	%f4, [%r11, %r10]
	.word 0xc36aa97c  ! 360: PREFETCH_I	prefetch	[%r10 + 0x097c], #one_read
	.word 0xcad2a874  ! 361: LDSHA_I	ldsha	[%r10, + 0x0874] %asi, %r5
	.word 0x14800001  ! 362: BG	bg  	<label_0x1>
	.word 0xe86a800b  ! 363: LDSTUB_R	ldstub	%r20, [%r10 + %r11]
	.word 0x827aae10  ! 364: SDIV_I	sdiv 	%r10, 0x0e10, %r1
	.word 0x89daa5d8  ! 365: FLUSH_I	dis not found

	.word 0xa24aa360  ! 366: MULX_I	mulx 	%r10, 0x0360, %r17
	.word 0x8fa2892b  ! 367: FMULs	fmuls	%f10, %f11, %f7
	.word 0xe2ea900b  ! 368: LDSTUBA_R	ldstuba	%r17, [%r10 + %r11] 0x80
	.word 0xc8caad9c  ! 369: LDSBA_I	ldsba	[%r10, + 0x0d9c] %asi, %r4
	.word 0x8143e034  ! 370: MEMBAR	membar	#LoadStore | #Lookaside | #MemIssue 
	.word 0xd1e2900b  ! 371: CASA_I	casa	[%r10] 0x80, %r11, %r8
	.word 0xc8b2ad6c  ! 372: STHA_I	stha	%r4, [%r10 + 0x0d6c] %asi
	.word 0xc36a800b  ! 373: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x26800001  ! 374: BL	bl,a	<label_0x1>
	.word 0xcc6aad00  ! 375: LDSTUB_I	ldstub	%r6, [%r10 + 0x0d00]
	.word 0x846a800b  ! 376: UDIVX_R	udivx 	%r10, %r11, %r2
	.word 0xc93a800b  ! 377: STDF_R	std	%f4, [%r11, %r10]
	.word 0xa872a9a0  ! 378: UDIV_I	udiv 	%r10, 0x09a0, %r20
	.word 0x926aa808  ! 379: UDIVX_I	udivx 	%r10, 0x0808, %r9
	.word 0xd122800b  ! 380: STF_R	st	%f8, [%r11, %r10]
	.word 0x1a800001  ! 381: BCC	bcc  	<label_0x1>
	.word 0xce5aae10  ! 382: LDX_I	ldx	[%r10 + 0x0e10], %r7
	.word 0xfff2a00b  ! 383: CASXA_R	casxa	[%r10]%asi, %r11, %r31
	.word 0xc2eaa908  ! 384: LDSTUBA_I	ldstuba	%r1, [%r10 + 0x0908] %asi
	.word 0xc4a2900b  ! 385: STWA_R	stwa	%r2, [%r10 + %r11] 0x80
	.word 0xd1f2900b  ! 386: CASXA_I	casxa	[%r10] 0x80, %r11, %r8
	.word 0xafa289ab  ! 387: FDIVs	fdivs	%f10, %f11, %f23
	.word 0x87a289ab  ! 388: FDIVs	fdivs	%f10, %f11, %f3
	.word 0xaa5aaa14  ! 389: SMUL_I	smul 	%r10, 0x0a14, %r21
	.word 0x8143e04b  ! 390: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Sync 
	.word 0x90faaed0  ! 391: SDIVcc_I	sdivcc 	%r10, 0x0ed0, %r8
	.word 0xc36aa32c  ! 392: PREFETCH_I	prefetch	[%r10 + 0x032c], #one_read
	.word 0x9dda800b  ! 393: FLUSH_R	dis not found

	.word 0x91daa6e8  ! 394: FLUSH_I	dis not found

	.word 0xc322800b  ! 395: STF_R	st	%f1, [%r11, %r10]
	.word 0xf8b2a28c  ! 396: STHA_I	stha	%r28, [%r10 + 0x028c] %asi
	.word 0x87da800b  ! 397: FLUSH_R	dis not found

	.word 0xceca900b  ! 398: LDSBA_R	ldsba	[%r10, %r11] 0x80, %r7
	.word 0x8e72800b  ! 399: UDIV_R	udiv 	%r10, %r11, %r7
	.word 0x8ef2aa40  ! 400: UDIVcc_I	udivcc 	%r10, 0x0a40, %r7
	.word 0xc8aa900b  ! 401: STBA_R	stba	%r4, [%r10 + %r11] 0x80
	.word 0xc4aaa2d0  ! 402: STBA_I	stba	%r2, [%r10 + 0x02d0] %asi
	.word 0xfe5a800b  ! 403: LDX_R	ldx	[%r10 + %r11], %r31
	.word 0x89da800b  ! 404: FLUSH_R	dis not found

	.word 0xfeb2900b  ! 405: STHA_R	stha	%r31, [%r10 + %r11] 0x80
	.word 0xdea2ae04  ! 406: STWA_I	stwa	%r15, [%r10 + 0x0e04] %asi
	.word 0x84f2a978  ! 407: UDIVcc_I	udivcc 	%r10, 0x0978, %r2
	.word 0x8852aac0  ! 408: UMUL_I	umul 	%r10, 0x0ac0, %r4
	.word 0x8fdaa49c  ! 409: FLUSH_I	dis not found

	.word 0x8143c000  ! 410: STBAR	stbar
	.word 0x2a800003  ! 411: BCS	bcs,a	<label_0x3>
	.word 0x906aa378  ! 412: UDIVX_I	udivx 	%r10, 0x0378, %r8
	.word 0xcd3aa0d0  ! 413: STDF_I	std	%f6, [0x00d0, %r10]
	.word 0x3a800003  ! 414: BCC	bcc,a	<label_0x3>
	.word 0x987aaf2c  ! 415: SDIV_I	sdiv 	%r10, 0x0f2c, %r12
	.word 0xc3ea900b  ! 416: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0x9cf2af6c  ! 417: UDIVcc_I	udivcc 	%r10, 0x0f6c, %r14
	.word 0x8143e055  ! 418: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside | #Sync 
	.word 0xd0caaf10  ! 419: LDSBA_I	ldsba	[%r10, + 0x0f10] %asi, %r8
	.word 0xb3da800b  ! 420: FLUSH_R	dis not found

	.word 0xb66aa160  ! 421: UDIVX_I	udivx 	%r10, 0x0160, %r27
	.word 0xed22800b  ! 422: STF_R	st	%f22, [%r11, %r10]
	.word 0xdbf2900b  ! 423: CASXA_I	casxa	[%r10] 0x80, %r11, %r13
	.word 0x9c7a800b  ! 424: SDIV_R	sdiv 	%r10, %r11, %r14
	.word 0xf242ae60  ! 425: LDSW_I	ldsw	[%r10 + 0x0e60], %r25
	.word 0xc6aa900b  ! 426: STBA_R	stba	%r3, [%r10 + %r11] 0x80
	.word 0xab22a268  ! 427: MULScc_I	mulscc 	%r10, 0x0268, %r21
	.word 0xc36aa6ec  ! 428: PREFETCH_I	prefetch	[%r10 + 0x06ec], #one_read
	.word 0x8fdaab5c  ! 429: FLUSH_I	dis not found

	.word 0xf6b2900b  ! 430: STHA_R	stha	%r27, [%r10 + %r11] 0x80
	.word 0xec6aa888  ! 432: LDSTUB_I	ldstub	%r22, [%r10 + 0x0888]
	.word 0xaf6aa2d0  ! 433: SDIVX_I	sdivx	%r10, 0x02d0, %r23
	.word 0xceca900b  ! 434: LDSBA_R	ldsba	[%r10, %r11] 0x80, %r7
	.word 0x2cca0003  ! 435: BRGZ	brgz,a,pt	%8,<label_0xa0003>
	.word 0xc2aaadbc  ! 436: STBA_I	stba	%r1, [%r10 + 0x0dbc] %asi
	.word 0x85da800b  ! 437: FLUSH_R	dis not found

	.word 0x8143e07c  ! 438: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xcc02aef4  ! 439: LDUW_I	lduw	[%r10 + 0x0ef4], %r6
	.word 0xc0ba900b  ! 440: STDA_R	stda	%r0, [%r10 + %r11] 0x80
	.word 0xc4b2a000  ! 441: STHA_I	stha	%r2, [%r10 + 0x0000] %asi
	.word 0xc3eaaff8  ! 442: PREFETCHA_I	prefetcha	[%r10, + 0x0ff8] %asi, #one_read
	.word 0xf6a2a70c  ! 443: STWA_I	stwa	%r27, [%r10 + 0x070c] %asi
	.word 0xc4ea900b  ! 444: LDSTUBA_R	ldstuba	%r2, [%r10 + %r11] 0x80
	.word 0xdeea900b  ! 445: LDSTUBA_R	ldstuba	%r15, [%r10 + %r11] 0x80
	.word 0x92faabec  ! 446: SDIVcc_I	sdivcc 	%r10, 0x0bec, %r9
	.word 0x8143c000  ! 447: STBAR	stbar
	.word 0xe4b2900b  ! 448: STHA_R	stha	%r18, [%r10 + %r11] 0x80
	.word 0xce02800b  ! 449: LDUW_R	lduw	[%r10 + %r11], %r7
	.word 0x8143c000  ! 450: STBAR	stbar
	.word 0xe642800b  ! 451: LDSW_R	ldsw	[%r10 + %r11], %r19
	.word 0xc67aad9c  ! 452: SWAP_I	swap	%r3, [%r10 + 0x0d9c]
	.word 0xd04aa854  ! 453: LDSB_I	ldsb	[%r10 + 0x0854], %r8
	.word 0x91a2882b  ! 454: FADDs	fadds	%f10, %f11, %f8
	.word 0xfe6a800b  ! 455: LDSTUB_R	ldstub	%r31, [%r10 + %r11]
	.word 0x93daa0cc  ! 456: FLUSH_I	dis not found

	.word 0x864aa7d4  ! 457: MULX_I	mulx 	%r10, 0x07d4, %r3
	.word 0xced2a528  ! 458: LDSHA_I	ldsha	[%r10, + 0x0528] %asi, %r7
	.word 0xd322800b  ! 459: STF_R	st	%f9, [%r11, %r10]
	.word 0xf8b2a648  ! 460: STHA_I	stha	%r28, [%r10 + 0x0648] %asi
	.word 0xcf3a800b  ! 461: STDF_R	std	%f7, [%r11, %r10]
	.word 0x04ca0003  ! 462: BRLEZ	brlez  ,pt	%8,<label_0xa0003>
	.word 0xd13aa8c0  ! 463: STDF_I	std	%f8, [0x08c0, %r10]
	.word 0xcf22800b  ! 464: STF_R	st	%f7, [%r11, %r10]
	.word 0xf802800b  ! 465: LDUW_R	lduw	[%r10 + %r11], %r28
	.word 0xdefaa980  ! 466: SWAPA_I	swapa	%r15, [%r10 + 0x0980] %asi
	.word 0xf0f2900b  ! 467: STXA_R	stxa	%r24, [%r10 + %r11] 0x80
	.word 0xc36a800b  ! 468: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0xcaa2900b  ! 469: STWA_R	stwa	%r5, [%r10 + %r11] 0x80
	.word 0xcc42800b  ! 470: LDSW_R	ldsw	[%r10 + %r11], %r6
	.word 0xf0ba900b  ! 471: STDA_R	stda	%r24, [%r10 + %r11] 0x80
	.word 0xd8b2900b  ! 473: STHA_R	stha	%r12, [%r10 + %r11] 0x80
	.word 0xb9daa338  ! 474: FLUSH_I	dis not found

	.word 0x83a2882b  ! 475: FADDs	fadds	%f10, %f11, %f1
	.word 0x86fa800b  ! 476: SDIVcc_R	sdivcc 	%r10, %r11, %r3
	.word 0xc26a800b  ! 477: LDSTUB_R	ldstub	%r1, [%r10 + %r11]
	.word 0x93da800b  ! 478: FLUSH_R	dis not found

	.word 0xccd2900b  ! 479: LDSHA_R	ldsha	[%r10, %r11] 0x80, %r6
	.word 0xd882a278  ! 480: LDUWA_I	lduwa	[%r10, + 0x0278] %asi, %r12
	.word 0xc4baada8  ! 481: STDA_I	stda	%r2, [%r10 + 0x0da8] %asi
	.word 0x896a800b  ! 482: SDIVX_R	sdivx	%r10, %r11, %r4
	.word 0x8fdaa340  ! 483: FLUSH_I	dis not found

	.word 0xdea2900b  ! 484: STWA_R	stwa	%r15, [%r10 + %r11] 0x80
	.word 0x06800003  ! 485: BL	bl  	<label_0x3>
	.word 0x10800003  ! 486: BA	ba  	<label_0x3>
	.word 0xf33a800b  ! 487: STDF_R	std	%f25, [%r11, %r10]
	.word 0x8143c000  ! 488: STBAR	stbar
	.word 0xec52a1f4  ! 489: LDSH_I	ldsh	[%r10 + 0x01f4], %r22
	.word 0xc5f2900b  ! 490: CASXA_I	casxa	[%r10] 0x80, %r11, %r2
	.word 0xe292900b  ! 491: LDUHA_R	lduha	[%r10, %r11] 0x80, %r17
	.word 0xb26aa718  ! 492: UDIVX_I	udivx 	%r10, 0x0718, %r25
	.word 0xc922acf0  ! 493: STF_I	st	%f4, [0x0cf0, %r10]
	.word 0x8da2882b  ! 494: FADDs	fadds	%f10, %f11, %f6
	.word 0xc3ea900b  ! 495: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0x8143e019  ! 496: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside 
	.word 0xc8c2ae14  ! 497: LDSWA_I	ldswa	[%r10, + 0x0e14] %asi, %r4
	.word 0x1c800003  ! 498: BPOS	bpos  	<label_0x3>
	.word 0xcc1a800b  ! 499: LDD_R	ldd	[%r10 + %r11], %r6
	.word 0xca8a900b  ! 500: LDUBA_R	lduba	[%r10, %r11] 0x80, %r5
	.word 0xcde2900b  ! 501: CASA_I	casa	[%r10] 0x80, %r11, %r6
	.word 0xa2d2800b  ! 502: UMULcc_R	umulcc 	%r10, %r11, %r17
	.word 0x8472a0ac  ! 503: UDIV_I	udiv 	%r10, 0x00ac, %r2
	.word 0x864a800b  ! 504: MULX_R	mulx 	%r10, %r11, %r3
	.word 0xc26a800b  ! 505: LDSTUB_R	ldstub	%r1, [%r10 + %r11]
	.word 0xa7a289ab  ! 506: FDIVs	fdivs	%f10, %f11, %f19
	.word 0xada2882b  ! 507: FADDs	fadds	%f10, %f11, %f22
	.word 0x926aa2c0  ! 508: UDIVX_I	udivx 	%r10, 0x02c0, %r9
	.word 0xc2a2900b  ! 509: STWA_R	stwa	%r1, [%r10 + %r11] 0x80
	.word 0x82faac28  ! 510: SDIVcc_I	sdivcc 	%r10, 0x0c28, %r1
	.word 0xb5daae6c  ! 511: FLUSH_I	dis not found

	.word 0xc36a800b  ! 512: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0xfaf2adf0  ! 513: STXA_I	stxa	%r29, [%r10 + 0x0df0] %asi
	.word 0x0a800001  ! 514: BCS	bcs  	<label_0x1>
	.word 0x2aca0001  ! 515: BRNZ	brnz,a,pt	%8,<label_0xa0001>
	.word 0x3c800001  ! 516: BPOS	bpos,a	<label_0x1>
	.word 0xd202a390  ! 518: LDUW_I	lduw	[%r10 + 0x0390], %r9
	.word 0xdc5aa1e0  ! 519: LDX_I	ldx	[%r10 + 0x01e0], %r14
	.word 0x9da2892b  ! 520: FMULs	fmuls	%f10, %f11, %f14
	.word 0x8d22a14c  ! 521: MULScc_I	mulscc 	%r10, 0x014c, %r6
	.word 0xbddaab04  ! 522: FLUSH_I	dis not found

	.word 0xec8a900b  ! 523: LDUBA_R	lduba	[%r10, %r11] 0x80, %r22
	.word 0xc4baa8c0  ! 524: STDA_I	stda	%r2, [%r10 + 0x08c0] %asi
	.word 0x30800001  ! 525: BA	ba,a	<label_0x1>
	.word 0xb47aae38  ! 526: SDIV_I	sdiv 	%r10, 0x0e38, %r26
	.word 0x0ec20001  ! 527: BRGEZ	brgez  ,nt	%8,<label_0x20001>
	.word 0x9852a980  ! 528: UMUL_I	umul 	%r10, 0x0980, %r12
	.word 0x10800001  ! 529: BA	ba  	<label_0x1>
	.word 0x8672800b  ! 530: UDIV_R	udiv 	%r10, %r11, %r3
	.word 0x8143e034  ! 531: MEMBAR	membar	#LoadStore | #Lookaside | #MemIssue 
	.word 0xb2faa238  ! 532: SDIVcc_I	sdivcc 	%r10, 0x0238, %r25
	.word 0x86f2800b  ! 533: UDIVcc_R	udivcc 	%r10, %r11, %r3
	.word 0xc4ba900b  ! 534: STDA_R	stda	%r2, [%r10 + %r11] 0x80
	.word 0xc3eaa4e0  ! 535: PREFETCHA_I	prefetcha	[%r10, + 0x04e0] %asi, #one_read
	.word 0xa0fa800b  ! 536: SDIVcc_R	sdivcc 	%r10, %r11, %r16
	.word 0xf322a5c8  ! 537: STF_I	st	%f25, [0x05c8, %r10]
	.word 0xa872a630  ! 538: UDIV_I	udiv 	%r10, 0x0630, %r20
	.word 0xd07a800b  ! 539: SWAP_R	swap	%r8, [%r10 + %r11]
	.word 0xc8da900b  ! 541: LDXA_R	ldxa	[%r10, %r11] 0x80, %r4
	.word 0x8dda800b  ! 542: FLUSH_R	dis not found

	.word 0x8d22800b  ! 543: MULScc_R	mulscc 	%r10, %r11, %r6
	.word 0xc3e2900b  ! 544: CASA_I	casa	[%r10] 0x80, %r11, %r1
	.word 0xc522800b  ! 546: STF_R	st	%f2, [%r11, %r10]
	.word 0x8143e003  ! 547: MEMBAR	membar	#LoadLoad | #StoreLoad 
	.word 0x8143e04d  ! 548: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Sync 
	.word 0x864aa33c  ! 549: MULX_I	mulx 	%r10, 0x033c, %r3
	.word 0x34800001  ! 550: BG	bg,a	<label_0x1>
	.word 0x8fa288ab  ! 551: FSUBs	fsubs	%f10, %f11, %f7
	.word 0xc46aa4e4  ! 552: LDSTUB_I	ldstub	%r2, [%r10 + 0x04e4]
	.word 0xc3ea900b  ! 553: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0xd0ea900b  ! 554: LDSTUBA_R	ldstuba	%r8, [%r10 + %r11] 0x80
	.word 0x30800003  ! 555: BA	ba,a	<label_0x3>
	.word 0x82d2800b  ! 556: UMULcc_R	umulcc 	%r10, %r11, %r1
	.word 0xcff2900b  ! 557: CASXA_I	casxa	[%r10] 0x80, %r11, %r7
	.word 0x8143c000  ! 558: STBAR	stbar
	.word 0xacda800b  ! 559: SMULcc_R	smulcc 	%r10, %r11, %r22
	.word 0xf49aa228  ! 560: LDDA_I	ldda	[%r10, + 0x0228] %asi, %r26
	.word 0xb96aa070  ! 561: SDIVX_I	sdivx	%r10, 0x0070, %r28
	.word 0xea52af44  ! 563: LDSH_I	ldsh	[%r10 + 0x0f44], %r21
	.word 0xecaa900b  ! 564: STBA_R	stba	%r22, [%r10 + %r11] 0x80
	.word 0x0e800001  ! 565: BVS	bvs  	<label_0x1>
	.word 0xc2f2900b  ! 566: STXA_R	stxa	%r1, [%r10 + %r11] 0x80
	.word 0x0aca0001  ! 567: BRNZ	brnz  ,pt	%8,<label_0xa0001>
	.word 0x8922a5c8  ! 568: MULScc_I	mulscc 	%r10, 0x05c8, %r4
	.word 0xbdda800b  ! 569: FLUSH_R	dis not found

	.word 0xaafa800b  ! 570: SDIVcc_R	sdivcc 	%r10, %r11, %r21
	.word 0xc6c2aa74  ! 571: LDSWA_I	ldswa	[%r10, + 0x0a74] %asi, %r3
	.word 0xeac2adac  ! 572: LDSWA_I	ldswa	[%r10, + 0x0dac] %asi, %r21
	.word 0xba5a800b  ! 573: SMUL_R	smul 	%r10, %r11, %r29
	.word 0x88faa0ec  ! 574: SDIVcc_I	sdivcc 	%r10, 0x00ec, %r4
	.word 0x87daa4c4  ! 575: FLUSH_I	dis not found

	.word 0xc652a298  ! 576: LDSH_I	ldsh	[%r10 + 0x0298], %r3
	.word 0xd8ba900b  ! 577: STDA_R	stda	%r12, [%r10 + %r11] 0x80
	.word 0xcb3aa598  ! 578: STDF_I	std	%f5, [0x0598, %r10]
	.word 0xd0c2a720  ! 579: LDSWA_I	ldswa	[%r10, + 0x0720] %asi, %r8
	.word 0xd0c2900b  ! 580: LDSWA_R	ldswa	[%r10, %r11] 0x80, %r8
	.word 0xce4aa938  ! 581: LDSB_I	ldsb	[%r10 + 0x0938], %r7
	.word 0xaa4aa178  ! 582: MULX_I	mulx 	%r10, 0x0178, %r21
	.word 0x8143c000  ! 583: STBAR	stbar
	.word 0xfaeaa110  ! 584: LDSTUBA_I	ldstuba	%r29, [%r10 + 0x0110] %asi
	.word 0xd0baa808  ! 585: STDA_I	stda	%r8, [%r10 + 0x0808] %asi
	.word 0x00800003  ! 586: BN	bn  	<label_0x3>
	.word 0xe612800b  ! 587: LDUH_R	lduh	[%r10 + %r11], %r19
	.word 0xc36a800b  ! 588: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0xd01aa3f8  ! 589: LDD_I	ldd	[%r10 + 0x03f8], %r8
	.word 0xcc6a800b  ! 590: LDSTUB_R	ldstub	%r6, [%r10 + %r11]
	.word 0xc292a6ec  ! 592: LDUHA_I	lduha	[%r10, + 0x06ec] %asi, %r1
	.word 0x87da800b  ! 593: FLUSH_R	dis not found

	.word 0x98faa304  ! 594: SDIVcc_I	sdivcc 	%r10, 0x0304, %r12
	.word 0x8c5a800b  ! 595: SMUL_R	smul 	%r10, %r11, %r6
	.word 0x16800003  ! 597: BGE	bge  	<label_0x3>
	.word 0x93da800b  ! 599: FLUSH_R	dis not found

	.word 0xccba900b  ! 600: STDA_R	stda	%r6, [%r10 + %r11] 0x80
	.word 0x8143c000  ! 601: STBAR	stbar
	.word 0x8143e031  ! 602: MEMBAR	membar	#LoadLoad | #Lookaside | #MemIssue 
	.word 0x38800001  ! 603: BGU	bgu,a	<label_0x1>
	.word 0xc3ea900b  ! 604: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0xd01aa2e8  ! 605: LDD_I	ldd	[%r10 + 0x02e8], %r8
	.word 0x8a72aba4  ! 606: UDIV_I	udiv 	%r10, 0x0ba4, %r5
	.word 0xccb2ae54  ! 607: STHA_I	stha	%r6, [%r10 + 0x0e54] %asi
	.word 0x9272ae40  ! 608: UDIV_I	udiv 	%r10, 0x0e40, %r9
	.word 0x8143c000  ! 610: STBAR	stbar
	.word 0x904aa880  ! 611: MULX_I	mulx 	%r10, 0x0880, %r8
	.word 0xcc9aa240  ! 613: LDDA_I	ldda	[%r10, + 0x0240] %asi, %r6
	.word 0xd8faaba0  ! 614: SWAPA_I	swapa	%r12, [%r10 + 0x0ba0] %asi
	.word 0xced2900b  ! 615: LDSHA_R	ldsha	[%r10, %r11] 0x80, %r7
	.word 0xd04aaa30  ! 616: LDSB_I	ldsb	[%r10 + 0x0a30], %r8
	.word 0xca0a800b  ! 617: LDUB_R	ldub	[%r10 + %r11], %r5
	.word 0x8672800b  ! 618: UDIV_R	udiv 	%r10, %r11, %r3
	.word 0xd122800b  ! 619: STF_R	st	%f8, [%r11, %r10]
	.word 0xb5a2892b  ! 620: FMULs	fmuls	%f10, %f11, %f26
	.word 0xcec2af04  ! 621: LDSWA_I	ldswa	[%r10, + 0x0f04] %asi, %r7
	.word 0xce8a900b  ! 622: LDUBA_R	lduba	[%r10, %r11] 0x80, %r7
	.word 0xe052800b  ! 623: LDSH_R	ldsh	[%r10 + %r11], %r16
	.word 0xc89a900b  ! 624: LDDA_R	ldda	[%r10, %r11] 0x80, %r4
	.word 0xa36aa148  ! 625: SDIVX_I	sdivx	%r10, 0x0148, %r17
	.word 0x884aaf58  ! 626: MULX_I	mulx 	%r10, 0x0f58, %r4
	.word 0x8143c000  ! 627: STBAR	stbar
	.word 0xc252ab30  ! 628: LDSH_I	ldsh	[%r10 + 0x0b30], %r1
	.word 0xce02800b  ! 629: LDUW_R	lduw	[%r10 + %r11], %r7
	.word 0x8a52800b  ! 630: UMUL_R	umul 	%r10, %r11, %r5
	.word 0x825a800b  ! 631: SMUL_R	smul 	%r10, %r11, %r1
	.word 0x02ca0001  ! 632: BRZ	brz  ,pt	%8,<label_0xa0001>
	.word 0xd8da900b  ! 633: LDXA_R	ldxa	[%r10, %r11] 0x80, %r12
	.word 0xea7a800b  ! 634: SWAP_R	swap	%r21, [%r10 + %r11]
	.word 0xe042a998  ! 635: LDSW_I	ldsw	[%r10 + 0x0998], %r16
	.word 0x8143c000  ! 636: STBAR	stbar
	.word 0x82fa800b  ! 637: SDIVcc_R	sdivcc 	%r10, %r11, %r1
	.word 0xe322abf8  ! 638: STF_I	st	%f17, [0x0bf8, %r10]
	.word 0xa66aa970  ! 639: UDIVX_I	udivx 	%r10, 0x0970, %r19
	.word 0xce4aa044  ! 640: LDSB_I	ldsb	[%r10 + 0x0044], %r7
	.word 0x8143c000  ! 641: STBAR	stbar
	.word 0xafa2892b  ! 642: FMULs	fmuls	%f10, %f11, %f23
	.word 0x8ef2800b  ! 643: UDIVcc_R	udivcc 	%r10, %r11, %r7
	.word 0xc36aa75c  ! 644: PREFETCH_I	prefetch	[%r10 + 0x075c], #one_read
	.word 0xcc6a800b  ! 645: LDSTUB_R	ldstub	%r6, [%r10 + %r11]
	.word 0xb44a800b  ! 646: MULX_R	mulx 	%r10, %r11, %r26
	.word 0xa7a288ab  ! 647: FSUBs	fsubs	%f10, %f11, %f19
	.word 0x8143e07a  ! 648: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xd01aac10  ! 649: LDD_I	ldd	[%r10 + 0x0c10], %r8
	.word 0xf452a944  ! 650: LDSH_I	ldsh	[%r10 + 0x0944], %r26
	.word 0x92faabf4  ! 651: SDIVcc_I	sdivcc 	%r10, 0x0bf4, %r9
	.word 0x34800001  ! 652: BG	bg,a	<label_0x1>
	.word 0xc41a800b  ! 653: LDD_R	ldd	[%r10 + %r11], %r2
	.word 0xd2a2900b  ! 654: STWA_R	stwa	%r9, [%r10 + %r11] 0x80
	.word 0xd0a2a5a8  ! 655: STWA_I	stwa	%r8, [%r10 + 0x05a8] %asi
	.word 0x8852a2a4  ! 656: UMUL_I	umul 	%r10, 0x02a4, %r4
	.word 0xf53a800b  ! 657: STDF_R	std	%f26, [%r11, %r10]
	.word 0x85a289ab  ! 658: FDIVs	fdivs	%f10, %f11, %f2
	.word 0xc36a800b  ! 659: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x8522800b  ! 660: MULScc_R	mulscc 	%r10, %r11, %r2
	.word 0xf412800b  ! 661: LDUH_R	lduh	[%r10 + %r11], %r26
	.word 0xb7da800b  ! 664: FLUSH_R	dis not found

	.word 0x8143e011  ! 665: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x8dda800b  ! 666: FLUSH_R	dis not found

	.word 0xc412800b  ! 667: LDUH_R	lduh	[%r10 + %r11], %r2
	.word 0xe84aaf6c  ! 668: LDSB_I	ldsb	[%r10 + 0x0f6c], %r20
	.word 0x1e800001  ! 669: BVC	bvc  	<label_0x1>
	.word 0xeb22ac34  ! 670: STF_I	st	%f21, [0x0c34, %r10]
	.word 0xccbaae50  ! 671: STDA_I	stda	%r6, [%r10 + 0x0e50] %asi
	.word 0xeeeaaeb8  ! 672: LDSTUBA_I	ldstuba	%r23, [%r10 + 0x0eb8] %asi
	.word 0xc3eaae7c  ! 673: PREFETCHA_I	prefetcha	[%r10, + 0x0e7c] %asi, #one_read
	.word 0xf60aadb4  ! 675: LDUB_I	ldub	[%r10 + 0x0db4], %r27
	.word 0xf6d2900b  ! 676: LDSHA_R	ldsha	[%r10, %r11] 0x80, %r27
	.word 0x28800001  ! 677: BLEU	bleu,a	<label_0x1>
	.word 0x91daa960  ! 678: FLUSH_I	dis not found

	.word 0xeefaa57c  ! 679: SWAPA_I	swapa	%r23, [%r10 + 0x057c] %asi
	.word 0xe442800b  ! 680: LDSW_R	ldsw	[%r10 + %r11], %r18
	.word 0xd07a800b  ! 681: SWAP_R	swap	%r8, [%r10 + %r11]
	.word 0xc6fa900b  ! 682: SWAPA_R	swapa	%r3, [%r10 + %r11] 0x80
	.word 0xf6b2a904  ! 683: STHA_I	stha	%r27, [%r10 + 0x0904] %asi
	.word 0x8efaade4  ! 684: SDIVcc_I	sdivcc 	%r10, 0x0de4, %r7
	.word 0xc722800b  ! 685: STF_R	st	%f3, [%r11, %r10]
	.word 0xc8aaaf58  ! 686: STBA_I	stba	%r4, [%r10 + 0x0f58] %asi
	.word 0xc36a800b  ! 687: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x89daa48c  ! 688: FLUSH_I	dis not found

	.word 0x85daa4e8  ! 689: FLUSH_I	dis not found

	.word 0xd26a800b  ! 690: LDSTUB_R	ldstub	%r9, [%r10 + %r11]
	.word 0xc6caafb8  ! 691: LDSBA_I	ldsba	[%r10, + 0x0fb8] %asi, %r3
	.word 0x8a72ab44  ! 693: UDIV_I	udiv 	%r10, 0x0b44, %r5
	.word 0xd292a870  ! 694: LDUHA_I	lduha	[%r10, + 0x0870] %asi, %r9
	.word 0xe722ae64  ! 695: STF_I	st	%f19, [0x0e64, %r10]
	.word 0xc27aa69c  ! 696: SWAP_I	swap	%r1, [%r10 + 0x069c]
	.word 0x85da800b  ! 697: FLUSH_R	dis not found

	.word 0xc4c2a64c  ! 698: LDSWA_I	ldswa	[%r10, + 0x064c] %asi, %r2
	.word 0xb4f2a4a0  ! 699: UDIVcc_I	udivcc 	%r10, 0x04a0, %r26
	.word 0xc3eaa724  ! 700: PREFETCHA_I	prefetcha	[%r10, + 0x0724] %asi, #one_read
	.word 0x8143e035  ! 701: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside | #MemIssue 
	.word 0x84d2a750  ! 702: UMULcc_I	umulcc 	%r10, 0x0750, %r2
	.word 0x84f2800b  ! 703: UDIVcc_R	udivcc 	%r10, %r11, %r2
	.word 0x92d2800b  ! 704: UMULcc_R	umulcc 	%r10, %r11, %r9
	.word 0x04c20001  ! 705: BRLEZ	brlez  ,nt	%8,<label_0x20001>
	.word 0xc4b2a6ac  ! 706: STHA_I	stha	%r2, [%r10 + 0x06ac] %asi
	.word 0x06800003  ! 707: BL	bl  	<label_0x3>
	.word 0xa072a5a4  ! 708: UDIV_I	udiv 	%r10, 0x05a4, %r16
	.word 0xcfe2900b  ! 709: CASA_I	casa	[%r10] 0x80, %r11, %r7
	.word 0xd2c2a758  ! 710: LDSWA_I	ldswa	[%r10, + 0x0758] %asi, %r9
	.word 0xe6f2900b  ! 711: STXA_R	stxa	%r19, [%r10 + %r11] 0x80
	.word 0xc64a800b  ! 712: LDSB_R	ldsb	[%r10 + %r11], %r3
	.word 0x83daa60c  ! 713: FLUSH_I	dis not found

	.word 0xa3a2892b  ! 714: FMULs	fmuls	%f10, %f11, %f17
	.word 0xc4faac7c  ! 715: SWAPA_I	swapa	%r2, [%r10 + 0x0c7c] %asi
	.word 0xe6aa900b  ! 716: STBA_R	stba	%r19, [%r10 + %r11] 0x80
	.word 0x89daa52c  ! 717: FLUSH_I	dis not found

	.word 0x8143e001  ! 718: MEMBAR	membar	#LoadLoad 
	.word 0x8143e06f  ! 719: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #MemIssue | #Sync 
	.word 0x936aa2b8  ! 720: SDIVX_I	sdivx	%r10, 0x02b8, %r9
	.word 0x9b6aad18  ! 721: SDIVX_I	sdivx	%r10, 0x0d18, %r13
	.word 0xca82900b  ! 722: LDUWA_R	lduwa	[%r10, %r11] 0x80, %r5
	.word 0x83a289ab  ! 723: FDIVs	fdivs	%f10, %f11, %f1
	.word 0xc48a900b  ! 724: LDUBA_R	lduba	[%r10, %r11] 0x80, %r2
	.word 0x83a289ab  ! 725: FDIVs	fdivs	%f10, %f11, %f1
	.word 0xc7f2a00b  ! 726: CASXA_R	casxa	[%r10]%asi, %r11, %r3
	.word 0x90d2a99c  ! 727: UMULcc_I	umulcc 	%r10, 0x099c, %r8
	.word 0xc3eaa950  ! 728: PREFETCHA_I	prefetcha	[%r10, + 0x0950] %asi, #one_read
	.word 0xb9a2882b  ! 729: FADDs	fadds	%f10, %f11, %f28
	.word 0xcad2900b  ! 730: LDSHA_R	ldsha	[%r10, %r11] 0x80, %r5
	.word 0xa1a2892b  ! 731: FMULs	fmuls	%f10, %f11, %f16
	.word 0x8f22800b  ! 732: MULScc_R	mulscc 	%r10, %r11, %r7
	.word 0x02ca0001  ! 733: BRZ	brz  ,pt	%8,<label_0xa0001>
	.word 0xf4f2900b  ! 734: STXA_R	stxa	%r26, [%r10 + %r11] 0x80
	.word 0x8e4aa684  ! 735: MULX_I	mulx 	%r10, 0x0684, %r7
	.word 0xa87aac2c  ! 736: SDIV_I	sdiv 	%r10, 0x0c2c, %r20
	.word 0xe6f2a858  ! 737: STXA_I	stxa	%r19, [%r10 + 0x0858] %asi
	.word 0xb7a289ab  ! 738: FDIVs	fdivs	%f10, %f11, %f27
	.word 0xfef2a3f0  ! 739: STXA_I	stxa	%r31, [%r10 + 0x03f0] %asi
	.word 0x93daa458  ! 740: FLUSH_I	dis not found

	.word 0x8edaa9a4  ! 741: SMULcc_I	smulcc 	%r10, 0x09a4, %r7
	.word 0xcc6a800b  ! 742: LDSTUB_R	ldstub	%r6, [%r10 + %r11]
	.word 0xfe52800b  ! 743: LDSH_R	ldsh	[%r10 + %r11], %r31
	.word 0x907aae60  ! 744: SDIV_I	sdiv 	%r10, 0x0e60, %r8
	.word 0xe2a2ace8  ! 745: STWA_I	stwa	%r17, [%r10 + 0x0ce8] %asi
	.word 0x88d2800b  ! 746: UMULcc_R	umulcc 	%r10, %r11, %r4
	.word 0x8852800b  ! 747: UMUL_R	umul 	%r10, %r11, %r4
	.word 0x9052800b  ! 748: UMUL_R	umul 	%r10, %r11, %r8
	.word 0x846aafc8  ! 749: UDIVX_I	udivx 	%r10, 0x0fc8, %r2
	.word 0xca92a12c  ! 750: LDUHA_I	lduha	[%r10, + 0x012c] %asi, %r5
	.word 0x8143c000  ! 751: STBAR	stbar
	.word 0xc6ea900b  ! 752: LDSTUBA_R	ldstuba	%r3, [%r10 + %r11] 0x80
	.word 0xc812800b  ! 753: LDUH_R	lduh	[%r10 + %r11], %r4
	.word 0xc3eaa4e4  ! 754: PREFETCHA_I	prefetcha	[%r10, + 0x04e4] %asi, #one_read
	.word 0x24800003  ! 755: BLE	ble,a	<label_0x3>
	.word 0xf522800b  ! 756: STF_R	st	%f26, [%r11, %r10]
	.word 0x8a4aa448  ! 757: MULX_I	mulx 	%r10, 0x0448, %r5
	.word 0x887aa79c  ! 758: SDIV_I	sdiv 	%r10, 0x079c, %r4
	.word 0x88da800b  ! 759: SMULcc_R	smulcc 	%r10, %r11, %r4
	.word 0x90f2800b  ! 760: UDIVcc_R	udivcc 	%r10, %r11, %r8
	.word 0xd2c2ad40  ! 761: LDSWA_I	ldswa	[%r10, + 0x0d40] %asi, %r9
	.word 0xd0f2900b  ! 762: STXA_R	stxa	%r8, [%r10 + %r11] 0x80
	.word 0xd3f2900b  ! 763: CASXA_I	casxa	[%r10] 0x80, %r11, %r9
	.word 0xc25aae68  ! 764: LDX_I	ldx	[%r10 + 0x0e68], %r1
	.word 0x826a800b  ! 765: UDIVX_R	udivx 	%r10, %r11, %r1
	.word 0x8ba2882b  ! 766: FADDs	fadds	%f10, %f11, %f5
	.word 0xc522a760  ! 767: STF_I	st	%f2, [0x0760, %r10]
	.word 0x8a7aab6c  ! 768: SDIV_I	sdiv 	%r10, 0x0b6c, %r5
	.word 0xee02800b  ! 769: LDUW_R	lduw	[%r10 + %r11], %r23
	.word 0xc85a800b  ! 770: LDX_R	ldx	[%r10 + %r11], %r4
	.word 0xceaa900b  ! 771: STBA_R	stba	%r7, [%r10 + %r11] 0x80
	.word 0xc802aefc  ! 772: LDUW_I	lduw	[%r10 + 0x0efc], %r4
	.word 0xc852a438  ! 773: LDSH_I	ldsh	[%r10 + 0x0438], %r4
	.word 0x8143c000  ! 774: STBAR	stbar
	.word 0xd08a900b  ! 775: LDUBA_R	lduba	[%r10, %r11] 0x80, %r8
	.word 0xc26a800b  ! 776: LDSTUB_R	ldstub	%r1, [%r10 + %r11]
	.word 0x8d6a800b  ! 777: SDIVX_R	sdivx	%r10, %r11, %r6
	.word 0xc4ea900b  ! 778: LDSTUBA_R	ldstuba	%r2, [%r10 + %r11] 0x80
	.word 0x8272a614  ! 779: UDIV_I	udiv 	%r10, 0x0614, %r1
	.word 0x826aa390  ! 780: UDIVX_I	udivx 	%r10, 0x0390, %r1
	.word 0xecc2900b  ! 781: LDSWA_R	ldswa	[%r10, %r11] 0x80, %r22
	.word 0x8cf2aa74  ! 782: UDIVcc_I	udivcc 	%r10, 0x0a74, %r6
	.word 0x8cdaa0c4  ! 783: SMULcc_I	smulcc 	%r10, 0x00c4, %r6
	.word 0xaba289ab  ! 784: FDIVs	fdivs	%f10, %f11, %f21
	.word 0xc87aab50  ! 785: SWAP_I	swap	%r4, [%r10 + 0x0b50]
	.word 0x825aae1c  ! 786: SMUL_I	smul 	%r10, 0x0e1c, %r1
	.word 0x89daac1c  ! 787: FLUSH_I	dis not found

	.word 0x8143e06d  ! 788: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #MemIssue | #Sync 
	.word 0xbed2800b  ! 789: UMULcc_R	umulcc 	%r10, %r11, %r31
	.word 0x8e52800b  ! 790: UMUL_R	umul 	%r10, %r11, %r7
	.word 0x0cca0003  ! 791: BRGZ	brgz  ,pt	%8,<label_0xa0003>
	.word 0xd89aa030  ! 792: LDDA_I	ldda	[%r10, + 0x0030] %asi, %r12
	.word 0xdcc2900b  ! 793: LDSWA_R	ldswa	[%r10, %r11] 0x80, %r14
	.word 0xfe6a800b  ! 794: LDSTUB_R	ldstub	%r31, [%r10 + %r11]
	.word 0xce12af84  ! 795: LDUH_I	lduh	[%r10 + 0x0f84], %r7
	.word 0xd0eaae20  ! 796: LDSTUBA_I	ldstuba	%r8, [%r10 + 0x0e20] %asi
	.word 0xc3eaa75c  ! 797: PREFETCHA_I	prefetcha	[%r10, + 0x075c] %asi, #one_read
	.word 0xc212800b  ! 799: LDUH_R	lduh	[%r10 + %r11], %r1
	.word 0x8da288ab  ! 800: FSUBs	fsubs	%f10, %f11, %f6
	.word 0x8143e076  ! 801: MEMBAR	membar	#StoreLoad | #LoadStore | #Lookaside | #MemIssue | #Sync 
	.word 0xeeca900b  ! 802: LDSBA_R	ldsba	[%r10, %r11] 0x80, %r23
	.word 0xab6aa1ac  ! 803: SDIVX_I	sdivx	%r10, 0x01ac, %r21
	.word 0xc8b2aa28  ! 804: STHA_I	stha	%r4, [%r10 + 0x0a28] %asi
	.word 0xecaa900b  ! 805: STBA_R	stba	%r22, [%r10 + %r11] 0x80
	.word 0x8a52800b  ! 806: UMUL_R	umul 	%r10, %r11, %r5
	.word 0xc3f2a00b  ! 807: CASXA_R	casxa	[%r10]%asi, %r11, %r1
	.word 0x8143c000  ! 808: STBAR	stbar
	.word 0xb3daa164  ! 809: FLUSH_I	dis not found

	.word 0xcfe2a00b  ! 810: CASA_R	casa	[%r10] %asi, %r11, %r7
	.word 0x886a800b  ! 811: UDIVX_R	udivx 	%r10, %r11, %r4
	.word 0xc6ea900b  ! 812: LDSTUBA_R	ldstuba	%r3, [%r10 + %r11] 0x80
	.word 0xca82afe4  ! 813: LDUWA_I	lduwa	[%r10, + 0x0fe4] %asi, %r5
	.word 0xc3eaa96c  ! 814: PREFETCHA_I	prefetcha	[%r10, + 0x096c] %asi, #one_read
	.word 0xb84a800b  ! 815: MULX_R	mulx 	%r10, %r11, %r28
	.word 0x8143e032  ! 816: MEMBAR	membar	#StoreLoad | #Lookaside | #MemIssue 
	.word 0x8143e070  ! 817: MEMBAR	membar	#Lookaside | #MemIssue | #Sync 
	.word 0x8143e078  ! 818: MEMBAR	membar	#StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xc28aad20  ! 819: LDUBA_I	lduba	[%r10, + 0x0d20] %asi, %r1
	.word 0xf8d2ae8c  ! 820: LDSHA_I	ldsha	[%r10, + 0x0e8c] %asi, %r28
	.word 0xfe6a800b  ! 821: LDSTUB_R	ldstub	%r31, [%r10 + %r11]
	.word 0xf40a800b  ! 822: LDUB_R	ldub	[%r10 + %r11], %r26
	.word 0xc6fa900b  ! 823: SWAPA_R	swapa	%r3, [%r10 + %r11] 0x80
	.word 0xa26a800b  ! 824: UDIVX_R	udivx 	%r10, %r11, %r17
	.word 0xfeda900b  ! 825: LDXA_R	ldxa	[%r10, %r11] 0x80, %r31
	.word 0xf812a1d4  ! 826: LDUH_I	lduh	[%r10 + 0x01d4], %r28
	.word 0xf24a800b  ! 827: LDSB_R	ldsb	[%r10 + %r11], %r25
	.word 0xe66aae78  ! 828: LDSTUB_I	ldstub	%r19, [%r10 + 0x0e78]
	.word 0x24800003  ! 829: BLE	ble,a	<label_0x3>
	.word 0x26ca0001  ! 830: BRLZ	brlz,a,pt	%8,<label_0xa0001>
	.word 0x8143c000  ! 831: STBAR	stbar
	.word 0xca6a800b  ! 832: LDSTUB_R	ldstub	%r5, [%r10 + %r11]
	.word 0xc36a800b  ! 833: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0xebe2900b  ! 835: CASA_I	casa	[%r10] 0x80, %r11, %r21
	.word 0xeccaa7d4  ! 836: LDSBA_I	ldsba	[%r10, + 0x07d4] %asi, %r22
	.word 0x927aae3c  ! 837: SDIV_I	sdiv 	%r10, 0x0e3c, %r9
	.word 0xb7a289ab  ! 838: FDIVs	fdivs	%f10, %f11, %f27
	.word 0xc25a800b  ! 839: LDX_R	ldx	[%r10 + %r11], %r1
	.word 0xce4a800b  ! 840: LDSB_R	ldsb	[%r10 + %r11], %r7
	.word 0x0aca0001  ! 841: BRNZ	brnz  ,pt	%8,<label_0xa0001>
	.word 0xc722800b  ! 842: STF_R	st	%f3, [%r11, %r10]
	.word 0xaddaa2f8  ! 843: FLUSH_I	dis not found

	.word 0x8852a7d8  ! 844: UMUL_I	umul 	%r10, 0x07d8, %r4
	.word 0x8143e005  ! 845: MEMBAR	membar	#LoadLoad | #LoadStore 
	.word 0x867a800b  ! 846: SDIV_R	sdiv 	%r10, %r11, %r3
	.word 0x1c800001  ! 847: BPOS	bpos  	<label_0x1>
	.word 0xc89aa178  ! 848: LDDA_I	ldda	[%r10, + 0x0178] %asi, %r4
	.word 0x90da800b  ! 849: SMULcc_R	smulcc 	%r10, %r11, %r8
	.word 0x82daac80  ! 850: SMULcc_I	smulcc 	%r10, 0x0c80, %r1
	.word 0xc892a8ac  ! 851: LDUHA_I	lduha	[%r10, + 0x08ac] %asi, %r4
	.word 0xc36aa82c  ! 852: PREFETCH_I	prefetch	[%r10 + 0x082c], #one_read
	.word 0xafa2892b  ! 853: FMULs	fmuls	%f10, %f11, %f23
	.word 0xe33a800b  ! 854: STDF_R	std	%f17, [%r11, %r10]
	.word 0xcc1a800b  ! 855: LDD_R	ldd	[%r10 + %r11], %r6
	.word 0x87a288ab  ! 856: FSUBs	fsubs	%f10, %f11, %f3
	.word 0xe212800b  ! 857: LDUH_R	lduh	[%r10 + %r11], %r17
	.word 0x10800001  ! 858: BA	ba  	<label_0x1>
	.word 0x1a800003  ! 859: BCC	bcc  	<label_0x3>
	.word 0xc492900b  ! 860: LDUHA_R	lduha	[%r10, %r11] 0x80, %r2
	.word 0xf4b2900b  ! 861: STHA_R	stha	%r26, [%r10 + %r11] 0x80
	.word 0x8143e055  ! 862: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside | #Sync 
	.word 0x8143c000  ! 863: STBAR	stbar
	.word 0xe012800b  ! 864: LDUH_R	lduh	[%r10 + %r11], %r16
	.word 0xc8ea900b  ! 865: LDSTUBA_R	ldstuba	%r4, [%r10 + %r11] 0x80
	.word 0x8b6a800b  ! 866: SDIVX_R	sdivx	%r10, %r11, %r5
	.word 0x87daa77c  ! 867: FLUSH_I	dis not found

	.word 0xd05aaad0  ! 868: LDX_I	ldx	[%r10 + 0x0ad0], %r8
	.word 0xd09aa148  ! 869: LDDA_I	ldda	[%r10, + 0x0148] %asi, %r8
	.word 0xe2f2a5c8  ! 870: STXA_I	stxa	%r17, [%r10 + 0x05c8] %asi
	.word 0x86da800b  ! 871: SMULcc_R	smulcc 	%r10, %r11, %r3
	.word 0x82f2a788  ! 872: UDIVcc_I	udivcc 	%r10, 0x0788, %r1
	.word 0x9f22ab3c  ! 873: MULScc_I	mulscc 	%r10, 0x0b3c, %r15
	.word 0x87a289ab  ! 874: FDIVs	fdivs	%f10, %f11, %f3
	.word 0xe402af80  ! 875: LDUW_I	lduw	[%r10 + 0x0f80], %r18
	.word 0xfaea900b  ! 876: LDSTUBA_R	ldstuba	%r29, [%r10 + %r11] 0x80
	.word 0x8e52800b  ! 877: UMUL_R	umul 	%r10, %r11, %r7
	.word 0xca7aa360  ! 878: SWAP_I	swap	%r5, [%r10 + 0x0360]
	.word 0x1c800003  ! 879: BPOS	bpos  	<label_0x3>
	.word 0x9fdaa9f8  ! 880: FLUSH_I	dis not found

	.word 0xdea2a118  ! 881: STWA_I	stwa	%r15, [%r10 + 0x0118] %asi
	.word 0xc36aab10  ! 882: PREFETCH_I	prefetch	[%r10 + 0x0b10], #one_read
	.word 0xf322a49c  ! 883: STF_I	st	%f25, [0x049c, %r10]
	.word 0x91da800b  ! 884: FLUSH_R	dis not found

	.word 0x85a2892b  ! 886: FMULs	fmuls	%f10, %f11, %f2
	.word 0xb122a4c4  ! 887: MULScc_I	mulscc 	%r10, 0x04c4, %r24
	.word 0xeaf2900b  ! 888: STXA_R	stxa	%r21, [%r10 + %r11] 0x80
	.word 0xca8a900b  ! 890: LDUBA_R	lduba	[%r10, %r11] 0x80, %r5
	.word 0xcc4aa10c  ! 891: LDSB_I	ldsb	[%r10 + 0x010c], %r6
	.word 0x24ca0001  ! 893: BRLEZ	brlez,a,pt	%8,<label_0xa0001>
	.word 0x34800001  ! 894: BG	bg,a	<label_0x1>
	.word 0x24800001  ! 895: BLE	ble,a	<label_0x1>
	.word 0xc68a900b  ! 897: LDUBA_R	lduba	[%r10, %r11] 0x80, %r3
	.word 0x8a6aa054  ! 898: UDIVX_I	udivx 	%r10, 0x0054, %r5
	.word 0xc3eaa864  ! 899: PREFETCHA_I	prefetcha	[%r10, + 0x0864] %asi, #one_read
	.word 0xca02a30c  ! 900: LDUW_I	lduw	[%r10 + 0x030c], %r5
	.word 0xa852800b  ! 901: UMUL_R	umul 	%r10, %r11, %r20
	.word 0x82daa238  ! 902: SMULcc_I	smulcc 	%r10, 0x0238, %r1
	.word 0x936aa280  ! 903: SDIVX_I	sdivx	%r10, 0x0280, %r9
	.word 0x8143c000  ! 904: STBAR	stbar
	.word 0x8143e013  ! 905: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside 
	.word 0x2ec20001  ! 906: BRGEZ	brgez,a,nt	%8,<label_0x20001>
	.word 0x825a800b  ! 907: SMUL_R	smul 	%r10, %r11, %r1
	.word 0xcc9aafa8  ! 908: LDDA_I	ldda	[%r10, + 0x0fa8] %asi, %r6
	.word 0xd8a2900b  ! 909: STWA_R	stwa	%r12, [%r10 + %r11] 0x80
	.word 0x30800003  ! 910: BA	ba,a	<label_0x3>
	.word 0x856a800b  ! 911: SDIVX_R	sdivx	%r10, %r11, %r2
	.word 0x8c6a800b  ! 912: UDIVX_R	udivx 	%r10, %r11, %r6
	.word 0x8722a57c  ! 913: MULScc_I	mulscc 	%r10, 0x057c, %r3
	.word 0x8c6a800b  ! 914: UDIVX_R	udivx 	%r10, %r11, %r6
	.word 0x83daaa1c  ! 915: FLUSH_I	dis not found

	.word 0xca4a800b  ! 916: LDSB_R	ldsb	[%r10 + %r11], %r5
	.word 0x2c800001  ! 917: BNEG	bneg,a	<label_0x1>
	.word 0x83daa5b8  ! 918: FLUSH_I	dis not found

	.word 0xcb3a800b  ! 919: STDF_R	std	%f5, [%r11, %r10]
	.word 0x87daa67c  ! 920: FLUSH_I	dis not found

	.word 0x8bdaa190  ! 921: FLUSH_I	dis not found

	.word 0xc3ea900b  ! 922: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0x32800001  ! 923: BNE	bne,a	<label_0x1>
	.word 0xd012800b  ! 924: LDUH_R	lduh	[%r10 + %r11], %r8
	.word 0xb122800b  ! 925: MULScc_R	mulscc 	%r10, %r11, %r24
	.word 0xecaa900b  ! 926: STBA_R	stba	%r22, [%r10 + %r11] 0x80
	.word 0xb1da800b  ! 927: FLUSH_R	dis not found

	.word 0x8272a78c  ! 928: UDIV_I	udiv 	%r10, 0x078c, %r1
	.word 0x8143c000  ! 929: STBAR	stbar
	.word 0xfe52800b  ! 930: LDSH_R	ldsh	[%r10 + %r11], %r31
	.word 0xe0fa900b  ! 931: SWAPA_R	swapa	%r16, [%r10 + %r11] 0x80
	.word 0x88f2800b  ! 933: UDIVcc_R	udivcc 	%r10, %r11, %r4
	.word 0xaddaabc4  ! 934: FLUSH_I	dis not found

	.word 0xc6c2900b  ! 935: LDSWA_R	ldswa	[%r10, %r11] 0x80, %r3
	.word 0xe6aa900b  ! 936: STBA_R	stba	%r19, [%r10 + %r11] 0x80
	.word 0x8143e06a  ! 937: MEMBAR	membar	#StoreLoad | #StoreStore | #MemIssue | #Sync 
	.word 0xc36aaba4  ! 938: PREFETCH_I	prefetch	[%r10 + 0x0ba4], #one_read
	.word 0xc8ca900b  ! 939: LDSBA_R	ldsba	[%r10, %r11] 0x80, %r4
	.word 0xcc9a900b  ! 941: LDDA_R	ldda	[%r10, %r11] 0x80, %r6
	.word 0xee12800b  ! 942: LDUH_R	lduh	[%r10 + %r11], %r23
	.word 0xcac2a638  ! 943: LDSWA_I	ldswa	[%r10, + 0x0638] %asi, %r5
	.word 0xafdaacf4  ! 944: FLUSH_I	dis not found

	.word 0x9a72800b  ! 945: UDIV_R	udiv 	%r10, %r11, %r13
	.word 0xc8ba900b  ! 946: STDA_R	stda	%r4, [%r10 + %r11] 0x80
	.word 0xe81aa770  ! 947: LDD_I	ldd	[%r10 + 0x0770], %r20
	.word 0x00800003  ! 948: BN	bn  	<label_0x3>
	.word 0xbef2800b  ! 949: UDIVcc_R	udivcc 	%r10, %r11, %r31
	.word 0x8a5a800b  ! 950: SMUL_R	smul 	%r10, %r11, %r5
	.word 0x8143c000  ! 951: STBAR	stbar
	.word 0xc3eaa3c4  ! 952: PREFETCHA_I	prefetcha	[%r10, + 0x03c4] %asi, #one_read
	.word 0xa36a800b  ! 953: SDIVX_R	sdivx	%r10, %r11, %r17
	.word 0x8522a9f4  ! 954: MULScc_I	mulscc 	%r10, 0x09f4, %r2
	.word 0xf27a800b  ! 955: SWAP_R	swap	%r25, [%r10 + %r11]
	.word 0xc482ab9c  ! 956: LDUWA_I	lduwa	[%r10, + 0x0b9c] %asi, %r2
	.word 0x8e6aa4b0  ! 957: UDIVX_I	udivx 	%r10, 0x04b0, %r7
	.word 0x92da800b  ! 958: SMULcc_R	smulcc 	%r10, %r11, %r9
	.word 0x87a2882b  ! 959: FADDs	fadds	%f10, %f11, %f3
	.word 0x8e5a800b  ! 960: SMUL_R	smul 	%r10, %r11, %r7
	.word 0xe2b2900b  ! 961: STHA_R	stha	%r17, [%r10 + %r11] 0x80
	.word 0x8cd2af5c  ! 962: UMULcc_I	umulcc 	%r10, 0x0f5c, %r6
	.word 0x8143e04c  ! 963: MEMBAR	membar	#LoadStore | #StoreStore | #Sync 
	.word 0xbdda800b  ! 964: FLUSH_R	dis not found

	.word 0x8872800b  ! 965: UDIV_R	udiv 	%r10, %r11, %r4
	.word 0x8143c000  ! 966: STBAR	stbar
	.word 0x996aac4c  ! 967: SDIVX_I	sdivx	%r10, 0x0c4c, %r12
	.word 0x8143c000  ! 968: STBAR	stbar
	.word 0x8672800b  ! 969: UDIV_R	udiv 	%r10, %r11, %r3
	.word 0xc24aafe4  ! 970: LDSB_I	ldsb	[%r10 + 0x0fe4], %r1
	.word 0xc3eaa9f0  ! 971: PREFETCHA_I	prefetcha	[%r10, + 0x09f0] %asi, #one_read
	.word 0x85a2882b  ! 972: FADDs	fadds	%f10, %f11, %f2
	.word 0xc692aa5c  ! 973: LDUHA_I	lduha	[%r10, + 0x0a5c] %asi, %r3
	.word 0xdc12a160  ! 974: LDUH_I	lduh	[%r10 + 0x0160], %r14
	.word 0xa4daadb0  ! 975: SMULcc_I	smulcc 	%r10, 0x0db0, %r18
	.word 0xc4aa900b  ! 976: STBA_R	stba	%r2, [%r10 + %r11] 0x80
	.word 0xeafa900b  ! 977: SWAPA_R	swapa	%r21, [%r10 + %r11] 0x80
	.word 0xc4baa578  ! 978: STDA_I	stda	%r2, [%r10 + 0x0578] %asi
	.word 0x92da800b  ! 979: SMULcc_R	smulcc 	%r10, %r11, %r9
	.word 0xdf22800b  ! 980: STF_R	st	%f15, [%r11, %r10]
	.word 0xf2fa900b  ! 981: SWAPA_R	swapa	%r25, [%r10 + %r11] 0x80
	.word 0x87a2892b  ! 982: FMULs	fmuls	%f10, %f11, %f3
	.word 0xc3eaaafc  ! 983: PREFETCHA_I	prefetcha	[%r10, + 0x0afc] %asi, #one_read
	.word 0x0c800003  ! 984: BNEG	bneg  	<label_0x3>
	.word 0xc25aa680  ! 985: LDX_I	ldx	[%r10 + 0x0680], %r1
	.word 0x8143c000  ! 986: STBAR	stbar
	.word 0xf73aa228  ! 987: STDF_I	std	%f27, [0x0228, %r10]
	.word 0x93da800b  ! 988: FLUSH_R	dis not found

	.word 0xc8baab10  ! 989: STDA_I	stda	%r4, [%r10 + 0x0b10] %asi
	.word 0xb1da800b  ! 990: FLUSH_R	dis not found

	.word 0x83daa5a4  ! 991: FLUSH_I	dis not found

	.word 0xc4ea900b  ! 992: LDSTUBA_R	ldstuba	%r2, [%r10 + %r11] 0x80
	.word 0xce82900b  ! 993: LDUWA_R	lduwa	[%r10, %r11] 0x80, %r7
	.word 0xe2ca900b  ! 994: LDSBA_R	ldsba	[%r10, %r11] 0x80, %r17
	.word 0xc3eaa140  ! 995: PREFETCHA_I	prefetcha	[%r10, + 0x0140] %asi, #one_read
	.word 0xc4b2900b  ! 996: STHA_R	stha	%r2, [%r10 + %r11] 0x80
	.word 0xe13a800b  ! 997: STDF_R	std	%f16, [%r11, %r10]
	.word 0x26c20001  ! 998: BRLZ	brlz,a,nt	%8,<label_0x20001>
	.word 0xc882a234  ! 999: LDUWA_I	lduwa	[%r10, + 0x0234] %asi, %r4
	nop
	nop
	nop
        ta      T_GOOD_TRAP
th_main_2:
        setx  MAIN_BASE_DATA_VA, %r1, %r10
        setx  0x0000000000000dd0, %g1, %r11
        setx  0x80, %g2, %g1
        wr  %g1, %g0, %asi
	    rd %fprs, %g1
        wr %g1, 0x4, %fprs
	ldd	[%r10 + 0], %f0
	ldd	[%r10 + 8], %f2
	ldd	[%r10 + 16], %f4
	ldd	[%r10 + 24], %f6
	ldd	[%r10 + 32], %f8
	ldd	[%r10 + 40], %f10
	ldd	[%r10 + 48], %f12
	ldd	[%r10 + 56], %f14
	ldd	[%r10 + 64], %f16
	ldd	[%r10 + 72], %f18
	ldd	[%r10 + 80], %f20
	ldd	[%r10 + 88], %f22
	ldd	[%r10 + 96], %f24
	ldd	[%r10 + 104], %f26
	ldd	[%r10 + 112], %f28
	ldd	[%r10 + 120], %f30
	ldd	[%r10 + 128], %f32
	ldd	[%r10 + 136], %f34
	ldd	[%r10 + 144], %f36
	ldd	[%r10 + 152], %f38
	ldd	[%r10 + 160], %f40
	ldd	[%r10 + 168], %f42
	ldd	[%r10 + 176], %f44
	ldd	[%r10 + 184], %f46
	ldd	[%r10 + 192], %f48
	ldd	[%r10 + 200], %f50
	ldd	[%r10 + 208], %f52
	ldd	[%r10 + 216], %f54
	ldd	[%r10 + 224], %f56
	ldd	[%r10 + 232], %f58
	ldd	[%r10 + 240], %f60
	ldd	[%r10 + 248], %f62
        setx  0x2cc3ca1e8a31ceee, %g1, %r0
        setx  0x60d0aed2c84f4f29, %g1, %r1
        setx  0x5f39ac28611f3b44, %g1, %r2
        setx  0x0a8b81462c50f867, %g1, %r3
        setx  0x6ee6fdbf856f5d9e, %g1, %r4
        setx  0x66b2464b11825a33, %g1, %r5
        setx  0x329911b352b7c1a3, %g1, %r6
        setx  0xf2723ec3e74d7d37, %g1, %r7
        setx  0x0281b86feb7c74d1, %g1, %r8
        setx  0xc836a16b60e1ac43, %g1, %r9
        setx  0x58350b4c34d88bac, %g1, %r12
        setx  0xc05ddb8840e2c39c, %g1, %r13
        setx  0x282bef1c0a8b8c54, %g1, %r14
        setx  0xb29397aaf0b53cca, %g1, %r15
        setx  0x190ea253b422d126, %g1, %r16
        setx  0x50e7f316effa1681, %g1, %r17
        setx  0x25a3a7eede236cfe, %g1, %r18
        setx  0x1267be4fae4348ab, %g1, %r19
        setx  0x7e2623cf81ce7518, %g1, %r20
        setx  0xe59a3b999c5ca39d, %g1, %r21
        setx  0x16ba08d64e26dc0c, %g1, %r22
        setx  0x4c5e005de7a3a0a1, %g1, %r23
        setx  0xa5b5a81f50a947b1, %g1, %r24
        setx  0xdf561a45a722106d, %g1, %r25
        setx  0xf52ed96aeb751d6d, %g1, %r26
        setx  0x7c8fbabefd070ab2, %g1, %r27
        setx  0xff15e25dbe91b803, %g1, %r28
        setx  0x67c505196e1e5257, %g1, %r29
        setx  0xbaa7f18456f8cedf, %g1, %r30
        setx  0x12a08c2c3fc82dd1, %g1, %r31
	.word 0x8143e013  ! 6: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside 
	.word 0xecb2900b  ! 7: STHA_R	stha	%r22, [%r10 + %r11] 0x80
	.word 0x8672a848  ! 9: UDIV_I	udiv 	%r10, 0x0848, %r3
	.word 0xcb3a800b  ! 11: STDF_R	std	%f5, [%r11, %r10]
	.word 0xe33aa360  ! 12: STDF_I	std	%f17, [0x0360, %r10]
	.word 0x8652a5d0  ! 13: UMUL_I	umul 	%r10, 0x05d0, %r3
	.word 0xc452a8cc  ! 14: LDSH_I	ldsh	[%r10 + 0x08cc], %r2
	.word 0xe49aa648  ! 15: LDDA_I	ldda	[%r10, + 0x0648] %asi, %r18
	.word 0xc41aa538  ! 17: LDD_I	ldd	[%r10 + 0x0538], %r2
	.word 0x89a2882b  ! 18: FADDs	fadds	%f10, %f11, %f4
	.word 0xdf22800b  ! 19: STF_R	st	%f15, [%r11, %r10]
	.word 0xc36aac50  ! 20: PREFETCH_I	prefetch	[%r10 + 0x0c50], #one_read
	.word 0xb472800b  ! 21: UDIV_R	udiv 	%r10, %r11, %r26
	.word 0xca7aaf1c  ! 22: SWAP_I	swap	%r5, [%r10 + 0x0f1c]
	.word 0xcb3aa198  ! 23: STDF_I	std	%f5, [0x0198, %r10]
	.word 0xc6aa900b  ! 24: STBA_R	stba	%r3, [%r10 + %r11] 0x80
	.word 0xc842800b  ! 25: LDSW_R	ldsw	[%r10 + %r11], %r4
	.word 0x2ec20001  ! 27: BRGEZ	brgez,a,nt	%8,<label_0x20001>
	.word 0xc4ca900b  ! 28: LDSBA_R	ldsba	[%r10, %r11] 0x80, %r2
	.word 0xc6f2abe8  ! 29: STXA_I	stxa	%r3, [%r10 + 0x0be8] %asi
	.word 0xb6d2a624  ! 30: UMULcc_I	umulcc 	%r10, 0x0624, %r27
	.word 0xcecaada4  ! 31: LDSBA_I	ldsba	[%r10, + 0x0da4] %asi, %r7
	.word 0xfcba900b  ! 32: STDA_R	stda	%r30, [%r10 + %r11] 0x80
	.word 0xd322ad7c  ! 33: STF_I	st	%f9, [0x0d7c, %r10]
	.word 0xa1da800b  ! 34: FLUSH_R	dis not found

	.word 0xc6da900b  ! 35: LDXA_R	ldxa	[%r10, %r11] 0x80, %r3
	.word 0xea92a928  ! 36: LDUHA_I	lduha	[%r10, + 0x0928] %asi, %r21
	.word 0x825aaba0  ! 37: SMUL_I	smul 	%r10, 0x0ba0, %r1
	.word 0x0c800001  ! 38: BNEG	bneg  	<label_0x1>
	.word 0xd8aa900b  ! 39: STBA_R	stba	%r12, [%r10 + %r11] 0x80
	.word 0x8fda800b  ! 40: FLUSH_R	dis not found

	.word 0xa86aa9c0  ! 41: UDIVX_I	udivx 	%r10, 0x09c0, %r20
	.word 0x04ca0001  ! 42: BRLEZ	brlez  ,pt	%8,<label_0xa0001>
	.word 0x8adaa8dc  ! 43: SMULcc_I	smulcc 	%r10, 0x08dc, %r5
	.word 0xd0fa900b  ! 44: SWAPA_R	swapa	%r8, [%r10 + %r11] 0x80
	.word 0xcc0a800b  ! 45: LDUB_R	ldub	[%r10 + %r11], %r6
	.word 0xcceaa9e8  ! 46: LDSTUBA_I	ldstuba	%r6, [%r10 + 0x09e8] %asi
	.word 0x87da800b  ! 47: FLUSH_R	dis not found

	.word 0x8452abbc  ! 48: UMUL_I	umul 	%r10, 0x0bbc, %r2
	.word 0xa24aa414  ! 49: MULX_I	mulx 	%r10, 0x0414, %r17
	.word 0xcf22a06c  ! 50: STF_I	st	%f7, [0x006c, %r10]
	.word 0xf6aa900b  ! 51: STBA_R	stba	%r27, [%r10 + %r11] 0x80
	.word 0xe6fa900b  ! 52: SWAPA_R	swapa	%r19, [%r10 + %r11] 0x80
	.word 0xd01aaab0  ! 53: LDD_I	ldd	[%r10 + 0x0ab0], %r8
	.word 0xc36a800b  ! 54: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x8143e02c  ! 55: MEMBAR	membar	#LoadStore | #StoreStore | #MemIssue 
	.word 0xcedaab18  ! 56: LDXA_I	ldxa	[%r10, + 0x0b18] %asi, %r7
	.word 0xfeea900b  ! 57: LDSTUBA_R	ldstuba	%r31, [%r10 + %r11] 0x80
	.word 0xe3f2a00b  ! 58: CASXA_R	casxa	[%r10]%asi, %r11, %r17
	.word 0x93daa11c  ! 59: FLUSH_I	dis not found

	.word 0xc6f2900b  ! 60: STXA_R	stxa	%r3, [%r10 + %r11] 0x80
	.word 0x8143e003  ! 61: MEMBAR	membar	#LoadLoad | #StoreLoad 
	.word 0xd8faa0e8  ! 62: SWAPA_I	swapa	%r12, [%r10 + 0x00e8] %asi
	.word 0xce12a3b8  ! 63: LDUH_I	lduh	[%r10 + 0x03b8], %r7
	.word 0x8143c000  ! 64: STBAR	stbar
	.word 0xca42a990  ! 65: LDSW_I	ldsw	[%r10 + 0x0990], %r5
	.word 0x8a4aa714  ! 66: MULX_I	mulx 	%r10, 0x0714, %r5
	.word 0xc5e2900b  ! 67: CASA_I	casa	[%r10] 0x80, %r11, %r2
	.word 0xc36a800b  ! 68: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x92d2afa4  ! 69: UMULcc_I	umulcc 	%r10, 0x0fa4, %r9
	.word 0xe2fa900b  ! 70: SWAPA_R	swapa	%r17, [%r10 + %r11] 0x80
	.word 0xd322800b  ! 71: STF_R	st	%f9, [%r11, %r10]
	.word 0x84da800b  ! 72: SMULcc_R	smulcc 	%r10, %r11, %r2
	.word 0xca42800b  ! 73: LDSW_R	ldsw	[%r10 + %r11], %r5
	.word 0xe122800b  ! 74: STF_R	st	%f16, [%r11, %r10]
	.word 0xcedaa760  ! 75: LDXA_I	ldxa	[%r10, + 0x0760] %asi, %r7
	.word 0x8143c000  ! 76: STBAR	stbar
	.word 0x8ddaa9c4  ! 77: FLUSH_I	dis not found

	.word 0x83a2892b  ! 78: FMULs	fmuls	%f10, %f11, %f1
	.word 0xc20aac9c  ! 79: LDUB_I	ldub	[%r10 + 0x0c9c], %r1
	.word 0xc3eaaae8  ! 80: PREFETCHA_I	prefetcha	[%r10, + 0x0ae8] %asi, #one_read
	.word 0x936a800b  ! 81: SDIVX_R	sdivx	%r10, %r11, %r9
	.word 0xcc12ac70  ! 82: LDUH_I	lduh	[%r10 + 0x0c70], %r6
	.word 0xd20aaddc  ! 83: LDUB_I	ldub	[%r10 + 0x0ddc], %r9
	.word 0xc86a800b  ! 84: LDSTUB_R	ldstub	%r4, [%r10 + %r11]
	.word 0xfc92900b  ! 86: LDUHA_R	lduha	[%r10, %r11] 0x80, %r30
	.word 0xc442800b  ! 87: LDSW_R	ldsw	[%r10 + %r11], %r2
	.word 0x8143c000  ! 88: STBAR	stbar
	.word 0xc89a900b  ! 89: LDDA_R	ldda	[%r10, %r11] 0x80, %r4
	.word 0xd01aa6a0  ! 90: LDD_I	ldd	[%r10 + 0x06a0], %r8
	.word 0xcde2900b  ! 91: CASA_I	casa	[%r10] 0x80, %r11, %r6
	.word 0xce0a800b  ! 92: LDUB_R	ldub	[%r10 + %r11], %r7
	.word 0xc36a800b  ! 93: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0xb7da800b  ! 94: FLUSH_R	dis not found

	.word 0xd322ab34  ! 95: STF_I	st	%f9, [0x0b34, %r10]
	.word 0x04800003  ! 96: BLE	ble  	<label_0x3>
	.word 0xf2d2900b  ! 97: LDSHA_R	ldsha	[%r10, %r11] 0x80, %r25
	.word 0xe8ba900b  ! 98: STDA_R	stda	%r20, [%r10 + %r11] 0x80
	.word 0x0c800003  ! 99: BNEG	bneg  	<label_0x3>
	.word 0x8143e048  ! 100: MEMBAR	membar	#StoreStore | #Sync 
	.word 0x08800003  ! 101: BLEU	bleu  	<label_0x3>
	.word 0x84da800b  ! 103: SMULcc_R	smulcc 	%r10, %r11, %r2
	.word 0x844a800b  ! 104: MULX_R	mulx 	%r10, %r11, %r2
	.word 0x8fda800b  ! 105: FLUSH_R	dis not found

	.word 0x3c800001  ! 106: BPOS	bpos,a	<label_0x1>
	.word 0x8143e00c  ! 107: MEMBAR	membar	#LoadStore | #StoreStore 
	.word 0x99da800b  ! 108: FLUSH_R	dis not found

	.word 0x20800001  ! 109: BN	bn,a	<label_0x1>
	.word 0x9fda800b  ! 110: FLUSH_R	dis not found

	.word 0x8b6aaf84  ! 111: SDIVX_I	sdivx	%r10, 0x0f84, %r5
	.word 0x89da800b  ! 112: FLUSH_R	dis not found

	.word 0xc36aaca0  ! 113: PREFETCH_I	prefetch	[%r10 + 0x0ca0], #one_read
	.word 0xe0baa7a8  ! 114: STDA_I	stda	%r16, [%r10 + 0x07a8] %asi
	.word 0xe692a42c  ! 115: LDUHA_I	lduha	[%r10, + 0x042c] %asi, %r19
	.word 0x8ddaa378  ! 116: FLUSH_I	dis not found

	.word 0xd3f2900b  ! 117: CASXA_I	casxa	[%r10] 0x80, %r11, %r9
	.word 0x9a7a800b  ! 118: SDIV_R	sdiv 	%r10, %r11, %r13
	.word 0x82fa800b  ! 119: SDIVcc_R	sdivcc 	%r10, %r11, %r1
	.word 0xcd22800b  ! 120: STF_R	st	%f6, [%r11, %r10]
	.word 0xab6a800b  ! 121: SDIVX_R	sdivx	%r10, %r11, %r21
	.word 0xafa289ab  ! 122: FDIVs	fdivs	%f10, %f11, %f23
	.word 0x16800001  ! 123: BGE	bge  	<label_0x1>
	.word 0xbddaae10  ! 124: FLUSH_I	dis not found

	.word 0xf2aaa174  ! 125: STBA_I	stba	%r25, [%r10 + 0x0174] %asi
	.word 0xc3eaaf80  ! 126: PREFETCHA_I	prefetcha	[%r10, + 0x0f80] %asi, #one_read
	.word 0xca92900b  ! 128: LDUHA_R	lduha	[%r10, %r11] 0x80, %r5
	.word 0xb4f2800b  ! 129: UDIVcc_R	udivcc 	%r10, %r11, %r26
	.word 0x8c6aa2a4  ! 130: UDIVX_I	udivx 	%r10, 0x02a4, %r6
	.word 0x8fda800b  ! 131: FLUSH_R	dis not found

	.word 0xe48a900b  ! 132: LDUBA_R	lduba	[%r10, %r11] 0x80, %r18
	.word 0x10800001  ! 133: BA	ba  	<label_0x1>
	.word 0x8a72a630  ! 134: UDIV_I	udiv 	%r10, 0x0630, %r5
	.word 0x8f22a460  ! 135: MULScc_I	mulscc 	%r10, 0x0460, %r7
	.word 0xcaf2900b  ! 136: STXA_R	stxa	%r5, [%r10 + %r11] 0x80
	.word 0xce42800b  ! 137: LDSW_R	ldsw	[%r10 + %r11], %r7
	.word 0x82f2800b  ! 138: UDIVcc_R	udivcc 	%r10, %r11, %r1
	.word 0x9fdaaf24  ! 139: FLUSH_I	dis not found

	.word 0xddf2900b  ! 140: CASXA_I	casxa	[%r10] 0x80, %r11, %r14
	.word 0x83a288ab  ! 141: FSUBs	fsubs	%f10, %f11, %f1
	.word 0xd282900b  ! 142: LDUWA_R	lduwa	[%r10, %r11] 0x80, %r9
	.word 0x8ba2882b  ! 143: FADDs	fadds	%f10, %f11, %f5
	.word 0xee52800b  ! 144: LDSH_R	ldsh	[%r10 + %r11], %r23
	.word 0x8143c000  ! 145: STBAR	stbar
	.word 0xc922800b  ! 146: STF_R	st	%f4, [%r11, %r10]
	.word 0xcc1a800b  ! 147: LDD_R	ldd	[%r10 + %r11], %r6
	.word 0xe4c2900b  ! 148: LDSWA_R	ldswa	[%r10, %r11] 0x80, %r18
	.word 0x08800003  ! 149: BLEU	bleu  	<label_0x3>
	.word 0xafda800b  ! 150: FLUSH_R	dis not found

	.word 0x864a800b  ! 151: MULX_R	mulx 	%r10, %r11, %r3
	.word 0x91a2892b  ! 152: FMULs	fmuls	%f10, %f11, %f8
	.word 0xd13a800b  ! 153: STDF_R	std	%f8, [%r11, %r10]
	.word 0x8143e031  ! 154: MEMBAR	membar	#LoadLoad | #Lookaside | #MemIssue 
	.word 0x8252800b  ! 155: UMUL_R	umul 	%r10, %r11, %r1
	.word 0xf8d2900b  ! 156: LDSHA_R	ldsha	[%r10, %r11] 0x80, %r28
	.word 0x9cfa800b  ! 157: SDIVcc_R	sdivcc 	%r10, %r11, %r14
	.word 0xc4c2900b  ! 158: LDSWA_R	ldswa	[%r10, %r11] 0x80, %r2
	.word 0xc36a800b  ! 159: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x24800003  ! 160: BLE	ble,a	<label_0x3>
	.word 0x9a7a800b  ! 161: SDIV_R	sdiv 	%r10, %r11, %r13
	.word 0xbf22af20  ! 162: MULScc_I	mulscc 	%r10, 0x0f20, %r31
	.word 0x93da800b  ! 163: FLUSH_R	dis not found

	.word 0x9bda800b  ! 164: FLUSH_R	dis not found

	.word 0xd26aa548  ! 165: LDSTUB_I	ldstub	%r9, [%r10 + 0x0548]
	.word 0xce42af68  ! 166: LDSW_I	ldsw	[%r10 + 0x0f68], %r7
	.word 0x06c20001  ! 167: BRLZ	brlz  ,nt	%8,<label_0x20001>
	.word 0xc73aad58  ! 168: STDF_I	std	%f3, [0x0d58, %r10]
	.word 0x9fdaa7e4  ! 169: FLUSH_I	dis not found

	.word 0x02c20001  ! 170: BRZ	brz  ,nt	%8,<label_0x20001>
	.word 0xc252af4c  ! 171: LDSH_I	ldsh	[%r10 + 0x0f4c], %r1
	.word 0xc8fa900b  ! 172: SWAPA_R	swapa	%r4, [%r10 + %r11] 0x80
	.word 0x2c800001  ! 173: BNEG	bneg,a	<label_0x1>
	.word 0xce12800b  ! 174: LDUH_R	lduh	[%r10 + %r11], %r7
	.word 0xe6a2ae60  ! 175: STWA_I	stwa	%r19, [%r10 + 0x0e60] %asi
	.word 0xc3ea900b  ! 176: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0x24c20003  ! 177: BRLEZ	brlez,a,nt	%8,<label_0x20003>
	.word 0xf07a800b  ! 178: SWAP_R	swap	%r24, [%r10 + %r11]
	.word 0xce7a800b  ! 179: SWAP_R	swap	%r7, [%r10 + %r11]
	.word 0x8a4a800b  ! 180: MULX_R	mulx 	%r10, %r11, %r5
	.word 0x8a7aafc4  ! 181: SDIV_I	sdiv 	%r10, 0x0fc4, %r5
	.word 0xcb3aaad0  ! 182: STDF_I	std	%f5, [0x0ad0, %r10]
	.word 0xc8ba900b  ! 183: STDA_R	stda	%r4, [%r10 + %r11] 0x80
	.word 0xccaa900b  ! 184: STBA_R	stba	%r6, [%r10 + %r11] 0x80
	.word 0xc5f2a00b  ! 186: CASXA_R	casxa	[%r10]%asi, %r11, %r2
	.word 0x22ca0001  ! 187: BRZ	brz,a,pt	%8,<label_0xa0001>
	.word 0xa1da800b  ! 188: FLUSH_R	dis not found

	.word 0xa4da800b  ! 189: SMULcc_R	smulcc 	%r10, %r11, %r18
	.word 0xd122a7a0  ! 190: STF_I	st	%f8, [0x07a0, %r10]
	.word 0xccd2a7c4  ! 191: LDSHA_I	ldsha	[%r10, + 0x07c4] %asi, %r6
	.word 0xc4f2900b  ! 192: STXA_R	stxa	%r2, [%r10 + %r11] 0x80
	.word 0xa06a800b  ! 193: UDIVX_R	udivx 	%r10, %r11, %r16
	.word 0xfc4a800b  ! 194: LDSB_R	ldsb	[%r10 + %r11], %r30
	.word 0xc9e2900b  ! 195: CASA_I	casa	[%r10] 0x80, %r11, %r4
	.word 0x8143c000  ! 196: STBAR	stbar
	.word 0xd05a800b  ! 197: LDX_R	ldx	[%r10 + %r11], %r8
	.word 0xd2d2a13c  ! 198: LDSHA_I	ldsha	[%r10, + 0x013c] %asi, %r9
	.word 0xe08aa9d0  ! 199: LDUBA_I	lduba	[%r10, + 0x09d0] %asi, %r16
	.word 0x34800003  ! 200: BG	bg,a	<label_0x3>
	.word 0xeaaa900b  ! 201: STBA_R	stba	%r21, [%r10 + %r11] 0x80
	.word 0xd1e2900b  ! 202: CASA_I	casa	[%r10] 0x80, %r11, %r8
	.word 0x99daadfc  ! 203: FLUSH_I	dis not found

	.word 0xc2c2900b  ! 204: LDSWA_R	ldswa	[%r10, %r11] 0x80, %r1
	.word 0xcaaaaed0  ! 205: STBA_I	stba	%r5, [%r10 + 0x0ed0] %asi
	.word 0xc3ea900b  ! 206: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0x8922a608  ! 208: MULScc_I	mulscc 	%r10, 0x0608, %r4
	.word 0xcc7a800b  ! 209: SWAP_R	swap	%r6, [%r10 + %r11]
	.word 0xf0d2a814  ! 210: LDSHA_I	ldsha	[%r10, + 0x0814] %asi, %r24
	.word 0xc6d2a914  ! 211: LDSHA_I	ldsha	[%r10, + 0x0914] %asi, %r3
	.word 0xc8baa9f0  ! 212: STDA_I	stda	%r4, [%r10 + 0x09f0] %asi
	.word 0xca4aacc4  ! 213: LDSB_I	ldsb	[%r10 + 0x0cc4], %r5
	.word 0x8143e024  ! 214: MEMBAR	membar	#LoadStore | #MemIssue 
	.word 0x85da800b  ! 215: FLUSH_R	dis not found

	.word 0xd28a900b  ! 216: LDUBA_R	lduba	[%r10, %r11] 0x80, %r9
	.word 0x9ddaa53c  ! 217: FLUSH_I	dis not found

	.word 0xf6aaae58  ! 218: STBA_I	stba	%r27, [%r10 + 0x0e58] %asi
	.word 0x87daab24  ! 219: FLUSH_I	dis not found

	.word 0xc36aa128  ! 220: PREFETCH_I	prefetch	[%r10 + 0x0128], #one_read
	.word 0x84f2a48c  ! 221: UDIVcc_I	udivcc 	%r10, 0x048c, %r2
	.word 0xc8b2a7d8  ! 222: STHA_I	stha	%r4, [%r10 + 0x07d8] %asi
	.word 0xabdaa914  ! 223: FLUSH_I	dis not found

	.word 0xccda900b  ! 224: LDXA_R	ldxa	[%r10, %r11] 0x80, %r6
	.word 0xb922800b  ! 225: MULScc_R	mulscc 	%r10, %r11, %r28
	.word 0x8bdaa4a0  ! 226: FLUSH_I	dis not found

	.word 0x85a288ab  ! 227: FSUBs	fsubs	%f10, %f11, %f2
	.word 0x927aaef4  ! 228: SDIV_I	sdiv 	%r10, 0x0ef4, %r9
	.word 0xfa92900b  ! 229: LDUHA_R	lduha	[%r10, %r11] 0x80, %r29
	.word 0xfaaa900b  ! 230: STBA_R	stba	%r29, [%r10 + %r11] 0x80
	.word 0xc9f2900b  ! 231: CASXA_I	casxa	[%r10] 0x80, %r11, %r4
	.word 0xf2f2900b  ! 232: STXA_R	stxa	%r25, [%r10 + %r11] 0x80
	.word 0x92f2a2a8  ! 233: UDIVcc_I	udivcc 	%r10, 0x02a8, %r9
	.word 0x8ba2882b  ! 234: FADDs	fadds	%f10, %f11, %f5
	.word 0x836aaf50  ! 235: SDIVX_I	sdivx	%r10, 0x0f50, %r1
	.word 0xc36aa3c8  ! 236: PREFETCH_I	prefetch	[%r10 + 0x03c8], #one_read
	.word 0xb9daa380  ! 237: FLUSH_I	dis not found

	.word 0xd25aa4d0  ! 238: LDX_I	ldx	[%r10 + 0x04d0], %r9
	.word 0xca92900b  ! 239: LDUHA_R	lduha	[%r10, %r11] 0x80, %r5
	.word 0xc4d2a6b0  ! 240: LDSHA_I	ldsha	[%r10, + 0x06b0] %asi, %r2
	.word 0x14800003  ! 241: BG	bg  	<label_0x3>
	.word 0x82f2800b  ! 242: UDIVcc_R	udivcc 	%r10, %r11, %r1
	.word 0xe49a900b  ! 243: LDDA_R	ldda	[%r10, %r11] 0x80, %r18
	.word 0xc7e2900b  ! 244: CASA_I	casa	[%r10] 0x80, %r11, %r3
	.word 0x0c800003  ! 246: BNEG	bneg  	<label_0x3>
	.word 0xc682900b  ! 248: LDUWA_R	lduwa	[%r10, %r11] 0x80, %r3
	.word 0x825a800b  ! 249: SMUL_R	smul 	%r10, %r11, %r1
	.word 0x8143e075  ! 250: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside | #MemIssue | #Sync 
	.word 0x8d6a800b  ! 251: SDIVX_R	sdivx	%r10, %r11, %r6
	.word 0x8143e07b  ! 252: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0x8e5aa884  ! 253: SMUL_I	smul 	%r10, 0x0884, %r7
	.word 0xc3ea900b  ! 254: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0xdaf2900b  ! 255: STXA_R	stxa	%r13, [%r10 + %r11] 0x80
	.word 0x906aa76c  ! 256: UDIVX_I	udivx 	%r10, 0x076c, %r8
	.word 0x16800003  ! 257: BGE	bge  	<label_0x3>
	.word 0xf24aafc8  ! 258: LDSB_I	ldsb	[%r10 + 0x0fc8], %r25
	.word 0x8fa288ab  ! 259: FSUBs	fsubs	%f10, %f11, %f7
	.word 0x8f22a91c  ! 260: MULScc_I	mulscc 	%r10, 0x091c, %r7
	.word 0xfccaa504  ! 261: LDSBA_I	ldsba	[%r10, + 0x0504] %asi, %r30
	.word 0xf0ea900b  ! 262: LDSTUBA_R	ldstuba	%r24, [%r10 + %r11] 0x80
	.word 0x8143c000  ! 263: STBAR	stbar
	.word 0xc9f2a00b  ! 264: CASXA_R	casxa	[%r10]%asi, %r11, %r4
	.word 0x83da800b  ! 265: FLUSH_R	dis not found

	.word 0xabda800b  ! 266: FLUSH_R	dis not found

	.word 0x90f2800b  ! 267: UDIVcc_R	udivcc 	%r10, %r11, %r8
	.word 0xd2f2900b  ! 268: STXA_R	stxa	%r9, [%r10 + %r11] 0x80
	.word 0xc2da900b  ! 269: LDXA_R	ldxa	[%r10, %r11] 0x80, %r1
	.word 0x8143c000  ! 270: STBAR	stbar
	.word 0xfca2a1cc  ! 271: STWA_I	stwa	%r30, [%r10 + 0x01cc] %asi
	.word 0xe3f2900b  ! 272: CASXA_I	casxa	[%r10] 0x80, %r11, %r17
	.word 0xd09aa058  ! 273: LDDA_I	ldda	[%r10, + 0x0058] %asi, %r8
	.word 0xc65aa768  ! 274: LDX_I	ldx	[%r10 + 0x0768], %r3
	.word 0xffe2a00b  ! 275: CASA_R	casa	[%r10] %asi, %r11, %r31
	.word 0xce92900b  ! 276: LDUHA_R	lduha	[%r10, %r11] 0x80, %r7
	.word 0xcb22800b  ! 277: STF_R	st	%f5, [%r11, %r10]
	.word 0x856aaaec  ! 278: SDIVX_I	sdivx	%r10, 0x0aec, %r2
	.word 0x8143e047  ! 279: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Sync 
	.word 0xc6da900b  ! 280: LDXA_R	ldxa	[%r10, %r11] 0x80, %r3
	.word 0x8143c000  ! 281: STBAR	stbar
	.word 0xc4ba900b  ! 282: STDA_R	stda	%r2, [%r10 + %r11] 0x80
	.word 0x91a289ab  ! 283: FDIVs	fdivs	%f10, %f11, %f8
	.word 0x88fa800b  ! 284: SDIVcc_R	sdivcc 	%r10, %r11, %r4
	.word 0xc36aa254  ! 285: PREFETCH_I	prefetch	[%r10 + 0x0254], #one_read
	.word 0xc01aae00  ! 286: LDD_I	ldd	[%r10 + 0x0e00], %r0
	.word 0xb7da800b  ! 287: FLUSH_R	dis not found

	.word 0x8143e023  ! 288: MEMBAR	membar	#LoadLoad | #StoreLoad | #MemIssue 
	.word 0xce8aa974  ! 289: LDUBA_I	lduba	[%r10, + 0x0974] %asi, %r7
	.word 0xb1a289ab  ! 290: FDIVs	fdivs	%f10, %f11, %f24
	.word 0x8143e06f  ! 292: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #MemIssue | #Sync 
	.word 0xceb2900b  ! 293: STHA_R	stha	%r7, [%r10 + %r11] 0x80
	.word 0xd2fa900b  ! 294: SWAPA_R	swapa	%r9, [%r10 + %r11] 0x80
	.word 0xc7e2900b  ! 296: CASA_I	casa	[%r10] 0x80, %r11, %r3
	.word 0xfa02a5d0  ! 297: LDUW_I	lduw	[%r10 + 0x05d0], %r29
	.word 0x916aaa54  ! 299: SDIVX_I	sdivx	%r10, 0x0a54, %r8
	.word 0xc452a334  ! 300: LDSH_I	ldsh	[%r10 + 0x0334], %r2
	.word 0xd0eaa7d8  ! 301: LDSTUBA_I	ldstuba	%r8, [%r10 + 0x07d8] %asi
	.word 0x8d22800b  ! 302: MULScc_R	mulscc 	%r10, %r11, %r6
	.word 0x20800001  ! 303: BN	bn,a	<label_0x1>
	.word 0xd2ea900b  ! 304: LDSTUBA_R	ldstuba	%r9, [%r10 + %r11] 0x80
	.word 0xc852800b  ! 305: LDSH_R	ldsh	[%r10 + %r11], %r4
	.word 0xa04aa4c4  ! 306: MULX_I	mulx 	%r10, 0x04c4, %r16
	.word 0xc3ea900b  ! 307: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0xf8ba900b  ! 309: STDA_R	stda	%r28, [%r10 + %r11] 0x80
	.word 0xc2a2af1c  ! 310: STWA_I	stwa	%r1, [%r10 + 0x0f1c] %asi
	.word 0xb1da800b  ! 311: FLUSH_R	dis not found

	.word 0xfafaa3b4  ! 312: SWAPA_I	swapa	%r29, [%r10 + 0x03b4] %asi
	.word 0xbba288ab  ! 313: FSUBs	fsubs	%f10, %f11, %f29
	.word 0x9ad2800b  ! 314: UMULcc_R	umulcc 	%r10, %r11, %r13
	.word 0x40000001  ! 315: CALL	call	disp30_1
	.word 0x1a800001  ! 318: BCC	bcc  	<label_0x1>
	.word 0xc802a850  ! 319: LDUW_I	lduw	[%r10 + 0x0850], %r4
	.word 0x8a4aa1a4  ! 320: MULX_I	mulx 	%r10, 0x01a4, %r5
	.word 0xc282ac78  ! 321: LDUWA_I	lduwa	[%r10, + 0x0c78] %asi, %r1
	.word 0x8143c000  ! 322: STBAR	stbar
	.word 0x16800001  ! 323: BGE	bge  	<label_0x1>
	.word 0x8143c000  ! 324: STBAR	stbar
	.word 0x36800001  ! 325: BGE	bge,a	<label_0x1>
	.word 0x2c800001  ! 326: BNEG	bneg,a	<label_0x1>
	.word 0x83a289ab  ! 327: FDIVs	fdivs	%f10, %f11, %f1
	.word 0xd212800b  ! 328: LDUH_R	lduh	[%r10 + %r11], %r9
	.word 0x8143e074  ! 329: MEMBAR	membar	#LoadStore | #Lookaside | #MemIssue | #Sync 
	.word 0x2cc20001  ! 330: BRGZ	brgz,a,nt	%8,<label_0x20001>
	.word 0xc36aad40  ! 331: PREFETCH_I	prefetch	[%r10 + 0x0d40], #one_read
	.word 0xdf3a800b  ! 332: STDF_R	std	%f15, [%r11, %r10]
	.word 0x8bda800b  ! 333: FLUSH_R	dis not found

	.word 0x8272800b  ! 334: UDIV_R	udiv 	%r10, %r11, %r1
	.word 0x02ca0003  ! 335: BRZ	brz  ,pt	%8,<label_0xa0003>
	.word 0xcca2900b  ! 336: STWA_R	stwa	%r6, [%r10 + %r11] 0x80
	.word 0x16800001  ! 337: BGE	bge  	<label_0x1>
	.word 0x926a800b  ! 338: UDIVX_R	udivx 	%r10, %r11, %r9
	.word 0xa722af10  ! 339: MULScc_I	mulscc 	%r10, 0x0f10, %r19
	.word 0xd322800b  ! 340: STF_R	st	%f9, [%r11, %r10]
	.word 0x83daa150  ! 341: FLUSH_I	dis not found

	.word 0xd2aaa624  ! 342: STBA_I	stba	%r9, [%r10 + 0x0624] %asi
	.word 0x28800003  ! 343: BLEU	bleu,a	<label_0x3>
	.word 0xc852a820  ! 344: LDSH_I	ldsh	[%r10 + 0x0820], %r4
	.word 0x34800001  ! 345: BG	bg,a	<label_0x1>
	.word 0x8322800b  ! 346: MULScc_R	mulscc 	%r10, %r11, %r1
	.word 0x9fa289ab  ! 347: FDIVs	fdivs	%f10, %f11, %f15
	.word 0x93a2882b  ! 348: FADDs	fadds	%f10, %f11, %f9
	.word 0xc8baa020  ! 349: STDA_I	stda	%r4, [%r10 + 0x0020] %asi
	.word 0xa2d2800b  ! 350: UMULcc_R	umulcc 	%r10, %r11, %r17
	.word 0xf46aa160  ! 351: LDSTUB_I	ldstub	%r26, [%r10 + 0x0160]
	.word 0x93da800b  ! 352: FLUSH_R	dis not found

	.word 0x8143c000  ! 353: STBAR	stbar
	.word 0xccaaa5d0  ! 354: STBA_I	stba	%r6, [%r10 + 0x05d0] %asi
	.word 0x9ddaa120  ! 355: FLUSH_I	dis not found

	.word 0xf802800b  ! 356: LDUW_R	lduw	[%r10 + %r11], %r28
	.word 0xc2b2900b  ! 357: STHA_R	stha	%r1, [%r10 + %r11] 0x80
	.word 0x89da800b  ! 358: FLUSH_R	dis not found

	.word 0xd322800b  ! 359: STF_R	st	%f9, [%r11, %r10]
	.word 0xc36aaf60  ! 360: PREFETCH_I	prefetch	[%r10 + 0x0f60], #one_read
	.word 0xcad2a028  ! 361: LDSHA_I	ldsha	[%r10, + 0x0028] %asi, %r5
	.word 0x34800001  ! 362: BG	bg,a	<label_0x1>
	.word 0xda6a800b  ! 363: LDSTUB_R	ldstub	%r13, [%r10 + %r11]
	.word 0xaa7aa940  ! 364: SDIV_I	sdiv 	%r10, 0x0940, %r21
	.word 0x8bdaac88  ! 365: FLUSH_I	dis not found

	.word 0x864aa39c  ! 366: MULX_I	mulx 	%r10, 0x039c, %r3
	.word 0x8fa2892b  ! 367: FMULs	fmuls	%f10, %f11, %f7
	.word 0xc8ea900b  ! 368: LDSTUBA_R	ldstuba	%r4, [%r10 + %r11] 0x80
	.word 0xcccaa248  ! 369: LDSBA_I	ldsba	[%r10, + 0x0248] %asi, %r6
	.word 0x8143e01d  ! 370: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside 
	.word 0xe5e2900b  ! 371: CASA_I	casa	[%r10] 0x80, %r11, %r18
	.word 0xf2b2a5a4  ! 372: STHA_I	stha	%r25, [%r10 + 0x05a4] %asi
	.word 0xc36a800b  ! 373: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x26800003  ! 374: BL	bl,a	<label_0x3>
	.word 0xec6aa9bc  ! 375: LDSTUB_I	ldstub	%r22, [%r10 + 0x09bc]
	.word 0x926a800b  ! 376: UDIVX_R	udivx 	%r10, %r11, %r9
	.word 0xc53a800b  ! 377: STDF_R	std	%f2, [%r11, %r10]
	.word 0xbe72a2f8  ! 378: UDIV_I	udiv 	%r10, 0x02f8, %r31
	.word 0x926aab5c  ! 379: UDIVX_I	udivx 	%r10, 0x0b5c, %r9
	.word 0xcb22800b  ! 380: STF_R	st	%f5, [%r11, %r10]
	.word 0x3a800001  ! 381: BCC	bcc,a	<label_0x1>
	.word 0xce5aaa58  ! 382: LDX_I	ldx	[%r10 + 0x0a58], %r7
	.word 0xc7f2a00b  ! 383: CASXA_R	casxa	[%r10]%asi, %r11, %r3
	.word 0xc8eaae2c  ! 384: LDSTUBA_I	ldstuba	%r4, [%r10 + 0x0e2c] %asi
	.word 0xcca2900b  ! 385: STWA_R	stwa	%r6, [%r10 + %r11] 0x80
	.word 0xc7f2900b  ! 386: CASXA_I	casxa	[%r10] 0x80, %r11, %r3
	.word 0xa1a289ab  ! 387: FDIVs	fdivs	%f10, %f11, %f16
	.word 0xa3a289ab  ! 388: FDIVs	fdivs	%f10, %f11, %f17
	.word 0x925aac3c  ! 389: SMUL_I	smul 	%r10, 0x0c3c, %r9
	.word 0x8143e01e  ! 390: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside 
	.word 0xbefaa68c  ! 391: SDIVcc_I	sdivcc 	%r10, 0x068c, %r31
	.word 0xc36aae0c  ! 392: PREFETCH_I	prefetch	[%r10 + 0x0e0c], #one_read
	.word 0x87da800b  ! 393: FLUSH_R	dis not found

	.word 0x8fdaa35c  ! 394: FLUSH_I	dis not found

	.word 0xcb22800b  ! 395: STF_R	st	%f5, [%r11, %r10]
	.word 0xdeb2a878  ! 396: STHA_I	stha	%r15, [%r10 + 0x0878] %asi
	.word 0x8fda800b  ! 397: FLUSH_R	dis not found

	.word 0xc2ca900b  ! 398: LDSBA_R	ldsba	[%r10, %r11] 0x80, %r1
	.word 0x8272800b  ! 399: UDIV_R	udiv 	%r10, %r11, %r1
	.word 0x92f2a658  ! 400: UDIVcc_I	udivcc 	%r10, 0x0658, %r9
	.word 0xdcaa900b  ! 401: STBA_R	stba	%r14, [%r10 + %r11] 0x80
	.word 0xc8aaa3b8  ! 402: STBA_I	stba	%r4, [%r10 + 0x03b8] %asi
	.word 0xc85a800b  ! 403: LDX_R	ldx	[%r10 + %r11], %r4
	.word 0x91da800b  ! 404: FLUSH_R	dis not found

	.word 0xd2b2900b  ! 405: STHA_R	stha	%r9, [%r10 + %r11] 0x80
	.word 0xc6a2a044  ! 406: STWA_I	stwa	%r3, [%r10 + 0x0044] %asi
	.word 0xaaf2ab04  ! 407: UDIVcc_I	udivcc 	%r10, 0x0b04, %r21
	.word 0xa252af14  ! 408: UMUL_I	umul 	%r10, 0x0f14, %r17
	.word 0x85daa12c  ! 409: FLUSH_I	dis not found

	.word 0x8143c000  ! 410: STBAR	stbar
	.word 0x0a800003  ! 411: BCS	bcs  	<label_0x3>
	.word 0x826aad54  ! 412: UDIVX_I	udivx 	%r10, 0x0d54, %r1
	.word 0xd13aaa28  ! 413: STDF_I	std	%f8, [0x0a28, %r10]
	.word 0x3a800001  ! 414: BCC	bcc,a	<label_0x1>
	.word 0x827aa0e8  ! 415: SDIV_I	sdiv 	%r10, 0x00e8, %r1
	.word 0xc3ea900b  ! 416: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0x8cf2aca8  ! 417: UDIVcc_I	udivcc 	%r10, 0x0ca8, %r6
	.word 0x8143e05a  ! 418: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside | #Sync 
	.word 0xcacaa8dc  ! 419: LDSBA_I	ldsba	[%r10, + 0x08dc] %asi, %r5
	.word 0xbfda800b  ! 420: FLUSH_R	dis not found

	.word 0x926aa060  ! 421: UDIVX_I	udivx 	%r10, 0x0060, %r9
	.word 0xc722800b  ! 422: STF_R	st	%f3, [%r11, %r10]
	.word 0xd3f2900b  ! 423: CASXA_I	casxa	[%r10] 0x80, %r11, %r9
	.word 0xb67a800b  ! 424: SDIV_R	sdiv 	%r10, %r11, %r27
	.word 0xc642a6f0  ! 425: LDSW_I	ldsw	[%r10 + 0x06f0], %r3
	.word 0xdaaa900b  ! 426: STBA_R	stba	%r13, [%r10 + %r11] 0x80
	.word 0xbd22a164  ! 427: MULScc_I	mulscc 	%r10, 0x0164, %r30
	.word 0xc36aa3a0  ! 428: PREFETCH_I	prefetch	[%r10 + 0x03a0], #one_read
	.word 0x93daa694  ! 429: FLUSH_I	dis not found

	.word 0xc2b2900b  ! 430: STHA_R	stha	%r1, [%r10 + %r11] 0x80
	.word 0xdc6aa044  ! 432: LDSTUB_I	ldstub	%r14, [%r10 + 0x0044]
	.word 0x896aa69c  ! 433: SDIVX_I	sdivx	%r10, 0x069c, %r4
	.word 0xceca900b  ! 434: LDSBA_R	ldsba	[%r10, %r11] 0x80, %r7
	.word 0x2cc20001  ! 435: BRGZ	brgz,a,nt	%8,<label_0x20001>
	.word 0xcaaaa6ec  ! 436: STBA_I	stba	%r5, [%r10 + 0x06ec] %asi
	.word 0x85da800b  ! 437: FLUSH_R	dis not found

	.word 0x8143e051  ! 438: MEMBAR	membar	#LoadLoad | #Lookaside | #Sync 
	.word 0xd002a5d4  ! 439: LDUW_I	lduw	[%r10 + 0x05d4], %r8
	.word 0xd8ba900b  ! 440: STDA_R	stda	%r12, [%r10 + %r11] 0x80
	.word 0xc4b2a614  ! 441: STHA_I	stha	%r2, [%r10 + 0x0614] %asi
	.word 0xc3eaa8d8  ! 442: PREFETCHA_I	prefetcha	[%r10, + 0x08d8] %asi, #one_read
	.word 0xc4a2abdc  ! 443: STWA_I	stwa	%r2, [%r10 + 0x0bdc] %asi
	.word 0xd0ea900b  ! 444: LDSTUBA_R	ldstuba	%r8, [%r10 + %r11] 0x80
	.word 0xc8ea900b  ! 445: LDSTUBA_R	ldstuba	%r4, [%r10 + %r11] 0x80
	.word 0x8efaa7ec  ! 446: SDIVcc_I	sdivcc 	%r10, 0x07ec, %r7
	.word 0x8143c000  ! 447: STBAR	stbar
	.word 0xd8b2900b  ! 448: STHA_R	stha	%r12, [%r10 + %r11] 0x80
	.word 0xc402800b  ! 449: LDUW_R	lduw	[%r10 + %r11], %r2
	.word 0x8143c000  ! 450: STBAR	stbar
	.word 0xd242800b  ! 451: LDSW_R	ldsw	[%r10 + %r11], %r9
	.word 0xd07aa2c4  ! 452: SWAP_I	swap	%r8, [%r10 + 0x02c4]
	.word 0xf44aa4a0  ! 453: LDSB_I	ldsb	[%r10 + 0x04a0], %r26
	.word 0x8ba2882b  ! 454: FADDs	fadds	%f10, %f11, %f5
	.word 0xea6a800b  ! 455: LDSTUB_R	ldstub	%r21, [%r10 + %r11]
	.word 0x85daa928  ! 456: FLUSH_I	dis not found

	.word 0xa04aae6c  ! 457: MULX_I	mulx 	%r10, 0x0e6c, %r16
	.word 0xc4d2a5c0  ! 458: LDSHA_I	ldsha	[%r10, + 0x05c0] %asi, %r2
	.word 0xf522800b  ! 459: STF_R	st	%f26, [%r11, %r10]
	.word 0xc2b2a760  ! 460: STHA_I	stha	%r1, [%r10 + 0x0760] %asi
	.word 0xeb3a800b  ! 461: STDF_R	std	%f21, [%r11, %r10]
	.word 0x24c20001  ! 462: BRLEZ	brlez,a,nt	%8,<label_0x20001>
	.word 0xcf3aa8b8  ! 463: STDF_I	std	%f7, [0x08b8, %r10]
	.word 0xcb22800b  ! 464: STF_R	st	%f5, [%r11, %r10]
	.word 0xcc02800b  ! 465: LDUW_R	lduw	[%r10 + %r11], %r6
	.word 0xf0faa1d8  ! 466: SWAPA_I	swapa	%r24, [%r10 + 0x01d8] %asi
	.word 0xe0f2900b  ! 467: STXA_R	stxa	%r16, [%r10 + %r11] 0x80
	.word 0xc36a800b  ! 468: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0xc2a2900b  ! 469: STWA_R	stwa	%r1, [%r10 + %r11] 0x80
	.word 0xc442800b  ! 470: LDSW_R	ldsw	[%r10 + %r11], %r2
	.word 0xdcba900b  ! 471: STDA_R	stda	%r14, [%r10 + %r11] 0x80
	.word 0xc2b2900b  ! 473: STHA_R	stha	%r1, [%r10 + %r11] 0x80
	.word 0x8bdaa08c  ! 474: FLUSH_I	dis not found

	.word 0x89a2882b  ! 475: FADDs	fadds	%f10, %f11, %f4
	.word 0x84fa800b  ! 476: SDIVcc_R	sdivcc 	%r10, %r11, %r2
	.word 0xfa6a800b  ! 477: LDSTUB_R	ldstub	%r29, [%r10 + %r11]
	.word 0xbdda800b  ! 478: FLUSH_R	dis not found

	.word 0xccd2900b  ! 479: LDSHA_R	ldsha	[%r10, %r11] 0x80, %r6
	.word 0xcc82a738  ! 480: LDUWA_I	lduwa	[%r10, + 0x0738] %asi, %r6
	.word 0xd8baadb0  ! 481: STDA_I	stda	%r12, [%r10 + 0x0db0] %asi
	.word 0x8b6a800b  ! 482: SDIVX_R	sdivx	%r10, %r11, %r5
	.word 0x8ddaae10  ! 483: FLUSH_I	dis not found

	.word 0xc8a2900b  ! 484: STWA_R	stwa	%r4, [%r10 + %r11] 0x80
	.word 0x06800001  ! 485: BL	bl  	<label_0x1>
	.word 0x30800001  ! 486: BA	ba,a	<label_0x1>
	.word 0xcd3a800b  ! 487: STDF_R	std	%f6, [%r11, %r10]
	.word 0x8143c000  ! 488: STBAR	stbar
	.word 0xc852a1d8  ! 489: LDSH_I	ldsh	[%r10 + 0x01d8], %r4
	.word 0xe7f2900b  ! 490: CASXA_I	casxa	[%r10] 0x80, %r11, %r19
	.word 0xd092900b  ! 491: LDUHA_R	lduha	[%r10, %r11] 0x80, %r8
	.word 0x826aac34  ! 492: UDIVX_I	udivx 	%r10, 0x0c34, %r1
	.word 0xf122a5b0  ! 493: STF_I	st	%f24, [0x05b0, %r10]
	.word 0xb1a2882b  ! 494: FADDs	fadds	%f10, %f11, %f24
	.word 0xc3ea900b  ! 495: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0x8143e06c  ! 496: MEMBAR	membar	#LoadStore | #StoreStore | #MemIssue | #Sync 
	.word 0xf4c2a3a8  ! 497: LDSWA_I	ldswa	[%r10, + 0x03a8] %asi, %r26
	.word 0x1c800001  ! 498: BPOS	bpos  	<label_0x1>
	.word 0xc81a800b  ! 499: LDD_R	ldd	[%r10 + %r11], %r4
	.word 0xcc8a900b  ! 500: LDUBA_R	lduba	[%r10, %r11] 0x80, %r6
	.word 0xc7e2900b  ! 501: CASA_I	casa	[%r10] 0x80, %r11, %r3
	.word 0x82d2800b  ! 502: UMULcc_R	umulcc 	%r10, %r11, %r1
	.word 0x9272a8d8  ! 503: UDIV_I	udiv 	%r10, 0x08d8, %r9
	.word 0x8c4a800b  ! 504: MULX_R	mulx 	%r10, %r11, %r6
	.word 0xce6a800b  ! 505: LDSTUB_R	ldstub	%r7, [%r10 + %r11]
	.word 0xb7a289ab  ! 506: FDIVs	fdivs	%f10, %f11, %f27
	.word 0x89a2882b  ! 507: FADDs	fadds	%f10, %f11, %f4
	.word 0x826aa61c  ! 508: UDIVX_I	udivx 	%r10, 0x061c, %r1
	.word 0xcea2900b  ! 509: STWA_R	stwa	%r7, [%r10 + %r11] 0x80
	.word 0x9efaac1c  ! 510: SDIVcc_I	sdivcc 	%r10, 0x0c1c, %r15
	.word 0xb3daadc4  ! 511: FLUSH_I	dis not found

	.word 0xc36a800b  ! 512: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0xf2f2a778  ! 513: STXA_I	stxa	%r25, [%r10 + 0x0778] %asi
	.word 0x2a800003  ! 514: BCS	bcs,a	<label_0x3>
	.word 0x0ac20001  ! 515: BRNZ	brnz  ,nt	%8,<label_0x20001>
	.word 0x3c800001  ! 516: BPOS	bpos,a	<label_0x1>
	.word 0xce02a2d8  ! 518: LDUW_I	lduw	[%r10 + 0x02d8], %r7
	.word 0xc45aa570  ! 519: LDX_I	ldx	[%r10 + 0x0570], %r2
	.word 0x89a2892b  ! 520: FMULs	fmuls	%f10, %f11, %f4
	.word 0xaf22a070  ! 521: MULScc_I	mulscc 	%r10, 0x0070, %r23
	.word 0x87daa8b0  ! 522: FLUSH_I	dis not found

	.word 0xc48a900b  ! 523: LDUBA_R	lduba	[%r10, %r11] 0x80, %r2
	.word 0xd0baad70  ! 524: STDA_I	stda	%r8, [%r10 + 0x0d70] %asi
	.word 0x10800003  ! 525: BA	ba  	<label_0x3>
	.word 0x8c7aa274  ! 526: SDIV_I	sdiv 	%r10, 0x0274, %r6
	.word 0x0ec20003  ! 527: BRGEZ	brgez  ,nt	%8,<label_0x20003>
	.word 0x8c52a370  ! 528: UMUL_I	umul 	%r10, 0x0370, %r6
	.word 0x10800003  ! 529: BA	ba  	<label_0x3>
	.word 0xb672800b  ! 530: UDIV_R	udiv 	%r10, %r11, %r27
	.word 0x8143e056  ! 531: MEMBAR	membar	#StoreLoad | #LoadStore | #Lookaside | #Sync 
	.word 0x84faacc8  ! 532: SDIVcc_I	sdivcc 	%r10, 0x0cc8, %r2
	.word 0x88f2800b  ! 533: UDIVcc_R	udivcc 	%r10, %r11, %r4
	.word 0xccba900b  ! 534: STDA_R	stda	%r6, [%r10 + %r11] 0x80
	.word 0xc3eaa0d4  ! 535: PREFETCHA_I	prefetcha	[%r10, + 0x00d4] %asi, #one_read
	.word 0x88fa800b  ! 536: SDIVcc_R	sdivcc 	%r10, %r11, %r4
	.word 0xf122ae74  ! 537: STF_I	st	%f24, [0x0e74, %r10]
	.word 0x8272ac0c  ! 538: UDIV_I	udiv 	%r10, 0x0c0c, %r1
	.word 0xc27a800b  ! 539: SWAP_R	swap	%r1, [%r10 + %r11]
	.word 0xc4da900b  ! 541: LDXA_R	ldxa	[%r10, %r11] 0x80, %r2
	.word 0x89da800b  ! 542: FLUSH_R	dis not found

	.word 0x8522800b  ! 543: MULScc_R	mulscc 	%r10, %r11, %r2
	.word 0xc5e2900b  ! 544: CASA_I	casa	[%r10] 0x80, %r11, %r2
	.word 0xfb22800b  ! 546: STF_R	st	%f29, [%r11, %r10]
	.word 0x8143e069  ! 547: MEMBAR	membar	#LoadLoad | #StoreStore | #MemIssue | #Sync 
	.word 0x8143e031  ! 548: MEMBAR	membar	#LoadLoad | #Lookaside | #MemIssue 
	.word 0x8e4aa808  ! 549: MULX_I	mulx 	%r10, 0x0808, %r7
	.word 0x34800001  ! 550: BG	bg,a	<label_0x1>
	.word 0x85a288ab  ! 551: FSUBs	fsubs	%f10, %f11, %f2
	.word 0xd26aae24  ! 552: LDSTUB_I	ldstub	%r9, [%r10 + 0x0e24]
	.word 0xc3ea900b  ! 553: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0xcaea900b  ! 554: LDSTUBA_R	ldstuba	%r5, [%r10 + %r11] 0x80
	.word 0x30800001  ! 555: BA	ba,a	<label_0x1>
	.word 0xacd2800b  ! 556: UMULcc_R	umulcc 	%r10, %r11, %r22
	.word 0xc7f2900b  ! 557: CASXA_I	casxa	[%r10] 0x80, %r11, %r3
	.word 0x8143c000  ! 558: STBAR	stbar
	.word 0x9eda800b  ! 559: SMULcc_R	smulcc 	%r10, %r11, %r15
	.word 0xcc9aaee8  ! 560: LDDA_I	ldda	[%r10, + 0x0ee8] %asi, %r6
	.word 0x8f6aa7ac  ! 561: SDIVX_I	sdivx	%r10, 0x07ac, %r7
	.word 0xc652af8c  ! 563: LDSH_I	ldsh	[%r10 + 0x0f8c], %r3
	.word 0xc6aa900b  ! 564: STBA_R	stba	%r3, [%r10 + %r11] 0x80
	.word 0x2e800003  ! 565: BVS	bvs,a	<label_0x3>
	.word 0xc6f2900b  ! 566: STXA_R	stxa	%r3, [%r10 + %r11] 0x80
	.word 0x2ac20001  ! 567: BRNZ	brnz,a,nt	%8,<label_0x20001>
	.word 0x8b22a8f8  ! 568: MULScc_I	mulscc 	%r10, 0x08f8, %r5
	.word 0x89da800b  ! 569: FLUSH_R	dis not found

	.word 0x82fa800b  ! 570: SDIVcc_R	sdivcc 	%r10, %r11, %r1
	.word 0xd2c2abc8  ! 571: LDSWA_I	ldswa	[%r10, + 0x0bc8] %asi, %r9
	.word 0xc2c2a650  ! 572: LDSWA_I	ldswa	[%r10, + 0x0650] %asi, %r1
	.word 0x985a800b  ! 573: SMUL_R	smul 	%r10, %r11, %r12
	.word 0x8efaaccc  ! 574: SDIVcc_I	sdivcc 	%r10, 0x0ccc, %r7
	.word 0xbbdaa8e4  ! 575: FLUSH_I	dis not found

	.word 0xcc52a5fc  ! 576: LDSH_I	ldsh	[%r10 + 0x05fc], %r6
	.word 0xccba900b  ! 577: STDA_R	stda	%r6, [%r10 + %r11] 0x80
	.word 0xd33aab50  ! 578: STDF_I	std	%f9, [0x0b50, %r10]
	.word 0xd0c2a774  ! 579: LDSWA_I	ldswa	[%r10, + 0x0774] %asi, %r8
	.word 0xcac2900b  ! 580: LDSWA_R	ldswa	[%r10, %r11] 0x80, %r5
	.word 0xca4aa77c  ! 581: LDSB_I	ldsb	[%r10 + 0x077c], %r5
	.word 0x884aae14  ! 582: MULX_I	mulx 	%r10, 0x0e14, %r4
	.word 0x8143c000  ! 583: STBAR	stbar
	.word 0xf6eaace0  ! 584: LDSTUBA_I	ldstuba	%r27, [%r10 + 0x0ce0] %asi
	.word 0xc4baaf70  ! 585: STDA_I	stda	%r2, [%r10 + 0x0f70] %asi
	.word 0x00800001  ! 586: BN	bn  	<label_0x1>
	.word 0xf612800b  ! 587: LDUH_R	lduh	[%r10 + %r11], %r27
	.word 0xc36a800b  ! 588: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0xe81aaab0  ! 589: LDD_I	ldd	[%r10 + 0x0ab0], %r20
	.word 0xc86a800b  ! 590: LDSTUB_R	ldstub	%r4, [%r10 + %r11]
	.word 0xf892a790  ! 592: LDUHA_I	lduha	[%r10, + 0x0790] %asi, %r28
	.word 0xb9da800b  ! 593: FLUSH_R	dis not found

	.word 0x86faa80c  ! 594: SDIVcc_I	sdivcc 	%r10, 0x080c, %r3
	.word 0xac5a800b  ! 595: SMUL_R	smul 	%r10, %r11, %r22
	.word 0x36800003  ! 597: BGE	bge,a	<label_0x3>
	.word 0x91da800b  ! 599: FLUSH_R	dis not found

	.word 0xecba900b  ! 600: STDA_R	stda	%r22, [%r10 + %r11] 0x80
	.word 0x8143c000  ! 601: STBAR	stbar
	.word 0x8143e00a  ! 602: MEMBAR	membar	#StoreLoad | #StoreStore 
	.word 0x38800003  ! 603: BGU	bgu,a	<label_0x3>
	.word 0xc3ea900b  ! 604: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0xf41aaeb0  ! 605: LDD_I	ldd	[%r10 + 0x0eb0], %r26
	.word 0x8672a838  ! 606: UDIV_I	udiv 	%r10, 0x0838, %r3
	.word 0xcab2ac5c  ! 607: STHA_I	stha	%r5, [%r10 + 0x0c5c] %asi
	.word 0x8e72ae9c  ! 608: UDIV_I	udiv 	%r10, 0x0e9c, %r7
	.word 0x8143c000  ! 610: STBAR	stbar
	.word 0x924aac30  ! 611: MULX_I	mulx 	%r10, 0x0c30, %r9
	.word 0xd09aaf70  ! 613: LDDA_I	ldda	[%r10, + 0x0f70] %asi, %r8
	.word 0xcafaae4c  ! 614: SWAPA_I	swapa	%r5, [%r10 + 0x0e4c] %asi
	.word 0xc8d2900b  ! 615: LDSHA_R	ldsha	[%r10, %r11] 0x80, %r4
	.word 0xfe4aa3c4  ! 616: LDSB_I	ldsb	[%r10 + 0x03c4], %r31
	.word 0xd80a800b  ! 617: LDUB_R	ldub	[%r10 + %r11], %r12
	.word 0x8472800b  ! 618: UDIV_R	udiv 	%r10, %r11, %r2
	.word 0xd122800b  ! 619: STF_R	st	%f8, [%r11, %r10]
	.word 0x87a2892b  ! 620: FMULs	fmuls	%f10, %f11, %f3
	.word 0xc6c2afd0  ! 621: LDSWA_I	ldswa	[%r10, + 0x0fd0] %asi, %r3
	.word 0xc68a900b  ! 622: LDUBA_R	lduba	[%r10, %r11] 0x80, %r3
	.word 0xea52800b  ! 623: LDSH_R	ldsh	[%r10 + %r11], %r21
	.word 0xc89a900b  ! 624: LDDA_R	ldda	[%r10, %r11] 0x80, %r4
	.word 0x9d6aac34  ! 625: SDIVX_I	sdivx	%r10, 0x0c34, %r14
	.word 0xae4aaf80  ! 626: MULX_I	mulx 	%r10, 0x0f80, %r23
	.word 0x8143c000  ! 627: STBAR	stbar
	.word 0xec52a7f0  ! 628: LDSH_I	ldsh	[%r10 + 0x07f0], %r22
	.word 0xca02800b  ! 629: LDUW_R	lduw	[%r10 + %r11], %r5
	.word 0xb652800b  ! 630: UMUL_R	umul 	%r10, %r11, %r27
	.word 0x885a800b  ! 631: SMUL_R	smul 	%r10, %r11, %r4
	.word 0x02c20001  ! 632: BRZ	brz  ,nt	%8,<label_0x20001>
	.word 0xfeda900b  ! 633: LDXA_R	ldxa	[%r10, %r11] 0x80, %r31
	.word 0xc87a800b  ! 634: SWAP_R	swap	%r4, [%r10 + %r11]
	.word 0xce42a33c  ! 635: LDSW_I	ldsw	[%r10 + 0x033c], %r7
	.word 0x8143c000  ! 636: STBAR	stbar
	.word 0x8afa800b  ! 637: SDIVcc_R	sdivcc 	%r10, %r11, %r5
	.word 0xcf22af0c  ! 638: STF_I	st	%f7, [0x0f0c, %r10]
	.word 0xaa6aadb4  ! 639: UDIVX_I	udivx 	%r10, 0x0db4, %r21
	.word 0xc84aa668  ! 640: LDSB_I	ldsb	[%r10 + 0x0668], %r4
	.word 0x8143c000  ! 641: STBAR	stbar
	.word 0x87a2892b  ! 642: FMULs	fmuls	%f10, %f11, %f3
	.word 0x86f2800b  ! 643: UDIVcc_R	udivcc 	%r10, %r11, %r3
	.word 0xc36aaaa8  ! 644: PREFETCH_I	prefetch	[%r10 + 0x0aa8], #one_read
	.word 0xf46a800b  ! 645: LDSTUB_R	ldstub	%r26, [%r10 + %r11]
	.word 0xb44a800b  ! 646: MULX_R	mulx 	%r10, %r11, %r26
	.word 0x91a288ab  ! 647: FSUBs	fsubs	%f10, %f11, %f8
	.word 0x8143e02b  ! 648: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #MemIssue 
	.word 0xf41aa330  ! 649: LDD_I	ldd	[%r10 + 0x0330], %r26
	.word 0xc452a040  ! 650: LDSH_I	ldsh	[%r10 + 0x0040], %r2
	.word 0x86faa0f0  ! 651: SDIVcc_I	sdivcc 	%r10, 0x00f0, %r3
	.word 0x14800003  ! 652: BG	bg  	<label_0x3>
	.word 0xd01a800b  ! 653: LDD_R	ldd	[%r10 + %r11], %r8
	.word 0xc6a2900b  ! 654: STWA_R	stwa	%r3, [%r10 + %r11] 0x80
	.word 0xf2a2a2e0  ! 655: STWA_I	stwa	%r25, [%r10 + 0x02e0] %asi
	.word 0x8c52ac00  ! 656: UMUL_I	umul 	%r10, 0x0c00, %r6
	.word 0xcd3a800b  ! 657: STDF_R	std	%f6, [%r11, %r10]
	.word 0x87a289ab  ! 658: FDIVs	fdivs	%f10, %f11, %f3
	.word 0xc36a800b  ! 659: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x9322800b  ! 660: MULScc_R	mulscc 	%r10, %r11, %r9
	.word 0xca12800b  ! 661: LDUH_R	lduh	[%r10 + %r11], %r5
	.word 0x91da800b  ! 664: FLUSH_R	dis not found

	.word 0x8143e002  ! 665: MEMBAR	membar	#StoreLoad 
	.word 0xb7da800b  ! 666: FLUSH_R	dis not found

	.word 0xd012800b  ! 667: LDUH_R	lduh	[%r10 + %r11], %r8
	.word 0xc44aade0  ! 668: LDSB_I	ldsb	[%r10 + 0x0de0], %r2
	.word 0x3e800003  ! 669: BVC	bvc,a	<label_0x3>
	.word 0xc722ae00  ! 670: STF_I	st	%f3, [0x0e00, %r10]
	.word 0xd0baa320  ! 671: STDA_I	stda	%r8, [%r10 + 0x0320] %asi
	.word 0xc8eaad18  ! 672: LDSTUBA_I	ldstuba	%r4, [%r10 + 0x0d18] %asi
	.word 0xc3eaa30c  ! 673: PREFETCHA_I	prefetcha	[%r10, + 0x030c] %asi, #one_read
	.word 0xc60aa3f0  ! 675: LDUB_I	ldub	[%r10 + 0x03f0], %r3
	.word 0xc4d2900b  ! 676: LDSHA_R	ldsha	[%r10, %r11] 0x80, %r2
	.word 0x08800001  ! 677: BLEU	bleu  	<label_0x1>
	.word 0x8fdaaac8  ! 678: FLUSH_I	dis not found

	.word 0xf4faa1bc  ! 679: SWAPA_I	swapa	%r26, [%r10 + 0x01bc] %asi
	.word 0xc242800b  ! 680: LDSW_R	ldsw	[%r10 + %r11], %r1
	.word 0xc67a800b  ! 681: SWAP_R	swap	%r3, [%r10 + %r11]
	.word 0xeafa900b  ! 682: SWAPA_R	swapa	%r21, [%r10 + %r11] 0x80
	.word 0xeeb2a074  ! 683: STHA_I	stha	%r23, [%r10 + 0x0074] %asi
	.word 0x88faac74  ! 684: SDIVcc_I	sdivcc 	%r10, 0x0c74, %r4
	.word 0xd322800b  ! 685: STF_R	st	%f9, [%r11, %r10]
	.word 0xc8aaa220  ! 686: STBA_I	stba	%r4, [%r10 + 0x0220] %asi
	.word 0xc36a800b  ! 687: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x87daa844  ! 688: FLUSH_I	dis not found

	.word 0x91daaf84  ! 689: FLUSH_I	dis not found

	.word 0xc86a800b  ! 690: LDSTUB_R	ldstub	%r4, [%r10 + %r11]
	.word 0xd0caa040  ! 691: LDSBA_I	ldsba	[%r10, + 0x0040] %asi, %r8
	.word 0xa672afd0  ! 693: UDIV_I	udiv 	%r10, 0x0fd0, %r19
	.word 0xe692add0  ! 694: LDUHA_I	lduha	[%r10, + 0x0dd0] %asi, %r19
	.word 0xc922a880  ! 695: STF_I	st	%f4, [0x0880, %r10]
	.word 0xc27aad74  ! 696: SWAP_I	swap	%r1, [%r10 + 0x0d74]
	.word 0xa5da800b  ! 697: FLUSH_R	dis not found

	.word 0xc4c2ad18  ! 698: LDSWA_I	ldswa	[%r10, + 0x0d18] %asi, %r2
	.word 0x9cf2a3d8  ! 699: UDIVcc_I	udivcc 	%r10, 0x03d8, %r14
	.word 0xc3eaa930  ! 700: PREFETCHA_I	prefetcha	[%r10, + 0x0930] %asi, #one_read
	.word 0x8143e039  ! 701: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside | #MemIssue 
	.word 0x90d2aeb8  ! 702: UMULcc_I	umulcc 	%r10, 0x0eb8, %r8
	.word 0xb8f2800b  ! 703: UDIVcc_R	udivcc 	%r10, %r11, %r28
	.word 0x88d2800b  ! 704: UMULcc_R	umulcc 	%r10, %r11, %r4
	.word 0x24ca0003  ! 705: BRLEZ	brlez,a,pt	%8,<label_0xa0003>
	.word 0xc2b2a4c4  ! 706: STHA_I	stha	%r1, [%r10 + 0x04c4] %asi
	.word 0x06800001  ! 707: BL	bl  	<label_0x1>
	.word 0x9072af74  ! 708: UDIV_I	udiv 	%r10, 0x0f74, %r8
	.word 0xcbe2900b  ! 709: CASA_I	casa	[%r10] 0x80, %r11, %r5
	.word 0xdac2ade8  ! 710: LDSWA_I	ldswa	[%r10, + 0x0de8] %asi, %r13
	.word 0xf0f2900b  ! 711: STXA_R	stxa	%r24, [%r10 + %r11] 0x80
	.word 0xe24a800b  ! 712: LDSB_R	ldsb	[%r10 + %r11], %r17
	.word 0x8fdaa83c  ! 713: FLUSH_I	dis not found

	.word 0x8ba2892b  ! 714: FMULs	fmuls	%f10, %f11, %f5
	.word 0xe8faa560  ! 715: SWAPA_I	swapa	%r20, [%r10 + 0x0560] %asi
	.word 0xd8aa900b  ! 716: STBA_R	stba	%r12, [%r10 + %r11] 0x80
	.word 0x8bdaa7d4  ! 717: FLUSH_I	dis not found

	.word 0x8143e06e  ! 718: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #MemIssue | #Sync 
	.word 0x8143e045  ! 719: MEMBAR	membar	#LoadLoad | #LoadStore | #Sync 
	.word 0xb36aa50c  ! 720: SDIVX_I	sdivx	%r10, 0x050c, %r25
	.word 0xa96aa59c  ! 721: SDIVX_I	sdivx	%r10, 0x059c, %r20
	.word 0xf882900b  ! 722: LDUWA_R	lduwa	[%r10, %r11] 0x80, %r28
	.word 0x89a289ab  ! 723: FDIVs	fdivs	%f10, %f11, %f4
	.word 0xc68a900b  ! 724: LDUBA_R	lduba	[%r10, %r11] 0x80, %r3
	.word 0x89a289ab  ! 725: FDIVs	fdivs	%f10, %f11, %f4
	.word 0xf9f2a00b  ! 726: CASXA_R	casxa	[%r10]%asi, %r11, %r28
	.word 0x84d2a738  ! 727: UMULcc_I	umulcc 	%r10, 0x0738, %r2
	.word 0xc3eaa980  ! 728: PREFETCHA_I	prefetcha	[%r10, + 0x0980] %asi, #one_read
	.word 0x8da2882b  ! 729: FADDs	fadds	%f10, %f11, %f6
	.word 0xc2d2900b  ! 730: LDSHA_R	ldsha	[%r10, %r11] 0x80, %r1
	.word 0x89a2892b  ! 731: FMULs	fmuls	%f10, %f11, %f4
	.word 0xa522800b  ! 732: MULScc_R	mulscc 	%r10, %r11, %r18
	.word 0x02c20001  ! 733: BRZ	brz  ,nt	%8,<label_0x20001>
	.word 0xd2f2900b  ! 734: STXA_R	stxa	%r9, [%r10 + %r11] 0x80
	.word 0x8c4aa5c0  ! 735: MULX_I	mulx 	%r10, 0x05c0, %r6
	.word 0x927aa0e0  ! 736: SDIV_I	sdiv 	%r10, 0x00e0, %r9
	.word 0xf4f2acb8  ! 737: STXA_I	stxa	%r26, [%r10 + 0x0cb8] %asi
	.word 0xada289ab  ! 738: FDIVs	fdivs	%f10, %f11, %f22
	.word 0xc6f2ac88  ! 739: STXA_I	stxa	%r3, [%r10 + 0x0c88] %asi
	.word 0x8fdaa780  ! 740: FLUSH_I	dis not found

	.word 0xaedaaecc  ! 741: SMULcc_I	smulcc 	%r10, 0x0ecc, %r23
	.word 0xcc6a800b  ! 742: LDSTUB_R	ldstub	%r6, [%r10 + %r11]
	.word 0xda52800b  ! 743: LDSH_R	ldsh	[%r10 + %r11], %r13
	.word 0x907aacb4  ! 744: SDIV_I	sdiv 	%r10, 0x0cb4, %r8
	.word 0xf8a2a37c  ! 745: STWA_I	stwa	%r28, [%r10 + 0x037c] %asi
	.word 0x8ad2800b  ! 746: UMULcc_R	umulcc 	%r10, %r11, %r5
	.word 0x8452800b  ! 747: UMUL_R	umul 	%r10, %r11, %r2
	.word 0x9052800b  ! 748: UMUL_R	umul 	%r10, %r11, %r8
	.word 0xbc6aaa58  ! 749: UDIVX_I	udivx 	%r10, 0x0a58, %r30
	.word 0xc492a454  ! 750: LDUHA_I	lduha	[%r10, + 0x0454] %asi, %r2
	.word 0x8143c000  ! 751: STBAR	stbar
	.word 0xc2ea900b  ! 752: LDSTUBA_R	ldstuba	%r1, [%r10 + %r11] 0x80
	.word 0xce12800b  ! 753: LDUH_R	lduh	[%r10 + %r11], %r7
	.word 0xc3eaad54  ! 754: PREFETCHA_I	prefetcha	[%r10, + 0x0d54] %asi, #one_read
	.word 0x24800003  ! 755: BLE	ble,a	<label_0x3>
	.word 0xc322800b  ! 756: STF_R	st	%f1, [%r11, %r10]
	.word 0x8a4aa728  ! 757: MULX_I	mulx 	%r10, 0x0728, %r5
	.word 0x8c7aaf34  ! 758: SDIV_I	sdiv 	%r10, 0x0f34, %r6
	.word 0xa2da800b  ! 759: SMULcc_R	smulcc 	%r10, %r11, %r17
	.word 0x90f2800b  ! 760: UDIVcc_R	udivcc 	%r10, %r11, %r8
	.word 0xeac2aa90  ! 761: LDSWA_I	ldswa	[%r10, + 0x0a90] %asi, %r21
	.word 0xdaf2900b  ! 762: STXA_R	stxa	%r13, [%r10 + %r11] 0x80
	.word 0xc7f2900b  ! 763: CASXA_I	casxa	[%r10] 0x80, %r11, %r3
	.word 0xce5aa140  ! 764: LDX_I	ldx	[%r10 + 0x0140], %r7
	.word 0xa86a800b  ! 765: UDIVX_R	udivx 	%r10, %r11, %r20
	.word 0xb5a2882b  ! 766: FADDs	fadds	%f10, %f11, %f26
	.word 0xdf22aa54  ! 767: STF_I	st	%f15, [0x0a54, %r10]
	.word 0x847aab88  ! 768: SDIV_I	sdiv 	%r10, 0x0b88, %r2
	.word 0xe402800b  ! 769: LDUW_R	lduw	[%r10 + %r11], %r18
	.word 0xce5a800b  ! 770: LDX_R	ldx	[%r10 + %r11], %r7
	.word 0xecaa900b  ! 771: STBA_R	stba	%r22, [%r10 + %r11] 0x80
	.word 0xca02a1f4  ! 772: LDUW_I	lduw	[%r10 + 0x01f4], %r5
	.word 0xce52a29c  ! 773: LDSH_I	ldsh	[%r10 + 0x029c], %r7
	.word 0x8143c000  ! 774: STBAR	stbar
	.word 0xd08a900b  ! 775: LDUBA_R	lduba	[%r10, %r11] 0x80, %r8
	.word 0xc46a800b  ! 776: LDSTUB_R	ldstub	%r2, [%r10 + %r11]
	.word 0x8d6a800b  ! 777: SDIVX_R	sdivx	%r10, %r11, %r6
	.word 0xd0ea900b  ! 778: LDSTUBA_R	ldstuba	%r8, [%r10 + %r11] 0x80
	.word 0x8c72afe0  ! 779: UDIV_I	udiv 	%r10, 0x0fe0, %r6
	.word 0x906aa688  ! 780: UDIVX_I	udivx 	%r10, 0x0688, %r8
	.word 0xf6c2900b  ! 781: LDSWA_R	ldswa	[%r10, %r11] 0x80, %r27
	.word 0x82f2a7f8  ! 782: UDIVcc_I	udivcc 	%r10, 0x07f8, %r1
	.word 0xb2daa6e0  ! 783: SMULcc_I	smulcc 	%r10, 0x06e0, %r25
	.word 0xb9a289ab  ! 784: FDIVs	fdivs	%f10, %f11, %f28
	.word 0xc47aa230  ! 785: SWAP_I	swap	%r2, [%r10 + 0x0230]
	.word 0xb45aa830  ! 786: SMUL_I	smul 	%r10, 0x0830, %r26
	.word 0x91daa6a0  ! 787: FLUSH_I	dis not found

	.word 0x8143e062  ! 788: MEMBAR	membar	#StoreLoad | #MemIssue | #Sync 
	.word 0xa6d2800b  ! 789: UMULcc_R	umulcc 	%r10, %r11, %r19
	.word 0x9052800b  ! 790: UMUL_R	umul 	%r10, %r11, %r8
	.word 0x2cca0001  ! 791: BRGZ	brgz,a,pt	%8,<label_0xa0001>
	.word 0xf89aa090  ! 792: LDDA_I	ldda	[%r10, + 0x0090] %asi, %r28
	.word 0xc2c2900b  ! 793: LDSWA_R	ldswa	[%r10, %r11] 0x80, %r1
	.word 0xd26a800b  ! 794: LDSTUB_R	ldstub	%r9, [%r10 + %r11]
	.word 0xfc12aae0  ! 795: LDUH_I	lduh	[%r10 + 0x0ae0], %r30
	.word 0xceeaae98  ! 796: LDSTUBA_I	ldstuba	%r7, [%r10 + 0x0e98] %asi
	.word 0xc3eaa9c4  ! 797: PREFETCHA_I	prefetcha	[%r10, + 0x09c4] %asi, #one_read
	.word 0xc812800b  ! 799: LDUH_R	lduh	[%r10 + %r11], %r4
	.word 0xb7a288ab  ! 800: FSUBs	fsubs	%f10, %f11, %f27
	.word 0x8143e072  ! 801: MEMBAR	membar	#StoreLoad | #Lookaside | #MemIssue | #Sync 
	.word 0xcaca900b  ! 802: LDSBA_R	ldsba	[%r10, %r11] 0x80, %r5
	.word 0x856aafac  ! 803: SDIVX_I	sdivx	%r10, 0x0fac, %r2
	.word 0xc2b2a9f8  ! 804: STHA_I	stha	%r1, [%r10 + 0x09f8] %asi
	.word 0xf2aa900b  ! 805: STBA_R	stba	%r25, [%r10 + %r11] 0x80
	.word 0x8a52800b  ! 806: UMUL_R	umul 	%r10, %r11, %r5
	.word 0xd9f2a00b  ! 807: CASXA_R	casxa	[%r10]%asi, %r11, %r12
	.word 0x8143c000  ! 808: STBAR	stbar
	.word 0x89daa700  ! 809: FLUSH_I	dis not found

	.word 0xc3e2a00b  ! 810: CASA_R	casa	[%r10] %asi, %r11, %r1
	.word 0xa66a800b  ! 811: UDIVX_R	udivx 	%r10, %r11, %r19
	.word 0xd2ea900b  ! 812: LDSTUBA_R	ldstuba	%r9, [%r10 + %r11] 0x80
	.word 0xca82a338  ! 813: LDUWA_I	lduwa	[%r10, + 0x0338] %asi, %r5
	.word 0xc3eaa64c  ! 814: PREFETCHA_I	prefetcha	[%r10, + 0x064c] %asi, #one_read
	.word 0x8e4a800b  ! 815: MULX_R	mulx 	%r10, %r11, %r7
	.word 0x8143e011  ! 816: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x8143e015  ! 817: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside 
	.word 0x8143e022  ! 818: MEMBAR	membar	#StoreLoad | #MemIssue 
	.word 0xc88aacf0  ! 819: LDUBA_I	lduba	[%r10, + 0x0cf0] %asi, %r4
	.word 0xcad2ab20  ! 820: LDSHA_I	ldsha	[%r10, + 0x0b20] %asi, %r5
	.word 0xd06a800b  ! 821: LDSTUB_R	ldstub	%r8, [%r10 + %r11]
	.word 0xf00a800b  ! 822: LDUB_R	ldub	[%r10 + %r11], %r24
	.word 0xd2fa900b  ! 823: SWAPA_R	swapa	%r9, [%r10 + %r11] 0x80
	.word 0xaa6a800b  ! 824: UDIVX_R	udivx 	%r10, %r11, %r21
	.word 0xccda900b  ! 825: LDXA_R	ldxa	[%r10, %r11] 0x80, %r6
	.word 0xc612a348  ! 826: LDUH_I	lduh	[%r10 + 0x0348], %r3
	.word 0xce4a800b  ! 827: LDSB_R	ldsb	[%r10 + %r11], %r7
	.word 0xc26aae74  ! 828: LDSTUB_I	ldstub	%r1, [%r10 + 0x0e74]
	.word 0x24800001  ! 829: BLE	ble,a	<label_0x1>
	.word 0x06ca0003  ! 830: BRLZ	brlz  ,pt	%8,<label_0xa0003>
	.word 0x8143c000  ! 831: STBAR	stbar
	.word 0xd26a800b  ! 832: LDSTUB_R	ldstub	%r9, [%r10 + %r11]
	.word 0xc36a800b  ! 833: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0xcbe2900b  ! 835: CASA_I	casa	[%r10] 0x80, %r11, %r5
	.word 0xcccaab04  ! 836: LDSBA_I	ldsba	[%r10, + 0x0b04] %asi, %r6
	.word 0xa07aade0  ! 837: SDIV_I	sdiv 	%r10, 0x0de0, %r16
	.word 0x9fa289ab  ! 838: FDIVs	fdivs	%f10, %f11, %f15
	.word 0xc65a800b  ! 839: LDX_R	ldx	[%r10 + %r11], %r3
	.word 0xf84a800b  ! 840: LDSB_R	ldsb	[%r10 + %r11], %r28
	.word 0x2aca0003  ! 841: BRNZ	brnz,a,pt	%8,<label_0xa0003>
	.word 0xcb22800b  ! 842: STF_R	st	%f5, [%r11, %r10]
	.word 0xa5daa534  ! 843: FLUSH_I	dis not found

	.word 0xbe52aa28  ! 844: UMUL_I	umul 	%r10, 0x0a28, %r31
	.word 0x8143e046  ! 845: MEMBAR	membar	#StoreLoad | #LoadStore | #Sync 
	.word 0xb87a800b  ! 846: SDIV_R	sdiv 	%r10, %r11, %r28
	.word 0x3c800003  ! 847: BPOS	bpos,a	<label_0x3>
	.word 0xcc9aad38  ! 848: LDDA_I	ldda	[%r10, + 0x0d38] %asi, %r6
	.word 0x92da800b  ! 849: SMULcc_R	smulcc 	%r10, %r11, %r9
	.word 0xa8daa138  ! 850: SMULcc_I	smulcc 	%r10, 0x0138, %r20
	.word 0xd292a3d4  ! 851: LDUHA_I	lduha	[%r10, + 0x03d4] %asi, %r9
	.word 0xc36aa390  ! 852: PREFETCH_I	prefetch	[%r10 + 0x0390], #one_read
	.word 0x9ba2892b  ! 853: FMULs	fmuls	%f10, %f11, %f13
	.word 0xcf3a800b  ! 854: STDF_R	std	%f7, [%r11, %r10]
	.word 0xc81a800b  ! 855: LDD_R	ldd	[%r10 + %r11], %r4
	.word 0x9da288ab  ! 856: FSUBs	fsubs	%f10, %f11, %f14
	.word 0xd012800b  ! 857: LDUH_R	lduh	[%r10 + %r11], %r8
	.word 0x30800001  ! 858: BA	ba,a	<label_0x1>
	.word 0x3a800003  ! 859: BCC	bcc,a	<label_0x3>
	.word 0xc892900b  ! 860: LDUHA_R	lduha	[%r10, %r11] 0x80, %r4
	.word 0xc8b2900b  ! 861: STHA_R	stha	%r4, [%r10 + %r11] 0x80
	.word 0x8143e056  ! 862: MEMBAR	membar	#StoreLoad | #LoadStore | #Lookaside | #Sync 
	.word 0x8143c000  ! 863: STBAR	stbar
	.word 0xd812800b  ! 864: LDUH_R	lduh	[%r10 + %r11], %r12
	.word 0xc4ea900b  ! 865: LDSTUBA_R	ldstuba	%r2, [%r10 + %r11] 0x80
	.word 0xa36a800b  ! 866: SDIVX_R	sdivx	%r10, %r11, %r17
	.word 0x91daaacc  ! 867: FLUSH_I	dis not found

	.word 0xfe5aa7d8  ! 868: LDX_I	ldx	[%r10 + 0x07d8], %r31
	.word 0xe49aa448  ! 869: LDDA_I	ldda	[%r10, + 0x0448] %asi, %r18
	.word 0xcef2a570  ! 870: STXA_I	stxa	%r7, [%r10 + 0x0570] %asi
	.word 0x92da800b  ! 871: SMULcc_R	smulcc 	%r10, %r11, %r9
	.word 0x8af2ade0  ! 872: UDIVcc_I	udivcc 	%r10, 0x0de0, %r5
	.word 0x8522a7ec  ! 873: MULScc_I	mulscc 	%r10, 0x07ec, %r2
	.word 0xbba289ab  ! 874: FDIVs	fdivs	%f10, %f11, %f29
	.word 0xf402afd8  ! 875: LDUW_I	lduw	[%r10 + 0x0fd8], %r26
	.word 0xd0ea900b  ! 876: LDSTUBA_R	ldstuba	%r8, [%r10 + %r11] 0x80
	.word 0x8c52800b  ! 877: UMUL_R	umul 	%r10, %r11, %r6
	.word 0xd27aa008  ! 878: SWAP_I	swap	%r9, [%r10 + 0x0008]
	.word 0x1c800001  ! 879: BPOS	bpos  	<label_0x1>
	.word 0x85daad88  ! 880: FLUSH_I	dis not found

	.word 0xc2a2a598  ! 881: STWA_I	stwa	%r1, [%r10 + 0x0598] %asi
	.word 0xc36aa168  ! 882: PREFETCH_I	prefetch	[%r10 + 0x0168], #one_read
	.word 0xd322a284  ! 883: STF_I	st	%f9, [0x0284, %r10]
	.word 0x93da800b  ! 884: FLUSH_R	dis not found

	.word 0x8fa2892b  ! 886: FMULs	fmuls	%f10, %f11, %f7
	.word 0x8722a150  ! 887: MULScc_I	mulscc 	%r10, 0x0150, %r3
	.word 0xc6f2900b  ! 888: STXA_R	stxa	%r3, [%r10 + %r11] 0x80
	.word 0xd08a900b  ! 890: LDUBA_R	lduba	[%r10, %r11] 0x80, %r8
	.word 0xd24aaec0  ! 891: LDSB_I	ldsb	[%r10 + 0x0ec0], %r9
	.word 0x24ca0001  ! 893: BRLEZ	brlez,a,pt	%8,<label_0xa0001>
	.word 0x14800001  ! 894: BG	bg  	<label_0x1>
	.word 0x24800003  ! 895: BLE	ble,a	<label_0x3>
	.word 0xc88a900b  ! 897: LDUBA_R	lduba	[%r10, %r11] 0x80, %r4
	.word 0x866aa208  ! 898: UDIVX_I	udivx 	%r10, 0x0208, %r3
	.word 0xc3eaa70c  ! 899: PREFETCHA_I	prefetcha	[%r10, + 0x070c] %asi, #one_read
	.word 0xd202a534  ! 900: LDUW_I	lduw	[%r10 + 0x0534], %r9
	.word 0x9e52800b  ! 901: UMUL_R	umul 	%r10, %r11, %r15
	.word 0x8cdaa660  ! 902: SMULcc_I	smulcc 	%r10, 0x0660, %r6
	.word 0x916aa204  ! 903: SDIVX_I	sdivx	%r10, 0x0204, %r8
	.word 0x8143c000  ! 904: STBAR	stbar
	.word 0x8143e005  ! 905: MEMBAR	membar	#LoadLoad | #LoadStore 
	.word 0x0eca0003  ! 906: BRGEZ	brgez  ,pt	%8,<label_0xa0003>
	.word 0xa85a800b  ! 907: SMUL_R	smul 	%r10, %r11, %r20
	.word 0xe09aaee8  ! 908: LDDA_I	ldda	[%r10, + 0x0ee8] %asi, %r16
	.word 0xcca2900b  ! 909: STWA_R	stwa	%r6, [%r10 + %r11] 0x80
	.word 0x30800001  ! 910: BA	ba,a	<label_0x1>
	.word 0x896a800b  ! 911: SDIVX_R	sdivx	%r10, %r11, %r4
	.word 0xb26a800b  ! 912: UDIVX_R	udivx 	%r10, %r11, %r25
	.word 0xa922a1b4  ! 913: MULScc_I	mulscc 	%r10, 0x01b4, %r20
	.word 0xa46a800b  ! 914: UDIVX_R	udivx 	%r10, %r11, %r18
	.word 0x89daac8c  ! 915: FLUSH_I	dis not found

	.word 0xd24a800b  ! 916: LDSB_R	ldsb	[%r10 + %r11], %r9
	.word 0x2c800001  ! 917: BNEG	bneg,a	<label_0x1>
	.word 0xa9daa9c0  ! 918: FLUSH_I	dis not found

	.word 0xf33a800b  ! 919: STDF_R	std	%f25, [%r11, %r10]
	.word 0xb3daa6ec  ! 920: FLUSH_I	dis not found

	.word 0xa1daa4d4  ! 921: FLUSH_I	dis not found

	.word 0xc3ea900b  ! 922: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0x32800001  ! 923: BNE	bne,a	<label_0x1>
	.word 0xcc12800b  ! 924: LDUH_R	lduh	[%r10 + %r11], %r6
	.word 0xb522800b  ! 925: MULScc_R	mulscc 	%r10, %r11, %r26
	.word 0xcaaa900b  ! 926: STBA_R	stba	%r5, [%r10 + %r11] 0x80
	.word 0x89da800b  ! 927: FLUSH_R	dis not found

	.word 0xb072a258  ! 928: UDIV_I	udiv 	%r10, 0x0258, %r24
	.word 0x8143c000  ! 929: STBAR	stbar
	.word 0xc252800b  ! 930: LDSH_R	ldsh	[%r10 + %r11], %r1
	.word 0xd0fa900b  ! 931: SWAPA_R	swapa	%r8, [%r10 + %r11] 0x80
	.word 0x90f2800b  ! 933: UDIVcc_R	udivcc 	%r10, %r11, %r8
	.word 0x83daabd0  ! 934: FLUSH_I	dis not found

	.word 0xc4c2900b  ! 935: LDSWA_R	ldswa	[%r10, %r11] 0x80, %r2
	.word 0xe0aa900b  ! 936: STBA_R	stba	%r16, [%r10 + %r11] 0x80
	.word 0x8143e025  ! 937: MEMBAR	membar	#LoadLoad | #LoadStore | #MemIssue 
	.word 0xc36aa350  ! 938: PREFETCH_I	prefetch	[%r10 + 0x0350], #one_read
	.word 0xc6ca900b  ! 939: LDSBA_R	ldsba	[%r10, %r11] 0x80, %r3
	.word 0xcc9a900b  ! 941: LDDA_R	ldda	[%r10, %r11] 0x80, %r6
	.word 0xc812800b  ! 942: LDUH_R	lduh	[%r10 + %r11], %r4
	.word 0xd2c2a614  ! 943: LDSWA_I	ldswa	[%r10, + 0x0614] %asi, %r9
	.word 0x8ddaa76c  ! 944: FLUSH_I	dis not found

	.word 0x8a72800b  ! 945: UDIV_R	udiv 	%r10, %r11, %r5
	.word 0xc0ba900b  ! 946: STDA_R	stda	%r0, [%r10 + %r11] 0x80
	.word 0xd01aa140  ! 947: LDD_I	ldd	[%r10 + 0x0140], %r8
	.word 0x20800001  ! 948: BN	bn,a	<label_0x1>
	.word 0x8ef2800b  ! 949: UDIVcc_R	udivcc 	%r10, %r11, %r7
	.word 0xba5a800b  ! 950: SMUL_R	smul 	%r10, %r11, %r29
	.word 0x8143c000  ! 951: STBAR	stbar
	.word 0xc3eaa8f4  ! 952: PREFETCHA_I	prefetcha	[%r10, + 0x08f4] %asi, #one_read
	.word 0x896a800b  ! 953: SDIVX_R	sdivx	%r10, %r11, %r4
	.word 0x8722a13c  ! 954: MULScc_I	mulscc 	%r10, 0x013c, %r3
	.word 0xfe7a800b  ! 955: SWAP_R	swap	%r31, [%r10 + %r11]
	.word 0xdc82a9d4  ! 956: LDUWA_I	lduwa	[%r10, + 0x09d4] %asi, %r14
	.word 0x906aa4e0  ! 957: UDIVX_I	udivx 	%r10, 0x04e0, %r8
	.word 0x8eda800b  ! 958: SMULcc_R	smulcc 	%r10, %r11, %r7
	.word 0x83a2882b  ! 959: FADDs	fadds	%f10, %f11, %f1
	.word 0x845a800b  ! 960: SMUL_R	smul 	%r10, %r11, %r2
	.word 0xfcb2900b  ! 961: STHA_R	stha	%r30, [%r10 + %r11] 0x80
	.word 0x8ed2a73c  ! 962: UMULcc_I	umulcc 	%r10, 0x073c, %r7
	.word 0x8143e023  ! 963: MEMBAR	membar	#LoadLoad | #StoreLoad | #MemIssue 
	.word 0x87da800b  ! 964: FLUSH_R	dis not found

	.word 0x8272800b  ! 965: UDIV_R	udiv 	%r10, %r11, %r1
	.word 0x8143c000  ! 966: STBAR	stbar
	.word 0x8d6aa3c4  ! 967: SDIVX_I	sdivx	%r10, 0x03c4, %r6
	.word 0x8143c000  ! 968: STBAR	stbar
	.word 0x9072800b  ! 969: UDIV_R	udiv 	%r10, %r11, %r8
	.word 0xd04aad28  ! 970: LDSB_I	ldsb	[%r10 + 0x0d28], %r8
	.word 0xc3eaad38  ! 971: PREFETCHA_I	prefetcha	[%r10, + 0x0d38] %asi, #one_read
	.word 0xada2882b  ! 972: FADDs	fadds	%f10, %f11, %f22
	.word 0xd292ad08  ! 973: LDUHA_I	lduha	[%r10, + 0x0d08] %asi, %r9
	.word 0xcc12a1e4  ! 974: LDUH_I	lduh	[%r10 + 0x01e4], %r6
	.word 0x8edaa5f4  ! 975: SMULcc_I	smulcc 	%r10, 0x05f4, %r7
	.word 0xf2aa900b  ! 976: STBA_R	stba	%r25, [%r10 + %r11] 0x80
	.word 0xd2fa900b  ! 977: SWAPA_R	swapa	%r9, [%r10 + %r11] 0x80
	.word 0xd0baa140  ! 978: STDA_I	stda	%r8, [%r10 + 0x0140] %asi
	.word 0x8cda800b  ! 979: SMULcc_R	smulcc 	%r10, %r11, %r6
	.word 0xcb22800b  ! 980: STF_R	st	%f5, [%r11, %r10]
	.word 0xd8fa900b  ! 981: SWAPA_R	swapa	%r12, [%r10 + %r11] 0x80
	.word 0x85a2892b  ! 982: FMULs	fmuls	%f10, %f11, %f2
	.word 0xc3eaac98  ! 983: PREFETCHA_I	prefetcha	[%r10, + 0x0c98] %asi, #one_read
	.word 0x2c800003  ! 984: BNEG	bneg,a	<label_0x3>
	.word 0xc45aa4f0  ! 985: LDX_I	ldx	[%r10 + 0x04f0], %r2
	.word 0x8143c000  ! 986: STBAR	stbar
	.word 0xc73aaf88  ! 987: STDF_I	std	%f3, [0x0f88, %r10]
	.word 0x85da800b  ! 988: FLUSH_R	dis not found

	.word 0xf4baa788  ! 989: STDA_I	stda	%r26, [%r10 + 0x0788] %asi
	.word 0x85da800b  ! 990: FLUSH_R	dis not found

	.word 0x83daa280  ! 991: FLUSH_I	dis not found

	.word 0xccea900b  ! 992: LDSTUBA_R	ldstuba	%r6, [%r10 + %r11] 0x80
	.word 0xc682900b  ! 993: LDUWA_R	lduwa	[%r10, %r11] 0x80, %r3
	.word 0xe2ca900b  ! 994: LDSBA_R	ldsba	[%r10, %r11] 0x80, %r17
	.word 0xc3eaa36c  ! 995: PREFETCHA_I	prefetcha	[%r10, + 0x036c] %asi, #one_read
	.word 0xceb2900b  ! 996: STHA_R	stha	%r7, [%r10 + %r11] 0x80
	.word 0xc73a800b  ! 997: STDF_R	std	%f3, [%r11, %r10]
	.word 0x26c20001  ! 998: BRLZ	brlz,a,nt	%8,<label_0x20001>
	.word 0xda82a3a8  ! 999: LDUWA_I	lduwa	[%r10, + 0x03a8] %asi, %r13
	nop
	nop
	nop
        ta      T_GOOD_TRAP
th_main_3:
        setx  MAIN_BASE_DATA_VA, %r1, %r10
        setx  0x0000000000000dd0, %g1, %r11
        setx  0x80, %g2, %g1
        wr  %g1, %g0, %asi
	    rd %fprs, %g1
        wr %g1, 0x4, %fprs
	ldd	[%r10 + 0], %f0
	ldd	[%r10 + 8], %f2
	ldd	[%r10 + 16], %f4
	ldd	[%r10 + 24], %f6
	ldd	[%r10 + 32], %f8
	ldd	[%r10 + 40], %f10
	ldd	[%r10 + 48], %f12
	ldd	[%r10 + 56], %f14
	ldd	[%r10 + 64], %f16
	ldd	[%r10 + 72], %f18
	ldd	[%r10 + 80], %f20
	ldd	[%r10 + 88], %f22
	ldd	[%r10 + 96], %f24
	ldd	[%r10 + 104], %f26
	ldd	[%r10 + 112], %f28
	ldd	[%r10 + 120], %f30
	ldd	[%r10 + 128], %f32
	ldd	[%r10 + 136], %f34
	ldd	[%r10 + 144], %f36
	ldd	[%r10 + 152], %f38
	ldd	[%r10 + 160], %f40
	ldd	[%r10 + 168], %f42
	ldd	[%r10 + 176], %f44
	ldd	[%r10 + 184], %f46
	ldd	[%r10 + 192], %f48
	ldd	[%r10 + 200], %f50
	ldd	[%r10 + 208], %f52
	ldd	[%r10 + 216], %f54
	ldd	[%r10 + 224], %f56
	ldd	[%r10 + 232], %f58
	ldd	[%r10 + 240], %f60
	ldd	[%r10 + 248], %f62
        setx  0x2cc3ca1e8a31ceee, %g1, %r0
        setx  0x60d0aed2c84f4f29, %g1, %r1
        setx  0x5f39ac28611f3b44, %g1, %r2
        setx  0x0a8b81462c50f867, %g1, %r3
        setx  0x6ee6fdbf856f5d9e, %g1, %r4
        setx  0x66b2464b11825a33, %g1, %r5
        setx  0x329911b352b7c1a3, %g1, %r6
        setx  0xf2723ec3e74d7d37, %g1, %r7
        setx  0x0281b86feb7c74d1, %g1, %r8
        setx  0xc836a16b60e1ac43, %g1, %r9
        setx  0x58350b4c34d88bac, %g1, %r12
        setx  0xc05ddb8840e2c39c, %g1, %r13
        setx  0x282bef1c0a8b8c54, %g1, %r14
        setx  0xb29397aaf0b53cca, %g1, %r15
        setx  0x190ea253b422d126, %g1, %r16
        setx  0x50e7f316effa1681, %g1, %r17
        setx  0x25a3a7eede236cfe, %g1, %r18
        setx  0x1267be4fae4348ab, %g1, %r19
        setx  0x7e2623cf81ce7518, %g1, %r20
        setx  0xe59a3b999c5ca39d, %g1, %r21
        setx  0x16ba08d64e26dc0c, %g1, %r22
        setx  0x4c5e005de7a3a0a1, %g1, %r23
        setx  0xa5b5a81f50a947b1, %g1, %r24
        setx  0xdf561a45a722106d, %g1, %r25
        setx  0xf52ed96aeb751d6d, %g1, %r26
        setx  0x7c8fbabefd070ab2, %g1, %r27
        setx  0xff15e25dbe91b803, %g1, %r28
        setx  0x67c505196e1e5257, %g1, %r29
        setx  0xbaa7f18456f8cedf, %g1, %r30
        setx  0x12a08c2c3fc82dd1, %g1, %r31
	.word 0x8143e00b  ! 6: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore 
	.word 0xc6b2900b  ! 7: STHA_R	stha	%r3, [%r10 + %r11] 0x80
	.word 0xa272a7f0  ! 9: UDIV_I	udiv 	%r10, 0x07f0, %r17
	.word 0xdd3a800b  ! 11: STDF_R	std	%f14, [%r11, %r10]
	.word 0xdd3aa680  ! 12: STDF_I	std	%f14, [0x0680, %r10]
	.word 0x8652ae3c  ! 13: UMUL_I	umul 	%r10, 0x0e3c, %r3
	.word 0xca52a9bc  ! 14: LDSH_I	ldsh	[%r10 + 0x09bc], %r5
	.word 0xe09aa690  ! 15: LDDA_I	ldda	[%r10, + 0x0690] %asi, %r16
	.word 0xc81aa108  ! 17: LDD_I	ldd	[%r10 + 0x0108], %r4
	.word 0x9ba2882b  ! 18: FADDs	fadds	%f10, %f11, %f13
	.word 0xd122800b  ! 19: STF_R	st	%f8, [%r11, %r10]
	.word 0xc36aa040  ! 20: PREFETCH_I	prefetch	[%r10 + 0x0040], #one_read
	.word 0x8472800b  ! 21: UDIV_R	udiv 	%r10, %r11, %r2
	.word 0xf67aa29c  ! 22: SWAP_I	swap	%r27, [%r10 + 0x029c]
	.word 0xed3aa420  ! 23: STDF_I	std	%f22, [0x0420, %r10]
	.word 0xcaaa900b  ! 24: STBA_R	stba	%r5, [%r10 + %r11] 0x80
	.word 0xf642800b  ! 25: LDSW_R	ldsw	[%r10 + %r11], %r27
	.word 0x0ec20003  ! 27: BRGEZ	brgez  ,nt	%8,<label_0x20003>
	.word 0xc6ca900b  ! 28: LDSBA_R	ldsba	[%r10, %r11] 0x80, %r3
	.word 0xc4f2ac70  ! 29: STXA_I	stxa	%r2, [%r10 + 0x0c70] %asi
	.word 0x82d2a478  ! 30: UMULcc_I	umulcc 	%r10, 0x0478, %r1
	.word 0xfacaa0c8  ! 31: LDSBA_I	ldsba	[%r10, + 0x00c8] %asi, %r29
	.word 0xc4ba900b  ! 32: STDA_R	stda	%r2, [%r10 + %r11] 0x80
	.word 0xfb22ab84  ! 33: STF_I	st	%f29, [0x0b84, %r10]
	.word 0x83da800b  ! 34: FLUSH_R	dis not found

	.word 0xc4da900b  ! 35: LDXA_R	ldxa	[%r10, %r11] 0x80, %r2
	.word 0xc492a5f0  ! 36: LDUHA_I	lduha	[%r10, + 0x05f0] %asi, %r2
	.word 0x925aa3e8  ! 37: SMUL_I	smul 	%r10, 0x03e8, %r9
	.word 0x2c800003  ! 38: BNEG	bneg,a	<label_0x3>
	.word 0xc2aa900b  ! 39: STBA_R	stba	%r1, [%r10 + %r11] 0x80
	.word 0x85da800b  ! 40: FLUSH_R	dis not found

	.word 0x8a6aa2a0  ! 41: UDIVX_I	udivx 	%r10, 0x02a0, %r5
	.word 0x04c20003  ! 42: BRLEZ	brlez  ,nt	%8,<label_0x20003>
	.word 0xb8daa754  ! 43: SMULcc_I	smulcc 	%r10, 0x0754, %r28
	.word 0xc4fa900b  ! 44: SWAPA_R	swapa	%r2, [%r10 + %r11] 0x80
	.word 0xc40a800b  ! 45: LDUB_R	ldub	[%r10 + %r11], %r2
	.word 0xe6eaa878  ! 46: LDSTUBA_I	ldstuba	%r19, [%r10 + 0x0878] %asi
	.word 0xa3da800b  ! 47: FLUSH_R	dis not found

	.word 0x9052a2cc  ! 48: UMUL_I	umul 	%r10, 0x02cc, %r8
	.word 0xa04aa938  ! 49: MULX_I	mulx 	%r10, 0x0938, %r16
	.word 0xcd22a230  ! 50: STF_I	st	%f6, [0x0230, %r10]
	.word 0xd8aa900b  ! 51: STBA_R	stba	%r12, [%r10 + %r11] 0x80
	.word 0xd2fa900b  ! 52: SWAPA_R	swapa	%r9, [%r10 + %r11] 0x80
	.word 0xd01aa580  ! 53: LDD_I	ldd	[%r10 + 0x0580], %r8
	.word 0xc36a800b  ! 54: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x8143e011  ! 55: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xcadaa718  ! 56: LDXA_I	ldxa	[%r10, + 0x0718] %asi, %r5
	.word 0xf6ea900b  ! 57: LDSTUBA_R	ldstuba	%r27, [%r10 + %r11] 0x80
	.word 0xcbf2a00b  ! 58: CASXA_R	casxa	[%r10]%asi, %r11, %r5
	.word 0x87daa7d8  ! 59: FLUSH_I	dis not found

	.word 0xc2f2900b  ! 60: STXA_R	stxa	%r1, [%r10 + %r11] 0x80
	.word 0x8143e019  ! 61: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside 
	.word 0xc8faa8d4  ! 62: SWAPA_I	swapa	%r4, [%r10 + 0x08d4] %asi
	.word 0xcc12aee4  ! 63: LDUH_I	lduh	[%r10 + 0x0ee4], %r6
	.word 0x8143c000  ! 64: STBAR	stbar
	.word 0xce42acc0  ! 65: LDSW_I	ldsw	[%r10 + 0x0cc0], %r7
	.word 0xae4aa91c  ! 66: MULX_I	mulx 	%r10, 0x091c, %r23
	.word 0xdfe2900b  ! 67: CASA_I	casa	[%r10] 0x80, %r11, %r15
	.word 0xc36a800b  ! 68: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x90d2a160  ! 69: UMULcc_I	umulcc 	%r10, 0x0160, %r8
	.word 0xcafa900b  ! 70: SWAPA_R	swapa	%r5, [%r10 + %r11] 0x80
	.word 0xc522800b  ! 71: STF_R	st	%f2, [%r11, %r10]
	.word 0x8ada800b  ! 72: SMULcc_R	smulcc 	%r10, %r11, %r5
	.word 0xc242800b  ! 73: LDSW_R	ldsw	[%r10 + %r11], %r1
	.word 0xcb22800b  ! 74: STF_R	st	%f5, [%r11, %r10]
	.word 0xc2daa458  ! 75: LDXA_I	ldxa	[%r10, + 0x0458] %asi, %r1
	.word 0x8143c000  ! 76: STBAR	stbar
	.word 0xa7daa28c  ! 77: FLUSH_I	dis not found

	.word 0xaba2892b  ! 78: FMULs	fmuls	%f10, %f11, %f21
	.word 0xd00aa028  ! 79: LDUB_I	ldub	[%r10 + 0x0028], %r8
	.word 0xc3eaa33c  ! 80: PREFETCHA_I	prefetcha	[%r10, + 0x033c] %asi, #one_read
	.word 0x8b6a800b  ! 81: SDIVX_R	sdivx	%r10, %r11, %r5
	.word 0xf412a558  ! 82: LDUH_I	lduh	[%r10 + 0x0558], %r26
	.word 0xd20aad98  ! 83: LDUB_I	ldub	[%r10 + 0x0d98], %r9
	.word 0xd26a800b  ! 84: LDSTUB_R	ldstub	%r9, [%r10 + %r11]
	.word 0xc492900b  ! 86: LDUHA_R	lduha	[%r10, %r11] 0x80, %r2
	.word 0xd842800b  ! 87: LDSW_R	ldsw	[%r10 + %r11], %r12
	.word 0x8143c000  ! 88: STBAR	stbar
	.word 0xe89a900b  ! 89: LDDA_R	ldda	[%r10, %r11] 0x80, %r20
	.word 0xc41aa7f8  ! 90: LDD_I	ldd	[%r10 + 0x07f8], %r2
	.word 0xc9e2900b  ! 91: CASA_I	casa	[%r10] 0x80, %r11, %r4
	.word 0xc60a800b  ! 92: LDUB_R	ldub	[%r10 + %r11], %r3
	.word 0xc36a800b  ! 93: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x9bda800b  ! 94: FLUSH_R	dis not found

	.word 0xc522a954  ! 95: STF_I	st	%f2, [0x0954, %r10]
	.word 0x04800001  ! 96: BLE	ble  	<label_0x1>
	.word 0xfed2900b  ! 97: LDSHA_R	ldsha	[%r10, %r11] 0x80, %r31
	.word 0xc0ba900b  ! 98: STDA_R	stda	%r0, [%r10 + %r11] 0x80
	.word 0x0c800001  ! 99: BNEG	bneg  	<label_0x1>
	.word 0x8143e03d  ! 100: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0x28800001  ! 101: BLEU	bleu,a	<label_0x1>
	.word 0x82da800b  ! 103: SMULcc_R	smulcc 	%r10, %r11, %r1
	.word 0x844a800b  ! 104: MULX_R	mulx 	%r10, %r11, %r2
	.word 0x91da800b  ! 105: FLUSH_R	dis not found

	.word 0x3c800003  ! 106: BPOS	bpos,a	<label_0x3>
	.word 0x8143e01a  ! 107: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside 
	.word 0x8dda800b  ! 108: FLUSH_R	dis not found

	.word 0x20800001  ! 109: BN	bn,a	<label_0x1>
	.word 0xabda800b  ! 110: FLUSH_R	dis not found

	.word 0xb56aa300  ! 111: SDIVX_I	sdivx	%r10, 0x0300, %r26
	.word 0x87da800b  ! 112: FLUSH_R	dis not found

	.word 0xc36aa15c  ! 113: PREFETCH_I	prefetch	[%r10 + 0x015c], #one_read
	.word 0xc4baa6b0  ! 114: STDA_I	stda	%r2, [%r10 + 0x06b0] %asi
	.word 0xe692af2c  ! 115: LDUHA_I	lduha	[%r10, + 0x0f2c] %asi, %r19
	.word 0x87daaa5c  ! 116: FLUSH_I	dis not found

	.word 0xcff2900b  ! 117: CASXA_I	casxa	[%r10] 0x80, %r11, %r7
	.word 0x927a800b  ! 118: SDIV_R	sdiv 	%r10, %r11, %r9
	.word 0xa4fa800b  ! 119: SDIVcc_R	sdivcc 	%r10, %r11, %r18
	.word 0xcf22800b  ! 120: STF_R	st	%f7, [%r11, %r10]
	.word 0x836a800b  ! 121: SDIVX_R	sdivx	%r10, %r11, %r1
	.word 0x89a289ab  ! 122: FDIVs	fdivs	%f10, %f11, %f4
	.word 0x36800003  ! 123: BGE	bge,a	<label_0x3>
	.word 0x8ddaa344  ! 124: FLUSH_I	dis not found

	.word 0xe4aaa0cc  ! 125: STBA_I	stba	%r18, [%r10 + 0x00cc] %asi
	.word 0xc3eaa080  ! 126: PREFETCHA_I	prefetcha	[%r10, + 0x0080] %asi, #one_read
	.word 0xce92900b  ! 128: LDUHA_R	lduha	[%r10, %r11] 0x80, %r7
	.word 0x86f2800b  ! 129: UDIVcc_R	udivcc 	%r10, %r11, %r3
	.word 0x846aa248  ! 130: UDIVX_I	udivx 	%r10, 0x0248, %r2
	.word 0x91da800b  ! 131: FLUSH_R	dis not found

	.word 0xce8a900b  ! 132: LDUBA_R	lduba	[%r10, %r11] 0x80, %r7
	.word 0x30800001  ! 133: BA	ba,a	<label_0x1>
	.word 0x9872a340  ! 134: UDIV_I	udiv 	%r10, 0x0340, %r12
	.word 0xb722af34  ! 135: MULScc_I	mulscc 	%r10, 0x0f34, %r27
	.word 0xdcf2900b  ! 136: STXA_R	stxa	%r14, [%r10 + %r11] 0x80
	.word 0xe842800b  ! 137: LDSW_R	ldsw	[%r10 + %r11], %r20
	.word 0xa0f2800b  ! 138: UDIVcc_R	udivcc 	%r10, %r11, %r16
	.word 0xb5daa444  ! 139: FLUSH_I	dis not found

	.word 0xe3f2900b  ! 140: CASXA_I	casxa	[%r10] 0x80, %r11, %r17
	.word 0x93a288ab  ! 141: FSUBs	fsubs	%f10, %f11, %f9
	.word 0xe682900b  ! 142: LDUWA_R	lduwa	[%r10, %r11] 0x80, %r19
	.word 0x85a2882b  ! 143: FADDs	fadds	%f10, %f11, %f2
	.word 0xca52800b  ! 144: LDSH_R	ldsh	[%r10 + %r11], %r5
	.word 0x8143c000  ! 145: STBAR	stbar
	.word 0xc922800b  ! 146: STF_R	st	%f4, [%r11, %r10]
	.word 0xf41a800b  ! 147: LDD_R	ldd	[%r10 + %r11], %r26
	.word 0xdac2900b  ! 148: LDSWA_R	ldswa	[%r10, %r11] 0x80, %r13
	.word 0x08800003  ! 149: BLEU	bleu  	<label_0x3>
	.word 0x89da800b  ! 150: FLUSH_R	dis not found

	.word 0x904a800b  ! 151: MULX_R	mulx 	%r10, %r11, %r8
	.word 0x83a2892b  ! 152: FMULs	fmuls	%f10, %f11, %f1
	.word 0xc33a800b  ! 153: STDF_R	std	%f1, [%r11, %r10]
	.word 0x8143e049  ! 154: MEMBAR	membar	#LoadLoad | #StoreStore | #Sync 
	.word 0x8c52800b  ! 155: UMUL_R	umul 	%r10, %r11, %r6
	.word 0xc4d2900b  ! 156: LDSHA_R	ldsha	[%r10, %r11] 0x80, %r2
	.word 0xb2fa800b  ! 157: SDIVcc_R	sdivcc 	%r10, %r11, %r25
	.word 0xecc2900b  ! 158: LDSWA_R	ldswa	[%r10, %r11] 0x80, %r22
	.word 0xc36a800b  ! 159: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x04800003  ! 160: BLE	ble  	<label_0x3>
	.word 0xa67a800b  ! 161: SDIV_R	sdiv 	%r10, %r11, %r19
	.word 0x8f22a910  ! 162: MULScc_I	mulscc 	%r10, 0x0910, %r7
	.word 0x83da800b  ! 163: FLUSH_R	dis not found

	.word 0x87da800b  ! 164: FLUSH_R	dis not found

	.word 0xcc6aa180  ! 165: LDSTUB_I	ldstub	%r6, [%r10 + 0x0180]
	.word 0xc842a884  ! 166: LDSW_I	ldsw	[%r10 + 0x0884], %r4
	.word 0x06c20001  ! 167: BRLZ	brlz  ,nt	%8,<label_0x20001>
	.word 0xcd3aad60  ! 168: STDF_I	std	%f6, [0x0d60, %r10]
	.word 0x83daa068  ! 169: FLUSH_I	dis not found

	.word 0x02ca0003  ! 170: BRZ	brz  ,pt	%8,<label_0xa0003>
	.word 0xca52aba8  ! 171: LDSH_I	ldsh	[%r10 + 0x0ba8], %r5
	.word 0xecfa900b  ! 172: SWAPA_R	swapa	%r22, [%r10 + %r11] 0x80
	.word 0x2c800003  ! 173: BNEG	bneg,a	<label_0x3>
	.word 0xca12800b  ! 174: LDUH_R	lduh	[%r10 + %r11], %r5
	.word 0xf8a2a320  ! 175: STWA_I	stwa	%r28, [%r10 + 0x0320] %asi
	.word 0xc3ea900b  ! 176: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0x04ca0001  ! 177: BRLEZ	brlez  ,pt	%8,<label_0xa0001>
	.word 0xc47a800b  ! 178: SWAP_R	swap	%r2, [%r10 + %r11]
	.word 0xd27a800b  ! 179: SWAP_R	swap	%r9, [%r10 + %r11]
	.word 0x8e4a800b  ! 180: MULX_R	mulx 	%r10, %r11, %r7
	.word 0x867aaeb0  ! 181: SDIV_I	sdiv 	%r10, 0x0eb0, %r3
	.word 0xfd3aab60  ! 182: STDF_I	std	%f30, [0x0b60, %r10]
	.word 0xc4ba900b  ! 183: STDA_R	stda	%r2, [%r10 + %r11] 0x80
	.word 0xfaaa900b  ! 184: STBA_R	stba	%r29, [%r10 + %r11] 0x80
	.word 0xf7f2a00b  ! 186: CASXA_R	casxa	[%r10]%asi, %r11, %r27
	.word 0x22c20003  ! 187: BRZ	brz,a,nt	%8,<label_0x20003>
	.word 0x8fda800b  ! 188: FLUSH_R	dis not found

	.word 0x9ada800b  ! 189: SMULcc_R	smulcc 	%r10, %r11, %r13
	.word 0xc922ac00  ! 190: STF_I	st	%f4, [0x0c00, %r10]
	.word 0xf0d2a1f4  ! 191: LDSHA_I	ldsha	[%r10, + 0x01f4] %asi, %r24
	.word 0xccf2900b  ! 192: STXA_R	stxa	%r6, [%r10 + %r11] 0x80
	.word 0xac6a800b  ! 193: UDIVX_R	udivx 	%r10, %r11, %r22
	.word 0xf84a800b  ! 194: LDSB_R	ldsb	[%r10 + %r11], %r28
	.word 0xcde2900b  ! 195: CASA_I	casa	[%r10] 0x80, %r11, %r6
	.word 0x8143c000  ! 196: STBAR	stbar
	.word 0xe85a800b  ! 197: LDX_R	ldx	[%r10 + %r11], %r20
	.word 0xeed2a814  ! 198: LDSHA_I	ldsha	[%r10, + 0x0814] %asi, %r23
	.word 0xd08aa1a8  ! 199: LDUBA_I	lduba	[%r10, + 0x01a8] %asi, %r8
	.word 0x34800003  ! 200: BG	bg,a	<label_0x3>
	.word 0xc6aa900b  ! 201: STBA_R	stba	%r3, [%r10 + %r11] 0x80
	.word 0xf9e2900b  ! 202: CASA_I	casa	[%r10] 0x80, %r11, %r28
	.word 0x89daa134  ! 203: FLUSH_I	dis not found

	.word 0xc2c2900b  ! 204: LDSWA_R	ldswa	[%r10, %r11] 0x80, %r1
	.word 0xdaaaa11c  ! 205: STBA_I	stba	%r13, [%r10 + 0x011c] %asi
	.word 0xc3ea900b  ! 206: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0x8f22a1e4  ! 208: MULScc_I	mulscc 	%r10, 0x01e4, %r7
	.word 0xc87a800b  ! 209: SWAP_R	swap	%r4, [%r10 + %r11]
	.word 0xe4d2a774  ! 210: LDSHA_I	ldsha	[%r10, + 0x0774] %asi, %r18
	.word 0xfad2a484  ! 211: LDSHA_I	ldsha	[%r10, + 0x0484] %asi, %r29
	.word 0xdcbaaff8  ! 212: STDA_I	stda	%r14, [%r10 + 0x0ff8] %asi
	.word 0xc24aaa10  ! 213: LDSB_I	ldsb	[%r10 + 0x0a10], %r1
	.word 0x8143e035  ! 214: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside | #MemIssue 
	.word 0x85da800b  ! 215: FLUSH_R	dis not found

	.word 0xc28a900b  ! 216: LDUBA_R	lduba	[%r10, %r11] 0x80, %r1
	.word 0xb9daa958  ! 217: FLUSH_I	dis not found

	.word 0xf0aaae34  ! 218: STBA_I	stba	%r24, [%r10 + 0x0e34] %asi
	.word 0x9ddaaae0  ! 219: FLUSH_I	dis not found

	.word 0xc36aadd0  ! 220: PREFETCH_I	prefetch	[%r10 + 0x0dd0], #one_read
	.word 0x90f2a1dc  ! 221: UDIVcc_I	udivcc 	%r10, 0x01dc, %r8
	.word 0xe0b2a948  ! 222: STHA_I	stha	%r16, [%r10 + 0x0948] %asi
	.word 0x9ddaa27c  ! 223: FLUSH_I	dis not found

	.word 0xd0da900b  ! 224: LDXA_R	ldxa	[%r10, %r11] 0x80, %r8
	.word 0x9322800b  ! 225: MULScc_R	mulscc 	%r10, %r11, %r9
	.word 0x85daa084  ! 226: FLUSH_I	dis not found

	.word 0x87a288ab  ! 227: FSUBs	fsubs	%f10, %f11, %f3
	.word 0xb47aa2ac  ! 228: SDIV_I	sdiv 	%r10, 0x02ac, %r26
	.word 0xc292900b  ! 229: LDUHA_R	lduha	[%r10, %r11] 0x80, %r1
	.word 0xecaa900b  ! 230: STBA_R	stba	%r22, [%r10 + %r11] 0x80
	.word 0xd9f2900b  ! 231: CASXA_I	casxa	[%r10] 0x80, %r11, %r12
	.word 0xc8f2900b  ! 232: STXA_R	stxa	%r4, [%r10 + %r11] 0x80
	.word 0x8ef2a4fc  ! 233: UDIVcc_I	udivcc 	%r10, 0x04fc, %r7
	.word 0x91a2882b  ! 234: FADDs	fadds	%f10, %f11, %f8
	.word 0x8b6aa180  ! 235: SDIVX_I	sdivx	%r10, 0x0180, %r5
	.word 0xc36aab98  ! 236: PREFETCH_I	prefetch	[%r10 + 0x0b98], #one_read
	.word 0x87daa3d8  ! 237: FLUSH_I	dis not found

	.word 0xe65aa330  ! 238: LDX_I	ldx	[%r10 + 0x0330], %r19
	.word 0xf892900b  ! 239: LDUHA_R	lduha	[%r10, %r11] 0x80, %r28
	.word 0xc4d2afc4  ! 240: LDSHA_I	ldsha	[%r10, + 0x0fc4] %asi, %r2
	.word 0x34800001  ! 241: BG	bg,a	<label_0x1>
	.word 0x8cf2800b  ! 242: UDIVcc_R	udivcc 	%r10, %r11, %r6
	.word 0xcc9a900b  ! 243: LDDA_R	ldda	[%r10, %r11] 0x80, %r6
	.word 0xc7e2900b  ! 244: CASA_I	casa	[%r10] 0x80, %r11, %r3
	.word 0x0c800001  ! 246: BNEG	bneg  	<label_0x1>
	.word 0xc882900b  ! 248: LDUWA_R	lduwa	[%r10, %r11] 0x80, %r4
	.word 0x905a800b  ! 249: SMUL_R	smul 	%r10, %r11, %r8
	.word 0x8143e05c  ! 250: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0x836a800b  ! 251: SDIVX_R	sdivx	%r10, %r11, %r1
	.word 0x8143e07c  ! 252: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0x865aade4  ! 253: SMUL_I	smul 	%r10, 0x0de4, %r3
	.word 0xc3ea900b  ! 254: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0xeaf2900b  ! 255: STXA_R	stxa	%r21, [%r10 + %r11] 0x80
	.word 0xb46aa6b8  ! 256: UDIVX_I	udivx 	%r10, 0x06b8, %r26
	.word 0x36800001  ! 257: BGE	bge,a	<label_0x1>
	.word 0xc64aa044  ! 258: LDSB_I	ldsb	[%r10 + 0x0044], %r3
	.word 0x8ba288ab  ! 259: FSUBs	fsubs	%f10, %f11, %f5
	.word 0xab22a640  ! 260: MULScc_I	mulscc 	%r10, 0x0640, %r21
	.word 0xd0caa67c  ! 261: LDSBA_I	ldsba	[%r10, + 0x067c] %asi, %r8
	.word 0xccea900b  ! 262: LDSTUBA_R	ldstuba	%r6, [%r10 + %r11] 0x80
	.word 0x8143c000  ! 263: STBAR	stbar
	.word 0xc9f2a00b  ! 264: CASXA_R	casxa	[%r10]%asi, %r11, %r4
	.word 0x8bda800b  ! 265: FLUSH_R	dis not found

	.word 0x87da800b  ! 266: FLUSH_R	dis not found

	.word 0x84f2800b  ! 267: UDIVcc_R	udivcc 	%r10, %r11, %r2
	.word 0xccf2900b  ! 268: STXA_R	stxa	%r6, [%r10 + %r11] 0x80
	.word 0xccda900b  ! 269: LDXA_R	ldxa	[%r10, %r11] 0x80, %r6
	.word 0x8143c000  ! 270: STBAR	stbar
	.word 0xc6a2a248  ! 271: STWA_I	stwa	%r3, [%r10 + 0x0248] %asi
	.word 0xdbf2900b  ! 272: CASXA_I	casxa	[%r10] 0x80, %r11, %r13
	.word 0xfc9aae10  ! 273: LDDA_I	ldda	[%r10, + 0x0e10] %asi, %r30
	.word 0xcc5aac90  ! 274: LDX_I	ldx	[%r10 + 0x0c90], %r6
	.word 0xc3e2a00b  ! 275: CASA_R	casa	[%r10] %asi, %r11, %r1
	.word 0xce92900b  ! 276: LDUHA_R	lduha	[%r10, %r11] 0x80, %r7
	.word 0xe722800b  ! 277: STF_R	st	%f19, [%r11, %r10]
	.word 0x8b6aaff0  ! 278: SDIVX_I	sdivx	%r10, 0x0ff0, %r5
	.word 0x8143e021  ! 279: MEMBAR	membar	#LoadLoad | #MemIssue 
	.word 0xc2da900b  ! 280: LDXA_R	ldxa	[%r10, %r11] 0x80, %r1
	.word 0x8143c000  ! 281: STBAR	stbar
	.word 0xe4ba900b  ! 282: STDA_R	stda	%r18, [%r10 + %r11] 0x80
	.word 0xb5a289ab  ! 283: FDIVs	fdivs	%f10, %f11, %f26
	.word 0x8efa800b  ! 284: SDIVcc_R	sdivcc 	%r10, %r11, %r7
	.word 0xc36aac1c  ! 285: PREFETCH_I	prefetch	[%r10 + 0x0c1c], #one_read
	.word 0xcc1aaac0  ! 286: LDD_I	ldd	[%r10 + 0x0ac0], %r6
	.word 0x91da800b  ! 287: FLUSH_R	dis not found

	.word 0x8143e05a  ! 288: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside | #Sync 
	.word 0xce8aa3c0  ! 289: LDUBA_I	lduba	[%r10, + 0x03c0] %asi, %r7
	.word 0x8fa289ab  ! 290: FDIVs	fdivs	%f10, %f11, %f7
	.word 0x8143e079  ! 292: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xc8b2900b  ! 293: STHA_R	stha	%r4, [%r10 + %r11] 0x80
	.word 0xcefa900b  ! 294: SWAPA_R	swapa	%r7, [%r10 + %r11] 0x80
	.word 0xcfe2900b  ! 296: CASA_I	casa	[%r10] 0x80, %r11, %r7
	.word 0xe202a764  ! 297: LDUW_I	lduw	[%r10 + 0x0764], %r17
	.word 0x916aa7f0  ! 299: SDIVX_I	sdivx	%r10, 0x07f0, %r8
	.word 0xde52a960  ! 300: LDSH_I	ldsh	[%r10 + 0x0960], %r15
	.word 0xe4eaa1a4  ! 301: LDSTUBA_I	ldstuba	%r18, [%r10 + 0x01a4] %asi
	.word 0x8322800b  ! 302: MULScc_R	mulscc 	%r10, %r11, %r1
	.word 0x20800003  ! 303: BN	bn,a	<label_0x3>
	.word 0xcaea900b  ! 304: LDSTUBA_R	ldstuba	%r5, [%r10 + %r11] 0x80
	.word 0xc252800b  ! 305: LDSH_R	ldsh	[%r10 + %r11], %r1
	.word 0xb24aa71c  ! 306: MULX_I	mulx 	%r10, 0x071c, %r25
	.word 0xc3ea900b  ! 307: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0xd8ba900b  ! 309: STDA_R	stda	%r12, [%r10 + %r11] 0x80
	.word 0xcaa2a658  ! 310: STWA_I	stwa	%r5, [%r10 + 0x0658] %asi
	.word 0x8bda800b  ! 311: FLUSH_R	dis not found

	.word 0xf2faa2e0  ! 312: SWAPA_I	swapa	%r25, [%r10 + 0x02e0] %asi
	.word 0xada288ab  ! 313: FSUBs	fsubs	%f10, %f11, %f22
	.word 0xb2d2800b  ! 314: UMULcc_R	umulcc 	%r10, %r11, %r25
	.word 0x40000003  ! 315: CALL	call	disp30_3
	.word 0x1a800003  ! 318: BCC	bcc  	<label_0x3>
	.word 0xf402aef4  ! 319: LDUW_I	lduw	[%r10 + 0x0ef4], %r26
	.word 0x8a4aad74  ! 320: MULX_I	mulx 	%r10, 0x0d74, %r5
	.word 0xc282a8bc  ! 321: LDUWA_I	lduwa	[%r10, + 0x08bc] %asi, %r1
	.word 0x8143c000  ! 322: STBAR	stbar
	.word 0x16800001  ! 323: BGE	bge  	<label_0x1>
	.word 0x8143c000  ! 324: STBAR	stbar
	.word 0x36800003  ! 325: BGE	bge,a	<label_0x3>
	.word 0x0c800003  ! 326: BNEG	bneg  	<label_0x3>
	.word 0x8fa289ab  ! 327: FDIVs	fdivs	%f10, %f11, %f7
	.word 0xe012800b  ! 328: LDUH_R	lduh	[%r10 + %r11], %r16
	.word 0x8143e00d  ! 329: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore 
	.word 0x2cca0001  ! 330: BRGZ	brgz,a,pt	%8,<label_0xa0001>
	.word 0xc36aa2c0  ! 331: PREFETCH_I	prefetch	[%r10 + 0x02c0], #one_read
	.word 0xcd3a800b  ! 332: STDF_R	std	%f6, [%r11, %r10]
	.word 0x99da800b  ! 333: FLUSH_R	dis not found

	.word 0xa872800b  ! 334: UDIV_R	udiv 	%r10, %r11, %r20
	.word 0x02c20001  ! 335: BRZ	brz  ,nt	%8,<label_0x20001>
	.word 0xf4a2900b  ! 336: STWA_R	stwa	%r26, [%r10 + %r11] 0x80
	.word 0x36800003  ! 337: BGE	bge,a	<label_0x3>
	.word 0x8c6a800b  ! 338: UDIVX_R	udivx 	%r10, %r11, %r6
	.word 0x8722a160  ! 339: MULScc_I	mulscc 	%r10, 0x0160, %r3
	.word 0xd122800b  ! 340: STF_R	st	%f8, [%r11, %r10]
	.word 0xb3daa040  ! 341: FLUSH_I	dis not found

	.word 0xc8aaa198  ! 342: STBA_I	stba	%r4, [%r10 + 0x0198] %asi
	.word 0x28800001  ! 343: BLEU	bleu,a	<label_0x1>
	.word 0xce52aae8  ! 344: LDSH_I	ldsh	[%r10 + 0x0ae8], %r7
	.word 0x34800003  ! 345: BG	bg,a	<label_0x3>
	.word 0x8b22800b  ! 346: MULScc_R	mulscc 	%r10, %r11, %r5
	.word 0x93a289ab  ! 347: FDIVs	fdivs	%f10, %f11, %f9
	.word 0x8da2882b  ! 348: FADDs	fadds	%f10, %f11, %f6
	.word 0xe4baa198  ! 349: STDA_I	stda	%r18, [%r10 + 0x0198] %asi
	.word 0xa0d2800b  ! 350: UMULcc_R	umulcc 	%r10, %r11, %r16
	.word 0xc46aa0c4  ! 351: LDSTUB_I	ldstub	%r2, [%r10 + 0x00c4]
	.word 0x85da800b  ! 352: FLUSH_R	dis not found

	.word 0x8143c000  ! 353: STBAR	stbar
	.word 0xe0aaab0c  ! 354: STBA_I	stba	%r16, [%r10 + 0x0b0c] %asi
	.word 0x91daa1b4  ! 355: FLUSH_I	dis not found

	.word 0xd202800b  ! 356: LDUW_R	lduw	[%r10 + %r11], %r9
	.word 0xd2b2900b  ! 357: STHA_R	stha	%r9, [%r10 + %r11] 0x80
	.word 0x85da800b  ! 358: FLUSH_R	dis not found

	.word 0xd322800b  ! 359: STF_R	st	%f9, [%r11, %r10]
	.word 0xc36aaaa4  ! 360: PREFETCH_I	prefetch	[%r10 + 0x0aa4], #one_read
	.word 0xeed2a5f8  ! 361: LDSHA_I	ldsha	[%r10, + 0x05f8] %asi, %r23
	.word 0x34800001  ! 362: BG	bg,a	<label_0x1>
	.word 0xcc6a800b  ! 363: LDSTUB_R	ldstub	%r6, [%r10 + %r11]
	.word 0xac7aa3cc  ! 364: SDIV_I	sdiv 	%r10, 0x03cc, %r22
	.word 0xbddaa8e8  ! 365: FLUSH_I	dis not found

	.word 0x904aaec4  ! 366: MULX_I	mulx 	%r10, 0x0ec4, %r8
	.word 0xb5a2892b  ! 367: FMULs	fmuls	%f10, %f11, %f26
	.word 0xd2ea900b  ! 368: LDSTUBA_R	ldstuba	%r9, [%r10 + %r11] 0x80
	.word 0xd0caadbc  ! 369: LDSBA_I	ldsba	[%r10, + 0x0dbc] %asi, %r8
	.word 0x8143e032  ! 370: MEMBAR	membar	#StoreLoad | #Lookaside | #MemIssue 
	.word 0xebe2900b  ! 371: CASA_I	casa	[%r10] 0x80, %r11, %r21
	.word 0xf0b2a038  ! 372: STHA_I	stha	%r24, [%r10 + 0x0038] %asi
	.word 0xc36a800b  ! 373: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x06800001  ! 374: BL	bl  	<label_0x1>
	.word 0xc46aabac  ! 375: LDSTUB_I	ldstub	%r2, [%r10 + 0x0bac]
	.word 0x8e6a800b  ! 376: UDIVX_R	udivx 	%r10, %r11, %r7
	.word 0xcd3a800b  ! 377: STDF_R	std	%f6, [%r11, %r10]
	.word 0x8872a578  ! 378: UDIV_I	udiv 	%r10, 0x0578, %r4
	.word 0x8a6aa8a8  ! 379: UDIVX_I	udivx 	%r10, 0x08a8, %r5
	.word 0xc922800b  ! 380: STF_R	st	%f4, [%r11, %r10]
	.word 0x3a800003  ! 381: BCC	bcc,a	<label_0x3>
	.word 0xc85aa510  ! 382: LDX_I	ldx	[%r10 + 0x0510], %r4
	.word 0xcdf2a00b  ! 383: CASXA_R	casxa	[%r10]%asi, %r11, %r6
	.word 0xc2eaa004  ! 384: LDSTUBA_I	ldstuba	%r1, [%r10 + 0x0004] %asi
	.word 0xcca2900b  ! 385: STWA_R	stwa	%r6, [%r10 + %r11] 0x80
	.word 0xcff2900b  ! 386: CASXA_I	casxa	[%r10] 0x80, %r11, %r7
	.word 0xa7a289ab  ! 387: FDIVs	fdivs	%f10, %f11, %f19
	.word 0x85a289ab  ! 388: FDIVs	fdivs	%f10, %f11, %f2
	.word 0x8a5aad58  ! 389: SMUL_I	smul 	%r10, 0x0d58, %r5
	.word 0x8143e07c  ! 390: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xb2faadb4  ! 391: SDIVcc_I	sdivcc 	%r10, 0x0db4, %r25
	.word 0xc36aa590  ! 392: PREFETCH_I	prefetch	[%r10 + 0x0590], #one_read
	.word 0x87da800b  ! 393: FLUSH_R	dis not found

	.word 0x87daa924  ! 394: FLUSH_I	dis not found

	.word 0xdb22800b  ! 395: STF_R	st	%f13, [%r11, %r10]
	.word 0xecb2af7c  ! 396: STHA_I	stha	%r22, [%r10 + 0x0f7c] %asi
	.word 0x8bda800b  ! 397: FLUSH_R	dis not found

	.word 0xe4ca900b  ! 398: LDSBA_R	ldsba	[%r10, %r11] 0x80, %r18
	.word 0x8e72800b  ! 399: UDIV_R	udiv 	%r10, %r11, %r7
	.word 0x86f2a340  ! 400: UDIVcc_I	udivcc 	%r10, 0x0340, %r3
	.word 0xe2aa900b  ! 401: STBA_R	stba	%r17, [%r10 + %r11] 0x80
	.word 0xecaaab10  ! 402: STBA_I	stba	%r22, [%r10 + 0x0b10] %asi
	.word 0xee5a800b  ! 403: LDX_R	ldx	[%r10 + %r11], %r23
	.word 0x89da800b  ! 404: FLUSH_R	dis not found

	.word 0xdcb2900b  ! 405: STHA_R	stha	%r14, [%r10 + %r11] 0x80
	.word 0xc8a2a5ec  ! 406: STWA_I	stwa	%r4, [%r10 + 0x05ec] %asi
	.word 0xaef2a3cc  ! 407: UDIVcc_I	udivcc 	%r10, 0x03cc, %r23
	.word 0x8452a90c  ! 408: UMUL_I	umul 	%r10, 0x090c, %r2
	.word 0x83daac30  ! 409: FLUSH_I	dis not found

	.word 0x8143c000  ! 410: STBAR	stbar
	.word 0x2a800001  ! 411: BCS	bcs,a	<label_0x1>
	.word 0x826aa2b0  ! 412: UDIVX_I	udivx 	%r10, 0x02b0, %r1
	.word 0xdd3aa3a0  ! 413: STDF_I	std	%f14, [0x03a0, %r10]
	.word 0x3a800001  ! 414: BCC	bcc,a	<label_0x1>
	.word 0xb87aa9f8  ! 415: SDIV_I	sdiv 	%r10, 0x09f8, %r28
	.word 0xc3ea900b  ! 416: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0x92f2aaac  ! 417: UDIVcc_I	udivcc 	%r10, 0x0aac, %r9
	.word 0x8143e036  ! 418: MEMBAR	membar	#StoreLoad | #LoadStore | #Lookaside | #MemIssue 
	.word 0xfecaad18  ! 419: LDSBA_I	ldsba	[%r10, + 0x0d18] %asi, %r31
	.word 0x9bda800b  ! 420: FLUSH_R	dis not found

	.word 0xbe6aa088  ! 421: UDIVX_I	udivx 	%r10, 0x0088, %r31
	.word 0xd122800b  ! 422: STF_R	st	%f8, [%r11, %r10]
	.word 0xc9f2900b  ! 423: CASXA_I	casxa	[%r10] 0x80, %r11, %r4
	.word 0x8e7a800b  ! 424: SDIV_R	sdiv 	%r10, %r11, %r7
	.word 0xca42a1cc  ! 425: LDSW_I	ldsw	[%r10 + 0x01cc], %r5
	.word 0xceaa900b  ! 426: STBA_R	stba	%r7, [%r10 + %r11] 0x80
	.word 0x8b22ae04  ! 427: MULScc_I	mulscc 	%r10, 0x0e04, %r5
	.word 0xc36aa080  ! 428: PREFETCH_I	prefetch	[%r10 + 0x0080], #one_read
	.word 0xabdaa484  ! 429: FLUSH_I	dis not found

	.word 0xf6b2900b  ! 430: STHA_R	stha	%r27, [%r10 + %r11] 0x80
	.word 0xe66aafcc  ! 432: LDSTUB_I	ldstub	%r19, [%r10 + 0x0fcc]
	.word 0x8f6aa3e0  ! 433: SDIVX_I	sdivx	%r10, 0x03e0, %r7
	.word 0xceca900b  ! 434: LDSBA_R	ldsba	[%r10, %r11] 0x80, %r7
	.word 0x2cc20001  ! 435: BRGZ	brgz,a,nt	%8,<label_0x20001>
	.word 0xeeaaa8f8  ! 436: STBA_I	stba	%r23, [%r10 + 0x08f8] %asi
	.word 0xabda800b  ! 437: FLUSH_R	dis not found

	.word 0x8143e075  ! 438: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside | #MemIssue | #Sync 
	.word 0xc602a514  ! 439: LDUW_I	lduw	[%r10 + 0x0514], %r3
	.word 0xc4ba900b  ! 440: STDA_R	stda	%r2, [%r10 + %r11] 0x80
	.word 0xf8b2a870  ! 441: STHA_I	stha	%r28, [%r10 + 0x0870] %asi
	.word 0xc3eaa414  ! 442: PREFETCHA_I	prefetcha	[%r10, + 0x0414] %asi, #one_read
	.word 0xe4a2a980  ! 443: STWA_I	stwa	%r18, [%r10 + 0x0980] %asi
	.word 0xc4ea900b  ! 444: LDSTUBA_R	ldstuba	%r2, [%r10 + %r11] 0x80
	.word 0xd0ea900b  ! 445: LDSTUBA_R	ldstuba	%r8, [%r10 + %r11] 0x80
	.word 0x90faa468  ! 446: SDIVcc_I	sdivcc 	%r10, 0x0468, %r8
	.word 0x8143c000  ! 447: STBAR	stbar
	.word 0xd0b2900b  ! 448: STHA_R	stha	%r8, [%r10 + %r11] 0x80
	.word 0xc802800b  ! 449: LDUW_R	lduw	[%r10 + %r11], %r4
	.word 0x8143c000  ! 450: STBAR	stbar
	.word 0xc642800b  ! 451: LDSW_R	ldsw	[%r10 + %r11], %r3
	.word 0xde7aa320  ! 452: SWAP_I	swap	%r15, [%r10 + 0x0320]
	.word 0xd24aa4fc  ! 453: LDSB_I	ldsb	[%r10 + 0x04fc], %r9
	.word 0x85a2882b  ! 454: FADDs	fadds	%f10, %f11, %f2
	.word 0xc86a800b  ! 455: LDSTUB_R	ldstub	%r4, [%r10 + %r11]
	.word 0xa5daae40  ! 456: FLUSH_I	dis not found

	.word 0x9c4aafac  ! 457: MULX_I	mulx 	%r10, 0x0fac, %r14
	.word 0xccd2a9ec  ! 458: LDSHA_I	ldsha	[%r10, + 0x09ec] %asi, %r6
	.word 0xcd22800b  ! 459: STF_R	st	%f6, [%r11, %r10]
	.word 0xd8b2a178  ! 460: STHA_I	stha	%r12, [%r10 + 0x0178] %asi
	.word 0xf73a800b  ! 461: STDF_R	std	%f27, [%r11, %r10]
	.word 0x24c20003  ! 462: BRLEZ	brlez,a,nt	%8,<label_0x20003>
	.word 0xcd3aa4b0  ! 463: STDF_I	std	%f6, [0x04b0, %r10]
	.word 0xf522800b  ! 464: STF_R	st	%f26, [%r11, %r10]
	.word 0xc402800b  ! 465: LDUW_R	lduw	[%r10 + %r11], %r2
	.word 0xdefaa62c  ! 466: SWAPA_I	swapa	%r15, [%r10 + 0x062c] %asi
	.word 0xecf2900b  ! 467: STXA_R	stxa	%r22, [%r10 + %r11] 0x80
	.word 0xc36a800b  ! 468: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0xc8a2900b  ! 469: STWA_R	stwa	%r4, [%r10 + %r11] 0x80
	.word 0xc842800b  ! 470: LDSW_R	ldsw	[%r10 + %r11], %r4
	.word 0xe4ba900b  ! 471: STDA_R	stda	%r18, [%r10 + %r11] 0x80
	.word 0xd2b2900b  ! 473: STHA_R	stha	%r9, [%r10 + %r11] 0x80
	.word 0xa3daa060  ! 474: FLUSH_I	dis not found

	.word 0x93a2882b  ! 475: FADDs	fadds	%f10, %f11, %f9
	.word 0x90fa800b  ! 476: SDIVcc_R	sdivcc 	%r10, %r11, %r8
	.word 0xd86a800b  ! 477: LDSTUB_R	ldstub	%r12, [%r10 + %r11]
	.word 0x8bda800b  ! 478: FLUSH_R	dis not found

	.word 0xf2d2900b  ! 479: LDSHA_R	ldsha	[%r10, %r11] 0x80, %r25
	.word 0xda82aad4  ! 480: LDUWA_I	lduwa	[%r10, + 0x0ad4] %asi, %r13
	.word 0xccbaac20  ! 481: STDA_I	stda	%r6, [%r10 + 0x0c20] %asi
	.word 0x916a800b  ! 482: SDIVX_R	sdivx	%r10, %r11, %r8
	.word 0x87daa73c  ! 483: FLUSH_I	dis not found

	.word 0xcea2900b  ! 484: STWA_R	stwa	%r7, [%r10 + %r11] 0x80
	.word 0x26800001  ! 485: BL	bl,a	<label_0x1>
	.word 0x30800001  ! 486: BA	ba,a	<label_0x1>
	.word 0xfb3a800b  ! 487: STDF_R	std	%f29, [%r11, %r10]
	.word 0x8143c000  ! 488: STBAR	stbar
	.word 0xe052aef4  ! 489: LDSH_I	ldsh	[%r10 + 0x0ef4], %r16
	.word 0xe7f2900b  ! 490: CASXA_I	casxa	[%r10] 0x80, %r11, %r19
	.word 0xd292900b  ! 491: LDUHA_R	lduha	[%r10, %r11] 0x80, %r9
	.word 0x926aab30  ! 492: UDIVX_I	udivx 	%r10, 0x0b30, %r9
	.word 0xd322a9ac  ! 493: STF_I	st	%f9, [0x09ac, %r10]
	.word 0x9fa2882b  ! 494: FADDs	fadds	%f10, %f11, %f15
	.word 0xc3ea900b  ! 495: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0x8143e045  ! 496: MEMBAR	membar	#LoadLoad | #LoadStore | #Sync 
	.word 0xd2c2adf4  ! 497: LDSWA_I	ldswa	[%r10, + 0x0df4] %asi, %r9
	.word 0x1c800003  ! 498: BPOS	bpos  	<label_0x3>
	.word 0xdc1a800b  ! 499: LDD_R	ldd	[%r10 + %r11], %r14
	.word 0xca8a900b  ! 500: LDUBA_R	lduba	[%r10, %r11] 0x80, %r5
	.word 0xd1e2900b  ! 501: CASA_I	casa	[%r10] 0x80, %r11, %r8
	.word 0x8ad2800b  ! 502: UMULcc_R	umulcc 	%r10, %r11, %r5
	.word 0x8472aa00  ! 503: UDIV_I	udiv 	%r10, 0x0a00, %r2
	.word 0x864a800b  ! 504: MULX_R	mulx 	%r10, %r11, %r3
	.word 0xda6a800b  ! 505: LDSTUB_R	ldstub	%r13, [%r10 + %r11]
	.word 0x91a289ab  ! 506: FDIVs	fdivs	%f10, %f11, %f8
	.word 0x8ba2882b  ! 507: FADDs	fadds	%f10, %f11, %f5
	.word 0xaa6aaa68  ! 508: UDIVX_I	udivx 	%r10, 0x0a68, %r21
	.word 0xc4a2900b  ! 509: STWA_R	stwa	%r2, [%r10 + %r11] 0x80
	.word 0x84faa7f8  ! 510: SDIVcc_I	sdivcc 	%r10, 0x07f8, %r2
	.word 0xa7daa310  ! 511: FLUSH_I	dis not found

	.word 0xc36a800b  ! 512: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0xc6f2ae18  ! 513: STXA_I	stxa	%r3, [%r10 + 0x0e18] %asi
	.word 0x2a800001  ! 514: BCS	bcs,a	<label_0x1>
	.word 0x0aca0003  ! 515: BRNZ	brnz  ,pt	%8,<label_0xa0003>
	.word 0x1c800001  ! 516: BPOS	bpos  	<label_0x1>
	.word 0xf202a4d8  ! 518: LDUW_I	lduw	[%r10 + 0x04d8], %r25
	.word 0xca5aa780  ! 519: LDX_I	ldx	[%r10 + 0x0780], %r5
	.word 0xaba2892b  ! 520: FMULs	fmuls	%f10, %f11, %f21
	.word 0x8522afd8  ! 521: MULScc_I	mulscc 	%r10, 0x0fd8, %r2
	.word 0x93daa6a8  ! 522: FLUSH_I	dis not found

	.word 0xc68a900b  ! 523: LDUBA_R	lduba	[%r10, %r11] 0x80, %r3
	.word 0xc8baaa80  ! 524: STDA_I	stda	%r4, [%r10 + 0x0a80] %asi
	.word 0x10800003  ! 525: BA	ba  	<label_0x3>
	.word 0x8a7aa118  ! 526: SDIV_I	sdiv 	%r10, 0x0118, %r5
	.word 0x2ec20003  ! 527: BRGEZ	brgez,a,nt	%8,<label_0x20003>
	.word 0x9252a258  ! 528: UMUL_I	umul 	%r10, 0x0258, %r9
	.word 0x30800001  ! 529: BA	ba,a	<label_0x1>
	.word 0x8472800b  ! 530: UDIV_R	udiv 	%r10, %r11, %r2
	.word 0x8143e051  ! 531: MEMBAR	membar	#LoadLoad | #Lookaside | #Sync 
	.word 0x9efaaa58  ! 532: SDIVcc_I	sdivcc 	%r10, 0x0a58, %r15
	.word 0xbcf2800b  ! 533: UDIVcc_R	udivcc 	%r10, %r11, %r30
	.word 0xc8ba900b  ! 534: STDA_R	stda	%r4, [%r10 + %r11] 0x80
	.word 0xc3eaad10  ! 535: PREFETCHA_I	prefetcha	[%r10, + 0x0d10] %asi, #one_read
	.word 0x8efa800b  ! 536: SDIVcc_R	sdivcc 	%r10, %r11, %r7
	.word 0xc322a814  ! 537: STF_I	st	%f1, [0x0814, %r10]
	.word 0x8672a828  ! 538: UDIV_I	udiv 	%r10, 0x0828, %r3
	.word 0xca7a800b  ! 539: SWAP_R	swap	%r5, [%r10 + %r11]
	.word 0xd0da900b  ! 541: LDXA_R	ldxa	[%r10, %r11] 0x80, %r8
	.word 0x91da800b  ! 542: FLUSH_R	dis not found

	.word 0x8f22800b  ! 543: MULScc_R	mulscc 	%r10, %r11, %r7
	.word 0xc5e2900b  ! 544: CASA_I	casa	[%r10] 0x80, %r11, %r2
	.word 0xe922800b  ! 546: STF_R	st	%f20, [%r11, %r10]
	.word 0x8143e04d  ! 547: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Sync 
	.word 0x8143e059  ! 548: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside | #Sync 
	.word 0x844aadf8  ! 549: MULX_I	mulx 	%r10, 0x0df8, %r2
	.word 0x14800003  ! 550: BG	bg  	<label_0x3>
	.word 0x89a288ab  ! 551: FSUBs	fsubs	%f10, %f11, %f4
	.word 0xc66aa2d4  ! 552: LDSTUB_I	ldstub	%r3, [%r10 + 0x02d4]
	.word 0xc3ea900b  ! 553: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0xd2ea900b  ! 554: LDSTUBA_R	ldstuba	%r9, [%r10 + %r11] 0x80
	.word 0x30800003  ! 555: BA	ba,a	<label_0x3>
	.word 0x86d2800b  ! 556: UMULcc_R	umulcc 	%r10, %r11, %r3
	.word 0xebf2900b  ! 557: CASXA_I	casxa	[%r10] 0x80, %r11, %r21
	.word 0x8143c000  ! 558: STBAR	stbar
	.word 0xa6da800b  ! 559: SMULcc_R	smulcc 	%r10, %r11, %r19
	.word 0xc89aa398  ! 560: LDDA_I	ldda	[%r10, + 0x0398] %asi, %r4
	.word 0x836aa140  ! 561: SDIVX_I	sdivx	%r10, 0x0140, %r1
	.word 0xfa52ae00  ! 563: LDSH_I	ldsh	[%r10 + 0x0e00], %r29
	.word 0xcaaa900b  ! 564: STBA_R	stba	%r5, [%r10 + %r11] 0x80
	.word 0x0e800001  ! 565: BVS	bvs  	<label_0x1>
	.word 0xc6f2900b  ! 566: STXA_R	stxa	%r3, [%r10 + %r11] 0x80
	.word 0x2ac20001  ! 567: BRNZ	brnz,a,nt	%8,<label_0x20001>
	.word 0x8b22a898  ! 568: MULScc_I	mulscc 	%r10, 0x0898, %r5
	.word 0xafda800b  ! 569: FLUSH_R	dis not found

	.word 0xbcfa800b  ! 570: SDIVcc_R	sdivcc 	%r10, %r11, %r30
	.word 0xc2c2a85c  ! 571: LDSWA_I	ldswa	[%r10, + 0x085c] %asi, %r1
	.word 0xecc2a128  ! 572: LDSWA_I	ldswa	[%r10, + 0x0128] %asi, %r22
	.word 0x925a800b  ! 573: SMUL_R	smul 	%r10, %r11, %r9
	.word 0x82faa9dc  ! 574: SDIVcc_I	sdivcc 	%r10, 0x09dc, %r1
	.word 0x83daa028  ! 575: FLUSH_I	dis not found

	.word 0xd052a92c  ! 576: LDSH_I	ldsh	[%r10 + 0x092c], %r8
	.word 0xd0ba900b  ! 577: STDA_R	stda	%r8, [%r10 + %r11] 0x80
	.word 0xc53aac38  ! 578: STDF_I	std	%f2, [0x0c38, %r10]
	.word 0xcec2a248  ! 579: LDSWA_I	ldswa	[%r10, + 0x0248] %asi, %r7
	.word 0xe8c2900b  ! 580: LDSWA_R	ldswa	[%r10, %r11] 0x80, %r20
	.word 0xcc4aa8dc  ! 581: LDSB_I	ldsb	[%r10 + 0x08dc], %r6
	.word 0x844aa108  ! 582: MULX_I	mulx 	%r10, 0x0108, %r2
	.word 0x8143c000  ! 583: STBAR	stbar
	.word 0xd0eaa038  ! 584: LDSTUBA_I	ldstuba	%r8, [%r10 + 0x0038] %asi
	.word 0xccbaaa28  ! 585: STDA_I	stda	%r6, [%r10 + 0x0a28] %asi
	.word 0x00800003  ! 586: BN	bn  	<label_0x3>
	.word 0xc612800b  ! 587: LDUH_R	lduh	[%r10 + %r11], %r3
	.word 0xc36a800b  ! 588: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0xc81aa0d0  ! 589: LDD_I	ldd	[%r10 + 0x00d0], %r4
	.word 0xca6a800b  ! 590: LDSTUB_R	ldstub	%r5, [%r10 + %r11]
	.word 0xd292a42c  ! 592: LDUHA_I	lduha	[%r10, + 0x042c] %asi, %r9
	.word 0xa3da800b  ! 593: FLUSH_R	dis not found

	.word 0x8cfaa590  ! 594: SDIVcc_I	sdivcc 	%r10, 0x0590, %r6
	.word 0xb65a800b  ! 595: SMUL_R	smul 	%r10, %r11, %r27
	.word 0x16800003  ! 597: BGE	bge  	<label_0x3>
	.word 0x91da800b  ! 599: FLUSH_R	dis not found

	.word 0xf8ba900b  ! 600: STDA_R	stda	%r28, [%r10 + %r11] 0x80
	.word 0x8143c000  ! 601: STBAR	stbar
	.word 0x8143e074  ! 602: MEMBAR	membar	#LoadStore | #Lookaside | #MemIssue | #Sync 
	.word 0x38800003  ! 603: BGU	bgu,a	<label_0x3>
	.word 0xc3ea900b  ! 604: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0xc81aacf8  ! 605: LDD_I	ldd	[%r10 + 0x0cf8], %r4
	.word 0xb072a694  ! 606: UDIV_I	udiv 	%r10, 0x0694, %r24
	.word 0xd0b2ad18  ! 607: STHA_I	stha	%r8, [%r10 + 0x0d18] %asi
	.word 0x8472ae4c  ! 608: UDIV_I	udiv 	%r10, 0x0e4c, %r2
	.word 0x8143c000  ! 610: STBAR	stbar
	.word 0xbc4aa01c  ! 611: MULX_I	mulx 	%r10, 0x001c, %r30
	.word 0xc89aada8  ! 613: LDDA_I	ldda	[%r10, + 0x0da8] %asi, %r4
	.word 0xc4faa7e0  ! 614: SWAPA_I	swapa	%r2, [%r10 + 0x07e0] %asi
	.word 0xc8d2900b  ! 615: LDSHA_R	ldsha	[%r10, %r11] 0x80, %r4
	.word 0xf84aaeac  ! 616: LDSB_I	ldsb	[%r10 + 0x0eac], %r28
	.word 0xf60a800b  ! 617: LDUB_R	ldub	[%r10 + %r11], %r27
	.word 0x8a72800b  ! 618: UDIV_R	udiv 	%r10, %r11, %r5
	.word 0xf322800b  ! 619: STF_R	st	%f25, [%r11, %r10]
	.word 0x8ba2892b  ! 620: FMULs	fmuls	%f10, %f11, %f5
	.word 0xfcc2a758  ! 621: LDSWA_I	ldswa	[%r10, + 0x0758] %asi, %r30
	.word 0xd08a900b  ! 622: LDUBA_R	lduba	[%r10, %r11] 0x80, %r8
	.word 0xd052800b  ! 623: LDSH_R	ldsh	[%r10 + %r11], %r8
	.word 0xfc9a900b  ! 624: LDDA_R	ldda	[%r10, %r11] 0x80, %r30
	.word 0x836aa38c  ! 625: SDIVX_I	sdivx	%r10, 0x038c, %r1
	.word 0x864aa964  ! 626: MULX_I	mulx 	%r10, 0x0964, %r3
	.word 0x8143c000  ! 627: STBAR	stbar
	.word 0xfc52a23c  ! 628: LDSH_I	ldsh	[%r10 + 0x023c], %r30
	.word 0xe602800b  ! 629: LDUW_R	lduw	[%r10 + %r11], %r19
	.word 0x9252800b  ! 630: UMUL_R	umul 	%r10, %r11, %r9
	.word 0xbc5a800b  ! 631: SMUL_R	smul 	%r10, %r11, %r30
	.word 0x02ca0001  ! 632: BRZ	brz  ,pt	%8,<label_0xa0001>
	.word 0xf2da900b  ! 633: LDXA_R	ldxa	[%r10, %r11] 0x80, %r25
	.word 0xce7a800b  ! 634: SWAP_R	swap	%r7, [%r10 + %r11]
	.word 0xf042a7ec  ! 635: LDSW_I	ldsw	[%r10 + 0x07ec], %r24
	.word 0x8143c000  ! 636: STBAR	stbar
	.word 0xb4fa800b  ! 637: SDIVcc_R	sdivcc 	%r10, %r11, %r26
	.word 0xf722a948  ! 638: STF_I	st	%f27, [0x0948, %r10]
	.word 0xac6aabec  ! 639: UDIVX_I	udivx 	%r10, 0x0bec, %r22
	.word 0xc24aa2d8  ! 640: LDSB_I	ldsb	[%r10 + 0x02d8], %r1
	.word 0x8143c000  ! 641: STBAR	stbar
	.word 0x93a2892b  ! 642: FMULs	fmuls	%f10, %f11, %f9
	.word 0x8ef2800b  ! 643: UDIVcc_R	udivcc 	%r10, %r11, %r7
	.word 0xc36aa4f4  ! 644: PREFETCH_I	prefetch	[%r10 + 0x04f4], #one_read
	.word 0xc46a800b  ! 645: LDSTUB_R	ldstub	%r2, [%r10 + %r11]
	.word 0x8e4a800b  ! 646: MULX_R	mulx 	%r10, %r11, %r7
	.word 0x99a288ab  ! 647: FSUBs	fsubs	%f10, %f11, %f12
	.word 0x8143e04f  ! 648: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #Sync 
	.word 0xc41aa828  ! 649: LDD_I	ldd	[%r10 + 0x0828], %r2
	.word 0xee52aee8  ! 650: LDSH_I	ldsh	[%r10 + 0x0ee8], %r23
	.word 0xbafaa70c  ! 651: SDIVcc_I	sdivcc 	%r10, 0x070c, %r29
	.word 0x14800003  ! 652: BG	bg  	<label_0x3>
	.word 0xc01a800b  ! 653: LDD_R	ldd	[%r10 + %r11], %r0
	.word 0xcaa2900b  ! 654: STWA_R	stwa	%r5, [%r10 + %r11] 0x80
	.word 0xf2a2ab14  ! 655: STWA_I	stwa	%r25, [%r10 + 0x0b14] %asi
	.word 0x9052adbc  ! 656: UMUL_I	umul 	%r10, 0x0dbc, %r8
	.word 0xc73a800b  ! 657: STDF_R	std	%f3, [%r11, %r10]
	.word 0x83a289ab  ! 658: FDIVs	fdivs	%f10, %f11, %f1
	.word 0xc36a800b  ! 659: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x8b22800b  ! 660: MULScc_R	mulscc 	%r10, %r11, %r5
	.word 0xc412800b  ! 661: LDUH_R	lduh	[%r10 + %r11], %r2
	.word 0x85da800b  ! 664: FLUSH_R	dis not found

	.word 0x8143e04f  ! 665: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #Sync 
	.word 0x85da800b  ! 666: FLUSH_R	dis not found

	.word 0xc412800b  ! 667: LDUH_R	lduh	[%r10 + %r11], %r2
	.word 0xc24aa028  ! 668: LDSB_I	ldsb	[%r10 + 0x0028], %r1
	.word 0x1e800003  ! 669: BVC	bvc  	<label_0x3>
	.word 0xc322a02c  ! 670: STF_I	st	%f1, [0x002c, %r10]
	.word 0xf4baad08  ! 671: STDA_I	stda	%r26, [%r10 + 0x0d08] %asi
	.word 0xc6eaa3e8  ! 672: LDSTUBA_I	ldstuba	%r3, [%r10 + 0x03e8] %asi
	.word 0xc3eaae68  ! 673: PREFETCHA_I	prefetcha	[%r10, + 0x0e68] %asi, #one_read
	.word 0xc20aa584  ! 675: LDUB_I	ldub	[%r10 + 0x0584], %r1
	.word 0xe0d2900b  ! 676: LDSHA_R	ldsha	[%r10, %r11] 0x80, %r16
	.word 0x08800001  ! 677: BLEU	bleu  	<label_0x1>
	.word 0xa9daa4b4  ! 678: FLUSH_I	dis not found

	.word 0xcafaa7b8  ! 679: SWAPA_I	swapa	%r5, [%r10 + 0x07b8] %asi
	.word 0xc842800b  ! 680: LDSW_R	ldsw	[%r10 + %r11], %r4
	.word 0xc67a800b  ! 681: SWAP_R	swap	%r3, [%r10 + %r11]
	.word 0xc8fa900b  ! 682: SWAPA_R	swapa	%r4, [%r10 + %r11] 0x80
	.word 0xd0b2a8b8  ! 683: STHA_I	stha	%r8, [%r10 + 0x08b8] %asi
	.word 0xa8faa020  ! 684: SDIVcc_I	sdivcc 	%r10, 0x0020, %r20
	.word 0xd122800b  ! 685: STF_R	st	%f8, [%r11, %r10]
	.word 0xc8aaad74  ! 686: STBA_I	stba	%r4, [%r10 + 0x0d74] %asi
	.word 0xc36a800b  ! 687: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x87daaee8  ! 688: FLUSH_I	dis not found

	.word 0x87daa8ac  ! 689: FLUSH_I	dis not found

	.word 0xf46a800b  ! 690: LDSTUB_R	ldstub	%r26, [%r10 + %r11]
	.word 0xeacaae28  ! 691: LDSBA_I	ldsba	[%r10, + 0x0e28] %asi, %r21
	.word 0xbe72aa1c  ! 693: UDIV_I	udiv 	%r10, 0x0a1c, %r31
	.word 0xd092a320  ! 694: LDUHA_I	lduha	[%r10, + 0x0320] %asi, %r8
	.word 0xc722ace0  ! 695: STF_I	st	%f3, [0x0ce0, %r10]
	.word 0xc87aa574  ! 696: SWAP_I	swap	%r4, [%r10 + 0x0574]
	.word 0xabda800b  ! 697: FLUSH_R	dis not found

	.word 0xcec2a0bc  ! 698: LDSWA_I	ldswa	[%r10, + 0x00bc] %asi, %r7
	.word 0x8af2a728  ! 699: UDIVcc_I	udivcc 	%r10, 0x0728, %r5
	.word 0xc3eaa9c8  ! 700: PREFETCHA_I	prefetcha	[%r10, + 0x09c8] %asi, #one_read
	.word 0x8143e073  ! 701: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside | #MemIssue | #Sync 
	.word 0xb6d2ad3c  ! 702: UMULcc_I	umulcc 	%r10, 0x0d3c, %r27
	.word 0x8cf2800b  ! 703: UDIVcc_R	udivcc 	%r10, %r11, %r6
	.word 0x90d2800b  ! 704: UMULcc_R	umulcc 	%r10, %r11, %r8
	.word 0x04c20001  ! 705: BRLEZ	brlez  ,nt	%8,<label_0x20001>
	.word 0xeab2a6fc  ! 706: STHA_I	stha	%r21, [%r10 + 0x06fc] %asi
	.word 0x26800001  ! 707: BL	bl,a	<label_0x1>
	.word 0x9272a5a0  ! 708: UDIV_I	udiv 	%r10, 0x05a0, %r9
	.word 0xcbe2900b  ! 709: CASA_I	casa	[%r10] 0x80, %r11, %r5
	.word 0xcac2a7b0  ! 710: LDSWA_I	ldswa	[%r10, + 0x07b0] %asi, %r5
	.word 0xf0f2900b  ! 711: STXA_R	stxa	%r24, [%r10 + %r11] 0x80
	.word 0xd24a800b  ! 712: LDSB_R	ldsb	[%r10 + %r11], %r9
	.word 0x8ddaa828  ! 713: FLUSH_I	dis not found

	.word 0x91a2892b  ! 714: FMULs	fmuls	%f10, %f11, %f8
	.word 0xcefaa0d8  ! 715: SWAPA_I	swapa	%r7, [%r10 + 0x00d8] %asi
	.word 0xf2aa900b  ! 716: STBA_R	stba	%r25, [%r10 + %r11] 0x80
	.word 0x89daacb4  ! 717: FLUSH_I	dis not found

	.word 0x8143e066  ! 718: MEMBAR	membar	#StoreLoad | #LoadStore | #MemIssue | #Sync 
	.word 0x8143e052  ! 719: MEMBAR	membar	#StoreLoad | #Lookaside | #Sync 
	.word 0x8d6aab78  ! 720: SDIVX_I	sdivx	%r10, 0x0b78, %r6
	.word 0x8b6aaa20  ! 721: SDIVX_I	sdivx	%r10, 0x0a20, %r5
	.word 0xd282900b  ! 722: LDUWA_R	lduwa	[%r10, %r11] 0x80, %r9
	.word 0x91a289ab  ! 723: FDIVs	fdivs	%f10, %f11, %f8
	.word 0xe68a900b  ! 724: LDUBA_R	lduba	[%r10, %r11] 0x80, %r19
	.word 0xa3a289ab  ! 725: FDIVs	fdivs	%f10, %f11, %f17
	.word 0xc3f2a00b  ! 726: CASXA_R	casxa	[%r10]%asi, %r11, %r1
	.word 0x84d2a31c  ! 727: UMULcc_I	umulcc 	%r10, 0x031c, %r2
	.word 0xc3eaa0f0  ! 728: PREFETCHA_I	prefetcha	[%r10, + 0x00f0] %asi, #one_read
	.word 0xada2882b  ! 729: FADDs	fadds	%f10, %f11, %f22
	.word 0xc2d2900b  ! 730: LDSHA_R	ldsha	[%r10, %r11] 0x80, %r1
	.word 0x91a2892b  ! 731: FMULs	fmuls	%f10, %f11, %f8
	.word 0x9f22800b  ! 732: MULScc_R	mulscc 	%r10, %r11, %r15
	.word 0x02c20003  ! 733: BRZ	brz  ,nt	%8,<label_0x20003>
	.word 0xc2f2900b  ! 734: STXA_R	stxa	%r1, [%r10 + %r11] 0x80
	.word 0x844aa5f0  ! 735: MULX_I	mulx 	%r10, 0x05f0, %r2
	.word 0x927aa24c  ! 736: SDIV_I	sdiv 	%r10, 0x024c, %r9
	.word 0xd2f2a380  ! 737: STXA_I	stxa	%r9, [%r10 + 0x0380] %asi
	.word 0x8fa289ab  ! 738: FDIVs	fdivs	%f10, %f11, %f7
	.word 0xc2f2a428  ! 739: STXA_I	stxa	%r1, [%r10 + 0x0428] %asi
	.word 0x87daa154  ! 740: FLUSH_I	dis not found

	.word 0x8edaa568  ! 741: SMULcc_I	smulcc 	%r10, 0x0568, %r7
	.word 0xee6a800b  ! 742: LDSTUB_R	ldstub	%r23, [%r10 + %r11]
	.word 0xf052800b  ! 743: LDSH_R	ldsh	[%r10 + %r11], %r24
	.word 0x827aafb4  ! 744: SDIV_I	sdiv 	%r10, 0x0fb4, %r1
	.word 0xe0a2abbc  ! 745: STWA_I	stwa	%r16, [%r10 + 0x0bbc] %asi
	.word 0x8ad2800b  ! 746: UMULcc_R	umulcc 	%r10, %r11, %r5
	.word 0x8e52800b  ! 747: UMUL_R	umul 	%r10, %r11, %r7
	.word 0x9252800b  ! 748: UMUL_R	umul 	%r10, %r11, %r9
	.word 0x866aafa4  ! 749: UDIVX_I	udivx 	%r10, 0x0fa4, %r3
	.word 0xf092af58  ! 750: LDUHA_I	lduha	[%r10, + 0x0f58] %asi, %r24
	.word 0x8143c000  ! 751: STBAR	stbar
	.word 0xe6ea900b  ! 752: LDSTUBA_R	ldstuba	%r19, [%r10 + %r11] 0x80
	.word 0xe012800b  ! 753: LDUH_R	lduh	[%r10 + %r11], %r16
	.word 0xc3eaac2c  ! 754: PREFETCHA_I	prefetcha	[%r10, + 0x0c2c] %asi, #one_read
	.word 0x24800001  ! 755: BLE	ble,a	<label_0x1>
	.word 0xdb22800b  ! 756: STF_R	st	%f13, [%r11, %r10]
	.word 0x8e4aac20  ! 757: MULX_I	mulx 	%r10, 0x0c20, %r7
	.word 0xb67aae98  ! 758: SDIV_I	sdiv 	%r10, 0x0e98, %r27
	.word 0xbcda800b  ! 759: SMULcc_R	smulcc 	%r10, %r11, %r30
	.word 0x82f2800b  ! 760: UDIVcc_R	udivcc 	%r10, %r11, %r1
	.word 0xc6c2a000  ! 761: LDSWA_I	ldswa	[%r10, + 0x0000] %asi, %r3
	.word 0xcef2900b  ! 762: STXA_R	stxa	%r7, [%r10 + %r11] 0x80
	.word 0xf5f2900b  ! 763: CASXA_I	casxa	[%r10] 0x80, %r11, %r26
	.word 0xea5aa920  ! 764: LDX_I	ldx	[%r10 + 0x0920], %r21
	.word 0x906a800b  ! 765: UDIVX_R	udivx 	%r10, %r11, %r8
	.word 0x89a2882b  ! 766: FADDs	fadds	%f10, %f11, %f4
	.word 0xe722a5b4  ! 767: STF_I	st	%f19, [0x05b4, %r10]
	.word 0xae7aaca4  ! 768: SDIV_I	sdiv 	%r10, 0x0ca4, %r23
	.word 0xc202800b  ! 769: LDUW_R	lduw	[%r10 + %r11], %r1
	.word 0xc25a800b  ! 770: LDX_R	ldx	[%r10 + %r11], %r1
	.word 0xccaa900b  ! 771: STBA_R	stba	%r6, [%r10 + %r11] 0x80
	.word 0xc402a554  ! 772: LDUW_I	lduw	[%r10 + 0x0554], %r2
	.word 0xd252acd0  ! 773: LDSH_I	ldsh	[%r10 + 0x0cd0], %r9
	.word 0x8143c000  ! 774: STBAR	stbar
	.word 0xca8a900b  ! 775: LDUBA_R	lduba	[%r10, %r11] 0x80, %r5
	.word 0xc46a800b  ! 776: LDSTUB_R	ldstub	%r2, [%r10 + %r11]
	.word 0x856a800b  ! 777: SDIVX_R	sdivx	%r10, %r11, %r2
	.word 0xc4ea900b  ! 778: LDSTUBA_R	ldstuba	%r2, [%r10 + %r11] 0x80
	.word 0xbe72a9d0  ! 779: UDIV_I	udiv 	%r10, 0x09d0, %r31
	.word 0x8a6aa720  ! 780: UDIVX_I	udivx 	%r10, 0x0720, %r5
	.word 0xf0c2900b  ! 781: LDSWA_R	ldswa	[%r10, %r11] 0x80, %r24
	.word 0xbef2ab68  ! 782: UDIVcc_I	udivcc 	%r10, 0x0b68, %r31
	.word 0x90daa27c  ! 783: SMULcc_I	smulcc 	%r10, 0x027c, %r8
	.word 0x83a289ab  ! 784: FDIVs	fdivs	%f10, %f11, %f1
	.word 0xcc7aa658  ! 785: SWAP_I	swap	%r6, [%r10 + 0x0658]
	.word 0x905aa740  ! 786: SMUL_I	smul 	%r10, 0x0740, %r8
	.word 0x89daa168  ! 787: FLUSH_I	dis not found

	.word 0x8143e00a  ! 788: MEMBAR	membar	#StoreLoad | #StoreStore 
	.word 0x86d2800b  ! 789: UMULcc_R	umulcc 	%r10, %r11, %r3
	.word 0x9252800b  ! 790: UMUL_R	umul 	%r10, %r11, %r9
	.word 0x0cc20001  ! 791: BRGZ	brgz  ,nt	%8,<label_0x20001>
	.word 0xd09aac58  ! 792: LDDA_I	ldda	[%r10, + 0x0c58] %asi, %r8
	.word 0xccc2900b  ! 793: LDSWA_R	ldswa	[%r10, %r11] 0x80, %r6
	.word 0xd26a800b  ! 794: LDSTUB_R	ldstub	%r9, [%r10 + %r11]
	.word 0xcc12ab14  ! 795: LDUH_I	lduh	[%r10 + 0x0b14], %r6
	.word 0xc4eaad48  ! 796: LDSTUBA_I	ldstuba	%r2, [%r10 + 0x0d48] %asi
	.word 0xc3eaa1e0  ! 797: PREFETCHA_I	prefetcha	[%r10, + 0x01e0] %asi, #one_read
	.word 0xc412800b  ! 799: LDUH_R	lduh	[%r10 + %r11], %r2
	.word 0xb9a288ab  ! 800: FSUBs	fsubs	%f10, %f11, %f28
	.word 0x8143e022  ! 801: MEMBAR	membar	#StoreLoad | #MemIssue 
	.word 0xd0ca900b  ! 802: LDSBA_R	ldsba	[%r10, %r11] 0x80, %r8
	.word 0xbd6aa724  ! 803: SDIVX_I	sdivx	%r10, 0x0724, %r30
	.word 0xdcb2aa38  ! 804: STHA_I	stha	%r14, [%r10 + 0x0a38] %asi
	.word 0xc6aa900b  ! 805: STBA_R	stba	%r3, [%r10 + %r11] 0x80
	.word 0x8a52800b  ! 806: UMUL_R	umul 	%r10, %r11, %r5
	.word 0xd3f2a00b  ! 807: CASXA_R	casxa	[%r10]%asi, %r11, %r9
	.word 0x8143c000  ! 808: STBAR	stbar
	.word 0xa5daa968  ! 809: FLUSH_I	dis not found

	.word 0xd3e2a00b  ! 810: CASA_R	casa	[%r10] %asi, %r11, %r9
	.word 0x906a800b  ! 811: UDIVX_R	udivx 	%r10, %r11, %r8
	.word 0xf2ea900b  ! 812: LDSTUBA_R	ldstuba	%r25, [%r10 + %r11] 0x80
	.word 0xe082a460  ! 813: LDUWA_I	lduwa	[%r10, + 0x0460] %asi, %r16
	.word 0xc3eaac14  ! 814: PREFETCHA_I	prefetcha	[%r10, + 0x0c14] %asi, #one_read
	.word 0x844a800b  ! 815: MULX_R	mulx 	%r10, %r11, %r2
	.word 0x8143e04f  ! 816: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #Sync 
	.word 0x8143e04d  ! 817: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Sync 
	.word 0x8143e04f  ! 818: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #Sync 
	.word 0xd08aacd8  ! 819: LDUBA_I	lduba	[%r10, + 0x0cd8] %asi, %r8
	.word 0xc4d2a634  ! 820: LDSHA_I	ldsha	[%r10, + 0x0634] %asi, %r2
	.word 0xc46a800b  ! 821: LDSTUB_R	ldstub	%r2, [%r10 + %r11]
	.word 0xcc0a800b  ! 822: LDUB_R	ldub	[%r10 + %r11], %r6
	.word 0xc8fa900b  ! 823: SWAPA_R	swapa	%r4, [%r10 + %r11] 0x80
	.word 0xa06a800b  ! 824: UDIVX_R	udivx 	%r10, %r11, %r16
	.word 0xcada900b  ! 825: LDXA_R	ldxa	[%r10, %r11] 0x80, %r5
	.word 0xcc12a53c  ! 826: LDUH_I	lduh	[%r10 + 0x053c], %r6
	.word 0xc84a800b  ! 827: LDSB_R	ldsb	[%r10 + %r11], %r4
	.word 0xca6aac4c  ! 828: LDSTUB_I	ldstub	%r5, [%r10 + 0x0c4c]
	.word 0x04800003  ! 829: BLE	ble  	<label_0x3>
	.word 0x26c20001  ! 830: BRLZ	brlz,a,nt	%8,<label_0x20001>
	.word 0x8143c000  ! 831: STBAR	stbar
	.word 0xe86a800b  ! 832: LDSTUB_R	ldstub	%r20, [%r10 + %r11]
	.word 0xc36a800b  ! 833: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0xc5e2900b  ! 835: CASA_I	casa	[%r10] 0x80, %r11, %r2
	.word 0xe8caac54  ! 836: LDSBA_I	ldsba	[%r10, + 0x0c54] %asi, %r20
	.word 0xa27aa3cc  ! 837: SDIV_I	sdiv 	%r10, 0x03cc, %r17
	.word 0xa3a289ab  ! 838: FDIVs	fdivs	%f10, %f11, %f17
	.word 0xd05a800b  ! 839: LDX_R	ldx	[%r10 + %r11], %r8
	.word 0xe44a800b  ! 840: LDSB_R	ldsb	[%r10 + %r11], %r18
	.word 0x0ac20001  ! 841: BRNZ	brnz  ,nt	%8,<label_0x20001>
	.word 0xc922800b  ! 842: STF_R	st	%f4, [%r11, %r10]
	.word 0x9bdaa7ec  ! 843: FLUSH_I	dis not found

	.word 0x8a52a8b8  ! 844: UMUL_I	umul 	%r10, 0x08b8, %r5
	.word 0x8143e06f  ! 845: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #MemIssue | #Sync 
	.word 0xae7a800b  ! 846: SDIV_R	sdiv 	%r10, %r11, %r23
	.word 0x1c800003  ! 847: BPOS	bpos  	<label_0x3>
	.word 0xf09aafa8  ! 848: LDDA_I	ldda	[%r10, + 0x0fa8] %asi, %r24
	.word 0x92da800b  ! 849: SMULcc_R	smulcc 	%r10, %r11, %r9
	.word 0x8cdaa354  ! 850: SMULcc_I	smulcc 	%r10, 0x0354, %r6
	.word 0xc292a83c  ! 851: LDUHA_I	lduha	[%r10, + 0x083c] %asi, %r1
	.word 0xc36aaf98  ! 852: PREFETCH_I	prefetch	[%r10 + 0x0f98], #one_read
	.word 0xb3a2892b  ! 853: FMULs	fmuls	%f10, %f11, %f25
	.word 0xc93a800b  ! 854: STDF_R	std	%f4, [%r11, %r10]
	.word 0xcc1a800b  ! 855: LDD_R	ldd	[%r10 + %r11], %r6
	.word 0x85a288ab  ! 856: FSUBs	fsubs	%f10, %f11, %f2
	.word 0xc212800b  ! 857: LDUH_R	lduh	[%r10 + %r11], %r1
	.word 0x30800001  ! 858: BA	ba,a	<label_0x1>
	.word 0x1a800001  ! 859: BCC	bcc  	<label_0x1>
	.word 0xd092900b  ! 860: LDUHA_R	lduha	[%r10, %r11] 0x80, %r8
	.word 0xd2b2900b  ! 861: STHA_R	stha	%r9, [%r10 + %r11] 0x80
	.word 0x8143e012  ! 862: MEMBAR	membar	#StoreLoad | #Lookaside 
	.word 0x8143c000  ! 863: STBAR	stbar
	.word 0xd812800b  ! 864: LDUH_R	lduh	[%r10 + %r11], %r12
	.word 0xd0ea900b  ! 865: LDSTUBA_R	ldstuba	%r8, [%r10 + %r11] 0x80
	.word 0x836a800b  ! 866: SDIVX_R	sdivx	%r10, %r11, %r1
	.word 0xa9daae60  ! 867: FLUSH_I	dis not found

	.word 0xc65aaaf8  ! 868: LDX_I	ldx	[%r10 + 0x0af8], %r3
	.word 0xc49aa2b8  ! 869: LDDA_I	ldda	[%r10, + 0x02b8] %asi, %r2
	.word 0xf8f2a690  ! 870: STXA_I	stxa	%r28, [%r10 + 0x0690] %asi
	.word 0x8ada800b  ! 871: SMULcc_R	smulcc 	%r10, %r11, %r5
	.word 0x8ef2a89c  ! 872: UDIVcc_I	udivcc 	%r10, 0x089c, %r7
	.word 0x8522acb4  ! 873: MULScc_I	mulscc 	%r10, 0x0cb4, %r2
	.word 0x87a289ab  ! 874: FDIVs	fdivs	%f10, %f11, %f3
	.word 0xfe02a948  ! 875: LDUW_I	lduw	[%r10 + 0x0948], %r31
	.word 0xf0ea900b  ! 876: LDSTUBA_R	ldstuba	%r24, [%r10 + %r11] 0x80
	.word 0x9252800b  ! 877: UMUL_R	umul 	%r10, %r11, %r9
	.word 0xd07aaf18  ! 878: SWAP_I	swap	%r8, [%r10 + 0x0f18]
	.word 0x3c800003  ! 879: BPOS	bpos,a	<label_0x3>
	.word 0x83daae6c  ! 880: FLUSH_I	dis not found

	.word 0xf4a2a710  ! 881: STWA_I	stwa	%r26, [%r10 + 0x0710] %asi
	.word 0xc36aa5d4  ! 882: PREFETCH_I	prefetch	[%r10 + 0x05d4], #one_read
	.word 0xc922a240  ! 883: STF_I	st	%f4, [0x0240, %r10]
	.word 0x91da800b  ! 884: FLUSH_R	dis not found

	.word 0x8fa2892b  ! 886: FMULs	fmuls	%f10, %f11, %f7
	.word 0xbf22af38  ! 887: MULScc_I	mulscc 	%r10, 0x0f38, %r31
	.word 0xd0f2900b  ! 888: STXA_R	stxa	%r8, [%r10 + %r11] 0x80
	.word 0xda8a900b  ! 890: LDUBA_R	lduba	[%r10, %r11] 0x80, %r13
	.word 0xca4aad38  ! 891: LDSB_I	ldsb	[%r10 + 0x0d38], %r5
	.word 0x24c20001  ! 893: BRLEZ	brlez,a,nt	%8,<label_0x20001>
	.word 0x14800001  ! 894: BG	bg  	<label_0x1>
	.word 0x04800001  ! 895: BLE	ble  	<label_0x1>
	.word 0xca8a900b  ! 897: LDUBA_R	lduba	[%r10, %r11] 0x80, %r5
	.word 0x9a6aacd4  ! 898: UDIVX_I	udivx 	%r10, 0x0cd4, %r13
	.word 0xc3eaa904  ! 899: PREFETCHA_I	prefetcha	[%r10, + 0x0904] %asi, #one_read
	.word 0xd202aed0  ! 900: LDUW_I	lduw	[%r10 + 0x0ed0], %r9
	.word 0xa252800b  ! 901: UMUL_R	umul 	%r10, %r11, %r17
	.word 0x8cdaab08  ! 902: SMULcc_I	smulcc 	%r10, 0x0b08, %r6
	.word 0x8f6aa5b4  ! 903: SDIVX_I	sdivx	%r10, 0x05b4, %r7
	.word 0x8143c000  ! 904: STBAR	stbar
	.word 0x8143e07f  ! 905: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0x2eca0003  ! 906: BRGEZ	brgez,a,pt	%8,<label_0xa0003>
	.word 0x8e5a800b  ! 907: SMUL_R	smul 	%r10, %r11, %r7
	.word 0xc89aa560  ! 908: LDDA_I	ldda	[%r10, + 0x0560] %asi, %r4
	.word 0xeea2900b  ! 909: STWA_R	stwa	%r23, [%r10 + %r11] 0x80
	.word 0x10800003  ! 910: BA	ba  	<label_0x3>
	.word 0x8d6a800b  ! 911: SDIVX_R	sdivx	%r10, %r11, %r6
	.word 0x8c6a800b  ! 912: UDIVX_R	udivx 	%r10, %r11, %r6
	.word 0x8b22a874  ! 913: MULScc_I	mulscc 	%r10, 0x0874, %r5
	.word 0x846a800b  ! 914: UDIVX_R	udivx 	%r10, %r11, %r2
	.word 0x87daa400  ! 915: FLUSH_I	dis not found

	.word 0xc64a800b  ! 916: LDSB_R	ldsb	[%r10 + %r11], %r3
	.word 0x2c800003  ! 917: BNEG	bneg,a	<label_0x3>
	.word 0x87daa3cc  ! 918: FLUSH_I	dis not found

	.word 0xcf3a800b  ! 919: STDF_R	std	%f7, [%r11, %r10]
	.word 0x85daa428  ! 920: FLUSH_I	dis not found

	.word 0xafdaaabc  ! 921: FLUSH_I	dis not found

	.word 0xc3ea900b  ! 922: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0x32800001  ! 923: BNE	bne,a	<label_0x1>
	.word 0xd812800b  ! 924: LDUH_R	lduh	[%r10 + %r11], %r12
	.word 0x8322800b  ! 925: MULScc_R	mulscc 	%r10, %r11, %r1
	.word 0xe8aa900b  ! 926: STBA_R	stba	%r20, [%r10 + %r11] 0x80
	.word 0xadda800b  ! 927: FLUSH_R	dis not found

	.word 0x9872a014  ! 928: UDIV_I	udiv 	%r10, 0x0014, %r12
	.word 0x8143c000  ! 929: STBAR	stbar
	.word 0xca52800b  ! 930: LDSH_R	ldsh	[%r10 + %r11], %r5
	.word 0xccfa900b  ! 931: SWAPA_R	swapa	%r6, [%r10 + %r11] 0x80
	.word 0x84f2800b  ! 933: UDIVcc_R	udivcc 	%r10, %r11, %r2
	.word 0xb7daacfc  ! 934: FLUSH_I	dis not found

	.word 0xf6c2900b  ! 935: LDSWA_R	ldswa	[%r10, %r11] 0x80, %r27
	.word 0xe4aa900b  ! 936: STBA_R	stba	%r18, [%r10 + %r11] 0x80
	.word 0x8143e062  ! 937: MEMBAR	membar	#StoreLoad | #MemIssue | #Sync 
	.word 0xc36aadf0  ! 938: PREFETCH_I	prefetch	[%r10 + 0x0df0], #one_read
	.word 0xe0ca900b  ! 939: LDSBA_R	ldsba	[%r10, %r11] 0x80, %r16
	.word 0xc49a900b  ! 941: LDDA_R	ldda	[%r10, %r11] 0x80, %r2
	.word 0xf612800b  ! 942: LDUH_R	lduh	[%r10 + %r11], %r27
	.word 0xcac2a6e0  ! 943: LDSWA_I	ldswa	[%r10, + 0x06e0] %asi, %r5
	.word 0x83daab84  ! 944: FLUSH_I	dis not found

	.word 0x8472800b  ! 945: UDIV_R	udiv 	%r10, %r11, %r2
	.word 0xd0ba900b  ! 946: STDA_R	stda	%r8, [%r10 + %r11] 0x80
	.word 0xcc1aab30  ! 947: LDD_I	ldd	[%r10 + 0x0b30], %r6
	.word 0x00800003  ! 948: BN	bn  	<label_0x3>
	.word 0x84f2800b  ! 949: UDIVcc_R	udivcc 	%r10, %r11, %r2
	.word 0xbc5a800b  ! 950: SMUL_R	smul 	%r10, %r11, %r30
	.word 0x8143c000  ! 951: STBAR	stbar
	.word 0xc3eaa788  ! 952: PREFETCHA_I	prefetcha	[%r10, + 0x0788] %asi, #one_read
	.word 0xa96a800b  ! 953: SDIVX_R	sdivx	%r10, %r11, %r20
	.word 0x8322adc4  ! 954: MULScc_I	mulscc 	%r10, 0x0dc4, %r1
	.word 0xc87a800b  ! 955: SWAP_R	swap	%r4, [%r10 + %r11]
	.word 0xd282abd8  ! 956: LDUWA_I	lduwa	[%r10, + 0x0bd8] %asi, %r9
	.word 0xba6aa12c  ! 957: UDIVX_I	udivx 	%r10, 0x012c, %r29
	.word 0x90da800b  ! 958: SMULcc_R	smulcc 	%r10, %r11, %r8
	.word 0x9da2882b  ! 959: FADDs	fadds	%f10, %f11, %f14
	.word 0x825a800b  ! 960: SMUL_R	smul 	%r10, %r11, %r1
	.word 0xcab2900b  ! 961: STHA_R	stha	%r5, [%r10 + %r11] 0x80
	.word 0x9ad2af60  ! 962: UMULcc_I	umulcc 	%r10, 0x0f60, %r13
	.word 0x8143e06f  ! 963: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #MemIssue | #Sync 
	.word 0x87da800b  ! 964: FLUSH_R	dis not found

	.word 0x8672800b  ! 965: UDIV_R	udiv 	%r10, %r11, %r3
	.word 0x8143c000  ! 966: STBAR	stbar
	.word 0x936aaf18  ! 967: SDIVX_I	sdivx	%r10, 0x0f18, %r9
	.word 0x8143c000  ! 968: STBAR	stbar
	.word 0x8c72800b  ! 969: UDIV_R	udiv 	%r10, %r11, %r6
	.word 0xf44aa4d0  ! 970: LDSB_I	ldsb	[%r10 + 0x04d0], %r26
	.word 0xc3eaa204  ! 971: PREFETCHA_I	prefetcha	[%r10, + 0x0204] %asi, #one_read
	.word 0x87a2882b  ! 972: FADDs	fadds	%f10, %f11, %f3
	.word 0xc292a610  ! 973: LDUHA_I	lduha	[%r10, + 0x0610] %asi, %r1
	.word 0xc212a194  ! 974: LDUH_I	lduh	[%r10 + 0x0194], %r1
	.word 0x86daa5dc  ! 975: SMULcc_I	smulcc 	%r10, 0x05dc, %r3
	.word 0xdeaa900b  ! 976: STBA_R	stba	%r15, [%r10 + %r11] 0x80
	.word 0xd0fa900b  ! 977: SWAPA_R	swapa	%r8, [%r10 + %r11] 0x80
	.word 0xfcbaab00  ! 978: STDA_I	stda	%r30, [%r10 + 0x0b00] %asi
	.word 0xb8da800b  ! 979: SMULcc_R	smulcc 	%r10, %r11, %r28
	.word 0xdd22800b  ! 980: STF_R	st	%f14, [%r11, %r10]
	.word 0xc4fa900b  ! 981: SWAPA_R	swapa	%r2, [%r10 + %r11] 0x80
	.word 0x8ba2892b  ! 982: FMULs	fmuls	%f10, %f11, %f5
	.word 0xc3eaa7bc  ! 983: PREFETCHA_I	prefetcha	[%r10, + 0x07bc] %asi, #one_read
	.word 0x0c800003  ! 984: BNEG	bneg  	<label_0x3>
	.word 0xe65aa628  ! 985: LDX_I	ldx	[%r10 + 0x0628], %r19
	.word 0x8143c000  ! 986: STBAR	stbar
	.word 0xc93aa110  ! 987: STDF_I	std	%f4, [0x0110, %r10]
	.word 0x91da800b  ! 988: FLUSH_R	dis not found

	.word 0xc0baafb8  ! 989: STDA_I	stda	%r0, [%r10 + 0x0fb8] %asi
	.word 0x8bda800b  ! 990: FLUSH_R	dis not found

	.word 0x91daa3f0  ! 991: FLUSH_I	dis not found

	.word 0xc6ea900b  ! 992: LDSTUBA_R	ldstuba	%r3, [%r10 + %r11] 0x80
	.word 0xcc82900b  ! 993: LDUWA_R	lduwa	[%r10, %r11] 0x80, %r6
	.word 0xceca900b  ! 994: LDSBA_R	ldsba	[%r10, %r11] 0x80, %r7
	.word 0xc3eaad60  ! 995: PREFETCHA_I	prefetcha	[%r10, + 0x0d60] %asi, #one_read
	.word 0xe0b2900b  ! 996: STHA_R	stha	%r16, [%r10 + %r11] 0x80
	.word 0xd13a800b  ! 997: STDF_R	std	%f8, [%r11, %r10]
	.word 0x06ca0001  ! 998: BRLZ	brlz  ,pt	%8,<label_0xa0001>
	.word 0xe282ad80  ! 999: LDUWA_I	lduwa	[%r10, + 0x0d80] %asi, %r17
	nop
	nop
	nop
        ta      T_GOOD_TRAP

.data
	.word  0x3aacef06,0x9dd83a74,0x668e2868,0xf15162eb
	.word  0x1fbc0d51,0x54c69fd3,0x70861dd6,0xa0c31534
	.word  0x3dbc046c,0x7ccccc2a,0x7e408aeb,0x3cf81bf9
	.word  0xb710b044,0x3007a33d,0x7c432686,0x551fe16f
	.word  0xf6505c86,0x874db0cc,0x5c2067c5,0x1289230b
	.word  0xfc8d9be6,0x37a44c48,0x313da059,0xb7a8f8d3
	.word  0xa293918a,0x51603d5b,0x2c53d0cb,0xfe80b0ec
	.word  0x924ee6b0,0xf19761ec,0x235e8e94,0x2098328f
	.word  0xd9a0ae75,0xbe090724,0x3e1e5a7c,0xf75eab89
	.word  0x351a3507,0x9f5ea60a,0x1e518cc7,0x297cc28a
	.word  0xbf0af82e,0xae7172e1,0x651d9613,0xe3c51ea0
	.word  0xf75cf9ae,0xdc53965d,0xe9bc185a,0x86ca68f0
	.word  0x7b955e4f,0x51b50158,0x7492fa07,0xaa59adc3
	.word  0x930c9842,0x5b438bdd,0xe396421c,0x167ea00d
	.word  0x5f25a675,0x44691e0d,0x9385978e,0x1d43914b
	.word  0x9d4b1516,0x685d518d,0x1ebcdae2,0xb08aeb85
	.word  0x6190a6cc,0x5d43fbc4,0xf5af6850,0xc64b0096
	.word  0x505bf514,0xd324c578,0xa9eaae3f,0x461ab102
	.word  0x5004679e,0xbde756f9,0x9396d830,0x41b7a9e0
	.word  0x7f8e2ea5,0x12556d8c,0xb308bf01,0xd8d82726
	.word  0x7b608e97,0xc57d09d0,0xa023f085,0xdeaea0de
	.word  0xd7b67fde,0xcd5284bf,0x960a4e3a,0x1c669355
	.word  0x43684190,0x98ed5799,0x1e7ed657,0xdf87cf33
	.word  0xc9bdde0d,0xb74a0e94,0x9246ea18,0xf99b3098
	.word  0xcc8e9241,0x400df56f,0x87584c63,0x359ea70c
	.word  0xe2fe5350,0xa25fd816,0x008aab45,0x29af9e35
	.word  0x2751b34e,0x74a0a1fa,0x12830ab8,0x09e91935
	.word  0x3b40d300,0xf5709495,0x828d218e,0x54c57f95
	.word  0x1e9db03e,0x37a57d03,0xe732e9d5,0x17a42c56
	.word  0x676cc92f,0x5969c378,0xdb53acd0,0xc98d3e35
	.word  0xd725286b,0x328fd6cf,0xf9bb274e,0x3e7fbff6
	.word  0x06cd4dba,0x74e14858,0x34f11110,0xc0f2f513
	.word  0x9f52b740,0x8f127eda,0xee22e2f2,0xd3e02811
	.word  0xd0621a4f,0xaf774ed1,0x070c4c36,0xc12d7c53
	.word  0x62d9a896,0x640ce8ed,0xc7dc2b38,0xa437d44c
	.word  0x904ee69d,0x9cafdd76,0x5036b9ce,0xc93caca6
	.word  0x2a0332c2,0xa7f82cce,0x95af951a,0x0abcf7fb
	.word  0x4d5a2026,0xaa93d6b6,0xf2c71aec,0x4028533b
	.word  0xb76f23d1,0x4e62a8d1,0x029f83f0,0xfd6bd06a
	.word  0x38a466aa,0xe8d4e391,0x33434804,0x2a9cd285
	.word  0x03ce3c5b,0x1a4c97b4,0x0c6872f2,0xb48a7fd1
	.word  0xaba18b7d,0x61fad760,0x89a4603d,0x1f63ac7b
	.word  0x30ce660c,0x7be9715a,0x815b0716,0x0e61b5c7
	.word  0xe511b120,0xaf502b01,0x700ac3bb,0x1bc318bb
	.word  0x8fb64127,0x9380da0a,0xb8775b91,0xb09a857d
	.word  0x6b39cdda,0xa441f730,0xb8ef09eb,0xbd4ed474
	.word  0x1f21693e,0x33e6c6a1,0xb022bf13,0x05fa0d3b
	.word  0x11bd9509,0xd91e480e,0x346d5947,0x93e5cb47
	.word  0x1ecf21c0,0xe2a95740,0xd27819d6,0x13c74f36
	.word  0x7a700abf,0x5e073cd6,0x41d597e6,0x85bbd471
	.word  0xedf675b4,0x853525b4,0xc8cfc205,0x19be6ec1
	.word  0x3236fb7d,0x3948ebe0,0x3cb6f58a,0x4ecdc0f9
	.word  0xddac5434,0xc1b8f278,0x8237f7ea,0xff309f13
	.word  0x43e2b5f5,0xe4df96d0,0x7f3e8c4d,0x8c6c1e85
	.word  0xb31206c6,0x4fa5eb23,0x325773c5,0xe9208257
	.word  0x7d00f7f0,0x4de9361f,0x18c9999d,0xc8c658e6
	.word  0x2785410e,0xeccffa34,0xbdbfe5db,0x5853a96e
	.word  0x38683316,0xe5a8988d,0x037d66fb,0xb0fac06a
	.word  0x19e52f75,0xb1e39a2e,0x7b5ac933,0x8b45f1bf
	.word  0xe6e644c9,0x07d5de88,0xf9b2216f,0x81a41033
	.word  0xf01323ab,0x545f19a8,0x329b1f1a,0x3f516fe8
	.word  0xc92259ca,0x27d906b5,0xec0d9e73,0x63025d6f
	.word  0xb7c16e8e,0x39994ae7,0x7fe68555,0x7e78de98
	.word  0xec61c265,0xcb2afa4c,0x3d4340a7,0x8f03c20e
	.word  0xe304da87,0x454628da,0x995f5ea0,0x26109c98
	.word  0xafba6a2f,0x26e16a3b,0x29e362d5,0x4437a6a5
	.word  0x0c5acc2e,0x539c5cb4,0x9a69bd77,0x10a585bf
	.word  0xf611dc98,0x6c93aa8d,0x6f6e5e94,0xd80f7bba
	.word  0xdf8b3657,0x3c585bab,0xa7c0c77d,0x02ea9d45
	.word  0x63bdf554,0xfff3c099,0xa0dda1c7,0x18628ad1
	.word  0x96061ffc,0xc7b2bac2,0xdd629913,0x9e6c1e8b
	.word  0x44afd40a,0x3df6887e,0xe0273cf2,0x9ba1b864
	.word  0x0614ac8b,0xac968517,0xe9c37fde,0x094f1c5e
	.word  0x8fb2314f,0xd4f57e41,0xabb40805,0xa4d8be9c
	.word  0x27726074,0xf3b29546,0x137a4ada,0x17565090
	.word  0x98920b01,0xa1bf2c1c,0xf9bb7ecd,0x82bf786f
	.word  0x5263251a,0x86c93098,0x263a54ac,0x0dfd2279
	.word  0x318624cc,0x1e1c8fad,0x006a34df,0x0ba4f28c
	.word  0x2398724c,0x61a60685,0x480017cd,0x8468af02
	.word  0x979015f6,0x5bbd9e92,0x6ca672f6,0xadd748a8
	.word  0x60533601,0x17dbba89,0xee3b4966,0xfc85fab1
	.word  0xde3d667d,0x46ed046e,0xdd9a3b1c,0x7b4271ff
	.word  0x906ea35e,0xdb5bc005,0x22f3f0c4,0x90931488
	.word  0x121d3857,0x8533a932,0x8873cf83,0xafb870e2
	.word  0xc2379310,0x2cb49b67,0x2db95a60,0x35bfa67e
	.word  0xc6a297d7,0xbc3f9d85,0x8f560459,0xdff9b3d8
	.word  0xe93332c7,0xa1ca9d7b,0x112d72e3,0xb2934ca9
	.word  0x16b1fa91,0xba51a7ba,0xa16a7c7f,0x0ad42dc6
	.word  0x813b6be2,0xffcdc09b,0x8079e5c1,0xacc68c7d
	.word  0x4da4288a,0x4ee4cbba,0xc5781f9d,0x400dd356
	.word  0xc805296b,0x24e1dd83,0xaeac41ad,0x9310c96b
	.word  0xaa0918a0,0x0f6038c3,0x9a46d3fc,0xc6bc5b52
	.word  0xa95942d1,0x60710641,0xcb6754ad,0xe9806da1
	.word  0xd77fbc01,0xd30771db,0xf88279f3,0xdee0495c
	.word  0x4de2a1b7,0x83238781,0xa1bbbd82,0xe849a6d2
	.word  0x76fc7efb,0x54ec8f00,0xb5c0ae55,0x0eed9ccf
	.word  0x77f9ce74,0xca74913d,0xb3cbb425,0x4b0d3c0c
	.word  0xf72995e7,0x93427811,0x24eae517,0xf93361ee
	.word  0x93c2e3c9,0xed884190,0x2dc96f83,0x6332865e
	.word  0xce9a976e,0xbb3fa1e5,0xb5a8c118,0x87b240f6
	.word  0xdc025faa,0x38c9736b,0xcbe6e993,0x145a36a9
	.word  0xa3d82d4e,0x37b9e848,0xfbfec59c,0x7ed01e52
	.word  0x15160342,0xb39c1493,0x415aebd7,0x7b571132
	.word  0x90b8640f,0xd3a5ad8d,0x137011e5,0x276ac220
	.word  0x17520a86,0x692b7064,0x655eaa28,0x897dfd45
	.word  0xde997703,0x44e5f9f1,0xcfc44694,0x18b564b6
	.word  0xc6762b3e,0x732c96a3,0x138ae8bf,0x0f39313d
	.word  0x8197d7ff,0x10b1fcaa,0x5dd1b554,0xa5814199
	.word  0x87ddc061,0x5d4cd8a4,0x21e90e50,0xaedfd467
	.word  0x71878257,0xf4a2eafd,0xfe393966,0xb9f766cd
	.word  0x89d5dcb1,0x8de358b5,0x0ba3fd79,0xfbaa2ee2
	.word  0x8d6b1e02,0xd9d24a9d,0x5558d230,0xfe289901
	.word  0xd920deb7,0x21f17fd2,0x8aad1f22,0xdec9b1f7
	.word  0xb225fa1f,0x3b0f11e7,0xa9d02048,0x12c7965b
	.word  0xb49e365f,0x711bc615,0xbb77ddf8,0xff788ac9
	.word  0xd7f393b4,0xcc9777ea,0xa0fdfd79,0x683b8457
	.word  0xb4c2da3c,0x14d0991a,0x7ee3df1c,0xb00224dd
	.word  0x2ff616f9,0xc2353d39,0xd37c57c7,0xe3aa38ca
	.word  0x02fdd186,0x83c97013,0xd50fe953,0x23cb0fbc
	.word  0x9daad256,0xd530d0f0,0xa0956a82,0x78a75718
	.word  0xa021a839,0x58c56aca,0x7ca3e9a3,0x44597bf3
	.word  0x00abfa50,0xbff19e1e,0x9e88e526,0x121c3608
	.word  0xe989e90c,0x2cc71f3a,0x29303c39,0x8a5b9a42
	.word  0x5fc2637e,0xef3d839d,0xa0ee5fa8,0x9428bb6b
	.word  0xaee78e37,0x652a14c6,0x0c3971c4,0xc0e4754a
	.word  0x3e9d54b3,0x7da81488,0x1855050d,0x35286401
	.word  0xe3b2e64f,0xac2e3b60,0xeffda101,0x7846bc03
	.word  0xdb6bc4a1,0xe83186bc,0x531f1d5d,0x50fe2b0a
	.word  0x95b550f0,0xec8c2256,0x98d179a4,0xfb4a32d2
	.word  0x4b5faf81,0x0fdf25ee,0x430c3e0e,0x702f7ffb
	.word  0xeffd6370,0x3597c1e3,0x908b30ee,0x7f87e899
	.word  0xe54d82a3,0x55dbc2d6,0x1116c049,0x8550cb09
	.word  0x21a4cd1e,0xd07d140b,0xa569c401,0x4d845358
	.word  0xb315e39e,0xc611b29d,0x9b9b0774,0xd2591b64
	.word  0xab6475a8,0xc1e4efa8,0xa27a1369,0xcef3c0f5
	.word  0x7d557655,0x8f4098d7,0xa3c7c887,0xdcc95bd0
	.word  0x6521943b,0x02b188c2,0xaa8f067f,0x338497d8
	.word  0x489cde16,0x211c6d91,0x0d02817c,0x6e033d85
	.word  0x59b52c05,0xf2ee03a8,0x8a4a48d1,0x842bae2b
	.word  0xe986e124,0x55fde48f,0xa00b17ab,0x315ca7a2
	.word  0xdf47c41a,0x67b261a6,0x76e4cdd4,0xbfb5ccfa
	.word  0x75987af0,0x254e63e6,0x5d368520,0x591ed8bc
	.word  0x02facbda,0xf3910dae,0xfb5b4e29,0xab033364
	.word  0x3f472710,0xaaf00ad4,0xc0f48670,0x5326b5e0
	.word  0x3189704e,0x00c4dba0,0x7f8314ad,0x0721dd82
	.word  0x578039f3,0x3ccfc3b8,0x8c31c58c,0x3e0213b8
	.word  0x9b56c9f5,0xc6ec8b24,0xb3735d32,0xf81edeec
	.word  0xeddc8a93,0x34b4500f,0x81ae662a,0x4c6ffa21
	.word  0xaf187290,0x4ebeba2c,0x59af092a,0xc85fccd1
	.word  0x6638d3f6,0x97e8c724,0x5ebf13ad,0xe83c0ec9
	.word  0xbe9317b2,0xcdbe1ebf,0xe46e0f6b,0x81ab3fe6
	.word  0xea298547,0x05f2f875,0x413806ff,0x4eafc061
	.word  0x465bd289,0xf4dcab63,0x2cdf06fd,0xacc7d34b
	.word  0xeb285c7e,0x49c2fa08,0x7e1be10f,0x835b33de
	.word  0xbe8871f3,0xc9b97d94,0xf84f9cc5,0xe2e602fd
	.word  0x27de9789,0x27937057,0x9cab6c4e,0x066b39ee
	.word  0x0fdc3931,0x177ec334,0xa27f3cfd,0xca22e482
	.word  0x57a4089f,0x287181dd,0xca338600,0xff8db971
	.word  0x7834c33d,0x756122c5,0x9c105d5c,0xb3dbf315
	.word  0x8ffbf85b,0x0a9f476c,0xb600774f,0x8f77ad76
	.word  0x4d41b5f3,0x4358d10b,0xc0f78bc7,0xdceead9c
	.word  0xc0415e95,0x9dc6b645,0xed1f86f1,0xf9c1f4e4
	.word  0x49e01f02,0x4ec4c1b1,0x6883ac51,0x01f1d87a
	.word  0x0136d5f0,0x9fdb46bc,0xbcfd8928,0x20b480d6
	.word  0xbb769eb2,0xfcf774ab,0x830a3394,0x542190e3
	.word  0x580c3068,0x180ace8d,0x98083683,0xede6072a
	.word  0x347bebe6,0xdd9b75a0,0x4de49dd9,0x239e4fcb
	.word  0xc3ce7d4e,0x8b104e3f,0x8e825632,0x5bfd1677
	.word  0x39c1a964,0x10fed221,0x5a3b5038,0xf3e417f9
	.word  0x3ce4ed42,0xc80e2cc8,0xbe2990b6,0x683ec4fd
	.word  0xb1cf6cb7,0xf3320c99,0x3e83e8b7,0xe44ba3d1
	.word  0x5914f309,0xda56ffaf,0xac783707,0x9259ec62
	.word  0xd6b26508,0x508c5997,0x32ddc88f,0x71c74be3
	.word  0x74191d72,0x6912a8e0,0x1a94df5d,0x3d321c27
	.word  0xb99f39ac,0x7fa8e030,0xba38727c,0xf9ab4c58
	.word  0x9580f6cc,0xdcf8d036,0xfd74f55b,0x2e6c0193
	.word  0x43533f28,0x5a419a09,0xc5e4a8b8,0x081a06fc
	.word  0xf6d5184e,0x6ddb6168,0xdb071a9c,0xd43e78d8
	.word  0x834d5e3e,0x51288b4a,0x18f3de8a,0x0925d6c5
	.word  0xe4316e04,0xb7244291,0x69b02ef9,0xff997e82
	.word  0xa0b04ec1,0x7c88286d,0x066f0eb7,0xe7c2e6df
	.word  0x746975a5,0xde1158d5,0xacab585a,0x0681598e
	.word  0xdf50597d,0xf5c411d9,0x7d7532bc,0x67150421
	.word  0x99168a83,0x0d2e6bf2,0x6ac4dd00,0x026131c9
	.word  0xcbab7639,0xd6e3d365,0xd2c766f6,0x4cf0788e
	.word  0x15e2829d,0x1d3b6d99,0x30aca7d8,0x29671979
	.word  0xcc339fb2,0x4e6115fe,0x5b19029b,0x747b7133
	.word  0xc11f8753,0xd27de9e8,0xfd1be4b0,0x3b4996e5
	.word  0xa503c7c3,0xbd4e8e5c,0xd074bed0,0x0736d8fb
	.word  0x7e849614,0x78289b4e,0xdb2c1b3e,0x16db9899
	.word  0xef2ba456,0xd538eff5,0xf696d486,0x4294d4db
	.word  0xc437782d,0x5f823aea,0x690f7268,0x0320de25
	.word  0x75910543,0x28d3697f,0x0b580f96,0xbba1a0e0
	.word  0xeaa44701,0xe293c956,0xf188ff03,0xd5d27248
	.word  0x02688508,0x82eeb83c,0xb0837525,0xf558846b
	.word  0x276809e2,0x2a56bb5e,0x207c039d,0xc0956481
	.word  0x5cf1e4c0,0xc076a403,0xe566f052,0x2ff38d98
	.word  0x07ecf5db,0xdbcb2f7f,0x70de7b5d,0x25ef0553
	.word  0x5fef2956,0x5cd5ac97,0x56a53f32,0xfc2fea8f
	.word  0x2b237ae1,0xbe635ace,0x816164a4,0x42520e01
	.word  0xb1da277a,0x4b727baa,0x1620e162,0xaeae2af0
	.word  0xec824700,0x60cedb41,0xa89a97fe,0x205da004
	.word  0xe1776653,0x3790af3b,0x3fa1141b,0xb494ab19
	.word  0x17ca0fce,0xa1b946cd,0xac150ab2,0x44872919
	.word  0x02154f3a,0x089ee2af,0x1aff89d1,0xff89940e
	.word  0x21f04b80,0x7ad191aa,0xaf22de21,0x4505b9c6
	.word  0x80758f3d,0xb1fdbf43,0xfde669ca,0x58cfac0f
	.word  0x5449a9ad,0xa8d07da0,0x9b7d630b,0x8bf4d251
	.word  0xe314d1a5,0x94d9cda0,0x8bcaeec0,0x8387f300
	.word  0x30242428,0xf7546743,0x0daae5c3,0xa40afbcc
	.word  0xdc84bc1b,0x88a2ec91,0x7bbbeb96,0x95a7b11f
	.word  0xf333064b,0x452c2745,0xa419ca31,0xf2f4e0f0
	.word  0xb7d2877f,0x29cfa332,0xc85ba802,0xd07d0e01
	.word  0x6fa21d6d,0xf9e5cc92,0x7914cd84,0x7ceba45a
	.word  0xc4814389,0x162c7660,0x2adc680e,0x635193d5
	.word  0x31b1bf34,0x269aa76d,0xda8113ab,0x0d67f88b
	.word  0x9bbf0cb9,0x7f430973,0xf3d3ee65,0xbaafb6ac
	.word  0x84ad83a3,0x80956bd4,0x970696cc,0xe0a8a4dc
	.word  0x9e20f9e9,0x4213e14f,0x19873aab,0x542bd4aa
	.word  0x6554de4f,0x495587e1,0x49180c07,0xb771a7b8
	.word  0x6dbc596d,0x9b8a2ae3,0xe9f43169,0x180ab0fe
	.word  0x3397578e,0xe45ae9ff,0x4490c748,0xad507394
	.word  0xe9a5724b,0x53e4348b,0x883989a2,0xf42e5660
	.word  0xc0d57069,0xd694b10f,0xdd0404fe,0x8dfd3dfe
	.word  0xfcf831e8,0xf50a14b4,0x679123c6,0xb4f7541a
	.word  0x16342092,0x5cb071cd,0xb3ced8f7,0xe57d702a
	.word  0x7ec34605,0x97536dab,0x5e30e7fe,0xcaa6cb8d
	.word  0x30e30d6f,0x18c485e7,0x1bf1d26c,0x3c03c326
	.word  0x09cb429a,0x954ede2d,0xb8660c8f,0x5167a37d
	.word  0x305fb3cb,0xf94c227a,0xc29151b3,0x9d273198
	.word  0x4393fc95,0xee4e4793,0x369b5f3f,0x39d8ac94
	.word  0xaeafbfbb,0xe81d74cf,0x99983148,0xe556f061
	.word  0xecce611e,0xd251d458,0x324acf69,0x1c0bc2c0
	.word  0x7565e5cb,0x43405432,0x77e915a9,0x2374e6ac
	.word  0x55406755,0x2347c040,0xe66ccaf3,0x2be79cc4
	.word  0xcab20553,0x86d5971f,0x12eea2d1,0x04b6a995
	.word  0x5a667cbc,0x5d211c43,0x3f1fe387,0x0bb79942
	.word  0xeb6603da,0x538b98be,0xd1f0e4e4,0xc1fe1ac5
	.word  0x4ec0bb77,0x22c6ef8c,0xd4bec452,0xaecef1a5
	.word  0x3aafb592,0x26d3fbc1,0x58d9735c,0x4ab4468f
	.word  0x9b13aeb3,0xaf91e246,0xd8a3923e,0xca3051af
	.word  0x4e3d02cf,0x90501135,0x0382719d,0xc2c432bb
	.word  0xa5a85bb8,0x222ebff5,0xd2601395,0xfc24eebd
	.word  0x0a526ac5,0x98f0aedb,0x00917f59,0xfde07bb6
	.word  0xc3a3980a,0xd7c0c793,0xe6c62ed8,0x34f50612
	.word  0x7d378c1c,0x69f76471,0xbdb1554c,0x9796b9ec
	.word  0x95a309a4,0xa5246ff1,0x9e8e8f41,0x88cf944f
	.word  0x2b7ba0ff,0x6a871a1a,0x9be09fe6,0x0fbfb10d
	.word  0xab489856,0x0628c937,0x3f235444,0x8058ff72
	.word  0x9f3947b5,0xccad75f2,0x4ac274e5,0xde8bd2a5
	.word  0xb4270b11,0x1ac13365,0x857e94a5,0xce346b65
	.word  0xcb1297dc,0x02e9dd25,0xb438a47b,0x831876c3
	.word  0xdc00de9e,0xe48788c3,0x6a664229,0x23bde557
	.word  0x6ab482e2,0x70c9ae4f,0x6c1a5339,0xcbc49f00
	.word  0x91759b86,0x46bf5ef8,0x3788c09a,0xda19bdbc
	.word  0xff49c19a,0x4fa547af,0x5d2562d7,0x8e0d2086

!!# /************************************************************
!!# *
!!# * File:         lop2.j
!!# *
!!# * Description:  Long latency instructions in random order
!!# *
!!# * - Mul-div
!!# * - Fpops
!!# * - Spec load
!!# * - Non spec load
!!# * - ASI load
!!# * - Branches
!!# * - Atomics
!!# * - Membar
!!# * - wr, wrpr, rd, rdpr...
!!# * - ASI store
!!# * - Flush 
!!# * - Prefetch
!!# * - Save, Restore, Saved, Restored, flushw
!!# * - Done, retry
!!# * - Trap instruction
!!# **************************************************************/
!!# 
!!# --c_declarations
!!# 
!!#   int i;
!!#   int pref_cnt = 0;
!!#   int is_prefetch = 0;
!!# 
!!# --setup
!!# 
!!#   IJ_set_thread_count(4);
!!# 
!!# --init
!!# 
!!#   printf ("**********************************\n");
!!# 
!!#   IJ_set_ropr_fld (ijdefault, Ft_Rs1, "{10}");
!!#   IJ_set_ropr_fld (ijdefault, Ft_Rs2, "{11}");
!!#   IJ_set_ropr_fld (ijdefault, Ft_Rd, "{1..9, 12..31}");
!!#   IJ_set_ropr_fld (ijdefault, Fm_align_Rd, "1'b1");
!!#   IJ_set_ropr_fld (ijdefault, Ft_Simm13, "13'b0rrrrrrrrrr00");
!!#   IJ_set_ropr_fld (ijdefault, Fm_align_Simm13, "3'b111");
!!#   IJ_set_ropr_fld (ijdefault, Ft_Imm_Asi, "{0x80}");
!!#   IJ_set_ropr_fld (ijdefault, Ft_Cc1_f2, "1'br");
!!#   IJ_set_ropr_fld (ijdefault, Ft_Cc0_f2, "1'b0");
!!#   IJ_set_ropr_fld (ijdefault, Ft_P, "1'br");
!!#   IJ_set_ropr_fld (ijdefault, Ft_A, "1'br");  
!!#   IJ_set_ropr_fld (ijdefault, Ft_D16, "{0x1, 0x3}");
!!#   IJ_set_ropr_fld (ijdefault, Ft_Disp22, "{0x1, 0x3}");
!!#   IJ_set_ropr_fld (ijdefault, Ft_Disp19, "{0x1, 0x3}");
!!#   IJ_set_ropr_fld (ijdefault, Ft_Disp30, "{0x1, 0x3}");
!!#   IJ_set_ropr_fld (ijdefault, Ft_Cmask, "3'brrr");
!!#   IJ_set_ropr_fld (ijdefault, Ft_Mmask, "4'brrrr");
!!# 
!!#   IJ_set_rvar (reg_rand_init, "64'h0000000000000rr0");
!!# 
!!#   IJ_printf ("th", "        setx  MAIN_BASE_DATA_VA, %%r1, %%r10\n");
!!#   IJ_printf ("th", "        setx  0x%016llrx, %%g1, %%r11\n", reg_rand_init);
!!# 
!!#   IJ_printf ("th", "        setx  0x80, %%g2, %%g1\n");
!!#   IJ_printf ("th", "        wr  %%g1, %%g0, %%asi\n");
!!# 
!!#   IJ_printf ("th", "	    rd %%fprs, %%g1\n");
!!#   IJ_printf ("th", "        wr %%g1, 0x4, %%fprs\n");
!!# 
!!#   IJ_init_fp_regs ("th", 10);
!!# 
!!#   IJ_set_rvar (reg_rand_init, "64'hrrrrrrrr rrrrrrrr");
!!# 
!!#   for (i = 0; i < 10; i++) {
!!#      IJ_printf ("th", "        setx  0x%016llrx, %%g1, %%r%d\n", reg_rand_init, i);
!!#   }
!!#   for (i = 12; i < 32; i++) {
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
!!# th_main_1:
!!# !<<IJ>>include "th1.s"
!!# 	nop
!!# 	nop
!!# 	nop
!!#         ta      T_GOOD_TRAP
!!# th_main_2:
!!# !<<IJ>>include "th2.s"
!!# 	nop
!!# 	nop
!!# 	nop
!!#         ta      T_GOOD_TRAP
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
!!#               {
!!# 		if (is_prefetch == 1) {
!!#                   if (pref_cnt > 10) {
!!# 		    IJ_generate ("th", $2);
!!#                     pref_cnt = 0;
!!#                   }
!!#                 } else {
!!# 		  IJ_generate ("th", $2);
!!# 		  pref_cnt++;
!!# 	        }
!!# 	        is_prefetch = 0;
!!#               }
!!#             ;
!!# 
!!# inst_type: mul | div | fpop | load | asi_load | asi_st | br | membar | atomic | flush
!!# 	   | prefetch
!!# 	     {     
!!# 	        is_prefetch = 1;
!!# 	     }
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
!!# load: tLDSB_R | tLDSB_I | tLDSH_R | tLDSH_I | tLDSW_R | tLDSW_I | tLDUB_R | tLDUB_I | tLDUH_R | tLDUH_I | tLDUW_R | tLDUW_I | tLDX_R | tLDX_I | tLDD_R | tLDD_I 
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
!!# flush: tFLUSH_I | tFLUSH_R
!!# ;!! Token Generation Statistics
!! ---------------------------------
!! 
!! Rule   1 (line  114), Count:   999  inst_block           -> inst_type 
!! Rule   2 (line  115), Count:   999  inst_block           -> inst_block inst_type 
!! Rule   3 (line  130), Count:    89  inst_type            -> mul 
!! Rule   4 (line  130), Count:   107  inst_type            -> div 
!! Rule   5 (line  130), Count:    93  inst_type            -> fpop 
!! Rule   6 (line  130), Count:    97  inst_type            -> load 
!! Rule   7 (line  130), Count:    97  inst_type            -> asi_load 
!! Rule   8 (line  130), Count:    94  inst_type            -> asi_st 
!! Rule   9 (line  130), Count:    81  inst_type            -> br 
!! Rule  10 (line  130), Count:    70  inst_type            -> membar 
!! Rule  11 (line  130), Count:    93  inst_type            -> atomic 
!! Rule  12 (line  130), Count:    80  inst_type            -> flush 
!! Rule  13 (line  131), Count:    88  inst_type            -> prefetch 
!! Rule  14 (line  137), Count:    47  fpop                 -> st_fp 
!! Rule  15 (line  137), Count:    45  fpop                 -> arith_fp 
!! Rule  16 (line  140), Count:     5  mul                  -> tMULX_R 
!! Rule  17 (line  140), Count:    12  mul                  -> tMULX_I 
!! Rule  18 (line  140), Count:     7  mul                  -> tUMUL_R 
!! Rule  19 (line  140), Count:     5  mul                  -> tUMUL_I 
!! Rule  20 (line  140), Count:     6  mul                  -> tSMUL_R 
!! Rule  21 (line  140), Count:     3  mul                  -> tSMUL_I 
!! Rule  22 (line  140), Count:     6  mul                  -> tUMULcc_R 
!! Rule  23 (line  140), Count:     4  mul                  -> tUMULcc_I 
!! Rule  24 (line  140), Count:     8  mul                  -> tSMULcc_R 
!! Rule  25 (line  140), Count:     5  mul                  -> tSMULcc_I 
!! Rule  26 (line  140), Count:     6  mul                  -> tMULScc_R 
!! Rule  27 (line  140), Count:    11  mul                  -> tMULScc_I 
!! Rule  28 (line  143), Count:    10  div                  -> tUDIV_I 
!! Rule  29 (line  143), Count:     7  div                  -> tUDIV_R 
!! Rule  30 (line  143), Count:     9  div                  -> tSDIV_I 
!! Rule  31 (line  143), Count:     3  div                  -> tSDIV_R 
!! Rule  32 (line  143), Count:     7  div                  -> tSDIVX_R 
!! Rule  33 (line  143), Count:    11  div                  -> tSDIVX_I 
!! Rule  34 (line  143), Count:     7  div                  -> tUDIVX_R 
!! Rule  35 (line  143), Count:    12  div                  -> tUDIVX_I 
!! Rule  36 (line  143), Count:     7  div                  -> tUDIVcc_I 
!! Rule  37 (line  143), Count:     9  div                  -> tUDIVcc_R 
!! Rule  38 (line  143), Count:     7  div                  -> tSDIVcc_I 
!! Rule  39 (line  143), Count:     7  div                  -> tSDIVcc_R 
!! Rule  40 (line  146), Count:     4  load                 -> tLDSB_R 
!! Rule  41 (line  146), Count:     8  load                 -> tLDSB_I 
!! Rule  42 (line  146), Count:     4  load                 -> tLDSH_R 
!! Rule  43 (line  146), Count:     9  load                 -> tLDSH_I 
!! Rule  44 (line  146), Count:     6  load                 -> tLDSW_R 
!! Rule  45 (line  146), Count:     3  load                 -> tLDSW_I 
!! Rule  46 (line  146), Count:     3  load                 -> tLDUB_R 
!! Rule  47 (line  146), Count:     2  load                 -> tLDUB_I 
!! Rule  48 (line  146), Count:    10  load                 -> tLDUH_R 
!! Rule  49 (line  146), Count:     4  load                 -> tLDUH_I 
!! Rule  50 (line  146), Count:     4  load                 -> tLDUW_R 
!! Rule  51 (line  146), Count:     6  load                 -> tLDUW_I 
!! Rule  52 (line  146), Count:     3  load                 -> tLDX_R 
!! Rule  53 (line  146), Count:     6  load                 -> tLDX_I 
!! Rule  54 (line  146), Count:     3  load                 -> tLDD_R 
!! Rule  55 (line  146), Count:     7  load                 -> tLDD_I 
!! Rule  56 (line  149), Count:     5  asi_load             -> tLDSBA_R 
!! Rule  57 (line  149), Count:     5  asi_load             -> tLDSBA_I 
!! Rule  58 (line  149), Count:     5  asi_load             -> tLDSHA_R 
!! Rule  59 (line  149), Count:     7  asi_load             -> tLDSHA_I 
!! Rule  60 (line  149), Count:     6  asi_load             -> tLDSWA_R 
!! Rule  61 (line  149), Count:     8  asi_load             -> tLDSWA_I 
!! Rule  62 (line  149), Count:     8  asi_load             -> tLDUBA_R 
!! Rule  63 (line  149), Count:     2  asi_load             -> tLDUBA_I 
!! Rule  64 (line  149), Count:     6  asi_load             -> tLDUHA_R 
!! Rule  65 (line  149), Count:     6  asi_load             -> tLDUHA_I 
!! Rule  66 (line  149), Count:     3  asi_load             -> tLDUWA_R 
!! Rule  67 (line  149), Count:     4  asi_load             -> tLDUWA_I 
!! Rule  68 (line  149), Count:     6  asi_load             -> tLDXA_R 
!! Rule  69 (line  149), Count:     1  asi_load             -> tLDXA_I 
!! Rule  70 (line  149), Count:     3  asi_load             -> tLDDA_R 
!! Rule  71 (line  149), Count:     7  asi_load             -> tLDDA_I 
!! Rule  72 (line  152), Count:    14  asi_st               -> tSTBA_R 
!! Rule  73 (line  152), Count:     7  asi_st               -> tSTBA_I 
!! Rule  74 (line  152), Count:     9  asi_st               -> tSTHA_R 
!! Rule  75 (line  152), Count:     8  asi_st               -> tSTHA_I 
!! Rule  76 (line  152), Count:     6  asi_st               -> tSTWA_R 
!! Rule  77 (line  152), Count:     7  asi_st               -> tSTWA_I 
!! Rule  78 (line  152), Count:    11  asi_st               -> tSTXA_R 
!! Rule  79 (line  152), Count:     4  asi_st               -> tSTXA_I 
!! Rule  80 (line  152), Count:    11  asi_st               -> tSTDA_R 
!! Rule  81 (line  152), Count:     8  asi_st               -> tSTDA_I 
!! Rule  82 (line  155), Count:     6  br                   -> tBA 
!! Rule  83 (line  155), Count:     3  br                   -> tBN 
!! Rule  84 (line  155), Count:     0  br                   -> tBNE 
!! Rule  86 (line  155), Count:     6  br                   -> tBG 
!! Rule  87 (line  155), Count:     4  br                   -> tBLE 
!! Rule  88 (line  155), Count:     5  br                   -> tBGE 
!! Rule  89 (line  155), Count:     2  br                   -> tBL 
!! Rule  90 (line  155), Count:     0  br                   -> tBGU 
!! Rule  91 (line  155), Count:     3  br                   -> tBLEU 
!! Rule  92 (line  156), Count:     3  br                   -> tBCC 
!! Rule  93 (line  156), Count:     2  br                   -> tBCS 
!! Rule  94 (line  156), Count:     4  br                   -> tBPOS 
!! Rule  95 (line  156), Count:     6  br                   -> tBNEG 
!! Rule  96 (line  156), Count:     0  br                   -> tBVC 
!! Rule  97 (line  156), Count:     0  br                   -> tBVS 
!! Rule  98 (line  156), Count:     4  br                   -> tBRZ 
!! Rule  99 (line  156), Count:     4  br                   -> tBRLEZ 
!! Rule 100 (line  157), Count:     2  br                   -> tBRLZ 
!! Rule 101 (line  157), Count:     2  br                   -> tBRNZ 
!! Rule 102 (line  157), Count:     2  br                   -> tBRGZ 
!! Rule 103 (line  157), Count:     2  br                   -> tBRGEZ 
!! Rule 104 (line  157), Count:     0  br                   -> tCALL 
!! Rule 105 (line  160), Count:    37  membar               -> tMEMBAR 
!! Rule 106 (line  160), Count:    32  membar               -> tSTBAR 
!! Rule 107 (line  163), Count:     1  atomic               -> tCASA_R 
!! Rule 108 (line  163), Count:    10  atomic               -> tCASA_I 
!! Rule 109 (line  163), Count:     5  atomic               -> tCASXA_R 
!! Rule 110 (line  163), Count:     8  atomic               -> tCASXA_I 
!! Rule 111 (line  163), Count:     5  atomic               -> tLDSTUBA_I 
!! Rule 112 (line  163), Count:     5  atomic               -> tLDSTUB_I 
!! Rule 113 (line  163), Count:    12  atomic               -> tLDSTUB_R 
!! Rule 114 (line  163), Count:    12  atomic               -> tLDSTUBA_R 
!! Rule 115 (line  163), Count:     4  atomic               -> tSWAP_I 
!! Rule 116 (line  163), Count:     6  atomic               -> tSWAP_R 
!! Rule 117 (line  163), Count:     5  atomic               -> tSWAPA_I 
!! Rule 118 (line  163), Count:     9  atomic               -> tSWAPA_R 
!! Rule 119 (line  166), Count:    18  st_fp                -> tSTF_R 
!! Rule 120 (line  166), Count:    10  st_fp                -> tSTF_I 
!! Rule 121 (line  166), Count:     7  st_fp                -> tSTDF_I 
!! Rule 122 (line  166), Count:     9  st_fp                -> tSTDF_R 
!! Rule 123 (line  169), Count:    11  arith_fp             -> tFADDs 
!! Rule 124 (line  169), Count:     7  arith_fp             -> tFSUBs 
!! Rule 125 (line  169), Count:    10  arith_fp             -> tFMULs 
!! Rule 126 (line  169), Count:    14  arith_fp             -> tFDIVs 
!! Rule 127 (line  172), Count:    23  prefetch             -> tPREFETCH_I 
!! Rule 128 (line  172), Count:    22  prefetch             -> tPREFETCH_R 
!! Rule 129 (line  172), Count:    21  prefetch             -> tPREFETCHA_I 
!! Rule 130 (line  172), Count:    19  prefetch             -> tPREFETCHA_R 
!! Rule 131 (line  175), Count:    41  flush                -> tFLUSH_I 
!! 
!!   257: Token tMULX_R	Count = 6
!!   258: Token tMULX_I	Count = 13
!!   259: Token tUMUL_R	Count = 8
!!   260: Token tUMUL_I	Count = 6
!!   261: Token tSMUL_R	Count = 7
!!   262: Token tSMUL_I	Count = 4
!!   263: Token tUMULcc_R	Count = 7
!!   264: Token tUMULcc_I	Count = 5
!!   265: Token tSMULcc_R	Count = 9
!!   266: Token tSMULcc_I	Count = 6
!!   267: Token tMULScc_R	Count = 7
!!   268: Token tMULScc_I	Count = 12
!!   269: Token tUDIV_I	Count = 11
!!   270: Token tUDIV_R	Count = 8
!!   271: Token tSDIV_I	Count = 10
!!   272: Token tSDIV_R	Count = 4
!!   273: Token tSDIVX_R	Count = 8
!!   274: Token tSDIVX_I	Count = 12
!!   275: Token tUDIVX_R	Count = 8
!!   276: Token tUDIVX_I	Count = 13
!!   277: Token tUDIVcc_I	Count = 8
!!   278: Token tUDIVcc_R	Count = 10
!!   279: Token tSDIVcc_I	Count = 8
!!   280: Token tSDIVcc_R	Count = 8
!!   281: Token tLDSB_R	Count = 5
!!   282: Token tLDSB_I	Count = 9
!!   283: Token tLDSH_R	Count = 5
!!   284: Token tLDSH_I	Count = 10
!!   285: Token tLDSW_R	Count = 7
!!   286: Token tLDSW_I	Count = 4
!!   287: Token tLDUB_R	Count = 4
!!   288: Token tLDUB_I	Count = 3
!!   289: Token tLDUH_R	Count = 11
!!   290: Token tLDUH_I	Count = 5
!!   291: Token tLDUW_R	Count = 5
!!   292: Token tLDUW_I	Count = 7
!!   293: Token tLDX_R	Count = 4
!!   294: Token tLDX_I	Count = 7
!!   295: Token tLDD_R	Count = 4
!!   296: Token tLDD_I	Count = 8
!!   297: Token tLDSBA_R	Count = 6
!!   298: Token tLDSBA_I	Count = 6
!!   299: Token tLDSHA_R	Count = 6
!!   300: Token tLDSHA_I	Count = 8
!!   301: Token tLDSWA_R	Count = 7
!!   302: Token tLDSWA_I	Count = 9
!!   303: Token tLDUBA_R	Count = 9
!!   304: Token tLDUBA_I	Count = 3
!!   305: Token tLDUHA_R	Count = 7
!!   306: Token tLDUHA_I	Count = 7
!!   307: Token tLDUWA_R	Count = 4
!!   308: Token tLDUWA_I	Count = 5
!!   309: Token tLDXA_R	Count = 7
!!   310: Token tLDXA_I	Count = 2
!!   311: Token tLDDA_R	Count = 4
!!   312: Token tLDDA_I	Count = 8
!!   313: Token tSTBA_R	Count = 15
!!   314: Token tSTBA_I	Count = 8
!!   315: Token tSTHA_R	Count = 10
!!   316: Token tSTHA_I	Count = 9
!!   317: Token tSTWA_R	Count = 7
!!   318: Token tSTWA_I	Count = 8
!!   319: Token tSTXA_R	Count = 12
!!   320: Token tSTXA_I	Count = 5
!!   321: Token tSTDA_R	Count = 12
!!   322: Token tSTDA_I	Count = 9
!!   323: Token tBA	Count = 7
!!   324: Token tBN	Count = 4
!!   325: Token tBNE	Count = 1
!!   326: Token tBE	Count = 0
!!   327: Token tBG	Count = 7
!!   328: Token tBLE	Count = 5
!!   329: Token tBGE	Count = 6
!!   330: Token tBL	Count = 3
!!   331: Token tBGU	Count = 1
!!   332: Token tBLEU	Count = 4
!!   333: Token tBCC	Count = 4
!!   334: Token tBCS	Count = 3
!!   335: Token tBPOS	Count = 5
!!   336: Token tBNEG	Count = 7
!!   337: Token tBVC	Count = 1
!!   338: Token tBVS	Count = 1
!!   339: Token tBRZ	Count = 5
!!   340: Token tBRLEZ	Count = 5
!!   341: Token tBRLZ	Count = 3
!!   342: Token tBRNZ	Count = 3
!!   343: Token tBRGZ	Count = 3
!!   344: Token tBRGEZ	Count = 3
!!   345: Token tCALL	Count = 1
!!   346: Token tMEMBAR	Count = 38
!!   347: Token tSTBAR	Count = 33
!!   348: Token tCASA_R	Count = 2
!!   349: Token tCASA_I	Count = 11
!!   350: Token tCASXA_R	Count = 6
!!   351: Token tCASXA_I	Count = 9
!!   352: Token tLDSTUBA_I	Count = 6
!!   353: Token tLDSTUB_I	Count = 6
!!   354: Token tLDSTUB_R	Count = 13
!!   355: Token tLDSTUBA_R	Count = 13
!!   356: Token tSWAP_I	Count = 5
!!   357: Token tSWAP_R	Count = 7
!!   358: Token tSWAPA_I	Count = 6
!!   359: Token tSWAPA_R	Count = 10
!!   360: Token tSTF_R	Count = 19
!!   361: Token tSTF_I	Count = 11
!!   362: Token tSTDF_I	Count = 8
!!   363: Token tSTDF_R	Count = 10
!!   364: Token tFADDs	Count = 12
!!   365: Token tFSUBs	Count = 8
!!   366: Token tFMULs	Count = 11
!!   367: Token tFDIVs	Count = 15
!!   368: Token tPREFETCH_I	Count = 24
!!   369: Token tPREFETCH_R	Count = 23
!!   370: Token tPREFETCHA_I	Count = 22
!!   371: Token tPREFETCHA_R	Count = 20
!!   372: Token tFLUSH_I	Count = 42
!!   373: Token tFLUSH_R	Count = 39
!! 
!! 
!! +++ finish +++

