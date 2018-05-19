// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: bug2426.s
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
   random seed:	336853027
   Jal lop.j:	
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
        setx  0x0000000000000bc0, %g1, %r9
        setx  0x80, %g2, %g1
        wr  %g1, %g0, %asi
	rd %fprs, %g0
        wr %g0, 0x4, %fprs
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
        setx  0x8f1849ff9a81817a, %g1, %r0
        setx  0xa7d0448f9ebcdaa4, %g1, %r1
        setx  0x61d4bb993e78147f, %g1, %r2
        setx  0xcffd68f846087396, %g1, %r3
        setx  0xbf7618e6a8a5c09a, %g1, %r4
        setx  0xa4c785e5761c89e0, %g1, %r5
        setx  0xc3e57d1a68527128, %g1, %r6
        setx  0x12dc34bed5ac2e73, %g1, %r7
        setx  0x94f27e334d5ba7e1, %g1, %r10
        setx  0xa98e9c689a201b79, %g1, %r11
        setx  0x3b55a4046833decd, %g1, %r12
        setx  0x35b23d6fc29a7613, %g1, %r13
        setx  0xe619c532b009e423, %g1, %r14
        setx  0x749ec25dd499d58d, %g1, %r15
        setx  0xa9ea93442137d661, %g1, %r16
        setx  0xd86c46ae25ca7f94, %g1, %r17
        setx  0x7c009ee48bf37dbe, %g1, %r18
        setx  0x2dd2db6631a3f4dc, %g1, %r19
        setx  0xf6c1001d51b57bf8, %g1, %r20
        setx  0x3372bde68a78c293, %g1, %r21
        setx  0x2834aedf63264341, %g1, %r22
        setx  0xe15789b77665ce1b, %g1, %r23
        setx  0x1bb8a42bba53a846, %g1, %r24
        setx  0x43f461288b70ce6b, %g1, %r25
        setx  0x8b72eb69c559982e, %g1, %r26
        setx  0xf01bc89d17e33060, %g1, %r27
        setx  0x50e20056dc8bde1c, %g1, %r28
        setx  0x66c480e9500f9012, %g1, %r29
        setx  0x4c4fa439ed77c9cd, %g1, %r30
        setx  0xcb1f4dee252b3ebf, %g1, %r31
	.word 0x0cca0008  ! 5: BRGZ	brgz  ,pt	%8,<label_0xa0008>
	.word 0x04ca0004  ! 6: BRLEZ	brlez  ,pt	%8,<label_0xa0004>
	.word 0xc27a0009  ! 7: SWAP_R	swap	%r1, [%r8 + %r9]
	.word 0x8143e017  ! 8: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside 
	.word 0xc6ca1009  ! 9: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r3
	.word 0xc7f21009  ! 10: CASXA_I	casxa	[%r8] 0x80, %r9, %r3
	.word 0xf68a2ee8  ! 11: LDUBA_I	lduba	[%r8, + 0x0ee8] %asi, %r27
	.word 0x8ef222e0  ! 12: UDIVcc_I	udivcc 	%r8, 0x02e0, %r7
	.word 0x8143c000  ! 13: STBAR	stbar
	.word 0xda821009  ! 14: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r13
	.word 0xdc1a0009  ! 15: LDD_R	ldd	[%r8 + %r9], %r14
	.word 0x8143c000  ! 16: STBAR	stbar
	.word 0x8e6a0009  ! 17: UDIVX_R	udivx 	%r8, %r9, %r7
	.word 0xfefa2120  ! 18: SWAPA_I	swapa	%r31, [%r8 + 0x0120] %asi
	.word 0x8143c000  ! 19: STBAR	stbar
	.word 0xd4b21009  ! 20: STHA_R	stha	%r10, [%r8 + %r9] 0x80
	.word 0x0c800008  ! 21: BNEG	bneg  	<label_0x8>
	.word 0x865222f4  ! 22: UMUL_I	umul 	%r8, 0x02f4, %r3
	.word 0x2aca0008  ! 23: BRNZ	brnz,a,pt	%8,<label_0xa0008>
	.word 0xc3ea2078  ! 24: PREFETCHA_I	prefetcha	[%r8, + 0x0078] %asi, #one_read
	.word 0x8143e023  ! 25: MEMBAR	membar	#LoadLoad | #StoreLoad | #MemIssue 
	.word 0x8143e00d  ! 26: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore 
	.word 0xca8a1009  ! 27: LDUBA_R	lduba	[%r8, %r9] 0x80, %r5
	.word 0x8143c000  ! 28: STBAR	stbar
	.word 0xeada1009  ! 30: LDXA_R	ldxa	[%r8, %r9] 0x80, %r21
	.word 0x8fa20929  ! 31: FMULs	fmuls	%f8, %f9, %f7
	.word 0xcc1a0009  ! 32: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xd4d21009  ! 33: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r10
	.word 0xd4da1009  ! 34: LDXA_R	ldxa	[%r8, %r9] 0x80, %r10
	.word 0xc65a0009  ! 35: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0x3c800004  ! 36: BPOS	bpos,a	<label_0x4>
	.word 0x8143e064  ! 37: MEMBAR	membar	#LoadStore | #MemIssue | #Sync 
	.word 0xce7a2a54  ! 38: SWAP_I	swap	%r7, [%r8 + 0x0a54]
	.word 0x8cf20009  ! 39: UDIVcc_R	udivcc 	%r8, %r9, %r6
	.word 0x8e5a0009  ! 40: SMUL_R	smul 	%r8, %r9, %r7
	.word 0x00800008  ! 41: BN	bn  	<label_0x8>
	.word 0xdc520009  ! 42: LDSH_R	ldsh	[%r8 + %r9], %r14
	.word 0xc36a2280  ! 43: PREFETCH_I	prefetch	[%r8 + 0x0280], #one_read
	.word 0x28800004  ! 45: BLEU	bleu,a	<label_0x4>
	.word 0x8143c000  ! 47: STBAR	stbar
	.word 0x86520009  ! 48: UMUL_R	umul 	%r8, %r9, %r3
	.word 0x8fa208a9  ! 49: FSUBs	fsubs	%f8, %f9, %f7
	.word 0xecfa1009  ! 50: SWAPA_R	swapa	%r22, [%r8 + %r9] 0x80
	.word 0xe8ba2e78  ! 51: STDA_I	stda	%r20, [%r8 + 0x0e78] %asi
	.word 0x8cd22978  ! 52: UMULcc_I	umulcc 	%r8, 0x0978, %r6
	.word 0x82fa240c  ! 53: SDIVcc_I	sdivcc 	%r8, 0x040c, %r1
	.word 0xca8a2124  ! 54: LDUBA_I	lduba	[%r8, + 0x0124] %asi, %r5
	.word 0xb84a0009  ! 55: MULX_R	mulx 	%r8, %r9, %r28
	.word 0xffe21009  ! 56: CASA_I	casa	[%r8] 0x80, %r9, %r31
	.word 0x86da0009  ! 57: SMULcc_R	smulcc 	%r8, %r9, %r3
	.word 0xc4b22214  ! 58: STHA_I	stha	%r2, [%r8 + 0x0214] %asi
	.word 0xc2da2d08  ! 59: LDXA_I	ldxa	[%r8, + 0x0d08] %asi, %r1
	.word 0x8143e031  ! 60: MEMBAR	membar	#LoadLoad | #Lookaside | #MemIssue 
	.word 0x844a2b10  ! 61: MULX_I	mulx 	%r8, 0x0b10, %r2
	.word 0x12800008  ! 62: BNE	bne  	<label_0x8>
	.word 0xc41a0009  ! 63: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xcf3a0009  ! 64: STDF_R	std	%f7, [%r9, %r8]
	.word 0x8fa20829  ! 65: FADDs	fadds	%f8, %f9, %f7
	.word 0xc28a2ab4  ! 66: LDUBA_I	lduba	[%r8, + 0x0ab4] %asi, %r1
	.word 0x8143e072  ! 67: MEMBAR	membar	#StoreLoad | #Lookaside | #MemIssue | #Sync 
	.word 0x8fa209a9  ! 68: FDIVs	fdivs	%f8, %f9, %f7
	.word 0xe89a2d98  ! 69: LDDA_I	ldda	[%r8, + 0x0d98] %asi, %r20
	.word 0x8afa2870  ! 70: SDIVcc_I	sdivcc 	%r8, 0x0870, %r5
	.word 0x89a209a9  ! 71: FDIVs	fdivs	%f8, %f9, %f4
	.word 0xc8120009  ! 72: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xec92294c  ! 73: LDUHA_I	lduha	[%r8, + 0x094c] %asi, %r22
	.word 0xc87a0009  ! 74: SWAP_R	swap	%r4, [%r8 + %r9]
	.word 0x887a2910  ! 75: SDIV_I	sdiv 	%r8, 0x0910, %r4
	.word 0x8a522b40  ! 76: UMUL_I	umul 	%r8, 0x0b40, %r5
	.word 0xb04a0009  ! 77: MULX_R	mulx 	%r8, %r9, %r24
	.word 0x8e7a0009  ! 78: SDIV_R	sdiv 	%r8, %r9, %r7
	.word 0x8143c000  ! 79: STBAR	stbar
	.word 0x16800008  ! 80: BGE	bge  	<label_0x8>
	.word 0xaafa0009  ! 81: SDIVcc_R	sdivcc 	%r8, %r9, %r21
	.word 0xa9a209a9  ! 82: FDIVs	fdivs	%f8, %f9, %f20
	.word 0xc36a290c  ! 83: PREFETCH_I	prefetch	[%r8 + 0x090c], #one_read
	.word 0x26800008  ! 84: BL	bl,a	<label_0x8>
	.word 0xce122e30  ! 85: LDUH_I	lduh	[%r8 + 0x0e30], %r7
	.word 0x8fa208a9  ! 86: FSUBs	fsubs	%f8, %f9, %f7
	.word 0x976a241c  ! 87: SDIVX_I	sdivx	%r8, 0x041c, %r11
	.word 0x86520009  ! 88: UMUL_R	umul 	%r8, %r9, %r3
	.word 0xca6a2db4  ! 89: LDSTUB_I	ldstub	%r5, [%r8 + 0x0db4]
	.word 0xaba20929  ! 90: FMULs	fmuls	%f8, %f9, %f21
	.word 0xc4ba2210  ! 91: STDA_I	stda	%r2, [%r8 + 0x0210] %asi
	.word 0x8143e052  ! 92: MEMBAR	membar	#StoreLoad | #Lookaside | #Sync 
	.word 0xefe22009  ! 93: CASA_R	casa	[%r8] %asi, %r9, %r23
	.word 0x88da2c58  ! 94: SMULcc_I	smulcc 	%r8, 0x0c58, %r4
	.word 0xdcba1009  ! 95: STDA_R	stda	%r14, [%r8 + %r9] 0x80
	.word 0xccd22dfc  ! 96: LDSHA_I	ldsha	[%r8, + 0x0dfc] %asi, %r6
	.word 0xce7a28ec  ! 97: SWAP_I	swap	%r7, [%r8 + 0x08ec]
	.word 0xb8fa2694  ! 98: SDIVcc_I	sdivcc 	%r8, 0x0694, %r28
	.word 0xc3ea2988  ! 99: PREFETCHA_I	prefetcha	[%r8, + 0x0988] %asi, #one_read
	.word 0x87a20929  ! 100: FMULs	fmuls	%f8, %f9, %f3
	.word 0xc8d224d4  ! 101: LDSHA_I	ldsha	[%r8, + 0x04d4] %asi, %r4
	.word 0x8143e015  ! 102: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside 
	.word 0xd8ba27a0  ! 103: STDA_I	stda	%r12, [%r8 + 0x07a0] %asi
	.word 0xce5a0009  ! 104: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xfaca2614  ! 105: LDSBA_I	ldsba	[%r8, + 0x0614] %asi, %r29
	.word 0xc41a0009  ! 106: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xf1222930  ! 107: STF_I	st	%f24, [0x0930, %r8]
	.word 0x896a0009  ! 108: SDIVX_R	sdivx	%r8, %r9, %r4
	.word 0xc4aa1009  ! 111: STBA_R	stba	%r2, [%r8 + %r9] 0x80
	.word 0x83a209a9  ! 112: FDIVs	fdivs	%f8, %f9, %f1
	.word 0x847a239c  ! 113: SDIV_I	sdiv 	%r8, 0x039c, %r2
	.word 0xc8d22a1c  ! 114: LDSHA_I	ldsha	[%r8, + 0x0a1c] %asi, %r4
	.word 0x8cfa0009  ! 115: SDIVcc_R	sdivcc 	%r8, %r9, %r6
	.word 0xc36a21f0  ! 116: PREFETCH_I	prefetch	[%r8 + 0x01f0], #one_read
	.word 0xa8da0009  ! 117: SMULcc_R	smulcc 	%r8, %r9, %r20
	.word 0x8143c000  ! 118: STBAR	stbar
	.word 0xc28a1009  ! 120: LDUBA_R	lduba	[%r8, %r9] 0x80, %r1
	.word 0xdeca205c  ! 121: LDSBA_I	ldsba	[%r8, + 0x005c] %asi, %r15
	.word 0xe64a0009  ! 122: LDSB_R	ldsb	[%r8 + %r9], %r19
	.word 0x8143e01f  ! 123: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #Lookaside 
	.word 0xa9a20829  ! 124: FADDs	fadds	%f8, %f9, %f20
	.word 0x08800004  ! 125: BLEU	bleu  	<label_0x4>
	.word 0x02ca0004  ! 126: BRZ	brz  ,pt	%8,<label_0xa0004>
	.word 0x30800004  ! 127: BA	ba,a	<label_0x4>
	.word 0xc2921009  ! 129: LDUHA_R	lduha	[%r8, %r9] 0x80, %r1
	.word 0x844a0009  ! 130: MULX_R	mulx 	%r8, %r9, %r2
	.word 0x96f22f20  ! 131: UDIVcc_I	udivcc 	%r8, 0x0f20, %r11
	.word 0xc8ea2144  ! 132: LDSTUBA_I	ldstuba	%r4, [%r8 + 0x0144] %asi
	.word 0x827a205c  ! 133: SDIV_I	sdiv 	%r8, 0x005c, %r1
	.word 0xc2ca1009  ! 134: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r1
	.word 0xcaca1009  ! 135: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r5
	.word 0xc3ea2208  ! 136: PREFETCHA_I	prefetcha	[%r8, + 0x0208] %asi, #one_read
	.word 0xc65a0009  ! 137: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xf81a23c0  ! 138: LDD_I	ldd	[%r8 + 0x03c0], %r28
	.word 0xcc822ce8  ! 139: LDUWA_I	lduwa	[%r8, + 0x0ce8] %asi, %r6
	.word 0x8143c000  ! 140: STBAR	stbar
	.word 0xce921009  ! 141: LDUHA_R	lduha	[%r8, %r9] 0x80, %r7
	.word 0x2e800004  ! 142: BVS	bvs,a	<label_0x4>
	.word 0xdefa26b8  ! 143: SWAPA_I	swapa	%r15, [%r8 + 0x06b8] %asi
	.word 0xce821009  ! 145: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r7
	.word 0xca120009  ! 146: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0x8c5a0009  ! 147: SMUL_R	smul 	%r8, %r9, %r6
	.word 0x884a28ec  ! 148: MULX_I	mulx 	%r8, 0x08ec, %r4
	.word 0xaa5a26fc  ! 149: SMUL_I	smul 	%r8, 0x06fc, %r21
	.word 0x8cda2c3c  ! 150: SMULcc_I	smulcc 	%r8, 0x0c3c, %r6
	.word 0xce6a22e0  ! 151: LDSTUB_I	ldstub	%r7, [%r8 + 0x02e0]
	.word 0xc68a1009  ! 152: LDUBA_R	lduba	[%r8, %r9] 0x80, %r3
	.word 0x82d22140  ! 153: UMULcc_I	umulcc 	%r8, 0x0140, %r1
	.word 0x8143e04d  ! 154: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Sync 
	.word 0xbda20929  ! 155: FMULs	fmuls	%f8, %f9, %f30
	.word 0xf4921009  ! 156: LDUHA_R	lduha	[%r8, %r9] 0x80, %r26
	.word 0xe3f21009  ! 157: CASXA_I	casxa	[%r8] 0x80, %r9, %r17
	.word 0xe73a2698  ! 158: STDF_I	std	%f19, [0x0698, %r8]
	.word 0xc5e22009  ! 159: CASA_R	casa	[%r8] %asi, %r9, %r2
	.word 0xc4520009  ! 160: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0x8ba208a9  ! 161: FSUBs	fsubs	%f8, %f9, %f5
	.word 0xe49a23c0  ! 162: LDDA_I	ldda	[%r8, + 0x03c0] %asi, %r18
	.word 0x84d20009  ! 163: UMULcc_R	umulcc 	%r8, %r9, %r2
	.word 0x06800004  ! 164: BL	bl  	<label_0x4>
	.word 0xe2fa21ac  ! 165: SWAPA_I	swapa	%r17, [%r8 + 0x01ac] %asi
	.word 0xfca2277c  ! 166: STWA_I	stwa	%r30, [%r8 + 0x077c] %asi
	.word 0xc6422310  ! 167: LDSW_I	ldsw	[%r8 + 0x0310], %r3
	.word 0x8a722bcc  ! 168: UDIV_I	udiv 	%r8, 0x0bcc, %r5
	.word 0x8143c000  ! 169: STBAR	stbar
	.word 0x8143e064  ! 170: MEMBAR	membar	#LoadStore | #MemIssue | #Sync 
	.word 0xf1f21009  ! 171: CASXA_I	casxa	[%r8] 0x80, %r9, %r24
	.word 0xc64a2ad0  ! 172: LDSB_I	ldsb	[%r8 + 0x0ad0], %r3
	.word 0xe08a1009  ! 173: LDUBA_R	lduba	[%r8, %r9] 0x80, %r16
	.word 0x8143c000  ! 174: STBAR	stbar
	.word 0x85a208a9  ! 175: FSUBs	fsubs	%f8, %f9, %f2
	.word 0xd4fa1009  ! 176: SWAPA_R	swapa	%r10, [%r8 + %r9] 0x80
	.word 0x82fa20e4  ! 177: SDIVcc_I	sdivcc 	%r8, 0x00e4, %r1
	.word 0xcab21009  ! 178: STHA_R	stha	%r5, [%r8 + %r9] 0x80
	.word 0x867221f0  ! 179: UDIV_I	udiv 	%r8, 0x01f0, %r3
	.word 0xf8ba2210  ! 180: STDA_I	stda	%r28, [%r8 + 0x0210] %asi
	.word 0xc4d2256c  ! 181: LDSHA_I	ldsha	[%r8, + 0x056c] %asi, %r2
	.word 0xdc1a0009  ! 182: LDD_R	ldd	[%r8 + %r9], %r14
	.word 0x8fa209a9  ! 183: FDIVs	fdivs	%f8, %f9, %f7
	.word 0xc27a0009  ! 184: SWAP_R	swap	%r1, [%r8 + %r9]
	.word 0x8143e07d  ! 185: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0x8143e077  ! 186: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside | #MemIssue | #Sync 
	.word 0xcaa21009  ! 187: STWA_R	stwa	%r5, [%r8 + %r9] 0x80
	.word 0xb5a20829  ! 188: FADDs	fadds	%f8, %f9, %f26
	.word 0xd60a0009  ! 189: LDUB_R	ldub	[%r8 + %r9], %r11
	.word 0xa4fa2774  ! 190: SDIVcc_I	sdivcc 	%r8, 0x0774, %r18
	.word 0xc3ea22ac  ! 191: PREFETCHA_I	prefetcha	[%r8, + 0x02ac] %asi, #one_read
	.word 0xd53a0009  ! 192: STDF_R	std	%f10, [%r9, %r8]
	.word 0xd4f224e8  ! 194: STXA_I	stxa	%r10, [%r8 + 0x04e8] %asi
	.word 0x83222464  ! 195: MULScc_I	mulscc 	%r8, 0x0464, %r1
	.word 0xdcba2d18  ! 196: STDA_I	stda	%r14, [%r8 + 0x0d18] %asi
	.word 0xf6d21009  ! 197: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r27
	.word 0x14800004  ! 198: BG	bg  	<label_0x4>
	.word 0x8da20829  ! 199: FADDs	fadds	%f8, %f9, %f6
	.word 0x94522240  ! 200: UMUL_I	umul 	%r8, 0x0240, %r10
	.word 0xebe21009  ! 201: CASA_I	casa	[%r8] 0x80, %r9, %r21
	.word 0xe2ea1009  ! 202: LDSTUBA_R	ldstuba	%r17, [%r8 + %r9] 0x80
	.word 0xc6c21009  ! 203: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r3
	.word 0xf2ea1009  ! 204: LDSTUBA_R	ldstuba	%r25, [%r8 + %r9] 0x80
	.word 0x8143e036  ! 205: MEMBAR	membar	#StoreLoad | #LoadStore | #Lookaside | #MemIssue 
	.word 0xeaaa26e0  ! 206: STBA_I	stba	%r21, [%r8 + 0x06e0] %asi
	.word 0x8da208a9  ! 207: FSUBs	fsubs	%f8, %f9, %f6
	.word 0xc4522028  ! 208: LDSH_I	ldsh	[%r8 + 0x0028], %r2
	.word 0xc3ea24b4  ! 209: PREFETCHA_I	prefetcha	[%r8, + 0x04b4] %asi, #one_read
	.word 0xd8b21009  ! 210: STHA_R	stha	%r12, [%r8 + %r9] 0x80
	.word 0xd89a1009  ! 211: LDDA_R	ldda	[%r8, %r9] 0x80, %r12
	.word 0xdcca1009  ! 212: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r14
	.word 0xb5a20929  ! 213: FMULs	fmuls	%f8, %f9, %f26
	.word 0xce7a25e0  ! 214: SWAP_I	swap	%r7, [%r8 + 0x05e0]
	.word 0xacf20009  ! 215: UDIVcc_R	udivcc 	%r8, %r9, %r22
	.word 0x8143e031  ! 216: MEMBAR	membar	#LoadLoad | #Lookaside | #MemIssue 
	.word 0x8da208a9  ! 217: FSUBs	fsubs	%f8, %f9, %f6
	.word 0xee921009  ! 218: LDUHA_R	lduha	[%r8, %r9] 0x80, %r23
	.word 0xf6a21009  ! 219: STWA_R	stwa	%r27, [%r8 + %r9] 0x80
	.word 0xfd3a2870  ! 220: STDF_I	std	%f30, [0x0870, %r8]
	.word 0x9c520009  ! 221: UMUL_R	umul 	%r8, %r9, %r14
	.word 0x8a6a2bd0  ! 222: UDIVX_I	udivx 	%r8, 0x0bd0, %r5
	.word 0xc27a27a0  ! 223: SWAP_I	swap	%r1, [%r8 + 0x07a0]
	.word 0x88522260  ! 224: UMUL_I	umul 	%r8, 0x0260, %r4
	.word 0xeeca2b3c  ! 225: LDSBA_I	ldsba	[%r8, + 0x0b3c] %asi, %r23
	.word 0x8143e072  ! 226: MEMBAR	membar	#StoreLoad | #Lookaside | #MemIssue | #Sync 
	.word 0xc4f21009  ! 227: STXA_R	stxa	%r2, [%r8 + %r9] 0x80
	.word 0xc4420009  ! 228: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0x28800008  ! 229: BLEU	bleu,a	<label_0x8>
	.word 0xc26a26f4  ! 230: LDSTUB_I	ldstub	%r1, [%r8 + 0x06f4]
	.word 0x8143e07d  ! 231: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0x40000008  ! 232: CALL	call	disp30_8
	.word 0xb0da0009  ! 233: SMULcc_R	smulcc 	%r8, %r9, %r24
	.word 0x0a800004  ! 234: BCS	bcs  	<label_0x4>
	.word 0x8143c000  ! 235: STBAR	stbar
	.word 0x8143e069  ! 236: MEMBAR	membar	#LoadLoad | #StoreStore | #MemIssue | #Sync 
	.word 0x887a0009  ! 237: SDIV_R	sdiv 	%r8, %r9, %r4
	.word 0xc8ba29a0  ! 238: STDA_I	stda	%r4, [%r8 + 0x09a0] %asi
	.word 0x8c4a22b0  ! 239: MULX_I	mulx 	%r8, 0x02b0, %r6
	.word 0x8ad22274  ! 240: UMULcc_I	umulcc 	%r8, 0x0274, %r5
	.word 0xc36a2848  ! 241: PREFETCH_I	prefetch	[%r8 + 0x0848], #one_read
	.word 0xc4fa1009  ! 242: SWAPA_R	swapa	%r2, [%r8 + %r9] 0x80
	.word 0x16800008  ! 243: BGE	bge  	<label_0x8>
	.word 0x8143e037  ! 244: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside | #MemIssue 
	.word 0x8143e041  ! 245: MEMBAR	membar	#LoadLoad | #Sync 
	.word 0xcad227c8  ! 246: LDSHA_I	ldsha	[%r8, + 0x07c8] %asi, %r5
	.word 0xa66a0009  ! 247: UDIVX_R	udivx 	%r8, %r9, %r19
	.word 0xceca2b48  ! 248: LDSBA_I	ldsba	[%r8, + 0x0b48] %asi, %r7
	.word 0xc6120009  ! 249: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0x12800004  ! 250: BNE	bne  	<label_0x4>
	.word 0x99a209a9  ! 252: FDIVs	fdivs	%f8, %f9, %f12
	.word 0xa0f20009  ! 253: UDIVcc_R	udivcc 	%r8, %r9, %r16
	.word 0x0cca0004  ! 254: BRGZ	brgz  ,pt	%8,<label_0xa0004>
	.word 0xa67a23b4  ! 255: SDIV_I	sdiv 	%r8, 0x03b4, %r19
	.word 0xd4ba1009  ! 256: STDA_R	stda	%r10, [%r8 + %r9] 0x80
	.word 0xef2220c0  ! 257: STF_I	st	%f23, [0x00c0, %r8]
	.word 0xc36a2c3c  ! 258: PREFETCH_I	prefetch	[%r8 + 0x0c3c], #one_read
	.word 0xc2a21009  ! 259: STWA_R	stwa	%r1, [%r8 + %r9] 0x80
	.word 0xb4522b8c  ! 260: UMUL_I	umul 	%r8, 0x0b8c, %r26
	.word 0x89220009  ! 261: MULScc_R	mulscc 	%r8, %r9, %r4
	.word 0x845a257c  ! 262: SMUL_I	smul 	%r8, 0x057c, %r2
	.word 0x827a0009  ! 263: SDIV_R	sdiv 	%r8, %r9, %r1
	.word 0x865a2f58  ! 264: SMUL_I	smul 	%r8, 0x0f58, %r3
	.word 0x8da20929  ! 265: FMULs	fmuls	%f8, %f9, %f6
	.word 0x36800004  ! 266: BGE	bge,a	<label_0x4>
	.word 0xee5a21e0  ! 267: LDX_I	ldx	[%r8 + 0x01e0], %r23
	.word 0xcf220009  ! 268: STF_R	st	%f7, [%r9, %r8]
	.word 0xe8922578  ! 269: LDUHA_I	lduha	[%r8, + 0x0578] %asi, %r20
	.word 0xf87a0009  ! 270: SWAP_R	swap	%r28, [%r8 + %r9]
	.word 0xc47a2158  ! 271: SWAP_I	swap	%r2, [%r8 + 0x0158]
	.word 0xeb3a0009  ! 272: STDF_R	std	%f21, [%r9, %r8]
	.word 0x1a800004  ! 273: BCC	bcc  	<label_0x4>
	.word 0xb24a2ec0  ! 274: MULX_I	mulx 	%r8, 0x0ec0, %r25
	.word 0x2c800004  ! 275: BNEG	bneg,a	<label_0x4>
	.word 0x9ba20829  ! 276: FADDs	fadds	%f8, %f9, %f13
	.word 0xc68a1009  ! 277: LDUBA_R	lduba	[%r8, %r9] 0x80, %r3
	.word 0x9ba20829  ! 278: FADDs	fadds	%f8, %f9, %f13
	.word 0xbc7224a4  ! 279: UDIV_I	udiv 	%r8, 0x04a4, %r30
	.word 0xc28a1009  ! 280: LDUBA_R	lduba	[%r8, %r9] 0x80, %r1
	.word 0x8143e061  ! 281: MEMBAR	membar	#LoadLoad | #MemIssue | #Sync 
	.word 0x8143c000  ! 282: STBAR	stbar
	.word 0xa8da0009  ! 283: SMULcc_R	smulcc 	%r8, %r9, %r20
	.word 0x87222c6c  ! 284: MULScc_I	mulscc 	%r8, 0x0c6c, %r3
	.word 0xc64a20e8  ! 285: LDSB_I	ldsb	[%r8 + 0x00e8], %r3
	.word 0x3c800004  ! 286: BPOS	bpos,a	<label_0x4>
	.word 0xca02238c  ! 287: LDUW_I	lduw	[%r8 + 0x038c], %r5
	.word 0xc6420009  ! 288: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0x36800004  ! 289: BGE	bge,a	<label_0x4>
	.word 0xcaa22a24  ! 290: STWA_I	stwa	%r5, [%r8 + 0x0a24] %asi
	.word 0x02ca0008  ! 291: BRZ	brz  ,pt	%8,<label_0xa0008>
	.word 0xc28a1009  ! 292: LDUBA_R	lduba	[%r8, %r9] 0x80, %r1
	.word 0x85a209a9  ! 293: FDIVs	fdivs	%f8, %f9, %f2
	.word 0x96720009  ! 294: UDIV_R	udiv 	%r8, %r9, %r11
	.word 0xc2b22188  ! 295: STHA_I	stha	%r1, [%r8 + 0x0188] %asi
	.word 0xc2c22f4c  ! 296: LDSWA_I	ldswa	[%r8, + 0x0f4c] %asi, %r1
	.word 0xc4ba1009  ! 297: STDA_R	stda	%r2, [%r8 + %r9] 0x80
	.word 0x8da20929  ! 298: FMULs	fmuls	%f8, %f9, %f6
	.word 0x8c520009  ! 299: UMUL_R	umul 	%r8, %r9, %r6
	.word 0x8143e04c  ! 300: MEMBAR	membar	#LoadStore | #StoreStore | #Sync 
	.word 0x02800004  ! 301: BE	be  	<label_0x4>
	.word 0x8143c000  ! 302: STBAR	stbar
	.word 0xf53a0009  ! 303: STDF_R	std	%f26, [%r9, %r8]
	.word 0x8143e004  ! 304: MEMBAR	membar	#LoadStore 
	.word 0x8ef20009  ! 305: UDIVcc_R	udivcc 	%r8, %r9, %r7
	.word 0xc8b21009  ! 306: STHA_R	stha	%r4, [%r8 + %r9] 0x80
	.word 0xc25a0009  ! 307: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xc49223e8  ! 308: LDUHA_I	lduha	[%r8, + 0x03e8] %asi, %r2
	.word 0xc3ea2f30  ! 309: PREFETCHA_I	prefetcha	[%r8, + 0x0f30] %asi, #one_read
	.word 0xc6522ac4  ! 310: LDSH_I	ldsh	[%r8 + 0x0ac4], %r3
	.word 0x2ec20004  ! 311: BRGEZ	brgez,a,nt	%8,<label_0x20004>
	.word 0xc8ca1009  ! 312: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r4
	.word 0x89222a1c  ! 313: MULScc_I	mulscc 	%r8, 0x0a1c, %r4
	.word 0xd6f226e8  ! 314: STXA_I	stxa	%r11, [%r8 + 0x06e8] %asi
	.word 0x8a7a0009  ! 315: SDIV_R	sdiv 	%r8, %r9, %r5
	.word 0x8efa2474  ! 317: SDIVcc_I	sdivcc 	%r8, 0x0474, %r7
	.word 0xd53a2470  ! 318: STDF_I	std	%f10, [0x0470, %r8]
	.word 0xc8b22a70  ! 319: STHA_I	stha	%r4, [%r8 + 0x0a70] %asi
	.word 0xf1e21009  ! 320: CASA_I	casa	[%r8] 0x80, %r9, %r24
	.word 0x16800004  ! 321: BGE	bge  	<label_0x4>
	.word 0x2cc20004  ! 322: BRGZ	brgz,a,nt	%8,<label_0x20004>
	.word 0xa2d22bbc  ! 323: UMULcc_I	umulcc 	%r8, 0x0bbc, %r17
	.word 0xce821009  ! 324: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r7
	.word 0x82520009  ! 325: UMUL_R	umul 	%r8, %r9, %r1
	.word 0xc8a21009  ! 326: STWA_R	stwa	%r4, [%r8 + %r9] 0x80
	.word 0x2a800004  ! 327: BCS	bcs,a	<label_0x4>
	.word 0xd7e21009  ! 328: CASA_I	casa	[%r8] 0x80, %r9, %r11
	.word 0x8143e020  ! 329: MEMBAR	membar	#MemIssue 
	.word 0xf89a2518  ! 330: LDDA_I	ldda	[%r8, + 0x0518] %asi, %r28
	.word 0x1c800004  ! 331: BPOS	bpos  	<label_0x4>
	.word 0xe6422974  ! 332: LDSW_I	ldsw	[%r8 + 0x0974], %r19
	.word 0xdc1a0009  ! 333: LDD_R	ldd	[%r8 + %r9], %r14
	.word 0xe3f22009  ! 334: CASXA_R	casxa	[%r8]%asi, %r9, %r17
	.word 0xc3ea24a8  ! 335: PREFETCHA_I	prefetcha	[%r8, + 0x04a8] %asi, #one_read
	.word 0x886a0009  ! 336: UDIVX_R	udivx 	%r8, %r9, %r4
	.word 0xfc422ab8  ! 337: LDSW_I	ldsw	[%r8 + 0x0ab8], %r30
	.word 0x8143c000  ! 338: STBAR	stbar
	.word 0xba6a2b74  ! 340: UDIVX_I	udivx 	%r8, 0x0b74, %r29
	.word 0x8143e010  ! 342: MEMBAR	membar	#Lookaside 
	.word 0x8143c000  ! 343: STBAR	stbar
	.word 0xc45a2048  ! 345: LDX_I	ldx	[%r8 + 0x0048], %r2
	.word 0xcfe21009  ! 346: CASA_I	casa	[%r8] 0x80, %r9, %r7
	.word 0x36800004  ! 348: BGE	bge,a	<label_0x4>
	.word 0x82722564  ! 349: UDIV_I	udiv 	%r8, 0x0564, %r1
	.word 0xb25a26c0  ! 350: SMUL_I	smul 	%r8, 0x06c0, %r25
	.word 0xd49a1009  ! 351: LDDA_R	ldda	[%r8, %r9] 0x80, %r10
	.word 0xc7e22009  ! 352: CASA_R	casa	[%r8] %asi, %r9, %r3
	.word 0xc64a25a0  ! 353: LDSB_I	ldsb	[%r8 + 0x05a0], %r3
	.word 0xc49a1009  ! 354: LDDA_R	ldda	[%r8, %r9] 0x80, %r2
	.word 0xdc0a2bb0  ! 355: LDUB_I	ldub	[%r8 + 0x0bb0], %r14
	.word 0xcde22009  ! 356: CASA_R	casa	[%r8] %asi, %r9, %r6
	.word 0xb26a0009  ! 357: UDIVX_R	udivx 	%r8, %r9, %r25
	.word 0xcc020009  ! 358: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0x8a7a26dc  ! 359: SDIV_I	sdiv 	%r8, 0x06dc, %r5
	.word 0x3a800004  ! 360: BCC	bcc,a	<label_0x4>
	.word 0xf1f22009  ! 361: CASXA_R	casxa	[%r8]%asi, %r9, %r24
	.word 0x8143c000  ! 362: STBAR	stbar
	.word 0xc36a21f4  ! 363: PREFETCH_I	prefetch	[%r8 + 0x01f4], #one_read
	.word 0x8efa0009  ! 364: SDIVcc_R	sdivcc 	%r8, %r9, %r7
	.word 0xfcda1009  ! 365: LDXA_R	ldxa	[%r8, %r9] 0x80, %r30
	.word 0xcc4a2160  ! 366: LDSB_I	ldsb	[%r8 + 0x0160], %r6
	.word 0xc41a2b90  ! 367: LDD_I	ldd	[%r8 + 0x0b90], %r2
	.word 0xc8921009  ! 368: LDUHA_R	lduha	[%r8, %r9] 0x80, %r4
	.word 0x865a2508  ! 370: SMUL_I	smul 	%r8, 0x0508, %r3
	.word 0xb07a2174  ! 371: SDIV_I	sdiv 	%r8, 0x0174, %r24
	.word 0x30800008  ! 372: BA	ba,a	<label_0x8>
	.word 0xc7220009  ! 373: STF_R	st	%f3, [%r9, %r8]
	.word 0xc40a2128  ! 375: LDUB_I	ldub	[%r8 + 0x0128], %r2
	.word 0xca520009  ! 376: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xc8f21009  ! 377: STXA_R	stxa	%r4, [%r8 + %r9] 0x80
	.word 0x1c800004  ! 378: BPOS	bpos  	<label_0x4>
	.word 0xc4a229cc  ! 379: STWA_I	stwa	%r2, [%r8 + 0x09cc] %asi
	.word 0x8fa209a9  ! 380: FDIVs	fdivs	%f8, %f9, %f7
	.word 0xf6f225e0  ! 381: STXA_I	stxa	%r27, [%r8 + 0x05e0] %asi
	.word 0x8143c000  ! 382: STBAR	stbar
	.word 0xce5a2540  ! 383: LDX_I	ldx	[%r8 + 0x0540], %r7
	.word 0xccb21009  ! 384: STHA_R	stha	%r6, [%r8 + %r9] 0x80
	.word 0xce4a25b8  ! 385: LDSB_I	ldsb	[%r8 + 0x05b8], %r7
	.word 0xc6da1009  ! 386: LDXA_R	ldxa	[%r8, %r9] 0x80, %r3
	.word 0xc80a0009  ! 387: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xc2a21009  ! 388: STWA_R	stwa	%r1, [%r8 + %r9] 0x80
	.word 0xc6da1009  ! 389: LDXA_R	ldxa	[%r8, %r9] 0x80, %r3
	.word 0x8a520009  ! 390: UMUL_R	umul 	%r8, %r9, %r5
	.word 0xe01a0009  ! 391: LDD_R	ldd	[%r8 + %r9], %r16
	.word 0x1e800008  ! 392: BVC	bvc  	<label_0x8>
	.word 0xc8ca1009  ! 393: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r4
	.word 0xda7a2c84  ! 394: SWAP_I	swap	%r13, [%r8 + 0x0c84]
	.word 0x8a7a21d8  ! 395: SDIV_I	sdiv 	%r8, 0x01d8, %r5
	.word 0x8143c000  ! 396: STBAR	stbar
	.word 0xc3220009  ! 397: STF_R	st	%f1, [%r9, %r8]
	.word 0x8143e047  ! 398: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Sync 
	.word 0xca022f40  ! 399: LDUW_I	lduw	[%r8 + 0x0f40], %r5
	.word 0xc27a0009  ! 400: SWAP_R	swap	%r1, [%r8 + %r9]
	.word 0xe09a2fe8  ! 401: LDDA_I	ldda	[%r8, + 0x0fe8] %asi, %r16
	.word 0xf1f21009  ! 402: CASXA_I	casxa	[%r8] 0x80, %r9, %r24
	.word 0xc6c21009  ! 403: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r3
	.word 0xceca2a64  ! 404: LDSBA_I	ldsba	[%r8, + 0x0a64] %asi, %r7
	.word 0x8afa0009  ! 405: SDIVcc_R	sdivcc 	%r8, %r9, %r5
	.word 0x2eca0004  ! 406: BRGEZ	brgez,a,pt	%8,<label_0xa0004>
	.word 0x06800004  ! 407: BL	bl  	<label_0x4>
	.word 0x2e800004  ! 408: BVS	bvs,a	<label_0x4>
	.word 0x87a20829  ! 409: FADDs	fadds	%f8, %f9, %f3
	.word 0x36800008  ! 410: BGE	bge,a	<label_0x8>
	.word 0x864a0009  ! 411: MULX_R	mulx 	%r8, %r9, %r3
	.word 0x866a29fc  ! 412: UDIVX_I	udivx 	%r8, 0x09fc, %r3
	.word 0x14800004  ! 413: BG	bg  	<label_0x4>
	.word 0x8143c000  ! 414: STBAR	stbar
	.word 0x8143e067  ! 415: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #MemIssue | #Sync 
	.word 0x04800004  ! 416: BLE	ble  	<label_0x4>
	.word 0x96da0009  ! 417: SMULcc_R	smulcc 	%r8, %r9, %r11
	.word 0xc40a2af4  ! 418: LDUB_I	ldub	[%r8 + 0x0af4], %r2
	.word 0x8143e078  ! 419: MEMBAR	membar	#StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xa87a0009  ! 420: SDIV_R	sdiv 	%r8, %r9, %r20
	.word 0x8143c000  ! 421: STBAR	stbar
	.word 0xcdf21009  ! 422: CASXA_I	casxa	[%r8] 0x80, %r9, %r6
	.word 0xc88a1009  ! 423: LDUBA_R	lduba	[%r8, %r9] 0x80, %r4
	.word 0xc6b21009  ! 424: STHA_R	stha	%r3, [%r8 + %r9] 0x80
	.word 0xe66a0009  ! 425: LDSTUB_R	ldstub	%r19, [%r8 + %r9]
	.word 0x2c800004  ! 426: BNEG	bneg,a	<label_0x4>
	.word 0x84520009  ! 427: UMUL_R	umul 	%r8, %r9, %r2
	.word 0xc3ea2238  ! 428: PREFETCHA_I	prefetcha	[%r8, + 0x0238] %asi, #one_read
	.word 0x0ac20004  ! 429: BRNZ	brnz  ,nt	%8,<label_0x20004>
	.word 0x3a800008  ! 430: BCC	bcc,a	<label_0x8>
	.word 0x0cca0004  ! 432: BRGZ	brgz  ,pt	%8,<label_0xa0004>
	.word 0x8143c000  ! 433: STBAR	stbar
	.word 0xb32226b8  ! 434: MULScc_I	mulscc 	%r8, 0x06b8, %r25
	.word 0xcd220009  ! 435: STF_R	st	%f6, [%r9, %r8]
	.word 0x8143e00a  ! 436: MEMBAR	membar	#StoreLoad | #StoreStore 
	.word 0x88f22860  ! 437: UDIVcc_I	udivcc 	%r8, 0x0860, %r4
	.word 0x95a20929  ! 438: FMULs	fmuls	%f8, %f9, %f10
	.word 0xb4d20009  ! 439: UMULcc_R	umulcc 	%r8, %r9, %r26
	.word 0xc84a2e00  ! 440: LDSB_I	ldsb	[%r8 + 0x0e00], %r4
	.word 0xf8ba1009  ! 441: STDA_R	stda	%r28, [%r8 + %r9] 0x80
	.word 0xe4c21009  ! 442: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r18
	.word 0x8143e04b  ! 443: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Sync 
	.word 0xccea1009  ! 444: LDSTUBA_R	ldstuba	%r6, [%r8 + %r9] 0x80
	.word 0x98fa29bc  ! 445: SDIVcc_I	sdivcc 	%r8, 0x09bc, %r12
	.word 0xf68a29e8  ! 446: LDUBA_I	lduba	[%r8, + 0x09e8] %asi, %r27
	.word 0xc4821009  ! 447: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r2
	.word 0x3a800004  ! 448: BCC	bcc,a	<label_0x4>
	.word 0x2e800004  ! 449: BVS	bvs,a	<label_0x4>
	.word 0xc4ca22dc  ! 450: LDSBA_I	ldsba	[%r8, + 0x02dc] %asi, %r2
	.word 0xed3a0009  ! 451: STDF_R	std	%f22, [%r9, %r8]
	.word 0x8143e032  ! 452: MEMBAR	membar	#StoreLoad | #Lookaside | #MemIssue 
	.word 0xaa5a0009  ! 453: SMUL_R	smul 	%r8, %r9, %r21
	.word 0xc53a0009  ! 454: STDF_R	std	%f2, [%r9, %r8]
	.word 0x8143c000  ! 455: STBAR	stbar
	.word 0x8143c000  ! 456: STBAR	stbar
	.word 0x8143c000  ! 457: STBAR	stbar
	.word 0xb4520009  ! 458: UMUL_R	umul 	%r8, %r9, %r26
	.word 0x8143e03f  ! 459: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0xc3ea2308  ! 460: PREFETCHA_I	prefetcha	[%r8, + 0x0308] %asi, #one_read
	.word 0x10800004  ! 461: BA	ba  	<label_0x4>
	.word 0x08800004  ! 462: BLEU	bleu  	<label_0x4>
	.word 0xc4020009  ! 463: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xa65a0009  ! 464: SMUL_R	smul 	%r8, %r9, %r19
	.word 0xc8da1009  ! 465: LDXA_R	ldxa	[%r8, %r9] 0x80, %r4
	.word 0xceaa1009  ! 467: STBA_R	stba	%r7, [%r8 + %r9] 0x80
	.word 0x82fa0009  ! 468: SDIVcc_R	sdivcc 	%r8, %r9, %r1
	.word 0xc4f21009  ! 469: STXA_R	stxa	%r2, [%r8 + %r9] 0x80
	.word 0xccba1009  ! 472: STDA_R	stda	%r6, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 473: STBAR	stbar
	.word 0x8143c000  ! 474: STBAR	stbar
	.word 0xc4da26d8  ! 475: LDXA_I	ldxa	[%r8, + 0x06d8] %asi, %r2
	.word 0xc3220009  ! 476: STF_R	st	%f1, [%r9, %r8]
	.word 0xa96a0009  ! 477: SDIVX_R	sdivx	%r8, %r9, %r20
	.word 0xb05224bc  ! 478: UMUL_I	umul 	%r8, 0x04bc, %r24
	.word 0xc3f21009  ! 479: CASXA_I	casxa	[%r8] 0x80, %r9, %r1
	.word 0xccf21009  ! 480: STXA_R	stxa	%r6, [%r8 + %r9] 0x80
	.word 0xa7a20829  ! 481: FADDs	fadds	%f8, %f9, %f19
	.word 0xd41a28e8  ! 482: LDD_I	ldd	[%r8 + 0x08e8], %r10
	.word 0x85222938  ! 483: MULScc_I	mulscc 	%r8, 0x0938, %r2
	.word 0xc842251c  ! 484: LDSW_I	ldsw	[%r8 + 0x051c], %r4
	.word 0xe0ba2058  ! 485: STDA_I	stda	%r16, [%r8 + 0x0058] %asi
	.word 0xfe8a1009  ! 486: LDUBA_R	lduba	[%r8, %r9] 0x80, %r31
	.word 0x88da0009  ! 487: SMULcc_R	smulcc 	%r8, %r9, %r4
	.word 0xc4aa2110  ! 488: STBA_I	stba	%r2, [%r8 + 0x0110] %asi
	.word 0x8143c000  ! 489: STBAR	stbar
	.word 0x8143e03f  ! 490: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0xce120009  ! 491: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xc6fa2c70  ! 492: SWAPA_I	swapa	%r3, [%r8 + 0x0c70] %asi
	.word 0x89a209a9  ! 493: FDIVs	fdivs	%f8, %f9, %f4
	.word 0xda6a204c  ! 494: LDSTUB_I	ldstub	%r13, [%r8 + 0x004c]
	.word 0xf8d21009  ! 495: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r28
	.word 0x86520009  ! 496: UMUL_R	umul 	%r8, %r9, %r3
	.word 0xc3ea22bc  ! 497: PREFETCHA_I	prefetcha	[%r8, + 0x02bc] %asi, #one_read
	.word 0x32800008  ! 498: BNE	bne,a	<label_0x8>
	.word 0xca7a2f30  ! 499: SWAP_I	swap	%r5, [%r8 + 0x0f30]
	.word 0x84d20009  ! 500: UMULcc_R	umulcc 	%r8, %r9, %r2
	.word 0x8143e079  ! 501: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xd4da1009  ! 502: LDXA_R	ldxa	[%r8, %r9] 0x80, %r10
	.word 0x8c4a2b1c  ! 503: MULX_I	mulx 	%r8, 0x0b1c, %r6
	.word 0x8143c000  ! 504: STBAR	stbar
	.word 0x87a20829  ! 505: FADDs	fadds	%f8, %f9, %f3
	.word 0x8e4a2db4  ! 506: MULX_I	mulx 	%r8, 0x0db4, %r7
	.word 0xc5220009  ! 507: STF_R	st	%f2, [%r9, %r8]
	.word 0xce7a2da8  ! 508: SWAP_I	swap	%r7, [%r8 + 0x0da8]
	.word 0xc3222870  ! 509: STF_I	st	%f1, [0x0870, %r8]
	.word 0x8143e05d  ! 510: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0x85a208a9  ! 511: FSUBs	fsubs	%f8, %f9, %f2
	.word 0xc3ea2514  ! 512: PREFETCHA_I	prefetcha	[%r8, + 0x0514] %asi, #one_read
	.word 0x826a29f0  ! 513: UDIVX_I	udivx 	%r8, 0x09f0, %r1
	.word 0xc6921009  ! 514: LDUHA_R	lduha	[%r8, %r9] 0x80, %r3
	.word 0xe0821009  ! 515: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r16
	.word 0xc88a24f8  ! 516: LDUBA_I	lduba	[%r8, + 0x04f8] %asi, %r4
	.word 0x8143c000  ! 517: STBAR	stbar
	.word 0x9ad20009  ! 518: UMULcc_R	umulcc 	%r8, %r9, %r13
	.word 0xccba1009  ! 519: STDA_R	stda	%r6, [%r8 + %r9] 0x80
	.word 0xc6ea1009  ! 520: LDSTUBA_R	ldstuba	%r3, [%r8 + %r9] 0x80
	.word 0xc6d22020  ! 521: LDSHA_I	ldsha	[%r8, + 0x0020] %asi, %r3
	.word 0xc4b21009  ! 522: STHA_R	stha	%r2, [%r8 + %r9] 0x80
	.word 0xc4922bc0  ! 523: LDUHA_I	lduha	[%r8, + 0x0bc0] %asi, %r2
	.word 0xd8ea1009  ! 524: LDSTUBA_R	ldstuba	%r12, [%r8 + %r9] 0x80
	.word 0xc3ea2380  ! 525: PREFETCHA_I	prefetcha	[%r8, + 0x0380] %asi, #one_read
	.word 0x8143e00e  ! 527: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore 
	.word 0x845a0009  ! 528: SMUL_R	smul 	%r8, %r9, %r2
	.word 0x8a5a0009  ! 529: SMUL_R	smul 	%r8, %r9, %r5
	.word 0x887a0009  ! 530: SDIV_R	sdiv 	%r8, %r9, %r4
	.word 0x8143e00e  ! 531: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore 
	.word 0xc4922558  ! 532: LDUHA_I	lduha	[%r8, + 0x0558] %asi, %r2
	.word 0x9cfa0009  ! 533: SDIVcc_R	sdivcc 	%r8, %r9, %r14
	.word 0xc8ea1009  ! 535: LDSTUBA_R	ldstuba	%r4, [%r8 + %r9] 0x80
	.word 0xcf220009  ! 536: STF_R	st	%f7, [%r9, %r8]
	.word 0xcafa29fc  ! 537: SWAPA_I	swapa	%r5, [%r8 + 0x09fc] %asi
	.word 0x06800004  ! 538: BL	bl  	<label_0x4>
	.word 0xc3220009  ! 539: STF_R	st	%f1, [%r9, %r8]
	.word 0xdac22cd0  ! 540: LDSWA_I	ldswa	[%r8, + 0x0cd0] %asi, %r13
	.word 0xfcf21009  ! 541: STXA_R	stxa	%r30, [%r8 + %r9] 0x80
	.word 0xcbf22009  ! 542: CASXA_R	casxa	[%r8]%asi, %r9, %r5
	.word 0xc3ea2720  ! 543: PREFETCHA_I	prefetcha	[%r8, + 0x0720] %asi, #one_read
	.word 0x8143c000  ! 544: STBAR	stbar
	.word 0xc4ca2348  ! 546: LDSBA_I	ldsba	[%r8, + 0x0348] %asi, %r2
	.word 0xb0522124  ! 547: UMUL_I	umul 	%r8, 0x0124, %r24
	.word 0xc33a0009  ! 548: STDF_R	std	%f1, [%r9, %r8]
	.word 0xe6420009  ! 549: LDSW_R	ldsw	[%r8 + %r9], %r19
	.word 0x8143e02a  ! 550: MEMBAR	membar	#StoreLoad | #StoreStore | #MemIssue 
	.word 0xf8921009  ! 551: LDUHA_R	lduha	[%r8, %r9] 0x80, %r28
	.word 0x8fa208a9  ! 552: FSUBs	fsubs	%f8, %f9, %f7
	.word 0xc4ea1009  ! 553: LDSTUBA_R	ldstuba	%r2, [%r8 + %r9] 0x80
	.word 0xa1a208a9  ! 554: FSUBs	fsubs	%f8, %f9, %f16
	.word 0xe4ba2f40  ! 555: STDA_I	stda	%r18, [%r8 + 0x0f40] %asi
	.word 0xc73a0009  ! 556: STDF_R	std	%f3, [%r9, %r8]
	.word 0x8143c000  ! 557: STBAR	stbar
	.word 0x8143e048  ! 558: MEMBAR	membar	#StoreStore | #Sync 
	.word 0xfab22664  ! 559: STHA_I	stha	%r29, [%r8 + 0x0664] %asi
	.word 0x0eca0004  ! 560: BRGEZ	brgez  ,pt	%8,<label_0xa0004>
	.word 0xe4ba1009  ! 561: STDA_R	stda	%r18, [%r8 + %r9] 0x80
	.word 0xc36a2a64  ! 562: PREFETCH_I	prefetch	[%r8 + 0x0a64], #one_read
	.word 0xa2f20009  ! 563: UDIVcc_R	udivcc 	%r8, %r9, %r17
	.word 0x8b222a68  ! 564: MULScc_I	mulscc 	%r8, 0x0a68, %r5
	.word 0xcca21009  ! 565: STWA_R	stwa	%r6, [%r8 + %r9] 0x80
	.word 0x22ca0004  ! 566: BRZ	brz,a,pt	%8,<label_0xa0004>
	.word 0xcfe21009  ! 567: CASA_I	casa	[%r8] 0x80, %r9, %r7
	.word 0x8143c000  ! 568: STBAR	stbar
	.word 0x2a800004  ! 569: BCS	bcs,a	<label_0x4>
	.word 0xfada1009  ! 570: LDXA_R	ldxa	[%r8, %r9] 0x80, %r29
	.word 0x82fa0009  ! 571: SDIVcc_R	sdivcc 	%r8, %r9, %r1
	.word 0x8143c000  ! 572: STBAR	stbar
	.word 0xc86a28f4  ! 573: LDSTUB_I	ldstub	%r4, [%r8 + 0x08f4]
	.word 0x82522284  ! 574: UMUL_I	umul 	%r8, 0x0284, %r1
	.word 0xcab21009  ! 575: STHA_R	stha	%r5, [%r8 + %r9] 0x80
	.word 0xd88a2af4  ! 576: LDUBA_I	lduba	[%r8, + 0x0af4] %asi, %r12
	.word 0xce520009  ! 577: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xce6a2d10  ! 578: LDSTUB_I	ldstub	%r7, [%r8 + 0x0d10]
	.word 0x24800008  ! 579: BLE	ble,a	<label_0x8>
	.word 0x8c520009  ! 580: UMUL_R	umul 	%r8, %r9, %r6
	.word 0xee020009  ! 581: LDUW_R	lduw	[%r8 + %r9], %r23
	.word 0x06ca0004  ! 582: BRLZ	brlz  ,pt	%8,<label_0xa0004>
	.word 0xc3ea2de0  ! 583: PREFETCHA_I	prefetcha	[%r8, + 0x0de0] %asi, #one_read
	.word 0xcd3a0009  ! 584: STDF_R	std	%f6, [%r9, %r8]
	.word 0x14800008  ! 585: BG	bg  	<label_0x8>
	.word 0x8143c000  ! 586: STBAR	stbar
	.word 0xb0d22b60  ! 587: UMULcc_I	umulcc 	%r8, 0x0b60, %r24
	.word 0xcfe22009  ! 588: CASA_R	casa	[%r8] %asi, %r9, %r7
	.word 0xcc420009  ! 590: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xceb21009  ! 591: STHA_R	stha	%r7, [%r8 + %r9] 0x80
	.word 0xdcaa204c  ! 593: STBA_I	stba	%r14, [%r8 + 0x004c] %asi
	.word 0xf25a2840  ! 594: LDX_I	ldx	[%r8 + 0x0840], %r25
	.word 0xccda1009  ! 595: LDXA_R	ldxa	[%r8, %r9] 0x80, %r6
	.word 0xf5220009  ! 596: STF_R	st	%f26, [%r9, %r8]
	.word 0xc53a21d0  ! 597: STDF_I	std	%f2, [0x01d0, %r8]
	.word 0xc3ea25f4  ! 598: PREFETCHA_I	prefetcha	[%r8, + 0x05f4] %asi, #one_read
	.word 0xf7220009  ! 599: STF_R	st	%f27, [%r9, %r8]
	.word 0xd45a2ac8  ! 600: LDX_I	ldx	[%r8 + 0x0ac8], %r10
	.word 0xc9e22009  ! 601: CASA_R	casa	[%r8] %asi, %r9, %r4
	.word 0x824a0009  ! 602: MULX_R	mulx 	%r8, %r9, %r1
	.word 0xd89a1009  ! 603: LDDA_R	ldda	[%r8, %r9] 0x80, %r12
	.word 0x34800004  ! 604: BG	bg,a	<label_0x4>
	.word 0xa25a0009  ! 605: SMUL_R	smul 	%r8, %r9, %r17
	.word 0xac5a2d34  ! 606: SMUL_I	smul 	%r8, 0x0d34, %r22
	.word 0xcf3a0009  ! 607: STDF_R	std	%f7, [%r9, %r8]
	.word 0x8143c000  ! 608: STBAR	stbar
	.word 0x8e722fc8  ! 609: UDIV_I	udiv 	%r8, 0x0fc8, %r7
	.word 0x8e4a2b44  ! 610: MULX_I	mulx 	%r8, 0x0b44, %r7
	.word 0x85a208a9  ! 611: FSUBs	fsubs	%f8, %f9, %f2
	.word 0xa7a209a9  ! 612: FDIVs	fdivs	%f8, %f9, %f19
	.word 0xc3ea2270  ! 613: PREFETCHA_I	prefetcha	[%r8, + 0x0270] %asi, #one_read
	.word 0xa6720009  ! 614: UDIV_R	udiv 	%r8, %r9, %r19
	.word 0x82520009  ! 615: UMUL_R	umul 	%r8, %r9, %r1
	.word 0xd4f21009  ! 616: STXA_R	stxa	%r10, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 617: STBAR	stbar
	.word 0x8143c000  ! 618: STBAR	stbar
	.word 0x26c20004  ! 619: BRLZ	brlz,a,nt	%8,<label_0x20004>
	.word 0xcac21009  ! 620: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r5
	.word 0xc8da2258  ! 621: LDXA_I	ldxa	[%r8, + 0x0258] %asi, %r4
	.word 0x82f20009  ! 622: UDIVcc_R	udivcc 	%r8, %r9, %r1
	.word 0xc5220009  ! 623: STF_R	st	%f2, [%r9, %r8]
	.word 0x8e7a0009  ! 624: SDIV_R	sdiv 	%r8, %r9, %r7
	.word 0x8143e054  ! 625: MEMBAR	membar	#LoadStore | #Lookaside | #Sync 
	.word 0xc3ea2fc8  ! 626: PREFETCHA_I	prefetcha	[%r8, + 0x0fc8] %asi, #one_read
	.word 0xc4020009  ! 627: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0x8143c000  ! 628: STBAR	stbar
	.word 0xc2020009  ! 629: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0x3e800004  ! 630: BVC	bvc,a	<label_0x4>
	.word 0x8143e025  ! 631: MEMBAR	membar	#LoadLoad | #LoadStore | #MemIssue 
	.word 0x8143c000  ! 632: STBAR	stbar
	.word 0x82da29b8  ! 633: SMULcc_I	smulcc 	%r8, 0x09b8, %r1
	.word 0x8da20829  ! 634: FADDs	fadds	%f8, %f9, %f6
	.word 0x88da2f84  ! 635: SMULcc_I	smulcc 	%r8, 0x0f84, %r4
	.word 0x10800008  ! 636: BA	ba  	<label_0x8>
	.word 0xf8122c8c  ! 637: LDUH_I	lduh	[%r8 + 0x0c8c], %r28
	.word 0xcc520009  ! 638: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0x3a800008  ! 639: BCC	bcc,a	<label_0x8>
	.word 0x887a0009  ! 640: SDIV_R	sdiv 	%r8, %r9, %r4
	.word 0xc3ea2f1c  ! 641: PREFETCHA_I	prefetcha	[%r8, + 0x0f1c] %asi, #one_read
	.word 0xc4821009  ! 642: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r2
	.word 0x82d22b10  ! 644: UMULcc_I	umulcc 	%r8, 0x0b10, %r1
	.word 0xa2522f04  ! 645: UMUL_I	umul 	%r8, 0x0f04, %r17
	.word 0x86fa0009  ! 646: SDIVcc_R	sdivcc 	%r8, %r9, %r3
	.word 0xc6a22e88  ! 647: STWA_I	stwa	%r3, [%r8 + 0x0e88] %asi
	.word 0xe0ba2528  ! 648: STDA_I	stda	%r16, [%r8 + 0x0528] %asi
	.word 0xc7222714  ! 649: STF_I	st	%f3, [0x0714, %r8]
	.word 0xe0ba1009  ! 650: STDA_R	stda	%r16, [%r8 + %r9] 0x80
	.word 0xfa6a2588  ! 651: LDSTUB_I	ldstub	%r29, [%r8 + 0x0588]
	.word 0x8143c000  ! 652: STBAR	stbar
	.word 0xdc9a1009  ! 655: LDDA_R	ldda	[%r8, %r9] 0x80, %r14
	.word 0xf4ba1009  ! 656: STDA_R	stda	%r26, [%r8 + %r9] 0x80
	.word 0xc4c22988  ! 657: LDSWA_I	ldswa	[%r8, + 0x0988] %asi, %r2
	.word 0xf5e22009  ! 658: CASA_R	casa	[%r8] %asi, %r9, %r26
	.word 0xc36a2ef0  ! 659: PREFETCH_I	prefetch	[%r8 + 0x0ef0], #one_read
	.word 0x8c6a0009  ! 660: UDIVX_R	udivx 	%r8, %r9, %r6
	.word 0xe6c224a0  ! 661: LDSWA_I	ldswa	[%r8, + 0x04a0] %asi, %r19
	.word 0x24800008  ! 662: BLE	ble,a	<label_0x8>
	.word 0x8143e071  ! 663: MEMBAR	membar	#LoadLoad | #Lookaside | #MemIssue | #Sync 
	.word 0xa24a0009  ! 664: MULX_R	mulx 	%r8, %r9, %r17
	.word 0xc8821009  ! 665: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r4
	.word 0x0e800004  ! 666: BVS	bvs  	<label_0x4>
	.word 0xcb3a2800  ! 667: STDF_I	std	%f5, [0x0800, %r8]
	.word 0xf85a2768  ! 670: LDX_I	ldx	[%r8 + 0x0768], %r28
	.word 0x8d220009  ! 671: MULScc_R	mulscc 	%r8, %r9, %r6
	.word 0x8a6a25c8  ! 672: UDIVX_I	udivx 	%r8, 0x05c8, %r5
	.word 0x8143c000  ! 673: STBAR	stbar
	.word 0xca8a2868  ! 674: LDUBA_I	lduba	[%r8, + 0x0868] %asi, %r5
	.word 0xb6fa0009  ! 675: SDIVcc_R	sdivcc 	%r8, %r9, %r27
	.word 0x2a800004  ! 676: BCS	bcs,a	<label_0x4>
	.word 0xfea21009  ! 677: STWA_R	stwa	%r31, [%r8 + %r9] 0x80
	.word 0xc36a23dc  ! 678: PREFETCH_I	prefetch	[%r8 + 0x03dc], #one_read
	.word 0xf80a25a4  ! 679: LDUB_I	ldub	[%r8 + 0x05a4], %r28
	.word 0x10800004  ! 680: BA	ba  	<label_0x4>
	.word 0x8143c000  ! 681: STBAR	stbar
	.word 0x88522750  ! 682: UMUL_I	umul 	%r8, 0x0750, %r4
	.word 0xc67a25a8  ! 683: SWAP_I	swap	%r3, [%r8 + 0x05a8]
	.word 0x866a0009  ! 684: UDIVX_R	udivx 	%r8, %r9, %r3
	.word 0xc88a258c  ! 685: LDUBA_I	lduba	[%r8, + 0x058c] %asi, %r4
	.word 0xd4ba1009  ! 686: STDA_R	stda	%r10, [%r8 + %r9] 0x80
	.word 0xca5a20b0  ! 687: LDX_I	ldx	[%r8 + 0x00b0], %r5
	.word 0x8c4a0009  ! 688: MULX_R	mulx 	%r8, %r9, %r6
	.word 0xc6aa2f64  ! 689: STBA_I	stba	%r3, [%r8 + 0x0f64] %asi
	.word 0xf6822e80  ! 690: LDUWA_I	lduwa	[%r8, + 0x0e80] %asi, %r27
	.word 0x82d22c1c  ! 691: UMULcc_I	umulcc 	%r8, 0x0c1c, %r1
	.word 0x84522844  ! 692: UMUL_I	umul 	%r8, 0x0844, %r2
	.word 0x8ba208a9  ! 693: FSUBs	fsubs	%f8, %f9, %f5
	.word 0xceca1009  ! 694: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r7
	.word 0x8a7224cc  ! 695: UDIV_I	udiv 	%r8, 0x04cc, %r5
	.word 0xccfa2694  ! 696: SWAPA_I	swapa	%r6, [%r8 + 0x0694] %asi
	.word 0xc3ea254c  ! 697: PREFETCHA_I	prefetcha	[%r8, + 0x054c] %asi, #one_read
	.word 0xc4f22ae8  ! 698: STXA_I	stxa	%r2, [%r8 + 0x0ae8] %asi
	.word 0x88fa0009  ! 699: SDIVcc_R	sdivcc 	%r8, %r9, %r4
	.word 0x8143e058  ! 700: MEMBAR	membar	#StoreStore | #Lookaside | #Sync 
	.word 0x9c6a0009  ! 701: UDIVX_R	udivx 	%r8, %r9, %r14
	.word 0xe8ba25c0  ! 702: STDA_I	stda	%r20, [%r8 + 0x05c0] %asi
	.word 0xf04226a8  ! 703: LDSW_I	ldsw	[%r8 + 0x06a8], %r24
	.word 0xcada2780  ! 704: LDXA_I	ldxa	[%r8, + 0x0780] %asi, %r5
	.word 0x8143c000  ! 705: STBAR	stbar
	.word 0xca7a0009  ! 706: SWAP_R	swap	%r5, [%r8 + %r9]
	.word 0x8143e05b  ! 707: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Lookaside | #Sync 
	.word 0xfa6a2d30  ! 708: LDSTUB_I	ldstub	%r29, [%r8 + 0x0d30]
	.word 0x856a20fc  ! 709: SDIVX_I	sdivx	%r8, 0x00fc, %r2
	.word 0xdcea1009  ! 710: LDSTUBA_R	ldstuba	%r14, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 711: STBAR	stbar
	.word 0xc3ea2934  ! 712: PREFETCHA_I	prefetcha	[%r8, + 0x0934] %asi, #one_read
	.word 0x8fa208a9  ! 713: FSUBs	fsubs	%f8, %f9, %f7
	.word 0xc6c22764  ! 714: LDSWA_I	ldswa	[%r8, + 0x0764] %asi, %r3
	.word 0x8afa2f58  ! 715: SDIVcc_I	sdivcc 	%r8, 0x0f58, %r5
	.word 0xe0ea1009  ! 716: LDSTUBA_R	ldstuba	%r16, [%r8 + %r9] 0x80
	.word 0xc2822fec  ! 717: LDUWA_I	lduwa	[%r8, + 0x0fec] %asi, %r1
	.word 0x96720009  ! 718: UDIV_R	udiv 	%r8, %r9, %r11
	.word 0xcf3a0009  ! 719: STDF_R	std	%f7, [%r9, %r8]
	.word 0x8c7225d8  ! 720: UDIV_I	udiv 	%r8, 0x05d8, %r6
	.word 0xc4aa1009  ! 721: STBA_R	stba	%r2, [%r8 + %r9] 0x80
	.word 0xf8ba2a08  ! 722: STDA_I	stda	%r28, [%r8 + 0x0a08] %asi
	.word 0xe4da1009  ! 724: LDXA_R	ldxa	[%r8, %r9] 0x80, %r18
	.word 0x8eda0009  ! 725: SMULcc_R	smulcc 	%r8, %r9, %r7
	.word 0x02c20004  ! 726: BRZ	brz  ,nt	%8,<label_0x20004>
	.word 0x89a20829  ! 727: FADDs	fadds	%f8, %f9, %f4
	.word 0xc6520009  ! 728: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xfeda2020  ! 729: LDXA_I	ldxa	[%r8, + 0x0020] %asi, %r31
	.word 0xcf3a0009  ! 730: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc9222cdc  ! 731: STF_I	st	%f4, [0x0cdc, %r8]
	.word 0xf84a0009  ! 732: LDSB_R	ldsb	[%r8 + %r9], %r28
	.word 0x2e800008  ! 733: BVS	bvs,a	<label_0x8>
	.word 0xcc5a0009  ! 734: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0x9a7a2dd4  ! 735: SDIV_I	sdiv 	%r8, 0x0dd4, %r13
	.word 0xe41a2c50  ! 736: LDD_I	ldd	[%r8 + 0x0c50], %r18
	.word 0xc36a22e0  ! 737: PREFETCH_I	prefetch	[%r8 + 0x02e0], #one_read
	.word 0x2a800004  ! 738: BCS	bcs,a	<label_0x4>
	.word 0x85a209a9  ! 739: FDIVs	fdivs	%f8, %f9, %f2
	.word 0x3a800008  ! 740: BCC	bcc,a	<label_0x8>
	.word 0xcbf21009  ! 741: CASXA_I	casxa	[%r8] 0x80, %r9, %r5
	.word 0xc6120009  ! 742: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xb3a20929  ! 743: FMULs	fmuls	%f8, %f9, %f25
	.word 0xdc9a1009  ! 744: LDDA_R	ldda	[%r8, %r9] 0x80, %r14
	.word 0x8143c000  ! 745: STBAR	stbar
	.word 0x40000008  ! 746: CALL	call	disp30_8
	.word 0xfa122e48  ! 747: LDUH_I	lduh	[%r8 + 0x0e48], %r29
	.word 0xce8a1009  ! 748: LDUBA_R	lduba	[%r8, %r9] 0x80, %r7
	.word 0xc6120009  ! 749: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xa5222840  ! 750: MULScc_I	mulscc 	%r8, 0x0840, %r18
	.word 0xafa20929  ! 751: FMULs	fmuls	%f8, %f9, %f23
	.word 0xe2ea299c  ! 752: LDSTUBA_I	ldstuba	%r17, [%r8 + 0x099c] %asi
	.word 0x86f228d4  ! 753: UDIVcc_I	udivcc 	%r8, 0x08d4, %r3
	.word 0x884a0009  ! 754: MULX_R	mulx 	%r8, %r9, %r4
	.word 0x36800008  ! 755: BGE	bge,a	<label_0x8>
	.word 0xcf3a0009  ! 756: STDF_R	std	%f7, [%r9, %r8]
	.word 0x9ada23c4  ! 757: SMULcc_I	smulcc 	%r8, 0x03c4, %r13
	.word 0xf41a0009  ! 758: LDD_R	ldd	[%r8 + %r9], %r26
	.word 0xfff22009  ! 759: CASXA_R	casxa	[%r8]%asi, %r9, %r31
	.word 0xc3ea2eb8  ! 760: PREFETCHA_I	prefetcha	[%r8, + 0x0eb8] %asi, #one_read
	.word 0x8d6a20fc  ! 761: SDIVX_I	sdivx	%r8, 0x00fc, %r6
	.word 0x8143e042  ! 762: MEMBAR	membar	#StoreLoad | #Sync 
	.word 0xc2422c58  ! 763: LDSW_I	ldsw	[%r8 + 0x0c58], %r1
	.word 0xcf220009  ! 764: STF_R	st	%f7, [%r9, %r8]
	.word 0xa3a20829  ! 765: FADDs	fadds	%f8, %f9, %f17
	.word 0x22800004  ! 766: BE	be,a	<label_0x4>
	.word 0x8a7a0009  ! 767: SDIV_R	sdiv 	%r8, %r9, %r5
	.word 0xc6aa1009  ! 768: STBA_R	stba	%r3, [%r8 + %r9] 0x80
	.word 0xc33a2dc0  ! 769: STDF_I	std	%f1, [0x0dc0, %r8]
	.word 0xcab21009  ! 770: STHA_R	stha	%r5, [%r8 + %r9] 0x80
	.word 0xc6b22d74  ! 771: STHA_I	stha	%r3, [%r8 + 0x0d74] %asi
	.word 0x8143c000  ! 772: STBAR	stbar
	.word 0x8143e018  ! 773: MEMBAR	membar	#StoreStore | #Lookaside 
	.word 0xc8ba1009  ! 774: STDA_R	stda	%r4, [%r8 + %r9] 0x80
	.word 0x89a20929  ! 775: FMULs	fmuls	%f8, %f9, %f4
	.word 0x99220009  ! 776: MULScc_R	mulscc 	%r8, %r9, %r12
	.word 0xc93a2f90  ! 777: STDF_I	std	%f4, [0x0f90, %r8]
	.word 0x8143e03c  ! 778: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0x10800004  ! 779: BA	ba  	<label_0x4>
	.word 0xccc22d0c  ! 780: LDSWA_I	ldswa	[%r8, + 0x0d0c] %asi, %r6
	.word 0xc4520009  ! 781: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xceaa2a18  ! 782: STBA_I	stba	%r7, [%r8 + 0x0a18] %asi
	.word 0xa3a20929  ! 783: FMULs	fmuls	%f8, %f9, %f17
	.word 0xc36a2b74  ! 784: PREFETCH_I	prefetch	[%r8 + 0x0b74], #one_read
	.word 0x8143c000  ! 785: STBAR	stbar
	.word 0x2cca0004  ! 786: BRGZ	brgz,a,pt	%8,<label_0xa0004>
	.word 0xc6b21009  ! 787: STHA_R	stha	%r3, [%r8 + %r9] 0x80
	.word 0xc73a0009  ! 788: STDF_R	std	%f3, [%r9, %r8]
	.word 0xfc1a0009  ! 790: LDD_R	ldd	[%r8 + %r9], %r30
	.word 0xcf3a0009  ! 791: STDF_R	std	%f7, [%r9, %r8]
	.word 0x8143e068  ! 792: MEMBAR	membar	#StoreStore | #MemIssue | #Sync 
	.word 0xd41a0009  ! 793: LDD_R	ldd	[%r8 + %r9], %r10
	.word 0xa9a20829  ! 794: FADDs	fadds	%f8, %f9, %f20
	.word 0x0a800004  ! 796: BCS	bcs  	<label_0x4>
	.word 0xc3220009  ! 797: STF_R	st	%f1, [%r9, %r8]
	.word 0xce6a20e8  ! 798: LDSTUB_I	ldstub	%r7, [%r8 + 0x00e8]
	.word 0x0e800004  ! 799: BVS	bvs  	<label_0x4>
	.word 0xc36a2de0  ! 800: PREFETCH_I	prefetch	[%r8 + 0x0de0], #one_read
	.word 0xb1a20829  ! 801: FADDs	fadds	%f8, %f9, %f24
	.word 0x8143c000  ! 802: STBAR	stbar
	.word 0xcc6a0009  ! 804: LDSTUB_R	ldstub	%r6, [%r8 + %r9]
	.word 0xe2fa1009  ! 805: SWAPA_R	swapa	%r17, [%r8 + %r9] 0x80
	.word 0x8d220009  ! 806: MULScc_R	mulscc 	%r8, %r9, %r6
	.word 0xc8822ff0  ! 807: LDUWA_I	lduwa	[%r8, + 0x0ff0] %asi, %r4
	.word 0xc8f22620  ! 808: STXA_I	stxa	%r4, [%r8 + 0x0620] %asi
	.word 0xe01a2b70  ! 810: LDD_I	ldd	[%r8 + 0x0b70], %r16
	.word 0xf81221c0  ! 811: LDUH_I	lduh	[%r8 + 0x01c0], %r28
	.word 0x8143c000  ! 812: STBAR	stbar
	.word 0xc40a25a4  ! 813: LDUB_I	ldub	[%r8 + 0x05a4], %r2
	.word 0xc8020009  ! 814: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0x2c800004  ! 815: BNEG	bneg,a	<label_0x4>
	.word 0x827a0009  ! 816: SDIV_R	sdiv 	%r8, %r9, %r1
	.word 0xaba209a9  ! 817: FDIVs	fdivs	%f8, %f9, %f21
	.word 0x0e800008  ! 818: BVS	bvs  	<label_0x8>
	.word 0x88f22d30  ! 819: UDIVcc_I	udivcc 	%r8, 0x0d30, %r4
	.word 0x99a209a9  ! 820: FDIVs	fdivs	%f8, %f9, %f12
	.word 0x84520009  ! 821: UMUL_R	umul 	%r8, %r9, %r2
	.word 0xcafa2b78  ! 822: SWAPA_I	swapa	%r5, [%r8 + 0x0b78] %asi
	.word 0xc682270c  ! 823: LDUWA_I	lduwa	[%r8, + 0x070c] %asi, %r3
	.word 0xc3ea22d0  ! 824: PREFETCHA_I	prefetcha	[%r8, + 0x02d0] %asi, #one_read
	.word 0xcf220009  ! 825: STF_R	st	%f7, [%r9, %r8]
	.word 0x86f22194  ! 827: UDIVcc_I	udivcc 	%r8, 0x0194, %r3
	.word 0xc87a203c  ! 828: SWAP_I	swap	%r4, [%r8 + 0x003c]
	.word 0xe49a2c08  ! 829: LDDA_I	ldda	[%r8, + 0x0c08] %asi, %r18
	.word 0xc2aa1009  ! 831: STBA_R	stba	%r1, [%r8 + %r9] 0x80
	.word 0xb66a26b8  ! 832: UDIVX_I	udivx 	%r8, 0x06b8, %r27
	.word 0x8a522cd0  ! 833: UMUL_I	umul 	%r8, 0x0cd0, %r5
	.word 0x856a2c00  ! 834: SDIVX_I	sdivx	%r8, 0x0c00, %r2
	.word 0xde522140  ! 835: LDSH_I	ldsh	[%r8 + 0x0140], %r15
	.word 0x84fa0009  ! 836: SDIVcc_R	sdivcc 	%r8, %r9, %r2
	.word 0x8e6a0009  ! 837: UDIVX_R	udivx 	%r8, %r9, %r7
	.word 0xc8120009  ! 838: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0x856a0009  ! 839: SDIVX_R	sdivx	%r8, %r9, %r2
	.word 0x846a0009  ! 840: UDIVX_R	udivx 	%r8, %r9, %r2
	.word 0xc692225c  ! 841: LDUHA_I	lduha	[%r8, + 0x025c] %asi, %r3
	.word 0xe53a0009  ! 842: STDF_R	std	%f18, [%r9, %r8]
	.word 0x38800004  ! 843: BGU	bgu,a	<label_0x4>
	.word 0x32800004  ! 844: BNE	bne,a	<label_0x4>
	.word 0x9ef20009  ! 845: UDIVcc_R	udivcc 	%r8, %r9, %r15
	.word 0xc3e21009  ! 846: CASA_I	casa	[%r8] 0x80, %r9, %r1
	.word 0x16800004  ! 847: BGE	bge  	<label_0x4>
	.word 0x8f222d98  ! 848: MULScc_I	mulscc 	%r8, 0x0d98, %r7
	.word 0x1e800008  ! 849: BVC	bvc  	<label_0x8>
	.word 0x26ca0008  ! 850: BRLZ	brlz,a,pt	%8,<label_0xa0008>
	.word 0xa2720009  ! 851: UDIV_R	udiv 	%r8, %r9, %r17
	.word 0xc36a29fc  ! 852: PREFETCH_I	prefetch	[%r8 + 0x09fc], #one_read
	.word 0xcab228f8  ! 853: STHA_I	stha	%r5, [%r8 + 0x08f8] %asi
	.word 0x8e6a28c0  ! 854: UDIVX_I	udivx 	%r8, 0x08c0, %r7
	.word 0xca4a2f8c  ! 855: LDSB_I	ldsb	[%r8 + 0x0f8c], %r5
	.word 0xd6fa1009  ! 856: SWAPA_R	swapa	%r11, [%r8 + %r9] 0x80
	.word 0xe4ba2d38  ! 857: STDA_I	stda	%r18, [%r8 + 0x0d38] %asi
	.word 0xc6fa2198  ! 858: SWAPA_I	swapa	%r3, [%r8 + 0x0198] %asi
	.word 0x18800004  ! 860: BGU	bgu  	<label_0x4>
	.word 0x8143c000  ! 861: STBAR	stbar
	.word 0xca12258c  ! 862: LDUH_I	lduh	[%r8 + 0x058c], %r5
	.word 0xcaea1009  ! 863: LDSTUBA_R	ldstuba	%r5, [%r8 + %r9] 0x80
	.word 0xc8fa2d04  ! 864: SWAPA_I	swapa	%r4, [%r8 + 0x0d04] %asi
	.word 0xccda20c0  ! 865: LDXA_I	ldxa	[%r8, + 0x00c0] %asi, %r6
	.word 0xb8f229fc  ! 866: UDIVcc_I	udivcc 	%r8, 0x09fc, %r28
	.word 0x86d227b0  ! 867: UMULcc_I	umulcc 	%r8, 0x07b0, %r3
	.word 0xb0520009  ! 868: UMUL_R	umul 	%r8, %r9, %r24
	.word 0xd8ba1009  ! 869: STDA_R	stda	%r12, [%r8 + %r9] 0x80
	.word 0xb04a0009  ! 870: MULX_R	mulx 	%r8, %r9, %r24
	.word 0xcc8228e4  ! 871: LDUWA_I	lduwa	[%r8, + 0x08e4] %asi, %r6
	.word 0xc85a0009  ! 872: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0x32800004  ! 873: BNE	bne,a	<label_0x4>
	.word 0xe4ea1009  ! 874: LDSTUBA_R	ldstuba	%r18, [%r8 + %r9] 0x80
	.word 0x846a0009  ! 875: UDIVX_R	udivx 	%r8, %r9, %r2
	.word 0xc3ea2194  ! 876: PREFETCHA_I	prefetcha	[%r8, + 0x0194] %asi, #one_read
	.word 0xcaea1009  ! 877: LDSTUBA_R	ldstuba	%r5, [%r8 + %r9] 0x80
	.word 0xc4aa2578  ! 878: STBA_I	stba	%r2, [%r8 + 0x0578] %asi
	.word 0x0c800004  ! 879: BNEG	bneg  	<label_0x4>
	.word 0x32800004  ! 881: BNE	bne,a	<label_0x4>
	.word 0x887a0009  ! 882: SDIV_R	sdiv 	%r8, %r9, %r4
	.word 0x8143c000  ! 883: STBAR	stbar
	.word 0x8143c000  ! 884: STBAR	stbar
	.word 0xcc9a2748  ! 885: LDDA_I	ldda	[%r8, + 0x0748] %asi, %r6
	.word 0xbc6a291c  ! 886: UDIVX_I	udivx 	%r8, 0x091c, %r30
	.word 0xc66a0009  ! 887: LDSTUB_R	ldstub	%r3, [%r8 + %r9]
	.word 0xd66a26b4  ! 888: LDSTUB_I	ldstub	%r11, [%r8 + 0x06b4]
	.word 0xd8b222b0  ! 889: STHA_I	stha	%r12, [%r8 + 0x02b0] %asi
	.word 0xc36a2338  ! 890: PREFETCH_I	prefetch	[%r8 + 0x0338], #one_read
	.word 0x84720009  ! 891: UDIV_R	udiv 	%r8, %r9, %r2
	.word 0xa8d20009  ! 892: UMULcc_R	umulcc 	%r8, %r9, %r20
	.word 0x8ed22db0  ! 893: UMULcc_I	umulcc 	%r8, 0x0db0, %r7
	.word 0x89a209a9  ! 894: FDIVs	fdivs	%f8, %f9, %f4
	.word 0x8cd22acc  ! 895: UMULcc_I	umulcc 	%r8, 0x0acc, %r6
	.word 0xc2da1009  ! 896: LDXA_R	ldxa	[%r8, %r9] 0x80, %r1
	.word 0xdada25c0  ! 897: LDXA_I	ldxa	[%r8, + 0x05c0] %asi, %r13
	.word 0xae5a0009  ! 898: SMUL_R	smul 	%r8, %r9, %r23
	.word 0x8ba208a9  ! 899: FSUBs	fsubs	%f8, %f9, %f5
	.word 0xc4c21009  ! 900: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r2
	.word 0x86d22858  ! 901: UMULcc_I	umulcc 	%r8, 0x0858, %r3
	.word 0x8143e06c  ! 902: MEMBAR	membar	#LoadStore | #StoreStore | #MemIssue | #Sync 
	.word 0xd4ba1009  ! 903: STDA_R	stda	%r10, [%r8 + %r9] 0x80
	.word 0xc3ea21f8  ! 904: PREFETCHA_I	prefetcha	[%r8, + 0x01f8] %asi, #one_read
	.word 0xc2aa2890  ! 905: STBA_I	stba	%r1, [%r8 + 0x0890] %asi
	.word 0x04800004  ! 906: BLE	ble  	<label_0x4>
	.word 0x996a0009  ! 907: SDIVX_R	sdivx	%r8, %r9, %r12
	.word 0xecda1009  ! 908: LDXA_R	ldxa	[%r8, %r9] 0x80, %r22
	.word 0xcab21009  ! 910: STHA_R	stha	%r5, [%r8 + %r9] 0x80
	.word 0xc89a1009  ! 911: LDDA_R	ldda	[%r8, %r9] 0x80, %r4
	.word 0xc93a0009  ! 912: STDF_R	std	%f4, [%r9, %r8]
	.word 0x10800004  ! 913: BA	ba  	<label_0x4>
	.word 0x34800004  ! 914: BG	bg,a	<label_0x4>
	.word 0xa7a209a9  ! 915: FDIVs	fdivs	%f8, %f9, %f19
	.word 0x18800004  ! 916: BGU	bgu  	<label_0x4>
	.word 0xc3ea2084  ! 917: PREFETCHA_I	prefetcha	[%r8, + 0x0084] %asi, #one_read
	.word 0xc4c21009  ! 918: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r2
	.word 0xc60a2f3c  ! 919: LDUB_I	ldub	[%r8 + 0x0f3c], %r3
	.word 0xe89a1009  ! 920: LDDA_R	ldda	[%r8, %r9] 0x80, %r20
	.word 0xf4f21009  ! 921: STXA_R	stxa	%r26, [%r8 + %r9] 0x80
	.word 0xc2da2eb0  ! 922: LDXA_I	ldxa	[%r8, + 0x0eb0] %asi, %r1
	.word 0x8143e031  ! 923: MEMBAR	membar	#LoadLoad | #Lookaside | #MemIssue 
	.word 0x8143c000  ! 924: STBAR	stbar
	.word 0xcc0a0009  ! 926: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xc53a0009  ! 927: STDF_R	std	%f2, [%r9, %r8]
	.word 0x30800004  ! 928: BA	ba,a	<label_0x4>
	.word 0x84720009  ! 929: UDIV_R	udiv 	%r8, %r9, %r2
	.word 0x8e5a2f64  ! 930: SMUL_I	smul 	%r8, 0x0f64, %r7
	.word 0x8143c000  ! 931: STBAR	stbar
	.word 0x826a2868  ! 932: UDIVX_I	udivx 	%r8, 0x0868, %r1
	.word 0xccf22248  ! 933: STXA_I	stxa	%r6, [%r8 + 0x0248] %asi
	.word 0xfe120009  ! 934: LDUH_R	lduh	[%r8 + %r9], %r31
	.word 0xc6420009  ! 935: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0x24c20008  ! 936: BRLEZ	brlez,a,nt	%8,<label_0x20008>
	.word 0x8a722780  ! 937: UDIV_I	udiv 	%r8, 0x0780, %r5
	.word 0xe2aa1009  ! 938: STBA_R	stba	%r17, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 939: STBAR	stbar
	.word 0xc3ea2f00  ! 940: PREFETCHA_I	prefetcha	[%r8, + 0x0f00] %asi, #one_read
	.word 0x86fa0009  ! 941: SDIVcc_R	sdivcc 	%r8, %r9, %r3
	.word 0xf28a1009  ! 942: LDUBA_R	lduba	[%r8, %r9] 0x80, %r25
	.word 0xdeda2298  ! 943: LDXA_I	ldxa	[%r8, + 0x0298] %asi, %r15
	.word 0xceca259c  ! 944: LDSBA_I	ldsba	[%r8, + 0x059c] %asi, %r7
	.word 0xc84a0009  ! 945: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0x844a2774  ! 946: MULX_I	mulx 	%r8, 0x0774, %r2
	.word 0xca0a0009  ! 947: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0x9e4a0009  ! 948: MULX_R	mulx 	%r8, %r9, %r15
	.word 0xc2c21009  ! 950: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r1
	.word 0xcc5a0009  ! 951: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0x40000004  ! 953: CALL	call	disp30_4
	.word 0x8143e03c  ! 954: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0x36800004  ! 955: BGE	bge,a	<label_0x4>
	.word 0x9b220009  ! 956: MULScc_R	mulscc 	%r8, %r9, %r13
	.word 0xc2921009  ! 957: LDUHA_R	lduha	[%r8, %r9] 0x80, %r1
	.word 0x825a0009  ! 958: SMUL_R	smul 	%r8, %r9, %r1
	.word 0xf67a2864  ! 959: SWAP_I	swap	%r27, [%r8 + 0x0864]
	.word 0x9e4a228c  ! 960: MULX_I	mulx 	%r8, 0x028c, %r15
	.word 0xc6aa1009  ! 961: STBA_R	stba	%r3, [%r8 + %r9] 0x80
	.word 0xc33a2290  ! 962: STDF_I	std	%f1, [0x0290, %r8]
	.word 0x836a0009  ! 963: SDIVX_R	sdivx	%r8, %r9, %r1
	.word 0x89a208a9  ! 964: FSUBs	fsubs	%f8, %f9, %f4
	.word 0x87222c70  ! 965: MULScc_I	mulscc 	%r8, 0x0c70, %r3
	.word 0xc85a24f8  ! 966: LDX_I	ldx	[%r8 + 0x04f8], %r4
	.word 0xea6a0009  ! 967: LDSTUB_R	ldstub	%r21, [%r8 + %r9]
	.word 0xfcba2fb8  ! 968: STDA_I	stda	%r30, [%r8 + 0x0fb8] %asi
	.word 0x2cca0004  ! 969: BRGZ	brgz,a,pt	%8,<label_0xa0004>
	.word 0xb4fa2dfc  ! 970: SDIVcc_I	sdivcc 	%r8, 0x0dfc, %r26
	.word 0xc6f21009  ! 971: STXA_R	stxa	%r3, [%r8 + %r9] 0x80
	.word 0xe6921009  ! 972: LDUHA_R	lduha	[%r8, %r9] 0x80, %r19
	.word 0x34800004  ! 973: BG	bg,a	<label_0x4>
	.word 0xc3ea2aa8  ! 974: PREFETCHA_I	prefetcha	[%r8, + 0x0aa8] %asi, #one_read
	.word 0x88720009  ! 975: UDIV_R	udiv 	%r8, %r9, %r4
	.word 0xde020009  ! 976: LDUW_R	lduw	[%r8 + %r9], %r15
	.word 0x8ed22520  ! 977: UMULcc_I	umulcc 	%r8, 0x0520, %r7
	.word 0xc81a2448  ! 978: LDD_I	ldd	[%r8 + 0x0448], %r4
	.word 0x8afa2d40  ! 979: SDIVcc_I	sdivcc 	%r8, 0x0d40, %r5
	.word 0x836a24c0  ! 980: SDIVX_I	sdivx	%r8, 0x04c0, %r1
	.word 0x02ca0008  ! 981: BRZ	brz  ,pt	%8,<label_0xa0008>
	.word 0xcde21009  ! 983: CASA_I	casa	[%r8] 0x80, %r9, %r6
	.word 0x3a800004  ! 984: BCC	bcc,a	<label_0x4>
	.word 0x2c800004  ! 985: BNEG	bneg,a	<label_0x4>
	.word 0xcff22009  ! 986: CASXA_R	casxa	[%r8]%asi, %r9, %r7
	.word 0x8143e023  ! 987: MEMBAR	membar	#LoadLoad | #StoreLoad | #MemIssue 
	.word 0x20800008  ! 988: BN	bn,a	<label_0x8>
	.word 0xd81a26d8  ! 989: LDD_I	ldd	[%r8 + 0x06d8], %r12
	.word 0xc8aa2a18  ! 990: STBA_I	stba	%r4, [%r8 + 0x0a18] %asi
	.word 0x884a0009  ! 991: MULX_R	mulx 	%r8, %r9, %r4
	.word 0xc3ea2c18  ! 992: PREFETCHA_I	prefetcha	[%r8, + 0x0c18] %asi, #one_read
	.word 0xc87a2cc4  ! 993: SWAP_I	swap	%r4, [%r8 + 0x0cc4]
	.word 0x00800004  ! 994: BN	bn  	<label_0x4>
	.word 0xa2fa0009  ! 995: SDIVcc_R	sdivcc 	%r8, %r9, %r17
	.word 0x8143c000  ! 997: STBAR	stbar
	.word 0x1e800004  ! 998: BVC	bvc  	<label_0x4>
	.word 0xf2c22ce8  ! 999: LDSWA_I	ldswa	[%r8, + 0x0ce8] %asi, %r25
        ta      T_GOOD_TRAP

th_main_1:
        setx  MAIN_BASE_DATA_VA, %r1, %r8
        setx  0x0000000000000bc0, %g1, %r9
        setx  0x80, %g2, %g1
        wr  %g1, %g0, %asi
	    rd %fprs, %g0
        wr %g0, 0x4, %fprs
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
        setx  0x8f1849ff9a81817a, %g1, %r0
        setx  0xa7d0448f9ebcdaa4, %g1, %r1
        setx  0x61d4bb993e78147f, %g1, %r2
        setx  0xcffd68f846087396, %g1, %r3
        setx  0xbf7618e6a8a5c09a, %g1, %r4
        setx  0xa4c785e5761c89e0, %g1, %r5
        setx  0xc3e57d1a68527128, %g1, %r6
        setx  0x12dc34bed5ac2e73, %g1, %r7
        setx  0x94f27e334d5ba7e1, %g1, %r10
        setx  0xa98e9c689a201b79, %g1, %r11
        setx  0x3b55a4046833decd, %g1, %r12
        setx  0x35b23d6fc29a7613, %g1, %r13
        setx  0xe619c532b009e423, %g1, %r14
        setx  0x749ec25dd499d58d, %g1, %r15
        setx  0xa9ea93442137d661, %g1, %r16
        setx  0xd86c46ae25ca7f94, %g1, %r17
        setx  0x7c009ee48bf37dbe, %g1, %r18
        setx  0x2dd2db6631a3f4dc, %g1, %r19
        setx  0xf6c1001d51b57bf8, %g1, %r20
        setx  0x3372bde68a78c293, %g1, %r21
        setx  0x2834aedf63264341, %g1, %r22
        setx  0xe15789b77665ce1b, %g1, %r23
        setx  0x1bb8a42bba53a846, %g1, %r24
        setx  0x43f461288b70ce6b, %g1, %r25
        setx  0x8b72eb69c559982e, %g1, %r26
        setx  0xf01bc89d17e33060, %g1, %r27
        setx  0x50e20056dc8bde1c, %g1, %r28
        setx  0x66c480e9500f9012, %g1, %r29
        setx  0x4c4fa439ed77c9cd, %g1, %r30
        setx  0xcb1f4dee252b3ebf, %g1, %r31
	.word 0x0cc20008  ! 5: BRGZ	brgz  ,nt	%8,<label_0x20008>
	.word 0x04c20004  ! 6: BRLEZ	brlez  ,nt	%8,<label_0x20004>
	.word 0xca7a0009  ! 7: SWAP_R	swap	%r5, [%r8 + %r9]
	.word 0x8143e071  ! 8: MEMBAR	membar	#LoadLoad | #Lookaside | #MemIssue | #Sync 
	.word 0xdcca1009  ! 9: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r14
	.word 0xc3f21009  ! 10: CASXA_I	casxa	[%r8] 0x80, %r9, %r1
	.word 0xc68a289c  ! 11: LDUBA_I	lduba	[%r8, + 0x089c] %asi, %r3
	.word 0x8cf22454  ! 12: UDIVcc_I	udivcc 	%r8, 0x0454, %r6
	.word 0x8143c000  ! 13: STBAR	stbar
	.word 0xd6821009  ! 14: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r11
	.word 0xfc1a0009  ! 15: LDD_R	ldd	[%r8 + %r9], %r30
	.word 0x8143c000  ! 16: STBAR	stbar
	.word 0x846a0009  ! 17: UDIVX_R	udivx 	%r8, %r9, %r2
	.word 0xcafa2728  ! 18: SWAPA_I	swapa	%r5, [%r8 + 0x0728] %asi
	.word 0x8143c000  ! 19: STBAR	stbar
	.word 0xfeb21009  ! 20: STHA_R	stha	%r31, [%r8 + %r9] 0x80
	.word 0x2c800004  ! 21: BNEG	bneg,a	<label_0x4>
	.word 0x84522294  ! 22: UMUL_I	umul 	%r8, 0x0294, %r2
	.word 0x2aca0008  ! 23: BRNZ	brnz,a,pt	%8,<label_0xa0008>
	.word 0xc3ea2538  ! 24: PREFETCHA_I	prefetcha	[%r8, + 0x0538] %asi, #one_read
	.word 0x8143e02a  ! 25: MEMBAR	membar	#StoreLoad | #StoreStore | #MemIssue 
	.word 0x8143e037  ! 26: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside | #MemIssue 
	.word 0xc68a1009  ! 27: LDUBA_R	lduba	[%r8, %r9] 0x80, %r3
	.word 0x8143c000  ! 28: STBAR	stbar
	.word 0xf4da1009  ! 30: LDXA_R	ldxa	[%r8, %r9] 0x80, %r26
	.word 0x83a20929  ! 31: FMULs	fmuls	%f8, %f9, %f1
	.word 0xd81a0009  ! 32: LDD_R	ldd	[%r8 + %r9], %r12
	.word 0xc2d21009  ! 33: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r1
	.word 0xc2da1009  ! 34: LDXA_R	ldxa	[%r8, %r9] 0x80, %r1
	.word 0xce5a0009  ! 35: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0x1c800004  ! 36: BPOS	bpos  	<label_0x4>
	.word 0x8143e016  ! 37: MEMBAR	membar	#StoreLoad | #LoadStore | #Lookaside 
	.word 0xca7a2038  ! 38: SWAP_I	swap	%r5, [%r8 + 0x0038]
	.word 0xb0f20009  ! 39: UDIVcc_R	udivcc 	%r8, %r9, %r24
	.word 0x825a0009  ! 40: SMUL_R	smul 	%r8, %r9, %r1
	.word 0x20800008  ! 41: BN	bn,a	<label_0x8>
	.word 0xca520009  ! 42: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xc36a287c  ! 43: PREFETCH_I	prefetch	[%r8 + 0x087c], #one_read
	.word 0x08800004  ! 45: BLEU	bleu  	<label_0x4>
	.word 0x8143c000  ! 47: STBAR	stbar
	.word 0xb8520009  ! 48: UMUL_R	umul 	%r8, %r9, %r28
	.word 0xada208a9  ! 49: FSUBs	fsubs	%f8, %f9, %f22
	.word 0xc8fa1009  ! 50: SWAPA_R	swapa	%r4, [%r8 + %r9] 0x80
	.word 0xc8ba20c0  ! 51: STDA_I	stda	%r4, [%r8 + 0x00c0] %asi
	.word 0x8ad22c5c  ! 52: UMULcc_I	umulcc 	%r8, 0x0c5c, %r5
	.word 0x84fa295c  ! 53: SDIVcc_I	sdivcc 	%r8, 0x095c, %r2
	.word 0xfe8a2998  ! 54: LDUBA_I	lduba	[%r8, + 0x0998] %asi, %r31
	.word 0x8c4a0009  ! 55: MULX_R	mulx 	%r8, %r9, %r6
	.word 0xc9e21009  ! 56: CASA_I	casa	[%r8] 0x80, %r9, %r4
	.word 0x8eda0009  ! 57: SMULcc_R	smulcc 	%r8, %r9, %r7
	.word 0xfeb22ffc  ! 58: STHA_I	stha	%r31, [%r8 + 0x0ffc] %asi
	.word 0xdcda2920  ! 59: LDXA_I	ldxa	[%r8, + 0x0920] %asi, %r14
	.word 0x8143e045  ! 60: MEMBAR	membar	#LoadLoad | #LoadStore | #Sync 
	.word 0x844a2b04  ! 61: MULX_I	mulx 	%r8, 0x0b04, %r2
	.word 0x12800004  ! 62: BNE	bne  	<label_0x4>
	.word 0xf01a0009  ! 63: LDD_R	ldd	[%r8 + %r9], %r24
	.word 0xcb3a0009  ! 64: STDF_R	std	%f5, [%r9, %r8]
	.word 0x83a20829  ! 65: FADDs	fadds	%f8, %f9, %f1
	.word 0xf88a2168  ! 66: LDUBA_I	lduba	[%r8, + 0x0168] %asi, %r28
	.word 0x8143e074  ! 67: MEMBAR	membar	#LoadStore | #Lookaside | #MemIssue | #Sync 
	.word 0xa9a209a9  ! 68: FDIVs	fdivs	%f8, %f9, %f20
	.word 0xf09a2be0  ! 69: LDDA_I	ldda	[%r8, + 0x0be0] %asi, %r24
	.word 0x84fa2e94  ! 70: SDIVcc_I	sdivcc 	%r8, 0x0e94, %r2
	.word 0x85a209a9  ! 71: FDIVs	fdivs	%f8, %f9, %f2
	.word 0xc4120009  ! 72: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xc6922ab8  ! 73: LDUHA_I	lduha	[%r8, + 0x0ab8] %asi, %r3
	.word 0xcc7a0009  ! 74: SWAP_R	swap	%r6, [%r8 + %r9]
	.word 0x947a2ad0  ! 75: SDIV_I	sdiv 	%r8, 0x0ad0, %r10
	.word 0xa252235c  ! 76: UMUL_I	umul 	%r8, 0x035c, %r17
	.word 0x824a0009  ! 77: MULX_R	mulx 	%r8, %r9, %r1
	.word 0x827a0009  ! 78: SDIV_R	sdiv 	%r8, %r9, %r1
	.word 0x8143c000  ! 79: STBAR	stbar
	.word 0x16800004  ! 80: BGE	bge  	<label_0x4>
	.word 0xa6fa0009  ! 81: SDIVcc_R	sdivcc 	%r8, %r9, %r19
	.word 0x87a209a9  ! 82: FDIVs	fdivs	%f8, %f9, %f3
	.word 0xc36a281c  ! 83: PREFETCH_I	prefetch	[%r8 + 0x081c], #one_read
	.word 0x06800008  ! 84: BL	bl  	<label_0x8>
	.word 0xc21222d0  ! 85: LDUH_I	lduh	[%r8 + 0x02d0], %r1
	.word 0x8ba208a9  ! 86: FSUBs	fsubs	%f8, %f9, %f5
	.word 0x9b6a2050  ! 87: SDIVX_I	sdivx	%r8, 0x0050, %r13
	.word 0x82520009  ! 88: UMUL_R	umul 	%r8, %r9, %r1
	.word 0xfa6a2654  ! 89: LDSTUB_I	ldstub	%r29, [%r8 + 0x0654]
	.word 0x8fa20929  ! 90: FMULs	fmuls	%f8, %f9, %f7
	.word 0xf8ba2f48  ! 91: STDA_I	stda	%r28, [%r8 + 0x0f48] %asi
	.word 0x8143e032  ! 92: MEMBAR	membar	#StoreLoad | #Lookaside | #MemIssue 
	.word 0xf7e22009  ! 93: CASA_R	casa	[%r8] %asi, %r9, %r27
	.word 0x84da27f4  ! 94: SMULcc_I	smulcc 	%r8, 0x07f4, %r2
	.word 0xdcba1009  ! 95: STDA_R	stda	%r14, [%r8 + %r9] 0x80
	.word 0xcad22da8  ! 96: LDSHA_I	ldsha	[%r8, + 0x0da8] %asi, %r5
	.word 0xc27a2964  ! 97: SWAP_I	swap	%r1, [%r8 + 0x0964]
	.word 0x86fa2d78  ! 98: SDIVcc_I	sdivcc 	%r8, 0x0d78, %r3
	.word 0xc3ea220c  ! 99: PREFETCHA_I	prefetcha	[%r8, + 0x020c] %asi, #one_read
	.word 0xb9a20929  ! 100: FMULs	fmuls	%f8, %f9, %f28
	.word 0xd8d222b8  ! 101: LDSHA_I	ldsha	[%r8, + 0x02b8] %asi, %r12
	.word 0x8143e03f  ! 102: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0xf8ba2ad0  ! 103: STDA_I	stda	%r28, [%r8 + 0x0ad0] %asi
	.word 0xc45a0009  ! 104: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xe2ca26f0  ! 105: LDSBA_I	ldsba	[%r8, + 0x06f0] %asi, %r17
	.word 0xe81a0009  ! 106: LDD_R	ldd	[%r8 + %r9], %r20
	.word 0xdd222cd0  ! 107: STF_I	st	%f14, [0x0cd0, %r8]
	.word 0x836a0009  ! 108: SDIVX_R	sdivx	%r8, %r9, %r1
	.word 0xf6aa1009  ! 111: STBA_R	stba	%r27, [%r8 + %r9] 0x80
	.word 0x89a209a9  ! 112: FDIVs	fdivs	%f8, %f9, %f4
	.word 0x887a2e80  ! 113: SDIV_I	sdiv 	%r8, 0x0e80, %r4
	.word 0xecd220f0  ! 114: LDSHA_I	ldsha	[%r8, + 0x00f0] %asi, %r22
	.word 0x8cfa0009  ! 115: SDIVcc_R	sdivcc 	%r8, %r9, %r6
	.word 0xc36a2030  ! 116: PREFETCH_I	prefetch	[%r8 + 0x0030], #one_read
	.word 0x86da0009  ! 117: SMULcc_R	smulcc 	%r8, %r9, %r3
	.word 0x8143c000  ! 118: STBAR	stbar
	.word 0xc88a1009  ! 120: LDUBA_R	lduba	[%r8, %r9] 0x80, %r4
	.word 0xccca22f0  ! 121: LDSBA_I	ldsba	[%r8, + 0x02f0] %asi, %r6
	.word 0xe04a0009  ! 122: LDSB_R	ldsb	[%r8 + %r9], %r16
	.word 0x8143e016  ! 123: MEMBAR	membar	#StoreLoad | #LoadStore | #Lookaside 
	.word 0x85a20829  ! 124: FADDs	fadds	%f8, %f9, %f2
	.word 0x08800004  ! 125: BLEU	bleu  	<label_0x4>
	.word 0x22ca0008  ! 126: BRZ	brz,a,pt	%8,<label_0xa0008>
	.word 0x10800008  ! 127: BA	ba  	<label_0x8>
	.word 0xce921009  ! 129: LDUHA_R	lduha	[%r8, %r9] 0x80, %r7
	.word 0x8c4a0009  ! 130: MULX_R	mulx 	%r8, %r9, %r6
	.word 0xb2f22c14  ! 131: UDIVcc_I	udivcc 	%r8, 0x0c14, %r25
	.word 0xeeea25a0  ! 132: LDSTUBA_I	ldstuba	%r23, [%r8 + 0x05a0] %asi
	.word 0x827a22d0  ! 133: SDIV_I	sdiv 	%r8, 0x02d0, %r1
	.word 0xceca1009  ! 134: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r7
	.word 0xe2ca1009  ! 135: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r17
	.word 0xc3ea2814  ! 136: PREFETCHA_I	prefetcha	[%r8, + 0x0814] %asi, #one_read
	.word 0xfe5a0009  ! 137: LDX_R	ldx	[%r8 + %r9], %r31
	.word 0xcc1a2330  ! 138: LDD_I	ldd	[%r8 + 0x0330], %r6
	.word 0xc8822be4  ! 139: LDUWA_I	lduwa	[%r8, + 0x0be4] %asi, %r4
	.word 0x8143c000  ! 140: STBAR	stbar
	.word 0xfa921009  ! 141: LDUHA_R	lduha	[%r8, %r9] 0x80, %r29
	.word 0x0e800008  ! 142: BVS	bvs  	<label_0x8>
	.word 0xcefa283c  ! 143: SWAPA_I	swapa	%r7, [%r8 + 0x083c] %asi
	.word 0xc8821009  ! 145: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r4
	.word 0xc6120009  ! 146: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0x8e5a0009  ! 147: SMUL_R	smul 	%r8, %r9, %r7
	.word 0x864a26c4  ! 148: MULX_I	mulx 	%r8, 0x06c4, %r3
	.word 0xac5a2fa4  ! 149: SMUL_I	smul 	%r8, 0x0fa4, %r22
	.word 0x86da2a9c  ! 150: SMULcc_I	smulcc 	%r8, 0x0a9c, %r3
	.word 0xc46a2ed0  ! 151: LDSTUB_I	ldstub	%r2, [%r8 + 0x0ed0]
	.word 0xca8a1009  ! 152: LDUBA_R	lduba	[%r8, %r9] 0x80, %r5
	.word 0x86d22414  ! 153: UMULcc_I	umulcc 	%r8, 0x0414, %r3
	.word 0x8143e050  ! 154: MEMBAR	membar	#Lookaside | #Sync 
	.word 0x89a20929  ! 155: FMULs	fmuls	%f8, %f9, %f4
	.word 0xc4921009  ! 156: LDUHA_R	lduha	[%r8, %r9] 0x80, %r2
	.word 0xcdf21009  ! 157: CASXA_I	casxa	[%r8] 0x80, %r9, %r6
	.word 0xd53a2e38  ! 158: STDF_I	std	%f10, [0x0e38, %r8]
	.word 0xcfe22009  ! 159: CASA_R	casa	[%r8] %asi, %r9, %r7
	.word 0xe2520009  ! 160: LDSH_R	ldsh	[%r8 + %r9], %r17
	.word 0x8ba208a9  ! 161: FSUBs	fsubs	%f8, %f9, %f5
	.word 0xc49a2bc8  ! 162: LDDA_I	ldda	[%r8, + 0x0bc8] %asi, %r2
	.word 0xb4d20009  ! 163: UMULcc_R	umulcc 	%r8, %r9, %r26
	.word 0x26800008  ! 164: BL	bl,a	<label_0x8>
	.word 0xdcfa2964  ! 165: SWAPA_I	swapa	%r14, [%r8 + 0x0964] %asi
	.word 0xc6a22eb0  ! 166: STWA_I	stwa	%r3, [%r8 + 0x0eb0] %asi
	.word 0xc8422ec8  ! 167: LDSW_I	ldsw	[%r8 + 0x0ec8], %r4
	.word 0xa8722048  ! 168: UDIV_I	udiv 	%r8, 0x0048, %r20
	.word 0x8143c000  ! 169: STBAR	stbar
	.word 0x8143e037  ! 170: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside | #MemIssue 
	.word 0xd9f21009  ! 171: CASXA_I	casxa	[%r8] 0x80, %r9, %r12
	.word 0xc84a2f44  ! 172: LDSB_I	ldsb	[%r8 + 0x0f44], %r4
	.word 0xde8a1009  ! 173: LDUBA_R	lduba	[%r8, %r9] 0x80, %r15
	.word 0x8143c000  ! 174: STBAR	stbar
	.word 0xb7a208a9  ! 175: FSUBs	fsubs	%f8, %f9, %f27
	.word 0xd8fa1009  ! 176: SWAPA_R	swapa	%r12, [%r8 + %r9] 0x80
	.word 0x88fa2504  ! 177: SDIVcc_I	sdivcc 	%r8, 0x0504, %r4
	.word 0xcab21009  ! 178: STHA_R	stha	%r5, [%r8 + %r9] 0x80
	.word 0x82722bc8  ! 179: UDIV_I	udiv 	%r8, 0x0bc8, %r1
	.word 0xc4ba21b8  ! 180: STDA_I	stda	%r2, [%r8 + 0x01b8] %asi
	.word 0xc6d22c7c  ! 181: LDSHA_I	ldsha	[%r8, + 0x0c7c] %asi, %r3
	.word 0xcc1a0009  ! 182: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0x87a209a9  ! 183: FDIVs	fdivs	%f8, %f9, %f3
	.word 0xc27a0009  ! 184: SWAP_R	swap	%r1, [%r8 + %r9]
	.word 0x8143e034  ! 185: MEMBAR	membar	#LoadStore | #Lookaside | #MemIssue 
	.word 0x8143e02b  ! 186: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #MemIssue 
	.word 0xc6a21009  ! 187: STWA_R	stwa	%r3, [%r8 + %r9] 0x80
	.word 0x87a20829  ! 188: FADDs	fadds	%f8, %f9, %f3
	.word 0xc60a0009  ! 189: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0x88fa21a8  ! 190: SDIVcc_I	sdivcc 	%r8, 0x01a8, %r4
	.word 0xc3ea2148  ! 191: PREFETCHA_I	prefetcha	[%r8, + 0x0148] %asi, #one_read
	.word 0xc33a0009  ! 192: STDF_R	std	%f1, [%r9, %r8]
	.word 0xe6f220e8  ! 194: STXA_I	stxa	%r19, [%r8 + 0x00e8] %asi
	.word 0x8b22245c  ! 195: MULScc_I	mulscc 	%r8, 0x045c, %r5
	.word 0xf0ba2b38  ! 196: STDA_I	stda	%r24, [%r8 + 0x0b38] %asi
	.word 0xe8d21009  ! 197: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r20
	.word 0x34800004  ! 198: BG	bg,a	<label_0x4>
	.word 0x83a20829  ! 199: FADDs	fadds	%f8, %f9, %f1
	.word 0x8e5222b8  ! 200: UMUL_I	umul 	%r8, 0x02b8, %r7
	.word 0xc3e21009  ! 201: CASA_I	casa	[%r8] 0x80, %r9, %r1
	.word 0xdcea1009  ! 202: LDSTUBA_R	ldstuba	%r14, [%r8 + %r9] 0x80
	.word 0xc2c21009  ! 203: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r1
	.word 0xcaea1009  ! 204: LDSTUBA_R	ldstuba	%r5, [%r8 + %r9] 0x80
	.word 0x8143e07e  ! 205: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xf4aa2e5c  ! 206: STBA_I	stba	%r26, [%r8 + 0x0e5c] %asi
	.word 0x99a208a9  ! 207: FSUBs	fsubs	%f8, %f9, %f12
	.word 0xf452267c  ! 208: LDSH_I	ldsh	[%r8 + 0x067c], %r26
	.word 0xc3ea2c80  ! 209: PREFETCHA_I	prefetcha	[%r8, + 0x0c80] %asi, #one_read
	.word 0xccb21009  ! 210: STHA_R	stha	%r6, [%r8 + %r9] 0x80
	.word 0xfc9a1009  ! 211: LDDA_R	ldda	[%r8, %r9] 0x80, %r30
	.word 0xc2ca1009  ! 212: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r1
	.word 0x85a20929  ! 213: FMULs	fmuls	%f8, %f9, %f2
	.word 0xe07a2388  ! 214: SWAP_I	swap	%r16, [%r8 + 0x0388]
	.word 0x9ef20009  ! 215: UDIVcc_R	udivcc 	%r8, %r9, %r15
	.word 0x8143e06e  ! 216: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #MemIssue | #Sync 
	.word 0xb1a208a9  ! 217: FSUBs	fsubs	%f8, %f9, %f24
	.word 0xc8921009  ! 218: LDUHA_R	lduha	[%r8, %r9] 0x80, %r4
	.word 0xc4a21009  ! 219: STWA_R	stwa	%r2, [%r8 + %r9] 0x80
	.word 0xcd3a2ea0  ! 220: STDF_I	std	%f6, [0x0ea0, %r8]
	.word 0x84520009  ! 221: UMUL_R	umul 	%r8, %r9, %r2
	.word 0xa66a28c4  ! 222: UDIVX_I	udivx 	%r8, 0x08c4, %r19
	.word 0xc27a2338  ! 223: SWAP_I	swap	%r1, [%r8 + 0x0338]
	.word 0x825226cc  ! 224: UMUL_I	umul 	%r8, 0x06cc, %r1
	.word 0xceca2798  ! 225: LDSBA_I	ldsba	[%r8, + 0x0798] %asi, %r7
	.word 0x8143e017  ! 226: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside 
	.word 0xcaf21009  ! 227: STXA_R	stxa	%r5, [%r8 + %r9] 0x80
	.word 0xc6420009  ! 228: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0x08800004  ! 229: BLEU	bleu  	<label_0x4>
	.word 0xca6a2a10  ! 230: LDSTUB_I	ldstub	%r5, [%r8 + 0x0a10]
	.word 0x8143e040  ! 231: MEMBAR	membar	#Sync 
	.word 0x40000008  ! 232: CALL	call	disp30_8
	.word 0xb0da0009  ! 233: SMULcc_R	smulcc 	%r8, %r9, %r24
	.word 0x0a800008  ! 234: BCS	bcs  	<label_0x8>
	.word 0x8143c000  ! 235: STBAR	stbar
	.word 0x8143e005  ! 236: MEMBAR	membar	#LoadLoad | #LoadStore 
	.word 0x8e7a0009  ! 237: SDIV_R	sdiv 	%r8, %r9, %r7
	.word 0xecba2fc0  ! 238: STDA_I	stda	%r22, [%r8 + 0x0fc0] %asi
	.word 0x8a4a25ac  ! 239: MULX_I	mulx 	%r8, 0x05ac, %r5
	.word 0x8ed22698  ! 240: UMULcc_I	umulcc 	%r8, 0x0698, %r7
	.word 0xc36a2908  ! 241: PREFETCH_I	prefetch	[%r8 + 0x0908], #one_read
	.word 0xc4fa1009  ! 242: SWAPA_R	swapa	%r2, [%r8 + %r9] 0x80
	.word 0x36800004  ! 243: BGE	bge,a	<label_0x4>
	.word 0x8143e074  ! 244: MEMBAR	membar	#LoadStore | #Lookaside | #MemIssue | #Sync 
	.word 0x8143e06c  ! 245: MEMBAR	membar	#LoadStore | #StoreStore | #MemIssue | #Sync 
	.word 0xe0d22b94  ! 246: LDSHA_I	ldsha	[%r8, + 0x0b94] %asi, %r16
	.word 0x8e6a0009  ! 247: UDIVX_R	udivx 	%r8, %r9, %r7
	.word 0xceca2138  ! 248: LDSBA_I	ldsba	[%r8, + 0x0138] %asi, %r7
	.word 0xc8120009  ! 249: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0x32800004  ! 250: BNE	bne,a	<label_0x4>
	.word 0xb1a209a9  ! 252: FDIVs	fdivs	%f8, %f9, %f24
	.word 0x8cf20009  ! 253: UDIVcc_R	udivcc 	%r8, %r9, %r6
	.word 0x0cca0004  ! 254: BRGZ	brgz  ,pt	%8,<label_0xa0004>
	.word 0x867a2904  ! 255: SDIV_I	sdiv 	%r8, 0x0904, %r3
	.word 0xe0ba1009  ! 256: STDA_R	stda	%r16, [%r8 + %r9] 0x80
	.word 0xcf222ec4  ! 257: STF_I	st	%f7, [0x0ec4, %r8]
	.word 0xc36a2010  ! 258: PREFETCH_I	prefetch	[%r8 + 0x0010], #one_read
	.word 0xc2a21009  ! 259: STWA_R	stwa	%r1, [%r8 + %r9] 0x80
	.word 0xb0522e58  ! 260: UMUL_I	umul 	%r8, 0x0e58, %r24
	.word 0xa5220009  ! 261: MULScc_R	mulscc 	%r8, %r9, %r18
	.word 0xb25a2f70  ! 262: SMUL_I	smul 	%r8, 0x0f70, %r25
	.word 0x967a0009  ! 263: SDIV_R	sdiv 	%r8, %r9, %r11
	.word 0x865a2060  ! 264: SMUL_I	smul 	%r8, 0x0060, %r3
	.word 0x87a20929  ! 265: FMULs	fmuls	%f8, %f9, %f3
	.word 0x36800004  ! 266: BGE	bge,a	<label_0x4>
	.word 0xe85a29a0  ! 267: LDX_I	ldx	[%r8 + 0x09a0], %r20
	.word 0xf9220009  ! 268: STF_R	st	%f28, [%r9, %r8]
	.word 0xdc922164  ! 269: LDUHA_I	lduha	[%r8, + 0x0164] %asi, %r14
	.word 0xf07a0009  ! 270: SWAP_R	swap	%r24, [%r8 + %r9]
	.word 0xd47a235c  ! 271: SWAP_I	swap	%r10, [%r8 + 0x035c]
	.word 0xc33a0009  ! 272: STDF_R	std	%f1, [%r9, %r8]
	.word 0x1a800004  ! 273: BCC	bcc  	<label_0x4>
	.word 0x8c4a2aa4  ! 274: MULX_I	mulx 	%r8, 0x0aa4, %r6
	.word 0x0c800008  ! 275: BNEG	bneg  	<label_0x8>
	.word 0x8da20829  ! 276: FADDs	fadds	%f8, %f9, %f6
	.word 0xe68a1009  ! 277: LDUBA_R	lduba	[%r8, %r9] 0x80, %r19
	.word 0x8da20829  ! 278: FADDs	fadds	%f8, %f9, %f6
	.word 0x827222c8  ! 279: UDIV_I	udiv 	%r8, 0x02c8, %r1
	.word 0xee8a1009  ! 280: LDUBA_R	lduba	[%r8, %r9] 0x80, %r23
	.word 0x8143e050  ! 281: MEMBAR	membar	#Lookaside | #Sync 
	.word 0x8143c000  ! 282: STBAR	stbar
	.word 0x82da0009  ! 283: SMULcc_R	smulcc 	%r8, %r9, %r1
	.word 0x89222f00  ! 284: MULScc_I	mulscc 	%r8, 0x0f00, %r4
	.word 0xcc4a2844  ! 285: LDSB_I	ldsb	[%r8 + 0x0844], %r6
	.word 0x1c800008  ! 286: BPOS	bpos  	<label_0x8>
	.word 0xca022818  ! 287: LDUW_I	lduw	[%r8 + 0x0818], %r5
	.word 0xc2420009  ! 288: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0x16800004  ! 289: BGE	bge  	<label_0x4>
	.word 0xc4a22a0c  ! 290: STWA_I	stwa	%r2, [%r8 + 0x0a0c] %asi
	.word 0x02ca0004  ! 291: BRZ	brz  ,pt	%8,<label_0xa0004>
	.word 0xcc8a1009  ! 292: LDUBA_R	lduba	[%r8, %r9] 0x80, %r6
	.word 0xaba209a9  ! 293: FDIVs	fdivs	%f8, %f9, %f21
	.word 0x82720009  ! 294: UDIV_R	udiv 	%r8, %r9, %r1
	.word 0xccb223a8  ! 295: STHA_I	stha	%r6, [%r8 + 0x03a8] %asi
	.word 0xc2c22634  ! 296: LDSWA_I	ldswa	[%r8, + 0x0634] %asi, %r1
	.word 0xe8ba1009  ! 297: STDA_R	stda	%r20, [%r8 + %r9] 0x80
	.word 0x99a20929  ! 298: FMULs	fmuls	%f8, %f9, %f12
	.word 0x8c520009  ! 299: UMUL_R	umul 	%r8, %r9, %r6
	.word 0x8143e032  ! 300: MEMBAR	membar	#StoreLoad | #Lookaside | #MemIssue 
	.word 0x22800004  ! 301: BE	be,a	<label_0x4>
	.word 0x8143c000  ! 302: STBAR	stbar
	.word 0xc93a0009  ! 303: STDF_R	std	%f4, [%r9, %r8]
	.word 0x8143e00f  ! 304: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore 
	.word 0x84f20009  ! 305: UDIVcc_R	udivcc 	%r8, %r9, %r2
	.word 0xceb21009  ! 306: STHA_R	stha	%r7, [%r8 + %r9] 0x80
	.word 0xc85a0009  ! 307: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xca922dcc  ! 308: LDUHA_I	lduha	[%r8, + 0x0dcc] %asi, %r5
	.word 0xc3ea2f1c  ! 309: PREFETCHA_I	prefetcha	[%r8, + 0x0f1c] %asi, #one_read
	.word 0xc65227ac  ! 310: LDSH_I	ldsh	[%r8 + 0x07ac], %r3
	.word 0x0ec20008  ! 311: BRGEZ	brgez  ,nt	%8,<label_0x20008>
	.word 0xccca1009  ! 312: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r6
	.word 0x872227f4  ! 313: MULScc_I	mulscc 	%r8, 0x07f4, %r3
	.word 0xc4f22ae8  ! 314: STXA_I	stxa	%r2, [%r8 + 0x0ae8] %asi
	.word 0x887a0009  ! 315: SDIV_R	sdiv 	%r8, %r9, %r4
	.word 0x82fa2b34  ! 317: SDIVcc_I	sdivcc 	%r8, 0x0b34, %r1
	.word 0xd73a2f78  ! 318: STDF_I	std	%f11, [0x0f78, %r8]
	.word 0xe2b22f60  ! 319: STHA_I	stha	%r17, [%r8 + 0x0f60] %asi
	.word 0xc3e21009  ! 320: CASA_I	casa	[%r8] 0x80, %r9, %r1
	.word 0x16800004  ! 321: BGE	bge  	<label_0x4>
	.word 0x0cc20008  ! 322: BRGZ	brgz  ,nt	%8,<label_0x20008>
	.word 0xacd22bc4  ! 323: UMULcc_I	umulcc 	%r8, 0x0bc4, %r22
	.word 0xe6821009  ! 324: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r19
	.word 0x8a520009  ! 325: UMUL_R	umul 	%r8, %r9, %r5
	.word 0xcaa21009  ! 326: STWA_R	stwa	%r5, [%r8 + %r9] 0x80
	.word 0x0a800004  ! 327: BCS	bcs  	<label_0x4>
	.word 0xcde21009  ! 328: CASA_I	casa	[%r8] 0x80, %r9, %r6
	.word 0x8143e01a  ! 329: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside 
	.word 0xe89a23c0  ! 330: LDDA_I	ldda	[%r8, + 0x03c0] %asi, %r20
	.word 0x3c800008  ! 331: BPOS	bpos,a	<label_0x8>
	.word 0xd64222b0  ! 332: LDSW_I	ldsw	[%r8 + 0x02b0], %r11
	.word 0xc81a0009  ! 333: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xe7f22009  ! 334: CASXA_R	casxa	[%r8]%asi, %r9, %r19
	.word 0xc3ea2cf0  ! 335: PREFETCHA_I	prefetcha	[%r8, + 0x0cf0] %asi, #one_read
	.word 0x886a0009  ! 336: UDIVX_R	udivx 	%r8, %r9, %r4
	.word 0xfa422f2c  ! 337: LDSW_I	ldsw	[%r8 + 0x0f2c], %r29
	.word 0x8143c000  ! 338: STBAR	stbar
	.word 0x8c6a2b3c  ! 340: UDIVX_I	udivx 	%r8, 0x0b3c, %r6
	.word 0x8143e074  ! 342: MEMBAR	membar	#LoadStore | #Lookaside | #MemIssue | #Sync 
	.word 0x8143c000  ! 343: STBAR	stbar
	.word 0xc65a2700  ! 345: LDX_I	ldx	[%r8 + 0x0700], %r3
	.word 0xe3e21009  ! 346: CASA_I	casa	[%r8] 0x80, %r9, %r17
	.word 0x36800008  ! 348: BGE	bge,a	<label_0x8>
	.word 0x947222a0  ! 349: UDIV_I	udiv 	%r8, 0x02a0, %r10
	.word 0x865a26e4  ! 350: SMUL_I	smul 	%r8, 0x06e4, %r3
	.word 0xf09a1009  ! 351: LDDA_R	ldda	[%r8, %r9] 0x80, %r24
	.word 0xcde22009  ! 352: CASA_R	casa	[%r8] %asi, %r9, %r6
	.word 0xc24a2cbc  ! 353: LDSB_I	ldsb	[%r8 + 0x0cbc], %r1
	.word 0xf49a1009  ! 354: LDDA_R	ldda	[%r8, %r9] 0x80, %r26
	.word 0xcc0a2398  ! 355: LDUB_I	ldub	[%r8 + 0x0398], %r6
	.word 0xffe22009  ! 356: CASA_R	casa	[%r8] %asi, %r9, %r31
	.word 0xae6a0009  ! 357: UDIVX_R	udivx 	%r8, %r9, %r23
	.word 0xc8020009  ! 358: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0x847a2068  ! 359: SDIV_I	sdiv 	%r8, 0x0068, %r2
	.word 0x3a800008  ! 360: BCC	bcc,a	<label_0x8>
	.word 0xcdf22009  ! 361: CASXA_R	casxa	[%r8]%asi, %r9, %r6
	.word 0x8143c000  ! 362: STBAR	stbar
	.word 0xc36a21ac  ! 363: PREFETCH_I	prefetch	[%r8 + 0x01ac], #one_read
	.word 0x94fa0009  ! 364: SDIVcc_R	sdivcc 	%r8, %r9, %r10
	.word 0xeeda1009  ! 365: LDXA_R	ldxa	[%r8, %r9] 0x80, %r23
	.word 0xe84a2fc0  ! 366: LDSB_I	ldsb	[%r8 + 0x0fc0], %r20
	.word 0xf81a2910  ! 367: LDD_I	ldd	[%r8 + 0x0910], %r28
	.word 0xd6921009  ! 368: LDUHA_R	lduha	[%r8, %r9] 0x80, %r11
	.word 0x825a21a8  ! 370: SMUL_I	smul 	%r8, 0x01a8, %r1
	.word 0xb47a2cac  ! 371: SDIV_I	sdiv 	%r8, 0x0cac, %r26
	.word 0x10800004  ! 372: BA	ba  	<label_0x4>
	.word 0xd7220009  ! 373: STF_R	st	%f11, [%r9, %r8]
	.word 0xe40a29c8  ! 375: LDUB_I	ldub	[%r8 + 0x09c8], %r18
	.word 0xc4520009  ! 376: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xc6f21009  ! 377: STXA_R	stxa	%r3, [%r8 + %r9] 0x80
	.word 0x1c800008  ! 378: BPOS	bpos  	<label_0x8>
	.word 0xdca22f38  ! 379: STWA_I	stwa	%r14, [%r8 + 0x0f38] %asi
	.word 0x8fa209a9  ! 380: FDIVs	fdivs	%f8, %f9, %f7
	.word 0xc2f22370  ! 381: STXA_I	stxa	%r1, [%r8 + 0x0370] %asi
	.word 0x8143c000  ! 382: STBAR	stbar
	.word 0xc25a28f8  ! 383: LDX_I	ldx	[%r8 + 0x08f8], %r1
	.word 0xc6b21009  ! 384: STHA_R	stha	%r3, [%r8 + %r9] 0x80
	.word 0xec4a2c9c  ! 385: LDSB_I	ldsb	[%r8 + 0x0c9c], %r22
	.word 0xc4da1009  ! 386: LDXA_R	ldxa	[%r8, %r9] 0x80, %r2
	.word 0xce0a0009  ! 387: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xc6a21009  ! 388: STWA_R	stwa	%r3, [%r8 + %r9] 0x80
	.word 0xeeda1009  ! 389: LDXA_R	ldxa	[%r8, %r9] 0x80, %r23
	.word 0x88520009  ! 390: UMUL_R	umul 	%r8, %r9, %r4
	.word 0xe01a0009  ! 391: LDD_R	ldd	[%r8 + %r9], %r16
	.word 0x3e800004  ! 392: BVC	bvc,a	<label_0x4>
	.word 0xc8ca1009  ! 393: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r4
	.word 0xce7a245c  ! 394: SWAP_I	swap	%r7, [%r8 + 0x045c]
	.word 0x8e7a214c  ! 395: SDIV_I	sdiv 	%r8, 0x014c, %r7
	.word 0x8143c000  ! 396: STBAR	stbar
	.word 0xf1220009  ! 397: STF_R	st	%f24, [%r9, %r8]
	.word 0x8143e02d  ! 398: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #MemIssue 
	.word 0xc4022fb0  ! 399: LDUW_I	lduw	[%r8 + 0x0fb0], %r2
	.word 0xc87a0009  ! 400: SWAP_R	swap	%r4, [%r8 + %r9]
	.word 0xf09a22c0  ! 401: LDDA_I	ldda	[%r8, + 0x02c0] %asi, %r24
	.word 0xcbf21009  ! 402: CASXA_I	casxa	[%r8] 0x80, %r9, %r5
	.word 0xccc21009  ! 403: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r6
	.word 0xceca2f10  ! 404: LDSBA_I	ldsba	[%r8, + 0x0f10] %asi, %r7
	.word 0x8afa0009  ! 405: SDIVcc_R	sdivcc 	%r8, %r9, %r5
	.word 0x0eca0004  ! 406: BRGEZ	brgez  ,pt	%8,<label_0xa0004>
	.word 0x06800008  ! 407: BL	bl  	<label_0x8>
	.word 0x0e800008  ! 408: BVS	bvs  	<label_0x8>
	.word 0x8da20829  ! 409: FADDs	fadds	%f8, %f9, %f6
	.word 0x36800008  ! 410: BGE	bge,a	<label_0x8>
	.word 0x984a0009  ! 411: MULX_R	mulx 	%r8, %r9, %r12
	.word 0x8c6a25ec  ! 412: UDIVX_I	udivx 	%r8, 0x05ec, %r6
	.word 0x34800004  ! 413: BG	bg,a	<label_0x4>
	.word 0x8143c000  ! 414: STBAR	stbar
	.word 0x8143e01a  ! 415: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside 
	.word 0x24800004  ! 416: BLE	ble,a	<label_0x4>
	.word 0xa8da0009  ! 417: SMULcc_R	smulcc 	%r8, %r9, %r20
	.word 0xc40a2a28  ! 418: LDUB_I	ldub	[%r8 + 0x0a28], %r2
	.word 0x8143e051  ! 419: MEMBAR	membar	#LoadLoad | #Lookaside | #Sync 
	.word 0x867a0009  ! 420: SDIV_R	sdiv 	%r8, %r9, %r3
	.word 0x8143c000  ! 421: STBAR	stbar
	.word 0xc5f21009  ! 422: CASXA_I	casxa	[%r8] 0x80, %r9, %r2
	.word 0xec8a1009  ! 423: LDUBA_R	lduba	[%r8, %r9] 0x80, %r22
	.word 0xccb21009  ! 424: STHA_R	stha	%r6, [%r8 + %r9] 0x80
	.word 0xfc6a0009  ! 425: LDSTUB_R	ldstub	%r30, [%r8 + %r9]
	.word 0x0c800008  ! 426: BNEG	bneg  	<label_0x8>
	.word 0x86520009  ! 427: UMUL_R	umul 	%r8, %r9, %r3
	.word 0xc3ea2140  ! 428: PREFETCHA_I	prefetcha	[%r8, + 0x0140] %asi, #one_read
	.word 0x2ac20004  ! 429: BRNZ	brnz,a,nt	%8,<label_0x20004>
	.word 0x3a800004  ! 430: BCC	bcc,a	<label_0x4>
	.word 0x2cc20004  ! 432: BRGZ	brgz,a,nt	%8,<label_0x20004>
	.word 0x8143c000  ! 433: STBAR	stbar
	.word 0x8f222848  ! 434: MULScc_I	mulscc 	%r8, 0x0848, %r7
	.word 0xc5220009  ! 435: STF_R	st	%f2, [%r9, %r8]
	.word 0x8143e01f  ! 436: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #Lookaside 
	.word 0x86f22d3c  ! 437: UDIVcc_I	udivcc 	%r8, 0x0d3c, %r3
	.word 0x83a20929  ! 438: FMULs	fmuls	%f8, %f9, %f1
	.word 0x8cd20009  ! 439: UMULcc_R	umulcc 	%r8, %r9, %r6
	.word 0xe24a23a8  ! 440: LDSB_I	ldsb	[%r8 + 0x03a8], %r17
	.word 0xe4ba1009  ! 441: STDA_R	stda	%r18, [%r8 + %r9] 0x80
	.word 0xf4c21009  ! 442: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r26
	.word 0x8143e058  ! 443: MEMBAR	membar	#StoreStore | #Lookaside | #Sync 
	.word 0xc2ea1009  ! 444: LDSTUBA_R	ldstuba	%r1, [%r8 + %r9] 0x80
	.word 0xa8fa2b30  ! 445: SDIVcc_I	sdivcc 	%r8, 0x0b30, %r20
	.word 0xc68a2388  ! 446: LDUBA_I	lduba	[%r8, + 0x0388] %asi, %r3
	.word 0xcc821009  ! 447: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r6
	.word 0x3a800008  ! 448: BCC	bcc,a	<label_0x8>
	.word 0x0e800004  ! 449: BVS	bvs  	<label_0x4>
	.word 0xc8ca22b4  ! 450: LDSBA_I	ldsba	[%r8, + 0x02b4] %asi, %r4
	.word 0xcb3a0009  ! 451: STDF_R	std	%f5, [%r9, %r8]
	.word 0x8143e06e  ! 452: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #MemIssue | #Sync 
	.word 0x8a5a0009  ! 453: SMUL_R	smul 	%r8, %r9, %r5
	.word 0xc33a0009  ! 454: STDF_R	std	%f1, [%r9, %r8]
	.word 0x8143c000  ! 455: STBAR	stbar
	.word 0x8143c000  ! 456: STBAR	stbar
	.word 0x8143c000  ! 457: STBAR	stbar
	.word 0x98520009  ! 458: UMUL_R	umul 	%r8, %r9, %r12
	.word 0x8143e058  ! 459: MEMBAR	membar	#StoreStore | #Lookaside | #Sync 
	.word 0xc3ea200c  ! 460: PREFETCHA_I	prefetcha	[%r8, + 0x000c] %asi, #one_read
	.word 0x30800008  ! 461: BA	ba,a	<label_0x8>
	.word 0x08800008  ! 462: BLEU	bleu  	<label_0x8>
	.word 0xce020009  ! 463: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0x945a0009  ! 464: SMUL_R	smul 	%r8, %r9, %r10
	.word 0xc2da1009  ! 465: LDXA_R	ldxa	[%r8, %r9] 0x80, %r1
	.word 0xe8aa1009  ! 467: STBA_R	stba	%r20, [%r8 + %r9] 0x80
	.word 0x9afa0009  ! 468: SDIVcc_R	sdivcc 	%r8, %r9, %r13
	.word 0xc4f21009  ! 469: STXA_R	stxa	%r2, [%r8 + %r9] 0x80
	.word 0xf8ba1009  ! 472: STDA_R	stda	%r28, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 473: STBAR	stbar
	.word 0x8143c000  ! 474: STBAR	stbar
	.word 0xd8da2c00  ! 475: LDXA_I	ldxa	[%r8, + 0x0c00] %asi, %r12
	.word 0xd7220009  ! 476: STF_R	st	%f11, [%r9, %r8]
	.word 0x9f6a0009  ! 477: SDIVX_R	sdivx	%r8, %r9, %r15
	.word 0xa4522148  ! 478: UMUL_I	umul 	%r8, 0x0148, %r18
	.word 0xc5f21009  ! 479: CASXA_I	casxa	[%r8] 0x80, %r9, %r2
	.word 0xc4f21009  ! 480: STXA_R	stxa	%r2, [%r8 + %r9] 0x80
	.word 0x87a20829  ! 481: FADDs	fadds	%f8, %f9, %f3
	.word 0xe41a2150  ! 482: LDD_I	ldd	[%r8 + 0x0150], %r18
	.word 0x8d22210c  ! 483: MULScc_I	mulscc 	%r8, 0x010c, %r6
	.word 0xce422ac4  ! 484: LDSW_I	ldsw	[%r8 + 0x0ac4], %r7
	.word 0xf4ba24f8  ! 485: STDA_I	stda	%r26, [%r8 + 0x04f8] %asi
	.word 0xc48a1009  ! 486: LDUBA_R	lduba	[%r8, %r9] 0x80, %r2
	.word 0x86da0009  ! 487: SMULcc_R	smulcc 	%r8, %r9, %r3
	.word 0xc2aa2670  ! 488: STBA_I	stba	%r1, [%r8 + 0x0670] %asi
	.word 0x8143c000  ! 489: STBAR	stbar
	.word 0x8143e02d  ! 490: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #MemIssue 
	.word 0xc4120009  ! 491: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xccfa2b60  ! 492: SWAPA_I	swapa	%r6, [%r8 + 0x0b60] %asi
	.word 0xa1a209a9  ! 493: FDIVs	fdivs	%f8, %f9, %f16
	.word 0xca6a2e0c  ! 494: LDSTUB_I	ldstub	%r5, [%r8 + 0x0e0c]
	.word 0xe6d21009  ! 495: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r19
	.word 0xb8520009  ! 496: UMUL_R	umul 	%r8, %r9, %r28
	.word 0xc3ea2540  ! 497: PREFETCHA_I	prefetcha	[%r8, + 0x0540] %asi, #one_read
	.word 0x12800008  ! 498: BNE	bne  	<label_0x8>
	.word 0xc67a28a4  ! 499: SWAP_I	swap	%r3, [%r8 + 0x08a4]
	.word 0xbad20009  ! 500: UMULcc_R	umulcc 	%r8, %r9, %r29
	.word 0x8143e006  ! 501: MEMBAR	membar	#StoreLoad | #LoadStore 
	.word 0xeeda1009  ! 502: LDXA_R	ldxa	[%r8, %r9] 0x80, %r23
	.word 0x8c4a2b0c  ! 503: MULX_I	mulx 	%r8, 0x0b0c, %r6
	.word 0x8143c000  ! 504: STBAR	stbar
	.word 0x89a20829  ! 505: FADDs	fadds	%f8, %f9, %f4
	.word 0x824a212c  ! 506: MULX_I	mulx 	%r8, 0x012c, %r1
	.word 0xf7220009  ! 507: STF_R	st	%f27, [%r9, %r8]
	.word 0xca7a2abc  ! 508: SWAP_I	swap	%r5, [%r8 + 0x0abc]
	.word 0xd9222ef4  ! 509: STF_I	st	%f12, [0x0ef4, %r8]
	.word 0x8143e04d  ! 510: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Sync 
	.word 0xb7a208a9  ! 511: FSUBs	fsubs	%f8, %f9, %f27
	.word 0xc3ea2020  ! 512: PREFETCHA_I	prefetcha	[%r8, + 0x0020] %asi, #one_read
	.word 0x866a28b0  ! 513: UDIVX_I	udivx 	%r8, 0x08b0, %r3
	.word 0xfc921009  ! 514: LDUHA_R	lduha	[%r8, %r9] 0x80, %r30
	.word 0xcc821009  ! 515: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r6
	.word 0xc28a28e0  ! 516: LDUBA_I	lduba	[%r8, + 0x08e0] %asi, %r1
	.word 0x8143c000  ! 517: STBAR	stbar
	.word 0x88d20009  ! 518: UMULcc_R	umulcc 	%r8, %r9, %r4
	.word 0xe0ba1009  ! 519: STDA_R	stda	%r16, [%r8 + %r9] 0x80
	.word 0xc8ea1009  ! 520: LDSTUBA_R	ldstuba	%r4, [%r8 + %r9] 0x80
	.word 0xc2d226d8  ! 521: LDSHA_I	ldsha	[%r8, + 0x06d8] %asi, %r1
	.word 0xc4b21009  ! 522: STHA_R	stha	%r2, [%r8 + %r9] 0x80
	.word 0xea922484  ! 523: LDUHA_I	lduha	[%r8, + 0x0484] %asi, %r21
	.word 0xc6ea1009  ! 524: LDSTUBA_R	ldstuba	%r3, [%r8 + %r9] 0x80
	.word 0xc3ea29a4  ! 525: PREFETCHA_I	prefetcha	[%r8, + 0x09a4] %asi, #one_read
	.word 0x8143e017  ! 527: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside 
	.word 0x885a0009  ! 528: SMUL_R	smul 	%r8, %r9, %r4
	.word 0x825a0009  ! 529: SMUL_R	smul 	%r8, %r9, %r1
	.word 0x8e7a0009  ! 530: SDIV_R	sdiv 	%r8, %r9, %r7
	.word 0x8143e04f  ! 531: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #Sync 
	.word 0xf4922298  ! 532: LDUHA_I	lduha	[%r8, + 0x0298] %asi, %r26
	.word 0xb0fa0009  ! 533: SDIVcc_R	sdivcc 	%r8, %r9, %r24
	.word 0xc4ea1009  ! 535: LDSTUBA_R	ldstuba	%r2, [%r8 + %r9] 0x80
	.word 0xeb220009  ! 536: STF_R	st	%f21, [%r9, %r8]
	.word 0xfcfa26a4  ! 537: SWAPA_I	swapa	%r30, [%r8 + 0x06a4] %asi
	.word 0x06800004  ! 538: BL	bl  	<label_0x4>
	.word 0xc9220009  ! 539: STF_R	st	%f4, [%r9, %r8]
	.word 0xc8c22e0c  ! 540: LDSWA_I	ldswa	[%r8, + 0x0e0c] %asi, %r4
	.word 0xc8f21009  ! 541: STXA_R	stxa	%r4, [%r8 + %r9] 0x80
	.word 0xc5f22009  ! 542: CASXA_R	casxa	[%r8]%asi, %r9, %r2
	.word 0xc3ea28e8  ! 543: PREFETCHA_I	prefetcha	[%r8, + 0x08e8] %asi, #one_read
	.word 0x8143c000  ! 544: STBAR	stbar
	.word 0xc2ca2e50  ! 546: LDSBA_I	ldsba	[%r8, + 0x0e50] %asi, %r1
	.word 0x82522870  ! 547: UMUL_I	umul 	%r8, 0x0870, %r1
	.word 0xc33a0009  ! 548: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc8420009  ! 549: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0x8143e020  ! 550: MEMBAR	membar	#MemIssue 
	.word 0xc6921009  ! 551: LDUHA_R	lduha	[%r8, %r9] 0x80, %r3
	.word 0x85a208a9  ! 552: FSUBs	fsubs	%f8, %f9, %f2
	.word 0xc4ea1009  ! 553: LDSTUBA_R	ldstuba	%r2, [%r8 + %r9] 0x80
	.word 0x87a208a9  ! 554: FSUBs	fsubs	%f8, %f9, %f3
	.word 0xecba2028  ! 555: STDA_I	stda	%r22, [%r8 + 0x0028] %asi
	.word 0xcb3a0009  ! 556: STDF_R	std	%f5, [%r9, %r8]
	.word 0x8143c000  ! 557: STBAR	stbar
	.word 0x8143e038  ! 558: MEMBAR	membar	#StoreStore | #Lookaside | #MemIssue 
	.word 0xccb22738  ! 559: STHA_I	stha	%r6, [%r8 + 0x0738] %asi
	.word 0x2eca0008  ! 560: BRGEZ	brgez,a,pt	%8,<label_0xa0008>
	.word 0xc4ba1009  ! 561: STDA_R	stda	%r2, [%r8 + %r9] 0x80
	.word 0xc36a2b10  ! 562: PREFETCH_I	prefetch	[%r8 + 0x0b10], #one_read
	.word 0x86f20009  ! 563: UDIVcc_R	udivcc 	%r8, %r9, %r3
	.word 0xa9222834  ! 564: MULScc_I	mulscc 	%r8, 0x0834, %r20
	.word 0xf0a21009  ! 565: STWA_R	stwa	%r24, [%r8 + %r9] 0x80
	.word 0x22ca0004  ! 566: BRZ	brz,a,pt	%8,<label_0xa0004>
	.word 0xefe21009  ! 567: CASA_I	casa	[%r8] 0x80, %r9, %r23
	.word 0x8143c000  ! 568: STBAR	stbar
	.word 0x0a800004  ! 569: BCS	bcs  	<label_0x4>
	.word 0xf8da1009  ! 570: LDXA_R	ldxa	[%r8, %r9] 0x80, %r28
	.word 0x8cfa0009  ! 571: SDIVcc_R	sdivcc 	%r8, %r9, %r6
	.word 0x8143c000  ! 572: STBAR	stbar
	.word 0xc26a2b7c  ! 573: LDSTUB_I	ldstub	%r1, [%r8 + 0x0b7c]
	.word 0x8a522a58  ! 574: UMUL_I	umul 	%r8, 0x0a58, %r5
	.word 0xccb21009  ! 575: STHA_R	stha	%r6, [%r8 + %r9] 0x80
	.word 0xc68a21e8  ! 576: LDUBA_I	lduba	[%r8, + 0x01e8] %asi, %r3
	.word 0xdc520009  ! 577: LDSH_R	ldsh	[%r8 + %r9], %r14
	.word 0xca6a2124  ! 578: LDSTUB_I	ldstub	%r5, [%r8 + 0x0124]
	.word 0x24800004  ! 579: BLE	ble,a	<label_0x4>
	.word 0x84520009  ! 580: UMUL_R	umul 	%r8, %r9, %r2
	.word 0xcc020009  ! 581: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0x06ca0004  ! 582: BRLZ	brlz  ,pt	%8,<label_0xa0004>
	.word 0xc3ea285c  ! 583: PREFETCHA_I	prefetcha	[%r8, + 0x085c] %asi, #one_read
	.word 0xfd3a0009  ! 584: STDF_R	std	%f30, [%r9, %r8]
	.word 0x34800008  ! 585: BG	bg,a	<label_0x8>
	.word 0x8143c000  ! 586: STBAR	stbar
	.word 0x8ed22390  ! 587: UMULcc_I	umulcc 	%r8, 0x0390, %r7
	.word 0xcbe22009  ! 588: CASA_R	casa	[%r8] %asi, %r9, %r5
	.word 0xce420009  ! 590: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xc6b21009  ! 591: STHA_R	stha	%r3, [%r8 + %r9] 0x80
	.word 0xe8aa2658  ! 593: STBA_I	stba	%r20, [%r8 + 0x0658] %asi
	.word 0xf85a28c0  ! 594: LDX_I	ldx	[%r8 + 0x08c0], %r28
	.word 0xccda1009  ! 595: LDXA_R	ldxa	[%r8, %r9] 0x80, %r6
	.word 0xcb220009  ! 596: STF_R	st	%f5, [%r9, %r8]
	.word 0xfb3a2608  ! 597: STDF_I	std	%f29, [0x0608, %r8]
	.word 0xc3ea2b78  ! 598: PREFETCHA_I	prefetcha	[%r8, + 0x0b78] %asi, #one_read
	.word 0xc7220009  ! 599: STF_R	st	%f3, [%r9, %r8]
	.word 0xd45a25d0  ! 600: LDX_I	ldx	[%r8 + 0x05d0], %r10
	.word 0xf7e22009  ! 601: CASA_R	casa	[%r8] %asi, %r9, %r27
	.word 0x844a0009  ! 602: MULX_R	mulx 	%r8, %r9, %r2
	.word 0xcc9a1009  ! 603: LDDA_R	ldda	[%r8, %r9] 0x80, %r6
	.word 0x34800008  ! 604: BG	bg,a	<label_0x8>
	.word 0x985a0009  ! 605: SMUL_R	smul 	%r8, %r9, %r12
	.word 0x865a2210  ! 606: SMUL_I	smul 	%r8, 0x0210, %r3
	.word 0xc33a0009  ! 607: STDF_R	std	%f1, [%r9, %r8]
	.word 0x8143c000  ! 608: STBAR	stbar
	.word 0xb0722918  ! 609: UDIV_I	udiv 	%r8, 0x0918, %r24
	.word 0xba4a2e78  ! 610: MULX_I	mulx 	%r8, 0x0e78, %r29
	.word 0x85a208a9  ! 611: FSUBs	fsubs	%f8, %f9, %f2
	.word 0x87a209a9  ! 612: FDIVs	fdivs	%f8, %f9, %f3
	.word 0xc3ea2918  ! 613: PREFETCHA_I	prefetcha	[%r8, + 0x0918] %asi, #one_read
	.word 0x86720009  ! 614: UDIV_R	udiv 	%r8, %r9, %r3
	.word 0x82520009  ! 615: UMUL_R	umul 	%r8, %r9, %r1
	.word 0xcef21009  ! 616: STXA_R	stxa	%r7, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 617: STBAR	stbar
	.word 0x8143c000  ! 618: STBAR	stbar
	.word 0x06ca0004  ! 619: BRLZ	brlz  ,pt	%8,<label_0xa0004>
	.word 0xc6c21009  ! 620: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r3
	.word 0xc6da2aa8  ! 621: LDXA_I	ldxa	[%r8, + 0x0aa8] %asi, %r3
	.word 0xb6f20009  ! 622: UDIVcc_R	udivcc 	%r8, %r9, %r27
	.word 0xf9220009  ! 623: STF_R	st	%f28, [%r9, %r8]
	.word 0xae7a0009  ! 624: SDIV_R	sdiv 	%r8, %r9, %r23
	.word 0x8143e01c  ! 625: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside 
	.word 0xc3ea2548  ! 626: PREFETCHA_I	prefetcha	[%r8, + 0x0548] %asi, #one_read
	.word 0xc6020009  ! 627: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0x8143c000  ! 628: STBAR	stbar
	.word 0xc8020009  ! 629: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0x1e800004  ! 630: BVC	bvc  	<label_0x4>
	.word 0x8143e00a  ! 631: MEMBAR	membar	#StoreLoad | #StoreStore 
	.word 0x8143c000  ! 632: STBAR	stbar
	.word 0x8cda2b5c  ! 633: SMULcc_I	smulcc 	%r8, 0x0b5c, %r6
	.word 0x89a20829  ! 634: FADDs	fadds	%f8, %f9, %f4
	.word 0x8cda2714  ! 635: SMULcc_I	smulcc 	%r8, 0x0714, %r6
	.word 0x30800008  ! 636: BA	ba,a	<label_0x8>
	.word 0xda122e2c  ! 637: LDUH_I	lduh	[%r8 + 0x0e2c], %r13
	.word 0xca520009  ! 638: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0x3a800008  ! 639: BCC	bcc,a	<label_0x8>
	.word 0x887a0009  ! 640: SDIV_R	sdiv 	%r8, %r9, %r4
	.word 0xc3ea2788  ! 641: PREFETCHA_I	prefetcha	[%r8, + 0x0788] %asi, #one_read
	.word 0xe0821009  ! 642: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r16
	.word 0x8ed22dc8  ! 644: UMULcc_I	umulcc 	%r8, 0x0dc8, %r7
	.word 0x8a522578  ! 645: UMUL_I	umul 	%r8, 0x0578, %r5
	.word 0x8afa0009  ! 646: SDIVcc_R	sdivcc 	%r8, %r9, %r5
	.word 0xc6a22d3c  ! 647: STWA_I	stwa	%r3, [%r8 + 0x0d3c] %asi
	.word 0xc8ba2518  ! 648: STDA_I	stda	%r4, [%r8 + 0x0518] %asi
	.word 0xc3222c80  ! 649: STF_I	st	%f1, [0x0c80, %r8]
	.word 0xc4ba1009  ! 650: STDA_R	stda	%r2, [%r8 + %r9] 0x80
	.word 0xf06a2040  ! 651: LDSTUB_I	ldstub	%r24, [%r8 + 0x0040]
	.word 0x8143c000  ! 652: STBAR	stbar
	.word 0xe09a1009  ! 655: LDDA_R	ldda	[%r8, %r9] 0x80, %r16
	.word 0xf4ba1009  ! 656: STDA_R	stda	%r26, [%r8 + %r9] 0x80
	.word 0xdcc229f4  ! 657: LDSWA_I	ldswa	[%r8, + 0x09f4] %asi, %r14
	.word 0xcbe22009  ! 658: CASA_R	casa	[%r8] %asi, %r9, %r5
	.word 0xc36a268c  ! 659: PREFETCH_I	prefetch	[%r8 + 0x068c], #one_read
	.word 0x846a0009  ! 660: UDIVX_R	udivx 	%r8, %r9, %r2
	.word 0xecc22038  ! 661: LDSWA_I	ldswa	[%r8, + 0x0038] %asi, %r22
	.word 0x04800004  ! 662: BLE	ble  	<label_0x4>
	.word 0x8143e012  ! 663: MEMBAR	membar	#StoreLoad | #Lookaside 
	.word 0x824a0009  ! 664: MULX_R	mulx 	%r8, %r9, %r1
	.word 0xc2821009  ! 665: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r1
	.word 0x2e800004  ! 666: BVS	bvs,a	<label_0x4>
	.word 0xc53a2858  ! 667: STDF_I	std	%f2, [0x0858, %r8]
	.word 0xdc5a2018  ! 670: LDX_I	ldx	[%r8 + 0x0018], %r14
	.word 0x8d220009  ! 671: MULScc_R	mulscc 	%r8, %r9, %r6
	.word 0x9c6a258c  ! 672: UDIVX_I	udivx 	%r8, 0x058c, %r14
	.word 0x8143c000  ! 673: STBAR	stbar
	.word 0xd68a2fb0  ! 674: LDUBA_I	lduba	[%r8, + 0x0fb0] %asi, %r11
	.word 0xb0fa0009  ! 675: SDIVcc_R	sdivcc 	%r8, %r9, %r24
	.word 0x2a800008  ! 676: BCS	bcs,a	<label_0x8>
	.word 0xc8a21009  ! 677: STWA_R	stwa	%r4, [%r8 + %r9] 0x80
	.word 0xc36a2968  ! 678: PREFETCH_I	prefetch	[%r8 + 0x0968], #one_read
	.word 0xe00a2720  ! 679: LDUB_I	ldub	[%r8 + 0x0720], %r16
	.word 0x10800008  ! 680: BA	ba  	<label_0x8>
	.word 0x8143c000  ! 681: STBAR	stbar
	.word 0x8652281c  ! 682: UMUL_I	umul 	%r8, 0x081c, %r3
	.word 0xc87a2960  ! 683: SWAP_I	swap	%r4, [%r8 + 0x0960]
	.word 0x886a0009  ! 684: UDIVX_R	udivx 	%r8, %r9, %r4
	.word 0xc48a2d3c  ! 685: LDUBA_I	lduba	[%r8, + 0x0d3c] %asi, %r2
	.word 0xccba1009  ! 686: STDA_R	stda	%r6, [%r8 + %r9] 0x80
	.word 0xca5a2d90  ! 687: LDX_I	ldx	[%r8 + 0x0d90], %r5
	.word 0x944a0009  ! 688: MULX_R	mulx 	%r8, %r9, %r10
	.word 0xc8aa28fc  ! 689: STBA_I	stba	%r4, [%r8 + 0x08fc] %asi
	.word 0xf482237c  ! 690: LDUWA_I	lduwa	[%r8, + 0x037c] %asi, %r26
	.word 0x84d22418  ! 691: UMULcc_I	umulcc 	%r8, 0x0418, %r2
	.word 0x8c522b68  ! 692: UMUL_I	umul 	%r8, 0x0b68, %r6
	.word 0xa5a208a9  ! 693: FSUBs	fsubs	%f8, %f9, %f18
	.word 0xd4ca1009  ! 694: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r10
	.word 0x8e722234  ! 695: UDIV_I	udiv 	%r8, 0x0234, %r7
	.word 0xc6fa2f68  ! 696: SWAPA_I	swapa	%r3, [%r8 + 0x0f68] %asi
	.word 0xc3ea23a8  ! 697: PREFETCHA_I	prefetcha	[%r8, + 0x03a8] %asi, #one_read
	.word 0xc2f22fd0  ! 698: STXA_I	stxa	%r1, [%r8 + 0x0fd0] %asi
	.word 0x96fa0009  ! 699: SDIVcc_R	sdivcc 	%r8, %r9, %r11
	.word 0x8143e05d  ! 700: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0xae6a0009  ! 701: UDIVX_R	udivx 	%r8, %r9, %r23
	.word 0xf0ba2400  ! 702: STDA_I	stda	%r24, [%r8 + 0x0400] %asi
	.word 0xcc42253c  ! 703: LDSW_I	ldsw	[%r8 + 0x053c], %r6
	.word 0xfcda2fd8  ! 704: LDXA_I	ldxa	[%r8, + 0x0fd8] %asi, %r30
	.word 0x8143c000  ! 705: STBAR	stbar
	.word 0xc67a0009  ! 706: SWAP_R	swap	%r3, [%r8 + %r9]
	.word 0x8143e064  ! 707: MEMBAR	membar	#LoadStore | #MemIssue | #Sync 
	.word 0xc26a23e0  ! 708: LDSTUB_I	ldstub	%r1, [%r8 + 0x03e0]
	.word 0x876a20e4  ! 709: SDIVX_I	sdivx	%r8, 0x00e4, %r3
	.word 0xc4ea1009  ! 710: LDSTUBA_R	ldstuba	%r2, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 711: STBAR	stbar
	.word 0xc3ea205c  ! 712: PREFETCHA_I	prefetcha	[%r8, + 0x005c] %asi, #one_read
	.word 0x83a208a9  ! 713: FSUBs	fsubs	%f8, %f9, %f1
	.word 0xe0c22f8c  ! 714: LDSWA_I	ldswa	[%r8, + 0x0f8c] %asi, %r16
	.word 0xb6fa2284  ! 715: SDIVcc_I	sdivcc 	%r8, 0x0284, %r27
	.word 0xcaea1009  ! 716: LDSTUBA_R	ldstuba	%r5, [%r8 + %r9] 0x80
	.word 0xc4822a7c  ! 717: LDUWA_I	lduwa	[%r8, + 0x0a7c] %asi, %r2
	.word 0xb8720009  ! 718: UDIV_R	udiv 	%r8, %r9, %r28
	.word 0xc33a0009  ! 719: STDF_R	std	%f1, [%r9, %r8]
	.word 0xae722360  ! 720: UDIV_I	udiv 	%r8, 0x0360, %r23
	.word 0xc4aa1009  ! 721: STBA_R	stba	%r2, [%r8 + %r9] 0x80
	.word 0xc4ba25a0  ! 722: STDA_I	stda	%r2, [%r8 + 0x05a0] %asi
	.word 0xc4da1009  ! 724: LDXA_R	ldxa	[%r8, %r9] 0x80, %r2
	.word 0xaeda0009  ! 725: SMULcc_R	smulcc 	%r8, %r9, %r23
	.word 0x02ca0004  ! 726: BRZ	brz  ,pt	%8,<label_0xa0004>
	.word 0x9fa20829  ! 727: FADDs	fadds	%f8, %f9, %f15
	.word 0xc8520009  ! 728: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xd4da27e8  ! 729: LDXA_I	ldxa	[%r8, + 0x07e8] %asi, %r10
	.word 0xdf3a0009  ! 730: STDF_R	std	%f15, [%r9, %r8]
	.word 0xf32229a8  ! 731: STF_I	st	%f25, [0x09a8, %r8]
	.word 0xc84a0009  ! 732: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0x0e800008  ! 733: BVS	bvs  	<label_0x8>
	.word 0xfa5a0009  ! 734: LDX_R	ldx	[%r8 + %r9], %r29
	.word 0xa07a2548  ! 735: SDIV_I	sdiv 	%r8, 0x0548, %r16
	.word 0xe41a2290  ! 736: LDD_I	ldd	[%r8 + 0x0290], %r18
	.word 0xc36a2a98  ! 737: PREFETCH_I	prefetch	[%r8 + 0x0a98], #one_read
	.word 0x0a800008  ! 738: BCS	bcs  	<label_0x8>
	.word 0x9fa209a9  ! 739: FDIVs	fdivs	%f8, %f9, %f15
	.word 0x1a800004  ! 740: BCC	bcc  	<label_0x4>
	.word 0xdff21009  ! 741: CASXA_I	casxa	[%r8] 0x80, %r9, %r15
	.word 0xea120009  ! 742: LDUH_R	lduh	[%r8 + %r9], %r21
	.word 0x8ba20929  ! 743: FMULs	fmuls	%f8, %f9, %f5
	.word 0xc49a1009  ! 744: LDDA_R	ldda	[%r8, %r9] 0x80, %r2
	.word 0x8143c000  ! 745: STBAR	stbar
	.word 0x40000008  ! 746: CALL	call	disp30_8
	.word 0xee1229ac  ! 747: LDUH_I	lduh	[%r8 + 0x09ac], %r23
	.word 0xf68a1009  ! 748: LDUBA_R	lduba	[%r8, %r9] 0x80, %r27
	.word 0xc4120009  ! 749: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0x8d222274  ! 750: MULScc_I	mulscc 	%r8, 0x0274, %r6
	.word 0x87a20929  ! 751: FMULs	fmuls	%f8, %f9, %f3
	.word 0xd4ea2328  ! 752: LDSTUBA_I	ldstuba	%r10, [%r8 + 0x0328] %asi
	.word 0x8ef22050  ! 753: UDIVcc_I	udivcc 	%r8, 0x0050, %r7
	.word 0xb64a0009  ! 754: MULX_R	mulx 	%r8, %r9, %r27
	.word 0x16800008  ! 755: BGE	bge  	<label_0x8>
	.word 0xdd3a0009  ! 756: STDF_R	std	%f14, [%r9, %r8]
	.word 0xa8da2ba4  ! 757: SMULcc_I	smulcc 	%r8, 0x0ba4, %r20
	.word 0xdc1a0009  ! 758: LDD_R	ldd	[%r8 + %r9], %r14
	.word 0xc5f22009  ! 759: CASXA_R	casxa	[%r8]%asi, %r9, %r2
	.word 0xc3ea2530  ! 760: PREFETCHA_I	prefetcha	[%r8, + 0x0530] %asi, #one_read
	.word 0x8d6a2a24  ! 761: SDIVX_I	sdivx	%r8, 0x0a24, %r6
	.word 0x8143e024  ! 762: MEMBAR	membar	#LoadStore | #MemIssue 
	.word 0xc4422330  ! 763: LDSW_I	ldsw	[%r8 + 0x0330], %r2
	.word 0xcb220009  ! 764: STF_R	st	%f5, [%r9, %r8]
	.word 0xb9a20829  ! 765: FADDs	fadds	%f8, %f9, %f28
	.word 0x02800004  ! 766: BE	be  	<label_0x4>
	.word 0x867a0009  ! 767: SDIV_R	sdiv 	%r8, %r9, %r3
	.word 0xcaaa1009  ! 768: STBA_R	stba	%r5, [%r8 + %r9] 0x80
	.word 0xfd3a2c48  ! 769: STDF_I	std	%f30, [0x0c48, %r8]
	.word 0xd8b21009  ! 770: STHA_R	stha	%r12, [%r8 + %r9] 0x80
	.word 0xceb223bc  ! 771: STHA_I	stha	%r7, [%r8 + 0x03bc] %asi
	.word 0x8143c000  ! 772: STBAR	stbar
	.word 0x8143e00e  ! 773: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore 
	.word 0xf4ba1009  ! 774: STDA_R	stda	%r26, [%r8 + %r9] 0x80
	.word 0x85a20929  ! 775: FMULs	fmuls	%f8, %f9, %f2
	.word 0x85220009  ! 776: MULScc_R	mulscc 	%r8, %r9, %r2
	.word 0xcb3a2468  ! 777: STDF_I	std	%f5, [0x0468, %r8]
	.word 0x8143e044  ! 778: MEMBAR	membar	#LoadStore | #Sync 
	.word 0x30800004  ! 779: BA	ba,a	<label_0x4>
	.word 0xd8c22520  ! 780: LDSWA_I	ldswa	[%r8, + 0x0520] %asi, %r12
	.word 0xcc520009  ! 781: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xe4aa20c8  ! 782: STBA_I	stba	%r18, [%r8 + 0x00c8] %asi
	.word 0x8da20929  ! 783: FMULs	fmuls	%f8, %f9, %f6
	.word 0xc36a2f28  ! 784: PREFETCH_I	prefetch	[%r8 + 0x0f28], #one_read
	.word 0x8143c000  ! 785: STBAR	stbar
	.word 0x0cca0004  ! 786: BRGZ	brgz  ,pt	%8,<label_0xa0004>
	.word 0xc2b21009  ! 787: STHA_R	stha	%r1, [%r8 + %r9] 0x80
	.word 0xf13a0009  ! 788: STDF_R	std	%f24, [%r9, %r8]
	.word 0xd81a0009  ! 790: LDD_R	ldd	[%r8 + %r9], %r12
	.word 0xeb3a0009  ! 791: STDF_R	std	%f21, [%r9, %r8]
	.word 0x8143e053  ! 792: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside | #Sync 
	.word 0xd41a0009  ! 793: LDD_R	ldd	[%r8 + %r9], %r10
	.word 0x8fa20829  ! 794: FADDs	fadds	%f8, %f9, %f7
	.word 0x0a800004  ! 796: BCS	bcs  	<label_0x4>
	.word 0xcd220009  ! 797: STF_R	st	%f6, [%r9, %r8]
	.word 0xee6a2384  ! 798: LDSTUB_I	ldstub	%r23, [%r8 + 0x0384]
	.word 0x2e800008  ! 799: BVS	bvs,a	<label_0x8>
	.word 0xc36a29d0  ! 800: PREFETCH_I	prefetch	[%r8 + 0x09d0], #one_read
	.word 0x89a20829  ! 801: FADDs	fadds	%f8, %f9, %f4
	.word 0x8143c000  ! 802: STBAR	stbar
	.word 0xc66a0009  ! 804: LDSTUB_R	ldstub	%r3, [%r8 + %r9]
	.word 0xc4fa1009  ! 805: SWAPA_R	swapa	%r2, [%r8 + %r9] 0x80
	.word 0xab220009  ! 806: MULScc_R	mulscc 	%r8, %r9, %r21
	.word 0xce822014  ! 807: LDUWA_I	lduwa	[%r8, + 0x0014] %asi, %r7
	.word 0xd6f22d20  ! 808: STXA_I	stxa	%r11, [%r8 + 0x0d20] %asi
	.word 0xe81a29f0  ! 810: LDD_I	ldd	[%r8 + 0x09f0], %r20
	.word 0xc41229a8  ! 811: LDUH_I	lduh	[%r8 + 0x09a8], %r2
	.word 0x8143c000  ! 812: STBAR	stbar
	.word 0xc40a2f9c  ! 813: LDUB_I	ldub	[%r8 + 0x0f9c], %r2
	.word 0xc6020009  ! 814: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0x0c800004  ! 815: BNEG	bneg  	<label_0x4>
	.word 0x867a0009  ! 816: SDIV_R	sdiv 	%r8, %r9, %r3
	.word 0x89a209a9  ! 817: FDIVs	fdivs	%f8, %f9, %f4
	.word 0x0e800008  ! 818: BVS	bvs  	<label_0x8>
	.word 0x8af222bc  ! 819: UDIVcc_I	udivcc 	%r8, 0x02bc, %r5
	.word 0x8da209a9  ! 820: FDIVs	fdivs	%f8, %f9, %f6
	.word 0x98520009  ! 821: UMUL_R	umul 	%r8, %r9, %r12
	.word 0xc8fa2adc  ! 822: SWAPA_I	swapa	%r4, [%r8 + 0x0adc] %asi
	.word 0xce82225c  ! 823: LDUWA_I	lduwa	[%r8, + 0x025c] %asi, %r7
	.word 0xc3ea2c38  ! 824: PREFETCHA_I	prefetcha	[%r8, + 0x0c38] %asi, #one_read
	.word 0xf3220009  ! 825: STF_R	st	%f25, [%r9, %r8]
	.word 0xaef22344  ! 827: UDIVcc_I	udivcc 	%r8, 0x0344, %r23
	.word 0xd87a2570  ! 828: SWAP_I	swap	%r12, [%r8 + 0x0570]
	.word 0xe09a2a98  ! 829: LDDA_I	ldda	[%r8, + 0x0a98] %asi, %r16
	.word 0xc6aa1009  ! 831: STBA_R	stba	%r3, [%r8 + %r9] 0x80
	.word 0x886a266c  ! 832: UDIVX_I	udivx 	%r8, 0x066c, %r4
	.word 0x88522580  ! 833: UMUL_I	umul 	%r8, 0x0580, %r4
	.word 0x856a2d88  ! 834: SDIVX_I	sdivx	%r8, 0x0d88, %r2
	.word 0xc6522fc8  ! 835: LDSH_I	ldsh	[%r8 + 0x0fc8], %r3
	.word 0x8cfa0009  ! 836: SDIVcc_R	sdivcc 	%r8, %r9, %r6
	.word 0x8c6a0009  ! 837: UDIVX_R	udivx 	%r8, %r9, %r6
	.word 0xc4120009  ! 838: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xb36a0009  ! 839: SDIVX_R	sdivx	%r8, %r9, %r25
	.word 0x846a0009  ! 840: UDIVX_R	udivx 	%r8, %r9, %r2
	.word 0xca9227d0  ! 841: LDUHA_I	lduha	[%r8, + 0x07d0] %asi, %r5
	.word 0xc53a0009  ! 842: STDF_R	std	%f2, [%r9, %r8]
	.word 0x18800004  ! 843: BGU	bgu  	<label_0x4>
	.word 0x12800004  ! 844: BNE	bne  	<label_0x4>
	.word 0x9ef20009  ! 845: UDIVcc_R	udivcc 	%r8, %r9, %r15
	.word 0xcfe21009  ! 846: CASA_I	casa	[%r8] 0x80, %r9, %r7
	.word 0x36800008  ! 847: BGE	bge,a	<label_0x8>
	.word 0x8f222a24  ! 848: MULScc_I	mulscc 	%r8, 0x0a24, %r7
	.word 0x1e800004  ! 849: BVC	bvc  	<label_0x4>
	.word 0x06ca0004  ! 850: BRLZ	brlz  ,pt	%8,<label_0xa0004>
	.word 0x8e720009  ! 851: UDIV_R	udiv 	%r8, %r9, %r7
	.word 0xc36a2850  ! 852: PREFETCH_I	prefetch	[%r8 + 0x0850], #one_read
	.word 0xf2b223f0  ! 853: STHA_I	stha	%r25, [%r8 + 0x03f0] %asi
	.word 0xa46a2fe4  ! 854: UDIVX_I	udivx 	%r8, 0x0fe4, %r18
	.word 0xc24a27b8  ! 855: LDSB_I	ldsb	[%r8 + 0x07b8], %r1
	.word 0xccfa1009  ! 856: SWAPA_R	swapa	%r6, [%r8 + %r9] 0x80
	.word 0xe8ba2678  ! 857: STDA_I	stda	%r20, [%r8 + 0x0678] %asi
	.word 0xcafa2df8  ! 858: SWAPA_I	swapa	%r5, [%r8 + 0x0df8] %asi
	.word 0x38800004  ! 860: BGU	bgu,a	<label_0x4>
	.word 0x8143c000  ! 861: STBAR	stbar
	.word 0xea122bb0  ! 862: LDUH_I	lduh	[%r8 + 0x0bb0], %r21
	.word 0xc4ea1009  ! 863: LDSTUBA_R	ldstuba	%r2, [%r8 + %r9] 0x80
	.word 0xfcfa2f98  ! 864: SWAPA_I	swapa	%r30, [%r8 + 0x0f98] %asi
	.word 0xc4da2a58  ! 865: LDXA_I	ldxa	[%r8, + 0x0a58] %asi, %r2
	.word 0x84f22c80  ! 866: UDIVcc_I	udivcc 	%r8, 0x0c80, %r2
	.word 0x84d228d4  ! 867: UMULcc_I	umulcc 	%r8, 0x08d4, %r2
	.word 0x8c520009  ! 868: UMUL_R	umul 	%r8, %r9, %r6
	.word 0xc8ba1009  ! 869: STDA_R	stda	%r4, [%r8 + %r9] 0x80
	.word 0x884a0009  ! 870: MULX_R	mulx 	%r8, %r9, %r4
	.word 0xf082298c  ! 871: LDUWA_I	lduwa	[%r8, + 0x098c] %asi, %r24
	.word 0xc65a0009  ! 872: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0x12800004  ! 873: BNE	bne  	<label_0x4>
	.word 0xcaea1009  ! 874: LDSTUBA_R	ldstuba	%r5, [%r8 + %r9] 0x80
	.word 0x866a0009  ! 875: UDIVX_R	udivx 	%r8, %r9, %r3
	.word 0xc3ea2b4c  ! 876: PREFETCHA_I	prefetcha	[%r8, + 0x0b4c] %asi, #one_read
	.word 0xc4ea1009  ! 877: LDSTUBA_R	ldstuba	%r2, [%r8 + %r9] 0x80
	.word 0xdaaa2934  ! 878: STBA_I	stba	%r13, [%r8 + 0x0934] %asi
	.word 0x2c800004  ! 879: BNEG	bneg,a	<label_0x4>
	.word 0x32800004  ! 881: BNE	bne,a	<label_0x4>
	.word 0xa47a0009  ! 882: SDIV_R	sdiv 	%r8, %r9, %r18
	.word 0x8143c000  ! 883: STBAR	stbar
	.word 0x8143c000  ! 884: STBAR	stbar
	.word 0xc89a2ac0  ! 885: LDDA_I	ldda	[%r8, + 0x0ac0] %asi, %r4
	.word 0xb06a29ac  ! 886: UDIVX_I	udivx 	%r8, 0x09ac, %r24
	.word 0xc86a0009  ! 887: LDSTUB_R	ldstub	%r4, [%r8 + %r9]
	.word 0xc26a2b68  ! 888: LDSTUB_I	ldstub	%r1, [%r8 + 0x0b68]
	.word 0xc6b22cec  ! 889: STHA_I	stha	%r3, [%r8 + 0x0cec] %asi
	.word 0xc36a2c3c  ! 890: PREFETCH_I	prefetch	[%r8 + 0x0c3c], #one_read
	.word 0x82720009  ! 891: UDIV_R	udiv 	%r8, %r9, %r1
	.word 0xbad20009  ! 892: UMULcc_R	umulcc 	%r8, %r9, %r29
	.word 0x8ed22b8c  ! 893: UMULcc_I	umulcc 	%r8, 0x0b8c, %r7
	.word 0xa9a209a9  ! 894: FDIVs	fdivs	%f8, %f9, %f20
	.word 0xb8d22484  ! 895: UMULcc_I	umulcc 	%r8, 0x0484, %r28
	.word 0xf8da1009  ! 896: LDXA_R	ldxa	[%r8, %r9] 0x80, %r28
	.word 0xcada2500  ! 897: LDXA_I	ldxa	[%r8, + 0x0500] %asi, %r5
	.word 0x8a5a0009  ! 898: SMUL_R	smul 	%r8, %r9, %r5
	.word 0x9da208a9  ! 899: FSUBs	fsubs	%f8, %f9, %f14
	.word 0xcec21009  ! 900: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r7
	.word 0x84d22b50  ! 901: UMULcc_I	umulcc 	%r8, 0x0b50, %r2
	.word 0x8143e027  ! 902: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #MemIssue 
	.word 0xd4ba1009  ! 903: STDA_R	stda	%r10, [%r8 + %r9] 0x80
	.word 0xc3ea2f80  ! 904: PREFETCHA_I	prefetcha	[%r8, + 0x0f80] %asi, #one_read
	.word 0xf6aa23e4  ! 905: STBA_I	stba	%r27, [%r8 + 0x03e4] %asi
	.word 0x24800008  ! 906: BLE	ble,a	<label_0x8>
	.word 0x8f6a0009  ! 907: SDIVX_R	sdivx	%r8, %r9, %r7
	.word 0xc6da1009  ! 908: LDXA_R	ldxa	[%r8, %r9] 0x80, %r3
	.word 0xccb21009  ! 910: STHA_R	stha	%r6, [%r8 + %r9] 0x80
	.word 0xe09a1009  ! 911: LDDA_R	ldda	[%r8, %r9] 0x80, %r16
	.word 0xc73a0009  ! 912: STDF_R	std	%f3, [%r9, %r8]
	.word 0x30800004  ! 913: BA	ba,a	<label_0x4>
	.word 0x14800004  ! 914: BG	bg  	<label_0x4>
	.word 0x9fa209a9  ! 915: FDIVs	fdivs	%f8, %f9, %f15
	.word 0x38800004  ! 916: BGU	bgu,a	<label_0x4>
	.word 0xc3ea2804  ! 917: PREFETCHA_I	prefetcha	[%r8, + 0x0804] %asi, #one_read
	.word 0xc8c21009  ! 918: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r4
	.word 0xcc0a2fb4  ! 919: LDUB_I	ldub	[%r8 + 0x0fb4], %r6
	.word 0xdc9a1009  ! 920: LDDA_R	ldda	[%r8, %r9] 0x80, %r14
	.word 0xcef21009  ! 921: STXA_R	stxa	%r7, [%r8 + %r9] 0x80
	.word 0xceda24c0  ! 922: LDXA_I	ldxa	[%r8, + 0x04c0] %asi, %r7
	.word 0x8143e002  ! 923: MEMBAR	membar	#StoreLoad 
	.word 0x8143c000  ! 924: STBAR	stbar
	.word 0xc80a0009  ! 926: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xed3a0009  ! 927: STDF_R	std	%f22, [%r9, %r8]
	.word 0x30800004  ! 928: BA	ba,a	<label_0x4>
	.word 0x94720009  ! 929: UDIV_R	udiv 	%r8, %r9, %r10
	.word 0x8e5a21d8  ! 930: SMUL_I	smul 	%r8, 0x01d8, %r7
	.word 0x8143c000  ! 931: STBAR	stbar
	.word 0x8a6a2fc8  ! 932: UDIVX_I	udivx 	%r8, 0x0fc8, %r5
	.word 0xc8f22bb8  ! 933: STXA_I	stxa	%r4, [%r8 + 0x0bb8] %asi
	.word 0xc4120009  ! 934: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xc4420009  ! 935: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0x04ca0004  ! 936: BRLEZ	brlez  ,pt	%8,<label_0xa0004>
	.word 0x827221f4  ! 937: UDIV_I	udiv 	%r8, 0x01f4, %r1
	.word 0xc8aa1009  ! 938: STBA_R	stba	%r4, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 939: STBAR	stbar
	.word 0xc3ea2e88  ! 940: PREFETCHA_I	prefetcha	[%r8, + 0x0e88] %asi, #one_read
	.word 0xacfa0009  ! 941: SDIVcc_R	sdivcc 	%r8, %r9, %r22
	.word 0xf28a1009  ! 942: LDUBA_R	lduba	[%r8, %r9] 0x80, %r25
	.word 0xc6da23a8  ! 943: LDXA_I	ldxa	[%r8, + 0x03a8] %asi, %r3
	.word 0xc8ca2b58  ! 944: LDSBA_I	ldsba	[%r8, + 0x0b58] %asi, %r4
	.word 0xc24a0009  ! 945: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0x964a2724  ! 946: MULX_I	mulx 	%r8, 0x0724, %r11
	.word 0xf40a0009  ! 947: LDUB_R	ldub	[%r8 + %r9], %r26
	.word 0x8c4a0009  ! 948: MULX_R	mulx 	%r8, %r9, %r6
	.word 0xd4c21009  ! 950: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r10
	.word 0xe25a0009  ! 951: LDX_R	ldx	[%r8 + %r9], %r17
	.word 0x40000004  ! 953: CALL	call	disp30_4
	.word 0x8143e04f  ! 954: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #Sync 
	.word 0x16800004  ! 955: BGE	bge  	<label_0x4>
	.word 0x8f220009  ! 956: MULScc_R	mulscc 	%r8, %r9, %r7
	.word 0xda921009  ! 957: LDUHA_R	lduha	[%r8, %r9] 0x80, %r13
	.word 0xba5a0009  ! 958: SMUL_R	smul 	%r8, %r9, %r29
	.word 0xc87a2580  ! 959: SWAP_I	swap	%r4, [%r8 + 0x0580]
	.word 0x864a2254  ! 960: MULX_I	mulx 	%r8, 0x0254, %r3
	.word 0xc6aa1009  ! 961: STBA_R	stba	%r3, [%r8 + %r9] 0x80
	.word 0xc33a28d8  ! 962: STDF_I	std	%f1, [0x08d8, %r8]
	.word 0x856a0009  ! 963: SDIVX_R	sdivx	%r8, %r9, %r2
	.word 0xafa208a9  ! 964: FSUBs	fsubs	%f8, %f9, %f23
	.word 0x8b222834  ! 965: MULScc_I	mulscc 	%r8, 0x0834, %r5
	.word 0xca5a2cf8  ! 966: LDX_I	ldx	[%r8 + 0x0cf8], %r5
	.word 0xca6a0009  ! 967: LDSTUB_R	ldstub	%r5, [%r8 + %r9]
	.word 0xf8ba29e8  ! 968: STDA_I	stda	%r28, [%r8 + 0x09e8] %asi
	.word 0x0cc20004  ! 969: BRGZ	brgz  ,nt	%8,<label_0x20004>
	.word 0x96fa2a94  ! 970: SDIVcc_I	sdivcc 	%r8, 0x0a94, %r11
	.word 0xd4f21009  ! 971: STXA_R	stxa	%r10, [%r8 + %r9] 0x80
	.word 0xc4921009  ! 972: LDUHA_R	lduha	[%r8, %r9] 0x80, %r2
	.word 0x14800004  ! 973: BG	bg  	<label_0x4>
	.word 0xc3ea2918  ! 974: PREFETCHA_I	prefetcha	[%r8, + 0x0918] %asi, #one_read
	.word 0xb2720009  ! 975: UDIV_R	udiv 	%r8, %r9, %r25
	.word 0xc4020009  ! 976: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xb6d22b04  ! 977: UMULcc_I	umulcc 	%r8, 0x0b04, %r27
	.word 0xd81a29f0  ! 978: LDD_I	ldd	[%r8 + 0x09f0], %r12
	.word 0x96fa2228  ! 979: SDIVcc_I	sdivcc 	%r8, 0x0228, %r11
	.word 0x876a2380  ! 980: SDIVX_I	sdivx	%r8, 0x0380, %r3
	.word 0x02ca0004  ! 981: BRZ	brz  ,pt	%8,<label_0xa0004>
	.word 0xf1e21009  ! 983: CASA_I	casa	[%r8] 0x80, %r9, %r24
	.word 0x1a800008  ! 984: BCC	bcc  	<label_0x8>
	.word 0x0c800008  ! 985: BNEG	bneg  	<label_0x8>
	.word 0xe3f22009  ! 986: CASXA_R	casxa	[%r8]%asi, %r9, %r17
	.word 0x8143e065  ! 987: MEMBAR	membar	#LoadLoad | #LoadStore | #MemIssue | #Sync 
	.word 0x00800004  ! 988: BN	bn  	<label_0x4>
	.word 0xd41a2e58  ! 989: LDD_I	ldd	[%r8 + 0x0e58], %r10
	.word 0xd4aa2cc8  ! 990: STBA_I	stba	%r10, [%r8 + 0x0cc8] %asi
	.word 0x9a4a0009  ! 991: MULX_R	mulx 	%r8, %r9, %r13
	.word 0xc3ea2f80  ! 992: PREFETCHA_I	prefetcha	[%r8, + 0x0f80] %asi, #one_read
	.word 0xfe7a24b4  ! 993: SWAP_I	swap	%r31, [%r8 + 0x04b4]
	.word 0x20800008  ! 994: BN	bn,a	<label_0x8>
	.word 0xbcfa0009  ! 995: SDIVcc_R	sdivcc 	%r8, %r9, %r30
	.word 0x8143c000  ! 997: STBAR	stbar
	.word 0x3e800008  ! 998: BVC	bvc,a	<label_0x8>
	.word 0xf8c228b0  ! 999: LDSWA_I	ldswa	[%r8, + 0x08b0] %asi, %r28
        ta      T_GOOD_TRAP

th_main_2:
        setx  MAIN_BASE_DATA_VA, %r1, %r8
        setx  0x0000000000000bc0, %g1, %r9
        setx  0x80, %g2, %g1
        wr  %g1, %g0, %asi
	    rd %fprs, %g0
        wr %g0, 0x4, %fprs
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
        setx  0x8f1849ff9a81817a, %g1, %r0
        setx  0xa7d0448f9ebcdaa4, %g1, %r1
        setx  0x61d4bb993e78147f, %g1, %r2
        setx  0xcffd68f846087396, %g1, %r3
        setx  0xbf7618e6a8a5c09a, %g1, %r4
        setx  0xa4c785e5761c89e0, %g1, %r5
        setx  0xc3e57d1a68527128, %g1, %r6
        setx  0x12dc34bed5ac2e73, %g1, %r7
        setx  0x94f27e334d5ba7e1, %g1, %r10
        setx  0xa98e9c689a201b79, %g1, %r11
        setx  0x3b55a4046833decd, %g1, %r12
        setx  0x35b23d6fc29a7613, %g1, %r13
        setx  0xe619c532b009e423, %g1, %r14
        setx  0x749ec25dd499d58d, %g1, %r15
        setx  0xa9ea93442137d661, %g1, %r16
        setx  0xd86c46ae25ca7f94, %g1, %r17
        setx  0x7c009ee48bf37dbe, %g1, %r18
        setx  0x2dd2db6631a3f4dc, %g1, %r19
        setx  0xf6c1001d51b57bf8, %g1, %r20
        setx  0x3372bde68a78c293, %g1, %r21
        setx  0x2834aedf63264341, %g1, %r22
        setx  0xe15789b77665ce1b, %g1, %r23
        setx  0x1bb8a42bba53a846, %g1, %r24
        setx  0x43f461288b70ce6b, %g1, %r25
        setx  0x8b72eb69c559982e, %g1, %r26
        setx  0xf01bc89d17e33060, %g1, %r27
        setx  0x50e20056dc8bde1c, %g1, %r28
        setx  0x66c480e9500f9012, %g1, %r29
        setx  0x4c4fa439ed77c9cd, %g1, %r30
        setx  0xcb1f4dee252b3ebf, %g1, %r31
	.word 0x0cca0004  ! 5: BRGZ	brgz  ,pt	%8,<label_0xa0004>
	.word 0x04c20004  ! 6: BRLEZ	brlez  ,nt	%8,<label_0x20004>
	.word 0xc27a0009  ! 7: SWAP_R	swap	%r1, [%r8 + %r9]
	.word 0x8143e003  ! 8: MEMBAR	membar	#LoadLoad | #StoreLoad 
	.word 0xdeca1009  ! 9: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r15
	.word 0xc5f21009  ! 10: CASXA_I	casxa	[%r8] 0x80, %r9, %r2
	.word 0xd68a23a4  ! 11: LDUBA_I	lduba	[%r8, + 0x03a4] %asi, %r11
	.word 0x8af22e64  ! 12: UDIVcc_I	udivcc 	%r8, 0x0e64, %r5
	.word 0x8143c000  ! 13: STBAR	stbar
	.word 0xc6821009  ! 14: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r3
	.word 0xf01a0009  ! 15: LDD_R	ldd	[%r8 + %r9], %r24
	.word 0x8143c000  ! 16: STBAR	stbar
	.word 0xbc6a0009  ! 17: UDIVX_R	udivx 	%r8, %r9, %r30
	.word 0xc8fa228c  ! 18: SWAPA_I	swapa	%r4, [%r8 + 0x028c] %asi
	.word 0x8143c000  ! 19: STBAR	stbar
	.word 0xccb21009  ! 20: STHA_R	stha	%r6, [%r8 + %r9] 0x80
	.word 0x0c800004  ! 21: BNEG	bneg  	<label_0x4>
	.word 0x84522ed8  ! 22: UMUL_I	umul 	%r8, 0x0ed8, %r2
	.word 0x2aca0004  ! 23: BRNZ	brnz,a,pt	%8,<label_0xa0004>
	.word 0xc3ea2fa0  ! 24: PREFETCHA_I	prefetcha	[%r8, + 0x0fa0] %asi, #one_read
	.word 0x8143e064  ! 25: MEMBAR	membar	#LoadStore | #MemIssue | #Sync 
	.word 0x8143e024  ! 26: MEMBAR	membar	#LoadStore | #MemIssue 
	.word 0xc48a1009  ! 27: LDUBA_R	lduba	[%r8, %r9] 0x80, %r2
	.word 0x8143c000  ! 28: STBAR	stbar
	.word 0xc6da1009  ! 30: LDXA_R	ldxa	[%r8, %r9] 0x80, %r3
	.word 0xada20929  ! 31: FMULs	fmuls	%f8, %f9, %f22
	.word 0xe81a0009  ! 32: LDD_R	ldd	[%r8 + %r9], %r20
	.word 0xccd21009  ! 33: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r6
	.word 0xe4da1009  ! 34: LDXA_R	ldxa	[%r8, %r9] 0x80, %r18
	.word 0xc85a0009  ! 35: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0x3c800008  ! 36: BPOS	bpos,a	<label_0x8>
	.word 0x8143e079  ! 37: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xca7a2f48  ! 38: SWAP_I	swap	%r5, [%r8 + 0x0f48]
	.word 0x8af20009  ! 39: UDIVcc_R	udivcc 	%r8, %r9, %r5
	.word 0x865a0009  ! 40: SMUL_R	smul 	%r8, %r9, %r3
	.word 0x20800004  ! 41: BN	bn,a	<label_0x4>
	.word 0xc8520009  ! 42: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xc36a2514  ! 43: PREFETCH_I	prefetch	[%r8 + 0x0514], #one_read
	.word 0x28800004  ! 45: BLEU	bleu,a	<label_0x4>
	.word 0x8143c000  ! 47: STBAR	stbar
	.word 0x96520009  ! 48: UMUL_R	umul 	%r8, %r9, %r11
	.word 0x8da208a9  ! 49: FSUBs	fsubs	%f8, %f9, %f6
	.word 0xcefa1009  ! 50: SWAPA_R	swapa	%r7, [%r8 + %r9] 0x80
	.word 0xc4ba2498  ! 51: STDA_I	stda	%r2, [%r8 + 0x0498] %asi
	.word 0x82d2263c  ! 52: UMULcc_I	umulcc 	%r8, 0x063c, %r1
	.word 0x88fa26f0  ! 53: SDIVcc_I	sdivcc 	%r8, 0x06f0, %r4
	.word 0xce8a2824  ! 54: LDUBA_I	lduba	[%r8, + 0x0824] %asi, %r7
	.word 0x824a0009  ! 55: MULX_R	mulx 	%r8, %r9, %r1
	.word 0xcfe21009  ! 56: CASA_I	casa	[%r8] 0x80, %r9, %r7
	.word 0xb4da0009  ! 57: SMULcc_R	smulcc 	%r8, %r9, %r26
	.word 0xfab22bb0  ! 58: STHA_I	stha	%r29, [%r8 + 0x0bb0] %asi
	.word 0xfeda21d8  ! 59: LDXA_I	ldxa	[%r8, + 0x01d8] %asi, %r31
	.word 0x8143e01e  ! 60: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside 
	.word 0x8a4a2df4  ! 61: MULX_I	mulx 	%r8, 0x0df4, %r5
	.word 0x12800004  ! 62: BNE	bne  	<label_0x4>
	.word 0xc81a0009  ! 63: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xe53a0009  ! 64: STDF_R	std	%f18, [%r9, %r8]
	.word 0x87a20829  ! 65: FADDs	fadds	%f8, %f9, %f3
	.word 0xc88a25fc  ! 66: LDUBA_I	lduba	[%r8, + 0x05fc] %asi, %r4
	.word 0x8143e065  ! 67: MEMBAR	membar	#LoadLoad | #LoadStore | #MemIssue | #Sync 
	.word 0x89a209a9  ! 68: FDIVs	fdivs	%f8, %f9, %f4
	.word 0xe09a28e8  ! 69: LDDA_I	ldda	[%r8, + 0x08e8] %asi, %r16
	.word 0x8afa2b2c  ! 70: SDIVcc_I	sdivcc 	%r8, 0x0b2c, %r5
	.word 0x99a209a9  ! 71: FDIVs	fdivs	%f8, %f9, %f12
	.word 0xc4120009  ! 72: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xe0922fcc  ! 73: LDUHA_I	lduha	[%r8, + 0x0fcc] %asi, %r16
	.word 0xcc7a0009  ! 74: SWAP_R	swap	%r6, [%r8 + %r9]
	.word 0x827a2e74  ! 75: SDIV_I	sdiv 	%r8, 0x0e74, %r1
	.word 0x84522eac  ! 76: UMUL_I	umul 	%r8, 0x0eac, %r2
	.word 0x844a0009  ! 77: MULX_R	mulx 	%r8, %r9, %r2
	.word 0x8e7a0009  ! 78: SDIV_R	sdiv 	%r8, %r9, %r7
	.word 0x8143c000  ! 79: STBAR	stbar
	.word 0x36800004  ! 80: BGE	bge,a	<label_0x4>
	.word 0xa0fa0009  ! 81: SDIVcc_R	sdivcc 	%r8, %r9, %r16
	.word 0xb7a209a9  ! 82: FDIVs	fdivs	%f8, %f9, %f27
	.word 0xc36a2404  ! 83: PREFETCH_I	prefetch	[%r8 + 0x0404], #one_read
	.word 0x26800004  ! 84: BL	bl,a	<label_0x4>
	.word 0xc2122f30  ! 85: LDUH_I	lduh	[%r8 + 0x0f30], %r1
	.word 0x85a208a9  ! 86: FSUBs	fsubs	%f8, %f9, %f2
	.word 0xad6a2a30  ! 87: SDIVX_I	sdivx	%r8, 0x0a30, %r22
	.word 0x8c520009  ! 88: UMUL_R	umul 	%r8, %r9, %r6
	.word 0xc26a2ab0  ! 89: LDSTUB_I	ldstub	%r1, [%r8 + 0x0ab0]
	.word 0x8fa20929  ! 90: FMULs	fmuls	%f8, %f9, %f7
	.word 0xe0ba2fd0  ! 91: STDA_I	stda	%r16, [%r8 + 0x0fd0] %asi
	.word 0x8143e021  ! 92: MEMBAR	membar	#LoadLoad | #MemIssue 
	.word 0xc3e22009  ! 93: CASA_R	casa	[%r8] %asi, %r9, %r1
	.word 0xaeda25f4  ! 94: SMULcc_I	smulcc 	%r8, 0x05f4, %r23
	.word 0xccba1009  ! 95: STDA_R	stda	%r6, [%r8 + %r9] 0x80
	.word 0xfcd22f94  ! 96: LDSHA_I	ldsha	[%r8, + 0x0f94] %asi, %r30
	.word 0xc67a22b0  ! 97: SWAP_I	swap	%r3, [%r8 + 0x02b0]
	.word 0xaafa23e8  ! 98: SDIVcc_I	sdivcc 	%r8, 0x03e8, %r21
	.word 0xc3ea22f4  ! 99: PREFETCHA_I	prefetcha	[%r8, + 0x02f4] %asi, #one_read
	.word 0x83a20929  ! 100: FMULs	fmuls	%f8, %f9, %f1
	.word 0xced22240  ! 101: LDSHA_I	ldsha	[%r8, + 0x0240] %asi, %r7
	.word 0x8143e022  ! 102: MEMBAR	membar	#StoreLoad | #MemIssue 
	.word 0xc4ba2ab8  ! 103: STDA_I	stda	%r2, [%r8 + 0x0ab8] %asi
	.word 0xcc5a0009  ! 104: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xf6ca2fec  ! 105: LDSBA_I	ldsba	[%r8, + 0x0fec] %asi, %r27
	.word 0xf01a0009  ! 106: LDD_R	ldd	[%r8 + %r9], %r24
	.word 0xfb2228fc  ! 107: STF_I	st	%f29, [0x08fc, %r8]
	.word 0x836a0009  ! 108: SDIVX_R	sdivx	%r8, %r9, %r1
	.word 0xeaaa1009  ! 111: STBA_R	stba	%r21, [%r8 + %r9] 0x80
	.word 0x89a209a9  ! 112: FDIVs	fdivs	%f8, %f9, %f4
	.word 0xbc7a2590  ! 113: SDIV_I	sdiv 	%r8, 0x0590, %r30
	.word 0xc2d2231c  ! 114: LDSHA_I	ldsha	[%r8, + 0x031c] %asi, %r1
	.word 0xaefa0009  ! 115: SDIVcc_R	sdivcc 	%r8, %r9, %r23
	.word 0xc36a20c8  ! 116: PREFETCH_I	prefetch	[%r8 + 0x00c8], #one_read
	.word 0xb8da0009  ! 117: SMULcc_R	smulcc 	%r8, %r9, %r28
	.word 0x8143c000  ! 118: STBAR	stbar
	.word 0xc28a1009  ! 120: LDUBA_R	lduba	[%r8, %r9] 0x80, %r1
	.word 0xf8ca2978  ! 121: LDSBA_I	ldsba	[%r8, + 0x0978] %asi, %r28
	.word 0xca4a0009  ! 122: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0x8143e04c  ! 123: MEMBAR	membar	#LoadStore | #StoreStore | #Sync 
	.word 0x8fa20829  ! 124: FADDs	fadds	%f8, %f9, %f7
	.word 0x28800004  ! 125: BLEU	bleu,a	<label_0x4>
	.word 0x02c20004  ! 126: BRZ	brz  ,nt	%8,<label_0x20004>
	.word 0x10800004  ! 127: BA	ba  	<label_0x4>
	.word 0xde921009  ! 129: LDUHA_R	lduha	[%r8, %r9] 0x80, %r15
	.word 0x844a0009  ! 130: MULX_R	mulx 	%r8, %r9, %r2
	.word 0xb4f223bc  ! 131: UDIVcc_I	udivcc 	%r8, 0x03bc, %r26
	.word 0xccea283c  ! 132: LDSTUBA_I	ldstuba	%r6, [%r8 + 0x083c] %asi
	.word 0x827a2ed8  ! 133: SDIV_I	sdiv 	%r8, 0x0ed8, %r1
	.word 0xcaca1009  ! 134: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r5
	.word 0xcaca1009  ! 135: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r5
	.word 0xc3ea24bc  ! 136: PREFETCHA_I	prefetcha	[%r8, + 0x04bc] %asi, #one_read
	.word 0xd85a0009  ! 137: LDX_R	ldx	[%r8 + %r9], %r12
	.word 0xd41a2710  ! 138: LDD_I	ldd	[%r8 + 0x0710], %r10
	.word 0xc6822830  ! 139: LDUWA_I	lduwa	[%r8, + 0x0830] %asi, %r3
	.word 0x8143c000  ! 140: STBAR	stbar
	.word 0xd8921009  ! 141: LDUHA_R	lduha	[%r8, %r9] 0x80, %r12
	.word 0x0e800004  ! 142: BVS	bvs  	<label_0x4>
	.word 0xc6fa2298  ! 143: SWAPA_I	swapa	%r3, [%r8 + 0x0298] %asi
	.word 0xe2821009  ! 145: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r17
	.word 0xcc120009  ! 146: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0x865a0009  ! 147: SMUL_R	smul 	%r8, %r9, %r3
	.word 0x8a4a2178  ! 148: MULX_I	mulx 	%r8, 0x0178, %r5
	.word 0x965a27dc  ! 149: SMUL_I	smul 	%r8, 0x07dc, %r11
	.word 0x86da2b74  ! 150: SMULcc_I	smulcc 	%r8, 0x0b74, %r3
	.word 0xc66a2794  ! 151: LDSTUB_I	ldstub	%r3, [%r8 + 0x0794]
	.word 0xc28a1009  ! 152: LDUBA_R	lduba	[%r8, %r9] 0x80, %r1
	.word 0xaad22bfc  ! 153: UMULcc_I	umulcc 	%r8, 0x0bfc, %r21
	.word 0x8143e04c  ! 154: MEMBAR	membar	#LoadStore | #StoreStore | #Sync 
	.word 0x8fa20929  ! 155: FMULs	fmuls	%f8, %f9, %f7
	.word 0xec921009  ! 156: LDUHA_R	lduha	[%r8, %r9] 0x80, %r22
	.word 0xcff21009  ! 157: CASXA_I	casxa	[%r8] 0x80, %r9, %r7
	.word 0xc53a2918  ! 158: STDF_I	std	%f2, [0x0918, %r8]
	.word 0xf3e22009  ! 159: CASA_R	casa	[%r8] %asi, %r9, %r25
	.word 0xec520009  ! 160: LDSH_R	ldsh	[%r8 + %r9], %r22
	.word 0x8fa208a9  ! 161: FSUBs	fsubs	%f8, %f9, %f7
	.word 0xc49a2b40  ! 162: LDDA_I	ldda	[%r8, + 0x0b40] %asi, %r2
	.word 0x8ed20009  ! 163: UMULcc_R	umulcc 	%r8, %r9, %r7
	.word 0x26800004  ! 164: BL	bl,a	<label_0x4>
	.word 0xccfa2408  ! 165: SWAPA_I	swapa	%r6, [%r8 + 0x0408] %asi
	.word 0xc6a22eb4  ! 166: STWA_I	stwa	%r3, [%r8 + 0x0eb4] %asi
	.word 0xc4422960  ! 167: LDSW_I	ldsw	[%r8 + 0x0960], %r2
	.word 0x9a7226bc  ! 168: UDIV_I	udiv 	%r8, 0x06bc, %r13
	.word 0x8143c000  ! 169: STBAR	stbar
	.word 0x8143e036  ! 170: MEMBAR	membar	#StoreLoad | #LoadStore | #Lookaside | #MemIssue 
	.word 0xd7f21009  ! 171: CASXA_I	casxa	[%r8] 0x80, %r9, %r11
	.word 0xc24a25ec  ! 172: LDSB_I	ldsb	[%r8 + 0x05ec], %r1
	.word 0xe88a1009  ! 173: LDUBA_R	lduba	[%r8, %r9] 0x80, %r20
	.word 0x8143c000  ! 174: STBAR	stbar
	.word 0x89a208a9  ! 175: FSUBs	fsubs	%f8, %f9, %f4
	.word 0xcefa1009  ! 176: SWAPA_R	swapa	%r7, [%r8 + %r9] 0x80
	.word 0x9efa2a20  ! 177: SDIVcc_I	sdivcc 	%r8, 0x0a20, %r15
	.word 0xc8b21009  ! 178: STHA_R	stha	%r4, [%r8 + %r9] 0x80
	.word 0xbc722ef4  ! 179: UDIV_I	udiv 	%r8, 0x0ef4, %r30
	.word 0xf8ba23b0  ! 180: STDA_I	stda	%r28, [%r8 + 0x03b0] %asi
	.word 0xc2d22d90  ! 181: LDSHA_I	ldsha	[%r8, + 0x0d90] %asi, %r1
	.word 0xe01a0009  ! 182: LDD_R	ldd	[%r8 + %r9], %r16
	.word 0xa1a209a9  ! 183: FDIVs	fdivs	%f8, %f9, %f16
	.word 0xc27a0009  ! 184: SWAP_R	swap	%r1, [%r8 + %r9]
	.word 0x8143e017  ! 185: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside 
	.word 0x8143e06a  ! 186: MEMBAR	membar	#StoreLoad | #StoreStore | #MemIssue | #Sync 
	.word 0xcea21009  ! 187: STWA_R	stwa	%r7, [%r8 + %r9] 0x80
	.word 0xbfa20829  ! 188: FADDs	fadds	%f8, %f9, %f31
	.word 0xc80a0009  ! 189: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0x86fa2dd8  ! 190: SDIVcc_I	sdivcc 	%r8, 0x0dd8, %r3
	.word 0xc3ea2930  ! 191: PREFETCHA_I	prefetcha	[%r8, + 0x0930] %asi, #one_read
	.word 0xdf3a0009  ! 192: STDF_R	std	%f15, [%r9, %r8]
	.word 0xc6f22b50  ! 194: STXA_I	stxa	%r3, [%r8 + 0x0b50] %asi
	.word 0x8d2226dc  ! 195: MULScc_I	mulscc 	%r8, 0x06dc, %r6
	.word 0xe4ba28e0  ! 196: STDA_I	stda	%r18, [%r8 + 0x08e0] %asi
	.word 0xe6d21009  ! 197: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r19
	.word 0x34800004  ! 198: BG	bg,a	<label_0x4>
	.word 0x9fa20829  ! 199: FADDs	fadds	%f8, %f9, %f15
	.word 0x8e522b54  ! 200: UMUL_I	umul 	%r8, 0x0b54, %r7
	.word 0xc3e21009  ! 201: CASA_I	casa	[%r8] 0x80, %r9, %r1
	.word 0xecea1009  ! 202: LDSTUBA_R	ldstuba	%r22, [%r8 + %r9] 0x80
	.word 0xe8c21009  ! 203: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r20
	.word 0xc4ea1009  ! 204: LDSTUBA_R	ldstuba	%r2, [%r8 + %r9] 0x80
	.word 0x8143e050  ! 205: MEMBAR	membar	#Lookaside | #Sync 
	.word 0xccaa29f4  ! 206: STBA_I	stba	%r6, [%r8 + 0x09f4] %asi
	.word 0x87a208a9  ! 207: FSUBs	fsubs	%f8, %f9, %f3
	.word 0xd65227f4  ! 208: LDSH_I	ldsh	[%r8 + 0x07f4], %r11
	.word 0xc3ea2a7c  ! 209: PREFETCHA_I	prefetcha	[%r8, + 0x0a7c] %asi, #one_read
	.word 0xceb21009  ! 210: STHA_R	stha	%r7, [%r8 + %r9] 0x80
	.word 0xfc9a1009  ! 211: LDDA_R	ldda	[%r8, %r9] 0x80, %r30
	.word 0xdeca1009  ! 212: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r15
	.word 0x87a20929  ! 213: FMULs	fmuls	%f8, %f9, %f3
	.word 0xca7a2a7c  ! 214: SWAP_I	swap	%r5, [%r8 + 0x0a7c]
	.word 0xa6f20009  ! 215: UDIVcc_R	udivcc 	%r8, %r9, %r19
	.word 0x8143e05a  ! 216: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside | #Sync 
	.word 0x89a208a9  ! 217: FSUBs	fsubs	%f8, %f9, %f4
	.word 0xce921009  ! 218: LDUHA_R	lduha	[%r8, %r9] 0x80, %r7
	.word 0xcca21009  ! 219: STWA_R	stwa	%r6, [%r8 + %r9] 0x80
	.word 0xcf3a2430  ! 220: STDF_I	std	%f7, [0x0430, %r8]
	.word 0x86520009  ! 221: UMUL_R	umul 	%r8, %r9, %r3
	.word 0x886a2c50  ! 222: UDIVX_I	udivx 	%r8, 0x0c50, %r4
	.word 0xc87a2994  ! 223: SWAP_I	swap	%r4, [%r8 + 0x0994]
	.word 0x8a522f90  ! 224: UMUL_I	umul 	%r8, 0x0f90, %r5
	.word 0xceca2bb0  ! 225: LDSBA_I	ldsba	[%r8, + 0x0bb0] %asi, %r7
	.word 0x8143e04f  ! 226: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #Sync 
	.word 0xccf21009  ! 227: STXA_R	stxa	%r6, [%r8 + %r9] 0x80
	.word 0xfe420009  ! 228: LDSW_R	ldsw	[%r8 + %r9], %r31
	.word 0x28800004  ! 229: BLEU	bleu,a	<label_0x4>
	.word 0xc26a2998  ! 230: LDSTUB_I	ldstub	%r1, [%r8 + 0x0998]
	.word 0x8143e039  ! 231: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside | #MemIssue 
	.word 0x40000004  ! 232: CALL	call	disp30_4
	.word 0x8cda0009  ! 233: SMULcc_R	smulcc 	%r8, %r9, %r6
	.word 0x0a800004  ! 234: BCS	bcs  	<label_0x4>
	.word 0x8143c000  ! 235: STBAR	stbar
	.word 0x8143e041  ! 236: MEMBAR	membar	#LoadLoad | #Sync 
	.word 0xbc7a0009  ! 237: SDIV_R	sdiv 	%r8, %r9, %r30
	.word 0xccba26e0  ! 238: STDA_I	stda	%r6, [%r8 + 0x06e0] %asi
	.word 0xb04a2570  ! 239: MULX_I	mulx 	%r8, 0x0570, %r24
	.word 0x8ad22a1c  ! 240: UMULcc_I	umulcc 	%r8, 0x0a1c, %r5
	.word 0xc36a21c0  ! 241: PREFETCH_I	prefetch	[%r8 + 0x01c0], #one_read
	.word 0xcafa1009  ! 242: SWAPA_R	swapa	%r5, [%r8 + %r9] 0x80
	.word 0x36800004  ! 243: BGE	bge,a	<label_0x4>
	.word 0x8143e02c  ! 244: MEMBAR	membar	#LoadStore | #StoreStore | #MemIssue 
	.word 0x8143e04c  ! 245: MEMBAR	membar	#LoadStore | #StoreStore | #Sync 
	.word 0xfed229d8  ! 246: LDSHA_I	ldsha	[%r8, + 0x09d8] %asi, %r31
	.word 0x866a0009  ! 247: UDIVX_R	udivx 	%r8, %r9, %r3
	.word 0xccca2784  ! 248: LDSBA_I	ldsba	[%r8, + 0x0784] %asi, %r6
	.word 0xf0120009  ! 249: LDUH_R	lduh	[%r8 + %r9], %r24
	.word 0x32800008  ! 250: BNE	bne,a	<label_0x8>
	.word 0x8fa209a9  ! 252: FDIVs	fdivs	%f8, %f9, %f7
	.word 0x86f20009  ! 253: UDIVcc_R	udivcc 	%r8, %r9, %r3
	.word 0x0cca0004  ! 254: BRGZ	brgz  ,pt	%8,<label_0xa0004>
	.word 0x8e7a28b0  ! 255: SDIV_I	sdiv 	%r8, 0x08b0, %r7
	.word 0xf0ba1009  ! 256: STDA_R	stda	%r24, [%r8 + %r9] 0x80
	.word 0xff222e88  ! 257: STF_I	st	%f31, [0x0e88, %r8]
	.word 0xc36a2aac  ! 258: PREFETCH_I	prefetch	[%r8 + 0x0aac], #one_read
	.word 0xc4a21009  ! 259: STWA_R	stwa	%r2, [%r8 + %r9] 0x80
	.word 0x9a522080  ! 260: UMUL_I	umul 	%r8, 0x0080, %r13
	.word 0x89220009  ! 261: MULScc_R	mulscc 	%r8, %r9, %r4
	.word 0xac5a208c  ! 262: SMUL_I	smul 	%r8, 0x008c, %r22
	.word 0x9e7a0009  ! 263: SDIV_R	sdiv 	%r8, %r9, %r15
	.word 0xbc5a2d94  ! 264: SMUL_I	smul 	%r8, 0x0d94, %r30
	.word 0x85a20929  ! 265: FMULs	fmuls	%f8, %f9, %f2
	.word 0x36800004  ! 266: BGE	bge,a	<label_0x4>
	.word 0xee5a21a0  ! 267: LDX_I	ldx	[%r8 + 0x01a0], %r23
	.word 0xc3220009  ! 268: STF_R	st	%f1, [%r9, %r8]
	.word 0xcc922d9c  ! 269: LDUHA_I	lduha	[%r8, + 0x0d9c] %asi, %r6
	.word 0xc27a0009  ! 270: SWAP_R	swap	%r1, [%r8 + %r9]
	.word 0xc87a2eb0  ! 271: SWAP_I	swap	%r4, [%r8 + 0x0eb0]
	.word 0xc33a0009  ! 272: STDF_R	std	%f1, [%r9, %r8]
	.word 0x1a800004  ! 273: BCC	bcc  	<label_0x4>
	.word 0xa64a28fc  ! 274: MULX_I	mulx 	%r8, 0x08fc, %r19
	.word 0x0c800004  ! 275: BNEG	bneg  	<label_0x4>
	.word 0xbfa20829  ! 276: FADDs	fadds	%f8, %f9, %f31
	.word 0xc88a1009  ! 277: LDUBA_R	lduba	[%r8, %r9] 0x80, %r4
	.word 0x87a20829  ! 278: FADDs	fadds	%f8, %f9, %f3
	.word 0x84722a1c  ! 279: UDIV_I	udiv 	%r8, 0x0a1c, %r2
	.word 0xc48a1009  ! 280: LDUBA_R	lduba	[%r8, %r9] 0x80, %r2
	.word 0x8143e04e  ! 281: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Sync 
	.word 0x8143c000  ! 282: STBAR	stbar
	.word 0x86da0009  ! 283: SMULcc_R	smulcc 	%r8, %r9, %r3
	.word 0xbd222c18  ! 284: MULScc_I	mulscc 	%r8, 0x0c18, %r30
	.word 0xc64a28dc  ! 285: LDSB_I	ldsb	[%r8 + 0x08dc], %r3
	.word 0x1c800004  ! 286: BPOS	bpos  	<label_0x4>
	.word 0xca022224  ! 287: LDUW_I	lduw	[%r8 + 0x0224], %r5
	.word 0xc8420009  ! 288: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0x16800008  ! 289: BGE	bge  	<label_0x8>
	.word 0xe0a22400  ! 290: STWA_I	stwa	%r16, [%r8 + 0x0400] %asi
	.word 0x02ca0004  ! 291: BRZ	brz  ,pt	%8,<label_0xa0004>
	.word 0xe88a1009  ! 292: LDUBA_R	lduba	[%r8, %r9] 0x80, %r20
	.word 0x83a209a9  ! 293: FDIVs	fdivs	%f8, %f9, %f1
	.word 0x8c720009  ! 294: UDIV_R	udiv 	%r8, %r9, %r6
	.word 0xf6b2250c  ! 295: STHA_I	stha	%r27, [%r8 + 0x050c] %asi
	.word 0xccc226a8  ! 296: LDSWA_I	ldswa	[%r8, + 0x06a8] %asi, %r6
	.word 0xccba1009  ! 297: STDA_R	stda	%r6, [%r8 + %r9] 0x80
	.word 0x85a20929  ! 298: FMULs	fmuls	%f8, %f9, %f2
	.word 0x9e520009  ! 299: UMUL_R	umul 	%r8, %r9, %r15
	.word 0x8143e05c  ! 300: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0x22800004  ! 301: BE	be,a	<label_0x4>
	.word 0x8143c000  ! 302: STBAR	stbar
	.word 0xfd3a0009  ! 303: STDF_R	std	%f30, [%r9, %r8]
	.word 0x8143e035  ! 304: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside | #MemIssue 
	.word 0x84f20009  ! 305: UDIVcc_R	udivcc 	%r8, %r9, %r2
	.word 0xccb21009  ! 306: STHA_R	stha	%r6, [%r8 + %r9] 0x80
	.word 0xc25a0009  ! 307: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xc4922920  ! 308: LDUHA_I	lduha	[%r8, + 0x0920] %asi, %r2
	.word 0xc3ea2570  ! 309: PREFETCHA_I	prefetcha	[%r8, + 0x0570] %asi, #one_read
	.word 0xe0522b84  ! 310: LDSH_I	ldsh	[%r8 + 0x0b84], %r16
	.word 0x0eca0008  ! 311: BRGEZ	brgez  ,pt	%8,<label_0xa0008>
	.word 0xc4ca1009  ! 312: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r2
	.word 0x83222770  ! 313: MULScc_I	mulscc 	%r8, 0x0770, %r1
	.word 0xccf226d0  ! 314: STXA_I	stxa	%r6, [%r8 + 0x06d0] %asi
	.word 0xb67a0009  ! 315: SDIV_R	sdiv 	%r8, %r9, %r27
	.word 0x8afa2124  ! 317: SDIVcc_I	sdivcc 	%r8, 0x0124, %r5
	.word 0xc53a2f48  ! 318: STDF_I	std	%f2, [0x0f48, %r8]
	.word 0xf6b22384  ! 319: STHA_I	stha	%r27, [%r8 + 0x0384] %asi
	.word 0xc5e21009  ! 320: CASA_I	casa	[%r8] 0x80, %r9, %r2
	.word 0x16800004  ! 321: BGE	bge  	<label_0x4>
	.word 0x2cca0004  ! 322: BRGZ	brgz,a,pt	%8,<label_0xa0004>
	.word 0x8ed220b4  ! 323: UMULcc_I	umulcc 	%r8, 0x00b4, %r7
	.word 0xc8821009  ! 324: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r4
	.word 0x84520009  ! 325: UMUL_R	umul 	%r8, %r9, %r2
	.word 0xf2a21009  ! 326: STWA_R	stwa	%r25, [%r8 + %r9] 0x80
	.word 0x2a800008  ! 327: BCS	bcs,a	<label_0x8>
	.word 0xf3e21009  ! 328: CASA_I	casa	[%r8] 0x80, %r9, %r25
	.word 0x8143e06e  ! 329: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #MemIssue | #Sync 
	.word 0xe49a2748  ! 330: LDDA_I	ldda	[%r8, + 0x0748] %asi, %r18
	.word 0x1c800004  ! 331: BPOS	bpos  	<label_0x4>
	.word 0xd4422130  ! 332: LDSW_I	ldsw	[%r8 + 0x0130], %r10
	.word 0xdc1a0009  ! 333: LDD_R	ldd	[%r8 + %r9], %r14
	.word 0xcbf22009  ! 334: CASXA_R	casxa	[%r8]%asi, %r9, %r5
	.word 0xc3ea2ba4  ! 335: PREFETCHA_I	prefetcha	[%r8, + 0x0ba4] %asi, #one_read
	.word 0x886a0009  ! 336: UDIVX_R	udivx 	%r8, %r9, %r4
	.word 0xc44220ac  ! 337: LDSW_I	ldsw	[%r8 + 0x00ac], %r2
	.word 0x8143c000  ! 338: STBAR	stbar
	.word 0x946a21e0  ! 340: UDIVX_I	udivx 	%r8, 0x01e0, %r10
	.word 0x8143e037  ! 342: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside | #MemIssue 
	.word 0x8143c000  ! 343: STBAR	stbar
	.word 0xde5a2540  ! 345: LDX_I	ldx	[%r8 + 0x0540], %r15
	.word 0xc3e21009  ! 346: CASA_I	casa	[%r8] 0x80, %r9, %r1
	.word 0x36800004  ! 348: BGE	bge,a	<label_0x4>
	.word 0x98722180  ! 349: UDIV_I	udiv 	%r8, 0x0180, %r12
	.word 0xbe5a2cc8  ! 350: SMUL_I	smul 	%r8, 0x0cc8, %r31
	.word 0xf89a1009  ! 351: LDDA_R	ldda	[%r8, %r9] 0x80, %r28
	.word 0xcde22009  ! 352: CASA_R	casa	[%r8] %asi, %r9, %r6
	.word 0xce4a28d4  ! 353: LDSB_I	ldsb	[%r8 + 0x08d4], %r7
	.word 0xd49a1009  ! 354: LDDA_R	ldda	[%r8, %r9] 0x80, %r10
	.word 0xc20a28fc  ! 355: LDUB_I	ldub	[%r8 + 0x08fc], %r1
	.word 0xcbe22009  ! 356: CASA_R	casa	[%r8] %asi, %r9, %r5
	.word 0x826a0009  ! 357: UDIVX_R	udivx 	%r8, %r9, %r1
	.word 0xe8020009  ! 358: LDUW_R	lduw	[%r8 + %r9], %r20
	.word 0xb27a2964  ! 359: SDIV_I	sdiv 	%r8, 0x0964, %r25
	.word 0x1a800008  ! 360: BCC	bcc  	<label_0x8>
	.word 0xc9f22009  ! 361: CASXA_R	casxa	[%r8]%asi, %r9, %r4
	.word 0x8143c000  ! 362: STBAR	stbar
	.word 0xc36a2a04  ! 363: PREFETCH_I	prefetch	[%r8 + 0x0a04], #one_read
	.word 0xb4fa0009  ! 364: SDIVcc_R	sdivcc 	%r8, %r9, %r26
	.word 0xceda1009  ! 365: LDXA_R	ldxa	[%r8, %r9] 0x80, %r7
	.word 0xd44a262c  ! 366: LDSB_I	ldsb	[%r8 + 0x062c], %r10
	.word 0xec1a2578  ! 367: LDD_I	ldd	[%r8 + 0x0578], %r22
	.word 0xc4921009  ! 368: LDUHA_R	lduha	[%r8, %r9] 0x80, %r2
	.word 0x8e5a2618  ! 370: SMUL_I	smul 	%r8, 0x0618, %r7
	.word 0x8a7a24b8  ! 371: SDIV_I	sdiv 	%r8, 0x04b8, %r5
	.word 0x10800004  ! 372: BA	ba  	<label_0x4>
	.word 0xcd220009  ! 373: STF_R	st	%f6, [%r9, %r8]
	.word 0xce0a2a0c  ! 375: LDUB_I	ldub	[%r8 + 0x0a0c], %r7
	.word 0xe8520009  ! 376: LDSH_R	ldsh	[%r8 + %r9], %r20
	.word 0xc8f21009  ! 377: STXA_R	stxa	%r4, [%r8 + %r9] 0x80
	.word 0x1c800004  ! 378: BPOS	bpos  	<label_0x4>
	.word 0xc8a227f8  ! 379: STWA_I	stwa	%r4, [%r8 + 0x07f8] %asi
	.word 0xb9a209a9  ! 380: FDIVs	fdivs	%f8, %f9, %f28
	.word 0xc6f22758  ! 381: STXA_I	stxa	%r3, [%r8 + 0x0758] %asi
	.word 0x8143c000  ! 382: STBAR	stbar
	.word 0xe25a2e30  ! 383: LDX_I	ldx	[%r8 + 0x0e30], %r17
	.word 0xe0b21009  ! 384: STHA_R	stha	%r16, [%r8 + %r9] 0x80
	.word 0xf84a2500  ! 385: LDSB_I	ldsb	[%r8 + 0x0500], %r28
	.word 0xceda1009  ! 386: LDXA_R	ldxa	[%r8, %r9] 0x80, %r7
	.word 0xc20a0009  ! 387: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xe8a21009  ! 388: STWA_R	stwa	%r20, [%r8 + %r9] 0x80
	.word 0xc2da1009  ! 389: LDXA_R	ldxa	[%r8, %r9] 0x80, %r1
	.word 0x96520009  ! 390: UMUL_R	umul 	%r8, %r9, %r11
	.word 0xdc1a0009  ! 391: LDD_R	ldd	[%r8 + %r9], %r14
	.word 0x1e800004  ! 392: BVC	bvc  	<label_0x4>
	.word 0xceca1009  ! 393: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r7
	.word 0xc27a281c  ! 394: SWAP_I	swap	%r1, [%r8 + 0x081c]
	.word 0x987a244c  ! 395: SDIV_I	sdiv 	%r8, 0x044c, %r12
	.word 0x8143c000  ! 396: STBAR	stbar
	.word 0xcf220009  ! 397: STF_R	st	%f7, [%r9, %r8]
	.word 0x8143e036  ! 398: MEMBAR	membar	#StoreLoad | #LoadStore | #Lookaside | #MemIssue 
	.word 0xde022238  ! 399: LDUW_I	lduw	[%r8 + 0x0238], %r15
	.word 0xc47a0009  ! 400: SWAP_R	swap	%r2, [%r8 + %r9]
	.word 0xec9a2568  ! 401: LDDA_I	ldda	[%r8, + 0x0568] %asi, %r22
	.word 0xedf21009  ! 402: CASXA_I	casxa	[%r8] 0x80, %r9, %r22
	.word 0xcac21009  ! 403: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r5
	.word 0xe0ca2494  ! 404: LDSBA_I	ldsba	[%r8, + 0x0494] %asi, %r16
	.word 0x82fa0009  ! 405: SDIVcc_R	sdivcc 	%r8, %r9, %r1
	.word 0x0eca0004  ! 406: BRGEZ	brgez  ,pt	%8,<label_0xa0004>
	.word 0x06800008  ! 407: BL	bl  	<label_0x8>
	.word 0x2e800004  ! 408: BVS	bvs,a	<label_0x4>
	.word 0xb3a20829  ! 409: FADDs	fadds	%f8, %f9, %f25
	.word 0x16800004  ! 410: BGE	bge  	<label_0x4>
	.word 0x8a4a0009  ! 411: MULX_R	mulx 	%r8, %r9, %r5
	.word 0x8c6a2134  ! 412: UDIVX_I	udivx 	%r8, 0x0134, %r6
	.word 0x14800008  ! 413: BG	bg  	<label_0x8>
	.word 0x8143c000  ! 414: STBAR	stbar
	.word 0x8143e029  ! 415: MEMBAR	membar	#LoadLoad | #StoreStore | #MemIssue 
	.word 0x24800008  ! 416: BLE	ble,a	<label_0x8>
	.word 0xbeda0009  ! 417: SMULcc_R	smulcc 	%r8, %r9, %r31
	.word 0xf60a27cc  ! 418: LDUB_I	ldub	[%r8 + 0x07cc], %r27
	.word 0x8143e012  ! 419: MEMBAR	membar	#StoreLoad | #Lookaside 
	.word 0x8e7a0009  ! 420: SDIV_R	sdiv 	%r8, %r9, %r7
	.word 0x8143c000  ! 421: STBAR	stbar
	.word 0xcff21009  ! 422: CASXA_I	casxa	[%r8] 0x80, %r9, %r7
	.word 0xd88a1009  ! 423: LDUBA_R	lduba	[%r8, %r9] 0x80, %r12
	.word 0xc2b21009  ! 424: STHA_R	stha	%r1, [%r8 + %r9] 0x80
	.word 0xc66a0009  ! 425: LDSTUB_R	ldstub	%r3, [%r8 + %r9]
	.word 0x0c800004  ! 426: BNEG	bneg  	<label_0x4>
	.word 0x86520009  ! 427: UMUL_R	umul 	%r8, %r9, %r3
	.word 0xc3ea20e0  ! 428: PREFETCHA_I	prefetcha	[%r8, + 0x00e0] %asi, #one_read
	.word 0x2ac20008  ! 429: BRNZ	brnz,a,nt	%8,<label_0x20008>
	.word 0x1a800004  ! 430: BCC	bcc  	<label_0x4>
	.word 0x2cca0008  ! 432: BRGZ	brgz,a,pt	%8,<label_0xa0008>
	.word 0x8143c000  ! 433: STBAR	stbar
	.word 0x8b222bc4  ! 434: MULScc_I	mulscc 	%r8, 0x0bc4, %r5
	.word 0xcb220009  ! 435: STF_R	st	%f5, [%r9, %r8]
	.word 0x8143e071  ! 436: MEMBAR	membar	#LoadLoad | #Lookaside | #MemIssue | #Sync 
	.word 0x88f22dbc  ! 437: UDIVcc_I	udivcc 	%r8, 0x0dbc, %r4
	.word 0xbfa20929  ! 438: FMULs	fmuls	%f8, %f9, %f31
	.word 0xbed20009  ! 439: UMULcc_R	umulcc 	%r8, %r9, %r31
	.word 0xf44a21dc  ! 440: LDSB_I	ldsb	[%r8 + 0x01dc], %r26
	.word 0xc4ba1009  ! 441: STDA_R	stda	%r2, [%r8 + %r9] 0x80
	.word 0xc4c21009  ! 442: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r2
	.word 0x8143e010  ! 443: MEMBAR	membar	#Lookaside 
	.word 0xc8ea1009  ! 444: LDSTUBA_R	ldstuba	%r4, [%r8 + %r9] 0x80
	.word 0x8cfa22c8  ! 445: SDIVcc_I	sdivcc 	%r8, 0x02c8, %r6
	.word 0xc68a25f8  ! 446: LDUBA_I	lduba	[%r8, + 0x05f8] %asi, %r3
	.word 0xf0821009  ! 447: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r24
	.word 0x1a800004  ! 448: BCC	bcc  	<label_0x4>
	.word 0x0e800008  ! 449: BVS	bvs  	<label_0x8>
	.word 0xc6ca2464  ! 450: LDSBA_I	ldsba	[%r8, + 0x0464] %asi, %r3
	.word 0xc93a0009  ! 451: STDF_R	std	%f4, [%r9, %r8]
	.word 0x8143e01a  ! 452: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside 
	.word 0x8e5a0009  ! 453: SMUL_R	smul 	%r8, %r9, %r7
	.word 0xcf3a0009  ! 454: STDF_R	std	%f7, [%r9, %r8]
	.word 0x8143c000  ! 455: STBAR	stbar
	.word 0x8143c000  ! 456: STBAR	stbar
	.word 0x8143c000  ! 457: STBAR	stbar
	.word 0x96520009  ! 458: UMUL_R	umul 	%r8, %r9, %r11
	.word 0x8143e02c  ! 459: MEMBAR	membar	#LoadStore | #StoreStore | #MemIssue 
	.word 0xc3ea2500  ! 460: PREFETCHA_I	prefetcha	[%r8, + 0x0500] %asi, #one_read
	.word 0x30800008  ! 461: BA	ba,a	<label_0x8>
	.word 0x08800004  ! 462: BLEU	bleu  	<label_0x4>
	.word 0xfc020009  ! 463: LDUW_R	lduw	[%r8 + %r9], %r30
	.word 0xaa5a0009  ! 464: SMUL_R	smul 	%r8, %r9, %r21
	.word 0xe8da1009  ! 465: LDXA_R	ldxa	[%r8, %r9] 0x80, %r20
	.word 0xf0aa1009  ! 467: STBA_R	stba	%r24, [%r8 + %r9] 0x80
	.word 0x9efa0009  ! 468: SDIVcc_R	sdivcc 	%r8, %r9, %r15
	.word 0xccf21009  ! 469: STXA_R	stxa	%r6, [%r8 + %r9] 0x80
	.word 0xccba1009  ! 472: STDA_R	stda	%r6, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 473: STBAR	stbar
	.word 0x8143c000  ! 474: STBAR	stbar
	.word 0xf0da22d8  ! 475: LDXA_I	ldxa	[%r8, + 0x02d8] %asi, %r24
	.word 0xc9220009  ! 476: STF_R	st	%f4, [%r9, %r8]
	.word 0x896a0009  ! 477: SDIVX_R	sdivx	%r8, %r9, %r4
	.word 0x8e522cf8  ! 478: UMUL_I	umul 	%r8, 0x0cf8, %r7
	.word 0xeff21009  ! 479: CASXA_I	casxa	[%r8] 0x80, %r9, %r23
	.word 0xcaf21009  ! 480: STXA_R	stxa	%r5, [%r8 + %r9] 0x80
	.word 0x99a20829  ! 481: FADDs	fadds	%f8, %f9, %f12
	.word 0xf41a2618  ! 482: LDD_I	ldd	[%r8 + 0x0618], %r26
	.word 0x9f2229fc  ! 483: MULScc_I	mulscc 	%r8, 0x09fc, %r15
	.word 0xc84228b8  ! 484: LDSW_I	ldsw	[%r8 + 0x08b8], %r4
	.word 0xc4ba26d8  ! 485: STDA_I	stda	%r2, [%r8 + 0x06d8] %asi
	.word 0xea8a1009  ! 486: LDUBA_R	lduba	[%r8, %r9] 0x80, %r21
	.word 0x8cda0009  ! 487: SMULcc_R	smulcc 	%r8, %r9, %r6
	.word 0xccaa26ac  ! 488: STBA_I	stba	%r6, [%r8 + 0x06ac] %asi
	.word 0x8143c000  ! 489: STBAR	stbar
	.word 0x8143e03e  ! 490: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0xda120009  ! 491: LDUH_R	lduh	[%r8 + %r9], %r13
	.word 0xcafa2a30  ! 492: SWAPA_I	swapa	%r5, [%r8 + 0x0a30] %asi
	.word 0x8fa209a9  ! 493: FDIVs	fdivs	%f8, %f9, %f7
	.word 0xce6a2840  ! 494: LDSTUB_I	ldstub	%r7, [%r8 + 0x0840]
	.word 0xc8d21009  ! 495: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r4
	.word 0x8c520009  ! 496: UMUL_R	umul 	%r8, %r9, %r6
	.word 0xc3ea2b80  ! 497: PREFETCHA_I	prefetcha	[%r8, + 0x0b80] %asi, #one_read
	.word 0x12800004  ! 498: BNE	bne  	<label_0x4>
	.word 0xc27a20d8  ! 499: SWAP_I	swap	%r1, [%r8 + 0x00d8]
	.word 0x9ed20009  ! 500: UMULcc_R	umulcc 	%r8, %r9, %r15
	.word 0x8143e07a  ! 501: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xceda1009  ! 502: LDXA_R	ldxa	[%r8, %r9] 0x80, %r7
	.word 0x8c4a2ff0  ! 503: MULX_I	mulx 	%r8, 0x0ff0, %r6
	.word 0x8143c000  ! 504: STBAR	stbar
	.word 0x8da20829  ! 505: FADDs	fadds	%f8, %f9, %f6
	.word 0x8e4a2d48  ! 506: MULX_I	mulx 	%r8, 0x0d48, %r7
	.word 0xe3220009  ! 507: STF_R	st	%f17, [%r9, %r8]
	.word 0xf87a2944  ! 508: SWAP_I	swap	%r28, [%r8 + 0x0944]
	.word 0xdf222194  ! 509: STF_I	st	%f15, [0x0194, %r8]
	.word 0x8143e026  ! 510: MEMBAR	membar	#StoreLoad | #LoadStore | #MemIssue 
	.word 0xb5a208a9  ! 511: FSUBs	fsubs	%f8, %f9, %f26
	.word 0xc3ea25e4  ! 512: PREFETCHA_I	prefetcha	[%r8, + 0x05e4] %asi, #one_read
	.word 0x8c6a28b4  ! 513: UDIVX_I	udivx 	%r8, 0x08b4, %r6
	.word 0xc8921009  ! 514: LDUHA_R	lduha	[%r8, %r9] 0x80, %r4
	.word 0xd6821009  ! 515: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r11
	.word 0xce8a237c  ! 516: LDUBA_I	lduba	[%r8, + 0x037c] %asi, %r7
	.word 0x8143c000  ! 517: STBAR	stbar
	.word 0x8cd20009  ! 518: UMULcc_R	umulcc 	%r8, %r9, %r6
	.word 0xecba1009  ! 519: STDA_R	stda	%r22, [%r8 + %r9] 0x80
	.word 0xf6ea1009  ! 520: LDSTUBA_R	ldstuba	%r27, [%r8 + %r9] 0x80
	.word 0xcad220b0  ! 521: LDSHA_I	ldsha	[%r8, + 0x00b0] %asi, %r5
	.word 0xfcb21009  ! 522: STHA_R	stha	%r30, [%r8 + %r9] 0x80
	.word 0xee9222fc  ! 523: LDUHA_I	lduha	[%r8, + 0x02fc] %asi, %r23
	.word 0xc8ea1009  ! 524: LDSTUBA_R	ldstuba	%r4, [%r8 + %r9] 0x80
	.word 0xc3ea2a64  ! 525: PREFETCHA_I	prefetcha	[%r8, + 0x0a64] %asi, #one_read
	.word 0x8143e017  ! 527: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside 
	.word 0x8a5a0009  ! 528: SMUL_R	smul 	%r8, %r9, %r5
	.word 0x865a0009  ! 529: SMUL_R	smul 	%r8, %r9, %r3
	.word 0xa67a0009  ! 530: SDIV_R	sdiv 	%r8, %r9, %r19
	.word 0x8143e058  ! 531: MEMBAR	membar	#StoreStore | #Lookaside | #Sync 
	.word 0xc492282c  ! 532: LDUHA_I	lduha	[%r8, + 0x082c] %asi, %r2
	.word 0x96fa0009  ! 533: SDIVcc_R	sdivcc 	%r8, %r9, %r11
	.word 0xceea1009  ! 535: LDSTUBA_R	ldstuba	%r7, [%r8 + %r9] 0x80
	.word 0xe9220009  ! 536: STF_R	st	%f20, [%r9, %r8]
	.word 0xd8fa255c  ! 537: SWAPA_I	swapa	%r12, [%r8 + 0x055c] %asi
	.word 0x06800004  ! 538: BL	bl  	<label_0x4>
	.word 0xc7220009  ! 539: STF_R	st	%f3, [%r9, %r8]
	.word 0xcac22fac  ! 540: LDSWA_I	ldswa	[%r8, + 0x0fac] %asi, %r5
	.word 0xc8f21009  ! 541: STXA_R	stxa	%r4, [%r8 + %r9] 0x80
	.word 0xfdf22009  ! 542: CASXA_R	casxa	[%r8]%asi, %r9, %r30
	.word 0xc3ea27a8  ! 543: PREFETCHA_I	prefetcha	[%r8, + 0x07a8] %asi, #one_read
	.word 0x8143c000  ! 544: STBAR	stbar
	.word 0xcaca2bd0  ! 546: LDSBA_I	ldsba	[%r8, + 0x0bd0] %asi, %r5
	.word 0x865225fc  ! 547: UMUL_I	umul 	%r8, 0x05fc, %r3
	.word 0xc53a0009  ! 548: STDF_R	std	%f2, [%r9, %r8]
	.word 0xfe420009  ! 549: LDSW_R	ldsw	[%r8 + %r9], %r31
	.word 0x8143e053  ! 550: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside | #Sync 
	.word 0xc2921009  ! 551: LDUHA_R	lduha	[%r8, %r9] 0x80, %r1
	.word 0x83a208a9  ! 552: FSUBs	fsubs	%f8, %f9, %f1
	.word 0xf6ea1009  ! 553: LDSTUBA_R	ldstuba	%r27, [%r8 + %r9] 0x80
	.word 0x8da208a9  ! 554: FSUBs	fsubs	%f8, %f9, %f6
	.word 0xe4ba2bf0  ! 555: STDA_I	stda	%r18, [%r8 + 0x0bf0] %asi
	.word 0xf73a0009  ! 556: STDF_R	std	%f27, [%r9, %r8]
	.word 0x8143c000  ! 557: STBAR	stbar
	.word 0x8143e034  ! 558: MEMBAR	membar	#LoadStore | #Lookaside | #MemIssue 
	.word 0xccb222a0  ! 559: STHA_I	stha	%r6, [%r8 + 0x02a0] %asi
	.word 0x2ec20004  ! 560: BRGEZ	brgez,a,nt	%8,<label_0x20004>
	.word 0xc8ba1009  ! 561: STDA_R	stda	%r4, [%r8 + %r9] 0x80
	.word 0xc36a2fa8  ! 562: PREFETCH_I	prefetch	[%r8 + 0x0fa8], #one_read
	.word 0x96f20009  ! 563: UDIVcc_R	udivcc 	%r8, %r9, %r11
	.word 0x8f222ae4  ! 564: MULScc_I	mulscc 	%r8, 0x0ae4, %r7
	.word 0xcca21009  ! 565: STWA_R	stwa	%r6, [%r8 + %r9] 0x80
	.word 0x22c20004  ! 566: BRZ	brz,a,nt	%8,<label_0x20004>
	.word 0xc9e21009  ! 567: CASA_I	casa	[%r8] 0x80, %r9, %r4
	.word 0x8143c000  ! 568: STBAR	stbar
	.word 0x2a800004  ! 569: BCS	bcs,a	<label_0x4>
	.word 0xccda1009  ! 570: LDXA_R	ldxa	[%r8, %r9] 0x80, %r6
	.word 0x8cfa0009  ! 571: SDIVcc_R	sdivcc 	%r8, %r9, %r6
	.word 0x8143c000  ! 572: STBAR	stbar
	.word 0xca6a2168  ! 573: LDSTUB_I	ldstub	%r5, [%r8 + 0x0168]
	.word 0xa6522748  ! 574: UMUL_I	umul 	%r8, 0x0748, %r19
	.word 0xd4b21009  ! 575: STHA_R	stha	%r10, [%r8 + %r9] 0x80
	.word 0xc28a24a8  ! 576: LDUBA_I	lduba	[%r8, + 0x04a8] %asi, %r1
	.word 0xcc520009  ! 577: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xca6a2568  ! 578: LDSTUB_I	ldstub	%r5, [%r8 + 0x0568]
	.word 0x24800004  ! 579: BLE	ble,a	<label_0x4>
	.word 0x86520009  ! 580: UMUL_R	umul 	%r8, %r9, %r3
	.word 0xf6020009  ! 581: LDUW_R	lduw	[%r8 + %r9], %r27
	.word 0x06c20008  ! 582: BRLZ	brlz  ,nt	%8,<label_0x20008>
	.word 0xc3ea2e1c  ! 583: PREFETCHA_I	prefetcha	[%r8, + 0x0e1c] %asi, #one_read
	.word 0xdb3a0009  ! 584: STDF_R	std	%f13, [%r9, %r8]
	.word 0x14800008  ! 585: BG	bg  	<label_0x8>
	.word 0x8143c000  ! 586: STBAR	stbar
	.word 0xaed22270  ! 587: UMULcc_I	umulcc 	%r8, 0x0270, %r23
	.word 0xc5e22009  ! 588: CASA_R	casa	[%r8] %asi, %r9, %r2
	.word 0xca420009  ! 590: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xc8b21009  ! 591: STHA_R	stha	%r4, [%r8 + %r9] 0x80
	.word 0xdaaa2594  ! 593: STBA_I	stba	%r13, [%r8 + 0x0594] %asi
	.word 0xfa5a2a08  ! 594: LDX_I	ldx	[%r8 + 0x0a08], %r29
	.word 0xf2da1009  ! 595: LDXA_R	ldxa	[%r8, %r9] 0x80, %r25
	.word 0xcf220009  ! 596: STF_R	st	%f7, [%r9, %r8]
	.word 0xcb3a2828  ! 597: STDF_I	std	%f5, [0x0828, %r8]
	.word 0xc3ea2748  ! 598: PREFETCHA_I	prefetcha	[%r8, + 0x0748] %asi, #one_read
	.word 0xc9220009  ! 599: STF_R	st	%f4, [%r9, %r8]
	.word 0xc45a2860  ! 600: LDX_I	ldx	[%r8 + 0x0860], %r2
	.word 0xcfe22009  ! 601: CASA_R	casa	[%r8] %asi, %r9, %r7
	.word 0x9a4a0009  ! 602: MULX_R	mulx 	%r8, %r9, %r13
	.word 0xd89a1009  ! 603: LDDA_R	ldda	[%r8, %r9] 0x80, %r12
	.word 0x14800004  ! 604: BG	bg  	<label_0x4>
	.word 0x8a5a0009  ! 605: SMUL_R	smul 	%r8, %r9, %r5
	.word 0x885a2d14  ! 606: SMUL_I	smul 	%r8, 0x0d14, %r4
	.word 0xcd3a0009  ! 607: STDF_R	std	%f6, [%r9, %r8]
	.word 0x8143c000  ! 608: STBAR	stbar
	.word 0x9e722bf4  ! 609: UDIV_I	udiv 	%r8, 0x0bf4, %r15
	.word 0xa04a24a4  ! 610: MULX_I	mulx 	%r8, 0x04a4, %r16
	.word 0x97a208a9  ! 611: FSUBs	fsubs	%f8, %f9, %f11
	.word 0x8fa209a9  ! 612: FDIVs	fdivs	%f8, %f9, %f7
	.word 0xc3ea2c20  ! 613: PREFETCHA_I	prefetcha	[%r8, + 0x0c20] %asi, #one_read
	.word 0x98720009  ! 614: UDIV_R	udiv 	%r8, %r9, %r12
	.word 0xb4520009  ! 615: UMUL_R	umul 	%r8, %r9, %r26
	.word 0xcef21009  ! 616: STXA_R	stxa	%r7, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 617: STBAR	stbar
	.word 0x8143c000  ! 618: STBAR	stbar
	.word 0x26ca0004  ! 619: BRLZ	brlz,a,pt	%8,<label_0xa0004>
	.word 0xc8c21009  ! 620: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r4
	.word 0xfeda2080  ! 621: LDXA_I	ldxa	[%r8, + 0x0080] %asi, %r31
	.word 0x82f20009  ! 622: UDIVcc_R	udivcc 	%r8, %r9, %r1
	.word 0xf1220009  ! 623: STF_R	st	%f24, [%r9, %r8]
	.word 0xbc7a0009  ! 624: SDIV_R	sdiv 	%r8, %r9, %r30
	.word 0x8143e00d  ! 625: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore 
	.word 0xc3ea2b28  ! 626: PREFETCHA_I	prefetcha	[%r8, + 0x0b28] %asi, #one_read
	.word 0xc4020009  ! 627: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0x8143c000  ! 628: STBAR	stbar
	.word 0xc4020009  ! 629: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0x3e800004  ! 630: BVC	bvc,a	<label_0x4>
	.word 0x8143e018  ! 631: MEMBAR	membar	#StoreStore | #Lookaside 
	.word 0x8143c000  ! 632: STBAR	stbar
	.word 0x88da2b7c  ! 633: SMULcc_I	smulcc 	%r8, 0x0b7c, %r4
	.word 0x8ba20829  ! 634: FADDs	fadds	%f8, %f9, %f5
	.word 0x82da27dc  ! 635: SMULcc_I	smulcc 	%r8, 0x07dc, %r1
	.word 0x10800008  ! 636: BA	ba  	<label_0x8>
	.word 0xca1222cc  ! 637: LDUH_I	lduh	[%r8 + 0x02cc], %r5
	.word 0xce520009  ! 638: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0x3a800008  ! 639: BCC	bcc,a	<label_0x8>
	.word 0x8e7a0009  ! 640: SDIV_R	sdiv 	%r8, %r9, %r7
	.word 0xc3ea2520  ! 641: PREFETCHA_I	prefetcha	[%r8, + 0x0520] %asi, #one_read
	.word 0xc6821009  ! 642: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r3
	.word 0x82d22e88  ! 644: UMULcc_I	umulcc 	%r8, 0x0e88, %r1
	.word 0x88522f24  ! 645: UMUL_I	umul 	%r8, 0x0f24, %r4
	.word 0x88fa0009  ! 646: SDIVcc_R	sdivcc 	%r8, %r9, %r4
	.word 0xc2a221c0  ! 647: STWA_I	stwa	%r1, [%r8 + 0x01c0] %asi
	.word 0xd4ba2ec0  ! 648: STDA_I	stda	%r10, [%r8 + 0x0ec0] %asi
	.word 0xc9222eb4  ! 649: STF_I	st	%f4, [0x0eb4, %r8]
	.word 0xe4ba1009  ! 650: STDA_R	stda	%r18, [%r8 + %r9] 0x80
	.word 0xc66a26ec  ! 651: LDSTUB_I	ldstub	%r3, [%r8 + 0x06ec]
	.word 0x8143c000  ! 652: STBAR	stbar
	.word 0xcc9a1009  ! 655: LDDA_R	ldda	[%r8, %r9] 0x80, %r6
	.word 0xf8ba1009  ! 656: STDA_R	stda	%r28, [%r8 + %r9] 0x80
	.word 0xfec22030  ! 657: LDSWA_I	ldswa	[%r8, + 0x0030] %asi, %r31
	.word 0xc5e22009  ! 658: CASA_R	casa	[%r8] %asi, %r9, %r2
	.word 0xc36a20a0  ! 659: PREFETCH_I	prefetch	[%r8 + 0x00a0], #one_read
	.word 0x8a6a0009  ! 660: UDIVX_R	udivx 	%r8, %r9, %r5
	.word 0xc2c22910  ! 661: LDSWA_I	ldswa	[%r8, + 0x0910] %asi, %r1
	.word 0x04800008  ! 662: BLE	ble  	<label_0x8>
	.word 0x8143e058  ! 663: MEMBAR	membar	#StoreStore | #Lookaside | #Sync 
	.word 0x884a0009  ! 664: MULX_R	mulx 	%r8, %r9, %r4
	.word 0xcc821009  ! 665: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r6
	.word 0x0e800008  ! 666: BVS	bvs  	<label_0x8>
	.word 0xc33a2f50  ! 667: STDF_I	std	%f1, [0x0f50, %r8]
	.word 0xdc5a2780  ! 670: LDX_I	ldx	[%r8 + 0x0780], %r14
	.word 0x8b220009  ! 671: MULScc_R	mulscc 	%r8, %r9, %r5
	.word 0x8c6a2170  ! 672: UDIVX_I	udivx 	%r8, 0x0170, %r6
	.word 0x8143c000  ! 673: STBAR	stbar
	.word 0xc28a2178  ! 674: LDUBA_I	lduba	[%r8, + 0x0178] %asi, %r1
	.word 0xb8fa0009  ! 675: SDIVcc_R	sdivcc 	%r8, %r9, %r28
	.word 0x2a800008  ! 676: BCS	bcs,a	<label_0x8>
	.word 0xc8a21009  ! 677: STWA_R	stwa	%r4, [%r8 + %r9] 0x80
	.word 0xc36a2978  ! 678: PREFETCH_I	prefetch	[%r8 + 0x0978], #one_read
	.word 0xca0a2360  ! 679: LDUB_I	ldub	[%r8 + 0x0360], %r5
	.word 0x10800004  ! 680: BA	ba  	<label_0x4>
	.word 0x8143c000  ! 681: STBAR	stbar
	.word 0x8e522dc0  ! 682: UMUL_I	umul 	%r8, 0x0dc0, %r7
	.word 0xc87a23c8  ! 683: SWAP_I	swap	%r4, [%r8 + 0x03c8]
	.word 0x886a0009  ! 684: UDIVX_R	udivx 	%r8, %r9, %r4
	.word 0xe48a215c  ! 685: LDUBA_I	lduba	[%r8, + 0x015c] %asi, %r18
	.word 0xc4ba1009  ! 686: STDA_R	stda	%r2, [%r8 + %r9] 0x80
	.word 0xf45a23a0  ! 687: LDX_I	ldx	[%r8 + 0x03a0], %r26
	.word 0xa64a0009  ! 688: MULX_R	mulx 	%r8, %r9, %r19
	.word 0xcaaa2304  ! 689: STBA_I	stba	%r5, [%r8 + 0x0304] %asi
	.word 0xcc8222c8  ! 690: LDUWA_I	lduwa	[%r8, + 0x02c8] %asi, %r6
	.word 0x86d22c98  ! 691: UMULcc_I	umulcc 	%r8, 0x0c98, %r3
	.word 0x82522838  ! 692: UMUL_I	umul 	%r8, 0x0838, %r1
	.word 0x8fa208a9  ! 693: FSUBs	fsubs	%f8, %f9, %f7
	.word 0xc4ca1009  ! 694: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r2
	.word 0xba722104  ! 695: UDIV_I	udiv 	%r8, 0x0104, %r29
	.word 0xccfa2150  ! 696: SWAPA_I	swapa	%r6, [%r8 + 0x0150] %asi
	.word 0xc3ea21d4  ! 697: PREFETCHA_I	prefetcha	[%r8, + 0x01d4] %asi, #one_read
	.word 0xdef22400  ! 698: STXA_I	stxa	%r15, [%r8 + 0x0400] %asi
	.word 0x82fa0009  ! 699: SDIVcc_R	sdivcc 	%r8, %r9, %r1
	.word 0x8143e03f  ! 700: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0xb86a0009  ! 701: UDIVX_R	udivx 	%r8, %r9, %r28
	.word 0xc4ba2878  ! 702: STDA_I	stda	%r2, [%r8 + 0x0878] %asi
	.word 0xc8422e7c  ! 703: LDSW_I	ldsw	[%r8 + 0x0e7c], %r4
	.word 0xccda2d50  ! 704: LDXA_I	ldxa	[%r8, + 0x0d50] %asi, %r6
	.word 0x8143c000  ! 705: STBAR	stbar
	.word 0xc87a0009  ! 706: SWAP_R	swap	%r4, [%r8 + %r9]
	.word 0x8143e024  ! 707: MEMBAR	membar	#LoadStore | #MemIssue 
	.word 0xca6a2808  ! 708: LDSTUB_I	ldstub	%r5, [%r8 + 0x0808]
	.word 0x8f6a21f8  ! 709: SDIVX_I	sdivx	%r8, 0x01f8, %r7
	.word 0xe0ea1009  ! 710: LDSTUBA_R	ldstuba	%r16, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 711: STBAR	stbar
	.word 0xc3ea24d4  ! 712: PREFETCHA_I	prefetcha	[%r8, + 0x04d4] %asi, #one_read
	.word 0x83a208a9  ! 713: FSUBs	fsubs	%f8, %f9, %f1
	.word 0xc6c22cbc  ! 714: LDSWA_I	ldswa	[%r8, + 0x0cbc] %asi, %r3
	.word 0x8cfa2a58  ! 715: SDIVcc_I	sdivcc 	%r8, 0x0a58, %r6
	.word 0xc6ea1009  ! 716: LDSTUBA_R	ldstuba	%r3, [%r8 + %r9] 0x80
	.word 0xc68227ac  ! 717: LDUWA_I	lduwa	[%r8, + 0x07ac] %asi, %r3
	.word 0x88720009  ! 718: UDIV_R	udiv 	%r8, %r9, %r4
	.word 0xc73a0009  ! 719: STDF_R	std	%f3, [%r9, %r8]
	.word 0xa0722230  ! 720: UDIV_I	udiv 	%r8, 0x0230, %r16
	.word 0xceaa1009  ! 721: STBA_R	stba	%r7, [%r8 + %r9] 0x80
	.word 0xe0ba27f8  ! 722: STDA_I	stda	%r16, [%r8 + 0x07f8] %asi
	.word 0xcada1009  ! 724: LDXA_R	ldxa	[%r8, %r9] 0x80, %r5
	.word 0x82da0009  ! 725: SMULcc_R	smulcc 	%r8, %r9, %r1
	.word 0x02c20008  ! 726: BRZ	brz  ,nt	%8,<label_0x20008>
	.word 0xa1a20829  ! 727: FADDs	fadds	%f8, %f9, %f16
	.word 0xf8520009  ! 728: LDSH_R	ldsh	[%r8 + %r9], %r28
	.word 0xecda2298  ! 729: LDXA_I	ldxa	[%r8, + 0x0298] %asi, %r22
	.word 0xc93a0009  ! 730: STDF_R	std	%f4, [%r9, %r8]
	.word 0xc7222f6c  ! 731: STF_I	st	%f3, [0x0f6c, %r8]
	.word 0xf44a0009  ! 732: LDSB_R	ldsb	[%r8 + %r9], %r26
	.word 0x0e800008  ! 733: BVS	bvs  	<label_0x8>
	.word 0xc65a0009  ! 734: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0x8a7a2d30  ! 735: SDIV_I	sdiv 	%r8, 0x0d30, %r5
	.word 0xe41a2df8  ! 736: LDD_I	ldd	[%r8 + 0x0df8], %r18
	.word 0xc36a2b54  ! 737: PREFETCH_I	prefetch	[%r8 + 0x0b54], #one_read
	.word 0x0a800004  ! 738: BCS	bcs  	<label_0x4>
	.word 0x8fa209a9  ! 739: FDIVs	fdivs	%f8, %f9, %f7
	.word 0x1a800008  ! 740: BCC	bcc  	<label_0x8>
	.word 0xcbf21009  ! 741: CASXA_I	casxa	[%r8] 0x80, %r9, %r5
	.word 0xc4120009  ! 742: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0x85a20929  ! 743: FMULs	fmuls	%f8, %f9, %f2
	.word 0xf49a1009  ! 744: LDDA_R	ldda	[%r8, %r9] 0x80, %r26
	.word 0x8143c000  ! 745: STBAR	stbar
	.word 0x40000004  ! 746: CALL	call	disp30_4
	.word 0xf0122108  ! 747: LDUH_I	lduh	[%r8 + 0x0108], %r24
	.word 0xc48a1009  ! 748: LDUBA_R	lduba	[%r8, %r9] 0x80, %r2
	.word 0xf8120009  ! 749: LDUH_R	lduh	[%r8 + %r9], %r28
	.word 0x87222cb8  ! 750: MULScc_I	mulscc 	%r8, 0x0cb8, %r3
	.word 0x9ba20929  ! 751: FMULs	fmuls	%f8, %f9, %f13
	.word 0xc6ea2128  ! 752: LDSTUBA_I	ldstuba	%r3, [%r8 + 0x0128] %asi
	.word 0x96f222a8  ! 753: UDIVcc_I	udivcc 	%r8, 0x02a8, %r11
	.word 0x8e4a0009  ! 754: MULX_R	mulx 	%r8, %r9, %r7
	.word 0x36800008  ! 755: BGE	bge,a	<label_0x8>
	.word 0xdd3a0009  ! 756: STDF_R	std	%f14, [%r9, %r8]
	.word 0x8ada265c  ! 757: SMULcc_I	smulcc 	%r8, 0x065c, %r5
	.word 0xe81a0009  ! 758: LDD_R	ldd	[%r8 + %r9], %r20
	.word 0xc3f22009  ! 759: CASXA_R	casxa	[%r8]%asi, %r9, %r1
	.word 0xc3ea26f0  ! 760: PREFETCHA_I	prefetcha	[%r8, + 0x06f0] %asi, #one_read
	.word 0x836a20e8  ! 761: SDIVX_I	sdivx	%r8, 0x00e8, %r1
	.word 0x8143e042  ! 762: MEMBAR	membar	#StoreLoad | #Sync 
	.word 0xfc4228f8  ! 763: LDSW_I	ldsw	[%r8 + 0x08f8], %r30
	.word 0xcf220009  ! 764: STF_R	st	%f7, [%r9, %r8]
	.word 0x8fa20829  ! 765: FADDs	fadds	%f8, %f9, %f7
	.word 0x22800004  ! 766: BE	be,a	<label_0x4>
	.word 0xbe7a0009  ! 767: SDIV_R	sdiv 	%r8, %r9, %r31
	.word 0xe4aa1009  ! 768: STBA_R	stba	%r18, [%r8 + %r9] 0x80
	.word 0xed3a2070  ! 769: STDF_I	std	%f22, [0x0070, %r8]
	.word 0xd6b21009  ! 770: STHA_R	stha	%r11, [%r8 + %r9] 0x80
	.word 0xf2b22e48  ! 771: STHA_I	stha	%r25, [%r8 + 0x0e48] %asi
	.word 0x8143c000  ! 772: STBAR	stbar
	.word 0x8143e011  ! 773: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xd4ba1009  ! 774: STDA_R	stda	%r10, [%r8 + %r9] 0x80
	.word 0x87a20929  ! 775: FMULs	fmuls	%f8, %f9, %f3
	.word 0x8f220009  ! 776: MULScc_R	mulscc 	%r8, %r9, %r7
	.word 0xc53a25b8  ! 777: STDF_I	std	%f2, [0x05b8, %r8]
	.word 0x8143e06d  ! 778: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #MemIssue | #Sync 
	.word 0x10800004  ! 779: BA	ba  	<label_0x4>
	.word 0xfcc22250  ! 780: LDSWA_I	ldswa	[%r8, + 0x0250] %asi, %r30
	.word 0xc2520009  ! 781: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xc2aa2558  ! 782: STBA_I	stba	%r1, [%r8 + 0x0558] %asi
	.word 0x87a20929  ! 783: FMULs	fmuls	%f8, %f9, %f3
	.word 0xc36a29e8  ! 784: PREFETCH_I	prefetch	[%r8 + 0x09e8], #one_read
	.word 0x8143c000  ! 785: STBAR	stbar
	.word 0x2cca0008  ! 786: BRGZ	brgz,a,pt	%8,<label_0xa0008>
	.word 0xc6b21009  ! 787: STHA_R	stha	%r3, [%r8 + %r9] 0x80
	.word 0xc73a0009  ! 788: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc41a0009  ! 790: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xff3a0009  ! 791: STDF_R	std	%f31, [%r9, %r8]
	.word 0x8143e02a  ! 792: MEMBAR	membar	#StoreLoad | #StoreStore | #MemIssue 
	.word 0xc41a0009  ! 793: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x85a20829  ! 794: FADDs	fadds	%f8, %f9, %f2
	.word 0x0a800004  ! 796: BCS	bcs  	<label_0x4>
	.word 0xe9220009  ! 797: STF_R	st	%f20, [%r9, %r8]
	.word 0xc26a2c40  ! 798: LDSTUB_I	ldstub	%r1, [%r8 + 0x0c40]
	.word 0x2e800004  ! 799: BVS	bvs,a	<label_0x4>
	.word 0xc36a22f0  ! 800: PREFETCH_I	prefetch	[%r8 + 0x02f0], #one_read
	.word 0x89a20829  ! 801: FADDs	fadds	%f8, %f9, %f4
	.word 0x8143c000  ! 802: STBAR	stbar
	.word 0xc46a0009  ! 804: LDSTUB_R	ldstub	%r2, [%r8 + %r9]
	.word 0xe2fa1009  ! 805: SWAPA_R	swapa	%r17, [%r8 + %r9] 0x80
	.word 0x87220009  ! 806: MULScc_R	mulscc 	%r8, %r9, %r3
	.word 0xc88228b0  ! 807: LDUWA_I	lduwa	[%r8, + 0x08b0] %asi, %r4
	.word 0xc8f22d80  ! 808: STXA_I	stxa	%r4, [%r8 + 0x0d80] %asi
	.word 0xec1a27b8  ! 810: LDD_I	ldd	[%r8 + 0x07b8], %r22
	.word 0xc612276c  ! 811: LDUH_I	lduh	[%r8 + 0x076c], %r3
	.word 0x8143c000  ! 812: STBAR	stbar
	.word 0xcc0a2b34  ! 813: LDUB_I	ldub	[%r8 + 0x0b34], %r6
	.word 0xca020009  ! 814: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0x0c800004  ! 815: BNEG	bneg  	<label_0x4>
	.word 0xaa7a0009  ! 816: SDIV_R	sdiv 	%r8, %r9, %r21
	.word 0xbba209a9  ! 817: FDIVs	fdivs	%f8, %f9, %f29
	.word 0x2e800004  ! 818: BVS	bvs,a	<label_0x4>
	.word 0x8cf22458  ! 819: UDIVcc_I	udivcc 	%r8, 0x0458, %r6
	.word 0x89a209a9  ! 820: FDIVs	fdivs	%f8, %f9, %f4
	.word 0x82520009  ! 821: UMUL_R	umul 	%r8, %r9, %r1
	.word 0xc4fa2948  ! 822: SWAPA_I	swapa	%r2, [%r8 + 0x0948] %asi
	.word 0xc8822908  ! 823: LDUWA_I	lduwa	[%r8, + 0x0908] %asi, %r4
	.word 0xc3ea2ee0  ! 824: PREFETCHA_I	prefetcha	[%r8, + 0x0ee0] %asi, #one_read
	.word 0xe5220009  ! 825: STF_R	st	%f18, [%r9, %r8]
	.word 0x84f22284  ! 827: UDIVcc_I	udivcc 	%r8, 0x0284, %r2
	.word 0xc47a2974  ! 828: SWAP_I	swap	%r2, [%r8 + 0x0974]
	.word 0xfc9a25b8  ! 829: LDDA_I	ldda	[%r8, + 0x05b8] %asi, %r30
	.word 0xc4aa1009  ! 831: STBA_R	stba	%r2, [%r8 + %r9] 0x80
	.word 0xb86a2844  ! 832: UDIVX_I	udivx 	%r8, 0x0844, %r28
	.word 0x8a5220f8  ! 833: UMUL_I	umul 	%r8, 0x00f8, %r5
	.word 0x876a29f8  ! 834: SDIVX_I	sdivx	%r8, 0x09f8, %r3
	.word 0xe6522eac  ! 835: LDSH_I	ldsh	[%r8 + 0x0eac], %r19
	.word 0x82fa0009  ! 836: SDIVcc_R	sdivcc 	%r8, %r9, %r1
	.word 0x8a6a0009  ! 837: UDIVX_R	udivx 	%r8, %r9, %r5
	.word 0xc4120009  ! 838: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xb16a0009  ! 839: SDIVX_R	sdivx	%r8, %r9, %r24
	.word 0x8a6a0009  ! 840: UDIVX_R	udivx 	%r8, %r9, %r5
	.word 0xe2922ff0  ! 841: LDUHA_I	lduha	[%r8, + 0x0ff0] %asi, %r17
	.word 0xc53a0009  ! 842: STDF_R	std	%f2, [%r9, %r8]
	.word 0x38800004  ! 843: BGU	bgu,a	<label_0x4>
	.word 0x32800008  ! 844: BNE	bne,a	<label_0x8>
	.word 0xaef20009  ! 845: UDIVcc_R	udivcc 	%r8, %r9, %r23
	.word 0xcfe21009  ! 846: CASA_I	casa	[%r8] 0x80, %r9, %r7
	.word 0x36800008  ! 847: BGE	bge,a	<label_0x8>
	.word 0x8d222dc4  ! 848: MULScc_I	mulscc 	%r8, 0x0dc4, %r6
	.word 0x3e800004  ! 849: BVC	bvc,a	<label_0x4>
	.word 0x06ca0008  ! 850: BRLZ	brlz  ,pt	%8,<label_0xa0008>
	.word 0x8c720009  ! 851: UDIV_R	udiv 	%r8, %r9, %r6
	.word 0xc36a2aac  ! 852: PREFETCH_I	prefetch	[%r8 + 0x0aac], #one_read
	.word 0xc6b22200  ! 853: STHA_I	stha	%r3, [%r8 + 0x0200] %asi
	.word 0x8a6a2100  ! 854: UDIVX_I	udivx 	%r8, 0x0100, %r5
	.word 0xea4a26b4  ! 855: LDSB_I	ldsb	[%r8 + 0x06b4], %r21
	.word 0xf8fa1009  ! 856: SWAPA_R	swapa	%r28, [%r8 + %r9] 0x80
	.word 0xe4ba2670  ! 857: STDA_I	stda	%r18, [%r8 + 0x0670] %asi
	.word 0xc8fa250c  ! 858: SWAPA_I	swapa	%r4, [%r8 + 0x050c] %asi
	.word 0x38800008  ! 860: BGU	bgu,a	<label_0x8>
	.word 0x8143c000  ! 861: STBAR	stbar
	.word 0xc8122290  ! 862: LDUH_I	lduh	[%r8 + 0x0290], %r4
	.word 0xccea1009  ! 863: LDSTUBA_R	ldstuba	%r6, [%r8 + %r9] 0x80
	.word 0xf4fa2a18  ! 864: SWAPA_I	swapa	%r26, [%r8 + 0x0a18] %asi
	.word 0xc4da23a0  ! 865: LDXA_I	ldxa	[%r8, + 0x03a0] %asi, %r2
	.word 0xa4f22978  ! 866: UDIVcc_I	udivcc 	%r8, 0x0978, %r18
	.word 0xbad227ac  ! 867: UMULcc_I	umulcc 	%r8, 0x07ac, %r29
	.word 0x9e520009  ! 868: UMUL_R	umul 	%r8, %r9, %r15
	.word 0xe0ba1009  ! 869: STDA_R	stda	%r16, [%r8 + %r9] 0x80
	.word 0x864a0009  ! 870: MULX_R	mulx 	%r8, %r9, %r3
	.word 0xf6822a54  ! 871: LDUWA_I	lduwa	[%r8, + 0x0a54] %asi, %r27
	.word 0xe65a0009  ! 872: LDX_R	ldx	[%r8 + %r9], %r19
	.word 0x12800008  ! 873: BNE	bne  	<label_0x8>
	.word 0xccea1009  ! 874: LDSTUBA_R	ldstuba	%r6, [%r8 + %r9] 0x80
	.word 0xae6a0009  ! 875: UDIVX_R	udivx 	%r8, %r9, %r23
	.word 0xc3ea2e10  ! 876: PREFETCHA_I	prefetcha	[%r8, + 0x0e10] %asi, #one_read
	.word 0xc2ea1009  ! 877: LDSTUBA_R	ldstuba	%r1, [%r8 + %r9] 0x80
	.word 0xc4aa2fc8  ! 878: STBA_I	stba	%r2, [%r8 + 0x0fc8] %asi
	.word 0x2c800008  ! 879: BNEG	bneg,a	<label_0x8>
	.word 0x12800004  ! 881: BNE	bne  	<label_0x4>
	.word 0x847a0009  ! 882: SDIV_R	sdiv 	%r8, %r9, %r2
	.word 0x8143c000  ! 883: STBAR	stbar
	.word 0x8143c000  ! 884: STBAR	stbar
	.word 0xd49a2040  ! 885: LDDA_I	ldda	[%r8, + 0x0040] %asi, %r10
	.word 0xa06a243c  ! 886: UDIVX_I	udivx 	%r8, 0x043c, %r16
	.word 0xcc6a0009  ! 887: LDSTUB_R	ldstub	%r6, [%r8 + %r9]
	.word 0xca6a2f74  ! 888: LDSTUB_I	ldstub	%r5, [%r8 + 0x0f74]
	.word 0xceb22f90  ! 889: STHA_I	stha	%r7, [%r8 + 0x0f90] %asi
	.word 0xc36a2124  ! 890: PREFETCH_I	prefetch	[%r8 + 0x0124], #one_read
	.word 0x82720009  ! 891: UDIV_R	udiv 	%r8, %r9, %r1
	.word 0x8ed20009  ! 892: UMULcc_R	umulcc 	%r8, %r9, %r7
	.word 0x88d2233c  ! 893: UMULcc_I	umulcc 	%r8, 0x033c, %r4
	.word 0xa5a209a9  ! 894: FDIVs	fdivs	%f8, %f9, %f18
	.word 0xb2d22400  ! 895: UMULcc_I	umulcc 	%r8, 0x0400, %r25
	.word 0xd8da1009  ! 896: LDXA_R	ldxa	[%r8, %r9] 0x80, %r12
	.word 0xccda2660  ! 897: LDXA_I	ldxa	[%r8, + 0x0660] %asi, %r6
	.word 0x845a0009  ! 898: SMUL_R	smul 	%r8, %r9, %r2
	.word 0x83a208a9  ! 899: FSUBs	fsubs	%f8, %f9, %f1
	.word 0xd8c21009  ! 900: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r12
	.word 0x8ed225b0  ! 901: UMULcc_I	umulcc 	%r8, 0x05b0, %r7
	.word 0x8143e001  ! 902: MEMBAR	membar	#LoadLoad 
	.word 0xf4ba1009  ! 903: STDA_R	stda	%r26, [%r8 + %r9] 0x80
	.word 0xc3ea2c5c  ! 904: PREFETCHA_I	prefetcha	[%r8, + 0x0c5c] %asi, #one_read
	.word 0xc6aa2424  ! 905: STBA_I	stba	%r3, [%r8 + 0x0424] %asi
	.word 0x04800008  ! 906: BLE	ble  	<label_0x8>
	.word 0x9d6a0009  ! 907: SDIVX_R	sdivx	%r8, %r9, %r14
	.word 0xc2da1009  ! 908: LDXA_R	ldxa	[%r8, %r9] 0x80, %r1
	.word 0xc6b21009  ! 910: STHA_R	stha	%r3, [%r8 + %r9] 0x80
	.word 0xdc9a1009  ! 911: LDDA_R	ldda	[%r8, %r9] 0x80, %r14
	.word 0xe13a0009  ! 912: STDF_R	std	%f16, [%r9, %r8]
	.word 0x30800008  ! 913: BA	ba,a	<label_0x8>
	.word 0x14800004  ! 914: BG	bg  	<label_0x4>
	.word 0x85a209a9  ! 915: FDIVs	fdivs	%f8, %f9, %f2
	.word 0x38800004  ! 916: BGU	bgu,a	<label_0x4>
	.word 0xc3ea2d30  ! 917: PREFETCHA_I	prefetcha	[%r8, + 0x0d30] %asi, #one_read
	.word 0xf6c21009  ! 918: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r27
	.word 0xc40a29c8  ! 919: LDUB_I	ldub	[%r8 + 0x09c8], %r2
	.word 0xcc9a1009  ! 920: LDDA_R	ldda	[%r8, %r9] 0x80, %r6
	.word 0xc6f21009  ! 921: STXA_R	stxa	%r3, [%r8 + %r9] 0x80
	.word 0xd4da2eb8  ! 922: LDXA_I	ldxa	[%r8, + 0x0eb8] %asi, %r10
	.word 0x8143e030  ! 923: MEMBAR	membar	#Lookaside | #MemIssue 
	.word 0x8143c000  ! 924: STBAR	stbar
	.word 0xc80a0009  ! 926: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xc73a0009  ! 927: STDF_R	std	%f3, [%r9, %r8]
	.word 0x30800004  ! 928: BA	ba,a	<label_0x4>
	.word 0x82720009  ! 929: UDIV_R	udiv 	%r8, %r9, %r1
	.word 0x885a21c0  ! 930: SMUL_I	smul 	%r8, 0x01c0, %r4
	.word 0x8143c000  ! 931: STBAR	stbar
	.word 0x8e6a2834  ! 932: UDIVX_I	udivx 	%r8, 0x0834, %r7
	.word 0xc2f227d0  ! 933: STXA_I	stxa	%r1, [%r8 + 0x07d0] %asi
	.word 0xd8120009  ! 934: LDUH_R	lduh	[%r8 + %r9], %r12
	.word 0xcc420009  ! 935: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0x24c20008  ! 936: BRLEZ	brlez,a,nt	%8,<label_0x20008>
	.word 0x9c722700  ! 937: UDIV_I	udiv 	%r8, 0x0700, %r14
	.word 0xcaaa1009  ! 938: STBA_R	stba	%r5, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 939: STBAR	stbar
	.word 0xc3ea23d0  ! 940: PREFETCHA_I	prefetcha	[%r8, + 0x03d0] %asi, #one_read
	.word 0x8cfa0009  ! 941: SDIVcc_R	sdivcc 	%r8, %r9, %r6
	.word 0xf48a1009  ! 942: LDUBA_R	lduba	[%r8, %r9] 0x80, %r26
	.word 0xceda2a88  ! 943: LDXA_I	ldxa	[%r8, + 0x0a88] %asi, %r7
	.word 0xc2ca2950  ! 944: LDSBA_I	ldsba	[%r8, + 0x0950] %asi, %r1
	.word 0xee4a0009  ! 945: LDSB_R	ldsb	[%r8 + %r9], %r23
	.word 0x864a266c  ! 946: MULX_I	mulx 	%r8, 0x066c, %r3
	.word 0xec0a0009  ! 947: LDUB_R	ldub	[%r8 + %r9], %r22
	.word 0x864a0009  ! 948: MULX_R	mulx 	%r8, %r9, %r3
	.word 0xcac21009  ! 950: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r5
	.word 0xc25a0009  ! 951: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0x40000004  ! 953: CALL	call	disp30_4
	.word 0x8143e062  ! 954: MEMBAR	membar	#StoreLoad | #MemIssue | #Sync 
	.word 0x36800004  ! 955: BGE	bge,a	<label_0x4>
	.word 0xbf220009  ! 956: MULScc_R	mulscc 	%r8, %r9, %r31
	.word 0xd4921009  ! 957: LDUHA_R	lduha	[%r8, %r9] 0x80, %r10
	.word 0x8c5a0009  ! 958: SMUL_R	smul 	%r8, %r9, %r6
	.word 0xc87a243c  ! 959: SWAP_I	swap	%r4, [%r8 + 0x043c]
	.word 0x864a2140  ! 960: MULX_I	mulx 	%r8, 0x0140, %r3
	.word 0xcaaa1009  ! 961: STBA_R	stba	%r5, [%r8 + %r9] 0x80
	.word 0xcd3a2208  ! 962: STDF_I	std	%f6, [0x0208, %r8]
	.word 0x8d6a0009  ! 963: SDIVX_R	sdivx	%r8, %r9, %r6
	.word 0x85a208a9  ! 964: FSUBs	fsubs	%f8, %f9, %f2
	.word 0x8522236c  ! 965: MULScc_I	mulscc 	%r8, 0x036c, %r2
	.word 0xc65a2718  ! 966: LDX_I	ldx	[%r8 + 0x0718], %r3
	.word 0xcc6a0009  ! 967: LDSTUB_R	ldstub	%r6, [%r8 + %r9]
	.word 0xfcba2f50  ! 968: STDA_I	stda	%r30, [%r8 + 0x0f50] %asi
	.word 0x0cca0004  ! 969: BRGZ	brgz  ,pt	%8,<label_0xa0004>
	.word 0xbefa23b4  ! 970: SDIVcc_I	sdivcc 	%r8, 0x03b4, %r31
	.word 0xcaf21009  ! 971: STXA_R	stxa	%r5, [%r8 + %r9] 0x80
	.word 0xf6921009  ! 972: LDUHA_R	lduha	[%r8, %r9] 0x80, %r27
	.word 0x14800004  ! 973: BG	bg  	<label_0x4>
	.word 0xc3ea2b8c  ! 974: PREFETCHA_I	prefetcha	[%r8, + 0x0b8c] %asi, #one_read
	.word 0x8c720009  ! 975: UDIV_R	udiv 	%r8, %r9, %r6
	.word 0xce020009  ! 976: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0x8ad22450  ! 977: UMULcc_I	umulcc 	%r8, 0x0450, %r5
	.word 0xfc1a20c8  ! 978: LDD_I	ldd	[%r8 + 0x00c8], %r30
	.word 0x84fa2644  ! 979: SDIVcc_I	sdivcc 	%r8, 0x0644, %r2
	.word 0x956a2c48  ! 980: SDIVX_I	sdivx	%r8, 0x0c48, %r10
	.word 0x02ca0004  ! 981: BRZ	brz  ,pt	%8,<label_0xa0004>
	.word 0xcde21009  ! 983: CASA_I	casa	[%r8] 0x80, %r9, %r6
	.word 0x1a800008  ! 984: BCC	bcc  	<label_0x8>
	.word 0x2c800004  ! 985: BNEG	bneg,a	<label_0x4>
	.word 0xc3f22009  ! 986: CASXA_R	casxa	[%r8]%asi, %r9, %r1
	.word 0x8143e000  ! 987: MEMBAR	membar	
	.word 0x00800004  ! 988: BN	bn  	<label_0x4>
	.word 0xd41a2718  ! 989: LDD_I	ldd	[%r8 + 0x0718], %r10
	.word 0xe4aa26a8  ! 990: STBA_I	stba	%r18, [%r8 + 0x06a8] %asi
	.word 0x8a4a0009  ! 991: MULX_R	mulx 	%r8, %r9, %r5
	.word 0xc3ea2890  ! 992: PREFETCHA_I	prefetcha	[%r8, + 0x0890] %asi, #one_read
	.word 0xc87a24a8  ! 993: SWAP_I	swap	%r4, [%r8 + 0x04a8]
	.word 0x20800004  ! 994: BN	bn,a	<label_0x4>
	.word 0xb0fa0009  ! 995: SDIVcc_R	sdivcc 	%r8, %r9, %r24
	.word 0x8143c000  ! 997: STBAR	stbar
	.word 0x1e800004  ! 998: BVC	bvc  	<label_0x4>
	.word 0xc8c22074  ! 999: LDSWA_I	ldswa	[%r8, + 0x0074] %asi, %r4
        ta      T_GOOD_TRAP

th_main_3:
        setx  MAIN_BASE_DATA_VA, %r1, %r8
        setx  0x0000000000000bc0, %g1, %r9
        setx  0x80, %g2, %g1
        wr  %g1, %g0, %asi
	    rd %fprs, %g0
        wr %g0, 0x4, %fprs
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
        setx  0x8f1849ff9a81817a, %g1, %r0
        setx  0xa7d0448f9ebcdaa4, %g1, %r1
        setx  0x61d4bb993e78147f, %g1, %r2
        setx  0xcffd68f846087396, %g1, %r3
        setx  0xbf7618e6a8a5c09a, %g1, %r4
        setx  0xa4c785e5761c89e0, %g1, %r5
        setx  0xc3e57d1a68527128, %g1, %r6
        setx  0x12dc34bed5ac2e73, %g1, %r7
        setx  0x94f27e334d5ba7e1, %g1, %r10
        setx  0xa98e9c689a201b79, %g1, %r11
        setx  0x3b55a4046833decd, %g1, %r12
        setx  0x35b23d6fc29a7613, %g1, %r13
        setx  0xe619c532b009e423, %g1, %r14
        setx  0x749ec25dd499d58d, %g1, %r15
        setx  0xa9ea93442137d661, %g1, %r16
        setx  0xd86c46ae25ca7f94, %g1, %r17
        setx  0x7c009ee48bf37dbe, %g1, %r18
        setx  0x2dd2db6631a3f4dc, %g1, %r19
        setx  0xf6c1001d51b57bf8, %g1, %r20
        setx  0x3372bde68a78c293, %g1, %r21
        setx  0x2834aedf63264341, %g1, %r22
        setx  0xe15789b77665ce1b, %g1, %r23
        setx  0x1bb8a42bba53a846, %g1, %r24
        setx  0x43f461288b70ce6b, %g1, %r25
        setx  0x8b72eb69c559982e, %g1, %r26
        setx  0xf01bc89d17e33060, %g1, %r27
        setx  0x50e20056dc8bde1c, %g1, %r28
        setx  0x66c480e9500f9012, %g1, %r29
        setx  0x4c4fa439ed77c9cd, %g1, %r30
        setx  0xcb1f4dee252b3ebf, %g1, %r31
	.word 0x0cc20004  ! 5: BRGZ	brgz  ,nt	%8,<label_0x20004>
	.word 0x24c20004  ! 6: BRLEZ	brlez,a,nt	%8,<label_0x20004>
	.word 0xca7a0009  ! 7: SWAP_R	swap	%r5, [%r8 + %r9]
	.word 0x8143e04d  ! 8: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Sync 
	.word 0xcaca1009  ! 9: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r5
	.word 0xeff21009  ! 10: CASXA_I	casxa	[%r8] 0x80, %r9, %r23
	.word 0xf88a20c4  ! 11: LDUBA_I	lduba	[%r8, + 0x00c4] %asi, %r28
	.word 0xb8f22444  ! 12: UDIVcc_I	udivcc 	%r8, 0x0444, %r28
	.word 0x8143c000  ! 13: STBAR	stbar
	.word 0xfc821009  ! 14: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r30
	.word 0xe81a0009  ! 15: LDD_R	ldd	[%r8 + %r9], %r20
	.word 0x8143c000  ! 16: STBAR	stbar
	.word 0x8e6a0009  ! 17: UDIVX_R	udivx 	%r8, %r9, %r7
	.word 0xc8fa2068  ! 18: SWAPA_I	swapa	%r4, [%r8 + 0x0068] %asi
	.word 0x8143c000  ! 19: STBAR	stbar
	.word 0xe4b21009  ! 20: STHA_R	stha	%r18, [%r8 + %r9] 0x80
	.word 0x0c800008  ! 21: BNEG	bneg  	<label_0x8>
	.word 0x8e522018  ! 22: UMUL_I	umul 	%r8, 0x0018, %r7
	.word 0x2ac20004  ! 23: BRNZ	brnz,a,nt	%8,<label_0x20004>
	.word 0xc3ea2d38  ! 24: PREFETCHA_I	prefetcha	[%r8, + 0x0d38] %asi, #one_read
	.word 0x8143e076  ! 25: MEMBAR	membar	#StoreLoad | #LoadStore | #Lookaside | #MemIssue | #Sync 
	.word 0x8143e015  ! 26: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside 
	.word 0xc48a1009  ! 27: LDUBA_R	lduba	[%r8, %r9] 0x80, %r2
	.word 0x8143c000  ! 28: STBAR	stbar
	.word 0xcada1009  ! 30: LDXA_R	ldxa	[%r8, %r9] 0x80, %r5
	.word 0x8ba20929  ! 31: FMULs	fmuls	%f8, %f9, %f5
	.word 0xd81a0009  ! 32: LDD_R	ldd	[%r8 + %r9], %r12
	.word 0xe0d21009  ! 33: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r16
	.word 0xfada1009  ! 34: LDXA_R	ldxa	[%r8, %r9] 0x80, %r29
	.word 0xcc5a0009  ! 35: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0x1c800004  ! 36: BPOS	bpos  	<label_0x4>
	.word 0x8143e00e  ! 37: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore 
	.word 0xca7a2e30  ! 38: SWAP_I	swap	%r5, [%r8 + 0x0e30]
	.word 0x88f20009  ! 39: UDIVcc_R	udivcc 	%r8, %r9, %r4
	.word 0xbe5a0009  ! 40: SMUL_R	smul 	%r8, %r9, %r31
	.word 0x20800004  ! 41: BN	bn,a	<label_0x4>
	.word 0xce520009  ! 42: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xc36a2e0c  ! 43: PREFETCH_I	prefetch	[%r8 + 0x0e0c], #one_read
	.word 0x08800004  ! 45: BLEU	bleu  	<label_0x4>
	.word 0x8143c000  ! 47: STBAR	stbar
	.word 0xb8520009  ! 48: UMUL_R	umul 	%r8, %r9, %r28
	.word 0xa3a208a9  ! 49: FSUBs	fsubs	%f8, %f9, %f17
	.word 0xc2fa1009  ! 50: SWAPA_R	swapa	%r1, [%r8 + %r9] 0x80
	.word 0xd4ba2678  ! 51: STDA_I	stda	%r10, [%r8 + 0x0678] %asi
	.word 0xa6d2205c  ! 52: UMULcc_I	umulcc 	%r8, 0x005c, %r19
	.word 0xa2fa2db0  ! 53: SDIVcc_I	sdivcc 	%r8, 0x0db0, %r17
	.word 0xd68a2a98  ! 54: LDUBA_I	lduba	[%r8, + 0x0a98] %asi, %r11
	.word 0x8a4a0009  ! 55: MULX_R	mulx 	%r8, %r9, %r5
	.word 0xcde21009  ! 56: CASA_I	casa	[%r8] 0x80, %r9, %r6
	.word 0x8eda0009  ! 57: SMULcc_R	smulcc 	%r8, %r9, %r7
	.word 0xeeb22e1c  ! 58: STHA_I	stha	%r23, [%r8 + 0x0e1c] %asi
	.word 0xc4da2438  ! 59: LDXA_I	ldxa	[%r8, + 0x0438] %asi, %r2
	.word 0x8143e05d  ! 60: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0xac4a2dac  ! 61: MULX_I	mulx 	%r8, 0x0dac, %r22
	.word 0x12800004  ! 62: BNE	bne  	<label_0x4>
	.word 0xf41a0009  ! 63: LDD_R	ldd	[%r8 + %r9], %r26
	.word 0xcb3a0009  ! 64: STDF_R	std	%f5, [%r9, %r8]
	.word 0x83a20829  ! 65: FADDs	fadds	%f8, %f9, %f1
	.word 0xc28a22cc  ! 66: LDUBA_I	lduba	[%r8, + 0x02cc] %asi, %r1
	.word 0x8143e01a  ! 67: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside 
	.word 0x8fa209a9  ! 68: FDIVs	fdivs	%f8, %f9, %f7
	.word 0xdc9a2940  ! 69: LDDA_I	ldda	[%r8, + 0x0940] %asi, %r14
	.word 0x84fa2fe0  ! 70: SDIVcc_I	sdivcc 	%r8, 0x0fe0, %r2
	.word 0xb5a209a9  ! 71: FDIVs	fdivs	%f8, %f9, %f26
	.word 0xcc120009  ! 72: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xcc922174  ! 73: LDUHA_I	lduha	[%r8, + 0x0174] %asi, %r6
	.word 0xc27a0009  ! 74: SWAP_R	swap	%r1, [%r8 + %r9]
	.word 0x987a27f0  ! 75: SDIV_I	sdiv 	%r8, 0x07f0, %r12
	.word 0x8c522afc  ! 76: UMUL_I	umul 	%r8, 0x0afc, %r6
	.word 0x8c4a0009  ! 77: MULX_R	mulx 	%r8, %r9, %r6
	.word 0x8e7a0009  ! 78: SDIV_R	sdiv 	%r8, %r9, %r7
	.word 0x8143c000  ! 79: STBAR	stbar
	.word 0x36800004  ! 80: BGE	bge,a	<label_0x4>
	.word 0x82fa0009  ! 81: SDIVcc_R	sdivcc 	%r8, %r9, %r1
	.word 0xbda209a9  ! 82: FDIVs	fdivs	%f8, %f9, %f30
	.word 0xc36a2874  ! 83: PREFETCH_I	prefetch	[%r8 + 0x0874], #one_read
	.word 0x26800004  ! 84: BL	bl,a	<label_0x4>
	.word 0xcc1227d4  ! 85: LDUH_I	lduh	[%r8 + 0x07d4], %r6
	.word 0x9ba208a9  ! 86: FSUBs	fsubs	%f8, %f9, %f13
	.word 0x896a27f8  ! 87: SDIVX_I	sdivx	%r8, 0x07f8, %r4
	.word 0x8c520009  ! 88: UMUL_R	umul 	%r8, %r9, %r6
	.word 0xfa6a2cf0  ! 89: LDSTUB_I	ldstub	%r29, [%r8 + 0x0cf0]
	.word 0xaba20929  ! 90: FMULs	fmuls	%f8, %f9, %f21
	.word 0xe8ba20e0  ! 91: STDA_I	stda	%r20, [%r8 + 0x00e0] %asi
	.word 0x8143e02a  ! 92: MEMBAR	membar	#StoreLoad | #StoreStore | #MemIssue 
	.word 0xf5e22009  ! 93: CASA_R	casa	[%r8] %asi, %r9, %r26
	.word 0x88da20d0  ! 94: SMULcc_I	smulcc 	%r8, 0x00d0, %r4
	.word 0xd4ba1009  ! 95: STDA_R	stda	%r10, [%r8 + %r9] 0x80
	.word 0xfcd223ac  ! 96: LDSHA_I	ldsha	[%r8, + 0x03ac] %asi, %r30
	.word 0xc47a2054  ! 97: SWAP_I	swap	%r2, [%r8 + 0x0054]
	.word 0x84fa2fd4  ! 98: SDIVcc_I	sdivcc 	%r8, 0x0fd4, %r2
	.word 0xc3ea2814  ! 99: PREFETCHA_I	prefetcha	[%r8, + 0x0814] %asi, #one_read
	.word 0xafa20929  ! 100: FMULs	fmuls	%f8, %f9, %f23
	.word 0xc4d22a38  ! 101: LDSHA_I	ldsha	[%r8, + 0x0a38] %asi, %r2
	.word 0x8143e07f  ! 102: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xf8ba2f80  ! 103: STDA_I	stda	%r28, [%r8 + 0x0f80] %asi
	.word 0xf25a0009  ! 104: LDX_R	ldx	[%r8 + %r9], %r25
	.word 0xcaca2f04  ! 105: LDSBA_I	ldsba	[%r8, + 0x0f04] %asi, %r5
	.word 0xc41a0009  ! 106: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xc3222920  ! 107: STF_I	st	%f1, [0x0920, %r8]
	.word 0x8d6a0009  ! 108: SDIVX_R	sdivx	%r8, %r9, %r6
	.word 0xeeaa1009  ! 111: STBA_R	stba	%r23, [%r8 + %r9] 0x80
	.word 0x95a209a9  ! 112: FDIVs	fdivs	%f8, %f9, %f10
	.word 0x8c7a2ec0  ! 113: SDIV_I	sdiv 	%r8, 0x0ec0, %r6
	.word 0xcad22770  ! 114: LDSHA_I	ldsha	[%r8, + 0x0770] %asi, %r5
	.word 0x8afa0009  ! 115: SDIVcc_R	sdivcc 	%r8, %r9, %r5
	.word 0xc36a2e00  ! 116: PREFETCH_I	prefetch	[%r8 + 0x0e00], #one_read
	.word 0x8ada0009  ! 117: SMULcc_R	smulcc 	%r8, %r9, %r5
	.word 0x8143c000  ! 118: STBAR	stbar
	.word 0xc68a1009  ! 120: LDUBA_R	lduba	[%r8, %r9] 0x80, %r3
	.word 0xccca26f8  ! 121: LDSBA_I	ldsba	[%r8, + 0x06f8] %asi, %r6
	.word 0xca4a0009  ! 122: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0x8143e05b  ! 123: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Lookaside | #Sync 
	.word 0x89a20829  ! 124: FADDs	fadds	%f8, %f9, %f4
	.word 0x28800008  ! 125: BLEU	bleu,a	<label_0x8>
	.word 0x22c20008  ! 126: BRZ	brz,a,nt	%8,<label_0x20008>
	.word 0x10800004  ! 127: BA	ba  	<label_0x4>
	.word 0xc6921009  ! 129: LDUHA_R	lduha	[%r8, %r9] 0x80, %r3
	.word 0x8c4a0009  ! 130: MULX_R	mulx 	%r8, %r9, %r6
	.word 0xa0f22f80  ! 131: UDIVcc_I	udivcc 	%r8, 0x0f80, %r16
	.word 0xc6ea2dd8  ! 132: LDSTUBA_I	ldstuba	%r3, [%r8 + 0x0dd8] %asi
	.word 0x8a7a2468  ! 133: SDIV_I	sdiv 	%r8, 0x0468, %r5
	.word 0xcaca1009  ! 134: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r5
	.word 0xc8ca1009  ! 135: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r4
	.word 0xc3ea2474  ! 136: PREFETCHA_I	prefetcha	[%r8, + 0x0474] %asi, #one_read
	.word 0xcc5a0009  ! 137: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xcc1a26f0  ! 138: LDD_I	ldd	[%r8 + 0x06f0], %r6
	.word 0xf0822fc0  ! 139: LDUWA_I	lduwa	[%r8, + 0x0fc0] %asi, %r24
	.word 0x8143c000  ! 140: STBAR	stbar
	.word 0xe6921009  ! 141: LDUHA_R	lduha	[%r8, %r9] 0x80, %r19
	.word 0x0e800004  ! 142: BVS	bvs  	<label_0x4>
	.word 0xcafa2064  ! 143: SWAPA_I	swapa	%r5, [%r8 + 0x0064] %asi
	.word 0xf4821009  ! 145: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r26
	.word 0xc4120009  ! 146: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0x865a0009  ! 147: SMUL_R	smul 	%r8, %r9, %r3
	.word 0x824a26d4  ! 148: MULX_I	mulx 	%r8, 0x06d4, %r1
	.word 0x865a26ac  ! 149: SMUL_I	smul 	%r8, 0x06ac, %r3
	.word 0xb6da225c  ! 150: SMULcc_I	smulcc 	%r8, 0x025c, %r27
	.word 0xce6a2dec  ! 151: LDSTUB_I	ldstub	%r7, [%r8 + 0x0dec]
	.word 0xc28a1009  ! 152: LDUBA_R	lduba	[%r8, %r9] 0x80, %r1
	.word 0x88d22760  ! 153: UMULcc_I	umulcc 	%r8, 0x0760, %r4
	.word 0x8143e035  ! 154: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside | #MemIssue 
	.word 0x83a20929  ! 155: FMULs	fmuls	%f8, %f9, %f1
	.word 0xf0921009  ! 156: LDUHA_R	lduha	[%r8, %r9] 0x80, %r24
	.word 0xcff21009  ! 157: CASXA_I	casxa	[%r8] 0x80, %r9, %r7
	.word 0xcd3a2ce0  ! 158: STDF_I	std	%f6, [0x0ce0, %r8]
	.word 0xcfe22009  ! 159: CASA_R	casa	[%r8] %asi, %r9, %r7
	.word 0xce520009  ! 160: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xb5a208a9  ! 161: FSUBs	fsubs	%f8, %f9, %f26
	.word 0xc89a2068  ! 162: LDDA_I	ldda	[%r8, + 0x0068] %asi, %r4
	.word 0x86d20009  ! 163: UMULcc_R	umulcc 	%r8, %r9, %r3
	.word 0x06800004  ! 164: BL	bl  	<label_0x4>
	.word 0xdefa2398  ! 165: SWAPA_I	swapa	%r15, [%r8 + 0x0398] %asi
	.word 0xf8a22fa4  ! 166: STWA_I	stwa	%r28, [%r8 + 0x0fa4] %asi
	.word 0xe4422180  ! 167: LDSW_I	ldsw	[%r8 + 0x0180], %r18
	.word 0x847229d0  ! 168: UDIV_I	udiv 	%r8, 0x09d0, %r2
	.word 0x8143c000  ! 169: STBAR	stbar
	.word 0x8143e022  ! 170: MEMBAR	membar	#StoreLoad | #MemIssue 
	.word 0xc5f21009  ! 171: CASXA_I	casxa	[%r8] 0x80, %r9, %r2
	.word 0xf64a2084  ! 172: LDSB_I	ldsb	[%r8 + 0x0084], %r27
	.word 0xc48a1009  ! 173: LDUBA_R	lduba	[%r8, %r9] 0x80, %r2
	.word 0x8143c000  ! 174: STBAR	stbar
	.word 0xb5a208a9  ! 175: FSUBs	fsubs	%f8, %f9, %f26
	.word 0xc2fa1009  ! 176: SWAPA_R	swapa	%r1, [%r8 + %r9] 0x80
	.word 0x8efa21b4  ! 177: SDIVcc_I	sdivcc 	%r8, 0x01b4, %r7
	.word 0xceb21009  ! 178: STHA_R	stha	%r7, [%r8 + %r9] 0x80
	.word 0x8272246c  ! 179: UDIV_I	udiv 	%r8, 0x046c, %r1
	.word 0xfcba2448  ! 180: STDA_I	stda	%r30, [%r8 + 0x0448] %asi
	.word 0xc4d22340  ! 181: LDSHA_I	ldsha	[%r8, + 0x0340] %asi, %r2
	.word 0xe41a0009  ! 182: LDD_R	ldd	[%r8 + %r9], %r18
	.word 0x9da209a9  ! 183: FDIVs	fdivs	%f8, %f9, %f14
	.word 0xd87a0009  ! 184: SWAP_R	swap	%r12, [%r8 + %r9]
	.word 0x8143e003  ! 185: MEMBAR	membar	#LoadLoad | #StoreLoad 
	.word 0x8143e016  ! 186: MEMBAR	membar	#StoreLoad | #LoadStore | #Lookaside 
	.word 0xc6a21009  ! 187: STWA_R	stwa	%r3, [%r8 + %r9] 0x80
	.word 0x8da20829  ! 188: FADDs	fadds	%f8, %f9, %f6
	.word 0xc40a0009  ! 189: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xa6fa2814  ! 190: SDIVcc_I	sdivcc 	%r8, 0x0814, %r19
	.word 0xc3ea24c8  ! 191: PREFETCHA_I	prefetcha	[%r8, + 0x04c8] %asi, #one_read
	.word 0xcb3a0009  ! 192: STDF_R	std	%f5, [%r9, %r8]
	.word 0xfef22be0  ! 194: STXA_I	stxa	%r31, [%r8 + 0x0be0] %asi
	.word 0x95222ff8  ! 195: MULScc_I	mulscc 	%r8, 0x0ff8, %r10
	.word 0xe4ba2a98  ! 196: STDA_I	stda	%r18, [%r8 + 0x0a98] %asi
	.word 0xccd21009  ! 197: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r6
	.word 0x14800004  ! 198: BG	bg  	<label_0x4>
	.word 0xa1a20829  ! 199: FADDs	fadds	%f8, %f9, %f16
	.word 0x86522200  ! 200: UMUL_I	umul 	%r8, 0x0200, %r3
	.word 0xcfe21009  ! 201: CASA_I	casa	[%r8] 0x80, %r9, %r7
	.word 0xcaea1009  ! 202: LDSTUBA_R	ldstuba	%r5, [%r8 + %r9] 0x80
	.word 0xccc21009  ! 203: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r6
	.word 0xc4ea1009  ! 204: LDSTUBA_R	ldstuba	%r2, [%r8 + %r9] 0x80
	.word 0x8143e059  ! 205: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside | #Sync 
	.word 0xcaaa2f6c  ! 206: STBA_I	stba	%r5, [%r8 + 0x0f6c] %asi
	.word 0xbfa208a9  ! 207: FSUBs	fsubs	%f8, %f9, %f31
	.word 0xc252266c  ! 208: LDSH_I	ldsh	[%r8 + 0x066c], %r1
	.word 0xc3ea2140  ! 209: PREFETCHA_I	prefetcha	[%r8, + 0x0140] %asi, #one_read
	.word 0xc8b21009  ! 210: STHA_R	stha	%r4, [%r8 + %r9] 0x80
	.word 0xe49a1009  ! 211: LDDA_R	ldda	[%r8, %r9] 0x80, %r18
	.word 0xc4ca1009  ! 212: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r2
	.word 0x87a20929  ! 213: FMULs	fmuls	%f8, %f9, %f3
	.word 0xc67a2e0c  ! 214: SWAP_I	swap	%r3, [%r8 + 0x0e0c]
	.word 0x82f20009  ! 215: UDIVcc_R	udivcc 	%r8, %r9, %r1
	.word 0x8143e04f  ! 216: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #Sync 
	.word 0x85a208a9  ! 217: FSUBs	fsubs	%f8, %f9, %f2
	.word 0xc4921009  ! 218: LDUHA_R	lduha	[%r8, %r9] 0x80, %r2
	.word 0xcaa21009  ! 219: STWA_R	stwa	%r5, [%r8 + %r9] 0x80
	.word 0xc73a2738  ! 220: STDF_I	std	%f3, [0x0738, %r8]
	.word 0x8a520009  ! 221: UMUL_R	umul 	%r8, %r9, %r5
	.word 0xbe6a2bdc  ! 222: UDIVX_I	udivx 	%r8, 0x0bdc, %r31
	.word 0xd67a29c4  ! 223: SWAP_I	swap	%r11, [%r8 + 0x09c4]
	.word 0x94522370  ! 224: UMUL_I	umul 	%r8, 0x0370, %r10
	.word 0xcaca2ea8  ! 225: LDSBA_I	ldsba	[%r8, + 0x0ea8] %asi, %r5
	.word 0x8143e01e  ! 226: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside 
	.word 0xc2f21009  ! 227: STXA_R	stxa	%r1, [%r8 + %r9] 0x80
	.word 0xc6420009  ! 228: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0x08800008  ! 229: BLEU	bleu  	<label_0x8>
	.word 0xea6a26e0  ! 230: LDSTUB_I	ldstub	%r21, [%r8 + 0x06e0]
	.word 0x8143e071  ! 231: MEMBAR	membar	#LoadLoad | #Lookaside | #MemIssue | #Sync 
	.word 0x40000004  ! 232: CALL	call	disp30_4
	.word 0xb4da0009  ! 233: SMULcc_R	smulcc 	%r8, %r9, %r26
	.word 0x2a800004  ! 234: BCS	bcs,a	<label_0x4>
	.word 0x8143c000  ! 235: STBAR	stbar
	.word 0x8143e031  ! 236: MEMBAR	membar	#LoadLoad | #Lookaside | #MemIssue 
	.word 0x847a0009  ! 237: SDIV_R	sdiv 	%r8, %r9, %r2
	.word 0xc4ba2578  ! 238: STDA_I	stda	%r2, [%r8 + 0x0578] %asi
	.word 0x864a2834  ! 239: MULX_I	mulx 	%r8, 0x0834, %r3
	.word 0x86d22a9c  ! 240: UMULcc_I	umulcc 	%r8, 0x0a9c, %r3
	.word 0xc36a279c  ! 241: PREFETCH_I	prefetch	[%r8 + 0x079c], #one_read
	.word 0xcafa1009  ! 242: SWAPA_R	swapa	%r5, [%r8 + %r9] 0x80
	.word 0x16800008  ! 243: BGE	bge  	<label_0x8>
	.word 0x8143e006  ! 244: MEMBAR	membar	#StoreLoad | #LoadStore 
	.word 0x8143e007  ! 245: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore 
	.word 0xf2d22e44  ! 246: LDSHA_I	ldsha	[%r8, + 0x0e44] %asi, %r25
	.word 0xba6a0009  ! 247: UDIVX_R	udivx 	%r8, %r9, %r29
	.word 0xccca231c  ! 248: LDSBA_I	ldsba	[%r8, + 0x031c] %asi, %r6
	.word 0xc4120009  ! 249: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0x12800008  ! 250: BNE	bne  	<label_0x8>
	.word 0xb9a209a9  ! 252: FDIVs	fdivs	%f8, %f9, %f28
	.word 0x8ef20009  ! 253: UDIVcc_R	udivcc 	%r8, %r9, %r7
	.word 0x0cc20004  ! 254: BRGZ	brgz  ,nt	%8,<label_0x20004>
	.word 0x847a229c  ! 255: SDIV_I	sdiv 	%r8, 0x029c, %r2
	.word 0xf8ba1009  ! 256: STDA_R	stda	%r28, [%r8 + %r9] 0x80
	.word 0xf322271c  ! 257: STF_I	st	%f25, [0x071c, %r8]
	.word 0xc36a2d90  ! 258: PREFETCH_I	prefetch	[%r8 + 0x0d90], #one_read
	.word 0xfca21009  ! 259: STWA_R	stwa	%r30, [%r8 + %r9] 0x80
	.word 0xbc522f18  ! 260: UMUL_I	umul 	%r8, 0x0f18, %r30
	.word 0x8b220009  ! 261: MULScc_R	mulscc 	%r8, %r9, %r5
	.word 0x8a5a2144  ! 262: SMUL_I	smul 	%r8, 0x0144, %r5
	.word 0x987a0009  ! 263: SDIV_R	sdiv 	%r8, %r9, %r12
	.word 0x945a2c70  ! 264: SMUL_I	smul 	%r8, 0x0c70, %r10
	.word 0x9fa20929  ! 265: FMULs	fmuls	%f8, %f9, %f15
	.word 0x36800004  ! 266: BGE	bge,a	<label_0x4>
	.word 0xc85a2c80  ! 267: LDX_I	ldx	[%r8 + 0x0c80], %r4
	.word 0xf5220009  ! 268: STF_R	st	%f26, [%r9, %r8]
	.word 0xcc922730  ! 269: LDUHA_I	lduha	[%r8, + 0x0730] %asi, %r6
	.word 0xca7a0009  ! 270: SWAP_R	swap	%r5, [%r8 + %r9]
	.word 0xce7a2b14  ! 271: SWAP_I	swap	%r7, [%r8 + 0x0b14]
	.word 0xf13a0009  ! 272: STDF_R	std	%f24, [%r9, %r8]
	.word 0x3a800004  ! 273: BCC	bcc,a	<label_0x4>
	.word 0x8c4a227c  ! 274: MULX_I	mulx 	%r8, 0x027c, %r6
	.word 0x0c800008  ! 275: BNEG	bneg  	<label_0x8>
	.word 0x87a20829  ! 276: FADDs	fadds	%f8, %f9, %f3
	.word 0xc28a1009  ! 277: LDUBA_R	lduba	[%r8, %r9] 0x80, %r1
	.word 0x87a20829  ! 278: FADDs	fadds	%f8, %f9, %f3
	.word 0x88722eac  ! 279: UDIV_I	udiv 	%r8, 0x0eac, %r4
	.word 0xcc8a1009  ! 280: LDUBA_R	lduba	[%r8, %r9] 0x80, %r6
	.word 0x8143e035  ! 281: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside | #MemIssue 
	.word 0x8143c000  ! 282: STBAR	stbar
	.word 0x82da0009  ! 283: SMULcc_R	smulcc 	%r8, %r9, %r1
	.word 0x87222f84  ! 284: MULScc_I	mulscc 	%r8, 0x0f84, %r3
	.word 0xca4a2b30  ! 285: LDSB_I	ldsb	[%r8 + 0x0b30], %r5
	.word 0x1c800004  ! 286: BPOS	bpos  	<label_0x4>
	.word 0xc2022268  ! 287: LDUW_I	lduw	[%r8 + 0x0268], %r1
	.word 0xce420009  ! 288: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0x36800008  ! 289: BGE	bge,a	<label_0x8>
	.word 0xdaa22528  ! 290: STWA_I	stwa	%r13, [%r8 + 0x0528] %asi
	.word 0x22ca0008  ! 291: BRZ	brz,a,pt	%8,<label_0xa0008>
	.word 0xd68a1009  ! 292: LDUBA_R	lduba	[%r8, %r9] 0x80, %r11
	.word 0xb9a209a9  ! 293: FDIVs	fdivs	%f8, %f9, %f28
	.word 0x82720009  ! 294: UDIV_R	udiv 	%r8, %r9, %r1
	.word 0xc4b22280  ! 295: STHA_I	stha	%r2, [%r8 + 0x0280] %asi
	.word 0xe0c225f0  ! 296: LDSWA_I	ldswa	[%r8, + 0x05f0] %asi, %r16
	.word 0xd8ba1009  ! 297: STDA_R	stda	%r12, [%r8 + %r9] 0x80
	.word 0xa5a20929  ! 298: FMULs	fmuls	%f8, %f9, %f18
	.word 0xbe520009  ! 299: UMUL_R	umul 	%r8, %r9, %r31
	.word 0x8143e074  ! 300: MEMBAR	membar	#LoadStore | #Lookaside | #MemIssue | #Sync 
	.word 0x22800004  ! 301: BE	be,a	<label_0x4>
	.word 0x8143c000  ! 302: STBAR	stbar
	.word 0xcb3a0009  ! 303: STDF_R	std	%f5, [%r9, %r8]
	.word 0x8143e06f  ! 304: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #MemIssue | #Sync 
	.word 0x8af20009  ! 305: UDIVcc_R	udivcc 	%r8, %r9, %r5
	.word 0xf8b21009  ! 306: STHA_R	stha	%r28, [%r8 + %r9] 0x80
	.word 0xc65a0009  ! 307: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xce9226f0  ! 308: LDUHA_I	lduha	[%r8, + 0x06f0] %asi, %r7
	.word 0xc3ea2c30  ! 309: PREFETCHA_I	prefetcha	[%r8, + 0x0c30] %asi, #one_read
	.word 0xcc522d28  ! 310: LDSH_I	ldsh	[%r8 + 0x0d28], %r6
	.word 0x0eca0008  ! 311: BRGEZ	brgez  ,pt	%8,<label_0xa0008>
	.word 0xc6ca1009  ! 312: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r3
	.word 0x85222598  ! 313: MULScc_I	mulscc 	%r8, 0x0598, %r2
	.word 0xcef22638  ! 314: STXA_I	stxa	%r7, [%r8 + 0x0638] %asi
	.word 0x847a0009  ! 315: SDIV_R	sdiv 	%r8, %r9, %r2
	.word 0x84fa2ff4  ! 317: SDIVcc_I	sdivcc 	%r8, 0x0ff4, %r2
	.word 0xcb3a27f8  ! 318: STDF_I	std	%f5, [0x07f8, %r8]
	.word 0xccb22ab8  ! 319: STHA_I	stha	%r6, [%r8 + 0x0ab8] %asi
	.word 0xc9e21009  ! 320: CASA_I	casa	[%r8] 0x80, %r9, %r4
	.word 0x16800008  ! 321: BGE	bge  	<label_0x8>
	.word 0x0cca0004  ! 322: BRGZ	brgz  ,pt	%8,<label_0xa0004>
	.word 0x88d22fc0  ! 323: UMULcc_I	umulcc 	%r8, 0x0fc0, %r4
	.word 0xcc821009  ! 324: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r6
	.word 0x8a520009  ! 325: UMUL_R	umul 	%r8, %r9, %r5
	.word 0xd8a21009  ! 326: STWA_R	stwa	%r12, [%r8 + %r9] 0x80
	.word 0x0a800004  ! 327: BCS	bcs  	<label_0x4>
	.word 0xc7e21009  ! 328: CASA_I	casa	[%r8] 0x80, %r9, %r3
	.word 0x8143e038  ! 329: MEMBAR	membar	#StoreStore | #Lookaside | #MemIssue 
	.word 0xcc9a2668  ! 330: LDDA_I	ldda	[%r8, + 0x0668] %asi, %r6
	.word 0x3c800008  ! 331: BPOS	bpos,a	<label_0x8>
	.word 0xcc422ad0  ! 332: LDSW_I	ldsw	[%r8 + 0x0ad0], %r6
	.word 0xe41a0009  ! 333: LDD_R	ldd	[%r8 + %r9], %r18
	.word 0xc9f22009  ! 334: CASXA_R	casxa	[%r8]%asi, %r9, %r4
	.word 0xc3ea250c  ! 335: PREFETCHA_I	prefetcha	[%r8, + 0x050c] %asi, #one_read
	.word 0x8a6a0009  ! 336: UDIVX_R	udivx 	%r8, %r9, %r5
	.word 0xf2422bb8  ! 337: LDSW_I	ldsw	[%r8 + 0x0bb8], %r25
	.word 0x8143c000  ! 338: STBAR	stbar
	.word 0x8e6a2da0  ! 340: UDIVX_I	udivx 	%r8, 0x0da0, %r7
	.word 0x8143e069  ! 342: MEMBAR	membar	#LoadLoad | #StoreStore | #MemIssue | #Sync 
	.word 0x8143c000  ! 343: STBAR	stbar
	.word 0xf05a22a0  ! 345: LDX_I	ldx	[%r8 + 0x02a0], %r24
	.word 0xd9e21009  ! 346: CASA_I	casa	[%r8] 0x80, %r9, %r12
	.word 0x16800004  ! 348: BGE	bge  	<label_0x4>
	.word 0x987227fc  ! 349: UDIV_I	udiv 	%r8, 0x07fc, %r12
	.word 0x845a2338  ! 350: SMUL_I	smul 	%r8, 0x0338, %r2
	.word 0xe49a1009  ! 351: LDDA_R	ldda	[%r8, %r9] 0x80, %r18
	.word 0xc3e22009  ! 352: CASA_R	casa	[%r8] %asi, %r9, %r1
	.word 0xf04a2c20  ! 353: LDSB_I	ldsb	[%r8 + 0x0c20], %r24
	.word 0xd89a1009  ! 354: LDDA_R	ldda	[%r8, %r9] 0x80, %r12
	.word 0xc20a20f0  ! 355: LDUB_I	ldub	[%r8 + 0x00f0], %r1
	.word 0xc5e22009  ! 356: CASA_R	casa	[%r8] %asi, %r9, %r2
	.word 0x8a6a0009  ! 357: UDIVX_R	udivx 	%r8, %r9, %r5
	.word 0xf0020009  ! 358: LDUW_R	lduw	[%r8 + %r9], %r24
	.word 0x8c7a24a8  ! 359: SDIV_I	sdiv 	%r8, 0x04a8, %r6
	.word 0x3a800004  ! 360: BCC	bcc,a	<label_0x4>
	.word 0xcbf22009  ! 361: CASXA_R	casxa	[%r8]%asi, %r9, %r5
	.word 0x8143c000  ! 362: STBAR	stbar
	.word 0xc36a2348  ! 363: PREFETCH_I	prefetch	[%r8 + 0x0348], #one_read
	.word 0x84fa0009  ! 364: SDIVcc_R	sdivcc 	%r8, %r9, %r2
	.word 0xccda1009  ! 365: LDXA_R	ldxa	[%r8, %r9] 0x80, %r6
	.word 0xf24a2df0  ! 366: LDSB_I	ldsb	[%r8 + 0x0df0], %r25
	.word 0xec1a2aa0  ! 367: LDD_I	ldd	[%r8 + 0x0aa0], %r22
	.word 0xc4921009  ! 368: LDUHA_R	lduha	[%r8, %r9] 0x80, %r2
	.word 0x945a2aac  ! 370: SMUL_I	smul 	%r8, 0x0aac, %r10
	.word 0xb87a2320  ! 371: SDIV_I	sdiv 	%r8, 0x0320, %r28
	.word 0x30800004  ! 372: BA	ba,a	<label_0x4>
	.word 0xdd220009  ! 373: STF_R	st	%f14, [%r9, %r8]
	.word 0xce0a2de4  ! 375: LDUB_I	ldub	[%r8 + 0x0de4], %r7
	.word 0xc4520009  ! 376: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xc8f21009  ! 377: STXA_R	stxa	%r4, [%r8 + %r9] 0x80
	.word 0x1c800004  ! 378: BPOS	bpos  	<label_0x4>
	.word 0xcaa22210  ! 379: STWA_I	stwa	%r5, [%r8 + 0x0210] %asi
	.word 0xa5a209a9  ! 380: FDIVs	fdivs	%f8, %f9, %f18
	.word 0xdaf22488  ! 381: STXA_I	stxa	%r13, [%r8 + 0x0488] %asi
	.word 0x8143c000  ! 382: STBAR	stbar
	.word 0xf85a2a30  ! 383: LDX_I	ldx	[%r8 + 0x0a30], %r28
	.word 0xccb21009  ! 384: STHA_R	stha	%r6, [%r8 + %r9] 0x80
	.word 0xc44a212c  ! 385: LDSB_I	ldsb	[%r8 + 0x012c], %r2
	.word 0xcada1009  ! 386: LDXA_R	ldxa	[%r8, %r9] 0x80, %r5
	.word 0xce0a0009  ! 387: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xcaa21009  ! 388: STWA_R	stwa	%r5, [%r8 + %r9] 0x80
	.word 0xecda1009  ! 389: LDXA_R	ldxa	[%r8, %r9] 0x80, %r22
	.word 0xac520009  ! 390: UMUL_R	umul 	%r8, %r9, %r22
	.word 0xcc1a0009  ! 391: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0x3e800008  ! 392: BVC	bvc,a	<label_0x8>
	.word 0xdaca1009  ! 393: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r13
	.word 0xc47a2060  ! 394: SWAP_I	swap	%r2, [%r8 + 0x0060]
	.word 0xb07a2c74  ! 395: SDIV_I	sdiv 	%r8, 0x0c74, %r24
	.word 0x8143c000  ! 396: STBAR	stbar
	.word 0xf9220009  ! 397: STF_R	st	%f28, [%r9, %r8]
	.word 0x8143e01a  ! 398: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside 
	.word 0xce0222b4  ! 399: LDUW_I	lduw	[%r8 + 0x02b4], %r7
	.word 0xce7a0009  ! 400: SWAP_R	swap	%r7, [%r8 + %r9]
	.word 0xe49a2440  ! 401: LDDA_I	ldda	[%r8, + 0x0440] %asi, %r18
	.word 0xcff21009  ! 402: CASXA_I	casxa	[%r8] 0x80, %r9, %r7
	.word 0xfac21009  ! 403: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r29
	.word 0xc4ca22b8  ! 404: LDSBA_I	ldsba	[%r8, + 0x02b8] %asi, %r2
	.word 0x8cfa0009  ! 405: SDIVcc_R	sdivcc 	%r8, %r9, %r6
	.word 0x2ec20008  ! 406: BRGEZ	brgez,a,nt	%8,<label_0x20008>
	.word 0x06800004  ! 407: BL	bl  	<label_0x4>
	.word 0x0e800004  ! 408: BVS	bvs  	<label_0x4>
	.word 0x87a20829  ! 409: FADDs	fadds	%f8, %f9, %f3
	.word 0x36800004  ! 410: BGE	bge,a	<label_0x4>
	.word 0xae4a0009  ! 411: MULX_R	mulx 	%r8, %r9, %r23
	.word 0xb26a28cc  ! 412: UDIVX_I	udivx 	%r8, 0x08cc, %r25
	.word 0x34800004  ! 413: BG	bg,a	<label_0x4>
	.word 0x8143c000  ! 414: STBAR	stbar
	.word 0x8143e046  ! 415: MEMBAR	membar	#StoreLoad | #LoadStore | #Sync 
	.word 0x04800004  ! 416: BLE	ble  	<label_0x4>
	.word 0x98da0009  ! 417: SMULcc_R	smulcc 	%r8, %r9, %r12
	.word 0xe80a2a28  ! 418: LDUB_I	ldub	[%r8 + 0x0a28], %r20
	.word 0x8143e002  ! 419: MEMBAR	membar	#StoreLoad 
	.word 0x827a0009  ! 420: SDIV_R	sdiv 	%r8, %r9, %r1
	.word 0x8143c000  ! 421: STBAR	stbar
	.word 0xc5f21009  ! 422: CASXA_I	casxa	[%r8] 0x80, %r9, %r2
	.word 0xcc8a1009  ! 423: LDUBA_R	lduba	[%r8, %r9] 0x80, %r6
	.word 0xcab21009  ! 424: STHA_R	stha	%r5, [%r8 + %r9] 0x80
	.word 0xc86a0009  ! 425: LDSTUB_R	ldstub	%r4, [%r8 + %r9]
	.word 0x0c800008  ! 426: BNEG	bneg  	<label_0x8>
	.word 0x82520009  ! 427: UMUL_R	umul 	%r8, %r9, %r1
	.word 0xc3ea24f8  ! 428: PREFETCHA_I	prefetcha	[%r8, + 0x04f8] %asi, #one_read
	.word 0x2ac20004  ! 429: BRNZ	brnz,a,nt	%8,<label_0x20004>
	.word 0x1a800004  ! 430: BCC	bcc  	<label_0x4>
	.word 0x2cc20004  ! 432: BRGZ	brgz,a,nt	%8,<label_0x20004>
	.word 0x8143c000  ! 433: STBAR	stbar
	.word 0x992225b4  ! 434: MULScc_I	mulscc 	%r8, 0x05b4, %r12
	.word 0xc5220009  ! 435: STF_R	st	%f2, [%r9, %r8]
	.word 0x8143e044  ! 436: MEMBAR	membar	#LoadStore | #Sync 
	.word 0x8cf227d4  ! 437: UDIVcc_I	udivcc 	%r8, 0x07d4, %r6
	.word 0xbda20929  ! 438: FMULs	fmuls	%f8, %f9, %f30
	.word 0xb4d20009  ! 439: UMULcc_R	umulcc 	%r8, %r9, %r26
	.word 0xc84a2998  ! 440: LDSB_I	ldsb	[%r8 + 0x0998], %r4
	.word 0xccba1009  ! 441: STDA_R	stda	%r6, [%r8 + %r9] 0x80
	.word 0xe6c21009  ! 442: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r19
	.word 0x8143e074  ! 443: MEMBAR	membar	#LoadStore | #Lookaside | #MemIssue | #Sync 
	.word 0xcaea1009  ! 444: LDSTUBA_R	ldstuba	%r5, [%r8 + %r9] 0x80
	.word 0x82fa2668  ! 445: SDIVcc_I	sdivcc 	%r8, 0x0668, %r1
	.word 0xee8a2c20  ! 446: LDUBA_I	lduba	[%r8, + 0x0c20] %asi, %r23
	.word 0xc2821009  ! 447: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r1
	.word 0x1a800004  ! 448: BCC	bcc  	<label_0x4>
	.word 0x0e800004  ! 449: BVS	bvs  	<label_0x4>
	.word 0xcaca2164  ! 450: LDSBA_I	ldsba	[%r8, + 0x0164] %asi, %r5
	.word 0xcf3a0009  ! 451: STDF_R	std	%f7, [%r9, %r8]
	.word 0x8143e049  ! 452: MEMBAR	membar	#LoadLoad | #StoreStore | #Sync 
	.word 0x8a5a0009  ! 453: SMUL_R	smul 	%r8, %r9, %r5
	.word 0xcf3a0009  ! 454: STDF_R	std	%f7, [%r9, %r8]
	.word 0x8143c000  ! 455: STBAR	stbar
	.word 0x8143c000  ! 456: STBAR	stbar
	.word 0x8143c000  ! 457: STBAR	stbar
	.word 0x88520009  ! 458: UMUL_R	umul 	%r8, %r9, %r4
	.word 0x8143e019  ! 459: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside 
	.word 0xc3ea228c  ! 460: PREFETCHA_I	prefetcha	[%r8, + 0x028c] %asi, #one_read
	.word 0x30800004  ! 461: BA	ba,a	<label_0x4>
	.word 0x08800004  ! 462: BLEU	bleu  	<label_0x4>
	.word 0xc4020009  ! 463: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0x8c5a0009  ! 464: SMUL_R	smul 	%r8, %r9, %r6
	.word 0xf8da1009  ! 465: LDXA_R	ldxa	[%r8, %r9] 0x80, %r28
	.word 0xd8aa1009  ! 467: STBA_R	stba	%r12, [%r8 + %r9] 0x80
	.word 0xbefa0009  ! 468: SDIVcc_R	sdivcc 	%r8, %r9, %r31
	.word 0xcef21009  ! 469: STXA_R	stxa	%r7, [%r8 + %r9] 0x80
	.word 0xc8ba1009  ! 472: STDA_R	stda	%r4, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 473: STBAR	stbar
	.word 0x8143c000  ! 474: STBAR	stbar
	.word 0xdeda2690  ! 475: LDXA_I	ldxa	[%r8, + 0x0690] %asi, %r15
	.word 0xe1220009  ! 476: STF_R	st	%f16, [%r9, %r8]
	.word 0x836a0009  ! 477: SDIVX_R	sdivx	%r8, %r9, %r1
	.word 0xb2522214  ! 478: UMUL_I	umul 	%r8, 0x0214, %r25
	.word 0xc3f21009  ! 479: CASXA_I	casxa	[%r8] 0x80, %r9, %r1
	.word 0xc8f21009  ! 480: STXA_R	stxa	%r4, [%r8 + %r9] 0x80
	.word 0x8ba20829  ! 481: FADDs	fadds	%f8, %f9, %f5
	.word 0xe01a26f0  ! 482: LDD_I	ldd	[%r8 + 0x06f0], %r16
	.word 0xa522299c  ! 483: MULScc_I	mulscc 	%r8, 0x099c, %r18
	.word 0xcc422ee8  ! 484: LDSW_I	ldsw	[%r8 + 0x0ee8], %r6
	.word 0xdcba2520  ! 485: STDA_I	stda	%r14, [%r8 + 0x0520] %asi
	.word 0xc28a1009  ! 486: LDUBA_R	lduba	[%r8, %r9] 0x80, %r1
	.word 0xa8da0009  ! 487: SMULcc_R	smulcc 	%r8, %r9, %r20
	.word 0xcaaa2624  ! 488: STBA_I	stba	%r5, [%r8 + 0x0624] %asi
	.word 0x8143c000  ! 489: STBAR	stbar
	.word 0x8143e02d  ! 490: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #MemIssue 
	.word 0xfc120009  ! 491: LDUH_R	lduh	[%r8 + %r9], %r30
	.word 0xc6fa2228  ! 492: SWAPA_I	swapa	%r3, [%r8 + 0x0228] %asi
	.word 0x87a209a9  ! 493: FDIVs	fdivs	%f8, %f9, %f3
	.word 0xc26a2b8c  ! 494: LDSTUB_I	ldstub	%r1, [%r8 + 0x0b8c]
	.word 0xccd21009  ! 495: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r6
	.word 0x8c520009  ! 496: UMUL_R	umul 	%r8, %r9, %r6
	.word 0xc3ea26f0  ! 497: PREFETCHA_I	prefetcha	[%r8, + 0x06f0] %asi, #one_read
	.word 0x32800004  ! 498: BNE	bne,a	<label_0x4>
	.word 0xc87a227c  ! 499: SWAP_I	swap	%r4, [%r8 + 0x027c]
	.word 0x9cd20009  ! 500: UMULcc_R	umulcc 	%r8, %r9, %r14
	.word 0x8143e009  ! 501: MEMBAR	membar	#LoadLoad | #StoreStore 
	.word 0xcada1009  ! 502: LDXA_R	ldxa	[%r8, %r9] 0x80, %r5
	.word 0x8a4a2bdc  ! 503: MULX_I	mulx 	%r8, 0x0bdc, %r5
	.word 0x8143c000  ! 504: STBAR	stbar
	.word 0x89a20829  ! 505: FADDs	fadds	%f8, %f9, %f4
	.word 0x8a4a2e14  ! 506: MULX_I	mulx 	%r8, 0x0e14, %r5
	.word 0xc7220009  ! 507: STF_R	st	%f3, [%r9, %r8]
	.word 0xca7a2d40  ! 508: SWAP_I	swap	%r5, [%r8 + 0x0d40]
	.word 0xc522261c  ! 509: STF_I	st	%f2, [0x061c, %r8]
	.word 0x8143e03c  ! 510: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0x85a208a9  ! 511: FSUBs	fsubs	%f8, %f9, %f2
	.word 0xc3ea27fc  ! 512: PREFETCHA_I	prefetcha	[%r8, + 0x07fc] %asi, #one_read
	.word 0xac6a293c  ! 513: UDIVX_I	udivx 	%r8, 0x093c, %r22
	.word 0xc4921009  ! 514: LDUHA_R	lduha	[%r8, %r9] 0x80, %r2
	.word 0xf2821009  ! 515: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r25
	.word 0xcc8a2e98  ! 516: LDUBA_I	lduba	[%r8, + 0x0e98] %asi, %r6
	.word 0x8143c000  ! 517: STBAR	stbar
	.word 0x82d20009  ! 518: UMULcc_R	umulcc 	%r8, %r9, %r1
	.word 0xc4ba1009  ! 519: STDA_R	stda	%r2, [%r8 + %r9] 0x80
	.word 0xc8ea1009  ! 520: LDSTUBA_R	ldstuba	%r4, [%r8 + %r9] 0x80
	.word 0xcad22864  ! 521: LDSHA_I	ldsha	[%r8, + 0x0864] %asi, %r5
	.word 0xc4b21009  ! 522: STHA_R	stha	%r2, [%r8 + %r9] 0x80
	.word 0xde922120  ! 523: LDUHA_I	lduha	[%r8, + 0x0120] %asi, %r15
	.word 0xc8ea1009  ! 524: LDSTUBA_R	ldstuba	%r4, [%r8 + %r9] 0x80
	.word 0xc3ea220c  ! 525: PREFETCHA_I	prefetcha	[%r8, + 0x020c] %asi, #one_read
	.word 0x8143e029  ! 527: MEMBAR	membar	#LoadLoad | #StoreStore | #MemIssue 
	.word 0xba5a0009  ! 528: SMUL_R	smul 	%r8, %r9, %r29
	.word 0x865a0009  ! 529: SMUL_R	smul 	%r8, %r9, %r3
	.word 0xba7a0009  ! 530: SDIV_R	sdiv 	%r8, %r9, %r29
	.word 0x8143e066  ! 531: MEMBAR	membar	#StoreLoad | #LoadStore | #MemIssue | #Sync 
	.word 0xf8922a08  ! 532: LDUHA_I	lduha	[%r8, + 0x0a08] %asi, %r28
	.word 0x88fa0009  ! 533: SDIVcc_R	sdivcc 	%r8, %r9, %r4
	.word 0xd4ea1009  ! 535: LDSTUBA_R	ldstuba	%r10, [%r8 + %r9] 0x80
	.word 0xd7220009  ! 536: STF_R	st	%f11, [%r9, %r8]
	.word 0xd4fa2504  ! 537: SWAPA_I	swapa	%r10, [%r8 + 0x0504] %asi
	.word 0x26800004  ! 538: BL	bl,a	<label_0x4>
	.word 0xc5220009  ! 539: STF_R	st	%f2, [%r9, %r8]
	.word 0xc8c2223c  ! 540: LDSWA_I	ldswa	[%r8, + 0x023c] %asi, %r4
	.word 0xdef21009  ! 541: STXA_R	stxa	%r15, [%r8 + %r9] 0x80
	.word 0xcdf22009  ! 542: CASXA_R	casxa	[%r8]%asi, %r9, %r6
	.word 0xc3ea2b2c  ! 543: PREFETCHA_I	prefetcha	[%r8, + 0x0b2c] %asi, #one_read
	.word 0x8143c000  ! 544: STBAR	stbar
	.word 0xd8ca2490  ! 546: LDSBA_I	ldsba	[%r8, + 0x0490] %asi, %r12
	.word 0x9e522ca8  ! 547: UMUL_I	umul 	%r8, 0x0ca8, %r15
	.word 0xcd3a0009  ! 548: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc6420009  ! 549: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0x8143e029  ! 550: MEMBAR	membar	#LoadLoad | #StoreStore | #MemIssue 
	.word 0xc6921009  ! 551: LDUHA_R	lduha	[%r8, %r9] 0x80, %r3
	.word 0xb9a208a9  ! 552: FSUBs	fsubs	%f8, %f9, %f28
	.word 0xc2ea1009  ! 553: LDSTUBA_R	ldstuba	%r1, [%r8 + %r9] 0x80
	.word 0xafa208a9  ! 554: FSUBs	fsubs	%f8, %f9, %f23
	.word 0xe0ba29b8  ! 555: STDA_I	stda	%r16, [%r8 + 0x09b8] %asi
	.word 0xc33a0009  ! 556: STDF_R	std	%f1, [%r9, %r8]
	.word 0x8143c000  ! 557: STBAR	stbar
	.word 0x8143e019  ! 558: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside 
	.word 0xc8b22500  ! 559: STHA_I	stha	%r4, [%r8 + 0x0500] %asi
	.word 0x0eca0004  ! 560: BRGEZ	brgez  ,pt	%8,<label_0xa0004>
	.word 0xe0ba1009  ! 561: STDA_R	stda	%r16, [%r8 + %r9] 0x80
	.word 0xc36a2520  ! 562: PREFETCH_I	prefetch	[%r8 + 0x0520], #one_read
	.word 0x88f20009  ! 563: UDIVcc_R	udivcc 	%r8, %r9, %r4
	.word 0xbf2227b8  ! 564: MULScc_I	mulscc 	%r8, 0x07b8, %r31
	.word 0xd8a21009  ! 565: STWA_R	stwa	%r12, [%r8 + %r9] 0x80
	.word 0x02ca0004  ! 566: BRZ	brz  ,pt	%8,<label_0xa0004>
	.word 0xcfe21009  ! 567: CASA_I	casa	[%r8] 0x80, %r9, %r7
	.word 0x8143c000  ! 568: STBAR	stbar
	.word 0x0a800004  ! 569: BCS	bcs  	<label_0x4>
	.word 0xc4da1009  ! 570: LDXA_R	ldxa	[%r8, %r9] 0x80, %r2
	.word 0x8efa0009  ! 571: SDIVcc_R	sdivcc 	%r8, %r9, %r7
	.word 0x8143c000  ! 572: STBAR	stbar
	.word 0xce6a2184  ! 573: LDSTUB_I	ldstub	%r7, [%r8 + 0x0184]
	.word 0x8a522520  ! 574: UMUL_I	umul 	%r8, 0x0520, %r5
	.word 0xc4b21009  ! 575: STHA_R	stha	%r2, [%r8 + %r9] 0x80
	.word 0xc28a273c  ! 576: LDUBA_I	lduba	[%r8, + 0x073c] %asi, %r1
	.word 0xd4520009  ! 577: LDSH_R	ldsh	[%r8 + %r9], %r10
	.word 0xc86a23bc  ! 578: LDSTUB_I	ldstub	%r4, [%r8 + 0x03bc]
	.word 0x24800004  ! 579: BLE	ble,a	<label_0x4>
	.word 0x84520009  ! 580: UMUL_R	umul 	%r8, %r9, %r2
	.word 0xc6020009  ! 581: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0x06ca0008  ! 582: BRLZ	brlz  ,pt	%8,<label_0xa0008>
	.word 0xc3ea2b18  ! 583: PREFETCHA_I	prefetcha	[%r8, + 0x0b18] %asi, #one_read
	.word 0xcf3a0009  ! 584: STDF_R	std	%f7, [%r9, %r8]
	.word 0x34800004  ! 585: BG	bg,a	<label_0x4>
	.word 0x8143c000  ! 586: STBAR	stbar
	.word 0x8cd22050  ! 587: UMULcc_I	umulcc 	%r8, 0x0050, %r6
	.word 0xcfe22009  ! 588: CASA_R	casa	[%r8] %asi, %r9, %r7
	.word 0xc6420009  ! 590: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xc2b21009  ! 591: STHA_R	stha	%r1, [%r8 + %r9] 0x80
	.word 0xc8aa2ebc  ! 593: STBA_I	stba	%r4, [%r8 + 0x0ebc] %asi
	.word 0xd45a2670  ! 594: LDX_I	ldx	[%r8 + 0x0670], %r10
	.word 0xceda1009  ! 595: LDXA_R	ldxa	[%r8, %r9] 0x80, %r7
	.word 0xe3220009  ! 596: STF_R	st	%f17, [%r9, %r8]
	.word 0xcb3a2018  ! 597: STDF_I	std	%f5, [0x0018, %r8]
	.word 0xc3ea268c  ! 598: PREFETCHA_I	prefetcha	[%r8, + 0x068c] %asi, #one_read
	.word 0xf1220009  ! 599: STF_R	st	%f24, [%r9, %r8]
	.word 0xca5a2b78  ! 600: LDX_I	ldx	[%r8 + 0x0b78], %r5
	.word 0xcbe22009  ! 601: CASA_R	casa	[%r8] %asi, %r9, %r5
	.word 0x844a0009  ! 602: MULX_R	mulx 	%r8, %r9, %r2
	.word 0xe89a1009  ! 603: LDDA_R	ldda	[%r8, %r9] 0x80, %r20
	.word 0x14800004  ! 604: BG	bg  	<label_0x4>
	.word 0x8a5a0009  ! 605: SMUL_R	smul 	%r8, %r9, %r5
	.word 0x885a2648  ! 606: SMUL_I	smul 	%r8, 0x0648, %r4
	.word 0xc33a0009  ! 607: STDF_R	std	%f1, [%r9, %r8]
	.word 0x8143c000  ! 608: STBAR	stbar
	.word 0xb0722b38  ! 609: UDIV_I	udiv 	%r8, 0x0b38, %r24
	.word 0x864a2bc8  ! 610: MULX_I	mulx 	%r8, 0x0bc8, %r3
	.word 0x8fa208a9  ! 611: FSUBs	fsubs	%f8, %f9, %f7
	.word 0x8fa209a9  ! 612: FDIVs	fdivs	%f8, %f9, %f7
	.word 0xc3ea244c  ! 613: PREFETCHA_I	prefetcha	[%r8, + 0x044c] %asi, #one_read
	.word 0xb8720009  ! 614: UDIV_R	udiv 	%r8, %r9, %r28
	.word 0x8e520009  ! 615: UMUL_R	umul 	%r8, %r9, %r7
	.word 0xdaf21009  ! 616: STXA_R	stxa	%r13, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 617: STBAR	stbar
	.word 0x8143c000  ! 618: STBAR	stbar
	.word 0x26c20008  ! 619: BRLZ	brlz,a,nt	%8,<label_0x20008>
	.word 0xcec21009  ! 620: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r7
	.word 0xc8da2518  ! 621: LDXA_I	ldxa	[%r8, + 0x0518] %asi, %r4
	.word 0x8cf20009  ! 622: UDIVcc_R	udivcc 	%r8, %r9, %r6
	.word 0xc9220009  ! 623: STF_R	st	%f4, [%r9, %r8]
	.word 0x887a0009  ! 624: SDIV_R	sdiv 	%r8, %r9, %r4
	.word 0x8143e040  ! 625: MEMBAR	membar	#Sync 
	.word 0xc3ea23dc  ! 626: PREFETCHA_I	prefetcha	[%r8, + 0x03dc] %asi, #one_read
	.word 0xea020009  ! 627: LDUW_R	lduw	[%r8 + %r9], %r21
	.word 0x8143c000  ! 628: STBAR	stbar
	.word 0xc6020009  ! 629: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0x3e800004  ! 630: BVC	bvc,a	<label_0x4>
	.word 0x8143e019  ! 631: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside 
	.word 0x8143c000  ! 632: STBAR	stbar
	.word 0x8cda258c  ! 633: SMULcc_I	smulcc 	%r8, 0x058c, %r6
	.word 0xbda20829  ! 634: FADDs	fadds	%f8, %f9, %f30
	.word 0x96da2810  ! 635: SMULcc_I	smulcc 	%r8, 0x0810, %r11
	.word 0x10800004  ! 636: BA	ba  	<label_0x4>
	.word 0xfe1224ac  ! 637: LDUH_I	lduh	[%r8 + 0x04ac], %r31
	.word 0xc2520009  ! 638: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0x3a800004  ! 639: BCC	bcc,a	<label_0x4>
	.word 0x947a0009  ! 640: SDIV_R	sdiv 	%r8, %r9, %r10
	.word 0xc3ea250c  ! 641: PREFETCHA_I	prefetcha	[%r8, + 0x050c] %asi, #one_read
	.word 0xc8821009  ! 642: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r4
	.word 0x88d228e0  ! 644: UMULcc_I	umulcc 	%r8, 0x08e0, %r4
	.word 0x9c522f30  ! 645: UMUL_I	umul 	%r8, 0x0f30, %r14
	.word 0x8efa0009  ! 646: SDIVcc_R	sdivcc 	%r8, %r9, %r7
	.word 0xc4a228c0  ! 647: STWA_I	stwa	%r2, [%r8 + 0x08c0] %asi
	.word 0xe4ba2700  ! 648: STDA_I	stda	%r18, [%r8 + 0x0700] %asi
	.word 0xc522236c  ! 649: STF_I	st	%f2, [0x036c, %r8]
	.word 0xf0ba1009  ! 650: STDA_R	stda	%r24, [%r8 + %r9] 0x80
	.word 0xc26a2de4  ! 651: LDSTUB_I	ldstub	%r1, [%r8 + 0x0de4]
	.word 0x8143c000  ! 652: STBAR	stbar
	.word 0xf49a1009  ! 655: LDDA_R	ldda	[%r8, %r9] 0x80, %r26
	.word 0xf4ba1009  ! 656: STDA_R	stda	%r26, [%r8 + %r9] 0x80
	.word 0xc8c22c04  ! 657: LDSWA_I	ldswa	[%r8, + 0x0c04] %asi, %r4
	.word 0xcde22009  ! 658: CASA_R	casa	[%r8] %asi, %r9, %r6
	.word 0xc36a2194  ! 659: PREFETCH_I	prefetch	[%r8 + 0x0194], #one_read
	.word 0x886a0009  ! 660: UDIVX_R	udivx 	%r8, %r9, %r4
	.word 0xc4c22a70  ! 661: LDSWA_I	ldswa	[%r8, + 0x0a70] %asi, %r2
	.word 0x04800004  ! 662: BLE	ble  	<label_0x4>
	.word 0x8143e038  ! 663: MEMBAR	membar	#StoreStore | #Lookaside | #MemIssue 
	.word 0x864a0009  ! 664: MULX_R	mulx 	%r8, %r9, %r3
	.word 0xec821009  ! 665: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r22
	.word 0x0e800008  ! 666: BVS	bvs  	<label_0x8>
	.word 0xfb3a21d8  ! 667: STDF_I	std	%f29, [0x01d8, %r8]
	.word 0xf05a2650  ! 670: LDX_I	ldx	[%r8 + 0x0650], %r24
	.word 0x87220009  ! 671: MULScc_R	mulscc 	%r8, %r9, %r3
	.word 0xbc6a2fd8  ! 672: UDIVX_I	udivx 	%r8, 0x0fd8, %r30
	.word 0x8143c000  ! 673: STBAR	stbar
	.word 0xc28a2bec  ! 674: LDUBA_I	lduba	[%r8, + 0x0bec] %asi, %r1
	.word 0xa0fa0009  ! 675: SDIVcc_R	sdivcc 	%r8, %r9, %r16
	.word 0x2a800008  ! 676: BCS	bcs,a	<label_0x8>
	.word 0xc8a21009  ! 677: STWA_R	stwa	%r4, [%r8 + %r9] 0x80
	.word 0xc36a26f8  ! 678: PREFETCH_I	prefetch	[%r8 + 0x06f8], #one_read
	.word 0xf20a2cb0  ! 679: LDUB_I	ldub	[%r8 + 0x0cb0], %r25
	.word 0x10800004  ! 680: BA	ba  	<label_0x4>
	.word 0x8143c000  ! 681: STBAR	stbar
	.word 0xae522590  ! 682: UMUL_I	umul 	%r8, 0x0590, %r23
	.word 0xc27a2584  ! 683: SWAP_I	swap	%r1, [%r8 + 0x0584]
	.word 0x866a0009  ! 684: UDIVX_R	udivx 	%r8, %r9, %r3
	.word 0xc68a2304  ! 685: LDUBA_I	lduba	[%r8, + 0x0304] %asi, %r3
	.word 0xf0ba1009  ! 686: STDA_R	stda	%r24, [%r8 + %r9] 0x80
	.word 0xc65a2148  ! 687: LDX_I	ldx	[%r8 + 0x0148], %r3
	.word 0x844a0009  ! 688: MULX_R	mulx 	%r8, %r9, %r2
	.word 0xcaaa28e8  ! 689: STBA_I	stba	%r5, [%r8 + 0x08e8] %asi
	.word 0xc682217c  ! 690: LDUWA_I	lduwa	[%r8, + 0x017c] %asi, %r3
	.word 0x8ad229b0  ! 691: UMULcc_I	umulcc 	%r8, 0x09b0, %r5
	.word 0x8c522f78  ! 692: UMUL_I	umul 	%r8, 0x0f78, %r6
	.word 0x89a208a9  ! 693: FSUBs	fsubs	%f8, %f9, %f4
	.word 0xceca1009  ! 694: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r7
	.word 0xb2722c34  ! 695: UDIV_I	udiv 	%r8, 0x0c34, %r25
	.word 0xc2fa24a8  ! 696: SWAPA_I	swapa	%r1, [%r8 + 0x04a8] %asi
	.word 0xc3ea2e54  ! 697: PREFETCHA_I	prefetcha	[%r8, + 0x0e54] %asi, #one_read
	.word 0xd6f22270  ! 698: STXA_I	stxa	%r11, [%r8 + 0x0270] %asi
	.word 0x88fa0009  ! 699: SDIVcc_R	sdivcc 	%r8, %r9, %r4
	.word 0x8143e043  ! 700: MEMBAR	membar	#LoadLoad | #StoreLoad | #Sync 
	.word 0x8a6a0009  ! 701: UDIVX_R	udivx 	%r8, %r9, %r5
	.word 0xf4ba2158  ! 702: STDA_I	stda	%r26, [%r8 + 0x0158] %asi
	.word 0xce422da0  ! 703: LDSW_I	ldsw	[%r8 + 0x0da0], %r7
	.word 0xf6da2408  ! 704: LDXA_I	ldxa	[%r8, + 0x0408] %asi, %r27
	.word 0x8143c000  ! 705: STBAR	stbar
	.word 0xcc7a0009  ! 706: SWAP_R	swap	%r6, [%r8 + %r9]
	.word 0x8143e013  ! 707: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside 
	.word 0xc26a262c  ! 708: LDSTUB_I	ldstub	%r1, [%r8 + 0x062c]
	.word 0xbf6a2a9c  ! 709: SDIVX_I	sdivx	%r8, 0x0a9c, %r31
	.word 0xccea1009  ! 710: LDSTUBA_R	ldstuba	%r6, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 711: STBAR	stbar
	.word 0xc3ea2438  ! 712: PREFETCHA_I	prefetcha	[%r8, + 0x0438] %asi, #one_read
	.word 0x89a208a9  ! 713: FSUBs	fsubs	%f8, %f9, %f4
	.word 0xc6c22a08  ! 714: LDSWA_I	ldswa	[%r8, + 0x0a08] %asi, %r3
	.word 0x86fa2528  ! 715: SDIVcc_I	sdivcc 	%r8, 0x0528, %r3
	.word 0xcaea1009  ! 716: LDSTUBA_R	ldstuba	%r5, [%r8 + %r9] 0x80
	.word 0xca822b90  ! 717: LDUWA_I	lduwa	[%r8, + 0x0b90] %asi, %r5
	.word 0x98720009  ! 718: UDIV_R	udiv 	%r8, %r9, %r12
	.word 0xc93a0009  ! 719: STDF_R	std	%f4, [%r9, %r8]
	.word 0x8a722e90  ! 720: UDIV_I	udiv 	%r8, 0x0e90, %r5
	.word 0xd4aa1009  ! 721: STBA_R	stba	%r10, [%r8 + %r9] 0x80
	.word 0xf4ba2e20  ! 722: STDA_I	stda	%r26, [%r8 + 0x0e20] %asi
	.word 0xc2da1009  ! 724: LDXA_R	ldxa	[%r8, %r9] 0x80, %r1
	.word 0x8ada0009  ! 725: SMULcc_R	smulcc 	%r8, %r9, %r5
	.word 0x22ca0008  ! 726: BRZ	brz,a,pt	%8,<label_0xa0008>
	.word 0x9da20829  ! 727: FADDs	fadds	%f8, %f9, %f14
	.word 0xc4520009  ! 728: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xeada2918  ! 729: LDXA_I	ldxa	[%r8, + 0x0918] %asi, %r21
	.word 0xcb3a0009  ! 730: STDF_R	std	%f5, [%r9, %r8]
	.word 0xc5222ad4  ! 731: STF_I	st	%f2, [0x0ad4, %r8]
	.word 0xd64a0009  ! 732: LDSB_R	ldsb	[%r8 + %r9], %r11
	.word 0x0e800008  ! 733: BVS	bvs  	<label_0x8>
	.word 0xc25a0009  ! 734: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0x8e7a2e84  ! 735: SDIV_I	sdiv 	%r8, 0x0e84, %r7
	.word 0xcc1a2ff0  ! 736: LDD_I	ldd	[%r8 + 0x0ff0], %r6
	.word 0xc36a2830  ! 737: PREFETCH_I	prefetch	[%r8 + 0x0830], #one_read
	.word 0x0a800008  ! 738: BCS	bcs  	<label_0x8>
	.word 0x83a209a9  ! 739: FDIVs	fdivs	%f8, %f9, %f1
	.word 0x3a800008  ! 740: BCC	bcc,a	<label_0x8>
	.word 0xcbf21009  ! 741: CASXA_I	casxa	[%r8] 0x80, %r9, %r5
	.word 0xcc120009  ! 742: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0x97a20929  ! 743: FMULs	fmuls	%f8, %f9, %f11
	.word 0xd89a1009  ! 744: LDDA_R	ldda	[%r8, %r9] 0x80, %r12
	.word 0x8143c000  ! 745: STBAR	stbar
	.word 0x40000008  ! 746: CALL	call	disp30_8
	.word 0xec122024  ! 747: LDUH_I	lduh	[%r8 + 0x0024], %r22
	.word 0xc48a1009  ! 748: LDUBA_R	lduba	[%r8, %r9] 0x80, %r2
	.word 0xc8120009  ! 749: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xa9222c18  ! 750: MULScc_I	mulscc 	%r8, 0x0c18, %r20
	.word 0x8ba20929  ! 751: FMULs	fmuls	%f8, %f9, %f5
	.word 0xceea22b8  ! 752: LDSTUBA_I	ldstuba	%r7, [%r8 + 0x02b8] %asi
	.word 0x84f22cdc  ! 753: UDIVcc_I	udivcc 	%r8, 0x0cdc, %r2
	.word 0xa84a0009  ! 754: MULX_R	mulx 	%r8, %r9, %r20
	.word 0x16800008  ! 755: BGE	bge  	<label_0x8>
	.word 0xc93a0009  ! 756: STDF_R	std	%f4, [%r9, %r8]
	.word 0xb0da2154  ! 757: SMULcc_I	smulcc 	%r8, 0x0154, %r24
	.word 0xf81a0009  ! 758: LDD_R	ldd	[%r8 + %r9], %r28
	.word 0xe5f22009  ! 759: CASXA_R	casxa	[%r8]%asi, %r9, %r18
	.word 0xc3ea2244  ! 760: PREFETCHA_I	prefetcha	[%r8, + 0x0244] %asi, #one_read
	.word 0xb56a24c4  ! 761: SDIVX_I	sdivx	%r8, 0x04c4, %r26
	.word 0x8143e012  ! 762: MEMBAR	membar	#StoreLoad | #Lookaside 
	.word 0xec42211c  ! 763: LDSW_I	ldsw	[%r8 + 0x011c], %r22
	.word 0xc9220009  ! 764: STF_R	st	%f4, [%r9, %r8]
	.word 0x83a20829  ! 765: FADDs	fadds	%f8, %f9, %f1
	.word 0x22800004  ! 766: BE	be,a	<label_0x4>
	.word 0x8a7a0009  ! 767: SDIV_R	sdiv 	%r8, %r9, %r5
	.word 0xeaaa1009  ! 768: STBA_R	stba	%r21, [%r8 + %r9] 0x80
	.word 0xd93a21f0  ! 769: STDF_I	std	%f12, [0x01f0, %r8]
	.word 0xccb21009  ! 770: STHA_R	stha	%r6, [%r8 + %r9] 0x80
	.word 0xc6b22040  ! 771: STHA_I	stha	%r3, [%r8 + 0x0040] %asi
	.word 0x8143c000  ! 772: STBAR	stbar
	.word 0x8143e06f  ! 773: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #MemIssue | #Sync 
	.word 0xf0ba1009  ! 774: STDA_R	stda	%r24, [%r8 + %r9] 0x80
	.word 0x89a20929  ! 775: FMULs	fmuls	%f8, %f9, %f4
	.word 0xa9220009  ! 776: MULScc_R	mulscc 	%r8, %r9, %r20
	.word 0xc53a2ca0  ! 777: STDF_I	std	%f2, [0x0ca0, %r8]
	.word 0x8143e017  ! 778: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside 
	.word 0x10800008  ! 779: BA	ba  	<label_0x8>
	.word 0xdcc22690  ! 780: LDSWA_I	ldswa	[%r8, + 0x0690] %asi, %r14
	.word 0xca520009  ! 781: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xccaa2094  ! 782: STBA_I	stba	%r6, [%r8 + 0x0094] %asi
	.word 0x8fa20929  ! 783: FMULs	fmuls	%f8, %f9, %f7
	.word 0xc36a29f4  ! 784: PREFETCH_I	prefetch	[%r8 + 0x09f4], #one_read
	.word 0x8143c000  ! 785: STBAR	stbar
	.word 0x2cca0008  ! 786: BRGZ	brgz,a,pt	%8,<label_0xa0008>
	.word 0xc2b21009  ! 787: STHA_R	stha	%r1, [%r8 + %r9] 0x80
	.word 0xf33a0009  ! 788: STDF_R	std	%f25, [%r9, %r8]
	.word 0xdc1a0009  ! 790: LDD_R	ldd	[%r8 + %r9], %r14
	.word 0xc53a0009  ! 791: STDF_R	std	%f2, [%r9, %r8]
	.word 0x8143e034  ! 792: MEMBAR	membar	#LoadStore | #Lookaside | #MemIssue 
	.word 0xdc1a0009  ! 793: LDD_R	ldd	[%r8 + %r9], %r14
	.word 0x99a20829  ! 794: FADDs	fadds	%f8, %f9, %f12
	.word 0x0a800004  ! 796: BCS	bcs  	<label_0x4>
	.word 0xc5220009  ! 797: STF_R	st	%f2, [%r9, %r8]
	.word 0xfe6a2d58  ! 798: LDSTUB_I	ldstub	%r31, [%r8 + 0x0d58]
	.word 0x0e800008  ! 799: BVS	bvs  	<label_0x8>
	.word 0xc36a2408  ! 800: PREFETCH_I	prefetch	[%r8 + 0x0408], #one_read
	.word 0x99a20829  ! 801: FADDs	fadds	%f8, %f9, %f12
	.word 0x8143c000  ! 802: STBAR	stbar
	.word 0xcc6a0009  ! 804: LDSTUB_R	ldstub	%r6, [%r8 + %r9]
	.word 0xe4fa1009  ! 805: SWAPA_R	swapa	%r18, [%r8 + %r9] 0x80
	.word 0x87220009  ! 806: MULScc_R	mulscc 	%r8, %r9, %r3
	.word 0xe2822a48  ! 807: LDUWA_I	lduwa	[%r8, + 0x0a48] %asi, %r17
	.word 0xc2f22f10  ! 808: STXA_I	stxa	%r1, [%r8 + 0x0f10] %asi
	.word 0xc41a2b48  ! 810: LDD_I	ldd	[%r8 + 0x0b48], %r2
	.word 0xd4122218  ! 811: LDUH_I	lduh	[%r8 + 0x0218], %r10
	.word 0x8143c000  ! 812: STBAR	stbar
	.word 0xce0a2304  ! 813: LDUB_I	ldub	[%r8 + 0x0304], %r7
	.word 0xf8020009  ! 814: LDUW_R	lduw	[%r8 + %r9], %r28
	.word 0x0c800008  ! 815: BNEG	bneg  	<label_0x8>
	.word 0xa87a0009  ! 816: SDIV_R	sdiv 	%r8, %r9, %r20
	.word 0x83a209a9  ! 817: FDIVs	fdivs	%f8, %f9, %f1
	.word 0x0e800004  ! 818: BVS	bvs  	<label_0x4>
	.word 0x8cf22604  ! 819: UDIVcc_I	udivcc 	%r8, 0x0604, %r6
	.word 0x8ba209a9  ! 820: FDIVs	fdivs	%f8, %f9, %f5
	.word 0x8a520009  ! 821: UMUL_R	umul 	%r8, %r9, %r5
	.word 0xc8fa26e8  ! 822: SWAPA_I	swapa	%r4, [%r8 + 0x06e8] %asi
	.word 0xce822d30  ! 823: LDUWA_I	lduwa	[%r8, + 0x0d30] %asi, %r7
	.word 0xc3ea2dbc  ! 824: PREFETCHA_I	prefetcha	[%r8, + 0x0dbc] %asi, #one_read
	.word 0xcb220009  ! 825: STF_R	st	%f5, [%r9, %r8]
	.word 0x84f22058  ! 827: UDIVcc_I	udivcc 	%r8, 0x0058, %r2
	.word 0xc87a2850  ! 828: SWAP_I	swap	%r4, [%r8 + 0x0850]
	.word 0xfc9a2c88  ! 829: LDDA_I	ldda	[%r8, + 0x0c88] %asi, %r30
	.word 0xf8aa1009  ! 831: STBA_R	stba	%r28, [%r8 + %r9] 0x80
	.word 0xae6a2cc8  ! 832: UDIVX_I	udivx 	%r8, 0x0cc8, %r23
	.word 0x885224f0  ! 833: UMUL_I	umul 	%r8, 0x04f0, %r4
	.word 0x896a2a98  ! 834: SDIVX_I	sdivx	%r8, 0x0a98, %r4
	.word 0xc45227e4  ! 835: LDSH_I	ldsh	[%r8 + 0x07e4], %r2
	.word 0x94fa0009  ! 836: SDIVcc_R	sdivcc 	%r8, %r9, %r10
	.word 0xb66a0009  ! 837: UDIVX_R	udivx 	%r8, %r9, %r27
	.word 0xca120009  ! 838: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0x8f6a0009  ! 839: SDIVX_R	sdivx	%r8, %r9, %r7
	.word 0x8c6a0009  ! 840: UDIVX_R	udivx 	%r8, %r9, %r6
	.word 0xc69223b0  ! 841: LDUHA_I	lduha	[%r8, + 0x03b0] %asi, %r3
	.word 0xc33a0009  ! 842: STDF_R	std	%f1, [%r9, %r8]
	.word 0x18800004  ! 843: BGU	bgu  	<label_0x4>
	.word 0x32800004  ! 844: BNE	bne,a	<label_0x4>
	.word 0x84f20009  ! 845: UDIVcc_R	udivcc 	%r8, %r9, %r2
	.word 0xcbe21009  ! 846: CASA_I	casa	[%r8] 0x80, %r9, %r5
	.word 0x16800004  ! 847: BGE	bge  	<label_0x4>
	.word 0x8d222d20  ! 848: MULScc_I	mulscc 	%r8, 0x0d20, %r6
	.word 0x3e800004  ! 849: BVC	bvc,a	<label_0x4>
	.word 0x06ca0008  ! 850: BRLZ	brlz  ,pt	%8,<label_0xa0008>
	.word 0x8e720009  ! 851: UDIV_R	udiv 	%r8, %r9, %r7
	.word 0xc36a267c  ! 852: PREFETCH_I	prefetch	[%r8 + 0x067c], #one_read
	.word 0xfeb22c58  ! 853: STHA_I	stha	%r31, [%r8 + 0x0c58] %asi
	.word 0x826a2ec0  ! 854: UDIVX_I	udivx 	%r8, 0x0ec0, %r1
	.word 0xc84a2e64  ! 855: LDSB_I	ldsb	[%r8 + 0x0e64], %r4
	.word 0xc8fa1009  ! 856: SWAPA_R	swapa	%r4, [%r8 + %r9] 0x80
	.word 0xe8ba20e0  ! 857: STDA_I	stda	%r20, [%r8 + 0x00e0] %asi
	.word 0xc6fa2534  ! 858: SWAPA_I	swapa	%r3, [%r8 + 0x0534] %asi
	.word 0x38800004  ! 860: BGU	bgu,a	<label_0x4>
	.word 0x8143c000  ! 861: STBAR	stbar
	.word 0xf8122f44  ! 862: LDUH_I	lduh	[%r8 + 0x0f44], %r28
	.word 0xe8ea1009  ! 863: LDSTUBA_R	ldstuba	%r20, [%r8 + %r9] 0x80
	.word 0xcefa207c  ! 864: SWAPA_I	swapa	%r7, [%r8 + 0x007c] %asi
	.word 0xc2da2c70  ! 865: LDXA_I	ldxa	[%r8, + 0x0c70] %asi, %r1
	.word 0x88f22228  ! 866: UDIVcc_I	udivcc 	%r8, 0x0228, %r4
	.word 0x8ad225c8  ! 867: UMULcc_I	umulcc 	%r8, 0x05c8, %r5
	.word 0x8a520009  ! 868: UMUL_R	umul 	%r8, %r9, %r5
	.word 0xccba1009  ! 869: STDA_R	stda	%r6, [%r8 + %r9] 0x80
	.word 0x884a0009  ! 870: MULX_R	mulx 	%r8, %r9, %r4
	.word 0xdc822b1c  ! 871: LDUWA_I	lduwa	[%r8, + 0x0b1c] %asi, %r14
	.word 0xc25a0009  ! 872: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0x32800004  ! 873: BNE	bne,a	<label_0x4>
	.word 0xceea1009  ! 874: LDSTUBA_R	ldstuba	%r7, [%r8 + %r9] 0x80
	.word 0x826a0009  ! 875: UDIVX_R	udivx 	%r8, %r9, %r1
	.word 0xc3ea2434  ! 876: PREFETCHA_I	prefetcha	[%r8, + 0x0434] %asi, #one_read
	.word 0xc8ea1009  ! 877: LDSTUBA_R	ldstuba	%r4, [%r8 + %r9] 0x80
	.word 0xc2aa2fe4  ! 878: STBA_I	stba	%r1, [%r8 + 0x0fe4] %asi
	.word 0x0c800008  ! 879: BNEG	bneg  	<label_0x8>
	.word 0x32800004  ! 881: BNE	bne,a	<label_0x4>
	.word 0xa07a0009  ! 882: SDIV_R	sdiv 	%r8, %r9, %r16
	.word 0x8143c000  ! 883: STBAR	stbar
	.word 0x8143c000  ! 884: STBAR	stbar
	.word 0xdc9a2508  ! 885: LDDA_I	ldda	[%r8, + 0x0508] %asi, %r14
	.word 0x946a25e4  ! 886: UDIVX_I	udivx 	%r8, 0x05e4, %r10
	.word 0xce6a0009  ! 887: LDSTUB_R	ldstub	%r7, [%r8 + %r9]
	.word 0xc86a2d20  ! 888: LDSTUB_I	ldstub	%r4, [%r8 + 0x0d20]
	.word 0xeeb22298  ! 889: STHA_I	stha	%r23, [%r8 + 0x0298] %asi
	.word 0xc36a2c98  ! 890: PREFETCH_I	prefetch	[%r8 + 0x0c98], #one_read
	.word 0x8e720009  ! 891: UDIV_R	udiv 	%r8, %r9, %r7
	.word 0x8ed20009  ! 892: UMULcc_R	umulcc 	%r8, %r9, %r7
	.word 0x82d223fc  ! 893: UMULcc_I	umulcc 	%r8, 0x03fc, %r1
	.word 0xada209a9  ! 894: FDIVs	fdivs	%f8, %f9, %f22
	.word 0x86d22784  ! 895: UMULcc_I	umulcc 	%r8, 0x0784, %r3
	.word 0xc8da1009  ! 896: LDXA_R	ldxa	[%r8, %r9] 0x80, %r4
	.word 0xccda2210  ! 897: LDXA_I	ldxa	[%r8, + 0x0210] %asi, %r6
	.word 0xba5a0009  ! 898: SMUL_R	smul 	%r8, %r9, %r29
	.word 0x85a208a9  ! 899: FSUBs	fsubs	%f8, %f9, %f2
	.word 0xe2c21009  ! 900: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r17
	.word 0x82d221b8  ! 901: UMULcc_I	umulcc 	%r8, 0x01b8, %r1
	.word 0x8143e051  ! 902: MEMBAR	membar	#LoadLoad | #Lookaside | #Sync 
	.word 0xe8ba1009  ! 903: STDA_R	stda	%r20, [%r8 + %r9] 0x80
	.word 0xc3ea2b04  ! 904: PREFETCHA_I	prefetcha	[%r8, + 0x0b04] %asi, #one_read
	.word 0xc8aa2428  ! 905: STBA_I	stba	%r4, [%r8 + 0x0428] %asi
	.word 0x04800004  ! 906: BLE	ble  	<label_0x4>
	.word 0x8f6a0009  ! 907: SDIVX_R	sdivx	%r8, %r9, %r7
	.word 0xc8da1009  ! 908: LDXA_R	ldxa	[%r8, %r9] 0x80, %r4
	.word 0xcab21009  ! 910: STHA_R	stha	%r5, [%r8 + %r9] 0x80
	.word 0xe49a1009  ! 911: LDDA_R	ldda	[%r8, %r9] 0x80, %r18
	.word 0xcf3a0009  ! 912: STDF_R	std	%f7, [%r9, %r8]
	.word 0x10800004  ! 913: BA	ba  	<label_0x4>
	.word 0x34800004  ! 914: BG	bg,a	<label_0x4>
	.word 0x85a209a9  ! 915: FDIVs	fdivs	%f8, %f9, %f2
	.word 0x18800008  ! 916: BGU	bgu  	<label_0x8>
	.word 0xc3ea2c58  ! 917: PREFETCHA_I	prefetcha	[%r8, + 0x0c58] %asi, #one_read
	.word 0xc2c21009  ! 918: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r1
	.word 0xce0a2aa4  ! 919: LDUB_I	ldub	[%r8 + 0x0aa4], %r7
	.word 0xf09a1009  ! 920: LDDA_R	ldda	[%r8, %r9] 0x80, %r24
	.word 0xf4f21009  ! 921: STXA_R	stxa	%r26, [%r8 + %r9] 0x80
	.word 0xfada2798  ! 922: LDXA_I	ldxa	[%r8, + 0x0798] %asi, %r29
	.word 0x8143e031  ! 923: MEMBAR	membar	#LoadLoad | #Lookaside | #MemIssue 
	.word 0x8143c000  ! 924: STBAR	stbar
	.word 0xce0a0009  ! 926: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xc53a0009  ! 927: STDF_R	std	%f2, [%r9, %r8]
	.word 0x10800008  ! 928: BA	ba  	<label_0x8>
	.word 0x86720009  ! 929: UDIV_R	udiv 	%r8, %r9, %r3
	.word 0x865a2234  ! 930: SMUL_I	smul 	%r8, 0x0234, %r3
	.word 0x8143c000  ! 931: STBAR	stbar
	.word 0x8e6a2518  ! 932: UDIVX_I	udivx 	%r8, 0x0518, %r7
	.word 0xccf22d98  ! 933: STXA_I	stxa	%r6, [%r8 + 0x0d98] %asi
	.word 0xee120009  ! 934: LDUH_R	lduh	[%r8 + %r9], %r23
	.word 0xc4420009  ! 935: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0x04ca0004  ! 936: BRLEZ	brlez  ,pt	%8,<label_0xa0004>
	.word 0xac7225e8  ! 937: UDIV_I	udiv 	%r8, 0x05e8, %r22
	.word 0xe2aa1009  ! 938: STBA_R	stba	%r17, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 939: STBAR	stbar
	.word 0xc3ea2a80  ! 940: PREFETCHA_I	prefetcha	[%r8, + 0x0a80] %asi, #one_read
	.word 0x84fa0009  ! 941: SDIVcc_R	sdivcc 	%r8, %r9, %r2
	.word 0xda8a1009  ! 942: LDUBA_R	lduba	[%r8, %r9] 0x80, %r13
	.word 0xcada2268  ! 943: LDXA_I	ldxa	[%r8, + 0x0268] %asi, %r5
	.word 0xceca2720  ! 944: LDSBA_I	ldsba	[%r8, + 0x0720] %asi, %r7
	.word 0xd64a0009  ! 945: LDSB_R	ldsb	[%r8 + %r9], %r11
	.word 0x844a2940  ! 946: MULX_I	mulx 	%r8, 0x0940, %r2
	.word 0xc60a0009  ! 947: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xa64a0009  ! 948: MULX_R	mulx 	%r8, %r9, %r19
	.word 0xc4c21009  ! 950: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r2
	.word 0xda5a0009  ! 951: LDX_R	ldx	[%r8 + %r9], %r13
	.word 0x40000008  ! 953: CALL	call	disp30_8
	.word 0x8143e057  ! 954: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside | #Sync 
	.word 0x16800004  ! 955: BGE	bge  	<label_0x4>
	.word 0x85220009  ! 956: MULScc_R	mulscc 	%r8, %r9, %r2
	.word 0xf8921009  ! 957: LDUHA_R	lduha	[%r8, %r9] 0x80, %r28
	.word 0xb65a0009  ! 958: SMUL_R	smul 	%r8, %r9, %r27
	.word 0xf87a20a0  ! 959: SWAP_I	swap	%r28, [%r8 + 0x00a0]
	.word 0x824a2e24  ! 960: MULX_I	mulx 	%r8, 0x0e24, %r1
	.word 0xf2aa1009  ! 961: STBA_R	stba	%r25, [%r8 + %r9] 0x80
	.word 0xcd3a2658  ! 962: STDF_I	std	%f6, [0x0658, %r8]
	.word 0x8f6a0009  ! 963: SDIVX_R	sdivx	%r8, %r9, %r7
	.word 0x9fa208a9  ! 964: FSUBs	fsubs	%f8, %f9, %f15
	.word 0x83222f80  ! 965: MULScc_I	mulscc 	%r8, 0x0f80, %r1
	.word 0xea5a23a8  ! 966: LDX_I	ldx	[%r8 + 0x03a8], %r21
	.word 0xc46a0009  ! 967: LDSTUB_R	ldstub	%r2, [%r8 + %r9]
	.word 0xf0ba2780  ! 968: STDA_I	stda	%r24, [%r8 + 0x0780] %asi
	.word 0x2cc20008  ! 969: BRGZ	brgz,a,nt	%8,<label_0x20008>
	.word 0x8cfa26f4  ! 970: SDIVcc_I	sdivcc 	%r8, 0x06f4, %r6
	.word 0xccf21009  ! 971: STXA_R	stxa	%r6, [%r8 + %r9] 0x80
	.word 0xe2921009  ! 972: LDUHA_R	lduha	[%r8, %r9] 0x80, %r17
	.word 0x14800004  ! 973: BG	bg  	<label_0x4>
	.word 0xc3ea2208  ! 974: PREFETCHA_I	prefetcha	[%r8, + 0x0208] %asi, #one_read
	.word 0xa2720009  ! 975: UDIV_R	udiv 	%r8, %r9, %r17
	.word 0xca020009  ! 976: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0x86d228c4  ! 977: UMULcc_I	umulcc 	%r8, 0x08c4, %r3
	.word 0xf01a2c20  ! 978: LDD_I	ldd	[%r8 + 0x0c20], %r24
	.word 0xa8fa2214  ! 979: SDIVcc_I	sdivcc 	%r8, 0x0214, %r20
	.word 0x8b6a2bc4  ! 980: SDIVX_I	sdivx	%r8, 0x0bc4, %r5
	.word 0x22c20008  ! 981: BRZ	brz,a,nt	%8,<label_0x20008>
	.word 0xcbe21009  ! 983: CASA_I	casa	[%r8] 0x80, %r9, %r5
	.word 0x1a800004  ! 984: BCC	bcc  	<label_0x4>
	.word 0x2c800008  ! 985: BNEG	bneg,a	<label_0x8>
	.word 0xc7f22009  ! 986: CASXA_R	casxa	[%r8]%asi, %r9, %r3
	.word 0x8143e006  ! 987: MEMBAR	membar	#StoreLoad | #LoadStore 
	.word 0x20800008  ! 988: BN	bn,a	<label_0x8>
	.word 0xcc1a2cd0  ! 989: LDD_I	ldd	[%r8 + 0x0cd0], %r6
	.word 0xc2aa207c  ! 990: STBA_I	stba	%r1, [%r8 + 0x007c] %asi
	.word 0x844a0009  ! 991: MULX_R	mulx 	%r8, %r9, %r2
	.word 0xc3ea2bf4  ! 992: PREFETCHA_I	prefetcha	[%r8, + 0x0bf4] %asi, #one_read
	.word 0xcc7a23a8  ! 993: SWAP_I	swap	%r6, [%r8 + 0x03a8]
	.word 0x20800004  ! 994: BN	bn,a	<label_0x4>
	.word 0x86fa0009  ! 995: SDIVcc_R	sdivcc 	%r8, %r9, %r3
	.word 0x8143c000  ! 997: STBAR	stbar
	.word 0x3e800008  ! 998: BVC	bvc,a	<label_0x8>
	.word 0xc2c2242c  ! 999: LDSWA_I	ldswa	[%r8, + 0x042c] %asi, %r1
        ta      T_GOOD_TRAP

.data
	.word  0x3a28731a,0xcf24cbe2,0x9786a706,0xeb6ce9b3
	.word  0x5c365292,0xaf246ba9,0x028964d8,0x1d7443c6
	.word  0x8f944de3,0x47c76c6d,0xdab5b660,0x2ba6e94a
	.word  0x129110f4,0x5e044d0f,0x5b273985,0x5d22d7ee
	.word  0x83318c31,0x3048920d,0x445ff6bf,0x5b17107f
	.word  0xd13b851a,0xba545089,0xef03a8d6,0x21b88b19
	.word  0xfc12a577,0x0a7661b7,0xfc1d8a94,0xfd2d09ea
	.word  0x86b415e3,0x86538de3,0x694627b7,0xb7b73a20
	.word  0x063d1941,0x1b971eaf,0x089c84d2,0x5ac7f466
	.word  0x493be604,0xbeec704d,0x21a5f2c6,0x8ab5e6b3
	.word  0xcd1a7705,0x76cf9c09,0xe00c53fc,0x133b9f6c
	.word  0x62eb5f89,0xcf6c6c33,0x085e23e9,0x49e9c7e1
	.word  0xdd6858b9,0xbe715acb,0xe4aed893,0x62c6e9d0
	.word  0xd0c9da98,0x10193ae2,0x076bb2ba,0x563a71a4
	.word  0x0c459058,0x5ff70621,0x239a2eb4,0x06afdd2b
	.word  0x960518ea,0x4bcf6bc8,0x50e56df7,0xa321cb8a
	.word  0x3af13bab,0x368c5d47,0xe221ac76,0x6862a7e6
	.word  0xcd08790d,0xdb4731e5,0x06c80235,0xc1679672
	.word  0x4bb44baa,0xd2aa821b,0x0c98e40e,0x74f6f26c
	.word  0x1a3991ea,0x789efb27,0x8ac06929,0x4d3c4f34
	.word  0x10c765f9,0x917dab3f,0x5cad7e19,0x2c3032b0
	.word  0x68821dd9,0xfd760bf1,0xa0777cd8,0xf4e93ac8
	.word  0x15ed04d3,0xb04dfb76,0xacce0eb3,0xd0277618
	.word  0xc9f0a0ae,0x97c37fbb,0xdff73e17,0xb7bc15ae
	.word  0xff8a2ce5,0x12765061,0xaccc0284,0xc4d6e402
	.word  0x0968a7bc,0x96c239ed,0x68fc3138,0x91c05e74
	.word  0xae80434b,0xafd8084d,0x41bdaa2f,0x073f1ca0
	.word  0xfcfc504b,0x28b39deb,0xad3c5589,0x2fae9ae6
	.word  0xf3f4b41c,0xf83a1c6c,0xfc739dcb,0x47c9fd23
	.word  0x883d7e91,0x14a21b8c,0xa918d005,0x86ade39d
	.word  0x114f1085,0x81d2d6cb,0xf0f927e5,0x312379d9
	.word  0xeaa72987,0x0fde8622,0xab233ba2,0x684352a4
	.word  0xac88d34a,0x9b21eb49,0x3b0dfdb2,0x740a2708
	.word  0xea44ecad,0x9dc24b43,0x99c12e07,0x2bb60519
	.word  0xa5155158,0x92a02849,0xc913b7d2,0x26eaf466
	.word  0x11593bb9,0x6f2f651a,0xa2978595,0xb5e2a7a1
	.word  0xf4b07013,0x862fbb5e,0x4b79b121,0x309bfc1d
	.word  0xbb268d75,0x2de94ad9,0x009bd578,0xea74c050
	.word  0x60387cf6,0xf9e8c1b8,0x2059123a,0x74e610e7
	.word  0xd2386488,0x03a85664,0xb5826f5a,0xe8456828
	.word  0x1343ace8,0xc4afbd1a,0xaa99e489,0x09825bc4
	.word  0x144f447c,0xa0b8f2a4,0x8f3e3a79,0x93cda69f
	.word  0x13ed87a8,0x5a14fbac,0x3ff28a4b,0x141f088e
	.word  0x6f15c1e9,0x3b7523d7,0x48084ecd,0x70052d9d
	.word  0x2a9f2106,0xe14331bd,0x4f0b21f3,0xffd52fef
	.word  0x0ba4c46c,0xe78b2d0f,0x586f20d5,0x8893d586
	.word  0x58c03ce7,0x9f13a4f1,0xe1ab4e64,0x9c678aa6
	.word  0xa8af6ff8,0x86847271,0x4fb06c0c,0x4ddf19c9
	.word  0x098c8bf4,0xa12f9af5,0x3a0081d5,0xe65ad690
	.word  0xf4537e79,0x75e1acaa,0x94fa5ca2,0x51132a3d
	.word  0xb42cba37,0x44f9f8f2,0x99f4b5bd,0x3ee37d0d
	.word  0xeba6a341,0x6e92319b,0x421e42cd,0x53c38484
	.word  0x21e6b8f4,0x52f0dd20,0x8697cce4,0x769531de
	.word  0x97164b27,0x2c74776c,0x5d9deda7,0xff4f74ad
	.word  0x387c378f,0x251d539e,0x7443c345,0x481c88f9
	.word  0xb0e82846,0x3fe68c69,0x79a1ce2d,0x1f30cc2e
	.word  0xf90acfb1,0xfb4428c9,0x36629202,0x2105db02
	.word  0x801877e2,0xa24b8033,0xbec723f8,0xde0521a9
	.word  0x7b7687b9,0x26e01b9d,0xef708392,0xfcdaba86
	.word  0x77309906,0x136d48c2,0x7da9ff07,0xca91f04b
	.word  0xdad86619,0x96832681,0x2902f249,0xa49b8397
	.word  0x59fa0def,0x8ab5eccc,0x8169c2d7,0x3bb58863
	.word  0x5f068c86,0xebffd295,0x2b91b598,0xf634cc28
	.word  0x8d6ffae4,0xd51ea028,0x47a7e721,0x8b03dbea
	.word  0xa56e7447,0x4e2955cb,0x1c403505,0x82760ba2
	.word  0xb8c83188,0x1081c1c2,0x1589d105,0x989bc26c
	.word  0x696312bc,0x4e550e19,0x00439d28,0xa6934461
	.word  0x91e22c80,0x5f4c2d43,0x9b2f4f8d,0x62f030e5
	.word  0x1ecd583d,0xf89c4b5c,0x44b43253,0x2531fb73
	.word  0x8cd45027,0xb370ae73,0xe423fbb6,0x82202461
	.word  0x4d1c4247,0xc488c4b9,0x4ae1f3fa,0xada30635
	.word  0x4b0e05f8,0x5fdaebff,0x66724d46,0xc1f921bf
	.word  0x48ba36b2,0x480ee5e4,0x03c8e747,0x11afc789
	.word  0x21f70f30,0x6f89877d,0x3f42d020,0xa5c3e353
	.word  0xb6f24abd,0x29ae9e11,0xfb6280b2,0x0fbe33f5
	.word  0x20dd7891,0xe61b4555,0xcce24c3e,0x850fe1e1
	.word  0xec5cb289,0xa2ed5f81,0x00c6cc9a,0xe3518617
	.word  0x058422f9,0x3f816c33,0x069fbe8a,0x64219650
	.word  0x08fe49a2,0x8025984b,0xa515b91e,0xa828e723
	.word  0xf861b535,0xa7e2f301,0x9a5ab004,0x4a1bd366
	.word  0x8bb7e11c,0x748a10c8,0xd3127388,0x0cf7eedd
	.word  0xb1bb9330,0x73b13e00,0xde41b5d0,0xbfd37816
	.word  0x8f230f3a,0x7dd0e86d,0x85cc66c9,0x2b4c069d
	.word  0x0c5d730b,0xba33f878,0x74efd612,0x73385121
	.word  0xf238ea8a,0xd70aca1b,0x27846af8,0xb07c4a75
	.word  0xd47c3e09,0x85d24071,0xf425c803,0x5a95d4d8
	.word  0x36749cda,0x175e68e1,0xe9ce9dc2,0xf412049c
	.word  0x38bc7918,0x96dd2afc,0x6aadc73b,0xcc57e7ae
	.word  0xa5d603b0,0xf1803e35,0x8ecf8591,0xd1ba5830
	.word  0x86e73b67,0x72bbb74c,0xfa5abac7,0xd2cfe43c
	.word  0x861ed3f0,0xa0c7e307,0x5c108106,0x12abc76f
	.word  0x96dd9434,0x255f08fe,0x5e44bef5,0x86467d54
	.word  0x5c3df187,0x8e264927,0xdfac76f1,0x3746d026
	.word  0xe866d2d2,0x2bfcd1bf,0xe23b28b8,0xfe4bdb1b
	.word  0x6efdfdf0,0x46b8b893,0x14d64ff4,0xdaaf91bb
	.word  0x7013c52e,0x929f1066,0xb8cd6747,0xe27bfa1c
	.word  0xe1e30ac8,0x733de4ec,0x0078d222,0x2dc68352
	.word  0x7c333953,0x271758b0,0xcb1e6ba8,0x1c2f2a70
	.word  0x95303601,0xc816999e,0xcef99f39,0x9503be9b
	.word  0xe7d87373,0x92af664c,0x1ec8ad94,0x9b26a340
	.word  0x310abc6f,0xff29d2a5,0x577883d7,0xf38247c3
	.word  0xfef57e23,0x95aaa9fa,0x1e3feee8,0x0dda9086
	.word  0x802b33d1,0xaf939658,0xce1a804a,0xea8e7756
	.word  0x4fb2db6a,0x84157be4,0x65a03e98,0x47e71016
	.word  0x73810c5b,0xe321e4d6,0x866b0e10,0xd091a174
	.word  0x41f37771,0xb8319ab5,0x74e9337c,0xc0b5d3e8
	.word  0x1d094f68,0xd99d60b8,0xd1fd027b,0x02a4959f
	.word  0x9c04f399,0x8e3f9d08,0x81481820,0x6c91ed59
	.word  0x9cbc7a67,0x79fa9b59,0xb8c7a12b,0xd710af17
	.word  0xafad1fa4,0xe1c5010b,0x4be50812,0xebcd96da
	.word  0x96bc3c0f,0xbbc2f7ea,0xe371a770,0x4738b931
	.word  0xded7700f,0x59e40541,0xb0a9f17c,0x69eb7116
	.word  0x22e71a95,0x2c475bc2,0x368db9f8,0xc3072092
	.word  0x044c15ba,0xb7a6b775,0xf68919e8,0x499afb56
	.word  0x5dd9d119,0x7321ce99,0x8d3ba975,0x8539d62b
	.word  0x8a6b677c,0xa392ac13,0xfaba511a,0xbf116b2b
	.word  0xc576988c,0x03b7ba66,0x8c1833e4,0xd3f7151d
	.word  0x7af44a9f,0xa89e9a82,0xb76ea119,0x61a40954
	.word  0xaf7c280e,0x8076f534,0xfc2434d0,0x3fc4fa50
	.word  0x2b9de3a1,0x4078be41,0x17bd4259,0x1165b2e4
	.word  0x36a1339f,0x981e06b3,0x78156fbd,0xe198ead0
	.word  0x500adbdb,0x7fe5b2d2,0x34e61681,0xb0fa889f
	.word  0x6fad876e,0x53e4915a,0xc3e28372,0x867beb7d
	.word  0x6b1f4104,0x9f1d148e,0xd5d25b33,0x3d0eb746
	.word  0x063d918f,0xfecd3300,0xe1a98bff,0xb50c934a
	.word  0x6bc0f412,0x896480b5,0xc9101e45,0xa94dcc13
	.word  0x7488f0ed,0x509eb5c0,0x0e2bb054,0x9873636e
	.word  0x251d3f5a,0x0627413a,0xacdf2154,0x9da81feb
	.word  0xd3807f81,0x830bfe55,0xb1586deb,0xf890402f
	.word  0x2cfd7eb5,0x02991598,0x74a422a0,0x44e8b1d7
	.word  0xa37f1ec7,0x9d0e9e50,0xc5073eeb,0x195c4f60
	.word  0x72c5bac6,0xd9d197fc,0x725b2f51,0xe5b1b0d1
	.word  0xc5a202d7,0x9385d497,0xa62fd527,0x292ca5d5
	.word  0xb03986dd,0xaaf60a47,0x8329cd08,0x49a370eb
	.word  0x404cff8c,0x24010091,0x721cfa36,0x955c1e54
	.word  0xe369b78d,0xd5c052da,0x27c4415f,0x5d00410f
	.word  0x9dd53993,0x49febe77,0xe9da2e87,0xdec3f546
	.word  0xd65ad2a5,0x65cef8f9,0x51347854,0x5d84c6f8
	.word  0xd4abfd6a,0xf2b613d1,0x4654e566,0xc8c582fc
	.word  0x3fae5299,0xb7fe5d50,0x30e0213d,0x77f8eca0
	.word  0x275ad9e4,0xbd3192bc,0x557e2706,0xa29353c4
	.word  0x05a3143a,0x809f8654,0x3793ddaa,0x3d659def
	.word  0xde7d0448,0x16e9cf6d,0xb6653e7a,0x2ac4c297
	.word  0x82f71ffd,0xdcc2d989,0x200dfdb5,0xdf841812
	.word  0x15058462,0x5d709488,0x09b799bd,0xed56ee44
	.word  0x014b49dc,0x6eb47c8e,0x67b131a2,0x07175fd7
	.word  0x8846ae41,0x240803c5,0x7f145298,0x8157b6ad
	.word  0x8b88966e,0x2af0e39a,0x7ba4e6ed,0xaf0cafa8
	.word  0x8a51b4cf,0x19644a15,0x8c0ce6fd,0x0a8743c9
	.word  0x761d589a,0x7c06756c,0x1f98b9ec,0x2cce81c1
	.word  0x627de9e4,0x7efe8dbe,0x24cfba59,0xb65e68a7
	.word  0x33267f30,0x40b18682,0x7cc7b108,0x9f9a0b92
	.word  0xbfae9bde,0xc73050d9,0x3e7fc254,0xaa0aaffc
	.word  0x6a55d19c,0x0096e3eb,0x9abfb6e6,0xb654e15d
	.word  0xc049e643,0x1b504782,0x4ae56472,0xf6f7cb11
	.word  0x49dd5395,0x9e029844,0x2aee8bc7,0x7cc7de06
	.word  0x7c603f1d,0x816783cb,0x430f11b5,0x3f6e9339
	.word  0xe80667ba,0xfca9cf08,0x0f31ab23,0xd208bbcc
	.word  0x63b6fc4e,0x0fb2dc2a,0x3a3fbe87,0xc2e52e38
	.word  0x04e8a49a,0xc217ebaf,0xc7c296b5,0xdcf62fea
	.word  0x63767714,0x5136d033,0xe74910fb,0x18962fbe
	.word  0x4b26d566,0xa46cb121,0x18c1e0a2,0xebb1f061
	.word  0x3bc7f057,0x45a1ae50,0xea147a26,0xc7930ab9
	.word  0x76e1e45e,0xffe0fab3,0xa47652e2,0x2b6ac0a2
	.word  0x944dea80,0x35dac311,0x89ebda99,0xef004273
	.word  0x5ab37f7f,0xf98da277,0xa3247b56,0xc106e1b4
	.word  0x5f827ec6,0x70de1ae0,0xfa47d15e,0xa257b2f3
	.word  0x851ef309,0x285f97d9,0x8d14348b,0xd2686730
	.word  0x8349d8c1,0x666d880a,0xf1c10858,0xf5334af9
	.word  0xfd63264e,0x674f2594,0xe882e975,0xc21e5039
	.word  0x575278cb,0xf98e55b9,0x4e41c232,0xce036b33
	.word  0xbf028281,0x42c52cac,0xfdbedf2f,0x09c06575
	.word  0x971977d0,0xefd8d159,0xcae1d9ad,0xa5909825
	.word  0xcb3e9ab3,0xdabd4deb,0x045ee353,0xf2003afe
	.word  0x10193f37,0x378bf556,0x0c5c6f8c,0xa56f72c6
	.word  0x82e1dfe3,0x48530bf4,0x3586b593,0x05a05772
	.word  0xbc94112b,0x2cf3877d,0xa9204178,0x4406d3a2
	.word  0x5e41b5a5,0x3e47c43a,0x53eecd99,0xc34886fb
	.word  0xe307b9da,0x37c58df5,0xddc7c1ea,0x664c598b
	.word  0xd99cb173,0xba6495a3,0xdb88839b,0xeba3e78b
	.word  0x0f1a7e3b,0x0b10fd65,0xa55029d6,0x8e3c000d
	.word  0x3b2d1ed4,0x693c3225,0xd9af4fe4,0x40326ca7
	.word  0x544951eb,0xdf1c5bcc,0xd136cebb,0x3a57a2ba
	.word  0xb51441f1,0xa9874131,0xfe448922,0x98401fe2
	.word  0xf299e8b8,0x234d2110,0xae02909a,0x14fbd1df
	.word  0x5dc216e5,0xb9abcbdf,0xd459db8c,0x1df99939
	.word  0xa2b9bbd6,0xb1e14898,0x86244906,0x3e9e28f1
	.word  0xb9f88a1f,0xda6b785b,0x5c6c3cf9,0x1e34e1d1
	.word  0xf17d271c,0x1883bef6,0x0638efa3,0xe5b8e5b4
	.word  0x13f92b97,0x053aec61,0xa956762b,0x540add12
	.word  0x163ac20b,0x9a7db9c0,0xaddeae04,0x0f06c6bb
	.word  0x8cae69ca,0x853ec2dc,0x9b4a9c6e,0x7c9893f4
	.word  0xe1e3d659,0x165a6968,0xccb36fe0,0x22decc76
	.word  0x7ac1812b,0xda2bbb00,0x78eb7f05,0x4f43142b
	.word  0x4bbafcde,0x21b85c38,0x6dd2c81f,0x73645ea7
	.word  0x4eccd3b3,0xdd41f785,0x6aa86d3e,0x3649b460
	.word  0x706b9646,0x742be6c8,0x0c4cffb1,0xa8ee84bc
	.word  0x8c4fa2c6,0x6b9caef1,0x3db07d79,0xaee6c158
	.word  0xbd49e9b4,0x1dbc1d78,0x6202279d,0x4b05aa23
	.word  0xcff6c675,0x678b1a82,0xa7515646,0xb08ea037
	.word  0x9f272f5c,0xc67befda,0xe1dbca2b,0x54d0ed8e
	.word  0x30f4b125,0x1df14b07,0x84a1db51,0xefe24a35
	.word  0x74e9c00f,0x8e441d87,0x229e1893,0x5cba9c1a
	.word  0x073c5ca4,0x81b61ad2,0x1545a252,0xaa159dba
	.word  0x7d1eeb7a,0xa9725d71,0xdac6a705,0xcc397a6d
	.word  0xdc2dbd8c,0x2356f1c0,0xa4832609,0x377166ea
	.word  0x15e51c11,0xfdf42fb4,0x746e4dbd,0x4c766b09
	.word  0xe854e80f,0xb68580ae,0x56aa7c30,0x97312a4f
	.word  0x618c9838,0x0b178e1d,0x5ff27909,0xf77fc648
	.word  0xf013c19a,0xba12cc9e,0xb8423306,0xa25caf83
	.word  0x0870525c,0x5ef08256,0x84fd624c,0x6d8f173b
	.word  0x4955e412,0x5426be7d,0x99e2d09b,0x46dfe39e
	.word  0x326f0afb,0xc642415e,0xe3587b22,0x13aef1eb
	.word  0x3970cb9d,0xf9d56d72,0x9547f2d4,0x203a4dc7
	.word  0xf3acd7c7,0xa4576e49,0xe0c6a349,0x0323ab09
	.word  0x412a3111,0x22eff1ee,0x2a6b08e4,0x8f3f1db3
	.word  0xa75d39d3,0x5ae2d49a,0xf20b9de0,0x91241490
	.word  0x53dd318d,0x7633be0c,0xbfa3b253,0xc95f6675
	.word  0x772ba000,0x6cd5d932,0xc49bba40,0x9a6287c3
	.word  0x034dbf89,0x9013e7ad,0x0e19daff,0x2948cc1f
	.word  0x7cf0d2e7,0xabecd7bf,0x245c9b40,0xfefc3a30
	.word  0x042620d9,0x929faa8d,0xfe36d1e9,0x6bb08e12
	.word  0x521adaff,0x64403e6a,0x5d1f9b95,0xf58756b0
	.word  0x3de391d4,0x285d29d4,0x0b22f5b1,0xdb6ce6fb
	.word  0x354cc75f,0xa7fb3f80,0x5800efb6,0x9bde0f45
	.word  0x296786ba,0xa5bd73e5,0x85904e94,0xa0fc1cde
	.word  0xe571203a,0x6698309b,0x24a8796e,0x62ec0c78
	.word  0x077052a9,0xd304829d,0xa7c1a6ac,0x403decea
	.word  0x5780344f,0x524513fb,0xc4665b1d,0x8970442f
	.word  0x7d66a950,0x788c4034,0x6ba386ae,0x3cd984ac
	.word  0xd368e071,0x2c66f9cd,0xdc953038,0xbd155c6c
	.word  0x142459a2,0x5f667be4,0x65bbb20a,0x32477193
	.word  0x2d43c885,0x0caa2eea,0xedd2e5a8,0xc3c365d6
	.word  0x18a4dab0,0x1e454033,0x209a1d07,0x048de1cb
	.word  0x0a43dccd,0x1979a165,0x182be1ac,0x1bd6ed6d
	.word  0x6cb0568d,0x9e05180e,0xfdffad7c,0x3d628336
	.word  0x21ca524e,0x7a74f709,0x5e8877ba,0xcf2aaaf7
	.word  0x8db9731a,0x857a5d7e,0x81674161,0x3712045b
	.word  0x52f13ac4,0x4dbdac8c,0xbc76c2a2,0xa4de322c
	.word  0xd0dd2d47,0x77442742,0xd5043cf8,0xcb25c7ac
	.word  0xb5b50bbc,0x9b8b1c16,0x757dfa8d,0x337154de
	.word  0xc332d0cf,0xa3935e3a,0x623235dd,0x22a562c6
	.word  0x694c1d09,0x7fc0809a,0x95f9b1b8,0xea17fd28
	.word  0x3168e82f,0x0083d482,0x4a2f128e,0xa6fb0771
	.word  0xad98fe99,0x70a4c0ed,0xa46bc0dd,0x50ed1b6b
	.word  0xf3c7d5cf,0x63526965,0xa058c47e,0x9cc0d299
	.word  0x86d3ace2,0x69f38427,0x89e5039c,0x3cb52329
	.word  0x17e77ace,0x5a0c0114,0x335f4231,0x0dc3fa90
	.word  0xb7fac680,0x8a849b05,0x7ac06507,0x86e93d0e
	.word  0x1723dc80,0xc119191a,0x4a91c7e9,0x16b9de64
	.word  0x576296c7,0x6c555383,0xea2904a0,0xdbc60490
	.word  0xa9fa1885,0xdc528a93,0x06af5b53,0x5e168cb4
	.word  0xb653e9cd,0x08311f13,0x6cca7a6c,0x86dda9b9
	.word  0x69586af7,0x0772628c,0x17d7ea59,0xe9c75ead
	.word  0x3bd2af2f,0x68fb6688,0xdf88268a,0xe1843353
	.word  0x5fd5b0af,0x516ddd87,0x1af3e0a8,0x7fa55ef9


