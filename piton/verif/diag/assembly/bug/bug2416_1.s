// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: bug2416_1.s
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
   random seed:	371582031
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
        setx  0x00000000000006a0, %g1, %r9
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
        setx  0x57bd5e2d77cb3910, %g1, %r0
        setx  0xf4d04b57fba85c92, %g1, %r1
        setx  0xa1189ae11f358797, %g1, %r2
        setx  0x32ef937c5c014dc0, %g1, %r3
        setx  0x737c4ca4a7b85d36, %g1, %r4
        setx  0x2dd1e5db8281edc8, %g1, %r5
        setx  0x911ac1f27c1ad166, %g1, %r6
        setx  0xb8502d32f1a91c9d, %g1, %r7
        setx  0xd9dd35096de22c17, %g1, %r10
        setx  0x777263baaf94361f, %g1, %r11
        setx  0x76a93392f93f3fef, %g1, %r12
        setx  0x69e31103fe10e37d, %g1, %r13
        setx  0x39b1ecc49b87167d, %g1, %r14
        setx  0xa02dc567b149b19b, %g1, %r15
        setx  0x3e34619a5b92d1bd, %g1, %r16
        setx  0x875adcb60d95992a, %g1, %r17
        setx  0xc9791ad063ca7704, %g1, %r18
        setx  0x3242d15aabd6f6ca, %g1, %r19
        setx  0xf7fa47cdc6613d50, %g1, %r20
        setx  0x3fb2a00a2e182e5d, %g1, %r21
        setx  0x26489dfd861c8359, %g1, %r22
        setx  0xff02777d0f8a6fef, %g1, %r23
        setx  0x1bf2bd37542a8120, %g1, %r24
        setx  0xb6d3ce4a7c8d109f, %g1, %r25
        setx  0x248a6f2b03a57bdc, %g1, %r26
        setx  0x3940d463c08e97de, %g1, %r27
        setx  0x019201c03d4da772, %g1, %r28
        setx  0xbb0b8615616c30cc, %g1, %r29
        setx  0x20f9ea61f99beaab, %g1, %r30
        setx  0xebfe94900fe5ff51, %g1, %r31
	.word 0xb56a0009  ! 6: SDIVX_R	sdivx	%r8, %r9, %r26
	.word 0xb3a20929  ! 7: FMULs	fmuls	%f8, %f9, %f25
	.word 0xe87a0009  ! 8: SWAP_R	swap	%r20, [%r8 + %r9]
	.word 0x8ed22e30  ! 9: UMULcc_I	umulcc 	%r8, 0x0e30, %r7
	.word 0xd53a2568  ! 10: STDF_I	std	%f10, [0x0568, %r8]
	.word 0xcad21009  ! 11: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r5
	.word 0x8f6a2cf4  ! 12: SDIVX_I	sdivx	%r8, 0x0cf4, %r7
	.word 0x84720009  ! 13: UDIV_R	udiv 	%r8, %r9, %r2
	.word 0xac4a0009  ! 14: MULX_R	mulx 	%r8, %r9, %r22
	.word 0xc4a21009  ! 15: STWA_R	stwa	%r2, [%r8 + %r9] 0x80
	.word 0x0a800008  ! 16: BCS	bcs  	<label_0x8>
	.word 0xa3a209a9  ! 17: FDIVs	fdivs	%f8, %f9, %f17
	.word 0xcaf22430  ! 18: STXA_I	stxa	%r5, [%r8 + 0x0430] %asi
	.word 0x8143e05d  ! 19: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0xc3ea2270  ! 20: PREFETCHA_I	prefetcha	[%r8, + 0x0270] %asi, #one_read
	.word 0xafa208a9  ! 21: FSUBs	fsubs	%f8, %f9, %f23
	.word 0xdcba1009  ! 22: STDA_R	stda	%r14, [%r8 + %r9] 0x80
	.word 0xc24a226c  ! 23: LDSB_I	ldsb	[%r8 + 0x026c], %r1
	.word 0xdeaa2174  ! 24: STBA_I	stba	%r15, [%r8 + 0x0174] %asi
	.word 0x896a238c  ! 25: SDIVX_I	sdivx	%r8, 0x038c, %r4
	.word 0xc6122b18  ! 26: LDUH_I	lduh	[%r8 + 0x0b18], %r3
	.word 0x88fa0009  ! 27: SDIVcc_R	sdivcc 	%r8, %r9, %r4
	.word 0x36800004  ! 28: BGE	bge,a	<label_0x4>
	.word 0x06800004  ! 29: BL	bl  	<label_0x4>
	.word 0xec8222a0  ! 30: LDUWA_I	lduwa	[%r8, + 0x02a0] %asi, %r22
	.word 0x20800004  ! 31: BN	bn,a	<label_0x4>
	.word 0xce4a2ba0  ! 32: LDSB_I	ldsb	[%r8 + 0x0ba0], %r7
	.word 0x0c800008  ! 33: BNEG	bneg  	<label_0x8>
	.word 0xc3ea296c  ! 34: PREFETCHA_I	prefetcha	[%r8, + 0x096c] %asi, #one_read
	.word 0xc67a2658  ! 35: SWAP_I	swap	%r3, [%r8 + 0x0658]
	.word 0xc2d22244  ! 36: LDSHA_I	ldsha	[%r8, + 0x0244] %asi, %r1
	.word 0x26800004  ! 37: BL	bl,a	<label_0x4>
	.word 0xac5a29d0  ! 38: SMUL_I	smul 	%r8, 0x09d0, %r22
	.word 0x8f220009  ! 40: MULScc_R	mulscc 	%r8, %r9, %r7
	.word 0xea120009  ! 41: LDUH_R	lduh	[%r8 + %r9], %r21
	.word 0xcaa22f40  ! 42: STWA_I	stwa	%r5, [%r8 + 0x0f40] %asi
	.word 0xcf220009  ! 43: STF_R	st	%f7, [%r9, %r8]
	.word 0xcbf21009  ! 44: CASXA_I	casxa	[%r8] 0x80, %r9, %r5
	.word 0x40000004  ! 45: CALL	call	disp30_4
	.word 0x2e800008  ! 46: BVS	bvs,a	<label_0x8>
	.word 0x8a5229ec  ! 47: UMUL_I	umul 	%r8, 0x09ec, %r5
	.word 0x8143e034  ! 48: MEMBAR	membar	#LoadStore | #Lookaside | #MemIssue 
	.word 0x20800004  ! 49: BN	bn,a	<label_0x4>
	.word 0x8143c000  ! 50: STBAR	stbar
	.word 0xc9220009  ! 51: STF_R	st	%f4, [%r9, %r8]
	.word 0xc3ea220c  ! 52: PREFETCHA_I	prefetcha	[%r8, + 0x020c] %asi, #one_read
	.word 0xf66a2938  ! 53: LDSTUB_I	ldstub	%r27, [%r8 + 0x0938]
	.word 0xc8ca29b8  ! 55: LDSBA_I	ldsba	[%r8, + 0x09b8] %asi, %r4
	.word 0xc4fa1009  ! 60: SWAPA_R	swapa	%r2, [%r8 + %r9] 0x80
	.word 0x8143e050  ! 61: MEMBAR	membar	#Lookaside | #Sync 
	.word 0x8143c000  ! 62: STBAR	stbar
	.word 0xbed22b8c  ! 63: UMULcc_I	umulcc 	%r8, 0x0b8c, %r31
	.word 0x885a2308  ! 64: SMUL_I	smul 	%r8, 0x0308, %r4
	.word 0xee520009  ! 65: LDSH_R	ldsh	[%r8 + %r9], %r23
	.word 0x28800004  ! 66: BLEU	bleu,a	<label_0x4>
	.word 0x827a2468  ! 67: SDIV_I	sdiv 	%r8, 0x0468, %r1
	.word 0xca420009  ! 68: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xc3ea2a90  ! 69: PREFETCHA_I	prefetcha	[%r8, + 0x0a90] %asi, #one_read
	.word 0x8143c000  ! 70: STBAR	stbar
	.word 0x8c7a2038  ! 71: SDIV_I	sdiv 	%r8, 0x0038, %r6
	.word 0x844a27d0  ! 73: MULX_I	mulx 	%r8, 0x07d0, %r2
	.word 0x12800004  ! 74: BNE	bne  	<label_0x4>
	.word 0xc61223a0  ! 75: LDUH_I	lduh	[%r8 + 0x03a0], %r3
	.word 0x856a2c1c  ! 76: SDIVX_I	sdivx	%r8, 0x0c1c, %r2
	.word 0x96f221a4  ! 77: UDIVcc_I	udivcc 	%r8, 0x01a4, %r11
	.word 0xf8c22d8c  ! 78: LDSWA_I	ldswa	[%r8, + 0x0d8c] %asi, %r28
	.word 0x2a800004  ! 80: BCS	bcs,a	<label_0x4>
	.word 0xc53a25c0  ! 81: STDF_I	std	%f2, [0x05c0, %r8]
	.word 0xc67a0009  ! 82: SWAP_R	swap	%r3, [%r8 + %r9]
	.word 0xc36a2928  ! 83: PREFETCH_I	prefetch	[%r8 + 0x0928], #one_read
	.word 0xc9222270  ! 84: STF_I	st	%f4, [0x0270, %r8]
	.word 0xc4fa1009  ! 85: SWAPA_R	swapa	%r2, [%r8 + %r9] 0x80
	.word 0x36800004  ! 87: BGE	bge,a	<label_0x4>
	.word 0xc2b21009  ! 88: STHA_R	stha	%r1, [%r8 + %r9] 0x80
	.word 0xc8f21009  ! 90: STXA_R	stxa	%r4, [%r8 + %r9] 0x80
	.word 0x1e800008  ! 91: BVC	bvc  	<label_0x8>
	.word 0xccfa2c64  ! 92: SWAPA_I	swapa	%r6, [%r8 + 0x0c64] %asi
	.word 0x8ba209a9  ! 93: FDIVs	fdivs	%f8, %f9, %f5
	.word 0xa1a209a9  ! 95: FDIVs	fdivs	%f8, %f9, %f16
	.word 0x82f22f14  ! 96: UDIVcc_I	udivcc 	%r8, 0x0f14, %r1
	.word 0x12800004  ! 97: BNE	bne  	<label_0x4>
	.word 0x8143e01b  ! 98: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Lookaside 
	.word 0x8a52227c  ! 99: UMUL_I	umul 	%r8, 0x027c, %r5
	.word 0x1e800004  ! 100: BVC	bvc  	<label_0x4>
	.word 0x8a7a22c4  ! 101: SDIV_I	sdiv 	%r8, 0x02c4, %r5
	.word 0x04ca0004  ! 102: BRLEZ	brlez  ,pt	%8,<label_0xa0004>
	.word 0xf8d21009  ! 103: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r28
	.word 0x82f2231c  ! 104: UDIVcc_I	udivcc 	%r8, 0x031c, %r1
	.word 0x8143e045  ! 105: MEMBAR	membar	#LoadLoad | #LoadStore | #Sync 
	.word 0xc3ea2ca4  ! 106: PREFETCHA_I	prefetcha	[%r8, + 0x0ca4] %asi, #one_read
	.word 0xec822240  ! 107: LDUWA_I	lduwa	[%r8, + 0x0240] %asi, %r22
	.word 0xfe420009  ! 108: LDSW_R	ldsw	[%r8 + %r9], %r31
	.word 0x89220009  ! 109: MULScc_R	mulscc 	%r8, %r9, %r4
	.word 0x8143c000  ! 110: STBAR	stbar
	.word 0xca6a2d2c  ! 111: LDSTUB_I	ldstub	%r5, [%r8 + 0x0d2c]
	.word 0xdc1a2d98  ! 112: LDD_I	ldd	[%r8 + 0x0d98], %r14
	.word 0xc85a2ab8  ! 113: LDX_I	ldx	[%r8 + 0x0ab8], %r4
	.word 0xca122898  ! 114: LDUH_I	lduh	[%r8 + 0x0898], %r5
	.word 0x8e7a224c  ! 116: SDIV_I	sdiv 	%r8, 0x024c, %r7
	.word 0xb64a0009  ! 118: MULX_R	mulx 	%r8, %r9, %r27
	.word 0xcd3a0009  ! 119: STDF_R	std	%f6, [%r9, %r8]
	.word 0x8fa20829  ! 120: FADDs	fadds	%f8, %f9, %f7
	.word 0x8143c000  ! 121: STBAR	stbar
	.word 0xca4a0009  ! 122: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0x08800004  ! 123: BLEU	bleu  	<label_0x4>
	.word 0xac7a2728  ! 124: SDIV_I	sdiv 	%r8, 0x0728, %r22
	.word 0xf6d2257c  ! 125: LDSHA_I	ldsha	[%r8, + 0x057c] %asi, %r27
	.word 0x89a20929  ! 126: FMULs	fmuls	%f8, %f9, %f4
	.word 0xf8f21009  ! 127: STXA_R	stxa	%r28, [%r8 + %r9] 0x80
	.word 0xca020009  ! 128: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0x00800008  ! 129: BN	bn  	<label_0x8>
	.word 0x3e800004  ! 130: BVC	bvc,a	<label_0x4>
	.word 0x84da2454  ! 131: SMULcc_I	smulcc 	%r8, 0x0454, %r2
	.word 0xcf222cb4  ! 132: STF_I	st	%f7, [0x0cb4, %r8]
	.word 0x2eca0004  ! 133: BRGEZ	brgez,a,pt	%8,<label_0xa0004>
	.word 0xc36a28f8  ! 134: PREFETCH_I	prefetch	[%r8 + 0x08f8], #one_read
	.word 0x8a522090  ! 135: UMUL_I	umul 	%r8, 0x0090, %r5
	.word 0xd9f21009  ! 136: CASXA_I	casxa	[%r8] 0x80, %r9, %r12
	.word 0x8ba20829  ! 137: FADDs	fadds	%f8, %f9, %f5
	.word 0xf41a2838  ! 138: LDD_I	ldd	[%r8 + 0x0838], %r26
	.word 0xca922074  ! 139: LDUHA_I	lduha	[%r8, + 0x0074] %asi, %r5
	.word 0xb2da2024  ! 140: SMULcc_I	smulcc 	%r8, 0x0024, %r25
	.word 0x9c6a0009  ! 141: UDIVX_R	udivx 	%r8, %r9, %r14
	.word 0xe67a2f9c  ! 142: SWAP_I	swap	%r19, [%r8 + 0x0f9c]
	.word 0x9ef22374  ! 143: UDIVcc_I	udivcc 	%r8, 0x0374, %r15
	.word 0xc8b21009  ! 144: STHA_R	stha	%r4, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 145: STBAR	stbar
	.word 0xce5a0009  ! 146: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0x38800004  ! 147: BGU	bgu,a	<label_0x4>
	.word 0xc3ea26dc  ! 148: PREFETCHA_I	prefetcha	[%r8, + 0x06dc] %asi, #one_read
	.word 0x86720009  ! 149: UDIV_R	udiv 	%r8, %r9, %r3
	.word 0x8c6a2ca8  ! 150: UDIVX_I	udivx 	%r8, 0x0ca8, %r6
	.word 0xc2ea2310  ! 151: LDSTUBA_I	ldstuba	%r1, [%r8 + 0x0310] %asi
	.word 0x8fa208a9  ! 152: FSUBs	fsubs	%f8, %f9, %f7
	.word 0x0aca0008  ! 153: BRNZ	brnz  ,pt	%8,<label_0xa0008>
	.word 0xc28a1009  ! 154: LDUBA_R	lduba	[%r8, %r9] 0x80, %r1
	.word 0x26c20004  ! 155: BRLZ	brlz,a,nt	%8,<label_0x20004>
	.word 0x8143c000  ! 156: STBAR	stbar
	.word 0x8143c000  ! 157: STBAR	stbar
	.word 0xc2420009  ! 158: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xf5e21009  ! 159: CASA_I	casa	[%r8] 0x80, %r9, %r26
	.word 0xc6f22b50  ! 160: STXA_I	stxa	%r3, [%r8 + 0x0b50] %asi
	.word 0xc36a2388  ! 161: PREFETCH_I	prefetch	[%r8 + 0x0388], #one_read
	.word 0xce5a2d40  ! 162: LDX_I	ldx	[%r8 + 0x0d40], %r7
	.word 0xf0f22058  ! 163: STXA_I	stxa	%r24, [%r8 + 0x0058] %asi
	.word 0xb4522f08  ! 165: UMUL_I	umul 	%r8, 0x0f08, %r26
	.word 0x9cfa0009  ! 166: SDIVcc_R	sdivcc 	%r8, %r9, %r14
	.word 0xc8aa28f4  ! 167: STBA_I	stba	%r4, [%r8 + 0x08f4] %asi
	.word 0xccea27b4  ! 168: LDSTUBA_I	ldstuba	%r6, [%r8 + 0x07b4] %asi
	.word 0xc44a0009  ! 169: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0x966a0009  ! 170: UDIVX_R	udivx 	%r8, %r9, %r11
	.word 0xc73a0009  ! 171: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc33a0009  ! 172: STDF_R	std	%f1, [%r9, %r8]
	.word 0xfa6a27c8  ! 174: LDSTUB_I	ldstub	%r29, [%r8 + 0x07c8]
	.word 0x8e4a0009  ! 175: MULX_R	mulx 	%r8, %r9, %r7
	.word 0x16800004  ! 176: BGE	bge  	<label_0x4>
	.word 0xd8ba2e30  ! 177: STDA_I	stda	%r12, [%r8 + 0x0e30] %asi
	.word 0x847a29e0  ! 178: SDIV_I	sdiv 	%r8, 0x09e0, %r2
	.word 0xe89a2f78  ! 179: LDDA_I	ldda	[%r8, + 0x0f78] %asi, %r20
	.word 0x8a7a2e24  ! 180: SDIV_I	sdiv 	%r8, 0x0e24, %r5
	.word 0x16800004  ! 181: BGE	bge  	<label_0x4>
	.word 0xe26a0009  ! 182: LDSTUB_R	ldstub	%r17, [%r8 + %r9]
	.word 0xc36a2fd4  ! 183: PREFETCH_I	prefetch	[%r8 + 0x0fd4], #one_read
	.word 0x8d222534  ! 184: MULScc_I	mulscc 	%r8, 0x0534, %r6
	.word 0xceb22ce4  ! 185: STHA_I	stha	%r7, [%r8 + 0x0ce4] %asi
	.word 0x8fa20829  ! 186: FADDs	fadds	%f8, %f9, %f7
	.word 0xcf3a2240  ! 187: STDF_I	std	%f7, [0x0240, %r8]
	.word 0x844a0009  ! 188: MULX_R	mulx 	%r8, %r9, %r2
	.word 0xca922730  ! 189: LDUHA_I	lduha	[%r8, + 0x0730] %asi, %r5
	.word 0xc68a1009  ! 190: LDUBA_R	lduba	[%r8, %r9] 0x80, %r3
	.word 0x1c800004  ! 191: BPOS	bpos  	<label_0x4>
	.word 0x887a0009  ! 193: SDIV_R	sdiv 	%r8, %r9, %r4
	.word 0x9f6a2aac  ! 194: SDIVX_I	sdivx	%r8, 0x0aac, %r15
	.word 0xc7e22009  ! 195: CASA_R	casa	[%r8] %asi, %r9, %r3
	.word 0xc4a2261c  ! 196: STWA_I	stwa	%r2, [%r8 + 0x061c] %asi
	.word 0xc6520009  ! 197: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xc64222ec  ! 198: LDSW_I	ldsw	[%r8 + 0x02ec], %r3
	.word 0x85a209a9  ! 199: FDIVs	fdivs	%f8, %f9, %f2
	.word 0x02800004  ! 200: BE	be  	<label_0x4>
	.word 0x876a0009  ! 201: SDIVX_R	sdivx	%r8, %r9, %r3
	.word 0xa9220009  ! 202: MULScc_R	mulscc 	%r8, %r9, %r20
	.word 0x827a0009  ! 203: SDIV_R	sdiv 	%r8, %r9, %r1
	.word 0xc44a0009  ! 204: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xc3ea2e34  ! 205: PREFETCHA_I	prefetcha	[%r8, + 0x0e34] %asi, #one_read
	.word 0xca420009  ! 206: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xffe21009  ! 207: CASA_I	casa	[%r8] 0x80, %r9, %r31
	.word 0xf84a0009  ! 209: LDSB_R	ldsb	[%r8 + %r9], %r28
	.word 0xd8ca2c88  ! 210: LDSBA_I	ldsba	[%r8, + 0x0c88] %asi, %r12
	.word 0xcab2230c  ! 211: STHA_I	stha	%r5, [%r8 + 0x030c] %asi
	.word 0xcc022540  ! 213: LDUW_I	lduw	[%r8 + 0x0540], %r6
	.word 0x8efa2e30  ! 214: SDIVcc_I	sdivcc 	%r8, 0x0e30, %r7
	.word 0xf64a0009  ! 215: LDSB_R	ldsb	[%r8 + %r9], %r27
	.word 0xf7e21009  ! 216: CASA_I	casa	[%r8] 0x80, %r9, %r27
	.word 0xc20a2dcc  ! 217: LDUB_I	ldub	[%r8 + 0x0dcc], %r1
	.word 0x85a209a9  ! 218: FDIVs	fdivs	%f8, %f9, %f2
	.word 0xc24a0009  ! 219: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xc3ea2104  ! 220: PREFETCHA_I	prefetcha	[%r8, + 0x0104] %asi, #one_read
	.word 0xc6ca1009  ! 221: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r3
	.word 0x8143e049  ! 222: MEMBAR	membar	#LoadLoad | #StoreStore | #Sync 
	.word 0x8143c000  ! 223: STBAR	stbar
	.word 0xceb2259c  ! 224: STHA_I	stha	%r7, [%r8 + 0x059c] %asi
	.word 0xc6fa1009  ! 225: SWAPA_R	swapa	%r3, [%r8 + %r9] 0x80
	.word 0xa44a2304  ! 226: MULX_I	mulx 	%r8, 0x0304, %r18
	.word 0x8da208a9  ! 227: FSUBs	fsubs	%f8, %f9, %f6
	.word 0x2c800004  ! 228: BNEG	bneg,a	<label_0x4>
	.word 0x8cda22e0  ! 229: SMULcc_I	smulcc 	%r8, 0x02e0, %r6
	.word 0xcec21009  ! 230: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r7
	.word 0x8143e014  ! 231: MEMBAR	membar	#LoadStore | #Lookaside 
	.word 0xa07a24d8  ! 232: SDIV_I	sdiv 	%r8, 0x04d8, %r16
	.word 0x2aca0004  ! 233: BRNZ	brnz,a,pt	%8,<label_0xa0004>
	.word 0x04800004  ! 234: BLE	ble  	<label_0x4>
	.word 0xa8722a84  ! 235: UDIV_I	udiv 	%r8, 0x0a84, %r20
	.word 0xc2d22750  ! 236: LDSHA_I	ldsha	[%r8, + 0x0750] %asi, %r1
	.word 0xc41a2390  ! 237: LDD_I	ldd	[%r8 + 0x0390], %r2
	.word 0xccba24d0  ! 238: STDA_I	stda	%r6, [%r8 + 0x04d0] %asi
	.word 0xc36a2b44  ! 239: PREFETCH_I	prefetch	[%r8 + 0x0b44], #one_read
	.word 0xdeda2068  ! 240: LDXA_I	ldxa	[%r8, + 0x0068] %asi, %r15
	.word 0x8143e06e  ! 241: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #MemIssue | #Sync 
	.word 0x8143e03a  ! 242: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside | #MemIssue 
	.word 0x8a4a0009  ! 243: MULX_R	mulx 	%r8, %r9, %r5
	.word 0x8ad22624  ! 244: UMULcc_I	umulcc 	%r8, 0x0624, %r5
	.word 0x8143c000  ! 245: STBAR	stbar
	.word 0xf8a220e4  ! 246: STWA_I	stwa	%r28, [%r8 + 0x00e4] %asi
	.word 0xc5f22009  ! 247: CASXA_R	casxa	[%r8]%asi, %r9, %r2
	.word 0xc93a20f0  ! 248: STDF_I	std	%f4, [0x00f0, %r8]
	.word 0xe88a2744  ! 249: LDUBA_I	lduba	[%r8, + 0x0744] %asi, %r20
	.word 0x8143e036  ! 250: MEMBAR	membar	#StoreLoad | #LoadStore | #Lookaside | #MemIssue 
	.word 0xde4224a4  ! 251: LDSW_I	ldsw	[%r8 + 0x04a4], %r15
	.word 0xc2122ed8  ! 252: LDUH_I	lduh	[%r8 + 0x0ed8], %r1
	.word 0x9d6a0009  ! 253: SDIVX_R	sdivx	%r8, %r9, %r14
	.word 0x8e7a2c00  ! 254: SDIV_I	sdiv 	%r8, 0x0c00, %r7
	.word 0xcad221f4  ! 255: LDSHA_I	ldsha	[%r8, + 0x01f4] %asi, %r5
	.word 0x82522fc8  ! 256: UMUL_I	umul 	%r8, 0x0fc8, %r1
	.word 0x89a20929  ! 257: FMULs	fmuls	%f8, %f9, %f4
	.word 0x8143c000  ! 258: STBAR	stbar
	.word 0xce120009  ! 259: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xe01a0009  ! 260: LDD_R	ldd	[%r8 + %r9], %r16
	.word 0x10800004  ! 261: BA	ba  	<label_0x4>
	.word 0xcec22030  ! 262: LDSWA_I	ldswa	[%r8, + 0x0030] %asi, %r7
	.word 0x8cf222c8  ! 263: UDIVcc_I	udivcc 	%r8, 0x02c8, %r6
	.word 0xfaea1009  ! 264: LDSTUBA_R	ldstuba	%r29, [%r8 + %r9] 0x80
	.word 0x8da20829  ! 265: FADDs	fadds	%f8, %f9, %f6
	.word 0x8fa20829  ! 266: FADDs	fadds	%f8, %f9, %f7
	.word 0x8ada23a0  ! 267: SMULcc_I	smulcc 	%r8, 0x03a0, %r5
	.word 0xccfa27d0  ! 268: SWAPA_I	swapa	%r6, [%r8 + 0x07d0] %asi
	.word 0xe89a2848  ! 269: LDDA_I	ldda	[%r8, + 0x0848] %asi, %r20
	.word 0xcb2224c0  ! 270: STF_I	st	%f5, [0x04c0, %r8]
	.word 0xe93a2828  ! 271: STDF_I	std	%f20, [0x0828, %r8]
	.word 0x30800004  ! 272: BA	ba,a	<label_0x4>
	.word 0xc4f21009  ! 273: STXA_R	stxa	%r2, [%r8 + %r9] 0x80
	.word 0xaa5a0009  ! 274: SMUL_R	smul 	%r8, %r9, %r21
	.word 0x8fa208a9  ! 275: FSUBs	fsubs	%f8, %f9, %f7
	.word 0x12800008  ! 276: BNE	bne  	<label_0x8>
	.word 0xc6ea2148  ! 277: LDSTUBA_I	ldstuba	%r3, [%r8 + 0x0148] %asi
	.word 0xc3ea202c  ! 278: PREFETCHA_I	prefetcha	[%r8, + 0x002c] %asi, #one_read
	.word 0xc2822dec  ! 280: LDUWA_I	lduwa	[%r8, + 0x0dec] %asi, %r1
	.word 0xc6b224c0  ! 281: STHA_I	stha	%r3, [%r8 + 0x04c0] %asi
	.word 0xca921009  ! 282: LDUHA_R	lduha	[%r8, %r9] 0x80, %r5
	.word 0x8143e024  ! 283: MEMBAR	membar	#LoadStore | #MemIssue 
	.word 0xb852298c  ! 284: UMUL_I	umul 	%r8, 0x098c, %r28
	.word 0x82da0009  ! 287: SMULcc_R	smulcc 	%r8, %r9, %r1
	.word 0xc2c222e8  ! 288: LDSWA_I	ldswa	[%r8, + 0x02e8] %asi, %r1
	.word 0xbda208a9  ! 290: FSUBs	fsubs	%f8, %f9, %f30
	.word 0x8143c000  ! 291: STBAR	stbar
	.word 0x8da209a9  ! 292: FDIVs	fdivs	%f8, %f9, %f6
	.word 0xcca22250  ! 293: STWA_I	stwa	%r6, [%r8 + 0x0250] %asi
	.word 0xc6aa29ac  ! 294: STBA_I	stba	%r3, [%r8 + 0x09ac] %asi
	.word 0x06800004  ! 295: BL	bl  	<label_0x4>
	.word 0xc36a29c8  ! 296: PREFETCH_I	prefetch	[%r8 + 0x09c8], #one_read
	.word 0xc86a2d38  ! 297: LDSTUB_I	ldstub	%r4, [%r8 + 0x0d38]
	.word 0xb5a20929  ! 298: FMULs	fmuls	%f8, %f9, %f26
	.word 0xc88222dc  ! 299: LDUWA_I	lduwa	[%r8, + 0x02dc] %asi, %r4
	.word 0xc4a22f44  ! 300: STWA_I	stwa	%r2, [%r8 + 0x0f44] %asi
	.word 0xcca21009  ! 301: STWA_R	stwa	%r6, [%r8 + %r9] 0x80
	.word 0x02c20008  ! 302: BRZ	brz  ,nt	%8,<label_0x20008>
	.word 0x82fa0009  ! 303: SDIVcc_R	sdivcc 	%r8, %r9, %r1
	.word 0xca8a1009  ! 304: LDUBA_R	lduba	[%r8, %r9] 0x80, %r5
	.word 0xc6d22a68  ! 305: LDSHA_I	ldsha	[%r8, + 0x0a68] %asi, %r3
	.word 0xca9224f4  ! 306: LDUHA_I	lduha	[%r8, + 0x04f4] %asi, %r5
	.word 0x8143e002  ! 308: MEMBAR	membar	#StoreLoad 
	.word 0xc4ea1009  ! 309: LDSTUBA_R	ldstuba	%r2, [%r8 + %r9] 0x80
	.word 0xc36a2040  ! 310: PREFETCH_I	prefetch	[%r8 + 0x0040], #one_read
	.word 0x9cda0009  ! 311: SMULcc_R	smulcc 	%r8, %r9, %r14
	.word 0xc8f21009  ! 312: STXA_R	stxa	%r4, [%r8 + %r9] 0x80
	.word 0x2e800004  ! 313: BVS	bvs,a	<label_0x4>
	.word 0x8a522b40  ! 314: UMUL_I	umul 	%r8, 0x0b40, %r5
	.word 0x8c722f98  ! 315: UDIV_I	udiv 	%r8, 0x0f98, %r6
	.word 0xc93a0009  ! 316: STDF_R	std	%f4, [%r9, %r8]
	.word 0x02ca0004  ! 317: BRZ	brz  ,pt	%8,<label_0xa0004>
	.word 0x8c520009  ! 318: UMUL_R	umul 	%r8, %r9, %r6
	.word 0xe7220009  ! 320: STF_R	st	%f19, [%r9, %r8]
	.word 0x8143e029  ! 321: MEMBAR	membar	#LoadLoad | #StoreStore | #MemIssue 
	.word 0x9d6a0009  ! 323: SDIVX_R	sdivx	%r8, %r9, %r14
	.word 0x8143c000  ! 324: STBAR	stbar
	.word 0xcbf21009  ! 325: CASXA_I	casxa	[%r8] 0x80, %r9, %r5
	.word 0x8143c000  ! 326: STBAR	stbar
	.word 0xc36a2020  ! 327: PREFETCH_I	prefetch	[%r8 + 0x0020], #one_read
	.word 0xc47a2c5c  ! 328: SWAP_I	swap	%r2, [%r8 + 0x0c5c]
	.word 0xc87a27d0  ! 329: SWAP_I	swap	%r4, [%r8 + 0x07d0]
	.word 0xcaa21009  ! 330: STWA_R	stwa	%r5, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 331: STBAR	stbar
	.word 0xe0ba1009  ! 332: STDA_R	stda	%r16, [%r8 + %r9] 0x80
	.word 0x8143e01c  ! 333: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside 
	.word 0x8143e05c  ! 334: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0x1e800004  ! 335: BVC	bvc  	<label_0x4>
	.word 0xcb222dc4  ! 336: STF_I	st	%f5, [0x0dc4, %r8]
	.word 0x10800004  ! 337: BA	ba  	<label_0x4>
	.word 0xc4a220ac  ! 338: STWA_I	stwa	%r2, [%r8 + 0x00ac] %asi
	.word 0x8af20009  ! 339: UDIVcc_R	udivcc 	%r8, %r9, %r5
	.word 0xc2aa1009  ! 340: STBA_R	stba	%r1, [%r8 + %r9] 0x80
	.word 0x1a800004  ! 341: BCC	bcc  	<label_0x4>
	.word 0xdcba2880  ! 342: STDA_I	stda	%r14, [%r8 + 0x0880] %asi
	.word 0x8cda2254  ! 343: SMULcc_I	smulcc 	%r8, 0x0254, %r6
	.word 0x24800008  ! 344: BLE	ble,a	<label_0x8>
	.word 0xc8922120  ! 345: LDUHA_I	lduha	[%r8, + 0x0120] %asi, %r4
	.word 0xca5a2820  ! 346: LDX_I	ldx	[%r8 + 0x0820], %r5
	.word 0x8cf22cb4  ! 347: UDIVcc_I	udivcc 	%r8, 0x0cb4, %r6
	.word 0xf4ba1009  ! 348: STDA_R	stda	%r26, [%r8 + %r9] 0x80
	.word 0xb7a20929  ! 349: FMULs	fmuls	%f8, %f9, %f27
	.word 0x3e800004  ! 350: BVC	bvc,a	<label_0x4>
	.word 0xe4aa291c  ! 351: STBA_I	stba	%r18, [%r8 + 0x091c] %asi
	.word 0xfe922c28  ! 352: LDUHA_I	lduha	[%r8, + 0x0c28] %asi, %r31
	.word 0x896a24dc  ! 353: SDIVX_I	sdivx	%r8, 0x04dc, %r4
	.word 0xf0aa1009  ! 354: STBA_R	stba	%r24, [%r8 + %r9] 0x80
	.word 0x9a720009  ! 355: UDIV_R	udiv 	%r8, %r9, %r13
	.word 0xf0fa1009  ! 356: SWAPA_R	swapa	%r24, [%r8 + %r9] 0x80
	.word 0x8143e07e  ! 357: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xc6ea1009  ! 358: LDSTUBA_R	ldstuba	%r3, [%r8 + %r9] 0x80
	.word 0x36800008  ! 359: BGE	bge,a	<label_0x8>
	.word 0x8e5222d4  ! 360: UMUL_I	umul 	%r8, 0x02d4, %r7
	.word 0xaef22ee4  ! 361: UDIVcc_I	udivcc 	%r8, 0x0ee4, %r23
	.word 0xf44a2828  ! 362: LDSB_I	ldsb	[%r8 + 0x0828], %r26
	.word 0x8143e030  ! 363: MEMBAR	membar	#Lookaside | #MemIssue 
	.word 0xaef2229c  ! 364: UDIVcc_I	udivcc 	%r8, 0x029c, %r23
	.word 0xc2ea1009  ! 365: LDSTUBA_R	ldstuba	%r1, [%r8 + %r9] 0x80
	.word 0xc3ea2e84  ! 366: PREFETCHA_I	prefetcha	[%r8, + 0x0e84] %asi, #one_read
	.word 0xcca225e0  ! 367: STWA_I	stwa	%r6, [%r8 + 0x05e0] %asi
	.word 0xc4ba2360  ! 369: STDA_I	stda	%r2, [%r8 + 0x0360] %asi
	.word 0xb3a208a9  ! 370: FSUBs	fsubs	%f8, %f9, %f25
	.word 0xc9e22009  ! 372: CASA_R	casa	[%r8] %asi, %r9, %r4
	.word 0xcaea1009  ! 373: LDSTUBA_R	ldstuba	%r5, [%r8 + %r9] 0x80
	.word 0xada20829  ! 375: FADDs	fadds	%f8, %f9, %f22
	.word 0xf0aa1009  ! 376: STBA_R	stba	%r24, [%r8 + %r9] 0x80
	.word 0x94d2251c  ! 377: UMULcc_I	umulcc 	%r8, 0x051c, %r10
	.word 0x0eca0004  ! 378: BRGEZ	brgez  ,pt	%8,<label_0xa0004>
	.word 0x20800004  ! 379: BN	bn,a	<label_0x4>
	.word 0xce5a0009  ! 380: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xc3ea2c40  ! 381: PREFETCHA_I	prefetcha	[%r8, + 0x0c40] %asi, #one_read
	.word 0x08800008  ! 382: BLEU	bleu  	<label_0x8>
	.word 0xcaa2248c  ! 384: STWA_I	stwa	%r5, [%r8 + 0x048c] %asi
	.word 0x38800004  ! 385: BGU	bgu,a	<label_0x4>
	.word 0x0c800004  ! 386: BNEG	bneg  	<label_0x4>
	.word 0xc7f22009  ! 387: CASXA_R	casxa	[%r8]%asi, %r9, %r3
	.word 0x8143e007  ! 388: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore 
	.word 0xd8aa2434  ! 389: STBA_I	stba	%r12, [%r8 + 0x0434] %asi
	.word 0x8da208a9  ! 390: FSUBs	fsubs	%f8, %f9, %f6
	.word 0xc44a0009  ! 391: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xcafa1009  ! 392: SWAPA_R	swapa	%r5, [%r8 + %r9] 0x80
	.word 0xee921009  ! 393: LDUHA_R	lduha	[%r8, %r9] 0x80, %r23
	.word 0xc3ea292c  ! 394: PREFETCHA_I	prefetcha	[%r8, + 0x092c] %asi, #one_read
	.word 0xb45a0009  ! 395: SMUL_R	smul 	%r8, %r9, %r26
	.word 0x8cf22100  ! 396: UDIVcc_I	udivcc 	%r8, 0x0100, %r6
	.word 0x8da20829  ! 397: FADDs	fadds	%f8, %f9, %f6
	.word 0x8e7a2e20  ! 398: SDIV_I	sdiv 	%r8, 0x0e20, %r7
	.word 0xfab21009  ! 399: STHA_R	stha	%r29, [%r8 + %r9] 0x80
	.word 0x10800004  ! 401: BA	ba  	<label_0x4>
	.word 0x06ca0004  ! 402: BRLZ	brlz  ,pt	%8,<label_0xa0004>
	.word 0x8143e039  ! 403: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside | #MemIssue 
	.word 0x86fa2930  ! 404: SDIVcc_I	sdivcc 	%r8, 0x0930, %r3
	.word 0x8143e014  ! 406: MEMBAR	membar	#LoadStore | #Lookaside 
	.word 0xc44225fc  ! 407: LDSW_I	ldsw	[%r8 + 0x05fc], %r2
	.word 0xca6a217c  ! 408: LDSTUB_I	ldstub	%r5, [%r8 + 0x017c]
	.word 0xce0a0009  ! 409: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xc73a0009  ! 410: STDF_R	std	%f3, [%r9, %r8]
	.word 0xceaa1009  ! 411: STBA_R	stba	%r7, [%r8 + %r9] 0x80
	.word 0x8143e05a  ! 412: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside | #Sync 
	.word 0xc7220009  ! 413: STF_R	st	%f3, [%r9, %r8]
	.word 0xc40a0009  ! 414: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xc36a2248  ! 415: PREFETCH_I	prefetch	[%r8 + 0x0248], #one_read
	.word 0x84fa2a38  ! 416: SDIVcc_I	sdivcc 	%r8, 0x0a38, %r2
	.word 0xca1222fc  ! 417: LDUH_I	lduh	[%r8 + 0x02fc], %r5
	.word 0xb2da0009  ! 418: SMULcc_R	smulcc 	%r8, %r9, %r25
	.word 0xec1a0009  ! 419: LDD_R	ldd	[%r8 + %r9], %r22
	.word 0x8cd226b0  ! 420: UMULcc_I	umulcc 	%r8, 0x06b0, %r6
	.word 0x87a20829  ! 422: FADDs	fadds	%f8, %f9, %f3
	.word 0x8eda0009  ! 423: SMULcc_R	smulcc 	%r8, %r9, %r7
	.word 0x8ba209a9  ! 425: FDIVs	fdivs	%f8, %f9, %f5
	.word 0xc4aa2cb8  ! 426: STBA_I	stba	%r2, [%r8 + 0x0cb8] %asi
	.word 0x9ada2588  ! 427: SMULcc_I	smulcc 	%r8, 0x0588, %r13
	.word 0xeef21009  ! 428: STXA_R	stxa	%r23, [%r8 + %r9] 0x80
	.word 0xee6a0009  ! 429: LDSTUB_R	ldstub	%r23, [%r8 + %r9]
	.word 0xa1a209a9  ! 430: FDIVs	fdivs	%f8, %f9, %f16
	.word 0xc20a2624  ! 431: LDUB_I	ldub	[%r8 + 0x0624], %r1
	.word 0x8b220009  ! 432: MULScc_R	mulscc 	%r8, %r9, %r5
	.word 0xebf22009  ! 433: CASXA_R	casxa	[%r8]%asi, %r9, %r21
	.word 0xc26a2710  ! 434: LDSTUB_I	ldstub	%r1, [%r8 + 0x0710]
	.word 0xc53a2a68  ! 435: STDF_I	std	%f2, [0x0a68, %r8]
	.word 0xca020009  ! 436: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xf8aa1009  ! 437: STBA_R	stba	%r28, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 438: STBAR	stbar
	.word 0x86d22b74  ! 439: UMULcc_I	umulcc 	%r8, 0x0b74, %r3
	.word 0x86da0009  ! 440: SMULcc_R	smulcc 	%r8, %r9, %r3
	.word 0xa5a208a9  ! 441: FSUBs	fsubs	%f8, %f9, %f18
	.word 0xcdf22009  ! 442: CASXA_R	casxa	[%r8]%asi, %r9, %r6
	.word 0xc8ea2bac  ! 443: LDSTUBA_I	ldstuba	%r4, [%r8 + 0x0bac] %asi
	.word 0xce120009  ! 444: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xa65a0009  ! 445: SMUL_R	smul 	%r8, %r9, %r19
	.word 0x885a2884  ! 446: SMUL_I	smul 	%r8, 0x0884, %r4
	.word 0xc36a2f14  ! 447: PREFETCH_I	prefetch	[%r8 + 0x0f14], #one_read
	.word 0xc87a2658  ! 448: SWAP_I	swap	%r4, [%r8 + 0x0658]
	.word 0xaa4a2724  ! 450: MULX_I	mulx 	%r8, 0x0724, %r21
	.word 0xc6ea2bd0  ! 451: LDSTUBA_I	ldstuba	%r3, [%r8 + 0x0bd0] %asi
	.word 0xc45a0009  ! 452: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0x26c20004  ! 453: BRLZ	brlz,a,nt	%8,<label_0x20004>
	.word 0xfde22009  ! 454: CASA_R	casa	[%r8] %asi, %r9, %r30
	.word 0xf6b223f4  ! 455: STHA_I	stha	%r27, [%r8 + 0x03f4] %asi
	.word 0xccd21009  ! 456: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r6
	.word 0xcaaa2588  ! 457: STBA_I	stba	%r5, [%r8 + 0x0588] %asi
	.word 0xfc1a0009  ! 458: LDD_R	ldd	[%r8 + %r9], %r30
	.word 0x892229e0  ! 459: MULScc_I	mulscc 	%r8, 0x09e0, %r4
	.word 0xca4a0009  ! 460: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xf8aa1009  ! 461: STBA_R	stba	%r28, [%r8 + %r9] 0x80
	.word 0xf2aa27f8  ! 462: STBA_I	stba	%r25, [%r8 + 0x07f8] %asi
	.word 0xf81a0009  ! 463: LDD_R	ldd	[%r8 + %r9], %r28
	.word 0xcff22009  ! 464: CASXA_R	casxa	[%r8]%asi, %r9, %r7
	.word 0xc8b22f1c  ! 465: STHA_I	stha	%r4, [%r8 + 0x0f1c] %asi
	.word 0xc3ea2400  ! 466: PREFETCHA_I	prefetcha	[%r8, + 0x0400] %asi, #one_read
	.word 0x83a20929  ! 467: FMULs	fmuls	%f8, %f9, %f1
	.word 0xe09a1009  ! 470: LDDA_R	ldda	[%r8, %r9] 0x80, %r16
	.word 0x8143c000  ! 471: STBAR	stbar
	.word 0x18800008  ! 472: BGU	bgu  	<label_0x8>
	.word 0xce120009  ! 473: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xcad21009  ! 474: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r5
	.word 0x0eca0008  ! 475: BRGEZ	brgez  ,pt	%8,<label_0xa0008>
	.word 0x36800008  ! 476: BGE	bge,a	<label_0x8>
	.word 0x8c7227b0  ! 477: UDIV_I	udiv 	%r8, 0x07b0, %r6
	.word 0xc6da1009  ! 478: LDXA_R	ldxa	[%r8, %r9] 0x80, %r3
	.word 0x8143e019  ! 480: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside 
	.word 0x34800004  ! 481: BG	bg,a	<label_0x4>
	.word 0x8143e03d  ! 482: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0x8143e03c  ! 483: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0x8ad20009  ! 484: UMULcc_R	umulcc 	%r8, %r9, %r5
	.word 0xc6d21009  ! 485: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r3
	.word 0xafa20929  ! 486: FMULs	fmuls	%f8, %f9, %f23
	.word 0x8c5a0009  ! 487: SMUL_R	smul 	%r8, %r9, %r6
	.word 0xf0ba2bb0  ! 488: STDA_I	stda	%r24, [%r8 + 0x0bb0] %asi
	.word 0x26c20004  ! 489: BRLZ	brlz,a,nt	%8,<label_0x20004>
	.word 0xcada2300  ! 490: LDXA_I	ldxa	[%r8, + 0x0300] %asi, %r5
	.word 0xb9220009  ! 491: MULScc_R	mulscc 	%r8, %r9, %r28
	.word 0x887a238c  ! 492: SDIV_I	sdiv 	%r8, 0x038c, %r4
	.word 0xc8a21009  ! 493: STWA_R	stwa	%r4, [%r8 + %r9] 0x80
	.word 0xc36a251c  ! 494: PREFETCH_I	prefetch	[%r8 + 0x051c], #one_read
	.word 0xce921009  ! 495: LDUHA_R	lduha	[%r8, %r9] 0x80, %r7
	.word 0xd48a1009  ! 496: LDUBA_R	lduba	[%r8, %r9] 0x80, %r10
	.word 0xd8ba1009  ! 497: STDA_R	stda	%r12, [%r8 + %r9] 0x80
	.word 0x1c800004  ! 498: BPOS	bpos  	<label_0x4>
	.word 0xe6b22100  ! 499: STHA_I	stha	%r19, [%r8 + 0x0100] %asi
	.word 0x0e800004  ! 500: BVS	bvs  	<label_0x4>
	.word 0xe4520009  ! 501: LDSH_R	ldsh	[%r8 + %r9], %r18
	.word 0xa67a0009  ! 502: SDIV_R	sdiv 	%r8, %r9, %r19
	.word 0xc80a0009  ! 503: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0x8143c000  ! 504: STBAR	stbar
	.word 0xe85a0009  ! 505: LDX_R	ldx	[%r8 + %r9], %r20
	.word 0x8da209a9  ! 506: FDIVs	fdivs	%f8, %f9, %f6
	.word 0x8143c000  ! 507: STBAR	stbar
	.word 0xf4b22590  ! 508: STHA_I	stha	%r26, [%r8 + 0x0590] %asi
	.word 0x8143c000  ! 509: STBAR	stbar
	.word 0x0cc20004  ! 510: BRGZ	brgz  ,nt	%8,<label_0x20004>
	.word 0xc84a2c70  ! 511: LDSB_I	ldsb	[%r8 + 0x0c70], %r4
	.word 0x866a0009  ! 512: UDIVX_R	udivx 	%r8, %r9, %r3
	.word 0x83a209a9  ! 513: FDIVs	fdivs	%f8, %f9, %f1
	.word 0xc2fa2268  ! 514: SWAPA_I	swapa	%r1, [%r8 + 0x0268] %asi
	.word 0x86f22b38  ! 515: UDIVcc_I	udivcc 	%r8, 0x0b38, %r3
	.word 0x8143c000  ! 516: STBAR	stbar
	.word 0xcc9223b0  ! 517: LDUHA_I	lduha	[%r8, + 0x03b0] %asi, %r6
	.word 0xc3ea25b8  ! 518: PREFETCHA_I	prefetcha	[%r8, + 0x05b8] %asi, #one_read
	.word 0xfd3a0009  ! 519: STDF_R	std	%f30, [%r9, %r8]
	.word 0xd44a0009  ! 520: LDSB_R	ldsb	[%r8 + %r9], %r10
	.word 0x24c20004  ! 521: BRLEZ	brlez,a,nt	%8,<label_0x20004>
	.word 0xd45a25f0  ! 522: LDX_I	ldx	[%r8 + 0x05f0], %r10
	.word 0xd8ba1009  ! 524: STDA_R	stda	%r12, [%r8 + %r9] 0x80
	.word 0x38800004  ! 525: BGU	bgu,a	<label_0x4>
	.word 0xfe120009  ! 527: LDUH_R	lduh	[%r8 + %r9], %r31
	.word 0xe0d21009  ! 528: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r16
	.word 0x8ed20009  ! 529: UMULcc_R	umulcc 	%r8, %r9, %r7
	.word 0xca1220e4  ! 530: LDUH_I	lduh	[%r8 + 0x00e4], %r5
	.word 0xcf3a0009  ! 531: STDF_R	std	%f7, [%r9, %r8]
	.word 0xcbe22009  ! 532: CASA_R	casa	[%r8] %asi, %r9, %r5
	.word 0x86da28b8  ! 533: SMULcc_I	smulcc 	%r8, 0x08b8, %r3
	.word 0xc36a2704  ! 534: PREFETCH_I	prefetch	[%r8 + 0x0704], #one_read
	.word 0x876a0009  ! 535: SDIVX_R	sdivx	%r8, %r9, %r3
	.word 0xdcfa20ac  ! 536: SWAPA_I	swapa	%r14, [%r8 + 0x00ac] %asi
	.word 0xca7a0009  ! 537: SWAP_R	swap	%r5, [%r8 + %r9]
	.word 0xcc6a2180  ! 538: LDSTUB_I	ldstub	%r6, [%r8 + 0x0180]
	.word 0xe5222cd4  ! 541: STF_I	st	%f18, [0x0cd4, %r8]
	.word 0xd7f21009  ! 542: CASXA_I	casxa	[%r8] 0x80, %r9, %r11
	.word 0x8143e010  ! 543: MEMBAR	membar	#Lookaside 
	.word 0x82522e7c  ! 544: UMUL_I	umul 	%r8, 0x0e7c, %r1
	.word 0xc3220009  ! 545: STF_R	st	%f1, [%r9, %r8]
	.word 0x12800004  ! 546: BNE	bne  	<label_0x4>
	.word 0x8a6a24ec  ! 547: UDIVX_I	udivx 	%r8, 0x04ec, %r5
	.word 0x85222ff0  ! 548: MULScc_I	mulscc 	%r8, 0x0ff0, %r2
	.word 0x886a2824  ! 549: UDIVX_I	udivx 	%r8, 0x0824, %r4
	.word 0x82720009  ! 550: UDIV_R	udiv 	%r8, %r9, %r1
	.word 0xc36a2e44  ! 551: PREFETCH_I	prefetch	[%r8 + 0x0e44], #one_read
	.word 0xc8a22e58  ! 552: STWA_I	stwa	%r4, [%r8 + 0x0e58] %asi
	.word 0xf89a2918  ! 554: LDDA_I	ldda	[%r8, + 0x0918] %asi, %r28
	.word 0x10800004  ! 555: BA	ba  	<label_0x4>
	.word 0xfeca2770  ! 556: LDSBA_I	ldsba	[%r8, + 0x0770] %asi, %r31
	.word 0xc49a1009  ! 557: LDDA_R	ldda	[%r8, %r9] 0x80, %r2
	.word 0xc7f22009  ! 558: CASXA_R	casxa	[%r8]%asi, %r9, %r3
	.word 0x845a0009  ! 559: SMUL_R	smul 	%r8, %r9, %r2
	.word 0x0c800004  ! 561: BNEG	bneg  	<label_0x4>
	.word 0xb2da0009  ! 563: SMULcc_R	smulcc 	%r8, %r9, %r25
	.word 0xc85a2630  ! 564: LDX_I	ldx	[%r8 + 0x0630], %r4
	.word 0xe0ba28a0  ! 565: STDA_I	stda	%r16, [%r8 + 0x08a0] %asi
	.word 0x8143e00d  ! 566: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore 
	.word 0xe6020009  ! 567: LDUW_R	lduw	[%r8 + %r9], %r19
	.word 0xc36a24c0  ! 568: PREFETCH_I	prefetch	[%r8 + 0x04c0], #one_read
	.word 0xc8922fa0  ! 569: LDUHA_I	lduha	[%r8, + 0x0fa0] %asi, %r4
	.word 0xeaaa1009  ! 570: STBA_R	stba	%r21, [%r8 + %r9] 0x80
	.word 0x24800008  ! 571: BLE	ble,a	<label_0x8>
	.word 0x8143c000  ! 572: STBAR	stbar
	.word 0xf41a2fd0  ! 574: LDD_I	ldd	[%r8 + 0x0fd0], %r26
	.word 0x06800008  ! 575: BL	bl  	<label_0x8>
	.word 0x8143e04a  ! 576: MEMBAR	membar	#StoreLoad | #StoreStore | #Sync 
	.word 0xbefa0009  ! 577: SDIVcc_R	sdivcc 	%r8, %r9, %r31
	.word 0x82da2218  ! 578: SMULcc_I	smulcc 	%r8, 0x0218, %r1
	.word 0xbda208a9  ! 579: FSUBs	fsubs	%f8, %f9, %f30
	.word 0x04ca0008  ! 580: BRLEZ	brlez  ,pt	%8,<label_0xa0008>
	.word 0xf6020009  ! 581: LDUW_R	lduw	[%r8 + %r9], %r27
	.word 0x8143c000  ! 582: STBAR	stbar
	.word 0xec022448  ! 583: LDUW_I	lduw	[%r8 + 0x0448], %r22
	.word 0x3a800004  ! 584: BCC	bcc,a	<label_0x4>
	.word 0x8143e073  ! 585: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside | #MemIssue | #Sync 
	.word 0x84720009  ! 586: UDIV_R	udiv 	%r8, %r9, %r2
	.word 0xc8520009  ! 587: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xa2f22ae4  ! 588: UDIVcc_I	udivcc 	%r8, 0x0ae4, %r17
	.word 0xe12223cc  ! 589: STF_I	st	%f16, [0x03cc, %r8]
	.word 0xc4b22514  ! 590: STHA_I	stha	%r2, [%r8 + 0x0514] %asi
	.word 0xc28223a0  ! 591: LDUWA_I	lduwa	[%r8, + 0x03a0] %asi, %r1
	.word 0x8ef20009  ! 592: UDIVcc_R	udivcc 	%r8, %r9, %r7
	.word 0x8143e072  ! 593: MEMBAR	membar	#StoreLoad | #Lookaside | #MemIssue | #Sync 
	.word 0x8a4a20e8  ! 594: MULX_I	mulx 	%r8, 0x00e8, %r5
	.word 0xc6ea27c4  ! 595: LDSTUBA_I	ldstuba	%r3, [%r8 + 0x07c4] %asi
	.word 0x04800008  ! 596: BLE	ble  	<label_0x8>
	.word 0xecca2568  ! 597: LDSBA_I	ldsba	[%r8, + 0x0568] %asi, %r22
	.word 0xbba20829  ! 598: FADDs	fadds	%f8, %f9, %f29
	.word 0xc41a2348  ! 599: LDD_I	ldd	[%r8 + 0x0348], %r2
	.word 0xc3e22009  ! 600: CASA_R	casa	[%r8] %asi, %r9, %r1
	.word 0xc6da1009  ! 601: LDXA_R	ldxa	[%r8, %r9] 0x80, %r3
	.word 0xc6f21009  ! 602: STXA_R	stxa	%r3, [%r8 + %r9] 0x80
	.word 0x9f220009  ! 603: MULScc_R	mulscc 	%r8, %r9, %r15
	.word 0xc26a0009  ! 604: LDSTUB_R	ldstub	%r1, [%r8 + %r9]
	.word 0x97a208a9  ! 605: FSUBs	fsubs	%f8, %f9, %f11
	.word 0x8143e02b  ! 606: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #MemIssue 
	.word 0x16800004  ! 607: BGE	bge  	<label_0x4>
	.word 0xc2822cf4  ! 608: LDUWA_I	lduwa	[%r8, + 0x0cf4] %asi, %r1
	.word 0xe46a20e0  ! 609: LDSTUB_I	ldstub	%r18, [%r8 + 0x00e0]
	.word 0x83a20929  ! 610: FMULs	fmuls	%f8, %f9, %f1
	.word 0xc8a22b14  ! 611: STWA_I	stwa	%r4, [%r8 + 0x0b14] %asi
	.word 0xe41a2ae0  ! 612: LDD_I	ldd	[%r8 + 0x0ae0], %r18
	.word 0x87a208a9  ! 613: FSUBs	fsubs	%f8, %f9, %f3
	.word 0xf1f21009  ! 614: CASXA_I	casxa	[%r8] 0x80, %r9, %r24
	.word 0xc3ea28ac  ! 615: PREFETCHA_I	prefetcha	[%r8, + 0x08ac] %asi, #one_read
	.word 0x8da209a9  ! 616: FDIVs	fdivs	%f8, %f9, %f6
	.word 0x846a2ea4  ! 617: UDIVX_I	udivx 	%r8, 0x0ea4, %r2
	.word 0x984a24e4  ! 618: MULX_I	mulx 	%r8, 0x04e4, %r12
	.word 0x2cca0008  ! 620: BRGZ	brgz,a,pt	%8,<label_0xa0008>
	.word 0xc66a2f74  ! 621: LDSTUB_I	ldstub	%r3, [%r8 + 0x0f74]
	.word 0xc8520009  ! 622: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0x8a7a29a0  ! 623: SDIV_I	sdiv 	%r8, 0x09a0, %r5
	.word 0x8143c000  ! 624: STBAR	stbar
	.word 0x8143e018  ! 625: MEMBAR	membar	#StoreStore | #Lookaside 
	.word 0xce4a2fa0  ! 626: LDSB_I	ldsb	[%r8 + 0x0fa0], %r7
	.word 0xc33a0009  ! 627: STDF_R	std	%f1, [%r9, %r8]
	.word 0x88fa0009  ! 628: SDIVcc_R	sdivcc 	%r8, %r9, %r4
	.word 0xcaaa1009  ! 629: STBA_R	stba	%r5, [%r8 + %r9] 0x80
	.word 0x1a800004  ! 630: BCC	bcc  	<label_0x4>
	.word 0xb2720009  ! 631: UDIV_R	udiv 	%r8, %r9, %r25
	.word 0x85220009  ! 632: MULScc_R	mulscc 	%r8, %r9, %r2
	.word 0x88fa0009  ! 633: SDIVcc_R	sdivcc 	%r8, %r9, %r4
	.word 0xf4ba1009  ! 634: STDA_R	stda	%r26, [%r8 + %r9] 0x80
	.word 0xcac22fa0  ! 635: LDSWA_I	ldswa	[%r8, + 0x0fa0] %asi, %r5
	.word 0x8afa0009  ! 636: SDIVcc_R	sdivcc 	%r8, %r9, %r5
	.word 0x3e800008  ! 637: BVC	bvc,a	<label_0x8>
	.word 0xf3e21009  ! 638: CASA_I	casa	[%r8] 0x80, %r9, %r25
	.word 0xc8b22158  ! 639: STHA_I	stha	%r4, [%r8 + 0x0158] %asi
	.word 0xcb220009  ! 640: STF_R	st	%f5, [%r9, %r8]
	.word 0x844a0009  ! 641: MULX_R	mulx 	%r8, %r9, %r2
	.word 0x8143c000  ! 642: STBAR	stbar
	.word 0xeeea1009  ! 643: LDSTUBA_R	ldstuba	%r23, [%r8 + %r9] 0x80
	.word 0xc40a0009  ! 644: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0x28800004  ! 645: BLEU	bleu,a	<label_0x4>
	.word 0x8ba20829  ! 646: FADDs	fadds	%f8, %f9, %f5
	.word 0xcc6a0009  ! 647: LDSTUB_R	ldstub	%r6, [%r8 + %r9]
	.word 0x8143c000  ! 648: STBAR	stbar
	.word 0xb5a208a9  ! 649: FSUBs	fsubs	%f8, %f9, %f26
	.word 0x8143c000  ! 650: STBAR	stbar
	.word 0xbf222f4c  ! 651: MULScc_I	mulscc 	%r8, 0x0f4c, %r31
	.word 0xb0f20009  ! 652: UDIVcc_R	udivcc 	%r8, %r9, %r24
	.word 0xc2da1009  ! 653: LDXA_R	ldxa	[%r8, %r9] 0x80, %r1
	.word 0xc36a238c  ! 654: PREFETCH_I	prefetch	[%r8 + 0x038c], #one_read
	.word 0x8143c000  ! 655: STBAR	stbar
	.word 0xf4120009  ! 656: LDUH_R	lduh	[%r8 + %r9], %r26
	.word 0xc4ba2a10  ! 657: STDA_I	stda	%r2, [%r8 + 0x0a10] %asi
	.word 0xca422dec  ! 658: LDSW_I	ldsw	[%r8 + 0x0dec], %r5
	.word 0x0aca0008  ! 659: BRNZ	brnz  ,pt	%8,<label_0xa0008>
	.word 0xcad21009  ! 660: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r5
	.word 0xe89a25f0  ! 661: LDDA_I	ldda	[%r8, + 0x05f0] %asi, %r20
	.word 0xc88a1009  ! 663: LDUBA_R	lduba	[%r8, %r9] 0x80, %r4
	.word 0xc4aa2560  ! 665: STBA_I	stba	%r2, [%r8 + 0x0560] %asi
	.word 0xcca22f9c  ! 666: STWA_I	stwa	%r6, [%r8 + 0x0f9c] %asi
	.word 0x8143c000  ! 667: STBAR	stbar
	.word 0xc8922b40  ! 668: LDUHA_I	lduha	[%r8, + 0x0b40] %asi, %r4
	.word 0xc36a23d8  ! 669: PREFETCH_I	prefetch	[%r8 + 0x03d8], #one_read
	.word 0xceea22e0  ! 670: LDSTUBA_I	ldstuba	%r7, [%r8 + 0x02e0] %asi
	.word 0xc7f21009  ! 671: CASXA_I	casxa	[%r8] 0x80, %r9, %r3
	.word 0x985a0009  ! 672: SMUL_R	smul 	%r8, %r9, %r12
	.word 0x8143e052  ! 673: MEMBAR	membar	#StoreLoad | #Lookaside | #Sync 
	.word 0x8afa2798  ! 675: SDIVcc_I	sdivcc 	%r8, 0x0798, %r5
	.word 0xc65a2ce8  ! 676: LDX_I	ldx	[%r8 + 0x0ce8], %r3
	.word 0xc9e22009  ! 677: CASA_R	casa	[%r8] %asi, %r9, %r4
	.word 0xeea229f0  ! 678: STWA_I	stwa	%r23, [%r8 + 0x09f0] %asi
	.word 0x827a2d38  ! 679: SDIV_I	sdiv 	%r8, 0x0d38, %r1
	.word 0x88fa2a44  ! 680: SDIVcc_I	sdivcc 	%r8, 0x0a44, %r4
	.word 0x26800008  ! 681: BL	bl,a	<label_0x8>
	.word 0x8143e003  ! 682: MEMBAR	membar	#LoadLoad | #StoreLoad 
	.word 0x16800004  ! 683: BGE	bge  	<label_0x4>
	.word 0x87a20929  ! 684: FMULs	fmuls	%f8, %f9, %f3
	.word 0x8ba20829  ! 685: FADDs	fadds	%f8, %f9, %f5
	.word 0xb4f20009  ! 686: UDIVcc_R	udivcc 	%r8, %r9, %r26
	.word 0x947221f0  ! 687: UDIV_I	udiv 	%r8, 0x01f0, %r10
	.word 0xc3ea2034  ! 688: PREFETCHA_I	prefetcha	[%r8, + 0x0034] %asi, #one_read
	.word 0xc2822ab4  ! 689: LDUWA_I	lduwa	[%r8, + 0x0ab4] %asi, %r1
	.word 0xf81a0009  ! 690: LDD_R	ldd	[%r8 + %r9], %r28
	.word 0x8143c000  ! 691: STBAR	stbar
	.word 0x9e7a2734  ! 692: SDIV_I	sdiv 	%r8, 0x0734, %r15
	.word 0x8143e020  ! 693: MEMBAR	membar	#MemIssue 
	.word 0xc8a21009  ! 694: STWA_R	stwa	%r4, [%r8 + %r9] 0x80
	.word 0x9a6a2f4c  ! 695: UDIVX_I	udivx 	%r8, 0x0f4c, %r13
	.word 0x8cfa2cf8  ! 696: SDIVcc_I	sdivcc 	%r8, 0x0cf8, %r6
	.word 0x22c20004  ! 697: BRZ	brz,a,nt	%8,<label_0x20004>
	.word 0xc2fa28ac  ! 698: SWAPA_I	swapa	%r1, [%r8 + 0x08ac] %asi
	.word 0xc2a21009  ! 699: STWA_R	stwa	%r1, [%r8 + %r9] 0x80
	.word 0xc3ea2274  ! 700: PREFETCHA_I	prefetcha	[%r8, + 0x0274] %asi, #one_read
	.word 0x8143c000  ! 701: STBAR	stbar
	.word 0x8143c000  ! 702: STBAR	stbar
	.word 0x8a5a275c  ! 703: SMUL_I	smul 	%r8, 0x075c, %r5
	.word 0xc6fa2890  ! 704: SWAPA_I	swapa	%r3, [%r8 + 0x0890] %asi
	.word 0x04800004  ! 705: BLE	ble  	<label_0x4>
	.word 0x8143e02a  ! 706: MEMBAR	membar	#StoreLoad | #StoreStore | #MemIssue 
	.word 0xc67a2efc  ! 707: SWAP_I	swap	%r3, [%r8 + 0x0efc]
	.word 0x34800004  ! 708: BG	bg,a	<label_0x4>
	.word 0x82d20009  ! 709: UMULcc_R	umulcc 	%r8, %r9, %r1
	.word 0x846a0009  ! 710: UDIVX_R	udivx 	%r8, %r9, %r2
	.word 0xf87a0009  ! 711: SWAP_R	swap	%r28, [%r8 + %r9]
	.word 0xc86a2e04  ! 712: LDSTUB_I	ldstub	%r4, [%r8 + 0x0e04]
	.word 0xb25a0009  ! 713: SMUL_R	smul 	%r8, %r9, %r25
	.word 0xfeea2740  ! 714: LDSTUBA_I	ldstuba	%r31, [%r8 + 0x0740] %asi
	.word 0xbe720009  ! 715: UDIV_R	udiv 	%r8, %r9, %r31
	.word 0x83a20829  ! 716: FADDs	fadds	%f8, %f9, %f1
	.word 0xca6a272c  ! 717: LDSTUB_I	ldstub	%r5, [%r8 + 0x072c]
	.word 0x8143c000  ! 718: STBAR	stbar
	.word 0xc3ea291c  ! 719: PREFETCHA_I	prefetcha	[%r8, + 0x091c] %asi, #one_read
	.word 0x04ca0008  ! 720: BRLEZ	brlez  ,pt	%8,<label_0xa0008>
	.word 0xcf3a0009  ! 721: STDF_R	std	%f7, [%r9, %r8]
	.word 0xecba2950  ! 722: STDA_I	stda	%r22, [%r8 + 0x0950] %asi
	.word 0x86722720  ! 723: UDIV_I	udiv 	%r8, 0x0720, %r3
	.word 0xe2aa1009  ! 726: STBA_R	stba	%r17, [%r8 + %r9] 0x80
	.word 0xc53a2760  ! 729: STDF_I	std	%f2, [0x0760, %r8]
	.word 0xc53a0009  ! 730: STDF_R	std	%f2, [%r9, %r8]
	.word 0xccaa1009  ! 731: STBA_R	stba	%r6, [%r8 + %r9] 0x80
	.word 0x8fa209a9  ! 732: FDIVs	fdivs	%f8, %f9, %f7
	.word 0xdde21009  ! 733: CASA_I	casa	[%r8] 0x80, %r9, %r14
	.word 0x83a208a9  ! 734: FSUBs	fsubs	%f8, %f9, %f1
	.word 0x99a209a9  ! 735: FDIVs	fdivs	%f8, %f9, %f12
	.word 0xcaa22e64  ! 736: STWA_I	stwa	%r5, [%r8 + 0x0e64] %asi
	.word 0xccaa2700  ! 737: STBA_I	stba	%r6, [%r8 + 0x0700] %asi
	.word 0xf7220009  ! 738: STF_R	st	%f27, [%r9, %r8]
	.word 0x2aca0004  ! 739: BRNZ	brnz,a,pt	%8,<label_0xa0004>
	.word 0x8c522a08  ! 740: UMUL_I	umul 	%r8, 0x0a08, %r6
	.word 0xcb2221f4  ! 741: STF_I	st	%f5, [0x01f4, %r8]
	.word 0xc2fa2f1c  ! 742: SWAPA_I	swapa	%r1, [%r8 + 0x0f1c] %asi
	.word 0x24800008  ! 743: BLE	ble,a	<label_0x8>
	.word 0xaaf20009  ! 744: UDIVcc_R	udivcc 	%r8, %r9, %r21
	.word 0xeed227e8  ! 745: LDSHA_I	ldsha	[%r8, + 0x07e8] %asi, %r23
	.word 0xd8da2138  ! 746: LDXA_I	ldxa	[%r8, + 0x0138] %asi, %r12
	.word 0xc3ea2a9c  ! 747: PREFETCHA_I	prefetcha	[%r8, + 0x0a9c] %asi, #one_read
	.word 0xe0fa1009  ! 748: SWAPA_R	swapa	%r16, [%r8 + %r9] 0x80
	.word 0x88fa0009  ! 749: SDIVcc_R	sdivcc 	%r8, %r9, %r4
	.word 0xc2a2204c  ! 750: STWA_I	stwa	%r1, [%r8 + 0x004c] %asi
	.word 0xceda2aa0  ! 751: LDXA_I	ldxa	[%r8, + 0x0aa0] %asi, %r7
	.word 0xcefa234c  ! 752: SWAPA_I	swapa	%r7, [%r8 + 0x034c] %asi
	.word 0x40000008  ! 754: CALL	call	disp30_8
	.word 0x85a208a9  ! 755: FSUBs	fsubs	%f8, %f9, %f2
	.word 0xdaaa2534  ! 756: STBA_I	stba	%r13, [%r8 + 0x0534] %asi
	.word 0x00800008  ! 757: BN	bn  	<label_0x8>
	.word 0x22ca0004  ! 759: BRZ	brz,a,pt	%8,<label_0xa0004>
	.word 0xdcb2210c  ! 760: STHA_I	stha	%r14, [%r8 + 0x010c] %asi
	.word 0xc41a0009  ! 761: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x8c4a282c  ! 762: MULX_I	mulx 	%r8, 0x082c, %r6
	.word 0x9a7a2f48  ! 763: SDIV_I	sdiv 	%r8, 0x0f48, %r13
	.word 0xfeea2408  ! 764: LDSTUBA_I	ldstuba	%r31, [%r8 + 0x0408] %asi
	.word 0x87a208a9  ! 765: FSUBs	fsubs	%f8, %f9, %f3
	.word 0x06c20008  ! 766: BRLZ	brlz  ,nt	%8,<label_0x20008>
	.word 0xeeaa2598  ! 767: STBA_I	stba	%r23, [%r8 + 0x0598] %asi
	.word 0x845a21b4  ! 768: SMUL_I	smul 	%r8, 0x01b4, %r2
	.word 0x8143c000  ! 769: STBAR	stbar
	.word 0xc2d21009  ! 770: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r1
	.word 0x8fa208a9  ! 771: FSUBs	fsubs	%f8, %f9, %f7
	.word 0xe2c21009  ! 772: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r17
	.word 0x85a208a9  ! 773: FSUBs	fsubs	%f8, %f9, %f2
	.word 0xeafa2060  ! 774: SWAPA_I	swapa	%r21, [%r8 + 0x0060] %asi
	.word 0x28800008  ! 775: BLEU	bleu,a	<label_0x8>
	.word 0xf48a1009  ! 776: LDUBA_R	lduba	[%r8, %r9] 0x80, %r26
	.word 0x3e800004  ! 777: BVC	bvc,a	<label_0x4>
	.word 0xc66a0009  ! 778: LDSTUB_R	ldstub	%r3, [%r8 + %r9]
	.word 0x1a800008  ! 779: BCC	bcc  	<label_0x8>
	.word 0x1c800004  ! 780: BPOS	bpos  	<label_0x4>
	.word 0xc46a2c20  ! 781: LDSTUB_I	ldstub	%r2, [%r8 + 0x0c20]
	.word 0x2ac20004  ! 782: BRNZ	brnz,a,nt	%8,<label_0x20004>
	.word 0x9cda201c  ! 783: SMULcc_I	smulcc 	%r8, 0x001c, %r14
	.word 0x83a20829  ! 784: FADDs	fadds	%f8, %f9, %f1
	.word 0xb44a0009  ! 785: MULX_R	mulx 	%r8, %r9, %r26
	.word 0xfab21009  ! 786: STHA_R	stha	%r29, [%r8 + %r9] 0x80
	.word 0x8143e068  ! 787: MEMBAR	membar	#StoreStore | #MemIssue | #Sync 
	.word 0xf8122090  ! 788: LDUH_I	lduh	[%r8 + 0x0090], %r28
	.word 0xcfe22009  ! 789: CASA_R	casa	[%r8] %asi, %r9, %r7
	.word 0xccaa26c0  ! 790: STBA_I	stba	%r6, [%r8 + 0x06c0] %asi
	.word 0xccf22380  ! 791: STXA_I	stxa	%r6, [%r8 + 0x0380] %asi
	.word 0xc47a2e04  ! 792: SWAP_I	swap	%r2, [%r8 + 0x0e04]
	.word 0x8a7a2348  ! 793: SDIV_I	sdiv 	%r8, 0x0348, %r5
	.word 0x896a0009  ! 794: SDIVX_R	sdivx	%r8, %r9, %r4
	.word 0xfcba1009  ! 795: STDA_R	stda	%r30, [%r8 + %r9] 0x80
	.word 0xc3ea2f28  ! 796: PREFETCHA_I	prefetcha	[%r8, + 0x0f28] %asi, #one_read
	.word 0xb47a0009  ! 797: SDIV_R	sdiv 	%r8, %r9, %r26
	.word 0x8143c000  ! 798: STBAR	stbar
	.word 0xc6fa28c8  ! 799: SWAPA_I	swapa	%r3, [%r8 + 0x08c8] %asi
	.word 0xc8020009  ! 800: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xada20929  ! 801: FMULs	fmuls	%f8, %f9, %f22
	.word 0x9c6a0009  ! 802: UDIVX_R	udivx 	%r8, %r9, %r14
	.word 0xc3f21009  ! 803: CASXA_I	casxa	[%r8] 0x80, %r9, %r1
	.word 0x26c20008  ! 804: BRLZ	brlz,a,nt	%8,<label_0x20008>
	.word 0x876a2f60  ! 805: SDIVX_I	sdivx	%r8, 0x0f60, %r3
	.word 0x32800004  ! 806: BNE	bne,a	<label_0x4>
	.word 0x8d220009  ! 807: MULScc_R	mulscc 	%r8, %r9, %r6
	.word 0xc3ea2ad4  ! 808: PREFETCHA_I	prefetcha	[%r8, + 0x0ad4] %asi, #one_read
	.word 0xc4ba25e0  ! 809: STDA_I	stda	%r2, [%r8 + 0x05e0] %asi
	.word 0x9fa20829  ! 810: FADDs	fadds	%f8, %f9, %f15
	.word 0x8e5a24a0  ! 811: SMUL_I	smul 	%r8, 0x04a0, %r7
	.word 0xe0fa2630  ! 812: SWAPA_I	swapa	%r16, [%r8 + 0x0630] %asi
	.word 0x847a2d38  ! 813: SDIV_I	sdiv 	%r8, 0x0d38, %r2
	.word 0xcec21009  ! 814: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r7
	.word 0xdc1a0009  ! 815: LDD_R	ldd	[%r8 + %r9], %r14
	.word 0xc8d222d0  ! 816: LDSHA_I	ldsha	[%r8, + 0x02d0] %asi, %r4
	.word 0xe20a21cc  ! 818: LDUB_I	ldub	[%r8 + 0x01cc], %r17
	.word 0x8ba20829  ! 819: FADDs	fadds	%f8, %f9, %f5
	.word 0x8ada0009  ! 820: SMULcc_R	smulcc 	%r8, %r9, %r5
	.word 0x8143c000  ! 821: STBAR	stbar
	.word 0xca821009  ! 822: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r5
	.word 0xeed21009  ! 823: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r23
	.word 0xcab220bc  ! 824: STHA_I	stha	%r5, [%r8 + 0x00bc] %asi
	.word 0x82d20009  ! 825: UMULcc_R	umulcc 	%r8, %r9, %r1
	.word 0xc53a0009  ! 826: STDF_R	std	%f2, [%r9, %r8]
	.word 0xbe7a0009  ! 827: SDIV_R	sdiv 	%r8, %r9, %r31
	.word 0xd67a0009  ! 828: SWAP_R	swap	%r11, [%r8 + %r9]
	.word 0xc60a0009  ! 829: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xa65a0009  ! 830: SMUL_R	smul 	%r8, %r9, %r19
	.word 0x88da0009  ! 831: SMULcc_R	smulcc 	%r8, %r9, %r4
	.word 0xe87a2f34  ! 832: SWAP_I	swap	%r20, [%r8 + 0x0f34]
	.word 0xc73a2830  ! 833: STDF_I	std	%f3, [0x0830, %r8]
	.word 0xd4ba2b58  ! 834: STDA_I	stda	%r10, [%r8 + 0x0b58] %asi
	.word 0xc36a2be8  ! 835: PREFETCH_I	prefetch	[%r8 + 0x0be8], #one_read
	.word 0xceaa1009  ! 838: STBA_R	stba	%r7, [%r8 + %r9] 0x80
	.word 0xf07a0009  ! 840: SWAP_R	swap	%r24, [%r8 + %r9]
	.word 0xceda1009  ! 841: LDXA_R	ldxa	[%r8, %r9] 0x80, %r7
	.word 0x14800004  ! 842: BG	bg  	<label_0x4>
	.word 0xccfa2c50  ! 843: SWAPA_I	swapa	%r6, [%r8 + 0x0c50] %asi
	.word 0x8143e07c  ! 844: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xc2ea1009  ! 847: LDSTUBA_R	ldstuba	%r1, [%r8 + %r9] 0x80
	.word 0xfcb21009  ! 848: STHA_R	stha	%r30, [%r8 + %r9] 0x80
	.word 0xe4ba1009  ! 849: STDA_R	stda	%r18, [%r8 + %r9] 0x80
	.word 0x82720009  ! 850: UDIV_R	udiv 	%r8, %r9, %r1
	.word 0x8143c000  ! 851: STBAR	stbar
	.word 0x8143c000  ! 852: STBAR	stbar
	.word 0xc36a228c  ! 853: PREFETCH_I	prefetch	[%r8 + 0x028c], #one_read
	.word 0xcbe22009  ! 854: CASA_R	casa	[%r8] %asi, %r9, %r5
	.word 0x8cd20009  ! 856: UMULcc_R	umulcc 	%r8, %r9, %r6
	.word 0xbba20929  ! 857: FMULs	fmuls	%f8, %f9, %f29
	.word 0xb25220d8  ! 858: UMUL_I	umul 	%r8, 0x00d8, %r25
	.word 0xa5a20929  ! 859: FMULs	fmuls	%f8, %f9, %f18
	.word 0x8143e04a  ! 860: MEMBAR	membar	#StoreLoad | #StoreStore | #Sync 
	.word 0x84fa2bb8  ! 861: SDIVcc_I	sdivcc 	%r8, 0x0bb8, %r2
	.word 0xc73a2708  ! 862: STDF_I	std	%f3, [0x0708, %r8]
	.word 0xc4f21009  ! 863: STXA_R	stxa	%r2, [%r8 + %r9] 0x80
	.word 0x8c7a292c  ! 864: SDIV_I	sdiv 	%r8, 0x092c, %r6
	.word 0x87a20929  ! 865: FMULs	fmuls	%f8, %f9, %f3
	.word 0xa052237c  ! 866: UMUL_I	umul 	%r8, 0x037c, %r16
	.word 0x86da0009  ! 867: SMULcc_R	smulcc 	%r8, %r9, %r3
	.word 0xc36a20bc  ! 868: PREFETCH_I	prefetch	[%r8 + 0x00bc], #one_read
	.word 0xce02217c  ! 869: LDUW_I	lduw	[%r8 + 0x017c], %r7
	.word 0xa26a0009  ! 870: UDIVX_R	udivx 	%r8, %r9, %r17
	.word 0x8a7a2768  ! 871: SDIV_I	sdiv 	%r8, 0x0768, %r5
	.word 0x8143e013  ! 872: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside 
	.word 0xc41a2100  ! 873: LDD_I	ldd	[%r8 + 0x0100], %r2
	.word 0xc4aa1009  ! 875: STBA_R	stba	%r2, [%r8 + %r9] 0x80
	.word 0x2cca0004  ! 876: BRGZ	brgz,a,pt	%8,<label_0xa0004>
	.word 0xc60a0009  ! 877: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xa56a23b4  ! 878: SDIVX_I	sdivx	%r8, 0x03b4, %r18
	.word 0x8ba208a9  ! 879: FSUBs	fsubs	%f8, %f9, %f5
	.word 0xc66a0009  ! 881: LDSTUB_R	ldstub	%r3, [%r8 + %r9]
	.word 0x84d20009  ! 882: UMULcc_R	umulcc 	%r8, %r9, %r2
	.word 0xcea21009  ! 883: STWA_R	stwa	%r7, [%r8 + %r9] 0x80
	.word 0x10800004  ! 884: BA	ba  	<label_0x4>
	.word 0xf2ca2fbc  ! 885: LDSBA_I	ldsba	[%r8, + 0x0fbc] %asi, %r25
	.word 0x87a209a9  ! 886: FDIVs	fdivs	%f8, %f9, %f3
	.word 0x8143c000  ! 887: STBAR	stbar
	.word 0xcef21009  ! 888: STXA_R	stxa	%r7, [%r8 + %r9] 0x80
	.word 0x846a2d0c  ! 889: UDIVX_I	udivx 	%r8, 0x0d0c, %r2
	.word 0xf4420009  ! 890: LDSW_R	ldsw	[%r8 + %r9], %r26
	.word 0x32800004  ! 891: BNE	bne,a	<label_0x4>
	.word 0xe4ba22a8  ! 892: STDA_I	stda	%r18, [%r8 + 0x02a8] %asi
	.word 0xc86a20e0  ! 893: LDSTUB_I	ldstub	%r4, [%r8 + 0x00e0]
	.word 0x984a0009  ! 894: MULX_R	mulx 	%r8, %r9, %r12
	.word 0xdcaa24a4  ! 895: STBA_I	stba	%r14, [%r8 + 0x04a4] %asi
	.word 0xce4a2b74  ! 896: LDSB_I	ldsb	[%r8 + 0x0b74], %r7
	.word 0xc7222168  ! 897: STF_I	st	%f3, [0x0168, %r8]
	.word 0xfe8a1009  ! 898: LDUBA_R	lduba	[%r8, %r9] 0x80, %r31
	.word 0xdcfa2b68  ! 899: SWAPA_I	swapa	%r14, [%r8 + 0x0b68] %asi
	.word 0xc36a21c0  ! 900: PREFETCH_I	prefetch	[%r8 + 0x01c0], #one_read
	.word 0xb8fa0009  ! 902: SDIVcc_R	sdivcc 	%r8, %r9, %r28
	.word 0x8143c000  ! 903: STBAR	stbar
	.word 0x8d6a0009  ! 904: SDIVX_R	sdivx	%r8, %r9, %r6
	.word 0xa0d22998  ! 905: UMULcc_I	umulcc 	%r8, 0x0998, %r16
	.word 0xe5e22009  ! 907: CASA_R	casa	[%r8] %asi, %r9, %r18
	.word 0x8143c000  ! 908: STBAR	stbar
	.word 0xf6a21009  ! 909: STWA_R	stwa	%r27, [%r8 + %r9] 0x80
	.word 0xc2ea1009  ! 911: LDSTUBA_R	ldstuba	%r1, [%r8 + %r9] 0x80
	.word 0xf8fa1009  ! 912: SWAPA_R	swapa	%r28, [%r8 + %r9] 0x80
	.word 0x40000004  ! 913: CALL	call	disp30_4
	.word 0x8cfa0009  ! 914: SDIVcc_R	sdivcc 	%r8, %r9, %r6
	.word 0xce5a2810  ! 915: LDX_I	ldx	[%r8 + 0x0810], %r7
	.word 0x8ba209a9  ! 916: FDIVs	fdivs	%f8, %f9, %f5
	.word 0xc9f22009  ! 917: CASXA_R	casxa	[%r8]%asi, %r9, %r4
	.word 0xe6da1009  ! 918: LDXA_R	ldxa	[%r8, %r9] 0x80, %r19
	.word 0xc3ea2edc  ! 919: PREFETCHA_I	prefetcha	[%r8, + 0x0edc] %asi, #one_read
	.word 0x2ac20004  ! 920: BRNZ	brnz,a,nt	%8,<label_0x20004>
	.word 0xc64a0009  ! 921: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xc41a0009  ! 922: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x08800004  ! 923: BLEU	bleu  	<label_0x4>
	.word 0xcbe21009  ! 924: CASA_I	casa	[%r8] 0x80, %r9, %r5
	.word 0xe4522aa4  ! 925: LDSH_I	ldsh	[%r8 + 0x0aa4], %r18
	.word 0x40000004  ! 926: CALL	call	disp30_4
	.word 0x8e7a2d04  ! 927: SDIV_I	sdiv 	%r8, 0x0d04, %r7
	.word 0x8a520009  ! 928: UMUL_R	umul 	%r8, %r9, %r5
	.word 0xc2fa1009  ! 929: SWAPA_R	swapa	%r1, [%r8 + %r9] 0x80
	.word 0x8143e01c  ! 930: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside 
	.word 0xc7220009  ! 931: STF_R	st	%f3, [%r9, %r8]
	.word 0x8d220009  ! 932: MULScc_R	mulscc 	%r8, %r9, %r6
	.word 0xc4aa2780  ! 933: STBA_I	stba	%r2, [%r8 + 0x0780] %asi
	.word 0xc36a25a0  ! 934: PREFETCH_I	prefetch	[%r8 + 0x05a0], #one_read
	.word 0xe80a2670  ! 935: LDUB_I	ldub	[%r8 + 0x0670], %r20
	.word 0x9a7a0009  ! 936: SDIV_R	sdiv 	%r8, %r9, %r13
	.word 0x86fa0009  ! 937: SDIVcc_R	sdivcc 	%r8, %r9, %r3
	.word 0xc4ba2670  ! 938: STDA_I	stda	%r2, [%r8 + 0x0670] %asi
	.word 0xb1a209a9  ! 939: FDIVs	fdivs	%f8, %f9, %f24
	.word 0x85a20829  ! 940: FADDs	fadds	%f8, %f9, %f2
	.word 0xa4fa24f0  ! 941: SDIVcc_I	sdivcc 	%r8, 0x04f0, %r18
	.word 0x00800008  ! 942: BN	bn  	<label_0x8>
	.word 0xb16a23f0  ! 943: SDIVX_I	sdivx	%r8, 0x03f0, %r24
	.word 0xa46a0009  ! 944: UDIVX_R	udivx 	%r8, %r9, %r18
	.word 0xca0a0009  ! 946: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0x8143e06e  ! 947: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #MemIssue | #Sync 
	.word 0xc3e21009  ! 948: CASA_I	casa	[%r8] 0x80, %r9, %r1
	.word 0xc53a2190  ! 949: STDF_I	std	%f2, [0x0190, %r8]
	.word 0xc7220009  ! 950: STF_R	st	%f3, [%r9, %r8]
	.word 0x8a720009  ! 951: UDIV_R	udiv 	%r8, %r9, %r5
	.word 0xccba1009  ! 952: STDA_R	stda	%r6, [%r8 + %r9] 0x80
	.word 0xc36a260c  ! 953: PREFETCH_I	prefetch	[%r8 + 0x060c], #one_read
	.word 0xcab227b4  ! 954: STHA_I	stha	%r5, [%r8 + 0x07b4] %asi
	.word 0x8143c000  ! 955: STBAR	stbar
	.word 0x8143c000  ! 956: STBAR	stbar
	.word 0xca7a2280  ! 957: SWAP_I	swap	%r5, [%r8 + 0x0280]
	.word 0x1c800008  ! 958: BPOS	bpos  	<label_0x8>
	.word 0xc6fa21e4  ! 962: SWAPA_I	swapa	%r3, [%r8 + 0x01e4] %asi
	.word 0xafa20929  ! 963: FMULs	fmuls	%f8, %f9, %f23
	.word 0xf2aa1009  ! 964: STBA_R	stba	%r25, [%r8 + %r9] 0x80
	.word 0xa0f20009  ! 965: UDIVcc_R	udivcc 	%r8, %r9, %r16
	.word 0x88da0009  ! 966: SMULcc_R	smulcc 	%r8, %r9, %r4
	.word 0x12800008  ! 967: BNE	bne  	<label_0x8>
	.word 0x864a2c18  ! 968: MULX_I	mulx 	%r8, 0x0c18, %r3
	.word 0x9ef20009  ! 969: UDIVcc_R	udivcc 	%r8, %r9, %r15
	.word 0xc36a291c  ! 970: PREFETCH_I	prefetch	[%r8 + 0x091c], #one_read
	.word 0xc6fa2abc  ! 972: SWAPA_I	swapa	%r3, [%r8 + 0x0abc] %asi
	.word 0xfeaa1009  ! 973: STBA_R	stba	%r31, [%r8 + %r9] 0x80
	.word 0xe322241c  ! 974: STF_I	st	%f17, [0x041c, %r8]
	.word 0xc4122cf8  ! 975: LDUH_I	lduh	[%r8 + 0x0cf8], %r2
	.word 0xc6ca1009  ! 976: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r3
	.word 0xc80a0009  ! 977: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0x87a20929  ! 978: FMULs	fmuls	%f8, %f9, %f3
	.word 0xeb3a0009  ! 979: STDF_R	std	%f21, [%r9, %r8]
	.word 0x30800008  ! 980: BA	ba,a	<label_0x8>
	.word 0xd81a2ce8  ! 981: LDD_I	ldd	[%r8 + 0x0ce8], %r12
	.word 0xb24a0009  ! 983: MULX_R	mulx 	%r8, %r9, %r25
	.word 0x8143e058  ! 984: MEMBAR	membar	#StoreStore | #Lookaside | #Sync 
	.word 0xca120009  ! 985: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xc49a1009  ! 986: LDDA_R	ldda	[%r8, %r9] 0x80, %r2
	.word 0xce5220c0  ! 987: LDSH_I	ldsh	[%r8 + 0x00c0], %r7
	.word 0x886a2e40  ! 988: UDIVX_I	udivx 	%r8, 0x0e40, %r4
	.word 0xc7220009  ! 989: STF_R	st	%f3, [%r9, %r8]
	.word 0x02c20008  ! 990: BRZ	brz  ,nt	%8,<label_0x20008>
	.word 0xcc022674  ! 991: LDUW_I	lduw	[%r8 + 0x0674], %r6
	.word 0xfb22291c  ! 992: STF_I	st	%f29, [0x091c, %r8]
	.word 0x8143e052  ! 993: MEMBAR	membar	#StoreLoad | #Lookaside | #Sync 
	.word 0xc36a259c  ! 994: PREFETCH_I	prefetch	[%r8 + 0x059c], #one_read
	.word 0xc8a21009  ! 996: STWA_R	stwa	%r4, [%r8 + %r9] 0x80
	.word 0x8143e02a  ! 997: MEMBAR	membar	#StoreLoad | #StoreStore | #MemIssue 
	.word 0x865a0009  ! 998: SMUL_R	smul 	%r8, %r9, %r3
	.word 0x8cf228d4  ! 999: UDIVcc_I	udivcc 	%r8, 0x08d4, %r6
        ta      T_GOOD_TRAP

th_main_1:
        setx  MAIN_BASE_DATA_VA, %r1, %r8
        setx  0x00000000000006a0, %g1, %r9
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
        setx  0x57bd5e2d77cb3910, %g1, %r0
        setx  0xf4d04b57fba85c92, %g1, %r1
        setx  0xa1189ae11f358797, %g1, %r2
        setx  0x32ef937c5c014dc0, %g1, %r3
        setx  0x737c4ca4a7b85d36, %g1, %r4
        setx  0x2dd1e5db8281edc8, %g1, %r5
        setx  0x911ac1f27c1ad166, %g1, %r6
        setx  0xb8502d32f1a91c9d, %g1, %r7
        setx  0xd9dd35096de22c17, %g1, %r10
        setx  0x777263baaf94361f, %g1, %r11
        setx  0x76a93392f93f3fef, %g1, %r12
        setx  0x69e31103fe10e37d, %g1, %r13
        setx  0x39b1ecc49b87167d, %g1, %r14
        setx  0xa02dc567b149b19b, %g1, %r15
        setx  0x3e34619a5b92d1bd, %g1, %r16
        setx  0x875adcb60d95992a, %g1, %r17
        setx  0xc9791ad063ca7704, %g1, %r18
        setx  0x3242d15aabd6f6ca, %g1, %r19
        setx  0xf7fa47cdc6613d50, %g1, %r20
        setx  0x3fb2a00a2e182e5d, %g1, %r21
        setx  0x26489dfd861c8359, %g1, %r22
        setx  0xff02777d0f8a6fef, %g1, %r23
        setx  0x1bf2bd37542a8120, %g1, %r24
        setx  0xb6d3ce4a7c8d109f, %g1, %r25
        setx  0x248a6f2b03a57bdc, %g1, %r26
        setx  0x3940d463c08e97de, %g1, %r27
        setx  0x019201c03d4da772, %g1, %r28
        setx  0xbb0b8615616c30cc, %g1, %r29
        setx  0x20f9ea61f99beaab, %g1, %r30
        setx  0xebfe94900fe5ff51, %g1, %r31
	.word 0x996a0009  ! 6: SDIVX_R	sdivx	%r8, %r9, %r12
	.word 0x87a20929  ! 7: FMULs	fmuls	%f8, %f9, %f3
	.word 0xc67a0009  ! 8: SWAP_R	swap	%r3, [%r8 + %r9]
	.word 0xa0d22468  ! 9: UMULcc_I	umulcc 	%r8, 0x0468, %r16
	.word 0xc73a21f0  ! 10: STDF_I	std	%f3, [0x01f0, %r8]
	.word 0xc4d21009  ! 11: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r2
	.word 0x836a2bf0  ! 12: SDIVX_I	sdivx	%r8, 0x0bf0, %r1
	.word 0x94720009  ! 13: UDIV_R	udiv 	%r8, %r9, %r10
	.word 0x824a0009  ! 14: MULX_R	mulx 	%r8, %r9, %r1
	.word 0xfaa21009  ! 15: STWA_R	stwa	%r29, [%r8 + %r9] 0x80
	.word 0x2a800004  ! 16: BCS	bcs,a	<label_0x4>
	.word 0x9da209a9  ! 17: FDIVs	fdivs	%f8, %f9, %f14
	.word 0xc4f22470  ! 18: STXA_I	stxa	%r2, [%r8 + 0x0470] %asi
	.word 0x8143e043  ! 19: MEMBAR	membar	#LoadLoad | #StoreLoad | #Sync 
	.word 0xc3ea2f2c  ! 20: PREFETCHA_I	prefetcha	[%r8, + 0x0f2c] %asi, #one_read
	.word 0x85a208a9  ! 21: FSUBs	fsubs	%f8, %f9, %f2
	.word 0xf8ba1009  ! 22: STDA_R	stda	%r28, [%r8 + %r9] 0x80
	.word 0xc44a21b0  ! 23: LDSB_I	ldsb	[%r8 + 0x01b0], %r2
	.word 0xd4aa2f60  ! 24: STBA_I	stba	%r10, [%r8 + 0x0f60] %asi
	.word 0xa96a2e28  ! 25: SDIVX_I	sdivx	%r8, 0x0e28, %r20
	.word 0xc8122104  ! 26: LDUH_I	lduh	[%r8 + 0x0104], %r4
	.word 0x8cfa0009  ! 27: SDIVcc_R	sdivcc 	%r8, %r9, %r6
	.word 0x36800004  ! 28: BGE	bge,a	<label_0x4>
	.word 0x06800008  ! 29: BL	bl  	<label_0x8>
	.word 0xd88221dc  ! 30: LDUWA_I	lduwa	[%r8, + 0x01dc] %asi, %r12
	.word 0x20800008  ! 31: BN	bn,a	<label_0x8>
	.word 0xc24a2cf4  ! 32: LDSB_I	ldsb	[%r8 + 0x0cf4], %r1
	.word 0x0c800004  ! 33: BNEG	bneg  	<label_0x4>
	.word 0xc3ea2490  ! 34: PREFETCHA_I	prefetcha	[%r8, + 0x0490] %asi, #one_read
	.word 0xc67a28b8  ! 35: SWAP_I	swap	%r3, [%r8 + 0x08b8]
	.word 0xc6d22270  ! 36: LDSHA_I	ldsha	[%r8, + 0x0270] %asi, %r3
	.word 0x26800004  ! 37: BL	bl,a	<label_0x4>
	.word 0xba5a2210  ! 38: SMUL_I	smul 	%r8, 0x0210, %r29
	.word 0x87220009  ! 40: MULScc_R	mulscc 	%r8, %r9, %r3
	.word 0xfc120009  ! 41: LDUH_R	lduh	[%r8 + %r9], %r30
	.word 0xcaa22ff0  ! 42: STWA_I	stwa	%r5, [%r8 + 0x0ff0] %asi
	.word 0xcb220009  ! 43: STF_R	st	%f5, [%r9, %r8]
	.word 0xcbf21009  ! 44: CASXA_I	casxa	[%r8] 0x80, %r9, %r5
	.word 0x40000008  ! 45: CALL	call	disp30_8
	.word 0x2e800004  ! 46: BVS	bvs,a	<label_0x4>
	.word 0xb65226c4  ! 47: UMUL_I	umul 	%r8, 0x06c4, %r27
	.word 0x8143e02b  ! 48: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #MemIssue 
	.word 0x20800004  ! 49: BN	bn,a	<label_0x4>
	.word 0x8143c000  ! 50: STBAR	stbar
	.word 0xc7220009  ! 51: STF_R	st	%f3, [%r9, %r8]
	.word 0xc3ea2934  ! 52: PREFETCHA_I	prefetcha	[%r8, + 0x0934] %asi, #one_read
	.word 0xee6a2294  ! 53: LDSTUB_I	ldstub	%r23, [%r8 + 0x0294]
	.word 0xe4ca2fb0  ! 55: LDSBA_I	ldsba	[%r8, + 0x0fb0] %asi, %r18
	.word 0xcefa1009  ! 60: SWAPA_R	swapa	%r7, [%r8 + %r9] 0x80
	.word 0x8143e052  ! 61: MEMBAR	membar	#StoreLoad | #Lookaside | #Sync 
	.word 0x8143c000  ! 62: STBAR	stbar
	.word 0xaed22368  ! 63: UMULcc_I	umulcc 	%r8, 0x0368, %r23
	.word 0x865a2708  ! 64: SMUL_I	smul 	%r8, 0x0708, %r3
	.word 0xc6520009  ! 65: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0x28800008  ! 66: BLEU	bleu,a	<label_0x8>
	.word 0xa27a2a24  ! 67: SDIV_I	sdiv 	%r8, 0x0a24, %r17
	.word 0xcc420009  ! 68: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xc3ea2df4  ! 69: PREFETCHA_I	prefetcha	[%r8, + 0x0df4] %asi, #one_read
	.word 0x8143c000  ! 70: STBAR	stbar
	.word 0xb27a2488  ! 71: SDIV_I	sdiv 	%r8, 0x0488, %r25
	.word 0x824a2ec4  ! 73: MULX_I	mulx 	%r8, 0x0ec4, %r1
	.word 0x32800004  ! 74: BNE	bne,a	<label_0x4>
	.word 0xe21225e4  ! 75: LDUH_I	lduh	[%r8 + 0x05e4], %r17
	.word 0xb16a2324  ! 76: SDIVX_I	sdivx	%r8, 0x0324, %r24
	.word 0x82f229c4  ! 77: UDIVcc_I	udivcc 	%r8, 0x09c4, %r1
	.word 0xc6c225a0  ! 78: LDSWA_I	ldswa	[%r8, + 0x05a0] %asi, %r3
	.word 0x2a800008  ! 80: BCS	bcs,a	<label_0x8>
	.word 0xc93a2120  ! 81: STDF_I	std	%f4, [0x0120, %r8]
	.word 0xc67a0009  ! 82: SWAP_R	swap	%r3, [%r8 + %r9]
	.word 0xc36a2164  ! 83: PREFETCH_I	prefetch	[%r8 + 0x0164], #one_read
	.word 0xe3222bac  ! 84: STF_I	st	%f17, [0x0bac, %r8]
	.word 0xc4fa1009  ! 85: SWAPA_R	swapa	%r2, [%r8 + %r9] 0x80
	.word 0x36800004  ! 87: BGE	bge,a	<label_0x4>
	.word 0xf6b21009  ! 88: STHA_R	stha	%r27, [%r8 + %r9] 0x80
	.word 0xcaf21009  ! 90: STXA_R	stxa	%r5, [%r8 + %r9] 0x80
	.word 0x3e800008  ! 91: BVC	bvc,a	<label_0x8>
	.word 0xccfa2144  ! 92: SWAPA_I	swapa	%r6, [%r8 + 0x0144] %asi
	.word 0x85a209a9  ! 93: FDIVs	fdivs	%f8, %f9, %f2
	.word 0xada209a9  ! 95: FDIVs	fdivs	%f8, %f9, %f22
	.word 0x82f22cd4  ! 96: UDIVcc_I	udivcc 	%r8, 0x0cd4, %r1
	.word 0x12800008  ! 97: BNE	bne  	<label_0x8>
	.word 0x8143e02e  ! 98: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #MemIssue 
	.word 0xa4522148  ! 99: UMUL_I	umul 	%r8, 0x0148, %r18
	.word 0x3e800004  ! 100: BVC	bvc,a	<label_0x4>
	.word 0x8c7a2300  ! 101: SDIV_I	sdiv 	%r8, 0x0300, %r6
	.word 0x24ca0004  ! 102: BRLEZ	brlez,a,pt	%8,<label_0xa0004>
	.word 0xf2d21009  ! 103: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r25
	.word 0xaaf220f8  ! 104: UDIVcc_I	udivcc 	%r8, 0x00f8, %r21
	.word 0x8143e075  ! 105: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside | #MemIssue | #Sync 
	.word 0xc3ea28d4  ! 106: PREFETCHA_I	prefetcha	[%r8, + 0x08d4] %asi, #one_read
	.word 0xce8227a8  ! 107: LDUWA_I	lduwa	[%r8, + 0x07a8] %asi, %r7
	.word 0xe0420009  ! 108: LDSW_R	ldsw	[%r8 + %r9], %r16
	.word 0x8f220009  ! 109: MULScc_R	mulscc 	%r8, %r9, %r7
	.word 0x8143c000  ! 110: STBAR	stbar
	.word 0xf86a2970  ! 111: LDSTUB_I	ldstub	%r28, [%r8 + 0x0970]
	.word 0xc81a2690  ! 112: LDD_I	ldd	[%r8 + 0x0690], %r4
	.word 0xca5a22b0  ! 113: LDX_I	ldx	[%r8 + 0x02b0], %r5
	.word 0xca122b38  ! 114: LDUH_I	lduh	[%r8 + 0x0b38], %r5
	.word 0x8e7a2cc8  ! 116: SDIV_I	sdiv 	%r8, 0x0cc8, %r7
	.word 0x8e4a0009  ! 118: MULX_R	mulx 	%r8, %r9, %r7
	.word 0xdb3a0009  ! 119: STDF_R	std	%f13, [%r9, %r8]
	.word 0x8da20829  ! 120: FADDs	fadds	%f8, %f9, %f6
	.word 0x8143c000  ! 121: STBAR	stbar
	.word 0xe04a0009  ! 122: LDSB_R	ldsb	[%r8 + %r9], %r16
	.word 0x08800004  ! 123: BLEU	bleu  	<label_0x4>
	.word 0x887a246c  ! 124: SDIV_I	sdiv 	%r8, 0x046c, %r4
	.word 0xf0d22108  ! 125: LDSHA_I	ldsha	[%r8, + 0x0108] %asi, %r24
	.word 0x97a20929  ! 126: FMULs	fmuls	%f8, %f9, %f11
	.word 0xc6f21009  ! 127: STXA_R	stxa	%r3, [%r8 + %r9] 0x80
	.word 0xc6020009  ! 128: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0x00800004  ! 129: BN	bn  	<label_0x4>
	.word 0x3e800008  ! 130: BVC	bvc,a	<label_0x8>
	.word 0x84da2c0c  ! 131: SMULcc_I	smulcc 	%r8, 0x0c0c, %r2
	.word 0xcd222cec  ! 132: STF_I	st	%f6, [0x0cec, %r8]
	.word 0x2ec20004  ! 133: BRGEZ	brgez,a,nt	%8,<label_0x20004>
	.word 0xc36a2378  ! 134: PREFETCH_I	prefetch	[%r8 + 0x0378], #one_read
	.word 0x8e5224dc  ! 135: UMUL_I	umul 	%r8, 0x04dc, %r7
	.word 0xcdf21009  ! 136: CASXA_I	casxa	[%r8] 0x80, %r9, %r6
	.word 0x9da20829  ! 137: FADDs	fadds	%f8, %f9, %f14
	.word 0xf01a2820  ! 138: LDD_I	ldd	[%r8 + 0x0820], %r24
	.word 0xe89228b4  ! 139: LDUHA_I	lduha	[%r8, + 0x08b4] %asi, %r20
	.word 0xa2da26a4  ! 140: SMULcc_I	smulcc 	%r8, 0x06a4, %r17
	.word 0x8a6a0009  ! 141: UDIVX_R	udivx 	%r8, %r9, %r5
	.word 0xc87a2518  ! 142: SWAP_I	swap	%r4, [%r8 + 0x0518]
	.word 0x8cf224f0  ! 143: UDIVcc_I	udivcc 	%r8, 0x04f0, %r6
	.word 0xc2b21009  ! 144: STHA_R	stha	%r1, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 145: STBAR	stbar
	.word 0xe45a0009  ! 146: LDX_R	ldx	[%r8 + %r9], %r18
	.word 0x18800004  ! 147: BGU	bgu  	<label_0x4>
	.word 0xc3ea2ac0  ! 148: PREFETCHA_I	prefetcha	[%r8, + 0x0ac0] %asi, #one_read
	.word 0x88720009  ! 149: UDIV_R	udiv 	%r8, %r9, %r4
	.word 0x8c6a2838  ! 150: UDIVX_I	udivx 	%r8, 0x0838, %r6
	.word 0xc8ea2b08  ! 151: LDSTUBA_I	ldstuba	%r4, [%r8 + 0x0b08] %asi
	.word 0xb5a208a9  ! 152: FSUBs	fsubs	%f8, %f9, %f26
	.word 0x0ac20004  ! 153: BRNZ	brnz  ,nt	%8,<label_0x20004>
	.word 0xca8a1009  ! 154: LDUBA_R	lduba	[%r8, %r9] 0x80, %r5
	.word 0x06c20004  ! 155: BRLZ	brlz  ,nt	%8,<label_0x20004>
	.word 0x8143c000  ! 156: STBAR	stbar
	.word 0x8143c000  ! 157: STBAR	stbar
	.word 0xc8420009  ! 158: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xffe21009  ! 159: CASA_I	casa	[%r8] 0x80, %r9, %r31
	.word 0xf4f22cc8  ! 160: STXA_I	stxa	%r26, [%r8 + 0x0cc8] %asi
	.word 0xc36a2200  ! 161: PREFETCH_I	prefetch	[%r8 + 0x0200], #one_read
	.word 0xce5a2e20  ! 162: LDX_I	ldx	[%r8 + 0x0e20], %r7
	.word 0xfaf221c8  ! 163: STXA_I	stxa	%r29, [%r8 + 0x01c8] %asi
	.word 0x82522788  ! 165: UMUL_I	umul 	%r8, 0x0788, %r1
	.word 0x88fa0009  ! 166: SDIVcc_R	sdivcc 	%r8, %r9, %r4
	.word 0xc2aa2f40  ! 167: STBA_I	stba	%r1, [%r8 + 0x0f40] %asi
	.word 0xccea28cc  ! 168: LDSTUBA_I	ldstuba	%r6, [%r8 + 0x08cc] %asi
	.word 0xc44a0009  ! 169: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xbc6a0009  ! 170: UDIVX_R	udivx 	%r8, %r9, %r30
	.word 0xc73a0009  ! 171: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc73a0009  ! 172: STDF_R	std	%f3, [%r9, %r8]
	.word 0xca6a2814  ! 174: LDSTUB_I	ldstub	%r5, [%r8 + 0x0814]
	.word 0x8a4a0009  ! 175: MULX_R	mulx 	%r8, %r9, %r5
	.word 0x36800004  ! 176: BGE	bge,a	<label_0x4>
	.word 0xe8ba2130  ! 177: STDA_I	stda	%r20, [%r8 + 0x0130] %asi
	.word 0x827a2470  ! 178: SDIV_I	sdiv 	%r8, 0x0470, %r1
	.word 0xf89a2160  ! 179: LDDA_I	ldda	[%r8, + 0x0160] %asi, %r28
	.word 0x827a2cf4  ! 180: SDIV_I	sdiv 	%r8, 0x0cf4, %r1
	.word 0x16800008  ! 181: BGE	bge  	<label_0x8>
	.word 0xc86a0009  ! 182: LDSTUB_R	ldstub	%r4, [%r8 + %r9]
	.word 0xc36a22d0  ! 183: PREFETCH_I	prefetch	[%r8 + 0x02d0], #one_read
	.word 0x8b222380  ! 184: MULScc_I	mulscc 	%r8, 0x0380, %r5
	.word 0xceb22654  ! 185: STHA_I	stha	%r7, [%r8 + 0x0654] %asi
	.word 0x9fa20829  ! 186: FADDs	fadds	%f8, %f9, %f15
	.word 0xcf3a20f0  ! 187: STDF_I	std	%f7, [0x00f0, %r8]
	.word 0x824a0009  ! 188: MULX_R	mulx 	%r8, %r9, %r1
	.word 0xca922ed0  ! 189: LDUHA_I	lduha	[%r8, + 0x0ed0] %asi, %r5
	.word 0xc28a1009  ! 190: LDUBA_R	lduba	[%r8, %r9] 0x80, %r1
	.word 0x1c800004  ! 191: BPOS	bpos  	<label_0x4>
	.word 0xa07a0009  ! 193: SDIV_R	sdiv 	%r8, %r9, %r16
	.word 0x836a2230  ! 194: SDIVX_I	sdivx	%r8, 0x0230, %r1
	.word 0xefe22009  ! 195: CASA_R	casa	[%r8] %asi, %r9, %r23
	.word 0xe0a22744  ! 196: STWA_I	stwa	%r16, [%r8 + 0x0744] %asi
	.word 0xc6520009  ! 197: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xf2422220  ! 198: LDSW_I	ldsw	[%r8 + 0x0220], %r25
	.word 0xb1a209a9  ! 199: FDIVs	fdivs	%f8, %f9, %f24
	.word 0x02800004  ! 200: BE	be  	<label_0x4>
	.word 0x856a0009  ! 201: SDIVX_R	sdivx	%r8, %r9, %r2
	.word 0x83220009  ! 202: MULScc_R	mulscc 	%r8, %r9, %r1
	.word 0xb47a0009  ! 203: SDIV_R	sdiv 	%r8, %r9, %r26
	.word 0xc44a0009  ! 204: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xc3ea2fb0  ! 205: PREFETCHA_I	prefetcha	[%r8, + 0x0fb0] %asi, #one_read
	.word 0xc8420009  ! 206: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xf9e21009  ! 207: CASA_I	casa	[%r8] 0x80, %r9, %r28
	.word 0xcc4a0009  ! 209: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xc4ca24b8  ! 210: LDSBA_I	ldsba	[%r8, + 0x04b8] %asi, %r2
	.word 0xc4b22edc  ! 211: STHA_I	stha	%r2, [%r8 + 0x0edc] %asi
	.word 0xcc02271c  ! 213: LDUW_I	lduw	[%r8 + 0x071c], %r6
	.word 0x88fa2af0  ! 214: SDIVcc_I	sdivcc 	%r8, 0x0af0, %r4
	.word 0xf44a0009  ! 215: LDSB_R	ldsb	[%r8 + %r9], %r26
	.word 0xe5e21009  ! 216: CASA_I	casa	[%r8] 0x80, %r9, %r18
	.word 0xc20a2924  ! 217: LDUB_I	ldub	[%r8 + 0x0924], %r1
	.word 0x89a209a9  ! 218: FDIVs	fdivs	%f8, %f9, %f4
	.word 0xc24a0009  ! 219: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xc3ea2e4c  ! 220: PREFETCHA_I	prefetcha	[%r8, + 0x0e4c] %asi, #one_read
	.word 0xc6ca1009  ! 221: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r3
	.word 0x8143e04a  ! 222: MEMBAR	membar	#StoreLoad | #StoreStore | #Sync 
	.word 0x8143c000  ! 223: STBAR	stbar
	.word 0xc2b22e88  ! 224: STHA_I	stha	%r1, [%r8 + 0x0e88] %asi
	.word 0xe0fa1009  ! 225: SWAPA_R	swapa	%r16, [%r8 + %r9] 0x80
	.word 0x864a22b8  ! 226: MULX_I	mulx 	%r8, 0x02b8, %r3
	.word 0x85a208a9  ! 227: FSUBs	fsubs	%f8, %f9, %f2
	.word 0x2c800004  ! 228: BNEG	bneg,a	<label_0x4>
	.word 0x8cda2d9c  ! 229: SMULcc_I	smulcc 	%r8, 0x0d9c, %r6
	.word 0xf2c21009  ! 230: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r25
	.word 0x8143e037  ! 231: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside | #MemIssue 
	.word 0x867a22ec  ! 232: SDIV_I	sdiv 	%r8, 0x02ec, %r3
	.word 0x2aca0004  ! 233: BRNZ	brnz,a,pt	%8,<label_0xa0004>
	.word 0x24800004  ! 234: BLE	ble,a	<label_0x4>
	.word 0x86722594  ! 235: UDIV_I	udiv 	%r8, 0x0594, %r3
	.word 0xd8d22d20  ! 236: LDSHA_I	ldsha	[%r8, + 0x0d20] %asi, %r12
	.word 0xd41a2a98  ! 237: LDD_I	ldd	[%r8 + 0x0a98], %r10
	.word 0xdcba2720  ! 238: STDA_I	stda	%r14, [%r8 + 0x0720] %asi
	.word 0xc36a2408  ! 239: PREFETCH_I	prefetch	[%r8 + 0x0408], #one_read
	.word 0xc4da2a18  ! 240: LDXA_I	ldxa	[%r8, + 0x0a18] %asi, %r2
	.word 0x8143e059  ! 241: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside | #Sync 
	.word 0x8143e06b  ! 242: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #MemIssue | #Sync 
	.word 0x8e4a0009  ! 243: MULX_R	mulx 	%r8, %r9, %r7
	.word 0x8cd22368  ! 244: UMULcc_I	umulcc 	%r8, 0x0368, %r6
	.word 0x8143c000  ! 245: STBAR	stbar
	.word 0xfea226b8  ! 246: STWA_I	stwa	%r31, [%r8 + 0x06b8] %asi
	.word 0xcdf22009  ! 247: CASXA_R	casxa	[%r8]%asi, %r9, %r6
	.word 0xc33a27d0  ! 248: STDF_I	std	%f1, [0x07d0, %r8]
	.word 0xc48a250c  ! 249: LDUBA_I	lduba	[%r8, + 0x050c] %asi, %r2
	.word 0x8143e064  ! 250: MEMBAR	membar	#LoadStore | #MemIssue | #Sync 
	.word 0xe6422e34  ! 251: LDSW_I	ldsw	[%r8 + 0x0e34], %r19
	.word 0xc2122024  ! 252: LDUH_I	lduh	[%r8 + 0x0024], %r1
	.word 0x8d6a0009  ! 253: SDIVX_R	sdivx	%r8, %r9, %r6
	.word 0x867a294c  ! 254: SDIV_I	sdiv 	%r8, 0x094c, %r3
	.word 0xc8d22eb4  ! 255: LDSHA_I	ldsha	[%r8, + 0x0eb4] %asi, %r4
	.word 0x8e522f38  ! 256: UMUL_I	umul 	%r8, 0x0f38, %r7
	.word 0x83a20929  ! 257: FMULs	fmuls	%f8, %f9, %f1
	.word 0x8143c000  ! 258: STBAR	stbar
	.word 0xc8120009  ! 259: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xdc1a0009  ! 260: LDD_R	ldd	[%r8 + %r9], %r14
	.word 0x10800004  ! 261: BA	ba  	<label_0x4>
	.word 0xcec22f20  ! 262: LDSWA_I	ldswa	[%r8, + 0x0f20] %asi, %r7
	.word 0x86f22d88  ! 263: UDIVcc_I	udivcc 	%r8, 0x0d88, %r3
	.word 0xcaea1009  ! 264: LDSTUBA_R	ldstuba	%r5, [%r8 + %r9] 0x80
	.word 0x87a20829  ! 265: FADDs	fadds	%f8, %f9, %f3
	.word 0x8ba20829  ! 266: FADDs	fadds	%f8, %f9, %f5
	.word 0x8ada28a4  ! 267: SMULcc_I	smulcc 	%r8, 0x08a4, %r5
	.word 0xe8fa28ac  ! 268: SWAPA_I	swapa	%r20, [%r8 + 0x08ac] %asi
	.word 0xd89a2048  ! 269: LDDA_I	ldda	[%r8, + 0x0048] %asi, %r12
	.word 0xcd2224d8  ! 270: STF_I	st	%f6, [0x04d8, %r8]
	.word 0xcb3a2908  ! 271: STDF_I	std	%f5, [0x0908, %r8]
	.word 0x10800008  ! 272: BA	ba  	<label_0x8>
	.word 0xe2f21009  ! 273: STXA_R	stxa	%r17, [%r8 + %r9] 0x80
	.word 0x845a0009  ! 274: SMUL_R	smul 	%r8, %r9, %r2
	.word 0x83a208a9  ! 275: FSUBs	fsubs	%f8, %f9, %f1
	.word 0x32800004  ! 276: BNE	bne,a	<label_0x4>
	.word 0xccea2704  ! 277: LDSTUBA_I	ldstuba	%r6, [%r8 + 0x0704] %asi
	.word 0xc3ea2a64  ! 278: PREFETCHA_I	prefetcha	[%r8, + 0x0a64] %asi, #one_read
	.word 0xc68227b0  ! 280: LDUWA_I	lduwa	[%r8, + 0x07b0] %asi, %r3
	.word 0xceb22d58  ! 281: STHA_I	stha	%r7, [%r8 + 0x0d58] %asi
	.word 0xca921009  ! 282: LDUHA_R	lduha	[%r8, %r9] 0x80, %r5
	.word 0x8143e000  ! 283: MEMBAR	membar	
	.word 0x8a522538  ! 284: UMUL_I	umul 	%r8, 0x0538, %r5
	.word 0xbada0009  ! 287: SMULcc_R	smulcc 	%r8, %r9, %r29
	.word 0xc4c22af0  ! 288: LDSWA_I	ldswa	[%r8, + 0x0af0] %asi, %r2
	.word 0x83a208a9  ! 290: FSUBs	fsubs	%f8, %f9, %f1
	.word 0x8143c000  ! 291: STBAR	stbar
	.word 0x89a209a9  ! 292: FDIVs	fdivs	%f8, %f9, %f4
	.word 0xc4a22d24  ! 293: STWA_I	stwa	%r2, [%r8 + 0x0d24] %asi
	.word 0xc4aa2e9c  ! 294: STBA_I	stba	%r2, [%r8 + 0x0e9c] %asi
	.word 0x06800004  ! 295: BL	bl  	<label_0x4>
	.word 0xc36a291c  ! 296: PREFETCH_I	prefetch	[%r8 + 0x091c], #one_read
	.word 0xd66a2dd4  ! 297: LDSTUB_I	ldstub	%r11, [%r8 + 0x0dd4]
	.word 0x8fa20929  ! 298: FMULs	fmuls	%f8, %f9, %f7
	.word 0xc68225cc  ! 299: LDUWA_I	lduwa	[%r8, + 0x05cc] %asi, %r3
	.word 0xdaa22874  ! 300: STWA_I	stwa	%r13, [%r8 + 0x0874] %asi
	.word 0xd8a21009  ! 301: STWA_R	stwa	%r12, [%r8 + %r9] 0x80
	.word 0x02c20004  ! 302: BRZ	brz  ,nt	%8,<label_0x20004>
	.word 0x94fa0009  ! 303: SDIVcc_R	sdivcc 	%r8, %r9, %r10
	.word 0xcc8a1009  ! 304: LDUBA_R	lduba	[%r8, %r9] 0x80, %r6
	.word 0xc6d229f4  ! 305: LDSHA_I	ldsha	[%r8, + 0x09f4] %asi, %r3
	.word 0xc6922170  ! 306: LDUHA_I	lduha	[%r8, + 0x0170] %asi, %r3
	.word 0x8143e021  ! 308: MEMBAR	membar	#LoadLoad | #MemIssue 
	.word 0xccea1009  ! 309: LDSTUBA_R	ldstuba	%r6, [%r8 + %r9] 0x80
	.word 0xc36a2448  ! 310: PREFETCH_I	prefetch	[%r8 + 0x0448], #one_read
	.word 0xb8da0009  ! 311: SMULcc_R	smulcc 	%r8, %r9, %r28
	.word 0xc8f21009  ! 312: STXA_R	stxa	%r4, [%r8 + %r9] 0x80
	.word 0x2e800004  ! 313: BVS	bvs,a	<label_0x4>
	.word 0xbc522590  ! 314: UMUL_I	umul 	%r8, 0x0590, %r30
	.word 0x98722294  ! 315: UDIV_I	udiv 	%r8, 0x0294, %r12
	.word 0xc73a0009  ! 316: STDF_R	std	%f3, [%r9, %r8]
	.word 0x22c20004  ! 317: BRZ	brz,a,nt	%8,<label_0x20004>
	.word 0x82520009  ! 318: UMUL_R	umul 	%r8, %r9, %r1
	.word 0xef220009  ! 320: STF_R	st	%f23, [%r9, %r8]
	.word 0x8143e020  ! 321: MEMBAR	membar	#MemIssue 
	.word 0x8f6a0009  ! 323: SDIVX_R	sdivx	%r8, %r9, %r7
	.word 0x8143c000  ! 324: STBAR	stbar
	.word 0xf7f21009  ! 325: CASXA_I	casxa	[%r8] 0x80, %r9, %r27
	.word 0x8143c000  ! 326: STBAR	stbar
	.word 0xc36a2ca4  ! 327: PREFETCH_I	prefetch	[%r8 + 0x0ca4], #one_read
	.word 0xc27a2a38  ! 328: SWAP_I	swap	%r1, [%r8 + 0x0a38]
	.word 0xc27a2d80  ! 329: SWAP_I	swap	%r1, [%r8 + 0x0d80]
	.word 0xc8a21009  ! 330: STWA_R	stwa	%r4, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 331: STBAR	stbar
	.word 0xf0ba1009  ! 332: STDA_R	stda	%r24, [%r8 + %r9] 0x80
	.word 0x8143e038  ! 333: MEMBAR	membar	#StoreStore | #Lookaside | #MemIssue 
	.word 0x8143e030  ! 334: MEMBAR	membar	#Lookaside | #MemIssue 
	.word 0x1e800004  ! 335: BVC	bvc  	<label_0x4>
	.word 0xe322280c  ! 336: STF_I	st	%f17, [0x080c, %r8]
	.word 0x10800004  ! 337: BA	ba  	<label_0x4>
	.word 0xcea222b0  ! 338: STWA_I	stwa	%r7, [%r8 + 0x02b0] %asi
	.word 0xb8f20009  ! 339: UDIVcc_R	udivcc 	%r8, %r9, %r28
	.word 0xc2aa1009  ! 340: STBA_R	stba	%r1, [%r8 + %r9] 0x80
	.word 0x3a800008  ! 341: BCC	bcc,a	<label_0x8>
	.word 0xc4ba2e58  ! 342: STDA_I	stda	%r2, [%r8 + 0x0e58] %asi
	.word 0xbada22d4  ! 343: SMULcc_I	smulcc 	%r8, 0x02d4, %r29
	.word 0x24800008  ! 344: BLE	ble,a	<label_0x8>
	.word 0xce922204  ! 345: LDUHA_I	lduha	[%r8, + 0x0204] %asi, %r7
	.word 0xf85a2bc8  ! 346: LDX_I	ldx	[%r8 + 0x0bc8], %r28
	.word 0xacf22310  ! 347: UDIVcc_I	udivcc 	%r8, 0x0310, %r22
	.word 0xf8ba1009  ! 348: STDA_R	stda	%r28, [%r8 + %r9] 0x80
	.word 0x8ba20929  ! 349: FMULs	fmuls	%f8, %f9, %f5
	.word 0x3e800004  ! 350: BVC	bvc,a	<label_0x4>
	.word 0xc8aa2ba8  ! 351: STBA_I	stba	%r4, [%r8 + 0x0ba8] %asi
	.word 0xcc922828  ! 352: LDUHA_I	lduha	[%r8, + 0x0828] %asi, %r6
	.word 0x8b6a2a50  ! 353: SDIVX_I	sdivx	%r8, 0x0a50, %r5
	.word 0xcaaa1009  ! 354: STBA_R	stba	%r5, [%r8 + %r9] 0x80
	.word 0x82720009  ! 355: UDIV_R	udiv 	%r8, %r9, %r1
	.word 0xc6fa1009  ! 356: SWAPA_R	swapa	%r3, [%r8 + %r9] 0x80
	.word 0x8143e006  ! 357: MEMBAR	membar	#StoreLoad | #LoadStore 
	.word 0xd4ea1009  ! 358: LDSTUBA_R	ldstuba	%r10, [%r8 + %r9] 0x80
	.word 0x16800008  ! 359: BGE	bge  	<label_0x8>
	.word 0x8a52286c  ! 360: UMUL_I	umul 	%r8, 0x086c, %r5
	.word 0x8af22740  ! 361: UDIVcc_I	udivcc 	%r8, 0x0740, %r5
	.word 0xcc4a2ed4  ! 362: LDSB_I	ldsb	[%r8 + 0x0ed4], %r6
	.word 0x8143e038  ! 363: MEMBAR	membar	#StoreStore | #Lookaside | #MemIssue 
	.word 0x86f22e88  ! 364: UDIVcc_I	udivcc 	%r8, 0x0e88, %r3
	.word 0xceea1009  ! 365: LDSTUBA_R	ldstuba	%r7, [%r8 + %r9] 0x80
	.word 0xc3ea2960  ! 366: PREFETCHA_I	prefetcha	[%r8, + 0x0960] %asi, #one_read
	.word 0xc6a2247c  ! 367: STWA_I	stwa	%r3, [%r8 + 0x047c] %asi
	.word 0xc4ba2908  ! 369: STDA_I	stda	%r2, [%r8 + 0x0908] %asi
	.word 0xb1a208a9  ! 370: FSUBs	fsubs	%f8, %f9, %f24
	.word 0xc9e22009  ! 372: CASA_R	casa	[%r8] %asi, %r9, %r4
	.word 0xc4ea1009  ! 373: LDSTUBA_R	ldstuba	%r2, [%r8 + %r9] 0x80
	.word 0x8da20829  ! 375: FADDs	fadds	%f8, %f9, %f6
	.word 0xc4aa1009  ! 376: STBA_R	stba	%r2, [%r8 + %r9] 0x80
	.word 0x8ed22f3c  ! 377: UMULcc_I	umulcc 	%r8, 0x0f3c, %r7
	.word 0x0eca0008  ! 378: BRGEZ	brgez  ,pt	%8,<label_0xa0008>
	.word 0x20800008  ! 379: BN	bn,a	<label_0x8>
	.word 0xc85a0009  ! 380: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xc3ea2900  ! 381: PREFETCHA_I	prefetcha	[%r8, + 0x0900] %asi, #one_read
	.word 0x08800004  ! 382: BLEU	bleu  	<label_0x4>
	.word 0xc2a22080  ! 384: STWA_I	stwa	%r1, [%r8 + 0x0080] %asi
	.word 0x18800008  ! 385: BGU	bgu  	<label_0x8>
	.word 0x2c800008  ! 386: BNEG	bneg,a	<label_0x8>
	.word 0xd5f22009  ! 387: CASXA_R	casxa	[%r8]%asi, %r9, %r10
	.word 0x8143e058  ! 388: MEMBAR	membar	#StoreStore | #Lookaside | #Sync 
	.word 0xc4aa28a8  ! 389: STBA_I	stba	%r2, [%r8 + 0x08a8] %asi
	.word 0x83a208a9  ! 390: FSUBs	fsubs	%f8, %f9, %f1
	.word 0xdc4a0009  ! 391: LDSB_R	ldsb	[%r8 + %r9], %r14
	.word 0xe2fa1009  ! 392: SWAPA_R	swapa	%r17, [%r8 + %r9] 0x80
	.word 0xf4921009  ! 393: LDUHA_R	lduha	[%r8, %r9] 0x80, %r26
	.word 0xc3ea2134  ! 394: PREFETCHA_I	prefetcha	[%r8, + 0x0134] %asi, #one_read
	.word 0xb25a0009  ! 395: SMUL_R	smul 	%r8, %r9, %r25
	.word 0x86f22e18  ! 396: UDIVcc_I	udivcc 	%r8, 0x0e18, %r3
	.word 0xa9a20829  ! 397: FADDs	fadds	%f8, %f9, %f20
	.word 0x8a7a2104  ! 398: SDIV_I	sdiv 	%r8, 0x0104, %r5
	.word 0xc6b21009  ! 399: STHA_R	stha	%r3, [%r8 + %r9] 0x80
	.word 0x10800004  ! 401: BA	ba  	<label_0x4>
	.word 0x26ca0004  ! 402: BRLZ	brlz,a,pt	%8,<label_0xa0004>
	.word 0x8143e02c  ! 403: MEMBAR	membar	#LoadStore | #StoreStore | #MemIssue 
	.word 0x84fa2308  ! 404: SDIVcc_I	sdivcc 	%r8, 0x0308, %r2
	.word 0x8143e05e  ! 406: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0xe8422b4c  ! 407: LDSW_I	ldsw	[%r8 + 0x0b4c], %r20
	.word 0xd66a2030  ! 408: LDSTUB_I	ldstub	%r11, [%r8 + 0x0030]
	.word 0xc60a0009  ! 409: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xcd3a0009  ! 410: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc6aa1009  ! 411: STBA_R	stba	%r3, [%r8 + %r9] 0x80
	.word 0x8143e038  ! 412: MEMBAR	membar	#StoreStore | #Lookaside | #MemIssue 
	.word 0xc3220009  ! 413: STF_R	st	%f1, [%r9, %r8]
	.word 0xca0a0009  ! 414: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xc36a2970  ! 415: PREFETCH_I	prefetch	[%r8 + 0x0970], #one_read
	.word 0x82fa2c3c  ! 416: SDIVcc_I	sdivcc 	%r8, 0x0c3c, %r1
	.word 0xda122634  ! 417: LDUH_I	lduh	[%r8 + 0x0634], %r13
	.word 0x9cda0009  ! 418: SMULcc_R	smulcc 	%r8, %r9, %r14
	.word 0xf41a0009  ! 419: LDD_R	ldd	[%r8 + %r9], %r26
	.word 0x82d22ad4  ! 420: UMULcc_I	umulcc 	%r8, 0x0ad4, %r1
	.word 0xb9a20829  ! 422: FADDs	fadds	%f8, %f9, %f28
	.word 0xb0da0009  ! 423: SMULcc_R	smulcc 	%r8, %r9, %r24
	.word 0x83a209a9  ! 425: FDIVs	fdivs	%f8, %f9, %f1
	.word 0xe2aa2b18  ! 426: STBA_I	stba	%r17, [%r8 + 0x0b18] %asi
	.word 0x8cda2954  ! 427: SMULcc_I	smulcc 	%r8, 0x0954, %r6
	.word 0xcaf21009  ! 428: STXA_R	stxa	%r5, [%r8 + %r9] 0x80
	.word 0xc46a0009  ! 429: LDSTUB_R	ldstub	%r2, [%r8 + %r9]
	.word 0x8ba209a9  ! 430: FDIVs	fdivs	%f8, %f9, %f5
	.word 0xc80a2678  ! 431: LDUB_I	ldub	[%r8 + 0x0678], %r4
	.word 0x8b220009  ! 432: MULScc_R	mulscc 	%r8, %r9, %r5
	.word 0xe3f22009  ! 433: CASXA_R	casxa	[%r8]%asi, %r9, %r17
	.word 0xc66a28fc  ! 434: LDSTUB_I	ldstub	%r3, [%r8 + 0x08fc]
	.word 0xdd3a2cf8  ! 435: STDF_I	std	%f14, [0x0cf8, %r8]
	.word 0xc4020009  ! 436: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xc4aa1009  ! 437: STBA_R	stba	%r2, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 438: STBAR	stbar
	.word 0x84d22080  ! 439: UMULcc_I	umulcc 	%r8, 0x0080, %r2
	.word 0x82da0009  ! 440: SMULcc_R	smulcc 	%r8, %r9, %r1
	.word 0x87a208a9  ! 441: FSUBs	fsubs	%f8, %f9, %f3
	.word 0xc7f22009  ! 442: CASXA_R	casxa	[%r8]%asi, %r9, %r3
	.word 0xc4ea2c30  ! 443: LDSTUBA_I	ldstuba	%r2, [%r8 + 0x0c30] %asi
	.word 0xc2120009  ! 444: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0x885a0009  ! 445: SMUL_R	smul 	%r8, %r9, %r4
	.word 0xa45a2f7c  ! 446: SMUL_I	smul 	%r8, 0x0f7c, %r18
	.word 0xc36a2e6c  ! 447: PREFETCH_I	prefetch	[%r8 + 0x0e6c], #one_read
	.word 0xc67a26ec  ! 448: SWAP_I	swap	%r3, [%r8 + 0x06ec]
	.word 0x9c4a2470  ! 450: MULX_I	mulx 	%r8, 0x0470, %r14
	.word 0xc2ea2744  ! 451: LDSTUBA_I	ldstuba	%r1, [%r8 + 0x0744] %asi
	.word 0xca5a0009  ! 452: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0x06ca0004  ! 453: BRLZ	brlz  ,pt	%8,<label_0xa0004>
	.word 0xc7e22009  ! 454: CASA_R	casa	[%r8] %asi, %r9, %r3
	.word 0xceb22680  ! 455: STHA_I	stha	%r7, [%r8 + 0x0680] %asi
	.word 0xc4d21009  ! 456: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r2
	.word 0xecaa2138  ! 457: STBA_I	stba	%r22, [%r8 + 0x0138] %asi
	.word 0xf41a0009  ! 458: LDD_R	ldd	[%r8 + %r9], %r26
	.word 0x83222620  ! 459: MULScc_I	mulscc 	%r8, 0x0620, %r1
	.word 0xc24a0009  ! 460: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xc4aa1009  ! 461: STBA_R	stba	%r2, [%r8 + %r9] 0x80
	.word 0xcaaa2684  ! 462: STBA_I	stba	%r5, [%r8 + 0x0684] %asi
	.word 0xdc1a0009  ! 463: LDD_R	ldd	[%r8 + %r9], %r14
	.word 0xdbf22009  ! 464: CASXA_R	casxa	[%r8]%asi, %r9, %r13
	.word 0xd4b22d18  ! 465: STHA_I	stha	%r10, [%r8 + 0x0d18] %asi
	.word 0xc3ea24c0  ! 466: PREFETCHA_I	prefetcha	[%r8, + 0x04c0] %asi, #one_read
	.word 0xa1a20929  ! 467: FMULs	fmuls	%f8, %f9, %f16
	.word 0xf89a1009  ! 470: LDDA_R	ldda	[%r8, %r9] 0x80, %r28
	.word 0x8143c000  ! 471: STBAR	stbar
	.word 0x18800008  ! 472: BGU	bgu  	<label_0x8>
	.word 0xee120009  ! 473: LDUH_R	lduh	[%r8 + %r9], %r23
	.word 0xc2d21009  ! 474: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r1
	.word 0x2eca0004  ! 475: BRGEZ	brgez,a,pt	%8,<label_0xa0004>
	.word 0x16800004  ! 476: BGE	bge  	<label_0x4>
	.word 0x8e722a68  ! 477: UDIV_I	udiv 	%r8, 0x0a68, %r7
	.word 0xeada1009  ! 478: LDXA_R	ldxa	[%r8, %r9] 0x80, %r21
	.word 0x8143e036  ! 480: MEMBAR	membar	#StoreLoad | #LoadStore | #Lookaside | #MemIssue 
	.word 0x14800004  ! 481: BG	bg  	<label_0x4>
	.word 0x8143e05d  ! 482: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0x8143e034  ! 483: MEMBAR	membar	#LoadStore | #Lookaside | #MemIssue 
	.word 0x8ed20009  ! 484: UMULcc_R	umulcc 	%r8, %r9, %r7
	.word 0xdad21009  ! 485: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r13
	.word 0x99a20929  ! 486: FMULs	fmuls	%f8, %f9, %f12
	.word 0x825a0009  ! 487: SMUL_R	smul 	%r8, %r9, %r1
	.word 0xd4ba2b28  ! 488: STDA_I	stda	%r10, [%r8 + 0x0b28] %asi
	.word 0x06ca0004  ! 489: BRLZ	brlz  ,pt	%8,<label_0xa0004>
	.word 0xfada2a50  ! 490: LDXA_I	ldxa	[%r8, + 0x0a50] %asi, %r29
	.word 0x8d220009  ! 491: MULScc_R	mulscc 	%r8, %r9, %r6
	.word 0x887a2c44  ! 492: SDIV_I	sdiv 	%r8, 0x0c44, %r4
	.word 0xd8a21009  ! 493: STWA_R	stwa	%r12, [%r8 + %r9] 0x80
	.word 0xc36a2e74  ! 494: PREFETCH_I	prefetch	[%r8 + 0x0e74], #one_read
	.word 0xca921009  ! 495: LDUHA_R	lduha	[%r8, %r9] 0x80, %r5
	.word 0xfa8a1009  ! 496: LDUBA_R	lduba	[%r8, %r9] 0x80, %r29
	.word 0xc4ba1009  ! 497: STDA_R	stda	%r2, [%r8 + %r9] 0x80
	.word 0x3c800004  ! 498: BPOS	bpos,a	<label_0x4>
	.word 0xdcb224d8  ! 499: STHA_I	stha	%r14, [%r8 + 0x04d8] %asi
	.word 0x0e800008  ! 500: BVS	bvs  	<label_0x8>
	.word 0xe4520009  ! 501: LDSH_R	ldsh	[%r8 + %r9], %r18
	.word 0x8e7a0009  ! 502: SDIV_R	sdiv 	%r8, %r9, %r7
	.word 0xc20a0009  ! 503: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0x8143c000  ! 504: STBAR	stbar
	.word 0xec5a0009  ! 505: LDX_R	ldx	[%r8 + %r9], %r22
	.word 0xaba209a9  ! 506: FDIVs	fdivs	%f8, %f9, %f21
	.word 0x8143c000  ! 507: STBAR	stbar
	.word 0xc6b22de0  ! 508: STHA_I	stha	%r3, [%r8 + 0x0de0] %asi
	.word 0x8143c000  ! 509: STBAR	stbar
	.word 0x2cc20004  ! 510: BRGZ	brgz,a,nt	%8,<label_0x20004>
	.word 0xce4a240c  ! 511: LDSB_I	ldsb	[%r8 + 0x040c], %r7
	.word 0x866a0009  ! 512: UDIVX_R	udivx 	%r8, %r9, %r3
	.word 0x89a209a9  ! 513: FDIVs	fdivs	%f8, %f9, %f4
	.word 0xc6fa290c  ! 514: SWAPA_I	swapa	%r3, [%r8 + 0x090c] %asi
	.word 0x8cf221a0  ! 515: UDIVcc_I	udivcc 	%r8, 0x01a0, %r6
	.word 0x8143c000  ! 516: STBAR	stbar
	.word 0xce9222d8  ! 517: LDUHA_I	lduha	[%r8, + 0x02d8] %asi, %r7
	.word 0xc3ea297c  ! 518: PREFETCHA_I	prefetcha	[%r8, + 0x097c] %asi, #one_read
	.word 0xd73a0009  ! 519: STDF_R	std	%f11, [%r9, %r8]
	.word 0xc84a0009  ! 520: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0x04ca0008  ! 521: BRLEZ	brlez  ,pt	%8,<label_0xa0008>
	.word 0xf25a24b8  ! 522: LDX_I	ldx	[%r8 + 0x04b8], %r25
	.word 0xc4ba1009  ! 524: STDA_R	stda	%r2, [%r8 + %r9] 0x80
	.word 0x18800004  ! 525: BGU	bgu  	<label_0x4>
	.word 0xc8120009  ! 527: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xccd21009  ! 528: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r6
	.word 0xa4d20009  ! 529: UMULcc_R	umulcc 	%r8, %r9, %r18
	.word 0xf8122a3c  ! 530: LDUH_I	lduh	[%r8 + 0x0a3c], %r28
	.word 0xc33a0009  ! 531: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc7e22009  ! 532: CASA_R	casa	[%r8] %asi, %r9, %r3
	.word 0x96da2104  ! 533: SMULcc_I	smulcc 	%r8, 0x0104, %r11
	.word 0xc36a2b6c  ! 534: PREFETCH_I	prefetch	[%r8 + 0x0b6c], #one_read
	.word 0x876a0009  ! 535: SDIVX_R	sdivx	%r8, %r9, %r3
	.word 0xe4fa21b0  ! 536: SWAPA_I	swapa	%r18, [%r8 + 0x01b0] %asi
	.word 0xce7a0009  ! 537: SWAP_R	swap	%r7, [%r8 + %r9]
	.word 0xea6a2634  ! 538: LDSTUB_I	ldstub	%r21, [%r8 + 0x0634]
	.word 0xc5222c20  ! 541: STF_I	st	%f2, [0x0c20, %r8]
	.word 0xcdf21009  ! 542: CASXA_I	casxa	[%r8] 0x80, %r9, %r6
	.word 0x8143e048  ! 543: MEMBAR	membar	#StoreStore | #Sync 
	.word 0x8e522ee8  ! 544: UMUL_I	umul 	%r8, 0x0ee8, %r7
	.word 0xc7220009  ! 545: STF_R	st	%f3, [%r9, %r8]
	.word 0x32800004  ! 546: BNE	bne,a	<label_0x4>
	.word 0x886a2fa4  ! 547: UDIVX_I	udivx 	%r8, 0x0fa4, %r4
	.word 0x8f2228b8  ! 548: MULScc_I	mulscc 	%r8, 0x08b8, %r7
	.word 0xa26a2128  ! 549: UDIVX_I	udivx 	%r8, 0x0128, %r17
	.word 0xa6720009  ! 550: UDIV_R	udiv 	%r8, %r9, %r19
	.word 0xc36a2338  ! 551: PREFETCH_I	prefetch	[%r8 + 0x0338], #one_read
	.word 0xc2a2239c  ! 552: STWA_I	stwa	%r1, [%r8 + 0x039c] %asi
	.word 0xdc9a2738  ! 554: LDDA_I	ldda	[%r8, + 0x0738] %asi, %r14
	.word 0x10800004  ! 555: BA	ba  	<label_0x4>
	.word 0xdaca2e24  ! 556: LDSBA_I	ldsba	[%r8, + 0x0e24] %asi, %r13
	.word 0xfc9a1009  ! 557: LDDA_R	ldda	[%r8, %r9] 0x80, %r30
	.word 0xd5f22009  ! 558: CASXA_R	casxa	[%r8]%asi, %r9, %r10
	.word 0x845a0009  ! 559: SMUL_R	smul 	%r8, %r9, %r2
	.word 0x2c800004  ! 561: BNEG	bneg,a	<label_0x4>
	.word 0x82da0009  ! 563: SMULcc_R	smulcc 	%r8, %r9, %r1
	.word 0xe25a2930  ! 564: LDX_I	ldx	[%r8 + 0x0930], %r17
	.word 0xc8ba2b20  ! 565: STDA_I	stda	%r4, [%r8 + 0x0b20] %asi
	.word 0x8143e017  ! 566: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside 
	.word 0xc6020009  ! 567: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xc36a28c8  ! 568: PREFETCH_I	prefetch	[%r8 + 0x08c8], #one_read
	.word 0xe8922cc0  ! 569: LDUHA_I	lduha	[%r8, + 0x0cc0] %asi, %r20
	.word 0xccaa1009  ! 570: STBA_R	stba	%r6, [%r8 + %r9] 0x80
	.word 0x24800004  ! 571: BLE	ble,a	<label_0x4>
	.word 0x8143c000  ! 572: STBAR	stbar
	.word 0xf81a2358  ! 574: LDD_I	ldd	[%r8 + 0x0358], %r28
	.word 0x26800008  ! 575: BL	bl,a	<label_0x8>
	.word 0x8143e038  ! 576: MEMBAR	membar	#StoreStore | #Lookaside | #MemIssue 
	.word 0x8efa0009  ! 577: SDIVcc_R	sdivcc 	%r8, %r9, %r7
	.word 0xaada2138  ! 578: SMULcc_I	smulcc 	%r8, 0x0138, %r21
	.word 0x83a208a9  ! 579: FSUBs	fsubs	%f8, %f9, %f1
	.word 0x24ca0004  ! 580: BRLEZ	brlez,a,pt	%8,<label_0xa0004>
	.word 0xea020009  ! 581: LDUW_R	lduw	[%r8 + %r9], %r21
	.word 0x8143c000  ! 582: STBAR	stbar
	.word 0xca022f34  ! 583: LDUW_I	lduw	[%r8 + 0x0f34], %r5
	.word 0x1a800008  ! 584: BCC	bcc  	<label_0x8>
	.word 0x8143e00f  ! 585: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore 
	.word 0x88720009  ! 586: UDIV_R	udiv 	%r8, %r9, %r4
	.word 0xee520009  ! 587: LDSH_R	ldsh	[%r8 + %r9], %r23
	.word 0x8cf22238  ! 588: UDIVcc_I	udivcc 	%r8, 0x0238, %r6
	.word 0xe722275c  ! 589: STF_I	st	%f19, [0x075c, %r8]
	.word 0xf4b22e3c  ! 590: STHA_I	stha	%r26, [%r8 + 0x0e3c] %asi
	.word 0xca822668  ! 591: LDUWA_I	lduwa	[%r8, + 0x0668] %asi, %r5
	.word 0xb6f20009  ! 592: UDIVcc_R	udivcc 	%r8, %r9, %r27
	.word 0x8143e05e  ! 593: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0x964a2010  ! 594: MULX_I	mulx 	%r8, 0x0010, %r11
	.word 0xc6ea28b0  ! 595: LDSTUBA_I	ldstuba	%r3, [%r8 + 0x08b0] %asi
	.word 0x24800004  ! 596: BLE	ble,a	<label_0x4>
	.word 0xccca25a4  ! 597: LDSBA_I	ldsba	[%r8, + 0x05a4] %asi, %r6
	.word 0x8fa20829  ! 598: FADDs	fadds	%f8, %f9, %f7
	.word 0xe01a2a78  ! 599: LDD_I	ldd	[%r8 + 0x0a78], %r16
	.word 0xc9e22009  ! 600: CASA_R	casa	[%r8] %asi, %r9, %r4
	.word 0xc6da1009  ! 601: LDXA_R	ldxa	[%r8, %r9] 0x80, %r3
	.word 0xc8f21009  ! 602: STXA_R	stxa	%r4, [%r8 + %r9] 0x80
	.word 0x89220009  ! 603: MULScc_R	mulscc 	%r8, %r9, %r4
	.word 0xea6a0009  ! 604: LDSTUB_R	ldstub	%r21, [%r8 + %r9]
	.word 0x89a208a9  ! 605: FSUBs	fsubs	%f8, %f9, %f4
	.word 0x8143e01d  ! 606: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside 
	.word 0x36800008  ! 607: BGE	bge,a	<label_0x8>
	.word 0xfa822680  ! 608: LDUWA_I	lduwa	[%r8, + 0x0680] %asi, %r29
	.word 0xee6a2e1c  ! 609: LDSTUB_I	ldstub	%r23, [%r8 + 0x0e1c]
	.word 0x89a20929  ! 610: FMULs	fmuls	%f8, %f9, %f4
	.word 0xd8a221cc  ! 611: STWA_I	stwa	%r12, [%r8 + 0x01cc] %asi
	.word 0xcc1a2680  ! 612: LDD_I	ldd	[%r8 + 0x0680], %r6
	.word 0x97a208a9  ! 613: FSUBs	fsubs	%f8, %f9, %f11
	.word 0xc7f21009  ! 614: CASXA_I	casxa	[%r8] 0x80, %r9, %r3
	.word 0xc3ea2b14  ! 615: PREFETCHA_I	prefetcha	[%r8, + 0x0b14] %asi, #one_read
	.word 0x8da209a9  ! 616: FDIVs	fdivs	%f8, %f9, %f6
	.word 0x866a2ebc  ! 617: UDIVX_I	udivx 	%r8, 0x0ebc, %r3
	.word 0x864a2950  ! 618: MULX_I	mulx 	%r8, 0x0950, %r3
	.word 0x2cca0004  ! 620: BRGZ	brgz,a,pt	%8,<label_0xa0004>
	.word 0xf46a2eb4  ! 621: LDSTUB_I	ldstub	%r26, [%r8 + 0x0eb4]
	.word 0xc2520009  ! 622: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0x827a2320  ! 623: SDIV_I	sdiv 	%r8, 0x0320, %r1
	.word 0x8143c000  ! 624: STBAR	stbar
	.word 0x8143e05e  ! 625: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0xca4a2dac  ! 626: LDSB_I	ldsb	[%r8 + 0x0dac], %r5
	.word 0xcf3a0009  ! 627: STDF_R	std	%f7, [%r9, %r8]
	.word 0x82fa0009  ! 628: SDIVcc_R	sdivcc 	%r8, %r9, %r1
	.word 0xcaaa1009  ! 629: STBA_R	stba	%r5, [%r8 + %r9] 0x80
	.word 0x1a800008  ! 630: BCC	bcc  	<label_0x8>
	.word 0x84720009  ! 631: UDIV_R	udiv 	%r8, %r9, %r2
	.word 0x8d220009  ! 632: MULScc_R	mulscc 	%r8, %r9, %r6
	.word 0x8afa0009  ! 633: SDIVcc_R	sdivcc 	%r8, %r9, %r5
	.word 0xc8ba1009  ! 634: STDA_R	stda	%r4, [%r8 + %r9] 0x80
	.word 0xcac2219c  ! 635: LDSWA_I	ldswa	[%r8, + 0x019c] %asi, %r5
	.word 0x9efa0009  ! 636: SDIVcc_R	sdivcc 	%r8, %r9, %r15
	.word 0x3e800008  ! 637: BVC	bvc,a	<label_0x8>
	.word 0xf7e21009  ! 638: CASA_I	casa	[%r8] 0x80, %r9, %r27
	.word 0xccb22028  ! 639: STHA_I	stha	%r6, [%r8 + 0x0028] %asi
	.word 0xc9220009  ! 640: STF_R	st	%f4, [%r9, %r8]
	.word 0x8e4a0009  ! 641: MULX_R	mulx 	%r8, %r9, %r7
	.word 0x8143c000  ! 642: STBAR	stbar
	.word 0xc2ea1009  ! 643: LDSTUBA_R	ldstuba	%r1, [%r8 + %r9] 0x80
	.word 0xcc0a0009  ! 644: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0x28800008  ! 645: BLEU	bleu,a	<label_0x8>
	.word 0xb9a20829  ! 646: FADDs	fadds	%f8, %f9, %f28
	.word 0xe86a0009  ! 647: LDSTUB_R	ldstub	%r20, [%r8 + %r9]
	.word 0x8143c000  ! 648: STBAR	stbar
	.word 0x9da208a9  ! 649: FSUBs	fsubs	%f8, %f9, %f14
	.word 0x8143c000  ! 650: STBAR	stbar
	.word 0x87222b48  ! 651: MULScc_I	mulscc 	%r8, 0x0b48, %r3
	.word 0x86f20009  ! 652: UDIVcc_R	udivcc 	%r8, %r9, %r3
	.word 0xc2da1009  ! 653: LDXA_R	ldxa	[%r8, %r9] 0x80, %r1
	.word 0xc36a2db0  ! 654: PREFETCH_I	prefetch	[%r8 + 0x0db0], #one_read
	.word 0x8143c000  ! 655: STBAR	stbar
	.word 0xd4120009  ! 656: LDUH_R	lduh	[%r8 + %r9], %r10
	.word 0xf8ba2068  ! 657: STDA_I	stda	%r28, [%r8 + 0x0068] %asi
	.word 0xc2422788  ! 658: LDSW_I	ldsw	[%r8 + 0x0788], %r1
	.word 0x2aca0004  ! 659: BRNZ	brnz,a,pt	%8,<label_0xa0004>
	.word 0xc2d21009  ! 660: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r1
	.word 0xcc9a2838  ! 661: LDDA_I	ldda	[%r8, + 0x0838] %asi, %r6
	.word 0xc28a1009  ! 663: LDUBA_R	lduba	[%r8, %r9] 0x80, %r1
	.word 0xd8aa2ce8  ! 665: STBA_I	stba	%r12, [%r8 + 0x0ce8] %asi
	.word 0xcea22220  ! 666: STWA_I	stwa	%r7, [%r8 + 0x0220] %asi
	.word 0x8143c000  ! 667: STBAR	stbar
	.word 0xee9229e0  ! 668: LDUHA_I	lduha	[%r8, + 0x09e0] %asi, %r23
	.word 0xc36a245c  ! 669: PREFETCH_I	prefetch	[%r8 + 0x045c], #one_read
	.word 0xceea2664  ! 670: LDSTUBA_I	ldstuba	%r7, [%r8 + 0x0664] %asi
	.word 0xcdf21009  ! 671: CASXA_I	casxa	[%r8] 0x80, %r9, %r6
	.word 0xa45a0009  ! 672: SMUL_R	smul 	%r8, %r9, %r18
	.word 0x8143e075  ! 673: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside | #MemIssue | #Sync 
	.word 0x8cfa28bc  ! 675: SDIVcc_I	sdivcc 	%r8, 0x08bc, %r6
	.word 0xcc5a2b48  ! 676: LDX_I	ldx	[%r8 + 0x0b48], %r6
	.word 0xcbe22009  ! 677: CASA_R	casa	[%r8] %asi, %r9, %r5
	.word 0xd4a22514  ! 678: STWA_I	stwa	%r10, [%r8 + 0x0514] %asi
	.word 0x8a7a248c  ! 679: SDIV_I	sdiv 	%r8, 0x048c, %r5
	.word 0x8afa2b10  ! 680: SDIVcc_I	sdivcc 	%r8, 0x0b10, %r5
	.word 0x26800004  ! 681: BL	bl,a	<label_0x4>
	.word 0x8143e046  ! 682: MEMBAR	membar	#StoreLoad | #LoadStore | #Sync 
	.word 0x36800004  ! 683: BGE	bge,a	<label_0x4>
	.word 0x89a20929  ! 684: FMULs	fmuls	%f8, %f9, %f4
	.word 0x85a20829  ! 685: FADDs	fadds	%f8, %f9, %f2
	.word 0x8cf20009  ! 686: UDIVcc_R	udivcc 	%r8, %r9, %r6
	.word 0xbe722940  ! 687: UDIV_I	udiv 	%r8, 0x0940, %r31
	.word 0xc3ea2988  ! 688: PREFETCHA_I	prefetcha	[%r8, + 0x0988] %asi, #one_read
	.word 0xe282236c  ! 689: LDUWA_I	lduwa	[%r8, + 0x036c] %asi, %r17
	.word 0xf41a0009  ! 690: LDD_R	ldd	[%r8 + %r9], %r26
	.word 0x8143c000  ! 691: STBAR	stbar
	.word 0x9a7a2b58  ! 692: SDIV_I	sdiv 	%r8, 0x0b58, %r13
	.word 0x8143e012  ! 693: MEMBAR	membar	#StoreLoad | #Lookaside 
	.word 0xc8a21009  ! 694: STWA_R	stwa	%r4, [%r8 + %r9] 0x80
	.word 0x866a2af0  ! 695: UDIVX_I	udivx 	%r8, 0x0af0, %r3
	.word 0x8efa2f44  ! 696: SDIVcc_I	sdivcc 	%r8, 0x0f44, %r7
	.word 0x02c20008  ! 697: BRZ	brz  ,nt	%8,<label_0x20008>
	.word 0xcefa2cb0  ! 698: SWAPA_I	swapa	%r7, [%r8 + 0x0cb0] %asi
	.word 0xc2a21009  ! 699: STWA_R	stwa	%r1, [%r8 + %r9] 0x80
	.word 0xc3ea26bc  ! 700: PREFETCHA_I	prefetcha	[%r8, + 0x06bc] %asi, #one_read
	.word 0x8143c000  ! 701: STBAR	stbar
	.word 0x8143c000  ! 702: STBAR	stbar
	.word 0x825a2014  ! 703: SMUL_I	smul 	%r8, 0x0014, %r1
	.word 0xdefa2824  ! 704: SWAPA_I	swapa	%r15, [%r8 + 0x0824] %asi
	.word 0x04800008  ! 705: BLE	ble  	<label_0x8>
	.word 0x8143e031  ! 706: MEMBAR	membar	#LoadLoad | #Lookaside | #MemIssue 
	.word 0xd87a25f4  ! 707: SWAP_I	swap	%r12, [%r8 + 0x05f4]
	.word 0x14800004  ! 708: BG	bg  	<label_0x4>
	.word 0x8cd20009  ! 709: UMULcc_R	umulcc 	%r8, %r9, %r6
	.word 0xb86a0009  ! 710: UDIVX_R	udivx 	%r8, %r9, %r28
	.word 0xc67a0009  ! 711: SWAP_R	swap	%r3, [%r8 + %r9]
	.word 0xcc6a21ac  ! 712: LDSTUB_I	ldstub	%r6, [%r8 + 0x01ac]
	.word 0x825a0009  ! 713: SMUL_R	smul 	%r8, %r9, %r1
	.word 0xc2ea29d0  ! 714: LDSTUBA_I	ldstuba	%r1, [%r8 + 0x09d0] %asi
	.word 0x88720009  ! 715: UDIV_R	udiv 	%r8, %r9, %r4
	.word 0x87a20829  ! 716: FADDs	fadds	%f8, %f9, %f3
	.word 0xe86a21a4  ! 717: LDSTUB_I	ldstub	%r20, [%r8 + 0x01a4]
	.word 0x8143c000  ! 718: STBAR	stbar
	.word 0xc3ea2300  ! 719: PREFETCHA_I	prefetcha	[%r8, + 0x0300] %asi, #one_read
	.word 0x24c20008  ! 720: BRLEZ	brlez,a,nt	%8,<label_0x20008>
	.word 0xed3a0009  ! 721: STDF_R	std	%f22, [%r9, %r8]
	.word 0xecba2320  ! 722: STDA_I	stda	%r22, [%r8 + 0x0320] %asi
	.word 0xa8722c18  ! 723: UDIV_I	udiv 	%r8, 0x0c18, %r20
	.word 0xc2aa1009  ! 726: STBA_R	stba	%r1, [%r8 + %r9] 0x80
	.word 0xcb3a24e0  ! 729: STDF_I	std	%f5, [0x04e0, %r8]
	.word 0xcf3a0009  ! 730: STDF_R	std	%f7, [%r9, %r8]
	.word 0xceaa1009  ! 731: STBA_R	stba	%r7, [%r8 + %r9] 0x80
	.word 0x89a209a9  ! 732: FDIVs	fdivs	%f8, %f9, %f4
	.word 0xc9e21009  ! 733: CASA_I	casa	[%r8] 0x80, %r9, %r4
	.word 0x87a208a9  ! 734: FSUBs	fsubs	%f8, %f9, %f3
	.word 0x83a209a9  ! 735: FDIVs	fdivs	%f8, %f9, %f1
	.word 0xcaa2200c  ! 736: STWA_I	stwa	%r5, [%r8 + 0x000c] %asi
	.word 0xceaa2594  ! 737: STBA_I	stba	%r7, [%r8 + 0x0594] %asi
	.word 0xc7220009  ! 738: STF_R	st	%f3, [%r9, %r8]
	.word 0x0aca0008  ! 739: BRNZ	brnz  ,pt	%8,<label_0xa0008>
	.word 0x845224f0  ! 740: UMUL_I	umul 	%r8, 0x04f0, %r2
	.word 0xc7222f28  ! 741: STF_I	st	%f3, [0x0f28, %r8]
	.word 0xe4fa2134  ! 742: SWAPA_I	swapa	%r18, [%r8 + 0x0134] %asi
	.word 0x24800004  ! 743: BLE	ble,a	<label_0x4>
	.word 0xa2f20009  ! 744: UDIVcc_R	udivcc 	%r8, %r9, %r17
	.word 0xe6d220d0  ! 745: LDSHA_I	ldsha	[%r8, + 0x00d0] %asi, %r19
	.word 0xc4da24a8  ! 746: LDXA_I	ldxa	[%r8, + 0x04a8] %asi, %r2
	.word 0xc3ea2658  ! 747: PREFETCHA_I	prefetcha	[%r8, + 0x0658] %asi, #one_read
	.word 0xc6fa1009  ! 748: SWAPA_R	swapa	%r3, [%r8 + %r9] 0x80
	.word 0x84fa0009  ! 749: SDIVcc_R	sdivcc 	%r8, %r9, %r2
	.word 0xc2a22124  ! 750: STWA_I	stwa	%r1, [%r8 + 0x0124] %asi
	.word 0xccda2108  ! 751: LDXA_I	ldxa	[%r8, + 0x0108] %asi, %r6
	.word 0xd4fa292c  ! 752: SWAPA_I	swapa	%r10, [%r8 + 0x092c] %asi
	.word 0x40000004  ! 754: CALL	call	disp30_4
	.word 0x89a208a9  ! 755: FSUBs	fsubs	%f8, %f9, %f4
	.word 0xccaa2b88  ! 756: STBA_I	stba	%r6, [%r8 + 0x0b88] %asi
	.word 0x20800004  ! 757: BN	bn,a	<label_0x4>
	.word 0x22c20004  ! 759: BRZ	brz,a,nt	%8,<label_0x20004>
	.word 0xc6b22600  ! 760: STHA_I	stha	%r3, [%r8 + 0x0600] %asi
	.word 0xc41a0009  ! 761: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x864a2cd0  ! 762: MULX_I	mulx 	%r8, 0x0cd0, %r3
	.word 0x827a2f9c  ! 763: SDIV_I	sdiv 	%r8, 0x0f9c, %r1
	.word 0xe0ea239c  ! 764: LDSTUBA_I	ldstuba	%r16, [%r8 + 0x039c] %asi
	.word 0x87a208a9  ! 765: FSUBs	fsubs	%f8, %f9, %f3
	.word 0x26ca0008  ! 766: BRLZ	brlz,a,pt	%8,<label_0xa0008>
	.word 0xd8aa25dc  ! 767: STBA_I	stba	%r12, [%r8 + 0x05dc] %asi
	.word 0x865a2b98  ! 768: SMUL_I	smul 	%r8, 0x0b98, %r3
	.word 0x8143c000  ! 769: STBAR	stbar
	.word 0xc4d21009  ! 770: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r2
	.word 0x8fa208a9  ! 771: FSUBs	fsubs	%f8, %f9, %f7
	.word 0xe2c21009  ! 772: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r17
	.word 0x9ba208a9  ! 773: FSUBs	fsubs	%f8, %f9, %f13
	.word 0xc4fa2674  ! 774: SWAPA_I	swapa	%r2, [%r8 + 0x0674] %asi
	.word 0x08800004  ! 775: BLEU	bleu  	<label_0x4>
	.word 0xce8a1009  ! 776: LDUBA_R	lduba	[%r8, %r9] 0x80, %r7
	.word 0x1e800004  ! 777: BVC	bvc  	<label_0x4>
	.word 0xc86a0009  ! 778: LDSTUB_R	ldstub	%r4, [%r8 + %r9]
	.word 0x3a800008  ! 779: BCC	bcc,a	<label_0x8>
	.word 0x3c800004  ! 780: BPOS	bpos,a	<label_0x4>
	.word 0xc86a260c  ! 781: LDSTUB_I	ldstub	%r4, [%r8 + 0x060c]
	.word 0x0ac20004  ! 782: BRNZ	brnz  ,nt	%8,<label_0x20004>
	.word 0x8eda2070  ! 783: SMULcc_I	smulcc 	%r8, 0x0070, %r7
	.word 0x83a20829  ! 784: FADDs	fadds	%f8, %f9, %f1
	.word 0x884a0009  ! 785: MULX_R	mulx 	%r8, %r9, %r4
	.word 0xc2b21009  ! 786: STHA_R	stha	%r1, [%r8 + %r9] 0x80
	.word 0x8143e074  ! 787: MEMBAR	membar	#LoadStore | #Lookaside | #MemIssue | #Sync 
	.word 0xf6122dcc  ! 788: LDUH_I	lduh	[%r8 + 0x0dcc], %r27
	.word 0xcbe22009  ! 789: CASA_R	casa	[%r8] %asi, %r9, %r5
	.word 0xd8aa24dc  ! 790: STBA_I	stba	%r12, [%r8 + 0x04dc] %asi
	.word 0xd4f22dd0  ! 791: STXA_I	stxa	%r10, [%r8 + 0x0dd0] %asi
	.word 0xc67a2638  ! 792: SWAP_I	swap	%r3, [%r8 + 0x0638]
	.word 0x847a2904  ! 793: SDIV_I	sdiv 	%r8, 0x0904, %r2
	.word 0x856a0009  ! 794: SDIVX_R	sdivx	%r8, %r9, %r2
	.word 0xd4ba1009  ! 795: STDA_R	stda	%r10, [%r8 + %r9] 0x80
	.word 0xc3ea2030  ! 796: PREFETCHA_I	prefetcha	[%r8, + 0x0030] %asi, #one_read
	.word 0x8c7a0009  ! 797: SDIV_R	sdiv 	%r8, %r9, %r6
	.word 0x8143c000  ! 798: STBAR	stbar
	.word 0xc2fa2040  ! 799: SWAPA_I	swapa	%r1, [%r8 + 0x0040] %asi
	.word 0xcc020009  ! 800: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0x8ba20929  ! 801: FMULs	fmuls	%f8, %f9, %f5
	.word 0x866a0009  ! 802: UDIVX_R	udivx 	%r8, %r9, %r3
	.word 0xcdf21009  ! 803: CASXA_I	casxa	[%r8] 0x80, %r9, %r6
	.word 0x06ca0004  ! 804: BRLZ	brlz  ,pt	%8,<label_0xa0004>
	.word 0x876a2388  ! 805: SDIVX_I	sdivx	%r8, 0x0388, %r3
	.word 0x12800004  ! 806: BNE	bne  	<label_0x4>
	.word 0x8f220009  ! 807: MULScc_R	mulscc 	%r8, %r9, %r7
	.word 0xc3ea2a88  ! 808: PREFETCHA_I	prefetcha	[%r8, + 0x0a88] %asi, #one_read
	.word 0xc4ba2ab8  ! 809: STDA_I	stda	%r2, [%r8 + 0x0ab8] %asi
	.word 0x87a20829  ! 810: FADDs	fadds	%f8, %f9, %f3
	.word 0x845a241c  ! 811: SMUL_I	smul 	%r8, 0x041c, %r2
	.word 0xc2fa25cc  ! 812: SWAPA_I	swapa	%r1, [%r8 + 0x05cc] %asi
	.word 0x8a7a2638  ! 813: SDIV_I	sdiv 	%r8, 0x0638, %r5
	.word 0xcec21009  ! 814: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r7
	.word 0xfc1a0009  ! 815: LDD_R	ldd	[%r8 + %r9], %r30
	.word 0xc2d22678  ! 816: LDSHA_I	ldsha	[%r8, + 0x0678] %asi, %r1
	.word 0xd40a29cc  ! 818: LDUB_I	ldub	[%r8 + 0x09cc], %r10
	.word 0xaba20829  ! 819: FADDs	fadds	%f8, %f9, %f21
	.word 0x8eda0009  ! 820: SMULcc_R	smulcc 	%r8, %r9, %r7
	.word 0x8143c000  ! 821: STBAR	stbar
	.word 0xc4821009  ! 822: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r2
	.word 0xd8d21009  ! 823: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r12
	.word 0xccb22f20  ! 824: STHA_I	stha	%r6, [%r8 + 0x0f20] %asi
	.word 0x88d20009  ! 825: UMULcc_R	umulcc 	%r8, %r9, %r4
	.word 0xd53a0009  ! 826: STDF_R	std	%f10, [%r9, %r8]
	.word 0x887a0009  ! 827: SDIV_R	sdiv 	%r8, %r9, %r4
	.word 0xca7a0009  ! 828: SWAP_R	swap	%r5, [%r8 + %r9]
	.word 0xca0a0009  ! 829: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xa65a0009  ! 830: SMUL_R	smul 	%r8, %r9, %r19
	.word 0x88da0009  ! 831: SMULcc_R	smulcc 	%r8, %r9, %r4
	.word 0xc87a2ff8  ! 832: SWAP_I	swap	%r4, [%r8 + 0x0ff8]
	.word 0xc93a20b8  ! 833: STDF_I	std	%f4, [0x00b8, %r8]
	.word 0xe8ba2950  ! 834: STDA_I	stda	%r20, [%r8 + 0x0950] %asi
	.word 0xc36a28f0  ! 835: PREFETCH_I	prefetch	[%r8 + 0x08f0], #one_read
	.word 0xc4aa1009  ! 838: STBA_R	stba	%r2, [%r8 + %r9] 0x80
	.word 0xca7a0009  ! 840: SWAP_R	swap	%r5, [%r8 + %r9]
	.word 0xceda1009  ! 841: LDXA_R	ldxa	[%r8, %r9] 0x80, %r7
	.word 0x14800004  ! 842: BG	bg  	<label_0x4>
	.word 0xc4fa2bc0  ! 843: SWAPA_I	swapa	%r2, [%r8 + 0x0bc0] %asi
	.word 0x8143e041  ! 844: MEMBAR	membar	#LoadLoad | #Sync 
	.word 0xdeea1009  ! 847: LDSTUBA_R	ldstuba	%r15, [%r8 + %r9] 0x80
	.word 0xc6b21009  ! 848: STHA_R	stha	%r3, [%r8 + %r9] 0x80
	.word 0xdcba1009  ! 849: STDA_R	stda	%r14, [%r8 + %r9] 0x80
	.word 0x82720009  ! 850: UDIV_R	udiv 	%r8, %r9, %r1
	.word 0x8143c000  ! 851: STBAR	stbar
	.word 0x8143c000  ! 852: STBAR	stbar
	.word 0xc36a26e4  ! 853: PREFETCH_I	prefetch	[%r8 + 0x06e4], #one_read
	.word 0xc3e22009  ! 854: CASA_R	casa	[%r8] %asi, %r9, %r1
	.word 0x88d20009  ! 856: UMULcc_R	umulcc 	%r8, %r9, %r4
	.word 0xaba20929  ! 857: FMULs	fmuls	%f8, %f9, %f21
	.word 0x82522c78  ! 858: UMUL_I	umul 	%r8, 0x0c78, %r1
	.word 0x83a20929  ! 859: FMULs	fmuls	%f8, %f9, %f1
	.word 0x8143e01b  ! 860: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Lookaside 
	.word 0x8efa2f24  ! 861: SDIVcc_I	sdivcc 	%r8, 0x0f24, %r7
	.word 0xff3a27f8  ! 862: STDF_I	std	%f31, [0x07f8, %r8]
	.word 0xc2f21009  ! 863: STXA_R	stxa	%r1, [%r8 + %r9] 0x80
	.word 0x987a2294  ! 864: SDIV_I	sdiv 	%r8, 0x0294, %r12
	.word 0x8da20929  ! 865: FMULs	fmuls	%f8, %f9, %f6
	.word 0x8a5227dc  ! 866: UMUL_I	umul 	%r8, 0x07dc, %r5
	.word 0x82da0009  ! 867: SMULcc_R	smulcc 	%r8, %r9, %r1
	.word 0xc36a24e4  ! 868: PREFETCH_I	prefetch	[%r8 + 0x04e4], #one_read
	.word 0xca022e3c  ! 869: LDUW_I	lduw	[%r8 + 0x0e3c], %r5
	.word 0x8a6a0009  ! 870: UDIVX_R	udivx 	%r8, %r9, %r5
	.word 0x8a7a2034  ! 871: SDIV_I	sdiv 	%r8, 0x0034, %r5
	.word 0x8143e061  ! 872: MEMBAR	membar	#LoadLoad | #MemIssue | #Sync 
	.word 0xf01a2d10  ! 873: LDD_I	ldd	[%r8 + 0x0d10], %r24
	.word 0xc6aa1009  ! 875: STBA_R	stba	%r3, [%r8 + %r9] 0x80
	.word 0x0cca0004  ! 876: BRGZ	brgz  ,pt	%8,<label_0xa0004>
	.word 0xc80a0009  ! 877: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0x836a21ac  ! 878: SDIVX_I	sdivx	%r8, 0x01ac, %r1
	.word 0x8da208a9  ! 879: FSUBs	fsubs	%f8, %f9, %f6
	.word 0xc66a0009  ! 881: LDSTUB_R	ldstub	%r3, [%r8 + %r9]
	.word 0xbcd20009  ! 882: UMULcc_R	umulcc 	%r8, %r9, %r30
	.word 0xc4a21009  ! 883: STWA_R	stwa	%r2, [%r8 + %r9] 0x80
	.word 0x30800004  ! 884: BA	ba,a	<label_0x4>
	.word 0xd6ca2904  ! 885: LDSBA_I	ldsba	[%r8, + 0x0904] %asi, %r11
	.word 0x87a209a9  ! 886: FDIVs	fdivs	%f8, %f9, %f3
	.word 0x8143c000  ! 887: STBAR	stbar
	.word 0xccf21009  ! 888: STXA_R	stxa	%r6, [%r8 + %r9] 0x80
	.word 0x846a2188  ! 889: UDIVX_I	udivx 	%r8, 0x0188, %r2
	.word 0xc6420009  ! 890: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0x12800008  ! 891: BNE	bne  	<label_0x8>
	.word 0xc4ba2628  ! 892: STDA_I	stda	%r2, [%r8 + 0x0628] %asi
	.word 0xec6a2db4  ! 893: LDSTUB_I	ldstub	%r22, [%r8 + 0x0db4]
	.word 0xae4a0009  ! 894: MULX_R	mulx 	%r8, %r9, %r23
	.word 0xc4aa2dd4  ! 895: STBA_I	stba	%r2, [%r8 + 0x0dd4] %asi
	.word 0xca4a2c08  ! 896: LDSB_I	ldsb	[%r8 + 0x0c08], %r5
	.word 0xd5222f2c  ! 897: STF_I	st	%f10, [0x0f2c, %r8]
	.word 0xc48a1009  ! 898: LDUBA_R	lduba	[%r8, %r9] 0x80, %r2
	.word 0xc8fa2970  ! 899: SWAPA_I	swapa	%r4, [%r8 + 0x0970] %asi
	.word 0xc36a2c94  ! 900: PREFETCH_I	prefetch	[%r8 + 0x0c94], #one_read
	.word 0x8afa0009  ! 902: SDIVcc_R	sdivcc 	%r8, %r9, %r5
	.word 0x8143c000  ! 903: STBAR	stbar
	.word 0x8d6a0009  ! 904: SDIVX_R	sdivx	%r8, %r9, %r6
	.word 0xb8d22cd8  ! 905: UMULcc_I	umulcc 	%r8, 0x0cd8, %r28
	.word 0xede22009  ! 907: CASA_R	casa	[%r8] %asi, %r9, %r22
	.word 0x8143c000  ! 908: STBAR	stbar
	.word 0xf4a21009  ! 909: STWA_R	stwa	%r26, [%r8 + %r9] 0x80
	.word 0xdcea1009  ! 911: LDSTUBA_R	ldstuba	%r14, [%r8 + %r9] 0x80
	.word 0xc2fa1009  ! 912: SWAPA_R	swapa	%r1, [%r8 + %r9] 0x80
	.word 0x40000004  ! 913: CALL	call	disp30_4
	.word 0x8afa0009  ! 914: SDIVcc_R	sdivcc 	%r8, %r9, %r5
	.word 0xc85a2c10  ! 915: LDX_I	ldx	[%r8 + 0x0c10], %r4
	.word 0xa7a209a9  ! 916: FDIVs	fdivs	%f8, %f9, %f19
	.word 0xc3f22009  ! 917: CASXA_R	casxa	[%r8]%asi, %r9, %r1
	.word 0xf2da1009  ! 918: LDXA_R	ldxa	[%r8, %r9] 0x80, %r25
	.word 0xc3ea2718  ! 919: PREFETCHA_I	prefetcha	[%r8, + 0x0718] %asi, #one_read
	.word 0x2aca0008  ! 920: BRNZ	brnz,a,pt	%8,<label_0xa0008>
	.word 0xca4a0009  ! 921: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xe01a0009  ! 922: LDD_R	ldd	[%r8 + %r9], %r16
	.word 0x28800004  ! 923: BLEU	bleu,a	<label_0x4>
	.word 0xc5e21009  ! 924: CASA_I	casa	[%r8] 0x80, %r9, %r2
	.word 0xc25223e8  ! 925: LDSH_I	ldsh	[%r8 + 0x03e8], %r1
	.word 0x40000004  ! 926: CALL	call	disp30_4
	.word 0x8a7a2120  ! 927: SDIV_I	sdiv 	%r8, 0x0120, %r5
	.word 0x88520009  ! 928: UMUL_R	umul 	%r8, %r9, %r4
	.word 0xc4fa1009  ! 929: SWAPA_R	swapa	%r2, [%r8 + %r9] 0x80
	.word 0x8143e037  ! 930: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside | #MemIssue 
	.word 0xcf220009  ! 931: STF_R	st	%f7, [%r9, %r8]
	.word 0xad220009  ! 932: MULScc_R	mulscc 	%r8, %r9, %r22
	.word 0xceaa2f48  ! 933: STBA_I	stba	%r7, [%r8 + 0x0f48] %asi
	.word 0xc36a2554  ! 934: PREFETCH_I	prefetch	[%r8 + 0x0554], #one_read
	.word 0xec0a29d4  ! 935: LDUB_I	ldub	[%r8 + 0x09d4], %r22
	.word 0x8e7a0009  ! 936: SDIV_R	sdiv 	%r8, %r9, %r7
	.word 0x8efa0009  ! 937: SDIVcc_R	sdivcc 	%r8, %r9, %r7
	.word 0xc4ba2590  ! 938: STDA_I	stda	%r2, [%r8 + 0x0590] %asi
	.word 0x89a209a9  ! 939: FDIVs	fdivs	%f8, %f9, %f4
	.word 0xb5a20829  ! 940: FADDs	fadds	%f8, %f9, %f26
	.word 0xb8fa21e4  ! 941: SDIVcc_I	sdivcc 	%r8, 0x01e4, %r28
	.word 0x20800004  ! 942: BN	bn,a	<label_0x4>
	.word 0x896a29d4  ! 943: SDIVX_I	sdivx	%r8, 0x09d4, %r4
	.word 0x846a0009  ! 944: UDIVX_R	udivx 	%r8, %r9, %r2
	.word 0xc20a0009  ! 946: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0x8143e073  ! 947: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside | #MemIssue | #Sync 
	.word 0xcfe21009  ! 948: CASA_I	casa	[%r8] 0x80, %r9, %r7
	.word 0xc73a2a98  ! 949: STDF_I	std	%f3, [0x0a98, %r8]
	.word 0xef220009  ! 950: STF_R	st	%f23, [%r9, %r8]
	.word 0x82720009  ! 951: UDIV_R	udiv 	%r8, %r9, %r1
	.word 0xd4ba1009  ! 952: STDA_R	stda	%r10, [%r8 + %r9] 0x80
	.word 0xc36a2acc  ! 953: PREFETCH_I	prefetch	[%r8 + 0x0acc], #one_read
	.word 0xceb22788  ! 954: STHA_I	stha	%r7, [%r8 + 0x0788] %asi
	.word 0x8143c000  ! 955: STBAR	stbar
	.word 0x8143c000  ! 956: STBAR	stbar
	.word 0xc87a2b24  ! 957: SWAP_I	swap	%r4, [%r8 + 0x0b24]
	.word 0x1c800004  ! 958: BPOS	bpos  	<label_0x4>
	.word 0xcefa241c  ! 962: SWAPA_I	swapa	%r7, [%r8 + 0x041c] %asi
	.word 0x89a20929  ! 963: FMULs	fmuls	%f8, %f9, %f4
	.word 0xf6aa1009  ! 964: STBA_R	stba	%r27, [%r8 + %r9] 0x80
	.word 0x8cf20009  ! 965: UDIVcc_R	udivcc 	%r8, %r9, %r6
	.word 0x82da0009  ! 966: SMULcc_R	smulcc 	%r8, %r9, %r1
	.word 0x12800004  ! 967: BNE	bne  	<label_0x4>
	.word 0x9e4a2d58  ! 968: MULX_I	mulx 	%r8, 0x0d58, %r15
	.word 0xb0f20009  ! 969: UDIVcc_R	udivcc 	%r8, %r9, %r24
	.word 0xc36a2ad8  ! 970: PREFETCH_I	prefetch	[%r8 + 0x0ad8], #one_read
	.word 0xc4fa2f88  ! 972: SWAPA_I	swapa	%r2, [%r8 + 0x0f88] %asi
	.word 0xc4aa1009  ! 973: STBA_R	stba	%r2, [%r8 + %r9] 0x80
	.word 0xf5222b20  ! 974: STF_I	st	%f26, [0x0b20, %r8]
	.word 0xcc122f94  ! 975: LDUH_I	lduh	[%r8 + 0x0f94], %r6
	.word 0xf4ca1009  ! 976: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r26
	.word 0xc80a0009  ! 977: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0x8ba20929  ! 978: FMULs	fmuls	%f8, %f9, %f5
	.word 0xc73a0009  ! 979: STDF_R	std	%f3, [%r9, %r8]
	.word 0x10800008  ! 980: BA	ba  	<label_0x8>
	.word 0xc41a2400  ! 981: LDD_I	ldd	[%r8 + 0x0400], %r2
	.word 0xaa4a0009  ! 983: MULX_R	mulx 	%r8, %r9, %r21
	.word 0x8143e03a  ! 984: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside | #MemIssue 
	.word 0xcc120009  ! 985: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xec9a1009  ! 986: LDDA_R	ldda	[%r8, %r9] 0x80, %r22
	.word 0xc4522f4c  ! 987: LDSH_I	ldsh	[%r8 + 0x0f4c], %r2
	.word 0x866a2fc4  ! 988: UDIVX_I	udivx 	%r8, 0x0fc4, %r3
	.word 0xfd220009  ! 989: STF_R	st	%f30, [%r9, %r8]
	.word 0x02ca0008  ! 990: BRZ	brz  ,pt	%8,<label_0xa0008>
	.word 0xc202296c  ! 991: LDUW_I	lduw	[%r8 + 0x096c], %r1
	.word 0xc5222c44  ! 992: STF_I	st	%f2, [0x0c44, %r8]
	.word 0x8143e04e  ! 993: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Sync 
	.word 0xc36a23dc  ! 994: PREFETCH_I	prefetch	[%r8 + 0x03dc], #one_read
	.word 0xeca21009  ! 996: STWA_R	stwa	%r22, [%r8 + %r9] 0x80
	.word 0x8143e05a  ! 997: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside | #Sync 
	.word 0x845a0009  ! 998: SMUL_R	smul 	%r8, %r9, %r2
	.word 0x82f22078  ! 999: UDIVcc_I	udivcc 	%r8, 0x0078, %r1
        ta      T_GOOD_TRAP

th_main_2:
        setx  MAIN_BASE_DATA_VA, %r1, %r8
        setx  0x00000000000006a0, %g1, %r9
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
        setx  0x57bd5e2d77cb3910, %g1, %r0
        setx  0xf4d04b57fba85c92, %g1, %r1
        setx  0xa1189ae11f358797, %g1, %r2
        setx  0x32ef937c5c014dc0, %g1, %r3
        setx  0x737c4ca4a7b85d36, %g1, %r4
        setx  0x2dd1e5db8281edc8, %g1, %r5
        setx  0x911ac1f27c1ad166, %g1, %r6
        setx  0xb8502d32f1a91c9d, %g1, %r7
        setx  0xd9dd35096de22c17, %g1, %r10
        setx  0x777263baaf94361f, %g1, %r11
        setx  0x76a93392f93f3fef, %g1, %r12
        setx  0x69e31103fe10e37d, %g1, %r13
        setx  0x39b1ecc49b87167d, %g1, %r14
        setx  0xa02dc567b149b19b, %g1, %r15
        setx  0x3e34619a5b92d1bd, %g1, %r16
        setx  0x875adcb60d95992a, %g1, %r17
        setx  0xc9791ad063ca7704, %g1, %r18
        setx  0x3242d15aabd6f6ca, %g1, %r19
        setx  0xf7fa47cdc6613d50, %g1, %r20
        setx  0x3fb2a00a2e182e5d, %g1, %r21
        setx  0x26489dfd861c8359, %g1, %r22
        setx  0xff02777d0f8a6fef, %g1, %r23
        setx  0x1bf2bd37542a8120, %g1, %r24
        setx  0xb6d3ce4a7c8d109f, %g1, %r25
        setx  0x248a6f2b03a57bdc, %g1, %r26
        setx  0x3940d463c08e97de, %g1, %r27
        setx  0x019201c03d4da772, %g1, %r28
        setx  0xbb0b8615616c30cc, %g1, %r29
        setx  0x20f9ea61f99beaab, %g1, %r30
        setx  0xebfe94900fe5ff51, %g1, %r31
	.word 0x8d6a0009  ! 6: SDIVX_R	sdivx	%r8, %r9, %r6
	.word 0x85a20929  ! 7: FMULs	fmuls	%f8, %f9, %f2
	.word 0xdc7a0009  ! 8: SWAP_R	swap	%r14, [%r8 + %r9]
	.word 0xb4d22f0c  ! 9: UMULcc_I	umulcc 	%r8, 0x0f0c, %r26
	.word 0xe13a2cb0  ! 10: STDF_I	std	%f16, [0x0cb0, %r8]
	.word 0xd6d21009  ! 11: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r11
	.word 0x836a23fc  ! 12: SDIVX_I	sdivx	%r8, 0x03fc, %r1
	.word 0xac720009  ! 13: UDIV_R	udiv 	%r8, %r9, %r22
	.word 0x8a4a0009  ! 14: MULX_R	mulx 	%r8, %r9, %r5
	.word 0xd6a21009  ! 15: STWA_R	stwa	%r11, [%r8 + %r9] 0x80
	.word 0x2a800004  ! 16: BCS	bcs,a	<label_0x4>
	.word 0x83a209a9  ! 17: FDIVs	fdivs	%f8, %f9, %f1
	.word 0xc4f22070  ! 18: STXA_I	stxa	%r2, [%r8 + 0x0070] %asi
	.word 0x8143e06b  ! 19: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #MemIssue | #Sync 
	.word 0xc3ea2fcc  ! 20: PREFETCHA_I	prefetcha	[%r8, + 0x0fcc] %asi, #one_read
	.word 0x95a208a9  ! 21: FSUBs	fsubs	%f8, %f9, %f10
	.word 0xe4ba1009  ! 22: STDA_R	stda	%r18, [%r8 + %r9] 0x80
	.word 0xc64a2c38  ! 23: LDSB_I	ldsb	[%r8 + 0x0c38], %r3
	.word 0xdcaa2228  ! 24: STBA_I	stba	%r14, [%r8 + 0x0228] %asi
	.word 0x896a2414  ! 25: SDIVX_I	sdivx	%r8, 0x0414, %r4
	.word 0xcc122470  ! 26: LDUH_I	lduh	[%r8 + 0x0470], %r6
	.word 0x8efa0009  ! 27: SDIVcc_R	sdivcc 	%r8, %r9, %r7
	.word 0x36800004  ! 28: BGE	bge,a	<label_0x4>
	.word 0x26800004  ! 29: BL	bl,a	<label_0x4>
	.word 0xcc822a2c  ! 30: LDUWA_I	lduwa	[%r8, + 0x0a2c] %asi, %r6
	.word 0x20800004  ! 31: BN	bn,a	<label_0x4>
	.word 0xd44a21d4  ! 32: LDSB_I	ldsb	[%r8 + 0x01d4], %r10
	.word 0x2c800004  ! 33: BNEG	bneg,a	<label_0x4>
	.word 0xc3ea2594  ! 34: PREFETCHA_I	prefetcha	[%r8, + 0x0594] %asi, #one_read
	.word 0xda7a21e0  ! 35: SWAP_I	swap	%r13, [%r8 + 0x01e0]
	.word 0xcad22478  ! 36: LDSHA_I	ldsha	[%r8, + 0x0478] %asi, %r5
	.word 0x06800004  ! 37: BL	bl  	<label_0x4>
	.word 0x885a2100  ! 38: SMUL_I	smul 	%r8, 0x0100, %r4
	.word 0xb3220009  ! 40: MULScc_R	mulscc 	%r8, %r9, %r25
	.word 0xc4120009  ! 41: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xeaa22e98  ! 42: STWA_I	stwa	%r21, [%r8 + 0x0e98] %asi
	.word 0xe9220009  ! 43: STF_R	st	%f20, [%r9, %r8]
	.word 0xc5f21009  ! 44: CASXA_I	casxa	[%r8] 0x80, %r9, %r2
	.word 0x40000004  ! 45: CALL	call	disp30_4
	.word 0x2e800004  ! 46: BVS	bvs,a	<label_0x4>
	.word 0x9c522a38  ! 47: UMUL_I	umul 	%r8, 0x0a38, %r14
	.word 0x8143e020  ! 48: MEMBAR	membar	#MemIssue 
	.word 0x00800004  ! 49: BN	bn  	<label_0x4>
	.word 0x8143c000  ! 50: STBAR	stbar
	.word 0xd9220009  ! 51: STF_R	st	%f12, [%r9, %r8]
	.word 0xc3ea24f0  ! 52: PREFETCHA_I	prefetcha	[%r8, + 0x04f0] %asi, #one_read
	.word 0xc66a2b18  ! 53: LDSTUB_I	ldstub	%r3, [%r8 + 0x0b18]
	.word 0xccca2d68  ! 55: LDSBA_I	ldsba	[%r8, + 0x0d68] %asi, %r6
	.word 0xccfa1009  ! 60: SWAPA_R	swapa	%r6, [%r8 + %r9] 0x80
	.word 0x8143e03c  ! 61: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0x8143c000  ! 62: STBAR	stbar
	.word 0x86d2239c  ! 63: UMULcc_I	umulcc 	%r8, 0x039c, %r3
	.word 0x8a5a23ac  ! 64: SMUL_I	smul 	%r8, 0x03ac, %r5
	.word 0xd6520009  ! 65: LDSH_R	ldsh	[%r8 + %r9], %r11
	.word 0x08800004  ! 66: BLEU	bleu  	<label_0x4>
	.word 0x827a2e8c  ! 67: SDIV_I	sdiv 	%r8, 0x0e8c, %r1
	.word 0xda420009  ! 68: LDSW_R	ldsw	[%r8 + %r9], %r13
	.word 0xc3ea2eb4  ! 69: PREFETCHA_I	prefetcha	[%r8, + 0x0eb4] %asi, #one_read
	.word 0x8143c000  ! 70: STBAR	stbar
	.word 0x867a2854  ! 71: SDIV_I	sdiv 	%r8, 0x0854, %r3
	.word 0xb64a2610  ! 73: MULX_I	mulx 	%r8, 0x0610, %r27
	.word 0x12800004  ! 74: BNE	bne  	<label_0x4>
	.word 0xf8122054  ! 75: LDUH_I	lduh	[%r8 + 0x0054], %r28
	.word 0xbd6a26b8  ! 76: SDIVX_I	sdivx	%r8, 0x06b8, %r30
	.word 0x8af22d7c  ! 77: UDIVcc_I	udivcc 	%r8, 0x0d7c, %r5
	.word 0xf2c228c4  ! 78: LDSWA_I	ldswa	[%r8, + 0x08c4] %asi, %r25
	.word 0x0a800004  ! 80: BCS	bcs  	<label_0x4>
	.word 0xc93a2680  ! 81: STDF_I	std	%f4, [0x0680, %r8]
	.word 0xca7a0009  ! 82: SWAP_R	swap	%r5, [%r8 + %r9]
	.word 0xc36a2f28  ! 83: PREFETCH_I	prefetch	[%r8 + 0x0f28], #one_read
	.word 0xcb222eac  ! 84: STF_I	st	%f5, [0x0eac, %r8]
	.word 0xe8fa1009  ! 85: SWAPA_R	swapa	%r20, [%r8 + %r9] 0x80
	.word 0x36800004  ! 87: BGE	bge,a	<label_0x4>
	.word 0xeab21009  ! 88: STHA_R	stha	%r21, [%r8 + %r9] 0x80
	.word 0xd4f21009  ! 90: STXA_R	stxa	%r10, [%r8 + %r9] 0x80
	.word 0x3e800004  ! 91: BVC	bvc,a	<label_0x4>
	.word 0xc2fa2dcc  ! 92: SWAPA_I	swapa	%r1, [%r8 + 0x0dcc] %asi
	.word 0x8ba209a9  ! 93: FDIVs	fdivs	%f8, %f9, %f5
	.word 0xa3a209a9  ! 95: FDIVs	fdivs	%f8, %f9, %f17
	.word 0x84f223bc  ! 96: UDIVcc_I	udivcc 	%r8, 0x03bc, %r2
	.word 0x12800004  ! 97: BNE	bne  	<label_0x4>
	.word 0x8143e037  ! 98: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside | #MemIssue 
	.word 0x8a522848  ! 99: UMUL_I	umul 	%r8, 0x0848, %r5
	.word 0x1e800008  ! 100: BVC	bvc  	<label_0x8>
	.word 0x8e7a2db0  ! 101: SDIV_I	sdiv 	%r8, 0x0db0, %r7
	.word 0x04c20004  ! 102: BRLEZ	brlez  ,nt	%8,<label_0x20004>
	.word 0xe8d21009  ! 103: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r20
	.word 0x9cf224e4  ! 104: UDIVcc_I	udivcc 	%r8, 0x04e4, %r14
	.word 0x8143e077  ! 105: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside | #MemIssue | #Sync 
	.word 0xc3ea2ba0  ! 106: PREFETCHA_I	prefetcha	[%r8, + 0x0ba0] %asi, #one_read
	.word 0xca8225f0  ! 107: LDUWA_I	lduwa	[%r8, + 0x05f0] %asi, %r5
	.word 0xc6420009  ! 108: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0x83220009  ! 109: MULScc_R	mulscc 	%r8, %r9, %r1
	.word 0x8143c000  ! 110: STBAR	stbar
	.word 0xc46a29ec  ! 111: LDSTUB_I	ldstub	%r2, [%r8 + 0x09ec]
	.word 0xd41a2e30  ! 112: LDD_I	ldd	[%r8 + 0x0e30], %r10
	.word 0xfa5a2de0  ! 113: LDX_I	ldx	[%r8 + 0x0de0], %r29
	.word 0xc81227f0  ! 114: LDUH_I	lduh	[%r8 + 0x07f0], %r4
	.word 0xba7a2974  ! 116: SDIV_I	sdiv 	%r8, 0x0974, %r29
	.word 0x8c4a0009  ! 118: MULX_R	mulx 	%r8, %r9, %r6
	.word 0xcb3a0009  ! 119: STDF_R	std	%f5, [%r9, %r8]
	.word 0xb9a20829  ! 120: FADDs	fadds	%f8, %f9, %f28
	.word 0x8143c000  ! 121: STBAR	stbar
	.word 0xe44a0009  ! 122: LDSB_R	ldsb	[%r8 + %r9], %r18
	.word 0x28800004  ! 123: BLEU	bleu,a	<label_0x4>
	.word 0x827a2430  ! 124: SDIV_I	sdiv 	%r8, 0x0430, %r1
	.word 0xc2d2253c  ! 125: LDSHA_I	ldsha	[%r8, + 0x053c] %asi, %r1
	.word 0xa1a20929  ! 126: FMULs	fmuls	%f8, %f9, %f16
	.word 0xcaf21009  ! 127: STXA_R	stxa	%r5, [%r8 + %r9] 0x80
	.word 0xc2020009  ! 128: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0x20800008  ! 129: BN	bn,a	<label_0x8>
	.word 0x1e800004  ! 130: BVC	bvc  	<label_0x4>
	.word 0x82da2f94  ! 131: SMULcc_I	smulcc 	%r8, 0x0f94, %r1
	.word 0xd7222880  ! 132: STF_I	st	%f11, [0x0880, %r8]
	.word 0x0ec20004  ! 133: BRGEZ	brgez  ,nt	%8,<label_0x20004>
	.word 0xc36a2d08  ! 134: PREFETCH_I	prefetch	[%r8 + 0x0d08], #one_read
	.word 0x8a522424  ! 135: UMUL_I	umul 	%r8, 0x0424, %r5
	.word 0xc3f21009  ! 136: CASXA_I	casxa	[%r8] 0x80, %r9, %r1
	.word 0x85a20829  ! 137: FADDs	fadds	%f8, %f9, %f2
	.word 0xfc1a2fc0  ! 138: LDD_I	ldd	[%r8 + 0x0fc0], %r30
	.word 0xcc9229e8  ! 139: LDUHA_I	lduha	[%r8, + 0x09e8] %asi, %r6
	.word 0x82da2064  ! 140: SMULcc_I	smulcc 	%r8, 0x0064, %r1
	.word 0x946a0009  ! 141: UDIVX_R	udivx 	%r8, %r9, %r10
	.word 0xc67a2588  ! 142: SWAP_I	swap	%r3, [%r8 + 0x0588]
	.word 0x8af228ec  ! 143: UDIVcc_I	udivcc 	%r8, 0x08ec, %r5
	.word 0xcab21009  ! 144: STHA_R	stha	%r5, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 145: STBAR	stbar
	.word 0xce5a0009  ! 146: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0x18800004  ! 147: BGU	bgu  	<label_0x4>
	.word 0xc3ea228c  ! 148: PREFETCHA_I	prefetcha	[%r8, + 0x028c] %asi, #one_read
	.word 0x8a720009  ! 149: UDIV_R	udiv 	%r8, %r9, %r5
	.word 0x846a21c0  ! 150: UDIVX_I	udivx 	%r8, 0x01c0, %r2
	.word 0xceea2620  ! 151: LDSTUBA_I	ldstuba	%r7, [%r8 + 0x0620] %asi
	.word 0x8ba208a9  ! 152: FSUBs	fsubs	%f8, %f9, %f5
	.word 0x2ac20004  ! 153: BRNZ	brnz,a,nt	%8,<label_0x20004>
	.word 0xc88a1009  ! 154: LDUBA_R	lduba	[%r8, %r9] 0x80, %r4
	.word 0x26ca0008  ! 155: BRLZ	brlz,a,pt	%8,<label_0xa0008>
	.word 0x8143c000  ! 156: STBAR	stbar
	.word 0x8143c000  ! 157: STBAR	stbar
	.word 0xcc420009  ! 158: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xc3e21009  ! 159: CASA_I	casa	[%r8] 0x80, %r9, %r1
	.word 0xcef228d0  ! 160: STXA_I	stxa	%r7, [%r8 + 0x08d0] %asi
	.word 0xc36a2564  ! 161: PREFETCH_I	prefetch	[%r8 + 0x0564], #one_read
	.word 0xf05a2e80  ! 162: LDX_I	ldx	[%r8 + 0x0e80], %r24
	.word 0xcaf22658  ! 163: STXA_I	stxa	%r5, [%r8 + 0x0658] %asi
	.word 0xac5221ec  ! 165: UMUL_I	umul 	%r8, 0x01ec, %r22
	.word 0xbafa0009  ! 166: SDIVcc_R	sdivcc 	%r8, %r9, %r29
	.word 0xfeaa25a0  ! 167: STBA_I	stba	%r31, [%r8 + 0x05a0] %asi
	.word 0xf4ea2a1c  ! 168: LDSTUBA_I	ldstuba	%r26, [%r8 + 0x0a1c] %asi
	.word 0xc44a0009  ! 169: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0x9e6a0009  ! 170: UDIVX_R	udivx 	%r8, %r9, %r15
	.word 0xc53a0009  ! 171: STDF_R	std	%f2, [%r9, %r8]
	.word 0xfb3a0009  ! 172: STDF_R	std	%f29, [%r9, %r8]
	.word 0xc86a2288  ! 174: LDSTUB_I	ldstub	%r4, [%r8 + 0x0288]
	.word 0x844a0009  ! 175: MULX_R	mulx 	%r8, %r9, %r2
	.word 0x36800004  ! 176: BGE	bge,a	<label_0x4>
	.word 0xd8ba2708  ! 177: STDA_I	stda	%r12, [%r8 + 0x0708] %asi
	.word 0x8a7a20d0  ! 178: SDIV_I	sdiv 	%r8, 0x00d0, %r5
	.word 0xc49a2748  ! 179: LDDA_I	ldda	[%r8, + 0x0748] %asi, %r2
	.word 0xa47a2214  ! 180: SDIV_I	sdiv 	%r8, 0x0214, %r18
	.word 0x36800008  ! 181: BGE	bge,a	<label_0x8>
	.word 0xc86a0009  ! 182: LDSTUB_R	ldstub	%r4, [%r8 + %r9]
	.word 0xc36a293c  ! 183: PREFETCH_I	prefetch	[%r8 + 0x093c], #one_read
	.word 0x8b2221f4  ! 184: MULScc_I	mulscc 	%r8, 0x01f4, %r5
	.word 0xdcb22284  ! 185: STHA_I	stha	%r14, [%r8 + 0x0284] %asi
	.word 0x97a20829  ! 186: FADDs	fadds	%f8, %f9, %f11
	.word 0xcd3a2768  ! 187: STDF_I	std	%f6, [0x0768, %r8]
	.word 0xba4a0009  ! 188: MULX_R	mulx 	%r8, %r9, %r29
	.word 0xc49224cc  ! 189: LDUHA_I	lduha	[%r8, + 0x04cc] %asi, %r2
	.word 0xf88a1009  ! 190: LDUBA_R	lduba	[%r8, %r9] 0x80, %r28
	.word 0x3c800004  ! 191: BPOS	bpos,a	<label_0x4>
	.word 0x847a0009  ! 193: SDIV_R	sdiv 	%r8, %r9, %r2
	.word 0x856a2054  ! 194: SDIVX_I	sdivx	%r8, 0x0054, %r2
	.word 0xe1e22009  ! 195: CASA_R	casa	[%r8] %asi, %r9, %r16
	.word 0xeca22794  ! 196: STWA_I	stwa	%r22, [%r8 + 0x0794] %asi
	.word 0xc6520009  ! 197: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xc24228cc  ! 198: LDSW_I	ldsw	[%r8 + 0x08cc], %r1
	.word 0x83a209a9  ! 199: FDIVs	fdivs	%f8, %f9, %f1
	.word 0x22800008  ! 200: BE	be,a	<label_0x8>
	.word 0xad6a0009  ! 201: SDIVX_R	sdivx	%r8, %r9, %r22
	.word 0x97220009  ! 202: MULScc_R	mulscc 	%r8, %r9, %r11
	.word 0x8c7a0009  ! 203: SDIV_R	sdiv 	%r8, %r9, %r6
	.word 0xc24a0009  ! 204: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xc3ea27ec  ! 205: PREFETCHA_I	prefetcha	[%r8, + 0x07ec] %asi, #one_read
	.word 0xca420009  ! 206: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xcbe21009  ! 207: CASA_I	casa	[%r8] 0x80, %r9, %r5
	.word 0xd84a0009  ! 209: LDSB_R	ldsb	[%r8 + %r9], %r12
	.word 0xc8ca2354  ! 210: LDSBA_I	ldsba	[%r8, + 0x0354] %asi, %r4
	.word 0xfeb22fa4  ! 211: STHA_I	stha	%r31, [%r8 + 0x0fa4] %asi
	.word 0xea022330  ! 213: LDUW_I	lduw	[%r8 + 0x0330], %r21
	.word 0x8cfa2f68  ! 214: SDIVcc_I	sdivcc 	%r8, 0x0f68, %r6
	.word 0xf64a0009  ! 215: LDSB_R	ldsb	[%r8 + %r9], %r27
	.word 0xe5e21009  ! 216: CASA_I	casa	[%r8] 0x80, %r9, %r18
	.word 0xca0a2870  ! 217: LDUB_I	ldub	[%r8 + 0x0870], %r5
	.word 0x89a209a9  ! 218: FDIVs	fdivs	%f8, %f9, %f4
	.word 0xca4a0009  ! 219: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xc3ea2748  ! 220: PREFETCHA_I	prefetcha	[%r8, + 0x0748] %asi, #one_read
	.word 0xf0ca1009  ! 221: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r24
	.word 0x8143e038  ! 222: MEMBAR	membar	#StoreStore | #Lookaside | #MemIssue 
	.word 0x8143c000  ! 223: STBAR	stbar
	.word 0xcab228c8  ! 224: STHA_I	stha	%r5, [%r8 + 0x08c8] %asi
	.word 0xf2fa1009  ! 225: SWAPA_R	swapa	%r25, [%r8 + %r9] 0x80
	.word 0x8a4a2630  ! 226: MULX_I	mulx 	%r8, 0x0630, %r5
	.word 0xb5a208a9  ! 227: FSUBs	fsubs	%f8, %f9, %f26
	.word 0x2c800008  ! 228: BNEG	bneg,a	<label_0x8>
	.word 0x84da2a14  ! 229: SMULcc_I	smulcc 	%r8, 0x0a14, %r2
	.word 0xccc21009  ! 230: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r6
	.word 0x8143e021  ! 231: MEMBAR	membar	#LoadLoad | #MemIssue 
	.word 0x8e7a236c  ! 232: SDIV_I	sdiv 	%r8, 0x036c, %r7
	.word 0x2ac20004  ! 233: BRNZ	brnz,a,nt	%8,<label_0x20004>
	.word 0x24800004  ! 234: BLE	ble,a	<label_0x4>
	.word 0x88722a48  ! 235: UDIV_I	udiv 	%r8, 0x0a48, %r4
	.word 0xcad227f4  ! 236: LDSHA_I	ldsha	[%r8, + 0x07f4] %asi, %r5
	.word 0xe01a2a68  ! 237: LDD_I	ldd	[%r8 + 0x0a68], %r16
	.word 0xf4ba2e08  ! 238: STDA_I	stda	%r26, [%r8 + 0x0e08] %asi
	.word 0xc36a2c74  ! 239: PREFETCH_I	prefetch	[%r8 + 0x0c74], #one_read
	.word 0xc6da27e8  ! 240: LDXA_I	ldxa	[%r8, + 0x07e8] %asi, %r3
	.word 0x8143e035  ! 241: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside | #MemIssue 
	.word 0x8143e051  ! 242: MEMBAR	membar	#LoadLoad | #Lookaside | #Sync 
	.word 0xb24a0009  ! 243: MULX_R	mulx 	%r8, %r9, %r25
	.word 0xb6d22f5c  ! 244: UMULcc_I	umulcc 	%r8, 0x0f5c, %r27
	.word 0x8143c000  ! 245: STBAR	stbar
	.word 0xc6a226a8  ! 246: STWA_I	stwa	%r3, [%r8 + 0x06a8] %asi
	.word 0xc3f22009  ! 247: CASXA_R	casxa	[%r8]%asi, %r9, %r1
	.word 0xdd3a2e80  ! 248: STDF_I	std	%f14, [0x0e80, %r8]
	.word 0xca8a2658  ! 249: LDUBA_I	lduba	[%r8, + 0x0658] %asi, %r5
	.word 0x8143e046  ! 250: MEMBAR	membar	#StoreLoad | #LoadStore | #Sync 
	.word 0xf44220c0  ! 251: LDSW_I	ldsw	[%r8 + 0x00c0], %r26
	.word 0xce122230  ! 252: LDUH_I	lduh	[%r8 + 0x0230], %r7
	.word 0x8d6a0009  ! 253: SDIVX_R	sdivx	%r8, %r9, %r6
	.word 0x8a7a2b10  ! 254: SDIV_I	sdiv 	%r8, 0x0b10, %r5
	.word 0xfad22ae4  ! 255: LDSHA_I	ldsha	[%r8, + 0x0ae4] %asi, %r29
	.word 0x8c522a20  ! 256: UMUL_I	umul 	%r8, 0x0a20, %r6
	.word 0x83a20929  ! 257: FMULs	fmuls	%f8, %f9, %f1
	.word 0x8143c000  ! 258: STBAR	stbar
	.word 0xc8120009  ! 259: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xfc1a0009  ! 260: LDD_R	ldd	[%r8 + %r9], %r30
	.word 0x10800004  ! 261: BA	ba  	<label_0x4>
	.word 0xc6c224a0  ! 262: LDSWA_I	ldswa	[%r8, + 0x04a0] %asi, %r3
	.word 0x82f2248c  ! 263: UDIVcc_I	udivcc 	%r8, 0x048c, %r1
	.word 0xc6ea1009  ! 264: LDSTUBA_R	ldstuba	%r3, [%r8 + %r9] 0x80
	.word 0xa7a20829  ! 265: FADDs	fadds	%f8, %f9, %f19
	.word 0xa3a20829  ! 266: FADDs	fadds	%f8, %f9, %f17
	.word 0xb6da263c  ! 267: SMULcc_I	smulcc 	%r8, 0x063c, %r27
	.word 0xf6fa20bc  ! 268: SWAPA_I	swapa	%r27, [%r8 + 0x00bc] %asi
	.word 0xc89a2e50  ! 269: LDDA_I	ldda	[%r8, + 0x0e50] %asi, %r4
	.word 0xc7222578  ! 270: STF_I	st	%f3, [0x0578, %r8]
	.word 0xcd3a29a8  ! 271: STDF_I	std	%f6, [0x09a8, %r8]
	.word 0x10800008  ! 272: BA	ba  	<label_0x8>
	.word 0xfcf21009  ! 273: STXA_R	stxa	%r30, [%r8 + %r9] 0x80
	.word 0xaa5a0009  ! 274: SMUL_R	smul 	%r8, %r9, %r21
	.word 0x8fa208a9  ! 275: FSUBs	fsubs	%f8, %f9, %f7
	.word 0x12800008  ! 276: BNE	bne  	<label_0x8>
	.word 0xd6ea2e08  ! 277: LDSTUBA_I	ldstuba	%r11, [%r8 + 0x0e08] %asi
	.word 0xc3ea2994  ! 278: PREFETCHA_I	prefetcha	[%r8, + 0x0994] %asi, #one_read
	.word 0xc8822fd4  ! 280: LDUWA_I	lduwa	[%r8, + 0x0fd4] %asi, %r4
	.word 0xc8b22748  ! 281: STHA_I	stha	%r4, [%r8 + 0x0748] %asi
	.word 0xc8921009  ! 282: LDUHA_R	lduha	[%r8, %r9] 0x80, %r4
	.word 0x8143e028  ! 283: MEMBAR	membar	#StoreStore | #MemIssue 
	.word 0x8852227c  ! 284: UMUL_I	umul 	%r8, 0x027c, %r4
	.word 0x82da0009  ! 287: SMULcc_R	smulcc 	%r8, %r9, %r1
	.word 0xdac22170  ! 288: LDSWA_I	ldswa	[%r8, + 0x0170] %asi, %r13
	.word 0x8fa208a9  ! 290: FSUBs	fsubs	%f8, %f9, %f7
	.word 0x8143c000  ! 291: STBAR	stbar
	.word 0x89a209a9  ! 292: FDIVs	fdivs	%f8, %f9, %f4
	.word 0xd4a22d08  ! 293: STWA_I	stwa	%r10, [%r8 + 0x0d08] %asi
	.word 0xceaa276c  ! 294: STBA_I	stba	%r7, [%r8 + 0x076c] %asi
	.word 0x06800004  ! 295: BL	bl  	<label_0x4>
	.word 0xc36a2674  ! 296: PREFETCH_I	prefetch	[%r8 + 0x0674], #one_read
	.word 0xc26a2e18  ! 297: LDSTUB_I	ldstub	%r1, [%r8 + 0x0e18]
	.word 0xb5a20929  ! 298: FMULs	fmuls	%f8, %f9, %f26
	.word 0xcc822010  ! 299: LDUWA_I	lduwa	[%r8, + 0x0010] %asi, %r6
	.word 0xd8a22774  ! 300: STWA_I	stwa	%r12, [%r8 + 0x0774] %asi
	.word 0xc6a21009  ! 301: STWA_R	stwa	%r3, [%r8 + %r9] 0x80
	.word 0x02c20008  ! 302: BRZ	brz  ,nt	%8,<label_0x20008>
	.word 0x86fa0009  ! 303: SDIVcc_R	sdivcc 	%r8, %r9, %r3
	.word 0xc48a1009  ! 304: LDUBA_R	lduba	[%r8, %r9] 0x80, %r2
	.word 0xced22328  ! 305: LDSHA_I	ldsha	[%r8, + 0x0328] %asi, %r7
	.word 0xc4922b54  ! 306: LDUHA_I	lduha	[%r8, + 0x0b54] %asi, %r2
	.word 0x8143e010  ! 308: MEMBAR	membar	#Lookaside 
	.word 0xc8ea1009  ! 309: LDSTUBA_R	ldstuba	%r4, [%r8 + %r9] 0x80
	.word 0xc36a2a28  ! 310: PREFETCH_I	prefetch	[%r8 + 0x0a28], #one_read
	.word 0xaada0009  ! 311: SMULcc_R	smulcc 	%r8, %r9, %r21
	.word 0xc4f21009  ! 312: STXA_R	stxa	%r2, [%r8 + %r9] 0x80
	.word 0x2e800004  ! 313: BVS	bvs,a	<label_0x4>
	.word 0xa8522278  ! 314: UMUL_I	umul 	%r8, 0x0278, %r20
	.word 0xaa722adc  ! 315: UDIV_I	udiv 	%r8, 0x0adc, %r21
	.word 0xf73a0009  ! 316: STDF_R	std	%f27, [%r9, %r8]
	.word 0x22ca0004  ! 317: BRZ	brz,a,pt	%8,<label_0xa0004>
	.word 0x8c520009  ! 318: UMUL_R	umul 	%r8, %r9, %r6
	.word 0xdd220009  ! 320: STF_R	st	%f14, [%r9, %r8]
	.word 0x8143e039  ! 321: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside | #MemIssue 
	.word 0x8f6a0009  ! 323: SDIVX_R	sdivx	%r8, %r9, %r7
	.word 0x8143c000  ! 324: STBAR	stbar
	.word 0xcff21009  ! 325: CASXA_I	casxa	[%r8] 0x80, %r9, %r7
	.word 0x8143c000  ! 326: STBAR	stbar
	.word 0xc36a2e04  ! 327: PREFETCH_I	prefetch	[%r8 + 0x0e04], #one_read
	.word 0xe07a2968  ! 328: SWAP_I	swap	%r16, [%r8 + 0x0968]
	.word 0xca7a2ea0  ! 329: SWAP_I	swap	%r5, [%r8 + 0x0ea0]
	.word 0xc6a21009  ! 330: STWA_R	stwa	%r3, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 331: STBAR	stbar
	.word 0xfcba1009  ! 332: STDA_R	stda	%r30, [%r8 + %r9] 0x80
	.word 0x8143e075  ! 333: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside | #MemIssue | #Sync 
	.word 0x8143e049  ! 334: MEMBAR	membar	#LoadLoad | #StoreStore | #Sync 
	.word 0x3e800004  ! 335: BVC	bvc,a	<label_0x4>
	.word 0xc9222700  ! 336: STF_I	st	%f4, [0x0700, %r8]
	.word 0x30800004  ! 337: BA	ba,a	<label_0x4>
	.word 0xc6a22200  ! 338: STWA_I	stwa	%r3, [%r8 + 0x0200] %asi
	.word 0x82f20009  ! 339: UDIVcc_R	udivcc 	%r8, %r9, %r1
	.word 0xc2aa1009  ! 340: STBA_R	stba	%r1, [%r8 + %r9] 0x80
	.word 0x3a800008  ! 341: BCC	bcc,a	<label_0x8>
	.word 0xc4ba2aa0  ! 342: STDA_I	stda	%r2, [%r8 + 0x0aa0] %asi
	.word 0x88da2b38  ! 343: SMULcc_I	smulcc 	%r8, 0x0b38, %r4
	.word 0x04800008  ! 344: BLE	ble  	<label_0x8>
	.word 0xce9226d4  ! 345: LDUHA_I	lduha	[%r8, + 0x06d4] %asi, %r7
	.word 0xe85a2628  ! 346: LDX_I	ldx	[%r8 + 0x0628], %r20
	.word 0x8cf22a80  ! 347: UDIVcc_I	udivcc 	%r8, 0x0a80, %r6
	.word 0xf8ba1009  ! 348: STDA_R	stda	%r28, [%r8 + %r9] 0x80
	.word 0x8da20929  ! 349: FMULs	fmuls	%f8, %f9, %f6
	.word 0x3e800008  ! 350: BVC	bvc,a	<label_0x8>
	.word 0xc6aa2f04  ! 351: STBA_I	stba	%r3, [%r8 + 0x0f04] %asi
	.word 0xcc9221cc  ! 352: LDUHA_I	lduha	[%r8, + 0x01cc] %asi, %r6
	.word 0x9b6a266c  ! 353: SDIVX_I	sdivx	%r8, 0x066c, %r13
	.word 0xcaaa1009  ! 354: STBA_R	stba	%r5, [%r8 + %r9] 0x80
	.word 0x8a720009  ! 355: UDIV_R	udiv 	%r8, %r9, %r5
	.word 0xcefa1009  ! 356: SWAPA_R	swapa	%r7, [%r8 + %r9] 0x80
	.word 0x8143e010  ! 357: MEMBAR	membar	#Lookaside 
	.word 0xe4ea1009  ! 358: LDSTUBA_R	ldstuba	%r18, [%r8 + %r9] 0x80
	.word 0x16800004  ! 359: BGE	bge  	<label_0x4>
	.word 0xac522334  ! 360: UMUL_I	umul 	%r8, 0x0334, %r22
	.word 0x86f22cc8  ! 361: UDIVcc_I	udivcc 	%r8, 0x0cc8, %r3
	.word 0xc24a2250  ! 362: LDSB_I	ldsb	[%r8 + 0x0250], %r1
	.word 0x8143e001  ! 363: MEMBAR	membar	#LoadLoad 
	.word 0xa4f223f4  ! 364: UDIVcc_I	udivcc 	%r8, 0x03f4, %r18
	.word 0xc8ea1009  ! 365: LDSTUBA_R	ldstuba	%r4, [%r8 + %r9] 0x80
	.word 0xc3ea25d4  ! 366: PREFETCHA_I	prefetcha	[%r8, + 0x05d4] %asi, #one_read
	.word 0xcca22a7c  ! 367: STWA_I	stwa	%r6, [%r8 + 0x0a7c] %asi
	.word 0xf8ba2390  ! 369: STDA_I	stda	%r28, [%r8 + 0x0390] %asi
	.word 0x89a208a9  ! 370: FSUBs	fsubs	%f8, %f9, %f4
	.word 0xcbe22009  ! 372: CASA_R	casa	[%r8] %asi, %r9, %r5
	.word 0xccea1009  ! 373: LDSTUBA_R	ldstuba	%r6, [%r8 + %r9] 0x80
	.word 0x8ba20829  ! 375: FADDs	fadds	%f8, %f9, %f5
	.word 0xc8aa1009  ! 376: STBA_R	stba	%r4, [%r8 + %r9] 0x80
	.word 0x84d22764  ! 377: UMULcc_I	umulcc 	%r8, 0x0764, %r2
	.word 0x2eca0004  ! 378: BRGEZ	brgez,a,pt	%8,<label_0xa0004>
	.word 0x20800008  ! 379: BN	bn,a	<label_0x8>
	.word 0xca5a0009  ! 380: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xc3ea29f4  ! 381: PREFETCHA_I	prefetcha	[%r8, + 0x09f4] %asi, #one_read
	.word 0x08800004  ! 382: BLEU	bleu  	<label_0x4>
	.word 0xcea22e7c  ! 384: STWA_I	stwa	%r7, [%r8 + 0x0e7c] %asi
	.word 0x38800004  ! 385: BGU	bgu,a	<label_0x4>
	.word 0x0c800004  ! 386: BNEG	bneg  	<label_0x4>
	.word 0xcdf22009  ! 387: CASXA_R	casxa	[%r8]%asi, %r9, %r6
	.word 0x8143e03a  ! 388: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside | #MemIssue 
	.word 0xfaaa216c  ! 389: STBA_I	stba	%r29, [%r8 + 0x016c] %asi
	.word 0x87a208a9  ! 390: FSUBs	fsubs	%f8, %f9, %f3
	.word 0xc84a0009  ! 391: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xc2fa1009  ! 392: SWAPA_R	swapa	%r1, [%r8 + %r9] 0x80
	.word 0xf8921009  ! 393: LDUHA_R	lduha	[%r8, %r9] 0x80, %r28
	.word 0xc3ea2c84  ! 394: PREFETCHA_I	prefetcha	[%r8, + 0x0c84] %asi, #one_read
	.word 0xae5a0009  ! 395: SMUL_R	smul 	%r8, %r9, %r23
	.word 0x82f22350  ! 396: UDIVcc_I	udivcc 	%r8, 0x0350, %r1
	.word 0x83a20829  ! 397: FADDs	fadds	%f8, %f9, %f1
	.word 0x867a2abc  ! 398: SDIV_I	sdiv 	%r8, 0x0abc, %r3
	.word 0xc2b21009  ! 399: STHA_R	stha	%r1, [%r8 + %r9] 0x80
	.word 0x30800008  ! 401: BA	ba,a	<label_0x8>
	.word 0x06c20008  ! 402: BRLZ	brlz  ,nt	%8,<label_0x20008>
	.word 0x8143e03d  ! 403: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0x86fa2eec  ! 404: SDIVcc_I	sdivcc 	%r8, 0x0eec, %r3
	.word 0x8143e03b  ! 406: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Lookaside | #MemIssue 
	.word 0xcc42225c  ! 407: LDSW_I	ldsw	[%r8 + 0x025c], %r6
	.word 0xe86a2b1c  ! 408: LDSTUB_I	ldstub	%r20, [%r8 + 0x0b1c]
	.word 0xd40a0009  ! 409: LDUB_R	ldub	[%r8 + %r9], %r10
	.word 0xc73a0009  ! 410: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc4aa1009  ! 411: STBA_R	stba	%r2, [%r8 + %r9] 0x80
	.word 0x8143e008  ! 412: MEMBAR	membar	#StoreStore 
	.word 0xc7220009  ! 413: STF_R	st	%f3, [%r9, %r8]
	.word 0xce0a0009  ! 414: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xc36a2e20  ! 415: PREFETCH_I	prefetch	[%r8 + 0x0e20], #one_read
	.word 0x8efa26bc  ! 416: SDIVcc_I	sdivcc 	%r8, 0x06bc, %r7
	.word 0xca122c50  ! 417: LDUH_I	lduh	[%r8 + 0x0c50], %r5
	.word 0x9eda0009  ! 418: SMULcc_R	smulcc 	%r8, %r9, %r15
	.word 0xf01a0009  ! 419: LDD_R	ldd	[%r8 + %r9], %r24
	.word 0x82d22ab8  ! 420: UMULcc_I	umulcc 	%r8, 0x0ab8, %r1
	.word 0x83a20829  ! 422: FADDs	fadds	%f8, %f9, %f1
	.word 0x86da0009  ! 423: SMULcc_R	smulcc 	%r8, %r9, %r3
	.word 0xaba209a9  ! 425: FDIVs	fdivs	%f8, %f9, %f21
	.word 0xecaa2474  ! 426: STBA_I	stba	%r22, [%r8 + 0x0474] %asi
	.word 0x98da2f34  ! 427: SMULcc_I	smulcc 	%r8, 0x0f34, %r12
	.word 0xccf21009  ! 428: STXA_R	stxa	%r6, [%r8 + %r9] 0x80
	.word 0xf86a0009  ! 429: LDSTUB_R	ldstub	%r28, [%r8 + %r9]
	.word 0x8ba209a9  ! 430: FDIVs	fdivs	%f8, %f9, %f5
	.word 0xd40a2954  ! 431: LDUB_I	ldub	[%r8 + 0x0954], %r10
	.word 0x83220009  ! 432: MULScc_R	mulscc 	%r8, %r9, %r1
	.word 0xcdf22009  ! 433: CASXA_R	casxa	[%r8]%asi, %r9, %r6
	.word 0xcc6a2054  ! 434: LDSTUB_I	ldstub	%r6, [%r8 + 0x0054]
	.word 0xf73a26a8  ! 435: STDF_I	std	%f27, [0x06a8, %r8]
	.word 0xc6020009  ! 436: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xceaa1009  ! 437: STBA_R	stba	%r7, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 438: STBAR	stbar
	.word 0x86d22a38  ! 439: UMULcc_I	umulcc 	%r8, 0x0a38, %r3
	.word 0x94da0009  ! 440: SMULcc_R	smulcc 	%r8, %r9, %r10
	.word 0x8da208a9  ! 441: FSUBs	fsubs	%f8, %f9, %f6
	.word 0xc5f22009  ! 442: CASXA_R	casxa	[%r8]%asi, %r9, %r2
	.word 0xe6ea2818  ! 443: LDSTUBA_I	ldstuba	%r19, [%r8 + 0x0818] %asi
	.word 0xe4120009  ! 444: LDUH_R	lduh	[%r8 + %r9], %r18
	.word 0x825a0009  ! 445: SMUL_R	smul 	%r8, %r9, %r1
	.word 0x865a2330  ! 446: SMUL_I	smul 	%r8, 0x0330, %r3
	.word 0xc36a2c14  ! 447: PREFETCH_I	prefetch	[%r8 + 0x0c14], #one_read
	.word 0xc87a2db8  ! 448: SWAP_I	swap	%r4, [%r8 + 0x0db8]
	.word 0x8a4a291c  ! 450: MULX_I	mulx 	%r8, 0x091c, %r5
	.word 0xc2ea2c10  ! 451: LDSTUBA_I	ldstuba	%r1, [%r8 + 0x0c10] %asi
	.word 0xc65a0009  ! 452: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0x06c20008  ! 453: BRLZ	brlz  ,nt	%8,<label_0x20008>
	.word 0xcfe22009  ! 454: CASA_R	casa	[%r8] %asi, %r9, %r7
	.word 0xe6b2264c  ! 455: STHA_I	stha	%r19, [%r8 + 0x064c] %asi
	.word 0xcad21009  ! 456: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r5
	.word 0xc6aa28fc  ! 457: STBA_I	stba	%r3, [%r8 + 0x08fc] %asi
	.word 0xe81a0009  ! 458: LDD_R	ldd	[%r8 + %r9], %r20
	.word 0x852227e8  ! 459: MULScc_I	mulscc 	%r8, 0x07e8, %r2
	.word 0xc44a0009  ! 460: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xc2aa1009  ! 461: STBA_R	stba	%r1, [%r8 + %r9] 0x80
	.word 0xeeaa21bc  ! 462: STBA_I	stba	%r23, [%r8 + 0x01bc] %asi
	.word 0xe81a0009  ! 463: LDD_R	ldd	[%r8 + %r9], %r20
	.word 0xc3f22009  ! 464: CASXA_R	casxa	[%r8]%asi, %r9, %r1
	.word 0xc8b226c8  ! 465: STHA_I	stha	%r4, [%r8 + 0x06c8] %asi
	.word 0xc3ea2010  ! 466: PREFETCHA_I	prefetcha	[%r8, + 0x0010] %asi, #one_read
	.word 0x87a20929  ! 467: FMULs	fmuls	%f8, %f9, %f3
	.word 0xf49a1009  ! 470: LDDA_R	ldda	[%r8, %r9] 0x80, %r26
	.word 0x8143c000  ! 471: STBAR	stbar
	.word 0x18800004  ! 472: BGU	bgu  	<label_0x4>
	.word 0xd4120009  ! 473: LDUH_R	lduh	[%r8 + %r9], %r10
	.word 0xf8d21009  ! 474: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r28
	.word 0x0ec20004  ! 475: BRGEZ	brgez  ,nt	%8,<label_0x20004>
	.word 0x36800008  ! 476: BGE	bge,a	<label_0x8>
	.word 0x8c7226dc  ! 477: UDIV_I	udiv 	%r8, 0x06dc, %r6
	.word 0xe0da1009  ! 478: LDXA_R	ldxa	[%r8, %r9] 0x80, %r16
	.word 0x8143e052  ! 480: MEMBAR	membar	#StoreLoad | #Lookaside | #Sync 
	.word 0x34800008  ! 481: BG	bg,a	<label_0x8>
	.word 0x8143e047  ! 482: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Sync 
	.word 0x8143e054  ! 483: MEMBAR	membar	#LoadStore | #Lookaside | #Sync 
	.word 0x8ed20009  ! 484: UMULcc_R	umulcc 	%r8, %r9, %r7
	.word 0xfcd21009  ! 485: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r30
	.word 0x89a20929  ! 486: FMULs	fmuls	%f8, %f9, %f4
	.word 0x8e5a0009  ! 487: SMUL_R	smul 	%r8, %r9, %r7
	.word 0xccba23a0  ! 488: STDA_I	stda	%r6, [%r8 + 0x03a0] %asi
	.word 0x06ca0004  ! 489: BRLZ	brlz  ,pt	%8,<label_0xa0004>
	.word 0xc4da2ef0  ! 490: LDXA_I	ldxa	[%r8, + 0x0ef0] %asi, %r2
	.word 0x8b220009  ! 491: MULScc_R	mulscc 	%r8, %r9, %r5
	.word 0x9e7a2028  ! 492: SDIV_I	sdiv 	%r8, 0x0028, %r15
	.word 0xc8a21009  ! 493: STWA_R	stwa	%r4, [%r8 + %r9] 0x80
	.word 0xc36a2940  ! 494: PREFETCH_I	prefetch	[%r8 + 0x0940], #one_read
	.word 0xc2921009  ! 495: LDUHA_R	lduha	[%r8, %r9] 0x80, %r1
	.word 0xc28a1009  ! 496: LDUBA_R	lduba	[%r8, %r9] 0x80, %r1
	.word 0xf8ba1009  ! 497: STDA_R	stda	%r28, [%r8 + %r9] 0x80
	.word 0x3c800008  ! 498: BPOS	bpos,a	<label_0x8>
	.word 0xfab22b0c  ! 499: STHA_I	stha	%r29, [%r8 + 0x0b0c] %asi
	.word 0x2e800008  ! 500: BVS	bvs,a	<label_0x8>
	.word 0xcc520009  ! 501: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0x867a0009  ! 502: SDIV_R	sdiv 	%r8, %r9, %r3
	.word 0xf80a0009  ! 503: LDUB_R	ldub	[%r8 + %r9], %r28
	.word 0x8143c000  ! 504: STBAR	stbar
	.word 0xe45a0009  ! 505: LDX_R	ldx	[%r8 + %r9], %r18
	.word 0xb9a209a9  ! 506: FDIVs	fdivs	%f8, %f9, %f28
	.word 0x8143c000  ! 507: STBAR	stbar
	.word 0xc8b22850  ! 508: STHA_I	stha	%r4, [%r8 + 0x0850] %asi
	.word 0x8143c000  ! 509: STBAR	stbar
	.word 0x0cca0004  ! 510: BRGZ	brgz  ,pt	%8,<label_0xa0004>
	.word 0xc64a25f4  ! 511: LDSB_I	ldsb	[%r8 + 0x05f4], %r3
	.word 0x8c6a0009  ! 512: UDIVX_R	udivx 	%r8, %r9, %r6
	.word 0x8ba209a9  ! 513: FDIVs	fdivs	%f8, %f9, %f5
	.word 0xd6fa2b4c  ! 514: SWAPA_I	swapa	%r11, [%r8 + 0x0b4c] %asi
	.word 0x82f22694  ! 515: UDIVcc_I	udivcc 	%r8, 0x0694, %r1
	.word 0x8143c000  ! 516: STBAR	stbar
	.word 0xc8922dcc  ! 517: LDUHA_I	lduha	[%r8, + 0x0dcc] %asi, %r4
	.word 0xc3ea22d4  ! 518: PREFETCHA_I	prefetcha	[%r8, + 0x02d4] %asi, #one_read
	.word 0xc93a0009  ! 519: STDF_R	std	%f4, [%r9, %r8]
	.word 0xce4a0009  ! 520: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0x04ca0008  ! 521: BRLEZ	brlez  ,pt	%8,<label_0xa0008>
	.word 0xfc5a2658  ! 522: LDX_I	ldx	[%r8 + 0x0658], %r30
	.word 0xe0ba1009  ! 524: STDA_R	stda	%r16, [%r8 + %r9] 0x80
	.word 0x38800008  ! 525: BGU	bgu,a	<label_0x8>
	.word 0xcc120009  ! 527: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xe6d21009  ! 528: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r19
	.word 0xb8d20009  ! 529: UMULcc_R	umulcc 	%r8, %r9, %r28
	.word 0xcc12289c  ! 530: LDUH_I	lduh	[%r8 + 0x089c], %r6
	.word 0xdd3a0009  ! 531: STDF_R	std	%f14, [%r9, %r8]
	.word 0xe1e22009  ! 532: CASA_R	casa	[%r8] %asi, %r9, %r16
	.word 0xa6da2414  ! 533: SMULcc_I	smulcc 	%r8, 0x0414, %r19
	.word 0xc36a2f20  ! 534: PREFETCH_I	prefetch	[%r8 + 0x0f20], #one_read
	.word 0x9d6a0009  ! 535: SDIVX_R	sdivx	%r8, %r9, %r14
	.word 0xc2fa2f18  ! 536: SWAPA_I	swapa	%r1, [%r8 + 0x0f18] %asi
	.word 0xca7a0009  ! 537: SWAP_R	swap	%r5, [%r8 + %r9]
	.word 0xce6a2b24  ! 538: LDSTUB_I	ldstub	%r7, [%r8 + 0x0b24]
	.word 0xcb22206c  ! 541: STF_I	st	%f5, [0x006c, %r8]
	.word 0xf3f21009  ! 542: CASXA_I	casxa	[%r8] 0x80, %r9, %r25
	.word 0x8143e058  ! 543: MEMBAR	membar	#StoreStore | #Lookaside | #Sync 
	.word 0xbe522ccc  ! 544: UMUL_I	umul 	%r8, 0x0ccc, %r31
	.word 0xc5220009  ! 545: STF_R	st	%f2, [%r9, %r8]
	.word 0x32800004  ! 546: BNE	bne,a	<label_0x4>
	.word 0xbe6a2a34  ! 547: UDIVX_I	udivx 	%r8, 0x0a34, %r31
	.word 0xa32225f0  ! 548: MULScc_I	mulscc 	%r8, 0x05f0, %r17
	.word 0x826a20b4  ! 549: UDIVX_I	udivx 	%r8, 0x00b4, %r1
	.word 0x84720009  ! 550: UDIV_R	udiv 	%r8, %r9, %r2
	.word 0xc36a224c  ! 551: PREFETCH_I	prefetch	[%r8 + 0x024c], #one_read
	.word 0xf2a22980  ! 552: STWA_I	stwa	%r25, [%r8 + 0x0980] %asi
	.word 0xc49a2bd8  ! 554: LDDA_I	ldda	[%r8, + 0x0bd8] %asi, %r2
	.word 0x10800004  ! 555: BA	ba  	<label_0x4>
	.word 0xc6ca249c  ! 556: LDSBA_I	ldsba	[%r8, + 0x049c] %asi, %r3
	.word 0xc49a1009  ! 557: LDDA_R	ldda	[%r8, %r9] 0x80, %r2
	.word 0xc9f22009  ! 558: CASXA_R	casxa	[%r8]%asi, %r9, %r4
	.word 0x865a0009  ! 559: SMUL_R	smul 	%r8, %r9, %r3
	.word 0x2c800004  ! 561: BNEG	bneg,a	<label_0x4>
	.word 0x88da0009  ! 563: SMULcc_R	smulcc 	%r8, %r9, %r4
	.word 0xca5a2e48  ! 564: LDX_I	ldx	[%r8 + 0x0e48], %r5
	.word 0xccba22d8  ! 565: STDA_I	stda	%r6, [%r8 + 0x02d8] %asi
	.word 0x8143e026  ! 566: MEMBAR	membar	#StoreLoad | #LoadStore | #MemIssue 
	.word 0xc8020009  ! 567: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xc36a2438  ! 568: PREFETCH_I	prefetch	[%r8 + 0x0438], #one_read
	.word 0xcc92262c  ! 569: LDUHA_I	lduha	[%r8, + 0x062c] %asi, %r6
	.word 0xccaa1009  ! 570: STBA_R	stba	%r6, [%r8 + %r9] 0x80
	.word 0x24800004  ! 571: BLE	ble,a	<label_0x4>
	.word 0x8143c000  ! 572: STBAR	stbar
	.word 0xe81a2100  ! 574: LDD_I	ldd	[%r8 + 0x0100], %r20
	.word 0x06800008  ! 575: BL	bl  	<label_0x8>
	.word 0x8143e06d  ! 576: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #MemIssue | #Sync 
	.word 0xbcfa0009  ! 577: SDIVcc_R	sdivcc 	%r8, %r9, %r30
	.word 0x8ada28e8  ! 578: SMULcc_I	smulcc 	%r8, 0x08e8, %r5
	.word 0x8da208a9  ! 579: FSUBs	fsubs	%f8, %f9, %f6
	.word 0x24c20008  ! 580: BRLEZ	brlez,a,nt	%8,<label_0x20008>
	.word 0xc2020009  ! 581: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0x8143c000  ! 582: STBAR	stbar
	.word 0xc80228ac  ! 583: LDUW_I	lduw	[%r8 + 0x08ac], %r4
	.word 0x3a800004  ! 584: BCC	bcc,a	<label_0x4>
	.word 0x8143e007  ! 585: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore 
	.word 0x82720009  ! 586: UDIV_R	udiv 	%r8, %r9, %r1
	.word 0xc2520009  ! 587: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0x9cf22644  ! 588: UDIVcc_I	udivcc 	%r8, 0x0644, %r14
	.word 0xf5222ffc  ! 589: STF_I	st	%f26, [0x0ffc, %r8]
	.word 0xc8b227b0  ! 590: STHA_I	stha	%r4, [%r8 + 0x07b0] %asi
	.word 0xda822480  ! 591: LDUWA_I	lduwa	[%r8, + 0x0480] %asi, %r13
	.word 0x84f20009  ! 592: UDIVcc_R	udivcc 	%r8, %r9, %r2
	.word 0x8143e073  ! 593: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside | #MemIssue | #Sync 
	.word 0xa24a2114  ! 594: MULX_I	mulx 	%r8, 0x0114, %r17
	.word 0xc8ea2fa8  ! 595: LDSTUBA_I	ldstuba	%r4, [%r8 + 0x0fa8] %asi
	.word 0x24800004  ! 596: BLE	ble,a	<label_0x4>
	.word 0xc6ca23c4  ! 597: LDSBA_I	ldsba	[%r8, + 0x03c4] %asi, %r3
	.word 0xbba20829  ! 598: FADDs	fadds	%f8, %f9, %f29
	.word 0xcc1a28a8  ! 599: LDD_I	ldd	[%r8 + 0x08a8], %r6
	.word 0xc5e22009  ! 600: CASA_R	casa	[%r8] %asi, %r9, %r2
	.word 0xe6da1009  ! 601: LDXA_R	ldxa	[%r8, %r9] 0x80, %r19
	.word 0xdaf21009  ! 602: STXA_R	stxa	%r13, [%r8 + %r9] 0x80
	.word 0xb9220009  ! 603: MULScc_R	mulscc 	%r8, %r9, %r28
	.word 0xfc6a0009  ! 604: LDSTUB_R	ldstub	%r30, [%r8 + %r9]
	.word 0x89a208a9  ! 605: FSUBs	fsubs	%f8, %f9, %f4
	.word 0x8143e02a  ! 606: MEMBAR	membar	#StoreLoad | #StoreStore | #MemIssue 
	.word 0x36800008  ! 607: BGE	bge,a	<label_0x8>
	.word 0xfe8221c0  ! 608: LDUWA_I	lduwa	[%r8, + 0x01c0] %asi, %r31
	.word 0xfc6a2cc4  ! 609: LDSTUB_I	ldstub	%r30, [%r8 + 0x0cc4]
	.word 0x85a20929  ! 610: FMULs	fmuls	%f8, %f9, %f2
	.word 0xcaa223fc  ! 611: STWA_I	stwa	%r5, [%r8 + 0x03fc] %asi
	.word 0xcc1a2a90  ! 612: LDD_I	ldd	[%r8 + 0x0a90], %r6
	.word 0xa9a208a9  ! 613: FSUBs	fsubs	%f8, %f9, %f20
	.word 0xcdf21009  ! 614: CASXA_I	casxa	[%r8] 0x80, %r9, %r6
	.word 0xc3ea25d8  ! 615: PREFETCHA_I	prefetcha	[%r8, + 0x05d8] %asi, #one_read
	.word 0x89a209a9  ! 616: FDIVs	fdivs	%f8, %f9, %f4
	.word 0x886a263c  ! 617: UDIVX_I	udivx 	%r8, 0x063c, %r4
	.word 0xa04a2040  ! 618: MULX_I	mulx 	%r8, 0x0040, %r16
	.word 0x0cca0004  ! 620: BRGZ	brgz  ,pt	%8,<label_0xa0004>
	.word 0xc86a2420  ! 621: LDSTUB_I	ldstub	%r4, [%r8 + 0x0420]
	.word 0xce520009  ! 622: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0x8c7a2dd8  ! 623: SDIV_I	sdiv 	%r8, 0x0dd8, %r6
	.word 0x8143c000  ! 624: STBAR	stbar
	.word 0x8143e010  ! 625: MEMBAR	membar	#Lookaside 
	.word 0xd44a2c94  ! 626: LDSB_I	ldsb	[%r8 + 0x0c94], %r10
	.word 0xc53a0009  ! 627: STDF_R	std	%f2, [%r9, %r8]
	.word 0x8efa0009  ! 628: SDIVcc_R	sdivcc 	%r8, %r9, %r7
	.word 0xd6aa1009  ! 629: STBA_R	stba	%r11, [%r8 + %r9] 0x80
	.word 0x1a800004  ! 630: BCC	bcc  	<label_0x4>
	.word 0x8a720009  ! 631: UDIV_R	udiv 	%r8, %r9, %r5
	.word 0x89220009  ! 632: MULScc_R	mulscc 	%r8, %r9, %r4
	.word 0x8cfa0009  ! 633: SDIVcc_R	sdivcc 	%r8, %r9, %r6
	.word 0xc8ba1009  ! 634: STDA_R	stda	%r4, [%r8 + %r9] 0x80
	.word 0xe8c22788  ! 635: LDSWA_I	ldswa	[%r8, + 0x0788] %asi, %r20
	.word 0xa4fa0009  ! 636: SDIVcc_R	sdivcc 	%r8, %r9, %r18
	.word 0x1e800008  ! 637: BVC	bvc  	<label_0x8>
	.word 0xc5e21009  ! 638: CASA_I	casa	[%r8] 0x80, %r9, %r2
	.word 0xceb22b94  ! 639: STHA_I	stha	%r7, [%r8 + 0x0b94] %asi
	.word 0xc3220009  ! 640: STF_R	st	%f1, [%r9, %r8]
	.word 0xb04a0009  ! 641: MULX_R	mulx 	%r8, %r9, %r24
	.word 0x8143c000  ! 642: STBAR	stbar
	.word 0xc2ea1009  ! 643: LDSTUBA_R	ldstuba	%r1, [%r8 + %r9] 0x80
	.word 0xc80a0009  ! 644: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0x08800008  ! 645: BLEU	bleu  	<label_0x8>
	.word 0x8da20829  ! 646: FADDs	fadds	%f8, %f9, %f6
	.word 0xc66a0009  ! 647: LDSTUB_R	ldstub	%r3, [%r8 + %r9]
	.word 0x8143c000  ! 648: STBAR	stbar
	.word 0x85a208a9  ! 649: FSUBs	fsubs	%f8, %f9, %f2
	.word 0x8143c000  ! 650: STBAR	stbar
	.word 0x89222d6c  ! 651: MULScc_I	mulscc 	%r8, 0x0d6c, %r4
	.word 0x86f20009  ! 652: UDIVcc_R	udivcc 	%r8, %r9, %r3
	.word 0xc2da1009  ! 653: LDXA_R	ldxa	[%r8, %r9] 0x80, %r1
	.word 0xc36a2938  ! 654: PREFETCH_I	prefetch	[%r8 + 0x0938], #one_read
	.word 0x8143c000  ! 655: STBAR	stbar
	.word 0xde120009  ! 656: LDUH_R	lduh	[%r8 + %r9], %r15
	.word 0xe8ba2a20  ! 657: STDA_I	stda	%r20, [%r8 + 0x0a20] %asi
	.word 0xc4422624  ! 658: LDSW_I	ldsw	[%r8 + 0x0624], %r2
	.word 0x0aca0004  ! 659: BRNZ	brnz  ,pt	%8,<label_0xa0004>
	.word 0xc4d21009  ! 660: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r2
	.word 0xe09a2360  ! 661: LDDA_I	ldda	[%r8, + 0x0360] %asi, %r16
	.word 0xf48a1009  ! 663: LDUBA_R	lduba	[%r8, %r9] 0x80, %r26
	.word 0xc2aa2afc  ! 665: STBA_I	stba	%r1, [%r8 + 0x0afc] %asi
	.word 0xc4a22ba4  ! 666: STWA_I	stwa	%r2, [%r8 + 0x0ba4] %asi
	.word 0x8143c000  ! 667: STBAR	stbar
	.word 0xce922a94  ! 668: LDUHA_I	lduha	[%r8, + 0x0a94] %asi, %r7
	.word 0xc36a2e48  ! 669: PREFETCH_I	prefetch	[%r8 + 0x0e48], #one_read
	.word 0xf4ea2718  ! 670: LDSTUBA_I	ldstuba	%r26, [%r8 + 0x0718] %asi
	.word 0xc3f21009  ! 671: CASXA_I	casxa	[%r8] 0x80, %r9, %r1
	.word 0x825a0009  ! 672: SMUL_R	smul 	%r8, %r9, %r1
	.word 0x8143e036  ! 673: MEMBAR	membar	#StoreLoad | #LoadStore | #Lookaside | #MemIssue 
	.word 0xb8fa2e64  ! 675: SDIVcc_I	sdivcc 	%r8, 0x0e64, %r28
	.word 0xca5a2de8  ! 676: LDX_I	ldx	[%r8 + 0x0de8], %r5
	.word 0xc9e22009  ! 677: CASA_R	casa	[%r8] %asi, %r9, %r4
	.word 0xe6a222b4  ! 678: STWA_I	stwa	%r19, [%r8 + 0x02b4] %asi
	.word 0x8a7a2e30  ! 679: SDIV_I	sdiv 	%r8, 0x0e30, %r5
	.word 0x8afa2df8  ! 680: SDIVcc_I	sdivcc 	%r8, 0x0df8, %r5
	.word 0x06800008  ! 681: BL	bl  	<label_0x8>
	.word 0x8143e02b  ! 682: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #MemIssue 
	.word 0x36800008  ! 683: BGE	bge,a	<label_0x8>
	.word 0x8da20929  ! 684: FMULs	fmuls	%f8, %f9, %f6
	.word 0xa5a20829  ! 685: FADDs	fadds	%f8, %f9, %f18
	.word 0x94f20009  ! 686: UDIVcc_R	udivcc 	%r8, %r9, %r10
	.word 0x8872220c  ! 687: UDIV_I	udiv 	%r8, 0x020c, %r4
	.word 0xc3ea2758  ! 688: PREFETCHA_I	prefetcha	[%r8, + 0x0758] %asi, #one_read
	.word 0xea822f50  ! 689: LDUWA_I	lduwa	[%r8, + 0x0f50] %asi, %r21
	.word 0xf01a0009  ! 690: LDD_R	ldd	[%r8 + %r9], %r24
	.word 0x8143c000  ! 691: STBAR	stbar
	.word 0xa47a25f4  ! 692: SDIV_I	sdiv 	%r8, 0x05f4, %r18
	.word 0x8143e024  ! 693: MEMBAR	membar	#LoadStore | #MemIssue 
	.word 0xe6a21009  ! 694: STWA_R	stwa	%r19, [%r8 + %r9] 0x80
	.word 0x886a2f54  ! 695: UDIVX_I	udivx 	%r8, 0x0f54, %r4
	.word 0x84fa2bb0  ! 696: SDIVcc_I	sdivcc 	%r8, 0x0bb0, %r2
	.word 0x02ca0004  ! 697: BRZ	brz  ,pt	%8,<label_0xa0004>
	.word 0xe6fa2748  ! 698: SWAPA_I	swapa	%r19, [%r8 + 0x0748] %asi
	.word 0xf4a21009  ! 699: STWA_R	stwa	%r26, [%r8 + %r9] 0x80
	.word 0xc3ea2cdc  ! 700: PREFETCHA_I	prefetcha	[%r8, + 0x0cdc] %asi, #one_read
	.word 0x8143c000  ! 701: STBAR	stbar
	.word 0x8143c000  ! 702: STBAR	stbar
	.word 0x8a5a2414  ! 703: SMUL_I	smul 	%r8, 0x0414, %r5
	.word 0xc6fa20e0  ! 704: SWAPA_I	swapa	%r3, [%r8 + 0x00e0] %asi
	.word 0x04800004  ! 705: BLE	ble  	<label_0x4>
	.word 0x8143e054  ! 706: MEMBAR	membar	#LoadStore | #Lookaside | #Sync 
	.word 0xf27a2490  ! 707: SWAP_I	swap	%r25, [%r8 + 0x0490]
	.word 0x34800004  ! 708: BG	bg,a	<label_0x4>
	.word 0x8ed20009  ! 709: UMULcc_R	umulcc 	%r8, %r9, %r7
	.word 0xb06a0009  ! 710: UDIVX_R	udivx 	%r8, %r9, %r24
	.word 0xca7a0009  ! 711: SWAP_R	swap	%r5, [%r8 + %r9]
	.word 0xc46a2d68  ! 712: LDSTUB_I	ldstub	%r2, [%r8 + 0x0d68]
	.word 0x965a0009  ! 713: SMUL_R	smul 	%r8, %r9, %r11
	.word 0xc6ea2154  ! 714: LDSTUBA_I	ldstuba	%r3, [%r8 + 0x0154] %asi
	.word 0x82720009  ! 715: UDIV_R	udiv 	%r8, %r9, %r1
	.word 0xb7a20829  ! 716: FADDs	fadds	%f8, %f9, %f27
	.word 0xfa6a2d90  ! 717: LDSTUB_I	ldstub	%r29, [%r8 + 0x0d90]
	.word 0x8143c000  ! 718: STBAR	stbar
	.word 0xc3ea27ac  ! 719: PREFETCHA_I	prefetcha	[%r8, + 0x07ac] %asi, #one_read
	.word 0x24ca0004  ! 720: BRLEZ	brlez,a,pt	%8,<label_0xa0004>
	.word 0xc73a0009  ! 721: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc4ba2b28  ! 722: STDA_I	stda	%r2, [%r8 + 0x0b28] %asi
	.word 0x8e722704  ! 723: UDIV_I	udiv 	%r8, 0x0704, %r7
	.word 0xeaaa1009  ! 726: STBA_R	stba	%r21, [%r8 + %r9] 0x80
	.word 0xcb3a2c80  ! 729: STDF_I	std	%f5, [0x0c80, %r8]
	.word 0xfb3a0009  ! 730: STDF_R	std	%f29, [%r9, %r8]
	.word 0xdcaa1009  ! 731: STBA_R	stba	%r14, [%r8 + %r9] 0x80
	.word 0xaba209a9  ! 732: FDIVs	fdivs	%f8, %f9, %f21
	.word 0xcbe21009  ! 733: CASA_I	casa	[%r8] 0x80, %r9, %r5
	.word 0x9ba208a9  ! 734: FSUBs	fsubs	%f8, %f9, %f13
	.word 0xada209a9  ! 735: FDIVs	fdivs	%f8, %f9, %f22
	.word 0xf0a22258  ! 736: STWA_I	stwa	%r24, [%r8 + 0x0258] %asi
	.word 0xc4aa28c0  ! 737: STBA_I	stba	%r2, [%r8 + 0x08c0] %asi
	.word 0xc9220009  ! 738: STF_R	st	%f4, [%r9, %r8]
	.word 0x2ac20004  ! 739: BRNZ	brnz,a,nt	%8,<label_0x20004>
	.word 0x94522d30  ! 740: UMUL_I	umul 	%r8, 0x0d30, %r10
	.word 0xcd222440  ! 741: STF_I	st	%f6, [0x0440, %r8]
	.word 0xc2fa2024  ! 742: SWAPA_I	swapa	%r1, [%r8 + 0x0024] %asi
	.word 0x04800004  ! 743: BLE	ble  	<label_0x4>
	.word 0x82f20009  ! 744: UDIVcc_R	udivcc 	%r8, %r9, %r1
	.word 0xe0d22d34  ! 745: LDSHA_I	ldsha	[%r8, + 0x0d34] %asi, %r16
	.word 0xf2da2aa0  ! 746: LDXA_I	ldxa	[%r8, + 0x0aa0] %asi, %r25
	.word 0xc3ea28f8  ! 747: PREFETCHA_I	prefetcha	[%r8, + 0x08f8] %asi, #one_read
	.word 0xcafa1009  ! 748: SWAPA_R	swapa	%r5, [%r8 + %r9] 0x80
	.word 0xbafa0009  ! 749: SDIVcc_R	sdivcc 	%r8, %r9, %r29
	.word 0xc4a22428  ! 750: STWA_I	stwa	%r2, [%r8 + 0x0428] %asi
	.word 0xc8da2540  ! 751: LDXA_I	ldxa	[%r8, + 0x0540] %asi, %r4
	.word 0xd4fa2c8c  ! 752: SWAPA_I	swapa	%r10, [%r8 + 0x0c8c] %asi
	.word 0x40000008  ! 754: CALL	call	disp30_8
	.word 0xbda208a9  ! 755: FSUBs	fsubs	%f8, %f9, %f30
	.word 0xe2aa2e88  ! 756: STBA_I	stba	%r17, [%r8 + 0x0e88] %asi
	.word 0x20800008  ! 757: BN	bn,a	<label_0x8>
	.word 0x02c20004  ! 759: BRZ	brz  ,nt	%8,<label_0x20004>
	.word 0xccb22c1c  ! 760: STHA_I	stha	%r6, [%r8 + 0x0c1c] %asi
	.word 0xd81a0009  ! 761: LDD_R	ldd	[%r8 + %r9], %r12
	.word 0x844a288c  ! 762: MULX_I	mulx 	%r8, 0x088c, %r2
	.word 0xb27a274c  ! 763: SDIV_I	sdiv 	%r8, 0x074c, %r25
	.word 0xc2ea221c  ! 764: LDSTUBA_I	ldstuba	%r1, [%r8 + 0x021c] %asi
	.word 0x8da208a9  ! 765: FSUBs	fsubs	%f8, %f9, %f6
	.word 0x06ca0004  ! 766: BRLZ	brlz  ,pt	%8,<label_0xa0004>
	.word 0xceaa28b8  ! 767: STBA_I	stba	%r7, [%r8 + 0x08b8] %asi
	.word 0x8c5a25c0  ! 768: SMUL_I	smul 	%r8, 0x05c0, %r6
	.word 0x8143c000  ! 769: STBAR	stbar
	.word 0xcad21009  ! 770: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r5
	.word 0x8ba208a9  ! 771: FSUBs	fsubs	%f8, %f9, %f5
	.word 0xc8c21009  ! 772: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r4
	.word 0x8fa208a9  ! 773: FSUBs	fsubs	%f8, %f9, %f7
	.word 0xc8fa2000  ! 774: SWAPA_I	swapa	%r4, [%r8 + 0x0000] %asi
	.word 0x28800004  ! 775: BLEU	bleu,a	<label_0x4>
	.word 0xca8a1009  ! 776: LDUBA_R	lduba	[%r8, %r9] 0x80, %r5
	.word 0x3e800004  ! 777: BVC	bvc,a	<label_0x4>
	.word 0xe86a0009  ! 778: LDSTUB_R	ldstub	%r20, [%r8 + %r9]
	.word 0x1a800004  ! 779: BCC	bcc  	<label_0x4>
	.word 0x1c800004  ! 780: BPOS	bpos  	<label_0x4>
	.word 0xf46a2340  ! 781: LDSTUB_I	ldstub	%r26, [%r8 + 0x0340]
	.word 0x2aca0008  ! 782: BRNZ	brnz,a,pt	%8,<label_0xa0008>
	.word 0x8cda2e00  ! 783: SMULcc_I	smulcc 	%r8, 0x0e00, %r6
	.word 0xafa20829  ! 784: FADDs	fadds	%f8, %f9, %f23
	.word 0x8c4a0009  ! 785: MULX_R	mulx 	%r8, %r9, %r6
	.word 0xe0b21009  ! 786: STHA_R	stha	%r16, [%r8 + %r9] 0x80
	.word 0x8143e07c  ! 787: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xcc1229d8  ! 788: LDUH_I	lduh	[%r8 + 0x09d8], %r6
	.word 0xd7e22009  ! 789: CASA_R	casa	[%r8] %asi, %r9, %r11
	.word 0xccaa2054  ! 790: STBA_I	stba	%r6, [%r8 + 0x0054] %asi
	.word 0xcef22208  ! 791: STXA_I	stxa	%r7, [%r8 + 0x0208] %asi
	.word 0xc27a2f18  ! 792: SWAP_I	swap	%r1, [%r8 + 0x0f18]
	.word 0x8e7a2898  ! 793: SDIV_I	sdiv 	%r8, 0x0898, %r7
	.word 0xaf6a0009  ! 794: SDIVX_R	sdivx	%r8, %r9, %r23
	.word 0xc8ba1009  ! 795: STDA_R	stda	%r4, [%r8 + %r9] 0x80
	.word 0xc3ea2578  ! 796: PREFETCHA_I	prefetcha	[%r8, + 0x0578] %asi, #one_read
	.word 0x867a0009  ! 797: SDIV_R	sdiv 	%r8, %r9, %r3
	.word 0x8143c000  ! 798: STBAR	stbar
	.word 0xf2fa2854  ! 799: SWAPA_I	swapa	%r25, [%r8 + 0x0854] %asi
	.word 0xc4020009  ! 800: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0x8fa20929  ! 801: FMULs	fmuls	%f8, %f9, %f7
	.word 0x866a0009  ! 802: UDIVX_R	udivx 	%r8, %r9, %r3
	.word 0xcff21009  ! 803: CASXA_I	casxa	[%r8] 0x80, %r9, %r7
	.word 0x26c20008  ! 804: BRLZ	brlz,a,nt	%8,<label_0x20008>
	.word 0x896a29b8  ! 805: SDIVX_I	sdivx	%r8, 0x09b8, %r4
	.word 0x32800004  ! 806: BNE	bne,a	<label_0x4>
	.word 0xa7220009  ! 807: MULScc_R	mulscc 	%r8, %r9, %r19
	.word 0xc3ea2048  ! 808: PREFETCHA_I	prefetcha	[%r8, + 0x0048] %asi, #one_read
	.word 0xdcba2148  ! 809: STDA_I	stda	%r14, [%r8 + 0x0148] %asi
	.word 0xb5a20829  ! 810: FADDs	fadds	%f8, %f9, %f26
	.word 0x825a2818  ! 811: SMUL_I	smul 	%r8, 0x0818, %r1
	.word 0xccfa26c8  ! 812: SWAPA_I	swapa	%r6, [%r8 + 0x06c8] %asi
	.word 0x987a2274  ! 813: SDIV_I	sdiv 	%r8, 0x0274, %r12
	.word 0xc8c21009  ! 814: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r4
	.word 0xe01a0009  ! 815: LDD_R	ldd	[%r8 + %r9], %r16
	.word 0xc6d22a90  ! 816: LDSHA_I	ldsha	[%r8, + 0x0a90] %asi, %r3
	.word 0xc40a200c  ! 818: LDUB_I	ldub	[%r8 + 0x000c], %r2
	.word 0x89a20829  ! 819: FADDs	fadds	%f8, %f9, %f4
	.word 0xb6da0009  ! 820: SMULcc_R	smulcc 	%r8, %r9, %r27
	.word 0x8143c000  ! 821: STBAR	stbar
	.word 0xe4821009  ! 822: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r18
	.word 0xe4d21009  ! 823: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r18
	.word 0xe4b22338  ! 824: STHA_I	stha	%r18, [%r8 + 0x0338] %asi
	.word 0x9ad20009  ! 825: UMULcc_R	umulcc 	%r8, %r9, %r13
	.word 0xf13a0009  ! 826: STDF_R	std	%f24, [%r9, %r8]
	.word 0x8c7a0009  ! 827: SDIV_R	sdiv 	%r8, %r9, %r6
	.word 0xce7a0009  ! 828: SWAP_R	swap	%r7, [%r8 + %r9]
	.word 0xca0a0009  ! 829: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0x8c5a0009  ! 830: SMUL_R	smul 	%r8, %r9, %r6
	.word 0x98da0009  ! 831: SMULcc_R	smulcc 	%r8, %r9, %r12
	.word 0xc47a25b8  ! 832: SWAP_I	swap	%r2, [%r8 + 0x05b8]
	.word 0xc53a2f90  ! 833: STDF_I	std	%f2, [0x0f90, %r8]
	.word 0xdcba2770  ! 834: STDA_I	stda	%r14, [%r8 + 0x0770] %asi
	.word 0xc36a25cc  ! 835: PREFETCH_I	prefetch	[%r8 + 0x05cc], #one_read
	.word 0xc6aa1009  ! 838: STBA_R	stba	%r3, [%r8 + %r9] 0x80
	.word 0xcc7a0009  ! 840: SWAP_R	swap	%r6, [%r8 + %r9]
	.word 0xe0da1009  ! 841: LDXA_R	ldxa	[%r8, %r9] 0x80, %r16
	.word 0x34800008  ! 842: BG	bg,a	<label_0x8>
	.word 0xc6fa2f00  ! 843: SWAPA_I	swapa	%r3, [%r8 + 0x0f00] %asi
	.word 0x8143e07c  ! 844: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xc2ea1009  ! 847: LDSTUBA_R	ldstuba	%r1, [%r8 + %r9] 0x80
	.word 0xc6b21009  ! 848: STHA_R	stha	%r3, [%r8 + %r9] 0x80
	.word 0xdcba1009  ! 849: STDA_R	stda	%r14, [%r8 + %r9] 0x80
	.word 0x8e720009  ! 850: UDIV_R	udiv 	%r8, %r9, %r7
	.word 0x8143c000  ! 851: STBAR	stbar
	.word 0x8143c000  ! 852: STBAR	stbar
	.word 0xc36a2a90  ! 853: PREFETCH_I	prefetch	[%r8 + 0x0a90], #one_read
	.word 0xc9e22009  ! 854: CASA_R	casa	[%r8] %asi, %r9, %r4
	.word 0x82d20009  ! 856: UMULcc_R	umulcc 	%r8, %r9, %r1
	.word 0x83a20929  ! 857: FMULs	fmuls	%f8, %f9, %f1
	.word 0x8e522864  ! 858: UMUL_I	umul 	%r8, 0x0864, %r7
	.word 0x85a20929  ! 859: FMULs	fmuls	%f8, %f9, %f2
	.word 0x8143e00d  ! 860: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore 
	.word 0x84fa2fc4  ! 861: SDIVcc_I	sdivcc 	%r8, 0x0fc4, %r2
	.word 0xf33a2840  ! 862: STDF_I	std	%f25, [0x0840, %r8]
	.word 0xfef21009  ! 863: STXA_R	stxa	%r31, [%r8 + %r9] 0x80
	.word 0x8a7a2014  ! 864: SDIV_I	sdiv 	%r8, 0x0014, %r5
	.word 0x89a20929  ! 865: FMULs	fmuls	%f8, %f9, %f4
	.word 0x885229b4  ! 866: UMUL_I	umul 	%r8, 0x09b4, %r4
	.word 0x8cda0009  ! 867: SMULcc_R	smulcc 	%r8, %r9, %r6
	.word 0xc36a2300  ! 868: PREFETCH_I	prefetch	[%r8 + 0x0300], #one_read
	.word 0xca02241c  ! 869: LDUW_I	lduw	[%r8 + 0x041c], %r5
	.word 0x9a6a0009  ! 870: UDIVX_R	udivx 	%r8, %r9, %r13
	.word 0x8a7a2594  ! 871: SDIV_I	sdiv 	%r8, 0x0594, %r5
	.word 0x8143e074  ! 872: MEMBAR	membar	#LoadStore | #Lookaside | #MemIssue | #Sync 
	.word 0xd41a2a58  ! 873: LDD_I	ldd	[%r8 + 0x0a58], %r10
	.word 0xdaaa1009  ! 875: STBA_R	stba	%r13, [%r8 + %r9] 0x80
	.word 0x0cca0004  ! 876: BRGZ	brgz  ,pt	%8,<label_0xa0004>
	.word 0xe00a0009  ! 877: LDUB_R	ldub	[%r8 + %r9], %r16
	.word 0xaf6a2b1c  ! 878: SDIVX_I	sdivx	%r8, 0x0b1c, %r23
	.word 0x83a208a9  ! 879: FSUBs	fsubs	%f8, %f9, %f1
	.word 0xee6a0009  ! 881: LDSTUB_R	ldstub	%r23, [%r8 + %r9]
	.word 0x8ed20009  ! 882: UMULcc_R	umulcc 	%r8, %r9, %r7
	.word 0xf4a21009  ! 883: STWA_R	stwa	%r26, [%r8 + %r9] 0x80
	.word 0x10800004  ! 884: BA	ba  	<label_0x4>
	.word 0xccca2490  ! 885: LDSBA_I	ldsba	[%r8, + 0x0490] %asi, %r6
	.word 0x8da209a9  ! 886: FDIVs	fdivs	%f8, %f9, %f6
	.word 0x8143c000  ! 887: STBAR	stbar
	.word 0xccf21009  ! 888: STXA_R	stxa	%r6, [%r8 + %r9] 0x80
	.word 0xb06a2ad0  ! 889: UDIVX_I	udivx 	%r8, 0x0ad0, %r24
	.word 0xe6420009  ! 890: LDSW_R	ldsw	[%r8 + %r9], %r19
	.word 0x12800008  ! 891: BNE	bne  	<label_0x8>
	.word 0xc4ba2418  ! 892: STDA_I	stda	%r2, [%r8 + 0x0418] %asi
	.word 0xd86a2640  ! 893: LDSTUB_I	ldstub	%r12, [%r8 + 0x0640]
	.word 0x824a0009  ! 894: MULX_R	mulx 	%r8, %r9, %r1
	.word 0xc2aa2c08  ! 895: STBA_I	stba	%r1, [%r8 + 0x0c08] %asi
	.word 0xc24a2680  ! 896: LDSB_I	ldsb	[%r8 + 0x0680], %r1
	.word 0xfb2221d0  ! 897: STF_I	st	%f29, [0x01d0, %r8]
	.word 0xce8a1009  ! 898: LDUBA_R	lduba	[%r8, %r9] 0x80, %r7
	.word 0xc2fa228c  ! 899: SWAPA_I	swapa	%r1, [%r8 + 0x028c] %asi
	.word 0xc36a2248  ! 900: PREFETCH_I	prefetch	[%r8 + 0x0248], #one_read
	.word 0xb0fa0009  ! 902: SDIVcc_R	sdivcc 	%r8, %r9, %r24
	.word 0x8143c000  ! 903: STBAR	stbar
	.word 0xbf6a0009  ! 904: SDIVX_R	sdivx	%r8, %r9, %r31
	.word 0xb0d22db4  ! 905: UMULcc_I	umulcc 	%r8, 0x0db4, %r24
	.word 0xc5e22009  ! 907: CASA_R	casa	[%r8] %asi, %r9, %r2
	.word 0x8143c000  ! 908: STBAR	stbar
	.word 0xc6a21009  ! 909: STWA_R	stwa	%r3, [%r8 + %r9] 0x80
	.word 0xf2ea1009  ! 911: LDSTUBA_R	ldstuba	%r25, [%r8 + %r9] 0x80
	.word 0xd6fa1009  ! 912: SWAPA_R	swapa	%r11, [%r8 + %r9] 0x80
	.word 0x40000008  ! 913: CALL	call	disp30_8
	.word 0xacfa0009  ! 914: SDIVcc_R	sdivcc 	%r8, %r9, %r22
	.word 0xc65a2310  ! 915: LDX_I	ldx	[%r8 + 0x0310], %r3
	.word 0xa3a209a9  ! 916: FDIVs	fdivs	%f8, %f9, %f17
	.word 0xf7f22009  ! 917: CASXA_R	casxa	[%r8]%asi, %r9, %r27
	.word 0xc8da1009  ! 918: LDXA_R	ldxa	[%r8, %r9] 0x80, %r4
	.word 0xc3ea2d68  ! 919: PREFETCHA_I	prefetcha	[%r8, + 0x0d68] %asi, #one_read
	.word 0x2aca0004  ! 920: BRNZ	brnz,a,pt	%8,<label_0xa0004>
	.word 0xca4a0009  ! 921: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xc41a0009  ! 922: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x08800004  ! 923: BLEU	bleu  	<label_0x4>
	.word 0xc9e21009  ! 924: CASA_I	casa	[%r8] 0x80, %r9, %r4
	.word 0xc2522f68  ! 925: LDSH_I	ldsh	[%r8 + 0x0f68], %r1
	.word 0x40000004  ! 926: CALL	call	disp30_4
	.word 0xb47a241c  ! 927: SDIV_I	sdiv 	%r8, 0x041c, %r26
	.word 0x8e520009  ! 928: UMUL_R	umul 	%r8, %r9, %r7
	.word 0xc4fa1009  ! 929: SWAPA_R	swapa	%r2, [%r8 + %r9] 0x80
	.word 0x8143e014  ! 930: MEMBAR	membar	#LoadStore | #Lookaside 
	.word 0xc7220009  ! 931: STF_R	st	%f3, [%r9, %r8]
	.word 0x9b220009  ! 932: MULScc_R	mulscc 	%r8, %r9, %r13
	.word 0xccaa2bb0  ! 933: STBA_I	stba	%r6, [%r8 + 0x0bb0] %asi
	.word 0xc36a2d90  ! 934: PREFETCH_I	prefetch	[%r8 + 0x0d90], #one_read
	.word 0xc80a2518  ! 935: LDUB_I	ldub	[%r8 + 0x0518], %r4
	.word 0x827a0009  ! 936: SDIV_R	sdiv 	%r8, %r9, %r1
	.word 0x8cfa0009  ! 937: SDIVcc_R	sdivcc 	%r8, %r9, %r6
	.word 0xe0ba2398  ! 938: STDA_I	stda	%r16, [%r8 + 0x0398] %asi
	.word 0x89a209a9  ! 939: FDIVs	fdivs	%f8, %f9, %f4
	.word 0x85a20829  ! 940: FADDs	fadds	%f8, %f9, %f2
	.word 0x82fa249c  ! 941: SDIVcc_I	sdivcc 	%r8, 0x049c, %r1
	.word 0x00800004  ! 942: BN	bn  	<label_0x4>
	.word 0x8f6a2d88  ! 943: SDIVX_I	sdivx	%r8, 0x0d88, %r7
	.word 0x886a0009  ! 944: UDIVX_R	udivx 	%r8, %r9, %r4
	.word 0xc80a0009  ! 946: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0x8143e02b  ! 947: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #MemIssue 
	.word 0xc3e21009  ! 948: CASA_I	casa	[%r8] 0x80, %r9, %r1
	.word 0xc53a2b58  ! 949: STDF_I	std	%f2, [0x0b58, %r8]
	.word 0xc9220009  ! 950: STF_R	st	%f4, [%r9, %r8]
	.word 0x98720009  ! 951: UDIV_R	udiv 	%r8, %r9, %r12
	.word 0xccba1009  ! 952: STDA_R	stda	%r6, [%r8 + %r9] 0x80
	.word 0xc36a2b50  ! 953: PREFETCH_I	prefetch	[%r8 + 0x0b50], #one_read
	.word 0xc6b22fb4  ! 954: STHA_I	stha	%r3, [%r8 + 0x0fb4] %asi
	.word 0x8143c000  ! 955: STBAR	stbar
	.word 0x8143c000  ! 956: STBAR	stbar
	.word 0xfe7a2e80  ! 957: SWAP_I	swap	%r31, [%r8 + 0x0e80]
	.word 0x1c800004  ! 958: BPOS	bpos  	<label_0x4>
	.word 0xcefa2c9c  ! 962: SWAPA_I	swapa	%r7, [%r8 + 0x0c9c] %asi
	.word 0x8ba20929  ! 963: FMULs	fmuls	%f8, %f9, %f5
	.word 0xccaa1009  ! 964: STBA_R	stba	%r6, [%r8 + %r9] 0x80
	.word 0x82f20009  ! 965: UDIVcc_R	udivcc 	%r8, %r9, %r1
	.word 0x84da0009  ! 966: SMULcc_R	smulcc 	%r8, %r9, %r2
	.word 0x12800004  ! 967: BNE	bne  	<label_0x4>
	.word 0x8a4a2ad0  ! 968: MULX_I	mulx 	%r8, 0x0ad0, %r5
	.word 0x82f20009  ! 969: UDIVcc_R	udivcc 	%r8, %r9, %r1
	.word 0xc36a2054  ! 970: PREFETCH_I	prefetch	[%r8 + 0x0054], #one_read
	.word 0xcafa2480  ! 972: SWAPA_I	swapa	%r5, [%r8 + 0x0480] %asi
	.word 0xe8aa1009  ! 973: STBA_R	stba	%r20, [%r8 + %r9] 0x80
	.word 0xe3222f2c  ! 974: STF_I	st	%f17, [0x0f2c, %r8]
	.word 0xe4122d0c  ! 975: LDUH_I	lduh	[%r8 + 0x0d0c], %r18
	.word 0xcaca1009  ! 976: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r5
	.word 0xc20a0009  ! 977: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xaba20929  ! 978: FMULs	fmuls	%f8, %f9, %f21
	.word 0xc53a0009  ! 979: STDF_R	std	%f2, [%r9, %r8]
	.word 0x10800008  ! 980: BA	ba  	<label_0x8>
	.word 0xe41a2e28  ! 981: LDD_I	ldd	[%r8 + 0x0e28], %r18
	.word 0x844a0009  ! 983: MULX_R	mulx 	%r8, %r9, %r2
	.word 0x8143e048  ! 984: MEMBAR	membar	#StoreStore | #Sync 
	.word 0xd6120009  ! 985: LDUH_R	lduh	[%r8 + %r9], %r11
	.word 0xdc9a1009  ! 986: LDDA_R	ldda	[%r8, %r9] 0x80, %r14
	.word 0xfe522398  ! 987: LDSH_I	ldsh	[%r8 + 0x0398], %r31
	.word 0x8a6a2b8c  ! 988: UDIVX_I	udivx 	%r8, 0x0b8c, %r5
	.word 0xf7220009  ! 989: STF_R	st	%f27, [%r9, %r8]
	.word 0x22ca0004  ! 990: BRZ	brz,a,pt	%8,<label_0xa0004>
	.word 0xfa022728  ! 991: LDUW_I	lduw	[%r8 + 0x0728], %r29
	.word 0xeb222f68  ! 992: STF_I	st	%f21, [0x0f68, %r8]
	.word 0x8143e072  ! 993: MEMBAR	membar	#StoreLoad | #Lookaside | #MemIssue | #Sync 
	.word 0xc36a2d60  ! 994: PREFETCH_I	prefetch	[%r8 + 0x0d60], #one_read
	.word 0xdea21009  ! 996: STWA_R	stwa	%r15, [%r8 + %r9] 0x80
	.word 0x8143e029  ! 997: MEMBAR	membar	#LoadLoad | #StoreStore | #MemIssue 
	.word 0x885a0009  ! 998: SMUL_R	smul 	%r8, %r9, %r4
	.word 0x86f22c2c  ! 999: UDIVcc_I	udivcc 	%r8, 0x0c2c, %r3
        ta      T_GOOD_TRAP

th_main_3:
        setx  MAIN_BASE_DATA_VA, %r1, %r8
        setx  0x00000000000006a0, %g1, %r9
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
        setx  0x57bd5e2d77cb3910, %g1, %r0
        setx  0xf4d04b57fba85c92, %g1, %r1
        setx  0xa1189ae11f358797, %g1, %r2
        setx  0x32ef937c5c014dc0, %g1, %r3
        setx  0x737c4ca4a7b85d36, %g1, %r4
        setx  0x2dd1e5db8281edc8, %g1, %r5
        setx  0x911ac1f27c1ad166, %g1, %r6
        setx  0xb8502d32f1a91c9d, %g1, %r7
        setx  0xd9dd35096de22c17, %g1, %r10
        setx  0x777263baaf94361f, %g1, %r11
        setx  0x76a93392f93f3fef, %g1, %r12
        setx  0x69e31103fe10e37d, %g1, %r13
        setx  0x39b1ecc49b87167d, %g1, %r14
        setx  0xa02dc567b149b19b, %g1, %r15
        setx  0x3e34619a5b92d1bd, %g1, %r16
        setx  0x875adcb60d95992a, %g1, %r17
        setx  0xc9791ad063ca7704, %g1, %r18
        setx  0x3242d15aabd6f6ca, %g1, %r19
        setx  0xf7fa47cdc6613d50, %g1, %r20
        setx  0x3fb2a00a2e182e5d, %g1, %r21
        setx  0x26489dfd861c8359, %g1, %r22
        setx  0xff02777d0f8a6fef, %g1, %r23
        setx  0x1bf2bd37542a8120, %g1, %r24
        setx  0xb6d3ce4a7c8d109f, %g1, %r25
        setx  0x248a6f2b03a57bdc, %g1, %r26
        setx  0x3940d463c08e97de, %g1, %r27
        setx  0x019201c03d4da772, %g1, %r28
        setx  0xbb0b8615616c30cc, %g1, %r29
        setx  0x20f9ea61f99beaab, %g1, %r30
        setx  0xebfe94900fe5ff51, %g1, %r31
	.word 0x8d6a0009  ! 6: SDIVX_R	sdivx	%r8, %r9, %r6
	.word 0x8ba20929  ! 7: FMULs	fmuls	%f8, %f9, %f5
	.word 0xd67a0009  ! 8: SWAP_R	swap	%r11, [%r8 + %r9]
	.word 0xa0d22b8c  ! 9: UMULcc_I	umulcc 	%r8, 0x0b8c, %r16
	.word 0xcf3a2240  ! 10: STDF_I	std	%f7, [0x0240, %r8]
	.word 0xc8d21009  ! 11: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r4
	.word 0x8d6a28f8  ! 12: SDIVX_I	sdivx	%r8, 0x08f8, %r6
	.word 0x86720009  ! 13: UDIV_R	udiv 	%r8, %r9, %r3
	.word 0x8e4a0009  ! 14: MULX_R	mulx 	%r8, %r9, %r7
	.word 0xcaa21009  ! 15: STWA_R	stwa	%r5, [%r8 + %r9] 0x80
	.word 0x0a800008  ! 16: BCS	bcs  	<label_0x8>
	.word 0x83a209a9  ! 17: FDIVs	fdivs	%f8, %f9, %f1
	.word 0xc6f22130  ! 18: STXA_I	stxa	%r3, [%r8 + 0x0130] %asi
	.word 0x8143e03e  ! 19: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0xc3ea2060  ! 20: PREFETCHA_I	prefetcha	[%r8, + 0x0060] %asi, #one_read
	.word 0x8ba208a9  ! 21: FSUBs	fsubs	%f8, %f9, %f5
	.word 0xf0ba1009  ! 22: STDA_R	stda	%r24, [%r8 + %r9] 0x80
	.word 0xc44a2338  ! 23: LDSB_I	ldsb	[%r8 + 0x0338], %r2
	.word 0xc8aa2e94  ! 24: STBA_I	stba	%r4, [%r8 + 0x0e94] %asi
	.word 0x896a2628  ! 25: SDIVX_I	sdivx	%r8, 0x0628, %r4
	.word 0xc8122220  ! 26: LDUH_I	lduh	[%r8 + 0x0220], %r4
	.word 0x9cfa0009  ! 27: SDIVcc_R	sdivcc 	%r8, %r9, %r14
	.word 0x16800008  ! 28: BGE	bge  	<label_0x8>
	.word 0x06800004  ! 29: BL	bl  	<label_0x4>
	.word 0xca822748  ! 30: LDUWA_I	lduwa	[%r8, + 0x0748] %asi, %r5
	.word 0x00800004  ! 31: BN	bn  	<label_0x4>
	.word 0xd44a24b4  ! 32: LDSB_I	ldsb	[%r8 + 0x04b4], %r10
	.word 0x0c800008  ! 33: BNEG	bneg  	<label_0x8>
	.word 0xc3ea2408  ! 34: PREFETCHA_I	prefetcha	[%r8, + 0x0408] %asi, #one_read
	.word 0xe07a23bc  ! 35: SWAP_I	swap	%r16, [%r8 + 0x03bc]
	.word 0xc8d22e18  ! 36: LDSHA_I	ldsha	[%r8, + 0x0e18] %asi, %r4
	.word 0x26800004  ! 37: BL	bl,a	<label_0x4>
	.word 0x8e5a2708  ! 38: SMUL_I	smul 	%r8, 0x0708, %r7
	.word 0x8b220009  ! 40: MULScc_R	mulscc 	%r8, %r9, %r5
	.word 0xd6120009  ! 41: LDUH_R	lduh	[%r8 + %r9], %r11
	.word 0xfea224dc  ! 42: STWA_I	stwa	%r31, [%r8 + 0x04dc] %asi
	.word 0xf9220009  ! 43: STF_R	st	%f28, [%r9, %r8]
	.word 0xc5f21009  ! 44: CASXA_I	casxa	[%r8] 0x80, %r9, %r2
	.word 0x40000004  ! 45: CALL	call	disp30_4
	.word 0x0e800008  ! 46: BVS	bvs  	<label_0x8>
	.word 0x965228cc  ! 47: UMUL_I	umul 	%r8, 0x08cc, %r11
	.word 0x8143e05b  ! 48: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Lookaside | #Sync 
	.word 0x20800008  ! 49: BN	bn,a	<label_0x8>
	.word 0x8143c000  ! 50: STBAR	stbar
	.word 0xe5220009  ! 51: STF_R	st	%f18, [%r9, %r8]
	.word 0xc3ea2170  ! 52: PREFETCHA_I	prefetcha	[%r8, + 0x0170] %asi, #one_read
	.word 0xe86a2514  ! 53: LDSTUB_I	ldstub	%r20, [%r8 + 0x0514]
	.word 0xc8ca2908  ! 55: LDSBA_I	ldsba	[%r8, + 0x0908] %asi, %r4
	.word 0xf0fa1009  ! 60: SWAPA_R	swapa	%r24, [%r8 + %r9] 0x80
	.word 0x8143e06f  ! 61: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #MemIssue | #Sync 
	.word 0x8143c000  ! 62: STBAR	stbar
	.word 0x88d22320  ! 63: UMULcc_I	umulcc 	%r8, 0x0320, %r4
	.word 0x8a5a2174  ! 64: SMUL_I	smul 	%r8, 0x0174, %r5
	.word 0xc6520009  ! 65: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0x08800004  ! 66: BLEU	bleu  	<label_0x4>
	.word 0x9a7a2d98  ! 67: SDIV_I	sdiv 	%r8, 0x0d98, %r13
	.word 0xc4420009  ! 68: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xc3ea2c40  ! 69: PREFETCHA_I	prefetcha	[%r8, + 0x0c40] %asi, #one_read
	.word 0x8143c000  ! 70: STBAR	stbar
	.word 0x847a2aa4  ! 71: SDIV_I	sdiv 	%r8, 0x0aa4, %r2
	.word 0xa44a2674  ! 73: MULX_I	mulx 	%r8, 0x0674, %r18
	.word 0x32800004  ! 74: BNE	bne,a	<label_0x4>
	.word 0xc4122a0c  ! 75: LDUH_I	lduh	[%r8 + 0x0a0c], %r2
	.word 0x8d6a2db4  ! 76: SDIVX_I	sdivx	%r8, 0x0db4, %r6
	.word 0x86f22660  ! 77: UDIVcc_I	udivcc 	%r8, 0x0660, %r3
	.word 0xccc22230  ! 78: LDSWA_I	ldswa	[%r8, + 0x0230] %asi, %r6
	.word 0x0a800004  ! 80: BCS	bcs  	<label_0x4>
	.word 0xcb3a2bd8  ! 81: STDF_I	std	%f5, [0x0bd8, %r8]
	.word 0xce7a0009  ! 82: SWAP_R	swap	%r7, [%r8 + %r9]
	.word 0xc36a24c4  ! 83: PREFETCH_I	prefetch	[%r8 + 0x04c4], #one_read
	.word 0xcf222880  ! 84: STF_I	st	%f7, [0x0880, %r8]
	.word 0xc4fa1009  ! 85: SWAPA_R	swapa	%r2, [%r8 + %r9] 0x80
	.word 0x16800008  ! 87: BGE	bge  	<label_0x8>
	.word 0xc4b21009  ! 88: STHA_R	stha	%r2, [%r8 + %r9] 0x80
	.word 0xc4f21009  ! 90: STXA_R	stxa	%r2, [%r8 + %r9] 0x80
	.word 0x3e800004  ! 91: BVC	bvc,a	<label_0x4>
	.word 0xc2fa25b0  ! 92: SWAPA_I	swapa	%r1, [%r8 + 0x05b0] %asi
	.word 0x8fa209a9  ! 93: FDIVs	fdivs	%f8, %f9, %f7
	.word 0x97a209a9  ! 95: FDIVs	fdivs	%f8, %f9, %f11
	.word 0x8cf22628  ! 96: UDIVcc_I	udivcc 	%r8, 0x0628, %r6
	.word 0x32800004  ! 97: BNE	bne,a	<label_0x4>
	.word 0x8143e037  ! 98: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside | #MemIssue 
	.word 0x8c522b2c  ! 99: UMUL_I	umul 	%r8, 0x0b2c, %r6
	.word 0x3e800004  ! 100: BVC	bvc,a	<label_0x4>
	.word 0x8c7a2df0  ! 101: SDIV_I	sdiv 	%r8, 0x0df0, %r6
	.word 0x04c20004  ! 102: BRLEZ	brlez  ,nt	%8,<label_0x20004>
	.word 0xc4d21009  ! 103: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r2
	.word 0x82f22500  ! 104: UDIVcc_I	udivcc 	%r8, 0x0500, %r1
	.word 0x8143e012  ! 105: MEMBAR	membar	#StoreLoad | #Lookaside 
	.word 0xc3ea2394  ! 106: PREFETCHA_I	prefetcha	[%r8, + 0x0394] %asi, #one_read
	.word 0xc4822840  ! 107: LDUWA_I	lduwa	[%r8, + 0x0840] %asi, %r2
	.word 0xc2420009  ! 108: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0x83220009  ! 109: MULScc_R	mulscc 	%r8, %r9, %r1
	.word 0x8143c000  ! 110: STBAR	stbar
	.word 0xc86a22fc  ! 111: LDSTUB_I	ldstub	%r4, [%r8 + 0x02fc]
	.word 0xfc1a2140  ! 112: LDD_I	ldd	[%r8 + 0x0140], %r30
	.word 0xec5a2068  ! 113: LDX_I	ldx	[%r8 + 0x0068], %r22
	.word 0xc612237c  ! 114: LDUH_I	lduh	[%r8 + 0x037c], %r3
	.word 0xaa7a2d48  ! 116: SDIV_I	sdiv 	%r8, 0x0d48, %r21
	.word 0x9e4a0009  ! 118: MULX_R	mulx 	%r8, %r9, %r15
	.word 0xc93a0009  ! 119: STDF_R	std	%f4, [%r9, %r8]
	.word 0x8fa20829  ! 120: FADDs	fadds	%f8, %f9, %f7
	.word 0x8143c000  ! 121: STBAR	stbar
	.word 0xce4a0009  ! 122: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0x08800004  ! 123: BLEU	bleu  	<label_0x4>
	.word 0x867a2f94  ! 124: SDIV_I	sdiv 	%r8, 0x0f94, %r3
	.word 0xc4d22da4  ! 125: LDSHA_I	ldsha	[%r8, + 0x0da4] %asi, %r2
	.word 0x8ba20929  ! 126: FMULs	fmuls	%f8, %f9, %f5
	.word 0xc4f21009  ! 127: STXA_R	stxa	%r2, [%r8 + %r9] 0x80
	.word 0xfc020009  ! 128: LDUW_R	lduw	[%r8 + %r9], %r30
	.word 0x00800004  ! 129: BN	bn  	<label_0x4>
	.word 0x3e800004  ! 130: BVC	bvc,a	<label_0x4>
	.word 0x84da2388  ! 131: SMULcc_I	smulcc 	%r8, 0x0388, %r2
	.word 0xcb222334  ! 132: STF_I	st	%f5, [0x0334, %r8]
	.word 0x2ec20004  ! 133: BRGEZ	brgez,a,nt	%8,<label_0x20004>
	.word 0xc36a2000  ! 134: PREFETCH_I	prefetch	[%r8 + 0x0000], #one_read
	.word 0x8e5227b0  ! 135: UMUL_I	umul 	%r8, 0x07b0, %r7
	.word 0xc7f21009  ! 136: CASXA_I	casxa	[%r8] 0x80, %r9, %r3
	.word 0x89a20829  ! 137: FADDs	fadds	%f8, %f9, %f4
	.word 0xc41a22d8  ! 138: LDD_I	ldd	[%r8 + 0x02d8], %r2
	.word 0xc4922030  ! 139: LDUHA_I	lduha	[%r8, + 0x0030] %asi, %r2
	.word 0x8eda2c88  ! 140: SMULcc_I	smulcc 	%r8, 0x0c88, %r7
	.word 0x846a0009  ! 141: UDIVX_R	udivx 	%r8, %r9, %r2
	.word 0xc27a29b0  ! 142: SWAP_I	swap	%r1, [%r8 + 0x09b0]
	.word 0x86f22b9c  ! 143: UDIVcc_I	udivcc 	%r8, 0x0b9c, %r3
	.word 0xc8b21009  ! 144: STHA_R	stha	%r4, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 145: STBAR	stbar
	.word 0xfc5a0009  ! 146: LDX_R	ldx	[%r8 + %r9], %r30
	.word 0x38800004  ! 147: BGU	bgu,a	<label_0x4>
	.word 0xc3ea209c  ! 148: PREFETCHA_I	prefetcha	[%r8, + 0x009c] %asi, #one_read
	.word 0x86720009  ! 149: UDIV_R	udiv 	%r8, %r9, %r3
	.word 0xa46a2710  ! 150: UDIVX_I	udivx 	%r8, 0x0710, %r18
	.word 0xcaea2ef0  ! 151: LDSTUBA_I	ldstuba	%r5, [%r8 + 0x0ef0] %asi
	.word 0xada208a9  ! 152: FSUBs	fsubs	%f8, %f9, %f22
	.word 0x0ac20008  ! 153: BRNZ	brnz  ,nt	%8,<label_0x20008>
	.word 0xc68a1009  ! 154: LDUBA_R	lduba	[%r8, %r9] 0x80, %r3
	.word 0x26c20004  ! 155: BRLZ	brlz,a,nt	%8,<label_0x20004>
	.word 0x8143c000  ! 156: STBAR	stbar
	.word 0x8143c000  ! 157: STBAR	stbar
	.word 0xc4420009  ! 158: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xc5e21009  ! 159: CASA_I	casa	[%r8] 0x80, %r9, %r2
	.word 0xd6f22cd8  ! 160: STXA_I	stxa	%r11, [%r8 + 0x0cd8] %asi
	.word 0xc36a2a4c  ! 161: PREFETCH_I	prefetch	[%r8 + 0x0a4c], #one_read
	.word 0xc85a2f20  ! 162: LDX_I	ldx	[%r8 + 0x0f20], %r4
	.word 0xd4f22a50  ! 163: STXA_I	stxa	%r10, [%r8 + 0x0a50] %asi
	.word 0x88522ef0  ! 165: UMUL_I	umul 	%r8, 0x0ef0, %r4
	.word 0xb8fa0009  ! 166: SDIVcc_R	sdivcc 	%r8, %r9, %r28
	.word 0xceaa2ae4  ! 167: STBA_I	stba	%r7, [%r8 + 0x0ae4] %asi
	.word 0xc8ea2f70  ! 168: LDSTUBA_I	ldstuba	%r4, [%r8 + 0x0f70] %asi
	.word 0xc24a0009  ! 169: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0x986a0009  ! 170: UDIVX_R	udivx 	%r8, %r9, %r12
	.word 0xcd3a0009  ! 171: STDF_R	std	%f6, [%r9, %r8]
	.word 0xe53a0009  ! 172: STDF_R	std	%f18, [%r9, %r8]
	.word 0xdc6a216c  ! 174: LDSTUB_I	ldstub	%r14, [%r8 + 0x016c]
	.word 0x8c4a0009  ! 175: MULX_R	mulx 	%r8, %r9, %r6
	.word 0x36800004  ! 176: BGE	bge,a	<label_0x4>
	.word 0xecba2560  ! 177: STDA_I	stda	%r22, [%r8 + 0x0560] %asi
	.word 0x887a2f08  ! 178: SDIV_I	sdiv 	%r8, 0x0f08, %r4
	.word 0xe09a2038  ! 179: LDDA_I	ldda	[%r8, + 0x0038] %asi, %r16
	.word 0x8c7a2180  ! 180: SDIV_I	sdiv 	%r8, 0x0180, %r6
	.word 0x16800008  ! 181: BGE	bge  	<label_0x8>
	.word 0xcc6a0009  ! 182: LDSTUB_R	ldstub	%r6, [%r8 + %r9]
	.word 0xc36a27dc  ! 183: PREFETCH_I	prefetch	[%r8 + 0x07dc], #one_read
	.word 0x83222dc0  ! 184: MULScc_I	mulscc 	%r8, 0x0dc0, %r1
	.word 0xcab22edc  ! 185: STHA_I	stha	%r5, [%r8 + 0x0edc] %asi
	.word 0x83a20829  ! 186: FADDs	fadds	%f8, %f9, %f1
	.word 0xcf3a2e08  ! 187: STDF_I	std	%f7, [0x0e08, %r8]
	.word 0x864a0009  ! 188: MULX_R	mulx 	%r8, %r9, %r3
	.word 0xcc9220bc  ! 189: LDUHA_I	lduha	[%r8, + 0x00bc] %asi, %r6
	.word 0xc88a1009  ! 190: LDUBA_R	lduba	[%r8, %r9] 0x80, %r4
	.word 0x1c800004  ! 191: BPOS	bpos  	<label_0x4>
	.word 0x8c7a0009  ! 193: SDIV_R	sdiv 	%r8, %r9, %r6
	.word 0x896a2750  ! 194: SDIVX_I	sdivx	%r8, 0x0750, %r4
	.word 0xc7e22009  ! 195: CASA_R	casa	[%r8] %asi, %r9, %r3
	.word 0xeea22c44  ! 196: STWA_I	stwa	%r23, [%r8 + 0x0c44] %asi
	.word 0xc8520009  ! 197: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xe4422968  ! 198: LDSW_I	ldsw	[%r8 + 0x0968], %r18
	.word 0x87a209a9  ! 199: FDIVs	fdivs	%f8, %f9, %f3
	.word 0x02800008  ! 200: BE	be  	<label_0x8>
	.word 0xbf6a0009  ! 201: SDIVX_R	sdivx	%r8, %r9, %r31
	.word 0x8d220009  ! 202: MULScc_R	mulscc 	%r8, %r9, %r6
	.word 0x867a0009  ! 203: SDIV_R	sdiv 	%r8, %r9, %r3
	.word 0xfc4a0009  ! 204: LDSB_R	ldsb	[%r8 + %r9], %r30
	.word 0xc3ea2ecc  ! 205: PREFETCHA_I	prefetcha	[%r8, + 0x0ecc] %asi, #one_read
	.word 0xca420009  ! 206: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xc3e21009  ! 207: CASA_I	casa	[%r8] 0x80, %r9, %r1
	.word 0xce4a0009  ! 209: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xd4ca2e00  ! 210: LDSBA_I	ldsba	[%r8, + 0x0e00] %asi, %r10
	.word 0xc6b228a0  ! 211: STHA_I	stha	%r3, [%r8 + 0x08a0] %asi
	.word 0xca022a54  ! 213: LDUW_I	lduw	[%r8 + 0x0a54], %r5
	.word 0xa0fa28a4  ! 214: SDIVcc_I	sdivcc 	%r8, 0x08a4, %r16
	.word 0xc84a0009  ! 215: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xc3e21009  ! 216: CASA_I	casa	[%r8] 0x80, %r9, %r1
	.word 0xc40a263c  ! 217: LDUB_I	ldub	[%r8 + 0x063c], %r2
	.word 0xb1a209a9  ! 218: FDIVs	fdivs	%f8, %f9, %f24
	.word 0xce4a0009  ! 219: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xc3ea2334  ! 220: PREFETCHA_I	prefetcha	[%r8, + 0x0334] %asi, #one_read
	.word 0xc8ca1009  ! 221: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r4
	.word 0x8143e021  ! 222: MEMBAR	membar	#LoadLoad | #MemIssue 
	.word 0x8143c000  ! 223: STBAR	stbar
	.word 0xe2b22d88  ! 224: STHA_I	stha	%r17, [%r8 + 0x0d88] %asi
	.word 0xcefa1009  ! 225: SWAPA_R	swapa	%r7, [%r8 + %r9] 0x80
	.word 0xa24a22e4  ! 226: MULX_I	mulx 	%r8, 0x02e4, %r17
	.word 0x83a208a9  ! 227: FSUBs	fsubs	%f8, %f9, %f1
	.word 0x2c800004  ! 228: BNEG	bneg,a	<label_0x4>
	.word 0x8cda20c4  ! 229: SMULcc_I	smulcc 	%r8, 0x00c4, %r6
	.word 0xc4c21009  ! 230: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r2
	.word 0x8143e05b  ! 231: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Lookaside | #Sync 
	.word 0x867a29f8  ! 232: SDIV_I	sdiv 	%r8, 0x09f8, %r3
	.word 0x2ac20008  ! 233: BRNZ	brnz,a,nt	%8,<label_0x20008>
	.word 0x24800008  ! 234: BLE	ble,a	<label_0x8>
	.word 0x8e7220a4  ! 235: UDIV_I	udiv 	%r8, 0x00a4, %r7
	.word 0xc4d225a8  ! 236: LDSHA_I	ldsha	[%r8, + 0x05a8] %asi, %r2
	.word 0xc81a2470  ! 237: LDD_I	ldd	[%r8 + 0x0470], %r4
	.word 0xc8ba2938  ! 238: STDA_I	stda	%r4, [%r8 + 0x0938] %asi
	.word 0xc36a24d0  ! 239: PREFETCH_I	prefetch	[%r8 + 0x04d0], #one_read
	.word 0xc4da22b8  ! 240: LDXA_I	ldxa	[%r8, + 0x02b8] %asi, %r2
	.word 0x8143e047  ! 241: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Sync 
	.word 0x8143e070  ! 242: MEMBAR	membar	#Lookaside | #MemIssue | #Sync 
	.word 0x844a0009  ! 243: MULX_R	mulx 	%r8, %r9, %r2
	.word 0xacd22660  ! 244: UMULcc_I	umulcc 	%r8, 0x0660, %r22
	.word 0x8143c000  ! 245: STBAR	stbar
	.word 0xcea22624  ! 246: STWA_I	stwa	%r7, [%r8 + 0x0624] %asi
	.word 0xe7f22009  ! 247: CASXA_R	casxa	[%r8]%asi, %r9, %r19
	.word 0xe73a2d40  ! 248: STDF_I	std	%f19, [0x0d40, %r8]
	.word 0xc88a2be0  ! 249: LDUBA_I	lduba	[%r8, + 0x0be0] %asi, %r4
	.word 0x8143e03b  ! 250: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Lookaside | #MemIssue 
	.word 0xcc4228ec  ! 251: LDSW_I	ldsw	[%r8 + 0x08ec], %r6
	.word 0xc61221a0  ! 252: LDUH_I	lduh	[%r8 + 0x01a0], %r3
	.word 0x8f6a0009  ! 253: SDIVX_R	sdivx	%r8, %r9, %r7
	.word 0x827a2e4c  ! 254: SDIV_I	sdiv 	%r8, 0x0e4c, %r1
	.word 0xced229d8  ! 255: LDSHA_I	ldsha	[%r8, + 0x09d8] %asi, %r7
	.word 0x84522224  ! 256: UMUL_I	umul 	%r8, 0x0224, %r2
	.word 0x95a20929  ! 257: FMULs	fmuls	%f8, %f9, %f10
	.word 0x8143c000  ! 258: STBAR	stbar
	.word 0xe6120009  ! 259: LDUH_R	lduh	[%r8 + %r9], %r19
	.word 0xfc1a0009  ! 260: LDD_R	ldd	[%r8 + %r9], %r30
	.word 0x10800008  ! 261: BA	ba  	<label_0x8>
	.word 0xc2c22ac8  ! 262: LDSWA_I	ldswa	[%r8, + 0x0ac8] %asi, %r1
	.word 0x8ef22684  ! 263: UDIVcc_I	udivcc 	%r8, 0x0684, %r7
	.word 0xdeea1009  ! 264: LDSTUBA_R	ldstuba	%r15, [%r8 + %r9] 0x80
	.word 0x89a20829  ! 265: FADDs	fadds	%f8, %f9, %f4
	.word 0x8fa20829  ! 266: FADDs	fadds	%f8, %f9, %f7
	.word 0x8cda247c  ! 267: SMULcc_I	smulcc 	%r8, 0x047c, %r6
	.word 0xcafa2054  ! 268: SWAPA_I	swapa	%r5, [%r8 + 0x0054] %asi
	.word 0xc49a2a50  ! 269: LDDA_I	ldda	[%r8, + 0x0a50] %asi, %r2
	.word 0xf7222868  ! 270: STF_I	st	%f27, [0x0868, %r8]
	.word 0xcf3a2b38  ! 271: STDF_I	std	%f7, [0x0b38, %r8]
	.word 0x10800008  ! 272: BA	ba  	<label_0x8>
	.word 0xc4f21009  ! 273: STXA_R	stxa	%r2, [%r8 + %r9] 0x80
	.word 0x825a0009  ! 274: SMUL_R	smul 	%r8, %r9, %r1
	.word 0x95a208a9  ! 275: FSUBs	fsubs	%f8, %f9, %f10
	.word 0x12800004  ! 276: BNE	bne  	<label_0x4>
	.word 0xccea2ca8  ! 277: LDSTUBA_I	ldstuba	%r6, [%r8 + 0x0ca8] %asi
	.word 0xc3ea2a9c  ! 278: PREFETCHA_I	prefetcha	[%r8, + 0x0a9c] %asi, #one_read
	.word 0xc2822f1c  ! 280: LDUWA_I	lduwa	[%r8, + 0x0f1c] %asi, %r1
	.word 0xc4b22028  ! 281: STHA_I	stha	%r2, [%r8 + 0x0028] %asi
	.word 0xe2921009  ! 282: LDUHA_R	lduha	[%r8, %r9] 0x80, %r17
	.word 0x8143e015  ! 283: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside 
	.word 0xbe522700  ! 284: UMUL_I	umul 	%r8, 0x0700, %r31
	.word 0x8ada0009  ! 287: SMULcc_R	smulcc 	%r8, %r9, %r5
	.word 0xeac2242c  ! 288: LDSWA_I	ldswa	[%r8, + 0x042c] %asi, %r21
	.word 0x85a208a9  ! 290: FSUBs	fsubs	%f8, %f9, %f2
	.word 0x8143c000  ! 291: STBAR	stbar
	.word 0x8ba209a9  ! 292: FDIVs	fdivs	%f8, %f9, %f5
	.word 0xcca22270  ! 293: STWA_I	stwa	%r6, [%r8 + 0x0270] %asi
	.word 0xf2aa2e60  ! 294: STBA_I	stba	%r25, [%r8 + 0x0e60] %asi
	.word 0x06800004  ! 295: BL	bl  	<label_0x4>
	.word 0xc36a2fa0  ! 296: PREFETCH_I	prefetch	[%r8 + 0x0fa0], #one_read
	.word 0xea6a2698  ! 297: LDSTUB_I	ldstub	%r21, [%r8 + 0x0698]
	.word 0x9fa20929  ! 298: FMULs	fmuls	%f8, %f9, %f15
	.word 0xc28226d0  ! 299: LDUWA_I	lduwa	[%r8, + 0x06d0] %asi, %r1
	.word 0xd6a228ac  ! 300: STWA_I	stwa	%r11, [%r8 + 0x08ac] %asi
	.word 0xcea21009  ! 301: STWA_R	stwa	%r7, [%r8 + %r9] 0x80
	.word 0x02ca0004  ! 302: BRZ	brz  ,pt	%8,<label_0xa0004>
	.word 0x82fa0009  ! 303: SDIVcc_R	sdivcc 	%r8, %r9, %r1
	.word 0xc28a1009  ! 304: LDUBA_R	lduba	[%r8, %r9] 0x80, %r1
	.word 0xced22f2c  ! 305: LDSHA_I	ldsha	[%r8, + 0x0f2c] %asi, %r7
	.word 0xc8922a40  ! 306: LDUHA_I	lduha	[%r8, + 0x0a40] %asi, %r4
	.word 0x8143e024  ! 308: MEMBAR	membar	#LoadStore | #MemIssue 
	.word 0xe4ea1009  ! 309: LDSTUBA_R	ldstuba	%r18, [%r8 + %r9] 0x80
	.word 0xc36a2078  ! 310: PREFETCH_I	prefetch	[%r8 + 0x0078], #one_read
	.word 0x88da0009  ! 311: SMULcc_R	smulcc 	%r8, %r9, %r4
	.word 0xcef21009  ! 312: STXA_R	stxa	%r7, [%r8 + %r9] 0x80
	.word 0x0e800008  ! 313: BVS	bvs  	<label_0x8>
	.word 0x8c522d40  ! 314: UMUL_I	umul 	%r8, 0x0d40, %r6
	.word 0x8e7228c8  ! 315: UDIV_I	udiv 	%r8, 0x08c8, %r7
	.word 0xcf3a0009  ! 316: STDF_R	std	%f7, [%r9, %r8]
	.word 0x02c20004  ! 317: BRZ	brz  ,nt	%8,<label_0x20004>
	.word 0x8a520009  ! 318: UMUL_R	umul 	%r8, %r9, %r5
	.word 0xcf220009  ! 320: STF_R	st	%f7, [%r9, %r8]
	.word 0x8143e07b  ! 321: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0x8d6a0009  ! 323: SDIVX_R	sdivx	%r8, %r9, %r6
	.word 0x8143c000  ! 324: STBAR	stbar
	.word 0xc3f21009  ! 325: CASXA_I	casxa	[%r8] 0x80, %r9, %r1
	.word 0x8143c000  ! 326: STBAR	stbar
	.word 0xc36a27cc  ! 327: PREFETCH_I	prefetch	[%r8 + 0x07cc], #one_read
	.word 0xce7a2bb8  ! 328: SWAP_I	swap	%r7, [%r8 + 0x0bb8]
	.word 0xc27a2f24  ! 329: SWAP_I	swap	%r1, [%r8 + 0x0f24]
	.word 0xf6a21009  ! 330: STWA_R	stwa	%r27, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 331: STBAR	stbar
	.word 0xe8ba1009  ! 332: STDA_R	stda	%r20, [%r8 + %r9] 0x80
	.word 0x8143e00d  ! 333: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore 
	.word 0x8143e02d  ! 334: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #MemIssue 
	.word 0x1e800004  ! 335: BVC	bvc  	<label_0x4>
	.word 0xcf222b1c  ! 336: STF_I	st	%f7, [0x0b1c, %r8]
	.word 0x10800004  ! 337: BA	ba  	<label_0x4>
	.word 0xcaa22ae8  ! 338: STWA_I	stwa	%r5, [%r8 + 0x0ae8] %asi
	.word 0x8af20009  ! 339: UDIVcc_R	udivcc 	%r8, %r9, %r5
	.word 0xc6aa1009  ! 340: STBA_R	stba	%r3, [%r8 + %r9] 0x80
	.word 0x1a800004  ! 341: BCC	bcc  	<label_0x4>
	.word 0xe0ba2a00  ! 342: STDA_I	stda	%r16, [%r8 + 0x0a00] %asi
	.word 0x8ada2c58  ! 343: SMULcc_I	smulcc 	%r8, 0x0c58, %r5
	.word 0x04800004  ! 344: BLE	ble  	<label_0x4>
	.word 0xc49220a4  ! 345: LDUHA_I	lduha	[%r8, + 0x00a4] %asi, %r2
	.word 0xce5a2948  ! 346: LDX_I	ldx	[%r8 + 0x0948], %r7
	.word 0x88f2231c  ! 347: UDIVcc_I	udivcc 	%r8, 0x031c, %r4
	.word 0xfcba1009  ! 348: STDA_R	stda	%r30, [%r8 + %r9] 0x80
	.word 0x8ba20929  ! 349: FMULs	fmuls	%f8, %f9, %f5
	.word 0x1e800008  ! 350: BVC	bvc  	<label_0x8>
	.word 0xc4aa2b2c  ! 351: STBA_I	stba	%r2, [%r8 + 0x0b2c] %asi
	.word 0xf892289c  ! 352: LDUHA_I	lduha	[%r8, + 0x089c] %asi, %r28
	.word 0x8d6a2a70  ! 353: SDIVX_I	sdivx	%r8, 0x0a70, %r6
	.word 0xc6aa1009  ! 354: STBA_R	stba	%r3, [%r8 + %r9] 0x80
	.word 0x86720009  ! 355: UDIV_R	udiv 	%r8, %r9, %r3
	.word 0xc8fa1009  ! 356: SWAPA_R	swapa	%r4, [%r8 + %r9] 0x80
	.word 0x8143e043  ! 357: MEMBAR	membar	#LoadLoad | #StoreLoad | #Sync 
	.word 0xe8ea1009  ! 358: LDSTUBA_R	ldstuba	%r20, [%r8 + %r9] 0x80
	.word 0x36800004  ! 359: BGE	bge,a	<label_0x4>
	.word 0x96522948  ! 360: UMUL_I	umul 	%r8, 0x0948, %r11
	.word 0x86f22fd4  ! 361: UDIVcc_I	udivcc 	%r8, 0x0fd4, %r3
	.word 0xcc4a2a4c  ! 362: LDSB_I	ldsb	[%r8 + 0x0a4c], %r6
	.word 0x8143e078  ! 363: MEMBAR	membar	#StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0x86f22e70  ! 364: UDIVcc_I	udivcc 	%r8, 0x0e70, %r3
	.word 0xfeea1009  ! 365: LDSTUBA_R	ldstuba	%r31, [%r8 + %r9] 0x80
	.word 0xc3ea227c  ! 366: PREFETCHA_I	prefetcha	[%r8, + 0x027c] %asi, #one_read
	.word 0xcca222a8  ! 367: STWA_I	stwa	%r6, [%r8 + 0x02a8] %asi
	.word 0xd8ba2ab8  ! 369: STDA_I	stda	%r12, [%r8 + 0x0ab8] %asi
	.word 0x8ba208a9  ! 370: FSUBs	fsubs	%f8, %f9, %f5
	.word 0xfde22009  ! 372: CASA_R	casa	[%r8] %asi, %r9, %r30
	.word 0xc4ea1009  ! 373: LDSTUBA_R	ldstuba	%r2, [%r8 + %r9] 0x80
	.word 0x83a20829  ! 375: FADDs	fadds	%f8, %f9, %f1
	.word 0xceaa1009  ! 376: STBA_R	stba	%r7, [%r8 + %r9] 0x80
	.word 0x8ed22200  ! 377: UMULcc_I	umulcc 	%r8, 0x0200, %r7
	.word 0x2ec20008  ! 378: BRGEZ	brgez,a,nt	%8,<label_0x20008>
	.word 0x00800008  ! 379: BN	bn  	<label_0x8>
	.word 0xfc5a0009  ! 380: LDX_R	ldx	[%r8 + %r9], %r30
	.word 0xc3ea2d20  ! 381: PREFETCHA_I	prefetcha	[%r8, + 0x0d20] %asi, #one_read
	.word 0x08800004  ! 382: BLEU	bleu  	<label_0x4>
	.word 0xc6a22980  ! 384: STWA_I	stwa	%r3, [%r8 + 0x0980] %asi
	.word 0x38800004  ! 385: BGU	bgu,a	<label_0x4>
	.word 0x2c800004  ! 386: BNEG	bneg,a	<label_0x4>
	.word 0xc9f22009  ! 387: CASXA_R	casxa	[%r8]%asi, %r9, %r4
	.word 0x8143e075  ! 388: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside | #MemIssue | #Sync 
	.word 0xf8aa2ccc  ! 389: STBA_I	stba	%r28, [%r8 + 0x0ccc] %asi
	.word 0xbba208a9  ! 390: FSUBs	fsubs	%f8, %f9, %f29
	.word 0xcc4a0009  ! 391: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xc2fa1009  ! 392: SWAPA_R	swapa	%r1, [%r8 + %r9] 0x80
	.word 0xc2921009  ! 393: LDUHA_R	lduha	[%r8, %r9] 0x80, %r1
	.word 0xc3ea2ff0  ! 394: PREFETCHA_I	prefetcha	[%r8, + 0x0ff0] %asi, #one_read
	.word 0xba5a0009  ! 395: SMUL_R	smul 	%r8, %r9, %r29
	.word 0x86f22a98  ! 396: UDIVcc_I	udivcc 	%r8, 0x0a98, %r3
	.word 0x9da20829  ! 397: FADDs	fadds	%f8, %f9, %f14
	.word 0x8a7a2224  ! 398: SDIV_I	sdiv 	%r8, 0x0224, %r5
	.word 0xceb21009  ! 399: STHA_R	stha	%r7, [%r8 + %r9] 0x80
	.word 0x30800004  ! 401: BA	ba,a	<label_0x4>
	.word 0x06ca0004  ! 402: BRLZ	brlz  ,pt	%8,<label_0xa0004>
	.word 0x8143e056  ! 403: MEMBAR	membar	#StoreLoad | #LoadStore | #Lookaside | #Sync 
	.word 0x8afa28f0  ! 404: SDIVcc_I	sdivcc 	%r8, 0x08f0, %r5
	.word 0x8143e019  ! 406: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside 
	.word 0xe842269c  ! 407: LDSW_I	ldsw	[%r8 + 0x069c], %r20
	.word 0xc26a231c  ! 408: LDSTUB_I	ldstub	%r1, [%r8 + 0x031c]
	.word 0xe20a0009  ! 409: LDUB_R	ldub	[%r8 + %r9], %r17
	.word 0xc33a0009  ! 410: STDF_R	std	%f1, [%r9, %r8]
	.word 0xcaaa1009  ! 411: STBA_R	stba	%r5, [%r8 + %r9] 0x80
	.word 0x8143e042  ! 412: MEMBAR	membar	#StoreLoad | #Sync 
	.word 0xd7220009  ! 413: STF_R	st	%f11, [%r9, %r8]
	.word 0xe80a0009  ! 414: LDUB_R	ldub	[%r8 + %r9], %r20
	.word 0xc36a2134  ! 415: PREFETCH_I	prefetch	[%r8 + 0x0134], #one_read
	.word 0x8afa2bf0  ! 416: SDIVcc_I	sdivcc 	%r8, 0x0bf0, %r5
	.word 0xc21220d8  ! 417: LDUH_I	lduh	[%r8 + 0x00d8], %r1
	.word 0x8ada0009  ! 418: SMULcc_R	smulcc 	%r8, %r9, %r5
	.word 0xf81a0009  ! 419: LDD_R	ldd	[%r8 + %r9], %r28
	.word 0x8cd22010  ! 420: UMULcc_I	umulcc 	%r8, 0x0010, %r6
	.word 0x8fa20829  ! 422: FADDs	fadds	%f8, %f9, %f7
	.word 0xacda0009  ! 423: SMULcc_R	smulcc 	%r8, %r9, %r22
	.word 0x8ba209a9  ! 425: FDIVs	fdivs	%f8, %f9, %f5
	.word 0xc6aa2724  ! 426: STBA_I	stba	%r3, [%r8 + 0x0724] %asi
	.word 0xb0da2cd8  ! 427: SMULcc_I	smulcc 	%r8, 0x0cd8, %r24
	.word 0xc4f21009  ! 428: STXA_R	stxa	%r2, [%r8 + %r9] 0x80
	.word 0xcc6a0009  ! 429: LDSTUB_R	ldstub	%r6, [%r8 + %r9]
	.word 0xbda209a9  ! 430: FDIVs	fdivs	%f8, %f9, %f30
	.word 0xe00a240c  ! 431: LDUB_I	ldub	[%r8 + 0x040c], %r16
	.word 0x8f220009  ! 432: MULScc_R	mulscc 	%r8, %r9, %r7
	.word 0xebf22009  ! 433: CASXA_R	casxa	[%r8]%asi, %r9, %r21
	.word 0xca6a2cb8  ! 434: LDSTUB_I	ldstub	%r5, [%r8 + 0x0cb8]
	.word 0xcf3a2540  ! 435: STDF_I	std	%f7, [0x0540, %r8]
	.word 0xfa020009  ! 436: LDUW_R	lduw	[%r8 + %r9], %r29
	.word 0xf6aa1009  ! 437: STBA_R	stba	%r27, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 438: STBAR	stbar
	.word 0xb6d229b4  ! 439: UMULcc_I	umulcc 	%r8, 0x09b4, %r27
	.word 0x8cda0009  ! 440: SMULcc_R	smulcc 	%r8, %r9, %r6
	.word 0x83a208a9  ! 441: FSUBs	fsubs	%f8, %f9, %f1
	.word 0xc7f22009  ! 442: CASXA_R	casxa	[%r8]%asi, %r9, %r3
	.word 0xc6ea2104  ! 443: LDSTUBA_I	ldstuba	%r3, [%r8 + 0x0104] %asi
	.word 0xfc120009  ! 444: LDUH_R	lduh	[%r8 + %r9], %r30
	.word 0x845a0009  ! 445: SMUL_R	smul 	%r8, %r9, %r2
	.word 0xb25a21ac  ! 446: SMUL_I	smul 	%r8, 0x01ac, %r25
	.word 0xc36a28ec  ! 447: PREFETCH_I	prefetch	[%r8 + 0x08ec], #one_read
	.word 0xfc7a27e4  ! 448: SWAP_I	swap	%r30, [%r8 + 0x07e4]
	.word 0xb64a27f0  ! 450: MULX_I	mulx 	%r8, 0x07f0, %r27
	.word 0xcaea2b10  ! 451: LDSTUBA_I	ldstuba	%r5, [%r8 + 0x0b10] %asi
	.word 0xcc5a0009  ! 452: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0x06ca0004  ! 453: BRLZ	brlz  ,pt	%8,<label_0xa0004>
	.word 0xc7e22009  ! 454: CASA_R	casa	[%r8] %asi, %r9, %r3
	.word 0xc6b22090  ! 455: STHA_I	stha	%r3, [%r8 + 0x0090] %asi
	.word 0xcad21009  ! 456: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r5
	.word 0xe6aa2bc0  ! 457: STBA_I	stba	%r19, [%r8 + 0x0bc0] %asi
	.word 0xe41a0009  ! 458: LDD_R	ldd	[%r8 + %r9], %r18
	.word 0xa5222268  ! 459: MULScc_I	mulscc 	%r8, 0x0268, %r18
	.word 0xca4a0009  ! 460: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xc4aa1009  ! 461: STBA_R	stba	%r2, [%r8 + %r9] 0x80
	.word 0xdeaa2268  ! 462: STBA_I	stba	%r15, [%r8 + 0x0268] %asi
	.word 0xc81a0009  ! 463: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xc3f22009  ! 464: CASXA_R	casxa	[%r8]%asi, %r9, %r1
	.word 0xeeb224e4  ! 465: STHA_I	stha	%r23, [%r8 + 0x04e4] %asi
	.word 0xc3ea2b08  ! 466: PREFETCHA_I	prefetcha	[%r8, + 0x0b08] %asi, #one_read
	.word 0x87a20929  ! 467: FMULs	fmuls	%f8, %f9, %f3
	.word 0xc49a1009  ! 470: LDDA_R	ldda	[%r8, %r9] 0x80, %r2
	.word 0x8143c000  ! 471: STBAR	stbar
	.word 0x18800004  ! 472: BGU	bgu  	<label_0x4>
	.word 0xfe120009  ! 473: LDUH_R	lduh	[%r8 + %r9], %r31
	.word 0xccd21009  ! 474: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r6
	.word 0x2eca0004  ! 475: BRGEZ	brgez,a,pt	%8,<label_0xa0004>
	.word 0x16800008  ! 476: BGE	bge  	<label_0x8>
	.word 0xa0722730  ! 477: UDIV_I	udiv 	%r8, 0x0730, %r16
	.word 0xc2da1009  ! 478: LDXA_R	ldxa	[%r8, %r9] 0x80, %r1
	.word 0x8143e005  ! 480: MEMBAR	membar	#LoadLoad | #LoadStore 
	.word 0x34800004  ! 481: BG	bg,a	<label_0x4>
	.word 0x8143e066  ! 482: MEMBAR	membar	#StoreLoad | #LoadStore | #MemIssue | #Sync 
	.word 0x8143e062  ! 483: MEMBAR	membar	#StoreLoad | #MemIssue | #Sync 
	.word 0x8ad20009  ! 484: UMULcc_R	umulcc 	%r8, %r9, %r5
	.word 0xe6d21009  ! 485: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r19
	.word 0x8da20929  ! 486: FMULs	fmuls	%f8, %f9, %f6
	.word 0x885a0009  ! 487: SMUL_R	smul 	%r8, %r9, %r4
	.word 0xf8ba2040  ! 488: STDA_I	stda	%r28, [%r8 + 0x0040] %asi
	.word 0x26c20004  ! 489: BRLZ	brlz,a,nt	%8,<label_0x20004>
	.word 0xceda23a0  ! 490: LDXA_I	ldxa	[%r8, + 0x03a0] %asi, %r7
	.word 0xb1220009  ! 491: MULScc_R	mulscc 	%r8, %r9, %r24
	.word 0x8e7a26f8  ! 492: SDIV_I	sdiv 	%r8, 0x06f8, %r7
	.word 0xc8a21009  ! 493: STWA_R	stwa	%r4, [%r8 + %r9] 0x80
	.word 0xc36a2f78  ! 494: PREFETCH_I	prefetch	[%r8 + 0x0f78], #one_read
	.word 0xde921009  ! 495: LDUHA_R	lduha	[%r8, %r9] 0x80, %r15
	.word 0xc28a1009  ! 496: LDUBA_R	lduba	[%r8, %r9] 0x80, %r1
	.word 0xf0ba1009  ! 497: STDA_R	stda	%r24, [%r8 + %r9] 0x80
	.word 0x1c800004  ! 498: BPOS	bpos  	<label_0x4>
	.word 0xe0b22684  ! 499: STHA_I	stha	%r16, [%r8 + 0x0684] %asi
	.word 0x2e800008  ! 500: BVS	bvs,a	<label_0x8>
	.word 0xd6520009  ! 501: LDSH_R	ldsh	[%r8 + %r9], %r11
	.word 0x8c7a0009  ! 502: SDIV_R	sdiv 	%r8, %r9, %r6
	.word 0xcc0a0009  ! 503: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0x8143c000  ! 504: STBAR	stbar
	.word 0xcc5a0009  ! 505: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0x83a209a9  ! 506: FDIVs	fdivs	%f8, %f9, %f1
	.word 0x8143c000  ! 507: STBAR	stbar
	.word 0xf4b22110  ! 508: STHA_I	stha	%r26, [%r8 + 0x0110] %asi
	.word 0x8143c000  ! 509: STBAR	stbar
	.word 0x0cc20004  ! 510: BRGZ	brgz  ,nt	%8,<label_0x20004>
	.word 0xc64a2efc  ! 511: LDSB_I	ldsb	[%r8 + 0x0efc], %r3
	.word 0x8a6a0009  ! 512: UDIVX_R	udivx 	%r8, %r9, %r5
	.word 0x83a209a9  ! 513: FDIVs	fdivs	%f8, %f9, %f1
	.word 0xc4fa28a8  ! 514: SWAPA_I	swapa	%r2, [%r8 + 0x08a8] %asi
	.word 0x88f22914  ! 515: UDIVcc_I	udivcc 	%r8, 0x0914, %r4
	.word 0x8143c000  ! 516: STBAR	stbar
	.word 0xc8922a1c  ! 517: LDUHA_I	lduha	[%r8, + 0x0a1c] %asi, %r4
	.word 0xc3ea2a88  ! 518: PREFETCHA_I	prefetcha	[%r8, + 0x0a88] %asi, #one_read
	.word 0xe13a0009  ! 519: STDF_R	std	%f16, [%r9, %r8]
	.word 0xea4a0009  ! 520: LDSB_R	ldsb	[%r8 + %r9], %r21
	.word 0x24ca0004  ! 521: BRLEZ	brlez,a,pt	%8,<label_0xa0004>
	.word 0xca5a2c68  ! 522: LDX_I	ldx	[%r8 + 0x0c68], %r5
	.word 0xecba1009  ! 524: STDA_R	stda	%r22, [%r8 + %r9] 0x80
	.word 0x18800004  ! 525: BGU	bgu  	<label_0x4>
	.word 0xc4120009  ! 527: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xf2d21009  ! 528: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r25
	.word 0x8ad20009  ! 529: UMULcc_R	umulcc 	%r8, %r9, %r5
	.word 0xe8122284  ! 530: LDUH_I	lduh	[%r8 + 0x0284], %r20
	.word 0xc53a0009  ! 531: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc5e22009  ! 532: CASA_R	casa	[%r8] %asi, %r9, %r2
	.word 0x84da2d64  ! 533: SMULcc_I	smulcc 	%r8, 0x0d64, %r2
	.word 0xc36a27a8  ! 534: PREFETCH_I	prefetch	[%r8 + 0x07a8], #one_read
	.word 0x956a0009  ! 535: SDIVX_R	sdivx	%r8, %r9, %r10
	.word 0xc8fa2eac  ! 536: SWAPA_I	swapa	%r4, [%r8 + 0x0eac] %asi
	.word 0xca7a0009  ! 537: SWAP_R	swap	%r5, [%r8 + %r9]
	.word 0xc86a25bc  ! 538: LDSTUB_I	ldstub	%r4, [%r8 + 0x05bc]
	.word 0xed2226d8  ! 541: STF_I	st	%f22, [0x06d8, %r8]
	.word 0xc3f21009  ! 542: CASXA_I	casxa	[%r8] 0x80, %r9, %r1
	.word 0x8143e011  ! 543: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x8e522bf4  ! 544: UMUL_I	umul 	%r8, 0x0bf4, %r7
	.word 0xc5220009  ! 545: STF_R	st	%f2, [%r9, %r8]
	.word 0x32800008  ! 546: BNE	bne,a	<label_0x8>
	.word 0xae6a22bc  ! 547: UDIVX_I	udivx 	%r8, 0x02bc, %r23
	.word 0xa122268c  ! 548: MULScc_I	mulscc 	%r8, 0x068c, %r16
	.word 0x846a2e5c  ! 549: UDIVX_I	udivx 	%r8, 0x0e5c, %r2
	.word 0x8a720009  ! 550: UDIV_R	udiv 	%r8, %r9, %r5
	.word 0xc36a26f0  ! 551: PREFETCH_I	prefetch	[%r8 + 0x06f0], #one_read
	.word 0xe6a220d8  ! 552: STWA_I	stwa	%r19, [%r8 + 0x00d8] %asi
	.word 0xf89a25e8  ! 554: LDDA_I	ldda	[%r8, + 0x05e8] %asi, %r28
	.word 0x30800004  ! 555: BA	ba,a	<label_0x4>
	.word 0xc8ca2284  ! 556: LDSBA_I	ldsba	[%r8, + 0x0284] %asi, %r4
	.word 0xe09a1009  ! 557: LDDA_R	ldda	[%r8, %r9] 0x80, %r16
	.word 0xc7f22009  ! 558: CASXA_R	casxa	[%r8]%asi, %r9, %r3
	.word 0x8a5a0009  ! 559: SMUL_R	smul 	%r8, %r9, %r5
	.word 0x0c800004  ! 561: BNEG	bneg  	<label_0x4>
	.word 0x86da0009  ! 563: SMULcc_R	smulcc 	%r8, %r9, %r3
	.word 0xcc5a29d8  ! 564: LDX_I	ldx	[%r8 + 0x09d8], %r6
	.word 0xfcba26f8  ! 565: STDA_I	stda	%r30, [%r8 + 0x06f8] %asi
	.word 0x8143e025  ! 566: MEMBAR	membar	#LoadLoad | #LoadStore | #MemIssue 
	.word 0xcc020009  ! 567: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xc36a20fc  ! 568: PREFETCH_I	prefetch	[%r8 + 0x00fc], #one_read
	.word 0xc8922828  ! 569: LDUHA_I	lduha	[%r8, + 0x0828] %asi, %r4
	.word 0xccaa1009  ! 570: STBA_R	stba	%r6, [%r8 + %r9] 0x80
	.word 0x04800008  ! 571: BLE	ble  	<label_0x8>
	.word 0x8143c000  ! 572: STBAR	stbar
	.word 0xd41a2da0  ! 574: LDD_I	ldd	[%r8 + 0x0da0], %r10
	.word 0x26800004  ! 575: BL	bl,a	<label_0x4>
	.word 0x8143e004  ! 576: MEMBAR	membar	#LoadStore 
	.word 0x9efa0009  ! 577: SDIVcc_R	sdivcc 	%r8, %r9, %r15
	.word 0x98da2604  ! 578: SMULcc_I	smulcc 	%r8, 0x0604, %r12
	.word 0x85a208a9  ! 579: FSUBs	fsubs	%f8, %f9, %f2
	.word 0x24ca0004  ! 580: BRLEZ	brlez,a,pt	%8,<label_0xa0004>
	.word 0xc8020009  ! 581: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0x8143c000  ! 582: STBAR	stbar
	.word 0xc2022f34  ! 583: LDUW_I	lduw	[%r8 + 0x0f34], %r1
	.word 0x1a800008  ! 584: BCC	bcc  	<label_0x8>
	.word 0x8143e04d  ! 585: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Sync 
	.word 0x82720009  ! 586: UDIV_R	udiv 	%r8, %r9, %r1
	.word 0xc4520009  ! 587: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0x88f220b0  ! 588: UDIVcc_I	udivcc 	%r8, 0x00b0, %r4
	.word 0xcf2224dc  ! 589: STF_I	st	%f7, [0x04dc, %r8]
	.word 0xc6b22830  ! 590: STHA_I	stha	%r3, [%r8 + 0x0830] %asi
	.word 0xee822d18  ! 591: LDUWA_I	lduwa	[%r8, + 0x0d18] %asi, %r23
	.word 0x84f20009  ! 592: UDIVcc_R	udivcc 	%r8, %r9, %r2
	.word 0x8143e01c  ! 593: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside 
	.word 0x844a25c0  ! 594: MULX_I	mulx 	%r8, 0x05c0, %r2
	.word 0xc2ea2510  ! 595: LDSTUBA_I	ldstuba	%r1, [%r8 + 0x0510] %asi
	.word 0x24800004  ! 596: BLE	ble,a	<label_0x4>
	.word 0xf6ca2040  ! 597: LDSBA_I	ldsba	[%r8, + 0x0040] %asi, %r27
	.word 0x9ba20829  ! 598: FADDs	fadds	%f8, %f9, %f13
	.word 0xf81a2290  ! 599: LDD_I	ldd	[%r8 + 0x0290], %r28
	.word 0xc9e22009  ! 600: CASA_R	casa	[%r8] %asi, %r9, %r4
	.word 0xe6da1009  ! 601: LDXA_R	ldxa	[%r8, %r9] 0x80, %r19
	.word 0xccf21009  ! 602: STXA_R	stxa	%r6, [%r8 + %r9] 0x80
	.word 0xb1220009  ! 603: MULScc_R	mulscc 	%r8, %r9, %r24
	.word 0xec6a0009  ! 604: LDSTUB_R	ldstub	%r22, [%r8 + %r9]
	.word 0x8ba208a9  ! 605: FSUBs	fsubs	%f8, %f9, %f5
	.word 0x8143e033  ! 606: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside | #MemIssue 
	.word 0x36800004  ! 607: BGE	bge,a	<label_0x4>
	.word 0xc8822940  ! 608: LDUWA_I	lduwa	[%r8, + 0x0940] %asi, %r4
	.word 0xd86a2344  ! 609: LDSTUB_I	ldstub	%r12, [%r8 + 0x0344]
	.word 0x8da20929  ! 610: FMULs	fmuls	%f8, %f9, %f6
	.word 0xc4a22660  ! 611: STWA_I	stwa	%r2, [%r8 + 0x0660] %asi
	.word 0xd41a2e70  ! 612: LDD_I	ldd	[%r8 + 0x0e70], %r10
	.word 0xa1a208a9  ! 613: FSUBs	fsubs	%f8, %f9, %f16
	.word 0xc5f21009  ! 614: CASXA_I	casxa	[%r8] 0x80, %r9, %r2
	.word 0xc3ea2ce8  ! 615: PREFETCHA_I	prefetcha	[%r8, + 0x0ce8] %asi, #one_read
	.word 0x8da209a9  ! 616: FDIVs	fdivs	%f8, %f9, %f6
	.word 0xa66a2cc8  ! 617: UDIVX_I	udivx 	%r8, 0x0cc8, %r19
	.word 0x944a2db8  ! 618: MULX_I	mulx 	%r8, 0x0db8, %r10
	.word 0x0cca0004  ! 620: BRGZ	brgz  ,pt	%8,<label_0xa0004>
	.word 0xc46a2e28  ! 621: LDSTUB_I	ldstub	%r2, [%r8 + 0x0e28]
	.word 0xc6520009  ! 622: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0x867a29f4  ! 623: SDIV_I	sdiv 	%r8, 0x09f4, %r3
	.word 0x8143c000  ! 624: STBAR	stbar
	.word 0x8143e018  ! 625: MEMBAR	membar	#StoreStore | #Lookaside 
	.word 0xf44a259c  ! 626: LDSB_I	ldsb	[%r8 + 0x059c], %r26
	.word 0xcd3a0009  ! 627: STDF_R	std	%f6, [%r9, %r8]
	.word 0x82fa0009  ! 628: SDIVcc_R	sdivcc 	%r8, %r9, %r1
	.word 0xccaa1009  ! 629: STBA_R	stba	%r6, [%r8 + %r9] 0x80
	.word 0x3a800004  ! 630: BCC	bcc,a	<label_0x4>
	.word 0xa2720009  ! 631: UDIV_R	udiv 	%r8, %r9, %r17
	.word 0x87220009  ! 632: MULScc_R	mulscc 	%r8, %r9, %r3
	.word 0x82fa0009  ! 633: SDIVcc_R	sdivcc 	%r8, %r9, %r1
	.word 0xe4ba1009  ! 634: STDA_R	stda	%r18, [%r8 + %r9] 0x80
	.word 0xcec22000  ! 635: LDSWA_I	ldswa	[%r8, + 0x0000] %asi, %r7
	.word 0xa4fa0009  ! 636: SDIVcc_R	sdivcc 	%r8, %r9, %r18
	.word 0x3e800008  ! 637: BVC	bvc,a	<label_0x8>
	.word 0xc5e21009  ! 638: CASA_I	casa	[%r8] 0x80, %r9, %r2
	.word 0xccb22700  ! 639: STHA_I	stha	%r6, [%r8 + 0x0700] %asi
	.word 0xef220009  ! 640: STF_R	st	%f23, [%r9, %r8]
	.word 0x884a0009  ! 641: MULX_R	mulx 	%r8, %r9, %r4
	.word 0x8143c000  ! 642: STBAR	stbar
	.word 0xc8ea1009  ! 643: LDSTUBA_R	ldstuba	%r4, [%r8 + %r9] 0x80
	.word 0xe00a0009  ! 644: LDUB_R	ldub	[%r8 + %r9], %r16
	.word 0x08800008  ! 645: BLEU	bleu  	<label_0x8>
	.word 0x8da20829  ! 646: FADDs	fadds	%f8, %f9, %f6
	.word 0xcc6a0009  ! 647: LDSTUB_R	ldstub	%r6, [%r8 + %r9]
	.word 0x8143c000  ! 648: STBAR	stbar
	.word 0xada208a9  ! 649: FSUBs	fsubs	%f8, %f9, %f22
	.word 0x8143c000  ! 650: STBAR	stbar
	.word 0xa1222094  ! 651: MULScc_I	mulscc 	%r8, 0x0094, %r16
	.word 0x8af20009  ! 652: UDIVcc_R	udivcc 	%r8, %r9, %r5
	.word 0xc2da1009  ! 653: LDXA_R	ldxa	[%r8, %r9] 0x80, %r1
	.word 0xc36a2a40  ! 654: PREFETCH_I	prefetch	[%r8 + 0x0a40], #one_read
	.word 0x8143c000  ! 655: STBAR	stbar
	.word 0xc6120009  ! 656: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xccba2f30  ! 657: STDA_I	stda	%r6, [%r8 + 0x0f30] %asi
	.word 0xe0422ffc  ! 658: LDSW_I	ldsw	[%r8 + 0x0ffc], %r16
	.word 0x0ac20008  ! 659: BRNZ	brnz  ,nt	%8,<label_0x20008>
	.word 0xc8d21009  ! 660: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r4
	.word 0xc49a2898  ! 661: LDDA_I	ldda	[%r8, + 0x0898] %asi, %r2
	.word 0xc68a1009  ! 663: LDUBA_R	lduba	[%r8, %r9] 0x80, %r3
	.word 0xccaa29fc  ! 665: STBA_I	stba	%r6, [%r8 + 0x09fc] %asi
	.word 0xeca22398  ! 666: STWA_I	stwa	%r22, [%r8 + 0x0398] %asi
	.word 0x8143c000  ! 667: STBAR	stbar
	.word 0xca9220a4  ! 668: LDUHA_I	lduha	[%r8, + 0x00a4] %asi, %r5
	.word 0xc36a2214  ! 669: PREFETCH_I	prefetch	[%r8 + 0x0214], #one_read
	.word 0xc2ea2b10  ! 670: LDSTUBA_I	ldstuba	%r1, [%r8 + 0x0b10] %asi
	.word 0xd5f21009  ! 671: CASXA_I	casxa	[%r8] 0x80, %r9, %r10
	.word 0x885a0009  ! 672: SMUL_R	smul 	%r8, %r9, %r4
	.word 0x8143e067  ! 673: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #MemIssue | #Sync 
	.word 0x94fa2628  ! 675: SDIVcc_I	sdivcc 	%r8, 0x0628, %r10
	.word 0xce5a2a58  ! 676: LDX_I	ldx	[%r8 + 0x0a58], %r7
	.word 0xc3e22009  ! 677: CASA_R	casa	[%r8] %asi, %r9, %r1
	.word 0xc4a228f0  ! 678: STWA_I	stwa	%r2, [%r8 + 0x08f0] %asi
	.word 0xa47a2e84  ! 679: SDIV_I	sdiv 	%r8, 0x0e84, %r18
	.word 0x84fa25a4  ! 680: SDIVcc_I	sdivcc 	%r8, 0x05a4, %r2
	.word 0x26800004  ! 681: BL	bl,a	<label_0x4>
	.word 0x8143e037  ! 682: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside | #MemIssue 
	.word 0x36800008  ! 683: BGE	bge,a	<label_0x8>
	.word 0xa7a20929  ! 684: FMULs	fmuls	%f8, %f9, %f19
	.word 0xb1a20829  ! 685: FADDs	fadds	%f8, %f9, %f24
	.word 0xaaf20009  ! 686: UDIVcc_R	udivcc 	%r8, %r9, %r21
	.word 0x88722ba8  ! 687: UDIV_I	udiv 	%r8, 0x0ba8, %r4
	.word 0xc3ea2090  ! 688: PREFETCHA_I	prefetcha	[%r8, + 0x0090] %asi, #one_read
	.word 0xc6822940  ! 689: LDUWA_I	lduwa	[%r8, + 0x0940] %asi, %r3
	.word 0xe41a0009  ! 690: LDD_R	ldd	[%r8 + %r9], %r18
	.word 0x8143c000  ! 691: STBAR	stbar
	.word 0x887a245c  ! 692: SDIV_I	sdiv 	%r8, 0x045c, %r4
	.word 0x8143e008  ! 693: MEMBAR	membar	#StoreStore 
	.word 0xcca21009  ! 694: STWA_R	stwa	%r6, [%r8 + %r9] 0x80
	.word 0x8e6a2c30  ! 695: UDIVX_I	udivx 	%r8, 0x0c30, %r7
	.word 0x8efa2cec  ! 696: SDIVcc_I	sdivcc 	%r8, 0x0cec, %r7
	.word 0x22ca0008  ! 697: BRZ	brz,a,pt	%8,<label_0xa0008>
	.word 0xcafa2bd4  ! 698: SWAPA_I	swapa	%r5, [%r8 + 0x0bd4] %asi
	.word 0xe0a21009  ! 699: STWA_R	stwa	%r16, [%r8 + %r9] 0x80
	.word 0xc3ea2298  ! 700: PREFETCHA_I	prefetcha	[%r8, + 0x0298] %asi, #one_read
	.word 0x8143c000  ! 701: STBAR	stbar
	.word 0x8143c000  ! 702: STBAR	stbar
	.word 0xac5a2c44  ! 703: SMUL_I	smul 	%r8, 0x0c44, %r22
	.word 0xfcfa22f4  ! 704: SWAPA_I	swapa	%r30, [%r8 + 0x02f4] %asi
	.word 0x04800008  ! 705: BLE	ble  	<label_0x8>
	.word 0x8143e062  ! 706: MEMBAR	membar	#StoreLoad | #MemIssue | #Sync 
	.word 0xca7a2024  ! 707: SWAP_I	swap	%r5, [%r8 + 0x0024]
	.word 0x34800008  ! 708: BG	bg,a	<label_0x8>
	.word 0x88d20009  ! 709: UMULcc_R	umulcc 	%r8, %r9, %r4
	.word 0x826a0009  ! 710: UDIVX_R	udivx 	%r8, %r9, %r1
	.word 0xca7a0009  ! 711: SWAP_R	swap	%r5, [%r8 + %r9]
	.word 0xf46a28ac  ! 712: LDSTUB_I	ldstub	%r26, [%r8 + 0x08ac]
	.word 0x8e5a0009  ! 713: SMUL_R	smul 	%r8, %r9, %r7
	.word 0xccea2ccc  ! 714: LDSTUBA_I	ldstuba	%r6, [%r8 + 0x0ccc] %asi
	.word 0x8e720009  ! 715: UDIV_R	udiv 	%r8, %r9, %r7
	.word 0xb5a20829  ! 716: FADDs	fadds	%f8, %f9, %f26
	.word 0xca6a29cc  ! 717: LDSTUB_I	ldstub	%r5, [%r8 + 0x09cc]
	.word 0x8143c000  ! 718: STBAR	stbar
	.word 0xc3ea2a68  ! 719: PREFETCHA_I	prefetcha	[%r8, + 0x0a68] %asi, #one_read
	.word 0x04ca0004  ! 720: BRLEZ	brlez  ,pt	%8,<label_0xa0004>
	.word 0xc73a0009  ! 721: STDF_R	std	%f3, [%r9, %r8]
	.word 0xd4ba29d0  ! 722: STDA_I	stda	%r10, [%r8 + 0x09d0] %asi
	.word 0x84722f8c  ! 723: UDIV_I	udiv 	%r8, 0x0f8c, %r2
	.word 0xe6aa1009  ! 726: STBA_R	stba	%r19, [%r8 + %r9] 0x80
	.word 0xe13a2770  ! 729: STDF_I	std	%f16, [0x0770, %r8]
	.word 0xfb3a0009  ! 730: STDF_R	std	%f29, [%r9, %r8]
	.word 0xc8aa1009  ! 731: STBA_R	stba	%r4, [%r8 + %r9] 0x80
	.word 0xb7a209a9  ! 732: FDIVs	fdivs	%f8, %f9, %f27
	.word 0xcde21009  ! 733: CASA_I	casa	[%r8] 0x80, %r9, %r6
	.word 0x89a208a9  ! 734: FSUBs	fsubs	%f8, %f9, %f4
	.word 0x8fa209a9  ! 735: FDIVs	fdivs	%f8, %f9, %f7
	.word 0xcea22320  ! 736: STWA_I	stwa	%r7, [%r8 + 0x0320] %asi
	.word 0xeaaa2cb0  ! 737: STBA_I	stba	%r21, [%r8 + 0x0cb0] %asi
	.word 0xc9220009  ! 738: STF_R	st	%f4, [%r9, %r8]
	.word 0x2ac20004  ! 739: BRNZ	brnz,a,nt	%8,<label_0x20004>
	.word 0x825227ac  ! 740: UMUL_I	umul 	%r8, 0x07ac, %r1
	.word 0xdb222c00  ! 741: STF_I	st	%f13, [0x0c00, %r8]
	.word 0xdefa20ec  ! 742: SWAPA_I	swapa	%r15, [%r8 + 0x00ec] %asi
	.word 0x04800004  ! 743: BLE	ble  	<label_0x4>
	.word 0x8af20009  ! 744: UDIVcc_R	udivcc 	%r8, %r9, %r5
	.word 0xe6d22b7c  ! 745: LDSHA_I	ldsha	[%r8, + 0x0b7c] %asi, %r19
	.word 0xccda2748  ! 746: LDXA_I	ldxa	[%r8, + 0x0748] %asi, %r6
	.word 0xc3ea28c4  ! 747: PREFETCHA_I	prefetcha	[%r8, + 0x08c4] %asi, #one_read
	.word 0xc4fa1009  ! 748: SWAPA_R	swapa	%r2, [%r8 + %r9] 0x80
	.word 0x8afa0009  ! 749: SDIVcc_R	sdivcc 	%r8, %r9, %r5
	.word 0xc4a22ad0  ! 750: STWA_I	stwa	%r2, [%r8 + 0x0ad0] %asi
	.word 0xd4da2ad8  ! 751: LDXA_I	ldxa	[%r8, + 0x0ad8] %asi, %r10
	.word 0xecfa2a04  ! 752: SWAPA_I	swapa	%r22, [%r8 + 0x0a04] %asi
	.word 0x40000004  ! 754: CALL	call	disp30_4
	.word 0x9ba208a9  ! 755: FSUBs	fsubs	%f8, %f9, %f13
	.word 0xc2aa26a8  ! 756: STBA_I	stba	%r1, [%r8 + 0x06a8] %asi
	.word 0x20800004  ! 757: BN	bn,a	<label_0x4>
	.word 0x02c20004  ! 759: BRZ	brz  ,nt	%8,<label_0x20004>
	.word 0xcab22e84  ! 760: STHA_I	stha	%r5, [%r8 + 0x0e84] %asi
	.word 0xf41a0009  ! 761: LDD_R	ldd	[%r8 + %r9], %r26
	.word 0x824a2688  ! 762: MULX_I	mulx 	%r8, 0x0688, %r1
	.word 0x847a2ce4  ! 763: SDIV_I	sdiv 	%r8, 0x0ce4, %r2
	.word 0xe2ea2b44  ! 764: LDSTUBA_I	ldstuba	%r17, [%r8 + 0x0b44] %asi
	.word 0xa7a208a9  ! 765: FSUBs	fsubs	%f8, %f9, %f19
	.word 0x26c20004  ! 766: BRLZ	brlz,a,nt	%8,<label_0x20004>
	.word 0xfcaa24a0  ! 767: STBA_I	stba	%r30, [%r8 + 0x04a0] %asi
	.word 0xa85a2664  ! 768: SMUL_I	smul 	%r8, 0x0664, %r20
	.word 0x8143c000  ! 769: STBAR	stbar
	.word 0xc4d21009  ! 770: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r2
	.word 0x8fa208a9  ! 771: FSUBs	fsubs	%f8, %f9, %f7
	.word 0xdcc21009  ! 772: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r14
	.word 0xa7a208a9  ! 773: FSUBs	fsubs	%f8, %f9, %f19
	.word 0xf2fa21d4  ! 774: SWAPA_I	swapa	%r25, [%r8 + 0x01d4] %asi
	.word 0x08800004  ! 775: BLEU	bleu  	<label_0x4>
	.word 0xc48a1009  ! 776: LDUBA_R	lduba	[%r8, %r9] 0x80, %r2
	.word 0x3e800004  ! 777: BVC	bvc,a	<label_0x4>
	.word 0xf86a0009  ! 778: LDSTUB_R	ldstub	%r28, [%r8 + %r9]
	.word 0x3a800004  ! 779: BCC	bcc,a	<label_0x4>
	.word 0x3c800004  ! 780: BPOS	bpos,a	<label_0x4>
	.word 0xc86a2008  ! 781: LDSTUB_I	ldstub	%r4, [%r8 + 0x0008]
	.word 0x0ac20004  ! 782: BRNZ	brnz  ,nt	%8,<label_0x20004>
	.word 0x8cda2384  ! 783: SMULcc_I	smulcc 	%r8, 0x0384, %r6
	.word 0x8ba20829  ! 784: FADDs	fadds	%f8, %f9, %f5
	.word 0xbc4a0009  ! 785: MULX_R	mulx 	%r8, %r9, %r30
	.word 0xdcb21009  ! 786: STHA_R	stha	%r14, [%r8 + %r9] 0x80
	.word 0x8143e071  ! 787: MEMBAR	membar	#LoadLoad | #Lookaside | #MemIssue | #Sync 
	.word 0xfc122668  ! 788: LDUH_I	lduh	[%r8 + 0x0668], %r30
	.word 0xc5e22009  ! 789: CASA_R	casa	[%r8] %asi, %r9, %r2
	.word 0xcaaa2324  ! 790: STBA_I	stba	%r5, [%r8 + 0x0324] %asi
	.word 0xcef22cd8  ! 791: STXA_I	stxa	%r7, [%r8 + 0x0cd8] %asi
	.word 0xf07a2904  ! 792: SWAP_I	swap	%r24, [%r8 + 0x0904]
	.word 0x8a7a2954  ! 793: SDIV_I	sdiv 	%r8, 0x0954, %r5
	.word 0x8d6a0009  ! 794: SDIVX_R	sdivx	%r8, %r9, %r6
	.word 0xccba1009  ! 795: STDA_R	stda	%r6, [%r8 + %r9] 0x80
	.word 0xc3ea20fc  ! 796: PREFETCHA_I	prefetcha	[%r8, + 0x00fc] %asi, #one_read
	.word 0x867a0009  ! 797: SDIV_R	sdiv 	%r8, %r9, %r3
	.word 0x8143c000  ! 798: STBAR	stbar
	.word 0xdafa2ef8  ! 799: SWAPA_I	swapa	%r13, [%r8 + 0x0ef8] %asi
	.word 0xce020009  ! 800: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0x99a20929  ! 801: FMULs	fmuls	%f8, %f9, %f12
	.word 0x846a0009  ! 802: UDIVX_R	udivx 	%r8, %r9, %r2
	.word 0xc9f21009  ! 803: CASXA_I	casxa	[%r8] 0x80, %r9, %r4
	.word 0x06c20004  ! 804: BRLZ	brlz  ,nt	%8,<label_0x20004>
	.word 0x8f6a2bc4  ! 805: SDIVX_I	sdivx	%r8, 0x0bc4, %r7
	.word 0x32800004  ! 806: BNE	bne,a	<label_0x4>
	.word 0x85220009  ! 807: MULScc_R	mulscc 	%r8, %r9, %r2
	.word 0xc3ea2d44  ! 808: PREFETCHA_I	prefetcha	[%r8, + 0x0d44] %asi, #one_read
	.word 0xfcba22f8  ! 809: STDA_I	stda	%r30, [%r8 + 0x02f8] %asi
	.word 0x87a20829  ! 810: FADDs	fadds	%f8, %f9, %f3
	.word 0x8a5a2608  ! 811: SMUL_I	smul 	%r8, 0x0608, %r5
	.word 0xf8fa28b4  ! 812: SWAPA_I	swapa	%r28, [%r8 + 0x08b4] %asi
	.word 0xa87a2da4  ! 813: SDIV_I	sdiv 	%r8, 0x0da4, %r20
	.word 0xe6c21009  ! 814: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r19
	.word 0xf01a0009  ! 815: LDD_R	ldd	[%r8 + %r9], %r24
	.word 0xd8d2204c  ! 816: LDSHA_I	ldsha	[%r8, + 0x004c] %asi, %r12
	.word 0xc80a2458  ! 818: LDUB_I	ldub	[%r8 + 0x0458], %r4
	.word 0x8da20829  ! 819: FADDs	fadds	%f8, %f9, %f6
	.word 0x9cda0009  ! 820: SMULcc_R	smulcc 	%r8, %r9, %r14
	.word 0x8143c000  ! 821: STBAR	stbar
	.word 0xca821009  ! 822: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r5
	.word 0xfed21009  ! 823: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r31
	.word 0xe2b229e8  ! 824: STHA_I	stha	%r17, [%r8 + 0x09e8] %asi
	.word 0x8ed20009  ! 825: UMULcc_R	umulcc 	%r8, %r9, %r7
	.word 0xcf3a0009  ! 826: STDF_R	std	%f7, [%r9, %r8]
	.word 0x8e7a0009  ! 827: SDIV_R	sdiv 	%r8, %r9, %r7
	.word 0xc27a0009  ! 828: SWAP_R	swap	%r1, [%r8 + %r9]
	.word 0xc60a0009  ! 829: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xa25a0009  ! 830: SMUL_R	smul 	%r8, %r9, %r17
	.word 0x88da0009  ! 831: SMULcc_R	smulcc 	%r8, %r9, %r4
	.word 0xce7a2ff4  ! 832: SWAP_I	swap	%r7, [%r8 + 0x0ff4]
	.word 0xc73a22d0  ! 833: STDF_I	std	%f3, [0x02d0, %r8]
	.word 0xe4ba2f58  ! 834: STDA_I	stda	%r18, [%r8 + 0x0f58] %asi
	.word 0xc36a2578  ! 835: PREFETCH_I	prefetch	[%r8 + 0x0578], #one_read
	.word 0xceaa1009  ! 838: STBA_R	stba	%r7, [%r8 + %r9] 0x80
	.word 0xcc7a0009  ! 840: SWAP_R	swap	%r6, [%r8 + %r9]
	.word 0xcada1009  ! 841: LDXA_R	ldxa	[%r8, %r9] 0x80, %r5
	.word 0x14800008  ! 842: BG	bg  	<label_0x8>
	.word 0xc2fa2d44  ! 843: SWAPA_I	swapa	%r1, [%r8 + 0x0d44] %asi
	.word 0x8143e062  ! 844: MEMBAR	membar	#StoreLoad | #MemIssue | #Sync 
	.word 0xeeea1009  ! 847: LDSTUBA_R	ldstuba	%r23, [%r8 + %r9] 0x80
	.word 0xc2b21009  ! 848: STHA_R	stha	%r1, [%r8 + %r9] 0x80
	.word 0xc4ba1009  ! 849: STDA_R	stda	%r2, [%r8 + %r9] 0x80
	.word 0x86720009  ! 850: UDIV_R	udiv 	%r8, %r9, %r3
	.word 0x8143c000  ! 851: STBAR	stbar
	.word 0x8143c000  ! 852: STBAR	stbar
	.word 0xc36a29e0  ! 853: PREFETCH_I	prefetch	[%r8 + 0x09e0], #one_read
	.word 0xc9e22009  ! 854: CASA_R	casa	[%r8] %asi, %r9, %r4
	.word 0x86d20009  ! 856: UMULcc_R	umulcc 	%r8, %r9, %r3
	.word 0xafa20929  ! 857: FMULs	fmuls	%f8, %f9, %f23
	.word 0x8c522958  ! 858: UMUL_I	umul 	%r8, 0x0958, %r6
	.word 0xbfa20929  ! 859: FMULs	fmuls	%f8, %f9, %f31
	.word 0x8143e069  ! 860: MEMBAR	membar	#LoadLoad | #StoreStore | #MemIssue | #Sync 
	.word 0x8efa2204  ! 861: SDIVcc_I	sdivcc 	%r8, 0x0204, %r7
	.word 0xc73a2478  ! 862: STDF_I	std	%f3, [0x0478, %r8]
	.word 0xcef21009  ! 863: STXA_R	stxa	%r7, [%r8 + %r9] 0x80
	.word 0x887a28fc  ! 864: SDIV_I	sdiv 	%r8, 0x08fc, %r4
	.word 0x85a20929  ! 865: FMULs	fmuls	%f8, %f9, %f2
	.word 0x885225ac  ! 866: UMUL_I	umul 	%r8, 0x05ac, %r4
	.word 0x8ada0009  ! 867: SMULcc_R	smulcc 	%r8, %r9, %r5
	.word 0xc36a2e84  ! 868: PREFETCH_I	prefetch	[%r8 + 0x0e84], #one_read
	.word 0xc4022ae4  ! 869: LDUW_I	lduw	[%r8 + 0x0ae4], %r2
	.word 0x8a6a0009  ! 870: UDIVX_R	udivx 	%r8, %r9, %r5
	.word 0x867a260c  ! 871: SDIV_I	sdiv 	%r8, 0x060c, %r3
	.word 0x8143e030  ! 872: MEMBAR	membar	#Lookaside | #MemIssue 
	.word 0xf41a27c0  ! 873: LDD_I	ldd	[%r8 + 0x07c0], %r26
	.word 0xc8aa1009  ! 875: STBA_R	stba	%r4, [%r8 + %r9] 0x80
	.word 0x2cca0004  ! 876: BRGZ	brgz,a,pt	%8,<label_0xa0004>
	.word 0xdc0a0009  ! 877: LDUB_R	ldub	[%r8 + %r9], %r14
	.word 0x8f6a2008  ! 878: SDIVX_I	sdivx	%r8, 0x0008, %r7
	.word 0x83a208a9  ! 879: FSUBs	fsubs	%f8, %f9, %f1
	.word 0xe46a0009  ! 881: LDSTUB_R	ldstub	%r18, [%r8 + %r9]
	.word 0xb6d20009  ! 882: UMULcc_R	umulcc 	%r8, %r9, %r27
	.word 0xc2a21009  ! 883: STWA_R	stwa	%r1, [%r8 + %r9] 0x80
	.word 0x10800004  ! 884: BA	ba  	<label_0x4>
	.word 0xcaca23d0  ! 885: LDSBA_I	ldsba	[%r8, + 0x03d0] %asi, %r5
	.word 0x89a209a9  ! 886: FDIVs	fdivs	%f8, %f9, %f4
	.word 0x8143c000  ! 887: STBAR	stbar
	.word 0xe2f21009  ! 888: STXA_R	stxa	%r17, [%r8 + %r9] 0x80
	.word 0x8a6a21d8  ! 889: UDIVX_I	udivx 	%r8, 0x01d8, %r5
	.word 0xf6420009  ! 890: LDSW_R	ldsw	[%r8 + %r9], %r27
	.word 0x12800004  ! 891: BNE	bne  	<label_0x4>
	.word 0xe0ba25c0  ! 892: STDA_I	stda	%r16, [%r8 + 0x05c0] %asi
	.word 0xee6a2308  ! 893: LDSTUB_I	ldstub	%r23, [%r8 + 0x0308]
	.word 0x864a0009  ! 894: MULX_R	mulx 	%r8, %r9, %r3
	.word 0xd8aa2a14  ! 895: STBA_I	stba	%r12, [%r8 + 0x0a14] %asi
	.word 0xc44a2adc  ! 896: LDSB_I	ldsb	[%r8 + 0x0adc], %r2
	.word 0xcd222b38  ! 897: STF_I	st	%f6, [0x0b38, %r8]
	.word 0xc48a1009  ! 898: LDUBA_R	lduba	[%r8, %r9] 0x80, %r2
	.word 0xc4fa2544  ! 899: SWAPA_I	swapa	%r2, [%r8 + 0x0544] %asi
	.word 0xc36a210c  ! 900: PREFETCH_I	prefetch	[%r8 + 0x010c], #one_read
	.word 0x8afa0009  ! 902: SDIVcc_R	sdivcc 	%r8, %r9, %r5
	.word 0x8143c000  ! 903: STBAR	stbar
	.word 0x896a0009  ! 904: SDIVX_R	sdivx	%r8, %r9, %r4
	.word 0xa6d2254c  ! 905: UMULcc_I	umulcc 	%r8, 0x054c, %r19
	.word 0xcfe22009  ! 907: CASA_R	casa	[%r8] %asi, %r9, %r7
	.word 0x8143c000  ! 908: STBAR	stbar
	.word 0xdea21009  ! 909: STWA_R	stwa	%r15, [%r8 + %r9] 0x80
	.word 0xe4ea1009  ! 911: LDSTUBA_R	ldstuba	%r18, [%r8 + %r9] 0x80
	.word 0xc6fa1009  ! 912: SWAPA_R	swapa	%r3, [%r8 + %r9] 0x80
	.word 0x40000008  ! 913: CALL	call	disp30_8
	.word 0x84fa0009  ! 914: SDIVcc_R	sdivcc 	%r8, %r9, %r2
	.word 0xcc5a2148  ! 915: LDX_I	ldx	[%r8 + 0x0148], %r6
	.word 0x87a209a9  ! 916: FDIVs	fdivs	%f8, %f9, %f3
	.word 0xfdf22009  ! 917: CASXA_R	casxa	[%r8]%asi, %r9, %r30
	.word 0xc2da1009  ! 918: LDXA_R	ldxa	[%r8, %r9] 0x80, %r1
	.word 0xc3ea23bc  ! 919: PREFETCHA_I	prefetcha	[%r8, + 0x03bc] %asi, #one_read
	.word 0x2ac20004  ! 920: BRNZ	brnz,a,nt	%8,<label_0x20004>
	.word 0xc44a0009  ! 921: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xfc1a0009  ! 922: LDD_R	ldd	[%r8 + %r9], %r30
	.word 0x28800004  ! 923: BLEU	bleu,a	<label_0x4>
	.word 0xc3e21009  ! 924: CASA_I	casa	[%r8] 0x80, %r9, %r1
	.word 0xf2522844  ! 925: LDSH_I	ldsh	[%r8 + 0x0844], %r25
	.word 0x40000004  ! 926: CALL	call	disp30_4
	.word 0x867a2a14  ! 927: SDIV_I	sdiv 	%r8, 0x0a14, %r3
	.word 0xb0520009  ! 928: UMUL_R	umul 	%r8, %r9, %r24
	.word 0xf4fa1009  ! 929: SWAPA_R	swapa	%r26, [%r8 + %r9] 0x80
	.word 0x8143e00b  ! 930: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore 
	.word 0xcd220009  ! 931: STF_R	st	%f6, [%r9, %r8]
	.word 0x8f220009  ! 932: MULScc_R	mulscc 	%r8, %r9, %r7
	.word 0xccaa260c  ! 933: STBA_I	stba	%r6, [%r8 + 0x060c] %asi
	.word 0xc36a22e8  ! 934: PREFETCH_I	prefetch	[%r8 + 0x02e8], #one_read
	.word 0xc60a2194  ! 935: LDUB_I	ldub	[%r8 + 0x0194], %r3
	.word 0x867a0009  ! 936: SDIV_R	sdiv 	%r8, %r9, %r3
	.word 0x86fa0009  ! 937: SDIVcc_R	sdivcc 	%r8, %r9, %r3
	.word 0xc8ba26a8  ! 938: STDA_I	stda	%r4, [%r8 + 0x06a8] %asi
	.word 0xbfa209a9  ! 939: FDIVs	fdivs	%f8, %f9, %f31
	.word 0xbda20829  ! 940: FADDs	fadds	%f8, %f9, %f30
	.word 0xbefa2848  ! 941: SDIVcc_I	sdivcc 	%r8, 0x0848, %r31
	.word 0x00800004  ! 942: BN	bn  	<label_0x4>
	.word 0x8d6a28f8  ! 943: SDIVX_I	sdivx	%r8, 0x08f8, %r6
	.word 0xae6a0009  ! 944: UDIVX_R	udivx 	%r8, %r9, %r23
	.word 0xce0a0009  ! 946: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0x8143e014  ! 947: MEMBAR	membar	#LoadStore | #Lookaside 
	.word 0xc3e21009  ! 948: CASA_I	casa	[%r8] 0x80, %r9, %r1
	.word 0xc93a2278  ! 949: STDF_I	std	%f4, [0x0278, %r8]
	.word 0xc5220009  ! 950: STF_R	st	%f2, [%r9, %r8]
	.word 0x96720009  ! 951: UDIV_R	udiv 	%r8, %r9, %r11
	.word 0xc4ba1009  ! 952: STDA_R	stda	%r2, [%r8 + %r9] 0x80
	.word 0xc36a2660  ! 953: PREFETCH_I	prefetch	[%r8 + 0x0660], #one_read
	.word 0xfcb22928  ! 954: STHA_I	stha	%r30, [%r8 + 0x0928] %asi
	.word 0x8143c000  ! 955: STBAR	stbar
	.word 0x8143c000  ! 956: STBAR	stbar
	.word 0xca7a2178  ! 957: SWAP_I	swap	%r5, [%r8 + 0x0178]
	.word 0x3c800008  ! 958: BPOS	bpos,a	<label_0x8>
	.word 0xcefa2164  ! 962: SWAPA_I	swapa	%r7, [%r8 + 0x0164] %asi
	.word 0x8fa20929  ! 963: FMULs	fmuls	%f8, %f9, %f7
	.word 0xc8aa1009  ! 964: STBA_R	stba	%r4, [%r8 + %r9] 0x80
	.word 0xa4f20009  ! 965: UDIVcc_R	udivcc 	%r8, %r9, %r18
	.word 0x82da0009  ! 966: SMULcc_R	smulcc 	%r8, %r9, %r1
	.word 0x12800004  ! 967: BNE	bne  	<label_0x4>
	.word 0xa04a277c  ! 968: MULX_I	mulx 	%r8, 0x077c, %r16
	.word 0x84f20009  ! 969: UDIVcc_R	udivcc 	%r8, %r9, %r2
	.word 0xc36a2848  ! 970: PREFETCH_I	prefetch	[%r8 + 0x0848], #one_read
	.word 0xdafa20d0  ! 972: SWAPA_I	swapa	%r13, [%r8 + 0x00d0] %asi
	.word 0xc6aa1009  ! 973: STBA_R	stba	%r3, [%r8 + %r9] 0x80
	.word 0xfd2221a8  ! 974: STF_I	st	%f30, [0x01a8, %r8]
	.word 0xc6122688  ! 975: LDUH_I	lduh	[%r8 + 0x0688], %r3
	.word 0xc2ca1009  ! 976: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r1
	.word 0xca0a0009  ! 977: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xb3a20929  ! 978: FMULs	fmuls	%f8, %f9, %f25
	.word 0xf13a0009  ! 979: STDF_R	std	%f24, [%r9, %r8]
	.word 0x10800004  ! 980: BA	ba  	<label_0x4>
	.word 0xe41a2748  ! 981: LDD_I	ldd	[%r8 + 0x0748], %r18
	.word 0x844a0009  ! 983: MULX_R	mulx 	%r8, %r9, %r2
	.word 0x8143e01b  ! 984: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Lookaside 
	.word 0xf2120009  ! 985: LDUH_R	lduh	[%r8 + %r9], %r25
	.word 0xd49a1009  ! 986: LDDA_R	ldda	[%r8, %r9] 0x80, %r10
	.word 0xf4522ce0  ! 987: LDSH_I	ldsh	[%r8 + 0x0ce0], %r26
	.word 0x8a6a2284  ! 988: UDIVX_I	udivx 	%r8, 0x0284, %r5
	.word 0xcf220009  ! 989: STF_R	st	%f7, [%r9, %r8]
	.word 0x22ca0004  ! 990: BRZ	brz,a,pt	%8,<label_0xa0004>
	.word 0xee022a2c  ! 991: LDUW_I	lduw	[%r8 + 0x0a2c], %r23
	.word 0xd7222e48  ! 992: STF_I	st	%f11, [0x0e48, %r8]
	.word 0x8143e059  ! 993: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside | #Sync 
	.word 0xc36a245c  ! 994: PREFETCH_I	prefetch	[%r8 + 0x045c], #one_read
	.word 0xfaa21009  ! 996: STWA_R	stwa	%r29, [%r8 + %r9] 0x80
	.word 0x8143e025  ! 997: MEMBAR	membar	#LoadLoad | #LoadStore | #MemIssue 
	.word 0x965a0009  ! 998: SMUL_R	smul 	%r8, %r9, %r11
	.word 0x8cf226c0  ! 999: UDIVcc_I	udivcc 	%r8, 0x06c0, %r6
        ta      T_GOOD_TRAP

.data
	.word  0x71fd5972,0x0516fc58,0x9963fb2c,0xaf32bd75
	.word  0x6132509c,0x577bef63,0x30ebc42e,0x56bf2d88
	.word  0x8acad8cf,0xc6aa678b,0x99856daa,0xc9d62d92
	.word  0xa678cae2,0x2cd0de09,0x8af03585,0xd8123e32
	.word  0xa26bbf4b,0xf5ebc0e7,0x2f5d89b1,0x637717b5
	.word  0xf5ac6a9e,0x17c6aa3d,0xa7f976be,0x7105486f
	.word  0x7ef2de33,0x427c6525,0x3f74087c,0xa05c2f74
	.word  0x1f37e531,0xc2cd78a7,0x5ceff939,0x2a6616b2
	.word  0xe1144443,0xfa3e3943,0x5f3a99fa,0x09f18e16
	.word  0x1cf0516e,0xe0195813,0xce80f2c8,0x75156499
	.word  0x514176dd,0x5f5ff8ed,0x4e1bbc4e,0x3abd8aca
	.word  0x75fea113,0x552fa009,0xea9fe0eb,0x2620c0a1
	.word  0x987dcfcd,0xafbdde1b,0xb03e4721,0xac535650
	.word  0xcf2d969c,0x38a5d61c,0xec291384,0xdbd6d2f0
	.word  0x3cc1e1d4,0x17f60573,0x94329e92,0x9bcbb621
	.word  0x8ad20194,0x6ec292fc,0x776cf27b,0x60efaea2
	.word  0xea5353db,0x50e12eeb,0x9a2b84b6,0xe1a76654
	.word  0x624d05d7,0x9765fd6f,0xe335c1b5,0xf627b160
	.word  0x27c66500,0x72a5e915,0x0217f05e,0xcba052d0
	.word  0xe89d44ce,0xb372e995,0xaaee0e55,0x2755999c
	.word  0xff495b17,0x28df99f9,0x8628f349,0x672eca52
	.word  0xbbc82129,0xd24f0a07,0x44d6cd42,0x363d88ec
	.word  0x5101b31f,0xbb0bb2b2,0xad770941,0x38d5f14e
	.word  0xb31f207e,0x151fb935,0x46f2de59,0x3c7934c6
	.word  0xf900e413,0xe192000f,0x1cd4f396,0x1642533a
	.word  0x17177f88,0x917c924f,0x2e8ac052,0x88a4621a
	.word  0x27f8bf5f,0x27c3eae7,0xa42cfe79,0x3bb0d14c
	.word  0x187d625f,0x94842b99,0x16d78811,0xda57f73c
	.word  0x2cd8448c,0x185797e0,0x14e9d71f,0xd0b9df6f
	.word  0x2a71e593,0x0ec64c0a,0x8d58f939,0xcc36d89f
	.word  0xb663465b,0x018d2835,0x38f61aa1,0x7e8a440b
	.word  0x224f05d3,0xf9c1a5b0,0xdf3d3730,0x2c51391e
	.word  0x475a5aca,0xf40c59d9,0xb3efae3c,0x87fab6a4
	.word  0x62732247,0xbeb924f3,0x4616ba0d,0x5fb34a8f
	.word  0xb8963a46,0xf894d895,0xa28850e0,0x95ebe700
	.word  0x722ab0cf,0xd79f0c60,0xee3efcb1,0x3d503bc3
	.word  0x172493d9,0xbb90dd8e,0xba605c97,0x5c28b719
	.word  0xd495e793,0x26d6b65f,0x5f20f466,0x62cb7e88
	.word  0xd16ba4ba,0x587c6c7e,0xb707c36c,0x7c3840fb
	.word  0x5235add8,0xfb4555b8,0x8a6375bc,0x6b4056f0
	.word  0xdeb439c8,0x8baf36ba,0xfb6bdcb5,0xb8a06c42
	.word  0xeb992314,0x669f9932,0xfaac0161,0x8f0a2631
	.word  0xd4a23c32,0x70c3ba9a,0x61cf7cd3,0x014bf38a
	.word  0x81e22f3d,0x8107c36b,0xd8d4ff7b,0x31ed779b
	.word  0x12cfa6aa,0x408b2fc1,0x7b50a21d,0x6cf0c241
	.word  0xff5ac10a,0xcb2d7cd7,0x43f2d78b,0x89294908
	.word  0x6a99ec39,0x81f0732d,0xfb79be0e,0xc263b2c0
	.word  0x152f1018,0xedd9c3b5,0x4ab9b61e,0xe56d5e45
	.word  0x4412280c,0xecbac76b,0xd20996cf,0x82608c9c
	.word  0x2ca6cb01,0x16af5af8,0x74782de8,0x389236fb
	.word  0xf61a2017,0x8620de2c,0xeb3b6fc7,0x711e783d
	.word  0x2b37c8cb,0xb77c6563,0xedbb9feb,0xea916a1e
	.word  0xa6eb7dc8,0x7dfe2c60,0x595fc89c,0x660302dc
	.word  0x263d789f,0xff6f401a,0x8ace71eb,0xaa2ca5cb
	.word  0xcc7f55e5,0x1275dfec,0xb9b80cd1,0xabc0d25b
	.word  0xadadded8,0xed830153,0x1d8bb373,0xef5ba73c
	.word  0xb8012cfd,0xa5abf7e1,0xe7fdff1c,0xd0e32bbe
	.word  0x1ca95a74,0x315d68ab,0x62e9cba6,0x564c5363
	.word  0xcd8e66c7,0x03c78a31,0xe85f4c20,0xa939ad3e
	.word  0xaa5759d6,0x834b9322,0x4ac7e82d,0xc864dfcb
	.word  0xf2396a9d,0xfcbbd0e7,0xb920ab5f,0x947caae7
	.word  0x2da5754b,0x376611da,0x48af182d,0x404e3c21
	.word  0x56e36006,0x87a9fb0b,0xc62d9a88,0x4bd41c56
	.word  0x53f52354,0x773ff4fe,0x5bbcaac5,0x3ff132ca
	.word  0x69539a85,0x514830e9,0xf35f14dd,0xb374c8ce
	.word  0x89e3879e,0xeed91368,0x15c51a37,0x62a68f6c
	.word  0xc4f81f0a,0x03083031,0x3a3680b4,0x1203f657
	.word  0x18331ffc,0x550f24bd,0x39a8bcf7,0xa0bb7ded
	.word  0x66116a45,0xa6af4e08,0x6aba13d7,0xcf77f3df
	.word  0x05c06999,0xb7eafce1,0x78f99604,0xac4bc907
	.word  0xb875908b,0x21b69563,0x9c317d9e,0x874399b1
	.word  0x9a434424,0xaeed16f7,0x3cacea8e,0x92ab11fd
	.word  0xf3d364e8,0x03f5106c,0xb457b0b9,0xf18ca76d
	.word  0x27e78a66,0x34dbcea5,0xa90620b0,0x9b9e700b
	.word  0x346648e1,0x84cea7cd,0x18b2f224,0xfc8b8b3d
	.word  0xd40e765f,0x2ea88361,0xe23260ce,0xdef2b8df
	.word  0x652c6525,0x9dc82301,0xce5e73b4,0xaac143d1
	.word  0xd27c4757,0x80e6089f,0x15ec0c52,0x3c8af97a
	.word  0x0fb27e40,0x08444547,0xe4b7a004,0xa5afbd89
	.word  0x94985259,0x2e05a7ab,0x28813aa8,0x62dfb5d0
	.word  0x0da87832,0x73c4aa7e,0x7c000f76,0x444f1555
	.word  0x0584f47a,0x9748d17a,0x03147138,0x64acf4f4
	.word  0x0ad77a0c,0x125c8a23,0x4bd16f77,0x7bd05d41
	.word  0x17b3d481,0xa9b6475e,0x34d8e638,0xa97c2d9b
	.word  0xadbce304,0x2ca79d27,0x7671ab90,0xd5e36111
	.word  0xc4eedb79,0x9e8f9c05,0x625f10cd,0xb6152856
	.word  0x71cdd7ee,0x6346431d,0x6e311a0a,0x6a53fcb8
	.word  0xcafdacde,0xe6006c24,0x66792f65,0x8d959016
	.word  0x28acdd1a,0x509c0739,0x0662da01,0x3221fff4
	.word  0x5b8ba085,0x21fe69ac,0x972b47f1,0xa525a0f0
	.word  0x8364830a,0x6b3300a7,0xf7181d2e,0xcd97ec2f
	.word  0x77c8f2a2,0x2e75bc90,0x9bf764ff,0x9c87edb0
	.word  0x475588ed,0x859a9045,0x1e157529,0x63bce0cc
	.word  0xa3bb4774,0xfb723cf5,0x008a917c,0xb4d734f5
	.word  0x0f5a052a,0x6b161afb,0xea5d8042,0xad20eb33
	.word  0xaff292f6,0xd227ba4a,0xd0358123,0x4aa29d72
	.word  0x566c4510,0xe7b02264,0xb63e7538,0x9328a3c8
	.word  0x796c713f,0xb1525f44,0x9c43da1e,0xcfc48bce
	.word  0x88d2d9d9,0x350b7ae8,0xb87143c7,0x0227faed
	.word  0x925d285f,0x9f24aec4,0x3f5fa41a,0xa29a1372
	.word  0xf23e0b49,0xda1a4c8b,0xd8b0f817,0x48c8364b
	.word  0xcfddbdbb,0x4023bf1e,0x4dd764a2,0x16679c14
	.word  0x795e1d29,0x369961d8,0xe2f3fc2c,0x9b12eb1a
	.word  0x8906016a,0xe1a77a1a,0xa3469c3a,0x87180aaa
	.word  0x977b3cbd,0x5d4c552a,0x286bc716,0x008f42aa
	.word  0xf34b2ac1,0x76057411,0xe6bc4840,0x604e786c
	.word  0xd3e6e312,0xe7763fa2,0x3e9723d9,0x205cac51
	.word  0x9ec492eb,0x336a3b54,0x93af3b90,0x3a852e19
	.word  0x2c7c8141,0x3feee5e5,0x2cdbc7db,0xdcbae825
	.word  0x7af12d70,0x0b1794f5,0xe9bad906,0x03dc3736
	.word  0xb3e56439,0x6a058e6c,0x2a57e76c,0xb2cf70f7
	.word  0xbda717d3,0xfc8b7d13,0x2b72debe,0x2075a6f4
	.word  0x67c86353,0x1945c81e,0x19cc9154,0x0f00d9f0
	.word  0x596e421e,0x3abdac25,0xb0216df6,0x82de5ec4
	.word  0xde5179cb,0x79e2f569,0x6d4b15d9,0x87bd105f
	.word  0x953bfefc,0x5a48aa3f,0xe049bb7a,0x01dfc7c1
	.word  0x826b5eb8,0x385cdf2a,0x37495648,0x87942b95
	.word  0x73bf07e1,0x1f28e3ea,0xd521d115,0x87cf935c
	.word  0xd8e32cc4,0x092e01e0,0x5ed69a1e,0xdd5f2b2a
	.word  0x34e8ac97,0xbf4cfa51,0x3e141979,0xfdd15430
	.word  0x4a95f167,0x9d14c3d7,0x4a84c507,0x9806a934
	.word  0x517662d7,0x916ab84e,0x1345b6db,0x60d9f36d
	.word  0x429ec47a,0xfc95881c,0x4e4966ec,0x52a4744d
	.word  0x8e05be7e,0x5324699c,0x757a9e99,0x27e19c7c
	.word  0xca790a49,0x2e2afe62,0x74bd11ad,0xcc445b32
	.word  0xc71c6a74,0xcf481547,0x6543cfc5,0x6bbfe78f
	.word  0xb6dcec77,0x7f16a95e,0xae65e2c6,0x8add3d02
	.word  0x377e9dd0,0xbb77d778,0x98cafb38,0xb4e02cad
	.word  0x0e1ccb17,0xa646d0b7,0xf52ea2ad,0xbb8be90d
	.word  0x4e996cf3,0x6f02bc08,0xc730fca8,0x75c1dff1
	.word  0xcaca1419,0xa61a597e,0xffd6dff9,0xda6823c0
	.word  0x5372f2aa,0xa467b054,0x184f1953,0x44bc7c37
	.word  0xb0b2c425,0x9a0c1b2b,0x81be63d1,0x25183699
	.word  0xf18f92c7,0x8ec9067d,0xf66c17a8,0x68bf41f7
	.word  0xeb5dd47c,0x646ac80f,0xb4326f0a,0xcbd9b5f6
	.word  0x3587a9c9,0x2fc740ba,0x6441cc1b,0x2ac8556d
	.word  0x6ae7b9e1,0x6a792cb1,0xf0888773,0x331b11e6
	.word  0x9ac98f47,0x0dedb211,0x70ab2b4a,0xd079e1a4
	.word  0x8997e760,0x6d4195dd,0x6428d366,0x9b8ca426
	.word  0xc5d27041,0x3e54d792,0x59494235,0x93e613ae
	.word  0xc6e6d3c6,0x98123a5a,0xb33b56dc,0xfb343990
	.word  0xf6718c1e,0x2e5b683e,0xcec7c0c2,0x78996167
	.word  0x638785d0,0x0607d47d,0x4a3985d4,0xcde37b33
	.word  0xd1cfd5e9,0x66c38f5f,0xa4f31b03,0xacc7d774
	.word  0x0ee59ade,0xec107dfe,0x481cbb93,0xb40cca2e
	.word  0x5148c6fa,0xe4bf3f6a,0x6c2a0c64,0xab97014b
	.word  0xa2d3e7d9,0x3f6f9057,0x70904b3e,0x219b5291
	.word  0x28ba8e72,0xa2274590,0xe785d93b,0x5ec615b2
	.word  0x39aa5237,0x3c3328b1,0xa02b921f,0x11eeb1d1
	.word  0xd57af284,0x579286c2,0xdfce92fc,0xc430319f
	.word  0x9e8ec82a,0xa120e438,0x05510df7,0xae146bf5
	.word  0x85a33058,0xfdbaf416,0x73d5b2ec,0xab829012
	.word  0x5bfb49a4,0xe365bde3,0xf4c996d6,0x2c64d024
	.word  0x788e589a,0x12edda7b,0x1c0ca5fe,0x8329bf2b
	.word  0x93a921e9,0xb7162774,0x910f79a0,0xff354077
	.word  0x784b3861,0x34359528,0x10dbc8a7,0xecd68a8a
	.word  0x7f21c855,0x12cd7e71,0xadddb20d,0xd3853bc7
	.word  0xecc5f81e,0x75e108ac,0xc90334ef,0x73de93f6
	.word  0x4d2c88b8,0x2a5a1fd0,0xcc01e653,0x6a3274b6
	.word  0xc2aafb50,0x71ff933f,0x620f793b,0xc07fbdee
	.word  0x6171cf2e,0xd1111afb,0x9b9bcdab,0xb1b89d16
	.word  0x8d6253f2,0xb5bd9aa9,0x0a061dd8,0x26869e2b
	.word  0x80796d05,0x830dfa38,0x4f0e3182,0x62dc7f33
	.word  0xe8357e2e,0xcac2b483,0x6b4ce1e0,0x2a3f1356
	.word  0x71f887ce,0x916828e3,0xfb1fe833,0x15ef7fdd
	.word  0xc4b6486d,0xd9616b6d,0x01420212,0x1f4b4860
	.word  0xb5aa9d7e,0x0fedea0c,0x9e7f13b0,0x21aee8f1
	.word  0xa85434d9,0x49ac6d59,0x29ec22dd,0x71cdf64e
	.word  0x9ae3f0e9,0xaa846c10,0xf0ecac6a,0x66aa90a1
	.word  0xbf3105a0,0x1b9f66e8,0xe22a2483,0xe3e2bcb1
	.word  0xb9398e6f,0x556a03d3,0x1b32d8b4,0x1c549f93
	.word  0xff31149f,0xeedd7d84,0x703ccbfb,0x60e0686d
	.word  0x37dc0d26,0xdd2c797f,0xd9000f0b,0x996f1bd5
	.word  0x706ef5a7,0xcb794d91,0xa0d9f387,0x8292d896
	.word  0x846fc3a9,0xff42192c,0x1f8521de,0xadd1690c
	.word  0x9b550859,0x631da2fc,0x2345884f,0xb08cfd30
	.word  0xf1d1b0e9,0x913f3d77,0xb8b1b392,0x598f4b7e
	.word  0x020dedd3,0xebc49632,0xe57f8c99,0xf4b957c5
	.word  0x783f0de4,0x8c78a173,0x60578ea8,0x45b6bb87
	.word  0x25a96965,0xd88a0799,0x1ebdbe47,0x1037171b
	.word  0x3fd8cf33,0xa2d9dee3,0x56e4bae2,0x668618a5
	.word  0xaa6b4850,0x0300a2e9,0x9459609c,0x38fd0f05
	.word  0x439b9029,0xcd1876fa,0x1b70629b,0x640a2d6a
	.word  0xb80cdf77,0xbfda3e59,0x35911184,0x6bddb766
	.word  0x92e7dfa2,0x5e0117cc,0xe3497c5e,0x116159e7
	.word  0xefff7f71,0x98c14de3,0xbf1aa7fe,0xf0835e5f
	.word  0x325e6b34,0xe1cc5e64,0x688739d4,0x268240d1
	.word  0xc57d2a21,0x217668a9,0x6a13a5c9,0x2d9bc41f
	.word  0x479b3820,0x6d98181e,0x7b387c29,0x2517129c
	.word  0x89f180a3,0xa819c107,0x114caf99,0xc3b87270
	.word  0x2a9821eb,0xd5d169ea,0xa363f69a,0x47c31cf5
	.word  0xcec88d64,0xcffbf630,0x0f84bd98,0x5e722fa8
	.word  0x8272450d,0x72e46096,0xfa54b144,0xd0c3ec02
	.word  0x8cdb784d,0x21671a9e,0x122c0ea3,0x21808ec7
	.word  0xbf1801b4,0x76b0cdd4,0x434a063f,0x89f01c7b
	.word  0x130ff639,0x64ba3eb9,0x793f39b8,0x2d757b56
	.word  0x06d3f732,0xb9f659d8,0xe785dff3,0xf6c1aa84
	.word  0x7e97c1ac,0xab23e86d,0x57080873,0xc432c072
	.word  0x08b3665a,0xebe5b07c,0x5be68b19,0xb83d2a73
	.word  0xa1b72095,0xa7435c84,0xc2b2db12,0xe51be4a7
	.word  0xb8f21eb0,0xf9600b0a,0xd368af1f,0xa0aa7130
	.word  0x45a2082b,0xf7c7e2ad,0x869497df,0xea6aad0d
	.word  0x6e53f34d,0x88d12a79,0x5cc6e10f,0x29738746
	.word  0x80db38d2,0x26901060,0xe38788a0,0x4c400c5c
	.word  0x03ff6d48,0x2a68d4a9,0x8f9c8657,0xcdbf40c1
	.word  0x03be681c,0x060f1da8,0xcd844a43,0x2b618dcc
	.word  0x57c43755,0xe2cfe346,0x700ab9e3,0x536d64bd
	.word  0x4096e5ab,0xea41885c,0x26988840,0x61611bd3
	.word  0x654c9b22,0x34a68885,0xbc51179f,0x7b80137c
	.word  0xb4203b70,0xbd09e2aa,0x8bf3d26a,0x2293b533
	.word  0xb852355e,0x0c79363e,0x1f175624,0x8ae18e9f
	.word  0xde0c5778,0x62f9001b,0xd7f3b0b5,0xafd9f9ca
	.word  0x33982669,0xdef8cf8e,0x4901a7b2,0xf52ba5bd
	.word  0xa971f8fd,0x8fc01dc8,0x2df2a388,0x205bcf8b
	.word  0x5f6cc61f,0x8a4e07ff,0x1d1d6ac1,0xa1ec029d
	.word  0xeeb484e5,0x4ab42812,0x7c099e20,0x8631f505
	.word  0xa835775f,0x78560e10,0x81e685c6,0x46a5c3ba
	.word  0x88177a73,0x84fd119e,0x8e1d5249,0xf3a7f035
	.word  0xdd6e23fa,0xe66be278,0xaff1db18,0x2135ff93
	.word  0x6e1ea1dd,0x13868c77,0x584c85fb,0x37325f41
	.word  0x79690625,0xd6ff24cb,0xe3b8b7c0,0xe17c5b9a
	.word  0x16d50be7,0x0226b4d5,0xa34ce703,0x84aeee2c
	.word  0x1829529d,0x95e27e98,0x5094d157,0xcc90a74a
	.word  0x9665d7de,0x92d66d3a,0x9d09c1c9,0x6eb88d99
	.word  0x72cf5017,0x85cff892,0x474b415e,0xe556b01b
	.word  0x220c0332,0x1e7054c7,0xbcfcbed2,0xc1f1732c
	.word  0x205ea116,0xa94955ed,0x24c8fbe0,0x30f22e64
	.word  0x5c942b79,0x0d7575ff,0x324294c6,0x0c2dc638
	.word  0x58e47801,0x92c11fd5,0x96ff7a79,0x84a74def
	.word  0xe8a670e6,0x1d090722,0xbe0160f4,0xdfa59194
	.word  0xa2a985c9,0xbe48433d,0x321e2f4e,0x3a5aa9fa
	.word  0x594d4810,0x0572e11a,0xb7969692,0x356cd345
	.word  0x6417bf29,0x9263b08e,0x5828d714,0xdbfb46ca
	.word  0x7e0ba1ce,0xf36fc0e1,0x1c37987d,0xd16ee7b9
	.word  0x128a67c5,0x59986c2d,0xf0a75046,0x046b6409
	.word  0x39e50c33,0xb487335e,0x857a94ba,0x37a93a76
	.word  0x15155d7c,0x01030c53,0xb557eaaa,0x2a741dbb
	.word  0x9dd783ea,0xf6e9d7d0,0xcffeda19,0x9e38db8f
	.word  0xcd8280a2,0xaf3dda7a,0x8c2674fc,0x158c574c
	.word  0x0b68fd4b,0x799016d0,0xb86efee2,0xd11eaec8
	.word  0x54ff8ace,0xa441c450,0x3f031cb9,0xe95db396
	.word  0xcd43bb4f,0xcd28a09c,0xbe8d4bf7,0x340485c6
	.word  0xd7a5ce8b,0x40f9019a,0x55c558b0,0xded4b7c4
	.word  0xd4b57faf,0x1d6a9358,0x8b84937e,0xdd1be053
	.word  0x2aab5781,0x0dfab311,0x01a74e2f,0x2bfbfeab
	.word  0xea79a5e5,0xb5d20897,0xe508aa46,0xc7aa8b71
	.word  0xe766ecaa,0x20aafb45,0xc6eed8e4,0x88137b95
	.word  0xd88d480a,0x5973a5ee,0xc4739e5d,0x874eb786
	.word  0x91786fc8,0xb038682d,0xed589a4d,0x8d7c7c2a
	.word  0xb9903a6a,0xd8085fc6,0xff4d83e1,0x14daef10
	.word  0xeb317e73,0xbb73880b,0xb4128364,0xeb67caac
	.word  0x53cf31bb,0x684d89a7,0x51030af5,0x4be0c1ea
	.word  0xaf7aa689,0xc498a5ff,0xedf22c22,0x357afe7f
	.word  0x6135d8dd,0x1ac763de,0xd552c747,0x2c31c253
	.word  0x7d67f10f,0x6a52c8be,0xbc8e4a34,0x0011c0c7
	.word  0x3f4526a7,0x8de52f69,0xccf760e2,0x2817813d


