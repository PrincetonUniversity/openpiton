// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: bug2868.s
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
   random seed:	116943359
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
        setx  0x0000000000000220, %g1, %r9
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
        setx  0xdc1a1e6566c196e8, %g1, %r0
        setx  0xe13817b7d06a514a, %g1, %r1
        setx  0x72158fc1fc3b9237, %g1, %r2
        setx  0xcfeb648c5af5b028, %g1, %r3
        setx  0x2eb71b1c4d90ff46, %g1, %r4
        setx  0x22b69fb38f7d02a8, %g1, %r5
        setx  0x77c8a852dae6c89e, %g1, %r6
        setx  0x959face2b3565cc5, %g1, %r7
        setx  0x087c0fe119accb4f, %g1, %r10
        setx  0x4f6c6e82d36f2777, %g1, %r11
        setx  0x8a73cfaa8c253bf7, %g1, %r12
        setx  0xb38cce53dfbc7925, %g1, %r13
        setx  0xfc51080c9f494865, %g1, %r14
        setx  0x132084cf52544253, %g1, %r15
        setx  0x876520b2e89e862d, %g1, %r16
        setx  0x403d4296b9e909c2, %g1, %r17
        setx  0x28b9210025797f9c, %g1, %r18
        setx  0xb2c6056a3e77bc02, %g1, %r19
        setx  0x8358688dc15c7df0, %g1, %r20
        setx  0x8e14f7ba8758f985, %g1, %r21
        setx  0xc835a6f57bbfa539, %g1, %r22
        setx  0x74ece8d54bdd413f, %g1, %r23
        setx  0x45ed79472259b1c8, %g1, %r24
        setx  0x93c335524ca8e7af, %g1, %r25
        setx  0x3002a5b3a5d8b514, %g1, %r26
        setx  0x4c2e5bfb30890d56, %g1, %r27
        setx  0x6ac72ce8c412dd4a, %g1, %r28
        setx  0xbafc36c548501534, %g1, %r29
        setx  0xf0a481019a666da3, %g1, %r30
        setx  0x5bc26d186a8b2319, %g1, %r31
	.word 0xcaea2f50  ! 5: LDSTUBA_I	ldstuba	%r5, [%r8 + 0x0f50] %asi
	.word 0xc25a22e8  ! 7: LDX_I	ldx	[%r8 + 0x02e8], %r1
	.word 0x00800002  ! 8: BN	bn  	<label_0x2>
	.word 0xc2821009  ! 9: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r1
	.word 0xe2c22034  ! 10: LDSWA_I	ldswa	[%r8, + 0x0034] %asi, %r17
	.word 0xcef22e68  ! 11: STXA_I	stxa	%r7, [%r8 + 0x0e68] %asi
	.word 0xfca21009  ! 13: STWA_R	stwa	%r30, [%r8 + %r9] 0x80
	.word 0xc2d226ec  ! 14: LDSHA_I	ldsha	[%r8, + 0x06ec] %asi, %r1
	.word 0x8143c000  ! 15: STBAR	stbar
	.word 0x8143e055  ! 16: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside | #Sync 
	.word 0xef222fc4  ! 18: STF_I	st	%f23, [0x0fc4, %r8]
	.word 0xdc921009  ! 19: LDUHA_R	lduha	[%r8, %r9] 0x80, %r14
	.word 0xc6120009  ! 20: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xc3ea2228  ! 21: PREFETCHA_I	prefetcha	[%r8, + 0x0228] %asi, #one_read
	.word 0xd6fa2018  ! 22: SWAPA_I	swapa	%r11, [%r8 + 0x0018] %asi
	.word 0x865229f4  ! 23: UMUL_I	umul 	%r8, 0x09f4, %r3
	.word 0x8143c000  ! 25: STBAR	stbar
	.word 0x8da209a9  ! 26: FDIVs	fdivs	%f8, %f9, %f6
	.word 0xc45a0009  ! 27: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xdff22009  ! 28: CASXA_R	casxa	[%r8]%asi, %r9, %r15
	.word 0xc2aa1009  ! 29: STBA_R	stba	%r1, [%r8 + %r9] 0x80
	.word 0xbfa20829  ! 30: FADDs	fadds	%f8, %f9, %f31
	.word 0x8b220009  ! 32: MULScc_R	mulscc 	%r8, %r9, %r5
	.word 0xcafa2fdc  ! 33: SWAPA_I	swapa	%r5, [%r8 + 0x0fdc] %asi
	.word 0xc2c21009  ! 34: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r1
	.word 0x0cca0001  ! 35: BRGZ	brgz  ,pt	%8,<label_0xa0001>
	.word 0xcb3a0009  ! 36: STDF_R	std	%f5, [%r9, %r8]
	.word 0xb052240c  ! 37: UMUL_I	umul 	%r8, 0x040c, %r24
	.word 0xa65a0009  ! 38: SMUL_R	smul 	%r8, %r9, %r19
	.word 0xf60a22dc  ! 39: LDUB_I	ldub	[%r8 + 0x02dc], %r27
	.word 0x8143e007  ! 40: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore 
	.word 0xfcba1009  ! 41: STDA_R	stda	%r30, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 42: STBAR	stbar
	.word 0xc53a0009  ! 43: STDF_R	std	%f2, [%r9, %r8]
	.word 0x8143c000  ! 44: STBAR	stbar
	.word 0xc8122568  ! 45: LDUH_I	lduh	[%r8 + 0x0568], %r4
	.word 0xc8020009  ! 46: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xc36a28dc  ! 47: PREFETCH_I	prefetch	[%r8 + 0x08dc], #one_read
	.word 0x8ad20009  ! 48: UMULcc_R	umulcc 	%r8, %r9, %r5
	.word 0xc2fa1009  ! 49: SWAPA_R	swapa	%r1, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 50: STBAR	stbar
	.word 0xc4c21009  ! 51: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r2
	.word 0xe2f22ef8  ! 52: STXA_I	stxa	%r17, [%r8 + 0x0ef8] %asi
	.word 0xc2420009  ! 53: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0x83a208a9  ! 56: FSUBs	fsubs	%f8, %f9, %f1
	.word 0x40000001  ! 57: CALL	call	disp30_1
	.word 0x8cda0009  ! 58: SMULcc_R	smulcc 	%r8, %r9, %r6
	.word 0x2aca0001  ! 59: BRNZ	brnz,a,pt	%8,<label_0xa0001>
	.word 0x2ac20001  ! 60: BRNZ	brnz,a,nt	%8,<label_0x20001>
	.word 0xc2d21009  ! 61: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r1
	.word 0x8c7a0009  ! 62: SDIV_R	sdiv 	%r8, %r9, %r6
	.word 0xcc7a0009  ! 63: SWAP_R	swap	%r6, [%r8 + %r9]
	.word 0x8143c000  ! 64: STBAR	stbar
	.word 0xcef21009  ! 65: STXA_R	stxa	%r7, [%r8 + %r9] 0x80
	.word 0x22ca0001  ! 66: BRZ	brz,a,pt	%8,<label_0xa0001>
	.word 0x3c800001  ! 67: BPOS	bpos,a	<label_0x1>
	.word 0xca1220c4  ! 68: LDUH_I	lduh	[%r8 + 0x00c4], %r5
	.word 0xc73a0009  ! 69: STDF_R	std	%f3, [%r9, %r8]
	.word 0x8143e077  ! 70: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside | #MemIssue | #Sync 
	.word 0xcafa1009  ! 71: SWAPA_R	swapa	%r5, [%r8 + %r9] 0x80
	.word 0xdff21009  ! 72: CASXA_I	casxa	[%r8] 0x80, %r9, %r15
	.word 0xdefa1009  ! 73: SWAPA_R	swapa	%r15, [%r8 + %r9] 0x80
	.word 0xc3ea20f0  ! 74: PREFETCHA_I	prefetcha	[%r8, + 0x00f0] %asi, #one_read
	.word 0xfcc21009  ! 75: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r30
	.word 0x9f220009  ! 76: MULScc_R	mulscc 	%r8, %r9, %r15
	.word 0xc2b22a78  ! 77: STHA_I	stha	%r1, [%r8 + 0x0a78] %asi
	.word 0x2e800001  ! 78: BVS	bvs,a	<label_0x1>
	.word 0x8fa20929  ! 79: FMULs	fmuls	%f8, %f9, %f7
	.word 0xc522278c  ! 80: STF_I	st	%f2, [0x078c, %r8]
	.word 0xfe6a0009  ! 81: LDSTUB_R	ldstub	%r31, [%r8 + %r9]
	.word 0xc2122a44  ! 82: LDUH_I	lduh	[%r8 + 0x0a44], %r1
	.word 0x8143e055  ! 83: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside | #Sync 
	.word 0xc24a2414  ! 84: LDSB_I	ldsb	[%r8 + 0x0414], %r1
	.word 0xa4f22f30  ! 85: UDIVcc_I	udivcc 	%r8, 0x0f30, %r18
	.word 0x20800001  ! 86: BN	bn,a	<label_0x1>
	.word 0x86f20009  ! 87: UDIVcc_R	udivcc 	%r8, %r9, %r3
	.word 0x1a800002  ! 88: BCC	bcc  	<label_0x2>
	.word 0xc6921009  ! 89: LDUHA_R	lduha	[%r8, %r9] 0x80, %r3
	.word 0x8143c000  ! 90: STBAR	stbar
	.word 0x84f20009  ! 91: UDIVcc_R	udivcc 	%r8, %r9, %r2
	.word 0x826a0009  ! 92: UDIVX_R	udivx 	%r8, %r9, %r1
	.word 0xc4aa1009  ! 93: STBA_R	stba	%r2, [%r8 + %r9] 0x80
	.word 0xc20a0009  ! 94: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xcaa21009  ! 95: STWA_R	stwa	%r5, [%r8 + %r9] 0x80
	.word 0xfefa236c  ! 96: SWAPA_I	swapa	%r31, [%r8 + 0x036c] %asi
	.word 0xaa720009  ! 97: UDIV_R	udiv 	%r8, %r9, %r21
	.word 0xa76a0009  ! 98: SDIVX_R	sdivx	%r8, %r9, %r19
	.word 0xc36a2404  ! 99: PREFETCH_I	prefetch	[%r8 + 0x0404], #one_read
	.word 0xcf222984  ! 100: STF_I	st	%f7, [0x0984, %r8]
	.word 0x8143c000  ! 101: STBAR	stbar
	.word 0x867a0009  ! 103: SDIV_R	sdiv 	%r8, %r9, %r3
	.word 0xcaaa1009  ! 105: STBA_R	stba	%r5, [%r8 + %r9] 0x80
	.word 0x00800001  ! 106: BN	bn  	<label_0x1>
	.word 0xceca1009  ! 107: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r7
	.word 0xc4420009  ! 108: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0x26800002  ! 110: BL	bl,a	<label_0x2>
	.word 0x8e4a0009  ! 111: MULX_R	mulx 	%r8, %r9, %r7
	.word 0xdc0a24f4  ! 112: LDUB_I	ldub	[%r8 + 0x04f4], %r14
	.word 0x8143c000  ! 113: STBAR	stbar
	.word 0xc2120009  ! 114: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0x8fa20829  ! 115: FADDs	fadds	%f8, %f9, %f7
	.word 0xca7a28b8  ! 116: SWAP_I	swap	%r5, [%r8 + 0x08b8]
	.word 0x22800001  ! 117: BE	be,a	<label_0x1>
	.word 0xc3ea2f78  ! 118: PREFETCHA_I	prefetcha	[%r8, + 0x0f78] %asi, #one_read
	.word 0xc40a0009  ! 119: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xc41a2218  ! 120: LDD_I	ldd	[%r8 + 0x0218], %r2
	.word 0xca921009  ! 121: LDUHA_R	lduha	[%r8, %r9] 0x80, %r5
	.word 0xce020009  ! 123: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xfcb22428  ! 124: STHA_I	stha	%r30, [%r8 + 0x0428] %asi
	.word 0x14800001  ! 125: BG	bg  	<label_0x1>
	.word 0x88520009  ! 126: UMUL_R	umul 	%r8, %r9, %r4
	.word 0xc8b21009  ! 127: STHA_R	stha	%r4, [%r8 + %r9] 0x80
	.word 0x8e722ccc  ! 129: UDIV_I	udiv 	%r8, 0x0ccc, %r7
	.word 0xced2269c  ! 130: LDSHA_I	ldsha	[%r8, + 0x069c] %asi, %r7
	.word 0x8c6a29f4  ! 131: UDIVX_I	udivx 	%r8, 0x09f4, %r6
	.word 0xc3ea2c00  ! 132: PREFETCHA_I	prefetcha	[%r8, + 0x0c00] %asi, #one_read
	.word 0xcc0a0009  ! 133: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xc2fa2918  ! 134: SWAPA_I	swapa	%r1, [%r8 + 0x0918] %asi
	.word 0x8a6a22e4  ! 135: UDIVX_I	udivx 	%r8, 0x02e4, %r5
	.word 0xeef21009  ! 136: STXA_R	stxa	%r23, [%r8 + %r9] 0x80
	.word 0xdc520009  ! 137: LDSH_R	ldsh	[%r8 + %r9], %r14
	.word 0xc2022d10  ! 138: LDUW_I	lduw	[%r8 + 0x0d10], %r1
	.word 0xdeaa206c  ! 140: STBA_I	stba	%r15, [%r8 + 0x006c] %asi
	.word 0xf8ba2528  ! 141: STDA_I	stda	%r28, [%r8 + 0x0528] %asi
	.word 0x8af22da8  ! 142: UDIVcc_I	udivcc 	%r8, 0x0da8, %r5
	.word 0xc46a21dc  ! 143: LDSTUB_I	ldstub	%r2, [%r8 + 0x01dc]
	.word 0x40000001  ! 144: CALL	call	disp30_1
	.word 0xd49a2b90  ! 145: LDDA_I	ldda	[%r8, + 0x0b90] %asi, %r10
	.word 0xc36a2e18  ! 146: PREFETCH_I	prefetch	[%r8 + 0x0e18], #one_read
	.word 0x18800001  ! 147: BGU	bgu  	<label_0x1>
	.word 0xe8020009  ! 148: LDUW_R	lduw	[%r8 + %r9], %r20
	.word 0xc212236c  ! 150: LDUH_I	lduh	[%r8 + 0x036c], %r1
	.word 0xce522424  ! 151: LDSH_I	ldsh	[%r8 + 0x0424], %r7
	.word 0x36800001  ! 152: BGE	bge,a	<label_0x1>
	.word 0xc8420009  ! 153: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xd4122258  ! 154: LDUH_I	lduh	[%r8 + 0x0258], %r10
	.word 0x8c7223a0  ! 155: UDIV_I	udiv 	%r8, 0x03a0, %r6
	.word 0x8e5a0009  ! 156: SMUL_R	smul 	%r8, %r9, %r7
	.word 0x8143e051  ! 157: MEMBAR	membar	#LoadLoad | #Lookaside | #Sync 
	.word 0xc8f22a98  ! 158: STXA_I	stxa	%r4, [%r8 + 0x0a98] %asi
	.word 0xc67a0009  ! 159: SWAP_R	swap	%r3, [%r8 + %r9]
	.word 0xc36a27bc  ! 160: PREFETCH_I	prefetch	[%r8 + 0x07bc], #one_read
	.word 0xcca228e0  ! 161: STWA_I	stwa	%r6, [%r8 + 0x08e0] %asi
	.word 0x8143e004  ! 162: MEMBAR	membar	#LoadStore 
	.word 0xcc1225d8  ! 163: LDUH_I	lduh	[%r8 + 0x05d8], %r6
	.word 0xce8a21f8  ! 164: LDUBA_I	lduba	[%r8, + 0x01f8] %asi, %r7
	.word 0x2cc20001  ! 165: BRGZ	brgz,a,nt	%8,<label_0x20001>
	.word 0xc6921009  ! 166: LDUHA_R	lduha	[%r8, %r9] 0x80, %r3
	.word 0xcefa1009  ! 167: SWAPA_R	swapa	%r7, [%r8 + %r9] 0x80
	.word 0x87a209a9  ! 168: FDIVs	fdivs	%f8, %f9, %f3
	.word 0xe8ba1009  ! 169: STDA_R	stda	%r20, [%r8 + %r9] 0x80
	.word 0x1a800002  ! 170: BCC	bcc  	<label_0x2>
	.word 0xc60a2064  ! 171: LDUB_I	ldub	[%r8 + 0x0064], %r3
	.word 0xe5f22009  ! 172: CASXA_R	casxa	[%r8]%asi, %r9, %r18
	.word 0x16800002  ! 173: BGE	bge  	<label_0x2>
	.word 0xceea1009  ! 174: LDSTUBA_R	ldstuba	%r7, [%r8 + %r9] 0x80
	.word 0xb0520009  ! 175: UMUL_R	umul 	%r8, %r9, %r24
	.word 0xfefa2280  ! 176: SWAPA_I	swapa	%r31, [%r8 + 0x0280] %asi
	.word 0x847a20b0  ! 177: SDIV_I	sdiv 	%r8, 0x00b0, %r2
	.word 0xc36a2e48  ! 178: PREFETCH_I	prefetch	[%r8 + 0x0e48], #one_read
	.word 0x9c5a2650  ! 179: SMUL_I	smul 	%r8, 0x0650, %r14
	.word 0x825a2834  ! 180: SMUL_I	smul 	%r8, 0x0834, %r1
	.word 0xd7220009  ! 182: STF_R	st	%f11, [%r9, %r8]
	.word 0xd6aa1009  ! 184: STBA_R	stba	%r11, [%r8 + %r9] 0x80
	.word 0xedf22009  ! 185: CASXA_R	casxa	[%r8]%asi, %r9, %r22
	.word 0xc5220009  ! 188: STF_R	st	%f2, [%r9, %r8]
	.word 0xfe522f20  ! 189: LDSH_I	ldsh	[%r8 + 0x0f20], %r31
	.word 0x83a208a9  ! 190: FSUBs	fsubs	%f8, %f9, %f1
	.word 0xcde21009  ! 191: CASA_I	casa	[%r8] 0x80, %r9, %r6
	.word 0x8143e019  ! 192: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside 
	.word 0xca0a2084  ! 193: LDUB_I	ldub	[%r8 + 0x0084], %r5
	.word 0xc4da26a0  ! 194: LDXA_I	ldxa	[%r8, + 0x06a0] %asi, %r2
	.word 0xc36a28e8  ! 195: PREFETCH_I	prefetch	[%r8 + 0x08e8], #one_read
	.word 0xfcea1009  ! 196: LDSTUBA_R	ldstuba	%r30, [%r8 + %r9] 0x80
	.word 0x947a24b4  ! 197: SDIV_I	sdiv 	%r8, 0x04b4, %r10
	.word 0x84da2494  ! 198: SMULcc_I	smulcc 	%r8, 0x0494, %r2
	.word 0x8c4a0009  ! 199: MULX_R	mulx 	%r8, %r9, %r6
	.word 0x9e4a0009  ! 200: MULX_R	mulx 	%r8, %r9, %r15
	.word 0x84da2818  ! 201: SMULcc_I	smulcc 	%r8, 0x0818, %r2
	.word 0x8143e038  ! 202: MEMBAR	membar	#StoreStore | #Lookaside | #MemIssue 
	.word 0xc6ca1009  ! 203: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r3
	.word 0xe282222c  ! 204: LDUWA_I	lduwa	[%r8, + 0x022c] %asi, %r17
	.word 0x16800002  ! 205: BGE	bge  	<label_0x2>
	.word 0x06800001  ! 206: BL	bl  	<label_0x1>
	.word 0xc80a24d0  ! 207: LDUB_I	ldub	[%r8 + 0x04d0], %r4
	.word 0xd6122204  ! 208: LDUH_I	lduh	[%r8 + 0x0204], %r11
	.word 0xff220009  ! 209: STF_R	st	%f31, [%r9, %r8]
	.word 0xc2b22998  ! 210: STHA_I	stha	%r1, [%r8 + 0x0998] %asi
	.word 0x8ba208a9  ! 211: FSUBs	fsubs	%f8, %f9, %f5
	.word 0x84d228e8  ! 212: UMULcc_I	umulcc 	%r8, 0x08e8, %r2
	.word 0x8143e009  ! 213: MEMBAR	membar	#LoadLoad | #StoreStore 
	.word 0xfcaa2578  ! 214: STBA_I	stba	%r30, [%r8 + 0x0578] %asi
	.word 0xc2da1009  ! 215: LDXA_R	ldxa	[%r8, %r9] 0x80, %r1
	.word 0x8252241c  ! 216: UMUL_I	umul 	%r8, 0x041c, %r1
	.word 0xc60228f0  ! 217: LDUW_I	lduw	[%r8 + 0x08f0], %r3
	.word 0x38800001  ! 218: BGU	bgu,a	<label_0x1>
	.word 0xc36a280c  ! 219: PREFETCH_I	prefetch	[%r8 + 0x080c], #one_read
	.word 0x87a20929  ! 220: FMULs	fmuls	%f8, %f9, %f3
	.word 0xfada1009  ! 221: LDXA_R	ldxa	[%r8, %r9] 0x80, %r29
	.word 0xe92227c8  ! 222: STF_I	st	%f20, [0x07c8, %r8]
	.word 0xe04221a4  ! 223: LDSW_I	ldsw	[%r8 + 0x01a4], %r16
	.word 0x84da2104  ! 224: SMULcc_I	smulcc 	%r8, 0x0104, %r2
	.word 0x8143c000  ! 225: STBAR	stbar
	.word 0xc4422538  ! 226: LDSW_I	ldsw	[%r8 + 0x0538], %r2
	.word 0xeff21009  ! 227: CASXA_I	casxa	[%r8] 0x80, %r9, %r23
	.word 0x1a800001  ! 228: BCC	bcc  	<label_0x1>
	.word 0x24800001  ! 229: BLE	ble,a	<label_0x1>
	.word 0xc89a1009  ! 230: LDDA_R	ldda	[%r8, %r9] 0x80, %r4
	.word 0xc6fa29cc  ! 231: SWAPA_I	swapa	%r3, [%r8 + 0x09cc] %asi
	.word 0x2e800001  ! 232: BVS	bvs,a	<label_0x1>
	.word 0xcff22009  ! 233: CASXA_R	casxa	[%r8]%asi, %r9, %r7
	.word 0xc36a203c  ! 234: PREFETCH_I	prefetch	[%r8 + 0x003c], #one_read
	.word 0x36800002  ! 235: BGE	bge,a	<label_0x2>
	.word 0x82da0009  ! 236: SMULcc_R	smulcc 	%r8, %r9, %r1
	.word 0xc4da2f98  ! 237: LDXA_I	ldxa	[%r8, + 0x0f98] %asi, %r2
	.word 0x8143e01a  ! 238: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside 
	.word 0x8143e04a  ! 239: MEMBAR	membar	#StoreLoad | #StoreStore | #Sync 
	.word 0xd41a0009  ! 240: LDD_R	ldd	[%r8 + %r9], %r10
	.word 0xc4ea2834  ! 241: LDSTUBA_I	ldstuba	%r2, [%r8 + 0x0834] %asi
	.word 0xf2921009  ! 242: LDUHA_R	lduha	[%r8, %r9] 0x80, %r25
	.word 0xc5f22009  ! 243: CASXA_R	casxa	[%r8]%asi, %r9, %r2
	.word 0x8c6a2b54  ! 244: UDIVX_I	udivx 	%r8, 0x0b54, %r6
	.word 0x04ca0001  ! 245: BRLEZ	brlez  ,pt	%8,<label_0xa0001>
	.word 0xc8fa1009  ! 246: SWAPA_R	swapa	%r4, [%r8 + %r9] 0x80
	.word 0x88720009  ! 247: UDIV_R	udiv 	%r8, %r9, %r4
	.word 0x8d2220c4  ! 248: MULScc_I	mulscc 	%r8, 0x00c4, %r6
	.word 0xcf220009  ! 249: STF_R	st	%f7, [%r9, %r8]
	.word 0xc3ea288c  ! 250: PREFETCHA_I	prefetcha	[%r8, + 0x088c] %asi, #one_read
	.word 0xe3222c34  ! 251: STF_I	st	%f17, [0x0c34, %r8]
	.word 0x864a0009  ! 252: MULX_R	mulx 	%r8, %r9, %r3
	.word 0x0c800001  ! 253: BNEG	bneg  	<label_0x1>
	.word 0x0c800001  ! 254: BNEG	bneg  	<label_0x1>
	.word 0xf9f22009  ! 255: CASXA_R	casxa	[%r8]%asi, %r9, %r28
	.word 0x8ba209a9  ! 256: FDIVs	fdivs	%f8, %f9, %f5
	.word 0xc7220009  ! 257: STF_R	st	%f3, [%r9, %r8]
	.word 0x8e4a0009  ! 258: MULX_R	mulx 	%r8, %r9, %r7
	.word 0xfc7a0009  ! 259: SWAP_R	swap	%r30, [%r8 + %r9]
	.word 0x844a0009  ! 261: MULX_R	mulx 	%r8, %r9, %r2
	.word 0xe4c21009  ! 262: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r18
	.word 0xc36a2518  ! 263: PREFETCH_I	prefetch	[%r8 + 0x0518], #one_read
	.word 0x896a0009  ! 264: SDIVX_R	sdivx	%r8, %r9, %r4
	.word 0x8ba20829  ! 265: FADDs	fadds	%f8, %f9, %f5
	.word 0x8da20829  ! 266: FADDs	fadds	%f8, %f9, %f6
	.word 0x8143e055  ! 268: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside | #Sync 
	.word 0xccea208c  ! 269: LDSTUBA_I	ldstuba	%r6, [%r8 + 0x008c] %asi
	.word 0x02800002  ! 270: BE	be  	<label_0x2>
	.word 0x965220cc  ! 271: UMUL_I	umul 	%r8, 0x00cc, %r11
	.word 0xb36a2d08  ! 272: SDIVX_I	sdivx	%r8, 0x0d08, %r25
	.word 0x8c5a0009  ! 273: SMUL_R	smul 	%r8, %r9, %r6
	.word 0xc8ca2a6c  ! 274: LDSBA_I	ldsba	[%r8, + 0x0a6c] %asi, %r4
	.word 0xbeda23c8  ! 275: SMULcc_I	smulcc 	%r8, 0x03c8, %r31
	.word 0xcc1a2058  ! 276: LDD_I	ldd	[%r8 + 0x0058], %r6
	.word 0x8143c000  ! 277: STBAR	stbar
	.word 0xcc1a2a20  ! 278: LDD_I	ldd	[%r8 + 0x0a20], %r6
	.word 0xf65a2e20  ! 279: LDX_I	ldx	[%r8 + 0x0e20], %r27
	.word 0xc36a20d0  ! 280: PREFETCH_I	prefetch	[%r8 + 0x00d0], #one_read
	.word 0xd6122d34  ! 281: LDUH_I	lduh	[%r8 + 0x0d34], %r11
	.word 0x8143c000  ! 282: STBAR	stbar
	.word 0x945a2ee0  ! 283: SMUL_I	smul 	%r8, 0x0ee0, %r10
	.word 0x8143e03e  ! 284: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0xc6f227e0  ! 285: STXA_I	stxa	%r3, [%r8 + 0x07e0] %asi
	.word 0xc87a0009  ! 286: SWAP_R	swap	%r4, [%r8 + %r9]
	.word 0x856a0009  ! 287: SDIVX_R	sdivx	%r8, %r9, %r2
	.word 0xcc1a2c18  ! 288: LDD_I	ldd	[%r8 + 0x0c18], %r6
	.word 0x88522054  ! 289: UMUL_I	umul 	%r8, 0x0054, %r4
	.word 0x00800001  ! 290: BN	bn  	<label_0x1>
	.word 0x86fa0009  ! 291: SDIVcc_R	sdivcc 	%r8, %r9, %r3
	.word 0x867a0009  ! 292: SDIV_R	sdiv 	%r8, %r9, %r3
	.word 0xc3ea2714  ! 293: PREFETCHA_I	prefetcha	[%r8, + 0x0714] %asi, #one_read
	.word 0xfeca1009  ! 295: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r31
	.word 0xfeea24e0  ! 296: LDSTUBA_I	ldstuba	%r31, [%r8 + 0x04e0] %asi
	.word 0x84fa0009  ! 297: SDIVcc_R	sdivcc 	%r8, %r9, %r2
	.word 0x2cca0001  ! 298: BRGZ	brgz,a,pt	%8,<label_0xa0001>
	.word 0xae520009  ! 299: UMUL_R	umul 	%r8, %r9, %r23
	.word 0xc8da1009  ! 301: LDXA_R	ldxa	[%r8, %r9] 0x80, %r4
	.word 0x865a2c68  ! 302: SMUL_I	smul 	%r8, 0x0c68, %r3
	.word 0x8143c000  ! 304: STBAR	stbar
	.word 0xa9222a48  ! 305: MULScc_I	mulscc 	%r8, 0x0a48, %r20
	.word 0xcc122664  ! 306: LDUH_I	lduh	[%r8 + 0x0664], %r6
	.word 0xfeaa1009  ! 307: STBA_R	stba	%r31, [%r8 + %r9] 0x80
	.word 0x16800002  ! 308: BGE	bge  	<label_0x2>
	.word 0x986a2664  ! 309: UDIVX_I	udivx 	%r8, 0x0664, %r12
	.word 0x8143e076  ! 310: MEMBAR	membar	#StoreLoad | #LoadStore | #Lookaside | #MemIssue | #Sync 
	.word 0x87a20829  ! 311: FADDs	fadds	%f8, %f9, %f3
	.word 0xd5f22009  ! 312: CASXA_R	casxa	[%r8]%asi, %r9, %r10
	.word 0xccca2b20  ! 313: LDSBA_I	ldsba	[%r8, + 0x0b20] %asi, %r6
	.word 0xcc0a0009  ! 314: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0x8fa20829  ! 315: FADDs	fadds	%f8, %f9, %f7
	.word 0x8a6a2e0c  ! 316: UDIVX_I	udivx 	%r8, 0x0e0c, %r5
	.word 0xf6420009  ! 317: LDSW_R	ldsw	[%r8 + %r9], %r27
	.word 0xacda204c  ! 318: SMULcc_I	smulcc 	%r8, 0x004c, %r22
	.word 0xc3ea235c  ! 319: PREFETCHA_I	prefetcha	[%r8, + 0x035c] %asi, #one_read
	.word 0x8c720009  ! 321: UDIV_R	udiv 	%r8, %r9, %r6
	.word 0xa24a2124  ! 323: MULX_I	mulx 	%r8, 0x0124, %r17
	.word 0x86fa0009  ! 324: SDIVcc_R	sdivcc 	%r8, %r9, %r3
	.word 0xd47a2b5c  ! 325: SWAP_I	swap	%r10, [%r8 + 0x0b5c]
	.word 0xe0ca2660  ! 326: LDSBA_I	ldsba	[%r8, + 0x0660] %asi, %r16
	.word 0x8143c000  ! 327: STBAR	stbar
	.word 0xc73a25e8  ! 329: STDF_I	std	%f3, [0x05e8, %r8]
	.word 0x08800001  ! 330: BLEU	bleu  	<label_0x1>
	.word 0xc2022520  ! 331: LDUW_I	lduw	[%r8 + 0x0520], %r1
	.word 0xde6a26a8  ! 332: LDSTUB_I	ldstub	%r15, [%r8 + 0x06a8]
	.word 0xf6a22830  ! 333: STWA_I	stwa	%r27, [%r8 + 0x0830] %asi
	.word 0xe2da2688  ! 334: LDXA_I	ldxa	[%r8, + 0x0688] %asi, %r17
	.word 0xced22a2c  ! 335: LDSHA_I	ldsha	[%r8, + 0x0a2c] %asi, %r7
	.word 0xdcaa2fd8  ! 336: STBA_I	stba	%r14, [%r8 + 0x0fd8] %asi
	.word 0x8a722700  ! 337: UDIV_I	udiv 	%r8, 0x0700, %r5
	.word 0xb2d20009  ! 338: UMULcc_R	umulcc 	%r8, %r9, %r25
	.word 0xc7f22009  ! 339: CASXA_R	casxa	[%r8]%asi, %r9, %r3
	.word 0xd5222c10  ! 340: STF_I	st	%f10, [0x0c10, %r8]
	.word 0x3e800001  ! 341: BVC	bvc,a	<label_0x1>
	.word 0x88d2219c  ! 342: UMULcc_I	umulcc 	%r8, 0x019c, %r4
	.word 0x8ad2202c  ! 343: UMULcc_I	umulcc 	%r8, 0x002c, %r5
	.word 0xc24a0009  ! 344: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0x00800001  ! 345: BN	bn  	<label_0x1>
	.word 0xbe5a0009  ! 346: SMUL_R	smul 	%r8, %r9, %r31
	.word 0x0cc20001  ! 347: BRGZ	brgz  ,nt	%8,<label_0x20001>
	.word 0x8143c000  ! 348: STBAR	stbar
	.word 0x87a208a9  ! 349: FSUBs	fsubs	%f8, %f9, %f3
	.word 0x847a2d64  ! 350: SDIV_I	sdiv 	%r8, 0x0d64, %r2
	.word 0xc47a242c  ! 351: SWAP_I	swap	%r2, [%r8 + 0x042c]
	.word 0xc4c21009  ! 352: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r2
	.word 0xceb22888  ! 353: STHA_I	stha	%r7, [%r8 + 0x0888] %asi
	.word 0x825a0009  ! 354: SMUL_R	smul 	%r8, %r9, %r1
	.word 0x84fa0009  ! 355: SDIVcc_R	sdivcc 	%r8, %r9, %r2
	.word 0xbda208a9  ! 356: FSUBs	fsubs	%f8, %f9, %f30
	.word 0x8e7a2360  ! 357: SDIV_I	sdiv 	%r8, 0x0360, %r7
	.word 0xc36a2c68  ! 358: PREFETCH_I	prefetch	[%r8 + 0x0c68], #one_read
	.word 0xc25a0009  ! 359: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0x83a20929  ! 360: FMULs	fmuls	%f8, %f9, %f1
	.word 0xed3a26f8  ! 361: STDF_I	std	%f22, [0x06f8, %r8]
	.word 0xc6aa25a0  ! 362: STBA_I	stba	%r3, [%r8 + 0x05a0] %asi
	.word 0x8c4a2130  ! 364: MULX_I	mulx 	%r8, 0x0130, %r6
	.word 0xc6122aa0  ! 365: LDUH_I	lduh	[%r8 + 0x0aa0], %r3
	.word 0x887a239c  ! 366: SDIV_I	sdiv 	%r8, 0x039c, %r4
	.word 0x8f2227c4  ! 367: MULScc_I	mulscc 	%r8, 0x07c4, %r7
	.word 0xd4022784  ! 368: LDUW_I	lduw	[%r8 + 0x0784], %r10
	.word 0x8143e022  ! 369: MEMBAR	membar	#StoreLoad | #MemIssue 
	.word 0xc3220009  ! 370: STF_R	st	%f1, [%r9, %r8]
	.word 0xc36a2158  ! 371: PREFETCH_I	prefetch	[%r8 + 0x0158], #one_read
	.word 0xd47a2a84  ! 372: SWAP_I	swap	%r10, [%r8 + 0x0a84]
	.word 0xc6a22180  ! 373: STWA_I	stwa	%r3, [%r8 + 0x0180] %asi
	.word 0xdcc21009  ! 374: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r14
	.word 0x8143c000  ! 375: STBAR	stbar
	.word 0x8c5a20c0  ! 376: SMUL_I	smul 	%r8, 0x00c0, %r6
	.word 0xc6aa1009  ! 377: STBA_R	stba	%r3, [%r8 + %r9] 0x80
	.word 0x18800001  ! 378: BGU	bgu  	<label_0x1>
	.word 0x8143e06a  ! 379: MEMBAR	membar	#StoreLoad | #StoreStore | #MemIssue | #Sync 
	.word 0xcea21009  ! 380: STWA_R	stwa	%r7, [%r8 + %r9] 0x80
	.word 0x826a0009  ! 381: UDIVX_R	udivx 	%r8, %r9, %r1
	.word 0x2c800001  ! 382: BNEG	bneg,a	<label_0x1>
	.word 0xc4a21009  ! 383: STWA_R	stwa	%r2, [%r8 + %r9] 0x80
	.word 0x8143e071  ! 384: MEMBAR	membar	#LoadLoad | #Lookaside | #MemIssue | #Sync 
	.word 0x94f20009  ! 385: UDIVcc_R	udivcc 	%r8, %r9, %r10
	.word 0xc7e21009  ! 386: CASA_I	casa	[%r8] 0x80, %r9, %r3
	.word 0x96d20009  ! 387: UMULcc_R	umulcc 	%r8, %r9, %r11
	.word 0xc36a29c4  ! 388: PREFETCH_I	prefetch	[%r8 + 0x09c4], #one_read
	.word 0xc8821009  ! 389: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r4
	.word 0xc6ca1009  ! 391: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r3
	.word 0x8143c000  ! 392: STBAR	stbar
	.word 0xf87a0009  ! 394: SWAP_R	swap	%r28, [%r8 + %r9]
	.word 0x8143c000  ! 395: STBAR	stbar
	.word 0x8c7a0009  ! 396: SDIV_R	sdiv 	%r8, %r9, %r6
	.word 0xca0a0009  ! 397: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0x9a4a0009  ! 398: MULX_R	mulx 	%r8, %r9, %r13
	.word 0x2a800001  ! 399: BCS	bcs,a	<label_0x1>
	.word 0xc6822a30  ! 400: LDUWA_I	lduwa	[%r8, + 0x0a30] %asi, %r3
	.word 0x0e800002  ! 401: BVS	bvs  	<label_0x2>
	.word 0xb0d22a74  ! 402: UMULcc_I	umulcc 	%r8, 0x0a74, %r24
	.word 0xc73a0009  ! 403: STDF_R	std	%f3, [%r9, %r8]
	.word 0x865a22c4  ! 404: SMUL_I	smul 	%r8, 0x02c4, %r3
	.word 0x2cca0001  ! 405: BRGZ	brgz,a,pt	%8,<label_0xa0001>
	.word 0x3a800002  ! 406: BCC	bcc,a	<label_0x2>
	.word 0xdc9a24c0  ! 407: LDDA_I	ldda	[%r8, + 0x04c0] %asi, %r14
	.word 0x8143c000  ! 408: STBAR	stbar
	.word 0xcada2e80  ! 409: LDXA_I	ldxa	[%r8, + 0x0e80] %asi, %r5
	.word 0xdb3a0009  ! 410: STDF_R	std	%f13, [%r9, %r8]
	.word 0xc85a0009  ! 411: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0x8143e031  ! 412: MEMBAR	membar	#LoadLoad | #Lookaside | #MemIssue 
	.word 0xc4f21009  ! 413: STXA_R	stxa	%r2, [%r8 + %r9] 0x80
	.word 0xa84a2670  ! 414: MULX_I	mulx 	%r8, 0x0670, %r20
	.word 0xc6d21009  ! 415: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r3
	.word 0xd7f22009  ! 416: CASXA_R	casxa	[%r8]%asi, %r9, %r11
	.word 0x8a4a2ac4  ! 417: MULX_I	mulx 	%r8, 0x0ac4, %r5
	.word 0x8143c000  ! 418: STBAR	stbar
	.word 0xceda2480  ! 419: LDXA_I	ldxa	[%r8, + 0x0480] %asi, %r7
	.word 0x87a20829  ! 420: FADDs	fadds	%f8, %f9, %f3
	.word 0xc9220009  ! 421: STF_R	st	%f4, [%r9, %r8]
	.word 0x0cca0001  ! 422: BRGZ	brgz  ,pt	%8,<label_0xa0001>
	.word 0x8143e03f  ! 423: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0xc2ea2940  ! 424: LDSTUBA_I	ldstuba	%r1, [%r8 + 0x0940] %asi
	.word 0x0ec20001  ! 425: BRGEZ	brgez  ,nt	%8,<label_0x20001>
	.word 0xe2ca242c  ! 426: LDSBA_I	ldsba	[%r8, + 0x042c] %asi, %r17
	.word 0xca6a2600  ! 427: LDSTUB_I	ldstub	%r5, [%r8 + 0x0600]
	.word 0xcb220009  ! 428: STF_R	st	%f5, [%r9, %r8]
	.word 0xcb3a2030  ! 429: STDF_I	std	%f5, [0x0030, %r8]
	.word 0x8143e007  ! 430: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore 
	.word 0x8ef20009  ! 431: UDIVcc_R	udivcc 	%r8, %r9, %r7
	.word 0xa25a0009  ! 432: SMUL_R	smul 	%r8, %r9, %r17
	.word 0xce020009  ! 433: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xc6f22270  ! 434: STXA_I	stxa	%r3, [%r8 + 0x0270] %asi
	.word 0xecaa2cac  ! 435: STBA_I	stba	%r22, [%r8 + 0x0cac] %asi
	.word 0xf73a2f18  ! 436: STDF_I	std	%f27, [0x0f18, %r8]
	.word 0xc3ea24bc  ! 437: PREFETCHA_I	prefetcha	[%r8, + 0x04bc] %asi, #one_read
	.word 0x8143e058  ! 438: MEMBAR	membar	#StoreStore | #Lookaside | #Sync 
	.word 0xb5a209a9  ! 439: FDIVs	fdivs	%f8, %f9, %f26
	.word 0x8143e055  ! 440: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside | #Sync 
	.word 0xada208a9  ! 441: FSUBs	fsubs	%f8, %f9, %f22
	.word 0x82720009  ! 442: UDIV_R	udiv 	%r8, %r9, %r1
	.word 0xc8ca2890  ! 443: LDSBA_I	ldsba	[%r8, + 0x0890] %asi, %r4
	.word 0xcb3a0009  ! 444: STDF_R	std	%f5, [%r9, %r8]
	.word 0x88f22854  ! 445: UDIVcc_I	udivcc 	%r8, 0x0854, %r4
	.word 0xcefa1009  ! 446: SWAPA_R	swapa	%r7, [%r8 + %r9] 0x80
	.word 0x846a0009  ! 447: UDIVX_R	udivx 	%r8, %r9, %r2
	.word 0xd6120009  ! 448: LDUH_R	lduh	[%r8 + %r9], %r11
	.word 0xcf3a2400  ! 449: STDF_I	std	%f7, [0x0400, %r8]
	.word 0xc2f222f0  ! 450: STXA_I	stxa	%r1, [%r8 + 0x02f0] %asi
	.word 0xe8c21009  ! 451: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r20
	.word 0xc8ca1009  ! 452: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r4
	.word 0x3c800001  ! 453: BPOS	bpos,a	<label_0x1>
	.word 0x8143e05d  ! 454: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0xf4921009  ! 455: LDUHA_R	lduha	[%r8, %r9] 0x80, %r26
	.word 0xc3ea2958  ! 456: PREFETCHA_I	prefetcha	[%r8, + 0x0958] %asi, #one_read
	.word 0xc6fa2058  ! 457: SWAPA_I	swapa	%r3, [%r8 + 0x0058] %asi
	.word 0xa1a208a9  ! 458: FSUBs	fsubs	%f8, %f9, %f16
	.word 0x8143e07e  ! 459: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0x1a800001  ! 462: BCC	bcc  	<label_0x1>
	.word 0xcaaa2a80  ! 463: STBA_I	stba	%r5, [%r8 + 0x0a80] %asi
	.word 0x20800001  ! 464: BN	bn,a	<label_0x1>
	.word 0x96f223a8  ! 465: UDIVcc_I	udivcc 	%r8, 0x03a8, %r11
	.word 0xcef21009  ! 466: STXA_R	stxa	%r7, [%r8 + %r9] 0x80
	.word 0xecba2180  ! 467: STDA_I	stda	%r22, [%r8 + 0x0180] %asi
	.word 0xe0ba21a0  ! 468: STDA_I	stda	%r16, [%r8 + 0x01a0] %asi
	.word 0x2ac20001  ! 469: BRNZ	brnz,a,nt	%8,<label_0x20001>
	.word 0xc28a1009  ! 470: LDUBA_R	lduba	[%r8, %r9] 0x80, %r1
	.word 0xca4a0009  ! 471: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0x0cca0001  ! 472: BRGZ	brgz  ,pt	%8,<label_0xa0001>
	.word 0xccd2277c  ! 473: LDSHA_I	ldsha	[%r8, + 0x077c] %asi, %r6
	.word 0xd4aa2b08  ! 474: STBA_I	stba	%r10, [%r8 + 0x0b08] %asi
	.word 0xc2ea1009  ! 475: LDSTUBA_R	ldstuba	%r1, [%r8 + %r9] 0x80
	.word 0x8143e02c  ! 476: MEMBAR	membar	#LoadStore | #StoreStore | #MemIssue 
	.word 0xc7e22009  ! 477: CASA_R	casa	[%r8] %asi, %r9, %r3
	.word 0xc36a2dc8  ! 478: PREFETCH_I	prefetch	[%r8 + 0x0dc8], #one_read
	.word 0xf6a21009  ! 479: STWA_R	stwa	%r27, [%r8 + %r9] 0x80
	.word 0x8c5a0009  ! 480: SMUL_R	smul 	%r8, %r9, %r6
	.word 0xc73a2cd0  ! 481: STDF_I	std	%f3, [0x0cd0, %r8]
	.word 0x8143e037  ! 482: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside | #MemIssue 
	.word 0xc49a1009  ! 483: LDDA_R	ldda	[%r8, %r9] 0x80, %r2
	.word 0xc66a0009  ! 485: LDSTUB_R	ldstub	%r3, [%r8 + %r9]
	.word 0x0aca0001  ! 486: BRNZ	brnz  ,pt	%8,<label_0xa0001>
	.word 0x8143c000  ! 487: STBAR	stbar
	.word 0xc41a2530  ! 488: LDD_I	ldd	[%r8 + 0x0530], %r2
	.word 0x836a28d4  ! 489: SDIVX_I	sdivx	%r8, 0x08d4, %r1
	.word 0xcb220009  ! 490: STF_R	st	%f5, [%r9, %r8]
	.word 0x98f22458  ! 491: UDIVcc_I	udivcc 	%r8, 0x0458, %r12
	.word 0xf2a22868  ! 492: STWA_I	stwa	%r25, [%r8 + 0x0868] %asi
	.word 0xe4fa1009  ! 493: SWAPA_R	swapa	%r18, [%r8 + %r9] 0x80
	.word 0xc36a2d00  ! 494: PREFETCH_I	prefetch	[%r8 + 0x0d00], #one_read
	.word 0xb5a20829  ! 495: FADDs	fadds	%f8, %f9, %f26
	.word 0xcc7a0009  ! 496: SWAP_R	swap	%r6, [%r8 + %r9]
	.word 0x8143c000  ! 497: STBAR	stbar
	.word 0x8a4a0009  ! 498: MULX_R	mulx 	%r8, %r9, %r5
	.word 0xc6ea2f48  ! 499: LDSTUBA_I	ldstuba	%r3, [%r8 + 0x0f48] %asi
	.word 0xc4c229f0  ! 501: LDSWA_I	ldswa	[%r8, + 0x09f0] %asi, %r2
	.word 0xe2122204  ! 502: LDUH_I	lduh	[%r8 + 0x0204], %r17
	.word 0x1e800001  ! 504: BVC	bvc  	<label_0x1>
	.word 0xca5a0009  ! 505: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xe1220009  ! 506: STF_R	st	%f16, [%r9, %r8]
	.word 0x8143e049  ! 507: MEMBAR	membar	#LoadLoad | #StoreStore | #Sync 
	.word 0xe8ea1009  ! 508: LDSTUBA_R	ldstuba	%r20, [%r8 + %r9] 0x80
	.word 0xaa7a24d4  ! 509: SDIV_I	sdiv 	%r8, 0x04d4, %r21
	.word 0xc86a2d28  ! 510: LDSTUB_I	ldstub	%r4, [%r8 + 0x0d28]
	.word 0xeeb21009  ! 511: STHA_R	stha	%r23, [%r8 + %r9] 0x80
	.word 0xd6b22428  ! 512: STHA_I	stha	%r11, [%r8 + 0x0428] %asi
	.word 0xc47a0009  ! 513: SWAP_R	swap	%r2, [%r8 + %r9]
	.word 0xde020009  ! 514: LDUW_R	lduw	[%r8 + %r9], %r15
	.word 0x976a0009  ! 515: SDIVX_R	sdivx	%r8, %r9, %r11
	.word 0x825a0009  ! 516: SMUL_R	smul 	%r8, %r9, %r1
	.word 0x8143c000  ! 517: STBAR	stbar
	.word 0x8c5a0009  ! 518: SMUL_R	smul 	%r8, %r9, %r6
	.word 0xc3e21009  ! 519: CASA_I	casa	[%r8] 0x80, %r9, %r1
	.word 0xc36a26f4  ! 520: PREFETCH_I	prefetch	[%r8 + 0x06f4], #one_read
	.word 0x8e5a0009  ! 521: SMUL_R	smul 	%r8, %r9, %r7
	.word 0x8143c000  ! 522: STBAR	stbar
	.word 0xe24a2d48  ! 523: LDSB_I	ldsb	[%r8 + 0x0d48], %r17
	.word 0xcf222554  ! 524: STF_I	st	%f7, [0x0554, %r8]
	.word 0x826a0009  ! 525: UDIVX_R	udivx 	%r8, %r9, %r1
	.word 0xf53a0009  ! 526: STDF_R	std	%f26, [%r9, %r8]
	.word 0x10800002  ! 527: BA	ba  	<label_0x2>
	.word 0x8143c000  ! 528: STBAR	stbar
	.word 0xe09a2ab0  ! 530: LDDA_I	ldda	[%r8, + 0x0ab0] %asi, %r16
	.word 0xdc4a2884  ! 531: LDSB_I	ldsb	[%r8 + 0x0884], %r14
	.word 0x8fa20829  ! 532: FADDs	fadds	%f8, %f9, %f7
	.word 0xc3ea2bfc  ! 533: PREFETCHA_I	prefetcha	[%r8, + 0x0bfc] %asi, #one_read
	.word 0xc5e21009  ! 534: CASA_I	casa	[%r8] 0x80, %r9, %r2
	.word 0x8143c000  ! 535: STBAR	stbar
	.word 0x14800002  ! 536: BG	bg  	<label_0x2>
	.word 0xcc5a26f8  ! 537: LDX_I	ldx	[%r8 + 0x06f8], %r6
	.word 0xc8fa254c  ! 538: SWAPA_I	swapa	%r4, [%r8 + 0x054c] %asi
	.word 0x8e7a2d90  ! 539: SDIV_I	sdiv 	%r8, 0x0d90, %r7
	.word 0x95a20929  ! 540: FMULs	fmuls	%f8, %f9, %f10
	.word 0xc6ea1009  ! 541: LDSTUBA_R	ldstuba	%r3, [%r8 + %r9] 0x80
	.word 0x82da29b4  ! 542: SMULcc_I	smulcc 	%r8, 0x09b4, %r1
	.word 0xccea1009  ! 543: LDSTUBA_R	ldstuba	%r6, [%r8 + %r9] 0x80
	.word 0xd8822c10  ! 544: LDUWA_I	lduwa	[%r8, + 0x0c10] %asi, %r12
	.word 0x8143c000  ! 545: STBAR	stbar
	.word 0x40000002  ! 546: CALL	call	disp30_2
	.word 0xd8821009  ! 547: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r12
	.word 0x2a800001  ! 548: BCS	bcs,a	<label_0x1>
	.word 0xc33a0009  ! 549: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc2821009  ! 550: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r1
	.word 0xb05a0009  ! 551: SMUL_R	smul 	%r8, %r9, %r24
	.word 0xdcba1009  ! 552: STDA_R	stda	%r14, [%r8 + %r9] 0x80
	.word 0x8143e07a  ! 553: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0x886a0009  ! 554: UDIVX_R	udivx 	%r8, %r9, %r4
	.word 0xc41a2418  ! 555: LDD_I	ldd	[%r8 + 0x0418], %r2
	.word 0xb4522434  ! 556: UMUL_I	umul 	%r8, 0x0434, %r26
	.word 0x2a800002  ! 557: BCS	bcs,a	<label_0x2>
	.word 0xc36a206c  ! 558: PREFETCH_I	prefetch	[%r8 + 0x006c], #one_read
	.word 0x896a0009  ! 559: SDIVX_R	sdivx	%r8, %r9, %r4
	.word 0xc3222af4  ! 560: STF_I	st	%f1, [0x0af4, %r8]
	.word 0xc802233c  ! 562: LDUW_I	lduw	[%r8 + 0x033c], %r4
	.word 0x8e7229a4  ! 563: UDIV_I	udiv 	%r8, 0x09a4, %r7
	.word 0x8ba209a9  ! 564: FDIVs	fdivs	%f8, %f9, %f5
	.word 0xccba2df8  ! 565: STDA_I	stda	%r6, [%r8 + 0x0df8] %asi
	.word 0xdff21009  ! 566: CASXA_I	casxa	[%r8] 0x80, %r9, %r15
	.word 0xc46a0009  ! 567: LDSTUB_R	ldstub	%r2, [%r8 + %r9]
	.word 0xca7a20cc  ! 568: SWAP_I	swap	%r5, [%r8 + 0x00cc]
	.word 0x8ed22eac  ! 569: UMULcc_I	umulcc 	%r8, 0x0eac, %r7
	.word 0xfe422cf4  ! 570: LDSW_I	ldsw	[%r8 + 0x0cf4], %r31
	.word 0xb87a0009  ! 571: SDIV_R	sdiv 	%r8, %r9, %r28
	.word 0x22800001  ! 572: BE	be,a	<label_0x1>
	.word 0x8f6a0009  ! 573: SDIVX_R	sdivx	%r8, %r9, %r7
	.word 0xc36a259c  ! 574: PREFETCH_I	prefetch	[%r8 + 0x059c], #one_read
	.word 0x02c20001  ! 575: BRZ	brz  ,nt	%8,<label_0x20001>
	.word 0xec9a1009  ! 577: LDDA_R	ldda	[%r8, %r9] 0x80, %r22
	.word 0xcec21009  ! 578: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r7
	.word 0xcbe22009  ! 579: CASA_R	casa	[%r8] %asi, %r9, %r5
	.word 0xfcba2c28  ! 580: STDA_I	stda	%r30, [%r8 + 0x0c28] %asi
	.word 0xdf3a0009  ! 581: STDF_R	std	%f15, [%r9, %r8]
	.word 0xb3a209a9  ! 582: FDIVs	fdivs	%f8, %f9, %f25
	.word 0xf8522d88  ! 583: LDSH_I	ldsh	[%r8 + 0x0d88], %r28
	.word 0xfaf21009  ! 584: STXA_R	stxa	%r29, [%r8 + %r9] 0x80
	.word 0x02ca0001  ! 585: BRZ	brz  ,pt	%8,<label_0xa0001>
	.word 0xc27a0009  ! 586: SWAP_R	swap	%r1, [%r8 + %r9]
	.word 0xa5220009  ! 587: MULScc_R	mulscc 	%r8, %r9, %r18
	.word 0x8c4a0009  ! 588: MULX_R	mulx 	%r8, %r9, %r6
	.word 0x02c20001  ! 589: BRZ	brz  ,nt	%8,<label_0x20001>
	.word 0x8c722438  ! 590: UDIV_I	udiv 	%r8, 0x0438, %r6
	.word 0x84522544  ! 591: UMUL_I	umul 	%r8, 0x0544, %r2
	.word 0x8f6a0009  ! 592: SDIVX_R	sdivx	%r8, %r9, %r7
	.word 0xc36a2fdc  ! 593: PREFETCH_I	prefetch	[%r8 + 0x0fdc], #one_read
	.word 0xc24a0009  ! 594: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0x8e520009  ! 595: UMUL_R	umul 	%r8, %r9, %r7
	.word 0xf81a27b0  ! 596: LDD_I	ldd	[%r8 + 0x07b0], %r28
	.word 0xe4ba22c0  ! 597: STDA_I	stda	%r18, [%r8 + 0x02c0] %asi
	.word 0x20800002  ! 598: BN	bn,a	<label_0x2>
	.word 0x24800001  ! 599: BLE	ble,a	<label_0x1>
	.word 0xccaa2c98  ! 600: STBA_I	stba	%r6, [%r8 + 0x0c98] %asi
	.word 0x9a5222b8  ! 601: UMUL_I	umul 	%r8, 0x02b8, %r13
	.word 0xcff21009  ! 602: CASXA_I	casxa	[%r8] 0x80, %r9, %r7
	.word 0xcaea1009  ! 605: LDSTUBA_R	ldstuba	%r5, [%r8 + %r9] 0x80
	.word 0xc33a23c0  ! 606: STDF_I	std	%f1, [0x03c0, %r8]
	.word 0x82da28a8  ! 607: SMULcc_I	smulcc 	%r8, 0x08a8, %r1
	.word 0xdab22340  ! 608: STHA_I	stha	%r13, [%r8 + 0x0340] %asi
	.word 0xc33a2f30  ! 609: STDF_I	std	%f1, [0x0f30, %r8]
	.word 0x86520009  ! 610: UMUL_R	umul 	%r8, %r9, %r3
	.word 0xc66a0009  ! 611: LDSTUB_R	ldstub	%r3, [%r8 + %r9]
	.word 0xce6a0009  ! 612: LDSTUB_R	ldstub	%r7, [%r8 + %r9]
	.word 0x966a2c9c  ! 613: UDIVX_I	udivx 	%r8, 0x0c9c, %r11
	.word 0xcaf22ed8  ! 614: STXA_I	stxa	%r5, [%r8 + 0x0ed8] %asi
	.word 0xc36a23dc  ! 615: PREFETCH_I	prefetch	[%r8 + 0x03dc], #one_read
	.word 0xca4a0009  ! 616: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0x08800001  ! 618: BLEU	bleu  	<label_0x1>
	.word 0xca5a27c8  ! 619: LDX_I	ldx	[%r8 + 0x07c8], %r5
	.word 0x2ac20001  ! 620: BRNZ	brnz,a,nt	%8,<label_0x20001>
	.word 0x8c6a229c  ! 621: UDIVX_I	udivx 	%r8, 0x029c, %r6
	.word 0xc2a2227c  ! 622: STWA_I	stwa	%r1, [%r8 + 0x027c] %asi
	.word 0x8da209a9  ! 623: FDIVs	fdivs	%f8, %f9, %f6
	.word 0xc45a2ab8  ! 624: LDX_I	ldx	[%r8 + 0x0ab8], %r2
	.word 0xe88a27c8  ! 625: LDUBA_I	lduba	[%r8, + 0x07c8] %asi, %r20
	.word 0xc87a0009  ! 627: SWAP_R	swap	%r4, [%r8 + %r9]
	.word 0x8fa20929  ! 628: FMULs	fmuls	%f8, %f9, %f7
	.word 0xb5a20829  ! 629: FADDs	fadds	%f8, %f9, %f26
	.word 0x88d20009  ! 630: UMULcc_R	umulcc 	%r8, %r9, %r4
	.word 0xcff22009  ! 631: CASXA_R	casxa	[%r8]%asi, %r9, %r7
	.word 0xe6f22130  ! 632: STXA_I	stxa	%r19, [%r8 + 0x0130] %asi
	.word 0x84522ad0  ! 633: UMUL_I	umul 	%r8, 0x0ad0, %r2
	.word 0x8143e071  ! 634: MEMBAR	membar	#LoadLoad | #Lookaside | #MemIssue | #Sync 
	.word 0xce821009  ! 635: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r7
	.word 0xcff22009  ! 636: CASXA_R	casxa	[%r8]%asi, %r9, %r7
	.word 0xce020009  ! 637: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xd48a20e0  ! 638: LDUBA_I	lduba	[%r8, + 0x00e0] %asi, %r10
	.word 0xf8a22508  ! 639: STWA_I	stwa	%r28, [%r8 + 0x0508] %asi
	.word 0xcfe22009  ! 640: CASA_R	casa	[%r8] %asi, %r9, %r7
	.word 0xc3ea2e38  ! 641: PREFETCHA_I	prefetcha	[%r8, + 0x0e38] %asi, #one_read
	.word 0x85a209a9  ! 642: FDIVs	fdivs	%f8, %f9, %f2
	.word 0xce1221cc  ! 643: LDUH_I	lduh	[%r8 + 0x01cc], %r7
	.word 0xfef22bf8  ! 644: STXA_I	stxa	%r31, [%r8 + 0x0bf8] %asi
	.word 0x8143c000  ! 645: STBAR	stbar
	.word 0xa6522160  ! 646: UMUL_I	umul 	%r8, 0x0160, %r19
	.word 0x8143c000  ! 647: STBAR	stbar
	.word 0xea821009  ! 648: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r21
	.word 0xac4a29d4  ! 649: MULX_I	mulx 	%r8, 0x09d4, %r22
	.word 0xab220009  ! 650: MULScc_R	mulscc 	%r8, %r9, %r21
	.word 0x8e6a0009  ! 651: UDIVX_R	udivx 	%r8, %r9, %r7
	.word 0xcc921009  ! 652: LDUHA_R	lduha	[%r8, %r9] 0x80, %r6
	.word 0xc73a0009  ! 653: STDF_R	std	%f3, [%r9, %r8]
	.word 0x26c20001  ! 654: BRLZ	brlz,a,nt	%8,<label_0x20001>
	.word 0x8e522544  ! 655: UMUL_I	umul 	%r8, 0x0544, %r7
	.word 0x8e4a0009  ! 656: MULX_R	mulx 	%r8, %r9, %r7
	.word 0x36800001  ! 657: BGE	bge,a	<label_0x1>
	.word 0xe6da26b8  ! 658: LDXA_I	ldxa	[%r8, + 0x06b8] %asi, %r19
	.word 0xc3ea24b8  ! 659: PREFETCHA_I	prefetcha	[%r8, + 0x04b8] %asi, #one_read
	.word 0xc8ba1009  ! 660: STDA_R	stda	%r4, [%r8 + %r9] 0x80
	.word 0x96d20009  ! 661: UMULcc_R	umulcc 	%r8, %r9, %r11
	.word 0xc4ca2a64  ! 662: LDSBA_I	ldsba	[%r8, + 0x0a64] %asi, %r2
	.word 0xc242270c  ! 663: LDSW_I	ldsw	[%r8 + 0x070c], %r1
	.word 0xc7222c74  ! 664: STF_I	st	%f3, [0x0c74, %r8]
	.word 0xb84a0009  ! 666: MULX_R	mulx 	%r8, %r9, %r28
	.word 0x89a20829  ! 667: FADDs	fadds	%f8, %f9, %f4
	.word 0x8143e03f  ! 668: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0xc2821009  ! 669: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r1
	.word 0x24ca0001  ! 670: BRLEZ	brlez,a,pt	%8,<label_0xa0001>
	.word 0xcd220009  ! 671: STF_R	st	%f6, [%r9, %r8]
	.word 0x83220009  ! 672: MULScc_R	mulscc 	%r8, %r9, %r1
	.word 0x82f227fc  ! 673: UDIVcc_I	udivcc 	%r8, 0x07fc, %r1
	.word 0xc36a28dc  ! 674: PREFETCH_I	prefetch	[%r8 + 0x08dc], #one_read
	.word 0xc8ba1009  ! 675: STDA_R	stda	%r4, [%r8 + %r9] 0x80
	.word 0xc4120009  ! 676: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0x8143e024  ! 677: MEMBAR	membar	#LoadStore | #MemIssue 
	.word 0x8143c000  ! 678: STBAR	stbar
	.word 0xd4aa1009  ! 679: STBA_R	stba	%r10, [%r8 + %r9] 0x80
	.word 0xc4ea1009  ! 680: LDSTUBA_R	ldstuba	%r2, [%r8 + %r9] 0x80
	.word 0xc49a1009  ! 681: LDDA_R	ldda	[%r8, %r9] 0x80, %r2
	.word 0xdeea1009  ! 682: LDSTUBA_R	ldstuba	%r15, [%r8 + %r9] 0x80
	.word 0x82522ec0  ! 683: UMUL_I	umul 	%r8, 0x0ec0, %r1
	.word 0x885a0009  ! 684: SMUL_R	smul 	%r8, %r9, %r4
	.word 0x8143e07c  ! 686: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xc3ea2b64  ! 687: PREFETCHA_I	prefetcha	[%r8, + 0x0b64] %asi, #one_read
	.word 0xca6a0009  ! 688: LDSTUB_R	ldstub	%r5, [%r8 + %r9]
	.word 0x826a0009  ! 689: UDIVX_R	udivx 	%r8, %r9, %r1
	.word 0x28800002  ! 690: BLEU	bleu,a	<label_0x2>
	.word 0x2eca0001  ! 691: BRGEZ	brgez,a,pt	%8,<label_0xa0001>
	.word 0x9b220009  ! 693: MULScc_R	mulscc 	%r8, %r9, %r13
	.word 0xc6ca1009  ! 694: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r3
	.word 0x06800002  ! 695: BL	bl  	<label_0x2>
	.word 0xfe422044  ! 696: LDSW_I	ldsw	[%r8 + 0x0044], %r31
	.word 0xce020009  ! 697: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xc46a2708  ! 698: LDSTUB_I	ldstub	%r2, [%r8 + 0x0708]
	.word 0xcec21009  ! 699: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r7
	.word 0x8143c000  ! 700: STBAR	stbar
	.word 0x885a2070  ! 701: SMUL_I	smul 	%r8, 0x0070, %r4
	.word 0x10800001  ! 702: BA	ba  	<label_0x1>
	.word 0xfb3a0009  ! 703: STDF_R	std	%f29, [%r9, %r8]
	.word 0xc25a2e48  ! 704: LDX_I	ldx	[%r8 + 0x0e48], %r1
	.word 0xd6f21009  ! 705: STXA_R	stxa	%r11, [%r8 + %r9] 0x80
	.word 0x8143e039  ! 706: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside | #MemIssue 
	.word 0xe0da22e8  ! 707: LDXA_I	ldxa	[%r8, + 0x02e8] %asi, %r16
	.word 0xf1222d90  ! 708: STF_I	st	%f24, [0x0d90, %r8]
	.word 0xd85a0009  ! 709: LDX_R	ldx	[%r8 + %r9], %r12
	.word 0xc3ea2514  ! 710: PREFETCHA_I	prefetcha	[%r8, + 0x0514] %asi, #one_read
	.word 0xc6d21009  ! 711: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r3
	.word 0x826a2d84  ! 712: UDIVX_I	udivx 	%r8, 0x0d84, %r1
	.word 0x9b222108  ! 713: MULScc_I	mulscc 	%r8, 0x0108, %r13
	.word 0x887a2c48  ! 714: SDIV_I	sdiv 	%r8, 0x0c48, %r4
	.word 0xd65a2500  ! 715: LDX_I	ldx	[%r8 + 0x0500], %r11
	.word 0x8143e04e  ! 716: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Sync 
	.word 0xccb22840  ! 717: STHA_I	stha	%r6, [%r8 + 0x0840] %asi
	.word 0x865229c4  ! 718: UMUL_I	umul 	%r8, 0x09c4, %r3
	.word 0xc87a24c8  ! 719: SWAP_I	swap	%r4, [%r8 + 0x04c8]
	.word 0x8143e028  ! 720: MEMBAR	membar	#StoreStore | #MemIssue 
	.word 0x1a800001  ! 721: BCC	bcc  	<label_0x1>
	.word 0x8a4a272c  ! 722: MULX_I	mulx 	%r8, 0x072c, %r5
	.word 0xcf220009  ! 723: STF_R	st	%f7, [%r9, %r8]
	.word 0x8143c000  ! 724: STBAR	stbar
	.word 0x8143e049  ! 725: MEMBAR	membar	#LoadLoad | #StoreStore | #Sync 
	.word 0xc4122b5c  ! 726: LDUH_I	lduh	[%r8 + 0x0b5c], %r2
	.word 0xcff22009  ! 727: CASXA_R	casxa	[%r8]%asi, %r9, %r7
	.word 0xe01a0009  ! 728: LDD_R	ldd	[%r8 + %r9], %r16
	.word 0xe89a2410  ! 729: LDDA_I	ldda	[%r8, + 0x0410] %asi, %r20
	.word 0x8143e056  ! 730: MEMBAR	membar	#StoreLoad | #LoadStore | #Lookaside | #Sync 
	.word 0xab6a0009  ! 731: SDIVX_R	sdivx	%r8, %r9, %r21
	.word 0xbfa208a9  ! 732: FSUBs	fsubs	%f8, %f9, %f31
	.word 0xc4020009  ! 733: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xc6aa2768  ! 734: STBA_I	stba	%r3, [%r8 + 0x0768] %asi
	.word 0xd80a250c  ! 735: LDUB_I	ldub	[%r8 + 0x050c], %r12
	.word 0x88522e00  ! 736: UMUL_I	umul 	%r8, 0x0e00, %r4
	.word 0x8143c000  ! 737: STBAR	stbar
	.word 0xf4aa1009  ! 738: STBA_R	stba	%r26, [%r8 + %r9] 0x80
	.word 0xfcaa23f0  ! 739: STBA_I	stba	%r30, [%r8 + 0x03f0] %asi
	.word 0x8c5226ec  ! 740: UMUL_I	umul 	%r8, 0x06ec, %r6
	.word 0xaeda0009  ! 741: SMULcc_R	smulcc 	%r8, %r9, %r23
	.word 0xc36a2808  ! 742: PREFETCH_I	prefetch	[%r8 + 0x0808], #one_read
	.word 0x18800001  ! 743: BGU	bgu  	<label_0x1>
	.word 0x8143e059  ! 744: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside | #Sync 
	.word 0xe81a2040  ! 745: LDD_I	ldd	[%r8 + 0x0040], %r20
	.word 0xec120009  ! 746: LDUH_R	lduh	[%r8 + %r9], %r22
	.word 0xf2ea2e04  ! 747: LDSTUBA_I	ldstuba	%r25, [%r8 + 0x0e04] %asi
	.word 0xca0a0009  ! 748: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0x8143c000  ! 749: STBAR	stbar
	.word 0x856a22cc  ! 750: SDIVX_I	sdivx	%r8, 0x02cc, %r2
	.word 0x36800002  ! 751: BGE	bge,a	<label_0x2>
	.word 0xcd3a2690  ! 752: STDF_I	std	%f6, [0x0690, %r8]
	.word 0xe9e21009  ! 753: CASA_I	casa	[%r8] 0x80, %r9, %r20
	.word 0xca5a23d8  ! 754: LDX_I	ldx	[%r8 + 0x03d8], %r5
	.word 0x8143c000  ! 755: STBAR	stbar
	.word 0x2eca0001  ! 756: BRGEZ	brgez,a,pt	%8,<label_0xa0001>
	.word 0xc8520009  ! 757: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0x8c720009  ! 758: UDIV_R	udiv 	%r8, %r9, %r6
	.word 0xbcda0009  ! 759: SMULcc_R	smulcc 	%r8, %r9, %r30
	.word 0x887a0009  ! 760: SDIV_R	sdiv 	%r8, %r9, %r4
	.word 0xccea1009  ! 761: LDSTUBA_R	ldstuba	%r6, [%r8 + %r9] 0x80
	.word 0x836a2cb4  ! 762: SDIVX_I	sdivx	%r8, 0x0cb4, %r1
	.word 0xc2a21009  ! 763: STWA_R	stwa	%r1, [%r8 + %r9] 0x80
	.word 0x976a2054  ! 764: SDIVX_I	sdivx	%r8, 0x0054, %r11
	.word 0x8b220009  ! 765: MULScc_R	mulscc 	%r8, %r9, %r5
	.word 0xc36a2a78  ! 766: PREFETCH_I	prefetch	[%r8 + 0x0a78], #one_read
	.word 0xf0ba1009  ! 767: STDA_R	stda	%r24, [%r8 + %r9] 0x80
	.word 0x8a7a0009  ! 768: SDIV_R	sdiv 	%r8, %r9, %r5
	.word 0x967a0009  ! 769: SDIV_R	sdiv 	%r8, %r9, %r11
	.word 0xe27a2770  ! 770: SWAP_I	swap	%r17, [%r8 + 0x0770]
	.word 0xecfa1009  ! 771: SWAPA_R	swapa	%r22, [%r8 + %r9] 0x80
	.word 0xcab21009  ! 772: STHA_R	stha	%r5, [%r8 + %r9] 0x80
	.word 0x0aca0001  ! 773: BRNZ	brnz  ,pt	%8,<label_0xa0001>
	.word 0x8143e049  ! 774: MEMBAR	membar	#LoadLoad | #StoreStore | #Sync 
	.word 0x8143e017  ! 775: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside 
	.word 0x8143c000  ! 776: STBAR	stbar
	.word 0x22800001  ! 777: BE	be,a	<label_0x1>
	.word 0x887a0009  ! 778: SDIV_R	sdiv 	%r8, %r9, %r4
	.word 0xcea22c4c  ! 779: STWA_I	stwa	%r7, [%r8 + 0x0c4c] %asi
	.word 0xc6522bb0  ! 780: LDSH_I	ldsh	[%r8 + 0x0bb0], %r3
	.word 0xe8a21009  ! 781: STWA_R	stwa	%r20, [%r8 + %r9] 0x80
	.word 0xc8c227bc  ! 782: LDSWA_I	ldswa	[%r8, + 0x07bc] %asi, %r4
	.word 0xc73a0009  ! 783: STDF_R	std	%f3, [%r9, %r8]
	.word 0x8efa2b1c  ! 784: SDIVcc_I	sdivcc 	%r8, 0x0b1c, %r7
	.word 0xec1a2ff0  ! 785: LDD_I	ldd	[%r8 + 0x0ff0], %r22
	.word 0xce921009  ! 786: LDUHA_R	lduha	[%r8, %r9] 0x80, %r7
	.word 0xe5220009  ! 787: STF_R	st	%f18, [%r9, %r8]
	.word 0xcefa25a8  ! 788: SWAPA_I	swapa	%r7, [%r8 + 0x05a8] %asi
	.word 0x8efa2768  ! 789: SDIVcc_I	sdivcc 	%r8, 0x0768, %r7
	.word 0xe9f21009  ! 790: CASXA_I	casxa	[%r8] 0x80, %r9, %r20
	.word 0xd8ba1009  ! 791: STDA_R	stda	%r12, [%r8 + %r9] 0x80
	.word 0x12800001  ! 792: BNE	bne  	<label_0x1>
	.word 0xdaca2b98  ! 793: LDSBA_I	ldsba	[%r8, + 0x0b98] %asi, %r13
	.word 0xcd222694  ! 794: STF_I	st	%f6, [0x0694, %r8]
	.word 0xc8c21009  ! 795: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r4
	.word 0xc3ea27d4  ! 796: PREFETCHA_I	prefetcha	[%r8, + 0x07d4] %asi, #one_read
	.word 0x32800002  ! 797: BNE	bne,a	<label_0x2>
	.word 0x8c4a0009  ! 798: MULX_R	mulx 	%r8, %r9, %r6
	.word 0x8da208a9  ! 800: FSUBs	fsubs	%f8, %f9, %f6
	.word 0xe08a1009  ! 801: LDUBA_R	lduba	[%r8, %r9] 0x80, %r16
	.word 0x06ca0001  ! 802: BRLZ	brlz  ,pt	%8,<label_0xa0001>
	.word 0xc2a224e0  ! 804: STWA_I	stwa	%r1, [%r8 + 0x04e0] %asi
	.word 0x887a29b4  ! 806: SDIV_I	sdiv 	%r8, 0x09b4, %r4
	.word 0xd44a0009  ! 807: LDSB_R	ldsb	[%r8 + %r9], %r10
	.word 0x8143e027  ! 808: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #MemIssue 
	.word 0x96fa2124  ! 809: SDIVcc_I	sdivcc 	%r8, 0x0124, %r11
	.word 0xccd22d3c  ! 811: LDSHA_I	ldsha	[%r8, + 0x0d3c] %asi, %r6
	.word 0x865a2f04  ! 812: SMUL_I	smul 	%r8, 0x0f04, %r3
	.word 0x36800001  ! 813: BGE	bge,a	<label_0x1>
	.word 0x38800002  ! 814: BGU	bgu,a	<label_0x2>
	.word 0xc5220009  ! 815: STF_R	st	%f2, [%r9, %r8]
	.word 0x40000001  ! 816: CALL	call	disp30_1
	.word 0xca7a2e60  ! 817: SWAP_I	swap	%r5, [%r8 + 0x0e60]
	.word 0x866a0009  ! 818: UDIVX_R	udivx 	%r8, %r9, %r3
	.word 0xc3ea2d40  ! 819: PREFETCHA_I	prefetcha	[%r8, + 0x0d40] %asi, #one_read
	.word 0xc5220009  ! 820: STF_R	st	%f2, [%r9, %r8]
	.word 0xe81a0009  ! 821: LDD_R	ldd	[%r8 + %r9], %r20
	.word 0x8143e07f  ! 822: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xdcba25e8  ! 823: STDA_I	stda	%r14, [%r8 + 0x05e8] %asi
	.word 0xe0aa2ba0  ! 824: STBA_I	stba	%r16, [%r8 + 0x0ba0] %asi
	.word 0xc85229d4  ! 825: LDSH_I	ldsh	[%r8 + 0x09d4], %r4
	.word 0x86da25e0  ! 826: SMULcc_I	smulcc 	%r8, 0x05e0, %r3
	.word 0x86522330  ! 827: UMUL_I	umul 	%r8, 0x0330, %r3
	.word 0xcaea26f4  ! 829: LDSTUBA_I	ldstuba	%r5, [%r8 + 0x06f4] %asi
	.word 0x8143c000  ! 830: STBAR	stbar
	.word 0xf06a0009  ! 831: LDSTUB_R	ldstub	%r24, [%r8 + %r9]
	.word 0x866a0009  ! 832: UDIVX_R	udivx 	%r8, %r9, %r3
	.word 0xf8b22a60  ! 833: STHA_I	stha	%r28, [%r8 + 0x0a60] %asi
	.word 0x8143e073  ! 834: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside | #MemIssue | #Sync 
	.word 0xd41a2690  ! 835: LDD_I	ldd	[%r8 + 0x0690], %r10
	.word 0xc36a289c  ! 836: PREFETCH_I	prefetch	[%r8 + 0x089c], #one_read
	.word 0xcea21009  ! 837: STWA_R	stwa	%r7, [%r8 + %r9] 0x80
	.word 0xeca21009  ! 838: STWA_R	stwa	%r22, [%r8 + %r9] 0x80
	.word 0xc66a0009  ! 839: LDSTUB_R	ldstub	%r3, [%r8 + %r9]
	.word 0x8143e012  ! 840: MEMBAR	membar	#StoreLoad | #Lookaside 
	.word 0xc2ea2304  ! 841: LDSTUBA_I	ldstuba	%r1, [%r8 + 0x0304] %asi
	.word 0x8a5a0009  ! 842: SMUL_R	smul 	%r8, %r9, %r5
	.word 0x8322264c  ! 843: MULScc_I	mulscc 	%r8, 0x064c, %r1
	.word 0xdff21009  ! 845: CASXA_I	casxa	[%r8] 0x80, %r9, %r15
	.word 0xcc921009  ! 846: LDUHA_R	lduha	[%r8, %r9] 0x80, %r6
	.word 0x87a208a9  ! 847: FSUBs	fsubs	%f8, %f9, %f3
	.word 0x2c800001  ! 848: BNEG	bneg,a	<label_0x1>
	.word 0x8143e04f  ! 849: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #Sync 
	.word 0x8143c000  ! 850: STBAR	stbar
	.word 0xc3ea2e6c  ! 851: PREFETCHA_I	prefetcha	[%r8, + 0x0e6c] %asi, #one_read
	.word 0x2e800001  ! 852: BVS	bvs,a	<label_0x1>
	.word 0x8143e00f  ! 853: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore 
	.word 0x83a20829  ! 854: FADDs	fadds	%f8, %f9, %f1
	.word 0xe4ba1009  ! 855: STDA_R	stda	%r18, [%r8 + %r9] 0x80
	.word 0xceea2198  ! 856: LDSTUBA_I	ldstuba	%r7, [%r8 + 0x0198] %asi
	.word 0x36800002  ! 857: BGE	bge,a	<label_0x2>
	.word 0xa3a209a9  ! 858: FDIVs	fdivs	%f8, %f9, %f17
	.word 0xeef222c8  ! 859: STXA_I	stxa	%r23, [%r8 + 0x02c8] %asi
	.word 0xc2b21009  ! 860: STHA_R	stha	%r1, [%r8 + %r9] 0x80
	.word 0x36800001  ! 861: BGE	bge,a	<label_0x1>
	.word 0xdada1009  ! 863: LDXA_R	ldxa	[%r8, %r9] 0x80, %r13
	.word 0x8143e007  ! 864: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore 
	.word 0xecb22388  ! 865: STHA_I	stha	%r22, [%r8 + 0x0388] %asi
	.word 0x3a800001  ! 866: BCC	bcc,a	<label_0x1>
	.word 0x20800001  ! 867: BN	bn,a	<label_0x1>
	.word 0x8a5a0009  ! 868: SMUL_R	smul 	%r8, %r9, %r5
	.word 0xc8921009  ! 869: LDUHA_R	lduha	[%r8, %r9] 0x80, %r4
	.word 0xca7a0009  ! 870: SWAP_R	swap	%r5, [%r8 + %r9]
	.word 0x8c520009  ! 871: UMUL_R	umul 	%r8, %r9, %r6
	.word 0xc87a2cbc  ! 872: SWAP_I	swap	%r4, [%r8 + 0x0cbc]
	.word 0xecb2240c  ! 873: STHA_I	stha	%r22, [%r8 + 0x040c] %asi
	.word 0xcad22070  ! 874: LDSHA_I	ldsha	[%r8, + 0x0070] %asi, %r5
	.word 0xce5a0009  ! 875: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xa8522d90  ! 876: UMUL_I	umul 	%r8, 0x0d90, %r20
	.word 0x8ef22e04  ! 877: UDIVcc_I	udivcc 	%r8, 0x0e04, %r7
	.word 0xc93a0009  ! 878: STDF_R	std	%f4, [%r9, %r8]
	.word 0xc36a20f8  ! 879: PREFETCH_I	prefetch	[%r8 + 0x00f8], #one_read
	.word 0x8143c000  ! 880: STBAR	stbar
	.word 0xc8ea1009  ! 881: LDSTUBA_R	ldstuba	%r4, [%r8 + %r9] 0x80
	.word 0xa84a0009  ! 884: MULX_R	mulx 	%r8, %r9, %r20
	.word 0xa65a24ec  ! 885: SMUL_I	smul 	%r8, 0x04ec, %r19
	.word 0xe0ba2af8  ! 886: STDA_I	stda	%r16, [%r8 + 0x0af8] %asi
	.word 0x12800001  ! 887: BNE	bne  	<label_0x1>
	.word 0xc65a26c0  ! 888: LDX_I	ldx	[%r8 + 0x06c0], %r3
	.word 0x06c20001  ! 889: BRLZ	brlz  ,nt	%8,<label_0x20001>
	.word 0xc8420009  ! 890: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xc4aa2774  ! 891: STBA_I	stba	%r2, [%r8 + 0x0774] %asi
	.word 0x0eca0001  ! 892: BRGEZ	brgez  ,pt	%8,<label_0xa0001>
	.word 0x8ba208a9  ! 893: FSUBs	fsubs	%f8, %f9, %f5
	.word 0x8c7a0009  ! 894: SDIV_R	sdiv 	%r8, %r9, %r6
	.word 0x86720009  ! 895: UDIV_R	udiv 	%r8, %r9, %r3
	.word 0x8eda2538  ! 896: SMULcc_I	smulcc 	%r8, 0x0538, %r7
	.word 0x8143e05e  ! 897: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0xe81a0009  ! 898: LDD_R	ldd	[%r8 + %r9], %r20
	.word 0xc3ea2ae4  ! 899: PREFETCHA_I	prefetcha	[%r8, + 0x0ae4] %asi, #one_read
	.word 0x8143c000  ! 900: STBAR	stbar
	.word 0x966a0009  ! 903: UDIVX_R	udivx 	%r8, %r9, %r11
	.word 0xc73a2270  ! 904: STDF_I	std	%f3, [0x0270, %r8]
	.word 0xc89a27f8  ! 905: LDDA_I	ldda	[%r8, + 0x07f8] %asi, %r4
	.word 0x8143e074  ! 906: MEMBAR	membar	#LoadStore | #Lookaside | #MemIssue | #Sync 
	.word 0xc4da2758  ! 907: LDXA_I	ldxa	[%r8, + 0x0758] %asi, %r2
	.word 0xe46a0009  ! 908: LDSTUB_R	ldstub	%r18, [%r8 + %r9]
	.word 0xcaf222e8  ! 909: STXA_I	stxa	%r5, [%r8 + 0x02e8] %asi
	.word 0x8143e061  ! 910: MEMBAR	membar	#LoadLoad | #MemIssue | #Sync 
	.word 0x02800001  ! 911: BE	be  	<label_0x1>
	.word 0xf4520009  ! 912: LDSH_R	ldsh	[%r8 + %r9], %r26
	.word 0x8da209a9  ! 913: FDIVs	fdivs	%f8, %f9, %f6
	.word 0xd8f21009  ! 914: STXA_R	stxa	%r12, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 915: STBAR	stbar
	.word 0xc3ea2f2c  ! 916: PREFETCHA_I	prefetcha	[%r8, + 0x0f2c] %asi, #one_read
	.word 0x8143c000  ! 917: STBAR	stbar
	.word 0xc2aa2dfc  ! 918: STBA_I	stba	%r1, [%r8 + 0x0dfc] %asi
	.word 0xd9f22009  ! 920: CASXA_R	casxa	[%r8]%asi, %r9, %r12
	.word 0x12800001  ! 921: BNE	bne  	<label_0x1>
	.word 0xec9a1009  ! 922: LDDA_R	ldda	[%r8, %r9] 0x80, %r22
	.word 0xec9a1009  ! 923: LDDA_R	ldda	[%r8, %r9] 0x80, %r22
	.word 0xada209a9  ! 924: FDIVs	fdivs	%f8, %f9, %f22
	.word 0x8eda0009  ! 925: SMULcc_R	smulcc 	%r8, %r9, %r7
	.word 0xcc5a2720  ! 926: LDX_I	ldx	[%r8 + 0x0720], %r6
	.word 0xcaca29e0  ! 927: LDSBA_I	ldsba	[%r8, + 0x09e0] %asi, %r5
	.word 0x9f6a0009  ! 928: SDIVX_R	sdivx	%r8, %r9, %r15
	.word 0xb86a0009  ! 929: UDIVX_R	udivx 	%r8, %r9, %r28
	.word 0x8143e011  ! 930: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xccea1009  ! 931: LDSTUBA_R	ldstuba	%r6, [%r8 + %r9] 0x80
	.word 0xcc420009  ! 932: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0x826a0009  ! 933: UDIVX_R	udivx 	%r8, %r9, %r1
	.word 0xc4aa1009  ! 934: STBA_R	stba	%r2, [%r8 + %r9] 0x80
	.word 0x8143e048  ! 935: MEMBAR	membar	#StoreStore | #Sync 
	.word 0xc66a0009  ! 936: LDSTUB_R	ldstub	%r3, [%r8 + %r9]
	.word 0x83a20929  ! 937: FMULs	fmuls	%f8, %f9, %f1
	.word 0x8143e062  ! 938: MEMBAR	membar	#StoreLoad | #MemIssue | #Sync 
	.word 0xc36a2a34  ! 939: PREFETCH_I	prefetch	[%r8 + 0x0a34], #one_read
	.word 0xd47a0009  ! 940: SWAP_R	swap	%r10, [%r8 + %r9]
	.word 0xc84a21b8  ! 941: LDSB_I	ldsb	[%r8 + 0x01b8], %r4
	.word 0x02800001  ! 944: BE	be  	<label_0x1>
	.word 0xb27a0009  ! 945: SDIV_R	sdiv 	%r8, %r9, %r25
	.word 0xc7220009  ! 947: STF_R	st	%f3, [%r9, %r8]
	.word 0xceb227c4  ! 948: STHA_I	stha	%r7, [%r8 + 0x07c4] %asi
	.word 0xccca2fdc  ! 949: LDSBA_I	ldsba	[%r8, + 0x0fdc] %asi, %r6
	.word 0xc4ca2e98  ! 950: LDSBA_I	ldsba	[%r8, + 0x0e98] %asi, %r2
	.word 0x82da2b74  ! 951: SMULcc_I	smulcc 	%r8, 0x0b74, %r1
	.word 0xfa7a27c0  ! 952: SWAP_I	swap	%r29, [%r8 + 0x07c0]
	.word 0xcfe22009  ! 953: CASA_R	casa	[%r8] %asi, %r9, %r7
	.word 0x24800001  ! 954: BLE	ble,a	<label_0x1>
	.word 0x84720009  ! 955: UDIV_R	udiv 	%r8, %r9, %r2
	.word 0xceda1009  ! 956: LDXA_R	ldxa	[%r8, %r9] 0x80, %r7
	.word 0xc36a2234  ! 957: PREFETCH_I	prefetch	[%r8 + 0x0234], #one_read
	.word 0xc41220cc  ! 958: LDUH_I	lduh	[%r8 + 0x00cc], %r2
	.word 0xdc6a0009  ! 961: LDSTUB_R	ldstub	%r14, [%r8 + %r9]
	.word 0xc6b21009  ! 963: STHA_R	stha	%r3, [%r8 + %r9] 0x80
	.word 0xc28a1009  ! 965: LDUBA_R	lduba	[%r8, %r9] 0x80, %r1
	.word 0x8e4a0009  ! 966: MULX_R	mulx 	%r8, %r9, %r7
	.word 0xdaa21009  ! 967: STWA_R	stwa	%r13, [%r8 + %r9] 0x80
	.word 0xc84a2068  ! 968: LDSB_I	ldsb	[%r8 + 0x0068], %r4
	.word 0x8143c000  ! 970: STBAR	stbar
	.word 0xc6a22754  ! 973: STWA_I	stwa	%r3, [%r8 + 0x0754] %asi
	.word 0xccb222f4  ! 974: STHA_I	stha	%r6, [%r8 + 0x02f4] %asi
	.word 0x8143e061  ! 975: MEMBAR	membar	#LoadLoad | #MemIssue | #Sync 
	.word 0xc87a0009  ! 976: SWAP_R	swap	%r4, [%r8 + %r9]
	.word 0x8143e06e  ! 977: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #MemIssue | #Sync 
	.word 0xa2fa22a8  ! 978: SDIVcc_I	sdivcc 	%r8, 0x02a8, %r17
	.word 0x8af22978  ! 979: UDIVcc_I	udivcc 	%r8, 0x0978, %r5
	.word 0xc4b21009  ! 980: STHA_R	stha	%r2, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 981: STBAR	stbar
	.word 0x20800002  ! 982: BN	bn,a	<label_0x2>
	.word 0xf0ba2fb8  ! 983: STDA_I	stda	%r24, [%r8 + 0x0fb8] %asi
	.word 0xc5220009  ! 984: STF_R	st	%f2, [%r9, %r8]
	.word 0xcc822f74  ! 985: LDUWA_I	lduwa	[%r8, + 0x0f74] %asi, %r6
	.word 0xfeea1009  ! 986: LDSTUBA_R	ldstuba	%r31, [%r8 + %r9] 0x80
	.word 0xb8d20009  ! 987: UMULcc_R	umulcc 	%r8, %r9, %r28
	.word 0xe2ca1009  ! 988: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r17
	.word 0x8efa291c  ! 989: SDIVcc_I	sdivcc 	%r8, 0x091c, %r7
	.word 0xc6d21009  ! 990: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r3
	.word 0xc47a0009  ! 991: SWAP_R	swap	%r2, [%r8 + %r9]
	.word 0xea8a1009  ! 992: LDUBA_R	lduba	[%r8, %r9] 0x80, %r21
	.word 0xcc921009  ! 993: LDUHA_R	lduha	[%r8, %r9] 0x80, %r6
	.word 0xc3ea2e4c  ! 994: PREFETCHA_I	prefetcha	[%r8, + 0x0e4c] %asi, #one_read
	.word 0x8afa2094  ! 997: SDIVcc_I	sdivcc 	%r8, 0x0094, %r5
	.word 0xb252242c  ! 998: UMUL_I	umul 	%r8, 0x042c, %r25
	.word 0x8143c000  ! 999: STBAR	stbar
        ta      T_GOOD_TRAP

th_main_1:
        setx  MAIN_BASE_DATA_VA, %r1, %r8
        setx  0x0000000000000220, %g1, %r9
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
        setx  0xdc1a1e6566c196e8, %g1, %r0
        setx  0xe13817b7d06a514a, %g1, %r1
        setx  0x72158fc1fc3b9237, %g1, %r2
        setx  0xcfeb648c5af5b028, %g1, %r3
        setx  0x2eb71b1c4d90ff46, %g1, %r4
        setx  0x22b69fb38f7d02a8, %g1, %r5
        setx  0x77c8a852dae6c89e, %g1, %r6
        setx  0x959face2b3565cc5, %g1, %r7
        setx  0x087c0fe119accb4f, %g1, %r10
        setx  0x4f6c6e82d36f2777, %g1, %r11
        setx  0x8a73cfaa8c253bf7, %g1, %r12
        setx  0xb38cce53dfbc7925, %g1, %r13
        setx  0xfc51080c9f494865, %g1, %r14
        setx  0x132084cf52544253, %g1, %r15
        setx  0x876520b2e89e862d, %g1, %r16
        setx  0x403d4296b9e909c2, %g1, %r17
        setx  0x28b9210025797f9c, %g1, %r18
        setx  0xb2c6056a3e77bc02, %g1, %r19
        setx  0x8358688dc15c7df0, %g1, %r20
        setx  0x8e14f7ba8758f985, %g1, %r21
        setx  0xc835a6f57bbfa539, %g1, %r22
        setx  0x74ece8d54bdd413f, %g1, %r23
        setx  0x45ed79472259b1c8, %g1, %r24
        setx  0x93c335524ca8e7af, %g1, %r25
        setx  0x3002a5b3a5d8b514, %g1, %r26
        setx  0x4c2e5bfb30890d56, %g1, %r27
        setx  0x6ac72ce8c412dd4a, %g1, %r28
        setx  0xbafc36c548501534, %g1, %r29
        setx  0xf0a481019a666da3, %g1, %r30
        setx  0x5bc26d186a8b2319, %g1, %r31
	.word 0xccea2998  ! 5: LDSTUBA_I	ldstuba	%r6, [%r8 + 0x0998] %asi
	.word 0xc65a27d0  ! 7: LDX_I	ldx	[%r8 + 0x07d0], %r3
	.word 0x20800001  ! 8: BN	bn,a	<label_0x1>
	.word 0xce821009  ! 9: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r7
	.word 0xc2c22068  ! 10: LDSWA_I	ldswa	[%r8, + 0x0068] %asi, %r1
	.word 0xc4f22d38  ! 11: STXA_I	stxa	%r2, [%r8 + 0x0d38] %asi
	.word 0xc4a21009  ! 13: STWA_R	stwa	%r2, [%r8 + %r9] 0x80
	.word 0xccd2206c  ! 14: LDSHA_I	ldsha	[%r8, + 0x006c] %asi, %r6
	.word 0x8143c000  ! 15: STBAR	stbar
	.word 0x8143e074  ! 16: MEMBAR	membar	#LoadStore | #Lookaside | #MemIssue | #Sync 
	.word 0xc9222d34  ! 18: STF_I	st	%f4, [0x0d34, %r8]
	.word 0xca921009  ! 19: LDUHA_R	lduha	[%r8, %r9] 0x80, %r5
	.word 0xcc120009  ! 20: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xc3ea2f64  ! 21: PREFETCHA_I	prefetcha	[%r8, + 0x0f64] %asi, #one_read
	.word 0xc6fa2280  ! 22: SWAPA_I	swapa	%r3, [%r8 + 0x0280] %asi
	.word 0x9c52258c  ! 23: UMUL_I	umul 	%r8, 0x058c, %r14
	.word 0x8143c000  ! 25: STBAR	stbar
	.word 0xb3a209a9  ! 26: FDIVs	fdivs	%f8, %f9, %f25
	.word 0xdc5a0009  ! 27: LDX_R	ldx	[%r8 + %r9], %r14
	.word 0xcff22009  ! 28: CASXA_R	casxa	[%r8]%asi, %r9, %r7
	.word 0xceaa1009  ! 29: STBA_R	stba	%r7, [%r8 + %r9] 0x80
	.word 0x85a20829  ! 30: FADDs	fadds	%f8, %f9, %f2
	.word 0x85220009  ! 32: MULScc_R	mulscc 	%r8, %r9, %r2
	.word 0xcefa214c  ! 33: SWAPA_I	swapa	%r7, [%r8 + 0x014c] %asi
	.word 0xf6c21009  ! 34: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r27
	.word 0x2cc20001  ! 35: BRGZ	brgz,a,nt	%8,<label_0x20001>
	.word 0xcf3a0009  ! 36: STDF_R	std	%f7, [%r9, %r8]
	.word 0x86522c44  ! 37: UMUL_I	umul 	%r8, 0x0c44, %r3
	.word 0xbc5a0009  ! 38: SMUL_R	smul 	%r8, %r9, %r30
	.word 0xc20a20dc  ! 39: LDUB_I	ldub	[%r8 + 0x00dc], %r1
	.word 0x8143e044  ! 40: MEMBAR	membar	#LoadStore | #Sync 
	.word 0xd8ba1009  ! 41: STDA_R	stda	%r12, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 42: STBAR	stbar
	.word 0xc73a0009  ! 43: STDF_R	std	%f3, [%r9, %r8]
	.word 0x8143c000  ! 44: STBAR	stbar
	.word 0xdc122f74  ! 45: LDUH_I	lduh	[%r8 + 0x0f74], %r14
	.word 0xc8020009  ! 46: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xc36a2dbc  ! 47: PREFETCH_I	prefetch	[%r8 + 0x0dbc], #one_read
	.word 0x84d20009  ! 48: UMULcc_R	umulcc 	%r8, %r9, %r2
	.word 0xc4fa1009  ! 49: SWAPA_R	swapa	%r2, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 50: STBAR	stbar
	.word 0xd6c21009  ! 51: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r11
	.word 0xfcf22410  ! 52: STXA_I	stxa	%r30, [%r8 + 0x0410] %asi
	.word 0xc2420009  ! 53: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0x8ba208a9  ! 56: FSUBs	fsubs	%f8, %f9, %f5
	.word 0x40000002  ! 57: CALL	call	disp30_2
	.word 0x82da0009  ! 58: SMULcc_R	smulcc 	%r8, %r9, %r1
	.word 0x2aca0001  ! 59: BRNZ	brnz,a,pt	%8,<label_0xa0001>
	.word 0x0aca0001  ! 60: BRNZ	brnz  ,pt	%8,<label_0xa0001>
	.word 0xc2d21009  ! 61: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r1
	.word 0x8a7a0009  ! 62: SDIV_R	sdiv 	%r8, %r9, %r5
	.word 0xce7a0009  ! 63: SWAP_R	swap	%r7, [%r8 + %r9]
	.word 0x8143c000  ! 64: STBAR	stbar
	.word 0xc8f21009  ! 65: STXA_R	stxa	%r4, [%r8 + %r9] 0x80
	.word 0x22ca0001  ! 66: BRZ	brz,a,pt	%8,<label_0xa0001>
	.word 0x3c800001  ! 67: BPOS	bpos,a	<label_0x1>
	.word 0xce122644  ! 68: LDUH_I	lduh	[%r8 + 0x0644], %r7
	.word 0xc73a0009  ! 69: STDF_R	std	%f3, [%r9, %r8]
	.word 0x8143e02b  ! 70: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #MemIssue 
	.word 0xf6fa1009  ! 71: SWAPA_R	swapa	%r27, [%r8 + %r9] 0x80
	.word 0xcff21009  ! 72: CASXA_I	casxa	[%r8] 0x80, %r9, %r7
	.word 0xc8fa1009  ! 73: SWAPA_R	swapa	%r4, [%r8 + %r9] 0x80
	.word 0xc3ea2710  ! 74: PREFETCHA_I	prefetcha	[%r8, + 0x0710] %asi, #one_read
	.word 0xccc21009  ! 75: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r6
	.word 0x89220009  ! 76: MULScc_R	mulscc 	%r8, %r9, %r4
	.word 0xc8b229b4  ! 77: STHA_I	stha	%r4, [%r8 + 0x09b4] %asi
	.word 0x2e800001  ! 78: BVS	bvs,a	<label_0x1>
	.word 0x89a20929  ! 79: FMULs	fmuls	%f8, %f9, %f4
	.word 0xf9222d90  ! 80: STF_I	st	%f28, [0x0d90, %r8]
	.word 0xda6a0009  ! 81: LDSTUB_R	ldstub	%r13, [%r8 + %r9]
	.word 0xc8122a38  ! 82: LDUH_I	lduh	[%r8 + 0x0a38], %r4
	.word 0x8143e033  ! 83: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside | #MemIssue 
	.word 0xea4a2a30  ! 84: LDSB_I	ldsb	[%r8 + 0x0a30], %r21
	.word 0x9ef22174  ! 85: UDIVcc_I	udivcc 	%r8, 0x0174, %r15
	.word 0x00800002  ! 86: BN	bn  	<label_0x2>
	.word 0x88f20009  ! 87: UDIVcc_R	udivcc 	%r8, %r9, %r4
	.word 0x3a800001  ! 88: BCC	bcc,a	<label_0x1>
	.word 0xd4921009  ! 89: LDUHA_R	lduha	[%r8, %r9] 0x80, %r10
	.word 0x8143c000  ! 90: STBAR	stbar
	.word 0x88f20009  ! 91: UDIVcc_R	udivcc 	%r8, %r9, %r4
	.word 0x8a6a0009  ! 92: UDIVX_R	udivx 	%r8, %r9, %r5
	.word 0xcaaa1009  ! 93: STBA_R	stba	%r5, [%r8 + %r9] 0x80
	.word 0xd80a0009  ! 94: LDUB_R	ldub	[%r8 + %r9], %r12
	.word 0xc6a21009  ! 95: STWA_R	stwa	%r3, [%r8 + %r9] 0x80
	.word 0xfcfa2ef0  ! 96: SWAPA_I	swapa	%r30, [%r8 + 0x0ef0] %asi
	.word 0x8a720009  ! 97: UDIV_R	udiv 	%r8, %r9, %r5
	.word 0x8b6a0009  ! 98: SDIVX_R	sdivx	%r8, %r9, %r5
	.word 0xc36a2554  ! 99: PREFETCH_I	prefetch	[%r8 + 0x0554], #one_read
	.word 0xcf222374  ! 100: STF_I	st	%f7, [0x0374, %r8]
	.word 0x8143c000  ! 101: STBAR	stbar
	.word 0x8c7a0009  ! 103: SDIV_R	sdiv 	%r8, %r9, %r6
	.word 0xc6aa1009  ! 105: STBA_R	stba	%r3, [%r8 + %r9] 0x80
	.word 0x00800001  ! 106: BN	bn  	<label_0x1>
	.word 0xdaca1009  ! 107: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r13
	.word 0xc4420009  ! 108: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0x06800001  ! 110: BL	bl  	<label_0x1>
	.word 0xac4a0009  ! 111: MULX_R	mulx 	%r8, %r9, %r22
	.word 0xc60a2758  ! 112: LDUB_I	ldub	[%r8 + 0x0758], %r3
	.word 0x8143c000  ! 113: STBAR	stbar
	.word 0xc8120009  ! 114: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0x85a20829  ! 115: FADDs	fadds	%f8, %f9, %f2
	.word 0xca7a2100  ! 116: SWAP_I	swap	%r5, [%r8 + 0x0100]
	.word 0x22800001  ! 117: BE	be,a	<label_0x1>
	.word 0xc3ea2ac0  ! 118: PREFETCHA_I	prefetcha	[%r8, + 0x0ac0] %asi, #one_read
	.word 0xc40a0009  ! 119: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xc41a2e68  ! 120: LDD_I	ldd	[%r8 + 0x0e68], %r2
	.word 0xc4921009  ! 121: LDUHA_R	lduha	[%r8, %r9] 0x80, %r2
	.word 0xc6020009  ! 123: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xc4b22648  ! 124: STHA_I	stha	%r2, [%r8 + 0x0648] %asi
	.word 0x34800002  ! 125: BG	bg,a	<label_0x2>
	.word 0xa8520009  ! 126: UMUL_R	umul 	%r8, %r9, %r20
	.word 0xccb21009  ! 127: STHA_R	stha	%r6, [%r8 + %r9] 0x80
	.word 0x94722dac  ! 129: UDIV_I	udiv 	%r8, 0x0dac, %r10
	.word 0xcad22430  ! 130: LDSHA_I	ldsha	[%r8, + 0x0430] %asi, %r5
	.word 0x866a2224  ! 131: UDIVX_I	udivx 	%r8, 0x0224, %r3
	.word 0xc3ea2508  ! 132: PREFETCHA_I	prefetcha	[%r8, + 0x0508] %asi, #one_read
	.word 0xc60a0009  ! 133: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xc2fa2328  ! 134: SWAPA_I	swapa	%r1, [%r8 + 0x0328] %asi
	.word 0x866a25c4  ! 135: UDIVX_I	udivx 	%r8, 0x05c4, %r3
	.word 0xdaf21009  ! 136: STXA_R	stxa	%r13, [%r8 + %r9] 0x80
	.word 0xd8520009  ! 137: LDSH_R	ldsh	[%r8 + %r9], %r12
	.word 0xc402227c  ! 138: LDUW_I	lduw	[%r8 + 0x027c], %r2
	.word 0xc2aa23e0  ! 140: STBA_I	stba	%r1, [%r8 + 0x03e0] %asi
	.word 0xe4ba29c0  ! 141: STDA_I	stda	%r18, [%r8 + 0x09c0] %asi
	.word 0x82f22290  ! 142: UDIVcc_I	udivcc 	%r8, 0x0290, %r1
	.word 0xdc6a2894  ! 143: LDSTUB_I	ldstub	%r14, [%r8 + 0x0894]
	.word 0x40000001  ! 144: CALL	call	disp30_1
	.word 0xd89a2c38  ! 145: LDDA_I	ldda	[%r8, + 0x0c38] %asi, %r12
	.word 0xc36a234c  ! 146: PREFETCH_I	prefetch	[%r8 + 0x034c], #one_read
	.word 0x38800001  ! 147: BGU	bgu,a	<label_0x1>
	.word 0xe0020009  ! 148: LDUW_R	lduw	[%r8 + %r9], %r16
	.word 0xee1229cc  ! 150: LDUH_I	lduh	[%r8 + 0x09cc], %r23
	.word 0xc6522094  ! 151: LDSH_I	ldsh	[%r8 + 0x0094], %r3
	.word 0x36800001  ! 152: BGE	bge,a	<label_0x1>
	.word 0xc8420009  ! 153: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xf4122d84  ! 154: LDUH_I	lduh	[%r8 + 0x0d84], %r26
	.word 0x8c722254  ! 155: UDIV_I	udiv 	%r8, 0x0254, %r6
	.word 0x885a0009  ! 156: SMUL_R	smul 	%r8, %r9, %r4
	.word 0x8143e05c  ! 157: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0xc8f22680  ! 158: STXA_I	stxa	%r4, [%r8 + 0x0680] %asi
	.word 0xc87a0009  ! 159: SWAP_R	swap	%r4, [%r8 + %r9]
	.word 0xc36a20c0  ! 160: PREFETCH_I	prefetch	[%r8 + 0x00c0], #one_read
	.word 0xc8a22e74  ! 161: STWA_I	stwa	%r4, [%r8 + 0x0e74] %asi
	.word 0x8143e00e  ! 162: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore 
	.word 0xc8122a34  ! 163: LDUH_I	lduh	[%r8 + 0x0a34], %r4
	.word 0xcc8a2638  ! 164: LDUBA_I	lduba	[%r8, + 0x0638] %asi, %r6
	.word 0x2cca0001  ! 165: BRGZ	brgz,a,pt	%8,<label_0xa0001>
	.word 0xcc921009  ! 166: LDUHA_R	lduha	[%r8, %r9] 0x80, %r6
	.word 0xcefa1009  ! 167: SWAPA_R	swapa	%r7, [%r8 + %r9] 0x80
	.word 0xb7a209a9  ! 168: FDIVs	fdivs	%f8, %f9, %f27
	.word 0xc4ba1009  ! 169: STDA_R	stda	%r2, [%r8 + %r9] 0x80
	.word 0x1a800001  ! 170: BCC	bcc  	<label_0x1>
	.word 0xce0a2620  ! 171: LDUB_I	ldub	[%r8 + 0x0620], %r7
	.word 0xfff22009  ! 172: CASXA_R	casxa	[%r8]%asi, %r9, %r31
	.word 0x16800001  ! 173: BGE	bge  	<label_0x1>
	.word 0xe6ea1009  ! 174: LDSTUBA_R	ldstuba	%r19, [%r8 + %r9] 0x80
	.word 0x82520009  ! 175: UMUL_R	umul 	%r8, %r9, %r1
	.word 0xccfa2fb8  ! 176: SWAPA_I	swapa	%r6, [%r8 + 0x0fb8] %asi
	.word 0x8c7a21e8  ! 177: SDIV_I	sdiv 	%r8, 0x01e8, %r6
	.word 0xc36a2e20  ! 178: PREFETCH_I	prefetch	[%r8 + 0x0e20], #one_read
	.word 0x885a2bbc  ! 179: SMUL_I	smul 	%r8, 0x0bbc, %r4
	.word 0x8a5a2fec  ! 180: SMUL_I	smul 	%r8, 0x0fec, %r5
	.word 0xe1220009  ! 182: STF_R	st	%f16, [%r9, %r8]
	.word 0xe8aa1009  ! 184: STBA_R	stba	%r20, [%r8 + %r9] 0x80
	.word 0xcdf22009  ! 185: CASXA_R	casxa	[%r8]%asi, %r9, %r6
	.word 0xe7220009  ! 188: STF_R	st	%f19, [%r9, %r8]
	.word 0xc8522174  ! 189: LDSH_I	ldsh	[%r8 + 0x0174], %r4
	.word 0xaba208a9  ! 190: FSUBs	fsubs	%f8, %f9, %f21
	.word 0xc7e21009  ! 191: CASA_I	casa	[%r8] 0x80, %r9, %r3
	.word 0x8143e031  ! 192: MEMBAR	membar	#LoadLoad | #Lookaside | #MemIssue 
	.word 0xcc0a2714  ! 193: LDUB_I	ldub	[%r8 + 0x0714], %r6
	.word 0xd6da27d8  ! 194: LDXA_I	ldxa	[%r8, + 0x07d8] %asi, %r11
	.word 0xc36a28fc  ! 195: PREFETCH_I	prefetch	[%r8 + 0x08fc], #one_read
	.word 0xc6ea1009  ! 196: LDSTUBA_R	ldstuba	%r3, [%r8 + %r9] 0x80
	.word 0x8a7a277c  ! 197: SDIV_I	sdiv 	%r8, 0x077c, %r5
	.word 0x8ada2e7c  ! 198: SMULcc_I	smulcc 	%r8, 0x0e7c, %r5
	.word 0xae4a0009  ! 199: MULX_R	mulx 	%r8, %r9, %r23
	.word 0xac4a0009  ! 200: MULX_R	mulx 	%r8, %r9, %r22
	.word 0x84da2e84  ! 201: SMULcc_I	smulcc 	%r8, 0x0e84, %r2
	.word 0x8143e07e  ! 202: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xccca1009  ! 203: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r6
	.word 0xd4822c08  ! 204: LDUWA_I	lduwa	[%r8, + 0x0c08] %asi, %r10
	.word 0x36800002  ! 205: BGE	bge,a	<label_0x2>
	.word 0x06800001  ! 206: BL	bl  	<label_0x1>
	.word 0xfc0a2f6c  ! 207: LDUB_I	ldub	[%r8 + 0x0f6c], %r30
	.word 0xc4122f4c  ! 208: LDUH_I	lduh	[%r8 + 0x0f4c], %r2
	.word 0xc7220009  ! 209: STF_R	st	%f3, [%r9, %r8]
	.word 0xc6b225bc  ! 210: STHA_I	stha	%r3, [%r8 + 0x05bc] %asi
	.word 0x97a208a9  ! 211: FSUBs	fsubs	%f8, %f9, %f11
	.word 0x8ad22638  ! 212: UMULcc_I	umulcc 	%r8, 0x0638, %r5
	.word 0x8143e04b  ! 213: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Sync 
	.word 0xc4aa24ec  ! 214: STBA_I	stba	%r2, [%r8 + 0x04ec] %asi
	.word 0xc4da1009  ! 215: LDXA_R	ldxa	[%r8, %r9] 0x80, %r2
	.word 0x8e522310  ! 216: UMUL_I	umul 	%r8, 0x0310, %r7
	.word 0xcc022e38  ! 217: LDUW_I	lduw	[%r8 + 0x0e38], %r6
	.word 0x18800002  ! 218: BGU	bgu  	<label_0x2>
	.word 0xc36a2060  ! 219: PREFETCH_I	prefetch	[%r8 + 0x0060], #one_read
	.word 0x8da20929  ! 220: FMULs	fmuls	%f8, %f9, %f6
	.word 0xc4da1009  ! 221: LDXA_R	ldxa	[%r8, %r9] 0x80, %r2
	.word 0xc7222c54  ! 222: STF_I	st	%f3, [0x0c54, %r8]
	.word 0xde422c00  ! 223: LDSW_I	ldsw	[%r8 + 0x0c00], %r15
	.word 0x8cda2b34  ! 224: SMULcc_I	smulcc 	%r8, 0x0b34, %r6
	.word 0x8143c000  ! 225: STBAR	stbar
	.word 0xc2422744  ! 226: LDSW_I	ldsw	[%r8 + 0x0744], %r1
	.word 0xc5f21009  ! 227: CASXA_I	casxa	[%r8] 0x80, %r9, %r2
	.word 0x3a800001  ! 228: BCC	bcc,a	<label_0x1>
	.word 0x24800001  ! 229: BLE	ble,a	<label_0x1>
	.word 0xe89a1009  ! 230: LDDA_R	ldda	[%r8, %r9] 0x80, %r20
	.word 0xe0fa2230  ! 231: SWAPA_I	swapa	%r16, [%r8 + 0x0230] %asi
	.word 0x0e800001  ! 232: BVS	bvs  	<label_0x1>
	.word 0xc9f22009  ! 233: CASXA_R	casxa	[%r8]%asi, %r9, %r4
	.word 0xc36a24a8  ! 234: PREFETCH_I	prefetch	[%r8 + 0x04a8], #one_read
	.word 0x16800002  ! 235: BGE	bge  	<label_0x2>
	.word 0x8eda0009  ! 236: SMULcc_R	smulcc 	%r8, %r9, %r7
	.word 0xcada2e18  ! 237: LDXA_I	ldxa	[%r8, + 0x0e18] %asi, %r5
	.word 0x8143e02a  ! 238: MEMBAR	membar	#StoreLoad | #StoreStore | #MemIssue 
	.word 0x8143e00b  ! 239: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore 
	.word 0xe01a0009  ! 240: LDD_R	ldd	[%r8 + %r9], %r16
	.word 0xc2ea2eb0  ! 241: LDSTUBA_I	ldstuba	%r1, [%r8 + 0x0eb0] %asi
	.word 0xca921009  ! 242: LDUHA_R	lduha	[%r8, %r9] 0x80, %r5
	.word 0xf7f22009  ! 243: CASXA_R	casxa	[%r8]%asi, %r9, %r27
	.word 0xaa6a23bc  ! 244: UDIVX_I	udivx 	%r8, 0x03bc, %r21
	.word 0x24c20001  ! 245: BRLEZ	brlez,a,nt	%8,<label_0x20001>
	.word 0xc2fa1009  ! 246: SWAPA_R	swapa	%r1, [%r8 + %r9] 0x80
	.word 0x8e720009  ! 247: UDIV_R	udiv 	%r8, %r9, %r7
	.word 0x892229c8  ! 248: MULScc_I	mulscc 	%r8, 0x09c8, %r4
	.word 0xcf220009  ! 249: STF_R	st	%f7, [%r9, %r8]
	.word 0xc3ea2a3c  ! 250: PREFETCHA_I	prefetcha	[%r8, + 0x0a3c] %asi, #one_read
	.word 0xff222644  ! 251: STF_I	st	%f31, [0x0644, %r8]
	.word 0x8c4a0009  ! 252: MULX_R	mulx 	%r8, %r9, %r6
	.word 0x2c800001  ! 253: BNEG	bneg,a	<label_0x1>
	.word 0x0c800002  ! 254: BNEG	bneg  	<label_0x2>
	.word 0xd5f22009  ! 255: CASXA_R	casxa	[%r8]%asi, %r9, %r10
	.word 0x8fa209a9  ! 256: FDIVs	fdivs	%f8, %f9, %f7
	.word 0xcb220009  ! 257: STF_R	st	%f5, [%r9, %r8]
	.word 0xa24a0009  ! 258: MULX_R	mulx 	%r8, %r9, %r17
	.word 0xc87a0009  ! 259: SWAP_R	swap	%r4, [%r8 + %r9]
	.word 0xaa4a0009  ! 261: MULX_R	mulx 	%r8, %r9, %r21
	.word 0xdec21009  ! 262: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r15
	.word 0xc36a2888  ! 263: PREFETCH_I	prefetch	[%r8 + 0x0888], #one_read
	.word 0x896a0009  ! 264: SDIVX_R	sdivx	%r8, %r9, %r4
	.word 0xb5a20829  ! 265: FADDs	fadds	%f8, %f9, %f26
	.word 0x87a20829  ! 266: FADDs	fadds	%f8, %f9, %f3
	.word 0x8143e030  ! 268: MEMBAR	membar	#Lookaside | #MemIssue 
	.word 0xcaea2490  ! 269: LDSTUBA_I	ldstuba	%r5, [%r8 + 0x0490] %asi
	.word 0x22800002  ! 270: BE	be,a	<label_0x2>
	.word 0x82522b50  ! 271: UMUL_I	umul 	%r8, 0x0b50, %r1
	.word 0xb16a2388  ! 272: SDIVX_I	sdivx	%r8, 0x0388, %r24
	.word 0x8a5a0009  ! 273: SMUL_R	smul 	%r8, %r9, %r5
	.word 0xc6ca2034  ! 274: LDSBA_I	ldsba	[%r8, + 0x0034] %asi, %r3
	.word 0x84da2ed0  ! 275: SMULcc_I	smulcc 	%r8, 0x0ed0, %r2
	.word 0xe01a28c0  ! 276: LDD_I	ldd	[%r8 + 0x08c0], %r16
	.word 0x8143c000  ! 277: STBAR	stbar
	.word 0xf81a2ad8  ! 278: LDD_I	ldd	[%r8 + 0x0ad8], %r28
	.word 0xca5a2428  ! 279: LDX_I	ldx	[%r8 + 0x0428], %r5
	.word 0xc36a2498  ! 280: PREFETCH_I	prefetch	[%r8 + 0x0498], #one_read
	.word 0xc6122230  ! 281: LDUH_I	lduh	[%r8 + 0x0230], %r3
	.word 0x8143c000  ! 282: STBAR	stbar
	.word 0xac5a2180  ! 283: SMUL_I	smul 	%r8, 0x0180, %r22
	.word 0x8143e057  ! 284: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside | #Sync 
	.word 0xcaf22878  ! 285: STXA_I	stxa	%r5, [%r8 + 0x0878] %asi
	.word 0xfe7a0009  ! 286: SWAP_R	swap	%r31, [%r8 + %r9]
	.word 0x856a0009  ! 287: SDIVX_R	sdivx	%r8, %r9, %r2
	.word 0xf41a2cf0  ! 288: LDD_I	ldd	[%r8 + 0x0cf0], %r26
	.word 0x84522b38  ! 289: UMUL_I	umul 	%r8, 0x0b38, %r2
	.word 0x00800001  ! 290: BN	bn  	<label_0x1>
	.word 0x84fa0009  ! 291: SDIVcc_R	sdivcc 	%r8, %r9, %r2
	.word 0x847a0009  ! 292: SDIV_R	sdiv 	%r8, %r9, %r2
	.word 0xc3ea27ec  ! 293: PREFETCHA_I	prefetcha	[%r8, + 0x07ec] %asi, #one_read
	.word 0xc2ca1009  ! 295: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r1
	.word 0xc6ea22a8  ! 296: LDSTUBA_I	ldstuba	%r3, [%r8 + 0x02a8] %asi
	.word 0x8afa0009  ! 297: SDIVcc_R	sdivcc 	%r8, %r9, %r5
	.word 0x2cc20001  ! 298: BRGZ	brgz,a,nt	%8,<label_0x20001>
	.word 0x84520009  ! 299: UMUL_R	umul 	%r8, %r9, %r2
	.word 0xc8da1009  ! 301: LDXA_R	ldxa	[%r8, %r9] 0x80, %r4
	.word 0x9e5a2670  ! 302: SMUL_I	smul 	%r8, 0x0670, %r15
	.word 0x8143c000  ! 304: STBAR	stbar
	.word 0x8f222994  ! 305: MULScc_I	mulscc 	%r8, 0x0994, %r7
	.word 0xd6122440  ! 306: LDUH_I	lduh	[%r8 + 0x0440], %r11
	.word 0xceaa1009  ! 307: STBA_R	stba	%r7, [%r8 + %r9] 0x80
	.word 0x16800001  ! 308: BGE	bge  	<label_0x1>
	.word 0xb06a2260  ! 309: UDIVX_I	udivx 	%r8, 0x0260, %r24
	.word 0x8143e062  ! 310: MEMBAR	membar	#StoreLoad | #MemIssue | #Sync 
	.word 0xa7a20829  ! 311: FADDs	fadds	%f8, %f9, %f19
	.word 0xf3f22009  ! 312: CASXA_R	casxa	[%r8]%asi, %r9, %r25
	.word 0xfaca2c90  ! 313: LDSBA_I	ldsba	[%r8, + 0x0c90] %asi, %r29
	.word 0xc80a0009  ! 314: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0x8fa20829  ! 315: FADDs	fadds	%f8, %f9, %f7
	.word 0x826a2624  ! 316: UDIVX_I	udivx 	%r8, 0x0624, %r1
	.word 0xcc420009  ! 317: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0x84da2a74  ! 318: SMULcc_I	smulcc 	%r8, 0x0a74, %r2
	.word 0xc3ea2578  ! 319: PREFETCHA_I	prefetcha	[%r8, + 0x0578] %asi, #one_read
	.word 0x86720009  ! 321: UDIV_R	udiv 	%r8, %r9, %r3
	.word 0x864a216c  ! 323: MULX_I	mulx 	%r8, 0x016c, %r3
	.word 0x98fa0009  ! 324: SDIVcc_R	sdivcc 	%r8, %r9, %r12
	.word 0xce7a23c8  ! 325: SWAP_I	swap	%r7, [%r8 + 0x03c8]
	.word 0xc2ca2fbc  ! 326: LDSBA_I	ldsba	[%r8, + 0x0fbc] %asi, %r1
	.word 0x8143c000  ! 327: STBAR	stbar
	.word 0xcd3a28f8  ! 329: STDF_I	std	%f6, [0x08f8, %r8]
	.word 0x28800001  ! 330: BLEU	bleu,a	<label_0x1>
	.word 0xc6022480  ! 331: LDUW_I	lduw	[%r8 + 0x0480], %r3
	.word 0xcc6a2f44  ! 332: LDSTUB_I	ldstub	%r6, [%r8 + 0x0f44]
	.word 0xf4a22924  ! 333: STWA_I	stwa	%r26, [%r8 + 0x0924] %asi
	.word 0xe0da23d0  ! 334: LDXA_I	ldxa	[%r8, + 0x03d0] %asi, %r16
	.word 0xc4d22a24  ! 335: LDSHA_I	ldsha	[%r8, + 0x0a24] %asi, %r2
	.word 0xc6aa2348  ! 336: STBA_I	stba	%r3, [%r8 + 0x0348] %asi
	.word 0x847226b8  ! 337: UDIV_I	udiv 	%r8, 0x06b8, %r2
	.word 0x88d20009  ! 338: UMULcc_R	umulcc 	%r8, %r9, %r4
	.word 0xcdf22009  ! 339: CASXA_R	casxa	[%r8]%asi, %r9, %r6
	.word 0xcf2221c0  ! 340: STF_I	st	%f7, [0x01c0, %r8]
	.word 0x1e800002  ! 341: BVC	bvc  	<label_0x2>
	.word 0x9cd22274  ! 342: UMULcc_I	umulcc 	%r8, 0x0274, %r14
	.word 0xb6d22a88  ! 343: UMULcc_I	umulcc 	%r8, 0x0a88, %r27
	.word 0xf84a0009  ! 344: LDSB_R	ldsb	[%r8 + %r9], %r28
	.word 0x00800002  ! 345: BN	bn  	<label_0x2>
	.word 0x845a0009  ! 346: SMUL_R	smul 	%r8, %r9, %r2
	.word 0x2cc20001  ! 347: BRGZ	brgz,a,nt	%8,<label_0x20001>
	.word 0x8143c000  ! 348: STBAR	stbar
	.word 0xa9a208a9  ! 349: FSUBs	fsubs	%f8, %f9, %f20
	.word 0xae7a2688  ! 350: SDIV_I	sdiv 	%r8, 0x0688, %r23
	.word 0xc27a2244  ! 351: SWAP_I	swap	%r1, [%r8 + 0x0244]
	.word 0xc8c21009  ! 352: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r4
	.word 0xc4b22014  ! 353: STHA_I	stha	%r2, [%r8 + 0x0014] %asi
	.word 0x8e5a0009  ! 354: SMUL_R	smul 	%r8, %r9, %r7
	.word 0x8cfa0009  ! 355: SDIVcc_R	sdivcc 	%r8, %r9, %r6
	.word 0x85a208a9  ! 356: FSUBs	fsubs	%f8, %f9, %f2
	.word 0x8c7a27b0  ! 357: SDIV_I	sdiv 	%r8, 0x07b0, %r6
	.word 0xc36a2a14  ! 358: PREFETCH_I	prefetch	[%r8 + 0x0a14], #one_read
	.word 0xce5a0009  ! 359: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0x83a20929  ! 360: FMULs	fmuls	%f8, %f9, %f1
	.word 0xe53a2710  ! 361: STDF_I	std	%f18, [0x0710, %r8]
	.word 0xf4aa2a98  ! 362: STBA_I	stba	%r26, [%r8 + 0x0a98] %asi
	.word 0x8a4a28d0  ! 364: MULX_I	mulx 	%r8, 0x08d0, %r5
	.word 0xca1222e8  ! 365: LDUH_I	lduh	[%r8 + 0x02e8], %r5
	.word 0x8e7a2810  ! 366: SDIV_I	sdiv 	%r8, 0x0810, %r7
	.word 0x872229f8  ! 367: MULScc_I	mulscc 	%r8, 0x09f8, %r3
	.word 0xc2022d24  ! 368: LDUW_I	lduw	[%r8 + 0x0d24], %r1
	.word 0x8143e071  ! 369: MEMBAR	membar	#LoadLoad | #Lookaside | #MemIssue | #Sync 
	.word 0xc5220009  ! 370: STF_R	st	%f2, [%r9, %r8]
	.word 0xc36a2498  ! 371: PREFETCH_I	prefetch	[%r8 + 0x0498], #one_read
	.word 0xc27a2df4  ! 372: SWAP_I	swap	%r1, [%r8 + 0x0df4]
	.word 0xc2a22c0c  ! 373: STWA_I	stwa	%r1, [%r8 + 0x0c0c] %asi
	.word 0xfec21009  ! 374: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r31
	.word 0x8143c000  ! 375: STBAR	stbar
	.word 0x865a2e44  ! 376: SMUL_I	smul 	%r8, 0x0e44, %r3
	.word 0xc6aa1009  ! 377: STBA_R	stba	%r3, [%r8 + %r9] 0x80
	.word 0x18800001  ! 378: BGU	bgu  	<label_0x1>
	.word 0x8143e016  ! 379: MEMBAR	membar	#StoreLoad | #LoadStore | #Lookaside 
	.word 0xdaa21009  ! 380: STWA_R	stwa	%r13, [%r8 + %r9] 0x80
	.word 0xa66a0009  ! 381: UDIVX_R	udivx 	%r8, %r9, %r19
	.word 0x0c800002  ! 382: BNEG	bneg  	<label_0x2>
	.word 0xcca21009  ! 383: STWA_R	stwa	%r6, [%r8 + %r9] 0x80
	.word 0x8143e00f  ! 384: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore 
	.word 0x82f20009  ! 385: UDIVcc_R	udivcc 	%r8, %r9, %r1
	.word 0xcbe21009  ! 386: CASA_I	casa	[%r8] 0x80, %r9, %r5
	.word 0x8ed20009  ! 387: UMULcc_R	umulcc 	%r8, %r9, %r7
	.word 0xc36a285c  ! 388: PREFETCH_I	prefetch	[%r8 + 0x085c], #one_read
	.word 0xcc821009  ! 389: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r6
	.word 0xceca1009  ! 391: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r7
	.word 0x8143c000  ! 392: STBAR	stbar
	.word 0xcc7a0009  ! 394: SWAP_R	swap	%r6, [%r8 + %r9]
	.word 0x8143c000  ! 395: STBAR	stbar
	.word 0x887a0009  ! 396: SDIV_R	sdiv 	%r8, %r9, %r4
	.word 0xc60a0009  ! 397: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0x8e4a0009  ! 398: MULX_R	mulx 	%r8, %r9, %r7
	.word 0x0a800002  ! 399: BCS	bcs  	<label_0x2>
	.word 0xc48227f8  ! 400: LDUWA_I	lduwa	[%r8, + 0x07f8] %asi, %r2
	.word 0x2e800002  ! 401: BVS	bvs,a	<label_0x2>
	.word 0x82d223e4  ! 402: UMULcc_I	umulcc 	%r8, 0x03e4, %r1
	.word 0xc33a0009  ! 403: STDF_R	std	%f1, [%r9, %r8]
	.word 0x965a209c  ! 404: SMUL_I	smul 	%r8, 0x009c, %r11
	.word 0x0cc20001  ! 405: BRGZ	brgz  ,nt	%8,<label_0x20001>
	.word 0x1a800001  ! 406: BCC	bcc  	<label_0x1>
	.word 0xe89a24b8  ! 407: LDDA_I	ldda	[%r8, + 0x04b8] %asi, %r20
	.word 0x8143c000  ! 408: STBAR	stbar
	.word 0xccda2b20  ! 409: LDXA_I	ldxa	[%r8, + 0x0b20] %asi, %r6
	.word 0xfd3a0009  ! 410: STDF_R	std	%f30, [%r9, %r8]
	.word 0xcc5a0009  ! 411: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0x8143e073  ! 412: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside | #MemIssue | #Sync 
	.word 0xcaf21009  ! 413: STXA_R	stxa	%r5, [%r8 + %r9] 0x80
	.word 0x824a2090  ! 414: MULX_I	mulx 	%r8, 0x0090, %r1
	.word 0xccd21009  ! 415: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r6
	.word 0xc9f22009  ! 416: CASXA_R	casxa	[%r8]%asi, %r9, %r4
	.word 0xa84a2318  ! 417: MULX_I	mulx 	%r8, 0x0318, %r20
	.word 0x8143c000  ! 418: STBAR	stbar
	.word 0xe4da2d58  ! 419: LDXA_I	ldxa	[%r8, + 0x0d58] %asi, %r18
	.word 0x8ba20829  ! 420: FADDs	fadds	%f8, %f9, %f5
	.word 0xc3220009  ! 421: STF_R	st	%f1, [%r9, %r8]
	.word 0x2cc20001  ! 422: BRGZ	brgz,a,nt	%8,<label_0x20001>
	.word 0x8143e065  ! 423: MEMBAR	membar	#LoadLoad | #LoadStore | #MemIssue | #Sync 
	.word 0xcaea2630  ! 424: LDSTUBA_I	ldstuba	%r5, [%r8 + 0x0630] %asi
	.word 0x0ec20001  ! 425: BRGEZ	brgez  ,nt	%8,<label_0x20001>
	.word 0xc8ca20bc  ! 426: LDSBA_I	ldsba	[%r8, + 0x00bc] %asi, %r4
	.word 0xc26a29e0  ! 427: LDSTUB_I	ldstub	%r1, [%r8 + 0x09e0]
	.word 0xc5220009  ! 428: STF_R	st	%f2, [%r9, %r8]
	.word 0xc73a25e8  ! 429: STDF_I	std	%f3, [0x05e8, %r8]
	.word 0x8143e029  ! 430: MEMBAR	membar	#LoadLoad | #StoreStore | #MemIssue 
	.word 0x8af20009  ! 431: UDIVcc_R	udivcc 	%r8, %r9, %r5
	.word 0x8c5a0009  ! 432: SMUL_R	smul 	%r8, %r9, %r6
	.word 0xce020009  ! 433: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xcaf22780  ! 434: STXA_I	stxa	%r5, [%r8 + 0x0780] %asi
	.word 0xc4aa23a8  ! 435: STBA_I	stba	%r2, [%r8 + 0x03a8] %asi
	.word 0xc73a22a8  ! 436: STDF_I	std	%f3, [0x02a8, %r8]
	.word 0xc3ea2b94  ! 437: PREFETCHA_I	prefetcha	[%r8, + 0x0b94] %asi, #one_read
	.word 0x8143e010  ! 438: MEMBAR	membar	#Lookaside 
	.word 0x8fa209a9  ! 439: FDIVs	fdivs	%f8, %f9, %f7
	.word 0x8143e025  ! 440: MEMBAR	membar	#LoadLoad | #LoadStore | #MemIssue 
	.word 0x8da208a9  ! 441: FSUBs	fsubs	%f8, %f9, %f6
	.word 0x8a720009  ! 442: UDIV_R	udiv 	%r8, %r9, %r5
	.word 0xc4ca20b4  ! 443: LDSBA_I	ldsba	[%r8, + 0x00b4] %asi, %r2
	.word 0xcb3a0009  ! 444: STDF_R	std	%f5, [%r9, %r8]
	.word 0x9ef224ec  ! 445: UDIVcc_I	udivcc 	%r8, 0x04ec, %r15
	.word 0xc6fa1009  ! 446: SWAPA_R	swapa	%r3, [%r8 + %r9] 0x80
	.word 0x846a0009  ! 447: UDIVX_R	udivx 	%r8, %r9, %r2
	.word 0xc8120009  ! 448: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xfb3a29d8  ! 449: STDF_I	std	%f29, [0x09d8, %r8]
	.word 0xccf22498  ! 450: STXA_I	stxa	%r6, [%r8 + 0x0498] %asi
	.word 0xccc21009  ! 451: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r6
	.word 0xc8ca1009  ! 452: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r4
	.word 0x1c800002  ! 453: BPOS	bpos  	<label_0x2>
	.word 0x8143e036  ! 454: MEMBAR	membar	#StoreLoad | #LoadStore | #Lookaside | #MemIssue 
	.word 0xfc921009  ! 455: LDUHA_R	lduha	[%r8, %r9] 0x80, %r30
	.word 0xc3ea240c  ! 456: PREFETCHA_I	prefetcha	[%r8, + 0x040c] %asi, #one_read
	.word 0xccfa2d48  ! 457: SWAPA_I	swapa	%r6, [%r8 + 0x0d48] %asi
	.word 0x8ba208a9  ! 458: FSUBs	fsubs	%f8, %f9, %f5
	.word 0x8143e02c  ! 459: MEMBAR	membar	#LoadStore | #StoreStore | #MemIssue 
	.word 0x1a800001  ! 462: BCC	bcc  	<label_0x1>
	.word 0xc8aa2ff8  ! 463: STBA_I	stba	%r4, [%r8 + 0x0ff8] %asi
	.word 0x20800002  ! 464: BN	bn,a	<label_0x2>
	.word 0x88f22fc8  ! 465: UDIVcc_I	udivcc 	%r8, 0x0fc8, %r4
	.word 0xc4f21009  ! 466: STXA_R	stxa	%r2, [%r8 + %r9] 0x80
	.word 0xd4ba2298  ! 467: STDA_I	stda	%r10, [%r8 + 0x0298] %asi
	.word 0xf4ba24c0  ! 468: STDA_I	stda	%r26, [%r8 + 0x04c0] %asi
	.word 0x2aca0001  ! 469: BRNZ	brnz,a,pt	%8,<label_0xa0001>
	.word 0xd48a1009  ! 470: LDUBA_R	lduba	[%r8, %r9] 0x80, %r10
	.word 0xc44a0009  ! 471: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0x0cca0001  ! 472: BRGZ	brgz  ,pt	%8,<label_0xa0001>
	.word 0xe4d229f0  ! 473: LDSHA_I	ldsha	[%r8, + 0x09f0] %asi, %r18
	.word 0xe0aa2f3c  ! 474: STBA_I	stba	%r16, [%r8 + 0x0f3c] %asi
	.word 0xc6ea1009  ! 475: LDSTUBA_R	ldstuba	%r3, [%r8 + %r9] 0x80
	.word 0x8143e054  ! 476: MEMBAR	membar	#LoadStore | #Lookaside | #Sync 
	.word 0xfbe22009  ! 477: CASA_R	casa	[%r8] %asi, %r9, %r29
	.word 0xc36a266c  ! 478: PREFETCH_I	prefetch	[%r8 + 0x066c], #one_read
	.word 0xcaa21009  ! 479: STWA_R	stwa	%r5, [%r8 + %r9] 0x80
	.word 0x8e5a0009  ! 480: SMUL_R	smul 	%r8, %r9, %r7
	.word 0xc53a2188  ! 481: STDF_I	std	%f2, [0x0188, %r8]
	.word 0x8143e05f  ! 482: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0xfc9a1009  ! 483: LDDA_R	ldda	[%r8, %r9] 0x80, %r30
	.word 0xc86a0009  ! 485: LDSTUB_R	ldstub	%r4, [%r8 + %r9]
	.word 0x2ac20001  ! 486: BRNZ	brnz,a,nt	%8,<label_0x20001>
	.word 0x8143c000  ! 487: STBAR	stbar
	.word 0xc41a26d8  ! 488: LDD_I	ldd	[%r8 + 0x06d8], %r2
	.word 0x876a2428  ! 489: SDIVX_I	sdivx	%r8, 0x0428, %r3
	.word 0xd9220009  ! 490: STF_R	st	%f12, [%r9, %r8]
	.word 0xa6f229a8  ! 491: UDIVcc_I	udivcc 	%r8, 0x09a8, %r19
	.word 0xc6a22448  ! 492: STWA_I	stwa	%r3, [%r8 + 0x0448] %asi
	.word 0xfcfa1009  ! 493: SWAPA_R	swapa	%r30, [%r8 + %r9] 0x80
	.word 0xc36a2b18  ! 494: PREFETCH_I	prefetch	[%r8 + 0x0b18], #one_read
	.word 0x8da20829  ! 495: FADDs	fadds	%f8, %f9, %f6
	.word 0xcc7a0009  ! 496: SWAP_R	swap	%r6, [%r8 + %r9]
	.word 0x8143c000  ! 497: STBAR	stbar
	.word 0xa44a0009  ! 498: MULX_R	mulx 	%r8, %r9, %r18
	.word 0xeaea2104  ! 499: LDSTUBA_I	ldstuba	%r21, [%r8 + 0x0104] %asi
	.word 0xe0c225f8  ! 501: LDSWA_I	ldswa	[%r8, + 0x05f8] %asi, %r16
	.word 0xe4122914  ! 502: LDUH_I	lduh	[%r8 + 0x0914], %r18
	.word 0x3e800002  ! 504: BVC	bvc,a	<label_0x2>
	.word 0xc65a0009  ! 505: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xcb220009  ! 506: STF_R	st	%f5, [%r9, %r8]
	.word 0x8143e074  ! 507: MEMBAR	membar	#LoadStore | #Lookaside | #MemIssue | #Sync 
	.word 0xe2ea1009  ! 508: LDSTUBA_R	ldstuba	%r17, [%r8 + %r9] 0x80
	.word 0x8c7a2238  ! 509: SDIV_I	sdiv 	%r8, 0x0238, %r6
	.word 0xe86a278c  ! 510: LDSTUB_I	ldstub	%r20, [%r8 + 0x078c]
	.word 0xc2b21009  ! 511: STHA_R	stha	%r1, [%r8 + %r9] 0x80
	.word 0xceb22720  ! 512: STHA_I	stha	%r7, [%r8 + 0x0720] %asi
	.word 0xcc7a0009  ! 513: SWAP_R	swap	%r6, [%r8 + %r9]
	.word 0xfe020009  ! 514: LDUW_R	lduw	[%r8 + %r9], %r31
	.word 0x836a0009  ! 515: SDIVX_R	sdivx	%r8, %r9, %r1
	.word 0x885a0009  ! 516: SMUL_R	smul 	%r8, %r9, %r4
	.word 0x8143c000  ! 517: STBAR	stbar
	.word 0xbe5a0009  ! 518: SMUL_R	smul 	%r8, %r9, %r31
	.word 0xcde21009  ! 519: CASA_I	casa	[%r8] 0x80, %r9, %r6
	.word 0xc36a2fb4  ! 520: PREFETCH_I	prefetch	[%r8 + 0x0fb4], #one_read
	.word 0x845a0009  ! 521: SMUL_R	smul 	%r8, %r9, %r2
	.word 0x8143c000  ! 522: STBAR	stbar
	.word 0xc24a2540  ! 523: LDSB_I	ldsb	[%r8 + 0x0540], %r1
	.word 0xc5222dd8  ! 524: STF_I	st	%f2, [0x0dd8, %r8]
	.word 0x846a0009  ! 525: UDIVX_R	udivx 	%r8, %r9, %r2
	.word 0xcb3a0009  ! 526: STDF_R	std	%f5, [%r9, %r8]
	.word 0x10800002  ! 527: BA	ba  	<label_0x2>
	.word 0x8143c000  ! 528: STBAR	stbar
	.word 0xf09a2c60  ! 530: LDDA_I	ldda	[%r8, + 0x0c60] %asi, %r24
	.word 0xc44a26b0  ! 531: LDSB_I	ldsb	[%r8 + 0x06b0], %r2
	.word 0x8da20829  ! 532: FADDs	fadds	%f8, %f9, %f6
	.word 0xc3ea2294  ! 533: PREFETCHA_I	prefetcha	[%r8, + 0x0294] %asi, #one_read
	.word 0xe9e21009  ! 534: CASA_I	casa	[%r8] 0x80, %r9, %r20
	.word 0x8143c000  ! 535: STBAR	stbar
	.word 0x34800001  ! 536: BG	bg,a	<label_0x1>
	.word 0xcc5a2b18  ! 537: LDX_I	ldx	[%r8 + 0x0b18], %r6
	.word 0xf8fa2354  ! 538: SWAPA_I	swapa	%r28, [%r8 + 0x0354] %asi
	.word 0xa27a22dc  ! 539: SDIV_I	sdiv 	%r8, 0x02dc, %r17
	.word 0xafa20929  ! 540: FMULs	fmuls	%f8, %f9, %f23
	.word 0xc8ea1009  ! 541: LDSTUBA_R	ldstuba	%r4, [%r8 + %r9] 0x80
	.word 0xb0da2434  ! 542: SMULcc_I	smulcc 	%r8, 0x0434, %r24
	.word 0xc6ea1009  ! 543: LDSTUBA_R	ldstuba	%r3, [%r8 + %r9] 0x80
	.word 0xc2822c68  ! 544: LDUWA_I	lduwa	[%r8, + 0x0c68] %asi, %r1
	.word 0x8143c000  ! 545: STBAR	stbar
	.word 0x40000001  ! 546: CALL	call	disp30_1
	.word 0xcc821009  ! 547: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r6
	.word 0x0a800001  ! 548: BCS	bcs  	<label_0x1>
	.word 0xd93a0009  ! 549: STDF_R	std	%f12, [%r9, %r8]
	.word 0xce821009  ! 550: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r7
	.word 0x8c5a0009  ! 551: SMUL_R	smul 	%r8, %r9, %r6
	.word 0xecba1009  ! 552: STDA_R	stda	%r22, [%r8 + %r9] 0x80
	.word 0x8143e00e  ! 553: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore 
	.word 0xba6a0009  ! 554: UDIVX_R	udivx 	%r8, %r9, %r29
	.word 0xe41a28b8  ! 555: LDD_I	ldd	[%r8 + 0x08b8], %r18
	.word 0x8e52229c  ! 556: UMUL_I	umul 	%r8, 0x029c, %r7
	.word 0x2a800001  ! 557: BCS	bcs,a	<label_0x1>
	.word 0xc36a21c4  ! 558: PREFETCH_I	prefetch	[%r8 + 0x01c4], #one_read
	.word 0x876a0009  ! 559: SDIVX_R	sdivx	%r8, %r9, %r3
	.word 0xc5222174  ! 560: STF_I	st	%f2, [0x0174, %r8]
	.word 0xe6022e38  ! 562: LDUW_I	lduw	[%r8 + 0x0e38], %r19
	.word 0x8c722684  ! 563: UDIV_I	udiv 	%r8, 0x0684, %r6
	.word 0x87a209a9  ! 564: FDIVs	fdivs	%f8, %f9, %f3
	.word 0xe0ba2708  ! 565: STDA_I	stda	%r16, [%r8 + 0x0708] %asi
	.word 0xeff21009  ! 566: CASXA_I	casxa	[%r8] 0x80, %r9, %r23
	.word 0xf46a0009  ! 567: LDSTUB_R	ldstub	%r26, [%r8 + %r9]
	.word 0xd47a2dc4  ! 568: SWAP_I	swap	%r10, [%r8 + 0x0dc4]
	.word 0xa0d22148  ! 569: UMULcc_I	umulcc 	%r8, 0x0148, %r16
	.word 0xcc4222b8  ! 570: LDSW_I	ldsw	[%r8 + 0x02b8], %r6
	.word 0x827a0009  ! 571: SDIV_R	sdiv 	%r8, %r9, %r1
	.word 0x22800002  ! 572: BE	be,a	<label_0x2>
	.word 0x896a0009  ! 573: SDIVX_R	sdivx	%r8, %r9, %r4
	.word 0xc36a2998  ! 574: PREFETCH_I	prefetch	[%r8 + 0x0998], #one_read
	.word 0x22ca0001  ! 575: BRZ	brz,a,pt	%8,<label_0xa0001>
	.word 0xf89a1009  ! 577: LDDA_R	ldda	[%r8, %r9] 0x80, %r28
	.word 0xcec21009  ! 578: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r7
	.word 0xc9e22009  ! 579: CASA_R	casa	[%r8] %asi, %r9, %r4
	.word 0xe0ba2de8  ! 580: STDA_I	stda	%r16, [%r8 + 0x0de8] %asi
	.word 0xff3a0009  ! 581: STDF_R	std	%f31, [%r9, %r8]
	.word 0x8fa209a9  ! 582: FDIVs	fdivs	%f8, %f9, %f7
	.word 0xcc522b2c  ! 583: LDSH_I	ldsh	[%r8 + 0x0b2c], %r6
	.word 0xc2f21009  ! 584: STXA_R	stxa	%r1, [%r8 + %r9] 0x80
	.word 0x22ca0001  ! 585: BRZ	brz,a,pt	%8,<label_0xa0001>
	.word 0xc67a0009  ! 586: SWAP_R	swap	%r3, [%r8 + %r9]
	.word 0x87220009  ! 587: MULScc_R	mulscc 	%r8, %r9, %r3
	.word 0x844a0009  ! 588: MULX_R	mulx 	%r8, %r9, %r2
	.word 0x22c20001  ! 589: BRZ	brz,a,nt	%8,<label_0x20001>
	.word 0xaa722914  ! 590: UDIV_I	udiv 	%r8, 0x0914, %r21
	.word 0xa85222a4  ! 591: UMUL_I	umul 	%r8, 0x02a4, %r20
	.word 0xab6a0009  ! 592: SDIVX_R	sdivx	%r8, %r9, %r21
	.word 0xc36a23c4  ! 593: PREFETCH_I	prefetch	[%r8 + 0x03c4], #one_read
	.word 0xee4a0009  ! 594: LDSB_R	ldsb	[%r8 + %r9], %r23
	.word 0xa0520009  ! 595: UMUL_R	umul 	%r8, %r9, %r16
	.word 0xc81a2690  ! 596: LDD_I	ldd	[%r8 + 0x0690], %r4
	.word 0xf0ba2110  ! 597: STDA_I	stda	%r24, [%r8 + 0x0110] %asi
	.word 0x20800001  ! 598: BN	bn,a	<label_0x1>
	.word 0x04800002  ! 599: BLE	ble  	<label_0x2>
	.word 0xcaaa25a0  ! 600: STBA_I	stba	%r5, [%r8 + 0x05a0] %asi
	.word 0x84522950  ! 601: UMUL_I	umul 	%r8, 0x0950, %r2
	.word 0xcff21009  ! 602: CASXA_I	casxa	[%r8] 0x80, %r9, %r7
	.word 0xc6ea1009  ! 605: LDSTUBA_R	ldstuba	%r3, [%r8 + %r9] 0x80
	.word 0xcd3a2fe8  ! 606: STDF_I	std	%f6, [0x0fe8, %r8]
	.word 0x8ada25d8  ! 607: SMULcc_I	smulcc 	%r8, 0x05d8, %r5
	.word 0xd4b22c54  ! 608: STHA_I	stha	%r10, [%r8 + 0x0c54] %asi
	.word 0xc33a26f8  ! 609: STDF_I	std	%f1, [0x06f8, %r8]
	.word 0x82520009  ! 610: UMUL_R	umul 	%r8, %r9, %r1
	.word 0xc46a0009  ! 611: LDSTUB_R	ldstub	%r2, [%r8 + %r9]
	.word 0xea6a0009  ! 612: LDSTUB_R	ldstub	%r21, [%r8 + %r9]
	.word 0x866a2a4c  ! 613: UDIVX_I	udivx 	%r8, 0x0a4c, %r3
	.word 0xcef22b58  ! 614: STXA_I	stxa	%r7, [%r8 + 0x0b58] %asi
	.word 0xc36a207c  ! 615: PREFETCH_I	prefetch	[%r8 + 0x007c], #one_read
	.word 0xca4a0009  ! 616: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0x28800001  ! 618: BLEU	bleu,a	<label_0x1>
	.word 0xca5a27a0  ! 619: LDX_I	ldx	[%r8 + 0x07a0], %r5
	.word 0x2aca0001  ! 620: BRNZ	brnz,a,pt	%8,<label_0xa0001>
	.word 0xba6a23a4  ! 621: UDIVX_I	udivx 	%r8, 0x03a4, %r29
	.word 0xcca2257c  ! 622: STWA_I	stwa	%r6, [%r8 + 0x057c] %asi
	.word 0x8ba209a9  ! 623: FDIVs	fdivs	%f8, %f9, %f5
	.word 0xf05a2788  ! 624: LDX_I	ldx	[%r8 + 0x0788], %r24
	.word 0xc88a2b14  ! 625: LDUBA_I	lduba	[%r8, + 0x0b14] %asi, %r4
	.word 0xee7a0009  ! 627: SWAP_R	swap	%r23, [%r8 + %r9]
	.word 0x9da20929  ! 628: FMULs	fmuls	%f8, %f9, %f14
	.word 0x8fa20829  ! 629: FADDs	fadds	%f8, %f9, %f7
	.word 0x8ed20009  ! 630: UMULcc_R	umulcc 	%r8, %r9, %r7
	.word 0xc9f22009  ! 631: CASXA_R	casxa	[%r8]%asi, %r9, %r4
	.word 0xcef220e8  ! 632: STXA_I	stxa	%r7, [%r8 + 0x00e8] %asi
	.word 0x8a522774  ! 633: UMUL_I	umul 	%r8, 0x0774, %r5
	.word 0x8143e012  ! 634: MEMBAR	membar	#StoreLoad | #Lookaside 
	.word 0xca821009  ! 635: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r5
	.word 0xc5f22009  ! 636: CASXA_R	casxa	[%r8]%asi, %r9, %r2
	.word 0xc2020009  ! 637: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xcc8a2148  ! 638: LDUBA_I	lduba	[%r8, + 0x0148] %asi, %r6
	.word 0xc4a22474  ! 639: STWA_I	stwa	%r2, [%r8 + 0x0474] %asi
	.word 0xe7e22009  ! 640: CASA_R	casa	[%r8] %asi, %r9, %r19
	.word 0xc3ea2898  ! 641: PREFETCHA_I	prefetcha	[%r8, + 0x0898] %asi, #one_read
	.word 0x85a209a9  ! 642: FDIVs	fdivs	%f8, %f9, %f2
	.word 0xc8122a3c  ! 643: LDUH_I	lduh	[%r8 + 0x0a3c], %r4
	.word 0xccf22710  ! 644: STXA_I	stxa	%r6, [%r8 + 0x0710] %asi
	.word 0x8143c000  ! 645: STBAR	stbar
	.word 0xb2522584  ! 646: UMUL_I	umul 	%r8, 0x0584, %r25
	.word 0x8143c000  ! 647: STBAR	stbar
	.word 0xde821009  ! 648: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r15
	.word 0xae4a2608  ! 649: MULX_I	mulx 	%r8, 0x0608, %r23
	.word 0x89220009  ! 650: MULScc_R	mulscc 	%r8, %r9, %r4
	.word 0x826a0009  ! 651: UDIVX_R	udivx 	%r8, %r9, %r1
	.word 0xc8921009  ! 652: LDUHA_R	lduha	[%r8, %r9] 0x80, %r4
	.word 0xff3a0009  ! 653: STDF_R	std	%f31, [%r9, %r8]
	.word 0x26c20001  ! 654: BRLZ	brlz,a,nt	%8,<label_0x20001>
	.word 0x82522658  ! 655: UMUL_I	umul 	%r8, 0x0658, %r1
	.word 0x844a0009  ! 656: MULX_R	mulx 	%r8, %r9, %r2
	.word 0x16800002  ! 657: BGE	bge  	<label_0x2>
	.word 0xc8da2bc0  ! 658: LDXA_I	ldxa	[%r8, + 0x0bc0] %asi, %r4
	.word 0xc3ea2aa0  ! 659: PREFETCHA_I	prefetcha	[%r8, + 0x0aa0] %asi, #one_read
	.word 0xe8ba1009  ! 660: STDA_R	stda	%r20, [%r8 + %r9] 0x80
	.word 0x86d20009  ! 661: UMULcc_R	umulcc 	%r8, %r9, %r3
	.word 0xcaca2db0  ! 662: LDSBA_I	ldsba	[%r8, + 0x0db0] %asi, %r5
	.word 0xda422148  ! 663: LDSW_I	ldsw	[%r8 + 0x0148], %r13
	.word 0xcf2228b8  ! 664: STF_I	st	%f7, [0x08b8, %r8]
	.word 0xb24a0009  ! 666: MULX_R	mulx 	%r8, %r9, %r25
	.word 0x89a20829  ! 667: FADDs	fadds	%f8, %f9, %f4
	.word 0x8143e055  ! 668: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside | #Sync 
	.word 0xcc821009  ! 669: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r6
	.word 0x04ca0001  ! 670: BRLEZ	brlez  ,pt	%8,<label_0xa0001>
	.word 0xcd220009  ! 671: STF_R	st	%f6, [%r9, %r8]
	.word 0x99220009  ! 672: MULScc_R	mulscc 	%r8, %r9, %r12
	.word 0xa4f22c78  ! 673: UDIVcc_I	udivcc 	%r8, 0x0c78, %r18
	.word 0xc36a2210  ! 674: PREFETCH_I	prefetch	[%r8 + 0x0210], #one_read
	.word 0xe8ba1009  ! 675: STDA_R	stda	%r20, [%r8 + %r9] 0x80
	.word 0xe4120009  ! 676: LDUH_R	lduh	[%r8 + %r9], %r18
	.word 0x8143e057  ! 677: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside | #Sync 
	.word 0x8143c000  ! 678: STBAR	stbar
	.word 0xe8aa1009  ! 679: STBA_R	stba	%r20, [%r8 + %r9] 0x80
	.word 0xcaea1009  ! 680: LDSTUBA_R	ldstuba	%r5, [%r8 + %r9] 0x80
	.word 0xc89a1009  ! 681: LDDA_R	ldda	[%r8, %r9] 0x80, %r4
	.word 0xc4ea1009  ! 682: LDSTUBA_R	ldstuba	%r2, [%r8 + %r9] 0x80
	.word 0x8e52283c  ! 683: UMUL_I	umul 	%r8, 0x083c, %r7
	.word 0xb85a0009  ! 684: SMUL_R	smul 	%r8, %r9, %r28
	.word 0x8143e065  ! 686: MEMBAR	membar	#LoadLoad | #LoadStore | #MemIssue | #Sync 
	.word 0xc3ea2d78  ! 687: PREFETCHA_I	prefetcha	[%r8, + 0x0d78] %asi, #one_read
	.word 0xfa6a0009  ! 688: LDSTUB_R	ldstub	%r29, [%r8 + %r9]
	.word 0xba6a0009  ! 689: UDIVX_R	udivx 	%r8, %r9, %r29
	.word 0x08800001  ! 690: BLEU	bleu  	<label_0x1>
	.word 0x0ec20001  ! 691: BRGEZ	brgez  ,nt	%8,<label_0x20001>
	.word 0x99220009  ! 693: MULScc_R	mulscc 	%r8, %r9, %r12
	.word 0xccca1009  ! 694: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r6
	.word 0x26800002  ! 695: BL	bl,a	<label_0x2>
	.word 0xc24226f8  ! 696: LDSW_I	ldsw	[%r8 + 0x06f8], %r1
	.word 0xc8020009  ! 697: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xde6a26dc  ! 698: LDSTUB_I	ldstub	%r15, [%r8 + 0x06dc]
	.word 0xc4c21009  ! 699: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r2
	.word 0x8143c000  ! 700: STBAR	stbar
	.word 0x885a2da0  ! 701: SMUL_I	smul 	%r8, 0x0da0, %r4
	.word 0x30800002  ! 702: BA	ba,a	<label_0x2>
	.word 0xc53a0009  ! 703: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc45a2e18  ! 704: LDX_I	ldx	[%r8 + 0x0e18], %r2
	.word 0xcaf21009  ! 705: STXA_R	stxa	%r5, [%r8 + %r9] 0x80
	.word 0x8143e02a  ! 706: MEMBAR	membar	#StoreLoad | #StoreStore | #MemIssue 
	.word 0xcada2d70  ! 707: LDXA_I	ldxa	[%r8, + 0x0d70] %asi, %r5
	.word 0xc5222594  ! 708: STF_I	st	%f2, [0x0594, %r8]
	.word 0xca5a0009  ! 709: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xc3ea2cf8  ! 710: PREFETCHA_I	prefetcha	[%r8, + 0x0cf8] %asi, #one_read
	.word 0xded21009  ! 711: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r15
	.word 0x826a22e0  ! 712: UDIVX_I	udivx 	%r8, 0x02e0, %r1
	.word 0x99222290  ! 713: MULScc_I	mulscc 	%r8, 0x0290, %r12
	.word 0x8e7a20c4  ! 714: SDIV_I	sdiv 	%r8, 0x00c4, %r7
	.word 0xc45a25d0  ! 715: LDX_I	ldx	[%r8 + 0x05d0], %r2
	.word 0x8143e03c  ! 716: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0xccb22ed0  ! 717: STHA_I	stha	%r6, [%r8 + 0x0ed0] %asi
	.word 0x86522bf8  ! 718: UMUL_I	umul 	%r8, 0x0bf8, %r3
	.word 0xc87a27c8  ! 719: SWAP_I	swap	%r4, [%r8 + 0x07c8]
	.word 0x8143e052  ! 720: MEMBAR	membar	#StoreLoad | #Lookaside | #Sync 
	.word 0x3a800001  ! 721: BCC	bcc,a	<label_0x1>
	.word 0x884a2100  ! 722: MULX_I	mulx 	%r8, 0x0100, %r4
	.word 0xfb220009  ! 723: STF_R	st	%f29, [%r9, %r8]
	.word 0x8143c000  ! 724: STBAR	stbar
	.word 0x8143e025  ! 725: MEMBAR	membar	#LoadLoad | #LoadStore | #MemIssue 
	.word 0xc4122130  ! 726: LDUH_I	lduh	[%r8 + 0x0130], %r2
	.word 0xc3f22009  ! 727: CASXA_R	casxa	[%r8]%asi, %r9, %r1
	.word 0xd41a0009  ! 728: LDD_R	ldd	[%r8 + %r9], %r10
	.word 0xcc9a2048  ! 729: LDDA_I	ldda	[%r8, + 0x0048] %asi, %r6
	.word 0x8143e062  ! 730: MEMBAR	membar	#StoreLoad | #MemIssue | #Sync 
	.word 0xa96a0009  ! 731: SDIVX_R	sdivx	%r8, %r9, %r20
	.word 0x8ba208a9  ! 732: FSUBs	fsubs	%f8, %f9, %f5
	.word 0xec020009  ! 733: LDUW_R	lduw	[%r8 + %r9], %r22
	.word 0xc6aa2408  ! 734: STBA_I	stba	%r3, [%r8 + 0x0408] %asi
	.word 0xc60a25c8  ! 735: LDUB_I	ldub	[%r8 + 0x05c8], %r3
	.word 0x88522dd8  ! 736: UMUL_I	umul 	%r8, 0x0dd8, %r4
	.word 0x8143c000  ! 737: STBAR	stbar
	.word 0xccaa1009  ! 738: STBA_R	stba	%r6, [%r8 + %r9] 0x80
	.word 0xc2aa22d4  ! 739: STBA_I	stba	%r1, [%r8 + 0x02d4] %asi
	.word 0xbc522748  ! 740: UMUL_I	umul 	%r8, 0x0748, %r30
	.word 0x8ada0009  ! 741: SMULcc_R	smulcc 	%r8, %r9, %r5
	.word 0xc36a2ec4  ! 742: PREFETCH_I	prefetch	[%r8 + 0x0ec4], #one_read
	.word 0x38800001  ! 743: BGU	bgu,a	<label_0x1>
	.word 0x8143e046  ! 744: MEMBAR	membar	#StoreLoad | #LoadStore | #Sync 
	.word 0xf81a2798  ! 745: LDD_I	ldd	[%r8 + 0x0798], %r28
	.word 0xc4120009  ! 746: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xcaea27e0  ! 747: LDSTUBA_I	ldstuba	%r5, [%r8 + 0x07e0] %asi
	.word 0xcc0a0009  ! 748: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0x8143c000  ! 749: STBAR	stbar
	.word 0x8b6a2f6c  ! 750: SDIVX_I	sdivx	%r8, 0x0f6c, %r5
	.word 0x16800002  ! 751: BGE	bge  	<label_0x2>
	.word 0xc53a2210  ! 752: STDF_I	std	%f2, [0x0210, %r8]
	.word 0xcbe21009  ! 753: CASA_I	casa	[%r8] 0x80, %r9, %r5
	.word 0xcc5a2620  ! 754: LDX_I	ldx	[%r8 + 0x0620], %r6
	.word 0x8143c000  ! 755: STBAR	stbar
	.word 0x0ec20001  ! 756: BRGEZ	brgez  ,nt	%8,<label_0x20001>
	.word 0xc6520009  ! 757: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0x86720009  ! 758: UDIV_R	udiv 	%r8, %r9, %r3
	.word 0x86da0009  ! 759: SMULcc_R	smulcc 	%r8, %r9, %r3
	.word 0xa67a0009  ! 760: SDIV_R	sdiv 	%r8, %r9, %r19
	.word 0xc8ea1009  ! 761: LDSTUBA_R	ldstuba	%r4, [%r8 + %r9] 0x80
	.word 0x8f6a2330  ! 762: SDIVX_I	sdivx	%r8, 0x0330, %r7
	.word 0xcaa21009  ! 763: STWA_R	stwa	%r5, [%r8 + %r9] 0x80
	.word 0xad6a2b48  ! 764: SDIVX_I	sdivx	%r8, 0x0b48, %r22
	.word 0x85220009  ! 765: MULScc_R	mulscc 	%r8, %r9, %r2
	.word 0xc36a2a5c  ! 766: PREFETCH_I	prefetch	[%r8 + 0x0a5c], #one_read
	.word 0xd8ba1009  ! 767: STDA_R	stda	%r12, [%r8 + %r9] 0x80
	.word 0x8e7a0009  ! 768: SDIV_R	sdiv 	%r8, %r9, %r7
	.word 0xa67a0009  ! 769: SDIV_R	sdiv 	%r8, %r9, %r19
	.word 0xcc7a24cc  ! 770: SWAP_I	swap	%r6, [%r8 + 0x04cc]
	.word 0xc4fa1009  ! 771: SWAPA_R	swapa	%r2, [%r8 + %r9] 0x80
	.word 0xd6b21009  ! 772: STHA_R	stha	%r11, [%r8 + %r9] 0x80
	.word 0x2ac20001  ! 773: BRNZ	brnz,a,nt	%8,<label_0x20001>
	.word 0x8143e010  ! 774: MEMBAR	membar	#Lookaside 
	.word 0x8143e045  ! 775: MEMBAR	membar	#LoadLoad | #LoadStore | #Sync 
	.word 0x8143c000  ! 776: STBAR	stbar
	.word 0x02800001  ! 777: BE	be  	<label_0x1>
	.word 0x887a0009  ! 778: SDIV_R	sdiv 	%r8, %r9, %r4
	.word 0xcca22498  ! 779: STWA_I	stwa	%r6, [%r8 + 0x0498] %asi
	.word 0xc2522d10  ! 780: LDSH_I	ldsh	[%r8 + 0x0d10], %r1
	.word 0xe4a21009  ! 781: STWA_R	stwa	%r18, [%r8 + %r9] 0x80
	.word 0xf2c2284c  ! 782: LDSWA_I	ldswa	[%r8, + 0x084c] %asi, %r25
	.word 0xfd3a0009  ! 783: STDF_R	std	%f30, [%r9, %r8]
	.word 0x8efa2058  ! 784: SDIVcc_I	sdivcc 	%r8, 0x0058, %r7
	.word 0xcc1a2af0  ! 785: LDD_I	ldd	[%r8 + 0x0af0], %r6
	.word 0xd6921009  ! 786: LDUHA_R	lduha	[%r8, %r9] 0x80, %r11
	.word 0xc9220009  ! 787: STF_R	st	%f4, [%r9, %r8]
	.word 0xcafa2f70  ! 788: SWAPA_I	swapa	%r5, [%r8 + 0x0f70] %asi
	.word 0x86fa2f18  ! 789: SDIVcc_I	sdivcc 	%r8, 0x0f18, %r3
	.word 0xcbf21009  ! 790: CASXA_I	casxa	[%r8] 0x80, %r9, %r5
	.word 0xc8ba1009  ! 791: STDA_R	stda	%r4, [%r8 + %r9] 0x80
	.word 0x12800002  ! 792: BNE	bne  	<label_0x2>
	.word 0xdcca200c  ! 793: LDSBA_I	ldsba	[%r8, + 0x000c] %asi, %r14
	.word 0xc92226f4  ! 794: STF_I	st	%f4, [0x06f4, %r8]
	.word 0xc8c21009  ! 795: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r4
	.word 0xc3ea2290  ! 796: PREFETCHA_I	prefetcha	[%r8, + 0x0290] %asi, #one_read
	.word 0x12800002  ! 797: BNE	bne  	<label_0x2>
	.word 0x824a0009  ! 798: MULX_R	mulx 	%r8, %r9, %r1
	.word 0xaba208a9  ! 800: FSUBs	fsubs	%f8, %f9, %f21
	.word 0xc28a1009  ! 801: LDUBA_R	lduba	[%r8, %r9] 0x80, %r1
	.word 0x26ca0001  ! 802: BRLZ	brlz,a,pt	%8,<label_0xa0001>
	.word 0xd4a223fc  ! 804: STWA_I	stwa	%r10, [%r8 + 0x03fc] %asi
	.word 0x8e7a2978  ! 806: SDIV_I	sdiv 	%r8, 0x0978, %r7
	.word 0xcc4a0009  ! 807: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0x8143e006  ! 808: MEMBAR	membar	#StoreLoad | #LoadStore 
	.word 0x8cfa2e90  ! 809: SDIVcc_I	sdivcc 	%r8, 0x0e90, %r6
	.word 0xecd22ebc  ! 811: LDSHA_I	ldsha	[%r8, + 0x0ebc] %asi, %r22
	.word 0x865a2e50  ! 812: SMUL_I	smul 	%r8, 0x0e50, %r3
	.word 0x16800001  ! 813: BGE	bge  	<label_0x1>
	.word 0x38800001  ! 814: BGU	bgu,a	<label_0x1>
	.word 0xcf220009  ! 815: STF_R	st	%f7, [%r9, %r8]
	.word 0x40000001  ! 816: CALL	call	disp30_1
	.word 0xe67a255c  ! 817: SWAP_I	swap	%r19, [%r8 + 0x055c]
	.word 0xb46a0009  ! 818: UDIVX_R	udivx 	%r8, %r9, %r26
	.word 0xc3ea2bb4  ! 819: PREFETCHA_I	prefetcha	[%r8, + 0x0bb4] %asi, #one_read
	.word 0xc5220009  ! 820: STF_R	st	%f2, [%r9, %r8]
	.word 0xd81a0009  ! 821: LDD_R	ldd	[%r8 + %r9], %r12
	.word 0x8143e01e  ! 822: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside 
	.word 0xc4ba2698  ! 823: STDA_I	stda	%r2, [%r8 + 0x0698] %asi
	.word 0xe0aa258c  ! 824: STBA_I	stba	%r16, [%r8 + 0x058c] %asi
	.word 0xca522d4c  ! 825: LDSH_I	ldsh	[%r8 + 0x0d4c], %r5
	.word 0xbeda2860  ! 826: SMULcc_I	smulcc 	%r8, 0x0860, %r31
	.word 0x8a522d14  ! 827: UMUL_I	umul 	%r8, 0x0d14, %r5
	.word 0xf2ea2f80  ! 829: LDSTUBA_I	ldstuba	%r25, [%r8 + 0x0f80] %asi
	.word 0x8143c000  ! 830: STBAR	stbar
	.word 0xde6a0009  ! 831: LDSTUB_R	ldstub	%r15, [%r8 + %r9]
	.word 0x886a0009  ! 832: UDIVX_R	udivx 	%r8, %r9, %r4
	.word 0xc8b22864  ! 833: STHA_I	stha	%r4, [%r8 + 0x0864] %asi
	.word 0x8143e036  ! 834: MEMBAR	membar	#StoreLoad | #LoadStore | #Lookaside | #MemIssue 
	.word 0xdc1a2338  ! 835: LDD_I	ldd	[%r8 + 0x0338], %r14
	.word 0xc36a2254  ! 836: PREFETCH_I	prefetch	[%r8 + 0x0254], #one_read
	.word 0xdca21009  ! 837: STWA_R	stwa	%r14, [%r8 + %r9] 0x80
	.word 0xf0a21009  ! 838: STWA_R	stwa	%r24, [%r8 + %r9] 0x80
	.word 0xf66a0009  ! 839: LDSTUB_R	ldstub	%r27, [%r8 + %r9]
	.word 0x8143e01d  ! 840: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside 
	.word 0xceea2840  ! 841: LDSTUBA_I	ldstuba	%r7, [%r8 + 0x0840] %asi
	.word 0x845a0009  ! 842: SMUL_R	smul 	%r8, %r9, %r2
	.word 0x87222ad4  ! 843: MULScc_I	mulscc 	%r8, 0x0ad4, %r3
	.word 0xfff21009  ! 845: CASXA_I	casxa	[%r8] 0x80, %r9, %r31
	.word 0xc4921009  ! 846: LDUHA_R	lduha	[%r8, %r9] 0x80, %r2
	.word 0x8fa208a9  ! 847: FSUBs	fsubs	%f8, %f9, %f7
	.word 0x0c800002  ! 848: BNEG	bneg  	<label_0x2>
	.word 0x8143e02d  ! 849: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #MemIssue 
	.word 0x8143c000  ! 850: STBAR	stbar
	.word 0xc3ea2b24  ! 851: PREFETCHA_I	prefetcha	[%r8, + 0x0b24] %asi, #one_read
	.word 0x0e800001  ! 852: BVS	bvs  	<label_0x1>
	.word 0x8143e067  ! 853: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #MemIssue | #Sync 
	.word 0x87a20829  ! 854: FADDs	fadds	%f8, %f9, %f3
	.word 0xd8ba1009  ! 855: STDA_R	stda	%r12, [%r8 + %r9] 0x80
	.word 0xdeea2518  ! 856: LDSTUBA_I	ldstuba	%r15, [%r8 + 0x0518] %asi
	.word 0x36800001  ! 857: BGE	bge,a	<label_0x1>
	.word 0x9fa209a9  ! 858: FDIVs	fdivs	%f8, %f9, %f15
	.word 0xc2f22e98  ! 859: STXA_I	stxa	%r1, [%r8 + 0x0e98] %asi
	.word 0xe8b21009  ! 860: STHA_R	stha	%r20, [%r8 + %r9] 0x80
	.word 0x36800002  ! 861: BGE	bge,a	<label_0x2>
	.word 0xe6da1009  ! 863: LDXA_R	ldxa	[%r8, %r9] 0x80, %r19
	.word 0x8143e022  ! 864: MEMBAR	membar	#StoreLoad | #MemIssue 
	.word 0xccb227a4  ! 865: STHA_I	stha	%r6, [%r8 + 0x07a4] %asi
	.word 0x3a800001  ! 866: BCC	bcc,a	<label_0x1>
	.word 0x00800002  ! 867: BN	bn  	<label_0x2>
	.word 0xa65a0009  ! 868: SMUL_R	smul 	%r8, %r9, %r19
	.word 0xc2921009  ! 869: LDUHA_R	lduha	[%r8, %r9] 0x80, %r1
	.word 0xf47a0009  ! 870: SWAP_R	swap	%r26, [%r8 + %r9]
	.word 0xb6520009  ! 871: UMUL_R	umul 	%r8, %r9, %r27
	.word 0xcc7a2800  ! 872: SWAP_I	swap	%r6, [%r8 + 0x0800]
	.word 0xf2b22748  ! 873: STHA_I	stha	%r25, [%r8 + 0x0748] %asi
	.word 0xf6d22b10  ! 874: LDSHA_I	ldsha	[%r8, + 0x0b10] %asi, %r27
	.word 0xc25a0009  ! 875: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0x84522520  ! 876: UMUL_I	umul 	%r8, 0x0520, %r2
	.word 0x88f227ec  ! 877: UDIVcc_I	udivcc 	%r8, 0x07ec, %r4
	.word 0xe93a0009  ! 878: STDF_R	std	%f20, [%r9, %r8]
	.word 0xc36a28b4  ! 879: PREFETCH_I	prefetch	[%r8 + 0x08b4], #one_read
	.word 0x8143c000  ! 880: STBAR	stbar
	.word 0xccea1009  ! 881: LDSTUBA_R	ldstuba	%r6, [%r8 + %r9] 0x80
	.word 0x8c4a0009  ! 884: MULX_R	mulx 	%r8, %r9, %r6
	.word 0x945a2ce8  ! 885: SMUL_I	smul 	%r8, 0x0ce8, %r10
	.word 0xfcba2db8  ! 886: STDA_I	stda	%r30, [%r8 + 0x0db8] %asi
	.word 0x12800002  ! 887: BNE	bne  	<label_0x2>
	.word 0xc25a24e8  ! 888: LDX_I	ldx	[%r8 + 0x04e8], %r1
	.word 0x26c20001  ! 889: BRLZ	brlz,a,nt	%8,<label_0x20001>
	.word 0xf4420009  ! 890: LDSW_R	ldsw	[%r8 + %r9], %r26
	.word 0xcaaa2854  ! 891: STBA_I	stba	%r5, [%r8 + 0x0854] %asi
	.word 0x0ec20001  ! 892: BRGEZ	brgez  ,nt	%8,<label_0x20001>
	.word 0xbba208a9  ! 893: FSUBs	fsubs	%f8, %f9, %f29
	.word 0x8e7a0009  ! 894: SDIV_R	sdiv 	%r8, %r9, %r7
	.word 0x8e720009  ! 895: UDIV_R	udiv 	%r8, %r9, %r7
	.word 0x88da2724  ! 896: SMULcc_I	smulcc 	%r8, 0x0724, %r4
	.word 0x8143e02b  ! 897: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #MemIssue 
	.word 0xcc1a0009  ! 898: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xc3ea2710  ! 899: PREFETCHA_I	prefetcha	[%r8, + 0x0710] %asi, #one_read
	.word 0x8143c000  ! 900: STBAR	stbar
	.word 0x846a0009  ! 903: UDIVX_R	udivx 	%r8, %r9, %r2
	.word 0xc73a2b20  ! 904: STDF_I	std	%f3, [0x0b20, %r8]
	.word 0xec9a2a40  ! 905: LDDA_I	ldda	[%r8, + 0x0a40] %asi, %r22
	.word 0x8143e016  ! 906: MEMBAR	membar	#StoreLoad | #LoadStore | #Lookaside 
	.word 0xfeda2028  ! 907: LDXA_I	ldxa	[%r8, + 0x0028] %asi, %r31
	.word 0xe46a0009  ! 908: LDSTUB_R	ldstub	%r18, [%r8 + %r9]
	.word 0xcef222e0  ! 909: STXA_I	stxa	%r7, [%r8 + 0x02e0] %asi
	.word 0x8143e007  ! 910: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore 
	.word 0x22800001  ! 911: BE	be,a	<label_0x1>
	.word 0xc2520009  ! 912: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0x85a209a9  ! 913: FDIVs	fdivs	%f8, %f9, %f2
	.word 0xc8f21009  ! 914: STXA_R	stxa	%r4, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 915: STBAR	stbar
	.word 0xc3ea2174  ! 916: PREFETCHA_I	prefetcha	[%r8, + 0x0174] %asi, #one_read
	.word 0x8143c000  ! 917: STBAR	stbar
	.word 0xceaa2834  ! 918: STBA_I	stba	%r7, [%r8 + 0x0834] %asi
	.word 0xc7f22009  ! 920: CASXA_R	casxa	[%r8]%asi, %r9, %r3
	.word 0x12800001  ! 921: BNE	bne  	<label_0x1>
	.word 0xd49a1009  ! 922: LDDA_R	ldda	[%r8, %r9] 0x80, %r10
	.word 0xec9a1009  ! 923: LDDA_R	ldda	[%r8, %r9] 0x80, %r22
	.word 0x8ba209a9  ! 924: FDIVs	fdivs	%f8, %f9, %f5
	.word 0x82da0009  ! 925: SMULcc_R	smulcc 	%r8, %r9, %r1
	.word 0xe85a24b0  ! 926: LDX_I	ldx	[%r8 + 0x04b0], %r20
	.word 0xc8ca2a48  ! 927: LDSBA_I	ldsba	[%r8, + 0x0a48] %asi, %r4
	.word 0x876a0009  ! 928: SDIVX_R	sdivx	%r8, %r9, %r3
	.word 0x8e6a0009  ! 929: UDIVX_R	udivx 	%r8, %r9, %r7
	.word 0x8143e07e  ! 930: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xc6ea1009  ! 931: LDSTUBA_R	ldstuba	%r3, [%r8 + %r9] 0x80
	.word 0xc4420009  ! 932: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0x846a0009  ! 933: UDIVX_R	udivx 	%r8, %r9, %r2
	.word 0xeeaa1009  ! 934: STBA_R	stba	%r23, [%r8 + %r9] 0x80
	.word 0x8143e028  ! 935: MEMBAR	membar	#StoreStore | #MemIssue 
	.word 0xc86a0009  ! 936: LDSTUB_R	ldstub	%r4, [%r8 + %r9]
	.word 0x89a20929  ! 937: FMULs	fmuls	%f8, %f9, %f4
	.word 0x8143e020  ! 938: MEMBAR	membar	#MemIssue 
	.word 0xc36a29c4  ! 939: PREFETCH_I	prefetch	[%r8 + 0x09c4], #one_read
	.word 0xe27a0009  ! 940: SWAP_R	swap	%r17, [%r8 + %r9]
	.word 0xc24a2278  ! 941: LDSB_I	ldsb	[%r8 + 0x0278], %r1
	.word 0x22800001  ! 944: BE	be,a	<label_0x1>
	.word 0x887a0009  ! 945: SDIV_R	sdiv 	%r8, %r9, %r4
	.word 0xc3220009  ! 947: STF_R	st	%f1, [%r9, %r8]
	.word 0xf6b22198  ! 948: STHA_I	stha	%r27, [%r8 + 0x0198] %asi
	.word 0xdeca20f0  ! 949: LDSBA_I	ldsba	[%r8, + 0x00f0] %asi, %r15
	.word 0xf6ca2b48  ! 950: LDSBA_I	ldsba	[%r8, + 0x0b48] %asi, %r27
	.word 0x88da277c  ! 951: SMULcc_I	smulcc 	%r8, 0x077c, %r4
	.word 0xc87a2d14  ! 952: SWAP_I	swap	%r4, [%r8 + 0x0d14]
	.word 0xc5e22009  ! 953: CASA_R	casa	[%r8] %asi, %r9, %r2
	.word 0x24800001  ! 954: BLE	ble,a	<label_0x1>
	.word 0xa4720009  ! 955: UDIV_R	udiv 	%r8, %r9, %r18
	.word 0xfada1009  ! 956: LDXA_R	ldxa	[%r8, %r9] 0x80, %r29
	.word 0xc36a2b44  ! 957: PREFETCH_I	prefetch	[%r8 + 0x0b44], #one_read
	.word 0xc212295c  ! 958: LDUH_I	lduh	[%r8 + 0x095c], %r1
	.word 0xca6a0009  ! 961: LDSTUB_R	ldstub	%r5, [%r8 + %r9]
	.word 0xc4b21009  ! 963: STHA_R	stha	%r2, [%r8 + %r9] 0x80
	.word 0xc68a1009  ! 965: LDUBA_R	lduba	[%r8, %r9] 0x80, %r3
	.word 0x8a4a0009  ! 966: MULX_R	mulx 	%r8, %r9, %r5
	.word 0xc8a21009  ! 967: STWA_R	stwa	%r4, [%r8 + %r9] 0x80
	.word 0xc84a2490  ! 968: LDSB_I	ldsb	[%r8 + 0x0490], %r4
	.word 0x8143c000  ! 970: STBAR	stbar
	.word 0xfaa22038  ! 973: STWA_I	stwa	%r29, [%r8 + 0x0038] %asi
	.word 0xc6b22204  ! 974: STHA_I	stha	%r3, [%r8 + 0x0204] %asi
	.word 0x8143e052  ! 975: MEMBAR	membar	#StoreLoad | #Lookaside | #Sync 
	.word 0xd47a0009  ! 976: SWAP_R	swap	%r10, [%r8 + %r9]
	.word 0x8143e041  ! 977: MEMBAR	membar	#LoadLoad | #Sync 
	.word 0x86fa2cc8  ! 978: SDIVcc_I	sdivcc 	%r8, 0x0cc8, %r3
	.word 0x82f22a20  ! 979: UDIVcc_I	udivcc 	%r8, 0x0a20, %r1
	.word 0xceb21009  ! 980: STHA_R	stha	%r7, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 981: STBAR	stbar
	.word 0x00800001  ! 982: BN	bn  	<label_0x1>
	.word 0xfcba28c0  ! 983: STDA_I	stda	%r30, [%r8 + 0x08c0] %asi
	.word 0xc9220009  ! 984: STF_R	st	%f4, [%r9, %r8]
	.word 0xce82210c  ! 985: LDUWA_I	lduwa	[%r8, + 0x010c] %asi, %r7
	.word 0xc2ea1009  ! 986: LDSTUBA_R	ldstuba	%r1, [%r8 + %r9] 0x80
	.word 0x9ad20009  ! 987: UMULcc_R	umulcc 	%r8, %r9, %r13
	.word 0xdaca1009  ! 988: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r13
	.word 0xa2fa2c68  ! 989: SDIVcc_I	sdivcc 	%r8, 0x0c68, %r17
	.word 0xe0d21009  ! 990: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r16
	.word 0xca7a0009  ! 991: SWAP_R	swap	%r5, [%r8 + %r9]
	.word 0xc88a1009  ! 992: LDUBA_R	lduba	[%r8, %r9] 0x80, %r4
	.word 0xc6921009  ! 993: LDUHA_R	lduha	[%r8, %r9] 0x80, %r3
	.word 0xc3ea22e8  ! 994: PREFETCHA_I	prefetcha	[%r8, + 0x02e8] %asi, #one_read
	.word 0xbafa274c  ! 997: SDIVcc_I	sdivcc 	%r8, 0x074c, %r29
	.word 0x945221a4  ! 998: UMUL_I	umul 	%r8, 0x01a4, %r10
	.word 0x8143c000  ! 999: STBAR	stbar
        ta      T_GOOD_TRAP

th_main_2:
        setx  MAIN_BASE_DATA_VA, %r1, %r8
        setx  0x0000000000000220, %g1, %r9
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
        setx  0xdc1a1e6566c196e8, %g1, %r0
        setx  0xe13817b7d06a514a, %g1, %r1
        setx  0x72158fc1fc3b9237, %g1, %r2
        setx  0xcfeb648c5af5b028, %g1, %r3
        setx  0x2eb71b1c4d90ff46, %g1, %r4
        setx  0x22b69fb38f7d02a8, %g1, %r5
        setx  0x77c8a852dae6c89e, %g1, %r6
        setx  0x959face2b3565cc5, %g1, %r7
        setx  0x087c0fe119accb4f, %g1, %r10
        setx  0x4f6c6e82d36f2777, %g1, %r11
        setx  0x8a73cfaa8c253bf7, %g1, %r12
        setx  0xb38cce53dfbc7925, %g1, %r13
        setx  0xfc51080c9f494865, %g1, %r14
        setx  0x132084cf52544253, %g1, %r15
        setx  0x876520b2e89e862d, %g1, %r16
        setx  0x403d4296b9e909c2, %g1, %r17
        setx  0x28b9210025797f9c, %g1, %r18
        setx  0xb2c6056a3e77bc02, %g1, %r19
        setx  0x8358688dc15c7df0, %g1, %r20
        setx  0x8e14f7ba8758f985, %g1, %r21
        setx  0xc835a6f57bbfa539, %g1, %r22
        setx  0x74ece8d54bdd413f, %g1, %r23
        setx  0x45ed79472259b1c8, %g1, %r24
        setx  0x93c335524ca8e7af, %g1, %r25
        setx  0x3002a5b3a5d8b514, %g1, %r26
        setx  0x4c2e5bfb30890d56, %g1, %r27
        setx  0x6ac72ce8c412dd4a, %g1, %r28
        setx  0xbafc36c548501534, %g1, %r29
        setx  0xf0a481019a666da3, %g1, %r30
        setx  0x5bc26d186a8b2319, %g1, %r31
	.word 0xc4ea2508  ! 5: LDSTUBA_I	ldstuba	%r2, [%r8 + 0x0508] %asi
	.word 0xc25a2720  ! 7: LDX_I	ldx	[%r8 + 0x0720], %r1
	.word 0x20800001  ! 8: BN	bn,a	<label_0x1>
	.word 0xe6821009  ! 9: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r19
	.word 0xccc22698  ! 10: LDSWA_I	ldswa	[%r8, + 0x0698] %asi, %r6
	.word 0xc6f22e18  ! 11: STXA_I	stxa	%r3, [%r8 + 0x0e18] %asi
	.word 0xc6a21009  ! 13: STWA_R	stwa	%r3, [%r8 + %r9] 0x80
	.word 0xc8d22718  ! 14: LDSHA_I	ldsha	[%r8, + 0x0718] %asi, %r4
	.word 0x8143c000  ! 15: STBAR	stbar
	.word 0x8143e015  ! 16: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside 
	.word 0xc32223f8  ! 18: STF_I	st	%f1, [0x03f8, %r8]
	.word 0xd4921009  ! 19: LDUHA_R	lduha	[%r8, %r9] 0x80, %r10
	.word 0xc6120009  ! 20: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xc3ea20b8  ! 21: PREFETCHA_I	prefetcha	[%r8, + 0x00b8] %asi, #one_read
	.word 0xeefa2958  ! 22: SWAPA_I	swapa	%r23, [%r8 + 0x0958] %asi
	.word 0x82522050  ! 23: UMUL_I	umul 	%r8, 0x0050, %r1
	.word 0x8143c000  ! 25: STBAR	stbar
	.word 0xa3a209a9  ! 26: FDIVs	fdivs	%f8, %f9, %f17
	.word 0xf65a0009  ! 27: LDX_R	ldx	[%r8 + %r9], %r27
	.word 0xcff22009  ! 28: CASXA_R	casxa	[%r8]%asi, %r9, %r7
	.word 0xc6aa1009  ! 29: STBA_R	stba	%r3, [%r8 + %r9] 0x80
	.word 0xa1a20829  ! 30: FADDs	fadds	%f8, %f9, %f16
	.word 0x8f220009  ! 32: MULScc_R	mulscc 	%r8, %r9, %r7
	.word 0xcefa2430  ! 33: SWAPA_I	swapa	%r7, [%r8 + 0x0430] %asi
	.word 0xcac21009  ! 34: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r5
	.word 0x0cc20001  ! 35: BRGZ	brgz  ,nt	%8,<label_0x20001>
	.word 0xc73a0009  ! 36: STDF_R	std	%f3, [%r9, %r8]
	.word 0xae522778  ! 37: UMUL_I	umul 	%r8, 0x0778, %r23
	.word 0x825a0009  ! 38: SMUL_R	smul 	%r8, %r9, %r1
	.word 0xe40a21fc  ! 39: LDUB_I	ldub	[%r8 + 0x01fc], %r18
	.word 0x8143e02b  ! 40: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #MemIssue 
	.word 0xe4ba1009  ! 41: STDA_R	stda	%r18, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 42: STBAR	stbar
	.word 0xc73a0009  ! 43: STDF_R	std	%f3, [%r9, %r8]
	.word 0x8143c000  ! 44: STBAR	stbar
	.word 0xca122344  ! 45: LDUH_I	lduh	[%r8 + 0x0344], %r5
	.word 0xcc020009  ! 46: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xc36a2f2c  ! 47: PREFETCH_I	prefetch	[%r8 + 0x0f2c], #one_read
	.word 0x8ad20009  ! 48: UMULcc_R	umulcc 	%r8, %r9, %r5
	.word 0xcefa1009  ! 49: SWAPA_R	swapa	%r7, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 50: STBAR	stbar
	.word 0xc2c21009  ! 51: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r1
	.word 0xc4f22438  ! 52: STXA_I	stxa	%r2, [%r8 + 0x0438] %asi
	.word 0xc6420009  ! 53: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0x8fa208a9  ! 56: FSUBs	fsubs	%f8, %f9, %f7
	.word 0x40000001  ! 57: CALL	call	disp30_1
	.word 0x86da0009  ! 58: SMULcc_R	smulcc 	%r8, %r9, %r3
	.word 0x2aca0001  ! 59: BRNZ	brnz,a,pt	%8,<label_0xa0001>
	.word 0x2aca0001  ! 60: BRNZ	brnz,a,pt	%8,<label_0xa0001>
	.word 0xcad21009  ! 61: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r5
	.word 0x847a0009  ! 62: SDIV_R	sdiv 	%r8, %r9, %r2
	.word 0xcc7a0009  ! 63: SWAP_R	swap	%r6, [%r8 + %r9]
	.word 0x8143c000  ! 64: STBAR	stbar
	.word 0xdef21009  ! 65: STXA_R	stxa	%r15, [%r8 + %r9] 0x80
	.word 0x02c20001  ! 66: BRZ	brz  ,nt	%8,<label_0x20001>
	.word 0x1c800001  ! 67: BPOS	bpos  	<label_0x1>
	.word 0xc4122430  ! 68: LDUH_I	lduh	[%r8 + 0x0430], %r2
	.word 0xc93a0009  ! 69: STDF_R	std	%f4, [%r9, %r8]
	.word 0x8143e051  ! 70: MEMBAR	membar	#LoadLoad | #Lookaside | #Sync 
	.word 0xcefa1009  ! 71: SWAPA_R	swapa	%r7, [%r8 + %r9] 0x80
	.word 0xc5f21009  ! 72: CASXA_I	casxa	[%r8] 0x80, %r9, %r2
	.word 0xc4fa1009  ! 73: SWAPA_R	swapa	%r2, [%r8 + %r9] 0x80
	.word 0xc3ea2e80  ! 74: PREFETCHA_I	prefetcha	[%r8, + 0x0e80] %asi, #one_read
	.word 0xe4c21009  ! 75: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r18
	.word 0x83220009  ! 76: MULScc_R	mulscc 	%r8, %r9, %r1
	.word 0xcab22338  ! 77: STHA_I	stha	%r5, [%r8 + 0x0338] %asi
	.word 0x2e800001  ! 78: BVS	bvs,a	<label_0x1>
	.word 0x89a20929  ! 79: FMULs	fmuls	%f8, %f9, %f4
	.word 0xcf222df4  ! 80: STF_I	st	%f7, [0x0df4, %r8]
	.word 0xc66a0009  ! 81: LDSTUB_R	ldstub	%r3, [%r8 + %r9]
	.word 0xce122cc8  ! 82: LDUH_I	lduh	[%r8 + 0x0cc8], %r7
	.word 0x8143e07e  ! 83: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xe24a24d4  ! 84: LDSB_I	ldsb	[%r8 + 0x04d4], %r17
	.word 0xa4f229e0  ! 85: UDIVcc_I	udivcc 	%r8, 0x09e0, %r18
	.word 0x20800001  ! 86: BN	bn,a	<label_0x1>
	.word 0x86f20009  ! 87: UDIVcc_R	udivcc 	%r8, %r9, %r3
	.word 0x3a800001  ! 88: BCC	bcc,a	<label_0x1>
	.word 0xce921009  ! 89: LDUHA_R	lduha	[%r8, %r9] 0x80, %r7
	.word 0x8143c000  ! 90: STBAR	stbar
	.word 0xacf20009  ! 91: UDIVcc_R	udivcc 	%r8, %r9, %r22
	.word 0x8c6a0009  ! 92: UDIVX_R	udivx 	%r8, %r9, %r6
	.word 0xc4aa1009  ! 93: STBA_R	stba	%r2, [%r8 + %r9] 0x80
	.word 0xca0a0009  ! 94: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xc4a21009  ! 95: STWA_R	stwa	%r2, [%r8 + %r9] 0x80
	.word 0xd6fa2244  ! 96: SWAPA_I	swapa	%r11, [%r8 + 0x0244] %asi
	.word 0xa4720009  ! 97: UDIV_R	udiv 	%r8, %r9, %r18
	.word 0xbd6a0009  ! 98: SDIVX_R	sdivx	%r8, %r9, %r30
	.word 0xc36a2120  ! 99: PREFETCH_I	prefetch	[%r8 + 0x0120], #one_read
	.word 0xed222ad0  ! 100: STF_I	st	%f22, [0x0ad0, %r8]
	.word 0x8143c000  ! 101: STBAR	stbar
	.word 0x9c7a0009  ! 103: SDIV_R	sdiv 	%r8, %r9, %r14
	.word 0xc8aa1009  ! 105: STBA_R	stba	%r4, [%r8 + %r9] 0x80
	.word 0x00800001  ! 106: BN	bn  	<label_0x1>
	.word 0xc6ca1009  ! 107: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r3
	.word 0xde420009  ! 108: LDSW_R	ldsw	[%r8 + %r9], %r15
	.word 0x06800001  ! 110: BL	bl  	<label_0x1>
	.word 0x864a0009  ! 111: MULX_R	mulx 	%r8, %r9, %r3
	.word 0xc40a2c60  ! 112: LDUB_I	ldub	[%r8 + 0x0c60], %r2
	.word 0x8143c000  ! 113: STBAR	stbar
	.word 0xc4120009  ! 114: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0x89a20829  ! 115: FADDs	fadds	%f8, %f9, %f4
	.word 0xf27a255c  ! 116: SWAP_I	swap	%r25, [%r8 + 0x055c]
	.word 0x02800002  ! 117: BE	be  	<label_0x2>
	.word 0xc3ea2b58  ! 118: PREFETCHA_I	prefetcha	[%r8, + 0x0b58] %asi, #one_read
	.word 0xc40a0009  ! 119: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xec1a2f60  ! 120: LDD_I	ldd	[%r8 + 0x0f60], %r22
	.word 0xe4921009  ! 121: LDUHA_R	lduha	[%r8, %r9] 0x80, %r18
	.word 0xc4020009  ! 123: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xccb22c88  ! 124: STHA_I	stha	%r6, [%r8 + 0x0c88] %asi
	.word 0x34800002  ! 125: BG	bg,a	<label_0x2>
	.word 0x8e520009  ! 126: UMUL_R	umul 	%r8, %r9, %r7
	.word 0xc8b21009  ! 127: STHA_R	stha	%r4, [%r8 + %r9] 0x80
	.word 0xba722568  ! 129: UDIV_I	udiv 	%r8, 0x0568, %r29
	.word 0xd6d221c4  ! 130: LDSHA_I	ldsha	[%r8, + 0x01c4] %asi, %r11
	.word 0x8a6a23b0  ! 131: UDIVX_I	udivx 	%r8, 0x03b0, %r5
	.word 0xc3ea2bf8  ! 132: PREFETCHA_I	prefetcha	[%r8, + 0x0bf8] %asi, #one_read
	.word 0xc60a0009  ! 133: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xf2fa24a4  ! 134: SWAPA_I	swapa	%r25, [%r8 + 0x04a4] %asi
	.word 0xbe6a2f3c  ! 135: UDIVX_I	udivx 	%r8, 0x0f3c, %r31
	.word 0xc2f21009  ! 136: STXA_R	stxa	%r1, [%r8 + %r9] 0x80
	.word 0xca520009  ! 137: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xc60225e8  ! 138: LDUW_I	lduw	[%r8 + 0x05e8], %r3
	.word 0xcaaa2298  ! 140: STBA_I	stba	%r5, [%r8 + 0x0298] %asi
	.word 0xdcba2648  ! 141: STDA_I	stda	%r14, [%r8 + 0x0648] %asi
	.word 0x82f22b24  ! 142: UDIVcc_I	udivcc 	%r8, 0x0b24, %r1
	.word 0xc86a2088  ! 143: LDSTUB_I	ldstub	%r4, [%r8 + 0x0088]
	.word 0x40000001  ! 144: CALL	call	disp30_1
	.word 0xc89a29c0  ! 145: LDDA_I	ldda	[%r8, + 0x09c0] %asi, %r4
	.word 0xc36a2afc  ! 146: PREFETCH_I	prefetch	[%r8 + 0x0afc], #one_read
	.word 0x38800002  ! 147: BGU	bgu,a	<label_0x2>
	.word 0xca020009  ! 148: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xea122a74  ! 150: LDUH_I	lduh	[%r8 + 0x0a74], %r21
	.word 0xd652270c  ! 151: LDSH_I	ldsh	[%r8 + 0x070c], %r11
	.word 0x16800001  ! 152: BGE	bge  	<label_0x1>
	.word 0xf6420009  ! 153: LDSW_R	ldsw	[%r8 + %r9], %r27
	.word 0xc2122ff0  ! 154: LDUH_I	lduh	[%r8 + 0x0ff0], %r1
	.word 0xaa722850  ! 155: UDIV_I	udiv 	%r8, 0x0850, %r21
	.word 0x8e5a0009  ! 156: SMUL_R	smul 	%r8, %r9, %r7
	.word 0x8143e015  ! 157: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside 
	.word 0xc4f228e0  ! 158: STXA_I	stxa	%r2, [%r8 + 0x08e0] %asi
	.word 0xc27a0009  ! 159: SWAP_R	swap	%r1, [%r8 + %r9]
	.word 0xc36a2edc  ! 160: PREFETCH_I	prefetch	[%r8 + 0x0edc], #one_read
	.word 0xc8a22bb8  ! 161: STWA_I	stwa	%r4, [%r8 + 0x0bb8] %asi
	.word 0x8143e06e  ! 162: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #MemIssue | #Sync 
	.word 0xca12218c  ! 163: LDUH_I	lduh	[%r8 + 0x018c], %r5
	.word 0xf68a2ffc  ! 164: LDUBA_I	lduba	[%r8, + 0x0ffc] %asi, %r27
	.word 0x0cc20001  ! 165: BRGZ	brgz  ,nt	%8,<label_0x20001>
	.word 0xc2921009  ! 166: LDUHA_R	lduha	[%r8, %r9] 0x80, %r1
	.word 0xc8fa1009  ! 167: SWAPA_R	swapa	%r4, [%r8 + %r9] 0x80
	.word 0x83a209a9  ! 168: FDIVs	fdivs	%f8, %f9, %f1
	.word 0xccba1009  ! 169: STDA_R	stda	%r6, [%r8 + %r9] 0x80
	.word 0x1a800001  ! 170: BCC	bcc  	<label_0x1>
	.word 0xe20a254c  ! 171: LDUB_I	ldub	[%r8 + 0x054c], %r17
	.word 0xc5f22009  ! 172: CASXA_R	casxa	[%r8]%asi, %r9, %r2
	.word 0x36800002  ! 173: BGE	bge,a	<label_0x2>
	.word 0xc8ea1009  ! 174: LDSTUBA_R	ldstuba	%r4, [%r8 + %r9] 0x80
	.word 0xb4520009  ! 175: UMUL_R	umul 	%r8, %r9, %r26
	.word 0xc8fa2b74  ! 176: SWAPA_I	swapa	%r4, [%r8 + 0x0b74] %asi
	.word 0x887a24a4  ! 177: SDIV_I	sdiv 	%r8, 0x04a4, %r4
	.word 0xc36a2930  ! 178: PREFETCH_I	prefetch	[%r8 + 0x0930], #one_read
	.word 0x865a2da4  ! 179: SMUL_I	smul 	%r8, 0x0da4, %r3
	.word 0x885a2c90  ! 180: SMUL_I	smul 	%r8, 0x0c90, %r4
	.word 0xc3220009  ! 182: STF_R	st	%f1, [%r9, %r8]
	.word 0xc2aa1009  ! 184: STBA_R	stba	%r1, [%r8 + %r9] 0x80
	.word 0xc9f22009  ! 185: CASXA_R	casxa	[%r8]%asi, %r9, %r4
	.word 0xe9220009  ! 188: STF_R	st	%f20, [%r9, %r8]
	.word 0xec522d6c  ! 189: LDSH_I	ldsh	[%r8 + 0x0d6c], %r22
	.word 0x83a208a9  ! 190: FSUBs	fsubs	%f8, %f9, %f1
	.word 0xc5e21009  ! 191: CASA_I	casa	[%r8] 0x80, %r9, %r2
	.word 0x8143e049  ! 192: MEMBAR	membar	#LoadLoad | #StoreStore | #Sync 
	.word 0xe40a2848  ! 193: LDUB_I	ldub	[%r8 + 0x0848], %r18
	.word 0xc4da25f0  ! 194: LDXA_I	ldxa	[%r8, + 0x05f0] %asi, %r2
	.word 0xc36a24c4  ! 195: PREFETCH_I	prefetch	[%r8 + 0x04c4], #one_read
	.word 0xc2ea1009  ! 196: LDSTUBA_R	ldstuba	%r1, [%r8 + %r9] 0x80
	.word 0x8c7a20bc  ! 197: SDIV_I	sdiv 	%r8, 0x00bc, %r6
	.word 0xbcda288c  ! 198: SMULcc_I	smulcc 	%r8, 0x088c, %r30
	.word 0x8c4a0009  ! 199: MULX_R	mulx 	%r8, %r9, %r6
	.word 0x844a0009  ! 200: MULX_R	mulx 	%r8, %r9, %r2
	.word 0xa8da2448  ! 201: SMULcc_I	smulcc 	%r8, 0x0448, %r20
	.word 0x8143e051  ! 202: MEMBAR	membar	#LoadLoad | #Lookaside | #Sync 
	.word 0xc2ca1009  ! 203: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r1
	.word 0xc2822f5c  ! 204: LDUWA_I	lduwa	[%r8, + 0x0f5c] %asi, %r1
	.word 0x16800001  ! 205: BGE	bge  	<label_0x1>
	.word 0x06800001  ! 206: BL	bl  	<label_0x1>
	.word 0xca0a2f64  ! 207: LDUB_I	ldub	[%r8 + 0x0f64], %r5
	.word 0xc2122d8c  ! 208: LDUH_I	lduh	[%r8 + 0x0d8c], %r1
	.word 0xcb220009  ! 209: STF_R	st	%f5, [%r9, %r8]
	.word 0xf8b22058  ! 210: STHA_I	stha	%r28, [%r8 + 0x0058] %asi
	.word 0xa9a208a9  ! 211: FSUBs	fsubs	%f8, %f9, %f20
	.word 0x8ed22e28  ! 212: UMULcc_I	umulcc 	%r8, 0x0e28, %r7
	.word 0x8143e07f  ! 213: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xc6aa2bd8  ! 214: STBA_I	stba	%r3, [%r8 + 0x0bd8] %asi
	.word 0xc2da1009  ! 215: LDXA_R	ldxa	[%r8, %r9] 0x80, %r1
	.word 0x945229d4  ! 216: UMUL_I	umul 	%r8, 0x09d4, %r10
	.word 0xe4022674  ! 217: LDUW_I	lduw	[%r8 + 0x0674], %r18
	.word 0x18800001  ! 218: BGU	bgu  	<label_0x1>
	.word 0xc36a20c0  ! 219: PREFETCH_I	prefetch	[%r8 + 0x00c0], #one_read
	.word 0x85a20929  ! 220: FMULs	fmuls	%f8, %f9, %f2
	.word 0xcada1009  ! 221: LDXA_R	ldxa	[%r8, %r9] 0x80, %r5
	.word 0xc722221c  ! 222: STF_I	st	%f3, [0x021c, %r8]
	.word 0xca4222a8  ! 223: LDSW_I	ldsw	[%r8 + 0x02a8], %r5
	.word 0x84da27f4  ! 224: SMULcc_I	smulcc 	%r8, 0x07f4, %r2
	.word 0x8143c000  ! 225: STBAR	stbar
	.word 0xf04221f4  ! 226: LDSW_I	ldsw	[%r8 + 0x01f4], %r24
	.word 0xc3f21009  ! 227: CASXA_I	casxa	[%r8] 0x80, %r9, %r1
	.word 0x3a800001  ! 228: BCC	bcc,a	<label_0x1>
	.word 0x24800002  ! 229: BLE	ble,a	<label_0x2>
	.word 0xd49a1009  ! 230: LDDA_R	ldda	[%r8, %r9] 0x80, %r10
	.word 0xc8fa2c7c  ! 231: SWAPA_I	swapa	%r4, [%r8 + 0x0c7c] %asi
	.word 0x0e800001  ! 232: BVS	bvs  	<label_0x1>
	.word 0xcff22009  ! 233: CASXA_R	casxa	[%r8]%asi, %r9, %r7
	.word 0xc36a22bc  ! 234: PREFETCH_I	prefetch	[%r8 + 0x02bc], #one_read
	.word 0x36800001  ! 235: BGE	bge,a	<label_0x1>
	.word 0x84da0009  ! 236: SMULcc_R	smulcc 	%r8, %r9, %r2
	.word 0xdcda2d60  ! 237: LDXA_I	ldxa	[%r8, + 0x0d60] %asi, %r14
	.word 0x8143e02f  ! 238: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #MemIssue 
	.word 0x8143e028  ! 239: MEMBAR	membar	#StoreStore | #MemIssue 
	.word 0xdc1a0009  ! 240: LDD_R	ldd	[%r8 + %r9], %r14
	.word 0xccea2908  ! 241: LDSTUBA_I	ldstuba	%r6, [%r8 + 0x0908] %asi
	.word 0xce921009  ! 242: LDUHA_R	lduha	[%r8, %r9] 0x80, %r7
	.word 0xf5f22009  ! 243: CASXA_R	casxa	[%r8]%asi, %r9, %r26
	.word 0x826a29e4  ! 244: UDIVX_I	udivx 	%r8, 0x09e4, %r1
	.word 0x04ca0001  ! 245: BRLEZ	brlez  ,pt	%8,<label_0xa0001>
	.word 0xccfa1009  ! 246: SWAPA_R	swapa	%r6, [%r8 + %r9] 0x80
	.word 0xa6720009  ! 247: UDIV_R	udiv 	%r8, %r9, %r19
	.word 0x8b222efc  ! 248: MULScc_I	mulscc 	%r8, 0x0efc, %r5
	.word 0xcd220009  ! 249: STF_R	st	%f6, [%r9, %r8]
	.word 0xc3ea291c  ! 250: PREFETCHA_I	prefetcha	[%r8, + 0x091c] %asi, #one_read
	.word 0xc3222828  ! 251: STF_I	st	%f1, [0x0828, %r8]
	.word 0x884a0009  ! 252: MULX_R	mulx 	%r8, %r9, %r4
	.word 0x0c800002  ! 253: BNEG	bneg  	<label_0x2>
	.word 0x0c800002  ! 254: BNEG	bneg  	<label_0x2>
	.word 0xe3f22009  ! 255: CASXA_R	casxa	[%r8]%asi, %r9, %r17
	.word 0x87a209a9  ! 256: FDIVs	fdivs	%f8, %f9, %f3
	.word 0xfd220009  ! 257: STF_R	st	%f30, [%r9, %r8]
	.word 0xa04a0009  ! 258: MULX_R	mulx 	%r8, %r9, %r16
	.word 0xea7a0009  ! 259: SWAP_R	swap	%r21, [%r8 + %r9]
	.word 0xa44a0009  ! 261: MULX_R	mulx 	%r8, %r9, %r18
	.word 0xf0c21009  ! 262: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r24
	.word 0xc36a2ff0  ! 263: PREFETCH_I	prefetch	[%r8 + 0x0ff0], #one_read
	.word 0x896a0009  ! 264: SDIVX_R	sdivx	%r8, %r9, %r4
	.word 0x8ba20829  ! 265: FADDs	fadds	%f8, %f9, %f5
	.word 0x87a20829  ! 266: FADDs	fadds	%f8, %f9, %f3
	.word 0x8143e039  ! 268: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside | #MemIssue 
	.word 0xfaea2558  ! 269: LDSTUBA_I	ldstuba	%r29, [%r8 + 0x0558] %asi
	.word 0x22800002  ! 270: BE	be,a	<label_0x2>
	.word 0x86522a40  ! 271: UMUL_I	umul 	%r8, 0x0a40, %r3
	.word 0x8f6a2cd4  ! 272: SDIVX_I	sdivx	%r8, 0x0cd4, %r7
	.word 0xa05a0009  ! 273: SMUL_R	smul 	%r8, %r9, %r16
	.word 0xc8ca2fd8  ! 274: LDSBA_I	ldsba	[%r8, + 0x0fd8] %asi, %r4
	.word 0x82da23f4  ! 275: SMULcc_I	smulcc 	%r8, 0x03f4, %r1
	.word 0xe81a2e78  ! 276: LDD_I	ldd	[%r8 + 0x0e78], %r20
	.word 0x8143c000  ! 277: STBAR	stbar
	.word 0xe81a2620  ! 278: LDD_I	ldd	[%r8 + 0x0620], %r20
	.word 0xc25a2520  ! 279: LDX_I	ldx	[%r8 + 0x0520], %r1
	.word 0xc36a2a9c  ! 280: PREFETCH_I	prefetch	[%r8 + 0x0a9c], #one_read
	.word 0xc2122340  ! 281: LDUH_I	lduh	[%r8 + 0x0340], %r1
	.word 0x8143c000  ! 282: STBAR	stbar
	.word 0x865a289c  ! 283: SMUL_I	smul 	%r8, 0x089c, %r3
	.word 0x8143e053  ! 284: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside | #Sync 
	.word 0xc6f22160  ! 285: STXA_I	stxa	%r3, [%r8 + 0x0160] %asi
	.word 0xc87a0009  ! 286: SWAP_R	swap	%r4, [%r8 + %r9]
	.word 0x896a0009  ! 287: SDIVX_R	sdivx	%r8, %r9, %r4
	.word 0xfc1a2458  ! 288: LDD_I	ldd	[%r8 + 0x0458], %r30
	.word 0xb252215c  ! 289: UMUL_I	umul 	%r8, 0x015c, %r25
	.word 0x00800001  ! 290: BN	bn  	<label_0x1>
	.word 0x86fa0009  ! 291: SDIVcc_R	sdivcc 	%r8, %r9, %r3
	.word 0x847a0009  ! 292: SDIV_R	sdiv 	%r8, %r9, %r2
	.word 0xc3ea228c  ! 293: PREFETCHA_I	prefetcha	[%r8, + 0x028c] %asi, #one_read
	.word 0xccca1009  ! 295: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r6
	.word 0xc6ea2ff4  ! 296: LDSTUBA_I	ldstuba	%r3, [%r8 + 0x0ff4] %asi
	.word 0x84fa0009  ! 297: SDIVcc_R	sdivcc 	%r8, %r9, %r2
	.word 0x2cc20001  ! 298: BRGZ	brgz,a,nt	%8,<label_0x20001>
	.word 0x8e520009  ! 299: UMUL_R	umul 	%r8, %r9, %r7
	.word 0xd4da1009  ! 301: LDXA_R	ldxa	[%r8, %r9] 0x80, %r10
	.word 0x885a2860  ! 302: SMUL_I	smul 	%r8, 0x0860, %r4
	.word 0x8143c000  ! 304: STBAR	stbar
	.word 0x8f222fd0  ! 305: MULScc_I	mulscc 	%r8, 0x0fd0, %r7
	.word 0xca122048  ! 306: LDUH_I	lduh	[%r8 + 0x0048], %r5
	.word 0xc2aa1009  ! 307: STBA_R	stba	%r1, [%r8 + %r9] 0x80
	.word 0x36800002  ! 308: BGE	bge,a	<label_0x2>
	.word 0x846a2fdc  ! 309: UDIVX_I	udivx 	%r8, 0x0fdc, %r2
	.word 0x8143e079  ! 310: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0x85a20829  ! 311: FADDs	fadds	%f8, %f9, %f2
	.word 0xc9f22009  ! 312: CASXA_R	casxa	[%r8]%asi, %r9, %r4
	.word 0xc2ca2028  ! 313: LDSBA_I	ldsba	[%r8, + 0x0028] %asi, %r1
	.word 0xe00a0009  ! 314: LDUB_R	ldub	[%r8 + %r9], %r16
	.word 0x87a20829  ! 315: FADDs	fadds	%f8, %f9, %f3
	.word 0x9a6a22bc  ! 316: UDIVX_I	udivx 	%r8, 0x02bc, %r13
	.word 0xc4420009  ! 317: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xb8da2a58  ! 318: SMULcc_I	smulcc 	%r8, 0x0a58, %r28
	.word 0xc3ea27ec  ! 319: PREFETCHA_I	prefetcha	[%r8, + 0x07ec] %asi, #one_read
	.word 0xa6720009  ! 321: UDIV_R	udiv 	%r8, %r9, %r19
	.word 0xa24a2d64  ! 323: MULX_I	mulx 	%r8, 0x0d64, %r17
	.word 0x8cfa0009  ! 324: SDIVcc_R	sdivcc 	%r8, %r9, %r6
	.word 0xc67a2934  ! 325: SWAP_I	swap	%r3, [%r8 + 0x0934]
	.word 0xdaca27cc  ! 326: LDSBA_I	ldsba	[%r8, + 0x07cc] %asi, %r13
	.word 0x8143c000  ! 327: STBAR	stbar
	.word 0xcb3a2758  ! 329: STDF_I	std	%f5, [0x0758, %r8]
	.word 0x08800001  ! 330: BLEU	bleu  	<label_0x1>
	.word 0xc60225f4  ! 331: LDUW_I	lduw	[%r8 + 0x05f4], %r3
	.word 0xc26a2c70  ! 332: LDSTUB_I	ldstub	%r1, [%r8 + 0x0c70]
	.word 0xcaa22f44  ! 333: STWA_I	stwa	%r5, [%r8 + 0x0f44] %asi
	.word 0xfada2f20  ! 334: LDXA_I	ldxa	[%r8, + 0x0f20] %asi, %r29
	.word 0xccd22f40  ! 335: LDSHA_I	ldsha	[%r8, + 0x0f40] %asi, %r6
	.word 0xdcaa26e0  ! 336: STBA_I	stba	%r14, [%r8 + 0x06e0] %asi
	.word 0x82722de4  ! 337: UDIV_I	udiv 	%r8, 0x0de4, %r1
	.word 0x88d20009  ! 338: UMULcc_R	umulcc 	%r8, %r9, %r4
	.word 0xc5f22009  ! 339: CASXA_R	casxa	[%r8]%asi, %r9, %r2
	.word 0xff222d9c  ! 340: STF_I	st	%f31, [0x0d9c, %r8]
	.word 0x1e800002  ! 341: BVC	bvc  	<label_0x2>
	.word 0x88d222a8  ! 342: UMULcc_I	umulcc 	%r8, 0x02a8, %r4
	.word 0x8ed22064  ! 343: UMULcc_I	umulcc 	%r8, 0x0064, %r7
	.word 0xc64a0009  ! 344: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0x00800002  ! 345: BN	bn  	<label_0x2>
	.word 0x8e5a0009  ! 346: SMUL_R	smul 	%r8, %r9, %r7
	.word 0x2cca0001  ! 347: BRGZ	brgz,a,pt	%8,<label_0xa0001>
	.word 0x8143c000  ! 348: STBAR	stbar
	.word 0x8fa208a9  ! 349: FSUBs	fsubs	%f8, %f9, %f7
	.word 0xbe7a23c0  ! 350: SDIV_I	sdiv 	%r8, 0x03c0, %r31
	.word 0xc87a2124  ! 351: SWAP_I	swap	%r4, [%r8 + 0x0124]
	.word 0xccc21009  ! 352: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r6
	.word 0xc2b22418  ! 353: STHA_I	stha	%r1, [%r8 + 0x0418] %asi
	.word 0xbe5a0009  ! 354: SMUL_R	smul 	%r8, %r9, %r31
	.word 0xbafa0009  ! 355: SDIVcc_R	sdivcc 	%r8, %r9, %r29
	.word 0xa7a208a9  ! 356: FSUBs	fsubs	%f8, %f9, %f19
	.word 0x9a7a2b04  ! 357: SDIV_I	sdiv 	%r8, 0x0b04, %r13
	.word 0xc36a2a94  ! 358: PREFETCH_I	prefetch	[%r8 + 0x0a94], #one_read
	.word 0xec5a0009  ! 359: LDX_R	ldx	[%r8 + %r9], %r22
	.word 0x89a20929  ! 360: FMULs	fmuls	%f8, %f9, %f4
	.word 0xcf3a2db8  ! 361: STDF_I	std	%f7, [0x0db8, %r8]
	.word 0xccaa2288  ! 362: STBA_I	stba	%r6, [%r8 + 0x0288] %asi
	.word 0x8a4a2934  ! 364: MULX_I	mulx 	%r8, 0x0934, %r5
	.word 0xc2122104  ! 365: LDUH_I	lduh	[%r8 + 0x0104], %r1
	.word 0x8c7a26d8  ! 366: SDIV_I	sdiv 	%r8, 0x06d8, %r6
	.word 0x832227a4  ! 367: MULScc_I	mulscc 	%r8, 0x07a4, %r1
	.word 0xf8022ff8  ! 368: LDUW_I	lduw	[%r8 + 0x0ff8], %r28
	.word 0x8143e034  ! 369: MEMBAR	membar	#LoadStore | #Lookaside | #MemIssue 
	.word 0xc7220009  ! 370: STF_R	st	%f3, [%r9, %r8]
	.word 0xc36a2d0c  ! 371: PREFETCH_I	prefetch	[%r8 + 0x0d0c], #one_read
	.word 0xc27a2fa8  ! 372: SWAP_I	swap	%r1, [%r8 + 0x0fa8]
	.word 0xc6a22640  ! 373: STWA_I	stwa	%r3, [%r8 + 0x0640] %asi
	.word 0xcec21009  ! 374: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r7
	.word 0x8143c000  ! 375: STBAR	stbar
	.word 0x825a2e30  ! 376: SMUL_I	smul 	%r8, 0x0e30, %r1
	.word 0xe4aa1009  ! 377: STBA_R	stba	%r18, [%r8 + %r9] 0x80
	.word 0x18800001  ! 378: BGU	bgu  	<label_0x1>
	.word 0x8143e033  ! 379: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside | #MemIssue 
	.word 0xcca21009  ! 380: STWA_R	stwa	%r6, [%r8 + %r9] 0x80
	.word 0x8c6a0009  ! 381: UDIVX_R	udivx 	%r8, %r9, %r6
	.word 0x0c800002  ! 382: BNEG	bneg  	<label_0x2>
	.word 0xe4a21009  ! 383: STWA_R	stwa	%r18, [%r8 + %r9] 0x80
	.word 0x8143e033  ! 384: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside | #MemIssue 
	.word 0x88f20009  ! 385: UDIVcc_R	udivcc 	%r8, %r9, %r4
	.word 0xc7e21009  ! 386: CASA_I	casa	[%r8] 0x80, %r9, %r3
	.word 0x86d20009  ! 387: UMULcc_R	umulcc 	%r8, %r9, %r3
	.word 0xc36a2288  ! 388: PREFETCH_I	prefetch	[%r8 + 0x0288], #one_read
	.word 0xc6821009  ! 389: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r3
	.word 0xd4ca1009  ! 391: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r10
	.word 0x8143c000  ! 392: STBAR	stbar
	.word 0xce7a0009  ! 394: SWAP_R	swap	%r7, [%r8 + %r9]
	.word 0x8143c000  ! 395: STBAR	stbar
	.word 0xa27a0009  ! 396: SDIV_R	sdiv 	%r8, %r9, %r17
	.word 0xc20a0009  ! 397: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0x8e4a0009  ! 398: MULX_R	mulx 	%r8, %r9, %r7
	.word 0x2a800001  ! 399: BCS	bcs,a	<label_0x1>
	.word 0xcc82218c  ! 400: LDUWA_I	lduwa	[%r8, + 0x018c] %asi, %r6
	.word 0x0e800001  ! 401: BVS	bvs  	<label_0x1>
	.word 0x8ad22da0  ! 402: UMULcc_I	umulcc 	%r8, 0x0da0, %r5
	.word 0xcb3a0009  ! 403: STDF_R	std	%f5, [%r9, %r8]
	.word 0xae5a250c  ! 404: SMUL_I	smul 	%r8, 0x050c, %r23
	.word 0x2cc20001  ! 405: BRGZ	brgz,a,nt	%8,<label_0x20001>
	.word 0x3a800002  ! 406: BCC	bcc,a	<label_0x2>
	.word 0xdc9a2840  ! 407: LDDA_I	ldda	[%r8, + 0x0840] %asi, %r14
	.word 0x8143c000  ! 408: STBAR	stbar
	.word 0xd8da2fa0  ! 409: LDXA_I	ldxa	[%r8, + 0x0fa0] %asi, %r12
	.word 0xc53a0009  ! 410: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc85a0009  ! 411: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0x8143e06e  ! 412: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #MemIssue | #Sync 
	.word 0xc6f21009  ! 413: STXA_R	stxa	%r3, [%r8 + %r9] 0x80
	.word 0x8e4a23f4  ! 414: MULX_I	mulx 	%r8, 0x03f4, %r7
	.word 0xded21009  ! 415: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r15
	.word 0xf7f22009  ! 416: CASXA_R	casxa	[%r8]%asi, %r9, %r27
	.word 0x8c4a2af8  ! 417: MULX_I	mulx 	%r8, 0x0af8, %r6
	.word 0x8143c000  ! 418: STBAR	stbar
	.word 0xc4da2988  ! 419: LDXA_I	ldxa	[%r8, + 0x0988] %asi, %r2
	.word 0x8ba20829  ! 420: FADDs	fadds	%f8, %f9, %f5
	.word 0xc9220009  ! 421: STF_R	st	%f4, [%r9, %r8]
	.word 0x2cc20001  ! 422: BRGZ	brgz,a,nt	%8,<label_0x20001>
	.word 0x8143e05c  ! 423: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0xceea244c  ! 424: LDSTUBA_I	ldstuba	%r7, [%r8 + 0x044c] %asi
	.word 0x0eca0001  ! 425: BRGEZ	brgez  ,pt	%8,<label_0xa0001>
	.word 0xc6ca297c  ! 426: LDSBA_I	ldsba	[%r8, + 0x097c] %asi, %r3
	.word 0xce6a2b40  ! 427: LDSTUB_I	ldstub	%r7, [%r8 + 0x0b40]
	.word 0xe9220009  ! 428: STF_R	st	%f20, [%r9, %r8]
	.word 0xcd3a2930  ! 429: STDF_I	std	%f6, [0x0930, %r8]
	.word 0x8143e019  ! 430: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside 
	.word 0x8ef20009  ! 431: UDIVcc_R	udivcc 	%r8, %r9, %r7
	.word 0x8e5a0009  ! 432: SMUL_R	smul 	%r8, %r9, %r7
	.word 0xca020009  ! 433: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xdef22198  ! 434: STXA_I	stxa	%r15, [%r8 + 0x0198] %asi
	.word 0xeaaa25ec  ! 435: STBA_I	stba	%r21, [%r8 + 0x05ec] %asi
	.word 0xff3a2c90  ! 436: STDF_I	std	%f31, [0x0c90, %r8]
	.word 0xc3ea2808  ! 437: PREFETCHA_I	prefetcha	[%r8, + 0x0808] %asi, #one_read
	.word 0x8143e006  ! 438: MEMBAR	membar	#StoreLoad | #LoadStore 
	.word 0xa9a209a9  ! 439: FDIVs	fdivs	%f8, %f9, %f20
	.word 0x8143e01a  ! 440: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside 
	.word 0x9fa208a9  ! 441: FSUBs	fsubs	%f8, %f9, %f15
	.word 0xaa720009  ! 442: UDIV_R	udiv 	%r8, %r9, %r21
	.word 0xc8ca245c  ! 443: LDSBA_I	ldsba	[%r8, + 0x045c] %asi, %r4
	.word 0xc73a0009  ! 444: STDF_R	std	%f3, [%r9, %r8]
	.word 0x88f22e40  ! 445: UDIVcc_I	udivcc 	%r8, 0x0e40, %r4
	.word 0xc8fa1009  ! 446: SWAPA_R	swapa	%r4, [%r8 + %r9] 0x80
	.word 0xb26a0009  ! 447: UDIVX_R	udivx 	%r8, %r9, %r25
	.word 0xc4120009  ! 448: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xcd3a2678  ! 449: STDF_I	std	%f6, [0x0678, %r8]
	.word 0xccf22510  ! 450: STXA_I	stxa	%r6, [%r8 + 0x0510] %asi
	.word 0xc8c21009  ! 451: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r4
	.word 0xc2ca1009  ! 452: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r1
	.word 0x3c800001  ! 453: BPOS	bpos,a	<label_0x1>
	.word 0x8143e016  ! 454: MEMBAR	membar	#StoreLoad | #LoadStore | #Lookaside 
	.word 0xfe921009  ! 455: LDUHA_R	lduha	[%r8, %r9] 0x80, %r31
	.word 0xc3ea2b64  ! 456: PREFETCHA_I	prefetcha	[%r8, + 0x0b64] %asi, #one_read
	.word 0xc8fa2bc4  ! 457: SWAPA_I	swapa	%r4, [%r8 + 0x0bc4] %asi
	.word 0x8fa208a9  ! 458: FSUBs	fsubs	%f8, %f9, %f7
	.word 0x8143e001  ! 459: MEMBAR	membar	#LoadLoad 
	.word 0x1a800001  ! 462: BCC	bcc  	<label_0x1>
	.word 0xcaaa21d4  ! 463: STBA_I	stba	%r5, [%r8 + 0x01d4] %asi
	.word 0x00800001  ! 464: BN	bn  	<label_0x1>
	.word 0x86f222fc  ! 465: UDIVcc_I	udivcc 	%r8, 0x02fc, %r3
	.word 0xccf21009  ! 466: STXA_R	stxa	%r6, [%r8 + %r9] 0x80
	.word 0xe4ba2d08  ! 467: STDA_I	stda	%r18, [%r8 + 0x0d08] %asi
	.word 0xf8ba2658  ! 468: STDA_I	stda	%r28, [%r8 + 0x0658] %asi
	.word 0x0aca0001  ! 469: BRNZ	brnz  ,pt	%8,<label_0xa0001>
	.word 0xce8a1009  ! 470: LDUBA_R	lduba	[%r8, %r9] 0x80, %r7
	.word 0xe44a0009  ! 471: LDSB_R	ldsb	[%r8 + %r9], %r18
	.word 0x0cca0001  ! 472: BRGZ	brgz  ,pt	%8,<label_0xa0001>
	.word 0xced221bc  ! 473: LDSHA_I	ldsha	[%r8, + 0x01bc] %asi, %r7
	.word 0xceaa2cc0  ! 474: STBA_I	stba	%r7, [%r8 + 0x0cc0] %asi
	.word 0xc2ea1009  ! 475: LDSTUBA_R	ldstuba	%r1, [%r8 + %r9] 0x80
	.word 0x8143e013  ! 476: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside 
	.word 0xc9e22009  ! 477: CASA_R	casa	[%r8] %asi, %r9, %r4
	.word 0xc36a2884  ! 478: PREFETCH_I	prefetch	[%r8 + 0x0884], #one_read
	.word 0xcca21009  ! 479: STWA_R	stwa	%r6, [%r8 + %r9] 0x80
	.word 0x865a0009  ! 480: SMUL_R	smul 	%r8, %r9, %r3
	.word 0xff3a2a48  ! 481: STDF_I	std	%f31, [0x0a48, %r8]
	.word 0x8143e009  ! 482: MEMBAR	membar	#LoadLoad | #StoreStore 
	.word 0xc89a1009  ! 483: LDDA_R	ldda	[%r8, %r9] 0x80, %r4
	.word 0xc26a0009  ! 485: LDSTUB_R	ldstub	%r1, [%r8 + %r9]
	.word 0x0aca0001  ! 486: BRNZ	brnz  ,pt	%8,<label_0xa0001>
	.word 0x8143c000  ! 487: STBAR	stbar
	.word 0xc41a2388  ! 488: LDD_I	ldd	[%r8 + 0x0388], %r2
	.word 0x876a29cc  ! 489: SDIVX_I	sdivx	%r8, 0x09cc, %r3
	.word 0xed220009  ! 490: STF_R	st	%f22, [%r9, %r8]
	.word 0x84f22f78  ! 491: UDIVcc_I	udivcc 	%r8, 0x0f78, %r2
	.word 0xf8a22bb0  ! 492: STWA_I	stwa	%r28, [%r8 + 0x0bb0] %asi
	.word 0xcafa1009  ! 493: SWAPA_R	swapa	%r5, [%r8 + %r9] 0x80
	.word 0xc36a2e04  ! 494: PREFETCH_I	prefetch	[%r8 + 0x0e04], #one_read
	.word 0x8fa20829  ! 495: FADDs	fadds	%f8, %f9, %f7
	.word 0xce7a0009  ! 496: SWAP_R	swap	%r7, [%r8 + %r9]
	.word 0x8143c000  ! 497: STBAR	stbar
	.word 0x844a0009  ! 498: MULX_R	mulx 	%r8, %r9, %r2
	.word 0xc2ea2410  ! 499: LDSTUBA_I	ldstuba	%r1, [%r8 + 0x0410] %asi
	.word 0xf8c223e0  ! 501: LDSWA_I	ldswa	[%r8, + 0x03e0] %asi, %r28
	.word 0xfc122668  ! 502: LDUH_I	lduh	[%r8 + 0x0668], %r30
	.word 0x3e800002  ! 504: BVC	bvc,a	<label_0x2>
	.word 0xce5a0009  ! 505: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xed220009  ! 506: STF_R	st	%f22, [%r9, %r8]
	.word 0x8143e007  ! 507: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore 
	.word 0xd6ea1009  ! 508: LDSTUBA_R	ldstuba	%r11, [%r8 + %r9] 0x80
	.word 0xa07a2818  ! 509: SDIV_I	sdiv 	%r8, 0x0818, %r16
	.word 0xce6a2068  ! 510: LDSTUB_I	ldstub	%r7, [%r8 + 0x0068]
	.word 0xdab21009  ! 511: STHA_R	stha	%r13, [%r8 + %r9] 0x80
	.word 0xc8b222a0  ! 512: STHA_I	stha	%r4, [%r8 + 0x02a0] %asi
	.word 0xcc7a0009  ! 513: SWAP_R	swap	%r6, [%r8 + %r9]
	.word 0xc6020009  ! 514: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0x8f6a0009  ! 515: SDIVX_R	sdivx	%r8, %r9, %r7
	.word 0x885a0009  ! 516: SMUL_R	smul 	%r8, %r9, %r4
	.word 0x8143c000  ! 517: STBAR	stbar
	.word 0x865a0009  ! 518: SMUL_R	smul 	%r8, %r9, %r3
	.word 0xd7e21009  ! 519: CASA_I	casa	[%r8] 0x80, %r9, %r11
	.word 0xc36a2bf4  ! 520: PREFETCH_I	prefetch	[%r8 + 0x0bf4], #one_read
	.word 0x8c5a0009  ! 521: SMUL_R	smul 	%r8, %r9, %r6
	.word 0x8143c000  ! 522: STBAR	stbar
	.word 0xea4a2b08  ! 523: LDSB_I	ldsb	[%r8 + 0x0b08], %r21
	.word 0xcf2226ac  ! 524: STF_I	st	%f7, [0x06ac, %r8]
	.word 0x846a0009  ! 525: UDIVX_R	udivx 	%r8, %r9, %r2
	.word 0xc53a0009  ! 526: STDF_R	std	%f2, [%r9, %r8]
	.word 0x30800001  ! 527: BA	ba,a	<label_0x1>
	.word 0x8143c000  ! 528: STBAR	stbar
	.word 0xe49a2e68  ! 530: LDDA_I	ldda	[%r8, + 0x0e68] %asi, %r18
	.word 0xde4a2400  ! 531: LDSB_I	ldsb	[%r8 + 0x0400], %r15
	.word 0x8fa20829  ! 532: FADDs	fadds	%f8, %f9, %f7
	.word 0xc3ea2c18  ! 533: PREFETCHA_I	prefetcha	[%r8, + 0x0c18] %asi, #one_read
	.word 0xcde21009  ! 534: CASA_I	casa	[%r8] 0x80, %r9, %r6
	.word 0x8143c000  ! 535: STBAR	stbar
	.word 0x34800001  ! 536: BG	bg,a	<label_0x1>
	.word 0xc45a23f8  ! 537: LDX_I	ldx	[%r8 + 0x03f8], %r2
	.word 0xc6fa22ac  ! 538: SWAPA_I	swapa	%r3, [%r8 + 0x02ac] %asi
	.word 0x8e7a2688  ! 539: SDIV_I	sdiv 	%r8, 0x0688, %r7
	.word 0xafa20929  ! 540: FMULs	fmuls	%f8, %f9, %f23
	.word 0xc8ea1009  ! 541: LDSTUBA_R	ldstuba	%r4, [%r8 + %r9] 0x80
	.word 0xaada2d00  ! 542: SMULcc_I	smulcc 	%r8, 0x0d00, %r21
	.word 0xc8ea1009  ! 543: LDSTUBA_R	ldstuba	%r4, [%r8 + %r9] 0x80
	.word 0xf0822488  ! 544: LDUWA_I	lduwa	[%r8, + 0x0488] %asi, %r24
	.word 0x8143c000  ! 545: STBAR	stbar
	.word 0x40000001  ! 546: CALL	call	disp30_1
	.word 0xee821009  ! 547: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r23
	.word 0x2a800001  ! 548: BCS	bcs,a	<label_0x1>
	.word 0xcd3a0009  ! 549: STDF_R	std	%f6, [%r9, %r8]
	.word 0xfc821009  ! 550: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r30
	.word 0x845a0009  ! 551: SMUL_R	smul 	%r8, %r9, %r2
	.word 0xc8ba1009  ! 552: STDA_R	stda	%r4, [%r8 + %r9] 0x80
	.word 0x8143e035  ! 553: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside | #MemIssue 
	.word 0xa86a0009  ! 554: UDIVX_R	udivx 	%r8, %r9, %r20
	.word 0xc41a2eb0  ! 555: LDD_I	ldd	[%r8 + 0x0eb0], %r2
	.word 0x88522dfc  ! 556: UMUL_I	umul 	%r8, 0x0dfc, %r4
	.word 0x2a800001  ! 557: BCS	bcs,a	<label_0x1>
	.word 0xc36a2014  ! 558: PREFETCH_I	prefetch	[%r8 + 0x0014], #one_read
	.word 0x876a0009  ! 559: SDIVX_R	sdivx	%r8, %r9, %r3
	.word 0xc52225f4  ! 560: STF_I	st	%f2, [0x05f4, %r8]
	.word 0xce02281c  ! 562: LDUW_I	lduw	[%r8 + 0x081c], %r7
	.word 0x8a722568  ! 563: UDIV_I	udiv 	%r8, 0x0568, %r5
	.word 0x8da209a9  ! 564: FDIVs	fdivs	%f8, %f9, %f6
	.word 0xf8ba2408  ! 565: STDA_I	stda	%r28, [%r8 + 0x0408] %asi
	.word 0xc5f21009  ! 566: CASXA_I	casxa	[%r8] 0x80, %r9, %r2
	.word 0xcc6a0009  ! 567: LDSTUB_R	ldstub	%r6, [%r8 + %r9]
	.word 0xca7a248c  ! 568: SWAP_I	swap	%r5, [%r8 + 0x048c]
	.word 0x8cd22fa4  ! 569: UMULcc_I	umulcc 	%r8, 0x0fa4, %r6
	.word 0xc4422270  ! 570: LDSW_I	ldsw	[%r8 + 0x0270], %r2
	.word 0x8e7a0009  ! 571: SDIV_R	sdiv 	%r8, %r9, %r7
	.word 0x22800001  ! 572: BE	be,a	<label_0x1>
	.word 0x876a0009  ! 573: SDIVX_R	sdivx	%r8, %r9, %r3
	.word 0xc36a2a2c  ! 574: PREFETCH_I	prefetch	[%r8 + 0x0a2c], #one_read
	.word 0x22ca0001  ! 575: BRZ	brz,a,pt	%8,<label_0xa0001>
	.word 0xf09a1009  ! 577: LDDA_R	ldda	[%r8, %r9] 0x80, %r24
	.word 0xf2c21009  ! 578: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r25
	.word 0xc7e22009  ! 579: CASA_R	casa	[%r8] %asi, %r9, %r3
	.word 0xfcba2070  ! 580: STDA_I	stda	%r30, [%r8 + 0x0070] %asi
	.word 0xc73a0009  ! 581: STDF_R	std	%f3, [%r9, %r8]
	.word 0xada209a9  ! 582: FDIVs	fdivs	%f8, %f9, %f22
	.word 0xe05225d0  ! 583: LDSH_I	ldsh	[%r8 + 0x05d0], %r16
	.word 0xcef21009  ! 584: STXA_R	stxa	%r7, [%r8 + %r9] 0x80
	.word 0x22ca0001  ! 585: BRZ	brz,a,pt	%8,<label_0xa0001>
	.word 0xce7a0009  ! 586: SWAP_R	swap	%r7, [%r8 + %r9]
	.word 0x8f220009  ! 587: MULScc_R	mulscc 	%r8, %r9, %r7
	.word 0x864a0009  ! 588: MULX_R	mulx 	%r8, %r9, %r3
	.word 0x22ca0001  ! 589: BRZ	brz,a,pt	%8,<label_0xa0001>
	.word 0xa67228f4  ! 590: UDIV_I	udiv 	%r8, 0x08f4, %r19
	.word 0xb6522dd4  ! 591: UMUL_I	umul 	%r8, 0x0dd4, %r27
	.word 0x8f6a0009  ! 592: SDIVX_R	sdivx	%r8, %r9, %r7
	.word 0xc36a299c  ! 593: PREFETCH_I	prefetch	[%r8 + 0x099c], #one_read
	.word 0xc24a0009  ! 594: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0x86520009  ! 595: UMUL_R	umul 	%r8, %r9, %r3
	.word 0xc81a2548  ! 596: LDD_I	ldd	[%r8 + 0x0548], %r4
	.word 0xf4ba2b10  ! 597: STDA_I	stda	%r26, [%r8 + 0x0b10] %asi
	.word 0x00800002  ! 598: BN	bn  	<label_0x2>
	.word 0x24800001  ! 599: BLE	ble,a	<label_0x1>
	.word 0xc8aa2e48  ! 600: STBA_I	stba	%r4, [%r8 + 0x0e48] %asi
	.word 0x82522c60  ! 601: UMUL_I	umul 	%r8, 0x0c60, %r1
	.word 0xd9f21009  ! 602: CASXA_I	casxa	[%r8] 0x80, %r9, %r12
	.word 0xceea1009  ! 605: LDSTUBA_R	ldstuba	%r7, [%r8 + %r9] 0x80
	.word 0xef3a2160  ! 606: STDF_I	std	%f23, [0x0160, %r8]
	.word 0xbeda2630  ! 607: SMULcc_I	smulcc 	%r8, 0x0630, %r31
	.word 0xc4b22ddc  ! 608: STHA_I	stha	%r2, [%r8 + 0x0ddc] %asi
	.word 0xc53a29d8  ! 609: STDF_I	std	%f2, [0x09d8, %r8]
	.word 0x98520009  ! 610: UMUL_R	umul 	%r8, %r9, %r12
	.word 0xc86a0009  ! 611: LDSTUB_R	ldstub	%r4, [%r8 + %r9]
	.word 0xce6a0009  ! 612: LDSTUB_R	ldstub	%r7, [%r8 + %r9]
	.word 0xb86a2990  ! 613: UDIVX_I	udivx 	%r8, 0x0990, %r28
	.word 0xe2f224f0  ! 614: STXA_I	stxa	%r17, [%r8 + 0x04f0] %asi
	.word 0xc36a25a8  ! 615: PREFETCH_I	prefetch	[%r8 + 0x05a8], #one_read
	.word 0xcc4a0009  ! 616: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0x28800001  ! 618: BLEU	bleu,a	<label_0x1>
	.word 0xce5a29a8  ! 619: LDX_I	ldx	[%r8 + 0x09a8], %r7
	.word 0x2ac20001  ! 620: BRNZ	brnz,a,nt	%8,<label_0x20001>
	.word 0x8e6a2628  ! 621: UDIVX_I	udivx 	%r8, 0x0628, %r7
	.word 0xc2a228cc  ! 622: STWA_I	stwa	%r1, [%r8 + 0x08cc] %asi
	.word 0xa9a209a9  ! 623: FDIVs	fdivs	%f8, %f9, %f20
	.word 0xfe5a2408  ! 624: LDX_I	ldx	[%r8 + 0x0408], %r31
	.word 0xc68a27f0  ! 625: LDUBA_I	lduba	[%r8, + 0x07f0] %asi, %r3
	.word 0xc87a0009  ! 627: SWAP_R	swap	%r4, [%r8 + %r9]
	.word 0x83a20929  ! 628: FMULs	fmuls	%f8, %f9, %f1
	.word 0x99a20829  ! 629: FADDs	fadds	%f8, %f9, %f12
	.word 0x86d20009  ! 630: UMULcc_R	umulcc 	%r8, %r9, %r3
	.word 0xf7f22009  ! 631: CASXA_R	casxa	[%r8]%asi, %r9, %r27
	.word 0xfaf22968  ! 632: STXA_I	stxa	%r29, [%r8 + 0x0968] %asi
	.word 0xa2522538  ! 633: UMUL_I	umul 	%r8, 0x0538, %r17
	.word 0x8143e069  ! 634: MEMBAR	membar	#LoadLoad | #StoreStore | #MemIssue | #Sync 
	.word 0xce821009  ! 635: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r7
	.word 0xe1f22009  ! 636: CASXA_R	casxa	[%r8]%asi, %r9, %r16
	.word 0xc8020009  ! 637: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xe68a2f80  ! 638: LDUBA_I	lduba	[%r8, + 0x0f80] %asi, %r19
	.word 0xe6a22328  ! 639: STWA_I	stwa	%r19, [%r8 + 0x0328] %asi
	.word 0xe7e22009  ! 640: CASA_R	casa	[%r8] %asi, %r9, %r19
	.word 0xc3ea2440  ! 641: PREFETCHA_I	prefetcha	[%r8, + 0x0440] %asi, #one_read
	.word 0x83a209a9  ! 642: FDIVs	fdivs	%f8, %f9, %f1
	.word 0xc61224b4  ! 643: LDUH_I	lduh	[%r8 + 0x04b4], %r3
	.word 0xc8f224b0  ! 644: STXA_I	stxa	%r4, [%r8 + 0x04b0] %asi
	.word 0x8143c000  ! 645: STBAR	stbar
	.word 0x8c522d44  ! 646: UMUL_I	umul 	%r8, 0x0d44, %r6
	.word 0x8143c000  ! 647: STBAR	stbar
	.word 0xc4821009  ! 648: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r2
	.word 0x8e4a2dd8  ! 649: MULX_I	mulx 	%r8, 0x0dd8, %r7
	.word 0x8d220009  ! 650: MULScc_R	mulscc 	%r8, %r9, %r6
	.word 0x9e6a0009  ! 651: UDIVX_R	udivx 	%r8, %r9, %r15
	.word 0xca921009  ! 652: LDUHA_R	lduha	[%r8, %r9] 0x80, %r5
	.word 0xed3a0009  ! 653: STDF_R	std	%f22, [%r9, %r8]
	.word 0x06c20001  ! 654: BRLZ	brlz  ,nt	%8,<label_0x20001>
	.word 0x86522458  ! 655: UMUL_I	umul 	%r8, 0x0458, %r3
	.word 0xaa4a0009  ! 656: MULX_R	mulx 	%r8, %r9, %r21
	.word 0x36800002  ! 657: BGE	bge,a	<label_0x2>
	.word 0xceda22a8  ! 658: LDXA_I	ldxa	[%r8, + 0x02a8] %asi, %r7
	.word 0xc3ea2a58  ! 659: PREFETCHA_I	prefetcha	[%r8, + 0x0a58] %asi, #one_read
	.word 0xc4ba1009  ! 660: STDA_R	stda	%r2, [%r8 + %r9] 0x80
	.word 0x9cd20009  ! 661: UMULcc_R	umulcc 	%r8, %r9, %r14
	.word 0xceca29ec  ! 662: LDSBA_I	ldsba	[%r8, + 0x09ec] %asi, %r7
	.word 0xec422080  ! 663: LDSW_I	ldsw	[%r8 + 0x0080], %r22
	.word 0xcb22221c  ! 664: STF_I	st	%f5, [0x021c, %r8]
	.word 0x8e4a0009  ! 666: MULX_R	mulx 	%r8, %r9, %r7
	.word 0x8da20829  ! 667: FADDs	fadds	%f8, %f9, %f6
	.word 0x8143e001  ! 668: MEMBAR	membar	#LoadLoad 
	.word 0xce821009  ! 669: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r7
	.word 0x04ca0001  ! 670: BRLEZ	brlez  ,pt	%8,<label_0xa0001>
	.word 0xe9220009  ! 671: STF_R	st	%f20, [%r9, %r8]
	.word 0x8b220009  ! 672: MULScc_R	mulscc 	%r8, %r9, %r5
	.word 0xa8f223f4  ! 673: UDIVcc_I	udivcc 	%r8, 0x03f4, %r20
	.word 0xc36a2990  ! 674: PREFETCH_I	prefetch	[%r8 + 0x0990], #one_read
	.word 0xd4ba1009  ! 675: STDA_R	stda	%r10, [%r8 + %r9] 0x80
	.word 0xca120009  ! 676: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0x8143e059  ! 677: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside | #Sync 
	.word 0x8143c000  ! 678: STBAR	stbar
	.word 0xdaaa1009  ! 679: STBA_R	stba	%r13, [%r8 + %r9] 0x80
	.word 0xf4ea1009  ! 680: LDSTUBA_R	ldstuba	%r26, [%r8 + %r9] 0x80
	.word 0xe89a1009  ! 681: LDDA_R	ldda	[%r8, %r9] 0x80, %r20
	.word 0xc2ea1009  ! 682: LDSTUBA_R	ldstuba	%r1, [%r8 + %r9] 0x80
	.word 0x82522944  ! 683: UMUL_I	umul 	%r8, 0x0944, %r1
	.word 0x845a0009  ! 684: SMUL_R	smul 	%r8, %r9, %r2
	.word 0x8143e065  ! 686: MEMBAR	membar	#LoadLoad | #LoadStore | #MemIssue | #Sync 
	.word 0xc3ea22e8  ! 687: PREFETCHA_I	prefetcha	[%r8, + 0x02e8] %asi, #one_read
	.word 0xc46a0009  ! 688: LDSTUB_R	ldstub	%r2, [%r8 + %r9]
	.word 0x966a0009  ! 689: UDIVX_R	udivx 	%r8, %r9, %r11
	.word 0x28800001  ! 690: BLEU	bleu,a	<label_0x1>
	.word 0x0ec20001  ! 691: BRGEZ	brgez  ,nt	%8,<label_0x20001>
	.word 0x83220009  ! 693: MULScc_R	mulscc 	%r8, %r9, %r1
	.word 0xcaca1009  ! 694: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r5
	.word 0x06800002  ! 695: BL	bl  	<label_0x2>
	.word 0xfa422748  ! 696: LDSW_I	ldsw	[%r8 + 0x0748], %r29
	.word 0xca020009  ! 697: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xce6a2f80  ! 698: LDSTUB_I	ldstub	%r7, [%r8 + 0x0f80]
	.word 0xccc21009  ! 699: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r6
	.word 0x8143c000  ! 700: STBAR	stbar
	.word 0x8a5a2958  ! 701: SMUL_I	smul 	%r8, 0x0958, %r5
	.word 0x30800001  ! 702: BA	ba,a	<label_0x1>
	.word 0xef3a0009  ! 703: STDF_R	std	%f23, [%r9, %r8]
	.word 0xcc5a2830  ! 704: LDX_I	ldx	[%r8 + 0x0830], %r6
	.word 0xf8f21009  ! 705: STXA_R	stxa	%r28, [%r8 + %r9] 0x80
	.word 0x8143e01b  ! 706: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Lookaside 
	.word 0xc4da2348  ! 707: LDXA_I	ldxa	[%r8, + 0x0348] %asi, %r2
	.word 0xc7222a48  ! 708: STF_I	st	%f3, [0x0a48, %r8]
	.word 0xce5a0009  ! 709: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xc3ea2c04  ! 710: PREFETCHA_I	prefetcha	[%r8, + 0x0c04] %asi, #one_read
	.word 0xccd21009  ! 711: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r6
	.word 0xb46a23f0  ! 712: UDIVX_I	udivx 	%r8, 0x03f0, %r26
	.word 0xa7222e0c  ! 713: MULScc_I	mulscc 	%r8, 0x0e0c, %r19
	.word 0x9c7a2cd0  ! 714: SDIV_I	sdiv 	%r8, 0x0cd0, %r14
	.word 0xe45a29f8  ! 715: LDX_I	ldx	[%r8 + 0x09f8], %r18
	.word 0x8143e014  ! 716: MEMBAR	membar	#LoadStore | #Lookaside 
	.word 0xe8b226c4  ! 717: STHA_I	stha	%r20, [%r8 + 0x06c4] %asi
	.word 0x8c52292c  ! 718: UMUL_I	umul 	%r8, 0x092c, %r6
	.word 0xc47a235c  ! 719: SWAP_I	swap	%r2, [%r8 + 0x035c]
	.word 0x8143e00e  ! 720: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore 
	.word 0x1a800001  ! 721: BCC	bcc  	<label_0x1>
	.word 0x884a2fbc  ! 722: MULX_I	mulx 	%r8, 0x0fbc, %r4
	.word 0xc5220009  ! 723: STF_R	st	%f2, [%r9, %r8]
	.word 0x8143c000  ! 724: STBAR	stbar
	.word 0x8143e079  ! 725: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xca122e20  ! 726: LDUH_I	lduh	[%r8 + 0x0e20], %r5
	.word 0xc5f22009  ! 727: CASXA_R	casxa	[%r8]%asi, %r9, %r2
	.word 0xd81a0009  ! 728: LDD_R	ldd	[%r8 + %r9], %r12
	.word 0xd89a2828  ! 729: LDDA_I	ldda	[%r8, + 0x0828] %asi, %r12
	.word 0x8143e004  ! 730: MEMBAR	membar	#LoadStore 
	.word 0xbf6a0009  ! 731: SDIVX_R	sdivx	%r8, %r9, %r31
	.word 0x8da208a9  ! 732: FSUBs	fsubs	%f8, %f9, %f6
	.word 0xcc020009  ! 733: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xc4aa2374  ! 734: STBA_I	stba	%r2, [%r8 + 0x0374] %asi
	.word 0xc80a2064  ! 735: LDUB_I	ldub	[%r8 + 0x0064], %r4
	.word 0xae522210  ! 736: UMUL_I	umul 	%r8, 0x0210, %r23
	.word 0x8143c000  ! 737: STBAR	stbar
	.word 0xdeaa1009  ! 738: STBA_R	stba	%r15, [%r8 + %r9] 0x80
	.word 0xc8aa243c  ! 739: STBA_I	stba	%r4, [%r8 + 0x043c] %asi
	.word 0x82522cb0  ! 740: UMUL_I	umul 	%r8, 0x0cb0, %r1
	.word 0x8cda0009  ! 741: SMULcc_R	smulcc 	%r8, %r9, %r6
	.word 0xc36a26d0  ! 742: PREFETCH_I	prefetch	[%r8 + 0x06d0], #one_read
	.word 0x18800002  ! 743: BGU	bgu  	<label_0x2>
	.word 0x8143e059  ! 744: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside | #Sync 
	.word 0xd41a2e20  ! 745: LDD_I	ldd	[%r8 + 0x0e20], %r10
	.word 0xe2120009  ! 746: LDUH_R	lduh	[%r8 + %r9], %r17
	.word 0xc4ea2374  ! 747: LDSTUBA_I	ldstuba	%r2, [%r8 + 0x0374] %asi
	.word 0xce0a0009  ! 748: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0x8143c000  ! 749: STBAR	stbar
	.word 0x8d6a20cc  ! 750: SDIVX_I	sdivx	%r8, 0x00cc, %r6
	.word 0x36800002  ! 751: BGE	bge,a	<label_0x2>
	.word 0xcf3a2280  ! 752: STDF_I	std	%f7, [0x0280, %r8]
	.word 0xcfe21009  ! 753: CASA_I	casa	[%r8] 0x80, %r9, %r7
	.word 0xc65a25e0  ! 754: LDX_I	ldx	[%r8 + 0x05e0], %r3
	.word 0x8143c000  ! 755: STBAR	stbar
	.word 0x2ec20001  ! 756: BRGEZ	brgez,a,nt	%8,<label_0x20001>
	.word 0xe4520009  ! 757: LDSH_R	ldsh	[%r8 + %r9], %r18
	.word 0x86720009  ! 758: UDIV_R	udiv 	%r8, %r9, %r3
	.word 0x88da0009  ! 759: SMULcc_R	smulcc 	%r8, %r9, %r4
	.word 0x827a0009  ! 760: SDIV_R	sdiv 	%r8, %r9, %r1
	.word 0xdeea1009  ! 761: LDSTUBA_R	ldstuba	%r15, [%r8 + %r9] 0x80
	.word 0x876a269c  ! 762: SDIVX_I	sdivx	%r8, 0x069c, %r3
	.word 0xcaa21009  ! 763: STWA_R	stwa	%r5, [%r8 + %r9] 0x80
	.word 0x996a2874  ! 764: SDIVX_I	sdivx	%r8, 0x0874, %r12
	.word 0x89220009  ! 765: MULScc_R	mulscc 	%r8, %r9, %r4
	.word 0xc36a25e0  ! 766: PREFETCH_I	prefetch	[%r8 + 0x05e0], #one_read
	.word 0xccba1009  ! 767: STDA_R	stda	%r6, [%r8 + %r9] 0x80
	.word 0x987a0009  ! 768: SDIV_R	sdiv 	%r8, %r9, %r12
	.word 0x8c7a0009  ! 769: SDIV_R	sdiv 	%r8, %r9, %r6
	.word 0xf47a21cc  ! 770: SWAP_I	swap	%r26, [%r8 + 0x01cc]
	.word 0xd6fa1009  ! 771: SWAPA_R	swapa	%r11, [%r8 + %r9] 0x80
	.word 0xc4b21009  ! 772: STHA_R	stha	%r2, [%r8 + %r9] 0x80
	.word 0x2aca0001  ! 773: BRNZ	brnz,a,pt	%8,<label_0xa0001>
	.word 0x8143e011  ! 774: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x8143e068  ! 775: MEMBAR	membar	#StoreStore | #MemIssue | #Sync 
	.word 0x8143c000  ! 776: STBAR	stbar
	.word 0x22800002  ! 777: BE	be,a	<label_0x2>
	.word 0x987a0009  ! 778: SDIV_R	sdiv 	%r8, %r9, %r12
	.word 0xe0a223bc  ! 779: STWA_I	stwa	%r16, [%r8 + 0x03bc] %asi
	.word 0xce522ea8  ! 780: LDSH_I	ldsh	[%r8 + 0x0ea8], %r7
	.word 0xc6a21009  ! 781: STWA_R	stwa	%r3, [%r8 + %r9] 0x80
	.word 0xc8c225f0  ! 782: LDSWA_I	ldswa	[%r8, + 0x05f0] %asi, %r4
	.word 0xf93a0009  ! 783: STDF_R	std	%f28, [%r9, %r8]
	.word 0x96fa2ab0  ! 784: SDIVcc_I	sdivcc 	%r8, 0x0ab0, %r11
	.word 0xd81a2bb8  ! 785: LDD_I	ldd	[%r8 + 0x0bb8], %r12
	.word 0xda921009  ! 786: LDUHA_R	lduha	[%r8, %r9] 0x80, %r13
	.word 0xcd220009  ! 787: STF_R	st	%f6, [%r9, %r8]
	.word 0xc6fa2b98  ! 788: SWAPA_I	swapa	%r3, [%r8 + 0x0b98] %asi
	.word 0x96fa2bd0  ! 789: SDIVcc_I	sdivcc 	%r8, 0x0bd0, %r11
	.word 0xcbf21009  ! 790: CASXA_I	casxa	[%r8] 0x80, %r9, %r5
	.word 0xdcba1009  ! 791: STDA_R	stda	%r14, [%r8 + %r9] 0x80
	.word 0x32800001  ! 792: BNE	bne,a	<label_0x1>
	.word 0xccca2758  ! 793: LDSBA_I	ldsba	[%r8, + 0x0758] %asi, %r6
	.word 0xf3222640  ! 794: STF_I	st	%f25, [0x0640, %r8]
	.word 0xc6c21009  ! 795: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r3
	.word 0xc3ea2a40  ! 796: PREFETCHA_I	prefetcha	[%r8, + 0x0a40] %asi, #one_read
	.word 0x12800001  ! 797: BNE	bne  	<label_0x1>
	.word 0x824a0009  ! 798: MULX_R	mulx 	%r8, %r9, %r1
	.word 0x8da208a9  ! 800: FSUBs	fsubs	%f8, %f9, %f6
	.word 0xc48a1009  ! 801: LDUBA_R	lduba	[%r8, %r9] 0x80, %r2
	.word 0x26ca0001  ! 802: BRLZ	brlz,a,pt	%8,<label_0xa0001>
	.word 0xfaa22fd4  ! 804: STWA_I	stwa	%r29, [%r8 + 0x0fd4] %asi
	.word 0x887a2310  ! 806: SDIV_I	sdiv 	%r8, 0x0310, %r4
	.word 0xc84a0009  ! 807: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0x8143e010  ! 808: MEMBAR	membar	#Lookaside 
	.word 0x82fa2610  ! 809: SDIVcc_I	sdivcc 	%r8, 0x0610, %r1
	.word 0xc8d22a2c  ! 811: LDSHA_I	ldsha	[%r8, + 0x0a2c] %asi, %r4
	.word 0xba5a2640  ! 812: SMUL_I	smul 	%r8, 0x0640, %r29
	.word 0x36800001  ! 813: BGE	bge,a	<label_0x1>
	.word 0x18800002  ! 814: BGU	bgu  	<label_0x2>
	.word 0xeb220009  ! 815: STF_R	st	%f21, [%r9, %r8]
	.word 0x40000002  ! 816: CALL	call	disp30_2
	.word 0xc67a2dbc  ! 817: SWAP_I	swap	%r3, [%r8 + 0x0dbc]
	.word 0x8a6a0009  ! 818: UDIVX_R	udivx 	%r8, %r9, %r5
	.word 0xc3ea2154  ! 819: PREFETCHA_I	prefetcha	[%r8, + 0x0154] %asi, #one_read
	.word 0xcb220009  ! 820: STF_R	st	%f5, [%r9, %r8]
	.word 0xe41a0009  ! 821: LDD_R	ldd	[%r8 + %r9], %r18
	.word 0x8143e04f  ! 822: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #Sync 
	.word 0xfcba2598  ! 823: STDA_I	stda	%r30, [%r8 + 0x0598] %asi
	.word 0xeeaa201c  ! 824: STBA_I	stba	%r23, [%r8 + 0x001c] %asi
	.word 0xc4522a68  ! 825: LDSH_I	ldsh	[%r8 + 0x0a68], %r2
	.word 0x9ada225c  ! 826: SMULcc_I	smulcc 	%r8, 0x025c, %r13
	.word 0x82522d88  ! 827: UMUL_I	umul 	%r8, 0x0d88, %r1
	.word 0xe6ea2688  ! 829: LDSTUBA_I	ldstuba	%r19, [%r8 + 0x0688] %asi
	.word 0x8143c000  ! 830: STBAR	stbar
	.word 0xc66a0009  ! 831: LDSTUB_R	ldstub	%r3, [%r8 + %r9]
	.word 0x8c6a0009  ! 832: UDIVX_R	udivx 	%r8, %r9, %r6
	.word 0xeeb22a58  ! 833: STHA_I	stha	%r23, [%r8 + 0x0a58] %asi
	.word 0x8143e06e  ! 834: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #MemIssue | #Sync 
	.word 0xdc1a2cd0  ! 835: LDD_I	ldd	[%r8 + 0x0cd0], %r14
	.word 0xc36a2c1c  ! 836: PREFETCH_I	prefetch	[%r8 + 0x0c1c], #one_read
	.word 0xc4a21009  ! 837: STWA_R	stwa	%r2, [%r8 + %r9] 0x80
	.word 0xcaa21009  ! 838: STWA_R	stwa	%r5, [%r8 + %r9] 0x80
	.word 0xe46a0009  ! 839: LDSTUB_R	ldstub	%r18, [%r8 + %r9]
	.word 0x8143e07b  ! 840: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xcaea2d50  ! 841: LDSTUBA_I	ldstuba	%r5, [%r8 + 0x0d50] %asi
	.word 0x885a0009  ! 842: SMUL_R	smul 	%r8, %r9, %r4
	.word 0x992226d8  ! 843: MULScc_I	mulscc 	%r8, 0x06d8, %r12
	.word 0xcbf21009  ! 845: CASXA_I	casxa	[%r8] 0x80, %r9, %r5
	.word 0xcc921009  ! 846: LDUHA_R	lduha	[%r8, %r9] 0x80, %r6
	.word 0x95a208a9  ! 847: FSUBs	fsubs	%f8, %f9, %f10
	.word 0x0c800002  ! 848: BNEG	bneg  	<label_0x2>
	.word 0x8143e016  ! 849: MEMBAR	membar	#StoreLoad | #LoadStore | #Lookaside 
	.word 0x8143c000  ! 850: STBAR	stbar
	.word 0xc3ea20d8  ! 851: PREFETCHA_I	prefetcha	[%r8, + 0x00d8] %asi, #one_read
	.word 0x0e800001  ! 852: BVS	bvs  	<label_0x1>
	.word 0x8143e01b  ! 853: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Lookaside 
	.word 0x9ba20829  ! 854: FADDs	fadds	%f8, %f9, %f13
	.word 0xe8ba1009  ! 855: STDA_R	stda	%r20, [%r8 + %r9] 0x80
	.word 0xcaea2f58  ! 856: LDSTUBA_I	ldstuba	%r5, [%r8 + 0x0f58] %asi
	.word 0x16800002  ! 857: BGE	bge  	<label_0x2>
	.word 0xbda209a9  ! 858: FDIVs	fdivs	%f8, %f9, %f30
	.word 0xc4f22650  ! 859: STXA_I	stxa	%r2, [%r8 + 0x0650] %asi
	.word 0xc6b21009  ! 860: STHA_R	stha	%r3, [%r8 + %r9] 0x80
	.word 0x16800001  ! 861: BGE	bge  	<label_0x1>
	.word 0xd8da1009  ! 863: LDXA_R	ldxa	[%r8, %r9] 0x80, %r12
	.word 0x8143e07e  ! 864: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xeeb224c8  ! 865: STHA_I	stha	%r23, [%r8 + 0x04c8] %asi
	.word 0x3a800001  ! 866: BCC	bcc,a	<label_0x1>
	.word 0x00800001  ! 867: BN	bn  	<label_0x1>
	.word 0x825a0009  ! 868: SMUL_R	smul 	%r8, %r9, %r1
	.word 0xc2921009  ! 869: LDUHA_R	lduha	[%r8, %r9] 0x80, %r1
	.word 0xce7a0009  ! 870: SWAP_R	swap	%r7, [%r8 + %r9]
	.word 0x8e520009  ! 871: UMUL_R	umul 	%r8, %r9, %r7
	.word 0xca7a263c  ! 872: SWAP_I	swap	%r5, [%r8 + 0x063c]
	.word 0xcab22c10  ! 873: STHA_I	stha	%r5, [%r8 + 0x0c10] %asi
	.word 0xcad22b3c  ! 874: LDSHA_I	ldsha	[%r8, + 0x0b3c] %asi, %r5
	.word 0xc25a0009  ! 875: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0x885223d4  ! 876: UMUL_I	umul 	%r8, 0x03d4, %r4
	.word 0x9cf22510  ! 877: UDIVcc_I	udivcc 	%r8, 0x0510, %r14
	.word 0xc53a0009  ! 878: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc36a2504  ! 879: PREFETCH_I	prefetch	[%r8 + 0x0504], #one_read
	.word 0x8143c000  ! 880: STBAR	stbar
	.word 0xc4ea1009  ! 881: LDSTUBA_R	ldstuba	%r2, [%r8 + %r9] 0x80
	.word 0x824a0009  ! 884: MULX_R	mulx 	%r8, %r9, %r1
	.word 0x865a2a94  ! 885: SMUL_I	smul 	%r8, 0x0a94, %r3
	.word 0xf8ba2bc0  ! 886: STDA_I	stda	%r28, [%r8 + 0x0bc0] %asi
	.word 0x12800002  ! 887: BNE	bne  	<label_0x2>
	.word 0xc25a2b20  ! 888: LDX_I	ldx	[%r8 + 0x0b20], %r1
	.word 0x26ca0001  ! 889: BRLZ	brlz,a,pt	%8,<label_0xa0001>
	.word 0xce420009  ! 890: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xc8aa20c4  ! 891: STBA_I	stba	%r4, [%r8 + 0x00c4] %asi
	.word 0x0eca0001  ! 892: BRGEZ	brgez  ,pt	%8,<label_0xa0001>
	.word 0xbba208a9  ! 893: FSUBs	fsubs	%f8, %f9, %f29
	.word 0x8a7a0009  ! 894: SDIV_R	sdiv 	%r8, %r9, %r5
	.word 0xae720009  ! 895: UDIV_R	udiv 	%r8, %r9, %r23
	.word 0x84da2c10  ! 896: SMULcc_I	smulcc 	%r8, 0x0c10, %r2
	.word 0x8143e07a  ! 897: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xc41a0009  ! 898: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xc3ea2118  ! 899: PREFETCHA_I	prefetcha	[%r8, + 0x0118] %asi, #one_read
	.word 0x8143c000  ! 900: STBAR	stbar
	.word 0x8c6a0009  ! 903: UDIVX_R	udivx 	%r8, %r9, %r6
	.word 0xc33a2568  ! 904: STDF_I	std	%f1, [0x0568, %r8]
	.word 0xdc9a2bc8  ! 905: LDDA_I	ldda	[%r8, + 0x0bc8] %asi, %r14
	.word 0x8143e046  ! 906: MEMBAR	membar	#StoreLoad | #LoadStore | #Sync 
	.word 0xc4da26d0  ! 907: LDXA_I	ldxa	[%r8, + 0x06d0] %asi, %r2
	.word 0xc26a0009  ! 908: LDSTUB_R	ldstub	%r1, [%r8 + %r9]
	.word 0xcef22300  ! 909: STXA_I	stxa	%r7, [%r8 + 0x0300] %asi
	.word 0x8143e05a  ! 910: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside | #Sync 
	.word 0x02800001  ! 911: BE	be  	<label_0x1>
	.word 0xcc520009  ! 912: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0x8ba209a9  ! 913: FDIVs	fdivs	%f8, %f9, %f5
	.word 0xc4f21009  ! 914: STXA_R	stxa	%r2, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 915: STBAR	stbar
	.word 0xc3ea21f0  ! 916: PREFETCHA_I	prefetcha	[%r8, + 0x01f0] %asi, #one_read
	.word 0x8143c000  ! 917: STBAR	stbar
	.word 0xccaa2a3c  ! 918: STBA_I	stba	%r6, [%r8 + 0x0a3c] %asi
	.word 0xc7f22009  ! 920: CASXA_R	casxa	[%r8]%asi, %r9, %r3
	.word 0x12800001  ! 921: BNE	bne  	<label_0x1>
	.word 0xfc9a1009  ! 922: LDDA_R	ldda	[%r8, %r9] 0x80, %r30
	.word 0xe09a1009  ! 923: LDDA_R	ldda	[%r8, %r9] 0x80, %r16
	.word 0x97a209a9  ! 924: FDIVs	fdivs	%f8, %f9, %f11
	.word 0xa0da0009  ! 925: SMULcc_R	smulcc 	%r8, %r9, %r16
	.word 0xc45a2a10  ! 926: LDX_I	ldx	[%r8 + 0x0a10], %r2
	.word 0xc8ca2c14  ! 927: LDSBA_I	ldsba	[%r8, + 0x0c14] %asi, %r4
	.word 0xaf6a0009  ! 928: SDIVX_R	sdivx	%r8, %r9, %r23
	.word 0xb46a0009  ! 929: UDIVX_R	udivx 	%r8, %r9, %r26
	.word 0x8143e047  ! 930: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Sync 
	.word 0xf0ea1009  ! 931: LDSTUBA_R	ldstuba	%r24, [%r8 + %r9] 0x80
	.word 0xce420009  ! 932: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0x9e6a0009  ! 933: UDIVX_R	udivx 	%r8, %r9, %r15
	.word 0xc4aa1009  ! 934: STBA_R	stba	%r2, [%r8 + %r9] 0x80
	.word 0x8143e05b  ! 935: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Lookaside | #Sync 
	.word 0xe46a0009  ! 936: LDSTUB_R	ldstub	%r18, [%r8 + %r9]
	.word 0x97a20929  ! 937: FMULs	fmuls	%f8, %f9, %f11
	.word 0x8143e040  ! 938: MEMBAR	membar	#Sync 
	.word 0xc36a2b30  ! 939: PREFETCH_I	prefetch	[%r8 + 0x0b30], #one_read
	.word 0xf27a0009  ! 940: SWAP_R	swap	%r25, [%r8 + %r9]
	.word 0xce4a2b18  ! 941: LDSB_I	ldsb	[%r8 + 0x0b18], %r7
	.word 0x22800001  ! 944: BE	be,a	<label_0x1>
	.word 0x867a0009  ! 945: SDIV_R	sdiv 	%r8, %r9, %r3
	.word 0xc3220009  ! 947: STF_R	st	%f1, [%r9, %r8]
	.word 0xfeb22b1c  ! 948: STHA_I	stha	%r31, [%r8 + 0x0b1c] %asi
	.word 0xccca275c  ! 949: LDSBA_I	ldsba	[%r8, + 0x075c] %asi, %r6
	.word 0xcaca2fcc  ! 950: LDSBA_I	ldsba	[%r8, + 0x0fcc] %asi, %r5
	.word 0x8cda2b08  ! 951: SMULcc_I	smulcc 	%r8, 0x0b08, %r6
	.word 0xce7a2498  ! 952: SWAP_I	swap	%r7, [%r8 + 0x0498]
	.word 0xc7e22009  ! 953: CASA_R	casa	[%r8] %asi, %r9, %r3
	.word 0x04800001  ! 954: BLE	ble  	<label_0x1>
	.word 0xbc720009  ! 955: UDIV_R	udiv 	%r8, %r9, %r30
	.word 0xf2da1009  ! 956: LDXA_R	ldxa	[%r8, %r9] 0x80, %r25
	.word 0xc36a2a1c  ! 957: PREFETCH_I	prefetch	[%r8 + 0x0a1c], #one_read
	.word 0xe6122a08  ! 958: LDUH_I	lduh	[%r8 + 0x0a08], %r19
	.word 0xc46a0009  ! 961: LDSTUB_R	ldstub	%r2, [%r8 + %r9]
	.word 0xe4b21009  ! 963: STHA_R	stha	%r18, [%r8 + %r9] 0x80
	.word 0xca8a1009  ! 965: LDUBA_R	lduba	[%r8, %r9] 0x80, %r5
	.word 0x9c4a0009  ! 966: MULX_R	mulx 	%r8, %r9, %r14
	.word 0xc8a21009  ! 967: STWA_R	stwa	%r4, [%r8 + %r9] 0x80
	.word 0xe24a205c  ! 968: LDSB_I	ldsb	[%r8 + 0x005c], %r17
	.word 0x8143c000  ! 970: STBAR	stbar
	.word 0xfaa22a80  ! 973: STWA_I	stwa	%r29, [%r8 + 0x0a80] %asi
	.word 0xf4b22de8  ! 974: STHA_I	stha	%r26, [%r8 + 0x0de8] %asi
	.word 0x8143e031  ! 975: MEMBAR	membar	#LoadLoad | #Lookaside | #MemIssue 
	.word 0xc87a0009  ! 976: SWAP_R	swap	%r4, [%r8 + %r9]
	.word 0x8143e04e  ! 977: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Sync 
	.word 0xb6fa26c4  ! 978: SDIVcc_I	sdivcc 	%r8, 0x06c4, %r27
	.word 0x8af22c48  ! 979: UDIVcc_I	udivcc 	%r8, 0x0c48, %r5
	.word 0xccb21009  ! 980: STHA_R	stha	%r6, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 981: STBAR	stbar
	.word 0x00800001  ! 982: BN	bn  	<label_0x1>
	.word 0xccba2c60  ! 983: STDA_I	stda	%r6, [%r8 + 0x0c60] %asi
	.word 0xc7220009  ! 984: STF_R	st	%f3, [%r9, %r8]
	.word 0xf28221cc  ! 985: LDUWA_I	lduwa	[%r8, + 0x01cc] %asi, %r25
	.word 0xc4ea1009  ! 986: LDSTUBA_R	ldstuba	%r2, [%r8 + %r9] 0x80
	.word 0xa2d20009  ! 987: UMULcc_R	umulcc 	%r8, %r9, %r17
	.word 0xc4ca1009  ! 988: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r2
	.word 0xbafa2790  ! 989: SDIVcc_I	sdivcc 	%r8, 0x0790, %r29
	.word 0xfcd21009  ! 990: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r30
	.word 0xde7a0009  ! 991: SWAP_R	swap	%r15, [%r8 + %r9]
	.word 0xde8a1009  ! 992: LDUBA_R	lduba	[%r8, %r9] 0x80, %r15
	.word 0xf6921009  ! 993: LDUHA_R	lduha	[%r8, %r9] 0x80, %r27
	.word 0xc3ea26a8  ! 994: PREFETCHA_I	prefetcha	[%r8, + 0x06a8] %asi, #one_read
	.word 0xbcfa236c  ! 997: SDIVcc_I	sdivcc 	%r8, 0x036c, %r30
	.word 0x8c5225dc  ! 998: UMUL_I	umul 	%r8, 0x05dc, %r6
	.word 0x8143c000  ! 999: STBAR	stbar
        ta      T_GOOD_TRAP

th_main_3:
        setx  MAIN_BASE_DATA_VA, %r1, %r8
        setx  0x0000000000000220, %g1, %r9
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
        setx  0xdc1a1e6566c196e8, %g1, %r0
        setx  0xe13817b7d06a514a, %g1, %r1
        setx  0x72158fc1fc3b9237, %g1, %r2
        setx  0xcfeb648c5af5b028, %g1, %r3
        setx  0x2eb71b1c4d90ff46, %g1, %r4
        setx  0x22b69fb38f7d02a8, %g1, %r5
        setx  0x77c8a852dae6c89e, %g1, %r6
        setx  0x959face2b3565cc5, %g1, %r7
        setx  0x087c0fe119accb4f, %g1, %r10
        setx  0x4f6c6e82d36f2777, %g1, %r11
        setx  0x8a73cfaa8c253bf7, %g1, %r12
        setx  0xb38cce53dfbc7925, %g1, %r13
        setx  0xfc51080c9f494865, %g1, %r14
        setx  0x132084cf52544253, %g1, %r15
        setx  0x876520b2e89e862d, %g1, %r16
        setx  0x403d4296b9e909c2, %g1, %r17
        setx  0x28b9210025797f9c, %g1, %r18
        setx  0xb2c6056a3e77bc02, %g1, %r19
        setx  0x8358688dc15c7df0, %g1, %r20
        setx  0x8e14f7ba8758f985, %g1, %r21
        setx  0xc835a6f57bbfa539, %g1, %r22
        setx  0x74ece8d54bdd413f, %g1, %r23
        setx  0x45ed79472259b1c8, %g1, %r24
        setx  0x93c335524ca8e7af, %g1, %r25
        setx  0x3002a5b3a5d8b514, %g1, %r26
        setx  0x4c2e5bfb30890d56, %g1, %r27
        setx  0x6ac72ce8c412dd4a, %g1, %r28
        setx  0xbafc36c548501534, %g1, %r29
        setx  0xf0a481019a666da3, %g1, %r30
        setx  0x5bc26d186a8b2319, %g1, %r31
	.word 0xcaea2cc0  ! 5: LDSTUBA_I	ldstuba	%r5, [%r8 + 0x0cc0] %asi
	.word 0xdc5a22e0  ! 7: LDX_I	ldx	[%r8 + 0x02e0], %r14
	.word 0x20800002  ! 8: BN	bn,a	<label_0x2>
	.word 0xd8821009  ! 9: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r12
	.word 0xccc22120  ! 10: LDSWA_I	ldswa	[%r8, + 0x0120] %asi, %r6
	.word 0xccf22ee8  ! 11: STXA_I	stxa	%r6, [%r8 + 0x0ee8] %asi
	.word 0xdea21009  ! 13: STWA_R	stwa	%r15, [%r8 + %r9] 0x80
	.word 0xe0d22b8c  ! 14: LDSHA_I	ldsha	[%r8, + 0x0b8c] %asi, %r16
	.word 0x8143c000  ! 15: STBAR	stbar
	.word 0x8143e06c  ! 16: MEMBAR	membar	#LoadStore | #StoreStore | #MemIssue | #Sync 
	.word 0xc9222b28  ! 18: STF_I	st	%f4, [0x0b28, %r8]
	.word 0xf2921009  ! 19: LDUHA_R	lduha	[%r8, %r9] 0x80, %r25
	.word 0xec120009  ! 20: LDUH_R	lduh	[%r8 + %r9], %r22
	.word 0xc3ea23c0  ! 21: PREFETCHA_I	prefetcha	[%r8, + 0x03c0] %asi, #one_read
	.word 0xc2fa2b8c  ! 22: SWAPA_I	swapa	%r1, [%r8 + 0x0b8c] %asi
	.word 0x8e522118  ! 23: UMUL_I	umul 	%r8, 0x0118, %r7
	.word 0x8143c000  ! 25: STBAR	stbar
	.word 0x8fa209a9  ! 26: FDIVs	fdivs	%f8, %f9, %f7
	.word 0xce5a0009  ! 27: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xeff22009  ! 28: CASXA_R	casxa	[%r8]%asi, %r9, %r23
	.word 0xccaa1009  ! 29: STBA_R	stba	%r6, [%r8 + %r9] 0x80
	.word 0xa3a20829  ! 30: FADDs	fadds	%f8, %f9, %f17
	.word 0x87220009  ! 32: MULScc_R	mulscc 	%r8, %r9, %r3
	.word 0xeefa2c04  ! 33: SWAPA_I	swapa	%r23, [%r8 + 0x0c04] %asi
	.word 0xd6c21009  ! 34: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r11
	.word 0x2cc20001  ! 35: BRGZ	brgz,a,nt	%8,<label_0x20001>
	.word 0xf93a0009  ! 36: STDF_R	std	%f28, [%r9, %r8]
	.word 0xaa522f54  ! 37: UMUL_I	umul 	%r8, 0x0f54, %r21
	.word 0x8a5a0009  ! 38: SMUL_R	smul 	%r8, %r9, %r5
	.word 0xe80a2e84  ! 39: LDUB_I	ldub	[%r8 + 0x0e84], %r20
	.word 0x8143e037  ! 40: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside | #MemIssue 
	.word 0xf0ba1009  ! 41: STDA_R	stda	%r24, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 42: STBAR	stbar
	.word 0xe93a0009  ! 43: STDF_R	std	%f20, [%r9, %r8]
	.word 0x8143c000  ! 44: STBAR	stbar
	.word 0xc4122f30  ! 45: LDUH_I	lduh	[%r8 + 0x0f30], %r2
	.word 0xfe020009  ! 46: LDUW_R	lduw	[%r8 + %r9], %r31
	.word 0xc36a20a4  ! 47: PREFETCH_I	prefetch	[%r8 + 0x00a4], #one_read
	.word 0x84d20009  ! 48: UMULcc_R	umulcc 	%r8, %r9, %r2
	.word 0xc2fa1009  ! 49: SWAPA_R	swapa	%r1, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 50: STBAR	stbar
	.word 0xccc21009  ! 51: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r6
	.word 0xc8f220d0  ! 52: STXA_I	stxa	%r4, [%r8 + 0x00d0] %asi
	.word 0xc4420009  ! 53: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0x87a208a9  ! 56: FSUBs	fsubs	%f8, %f9, %f3
	.word 0x40000001  ! 57: CALL	call	disp30_1
	.word 0x96da0009  ! 58: SMULcc_R	smulcc 	%r8, %r9, %r11
	.word 0x0ac20001  ! 59: BRNZ	brnz  ,nt	%8,<label_0x20001>
	.word 0x2aca0001  ! 60: BRNZ	brnz,a,pt	%8,<label_0xa0001>
	.word 0xf8d21009  ! 61: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r28
	.word 0xb27a0009  ! 62: SDIV_R	sdiv 	%r8, %r9, %r25
	.word 0xca7a0009  ! 63: SWAP_R	swap	%r5, [%r8 + %r9]
	.word 0x8143c000  ! 64: STBAR	stbar
	.word 0xc4f21009  ! 65: STXA_R	stxa	%r2, [%r8 + %r9] 0x80
	.word 0x02ca0001  ! 66: BRZ	brz  ,pt	%8,<label_0xa0001>
	.word 0x1c800002  ! 67: BPOS	bpos  	<label_0x2>
	.word 0xc2122b64  ! 68: LDUH_I	lduh	[%r8 + 0x0b64], %r1
	.word 0xc33a0009  ! 69: STDF_R	std	%f1, [%r9, %r8]
	.word 0x8143e02b  ! 70: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #MemIssue 
	.word 0xfefa1009  ! 71: SWAPA_R	swapa	%r31, [%r8 + %r9] 0x80
	.word 0xcdf21009  ! 72: CASXA_I	casxa	[%r8] 0x80, %r9, %r6
	.word 0xcafa1009  ! 73: SWAPA_R	swapa	%r5, [%r8 + %r9] 0x80
	.word 0xc3ea2660  ! 74: PREFETCHA_I	prefetcha	[%r8, + 0x0660] %asi, #one_read
	.word 0xd8c21009  ! 75: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r12
	.word 0xa9220009  ! 76: MULScc_R	mulscc 	%r8, %r9, %r20
	.word 0xccb22930  ! 77: STHA_I	stha	%r6, [%r8 + 0x0930] %asi
	.word 0x0e800001  ! 78: BVS	bvs  	<label_0x1>
	.word 0x8da20929  ! 79: FMULs	fmuls	%f8, %f9, %f6
	.word 0xcf2223cc  ! 80: STF_I	st	%f7, [0x03cc, %r8]
	.word 0xf66a0009  ! 81: LDSTUB_R	ldstub	%r27, [%r8 + %r9]
	.word 0xfe122b88  ! 82: LDUH_I	lduh	[%r8 + 0x0b88], %r31
	.word 0x8143e00c  ! 83: MEMBAR	membar	#LoadStore | #StoreStore 
	.word 0xde4a24e0  ! 84: LDSB_I	ldsb	[%r8 + 0x04e0], %r15
	.word 0x8cf22d1c  ! 85: UDIVcc_I	udivcc 	%r8, 0x0d1c, %r6
	.word 0x00800002  ! 86: BN	bn  	<label_0x2>
	.word 0x8ef20009  ! 87: UDIVcc_R	udivcc 	%r8, %r9, %r7
	.word 0x1a800001  ! 88: BCC	bcc  	<label_0x1>
	.word 0xc6921009  ! 89: LDUHA_R	lduha	[%r8, %r9] 0x80, %r3
	.word 0x8143c000  ! 90: STBAR	stbar
	.word 0x8cf20009  ! 91: UDIVcc_R	udivcc 	%r8, %r9, %r6
	.word 0x966a0009  ! 92: UDIVX_R	udivx 	%r8, %r9, %r11
	.word 0xc2aa1009  ! 93: STBA_R	stba	%r1, [%r8 + %r9] 0x80
	.word 0xce0a0009  ! 94: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xd8a21009  ! 95: STWA_R	stwa	%r12, [%r8 + %r9] 0x80
	.word 0xe0fa27f8  ! 96: SWAPA_I	swapa	%r16, [%r8 + 0x07f8] %asi
	.word 0x8e720009  ! 97: UDIV_R	udiv 	%r8, %r9, %r7
	.word 0x8b6a0009  ! 98: SDIVX_R	sdivx	%r8, %r9, %r5
	.word 0xc36a2518  ! 99: PREFETCH_I	prefetch	[%r8 + 0x0518], #one_read
	.word 0xcb222f2c  ! 100: STF_I	st	%f5, [0x0f2c, %r8]
	.word 0x8143c000  ! 101: STBAR	stbar
	.word 0x8c7a0009  ! 103: SDIV_R	sdiv 	%r8, %r9, %r6
	.word 0xceaa1009  ! 105: STBA_R	stba	%r7, [%r8 + %r9] 0x80
	.word 0x20800002  ! 106: BN	bn,a	<label_0x2>
	.word 0xc2ca1009  ! 107: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r1
	.word 0xd4420009  ! 108: LDSW_R	ldsw	[%r8 + %r9], %r10
	.word 0x26800002  ! 110: BL	bl,a	<label_0x2>
	.word 0x844a0009  ! 111: MULX_R	mulx 	%r8, %r9, %r2
	.word 0xda0a27f0  ! 112: LDUB_I	ldub	[%r8 + 0x07f0], %r13
	.word 0x8143c000  ! 113: STBAR	stbar
	.word 0xca120009  ! 114: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0x83a20829  ! 115: FADDs	fadds	%f8, %f9, %f1
	.word 0xc47a243c  ! 116: SWAP_I	swap	%r2, [%r8 + 0x043c]
	.word 0x02800001  ! 117: BE	be  	<label_0x1>
	.word 0xc3ea25f4  ! 118: PREFETCHA_I	prefetcha	[%r8, + 0x05f4] %asi, #one_read
	.word 0xca0a0009  ! 119: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xe01a23a0  ! 120: LDD_I	ldd	[%r8 + 0x03a0], %r16
	.word 0xfc921009  ! 121: LDUHA_R	lduha	[%r8, %r9] 0x80, %r30
	.word 0xc2020009  ! 123: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xe8b220d8  ! 124: STHA_I	stha	%r20, [%r8 + 0x00d8] %asi
	.word 0x34800002  ! 125: BG	bg,a	<label_0x2>
	.word 0x8c520009  ! 126: UMUL_R	umul 	%r8, %r9, %r6
	.word 0xdab21009  ! 127: STHA_R	stha	%r13, [%r8 + %r9] 0x80
	.word 0x82722a48  ! 129: UDIV_I	udiv 	%r8, 0x0a48, %r1
	.word 0xc2d22050  ! 130: LDSHA_I	ldsha	[%r8, + 0x0050] %asi, %r1
	.word 0x9a6a2314  ! 131: UDIVX_I	udivx 	%r8, 0x0314, %r13
	.word 0xc3ea2208  ! 132: PREFETCHA_I	prefetcha	[%r8, + 0x0208] %asi, #one_read
	.word 0xcc0a0009  ! 133: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xc2fa26c4  ! 134: SWAPA_I	swapa	%r1, [%r8 + 0x06c4] %asi
	.word 0x8e6a22bc  ! 135: UDIVX_I	udivx 	%r8, 0x02bc, %r7
	.word 0xccf21009  ! 136: STXA_R	stxa	%r6, [%r8 + %r9] 0x80
	.word 0xce520009  ! 137: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xdc022684  ! 138: LDUW_I	lduw	[%r8 + 0x0684], %r14
	.word 0xccaa2198  ! 140: STBA_I	stba	%r6, [%r8 + 0x0198] %asi
	.word 0xe4ba2c08  ! 141: STDA_I	stda	%r18, [%r8 + 0x0c08] %asi
	.word 0x82f22eec  ! 142: UDIVcc_I	udivcc 	%r8, 0x0eec, %r1
	.word 0xc86a25a4  ! 143: LDSTUB_I	ldstub	%r4, [%r8 + 0x05a4]
	.word 0x40000002  ! 144: CALL	call	disp30_2
	.word 0xf49a2d30  ! 145: LDDA_I	ldda	[%r8, + 0x0d30] %asi, %r26
	.word 0xc36a2ea4  ! 146: PREFETCH_I	prefetch	[%r8 + 0x0ea4], #one_read
	.word 0x18800002  ! 147: BGU	bgu  	<label_0x2>
	.word 0xca020009  ! 148: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xe6122f74  ! 150: LDUH_I	lduh	[%r8 + 0x0f74], %r19
	.word 0xca522470  ! 151: LDSH_I	ldsh	[%r8 + 0x0470], %r5
	.word 0x16800001  ! 152: BGE	bge  	<label_0x1>
	.word 0xce420009  ! 153: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xcc122694  ! 154: LDUH_I	lduh	[%r8 + 0x0694], %r6
	.word 0xaa722818  ! 155: UDIV_I	udiv 	%r8, 0x0818, %r21
	.word 0xa85a0009  ! 156: SMUL_R	smul 	%r8, %r9, %r20
	.word 0x8143e07a  ! 157: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xf4f22338  ! 158: STXA_I	stxa	%r26, [%r8 + 0x0338] %asi
	.word 0xce7a0009  ! 159: SWAP_R	swap	%r7, [%r8 + %r9]
	.word 0xc36a26f0  ! 160: PREFETCH_I	prefetch	[%r8 + 0x06f0], #one_read
	.word 0xe6a22374  ! 161: STWA_I	stwa	%r19, [%r8 + 0x0374] %asi
	.word 0x8143e02a  ! 162: MEMBAR	membar	#StoreLoad | #StoreStore | #MemIssue 
	.word 0xcc122c74  ! 163: LDUH_I	lduh	[%r8 + 0x0c74], %r6
	.word 0xc68a293c  ! 164: LDUBA_I	lduba	[%r8, + 0x093c] %asi, %r3
	.word 0x2cca0001  ! 165: BRGZ	brgz,a,pt	%8,<label_0xa0001>
	.word 0xd6921009  ! 166: LDUHA_R	lduha	[%r8, %r9] 0x80, %r11
	.word 0xc2fa1009  ! 167: SWAPA_R	swapa	%r1, [%r8 + %r9] 0x80
	.word 0x9da209a9  ! 168: FDIVs	fdivs	%f8, %f9, %f14
	.word 0xccba1009  ! 169: STDA_R	stda	%r6, [%r8 + %r9] 0x80
	.word 0x3a800001  ! 170: BCC	bcc,a	<label_0x1>
	.word 0xf80a2f20  ! 171: LDUB_I	ldub	[%r8 + 0x0f20], %r28
	.word 0xe5f22009  ! 172: CASXA_R	casxa	[%r8]%asi, %r9, %r18
	.word 0x16800002  ! 173: BGE	bge  	<label_0x2>
	.word 0xe0ea1009  ! 174: LDSTUBA_R	ldstuba	%r16, [%r8 + %r9] 0x80
	.word 0x88520009  ! 175: UMUL_R	umul 	%r8, %r9, %r4
	.word 0xc6fa27f8  ! 176: SWAPA_I	swapa	%r3, [%r8 + 0x07f8] %asi
	.word 0x887a2a98  ! 177: SDIV_I	sdiv 	%r8, 0x0a98, %r4
	.word 0xc36a2330  ! 178: PREFETCH_I	prefetch	[%r8 + 0x0330], #one_read
	.word 0x9a5a2cfc  ! 179: SMUL_I	smul 	%r8, 0x0cfc, %r13
	.word 0xa05a2460  ! 180: SMUL_I	smul 	%r8, 0x0460, %r16
	.word 0xcf220009  ! 182: STF_R	st	%f7, [%r9, %r8]
	.word 0xccaa1009  ! 184: STBA_R	stba	%r6, [%r8 + %r9] 0x80
	.word 0xcbf22009  ! 185: CASXA_R	casxa	[%r8]%asi, %r9, %r5
	.word 0xc9220009  ! 188: STF_R	st	%f4, [%r9, %r8]
	.word 0xce5224a8  ! 189: LDSH_I	ldsh	[%r8 + 0x04a8], %r7
	.word 0x9fa208a9  ! 190: FSUBs	fsubs	%f8, %f9, %f15
	.word 0xcde21009  ! 191: CASA_I	casa	[%r8] 0x80, %r9, %r6
	.word 0x8143e04b  ! 192: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Sync 
	.word 0xca0a24c4  ! 193: LDUB_I	ldub	[%r8 + 0x04c4], %r5
	.word 0xc6da2a78  ! 194: LDXA_I	ldxa	[%r8, + 0x0a78] %asi, %r3
	.word 0xc36a2d18  ! 195: PREFETCH_I	prefetch	[%r8 + 0x0d18], #one_read
	.word 0xceea1009  ! 196: LDSTUBA_R	ldstuba	%r7, [%r8 + %r9] 0x80
	.word 0x847a2b0c  ! 197: SDIV_I	sdiv 	%r8, 0x0b0c, %r2
	.word 0xbcda26a0  ! 198: SMULcc_I	smulcc 	%r8, 0x06a0, %r30
	.word 0x844a0009  ! 199: MULX_R	mulx 	%r8, %r9, %r2
	.word 0x844a0009  ! 200: MULX_R	mulx 	%r8, %r9, %r2
	.word 0x88da2ac4  ! 201: SMULcc_I	smulcc 	%r8, 0x0ac4, %r4
	.word 0x8143e023  ! 202: MEMBAR	membar	#LoadLoad | #StoreLoad | #MemIssue 
	.word 0xfeca1009  ! 203: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r31
	.word 0xc2822fec  ! 204: LDUWA_I	lduwa	[%r8, + 0x0fec] %asi, %r1
	.word 0x36800001  ! 205: BGE	bge,a	<label_0x1>
	.word 0x26800002  ! 206: BL	bl,a	<label_0x2>
	.word 0xce0a2e6c  ! 207: LDUB_I	ldub	[%r8 + 0x0e6c], %r7
	.word 0xc2122c48  ! 208: LDUH_I	lduh	[%r8 + 0x0c48], %r1
	.word 0xc7220009  ! 209: STF_R	st	%f3, [%r9, %r8]
	.word 0xc8b22fb4  ! 210: STHA_I	stha	%r4, [%r8 + 0x0fb4] %asi
	.word 0x89a208a9  ! 211: FSUBs	fsubs	%f8, %f9, %f4
	.word 0xaed22690  ! 212: UMULcc_I	umulcc 	%r8, 0x0690, %r23
	.word 0x8143e003  ! 213: MEMBAR	membar	#LoadLoad | #StoreLoad 
	.word 0xc8aa269c  ! 214: STBA_I	stba	%r4, [%r8 + 0x069c] %asi
	.word 0xccda1009  ! 215: LDXA_R	ldxa	[%r8, %r9] 0x80, %r6
	.word 0xbc522a78  ! 216: UMUL_I	umul 	%r8, 0x0a78, %r30
	.word 0xca022c00  ! 217: LDUW_I	lduw	[%r8 + 0x0c00], %r5
	.word 0x38800001  ! 218: BGU	bgu,a	<label_0x1>
	.word 0xc36a2f48  ! 219: PREFETCH_I	prefetch	[%r8 + 0x0f48], #one_read
	.word 0x85a20929  ! 220: FMULs	fmuls	%f8, %f9, %f2
	.word 0xcada1009  ! 221: LDXA_R	ldxa	[%r8, %r9] 0x80, %r5
	.word 0xc3222fb0  ! 222: STF_I	st	%f1, [0x0fb0, %r8]
	.word 0xcc422a84  ! 223: LDSW_I	ldsw	[%r8 + 0x0a84], %r6
	.word 0x84da2e08  ! 224: SMULcc_I	smulcc 	%r8, 0x0e08, %r2
	.word 0x8143c000  ! 225: STBAR	stbar
	.word 0xcc4220f4  ! 226: LDSW_I	ldsw	[%r8 + 0x00f4], %r6
	.word 0xc3f21009  ! 227: CASXA_I	casxa	[%r8] 0x80, %r9, %r1
	.word 0x1a800001  ! 228: BCC	bcc  	<label_0x1>
	.word 0x24800001  ! 229: BLE	ble,a	<label_0x1>
	.word 0xf09a1009  ! 230: LDDA_R	ldda	[%r8, %r9] 0x80, %r24
	.word 0xdcfa21f4  ! 231: SWAPA_I	swapa	%r14, [%r8 + 0x01f4] %asi
	.word 0x0e800002  ! 232: BVS	bvs  	<label_0x2>
	.word 0xcbf22009  ! 233: CASXA_R	casxa	[%r8]%asi, %r9, %r5
	.word 0xc36a28c0  ! 234: PREFETCH_I	prefetch	[%r8 + 0x08c0], #one_read
	.word 0x36800002  ! 235: BGE	bge,a	<label_0x2>
	.word 0x82da0009  ! 236: SMULcc_R	smulcc 	%r8, %r9, %r1
	.word 0xc8da2f48  ! 237: LDXA_I	ldxa	[%r8, + 0x0f48] %asi, %r4
	.word 0x8143e011  ! 238: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x8143e045  ! 239: MEMBAR	membar	#LoadLoad | #LoadStore | #Sync 
	.word 0xc81a0009  ! 240: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xeaea2b30  ! 241: LDSTUBA_I	ldstuba	%r21, [%r8 + 0x0b30] %asi
	.word 0xfc921009  ! 242: LDUHA_R	lduha	[%r8, %r9] 0x80, %r30
	.word 0xc7f22009  ! 243: CASXA_R	casxa	[%r8]%asi, %r9, %r3
	.word 0x9c6a2bf8  ! 244: UDIVX_I	udivx 	%r8, 0x0bf8, %r14
	.word 0x04c20001  ! 245: BRLEZ	brlez  ,nt	%8,<label_0x20001>
	.word 0xf0fa1009  ! 246: SWAPA_R	swapa	%r24, [%r8 + %r9] 0x80
	.word 0x8e720009  ! 247: UDIV_R	udiv 	%r8, %r9, %r7
	.word 0x892224f8  ! 248: MULScc_I	mulscc 	%r8, 0x04f8, %r4
	.word 0xc7220009  ! 249: STF_R	st	%f3, [%r9, %r8]
	.word 0xc3ea2f9c  ! 250: PREFETCHA_I	prefetcha	[%r8, + 0x0f9c] %asi, #one_read
	.word 0xf1222d50  ! 251: STF_I	st	%f24, [0x0d50, %r8]
	.word 0x884a0009  ! 252: MULX_R	mulx 	%r8, %r9, %r4
	.word 0x0c800002  ! 253: BNEG	bneg  	<label_0x2>
	.word 0x2c800001  ! 254: BNEG	bneg,a	<label_0x1>
	.word 0xc3f22009  ! 255: CASXA_R	casxa	[%r8]%asi, %r9, %r1
	.word 0x89a209a9  ! 256: FDIVs	fdivs	%f8, %f9, %f4
	.word 0xff220009  ! 257: STF_R	st	%f31, [%r9, %r8]
	.word 0x844a0009  ! 258: MULX_R	mulx 	%r8, %r9, %r2
	.word 0xc67a0009  ! 259: SWAP_R	swap	%r3, [%r8 + %r9]
	.word 0xae4a0009  ! 261: MULX_R	mulx 	%r8, %r9, %r23
	.word 0xe6c21009  ! 262: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r19
	.word 0xc36a22a0  ! 263: PREFETCH_I	prefetch	[%r8 + 0x02a0], #one_read
	.word 0x976a0009  ! 264: SDIVX_R	sdivx	%r8, %r9, %r11
	.word 0x8da20829  ! 265: FADDs	fadds	%f8, %f9, %f6
	.word 0x87a20829  ! 266: FADDs	fadds	%f8, %f9, %f3
	.word 0x8143e06e  ! 268: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #MemIssue | #Sync 
	.word 0xc8ea2c78  ! 269: LDSTUBA_I	ldstuba	%r4, [%r8 + 0x0c78] %asi
	.word 0x02800002  ! 270: BE	be  	<label_0x2>
	.word 0x865224ec  ! 271: UMUL_I	umul 	%r8, 0x04ec, %r3
	.word 0x896a290c  ! 272: SDIVX_I	sdivx	%r8, 0x090c, %r4
	.word 0x8e5a0009  ! 273: SMUL_R	smul 	%r8, %r9, %r7
	.word 0xc6ca2794  ! 274: LDSBA_I	ldsba	[%r8, + 0x0794] %asi, %r3
	.word 0x82da22f4  ! 275: SMULcc_I	smulcc 	%r8, 0x02f4, %r1
	.word 0xe01a2b00  ! 276: LDD_I	ldd	[%r8 + 0x0b00], %r16
	.word 0x8143c000  ! 277: STBAR	stbar
	.word 0xd81a2438  ! 278: LDD_I	ldd	[%r8 + 0x0438], %r12
	.word 0xc85a20f0  ! 279: LDX_I	ldx	[%r8 + 0x00f0], %r4
	.word 0xc36a2b48  ! 280: PREFETCH_I	prefetch	[%r8 + 0x0b48], #one_read
	.word 0xc61228cc  ! 281: LDUH_I	lduh	[%r8 + 0x08cc], %r3
	.word 0x8143c000  ! 282: STBAR	stbar
	.word 0x845a2f2c  ! 283: SMUL_I	smul 	%r8, 0x0f2c, %r2
	.word 0x8143e042  ! 284: MEMBAR	membar	#StoreLoad | #Sync 
	.word 0xc4f22318  ! 285: STXA_I	stxa	%r2, [%r8 + 0x0318] %asi
	.word 0xcc7a0009  ! 286: SWAP_R	swap	%r6, [%r8 + %r9]
	.word 0x8d6a0009  ! 287: SDIVX_R	sdivx	%r8, %r9, %r6
	.word 0xfc1a24e0  ! 288: LDD_I	ldd	[%r8 + 0x04e0], %r30
	.word 0x86522e00  ! 289: UMUL_I	umul 	%r8, 0x0e00, %r3
	.word 0x20800001  ! 290: BN	bn,a	<label_0x1>
	.word 0x82fa0009  ! 291: SDIVcc_R	sdivcc 	%r8, %r9, %r1
	.word 0x8a7a0009  ! 292: SDIV_R	sdiv 	%r8, %r9, %r5
	.word 0xc3ea2e48  ! 293: PREFETCHA_I	prefetcha	[%r8, + 0x0e48] %asi, #one_read
	.word 0xd4ca1009  ! 295: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r10
	.word 0xdeea22f0  ! 296: LDSTUBA_I	ldstuba	%r15, [%r8 + 0x02f0] %asi
	.word 0x9cfa0009  ! 297: SDIVcc_R	sdivcc 	%r8, %r9, %r14
	.word 0x2cc20001  ! 298: BRGZ	brgz,a,nt	%8,<label_0x20001>
	.word 0xa8520009  ! 299: UMUL_R	umul 	%r8, %r9, %r20
	.word 0xfeda1009  ! 301: LDXA_R	ldxa	[%r8, %r9] 0x80, %r31
	.word 0x865a29bc  ! 302: SMUL_I	smul 	%r8, 0x09bc, %r3
	.word 0x8143c000  ! 304: STBAR	stbar
	.word 0x8f222580  ! 305: MULScc_I	mulscc 	%r8, 0x0580, %r7
	.word 0xf8122708  ! 306: LDUH_I	lduh	[%r8 + 0x0708], %r28
	.word 0xdeaa1009  ! 307: STBA_R	stba	%r15, [%r8 + %r9] 0x80
	.word 0x16800001  ! 308: BGE	bge  	<label_0x1>
	.word 0x846a2590  ! 309: UDIVX_I	udivx 	%r8, 0x0590, %r2
	.word 0x8143e071  ! 310: MEMBAR	membar	#LoadLoad | #Lookaside | #MemIssue | #Sync 
	.word 0x87a20829  ! 311: FADDs	fadds	%f8, %f9, %f3
	.word 0xd9f22009  ! 312: CASXA_R	casxa	[%r8]%asi, %r9, %r12
	.word 0xcaca2b9c  ! 313: LDSBA_I	ldsba	[%r8, + 0x0b9c] %asi, %r5
	.word 0xc40a0009  ! 314: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0x8ba20829  ! 315: FADDs	fadds	%f8, %f9, %f5
	.word 0x826a25b8  ! 316: UDIVX_I	udivx 	%r8, 0x05b8, %r1
	.word 0xca420009  ! 317: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0x86da2548  ! 318: SMULcc_I	smulcc 	%r8, 0x0548, %r3
	.word 0xc3ea2000  ! 319: PREFETCHA_I	prefetcha	[%r8, + 0x0000] %asi, #one_read
	.word 0x82720009  ! 321: UDIV_R	udiv 	%r8, %r9, %r1
	.word 0xba4a2810  ! 323: MULX_I	mulx 	%r8, 0x0810, %r29
	.word 0x8efa0009  ! 324: SDIVcc_R	sdivcc 	%r8, %r9, %r7
	.word 0xc47a27fc  ! 325: SWAP_I	swap	%r2, [%r8 + 0x07fc]
	.word 0xc6ca27b8  ! 326: LDSBA_I	ldsba	[%r8, + 0x07b8] %asi, %r3
	.word 0x8143c000  ! 327: STBAR	stbar
	.word 0xf13a2670  ! 329: STDF_I	std	%f24, [0x0670, %r8]
	.word 0x28800001  ! 330: BLEU	bleu,a	<label_0x1>
	.word 0xc4022980  ! 331: LDUW_I	lduw	[%r8 + 0x0980], %r2
	.word 0xca6a2b78  ! 332: LDSTUB_I	ldstub	%r5, [%r8 + 0x0b78]
	.word 0xc2a22f2c  ! 333: STWA_I	stwa	%r1, [%r8 + 0x0f2c] %asi
	.word 0xf6da2f68  ! 334: LDXA_I	ldxa	[%r8, + 0x0f68] %asi, %r27
	.word 0xc2d22074  ! 335: LDSHA_I	ldsha	[%r8, + 0x0074] %asi, %r1
	.word 0xf4aa2af0  ! 336: STBA_I	stba	%r26, [%r8 + 0x0af0] %asi
	.word 0xa0722130  ! 337: UDIV_I	udiv 	%r8, 0x0130, %r16
	.word 0x8ad20009  ! 338: UMULcc_R	umulcc 	%r8, %r9, %r5
	.word 0xebf22009  ! 339: CASXA_R	casxa	[%r8]%asi, %r9, %r21
	.word 0xfd22278c  ! 340: STF_I	st	%f30, [0x078c, %r8]
	.word 0x1e800001  ! 341: BVC	bvc  	<label_0x1>
	.word 0x8cd22564  ! 342: UMULcc_I	umulcc 	%r8, 0x0564, %r6
	.word 0xb2d2257c  ! 343: UMULcc_I	umulcc 	%r8, 0x057c, %r25
	.word 0xc84a0009  ! 344: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0x20800001  ! 345: BN	bn,a	<label_0x1>
	.word 0x865a0009  ! 346: SMUL_R	smul 	%r8, %r9, %r3
	.word 0x0cc20001  ! 347: BRGZ	brgz  ,nt	%8,<label_0x20001>
	.word 0x8143c000  ! 348: STBAR	stbar
	.word 0xb5a208a9  ! 349: FSUBs	fsubs	%f8, %f9, %f26
	.word 0x8c7a2fe0  ! 350: SDIV_I	sdiv 	%r8, 0x0fe0, %r6
	.word 0xde7a25d0  ! 351: SWAP_I	swap	%r15, [%r8 + 0x05d0]
	.word 0xccc21009  ! 352: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r6
	.word 0xc2b22ffc  ! 353: STHA_I	stha	%r1, [%r8 + 0x0ffc] %asi
	.word 0x845a0009  ! 354: SMUL_R	smul 	%r8, %r9, %r2
	.word 0x8cfa0009  ! 355: SDIVcc_R	sdivcc 	%r8, %r9, %r6
	.word 0xb1a208a9  ! 356: FSUBs	fsubs	%f8, %f9, %f24
	.word 0x827a2690  ! 357: SDIV_I	sdiv 	%r8, 0x0690, %r1
	.word 0xc36a2c94  ! 358: PREFETCH_I	prefetch	[%r8 + 0x0c94], #one_read
	.word 0xe65a0009  ! 359: LDX_R	ldx	[%r8 + %r9], %r19
	.word 0x8ba20929  ! 360: FMULs	fmuls	%f8, %f9, %f5
	.word 0xfd3a21b0  ! 361: STDF_I	std	%f30, [0x01b0, %r8]
	.word 0xccaa2788  ! 362: STBA_I	stba	%r6, [%r8 + 0x0788] %asi
	.word 0x824a2a78  ! 364: MULX_I	mulx 	%r8, 0x0a78, %r1
	.word 0xee122f94  ! 365: LDUH_I	lduh	[%r8 + 0x0f94], %r23
	.word 0xb47a2340  ! 366: SDIV_I	sdiv 	%r8, 0x0340, %r26
	.word 0x87222838  ! 367: MULScc_I	mulscc 	%r8, 0x0838, %r3
	.word 0xfa022c14  ! 368: LDUW_I	lduw	[%r8 + 0x0c14], %r29
	.word 0x8143e03c  ! 369: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0xc9220009  ! 370: STF_R	st	%f4, [%r9, %r8]
	.word 0xc36a211c  ! 371: PREFETCH_I	prefetch	[%r8 + 0x011c], #one_read
	.word 0xe67a2430  ! 372: SWAP_I	swap	%r19, [%r8 + 0x0430]
	.word 0xc2a22ab8  ! 373: STWA_I	stwa	%r1, [%r8 + 0x0ab8] %asi
	.word 0xcec21009  ! 374: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r7
	.word 0x8143c000  ! 375: STBAR	stbar
	.word 0x885a22e8  ! 376: SMUL_I	smul 	%r8, 0x02e8, %r4
	.word 0xe0aa1009  ! 377: STBA_R	stba	%r16, [%r8 + %r9] 0x80
	.word 0x18800001  ! 378: BGU	bgu  	<label_0x1>
	.word 0x8143e06c  ! 379: MEMBAR	membar	#LoadStore | #StoreStore | #MemIssue | #Sync 
	.word 0xcca21009  ! 380: STWA_R	stwa	%r6, [%r8 + %r9] 0x80
	.word 0x866a0009  ! 381: UDIVX_R	udivx 	%r8, %r9, %r3
	.word 0x2c800001  ! 382: BNEG	bneg,a	<label_0x1>
	.word 0xc8a21009  ! 383: STWA_R	stwa	%r4, [%r8 + %r9] 0x80
	.word 0x8143e03e  ! 384: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0x82f20009  ! 385: UDIVcc_R	udivcc 	%r8, %r9, %r1
	.word 0xf5e21009  ! 386: CASA_I	casa	[%r8] 0x80, %r9, %r26
	.word 0x84d20009  ! 387: UMULcc_R	umulcc 	%r8, %r9, %r2
	.word 0xc36a29f4  ! 388: PREFETCH_I	prefetch	[%r8 + 0x09f4], #one_read
	.word 0xce821009  ! 389: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r7
	.word 0xc8ca1009  ! 391: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r4
	.word 0x8143c000  ! 392: STBAR	stbar
	.word 0xc87a0009  ! 394: SWAP_R	swap	%r4, [%r8 + %r9]
	.word 0x8143c000  ! 395: STBAR	stbar
	.word 0xac7a0009  ! 396: SDIV_R	sdiv 	%r8, %r9, %r22
	.word 0xc20a0009  ! 397: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0x8e4a0009  ! 398: MULX_R	mulx 	%r8, %r9, %r7
	.word 0x0a800001  ! 399: BCS	bcs  	<label_0x1>
	.word 0xc48228b8  ! 400: LDUWA_I	lduwa	[%r8, + 0x08b8] %asi, %r2
	.word 0x2e800001  ! 401: BVS	bvs,a	<label_0x1>
	.word 0x84d22e1c  ! 402: UMULcc_I	umulcc 	%r8, 0x0e1c, %r2
	.word 0xcd3a0009  ! 403: STDF_R	std	%f6, [%r9, %r8]
	.word 0x945a2d2c  ! 404: SMUL_I	smul 	%r8, 0x0d2c, %r10
	.word 0x0cca0001  ! 405: BRGZ	brgz  ,pt	%8,<label_0xa0001>
	.word 0x3a800002  ! 406: BCC	bcc,a	<label_0x2>
	.word 0xe89a2d38  ! 407: LDDA_I	ldda	[%r8, + 0x0d38] %asi, %r20
	.word 0x8143c000  ! 408: STBAR	stbar
	.word 0xe8da26c8  ! 409: LDXA_I	ldxa	[%r8, + 0x06c8] %asi, %r20
	.word 0xcf3a0009  ! 410: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc45a0009  ! 411: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0x8143e073  ! 412: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside | #MemIssue | #Sync 
	.word 0xc4f21009  ! 413: STXA_R	stxa	%r2, [%r8 + %r9] 0x80
	.word 0x8c4a2680  ! 414: MULX_I	mulx 	%r8, 0x0680, %r6
	.word 0xc6d21009  ! 415: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r3
	.word 0xc3f22009  ! 416: CASXA_R	casxa	[%r8]%asi, %r9, %r1
	.word 0x8c4a2bd0  ! 417: MULX_I	mulx 	%r8, 0x0bd0, %r6
	.word 0x8143c000  ! 418: STBAR	stbar
	.word 0xcada2978  ! 419: LDXA_I	ldxa	[%r8, + 0x0978] %asi, %r5
	.word 0x85a20829  ! 420: FADDs	fadds	%f8, %f9, %f2
	.word 0xc7220009  ! 421: STF_R	st	%f3, [%r9, %r8]
	.word 0x0cca0001  ! 422: BRGZ	brgz  ,pt	%8,<label_0xa0001>
	.word 0x8143e072  ! 423: MEMBAR	membar	#StoreLoad | #Lookaside | #MemIssue | #Sync 
	.word 0xc2ea27e0  ! 424: LDSTUBA_I	ldstuba	%r1, [%r8 + 0x07e0] %asi
	.word 0x0ec20001  ! 425: BRGEZ	brgez  ,nt	%8,<label_0x20001>
	.word 0xc2ca2448  ! 426: LDSBA_I	ldsba	[%r8, + 0x0448] %asi, %r1
	.word 0xce6a24dc  ! 427: LDSTUB_I	ldstub	%r7, [%r8 + 0x04dc]
	.word 0xc7220009  ! 428: STF_R	st	%f3, [%r9, %r8]
	.word 0xc73a2748  ! 429: STDF_I	std	%f3, [0x0748, %r8]
	.word 0x8143e02b  ! 430: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #MemIssue 
	.word 0x94f20009  ! 431: UDIVcc_R	udivcc 	%r8, %r9, %r10
	.word 0x885a0009  ! 432: SMUL_R	smul 	%r8, %r9, %r4
	.word 0xca020009  ! 433: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xccf22d48  ! 434: STXA_I	stxa	%r6, [%r8 + 0x0d48] %asi
	.word 0xccaa2adc  ! 435: STBA_I	stba	%r6, [%r8 + 0x0adc] %asi
	.word 0xed3a2d48  ! 436: STDF_I	std	%f22, [0x0d48, %r8]
	.word 0xc3ea2414  ! 437: PREFETCHA_I	prefetcha	[%r8, + 0x0414] %asi, #one_read
	.word 0x8143e042  ! 438: MEMBAR	membar	#StoreLoad | #Sync 
	.word 0x85a209a9  ! 439: FDIVs	fdivs	%f8, %f9, %f2
	.word 0x8143e05b  ! 440: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Lookaside | #Sync 
	.word 0x89a208a9  ! 441: FSUBs	fsubs	%f8, %f9, %f4
	.word 0x86720009  ! 442: UDIV_R	udiv 	%r8, %r9, %r3
	.word 0xf4ca207c  ! 443: LDSBA_I	ldsba	[%r8, + 0x007c] %asi, %r26
	.word 0xcf3a0009  ! 444: STDF_R	std	%f7, [%r9, %r8]
	.word 0x8af22cb8  ! 445: UDIVcc_I	udivcc 	%r8, 0x0cb8, %r5
	.word 0xc4fa1009  ! 446: SWAPA_R	swapa	%r2, [%r8 + %r9] 0x80
	.word 0x8e6a0009  ! 447: UDIVX_R	udivx 	%r8, %r9, %r7
	.word 0xce120009  ! 448: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xd73a2f50  ! 449: STDF_I	std	%f11, [0x0f50, %r8]
	.word 0xc2f224b0  ! 450: STXA_I	stxa	%r1, [%r8 + 0x04b0] %asi
	.word 0xccc21009  ! 451: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r6
	.word 0xc6ca1009  ! 452: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r3
	.word 0x3c800002  ! 453: BPOS	bpos,a	<label_0x2>
	.word 0x8143e033  ! 454: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside | #MemIssue 
	.word 0xc2921009  ! 455: LDUHA_R	lduha	[%r8, %r9] 0x80, %r1
	.word 0xc3ea2744  ! 456: PREFETCHA_I	prefetcha	[%r8, + 0x0744] %asi, #one_read
	.word 0xc6fa266c  ! 457: SWAPA_I	swapa	%r3, [%r8 + 0x066c] %asi
	.word 0x8ba208a9  ! 458: FSUBs	fsubs	%f8, %f9, %f5
	.word 0x8143e045  ! 459: MEMBAR	membar	#LoadLoad | #LoadStore | #Sync 
	.word 0x3a800001  ! 462: BCC	bcc,a	<label_0x1>
	.word 0xceaa2abc  ! 463: STBA_I	stba	%r7, [%r8 + 0x0abc] %asi
	.word 0x20800002  ! 464: BN	bn,a	<label_0x2>
	.word 0x8cf22118  ! 465: UDIVcc_I	udivcc 	%r8, 0x0118, %r6
	.word 0xccf21009  ! 466: STXA_R	stxa	%r6, [%r8 + %r9] 0x80
	.word 0xd8ba2408  ! 467: STDA_I	stda	%r12, [%r8 + 0x0408] %asi
	.word 0xe0ba2f58  ! 468: STDA_I	stda	%r16, [%r8 + 0x0f58] %asi
	.word 0x2aca0001  ! 469: BRNZ	brnz,a,pt	%8,<label_0xa0001>
	.word 0xec8a1009  ! 470: LDUBA_R	lduba	[%r8, %r9] 0x80, %r22
	.word 0xc64a0009  ! 471: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0x0cc20001  ! 472: BRGZ	brgz  ,nt	%8,<label_0x20001>
	.word 0xc2d22ca0  ! 473: LDSHA_I	ldsha	[%r8, + 0x0ca0] %asi, %r1
	.word 0xf2aa2480  ! 474: STBA_I	stba	%r25, [%r8 + 0x0480] %asi
	.word 0xceea1009  ! 475: LDSTUBA_R	ldstuba	%r7, [%r8 + %r9] 0x80
	.word 0x8143e043  ! 476: MEMBAR	membar	#LoadLoad | #StoreLoad | #Sync 
	.word 0xcbe22009  ! 477: CASA_R	casa	[%r8] %asi, %r9, %r5
	.word 0xc36a2f40  ! 478: PREFETCH_I	prefetch	[%r8 + 0x0f40], #one_read
	.word 0xc4a21009  ! 479: STWA_R	stwa	%r2, [%r8 + %r9] 0x80
	.word 0x985a0009  ! 480: SMUL_R	smul 	%r8, %r9, %r12
	.word 0xc33a28f0  ! 481: STDF_I	std	%f1, [0x08f0, %r8]
	.word 0x8143e00c  ! 482: MEMBAR	membar	#LoadStore | #StoreStore 
	.word 0xe09a1009  ! 483: LDDA_R	ldda	[%r8, %r9] 0x80, %r16
	.word 0xce6a0009  ! 485: LDSTUB_R	ldstub	%r7, [%r8 + %r9]
	.word 0x2ac20001  ! 486: BRNZ	brnz,a,nt	%8,<label_0x20001>
	.word 0x8143c000  ! 487: STBAR	stbar
	.word 0xc41a2d10  ! 488: LDD_I	ldd	[%r8 + 0x0d10], %r2
	.word 0x896a275c  ! 489: SDIVX_I	sdivx	%r8, 0x075c, %r4
	.word 0xc9220009  ! 490: STF_R	st	%f4, [%r9, %r8]
	.word 0x8af22bec  ! 491: UDIVcc_I	udivcc 	%r8, 0x0bec, %r5
	.word 0xcca22394  ! 492: STWA_I	stwa	%r6, [%r8 + 0x0394] %asi
	.word 0xcafa1009  ! 493: SWAPA_R	swapa	%r5, [%r8 + %r9] 0x80
	.word 0xc36a2618  ! 494: PREFETCH_I	prefetch	[%r8 + 0x0618], #one_read
	.word 0xbba20829  ! 495: FADDs	fadds	%f8, %f9, %f29
	.word 0xc87a0009  ! 496: SWAP_R	swap	%r4, [%r8 + %r9]
	.word 0x8143c000  ! 497: STBAR	stbar
	.word 0x8a4a0009  ! 498: MULX_R	mulx 	%r8, %r9, %r5
	.word 0xc8ea2358  ! 499: LDSTUBA_I	ldstuba	%r4, [%r8 + 0x0358] %asi
	.word 0xccc221a4  ! 501: LDSWA_I	ldswa	[%r8, + 0x01a4] %asi, %r6
	.word 0xc812264c  ! 502: LDUH_I	lduh	[%r8 + 0x064c], %r4
	.word 0x3e800002  ! 504: BVC	bvc,a	<label_0x2>
	.word 0xec5a0009  ! 505: LDX_R	ldx	[%r8 + %r9], %r22
	.word 0xfb220009  ! 506: STF_R	st	%f29, [%r9, %r8]
	.word 0x8143e063  ! 507: MEMBAR	membar	#LoadLoad | #StoreLoad | #MemIssue | #Sync 
	.word 0xe2ea1009  ! 508: LDSTUBA_R	ldstuba	%r17, [%r8 + %r9] 0x80
	.word 0xb27a2a14  ! 509: SDIV_I	sdiv 	%r8, 0x0a14, %r25
	.word 0xee6a2500  ! 510: LDSTUB_I	ldstub	%r23, [%r8 + 0x0500]
	.word 0xcab21009  ! 511: STHA_R	stha	%r5, [%r8 + %r9] 0x80
	.word 0xf6b224f0  ! 512: STHA_I	stha	%r27, [%r8 + 0x04f0] %asi
	.word 0xce7a0009  ! 513: SWAP_R	swap	%r7, [%r8 + %r9]
	.word 0xcc020009  ! 514: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0x8d6a0009  ! 515: SDIVX_R	sdivx	%r8, %r9, %r6
	.word 0x8a5a0009  ! 516: SMUL_R	smul 	%r8, %r9, %r5
	.word 0x8143c000  ! 517: STBAR	stbar
	.word 0x9a5a0009  ! 518: SMUL_R	smul 	%r8, %r9, %r13
	.word 0xdde21009  ! 519: CASA_I	casa	[%r8] 0x80, %r9, %r14
	.word 0xc36a2930  ! 520: PREFETCH_I	prefetch	[%r8 + 0x0930], #one_read
	.word 0x885a0009  ! 521: SMUL_R	smul 	%r8, %r9, %r4
	.word 0x8143c000  ! 522: STBAR	stbar
	.word 0xca4a2b04  ! 523: LDSB_I	ldsb	[%r8 + 0x0b04], %r5
	.word 0xfd222bec  ! 524: STF_I	st	%f30, [0x0bec, %r8]
	.word 0x9a6a0009  ! 525: UDIVX_R	udivx 	%r8, %r9, %r13
	.word 0xc73a0009  ! 526: STDF_R	std	%f3, [%r9, %r8]
	.word 0x10800001  ! 527: BA	ba  	<label_0x1>
	.word 0x8143c000  ! 528: STBAR	stbar
	.word 0xcc9a2ca0  ! 530: LDDA_I	ldda	[%r8, + 0x0ca0] %asi, %r6
	.word 0xc44a26dc  ! 531: LDSB_I	ldsb	[%r8 + 0x06dc], %r2
	.word 0x89a20829  ! 532: FADDs	fadds	%f8, %f9, %f4
	.word 0xc3ea2344  ! 533: PREFETCHA_I	prefetcha	[%r8, + 0x0344] %asi, #one_read
	.word 0xd9e21009  ! 534: CASA_I	casa	[%r8] 0x80, %r9, %r12
	.word 0x8143c000  ! 535: STBAR	stbar
	.word 0x14800001  ! 536: BG	bg  	<label_0x1>
	.word 0xf85a2d10  ! 537: LDX_I	ldx	[%r8 + 0x0d10], %r28
	.word 0xf6fa2d40  ! 538: SWAPA_I	swapa	%r27, [%r8 + 0x0d40] %asi
	.word 0x967a2d0c  ! 539: SDIV_I	sdiv 	%r8, 0x0d0c, %r11
	.word 0x87a20929  ! 540: FMULs	fmuls	%f8, %f9, %f3
	.word 0xc6ea1009  ! 541: LDSTUBA_R	ldstuba	%r3, [%r8 + %r9] 0x80
	.word 0x84da2378  ! 542: SMULcc_I	smulcc 	%r8, 0x0378, %r2
	.word 0xe4ea1009  ! 543: LDSTUBA_R	ldstuba	%r18, [%r8 + %r9] 0x80
	.word 0xca8225e8  ! 544: LDUWA_I	lduwa	[%r8, + 0x05e8] %asi, %r5
	.word 0x8143c000  ! 545: STBAR	stbar
	.word 0x40000002  ! 546: CALL	call	disp30_2
	.word 0xca821009  ! 547: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r5
	.word 0x2a800001  ! 548: BCS	bcs,a	<label_0x1>
	.word 0xc93a0009  ! 549: STDF_R	std	%f4, [%r9, %r8]
	.word 0xe2821009  ! 550: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r17
	.word 0x8a5a0009  ! 551: SMUL_R	smul 	%r8, %r9, %r5
	.word 0xf4ba1009  ! 552: STDA_R	stda	%r26, [%r8 + %r9] 0x80
	.word 0x8143e07a  ! 553: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xb06a0009  ! 554: UDIVX_R	udivx 	%r8, %r9, %r24
	.word 0xd41a2d98  ! 555: LDD_I	ldd	[%r8 + 0x0d98], %r10
	.word 0x8652291c  ! 556: UMUL_I	umul 	%r8, 0x091c, %r3
	.word 0x2a800001  ! 557: BCS	bcs,a	<label_0x1>
	.word 0xc36a2428  ! 558: PREFETCH_I	prefetch	[%r8 + 0x0428], #one_read
	.word 0x836a0009  ! 559: SDIVX_R	sdivx	%r8, %r9, %r1
	.word 0xcd222d84  ! 560: STF_I	st	%f6, [0x0d84, %r8]
	.word 0xcc022164  ! 562: LDUW_I	lduw	[%r8 + 0x0164], %r6
	.word 0x9e72215c  ! 563: UDIV_I	udiv 	%r8, 0x015c, %r15
	.word 0xb7a209a9  ! 564: FDIVs	fdivs	%f8, %f9, %f27
	.word 0xd8ba2700  ! 565: STDA_I	stda	%r12, [%r8 + 0x0700] %asi
	.word 0xebf21009  ! 566: CASXA_I	casxa	[%r8] 0x80, %r9, %r21
	.word 0xfa6a0009  ! 567: LDSTUB_R	ldstub	%r29, [%r8 + %r9]
	.word 0xc27a2880  ! 568: SWAP_I	swap	%r1, [%r8 + 0x0880]
	.word 0x82d22cc0  ! 569: UMULcc_I	umulcc 	%r8, 0x0cc0, %r1
	.word 0xcc42246c  ! 570: LDSW_I	ldsw	[%r8 + 0x046c], %r6
	.word 0x8c7a0009  ! 571: SDIV_R	sdiv 	%r8, %r9, %r6
	.word 0x02800001  ! 572: BE	be  	<label_0x1>
	.word 0x876a0009  ! 573: SDIVX_R	sdivx	%r8, %r9, %r3
	.word 0xc36a26c8  ! 574: PREFETCH_I	prefetch	[%r8 + 0x06c8], #one_read
	.word 0x22ca0001  ! 575: BRZ	brz,a,pt	%8,<label_0xa0001>
	.word 0xf49a1009  ! 577: LDDA_R	ldda	[%r8, %r9] 0x80, %r26
	.word 0xc2c21009  ! 578: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r1
	.word 0xcfe22009  ! 579: CASA_R	casa	[%r8] %asi, %r9, %r7
	.word 0xe8ba2f88  ! 580: STDA_I	stda	%r20, [%r8 + 0x0f88] %asi
	.word 0xc53a0009  ! 581: STDF_R	std	%f2, [%r9, %r8]
	.word 0xb3a209a9  ! 582: FDIVs	fdivs	%f8, %f9, %f25
	.word 0xc4522040  ! 583: LDSH_I	ldsh	[%r8 + 0x0040], %r2
	.word 0xc2f21009  ! 584: STXA_R	stxa	%r1, [%r8 + %r9] 0x80
	.word 0x22ca0001  ! 585: BRZ	brz,a,pt	%8,<label_0xa0001>
	.word 0xde7a0009  ! 586: SWAP_R	swap	%r15, [%r8 + %r9]
	.word 0x87220009  ! 587: MULScc_R	mulscc 	%r8, %r9, %r3
	.word 0xa84a0009  ! 588: MULX_R	mulx 	%r8, %r9, %r20
	.word 0x22ca0001  ! 589: BRZ	brz,a,pt	%8,<label_0xa0001>
	.word 0x9e722320  ! 590: UDIV_I	udiv 	%r8, 0x0320, %r15
	.word 0x8a522d88  ! 591: UMUL_I	umul 	%r8, 0x0d88, %r5
	.word 0x856a0009  ! 592: SDIVX_R	sdivx	%r8, %r9, %r2
	.word 0xc36a23bc  ! 593: PREFETCH_I	prefetch	[%r8 + 0x03bc], #one_read
	.word 0xc64a0009  ! 594: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0x9c520009  ! 595: UMUL_R	umul 	%r8, %r9, %r14
	.word 0xd81a2438  ! 596: LDD_I	ldd	[%r8 + 0x0438], %r12
	.word 0xc4ba2178  ! 597: STDA_I	stda	%r2, [%r8 + 0x0178] %asi
	.word 0x20800001  ! 598: BN	bn,a	<label_0x1>
	.word 0x04800002  ! 599: BLE	ble  	<label_0x2>
	.word 0xc8aa2a74  ! 600: STBA_I	stba	%r4, [%r8 + 0x0a74] %asi
	.word 0xba5227f0  ! 601: UMUL_I	umul 	%r8, 0x07f0, %r29
	.word 0xc9f21009  ! 602: CASXA_I	casxa	[%r8] 0x80, %r9, %r4
	.word 0xc6ea1009  ! 605: LDSTUBA_R	ldstuba	%r3, [%r8 + %r9] 0x80
	.word 0xcf3a2ad0  ! 606: STDF_I	std	%f7, [0x0ad0, %r8]
	.word 0x82da2fac  ! 607: SMULcc_I	smulcc 	%r8, 0x0fac, %r1
	.word 0xc6b22b6c  ! 608: STHA_I	stha	%r3, [%r8 + 0x0b6c] %asi
	.word 0xc33a2300  ! 609: STDF_I	std	%f1, [0x0300, %r8]
	.word 0x84520009  ! 610: UMUL_R	umul 	%r8, %r9, %r2
	.word 0xc26a0009  ! 611: LDSTUB_R	ldstub	%r1, [%r8 + %r9]
	.word 0xc26a0009  ! 612: LDSTUB_R	ldstub	%r1, [%r8 + %r9]
	.word 0x846a274c  ! 613: UDIVX_I	udivx 	%r8, 0x074c, %r2
	.word 0xcef22328  ! 614: STXA_I	stxa	%r7, [%r8 + 0x0328] %asi
	.word 0xc36a2134  ! 615: PREFETCH_I	prefetch	[%r8 + 0x0134], #one_read
	.word 0xc44a0009  ! 616: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0x28800001  ! 618: BLEU	bleu,a	<label_0x1>
	.word 0xc45a2328  ! 619: LDX_I	ldx	[%r8 + 0x0328], %r2
	.word 0x0ac20001  ! 620: BRNZ	brnz  ,nt	%8,<label_0x20001>
	.word 0x8a6a24a8  ! 621: UDIVX_I	udivx 	%r8, 0x04a8, %r5
	.word 0xc2a22d10  ! 622: STWA_I	stwa	%r1, [%r8 + 0x0d10] %asi
	.word 0x85a209a9  ! 623: FDIVs	fdivs	%f8, %f9, %f2
	.word 0xce5a2558  ! 624: LDX_I	ldx	[%r8 + 0x0558], %r7
	.word 0xc48a2988  ! 625: LDUBA_I	lduba	[%r8, + 0x0988] %asi, %r2
	.word 0xda7a0009  ! 627: SWAP_R	swap	%r13, [%r8 + %r9]
	.word 0x8da20929  ! 628: FMULs	fmuls	%f8, %f9, %f6
	.word 0xbba20829  ! 629: FADDs	fadds	%f8, %f9, %f29
	.word 0xbad20009  ! 630: UMULcc_R	umulcc 	%r8, %r9, %r29
	.word 0xc9f22009  ! 631: CASXA_R	casxa	[%r8]%asi, %r9, %r4
	.word 0xc6f22fb8  ! 632: STXA_I	stxa	%r3, [%r8 + 0x0fb8] %asi
	.word 0x8e522e38  ! 633: UMUL_I	umul 	%r8, 0x0e38, %r7
	.word 0x8143e030  ! 634: MEMBAR	membar	#Lookaside | #MemIssue 
	.word 0xfe821009  ! 635: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r31
	.word 0xcff22009  ! 636: CASXA_R	casxa	[%r8]%asi, %r9, %r7
	.word 0xc2020009  ! 637: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xd68a27c4  ! 638: LDUBA_I	lduba	[%r8, + 0x07c4] %asi, %r11
	.word 0xd4a228b8  ! 639: STWA_I	stwa	%r10, [%r8 + 0x08b8] %asi
	.word 0xf3e22009  ! 640: CASA_R	casa	[%r8] %asi, %r9, %r25
	.word 0xc3ea2a2c  ! 641: PREFETCHA_I	prefetcha	[%r8, + 0x0a2c] %asi, #one_read
	.word 0xa9a209a9  ! 642: FDIVs	fdivs	%f8, %f9, %f20
	.word 0xc6122f28  ! 643: LDUH_I	lduh	[%r8 + 0x0f28], %r3
	.word 0xccf22680  ! 644: STXA_I	stxa	%r6, [%r8 + 0x0680] %asi
	.word 0x8143c000  ! 645: STBAR	stbar
	.word 0x86522fbc  ! 646: UMUL_I	umul 	%r8, 0x0fbc, %r3
	.word 0x8143c000  ! 647: STBAR	stbar
	.word 0xea821009  ! 648: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r21
	.word 0x9e4a22b8  ! 649: MULX_I	mulx 	%r8, 0x02b8, %r15
	.word 0xa7220009  ! 650: MULScc_R	mulscc 	%r8, %r9, %r19
	.word 0x826a0009  ! 651: UDIVX_R	udivx 	%r8, %r9, %r1
	.word 0xcc921009  ! 652: LDUHA_R	lduha	[%r8, %r9] 0x80, %r6
	.word 0xcd3a0009  ! 653: STDF_R	std	%f6, [%r9, %r8]
	.word 0x06c20001  ! 654: BRLZ	brlz  ,nt	%8,<label_0x20001>
	.word 0xa05225c4  ! 655: UMUL_I	umul 	%r8, 0x05c4, %r16
	.word 0x8e4a0009  ! 656: MULX_R	mulx 	%r8, %r9, %r7
	.word 0x16800002  ! 657: BGE	bge  	<label_0x2>
	.word 0xe2da27a0  ! 658: LDXA_I	ldxa	[%r8, + 0x07a0] %asi, %r17
	.word 0xc3ea2f60  ! 659: PREFETCHA_I	prefetcha	[%r8, + 0x0f60] %asi, #one_read
	.word 0xd8ba1009  ! 660: STDA_R	stda	%r12, [%r8 + %r9] 0x80
	.word 0x86d20009  ! 661: UMULcc_R	umulcc 	%r8, %r9, %r3
	.word 0xf2ca2938  ! 662: LDSBA_I	ldsba	[%r8, + 0x0938] %asi, %r25
	.word 0xd6422314  ! 663: LDSW_I	ldsw	[%r8 + 0x0314], %r11
	.word 0xdb222cc0  ! 664: STF_I	st	%f13, [0x0cc0, %r8]
	.word 0x8a4a0009  ! 666: MULX_R	mulx 	%r8, %r9, %r5
	.word 0x85a20829  ! 667: FADDs	fadds	%f8, %f9, %f2
	.word 0x8143e044  ! 668: MEMBAR	membar	#LoadStore | #Sync 
	.word 0xc2821009  ! 669: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r1
	.word 0x24ca0001  ! 670: BRLEZ	brlez,a,pt	%8,<label_0xa0001>
	.word 0xe9220009  ! 671: STF_R	st	%f20, [%r9, %r8]
	.word 0x9b220009  ! 672: MULScc_R	mulscc 	%r8, %r9, %r13
	.word 0x8ef22638  ! 673: UDIVcc_I	udivcc 	%r8, 0x0638, %r7
	.word 0xc36a2d88  ! 674: PREFETCH_I	prefetch	[%r8 + 0x0d88], #one_read
	.word 0xd4ba1009  ! 675: STDA_R	stda	%r10, [%r8 + %r9] 0x80
	.word 0xc2120009  ! 676: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0x8143e05c  ! 677: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0x8143c000  ! 678: STBAR	stbar
	.word 0xcaaa1009  ! 679: STBA_R	stba	%r5, [%r8 + %r9] 0x80
	.word 0xceea1009  ! 680: LDSTUBA_R	ldstuba	%r7, [%r8 + %r9] 0x80
	.word 0xc49a1009  ! 681: LDDA_R	ldda	[%r8, %r9] 0x80, %r2
	.word 0xe0ea1009  ! 682: LDSTUBA_R	ldstuba	%r16, [%r8 + %r9] 0x80
	.word 0x82522954  ! 683: UMUL_I	umul 	%r8, 0x0954, %r1
	.word 0x985a0009  ! 684: SMUL_R	smul 	%r8, %r9, %r12
	.word 0x8143e028  ! 686: MEMBAR	membar	#StoreStore | #MemIssue 
	.word 0xc3ea2690  ! 687: PREFETCHA_I	prefetcha	[%r8, + 0x0690] %asi, #one_read
	.word 0xc46a0009  ! 688: LDSTUB_R	ldstub	%r2, [%r8 + %r9]
	.word 0x8c6a0009  ! 689: UDIVX_R	udivx 	%r8, %r9, %r6
	.word 0x28800001  ! 690: BLEU	bleu,a	<label_0x1>
	.word 0x2ec20001  ! 691: BRGEZ	brgez,a,nt	%8,<label_0x20001>
	.word 0xaf220009  ! 693: MULScc_R	mulscc 	%r8, %r9, %r23
	.word 0xc6ca1009  ! 694: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r3
	.word 0x26800002  ! 695: BL	bl,a	<label_0x2>
	.word 0xc2422648  ! 696: LDSW_I	ldsw	[%r8 + 0x0648], %r1
	.word 0xc2020009  ! 697: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xfa6a2064  ! 698: LDSTUB_I	ldstub	%r29, [%r8 + 0x0064]
	.word 0xd6c21009  ! 699: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r11
	.word 0x8143c000  ! 700: STBAR	stbar
	.word 0x9a5a2d60  ! 701: SMUL_I	smul 	%r8, 0x0d60, %r13
	.word 0x10800001  ! 702: BA	ba  	<label_0x1>
	.word 0xc93a0009  ! 703: STDF_R	std	%f4, [%r9, %r8]
	.word 0xc25a2bd8  ! 704: LDX_I	ldx	[%r8 + 0x0bd8], %r1
	.word 0xc2f21009  ! 705: STXA_R	stxa	%r1, [%r8 + %r9] 0x80
	.word 0x8143e00d  ! 706: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore 
	.word 0xc2da2dd0  ! 707: LDXA_I	ldxa	[%r8, + 0x0dd0] %asi, %r1
	.word 0xeb22227c  ! 708: STF_I	st	%f21, [0x027c, %r8]
	.word 0xce5a0009  ! 709: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xc3ea2e34  ! 710: PREFETCHA_I	prefetcha	[%r8, + 0x0e34] %asi, #one_read
	.word 0xd6d21009  ! 711: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r11
	.word 0x8e6a2b74  ! 712: UDIVX_I	udivx 	%r8, 0x0b74, %r7
	.word 0xb3222d60  ! 713: MULScc_I	mulscc 	%r8, 0x0d60, %r25
	.word 0x8c7a28bc  ! 714: SDIV_I	sdiv 	%r8, 0x08bc, %r6
	.word 0xe25a2ae0  ! 715: LDX_I	ldx	[%r8 + 0x0ae0], %r17
	.word 0x8143e037  ! 716: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside | #MemIssue 
	.word 0xf8b22288  ! 717: STHA_I	stha	%r28, [%r8 + 0x0288] %asi
	.word 0x8c5228ac  ! 718: UMUL_I	umul 	%r8, 0x08ac, %r6
	.word 0xfc7a28a0  ! 719: SWAP_I	swap	%r30, [%r8 + 0x08a0]
	.word 0x8143e057  ! 720: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside | #Sync 
	.word 0x3a800001  ! 721: BCC	bcc,a	<label_0x1>
	.word 0x884a22f0  ! 722: MULX_I	mulx 	%r8, 0x02f0, %r4
	.word 0xe1220009  ! 723: STF_R	st	%f16, [%r9, %r8]
	.word 0x8143c000  ! 724: STBAR	stbar
	.word 0x8143e035  ! 725: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside | #MemIssue 
	.word 0xe4122ea8  ! 726: LDUH_I	lduh	[%r8 + 0x0ea8], %r18
	.word 0xcff22009  ! 727: CASXA_R	casxa	[%r8]%asi, %r9, %r7
	.word 0xc41a0009  ! 728: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xe89a2cb8  ! 729: LDDA_I	ldda	[%r8, + 0x0cb8] %asi, %r20
	.word 0x8143e073  ! 730: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside | #MemIssue | #Sync 
	.word 0x8d6a0009  ! 731: SDIVX_R	sdivx	%r8, %r9, %r6
	.word 0x8fa208a9  ! 732: FSUBs	fsubs	%f8, %f9, %f7
	.word 0xc2020009  ! 733: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xc8aa2d80  ! 734: STBA_I	stba	%r4, [%r8 + 0x0d80] %asi
	.word 0xe60a2544  ! 735: LDUB_I	ldub	[%r8 + 0x0544], %r19
	.word 0xae522610  ! 736: UMUL_I	umul 	%r8, 0x0610, %r23
	.word 0x8143c000  ! 737: STBAR	stbar
	.word 0xc6aa1009  ! 738: STBA_R	stba	%r3, [%r8 + %r9] 0x80
	.word 0xd4aa2478  ! 739: STBA_I	stba	%r10, [%r8 + 0x0478] %asi
	.word 0x825221cc  ! 740: UMUL_I	umul 	%r8, 0x01cc, %r1
	.word 0xb6da0009  ! 741: SMULcc_R	smulcc 	%r8, %r9, %r27
	.word 0xc36a2b5c  ! 742: PREFETCH_I	prefetch	[%r8 + 0x0b5c], #one_read
	.word 0x18800001  ! 743: BGU	bgu  	<label_0x1>
	.word 0x8143e02c  ! 744: MEMBAR	membar	#LoadStore | #StoreStore | #MemIssue 
	.word 0xf41a2f20  ! 745: LDD_I	ldd	[%r8 + 0x0f20], %r26
	.word 0xfa120009  ! 746: LDUH_R	lduh	[%r8 + %r9], %r29
	.word 0xceea225c  ! 747: LDSTUBA_I	ldstuba	%r7, [%r8 + 0x025c] %asi
	.word 0xde0a0009  ! 748: LDUB_R	ldub	[%r8 + %r9], %r15
	.word 0x8143c000  ! 749: STBAR	stbar
	.word 0x896a23ac  ! 750: SDIVX_I	sdivx	%r8, 0x03ac, %r4
	.word 0x36800001  ! 751: BGE	bge,a	<label_0x1>
	.word 0xe53a2240  ! 752: STDF_I	std	%f18, [0x0240, %r8]
	.word 0xe3e21009  ! 753: CASA_I	casa	[%r8] 0x80, %r9, %r17
	.word 0xc25a2dd8  ! 754: LDX_I	ldx	[%r8 + 0x0dd8], %r1
	.word 0x8143c000  ! 755: STBAR	stbar
	.word 0x2ec20001  ! 756: BRGEZ	brgez,a,nt	%8,<label_0x20001>
	.word 0xe8520009  ! 757: LDSH_R	ldsh	[%r8 + %r9], %r20
	.word 0x86720009  ! 758: UDIV_R	udiv 	%r8, %r9, %r3
	.word 0x8eda0009  ! 759: SMULcc_R	smulcc 	%r8, %r9, %r7
	.word 0xac7a0009  ! 760: SDIV_R	sdiv 	%r8, %r9, %r22
	.word 0xccea1009  ! 761: LDSTUBA_R	ldstuba	%r6, [%r8 + %r9] 0x80
	.word 0x8f6a2c48  ! 762: SDIVX_I	sdivx	%r8, 0x0c48, %r7
	.word 0xcea21009  ! 763: STWA_R	stwa	%r7, [%r8 + %r9] 0x80
	.word 0x8d6a28dc  ! 764: SDIVX_I	sdivx	%r8, 0x08dc, %r6
	.word 0x8d220009  ! 765: MULScc_R	mulscc 	%r8, %r9, %r6
	.word 0xc36a2c4c  ! 766: PREFETCH_I	prefetch	[%r8 + 0x0c4c], #one_read
	.word 0xccba1009  ! 767: STDA_R	stda	%r6, [%r8 + %r9] 0x80
	.word 0xa67a0009  ! 768: SDIV_R	sdiv 	%r8, %r9, %r19
	.word 0x8c7a0009  ! 769: SDIV_R	sdiv 	%r8, %r9, %r6
	.word 0xe87a2fac  ! 770: SWAP_I	swap	%r20, [%r8 + 0x0fac]
	.word 0xe4fa1009  ! 771: SWAPA_R	swapa	%r18, [%r8 + %r9] 0x80
	.word 0xc2b21009  ! 772: STHA_R	stha	%r1, [%r8 + %r9] 0x80
	.word 0x2aca0001  ! 773: BRNZ	brnz,a,pt	%8,<label_0xa0001>
	.word 0x8143e043  ! 774: MEMBAR	membar	#LoadLoad | #StoreLoad | #Sync 
	.word 0x8143e026  ! 775: MEMBAR	membar	#StoreLoad | #LoadStore | #MemIssue 
	.word 0x8143c000  ! 776: STBAR	stbar
	.word 0x02800001  ! 777: BE	be  	<label_0x1>
	.word 0x827a0009  ! 778: SDIV_R	sdiv 	%r8, %r9, %r1
	.word 0xc2a22090  ! 779: STWA_I	stwa	%r1, [%r8 + 0x0090] %asi
	.word 0xc2522130  ! 780: LDSH_I	ldsh	[%r8 + 0x0130], %r1
	.word 0xcea21009  ! 781: STWA_R	stwa	%r7, [%r8 + %r9] 0x80
	.word 0xccc22280  ! 782: LDSWA_I	ldswa	[%r8, + 0x0280] %asi, %r6
	.word 0xc53a0009  ! 783: STDF_R	std	%f2, [%r9, %r8]
	.word 0x8cfa2920  ! 784: SDIVcc_I	sdivcc 	%r8, 0x0920, %r6
	.word 0xf01a21a8  ! 785: LDD_I	ldd	[%r8 + 0x01a8], %r24
	.word 0xf8921009  ! 786: LDUHA_R	lduha	[%r8, %r9] 0x80, %r28
	.word 0xcb220009  ! 787: STF_R	st	%f5, [%r9, %r8]
	.word 0xc4fa20f0  ! 788: SWAPA_I	swapa	%r2, [%r8 + 0x00f0] %asi
	.word 0xbcfa2e70  ! 789: SDIVcc_I	sdivcc 	%r8, 0x0e70, %r30
	.word 0xcbf21009  ! 790: CASXA_I	casxa	[%r8] 0x80, %r9, %r5
	.word 0xf4ba1009  ! 791: STDA_R	stda	%r26, [%r8 + %r9] 0x80
	.word 0x12800002  ! 792: BNE	bne  	<label_0x2>
	.word 0xc8ca2e08  ! 793: LDSBA_I	ldsba	[%r8, + 0x0e08] %asi, %r4
	.word 0xc52224e0  ! 794: STF_I	st	%f2, [0x04e0, %r8]
	.word 0xcec21009  ! 795: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r7
	.word 0xc3ea23e0  ! 796: PREFETCHA_I	prefetcha	[%r8, + 0x03e0] %asi, #one_read
	.word 0x12800001  ! 797: BNE	bne  	<label_0x1>
	.word 0x8c4a0009  ! 798: MULX_R	mulx 	%r8, %r9, %r6
	.word 0x8fa208a9  ! 800: FSUBs	fsubs	%f8, %f9, %f7
	.word 0xc68a1009  ! 801: LDUBA_R	lduba	[%r8, %r9] 0x80, %r3
	.word 0x06ca0001  ! 802: BRLZ	brlz  ,pt	%8,<label_0xa0001>
	.word 0xc8a22d58  ! 804: STWA_I	stwa	%r4, [%r8 + 0x0d58] %asi
	.word 0x8a7a2924  ! 806: SDIV_I	sdiv 	%r8, 0x0924, %r5
	.word 0xc84a0009  ! 807: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0x8143e010  ! 808: MEMBAR	membar	#Lookaside 
	.word 0x8cfa2244  ! 809: SDIVcc_I	sdivcc 	%r8, 0x0244, %r6
	.word 0xcad2254c  ! 811: LDSHA_I	ldsha	[%r8, + 0x054c] %asi, %r5
	.word 0xb25a2490  ! 812: SMUL_I	smul 	%r8, 0x0490, %r25
	.word 0x36800002  ! 813: BGE	bge,a	<label_0x2>
	.word 0x38800001  ! 814: BGU	bgu,a	<label_0x1>
	.word 0xe7220009  ! 815: STF_R	st	%f19, [%r9, %r8]
	.word 0x40000002  ! 816: CALL	call	disp30_2
	.word 0xde7a2a74  ! 817: SWAP_I	swap	%r15, [%r8 + 0x0a74]
	.word 0x8e6a0009  ! 818: UDIVX_R	udivx 	%r8, %r9, %r7
	.word 0xc3ea2e4c  ! 819: PREFETCHA_I	prefetcha	[%r8, + 0x0e4c] %asi, #one_read
	.word 0xcb220009  ! 820: STF_R	st	%f5, [%r9, %r8]
	.word 0xfc1a0009  ! 821: LDD_R	ldd	[%r8 + %r9], %r30
	.word 0x8143e002  ! 822: MEMBAR	membar	#StoreLoad 
	.word 0xf8ba26a0  ! 823: STDA_I	stda	%r28, [%r8 + 0x06a0] %asi
	.word 0xc2aa20f4  ! 824: STBA_I	stba	%r1, [%r8 + 0x00f4] %asi
	.word 0xe652273c  ! 825: LDSH_I	ldsh	[%r8 + 0x073c], %r19
	.word 0x88da2a48  ! 826: SMULcc_I	smulcc 	%r8, 0x0a48, %r4
	.word 0x8e522f64  ! 827: UMUL_I	umul 	%r8, 0x0f64, %r7
	.word 0xc6ea2994  ! 829: LDSTUBA_I	ldstuba	%r3, [%r8 + 0x0994] %asi
	.word 0x8143c000  ! 830: STBAR	stbar
	.word 0xcc6a0009  ! 831: LDSTUB_R	ldstub	%r6, [%r8 + %r9]
	.word 0xb86a0009  ! 832: UDIVX_R	udivx 	%r8, %r9, %r28
	.word 0xc2b223e0  ! 833: STHA_I	stha	%r1, [%r8 + 0x03e0] %asi
	.word 0x8143e07d  ! 834: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xe41a2740  ! 835: LDD_I	ldd	[%r8 + 0x0740], %r18
	.word 0xc36a2fb0  ! 836: PREFETCH_I	prefetch	[%r8 + 0x0fb0], #one_read
	.word 0xc6a21009  ! 837: STWA_R	stwa	%r3, [%r8 + %r9] 0x80
	.word 0xc8a21009  ! 838: STWA_R	stwa	%r4, [%r8 + %r9] 0x80
	.word 0xce6a0009  ! 839: LDSTUB_R	ldstub	%r7, [%r8 + %r9]
	.word 0x8143e05e  ! 840: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0xceea2304  ! 841: LDSTUBA_I	ldstuba	%r7, [%r8 + 0x0304] %asi
	.word 0x8c5a0009  ! 842: SMUL_R	smul 	%r8, %r9, %r6
	.word 0x8b222524  ! 843: MULScc_I	mulscc 	%r8, 0x0524, %r5
	.word 0xe3f21009  ! 845: CASXA_I	casxa	[%r8] 0x80, %r9, %r17
	.word 0xc4921009  ! 846: LDUHA_R	lduha	[%r8, %r9] 0x80, %r2
	.word 0x8ba208a9  ! 847: FSUBs	fsubs	%f8, %f9, %f5
	.word 0x0c800001  ! 848: BNEG	bneg  	<label_0x1>
	.word 0x8143e07d  ! 849: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0x8143c000  ! 850: STBAR	stbar
	.word 0xc3ea27d0  ! 851: PREFETCHA_I	prefetcha	[%r8, + 0x07d0] %asi, #one_read
	.word 0x2e800001  ! 852: BVS	bvs,a	<label_0x1>
	.word 0x8143e031  ! 853: MEMBAR	membar	#LoadLoad | #Lookaside | #MemIssue 
	.word 0x8da20829  ! 854: FADDs	fadds	%f8, %f9, %f6
	.word 0xd4ba1009  ! 855: STDA_R	stda	%r10, [%r8 + %r9] 0x80
	.word 0xc6ea2778  ! 856: LDSTUBA_I	ldstuba	%r3, [%r8 + 0x0778] %asi
	.word 0x16800002  ! 857: BGE	bge  	<label_0x2>
	.word 0x87a209a9  ! 858: FDIVs	fdivs	%f8, %f9, %f3
	.word 0xc2f22a80  ! 859: STXA_I	stxa	%r1, [%r8 + 0x0a80] %asi
	.word 0xc6b21009  ! 860: STHA_R	stha	%r3, [%r8 + %r9] 0x80
	.word 0x36800001  ! 861: BGE	bge,a	<label_0x1>
	.word 0xccda1009  ! 863: LDXA_R	ldxa	[%r8, %r9] 0x80, %r6
	.word 0x8143e061  ! 864: MEMBAR	membar	#LoadLoad | #MemIssue | #Sync 
	.word 0xccb22158  ! 865: STHA_I	stha	%r6, [%r8 + 0x0158] %asi
	.word 0x1a800002  ! 866: BCC	bcc  	<label_0x2>
	.word 0x20800002  ! 867: BN	bn,a	<label_0x2>
	.word 0xae5a0009  ! 868: SMUL_R	smul 	%r8, %r9, %r23
	.word 0xe8921009  ! 869: LDUHA_R	lduha	[%r8, %r9] 0x80, %r20
	.word 0xc27a0009  ! 870: SWAP_R	swap	%r1, [%r8 + %r9]
	.word 0x8a520009  ! 871: UMUL_R	umul 	%r8, %r9, %r5
	.word 0xe67a21d0  ! 872: SWAP_I	swap	%r19, [%r8 + 0x01d0]
	.word 0xccb22468  ! 873: STHA_I	stha	%r6, [%r8 + 0x0468] %asi
	.word 0xc2d22880  ! 874: LDSHA_I	ldsha	[%r8, + 0x0880] %asi, %r1
	.word 0xda5a0009  ! 875: LDX_R	ldx	[%r8 + %r9], %r13
	.word 0xb252250c  ! 876: UMUL_I	umul 	%r8, 0x050c, %r25
	.word 0x86f22e44  ! 877: UDIVcc_I	udivcc 	%r8, 0x0e44, %r3
	.word 0xcf3a0009  ! 878: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc36a2af4  ! 879: PREFETCH_I	prefetch	[%r8 + 0x0af4], #one_read
	.word 0x8143c000  ! 880: STBAR	stbar
	.word 0xccea1009  ! 881: LDSTUBA_R	ldstuba	%r6, [%r8 + %r9] 0x80
	.word 0x8a4a0009  ! 884: MULX_R	mulx 	%r8, %r9, %r5
	.word 0x8c5a27b8  ! 885: SMUL_I	smul 	%r8, 0x07b8, %r6
	.word 0xf4ba2ab8  ! 886: STDA_I	stda	%r26, [%r8 + 0x0ab8] %asi
	.word 0x12800001  ! 887: BNE	bne  	<label_0x1>
	.word 0xca5a20d0  ! 888: LDX_I	ldx	[%r8 + 0x00d0], %r5
	.word 0x06ca0001  ! 889: BRLZ	brlz  ,pt	%8,<label_0xa0001>
	.word 0xe6420009  ! 890: LDSW_R	ldsw	[%r8 + %r9], %r19
	.word 0xc8aa2144  ! 891: STBA_I	stba	%r4, [%r8 + 0x0144] %asi
	.word 0x2eca0001  ! 892: BRGEZ	brgez,a,pt	%8,<label_0xa0001>
	.word 0xada208a9  ! 893: FSUBs	fsubs	%f8, %f9, %f22
	.word 0x827a0009  ! 894: SDIV_R	sdiv 	%r8, %r9, %r1
	.word 0x82720009  ! 895: UDIV_R	udiv 	%r8, %r9, %r1
	.word 0x84da2230  ! 896: SMULcc_I	smulcc 	%r8, 0x0230, %r2
	.word 0x8143e031  ! 897: MEMBAR	membar	#LoadLoad | #Lookaside | #MemIssue 
	.word 0xc81a0009  ! 898: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xc3ea2fcc  ! 899: PREFETCHA_I	prefetcha	[%r8, + 0x0fcc] %asi, #one_read
	.word 0x8143c000  ! 900: STBAR	stbar
	.word 0x826a0009  ! 903: UDIVX_R	udivx 	%r8, %r9, %r1
	.word 0xc73a2ba0  ! 904: STDF_I	std	%f3, [0x0ba0, %r8]
	.word 0xe09a27c0  ! 905: LDDA_I	ldda	[%r8, + 0x07c0] %asi, %r16
	.word 0x8143e06c  ! 906: MEMBAR	membar	#LoadStore | #StoreStore | #MemIssue | #Sync 
	.word 0xe0da2f18  ! 907: LDXA_I	ldxa	[%r8, + 0x0f18] %asi, %r16
	.word 0xca6a0009  ! 908: LDSTUB_R	ldstub	%r5, [%r8 + %r9]
	.word 0xc8f22170  ! 909: STXA_I	stxa	%r4, [%r8 + 0x0170] %asi
	.word 0x8143e02e  ! 910: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #MemIssue 
	.word 0x02800002  ! 911: BE	be  	<label_0x2>
	.word 0xc8520009  ! 912: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0x85a209a9  ! 913: FDIVs	fdivs	%f8, %f9, %f2
	.word 0xc8f21009  ! 914: STXA_R	stxa	%r4, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 915: STBAR	stbar
	.word 0xc3ea2ea4  ! 916: PREFETCHA_I	prefetcha	[%r8, + 0x0ea4] %asi, #one_read
	.word 0x8143c000  ! 917: STBAR	stbar
	.word 0xf6aa23a0  ! 918: STBA_I	stba	%r27, [%r8 + 0x03a0] %asi
	.word 0xd5f22009  ! 920: CASXA_R	casxa	[%r8]%asi, %r9, %r10
	.word 0x32800001  ! 921: BNE	bne,a	<label_0x1>
	.word 0xcc9a1009  ! 922: LDDA_R	ldda	[%r8, %r9] 0x80, %r6
	.word 0xec9a1009  ! 923: LDDA_R	ldda	[%r8, %r9] 0x80, %r22
	.word 0xbda209a9  ! 924: FDIVs	fdivs	%f8, %f9, %f30
	.word 0x8eda0009  ! 925: SMULcc_R	smulcc 	%r8, %r9, %r7
	.word 0xc65a2080  ! 926: LDX_I	ldx	[%r8 + 0x0080], %r3
	.word 0xccca22ac  ! 927: LDSBA_I	ldsba	[%r8, + 0x02ac] %asi, %r6
	.word 0xb16a0009  ! 928: SDIVX_R	sdivx	%r8, %r9, %r24
	.word 0xa66a0009  ! 929: UDIVX_R	udivx 	%r8, %r9, %r19
	.word 0x8143e015  ! 930: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside 
	.word 0xc8ea1009  ! 931: LDSTUBA_R	ldstuba	%r4, [%r8 + %r9] 0x80
	.word 0xc4420009  ! 932: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0x886a0009  ! 933: UDIVX_R	udivx 	%r8, %r9, %r4
	.word 0xcaaa1009  ! 934: STBA_R	stba	%r5, [%r8 + %r9] 0x80
	.word 0x8143e058  ! 935: MEMBAR	membar	#StoreStore | #Lookaside | #Sync 
	.word 0xcc6a0009  ! 936: LDSTUB_R	ldstub	%r6, [%r8 + %r9]
	.word 0xa1a20929  ! 937: FMULs	fmuls	%f8, %f9, %f16
	.word 0x8143e07f  ! 938: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xc36a2aa0  ! 939: PREFETCH_I	prefetch	[%r8 + 0x0aa0], #one_read
	.word 0xfc7a0009  ! 940: SWAP_R	swap	%r30, [%r8 + %r9]
	.word 0xf24a2c18  ! 941: LDSB_I	ldsb	[%r8 + 0x0c18], %r25
	.word 0x02800002  ! 944: BE	be  	<label_0x2>
	.word 0x847a0009  ! 945: SDIV_R	sdiv 	%r8, %r9, %r2
	.word 0xc7220009  ! 947: STF_R	st	%f3, [%r9, %r8]
	.word 0xcab22164  ! 948: STHA_I	stha	%r5, [%r8 + 0x0164] %asi
	.word 0xeeca2b40  ! 949: LDSBA_I	ldsba	[%r8, + 0x0b40] %asi, %r23
	.word 0xfcca2854  ! 950: LDSBA_I	ldsba	[%r8, + 0x0854] %asi, %r30
	.word 0x8ada28ac  ! 951: SMULcc_I	smulcc 	%r8, 0x08ac, %r5
	.word 0xce7a2998  ! 952: SWAP_I	swap	%r7, [%r8 + 0x0998]
	.word 0xc3e22009  ! 953: CASA_R	casa	[%r8] %asi, %r9, %r1
	.word 0x24800002  ! 954: BLE	ble,a	<label_0x2>
	.word 0x86720009  ! 955: UDIV_R	udiv 	%r8, %r9, %r3
	.word 0xfcda1009  ! 956: LDXA_R	ldxa	[%r8, %r9] 0x80, %r30
	.word 0xc36a22d4  ! 957: PREFETCH_I	prefetch	[%r8 + 0x02d4], #one_read
	.word 0xca122dbc  ! 958: LDUH_I	lduh	[%r8 + 0x0dbc], %r5
	.word 0xf66a0009  ! 961: LDSTUB_R	ldstub	%r27, [%r8 + %r9]
	.word 0xc4b21009  ! 963: STHA_R	stha	%r2, [%r8 + %r9] 0x80
	.word 0xc68a1009  ! 965: LDUBA_R	lduba	[%r8, %r9] 0x80, %r3
	.word 0x9e4a0009  ! 966: MULX_R	mulx 	%r8, %r9, %r15
	.word 0xdaa21009  ! 967: STWA_R	stwa	%r13, [%r8 + %r9] 0x80
	.word 0xc24a29a0  ! 968: LDSB_I	ldsb	[%r8 + 0x09a0], %r1
	.word 0x8143c000  ! 970: STBAR	stbar
	.word 0xc2a2246c  ! 973: STWA_I	stwa	%r1, [%r8 + 0x046c] %asi
	.word 0xc4b225e8  ! 974: STHA_I	stha	%r2, [%r8 + 0x05e8] %asi
	.word 0x8143e048  ! 975: MEMBAR	membar	#StoreStore | #Sync 
	.word 0xc67a0009  ! 976: SWAP_R	swap	%r3, [%r8 + %r9]
	.word 0x8143e07c  ! 977: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0x8afa2784  ! 978: SDIVcc_I	sdivcc 	%r8, 0x0784, %r5
	.word 0x88f225a4  ! 979: UDIVcc_I	udivcc 	%r8, 0x05a4, %r4
	.word 0xceb21009  ! 980: STHA_R	stha	%r7, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 981: STBAR	stbar
	.word 0x20800001  ! 982: BN	bn,a	<label_0x1>
	.word 0xc4ba25c0  ! 983: STDA_I	stda	%r2, [%r8 + 0x05c0] %asi
	.word 0xcb220009  ! 984: STF_R	st	%f5, [%r9, %r8]
	.word 0xe28222d0  ! 985: LDUWA_I	lduwa	[%r8, + 0x02d0] %asi, %r17
	.word 0xc6ea1009  ! 986: LDSTUBA_R	ldstuba	%r3, [%r8 + %r9] 0x80
	.word 0x86d20009  ! 987: UMULcc_R	umulcc 	%r8, %r9, %r3
	.word 0xc2ca1009  ! 988: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r1
	.word 0x86fa26d4  ! 989: SDIVcc_I	sdivcc 	%r8, 0x06d4, %r3
	.word 0xcad21009  ! 990: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r5
	.word 0xc67a0009  ! 991: SWAP_R	swap	%r3, [%r8 + %r9]
	.word 0xee8a1009  ! 992: LDUBA_R	lduba	[%r8, %r9] 0x80, %r23
	.word 0xce921009  ! 993: LDUHA_R	lduha	[%r8, %r9] 0x80, %r7
	.word 0xc3ea25d8  ! 994: PREFETCHA_I	prefetcha	[%r8, + 0x05d8] %asi, #one_read
	.word 0xaafa2614  ! 997: SDIVcc_I	sdivcc 	%r8, 0x0614, %r21
	.word 0x84522cb0  ! 998: UMUL_I	umul 	%r8, 0x0cb0, %r2
	.word 0x8143c000  ! 999: STBAR	stbar
        ta      T_GOOD_TRAP

.data
	.word  0x4da00ad2,0xfa399970,0xfc971f04,0xa97e2ffd
	.word  0x545b4624,0x424f1a0b,0x85b57bc6,0xc72f6570
	.word  0xe94f4cbf,0x89af3783,0x640208f2,0xd60eb6f2
	.word  0x009e60da,0x2b90cf91,0x23600585,0x71094902
	.word  0x975235d3,0x7096860f,0xbad8c4f9,0x510c80ed
	.word  0xc0e0118e,0x780661ed,0x6cc8631e,0x488df847
	.word  0xff962223,0xc386341d,0x44c112dc,0x96b27a9c
	.word  0xc88e5ee9,0x700816b7,0xe9b8aaa1,0xf98f91fa
	.word  0x3e7d00cb,0x9b9edb93,0x83566c5a,0xbd58cad6
	.word  0xea6d0b36,0xb2dbd66b,0xf0099350,0x511ad1f1
	.word  0x6aaf27bd,0xb8fb859d,0x5487fcf6,0xf5598cc2
	.word  0x122ffdbb,0x77ce4b21,0x4f261093,0x4e1d51a1
	.word  0x25cf519d,0x63cf935b,0x282c4079,0xc6652650
	.word  0xdfd45e8c,0xbd8ccf64,0xcc5b066c,0xdb185300
	.word  0xa880e324,0x1323b93b,0x829a568a,0xef683359
	.word  0xcaa3973c,0xfffd98cc,0x8d90f98b,0xbf6eadc2
	.word  0x283afc9b,0xa128667b,0xb86c09b6,0x8ad5c6ac
	.word  0xf22c117f,0x06dd4037,0x94dd61b5,0xaae04298
	.word  0x1316fa58,0x0ce40abd,0x654a7b1e,0x4f3d4ea0
	.word  0x3e6d473e,0x087b132d,0x4dbab005,0x4fd0883c
	.word  0xdd01bf0f,0x07848f61,0x98cf2609,0xd973945a
	.word  0x9f8fc669,0x1f8b215f,0x291e4c6a,0x4d11767c
	.word  0x4b7a4d6f,0xd6eca8a2,0xdac7de99,0xfa110166
	.word  0xf39060be,0x3bfc4c9d,0x99aa90c1,0x096606a6
	.word  0x64ee0cab,0x89d2b7c7,0x7b1160de,0x6d5f861a
	.word  0x1f5c6bb8,0x65cd9877,0xcb133e3a,0xe4f69a32
	.word  0x48f0128f,0xf40c8c0f,0xeeddf201,0xc2f3591c
	.word  0x19fb148f,0x60198a51,0x1acfb031,0x71086754
	.word  0x533025cc,0x2cf7ca90,0xfab36ccf,0x55bb56bf
	.word  0x6d90881b,0x2832d782,0x5d24d369,0xc79c0007
	.word  0xea821df3,0x79a2199d,0x9d2e7291,0xa44054f3
	.word  0x9b8c5b83,0xa543a648,0x7e838248,0x648ad126
	.word  0xbf1314ca,0xd6b22219,0x0152dee4,0x890ab134
	.word  0x3816462f,0xdd8e2bb3,0x5013e9e5,0xb56337a7
	.word  0x35301f1e,0xf37087e5,0xd80e9e58,0x6bcb2668
	.word  0x16ce5b67,0xc3d5fff8,0x380e5d01,0x8d766dcb
	.word  0x36fad271,0x2b0f484e,0x119c382f,0x894b7c29
	.word  0x931c668b,0x29bf4137,0x84afd09e,0xc874f1a8
	.word  0x1db7648a,0x119aba16,0xd04afc54,0xb309178b
	.word  0x7a31d598,0xb3179be8,0xfb0b76a4,0xf6316a10
	.word  0x1be10548,0x541d103a,0x90ec42e5,0xa51652ba
	.word  0xf954cdb4,0x4877da6a,0x0a3877c1,0xc4f677f9
	.word  0xa3208c5a,0xb42e5f52,0x95d4c933,0xffc1af9a
	.word  0x5710b4cd,0x67c7e99b,0xf7ad6a33,0x41951f13
	.word  0x2222ca3a,0x7b9f46d1,0xf934a0c5,0x267bf989
	.word  0x64d52c02,0xf3b86f77,0xaa2e5523,0x25ebd170
	.word  0x361d62c1,0x66c32ddd,0xa14ad876,0xbd0bafe8
	.word  0xd7502698,0x6af96bc5,0xe54b96e6,0x67bda355
	.word  0x318d22ac,0xfe9bd043,0x35038b77,0xd42cf16c
	.word  0xbae28921,0x925f1230,0x77c60b40,0x8cf9f073
	.word  0x1eb24097,0xe1d0aa34,0x6916422f,0xd1ab417d
	.word  0xb5e3b313,0xc71a65c3,0x02881ae3,0x641e2206
	.word  0x241c1738,0x048cd860,0x6baca93c,0x57926654
	.word  0x0a7a913f,0xf239a7d2,0xfd622d9b,0x092958c3
	.word  0xf773699d,0x258b6aa4,0x7daeab01,0xaa412643
	.word  0x56282fe0,0x230a673b,0xe908dbcb,0x17a02c74
	.word  0xfc15532d,0xea264541,0x67700f04,0x9ddc7a4e
	.word  0x7a58603c,0xb8ddbf4b,0xee62049e,0x286c198b
	.word  0x1158807f,0xf51c7d81,0xfa895bf8,0x25a4835e
	.word  0x530ae116,0xd54393a2,0xb8236b45,0xeb333dcb
	.word  0xacdb58ed,0x369f49ff,0xc284b1f7,0xefdc6ba7
	.word  0x3ea489fb,0x38499592,0xb51f0a05,0x08795499
	.word  0x1a7dae06,0x6b0f5463,0xba0db6c8,0x6da0798e
	.word  0x29003494,0xaf118216,0x8b926755,0xab37f64a
	.word  0x5039a5fd,0x0a500de1,0x8fe0c27d,0x28157d7e
	.word  0xb9a520b6,0x8b7f9c00,0xe6f4ee7f,0x6162846c
	.word  0x0b2603c2,0xd92bc351,0x960e8964,0x1c3dadef
	.word  0x1994a64c,0x4755cc25,0xfdd63b9f,0xb51f6b8d
	.word  0xfc9f4ba5,0x12dfe478,0xc83a96e7,0xdd61a32f
	.word  0xf72be441,0x48e37339,0x8ae6bcbc,0x801b393f
	.word  0x97cba59b,0x4947b5cb,0x9deb5c6e,0x3ea4c481
	.word  0x94f32f74,0x77a054d7,0x5d179eee,0xfdbbea75
	.word  0x42a0bc40,0xe969444c,0xc6e41ec1,0xf2b6eedd
	.word  0x0f80cbbe,0x3fc28445,0x25cc4170,0x75b8afeb
	.word  0xb368b0d1,0xf8b4e75d,0x3083b7ec,0x7cbe891d
	.word  0x4d275617,0x8264e3b1,0xd913198e,0xd2f020d7
	.word  0x1c06bdb5,0x34c4c501,0xb6628a9c,0xda370c79
	.word  0x0e9c092f,0x959c9f4f,0xa60ee3f2,0x8b9ffe82
	.word  0x0fbc7558,0x556a6857,0xc8a72afc,0x8f05fda1
	.word  0xeb6c37e9,0xf2e21bd3,0x0eb1fdd8,0xf06601b8
	.word  0x6edd510a,0x60357756,0xb441deae,0x7b0edd75
	.word  0x016f25a2,0x59f3efe2,0x5dc3d498,0x3f7ad3cc
	.word  0xa29d1e54,0xc1c5dd7b,0xe1cc920f,0xfb889571
	.word  0xe551e059,0xa59e8bb6,0x5b213c10,0x018e8a03
	.word  0xd0ded6ac,0xd943dc77,0x53d03b30,0x0dae8581
	.word  0xb8659a39,0x5df19635,0xd1d55e15,0x2b6409ce
	.word  0xfaee813e,0x41aacc0d,0x0a0b72ea,0x28e620c8
	.word  0x4a511ab6,0xc89e0a04,0x29e52a4d,0x553d1876
	.word  0x675e4e22,0x86267f49,0x1bc15441,0x5f3877e4
	.word  0xafaa66bd,0x5a055c2c,0x260a9c99,0xb7cbf320
	.word  0x4d573732,0x04922627,0x08e174ce,0x59baa12f
	.word  0x8fb7625a,0x5bc293d8,0xa0a99487,0xfe156e40
	.word  0x70c286c5,0xa435e4bd,0x7ddae349,0x34f965e4
	.word  0x72f4947c,0xaa3dffad,0x0d7aa90c,0x2348a1dd
	.word  0xed46a352,0xe05fae5b,0x3cccedfa,0x92a1ed53
	.word  0x070dc416,0x07a14d3a,0xc87bc8d3,0x2dde4d4a
	.word  0x12f75030,0xcc9aee04,0x6cff2950,0x766dbde0
	.word  0x4cf6b48f,0xe1ecb294,0xe085df36,0xcb31c9c6
	.word  0x464cc679,0x96442bb0,0xf710f07f,0x85cbe5b5
	.word  0x2f3b7f8f,0xbdca12e4,0xee7b8ff2,0x48821aba
	.word  0xbf8f5ab1,0x724e9ea3,0x2ba4b117,0x81d9806b
	.word  0xe721b85b,0x7bda9c8e,0xe3c0f10a,0xa956a22c
	.word  0xc41f6309,0x58c236d8,0x9efe8414,0xe0989f0a
	.word  0x13600d6a,0xd6824572,0xa6ad41c2,0x5ff1a1da
	.word  0x5202bea5,0x2cbdce1a,0x02a5886e,0x58b57a82
	.word  0xfe17a101,0xd67f32a1,0x31383f30,0x07eeb17c
	.word  0x06a003ba,0xe73c754a,0xbd7e05d1,0x649b5a99
	.word  0xa2ea1913,0x536c2704,0x25d06d50,0x0b16cb19
	.word  0x94108c69,0xbbefccb5,0x94c2051b,0xbb2289fd
	.word  0xbc11e9a0,0x26388b9d,0x1076b1f6,0xa8e3afc6
	.word  0x0950c181,0xf4d7d8f4,0x695c50fc,0xd012034f
	.word  0x1f3be343,0x777b07db,0x584cd326,0x914ee1ec
	.word  0x632c462b,0xa594802e,0xc0e671c4,0x47b6cce8
	.word  0xc7d88d8e,0x77290465,0x7ad861ce,0x6d6a163c
	.word  0x69fc7ef3,0x04357929,0x12aa2149,0x53580c8f
	.word  0x2357f4fc,0x454cc7cf,0x9e472ffa,0x47593519
	.word  0x8b42d0e8,0x4d8a755a,0x5c9296d8,0x23961bb5
	.word  0x19d1fb69,0x439e168a,0xa52a5a05,0x4b6c2d3c
	.word  0x99ae4fbc,0xc15797b0,0x6f0c50d6,0x6277f2b2
	.word  0x305ece6f,0xace75611,0x58cb00f9,0xdae61ce0
	.word  0xa4e00587,0x93529e47,0x1464812f,0xaa617484
	.word  0xf39536e7,0xde22df3e,0x304319c3,0x88f33ca5
	.word  0xd0cb322a,0xad925e84,0x90ad1cf4,0x09448d8d
	.word  0xad2c43e6,0x7bd37554,0x4405e871,0xd81ed014
	.word  0x75b9fff1,0x6d30156a,0x6584f065,0xbc4bb192
	.word  0x7644b57c,0xeea4eb0f,0x4a77c9c5,0x0966751f
	.word  0x8d08189f,0xf2e1fcd6,0xe095098e,0x5209ff52
	.word  0xee14ae68,0xd6a7b8f0,0xf30c5088,0xf80b3235
	.word  0x0d2be66f,0xb677c0bf,0x46c395d5,0x9de7b505
	.word  0xe871ed4b,0xda4ca248,0xff03eac8,0x47ff3019
	.word  0x278ea1e1,0x6f50d2b6,0x36882731,0xcf204c40
	.word  0x7e9c2e1a,0x572346f4,0x2e19e1db,0xb2a2c4cf
	.word  0x740ef7dd,0x7ff670fb,0xfd85e3f9,0xe5113989
	.word  0xb4a1afef,0x0247cc15,0x061c2628,0x537bbc47
	.word  0xfe7d5b3c,0xf2d13307,0xaf09555a,0xc3f9fffe
	.word  0x593cb7d9,0x9f82013a,0x0567380b,0xd98d9265
	.word  0x9840af39,0x385b7119,0xda7f4da3,0x35706366
	.word  0xeb3cdf4f,0xbdbe8971,0x8cf2a922,0x93b0be74
	.word  0x6510c9d8,0x826fdf0d,0x9b381766,0x2028cd4e
	.word  0x8d2c4f61,0x63854e1a,0x1c40d415,0x8c83e966
	.word  0x847c33ce,0x145b8752,0x09320fb4,0x4842b5c0
	.word  0x355b0dee,0x68069546,0x80c91162,0x83088447
	.word  0x46945670,0x87357dbd,0x55a8f1fc,0x7d0e9983
	.word  0x51498f39,0x301af537,0x81b93c5b,0xaf21f77c
	.word  0x286404ae,0xe6cca956,0xc4e4604b,0x999bd016
	.word  0x2a4182f2,0xb9bf06fa,0xe266abec,0x02cc7c1b
	.word  0x4893ebb9,0x2d94c11f,0x9c40cf16,0x727fc421
	.word  0x48022c02,0x17647368,0x44ea1d73,0xe536e21a
	.word  0x6e460817,0xde7ee621,0xcb9f4807,0xca472571
	.word  0x131b546c,0xc784861a,0x0405a4bc,0x61bef697
	.word  0x4168b182,0x0407be40,0x614070ef,0xd9122dad
	.word  0xfbe9b438,0xe30c88c6,0x3ab6787c,0x46b97e12
	.word  0x806eec3c,0xfc1d438b,0xa107575e,0xaa67a544
	.word  0x621d7412,0xcb9da8bb,0xe2483b1e,0x42062ce3
	.word  0xfef1f301,0xd024523c,0x88629098,0x0dc4de0f
	.word  0x35128531,0xea4968b8,0x14f7a327,0xf0fc189a
	.word  0xaba49175,0xafbd24e9,0x76154bed,0xc1334f7f
	.word  0x456055ae,0x88b6ad3c,0x5534593f,0xbb1e699e
	.word  0x60627300,0x5ef74f48,0x2178cde3,0xff8a972e
	.word  0x1e5d1828,0x7ff08cff,0xf5605893,0x5ad3e51e
	.word  0x47169056,0x5a4eeddb,0x584346eb,0xda9c5fb6
	.word  0x71c8a0a2,0x384f5689,0x10b6e530,0x20520c73
	.word  0xed71ba7d,0x2f7d80d8,0x5635f872,0x2915859b
	.word  0xdcbefbee,0x27dd53c3,0x991ad058,0x5f4bb3a6
	.word  0x61ee5806,0x4144302b,0x614f281b,0x3a95a3a5
	.word  0x39571825,0x83e7a145,0x23831202,0x82d9fc10
	.word  0x51dfe09e,0xe2a54bdc,0x57492078,0x6c80fa49
	.word  0xea141819,0xd6a6b759,0x51561a05,0xf9f26ac6
	.word  0x241a8209,0x05f40768,0x07d08832,0xf07417c1
	.word  0x5e3d8868,0xe7ba16d8,0x17db775b,0x86b9c851
	.word  0x5bc40fdf,0xbdf633bb,0x44cd953c,0x32534613
	.word  0xfba31517,0xe5dcb724,0x26e1482b,0x295a744d
	.word  0x91f7629e,0x62674997,0x50048003,0x1abeb095
	.word  0xb511c4f7,0x94d60a09,0xa2ddb8d7,0x5d316d76
	.word  0xaf7aa191,0xb493db04,0x0ac96ea6,0x9f5e31e4
	.word  0xf94c2871,0xc928a2dc,0x87d4acdf,0x95e9b4a8
	.word  0x7ed59361,0x3440341f,0x07efbbfa,0xd1fde0ee
	.word  0x360a202b,0xe8d05d52,0xc8146499,0x336176ed
	.word  0xef87cacc,0x6c8fe68b,0xbc98e820,0x7193d9b7
	.word  0xee453dad,0xdd286ab1,0x18260637,0x070ec5db
	.word  0x682b6853,0x2beeda9b,0x7269a9b2,0x151af005
	.word  0xcb99e360,0x2721f319,0x8be5dd7c,0x3e07801d
	.word  0x4f806aa1,0x6a51a7b2,0x6555fa1b,0xdce87a2a
	.word  0x271236cf,0x8e58def9,0x8c28588c,0xe90a1196
	.word  0x36fd2d0a,0xf7aabc3c,0xb8bb7c4e,0xa3bf0707
	.word  0x6dd88321,0xca20c7f3,0x8f3e9326,0x0c00a877
	.word  0x64ed650c,0xc0cd9194,0x9a9bc18c,0xf2dd1451
	.word  0xc8ca5ca9,0x38f19be1,0x8cfe5409,0x1be247d7
	.word  0xcba59690,0x2573e4be,0x4d369081,0x4c41137c
	.word  0x366d45f3,0x08ebe11f,0xd77ef5d1,0xa960b468
	.word  0x2338896b,0xa1bad732,0xeab2b532,0x7043a09d
	.word  0x80f1054c,0xe678ad60,0x6697f720,0x6b9b0e78
	.word  0x12f11fbd,0x5689d6ee,0x2bdfc9d4,0x3ffdd8d2
	.word  0x9a7ca235,0xbdd8b896,0x62acfcbb,0xb3038157
	.word  0xfa9ed9ec,0x1e7c8364,0xd436a7bf,0x76d4ce2b
	.word  0x242f43d1,0xfe6faa89,0x5f381300,0x8f6a948e
	.word  0x2379f802,0xa6f48598,0x8a4d387b,0xe182a3e4
	.word  0x0ee3a544,0xc7625dfd,0x8f4589db,0x512e0e5a
	.word  0x8eab4272,0x5aa3744c,0x73a54429,0x093f95b3
	.word  0xf6a79415,0x633f140c,0xb5061962,0x7a381ce7
	.word  0xd07469e0,0x328f904a,0x0c0b404f,0x118df038
	.word  0x93d8d683,0x254e0685,0x2a342317,0x492b49ad
	.word  0x1ea6e1c5,0xbb256ea1,0x75db4bff,0xb247f716
	.word  0x88aa1a6a,0x9233a438,0x8990c178,0x3b67cf44
	.word  0x6aedbe80,0x8fd13c09,0xf18fe11f,0x9373dd91
	.word  0x91929adc,0x4d3d86c8,0xac0518ab,0xf5acf5b4
	.word  0x5b484965,0x44b93c0e,0x1c80b61b,0xe5b2a18d
	.word  0xd5b8103b,0xe5a95f14,0x4988f480,0x1d002be3
	.word  0x5116c1ca,0x5935ad25,0x8126e0f7,0x4de2af4c
	.word  0x20f96da8,0x690170fa,0xcde492fa,0xec55fb73
	.word  0x925753c6,0x84378d9e,0xdce7c384,0xd753232f
	.word  0xa59c2890,0x62189113,0xe5747b9d,0xc78cd47a
	.word  0x32aa47a1,0xa05f234e,0x8059cdf2,0xbae81445
	.word  0x1741e17d,0xf6b9d5a0,0x9505d378,0xd0bce19b
	.word  0xec40d37f,0x9db74797,0x321df9e1,0x0168b6cd
	.word  0x21c4d335,0x3c5ac002,0xec855cd0,0x6862564d
	.word  0x7a3ea60f,0x9e38fea8,0xc5b12cde,0xeb255182
	.word  0x6db480eb,0x54d2a4a6,0x13715961,0xedb58b35
	.word  0x4a304562,0x5a4126d0,0x2059f7b8,0xad111bd3
	.word  0xee3e410d,0xc28a735f,0x83c072eb,0xf1fdb149
	.word  0x33d122bd,0x610b3d1b,0xd5c341c0,0xcbf1dfe2
	.word  0x0f947cbf,0x5128e3b5,0x404bb4eb,0x5f50d014
	.word  0x2daa8295,0xc7710150,0x2088a7df,0xfeb2d472
	.word  0x14b63966,0x493fd812,0xf905e129,0x0ec09391
	.word  0x691a8d37,0x4c09e45a,0x6141893e,0x47327973
	.word  0xb2c50312,0x60e7b3cf,0xef432c2a,0x0c067864
	.word  0xde9644a6,0xc0f82c55,0x8f8cdca8,0x187bd0b4
	.word  0x8513fa39,0x4ff0c3e7,0xfc18a9ee,0xe789bff0
	.word  0x08fc74c9,0x033de5fd,0xb5586ec9,0x53a78cef
	.word  0x349825be,0xc716627a,0x8d932c8c,0x87105a34
	.word  0xc01f0229,0xa33c4a7d,0x0f5fdb66,0xbfc0d7b2
	.word  0xf03d4e48,0xc11fd5b2,0xfdc906f2,0x6d03630d
	.word  0x48e4b1b9,0x161f411e,0xc46a7944,0x1703541a
	.word  0x8b657bc6,0x9ce68d19,0x1944a115,0x00e140f1
	.word  0x40ab6ee5,0x2885cdcd,0xea15fb6e,0x5f625879
	.word  0x4f3a54ab,0xc21c0a1e,0x3fadd632,0x6d0bd576
	.word  0x6dff8534,0xe6b5b67b,0x93982eea,0x5de60fab
	.word  0x52e2b6aa,0xe7434498,0x421fa039,0xa6c6ad3f
	.word  0xb1c6f6ba,0x35811932,0xb981c7e4,0x445a8ecc
	.word  0x24521c5b,0x57389a28,0x48c7808a,0x138a4158
	.word  0x0957c396,0x81d6e7b8,0x6545d2e9,0xc38f4af6
	.word  0x425d294f,0x5940b484,0xa7ba231f,0x5c93bec6
	.word  0x6060a813,0xa9cb3f9a,0x96056650,0x41a88a74
	.word  0x42b943af,0xfa7f16f0,0x380bcb3e,0x5702c35b
	.word  0x01c253e1,0x71d73701,0x1d76c797,0xe8a79bab
	.word  0xd7561fbd,0xee4d74df,0x4ee1a126,0xde0652d1
	.word  0x64d1318a,0xa871ff5d,0xa1063784,0xfd2a4065
	.word  0x791ec63a,0xfd933096,0xc482598d,0x8898875e
	.word  0x59fc0de8,0x16bfeb8d,0xc4070fe5,0x6f3bf05a
	.word  0xccad6712,0xf6080c76,0x807c7d81,0x6ec6f1e0
	.word  0x4ffee883,0x25c0b42b,0xd4495274,0x7f03ea5c
	.word  0x81d43e53,0x96812297,0x9fc26afd,0x7d6d6082
	.word  0x5f8e51b9,0x03245a2f,0x06e2fd5a,0xc1b058d7
	.word  0xbb91a935,0x11838826,0xe0988f7f,0xb1c5fcab
	.word  0x1264538f,0xa46d4256,0x75e9ee5c,0x44305277
	.word  0x02ceca87,0xf3d2db71,0xb804bd4a,0xbdb2232d




