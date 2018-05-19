// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: bug2880.s
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
   random seed:	59143066
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
        setx  0x0000000000000cd0, %g1, %r9
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
        setx  0x33cb1f8071b35edd, %g1, %r0
        setx  0x0e7be789803b417d, %g1, %r1
        setx  0xabbb9abb30f87365, %g1, %r2
        setx  0xf5173615be6aa16b, %g1, %r3
        setx  0x3e1972bb81f947ed, %g1, %r4
        setx  0x0ce424f01bf1cc9a, %g1, %r5
        setx  0xbed8146078ec9fd6, %g1, %r6
        setx  0xf14435afa650f3e7, %g1, %r7
        setx  0x512afbef9f84b85d, %g1, %r10
        setx  0x4dda27e7eaf993f0, %g1, %r11
        setx  0x35e864adf825efd8, %g1, %r12
        setx  0x7fbf90e045c1c6c7, %g1, %r13
        setx  0xf59ae8315f732b5b, %g1, %r14
        setx  0x0f260f41bb4347f6, %g1, %r15
        setx  0x33da9c182dae6f2c, %g1, %r16
        setx  0xd874ff50228eed2f, %g1, %r17
        setx  0x90a69c931d2e2cb5, %g1, %r18
        setx  0x635256e70ff82306, %g1, %r19
        setx  0x4841c6397d6fef8e, %g1, %r20
        setx  0x68bf0a73d4ec0390, %g1, %r21
        setx  0x24dd5d4cf89898df, %g1, %r22
        setx  0x99c5fcee338013cc, %g1, %r23
        setx  0x39ff43ba58de4606, %g1, %r24
        setx  0x1b75e36aa91f41d4, %g1, %r25
        setx  0x8b12ae0472bd77a8, %g1, %r26
        setx  0xb3ad64edf1bf18d5, %g1, %r27
        setx  0x958c3aba462efe68, %g1, %r28
        setx  0x86749a78c0cece3b, %g1, %r29
        setx  0xda0797d315021593, %g1, %r30
        setx  0xf7182f59d1386a36, %g1, %r31
	.word 0xdc921009  ! 6: LDUHA_R	lduha	[%r8, %r9] 0x80, %r14
	.word 0xe85a0009  ! 7: LDX_R	ldx	[%r8 + %r9], %r20
	.word 0xc8d224e0  ! 8: LDSHA_I	ldsha	[%r8, + 0x04e0] %asi, %r4
	.word 0x8143c000  ! 9: STBAR	stbar
	.word 0xc6522724  ! 10: LDSH_I	ldsh	[%r8 + 0x0724], %r3
	.word 0x8e5a2278  ! 11: SMUL_I	smul 	%r8, 0x0278, %r7
	.word 0xcaca200c  ! 12: LDSBA_I	ldsba	[%r8, + 0x000c] %asi, %r5
	.word 0x8d220009  ! 13: MULScc_R	mulscc 	%r8, %r9, %r6
	.word 0x02c20004  ! 14: BRZ	brz  ,nt	%8,<label_0x20004>
	.word 0x8c6a2e4c  ! 15: UDIVX_I	udivx 	%r8, 0x0e4c, %r6
	.word 0x844a0009  ! 16: MULX_R	mulx 	%r8, %r9, %r2
	.word 0xea5a2978  ! 17: LDX_I	ldx	[%r8 + 0x0978], %r21
	.word 0xc25a2c68  ! 18: LDX_I	ldx	[%r8 + 0x0c68], %r1
	.word 0xc8aa2db0  ! 19: STBA_I	stba	%r4, [%r8 + 0x0db0] %asi
	.word 0x887a0009  ! 20: SDIV_R	sdiv 	%r8, %r9, %r4
	.word 0x8143c000  ! 21: STBAR	stbar
	.word 0xc8a22060  ! 22: STWA_I	stwa	%r4, [%r8 + 0x0060] %asi
	.word 0xe6fa2e48  ! 23: SWAPA_I	swapa	%r19, [%r8 + 0x0e48] %asi
	.word 0x8c720009  ! 24: UDIV_R	udiv 	%r8, %r9, %r6
	.word 0x26800004  ! 25: BL	bl,a	<label_0x4>
	.word 0xcaaa2c94  ! 26: STBA_I	stba	%r5, [%r8 + 0x0c94] %asi
	.word 0xc36a2690  ! 27: PREFETCH_I	prefetch	[%r8 + 0x0690], #one_read
	.word 0x8cfa2184  ! 28: SDIVcc_I	sdivcc 	%r8, 0x0184, %r6
	.word 0x8143c000  ! 29: STBAR	stbar
	.word 0x86fa0009  ! 30: SDIVcc_R	sdivcc 	%r8, %r9, %r3
	.word 0xc4ba2760  ! 31: STDA_I	stda	%r2, [%r8 + 0x0760] %asi
	.word 0x2c800004  ! 32: BNEG	bneg,a	<label_0x4>
	.word 0x8143e06e  ! 33: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #MemIssue | #Sync 
	.word 0x8fa208a9  ! 34: FSUBs	fsubs	%f8, %f9, %f7
	.word 0x2c800004  ! 35: BNEG	bneg,a	<label_0x4>
	.word 0xc73a0009  ! 36: STDF_R	std	%f3, [%r9, %r8]
	.word 0x88720009  ! 37: UDIV_R	udiv 	%r8, %r9, %r4
	.word 0xc87a0009  ! 38: SWAP_R	swap	%r4, [%r8 + %r9]
	.word 0xa25a2594  ! 39: SMUL_I	smul 	%r8, 0x0594, %r17
	.word 0xa44a0009  ! 40: MULX_R	mulx 	%r8, %r9, %r18
	.word 0x89a208a9  ! 41: FSUBs	fsubs	%f8, %f9, %f4
	.word 0x10800004  ! 42: BA	ba  	<label_0x4>
	.word 0xc3ea2988  ! 43: PREFETCHA_I	prefetcha	[%r8, + 0x0988] %asi, #one_read
	.word 0xdaca1009  ! 44: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r13
	.word 0x9ed20009  ! 45: UMULcc_R	umulcc 	%r8, %r9, %r15
	.word 0x8143c000  ! 46: STBAR	stbar
	.word 0x866a2ab4  ! 47: UDIVX_I	udivx 	%r8, 0x0ab4, %r3
	.word 0xda520009  ! 48: LDSH_R	ldsh	[%r8 + %r9], %r13
	.word 0xc8ea1009  ! 49: LDSTUBA_R	ldstuba	%r4, [%r8 + %r9] 0x80
	.word 0x8143e022  ! 50: MEMBAR	membar	#StoreLoad | #MemIssue 
	.word 0x86f2204c  ! 51: UDIVcc_I	udivcc 	%r8, 0x004c, %r3
	.word 0x8143c000  ! 52: STBAR	stbar
	.word 0x36800008  ! 53: BGE	bge,a	<label_0x8>
	.word 0x8143e00c  ! 54: MEMBAR	membar	#LoadStore | #StoreStore 
	.word 0x8143e00e  ! 55: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore 
	.word 0xbc4a2d68  ! 56: MULX_I	mulx 	%r8, 0x0d68, %r30
	.word 0xc8ca285c  ! 57: LDSBA_I	ldsba	[%r8, + 0x085c] %asi, %r4
	.word 0x1a800008  ! 58: BCC	bcc  	<label_0x8>
	.word 0xd4a21009  ! 59: STWA_R	stwa	%r10, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 60: STBAR	stbar
	.word 0xc7220009  ! 61: STF_R	st	%f3, [%r9, %r8]
	.word 0xbc520009  ! 62: UMUL_R	umul 	%r8, %r9, %r30
	.word 0xc522285c  ! 63: STF_I	st	%f2, [0x085c, %r8]
	.word 0x38800004  ! 64: BGU	bgu,a	<label_0x4>
	.word 0xb4520009  ! 65: UMUL_R	umul 	%r8, %r9, %r26
	.word 0x8e720009  ! 66: UDIV_R	udiv 	%r8, %r9, %r7
	.word 0xe27a2b34  ! 67: SWAP_I	swap	%r17, [%r8 + 0x0b34]
	.word 0xb9a208a9  ! 68: FSUBs	fsubs	%f8, %f9, %f28
	.word 0x8cf20009  ! 69: UDIVcc_R	udivcc 	%r8, %r9, %r6
	.word 0xa6fa0009  ! 70: SDIVcc_R	sdivcc 	%r8, %r9, %r19
	.word 0xcad21009  ! 71: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r5
	.word 0x0c800004  ! 72: BNEG	bneg  	<label_0x4>
	.word 0xf44a28ec  ! 73: LDSB_I	ldsb	[%r8 + 0x08ec], %r26
	.word 0x12800004  ! 74: BNE	bne  	<label_0x4>
	.word 0xc36a27b8  ! 75: PREFETCH_I	prefetch	[%r8 + 0x07b8], #one_read
	.word 0x8143e047  ! 76: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Sync 
	.word 0x32800004  ! 77: BNE	bne,a	<label_0x4>
	.word 0xc6b229cc  ! 78: STHA_I	stha	%r3, [%r8 + 0x09cc] %asi
	.word 0x8143e04c  ! 79: MEMBAR	membar	#LoadStore | #StoreStore | #Sync 
	.word 0x28800004  ! 81: BLEU	bleu,a	<label_0x4>
	.word 0xfef21009  ! 83: STXA_R	stxa	%r31, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 84: STBAR	stbar
	.word 0xc3e21009  ! 85: CASA_I	casa	[%r8] 0x80, %r9, %r1
	.word 0xcea21009  ! 86: STWA_R	stwa	%r7, [%r8 + %r9] 0x80
	.word 0xcc9a1009  ! 88: LDDA_R	ldda	[%r8, %r9] 0x80, %r6
	.word 0xcff22009  ! 90: CASXA_R	casxa	[%r8]%asi, %r9, %r7
	.word 0x26ca0008  ! 91: BRLZ	brlz,a,pt	%8,<label_0xa0008>
	.word 0xf4c22c00  ! 92: LDSWA_I	ldswa	[%r8, + 0x0c00] %asi, %r26
	.word 0xc3ea2d64  ! 93: PREFETCHA_I	prefetcha	[%r8, + 0x0d64] %asi, #one_read
	.word 0xcaaa1009  ! 94: STBA_R	stba	%r5, [%r8 + %r9] 0x80
	.word 0x867a24e0  ! 95: SDIV_I	sdiv 	%r8, 0x04e0, %r3
	.word 0xc6ca231c  ! 96: LDSBA_I	ldsba	[%r8, + 0x031c] %asi, %r3
	.word 0xc60a0009  ! 97: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xc8120009  ! 98: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0x884a0009  ! 99: MULX_R	mulx 	%r8, %r9, %r4
	.word 0xee4a0009  ! 100: LDSB_R	ldsb	[%r8 + %r9], %r23
	.word 0x8143e066  ! 101: MEMBAR	membar	#StoreLoad | #LoadStore | #MemIssue | #Sync 
	.word 0x847a0009  ! 102: SDIV_R	sdiv 	%r8, %r9, %r2
	.word 0xe2ea1009  ! 103: LDSTUBA_R	ldstuba	%r17, [%r8 + %r9] 0x80
	.word 0xc6120009  ! 105: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0x8143c000  ! 106: STBAR	stbar
	.word 0x95a20829  ! 107: FADDs	fadds	%f8, %f9, %f10
	.word 0xc8c21009  ! 108: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r4
	.word 0x8da20829  ! 109: FADDs	fadds	%f8, %f9, %f6
	.word 0xfcc21009  ! 110: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r30
	.word 0xcaa22c30  ! 111: STWA_I	stwa	%r5, [%r8 + 0x0c30] %asi
	.word 0x89a209a9  ! 112: FDIVs	fdivs	%f8, %f9, %f4
	.word 0x8d6a2b4c  ! 113: SDIVX_I	sdivx	%r8, 0x0b4c, %r6
	.word 0x824a0009  ! 114: MULX_R	mulx 	%r8, %r9, %r1
	.word 0x8cf20009  ! 115: UDIVcc_R	udivcc 	%r8, %r9, %r6
	.word 0xc33a0009  ! 116: STDF_R	std	%f1, [%r9, %r8]
	.word 0xa47a2cdc  ! 117: SDIV_I	sdiv 	%r8, 0x0cdc, %r18
	.word 0x22c20004  ! 118: BRZ	brz,a,nt	%8,<label_0x20004>
	.word 0x94fa2e00  ! 119: SDIVcc_I	sdivcc 	%r8, 0x0e00, %r10
	.word 0xf49a1009  ! 120: LDDA_R	ldda	[%r8, %r9] 0x80, %r26
	.word 0x847223f8  ! 121: UDIV_I	udiv 	%r8, 0x03f8, %r2
	.word 0xc4d21009  ! 122: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r2
	.word 0xc2b21009  ! 123: STHA_R	stha	%r1, [%r8 + %r9] 0x80
	.word 0xfc6a27e0  ! 124: LDSTUB_I	ldstub	%r30, [%r8 + 0x07e0]
	.word 0xe49a1009  ! 125: LDDA_R	ldda	[%r8, %r9] 0x80, %r18
	.word 0x36800004  ! 126: BGE	bge,a	<label_0x4>
	.word 0xc25a2178  ! 127: LDX_I	ldx	[%r8 + 0x0178], %r1
	.word 0x8143e008  ! 128: MEMBAR	membar	#StoreStore 
	.word 0xc3ea29e8  ! 129: PREFETCHA_I	prefetcha	[%r8, + 0x09e8] %asi, #one_read
	.word 0xcef224d8  ! 130: STXA_I	stxa	%r7, [%r8 + 0x04d8] %asi
	.word 0xc6922e44  ! 131: LDUHA_I	lduha	[%r8, + 0x0e44] %asi, %r3
	.word 0xa3a20929  ! 132: FMULs	fmuls	%f8, %f9, %f17
	.word 0xc4520009  ! 133: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xc8ba29c0  ! 134: STDA_I	stda	%r4, [%r8 + 0x09c0] %asi
	.word 0xc9222864  ! 135: STF_I	st	%f4, [0x0864, %r8]
	.word 0xc4ba1009  ! 136: STDA_R	stda	%r2, [%r8 + %r9] 0x80
	.word 0xf4020009  ! 137: LDUW_R	lduw	[%r8 + %r9], %r26
	.word 0x8d220009  ! 138: MULScc_R	mulscc 	%r8, %r9, %r6
	.word 0xc8122050  ! 139: LDUH_I	lduh	[%r8 + 0x0050], %r4
	.word 0x8143e044  ! 140: MEMBAR	membar	#LoadStore | #Sync 
	.word 0xcc02224c  ! 141: LDUW_I	lduw	[%r8 + 0x024c], %r6
	.word 0xec5a2d20  ! 142: LDX_I	ldx	[%r8 + 0x0d20], %r22
	.word 0xc36a2880  ! 143: PREFETCH_I	prefetch	[%r8 + 0x0880], #one_read
	.word 0xe9220009  ! 144: STF_R	st	%f20, [%r9, %r8]
	.word 0x8143e057  ! 145: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside | #Sync 
	.word 0xccba1009  ! 146: STDA_R	stda	%r6, [%r8 + %r9] 0x80
	.word 0x0e800004  ! 147: BVS	bvs  	<label_0x4>
	.word 0xb24a0009  ! 148: MULX_R	mulx 	%r8, %r9, %r25
	.word 0x867a2cdc  ! 150: SDIV_I	sdiv 	%r8, 0x0cdc, %r3
	.word 0xf4ba2ac8  ! 151: STDA_I	stda	%r26, [%r8 + 0x0ac8] %asi
	.word 0x844a0009  ! 152: MULX_R	mulx 	%r8, %r9, %r2
	.word 0x82f22f34  ! 153: UDIVcc_I	udivcc 	%r8, 0x0f34, %r1
	.word 0xf80a2764  ! 154: LDUB_I	ldub	[%r8 + 0x0764], %r28
	.word 0xc81226d8  ! 155: LDUH_I	lduh	[%r8 + 0x06d8], %r4
	.word 0x8143e061  ! 156: MEMBAR	membar	#LoadLoad | #MemIssue | #Sync 
	.word 0x12800004  ! 157: BNE	bne  	<label_0x4>
	.word 0x8fa20829  ! 158: FADDs	fadds	%f8, %f9, %f7
	.word 0xfbe21009  ! 159: CASA_I	casa	[%r8] 0x80, %r9, %r29
	.word 0x22ca0008  ! 160: BRZ	brz,a,pt	%8,<label_0xa0008>
	.word 0xb87227a0  ! 161: UDIV_I	udiv 	%r8, 0x07a0, %r28
	.word 0xeeda1009  ! 162: LDXA_R	ldxa	[%r8, %r9] 0x80, %r23
	.word 0xc3ea225c  ! 163: PREFETCHA_I	prefetcha	[%r8, + 0x025c] %asi, #one_read
	.word 0x8143c000  ! 164: STBAR	stbar
	.word 0x22c20004  ! 165: BRZ	brz,a,nt	%8,<label_0x20004>
	.word 0x8143c000  ! 166: STBAR	stbar
	.word 0xf93a2d08  ! 167: STDF_I	std	%f28, [0x0d08, %r8]
	.word 0xcc422798  ! 168: LDSW_I	ldsw	[%r8 + 0x0798], %r6
	.word 0x8eda0009  ! 169: SMULcc_R	smulcc 	%r8, %r9, %r7
	.word 0xc8fa2378  ! 170: SWAPA_I	swapa	%r4, [%r8 + 0x0378] %asi
	.word 0xc27a0009  ! 171: SWAP_R	swap	%r1, [%r8 + %r9]
	.word 0xdcba1009  ! 173: STDA_R	stda	%r14, [%r8 + %r9] 0x80
	.word 0xf53a2d58  ! 175: STDF_I	std	%f26, [0x0d58, %r8]
	.word 0xc8fa24a0  ! 176: SWAPA_I	swapa	%r4, [%r8 + 0x04a0] %asi
	.word 0xc65a26a8  ! 177: LDX_I	ldx	[%r8 + 0x06a8], %r3
	.word 0xf6d22254  ! 178: LDSHA_I	ldsha	[%r8, + 0x0254] %asi, %r27
	.word 0xc80a0009  ! 179: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xca4a2234  ! 180: LDSB_I	ldsb	[%r8 + 0x0234], %r5
	.word 0x996a0009  ! 181: SDIVX_R	sdivx	%r8, %r9, %r12
	.word 0xa3a20929  ! 182: FMULs	fmuls	%f8, %f9, %f17
	.word 0xc9f22009  ! 183: CASXA_R	casxa	[%r8]%asi, %r9, %r4
	.word 0xc7f22009  ! 184: CASXA_R	casxa	[%r8]%asi, %r9, %r3
	.word 0xc3ea2b48  ! 185: PREFETCHA_I	prefetcha	[%r8, + 0x0b48] %asi, #one_read
	.word 0x88520009  ! 186: UMUL_R	umul 	%r8, %r9, %r4
	.word 0xc6fa2900  ! 187: SWAPA_I	swapa	%r3, [%r8 + 0x0900] %asi
	.word 0xc2520009  ! 188: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xfe8a1009  ! 189: LDUBA_R	lduba	[%r8, %r9] 0x80, %r31
	.word 0x87a20829  ! 190: FADDs	fadds	%f8, %f9, %f3
	.word 0xa6f22f0c  ! 191: UDIVcc_I	udivcc 	%r8, 0x0f0c, %r19
	.word 0xc4f22188  ! 192: STXA_I	stxa	%r2, [%r8 + 0x0188] %asi
	.word 0x84720009  ! 193: UDIV_R	udiv 	%r8, %r9, %r2
	.word 0xceda1009  ! 194: LDXA_R	ldxa	[%r8, %r9] 0x80, %r7
	.word 0x88d20009  ! 195: UMULcc_R	umulcc 	%r8, %r9, %r4
	.word 0x94f2289c  ! 196: UDIVcc_I	udivcc 	%r8, 0x089c, %r10
	.word 0xc8020009  ! 197: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xe6d22ed8  ! 198: LDSHA_I	ldsha	[%r8, + 0x0ed8] %asi, %r19
	.word 0x86720009  ! 199: UDIV_R	udiv 	%r8, %r9, %r3
	.word 0x40000004  ! 200: CALL	call	disp30_4
	.word 0xc8ea1009  ! 201: LDSTUBA_R	ldstuba	%r4, [%r8 + %r9] 0x80
	.word 0xac6a0009  ! 202: UDIVX_R	udivx 	%r8, %r9, %r22
	.word 0xfc6a0009  ! 203: LDSTUB_R	ldstub	%r30, [%r8 + %r9]
	.word 0xc36a20e4  ! 204: PREFETCH_I	prefetch	[%r8 + 0x00e4], #one_read
	.word 0x32800008  ! 206: BNE	bne,a	<label_0x8>
	.word 0xc41a0009  ! 207: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xc4fa1009  ! 208: SWAPA_R	swapa	%r2, [%r8 + %r9] 0x80
	.word 0x846a20f8  ! 209: UDIVX_I	udivx 	%r8, 0x00f8, %r2
	.word 0xcc520009  ! 210: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0x8143c000  ! 211: STBAR	stbar
	.word 0x34800004  ! 212: BG	bg,a	<label_0x4>
	.word 0x88d20009  ! 213: UMULcc_R	umulcc 	%r8, %r9, %r4
	.word 0xa8d22b14  ! 214: UMULcc_I	umulcc 	%r8, 0x0b14, %r20
	.word 0xc8a225ec  ! 215: STWA_I	stwa	%r4, [%r8 + 0x05ec] %asi
	.word 0x8143c000  ! 216: STBAR	stbar
	.word 0xc6b22d0c  ! 217: STHA_I	stha	%r3, [%r8 + 0x0d0c] %asi
	.word 0xc6922f50  ! 218: LDUHA_I	lduha	[%r8, + 0x0f50] %asi, %r3
	.word 0xcf222dd4  ! 219: STF_I	st	%f7, [0x0dd4, %r8]
	.word 0x8e7a2598  ! 220: SDIV_I	sdiv 	%r8, 0x0598, %r7
	.word 0x95a209a9  ! 221: FDIVs	fdivs	%f8, %f9, %f10
	.word 0x8cd22224  ! 222: UMULcc_I	umulcc 	%r8, 0x0224, %r6
	.word 0xcaca1009  ! 223: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r5
	.word 0x06800004  ! 224: BL	bl  	<label_0x4>
	.word 0xc36a2004  ! 225: PREFETCH_I	prefetch	[%r8 + 0x0004], #one_read
	.word 0xc9e22009  ! 226: CASA_R	casa	[%r8] %asi, %r9, %r4
	.word 0x30800004  ! 227: BA	ba,a	<label_0x4>
	.word 0xd8da1009  ! 228: LDXA_R	ldxa	[%r8, %r9] 0x80, %r12
	.word 0x86d22d00  ! 229: UMULcc_I	umulcc 	%r8, 0x0d00, %r3
	.word 0x8c5a20bc  ! 231: SMUL_I	smul 	%r8, 0x00bc, %r6
	.word 0xd6b22d3c  ! 232: STHA_I	stha	%r11, [%r8 + 0x0d3c] %asi
	.word 0x856a0009  ! 233: SDIVX_R	sdivx	%r8, %r9, %r2
	.word 0xec7a0009  ! 234: SWAP_R	swap	%r22, [%r8 + %r9]
	.word 0xcc5a2ef8  ! 235: LDX_I	ldx	[%r8 + 0x0ef8], %r6
	.word 0xccaa1009  ! 236: STBA_R	stba	%r6, [%r8 + %r9] 0x80
	.word 0xc47a0009  ! 237: SWAP_R	swap	%r2, [%r8 + %r9]
	.word 0x8143c000  ! 238: STBAR	stbar
	.word 0xe49a1009  ! 239: LDDA_R	ldda	[%r8, %r9] 0x80, %r18
	.word 0xf2b21009  ! 240: STHA_R	stha	%r25, [%r8 + %r9] 0x80
	.word 0xe6ca1009  ! 241: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r19
	.word 0xc36a2434  ! 242: PREFETCH_I	prefetch	[%r8 + 0x0434], #one_read
	.word 0xc4b21009  ! 244: STHA_R	stha	%r2, [%r8 + %r9] 0x80
	.word 0x8143e045  ! 245: MEMBAR	membar	#LoadLoad | #LoadStore | #Sync 
	.word 0x844a0009  ! 246: MULX_R	mulx 	%r8, %r9, %r2
	.word 0xca7a0009  ! 247: SWAP_R	swap	%r5, [%r8 + %r9]
	.word 0xaba208a9  ! 248: FSUBs	fsubs	%f8, %f9, %f21
	.word 0xf8821009  ! 249: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r28
	.word 0x02ca0004  ! 250: BRZ	brz  ,pt	%8,<label_0xa0004>
	.word 0xcefa1009  ! 251: SWAPA_R	swapa	%r7, [%r8 + %r9] 0x80
	.word 0x8143e03c  ! 252: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0xd8b22d70  ! 254: STHA_I	stha	%r12, [%r8 + 0x0d70] %asi
	.word 0x876a0009  ! 255: SDIVX_R	sdivx	%r8, %r9, %r3
	.word 0xcefa1009  ! 256: SWAPA_R	swapa	%r7, [%r8 + %r9] 0x80
	.word 0xc67a2174  ! 257: SWAP_I	swap	%r3, [%r8 + 0x0174]
	.word 0xc4ba27c0  ! 258: STDA_I	stda	%r2, [%r8 + 0x07c0] %asi
	.word 0xf7f21009  ! 259: CASXA_I	casxa	[%r8] 0x80, %r9, %r27
	.word 0x8143e029  ! 260: MEMBAR	membar	#LoadLoad | #StoreStore | #MemIssue 
	.word 0xc60a2b30  ! 261: LDUB_I	ldub	[%r8 + 0x0b30], %r3
	.word 0xc3ea2420  ! 262: PREFETCHA_I	prefetcha	[%r8, + 0x0420] %asi, #one_read
	.word 0x825a0009  ! 263: SMUL_R	smul 	%r8, %r9, %r1
	.word 0x88da0009  ! 264: SMULcc_R	smulcc 	%r8, %r9, %r4
	.word 0x8ef22b6c  ! 265: UDIVcc_I	udivcc 	%r8, 0x0b6c, %r7
	.word 0xb0f20009  ! 266: UDIVcc_R	udivcc 	%r8, %r9, %r24
	.word 0xee122f2c  ! 267: LDUH_I	lduh	[%r8 + 0x0f2c], %r23
	.word 0xce4a2770  ! 268: LDSB_I	ldsb	[%r8 + 0x0770], %r7
	.word 0xe6fa1009  ! 269: SWAPA_R	swapa	%r19, [%r8 + %r9] 0x80
	.word 0xcf220009  ! 270: STF_R	st	%f7, [%r9, %r8]
	.word 0xc88a1009  ! 271: LDUBA_R	lduba	[%r8, %r9] 0x80, %r4
	.word 0x89222c74  ! 272: MULScc_I	mulscc 	%r8, 0x0c74, %r4
	.word 0x38800008  ! 273: BGU	bgu,a	<label_0x8>
	.word 0xbe5a0009  ! 274: SMUL_R	smul 	%r8, %r9, %r31
	.word 0x06800004  ! 275: BL	bl  	<label_0x4>
	.word 0x8da20829  ! 276: FADDs	fadds	%f8, %f9, %f6
	.word 0xb6f20009  ! 277: UDIVcc_R	udivcc 	%r8, %r9, %r27
	.word 0xc36a2918  ! 278: PREFETCH_I	prefetch	[%r8 + 0x0918], #one_read
	.word 0xc6da1009  ! 279: LDXA_R	ldxa	[%r8, %r9] 0x80, %r3
	.word 0x8143c000  ! 280: STBAR	stbar
	.word 0xf7220009  ! 281: STF_R	st	%f27, [%r9, %r8]
	.word 0xcad22034  ! 282: LDSHA_I	ldsha	[%r8, + 0x0034] %asi, %r5
	.word 0xcaaa22a0  ! 283: STBA_I	stba	%r5, [%r8 + 0x02a0] %asi
	.word 0x18800004  ! 284: BGU	bgu  	<label_0x4>
	.word 0xc8f21009  ! 285: STXA_R	stxa	%r4, [%r8 + %r9] 0x80
	.word 0xc6f22ad8  ! 286: STXA_I	stxa	%r3, [%r8 + 0x0ad8] %asi
	.word 0x8143c000  ! 287: STBAR	stbar
	.word 0xfaa22e88  ! 288: STWA_I	stwa	%r29, [%r8 + 0x0e88] %asi
	.word 0xd89a1009  ! 289: LDDA_R	ldda	[%r8, %r9] 0x80, %r12
	.word 0xc36a2b50  ! 290: PREFETCH_I	prefetch	[%r8 + 0x0b50], #one_read
	.word 0xeea2204c  ! 291: STWA_I	stwa	%r23, [%r8 + 0x004c] %asi
	.word 0xc9220009  ! 292: STF_R	st	%f4, [%r9, %r8]
	.word 0x827a0009  ! 293: SDIV_R	sdiv 	%r8, %r9, %r1
	.word 0xbf222dd4  ! 294: MULScc_I	mulscc 	%r8, 0x0dd4, %r31
	.word 0xca42261c  ! 295: LDSW_I	ldsw	[%r8 + 0x061c], %r5
	.word 0x0c800004  ! 296: BNEG	bneg  	<label_0x4>
	.word 0xc69222f4  ! 297: LDUHA_I	lduha	[%r8, + 0x02f4] %asi, %r3
	.word 0xa65a0009  ! 298: SMUL_R	smul 	%r8, %r9, %r19
	.word 0xfc8a1009  ! 299: LDUBA_R	lduba	[%r8, %r9] 0x80, %r30
	.word 0xc8b22188  ! 300: STHA_I	stha	%r4, [%r8 + 0x0188] %asi
	.word 0xc89a1009  ! 301: LDDA_R	ldda	[%r8, %r9] 0x80, %r4
	.word 0xc7220009  ! 302: STF_R	st	%f3, [%r9, %r8]
	.word 0x8143c000  ! 303: STBAR	stbar
	.word 0xc46a2654  ! 304: LDSTUB_I	ldstub	%r2, [%r8 + 0x0654]
	.word 0x2c800008  ! 305: BNEG	bneg,a	<label_0x8>
	.word 0xf0822d7c  ! 306: LDUWA_I	lduwa	[%r8, + 0x0d7c] %asi, %r24
	.word 0xeef22d50  ! 307: STXA_I	stxa	%r23, [%r8 + 0x0d50] %asi
	.word 0xcdf21009  ! 308: CASXA_I	casxa	[%r8] 0x80, %r9, %r6
	.word 0xccca27f8  ! 309: LDSBA_I	ldsba	[%r8, + 0x07f8] %asi, %r6
	.word 0xc36a2bd4  ! 310: PREFETCH_I	prefetch	[%r8 + 0x0bd4], #one_read
	.word 0xccea1009  ! 311: LDSTUBA_R	ldstuba	%r6, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 313: STBAR	stbar
	.word 0xed3a2a38  ! 314: STDF_I	std	%f22, [0x0a38, %r8]
	.word 0x8c7a2924  ! 315: SDIV_I	sdiv 	%r8, 0x0924, %r6
	.word 0xb46a2704  ! 316: UDIVX_I	udivx 	%r8, 0x0704, %r26
	.word 0xd8ba2e20  ! 317: STDA_I	stda	%r12, [%r8 + 0x0e20] %asi
	.word 0xceb223b4  ! 318: STHA_I	stha	%r7, [%r8 + 0x03b4] %asi
	.word 0xc6c22e00  ! 319: LDSWA_I	ldswa	[%r8, + 0x0e00] %asi, %r3
	.word 0x865a0009  ! 320: SMUL_R	smul 	%r8, %r9, %r3
	.word 0xbda20829  ! 321: FADDs	fadds	%f8, %f9, %f30
	.word 0x884a2884  ! 322: MULX_I	mulx 	%r8, 0x0884, %r4
	.word 0x8143e048  ! 323: MEMBAR	membar	#StoreStore | #Sync 
	.word 0xc33a0009  ! 324: STDF_R	std	%f1, [%r9, %r8]
	.word 0xce921009  ! 325: LDUHA_R	lduha	[%r8, %r9] 0x80, %r7
	.word 0x8af2223c  ! 326: UDIVcc_I	udivcc 	%r8, 0x023c, %r5
	.word 0xa3a209a9  ! 327: FDIVs	fdivs	%f8, %f9, %f17
	.word 0xc4120009  ! 328: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xc36a2060  ! 329: PREFETCH_I	prefetch	[%r8 + 0x0060], #one_read
	.word 0xe9f21009  ! 330: CASXA_I	casxa	[%r8] 0x80, %r9, %r20
	.word 0xf2fa210c  ! 332: SWAPA_I	swapa	%r25, [%r8 + 0x010c] %asi
	.word 0x84f20009  ! 333: UDIVcc_R	udivcc 	%r8, %r9, %r2
	.word 0xc28227cc  ! 334: LDUWA_I	lduwa	[%r8, + 0x07cc] %asi, %r1
	.word 0xf89a1009  ! 335: LDDA_R	ldda	[%r8, %r9] 0x80, %r28
	.word 0x8143e079  ! 336: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0x864a0009  ! 337: MULX_R	mulx 	%r8, %r9, %r3
	.word 0xca420009  ! 338: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0x876a0009  ! 340: SDIVX_R	sdivx	%r8, %r9, %r3
	.word 0xccc21009  ! 342: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r6
	.word 0xc8ba1009  ! 343: STDA_R	stda	%r4, [%r8 + %r9] 0x80
	.word 0x8e4a0009  ! 344: MULX_R	mulx 	%r8, %r9, %r7
	.word 0xc3ea2604  ! 345: PREFETCHA_I	prefetcha	[%r8, + 0x0604] %asi, #one_read
	.word 0xc25a0009  ! 346: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xb16a0009  ! 348: SDIVX_R	sdivx	%r8, %r9, %r24
	.word 0x845a0009  ! 349: SMUL_R	smul 	%r8, %r9, %r2
	.word 0xb65a0009  ! 350: SMUL_R	smul 	%r8, %r9, %r27
	.word 0x8fa20929  ! 351: FMULs	fmuls	%f8, %f9, %f7
	.word 0xeaf21009  ! 353: STXA_R	stxa	%r21, [%r8 + %r9] 0x80
	.word 0xcd220009  ! 354: STF_R	st	%f6, [%r9, %r8]
	.word 0xc87a0009  ! 356: SWAP_R	swap	%r4, [%r8 + %r9]
	.word 0x89a20929  ! 357: FMULs	fmuls	%f8, %f9, %f4
	.word 0xc4f21009  ! 358: STXA_R	stxa	%r2, [%r8 + %r9] 0x80
	.word 0x84720009  ! 359: UDIV_R	udiv 	%r8, %r9, %r2
	.word 0x8143e04a  ! 360: MEMBAR	membar	#StoreLoad | #StoreStore | #Sync 
	.word 0x20800004  ! 361: BN	bn,a	<label_0x4>
	.word 0x887a2c08  ! 362: SDIV_I	sdiv 	%r8, 0x0c08, %r4
	.word 0xec821009  ! 363: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r22
	.word 0x886a0009  ! 364: UDIVX_R	udivx 	%r8, %r9, %r4
	.word 0x8d6a0009  ! 365: SDIVX_R	sdivx	%r8, %r9, %r6
	.word 0xceaa1009  ! 366: STBA_R	stba	%r7, [%r8 + %r9] 0x80
	.word 0xce522838  ! 367: LDSH_I	ldsh	[%r8 + 0x0838], %r7
	.word 0xb85229e4  ! 368: UMUL_I	umul 	%r8, 0x09e4, %r28
	.word 0xea4a2210  ! 369: LDSB_I	ldsb	[%r8 + 0x0210], %r21
	.word 0x8fa208a9  ! 370: FSUBs	fsubs	%f8, %f9, %f7
	.word 0x8143e070  ! 371: MEMBAR	membar	#Lookaside | #MemIssue | #Sync 
	.word 0xc36a2864  ! 372: PREFETCH_I	prefetch	[%r8 + 0x0864], #one_read
	.word 0x8ba209a9  ! 373: FDIVs	fdivs	%f8, %f9, %f5
	.word 0x8cd20009  ! 374: UMULcc_R	umulcc 	%r8, %r9, %r6
	.word 0x8c6a0009  ! 375: UDIVX_R	udivx 	%r8, %r9, %r6
	.word 0x0ec20004  ! 376: BRGEZ	brgez  ,nt	%8,<label_0x20004>
	.word 0xa25a0009  ! 377: SMUL_R	smul 	%r8, %r9, %r17
	.word 0xacf221f0  ! 378: UDIVcc_I	udivcc 	%r8, 0x01f0, %r22
	.word 0x8143e049  ! 379: MEMBAR	membar	#LoadLoad | #StoreStore | #Sync 
	.word 0x04800004  ! 380: BLE	ble  	<label_0x4>
	.word 0xf4822990  ! 381: LDUWA_I	lduwa	[%r8, + 0x0990] %asi, %r26
	.word 0xca020009  ! 382: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xcff22009  ! 383: CASXA_R	casxa	[%r8]%asi, %r9, %r7
	.word 0x10800004  ! 384: BA	ba  	<label_0x4>
	.word 0x0ec20008  ! 385: BRGEZ	brgez  ,nt	%8,<label_0x20008>
	.word 0x8e720009  ! 386: UDIV_R	udiv 	%r8, %r9, %r7
	.word 0xc73a0009  ! 387: STDF_R	std	%f3, [%r9, %r8]
	.word 0xcea21009  ! 388: STWA_R	stwa	%r7, [%r8 + %r9] 0x80
	.word 0x04800004  ! 389: BLE	ble  	<label_0x4>
	.word 0xe46a2518  ! 390: LDSTUB_I	ldstub	%r18, [%r8 + 0x0518]
	.word 0xe41a0009  ! 391: LDD_R	ldd	[%r8 + %r9], %r18
	.word 0xcc9a2fc8  ! 392: LDDA_I	ldda	[%r8, + 0x0fc8] %asi, %r6
	.word 0xfeca1009  ! 393: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r31
	.word 0xa7220009  ! 394: MULScc_R	mulscc 	%r8, %r9, %r19
	.word 0xe53a0009  ! 395: STDF_R	std	%f18, [%r9, %r8]
	.word 0x3a800004  ! 396: BCC	bcc,a	<label_0x4>
	.word 0x9da20929  ! 397: FMULs	fmuls	%f8, %f9, %f14
	.word 0x85a20829  ! 398: FADDs	fadds	%f8, %f9, %f2
	.word 0x8143e064  ! 399: MEMBAR	membar	#LoadStore | #MemIssue | #Sync 
	.word 0xb27a0009  ! 400: SDIV_R	sdiv 	%r8, %r9, %r25
	.word 0x40000004  ! 401: CALL	call	disp30_4
	.word 0xc4b22be4  ! 402: STHA_I	stha	%r2, [%r8 + 0x0be4] %asi
	.word 0xe4b22344  ! 403: STHA_I	stha	%r18, [%r8 + 0x0344] %asi
	.word 0xd68a2ad0  ! 404: LDUBA_I	lduba	[%r8, + 0x0ad0] %asi, %r11
	.word 0xdd220009  ! 405: STF_R	st	%f14, [%r9, %r8]
	.word 0x3a800004  ! 406: BCC	bcc,a	<label_0x4>
	.word 0x8143c000  ! 407: STBAR	stbar
	.word 0xcac21009  ! 408: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r5
	.word 0xbefa0009  ! 409: SDIVcc_R	sdivcc 	%r8, %r9, %r31
	.word 0x24ca0004  ! 410: BRLEZ	brlez,a,pt	%8,<label_0xa0004>
	.word 0xb25a2204  ! 411: SMUL_I	smul 	%r8, 0x0204, %r25
	.word 0xc4f21009  ! 412: STXA_R	stxa	%r2, [%r8 + %r9] 0x80
	.word 0x85a208a9  ! 413: FSUBs	fsubs	%f8, %f9, %f2
	.word 0x8fa20929  ! 414: FMULs	fmuls	%f8, %f9, %f7
	.word 0x2c800004  ! 415: BNEG	bneg,a	<label_0x4>
	.word 0xdac2203c  ! 416: LDSWA_I	ldswa	[%r8, + 0x003c] %asi, %r13
	.word 0xfc420009  ! 417: LDSW_R	ldsw	[%r8 + %r9], %r30
	.word 0x887a0009  ! 418: SDIV_R	sdiv 	%r8, %r9, %r4
	.word 0xce6a0009  ! 419: LDSTUB_R	ldstub	%r7, [%r8 + %r9]
	.word 0xc36a28c4  ! 420: PREFETCH_I	prefetch	[%r8 + 0x08c4], #one_read
	.word 0xbfa20829  ! 421: FADDs	fadds	%f8, %f9, %f31
	.word 0x8fa20929  ! 422: FMULs	fmuls	%f8, %f9, %f7
	.word 0xd4d21009  ! 423: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r10
	.word 0x826a0009  ! 424: UDIVX_R	udivx 	%r8, %r9, %r1
	.word 0xcd3a28b0  ! 425: STDF_I	std	%f6, [0x08b0, %r8]
	.word 0xa45a0009  ! 426: SMUL_R	smul 	%r8, %r9, %r18
	.word 0xacd22778  ! 427: UMULcc_I	umulcc 	%r8, 0x0778, %r22
	.word 0xc6522350  ! 428: LDSH_I	ldsh	[%r8 + 0x0350], %r3
	.word 0xce522458  ! 429: LDSH_I	ldsh	[%r8 + 0x0458], %r7
	.word 0xefe22009  ! 430: CASA_R	casa	[%r8] %asi, %r9, %r23
	.word 0x8c4a27c8  ! 431: MULX_I	mulx 	%r8, 0x07c8, %r6
	.word 0xc4420009  ! 432: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xea4a0009  ! 433: LDSB_R	ldsb	[%r8 + %r9], %r21
	.word 0xc242287c  ! 434: LDSW_I	ldsw	[%r8 + 0x087c], %r1
	.word 0xcc7a0009  ! 435: SWAP_R	swap	%r6, [%r8 + %r9]
	.word 0xd8b22a10  ! 436: STHA_I	stha	%r12, [%r8 + 0x0a10] %asi
	.word 0xdd3a2f68  ! 437: STDF_I	std	%f14, [0x0f68, %r8]
	.word 0xfa7a0009  ! 438: SWAP_R	swap	%r29, [%r8 + %r9]
	.word 0xc3ea2d98  ! 439: PREFETCHA_I	prefetcha	[%r8, + 0x0d98] %asi, #one_read
	.word 0x24c20008  ! 441: BRLEZ	brlez,a,nt	%8,<label_0x20008>
	.word 0xe6822f10  ! 442: LDUWA_I	lduwa	[%r8, + 0x0f10] %asi, %r19
	.word 0x856a2d80  ! 443: SDIVX_I	sdivx	%r8, 0x0d80, %r2
	.word 0xc6fa1009  ! 444: SWAPA_R	swapa	%r3, [%r8 + %r9] 0x80
	.word 0x8cd20009  ! 445: UMULcc_R	umulcc 	%r8, %r9, %r6
	.word 0xcc822e90  ! 446: LDUWA_I	lduwa	[%r8, + 0x0e90] %asi, %r6
	.word 0xc8420009  ! 447: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xa07a2d9c  ! 448: SDIV_I	sdiv 	%r8, 0x0d9c, %r16
	.word 0x83a208a9  ! 449: FSUBs	fsubs	%f8, %f9, %f1
	.word 0x8143e048  ! 450: MEMBAR	membar	#StoreStore | #Sync 
	.word 0xc7222354  ! 451: STF_I	st	%f3, [0x0354, %r8]
	.word 0xcaaa1009  ! 452: STBA_R	stba	%r5, [%r8 + %r9] 0x80
	.word 0x87a208a9  ! 453: FSUBs	fsubs	%f8, %f9, %f3
	.word 0x82f22550  ! 454: UDIVcc_I	udivcc 	%r8, 0x0550, %r1
	.word 0x8143e01d  ! 455: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside 
	.word 0xf6821009  ! 456: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r27
	.word 0xdab21009  ! 457: STHA_R	stha	%r13, [%r8 + %r9] 0x80
	.word 0xc3ea2ef8  ! 458: PREFETCHA_I	prefetcha	[%r8, + 0x0ef8] %asi, #one_read
	.word 0xcaaa1009  ! 459: STBA_R	stba	%r5, [%r8 + %r9] 0x80
	.word 0x99220009  ! 460: MULScc_R	mulscc 	%r8, %r9, %r12
	.word 0xce522b94  ! 461: LDSH_I	ldsh	[%r8 + 0x0b94], %r7
	.word 0x8143e026  ! 462: MEMBAR	membar	#StoreLoad | #LoadStore | #MemIssue 
	.word 0xe2922850  ! 463: LDUHA_I	lduha	[%r8, + 0x0850] %asi, %r17
	.word 0xac7a0009  ! 464: SDIV_R	sdiv 	%r8, %r9, %r22
	.word 0x16800008  ! 465: BGE	bge  	<label_0x8>
	.word 0xc48a2774  ! 466: LDUBA_I	lduba	[%r8, + 0x0774] %asi, %r2
	.word 0x85222b88  ! 467: MULScc_I	mulscc 	%r8, 0x0b88, %r2
	.word 0xec522b70  ! 468: LDSH_I	ldsh	[%r8 + 0x0b70], %r22
	.word 0x8143c000  ! 469: STBAR	stbar
	.word 0xcca21009  ! 470: STWA_R	stwa	%r6, [%r8 + %r9] 0x80
	.word 0x8143e019  ! 471: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside 
	.word 0xec1a0009  ! 472: LDD_R	ldd	[%r8 + %r9], %r22
	.word 0xeaa21009  ! 473: STWA_R	stwa	%r21, [%r8 + %r9] 0x80
	.word 0xc812215c  ! 474: LDUH_I	lduh	[%r8 + 0x015c], %r4
	.word 0x8ba20929  ! 475: FMULs	fmuls	%f8, %f9, %f5
	.word 0xca0a2ffc  ! 476: LDUB_I	ldub	[%r8 + 0x0ffc], %r5
	.word 0x845227e8  ! 477: UMUL_I	umul 	%r8, 0x07e8, %r2
	.word 0xc33a0009  ! 478: STDF_R	std	%f1, [%r9, %r8]
	.word 0x885a0009  ! 479: SMUL_R	smul 	%r8, %r9, %r4
	.word 0x86f22f10  ! 480: UDIVcc_I	udivcc 	%r8, 0x0f10, %r3
	.word 0x0e800008  ! 481: BVS	bvs  	<label_0x8>
	.word 0xfac220b4  ! 482: LDSWA_I	ldswa	[%r8, + 0x00b4] %asi, %r29
	.word 0xc2ca2c3c  ! 483: LDSBA_I	ldsba	[%r8, + 0x0c3c] %asi, %r1
	.word 0x04800004  ! 484: BLE	ble  	<label_0x4>
	.word 0xccca2040  ! 485: LDSBA_I	ldsba	[%r8, + 0x0040] %asi, %r6
	.word 0xe2ca20f0  ! 486: LDSBA_I	ldsba	[%r8, + 0x00f0] %asi, %r17
	.word 0xc4922bb4  ! 487: LDUHA_I	lduha	[%r8, + 0x0bb4] %asi, %r2
	.word 0x0ac20004  ! 488: BRNZ	brnz  ,nt	%8,<label_0x20004>
	.word 0xcaaa2a9c  ! 489: STBA_I	stba	%r5, [%r8 + 0x0a9c] %asi
	.word 0x88722b64  ! 490: UDIV_I	udiv 	%r8, 0x0b64, %r4
	.word 0x2aca0004  ! 491: BRNZ	brnz,a,pt	%8,<label_0xa0004>
	.word 0xe07a270c  ! 492: SWAP_I	swap	%r16, [%r8 + 0x070c]
	.word 0xcef22998  ! 493: STXA_I	stxa	%r7, [%r8 + 0x0998] %asi
	.word 0xf6122188  ! 494: LDUH_I	lduh	[%r8 + 0x0188], %r27
	.word 0xdd220009  ! 495: STF_R	st	%f14, [%r9, %r8]
	.word 0x8ef20009  ! 496: UDIVcc_R	udivcc 	%r8, %r9, %r7
	.word 0x02800004  ! 497: BE	be  	<label_0x4>
	.word 0xce120009  ! 498: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0x1a800004  ! 499: BCC	bcc  	<label_0x4>
	.word 0x8143e075  ! 500: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside | #MemIssue | #Sync 
	.word 0xc3ea2098  ! 501: PREFETCHA_I	prefetcha	[%r8, + 0x0098] %asi, #one_read
	.word 0xafa20929  ! 502: FMULs	fmuls	%f8, %f9, %f23
	.word 0x89a20929  ! 503: FMULs	fmuls	%f8, %f9, %f4
	.word 0x87222150  ! 504: MULScc_I	mulscc 	%r8, 0x0150, %r3
	.word 0x82520009  ! 505: UMUL_R	umul 	%r8, %r9, %r1
	.word 0xcc7a2fbc  ! 506: SWAP_I	swap	%r6, [%r8 + 0x0fbc]
	.word 0xe2ea1009  ! 507: LDSTUBA_R	ldstuba	%r17, [%r8 + %r9] 0x80
	.word 0x8b6a0009  ! 508: SDIVX_R	sdivx	%r8, %r9, %r5
	.word 0x2c800004  ! 509: BNEG	bneg,a	<label_0x4>
	.word 0x8fa20829  ! 510: FADDs	fadds	%f8, %f9, %f7
	.word 0xc8921009  ! 511: LDUHA_R	lduha	[%r8, %r9] 0x80, %r4
	.word 0xc40a0009  ! 513: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0x8da208a9  ! 514: FSUBs	fsubs	%f8, %f9, %f6
	.word 0xd4aa28b8  ! 515: STBA_I	stba	%r10, [%r8 + 0x08b8] %asi
	.word 0xdc120009  ! 516: LDUH_R	lduh	[%r8 + %r9], %r14
	.word 0xdcba1009  ! 517: STDA_R	stda	%r14, [%r8 + %r9] 0x80
	.word 0xc6a21009  ! 518: STWA_R	stwa	%r3, [%r8 + %r9] 0x80
	.word 0xc36a2ddc  ! 519: PREFETCH_I	prefetch	[%r8 + 0x0ddc], #one_read
	.word 0x8143c000  ! 520: STBAR	stbar
	.word 0xcc122948  ! 521: LDUH_I	lduh	[%r8 + 0x0948], %r6
	.word 0xfde21009  ! 522: CASA_I	casa	[%r8] 0x80, %r9, %r30
	.word 0x9c520009  ! 523: UMUL_R	umul 	%r8, %r9, %r14
	.word 0x8c720009  ! 524: UDIV_R	udiv 	%r8, %r9, %r6
	.word 0x8a720009  ! 525: UDIV_R	udiv 	%r8, %r9, %r5
	.word 0xfd3a0009  ! 526: STDF_R	std	%f30, [%r9, %r8]
	.word 0x8143c000  ! 527: STBAR	stbar
	.word 0xb36a2334  ! 529: SDIVX_I	sdivx	%r8, 0x0334, %r25
	.word 0xceaa1009  ! 530: STBA_R	stba	%r7, [%r8 + %r9] 0x80
	.word 0xc6aa2024  ! 531: STBA_I	stba	%r3, [%r8 + 0x0024] %asi
	.word 0x8143c000  ! 532: STBAR	stbar
	.word 0xdcf223d0  ! 533: STXA_I	stxa	%r14, [%r8 + 0x03d0] %asi
	.word 0x8143c000  ! 534: STBAR	stbar
	.word 0xc3ea2ab0  ! 535: PREFETCHA_I	prefetcha	[%r8, + 0x0ab0] %asi, #one_read
	.word 0xc6ea26ac  ! 536: LDSTUBA_I	ldstuba	%r3, [%r8 + 0x06ac] %asi
	.word 0x89a20829  ! 539: FADDs	fadds	%f8, %f9, %f4
	.word 0x82522610  ! 540: UMUL_I	umul 	%r8, 0x0610, %r1
	.word 0xec9a1009  ! 541: LDDA_R	ldda	[%r8, %r9] 0x80, %r22
	.word 0x83a20829  ! 542: FADDs	fadds	%f8, %f9, %f1
	.word 0xce5a0009  ! 543: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xc4f223c8  ! 544: STXA_I	stxa	%r2, [%r8 + 0x03c8] %asi
	.word 0x04c20008  ! 545: BRLEZ	brlez  ,nt	%8,<label_0x20008>
	.word 0xd40a0009  ! 546: LDUB_R	ldub	[%r8 + %r9], %r10
	.word 0xccfa2604  ! 547: SWAPA_I	swapa	%r6, [%r8 + 0x0604] %asi
	.word 0x8f6a2760  ! 548: SDIVX_I	sdivx	%r8, 0x0760, %r7
	.word 0xfcba1009  ! 549: STDA_R	stda	%r30, [%r8 + %r9] 0x80
	.word 0xfa4a242c  ! 550: LDSB_I	ldsb	[%r8 + 0x042c], %r29
	.word 0x8cfa2e14  ! 551: SDIVcc_I	sdivcc 	%r8, 0x0e14, %r6
	.word 0xfeea1009  ! 552: LDSTUBA_R	ldstuba	%r31, [%r8 + %r9] 0x80
	.word 0xfaf21009  ! 553: STXA_R	stxa	%r29, [%r8 + %r9] 0x80
	.word 0x8eda2df8  ! 554: SMULcc_I	smulcc 	%r8, 0x0df8, %r7
	.word 0xc33a0009  ! 555: STDF_R	std	%f1, [%r9, %r8]
	.word 0xcaf22b80  ! 556: STXA_I	stxa	%r5, [%r8 + 0x0b80] %asi
	.word 0x8c5a0009  ! 557: SMUL_R	smul 	%r8, %r9, %r6
	.word 0x8f6a25b0  ! 558: SDIVX_I	sdivx	%r8, 0x05b0, %r7
	.word 0x88da2374  ! 559: SMULcc_I	smulcc 	%r8, 0x0374, %r4
	.word 0xc2ea1009  ! 560: LDSTUBA_R	ldstuba	%r1, [%r8 + %r9] 0x80
	.word 0xe47a0009  ! 561: SWAP_R	swap	%r18, [%r8 + %r9]
	.word 0x8ba20829  ! 562: FADDs	fadds	%f8, %f9, %f5
	.word 0x8143e05c  ! 563: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0x8143e049  ! 564: MEMBAR	membar	#LoadLoad | #StoreStore | #Sync 
	.word 0xf41a0009  ! 565: LDD_R	ldd	[%r8 + %r9], %r26
	.word 0xcc0a2d54  ! 566: LDUB_I	ldub	[%r8 + 0x0d54], %r6
	.word 0xc3ea23f4  ! 567: PREFETCHA_I	prefetcha	[%r8, + 0x03f4] %asi, #one_read
	.word 0xc9222138  ! 568: STF_I	st	%f4, [0x0138, %r8]
	.word 0xcefa2e68  ! 569: SWAPA_I	swapa	%r7, [%r8 + 0x0e68] %asi
	.word 0xd4120009  ! 570: LDUH_R	lduh	[%r8 + %r9], %r10
	.word 0xc322253c  ! 571: STF_I	st	%f1, [0x053c, %r8]
	.word 0xcd3a20d8  ! 572: STDF_I	std	%f6, [0x00d8, %r8]
	.word 0xc4ba1009  ! 573: STDA_R	stda	%r2, [%r8 + %r9] 0x80
	.word 0xeec223bc  ! 574: LDSWA_I	ldswa	[%r8, + 0x03bc] %asi, %r23
	.word 0xcc0a251c  ! 575: LDUB_I	ldub	[%r8 + 0x051c], %r6
	.word 0xcf3a2730  ! 576: STDF_I	std	%f7, [0x0730, %r8]
	.word 0xc3220009  ! 577: STF_R	st	%f1, [%r9, %r8]
	.word 0x89a20929  ! 578: FMULs	fmuls	%f8, %f9, %f4
	.word 0xc32226d8  ! 579: STF_I	st	%f1, [0x06d8, %r8]
	.word 0x8143c000  ! 580: STBAR	stbar
	.word 0xa07223c4  ! 581: UDIV_I	udiv 	%r8, 0x03c4, %r16
	.word 0x85a208a9  ! 582: FSUBs	fsubs	%f8, %f9, %f2
	.word 0xb45a0009  ! 583: SMUL_R	smul 	%r8, %r9, %r26
	.word 0x8143c000  ! 584: STBAR	stbar
	.word 0x40000004  ! 585: CALL	call	disp30_4
	.word 0xb4d22f5c  ! 586: UMULcc_I	umulcc 	%r8, 0x0f5c, %r26
	.word 0xaf220009  ! 587: MULScc_R	mulscc 	%r8, %r9, %r23
	.word 0x84fa0009  ! 588: SDIVcc_R	sdivcc 	%r8, %r9, %r2
	.word 0x884a0009  ! 589: MULX_R	mulx 	%r8, %r9, %r4
	.word 0xc93a2fb8  ! 590: STDF_I	std	%f4, [0x0fb8, %r8]
	.word 0xc8d21009  ! 591: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r4
	.word 0xb44a0009  ! 592: MULX_R	mulx 	%r8, %r9, %r26
	.word 0xca522c38  ! 593: LDSH_I	ldsh	[%r8 + 0x0c38], %r5
	.word 0xbb6a0009  ! 594: SDIVX_R	sdivx	%r8, %r9, %r29
	.word 0xc36a2304  ! 595: PREFETCH_I	prefetch	[%r8 + 0x0304], #one_read
	.word 0xc88a2dcc  ! 596: LDUBA_I	lduba	[%r8, + 0x0dcc] %asi, %r4
	.word 0xb7a20829  ! 597: FADDs	fadds	%f8, %f9, %f27
	.word 0xe26a2980  ! 598: LDSTUB_I	ldstub	%r17, [%r8 + 0x0980]
	.word 0x8143c000  ! 599: STBAR	stbar
	.word 0xc8a21009  ! 600: STWA_R	stwa	%r4, [%r8 + %r9] 0x80
	.word 0xa6720009  ! 601: UDIV_R	udiv 	%r8, %r9, %r19
	.word 0xc60a2a10  ! 602: LDUB_I	ldub	[%r8 + 0x0a10], %r3
	.word 0xc8522b3c  ! 603: LDSH_I	ldsh	[%r8 + 0x0b3c], %r4
	.word 0xc2aa1009  ! 604: STBA_R	stba	%r1, [%r8 + %r9] 0x80
	.word 0xb8522368  ! 605: UMUL_I	umul 	%r8, 0x0368, %r28
	.word 0xf6122df8  ! 606: LDUH_I	lduh	[%r8 + 0x0df8], %r27
	.word 0xf8f21009  ! 607: STXA_R	stxa	%r28, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 608: STBAR	stbar
	.word 0xcc821009  ! 609: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r6
	.word 0xca6a21c0  ! 610: LDSTUB_I	ldstub	%r5, [%r8 + 0x01c0]
	.word 0xcc4a0009  ! 611: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xc60a2a54  ! 612: LDUB_I	ldub	[%r8 + 0x0a54], %r3
	.word 0x825a0009  ! 613: SMUL_R	smul 	%r8, %r9, %r1
	.word 0x8143e04c  ! 614: MEMBAR	membar	#LoadStore | #StoreStore | #Sync 
	.word 0x84fa0009  ! 615: SDIVcc_R	sdivcc 	%r8, %r9, %r2
	.word 0xb4da23e8  ! 616: SMULcc_I	smulcc 	%r8, 0x03e8, %r26
	.word 0xcc821009  ! 617: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r6
	.word 0xc36a25e4  ! 618: PREFETCH_I	prefetch	[%r8 + 0x05e4], #one_read
	.word 0x89a20829  ! 619: FADDs	fadds	%f8, %f9, %f4
	.word 0xd88a2854  ! 620: LDUBA_I	lduba	[%r8, + 0x0854] %asi, %r12
	.word 0x8fa208a9  ! 621: FSUBs	fsubs	%f8, %f9, %f7
	.word 0x887a0009  ! 622: SDIV_R	sdiv 	%r8, %r9, %r4
	.word 0xc6922284  ! 623: LDUHA_I	lduha	[%r8, + 0x0284] %asi, %r3
	.word 0x8143e042  ! 624: MEMBAR	membar	#StoreLoad | #Sync 
	.word 0xceb221d4  ! 625: STHA_I	stha	%r7, [%r8 + 0x01d4] %asi
	.word 0x2cca0004  ! 626: BRGZ	brgz,a,pt	%8,<label_0xa0004>
	.word 0x844a2bb8  ! 627: MULX_I	mulx 	%r8, 0x0bb8, %r2
	.word 0xccea1009  ! 628: LDSTUBA_R	ldstuba	%r6, [%r8 + %r9] 0x80
	.word 0xc41228f4  ! 629: LDUH_I	lduh	[%r8 + 0x08f4], %r2
	.word 0xc4b21009  ! 630: STHA_R	stha	%r2, [%r8 + %r9] 0x80
	.word 0xee822eec  ! 631: LDUWA_I	lduwa	[%r8, + 0x0eec] %asi, %r23
	.word 0x2e800004  ! 632: BVS	bvs,a	<label_0x4>
	.word 0x8143e067  ! 633: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #MemIssue | #Sync 
	.word 0x84520009  ! 634: UMUL_R	umul 	%r8, %r9, %r2
	.word 0x24800004  ! 635: BLE	ble,a	<label_0x4>
	.word 0xc6ca1009  ! 636: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r3
	.word 0x82720009  ! 637: UDIV_R	udiv 	%r8, %r9, %r1
	.word 0xfa6a254c  ! 638: LDSTUB_I	ldstub	%r29, [%r8 + 0x054c]
	.word 0x8143c000  ! 639: STBAR	stbar
	.word 0xc36a2f4c  ! 640: PREFETCH_I	prefetch	[%r8 + 0x0f4c], #one_read
	.word 0xc6d21009  ! 641: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r3
	.word 0xcca22900  ! 642: STWA_I	stwa	%r6, [%r8 + 0x0900] %asi
	.word 0x00800004  ! 643: BN	bn  	<label_0x4>
	.word 0xc4120009  ! 644: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0x9e520009  ! 646: UMUL_R	umul 	%r8, %r9, %r15
	.word 0xc8aa1009  ! 647: STBA_R	stba	%r4, [%r8 + %r9] 0x80
	.word 0xccca1009  ! 648: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r6
	.word 0x85a20829  ! 650: FADDs	fadds	%f8, %f9, %f2
	.word 0xccfa2290  ! 651: SWAPA_I	swapa	%r6, [%r8 + 0x0290] %asi
	.word 0xc40a2524  ! 652: LDUB_I	ldub	[%r8 + 0x0524], %r2
	.word 0x89a20829  ! 653: FADDs	fadds	%f8, %f9, %f4
	.word 0xd65a2be8  ! 654: LDX_I	ldx	[%r8 + 0x0be8], %r11
	.word 0xc3ea2c40  ! 655: PREFETCHA_I	prefetcha	[%r8, + 0x0c40] %asi, #one_read
	.word 0xc89a2e40  ! 656: LDDA_I	ldda	[%r8, + 0x0e40] %asi, %r4
	.word 0xcc1a2090  ! 657: LDD_I	ldd	[%r8 + 0x0090], %r6
	.word 0xcfe22009  ! 658: CASA_R	casa	[%r8] %asi, %r9, %r7
	.word 0xab222bcc  ! 659: MULScc_I	mulscc 	%r8, 0x0bcc, %r21
	.word 0x3c800004  ! 660: BPOS	bpos,a	<label_0x4>
	.word 0x2eca0004  ! 661: BRGEZ	brgez,a,pt	%8,<label_0xa0004>
	.word 0x10800004  ! 662: BA	ba  	<label_0x4>
	.word 0xb86a2d8c  ! 663: UDIVX_I	udivx 	%r8, 0x0d8c, %r28
	.word 0x32800004  ! 664: BNE	bne,a	<label_0x4>
	.word 0x8143e01c  ! 665: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside 
	.word 0x8ed20009  ! 666: UMULcc_R	umulcc 	%r8, %r9, %r7
	.word 0x8cf20009  ! 667: UDIVcc_R	udivcc 	%r8, %r9, %r6
	.word 0x96fa0009  ! 668: SDIVcc_R	sdivcc 	%r8, %r9, %r11
	.word 0x2a800008  ! 669: BCS	bcs,a	<label_0x8>
	.word 0xcad21009  ! 670: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r5
	.word 0x9d6a2d5c  ! 671: SDIVX_I	sdivx	%r8, 0x0d5c, %r14
	.word 0xc41a2a88  ! 672: LDD_I	ldd	[%r8 + 0x0a88], %r2
	.word 0x9d6a0009  ! 673: SDIVX_R	sdivx	%r8, %r9, %r14
	.word 0xcca21009  ! 674: STWA_R	stwa	%r6, [%r8 + %r9] 0x80
	.word 0xb1a20929  ! 675: FMULs	fmuls	%f8, %f9, %f24
	.word 0xf49a1009  ! 676: LDDA_R	ldda	[%r8, %r9] 0x80, %r26
	.word 0x82520009  ! 677: UMUL_R	umul 	%r8, %r9, %r1
	.word 0x846a2248  ! 678: UDIVX_I	udivx 	%r8, 0x0248, %r2
	.word 0xb36a2498  ! 679: SDIVX_I	sdivx	%r8, 0x0498, %r25
	.word 0x89a20829  ! 680: FADDs	fadds	%f8, %f9, %f4
	.word 0xceda2108  ! 681: LDXA_I	ldxa	[%r8, + 0x0108] %asi, %r7
	.word 0x8143e04a  ! 682: MEMBAR	membar	#StoreLoad | #StoreStore | #Sync 
	.word 0x1e800008  ! 683: BVC	bvc  	<label_0x8>
	.word 0xfa522c68  ! 684: LDSH_I	ldsh	[%r8 + 0x0c68], %r29
	.word 0xc73a29e0  ! 685: STDF_I	std	%f3, [0x09e0, %r8]
	.word 0xc8a21009  ! 686: STWA_R	stwa	%r4, [%r8 + %r9] 0x80
	.word 0xc36a20b4  ! 687: PREFETCH_I	prefetch	[%r8 + 0x00b4], #one_read
	.word 0x8e722378  ! 688: UDIV_I	udiv 	%r8, 0x0378, %r7
	.word 0xde5a0009  ! 689: LDX_R	ldx	[%r8 + %r9], %r15
	.word 0xcc5a0009  ! 690: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xc4ca2fb0  ! 691: LDSBA_I	ldsba	[%r8, + 0x0fb0] %asi, %r2
	.word 0xda4a27f0  ! 692: LDSB_I	ldsb	[%r8 + 0x07f0], %r13
	.word 0xb8522830  ! 693: UMUL_I	umul 	%r8, 0x0830, %r28
	.word 0xce120009  ! 694: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0x8143c000  ! 695: STBAR	stbar
	.word 0xccd21009  ! 696: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r6
	.word 0x24ca0008  ! 697: BRLEZ	brlez,a,pt	%8,<label_0xa0008>
	.word 0x8143c000  ! 698: STBAR	stbar
	.word 0xc36a2eb0  ! 699: PREFETCH_I	prefetch	[%r8 + 0x0eb0], #one_read
	.word 0x8c7a2ff8  ! 700: SDIV_I	sdiv 	%r8, 0x0ff8, %r6
	.word 0x8da209a9  ! 701: FDIVs	fdivs	%f8, %f9, %f6
	.word 0xc2ea1009  ! 703: LDSTUBA_R	ldstuba	%r1, [%r8 + %r9] 0x80
	.word 0xcad21009  ! 704: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r5
	.word 0xbda20929  ! 705: FMULs	fmuls	%f8, %f9, %f30
	.word 0x95222a1c  ! 706: MULScc_I	mulscc 	%r8, 0x0a1c, %r10
	.word 0x20800004  ! 707: BN	bn,a	<label_0x4>
	.word 0x40000004  ! 708: CALL	call	disp30_4
	.word 0xec520009  ! 710: LDSH_R	ldsh	[%r8 + %r9], %r22
	.word 0xbe7a24a8  ! 711: SDIV_I	sdiv 	%r8, 0x04a8, %r31
	.word 0x30800004  ! 712: BA	ba,a	<label_0x4>
	.word 0xc40a26cc  ! 713: LDUB_I	ldub	[%r8 + 0x06cc], %r2
	.word 0x18800008  ! 714: BGU	bgu  	<label_0x8>
	.word 0xdc1a0009  ! 715: LDD_R	ldd	[%r8 + %r9], %r14
	.word 0xc5e22009  ! 716: CASA_R	casa	[%r8] %asi, %r9, %r2
	.word 0x8143e069  ! 717: MEMBAR	membar	#LoadLoad | #StoreStore | #MemIssue | #Sync 
	.word 0x8143c000  ! 718: STBAR	stbar
	.word 0xafa209a9  ! 719: FDIVs	fdivs	%f8, %f9, %f23
	.word 0x8ba20829  ! 720: FADDs	fadds	%f8, %f9, %f5
	.word 0x847a0009  ! 721: SDIV_R	sdiv 	%r8, %r9, %r2
	.word 0xc6420009  ! 722: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0x02800004  ! 723: BE	be  	<label_0x4>
	.word 0xcea21009  ! 724: STWA_R	stwa	%r7, [%r8 + %r9] 0x80
	.word 0xf4120009  ! 725: LDUH_R	lduh	[%r8 + %r9], %r26
	.word 0x2cc20004  ! 726: BRGZ	brgz,a,nt	%8,<label_0x20004>
	.word 0xc88a1009  ! 727: LDUBA_R	lduba	[%r8, %r9] 0x80, %r4
	.word 0x82522b40  ! 728: UMUL_I	umul 	%r8, 0x0b40, %r1
	.word 0xee120009  ! 729: LDUH_R	lduh	[%r8 + %r9], %r23
	.word 0xcff22009  ! 730: CASXA_R	casxa	[%r8]%asi, %r9, %r7
	.word 0x836a0009  ! 731: SDIVX_R	sdivx	%r8, %r9, %r1
	.word 0x8143e067  ! 732: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #MemIssue | #Sync 
	.word 0x8a5221a0  ! 733: UMUL_I	umul 	%r8, 0x01a0, %r5
	.word 0xc36a285c  ! 734: PREFETCH_I	prefetch	[%r8 + 0x085c], #one_read
	.word 0x86da2348  ! 735: SMULcc_I	smulcc 	%r8, 0x0348, %r3
	.word 0x856a0009  ! 736: SDIVX_R	sdivx	%r8, %r9, %r2
	.word 0x99a20829  ! 737: FADDs	fadds	%f8, %f9, %f12
	.word 0xec7a2468  ! 738: SWAP_I	swap	%r22, [%r8 + 0x0468]
	.word 0xc47a2d8c  ! 739: SWAP_I	swap	%r2, [%r8 + 0x0d8c]
	.word 0x8efa2f1c  ! 740: SDIVcc_I	sdivcc 	%r8, 0x0f1c, %r7
	.word 0xcc5a0009  ! 741: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0x8143e04a  ! 742: MEMBAR	membar	#StoreLoad | #StoreStore | #Sync 
	.word 0xb46a0009  ! 743: UDIVX_R	udivx 	%r8, %r9, %r26
	.word 0xef3a0009  ! 744: STDF_R	std	%f23, [%r9, %r8]
	.word 0x88d22410  ! 745: UMULcc_I	umulcc 	%r8, 0x0410, %r4
	.word 0xae6a0009  ! 746: UDIVX_R	udivx 	%r8, %r9, %r23
	.word 0xc3ea2fb4  ! 747: PREFETCHA_I	prefetcha	[%r8, + 0x0fb4] %asi, #one_read
	.word 0xbb6a0009  ! 748: SDIVX_R	sdivx	%r8, %r9, %r29
	.word 0x26c20004  ! 749: BRLZ	brlz,a,nt	%8,<label_0x20004>
	.word 0x3e800008  ! 750: BVC	bvc,a	<label_0x8>
	.word 0x8eda0009  ! 751: SMULcc_R	smulcc 	%r8, %r9, %r7
	.word 0xc2120009  ! 752: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xf68a2254  ! 753: LDUBA_I	lduba	[%r8, + 0x0254] %asi, %r27
	.word 0xc84228f0  ! 754: LDSW_I	ldsw	[%r8 + 0x08f0], %r4
	.word 0xc27a0009  ! 756: SWAP_R	swap	%r1, [%r8 + %r9]
	.word 0xcc6a23c8  ! 757: LDSTUB_I	ldstub	%r6, [%r8 + 0x03c8]
	.word 0xc2020009  ! 759: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xfe4a0009  ! 760: LDSB_R	ldsb	[%r8 + %r9], %r31
	.word 0xc3ea2fe0  ! 761: PREFETCHA_I	prefetcha	[%r8, + 0x0fe0] %asi, #one_read
	.word 0xc6420009  ! 762: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xcdf22009  ! 763: CASXA_R	casxa	[%r8]%asi, %r9, %r6
	.word 0xc26a0009  ! 764: LDSTUB_R	ldstub	%r1, [%r8 + %r9]
	.word 0x8fa209a9  ! 765: FDIVs	fdivs	%f8, %f9, %f7
	.word 0x88da20c8  ! 767: SMULcc_I	smulcc 	%r8, 0x00c8, %r4
	.word 0xc8f21009  ! 768: STXA_R	stxa	%r4, [%r8 + %r9] 0x80
	.word 0x0c800004  ! 769: BNEG	bneg  	<label_0x4>
	.word 0x8a7220f4  ! 770: UDIV_I	udiv 	%r8, 0x00f4, %r5
	.word 0xcea22320  ! 773: STWA_I	stwa	%r7, [%r8 + 0x0320] %asi
	.word 0xc73a21e0  ! 774: STDF_I	std	%f3, [0x01e0, %r8]
	.word 0xc93a0009  ! 776: STDF_R	std	%f4, [%r9, %r8]
	.word 0xd81a0009  ! 777: LDD_R	ldd	[%r8 + %r9], %r12
	.word 0xcada1009  ! 778: LDXA_R	ldxa	[%r8, %r9] 0x80, %r5
	.word 0xca7a24dc  ! 779: SWAP_I	swap	%r5, [%r8 + 0x04dc]
	.word 0xd93a0009  ! 780: STDF_R	std	%f12, [%r9, %r8]
	.word 0xc9220009  ! 781: STF_R	st	%f4, [%r9, %r8]
	.word 0xc442218c  ! 782: LDSW_I	ldsw	[%r8 + 0x018c], %r2
	.word 0x8f222f78  ! 783: MULScc_I	mulscc 	%r8, 0x0f78, %r7
	.word 0xc4b226b4  ! 784: STHA_I	stha	%r2, [%r8 + 0x06b4] %asi
	.word 0xf68228a4  ! 785: LDUWA_I	lduwa	[%r8, + 0x08a4] %asi, %r27
	.word 0x8143c000  ! 786: STBAR	stbar
	.word 0x8143c000  ! 787: STBAR	stbar
	.word 0xc5220009  ! 788: STF_R	st	%f2, [%r9, %r8]
	.word 0x2ec20004  ! 789: BRGEZ	brgez,a,nt	%8,<label_0x20004>
	.word 0xc2aa2528  ! 790: STBA_I	stba	%r1, [%r8 + 0x0528] %asi
	.word 0xc4ea1009  ! 791: LDSTUBA_R	ldstuba	%r2, [%r8 + %r9] 0x80
	.word 0xe27a24a0  ! 792: SWAP_I	swap	%r17, [%r8 + 0x04a0]
	.word 0x8af22c8c  ! 793: UDIVcc_I	udivcc 	%r8, 0x0c8c, %r5
	.word 0xc3ea2038  ! 794: PREFETCHA_I	prefetcha	[%r8, + 0x0038] %asi, #one_read
	.word 0x8143e079  ! 795: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xccb22148  ! 796: STHA_I	stha	%r6, [%r8 + 0x0148] %asi
	.word 0x85a209a9  ! 797: FDIVs	fdivs	%f8, %f9, %f2
	.word 0xcbf22009  ! 798: CASXA_R	casxa	[%r8]%asi, %r9, %r5
	.word 0x82da21cc  ! 799: SMULcc_I	smulcc 	%r8, 0x01cc, %r1
	.word 0xca8a2088  ! 800: LDUBA_I	lduba	[%r8, + 0x0088] %asi, %r5
	.word 0xdeb21009  ! 801: STHA_R	stha	%r15, [%r8 + %r9] 0x80
	.word 0xee5a0009  ! 803: LDX_R	ldx	[%r8 + %r9], %r23
	.word 0x12800004  ! 804: BNE	bne  	<label_0x4>
	.word 0xf4ca1009  ! 806: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r26
	.word 0x887a2d1c  ! 807: SDIV_I	sdiv 	%r8, 0x0d1c, %r4
	.word 0x8143c000  ! 808: STBAR	stbar
	.word 0x86da2f70  ! 809: SMULcc_I	smulcc 	%r8, 0x0f70, %r3
	.word 0xc3e21009  ! 810: CASA_I	casa	[%r8] 0x80, %r9, %r1
	.word 0xc9e22009  ! 811: CASA_R	casa	[%r8] %asi, %r9, %r4
	.word 0xc36a2bd8  ! 812: PREFETCH_I	prefetch	[%r8 + 0x0bd8], #one_read
	.word 0x8143c000  ! 813: STBAR	stbar
	.word 0x8143e043  ! 814: MEMBAR	membar	#LoadLoad | #StoreLoad | #Sync 
	.word 0xec1a2a08  ! 816: LDD_I	ldd	[%r8 + 0x0a08], %r22
	.word 0xce8a2794  ! 817: LDUBA_I	lduba	[%r8, + 0x0794] %asi, %r7
	.word 0xea420009  ! 818: LDSW_R	ldsw	[%r8 + %r9], %r21
	.word 0xc2a22a5c  ! 819: STWA_I	stwa	%r1, [%r8 + 0x0a5c] %asi
	.word 0xc44a0009  ! 820: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xccea1009  ! 821: LDSTUBA_R	ldstuba	%r6, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 822: STBAR	stbar
	.word 0xc4ba2be8  ! 823: STDA_I	stda	%r2, [%r8 + 0x0be8] %asi
	.word 0xe6b21009  ! 824: STHA_R	stha	%r19, [%r8 + %r9] 0x80
	.word 0x2c800004  ! 825: BNEG	bneg,a	<label_0x4>
	.word 0xf5222188  ! 826: STF_I	st	%f26, [0x0188, %r8]
	.word 0xc2da2db8  ! 827: LDXA_I	ldxa	[%r8, + 0x0db8] %asi, %r1
	.word 0xf4022484  ! 828: LDUW_I	lduw	[%r8 + 0x0484], %r26
	.word 0xbe6a2588  ! 829: UDIVX_I	udivx 	%r8, 0x0588, %r31
	.word 0xce12270c  ! 830: LDUH_I	lduh	[%r8 + 0x070c], %r7
	.word 0xf13a0009  ! 831: STDF_R	std	%f24, [%r9, %r8]
	.word 0xc89a26c0  ! 832: LDDA_I	ldda	[%r8, + 0x06c0] %asi, %r4
	.word 0xa3a208a9  ! 833: FSUBs	fsubs	%f8, %f9, %f17
	.word 0x8143e02b  ! 834: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #MemIssue 
	.word 0xe2fa28a8  ! 835: SWAPA_I	swapa	%r17, [%r8 + 0x08a8] %asi
	.word 0xc4c21009  ! 836: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r2
	.word 0x8ad20009  ! 837: UMULcc_R	umulcc 	%r8, %r9, %r5
	.word 0xe0ba1009  ! 838: STDA_R	stda	%r16, [%r8 + %r9] 0x80
	.word 0x8143e04d  ! 839: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Sync 
	.word 0xbc520009  ! 840: UMUL_R	umul 	%r8, %r9, %r30
	.word 0xccea2968  ! 841: LDSTUBA_I	ldstuba	%r6, [%r8 + 0x0968] %asi
	.word 0x8143e037  ! 842: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside | #MemIssue 
	.word 0xfc1a2330  ! 843: LDD_I	ldd	[%r8 + 0x0330], %r30
	.word 0xa3a20829  ! 844: FADDs	fadds	%f8, %f9, %f17
	.word 0xc3e21009  ! 845: CASA_I	casa	[%r8] 0x80, %r9, %r1
	.word 0x8ada25c8  ! 846: SMULcc_I	smulcc 	%r8, 0x05c8, %r5
	.word 0xc89226cc  ! 847: LDUHA_I	lduha	[%r8, + 0x06cc] %asi, %r4
	.word 0xc4ba27b8  ! 848: STDA_I	stda	%r2, [%r8 + 0x07b8] %asi
	.word 0xc85a20d0  ! 849: LDX_I	ldx	[%r8 + 0x00d0], %r4
	.word 0xcc7a0009  ! 850: SWAP_R	swap	%r6, [%r8 + %r9]
	.word 0xcaa21009  ! 851: STWA_R	stwa	%r5, [%r8 + %r9] 0x80
	.word 0xcc5a2008  ! 852: LDX_I	ldx	[%r8 + 0x0008], %r6
	.word 0x86da2708  ! 853: SMULcc_I	smulcc 	%r8, 0x0708, %r3
	.word 0x8143c000  ! 854: STBAR	stbar
	.word 0xf26a2084  ! 855: LDSTUB_I	ldstub	%r25, [%r8 + 0x0084]
	.word 0x40000004  ! 856: CALL	call	disp30_4
	.word 0xc36a2648  ! 857: PREFETCH_I	prefetch	[%r8 + 0x0648], #one_read
	.word 0xc4821009  ! 858: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r2
	.word 0xcefa2628  ! 859: SWAPA_I	swapa	%r7, [%r8 + 0x0628] %asi
	.word 0xeeca1009  ! 860: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r23
	.word 0x10800008  ! 861: BA	ba  	<label_0x8>
	.word 0xfcda2850  ! 862: LDXA_I	ldxa	[%r8, + 0x0850] %asi, %r30
	.word 0xc8f22bd8  ! 863: STXA_I	stxa	%r4, [%r8 + 0x0bd8] %asi
	.word 0xcea223c8  ! 864: STWA_I	stwa	%r7, [%r8 + 0x03c8] %asi
	.word 0x84fa0009  ! 865: SDIVcc_R	sdivcc 	%r8, %r9, %r2
	.word 0xc6a22854  ! 866: STWA_I	stwa	%r3, [%r8 + 0x0854] %asi
	.word 0x8143e05a  ! 867: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside | #Sync 
	.word 0xc4f21009  ! 868: STXA_R	stxa	%r2, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 869: STBAR	stbar
	.word 0x8143e063  ! 870: MEMBAR	membar	#LoadLoad | #StoreLoad | #MemIssue | #Sync 
	.word 0xc72223f4  ! 871: STF_I	st	%f3, [0x03f4, %r8]
	.word 0xccba2320  ! 872: STDA_I	stda	%r6, [%r8 + 0x0320] %asi
	.word 0x8143c000  ! 873: STBAR	stbar
	.word 0xc3ea2914  ! 874: PREFETCHA_I	prefetcha	[%r8, + 0x0914] %asi, #one_read
	.word 0xe0ba1009  ! 875: STDA_R	stda	%r16, [%r8 + %r9] 0x80
	.word 0xce4a0009  ! 876: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xeeea1009  ! 877: LDSTUBA_R	ldstuba	%r23, [%r8 + %r9] 0x80
	.word 0xf49a1009  ! 878: LDDA_R	ldda	[%r8, %r9] 0x80, %r26
	.word 0x896a25ac  ! 879: SDIVX_I	sdivx	%r8, 0x05ac, %r4
	.word 0x8b6a0009  ! 880: SDIVX_R	sdivx	%r8, %r9, %r5
	.word 0xb8522778  ! 881: UMUL_I	umul 	%r8, 0x0778, %r28
	.word 0x87a209a9  ! 882: FDIVs	fdivs	%f8, %f9, %f3
	.word 0xe33a2c20  ! 883: STDF_I	std	%f17, [0x0c20, %r8]
	.word 0xc7e22009  ! 885: CASA_R	casa	[%r8] %asi, %r9, %r3
	.word 0xcc7a2a3c  ! 886: SWAP_I	swap	%r6, [%r8 + 0x0a3c]
	.word 0xcc8a1009  ! 887: LDUBA_R	lduba	[%r8, %r9] 0x80, %r6
	.word 0xfc522814  ! 888: LDSH_I	ldsh	[%r8 + 0x0814], %r30
	.word 0x8a4a23ac  ! 889: MULX_I	mulx 	%r8, 0x03ac, %r5
	.word 0xc36a2cd0  ! 890: PREFETCH_I	prefetch	[%r8 + 0x0cd0], #one_read
	.word 0xd8ea1009  ! 891: LDSTUBA_R	ldstuba	%r12, [%r8 + %r9] 0x80
	.word 0x8ad20009  ! 893: UMULcc_R	umulcc 	%r8, %r9, %r5
	.word 0xc65229dc  ! 894: LDSH_I	ldsh	[%r8 + 0x09dc], %r3
	.word 0x8143e021  ! 895: MEMBAR	membar	#LoadLoad | #MemIssue 
	.word 0x8da20929  ! 896: FMULs	fmuls	%f8, %f9, %f6
	.word 0x8143e072  ! 897: MEMBAR	membar	#StoreLoad | #Lookaside | #MemIssue | #Sync 
	.word 0xc93a2e68  ! 898: STDF_I	std	%f4, [0x0e68, %r8]
	.word 0xc2120009  ! 899: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xf0d2284c  ! 900: LDSHA_I	ldsha	[%r8, + 0x084c] %asi, %r24
	.word 0xda42266c  ! 901: LDSW_I	ldsw	[%r8 + 0x066c], %r13
	.word 0xca821009  ! 902: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r5
	.word 0x26800004  ! 903: BL	bl,a	<label_0x4>
	.word 0xc80a262c  ! 904: LDUB_I	ldub	[%r8 + 0x062c], %r4
	.word 0x04800004  ! 905: BLE	ble  	<label_0x4>
	.word 0xc87a2e80  ! 906: SWAP_I	swap	%r4, [%r8 + 0x0e80]
	.word 0xec921009  ! 907: LDUHA_R	lduha	[%r8, %r9] 0x80, %r22
	.word 0xc66a0009  ! 908: LDSTUB_R	ldstub	%r3, [%r8 + %r9]
	.word 0xed3a0009  ! 909: STDF_R	std	%f22, [%r9, %r8]
	.word 0x846a24c8  ! 910: UDIVX_I	udivx 	%r8, 0x04c8, %r2
	.word 0xc66a22c0  ! 911: LDSTUB_I	ldstub	%r3, [%r8 + 0x02c0]
	.word 0xcac22080  ! 912: LDSWA_I	ldswa	[%r8, + 0x0080] %asi, %r5
	.word 0xb0522330  ! 913: UMUL_I	umul 	%r8, 0x0330, %r24
	.word 0xc2420009  ! 914: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xca0a2a80  ! 915: LDUB_I	ldub	[%r8 + 0x0a80], %r5
	.word 0xd8022acc  ! 916: LDUW_I	lduw	[%r8 + 0x0acc], %r12
	.word 0x8143c000  ! 917: STBAR	stbar
	.word 0xd60228c4  ! 918: LDUW_I	lduw	[%r8 + 0x08c4], %r11
	.word 0x3e800004  ! 919: BVC	bvc,a	<label_0x4>
	.word 0x89a209a9  ! 920: FDIVs	fdivs	%f8, %f9, %f4
	.word 0x8143e03a  ! 921: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside | #MemIssue 
	.word 0xc36a2d00  ! 922: PREFETCH_I	prefetch	[%r8 + 0x0d00], #one_read
	.word 0x97a20929  ! 923: FMULs	fmuls	%f8, %f9, %f11
	.word 0xe9e22009  ! 924: CASA_R	casa	[%r8] %asi, %r9, %r20
	.word 0xc2fa2620  ! 925: SWAPA_I	swapa	%r1, [%r8 + 0x0620] %asi
	.word 0x06ca0004  ! 927: BRLZ	brlz  ,pt	%8,<label_0xa0004>
	.word 0xb2d22d68  ! 928: UMULcc_I	umulcc 	%r8, 0x0d68, %r25
	.word 0xe4522c44  ! 929: LDSH_I	ldsh	[%r8 + 0x0c44], %r18
	.word 0x8143c000  ! 930: STBAR	stbar
	.word 0x3e800004  ! 931: BVC	bvc,a	<label_0x4>
	.word 0xa66a2270  ! 932: UDIVX_I	udivx 	%r8, 0x0270, %r19
	.word 0x84da0009  ! 933: SMULcc_R	smulcc 	%r8, %r9, %r2
	.word 0xbcfa0009  ! 935: SDIVcc_R	sdivcc 	%r8, %r9, %r30
	.word 0x30800004  ! 936: BA	ba,a	<label_0x4>
	.word 0xd7f21009  ! 937: CASXA_I	casxa	[%r8] 0x80, %r9, %r11
	.word 0x825a0009  ! 938: SMUL_R	smul 	%r8, %r9, %r1
	.word 0xccc21009  ! 939: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r6
	.word 0xf0ba1009  ! 940: STDA_R	stda	%r24, [%r8 + %r9] 0x80
	.word 0xb9220009  ! 941: MULScc_R	mulscc 	%r8, %r9, %r28
	.word 0x0cc20004  ! 942: BRGZ	brgz  ,nt	%8,<label_0x20004>
	.word 0xcc5a2790  ! 943: LDX_I	ldx	[%r8 + 0x0790], %r6
	.word 0x38800004  ! 944: BGU	bgu,a	<label_0x4>
	.word 0xa6fa2278  ! 945: SDIVcc_I	sdivcc 	%r8, 0x0278, %r19
	.word 0xd49a2b40  ! 946: LDDA_I	ldda	[%r8, + 0x0b40] %asi, %r10
	.word 0xd652211c  ! 947: LDSH_I	ldsh	[%r8 + 0x011c], %r11
	.word 0xc6822fc4  ! 948: LDUWA_I	lduwa	[%r8, + 0x0fc4] %asi, %r3
	.word 0xc3222dec  ! 949: STF_I	st	%f1, [0x0dec, %r8]
	.word 0x24ca0004  ! 950: BRLEZ	brlez,a,pt	%8,<label_0xa0004>
	.word 0x8143c000  ! 951: STBAR	stbar
	.word 0x1e800004  ! 952: BVC	bvc  	<label_0x4>
	.word 0xc33a0009  ! 953: STDF_R	std	%f1, [%r9, %r8]
	.word 0x9a520009  ! 954: UMUL_R	umul 	%r8, %r9, %r13
	.word 0x89a20929  ! 955: FMULs	fmuls	%f8, %f9, %f4
	.word 0x8a5a0009  ! 956: SMUL_R	smul 	%r8, %r9, %r5
	.word 0xc27a0009  ! 957: SWAP_R	swap	%r1, [%r8 + %r9]
	.word 0x82f20009  ! 958: UDIVcc_R	udivcc 	%r8, %r9, %r1
	.word 0xc7f22009  ! 959: CASXA_R	casxa	[%r8]%asi, %r9, %r3
	.word 0xccd21009  ! 960: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r6
	.word 0xec4a0009  ! 961: LDSB_R	ldsb	[%r8 + %r9], %r22
	.word 0x8da20929  ! 962: FMULs	fmuls	%f8, %f9, %f6
	.word 0xc5222fa0  ! 963: STF_I	st	%f2, [0x0fa0, %r8]
	.word 0x8143c000  ! 964: STBAR	stbar
	.word 0xbc4a2034  ! 965: MULX_I	mulx 	%r8, 0x0034, %r30
	.word 0xc3ea2670  ! 966: PREFETCHA_I	prefetcha	[%r8, + 0x0670] %asi, #one_read
	.word 0x8e4a0009  ! 967: MULX_R	mulx 	%r8, %r9, %r7
	.word 0xceaa1009  ! 968: STBA_R	stba	%r7, [%r8 + %r9] 0x80
	.word 0xc3220009  ! 969: STF_R	st	%f1, [%r9, %r8]
	.word 0xc3222a8c  ! 971: STF_I	st	%f1, [0x0a8c, %r8]
	.word 0xd4b21009  ! 972: STHA_R	stha	%r10, [%r8 + %r9] 0x80
	.word 0xcad221b8  ! 973: LDSHA_I	ldsha	[%r8, + 0x01b8] %asi, %r5
	.word 0x8da20929  ! 974: FMULs	fmuls	%f8, %f9, %f6
	.word 0xe8da27a8  ! 975: LDXA_I	ldxa	[%r8, + 0x07a8] %asi, %r20
	.word 0xf8d21009  ! 976: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r28
	.word 0x8143e045  ! 978: MEMBAR	membar	#LoadLoad | #LoadStore | #Sync 
	.word 0x8143c000  ! 980: STBAR	stbar
	.word 0xc8a22518  ! 981: STWA_I	stwa	%r4, [%r8 + 0x0518] %asi
	.word 0xc8a21009  ! 982: STWA_R	stwa	%r4, [%r8 + %r9] 0x80
	.word 0xafa20929  ! 983: FMULs	fmuls	%f8, %f9, %f23
	.word 0xe0b21009  ! 984: STHA_R	stha	%r16, [%r8 + %r9] 0x80
	.word 0x826a0009  ! 985: UDIVX_R	udivx 	%r8, %r9, %r1
	.word 0xb64a2818  ! 986: MULX_I	mulx 	%r8, 0x0818, %r27
	.word 0x1c800004  ! 987: BPOS	bpos  	<label_0x4>
	.word 0xd84a2678  ! 988: LDSB_I	ldsb	[%r8 + 0x0678], %r12
	.word 0x8f6a20ac  ! 989: SDIVX_I	sdivx	%r8, 0x00ac, %r7
	.word 0x24800008  ! 990: BLE	ble,a	<label_0x8>
	.word 0xc88a1009  ! 991: LDUBA_R	lduba	[%r8, %r9] 0x80, %r4
	.word 0x8ba208a9  ! 992: FSUBs	fsubs	%f8, %f9, %f5
	.word 0x3e800004  ! 993: BVC	bvc,a	<label_0x4>
	.word 0xefe21009  ! 994: CASA_I	casa	[%r8] 0x80, %r9, %r23
	.word 0x8143e01f  ! 995: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #Lookaside 
	.word 0xc6c21009  ! 996: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r3
	.word 0x1a800004  ! 997: BCC	bcc  	<label_0x4>
	.word 0x9af20009  ! 998: UDIVcc_R	udivcc 	%r8, %r9, %r13
	.word 0xce420009  ! 999: LDSW_R	ldsw	[%r8 + %r9], %r7
	nop
	nop
	nop
	nop
        ta      T_GOOD_TRAP

th_main_1:
        setx  MAIN_BASE_DATA_VA, %r1, %r8
        setx  0x0000000000000cd0, %g1, %r9
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
        setx  0x33cb1f8071b35edd, %g1, %r0
        setx  0x0e7be789803b417d, %g1, %r1
        setx  0xabbb9abb30f87365, %g1, %r2
        setx  0xf5173615be6aa16b, %g1, %r3
        setx  0x3e1972bb81f947ed, %g1, %r4
        setx  0x0ce424f01bf1cc9a, %g1, %r5
        setx  0xbed8146078ec9fd6, %g1, %r6
        setx  0xf14435afa650f3e7, %g1, %r7
        setx  0x512afbef9f84b85d, %g1, %r10
        setx  0x4dda27e7eaf993f0, %g1, %r11
        setx  0x35e864adf825efd8, %g1, %r12
        setx  0x7fbf90e045c1c6c7, %g1, %r13
        setx  0xf59ae8315f732b5b, %g1, %r14
        setx  0x0f260f41bb4347f6, %g1, %r15
        setx  0x33da9c182dae6f2c, %g1, %r16
        setx  0xd874ff50228eed2f, %g1, %r17
        setx  0x90a69c931d2e2cb5, %g1, %r18
        setx  0x635256e70ff82306, %g1, %r19
        setx  0x4841c6397d6fef8e, %g1, %r20
        setx  0x68bf0a73d4ec0390, %g1, %r21
        setx  0x24dd5d4cf89898df, %g1, %r22
        setx  0x99c5fcee338013cc, %g1, %r23
        setx  0x39ff43ba58de4606, %g1, %r24
        setx  0x1b75e36aa91f41d4, %g1, %r25
        setx  0x8b12ae0472bd77a8, %g1, %r26
        setx  0xb3ad64edf1bf18d5, %g1, %r27
        setx  0x958c3aba462efe68, %g1, %r28
        setx  0x86749a78c0cece3b, %g1, %r29
        setx  0xda0797d315021593, %g1, %r30
        setx  0xf7182f59d1386a36, %g1, %r31
	.word 0xce921009  ! 6: LDUHA_R	lduha	[%r8, %r9] 0x80, %r7
	.word 0xca5a0009  ! 7: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xead22d98  ! 8: LDSHA_I	ldsha	[%r8, + 0x0d98] %asi, %r21
	.word 0x8143c000  ! 9: STBAR	stbar
	.word 0xc6522668  ! 10: LDSH_I	ldsh	[%r8 + 0x0668], %r3
	.word 0x9e5a2094  ! 11: SMUL_I	smul 	%r8, 0x0094, %r15
	.word 0xceca21cc  ! 12: LDSBA_I	ldsba	[%r8, + 0x01cc] %asi, %r7
	.word 0xa3220009  ! 13: MULScc_R	mulscc 	%r8, %r9, %r17
	.word 0x22ca0004  ! 14: BRZ	brz,a,pt	%8,<label_0xa0004>
	.word 0xb06a2578  ! 15: UDIVX_I	udivx 	%r8, 0x0578, %r24
	.word 0x8c4a0009  ! 16: MULX_R	mulx 	%r8, %r9, %r6
	.word 0xec5a20e0  ! 17: LDX_I	ldx	[%r8 + 0x00e0], %r22
	.word 0xcc5a2170  ! 18: LDX_I	ldx	[%r8 + 0x0170], %r6
	.word 0xe0aa233c  ! 19: STBA_I	stba	%r16, [%r8 + 0x033c] %asi
	.word 0x827a0009  ! 20: SDIV_R	sdiv 	%r8, %r9, %r1
	.word 0x8143c000  ! 21: STBAR	stbar
	.word 0xc6a226a0  ! 22: STWA_I	stwa	%r3, [%r8 + 0x06a0] %asi
	.word 0xcafa2b30  ! 23: SWAPA_I	swapa	%r5, [%r8 + 0x0b30] %asi
	.word 0x8c720009  ! 24: UDIV_R	udiv 	%r8, %r9, %r6
	.word 0x06800004  ! 25: BL	bl  	<label_0x4>
	.word 0xe8aa27f8  ! 26: STBA_I	stba	%r20, [%r8 + 0x07f8] %asi
	.word 0xc36a248c  ! 27: PREFETCH_I	prefetch	[%r8 + 0x048c], #one_read
	.word 0x88fa22a8  ! 28: SDIVcc_I	sdivcc 	%r8, 0x02a8, %r4
	.word 0x8143c000  ! 29: STBAR	stbar
	.word 0x84fa0009  ! 30: SDIVcc_R	sdivcc 	%r8, %r9, %r2
	.word 0xdcba2b00  ! 31: STDA_I	stda	%r14, [%r8 + 0x0b00] %asi
	.word 0x2c800004  ! 32: BNEG	bneg,a	<label_0x4>
	.word 0x8143e027  ! 33: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #MemIssue 
	.word 0x89a208a9  ! 34: FSUBs	fsubs	%f8, %f9, %f4
	.word 0x0c800008  ! 35: BNEG	bneg  	<label_0x8>
	.word 0xc73a0009  ! 36: STDF_R	std	%f3, [%r9, %r8]
	.word 0xae720009  ! 37: UDIV_R	udiv 	%r8, %r9, %r23
	.word 0xca7a0009  ! 38: SWAP_R	swap	%r5, [%r8 + %r9]
	.word 0xb05a2cf4  ! 39: SMUL_I	smul 	%r8, 0x0cf4, %r24
	.word 0x8e4a0009  ! 40: MULX_R	mulx 	%r8, %r9, %r7
	.word 0x9fa208a9  ! 41: FSUBs	fsubs	%f8, %f9, %f15
	.word 0x30800004  ! 42: BA	ba,a	<label_0x4>
	.word 0xc3ea2208  ! 43: PREFETCHA_I	prefetcha	[%r8, + 0x0208] %asi, #one_read
	.word 0xf0ca1009  ! 44: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r24
	.word 0xaed20009  ! 45: UMULcc_R	umulcc 	%r8, %r9, %r23
	.word 0x8143c000  ! 46: STBAR	stbar
	.word 0x886a2c30  ! 47: UDIVX_I	udivx 	%r8, 0x0c30, %r4
	.word 0xd4520009  ! 48: LDSH_R	ldsh	[%r8 + %r9], %r10
	.word 0xdeea1009  ! 49: LDSTUBA_R	ldstuba	%r15, [%r8 + %r9] 0x80
	.word 0x8143e01a  ! 50: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside 
	.word 0x9cf22480  ! 51: UDIVcc_I	udivcc 	%r8, 0x0480, %r14
	.word 0x8143c000  ! 52: STBAR	stbar
	.word 0x16800008  ! 53: BGE	bge  	<label_0x8>
	.word 0x8143e015  ! 54: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside 
	.word 0x8143e012  ! 55: MEMBAR	membar	#StoreLoad | #Lookaside 
	.word 0xa04a2fe0  ! 56: MULX_I	mulx 	%r8, 0x0fe0, %r16
	.word 0xc4ca2aac  ! 57: LDSBA_I	ldsba	[%r8, + 0x0aac] %asi, %r2
	.word 0x1a800004  ! 58: BCC	bcc  	<label_0x4>
	.word 0xcea21009  ! 59: STWA_R	stwa	%r7, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 60: STBAR	stbar
	.word 0xf5220009  ! 61: STF_R	st	%f26, [%r9, %r8]
	.word 0x8e520009  ! 62: UMUL_R	umul 	%r8, %r9, %r7
	.word 0xff222238  ! 63: STF_I	st	%f31, [0x0238, %r8]
	.word 0x38800004  ! 64: BGU	bgu,a	<label_0x4>
	.word 0x8e520009  ! 65: UMUL_R	umul 	%r8, %r9, %r7
	.word 0xa6720009  ! 66: UDIV_R	udiv 	%r8, %r9, %r19
	.word 0xca7a2550  ! 67: SWAP_I	swap	%r5, [%r8 + 0x0550]
	.word 0x8fa208a9  ! 68: FSUBs	fsubs	%f8, %f9, %f7
	.word 0x8ef20009  ! 69: UDIVcc_R	udivcc 	%r8, %r9, %r7
	.word 0x8afa0009  ! 70: SDIVcc_R	sdivcc 	%r8, %r9, %r5
	.word 0xcad21009  ! 71: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r5
	.word 0x0c800008  ! 72: BNEG	bneg  	<label_0x8>
	.word 0xcc4a2db4  ! 73: LDSB_I	ldsb	[%r8 + 0x0db4], %r6
	.word 0x32800004  ! 74: BNE	bne,a	<label_0x4>
	.word 0xc36a29b8  ! 75: PREFETCH_I	prefetch	[%r8 + 0x09b8], #one_read
	.word 0x8143e037  ! 76: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside | #MemIssue 
	.word 0x12800004  ! 77: BNE	bne  	<label_0x4>
	.word 0xceb22104  ! 78: STHA_I	stha	%r7, [%r8 + 0x0104] %asi
	.word 0x8143e069  ! 79: MEMBAR	membar	#LoadLoad | #StoreStore | #MemIssue | #Sync 
	.word 0x28800004  ! 81: BLEU	bleu,a	<label_0x4>
	.word 0xdcf21009  ! 83: STXA_R	stxa	%r14, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 84: STBAR	stbar
	.word 0xc5e21009  ! 85: CASA_I	casa	[%r8] 0x80, %r9, %r2
	.word 0xe2a21009  ! 86: STWA_R	stwa	%r17, [%r8 + %r9] 0x80
	.word 0xfc9a1009  ! 88: LDDA_R	ldda	[%r8, %r9] 0x80, %r30
	.word 0xcbf22009  ! 90: CASXA_R	casxa	[%r8]%asi, %r9, %r5
	.word 0x06ca0004  ! 91: BRLZ	brlz  ,pt	%8,<label_0xa0004>
	.word 0xc6c220bc  ! 92: LDSWA_I	ldswa	[%r8, + 0x00bc] %asi, %r3
	.word 0xc3ea2e20  ! 93: PREFETCHA_I	prefetcha	[%r8, + 0x0e20] %asi, #one_read
	.word 0xe0aa1009  ! 94: STBA_R	stba	%r16, [%r8 + %r9] 0x80
	.word 0x827a23f4  ! 95: SDIV_I	sdiv 	%r8, 0x03f4, %r1
	.word 0xc4ca2c94  ! 96: LDSBA_I	ldsba	[%r8, + 0x0c94] %asi, %r2
	.word 0xce0a0009  ! 97: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xe2120009  ! 98: LDUH_R	lduh	[%r8 + %r9], %r17
	.word 0x9c4a0009  ! 99: MULX_R	mulx 	%r8, %r9, %r14
	.word 0xc44a0009  ! 100: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0x8143e071  ! 101: MEMBAR	membar	#LoadLoad | #Lookaside | #MemIssue | #Sync 
	.word 0xa47a0009  ! 102: SDIV_R	sdiv 	%r8, %r9, %r18
	.word 0xeaea1009  ! 103: LDSTUBA_R	ldstuba	%r21, [%r8 + %r9] 0x80
	.word 0xcc120009  ! 105: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0x8143c000  ! 106: STBAR	stbar
	.word 0x8fa20829  ! 107: FADDs	fadds	%f8, %f9, %f7
	.word 0xc8c21009  ! 108: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r4
	.word 0x8fa20829  ! 109: FADDs	fadds	%f8, %f9, %f7
	.word 0xc6c21009  ! 110: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r3
	.word 0xc4a2208c  ! 111: STWA_I	stwa	%r2, [%r8 + 0x008c] %asi
	.word 0xada209a9  ! 112: FDIVs	fdivs	%f8, %f9, %f22
	.word 0x896a27b4  ! 113: SDIVX_I	sdivx	%r8, 0x07b4, %r4
	.word 0xaa4a0009  ! 114: MULX_R	mulx 	%r8, %r9, %r21
	.word 0x82f20009  ! 115: UDIVcc_R	udivcc 	%r8, %r9, %r1
	.word 0xdd3a0009  ! 116: STDF_R	std	%f14, [%r9, %r8]
	.word 0x847a2f1c  ! 117: SDIV_I	sdiv 	%r8, 0x0f1c, %r2
	.word 0x02c20008  ! 118: BRZ	brz  ,nt	%8,<label_0x20008>
	.word 0x82fa25d4  ! 119: SDIVcc_I	sdivcc 	%r8, 0x05d4, %r1
	.word 0xdc9a1009  ! 120: LDDA_R	ldda	[%r8, %r9] 0x80, %r14
	.word 0x88722f64  ! 121: UDIV_I	udiv 	%r8, 0x0f64, %r4
	.word 0xc8d21009  ! 122: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r4
	.word 0xf8b21009  ! 123: STHA_R	stha	%r28, [%r8 + %r9] 0x80
	.word 0xd46a2eac  ! 124: LDSTUB_I	ldstub	%r10, [%r8 + 0x0eac]
	.word 0xfc9a1009  ! 125: LDDA_R	ldda	[%r8, %r9] 0x80, %r30
	.word 0x36800004  ! 126: BGE	bge,a	<label_0x4>
	.word 0xfa5a2488  ! 127: LDX_I	ldx	[%r8 + 0x0488], %r29
	.word 0x8143e02e  ! 128: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #MemIssue 
	.word 0xc3ea2700  ! 129: PREFETCHA_I	prefetcha	[%r8, + 0x0700] %asi, #one_read
	.word 0xc2f22cb0  ! 130: STXA_I	stxa	%r1, [%r8 + 0x0cb0] %asi
	.word 0xce9220fc  ! 131: LDUHA_I	lduha	[%r8, + 0x00fc] %asi, %r7
	.word 0xa3a20929  ! 132: FMULs	fmuls	%f8, %f9, %f17
	.word 0xca520009  ! 133: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xe8ba2298  ! 134: STDA_I	stda	%r20, [%r8 + 0x0298] %asi
	.word 0xf1222628  ! 135: STF_I	st	%f24, [0x0628, %r8]
	.word 0xdcba1009  ! 136: STDA_R	stda	%r14, [%r8 + %r9] 0x80
	.word 0xc8020009  ! 137: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xab220009  ! 138: MULScc_R	mulscc 	%r8, %r9, %r21
	.word 0xce122f14  ! 139: LDUH_I	lduh	[%r8 + 0x0f14], %r7
	.word 0x8143e071  ! 140: MEMBAR	membar	#LoadLoad | #Lookaside | #MemIssue | #Sync 
	.word 0xcc0221d4  ! 141: LDUW_I	lduw	[%r8 + 0x01d4], %r6
	.word 0xca5a2f60  ! 142: LDX_I	ldx	[%r8 + 0x0f60], %r5
	.word 0xc36a2308  ! 143: PREFETCH_I	prefetch	[%r8 + 0x0308], #one_read
	.word 0xcb220009  ! 144: STF_R	st	%f5, [%r9, %r8]
	.word 0x8143e07f  ! 145: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xd4ba1009  ! 146: STDA_R	stda	%r10, [%r8 + %r9] 0x80
	.word 0x0e800004  ! 147: BVS	bvs  	<label_0x4>
	.word 0x864a0009  ! 148: MULX_R	mulx 	%r8, %r9, %r3
	.word 0xb07a2e50  ! 150: SDIV_I	sdiv 	%r8, 0x0e50, %r24
	.word 0xc4ba27f8  ! 151: STDA_I	stda	%r2, [%r8 + 0x07f8] %asi
	.word 0xbe4a0009  ! 152: MULX_R	mulx 	%r8, %r9, %r31
	.word 0x88f226a4  ! 153: UDIVcc_I	udivcc 	%r8, 0x06a4, %r4
	.word 0xc40a2838  ! 154: LDUB_I	ldub	[%r8 + 0x0838], %r2
	.word 0xfa1229dc  ! 155: LDUH_I	lduh	[%r8 + 0x09dc], %r29
	.word 0x8143e008  ! 156: MEMBAR	membar	#StoreStore 
	.word 0x32800008  ! 157: BNE	bne,a	<label_0x8>
	.word 0x8fa20829  ! 158: FADDs	fadds	%f8, %f9, %f7
	.word 0xf1e21009  ! 159: CASA_I	casa	[%r8] 0x80, %r9, %r24
	.word 0x22c20008  ! 160: BRZ	brz,a,nt	%8,<label_0x20008>
	.word 0xae72225c  ! 161: UDIV_I	udiv 	%r8, 0x025c, %r23
	.word 0xc6da1009  ! 162: LDXA_R	ldxa	[%r8, %r9] 0x80, %r3
	.word 0xc3ea2214  ! 163: PREFETCHA_I	prefetcha	[%r8, + 0x0214] %asi, #one_read
	.word 0x8143c000  ! 164: STBAR	stbar
	.word 0x22c20008  ! 165: BRZ	brz,a,nt	%8,<label_0x20008>
	.word 0x8143c000  ! 166: STBAR	stbar
	.word 0xe13a2970  ! 167: STDF_I	std	%f16, [0x0970, %r8]
	.word 0xca422890  ! 168: LDSW_I	ldsw	[%r8 + 0x0890], %r5
	.word 0x8ada0009  ! 169: SMULcc_R	smulcc 	%r8, %r9, %r5
	.word 0xcefa2abc  ! 170: SWAPA_I	swapa	%r7, [%r8 + 0x0abc] %asi
	.word 0xc67a0009  ! 171: SWAP_R	swap	%r3, [%r8 + %r9]
	.word 0xe8ba1009  ! 173: STDA_R	stda	%r20, [%r8 + %r9] 0x80
	.word 0xcd3a22b0  ! 175: STDF_I	std	%f6, [0x02b0, %r8]
	.word 0xecfa28e8  ! 176: SWAPA_I	swapa	%r22, [%r8 + 0x08e8] %asi
	.word 0xc65a27a8  ! 177: LDX_I	ldx	[%r8 + 0x07a8], %r3
	.word 0xc8d22868  ! 178: LDSHA_I	ldsha	[%r8, + 0x0868] %asi, %r4
	.word 0xc40a0009  ! 179: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xde4a2414  ! 180: LDSB_I	ldsb	[%r8 + 0x0414], %r15
	.word 0x856a0009  ! 181: SDIVX_R	sdivx	%r8, %r9, %r2
	.word 0x87a20929  ! 182: FMULs	fmuls	%f8, %f9, %f3
	.word 0xc7f22009  ! 183: CASXA_R	casxa	[%r8]%asi, %r9, %r3
	.word 0xcbf22009  ! 184: CASXA_R	casxa	[%r8]%asi, %r9, %r5
	.word 0xc3ea2b8c  ! 185: PREFETCHA_I	prefetcha	[%r8, + 0x0b8c] %asi, #one_read
	.word 0x86520009  ! 186: UMUL_R	umul 	%r8, %r9, %r3
	.word 0xcefa2a6c  ! 187: SWAPA_I	swapa	%r7, [%r8 + 0x0a6c] %asi
	.word 0xc4520009  ! 188: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xcc8a1009  ! 189: LDUBA_R	lduba	[%r8, %r9] 0x80, %r6
	.word 0x8ba20829  ! 190: FADDs	fadds	%f8, %f9, %f5
	.word 0xa0f22e80  ! 191: UDIVcc_I	udivcc 	%r8, 0x0e80, %r16
	.word 0xc8f22c30  ! 192: STXA_I	stxa	%r4, [%r8 + 0x0c30] %asi
	.word 0xb0720009  ! 193: UDIV_R	udiv 	%r8, %r9, %r24
	.word 0xe0da1009  ! 194: LDXA_R	ldxa	[%r8, %r9] 0x80, %r16
	.word 0xb4d20009  ! 195: UMULcc_R	umulcc 	%r8, %r9, %r26
	.word 0x8af22dd0  ! 196: UDIVcc_I	udivcc 	%r8, 0x0dd0, %r5
	.word 0xc8020009  ! 197: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xc8d22118  ! 198: LDSHA_I	ldsha	[%r8, + 0x0118] %asi, %r4
	.word 0xb0720009  ! 199: UDIV_R	udiv 	%r8, %r9, %r24
	.word 0x40000008  ! 200: CALL	call	disp30_8
	.word 0xf4ea1009  ! 201: LDSTUBA_R	ldstuba	%r26, [%r8 + %r9] 0x80
	.word 0x966a0009  ! 202: UDIVX_R	udivx 	%r8, %r9, %r11
	.word 0xe06a0009  ! 203: LDSTUB_R	ldstub	%r16, [%r8 + %r9]
	.word 0xc36a2658  ! 204: PREFETCH_I	prefetch	[%r8 + 0x0658], #one_read
	.word 0x32800004  ! 206: BNE	bne,a	<label_0x4>
	.word 0xdc1a0009  ! 207: LDD_R	ldd	[%r8 + %r9], %r14
	.word 0xccfa1009  ! 208: SWAPA_R	swapa	%r6, [%r8 + %r9] 0x80
	.word 0x866a2ce0  ! 209: UDIVX_I	udivx 	%r8, 0x0ce0, %r3
	.word 0xc6520009  ! 210: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0x8143c000  ! 211: STBAR	stbar
	.word 0x14800008  ! 212: BG	bg  	<label_0x8>
	.word 0x9cd20009  ! 213: UMULcc_R	umulcc 	%r8, %r9, %r14
	.word 0x86d22ccc  ! 214: UMULcc_I	umulcc 	%r8, 0x0ccc, %r3
	.word 0xcea228ac  ! 215: STWA_I	stwa	%r7, [%r8 + 0x08ac] %asi
	.word 0x8143c000  ! 216: STBAR	stbar
	.word 0xc4b22528  ! 217: STHA_I	stha	%r2, [%r8 + 0x0528] %asi
	.word 0xc6922088  ! 218: LDUHA_I	lduha	[%r8, + 0x0088] %asi, %r3
	.word 0xc5222ac4  ! 219: STF_I	st	%f2, [0x0ac4, %r8]
	.word 0x887a2e20  ! 220: SDIV_I	sdiv 	%r8, 0x0e20, %r4
	.word 0x8fa209a9  ! 221: FDIVs	fdivs	%f8, %f9, %f7
	.word 0xb0d220f8  ! 222: UMULcc_I	umulcc 	%r8, 0x00f8, %r24
	.word 0xeaca1009  ! 223: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r21
	.word 0x06800004  ! 224: BL	bl  	<label_0x4>
	.word 0xc36a26bc  ! 225: PREFETCH_I	prefetch	[%r8 + 0x06bc], #one_read
	.word 0xe1e22009  ! 226: CASA_R	casa	[%r8] %asi, %r9, %r16
	.word 0x10800008  ! 227: BA	ba  	<label_0x8>
	.word 0xfcda1009  ! 228: LDXA_R	ldxa	[%r8, %r9] 0x80, %r30
	.word 0xa6d2240c  ! 229: UMULcc_I	umulcc 	%r8, 0x040c, %r19
	.word 0x845a26ec  ! 231: SMUL_I	smul 	%r8, 0x06ec, %r2
	.word 0xe6b228f0  ! 232: STHA_I	stha	%r19, [%r8 + 0x08f0] %asi
	.word 0x8d6a0009  ! 233: SDIVX_R	sdivx	%r8, %r9, %r6
	.word 0xc27a0009  ! 234: SWAP_R	swap	%r1, [%r8 + %r9]
	.word 0xce5a2e88  ! 235: LDX_I	ldx	[%r8 + 0x0e88], %r7
	.word 0xccaa1009  ! 236: STBA_R	stba	%r6, [%r8 + %r9] 0x80
	.word 0xc47a0009  ! 237: SWAP_R	swap	%r2, [%r8 + %r9]
	.word 0x8143c000  ! 238: STBAR	stbar
	.word 0xf49a1009  ! 239: LDDA_R	ldda	[%r8, %r9] 0x80, %r26
	.word 0xceb21009  ! 240: STHA_R	stha	%r7, [%r8 + %r9] 0x80
	.word 0xdaca1009  ! 241: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r13
	.word 0xc36a2034  ! 242: PREFETCH_I	prefetch	[%r8 + 0x0034], #one_read
	.word 0xd8b21009  ! 244: STHA_R	stha	%r12, [%r8 + %r9] 0x80
	.word 0x8143e004  ! 245: MEMBAR	membar	#LoadStore 
	.word 0x8a4a0009  ! 246: MULX_R	mulx 	%r8, %r9, %r5
	.word 0xc87a0009  ! 247: SWAP_R	swap	%r4, [%r8 + %r9]
	.word 0xbda208a9  ! 248: FSUBs	fsubs	%f8, %f9, %f30
	.word 0xc6821009  ! 249: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r3
	.word 0x22c20004  ! 250: BRZ	brz,a,nt	%8,<label_0x20004>
	.word 0xc2fa1009  ! 251: SWAPA_R	swapa	%r1, [%r8 + %r9] 0x80
	.word 0x8143e044  ! 252: MEMBAR	membar	#LoadStore | #Sync 
	.word 0xf6b225bc  ! 254: STHA_I	stha	%r27, [%r8 + 0x05bc] %asi
	.word 0x9f6a0009  ! 255: SDIVX_R	sdivx	%r8, %r9, %r15
	.word 0xcefa1009  ! 256: SWAPA_R	swapa	%r7, [%r8 + %r9] 0x80
	.word 0xca7a2210  ! 257: SWAP_I	swap	%r5, [%r8 + 0x0210]
	.word 0xc8ba2478  ! 258: STDA_I	stda	%r4, [%r8 + 0x0478] %asi
	.word 0xcbf21009  ! 259: CASXA_I	casxa	[%r8] 0x80, %r9, %r5
	.word 0x8143e056  ! 260: MEMBAR	membar	#StoreLoad | #LoadStore | #Lookaside | #Sync 
	.word 0xe60a266c  ! 261: LDUB_I	ldub	[%r8 + 0x066c], %r19
	.word 0xc3ea21d0  ! 262: PREFETCHA_I	prefetcha	[%r8, + 0x01d0] %asi, #one_read
	.word 0x825a0009  ! 263: SMUL_R	smul 	%r8, %r9, %r1
	.word 0x8eda0009  ! 264: SMULcc_R	smulcc 	%r8, %r9, %r7
	.word 0x8ef22d20  ! 265: UDIVcc_I	udivcc 	%r8, 0x0d20, %r7
	.word 0x84f20009  ! 266: UDIVcc_R	udivcc 	%r8, %r9, %r2
	.word 0xca122b94  ! 267: LDUH_I	lduh	[%r8 + 0x0b94], %r5
	.word 0xca4a2060  ! 268: LDSB_I	ldsb	[%r8 + 0x0060], %r5
	.word 0xc8fa1009  ! 269: SWAPA_R	swapa	%r4, [%r8 + %r9] 0x80
	.word 0xcf220009  ! 270: STF_R	st	%f7, [%r9, %r8]
	.word 0xc88a1009  ! 271: LDUBA_R	lduba	[%r8, %r9] 0x80, %r4
	.word 0xbb22202c  ! 272: MULScc_I	mulscc 	%r8, 0x002c, %r29
	.word 0x38800004  ! 273: BGU	bgu,a	<label_0x4>
	.word 0x8e5a0009  ! 274: SMUL_R	smul 	%r8, %r9, %r7
	.word 0x06800008  ! 275: BL	bl  	<label_0x8>
	.word 0x83a20829  ! 276: FADDs	fadds	%f8, %f9, %f1
	.word 0x84f20009  ! 277: UDIVcc_R	udivcc 	%r8, %r9, %r2
	.word 0xc36a2e6c  ! 278: PREFETCH_I	prefetch	[%r8 + 0x0e6c], #one_read
	.word 0xceda1009  ! 279: LDXA_R	ldxa	[%r8, %r9] 0x80, %r7
	.word 0x8143c000  ! 280: STBAR	stbar
	.word 0xcf220009  ! 281: STF_R	st	%f7, [%r9, %r8]
	.word 0xd4d22514  ! 282: LDSHA_I	ldsha	[%r8, + 0x0514] %asi, %r10
	.word 0xc4aa2e38  ! 283: STBA_I	stba	%r2, [%r8 + 0x0e38] %asi
	.word 0x18800008  ! 284: BGU	bgu  	<label_0x8>
	.word 0xe2f21009  ! 285: STXA_R	stxa	%r17, [%r8 + %r9] 0x80
	.word 0xc6f22b58  ! 286: STXA_I	stxa	%r3, [%r8 + 0x0b58] %asi
	.word 0x8143c000  ! 287: STBAR	stbar
	.word 0xc6a224b0  ! 288: STWA_I	stwa	%r3, [%r8 + 0x04b0] %asi
	.word 0xf09a1009  ! 289: LDDA_R	ldda	[%r8, %r9] 0x80, %r24
	.word 0xc36a217c  ! 290: PREFETCH_I	prefetch	[%r8 + 0x017c], #one_read
	.word 0xcca226b0  ! 291: STWA_I	stwa	%r6, [%r8 + 0x06b0] %asi
	.word 0xdf220009  ! 292: STF_R	st	%f15, [%r9, %r8]
	.word 0x8c7a0009  ! 293: SDIV_R	sdiv 	%r8, %r9, %r6
	.word 0x89222960  ! 294: MULScc_I	mulscc 	%r8, 0x0960, %r4
	.word 0xce4224a8  ! 295: LDSW_I	ldsw	[%r8 + 0x04a8], %r7
	.word 0x2c800008  ! 296: BNEG	bneg,a	<label_0x8>
	.word 0xcc922f34  ! 297: LDUHA_I	lduha	[%r8, + 0x0f34] %asi, %r6
	.word 0x8a5a0009  ! 298: SMUL_R	smul 	%r8, %r9, %r5
	.word 0xc28a1009  ! 299: LDUBA_R	lduba	[%r8, %r9] 0x80, %r1
	.word 0xcab22e10  ! 300: STHA_I	stha	%r5, [%r8 + 0x0e10] %asi
	.word 0xcc9a1009  ! 301: LDDA_R	ldda	[%r8, %r9] 0x80, %r6
	.word 0xc3220009  ! 302: STF_R	st	%f1, [%r9, %r8]
	.word 0x8143c000  ! 303: STBAR	stbar
	.word 0xca6a2edc  ! 304: LDSTUB_I	ldstub	%r5, [%r8 + 0x0edc]
	.word 0x0c800004  ! 305: BNEG	bneg  	<label_0x4>
	.word 0xfa8224a8  ! 306: LDUWA_I	lduwa	[%r8, + 0x04a8] %asi, %r29
	.word 0xcaf223b8  ! 307: STXA_I	stxa	%r5, [%r8 + 0x03b8] %asi
	.word 0xcff21009  ! 308: CASXA_I	casxa	[%r8] 0x80, %r9, %r7
	.word 0xf0ca214c  ! 309: LDSBA_I	ldsba	[%r8, + 0x014c] %asi, %r24
	.word 0xc36a2bb8  ! 310: PREFETCH_I	prefetch	[%r8 + 0x0bb8], #one_read
	.word 0xcaea1009  ! 311: LDSTUBA_R	ldstuba	%r5, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 313: STBAR	stbar
	.word 0xdd3a2c70  ! 314: STDF_I	std	%f14, [0x0c70, %r8]
	.word 0xa87a284c  ! 315: SDIV_I	sdiv 	%r8, 0x084c, %r20
	.word 0x846a2bac  ! 316: UDIVX_I	udivx 	%r8, 0x0bac, %r2
	.word 0xecba2ef0  ! 317: STDA_I	stda	%r22, [%r8 + 0x0ef0] %asi
	.word 0xc6b228a0  ! 318: STHA_I	stha	%r3, [%r8 + 0x08a0] %asi
	.word 0xcec22474  ! 319: LDSWA_I	ldswa	[%r8, + 0x0474] %asi, %r7
	.word 0x865a0009  ! 320: SMUL_R	smul 	%r8, %r9, %r3
	.word 0x85a20829  ! 321: FADDs	fadds	%f8, %f9, %f2
	.word 0xa24a2940  ! 322: MULX_I	mulx 	%r8, 0x0940, %r17
	.word 0x8143e04f  ! 323: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #Sync 
	.word 0xcd3a0009  ! 324: STDF_R	std	%f6, [%r9, %r8]
	.word 0xea921009  ! 325: LDUHA_R	lduha	[%r8, %r9] 0x80, %r21
	.word 0xaef22460  ! 326: UDIVcc_I	udivcc 	%r8, 0x0460, %r23
	.word 0xbba209a9  ! 327: FDIVs	fdivs	%f8, %f9, %f29
	.word 0xde120009  ! 328: LDUH_R	lduh	[%r8 + %r9], %r15
	.word 0xc36a2e58  ! 329: PREFETCH_I	prefetch	[%r8 + 0x0e58], #one_read
	.word 0xcbf21009  ! 330: CASXA_I	casxa	[%r8] 0x80, %r9, %r5
	.word 0xc2fa2e28  ! 332: SWAPA_I	swapa	%r1, [%r8 + 0x0e28] %asi
	.word 0x82f20009  ! 333: UDIVcc_R	udivcc 	%r8, %r9, %r1
	.word 0xcc822e68  ! 334: LDUWA_I	lduwa	[%r8, + 0x0e68] %asi, %r6
	.word 0xdc9a1009  ! 335: LDDA_R	ldda	[%r8, %r9] 0x80, %r14
	.word 0x8143e05a  ! 336: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside | #Sync 
	.word 0x8a4a0009  ! 337: MULX_R	mulx 	%r8, %r9, %r5
	.word 0xf2420009  ! 338: LDSW_R	ldsw	[%r8 + %r9], %r25
	.word 0x996a0009  ! 340: SDIVX_R	sdivx	%r8, %r9, %r12
	.word 0xc8c21009  ! 342: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r4
	.word 0xf8ba1009  ! 343: STDA_R	stda	%r28, [%r8 + %r9] 0x80
	.word 0xbc4a0009  ! 344: MULX_R	mulx 	%r8, %r9, %r30
	.word 0xc3ea2c98  ! 345: PREFETCHA_I	prefetcha	[%r8, + 0x0c98] %asi, #one_read
	.word 0xce5a0009  ! 346: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0x8d6a0009  ! 348: SDIVX_R	sdivx	%r8, %r9, %r6
	.word 0x8a5a0009  ! 349: SMUL_R	smul 	%r8, %r9, %r5
	.word 0xb25a0009  ! 350: SMUL_R	smul 	%r8, %r9, %r25
	.word 0x87a20929  ! 351: FMULs	fmuls	%f8, %f9, %f3
	.word 0xcef21009  ! 353: STXA_R	stxa	%r7, [%r8 + %r9] 0x80
	.word 0xc7220009  ! 354: STF_R	st	%f3, [%r9, %r8]
	.word 0xc87a0009  ! 356: SWAP_R	swap	%r4, [%r8 + %r9]
	.word 0x87a20929  ! 357: FMULs	fmuls	%f8, %f9, %f3
	.word 0xccf21009  ! 358: STXA_R	stxa	%r6, [%r8 + %r9] 0x80
	.word 0x8e720009  ! 359: UDIV_R	udiv 	%r8, %r9, %r7
	.word 0x8143e03c  ! 360: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0x20800004  ! 361: BN	bn,a	<label_0x4>
	.word 0xae7a235c  ! 362: SDIV_I	sdiv 	%r8, 0x035c, %r23
	.word 0xc2821009  ! 363: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r1
	.word 0x866a0009  ! 364: UDIVX_R	udivx 	%r8, %r9, %r3
	.word 0x8b6a0009  ! 365: SDIVX_R	sdivx	%r8, %r9, %r5
	.word 0xcaaa1009  ! 366: STBA_R	stba	%r5, [%r8 + %r9] 0x80
	.word 0xc2522d10  ! 367: LDSH_I	ldsh	[%r8 + 0x0d10], %r1
	.word 0x86522390  ! 368: UMUL_I	umul 	%r8, 0x0390, %r3
	.word 0xc84a278c  ! 369: LDSB_I	ldsb	[%r8 + 0x078c], %r4
	.word 0xbda208a9  ! 370: FSUBs	fsubs	%f8, %f9, %f30
	.word 0x8143e031  ! 371: MEMBAR	membar	#LoadLoad | #Lookaside | #MemIssue 
	.word 0xc36a2cd4  ! 372: PREFETCH_I	prefetch	[%r8 + 0x0cd4], #one_read
	.word 0x8ba209a9  ! 373: FDIVs	fdivs	%f8, %f9, %f5
	.word 0xb2d20009  ! 374: UMULcc_R	umulcc 	%r8, %r9, %r25
	.word 0xb66a0009  ! 375: UDIVX_R	udivx 	%r8, %r9, %r27
	.word 0x0ec20004  ! 376: BRGEZ	brgez  ,nt	%8,<label_0x20004>
	.word 0x8e5a0009  ! 377: SMUL_R	smul 	%r8, %r9, %r7
	.word 0x88f223b0  ! 378: UDIVcc_I	udivcc 	%r8, 0x03b0, %r4
	.word 0x8143e074  ! 379: MEMBAR	membar	#LoadStore | #Lookaside | #MemIssue | #Sync 
	.word 0x04800008  ! 380: BLE	ble  	<label_0x8>
	.word 0xfc822f10  ! 381: LDUWA_I	lduwa	[%r8, + 0x0f10] %asi, %r30
	.word 0xc2020009  ! 382: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xd7f22009  ! 383: CASXA_R	casxa	[%r8]%asi, %r9, %r11
	.word 0x30800004  ! 384: BA	ba,a	<label_0x4>
	.word 0x2ec20004  ! 385: BRGEZ	brgez,a,nt	%8,<label_0x20004>
	.word 0x88720009  ! 386: UDIV_R	udiv 	%r8, %r9, %r4
	.word 0xc53a0009  ! 387: STDF_R	std	%f2, [%r9, %r8]
	.word 0xe2a21009  ! 388: STWA_R	stwa	%r17, [%r8 + %r9] 0x80
	.word 0x04800008  ! 389: BLE	ble  	<label_0x8>
	.word 0xce6a2758  ! 390: LDSTUB_I	ldstub	%r7, [%r8 + 0x0758]
	.word 0xc41a0009  ! 391: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xc89a2968  ! 392: LDDA_I	ldda	[%r8, + 0x0968] %asi, %r4
	.word 0xf4ca1009  ! 393: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r26
	.word 0xa9220009  ! 394: MULScc_R	mulscc 	%r8, %r9, %r20
	.word 0xdb3a0009  ! 395: STDF_R	std	%f13, [%r9, %r8]
	.word 0x1a800008  ! 396: BCC	bcc  	<label_0x8>
	.word 0x89a20929  ! 397: FMULs	fmuls	%f8, %f9, %f4
	.word 0x87a20829  ! 398: FADDs	fadds	%f8, %f9, %f3
	.word 0x8143e02c  ! 399: MEMBAR	membar	#LoadStore | #StoreStore | #MemIssue 
	.word 0x827a0009  ! 400: SDIV_R	sdiv 	%r8, %r9, %r1
	.word 0x40000004  ! 401: CALL	call	disp30_4
	.word 0xceb2237c  ! 402: STHA_I	stha	%r7, [%r8 + 0x037c] %asi
	.word 0xccb229e8  ! 403: STHA_I	stha	%r6, [%r8 + 0x09e8] %asi
	.word 0xc28a27e4  ! 404: LDUBA_I	lduba	[%r8, + 0x07e4] %asi, %r1
	.word 0xc9220009  ! 405: STF_R	st	%f4, [%r9, %r8]
	.word 0x3a800008  ! 406: BCC	bcc,a	<label_0x8>
	.word 0x8143c000  ! 407: STBAR	stbar
	.word 0xcac21009  ! 408: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r5
	.word 0x8afa0009  ! 409: SDIVcc_R	sdivcc 	%r8, %r9, %r5
	.word 0x24ca0004  ! 410: BRLEZ	brlez,a,pt	%8,<label_0xa0004>
	.word 0xa65a2204  ! 411: SMUL_I	smul 	%r8, 0x0204, %r19
	.word 0xccf21009  ! 412: STXA_R	stxa	%r6, [%r8 + %r9] 0x80
	.word 0x8fa208a9  ! 413: FSUBs	fsubs	%f8, %f9, %f7
	.word 0x83a20929  ! 414: FMULs	fmuls	%f8, %f9, %f1
	.word 0x2c800004  ! 415: BNEG	bneg,a	<label_0x4>
	.word 0xe2c22860  ! 416: LDSWA_I	ldswa	[%r8, + 0x0860] %asi, %r17
	.word 0xd4420009  ! 417: LDSW_R	ldsw	[%r8 + %r9], %r10
	.word 0x8e7a0009  ! 418: SDIV_R	sdiv 	%r8, %r9, %r7
	.word 0xcc6a0009  ! 419: LDSTUB_R	ldstub	%r6, [%r8 + %r9]
	.word 0xc36a292c  ! 420: PREFETCH_I	prefetch	[%r8 + 0x092c], #one_read
	.word 0x8da20829  ! 421: FADDs	fadds	%f8, %f9, %f6
	.word 0x8fa20929  ! 422: FMULs	fmuls	%f8, %f9, %f7
	.word 0xc6d21009  ! 423: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r3
	.word 0x986a0009  ! 424: UDIVX_R	udivx 	%r8, %r9, %r12
	.word 0xcb3a2010  ! 425: STDF_I	std	%f5, [0x0010, %r8]
	.word 0x845a0009  ! 426: SMUL_R	smul 	%r8, %r9, %r2
	.word 0x82d228c4  ! 427: UMULcc_I	umulcc 	%r8, 0x08c4, %r1
	.word 0xc2522b28  ! 428: LDSH_I	ldsh	[%r8 + 0x0b28], %r1
	.word 0xc25227c0  ! 429: LDSH_I	ldsh	[%r8 + 0x07c0], %r1
	.word 0xf3e22009  ! 430: CASA_R	casa	[%r8] %asi, %r9, %r25
	.word 0x844a2c9c  ! 431: MULX_I	mulx 	%r8, 0x0c9c, %r2
	.word 0xc6420009  ! 432: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xc24a0009  ! 433: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xca4229ec  ! 434: LDSW_I	ldsw	[%r8 + 0x09ec], %r5
	.word 0xe87a0009  ! 435: SWAP_R	swap	%r20, [%r8 + %r9]
	.word 0xd6b222a8  ! 436: STHA_I	stha	%r11, [%r8 + 0x02a8] %asi
	.word 0xcf3a2610  ! 437: STDF_I	std	%f7, [0x0610, %r8]
	.word 0xe27a0009  ! 438: SWAP_R	swap	%r17, [%r8 + %r9]
	.word 0xc3ea24e8  ! 439: PREFETCHA_I	prefetcha	[%r8, + 0x04e8] %asi, #one_read
	.word 0x04c20008  ! 441: BRLEZ	brlez  ,nt	%8,<label_0x20008>
	.word 0xca822128  ! 442: LDUWA_I	lduwa	[%r8, + 0x0128] %asi, %r5
	.word 0x8b6a2b98  ! 443: SDIVX_I	sdivx	%r8, 0x0b98, %r5
	.word 0xc8fa1009  ! 444: SWAPA_R	swapa	%r4, [%r8 + %r9] 0x80
	.word 0x94d20009  ! 445: UMULcc_R	umulcc 	%r8, %r9, %r10
	.word 0xf4822ea8  ! 446: LDUWA_I	lduwa	[%r8, + 0x0ea8] %asi, %r26
	.word 0xce420009  ! 447: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0x827a282c  ! 448: SDIV_I	sdiv 	%r8, 0x082c, %r1
	.word 0x8da208a9  ! 449: FSUBs	fsubs	%f8, %f9, %f6
	.word 0x8143e05c  ! 450: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0xcb222294  ! 451: STF_I	st	%f5, [0x0294, %r8]
	.word 0xc2aa1009  ! 452: STBA_R	stba	%r1, [%r8 + %r9] 0x80
	.word 0x8ba208a9  ! 453: FSUBs	fsubs	%f8, %f9, %f5
	.word 0x8cf22a14  ! 454: UDIVcc_I	udivcc 	%r8, 0x0a14, %r6
	.word 0x8143e035  ! 455: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside | #MemIssue 
	.word 0xc6821009  ! 456: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r3
	.word 0xc6b21009  ! 457: STHA_R	stha	%r3, [%r8 + %r9] 0x80
	.word 0xc3ea26f4  ! 458: PREFETCHA_I	prefetcha	[%r8, + 0x06f4] %asi, #one_read
	.word 0xe8aa1009  ! 459: STBA_R	stba	%r20, [%r8 + %r9] 0x80
	.word 0x87220009  ! 460: MULScc_R	mulscc 	%r8, %r9, %r3
	.word 0xde522284  ! 461: LDSH_I	ldsh	[%r8 + 0x0284], %r15
	.word 0x8143e018  ! 462: MEMBAR	membar	#StoreStore | #Lookaside 
	.word 0xca922704  ! 463: LDUHA_I	lduha	[%r8, + 0x0704] %asi, %r5
	.word 0x867a0009  ! 464: SDIV_R	sdiv 	%r8, %r9, %r3
	.word 0x16800004  ! 465: BGE	bge  	<label_0x4>
	.word 0xc48a2d34  ! 466: LDUBA_I	lduba	[%r8, + 0x0d34] %asi, %r2
	.word 0x9d2224b8  ! 467: MULScc_I	mulscc 	%r8, 0x04b8, %r14
	.word 0xc2522ec4  ! 468: LDSH_I	ldsh	[%r8 + 0x0ec4], %r1
	.word 0x8143c000  ! 469: STBAR	stbar
	.word 0xc8a21009  ! 470: STWA_R	stwa	%r4, [%r8 + %r9] 0x80
	.word 0x8143e010  ! 471: MEMBAR	membar	#Lookaside 
	.word 0xec1a0009  ! 472: LDD_R	ldd	[%r8 + %r9], %r22
	.word 0xcaa21009  ! 473: STWA_R	stwa	%r5, [%r8 + %r9] 0x80
	.word 0xc6122b70  ! 474: LDUH_I	lduh	[%r8 + 0x0b70], %r3
	.word 0x99a20929  ! 475: FMULs	fmuls	%f8, %f9, %f12
	.word 0xc20a2934  ! 476: LDUB_I	ldub	[%r8 + 0x0934], %r1
	.word 0x8c522720  ! 477: UMUL_I	umul 	%r8, 0x0720, %r6
	.word 0xed3a0009  ! 478: STDF_R	std	%f22, [%r9, %r8]
	.word 0x9c5a0009  ! 479: SMUL_R	smul 	%r8, %r9, %r14
	.word 0xb0f220d4  ! 480: UDIVcc_I	udivcc 	%r8, 0x00d4, %r24
	.word 0x0e800004  ! 481: BVS	bvs  	<label_0x4>
	.word 0xc2c227d0  ! 482: LDSWA_I	ldswa	[%r8, + 0x07d0] %asi, %r1
	.word 0xc2ca23c4  ! 483: LDSBA_I	ldsba	[%r8, + 0x03c4] %asi, %r1
	.word 0x24800008  ! 484: BLE	ble,a	<label_0x8>
	.word 0xceca239c  ! 485: LDSBA_I	ldsba	[%r8, + 0x039c] %asi, %r7
	.word 0xc2ca2008  ! 486: LDSBA_I	ldsba	[%r8, + 0x0008] %asi, %r1
	.word 0xc89221dc  ! 487: LDUHA_I	lduha	[%r8, + 0x01dc] %asi, %r4
	.word 0x0ac20004  ! 488: BRNZ	brnz  ,nt	%8,<label_0x20004>
	.word 0xe8aa2b98  ! 489: STBA_I	stba	%r20, [%r8 + 0x0b98] %asi
	.word 0x82722c00  ! 490: UDIV_I	udiv 	%r8, 0x0c00, %r1
	.word 0x0aca0008  ! 491: BRNZ	brnz  ,pt	%8,<label_0xa0008>
	.word 0xc47a299c  ! 492: SWAP_I	swap	%r2, [%r8 + 0x099c]
	.word 0xfcf223b0  ! 493: STXA_I	stxa	%r30, [%r8 + 0x03b0] %asi
	.word 0xc21224cc  ! 494: LDUH_I	lduh	[%r8 + 0x04cc], %r1
	.word 0xc9220009  ! 495: STF_R	st	%f4, [%r9, %r8]
	.word 0xa6f20009  ! 496: UDIVcc_R	udivcc 	%r8, %r9, %r19
	.word 0x22800004  ! 497: BE	be,a	<label_0x4>
	.word 0xce120009  ! 498: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0x1a800004  ! 499: BCC	bcc  	<label_0x4>
	.word 0x8143e06c  ! 500: MEMBAR	membar	#LoadStore | #StoreStore | #MemIssue | #Sync 
	.word 0xc3ea21f4  ! 501: PREFETCHA_I	prefetcha	[%r8, + 0x01f4] %asi, #one_read
	.word 0x8ba20929  ! 502: FMULs	fmuls	%f8, %f9, %f5
	.word 0x87a20929  ! 503: FMULs	fmuls	%f8, %f9, %f3
	.word 0x85222a14  ! 504: MULScc_I	mulscc 	%r8, 0x0a14, %r2
	.word 0x88520009  ! 505: UMUL_R	umul 	%r8, %r9, %r4
	.word 0xc67a211c  ! 506: SWAP_I	swap	%r3, [%r8 + 0x011c]
	.word 0xf4ea1009  ! 507: LDSTUBA_R	ldstuba	%r26, [%r8 + %r9] 0x80
	.word 0x836a0009  ! 508: SDIVX_R	sdivx	%r8, %r9, %r1
	.word 0x0c800004  ! 509: BNEG	bneg  	<label_0x4>
	.word 0x8ba20829  ! 510: FADDs	fadds	%f8, %f9, %f5
	.word 0xca921009  ! 511: LDUHA_R	lduha	[%r8, %r9] 0x80, %r5
	.word 0xc40a0009  ! 513: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0x8fa208a9  ! 514: FSUBs	fsubs	%f8, %f9, %f7
	.word 0xfaaa2204  ! 515: STBA_I	stba	%r29, [%r8 + 0x0204] %asi
	.word 0xc8120009  ! 516: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xe8ba1009  ! 517: STDA_R	stda	%r20, [%r8 + %r9] 0x80
	.word 0xcaa21009  ! 518: STWA_R	stwa	%r5, [%r8 + %r9] 0x80
	.word 0xc36a2590  ! 519: PREFETCH_I	prefetch	[%r8 + 0x0590], #one_read
	.word 0x8143c000  ! 520: STBAR	stbar
	.word 0xc41224e0  ! 521: LDUH_I	lduh	[%r8 + 0x04e0], %r2
	.word 0xc7e21009  ! 522: CASA_I	casa	[%r8] 0x80, %r9, %r3
	.word 0x86520009  ! 523: UMUL_R	umul 	%r8, %r9, %r3
	.word 0xa4720009  ! 524: UDIV_R	udiv 	%r8, %r9, %r18
	.word 0x82720009  ! 525: UDIV_R	udiv 	%r8, %r9, %r1
	.word 0xc33a0009  ! 526: STDF_R	std	%f1, [%r9, %r8]
	.word 0x8143c000  ! 527: STBAR	stbar
	.word 0xa16a2d5c  ! 529: SDIVX_I	sdivx	%r8, 0x0d5c, %r16
	.word 0xf4aa1009  ! 530: STBA_R	stba	%r26, [%r8 + %r9] 0x80
	.word 0xc6aa2b24  ! 531: STBA_I	stba	%r3, [%r8 + 0x0b24] %asi
	.word 0x8143c000  ! 532: STBAR	stbar
	.word 0xc4f22ad8  ! 533: STXA_I	stxa	%r2, [%r8 + 0x0ad8] %asi
	.word 0x8143c000  ! 534: STBAR	stbar
	.word 0xc3ea2458  ! 535: PREFETCHA_I	prefetcha	[%r8, + 0x0458] %asi, #one_read
	.word 0xe2ea23c4  ! 536: LDSTUBA_I	ldstuba	%r17, [%r8 + 0x03c4] %asi
	.word 0xb5a20829  ! 539: FADDs	fadds	%f8, %f9, %f26
	.word 0xac522608  ! 540: UMUL_I	umul 	%r8, 0x0608, %r22
	.word 0xe49a1009  ! 541: LDDA_R	ldda	[%r8, %r9] 0x80, %r18
	.word 0x87a20829  ! 542: FADDs	fadds	%f8, %f9, %f3
	.word 0xc45a0009  ! 543: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xc6f22f68  ! 544: STXA_I	stxa	%r3, [%r8 + 0x0f68] %asi
	.word 0x24ca0004  ! 545: BRLEZ	brlez,a,pt	%8,<label_0xa0004>
	.word 0xfa0a0009  ! 546: LDUB_R	ldub	[%r8 + %r9], %r29
	.word 0xccfa282c  ! 547: SWAPA_I	swapa	%r6, [%r8 + 0x082c] %asi
	.word 0x836a2674  ! 548: SDIVX_I	sdivx	%r8, 0x0674, %r1
	.word 0xf8ba1009  ! 549: STDA_R	stda	%r28, [%r8 + %r9] 0x80
	.word 0xcc4a2b20  ! 550: LDSB_I	ldsb	[%r8 + 0x0b20], %r6
	.word 0x88fa2994  ! 551: SDIVcc_I	sdivcc 	%r8, 0x0994, %r4
	.word 0xd6ea1009  ! 552: LDSTUBA_R	ldstuba	%r11, [%r8 + %r9] 0x80
	.word 0xf0f21009  ! 553: STXA_R	stxa	%r24, [%r8 + %r9] 0x80
	.word 0x96da2794  ! 554: SMULcc_I	smulcc 	%r8, 0x0794, %r11
	.word 0xed3a0009  ! 555: STDF_R	std	%f22, [%r9, %r8]
	.word 0xc4f220f8  ! 556: STXA_I	stxa	%r2, [%r8 + 0x00f8] %asi
	.word 0xae5a0009  ! 557: SMUL_R	smul 	%r8, %r9, %r23
	.word 0xa16a228c  ! 558: SDIVX_I	sdivx	%r8, 0x028c, %r16
	.word 0x84da2e04  ! 559: SMULcc_I	smulcc 	%r8, 0x0e04, %r2
	.word 0xe6ea1009  ! 560: LDSTUBA_R	ldstuba	%r19, [%r8 + %r9] 0x80
	.word 0xc47a0009  ! 561: SWAP_R	swap	%r2, [%r8 + %r9]
	.word 0xa7a20829  ! 562: FADDs	fadds	%f8, %f9, %f19
	.word 0x8143e058  ! 563: MEMBAR	membar	#StoreStore | #Lookaside | #Sync 
	.word 0x8143e041  ! 564: MEMBAR	membar	#LoadLoad | #Sync 
	.word 0xfc1a0009  ! 565: LDD_R	ldd	[%r8 + %r9], %r30
	.word 0xce0a2af8  ! 566: LDUB_I	ldub	[%r8 + 0x0af8], %r7
	.word 0xc3ea2b08  ! 567: PREFETCHA_I	prefetcha	[%r8, + 0x0b08] %asi, #one_read
	.word 0xc9222674  ! 568: STF_I	st	%f4, [0x0674, %r8]
	.word 0xccfa261c  ! 569: SWAPA_I	swapa	%r6, [%r8 + 0x061c] %asi
	.word 0xf8120009  ! 570: LDUH_R	lduh	[%r8 + %r9], %r28
	.word 0xdd2225e4  ! 571: STF_I	st	%f14, [0x05e4, %r8]
	.word 0xc53a2980  ! 572: STDF_I	std	%f2, [0x0980, %r8]
	.word 0xe8ba1009  ! 573: STDA_R	stda	%r20, [%r8 + %r9] 0x80
	.word 0xcec22ba0  ! 574: LDSWA_I	ldswa	[%r8, + 0x0ba0] %asi, %r7
	.word 0xfe0a2458  ! 575: LDUB_I	ldub	[%r8 + 0x0458], %r31
	.word 0xcb3a2810  ! 576: STDF_I	std	%f5, [0x0810, %r8]
	.word 0xe7220009  ! 577: STF_R	st	%f19, [%r9, %r8]
	.word 0x8ba20929  ! 578: FMULs	fmuls	%f8, %f9, %f5
	.word 0xcb222724  ! 579: STF_I	st	%f5, [0x0724, %r8]
	.word 0x8143c000  ! 580: STBAR	stbar
	.word 0x86722dc4  ! 581: UDIV_I	udiv 	%r8, 0x0dc4, %r3
	.word 0x8da208a9  ! 582: FSUBs	fsubs	%f8, %f9, %f6
	.word 0x9c5a0009  ! 583: SMUL_R	smul 	%r8, %r9, %r14
	.word 0x8143c000  ! 584: STBAR	stbar
	.word 0x40000004  ! 585: CALL	call	disp30_4
	.word 0x8ad22a64  ! 586: UMULcc_I	umulcc 	%r8, 0x0a64, %r5
	.word 0x8d220009  ! 587: MULScc_R	mulscc 	%r8, %r9, %r6
	.word 0xaefa0009  ! 588: SDIVcc_R	sdivcc 	%r8, %r9, %r23
	.word 0x8c4a0009  ! 589: MULX_R	mulx 	%r8, %r9, %r6
	.word 0xcd3a2f08  ! 590: STDF_I	std	%f6, [0x0f08, %r8]
	.word 0xccd21009  ! 591: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r6
	.word 0x844a0009  ! 592: MULX_R	mulx 	%r8, %r9, %r2
	.word 0xec522734  ! 593: LDSH_I	ldsh	[%r8 + 0x0734], %r22
	.word 0x836a0009  ! 594: SDIVX_R	sdivx	%r8, %r9, %r1
	.word 0xc36a23c8  ! 595: PREFETCH_I	prefetch	[%r8 + 0x03c8], #one_read
	.word 0xd48a2750  ! 596: LDUBA_I	lduba	[%r8, + 0x0750] %asi, %r10
	.word 0xbba20829  ! 597: FADDs	fadds	%f8, %f9, %f29
	.word 0xd46a271c  ! 598: LDSTUB_I	ldstub	%r10, [%r8 + 0x071c]
	.word 0x8143c000  ! 599: STBAR	stbar
	.word 0xd4a21009  ! 600: STWA_R	stwa	%r10, [%r8 + %r9] 0x80
	.word 0x9c720009  ! 601: UDIV_R	udiv 	%r8, %r9, %r14
	.word 0xd40a27d0  ! 602: LDUB_I	ldub	[%r8 + 0x07d0], %r10
	.word 0xc6522638  ! 603: LDSH_I	ldsh	[%r8 + 0x0638], %r3
	.word 0xdaaa1009  ! 604: STBA_R	stba	%r13, [%r8 + %r9] 0x80
	.word 0xaa52290c  ! 605: UMUL_I	umul 	%r8, 0x090c, %r21
	.word 0xc8122540  ! 606: LDUH_I	lduh	[%r8 + 0x0540], %r4
	.word 0xc8f21009  ! 607: STXA_R	stxa	%r4, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 608: STBAR	stbar
	.word 0xce821009  ! 609: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r7
	.word 0xe86a2178  ! 610: LDSTUB_I	ldstub	%r20, [%r8 + 0x0178]
	.word 0xc64a0009  ! 611: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xc40a28c4  ! 612: LDUB_I	ldub	[%r8 + 0x08c4], %r2
	.word 0x865a0009  ! 613: SMUL_R	smul 	%r8, %r9, %r3
	.word 0x8143e05b  ! 614: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Lookaside | #Sync 
	.word 0x96fa0009  ! 615: SDIVcc_R	sdivcc 	%r8, %r9, %r11
	.word 0x88da23c0  ! 616: SMULcc_I	smulcc 	%r8, 0x03c0, %r4
	.word 0xde821009  ! 617: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r15
	.word 0xc36a2380  ! 618: PREFETCH_I	prefetch	[%r8 + 0x0380], #one_read
	.word 0x99a20829  ! 619: FADDs	fadds	%f8, %f9, %f12
	.word 0xcc8a2b34  ! 620: LDUBA_I	lduba	[%r8, + 0x0b34] %asi, %r6
	.word 0x8fa208a9  ! 621: FSUBs	fsubs	%f8, %f9, %f7
	.word 0x887a0009  ! 622: SDIV_R	sdiv 	%r8, %r9, %r4
	.word 0xcc922c98  ! 623: LDUHA_I	lduha	[%r8, + 0x0c98] %asi, %r6
	.word 0x8143e050  ! 624: MEMBAR	membar	#Lookaside | #Sync 
	.word 0xc4b229a4  ! 625: STHA_I	stha	%r2, [%r8 + 0x09a4] %asi
	.word 0x2cc20008  ! 626: BRGZ	brgz,a,nt	%8,<label_0x20008>
	.word 0x8c4a2d2c  ! 627: MULX_I	mulx 	%r8, 0x0d2c, %r6
	.word 0xf8ea1009  ! 628: LDSTUBA_R	ldstuba	%r28, [%r8 + %r9] 0x80
	.word 0xe6122648  ! 629: LDUH_I	lduh	[%r8 + 0x0648], %r19
	.word 0xceb21009  ! 630: STHA_R	stha	%r7, [%r8 + %r9] 0x80
	.word 0xc4822230  ! 631: LDUWA_I	lduwa	[%r8, + 0x0230] %asi, %r2
	.word 0x0e800004  ! 632: BVS	bvs  	<label_0x4>
	.word 0x8143e013  ! 633: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside 
	.word 0x88520009  ! 634: UMUL_R	umul 	%r8, %r9, %r4
	.word 0x24800004  ! 635: BLE	ble,a	<label_0x4>
	.word 0xc8ca1009  ! 636: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r4
	.word 0xa6720009  ! 637: UDIV_R	udiv 	%r8, %r9, %r19
	.word 0xcc6a2ee8  ! 638: LDSTUB_I	ldstub	%r6, [%r8 + 0x0ee8]
	.word 0x8143c000  ! 639: STBAR	stbar
	.word 0xc36a20b8  ! 640: PREFETCH_I	prefetch	[%r8 + 0x00b8], #one_read
	.word 0xc4d21009  ! 641: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r2
	.word 0xcea22048  ! 642: STWA_I	stwa	%r7, [%r8 + 0x0048] %asi
	.word 0x20800004  ! 643: BN	bn,a	<label_0x4>
	.word 0xe2120009  ! 644: LDUH_R	lduh	[%r8 + %r9], %r17
	.word 0x9a520009  ! 646: UMUL_R	umul 	%r8, %r9, %r13
	.word 0xc6aa1009  ! 647: STBA_R	stba	%r3, [%r8 + %r9] 0x80
	.word 0xccca1009  ! 648: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r6
	.word 0x83a20829  ! 650: FADDs	fadds	%f8, %f9, %f1
	.word 0xe4fa2050  ! 651: SWAPA_I	swapa	%r18, [%r8 + 0x0050] %asi
	.word 0xca0a2750  ! 652: LDUB_I	ldub	[%r8 + 0x0750], %r5
	.word 0x97a20829  ! 653: FADDs	fadds	%f8, %f9, %f11
	.word 0xc65a2268  ! 654: LDX_I	ldx	[%r8 + 0x0268], %r3
	.word 0xc3ea2aac  ! 655: PREFETCHA_I	prefetcha	[%r8, + 0x0aac] %asi, #one_read
	.word 0xfc9a2340  ! 656: LDDA_I	ldda	[%r8, + 0x0340] %asi, %r30
	.word 0xf41a2138  ! 657: LDD_I	ldd	[%r8 + 0x0138], %r26
	.word 0xcbe22009  ! 658: CASA_R	casa	[%r8] %asi, %r9, %r5
	.word 0x872227d4  ! 659: MULScc_I	mulscc 	%r8, 0x07d4, %r3
	.word 0x3c800008  ! 660: BPOS	bpos,a	<label_0x8>
	.word 0x0ec20008  ! 661: BRGEZ	brgez  ,nt	%8,<label_0x20008>
	.word 0x30800008  ! 662: BA	ba,a	<label_0x8>
	.word 0x846a24a0  ! 663: UDIVX_I	udivx 	%r8, 0x04a0, %r2
	.word 0x12800004  ! 664: BNE	bne  	<label_0x4>
	.word 0x8143e03c  ! 665: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0x8ed20009  ! 666: UMULcc_R	umulcc 	%r8, %r9, %r7
	.word 0x88f20009  ! 667: UDIVcc_R	udivcc 	%r8, %r9, %r4
	.word 0x8efa0009  ! 668: SDIVcc_R	sdivcc 	%r8, %r9, %r7
	.word 0x2a800004  ! 669: BCS	bcs,a	<label_0x4>
	.word 0xc6d21009  ! 670: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r3
	.word 0x8f6a2520  ! 671: SDIVX_I	sdivx	%r8, 0x0520, %r7
	.word 0xfc1a2d58  ! 672: LDD_I	ldd	[%r8 + 0x0d58], %r30
	.word 0xab6a0009  ! 673: SDIVX_R	sdivx	%r8, %r9, %r21
	.word 0xdea21009  ! 674: STWA_R	stwa	%r15, [%r8 + %r9] 0x80
	.word 0x87a20929  ! 675: FMULs	fmuls	%f8, %f9, %f3
	.word 0xc89a1009  ! 676: LDDA_R	ldda	[%r8, %r9] 0x80, %r4
	.word 0xa4520009  ! 677: UMUL_R	umul 	%r8, %r9, %r18
	.word 0x8c6a2794  ! 678: UDIVX_I	udivx 	%r8, 0x0794, %r6
	.word 0xa76a2890  ! 679: SDIVX_I	sdivx	%r8, 0x0890, %r19
	.word 0x99a20829  ! 680: FADDs	fadds	%f8, %f9, %f12
	.word 0xc2da21b0  ! 681: LDXA_I	ldxa	[%r8, + 0x01b0] %asi, %r1
	.word 0x8143e00a  ! 682: MEMBAR	membar	#StoreLoad | #StoreStore 
	.word 0x1e800004  ! 683: BVC	bvc  	<label_0x4>
	.word 0xca522b8c  ! 684: LDSH_I	ldsh	[%r8 + 0x0b8c], %r5
	.word 0xcb3a2d90  ! 685: STDF_I	std	%f5, [0x0d90, %r8]
	.word 0xf4a21009  ! 686: STWA_R	stwa	%r26, [%r8 + %r9] 0x80
	.word 0xc36a2898  ! 687: PREFETCH_I	prefetch	[%r8 + 0x0898], #one_read
	.word 0x847223c8  ! 688: UDIV_I	udiv 	%r8, 0x03c8, %r2
	.word 0xf05a0009  ! 689: LDX_R	ldx	[%r8 + %r9], %r24
	.word 0xc25a0009  ! 690: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xc6ca23d8  ! 691: LDSBA_I	ldsba	[%r8, + 0x03d8] %asi, %r3
	.word 0xcc4a2364  ! 692: LDSB_I	ldsb	[%r8 + 0x0364], %r6
	.word 0x865221fc  ! 693: UMUL_I	umul 	%r8, 0x01fc, %r3
	.word 0xc8120009  ! 694: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0x8143c000  ! 695: STBAR	stbar
	.word 0xcad21009  ! 696: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r5
	.word 0x04c20004  ! 697: BRLEZ	brlez  ,nt	%8,<label_0x20004>
	.word 0x8143c000  ! 698: STBAR	stbar
	.word 0xc36a243c  ! 699: PREFETCH_I	prefetch	[%r8 + 0x043c], #one_read
	.word 0xac7a2734  ! 700: SDIV_I	sdiv 	%r8, 0x0734, %r22
	.word 0xaba209a9  ! 701: FDIVs	fdivs	%f8, %f9, %f21
	.word 0xf4ea1009  ! 703: LDSTUBA_R	ldstuba	%r26, [%r8 + %r9] 0x80
	.word 0xcad21009  ! 704: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r5
	.word 0x8fa20929  ! 705: FMULs	fmuls	%f8, %f9, %f7
	.word 0x9b222508  ! 706: MULScc_I	mulscc 	%r8, 0x0508, %r13
	.word 0x00800008  ! 707: BN	bn  	<label_0x8>
	.word 0x40000004  ! 708: CALL	call	disp30_4
	.word 0xfa520009  ! 710: LDSH_R	ldsh	[%r8 + %r9], %r29
	.word 0x8e7a2b1c  ! 711: SDIV_I	sdiv 	%r8, 0x0b1c, %r7
	.word 0x30800004  ! 712: BA	ba,a	<label_0x4>
	.word 0xc80a2a4c  ! 713: LDUB_I	ldub	[%r8 + 0x0a4c], %r4
	.word 0x38800004  ! 714: BGU	bgu,a	<label_0x4>
	.word 0xc41a0009  ! 715: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xcbe22009  ! 716: CASA_R	casa	[%r8] %asi, %r9, %r5
	.word 0x8143e072  ! 717: MEMBAR	membar	#StoreLoad | #Lookaside | #MemIssue | #Sync 
	.word 0x8143c000  ! 718: STBAR	stbar
	.word 0x83a209a9  ! 719: FDIVs	fdivs	%f8, %f9, %f1
	.word 0x8da20829  ! 720: FADDs	fadds	%f8, %f9, %f6
	.word 0x827a0009  ! 721: SDIV_R	sdiv 	%r8, %r9, %r1
	.word 0xc2420009  ! 722: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0x22800004  ! 723: BE	be,a	<label_0x4>
	.word 0xcaa21009  ! 724: STWA_R	stwa	%r5, [%r8 + %r9] 0x80
	.word 0xce120009  ! 725: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0x0cc20004  ! 726: BRGZ	brgz  ,nt	%8,<label_0x20004>
	.word 0xc68a1009  ! 727: LDUBA_R	lduba	[%r8, %r9] 0x80, %r3
	.word 0x8c522e60  ! 728: UMUL_I	umul 	%r8, 0x0e60, %r6
	.word 0xca120009  ! 729: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xddf22009  ! 730: CASXA_R	casxa	[%r8]%asi, %r9, %r14
	.word 0x8b6a0009  ! 731: SDIVX_R	sdivx	%r8, %r9, %r5
	.word 0x8143e06c  ! 732: MEMBAR	membar	#LoadStore | #StoreStore | #MemIssue | #Sync 
	.word 0x8a522994  ! 733: UMUL_I	umul 	%r8, 0x0994, %r5
	.word 0xc36a24e4  ! 734: PREFETCH_I	prefetch	[%r8 + 0x04e4], #one_read
	.word 0xacda270c  ! 735: SMULcc_I	smulcc 	%r8, 0x070c, %r22
	.word 0xb76a0009  ! 736: SDIVX_R	sdivx	%r8, %r9, %r27
	.word 0x83a20829  ! 737: FADDs	fadds	%f8, %f9, %f1
	.word 0xec7a2b84  ! 738: SWAP_I	swap	%r22, [%r8 + 0x0b84]
	.word 0xc47a252c  ! 739: SWAP_I	swap	%r2, [%r8 + 0x052c]
	.word 0x8cfa2ec0  ! 740: SDIVcc_I	sdivcc 	%r8, 0x0ec0, %r6
	.word 0xc85a0009  ! 741: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0x8143e023  ! 742: MEMBAR	membar	#LoadLoad | #StoreLoad | #MemIssue 
	.word 0x846a0009  ! 743: UDIVX_R	udivx 	%r8, %r9, %r2
	.word 0xcf3a0009  ! 744: STDF_R	std	%f7, [%r9, %r8]
	.word 0x8ad22638  ! 745: UMULcc_I	umulcc 	%r8, 0x0638, %r5
	.word 0x866a0009  ! 746: UDIVX_R	udivx 	%r8, %r9, %r3
	.word 0xc3ea2a58  ! 747: PREFETCHA_I	prefetcha	[%r8, + 0x0a58] %asi, #one_read
	.word 0xb76a0009  ! 748: SDIVX_R	sdivx	%r8, %r9, %r27
	.word 0x26ca0004  ! 749: BRLZ	brlz,a,pt	%8,<label_0xa0004>
	.word 0x3e800004  ! 750: BVC	bvc,a	<label_0x4>
	.word 0xaada0009  ! 751: SMULcc_R	smulcc 	%r8, %r9, %r21
	.word 0xcc120009  ! 752: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xd48a2ca0  ! 753: LDUBA_I	lduba	[%r8, + 0x0ca0] %asi, %r10
	.word 0xc8422c2c  ! 754: LDSW_I	ldsw	[%r8 + 0x0c2c], %r4
	.word 0xce7a0009  ! 756: SWAP_R	swap	%r7, [%r8 + %r9]
	.word 0xc86a2ed0  ! 757: LDSTUB_I	ldstub	%r4, [%r8 + 0x0ed0]
	.word 0xca020009  ! 759: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xc84a0009  ! 760: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xc3ea2c9c  ! 761: PREFETCHA_I	prefetcha	[%r8, + 0x0c9c] %asi, #one_read
	.word 0xdc420009  ! 762: LDSW_R	ldsw	[%r8 + %r9], %r14
	.word 0xcff22009  ! 763: CASXA_R	casxa	[%r8]%asi, %r9, %r7
	.word 0xc26a0009  ! 764: LDSTUB_R	ldstub	%r1, [%r8 + %r9]
	.word 0xb3a209a9  ! 765: FDIVs	fdivs	%f8, %f9, %f25
	.word 0xb6da2eb8  ! 767: SMULcc_I	smulcc 	%r8, 0x0eb8, %r27
	.word 0xc2f21009  ! 768: STXA_R	stxa	%r1, [%r8 + %r9] 0x80
	.word 0x0c800004  ! 769: BNEG	bneg  	<label_0x4>
	.word 0x86722fc4  ! 770: UDIV_I	udiv 	%r8, 0x0fc4, %r3
	.word 0xf2a22ed8  ! 773: STWA_I	stwa	%r25, [%r8 + 0x0ed8] %asi
	.word 0xcf3a2c28  ! 774: STDF_I	std	%f7, [0x0c28, %r8]
	.word 0xc53a0009  ! 776: STDF_R	std	%f2, [%r9, %r8]
	.word 0xe81a0009  ! 777: LDD_R	ldd	[%r8 + %r9], %r20
	.word 0xdada1009  ! 778: LDXA_R	ldxa	[%r8, %r9] 0x80, %r13
	.word 0xea7a2880  ! 779: SWAP_I	swap	%r21, [%r8 + 0x0880]
	.word 0xf13a0009  ! 780: STDF_R	std	%f24, [%r9, %r8]
	.word 0xf7220009  ! 781: STF_R	st	%f27, [%r9, %r8]
	.word 0xcc422c98  ! 782: LDSW_I	ldsw	[%r8 + 0x0c98], %r6
	.word 0xb7222a68  ! 783: MULScc_I	mulscc 	%r8, 0x0a68, %r27
	.word 0xccb22e88  ! 784: STHA_I	stha	%r6, [%r8 + 0x0e88] %asi
	.word 0xf682200c  ! 785: LDUWA_I	lduwa	[%r8, + 0x000c] %asi, %r27
	.word 0x8143c000  ! 786: STBAR	stbar
	.word 0x8143c000  ! 787: STBAR	stbar
	.word 0xcd220009  ! 788: STF_R	st	%f6, [%r9, %r8]
	.word 0x0ec20004  ! 789: BRGEZ	brgez  ,nt	%8,<label_0x20004>
	.word 0xceaa2534  ! 790: STBA_I	stba	%r7, [%r8 + 0x0534] %asi
	.word 0xc4ea1009  ! 791: LDSTUBA_R	ldstuba	%r2, [%r8 + %r9] 0x80
	.word 0xcc7a2c68  ! 792: SWAP_I	swap	%r6, [%r8 + 0x0c68]
	.word 0xbaf221e4  ! 793: UDIVcc_I	udivcc 	%r8, 0x01e4, %r29
	.word 0xc3ea2e5c  ! 794: PREFETCHA_I	prefetcha	[%r8, + 0x0e5c] %asi, #one_read
	.word 0x8143e02c  ! 795: MEMBAR	membar	#LoadStore | #StoreStore | #MemIssue 
	.word 0xccb22ee0  ! 796: STHA_I	stha	%r6, [%r8 + 0x0ee0] %asi
	.word 0xb7a209a9  ! 797: FDIVs	fdivs	%f8, %f9, %f27
	.word 0xd9f22009  ! 798: CASXA_R	casxa	[%r8]%asi, %r9, %r12
	.word 0x88da2e00  ! 799: SMULcc_I	smulcc 	%r8, 0x0e00, %r4
	.word 0xce8a26e8  ! 800: LDUBA_I	lduba	[%r8, + 0x06e8] %asi, %r7
	.word 0xc4b21009  ! 801: STHA_R	stha	%r2, [%r8 + %r9] 0x80
	.word 0xe65a0009  ! 803: LDX_R	ldx	[%r8 + %r9], %r19
	.word 0x12800004  ! 804: BNE	bne  	<label_0x4>
	.word 0xceca1009  ! 806: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r7
	.word 0x9e7a2764  ! 807: SDIV_I	sdiv 	%r8, 0x0764, %r15
	.word 0x8143c000  ! 808: STBAR	stbar
	.word 0xbeda297c  ! 809: SMULcc_I	smulcc 	%r8, 0x097c, %r31
	.word 0xcde21009  ! 810: CASA_I	casa	[%r8] 0x80, %r9, %r6
	.word 0xc7e22009  ! 811: CASA_R	casa	[%r8] %asi, %r9, %r3
	.word 0xc36a2940  ! 812: PREFETCH_I	prefetch	[%r8 + 0x0940], #one_read
	.word 0x8143c000  ! 813: STBAR	stbar
	.word 0x8143e025  ! 814: MEMBAR	membar	#LoadLoad | #LoadStore | #MemIssue 
	.word 0xe81a28a8  ! 816: LDD_I	ldd	[%r8 + 0x08a8], %r20
	.word 0xc48a2c68  ! 817: LDUBA_I	lduba	[%r8, + 0x0c68] %asi, %r2
	.word 0xc4420009  ! 818: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xcaa22a5c  ! 819: STWA_I	stwa	%r5, [%r8 + 0x0a5c] %asi
	.word 0xd44a0009  ! 820: LDSB_R	ldsb	[%r8 + %r9], %r10
	.word 0xf2ea1009  ! 821: LDSTUBA_R	ldstuba	%r25, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 822: STBAR	stbar
	.word 0xd8ba22a0  ! 823: STDA_I	stda	%r12, [%r8 + 0x02a0] %asi
	.word 0xdcb21009  ! 824: STHA_R	stha	%r14, [%r8 + %r9] 0x80
	.word 0x0c800008  ! 825: BNEG	bneg  	<label_0x8>
	.word 0xff2220d8  ! 826: STF_I	st	%f31, [0x00d8, %r8]
	.word 0xc4da2dc0  ! 827: LDXA_I	ldxa	[%r8, + 0x0dc0] %asi, %r2
	.word 0xc20228cc  ! 828: LDUW_I	lduw	[%r8 + 0x08cc], %r1
	.word 0x8e6a21a0  ! 829: UDIVX_I	udivx 	%r8, 0x01a0, %r7
	.word 0xc4122ca8  ! 830: LDUH_I	lduh	[%r8 + 0x0ca8], %r2
	.word 0xc93a0009  ! 831: STDF_R	std	%f4, [%r9, %r8]
	.word 0xf89a2ac8  ! 832: LDDA_I	ldda	[%r8, + 0x0ac8] %asi, %r28
	.word 0x95a208a9  ! 833: FSUBs	fsubs	%f8, %f9, %f10
	.word 0x8143e04d  ! 834: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Sync 
	.word 0xc8fa25a8  ! 835: SWAPA_I	swapa	%r4, [%r8 + 0x05a8] %asi
	.word 0xd6c21009  ! 836: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r11
	.word 0x96d20009  ! 837: UMULcc_R	umulcc 	%r8, %r9, %r11
	.word 0xe4ba1009  ! 838: STDA_R	stda	%r18, [%r8 + %r9] 0x80
	.word 0x8143e033  ! 839: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside | #MemIssue 
	.word 0x88520009  ! 840: UMUL_R	umul 	%r8, %r9, %r4
	.word 0xcaea2ca8  ! 841: LDSTUBA_I	ldstuba	%r5, [%r8 + 0x0ca8] %asi
	.word 0x8143e020  ! 842: MEMBAR	membar	#MemIssue 
	.word 0xd41a2350  ! 843: LDD_I	ldd	[%r8 + 0x0350], %r10
	.word 0x87a20829  ! 844: FADDs	fadds	%f8, %f9, %f3
	.word 0xc7e21009  ! 845: CASA_I	casa	[%r8] 0x80, %r9, %r3
	.word 0xb4da2370  ! 846: SMULcc_I	smulcc 	%r8, 0x0370, %r26
	.word 0xf09227c4  ! 847: LDUHA_I	lduha	[%r8, + 0x07c4] %asi, %r24
	.word 0xc4ba28c8  ! 848: STDA_I	stda	%r2, [%r8 + 0x08c8] %asi
	.word 0xc45a2ab8  ! 849: LDX_I	ldx	[%r8 + 0x0ab8], %r2
	.word 0xcc7a0009  ! 850: SWAP_R	swap	%r6, [%r8 + %r9]
	.word 0xc8a21009  ! 851: STWA_R	stwa	%r4, [%r8 + %r9] 0x80
	.word 0xc45a2e28  ! 852: LDX_I	ldx	[%r8 + 0x0e28], %r2
	.word 0x88da2084  ! 853: SMULcc_I	smulcc 	%r8, 0x0084, %r4
	.word 0x8143c000  ! 854: STBAR	stbar
	.word 0xc66a2388  ! 855: LDSTUB_I	ldstub	%r3, [%r8 + 0x0388]
	.word 0x40000004  ! 856: CALL	call	disp30_4
	.word 0xc36a214c  ! 857: PREFETCH_I	prefetch	[%r8 + 0x014c], #one_read
	.word 0xce821009  ! 858: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r7
	.word 0xdcfa25a0  ! 859: SWAPA_I	swapa	%r14, [%r8 + 0x05a0] %asi
	.word 0xceca1009  ! 860: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r7
	.word 0x30800008  ! 861: BA	ba,a	<label_0x8>
	.word 0xcada25d8  ! 862: LDXA_I	ldxa	[%r8, + 0x05d8] %asi, %r5
	.word 0xfcf22ca8  ! 863: STXA_I	stxa	%r30, [%r8 + 0x0ca8] %asi
	.word 0xc4a2289c  ! 864: STWA_I	stwa	%r2, [%r8 + 0x089c] %asi
	.word 0x8efa0009  ! 865: SDIVcc_R	sdivcc 	%r8, %r9, %r7
	.word 0xcca22324  ! 866: STWA_I	stwa	%r6, [%r8 + 0x0324] %asi
	.word 0x8143e040  ! 867: MEMBAR	membar	#Sync 
	.word 0xc4f21009  ! 868: STXA_R	stxa	%r2, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 869: STBAR	stbar
	.word 0x8143e03e  ! 870: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0xd7222d9c  ! 871: STF_I	st	%f11, [0x0d9c, %r8]
	.word 0xf8ba2e88  ! 872: STDA_I	stda	%r28, [%r8 + 0x0e88] %asi
	.word 0x8143c000  ! 873: STBAR	stbar
	.word 0xc3ea2fd0  ! 874: PREFETCHA_I	prefetcha	[%r8, + 0x0fd0] %asi, #one_read
	.word 0xe0ba1009  ! 875: STDA_R	stda	%r16, [%r8 + %r9] 0x80
	.word 0xf84a0009  ! 876: LDSB_R	ldsb	[%r8 + %r9], %r28
	.word 0xe0ea1009  ! 877: LDSTUBA_R	ldstuba	%r16, [%r8 + %r9] 0x80
	.word 0xf09a1009  ! 878: LDDA_R	ldda	[%r8, %r9] 0x80, %r24
	.word 0x896a2900  ! 879: SDIVX_I	sdivx	%r8, 0x0900, %r4
	.word 0xb56a0009  ! 880: SDIVX_R	sdivx	%r8, %r9, %r26
	.word 0x865228ec  ! 881: UMUL_I	umul 	%r8, 0x08ec, %r3
	.word 0x87a209a9  ! 882: FDIVs	fdivs	%f8, %f9, %f3
	.word 0xc73a25b0  ! 883: STDF_I	std	%f3, [0x05b0, %r8]
	.word 0xcde22009  ! 885: CASA_R	casa	[%r8] %asi, %r9, %r6
	.word 0xce7a2030  ! 886: SWAP_I	swap	%r7, [%r8 + 0x0030]
	.word 0xe48a1009  ! 887: LDUBA_R	lduba	[%r8, %r9] 0x80, %r18
	.word 0xe0522530  ! 888: LDSH_I	ldsh	[%r8 + 0x0530], %r16
	.word 0xb24a20e8  ! 889: MULX_I	mulx 	%r8, 0x00e8, %r25
	.word 0xc36a246c  ! 890: PREFETCH_I	prefetch	[%r8 + 0x046c], #one_read
	.word 0xccea1009  ! 891: LDSTUBA_R	ldstuba	%r6, [%r8 + %r9] 0x80
	.word 0x82d20009  ! 893: UMULcc_R	umulcc 	%r8, %r9, %r1
	.word 0xcc522fbc  ! 894: LDSH_I	ldsh	[%r8 + 0x0fbc], %r6
	.word 0x8143e04b  ! 895: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Sync 
	.word 0x89a20929  ! 896: FMULs	fmuls	%f8, %f9, %f4
	.word 0x8143e04c  ! 897: MEMBAR	membar	#LoadStore | #StoreStore | #Sync 
	.word 0xe73a2710  ! 898: STDF_I	std	%f19, [0x0710, %r8]
	.word 0xfa120009  ! 899: LDUH_R	lduh	[%r8 + %r9], %r29
	.word 0xdad22d18  ! 900: LDSHA_I	ldsha	[%r8, + 0x0d18] %asi, %r13
	.word 0xc84222e4  ! 901: LDSW_I	ldsw	[%r8 + 0x02e4], %r4
	.word 0xca821009  ! 902: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r5
	.word 0x26800004  ! 903: BL	bl,a	<label_0x4>
	.word 0xc20a2618  ! 904: LDUB_I	ldub	[%r8 + 0x0618], %r1
	.word 0x24800008  ! 905: BLE	ble,a	<label_0x8>
	.word 0xc47a2738  ! 906: SWAP_I	swap	%r2, [%r8 + 0x0738]
	.word 0xca921009  ! 907: LDUHA_R	lduha	[%r8, %r9] 0x80, %r5
	.word 0xce6a0009  ! 908: LDSTUB_R	ldstub	%r7, [%r8 + %r9]
	.word 0xc93a0009  ! 909: STDF_R	std	%f4, [%r9, %r8]
	.word 0x8e6a2ea4  ! 910: UDIVX_I	udivx 	%r8, 0x0ea4, %r7
	.word 0xe86a2438  ! 911: LDSTUB_I	ldstub	%r20, [%r8 + 0x0438]
	.word 0xccc22138  ! 912: LDSWA_I	ldswa	[%r8, + 0x0138] %asi, %r6
	.word 0xa0522c00  ! 913: UMUL_I	umul 	%r8, 0x0c00, %r16
	.word 0xc6420009  ! 914: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xcc0a2f88  ! 915: LDUB_I	ldub	[%r8 + 0x0f88], %r6
	.word 0xda022ad8  ! 916: LDUW_I	lduw	[%r8 + 0x0ad8], %r13
	.word 0x8143c000  ! 917: STBAR	stbar
	.word 0xc802278c  ! 918: LDUW_I	lduw	[%r8 + 0x078c], %r4
	.word 0x3e800008  ! 919: BVC	bvc,a	<label_0x8>
	.word 0xb3a209a9  ! 920: FDIVs	fdivs	%f8, %f9, %f25
	.word 0x8143e035  ! 921: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside | #MemIssue 
	.word 0xc36a22bc  ! 922: PREFETCH_I	prefetch	[%r8 + 0x02bc], #one_read
	.word 0x89a20929  ! 923: FMULs	fmuls	%f8, %f9, %f4
	.word 0xf7e22009  ! 924: CASA_R	casa	[%r8] %asi, %r9, %r27
	.word 0xc8fa24fc  ! 925: SWAPA_I	swapa	%r4, [%r8 + 0x04fc] %asi
	.word 0x26c20004  ! 927: BRLZ	brlz,a,nt	%8,<label_0x20004>
	.word 0x88d22194  ! 928: UMULcc_I	umulcc 	%r8, 0x0194, %r4
	.word 0xc6522c94  ! 929: LDSH_I	ldsh	[%r8 + 0x0c94], %r3
	.word 0x8143c000  ! 930: STBAR	stbar
	.word 0x1e800004  ! 931: BVC	bvc  	<label_0x4>
	.word 0xaa6a2fc8  ! 932: UDIVX_I	udivx 	%r8, 0x0fc8, %r21
	.word 0xaada0009  ! 933: SMULcc_R	smulcc 	%r8, %r9, %r21
	.word 0x84fa0009  ! 935: SDIVcc_R	sdivcc 	%r8, %r9, %r2
	.word 0x10800008  ! 936: BA	ba  	<label_0x8>
	.word 0xc3f21009  ! 937: CASXA_I	casxa	[%r8] 0x80, %r9, %r1
	.word 0xaa5a0009  ! 938: SMUL_R	smul 	%r8, %r9, %r21
	.word 0xc8c21009  ! 939: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r4
	.word 0xecba1009  ! 940: STDA_R	stda	%r22, [%r8 + %r9] 0x80
	.word 0x87220009  ! 941: MULScc_R	mulscc 	%r8, %r9, %r3
	.word 0x2cca0004  ! 942: BRGZ	brgz,a,pt	%8,<label_0xa0004>
	.word 0xc65a2560  ! 943: LDX_I	ldx	[%r8 + 0x0560], %r3
	.word 0x38800004  ! 944: BGU	bgu,a	<label_0x4>
	.word 0xb8fa2260  ! 945: SDIVcc_I	sdivcc 	%r8, 0x0260, %r28
	.word 0xc49a21b8  ! 946: LDDA_I	ldda	[%r8, + 0x01b8] %asi, %r2
	.word 0xc8522850  ! 947: LDSH_I	ldsh	[%r8 + 0x0850], %r4
	.word 0xea822a54  ! 948: LDUWA_I	lduwa	[%r8, + 0x0a54] %asi, %r21
	.word 0xfd2222c0  ! 949: STF_I	st	%f30, [0x02c0, %r8]
	.word 0x24c20004  ! 950: BRLEZ	brlez,a,nt	%8,<label_0x20004>
	.word 0x8143c000  ! 951: STBAR	stbar
	.word 0x1e800008  ! 952: BVC	bvc  	<label_0x8>
	.word 0xc33a0009  ! 953: STDF_R	std	%f1, [%r9, %r8]
	.word 0x8a520009  ! 954: UMUL_R	umul 	%r8, %r9, %r5
	.word 0x8ba20929  ! 955: FMULs	fmuls	%f8, %f9, %f5
	.word 0x8c5a0009  ! 956: SMUL_R	smul 	%r8, %r9, %r6
	.word 0xce7a0009  ! 957: SWAP_R	swap	%r7, [%r8 + %r9]
	.word 0x88f20009  ! 958: UDIVcc_R	udivcc 	%r8, %r9, %r4
	.word 0xc9f22009  ! 959: CASXA_R	casxa	[%r8]%asi, %r9, %r4
	.word 0xc2d21009  ! 960: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r1
	.word 0xca4a0009  ! 961: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0x87a20929  ! 962: FMULs	fmuls	%f8, %f9, %f3
	.word 0xc72228fc  ! 963: STF_I	st	%f3, [0x08fc, %r8]
	.word 0x8143c000  ! 964: STBAR	stbar
	.word 0xb04a2b50  ! 965: MULX_I	mulx 	%r8, 0x0b50, %r24
	.word 0xc3ea2c40  ! 966: PREFETCHA_I	prefetcha	[%r8, + 0x0c40] %asi, #one_read
	.word 0x884a0009  ! 967: MULX_R	mulx 	%r8, %r9, %r4
	.word 0xd4aa1009  ! 968: STBA_R	stba	%r10, [%r8 + %r9] 0x80
	.word 0xc3220009  ! 969: STF_R	st	%f1, [%r9, %r8]
	.word 0xc9222d34  ! 971: STF_I	st	%f4, [0x0d34, %r8]
	.word 0xe8b21009  ! 972: STHA_R	stha	%r20, [%r8 + %r9] 0x80
	.word 0xe0d22300  ! 973: LDSHA_I	ldsha	[%r8, + 0x0300] %asi, %r16
	.word 0x87a20929  ! 974: FMULs	fmuls	%f8, %f9, %f3
	.word 0xcada2288  ! 975: LDXA_I	ldxa	[%r8, + 0x0288] %asi, %r5
	.word 0xf2d21009  ! 976: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r25
	.word 0x8143e047  ! 978: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Sync 
	.word 0x8143c000  ! 980: STBAR	stbar
	.word 0xc2a22b5c  ! 981: STWA_I	stwa	%r1, [%r8 + 0x0b5c] %asi
	.word 0xc2a21009  ! 982: STWA_R	stwa	%r1, [%r8 + %r9] 0x80
	.word 0x97a20929  ! 983: FMULs	fmuls	%f8, %f9, %f11
	.word 0xd6b21009  ! 984: STHA_R	stha	%r11, [%r8 + %r9] 0x80
	.word 0x886a0009  ! 985: UDIVX_R	udivx 	%r8, %r9, %r4
	.word 0x844a28f8  ! 986: MULX_I	mulx 	%r8, 0x08f8, %r2
	.word 0x1c800004  ! 987: BPOS	bpos  	<label_0x4>
	.word 0xcc4a2334  ! 988: LDSB_I	ldsb	[%r8 + 0x0334], %r6
	.word 0x836a2304  ! 989: SDIVX_I	sdivx	%r8, 0x0304, %r1
	.word 0x04800008  ! 990: BLE	ble  	<label_0x8>
	.word 0xce8a1009  ! 991: LDUBA_R	lduba	[%r8, %r9] 0x80, %r7
	.word 0x87a208a9  ! 992: FSUBs	fsubs	%f8, %f9, %f3
	.word 0x3e800008  ! 993: BVC	bvc,a	<label_0x8>
	.word 0xcfe21009  ! 994: CASA_I	casa	[%r8] 0x80, %r9, %r7
	.word 0x8143e015  ! 995: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside 
	.word 0xdec21009  ! 996: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r15
	.word 0x1a800008  ! 997: BCC	bcc  	<label_0x8>
	.word 0x8af20009  ! 998: UDIVcc_R	udivcc 	%r8, %r9, %r5
	.word 0xc8420009  ! 999: LDSW_R	ldsw	[%r8 + %r9], %r4
	nop
	nop
	nop
	nop
        ta      T_GOOD_TRAP

th_main_2:
        setx  MAIN_BASE_DATA_VA, %r1, %r8
        setx  0x0000000000000cd0, %g1, %r9
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
        setx  0x33cb1f8071b35edd, %g1, %r0
        setx  0x0e7be789803b417d, %g1, %r1
        setx  0xabbb9abb30f87365, %g1, %r2
        setx  0xf5173615be6aa16b, %g1, %r3
        setx  0x3e1972bb81f947ed, %g1, %r4
        setx  0x0ce424f01bf1cc9a, %g1, %r5
        setx  0xbed8146078ec9fd6, %g1, %r6
        setx  0xf14435afa650f3e7, %g1, %r7
        setx  0x512afbef9f84b85d, %g1, %r10
        setx  0x4dda27e7eaf993f0, %g1, %r11
        setx  0x35e864adf825efd8, %g1, %r12
        setx  0x7fbf90e045c1c6c7, %g1, %r13
        setx  0xf59ae8315f732b5b, %g1, %r14
        setx  0x0f260f41bb4347f6, %g1, %r15
        setx  0x33da9c182dae6f2c, %g1, %r16
        setx  0xd874ff50228eed2f, %g1, %r17
        setx  0x90a69c931d2e2cb5, %g1, %r18
        setx  0x635256e70ff82306, %g1, %r19
        setx  0x4841c6397d6fef8e, %g1, %r20
        setx  0x68bf0a73d4ec0390, %g1, %r21
        setx  0x24dd5d4cf89898df, %g1, %r22
        setx  0x99c5fcee338013cc, %g1, %r23
        setx  0x39ff43ba58de4606, %g1, %r24
        setx  0x1b75e36aa91f41d4, %g1, %r25
        setx  0x8b12ae0472bd77a8, %g1, %r26
        setx  0xb3ad64edf1bf18d5, %g1, %r27
        setx  0x958c3aba462efe68, %g1, %r28
        setx  0x86749a78c0cece3b, %g1, %r29
        setx  0xda0797d315021593, %g1, %r30
        setx  0xf7182f59d1386a36, %g1, %r31
	.word 0xc6921009  ! 6: LDUHA_R	lduha	[%r8, %r9] 0x80, %r3
	.word 0xc85a0009  ! 7: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xc2d220a0  ! 8: LDSHA_I	ldsha	[%r8, + 0x00a0] %asi, %r1
	.word 0x8143c000  ! 9: STBAR	stbar
	.word 0xce522cdc  ! 10: LDSH_I	ldsh	[%r8 + 0x0cdc], %r7
	.word 0x865a20e8  ! 11: SMUL_I	smul 	%r8, 0x00e8, %r3
	.word 0xfaca2e98  ! 12: LDSBA_I	ldsba	[%r8, + 0x0e98] %asi, %r29
	.word 0xaf220009  ! 13: MULScc_R	mulscc 	%r8, %r9, %r23
	.word 0x22c20004  ! 14: BRZ	brz,a,nt	%8,<label_0x20004>
	.word 0x826a2e24  ! 15: UDIVX_I	udivx 	%r8, 0x0e24, %r1
	.word 0x8c4a0009  ! 16: MULX_R	mulx 	%r8, %r9, %r6
	.word 0xfe5a2190  ! 17: LDX_I	ldx	[%r8 + 0x0190], %r31
	.word 0xcc5a2d90  ! 18: LDX_I	ldx	[%r8 + 0x0d90], %r6
	.word 0xd8aa2c8c  ! 19: STBA_I	stba	%r12, [%r8 + 0x0c8c] %asi
	.word 0x847a0009  ! 20: SDIV_R	sdiv 	%r8, %r9, %r2
	.word 0x8143c000  ! 21: STBAR	stbar
	.word 0xe6a22850  ! 22: STWA_I	stwa	%r19, [%r8 + 0x0850] %asi
	.word 0xcafa2dc8  ! 23: SWAPA_I	swapa	%r5, [%r8 + 0x0dc8] %asi
	.word 0xbc720009  ! 24: UDIV_R	udiv 	%r8, %r9, %r30
	.word 0x26800008  ! 25: BL	bl,a	<label_0x8>
	.word 0xcaaa24c0  ! 26: STBA_I	stba	%r5, [%r8 + 0x04c0] %asi
	.word 0xc36a2158  ! 27: PREFETCH_I	prefetch	[%r8 + 0x0158], #one_read
	.word 0x8cfa2354  ! 28: SDIVcc_I	sdivcc 	%r8, 0x0354, %r6
	.word 0x8143c000  ! 29: STBAR	stbar
	.word 0x86fa0009  ! 30: SDIVcc_R	sdivcc 	%r8, %r9, %r3
	.word 0xdcba2d60  ! 31: STDA_I	stda	%r14, [%r8 + 0x0d60] %asi
	.word 0x0c800008  ! 32: BNEG	bneg  	<label_0x8>
	.word 0x8143e01d  ! 33: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside 
	.word 0xb3a208a9  ! 34: FSUBs	fsubs	%f8, %f9, %f25
	.word 0x2c800004  ! 35: BNEG	bneg,a	<label_0x4>
	.word 0xcd3a0009  ! 36: STDF_R	std	%f6, [%r9, %r8]
	.word 0x84720009  ! 37: UDIV_R	udiv 	%r8, %r9, %r2
	.word 0xee7a0009  ! 38: SWAP_R	swap	%r23, [%r8 + %r9]
	.word 0x8e5a2dc0  ! 39: SMUL_I	smul 	%r8, 0x0dc0, %r7
	.word 0x8c4a0009  ! 40: MULX_R	mulx 	%r8, %r9, %r6
	.word 0xa9a208a9  ! 41: FSUBs	fsubs	%f8, %f9, %f20
	.word 0x30800004  ! 42: BA	ba,a	<label_0x4>
	.word 0xc3ea2ce0  ! 43: PREFETCHA_I	prefetcha	[%r8, + 0x0ce0] %asi, #one_read
	.word 0xc4ca1009  ! 44: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r2
	.word 0x88d20009  ! 45: UMULcc_R	umulcc 	%r8, %r9, %r4
	.word 0x8143c000  ! 46: STBAR	stbar
	.word 0x866a213c  ! 47: UDIVX_I	udivx 	%r8, 0x013c, %r3
	.word 0xc2520009  ! 48: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xc6ea1009  ! 49: LDSTUBA_R	ldstuba	%r3, [%r8 + %r9] 0x80
	.word 0x8143e06e  ! 50: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #MemIssue | #Sync 
	.word 0x88f227e0  ! 51: UDIVcc_I	udivcc 	%r8, 0x07e0, %r4
	.word 0x8143c000  ! 52: STBAR	stbar
	.word 0x36800004  ! 53: BGE	bge,a	<label_0x4>
	.word 0x8143e025  ! 54: MEMBAR	membar	#LoadLoad | #LoadStore | #MemIssue 
	.word 0x8143e02c  ! 55: MEMBAR	membar	#LoadStore | #StoreStore | #MemIssue 
	.word 0x864a2264  ! 56: MULX_I	mulx 	%r8, 0x0264, %r3
	.word 0xc4ca2c34  ! 57: LDSBA_I	ldsba	[%r8, + 0x0c34] %asi, %r2
	.word 0x1a800004  ! 58: BCC	bcc  	<label_0x4>
	.word 0xc6a21009  ! 59: STWA_R	stwa	%r3, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 60: STBAR	stbar
	.word 0xf5220009  ! 61: STF_R	st	%f26, [%r9, %r8]
	.word 0x96520009  ! 62: UMUL_R	umul 	%r8, %r9, %r11
	.word 0xcd222eb4  ! 63: STF_I	st	%f6, [0x0eb4, %r8]
	.word 0x38800004  ! 64: BGU	bgu,a	<label_0x4>
	.word 0x94520009  ! 65: UMUL_R	umul 	%r8, %r9, %r10
	.word 0x96720009  ! 66: UDIV_R	udiv 	%r8, %r9, %r11
	.word 0xc87a2ca4  ! 67: SWAP_I	swap	%r4, [%r8 + 0x0ca4]
	.word 0x95a208a9  ! 68: FSUBs	fsubs	%f8, %f9, %f10
	.word 0x8cf20009  ! 69: UDIVcc_R	udivcc 	%r8, %r9, %r6
	.word 0xa4fa0009  ! 70: SDIVcc_R	sdivcc 	%r8, %r9, %r18
	.word 0xc2d21009  ! 71: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r1
	.word 0x2c800004  ! 72: BNEG	bneg,a	<label_0x4>
	.word 0xfc4a2568  ! 73: LDSB_I	ldsb	[%r8 + 0x0568], %r30
	.word 0x12800004  ! 74: BNE	bne  	<label_0x4>
	.word 0xc36a2ac4  ! 75: PREFETCH_I	prefetch	[%r8 + 0x0ac4], #one_read
	.word 0x8143e024  ! 76: MEMBAR	membar	#LoadStore | #MemIssue 
	.word 0x32800004  ! 77: BNE	bne,a	<label_0x4>
	.word 0xfeb22754  ! 78: STHA_I	stha	%r31, [%r8 + 0x0754] %asi
	.word 0x8143e03f  ! 79: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0x08800004  ! 81: BLEU	bleu  	<label_0x4>
	.word 0xc4f21009  ! 83: STXA_R	stxa	%r2, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 84: STBAR	stbar
	.word 0xfbe21009  ! 85: CASA_I	casa	[%r8] 0x80, %r9, %r29
	.word 0xcaa21009  ! 86: STWA_R	stwa	%r5, [%r8 + %r9] 0x80
	.word 0xd49a1009  ! 88: LDDA_R	ldda	[%r8, %r9] 0x80, %r10
	.word 0xc5f22009  ! 90: CASXA_R	casxa	[%r8]%asi, %r9, %r2
	.word 0x26ca0008  ! 91: BRLZ	brlz,a,pt	%8,<label_0xa0008>
	.word 0xf8c22324  ! 92: LDSWA_I	ldswa	[%r8, + 0x0324] %asi, %r28
	.word 0xc3ea2754  ! 93: PREFETCHA_I	prefetcha	[%r8, + 0x0754] %asi, #one_read
	.word 0xc6aa1009  ! 94: STBA_R	stba	%r3, [%r8 + %r9] 0x80
	.word 0x827a23c0  ! 95: SDIV_I	sdiv 	%r8, 0x03c0, %r1
	.word 0xe8ca25c4  ! 96: LDSBA_I	ldsba	[%r8, + 0x05c4] %asi, %r20
	.word 0xc60a0009  ! 97: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xce120009  ! 98: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0x8e4a0009  ! 99: MULX_R	mulx 	%r8, %r9, %r7
	.word 0xca4a0009  ! 100: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0x8143e033  ! 101: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside | #MemIssue 
	.word 0xb87a0009  ! 102: SDIV_R	sdiv 	%r8, %r9, %r28
	.word 0xcaea1009  ! 103: LDSTUBA_R	ldstuba	%r5, [%r8 + %r9] 0x80
	.word 0xce120009  ! 105: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0x8143c000  ! 106: STBAR	stbar
	.word 0x8ba20829  ! 107: FADDs	fadds	%f8, %f9, %f5
	.word 0xfec21009  ! 108: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r31
	.word 0x8ba20829  ! 109: FADDs	fadds	%f8, %f9, %f5
	.word 0xf2c21009  ! 110: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r25
	.word 0xc8a225c4  ! 111: STWA_I	stwa	%r4, [%r8 + 0x05c4] %asi
	.word 0x83a209a9  ! 112: FDIVs	fdivs	%f8, %f9, %f1
	.word 0x9f6a2fe0  ! 113: SDIVX_I	sdivx	%r8, 0x0fe0, %r15
	.word 0x9a4a0009  ! 114: MULX_R	mulx 	%r8, %r9, %r13
	.word 0x8ef20009  ! 115: UDIVcc_R	udivcc 	%r8, %r9, %r7
	.word 0xcb3a0009  ! 116: STDF_R	std	%f5, [%r9, %r8]
	.word 0x827a24c8  ! 117: SDIV_I	sdiv 	%r8, 0x04c8, %r1
	.word 0x22c20008  ! 118: BRZ	brz,a,nt	%8,<label_0x20008>
	.word 0x88fa2f2c  ! 119: SDIVcc_I	sdivcc 	%r8, 0x0f2c, %r4
	.word 0xe89a1009  ! 120: LDDA_R	ldda	[%r8, %r9] 0x80, %r20
	.word 0xa27225fc  ! 121: UDIV_I	udiv 	%r8, 0x05fc, %r17
	.word 0xf8d21009  ! 122: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r28
	.word 0xceb21009  ! 123: STHA_R	stha	%r7, [%r8 + %r9] 0x80
	.word 0xf26a2514  ! 124: LDSTUB_I	ldstub	%r25, [%r8 + 0x0514]
	.word 0xfc9a1009  ! 125: LDDA_R	ldda	[%r8, %r9] 0x80, %r30
	.word 0x36800004  ! 126: BGE	bge,a	<label_0x4>
	.word 0xc65a2870  ! 127: LDX_I	ldx	[%r8 + 0x0870], %r3
	.word 0x8143e055  ! 128: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside | #Sync 
	.word 0xc3ea2334  ! 129: PREFETCHA_I	prefetcha	[%r8, + 0x0334] %asi, #one_read
	.word 0xc4f22df8  ! 130: STXA_I	stxa	%r2, [%r8 + 0x0df8] %asi
	.word 0xc8922520  ! 131: LDUHA_I	lduha	[%r8, + 0x0520] %asi, %r4
	.word 0x8fa20929  ! 132: FMULs	fmuls	%f8, %f9, %f7
	.word 0xfa520009  ! 133: LDSH_R	ldsh	[%r8 + %r9], %r29
	.word 0xe0ba2398  ! 134: STDA_I	stda	%r16, [%r8 + 0x0398] %asi
	.word 0xcd2228dc  ! 135: STF_I	st	%f6, [0x08dc, %r8]
	.word 0xf4ba1009  ! 136: STDA_R	stda	%r26, [%r8 + %r9] 0x80
	.word 0xe2020009  ! 137: LDUW_R	lduw	[%r8 + %r9], %r17
	.word 0x8f220009  ! 138: MULScc_R	mulscc 	%r8, %r9, %r7
	.word 0xcc122684  ! 139: LDUH_I	lduh	[%r8 + 0x0684], %r6
	.word 0x8143e00a  ! 140: MEMBAR	membar	#StoreLoad | #StoreStore 
	.word 0xd402269c  ! 141: LDUW_I	lduw	[%r8 + 0x069c], %r10
	.word 0xc65a2578  ! 142: LDX_I	ldx	[%r8 + 0x0578], %r3
	.word 0xc36a2a34  ! 143: PREFETCH_I	prefetch	[%r8 + 0x0a34], #one_read
	.word 0xc5220009  ! 144: STF_R	st	%f2, [%r9, %r8]
	.word 0x8143e01f  ! 145: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #Lookaside 
	.word 0xe4ba1009  ! 146: STDA_R	stda	%r18, [%r8 + %r9] 0x80
	.word 0x0e800008  ! 147: BVS	bvs  	<label_0x8>
	.word 0x844a0009  ! 148: MULX_R	mulx 	%r8, %r9, %r2
	.word 0x8a7a2904  ! 150: SDIV_I	sdiv 	%r8, 0x0904, %r5
	.word 0xf0ba22d8  ! 151: STDA_I	stda	%r24, [%r8 + 0x02d8] %asi
	.word 0x844a0009  ! 152: MULX_R	mulx 	%r8, %r9, %r2
	.word 0x82f22e00  ! 153: UDIVcc_I	udivcc 	%r8, 0x0e00, %r1
	.word 0xe80a22e4  ! 154: LDUB_I	ldub	[%r8 + 0x02e4], %r20
	.word 0xc41223e0  ! 155: LDUH_I	lduh	[%r8 + 0x03e0], %r2
	.word 0x8143e07c  ! 156: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0x12800004  ! 157: BNE	bne  	<label_0x4>
	.word 0x8fa20829  ! 158: FADDs	fadds	%f8, %f9, %f7
	.word 0xcbe21009  ! 159: CASA_I	casa	[%r8] 0x80, %r9, %r5
	.word 0x22ca0004  ! 160: BRZ	brz,a,pt	%8,<label_0xa0004>
	.word 0xbe7222cc  ! 161: UDIV_I	udiv 	%r8, 0x02cc, %r31
	.word 0xeeda1009  ! 162: LDXA_R	ldxa	[%r8, %r9] 0x80, %r23
	.word 0xc3ea219c  ! 163: PREFETCHA_I	prefetcha	[%r8, + 0x019c] %asi, #one_read
	.word 0x8143c000  ! 164: STBAR	stbar
	.word 0x02c20008  ! 165: BRZ	brz  ,nt	%8,<label_0x20008>
	.word 0x8143c000  ! 166: STBAR	stbar
	.word 0xcb3a2258  ! 167: STDF_I	std	%f5, [0x0258, %r8]
	.word 0xc6422b84  ! 168: LDSW_I	ldsw	[%r8 + 0x0b84], %r3
	.word 0xa0da0009  ! 169: SMULcc_R	smulcc 	%r8, %r9, %r16
	.word 0xdefa2500  ! 170: SWAPA_I	swapa	%r15, [%r8 + 0x0500] %asi
	.word 0xf47a0009  ! 171: SWAP_R	swap	%r26, [%r8 + %r9]
	.word 0xf4ba1009  ! 173: STDA_R	stda	%r26, [%r8 + %r9] 0x80
	.word 0xc33a24b8  ! 175: STDF_I	std	%f1, [0x04b8, %r8]
	.word 0xc8fa220c  ! 176: SWAPA_I	swapa	%r4, [%r8 + 0x020c] %asi
	.word 0xce5a29a8  ! 177: LDX_I	ldx	[%r8 + 0x09a8], %r7
	.word 0xd8d22d88  ! 178: LDSHA_I	ldsha	[%r8, + 0x0d88] %asi, %r12
	.word 0xcc0a0009  ! 179: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xd64a2cf0  ! 180: LDSB_I	ldsb	[%r8 + 0x0cf0], %r11
	.word 0xa56a0009  ! 181: SDIVX_R	sdivx	%r8, %r9, %r18
	.word 0x83a20929  ! 182: FMULs	fmuls	%f8, %f9, %f1
	.word 0xcff22009  ! 183: CASXA_R	casxa	[%r8]%asi, %r9, %r7
	.word 0xc5f22009  ! 184: CASXA_R	casxa	[%r8]%asi, %r9, %r2
	.word 0xc3ea2a84  ! 185: PREFETCHA_I	prefetcha	[%r8, + 0x0a84] %asi, #one_read
	.word 0xa2520009  ! 186: UMUL_R	umul 	%r8, %r9, %r17
	.word 0xcefa21f4  ! 187: SWAPA_I	swapa	%r7, [%r8 + 0x01f4] %asi
	.word 0xce520009  ! 188: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xc68a1009  ! 189: LDUBA_R	lduba	[%r8, %r9] 0x80, %r3
	.word 0x8fa20829  ! 190: FADDs	fadds	%f8, %f9, %f7
	.word 0x88f22f64  ! 191: UDIVcc_I	udivcc 	%r8, 0x0f64, %r4
	.word 0xcaf22818  ! 192: STXA_I	stxa	%r5, [%r8 + 0x0818] %asi
	.word 0x82720009  ! 193: UDIV_R	udiv 	%r8, %r9, %r1
	.word 0xc4da1009  ! 194: LDXA_R	ldxa	[%r8, %r9] 0x80, %r2
	.word 0xbed20009  ! 195: UMULcc_R	umulcc 	%r8, %r9, %r31
	.word 0x88f22d9c  ! 196: UDIVcc_I	udivcc 	%r8, 0x0d9c, %r4
	.word 0xce020009  ! 197: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xc6d224f4  ! 198: LDSHA_I	ldsha	[%r8, + 0x04f4] %asi, %r3
	.word 0xac720009  ! 199: UDIV_R	udiv 	%r8, %r9, %r22
	.word 0x40000004  ! 200: CALL	call	disp30_4
	.word 0xc2ea1009  ! 201: LDSTUBA_R	ldstuba	%r1, [%r8 + %r9] 0x80
	.word 0xb26a0009  ! 202: UDIVX_R	udivx 	%r8, %r9, %r25
	.word 0xce6a0009  ! 203: LDSTUB_R	ldstub	%r7, [%r8 + %r9]
	.word 0xc36a25e4  ! 204: PREFETCH_I	prefetch	[%r8 + 0x05e4], #one_read
	.word 0x32800004  ! 206: BNE	bne,a	<label_0x4>
	.word 0xdc1a0009  ! 207: LDD_R	ldd	[%r8 + %r9], %r14
	.word 0xcefa1009  ! 208: SWAPA_R	swapa	%r7, [%r8 + %r9] 0x80
	.word 0x846a2424  ! 209: UDIVX_I	udivx 	%r8, 0x0424, %r2
	.word 0xea520009  ! 210: LDSH_R	ldsh	[%r8 + %r9], %r21
	.word 0x8143c000  ! 211: STBAR	stbar
	.word 0x34800004  ! 212: BG	bg,a	<label_0x4>
	.word 0x82d20009  ! 213: UMULcc_R	umulcc 	%r8, %r9, %r1
	.word 0x8ad2209c  ! 214: UMULcc_I	umulcc 	%r8, 0x009c, %r5
	.word 0xc4a226fc  ! 215: STWA_I	stwa	%r2, [%r8 + 0x06fc] %asi
	.word 0x8143c000  ! 216: STBAR	stbar
	.word 0xe8b22a10  ! 217: STHA_I	stha	%r20, [%r8 + 0x0a10] %asi
	.word 0xc89222bc  ! 218: LDUHA_I	lduha	[%r8, + 0x02bc] %asi, %r4
	.word 0xc9222758  ! 219: STF_I	st	%f4, [0x0758, %r8]
	.word 0x8c7a2aac  ! 220: SDIV_I	sdiv 	%r8, 0x0aac, %r6
	.word 0x83a209a9  ! 221: FDIVs	fdivs	%f8, %f9, %f1
	.word 0x9ed221bc  ! 222: UMULcc_I	umulcc 	%r8, 0x01bc, %r15
	.word 0xdaca1009  ! 223: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r13
	.word 0x26800008  ! 224: BL	bl,a	<label_0x8>
	.word 0xc36a2674  ! 225: PREFETCH_I	prefetch	[%r8 + 0x0674], #one_read
	.word 0xe1e22009  ! 226: CASA_R	casa	[%r8] %asi, %r9, %r16
	.word 0x30800008  ! 227: BA	ba,a	<label_0x8>
	.word 0xc4da1009  ! 228: LDXA_R	ldxa	[%r8, %r9] 0x80, %r2
	.word 0x84d22ba8  ! 229: UMULcc_I	umulcc 	%r8, 0x0ba8, %r2
	.word 0x865a2a84  ! 231: SMUL_I	smul 	%r8, 0x0a84, %r3
	.word 0xc4b22934  ! 232: STHA_I	stha	%r2, [%r8 + 0x0934] %asi
	.word 0xa56a0009  ! 233: SDIVX_R	sdivx	%r8, %r9, %r18
	.word 0xc27a0009  ! 234: SWAP_R	swap	%r1, [%r8 + %r9]
	.word 0xfc5a2a58  ! 235: LDX_I	ldx	[%r8 + 0x0a58], %r30
	.word 0xc4aa1009  ! 236: STBA_R	stba	%r2, [%r8 + %r9] 0x80
	.word 0xca7a0009  ! 237: SWAP_R	swap	%r5, [%r8 + %r9]
	.word 0x8143c000  ! 238: STBAR	stbar
	.word 0xfc9a1009  ! 239: LDDA_R	ldda	[%r8, %r9] 0x80, %r30
	.word 0xc8b21009  ! 240: STHA_R	stha	%r4, [%r8 + %r9] 0x80
	.word 0xfeca1009  ! 241: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r31
	.word 0xc36a2df0  ! 242: PREFETCH_I	prefetch	[%r8 + 0x0df0], #one_read
	.word 0xc6b21009  ! 244: STHA_R	stha	%r3, [%r8 + %r9] 0x80
	.word 0x8143e043  ! 245: MEMBAR	membar	#LoadLoad | #StoreLoad | #Sync 
	.word 0xbe4a0009  ! 246: MULX_R	mulx 	%r8, %r9, %r31
	.word 0xcc7a0009  ! 247: SWAP_R	swap	%r6, [%r8 + %r9]
	.word 0x8fa208a9  ! 248: FSUBs	fsubs	%f8, %f9, %f7
	.word 0xc2821009  ! 249: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r1
	.word 0x02ca0004  ! 250: BRZ	brz  ,pt	%8,<label_0xa0004>
	.word 0xcefa1009  ! 251: SWAPA_R	swapa	%r7, [%r8 + %r9] 0x80
	.word 0x8143e041  ! 252: MEMBAR	membar	#LoadLoad | #Sync 
	.word 0xe4b22038  ! 254: STHA_I	stha	%r18, [%r8 + 0x0038] %asi
	.word 0x8f6a0009  ! 255: SDIVX_R	sdivx	%r8, %r9, %r7
	.word 0xf0fa1009  ! 256: SWAPA_R	swapa	%r24, [%r8 + %r9] 0x80
	.word 0xe47a29dc  ! 257: SWAP_I	swap	%r18, [%r8 + 0x09dc]
	.word 0xe0ba2b30  ! 258: STDA_I	stda	%r16, [%r8 + 0x0b30] %asi
	.word 0xc5f21009  ! 259: CASXA_I	casxa	[%r8] 0x80, %r9, %r2
	.word 0x8143e07b  ! 260: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xfc0a2c68  ! 261: LDUB_I	ldub	[%r8 + 0x0c68], %r30
	.word 0xc3ea2f14  ! 262: PREFETCHA_I	prefetcha	[%r8, + 0x0f14] %asi, #one_read
	.word 0xba5a0009  ! 263: SMUL_R	smul 	%r8, %r9, %r29
	.word 0x9eda0009  ! 264: SMULcc_R	smulcc 	%r8, %r9, %r15
	.word 0x8ef22980  ! 265: UDIVcc_I	udivcc 	%r8, 0x0980, %r7
	.word 0x8cf20009  ! 266: UDIVcc_R	udivcc 	%r8, %r9, %r6
	.word 0xd81222f4  ! 267: LDUH_I	lduh	[%r8 + 0x02f4], %r12
	.word 0xcc4a2474  ! 268: LDSB_I	ldsb	[%r8 + 0x0474], %r6
	.word 0xdefa1009  ! 269: SWAPA_R	swapa	%r15, [%r8 + %r9] 0x80
	.word 0xf3220009  ! 270: STF_R	st	%f25, [%r9, %r8]
	.word 0xc68a1009  ! 271: LDUBA_R	lduba	[%r8, %r9] 0x80, %r3
	.word 0x87222f28  ! 272: MULScc_I	mulscc 	%r8, 0x0f28, %r3
	.word 0x38800004  ! 273: BGU	bgu,a	<label_0x4>
	.word 0x865a0009  ! 274: SMUL_R	smul 	%r8, %r9, %r3
	.word 0x06800004  ! 275: BL	bl  	<label_0x4>
	.word 0x9ba20829  ! 276: FADDs	fadds	%f8, %f9, %f13
	.word 0x82f20009  ! 277: UDIVcc_R	udivcc 	%r8, %r9, %r1
	.word 0xc36a2c14  ! 278: PREFETCH_I	prefetch	[%r8 + 0x0c14], #one_read
	.word 0xc2da1009  ! 279: LDXA_R	ldxa	[%r8, %r9] 0x80, %r1
	.word 0x8143c000  ! 280: STBAR	stbar
	.word 0xdf220009  ! 281: STF_R	st	%f15, [%r9, %r8]
	.word 0xc8d22868  ! 282: LDSHA_I	ldsha	[%r8, + 0x0868] %asi, %r4
	.word 0xc4aa2550  ! 283: STBA_I	stba	%r2, [%r8 + 0x0550] %asi
	.word 0x18800008  ! 284: BGU	bgu  	<label_0x8>
	.word 0xc4f21009  ! 285: STXA_R	stxa	%r2, [%r8 + %r9] 0x80
	.word 0xe8f228e8  ! 286: STXA_I	stxa	%r20, [%r8 + 0x08e8] %asi
	.word 0x8143c000  ! 287: STBAR	stbar
	.word 0xc4a228a0  ! 288: STWA_I	stwa	%r2, [%r8 + 0x08a0] %asi
	.word 0xc49a1009  ! 289: LDDA_R	ldda	[%r8, %r9] 0x80, %r2
	.word 0xc36a2b2c  ! 290: PREFETCH_I	prefetch	[%r8 + 0x0b2c], #one_read
	.word 0xf8a22380  ! 291: STWA_I	stwa	%r28, [%r8 + 0x0380] %asi
	.word 0xc9220009  ! 292: STF_R	st	%f4, [%r9, %r8]
	.word 0x867a0009  ! 293: SDIV_R	sdiv 	%r8, %r9, %r3
	.word 0x87222e44  ! 294: MULScc_I	mulscc 	%r8, 0x0e44, %r3
	.word 0xce4228a0  ! 295: LDSW_I	ldsw	[%r8 + 0x08a0], %r7
	.word 0x2c800004  ! 296: BNEG	bneg,a	<label_0x4>
	.word 0xd8922634  ! 297: LDUHA_I	lduha	[%r8, + 0x0634] %asi, %r12
	.word 0x8e5a0009  ! 298: SMUL_R	smul 	%r8, %r9, %r7
	.word 0xc48a1009  ! 299: LDUBA_R	lduba	[%r8, %r9] 0x80, %r2
	.word 0xd8b22438  ! 300: STHA_I	stha	%r12, [%r8 + 0x0438] %asi
	.word 0xdc9a1009  ! 301: LDDA_R	ldda	[%r8, %r9] 0x80, %r14
	.word 0xc9220009  ! 302: STF_R	st	%f4, [%r9, %r8]
	.word 0x8143c000  ! 303: STBAR	stbar
	.word 0xc26a27cc  ! 304: LDSTUB_I	ldstub	%r1, [%r8 + 0x07cc]
	.word 0x0c800004  ! 305: BNEG	bneg  	<label_0x4>
	.word 0xc8822f20  ! 306: LDUWA_I	lduwa	[%r8, + 0x0f20] %asi, %r4
	.word 0xc8f222b8  ! 307: STXA_I	stxa	%r4, [%r8 + 0x02b8] %asi
	.word 0xc7f21009  ! 308: CASXA_I	casxa	[%r8] 0x80, %r9, %r3
	.word 0xe2ca25c4  ! 309: LDSBA_I	ldsba	[%r8, + 0x05c4] %asi, %r17
	.word 0xc36a2598  ! 310: PREFETCH_I	prefetch	[%r8 + 0x0598], #one_read
	.word 0xd4ea1009  ! 311: LDSTUBA_R	ldstuba	%r10, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 313: STBAR	stbar
	.word 0xcf3a23c0  ! 314: STDF_I	std	%f7, [0x03c0, %r8]
	.word 0xbe7a24a4  ! 315: SDIV_I	sdiv 	%r8, 0x04a4, %r31
	.word 0x886a2c20  ! 316: UDIVX_I	udivx 	%r8, 0x0c20, %r4
	.word 0xccba2580  ! 317: STDA_I	stda	%r6, [%r8 + 0x0580] %asi
	.word 0xccb2281c  ! 318: STHA_I	stha	%r6, [%r8 + 0x081c] %asi
	.word 0xf0c22000  ! 319: LDSWA_I	ldswa	[%r8, + 0x0000] %asi, %r24
	.word 0x8e5a0009  ! 320: SMUL_R	smul 	%r8, %r9, %r7
	.word 0x9da20829  ! 321: FADDs	fadds	%f8, %f9, %f14
	.word 0x824a2844  ! 322: MULX_I	mulx 	%r8, 0x0844, %r1
	.word 0x8143e05d  ! 323: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0xc53a0009  ! 324: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc4921009  ! 325: LDUHA_R	lduha	[%r8, %r9] 0x80, %r2
	.word 0xb8f222a8  ! 326: UDIVcc_I	udivcc 	%r8, 0x02a8, %r28
	.word 0x83a209a9  ! 327: FDIVs	fdivs	%f8, %f9, %f1
	.word 0xf4120009  ! 328: LDUH_R	lduh	[%r8 + %r9], %r26
	.word 0xc36a2ea0  ! 329: PREFETCH_I	prefetch	[%r8 + 0x0ea0], #one_read
	.word 0xc9f21009  ! 330: CASXA_I	casxa	[%r8] 0x80, %r9, %r4
	.word 0xc6fa2e48  ! 332: SWAPA_I	swapa	%r3, [%r8 + 0x0e48] %asi
	.word 0x98f20009  ! 333: UDIVcc_R	udivcc 	%r8, %r9, %r12
	.word 0xc2822cd0  ! 334: LDUWA_I	lduwa	[%r8, + 0x0cd0] %asi, %r1
	.word 0xc49a1009  ! 335: LDDA_R	ldda	[%r8, %r9] 0x80, %r2
	.word 0x8143e060  ! 336: MEMBAR	membar	#MemIssue | #Sync 
	.word 0x8a4a0009  ! 337: MULX_R	mulx 	%r8, %r9, %r5
	.word 0xce420009  ! 338: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0x8f6a0009  ! 340: SDIVX_R	sdivx	%r8, %r9, %r7
	.word 0xc6c21009  ! 342: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r3
	.word 0xc4ba1009  ! 343: STDA_R	stda	%r2, [%r8 + %r9] 0x80
	.word 0xb04a0009  ! 344: MULX_R	mulx 	%r8, %r9, %r24
	.word 0xc3ea2778  ! 345: PREFETCHA_I	prefetcha	[%r8, + 0x0778] %asi, #one_read
	.word 0xc85a0009  ! 346: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xbb6a0009  ! 348: SDIVX_R	sdivx	%r8, %r9, %r29
	.word 0x885a0009  ! 349: SMUL_R	smul 	%r8, %r9, %r4
	.word 0xb65a0009  ! 350: SMUL_R	smul 	%r8, %r9, %r27
	.word 0x8ba20929  ! 351: FMULs	fmuls	%f8, %f9, %f5
	.word 0xcef21009  ! 353: STXA_R	stxa	%r7, [%r8 + %r9] 0x80
	.word 0xf5220009  ! 354: STF_R	st	%f26, [%r9, %r8]
	.word 0xce7a0009  ! 356: SWAP_R	swap	%r7, [%r8 + %r9]
	.word 0x89a20929  ! 357: FMULs	fmuls	%f8, %f9, %f4
	.word 0xc6f21009  ! 358: STXA_R	stxa	%r3, [%r8 + %r9] 0x80
	.word 0x84720009  ! 359: UDIV_R	udiv 	%r8, %r9, %r2
	.word 0x8143e056  ! 360: MEMBAR	membar	#StoreLoad | #LoadStore | #Lookaside | #Sync 
	.word 0x20800008  ! 361: BN	bn,a	<label_0x8>
	.word 0x867a28c0  ! 362: SDIV_I	sdiv 	%r8, 0x08c0, %r3
	.word 0xcc821009  ! 363: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r6
	.word 0x826a0009  ! 364: UDIVX_R	udivx 	%r8, %r9, %r1
	.word 0x8b6a0009  ! 365: SDIVX_R	sdivx	%r8, %r9, %r5
	.word 0xc8aa1009  ! 366: STBA_R	stba	%r4, [%r8 + %r9] 0x80
	.word 0xca522174  ! 367: LDSH_I	ldsh	[%r8 + 0x0174], %r5
	.word 0x865228e8  ! 368: UMUL_I	umul 	%r8, 0x08e8, %r3
	.word 0xc64a20ac  ! 369: LDSB_I	ldsb	[%r8 + 0x00ac], %r3
	.word 0x87a208a9  ! 370: FSUBs	fsubs	%f8, %f9, %f3
	.word 0x8143e01a  ! 371: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside 
	.word 0xc36a2594  ! 372: PREFETCH_I	prefetch	[%r8 + 0x0594], #one_read
	.word 0x87a209a9  ! 373: FDIVs	fdivs	%f8, %f9, %f3
	.word 0x88d20009  ! 374: UMULcc_R	umulcc 	%r8, %r9, %r4
	.word 0x826a0009  ! 375: UDIVX_R	udivx 	%r8, %r9, %r1
	.word 0x0ec20004  ! 376: BRGEZ	brgez  ,nt	%8,<label_0x20004>
	.word 0x8e5a0009  ! 377: SMUL_R	smul 	%r8, %r9, %r7
	.word 0x8ef22048  ! 378: UDIVcc_I	udivcc 	%r8, 0x0048, %r7
	.word 0x8143e002  ! 379: MEMBAR	membar	#StoreLoad 
	.word 0x04800004  ! 380: BLE	ble  	<label_0x4>
	.word 0xc2822050  ! 381: LDUWA_I	lduwa	[%r8, + 0x0050] %asi, %r1
	.word 0xc4020009  ! 382: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xc3f22009  ! 383: CASXA_R	casxa	[%r8]%asi, %r9, %r1
	.word 0x10800004  ! 384: BA	ba  	<label_0x4>
	.word 0x0eca0004  ! 385: BRGEZ	brgez  ,pt	%8,<label_0xa0004>
	.word 0x82720009  ! 386: UDIV_R	udiv 	%r8, %r9, %r1
	.word 0xf93a0009  ! 387: STDF_R	std	%f28, [%r9, %r8]
	.word 0xcca21009  ! 388: STWA_R	stwa	%r6, [%r8 + %r9] 0x80
	.word 0x24800008  ! 389: BLE	ble,a	<label_0x8>
	.word 0xc26a22b4  ! 390: LDSTUB_I	ldstub	%r1, [%r8 + 0x02b4]
	.word 0xd41a0009  ! 391: LDD_R	ldd	[%r8 + %r9], %r10
	.word 0xf09a2810  ! 392: LDDA_I	ldda	[%r8, + 0x0810] %asi, %r24
	.word 0xceca1009  ! 393: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r7
	.word 0x8d220009  ! 394: MULScc_R	mulscc 	%r8, %r9, %r6
	.word 0xc53a0009  ! 395: STDF_R	std	%f2, [%r9, %r8]
	.word 0x3a800004  ! 396: BCC	bcc,a	<label_0x4>
	.word 0x87a20929  ! 397: FMULs	fmuls	%f8, %f9, %f3
	.word 0x99a20829  ! 398: FADDs	fadds	%f8, %f9, %f12
	.word 0x8143e028  ! 399: MEMBAR	membar	#StoreStore | #MemIssue 
	.word 0x867a0009  ! 400: SDIV_R	sdiv 	%r8, %r9, %r3
	.word 0x40000004  ! 401: CALL	call	disp30_4
	.word 0xc2b22138  ! 402: STHA_I	stha	%r1, [%r8 + 0x0138] %asi
	.word 0xccb225ec  ! 403: STHA_I	stha	%r6, [%r8 + 0x05ec] %asi
	.word 0xce8a2e44  ! 404: LDUBA_I	lduba	[%r8, + 0x0e44] %asi, %r7
	.word 0xc3220009  ! 405: STF_R	st	%f1, [%r9, %r8]
	.word 0x3a800008  ! 406: BCC	bcc,a	<label_0x8>
	.word 0x8143c000  ! 407: STBAR	stbar
	.word 0xcec21009  ! 408: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r7
	.word 0xb6fa0009  ! 409: SDIVcc_R	sdivcc 	%r8, %r9, %r27
	.word 0x04c20004  ! 410: BRLEZ	brlez  ,nt	%8,<label_0x20004>
	.word 0x865a20a4  ! 411: SMUL_I	smul 	%r8, 0x00a4, %r3
	.word 0xcef21009  ! 412: STXA_R	stxa	%r7, [%r8 + %r9] 0x80
	.word 0x9da208a9  ! 413: FSUBs	fsubs	%f8, %f9, %f14
	.word 0x89a20929  ! 414: FMULs	fmuls	%f8, %f9, %f4
	.word 0x2c800004  ! 415: BNEG	bneg,a	<label_0x4>
	.word 0xdec22d80  ! 416: LDSWA_I	ldswa	[%r8, + 0x0d80] %asi, %r15
	.word 0xc6420009  ! 417: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0x847a0009  ! 418: SDIV_R	sdiv 	%r8, %r9, %r2
	.word 0xea6a0009  ! 419: LDSTUB_R	ldstub	%r21, [%r8 + %r9]
	.word 0xc36a298c  ! 420: PREFETCH_I	prefetch	[%r8 + 0x098c], #one_read
	.word 0x8fa20829  ! 421: FADDs	fadds	%f8, %f9, %f7
	.word 0x89a20929  ! 422: FMULs	fmuls	%f8, %f9, %f4
	.word 0xc6d21009  ! 423: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r3
	.word 0x826a0009  ! 424: UDIVX_R	udivx 	%r8, %r9, %r1
	.word 0xc53a26a0  ! 425: STDF_I	std	%f2, [0x06a0, %r8]
	.word 0xa45a0009  ! 426: SMUL_R	smul 	%r8, %r9, %r18
	.word 0x98d22b78  ! 427: UMULcc_I	umulcc 	%r8, 0x0b78, %r12
	.word 0xc65223cc  ! 428: LDSH_I	ldsh	[%r8 + 0x03cc], %r3
	.word 0xc85225ec  ! 429: LDSH_I	ldsh	[%r8 + 0x05ec], %r4
	.word 0xc3e22009  ! 430: CASA_R	casa	[%r8] %asi, %r9, %r1
	.word 0x824a21b4  ! 431: MULX_I	mulx 	%r8, 0x01b4, %r1
	.word 0xec420009  ! 432: LDSW_R	ldsw	[%r8 + %r9], %r22
	.word 0xe84a0009  ! 433: LDSB_R	ldsb	[%r8 + %r9], %r20
	.word 0xcc422968  ! 434: LDSW_I	ldsw	[%r8 + 0x0968], %r6
	.word 0xcc7a0009  ! 435: SWAP_R	swap	%r6, [%r8 + %r9]
	.word 0xc8b224d4  ! 436: STHA_I	stha	%r4, [%r8 + 0x04d4] %asi
	.word 0xc93a29b8  ! 437: STDF_I	std	%f4, [0x09b8, %r8]
	.word 0xc67a0009  ! 438: SWAP_R	swap	%r3, [%r8 + %r9]
	.word 0xc3ea2c5c  ! 439: PREFETCHA_I	prefetcha	[%r8, + 0x0c5c] %asi, #one_read
	.word 0x04c20004  ! 441: BRLEZ	brlez  ,nt	%8,<label_0x20004>
	.word 0xc6822010  ! 442: LDUWA_I	lduwa	[%r8, + 0x0010] %asi, %r3
	.word 0xab6a2680  ! 443: SDIVX_I	sdivx	%r8, 0x0680, %r21
	.word 0xd8fa1009  ! 444: SWAPA_R	swapa	%r12, [%r8 + %r9] 0x80
	.word 0x8cd20009  ! 445: UMULcc_R	umulcc 	%r8, %r9, %r6
	.word 0xf482279c  ! 446: LDUWA_I	lduwa	[%r8, + 0x079c] %asi, %r26
	.word 0xc8420009  ! 447: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0x9c7a2688  ! 448: SDIV_I	sdiv 	%r8, 0x0688, %r14
	.word 0x83a208a9  ! 449: FSUBs	fsubs	%f8, %f9, %f1
	.word 0x8143e01d  ! 450: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside 
	.word 0xc7222bdc  ! 451: STF_I	st	%f3, [0x0bdc, %r8]
	.word 0xc4aa1009  ! 452: STBA_R	stba	%r2, [%r8 + %r9] 0x80
	.word 0x87a208a9  ! 453: FSUBs	fsubs	%f8, %f9, %f3
	.word 0x8cf22a9c  ! 454: UDIVcc_I	udivcc 	%r8, 0x0a9c, %r6
	.word 0x8143e05e  ! 455: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0xc2821009  ! 456: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r1
	.word 0xccb21009  ! 457: STHA_R	stha	%r6, [%r8 + %r9] 0x80
	.word 0xc3ea2da0  ! 458: PREFETCHA_I	prefetcha	[%r8, + 0x0da0] %asi, #one_read
	.word 0xccaa1009  ! 459: STBA_R	stba	%r6, [%r8 + %r9] 0x80
	.word 0x89220009  ! 460: MULScc_R	mulscc 	%r8, %r9, %r4
	.word 0xc6522030  ! 461: LDSH_I	ldsh	[%r8 + 0x0030], %r3
	.word 0x8143e070  ! 462: MEMBAR	membar	#Lookaside | #MemIssue | #Sync 
	.word 0xce9228c4  ! 463: LDUHA_I	lduha	[%r8, + 0x08c4] %asi, %r7
	.word 0xbc7a0009  ! 464: SDIV_R	sdiv 	%r8, %r9, %r30
	.word 0x36800008  ! 465: BGE	bge,a	<label_0x8>
	.word 0xc48a2728  ! 466: LDUBA_I	lduba	[%r8, + 0x0728] %asi, %r2
	.word 0x8b222364  ! 467: MULScc_I	mulscc 	%r8, 0x0364, %r5
	.word 0xe65229dc  ! 468: LDSH_I	ldsh	[%r8 + 0x09dc], %r19
	.word 0x8143c000  ! 469: STBAR	stbar
	.word 0xc4a21009  ! 470: STWA_R	stwa	%r2, [%r8 + %r9] 0x80
	.word 0x8143e01c  ! 471: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside 
	.word 0xf01a0009  ! 472: LDD_R	ldd	[%r8 + %r9], %r24
	.word 0xeaa21009  ! 473: STWA_R	stwa	%r21, [%r8 + %r9] 0x80
	.word 0xee1223a0  ! 474: LDUH_I	lduh	[%r8 + 0x03a0], %r23
	.word 0x8fa20929  ! 475: FMULs	fmuls	%f8, %f9, %f7
	.word 0xcc0a21e0  ! 476: LDUB_I	ldub	[%r8 + 0x01e0], %r6
	.word 0x8c5222ac  ! 477: UMUL_I	umul 	%r8, 0x02ac, %r6
	.word 0xd93a0009  ! 478: STDF_R	std	%f12, [%r9, %r8]
	.word 0xac5a0009  ! 479: SMUL_R	smul 	%r8, %r9, %r22
	.word 0x8af22aa4  ! 480: UDIVcc_I	udivcc 	%r8, 0x0aa4, %r5
	.word 0x0e800004  ! 481: BVS	bvs  	<label_0x4>
	.word 0xc6c227f8  ! 482: LDSWA_I	ldswa	[%r8, + 0x07f8] %asi, %r3
	.word 0xeaca28dc  ! 483: LDSBA_I	ldsba	[%r8, + 0x08dc] %asi, %r21
	.word 0x24800004  ! 484: BLE	ble,a	<label_0x4>
	.word 0xf2ca2e44  ! 485: LDSBA_I	ldsba	[%r8, + 0x0e44] %asi, %r25
	.word 0xc6ca2d18  ! 486: LDSBA_I	ldsba	[%r8, + 0x0d18] %asi, %r3
	.word 0xc8922eec  ! 487: LDUHA_I	lduha	[%r8, + 0x0eec] %asi, %r4
	.word 0x2ac20008  ! 488: BRNZ	brnz,a,nt	%8,<label_0x20008>
	.word 0xc6aa2e98  ! 489: STBA_I	stba	%r3, [%r8 + 0x0e98] %asi
	.word 0xb072218c  ! 490: UDIV_I	udiv 	%r8, 0x018c, %r24
	.word 0x0ac20008  ! 491: BRNZ	brnz  ,nt	%8,<label_0x20008>
	.word 0xcc7a2134  ! 492: SWAP_I	swap	%r6, [%r8 + 0x0134]
	.word 0xccf22248  ! 493: STXA_I	stxa	%r6, [%r8 + 0x0248] %asi
	.word 0xcc12280c  ! 494: LDUH_I	lduh	[%r8 + 0x080c], %r6
	.word 0xcf220009  ! 495: STF_R	st	%f7, [%r9, %r8]
	.word 0x9cf20009  ! 496: UDIVcc_R	udivcc 	%r8, %r9, %r14
	.word 0x02800004  ! 497: BE	be  	<label_0x4>
	.word 0xc8120009  ! 498: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0x1a800004  ! 499: BCC	bcc  	<label_0x4>
	.word 0x8143e049  ! 500: MEMBAR	membar	#LoadLoad | #StoreStore | #Sync 
	.word 0xc3ea2b9c  ! 501: PREFETCHA_I	prefetcha	[%r8, + 0x0b9c] %asi, #one_read
	.word 0x8ba20929  ! 502: FMULs	fmuls	%f8, %f9, %f5
	.word 0x9da20929  ! 503: FMULs	fmuls	%f8, %f9, %f14
	.word 0xb12227c0  ! 504: MULScc_I	mulscc 	%r8, 0x07c0, %r24
	.word 0x8e520009  ! 505: UMUL_R	umul 	%r8, %r9, %r7
	.word 0xdc7a2328  ! 506: SWAP_I	swap	%r14, [%r8 + 0x0328]
	.word 0xfeea1009  ! 507: LDSTUBA_R	ldstuba	%r31, [%r8 + %r9] 0x80
	.word 0x8b6a0009  ! 508: SDIVX_R	sdivx	%r8, %r9, %r5
	.word 0x2c800008  ! 509: BNEG	bneg,a	<label_0x8>
	.word 0x87a20829  ! 510: FADDs	fadds	%f8, %f9, %f3
	.word 0xcc921009  ! 511: LDUHA_R	lduha	[%r8, %r9] 0x80, %r6
	.word 0xca0a0009  ! 513: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xa3a208a9  ! 514: FSUBs	fsubs	%f8, %f9, %f17
	.word 0xcaaa2da8  ! 515: STBA_I	stba	%r5, [%r8 + 0x0da8] %asi
	.word 0xec120009  ! 516: LDUH_R	lduh	[%r8 + %r9], %r22
	.word 0xd4ba1009  ! 517: STDA_R	stda	%r10, [%r8 + %r9] 0x80
	.word 0xf0a21009  ! 518: STWA_R	stwa	%r24, [%r8 + %r9] 0x80
	.word 0xc36a2de8  ! 519: PREFETCH_I	prefetch	[%r8 + 0x0de8], #one_read
	.word 0x8143c000  ! 520: STBAR	stbar
	.word 0xc4122204  ! 521: LDUH_I	lduh	[%r8 + 0x0204], %r2
	.word 0xf7e21009  ! 522: CASA_I	casa	[%r8] 0x80, %r9, %r27
	.word 0x82520009  ! 523: UMUL_R	umul 	%r8, %r9, %r1
	.word 0x86720009  ! 524: UDIV_R	udiv 	%r8, %r9, %r3
	.word 0x84720009  ! 525: UDIV_R	udiv 	%r8, %r9, %r2
	.word 0xc93a0009  ! 526: STDF_R	std	%f4, [%r9, %r8]
	.word 0x8143c000  ! 527: STBAR	stbar
	.word 0x9d6a2628  ! 529: SDIVX_I	sdivx	%r8, 0x0628, %r14
	.word 0xf0aa1009  ! 530: STBA_R	stba	%r24, [%r8 + %r9] 0x80
	.word 0xc4aa2aa0  ! 531: STBA_I	stba	%r2, [%r8 + 0x0aa0] %asi
	.word 0x8143c000  ! 532: STBAR	stbar
	.word 0xc8f22a70  ! 533: STXA_I	stxa	%r4, [%r8 + 0x0a70] %asi
	.word 0x8143c000  ! 534: STBAR	stbar
	.word 0xc3ea2940  ! 535: PREFETCHA_I	prefetcha	[%r8, + 0x0940] %asi, #one_read
	.word 0xc8ea22e0  ! 536: LDSTUBA_I	ldstuba	%r4, [%r8 + 0x02e0] %asi
	.word 0x8fa20829  ! 539: FADDs	fadds	%f8, %f9, %f7
	.word 0xbe522fe0  ! 540: UMUL_I	umul 	%r8, 0x0fe0, %r31
	.word 0xec9a1009  ! 541: LDDA_R	ldda	[%r8, %r9] 0x80, %r22
	.word 0x85a20829  ! 542: FADDs	fadds	%f8, %f9, %f2
	.word 0xc65a0009  ! 543: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xf6f22280  ! 544: STXA_I	stxa	%r27, [%r8 + 0x0280] %asi
	.word 0x24ca0004  ! 545: BRLEZ	brlez,a,pt	%8,<label_0xa0004>
	.word 0xc60a0009  ! 546: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xc4fa28d0  ! 547: SWAPA_I	swapa	%r2, [%r8 + 0x08d0] %asi
	.word 0x836a2b48  ! 548: SDIVX_I	sdivx	%r8, 0x0b48, %r1
	.word 0xf8ba1009  ! 549: STDA_R	stda	%r28, [%r8 + %r9] 0x80
	.word 0xc24a2650  ! 550: LDSB_I	ldsb	[%r8 + 0x0650], %r1
	.word 0xbafa2f7c  ! 551: SDIVcc_I	sdivcc 	%r8, 0x0f7c, %r29
	.word 0xc4ea1009  ! 552: LDSTUBA_R	ldstuba	%r2, [%r8 + %r9] 0x80
	.word 0xc6f21009  ! 553: STXA_R	stxa	%r3, [%r8 + %r9] 0x80
	.word 0x86da2bac  ! 554: SMULcc_I	smulcc 	%r8, 0x0bac, %r3
	.word 0xc33a0009  ! 555: STDF_R	std	%f1, [%r9, %r8]
	.word 0xf8f225e0  ! 556: STXA_I	stxa	%r28, [%r8 + 0x05e0] %asi
	.word 0x8c5a0009  ! 557: SMUL_R	smul 	%r8, %r9, %r6
	.word 0x836a25cc  ! 558: SDIVX_I	sdivx	%r8, 0x05cc, %r1
	.word 0xa0da2710  ! 559: SMULcc_I	smulcc 	%r8, 0x0710, %r16
	.word 0xeaea1009  ! 560: LDSTUBA_R	ldstuba	%r21, [%r8 + %r9] 0x80
	.word 0xe27a0009  ! 561: SWAP_R	swap	%r17, [%r8 + %r9]
	.word 0x89a20829  ! 562: FADDs	fadds	%f8, %f9, %f4
	.word 0x8143e020  ! 563: MEMBAR	membar	#MemIssue 
	.word 0x8143e06d  ! 564: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #MemIssue | #Sync 
	.word 0xe41a0009  ! 565: LDD_R	ldd	[%r8 + %r9], %r18
	.word 0xc40a2c14  ! 566: LDUB_I	ldub	[%r8 + 0x0c14], %r2
	.word 0xc3ea29b8  ! 567: PREFETCHA_I	prefetcha	[%r8, + 0x09b8] %asi, #one_read
	.word 0xc322277c  ! 568: STF_I	st	%f1, [0x077c, %r8]
	.word 0xcafa20b8  ! 569: SWAPA_I	swapa	%r5, [%r8 + 0x00b8] %asi
	.word 0xca120009  ! 570: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xff222258  ! 571: STF_I	st	%f31, [0x0258, %r8]
	.word 0xc53a2d88  ! 572: STDF_I	std	%f2, [0x0d88, %r8]
	.word 0xccba1009  ! 573: STDA_R	stda	%r6, [%r8 + %r9] 0x80
	.word 0xc8c22348  ! 574: LDSWA_I	ldswa	[%r8, + 0x0348] %asi, %r4
	.word 0xca0a2d50  ! 575: LDUB_I	ldub	[%r8 + 0x0d50], %r5
	.word 0xc33a2770  ! 576: STDF_I	std	%f1, [0x0770, %r8]
	.word 0xfb220009  ! 577: STF_R	st	%f29, [%r9, %r8]
	.word 0x8da20929  ! 578: FMULs	fmuls	%f8, %f9, %f6
	.word 0xcb222580  ! 579: STF_I	st	%f5, [0x0580, %r8]
	.word 0x8143c000  ! 580: STBAR	stbar
	.word 0x8a722694  ! 581: UDIV_I	udiv 	%r8, 0x0694, %r5
	.word 0x8fa208a9  ! 582: FSUBs	fsubs	%f8, %f9, %f7
	.word 0x825a0009  ! 583: SMUL_R	smul 	%r8, %r9, %r1
	.word 0x8143c000  ! 584: STBAR	stbar
	.word 0x40000004  ! 585: CALL	call	disp30_4
	.word 0xa4d225a4  ! 586: UMULcc_I	umulcc 	%r8, 0x05a4, %r18
	.word 0x8f220009  ! 587: MULScc_R	mulscc 	%r8, %r9, %r7
	.word 0x8efa0009  ! 588: SDIVcc_R	sdivcc 	%r8, %r9, %r7
	.word 0x9e4a0009  ! 589: MULX_R	mulx 	%r8, %r9, %r15
	.word 0xcd3a20b8  ! 590: STDF_I	std	%f6, [0x00b8, %r8]
	.word 0xc2d21009  ! 591: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r1
	.word 0x8c4a0009  ! 592: MULX_R	mulx 	%r8, %r9, %r6
	.word 0xda52285c  ! 593: LDSH_I	ldsh	[%r8 + 0x085c], %r13
	.word 0x996a0009  ! 594: SDIVX_R	sdivx	%r8, %r9, %r12
	.word 0xc36a2984  ! 595: PREFETCH_I	prefetch	[%r8 + 0x0984], #one_read
	.word 0xce8a2a1c  ! 596: LDUBA_I	lduba	[%r8, + 0x0a1c] %asi, %r7
	.word 0xb5a20829  ! 597: FADDs	fadds	%f8, %f9, %f26
	.word 0xc86a2d3c  ! 598: LDSTUB_I	ldstub	%r4, [%r8 + 0x0d3c]
	.word 0x8143c000  ! 599: STBAR	stbar
	.word 0xc2a21009  ! 600: STWA_R	stwa	%r1, [%r8 + %r9] 0x80
	.word 0x8e720009  ! 601: UDIV_R	udiv 	%r8, %r9, %r7
	.word 0xc20a2210  ! 602: LDUB_I	ldub	[%r8 + 0x0210], %r1
	.word 0xdc522e34  ! 603: LDSH_I	ldsh	[%r8 + 0x0e34], %r14
	.word 0xc8aa1009  ! 604: STBA_R	stba	%r4, [%r8 + %r9] 0x80
	.word 0x82522a48  ! 605: UMUL_I	umul 	%r8, 0x0a48, %r1
	.word 0xca122e90  ! 606: LDUH_I	lduh	[%r8 + 0x0e90], %r5
	.word 0xc6f21009  ! 607: STXA_R	stxa	%r3, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 608: STBAR	stbar
	.word 0xd8821009  ! 609: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r12
	.word 0xfe6a22e0  ! 610: LDSTUB_I	ldstub	%r31, [%r8 + 0x02e0]
	.word 0xc44a0009  ! 611: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xda0a2fa8  ! 612: LDUB_I	ldub	[%r8 + 0x0fa8], %r13
	.word 0xa85a0009  ! 613: SMUL_R	smul 	%r8, %r9, %r20
	.word 0x8143e013  ! 614: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside 
	.word 0xa6fa0009  ! 615: SDIVcc_R	sdivcc 	%r8, %r9, %r19
	.word 0x8eda2db4  ! 616: SMULcc_I	smulcc 	%r8, 0x0db4, %r7
	.word 0xce821009  ! 617: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r7
	.word 0xc36a2eac  ! 618: PREFETCH_I	prefetch	[%r8 + 0x0eac], #one_read
	.word 0x8ba20829  ! 619: FADDs	fadds	%f8, %f9, %f5
	.word 0xcc8a2e88  ! 620: LDUBA_I	lduba	[%r8, + 0x0e88] %asi, %r6
	.word 0x89a208a9  ! 621: FSUBs	fsubs	%f8, %f9, %f4
	.word 0xb27a0009  ! 622: SDIV_R	sdiv 	%r8, %r9, %r25
	.word 0xec922310  ! 623: LDUHA_I	lduha	[%r8, + 0x0310] %asi, %r22
	.word 0x8143e06c  ! 624: MEMBAR	membar	#LoadStore | #StoreStore | #MemIssue | #Sync 
	.word 0xccb22848  ! 625: STHA_I	stha	%r6, [%r8 + 0x0848] %asi
	.word 0x2cca0008  ! 626: BRGZ	brgz,a,pt	%8,<label_0xa0008>
	.word 0x8a4a2744  ! 627: MULX_I	mulx 	%r8, 0x0744, %r5
	.word 0xdeea1009  ! 628: LDSTUBA_R	ldstuba	%r15, [%r8 + %r9] 0x80
	.word 0xce122fc0  ! 629: LDUH_I	lduh	[%r8 + 0x0fc0], %r7
	.word 0xc8b21009  ! 630: STHA_R	stha	%r4, [%r8 + %r9] 0x80
	.word 0xce822218  ! 631: LDUWA_I	lduwa	[%r8, + 0x0218] %asi, %r7
	.word 0x0e800004  ! 632: BVS	bvs  	<label_0x4>
	.word 0x8143e051  ! 633: MEMBAR	membar	#LoadLoad | #Lookaside | #Sync 
	.word 0x8c520009  ! 634: UMUL_R	umul 	%r8, %r9, %r6
	.word 0x04800008  ! 635: BLE	ble  	<label_0x8>
	.word 0xceca1009  ! 636: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r7
	.word 0xa2720009  ! 637: UDIV_R	udiv 	%r8, %r9, %r17
	.word 0xfa6a25c0  ! 638: LDSTUB_I	ldstub	%r29, [%r8 + 0x05c0]
	.word 0x8143c000  ! 639: STBAR	stbar
	.word 0xc36a2158  ! 640: PREFETCH_I	prefetch	[%r8 + 0x0158], #one_read
	.word 0xced21009  ! 641: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r7
	.word 0xcea22f50  ! 642: STWA_I	stwa	%r7, [%r8 + 0x0f50] %asi
	.word 0x00800008  ! 643: BN	bn  	<label_0x8>
	.word 0xf2120009  ! 644: LDUH_R	lduh	[%r8 + %r9], %r25
	.word 0xba520009  ! 646: UMUL_R	umul 	%r8, %r9, %r29
	.word 0xc8aa1009  ! 647: STBA_R	stba	%r4, [%r8 + %r9] 0x80
	.word 0xcaca1009  ! 648: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r5
	.word 0x89a20829  ! 650: FADDs	fadds	%f8, %f9, %f4
	.word 0xccfa24a8  ! 651: SWAPA_I	swapa	%r6, [%r8 + 0x04a8] %asi
	.word 0xc20a2c54  ! 652: LDUB_I	ldub	[%r8 + 0x0c54], %r1
	.word 0x89a20829  ! 653: FADDs	fadds	%f8, %f9, %f4
	.word 0xea5a26e8  ! 654: LDX_I	ldx	[%r8 + 0x06e8], %r21
	.word 0xc3ea26f0  ! 655: PREFETCHA_I	prefetcha	[%r8, + 0x06f0] %asi, #one_read
	.word 0xd49a26b0  ! 656: LDDA_I	ldda	[%r8, + 0x06b0] %asi, %r10
	.word 0xc81a2818  ! 657: LDD_I	ldd	[%r8 + 0x0818], %r4
	.word 0xdfe22009  ! 658: CASA_R	casa	[%r8] %asi, %r9, %r15
	.word 0x8b222ef0  ! 659: MULScc_I	mulscc 	%r8, 0x0ef0, %r5
	.word 0x1c800004  ! 660: BPOS	bpos  	<label_0x4>
	.word 0x2eca0004  ! 661: BRGEZ	brgez,a,pt	%8,<label_0xa0004>
	.word 0x30800004  ! 662: BA	ba,a	<label_0x4>
	.word 0x8c6a2cfc  ! 663: UDIVX_I	udivx 	%r8, 0x0cfc, %r6
	.word 0x12800004  ! 664: BNE	bne  	<label_0x4>
	.word 0x8143e06e  ! 665: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #MemIssue | #Sync 
	.word 0x82d20009  ! 666: UMULcc_R	umulcc 	%r8, %r9, %r1
	.word 0x88f20009  ! 667: UDIVcc_R	udivcc 	%r8, %r9, %r4
	.word 0x86fa0009  ! 668: SDIVcc_R	sdivcc 	%r8, %r9, %r3
	.word 0x0a800004  ! 669: BCS	bcs  	<label_0x4>
	.word 0xeed21009  ! 670: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r23
	.word 0x876a25e0  ! 671: SDIVX_I	sdivx	%r8, 0x05e0, %r3
	.word 0xf81a2cc8  ! 672: LDD_I	ldd	[%r8 + 0x0cc8], %r28
	.word 0x8b6a0009  ! 673: SDIVX_R	sdivx	%r8, %r9, %r5
	.word 0xeea21009  ! 674: STWA_R	stwa	%r23, [%r8 + %r9] 0x80
	.word 0x8da20929  ! 675: FMULs	fmuls	%f8, %f9, %f6
	.word 0xfc9a1009  ! 676: LDDA_R	ldda	[%r8, %r9] 0x80, %r30
	.word 0xba520009  ! 677: UMUL_R	umul 	%r8, %r9, %r29
	.word 0x8c6a20d4  ! 678: UDIVX_I	udivx 	%r8, 0x00d4, %r6
	.word 0x896a2724  ! 679: SDIVX_I	sdivx	%r8, 0x0724, %r4
	.word 0x89a20829  ! 680: FADDs	fadds	%f8, %f9, %f4
	.word 0xf6da2c10  ! 681: LDXA_I	ldxa	[%r8, + 0x0c10] %asi, %r27
	.word 0x8143e07a  ! 682: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0x1e800004  ! 683: BVC	bvc  	<label_0x4>
	.word 0xcc522680  ! 684: LDSH_I	ldsh	[%r8 + 0x0680], %r6
	.word 0xcf3a2f00  ! 685: STDF_I	std	%f7, [0x0f00, %r8]
	.word 0xcea21009  ! 686: STWA_R	stwa	%r7, [%r8 + %r9] 0x80
	.word 0xc36a24cc  ! 687: PREFETCH_I	prefetch	[%r8 + 0x04cc], #one_read
	.word 0x84722c3c  ! 688: UDIV_I	udiv 	%r8, 0x0c3c, %r2
	.word 0xd85a0009  ! 689: LDX_R	ldx	[%r8 + %r9], %r12
	.word 0xfc5a0009  ! 690: LDX_R	ldx	[%r8 + %r9], %r30
	.word 0xccca2304  ! 691: LDSBA_I	ldsba	[%r8, + 0x0304] %asi, %r6
	.word 0xe64a28e4  ! 692: LDSB_I	ldsb	[%r8 + 0x08e4], %r19
	.word 0x82522318  ! 693: UMUL_I	umul 	%r8, 0x0318, %r1
	.word 0xc2120009  ! 694: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0x8143c000  ! 695: STBAR	stbar
	.word 0xc2d21009  ! 696: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r1
	.word 0x04ca0004  ! 697: BRLEZ	brlez  ,pt	%8,<label_0xa0004>
	.word 0x8143c000  ! 698: STBAR	stbar
	.word 0xc36a242c  ! 699: PREFETCH_I	prefetch	[%r8 + 0x042c], #one_read
	.word 0x847a2924  ! 700: SDIV_I	sdiv 	%r8, 0x0924, %r2
	.word 0x89a209a9  ! 701: FDIVs	fdivs	%f8, %f9, %f4
	.word 0xc4ea1009  ! 703: LDSTUBA_R	ldstuba	%r2, [%r8 + %r9] 0x80
	.word 0xc4d21009  ! 704: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r2
	.word 0xa5a20929  ! 705: FMULs	fmuls	%f8, %f9, %f18
	.word 0xa1222a68  ! 706: MULScc_I	mulscc 	%r8, 0x0a68, %r16
	.word 0x20800008  ! 707: BN	bn,a	<label_0x8>
	.word 0x40000004  ! 708: CALL	call	disp30_4
	.word 0xc2520009  ! 710: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0x8a7a2250  ! 711: SDIV_I	sdiv 	%r8, 0x0250, %r5
	.word 0x10800008  ! 712: BA	ba  	<label_0x8>
	.word 0xc60a25a4  ! 713: LDUB_I	ldub	[%r8 + 0x05a4], %r3
	.word 0x18800004  ! 714: BGU	bgu  	<label_0x4>
	.word 0xf41a0009  ! 715: LDD_R	ldd	[%r8 + %r9], %r26
	.word 0xc9e22009  ! 716: CASA_R	casa	[%r8] %asi, %r9, %r4
	.word 0x8143e041  ! 717: MEMBAR	membar	#LoadLoad | #Sync 
	.word 0x8143c000  ! 718: STBAR	stbar
	.word 0x9da209a9  ! 719: FDIVs	fdivs	%f8, %f9, %f14
	.word 0x9fa20829  ! 720: FADDs	fadds	%f8, %f9, %f15
	.word 0x887a0009  ! 721: SDIV_R	sdiv 	%r8, %r9, %r4
	.word 0xca420009  ! 722: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0x22800004  ! 723: BE	be,a	<label_0x4>
	.word 0xdaa21009  ! 724: STWA_R	stwa	%r13, [%r8 + %r9] 0x80
	.word 0xce120009  ! 725: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0x2cca0008  ! 726: BRGZ	brgz,a,pt	%8,<label_0xa0008>
	.word 0xf88a1009  ! 727: LDUBA_R	lduba	[%r8, %r9] 0x80, %r28
	.word 0x8c522d4c  ! 728: UMUL_I	umul 	%r8, 0x0d4c, %r6
	.word 0xc4120009  ! 729: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xddf22009  ! 730: CASXA_R	casxa	[%r8]%asi, %r9, %r14
	.word 0x8d6a0009  ! 731: SDIVX_R	sdivx	%r8, %r9, %r6
	.word 0x8143e043  ! 732: MEMBAR	membar	#LoadLoad | #StoreLoad | #Sync 
	.word 0x82522558  ! 733: UMUL_I	umul 	%r8, 0x0558, %r1
	.word 0xc36a20fc  ! 734: PREFETCH_I	prefetch	[%r8 + 0x00fc], #one_read
	.word 0x82da2f34  ! 735: SMULcc_I	smulcc 	%r8, 0x0f34, %r1
	.word 0x876a0009  ! 736: SDIVX_R	sdivx	%r8, %r9, %r3
	.word 0x83a20829  ! 737: FADDs	fadds	%f8, %f9, %f1
	.word 0xc47a2fdc  ! 738: SWAP_I	swap	%r2, [%r8 + 0x0fdc]
	.word 0xee7a23f4  ! 739: SWAP_I	swap	%r23, [%r8 + 0x03f4]
	.word 0x88fa2230  ! 740: SDIVcc_I	sdivcc 	%r8, 0x0230, %r4
	.word 0xca5a0009  ! 741: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0x8143e01e  ! 742: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside 
	.word 0x826a0009  ! 743: UDIVX_R	udivx 	%r8, %r9, %r1
	.word 0xc33a0009  ! 744: STDF_R	std	%f1, [%r9, %r8]
	.word 0x82d22da8  ! 745: UMULcc_I	umulcc 	%r8, 0x0da8, %r1
	.word 0xbc6a0009  ! 746: UDIVX_R	udivx 	%r8, %r9, %r30
	.word 0xc3ea2810  ! 747: PREFETCHA_I	prefetcha	[%r8, + 0x0810] %asi, #one_read
	.word 0x8f6a0009  ! 748: SDIVX_R	sdivx	%r8, %r9, %r7
	.word 0x26c20008  ! 749: BRLZ	brlz,a,nt	%8,<label_0x20008>
	.word 0x3e800008  ! 750: BVC	bvc,a	<label_0x8>
	.word 0x8ada0009  ! 751: SMULcc_R	smulcc 	%r8, %r9, %r5
	.word 0xca120009  ! 752: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xe08a2a14  ! 753: LDUBA_I	lduba	[%r8, + 0x0a14] %asi, %r16
	.word 0xe44222c8  ! 754: LDSW_I	ldsw	[%r8 + 0x02c8], %r18
	.word 0xc67a0009  ! 756: SWAP_R	swap	%r3, [%r8 + %r9]
	.word 0xd86a2e4c  ! 757: LDSTUB_I	ldstub	%r12, [%r8 + 0x0e4c]
	.word 0xce020009  ! 759: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xc64a0009  ! 760: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xc3ea21a0  ! 761: PREFETCHA_I	prefetcha	[%r8, + 0x01a0] %asi, #one_read
	.word 0xce420009  ! 762: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xe9f22009  ! 763: CASXA_R	casxa	[%r8]%asi, %r9, %r20
	.word 0xce6a0009  ! 764: LDSTUB_R	ldstub	%r7, [%r8 + %r9]
	.word 0x83a209a9  ! 765: FDIVs	fdivs	%f8, %f9, %f1
	.word 0xaada2928  ! 767: SMULcc_I	smulcc 	%r8, 0x0928, %r21
	.word 0xc6f21009  ! 768: STXA_R	stxa	%r3, [%r8 + %r9] 0x80
	.word 0x2c800008  ! 769: BNEG	bneg,a	<label_0x8>
	.word 0x8a722ce0  ! 770: UDIV_I	udiv 	%r8, 0x0ce0, %r5
	.word 0xd8a22118  ! 773: STWA_I	stwa	%r12, [%r8 + 0x0118] %asi
	.word 0xc53a2e38  ! 774: STDF_I	std	%f2, [0x0e38, %r8]
	.word 0xcb3a0009  ! 776: STDF_R	std	%f5, [%r9, %r8]
	.word 0xc81a0009  ! 777: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xe2da1009  ! 778: LDXA_R	ldxa	[%r8, %r9] 0x80, %r17
	.word 0xd87a24d4  ! 779: SWAP_I	swap	%r12, [%r8 + 0x04d4]
	.word 0xf13a0009  ! 780: STDF_R	std	%f24, [%r9, %r8]
	.word 0xc7220009  ! 781: STF_R	st	%f3, [%r9, %r8]
	.word 0xce422430  ! 782: LDSW_I	ldsw	[%r8 + 0x0430], %r7
	.word 0xb3222e7c  ! 783: MULScc_I	mulscc 	%r8, 0x0e7c, %r25
	.word 0xc2b227f4  ! 784: STHA_I	stha	%r1, [%r8 + 0x07f4] %asi
	.word 0xce822c34  ! 785: LDUWA_I	lduwa	[%r8, + 0x0c34] %asi, %r7
	.word 0x8143c000  ! 786: STBAR	stbar
	.word 0x8143c000  ! 787: STBAR	stbar
	.word 0xcf220009  ! 788: STF_R	st	%f7, [%r9, %r8]
	.word 0x0ec20004  ! 789: BRGEZ	brgez  ,nt	%8,<label_0x20004>
	.word 0xc2aa2ee4  ! 790: STBA_I	stba	%r1, [%r8 + 0x0ee4] %asi
	.word 0xeeea1009  ! 791: LDSTUBA_R	ldstuba	%r23, [%r8 + %r9] 0x80
	.word 0xca7a256c  ! 792: SWAP_I	swap	%r5, [%r8 + 0x056c]
	.word 0x88f229d8  ! 793: UDIVcc_I	udivcc 	%r8, 0x09d8, %r4
	.word 0xc3ea23fc  ! 794: PREFETCHA_I	prefetcha	[%r8, + 0x03fc] %asi, #one_read
	.word 0x8143e034  ! 795: MEMBAR	membar	#LoadStore | #Lookaside | #MemIssue 
	.word 0xdeb22a14  ! 796: STHA_I	stha	%r15, [%r8 + 0x0a14] %asi
	.word 0x85a209a9  ! 797: FDIVs	fdivs	%f8, %f9, %f2
	.word 0xc7f22009  ! 798: CASXA_R	casxa	[%r8]%asi, %r9, %r3
	.word 0x8eda2cc8  ! 799: SMULcc_I	smulcc 	%r8, 0x0cc8, %r7
	.word 0xf68a2a10  ! 800: LDUBA_I	lduba	[%r8, + 0x0a10] %asi, %r27
	.word 0xd8b21009  ! 801: STHA_R	stha	%r12, [%r8 + %r9] 0x80
	.word 0xc25a0009  ! 803: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0x12800008  ! 804: BNE	bne  	<label_0x8>
	.word 0xcaca1009  ! 806: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r5
	.word 0x8e7a2b2c  ! 807: SDIV_I	sdiv 	%r8, 0x0b2c, %r7
	.word 0x8143c000  ! 808: STBAR	stbar
	.word 0xa2da25d8  ! 809: SMULcc_I	smulcc 	%r8, 0x05d8, %r17
	.word 0xc5e21009  ! 810: CASA_I	casa	[%r8] 0x80, %r9, %r2
	.word 0xe9e22009  ! 811: CASA_R	casa	[%r8] %asi, %r9, %r20
	.word 0xc36a2f74  ! 812: PREFETCH_I	prefetch	[%r8 + 0x0f74], #one_read
	.word 0x8143c000  ! 813: STBAR	stbar
	.word 0x8143e045  ! 814: MEMBAR	membar	#LoadLoad | #LoadStore | #Sync 
	.word 0xc81a2c28  ! 816: LDD_I	ldd	[%r8 + 0x0c28], %r4
	.word 0xc68a24b4  ! 817: LDUBA_I	lduba	[%r8, + 0x04b4] %asi, %r3
	.word 0xc6420009  ! 818: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xf8a22524  ! 819: STWA_I	stwa	%r28, [%r8 + 0x0524] %asi
	.word 0xc44a0009  ! 820: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xcaea1009  ! 821: LDSTUBA_R	ldstuba	%r5, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 822: STBAR	stbar
	.word 0xf8ba22a8  ! 823: STDA_I	stda	%r28, [%r8 + 0x02a8] %asi
	.word 0xc2b21009  ! 824: STHA_R	stha	%r1, [%r8 + %r9] 0x80
	.word 0x2c800004  ! 825: BNEG	bneg,a	<label_0x4>
	.word 0xcf2222fc  ! 826: STF_I	st	%f7, [0x02fc, %r8]
	.word 0xccda2d10  ! 827: LDXA_I	ldxa	[%r8, + 0x0d10] %asi, %r6
	.word 0xea022964  ! 828: LDUW_I	lduw	[%r8 + 0x0964], %r21
	.word 0x8a6a216c  ! 829: UDIVX_I	udivx 	%r8, 0x016c, %r5
	.word 0xc8122ac4  ! 830: LDUH_I	lduh	[%r8 + 0x0ac4], %r4
	.word 0xed3a0009  ! 831: STDF_R	std	%f22, [%r9, %r8]
	.word 0xf09a2f08  ! 832: LDDA_I	ldda	[%r8, + 0x0f08] %asi, %r24
	.word 0x9ba208a9  ! 833: FSUBs	fsubs	%f8, %f9, %f13
	.word 0x8143e01b  ! 834: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Lookaside 
	.word 0xc8fa2500  ! 835: SWAPA_I	swapa	%r4, [%r8 + 0x0500] %asi
	.word 0xe2c21009  ! 836: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r17
	.word 0xbad20009  ! 837: UMULcc_R	umulcc 	%r8, %r9, %r29
	.word 0xf0ba1009  ! 838: STDA_R	stda	%r24, [%r8 + %r9] 0x80
	.word 0x8143e00a  ! 839: MEMBAR	membar	#StoreLoad | #StoreStore 
	.word 0xa6520009  ! 840: UMUL_R	umul 	%r8, %r9, %r19
	.word 0xccea24c4  ! 841: LDSTUBA_I	ldstuba	%r6, [%r8 + 0x04c4] %asi
	.word 0x8143e043  ! 842: MEMBAR	membar	#LoadLoad | #StoreLoad | #Sync 
	.word 0xd81a2b18  ! 843: LDD_I	ldd	[%r8 + 0x0b18], %r12
	.word 0x87a20829  ! 844: FADDs	fadds	%f8, %f9, %f3
	.word 0xc5e21009  ! 845: CASA_I	casa	[%r8] 0x80, %r9, %r2
	.word 0x8cda2390  ! 846: SMULcc_I	smulcc 	%r8, 0x0390, %r6
	.word 0xc69225dc  ! 847: LDUHA_I	lduha	[%r8, + 0x05dc] %asi, %r3
	.word 0xc4ba26e0  ! 848: STDA_I	stda	%r2, [%r8 + 0x06e0] %asi
	.word 0xc25a2f60  ! 849: LDX_I	ldx	[%r8 + 0x0f60], %r1
	.word 0xd87a0009  ! 850: SWAP_R	swap	%r12, [%r8 + %r9]
	.word 0xc4a21009  ! 851: STWA_R	stwa	%r2, [%r8 + %r9] 0x80
	.word 0xca5a2bc8  ! 852: LDX_I	ldx	[%r8 + 0x0bc8], %r5
	.word 0x88da281c  ! 853: SMULcc_I	smulcc 	%r8, 0x081c, %r4
	.word 0x8143c000  ! 854: STBAR	stbar
	.word 0xdc6a25ac  ! 855: LDSTUB_I	ldstub	%r14, [%r8 + 0x05ac]
	.word 0x40000008  ! 856: CALL	call	disp30_8
	.word 0xc36a2b40  ! 857: PREFETCH_I	prefetch	[%r8 + 0x0b40], #one_read
	.word 0xc6821009  ! 858: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r3
	.word 0xe6fa2780  ! 859: SWAPA_I	swapa	%r19, [%r8 + 0x0780] %asi
	.word 0xcaca1009  ! 860: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r5
	.word 0x30800008  ! 861: BA	ba,a	<label_0x8>
	.word 0xfada22f8  ! 862: LDXA_I	ldxa	[%r8, + 0x02f8] %asi, %r29
	.word 0xc2f22a68  ! 863: STXA_I	stxa	%r1, [%r8 + 0x0a68] %asi
	.word 0xc2a22734  ! 864: STWA_I	stwa	%r1, [%r8 + 0x0734] %asi
	.word 0xaafa0009  ! 865: SDIVcc_R	sdivcc 	%r8, %r9, %r21
	.word 0xdea22120  ! 866: STWA_I	stwa	%r15, [%r8 + 0x0120] %asi
	.word 0x8143e067  ! 867: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #MemIssue | #Sync 
	.word 0xc2f21009  ! 868: STXA_R	stxa	%r1, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 869: STBAR	stbar
	.word 0x8143e05d  ! 870: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0xf5222ba0  ! 871: STF_I	st	%f26, [0x0ba0, %r8]
	.word 0xc4ba2398  ! 872: STDA_I	stda	%r2, [%r8 + 0x0398] %asi
	.word 0x8143c000  ! 873: STBAR	stbar
	.word 0xc3ea2604  ! 874: PREFETCHA_I	prefetcha	[%r8, + 0x0604] %asi, #one_read
	.word 0xd4ba1009  ! 875: STDA_R	stda	%r10, [%r8 + %r9] 0x80
	.word 0xfe4a0009  ! 876: LDSB_R	ldsb	[%r8 + %r9], %r31
	.word 0xcaea1009  ! 877: LDSTUBA_R	ldstuba	%r5, [%r8 + %r9] 0x80
	.word 0xc49a1009  ! 878: LDDA_R	ldda	[%r8, %r9] 0x80, %r2
	.word 0x8d6a27e8  ! 879: SDIVX_I	sdivx	%r8, 0x07e8, %r6
	.word 0x856a0009  ! 880: SDIVX_R	sdivx	%r8, %r9, %r2
	.word 0x8a522e84  ! 881: UMUL_I	umul 	%r8, 0x0e84, %r5
	.word 0x97a209a9  ! 882: FDIVs	fdivs	%f8, %f9, %f11
	.word 0xc73a2438  ! 883: STDF_I	std	%f3, [0x0438, %r8]
	.word 0xcfe22009  ! 885: CASA_R	casa	[%r8] %asi, %r9, %r7
	.word 0xf47a2118  ! 886: SWAP_I	swap	%r26, [%r8 + 0x0118]
	.word 0xe68a1009  ! 887: LDUBA_R	lduba	[%r8, %r9] 0x80, %r19
	.word 0xe0522d08  ! 888: LDSH_I	ldsh	[%r8 + 0x0d08], %r16
	.word 0x844a217c  ! 889: MULX_I	mulx 	%r8, 0x017c, %r2
	.word 0xc36a2ae8  ! 890: PREFETCH_I	prefetch	[%r8 + 0x0ae8], #one_read
	.word 0xceea1009  ! 891: LDSTUBA_R	ldstuba	%r7, [%r8 + %r9] 0x80
	.word 0x8cd20009  ! 893: UMULcc_R	umulcc 	%r8, %r9, %r6
	.word 0xc8522954  ! 894: LDSH_I	ldsh	[%r8 + 0x0954], %r4
	.word 0x8143e048  ! 895: MEMBAR	membar	#StoreStore | #Sync 
	.word 0x85a20929  ! 896: FMULs	fmuls	%f8, %f9, %f2
	.word 0x8143e075  ! 897: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside | #MemIssue | #Sync 
	.word 0xcb3a2df0  ! 898: STDF_I	std	%f5, [0x0df0, %r8]
	.word 0xd4120009  ! 899: LDUH_R	lduh	[%r8 + %r9], %r10
	.word 0xcad222ac  ! 900: LDSHA_I	ldsha	[%r8, + 0x02ac] %asi, %r5
	.word 0xce422594  ! 901: LDSW_I	ldsw	[%r8 + 0x0594], %r7
	.word 0xce821009  ! 902: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r7
	.word 0x26800004  ! 903: BL	bl,a	<label_0x4>
	.word 0xc80a2170  ! 904: LDUB_I	ldub	[%r8 + 0x0170], %r4
	.word 0x04800004  ! 905: BLE	ble  	<label_0x4>
	.word 0xce7a2d60  ! 906: SWAP_I	swap	%r7, [%r8 + 0x0d60]
	.word 0xc2921009  ! 907: LDUHA_R	lduha	[%r8, %r9] 0x80, %r1
	.word 0xc86a0009  ! 908: LDSTUB_R	ldstub	%r4, [%r8 + %r9]
	.word 0xe93a0009  ! 909: STDF_R	std	%f20, [%r9, %r8]
	.word 0x826a26c0  ! 910: UDIVX_I	udivx 	%r8, 0x06c0, %r1
	.word 0xca6a242c  ! 911: LDSTUB_I	ldstub	%r5, [%r8 + 0x042c]
	.word 0xc2c22d5c  ! 912: LDSWA_I	ldswa	[%r8, + 0x0d5c] %asi, %r1
	.word 0x8c522870  ! 913: UMUL_I	umul 	%r8, 0x0870, %r6
	.word 0xca420009  ! 914: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xcc0a2114  ! 915: LDUB_I	ldub	[%r8 + 0x0114], %r6
	.word 0xc2022268  ! 916: LDUW_I	lduw	[%r8 + 0x0268], %r1
	.word 0x8143c000  ! 917: STBAR	stbar
	.word 0xfc0225bc  ! 918: LDUW_I	lduw	[%r8 + 0x05bc], %r30
	.word 0x3e800004  ! 919: BVC	bvc,a	<label_0x4>
	.word 0x8da209a9  ! 920: FDIVs	fdivs	%f8, %f9, %f6
	.word 0x8143e06d  ! 921: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #MemIssue | #Sync 
	.word 0xc36a2584  ! 922: PREFETCH_I	prefetch	[%r8 + 0x0584], #one_read
	.word 0x87a20929  ! 923: FMULs	fmuls	%f8, %f9, %f3
	.word 0xc3e22009  ! 924: CASA_R	casa	[%r8] %asi, %r9, %r1
	.word 0xcafa280c  ! 925: SWAPA_I	swapa	%r5, [%r8 + 0x080c] %asi
	.word 0x06c20008  ! 927: BRLZ	brlz  ,nt	%8,<label_0x20008>
	.word 0x84d227dc  ! 928: UMULcc_I	umulcc 	%r8, 0x07dc, %r2
	.word 0xc2522ed8  ! 929: LDSH_I	ldsh	[%r8 + 0x0ed8], %r1
	.word 0x8143c000  ! 930: STBAR	stbar
	.word 0x1e800004  ! 931: BVC	bvc  	<label_0x4>
	.word 0x8e6a2154  ! 932: UDIVX_I	udivx 	%r8, 0x0154, %r7
	.word 0x9cda0009  ! 933: SMULcc_R	smulcc 	%r8, %r9, %r14
	.word 0xa4fa0009  ! 935: SDIVcc_R	sdivcc 	%r8, %r9, %r18
	.word 0x30800004  ! 936: BA	ba,a	<label_0x4>
	.word 0xcbf21009  ! 937: CASXA_I	casxa	[%r8] 0x80, %r9, %r5
	.word 0x885a0009  ! 938: SMUL_R	smul 	%r8, %r9, %r4
	.word 0xc6c21009  ! 939: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r3
	.word 0xecba1009  ! 940: STDA_R	stda	%r22, [%r8 + %r9] 0x80
	.word 0x9b220009  ! 941: MULScc_R	mulscc 	%r8, %r9, %r13
	.word 0x0cca0008  ! 942: BRGZ	brgz  ,pt	%8,<label_0xa0008>
	.word 0xec5a2af0  ! 943: LDX_I	ldx	[%r8 + 0x0af0], %r22
	.word 0x38800004  ! 944: BGU	bgu,a	<label_0x4>
	.word 0x9efa29b0  ! 945: SDIVcc_I	sdivcc 	%r8, 0x09b0, %r15
	.word 0xc49a2870  ! 946: LDDA_I	ldda	[%r8, + 0x0870] %asi, %r2
	.word 0xce522e9c  ! 947: LDSH_I	ldsh	[%r8 + 0x0e9c], %r7
	.word 0xc28228b0  ! 948: LDUWA_I	lduwa	[%r8, + 0x08b0] %asi, %r1
	.word 0xc5222e50  ! 949: STF_I	st	%f2, [0x0e50, %r8]
	.word 0x24c20004  ! 950: BRLEZ	brlez,a,nt	%8,<label_0x20004>
	.word 0x8143c000  ! 951: STBAR	stbar
	.word 0x1e800004  ! 952: BVC	bvc  	<label_0x4>
	.word 0xf53a0009  ! 953: STDF_R	std	%f26, [%r9, %r8]
	.word 0xaa520009  ! 954: UMUL_R	umul 	%r8, %r9, %r21
	.word 0xaba20929  ! 955: FMULs	fmuls	%f8, %f9, %f21
	.word 0x865a0009  ! 956: SMUL_R	smul 	%r8, %r9, %r3
	.word 0xc47a0009  ! 957: SWAP_R	swap	%r2, [%r8 + %r9]
	.word 0x8cf20009  ! 958: UDIVcc_R	udivcc 	%r8, %r9, %r6
	.word 0xc9f22009  ! 959: CASXA_R	casxa	[%r8]%asi, %r9, %r4
	.word 0xf2d21009  ! 960: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r25
	.word 0xd64a0009  ! 961: LDSB_R	ldsb	[%r8 + %r9], %r11
	.word 0x83a20929  ! 962: FMULs	fmuls	%f8, %f9, %f1
	.word 0xc3222c64  ! 963: STF_I	st	%f1, [0x0c64, %r8]
	.word 0x8143c000  ! 964: STBAR	stbar
	.word 0x8a4a2c5c  ! 965: MULX_I	mulx 	%r8, 0x0c5c, %r5
	.word 0xc3ea2bc0  ! 966: PREFETCHA_I	prefetcha	[%r8, + 0x0bc0] %asi, #one_read
	.word 0x8c4a0009  ! 967: MULX_R	mulx 	%r8, %r9, %r6
	.word 0xf8aa1009  ! 968: STBA_R	stba	%r28, [%r8 + %r9] 0x80
	.word 0xcd220009  ! 969: STF_R	st	%f6, [%r9, %r8]
	.word 0xcf2222a8  ! 971: STF_I	st	%f7, [0x02a8, %r8]
	.word 0xceb21009  ! 972: STHA_R	stha	%r7, [%r8 + %r9] 0x80
	.word 0xe6d224cc  ! 973: LDSHA_I	ldsha	[%r8, + 0x04cc] %asi, %r19
	.word 0xbfa20929  ! 974: FMULs	fmuls	%f8, %f9, %f31
	.word 0xecda26b0  ! 975: LDXA_I	ldxa	[%r8, + 0x06b0] %asi, %r22
	.word 0xe2d21009  ! 976: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r17
	.word 0x8143e067  ! 978: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #MemIssue | #Sync 
	.word 0x8143c000  ! 980: STBAR	stbar
	.word 0xe8a223b4  ! 981: STWA_I	stwa	%r20, [%r8 + 0x03b4] %asi
	.word 0xfaa21009  ! 982: STWA_R	stwa	%r29, [%r8 + %r9] 0x80
	.word 0x8fa20929  ! 983: FMULs	fmuls	%f8, %f9, %f7
	.word 0xc6b21009  ! 984: STHA_R	stha	%r3, [%r8 + %r9] 0x80
	.word 0x8a6a0009  ! 985: UDIVX_R	udivx 	%r8, %r9, %r5
	.word 0x8a4a2234  ! 986: MULX_I	mulx 	%r8, 0x0234, %r5
	.word 0x1c800008  ! 987: BPOS	bpos  	<label_0x8>
	.word 0xf64a2a78  ! 988: LDSB_I	ldsb	[%r8 + 0x0a78], %r27
	.word 0x876a2948  ! 989: SDIVX_I	sdivx	%r8, 0x0948, %r3
	.word 0x24800008  ! 990: BLE	ble,a	<label_0x8>
	.word 0xf28a1009  ! 991: LDUBA_R	lduba	[%r8, %r9] 0x80, %r25
	.word 0x8fa208a9  ! 992: FSUBs	fsubs	%f8, %f9, %f7
	.word 0x1e800004  ! 993: BVC	bvc  	<label_0x4>
	.word 0xffe21009  ! 994: CASA_I	casa	[%r8] 0x80, %r9, %r31
	.word 0x8143e009  ! 995: MEMBAR	membar	#LoadLoad | #StoreStore 
	.word 0xccc21009  ! 996: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r6
	.word 0x3a800008  ! 997: BCC	bcc,a	<label_0x8>
	.word 0xa4f20009  ! 998: UDIVcc_R	udivcc 	%r8, %r9, %r18
	.word 0xf8420009  ! 999: LDSW_R	ldsw	[%r8 + %r9], %r28
	nop
	nop
	nop
	nop
        ta      T_GOOD_TRAP

th_main_3:
        setx  MAIN_BASE_DATA_VA, %r1, %r8
        setx  0x0000000000000cd0, %g1, %r9
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
        setx  0x33cb1f8071b35edd, %g1, %r0
        setx  0x0e7be789803b417d, %g1, %r1
        setx  0xabbb9abb30f87365, %g1, %r2
        setx  0xf5173615be6aa16b, %g1, %r3
        setx  0x3e1972bb81f947ed, %g1, %r4
        setx  0x0ce424f01bf1cc9a, %g1, %r5
        setx  0xbed8146078ec9fd6, %g1, %r6
        setx  0xf14435afa650f3e7, %g1, %r7
        setx  0x512afbef9f84b85d, %g1, %r10
        setx  0x4dda27e7eaf993f0, %g1, %r11
        setx  0x35e864adf825efd8, %g1, %r12
        setx  0x7fbf90e045c1c6c7, %g1, %r13
        setx  0xf59ae8315f732b5b, %g1, %r14
        setx  0x0f260f41bb4347f6, %g1, %r15
        setx  0x33da9c182dae6f2c, %g1, %r16
        setx  0xd874ff50228eed2f, %g1, %r17
        setx  0x90a69c931d2e2cb5, %g1, %r18
        setx  0x635256e70ff82306, %g1, %r19
        setx  0x4841c6397d6fef8e, %g1, %r20
        setx  0x68bf0a73d4ec0390, %g1, %r21
        setx  0x24dd5d4cf89898df, %g1, %r22
        setx  0x99c5fcee338013cc, %g1, %r23
        setx  0x39ff43ba58de4606, %g1, %r24
        setx  0x1b75e36aa91f41d4, %g1, %r25
        setx  0x8b12ae0472bd77a8, %g1, %r26
        setx  0xb3ad64edf1bf18d5, %g1, %r27
        setx  0x958c3aba462efe68, %g1, %r28
        setx  0x86749a78c0cece3b, %g1, %r29
        setx  0xda0797d315021593, %g1, %r30
        setx  0xf7182f59d1386a36, %g1, %r31
	.word 0xd4921009  ! 6: LDUHA_R	lduha	[%r8, %r9] 0x80, %r10
	.word 0xc65a0009  ! 7: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xc4d22470  ! 8: LDSHA_I	ldsha	[%r8, + 0x0470] %asi, %r2
	.word 0x8143c000  ! 9: STBAR	stbar
	.word 0xc6522ba8  ! 10: LDSH_I	ldsh	[%r8 + 0x0ba8], %r3
	.word 0xbe5a2354  ! 11: SMUL_I	smul 	%r8, 0x0354, %r31
	.word 0xc6ca2b50  ! 12: LDSBA_I	ldsba	[%r8, + 0x0b50] %asi, %r3
	.word 0x8f220009  ! 13: MULScc_R	mulscc 	%r8, %r9, %r7
	.word 0x22c20004  ! 14: BRZ	brz,a,nt	%8,<label_0x20004>
	.word 0x8e6a28fc  ! 15: UDIVX_I	udivx 	%r8, 0x08fc, %r7
	.word 0x964a0009  ! 16: MULX_R	mulx 	%r8, %r9, %r11
	.word 0xd65a2e58  ! 17: LDX_I	ldx	[%r8 + 0x0e58], %r11
	.word 0xc85a29d0  ! 18: LDX_I	ldx	[%r8 + 0x09d0], %r4
	.word 0xccaa201c  ! 19: STBA_I	stba	%r6, [%r8 + 0x001c] %asi
	.word 0x8c7a0009  ! 20: SDIV_R	sdiv 	%r8, %r9, %r6
	.word 0x8143c000  ! 21: STBAR	stbar
	.word 0xc4a22134  ! 22: STWA_I	stwa	%r2, [%r8 + 0x0134] %asi
	.word 0xf6fa2484  ! 23: SWAPA_I	swapa	%r27, [%r8 + 0x0484] %asi
	.word 0x8e720009  ! 24: UDIV_R	udiv 	%r8, %r9, %r7
	.word 0x06800004  ! 25: BL	bl  	<label_0x4>
	.word 0xc6aa24d0  ! 26: STBA_I	stba	%r3, [%r8 + 0x04d0] %asi
	.word 0xc36a2ea8  ! 27: PREFETCH_I	prefetch	[%r8 + 0x0ea8], #one_read
	.word 0x84fa2b14  ! 28: SDIVcc_I	sdivcc 	%r8, 0x0b14, %r2
	.word 0x8143c000  ! 29: STBAR	stbar
	.word 0x8efa0009  ! 30: SDIVcc_R	sdivcc 	%r8, %r9, %r7
	.word 0xf0ba2918  ! 31: STDA_I	stda	%r24, [%r8 + 0x0918] %asi
	.word 0x0c800008  ! 32: BNEG	bneg  	<label_0x8>
	.word 0x8143e072  ! 33: MEMBAR	membar	#StoreLoad | #Lookaside | #MemIssue | #Sync 
	.word 0xb3a208a9  ! 34: FSUBs	fsubs	%f8, %f9, %f25
	.word 0x0c800004  ! 35: BNEG	bneg  	<label_0x4>
	.word 0xf93a0009  ! 36: STDF_R	std	%f28, [%r9, %r8]
	.word 0x8a720009  ! 37: UDIV_R	udiv 	%r8, %r9, %r5
	.word 0xc87a0009  ! 38: SWAP_R	swap	%r4, [%r8 + %r9]
	.word 0xb45a2b94  ! 39: SMUL_I	smul 	%r8, 0x0b94, %r26
	.word 0x864a0009  ! 40: MULX_R	mulx 	%r8, %r9, %r3
	.word 0x8ba208a9  ! 41: FSUBs	fsubs	%f8, %f9, %f5
	.word 0x10800004  ! 42: BA	ba  	<label_0x4>
	.word 0xc3ea20e8  ! 43: PREFETCHA_I	prefetcha	[%r8, + 0x00e8] %asi, #one_read
	.word 0xdcca1009  ! 44: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r14
	.word 0x8cd20009  ! 45: UMULcc_R	umulcc 	%r8, %r9, %r6
	.word 0x8143c000  ! 46: STBAR	stbar
	.word 0x8c6a29c4  ! 47: UDIVX_I	udivx 	%r8, 0x09c4, %r6
	.word 0xc2520009  ! 48: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xfeea1009  ! 49: LDSTUBA_R	ldstuba	%r31, [%r8 + %r9] 0x80
	.word 0x8143e067  ! 50: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #MemIssue | #Sync 
	.word 0x84f220c8  ! 51: UDIVcc_I	udivcc 	%r8, 0x00c8, %r2
	.word 0x8143c000  ! 52: STBAR	stbar
	.word 0x36800004  ! 53: BGE	bge,a	<label_0x4>
	.word 0x8143e029  ! 54: MEMBAR	membar	#LoadLoad | #StoreStore | #MemIssue 
	.word 0x8143e072  ! 55: MEMBAR	membar	#StoreLoad | #Lookaside | #MemIssue | #Sync 
	.word 0xa84a2c14  ! 56: MULX_I	mulx 	%r8, 0x0c14, %r20
	.word 0xc6ca2fa4  ! 57: LDSBA_I	ldsba	[%r8, + 0x0fa4] %asi, %r3
	.word 0x3a800004  ! 58: BCC	bcc,a	<label_0x4>
	.word 0xc4a21009  ! 59: STWA_R	stwa	%r2, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 60: STBAR	stbar
	.word 0xe7220009  ! 61: STF_R	st	%f19, [%r9, %r8]
	.word 0x8a520009  ! 62: UMUL_R	umul 	%r8, %r9, %r5
	.word 0xe12225e0  ! 63: STF_I	st	%f16, [0x05e0, %r8]
	.word 0x18800004  ! 64: BGU	bgu  	<label_0x4>
	.word 0xb2520009  ! 65: UMUL_R	umul 	%r8, %r9, %r25
	.word 0x84720009  ! 66: UDIV_R	udiv 	%r8, %r9, %r2
	.word 0xca7a21f8  ! 67: SWAP_I	swap	%r5, [%r8 + 0x01f8]
	.word 0x8ba208a9  ! 68: FSUBs	fsubs	%f8, %f9, %f5
	.word 0x88f20009  ! 69: UDIVcc_R	udivcc 	%r8, %r9, %r4
	.word 0x8afa0009  ! 70: SDIVcc_R	sdivcc 	%r8, %r9, %r5
	.word 0xdcd21009  ! 71: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r14
	.word 0x0c800008  ! 72: BNEG	bneg  	<label_0x8>
	.word 0xd84a2930  ! 73: LDSB_I	ldsb	[%r8 + 0x0930], %r12
	.word 0x32800004  ! 74: BNE	bne,a	<label_0x4>
	.word 0xc36a2c20  ! 75: PREFETCH_I	prefetch	[%r8 + 0x0c20], #one_read
	.word 0x8143e059  ! 76: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside | #Sync 
	.word 0x32800004  ! 77: BNE	bne,a	<label_0x4>
	.word 0xc4b223cc  ! 78: STHA_I	stha	%r2, [%r8 + 0x03cc] %asi
	.word 0x8143e062  ! 79: MEMBAR	membar	#StoreLoad | #MemIssue | #Sync 
	.word 0x08800004  ! 81: BLEU	bleu  	<label_0x4>
	.word 0xc8f21009  ! 83: STXA_R	stxa	%r4, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 84: STBAR	stbar
	.word 0xcbe21009  ! 85: CASA_I	casa	[%r8] 0x80, %r9, %r5
	.word 0xc6a21009  ! 86: STWA_R	stwa	%r3, [%r8 + %r9] 0x80
	.word 0xe09a1009  ! 88: LDDA_R	ldda	[%r8, %r9] 0x80, %r16
	.word 0xc5f22009  ! 90: CASXA_R	casxa	[%r8]%asi, %r9, %r2
	.word 0x06ca0008  ! 91: BRLZ	brlz  ,pt	%8,<label_0xa0008>
	.word 0xccc22888  ! 92: LDSWA_I	ldswa	[%r8, + 0x0888] %asi, %r6
	.word 0xc3ea2eac  ! 93: PREFETCHA_I	prefetcha	[%r8, + 0x0eac] %asi, #one_read
	.word 0xc8aa1009  ! 94: STBA_R	stba	%r4, [%r8 + %r9] 0x80
	.word 0x8c7a28f0  ! 95: SDIV_I	sdiv 	%r8, 0x08f0, %r6
	.word 0xc4ca2204  ! 96: LDSBA_I	ldsba	[%r8, + 0x0204] %asi, %r2
	.word 0xe00a0009  ! 97: LDUB_R	ldub	[%r8 + %r9], %r16
	.word 0xcc120009  ! 98: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xbe4a0009  ! 99: MULX_R	mulx 	%r8, %r9, %r31
	.word 0xe84a0009  ! 100: LDSB_R	ldsb	[%r8 + %r9], %r20
	.word 0x8143e05a  ! 101: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside | #Sync 
	.word 0xb27a0009  ! 102: SDIV_R	sdiv 	%r8, %r9, %r25
	.word 0xc8ea1009  ! 103: LDSTUBA_R	ldstuba	%r4, [%r8 + %r9] 0x80
	.word 0xc4120009  ! 105: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0x8143c000  ! 106: STBAR	stbar
	.word 0x8ba20829  ! 107: FADDs	fadds	%f8, %f9, %f5
	.word 0xeec21009  ! 108: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r23
	.word 0x85a20829  ! 109: FADDs	fadds	%f8, %f9, %f2
	.word 0xcac21009  ! 110: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r5
	.word 0xc8a22550  ! 111: STWA_I	stwa	%r4, [%r8 + 0x0550] %asi
	.word 0x83a209a9  ! 112: FDIVs	fdivs	%f8, %f9, %f1
	.word 0x8b6a24b0  ! 113: SDIVX_I	sdivx	%r8, 0x04b0, %r5
	.word 0x944a0009  ! 114: MULX_R	mulx 	%r8, %r9, %r10
	.word 0xb6f20009  ! 115: UDIVcc_R	udivcc 	%r8, %r9, %r27
	.word 0xc93a0009  ! 116: STDF_R	std	%f4, [%r9, %r8]
	.word 0x867a2744  ! 117: SDIV_I	sdiv 	%r8, 0x0744, %r3
	.word 0x02ca0004  ! 118: BRZ	brz  ,pt	%8,<label_0xa0004>
	.word 0x82fa26b0  ! 119: SDIVcc_I	sdivcc 	%r8, 0x06b0, %r1
	.word 0xe89a1009  ! 120: LDDA_R	ldda	[%r8, %r9] 0x80, %r20
	.word 0x8e7226c4  ! 121: UDIV_I	udiv 	%r8, 0x06c4, %r7
	.word 0xc2d21009  ! 122: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r1
	.word 0xc4b21009  ! 123: STHA_R	stha	%r2, [%r8 + %r9] 0x80
	.word 0xc86a2a24  ! 124: LDSTUB_I	ldstub	%r4, [%r8 + 0x0a24]
	.word 0xc89a1009  ! 125: LDDA_R	ldda	[%r8, %r9] 0x80, %r4
	.word 0x16800008  ! 126: BGE	bge  	<label_0x8>
	.word 0xc45a2240  ! 127: LDX_I	ldx	[%r8 + 0x0240], %r2
	.word 0x8143e06d  ! 128: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #MemIssue | #Sync 
	.word 0xc3ea21d0  ! 129: PREFETCHA_I	prefetcha	[%r8, + 0x01d0] %asi, #one_read
	.word 0xeef228d0  ! 130: STXA_I	stxa	%r23, [%r8 + 0x08d0] %asi
	.word 0xc4922734  ! 131: LDUHA_I	lduha	[%r8, + 0x0734] %asi, %r2
	.word 0xaba20929  ! 132: FMULs	fmuls	%f8, %f9, %f21
	.word 0xcc520009  ! 133: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xecba2258  ! 134: STDA_I	stda	%r22, [%r8 + 0x0258] %asi
	.word 0xe5222ad8  ! 135: STF_I	st	%f18, [0x0ad8, %r8]
	.word 0xdcba1009  ! 136: STDA_R	stda	%r14, [%r8 + %r9] 0x80
	.word 0xc2020009  ! 137: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0x8f220009  ! 138: MULScc_R	mulscc 	%r8, %r9, %r7
	.word 0xc4122550  ! 139: LDUH_I	lduh	[%r8 + 0x0550], %r2
	.word 0x8143e04e  ! 140: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Sync 
	.word 0xcc022774  ! 141: LDUW_I	lduw	[%r8 + 0x0774], %r6
	.word 0xc65a2990  ! 142: LDX_I	ldx	[%r8 + 0x0990], %r3
	.word 0xc36a22e0  ! 143: PREFETCH_I	prefetch	[%r8 + 0x02e0], #one_read
	.word 0xc3220009  ! 144: STF_R	st	%f1, [%r9, %r8]
	.word 0x8143e075  ! 145: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside | #MemIssue | #Sync 
	.word 0xf4ba1009  ! 146: STDA_R	stda	%r26, [%r8 + %r9] 0x80
	.word 0x0e800004  ! 147: BVS	bvs  	<label_0x4>
	.word 0x844a0009  ! 148: MULX_R	mulx 	%r8, %r9, %r2
	.word 0x8c7a26ac  ! 150: SDIV_I	sdiv 	%r8, 0x06ac, %r6
	.word 0xf8ba2940  ! 151: STDA_I	stda	%r28, [%r8 + 0x0940] %asi
	.word 0xb84a0009  ! 152: MULX_R	mulx 	%r8, %r9, %r28
	.word 0x94f22908  ! 153: UDIVcc_I	udivcc 	%r8, 0x0908, %r10
	.word 0xc60a25c8  ! 154: LDUB_I	ldub	[%r8 + 0x05c8], %r3
	.word 0xc6122618  ! 155: LDUH_I	lduh	[%r8 + 0x0618], %r3
	.word 0x8143e06a  ! 156: MEMBAR	membar	#StoreLoad | #StoreStore | #MemIssue | #Sync 
	.word 0x32800004  ! 157: BNE	bne,a	<label_0x4>
	.word 0x8da20829  ! 158: FADDs	fadds	%f8, %f9, %f6
	.word 0xcde21009  ! 159: CASA_I	casa	[%r8] 0x80, %r9, %r6
	.word 0x22ca0004  ! 160: BRZ	brz,a,pt	%8,<label_0xa0004>
	.word 0x867225dc  ! 161: UDIV_I	udiv 	%r8, 0x05dc, %r3
	.word 0xcada1009  ! 162: LDXA_R	ldxa	[%r8, %r9] 0x80, %r5
	.word 0xc3ea218c  ! 163: PREFETCHA_I	prefetcha	[%r8, + 0x018c] %asi, #one_read
	.word 0x8143c000  ! 164: STBAR	stbar
	.word 0x02c20008  ! 165: BRZ	brz  ,nt	%8,<label_0x20008>
	.word 0x8143c000  ! 166: STBAR	stbar
	.word 0xc53a2868  ! 167: STDF_I	std	%f2, [0x0868, %r8]
	.word 0xfe42223c  ! 168: LDSW_I	ldsw	[%r8 + 0x023c], %r31
	.word 0x8cda0009  ! 169: SMULcc_R	smulcc 	%r8, %r9, %r6
	.word 0xf2fa29e4  ! 170: SWAPA_I	swapa	%r25, [%r8 + 0x09e4] %asi
	.word 0xf67a0009  ! 171: SWAP_R	swap	%r27, [%r8 + %r9]
	.word 0xe4ba1009  ! 173: STDA_R	stda	%r18, [%r8 + %r9] 0x80
	.word 0xf53a29d0  ! 175: STDF_I	std	%f26, [0x09d0, %r8]
	.word 0xd6fa2c4c  ! 176: SWAPA_I	swapa	%r11, [%r8 + 0x0c4c] %asi
	.word 0xca5a2a30  ! 177: LDX_I	ldx	[%r8 + 0x0a30], %r5
	.word 0xf2d22058  ! 178: LDSHA_I	ldsha	[%r8, + 0x0058] %asi, %r25
	.word 0xd80a0009  ! 179: LDUB_R	ldub	[%r8 + %r9], %r12
	.word 0xc24a211c  ! 180: LDSB_I	ldsb	[%r8 + 0x011c], %r1
	.word 0x8b6a0009  ! 181: SDIVX_R	sdivx	%r8, %r9, %r5
	.word 0xb5a20929  ! 182: FMULs	fmuls	%f8, %f9, %f26
	.word 0xfdf22009  ! 183: CASXA_R	casxa	[%r8]%asi, %r9, %r30
	.word 0xc5f22009  ! 184: CASXA_R	casxa	[%r8]%asi, %r9, %r2
	.word 0xc3ea2c14  ! 185: PREFETCHA_I	prefetcha	[%r8, + 0x0c14] %asi, #one_read
	.word 0x8a520009  ! 186: UMUL_R	umul 	%r8, %r9, %r5
	.word 0xdafa2ffc  ! 187: SWAPA_I	swapa	%r13, [%r8 + 0x0ffc] %asi
	.word 0xc8520009  ! 188: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xe88a1009  ! 189: LDUBA_R	lduba	[%r8, %r9] 0x80, %r20
	.word 0x9fa20829  ! 190: FADDs	fadds	%f8, %f9, %f15
	.word 0x84f22bf0  ! 191: UDIVcc_I	udivcc 	%r8, 0x0bf0, %r2
	.word 0xc8f222e0  ! 192: STXA_I	stxa	%r4, [%r8 + 0x02e0] %asi
	.word 0x8e720009  ! 193: UDIV_R	udiv 	%r8, %r9, %r7
	.word 0xc6da1009  ! 194: LDXA_R	ldxa	[%r8, %r9] 0x80, %r3
	.word 0x98d20009  ! 195: UMULcc_R	umulcc 	%r8, %r9, %r12
	.word 0x82f227b8  ! 196: UDIVcc_I	udivcc 	%r8, 0x07b8, %r1
	.word 0xc2020009  ! 197: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xc8d22f54  ! 198: LDSHA_I	ldsha	[%r8, + 0x0f54] %asi, %r4
	.word 0x9e720009  ! 199: UDIV_R	udiv 	%r8, %r9, %r15
	.word 0x40000004  ! 200: CALL	call	disp30_4
	.word 0xc6ea1009  ! 201: LDSTUBA_R	ldstuba	%r3, [%r8 + %r9] 0x80
	.word 0x886a0009  ! 202: UDIVX_R	udivx 	%r8, %r9, %r4
	.word 0xc46a0009  ! 203: LDSTUB_R	ldstub	%r2, [%r8 + %r9]
	.word 0xc36a2c58  ! 204: PREFETCH_I	prefetch	[%r8 + 0x0c58], #one_read
	.word 0x32800004  ! 206: BNE	bne,a	<label_0x4>
	.word 0xfc1a0009  ! 207: LDD_R	ldd	[%r8 + %r9], %r30
	.word 0xc8fa1009  ! 208: SWAPA_R	swapa	%r4, [%r8 + %r9] 0x80
	.word 0x8a6a25e0  ! 209: UDIVX_I	udivx 	%r8, 0x05e0, %r5
	.word 0xca520009  ! 210: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0x8143c000  ! 211: STBAR	stbar
	.word 0x34800004  ! 212: BG	bg,a	<label_0x4>
	.word 0x8ad20009  ! 213: UMULcc_R	umulcc 	%r8, %r9, %r5
	.word 0x88d22708  ! 214: UMULcc_I	umulcc 	%r8, 0x0708, %r4
	.word 0xcaa22e80  ! 215: STWA_I	stwa	%r5, [%r8 + 0x0e80] %asi
	.word 0x8143c000  ! 216: STBAR	stbar
	.word 0xdab225c8  ! 217: STHA_I	stha	%r13, [%r8 + 0x05c8] %asi
	.word 0xca922bb8  ! 218: LDUHA_I	lduha	[%r8, + 0x0bb8] %asi, %r5
	.word 0xcd222a28  ! 219: STF_I	st	%f6, [0x0a28, %r8]
	.word 0xba7a2404  ! 220: SDIV_I	sdiv 	%r8, 0x0404, %r29
	.word 0x8ba209a9  ! 221: FDIVs	fdivs	%f8, %f9, %f5
	.word 0x8cd22cb8  ! 222: UMULcc_I	umulcc 	%r8, 0x0cb8, %r6
	.word 0xc8ca1009  ! 223: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r4
	.word 0x26800004  ! 224: BL	bl,a	<label_0x4>
	.word 0xc36a2e14  ! 225: PREFETCH_I	prefetch	[%r8 + 0x0e14], #one_read
	.word 0xe7e22009  ! 226: CASA_R	casa	[%r8] %asi, %r9, %r19
	.word 0x30800004  ! 227: BA	ba,a	<label_0x4>
	.word 0xe8da1009  ! 228: LDXA_R	ldxa	[%r8, %r9] 0x80, %r20
	.word 0x82d220b8  ! 229: UMULcc_I	umulcc 	%r8, 0x00b8, %r1
	.word 0x8e5a2274  ! 231: SMUL_I	smul 	%r8, 0x0274, %r7
	.word 0xccb229d4  ! 232: STHA_I	stha	%r6, [%r8 + 0x09d4] %asi
	.word 0x876a0009  ! 233: SDIVX_R	sdivx	%r8, %r9, %r3
	.word 0xce7a0009  ! 234: SWAP_R	swap	%r7, [%r8 + %r9]
	.word 0xd45a2ac0  ! 235: LDX_I	ldx	[%r8 + 0x0ac0], %r10
	.word 0xe6aa1009  ! 236: STBA_R	stba	%r19, [%r8 + %r9] 0x80
	.word 0xda7a0009  ! 237: SWAP_R	swap	%r13, [%r8 + %r9]
	.word 0x8143c000  ! 238: STBAR	stbar
	.word 0xe89a1009  ! 239: LDDA_R	ldda	[%r8, %r9] 0x80, %r20
	.word 0xc2b21009  ! 240: STHA_R	stha	%r1, [%r8 + %r9] 0x80
	.word 0xc8ca1009  ! 241: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r4
	.word 0xc36a2b1c  ! 242: PREFETCH_I	prefetch	[%r8 + 0x0b1c], #one_read
	.word 0xc6b21009  ! 244: STHA_R	stha	%r3, [%r8 + %r9] 0x80
	.word 0x8143e00c  ! 245: MEMBAR	membar	#LoadStore | #StoreStore 
	.word 0x824a0009  ! 246: MULX_R	mulx 	%r8, %r9, %r1
	.word 0xc27a0009  ! 247: SWAP_R	swap	%r1, [%r8 + %r9]
	.word 0x87a208a9  ! 248: FSUBs	fsubs	%f8, %f9, %f3
	.word 0xc6821009  ! 249: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r3
	.word 0x22c20004  ! 250: BRZ	brz,a,nt	%8,<label_0x20004>
	.word 0xccfa1009  ! 251: SWAPA_R	swapa	%r6, [%r8 + %r9] 0x80
	.word 0x8143e055  ! 252: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside | #Sync 
	.word 0xe8b22758  ! 254: STHA_I	stha	%r20, [%r8 + 0x0758] %asi
	.word 0x836a0009  ! 255: SDIVX_R	sdivx	%r8, %r9, %r1
	.word 0xe0fa1009  ! 256: SWAPA_R	swapa	%r16, [%r8 + %r9] 0x80
	.word 0xca7a2028  ! 257: SWAP_I	swap	%r5, [%r8 + 0x0028]
	.word 0xf4ba2dd8  ! 258: STDA_I	stda	%r26, [%r8 + 0x0dd8] %asi
	.word 0xf7f21009  ! 259: CASXA_I	casxa	[%r8] 0x80, %r9, %r27
	.word 0x8143e01a  ! 260: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside 
	.word 0xc20a28a8  ! 261: LDUB_I	ldub	[%r8 + 0x08a8], %r1
	.word 0xc3ea2348  ! 262: PREFETCHA_I	prefetcha	[%r8, + 0x0348] %asi, #one_read
	.word 0x825a0009  ! 263: SMUL_R	smul 	%r8, %r9, %r1
	.word 0x8eda0009  ! 264: SMULcc_R	smulcc 	%r8, %r9, %r7
	.word 0x98f221b8  ! 265: UDIVcc_I	udivcc 	%r8, 0x01b8, %r12
	.word 0xb0f20009  ! 266: UDIVcc_R	udivcc 	%r8, %r9, %r24
	.word 0xf4122b0c  ! 267: LDUH_I	lduh	[%r8 + 0x0b0c], %r26
	.word 0xcc4a2254  ! 268: LDSB_I	ldsb	[%r8 + 0x0254], %r6
	.word 0xc2fa1009  ! 269: SWAPA_R	swapa	%r1, [%r8 + %r9] 0x80
	.word 0xc7220009  ! 270: STF_R	st	%f3, [%r9, %r8]
	.word 0xf28a1009  ! 271: LDUBA_R	lduba	[%r8, %r9] 0x80, %r25
	.word 0xa522213c  ! 272: MULScc_I	mulscc 	%r8, 0x013c, %r18
	.word 0x18800004  ! 273: BGU	bgu  	<label_0x4>
	.word 0x825a0009  ! 274: SMUL_R	smul 	%r8, %r9, %r1
	.word 0x06800008  ! 275: BL	bl  	<label_0x8>
	.word 0x8fa20829  ! 276: FADDs	fadds	%f8, %f9, %f7
	.word 0x8ef20009  ! 277: UDIVcc_R	udivcc 	%r8, %r9, %r7
	.word 0xc36a225c  ! 278: PREFETCH_I	prefetch	[%r8 + 0x025c], #one_read
	.word 0xdada1009  ! 279: LDXA_R	ldxa	[%r8, %r9] 0x80, %r13
	.word 0x8143c000  ! 280: STBAR	stbar
	.word 0xf5220009  ! 281: STF_R	st	%f26, [%r9, %r8]
	.word 0xead22fb8  ! 282: LDSHA_I	ldsha	[%r8, + 0x0fb8] %asi, %r21
	.word 0xc4aa2048  ! 283: STBA_I	stba	%r2, [%r8 + 0x0048] %asi
	.word 0x18800004  ! 284: BGU	bgu  	<label_0x4>
	.word 0xc2f21009  ! 285: STXA_R	stxa	%r1, [%r8 + %r9] 0x80
	.word 0xc6f228c8  ! 286: STXA_I	stxa	%r3, [%r8 + 0x08c8] %asi
	.word 0x8143c000  ! 287: STBAR	stbar
	.word 0xcaa223d0  ! 288: STWA_I	stwa	%r5, [%r8 + 0x03d0] %asi
	.word 0xc49a1009  ! 289: LDDA_R	ldda	[%r8, %r9] 0x80, %r2
	.word 0xc36a2f64  ! 290: PREFETCH_I	prefetch	[%r8 + 0x0f64], #one_read
	.word 0xcca22070  ! 291: STWA_I	stwa	%r6, [%r8 + 0x0070] %asi
	.word 0xcf220009  ! 292: STF_R	st	%f7, [%r9, %r8]
	.word 0xa47a0009  ! 293: SDIV_R	sdiv 	%r8, %r9, %r18
	.word 0x83222898  ! 294: MULScc_I	mulscc 	%r8, 0x0898, %r1
	.word 0xcc4223bc  ! 295: LDSW_I	ldsw	[%r8 + 0x03bc], %r6
	.word 0x2c800004  ! 296: BNEG	bneg,a	<label_0x4>
	.word 0xca92286c  ! 297: LDUHA_I	lduha	[%r8, + 0x086c] %asi, %r5
	.word 0x885a0009  ! 298: SMUL_R	smul 	%r8, %r9, %r4
	.word 0xca8a1009  ! 299: LDUBA_R	lduba	[%r8, %r9] 0x80, %r5
	.word 0xd6b22404  ! 300: STHA_I	stha	%r11, [%r8 + 0x0404] %asi
	.word 0xd89a1009  ! 301: LDDA_R	ldda	[%r8, %r9] 0x80, %r12
	.word 0xcb220009  ! 302: STF_R	st	%f5, [%r9, %r8]
	.word 0x8143c000  ! 303: STBAR	stbar
	.word 0xce6a2b1c  ! 304: LDSTUB_I	ldstub	%r7, [%r8 + 0x0b1c]
	.word 0x0c800004  ! 305: BNEG	bneg  	<label_0x4>
	.word 0xce8225c8  ! 306: LDUWA_I	lduwa	[%r8, + 0x05c8] %asi, %r7
	.word 0xc4f22a90  ! 307: STXA_I	stxa	%r2, [%r8 + 0x0a90] %asi
	.word 0xc7f21009  ! 308: CASXA_I	casxa	[%r8] 0x80, %r9, %r3
	.word 0xc2ca28d0  ! 309: LDSBA_I	ldsba	[%r8, + 0x08d0] %asi, %r1
	.word 0xc36a2878  ! 310: PREFETCH_I	prefetch	[%r8 + 0x0878], #one_read
	.word 0xe8ea1009  ! 311: LDSTUBA_R	ldstuba	%r20, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 313: STBAR	stbar
	.word 0xc53a2e10  ! 314: STDF_I	std	%f2, [0x0e10, %r8]
	.word 0x8a7a2b08  ! 315: SDIV_I	sdiv 	%r8, 0x0b08, %r5
	.word 0x8a6a282c  ! 316: UDIVX_I	udivx 	%r8, 0x082c, %r5
	.word 0xc8ba2cf0  ! 317: STDA_I	stda	%r4, [%r8 + 0x0cf0] %asi
	.word 0xd4b22e1c  ! 318: STHA_I	stha	%r10, [%r8 + 0x0e1c] %asi
	.word 0xfac22624  ! 319: LDSWA_I	ldswa	[%r8, + 0x0624] %asi, %r29
	.word 0x8c5a0009  ! 320: SMUL_R	smul 	%r8, %r9, %r6
	.word 0x95a20829  ! 321: FADDs	fadds	%f8, %f9, %f10
	.word 0x984a2d00  ! 322: MULX_I	mulx 	%r8, 0x0d00, %r12
	.word 0x8143e07e  ! 323: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xd93a0009  ! 324: STDF_R	std	%f12, [%r9, %r8]
	.word 0xec921009  ! 325: LDUHA_R	lduha	[%r8, %r9] 0x80, %r22
	.word 0x98f2291c  ! 326: UDIVcc_I	udivcc 	%r8, 0x091c, %r12
	.word 0x8fa209a9  ! 327: FDIVs	fdivs	%f8, %f9, %f7
	.word 0xc8120009  ! 328: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xc36a2cc0  ! 329: PREFETCH_I	prefetch	[%r8 + 0x0cc0], #one_read
	.word 0xcff21009  ! 330: CASXA_I	casxa	[%r8] 0x80, %r9, %r7
	.word 0xc2fa2128  ! 332: SWAPA_I	swapa	%r1, [%r8 + 0x0128] %asi
	.word 0x86f20009  ! 333: UDIVcc_R	udivcc 	%r8, %r9, %r3
	.word 0xde822584  ! 334: LDUWA_I	lduwa	[%r8, + 0x0584] %asi, %r15
	.word 0xc49a1009  ! 335: LDDA_R	ldda	[%r8, %r9] 0x80, %r2
	.word 0x8143e06b  ! 336: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #MemIssue | #Sync 
	.word 0xbc4a0009  ! 337: MULX_R	mulx 	%r8, %r9, %r30
	.word 0xca420009  ! 338: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0x856a0009  ! 340: SDIVX_R	sdivx	%r8, %r9, %r2
	.word 0xc4c21009  ! 342: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r2
	.word 0xd4ba1009  ! 343: STDA_R	stda	%r10, [%r8 + %r9] 0x80
	.word 0x824a0009  ! 344: MULX_R	mulx 	%r8, %r9, %r1
	.word 0xc3ea28d8  ! 345: PREFETCHA_I	prefetcha	[%r8, + 0x08d8] %asi, #one_read
	.word 0xc65a0009  ! 346: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0x836a0009  ! 348: SDIVX_R	sdivx	%r8, %r9, %r1
	.word 0x9a5a0009  ! 349: SMUL_R	smul 	%r8, %r9, %r13
	.word 0x8c5a0009  ! 350: SMUL_R	smul 	%r8, %r9, %r6
	.word 0x8da20929  ! 351: FMULs	fmuls	%f8, %f9, %f6
	.word 0xfaf21009  ! 353: STXA_R	stxa	%r29, [%r8 + %r9] 0x80
	.word 0xe7220009  ! 354: STF_R	st	%f19, [%r9, %r8]
	.word 0xcc7a0009  ! 356: SWAP_R	swap	%r6, [%r8 + %r9]
	.word 0x85a20929  ! 357: FMULs	fmuls	%f8, %f9, %f2
	.word 0xc2f21009  ! 358: STXA_R	stxa	%r1, [%r8 + %r9] 0x80
	.word 0xb6720009  ! 359: UDIV_R	udiv 	%r8, %r9, %r27
	.word 0x8143e00a  ! 360: MEMBAR	membar	#StoreLoad | #StoreStore 
	.word 0x20800004  ! 361: BN	bn,a	<label_0x4>
	.word 0x887a2b0c  ! 362: SDIV_I	sdiv 	%r8, 0x0b0c, %r4
	.word 0xce821009  ! 363: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r7
	.word 0x866a0009  ! 364: UDIVX_R	udivx 	%r8, %r9, %r3
	.word 0x8f6a0009  ! 365: SDIVX_R	sdivx	%r8, %r9, %r7
	.word 0xc2aa1009  ! 366: STBA_R	stba	%r1, [%r8 + %r9] 0x80
	.word 0xd4522794  ! 367: LDSH_I	ldsh	[%r8 + 0x0794], %r10
	.word 0xb4522eec  ! 368: UMUL_I	umul 	%r8, 0x0eec, %r26
	.word 0xc44a2dc4  ! 369: LDSB_I	ldsb	[%r8 + 0x0dc4], %r2
	.word 0x89a208a9  ! 370: FSUBs	fsubs	%f8, %f9, %f4
	.word 0x8143e07c  ! 371: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xc36a2024  ! 372: PREFETCH_I	prefetch	[%r8 + 0x0024], #one_read
	.word 0x85a209a9  ! 373: FDIVs	fdivs	%f8, %f9, %f2
	.word 0x9cd20009  ! 374: UMULcc_R	umulcc 	%r8, %r9, %r14
	.word 0xa66a0009  ! 375: UDIVX_R	udivx 	%r8, %r9, %r19
	.word 0x2ec20008  ! 376: BRGEZ	brgez,a,nt	%8,<label_0x20008>
	.word 0x865a0009  ! 377: SMUL_R	smul 	%r8, %r9, %r3
	.word 0x88f22098  ! 378: UDIVcc_I	udivcc 	%r8, 0x0098, %r4
	.word 0x8143e027  ! 379: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #MemIssue 
	.word 0x04800004  ! 380: BLE	ble  	<label_0x4>
	.word 0xfc82248c  ! 381: LDUWA_I	lduwa	[%r8, + 0x048c] %asi, %r30
	.word 0xf8020009  ! 382: LDUW_R	lduw	[%r8 + %r9], %r28
	.word 0xe5f22009  ! 383: CASXA_R	casxa	[%r8]%asi, %r9, %r18
	.word 0x10800004  ! 384: BA	ba  	<label_0x4>
	.word 0x0ec20004  ! 385: BRGEZ	brgez  ,nt	%8,<label_0x20004>
	.word 0xba720009  ! 386: UDIV_R	udiv 	%r8, %r9, %r29
	.word 0xd93a0009  ! 387: STDF_R	std	%f12, [%r9, %r8]
	.word 0xc4a21009  ! 388: STWA_R	stwa	%r2, [%r8 + %r9] 0x80
	.word 0x24800008  ! 389: BLE	ble,a	<label_0x8>
	.word 0xcc6a2fd4  ! 390: LDSTUB_I	ldstub	%r6, [%r8 + 0x0fd4]
	.word 0xe41a0009  ! 391: LDD_R	ldd	[%r8 + %r9], %r18
	.word 0xc89a2378  ! 392: LDDA_I	ldda	[%r8, + 0x0378] %asi, %r4
	.word 0xc4ca1009  ! 393: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r2
	.word 0x95220009  ! 394: MULScc_R	mulscc 	%r8, %r9, %r10
	.word 0xcb3a0009  ! 395: STDF_R	std	%f5, [%r9, %r8]
	.word 0x1a800008  ! 396: BCC	bcc  	<label_0x8>
	.word 0x85a20929  ! 397: FMULs	fmuls	%f8, %f9, %f2
	.word 0x89a20829  ! 398: FADDs	fadds	%f8, %f9, %f4
	.word 0x8143e04e  ! 399: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Sync 
	.word 0xa47a0009  ! 400: SDIV_R	sdiv 	%r8, %r9, %r18
	.word 0x40000008  ! 401: CALL	call	disp30_8
	.word 0xf2b22214  ! 402: STHA_I	stha	%r25, [%r8 + 0x0214] %asi
	.word 0xccb22a68  ! 403: STHA_I	stha	%r6, [%r8 + 0x0a68] %asi
	.word 0xf68a22a0  ! 404: LDUBA_I	lduba	[%r8, + 0x02a0] %asi, %r27
	.word 0xcf220009  ! 405: STF_R	st	%f7, [%r9, %r8]
	.word 0x3a800004  ! 406: BCC	bcc,a	<label_0x4>
	.word 0x8143c000  ! 407: STBAR	stbar
	.word 0xf2c21009  ! 408: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r25
	.word 0xa0fa0009  ! 409: SDIVcc_R	sdivcc 	%r8, %r9, %r16
	.word 0x04ca0008  ! 410: BRLEZ	brlez  ,pt	%8,<label_0xa0008>
	.word 0x8e5a275c  ! 411: SMUL_I	smul 	%r8, 0x075c, %r7
	.word 0xc2f21009  ! 412: STXA_R	stxa	%r1, [%r8 + %r9] 0x80
	.word 0x8da208a9  ! 413: FSUBs	fsubs	%f8, %f9, %f6
	.word 0xb3a20929  ! 414: FMULs	fmuls	%f8, %f9, %f25
	.word 0x2c800004  ! 415: BNEG	bneg,a	<label_0x4>
	.word 0xc8c22cec  ! 416: LDSWA_I	ldswa	[%r8, + 0x0cec] %asi, %r4
	.word 0xe0420009  ! 417: LDSW_R	ldsw	[%r8 + %r9], %r16
	.word 0x8c7a0009  ! 418: SDIV_R	sdiv 	%r8, %r9, %r6
	.word 0xc46a0009  ! 419: LDSTUB_R	ldstub	%r2, [%r8 + %r9]
	.word 0xc36a24cc  ! 420: PREFETCH_I	prefetch	[%r8 + 0x04cc], #one_read
	.word 0x8ba20829  ! 421: FADDs	fadds	%f8, %f9, %f5
	.word 0x85a20929  ! 422: FMULs	fmuls	%f8, %f9, %f2
	.word 0xccd21009  ! 423: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r6
	.word 0x826a0009  ! 424: UDIVX_R	udivx 	%r8, %r9, %r1
	.word 0xcf3a2da8  ! 425: STDF_I	std	%f7, [0x0da8, %r8]
	.word 0x865a0009  ! 426: SMUL_R	smul 	%r8, %r9, %r3
	.word 0x82d221c0  ! 427: UMULcc_I	umulcc 	%r8, 0x01c0, %r1
	.word 0xee5225c0  ! 428: LDSH_I	ldsh	[%r8 + 0x05c0], %r23
	.word 0xc2522c0c  ! 429: LDSH_I	ldsh	[%r8 + 0x0c0c], %r1
	.word 0xcbe22009  ! 430: CASA_R	casa	[%r8] %asi, %r9, %r5
	.word 0x8c4a253c  ! 431: MULX_I	mulx 	%r8, 0x053c, %r6
	.word 0xd4420009  ! 432: LDSW_R	ldsw	[%r8 + %r9], %r10
	.word 0xcc4a0009  ! 433: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xce4222dc  ! 434: LDSW_I	ldsw	[%r8 + 0x02dc], %r7
	.word 0xc47a0009  ! 435: SWAP_R	swap	%r2, [%r8 + %r9]
	.word 0xfcb2279c  ! 436: STHA_I	stha	%r30, [%r8 + 0x079c] %asi
	.word 0xc33a2b18  ! 437: STDF_I	std	%f1, [0x0b18, %r8]
	.word 0xcc7a0009  ! 438: SWAP_R	swap	%r6, [%r8 + %r9]
	.word 0xc3ea2e40  ! 439: PREFETCHA_I	prefetcha	[%r8, + 0x0e40] %asi, #one_read
	.word 0x24c20008  ! 441: BRLEZ	brlez,a,nt	%8,<label_0x20008>
	.word 0xcc822e90  ! 442: LDUWA_I	lduwa	[%r8, + 0x0e90] %asi, %r6
	.word 0x8b6a2908  ! 443: SDIVX_I	sdivx	%r8, 0x0908, %r5
	.word 0xc4fa1009  ! 444: SWAPA_R	swapa	%r2, [%r8 + %r9] 0x80
	.word 0x82d20009  ! 445: UMULcc_R	umulcc 	%r8, %r9, %r1
	.word 0xe48221b0  ! 446: LDUWA_I	lduwa	[%r8, + 0x01b0] %asi, %r18
	.word 0xd4420009  ! 447: LDSW_R	ldsw	[%r8 + %r9], %r10
	.word 0x867a2604  ! 448: SDIV_I	sdiv 	%r8, 0x0604, %r3
	.word 0x8da208a9  ! 449: FSUBs	fsubs	%f8, %f9, %f6
	.word 0x8143e057  ! 450: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside | #Sync 
	.word 0xdb222778  ! 451: STF_I	st	%f13, [0x0778, %r8]
	.word 0xd8aa1009  ! 452: STBA_R	stba	%r12, [%r8 + %r9] 0x80
	.word 0x89a208a9  ! 453: FSUBs	fsubs	%f8, %f9, %f4
	.word 0xbcf22124  ! 454: UDIVcc_I	udivcc 	%r8, 0x0124, %r30
	.word 0x8143e076  ! 455: MEMBAR	membar	#StoreLoad | #LoadStore | #Lookaside | #MemIssue | #Sync 
	.word 0xc8821009  ! 456: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r4
	.word 0xc8b21009  ! 457: STHA_R	stha	%r4, [%r8 + %r9] 0x80
	.word 0xc3ea28ec  ! 458: PREFETCHA_I	prefetcha	[%r8, + 0x08ec] %asi, #one_read
	.word 0xc4aa1009  ! 459: STBA_R	stba	%r2, [%r8 + %r9] 0x80
	.word 0x85220009  ! 460: MULScc_R	mulscc 	%r8, %r9, %r2
	.word 0xce522e74  ! 461: LDSH_I	ldsh	[%r8 + 0x0e74], %r7
	.word 0x8143e00a  ! 462: MEMBAR	membar	#StoreLoad | #StoreStore 
	.word 0xc2922f0c  ! 463: LDUHA_I	lduha	[%r8, + 0x0f0c] %asi, %r1
	.word 0x847a0009  ! 464: SDIV_R	sdiv 	%r8, %r9, %r2
	.word 0x36800004  ! 465: BGE	bge,a	<label_0x4>
	.word 0xfe8a29ec  ! 466: LDUBA_I	lduba	[%r8, + 0x09ec] %asi, %r31
	.word 0x8b222600  ! 467: MULScc_I	mulscc 	%r8, 0x0600, %r5
	.word 0xc65220cc  ! 468: LDSH_I	ldsh	[%r8 + 0x00cc], %r3
	.word 0x8143c000  ! 469: STBAR	stbar
	.word 0xcca21009  ! 470: STWA_R	stwa	%r6, [%r8 + %r9] 0x80
	.word 0x8143e048  ! 471: MEMBAR	membar	#StoreStore | #Sync 
	.word 0xf01a0009  ! 472: LDD_R	ldd	[%r8 + %r9], %r24
	.word 0xc4a21009  ! 473: STWA_R	stwa	%r2, [%r8 + %r9] 0x80
	.word 0xc21223c0  ! 474: LDUH_I	lduh	[%r8 + 0x03c0], %r1
	.word 0xb1a20929  ! 475: FMULs	fmuls	%f8, %f9, %f24
	.word 0xcc0a28a0  ! 476: LDUB_I	ldub	[%r8 + 0x08a0], %r6
	.word 0xa0522838  ! 477: UMUL_I	umul 	%r8, 0x0838, %r16
	.word 0xe53a0009  ! 478: STDF_R	std	%f18, [%r9, %r8]
	.word 0xa45a0009  ! 479: SMUL_R	smul 	%r8, %r9, %r18
	.word 0x8af22b34  ! 480: UDIVcc_I	udivcc 	%r8, 0x0b34, %r5
	.word 0x0e800004  ! 481: BVS	bvs  	<label_0x4>
	.word 0xdcc22f24  ! 482: LDSWA_I	ldswa	[%r8, + 0x0f24] %asi, %r14
	.word 0xccca288c  ! 483: LDSBA_I	ldsba	[%r8, + 0x088c] %asi, %r6
	.word 0x04800004  ! 484: BLE	ble  	<label_0x4>
	.word 0xe8ca231c  ! 485: LDSBA_I	ldsba	[%r8, + 0x031c] %asi, %r20
	.word 0xc8ca2904  ! 486: LDSBA_I	ldsba	[%r8, + 0x0904] %asi, %r4
	.word 0xd6922260  ! 487: LDUHA_I	lduha	[%r8, + 0x0260] %asi, %r11
	.word 0x2aca0004  ! 488: BRNZ	brnz,a,pt	%8,<label_0xa0004>
	.word 0xd8aa2b8c  ! 489: STBA_I	stba	%r12, [%r8 + 0x0b8c] %asi
	.word 0x8c7221f8  ! 490: UDIV_I	udiv 	%r8, 0x01f8, %r6
	.word 0x2aca0008  ! 491: BRNZ	brnz,a,pt	%8,<label_0xa0008>
	.word 0xc47a203c  ! 492: SWAP_I	swap	%r2, [%r8 + 0x003c]
	.word 0xcef22bf0  ! 493: STXA_I	stxa	%r7, [%r8 + 0x0bf0] %asi
	.word 0xc41225d8  ! 494: LDUH_I	lduh	[%r8 + 0x05d8], %r2
	.word 0xc7220009  ! 495: STF_R	st	%f3, [%r9, %r8]
	.word 0x9cf20009  ! 496: UDIVcc_R	udivcc 	%r8, %r9, %r14
	.word 0x02800008  ! 497: BE	be  	<label_0x8>
	.word 0xc4120009  ! 498: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0x3a800004  ! 499: BCC	bcc,a	<label_0x4>
	.word 0x8143e04b  ! 500: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Sync 
	.word 0xc3ea2d5c  ! 501: PREFETCHA_I	prefetcha	[%r8, + 0x0d5c] %asi, #one_read
	.word 0xbba20929  ! 502: FMULs	fmuls	%f8, %f9, %f29
	.word 0x8da20929  ! 503: FMULs	fmuls	%f8, %f9, %f6
	.word 0x8f2226ac  ! 504: MULScc_I	mulscc 	%r8, 0x06ac, %r7
	.word 0x98520009  ! 505: UMUL_R	umul 	%r8, %r9, %r12
	.word 0xca7a23b4  ! 506: SWAP_I	swap	%r5, [%r8 + 0x03b4]
	.word 0xc8ea1009  ! 507: LDSTUBA_R	ldstuba	%r4, [%r8 + %r9] 0x80
	.word 0xaf6a0009  ! 508: SDIVX_R	sdivx	%r8, %r9, %r23
	.word 0x2c800004  ! 509: BNEG	bneg,a	<label_0x4>
	.word 0xa3a20829  ! 510: FADDs	fadds	%f8, %f9, %f17
	.word 0xce921009  ! 511: LDUHA_R	lduha	[%r8, %r9] 0x80, %r7
	.word 0xc60a0009  ! 513: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0x89a208a9  ! 514: FSUBs	fsubs	%f8, %f9, %f4
	.word 0xf2aa2f50  ! 515: STBA_I	stba	%r25, [%r8 + 0x0f50] %asi
	.word 0xc2120009  ! 516: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xe0ba1009  ! 517: STDA_R	stda	%r16, [%r8 + %r9] 0x80
	.word 0xc6a21009  ! 518: STWA_R	stwa	%r3, [%r8 + %r9] 0x80
	.word 0xc36a2e54  ! 519: PREFETCH_I	prefetch	[%r8 + 0x0e54], #one_read
	.word 0x8143c000  ! 520: STBAR	stbar
	.word 0xf0122310  ! 521: LDUH_I	lduh	[%r8 + 0x0310], %r24
	.word 0xe5e21009  ! 522: CASA_I	casa	[%r8] 0x80, %r9, %r18
	.word 0xae520009  ! 523: UMUL_R	umul 	%r8, %r9, %r23
	.word 0x8e720009  ! 524: UDIV_R	udiv 	%r8, %r9, %r7
	.word 0x8a720009  ! 525: UDIV_R	udiv 	%r8, %r9, %r5
	.word 0xdd3a0009  ! 526: STDF_R	std	%f14, [%r9, %r8]
	.word 0x8143c000  ! 527: STBAR	stbar
	.word 0xbb6a25f0  ! 529: SDIVX_I	sdivx	%r8, 0x05f0, %r29
	.word 0xdaaa1009  ! 530: STBA_R	stba	%r13, [%r8 + %r9] 0x80
	.word 0xe6aa27e8  ! 531: STBA_I	stba	%r19, [%r8 + 0x07e8] %asi
	.word 0x8143c000  ! 532: STBAR	stbar
	.word 0xc6f22490  ! 533: STXA_I	stxa	%r3, [%r8 + 0x0490] %asi
	.word 0x8143c000  ! 534: STBAR	stbar
	.word 0xc3ea2a9c  ! 535: PREFETCHA_I	prefetcha	[%r8, + 0x0a9c] %asi, #one_read
	.word 0xceea2268  ! 536: LDSTUBA_I	ldstuba	%r7, [%r8 + 0x0268] %asi
	.word 0xa1a20829  ! 539: FADDs	fadds	%f8, %f9, %f16
	.word 0x8e5227fc  ! 540: UMUL_I	umul 	%r8, 0x07fc, %r7
	.word 0xd89a1009  ! 541: LDDA_R	ldda	[%r8, %r9] 0x80, %r12
	.word 0x87a20829  ! 542: FADDs	fadds	%f8, %f9, %f3
	.word 0xcc5a0009  ! 543: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xccf22578  ! 544: STXA_I	stxa	%r6, [%r8 + 0x0578] %asi
	.word 0x04ca0004  ! 545: BRLEZ	brlez  ,pt	%8,<label_0xa0004>
	.word 0xc60a0009  ! 546: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xcafa26c0  ! 547: SWAPA_I	swapa	%r5, [%r8 + 0x06c0] %asi
	.word 0xb56a27c0  ! 548: SDIVX_I	sdivx	%r8, 0x07c0, %r26
	.word 0xe4ba1009  ! 549: STDA_R	stda	%r18, [%r8 + %r9] 0x80
	.word 0xc64a2618  ! 550: LDSB_I	ldsb	[%r8 + 0x0618], %r3
	.word 0x8cfa2cd8  ! 551: SDIVcc_I	sdivcc 	%r8, 0x0cd8, %r6
	.word 0xceea1009  ! 552: LDSTUBA_R	ldstuba	%r7, [%r8 + %r9] 0x80
	.word 0xc6f21009  ! 553: STXA_R	stxa	%r3, [%r8 + %r9] 0x80
	.word 0xaeda23fc  ! 554: SMULcc_I	smulcc 	%r8, 0x03fc, %r23
	.word 0xcf3a0009  ! 555: STDF_R	std	%f7, [%r9, %r8]
	.word 0xccf22080  ! 556: STXA_I	stxa	%r6, [%r8 + 0x0080] %asi
	.word 0x8a5a0009  ! 557: SMUL_R	smul 	%r8, %r9, %r5
	.word 0x836a20b4  ! 558: SDIVX_I	sdivx	%r8, 0x00b4, %r1
	.word 0x8ada2dd0  ! 559: SMULcc_I	smulcc 	%r8, 0x0dd0, %r5
	.word 0xeeea1009  ! 560: LDSTUBA_R	ldstuba	%r23, [%r8 + %r9] 0x80
	.word 0xc27a0009  ! 561: SWAP_R	swap	%r1, [%r8 + %r9]
	.word 0x87a20829  ! 562: FADDs	fadds	%f8, %f9, %f3
	.word 0x8143e028  ! 563: MEMBAR	membar	#StoreStore | #MemIssue 
	.word 0x8143e062  ! 564: MEMBAR	membar	#StoreLoad | #MemIssue | #Sync 
	.word 0xd41a0009  ! 565: LDD_R	ldd	[%r8 + %r9], %r10
	.word 0xea0a293c  ! 566: LDUB_I	ldub	[%r8 + 0x093c], %r21
	.word 0xc3ea2b14  ! 567: PREFETCHA_I	prefetcha	[%r8, + 0x0b14] %asi, #one_read
	.word 0xf3222f18  ! 568: STF_I	st	%f25, [0x0f18, %r8]
	.word 0xcafa2100  ! 569: SWAPA_I	swapa	%r5, [%r8 + 0x0100] %asi
	.word 0xd4120009  ! 570: LDUH_R	lduh	[%r8 + %r9], %r10
	.word 0xc32226e8  ! 571: STF_I	st	%f1, [0x06e8, %r8]
	.word 0xcd3a22d0  ! 572: STDF_I	std	%f6, [0x02d0, %r8]
	.word 0xdcba1009  ! 573: STDA_R	stda	%r14, [%r8 + %r9] 0x80
	.word 0xcac22fbc  ! 574: LDSWA_I	ldswa	[%r8, + 0x0fbc] %asi, %r5
	.word 0xe80a267c  ! 575: LDUB_I	ldub	[%r8 + 0x067c], %r20
	.word 0xeb3a24c8  ! 576: STDF_I	std	%f21, [0x04c8, %r8]
	.word 0xc3220009  ! 577: STF_R	st	%f1, [%r9, %r8]
	.word 0x8da20929  ! 578: FMULs	fmuls	%f8, %f9, %f6
	.word 0xcd22274c  ! 579: STF_I	st	%f6, [0x074c, %r8]
	.word 0x8143c000  ! 580: STBAR	stbar
	.word 0x88722164  ! 581: UDIV_I	udiv 	%r8, 0x0164, %r4
	.word 0x83a208a9  ! 582: FSUBs	fsubs	%f8, %f9, %f1
	.word 0xae5a0009  ! 583: SMUL_R	smul 	%r8, %r9, %r23
	.word 0x8143c000  ! 584: STBAR	stbar
	.word 0x40000004  ! 585: CALL	call	disp30_4
	.word 0x88d229f8  ! 586: UMULcc_I	umulcc 	%r8, 0x09f8, %r4
	.word 0x85220009  ! 587: MULScc_R	mulscc 	%r8, %r9, %r2
	.word 0x84fa0009  ! 588: SDIVcc_R	sdivcc 	%r8, %r9, %r2
	.word 0xa24a0009  ! 589: MULX_R	mulx 	%r8, %r9, %r17
	.word 0xc93a25a8  ! 590: STDF_I	std	%f4, [0x05a8, %r8]
	.word 0xead21009  ! 591: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r21
	.word 0x824a0009  ! 592: MULX_R	mulx 	%r8, %r9, %r1
	.word 0xe45228e0  ! 593: LDSH_I	ldsh	[%r8 + 0x08e0], %r18
	.word 0xb56a0009  ! 594: SDIVX_R	sdivx	%r8, %r9, %r26
	.word 0xc36a2124  ! 595: PREFETCH_I	prefetch	[%r8 + 0x0124], #one_read
	.word 0xcc8a2544  ! 596: LDUBA_I	lduba	[%r8, + 0x0544] %asi, %r6
	.word 0x8ba20829  ! 597: FADDs	fadds	%f8, %f9, %f5
	.word 0xd66a2b2c  ! 598: LDSTUB_I	ldstub	%r11, [%r8 + 0x0b2c]
	.word 0x8143c000  ! 599: STBAR	stbar
	.word 0xc4a21009  ! 600: STWA_R	stwa	%r2, [%r8 + %r9] 0x80
	.word 0x8a720009  ! 601: UDIV_R	udiv 	%r8, %r9, %r5
	.word 0xca0a2fa8  ! 602: LDUB_I	ldub	[%r8 + 0x0fa8], %r5
	.word 0xce522bac  ! 603: LDSH_I	ldsh	[%r8 + 0x0bac], %r7
	.word 0xcaaa1009  ! 604: STBA_R	stba	%r5, [%r8 + %r9] 0x80
	.word 0x82522ca0  ! 605: UMUL_I	umul 	%r8, 0x0ca0, %r1
	.word 0xc4122d50  ! 606: LDUH_I	lduh	[%r8 + 0x0d50], %r2
	.word 0xf8f21009  ! 607: STXA_R	stxa	%r28, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 608: STBAR	stbar
	.word 0xcc821009  ! 609: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r6
	.word 0xc46a235c  ! 610: LDSTUB_I	ldstub	%r2, [%r8 + 0x035c]
	.word 0xc24a0009  ! 611: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xf60a27a8  ! 612: LDUB_I	ldub	[%r8 + 0x07a8], %r27
	.word 0x8e5a0009  ! 613: SMUL_R	smul 	%r8, %r9, %r7
	.word 0x8143e04b  ! 614: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Sync 
	.word 0x84fa0009  ! 615: SDIVcc_R	sdivcc 	%r8, %r9, %r2
	.word 0x8eda2794  ! 616: SMULcc_I	smulcc 	%r8, 0x0794, %r7
	.word 0xdc821009  ! 617: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r14
	.word 0xc36a2084  ! 618: PREFETCH_I	prefetch	[%r8 + 0x0084], #one_read
	.word 0x85a20829  ! 619: FADDs	fadds	%f8, %f9, %f2
	.word 0xc68a2f34  ! 620: LDUBA_I	lduba	[%r8, + 0x0f34] %asi, %r3
	.word 0xaba208a9  ! 621: FSUBs	fsubs	%f8, %f9, %f21
	.word 0x887a0009  ! 622: SDIV_R	sdiv 	%r8, %r9, %r4
	.word 0xca9223f0  ! 623: LDUHA_I	lduha	[%r8, + 0x03f0] %asi, %r5
	.word 0x8143e01b  ! 624: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Lookaside 
	.word 0xf6b22f44  ! 625: STHA_I	stha	%r27, [%r8 + 0x0f44] %asi
	.word 0x2cc20008  ! 626: BRGZ	brgz,a,nt	%8,<label_0x20008>
	.word 0x8e4a2ca0  ! 627: MULX_I	mulx 	%r8, 0x0ca0, %r7
	.word 0xeaea1009  ! 628: LDSTUBA_R	ldstuba	%r21, [%r8 + %r9] 0x80
	.word 0xca122088  ! 629: LDUH_I	lduh	[%r8 + 0x0088], %r5
	.word 0xc2b21009  ! 630: STHA_R	stha	%r1, [%r8 + %r9] 0x80
	.word 0xce822d10  ! 631: LDUWA_I	lduwa	[%r8, + 0x0d10] %asi, %r7
	.word 0x2e800004  ! 632: BVS	bvs,a	<label_0x4>
	.word 0x8143e004  ! 633: MEMBAR	membar	#LoadStore 
	.word 0x86520009  ! 634: UMUL_R	umul 	%r8, %r9, %r3
	.word 0x24800004  ! 635: BLE	ble,a	<label_0x4>
	.word 0xcaca1009  ! 636: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r5
	.word 0xb8720009  ! 637: UDIV_R	udiv 	%r8, %r9, %r28
	.word 0xce6a2864  ! 638: LDSTUB_I	ldstub	%r7, [%r8 + 0x0864]
	.word 0x8143c000  ! 639: STBAR	stbar
	.word 0xc36a2960  ! 640: PREFETCH_I	prefetch	[%r8 + 0x0960], #one_read
	.word 0xcad21009  ! 641: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r5
	.word 0xc6a228f0  ! 642: STWA_I	stwa	%r3, [%r8 + 0x08f0] %asi
	.word 0x00800004  ! 643: BN	bn  	<label_0x4>
	.word 0xc8120009  ! 644: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0x9a520009  ! 646: UMUL_R	umul 	%r8, %r9, %r13
	.word 0xc4aa1009  ! 647: STBA_R	stba	%r2, [%r8 + %r9] 0x80
	.word 0xc2ca1009  ! 648: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r1
	.word 0x97a20829  ! 650: FADDs	fadds	%f8, %f9, %f11
	.word 0xeafa2624  ! 651: SWAPA_I	swapa	%r21, [%r8 + 0x0624] %asi
	.word 0xc40a2f18  ! 652: LDUB_I	ldub	[%r8 + 0x0f18], %r2
	.word 0xada20829  ! 653: FADDs	fadds	%f8, %f9, %f22
	.word 0xc45a2ad8  ! 654: LDX_I	ldx	[%r8 + 0x0ad8], %r2
	.word 0xc3ea2b0c  ! 655: PREFETCHA_I	prefetcha	[%r8, + 0x0b0c] %asi, #one_read
	.word 0xd49a2bf8  ! 656: LDDA_I	ldda	[%r8, + 0x0bf8] %asi, %r10
	.word 0xd81a2660  ! 657: LDD_I	ldd	[%r8 + 0x0660], %r12
	.word 0xcbe22009  ! 658: CASA_R	casa	[%r8] %asi, %r9, %r5
	.word 0x8f2221a0  ! 659: MULScc_I	mulscc 	%r8, 0x01a0, %r7
	.word 0x3c800004  ! 660: BPOS	bpos,a	<label_0x4>
	.word 0x0eca0004  ! 661: BRGEZ	brgez  ,pt	%8,<label_0xa0004>
	.word 0x30800008  ! 662: BA	ba,a	<label_0x8>
	.word 0xaa6a27a4  ! 663: UDIVX_I	udivx 	%r8, 0x07a4, %r21
	.word 0x12800004  ! 664: BNE	bne  	<label_0x4>
	.word 0x8143e05f  ! 665: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0x86d20009  ! 666: UMULcc_R	umulcc 	%r8, %r9, %r3
	.word 0x84f20009  ! 667: UDIVcc_R	udivcc 	%r8, %r9, %r2
	.word 0x8cfa0009  ! 668: SDIVcc_R	sdivcc 	%r8, %r9, %r6
	.word 0x0a800008  ! 669: BCS	bcs  	<label_0x8>
	.word 0xecd21009  ! 670: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r22
	.word 0x896a27f4  ! 671: SDIVX_I	sdivx	%r8, 0x07f4, %r4
	.word 0xf01a2990  ! 672: LDD_I	ldd	[%r8 + 0x0990], %r24
	.word 0x856a0009  ! 673: SDIVX_R	sdivx	%r8, %r9, %r2
	.word 0xcea21009  ! 674: STWA_R	stwa	%r7, [%r8 + %r9] 0x80
	.word 0x89a20929  ! 675: FMULs	fmuls	%f8, %f9, %f4
	.word 0xd89a1009  ! 676: LDDA_R	ldda	[%r8, %r9] 0x80, %r12
	.word 0x86520009  ! 677: UMUL_R	umul 	%r8, %r9, %r3
	.word 0x826a2e0c  ! 678: UDIVX_I	udivx 	%r8, 0x0e0c, %r1
	.word 0x8b6a21b4  ! 679: SDIVX_I	sdivx	%r8, 0x01b4, %r5
	.word 0xbfa20829  ! 680: FADDs	fadds	%f8, %f9, %f31
	.word 0xceda2e10  ! 681: LDXA_I	ldxa	[%r8, + 0x0e10] %asi, %r7
	.word 0x8143e01b  ! 682: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Lookaside 
	.word 0x1e800004  ! 683: BVC	bvc  	<label_0x4>
	.word 0xce5223fc  ! 684: LDSH_I	ldsh	[%r8 + 0x03fc], %r7
	.word 0xf93a27f0  ! 685: STDF_I	std	%f28, [0x07f0, %r8]
	.word 0xcaa21009  ! 686: STWA_R	stwa	%r5, [%r8 + %r9] 0x80
	.word 0xc36a2b3c  ! 687: PREFETCH_I	prefetch	[%r8 + 0x0b3c], #one_read
	.word 0xa0722fb0  ! 688: UDIV_I	udiv 	%r8, 0x0fb0, %r16
	.word 0xe45a0009  ! 689: LDX_R	ldx	[%r8 + %r9], %r18
	.word 0xc65a0009  ! 690: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xe6ca2ee4  ! 691: LDSBA_I	ldsba	[%r8, + 0x0ee4] %asi, %r19
	.word 0xea4a23a8  ! 692: LDSB_I	ldsb	[%r8 + 0x03a8], %r21
	.word 0x86522778  ! 693: UMUL_I	umul 	%r8, 0x0778, %r3
	.word 0xf4120009  ! 694: LDUH_R	lduh	[%r8 + %r9], %r26
	.word 0x8143c000  ! 695: STBAR	stbar
	.word 0xc4d21009  ! 696: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r2
	.word 0x24c20004  ! 697: BRLEZ	brlez,a,nt	%8,<label_0x20004>
	.word 0x8143c000  ! 698: STBAR	stbar
	.word 0xc36a276c  ! 699: PREFETCH_I	prefetch	[%r8 + 0x076c], #one_read
	.word 0xb67a2238  ! 700: SDIV_I	sdiv 	%r8, 0x0238, %r27
	.word 0x87a209a9  ! 701: FDIVs	fdivs	%f8, %f9, %f3
	.word 0xd8ea1009  ! 703: LDSTUBA_R	ldstuba	%r12, [%r8 + %r9] 0x80
	.word 0xccd21009  ! 704: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r6
	.word 0x8fa20929  ! 705: FMULs	fmuls	%f8, %f9, %f7
	.word 0x8b2220d8  ! 706: MULScc_I	mulscc 	%r8, 0x00d8, %r5
	.word 0x20800008  ! 707: BN	bn,a	<label_0x8>
	.word 0x40000004  ! 708: CALL	call	disp30_4
	.word 0xce520009  ! 710: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xbe7a20c4  ! 711: SDIV_I	sdiv 	%r8, 0x00c4, %r31
	.word 0x10800008  ! 712: BA	ba  	<label_0x8>
	.word 0xf20a2eb0  ! 713: LDUB_I	ldub	[%r8 + 0x0eb0], %r25
	.word 0x38800004  ! 714: BGU	bgu,a	<label_0x4>
	.word 0xf81a0009  ! 715: LDD_R	ldd	[%r8 + %r9], %r28
	.word 0xc9e22009  ! 716: CASA_R	casa	[%r8] %asi, %r9, %r4
	.word 0x8143e004  ! 717: MEMBAR	membar	#LoadStore 
	.word 0x8143c000  ! 718: STBAR	stbar
	.word 0x85a209a9  ! 719: FDIVs	fdivs	%f8, %f9, %f2
	.word 0xa3a20829  ! 720: FADDs	fadds	%f8, %f9, %f17
	.word 0x9a7a0009  ! 721: SDIV_R	sdiv 	%r8, %r9, %r13
	.word 0xc2420009  ! 722: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0x22800004  ! 723: BE	be,a	<label_0x4>
	.word 0xcca21009  ! 724: STWA_R	stwa	%r6, [%r8 + %r9] 0x80
	.word 0xca120009  ! 725: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0x2cc20004  ! 726: BRGZ	brgz,a,nt	%8,<label_0x20004>
	.word 0xf68a1009  ! 727: LDUBA_R	lduba	[%r8, %r9] 0x80, %r27
	.word 0x9a5227f8  ! 728: UMUL_I	umul 	%r8, 0x07f8, %r13
	.word 0xfe120009  ! 729: LDUH_R	lduh	[%r8 + %r9], %r31
	.word 0xc7f22009  ! 730: CASXA_R	casxa	[%r8]%asi, %r9, %r3
	.word 0x856a0009  ! 731: SDIVX_R	sdivx	%r8, %r9, %r2
	.word 0x8143e038  ! 732: MEMBAR	membar	#StoreStore | #Lookaside | #MemIssue 
	.word 0x88522ce8  ! 733: UMUL_I	umul 	%r8, 0x0ce8, %r4
	.word 0xc36a2618  ! 734: PREFETCH_I	prefetch	[%r8 + 0x0618], #one_read
	.word 0x8ada2c54  ! 735: SMULcc_I	smulcc 	%r8, 0x0c54, %r5
	.word 0x8d6a0009  ! 736: SDIVX_R	sdivx	%r8, %r9, %r6
	.word 0x99a20829  ! 737: FADDs	fadds	%f8, %f9, %f12
	.word 0xce7a2e08  ! 738: SWAP_I	swap	%r7, [%r8 + 0x0e08]
	.word 0xf27a253c  ! 739: SWAP_I	swap	%r25, [%r8 + 0x053c]
	.word 0x8efa2db8  ! 740: SDIVcc_I	sdivcc 	%r8, 0x0db8, %r7
	.word 0xce5a0009  ! 741: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0x8143e05a  ! 742: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside | #Sync 
	.word 0x8c6a0009  ! 743: UDIVX_R	udivx 	%r8, %r9, %r6
	.word 0xcf3a0009  ! 744: STDF_R	std	%f7, [%r9, %r8]
	.word 0x8cd22f20  ! 745: UMULcc_I	umulcc 	%r8, 0x0f20, %r6
	.word 0x846a0009  ! 746: UDIVX_R	udivx 	%r8, %r9, %r2
	.word 0xc3ea2148  ! 747: PREFETCHA_I	prefetcha	[%r8, + 0x0148] %asi, #one_read
	.word 0x8b6a0009  ! 748: SDIVX_R	sdivx	%r8, %r9, %r5
	.word 0x26ca0004  ! 749: BRLZ	brlz,a,pt	%8,<label_0xa0004>
	.word 0x3e800004  ! 750: BVC	bvc,a	<label_0x4>
	.word 0xb8da0009  ! 751: SMULcc_R	smulcc 	%r8, %r9, %r28
	.word 0xcc120009  ! 752: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xc48a2aec  ! 753: LDUBA_I	lduba	[%r8, + 0x0aec] %asi, %r2
	.word 0xce422228  ! 754: LDSW_I	ldsw	[%r8 + 0x0228], %r7
	.word 0xee7a0009  ! 756: SWAP_R	swap	%r23, [%r8 + %r9]
	.word 0xca6a2a60  ! 757: LDSTUB_I	ldstub	%r5, [%r8 + 0x0a60]
	.word 0xc8020009  ! 759: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xea4a0009  ! 760: LDSB_R	ldsb	[%r8 + %r9], %r21
	.word 0xc3ea2f80  ! 761: PREFETCHA_I	prefetcha	[%r8, + 0x0f80] %asi, #one_read
	.word 0xe4420009  ! 762: LDSW_R	ldsw	[%r8 + %r9], %r18
	.word 0xc9f22009  ! 763: CASXA_R	casxa	[%r8]%asi, %r9, %r4
	.word 0xe26a0009  ! 764: LDSTUB_R	ldstub	%r17, [%r8 + %r9]
	.word 0xb5a209a9  ! 765: FDIVs	fdivs	%f8, %f9, %f26
	.word 0x8cda2e90  ! 767: SMULcc_I	smulcc 	%r8, 0x0e90, %r6
	.word 0xcef21009  ! 768: STXA_R	stxa	%r7, [%r8 + %r9] 0x80
	.word 0x0c800004  ! 769: BNEG	bneg  	<label_0x4>
	.word 0x9872273c  ! 770: UDIV_I	udiv 	%r8, 0x073c, %r12
	.word 0xc4a22ab4  ! 773: STWA_I	stwa	%r2, [%r8 + 0x0ab4] %asi
	.word 0xf73a26c8  ! 774: STDF_I	std	%f27, [0x06c8, %r8]
	.word 0xc93a0009  ! 776: STDF_R	std	%f4, [%r9, %r8]
	.word 0xec1a0009  ! 777: LDD_R	ldd	[%r8 + %r9], %r22
	.word 0xc4da1009  ! 778: LDXA_R	ldxa	[%r8, %r9] 0x80, %r2
	.word 0xfa7a2f50  ! 779: SWAP_I	swap	%r29, [%r8 + 0x0f50]
	.word 0xf73a0009  ! 780: STDF_R	std	%f27, [%r9, %r8]
	.word 0xcf220009  ! 781: STF_R	st	%f7, [%r9, %r8]
	.word 0xc24223c4  ! 782: LDSW_I	ldsw	[%r8 + 0x03c4], %r1
	.word 0x85222edc  ! 783: MULScc_I	mulscc 	%r8, 0x0edc, %r2
	.word 0xc4b22e58  ! 784: STHA_I	stha	%r2, [%r8 + 0x0e58] %asi
	.word 0xc6822da4  ! 785: LDUWA_I	lduwa	[%r8, + 0x0da4] %asi, %r3
	.word 0x8143c000  ! 786: STBAR	stbar
	.word 0x8143c000  ! 787: STBAR	stbar
	.word 0xcb220009  ! 788: STF_R	st	%f5, [%r9, %r8]
	.word 0x0ec20004  ! 789: BRGEZ	brgez  ,nt	%8,<label_0x20004>
	.word 0xccaa2150  ! 790: STBA_I	stba	%r6, [%r8 + 0x0150] %asi
	.word 0xfcea1009  ! 791: LDSTUBA_R	ldstuba	%r30, [%r8 + %r9] 0x80
	.word 0xc27a2c60  ! 792: SWAP_I	swap	%r1, [%r8 + 0x0c60]
	.word 0x8ef22e08  ! 793: UDIVcc_I	udivcc 	%r8, 0x0e08, %r7
	.word 0xc3ea2c94  ! 794: PREFETCHA_I	prefetcha	[%r8, + 0x0c94] %asi, #one_read
	.word 0x8143e05a  ! 795: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside | #Sync 
	.word 0xceb22ee8  ! 796: STHA_I	stha	%r7, [%r8 + 0x0ee8] %asi
	.word 0x89a209a9  ! 797: FDIVs	fdivs	%f8, %f9, %f4
	.word 0xd7f22009  ! 798: CASXA_R	casxa	[%r8]%asi, %r9, %r11
	.word 0x84da2050  ! 799: SMULcc_I	smulcc 	%r8, 0x0050, %r2
	.word 0xe88a2810  ! 800: LDUBA_I	lduba	[%r8, + 0x0810] %asi, %r20
	.word 0xe6b21009  ! 801: STHA_R	stha	%r19, [%r8 + %r9] 0x80
	.word 0xe05a0009  ! 803: LDX_R	ldx	[%r8 + %r9], %r16
	.word 0x32800004  ! 804: BNE	bne,a	<label_0x4>
	.word 0xe2ca1009  ! 806: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r17
	.word 0x847a2410  ! 807: SDIV_I	sdiv 	%r8, 0x0410, %r2
	.word 0x8143c000  ! 808: STBAR	stbar
	.word 0x86da21cc  ! 809: SMULcc_I	smulcc 	%r8, 0x01cc, %r3
	.word 0xc5e21009  ! 810: CASA_I	casa	[%r8] 0x80, %r9, %r2
	.word 0xcfe22009  ! 811: CASA_R	casa	[%r8] %asi, %r9, %r7
	.word 0xc36a2214  ! 812: PREFETCH_I	prefetch	[%r8 + 0x0214], #one_read
	.word 0x8143c000  ! 813: STBAR	stbar
	.word 0x8143e055  ! 814: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside | #Sync 
	.word 0xf41a2398  ! 816: LDD_I	ldd	[%r8 + 0x0398], %r26
	.word 0xc68a208c  ! 817: LDUBA_I	lduba	[%r8, + 0x008c] %asi, %r3
	.word 0xcc420009  ! 818: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xcca22904  ! 819: STWA_I	stwa	%r6, [%r8 + 0x0904] %asi
	.word 0xc64a0009  ! 820: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xc6ea1009  ! 821: LDSTUBA_R	ldstuba	%r3, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 822: STBAR	stbar
	.word 0xd8ba25d0  ! 823: STDA_I	stda	%r12, [%r8 + 0x05d0] %asi
	.word 0xc2b21009  ! 824: STHA_R	stha	%r1, [%r8 + %r9] 0x80
	.word 0x2c800004  ! 825: BNEG	bneg,a	<label_0x4>
	.word 0xcd2220d8  ! 826: STF_I	st	%f6, [0x00d8, %r8]
	.word 0xc8da2fc0  ! 827: LDXA_I	ldxa	[%r8, + 0x0fc0] %asi, %r4
	.word 0xc8022dc4  ! 828: LDUW_I	lduw	[%r8 + 0x0dc4], %r4
	.word 0xb26a218c  ! 829: UDIVX_I	udivx 	%r8, 0x018c, %r25
	.word 0xc4122eb4  ! 830: LDUH_I	lduh	[%r8 + 0x0eb4], %r2
	.word 0xcd3a0009  ! 831: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc89a2e00  ! 832: LDDA_I	ldda	[%r8, + 0x0e00] %asi, %r4
	.word 0xb5a208a9  ! 833: FSUBs	fsubs	%f8, %f9, %f26
	.word 0x8143e015  ! 834: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside 
	.word 0xcafa2d04  ! 835: SWAPA_I	swapa	%r5, [%r8 + 0x0d04] %asi
	.word 0xccc21009  ! 836: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r6
	.word 0x98d20009  ! 837: UMULcc_R	umulcc 	%r8, %r9, %r12
	.word 0xf4ba1009  ! 838: STDA_R	stda	%r26, [%r8 + %r9] 0x80
	.word 0x8143e033  ! 839: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside | #MemIssue 
	.word 0x8a520009  ! 840: UMUL_R	umul 	%r8, %r9, %r5
	.word 0xf4ea2430  ! 841: LDSTUBA_I	ldstuba	%r26, [%r8 + 0x0430] %asi
	.word 0x8143e042  ! 842: MEMBAR	membar	#StoreLoad | #Sync 
	.word 0xf41a2490  ! 843: LDD_I	ldd	[%r8 + 0x0490], %r26
	.word 0x8da20829  ! 844: FADDs	fadds	%f8, %f9, %f6
	.word 0xc3e21009  ! 845: CASA_I	casa	[%r8] 0x80, %r9, %r1
	.word 0x88da2d8c  ! 846: SMULcc_I	smulcc 	%r8, 0x0d8c, %r4
	.word 0xec922870  ! 847: LDUHA_I	lduha	[%r8, + 0x0870] %asi, %r22
	.word 0xdcba2d68  ! 848: STDA_I	stda	%r14, [%r8 + 0x0d68] %asi
	.word 0xf65a2f50  ! 849: LDX_I	ldx	[%r8 + 0x0f50], %r27
	.word 0xc27a0009  ! 850: SWAP_R	swap	%r1, [%r8 + %r9]
	.word 0xc6a21009  ! 851: STWA_R	stwa	%r3, [%r8 + %r9] 0x80
	.word 0xc85a25b0  ! 852: LDX_I	ldx	[%r8 + 0x05b0], %r4
	.word 0x86da2324  ! 853: SMULcc_I	smulcc 	%r8, 0x0324, %r3
	.word 0x8143c000  ! 854: STBAR	stbar
	.word 0xc46a2cf8  ! 855: LDSTUB_I	ldstub	%r2, [%r8 + 0x0cf8]
	.word 0x40000004  ! 856: CALL	call	disp30_4
	.word 0xc36a2f2c  ! 857: PREFETCH_I	prefetch	[%r8 + 0x0f2c], #one_read
	.word 0xc2821009  ! 858: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r1
	.word 0xf8fa24b8  ! 859: SWAPA_I	swapa	%r28, [%r8 + 0x04b8] %asi
	.word 0xeaca1009  ! 860: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r21
	.word 0x30800004  ! 861: BA	ba,a	<label_0x4>
	.word 0xeeda2058  ! 862: LDXA_I	ldxa	[%r8, + 0x0058] %asi, %r23
	.word 0xc4f22940  ! 863: STXA_I	stxa	%r2, [%r8 + 0x0940] %asi
	.word 0xc8a22154  ! 864: STWA_I	stwa	%r4, [%r8 + 0x0154] %asi
	.word 0xaefa0009  ! 865: SDIVcc_R	sdivcc 	%r8, %r9, %r23
	.word 0xcaa22c74  ! 866: STWA_I	stwa	%r5, [%r8 + 0x0c74] %asi
	.word 0x8143e05f  ! 867: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0xdcf21009  ! 868: STXA_R	stxa	%r14, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 869: STBAR	stbar
	.word 0x8143e02d  ! 870: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #MemIssue 
	.word 0xef2223b0  ! 871: STF_I	st	%f23, [0x03b0, %r8]
	.word 0xe0ba27c0  ! 872: STDA_I	stda	%r16, [%r8 + 0x07c0] %asi
	.word 0x8143c000  ! 873: STBAR	stbar
	.word 0xc3ea2cf0  ! 874: PREFETCHA_I	prefetcha	[%r8, + 0x0cf0] %asi, #one_read
	.word 0xe0ba1009  ! 875: STDA_R	stda	%r16, [%r8 + %r9] 0x80
	.word 0xd84a0009  ! 876: LDSB_R	ldsb	[%r8 + %r9], %r12
	.word 0xd4ea1009  ! 877: LDSTUBA_R	ldstuba	%r10, [%r8 + %r9] 0x80
	.word 0xe89a1009  ! 878: LDDA_R	ldda	[%r8, %r9] 0x80, %r20
	.word 0x8f6a2564  ! 879: SDIVX_I	sdivx	%r8, 0x0564, %r7
	.word 0x9d6a0009  ! 880: SDIVX_R	sdivx	%r8, %r9, %r14
	.word 0x82522150  ! 881: UMUL_I	umul 	%r8, 0x0150, %r1
	.word 0x89a209a9  ! 882: FDIVs	fdivs	%f8, %f9, %f4
	.word 0xcf3a27f8  ! 883: STDF_I	std	%f7, [0x07f8, %r8]
	.word 0xcfe22009  ! 885: CASA_R	casa	[%r8] %asi, %r9, %r7
	.word 0xd47a2598  ! 886: SWAP_I	swap	%r10, [%r8 + 0x0598]
	.word 0xdc8a1009  ! 887: LDUBA_R	lduba	[%r8, %r9] 0x80, %r14
	.word 0xfa5229a0  ! 888: LDSH_I	ldsh	[%r8 + 0x09a0], %r29
	.word 0x9c4a2210  ! 889: MULX_I	mulx 	%r8, 0x0210, %r14
	.word 0xc36a20f0  ! 890: PREFETCH_I	prefetch	[%r8 + 0x00f0], #one_read
	.word 0xcaea1009  ! 891: LDSTUBA_R	ldstuba	%r5, [%r8 + %r9] 0x80
	.word 0x88d20009  ! 893: UMULcc_R	umulcc 	%r8, %r9, %r4
	.word 0xc6522568  ! 894: LDSH_I	ldsh	[%r8 + 0x0568], %r3
	.word 0x8143e031  ! 895: MEMBAR	membar	#LoadLoad | #Lookaside | #MemIssue 
	.word 0x85a20929  ! 896: FMULs	fmuls	%f8, %f9, %f2
	.word 0x8143e054  ! 897: MEMBAR	membar	#LoadStore | #Lookaside | #Sync 
	.word 0xe73a2ee0  ! 898: STDF_I	std	%f19, [0x0ee0, %r8]
	.word 0xc8120009  ! 899: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xfad22c34  ! 900: LDSHA_I	ldsha	[%r8, + 0x0c34] %asi, %r29
	.word 0xc242255c  ! 901: LDSW_I	ldsw	[%r8 + 0x055c], %r1
	.word 0xfe821009  ! 902: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r31
	.word 0x06800004  ! 903: BL	bl  	<label_0x4>
	.word 0xc40a2b2c  ! 904: LDUB_I	ldub	[%r8 + 0x0b2c], %r2
	.word 0x04800004  ! 905: BLE	ble  	<label_0x4>
	.word 0xc87a2d50  ! 906: SWAP_I	swap	%r4, [%r8 + 0x0d50]
	.word 0xcc921009  ! 907: LDUHA_R	lduha	[%r8, %r9] 0x80, %r6
	.word 0xcc6a0009  ! 908: LDSTUB_R	ldstub	%r6, [%r8 + %r9]
	.word 0xfd3a0009  ! 909: STDF_R	std	%f30, [%r9, %r8]
	.word 0x9e6a27b0  ! 910: UDIVX_I	udivx 	%r8, 0x07b0, %r15
	.word 0xd46a2d0c  ! 911: LDSTUB_I	ldstub	%r10, [%r8 + 0x0d0c]
	.word 0xc8c22e08  ! 912: LDSWA_I	ldswa	[%r8, + 0x0e08] %asi, %r4
	.word 0x9852215c  ! 913: UMUL_I	umul 	%r8, 0x015c, %r12
	.word 0xc8420009  ! 914: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xc80a237c  ! 915: LDUB_I	ldub	[%r8 + 0x037c], %r4
	.word 0xce022388  ! 916: LDUW_I	lduw	[%r8 + 0x0388], %r7
	.word 0x8143c000  ! 917: STBAR	stbar
	.word 0xfe022dec  ! 918: LDUW_I	lduw	[%r8 + 0x0dec], %r31
	.word 0x1e800008  ! 919: BVC	bvc  	<label_0x8>
	.word 0x87a209a9  ! 920: FDIVs	fdivs	%f8, %f9, %f3
	.word 0x8143e032  ! 921: MEMBAR	membar	#StoreLoad | #Lookaside | #MemIssue 
	.word 0xc36a276c  ! 922: PREFETCH_I	prefetch	[%r8 + 0x076c], #one_read
	.word 0x8ba20929  ! 923: FMULs	fmuls	%f8, %f9, %f5
	.word 0xc5e22009  ! 924: CASA_R	casa	[%r8] %asi, %r9, %r2
	.word 0xcafa2df0  ! 925: SWAPA_I	swapa	%r5, [%r8 + 0x0df0] %asi
	.word 0x06ca0004  ! 927: BRLZ	brlz  ,pt	%8,<label_0xa0004>
	.word 0x86d22a88  ! 928: UMULcc_I	umulcc 	%r8, 0x0a88, %r3
	.word 0xca5227a0  ! 929: LDSH_I	ldsh	[%r8 + 0x07a0], %r5
	.word 0x8143c000  ! 930: STBAR	stbar
	.word 0x1e800004  ! 931: BVC	bvc  	<label_0x4>
	.word 0x846a29fc  ! 932: UDIVX_I	udivx 	%r8, 0x09fc, %r2
	.word 0x8cda0009  ! 933: SMULcc_R	smulcc 	%r8, %r9, %r6
	.word 0xb8fa0009  ! 935: SDIVcc_R	sdivcc 	%r8, %r9, %r28
	.word 0x30800004  ! 936: BA	ba,a	<label_0x4>
	.word 0xcbf21009  ! 937: CASXA_I	casxa	[%r8] 0x80, %r9, %r5
	.word 0xaa5a0009  ! 938: SMUL_R	smul 	%r8, %r9, %r21
	.word 0xcec21009  ! 939: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r7
	.word 0xe0ba1009  ! 940: STDA_R	stda	%r16, [%r8 + %r9] 0x80
	.word 0x9b220009  ! 941: MULScc_R	mulscc 	%r8, %r9, %r13
	.word 0x0cc20008  ! 942: BRGZ	brgz  ,nt	%8,<label_0x20008>
	.word 0xce5a2e70  ! 943: LDX_I	ldx	[%r8 + 0x0e70], %r7
	.word 0x38800008  ! 944: BGU	bgu,a	<label_0x8>
	.word 0xb2fa20e4  ! 945: SDIVcc_I	sdivcc 	%r8, 0x00e4, %r25
	.word 0xec9a29c0  ! 946: LDDA_I	ldda	[%r8, + 0x09c0] %asi, %r22
	.word 0xf65222a0  ! 947: LDSH_I	ldsh	[%r8 + 0x02a0], %r27
	.word 0xc8822488  ! 948: LDUWA_I	lduwa	[%r8, + 0x0488] %asi, %r4
	.word 0xc322286c  ! 949: STF_I	st	%f1, [0x086c, %r8]
	.word 0x04ca0008  ! 950: BRLEZ	brlez  ,pt	%8,<label_0xa0008>
	.word 0x8143c000  ! 951: STBAR	stbar
	.word 0x1e800004  ! 952: BVC	bvc  	<label_0x4>
	.word 0xcf3a0009  ! 953: STDF_R	std	%f7, [%r9, %r8]
	.word 0x82520009  ! 954: UMUL_R	umul 	%r8, %r9, %r1
	.word 0x87a20929  ! 955: FMULs	fmuls	%f8, %f9, %f3
	.word 0x8c5a0009  ! 956: SMUL_R	smul 	%r8, %r9, %r6
	.word 0xc47a0009  ! 957: SWAP_R	swap	%r2, [%r8 + %r9]
	.word 0x8af20009  ! 958: UDIVcc_R	udivcc 	%r8, %r9, %r5
	.word 0xc7f22009  ! 959: CASXA_R	casxa	[%r8]%asi, %r9, %r3
	.word 0xc8d21009  ! 960: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r4
	.word 0xfa4a0009  ! 961: LDSB_R	ldsb	[%r8 + %r9], %r29
	.word 0x8da20929  ! 962: FMULs	fmuls	%f8, %f9, %f6
	.word 0xc3222ee0  ! 963: STF_I	st	%f1, [0x0ee0, %r8]
	.word 0x8143c000  ! 964: STBAR	stbar
	.word 0xaa4a219c  ! 965: MULX_I	mulx 	%r8, 0x019c, %r21
	.word 0xc3ea2848  ! 966: PREFETCHA_I	prefetcha	[%r8, + 0x0848] %asi, #one_read
	.word 0x884a0009  ! 967: MULX_R	mulx 	%r8, %r9, %r4
	.word 0xc2aa1009  ! 968: STBA_R	stba	%r1, [%r8 + %r9] 0x80
	.word 0xc9220009  ! 969: STF_R	st	%f4, [%r9, %r8]
	.word 0xcd222d70  ! 971: STF_I	st	%f6, [0x0d70, %r8]
	.word 0xc6b21009  ! 972: STHA_R	stha	%r3, [%r8 + %r9] 0x80
	.word 0xc8d22f58  ! 973: LDSHA_I	ldsha	[%r8, + 0x0f58] %asi, %r4
	.word 0xa5a20929  ! 974: FMULs	fmuls	%f8, %f9, %f18
	.word 0xc2da22f8  ! 975: LDXA_I	ldxa	[%r8, + 0x02f8] %asi, %r1
	.word 0xc4d21009  ! 976: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r2
	.word 0x8143e058  ! 978: MEMBAR	membar	#StoreStore | #Lookaside | #Sync 
	.word 0x8143c000  ! 980: STBAR	stbar
	.word 0xeca22f24  ! 981: STWA_I	stwa	%r22, [%r8 + 0x0f24] %asi
	.word 0xc8a21009  ! 982: STWA_R	stwa	%r4, [%r8 + %r9] 0x80
	.word 0x9ba20929  ! 983: FMULs	fmuls	%f8, %f9, %f13
	.word 0xecb21009  ! 984: STHA_R	stha	%r22, [%r8 + %r9] 0x80
	.word 0x8e6a0009  ! 985: UDIVX_R	udivx 	%r8, %r9, %r7
	.word 0x824a25f4  ! 986: MULX_I	mulx 	%r8, 0x05f4, %r1
	.word 0x3c800008  ! 987: BPOS	bpos,a	<label_0x8>
	.word 0xc24a28e8  ! 988: LDSB_I	ldsb	[%r8 + 0x08e8], %r1
	.word 0x8d6a2a48  ! 989: SDIVX_I	sdivx	%r8, 0x0a48, %r6
	.word 0x24800004  ! 990: BLE	ble,a	<label_0x4>
	.word 0xc48a1009  ! 991: LDUBA_R	lduba	[%r8, %r9] 0x80, %r2
	.word 0x87a208a9  ! 992: FSUBs	fsubs	%f8, %f9, %f3
	.word 0x1e800004  ! 993: BVC	bvc  	<label_0x4>
	.word 0xf3e21009  ! 994: CASA_I	casa	[%r8] 0x80, %r9, %r25
	.word 0x8143e02a  ! 995: MEMBAR	membar	#StoreLoad | #StoreStore | #MemIssue 
	.word 0xf8c21009  ! 996: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r28
	.word 0x1a800004  ! 997: BCC	bcc  	<label_0x4>
	.word 0x84f20009  ! 998: UDIVcc_R	udivcc 	%r8, %r9, %r2
	.word 0xee420009  ! 999: LDSW_R	ldsw	[%r8 + %r9], %r23
	nop
	nop
	nop
	nop
        ta      T_GOOD_TRAP

.data
	.word  0x40208780,0x86076e9e,0x097b9d85,0x395e28c5
	.word  0xf92c2d5e,0x1bf04a09,0x1e0ae434,0xf910df11
	.word  0xbb787622,0x9301718b,0x0f02f01d,0x752d50fc
	.word  0xb55cc376,0x779b8067,0x8537e605,0x6efd999b
	.word  0x48dfdf19,0x73d81a8e,0x777d93ce,0x265964ea
	.word  0xa10c3c9f,0x9acc04fa,0x53939848,0x35a34125
	.word  0x1a100022,0xd8959bc9,0x7afd0ea6,0xbb4b50a7
	.word  0x5c91dd2d,0xad3d67a0,0x4c302f9a,0x82c56a4f
	.word  0x184808fb,0x76c28ee8,0x1879b3b4,0x8661f782
	.word  0xf8fd0b51,0xbb69832c,0x62f7bca9,0x386611e3
	.word  0xbc35cc33,0x73c32b66,0xa4a1653b,0x57d69ca9
	.word  0x60ef6c55,0x0186ef6e,0x79c065cc,0x1b5ccf51
	.word  0x2a98b982,0xf7a43eef,0xaaa05024,0x0c378b70
	.word  0xaaab18b5,0xab0ce01a,0x38c9522e,0x6d214373
	.word  0x22dfa7b3,0x9a36881f,0x174a842a,0xf0efe0f6
	.word  0x60e0cccf,0xd40abce9,0x45e37014,0xcd046478
	.word  0x91bcc6af,0x4f418b1c,0x629c5bae,0x300e8d5f
	.word  0x6432f3e9,0x43150409,0xaf6aaabd,0x3243547c
	.word  0x287c8ecd,0xa74568bb,0x4a023a42,0xd6031fc1
	.word  0x355a2baf,0x230a4500,0x7655ee58,0x2cbae99e
	.word  0xb8c761e6,0xcb7ff167,0xdb398235,0x361f64ba
	.word  0x65b03cc5,0x8d26f1d4,0x4c94d3e4,0x68c576bd
	.word  0xa1138c4a,0xedd99fb9,0x85ec855d,0xab1b6f44
	.word  0x480e7c72,0x9d0347fb,0x6be00109,0x61119754
	.word  0x12be69d6,0xb6343aa3,0xff54cc92,0xf2241b88
	.word  0xc8a7abbb,0x09f0b7b0,0x77df8b19,0xcd5fd2cc
	.word  0xdf64fedc,0xd9e5a8a5,0x0f6ff6a4,0xfb050baf
	.word  0xdbdc781c,0xc65e5c1d,0xbf60a0f3,0xfce4b8b1
	.word  0x35495da8,0xf0852c65,0x885ef644,0x1ad86a02
	.word  0xdfcb3873,0x006adc89,0xa33413d6,0x3eb068a7
	.word  0x3936fc01,0xf1fb3430,0xd0d90d38,0x721343df
	.word  0xeadc0206,0xd3b19154,0x7a4f3b93,0x50c453c5
	.word  0xa91780aa,0x1dffbb8d,0x31d28f5f,0x8ec68d3b
	.word  0x56255c8e,0x44d9ef1f,0xd2013c76,0x1fb0e834
	.word  0x8e9b8571,0x81c52088,0x99a46b3c,0x7f4982fe
	.word  0xb5e57aac,0xd2b2330a,0x172f40d8,0x03033e84
	.word  0xcf0f040b,0xf4175c8a,0xf3227acc,0x0d834318
	.word  0x8b104622,0x707e34a0,0x484977fa,0x034b85d6
	.word  0x6f168d43,0x8de423cf,0x9febe901,0xc4123838
	.word  0xd10c2494,0xfb29624d,0xc11edeed,0xb0b0ae92
	.word  0x5186ae70,0xa91a184a,0xc32e55e8,0x398aad81
	.word  0xd954b052,0x12de6a15,0x245b5c5b,0x0e76f0f5
	.word  0x3a444015,0xe5e287de,0x2c051b05,0xbb0a6151
	.word  0x69fab732,0xa9d9fa70,0x28e2ac66,0x85e633bb
	.word  0xf41292c3,0x08b2d2ea,0x64fe6047,0xe5fd6e0d
	.word  0xe6c13e39,0xb55b8a09,0x695ffdb1,0x85df4749
	.word  0xabba70f6,0xfa26e744,0x10067601,0x5e5d2f56
	.word  0xa3074630,0xd78e79c6,0xf723091b,0xcad12a04
	.word  0xdb7fe38a,0xccf7e1d1,0xe61ddb2d,0xde4b933f
	.word  0x57b1fe63,0xa5b1a88b,0x29a3f839,0xcdff3662
	.word  0xd4ee80f7,0x128aef7a,0x27c3d082,0x69379f89
	.word  0x8b75254d,0x391a72cd,0x31aa3afa,0x371a29a4
	.word  0xb152c3ed,0x86ac9298,0xa30f607a,0x6411213c
	.word  0x88a1d6e5,0x137ed6ce,0x694a2edc,0x79b1804a
	.word  0x428322c3,0x0f9f8040,0x583d316c,0x5d9dbc5b
	.word  0xbd7777b5,0x36ba92b6,0xf6f0acac,0x41c943a0
	.word  0x232a4df0,0x9b9060bf,0xb6692b43,0x6af42e75
	.word  0x8625cf68,0x08443f11,0x84351d1a,0x8cdd70b2
	.word  0x7b62d9b3,0xef6b330e,0x122ab3a3,0x838952b4
	.word  0xdb4bf282,0x6ab1992a,0x0ebaf60f,0xf851cfab
	.word  0x0e8ad3b6,0x24c8fef1,0xa4c589fd,0xec4405b3
	.word  0x535e8cf2,0x3453e2b6,0xc4603043,0xbd1fd779
	.word  0x0a586efe,0x952be0c9,0x5bfd50cc,0x27171702
	.word  0xf11763f0,0x447d081c,0xae89a38e,0x4cb13e1a
	.word  0x5babe4b5,0x59883471,0xacfcd2fb,0x7a9ea131
	.word  0x39e83d43,0x4e5173b1,0xf6e01743,0x6d64c3e4
	.word  0x349070c5,0x1f01a947,0x647b6257,0x2fa70c05
	.word  0x668a7e13,0x5d719004,0xdcba9cb2,0xbeef1427
	.word  0x1a5eaab7,0x98c61593,0x99b310f8,0x40a80f62
	.word  0xb201cd9e,0x063b5544,0x135af478,0xc5199d39
	.word  0xe310dcb4,0xece58155,0x93ebbfdf,0x1211ae90
	.word  0x0abe758f,0x36d8cdbd,0x04c42bd8,0xac14b084
	.word  0xb3737c7e,0x9b19810e,0xf6ee0306,0xcc94d09e
	.word  0x1f14c813,0x6bf6c86f,0x1d0fb8d4,0xc1ddd469
	.word  0x7a82f63a,0xa8dd93a4,0x61491bc9,0x08408a67
	.word  0x6f791b4b,0x6faaecf4,0x6058abfa,0xc8d6b9b7
	.word  0xae121574,0x2c271521,0xdec36173,0xbbe9ef68
	.word  0xad28f16e,0xdcc05ed2,0x646f57fc,0x0047bd9d
	.word  0x5936653f,0x8eb0914e,0xe6f548fd,0x0af9a5c3
	.word  0xe19c97e2,0x79655c76,0xecd653c9,0xe421874b
	.word  0x90548418,0xf76d4f3b,0x5f62fcc1,0x1c1fa373
	.word  0x723d0f4d,0x63e3c648,0x0592b35a,0x524bfc93
	.word  0xb3df7a50,0x8436f1f0,0x7d4062fb,0x36ceaf1a
	.word  0x53147bc6,0xa77adc67,0x34395709,0x22559bf9
	.word  0x6390d742,0xafd3cfa2,0x69a7d09e,0x4dfe0ea8
	.word  0x466f7c0d,0x141f66aa,0x6be1dd78,0x2c3cad16
	.word  0xade4bde3,0xcc9e201c,0xce4d7b3c,0xe67370cf
	.word  0x4fec28ef,0x79b4e0de,0x6e855887,0xf846f238
	.word  0x25e7e2f5,0xb9612b72,0x6d198465,0xa8d8c645
	.word  0xbeb00e74,0x53bed51c,0xc0f36c0b,0x47ba8545
	.word  0x24afe209,0xbb6f9ad7,0xf0d6ca38,0xd15c9bdf
	.word  0x3ba1de66,0xa01f2bbd,0x2edacd62,0x03ac204f
	.word  0xf988b3de,0x0540c914,0x21674947,0x568cc136
	.word  0x75dc59ad,0xd30d7ae2,0xfe6711cd,0xa2acbc6b
	.word  0xd669c699,0xf1d12545,0x640b79f6,0xa5c3b2f1
	.word  0x701fab40,0x03384ffb,0x0c09292a,0x0a4b546f
	.word  0x986bcb02,0x894d72c2,0x8633cb45,0xd3087da6
	.word  0xe71ced92,0xc5101539,0xacbd4844,0x75bc8925
	.word  0x92536ce7,0x1fdda402,0xb8f4918b,0x0c8fd0a1
	.word  0x220a2262,0xa372f3a2,0xdfba89d4,0xe46ad31f
	.word  0x421cfcd7,0xd59cf7a4,0xbfde1387,0xad51f255
	.word  0xd81c8779,0xe847ea17,0xcddcb879,0xc32f92b0
	.word  0x397011e7,0xc4c49fc0,0xcbc85db4,0xc6981843
	.word  0xdd3687ca,0xd10704e7,0xd9a9bd43,0xd04d2487
	.word  0x3adb9925,0x4bfff30f,0x97861570,0x8c130338
	.word  0xe459a2f5,0x3fad0980,0x4d345a31,0x93beb18d
	.word  0x25c814cc,0x10654b44,0x03c94f10,0x2205d8fe
	.word  0xcb9fe2bf,0x5e8d590f,0xe0fa9344,0x560932c9
	.word  0x4c7774e0,0x3c104820,0x87e075af,0x44ec70b9
	.word  0x0d9bb423,0x563c936f,0xe34e56f3,0xaf9519dd
	.word  0x9d54fca3,0x97048dc4,0x869454db,0xd99efa41
	.word  0x9bede1b4,0x6111282f,0xb9060867,0xb498cd63
	.word  0x1a001d23,0x1c0b646d,0xf594bffb,0xae60fdcf
	.word  0x9d9a4cbf,0xdc2503b1,0x23153099,0x92e3853f
	.word  0xfdd8417f,0x70bb3ded,0x49f49cb2,0x2d0f8a8c
	.word  0x73e3c81c,0xc830f16a,0x67e0fcca,0xbf7fd82e
	.word  0xf19f22c3,0x857d1cbb,0x99403c21,0xb349fcb3
	.word  0x09e2a902,0x1e27fdcc,0xfdc65354,0xc35209b6
	.word  0x6cfc92b2,0xf79bc4ab,0x1ab2afd1,0xc2c57f31
	.word  0xd2306fd4,0x72e8a825,0x874c96f1,0xa425e6e3
	.word  0xe2d37349,0x614d4330,0x2cb030fa,0xc53a897d
	.word  0x4a178a2e,0xe2b0aa4d,0x55a17a32,0x78ce9d28
	.word  0x5bf8d485,0x2e3f108c,0xbb5ad012,0x94a84109
	.word  0xd7a907fd,0x35c1181f,0x6ac04502,0x7b632719
	.word  0xcb3f06d0,0x665b47fb,0xf8727559,0x827e11b4
	.word  0x8ac1a864,0x40e3324b,0xece84065,0xa566296e
	.word  0x5e6c80e9,0x76c7039e,0x792b1d22,0x602e39df
	.word  0xaf278c95,0xc7d66428,0xe21107a9,0x2df1e5be
	.word  0x13b2203d,0xc63a4abf,0xc408077d,0x623227ed
	.word  0xbb7a4ca3,0x2c622364,0x3a017a2a,0x868d734f
	.word  0x3d681b0e,0xc9ee128a,0x20c0cc14,0x6d13dec8
	.word  0x5187706b,0xa4fa943a,0x14b2beb3,0xb2c5b890
	.word  0xbc208ed9,0xa9f1fe30,0xbeb7d043,0x3752c9f2
	.word  0x076c78a2,0xb4079b2b,0x9ddeacd0,0xf066f7ea
	.word  0x22738a98,0x5b046a96,0x2b52b7bf,0x6dddcf7e
	.word  0xd5b166b8,0x5363df2a,0x4e9bad8a,0x9d0c9cf4
	.word  0x3a6e9c24,0xf680fb40,0x4b961ef6,0x87f9d8c6
	.word  0xe2afa1cf,0x8b64a32f,0xf3bfb008,0x4351bdd7
	.word  0x0a9922e6,0x05f2dde0,0xef1a0a26,0xfe616c58
	.word  0xcb722d93,0x3ca78683,0x416c8c33,0x86ed9f51
	.word  0xa801900e,0xa7ebac59,0x8a6ec4ea,0xb8857143
	.word  0x266b1327,0x179a2b81,0x84287880,0x8927c2bd
	.word  0x0bae48a2,0x52bd3689,0x0a1d3f13,0x9cfcb642
	.word  0x080a74ac,0x65e3059c,0x7c011d96,0xa598c255
	.word  0xc5c5090d,0x0a31617c,0x4ab61b78,0x4f9cde21
	.word  0x7956b52a,0x909a6d21,0x31c74fdc,0xa5e10e88
	.word  0x52152a77,0x25d6becc,0xb159c737,0x42002d4a
	.word  0x47c1b9ab,0x6406362d,0x1320f6cf,0x5ef5935c
	.word  0xed4e0d21,0x5d9c5d00,0x31719170,0xa7b18ab3
	.word  0x5a3f8827,0xf490a6b8,0xa5ee3220,0x0f37839e
	.word  0x4d930773,0x5d9a310f,0x21265f3e,0x817334f1
	.word  0xca8edcb2,0x734f285b,0x66f317b5,0xd23c46ba
	.word  0x714c983e,0x9e8a748d,0xd9107917,0x50b4e88e
	.word  0x0579bafa,0x5cd5a087,0xf646503c,0x34a284ff
	.word  0x8e3f3cb2,0x4550d3f0,0x7335aceb,0x72496278
	.word  0x37778a1c,0x0c859361,0xd0c54fcf,0x589f84a3
	.word  0x60af0b0b,0x2eb6bdeb,0x84273c2b,0x3a070872
	.word  0xbce8cc4f,0xb890ee05,0x4720f9e2,0x111f55d8
	.word  0x48aa5072,0x702e5c91,0xb9329216,0xa851fc7e
	.word  0x532f5f15,0x385c5feb,0x1f1f4add,0xda60d5af
	.word  0x8092467d,0xe0e0ef0d,0x2b470a77,0x0ce11d94
	.word  0x4709bd6d,0xc17a5dcb,0x89a6e196,0x9f5b5bf6
	.word  0x15188711,0xbc57f56a,0xd633dc99,0x71bf4352
	.word  0x2e9648ba,0x180702cf,0xf9850538,0xf5209e63
	.word  0x3b57fea9,0x1c8ac93f,0x2a5d1972,0x372bdb67
	.word  0x64d0e009,0xaaa5b26b,0x9955a901,0xc5fbcd0b
	.word  0x5b6a5174,0x9ed5bd3f,0x822c422c,0xbadfae11
	.word  0xd7de9fc5,0xbd5c4e11,0x7c8b95e9,0x76666626
	.word  0x07e53ffb,0x39a86252,0x1d6a5d4f,0x3f034dab
	.word  0x99e99444,0x8afa077d,0x5151ad67,0x4e333c0f
	.word  0x689bbb88,0xed3668d1,0x695b5054,0x7d486ae3
	.word  0x6aba6697,0xbdf51432,0xdddb6c46,0xe2cf2f0b
	.word  0x5e7b3e24,0x602b1709,0xd0d93873,0xb83a2ac1
	.word  0x99c1ceac,0x89b676e3,0xca69f58c,0x4043529c
	.word  0x2a002e85,0x03bc9342,0xcc090232,0x22eaddc5
	.word  0xbca0c5d6,0xd956b53e,0x2cb44e46,0xb6a05080
	.word  0xee0c2659,0x93e60c95,0x80bf2759,0x8a056415
	.word  0xd0a18c2e,0x53932e48,0x6b657bb9,0x0a240868
	.word  0x6e0428de,0x5ea1cdb2,0x4aed7837,0xbad4e69e
	.word  0x3378e1ea,0x0c6452c6,0x2e3adc1a,0x75c003b7
	.word  0x68d2ba89,0xad97d3eb,0x55b19bfd,0xf7d7260b
	.word  0x713d1a77,0xace61452,0xb5fabd4a,0xdb85980c
	.word  0xf04853a0,0xaef56b05,0x3f8a05ab,0x0f11c456
	.word  0x4fbf2fb8,0xab4ab36b,0xc04a521d,0x53846247
	.word  0x1f45ef6d,0xb56b5f5b,0xb895bd8f,0x18888249
	.word  0x1751cc5c,0x196493d4,0x08de027a,0x39a0e470
	.word  0xd2f8e90b,0xd8bd3b1f,0xa58095e8,0x09553321
	.word  0x348061d1,0xc95a3985,0xe4a351f5,0x689391cb
	.word  0x21c4e0d9,0x2e477708,0xd4fa2ee2,0xf5c5ed0e
	.word  0xc1e6bb96,0x5fe61938,0x2b7f039c,0xd57cbd27
	.word  0xf799e4eb,0xcc8ca6f4,0xdfa27b57,0xc534b25b
	.word  0x7a701f53,0x4359fff5,0x6a6f5803,0x2b81b115
	.word  0xc19bf422,0x997b23b2,0xaa9c0b5d,0xc3291055
	.word  0x45bd8e5e,0xdb32b12e,0xc26a927b,0x7477bc66
	.word  0x128e498a,0x6c8d242b,0x229729c7,0x37066b88
	.word  0x0e0882b3,0x53a0f806,0x511224ee,0x27340a64
	.word  0x5f21f1d5,0x239b785c,0x657c3e24,0xd20de686
	.word  0xf9a6903d,0x94bfdebc,0x9cf76699,0x26e98098
	.word  0x41fe707c,0x3172c845,0xae16ec70,0x92266c7f
	.word  0x845e3745,0xf82adca5,0xd529955d,0x60baad7b
	.word  0x67b9a9fd,0x337c44b6,0xb6ed9784,0x79332c29
	.word  0x7daadac4,0x9ba1fca6,0x7528014a,0x1447c44b
	.word  0x2256091c,0x9c730fd5,0x12151c26,0x912b6ad1
	.word  0x1771069e,0x903fadbb,0x1f905ccb,0x291c48ed
	.word  0xe1c61363,0xd040ab1f,0x40b6160c,0x9dbd33de
	.word  0x132b5290,0x6bd2254a,0x497b83e9,0xceedc315
	.word  0x661af6c6,0xc0558482,0x13d247b5,0x0f58efa2
	.word  0x98fda512,0x31e18dc8,0x950769dc,0xb91e520c
	.word  0x057986c4,0x77a64ebf,0xaff66e84,0xce2d4131
	.word  0xead84796,0x5b1350b5,0x26279bd3,0x04f0354f
	.word  0x6b3577b6,0xa29c82c0,0x07c0bd52,0xbb800558
	.word  0x0daef3ba,0x30ad79fa,0xd86fa8b3,0x5af6b40d
	.word  0xfa3b352d,0x1784b6e2,0x53604916,0x6890cdd2
	.word  0xe1721d25,0x6f56b136,0xdbf209bd,0x4d8f5cfc
	.word  0xb9023e35,0x210011fd,0xb95bc547,0x06c85062
	.word  0x1a41488a,0x8ff69a3b,0x66ece26f,0x3646d9f9
	.word  0x24578dfa,0xbe259446,0x3b85e787,0x564af5dd
	.word  0xe1149fed,0xb4f991eb,0x2a4c81d6,0x8c7cb985
	.word  0x625b7e58,0xda6030e9,0x4568c14e,0x8b1dcc9f
	.word  0xeec8f072,0x3f652209,0xb2b78dfa,0x99688c2a
	.word  0xf9a3edf5,0xdad7d276,0x5d84a880,0x82936245
	.word  0x5418bafa,0x1d1dc107,0xa4540c09,0x61ce6173
	.word  0x9d4d5775,0xcd7b7074,0xb5799b60,0x2f2c71e1
	.word  0x1ce5c220,0x77b5c5cb,0xc0f9f857,0x5ad1aa08
	.word  0x1c4fdec5,0xfec0cf1f,0xed974c38,0x99fdaa90
	.word  0x615ec390,0xd4bd8b18,0x8bee8faa,0x8ad58437
	.word  0xeb264465,0x7daf2b32,0x62cab995,0xe3976067
	.word  0x527b17cd,0x19860be0,0x9a3bfd7c,0xcb7cb32b
	.word  0x667bf465,0x6fba6dfb,0xa47a63d0,0x36229cbf
	.word  0xdc1bd82b,0xf94d6f06,0xfaf12ca6,0x22b07f4e
	.word  0x3034568f,0x6d60c971,0x051014a3,0xe2d243ed
	.word  0x7352e98b,0xee86bed8,0x26c1e64c,0x7f9ed732
	.word  0x91c5d7da,0xd6eb46c7,0x8239f357,0xb81e201f
	.word  0x4b40c9fd,0x006192ec,0x94eea10a,0x14d309c5
	.word  0x009e1a1b,0x5926233f,0xadd191fc,0x98986708
	.word  0x3a8b778c,0x3e3ad8b2,0xf6487ba1,0x6639c7a6
	.word  0x2293046f,0x472f87b6,0xa9a86c6e,0x0298da2c
	.word  0xeafd5ef6,0xe5055485,0x13fb8357,0xeac75784
	.word  0x29e29b92,0x58b22ce6,0x00e7725a,0x28f3dc3c
	.word  0x3c9ea40c,0x07dcd203,0x57424c0c,0x1e597667
	.word  0xe6fb1b2b,0x2ba76f3f,0xbabcc784,0x33232064
	.word  0x9a2f428f,0x7642f96c,0x5b08e62d,0xb89dcf6e
	.word  0xc69125c4,0xdee7e0fa,0x8275278e,0xd6f2cb9b
	.word  0xfc57628f,0xa8e5cdcd,0xfa2bd1a2,0xcdc88ceb
	.word  0x53938a5b,0xfb084f42,0x53379c0b,0xe61f9943
	.word  0xa19bf8fa,0xc957b85c,0xaf34a340,0x42cc7cbf
	.word  0x397af43c,0x2c462afd,0xf0785416,0x697640b8
	.word  0x029abb21,0xa2041adc,0xb6887630,0xf3b6daa3
	.word  0x21d24062,0xf47785ef,0x0d4da05f,0xdefb7bb9
	.word  0xb75b89a4,0x27238591,0xd9ef7b7f,0x4f831ddb
	.word  0x6b28ba96,0xbc5975ed,0xc440fd1d,0x14c12be3
	.word  0x94b8bd50,0x97e035ac,0xc47410fe,0x31306450
	.word  0x07e6d7e0,0xd9739afa,0x44a014af,0x5b77dc78
	.word  0x1b79aea6,0xc94c5eeb,0x3a999603,0x5a6b80ec
	.word  0x5fada09f,0x45db81fc,0x2ffb381e,0xaefcbc2c
	.word  0x0089582d,0xc5ff2819,0xb96fba51,0x3d12db0e



