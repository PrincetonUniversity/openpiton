// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: bug2883.s
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
   random seed:	335540771
   Jal lop.j:	
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
        setx  0x27bc08ff0498a67a, %g1, %r0
        setx  0x1a82c08f9487aba4, %g1, %r1
        setx  0x719bf7997150e07f, %g1, %r2
        setx  0x492e9af8df2d5c96, %g1, %r3
        setx  0xa13b11e678a7269a, %g1, %r4
        setx  0x3f77a6e5a02265e0, %g1, %r5
        setx  0x5ee3211a5341ba28, %g1, %r6
        setx  0x322a62be19914373, %g1, %r7
        setx  0xed0d6d330287e0e1, %g1, %r10
        setx  0x5d564d6899a23479, %g1, %r11
        setx  0xe23c95049e5dd7cd, %g1, %r12
        setx  0x1a31476faa6acb13, %g1, %r13
        setx  0x309bb43237b21323, %g1, %r14
        setx  0xcff6ef5ddf5b248d, %g1, %r15
        setx  0x6bd756443b39b461, %g1, %r16
        setx  0x257442ae91f56c94, %g1, %r17
        setx  0x339554e4817226be, %g1, %r18
        setx  0x91b9a16645bac5dc, %g1, %r19
        setx  0xddb9381db43f07f8, %g1, %r20
        setx  0x680553e6abb79193, %g1, %r21
        setx  0x267867df6c22af41, %g1, %r22
        setx  0xd5216cb74d7ee01b, %g1, %r23
        setx  0x5a36ea2b7f01dd46, %g1, %r24
        setx  0x003d8e282ff2386b, %g1, %r25
        setx  0x6ce292695465e72e, %g1, %r26
        setx  0x5ad54d9d86f99960, %g1, %r27
        setx  0xe8090556f371f91c, %g1, %r28
        setx  0xef11dae943e6f512, %g1, %r29
        setx  0x6ee4e0390970e0cd, %g1, %r30
        setx  0x744b06ee326b49bf, %g1, %r31
	.word 0x9ba20829  ! 5: FADDs	fadds	%f8, %f9, %f13
	.word 0x8b220009  ! 6: MULScc_R	mulscc 	%r8, %r9, %r5
	.word 0xc2520009  ! 7: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0x8143c000  ! 8: STBAR	stbar
	.word 0xcfe22009  ! 9: CASA_R	casa	[%r8] %asi, %r9, %r7
	.word 0x845a0009  ! 10: SMUL_R	smul 	%r8, %r9, %r2
	.word 0x08800008  ! 11: BLEU	bleu  	<label_0x8>
	.word 0xcaca2ae8  ! 12: LDSBA_I	ldsba	[%r8, + 0x0ae8] %asi, %r5
	.word 0xeb222a60  ! 13: STF_I	st	%f21, [0x0a60, %r8]
	.word 0xd4aa1009  ! 14: STBA_R	stba	%r10, [%r8 + %r9] 0x80
	.word 0xc5f22009  ! 15: CASXA_R	casxa	[%r8]%asi, %r9, %r2
	.word 0x0aca0008  ! 16: BRNZ	brnz  ,pt	%8,<label_0xa0008>
	.word 0x16800004  ! 17: BGE	bge  	<label_0x4>
	.word 0x86f22950  ! 18: UDIVcc_I	udivcc 	%r8, 0x0950, %r3
	.word 0xb7220009  ! 19: MULScc_R	mulscc 	%r8, %r9, %r27
	.word 0xcdf21009  ! 20: CASXA_I	casxa	[%r8] 0x80, %r9, %r6
	.word 0xe2aa1009  ! 21: STBA_R	stba	%r17, [%r8 + %r9] 0x80
	.word 0xc3ea29c8  ! 22: PREFETCHA_I	prefetcha	[%r8, + 0x09c8] %asi, #one_read
	.word 0x3c800008  ! 23: BPOS	bpos,a	<label_0x8>
	.word 0xc5f21009  ! 24: CASXA_I	casxa	[%r8] 0x80, %r9, %r2
	.word 0x8ba20829  ! 25: FADDs	fadds	%f8, %f9, %f5
	.word 0xcc122b54  ! 26: LDUH_I	lduh	[%r8 + 0x0b54], %r6
	.word 0xeea22de4  ! 27: STWA_I	stwa	%r23, [%r8 + 0x0de4] %asi
	.word 0xcfe22009  ! 28: CASA_R	casa	[%r8] %asi, %r9, %r7
	.word 0xcbe21009  ! 29: CASA_I	casa	[%r8] 0x80, %r9, %r5
	.word 0x8c6a0009  ! 30: UDIVX_R	udivx 	%r8, %r9, %r6
	.word 0x856a2eb4  ! 31: SDIVX_I	sdivx	%r8, 0x0eb4, %r2
	.word 0x22ca0004  ! 32: BRZ	brz,a,pt	%8,<label_0xa0004>
	.word 0xe4da1009  ! 33: LDXA_R	ldxa	[%r8, %r9] 0x80, %r18
	.word 0xcf222380  ! 34: STF_I	st	%f7, [0x0380, %r8]
	.word 0x3e800008  ! 35: BVC	bvc,a	<label_0x8>
	.word 0x886a0009  ! 36: UDIVX_R	udivx 	%r8, %r9, %r4
	.word 0x8143e017  ! 37: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside 
	.word 0xe2ea1009  ! 38: LDSTUBA_R	ldstuba	%r17, [%r8 + %r9] 0x80
	.word 0xc26a0009  ! 39: LDSTUB_R	ldstub	%r1, [%r8 + %r9]
	.word 0x8a522e20  ! 40: UMUL_I	umul 	%r8, 0x0e20, %r5
	.word 0xc3ea2930  ! 41: PREFETCHA_I	prefetcha	[%r8, + 0x0930] %asi, #one_read
	.word 0x08800008  ! 42: BLEU	bleu  	<label_0x8>
	.word 0xca6a2b78  ! 43: LDSTUB_I	ldstub	%r5, [%r8 + 0x0b78]
	.word 0xccb227e4  ! 44: STHA_I	stha	%r6, [%r8 + 0x07e4] %asi
	.word 0x84d22b38  ! 45: UMULcc_I	umulcc 	%r8, 0x0b38, %r2
	.word 0x8143c000  ! 46: STBAR	stbar
	.word 0xc60225b4  ! 47: LDUW_I	lduw	[%r8 + 0x05b4], %r3
	.word 0xcd3a29d0  ! 48: STDF_I	std	%f6, [0x09d0, %r8]
	.word 0xf8022fd4  ! 49: LDUW_I	lduw	[%r8 + 0x0fd4], %r28
	.word 0xc87a0009  ! 51: SWAP_R	swap	%r4, [%r8 + %r9]
	.word 0x8143c000  ! 52: STBAR	stbar
	.word 0xe322239c  ! 53: STF_I	st	%f17, [0x039c, %r8]
	.word 0xfe4a0009  ! 54: LDSB_R	ldsb	[%r8 + %r9], %r31
	.word 0x8cd2239c  ! 55: UMULcc_I	umulcc 	%r8, 0x039c, %r6
	.word 0xc36a2a48  ! 56: PREFETCH_I	prefetch	[%r8 + 0x0a48], #one_read
	.word 0x8e6a2ab4  ! 57: UDIVX_I	udivx 	%r8, 0x0ab4, %r7
	.word 0xcaca233c  ! 58: LDSBA_I	ldsba	[%r8, + 0x033c] %asi, %r5
	.word 0xc45a27c8  ! 59: LDX_I	ldx	[%r8 + 0x07c8], %r2
	.word 0xcab21009  ! 61: STHA_R	stha	%r5, [%r8 + %r9] 0x80
	.word 0x06ca0004  ! 62: BRLZ	brlz  ,pt	%8,<label_0xa0004>
	.word 0x9ed20009  ! 63: UMULcc_R	umulcc 	%r8, %r9, %r15
	.word 0x89a20929  ! 64: FMULs	fmuls	%f8, %f9, %f4
	.word 0xcd2223ac  ! 65: STF_I	st	%f6, [0x03ac, %r8]
	.word 0x85a208a9  ! 66: FSUBs	fsubs	%f8, %f9, %f2
	.word 0x852227c4  ! 67: MULScc_I	mulscc 	%r8, 0x07c4, %r2
	.word 0x02800008  ! 68: BE	be  	<label_0x8>
	.word 0x8fa20829  ! 69: FADDs	fadds	%f8, %f9, %f7
	.word 0x8922226c  ! 70: MULScc_I	mulscc 	%r8, 0x026c, %r4
	.word 0xc2ea1009  ! 71: LDSTUBA_R	ldstuba	%r1, [%r8 + %r9] 0x80
	.word 0xc67a0009  ! 72: SWAP_R	swap	%r3, [%r8 + %r9]
	.word 0xa5a20929  ! 73: FMULs	fmuls	%f8, %f9, %f18
	.word 0xcc6a29a8  ! 74: LDSTUB_I	ldstub	%r6, [%r8 + 0x09a8]
	.word 0xda7a0009  ! 75: SWAP_R	swap	%r13, [%r8 + %r9]
	.word 0x8c5a2cfc  ! 76: SMUL_I	smul 	%r8, 0x0cfc, %r6
	.word 0x83a209a9  ! 77: FDIVs	fdivs	%f8, %f9, %f1
	.word 0xcfe22009  ! 78: CASA_R	casa	[%r8] %asi, %r9, %r7
	.word 0x896a26bc  ! 79: SDIVX_I	sdivx	%r8, 0x06bc, %r4
	.word 0xd41a2e78  ! 80: LDD_I	ldd	[%r8 + 0x0e78], %r10
	.word 0x9a5a0009  ! 81: SMUL_R	smul 	%r8, %r9, %r13
	.word 0x40000004  ! 82: CALL	call	disp30_4
	.word 0x846a0009  ! 83: UDIVX_R	udivx 	%r8, %r9, %r2
	.word 0x82f20009  ! 84: UDIVcc_R	udivcc 	%r8, %r9, %r1
	.word 0xca921009  ! 85: LDUHA_R	lduha	[%r8, %r9] 0x80, %r5
	.word 0xc36a2634  ! 86: PREFETCH_I	prefetch	[%r8 + 0x0634], #one_read
	.word 0xf5f21009  ! 87: CASXA_I	casxa	[%r8] 0x80, %r9, %r26
	.word 0xc66a2350  ! 88: LDSTUB_I	ldstub	%r3, [%r8 + 0x0350]
	.word 0xccaa1009  ! 89: STBA_R	stba	%r6, [%r8 + %r9] 0x80
	.word 0x825a0009  ! 90: SMUL_R	smul 	%r8, %r9, %r1
	.word 0x8143e015  ! 91: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside 
	.word 0x9f6a0009  ! 92: SDIVX_R	sdivx	%r8, %r9, %r15
	.word 0xc85a2a50  ! 93: LDX_I	ldx	[%r8 + 0x0a50], %r4
	.word 0x9e4a0009  ! 94: MULX_R	mulx 	%r8, %r9, %r15
	.word 0xcaa2291c  ! 96: STWA_I	stwa	%r5, [%r8 + 0x091c] %asi
	.word 0x885a2e14  ! 98: SMUL_I	smul 	%r8, 0x0e14, %r4
	.word 0x8da209a9  ! 99: FDIVs	fdivs	%f8, %f9, %f6
	.word 0xe28a22b0  ! 100: LDUBA_I	lduba	[%r8, + 0x02b0] %asi, %r17
	.word 0xced22630  ! 101: LDSHA_I	ldsha	[%r8, + 0x0630] %asi, %r7
	.word 0xc40a0009  ! 102: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xa8d22fa4  ! 103: UMULcc_I	umulcc 	%r8, 0x0fa4, %r20
	.word 0xae6a269c  ! 104: UDIVX_I	udivx 	%r8, 0x069c, %r23
	.word 0x86722300  ! 105: UDIV_I	udiv 	%r8, 0x0300, %r3
	.word 0xc2ca2790  ! 106: LDSBA_I	ldsba	[%r8, + 0x0790] %asi, %r1
	.word 0x8d6a21f8  ! 107: SDIVX_I	sdivx	%r8, 0x01f8, %r6
	.word 0x886a0009  ! 108: UDIVX_R	udivx 	%r8, %r9, %r4
	.word 0x2a800004  ! 109: BCS	bcs,a	<label_0x4>
	.word 0x825a0009  ! 110: SMUL_R	smul 	%r8, %r9, %r1
	.word 0xe4d21009  ! 111: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r18
	.word 0xe4ba1009  ! 112: STDA_R	stda	%r18, [%r8 + %r9] 0x80
	.word 0x28800004  ! 113: BLEU	bleu,a	<label_0x4>
	.word 0x8143e062  ! 114: MEMBAR	membar	#StoreLoad | #MemIssue | #Sync 
	.word 0xc7f22009  ! 115: CASXA_R	casxa	[%r8]%asi, %r9, %r3
	.word 0xcdf22009  ! 116: CASXA_R	casxa	[%r8]%asi, %r9, %r6
	.word 0xc4a21009  ! 117: STWA_R	stwa	%r2, [%r8 + %r9] 0x80
	.word 0x8e7a0009  ! 118: SDIV_R	sdiv 	%r8, %r9, %r7
	.word 0x8143e036  ! 119: MEMBAR	membar	#StoreLoad | #LoadStore | #Lookaside | #MemIssue 
	.word 0xcada2170  ! 120: LDXA_I	ldxa	[%r8, + 0x0170] %asi, %r5
	.word 0xc3ea27bc  ! 121: PREFETCHA_I	prefetcha	[%r8, + 0x07bc] %asi, #one_read
	.word 0x3c800004  ! 122: BPOS	bpos,a	<label_0x4>
	.word 0xcc520009  ! 123: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xc88224bc  ! 124: LDUWA_I	lduwa	[%r8, + 0x04bc] %asi, %r4
	.word 0x8143c000  ! 125: STBAR	stbar
	.word 0x8e5a2188  ! 126: SMUL_I	smul 	%r8, 0x0188, %r7
	.word 0xc46a2360  ! 127: LDSTUB_I	ldstub	%r2, [%r8 + 0x0360]
	.word 0x3e800004  ! 129: BVC	bvc,a	<label_0x4>
	.word 0xc4a22540  ! 130: STWA_I	stwa	%r2, [%r8 + 0x0540] %asi
	.word 0x9a6a2848  ! 134: UDIVX_I	udivx 	%r8, 0x0848, %r13
	.word 0xfe0a27f8  ! 135: LDUB_I	ldub	[%r8 + 0x07f8], %r31
	.word 0xc2020009  ! 136: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xf8f21009  ! 137: STXA_R	stxa	%r28, [%r8 + %r9] 0x80
	.word 0xcc7a0009  ! 138: SWAP_R	swap	%r6, [%r8 + %r9]
	.word 0x8da20829  ! 139: FADDs	fadds	%f8, %f9, %f6
	.word 0xfeda2680  ! 140: LDXA_I	ldxa	[%r8, + 0x0680] %asi, %r31
	.word 0x8ad221d8  ! 141: UMULcc_I	umulcc 	%r8, 0x01d8, %r5
	.word 0x8143e018  ! 142: MEMBAR	membar	#StoreStore | #Lookaside 
	.word 0x06800008  ! 143: BL	bl  	<label_0x8>
	.word 0xc3ea26a4  ! 144: PREFETCHA_I	prefetcha	[%r8, + 0x06a4] %asi, #one_read
	.word 0x28800008  ! 145: BLEU	bleu,a	<label_0x8>
	.word 0xba720009  ! 146: UDIV_R	udiv 	%r8, %r9, %r29
	.word 0x8143c000  ! 147: STBAR	stbar
	.word 0x82f22768  ! 148: UDIVcc_I	udivcc 	%r8, 0x0768, %r1
	.word 0x8da209a9  ! 149: FDIVs	fdivs	%f8, %f9, %f6
	.word 0xe0aa215c  ! 150: STBA_I	stba	%r16, [%r8 + 0x015c] %asi
	.word 0xc3f21009  ! 151: CASXA_I	casxa	[%r8] 0x80, %r9, %r1
	.word 0xee0a2e10  ! 152: LDUB_I	ldub	[%r8 + 0x0e10], %r23
	.word 0x836a0009  ! 153: SDIVX_R	sdivx	%r8, %r9, %r1
	.word 0xc7f22009  ! 154: CASXA_R	casxa	[%r8]%asi, %r9, %r3
	.word 0x8b220009  ! 155: MULScc_R	mulscc 	%r8, %r9, %r5
	.word 0xc36a2640  ! 156: PREFETCH_I	prefetch	[%r8 + 0x0640], #one_read
	.word 0x8ada2bc8  ! 157: SMULcc_I	smulcc 	%r8, 0x0bc8, %r5
	.word 0x20800004  ! 158: BN	bn,a	<label_0x4>
	.word 0xcd3a0009  ! 159: STDF_R	std	%f6, [%r9, %r8]
	.word 0xcb3a2150  ! 160: STDF_I	std	%f5, [0x0150, %r8]
	.word 0xce0a297c  ! 161: LDUB_I	ldub	[%r8 + 0x097c], %r7
	.word 0x8da208a9  ! 162: FSUBs	fsubs	%f8, %f9, %f6
	.word 0xfab21009  ! 163: STHA_R	stha	%r29, [%r8 + %r9] 0x80
	.word 0x8143e006  ! 164: MEMBAR	membar	#StoreLoad | #LoadStore 
	.word 0xc2fa1009  ! 165: SWAPA_R	swapa	%r1, [%r8 + %r9] 0x80
	.word 0xf33a2778  ! 166: STDF_I	std	%f25, [0x0778, %r8]
	.word 0xf2522c40  ! 167: LDSH_I	ldsh	[%r8 + 0x0c40], %r25
	.word 0xa84a0009  ! 168: MULX_R	mulx 	%r8, %r9, %r20
	.word 0xc9220009  ! 169: STF_R	st	%f4, [%r9, %r8]
	.word 0xc3ea2344  ! 170: PREFETCHA_I	prefetcha	[%r8, + 0x0344] %asi, #one_read
	.word 0x3a800008  ! 171: BCC	bcc,a	<label_0x8>
	.word 0xe01a22e8  ! 173: LDD_I	ldd	[%r8 + 0x02e8], %r16
	.word 0xc6a22c24  ! 174: STWA_I	stwa	%r3, [%r8 + 0x0c24] %asi
	.word 0x18800004  ! 175: BGU	bgu  	<label_0x4>
	.word 0xdc9a1009  ! 176: LDDA_R	ldda	[%r8, %r9] 0x80, %r14
	.word 0xa6f229b4  ! 177: UDIVcc_I	udivcc 	%r8, 0x09b4, %r19
	.word 0xd6a21009  ! 179: STWA_R	stwa	%r11, [%r8 + %r9] 0x80
	.word 0x8143e058  ! 180: MEMBAR	membar	#StoreStore | #Lookaside | #Sync 
	.word 0xc40a2fc4  ! 181: LDUB_I	ldub	[%r8 + 0x0fc4], %r2
	.word 0x8143e058  ! 182: MEMBAR	membar	#StoreStore | #Lookaside | #Sync 
	.word 0x8143c000  ! 183: STBAR	stbar
	.word 0xdf3a0009  ! 184: STDF_R	std	%f15, [%r9, %r8]
	.word 0xecba21c0  ! 185: STDA_I	stda	%r22, [%r8 + 0x01c0] %asi
	.word 0xd41a23a0  ! 186: LDD_I	ldd	[%r8 + 0x03a0], %r10
	.word 0xcff22009  ! 187: CASXA_R	casxa	[%r8]%asi, %r9, %r7
	.word 0x8143e07b  ! 188: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0x89220009  ! 189: MULScc_R	mulscc 	%r8, %r9, %r4
	.word 0xc36a2048  ! 190: PREFETCH_I	prefetch	[%r8 + 0x0048], #one_read
	.word 0x16800004  ! 191: BGE	bge  	<label_0x4>
	.word 0xf0ca2730  ! 192: LDSBA_I	ldsba	[%r8, + 0x0730] %asi, %r24
	.word 0xeff22009  ! 193: CASXA_R	casxa	[%r8]%asi, %r9, %r23
	.word 0xb8722148  ! 195: UDIV_I	udiv 	%r8, 0x0148, %r28
	.word 0xc33a0009  ! 196: STDF_R	std	%f1, [%r9, %r8]
	.word 0xf8120009  ! 197: LDUH_R	lduh	[%r8 + %r9], %r28
	.word 0x40000008  ! 198: CALL	call	disp30_8
	.word 0x8f6a2ea0  ! 199: SDIVX_I	sdivx	%r8, 0x0ea0, %r7
	.word 0xfeaa2230  ! 200: STBA_I	stba	%r31, [%r8 + 0x0230] %asi
	.word 0x0e800004  ! 201: BVS	bvs  	<label_0x4>
	.word 0xc2f22200  ! 202: STXA_I	stxa	%r1, [%r8 + 0x0200] %asi
	.word 0x8a4a0009  ! 203: MULX_R	mulx 	%r8, %r9, %r5
	.word 0xc85220dc  ! 204: LDSH_I	ldsh	[%r8 + 0x00dc], %r4
	.word 0x83a208a9  ! 205: FSUBs	fsubs	%f8, %f9, %f1
	.word 0xccaa1009  ! 206: STBA_R	stba	%r6, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 207: STBAR	stbar
	.word 0xc27a2640  ! 208: SWAP_I	swap	%r1, [%r8 + 0x0640]
	.word 0x3e800008  ! 209: BVC	bvc,a	<label_0x8>
	.word 0x884a2cd8  ! 210: MULX_I	mulx 	%r8, 0x0cd8, %r4
	.word 0x28800004  ! 211: BLEU	bleu,a	<label_0x4>
	.word 0x0ec20008  ! 212: BRGEZ	brgez  ,nt	%8,<label_0x20008>
	.word 0xfa122624  ! 213: LDUH_I	lduh	[%r8 + 0x0624], %r29
	.word 0x8143e033  ! 214: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside | #MemIssue 
	.word 0x98f20009  ! 215: UDIVcc_R	udivcc 	%r8, %r9, %r12
	.word 0xc3e22009  ! 216: CASA_R	casa	[%r8] %asi, %r9, %r1
	.word 0x0cca0008  ! 217: BRGZ	brgz  ,pt	%8,<label_0xa0008>
	.word 0xbe6a0009  ! 218: UDIVX_R	udivx 	%r8, %r9, %r31
	.word 0x8ad20009  ! 219: UMULcc_R	umulcc 	%r8, %r9, %r5
	.word 0x8a7a26ac  ! 220: SDIV_I	sdiv 	%r8, 0x06ac, %r5
	.word 0xc3ea29ec  ! 221: PREFETCHA_I	prefetcha	[%r8, + 0x09ec] %asi, #one_read
	.word 0xb44a0009  ! 222: MULX_R	mulx 	%r8, %r9, %r26
	.word 0xf0fa1009  ! 223: SWAPA_R	swapa	%r24, [%r8 + %r9] 0x80
	.word 0x8143e02d  ! 224: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #MemIssue 
	.word 0x8143e00e  ! 225: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore 
	.word 0xdf3a2288  ! 226: STDF_I	std	%f15, [0x0288, %r8]
	.word 0xd7e21009  ! 227: CASA_I	casa	[%r8] 0x80, %r9, %r11
	.word 0x24ca0004  ! 228: BRLEZ	brlez,a,pt	%8,<label_0xa0004>
	.word 0xe89a1009  ! 229: LDDA_R	ldda	[%r8, %r9] 0x80, %r20
	.word 0xe5e22009  ! 230: CASA_R	casa	[%r8] %asi, %r9, %r18
	.word 0x856a25f0  ! 232: SDIVX_I	sdivx	%r8, 0x05f0, %r2
	.word 0xe24a2a04  ! 235: LDSB_I	ldsb	[%r8 + 0x0a04], %r17
	.word 0x84520009  ! 236: UMUL_R	umul 	%r8, %r9, %r2
	.word 0x82520009  ! 237: UMUL_R	umul 	%r8, %r9, %r1
	.word 0xc36a2f64  ! 238: PREFETCH_I	prefetch	[%r8 + 0x0f64], #one_read
	.word 0x8143e046  ! 239: MEMBAR	membar	#StoreLoad | #LoadStore | #Sync 
	.word 0xcbe22009  ! 240: CASA_R	casa	[%r8] %asi, %r9, %r5
	.word 0xcaf21009  ! 241: STXA_R	stxa	%r5, [%r8 + %r9] 0x80
	.word 0xc4ba2870  ! 243: STDA_I	stda	%r2, [%r8 + 0x0870] %asi
	.word 0x9a6a232c  ! 244: UDIVX_I	udivx 	%r8, 0x032c, %r13
	.word 0x40000004  ! 245: CALL	call	disp30_4
	.word 0xc7222770  ! 246: STF_I	st	%f3, [0x0770, %r8]
	.word 0x866a2eb0  ! 247: UDIVX_I	udivx 	%r8, 0x0eb0, %r3
	.word 0xca522c10  ! 248: LDSH_I	ldsh	[%r8 + 0x0c10], %r5
	.word 0xada208a9  ! 249: FSUBs	fsubs	%f8, %f9, %f22
	.word 0x8143e049  ! 250: MEMBAR	membar	#LoadLoad | #StoreStore | #Sync 
	.word 0x8efa0009  ! 251: SDIVcc_R	sdivcc 	%r8, %r9, %r7
	.word 0x8c5a0009  ! 252: SMUL_R	smul 	%r8, %r9, %r6
	.word 0xcb3a0009  ! 253: STDF_R	std	%f5, [%r9, %r8]
	.word 0xc24a0009  ! 254: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xcaca2f28  ! 255: LDSBA_I	ldsba	[%r8, + 0x0f28] %asi, %r5
	.word 0xc3ea208c  ! 256: PREFETCHA_I	prefetcha	[%r8, + 0x008c] %asi, #one_read
	.word 0xc49a1009  ! 257: LDDA_R	ldda	[%r8, %r9] 0x80, %r2
	.word 0xceb227e4  ! 258: STHA_I	stha	%r7, [%r8 + 0x07e4] %asi
	.word 0xef3a2ae8  ! 259: STDF_I	std	%f23, [0x0ae8, %r8]
	.word 0xc93a2758  ! 260: STDF_I	std	%f4, [0x0758, %r8]
	.word 0x8143e01f  ! 261: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #Lookaside 
	.word 0x885a257c  ! 262: SMUL_I	smul 	%r8, 0x057c, %r4
	.word 0xc6b21009  ! 263: STHA_R	stha	%r3, [%r8 + %r9] 0x80
	.word 0x20800008  ! 264: BN	bn,a	<label_0x8>
	.word 0xc6aa2bc4  ! 265: STBA_I	stba	%r3, [%r8 + 0x0bc4] %asi
	.word 0x1e800004  ! 267: BVC	bvc  	<label_0x4>
	.word 0xce921009  ! 268: LDUHA_R	lduha	[%r8, %r9] 0x80, %r7
	.word 0xa1a20829  ! 269: FADDs	fadds	%f8, %f9, %f16
	.word 0xbf220009  ! 270: MULScc_R	mulscc 	%r8, %r9, %r31
	.word 0xc4ba1009  ! 271: STDA_R	stda	%r2, [%r8 + %r9] 0x80
	.word 0x10800008  ! 272: BA	ba  	<label_0x8>
	.word 0x8cf22028  ! 273: UDIVcc_I	udivcc 	%r8, 0x0028, %r6
	.word 0xc6a21009  ! 274: STWA_R	stwa	%r3, [%r8 + %r9] 0x80
	.word 0x9cd20009  ! 275: UMULcc_R	umulcc 	%r8, %r9, %r14
	.word 0xdf222258  ! 276: STF_I	st	%f15, [0x0258, %r8]
	.word 0xede22009  ! 277: CASA_R	casa	[%r8] %asi, %r9, %r22
	.word 0xc24a0009  ! 278: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xcbf22009  ! 279: CASXA_R	casxa	[%r8]%asi, %r9, %r5
	.word 0xcd220009  ! 280: STF_R	st	%f6, [%r9, %r8]
	.word 0xc3ea2e20  ! 281: PREFETCHA_I	prefetcha	[%r8, + 0x0e20] %asi, #one_read
	.word 0xc4922c84  ! 282: LDUHA_I	lduha	[%r8, + 0x0c84] %asi, %r2
	.word 0x82f20009  ! 283: UDIVcc_R	udivcc 	%r8, %r9, %r1
	.word 0xf09a22a8  ! 284: LDDA_I	ldda	[%r8, + 0x02a8] %asi, %r24
	.word 0xc8f21009  ! 285: STXA_R	stxa	%r4, [%r8 + %r9] 0x80
	.word 0xa9a209a9  ! 288: FDIVs	fdivs	%f8, %f9, %f20
	.word 0x8d6a0009  ! 290: SDIVX_R	sdivx	%r8, %r9, %r6
	.word 0xc40a2bcc  ! 291: LDUB_I	ldub	[%r8 + 0x0bcc], %r2
	.word 0xc6da2580  ! 292: LDXA_I	ldxa	[%r8, + 0x0580] %asi, %r3
	.word 0xf45a0009  ! 293: LDX_R	ldx	[%r8 + %r9], %r26
	.word 0xcdf22009  ! 294: CASXA_R	casxa	[%r8]%asi, %r9, %r6
	.word 0x9b6a2260  ! 295: SDIVX_I	sdivx	%r8, 0x0260, %r13
	.word 0x8143e035  ! 296: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside | #MemIssue 
	.word 0xc36a2830  ! 297: PREFETCH_I	prefetch	[%r8 + 0x0830], #one_read
	.word 0x8cd229f8  ! 298: UMULcc_I	umulcc 	%r8, 0x09f8, %r6
	.word 0xfbe21009  ! 299: CASA_I	casa	[%r8] 0x80, %r9, %r29
	.word 0x8143c000  ! 300: STBAR	stbar
	.word 0xc6821009  ! 301: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r3
	.word 0xce8a1009  ! 302: LDUBA_R	lduba	[%r8, %r9] 0x80, %r7
	.word 0x95a208a9  ! 304: FSUBs	fsubs	%f8, %f9, %f10
	.word 0x866a0009  ! 305: UDIVX_R	udivx 	%r8, %r9, %r3
	.word 0x9e7224a4  ! 306: UDIV_I	udiv 	%r8, 0x04a4, %r15
	.word 0xcab21009  ! 307: STHA_R	stha	%r5, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 308: STBAR	stbar
	.word 0xc49a1009  ! 309: LDDA_R	ldda	[%r8, %r9] 0x80, %r2
	.word 0x866a0009  ! 310: UDIVX_R	udivx 	%r8, %r9, %r3
	.word 0x82d22568  ! 311: UMULcc_I	umulcc 	%r8, 0x0568, %r1
	.word 0xc3ea2ee8  ! 312: PREFETCHA_I	prefetcha	[%r8, + 0x0ee8] %asi, #one_read
	.word 0xe24a0009  ! 313: LDSB_R	ldsb	[%r8 + %r9], %r17
	.word 0xcd222268  ! 314: STF_I	st	%f6, [0x0268, %r8]
	.word 0xcaca1009  ! 315: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r5
	.word 0xc7f21009  ! 317: CASXA_I	casxa	[%r8] 0x80, %r9, %r3
	.word 0x84d20009  ! 318: UMULcc_R	umulcc 	%r8, %r9, %r2
	.word 0xe41a0009  ! 319: LDD_R	ldd	[%r8 + %r9], %r18
	.word 0x825a0009  ! 321: SMUL_R	smul 	%r8, %r9, %r1
	.word 0x3e800004  ! 322: BVC	bvc,a	<label_0x4>
	.word 0xcfe21009  ! 323: CASA_I	casa	[%r8] 0x80, %r9, %r7
	.word 0xf4ca1009  ! 324: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r26
	.word 0x8143c000  ! 327: STBAR	stbar
	.word 0xc36a271c  ! 328: PREFETCH_I	prefetch	[%r8 + 0x071c], #one_read
	.word 0xf9e21009  ! 329: CASA_I	casa	[%r8] 0x80, %r9, %r28
	.word 0xeeaa1009  ! 330: STBA_R	stba	%r23, [%r8 + %r9] 0x80
	.word 0xfc9a1009  ! 331: LDDA_R	ldda	[%r8, %r9] 0x80, %r30
	.word 0xc4da2ab8  ! 332: LDXA_I	ldxa	[%r8, + 0x0ab8] %asi, %r2
	.word 0x02c20004  ! 333: BRZ	brz  ,nt	%8,<label_0x20004>
	.word 0xc40a0009  ! 334: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xd4ba1009  ! 335: STDA_R	stda	%r10, [%r8 + %r9] 0x80
	.word 0x36800008  ! 336: BGE	bge,a	<label_0x8>
	.word 0xfa420009  ! 337: LDSW_R	ldsw	[%r8 + %r9], %r29
	.word 0xcf3a2900  ! 338: STDF_I	std	%f7, [0x0900, %r8]
	.word 0x866a0009  ! 339: UDIVX_R	udivx 	%r8, %r9, %r3
	.word 0xa7a20929  ! 340: FMULs	fmuls	%f8, %f9, %f19
	.word 0xbd6a2aa0  ! 341: SDIVX_I	sdivx	%r8, 0x0aa0, %r30
	.word 0x8e6a0009  ! 342: UDIVX_R	udivx 	%r8, %r9, %r7
	.word 0xe8da1009  ! 343: LDXA_R	ldxa	[%r8, %r9] 0x80, %r20
	.word 0xdf3a25e8  ! 344: STDF_I	std	%f15, [0x05e8, %r8]
	.word 0x8ba20829  ! 345: FADDs	fadds	%f8, %f9, %f5
	.word 0xc47a273c  ! 346: SWAP_I	swap	%r2, [%r8 + 0x073c]
	.word 0x88fa2a4c  ! 347: SDIVcc_I	sdivcc 	%r8, 0x0a4c, %r4
	.word 0xb86a2760  ! 348: UDIVX_I	udivx 	%r8, 0x0760, %r28
	.word 0xccfa1009  ! 349: SWAPA_R	swapa	%r6, [%r8 + %r9] 0x80
	.word 0xc6ea1009  ! 350: LDSTUBA_R	ldstuba	%r3, [%r8 + %r9] 0x80
	.word 0xc88a2768  ! 351: LDUBA_I	lduba	[%r8, + 0x0768] %asi, %r4
	.word 0xe60a2920  ! 352: LDUB_I	ldub	[%r8 + 0x0920], %r19
	.word 0x827a28bc  ! 353: SDIV_I	sdiv 	%r8, 0x08bc, %r1
	.word 0xccb22ccc  ! 354: STHA_I	stha	%r6, [%r8 + 0x0ccc] %asi
	.word 0x95a208a9  ! 355: FSUBs	fsubs	%f8, %f9, %f10
	.word 0xc8120009  ! 356: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xfcca2454  ! 357: LDSBA_I	ldsba	[%r8, + 0x0454] %asi, %r30
	.word 0xc8422358  ! 358: LDSW_I	ldsw	[%r8 + 0x0358], %r4
	.word 0xd41a0009  ! 359: LDD_R	ldd	[%r8 + %r9], %r10
	.word 0xec821009  ! 360: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r22
	.word 0xca520009  ! 361: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0x8143e06b  ! 362: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #MemIssue | #Sync 
	.word 0xc87a2d10  ! 363: SWAP_I	swap	%r4, [%r8 + 0x0d10]
	.word 0xaa4a2288  ! 364: MULX_I	mulx 	%r8, 0x0288, %r21
	.word 0x0ec20004  ! 365: BRGEZ	brgez  ,nt	%8,<label_0x20004>
	.word 0x8d6a2a40  ! 366: SDIVX_I	sdivx	%r8, 0x0a40, %r6
	.word 0xc2020009  ! 367: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0x876a29a4  ! 368: SDIVX_I	sdivx	%r8, 0x09a4, %r3
	.word 0xc6b22ffc  ! 369: STHA_I	stha	%r3, [%r8 + 0x0ffc] %asi
	.word 0xbada0009  ! 370: SMULcc_R	smulcc 	%r8, %r9, %r29
	.word 0xc65a0009  ! 371: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0x2c800004  ! 372: BNEG	bneg,a	<label_0x4>
	.word 0x82fa0009  ! 373: SDIVcc_R	sdivcc 	%r8, %r9, %r1
	.word 0xa2d22298  ! 374: UMULcc_I	umulcc 	%r8, 0x0298, %r17
	.word 0x8143c000  ! 375: STBAR	stbar
	.word 0xafa20829  ! 376: FADDs	fadds	%f8, %f9, %f23
	.word 0x8cfa0009  ! 377: SDIVcc_R	sdivcc 	%r8, %r9, %r6
	.word 0x987a0009  ! 378: SDIV_R	sdiv 	%r8, %r9, %r12
	.word 0x14800008  ! 379: BG	bg  	<label_0x8>
	.word 0xac7a24ec  ! 380: SDIV_I	sdiv 	%r8, 0x04ec, %r22
	.word 0x0cc20004  ! 381: BRGZ	brgz  ,nt	%8,<label_0x20004>
	.word 0x97a209a9  ! 382: FDIVs	fdivs	%f8, %f9, %f11
	.word 0xca420009  ! 383: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0x98f20009  ! 384: UDIVcc_R	udivcc 	%r8, %r9, %r12
	.word 0x8c5a0009  ! 385: SMUL_R	smul 	%r8, %r9, %r6
	.word 0xcef22748  ! 386: STXA_I	stxa	%r7, [%r8 + 0x0748] %asi
	.word 0x832220a8  ! 387: MULScc_I	mulscc 	%r8, 0x00a8, %r1
	.word 0xc3ea28d8  ! 388: PREFETCHA_I	prefetcha	[%r8, + 0x08d8] %asi, #one_read
	.word 0x8b222f44  ! 389: MULScc_I	mulscc 	%r8, 0x0f44, %r5
	.word 0xcf22264c  ! 390: STF_I	st	%f7, [0x064c, %r8]
	.word 0xceca287c  ! 391: LDSBA_I	ldsba	[%r8, + 0x087c] %asi, %r7
	.word 0xd4420009  ! 392: LDSW_R	ldsw	[%r8 + %r9], %r10
	.word 0x8da20929  ! 393: FMULs	fmuls	%f8, %f9, %f6
	.word 0xdc022ef4  ! 394: LDUW_I	lduw	[%r8 + 0x0ef4], %r14
	.word 0xca921009  ! 395: LDUHA_R	lduha	[%r8, %r9] 0x80, %r5
	.word 0x9ef20009  ! 396: UDIVcc_R	udivcc 	%r8, %r9, %r15
	.word 0xc8ea1009  ! 397: LDSTUBA_R	ldstuba	%r4, [%r8 + %r9] 0x80
	.word 0x856a2130  ! 398: SDIVX_I	sdivx	%r8, 0x0130, %r2
	.word 0xd4da2590  ! 399: LDXA_I	ldxa	[%r8, + 0x0590] %asi, %r10
	.word 0x0c800008  ! 400: BNEG	bneg  	<label_0x8>
	.word 0xc45a20d8  ! 401: LDX_I	ldx	[%r8 + 0x00d8], %r2
	.word 0xceea1009  ! 402: LDSTUBA_R	ldstuba	%r7, [%r8 + %r9] 0x80
	.word 0xc87a0009  ! 403: SWAP_R	swap	%r4, [%r8 + %r9]
	.word 0x3e800008  ! 404: BVC	bvc,a	<label_0x8>
	.word 0xc3ea23d4  ! 405: PREFETCHA_I	prefetcha	[%r8, + 0x03d4] %asi, #one_read
	.word 0x12800004  ! 406: BNE	bne  	<label_0x4>
	.word 0xcaea1009  ! 407: LDSTUBA_R	ldstuba	%r5, [%r8 + %r9] 0x80
	.word 0x9a520009  ! 408: UMUL_R	umul 	%r8, %r9, %r13
	.word 0x24c20004  ! 409: BRLEZ	brlez,a,nt	%8,<label_0x20004>
	.word 0x8ba20829  ! 410: FADDs	fadds	%f8, %f9, %f5
	.word 0x0cc20008  ! 411: BRGZ	brgz  ,nt	%8,<label_0x20008>
	.word 0xfc8a1009  ! 412: LDUBA_R	lduba	[%r8, %r9] 0x80, %r30
	.word 0x85a20929  ! 413: FMULs	fmuls	%f8, %f9, %f2
	.word 0x36800004  ! 414: BGE	bge,a	<label_0x4>
	.word 0xf89a1009  ! 415: LDDA_R	ldda	[%r8, %r9] 0x80, %r28
	.word 0x827a0009  ! 416: SDIV_R	sdiv 	%r8, %r9, %r1
	.word 0xe0ba1009  ! 417: STDA_R	stda	%r16, [%r8 + %r9] 0x80
	.word 0x3c800004  ! 418: BPOS	bpos,a	<label_0x4>
	.word 0x86da0009  ! 419: SMULcc_R	smulcc 	%r8, %r9, %r3
	.word 0x06ca0004  ! 420: BRLZ	brlz  ,pt	%8,<label_0xa0004>
	.word 0x83220009  ! 421: MULScc_R	mulscc 	%r8, %r9, %r1
	.word 0x12800008  ! 422: BNE	bne  	<label_0x8>
	.word 0xf01a2510  ! 423: LDD_I	ldd	[%r8 + 0x0510], %r24
	.word 0x40000008  ! 424: CALL	call	disp30_8
	.word 0xccaa26d4  ! 425: STBA_I	stba	%r6, [%r8 + 0x06d4] %asi
	.word 0xc4aa1009  ! 426: STBA_R	stba	%r2, [%r8 + %r9] 0x80
	.word 0xd9f21009  ! 427: CASXA_I	casxa	[%r8] 0x80, %r9, %r12
	.word 0x865a0009  ! 428: SMUL_R	smul 	%r8, %r9, %r3
	.word 0x8cda0009  ! 429: SMULcc_R	smulcc 	%r8, %r9, %r6
	.word 0x04c20004  ! 430: BRLEZ	brlez  ,nt	%8,<label_0x20004>
	.word 0xd68a2fb8  ! 431: LDUBA_I	lduba	[%r8, + 0x0fb8] %asi, %r11
	.word 0x8143e00d  ! 432: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore 
	.word 0xca4a2d98  ! 433: LDSB_I	ldsb	[%r8 + 0x0d98], %r5
	.word 0xeaaa23f4  ! 434: STBA_I	stba	%r21, [%r8 + 0x03f4] %asi
	.word 0x8143c000  ! 435: STBAR	stbar
	.word 0x2ac20004  ! 436: BRNZ	brnz,a,nt	%8,<label_0x20004>
	.word 0x86f20009  ! 437: UDIVcc_R	udivcc 	%r8, %r9, %r3
	.word 0x8c4a0009  ! 438: MULX_R	mulx 	%r8, %r9, %r6
	.word 0xeefa1009  ! 439: SWAPA_R	swapa	%r23, [%r8 + %r9] 0x80
	.word 0x2cc20004  ! 440: BRGZ	brgz,a,nt	%8,<label_0x20004>
	.word 0xcc9a1009  ! 441: LDDA_R	ldda	[%r8, %r9] 0x80, %r6
	.word 0x8143c000  ! 442: STBAR	stbar
	.word 0x0e800008  ! 443: BVS	bvs  	<label_0x8>
	.word 0x8143c000  ! 444: STBAR	stbar
	.word 0xcea222d8  ! 445: STWA_I	stwa	%r7, [%r8 + 0x02d8] %asi
	.word 0xcab2217c  ! 446: STHA_I	stha	%r5, [%r8 + 0x017c] %asi
	.word 0xca5a2270  ! 447: LDX_I	ldx	[%r8 + 0x0270], %r5
	.word 0xce6a2c34  ! 448: LDSTUB_I	ldstub	%r7, [%r8 + 0x0c34]
	.word 0xb85a0009  ! 449: SMUL_R	smul 	%r8, %r9, %r28
	.word 0x83a208a9  ! 450: FSUBs	fsubs	%f8, %f9, %f1
	.word 0xc3ea2888  ! 451: PREFETCHA_I	prefetcha	[%r8, + 0x0888] %asi, #one_read
	.word 0x24800004  ! 452: BLE	ble,a	<label_0x4>
	.word 0xcaea21b0  ! 453: LDSTUBA_I	ldstuba	%r5, [%r8 + 0x01b0] %asi
	.word 0x8143e07c  ! 454: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xbda209a9  ! 455: FDIVs	fdivs	%f8, %f9, %f30
	.word 0x8143e02e  ! 456: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #MemIssue 
	.word 0x84720009  ! 460: UDIV_R	udiv 	%r8, %r9, %r2
	.word 0xf0122a34  ! 461: LDUH_I	lduh	[%r8 + 0x0a34], %r24
	.word 0xe8aa21a0  ! 462: STBA_I	stba	%r20, [%r8 + 0x01a0] %asi
	.word 0x844a2570  ! 463: MULX_I	mulx 	%r8, 0x0570, %r2
	.word 0xc49a1009  ! 465: LDDA_R	ldda	[%r8, %r9] 0x80, %r2
	.word 0x10800008  ! 466: BA	ba  	<label_0x8>
	.word 0xc36a2b10  ! 467: PREFETCH_I	prefetch	[%r8 + 0x0b10], #one_read
	.word 0xc4ca1009  ! 468: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r2
	.word 0xca022238  ! 469: LDUW_I	lduw	[%r8 + 0x0238], %r5
	.word 0x86fa2410  ! 470: SDIVcc_I	sdivcc 	%r8, 0x0410, %r3
	.word 0xfcba1009  ! 472: STDA_R	stda	%r30, [%r8 + %r9] 0x80
	.word 0xd6ea1009  ! 474: LDSTUBA_R	ldstuba	%r11, [%r8 + %r9] 0x80
	.word 0xc4a22138  ! 475: STWA_I	stwa	%r2, [%r8 + 0x0138] %asi
	.word 0xef3a2878  ! 477: STDF_I	std	%f23, [0x0878, %r8]
	.word 0x0e800008  ! 478: BVS	bvs  	<label_0x8>
	.word 0x85220009  ! 479: MULScc_R	mulscc 	%r8, %r9, %r2
	.word 0xfc82254c  ! 480: LDUWA_I	lduwa	[%r8, + 0x054c] %asi, %r30
	.word 0x84520009  ! 481: UMUL_R	umul 	%r8, %r9, %r2
	.word 0x8143c000  ! 482: STBAR	stbar
	.word 0xccea1009  ! 483: LDSTUBA_R	ldstuba	%r6, [%r8 + %r9] 0x80
	.word 0x8143e068  ! 484: MEMBAR	membar	#StoreStore | #MemIssue | #Sync 
	.word 0xceb21009  ! 485: STHA_R	stha	%r7, [%r8 + %r9] 0x80
	.word 0x896a0009  ! 486: SDIVX_R	sdivx	%r8, %r9, %r4
	.word 0x10800004  ! 487: BA	ba  	<label_0x4>
	.word 0xd8aa1009  ! 488: STBA_R	stba	%r12, [%r8 + %r9] 0x80
	.word 0xc4ea1009  ! 489: LDSTUBA_R	ldstuba	%r2, [%r8 + %r9] 0x80
	.word 0x88522284  ! 490: UMUL_I	umul 	%r8, 0x0284, %r4
	.word 0x02c20008  ! 491: BRZ	brz  ,nt	%8,<label_0x20008>
	.word 0x26ca0004  ! 492: BRLZ	brlz,a,pt	%8,<label_0xa0004>
	.word 0xf6b21009  ! 493: STHA_R	stha	%r27, [%r8 + %r9] 0x80
	.word 0xc3f22009  ! 494: CASXA_R	casxa	[%r8]%asi, %r9, %r1
	.word 0x8c7a0009  ! 495: SDIV_R	sdiv 	%r8, %r9, %r6
	.word 0x8d2220c8  ! 496: MULScc_I	mulscc 	%r8, 0x00c8, %r6
	.word 0xccfa23f8  ! 497: SWAPA_I	swapa	%r6, [%r8 + 0x03f8] %asi
	.word 0x8143e04f  ! 498: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #Sync 
	.word 0xf6420009  ! 499: LDSW_R	ldsw	[%r8 + %r9], %r27
	.word 0x24ca0004  ! 500: BRLEZ	brlez,a,pt	%8,<label_0xa0004>
	.word 0x8143e079  ! 501: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0x836a0009  ! 502: SDIVX_R	sdivx	%r8, %r9, %r1
	.word 0x827a2800  ! 503: SDIV_I	sdiv 	%r8, 0x0800, %r1
	.word 0xca4a2a7c  ! 504: LDSB_I	ldsb	[%r8 + 0x0a7c], %r5
	.word 0x34800004  ! 505: BG	bg,a	<label_0x4>
	.word 0x8143c000  ! 506: STBAR	stbar
	.word 0xa5a20829  ! 507: FADDs	fadds	%f8, %f9, %f18
	.word 0xdcc21009  ! 508: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r14
	.word 0xcfe21009  ! 509: CASA_I	casa	[%r8] 0x80, %r9, %r7
	.word 0x86520009  ! 510: UMUL_R	umul 	%r8, %r9, %r3
	.word 0x8d220009  ! 511: MULScc_R	mulscc 	%r8, %r9, %r6
	.word 0xc36a2fec  ! 512: PREFETCH_I	prefetch	[%r8 + 0x0fec], #one_read
	.word 0xcfe22009  ! 513: CASA_R	casa	[%r8] %asi, %r9, %r7
	.word 0xd4ea1009  ! 514: LDSTUBA_R	ldstuba	%r10, [%r8 + %r9] 0x80
	.word 0x8ba20929  ! 515: FMULs	fmuls	%f8, %f9, %f5
	.word 0x8143c000  ! 516: STBAR	stbar
	.word 0xeb222bec  ! 517: STF_I	st	%f21, [0x0bec, %r8]
	.word 0xccda1009  ! 518: LDXA_R	ldxa	[%r8, %r9] 0x80, %r6
	.word 0x8143e02e  ! 519: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #MemIssue 
	.word 0xf1e21009  ! 520: CASA_I	casa	[%r8] 0x80, %r9, %r24
	.word 0xcc9a1009  ! 521: LDDA_R	ldda	[%r8, %r9] 0x80, %r6
	.word 0x10800004  ! 522: BA	ba  	<label_0x4>
	.word 0x8143e035  ! 523: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside | #MemIssue 
	.word 0xde8a2414  ! 524: LDUBA_I	lduba	[%r8, + 0x0414] %asi, %r15
	.word 0xc80a0009  ! 525: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0x8143c000  ! 526: STBAR	stbar
	.word 0xeff22009  ! 527: CASXA_R	casxa	[%r8]%asi, %r9, %r23
	.word 0xc36a2194  ! 528: PREFETCH_I	prefetch	[%r8 + 0x0194], #one_read
	.word 0xcbf22009  ! 530: CASXA_R	casxa	[%r8]%asi, %r9, %r5
	.word 0xcd3a0009  ! 531: STDF_R	std	%f6, [%r9, %r8]
	.word 0xea4220ac  ! 532: LDSW_I	ldsw	[%r8 + 0x00ac], %r21
	.word 0x0e800004  ! 533: BVS	bvs  	<label_0x4>
	.word 0x88720009  ! 534: UDIV_R	udiv 	%r8, %r9, %r4
	.word 0xc2822a4c  ! 535: LDUWA_I	lduwa	[%r8, + 0x0a4c] %asi, %r1
	.word 0xf09a2840  ! 536: LDDA_I	ldda	[%r8, + 0x0840] %asi, %r24
	.word 0x8143e047  ! 537: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Sync 
	.word 0x10800004  ! 538: BA	ba  	<label_0x4>
	.word 0x87a20929  ! 539: FMULs	fmuls	%f8, %f9, %f3
	.word 0xc4d22f70  ! 540: LDSHA_I	ldsha	[%r8, + 0x0f70] %asi, %r2
	.word 0x8143e052  ! 541: MEMBAR	membar	#StoreLoad | #Lookaside | #Sync 
	.word 0x8143c000  ! 542: STBAR	stbar
	.word 0xfad22c5c  ! 543: LDSHA_I	ldsha	[%r8, + 0x0c5c] %asi, %r29
	.word 0x8143e016  ! 544: MEMBAR	membar	#StoreLoad | #LoadStore | #Lookaside 
	.word 0xc66a21b8  ! 545: LDSTUB_I	ldstub	%r3, [%r8 + 0x01b8]
	.word 0x8143e071  ! 546: MEMBAR	membar	#LoadLoad | #Lookaside | #MemIssue | #Sync 
	.word 0xc2a22e70  ! 547: STWA_I	stwa	%r1, [%r8 + 0x0e70] %asi
	.word 0x10800004  ! 548: BA	ba  	<label_0x4>
	.word 0xeb3a0009  ! 549: STDF_R	std	%f21, [%r9, %r8]
	.word 0xcb3a2888  ! 550: STDF_I	std	%f5, [0x0888, %r8]
	.word 0xd7e22009  ! 551: CASA_R	casa	[%r8] %asi, %r9, %r11
	.word 0x87a20929  ! 552: FMULs	fmuls	%f8, %f9, %f3
	.word 0xc6a22f0c  ! 553: STWA_I	stwa	%r3, [%r8 + 0x0f0c] %asi
	.word 0xf0f22418  ! 554: STXA_I	stxa	%r24, [%r8 + 0x0418] %asi
	.word 0xe65a29b8  ! 555: LDX_I	ldx	[%r8 + 0x09b8], %r19
	.word 0xc36a2684  ! 556: PREFETCH_I	prefetch	[%r8 + 0x0684], #one_read
	.word 0xce921009  ! 557: LDUHA_R	lduha	[%r8, %r9] 0x80, %r7
	.word 0x8143e039  ! 558: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside | #MemIssue 
	.word 0x16800008  ! 559: BGE	bge  	<label_0x8>
	.word 0xf41a2e18  ! 561: LDD_I	ldd	[%r8 + 0x0e18], %r26
	.word 0xc2520009  ! 562: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0x8af222fc  ! 563: UDIVcc_I	udivcc 	%r8, 0x02fc, %r5
	.word 0x8c7a0009  ! 564: SDIV_R	sdiv 	%r8, %r9, %r6
	.word 0x887a0009  ! 565: SDIV_R	sdiv 	%r8, %r9, %r4
	.word 0xc8da1009  ! 566: LDXA_R	ldxa	[%r8, %r9] 0x80, %r4
	.word 0x825a0009  ! 567: SMUL_R	smul 	%r8, %r9, %r1
	.word 0x8143c000  ! 568: STBAR	stbar
	.word 0xc36a2e08  ! 569: PREFETCH_I	prefetch	[%r8 + 0x0e08], #one_read
	.word 0xc7f21009  ! 570: CASXA_I	casxa	[%r8] 0x80, %r9, %r3
	.word 0xc8b228bc  ! 571: STHA_I	stha	%r4, [%r8 + 0x08bc] %asi
	.word 0xbc5a0009  ! 572: SMUL_R	smul 	%r8, %r9, %r30
	.word 0xcada2668  ! 574: LDXA_I	ldxa	[%r8, + 0x0668] %asi, %r5
	.word 0xf28224e4  ! 575: LDUWA_I	lduwa	[%r8, + 0x04e4] %asi, %r25
	.word 0xc2520009  ! 576: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xfaaa2580  ! 577: STBA_I	stba	%r29, [%r8 + 0x0580] %asi
	.word 0x844a2b44  ! 578: MULX_I	mulx 	%r8, 0x0b44, %r2
	.word 0x0e800004  ! 580: BVS	bvs  	<label_0x4>
	.word 0xca6a27fc  ! 581: LDSTUB_I	ldstub	%r5, [%r8 + 0x07fc]
	.word 0x8c6a0009  ! 583: UDIVX_R	udivx 	%r8, %r9, %r6
	.word 0xc7f21009  ! 584: CASXA_I	casxa	[%r8] 0x80, %r9, %r3
	.word 0xf07a0009  ! 585: SWAP_R	swap	%r24, [%r8 + %r9]
	.word 0x8143e003  ! 586: MEMBAR	membar	#LoadLoad | #StoreLoad 
	.word 0x856a29d0  ! 587: SDIVX_I	sdivx	%r8, 0x09d0, %r2
	.word 0xc36a29f0  ! 588: PREFETCH_I	prefetch	[%r8 + 0x09f0], #one_read
	.word 0x82f22304  ! 589: UDIVcc_I	udivcc 	%r8, 0x0304, %r1
	.word 0x0a800008  ! 590: BCS	bcs  	<label_0x8>
	.word 0x8ada0009  ! 591: SMULcc_R	smulcc 	%r8, %r9, %r5
	.word 0xc26a0009  ! 592: LDSTUB_R	ldstub	%r1, [%r8 + %r9]
	.word 0x8143e07b  ! 593: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0x8143c000  ! 594: STBAR	stbar
	.word 0xdaaa1009  ! 595: STBA_R	stba	%r13, [%r8 + %r9] 0x80
	.word 0x04c20004  ! 596: BRLEZ	brlez  ,nt	%8,<label_0x20004>
	.word 0x82720009  ! 598: UDIV_R	udiv 	%r8, %r9, %r1
	.word 0x866a239c  ! 599: UDIVX_I	udivx 	%r8, 0x039c, %r3
	.word 0xf01a0009  ! 600: LDD_R	ldd	[%r8 + %r9], %r24
	.word 0xc4ba2378  ! 601: STDA_I	stda	%r2, [%r8 + 0x0378] %asi
	.word 0xf89a1009  ! 602: LDDA_R	ldda	[%r8, %r9] 0x80, %r28
	.word 0x9c720009  ! 603: UDIV_R	udiv 	%r8, %r9, %r14
	.word 0xccc21009  ! 604: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r6
	.word 0xc2520009  ! 605: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xd41a2258  ! 606: LDD_I	ldd	[%r8 + 0x0258], %r10
	.word 0xc36a2314  ! 607: PREFETCH_I	prefetch	[%r8 + 0x0314], #one_read
	.word 0xcac22ab8  ! 608: LDSWA_I	ldswa	[%r8, + 0x0ab8] %asi, %r5
	.word 0xc93a0009  ! 609: STDF_R	std	%f4, [%r9, %r8]
	.word 0xecb22ea4  ! 610: STHA_I	stha	%r22, [%r8 + 0x0ea4] %asi
	.word 0xc4c22598  ! 611: LDSWA_I	ldswa	[%r8, + 0x0598] %asi, %r2
	.word 0xeca22ee8  ! 612: STWA_I	stwa	%r22, [%r8 + 0x0ee8] %asi
	.word 0xc6420009  ! 613: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xca522e20  ! 614: LDSH_I	ldsh	[%r8 + 0x0e20], %r5
	.word 0xca6a0009  ! 615: LDSTUB_R	ldstub	%r5, [%r8 + %r9]
	.word 0xdc9a20a8  ! 616: LDDA_I	ldda	[%r8, + 0x00a8] %asi, %r14
	.word 0xe6d21009  ! 617: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r19
	.word 0xe27a21d8  ! 618: SWAP_I	swap	%r17, [%r8 + 0x01d8]
	.word 0xd53a2f38  ! 619: STDF_I	std	%f10, [0x0f38, %r8]
	.word 0xc4ea1009  ! 620: LDSTUBA_R	ldstuba	%r2, [%r8 + %r9] 0x80
	.word 0xeef21009  ! 621: STXA_R	stxa	%r23, [%r8 + %r9] 0x80
	.word 0xcbf21009  ! 622: CASXA_I	casxa	[%r8] 0x80, %r9, %r5
	.word 0x98522ccc  ! 623: UMUL_I	umul 	%r8, 0x0ccc, %r12
	.word 0xcff22009  ! 624: CASXA_R	casxa	[%r8]%asi, %r9, %r7
	.word 0x966a0009  ! 625: UDIVX_R	udivx 	%r8, %r9, %r11
	.word 0xc6922f50  ! 626: LDUHA_I	lduha	[%r8, + 0x0f50] %asi, %r3
	.word 0x82da0009  ! 627: SMULcc_R	smulcc 	%r8, %r9, %r1
	.word 0x8c6a0009  ! 628: UDIVX_R	udivx 	%r8, %r9, %r6
	.word 0xcd3a2650  ! 629: STDF_I	std	%f6, [0x0650, %r8]
	.word 0x0e800004  ! 630: BVS	bvs  	<label_0x4>
	.word 0xc86a26d8  ! 631: LDSTUB_I	ldstub	%r4, [%r8 + 0x06d8]
	.word 0xcef22350  ! 632: STXA_I	stxa	%r7, [%r8 + 0x0350] %asi
	.word 0x3a800008  ! 633: BCC	bcc,a	<label_0x8>
	.word 0xc36a25a8  ! 634: PREFETCH_I	prefetch	[%r8 + 0x05a8], #one_read
	.word 0x85a208a9  ! 635: FSUBs	fsubs	%f8, %f9, %f2
	.word 0x8143c000  ! 636: STBAR	stbar
	.word 0xa9a20829  ! 637: FADDs	fadds	%f8, %f9, %f20
	.word 0xd8ba1009  ! 638: STDA_R	stda	%r12, [%r8 + %r9] 0x80
	.word 0xcaa2250c  ! 639: STWA_I	stwa	%r5, [%r8 + 0x050c] %asi
	.word 0xc2d22528  ! 641: LDSHA_I	ldsha	[%r8, + 0x0528] %asi, %r1
	.word 0xce4a0009  ! 642: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xcca21009  ! 643: STWA_R	stwa	%r6, [%r8 + %r9] 0x80
	.word 0xc522241c  ! 644: STF_I	st	%f2, [0x041c, %r8]
	.word 0x9a7a2158  ! 645: SDIV_I	sdiv 	%r8, 0x0158, %r13
	.word 0xc8da2110  ! 646: LDXA_I	ldxa	[%r8, + 0x0110] %asi, %r4
	.word 0x8da20929  ! 647: FMULs	fmuls	%f8, %f9, %f6
	.word 0x8143c000  ! 648: STBAR	stbar
	.word 0xc26a2468  ! 649: LDSTUB_I	ldstub	%r1, [%r8 + 0x0468]
	.word 0x856a25fc  ! 650: SDIVX_I	sdivx	%r8, 0x05fc, %r2
	.word 0x2ac20008  ! 651: BRNZ	brnz,a,nt	%8,<label_0x20008>
	.word 0xc3ea2934  ! 652: PREFETCHA_I	prefetcha	[%r8, + 0x0934] %asi, #one_read
	.word 0x82f2229c  ! 653: UDIVcc_I	udivcc 	%r8, 0x029c, %r1
	.word 0x8143c000  ! 654: STBAR	stbar
	.word 0xc8fa2368  ! 655: SWAPA_I	swapa	%r4, [%r8 + 0x0368] %asi
	.word 0x8cd2272c  ! 656: UMULcc_I	umulcc 	%r8, 0x072c, %r6
	.word 0x8143c000  ! 657: STBAR	stbar
	.word 0x8143c000  ! 658: STBAR	stbar
	.word 0xd93a2f70  ! 659: STDF_I	std	%f12, [0x0f70, %r8]
	.word 0x8143c000  ! 660: STBAR	stbar
	.word 0x83a20829  ! 661: FADDs	fadds	%f8, %f9, %f1
	.word 0xda821009  ! 662: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r13
	.word 0xf13a2ab0  ! 663: STDF_I	std	%f24, [0x0ab0, %r8]
	.word 0x36800008  ! 664: BGE	bge,a	<label_0x8>
	.word 0xccca1009  ! 665: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r6
	.word 0x12800004  ! 666: BNE	bne  	<label_0x4>
	.word 0x8143e07e  ! 667: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0x38800004  ! 668: BGU	bgu,a	<label_0x4>
	.word 0xc3ea2298  ! 669: PREFETCHA_I	prefetcha	[%r8, + 0x0298] %asi, #one_read
	.word 0x8b6a0009  ! 670: SDIVX_R	sdivx	%r8, %r9, %r5
	.word 0x8f6a26c4  ! 671: SDIVX_I	sdivx	%r8, 0x06c4, %r7
	.word 0xb24a2b5c  ! 672: MULX_I	mulx 	%r8, 0x0b5c, %r25
	.word 0xcca22228  ! 673: STWA_I	stwa	%r6, [%r8 + 0x0228] %asi
	.word 0xfeea1009  ! 674: LDSTUBA_R	ldstuba	%r31, [%r8 + %r9] 0x80
	.word 0xce8a1009  ! 675: LDUBA_R	lduba	[%r8, %r9] 0x80, %r7
	.word 0xc47a0009  ! 676: SWAP_R	swap	%r2, [%r8 + %r9]
	.word 0x40000004  ! 677: CALL	call	disp30_4
	.word 0xeca21009  ! 679: STWA_R	stwa	%r22, [%r8 + %r9] 0x80
	.word 0xcc0a0009  ! 680: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0x865a2108  ! 681: SMUL_I	smul 	%r8, 0x0108, %r3
	.word 0x8143c000  ! 682: STBAR	stbar
	.word 0x94d20009  ! 683: UMULcc_R	umulcc 	%r8, %r9, %r10
	.word 0x89a208a9  ! 684: FSUBs	fsubs	%f8, %f9, %f4
	.word 0x8143e041  ! 685: MEMBAR	membar	#LoadLoad | #Sync 
	.word 0xc2ca2720  ! 686: LDSBA_I	ldsba	[%r8, + 0x0720] %asi, %r1
	.word 0xd4020009  ! 687: LDUW_R	lduw	[%r8 + %r9], %r10
	.word 0xcaaa247c  ! 688: STBA_I	stba	%r5, [%r8 + 0x047c] %asi
	.word 0xca822d2c  ! 689: LDUWA_I	lduwa	[%r8, + 0x0d2c] %asi, %r5
	.word 0xc4020009  ! 690: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xb8d20009  ! 691: UMULcc_R	umulcc 	%r8, %r9, %r28
	.word 0xfe7a2dcc  ! 692: SWAP_I	swap	%r31, [%r8 + 0x0dcc]
	.word 0xc36a2628  ! 693: PREFETCH_I	prefetch	[%r8 + 0x0628], #one_read
	.word 0xf3e21009  ! 694: CASA_I	casa	[%r8] 0x80, %r9, %r25
	.word 0x8143e00c  ! 695: MEMBAR	membar	#LoadStore | #StoreStore 
	.word 0xca4a0009  ! 696: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0x8143e05e  ! 697: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0xa4520009  ! 698: UMUL_R	umul 	%r8, %r9, %r18
	.word 0xf7e21009  ! 699: CASA_I	casa	[%r8] 0x80, %r9, %r27
	.word 0xcf3a2c00  ! 700: STDF_I	std	%f7, [0x0c00, %r8]
	.word 0x34800004  ! 701: BG	bg,a	<label_0x4>
	.word 0x8ad22e88  ! 704: UMULcc_I	umulcc 	%r8, 0x0e88, %r5
	.word 0xfc921009  ! 705: LDUHA_R	lduha	[%r8, %r9] 0x80, %r30
	.word 0xc87a2ee4  ! 706: SWAP_I	swap	%r4, [%r8 + 0x0ee4]
	.word 0xcf3a2c98  ! 707: STDF_I	std	%f7, [0x0c98, %r8]
	.word 0xe25a22d8  ! 708: LDX_I	ldx	[%r8 + 0x02d8], %r17
	.word 0xcd222df8  ! 709: STF_I	st	%f6, [0x0df8, %r8]
	.word 0xcd3a0009  ! 710: STDF_R	std	%f6, [%r9, %r8]
	.word 0xd80a28b4  ! 711: LDUB_I	ldub	[%r8 + 0x08b4], %r12
	.word 0xc3e22009  ! 712: CASA_R	casa	[%r8] %asi, %r9, %r1
	.word 0x86f20009  ! 713: UDIVcc_R	udivcc 	%r8, %r9, %r3
	.word 0x8143e067  ! 714: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #MemIssue | #Sync 
	.word 0xc2b228bc  ! 715: STHA_I	stha	%r1, [%r8 + 0x08bc] %asi
	.word 0x8143c000  ! 716: STBAR	stbar
	.word 0x8143e066  ! 717: MEMBAR	membar	#StoreLoad | #LoadStore | #MemIssue | #Sync 
	.word 0x02c20004  ! 718: BRZ	brz  ,nt	%8,<label_0x20004>
	.word 0x886a22cc  ! 719: UDIVX_I	udivx 	%r8, 0x02cc, %r4
	.word 0xc2aa1009  ! 720: STBA_R	stba	%r1, [%r8 + %r9] 0x80
	.word 0xccd224ac  ! 721: LDSHA_I	ldsha	[%r8, + 0x04ac] %asi, %r6
	.word 0x8af20009  ! 722: UDIVcc_R	udivcc 	%r8, %r9, %r5
	.word 0xf0a21009  ! 723: STWA_R	stwa	%r24, [%r8 + %r9] 0x80
	.word 0xc85a0009  ! 724: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xccfa20c8  ! 725: SWAPA_I	swapa	%r6, [%r8 + 0x00c8] %asi
	.word 0x8143e03f  ! 726: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0xcaa225d0  ! 727: STWA_I	stwa	%r5, [%r8 + 0x05d0] %asi
	.word 0xf2da26b0  ! 728: LDXA_I	ldxa	[%r8, + 0x06b0] %asi, %r25
	.word 0x8143e05c  ! 729: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0xcf3a25a0  ! 730: STDF_I	std	%f7, [0x05a0, %r8]
	.word 0x8a520009  ! 731: UMUL_R	umul 	%r8, %r9, %r5
	.word 0xec1a0009  ! 732: LDD_R	ldd	[%r8 + %r9], %r22
	.word 0xc6da28e0  ! 733: LDXA_I	ldxa	[%r8, + 0x08e0] %asi, %r3
	.word 0x864a0009  ! 734: MULX_R	mulx 	%r8, %r9, %r3
	.word 0xe2922234  ! 735: LDUHA_I	lduha	[%r8, + 0x0234] %asi, %r17
	.word 0x8143c000  ! 736: STBAR	stbar
	.word 0x8a720009  ! 737: UDIV_R	udiv 	%r8, %r9, %r5
	.word 0x14800008  ! 738: BG	bg  	<label_0x8>
	.word 0x85a208a9  ! 739: FSUBs	fsubs	%f8, %f9, %f2
	.word 0x8f220009  ! 740: MULScc_R	mulscc 	%r8, %r9, %r7
	.word 0xe0aa2758  ! 741: STBA_I	stba	%r16, [%r8 + 0x0758] %asi
	.word 0x8143c000  ! 742: STBAR	stbar
	.word 0xf6da2260  ! 743: LDXA_I	ldxa	[%r8, + 0x0260] %asi, %r27
	.word 0xc2f21009  ! 744: STXA_R	stxa	%r1, [%r8 + %r9] 0x80
	.word 0xc46a26d4  ! 745: LDSTUB_I	ldstub	%r2, [%r8 + 0x06d4]
	.word 0x87a208a9  ! 746: FSUBs	fsubs	%f8, %f9, %f3
	.word 0xc36a2e58  ! 747: PREFETCH_I	prefetch	[%r8 + 0x0e58], #one_read
	.word 0x8143e039  ! 748: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside | #MemIssue 
	.word 0xcfe21009  ! 749: CASA_I	casa	[%r8] 0x80, %r9, %r7
	.word 0xb56a0009  ! 750: SDIVX_R	sdivx	%r8, %r9, %r26
	.word 0xceda1009  ! 751: LDXA_R	ldxa	[%r8, %r9] 0x80, %r7
	.word 0xc46a29fc  ! 752: LDSTUB_I	ldstub	%r2, [%r8 + 0x09fc]
	.word 0x2a800004  ! 753: BCS	bcs,a	<label_0x4>
	.word 0xca520009  ! 754: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xfb222398  ! 755: STF_I	st	%f29, [0x0398, %r8]
	.word 0x9ba209a9  ! 757: FDIVs	fdivs	%f8, %f9, %f13
	.word 0x8143c000  ! 758: STBAR	stbar
	.word 0xc25a24b0  ! 759: LDX_I	ldx	[%r8 + 0x04b0], %r1
	.word 0xf6fa1009  ! 760: SWAPA_R	swapa	%r27, [%r8 + %r9] 0x80
	.word 0xce0a0009  ! 761: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xc4120009  ! 762: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0x83a20829  ! 763: FADDs	fadds	%f8, %f9, %f1
	.word 0x08800004  ! 764: BLEU	bleu  	<label_0x4>
	.word 0xc40a2b18  ! 765: LDUB_I	ldub	[%r8 + 0x0b18], %r2
	.word 0x8143c000  ! 766: STBAR	stbar
	.word 0xff3a0009  ! 767: STDF_R	std	%f31, [%r9, %r8]
	.word 0x0c800004  ! 768: BNEG	bneg  	<label_0x4>
	.word 0xfc4a2344  ! 769: LDSB_I	ldsb	[%r8 + 0x0344], %r30
	.word 0x8b220009  ! 770: MULScc_R	mulscc 	%r8, %r9, %r5
	.word 0xd8420009  ! 771: LDSW_R	ldsw	[%r8 + %r9], %r12
	.word 0xc26a0009  ! 772: LDSTUB_R	ldstub	%r1, [%r8 + %r9]
	.word 0xe4821009  ! 773: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r18
	.word 0xcab2204c  ! 774: STHA_I	stha	%r5, [%r8 + 0x004c] %asi
	.word 0x22800004  ! 775: BE	be,a	<label_0x4>
	.word 0x12800004  ! 776: BNE	bne  	<label_0x4>
	.word 0x16800004  ! 777: BGE	bge  	<label_0x4>
	.word 0x10800008  ! 778: BA	ba  	<label_0x8>
	.word 0x0cca0008  ! 779: BRGZ	brgz  ,pt	%8,<label_0xa0008>
	.word 0xfcba2da8  ! 780: STDA_I	stda	%r30, [%r8 + 0x0da8] %asi
	.word 0xc36a29ac  ! 781: PREFETCH_I	prefetch	[%r8 + 0x09ac], #one_read
	.word 0x87220009  ! 783: MULScc_R	mulscc 	%r8, %r9, %r3
	.word 0x83a20929  ! 784: FMULs	fmuls	%f8, %f9, %f1
	.word 0x8a5a0009  ! 785: SMUL_R	smul 	%r8, %r9, %r5
	.word 0xdc1a2320  ! 786: LDD_I	ldd	[%r8 + 0x0320], %r14
	.word 0x8143e064  ! 788: MEMBAR	membar	#LoadStore | #MemIssue | #Sync 
	.word 0x8143e073  ! 789: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside | #MemIssue | #Sync 
	.word 0xca420009  ! 790: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0x9a4a22a0  ! 791: MULX_I	mulx 	%r8, 0x02a0, %r13
	.word 0x8a6a2348  ! 792: UDIVX_I	udivx 	%r8, 0x0348, %r5
	.word 0x8143c000  ! 793: STBAR	stbar
	.word 0xc3f22009  ! 794: CASXA_R	casxa	[%r8]%asi, %r9, %r1
	.word 0x8143c000  ! 795: STBAR	stbar
	.word 0xcafa1009  ! 796: SWAPA_R	swapa	%r5, [%r8 + %r9] 0x80
	.word 0xcea21009  ! 797: STWA_R	stwa	%r7, [%r8 + %r9] 0x80
	.word 0x8e5a0009  ! 798: SMUL_R	smul 	%r8, %r9, %r7
	.word 0xc7220009  ! 799: STF_R	st	%f3, [%r9, %r8]
	.word 0xc36a2b9c  ! 800: PREFETCH_I	prefetch	[%r8 + 0x0b9c], #one_read
	.word 0x87a20929  ! 802: FMULs	fmuls	%f8, %f9, %f3
	.word 0xc6020009  ! 804: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xc7222908  ! 805: STF_I	st	%f3, [0x0908, %r8]
	.word 0xa5a20929  ! 806: FMULs	fmuls	%f8, %f9, %f18
	.word 0xcbf22009  ! 807: CASXA_R	casxa	[%r8]%asi, %r9, %r5
	.word 0xc2a21009  ! 808: STWA_R	stwa	%r1, [%r8 + %r9] 0x80
	.word 0xca0a0009  ! 809: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xe2ca1009  ! 810: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r17
	.word 0xeff22009  ! 812: CASXA_R	casxa	[%r8]%asi, %r9, %r23
	.word 0xab222944  ! 813: MULScc_I	mulscc 	%r8, 0x0944, %r21
	.word 0x26c20004  ! 814: BRLZ	brlz,a,nt	%8,<label_0x20004>
	.word 0xd6921009  ! 815: LDUHA_R	lduha	[%r8, %r9] 0x80, %r11
	.word 0xb8720009  ! 816: UDIV_R	udiv 	%r8, %r9, %r28
	.word 0xc36a2a74  ! 817: PREFETCH_I	prefetch	[%r8 + 0x0a74], #one_read
	.word 0xc6a22248  ! 818: STWA_I	stwa	%r3, [%r8 + 0x0248] %asi
	.word 0xcada1009  ! 819: LDXA_R	ldxa	[%r8, %r9] 0x80, %r5
	.word 0xd84a2dc4  ! 820: LDSB_I	ldsb	[%r8 + 0x0dc4], %r12
	.word 0xf26a2454  ! 821: LDSTUB_I	ldstub	%r25, [%r8 + 0x0454]
	.word 0x8143c000  ! 822: STBAR	stbar
	.word 0xc7220009  ! 823: STF_R	st	%f3, [%r9, %r8]
	.word 0xc88a2db0  ! 824: LDUBA_I	lduba	[%r8, + 0x0db0] %asi, %r4
	.word 0xcdf22009  ! 825: CASXA_R	casxa	[%r8]%asi, %r9, %r6
	.word 0xfaa21009  ! 826: STWA_R	stwa	%r29, [%r8 + %r9] 0x80
	.word 0xc27a0009  ! 827: SWAP_R	swap	%r1, [%r8 + %r9]
	.word 0x14800004  ! 828: BG	bg  	<label_0x4>
	.word 0xc66a2d20  ! 829: LDSTUB_I	ldstub	%r3, [%r8 + 0x0d20]
	.word 0x32800004  ! 830: BNE	bne,a	<label_0x4>
	.word 0xee4a21c8  ! 831: LDSB_I	ldsb	[%r8 + 0x01c8], %r23
	.word 0xc2b21009  ! 832: STHA_R	stha	%r1, [%r8 + %r9] 0x80
	.word 0xec6a0009  ! 833: LDSTUB_R	ldstub	%r22, [%r8 + %r9]
	.word 0xc69228a0  ! 834: LDUHA_I	lduha	[%r8, + 0x08a0] %asi, %r3
	.word 0x8f6a0009  ! 835: SDIVX_R	sdivx	%r8, %r9, %r7
	.word 0xc8da1009  ! 836: LDXA_R	ldxa	[%r8, %r9] 0x80, %r4
	.word 0xc27a26e4  ! 837: SWAP_I	swap	%r1, [%r8 + 0x06e4]
	.word 0xcaca2f84  ! 838: LDSBA_I	ldsba	[%r8, + 0x0f84] %asi, %r5
	.word 0xc6aa28c4  ! 839: STBA_I	stba	%r3, [%r8 + 0x08c4] %asi
	.word 0xc8ba1009  ! 840: STDA_R	stda	%r4, [%r8 + %r9] 0x80
	.word 0xdc422540  ! 841: LDSW_I	ldsw	[%r8 + 0x0540], %r14
	.word 0x89a209a9  ! 842: FDIVs	fdivs	%f8, %f9, %f4
	.word 0x8cfa2ca4  ! 843: SDIVcc_I	sdivcc 	%r8, 0x0ca4, %r6
	.word 0xe0ea2e74  ! 844: LDSTUBA_I	ldstuba	%r16, [%r8 + 0x0e74] %asi
	.word 0xc73a2fb8  ! 845: STDF_I	std	%f3, [0x0fb8, %r8]
	.word 0xecaa1009  ! 846: STBA_R	stba	%r22, [%r8 + %r9] 0x80
	.word 0xee821009  ! 847: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r23
	.word 0xb1222524  ! 848: MULScc_I	mulscc 	%r8, 0x0524, %r24
	.word 0x20800008  ! 849: BN	bn,a	<label_0x8>
	.word 0xcf222b20  ! 850: STF_I	st	%f7, [0x0b20, %r8]
	.word 0x8143e069  ! 851: MEMBAR	membar	#LoadLoad | #StoreStore | #MemIssue | #Sync 
	.word 0xc36a22a8  ! 852: PREFETCH_I	prefetch	[%r8 + 0x02a8], #one_read
	.word 0x8143e01a  ! 853: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside 
	.word 0xe81a0009  ! 854: LDD_R	ldd	[%r8 + %r9], %r20
	.word 0x02800004  ! 855: BE	be  	<label_0x4>
	.word 0x98f226f4  ! 856: UDIVcc_I	udivcc 	%r8, 0x06f4, %r12
	.word 0xc5220009  ! 857: STF_R	st	%f2, [%r9, %r8]
	.word 0xc8520009  ! 858: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0x8da20829  ! 859: FADDs	fadds	%f8, %f9, %f6
	.word 0xb9222b8c  ! 860: MULScc_I	mulscc 	%r8, 0x0b8c, %r28
	.word 0xc41a22f0  ! 861: LDD_I	ldd	[%r8 + 0x02f0], %r2
	.word 0x04800004  ! 862: BLE	ble  	<label_0x4>
	.word 0x8143e05c  ! 863: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0x8143e006  ! 864: MEMBAR	membar	#StoreLoad | #LoadStore 
	.word 0xcf222520  ! 865: STF_I	st	%f7, [0x0520, %r8]
	.word 0xce522294  ! 866: LDSH_I	ldsh	[%r8 + 0x0294], %r7
	.word 0x8143e013  ! 867: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside 
	.word 0xca6a0009  ! 868: LDSTUB_R	ldstub	%r5, [%r8 + %r9]
	.word 0xcc5a0009  ! 869: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0x8143c000  ! 870: STBAR	stbar
	.word 0x8143c000  ! 871: STBAR	stbar
	.word 0xe082297c  ! 872: LDUWA_I	lduwa	[%r8, + 0x097c] %asi, %r16
	.word 0xc36a2d44  ! 873: PREFETCH_I	prefetch	[%r8 + 0x0d44], #one_read
	.word 0x8143e060  ! 874: MEMBAR	membar	#MemIssue | #Sync 
	.word 0x82d20009  ! 876: UMULcc_R	umulcc 	%r8, %r9, %r1
	.word 0xce4a2e20  ! 877: LDSB_I	ldsb	[%r8 + 0x0e20], %r7
	.word 0xcaca1009  ! 878: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r5
	.word 0xccb21009  ! 879: STHA_R	stha	%r6, [%r8 + %r9] 0x80
	.word 0xfeea1009  ! 880: LDSTUBA_R	ldstuba	%r31, [%r8 + %r9] 0x80
	.word 0x8e7228e4  ! 881: UDIV_I	udiv 	%r8, 0x08e4, %r7
	.word 0x9d220009  ! 882: MULScc_R	mulscc 	%r8, %r9, %r14
	.word 0x8143c000  ! 883: STBAR	stbar
	.word 0xcd222bc8  ! 884: STF_I	st	%f6, [0x0bc8, %r8]
	.word 0xc4520009  ! 885: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xafa208a9  ! 886: FSUBs	fsubs	%f8, %f9, %f23
	.word 0xe4ba1009  ! 887: STDA_R	stda	%r18, [%r8 + %r9] 0x80
	.word 0xc3ea2eec  ! 888: PREFETCHA_I	prefetcha	[%r8, + 0x0eec] %asi, #one_read
	.word 0x8143e04e  ! 889: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Sync 
	.word 0xad220009  ! 891: MULScc_R	mulscc 	%r8, %r9, %r22
	.word 0xbc522cfc  ! 892: UMUL_I	umul 	%r8, 0x0cfc, %r30
	.word 0xc4420009  ! 893: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xeeb21009  ! 894: STHA_R	stha	%r23, [%r8 + %r9] 0x80
	.word 0xc8520009  ! 895: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0x8fa20829  ! 896: FADDs	fadds	%f8, %f9, %f7
	.word 0xc6d226a8  ! 897: LDSHA_I	ldsha	[%r8, + 0x06a8] %asi, %r3
	.word 0xec7a0009  ! 898: SWAP_R	swap	%r22, [%r8 + %r9]
	.word 0x844a0009  ! 899: MULX_R	mulx 	%r8, %r9, %r2
	.word 0x9c522a38  ! 900: UMUL_I	umul 	%r8, 0x0a38, %r14
	.word 0xc88a1009  ! 901: LDUBA_R	lduba	[%r8, %r9] 0x80, %r4
	.word 0xf0ba20e0  ! 902: STDA_I	stda	%r24, [%r8 + 0x00e0] %asi
	.word 0x8ad22acc  ! 903: UMULcc_I	umulcc 	%r8, 0x0acc, %r5
	.word 0xc87a2008  ! 904: SWAP_I	swap	%r4, [%r8 + 0x0008]
	.word 0xc36a2594  ! 905: PREFETCH_I	prefetch	[%r8 + 0x0594], #one_read
	.word 0x8c6a2f40  ! 906: UDIVX_I	udivx 	%r8, 0x0f40, %r6
	.word 0xc66a0009  ! 907: LDSTUB_R	ldstub	%r3, [%r8 + %r9]
	.word 0xa6d20009  ! 908: UMULcc_R	umulcc 	%r8, %r9, %r19
	.word 0xd9e21009  ! 909: CASA_I	casa	[%r8] 0x80, %r9, %r12
	.word 0x32800004  ! 910: BNE	bne,a	<label_0x4>
	.word 0x8143e010  ! 911: MEMBAR	membar	#Lookaside 
	.word 0x12800004  ! 912: BNE	bne  	<label_0x4>
	.word 0x867a2634  ! 913: SDIV_I	sdiv 	%r8, 0x0634, %r3
	.word 0xdcba2590  ! 914: STDA_I	stda	%r14, [%r8 + 0x0590] %asi
	.word 0xcc520009  ! 915: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xc49a2ef0  ! 916: LDDA_I	ldda	[%r8, + 0x0ef0] %asi, %r2
	.word 0x8e7a0009  ! 917: SDIV_R	sdiv 	%r8, %r9, %r7
	.word 0x8143e05a  ! 918: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside | #Sync 
	.word 0xc2ea2718  ! 919: LDSTUBA_I	ldstuba	%r1, [%r8 + 0x0718] %asi
	.word 0xcea2225c  ! 920: STWA_I	stwa	%r7, [%r8 + 0x025c] %asi
	.word 0xe5f22009  ! 921: CASXA_R	casxa	[%r8]%asi, %r9, %r18
	.word 0x26ca0004  ! 922: BRLZ	brlz,a,pt	%8,<label_0xa0004>
	.word 0xc36a2900  ! 923: PREFETCH_I	prefetch	[%r8 + 0x0900], #one_read
	.word 0x0ec20004  ! 924: BRGEZ	brgez  ,nt	%8,<label_0x20004>
	.word 0xcc520009  ! 925: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xe0a21009  ! 926: STWA_R	stwa	%r16, [%r8 + %r9] 0x80
	.word 0x8e7a0009  ! 927: SDIV_R	sdiv 	%r8, %r9, %r7
	.word 0xc8fa1009  ! 928: SWAPA_R	swapa	%r4, [%r8 + %r9] 0x80
	.word 0xc4522c24  ! 929: LDSH_I	ldsh	[%r8 + 0x0c24], %r2
	.word 0xfc9a1009  ! 930: LDDA_R	ldda	[%r8, %r9] 0x80, %r30
	.word 0x38800008  ! 931: BGU	bgu,a	<label_0x8>
	.word 0xfa4a0009  ! 932: LDSB_R	ldsb	[%r8 + %r9], %r29
	.word 0x8a520009  ! 933: UMUL_R	umul 	%r8, %r9, %r5
	.word 0xc89a2980  ! 934: LDDA_I	ldda	[%r8, + 0x0980] %asi, %r4
	.word 0x8ba20929  ! 935: FMULs	fmuls	%f8, %f9, %f5
	.word 0xc36a2c7c  ! 936: PREFETCH_I	prefetch	[%r8 + 0x0c7c], #one_read
	.word 0xfeaa1009  ! 937: STBA_R	stba	%r31, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 938: STBAR	stbar
	.word 0xca6a2ab8  ! 939: LDSTUB_I	ldstub	%r5, [%r8 + 0x0ab8]
	.word 0xc86a0009  ! 940: LDSTUB_R	ldstub	%r4, [%r8 + %r9]
	.word 0x86720009  ! 941: UDIV_R	udiv 	%r8, %r9, %r3
	.word 0xc6aa29c4  ! 942: STBA_I	stba	%r3, [%r8 + 0x09c4] %asi
	.word 0xca6a0009  ! 943: LDSTUB_R	ldstub	%r5, [%r8 + %r9]
	.word 0x8143e077  ! 944: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside | #MemIssue | #Sync 
	.word 0x8143c000  ! 945: STBAR	stbar
	.word 0xcc422b98  ! 946: LDSW_I	ldsw	[%r8 + 0x0b98], %r6
	.word 0x82d220dc  ! 947: UMULcc_I	umulcc 	%r8, 0x00dc, %r1
	.word 0xcd220009  ! 948: STF_R	st	%f6, [%r9, %r8]
	.word 0xe6fa2520  ! 949: SWAPA_I	swapa	%r19, [%r8 + 0x0520] %asi
	.word 0x8143e026  ! 950: MEMBAR	membar	#StoreLoad | #LoadStore | #MemIssue 
	.word 0x8ba20829  ! 951: FADDs	fadds	%f8, %f9, %f5
	.word 0xa64a245c  ! 952: MULX_I	mulx 	%r8, 0x045c, %r19
	.word 0xc6420009  ! 953: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xd53a0009  ! 954: STDF_R	std	%f10, [%r9, %r8]
	.word 0xc3ea2970  ! 955: PREFETCHA_I	prefetcha	[%r8, + 0x0970] %asi, #one_read
	.word 0x8143c000  ! 956: STBAR	stbar
	.word 0x87a20929  ! 957: FMULs	fmuls	%f8, %f9, %f3
	.word 0xcc9228d0  ! 958: LDUHA_I	lduha	[%r8, + 0x08d0] %asi, %r6
	.word 0x86f20009  ! 959: UDIVcc_R	udivcc 	%r8, %r9, %r3
	.word 0xf0aa2d44  ! 960: STBA_I	stba	%r24, [%r8 + 0x0d44] %asi
	.word 0xfc1a0009  ! 961: LDD_R	ldd	[%r8 + %r9], %r30
	.word 0x83a209a9  ! 962: FDIVs	fdivs	%f8, %f9, %f1
	.word 0x836a2340  ! 963: SDIVX_I	sdivx	%r8, 0x0340, %r1
	.word 0x88720009  ! 964: UDIV_R	udiv 	%r8, %r9, %r4
	.word 0xe2aa1009  ! 965: STBA_R	stba	%r17, [%r8 + %r9] 0x80
	.word 0xc53a23d0  ! 966: STDF_I	std	%f2, [0x03d0, %r8]
	.word 0xc33a0009  ! 967: STDF_R	std	%f1, [%r9, %r8]
	.word 0xec9a1009  ! 968: LDDA_R	ldda	[%r8, %r9] 0x80, %r22
	.word 0x88da0009  ! 969: SMULcc_R	smulcc 	%r8, %r9, %r4
	.word 0xcc1a0009  ! 970: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0x2aca0004  ! 971: BRNZ	brnz,a,pt	%8,<label_0xa0004>
	.word 0xc65a0009  ! 972: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xc27a247c  ! 973: SWAP_I	swap	%r1, [%r8 + 0x047c]
	.word 0xccfa2198  ! 974: SWAPA_I	swapa	%r6, [%r8 + 0x0198] %asi
	.word 0x88f2220c  ! 975: UDIVcc_I	udivcc 	%r8, 0x020c, %r4
	.word 0x87a20929  ! 976: FMULs	fmuls	%f8, %f9, %f3
	.word 0xb6520009  ! 977: UMUL_R	umul 	%r8, %r9, %r27
	.word 0xf65a2d78  ! 978: LDX_I	ldx	[%r8 + 0x0d78], %r27
	.word 0xc3ea2710  ! 979: PREFETCHA_I	prefetcha	[%r8, + 0x0710] %asi, #one_read
	.word 0xc64221f0  ! 980: LDSW_I	ldsw	[%r8 + 0x01f0], %r3
	.word 0x887a2424  ! 981: SDIV_I	sdiv 	%r8, 0x0424, %r4
	.word 0xbfa20929  ! 982: FMULs	fmuls	%f8, %f9, %f31
	.word 0x8a7a0009  ! 983: SDIV_R	sdiv 	%r8, %r9, %r5
	.word 0xcea22f48  ! 984: STWA_I	stwa	%r7, [%r8 + 0x0f48] %asi
	.word 0xb6722940  ! 985: UDIV_I	udiv 	%r8, 0x0940, %r27
	.word 0xc4ba2b80  ! 986: STDA_I	stda	%r2, [%r8 + 0x0b80] %asi
	.word 0x8143e074  ! 987: MEMBAR	membar	#LoadStore | #Lookaside | #MemIssue | #Sync 
	.word 0x22ca0004  ! 988: BRZ	brz,a,pt	%8,<label_0xa0004>
	.word 0xf13a0009  ! 989: STDF_R	std	%f24, [%r9, %r8]
	.word 0xcf3a27d8  ! 990: STDF_I	std	%f7, [0x07d8, %r8]
	.word 0x10800008  ! 991: BA	ba  	<label_0x8>
	.word 0x827a2158  ! 992: SDIV_I	sdiv 	%r8, 0x0158, %r1
	.word 0x0e800004  ! 993: BVS	bvs  	<label_0x4>
	.word 0xcbe22009  ! 994: CASA_R	casa	[%r8] %asi, %r9, %r5
	.word 0x8143e053  ! 995: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside | #Sync 
	.word 0xc6522c78  ! 996: LDSH_I	ldsh	[%r8 + 0x0c78], %r3
	.word 0x08800004  ! 997: BLEU	bleu  	<label_0x4>
	.word 0xc3ea2bb0  ! 998: PREFETCHA_I	prefetcha	[%r8, + 0x0bb0] %asi, #one_read
	.word 0xecaa2504  ! 999: STBA_I	stba	%r22, [%r8 + 0x0504] %asi
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
        setx  0x27bc08ff0498a67a, %g1, %r0
        setx  0x1a82c08f9487aba4, %g1, %r1
        setx  0x719bf7997150e07f, %g1, %r2
        setx  0x492e9af8df2d5c96, %g1, %r3
        setx  0xa13b11e678a7269a, %g1, %r4
        setx  0x3f77a6e5a02265e0, %g1, %r5
        setx  0x5ee3211a5341ba28, %g1, %r6
        setx  0x322a62be19914373, %g1, %r7
        setx  0xed0d6d330287e0e1, %g1, %r10
        setx  0x5d564d6899a23479, %g1, %r11
        setx  0xe23c95049e5dd7cd, %g1, %r12
        setx  0x1a31476faa6acb13, %g1, %r13
        setx  0x309bb43237b21323, %g1, %r14
        setx  0xcff6ef5ddf5b248d, %g1, %r15
        setx  0x6bd756443b39b461, %g1, %r16
        setx  0x257442ae91f56c94, %g1, %r17
        setx  0x339554e4817226be, %g1, %r18
        setx  0x91b9a16645bac5dc, %g1, %r19
        setx  0xddb9381db43f07f8, %g1, %r20
        setx  0x680553e6abb79193, %g1, %r21
        setx  0x267867df6c22af41, %g1, %r22
        setx  0xd5216cb74d7ee01b, %g1, %r23
        setx  0x5a36ea2b7f01dd46, %g1, %r24
        setx  0x003d8e282ff2386b, %g1, %r25
        setx  0x6ce292695465e72e, %g1, %r26
        setx  0x5ad54d9d86f99960, %g1, %r27
        setx  0xe8090556f371f91c, %g1, %r28
        setx  0xef11dae943e6f512, %g1, %r29
        setx  0x6ee4e0390970e0cd, %g1, %r30
        setx  0x744b06ee326b49bf, %g1, %r31
	.word 0x83a20829  ! 5: FADDs	fadds	%f8, %f9, %f1
	.word 0x83220009  ! 6: MULScc_R	mulscc 	%r8, %r9, %r1
	.word 0xc4520009  ! 7: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0x8143c000  ! 8: STBAR	stbar
	.word 0xc3e22009  ! 9: CASA_R	casa	[%r8] %asi, %r9, %r1
	.word 0x845a0009  ! 10: SMUL_R	smul 	%r8, %r9, %r2
	.word 0x28800008  ! 11: BLEU	bleu,a	<label_0x8>
	.word 0xd6ca2b38  ! 12: LDSBA_I	ldsba	[%r8, + 0x0b38] %asi, %r11
	.word 0xcf222028  ! 13: STF_I	st	%f7, [0x0028, %r8]
	.word 0xd6aa1009  ! 14: STBA_R	stba	%r11, [%r8 + %r9] 0x80
	.word 0xc5f22009  ! 15: CASXA_R	casxa	[%r8]%asi, %r9, %r2
	.word 0x2aca0004  ! 16: BRNZ	brnz,a,pt	%8,<label_0xa0004>
	.word 0x36800008  ! 17: BGE	bge,a	<label_0x8>
	.word 0x96f224ec  ! 18: UDIVcc_I	udivcc 	%r8, 0x04ec, %r11
	.word 0x89220009  ! 19: MULScc_R	mulscc 	%r8, %r9, %r4
	.word 0xfbf21009  ! 20: CASXA_I	casxa	[%r8] 0x80, %r9, %r29
	.word 0xe4aa1009  ! 21: STBA_R	stba	%r18, [%r8 + %r9] 0x80
	.word 0xc3ea2914  ! 22: PREFETCHA_I	prefetcha	[%r8, + 0x0914] %asi, #one_read
	.word 0x1c800004  ! 23: BPOS	bpos  	<label_0x4>
	.word 0xc3f21009  ! 24: CASXA_I	casxa	[%r8] 0x80, %r9, %r1
	.word 0xb3a20829  ! 25: FADDs	fadds	%f8, %f9, %f25
	.word 0xc41221cc  ! 26: LDUH_I	lduh	[%r8 + 0x01cc], %r2
	.word 0xc4a2276c  ! 27: STWA_I	stwa	%r2, [%r8 + 0x076c] %asi
	.word 0xebe22009  ! 28: CASA_R	casa	[%r8] %asi, %r9, %r21
	.word 0xc5e21009  ! 29: CASA_I	casa	[%r8] 0x80, %r9, %r2
	.word 0x8a6a0009  ! 30: UDIVX_R	udivx 	%r8, %r9, %r5
	.word 0xb36a2b90  ! 31: SDIVX_I	sdivx	%r8, 0x0b90, %r25
	.word 0x02c20008  ! 32: BRZ	brz  ,nt	%8,<label_0x20008>
	.word 0xe2da1009  ! 33: LDXA_R	ldxa	[%r8, %r9] 0x80, %r17
	.word 0xcf222f6c  ! 34: STF_I	st	%f7, [0x0f6c, %r8]
	.word 0x3e800004  ! 35: BVC	bvc,a	<label_0x4>
	.word 0xa66a0009  ! 36: UDIVX_R	udivx 	%r8, %r9, %r19
	.word 0x8143e037  ! 37: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside | #MemIssue 
	.word 0xccea1009  ! 38: LDSTUBA_R	ldstuba	%r6, [%r8 + %r9] 0x80
	.word 0xdc6a0009  ! 39: LDSTUB_R	ldstub	%r14, [%r8 + %r9]
	.word 0x84522e24  ! 40: UMUL_I	umul 	%r8, 0x0e24, %r2
	.word 0xc3ea28c0  ! 41: PREFETCHA_I	prefetcha	[%r8, + 0x08c0] %asi, #one_read
	.word 0x28800004  ! 42: BLEU	bleu,a	<label_0x4>
	.word 0xc26a2294  ! 43: LDSTUB_I	ldstub	%r1, [%r8 + 0x0294]
	.word 0xceb22ee8  ! 44: STHA_I	stha	%r7, [%r8 + 0x0ee8] %asi
	.word 0x8ad22c64  ! 45: UMULcc_I	umulcc 	%r8, 0x0c64, %r5
	.word 0x8143c000  ! 46: STBAR	stbar
	.word 0xdc02236c  ! 47: LDUW_I	lduw	[%r8 + 0x036c], %r14
	.word 0xeb3a2a28  ! 48: STDF_I	std	%f21, [0x0a28, %r8]
	.word 0xc6022dc4  ! 49: LDUW_I	lduw	[%r8 + 0x0dc4], %r3
	.word 0xca7a0009  ! 51: SWAP_R	swap	%r5, [%r8 + %r9]
	.word 0x8143c000  ! 52: STBAR	stbar
	.word 0xdd222f98  ! 53: STF_I	st	%f14, [0x0f98, %r8]
	.word 0xcc4a0009  ! 54: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0x8ad22310  ! 55: UMULcc_I	umulcc 	%r8, 0x0310, %r5
	.word 0xc36a2504  ! 56: PREFETCH_I	prefetch	[%r8 + 0x0504], #one_read
	.word 0xb06a2c44  ! 57: UDIVX_I	udivx 	%r8, 0x0c44, %r24
	.word 0xd8ca2264  ! 58: LDSBA_I	ldsba	[%r8, + 0x0264] %asi, %r12
	.word 0xcc5a2188  ! 59: LDX_I	ldx	[%r8 + 0x0188], %r6
	.word 0xc2b21009  ! 61: STHA_R	stha	%r1, [%r8 + %r9] 0x80
	.word 0x06ca0004  ! 62: BRLZ	brlz  ,pt	%8,<label_0xa0004>
	.word 0x8ad20009  ! 63: UMULcc_R	umulcc 	%r8, %r9, %r5
	.word 0x8fa20929  ! 64: FMULs	fmuls	%f8, %f9, %f7
	.word 0xcf2221e4  ! 65: STF_I	st	%f7, [0x01e4, %r8]
	.word 0x8fa208a9  ! 66: FSUBs	fsubs	%f8, %f9, %f7
	.word 0x83222864  ! 67: MULScc_I	mulscc 	%r8, 0x0864, %r1
	.word 0x22800004  ! 68: BE	be,a	<label_0x4>
	.word 0x85a20829  ! 69: FADDs	fadds	%f8, %f9, %f2
	.word 0x83222264  ! 70: MULScc_I	mulscc 	%r8, 0x0264, %r1
	.word 0xc2ea1009  ! 71: LDSTUBA_R	ldstuba	%r1, [%r8 + %r9] 0x80
	.word 0xfe7a0009  ! 72: SWAP_R	swap	%r31, [%r8 + %r9]
	.word 0x8fa20929  ! 73: FMULs	fmuls	%f8, %f9, %f7
	.word 0xea6a287c  ! 74: LDSTUB_I	ldstub	%r21, [%r8 + 0x087c]
	.word 0xc87a0009  ! 75: SWAP_R	swap	%r4, [%r8 + %r9]
	.word 0x825a24e0  ! 76: SMUL_I	smul 	%r8, 0x04e0, %r1
	.word 0x8fa209a9  ! 77: FDIVs	fdivs	%f8, %f9, %f7
	.word 0xc5e22009  ! 78: CASA_R	casa	[%r8] %asi, %r9, %r2
	.word 0x876a2a24  ! 79: SDIVX_I	sdivx	%r8, 0x0a24, %r3
	.word 0xe81a2558  ! 80: LDD_I	ldd	[%r8 + 0x0558], %r20
	.word 0x8e5a0009  ! 81: SMUL_R	smul 	%r8, %r9, %r7
	.word 0x40000008  ! 82: CALL	call	disp30_8
	.word 0x886a0009  ! 83: UDIVX_R	udivx 	%r8, %r9, %r4
	.word 0x82f20009  ! 84: UDIVcc_R	udivcc 	%r8, %r9, %r1
	.word 0xc6921009  ! 85: LDUHA_R	lduha	[%r8, %r9] 0x80, %r3
	.word 0xc36a2fcc  ! 86: PREFETCH_I	prefetch	[%r8 + 0x0fcc], #one_read
	.word 0xcbf21009  ! 87: CASXA_I	casxa	[%r8] 0x80, %r9, %r5
	.word 0xc86a2d14  ! 88: LDSTUB_I	ldstub	%r4, [%r8 + 0x0d14]
	.word 0xccaa1009  ! 89: STBA_R	stba	%r6, [%r8 + %r9] 0x80
	.word 0x865a0009  ! 90: SMUL_R	smul 	%r8, %r9, %r3
	.word 0x8143e013  ! 91: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside 
	.word 0xab6a0009  ! 92: SDIVX_R	sdivx	%r8, %r9, %r21
	.word 0xcc5a2b68  ! 93: LDX_I	ldx	[%r8 + 0x0b68], %r6
	.word 0x8a4a0009  ! 94: MULX_R	mulx 	%r8, %r9, %r5
	.word 0xc8a22c10  ! 96: STWA_I	stwa	%r4, [%r8 + 0x0c10] %asi
	.word 0x825a2714  ! 98: SMUL_I	smul 	%r8, 0x0714, %r1
	.word 0x8fa209a9  ! 99: FDIVs	fdivs	%f8, %f9, %f7
	.word 0xd68a29cc  ! 100: LDUBA_I	lduba	[%r8, + 0x09cc] %asi, %r11
	.word 0xeed22660  ! 101: LDSHA_I	ldsha	[%r8, + 0x0660] %asi, %r23
	.word 0xc80a0009  ! 102: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xa4d22e28  ! 103: UMULcc_I	umulcc 	%r8, 0x0e28, %r18
	.word 0xac6a20c0  ! 104: UDIVX_I	udivx 	%r8, 0x00c0, %r22
	.word 0x8c722a84  ! 105: UDIV_I	udiv 	%r8, 0x0a84, %r6
	.word 0xcaca2f78  ! 106: LDSBA_I	ldsba	[%r8, + 0x0f78] %asi, %r5
	.word 0x896a2760  ! 107: SDIVX_I	sdivx	%r8, 0x0760, %r4
	.word 0x866a0009  ! 108: UDIVX_R	udivx 	%r8, %r9, %r3
	.word 0x0a800004  ! 109: BCS	bcs  	<label_0x4>
	.word 0x8e5a0009  ! 110: SMUL_R	smul 	%r8, %r9, %r7
	.word 0xc4d21009  ! 111: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r2
	.word 0xc8ba1009  ! 112: STDA_R	stda	%r4, [%r8 + %r9] 0x80
	.word 0x08800004  ! 113: BLEU	bleu  	<label_0x4>
	.word 0x8143e061  ! 114: MEMBAR	membar	#LoadLoad | #MemIssue | #Sync 
	.word 0xc3f22009  ! 115: CASXA_R	casxa	[%r8]%asi, %r9, %r1
	.word 0xe7f22009  ! 116: CASXA_R	casxa	[%r8]%asi, %r9, %r19
	.word 0xe8a21009  ! 117: STWA_R	stwa	%r20, [%r8 + %r9] 0x80
	.word 0x967a0009  ! 118: SDIV_R	sdiv 	%r8, %r9, %r11
	.word 0x8143e017  ! 119: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside 
	.word 0xc8da2228  ! 120: LDXA_I	ldxa	[%r8, + 0x0228] %asi, %r4
	.word 0xc3ea2788  ! 121: PREFETCHA_I	prefetcha	[%r8, + 0x0788] %asi, #one_read
	.word 0x3c800008  ! 122: BPOS	bpos,a	<label_0x8>
	.word 0xce520009  ! 123: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xc682252c  ! 124: LDUWA_I	lduwa	[%r8, + 0x052c] %asi, %r3
	.word 0x8143c000  ! 125: STBAR	stbar
	.word 0x8e5a21a0  ! 126: SMUL_I	smul 	%r8, 0x01a0, %r7
	.word 0xe06a2654  ! 127: LDSTUB_I	ldstub	%r16, [%r8 + 0x0654]
	.word 0x3e800004  ! 129: BVC	bvc,a	<label_0x4>
	.word 0xcca22678  ! 130: STWA_I	stwa	%r6, [%r8 + 0x0678] %asi
	.word 0xba6a2b84  ! 134: UDIVX_I	udivx 	%r8, 0x0b84, %r29
	.word 0xc80a2ae0  ! 135: LDUB_I	ldub	[%r8 + 0x0ae0], %r4
	.word 0xca020009  ! 136: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xcaf21009  ! 137: STXA_R	stxa	%r5, [%r8 + %r9] 0x80
	.word 0xd87a0009  ! 138: SWAP_R	swap	%r12, [%r8 + %r9]
	.word 0x8fa20829  ! 139: FADDs	fadds	%f8, %f9, %f7
	.word 0xccda2170  ! 140: LDXA_I	ldxa	[%r8, + 0x0170] %asi, %r6
	.word 0xa0d222d8  ! 141: UMULcc_I	umulcc 	%r8, 0x02d8, %r16
	.word 0x8143e020  ! 142: MEMBAR	membar	#MemIssue 
	.word 0x06800004  ! 143: BL	bl  	<label_0x4>
	.word 0xc3ea2ddc  ! 144: PREFETCHA_I	prefetcha	[%r8, + 0x0ddc] %asi, #one_read
	.word 0x08800008  ! 145: BLEU	bleu  	<label_0x8>
	.word 0xbc720009  ! 146: UDIV_R	udiv 	%r8, %r9, %r30
	.word 0x8143c000  ! 147: STBAR	stbar
	.word 0x8af22f78  ! 148: UDIVcc_I	udivcc 	%r8, 0x0f78, %r5
	.word 0x8da209a9  ! 149: FDIVs	fdivs	%f8, %f9, %f6
	.word 0xceaa26dc  ! 150: STBA_I	stba	%r7, [%r8 + 0x06dc] %asi
	.word 0xc3f21009  ! 151: CASXA_I	casxa	[%r8] 0x80, %r9, %r1
	.word 0xca0a2ffc  ! 152: LDUB_I	ldub	[%r8 + 0x0ffc], %r5
	.word 0x8b6a0009  ! 153: SDIVX_R	sdivx	%r8, %r9, %r5
	.word 0xc9f22009  ! 154: CASXA_R	casxa	[%r8]%asi, %r9, %r4
	.word 0x8d220009  ! 155: MULScc_R	mulscc 	%r8, %r9, %r6
	.word 0xc36a2558  ! 156: PREFETCH_I	prefetch	[%r8 + 0x0558], #one_read
	.word 0x88da22bc  ! 157: SMULcc_I	smulcc 	%r8, 0x02bc, %r4
	.word 0x20800004  ! 158: BN	bn,a	<label_0x4>
	.word 0xcf3a0009  ! 159: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc93a2068  ! 160: STDF_I	std	%f4, [0x0068, %r8]
	.word 0xc40a2ba8  ! 161: LDUB_I	ldub	[%r8 + 0x0ba8], %r2
	.word 0x8da208a9  ! 162: FSUBs	fsubs	%f8, %f9, %f6
	.word 0xdcb21009  ! 163: STHA_R	stha	%r14, [%r8 + %r9] 0x80
	.word 0x8143e029  ! 164: MEMBAR	membar	#LoadLoad | #StoreStore | #MemIssue 
	.word 0xc6fa1009  ! 165: SWAPA_R	swapa	%r3, [%r8 + %r9] 0x80
	.word 0xcf3a26b8  ! 166: STDF_I	std	%f7, [0x06b8, %r8]
	.word 0xf2522248  ! 167: LDSH_I	ldsh	[%r8 + 0x0248], %r25
	.word 0x824a0009  ! 168: MULX_R	mulx 	%r8, %r9, %r1
	.word 0xc9220009  ! 169: STF_R	st	%f4, [%r9, %r8]
	.word 0xc3ea2cf8  ! 170: PREFETCHA_I	prefetcha	[%r8, + 0x0cf8] %asi, #one_read
	.word 0x3a800004  ! 171: BCC	bcc,a	<label_0x4>
	.word 0xd41a2718  ! 173: LDD_I	ldd	[%r8 + 0x0718], %r10
	.word 0xc6a22008  ! 174: STWA_I	stwa	%r3, [%r8 + 0x0008] %asi
	.word 0x38800004  ! 175: BGU	bgu,a	<label_0x4>
	.word 0xc49a1009  ! 176: LDDA_R	ldda	[%r8, %r9] 0x80, %r2
	.word 0x84f22b68  ! 177: UDIVcc_I	udivcc 	%r8, 0x0b68, %r2
	.word 0xeaa21009  ! 179: STWA_R	stwa	%r21, [%r8 + %r9] 0x80
	.word 0x8143e06b  ! 180: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #MemIssue | #Sync 
	.word 0xc20a2e2c  ! 181: LDUB_I	ldub	[%r8 + 0x0e2c], %r1
	.word 0x8143e06a  ! 182: MEMBAR	membar	#StoreLoad | #StoreStore | #MemIssue | #Sync 
	.word 0x8143c000  ! 183: STBAR	stbar
	.word 0xc93a0009  ! 184: STDF_R	std	%f4, [%r9, %r8]
	.word 0xccba2368  ! 185: STDA_I	stda	%r6, [%r8 + 0x0368] %asi
	.word 0xe01a2e18  ! 186: LDD_I	ldd	[%r8 + 0x0e18], %r16
	.word 0xe9f22009  ! 187: CASXA_R	casxa	[%r8]%asi, %r9, %r20
	.word 0x8143e040  ! 188: MEMBAR	membar	#Sync 
	.word 0x9d220009  ! 189: MULScc_R	mulscc 	%r8, %r9, %r14
	.word 0xc36a2758  ! 190: PREFETCH_I	prefetch	[%r8 + 0x0758], #one_read
	.word 0x16800004  ! 191: BGE	bge  	<label_0x4>
	.word 0xcaca2d4c  ! 192: LDSBA_I	ldsba	[%r8, + 0x0d4c] %asi, %r5
	.word 0xc9f22009  ! 193: CASXA_R	casxa	[%r8]%asi, %r9, %r4
	.word 0x84722ec4  ! 195: UDIV_I	udiv 	%r8, 0x0ec4, %r2
	.word 0xc33a0009  ! 196: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc4120009  ! 197: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0x40000008  ! 198: CALL	call	disp30_8
	.word 0x8b6a2e80  ! 199: SDIVX_I	sdivx	%r8, 0x0e80, %r5
	.word 0xc4aa2ab4  ! 200: STBA_I	stba	%r2, [%r8 + 0x0ab4] %asi
	.word 0x0e800004  ! 201: BVS	bvs  	<label_0x4>
	.word 0xc2f22be0  ! 202: STXA_I	stxa	%r1, [%r8 + 0x0be0] %asi
	.word 0xae4a0009  ! 203: MULX_R	mulx 	%r8, %r9, %r23
	.word 0xc85224d8  ! 204: LDSH_I	ldsh	[%r8 + 0x04d8], %r4
	.word 0x8da208a9  ! 205: FSUBs	fsubs	%f8, %f9, %f6
	.word 0xc6aa1009  ! 206: STBA_R	stba	%r3, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 207: STBAR	stbar
	.word 0xc87a21dc  ! 208: SWAP_I	swap	%r4, [%r8 + 0x01dc]
	.word 0x1e800004  ! 209: BVC	bvc  	<label_0x4>
	.word 0x864a21f4  ! 210: MULX_I	mulx 	%r8, 0x01f4, %r3
	.word 0x28800004  ! 211: BLEU	bleu,a	<label_0x4>
	.word 0x0eca0008  ! 212: BRGEZ	brgez  ,pt	%8,<label_0xa0008>
	.word 0xe8122ba8  ! 213: LDUH_I	lduh	[%r8 + 0x0ba8], %r20
	.word 0x8143e03d  ! 214: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0x8ef20009  ! 215: UDIVcc_R	udivcc 	%r8, %r9, %r7
	.word 0xc9e22009  ! 216: CASA_R	casa	[%r8] %asi, %r9, %r4
	.word 0x2cc20008  ! 217: BRGZ	brgz,a,nt	%8,<label_0x20008>
	.word 0x8a6a0009  ! 218: UDIVX_R	udivx 	%r8, %r9, %r5
	.word 0xa8d20009  ! 219: UMULcc_R	umulcc 	%r8, %r9, %r20
	.word 0x827a289c  ! 220: SDIV_I	sdiv 	%r8, 0x089c, %r1
	.word 0xc3ea27fc  ! 221: PREFETCHA_I	prefetcha	[%r8, + 0x07fc] %asi, #one_read
	.word 0x844a0009  ! 222: MULX_R	mulx 	%r8, %r9, %r2
	.word 0xf2fa1009  ! 223: SWAPA_R	swapa	%r25, [%r8 + %r9] 0x80
	.word 0x8143e02e  ! 224: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #MemIssue 
	.word 0x8143e06b  ! 225: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #MemIssue | #Sync 
	.word 0xc73a2608  ! 226: STDF_I	std	%f3, [0x0608, %r8]
	.word 0xcbe21009  ! 227: CASA_I	casa	[%r8] 0x80, %r9, %r5
	.word 0x24ca0008  ! 228: BRLEZ	brlez,a,pt	%8,<label_0xa0008>
	.word 0xf09a1009  ! 229: LDDA_R	ldda	[%r8, %r9] 0x80, %r24
	.word 0xc5e22009  ! 230: CASA_R	casa	[%r8] %asi, %r9, %r2
	.word 0x976a22c8  ! 232: SDIVX_I	sdivx	%r8, 0x02c8, %r11
	.word 0xe84a2484  ! 235: LDSB_I	ldsb	[%r8 + 0x0484], %r20
	.word 0x96520009  ! 236: UMUL_R	umul 	%r8, %r9, %r11
	.word 0x8a520009  ! 237: UMUL_R	umul 	%r8, %r9, %r5
	.word 0xc36a2eec  ! 238: PREFETCH_I	prefetch	[%r8 + 0x0eec], #one_read
	.word 0x8143e040  ! 239: MEMBAR	membar	#Sync 
	.word 0xcfe22009  ! 240: CASA_R	casa	[%r8] %asi, %r9, %r7
	.word 0xc8f21009  ! 241: STXA_R	stxa	%r4, [%r8 + %r9] 0x80
	.word 0xecba2ba8  ! 243: STDA_I	stda	%r22, [%r8 + 0x0ba8] %asi
	.word 0x8c6a270c  ! 244: UDIVX_I	udivx 	%r8, 0x070c, %r6
	.word 0x40000004  ! 245: CALL	call	disp30_4
	.word 0xcb222e90  ! 246: STF_I	st	%f5, [0x0e90, %r8]
	.word 0x846a24a0  ! 247: UDIVX_I	udivx 	%r8, 0x04a0, %r2
	.word 0xe4522dcc  ! 248: LDSH_I	ldsh	[%r8 + 0x0dcc], %r18
	.word 0x89a208a9  ! 249: FSUBs	fsubs	%f8, %f9, %f4
	.word 0x8143e01d  ! 250: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside 
	.word 0x86fa0009  ! 251: SDIVcc_R	sdivcc 	%r8, %r9, %r3
	.word 0x865a0009  ! 252: SMUL_R	smul 	%r8, %r9, %r3
	.word 0xc33a0009  ! 253: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc84a0009  ! 254: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xcaca28a4  ! 255: LDSBA_I	ldsba	[%r8, + 0x08a4] %asi, %r5
	.word 0xc3ea2510  ! 256: PREFETCHA_I	prefetcha	[%r8, + 0x0510] %asi, #one_read
	.word 0xec9a1009  ! 257: LDDA_R	ldda	[%r8, %r9] 0x80, %r22
	.word 0xc4b220a8  ! 258: STHA_I	stha	%r2, [%r8 + 0x00a8] %asi
	.word 0xc53a2768  ! 259: STDF_I	std	%f2, [0x0768, %r8]
	.word 0xcf3a22e0  ! 260: STDF_I	std	%f7, [0x02e0, %r8]
	.word 0x8143e04d  ! 261: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Sync 
	.word 0xbc5a22cc  ! 262: SMUL_I	smul 	%r8, 0x02cc, %r30
	.word 0xdcb21009  ! 263: STHA_R	stha	%r14, [%r8 + %r9] 0x80
	.word 0x00800004  ! 264: BN	bn  	<label_0x4>
	.word 0xfeaa2ab4  ! 265: STBA_I	stba	%r31, [%r8 + 0x0ab4] %asi
	.word 0x1e800008  ! 267: BVC	bvc  	<label_0x8>
	.word 0xc2921009  ! 268: LDUHA_R	lduha	[%r8, %r9] 0x80, %r1
	.word 0x8da20829  ! 269: FADDs	fadds	%f8, %f9, %f6
	.word 0x8b220009  ! 270: MULScc_R	mulscc 	%r8, %r9, %r5
	.word 0xe8ba1009  ! 271: STDA_R	stda	%r20, [%r8 + %r9] 0x80
	.word 0x10800004  ! 272: BA	ba  	<label_0x4>
	.word 0xaef226ac  ! 273: UDIVcc_I	udivcc 	%r8, 0x06ac, %r23
	.word 0xcaa21009  ! 274: STWA_R	stwa	%r5, [%r8 + %r9] 0x80
	.word 0x8ad20009  ! 275: UMULcc_R	umulcc 	%r8, %r9, %r5
	.word 0xc9222204  ! 276: STF_I	st	%f4, [0x0204, %r8]
	.word 0xe1e22009  ! 277: CASA_R	casa	[%r8] %asi, %r9, %r16
	.word 0xce4a0009  ! 278: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xc5f22009  ! 279: CASXA_R	casxa	[%r8]%asi, %r9, %r2
	.word 0xef220009  ! 280: STF_R	st	%f23, [%r9, %r8]
	.word 0xc3ea2428  ! 281: PREFETCHA_I	prefetcha	[%r8, + 0x0428] %asi, #one_read
	.word 0xf69229d8  ! 282: LDUHA_I	lduha	[%r8, + 0x09d8] %asi, %r27
	.word 0x84f20009  ! 283: UDIVcc_R	udivcc 	%r8, %r9, %r2
	.word 0xc49a2288  ! 284: LDDA_I	ldda	[%r8, + 0x0288] %asi, %r2
	.word 0xdef21009  ! 285: STXA_R	stxa	%r15, [%r8 + %r9] 0x80
	.word 0x8fa209a9  ! 288: FDIVs	fdivs	%f8, %f9, %f7
	.word 0x856a0009  ! 290: SDIVX_R	sdivx	%r8, %r9, %r2
	.word 0xc40a2d30  ! 291: LDUB_I	ldub	[%r8 + 0x0d30], %r2
	.word 0xc6da2378  ! 292: LDXA_I	ldxa	[%r8, + 0x0378] %asi, %r3
	.word 0xda5a0009  ! 293: LDX_R	ldx	[%r8 + %r9], %r13
	.word 0xc7f22009  ! 294: CASXA_R	casxa	[%r8]%asi, %r9, %r3
	.word 0x9b6a2cc0  ! 295: SDIVX_I	sdivx	%r8, 0x0cc0, %r13
	.word 0x8143e069  ! 296: MEMBAR	membar	#LoadLoad | #StoreStore | #MemIssue | #Sync 
	.word 0xc36a2a30  ! 297: PREFETCH_I	prefetch	[%r8 + 0x0a30], #one_read
	.word 0x82d22738  ! 298: UMULcc_I	umulcc 	%r8, 0x0738, %r1
	.word 0xf7e21009  ! 299: CASA_I	casa	[%r8] 0x80, %r9, %r27
	.word 0x8143c000  ! 300: STBAR	stbar
	.word 0xe4821009  ! 301: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r18
	.word 0xce8a1009  ! 302: LDUBA_R	lduba	[%r8, %r9] 0x80, %r7
	.word 0x8ba208a9  ! 304: FSUBs	fsubs	%f8, %f9, %f5
	.word 0x886a0009  ! 305: UDIVX_R	udivx 	%r8, %r9, %r4
	.word 0x82722a18  ! 306: UDIV_I	udiv 	%r8, 0x0a18, %r1
	.word 0xcab21009  ! 307: STHA_R	stha	%r5, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 308: STBAR	stbar
	.word 0xf89a1009  ! 309: LDDA_R	ldda	[%r8, %r9] 0x80, %r28
	.word 0x846a0009  ! 310: UDIVX_R	udivx 	%r8, %r9, %r2
	.word 0xacd226a4  ! 311: UMULcc_I	umulcc 	%r8, 0x06a4, %r22
	.word 0xc3ea22c0  ! 312: PREFETCHA_I	prefetcha	[%r8, + 0x02c0] %asi, #one_read
	.word 0xc84a0009  ! 313: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xcd2229b8  ! 314: STF_I	st	%f6, [0x09b8, %r8]
	.word 0xc8ca1009  ! 315: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r4
	.word 0xc5f21009  ! 317: CASXA_I	casxa	[%r8] 0x80, %r9, %r2
	.word 0x84d20009  ! 318: UMULcc_R	umulcc 	%r8, %r9, %r2
	.word 0xe81a0009  ! 319: LDD_R	ldd	[%r8 + %r9], %r20
	.word 0xa65a0009  ! 321: SMUL_R	smul 	%r8, %r9, %r19
	.word 0x1e800008  ! 322: BVC	bvc  	<label_0x8>
	.word 0xc9e21009  ! 323: CASA_I	casa	[%r8] 0x80, %r9, %r4
	.word 0xccca1009  ! 324: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r6
	.word 0x8143c000  ! 327: STBAR	stbar
	.word 0xc36a2f04  ! 328: PREFETCH_I	prefetch	[%r8 + 0x0f04], #one_read
	.word 0xe5e21009  ! 329: CASA_I	casa	[%r8] 0x80, %r9, %r18
	.word 0xcaaa1009  ! 330: STBA_R	stba	%r5, [%r8 + %r9] 0x80
	.word 0xcc9a1009  ! 331: LDDA_R	ldda	[%r8, %r9] 0x80, %r6
	.word 0xccda2570  ! 332: LDXA_I	ldxa	[%r8, + 0x0570] %asi, %r6
	.word 0x22ca0004  ! 333: BRZ	brz,a,pt	%8,<label_0xa0004>
	.word 0xcc0a0009  ! 334: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xecba1009  ! 335: STDA_R	stda	%r22, [%r8 + %r9] 0x80
	.word 0x36800008  ! 336: BGE	bge,a	<label_0x8>
	.word 0xc8420009  ! 337: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xe33a2ea8  ! 338: STDF_I	std	%f17, [0x0ea8, %r8]
	.word 0x886a0009  ! 339: UDIVX_R	udivx 	%r8, %r9, %r4
	.word 0x8ba20929  ! 340: FMULs	fmuls	%f8, %f9, %f5
	.word 0x8d6a21e4  ! 341: SDIVX_I	sdivx	%r8, 0x01e4, %r6
	.word 0x826a0009  ! 342: UDIVX_R	udivx 	%r8, %r9, %r1
	.word 0xcada1009  ! 343: LDXA_R	ldxa	[%r8, %r9] 0x80, %r5
	.word 0xc73a2bb8  ! 344: STDF_I	std	%f3, [0x0bb8, %r8]
	.word 0x8ba20829  ! 345: FADDs	fadds	%f8, %f9, %f5
	.word 0xce7a22ec  ! 346: SWAP_I	swap	%r7, [%r8 + 0x02ec]
	.word 0x88fa2894  ! 347: SDIVcc_I	sdivcc 	%r8, 0x0894, %r4
	.word 0x866a2a14  ! 348: UDIVX_I	udivx 	%r8, 0x0a14, %r3
	.word 0xc8fa1009  ! 349: SWAPA_R	swapa	%r4, [%r8 + %r9] 0x80
	.word 0xceea1009  ! 350: LDSTUBA_R	ldstuba	%r7, [%r8 + %r9] 0x80
	.word 0xda8a2fc0  ! 351: LDUBA_I	lduba	[%r8, + 0x0fc0] %asi, %r13
	.word 0xce0a201c  ! 352: LDUB_I	ldub	[%r8 + 0x001c], %r7
	.word 0xb07a2228  ! 353: SDIV_I	sdiv 	%r8, 0x0228, %r24
	.word 0xc4b224ac  ! 354: STHA_I	stha	%r2, [%r8 + 0x04ac] %asi
	.word 0x8da208a9  ! 355: FSUBs	fsubs	%f8, %f9, %f6
	.word 0xcc120009  ! 356: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xe0ca2558  ! 357: LDSBA_I	ldsba	[%r8, + 0x0558] %asi, %r16
	.word 0xc2422670  ! 358: LDSW_I	ldsw	[%r8 + 0x0670], %r1
	.word 0xcc1a0009  ! 359: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xc4821009  ! 360: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r2
	.word 0xc6520009  ! 361: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0x8143e07d  ! 362: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xe27a2ee4  ! 363: SWAP_I	swap	%r17, [%r8 + 0x0ee4]
	.word 0x844a24cc  ! 364: MULX_I	mulx 	%r8, 0x04cc, %r2
	.word 0x0ec20008  ! 365: BRGEZ	brgez  ,nt	%8,<label_0x20008>
	.word 0xb96a2ba0  ! 366: SDIVX_I	sdivx	%r8, 0x0ba0, %r28
	.word 0xd4020009  ! 367: LDUW_R	lduw	[%r8 + %r9], %r10
	.word 0xab6a22ec  ! 368: SDIVX_I	sdivx	%r8, 0x02ec, %r21
	.word 0xc4b22eec  ! 369: STHA_I	stha	%r2, [%r8 + 0x0eec] %asi
	.word 0x88da0009  ! 370: SMULcc_R	smulcc 	%r8, %r9, %r4
	.word 0xc25a0009  ! 371: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0x0c800008  ! 372: BNEG	bneg  	<label_0x8>
	.word 0x9afa0009  ! 373: SDIVcc_R	sdivcc 	%r8, %r9, %r13
	.word 0x9cd2230c  ! 374: UMULcc_I	umulcc 	%r8, 0x030c, %r14
	.word 0x8143c000  ! 375: STBAR	stbar
	.word 0x87a20829  ! 376: FADDs	fadds	%f8, %f9, %f3
	.word 0x86fa0009  ! 377: SDIVcc_R	sdivcc 	%r8, %r9, %r3
	.word 0x867a0009  ! 378: SDIV_R	sdiv 	%r8, %r9, %r3
	.word 0x14800008  ! 379: BG	bg  	<label_0x8>
	.word 0xba7a2684  ! 380: SDIV_I	sdiv 	%r8, 0x0684, %r29
	.word 0x2cca0004  ! 381: BRGZ	brgz,a,pt	%8,<label_0xa0004>
	.word 0x85a209a9  ! 382: FDIVs	fdivs	%f8, %f9, %f2
	.word 0xc2420009  ! 383: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0x84f20009  ! 384: UDIVcc_R	udivcc 	%r8, %r9, %r2
	.word 0x965a0009  ! 385: SMUL_R	smul 	%r8, %r9, %r11
	.word 0xcef22da0  ! 386: STXA_I	stxa	%r7, [%r8 + 0x0da0] %asi
	.word 0x892226cc  ! 387: MULScc_I	mulscc 	%r8, 0x06cc, %r4
	.word 0xc3ea22a8  ! 388: PREFETCHA_I	prefetcha	[%r8, + 0x02a8] %asi, #one_read
	.word 0x8d2227b0  ! 389: MULScc_I	mulscc 	%r8, 0x07b0, %r6
	.word 0xf32223dc  ! 390: STF_I	st	%f25, [0x03dc, %r8]
	.word 0xc8ca2d44  ! 391: LDSBA_I	ldsba	[%r8, + 0x0d44] %asi, %r4
	.word 0xce420009  ! 392: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xa7a20929  ! 393: FMULs	fmuls	%f8, %f9, %f19
	.word 0xcc022bb4  ! 394: LDUW_I	lduw	[%r8 + 0x0bb4], %r6
	.word 0xfc921009  ! 395: LDUHA_R	lduha	[%r8, %r9] 0x80, %r30
	.word 0x86f20009  ! 396: UDIVcc_R	udivcc 	%r8, %r9, %r3
	.word 0xfeea1009  ! 397: LDSTUBA_R	ldstuba	%r31, [%r8 + %r9] 0x80
	.word 0x9b6a2c5c  ! 398: SDIVX_I	sdivx	%r8, 0x0c5c, %r13
	.word 0xc2da2ab8  ! 399: LDXA_I	ldxa	[%r8, + 0x0ab8] %asi, %r1
	.word 0x0c800008  ! 400: BNEG	bneg  	<label_0x8>
	.word 0xe05a28c0  ! 401: LDX_I	ldx	[%r8 + 0x08c0], %r16
	.word 0xccea1009  ! 402: LDSTUBA_R	ldstuba	%r6, [%r8 + %r9] 0x80
	.word 0xca7a0009  ! 403: SWAP_R	swap	%r5, [%r8 + %r9]
	.word 0x3e800004  ! 404: BVC	bvc,a	<label_0x4>
	.word 0xc3ea200c  ! 405: PREFETCHA_I	prefetcha	[%r8, + 0x000c] %asi, #one_read
	.word 0x12800008  ! 406: BNE	bne  	<label_0x8>
	.word 0xeeea1009  ! 407: LDSTUBA_R	ldstuba	%r23, [%r8 + %r9] 0x80
	.word 0xb8520009  ! 408: UMUL_R	umul 	%r8, %r9, %r28
	.word 0x04ca0004  ! 409: BRLEZ	brlez  ,pt	%8,<label_0xa0004>
	.word 0x85a20829  ! 410: FADDs	fadds	%f8, %f9, %f2
	.word 0x2cca0008  ! 411: BRGZ	brgz,a,pt	%8,<label_0xa0008>
	.word 0xca8a1009  ! 412: LDUBA_R	lduba	[%r8, %r9] 0x80, %r5
	.word 0x8ba20929  ! 413: FMULs	fmuls	%f8, %f9, %f5
	.word 0x16800004  ! 414: BGE	bge  	<label_0x4>
	.word 0xf49a1009  ! 415: LDDA_R	ldda	[%r8, %r9] 0x80, %r26
	.word 0x887a0009  ! 416: SDIV_R	sdiv 	%r8, %r9, %r4
	.word 0xf8ba1009  ! 417: STDA_R	stda	%r28, [%r8 + %r9] 0x80
	.word 0x3c800008  ! 418: BPOS	bpos,a	<label_0x8>
	.word 0x86da0009  ! 419: SMULcc_R	smulcc 	%r8, %r9, %r3
	.word 0x06c20004  ! 420: BRLZ	brlz  ,nt	%8,<label_0x20004>
	.word 0xaf220009  ! 421: MULScc_R	mulscc 	%r8, %r9, %r23
	.word 0x32800004  ! 422: BNE	bne,a	<label_0x4>
	.word 0xc41a2598  ! 423: LDD_I	ldd	[%r8 + 0x0598], %r2
	.word 0x40000004  ! 424: CALL	call	disp30_4
	.word 0xf2aa2e80  ! 425: STBA_I	stba	%r25, [%r8 + 0x0e80] %asi
	.word 0xf8aa1009  ! 426: STBA_R	stba	%r28, [%r8 + %r9] 0x80
	.word 0xcff21009  ! 427: CASXA_I	casxa	[%r8] 0x80, %r9, %r7
	.word 0x8e5a0009  ! 428: SMUL_R	smul 	%r8, %r9, %r7
	.word 0x88da0009  ! 429: SMULcc_R	smulcc 	%r8, %r9, %r4
	.word 0x04c20008  ! 430: BRLEZ	brlez  ,nt	%8,<label_0x20008>
	.word 0xe48a2ff0  ! 431: LDUBA_I	lduba	[%r8, + 0x0ff0] %asi, %r18
	.word 0x8143e070  ! 432: MEMBAR	membar	#Lookaside | #MemIssue | #Sync 
	.word 0xda4a2500  ! 433: LDSB_I	ldsb	[%r8 + 0x0500], %r13
	.word 0xf2aa2588  ! 434: STBA_I	stba	%r25, [%r8 + 0x0588] %asi
	.word 0x8143c000  ! 435: STBAR	stbar
	.word 0x2ac20008  ! 436: BRNZ	brnz,a,nt	%8,<label_0x20008>
	.word 0x82f20009  ! 437: UDIVcc_R	udivcc 	%r8, %r9, %r1
	.word 0xb24a0009  ! 438: MULX_R	mulx 	%r8, %r9, %r25
	.word 0xd6fa1009  ! 439: SWAPA_R	swapa	%r11, [%r8 + %r9] 0x80
	.word 0x2cca0004  ! 440: BRGZ	brgz,a,pt	%8,<label_0xa0004>
	.word 0xec9a1009  ! 441: LDDA_R	ldda	[%r8, %r9] 0x80, %r22
	.word 0x8143c000  ! 442: STBAR	stbar
	.word 0x0e800008  ! 443: BVS	bvs  	<label_0x8>
	.word 0x8143c000  ! 444: STBAR	stbar
	.word 0xc2a22ee0  ! 445: STWA_I	stwa	%r1, [%r8 + 0x0ee0] %asi
	.word 0xf0b22338  ! 446: STHA_I	stha	%r24, [%r8 + 0x0338] %asi
	.word 0xc65a2598  ! 447: LDX_I	ldx	[%r8 + 0x0598], %r3
	.word 0xc66a2158  ! 448: LDSTUB_I	ldstub	%r3, [%r8 + 0x0158]
	.word 0xb45a0009  ! 449: SMUL_R	smul 	%r8, %r9, %r26
	.word 0x9ba208a9  ! 450: FSUBs	fsubs	%f8, %f9, %f13
	.word 0xc3ea2764  ! 451: PREFETCHA_I	prefetcha	[%r8, + 0x0764] %asi, #one_read
	.word 0x24800008  ! 452: BLE	ble,a	<label_0x8>
	.word 0xfeea28e4  ! 453: LDSTUBA_I	ldstuba	%r31, [%r8 + 0x08e4] %asi
	.word 0x8143e00f  ! 454: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore 
	.word 0x89a209a9  ! 455: FDIVs	fdivs	%f8, %f9, %f4
	.word 0x8143e064  ! 456: MEMBAR	membar	#LoadStore | #MemIssue | #Sync 
	.word 0x8a720009  ! 460: UDIV_R	udiv 	%r8, %r9, %r5
	.word 0xcc122a4c  ! 461: LDUH_I	lduh	[%r8 + 0x0a4c], %r6
	.word 0xc2aa21e8  ! 462: STBA_I	stba	%r1, [%r8 + 0x01e8] %asi
	.word 0x884a291c  ! 463: MULX_I	mulx 	%r8, 0x091c, %r4
	.word 0xd89a1009  ! 465: LDDA_R	ldda	[%r8, %r9] 0x80, %r12
	.word 0x30800008  ! 466: BA	ba,a	<label_0x8>
	.word 0xc36a2248  ! 467: PREFETCH_I	prefetch	[%r8 + 0x0248], #one_read
	.word 0xe2ca1009  ! 468: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r17
	.word 0xcc02218c  ! 469: LDUW_I	lduw	[%r8 + 0x018c], %r6
	.word 0x86fa2148  ! 470: SDIVcc_I	sdivcc 	%r8, 0x0148, %r3
	.word 0xc4ba1009  ! 472: STDA_R	stda	%r2, [%r8 + %r9] 0x80
	.word 0xc6ea1009  ! 474: LDSTUBA_R	ldstuba	%r3, [%r8 + %r9] 0x80
	.word 0xe0a22290  ! 475: STWA_I	stwa	%r16, [%r8 + 0x0290] %asi
	.word 0xc73a29b8  ! 477: STDF_I	std	%f3, [0x09b8, %r8]
	.word 0x2e800004  ! 478: BVS	bvs,a	<label_0x4>
	.word 0xb3220009  ! 479: MULScc_R	mulscc 	%r8, %r9, %r25
	.word 0xf0822758  ! 480: LDUWA_I	lduwa	[%r8, + 0x0758] %asi, %r24
	.word 0x8a520009  ! 481: UMUL_R	umul 	%r8, %r9, %r5
	.word 0x8143c000  ! 482: STBAR	stbar
	.word 0xf4ea1009  ! 483: LDSTUBA_R	ldstuba	%r26, [%r8 + %r9] 0x80
	.word 0x8143e045  ! 484: MEMBAR	membar	#LoadLoad | #LoadStore | #Sync 
	.word 0xeeb21009  ! 485: STHA_R	stha	%r23, [%r8 + %r9] 0x80
	.word 0x956a0009  ! 486: SDIVX_R	sdivx	%r8, %r9, %r10
	.word 0x10800004  ! 487: BA	ba  	<label_0x4>
	.word 0xf2aa1009  ! 488: STBA_R	stba	%r25, [%r8 + %r9] 0x80
	.word 0xccea1009  ! 489: LDSTUBA_R	ldstuba	%r6, [%r8 + %r9] 0x80
	.word 0x8c5221a0  ! 490: UMUL_I	umul 	%r8, 0x01a0, %r6
	.word 0x02ca0004  ! 491: BRZ	brz  ,pt	%8,<label_0xa0004>
	.word 0x06ca0004  ! 492: BRLZ	brlz  ,pt	%8,<label_0xa0004>
	.word 0xceb21009  ! 493: STHA_R	stha	%r7, [%r8 + %r9] 0x80
	.word 0xcdf22009  ! 494: CASXA_R	casxa	[%r8]%asi, %r9, %r6
	.word 0x867a0009  ! 495: SDIV_R	sdiv 	%r8, %r9, %r3
	.word 0x87222c44  ! 496: MULScc_I	mulscc 	%r8, 0x0c44, %r3
	.word 0xdcfa2054  ! 497: SWAPA_I	swapa	%r14, [%r8 + 0x0054] %asi
	.word 0x8143e067  ! 498: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #MemIssue | #Sync 
	.word 0xcc420009  ! 499: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0x04ca0004  ! 500: BRLEZ	brlez  ,pt	%8,<label_0xa0004>
	.word 0x8143e023  ! 501: MEMBAR	membar	#LoadLoad | #StoreLoad | #MemIssue 
	.word 0xad6a0009  ! 502: SDIVX_R	sdivx	%r8, %r9, %r22
	.word 0x8a7a2bec  ! 503: SDIV_I	sdiv 	%r8, 0x0bec, %r5
	.word 0xc84a27f4  ! 504: LDSB_I	ldsb	[%r8 + 0x07f4], %r4
	.word 0x34800004  ! 505: BG	bg,a	<label_0x4>
	.word 0x8143c000  ! 506: STBAR	stbar
	.word 0xa7a20829  ! 507: FADDs	fadds	%f8, %f9, %f19
	.word 0xdac21009  ! 508: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r13
	.word 0xc9e21009  ! 509: CASA_I	casa	[%r8] 0x80, %r9, %r4
	.word 0xa4520009  ! 510: UMUL_R	umul 	%r8, %r9, %r18
	.word 0x87220009  ! 511: MULScc_R	mulscc 	%r8, %r9, %r3
	.word 0xc36a2c28  ! 512: PREFETCH_I	prefetch	[%r8 + 0x0c28], #one_read
	.word 0xc9e22009  ! 513: CASA_R	casa	[%r8] %asi, %r9, %r4
	.word 0xf2ea1009  ! 514: LDSTUBA_R	ldstuba	%r25, [%r8 + %r9] 0x80
	.word 0x8fa20929  ! 515: FMULs	fmuls	%f8, %f9, %f7
	.word 0x8143c000  ! 516: STBAR	stbar
	.word 0xeb222e30  ! 517: STF_I	st	%f21, [0x0e30, %r8]
	.word 0xc4da1009  ! 518: LDXA_R	ldxa	[%r8, %r9] 0x80, %r2
	.word 0x8143e017  ! 519: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside 
	.word 0xc5e21009  ! 520: CASA_I	casa	[%r8] 0x80, %r9, %r2
	.word 0xf89a1009  ! 521: LDDA_R	ldda	[%r8, %r9] 0x80, %r28
	.word 0x10800004  ! 522: BA	ba  	<label_0x4>
	.word 0x8143e009  ! 523: MEMBAR	membar	#LoadLoad | #StoreStore 
	.word 0xce8a2460  ! 524: LDUBA_I	lduba	[%r8, + 0x0460] %asi, %r7
	.word 0xd40a0009  ! 525: LDUB_R	ldub	[%r8 + %r9], %r10
	.word 0x8143c000  ! 526: STBAR	stbar
	.word 0xcdf22009  ! 527: CASXA_R	casxa	[%r8]%asi, %r9, %r6
	.word 0xc36a20d0  ! 528: PREFETCH_I	prefetch	[%r8 + 0x00d0], #one_read
	.word 0xc5f22009  ! 530: CASXA_R	casxa	[%r8]%asi, %r9, %r2
	.word 0xc33a0009  ! 531: STDF_R	std	%f1, [%r9, %r8]
	.word 0xcc422274  ! 532: LDSW_I	ldsw	[%r8 + 0x0274], %r6
	.word 0x2e800008  ! 533: BVS	bvs,a	<label_0x8>
	.word 0x84720009  ! 534: UDIV_R	udiv 	%r8, %r9, %r2
	.word 0xcc8227d4  ! 535: LDUWA_I	lduwa	[%r8, + 0x07d4] %asi, %r6
	.word 0xf89a2300  ! 536: LDDA_I	ldda	[%r8, + 0x0300] %asi, %r28
	.word 0x8143e053  ! 537: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside | #Sync 
	.word 0x10800008  ! 538: BA	ba  	<label_0x8>
	.word 0xa1a20929  ! 539: FMULs	fmuls	%f8, %f9, %f16
	.word 0xc2d22464  ! 540: LDSHA_I	ldsha	[%r8, + 0x0464] %asi, %r1
	.word 0x8143e02d  ! 541: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #MemIssue 
	.word 0x8143c000  ! 542: STBAR	stbar
	.word 0xfad2232c  ! 543: LDSHA_I	ldsha	[%r8, + 0x032c] %asi, %r29
	.word 0x8143e02e  ! 544: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #MemIssue 
	.word 0xce6a2124  ! 545: LDSTUB_I	ldstub	%r7, [%r8 + 0x0124]
	.word 0x8143e041  ! 546: MEMBAR	membar	#LoadLoad | #Sync 
	.word 0xcca22fac  ! 547: STWA_I	stwa	%r6, [%r8 + 0x0fac] %asi
	.word 0x30800004  ! 548: BA	ba,a	<label_0x4>
	.word 0xd73a0009  ! 549: STDF_R	std	%f11, [%r9, %r8]
	.word 0xf73a2f58  ! 550: STDF_I	std	%f27, [0x0f58, %r8]
	.word 0xc5e22009  ! 551: CASA_R	casa	[%r8] %asi, %r9, %r2
	.word 0x8ba20929  ! 552: FMULs	fmuls	%f8, %f9, %f5
	.word 0xc6a22ad0  ! 553: STWA_I	stwa	%r3, [%r8 + 0x0ad0] %asi
	.word 0xccf225d0  ! 554: STXA_I	stxa	%r6, [%r8 + 0x05d0] %asi
	.word 0xfa5a2cd0  ! 555: LDX_I	ldx	[%r8 + 0x0cd0], %r29
	.word 0xc36a2010  ! 556: PREFETCH_I	prefetch	[%r8 + 0x0010], #one_read
	.word 0xc6921009  ! 557: LDUHA_R	lduha	[%r8, %r9] 0x80, %r3
	.word 0x8143e074  ! 558: MEMBAR	membar	#LoadStore | #Lookaside | #MemIssue | #Sync 
	.word 0x36800008  ! 559: BGE	bge,a	<label_0x8>
	.word 0xfc1a2bf0  ! 561: LDD_I	ldd	[%r8 + 0x0bf0], %r30
	.word 0xea520009  ! 562: LDSH_R	ldsh	[%r8 + %r9], %r21
	.word 0x88f227f4  ! 563: UDIVcc_I	udivcc 	%r8, 0x07f4, %r4
	.word 0x847a0009  ! 564: SDIV_R	sdiv 	%r8, %r9, %r2
	.word 0x8a7a0009  ! 565: SDIV_R	sdiv 	%r8, %r9, %r5
	.word 0xf2da1009  ! 566: LDXA_R	ldxa	[%r8, %r9] 0x80, %r25
	.word 0x8e5a0009  ! 567: SMUL_R	smul 	%r8, %r9, %r7
	.word 0x8143c000  ! 568: STBAR	stbar
	.word 0xc36a2458  ! 569: PREFETCH_I	prefetch	[%r8 + 0x0458], #one_read
	.word 0xc5f21009  ! 570: CASXA_I	casxa	[%r8] 0x80, %r9, %r2
	.word 0xf4b22a84  ! 571: STHA_I	stha	%r26, [%r8 + 0x0a84] %asi
	.word 0x8e5a0009  ! 572: SMUL_R	smul 	%r8, %r9, %r7
	.word 0xc6da2350  ! 574: LDXA_I	ldxa	[%r8, + 0x0350] %asi, %r3
	.word 0xf88223ec  ! 575: LDUWA_I	lduwa	[%r8, + 0x03ec] %asi, %r28
	.word 0xc6520009  ! 576: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xd6aa2b7c  ! 577: STBA_I	stba	%r11, [%r8 + 0x0b7c] %asi
	.word 0x844a21f4  ! 578: MULX_I	mulx 	%r8, 0x01f4, %r2
	.word 0x2e800008  ! 580: BVS	bvs,a	<label_0x8>
	.word 0xc46a23a8  ! 581: LDSTUB_I	ldstub	%r2, [%r8 + 0x03a8]
	.word 0x826a0009  ! 583: UDIVX_R	udivx 	%r8, %r9, %r1
	.word 0xc3f21009  ! 584: CASXA_I	casxa	[%r8] 0x80, %r9, %r1
	.word 0xf87a0009  ! 585: SWAP_R	swap	%r28, [%r8 + %r9]
	.word 0x8143e030  ! 586: MEMBAR	membar	#Lookaside | #MemIssue 
	.word 0x896a2c9c  ! 587: SDIVX_I	sdivx	%r8, 0x0c9c, %r4
	.word 0xc36a262c  ! 588: PREFETCH_I	prefetch	[%r8 + 0x062c], #one_read
	.word 0x8ef2245c  ! 589: UDIVcc_I	udivcc 	%r8, 0x045c, %r7
	.word 0x2a800008  ! 590: BCS	bcs,a	<label_0x8>
	.word 0x9ada0009  ! 591: SMULcc_R	smulcc 	%r8, %r9, %r13
	.word 0xec6a0009  ! 592: LDSTUB_R	ldstub	%r22, [%r8 + %r9]
	.word 0x8143e05e  ! 593: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0x8143c000  ! 594: STBAR	stbar
	.word 0xf0aa1009  ! 595: STBA_R	stba	%r24, [%r8 + %r9] 0x80
	.word 0x24ca0008  ! 596: BRLEZ	brlez,a,pt	%8,<label_0xa0008>
	.word 0x8a720009  ! 598: UDIV_R	udiv 	%r8, %r9, %r5
	.word 0xa06a2250  ! 599: UDIVX_I	udivx 	%r8, 0x0250, %r16
	.word 0xc81a0009  ! 600: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xe0ba2b48  ! 601: STDA_I	stda	%r16, [%r8 + 0x0b48] %asi
	.word 0xc49a1009  ! 602: LDDA_R	ldda	[%r8, %r9] 0x80, %r2
	.word 0x82720009  ! 603: UDIV_R	udiv 	%r8, %r9, %r1
	.word 0xc6c21009  ! 604: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r3
	.word 0xc2520009  ! 605: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xf41a2508  ! 606: LDD_I	ldd	[%r8 + 0x0508], %r26
	.word 0xc36a2b3c  ! 607: PREFETCH_I	prefetch	[%r8 + 0x0b3c], #one_read
	.word 0xc6c22218  ! 608: LDSWA_I	ldswa	[%r8, + 0x0218] %asi, %r3
	.word 0xcb3a0009  ! 609: STDF_R	std	%f5, [%r9, %r8]
	.word 0xc2b22028  ! 610: STHA_I	stha	%r1, [%r8 + 0x0028] %asi
	.word 0xf8c22a5c  ! 611: LDSWA_I	ldswa	[%r8, + 0x0a5c] %asi, %r28
	.word 0xcca22a48  ! 612: STWA_I	stwa	%r6, [%r8 + 0x0a48] %asi
	.word 0xc8420009  ! 613: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xce522e28  ! 614: LDSH_I	ldsh	[%r8 + 0x0e28], %r7
	.word 0xca6a0009  ! 615: LDSTUB_R	ldstub	%r5, [%r8 + %r9]
	.word 0xf89a2ec8  ! 616: LDDA_I	ldda	[%r8, + 0x0ec8] %asi, %r28
	.word 0xc8d21009  ! 617: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r4
	.word 0xe47a29f8  ! 618: SWAP_I	swap	%r18, [%r8 + 0x09f8]
	.word 0xd93a2d98  ! 619: STDF_I	std	%f12, [0x0d98, %r8]
	.word 0xccea1009  ! 620: LDSTUBA_R	ldstuba	%r6, [%r8 + %r9] 0x80
	.word 0xcaf21009  ! 621: STXA_R	stxa	%r5, [%r8 + %r9] 0x80
	.word 0xc9f21009  ! 622: CASXA_I	casxa	[%r8] 0x80, %r9, %r4
	.word 0x8e522648  ! 623: UMUL_I	umul 	%r8, 0x0648, %r7
	.word 0xc5f22009  ! 624: CASXA_R	casxa	[%r8]%asi, %r9, %r2
	.word 0x866a0009  ! 625: UDIVX_R	udivx 	%r8, %r9, %r3
	.word 0xc2922a48  ! 626: LDUHA_I	lduha	[%r8, + 0x0a48] %asi, %r1
	.word 0x8eda0009  ! 627: SMULcc_R	smulcc 	%r8, %r9, %r7
	.word 0x8e6a0009  ! 628: UDIVX_R	udivx 	%r8, %r9, %r7
	.word 0xc53a25c8  ! 629: STDF_I	std	%f2, [0x05c8, %r8]
	.word 0x0e800004  ! 630: BVS	bvs  	<label_0x4>
	.word 0xce6a263c  ! 631: LDSTUB_I	ldstub	%r7, [%r8 + 0x063c]
	.word 0xccf22298  ! 632: STXA_I	stxa	%r6, [%r8 + 0x0298] %asi
	.word 0x3a800004  ! 633: BCC	bcc,a	<label_0x4>
	.word 0xc36a2948  ! 634: PREFETCH_I	prefetch	[%r8 + 0x0948], #one_read
	.word 0x8da208a9  ! 635: FSUBs	fsubs	%f8, %f9, %f6
	.word 0x8143c000  ! 636: STBAR	stbar
	.word 0x95a20829  ! 637: FADDs	fadds	%f8, %f9, %f10
	.word 0xe8ba1009  ! 638: STDA_R	stda	%r20, [%r8 + %r9] 0x80
	.word 0xdca220b0  ! 639: STWA_I	stwa	%r14, [%r8 + 0x00b0] %asi
	.word 0xc4d224a0  ! 641: LDSHA_I	ldsha	[%r8, + 0x04a0] %asi, %r2
	.word 0xc64a0009  ! 642: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xe6a21009  ! 643: STWA_R	stwa	%r19, [%r8 + %r9] 0x80
	.word 0xc722215c  ! 644: STF_I	st	%f3, [0x015c, %r8]
	.word 0x8e7a2e0c  ! 645: SDIV_I	sdiv 	%r8, 0x0e0c, %r7
	.word 0xc6da2348  ! 646: LDXA_I	ldxa	[%r8, + 0x0348] %asi, %r3
	.word 0x89a20929  ! 647: FMULs	fmuls	%f8, %f9, %f4
	.word 0x8143c000  ! 648: STBAR	stbar
	.word 0xfc6a2658  ! 649: LDSTUB_I	ldstub	%r30, [%r8 + 0x0658]
	.word 0x8d6a20bc  ! 650: SDIVX_I	sdivx	%r8, 0x00bc, %r6
	.word 0x2ac20008  ! 651: BRNZ	brnz,a,nt	%8,<label_0x20008>
	.word 0xc3ea253c  ! 652: PREFETCHA_I	prefetcha	[%r8, + 0x053c] %asi, #one_read
	.word 0x88f22d20  ! 653: UDIVcc_I	udivcc 	%r8, 0x0d20, %r4
	.word 0x8143c000  ! 654: STBAR	stbar
	.word 0xcafa2894  ! 655: SWAPA_I	swapa	%r5, [%r8 + 0x0894] %asi
	.word 0x8ed22af0  ! 656: UMULcc_I	umulcc 	%r8, 0x0af0, %r7
	.word 0x8143c000  ! 657: STBAR	stbar
	.word 0x8143c000  ! 658: STBAR	stbar
	.word 0xc93a2200  ! 659: STDF_I	std	%f4, [0x0200, %r8]
	.word 0x8143c000  ! 660: STBAR	stbar
	.word 0x97a20829  ! 661: FADDs	fadds	%f8, %f9, %f11
	.word 0xc8821009  ! 662: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r4
	.word 0xc53a2d60  ! 663: STDF_I	std	%f2, [0x0d60, %r8]
	.word 0x36800008  ! 664: BGE	bge,a	<label_0x8>
	.word 0xc2ca1009  ! 665: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r1
	.word 0x32800004  ! 666: BNE	bne,a	<label_0x4>
	.word 0x8143e047  ! 667: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Sync 
	.word 0x38800004  ! 668: BGU	bgu,a	<label_0x4>
	.word 0xc3ea2d54  ! 669: PREFETCHA_I	prefetcha	[%r8, + 0x0d54] %asi, #one_read
	.word 0x836a0009  ! 670: SDIVX_R	sdivx	%r8, %r9, %r1
	.word 0xab6a2b58  ! 671: SDIVX_I	sdivx	%r8, 0x0b58, %r21
	.word 0x844a232c  ! 672: MULX_I	mulx 	%r8, 0x032c, %r2
	.word 0xcea22db0  ! 673: STWA_I	stwa	%r7, [%r8 + 0x0db0] %asi
	.word 0xc4ea1009  ! 674: LDSTUBA_R	ldstuba	%r2, [%r8 + %r9] 0x80
	.word 0xc28a1009  ! 675: LDUBA_R	lduba	[%r8, %r9] 0x80, %r1
	.word 0xc47a0009  ! 676: SWAP_R	swap	%r2, [%r8 + %r9]
	.word 0x40000004  ! 677: CALL	call	disp30_4
	.word 0xc8a21009  ! 679: STWA_R	stwa	%r4, [%r8 + %r9] 0x80
	.word 0xce0a0009  ! 680: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0x8a5a2348  ! 681: SMUL_I	smul 	%r8, 0x0348, %r5
	.word 0x8143c000  ! 682: STBAR	stbar
	.word 0x84d20009  ! 683: UMULcc_R	umulcc 	%r8, %r9, %r2
	.word 0xb7a208a9  ! 684: FSUBs	fsubs	%f8, %f9, %f27
	.word 0x8143e04e  ! 685: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Sync 
	.word 0xc4ca2998  ! 686: LDSBA_I	ldsba	[%r8, + 0x0998] %asi, %r2
	.word 0xc8020009  ! 687: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xcaaa2cfc  ! 688: STBA_I	stba	%r5, [%r8 + 0x0cfc] %asi
	.word 0xc8822b38  ! 689: LDUWA_I	lduwa	[%r8, + 0x0b38] %asi, %r4
	.word 0xca020009  ! 690: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0x8ed20009  ! 691: UMULcc_R	umulcc 	%r8, %r9, %r7
	.word 0xcc7a2eb8  ! 692: SWAP_I	swap	%r6, [%r8 + 0x0eb8]
	.word 0xc36a27e0  ! 693: PREFETCH_I	prefetch	[%r8 + 0x07e0], #one_read
	.word 0xc5e21009  ! 694: CASA_I	casa	[%r8] 0x80, %r9, %r2
	.word 0x8143e034  ! 695: MEMBAR	membar	#LoadStore | #Lookaside | #MemIssue 
	.word 0xc84a0009  ! 696: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0x8143e02a  ! 697: MEMBAR	membar	#StoreLoad | #StoreStore | #MemIssue 
	.word 0x8e520009  ! 698: UMUL_R	umul 	%r8, %r9, %r7
	.word 0xc7e21009  ! 699: CASA_I	casa	[%r8] 0x80, %r9, %r3
	.word 0xcf3a26c0  ! 700: STDF_I	std	%f7, [0x06c0, %r8]
	.word 0x14800004  ! 701: BG	bg  	<label_0x4>
	.word 0x8ad227d0  ! 704: UMULcc_I	umulcc 	%r8, 0x07d0, %r5
	.word 0xc6921009  ! 705: LDUHA_R	lduha	[%r8, %r9] 0x80, %r3
	.word 0xc67a229c  ! 706: SWAP_I	swap	%r3, [%r8 + 0x029c]
	.word 0xcf3a2410  ! 707: STDF_I	std	%f7, [0x0410, %r8]
	.word 0xc25a2e78  ! 708: LDX_I	ldx	[%r8 + 0x0e78], %r1
	.word 0xc9222a3c  ! 709: STF_I	st	%f4, [0x0a3c, %r8]
	.word 0xe13a0009  ! 710: STDF_R	std	%f16, [%r9, %r8]
	.word 0xd60a289c  ! 711: LDUB_I	ldub	[%r8 + 0x089c], %r11
	.word 0xc7e22009  ! 712: CASA_R	casa	[%r8] %asi, %r9, %r3
	.word 0x84f20009  ! 713: UDIVcc_R	udivcc 	%r8, %r9, %r2
	.word 0x8143e029  ! 714: MEMBAR	membar	#LoadLoad | #StoreStore | #MemIssue 
	.word 0xf6b22ed4  ! 715: STHA_I	stha	%r27, [%r8 + 0x0ed4] %asi
	.word 0x8143c000  ! 716: STBAR	stbar
	.word 0x8143e02f  ! 717: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #MemIssue 
	.word 0x22ca0004  ! 718: BRZ	brz,a,pt	%8,<label_0xa0004>
	.word 0x866a2d20  ! 719: UDIVX_I	udivx 	%r8, 0x0d20, %r3
	.word 0xc6aa1009  ! 720: STBA_R	stba	%r3, [%r8 + %r9] 0x80
	.word 0xc2d22b60  ! 721: LDSHA_I	ldsha	[%r8, + 0x0b60] %asi, %r1
	.word 0x86f20009  ! 722: UDIVcc_R	udivcc 	%r8, %r9, %r3
	.word 0xd8a21009  ! 723: STWA_R	stwa	%r12, [%r8 + %r9] 0x80
	.word 0xe65a0009  ! 724: LDX_R	ldx	[%r8 + %r9], %r19
	.word 0xc8fa2754  ! 725: SWAPA_I	swapa	%r4, [%r8 + 0x0754] %asi
	.word 0x8143e066  ! 726: MEMBAR	membar	#StoreLoad | #LoadStore | #MemIssue | #Sync 
	.word 0xcca22b1c  ! 727: STWA_I	stwa	%r6, [%r8 + 0x0b1c] %asi
	.word 0xc2da2058  ! 728: LDXA_I	ldxa	[%r8, + 0x0058] %asi, %r1
	.word 0x8143e02e  ! 729: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #MemIssue 
	.word 0xf33a2f68  ! 730: STDF_I	std	%f25, [0x0f68, %r8]
	.word 0x84520009  ! 731: UMUL_R	umul 	%r8, %r9, %r2
	.word 0xd41a0009  ! 732: LDD_R	ldd	[%r8 + %r9], %r10
	.word 0xdeda2438  ! 733: LDXA_I	ldxa	[%r8, + 0x0438] %asi, %r15
	.word 0x984a0009  ! 734: MULX_R	mulx 	%r8, %r9, %r12
	.word 0xee922820  ! 735: LDUHA_I	lduha	[%r8, + 0x0820] %asi, %r23
	.word 0x8143c000  ! 736: STBAR	stbar
	.word 0x8a720009  ! 737: UDIV_R	udiv 	%r8, %r9, %r5
	.word 0x34800004  ! 738: BG	bg,a	<label_0x4>
	.word 0xada208a9  ! 739: FSUBs	fsubs	%f8, %f9, %f22
	.word 0x83220009  ! 740: MULScc_R	mulscc 	%r8, %r9, %r1
	.word 0xd4aa2a1c  ! 741: STBA_I	stba	%r10, [%r8 + 0x0a1c] %asi
	.word 0x8143c000  ! 742: STBAR	stbar
	.word 0xccda22d0  ! 743: LDXA_I	ldxa	[%r8, + 0x02d0] %asi, %r6
	.word 0xc2f21009  ! 744: STXA_R	stxa	%r1, [%r8 + %r9] 0x80
	.word 0xca6a2f54  ! 745: LDSTUB_I	ldstub	%r5, [%r8 + 0x0f54]
	.word 0xa9a208a9  ! 746: FSUBs	fsubs	%f8, %f9, %f20
	.word 0xc36a2cf0  ! 747: PREFETCH_I	prefetch	[%r8 + 0x0cf0], #one_read
	.word 0x8143e021  ! 748: MEMBAR	membar	#LoadLoad | #MemIssue 
	.word 0xc7e21009  ! 749: CASA_I	casa	[%r8] 0x80, %r9, %r3
	.word 0x836a0009  ! 750: SDIVX_R	sdivx	%r8, %r9, %r1
	.word 0xceda1009  ! 751: LDXA_R	ldxa	[%r8, %r9] 0x80, %r7
	.word 0xc26a204c  ! 752: LDSTUB_I	ldstub	%r1, [%r8 + 0x004c]
	.word 0x2a800008  ! 753: BCS	bcs,a	<label_0x8>
	.word 0xcc520009  ! 754: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xcb222a90  ! 755: STF_I	st	%f5, [0x0a90, %r8]
	.word 0x97a209a9  ! 757: FDIVs	fdivs	%f8, %f9, %f11
	.word 0x8143c000  ! 758: STBAR	stbar
	.word 0xec5a2048  ! 759: LDX_I	ldx	[%r8 + 0x0048], %r22
	.word 0xc2fa1009  ! 760: SWAPA_R	swapa	%r1, [%r8 + %r9] 0x80
	.word 0xc20a0009  ! 761: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xcc120009  ! 762: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0x87a20829  ! 763: FADDs	fadds	%f8, %f9, %f3
	.word 0x28800004  ! 764: BLEU	bleu,a	<label_0x4>
	.word 0xc80a2674  ! 765: LDUB_I	ldub	[%r8 + 0x0674], %r4
	.word 0x8143c000  ! 766: STBAR	stbar
	.word 0xf13a0009  ! 767: STDF_R	std	%f24, [%r9, %r8]
	.word 0x2c800004  ! 768: BNEG	bneg,a	<label_0x4>
	.word 0xce4a25bc  ! 769: LDSB_I	ldsb	[%r8 + 0x05bc], %r7
	.word 0x85220009  ! 770: MULScc_R	mulscc 	%r8, %r9, %r2
	.word 0xc6420009  ! 771: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xf06a0009  ! 772: LDSTUB_R	ldstub	%r24, [%r8 + %r9]
	.word 0xf6821009  ! 773: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r27
	.word 0xecb222fc  ! 774: STHA_I	stha	%r22, [%r8 + 0x02fc] %asi
	.word 0x02800004  ! 775: BE	be  	<label_0x4>
	.word 0x12800008  ! 776: BNE	bne  	<label_0x8>
	.word 0x36800008  ! 777: BGE	bge,a	<label_0x8>
	.word 0x30800004  ! 778: BA	ba,a	<label_0x4>
	.word 0x2cca0004  ! 779: BRGZ	brgz,a,pt	%8,<label_0xa0004>
	.word 0xfcba2648  ! 780: STDA_I	stda	%r30, [%r8 + 0x0648] %asi
	.word 0xc36a2854  ! 781: PREFETCH_I	prefetch	[%r8 + 0x0854], #one_read
	.word 0xaf220009  ! 783: MULScc_R	mulscc 	%r8, %r9, %r23
	.word 0x8da20929  ! 784: FMULs	fmuls	%f8, %f9, %f6
	.word 0xba5a0009  ! 785: SMUL_R	smul 	%r8, %r9, %r29
	.word 0xec1a2de8  ! 786: LDD_I	ldd	[%r8 + 0x0de8], %r22
	.word 0x8143e052  ! 788: MEMBAR	membar	#StoreLoad | #Lookaside | #Sync 
	.word 0x8143e037  ! 789: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside | #MemIssue 
	.word 0xc6420009  ! 790: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0x8c4a256c  ! 791: MULX_I	mulx 	%r8, 0x056c, %r6
	.word 0x826a2f6c  ! 792: UDIVX_I	udivx 	%r8, 0x0f6c, %r1
	.word 0x8143c000  ! 793: STBAR	stbar
	.word 0xc7f22009  ! 794: CASXA_R	casxa	[%r8]%asi, %r9, %r3
	.word 0x8143c000  ! 795: STBAR	stbar
	.word 0xc4fa1009  ! 796: SWAPA_R	swapa	%r2, [%r8 + %r9] 0x80
	.word 0xeaa21009  ! 797: STWA_R	stwa	%r21, [%r8 + %r9] 0x80
	.word 0xac5a0009  ! 798: SMUL_R	smul 	%r8, %r9, %r22
	.word 0xcb220009  ! 799: STF_R	st	%f5, [%r9, %r8]
	.word 0xc36a2610  ! 800: PREFETCH_I	prefetch	[%r8 + 0x0610], #one_read
	.word 0x99a20929  ! 802: FMULs	fmuls	%f8, %f9, %f12
	.word 0xf8020009  ! 804: LDUW_R	lduw	[%r8 + %r9], %r28
	.word 0xff2222e8  ! 805: STF_I	st	%f31, [0x02e8, %r8]
	.word 0xbfa20929  ! 806: FMULs	fmuls	%f8, %f9, %f31
	.word 0xcbf22009  ! 807: CASXA_R	casxa	[%r8]%asi, %r9, %r5
	.word 0xe6a21009  ! 808: STWA_R	stwa	%r19, [%r8 + %r9] 0x80
	.word 0xe40a0009  ! 809: LDUB_R	ldub	[%r8 + %r9], %r18
	.word 0xc6ca1009  ! 810: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r3
	.word 0xcbf22009  ! 812: CASXA_R	casxa	[%r8]%asi, %r9, %r5
	.word 0xb9222608  ! 813: MULScc_I	mulscc 	%r8, 0x0608, %r28
	.word 0x26ca0008  ! 814: BRLZ	brlz,a,pt	%8,<label_0xa0008>
	.word 0xcc921009  ! 815: LDUHA_R	lduha	[%r8, %r9] 0x80, %r6
	.word 0xa0720009  ! 816: UDIV_R	udiv 	%r8, %r9, %r16
	.word 0xc36a2364  ! 817: PREFETCH_I	prefetch	[%r8 + 0x0364], #one_read
	.word 0xcaa228d0  ! 818: STWA_I	stwa	%r5, [%r8 + 0x08d0] %asi
	.word 0xc2da1009  ! 819: LDXA_R	ldxa	[%r8, %r9] 0x80, %r1
	.word 0xca4a265c  ! 820: LDSB_I	ldsb	[%r8 + 0x065c], %r5
	.word 0xc26a2fec  ! 821: LDSTUB_I	ldstub	%r1, [%r8 + 0x0fec]
	.word 0x8143c000  ! 822: STBAR	stbar
	.word 0xfb220009  ! 823: STF_R	st	%f29, [%r9, %r8]
	.word 0xc28a23e0  ! 824: LDUBA_I	lduba	[%r8, + 0x03e0] %asi, %r1
	.word 0xc9f22009  ! 825: CASXA_R	casxa	[%r8]%asi, %r9, %r4
	.word 0xdaa21009  ! 826: STWA_R	stwa	%r13, [%r8 + %r9] 0x80
	.word 0xc47a0009  ! 827: SWAP_R	swap	%r2, [%r8 + %r9]
	.word 0x14800008  ! 828: BG	bg  	<label_0x8>
	.word 0xca6a2a1c  ! 829: LDSTUB_I	ldstub	%r5, [%r8 + 0x0a1c]
	.word 0x32800004  ! 830: BNE	bne,a	<label_0x4>
	.word 0xc24a2364  ! 831: LDSB_I	ldsb	[%r8 + 0x0364], %r1
	.word 0xceb21009  ! 832: STHA_R	stha	%r7, [%r8 + %r9] 0x80
	.word 0xc86a0009  ! 833: LDSTUB_R	ldstub	%r4, [%r8 + %r9]
	.word 0xc4922778  ! 834: LDUHA_I	lduha	[%r8, + 0x0778] %asi, %r2
	.word 0x856a0009  ! 835: SDIVX_R	sdivx	%r8, %r9, %r2
	.word 0xc6da1009  ! 836: LDXA_R	ldxa	[%r8, %r9] 0x80, %r3
	.word 0xc87a26e4  ! 837: SWAP_I	swap	%r4, [%r8 + 0x06e4]
	.word 0xe2ca23d0  ! 838: LDSBA_I	ldsba	[%r8, + 0x03d0] %asi, %r17
	.word 0xf2aa2740  ! 839: STBA_I	stba	%r25, [%r8 + 0x0740] %asi
	.word 0xe0ba1009  ! 840: STDA_R	stda	%r16, [%r8 + %r9] 0x80
	.word 0xc2422380  ! 841: LDSW_I	ldsw	[%r8 + 0x0380], %r1
	.word 0x83a209a9  ! 842: FDIVs	fdivs	%f8, %f9, %f1
	.word 0xa0fa22ec  ! 843: SDIVcc_I	sdivcc 	%r8, 0x02ec, %r16
	.word 0xccea22f8  ! 844: LDSTUBA_I	ldstuba	%r6, [%r8 + 0x02f8] %asi
	.word 0xd93a2148  ! 845: STDF_I	std	%f12, [0x0148, %r8]
	.word 0xc2aa1009  ! 846: STBA_R	stba	%r1, [%r8 + %r9] 0x80
	.word 0xe6821009  ! 847: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r19
	.word 0xbd222794  ! 848: MULScc_I	mulscc 	%r8, 0x0794, %r30
	.word 0x00800008  ! 849: BN	bn  	<label_0x8>
	.word 0xf7222350  ! 850: STF_I	st	%f27, [0x0350, %r8]
	.word 0x8143e041  ! 851: MEMBAR	membar	#LoadLoad | #Sync 
	.word 0xc36a2038  ! 852: PREFETCH_I	prefetch	[%r8 + 0x0038], #one_read
	.word 0x8143e043  ! 853: MEMBAR	membar	#LoadLoad | #StoreLoad | #Sync 
	.word 0xdc1a0009  ! 854: LDD_R	ldd	[%r8 + %r9], %r14
	.word 0x02800004  ! 855: BE	be  	<label_0x4>
	.word 0x94f22134  ! 856: UDIVcc_I	udivcc 	%r8, 0x0134, %r10
	.word 0xcf220009  ! 857: STF_R	st	%f7, [%r9, %r8]
	.word 0xea520009  ! 858: LDSH_R	ldsh	[%r8 + %r9], %r21
	.word 0x8fa20829  ! 859: FADDs	fadds	%f8, %f9, %f7
	.word 0x872223c0  ! 860: MULScc_I	mulscc 	%r8, 0x03c0, %r3
	.word 0xdc1a26a8  ! 861: LDD_I	ldd	[%r8 + 0x06a8], %r14
	.word 0x24800004  ! 862: BLE	ble,a	<label_0x4>
	.word 0x8143e07a  ! 863: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0x8143e076  ! 864: MEMBAR	membar	#StoreLoad | #LoadStore | #Lookaside | #MemIssue | #Sync 
	.word 0xe7222688  ! 865: STF_I	st	%f19, [0x0688, %r8]
	.word 0xce5227f8  ! 866: LDSH_I	ldsh	[%r8 + 0x07f8], %r7
	.word 0x8143e045  ! 867: MEMBAR	membar	#LoadLoad | #LoadStore | #Sync 
	.word 0xce6a0009  ! 868: LDSTUB_R	ldstub	%r7, [%r8 + %r9]
	.word 0xce5a0009  ! 869: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0x8143c000  ! 870: STBAR	stbar
	.word 0x8143c000  ! 871: STBAR	stbar
	.word 0xc2822390  ! 872: LDUWA_I	lduwa	[%r8, + 0x0390] %asi, %r1
	.word 0xc36a2a4c  ! 873: PREFETCH_I	prefetch	[%r8 + 0x0a4c], #one_read
	.word 0x8143e04a  ! 874: MEMBAR	membar	#StoreLoad | #StoreStore | #Sync 
	.word 0x8ed20009  ! 876: UMULcc_R	umulcc 	%r8, %r9, %r7
	.word 0xc44a270c  ! 877: LDSB_I	ldsb	[%r8 + 0x070c], %r2
	.word 0xccca1009  ! 878: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r6
	.word 0xceb21009  ! 879: STHA_R	stha	%r7, [%r8 + %r9] 0x80
	.word 0xc4ea1009  ! 880: LDSTUBA_R	ldstuba	%r2, [%r8 + %r9] 0x80
	.word 0xaa722e70  ! 881: UDIV_I	udiv 	%r8, 0x0e70, %r21
	.word 0x99220009  ! 882: MULScc_R	mulscc 	%r8, %r9, %r12
	.word 0x8143c000  ! 883: STBAR	stbar
	.word 0xcb222e2c  ! 884: STF_I	st	%f5, [0x0e2c, %r8]
	.word 0xfc520009  ! 885: LDSH_R	ldsh	[%r8 + %r9], %r30
	.word 0x89a208a9  ! 886: FSUBs	fsubs	%f8, %f9, %f4
	.word 0xc4ba1009  ! 887: STDA_R	stda	%r2, [%r8 + %r9] 0x80
	.word 0xc3ea2684  ! 888: PREFETCHA_I	prefetcha	[%r8, + 0x0684] %asi, #one_read
	.word 0x8143e072  ! 889: MEMBAR	membar	#StoreLoad | #Lookaside | #MemIssue | #Sync 
	.word 0x83220009  ! 891: MULScc_R	mulscc 	%r8, %r9, %r1
	.word 0x825228ac  ! 892: UMUL_I	umul 	%r8, 0x08ac, %r1
	.word 0xc2420009  ! 893: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xccb21009  ! 894: STHA_R	stha	%r6, [%r8 + %r9] 0x80
	.word 0xe8520009  ! 895: LDSH_R	ldsh	[%r8 + %r9], %r20
	.word 0x8ba20829  ! 896: FADDs	fadds	%f8, %f9, %f5
	.word 0xd6d2282c  ! 897: LDSHA_I	ldsha	[%r8, + 0x082c] %asi, %r11
	.word 0xcc7a0009  ! 898: SWAP_R	swap	%r6, [%r8 + %r9]
	.word 0x824a0009  ! 899: MULX_R	mulx 	%r8, %r9, %r1
	.word 0x8c5220c0  ! 900: UMUL_I	umul 	%r8, 0x00c0, %r6
	.word 0xe88a1009  ! 901: LDUBA_R	lduba	[%r8, %r9] 0x80, %r20
	.word 0xd4ba28b8  ! 902: STDA_I	stda	%r10, [%r8 + 0x08b8] %asi
	.word 0x8cd2260c  ! 903: UMULcc_I	umulcc 	%r8, 0x060c, %r6
	.word 0xf47a2458  ! 904: SWAP_I	swap	%r26, [%r8 + 0x0458]
	.word 0xc36a2e28  ! 905: PREFETCH_I	prefetch	[%r8 + 0x0e28], #one_read
	.word 0x8c6a24a0  ! 906: UDIVX_I	udivx 	%r8, 0x04a0, %r6
	.word 0xf86a0009  ! 907: LDSTUB_R	ldstub	%r28, [%r8 + %r9]
	.word 0x8ed20009  ! 908: UMULcc_R	umulcc 	%r8, %r9, %r7
	.word 0xc5e21009  ! 909: CASA_I	casa	[%r8] 0x80, %r9, %r2
	.word 0x12800004  ! 910: BNE	bne  	<label_0x4>
	.word 0x8143e05e  ! 911: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0x12800008  ! 912: BNE	bne  	<label_0x8>
	.word 0xaa7a2fb8  ! 913: SDIV_I	sdiv 	%r8, 0x0fb8, %r21
	.word 0xf0ba2280  ! 914: STDA_I	stda	%r24, [%r8 + 0x0280] %asi
	.word 0xc6520009  ! 915: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xe89a23e8  ! 916: LDDA_I	ldda	[%r8, + 0x03e8] %asi, %r20
	.word 0x8e7a0009  ! 917: SDIV_R	sdiv 	%r8, %r9, %r7
	.word 0x8143e014  ! 918: MEMBAR	membar	#LoadStore | #Lookaside 
	.word 0xccea24dc  ! 919: LDSTUBA_I	ldstuba	%r6, [%r8 + 0x04dc] %asi
	.word 0xc8a22440  ! 920: STWA_I	stwa	%r4, [%r8 + 0x0440] %asi
	.word 0xc5f22009  ! 921: CASXA_R	casxa	[%r8]%asi, %r9, %r2
	.word 0x06c20004  ! 922: BRLZ	brlz  ,nt	%8,<label_0x20004>
	.word 0xc36a22d0  ! 923: PREFETCH_I	prefetch	[%r8 + 0x02d0], #one_read
	.word 0x0ec20008  ! 924: BRGEZ	brgez  ,nt	%8,<label_0x20008>
	.word 0xcc520009  ! 925: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xdea21009  ! 926: STWA_R	stwa	%r15, [%r8 + %r9] 0x80
	.word 0x867a0009  ! 927: SDIV_R	sdiv 	%r8, %r9, %r3
	.word 0xc8fa1009  ! 928: SWAPA_R	swapa	%r4, [%r8 + %r9] 0x80
	.word 0xca522818  ! 929: LDSH_I	ldsh	[%r8 + 0x0818], %r5
	.word 0xec9a1009  ! 930: LDDA_R	ldda	[%r8, %r9] 0x80, %r22
	.word 0x18800004  ! 931: BGU	bgu  	<label_0x4>
	.word 0xde4a0009  ! 932: LDSB_R	ldsb	[%r8 + %r9], %r15
	.word 0xac520009  ! 933: UMUL_R	umul 	%r8, %r9, %r22
	.word 0xf49a2a50  ! 934: LDDA_I	ldda	[%r8, + 0x0a50] %asi, %r26
	.word 0xa1a20929  ! 935: FMULs	fmuls	%f8, %f9, %f16
	.word 0xc36a2860  ! 936: PREFETCH_I	prefetch	[%r8 + 0x0860], #one_read
	.word 0xfcaa1009  ! 937: STBA_R	stba	%r30, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 938: STBAR	stbar
	.word 0xca6a2fb8  ! 939: LDSTUB_I	ldstub	%r5, [%r8 + 0x0fb8]
	.word 0xc46a0009  ! 940: LDSTUB_R	ldstub	%r2, [%r8 + %r9]
	.word 0xb2720009  ! 941: UDIV_R	udiv 	%r8, %r9, %r25
	.word 0xceaa20a8  ! 942: STBA_I	stba	%r7, [%r8 + 0x00a8] %asi
	.word 0xc46a0009  ! 943: LDSTUB_R	ldstub	%r2, [%r8 + %r9]
	.word 0x8143e065  ! 944: MEMBAR	membar	#LoadLoad | #LoadStore | #MemIssue | #Sync 
	.word 0x8143c000  ! 945: STBAR	stbar
	.word 0xca422774  ! 946: LDSW_I	ldsw	[%r8 + 0x0774], %r5
	.word 0x82d2219c  ! 947: UMULcc_I	umulcc 	%r8, 0x019c, %r1
	.word 0xc5220009  ! 948: STF_R	st	%f2, [%r9, %r8]
	.word 0xd8fa2234  ! 949: SWAPA_I	swapa	%r12, [%r8 + 0x0234] %asi
	.word 0x8143e05d  ! 950: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0x83a20829  ! 951: FADDs	fadds	%f8, %f9, %f1
	.word 0x844a2604  ! 952: MULX_I	mulx 	%r8, 0x0604, %r2
	.word 0xc8420009  ! 953: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xef3a0009  ! 954: STDF_R	std	%f23, [%r9, %r8]
	.word 0xc3ea23d0  ! 955: PREFETCHA_I	prefetcha	[%r8, + 0x03d0] %asi, #one_read
	.word 0x8143c000  ! 956: STBAR	stbar
	.word 0x8fa20929  ! 957: FMULs	fmuls	%f8, %f9, %f7
	.word 0xce922920  ! 958: LDUHA_I	lduha	[%r8, + 0x0920] %asi, %r7
	.word 0x82f20009  ! 959: UDIVcc_R	udivcc 	%r8, %r9, %r1
	.word 0xf8aa27e8  ! 960: STBA_I	stba	%r28, [%r8 + 0x07e8] %asi
	.word 0xc81a0009  ! 961: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x8ba209a9  ! 962: FDIVs	fdivs	%f8, %f9, %f5
	.word 0xb96a2054  ! 963: SDIVX_I	sdivx	%r8, 0x0054, %r28
	.word 0x82720009  ! 964: UDIV_R	udiv 	%r8, %r9, %r1
	.word 0xc6aa1009  ! 965: STBA_R	stba	%r3, [%r8 + %r9] 0x80
	.word 0xc53a2eb8  ! 966: STDF_I	std	%f2, [0x0eb8, %r8]
	.word 0xcd3a0009  ! 967: STDF_R	std	%f6, [%r9, %r8]
	.word 0xd89a1009  ! 968: LDDA_R	ldda	[%r8, %r9] 0x80, %r12
	.word 0xa6da0009  ! 969: SMULcc_R	smulcc 	%r8, %r9, %r19
	.word 0xec1a0009  ! 970: LDD_R	ldd	[%r8 + %r9], %r22
	.word 0x2aca0004  ! 971: BRNZ	brnz,a,pt	%8,<label_0xa0004>
	.word 0xd85a0009  ! 972: LDX_R	ldx	[%r8 + %r9], %r12
	.word 0xcc7a28c8  ! 973: SWAP_I	swap	%r6, [%r8 + 0x08c8]
	.word 0xc2fa2dc4  ! 974: SWAPA_I	swapa	%r1, [%r8 + 0x0dc4] %asi
	.word 0x8af2277c  ! 975: UDIVcc_I	udivcc 	%r8, 0x077c, %r5
	.word 0xafa20929  ! 976: FMULs	fmuls	%f8, %f9, %f23
	.word 0xbe520009  ! 977: UMUL_R	umul 	%r8, %r9, %r31
	.word 0xc45a2a50  ! 978: LDX_I	ldx	[%r8 + 0x0a50], %r2
	.word 0xc3ea235c  ! 979: PREFETCHA_I	prefetcha	[%r8, + 0x035c] %asi, #one_read
	.word 0xe84229d8  ! 980: LDSW_I	ldsw	[%r8 + 0x09d8], %r20
	.word 0x847a27c0  ! 981: SDIV_I	sdiv 	%r8, 0x07c0, %r2
	.word 0xa5a20929  ! 982: FMULs	fmuls	%f8, %f9, %f18
	.word 0x9c7a0009  ! 983: SDIV_R	sdiv 	%r8, %r9, %r14
	.word 0xcaa22368  ! 984: STWA_I	stwa	%r5, [%r8 + 0x0368] %asi
	.word 0x8a722d08  ! 985: UDIV_I	udiv 	%r8, 0x0d08, %r5
	.word 0xecba28d0  ! 986: STDA_I	stda	%r22, [%r8 + 0x08d0] %asi
	.word 0x8143e01e  ! 987: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside 
	.word 0x02ca0008  ! 988: BRZ	brz  ,pt	%8,<label_0xa0008>
	.word 0xcf3a0009  ! 989: STDF_R	std	%f7, [%r9, %r8]
	.word 0xeb3a25d8  ! 990: STDF_I	std	%f21, [0x05d8, %r8]
	.word 0x30800008  ! 991: BA	ba,a	<label_0x8>
	.word 0xb07a25f4  ! 992: SDIV_I	sdiv 	%r8, 0x05f4, %r24
	.word 0x2e800008  ! 993: BVS	bvs,a	<label_0x8>
	.word 0xf5e22009  ! 994: CASA_R	casa	[%r8] %asi, %r9, %r26
	.word 0x8143e01c  ! 995: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside 
	.word 0xc2522b4c  ! 996: LDSH_I	ldsh	[%r8 + 0x0b4c], %r1
	.word 0x08800008  ! 997: BLEU	bleu  	<label_0x8>
	.word 0xc3ea2068  ! 998: PREFETCHA_I	prefetcha	[%r8, + 0x0068] %asi, #one_read
	.word 0xe0aa21b8  ! 999: STBA_I	stba	%r16, [%r8 + 0x01b8] %asi
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
        setx  0x27bc08ff0498a67a, %g1, %r0
        setx  0x1a82c08f9487aba4, %g1, %r1
        setx  0x719bf7997150e07f, %g1, %r2
        setx  0x492e9af8df2d5c96, %g1, %r3
        setx  0xa13b11e678a7269a, %g1, %r4
        setx  0x3f77a6e5a02265e0, %g1, %r5
        setx  0x5ee3211a5341ba28, %g1, %r6
        setx  0x322a62be19914373, %g1, %r7
        setx  0xed0d6d330287e0e1, %g1, %r10
        setx  0x5d564d6899a23479, %g1, %r11
        setx  0xe23c95049e5dd7cd, %g1, %r12
        setx  0x1a31476faa6acb13, %g1, %r13
        setx  0x309bb43237b21323, %g1, %r14
        setx  0xcff6ef5ddf5b248d, %g1, %r15
        setx  0x6bd756443b39b461, %g1, %r16
        setx  0x257442ae91f56c94, %g1, %r17
        setx  0x339554e4817226be, %g1, %r18
        setx  0x91b9a16645bac5dc, %g1, %r19
        setx  0xddb9381db43f07f8, %g1, %r20
        setx  0x680553e6abb79193, %g1, %r21
        setx  0x267867df6c22af41, %g1, %r22
        setx  0xd5216cb74d7ee01b, %g1, %r23
        setx  0x5a36ea2b7f01dd46, %g1, %r24
        setx  0x003d8e282ff2386b, %g1, %r25
        setx  0x6ce292695465e72e, %g1, %r26
        setx  0x5ad54d9d86f99960, %g1, %r27
        setx  0xe8090556f371f91c, %g1, %r28
        setx  0xef11dae943e6f512, %g1, %r29
        setx  0x6ee4e0390970e0cd, %g1, %r30
        setx  0x744b06ee326b49bf, %g1, %r31
	.word 0x8ba20829  ! 5: FADDs	fadds	%f8, %f9, %f5
	.word 0x8b220009  ! 6: MULScc_R	mulscc 	%r8, %r9, %r5
	.word 0xca520009  ! 7: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0x8143c000  ! 8: STBAR	stbar
	.word 0xcde22009  ! 9: CASA_R	casa	[%r8] %asi, %r9, %r6
	.word 0xb45a0009  ! 10: SMUL_R	smul 	%r8, %r9, %r26
	.word 0x28800008  ! 11: BLEU	bleu,a	<label_0x8>
	.word 0xc8ca2648  ! 12: LDSBA_I	ldsba	[%r8, + 0x0648] %asi, %r4
	.word 0xc7222c58  ! 13: STF_I	st	%f3, [0x0c58, %r8]
	.word 0xe0aa1009  ! 14: STBA_R	stba	%r16, [%r8 + %r9] 0x80
	.word 0xc7f22009  ! 15: CASXA_R	casxa	[%r8]%asi, %r9, %r3
	.word 0x2aca0004  ! 16: BRNZ	brnz,a,pt	%8,<label_0xa0004>
	.word 0x16800004  ! 17: BGE	bge  	<label_0x4>
	.word 0x84f22a98  ! 18: UDIVcc_I	udivcc 	%r8, 0x0a98, %r2
	.word 0x85220009  ! 19: MULScc_R	mulscc 	%r8, %r9, %r2
	.word 0xfdf21009  ! 20: CASXA_I	casxa	[%r8] 0x80, %r9, %r30
	.word 0xc8aa1009  ! 21: STBA_R	stba	%r4, [%r8 + %r9] 0x80
	.word 0xc3ea2c80  ! 22: PREFETCHA_I	prefetcha	[%r8, + 0x0c80] %asi, #one_read
	.word 0x1c800008  ! 23: BPOS	bpos  	<label_0x8>
	.word 0xf3f21009  ! 24: CASXA_I	casxa	[%r8] 0x80, %r9, %r25
	.word 0xb9a20829  ! 25: FADDs	fadds	%f8, %f9, %f28
	.word 0xc41224b4  ! 26: LDUH_I	lduh	[%r8 + 0x04b4], %r2
	.word 0xf0a22bf8  ! 27: STWA_I	stwa	%r24, [%r8 + 0x0bf8] %asi
	.word 0xcde22009  ! 28: CASA_R	casa	[%r8] %asi, %r9, %r6
	.word 0xc3e21009  ! 29: CASA_I	casa	[%r8] 0x80, %r9, %r1
	.word 0x846a0009  ! 30: UDIVX_R	udivx 	%r8, %r9, %r2
	.word 0x876a2700  ! 31: SDIVX_I	sdivx	%r8, 0x0700, %r3
	.word 0x02c20004  ! 32: BRZ	brz  ,nt	%8,<label_0x20004>
	.word 0xcada1009  ! 33: LDXA_R	ldxa	[%r8, %r9] 0x80, %r5
	.word 0xcf222c44  ! 34: STF_I	st	%f7, [0x0c44, %r8]
	.word 0x3e800004  ! 35: BVC	bvc,a	<label_0x4>
	.word 0x826a0009  ! 36: UDIVX_R	udivx 	%r8, %r9, %r1
	.word 0x8143e02c  ! 37: MEMBAR	membar	#LoadStore | #StoreStore | #MemIssue 
	.word 0xc8ea1009  ! 38: LDSTUBA_R	ldstuba	%r4, [%r8 + %r9] 0x80
	.word 0xc66a0009  ! 39: LDSTUB_R	ldstub	%r3, [%r8 + %r9]
	.word 0x8a522840  ! 40: UMUL_I	umul 	%r8, 0x0840, %r5
	.word 0xc3ea255c  ! 41: PREFETCHA_I	prefetcha	[%r8, + 0x055c] %asi, #one_read
	.word 0x28800004  ! 42: BLEU	bleu,a	<label_0x4>
	.word 0xf46a292c  ! 43: LDSTUB_I	ldstub	%r26, [%r8 + 0x092c]
	.word 0xc8b22a9c  ! 44: STHA_I	stha	%r4, [%r8 + 0x0a9c] %asi
	.word 0x82d22104  ! 45: UMULcc_I	umulcc 	%r8, 0x0104, %r1
	.word 0x8143c000  ! 46: STBAR	stbar
	.word 0xf002271c  ! 47: LDUW_I	lduw	[%r8 + 0x071c], %r24
	.word 0xc73a20c0  ! 48: STDF_I	std	%f3, [0x00c0, %r8]
	.word 0xc4022384  ! 49: LDUW_I	lduw	[%r8 + 0x0384], %r2
	.word 0xce7a0009  ! 51: SWAP_R	swap	%r7, [%r8 + %r9]
	.word 0x8143c000  ! 52: STBAR	stbar
	.word 0xc9222ae4  ! 53: STF_I	st	%f4, [0x0ae4, %r8]
	.word 0xc64a0009  ! 54: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0x82d221b8  ! 55: UMULcc_I	umulcc 	%r8, 0x01b8, %r1
	.word 0xc36a2424  ! 56: PREFETCH_I	prefetch	[%r8 + 0x0424], #one_read
	.word 0xbe6a2eb8  ! 57: UDIVX_I	udivx 	%r8, 0x0eb8, %r31
	.word 0xf8ca2c44  ! 58: LDSBA_I	ldsba	[%r8, + 0x0c44] %asi, %r28
	.word 0xda5a2a70  ! 59: LDX_I	ldx	[%r8 + 0x0a70], %r13
	.word 0xccb21009  ! 61: STHA_R	stha	%r6, [%r8 + %r9] 0x80
	.word 0x26ca0004  ! 62: BRLZ	brlz,a,pt	%8,<label_0xa0004>
	.word 0xa6d20009  ! 63: UMULcc_R	umulcc 	%r8, %r9, %r19
	.word 0xafa20929  ! 64: FMULs	fmuls	%f8, %f9, %f23
	.word 0xc3222594  ! 65: STF_I	st	%f1, [0x0594, %r8]
	.word 0xaba208a9  ! 66: FSUBs	fsubs	%f8, %f9, %f21
	.word 0x87222070  ! 67: MULScc_I	mulscc 	%r8, 0x0070, %r3
	.word 0x02800004  ! 68: BE	be  	<label_0x4>
	.word 0x83a20829  ! 69: FADDs	fadds	%f8, %f9, %f1
	.word 0x89222f7c  ! 70: MULScc_I	mulscc 	%r8, 0x0f7c, %r4
	.word 0xceea1009  ! 71: LDSTUBA_R	ldstuba	%r7, [%r8 + %r9] 0x80
	.word 0xc87a0009  ! 72: SWAP_R	swap	%r4, [%r8 + %r9]
	.word 0xa5a20929  ! 73: FMULs	fmuls	%f8, %f9, %f18
	.word 0xc86a2bc8  ! 74: LDSTUB_I	ldstub	%r4, [%r8 + 0x0bc8]
	.word 0xc27a0009  ! 75: SWAP_R	swap	%r1, [%r8 + %r9]
	.word 0x885a29bc  ! 76: SMUL_I	smul 	%r8, 0x09bc, %r4
	.word 0x87a209a9  ! 77: FDIVs	fdivs	%f8, %f9, %f3
	.word 0xdfe22009  ! 78: CASA_R	casa	[%r8] %asi, %r9, %r15
	.word 0xb96a24c8  ! 79: SDIVX_I	sdivx	%r8, 0x04c8, %r28
	.word 0xfc1a2658  ! 80: LDD_I	ldd	[%r8 + 0x0658], %r30
	.word 0x8a5a0009  ! 81: SMUL_R	smul 	%r8, %r9, %r5
	.word 0x40000004  ! 82: CALL	call	disp30_4
	.word 0x8a6a0009  ! 83: UDIVX_R	udivx 	%r8, %r9, %r5
	.word 0x9cf20009  ! 84: UDIVcc_R	udivcc 	%r8, %r9, %r14
	.word 0xf8921009  ! 85: LDUHA_R	lduha	[%r8, %r9] 0x80, %r28
	.word 0xc36a2e58  ! 86: PREFETCH_I	prefetch	[%r8 + 0x0e58], #one_read
	.word 0xcdf21009  ! 87: CASXA_I	casxa	[%r8] 0x80, %r9, %r6
	.word 0xc66a2494  ! 88: LDSTUB_I	ldstub	%r3, [%r8 + 0x0494]
	.word 0xceaa1009  ! 89: STBA_R	stba	%r7, [%r8 + %r9] 0x80
	.word 0x865a0009  ! 90: SMUL_R	smul 	%r8, %r9, %r3
	.word 0x8143e014  ! 91: MEMBAR	membar	#LoadStore | #Lookaside 
	.word 0xb96a0009  ! 92: SDIVX_R	sdivx	%r8, %r9, %r28
	.word 0xc65a2218  ! 93: LDX_I	ldx	[%r8 + 0x0218], %r3
	.word 0x8a4a0009  ! 94: MULX_R	mulx 	%r8, %r9, %r5
	.word 0xc6a225a0  ! 96: STWA_I	stwa	%r3, [%r8 + 0x05a0] %asi
	.word 0x865a2e2c  ! 98: SMUL_I	smul 	%r8, 0x0e2c, %r3
	.word 0xbda209a9  ! 99: FDIVs	fdivs	%f8, %f9, %f30
	.word 0xc28a215c  ! 100: LDUBA_I	lduba	[%r8, + 0x015c] %asi, %r1
	.word 0xcad22398  ! 101: LDSHA_I	ldsha	[%r8, + 0x0398] %asi, %r5
	.word 0xce0a0009  ! 102: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0x8cd221ec  ! 103: UMULcc_I	umulcc 	%r8, 0x01ec, %r6
	.word 0x886a22f0  ! 104: UDIVX_I	udivx 	%r8, 0x02f0, %r4
	.word 0xbc722d80  ! 105: UDIV_I	udiv 	%r8, 0x0d80, %r30
	.word 0xc6ca2c90  ! 106: LDSBA_I	ldsba	[%r8, + 0x0c90] %asi, %r3
	.word 0x876a2540  ! 107: SDIVX_I	sdivx	%r8, 0x0540, %r3
	.word 0x866a0009  ! 108: UDIVX_R	udivx 	%r8, %r9, %r3
	.word 0x2a800004  ! 109: BCS	bcs,a	<label_0x4>
	.word 0x825a0009  ! 110: SMUL_R	smul 	%r8, %r9, %r1
	.word 0xced21009  ! 111: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r7
	.word 0xe4ba1009  ! 112: STDA_R	stda	%r18, [%r8 + %r9] 0x80
	.word 0x28800004  ! 113: BLEU	bleu,a	<label_0x4>
	.word 0x8143e040  ! 114: MEMBAR	membar	#Sync 
	.word 0xc3f22009  ! 115: CASXA_R	casxa	[%r8]%asi, %r9, %r1
	.word 0xcdf22009  ! 116: CASXA_R	casxa	[%r8]%asi, %r9, %r6
	.word 0xc2a21009  ! 117: STWA_R	stwa	%r1, [%r8 + %r9] 0x80
	.word 0x867a0009  ! 118: SDIV_R	sdiv 	%r8, %r9, %r3
	.word 0x8143e06b  ! 119: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #MemIssue | #Sync 
	.word 0xc4da2098  ! 120: LDXA_I	ldxa	[%r8, + 0x0098] %asi, %r2
	.word 0xc3ea2e18  ! 121: PREFETCHA_I	prefetcha	[%r8, + 0x0e18] %asi, #one_read
	.word 0x3c800008  ! 122: BPOS	bpos,a	<label_0x8>
	.word 0xc4520009  ! 123: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xcc82242c  ! 124: LDUWA_I	lduwa	[%r8, + 0x042c] %asi, %r6
	.word 0x8143c000  ! 125: STBAR	stbar
	.word 0x8e5a23f0  ! 126: SMUL_I	smul 	%r8, 0x03f0, %r7
	.word 0xc26a2f2c  ! 127: LDSTUB_I	ldstub	%r1, [%r8 + 0x0f2c]
	.word 0x3e800004  ! 129: BVC	bvc,a	<label_0x4>
	.word 0xd4a22d98  ! 130: STWA_I	stwa	%r10, [%r8 + 0x0d98] %asi
	.word 0x8a6a2718  ! 134: UDIVX_I	udivx 	%r8, 0x0718, %r5
	.word 0xc20a28b0  ! 135: LDUB_I	ldub	[%r8 + 0x08b0], %r1
	.word 0xc8020009  ! 136: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xc4f21009  ! 137: STXA_R	stxa	%r2, [%r8 + %r9] 0x80
	.word 0xc47a0009  ! 138: SWAP_R	swap	%r2, [%r8 + %r9]
	.word 0x8ba20829  ! 139: FADDs	fadds	%f8, %f9, %f5
	.word 0xc6da2c50  ! 140: LDXA_I	ldxa	[%r8, + 0x0c50] %asi, %r3
	.word 0xa6d22030  ! 141: UMULcc_I	umulcc 	%r8, 0x0030, %r19
	.word 0x8143e02e  ! 142: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #MemIssue 
	.word 0x26800004  ! 143: BL	bl,a	<label_0x4>
	.word 0xc3ea25b0  ! 144: PREFETCHA_I	prefetcha	[%r8, + 0x05b0] %asi, #one_read
	.word 0x08800004  ! 145: BLEU	bleu  	<label_0x4>
	.word 0x9a720009  ! 146: UDIV_R	udiv 	%r8, %r9, %r13
	.word 0x8143c000  ! 147: STBAR	stbar
	.word 0x86f22704  ! 148: UDIVcc_I	udivcc 	%r8, 0x0704, %r3
	.word 0x9fa209a9  ! 149: FDIVs	fdivs	%f8, %f9, %f15
	.word 0xf2aa213c  ! 150: STBA_I	stba	%r25, [%r8 + 0x013c] %asi
	.word 0xddf21009  ! 151: CASXA_I	casxa	[%r8] 0x80, %r9, %r14
	.word 0xfc0a22d0  ! 152: LDUB_I	ldub	[%r8 + 0x02d0], %r30
	.word 0x896a0009  ! 153: SDIVX_R	sdivx	%r8, %r9, %r4
	.word 0xc9f22009  ! 154: CASXA_R	casxa	[%r8]%asi, %r9, %r4
	.word 0x83220009  ! 155: MULScc_R	mulscc 	%r8, %r9, %r1
	.word 0xc36a2410  ! 156: PREFETCH_I	prefetch	[%r8 + 0x0410], #one_read
	.word 0x8cda2dac  ! 157: SMULcc_I	smulcc 	%r8, 0x0dac, %r6
	.word 0x20800004  ! 158: BN	bn,a	<label_0x4>
	.word 0xc53a0009  ! 159: STDF_R	std	%f2, [%r9, %r8]
	.word 0xf73a2278  ! 160: STDF_I	std	%f27, [0x0278, %r8]
	.word 0xfa0a2f34  ! 161: LDUB_I	ldub	[%r8 + 0x0f34], %r29
	.word 0x8fa208a9  ! 162: FSUBs	fsubs	%f8, %f9, %f7
	.word 0xd6b21009  ! 163: STHA_R	stha	%r11, [%r8 + %r9] 0x80
	.word 0x8143e05e  ! 164: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0xcafa1009  ! 165: SWAPA_R	swapa	%r5, [%r8 + %r9] 0x80
	.word 0xc73a2ea8  ! 166: STDF_I	std	%f3, [0x0ea8, %r8]
	.word 0xcc522d80  ! 167: LDSH_I	ldsh	[%r8 + 0x0d80], %r6
	.word 0x824a0009  ! 168: MULX_R	mulx 	%r8, %r9, %r1
	.word 0xc3220009  ! 169: STF_R	st	%f1, [%r9, %r8]
	.word 0xc3ea2828  ! 170: PREFETCHA_I	prefetcha	[%r8, + 0x0828] %asi, #one_read
	.word 0x3a800004  ! 171: BCC	bcc,a	<label_0x4>
	.word 0xc81a2db8  ! 173: LDD_I	ldd	[%r8 + 0x0db8], %r4
	.word 0xd6a22504  ! 174: STWA_I	stwa	%r11, [%r8 + 0x0504] %asi
	.word 0x18800004  ! 175: BGU	bgu  	<label_0x4>
	.word 0xd89a1009  ! 176: LDDA_R	ldda	[%r8, %r9] 0x80, %r12
	.word 0x84f2299c  ! 177: UDIVcc_I	udivcc 	%r8, 0x099c, %r2
	.word 0xd8a21009  ! 179: STWA_R	stwa	%r12, [%r8 + %r9] 0x80
	.word 0x8143e060  ! 180: MEMBAR	membar	#MemIssue | #Sync 
	.word 0xca0a2b7c  ! 181: LDUB_I	ldub	[%r8 + 0x0b7c], %r5
	.word 0x8143e015  ! 182: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside 
	.word 0x8143c000  ! 183: STBAR	stbar
	.word 0xcd3a0009  ! 184: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc4ba2fa8  ! 185: STDA_I	stda	%r2, [%r8 + 0x0fa8] %asi
	.word 0xcc1a2470  ! 186: LDD_I	ldd	[%r8 + 0x0470], %r6
	.word 0xfdf22009  ! 187: CASXA_R	casxa	[%r8]%asi, %r9, %r30
	.word 0x8143e03d  ! 188: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0x8b220009  ! 189: MULScc_R	mulscc 	%r8, %r9, %r5
	.word 0xc36a230c  ! 190: PREFETCH_I	prefetch	[%r8 + 0x030c], #one_read
	.word 0x16800004  ! 191: BGE	bge  	<label_0x4>
	.word 0xc8ca2a04  ! 192: LDSBA_I	ldsba	[%r8, + 0x0a04] %asi, %r4
	.word 0xc5f22009  ! 193: CASXA_R	casxa	[%r8]%asi, %r9, %r2
	.word 0x8c722910  ! 195: UDIV_I	udiv 	%r8, 0x0910, %r6
	.word 0xf93a0009  ! 196: STDF_R	std	%f28, [%r9, %r8]
	.word 0xc2120009  ! 197: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0x40000008  ! 198: CALL	call	disp30_8
	.word 0xb96a20f8  ! 199: SDIVX_I	sdivx	%r8, 0x00f8, %r28
	.word 0xc6aa221c  ! 200: STBA_I	stba	%r3, [%r8 + 0x021c] %asi
	.word 0x0e800004  ! 201: BVS	bvs  	<label_0x4>
	.word 0xc2f22438  ! 202: STXA_I	stxa	%r1, [%r8 + 0x0438] %asi
	.word 0xb04a0009  ! 203: MULX_R	mulx 	%r8, %r9, %r24
	.word 0xc25222c0  ! 204: LDSH_I	ldsh	[%r8 + 0x02c0], %r1
	.word 0x8fa208a9  ! 205: FSUBs	fsubs	%f8, %f9, %f7
	.word 0xe0aa1009  ! 206: STBA_R	stba	%r16, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 207: STBAR	stbar
	.word 0xfe7a2b2c  ! 208: SWAP_I	swap	%r31, [%r8 + 0x0b2c]
	.word 0x3e800004  ! 209: BVC	bvc,a	<label_0x4>
	.word 0x8c4a23b8  ! 210: MULX_I	mulx 	%r8, 0x03b8, %r6
	.word 0x08800008  ! 211: BLEU	bleu  	<label_0x8>
	.word 0x2ec20004  ! 212: BRGEZ	brgez,a,nt	%8,<label_0x20004>
	.word 0xfe122dd4  ! 213: LDUH_I	lduh	[%r8 + 0x0dd4], %r31
	.word 0x8143e060  ! 214: MEMBAR	membar	#MemIssue | #Sync 
	.word 0xbaf20009  ! 215: UDIVcc_R	udivcc 	%r8, %r9, %r29
	.word 0xc7e22009  ! 216: CASA_R	casa	[%r8] %asi, %r9, %r3
	.word 0x0cc20004  ! 217: BRGZ	brgz  ,nt	%8,<label_0x20004>
	.word 0x8e6a0009  ! 218: UDIVX_R	udivx 	%r8, %r9, %r7
	.word 0xa4d20009  ! 219: UMULcc_R	umulcc 	%r8, %r9, %r18
	.word 0xbe7a25b0  ! 220: SDIV_I	sdiv 	%r8, 0x05b0, %r31
	.word 0xc3ea2e34  ! 221: PREFETCHA_I	prefetcha	[%r8, + 0x0e34] %asi, #one_read
	.word 0x864a0009  ! 222: MULX_R	mulx 	%r8, %r9, %r3
	.word 0xeafa1009  ! 223: SWAPA_R	swapa	%r21, [%r8 + %r9] 0x80
	.word 0x8143e007  ! 224: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore 
	.word 0x8143e06c  ! 225: MEMBAR	membar	#LoadStore | #StoreStore | #MemIssue | #Sync 
	.word 0xcd3a27d0  ! 226: STDF_I	std	%f6, [0x07d0, %r8]
	.word 0xfde21009  ! 227: CASA_I	casa	[%r8] 0x80, %r9, %r30
	.word 0x24ca0004  ! 228: BRLEZ	brlez,a,pt	%8,<label_0xa0004>
	.word 0xd89a1009  ! 229: LDDA_R	ldda	[%r8, %r9] 0x80, %r12
	.word 0xc9e22009  ! 230: CASA_R	casa	[%r8] %asi, %r9, %r4
	.word 0x856a21cc  ! 232: SDIVX_I	sdivx	%r8, 0x01cc, %r2
	.word 0xc64a2268  ! 235: LDSB_I	ldsb	[%r8 + 0x0268], %r3
	.word 0x88520009  ! 236: UMUL_R	umul 	%r8, %r9, %r4
	.word 0xbc520009  ! 237: UMUL_R	umul 	%r8, %r9, %r30
	.word 0xc36a2340  ! 238: PREFETCH_I	prefetch	[%r8 + 0x0340], #one_read
	.word 0x8143e00e  ! 239: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore 
	.word 0xc9e22009  ! 240: CASA_R	casa	[%r8] %asi, %r9, %r4
	.word 0xc2f21009  ! 241: STXA_R	stxa	%r1, [%r8 + %r9] 0x80
	.word 0xf4ba2568  ! 243: STDA_I	stda	%r26, [%r8 + 0x0568] %asi
	.word 0x826a2c40  ! 244: UDIVX_I	udivx 	%r8, 0x0c40, %r1
	.word 0x40000004  ! 245: CALL	call	disp30_4
	.word 0xc7222090  ! 246: STF_I	st	%f3, [0x0090, %r8]
	.word 0x8e6a2d24  ! 247: UDIVX_I	udivx 	%r8, 0x0d24, %r7
	.word 0xd452218c  ! 248: LDSH_I	ldsh	[%r8 + 0x018c], %r10
	.word 0x8ba208a9  ! 249: FSUBs	fsubs	%f8, %f9, %f5
	.word 0x8143e061  ! 250: MEMBAR	membar	#LoadLoad | #MemIssue | #Sync 
	.word 0x8cfa0009  ! 251: SDIVcc_R	sdivcc 	%r8, %r9, %r6
	.word 0x845a0009  ! 252: SMUL_R	smul 	%r8, %r9, %r2
	.word 0xf93a0009  ! 253: STDF_R	std	%f28, [%r9, %r8]
	.word 0xee4a0009  ! 254: LDSB_R	ldsb	[%r8 + %r9], %r23
	.word 0xcaca2dd8  ! 255: LDSBA_I	ldsba	[%r8, + 0x0dd8] %asi, %r5
	.word 0xc3ea2ab8  ! 256: PREFETCHA_I	prefetcha	[%r8, + 0x0ab8] %asi, #one_read
	.word 0xf89a1009  ! 257: LDDA_R	ldda	[%r8, %r9] 0x80, %r28
	.word 0xc6b22910  ! 258: STHA_I	stha	%r3, [%r8 + 0x0910] %asi
	.word 0xef3a20d8  ! 259: STDF_I	std	%f23, [0x00d8, %r8]
	.word 0xdd3a28f8  ! 260: STDF_I	std	%f14, [0x08f8, %r8]
	.word 0x8143e009  ! 261: MEMBAR	membar	#LoadLoad | #StoreStore 
	.word 0x8a5a2eb4  ! 262: SMUL_I	smul 	%r8, 0x0eb4, %r5
	.word 0xccb21009  ! 263: STHA_R	stha	%r6, [%r8 + %r9] 0x80
	.word 0x20800004  ! 264: BN	bn,a	<label_0x4>
	.word 0xf4aa2348  ! 265: STBA_I	stba	%r26, [%r8 + 0x0348] %asi
	.word 0x1e800008  ! 267: BVC	bvc  	<label_0x8>
	.word 0xce921009  ! 268: LDUHA_R	lduha	[%r8, %r9] 0x80, %r7
	.word 0x99a20829  ! 269: FADDs	fadds	%f8, %f9, %f12
	.word 0x89220009  ! 270: MULScc_R	mulscc 	%r8, %r9, %r4
	.word 0xfcba1009  ! 271: STDA_R	stda	%r30, [%r8 + %r9] 0x80
	.word 0x10800008  ! 272: BA	ba  	<label_0x8>
	.word 0xb2f22398  ! 273: UDIVcc_I	udivcc 	%r8, 0x0398, %r25
	.word 0xf6a21009  ! 274: STWA_R	stwa	%r27, [%r8 + %r9] 0x80
	.word 0xbad20009  ! 275: UMULcc_R	umulcc 	%r8, %r9, %r29
	.word 0xf9222fb4  ! 276: STF_I	st	%f28, [0x0fb4, %r8]
	.word 0xe5e22009  ! 277: CASA_R	casa	[%r8] %asi, %r9, %r18
	.word 0xe04a0009  ! 278: LDSB_R	ldsb	[%r8 + %r9], %r16
	.word 0xc9f22009  ! 279: CASXA_R	casxa	[%r8]%asi, %r9, %r4
	.word 0xcd220009  ! 280: STF_R	st	%f6, [%r9, %r8]
	.word 0xc3ea2e78  ! 281: PREFETCHA_I	prefetcha	[%r8, + 0x0e78] %asi, #one_read
	.word 0xee922bc4  ! 282: LDUHA_I	lduha	[%r8, + 0x0bc4] %asi, %r23
	.word 0x9ef20009  ! 283: UDIVcc_R	udivcc 	%r8, %r9, %r15
	.word 0xd89a2c08  ! 284: LDDA_I	ldda	[%r8, + 0x0c08] %asi, %r12
	.word 0xcaf21009  ! 285: STXA_R	stxa	%r5, [%r8 + %r9] 0x80
	.word 0x85a209a9  ! 288: FDIVs	fdivs	%f8, %f9, %f2
	.word 0xab6a0009  ! 290: SDIVX_R	sdivx	%r8, %r9, %r21
	.word 0xe40a2fa8  ! 291: LDUB_I	ldub	[%r8 + 0x0fa8], %r18
	.word 0xc6da23e8  ! 292: LDXA_I	ldxa	[%r8, + 0x03e8] %asi, %r3
	.word 0xc45a0009  ! 293: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xc9f22009  ! 294: CASXA_R	casxa	[%r8]%asi, %r9, %r4
	.word 0x876a2d54  ! 295: SDIVX_I	sdivx	%r8, 0x0d54, %r3
	.word 0x8143e033  ! 296: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside | #MemIssue 
	.word 0xc36a2dec  ! 297: PREFETCH_I	prefetch	[%r8 + 0x0dec], #one_read
	.word 0xa0d221f4  ! 298: UMULcc_I	umulcc 	%r8, 0x01f4, %r16
	.word 0xcbe21009  ! 299: CASA_I	casa	[%r8] 0x80, %r9, %r5
	.word 0x8143c000  ! 300: STBAR	stbar
	.word 0xd6821009  ! 301: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r11
	.word 0xc48a1009  ! 302: LDUBA_R	lduba	[%r8, %r9] 0x80, %r2
	.word 0x85a208a9  ! 304: FSUBs	fsubs	%f8, %f9, %f2
	.word 0x8c6a0009  ! 305: UDIVX_R	udivx 	%r8, %r9, %r6
	.word 0x8e7222d8  ! 306: UDIV_I	udiv 	%r8, 0x02d8, %r7
	.word 0xccb21009  ! 307: STHA_R	stha	%r6, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 308: STBAR	stbar
	.word 0xe49a1009  ! 309: LDDA_R	ldda	[%r8, %r9] 0x80, %r18
	.word 0x886a0009  ! 310: UDIVX_R	udivx 	%r8, %r9, %r4
	.word 0xbed2288c  ! 311: UMULcc_I	umulcc 	%r8, 0x088c, %r31
	.word 0xc3ea2100  ! 312: PREFETCHA_I	prefetcha	[%r8, + 0x0100] %asi, #one_read
	.word 0xc44a0009  ! 313: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xfb222494  ! 314: STF_I	st	%f29, [0x0494, %r8]
	.word 0xcaca1009  ! 315: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r5
	.word 0xe7f21009  ! 317: CASXA_I	casxa	[%r8] 0x80, %r9, %r19
	.word 0x88d20009  ! 318: UMULcc_R	umulcc 	%r8, %r9, %r4
	.word 0xe41a0009  ! 319: LDD_R	ldd	[%r8 + %r9], %r18
	.word 0xa25a0009  ! 321: SMUL_R	smul 	%r8, %r9, %r17
	.word 0x3e800004  ! 322: BVC	bvc,a	<label_0x4>
	.word 0xe9e21009  ! 323: CASA_I	casa	[%r8] 0x80, %r9, %r20
	.word 0xceca1009  ! 324: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r7
	.word 0x8143c000  ! 327: STBAR	stbar
	.word 0xc36a2114  ! 328: PREFETCH_I	prefetch	[%r8 + 0x0114], #one_read
	.word 0xebe21009  ! 329: CASA_I	casa	[%r8] 0x80, %r9, %r21
	.word 0xf0aa1009  ! 330: STBA_R	stba	%r24, [%r8 + %r9] 0x80
	.word 0xe09a1009  ! 331: LDDA_R	ldda	[%r8, %r9] 0x80, %r16
	.word 0xc2da2d60  ! 332: LDXA_I	ldxa	[%r8, + 0x0d60] %asi, %r1
	.word 0x02ca0004  ! 333: BRZ	brz  ,pt	%8,<label_0xa0004>
	.word 0xce0a0009  ! 334: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xd4ba1009  ! 335: STDA_R	stda	%r10, [%r8 + %r9] 0x80
	.word 0x16800008  ! 336: BGE	bge  	<label_0x8>
	.word 0xfc420009  ! 337: LDSW_R	ldsw	[%r8 + %r9], %r30
	.word 0xc53a22b8  ! 338: STDF_I	std	%f2, [0x02b8, %r8]
	.word 0x886a0009  ! 339: UDIVX_R	udivx 	%r8, %r9, %r4
	.word 0x89a20929  ! 340: FMULs	fmuls	%f8, %f9, %f4
	.word 0xa36a2f78  ! 341: SDIVX_I	sdivx	%r8, 0x0f78, %r17
	.word 0x886a0009  ! 342: UDIVX_R	udivx 	%r8, %r9, %r4
	.word 0xc6da1009  ! 343: LDXA_R	ldxa	[%r8, %r9] 0x80, %r3
	.word 0xc73a2f70  ! 344: STDF_I	std	%f3, [0x0f70, %r8]
	.word 0x83a20829  ! 345: FADDs	fadds	%f8, %f9, %f1
	.word 0xea7a2e40  ! 346: SWAP_I	swap	%r21, [%r8 + 0x0e40]
	.word 0xa6fa2598  ! 347: SDIVcc_I	sdivcc 	%r8, 0x0598, %r19
	.word 0x826a24a4  ! 348: UDIVX_I	udivx 	%r8, 0x04a4, %r1
	.word 0xe2fa1009  ! 349: SWAPA_R	swapa	%r17, [%r8 + %r9] 0x80
	.word 0xcaea1009  ! 350: LDSTUBA_R	ldstuba	%r5, [%r8 + %r9] 0x80
	.word 0xc88a2364  ! 351: LDUBA_I	lduba	[%r8, + 0x0364] %asi, %r4
	.word 0xcc0a2c50  ! 352: LDUB_I	ldub	[%r8 + 0x0c50], %r6
	.word 0x847a25e4  ! 353: SDIV_I	sdiv 	%r8, 0x05e4, %r2
	.word 0xf8b22a00  ! 354: STHA_I	stha	%r28, [%r8 + 0x0a00] %asi
	.word 0xbba208a9  ! 355: FSUBs	fsubs	%f8, %f9, %f29
	.word 0xc4120009  ! 356: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xf2ca20e0  ! 357: LDSBA_I	ldsba	[%r8, + 0x00e0] %asi, %r25
	.word 0xc44222a4  ! 358: LDSW_I	ldsw	[%r8 + 0x02a4], %r2
	.word 0xf81a0009  ! 359: LDD_R	ldd	[%r8 + %r9], %r28
	.word 0xcc821009  ! 360: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r6
	.word 0xde520009  ! 361: LDSH_R	ldsh	[%r8 + %r9], %r15
	.word 0x8143e066  ! 362: MEMBAR	membar	#StoreLoad | #LoadStore | #MemIssue | #Sync 
	.word 0xcc7a2884  ! 363: SWAP_I	swap	%r6, [%r8 + 0x0884]
	.word 0x884a29a4  ! 364: MULX_I	mulx 	%r8, 0x09a4, %r4
	.word 0x0ec20004  ! 365: BRGEZ	brgez  ,nt	%8,<label_0x20004>
	.word 0x8f6a2070  ! 366: SDIVX_I	sdivx	%r8, 0x0070, %r7
	.word 0xc4020009  ! 367: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xaf6a26d0  ! 368: SDIVX_I	sdivx	%r8, 0x06d0, %r23
	.word 0xf6b22b80  ! 369: STHA_I	stha	%r27, [%r8 + 0x0b80] %asi
	.word 0x8eda0009  ! 370: SMULcc_R	smulcc 	%r8, %r9, %r7
	.word 0xf85a0009  ! 371: LDX_R	ldx	[%r8 + %r9], %r28
	.word 0x0c800008  ! 372: BNEG	bneg  	<label_0x8>
	.word 0x86fa0009  ! 373: SDIVcc_R	sdivcc 	%r8, %r9, %r3
	.word 0x8ed22cec  ! 374: UMULcc_I	umulcc 	%r8, 0x0cec, %r7
	.word 0x8143c000  ! 375: STBAR	stbar
	.word 0x8ba20829  ! 376: FADDs	fadds	%f8, %f9, %f5
	.word 0x8cfa0009  ! 377: SDIVcc_R	sdivcc 	%r8, %r9, %r6
	.word 0x8a7a0009  ! 378: SDIV_R	sdiv 	%r8, %r9, %r5
	.word 0x14800008  ! 379: BG	bg  	<label_0x8>
	.word 0x827a2664  ! 380: SDIV_I	sdiv 	%r8, 0x0664, %r1
	.word 0x0cc20004  ! 381: BRGZ	brgz  ,nt	%8,<label_0x20004>
	.word 0xa5a209a9  ! 382: FDIVs	fdivs	%f8, %f9, %f18
	.word 0xc8420009  ! 383: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0x8ef20009  ! 384: UDIVcc_R	udivcc 	%r8, %r9, %r7
	.word 0x945a0009  ! 385: SMUL_R	smul 	%r8, %r9, %r10
	.word 0xc4f22740  ! 386: STXA_I	stxa	%r2, [%r8 + 0x0740] %asi
	.word 0x83222084  ! 387: MULScc_I	mulscc 	%r8, 0x0084, %r1
	.word 0xc3ea290c  ! 388: PREFETCHA_I	prefetcha	[%r8, + 0x090c] %asi, #one_read
	.word 0xa3222ba8  ! 389: MULScc_I	mulscc 	%r8, 0x0ba8, %r17
	.word 0xcf222ddc  ! 390: STF_I	st	%f7, [0x0ddc, %r8]
	.word 0xc4ca2b44  ! 391: LDSBA_I	ldsba	[%r8, + 0x0b44] %asi, %r2
	.word 0xc8420009  ! 392: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0x83a20929  ! 393: FMULs	fmuls	%f8, %f9, %f1
	.word 0xce0220bc  ! 394: LDUW_I	lduw	[%r8 + 0x00bc], %r7
	.word 0xc4921009  ! 395: LDUHA_R	lduha	[%r8, %r9] 0x80, %r2
	.word 0x88f20009  ! 396: UDIVcc_R	udivcc 	%r8, %r9, %r4
	.word 0xc2ea1009  ! 397: LDSTUBA_R	ldstuba	%r1, [%r8 + %r9] 0x80
	.word 0x856a2030  ! 398: SDIVX_I	sdivx	%r8, 0x0030, %r2
	.word 0xcada25d0  ! 399: LDXA_I	ldxa	[%r8, + 0x05d0] %asi, %r5
	.word 0x2c800004  ! 400: BNEG	bneg,a	<label_0x4>
	.word 0xce5a2218  ! 401: LDX_I	ldx	[%r8 + 0x0218], %r7
	.word 0xceea1009  ! 402: LDSTUBA_R	ldstuba	%r7, [%r8 + %r9] 0x80
	.word 0xd87a0009  ! 403: SWAP_R	swap	%r12, [%r8 + %r9]
	.word 0x1e800008  ! 404: BVC	bvc  	<label_0x8>
	.word 0xc3ea2804  ! 405: PREFETCHA_I	prefetcha	[%r8, + 0x0804] %asi, #one_read
	.word 0x32800004  ! 406: BNE	bne,a	<label_0x4>
	.word 0xc4ea1009  ! 407: LDSTUBA_R	ldstuba	%r2, [%r8 + %r9] 0x80
	.word 0x8a520009  ! 408: UMUL_R	umul 	%r8, %r9, %r5
	.word 0x24c20004  ! 409: BRLEZ	brlez,a,nt	%8,<label_0x20004>
	.word 0xa9a20829  ! 410: FADDs	fadds	%f8, %f9, %f20
	.word 0x0cc20008  ! 411: BRGZ	brgz  ,nt	%8,<label_0x20008>
	.word 0xca8a1009  ! 412: LDUBA_R	lduba	[%r8, %r9] 0x80, %r5
	.word 0xb3a20929  ! 413: FMULs	fmuls	%f8, %f9, %f25
	.word 0x16800004  ! 414: BGE	bge  	<label_0x4>
	.word 0xf89a1009  ! 415: LDDA_R	ldda	[%r8, %r9] 0x80, %r28
	.word 0x8e7a0009  ! 416: SDIV_R	sdiv 	%r8, %r9, %r7
	.word 0xccba1009  ! 417: STDA_R	stda	%r6, [%r8 + %r9] 0x80
	.word 0x1c800008  ! 418: BPOS	bpos  	<label_0x8>
	.word 0x8eda0009  ! 419: SMULcc_R	smulcc 	%r8, %r9, %r7
	.word 0x26ca0004  ! 420: BRLZ	brlz,a,pt	%8,<label_0xa0004>
	.word 0x8f220009  ! 421: MULScc_R	mulscc 	%r8, %r9, %r7
	.word 0x32800008  ! 422: BNE	bne,a	<label_0x8>
	.word 0xe01a2990  ! 423: LDD_I	ldd	[%r8 + 0x0990], %r16
	.word 0x40000004  ! 424: CALL	call	disp30_4
	.word 0xceaa2d4c  ! 425: STBA_I	stba	%r7, [%r8 + 0x0d4c] %asi
	.word 0xd4aa1009  ! 426: STBA_R	stba	%r10, [%r8 + %r9] 0x80
	.word 0xcbf21009  ! 427: CASXA_I	casxa	[%r8] 0x80, %r9, %r5
	.word 0xbc5a0009  ! 428: SMUL_R	smul 	%r8, %r9, %r30
	.word 0x86da0009  ! 429: SMULcc_R	smulcc 	%r8, %r9, %r3
	.word 0x24ca0004  ! 430: BRLEZ	brlez,a,pt	%8,<label_0xa0004>
	.word 0xf08a200c  ! 431: LDUBA_I	lduba	[%r8, + 0x000c] %asi, %r24
	.word 0x8143e04c  ! 432: MEMBAR	membar	#LoadStore | #StoreStore | #Sync 
	.word 0xec4a28f4  ! 433: LDSB_I	ldsb	[%r8 + 0x08f4], %r22
	.word 0xcaaa2234  ! 434: STBA_I	stba	%r5, [%r8 + 0x0234] %asi
	.word 0x8143c000  ! 435: STBAR	stbar
	.word 0x0aca0004  ! 436: BRNZ	brnz  ,pt	%8,<label_0xa0004>
	.word 0xa8f20009  ! 437: UDIVcc_R	udivcc 	%r8, %r9, %r20
	.word 0x984a0009  ! 438: MULX_R	mulx 	%r8, %r9, %r12
	.word 0xcefa1009  ! 439: SWAPA_R	swapa	%r7, [%r8 + %r9] 0x80
	.word 0x0cca0008  ! 440: BRGZ	brgz  ,pt	%8,<label_0xa0008>
	.word 0xd49a1009  ! 441: LDDA_R	ldda	[%r8, %r9] 0x80, %r10
	.word 0x8143c000  ! 442: STBAR	stbar
	.word 0x2e800004  ! 443: BVS	bvs,a	<label_0x4>
	.word 0x8143c000  ! 444: STBAR	stbar
	.word 0xc8a223c4  ! 445: STWA_I	stwa	%r4, [%r8 + 0x03c4] %asi
	.word 0xfab22890  ! 446: STHA_I	stha	%r29, [%r8 + 0x0890] %asi
	.word 0xcc5a2108  ! 447: LDX_I	ldx	[%r8 + 0x0108], %r6
	.word 0xcc6a2f98  ! 448: LDSTUB_I	ldstub	%r6, [%r8 + 0x0f98]
	.word 0x8e5a0009  ! 449: SMUL_R	smul 	%r8, %r9, %r7
	.word 0x83a208a9  ! 450: FSUBs	fsubs	%f8, %f9, %f1
	.word 0xc3ea2560  ! 451: PREFETCHA_I	prefetcha	[%r8, + 0x0560] %asi, #one_read
	.word 0x24800008  ! 452: BLE	ble,a	<label_0x8>
	.word 0xc2ea22e4  ! 453: LDSTUBA_I	ldstuba	%r1, [%r8 + 0x02e4] %asi
	.word 0x8143e014  ! 454: MEMBAR	membar	#LoadStore | #Lookaside 
	.word 0x87a209a9  ! 455: FDIVs	fdivs	%f8, %f9, %f3
	.word 0x8143e024  ! 456: MEMBAR	membar	#LoadStore | #MemIssue 
	.word 0x96720009  ! 460: UDIV_R	udiv 	%r8, %r9, %r11
	.word 0xc41226fc  ! 461: LDUH_I	lduh	[%r8 + 0x06fc], %r2
	.word 0xccaa2214  ! 462: STBA_I	stba	%r6, [%r8 + 0x0214] %asi
	.word 0x8c4a2e90  ! 463: MULX_I	mulx 	%r8, 0x0e90, %r6
	.word 0xc49a1009  ! 465: LDDA_R	ldda	[%r8, %r9] 0x80, %r2
	.word 0x30800008  ! 466: BA	ba,a	<label_0x8>
	.word 0xc36a2850  ! 467: PREFETCH_I	prefetch	[%r8 + 0x0850], #one_read
	.word 0xceca1009  ! 468: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r7
	.word 0xf6022d2c  ! 469: LDUW_I	lduw	[%r8 + 0x0d2c], %r27
	.word 0x86fa2cf8  ! 470: SDIVcc_I	sdivcc 	%r8, 0x0cf8, %r3
	.word 0xf4ba1009  ! 472: STDA_R	stda	%r26, [%r8 + %r9] 0x80
	.word 0xcaea1009  ! 474: LDSTUBA_R	ldstuba	%r5, [%r8 + %r9] 0x80
	.word 0xc6a22218  ! 475: STWA_I	stwa	%r3, [%r8 + 0x0218] %asi
	.word 0xe73a26e8  ! 477: STDF_I	std	%f19, [0x06e8, %r8]
	.word 0x0e800008  ! 478: BVS	bvs  	<label_0x8>
	.word 0x95220009  ! 479: MULScc_R	mulscc 	%r8, %r9, %r10
	.word 0xce822100  ! 480: LDUWA_I	lduwa	[%r8, + 0x0100] %asi, %r7
	.word 0x86520009  ! 481: UMUL_R	umul 	%r8, %r9, %r3
	.word 0x8143c000  ! 482: STBAR	stbar
	.word 0xccea1009  ! 483: LDSTUBA_R	ldstuba	%r6, [%r8 + %r9] 0x80
	.word 0x8143e007  ! 484: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore 
	.word 0xcab21009  ! 485: STHA_R	stha	%r5, [%r8 + %r9] 0x80
	.word 0xb16a0009  ! 486: SDIVX_R	sdivx	%r8, %r9, %r24
	.word 0x30800004  ! 487: BA	ba,a	<label_0x4>
	.word 0xdeaa1009  ! 488: STBA_R	stba	%r15, [%r8 + %r9] 0x80
	.word 0xc2ea1009  ! 489: LDSTUBA_R	ldstuba	%r1, [%r8 + %r9] 0x80
	.word 0x8a52285c  ! 490: UMUL_I	umul 	%r8, 0x085c, %r5
	.word 0x22c20004  ! 491: BRZ	brz,a,nt	%8,<label_0x20004>
	.word 0x06ca0008  ! 492: BRLZ	brlz  ,pt	%8,<label_0xa0008>
	.word 0xcab21009  ! 493: STHA_R	stha	%r5, [%r8 + %r9] 0x80
	.word 0xf7f22009  ! 494: CASXA_R	casxa	[%r8]%asi, %r9, %r27
	.word 0xa07a0009  ! 495: SDIV_R	sdiv 	%r8, %r9, %r16
	.word 0xb1222dd8  ! 496: MULScc_I	mulscc 	%r8, 0x0dd8, %r24
	.word 0xcafa2c64  ! 497: SWAPA_I	swapa	%r5, [%r8 + 0x0c64] %asi
	.word 0x8143e01d  ! 498: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside 
	.word 0xc4420009  ! 499: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0x04c20004  ! 500: BRLEZ	brlez  ,nt	%8,<label_0x20004>
	.word 0x8143e07d  ! 501: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0x8b6a0009  ! 502: SDIVX_R	sdivx	%r8, %r9, %r5
	.word 0x8c7a270c  ! 503: SDIV_I	sdiv 	%r8, 0x070c, %r6
	.word 0xce4a232c  ! 504: LDSB_I	ldsb	[%r8 + 0x032c], %r7
	.word 0x14800004  ! 505: BG	bg  	<label_0x4>
	.word 0x8143c000  ! 506: STBAR	stbar
	.word 0x85a20829  ! 507: FADDs	fadds	%f8, %f9, %f2
	.word 0xcec21009  ! 508: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r7
	.word 0xc5e21009  ! 509: CASA_I	casa	[%r8] 0x80, %r9, %r2
	.word 0x94520009  ! 510: UMUL_R	umul 	%r8, %r9, %r10
	.word 0x85220009  ! 511: MULScc_R	mulscc 	%r8, %r9, %r2
	.word 0xc36a2e3c  ! 512: PREFETCH_I	prefetch	[%r8 + 0x0e3c], #one_read
	.word 0xdbe22009  ! 513: CASA_R	casa	[%r8] %asi, %r9, %r13
	.word 0xceea1009  ! 514: LDSTUBA_R	ldstuba	%r7, [%r8 + %r9] 0x80
	.word 0x87a20929  ! 515: FMULs	fmuls	%f8, %f9, %f3
	.word 0x8143c000  ! 516: STBAR	stbar
	.word 0xc9222da8  ! 517: STF_I	st	%f4, [0x0da8, %r8]
	.word 0xc2da1009  ! 518: LDXA_R	ldxa	[%r8, %r9] 0x80, %r1
	.word 0x8143e076  ! 519: MEMBAR	membar	#StoreLoad | #LoadStore | #Lookaside | #MemIssue | #Sync 
	.word 0xcfe21009  ! 520: CASA_I	casa	[%r8] 0x80, %r9, %r7
	.word 0xf89a1009  ! 521: LDDA_R	ldda	[%r8, %r9] 0x80, %r28
	.word 0x30800004  ! 522: BA	ba,a	<label_0x4>
	.word 0x8143e024  ! 523: MEMBAR	membar	#LoadStore | #MemIssue 
	.word 0xe68a2060  ! 524: LDUBA_I	lduba	[%r8, + 0x0060] %asi, %r19
	.word 0xc80a0009  ! 525: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0x8143c000  ! 526: STBAR	stbar
	.word 0xe3f22009  ! 527: CASXA_R	casxa	[%r8]%asi, %r9, %r17
	.word 0xc36a2ed8  ! 528: PREFETCH_I	prefetch	[%r8 + 0x0ed8], #one_read
	.word 0xf7f22009  ! 530: CASXA_R	casxa	[%r8]%asi, %r9, %r27
	.word 0xcf3a0009  ! 531: STDF_R	std	%f7, [%r9, %r8]
	.word 0xe84223f0  ! 532: LDSW_I	ldsw	[%r8 + 0x03f0], %r20
	.word 0x0e800004  ! 533: BVS	bvs  	<label_0x4>
	.word 0x82720009  ! 534: UDIV_R	udiv 	%r8, %r9, %r1
	.word 0xca822a50  ! 535: LDUWA_I	lduwa	[%r8, + 0x0a50] %asi, %r5
	.word 0xec9a2ba8  ! 536: LDDA_I	ldda	[%r8, + 0x0ba8] %asi, %r22
	.word 0x8143e03a  ! 537: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside | #MemIssue 
	.word 0x30800004  ! 538: BA	ba,a	<label_0x4>
	.word 0x85a20929  ! 539: FMULs	fmuls	%f8, %f9, %f2
	.word 0xf6d22fdc  ! 540: LDSHA_I	ldsha	[%r8, + 0x0fdc] %asi, %r27
	.word 0x8143e076  ! 541: MEMBAR	membar	#StoreLoad | #LoadStore | #Lookaside | #MemIssue | #Sync 
	.word 0x8143c000  ! 542: STBAR	stbar
	.word 0xced22688  ! 543: LDSHA_I	ldsha	[%r8, + 0x0688] %asi, %r7
	.word 0x8143e002  ! 544: MEMBAR	membar	#StoreLoad 
	.word 0xc66a2c50  ! 545: LDSTUB_I	ldstub	%r3, [%r8 + 0x0c50]
	.word 0x8143e016  ! 546: MEMBAR	membar	#StoreLoad | #LoadStore | #Lookaside 
	.word 0xdca22764  ! 547: STWA_I	stwa	%r14, [%r8 + 0x0764] %asi
	.word 0x10800004  ! 548: BA	ba  	<label_0x4>
	.word 0xcd3a0009  ! 549: STDF_R	std	%f6, [%r9, %r8]
	.word 0xdb3a2058  ! 550: STDF_I	std	%f13, [0x0058, %r8]
	.word 0xcbe22009  ! 551: CASA_R	casa	[%r8] %asi, %r9, %r5
	.word 0x8da20929  ! 552: FMULs	fmuls	%f8, %f9, %f6
	.word 0xc2a22440  ! 553: STWA_I	stwa	%r1, [%r8 + 0x0440] %asi
	.word 0xdcf22510  ! 554: STXA_I	stxa	%r14, [%r8 + 0x0510] %asi
	.word 0xc85a2138  ! 555: LDX_I	ldx	[%r8 + 0x0138], %r4
	.word 0xc36a29d4  ! 556: PREFETCH_I	prefetch	[%r8 + 0x09d4], #one_read
	.word 0xcc921009  ! 557: LDUHA_R	lduha	[%r8, %r9] 0x80, %r6
	.word 0x8143e01c  ! 558: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside 
	.word 0x16800004  ! 559: BGE	bge  	<label_0x4>
	.word 0xe81a2c98  ! 561: LDD_I	ldd	[%r8 + 0x0c98], %r20
	.word 0xc8520009  ! 562: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0x82f22b94  ! 563: UDIVcc_I	udivcc 	%r8, 0x0b94, %r1
	.word 0x867a0009  ! 564: SDIV_R	sdiv 	%r8, %r9, %r3
	.word 0xa07a0009  ! 565: SDIV_R	sdiv 	%r8, %r9, %r16
	.word 0xc4da1009  ! 566: LDXA_R	ldxa	[%r8, %r9] 0x80, %r2
	.word 0x845a0009  ! 567: SMUL_R	smul 	%r8, %r9, %r2
	.word 0x8143c000  ! 568: STBAR	stbar
	.word 0xc36a23b0  ! 569: PREFETCH_I	prefetch	[%r8 + 0x03b0], #one_read
	.word 0xf3f21009  ! 570: CASXA_I	casxa	[%r8] 0x80, %r9, %r25
	.word 0xceb22094  ! 571: STHA_I	stha	%r7, [%r8 + 0x0094] %asi
	.word 0x825a0009  ! 572: SMUL_R	smul 	%r8, %r9, %r1
	.word 0xccda2f80  ! 574: LDXA_I	ldxa	[%r8, + 0x0f80] %asi, %r6
	.word 0xee822148  ! 575: LDUWA_I	lduwa	[%r8, + 0x0148] %asi, %r23
	.word 0xf8520009  ! 576: LDSH_R	ldsh	[%r8 + %r9], %r28
	.word 0xeaaa2590  ! 577: STBA_I	stba	%r21, [%r8 + 0x0590] %asi
	.word 0x824a2eb4  ! 578: MULX_I	mulx 	%r8, 0x0eb4, %r1
	.word 0x0e800008  ! 580: BVS	bvs  	<label_0x8>
	.word 0xca6a2c94  ! 581: LDSTUB_I	ldstub	%r5, [%r8 + 0x0c94]
	.word 0x826a0009  ! 583: UDIVX_R	udivx 	%r8, %r9, %r1
	.word 0xebf21009  ! 584: CASXA_I	casxa	[%r8] 0x80, %r9, %r21
	.word 0xfe7a0009  ! 585: SWAP_R	swap	%r31, [%r8 + %r9]
	.word 0x8143e03d  ! 586: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0xb76a26d0  ! 587: SDIVX_I	sdivx	%r8, 0x06d0, %r27
	.word 0xc36a23f8  ! 588: PREFETCH_I	prefetch	[%r8 + 0x03f8], #one_read
	.word 0x8ef2218c  ! 589: UDIVcc_I	udivcc 	%r8, 0x018c, %r7
	.word 0x0a800008  ! 590: BCS	bcs  	<label_0x8>
	.word 0xa4da0009  ! 591: SMULcc_R	smulcc 	%r8, %r9, %r18
	.word 0xc86a0009  ! 592: LDSTUB_R	ldstub	%r4, [%r8 + %r9]
	.word 0x8143e00b  ! 593: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore 
	.word 0x8143c000  ! 594: STBAR	stbar
	.word 0xc2aa1009  ! 595: STBA_R	stba	%r1, [%r8 + %r9] 0x80
	.word 0x24ca0008  ! 596: BRLEZ	brlez,a,pt	%8,<label_0xa0008>
	.word 0x84720009  ! 598: UDIV_R	udiv 	%r8, %r9, %r2
	.word 0x8a6a2a9c  ! 599: UDIVX_I	udivx 	%r8, 0x0a9c, %r5
	.word 0xd41a0009  ! 600: LDD_R	ldd	[%r8 + %r9], %r10
	.word 0xc8ba2d00  ! 601: STDA_I	stda	%r4, [%r8 + 0x0d00] %asi
	.word 0xf49a1009  ! 602: LDDA_R	ldda	[%r8, %r9] 0x80, %r26
	.word 0xa0720009  ! 603: UDIV_R	udiv 	%r8, %r9, %r16
	.word 0xfec21009  ! 604: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r31
	.word 0xfc520009  ! 605: LDSH_R	ldsh	[%r8 + %r9], %r30
	.word 0xfc1a2a10  ! 606: LDD_I	ldd	[%r8 + 0x0a10], %r30
	.word 0xc36a2428  ! 607: PREFETCH_I	prefetch	[%r8 + 0x0428], #one_read
	.word 0xcac223e4  ! 608: LDSWA_I	ldswa	[%r8, + 0x03e4] %asi, %r5
	.word 0xcf3a0009  ! 609: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc6b223d0  ! 610: STHA_I	stha	%r3, [%r8 + 0x03d0] %asi
	.word 0xf0c22380  ! 611: LDSWA_I	ldswa	[%r8, + 0x0380] %asi, %r24
	.word 0xcca22a88  ! 612: STWA_I	stwa	%r6, [%r8 + 0x0a88] %asi
	.word 0xc6420009  ! 613: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xe2522700  ! 614: LDSH_I	ldsh	[%r8 + 0x0700], %r17
	.word 0xc86a0009  ! 615: LDSTUB_R	ldstub	%r4, [%r8 + %r9]
	.word 0xc89a2698  ! 616: LDDA_I	ldda	[%r8, + 0x0698] %asi, %r4
	.word 0xc2d21009  ! 617: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r1
	.word 0xc47a2450  ! 618: SWAP_I	swap	%r2, [%r8 + 0x0450]
	.word 0xc53a2320  ! 619: STDF_I	std	%f2, [0x0320, %r8]
	.word 0xc4ea1009  ! 620: LDSTUBA_R	ldstuba	%r2, [%r8 + %r9] 0x80
	.word 0xeaf21009  ! 621: STXA_R	stxa	%r21, [%r8 + %r9] 0x80
	.word 0xcbf21009  ! 622: CASXA_I	casxa	[%r8] 0x80, %r9, %r5
	.word 0x9c522adc  ! 623: UMUL_I	umul 	%r8, 0x0adc, %r14
	.word 0xcff22009  ! 624: CASXA_R	casxa	[%r8]%asi, %r9, %r7
	.word 0x9a6a0009  ! 625: UDIVX_R	udivx 	%r8, %r9, %r13
	.word 0xda92249c  ! 626: LDUHA_I	lduha	[%r8, + 0x049c] %asi, %r13
	.word 0x86da0009  ! 627: SMULcc_R	smulcc 	%r8, %r9, %r3
	.word 0x846a0009  ! 628: UDIVX_R	udivx 	%r8, %r9, %r2
	.word 0xc53a26f0  ! 629: STDF_I	std	%f2, [0x06f0, %r8]
	.word 0x0e800004  ! 630: BVS	bvs  	<label_0x4>
	.word 0xc26a2a2c  ! 631: LDSTUB_I	ldstub	%r1, [%r8 + 0x0a2c]
	.word 0xe8f22740  ! 632: STXA_I	stxa	%r20, [%r8 + 0x0740] %asi
	.word 0x1a800004  ! 633: BCC	bcc  	<label_0x4>
	.word 0xc36a26ac  ! 634: PREFETCH_I	prefetch	[%r8 + 0x06ac], #one_read
	.word 0x8da208a9  ! 635: FSUBs	fsubs	%f8, %f9, %f6
	.word 0x8143c000  ! 636: STBAR	stbar
	.word 0x8ba20829  ! 637: FADDs	fadds	%f8, %f9, %f5
	.word 0xecba1009  ! 638: STDA_R	stda	%r22, [%r8 + %r9] 0x80
	.word 0xc2a22668  ! 639: STWA_I	stwa	%r1, [%r8 + 0x0668] %asi
	.word 0xded220d0  ! 641: LDSHA_I	ldsha	[%r8, + 0x00d0] %asi, %r15
	.word 0xd84a0009  ! 642: LDSB_R	ldsb	[%r8 + %r9], %r12
	.word 0xcca21009  ! 643: STWA_R	stwa	%r6, [%r8 + %r9] 0x80
	.word 0xcd222010  ! 644: STF_I	st	%f6, [0x0010, %r8]
	.word 0x8a7a2fac  ! 645: SDIV_I	sdiv 	%r8, 0x0fac, %r5
	.word 0xdeda2f40  ! 646: LDXA_I	ldxa	[%r8, + 0x0f40] %asi, %r15
	.word 0x8ba20929  ! 647: FMULs	fmuls	%f8, %f9, %f5
	.word 0x8143c000  ! 648: STBAR	stbar
	.word 0xc86a2428  ! 649: LDSTUB_I	ldstub	%r4, [%r8 + 0x0428]
	.word 0x9f6a25a0  ! 650: SDIVX_I	sdivx	%r8, 0x05a0, %r15
	.word 0x2ac20004  ! 651: BRNZ	brnz,a,nt	%8,<label_0x20004>
	.word 0xc3ea2e08  ! 652: PREFETCHA_I	prefetcha	[%r8, + 0x0e08] %asi, #one_read
	.word 0x9af2249c  ! 653: UDIVcc_I	udivcc 	%r8, 0x049c, %r13
	.word 0x8143c000  ! 654: STBAR	stbar
	.word 0xcafa2278  ! 655: SWAPA_I	swapa	%r5, [%r8 + 0x0278] %asi
	.word 0x84d22de0  ! 656: UMULcc_I	umulcc 	%r8, 0x0de0, %r2
	.word 0x8143c000  ! 657: STBAR	stbar
	.word 0x8143c000  ! 658: STBAR	stbar
	.word 0xd73a2478  ! 659: STDF_I	std	%f11, [0x0478, %r8]
	.word 0x8143c000  ! 660: STBAR	stbar
	.word 0xa3a20829  ! 661: FADDs	fadds	%f8, %f9, %f17
	.word 0xcc821009  ! 662: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r6
	.word 0xc33a24c0  ! 663: STDF_I	std	%f1, [0x04c0, %r8]
	.word 0x36800004  ! 664: BGE	bge,a	<label_0x4>
	.word 0xc2ca1009  ! 665: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r1
	.word 0x32800004  ! 666: BNE	bne,a	<label_0x4>
	.word 0x8143e06e  ! 667: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #MemIssue | #Sync 
	.word 0x18800004  ! 668: BGU	bgu  	<label_0x4>
	.word 0xc3ea2230  ! 669: PREFETCHA_I	prefetcha	[%r8, + 0x0230] %asi, #one_read
	.word 0xbf6a0009  ! 670: SDIVX_R	sdivx	%r8, %r9, %r31
	.word 0x8f6a2548  ! 671: SDIVX_I	sdivx	%r8, 0x0548, %r7
	.word 0x884a2080  ! 672: MULX_I	mulx 	%r8, 0x0080, %r4
	.word 0xc8a2287c  ! 673: STWA_I	stwa	%r4, [%r8 + 0x087c] %asi
	.word 0xc6ea1009  ! 674: LDSTUBA_R	ldstuba	%r3, [%r8 + %r9] 0x80
	.word 0xca8a1009  ! 675: LDUBA_R	lduba	[%r8, %r9] 0x80, %r5
	.word 0xcc7a0009  ! 676: SWAP_R	swap	%r6, [%r8 + %r9]
	.word 0x40000004  ! 677: CALL	call	disp30_4
	.word 0xcea21009  ! 679: STWA_R	stwa	%r7, [%r8 + %r9] 0x80
	.word 0xc60a0009  ! 680: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xb45a2d08  ! 681: SMUL_I	smul 	%r8, 0x0d08, %r26
	.word 0x8143c000  ! 682: STBAR	stbar
	.word 0x96d20009  ! 683: UMULcc_R	umulcc 	%r8, %r9, %r11
	.word 0x89a208a9  ! 684: FSUBs	fsubs	%f8, %f9, %f4
	.word 0x8143e063  ! 685: MEMBAR	membar	#LoadLoad | #StoreLoad | #MemIssue | #Sync 
	.word 0xeaca25c8  ! 686: LDSBA_I	ldsba	[%r8, + 0x05c8] %asi, %r21
	.word 0xcc020009  ! 687: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xc6aa2e1c  ! 688: STBA_I	stba	%r3, [%r8 + 0x0e1c] %asi
	.word 0xe48223e0  ! 689: LDUWA_I	lduwa	[%r8, + 0x03e0] %asi, %r18
	.word 0xce020009  ! 690: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0x88d20009  ! 691: UMULcc_R	umulcc 	%r8, %r9, %r4
	.word 0xce7a25d4  ! 692: SWAP_I	swap	%r7, [%r8 + 0x05d4]
	.word 0xc36a21c8  ! 693: PREFETCH_I	prefetch	[%r8 + 0x01c8], #one_read
	.word 0xdde21009  ! 694: CASA_I	casa	[%r8] 0x80, %r9, %r14
	.word 0x8143e06d  ! 695: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #MemIssue | #Sync 
	.word 0xcc4a0009  ! 696: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0x8143e013  ! 697: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside 
	.word 0x82520009  ! 698: UMUL_R	umul 	%r8, %r9, %r1
	.word 0xc3e21009  ! 699: CASA_I	casa	[%r8] 0x80, %r9, %r1
	.word 0xfd3a24b8  ! 700: STDF_I	std	%f30, [0x04b8, %r8]
	.word 0x14800004  ! 701: BG	bg  	<label_0x4>
	.word 0x8cd22dbc  ! 704: UMULcc_I	umulcc 	%r8, 0x0dbc, %r6
	.word 0xde921009  ! 705: LDUHA_R	lduha	[%r8, %r9] 0x80, %r15
	.word 0xc87a2934  ! 706: SWAP_I	swap	%r4, [%r8 + 0x0934]
	.word 0xcf3a23a8  ! 707: STDF_I	std	%f7, [0x03a8, %r8]
	.word 0xc45a2b60  ! 708: LDX_I	ldx	[%r8 + 0x0b60], %r2
	.word 0xcd222cd4  ! 709: STF_I	st	%f6, [0x0cd4, %r8]
	.word 0xfd3a0009  ! 710: STDF_R	std	%f30, [%r9, %r8]
	.word 0xc80a2b9c  ! 711: LDUB_I	ldub	[%r8 + 0x0b9c], %r4
	.word 0xf7e22009  ! 712: CASA_R	casa	[%r8] %asi, %r9, %r27
	.word 0xbcf20009  ! 713: UDIVcc_R	udivcc 	%r8, %r9, %r30
	.word 0x8143e047  ! 714: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Sync 
	.word 0xccb22fc8  ! 715: STHA_I	stha	%r6, [%r8 + 0x0fc8] %asi
	.word 0x8143c000  ! 716: STBAR	stbar
	.word 0x8143e073  ! 717: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside | #MemIssue | #Sync 
	.word 0x02c20004  ! 718: BRZ	brz  ,nt	%8,<label_0x20004>
	.word 0x966a2700  ! 719: UDIVX_I	udivx 	%r8, 0x0700, %r11
	.word 0xccaa1009  ! 720: STBA_R	stba	%r6, [%r8 + %r9] 0x80
	.word 0xc4d22f4c  ! 721: LDSHA_I	ldsha	[%r8, + 0x0f4c] %asi, %r2
	.word 0xaaf20009  ! 722: UDIVcc_R	udivcc 	%r8, %r9, %r21
	.word 0xc6a21009  ! 723: STWA_R	stwa	%r3, [%r8 + %r9] 0x80
	.word 0xc65a0009  ! 724: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xf8fa2240  ! 725: SWAPA_I	swapa	%r28, [%r8 + 0x0240] %asi
	.word 0x8143e07c  ! 726: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xcea22a1c  ! 727: STWA_I	stwa	%r7, [%r8 + 0x0a1c] %asi
	.word 0xc6da2f30  ! 728: LDXA_I	ldxa	[%r8, + 0x0f30] %asi, %r3
	.word 0x8143e04b  ! 729: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Sync 
	.word 0xc33a2ed0  ! 730: STDF_I	std	%f1, [0x0ed0, %r8]
	.word 0x9c520009  ! 731: UMUL_R	umul 	%r8, %r9, %r14
	.word 0xe01a0009  ! 732: LDD_R	ldd	[%r8 + %r9], %r16
	.word 0xdeda2dd8  ! 733: LDXA_I	ldxa	[%r8, + 0x0dd8] %asi, %r15
	.word 0x984a0009  ! 734: MULX_R	mulx 	%r8, %r9, %r12
	.word 0xce922d88  ! 735: LDUHA_I	lduha	[%r8, + 0x0d88] %asi, %r7
	.word 0x8143c000  ! 736: STBAR	stbar
	.word 0xbe720009  ! 737: UDIV_R	udiv 	%r8, %r9, %r31
	.word 0x34800004  ! 738: BG	bg,a	<label_0x4>
	.word 0x8fa208a9  ! 739: FSUBs	fsubs	%f8, %f9, %f7
	.word 0xa7220009  ! 740: MULScc_R	mulscc 	%r8, %r9, %r19
	.word 0xc4aa24c0  ! 741: STBA_I	stba	%r2, [%r8 + 0x04c0] %asi
	.word 0x8143c000  ! 742: STBAR	stbar
	.word 0xeeda25e0  ! 743: LDXA_I	ldxa	[%r8, + 0x05e0] %asi, %r23
	.word 0xd8f21009  ! 744: STXA_R	stxa	%r12, [%r8 + %r9] 0x80
	.word 0xcc6a2c94  ! 745: LDSTUB_I	ldstub	%r6, [%r8 + 0x0c94]
	.word 0xa7a208a9  ! 746: FSUBs	fsubs	%f8, %f9, %f19
	.word 0xc36a2788  ! 747: PREFETCH_I	prefetch	[%r8 + 0x0788], #one_read
	.word 0x8143e005  ! 748: MEMBAR	membar	#LoadLoad | #LoadStore 
	.word 0xc7e21009  ! 749: CASA_I	casa	[%r8] 0x80, %r9, %r3
	.word 0x8b6a0009  ! 750: SDIVX_R	sdivx	%r8, %r9, %r5
	.word 0xceda1009  ! 751: LDXA_R	ldxa	[%r8, %r9] 0x80, %r7
	.word 0xfc6a2c5c  ! 752: LDSTUB_I	ldstub	%r30, [%r8 + 0x0c5c]
	.word 0x0a800004  ! 753: BCS	bcs  	<label_0x4>
	.word 0xc6520009  ! 754: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xc7222c68  ! 755: STF_I	st	%f3, [0x0c68, %r8]
	.word 0x87a209a9  ! 757: FDIVs	fdivs	%f8, %f9, %f3
	.word 0x8143c000  ! 758: STBAR	stbar
	.word 0xd65a2b48  ! 759: LDX_I	ldx	[%r8 + 0x0b48], %r11
	.word 0xcafa1009  ! 760: SWAPA_R	swapa	%r5, [%r8 + %r9] 0x80
	.word 0xcc0a0009  ! 761: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xcc120009  ! 762: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0x89a20829  ! 763: FADDs	fadds	%f8, %f9, %f4
	.word 0x28800008  ! 764: BLEU	bleu,a	<label_0x8>
	.word 0xcc0a2b08  ! 765: LDUB_I	ldub	[%r8 + 0x0b08], %r6
	.word 0x8143c000  ! 766: STBAR	stbar
	.word 0xc33a0009  ! 767: STDF_R	std	%f1, [%r9, %r8]
	.word 0x0c800008  ! 768: BNEG	bneg  	<label_0x8>
	.word 0xce4a2ff8  ! 769: LDSB_I	ldsb	[%r8 + 0x0ff8], %r7
	.word 0x8d220009  ! 770: MULScc_R	mulscc 	%r8, %r9, %r6
	.word 0xce420009  ! 771: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xe46a0009  ! 772: LDSTUB_R	ldstub	%r18, [%r8 + %r9]
	.word 0xce821009  ! 773: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r7
	.word 0xc8b22d18  ! 774: STHA_I	stha	%r4, [%r8 + 0x0d18] %asi
	.word 0x22800008  ! 775: BE	be,a	<label_0x8>
	.word 0x12800004  ! 776: BNE	bne  	<label_0x4>
	.word 0x16800008  ! 777: BGE	bge  	<label_0x8>
	.word 0x10800008  ! 778: BA	ba  	<label_0x8>
	.word 0x2cca0008  ! 779: BRGZ	brgz,a,pt	%8,<label_0xa0008>
	.word 0xc8ba2db8  ! 780: STDA_I	stda	%r4, [%r8 + 0x0db8] %asi
	.word 0xc36a2e10  ! 781: PREFETCH_I	prefetch	[%r8 + 0x0e10], #one_read
	.word 0x83220009  ! 783: MULScc_R	mulscc 	%r8, %r9, %r1
	.word 0xaba20929  ! 784: FMULs	fmuls	%f8, %f9, %f21
	.word 0xb05a0009  ! 785: SMUL_R	smul 	%r8, %r9, %r24
	.word 0xe01a27f0  ! 786: LDD_I	ldd	[%r8 + 0x07f0], %r16
	.word 0x8143e05c  ! 788: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0x8143e031  ! 789: MEMBAR	membar	#LoadLoad | #Lookaside | #MemIssue 
	.word 0xcc420009  ! 790: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xa84a2ca0  ! 791: MULX_I	mulx 	%r8, 0x0ca0, %r20
	.word 0x846a2c1c  ! 792: UDIVX_I	udivx 	%r8, 0x0c1c, %r2
	.word 0x8143c000  ! 793: STBAR	stbar
	.word 0xc5f22009  ! 794: CASXA_R	casxa	[%r8]%asi, %r9, %r2
	.word 0x8143c000  ! 795: STBAR	stbar
	.word 0xccfa1009  ! 796: SWAPA_R	swapa	%r6, [%r8 + %r9] 0x80
	.word 0xe2a21009  ! 797: STWA_R	stwa	%r17, [%r8 + %r9] 0x80
	.word 0x885a0009  ! 798: SMUL_R	smul 	%r8, %r9, %r4
	.word 0xc3220009  ! 799: STF_R	st	%f1, [%r9, %r8]
	.word 0xc36a202c  ! 800: PREFETCH_I	prefetch	[%r8 + 0x002c], #one_read
	.word 0x89a20929  ! 802: FMULs	fmuls	%f8, %f9, %f4
	.word 0xca020009  ! 804: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xcf222a1c  ! 805: STF_I	st	%f7, [0x0a1c, %r8]
	.word 0x8fa20929  ! 806: FMULs	fmuls	%f8, %f9, %f7
	.word 0xdbf22009  ! 807: CASXA_R	casxa	[%r8]%asi, %r9, %r13
	.word 0xc6a21009  ! 808: STWA_R	stwa	%r3, [%r8 + %r9] 0x80
	.word 0xce0a0009  ! 809: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xc8ca1009  ! 810: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r4
	.word 0xcff22009  ! 812: CASXA_R	casxa	[%r8]%asi, %r9, %r7
	.word 0x9b22263c  ! 813: MULScc_I	mulscc 	%r8, 0x063c, %r13
	.word 0x26ca0008  ! 814: BRLZ	brlz,a,pt	%8,<label_0xa0008>
	.word 0xfa921009  ! 815: LDUHA_R	lduha	[%r8, %r9] 0x80, %r29
	.word 0x9e720009  ! 816: UDIV_R	udiv 	%r8, %r9, %r15
	.word 0xc36a21c8  ! 817: PREFETCH_I	prefetch	[%r8 + 0x01c8], #one_read
	.word 0xc4a22c44  ! 818: STWA_I	stwa	%r2, [%r8 + 0x0c44] %asi
	.word 0xc6da1009  ! 819: LDXA_R	ldxa	[%r8, %r9] 0x80, %r3
	.word 0xea4a2220  ! 820: LDSB_I	ldsb	[%r8 + 0x0220], %r21
	.word 0xe46a28b8  ! 821: LDSTUB_I	ldstub	%r18, [%r8 + 0x08b8]
	.word 0x8143c000  ! 822: STBAR	stbar
	.word 0xc3220009  ! 823: STF_R	st	%f1, [%r9, %r8]
	.word 0xfc8a2248  ! 824: LDUBA_I	lduba	[%r8, + 0x0248] %asi, %r30
	.word 0xe5f22009  ! 825: CASXA_R	casxa	[%r8]%asi, %r9, %r18
	.word 0xe8a21009  ! 826: STWA_R	stwa	%r20, [%r8 + %r9] 0x80
	.word 0xe87a0009  ! 827: SWAP_R	swap	%r20, [%r8 + %r9]
	.word 0x34800008  ! 828: BG	bg,a	<label_0x8>
	.word 0xc26a2d10  ! 829: LDSTUB_I	ldstub	%r1, [%r8 + 0x0d10]
	.word 0x12800004  ! 830: BNE	bne  	<label_0x4>
	.word 0xee4a21c8  ! 831: LDSB_I	ldsb	[%r8 + 0x01c8], %r23
	.word 0xccb21009  ! 832: STHA_R	stha	%r6, [%r8 + %r9] 0x80
	.word 0xc26a0009  ! 833: LDSTUB_R	ldstub	%r1, [%r8 + %r9]
	.word 0xc8922604  ! 834: LDUHA_I	lduha	[%r8, + 0x0604] %asi, %r4
	.word 0xb96a0009  ! 835: SDIVX_R	sdivx	%r8, %r9, %r28
	.word 0xd6da1009  ! 836: LDXA_R	ldxa	[%r8, %r9] 0x80, %r11
	.word 0xf87a2710  ! 837: SWAP_I	swap	%r28, [%r8 + 0x0710]
	.word 0xcaca205c  ! 838: LDSBA_I	ldsba	[%r8, + 0x005c] %asi, %r5
	.word 0xe6aa2a94  ! 839: STBA_I	stba	%r19, [%r8 + 0x0a94] %asi
	.word 0xdcba1009  ! 840: STDA_R	stda	%r14, [%r8 + %r9] 0x80
	.word 0xc8422930  ! 841: LDSW_I	ldsw	[%r8 + 0x0930], %r4
	.word 0x87a209a9  ! 842: FDIVs	fdivs	%f8, %f9, %f3
	.word 0x82fa2c54  ! 843: SDIVcc_I	sdivcc 	%r8, 0x0c54, %r1
	.word 0xc4ea241c  ! 844: LDSTUBA_I	ldstuba	%r2, [%r8 + 0x041c] %asi
	.word 0xc93a2fe0  ! 845: STDF_I	std	%f4, [0x0fe0, %r8]
	.word 0xc4aa1009  ! 846: STBA_R	stba	%r2, [%r8 + %r9] 0x80
	.word 0xc2821009  ! 847: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r1
	.word 0x8d222eec  ! 848: MULScc_I	mulscc 	%r8, 0x0eec, %r6
	.word 0x00800008  ! 849: BN	bn  	<label_0x8>
	.word 0xd5222a64  ! 850: STF_I	st	%f10, [0x0a64, %r8]
	.word 0x8143e045  ! 851: MEMBAR	membar	#LoadLoad | #LoadStore | #Sync 
	.word 0xc36a2c58  ! 852: PREFETCH_I	prefetch	[%r8 + 0x0c58], #one_read
	.word 0x8143e05e  ! 853: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0xe41a0009  ! 854: LDD_R	ldd	[%r8 + %r9], %r18
	.word 0x02800004  ! 855: BE	be  	<label_0x4>
	.word 0xa4f22d8c  ! 856: UDIVcc_I	udivcc 	%r8, 0x0d8c, %r18
	.word 0xd7220009  ! 857: STF_R	st	%f11, [%r9, %r8]
	.word 0xce520009  ! 858: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0x99a20829  ! 859: FADDs	fadds	%f8, %f9, %f12
	.word 0x87222cd8  ! 860: MULScc_I	mulscc 	%r8, 0x0cd8, %r3
	.word 0xf01a2230  ! 861: LDD_I	ldd	[%r8 + 0x0230], %r24
	.word 0x24800004  ! 862: BLE	ble,a	<label_0x4>
	.word 0x8143e035  ! 863: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside | #MemIssue 
	.word 0x8143e017  ! 864: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside 
	.word 0xc5222e30  ! 865: STF_I	st	%f2, [0x0e30, %r8]
	.word 0xc8522204  ! 866: LDSH_I	ldsh	[%r8 + 0x0204], %r4
	.word 0x8143e055  ! 867: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside | #Sync 
	.word 0xce6a0009  ! 868: LDSTUB_R	ldstub	%r7, [%r8 + %r9]
	.word 0xcc5a0009  ! 869: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0x8143c000  ! 870: STBAR	stbar
	.word 0x8143c000  ! 871: STBAR	stbar
	.word 0xc4822be8  ! 872: LDUWA_I	lduwa	[%r8, + 0x0be8] %asi, %r2
	.word 0xc36a28e4  ! 873: PREFETCH_I	prefetch	[%r8 + 0x08e4], #one_read
	.word 0x8143e010  ! 874: MEMBAR	membar	#Lookaside 
	.word 0xa8d20009  ! 876: UMULcc_R	umulcc 	%r8, %r9, %r20
	.word 0xcc4a2038  ! 877: LDSB_I	ldsb	[%r8 + 0x0038], %r6
	.word 0xc4ca1009  ! 878: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r2
	.word 0xeeb21009  ! 879: STHA_R	stha	%r23, [%r8 + %r9] 0x80
	.word 0xc8ea1009  ! 880: LDSTUBA_R	ldstuba	%r4, [%r8 + %r9] 0x80
	.word 0x88722edc  ! 881: UDIV_I	udiv 	%r8, 0x0edc, %r4
	.word 0x8b220009  ! 882: MULScc_R	mulscc 	%r8, %r9, %r5
	.word 0x8143c000  ! 883: STBAR	stbar
	.word 0xc722234c  ! 884: STF_I	st	%f3, [0x034c, %r8]
	.word 0xc6520009  ! 885: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0x89a208a9  ! 886: FSUBs	fsubs	%f8, %f9, %f4
	.word 0xe0ba1009  ! 887: STDA_R	stda	%r16, [%r8 + %r9] 0x80
	.word 0xc3ea27d0  ! 888: PREFETCHA_I	prefetcha	[%r8, + 0x07d0] %asi, #one_read
	.word 0x8143e02f  ! 889: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #MemIssue 
	.word 0x8b220009  ! 891: MULScc_R	mulscc 	%r8, %r9, %r5
	.word 0x8a522750  ! 892: UMUL_I	umul 	%r8, 0x0750, %r5
	.word 0xcc420009  ! 893: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xf2b21009  ! 894: STHA_R	stha	%r25, [%r8 + %r9] 0x80
	.word 0xc2520009  ! 895: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0x87a20829  ! 896: FADDs	fadds	%f8, %f9, %f3
	.word 0xc6d22578  ! 897: LDSHA_I	ldsha	[%r8, + 0x0578] %asi, %r3
	.word 0xc67a0009  ! 898: SWAP_R	swap	%r3, [%r8 + %r9]
	.word 0x944a0009  ! 899: MULX_R	mulx 	%r8, %r9, %r10
	.word 0x8a522458  ! 900: UMUL_I	umul 	%r8, 0x0458, %r5
	.word 0xc48a1009  ! 901: LDUBA_R	lduba	[%r8, %r9] 0x80, %r2
	.word 0xc4ba2440  ! 902: STDA_I	stda	%r2, [%r8 + 0x0440] %asi
	.word 0x88d223f4  ! 903: UMULcc_I	umulcc 	%r8, 0x03f4, %r4
	.word 0xc87a2750  ! 904: SWAP_I	swap	%r4, [%r8 + 0x0750]
	.word 0xc36a2528  ! 905: PREFETCH_I	prefetch	[%r8 + 0x0528], #one_read
	.word 0xa86a2bf0  ! 906: UDIVX_I	udivx 	%r8, 0x0bf0, %r20
	.word 0xe26a0009  ! 907: LDSTUB_R	ldstub	%r17, [%r8 + %r9]
	.word 0x84d20009  ! 908: UMULcc_R	umulcc 	%r8, %r9, %r2
	.word 0xfbe21009  ! 909: CASA_I	casa	[%r8] 0x80, %r9, %r29
	.word 0x12800004  ! 910: BNE	bne  	<label_0x4>
	.word 0x8143e006  ! 911: MEMBAR	membar	#StoreLoad | #LoadStore 
	.word 0x32800004  ! 912: BNE	bne,a	<label_0x4>
	.word 0x8a7a2f8c  ! 913: SDIV_I	sdiv 	%r8, 0x0f8c, %r5
	.word 0xccba2028  ! 914: STDA_I	stda	%r6, [%r8 + 0x0028] %asi
	.word 0xfc520009  ! 915: LDSH_R	ldsh	[%r8 + %r9], %r30
	.word 0xf09a2078  ! 916: LDDA_I	ldda	[%r8, + 0x0078] %asi, %r24
	.word 0x8e7a0009  ! 917: SDIV_R	sdiv 	%r8, %r9, %r7
	.word 0x8143e025  ! 918: MEMBAR	membar	#LoadLoad | #LoadStore | #MemIssue 
	.word 0xc2ea2ac8  ! 919: LDSTUBA_I	ldstuba	%r1, [%r8 + 0x0ac8] %asi
	.word 0xc4a22760  ! 920: STWA_I	stwa	%r2, [%r8 + 0x0760] %asi
	.word 0xc5f22009  ! 921: CASXA_R	casxa	[%r8]%asi, %r9, %r2
	.word 0x06c20008  ! 922: BRLZ	brlz  ,nt	%8,<label_0x20008>
	.word 0xc36a2a38  ! 923: PREFETCH_I	prefetch	[%r8 + 0x0a38], #one_read
	.word 0x0ec20004  ! 924: BRGEZ	brgez  ,nt	%8,<label_0x20004>
	.word 0xf0520009  ! 925: LDSH_R	ldsh	[%r8 + %r9], %r24
	.word 0xcaa21009  ! 926: STWA_R	stwa	%r5, [%r8 + %r9] 0x80
	.word 0xa67a0009  ! 927: SDIV_R	sdiv 	%r8, %r9, %r19
	.word 0xc4fa1009  ! 928: SWAPA_R	swapa	%r2, [%r8 + %r9] 0x80
	.word 0xc252282c  ! 929: LDSH_I	ldsh	[%r8 + 0x082c], %r1
	.word 0xec9a1009  ! 930: LDDA_R	ldda	[%r8, %r9] 0x80, %r22
	.word 0x18800004  ! 931: BGU	bgu  	<label_0x4>
	.word 0xea4a0009  ! 932: LDSB_R	ldsb	[%r8 + %r9], %r21
	.word 0xb6520009  ! 933: UMUL_R	umul 	%r8, %r9, %r27
	.word 0xc49a2728  ! 934: LDDA_I	ldda	[%r8, + 0x0728] %asi, %r2
	.word 0x9da20929  ! 935: FMULs	fmuls	%f8, %f9, %f14
	.word 0xc36a2e60  ! 936: PREFETCH_I	prefetch	[%r8 + 0x0e60], #one_read
	.word 0xd6aa1009  ! 937: STBA_R	stba	%r11, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 938: STBAR	stbar
	.word 0xc66a2cc8  ! 939: LDSTUB_I	ldstub	%r3, [%r8 + 0x0cc8]
	.word 0xce6a0009  ! 940: LDSTUB_R	ldstub	%r7, [%r8 + %r9]
	.word 0x84720009  ! 941: UDIV_R	udiv 	%r8, %r9, %r2
	.word 0xc2aa2998  ! 942: STBA_I	stba	%r1, [%r8 + 0x0998] %asi
	.word 0xcc6a0009  ! 943: LDSTUB_R	ldstub	%r6, [%r8 + %r9]
	.word 0x8143e04b  ! 944: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Sync 
	.word 0x8143c000  ! 945: STBAR	stbar
	.word 0xee42285c  ! 946: LDSW_I	ldsw	[%r8 + 0x085c], %r23
	.word 0x86d22954  ! 947: UMULcc_I	umulcc 	%r8, 0x0954, %r3
	.word 0xc3220009  ! 948: STF_R	st	%f1, [%r9, %r8]
	.word 0xc2fa2618  ! 949: SWAPA_I	swapa	%r1, [%r8 + 0x0618] %asi
	.word 0x8143e070  ! 950: MEMBAR	membar	#Lookaside | #MemIssue | #Sync 
	.word 0x87a20829  ! 951: FADDs	fadds	%f8, %f9, %f3
	.word 0xa84a2b88  ! 952: MULX_I	mulx 	%r8, 0x0b88, %r20
	.word 0xcc420009  ! 953: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xc73a0009  ! 954: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc3ea24f8  ! 955: PREFETCHA_I	prefetcha	[%r8, + 0x04f8] %asi, #one_read
	.word 0x8143c000  ! 956: STBAR	stbar
	.word 0x89a20929  ! 957: FMULs	fmuls	%f8, %f9, %f4
	.word 0xd8922aa8  ! 958: LDUHA_I	lduha	[%r8, + 0x0aa8] %asi, %r12
	.word 0x86f20009  ! 959: UDIVcc_R	udivcc 	%r8, %r9, %r3
	.word 0xceaa2484  ! 960: STBA_I	stba	%r7, [%r8 + 0x0484] %asi
	.word 0xec1a0009  ! 961: LDD_R	ldd	[%r8 + %r9], %r22
	.word 0x83a209a9  ! 962: FDIVs	fdivs	%f8, %f9, %f1
	.word 0x8d6a2cb0  ! 963: SDIVX_I	sdivx	%r8, 0x0cb0, %r6
	.word 0x8a720009  ! 964: UDIV_R	udiv 	%r8, %r9, %r5
	.word 0xceaa1009  ! 965: STBA_R	stba	%r7, [%r8 + %r9] 0x80
	.word 0xc73a2a20  ! 966: STDF_I	std	%f3, [0x0a20, %r8]
	.word 0xe73a0009  ! 967: STDF_R	std	%f19, [%r9, %r8]
	.word 0xf89a1009  ! 968: LDDA_R	ldda	[%r8, %r9] 0x80, %r28
	.word 0xbeda0009  ! 969: SMULcc_R	smulcc 	%r8, %r9, %r31
	.word 0xd41a0009  ! 970: LDD_R	ldd	[%r8 + %r9], %r10
	.word 0x0ac20008  ! 971: BRNZ	brnz  ,nt	%8,<label_0x20008>
	.word 0xcc5a0009  ! 972: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xc67a25dc  ! 973: SWAP_I	swap	%r3, [%r8 + 0x05dc]
	.word 0xc8fa2840  ! 974: SWAPA_I	swapa	%r4, [%r8 + 0x0840] %asi
	.word 0x8af22ec8  ! 975: UDIVcc_I	udivcc 	%r8, 0x0ec8, %r5
	.word 0x83a20929  ! 976: FMULs	fmuls	%f8, %f9, %f1
	.word 0xaa520009  ! 977: UMUL_R	umul 	%r8, %r9, %r21
	.word 0xc65a29e0  ! 978: LDX_I	ldx	[%r8 + 0x09e0], %r3
	.word 0xc3ea2498  ! 979: PREFETCHA_I	prefetcha	[%r8, + 0x0498] %asi, #one_read
	.word 0xc2422000  ! 980: LDSW_I	ldsw	[%r8 + 0x0000], %r1
	.word 0xbe7a21fc  ! 981: SDIV_I	sdiv 	%r8, 0x01fc, %r31
	.word 0x99a20929  ! 982: FMULs	fmuls	%f8, %f9, %f12
	.word 0x8c7a0009  ! 983: SDIV_R	sdiv 	%r8, %r9, %r6
	.word 0xc8a22334  ! 984: STWA_I	stwa	%r4, [%r8 + 0x0334] %asi
	.word 0x827226b4  ! 985: UDIV_I	udiv 	%r8, 0x06b4, %r1
	.word 0xf0ba29c0  ! 986: STDA_I	stda	%r24, [%r8 + 0x09c0] %asi
	.word 0x8143e025  ! 987: MEMBAR	membar	#LoadLoad | #LoadStore | #MemIssue 
	.word 0x22ca0004  ! 988: BRZ	brz,a,pt	%8,<label_0xa0004>
	.word 0xc33a0009  ! 989: STDF_R	std	%f1, [%r9, %r8]
	.word 0xf93a2688  ! 990: STDF_I	std	%f28, [0x0688, %r8]
	.word 0x30800008  ! 991: BA	ba,a	<label_0x8>
	.word 0x867a2abc  ! 992: SDIV_I	sdiv 	%r8, 0x0abc, %r3
	.word 0x2e800004  ! 993: BVS	bvs,a	<label_0x4>
	.word 0xc3e22009  ! 994: CASA_R	casa	[%r8] %asi, %r9, %r1
	.word 0x8143e04d  ! 995: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Sync 
	.word 0xce5224b0  ! 996: LDSH_I	ldsh	[%r8 + 0x04b0], %r7
	.word 0x08800008  ! 997: BLEU	bleu  	<label_0x8>
	.word 0xc3ea2634  ! 998: PREFETCHA_I	prefetcha	[%r8, + 0x0634] %asi, #one_read
	.word 0xc4aa2954  ! 999: STBA_I	stba	%r2, [%r8 + 0x0954] %asi
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
        setx  0x27bc08ff0498a67a, %g1, %r0
        setx  0x1a82c08f9487aba4, %g1, %r1
        setx  0x719bf7997150e07f, %g1, %r2
        setx  0x492e9af8df2d5c96, %g1, %r3
        setx  0xa13b11e678a7269a, %g1, %r4
        setx  0x3f77a6e5a02265e0, %g1, %r5
        setx  0x5ee3211a5341ba28, %g1, %r6
        setx  0x322a62be19914373, %g1, %r7
        setx  0xed0d6d330287e0e1, %g1, %r10
        setx  0x5d564d6899a23479, %g1, %r11
        setx  0xe23c95049e5dd7cd, %g1, %r12
        setx  0x1a31476faa6acb13, %g1, %r13
        setx  0x309bb43237b21323, %g1, %r14
        setx  0xcff6ef5ddf5b248d, %g1, %r15
        setx  0x6bd756443b39b461, %g1, %r16
        setx  0x257442ae91f56c94, %g1, %r17
        setx  0x339554e4817226be, %g1, %r18
        setx  0x91b9a16645bac5dc, %g1, %r19
        setx  0xddb9381db43f07f8, %g1, %r20
        setx  0x680553e6abb79193, %g1, %r21
        setx  0x267867df6c22af41, %g1, %r22
        setx  0xd5216cb74d7ee01b, %g1, %r23
        setx  0x5a36ea2b7f01dd46, %g1, %r24
        setx  0x003d8e282ff2386b, %g1, %r25
        setx  0x6ce292695465e72e, %g1, %r26
        setx  0x5ad54d9d86f99960, %g1, %r27
        setx  0xe8090556f371f91c, %g1, %r28
        setx  0xef11dae943e6f512, %g1, %r29
        setx  0x6ee4e0390970e0cd, %g1, %r30
        setx  0x744b06ee326b49bf, %g1, %r31
	.word 0x85a20829  ! 5: FADDs	fadds	%f8, %f9, %f2
	.word 0x8b220009  ! 6: MULScc_R	mulscc 	%r8, %r9, %r5
	.word 0xc2520009  ! 7: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0x8143c000  ! 8: STBAR	stbar
	.word 0xc9e22009  ! 9: CASA_R	casa	[%r8] %asi, %r9, %r4
	.word 0x885a0009  ! 10: SMUL_R	smul 	%r8, %r9, %r4
	.word 0x08800004  ! 11: BLEU	bleu  	<label_0x4>
	.word 0xdaca2aa4  ! 12: LDSBA_I	ldsba	[%r8, + 0x0aa4] %asi, %r13
	.word 0xcb222600  ! 13: STF_I	st	%f5, [0x0600, %r8]
	.word 0xcaaa1009  ! 14: STBA_R	stba	%r5, [%r8 + %r9] 0x80
	.word 0xf3f22009  ! 15: CASXA_R	casxa	[%r8]%asi, %r9, %r25
	.word 0x0ac20004  ! 16: BRNZ	brnz  ,nt	%8,<label_0x20004>
	.word 0x36800004  ! 17: BGE	bge,a	<label_0x4>
	.word 0x8cf22cdc  ! 18: UDIVcc_I	udivcc 	%r8, 0x0cdc, %r6
	.word 0x8f220009  ! 19: MULScc_R	mulscc 	%r8, %r9, %r7
	.word 0xcbf21009  ! 20: CASXA_I	casxa	[%r8] 0x80, %r9, %r5
	.word 0xcaaa1009  ! 21: STBA_R	stba	%r5, [%r8 + %r9] 0x80
	.word 0xc3ea2410  ! 22: PREFETCHA_I	prefetcha	[%r8, + 0x0410] %asi, #one_read
	.word 0x1c800008  ! 23: BPOS	bpos  	<label_0x8>
	.word 0xf1f21009  ! 24: CASXA_I	casxa	[%r8] 0x80, %r9, %r24
	.word 0xa9a20829  ! 25: FADDs	fadds	%f8, %f9, %f20
	.word 0xc2122f98  ! 26: LDUH_I	lduh	[%r8 + 0x0f98], %r1
	.word 0xfca228bc  ! 27: STWA_I	stwa	%r30, [%r8 + 0x08bc] %asi
	.word 0xc5e22009  ! 28: CASA_R	casa	[%r8] %asi, %r9, %r2
	.word 0xcde21009  ! 29: CASA_I	casa	[%r8] 0x80, %r9, %r6
	.word 0x826a0009  ! 30: UDIVX_R	udivx 	%r8, %r9, %r1
	.word 0xa96a2de8  ! 31: SDIVX_I	sdivx	%r8, 0x0de8, %r20
	.word 0x02c20004  ! 32: BRZ	brz  ,nt	%8,<label_0x20004>
	.word 0xc2da1009  ! 33: LDXA_R	ldxa	[%r8, %r9] 0x80, %r1
	.word 0xc3222abc  ! 34: STF_I	st	%f1, [0x0abc, %r8]
	.word 0x1e800004  ! 35: BVC	bvc  	<label_0x4>
	.word 0x8e6a0009  ! 36: UDIVX_R	udivx 	%r8, %r9, %r7
	.word 0x8143e021  ! 37: MEMBAR	membar	#LoadLoad | #MemIssue 
	.word 0xc4ea1009  ! 38: LDSTUBA_R	ldstuba	%r2, [%r8 + %r9] 0x80
	.word 0xca6a0009  ! 39: LDSTUB_R	ldstub	%r5, [%r8 + %r9]
	.word 0x84522390  ! 40: UMUL_I	umul 	%r8, 0x0390, %r2
	.word 0xc3ea23d4  ! 41: PREFETCHA_I	prefetcha	[%r8, + 0x03d4] %asi, #one_read
	.word 0x08800004  ! 42: BLEU	bleu  	<label_0x4>
	.word 0xd46a2010  ! 43: LDSTUB_I	ldstub	%r10, [%r8 + 0x0010]
	.word 0xc2b22948  ! 44: STHA_I	stha	%r1, [%r8 + 0x0948] %asi
	.word 0x8cd22950  ! 45: UMULcc_I	umulcc 	%r8, 0x0950, %r6
	.word 0x8143c000  ! 46: STBAR	stbar
	.word 0xfa022694  ! 47: LDUW_I	lduw	[%r8 + 0x0694], %r29
	.word 0xf33a2890  ! 48: STDF_I	std	%f25, [0x0890, %r8]
	.word 0xc2022560  ! 49: LDUW_I	lduw	[%r8 + 0x0560], %r1
	.word 0xc27a0009  ! 51: SWAP_R	swap	%r1, [%r8 + %r9]
	.word 0x8143c000  ! 52: STBAR	stbar
	.word 0xc72221e0  ! 53: STF_I	st	%f3, [0x01e0, %r8]
	.word 0xf84a0009  ! 54: LDSB_R	ldsb	[%r8 + %r9], %r28
	.word 0x88d22e54  ! 55: UMULcc_I	umulcc 	%r8, 0x0e54, %r4
	.word 0xc36a215c  ! 56: PREFETCH_I	prefetch	[%r8 + 0x015c], #one_read
	.word 0xa46a26c0  ! 57: UDIVX_I	udivx 	%r8, 0x06c0, %r18
	.word 0xccca2454  ! 58: LDSBA_I	ldsba	[%r8, + 0x0454] %asi, %r6
	.word 0xc85a2c28  ! 59: LDX_I	ldx	[%r8 + 0x0c28], %r4
	.word 0xceb21009  ! 61: STHA_R	stha	%r7, [%r8 + %r9] 0x80
	.word 0x26ca0004  ! 62: BRLZ	brlz,a,pt	%8,<label_0xa0004>
	.word 0x86d20009  ! 63: UMULcc_R	umulcc 	%r8, %r9, %r3
	.word 0x9da20929  ! 64: FMULs	fmuls	%f8, %f9, %f14
	.word 0xf7222adc  ! 65: STF_I	st	%f27, [0x0adc, %r8]
	.word 0x87a208a9  ! 66: FSUBs	fsubs	%f8, %f9, %f3
	.word 0xaf2222f8  ! 67: MULScc_I	mulscc 	%r8, 0x02f8, %r23
	.word 0x02800008  ! 68: BE	be  	<label_0x8>
	.word 0x8da20829  ! 69: FADDs	fadds	%f8, %f9, %f6
	.word 0x852221dc  ! 70: MULScc_I	mulscc 	%r8, 0x01dc, %r2
	.word 0xc4ea1009  ! 71: LDSTUBA_R	ldstuba	%r2, [%r8 + %r9] 0x80
	.word 0xc67a0009  ! 72: SWAP_R	swap	%r3, [%r8 + %r9]
	.word 0x89a20929  ! 73: FMULs	fmuls	%f8, %f9, %f4
	.word 0xce6a2208  ! 74: LDSTUB_I	ldstub	%r7, [%r8 + 0x0208]
	.word 0xca7a0009  ! 75: SWAP_R	swap	%r5, [%r8 + %r9]
	.word 0x825a216c  ! 76: SMUL_I	smul 	%r8, 0x016c, %r1
	.word 0x8fa209a9  ! 77: FDIVs	fdivs	%f8, %f9, %f7
	.word 0xc7e22009  ! 78: CASA_R	casa	[%r8] %asi, %r9, %r3
	.word 0x896a2a7c  ! 79: SDIVX_I	sdivx	%r8, 0x0a7c, %r4
	.word 0xf81a2b68  ! 80: LDD_I	ldd	[%r8 + 0x0b68], %r28
	.word 0x8e5a0009  ! 81: SMUL_R	smul 	%r8, %r9, %r7
	.word 0x40000004  ! 82: CALL	call	disp30_4
	.word 0xb66a0009  ! 83: UDIVX_R	udivx 	%r8, %r9, %r27
	.word 0xb6f20009  ! 84: UDIVcc_R	udivcc 	%r8, %r9, %r27
	.word 0xca921009  ! 85: LDUHA_R	lduha	[%r8, %r9] 0x80, %r5
	.word 0xc36a2500  ! 86: PREFETCH_I	prefetch	[%r8 + 0x0500], #one_read
	.word 0xcff21009  ! 87: CASXA_I	casxa	[%r8] 0x80, %r9, %r7
	.word 0xd46a2358  ! 88: LDSTUB_I	ldstub	%r10, [%r8 + 0x0358]
	.word 0xd6aa1009  ! 89: STBA_R	stba	%r11, [%r8 + %r9] 0x80
	.word 0x845a0009  ! 90: SMUL_R	smul 	%r8, %r9, %r2
	.word 0x8143e024  ! 91: MEMBAR	membar	#LoadStore | #MemIssue 
	.word 0x8f6a0009  ! 92: SDIVX_R	sdivx	%r8, %r9, %r7
	.word 0xcc5a25c0  ! 93: LDX_I	ldx	[%r8 + 0x05c0], %r6
	.word 0x824a0009  ! 94: MULX_R	mulx 	%r8, %r9, %r1
	.word 0xfea22418  ! 96: STWA_I	stwa	%r31, [%r8 + 0x0418] %asi
	.word 0x8a5a27a8  ! 98: SMUL_I	smul 	%r8, 0x07a8, %r5
	.word 0x89a209a9  ! 99: FDIVs	fdivs	%f8, %f9, %f4
	.word 0xca8a23dc  ! 100: LDUBA_I	lduba	[%r8, + 0x03dc] %asi, %r5
	.word 0xf0d22308  ! 101: LDSHA_I	ldsha	[%r8, + 0x0308] %asi, %r24
	.word 0xca0a0009  ! 102: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0x8ed22c20  ! 103: UMULcc_I	umulcc 	%r8, 0x0c20, %r7
	.word 0x866a21c0  ! 104: UDIVX_I	udivx 	%r8, 0x01c0, %r3
	.word 0xae722850  ! 105: UDIV_I	udiv 	%r8, 0x0850, %r23
	.word 0xceca26ec  ! 106: LDSBA_I	ldsba	[%r8, + 0x06ec] %asi, %r7
	.word 0xa36a2590  ! 107: SDIVX_I	sdivx	%r8, 0x0590, %r17
	.word 0x8c6a0009  ! 108: UDIVX_R	udivx 	%r8, %r9, %r6
	.word 0x0a800004  ! 109: BCS	bcs  	<label_0x4>
	.word 0x865a0009  ! 110: SMUL_R	smul 	%r8, %r9, %r3
	.word 0xf8d21009  ! 111: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r28
	.word 0xe4ba1009  ! 112: STDA_R	stda	%r18, [%r8 + %r9] 0x80
	.word 0x08800008  ! 113: BLEU	bleu  	<label_0x8>
	.word 0x8143e03c  ! 114: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0xcbf22009  ! 115: CASXA_R	casxa	[%r8]%asi, %r9, %r5
	.word 0xd7f22009  ! 116: CASXA_R	casxa	[%r8]%asi, %r9, %r11
	.word 0xcca21009  ! 117: STWA_R	stwa	%r6, [%r8 + %r9] 0x80
	.word 0x827a0009  ! 118: SDIV_R	sdiv 	%r8, %r9, %r1
	.word 0x8143e05f  ! 119: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0xc8da2810  ! 120: LDXA_I	ldxa	[%r8, + 0x0810] %asi, %r4
	.word 0xc3ea2d44  ! 121: PREFETCHA_I	prefetcha	[%r8, + 0x0d44] %asi, #one_read
	.word 0x1c800004  ! 122: BPOS	bpos  	<label_0x4>
	.word 0xcc520009  ! 123: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xc8822558  ! 124: LDUWA_I	lduwa	[%r8, + 0x0558] %asi, %r4
	.word 0x8143c000  ! 125: STBAR	stbar
	.word 0x8e5a2234  ! 126: SMUL_I	smul 	%r8, 0x0234, %r7
	.word 0xe66a2f78  ! 127: LDSTUB_I	ldstub	%r19, [%r8 + 0x0f78]
	.word 0x1e800004  ! 129: BVC	bvc  	<label_0x4>
	.word 0xfaa22054  ! 130: STWA_I	stwa	%r29, [%r8 + 0x0054] %asi
	.word 0x9a6a22ec  ! 134: UDIVX_I	udivx 	%r8, 0x02ec, %r13
	.word 0xc20a2930  ! 135: LDUB_I	ldub	[%r8 + 0x0930], %r1
	.word 0xc2020009  ! 136: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xc8f21009  ! 137: STXA_R	stxa	%r4, [%r8 + %r9] 0x80
	.word 0xc87a0009  ! 138: SWAP_R	swap	%r4, [%r8 + %r9]
	.word 0x89a20829  ! 139: FADDs	fadds	%f8, %f9, %f4
	.word 0xceda2998  ! 140: LDXA_I	ldxa	[%r8, + 0x0998] %asi, %r7
	.word 0xbed227c0  ! 141: UMULcc_I	umulcc 	%r8, 0x07c0, %r31
	.word 0x8143e056  ! 142: MEMBAR	membar	#StoreLoad | #LoadStore | #Lookaside | #Sync 
	.word 0x06800008  ! 143: BL	bl  	<label_0x8>
	.word 0xc3ea23dc  ! 144: PREFETCHA_I	prefetcha	[%r8, + 0x03dc] %asi, #one_read
	.word 0x28800004  ! 145: BLEU	bleu,a	<label_0x4>
	.word 0x86720009  ! 146: UDIV_R	udiv 	%r8, %r9, %r3
	.word 0x8143c000  ! 147: STBAR	stbar
	.word 0x82f22170  ! 148: UDIVcc_I	udivcc 	%r8, 0x0170, %r1
	.word 0xbfa209a9  ! 149: FDIVs	fdivs	%f8, %f9, %f31
	.word 0xeaaa2d14  ! 150: STBA_I	stba	%r21, [%r8 + 0x0d14] %asi
	.word 0xf7f21009  ! 151: CASXA_I	casxa	[%r8] 0x80, %r9, %r27
	.word 0xc80a270c  ! 152: LDUB_I	ldub	[%r8 + 0x070c], %r4
	.word 0x8d6a0009  ! 153: SDIVX_R	sdivx	%r8, %r9, %r6
	.word 0xc7f22009  ! 154: CASXA_R	casxa	[%r8]%asi, %r9, %r3
	.word 0x8d220009  ! 155: MULScc_R	mulscc 	%r8, %r9, %r6
	.word 0xc36a2e54  ! 156: PREFETCH_I	prefetch	[%r8 + 0x0e54], #one_read
	.word 0xb4da260c  ! 157: SMULcc_I	smulcc 	%r8, 0x060c, %r26
	.word 0x00800008  ! 158: BN	bn  	<label_0x8>
	.word 0xc33a0009  ! 159: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc73a2b38  ! 160: STDF_I	std	%f3, [0x0b38, %r8]
	.word 0xca0a26d4  ! 161: LDUB_I	ldub	[%r8 + 0x06d4], %r5
	.word 0x89a208a9  ! 162: FSUBs	fsubs	%f8, %f9, %f4
	.word 0xc6b21009  ! 163: STHA_R	stha	%r3, [%r8 + %r9] 0x80
	.word 0x8143e01e  ! 164: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside 
	.word 0xc6fa1009  ! 165: SWAPA_R	swapa	%r3, [%r8 + %r9] 0x80
	.word 0xc53a2ca8  ! 166: STDF_I	std	%f2, [0x0ca8, %r8]
	.word 0xdc522df8  ! 167: LDSH_I	ldsh	[%r8 + 0x0df8], %r14
	.word 0x8a4a0009  ! 168: MULX_R	mulx 	%r8, %r9, %r5
	.word 0xc3220009  ! 169: STF_R	st	%f1, [%r9, %r8]
	.word 0xc3ea2750  ! 170: PREFETCHA_I	prefetcha	[%r8, + 0x0750] %asi, #one_read
	.word 0x1a800004  ! 171: BCC	bcc  	<label_0x4>
	.word 0xd41a2460  ! 173: LDD_I	ldd	[%r8 + 0x0460], %r10
	.word 0xc8a22e20  ! 174: STWA_I	stwa	%r4, [%r8 + 0x0e20] %asi
	.word 0x38800008  ! 175: BGU	bgu,a	<label_0x8>
	.word 0xc49a1009  ! 176: LDDA_R	ldda	[%r8, %r9] 0x80, %r2
	.word 0xbcf22640  ! 177: UDIVcc_I	udivcc 	%r8, 0x0640, %r30
	.word 0xcca21009  ! 179: STWA_R	stwa	%r6, [%r8 + %r9] 0x80
	.word 0x8143e017  ! 180: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside 
	.word 0xcc0a2014  ! 181: LDUB_I	ldub	[%r8 + 0x0014], %r6
	.word 0x8143e00d  ! 182: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore 
	.word 0x8143c000  ! 183: STBAR	stbar
	.word 0xcb3a0009  ! 184: STDF_R	std	%f5, [%r9, %r8]
	.word 0xd8ba2ef0  ! 185: STDA_I	stda	%r12, [%r8 + 0x0ef0] %asi
	.word 0xf01a2370  ! 186: LDD_I	ldd	[%r8 + 0x0370], %r24
	.word 0xe1f22009  ! 187: CASXA_R	casxa	[%r8]%asi, %r9, %r16
	.word 0x8143e058  ! 188: MEMBAR	membar	#StoreStore | #Lookaside | #Sync 
	.word 0xbf220009  ! 189: MULScc_R	mulscc 	%r8, %r9, %r31
	.word 0xc36a2948  ! 190: PREFETCH_I	prefetch	[%r8 + 0x0948], #one_read
	.word 0x16800008  ! 191: BGE	bge  	<label_0x8>
	.word 0xceca29a8  ! 192: LDSBA_I	ldsba	[%r8, + 0x09a8] %asi, %r7
	.word 0xcdf22009  ! 193: CASXA_R	casxa	[%r8]%asi, %r9, %r6
	.word 0x98722ce0  ! 195: UDIV_I	udiv 	%r8, 0x0ce0, %r12
	.word 0xd93a0009  ! 196: STDF_R	std	%f12, [%r9, %r8]
	.word 0xc4120009  ! 197: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0x40000004  ! 198: CALL	call	disp30_4
	.word 0x996a2d78  ! 199: SDIVX_I	sdivx	%r8, 0x0d78, %r12
	.word 0xfcaa2d14  ! 200: STBA_I	stba	%r30, [%r8 + 0x0d14] %asi
	.word 0x2e800008  ! 201: BVS	bvs,a	<label_0x8>
	.word 0xd4f22268  ! 202: STXA_I	stxa	%r10, [%r8 + 0x0268] %asi
	.word 0x824a0009  ! 203: MULX_R	mulx 	%r8, %r9, %r1
	.word 0xce522c2c  ! 204: LDSH_I	ldsh	[%r8 + 0x0c2c], %r7
	.word 0x87a208a9  ! 205: FSUBs	fsubs	%f8, %f9, %f3
	.word 0xc6aa1009  ! 206: STBA_R	stba	%r3, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 207: STBAR	stbar
	.word 0xd87a28fc  ! 208: SWAP_I	swap	%r12, [%r8 + 0x08fc]
	.word 0x1e800008  ! 209: BVC	bvc  	<label_0x8>
	.word 0x864a2158  ! 210: MULX_I	mulx 	%r8, 0x0158, %r3
	.word 0x08800008  ! 211: BLEU	bleu  	<label_0x8>
	.word 0x2ec20004  ! 212: BRGEZ	brgez,a,nt	%8,<label_0x20004>
	.word 0xca122edc  ! 213: LDUH_I	lduh	[%r8 + 0x0edc], %r5
	.word 0x8143e01c  ! 214: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside 
	.word 0x84f20009  ! 215: UDIVcc_R	udivcc 	%r8, %r9, %r2
	.word 0xe9e22009  ! 216: CASA_R	casa	[%r8] %asi, %r9, %r20
	.word 0x2cca0004  ! 217: BRGZ	brgz,a,pt	%8,<label_0xa0004>
	.word 0xa06a0009  ! 218: UDIVX_R	udivx 	%r8, %r9, %r16
	.word 0xaad20009  ! 219: UMULcc_R	umulcc 	%r8, %r9, %r21
	.word 0x847a2d0c  ! 220: SDIV_I	sdiv 	%r8, 0x0d0c, %r2
	.word 0xc3ea2194  ! 221: PREFETCHA_I	prefetcha	[%r8, + 0x0194] %asi, #one_read
	.word 0xb84a0009  ! 222: MULX_R	mulx 	%r8, %r9, %r28
	.word 0xc8fa1009  ! 223: SWAPA_R	swapa	%r4, [%r8 + %r9] 0x80
	.word 0x8143e066  ! 224: MEMBAR	membar	#StoreLoad | #LoadStore | #MemIssue | #Sync 
	.word 0x8143e071  ! 225: MEMBAR	membar	#LoadLoad | #Lookaside | #MemIssue | #Sync 
	.word 0xf53a2860  ! 226: STDF_I	std	%f26, [0x0860, %r8]
	.word 0xcfe21009  ! 227: CASA_I	casa	[%r8] 0x80, %r9, %r7
	.word 0x24ca0004  ! 228: BRLEZ	brlez,a,pt	%8,<label_0xa0004>
	.word 0xdc9a1009  ! 229: LDDA_R	ldda	[%r8, %r9] 0x80, %r14
	.word 0xf1e22009  ! 230: CASA_R	casa	[%r8] %asi, %r9, %r24
	.word 0x8d6a24a0  ! 232: SDIVX_I	sdivx	%r8, 0x04a0, %r6
	.word 0xc44a2f98  ! 235: LDSB_I	ldsb	[%r8 + 0x0f98], %r2
	.word 0x84520009  ! 236: UMUL_R	umul 	%r8, %r9, %r2
	.word 0x88520009  ! 237: UMUL_R	umul 	%r8, %r9, %r4
	.word 0xc36a23e4  ! 238: PREFETCH_I	prefetch	[%r8 + 0x03e4], #one_read
	.word 0x8143e072  ! 239: MEMBAR	membar	#StoreLoad | #Lookaside | #MemIssue | #Sync 
	.word 0xdfe22009  ! 240: CASA_R	casa	[%r8] %asi, %r9, %r15
	.word 0xc8f21009  ! 241: STXA_R	stxa	%r4, [%r8 + %r9] 0x80
	.word 0xc4ba2988  ! 243: STDA_I	stda	%r2, [%r8 + 0x0988] %asi
	.word 0x8a6a2788  ! 244: UDIVX_I	udivx 	%r8, 0x0788, %r5
	.word 0x40000004  ! 245: CALL	call	disp30_4
	.word 0xc92229a4  ! 246: STF_I	st	%f4, [0x09a4, %r8]
	.word 0x846a27a0  ! 247: UDIVX_I	udivx 	%r8, 0x07a0, %r2
	.word 0xe6522a30  ! 248: LDSH_I	ldsh	[%r8 + 0x0a30], %r19
	.word 0x8da208a9  ! 249: FSUBs	fsubs	%f8, %f9, %f6
	.word 0x8143e05b  ! 250: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Lookaside | #Sync 
	.word 0x88fa0009  ! 251: SDIVcc_R	sdivcc 	%r8, %r9, %r4
	.word 0x9c5a0009  ! 252: SMUL_R	smul 	%r8, %r9, %r14
	.word 0xff3a0009  ! 253: STDF_R	std	%f31, [%r9, %r8]
	.word 0xc44a0009  ! 254: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xc2ca2830  ! 255: LDSBA_I	ldsba	[%r8, + 0x0830] %asi, %r1
	.word 0xc3ea259c  ! 256: PREFETCHA_I	prefetcha	[%r8, + 0x059c] %asi, #one_read
	.word 0xfc9a1009  ! 257: LDDA_R	ldda	[%r8, %r9] 0x80, %r30
	.word 0xf0b22a60  ! 258: STHA_I	stha	%r24, [%r8 + 0x0a60] %asi
	.word 0xc33a2000  ! 259: STDF_I	std	%f1, [0x0000, %r8]
	.word 0xc93a2d30  ! 260: STDF_I	std	%f4, [0x0d30, %r8]
	.word 0x8143e07d  ! 261: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0x985a2524  ! 262: SMUL_I	smul 	%r8, 0x0524, %r12
	.word 0xe0b21009  ! 263: STHA_R	stha	%r16, [%r8 + %r9] 0x80
	.word 0x20800004  ! 264: BN	bn,a	<label_0x4>
	.word 0xf6aa2608  ! 265: STBA_I	stba	%r27, [%r8 + 0x0608] %asi
	.word 0x3e800004  ! 267: BVC	bvc,a	<label_0x4>
	.word 0xc6921009  ! 268: LDUHA_R	lduha	[%r8, %r9] 0x80, %r3
	.word 0x89a20829  ! 269: FADDs	fadds	%f8, %f9, %f4
	.word 0xbf220009  ! 270: MULScc_R	mulscc 	%r8, %r9, %r31
	.word 0xccba1009  ! 271: STDA_R	stda	%r6, [%r8 + %r9] 0x80
	.word 0x10800008  ! 272: BA	ba  	<label_0x8>
	.word 0xa6f2258c  ! 273: UDIVcc_I	udivcc 	%r8, 0x058c, %r19
	.word 0xc8a21009  ! 274: STWA_R	stwa	%r4, [%r8 + %r9] 0x80
	.word 0x8ed20009  ! 275: UMULcc_R	umulcc 	%r8, %r9, %r7
	.word 0xcd222c88  ! 276: STF_I	st	%f6, [0x0c88, %r8]
	.word 0xebe22009  ! 277: CASA_R	casa	[%r8] %asi, %r9, %r21
	.word 0xc64a0009  ! 278: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xc5f22009  ! 279: CASXA_R	casxa	[%r8]%asi, %r9, %r2
	.word 0xc5220009  ! 280: STF_R	st	%f2, [%r9, %r8]
	.word 0xc3ea25f4  ! 281: PREFETCHA_I	prefetcha	[%r8, + 0x05f4] %asi, #one_read
	.word 0xc29221ec  ! 282: LDUHA_I	lduha	[%r8, + 0x01ec] %asi, %r1
	.word 0x84f20009  ! 283: UDIVcc_R	udivcc 	%r8, %r9, %r2
	.word 0xf49a2188  ! 284: LDDA_I	ldda	[%r8, + 0x0188] %asi, %r26
	.word 0xe4f21009  ! 285: STXA_R	stxa	%r18, [%r8 + %r9] 0x80
	.word 0x8ba209a9  ! 288: FDIVs	fdivs	%f8, %f9, %f5
	.word 0x8b6a0009  ! 290: SDIVX_R	sdivx	%r8, %r9, %r5
	.word 0xc40a2398  ! 291: LDUB_I	ldub	[%r8 + 0x0398], %r2
	.word 0xf8da2f98  ! 292: LDXA_I	ldxa	[%r8, + 0x0f98] %asi, %r28
	.word 0xc65a0009  ! 293: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xc7f22009  ! 294: CASXA_R	casxa	[%r8]%asi, %r9, %r3
	.word 0x896a2e18  ! 295: SDIVX_I	sdivx	%r8, 0x0e18, %r4
	.word 0x8143e02b  ! 296: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #MemIssue 
	.word 0xc36a22d4  ! 297: PREFETCH_I	prefetch	[%r8 + 0x02d4], #one_read
	.word 0xb4d22488  ! 298: UMULcc_I	umulcc 	%r8, 0x0488, %r26
	.word 0xd7e21009  ! 299: CASA_I	casa	[%r8] 0x80, %r9, %r11
	.word 0x8143c000  ! 300: STBAR	stbar
	.word 0xd6821009  ! 301: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r11
	.word 0xc68a1009  ! 302: LDUBA_R	lduba	[%r8, %r9] 0x80, %r3
	.word 0x8fa208a9  ! 304: FSUBs	fsubs	%f8, %f9, %f7
	.word 0x846a0009  ! 305: UDIVX_R	udivx 	%r8, %r9, %r2
	.word 0xbe722590  ! 306: UDIV_I	udiv 	%r8, 0x0590, %r31
	.word 0xceb21009  ! 307: STHA_R	stha	%r7, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 308: STBAR	stbar
	.word 0xfc9a1009  ! 309: LDDA_R	ldda	[%r8, %r9] 0x80, %r30
	.word 0x866a0009  ! 310: UDIVX_R	udivx 	%r8, %r9, %r3
	.word 0x82d22734  ! 311: UMULcc_I	umulcc 	%r8, 0x0734, %r1
	.word 0xc3ea234c  ! 312: PREFETCHA_I	prefetcha	[%r8, + 0x034c] %asi, #one_read
	.word 0xf24a0009  ! 313: LDSB_R	ldsb	[%r8 + %r9], %r25
	.word 0xd9222a70  ! 314: STF_I	st	%f12, [0x0a70, %r8]
	.word 0xe6ca1009  ! 315: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r19
	.word 0xebf21009  ! 317: CASXA_I	casxa	[%r8] 0x80, %r9, %r21
	.word 0xb8d20009  ! 318: UMULcc_R	umulcc 	%r8, %r9, %r28
	.word 0xe01a0009  ! 319: LDD_R	ldd	[%r8 + %r9], %r16
	.word 0x865a0009  ! 321: SMUL_R	smul 	%r8, %r9, %r3
	.word 0x3e800004  ! 322: BVC	bvc,a	<label_0x4>
	.word 0xf7e21009  ! 323: CASA_I	casa	[%r8] 0x80, %r9, %r27
	.word 0xceca1009  ! 324: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r7
	.word 0x8143c000  ! 327: STBAR	stbar
	.word 0xc36a2434  ! 328: PREFETCH_I	prefetch	[%r8 + 0x0434], #one_read
	.word 0xcbe21009  ! 329: CASA_I	casa	[%r8] 0x80, %r9, %r5
	.word 0xcaaa1009  ! 330: STBA_R	stba	%r5, [%r8 + %r9] 0x80
	.word 0xe89a1009  ! 331: LDDA_R	ldda	[%r8, %r9] 0x80, %r20
	.word 0xeeda25a8  ! 332: LDXA_I	ldxa	[%r8, + 0x05a8] %asi, %r23
	.word 0x02ca0004  ! 333: BRZ	brz  ,pt	%8,<label_0xa0004>
	.word 0xc40a0009  ! 334: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xd4ba1009  ! 335: STDA_R	stda	%r10, [%r8 + %r9] 0x80
	.word 0x16800004  ! 336: BGE	bge  	<label_0x4>
	.word 0xc6420009  ! 337: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xcb3a2398  ! 338: STDF_I	std	%f5, [0x0398, %r8]
	.word 0x886a0009  ! 339: UDIVX_R	udivx 	%r8, %r9, %r4
	.word 0x83a20929  ! 340: FMULs	fmuls	%f8, %f9, %f1
	.word 0x8d6a2510  ! 341: SDIVX_I	sdivx	%r8, 0x0510, %r6
	.word 0x8e6a0009  ! 342: UDIVX_R	udivx 	%r8, %r9, %r7
	.word 0xc2da1009  ! 343: LDXA_R	ldxa	[%r8, %r9] 0x80, %r1
	.word 0xfb3a2878  ! 344: STDF_I	std	%f29, [0x0878, %r8]
	.word 0x85a20829  ! 345: FADDs	fadds	%f8, %f9, %f2
	.word 0xce7a2b3c  ! 346: SWAP_I	swap	%r7, [%r8 + 0x0b3c]
	.word 0xb8fa2d0c  ! 347: SDIVcc_I	sdivcc 	%r8, 0x0d0c, %r28
	.word 0xb86a2868  ! 348: UDIVX_I	udivx 	%r8, 0x0868, %r28
	.word 0xc8fa1009  ! 349: SWAPA_R	swapa	%r4, [%r8 + %r9] 0x80
	.word 0xc4ea1009  ! 350: LDSTUBA_R	ldstuba	%r2, [%r8 + %r9] 0x80
	.word 0xfc8a2518  ! 351: LDUBA_I	lduba	[%r8, + 0x0518] %asi, %r30
	.word 0xe20a229c  ! 352: LDUB_I	ldub	[%r8 + 0x029c], %r17
	.word 0x8e7a2970  ! 353: SDIV_I	sdiv 	%r8, 0x0970, %r7
	.word 0xc6b22d30  ! 354: STHA_I	stha	%r3, [%r8 + 0x0d30] %asi
	.word 0xbda208a9  ! 355: FSUBs	fsubs	%f8, %f9, %f30
	.word 0xc4120009  ! 356: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xeaca2634  ! 357: LDSBA_I	ldsba	[%r8, + 0x0634] %asi, %r21
	.word 0xce422b90  ! 358: LDSW_I	ldsw	[%r8 + 0x0b90], %r7
	.word 0xc81a0009  ! 359: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xc4821009  ! 360: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r2
	.word 0xc8520009  ! 361: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0x8143e05f  ! 362: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0xc27a29e0  ! 363: SWAP_I	swap	%r1, [%r8 + 0x09e0]
	.word 0x844a2338  ! 364: MULX_I	mulx 	%r8, 0x0338, %r2
	.word 0x2eca0004  ! 365: BRGEZ	brgez,a,pt	%8,<label_0xa0004>
	.word 0xbf6a2170  ! 366: SDIVX_I	sdivx	%r8, 0x0170, %r31
	.word 0xe8020009  ! 367: LDUW_R	lduw	[%r8 + %r9], %r20
	.word 0x896a2244  ! 368: SDIVX_I	sdivx	%r8, 0x0244, %r4
	.word 0xfcb22734  ! 369: STHA_I	stha	%r30, [%r8 + 0x0734] %asi
	.word 0x8ada0009  ! 370: SMULcc_R	smulcc 	%r8, %r9, %r5
	.word 0xda5a0009  ! 371: LDX_R	ldx	[%r8 + %r9], %r13
	.word 0x0c800004  ! 372: BNEG	bneg  	<label_0x4>
	.word 0x8afa0009  ! 373: SDIVcc_R	sdivcc 	%r8, %r9, %r5
	.word 0x9ed22aa4  ! 374: UMULcc_I	umulcc 	%r8, 0x0aa4, %r15
	.word 0x8143c000  ! 375: STBAR	stbar
	.word 0x9da20829  ! 376: FADDs	fadds	%f8, %f9, %f14
	.word 0x8afa0009  ! 377: SDIVcc_R	sdivcc 	%r8, %r9, %r5
	.word 0x947a0009  ! 378: SDIV_R	sdiv 	%r8, %r9, %r10
	.word 0x34800008  ! 379: BG	bg,a	<label_0x8>
	.word 0x827a2c44  ! 380: SDIV_I	sdiv 	%r8, 0x0c44, %r1
	.word 0x0cca0008  ! 381: BRGZ	brgz  ,pt	%8,<label_0xa0008>
	.word 0x85a209a9  ! 382: FDIVs	fdivs	%f8, %f9, %f2
	.word 0xc8420009  ! 383: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0x9cf20009  ! 384: UDIVcc_R	udivcc 	%r8, %r9, %r14
	.word 0x865a0009  ! 385: SMUL_R	smul 	%r8, %r9, %r3
	.word 0xc8f22650  ! 386: STXA_I	stxa	%r4, [%r8 + 0x0650] %asi
	.word 0x8d222684  ! 387: MULScc_I	mulscc 	%r8, 0x0684, %r6
	.word 0xc3ea2170  ! 388: PREFETCHA_I	prefetcha	[%r8, + 0x0170] %asi, #one_read
	.word 0x85222bec  ! 389: MULScc_I	mulscc 	%r8, 0x0bec, %r2
	.word 0xf7222098  ! 390: STF_I	st	%f27, [0x0098, %r8]
	.word 0xf0ca2cf8  ! 391: LDSBA_I	ldsba	[%r8, + 0x0cf8] %asi, %r24
	.word 0xde420009  ! 392: LDSW_R	ldsw	[%r8 + %r9], %r15
	.word 0x8fa20929  ! 393: FMULs	fmuls	%f8, %f9, %f7
	.word 0xe4022a3c  ! 394: LDUW_I	lduw	[%r8 + 0x0a3c], %r18
	.word 0xcc921009  ! 395: LDUHA_R	lduha	[%r8, %r9] 0x80, %r6
	.word 0xb2f20009  ! 396: UDIVcc_R	udivcc 	%r8, %r9, %r25
	.word 0xc6ea1009  ! 397: LDSTUBA_R	ldstuba	%r3, [%r8 + %r9] 0x80
	.word 0xaf6a248c  ! 398: SDIVX_I	sdivx	%r8, 0x048c, %r23
	.word 0xc8da2928  ! 399: LDXA_I	ldxa	[%r8, + 0x0928] %asi, %r4
	.word 0x0c800008  ! 400: BNEG	bneg  	<label_0x8>
	.word 0xc65a20c8  ! 401: LDX_I	ldx	[%r8 + 0x00c8], %r3
	.word 0xc2ea1009  ! 402: LDSTUBA_R	ldstuba	%r1, [%r8 + %r9] 0x80
	.word 0xc27a0009  ! 403: SWAP_R	swap	%r1, [%r8 + %r9]
	.word 0x1e800004  ! 404: BVC	bvc  	<label_0x4>
	.word 0xc3ea27cc  ! 405: PREFETCHA_I	prefetcha	[%r8, + 0x07cc] %asi, #one_read
	.word 0x12800004  ! 406: BNE	bne  	<label_0x4>
	.word 0xc2ea1009  ! 407: LDSTUBA_R	ldstuba	%r1, [%r8 + %r9] 0x80
	.word 0x88520009  ! 408: UMUL_R	umul 	%r8, %r9, %r4
	.word 0x04c20004  ! 409: BRLEZ	brlez  ,nt	%8,<label_0x20004>
	.word 0xada20829  ! 410: FADDs	fadds	%f8, %f9, %f22
	.word 0x0cc20004  ! 411: BRGZ	brgz  ,nt	%8,<label_0x20004>
	.word 0xe28a1009  ! 412: LDUBA_R	lduba	[%r8, %r9] 0x80, %r17
	.word 0x9da20929  ! 413: FMULs	fmuls	%f8, %f9, %f14
	.word 0x36800008  ! 414: BGE	bge,a	<label_0x8>
	.word 0xec9a1009  ! 415: LDDA_R	ldda	[%r8, %r9] 0x80, %r22
	.word 0x827a0009  ! 416: SDIV_R	sdiv 	%r8, %r9, %r1
	.word 0xfcba1009  ! 417: STDA_R	stda	%r30, [%r8 + %r9] 0x80
	.word 0x3c800004  ! 418: BPOS	bpos,a	<label_0x4>
	.word 0xb6da0009  ! 419: SMULcc_R	smulcc 	%r8, %r9, %r27
	.word 0x06ca0008  ! 420: BRLZ	brlz  ,pt	%8,<label_0xa0008>
	.word 0x87220009  ! 421: MULScc_R	mulscc 	%r8, %r9, %r3
	.word 0x32800004  ! 422: BNE	bne,a	<label_0x4>
	.word 0xc81a2270  ! 423: LDD_I	ldd	[%r8 + 0x0270], %r4
	.word 0x40000004  ! 424: CALL	call	disp30_4
	.word 0xc8aa2364  ! 425: STBA_I	stba	%r4, [%r8 + 0x0364] %asi
	.word 0xfcaa1009  ! 426: STBA_R	stba	%r30, [%r8 + %r9] 0x80
	.word 0xc5f21009  ! 427: CASXA_I	casxa	[%r8] 0x80, %r9, %r2
	.word 0x825a0009  ! 428: SMUL_R	smul 	%r8, %r9, %r1
	.word 0x98da0009  ! 429: SMULcc_R	smulcc 	%r8, %r9, %r12
	.word 0x24c20004  ! 430: BRLEZ	brlez,a,nt	%8,<label_0x20004>
	.word 0xc28a20d0  ! 431: LDUBA_I	lduba	[%r8, + 0x00d0] %asi, %r1
	.word 0x8143e000  ! 432: MEMBAR	membar	
	.word 0xce4a2c38  ! 433: LDSB_I	ldsb	[%r8 + 0x0c38], %r7
	.word 0xc4aa2e58  ! 434: STBA_I	stba	%r2, [%r8 + 0x0e58] %asi
	.word 0x8143c000  ! 435: STBAR	stbar
	.word 0x0ac20004  ! 436: BRNZ	brnz  ,nt	%8,<label_0x20004>
	.word 0x84f20009  ! 437: UDIVcc_R	udivcc 	%r8, %r9, %r2
	.word 0x9c4a0009  ! 438: MULX_R	mulx 	%r8, %r9, %r14
	.word 0xf8fa1009  ! 439: SWAPA_R	swapa	%r28, [%r8 + %r9] 0x80
	.word 0x0cc20008  ! 440: BRGZ	brgz  ,nt	%8,<label_0x20008>
	.word 0xec9a1009  ! 441: LDDA_R	ldda	[%r8, %r9] 0x80, %r22
	.word 0x8143c000  ! 442: STBAR	stbar
	.word 0x2e800004  ! 443: BVS	bvs,a	<label_0x4>
	.word 0x8143c000  ! 444: STBAR	stbar
	.word 0xc2a22dd4  ! 445: STWA_I	stwa	%r1, [%r8 + 0x0dd4] %asi
	.word 0xfeb22d68  ! 446: STHA_I	stha	%r31, [%r8 + 0x0d68] %asi
	.word 0xca5a28f8  ! 447: LDX_I	ldx	[%r8 + 0x08f8], %r5
	.word 0xc86a27a4  ! 448: LDSTUB_I	ldstub	%r4, [%r8 + 0x07a4]
	.word 0x8a5a0009  ! 449: SMUL_R	smul 	%r8, %r9, %r5
	.word 0x87a208a9  ! 450: FSUBs	fsubs	%f8, %f9, %f3
	.word 0xc3ea24e4  ! 451: PREFETCHA_I	prefetcha	[%r8, + 0x04e4] %asi, #one_read
	.word 0x24800004  ! 452: BLE	ble,a	<label_0x4>
	.word 0xc6ea2154  ! 453: LDSTUBA_I	ldstuba	%r3, [%r8 + 0x0154] %asi
	.word 0x8143e018  ! 454: MEMBAR	membar	#StoreStore | #Lookaside 
	.word 0x89a209a9  ! 455: FDIVs	fdivs	%f8, %f9, %f4
	.word 0x8143e02a  ! 456: MEMBAR	membar	#StoreLoad | #StoreStore | #MemIssue 
	.word 0x86720009  ! 460: UDIV_R	udiv 	%r8, %r9, %r3
	.word 0xc6122bc8  ! 461: LDUH_I	lduh	[%r8 + 0x0bc8], %r3
	.word 0xc6aa2a10  ! 462: STBA_I	stba	%r3, [%r8 + 0x0a10] %asi
	.word 0xbe4a2de8  ! 463: MULX_I	mulx 	%r8, 0x0de8, %r31
	.word 0xf09a1009  ! 465: LDDA_R	ldda	[%r8, %r9] 0x80, %r24
	.word 0x10800008  ! 466: BA	ba  	<label_0x8>
	.word 0xc36a23f8  ! 467: PREFETCH_I	prefetch	[%r8 + 0x03f8], #one_read
	.word 0xe4ca1009  ! 468: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r18
	.word 0xc80224e0  ! 469: LDUW_I	lduw	[%r8 + 0x04e0], %r4
	.word 0x9efa2214  ! 470: SDIVcc_I	sdivcc 	%r8, 0x0214, %r15
	.word 0xf4ba1009  ! 472: STDA_R	stda	%r26, [%r8 + %r9] 0x80
	.word 0xccea1009  ! 474: LDSTUBA_R	ldstuba	%r6, [%r8 + %r9] 0x80
	.word 0xc8a22c14  ! 475: STWA_I	stwa	%r4, [%r8 + 0x0c14] %asi
	.word 0xf93a2cb0  ! 477: STDF_I	std	%f28, [0x0cb0, %r8]
	.word 0x2e800008  ! 478: BVS	bvs,a	<label_0x8>
	.word 0x8f220009  ! 479: MULScc_R	mulscc 	%r8, %r9, %r7
	.word 0xcc822d24  ! 480: LDUWA_I	lduwa	[%r8, + 0x0d24] %asi, %r6
	.word 0x88520009  ! 481: UMUL_R	umul 	%r8, %r9, %r4
	.word 0x8143c000  ! 482: STBAR	stbar
	.word 0xccea1009  ! 483: LDSTUBA_R	ldstuba	%r6, [%r8 + %r9] 0x80
	.word 0x8143e022  ! 484: MEMBAR	membar	#StoreLoad | #MemIssue 
	.word 0xcab21009  ! 485: STHA_R	stha	%r5, [%r8 + %r9] 0x80
	.word 0x8f6a0009  ! 486: SDIVX_R	sdivx	%r8, %r9, %r7
	.word 0x10800008  ! 487: BA	ba  	<label_0x8>
	.word 0xc4aa1009  ! 488: STBA_R	stba	%r2, [%r8 + %r9] 0x80
	.word 0xc4ea1009  ! 489: LDSTUBA_R	ldstuba	%r2, [%r8 + %r9] 0x80
	.word 0x82522c40  ! 490: UMUL_I	umul 	%r8, 0x0c40, %r1
	.word 0x02ca0004  ! 491: BRZ	brz  ,pt	%8,<label_0xa0004>
	.word 0x06c20004  ! 492: BRLZ	brlz  ,nt	%8,<label_0x20004>
	.word 0xcab21009  ! 493: STHA_R	stha	%r5, [%r8 + %r9] 0x80
	.word 0xdbf22009  ! 494: CASXA_R	casxa	[%r8]%asi, %r9, %r13
	.word 0x827a0009  ! 495: SDIV_R	sdiv 	%r8, %r9, %r1
	.word 0x89222634  ! 496: MULScc_I	mulscc 	%r8, 0x0634, %r4
	.word 0xf6fa2c18  ! 497: SWAPA_I	swapa	%r27, [%r8 + 0x0c18] %asi
	.word 0x8143e010  ! 498: MEMBAR	membar	#Lookaside 
	.word 0xc6420009  ! 499: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0x24c20004  ! 500: BRLEZ	brlez,a,nt	%8,<label_0x20004>
	.word 0x8143e02e  ! 501: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #MemIssue 
	.word 0x8f6a0009  ! 502: SDIVX_R	sdivx	%r8, %r9, %r7
	.word 0x8c7a21d0  ! 503: SDIV_I	sdiv 	%r8, 0x01d0, %r6
	.word 0xcc4a242c  ! 504: LDSB_I	ldsb	[%r8 + 0x042c], %r6
	.word 0x14800004  ! 505: BG	bg  	<label_0x4>
	.word 0x8143c000  ! 506: STBAR	stbar
	.word 0xb1a20829  ! 507: FADDs	fadds	%f8, %f9, %f24
	.word 0xd4c21009  ! 508: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r10
	.word 0xc9e21009  ! 509: CASA_I	casa	[%r8] 0x80, %r9, %r4
	.word 0x8c520009  ! 510: UMUL_R	umul 	%r8, %r9, %r6
	.word 0x8f220009  ! 511: MULScc_R	mulscc 	%r8, %r9, %r7
	.word 0xc36a2c54  ! 512: PREFETCH_I	prefetch	[%r8 + 0x0c54], #one_read
	.word 0xcbe22009  ! 513: CASA_R	casa	[%r8] %asi, %r9, %r5
	.word 0xc2ea1009  ! 514: LDSTUBA_R	ldstuba	%r1, [%r8 + %r9] 0x80
	.word 0x89a20929  ! 515: FMULs	fmuls	%f8, %f9, %f4
	.word 0x8143c000  ! 516: STBAR	stbar
	.word 0xf12227ac  ! 517: STF_I	st	%f24, [0x07ac, %r8]
	.word 0xe6da1009  ! 518: LDXA_R	ldxa	[%r8, %r9] 0x80, %r19
	.word 0x8143e02f  ! 519: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #MemIssue 
	.word 0xc9e21009  ! 520: CASA_I	casa	[%r8] 0x80, %r9, %r4
	.word 0xd89a1009  ! 521: LDDA_R	ldda	[%r8, %r9] 0x80, %r12
	.word 0x30800008  ! 522: BA	ba,a	<label_0x8>
	.word 0x8143e052  ! 523: MEMBAR	membar	#StoreLoad | #Lookaside | #Sync 
	.word 0xea8a2be0  ! 524: LDUBA_I	lduba	[%r8, + 0x0be0] %asi, %r21
	.word 0xc80a0009  ! 525: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0x8143c000  ! 526: STBAR	stbar
	.word 0xc9f22009  ! 527: CASXA_R	casxa	[%r8]%asi, %r9, %r4
	.word 0xc36a23a4  ! 528: PREFETCH_I	prefetch	[%r8 + 0x03a4], #one_read
	.word 0xd9f22009  ! 530: CASXA_R	casxa	[%r8]%asi, %r9, %r12
	.word 0xd73a0009  ! 531: STDF_R	std	%f11, [%r9, %r8]
	.word 0xce422900  ! 532: LDSW_I	ldsw	[%r8 + 0x0900], %r7
	.word 0x2e800004  ! 533: BVS	bvs,a	<label_0x4>
	.word 0x8e720009  ! 534: UDIV_R	udiv 	%r8, %r9, %r7
	.word 0xca822bd4  ! 535: LDUWA_I	lduwa	[%r8, + 0x0bd4] %asi, %r5
	.word 0xf89a2b08  ! 536: LDDA_I	ldda	[%r8, + 0x0b08] %asi, %r28
	.word 0x8143e032  ! 537: MEMBAR	membar	#StoreLoad | #Lookaside | #MemIssue 
	.word 0x30800004  ! 538: BA	ba,a	<label_0x4>
	.word 0xa7a20929  ! 539: FMULs	fmuls	%f8, %f9, %f19
	.word 0xead22db0  ! 540: LDSHA_I	ldsha	[%r8, + 0x0db0] %asi, %r21
	.word 0x8143e04c  ! 541: MEMBAR	membar	#LoadStore | #StoreStore | #Sync 
	.word 0x8143c000  ! 542: STBAR	stbar
	.word 0xe2d22bd0  ! 543: LDSHA_I	ldsha	[%r8, + 0x0bd0] %asi, %r17
	.word 0x8143e033  ! 544: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside | #MemIssue 
	.word 0xcc6a2908  ! 545: LDSTUB_I	ldstub	%r6, [%r8 + 0x0908]
	.word 0x8143e019  ! 546: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside 
	.word 0xe8a227c0  ! 547: STWA_I	stwa	%r20, [%r8 + 0x07c0] %asi
	.word 0x10800008  ! 548: BA	ba  	<label_0x8>
	.word 0xcd3a0009  ! 549: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc33a28c0  ! 550: STDF_I	std	%f1, [0x08c0, %r8]
	.word 0xd5e22009  ! 551: CASA_R	casa	[%r8] %asi, %r9, %r10
	.word 0x8ba20929  ! 552: FMULs	fmuls	%f8, %f9, %f5
	.word 0xc4a220d4  ! 553: STWA_I	stwa	%r2, [%r8 + 0x00d4] %asi
	.word 0xc8f22830  ! 554: STXA_I	stxa	%r4, [%r8 + 0x0830] %asi
	.word 0xc25a28a0  ! 555: LDX_I	ldx	[%r8 + 0x08a0], %r1
	.word 0xc36a25c0  ! 556: PREFETCH_I	prefetch	[%r8 + 0x05c0], #one_read
	.word 0xc6921009  ! 557: LDUHA_R	lduha	[%r8, %r9] 0x80, %r3
	.word 0x8143e021  ! 558: MEMBAR	membar	#LoadLoad | #MemIssue 
	.word 0x36800004  ! 559: BGE	bge,a	<label_0x4>
	.word 0xd81a2048  ! 561: LDD_I	ldd	[%r8 + 0x0048], %r12
	.word 0xfa520009  ! 562: LDSH_R	ldsh	[%r8 + %r9], %r29
	.word 0x88f22898  ! 563: UDIVcc_I	udivcc 	%r8, 0x0898, %r4
	.word 0xb07a0009  ! 564: SDIV_R	sdiv 	%r8, %r9, %r24
	.word 0x847a0009  ! 565: SDIV_R	sdiv 	%r8, %r9, %r2
	.word 0xc2da1009  ! 566: LDXA_R	ldxa	[%r8, %r9] 0x80, %r1
	.word 0x8c5a0009  ! 567: SMUL_R	smul 	%r8, %r9, %r6
	.word 0x8143c000  ! 568: STBAR	stbar
	.word 0xc36a2638  ! 569: PREFETCH_I	prefetch	[%r8 + 0x0638], #one_read
	.word 0xc7f21009  ! 570: CASXA_I	casxa	[%r8] 0x80, %r9, %r3
	.word 0xc6b22ef4  ! 571: STHA_I	stha	%r3, [%r8 + 0x0ef4] %asi
	.word 0x8a5a0009  ! 572: SMUL_R	smul 	%r8, %r9, %r5
	.word 0xc6da20e8  ! 574: LDXA_I	ldxa	[%r8, + 0x00e8] %asi, %r3
	.word 0xfe822860  ! 575: LDUWA_I	lduwa	[%r8, + 0x0860] %asi, %r31
	.word 0xc4520009  ! 576: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xc4aa24cc  ! 577: STBA_I	stba	%r2, [%r8 + 0x04cc] %asi
	.word 0x8a4a2e78  ! 578: MULX_I	mulx 	%r8, 0x0e78, %r5
	.word 0x2e800004  ! 580: BVS	bvs,a	<label_0x4>
	.word 0xe46a2dfc  ! 581: LDSTUB_I	ldstub	%r18, [%r8 + 0x0dfc]
	.word 0x826a0009  ! 583: UDIVX_R	udivx 	%r8, %r9, %r1
	.word 0xd9f21009  ! 584: CASXA_I	casxa	[%r8] 0x80, %r9, %r12
	.word 0xf27a0009  ! 585: SWAP_R	swap	%r25, [%r8 + %r9]
	.word 0x8143e01f  ! 586: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #Lookaside 
	.word 0x8d6a29e0  ! 587: SDIVX_I	sdivx	%r8, 0x09e0, %r6
	.word 0xc36a2470  ! 588: PREFETCH_I	prefetch	[%r8 + 0x0470], #one_read
	.word 0x8ef22d5c  ! 589: UDIVcc_I	udivcc 	%r8, 0x0d5c, %r7
	.word 0x2a800004  ! 590: BCS	bcs,a	<label_0x4>
	.word 0xa4da0009  ! 591: SMULcc_R	smulcc 	%r8, %r9, %r18
	.word 0xf86a0009  ! 592: LDSTUB_R	ldstub	%r28, [%r8 + %r9]
	.word 0x8143e07d  ! 593: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0x8143c000  ! 594: STBAR	stbar
	.word 0xfeaa1009  ! 595: STBA_R	stba	%r31, [%r8 + %r9] 0x80
	.word 0x24c20004  ! 596: BRLEZ	brlez,a,nt	%8,<label_0x20004>
	.word 0x88720009  ! 598: UDIV_R	udiv 	%r8, %r9, %r4
	.word 0x8c6a2edc  ! 599: UDIVX_I	udivx 	%r8, 0x0edc, %r6
	.word 0xcc1a0009  ! 600: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xfcba2740  ! 601: STDA_I	stda	%r30, [%r8 + 0x0740] %asi
	.word 0xe09a1009  ! 602: LDDA_R	ldda	[%r8, %r9] 0x80, %r16
	.word 0x86720009  ! 603: UDIV_R	udiv 	%r8, %r9, %r3
	.word 0xc8c21009  ! 604: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r4
	.word 0xc8520009  ! 605: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xc81a2a30  ! 606: LDD_I	ldd	[%r8 + 0x0a30], %r4
	.word 0xc36a2610  ! 607: PREFETCH_I	prefetch	[%r8 + 0x0610], #one_read
	.word 0xccc222d8  ! 608: LDSWA_I	ldswa	[%r8, + 0x02d8] %asi, %r6
	.word 0xc53a0009  ! 609: STDF_R	std	%f2, [%r9, %r8]
	.word 0xceb2258c  ! 610: STHA_I	stha	%r7, [%r8 + 0x058c] %asi
	.word 0xf2c22a04  ! 611: LDSWA_I	ldswa	[%r8, + 0x0a04] %asi, %r25
	.word 0xfea22e58  ! 612: STWA_I	stwa	%r31, [%r8 + 0x0e58] %asi
	.word 0xfa420009  ! 613: LDSW_R	ldsw	[%r8 + %r9], %r29
	.word 0xc8522fd4  ! 614: LDSH_I	ldsh	[%r8 + 0x0fd4], %r4
	.word 0xee6a0009  ! 615: LDSTUB_R	ldstub	%r23, [%r8 + %r9]
	.word 0xd49a20f8  ! 616: LDDA_I	ldda	[%r8, + 0x00f8] %asi, %r10
	.word 0xc2d21009  ! 617: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r1
	.word 0xf47a2404  ! 618: SWAP_I	swap	%r26, [%r8 + 0x0404]
	.word 0xcd3a2d08  ! 619: STDF_I	std	%f6, [0x0d08, %r8]
	.word 0xf4ea1009  ! 620: LDSTUBA_R	ldstuba	%r26, [%r8 + %r9] 0x80
	.word 0xfaf21009  ! 621: STXA_R	stxa	%r29, [%r8 + %r9] 0x80
	.word 0xfff21009  ! 622: CASXA_I	casxa	[%r8] 0x80, %r9, %r31
	.word 0x88522c48  ! 623: UMUL_I	umul 	%r8, 0x0c48, %r4
	.word 0xc9f22009  ! 624: CASXA_R	casxa	[%r8]%asi, %r9, %r4
	.word 0x826a0009  ! 625: UDIVX_R	udivx 	%r8, %r9, %r1
	.word 0xca9220b8  ! 626: LDUHA_I	lduha	[%r8, + 0x00b8] %asi, %r5
	.word 0x82da0009  ! 627: SMULcc_R	smulcc 	%r8, %r9, %r1
	.word 0xbe6a0009  ! 628: UDIVX_R	udivx 	%r8, %r9, %r31
	.word 0xeb3a29a0  ! 629: STDF_I	std	%f21, [0x09a0, %r8]
	.word 0x2e800004  ! 630: BVS	bvs,a	<label_0x4>
	.word 0xea6a256c  ! 631: LDSTUB_I	ldstub	%r21, [%r8 + 0x056c]
	.word 0xc2f22390  ! 632: STXA_I	stxa	%r1, [%r8 + 0x0390] %asi
	.word 0x3a800004  ! 633: BCC	bcc,a	<label_0x4>
	.word 0xc36a2f0c  ! 634: PREFETCH_I	prefetch	[%r8 + 0x0f0c], #one_read
	.word 0x8da208a9  ! 635: FSUBs	fsubs	%f8, %f9, %f6
	.word 0x8143c000  ! 636: STBAR	stbar
	.word 0x8fa20829  ! 637: FADDs	fadds	%f8, %f9, %f7
	.word 0xe4ba1009  ! 638: STDA_R	stda	%r18, [%r8 + %r9] 0x80
	.word 0xcca225a4  ! 639: STWA_I	stwa	%r6, [%r8 + 0x05a4] %asi
	.word 0xf2d22ed4  ! 641: LDSHA_I	ldsha	[%r8, + 0x0ed4] %asi, %r25
	.word 0xd44a0009  ! 642: LDSB_R	ldsb	[%r8 + %r9], %r10
	.word 0xc6a21009  ! 643: STWA_R	stwa	%r3, [%r8 + %r9] 0x80
	.word 0xe1222204  ! 644: STF_I	st	%f16, [0x0204, %r8]
	.word 0x8a7a295c  ! 645: SDIV_I	sdiv 	%r8, 0x095c, %r5
	.word 0xc4da2ad8  ! 646: LDXA_I	ldxa	[%r8, + 0x0ad8] %asi, %r2
	.word 0x85a20929  ! 647: FMULs	fmuls	%f8, %f9, %f2
	.word 0x8143c000  ! 648: STBAR	stbar
	.word 0xc26a26e8  ! 649: LDSTUB_I	ldstub	%r1, [%r8 + 0x06e8]
	.word 0x8b6a28e8  ! 650: SDIVX_I	sdivx	%r8, 0x08e8, %r5
	.word 0x2ac20004  ! 651: BRNZ	brnz,a,nt	%8,<label_0x20004>
	.word 0xc3ea251c  ! 652: PREFETCHA_I	prefetcha	[%r8, + 0x051c] %asi, #one_read
	.word 0x88f22000  ! 653: UDIVcc_I	udivcc 	%r8, 0x0000, %r4
	.word 0x8143c000  ! 654: STBAR	stbar
	.word 0xf4fa2998  ! 655: SWAPA_I	swapa	%r26, [%r8 + 0x0998] %asi
	.word 0x96d221d4  ! 656: UMULcc_I	umulcc 	%r8, 0x01d4, %r11
	.word 0x8143c000  ! 657: STBAR	stbar
	.word 0x8143c000  ! 658: STBAR	stbar
	.word 0xcb3a27c0  ! 659: STDF_I	std	%f5, [0x07c0, %r8]
	.word 0x8143c000  ! 660: STBAR	stbar
	.word 0xb1a20829  ! 661: FADDs	fadds	%f8, %f9, %f24
	.word 0xce821009  ! 662: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r7
	.word 0xf13a2b40  ! 663: STDF_I	std	%f24, [0x0b40, %r8]
	.word 0x16800004  ! 664: BGE	bge  	<label_0x4>
	.word 0xc6ca1009  ! 665: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r3
	.word 0x32800004  ! 666: BNE	bne,a	<label_0x4>
	.word 0x8143e00d  ! 667: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore 
	.word 0x18800004  ! 668: BGU	bgu  	<label_0x4>
	.word 0xc3ea20bc  ! 669: PREFETCHA_I	prefetcha	[%r8, + 0x00bc] %asi, #one_read
	.word 0x8b6a0009  ! 670: SDIVX_R	sdivx	%r8, %r9, %r5
	.word 0xa96a25f0  ! 671: SDIVX_I	sdivx	%r8, 0x05f0, %r20
	.word 0x844a277c  ! 672: MULX_I	mulx 	%r8, 0x077c, %r2
	.word 0xc8a2226c  ! 673: STWA_I	stwa	%r4, [%r8 + 0x026c] %asi
	.word 0xc4ea1009  ! 674: LDSTUBA_R	ldstuba	%r2, [%r8 + %r9] 0x80
	.word 0xcc8a1009  ! 675: LDUBA_R	lduba	[%r8, %r9] 0x80, %r6
	.word 0xc27a0009  ! 676: SWAP_R	swap	%r1, [%r8 + %r9]
	.word 0x40000004  ! 677: CALL	call	disp30_4
	.word 0xcca21009  ! 679: STWA_R	stwa	%r6, [%r8 + %r9] 0x80
	.word 0xca0a0009  ! 680: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xa25a2208  ! 681: SMUL_I	smul 	%r8, 0x0208, %r17
	.word 0x8143c000  ! 682: STBAR	stbar
	.word 0xbad20009  ! 683: UMULcc_R	umulcc 	%r8, %r9, %r29
	.word 0x87a208a9  ! 684: FSUBs	fsubs	%f8, %f9, %f3
	.word 0x8143e060  ! 685: MEMBAR	membar	#MemIssue | #Sync 
	.word 0xc6ca23b0  ! 686: LDSBA_I	ldsba	[%r8, + 0x03b0] %asi, %r3
	.word 0xc8020009  ! 687: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xccaa2bb0  ! 688: STBA_I	stba	%r6, [%r8 + 0x0bb0] %asi
	.word 0xc2822780  ! 689: LDUWA_I	lduwa	[%r8, + 0x0780] %asi, %r1
	.word 0xce020009  ! 690: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xa4d20009  ! 691: UMULcc_R	umulcc 	%r8, %r9, %r18
	.word 0xce7a2e64  ! 692: SWAP_I	swap	%r7, [%r8 + 0x0e64]
	.word 0xc36a2708  ! 693: PREFETCH_I	prefetch	[%r8 + 0x0708], #one_read
	.word 0xc7e21009  ! 694: CASA_I	casa	[%r8] 0x80, %r9, %r3
	.word 0x8143e03b  ! 695: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Lookaside | #MemIssue 
	.word 0xc24a0009  ! 696: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0x8143e04d  ! 697: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Sync 
	.word 0x8a520009  ! 698: UMUL_R	umul 	%r8, %r9, %r5
	.word 0xfde21009  ! 699: CASA_I	casa	[%r8] 0x80, %r9, %r30
	.word 0xcb3a2930  ! 700: STDF_I	std	%f5, [0x0930, %r8]
	.word 0x14800004  ! 701: BG	bg  	<label_0x4>
	.word 0xa4d228c4  ! 704: UMULcc_I	umulcc 	%r8, 0x08c4, %r18
	.word 0xe6921009  ! 705: LDUHA_R	lduha	[%r8, %r9] 0x80, %r19
	.word 0xc27a2e8c  ! 706: SWAP_I	swap	%r1, [%r8 + 0x0e8c]
	.word 0xc53a2eb8  ! 707: STDF_I	std	%f2, [0x0eb8, %r8]
	.word 0xc65a24a0  ! 708: LDX_I	ldx	[%r8 + 0x04a0], %r3
	.word 0xc3222d84  ! 709: STF_I	st	%f1, [0x0d84, %r8]
	.word 0xcf3a0009  ! 710: STDF_R	std	%f7, [%r9, %r8]
	.word 0xce0a2328  ! 711: LDUB_I	ldub	[%r8 + 0x0328], %r7
	.word 0xcbe22009  ! 712: CASA_R	casa	[%r8] %asi, %r9, %r5
	.word 0x88f20009  ! 713: UDIVcc_R	udivcc 	%r8, %r9, %r4
	.word 0x8143e05c  ! 714: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0xdcb224c8  ! 715: STHA_I	stha	%r14, [%r8 + 0x04c8] %asi
	.word 0x8143c000  ! 716: STBAR	stbar
	.word 0x8143e069  ! 717: MEMBAR	membar	#LoadLoad | #StoreStore | #MemIssue | #Sync 
	.word 0x02ca0004  ! 718: BRZ	brz  ,pt	%8,<label_0xa0004>
	.word 0x866a2464  ! 719: UDIVX_I	udivx 	%r8, 0x0464, %r3
	.word 0xcaaa1009  ! 720: STBA_R	stba	%r5, [%r8 + %r9] 0x80
	.word 0xd6d225e0  ! 721: LDSHA_I	ldsha	[%r8, + 0x05e0] %asi, %r11
	.word 0x8cf20009  ! 722: UDIVcc_R	udivcc 	%r8, %r9, %r6
	.word 0xd6a21009  ! 723: STWA_R	stwa	%r11, [%r8 + %r9] 0x80
	.word 0xc25a0009  ! 724: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xcafa2af8  ! 725: SWAPA_I	swapa	%r5, [%r8 + 0x0af8] %asi
	.word 0x8143e000  ! 726: MEMBAR	membar	
	.word 0xc8a225a8  ! 727: STWA_I	stwa	%r4, [%r8 + 0x05a8] %asi
	.word 0xdcda2bd8  ! 728: LDXA_I	ldxa	[%r8, + 0x0bd8] %asi, %r14
	.word 0x8143e072  ! 729: MEMBAR	membar	#StoreLoad | #Lookaside | #MemIssue | #Sync 
	.word 0xcf3a2dd0  ! 730: STDF_I	std	%f7, [0x0dd0, %r8]
	.word 0x82520009  ! 731: UMUL_R	umul 	%r8, %r9, %r1
	.word 0xdc1a0009  ! 732: LDD_R	ldd	[%r8 + %r9], %r14
	.word 0xe6da2ac0  ! 733: LDXA_I	ldxa	[%r8, + 0x0ac0] %asi, %r19
	.word 0x8e4a0009  ! 734: MULX_R	mulx 	%r8, %r9, %r7
	.word 0xee922824  ! 735: LDUHA_I	lduha	[%r8, + 0x0824] %asi, %r23
	.word 0x8143c000  ! 736: STBAR	stbar
	.word 0xae720009  ! 737: UDIV_R	udiv 	%r8, %r9, %r23
	.word 0x34800004  ! 738: BG	bg,a	<label_0x4>
	.word 0xaba208a9  ! 739: FSUBs	fsubs	%f8, %f9, %f21
	.word 0x85220009  ! 740: MULScc_R	mulscc 	%r8, %r9, %r2
	.word 0xc8aa269c  ! 741: STBA_I	stba	%r4, [%r8 + 0x069c] %asi
	.word 0x8143c000  ! 742: STBAR	stbar
	.word 0xc8da2c18  ! 743: LDXA_I	ldxa	[%r8, + 0x0c18] %asi, %r4
	.word 0xcef21009  ! 744: STXA_R	stxa	%r7, [%r8 + %r9] 0x80
	.word 0xec6a28e4  ! 745: LDSTUB_I	ldstub	%r22, [%r8 + 0x08e4]
	.word 0x87a208a9  ! 746: FSUBs	fsubs	%f8, %f9, %f3
	.word 0xc36a2ed8  ! 747: PREFETCH_I	prefetch	[%r8 + 0x0ed8], #one_read
	.word 0x8143e005  ! 748: MEMBAR	membar	#LoadLoad | #LoadStore 
	.word 0xc3e21009  ! 749: CASA_I	casa	[%r8] 0x80, %r9, %r1
	.word 0xa36a0009  ! 750: SDIVX_R	sdivx	%r8, %r9, %r17
	.word 0xc2da1009  ! 751: LDXA_R	ldxa	[%r8, %r9] 0x80, %r1
	.word 0xee6a2944  ! 752: LDSTUB_I	ldstub	%r23, [%r8 + 0x0944]
	.word 0x0a800004  ! 753: BCS	bcs  	<label_0x4>
	.word 0xc2520009  ! 754: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xcf222c98  ! 755: STF_I	st	%f7, [0x0c98, %r8]
	.word 0x9da209a9  ! 757: FDIVs	fdivs	%f8, %f9, %f14
	.word 0x8143c000  ! 758: STBAR	stbar
	.word 0xec5a2170  ! 759: LDX_I	ldx	[%r8 + 0x0170], %r22
	.word 0xcafa1009  ! 760: SWAPA_R	swapa	%r5, [%r8 + %r9] 0x80
	.word 0xe00a0009  ! 761: LDUB_R	ldub	[%r8 + %r9], %r16
	.word 0xea120009  ! 762: LDUH_R	lduh	[%r8 + %r9], %r21
	.word 0x8ba20829  ! 763: FADDs	fadds	%f8, %f9, %f5
	.word 0x08800008  ! 764: BLEU	bleu  	<label_0x8>
	.word 0xe40a2450  ! 765: LDUB_I	ldub	[%r8 + 0x0450], %r18
	.word 0x8143c000  ! 766: STBAR	stbar
	.word 0xe53a0009  ! 767: STDF_R	std	%f18, [%r9, %r8]
	.word 0x0c800008  ! 768: BNEG	bneg  	<label_0x8>
	.word 0xcc4a2bd4  ! 769: LDSB_I	ldsb	[%r8 + 0x0bd4], %r6
	.word 0x85220009  ! 770: MULScc_R	mulscc 	%r8, %r9, %r2
	.word 0xc4420009  ! 771: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xd66a0009  ! 772: LDSTUB_R	ldstub	%r11, [%r8 + %r9]
	.word 0xce821009  ! 773: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r7
	.word 0xc4b22f24  ! 774: STHA_I	stha	%r2, [%r8 + 0x0f24] %asi
	.word 0x02800008  ! 775: BE	be  	<label_0x8>
	.word 0x32800004  ! 776: BNE	bne,a	<label_0x4>
	.word 0x16800004  ! 777: BGE	bge  	<label_0x4>
	.word 0x10800004  ! 778: BA	ba  	<label_0x4>
	.word 0x0cca0004  ! 779: BRGZ	brgz  ,pt	%8,<label_0xa0004>
	.word 0xe0ba2668  ! 780: STDA_I	stda	%r16, [%r8 + 0x0668] %asi
	.word 0xc36a21b8  ! 781: PREFETCH_I	prefetch	[%r8 + 0x01b8], #one_read
	.word 0x9b220009  ! 783: MULScc_R	mulscc 	%r8, %r9, %r13
	.word 0xbfa20929  ! 784: FMULs	fmuls	%f8, %f9, %f31
	.word 0x825a0009  ! 785: SMUL_R	smul 	%r8, %r9, %r1
	.word 0xe81a2280  ! 786: LDD_I	ldd	[%r8 + 0x0280], %r20
	.word 0x8143e016  ! 788: MEMBAR	membar	#StoreLoad | #LoadStore | #Lookaside 
	.word 0x8143e018  ! 789: MEMBAR	membar	#StoreStore | #Lookaside 
	.word 0xc4420009  ! 790: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0x8a4a29ec  ! 791: MULX_I	mulx 	%r8, 0x09ec, %r5
	.word 0xb66a284c  ! 792: UDIVX_I	udivx 	%r8, 0x084c, %r27
	.word 0x8143c000  ! 793: STBAR	stbar
	.word 0xf7f22009  ! 794: CASXA_R	casxa	[%r8]%asi, %r9, %r27
	.word 0x8143c000  ! 795: STBAR	stbar
	.word 0xc4fa1009  ! 796: SWAPA_R	swapa	%r2, [%r8 + %r9] 0x80
	.word 0xf0a21009  ! 797: STWA_R	stwa	%r24, [%r8 + %r9] 0x80
	.word 0x9e5a0009  ! 798: SMUL_R	smul 	%r8, %r9, %r15
	.word 0xcd220009  ! 799: STF_R	st	%f6, [%r9, %r8]
	.word 0xc36a25cc  ! 800: PREFETCH_I	prefetch	[%r8 + 0x05cc], #one_read
	.word 0x83a20929  ! 802: FMULs	fmuls	%f8, %f9, %f1
	.word 0xce020009  ! 804: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xcd222e2c  ! 805: STF_I	st	%f6, [0x0e2c, %r8]
	.word 0x8ba20929  ! 806: FMULs	fmuls	%f8, %f9, %f5
	.word 0xe9f22009  ! 807: CASXA_R	casxa	[%r8]%asi, %r9, %r20
	.word 0xcea21009  ! 808: STWA_R	stwa	%r7, [%r8 + %r9] 0x80
	.word 0xec0a0009  ! 809: LDUB_R	ldub	[%r8 + %r9], %r22
	.word 0xf8ca1009  ! 810: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r28
	.word 0xcbf22009  ! 812: CASXA_R	casxa	[%r8]%asi, %r9, %r5
	.word 0x8b22237c  ! 813: MULScc_I	mulscc 	%r8, 0x037c, %r5
	.word 0x06c20004  ! 814: BRLZ	brlz  ,nt	%8,<label_0x20004>
	.word 0xe2921009  ! 815: LDUHA_R	lduha	[%r8, %r9] 0x80, %r17
	.word 0x9c720009  ! 816: UDIV_R	udiv 	%r8, %r9, %r14
	.word 0xc36a2d30  ! 817: PREFETCH_I	prefetch	[%r8 + 0x0d30], #one_read
	.word 0xc6a22fb0  ! 818: STWA_I	stwa	%r3, [%r8 + 0x0fb0] %asi
	.word 0xc6da1009  ! 819: LDXA_R	ldxa	[%r8, %r9] 0x80, %r3
	.word 0xc84a2494  ! 820: LDSB_I	ldsb	[%r8 + 0x0494], %r4
	.word 0xce6a2d14  ! 821: LDSTUB_I	ldstub	%r7, [%r8 + 0x0d14]
	.word 0x8143c000  ! 822: STBAR	stbar
	.word 0xef220009  ! 823: STF_R	st	%f23, [%r9, %r8]
	.word 0xce8a2d54  ! 824: LDUBA_I	lduba	[%r8, + 0x0d54] %asi, %r7
	.word 0xf9f22009  ! 825: CASXA_R	casxa	[%r8]%asi, %r9, %r28
	.word 0xcea21009  ! 826: STWA_R	stwa	%r7, [%r8 + %r9] 0x80
	.word 0xf47a0009  ! 827: SWAP_R	swap	%r26, [%r8 + %r9]
	.word 0x14800008  ! 828: BG	bg  	<label_0x8>
	.word 0xc66a2b5c  ! 829: LDSTUB_I	ldstub	%r3, [%r8 + 0x0b5c]
	.word 0x12800004  ! 830: BNE	bne  	<label_0x4>
	.word 0xe84a2c5c  ! 831: LDSB_I	ldsb	[%r8 + 0x0c5c], %r20
	.word 0xeeb21009  ! 832: STHA_R	stha	%r23, [%r8 + %r9] 0x80
	.word 0xe86a0009  ! 833: LDSTUB_R	ldstub	%r20, [%r8 + %r9]
	.word 0xdc9220e4  ! 834: LDUHA_I	lduha	[%r8, + 0x00e4] %asi, %r14
	.word 0x836a0009  ! 835: SDIVX_R	sdivx	%r8, %r9, %r1
	.word 0xe6da1009  ! 836: LDXA_R	ldxa	[%r8, %r9] 0x80, %r19
	.word 0xc87a2d7c  ! 837: SWAP_I	swap	%r4, [%r8 + 0x0d7c]
	.word 0xd4ca2f7c  ! 838: LDSBA_I	ldsba	[%r8, + 0x0f7c] %asi, %r10
	.word 0xeeaa24a8  ! 839: STBA_I	stba	%r23, [%r8 + 0x04a8] %asi
	.word 0xf4ba1009  ! 840: STDA_R	stda	%r26, [%r8 + %r9] 0x80
	.word 0xc64222f8  ! 841: LDSW_I	ldsw	[%r8 + 0x02f8], %r3
	.word 0x8fa209a9  ! 842: FDIVs	fdivs	%f8, %f9, %f7
	.word 0x94fa279c  ! 843: SDIVcc_I	sdivcc 	%r8, 0x079c, %r10
	.word 0xc2ea2bb8  ! 844: LDSTUBA_I	ldstuba	%r1, [%r8 + 0x0bb8] %asi
	.word 0xf93a2530  ! 845: STDF_I	std	%f28, [0x0530, %r8]
	.word 0xc4aa1009  ! 846: STBA_R	stba	%r2, [%r8 + %r9] 0x80
	.word 0xc2821009  ! 847: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r1
	.word 0x9f222cb4  ! 848: MULScc_I	mulscc 	%r8, 0x0cb4, %r15
	.word 0x00800008  ! 849: BN	bn  	<label_0x8>
	.word 0xe9222a24  ! 850: STF_I	st	%f20, [0x0a24, %r8]
	.word 0x8143e00e  ! 851: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore 
	.word 0xc36a2448  ! 852: PREFETCH_I	prefetch	[%r8 + 0x0448], #one_read
	.word 0x8143e003  ! 853: MEMBAR	membar	#LoadLoad | #StoreLoad 
	.word 0xd41a0009  ! 854: LDD_R	ldd	[%r8 + %r9], %r10
	.word 0x22800004  ! 855: BE	be,a	<label_0x4>
	.word 0x82f22a1c  ! 856: UDIVcc_I	udivcc 	%r8, 0x0a1c, %r1
	.word 0xcf220009  ! 857: STF_R	st	%f7, [%r9, %r8]
	.word 0xf4520009  ! 858: LDSH_R	ldsh	[%r8 + %r9], %r26
	.word 0x8da20829  ! 859: FADDs	fadds	%f8, %f9, %f6
	.word 0xb9222e98  ! 860: MULScc_I	mulscc 	%r8, 0x0e98, %r28
	.word 0xd81a2bc8  ! 861: LDD_I	ldd	[%r8 + 0x0bc8], %r12
	.word 0x04800004  ! 862: BLE	ble  	<label_0x4>
	.word 0x8143e048  ! 863: MEMBAR	membar	#StoreStore | #Sync 
	.word 0x8143e033  ! 864: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside | #MemIssue 
	.word 0xfb222054  ! 865: STF_I	st	%f29, [0x0054, %r8]
	.word 0xce52234c  ! 866: LDSH_I	ldsh	[%r8 + 0x034c], %r7
	.word 0x8143e01c  ! 867: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside 
	.word 0xca6a0009  ! 868: LDSTUB_R	ldstub	%r5, [%r8 + %r9]
	.word 0xc45a0009  ! 869: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0x8143c000  ! 870: STBAR	stbar
	.word 0x8143c000  ! 871: STBAR	stbar
	.word 0xc8822138  ! 872: LDUWA_I	lduwa	[%r8, + 0x0138] %asi, %r4
	.word 0xc36a2694  ! 873: PREFETCH_I	prefetch	[%r8 + 0x0694], #one_read
	.word 0x8143e03a  ! 874: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside | #MemIssue 
	.word 0x9ad20009  ! 876: UMULcc_R	umulcc 	%r8, %r9, %r13
	.word 0xd44a2578  ! 877: LDSB_I	ldsb	[%r8 + 0x0578], %r10
	.word 0xccca1009  ! 878: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r6
	.word 0xc2b21009  ! 879: STHA_R	stha	%r1, [%r8 + %r9] 0x80
	.word 0xccea1009  ! 880: LDSTUBA_R	ldstuba	%r6, [%r8 + %r9] 0x80
	.word 0x86722824  ! 881: UDIV_I	udiv 	%r8, 0x0824, %r3
	.word 0x9f220009  ! 882: MULScc_R	mulscc 	%r8, %r9, %r15
	.word 0x8143c000  ! 883: STBAR	stbar
	.word 0xcd2221bc  ! 884: STF_I	st	%f6, [0x01bc, %r8]
	.word 0xfc520009  ! 885: LDSH_R	ldsh	[%r8 + %r9], %r30
	.word 0x85a208a9  ! 886: FSUBs	fsubs	%f8, %f9, %f2
	.word 0xf8ba1009  ! 887: STDA_R	stda	%r28, [%r8 + %r9] 0x80
	.word 0xc3ea22fc  ! 888: PREFETCHA_I	prefetcha	[%r8, + 0x02fc] %asi, #one_read
	.word 0x8143e042  ! 889: MEMBAR	membar	#StoreLoad | #Sync 
	.word 0x89220009  ! 891: MULScc_R	mulscc 	%r8, %r9, %r4
	.word 0x9c522534  ! 892: UMUL_I	umul 	%r8, 0x0534, %r14
	.word 0xfa420009  ! 893: LDSW_R	ldsw	[%r8 + %r9], %r29
	.word 0xceb21009  ! 894: STHA_R	stha	%r7, [%r8 + %r9] 0x80
	.word 0xc8520009  ! 895: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0x89a20829  ! 896: FADDs	fadds	%f8, %f9, %f4
	.word 0xcad22b7c  ! 897: LDSHA_I	ldsha	[%r8, + 0x0b7c] %asi, %r5
	.word 0xc47a0009  ! 898: SWAP_R	swap	%r2, [%r8 + %r9]
	.word 0xa44a0009  ! 899: MULX_R	mulx 	%r8, %r9, %r18
	.word 0x82522bf0  ! 900: UMUL_I	umul 	%r8, 0x0bf0, %r1
	.word 0xfe8a1009  ! 901: LDUBA_R	lduba	[%r8, %r9] 0x80, %r31
	.word 0xd8ba2248  ! 902: STDA_I	stda	%r12, [%r8 + 0x0248] %asi
	.word 0x8ad229e8  ! 903: UMULcc_I	umulcc 	%r8, 0x09e8, %r5
	.word 0xca7a21d4  ! 904: SWAP_I	swap	%r5, [%r8 + 0x01d4]
	.word 0xc36a2bd4  ! 905: PREFETCH_I	prefetch	[%r8 + 0x0bd4], #one_read
	.word 0x8e6a2784  ! 906: UDIVX_I	udivx 	%r8, 0x0784, %r7
	.word 0xc46a0009  ! 907: LDSTUB_R	ldstub	%r2, [%r8 + %r9]
	.word 0x84d20009  ! 908: UMULcc_R	umulcc 	%r8, %r9, %r2
	.word 0xc7e21009  ! 909: CASA_I	casa	[%r8] 0x80, %r9, %r3
	.word 0x32800004  ! 910: BNE	bne,a	<label_0x4>
	.word 0x8143e033  ! 911: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside | #MemIssue 
	.word 0x32800008  ! 912: BNE	bne,a	<label_0x8>
	.word 0x8a7a2314  ! 913: SDIV_I	sdiv 	%r8, 0x0314, %r5
	.word 0xc4ba25a0  ! 914: STDA_I	stda	%r2, [%r8 + 0x05a0] %asi
	.word 0xc6520009  ! 915: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xec9a2370  ! 916: LDDA_I	ldda	[%r8, + 0x0370] %asi, %r22
	.word 0x8a7a0009  ! 917: SDIV_R	sdiv 	%r8, %r9, %r5
	.word 0x8143e060  ! 918: MEMBAR	membar	#MemIssue | #Sync 
	.word 0xe4ea2c2c  ! 919: LDSTUBA_I	ldstuba	%r18, [%r8 + 0x0c2c] %asi
	.word 0xcca228d0  ! 920: STWA_I	stwa	%r6, [%r8 + 0x08d0] %asi
	.word 0xcff22009  ! 921: CASXA_R	casxa	[%r8]%asi, %r9, %r7
	.word 0x06c20008  ! 922: BRLZ	brlz  ,nt	%8,<label_0x20008>
	.word 0xc36a2c0c  ! 923: PREFETCH_I	prefetch	[%r8 + 0x0c0c], #one_read
	.word 0x0ec20008  ! 924: BRGEZ	brgez  ,nt	%8,<label_0x20008>
	.word 0xce520009  ! 925: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xe0a21009  ! 926: STWA_R	stwa	%r16, [%r8 + %r9] 0x80
	.word 0x887a0009  ! 927: SDIV_R	sdiv 	%r8, %r9, %r4
	.word 0xf4fa1009  ! 928: SWAPA_R	swapa	%r26, [%r8 + %r9] 0x80
	.word 0xcc522ab4  ! 929: LDSH_I	ldsh	[%r8 + 0x0ab4], %r6
	.word 0xf89a1009  ! 930: LDDA_R	ldda	[%r8, %r9] 0x80, %r28
	.word 0x18800008  ! 931: BGU	bgu  	<label_0x8>
	.word 0xc64a0009  ! 932: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0x86520009  ! 933: UMUL_R	umul 	%r8, %r9, %r3
	.word 0xe49a2ab0  ! 934: LDDA_I	ldda	[%r8, + 0x0ab0] %asi, %r18
	.word 0x8ba20929  ! 935: FMULs	fmuls	%f8, %f9, %f5
	.word 0xc36a212c  ! 936: PREFETCH_I	prefetch	[%r8 + 0x012c], #one_read
	.word 0xe6aa1009  ! 937: STBA_R	stba	%r19, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 938: STBAR	stbar
	.word 0xc86a2eec  ! 939: LDSTUB_I	ldstub	%r4, [%r8 + 0x0eec]
	.word 0xc46a0009  ! 940: LDSTUB_R	ldstub	%r2, [%r8 + %r9]
	.word 0x82720009  ! 941: UDIV_R	udiv 	%r8, %r9, %r1
	.word 0xc4aa2afc  ! 942: STBA_I	stba	%r2, [%r8 + 0x0afc] %asi
	.word 0xce6a0009  ! 943: LDSTUB_R	ldstub	%r7, [%r8 + %r9]
	.word 0x8143e03b  ! 944: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Lookaside | #MemIssue 
	.word 0x8143c000  ! 945: STBAR	stbar
	.word 0xec422de8  ! 946: LDSW_I	ldsw	[%r8 + 0x0de8], %r22
	.word 0x8ed22e60  ! 947: UMULcc_I	umulcc 	%r8, 0x0e60, %r7
	.word 0xfb220009  ! 948: STF_R	st	%f29, [%r9, %r8]
	.word 0xcafa208c  ! 949: SWAPA_I	swapa	%r5, [%r8 + 0x008c] %asi
	.word 0x8143e05e  ! 950: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0xb9a20829  ! 951: FADDs	fadds	%f8, %f9, %f28
	.word 0x8c4a2590  ! 952: MULX_I	mulx 	%r8, 0x0590, %r6
	.word 0xc6420009  ! 953: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xef3a0009  ! 954: STDF_R	std	%f23, [%r9, %r8]
	.word 0xc3ea28bc  ! 955: PREFETCHA_I	prefetcha	[%r8, + 0x08bc] %asi, #one_read
	.word 0x8143c000  ! 956: STBAR	stbar
	.word 0xa7a20929  ! 957: FMULs	fmuls	%f8, %f9, %f19
	.word 0xda922f70  ! 958: LDUHA_I	lduha	[%r8, + 0x0f70] %asi, %r13
	.word 0x88f20009  ! 959: UDIVcc_R	udivcc 	%r8, %r9, %r4
	.word 0xcaaa2a44  ! 960: STBA_I	stba	%r5, [%r8 + 0x0a44] %asi
	.word 0xc41a0009  ! 961: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x8ba209a9  ! 962: FDIVs	fdivs	%f8, %f9, %f5
	.word 0x8f6a210c  ! 963: SDIVX_I	sdivx	%r8, 0x010c, %r7
	.word 0x8e720009  ! 964: UDIV_R	udiv 	%r8, %r9, %r7
	.word 0xe2aa1009  ! 965: STBA_R	stba	%r17, [%r8 + %r9] 0x80
	.word 0xc93a2580  ! 966: STDF_I	std	%f4, [0x0580, %r8]
	.word 0xfd3a0009  ! 967: STDF_R	std	%f30, [%r9, %r8]
	.word 0xe49a1009  ! 968: LDDA_R	ldda	[%r8, %r9] 0x80, %r18
	.word 0x8eda0009  ! 969: SMULcc_R	smulcc 	%r8, %r9, %r7
	.word 0xec1a0009  ! 970: LDD_R	ldd	[%r8 + %r9], %r22
	.word 0x2ac20004  ! 971: BRNZ	brnz,a,nt	%8,<label_0x20004>
	.word 0xcc5a0009  ! 972: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xc67a25b8  ! 973: SWAP_I	swap	%r3, [%r8 + 0x05b8]
	.word 0xcafa2138  ! 974: SWAPA_I	swapa	%r5, [%r8 + 0x0138] %asi
	.word 0x9cf22c9c  ! 975: UDIVcc_I	udivcc 	%r8, 0x0c9c, %r14
	.word 0xbda20929  ! 976: FMULs	fmuls	%f8, %f9, %f30
	.word 0x8a520009  ! 977: UMUL_R	umul 	%r8, %r9, %r5
	.word 0xce5a2228  ! 978: LDX_I	ldx	[%r8 + 0x0228], %r7
	.word 0xc3ea24ec  ! 979: PREFETCHA_I	prefetcha	[%r8, + 0x04ec] %asi, #one_read
	.word 0xe44227cc  ! 980: LDSW_I	ldsw	[%r8 + 0x07cc], %r18
	.word 0x827a2788  ! 981: SDIV_I	sdiv 	%r8, 0x0788, %r1
	.word 0x83a20929  ! 982: FMULs	fmuls	%f8, %f9, %f1
	.word 0xaa7a0009  ! 983: SDIV_R	sdiv 	%r8, %r9, %r21
	.word 0xcca22d80  ! 984: STWA_I	stwa	%r6, [%r8 + 0x0d80] %asi
	.word 0x847220a8  ! 985: UDIV_I	udiv 	%r8, 0x00a8, %r2
	.word 0xe8ba2df8  ! 986: STDA_I	stda	%r20, [%r8 + 0x0df8] %asi
	.word 0x8143e013  ! 987: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside 
	.word 0x22c20004  ! 988: BRZ	brz,a,nt	%8,<label_0x20004>
	.word 0xdf3a0009  ! 989: STDF_R	std	%f15, [%r9, %r8]
	.word 0xcb3a2f68  ! 990: STDF_I	std	%f5, [0x0f68, %r8]
	.word 0x30800004  ! 991: BA	ba,a	<label_0x4>
	.word 0x827a2a04  ! 992: SDIV_I	sdiv 	%r8, 0x0a04, %r1
	.word 0x2e800004  ! 993: BVS	bvs,a	<label_0x4>
	.word 0xe9e22009  ! 994: CASA_R	casa	[%r8] %asi, %r9, %r20
	.word 0x8143e071  ! 995: MEMBAR	membar	#LoadLoad | #Lookaside | #MemIssue | #Sync 
	.word 0xcc522754  ! 996: LDSH_I	ldsh	[%r8 + 0x0754], %r6
	.word 0x28800008  ! 997: BLEU	bleu,a	<label_0x8>
	.word 0xc3ea2f24  ! 998: PREFETCHA_I	prefetcha	[%r8, + 0x0f24] %asi, #one_read
	.word 0xf6aa2528  ! 999: STBA_I	stba	%r27, [%r8 + 0x0528] %asi
        ta      T_GOOD_TRAP

.data
	.word  0x1d01c71a,0x4f9436e2,0x7c819206,0x1cdbb0b3
	.word  0xc5026192,0x7d572ea9,0x641911d8,0xfac9b8c6
	.word  0x61fd13e3,0x6dbc8b6d,0x7ed88560,0x50be1d4a
	.word  0x10dd9ff4,0xacd6360f,0x67803985,0xd49245ee
	.word  0xdf0b9131,0xfd25470d,0xa3ced7bf,0x3772077f
	.word  0x7892171a,0xecdab689,0xbfe734d6,0xddd06c19
	.word  0x34135377,0x54a452b7,0x230d3e94,0x2d76eaea
	.word  0x763c16e3,0x3a0d3fe3,0x34b2bcb7,0x19389920
	.word  0xa7ed9041,0x83e2e0af,0x3ef570d2,0xe0499c66
	.word  0x93050304,0x5ed6cb4d,0x56411bc6,0x0981e9b3
	.word  0xdb05e305,0xbf505e09,0xbab32cfc,0x3631986c
	.word  0x052d0a89,0x86a76333,0xa32e08e9,0x965527e1
	.word  0xde6ee2b9,0x6b66b2cb,0x8499af93,0x2308a9d0
	.word  0x40521498,0x9a3b2fe2,0xb8b68dba,0xecb7cfa4
	.word  0xea093e58,0xdaad0721,0xde0b95b4,0x35bfa82b
	.word  0x96fa6bea,0x718ebdc8,0x3a4a7bf7,0xcff9378a
	.word  0x36fea3ab,0x78dd3f47,0x9e0cec76,0x5ae6e0e6
	.word  0xdd1b8a0d,0x2c0962e5,0x9ab32235,0x9547c572
	.word  0x305588aa,0xbc7b471b,0xd5e07c0e,0xa41d906c
	.word  0x033f73ea,0xa07ff827,0xdab7f329,0xcf1d5334
	.word  0x59082ef9,0x50d4463f,0xdb0c8619,0x10e9cbb0
	.word  0xdd1955d9,0x1a7b0ef1,0x769199d8,0xfaf19cc8
	.word  0xb33f92d3,0x9c90b576,0x9e6741b3,0xa61ed318
	.word  0x168398ae,0x19647abb,0xd37c2517,0x5c8229ae
	.word  0x17930de5,0x97430161,0x2b102384,0x25ed6002
	.word  0x576a91bc,0xe6cca0ed,0x0cae8438,0x7780a574
	.word  0x6e11f94b,0x1602874d,0x0f0d972f,0x9d20b6a0
	.word  0xe79e4a4b,0xbe8a6ceb,0x0b57b989,0x0b15a9e6
	.word  0x4337cc1c,0xf398c66c,0x464f17cb,0x25dd0b23
	.word  0xc5efd191,0xfd26728c,0xebb3b605,0xb12a0a9d
	.word  0x3021c385,0xae524bcb,0xac0a11e5,0xe369a6d9
	.word  0xb5e8c787,0xd186b522,0x6b6f48a2,0x9920c7a4
	.word  0x9246934a,0xc89ee349,0x440d8eb2,0xb4805908
	.word  0xf3d2c3ad,0x6f93e343,0x6d4eb507,0x791f4619
	.word  0x4985d058,0xc6025249,0xd59254d2,0x27d4af66
	.word  0x7b9be8b9,0xaf76221a,0x9829cb95,0x4764cea1
	.word  0xa2235513,0xe434435e,0xbd78a221,0x1fa82a1d
	.word  0x521d1475,0xeab107d9,0xf2355a78,0x6e51dc50
	.word  0x2934aef6,0x12efaeb8,0x13bda33a,0xc1aeb6e7
	.word  0x69c1bc88,0x4b8ba064,0x5a0b365a,0x9d219c28
	.word  0x63b63ce8,0x80134d1a,0x9346ce89,0x1db702c4
	.word  0x9d08f87c,0xed8291a4,0xd7dd8679,0x6a29b79f
	.word  0x42363aa8,0x269a6aac,0xc80ebe4b,0x6d4b5a8e
	.word  0x5f368be9,0x531e6dd7,0x333b3fcd,0x16a2d49d
	.word  0x629ea306,0x1b4ac3bd,0x55bd86f3,0x8f0f40ef
	.word  0x23e2dd6c,0x089fe10f,0xa0bfcdd5,0x2f33ee86
	.word  0xd5a3ede7,0xb8a2f6f1,0xc9792d64,0x7a74b1a6
	.word  0x01245ff8,0xc9554071,0x24e65b0c,0xe5c94fc9
	.word  0x4e9d9ff4,0x52e307f5,0x1ded44d5,0x2ad46090
	.word  0xc3e72279,0xa3102daa,0x903047a2,0x0185013d
	.word  0x1c63ea37,0x2c1673f2,0x3f3036bd,0x7ba0850d
	.word  0xdb16ec41,0xbe17bd9b,0x24c18bcd,0x36fb9384
	.word  0xb059b6f4,0xd5e37d20,0x14e2a0e4,0x096e18de
	.word  0x4ff31727,0x259f386c,0x2c989fa7,0x43322fad
	.word  0x016b088f,0xe61a829e,0xe248f945,0xfea7b1f9
	.word  0x38265b46,0xd2349369,0x7584c52d,0xac832d2e
	.word  0x608835b1,0x1348fcc9,0xd9384f02,0x89b77902
	.word  0xf7d018e2,0x19a76c33,0x545e52f8,0xd4cf0ca9
	.word  0xd7f204b9,0x06b3419d,0x36363292,0x3ea0fe86
	.word  0xd2391106,0x7db5d8c2,0x1b3c0a07,0x157fb04b
	.word  0x58904819,0x84449d81,0x709b0749,0xef5b9b97
	.word  0xfb030fef,0x9c8b5bcc,0xebffefd7,0x4fdc9f63
	.word  0xf202cc86,0xdcdf2f95,0x57ac8d98,0x2192dd28
	.word  0x98c752e4,0xcfc5e328,0xe7318521,0xc519ebea
	.word  0x00b60b47,0x9e2832cb,0x33d21905,0xb7e5e1a2
	.word  0x20eef488,0xb513b4c2,0x13310005,0xaecaa26c
	.word  0x0862f3bc,0xbc33c219,0xe10a6b28,0x814c5161
	.word  0x8daa8280,0x4d017643,0xe34ec08d,0xba989ce5
	.word  0xb3504c3d,0xa38ed55c,0x023d2053,0x791dbd73
	.word  0xc0716127,0x54240d73,0x736dfab6,0x254e8f61
	.word  0x76001447,0xa915b3b9,0xb4e031fa,0x5fe29035
	.word  0xa1e43bf8,0x897aa7ff,0x056ec946,0x6feaf6bf
	.word  0x66a70bb2,0x49d259e4,0x4f3da647,0xf4cc2589
	.word  0x865a1c30,0x2fcbfb7d,0x3cb05820,0xd9515753
	.word  0x283bfcbd,0x9104b811,0x93adc3b2,0xc94afff5
	.word  0xbfea1991,0xbb12bf55,0xa330743e,0xdae3f8e1
	.word  0xdccd0c89,0x35211f81,0xced6919a,0x8a18ad17
	.word  0xb4b7e5f9,0x46b3a633,0x1372228a,0x0477e950
	.word  0xf3e9e0a2,0x4e0e6a4b,0x936e221e,0x618c5023
	.word  0x4ede5b35,0x92488e01,0xe06e4e04,0xfd06e466
	.word  0xdf40e21c,0x4ab26fc8,0xf7e3e488,0x67ba8add
	.word  0xf6576e30,0x0b2b9b00,0x895ac9d0,0xc08fa116
	.word  0x13f05e3a,0x05959f6d,0xaab385c9,0x8cb4149d
	.word  0x2808e60b,0x75b9ad78,0x33248d12,0x208c5621
	.word  0xf70ab78a,0x2d63541b,0xab409ef8,0x5fbe2c75
	.word  0x8ac92609,0x7810ae71,0xfb20f503,0x68af6fd8
	.word  0x14279ada,0x4602c6e1,0x543bd9c2,0x8ff0e29c
	.word  0x8635d418,0xf221cefc,0xa5e3fa3b,0xbd3a4bae
	.word  0x8c3e44b0,0x74054835,0xdd671d91,0x5a4eae30
	.word  0x2fbf7267,0xb7e5474c,0x6a110fc7,0x5c14323c
	.word  0xa738aef0,0x5c5af307,0xf05e4d06,0xad41a76f
	.word  0x23514334,0xbf1199fe,0x97b28df5,0xf0659f54
	.word  0xe80d4c87,0x162cc627,0x6fbc02f1,0x68776b26
	.word  0xe81089d2,0x486504bf,0xaaef5eb8,0xa826201b
	.word  0x1516daf0,0x7d283493,0x2847d0f4,0xccdf0dbb
	.word  0x3296992e,0x6442b266,0x403a2547,0x22a8871c
	.word  0x568586c8,0xceb900ec,0x6af69122,0x4b2e9c52
	.word  0x3ca5d353,0x8e3f52b0,0x451996a8,0xee7be570
	.word  0xc2da0a01,0x211f1a9e,0x4f963e39,0x71be4f9b
	.word  0x2317dd73,0x1314fa4c,0x0d6e6894,0x2e56e240
	.word  0x839cf76f,0x8490f9a5,0xe983a3d7,0xa93423c3
	.word  0x5cbc5a23,0x48fd6ffa,0x3970d3e8,0x58318186
	.word  0x685ddfd1,0xfaa9f658,0x6eb60b4a,0x2230e556
	.word  0x884a9b6a,0xb9f268e4,0xb27af198,0x4ad64a16
	.word  0xa898d75b,0x601dded6,0x73104310,0x333aec74
	.word  0x9aec6f71,0x81f358b5,0x57440d7c,0x502261e8
	.word  0xa4247c68,0x39bb85b8,0xa5d9db7b,0x004b169f
	.word  0x78b39499,0x5229e308,0x56f22020,0xb69e0d59
	.word  0xcb0ba767,0x2a647d59,0xf643b92b,0x19c33e17
	.word  0x59d265a4,0x740dc40b,0x2178b212,0x642d54da
	.word  0x31838b0f,0x7aff9eea,0x6dbb4170,0x1597d631
	.word  0x34a1760f,0x810ef441,0xfc05787c,0x86101816
	.word  0x6a37d595,0x24a569c2,0xd5de3bf8,0xabdbe992
	.word  0xb5cbf3ba,0x3f331f75,0x061248e8,0x96edc856
	.word  0xaa9fa219,0x25018699,0x66872775,0xa4798c2b
	.word  0x26c9a77c,0x5310d213,0xbd76411a,0x43a5ec2b
	.word  0x73aa228c,0x28a24c66,0x3ee631e4,0x3e7af11d
	.word  0xb227a39f,0x1f9f4e82,0xae819319,0x16b26554
	.word  0xe3a4dd0e,0x78459f34,0xa694b5d0,0x230f3750
	.word  0x043530a1,0x71e74641,0x535a9259,0xd06388e4
	.word  0xf8373f9f,0xd7e244b3,0x043548bd,0xe15448d0
	.word  0xda0785db,0x2e7440d2,0x6e780b81,0xd88f099f
	.word  0x03189d6e,0x8201265a,0xc3e9b472,0xd0e6237d
	.word  0x95961c04,0x6242478e,0xcc6eee33,0xdefe2446
	.word  0xf73fd68f,0xd9111800,0xa3945aff,0x7c8b3f4a
	.word  0x4ad23b12,0xe71511b5,0xf591de45,0xbdc0d213
	.word  0x5d7abded,0x97b05ac0,0xc0159154,0x8f56b96e
	.word  0x42006c5a,0x06d1ca3a,0xfedf4f54,0x431048eb
	.word  0x86267c81,0x57ed4755,0x6d6ed4eb,0x70c0d92f
	.word  0x46fc89b5,0xa72c6d98,0x1c11c6a0,0xb4808ad7
	.word  0xb5866fc7,0xd2976d50,0x14858feb,0xfeda5f60
	.word  0x0fe2fcc6,0x1d388bfc,0x468e5851,0xe85ec5d1
	.word  0xa0a185d7,0x7d310e97,0x0ea97227,0x62f35bd5
	.word  0xf69b0bdd,0xae3a2747,0x83161d08,0xe33cdaeb
	.word  0xc908878c,0xa743eb91,0x91bafc36,0x37592754
	.word  0x5bf8658d,0x4df022da,0xe3c6d35f,0x5dde280f
	.word  0xeb690893,0xea8ea177,0x720b5487,0xb032c546
	.word  0x71378ba5,0x71c094f9,0xca6d7554,0xe3f990f8
	.word  0x9c4a0e6a,0xc73b9dd1,0xe1f46566,0x71dff1fc
	.word  0xa01f0e99,0x28cc2250,0x98134d3d,0x573173a0
	.word  0x5b4790e4,0x3b6e29bc,0x17f00806,0xc9bde5c4
	.word  0xf8cab63a,0x81dc8154,0x9db6a9aa,0x1e6a71ef
	.word  0xe0861048,0x37d1e76d,0x430b437a,0x93d5c497
	.word  0x5dc361fd,0x0ed29c89,0xaf296ab5,0x77a7f112
	.word  0x97f84662,0xe3b82188,0x903b9ebd,0x3e1c4b44
	.word  0x5ac930dc,0xe0ea128e,0xa52848a2,0xd3bb49d7
	.word  0x7ee1ca41,0x2c1420c5,0x695f3f98,0x7941f0ad
	.word  0xcb80386e,0x3f7f5c9a,0x4e6aa7ed,0xc18e3aa8
	.word  0x870870cf,0x96ed6815,0x8612edfd,0x6c84bfc9
	.word  0x5b2aab9a,0x24510a6c,0x2155f1ec,0xd66658c1
	.word  0x3ef9e2e4,0x27e9aabe,0x27a49d59,0x47b78ba7
	.word  0x32a52330,0x2c68f882,0xb44a9f08,0xbacd4b92
	.word  0xf7c754de,0x3f55efd9,0xa06bb554,0xf3f7a3fc
	.word  0x58253a9c,0x20314beb,0xef3a12e6,0x9ac7205d
	.word  0xb6766d43,0x6a3a6682,0x2f298b72,0xcbd7a011
	.word  0x712b3595,0xbb02de44,0x7c8e5bc7,0xd6e72c06
	.word  0x0a361b1d,0x951a78cb,0x20d67db5,0x6bd23239
	.word  0x5398c5ba,0xa7024d08,0x9e2fbd23,0x61252ccc
	.word  0x048ccb4e,0x225a232a,0xf734d887,0xf24d6138
	.word  0x7ee5139a,0xa1fbd3af,0x008293b5,0xcc2401ea
	.word  0x1141e814,0x71619433,0x61a438fb,0x38ca53be
	.word  0xb5cc0366,0x92e15521,0xe0e947a2,0x943ea361
	.word  0xbf86a157,0x017f9a50,0xd0f34426,0x0b7091b9
	.word  0xb126ac5e,0xcc5792b3,0x16dd3de2,0xfe451aa2
	.word  0x28aced80,0xbd61f011,0x97904f99,0x924ea173
	.word  0xccf61c7f,0xf4e30d77,0xa39fa556,0x53d12bb4
	.word  0x3eb83ac6,0x701704e0,0xdd41a25e,0x8e5b1bf3
	.word  0xee8a9b09,0x8dbe77d9,0x5d453b8b,0x86f1fc30
	.word  0x6c010cc1,0x285a550a,0xcd3a3b58,0xa55006f9
	.word  0xe901d74e,0xc74e5394,0x78ee3875,0x8ddbbc39
	.word  0xae63f6cb,0x86c820b9,0x97bc2b32,0xf532fb33
	.word  0xeadbb981,0x21e798ac,0xa20de92f,0x91598175
	.word  0xbac17ad0,0x2d028459,0x70ff7ead,0xfa3ce025
	.word  0xcc3b40b3,0xaffaeaeb,0x08f05553,0x3a6226fe
	.word  0x929c0e37,0x46ca5056,0xff64708c,0x6ae377c6
	.word  0xf08e18e3,0xdbda97f4,0xfbc79793,0x95715e72
	.word  0x0505982b,0x4e24807d,0x1815ec78,0xa4cab1a2
	.word  0x0d2df4a5,0x19d0883a,0x5271cd99,0xfee6fbfb
	.word  0x90c33cda,0x0f96b6f5,0x4e2db6ea,0xc07a178b
	.word  0x12f41073,0xa284d0a3,0x4f51499b,0xaedf2f8b
	.word  0x7803d23b,0x505c1465,0x48c693d6,0x93fd5c0d
	.word  0x3893e0d4,0x4145bc25,0x59ac83e4,0xce9d75a7
	.word  0xdc91eaeb,0xd71eeacc,0x22cddebb,0xb1c81aba
	.word  0x1ac41cf1,0x8d5f3531,0xad7c7222,0xf5920de2
	.word  0x4e79fdb8,0xb2965710,0x5951829a,0xf46175df
	.word  0x2c536ce5,0xd77d35df,0x5f0bc48c,0x7c73ee39
	.word  0x91d4fcd6,0xa2b41298,0x11228e06,0xcdb438f1
	.word  0x9cfe431f,0x99041f5b,0x6d3164f9,0x8aa72ed1
	.word  0x005c211c,0xc97b82f6,0x4d484aa3,0x2b1311b4
	.word  0xe4de2197,0xa2cd5961,0xdcef672b,0x082b9412
	.word  0x5cd7520b,0xf21d5cc0,0x65287304,0x4da35dbb
	.word  0x2f5c7cca,0x69dfe4dc,0xd6f5a96e,0xea97bdf4
	.word  0xcb93ac59,0x5cf2c868,0x781869e0,0xbb122676
	.word  0x51b55a2b,0xb2a48000,0x838ea605,0xdd6db22b
	.word  0x1a2f91de,0x9c36fe38,0xe453581f,0x05f828a7
	.word  0x388396b3,0xb99b0d85,0x727a8a3e,0xb6daa960
	.word  0x41ea9c46,0x0b602ec8,0xd9cbc6b1,0xd1bc90bc
	.word  0x27b677c6,0x37b58cf1,0x81bca079,0xda08b658
	.word  0x27e004b4,0x719c8f78,0xc2c3959d,0xce537223
	.word  0x177e7675,0xfd7c2d82,0x99b00c46,0x0990b837
	.word  0x28d5d15c,0x2f35c7da,0xba8f6c2b,0x6b15148e
	.word  0xe63efc25,0x26c56607,0x2f925851,0x973c0635
	.word  0x4318390f,0x45254e87,0x5117d693,0x87816a1a
	.word  0xd3977da4,0x0d8dcbd2,0x499f1352,0xda1902ba
	.word  0x973ed87a,0xe341d171,0xa10f3405,0xcad1806d
	.word  0xf636958c,0xd508c5c0,0x0d938109,0xa3887fea
	.word  0x72025211,0x8ff748b4,0x11a2aabd,0x63131109
	.word  0x8085aa0f,0x806f11ae,0x2d2d3430,0x0b61184f
	.word  0xefa18b38,0x991ffa1d,0x050d8609,0x2eafb048
	.word  0xa03a469a,0xa735369e,0x08f61106,0xfc4b2783
	.word  0xdcbd895c,0xdc0d9656,0xd2157e4c,0x8198113b
	.word  0x33cd7112,0xc09f277d,0x3cf6879b,0xa7eb6d9e
	.word  0x6ef13bfb,0x57fde95e,0x1ae67322,0xdbf682eb
	.word  0x7d22fb9d,0xd3bfb072,0x5e303cd4,0xa9a49bc7
	.word  0xc26473c7,0xf83d1149,0x51eac749,0x523f9109
	.word  0xc84aaf11,0x75bc67ee,0x04acf6e4,0x7acf4cb3
	.word  0xda98afd3,0x31b9e39a,0x14c3e6e0,0x9511f190
	.word  0xb1901c8d,0x606e4f0c,0xf66f1153,0x0e410675
	.word  0x46d46b00,0x64d37432,0x3537ae40,0x3e47bfc3
	.word  0x5a57c989,0x01da62ad,0x488bb4ff,0x6301d51f
	.word  0x7c6345e7,0x49909dbf,0x583d1b40,0xf3a0c730
	.word  0xf61bb3d9,0x7efaae8d,0xad8864e9,0xbd957912
	.word  0x9cae23ff,0x1419df6a,0x590cb295,0x112d63b0
	.word  0x9691a2d4,0x6f1a1cd4,0xb573b1b1,0x6d08cdfb
	.word  0xa4610b5f,0x070a2c80,0x0482b3b6,0x02121845
	.word  0x0b7fe2ba,0x44302ae5,0x49917794,0xd20fefde
	.word  0x40de063a,0x5f08ef9b,0xa1fb586e,0x5dae8678
	.word  0x13a04aa9,0x7b73199d,0xaa88abac,0x2b73e3ea
	.word  0x3cdfd54f,0x85e2f8fb,0x0ab7791d,0x89a1a42f
	.word  0xb048ec50,0xfbca2734,0x644861ae,0x506938ac
	.word  0x5cf6a471,0xaeb4a1cd,0xe9afdf38,0xa587ed6c
	.word  0x889fc6a2,0x43d9a8e4,0xe452de0a,0x7ba3b093
	.word  0xd4e6ca85,0xeb21acea,0x196e9ba8,0x99d46fd6
	.word  0xcebd21b0,0xebd71733,0xad8abe07,0x7d1012cb
	.word  0xc6ffe0cd,0x3ec8ed65,0x8f48f4ac,0xe52b0b6d
	.word  0x863a918d,0x0209a00e,0xc84b427c,0x31ef2336
	.word  0xa553954e,0x8da9f209,0xbf1effba,0x0bfa14f7
	.word  0xeefd9b1a,0x20818c7e,0x5fac2561,0x386b8a5b
	.word  0xe6aea3c4,0x08235d8c,0xd56197a2,0x07e3422c
	.word  0x1481db47,0xf9dc7442,0x126909f8,0xd79925ac
	.word  0x59243cbc,0x922cbb16,0x62583c8d,0x86af90de
	.word  0x927450cf,0xbe45573a,0x78d80add,0xe475e2c6
	.word  0xfbeb9209,0x4d00809a,0x2840d5b8,0x09669f28
	.word  0xc431682f,0x14d8ab82,0x976fca8e,0x35f0dc71
	.word  0x29d3a299,0x7e9f56ed,0x7c4f63dd,0x2920bb6b
	.word  0x4d67f6cf,0xeb6c7865,0xc4f1487e,0x3f5e6e99
	.word  0x92da28e2,0x098ccd27,0x1c92079c,0xfc3eed29
	.word  0xf2ec84ce,0xdec6f414,0xac93ac31,0xefb42d90
	.word  0x52910280,0x42b22f05,0xaf9dce07,0x25957b0e
	.word  0xcc0d9980,0x7196c31a,0x469823e9,0xf1486864
	.word  0x5c2400c7,0x8369af83,0x24cbeaa0,0x4f10a690
	.word  0xcbae0b85,0xeba9d093,0xc88e5c53,0xae4659b4
	.word  0x0512dbcd,0x861b7113,0x25d7c96c,0xd709e6b9
	.word  0x83c3d5f7,0x0978338c,0x758ebb59,0x6154a3ad
	.word  0x5975df2f,0x1f843388,0x2644498a,0xfb08d953
	.word  0x9d3c5caf,0x071e2687,0x18b40fa8,0x745010f9



