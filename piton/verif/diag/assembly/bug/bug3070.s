// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: bug3070.s
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
/*******************************************************************************
   random seed:	651733398
   Jal stb_raw_0.j:	
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
        setx  0x0000000000000240, %g1, %r9
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
        setx  0x5bcb77ce324c4aeb, %g1, %r0
        setx  0xf4827a53b6bfc94b, %g1, %r1
        setx  0x5ff64cb6e9f911dd, %g1, %r2
        setx  0xedae56c1122233ea, %g1, %r3
        setx  0xa4c8e1fea18da88d, %g1, %r4
        setx  0x73f0234fb272a0d1, %g1, %r5
        setx  0xc6781074b4f57ece, %g1, %r6
        setx  0x137484eba10193c7, %g1, %r7
        setx  0x94391cfcb951fc12, %g1, %r10
        setx  0x6eeb88f68472af8b, %g1, %r11
        setx  0x147053d363779850, %g1, %r12
        setx  0x286b90c2ab3d98c3, %g1, %r13
        setx  0xfb261a31aa3f067c, %g1, %r14
        setx  0xd91ae140e0a7d68c, %g1, %r15
        setx  0x965d8c1e72319eac, %g1, %r16
        setx  0xa5ab654862ba5616, %g1, %r17
        setx  0xef49eac80eab1e68, %g1, %r18
        setx  0x24d6a3e86354bd48, %g1, %r19
        setx  0xaa334c901f893140, %g1, %r20
        setx  0xa4fcf20a864b0998, %g1, %r21
        setx  0xc65ea9c8ad5f1820, %g1, %r22
        setx  0x6a98fff462b41946, %g1, %r23
        setx  0x533f03888a0dcd50, %g1, %r24
        setx  0x71dbf93e67f5003c, %g1, %r25
        setx  0xd3560b37895de55d, %g1, %r26
        setx  0x5e711f0a85df89d8, %g1, %r27
        setx  0x57d3dd74a55e6a56, %g1, %r28
        setx  0x5723f1dcb12effec, %g1, %r29
        setx  0x281afcc2d80050f4, %g1, %r30
        setx  0x9541794447d1404f, %g1, %r31
	.word 0xcea22c30  ! 1: STWA_I	stwa	%r7, [%r8 + 0x0c30] %asi
	.word 0x9afa0009  ! 2: SDIVcc_R	sdivcc 	%r8, %r9, %r13
	.word 0xee320009  ! 4: STH_R	sth	%r23, [%r8 + %r9]
	.word 0xc4520009  ! 4: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0x8eda261c  ! 5: SMULcc_I	smulcc 	%r8, 0x061c, %r7
	.word 0xcf1a0009  ! 6: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xc6a21009  ! 7: STWA_R	stwa	%r3, [%r8 + %r9] 0x80
	.word 0x8143e019  ! 8: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside 
	.word 0xc36a20e4  ! 9: PREFETCH_I	prefetch	[%r8 + 0x00e4], #one_read
	.word 0xc8ca21fc  ! 10: LDSBA_I	ldsba	[%r8, + 0x01fc] %asi, %r4
	.word 0x0e800001  ! 11: BVS	bvs  	<label_0x1>
	.word 0xc3ea1009  ! 12: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xbe5a24b0  ! 13: SMUL_I	smul 	%r8, 0x04b0, %r31
	.word 0xc3ea1009  ! 14: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x2a800001  ! 15: BCS	bcs,a	<label_0x1>
	.word 0x8f6a2604  ! 16: SDIVX_I	sdivx	%r8, 0x0604, %r7
	.word 0xc4aa2a1c  ! 17: STBA_I	stba	%r2, [%r8 + 0x0a1c] %asi
	.word 0xc36a27c8  ! 18: PREFETCH_I	prefetch	[%r8 + 0x07c8], #one_read
	.word 0xd8220009  ! 20: STW_R	stw	%r12, [%r8 + %r9]
	.word 0xc40a0009  ! 20: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xce420009  ! 21: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xcf1a2210  ! 22: LDDF_I	ldd	[%r8, 0x0210], %f7
	.word 0xaa5222a0  ! 23: UMUL_I	umul 	%r8, 0x02a0, %r21
	.word 0x88d20009  ! 24: UMULcc_R	umulcc 	%r8, %r9, %r4
	.word 0xf0f22388  ! 25: STXA_I	stxa	%r24, [%r8 + 0x0388] %asi
	.word 0xce0a2620  ! 26: LDUB_I	ldub	[%r8 + 0x0620], %r7
	.word 0xcf3a0009  ! 28: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc8720009  ! 29: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xcb1a0009  ! 29: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xcc0a0009  ! 30: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xf0a2268c  ! 31: STWA_I	stwa	%r24, [%r8 + 0x068c] %asi
	.word 0x887a2940  ! 32: SDIV_I	sdiv 	%r8, 0x0940, %r4
	.word 0xc3ea1009  ! 33: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x8143c000  ! 34: STBAR	stbar
	.word 0xf00a0009  ! 35: LDUB_R	ldub	[%r8 + %r9], %r24
	.word 0xc2320009  ! 37: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc24a0009  ! 37: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xea8a2b1c  ! 38: LDUBA_I	lduba	[%r8, + 0x0b1c] %asi, %r21
	.word 0xcc2a0009  ! 40: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xcc1a0009  ! 40: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xc44a2f38  ! 41: LDSB_I	ldsb	[%r8 + 0x0f38], %r2
	.word 0x02c20001  ! 42: BRZ	brz  ,nt	%8,<label_0x20001>
	.word 0x8143e039  ! 43: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside | #MemIssue 
	.word 0xc36a0009  ! 44: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc9e22009  ! 45: CASA_R	casa	[%r8] %asi, %r9, %r4
	.word 0xad6a2be8  ! 46: SDIVX_I	sdivx	%r8, 0x0be8, %r22
	.word 0x8cda0009  ! 47: SMULcc_R	smulcc 	%r8, %r9, %r6
	.word 0xcaea2b40  ! 48: LDSTUBA_I	ldstuba	%r5, [%r8 + 0x0b40] %asi
	.word 0xc53a2bf0  ! 49: STDF_I	std	%f2, [0x0bf0, %r8]
	.word 0xe0220009  ! 51: STW_R	stw	%r16, [%r8 + %r9]
	.word 0xc85a0009  ! 51: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xc81a2ea8  ! 52: LDD_I	ldd	[%r8 + 0x0ea8], %r4
	.word 0xf6fa1009  ! 53: SWAPA_R	swapa	%r27, [%r8 + %r9] 0x80
	.word 0x8ba20829  ! 54: FADDs	fadds	%f8, %f9, %f5
	.word 0xc8320009  ! 56: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xd91a0009  ! 56: LDDF_R	ldd	[%r8, %r9], %f12
	.word 0xcbe22009  ! 57: CASA_R	casa	[%r8] %asi, %r9, %r5
	.word 0xe50222f8  ! 58: LDF_I	ld	[%r8, 0x02f8], %f18
	.word 0xfc8a2bd8  ! 59: LDUBA_I	lduba	[%r8, + 0x0bd8] %asi, %r30
	.word 0xa0722894  ! 60: UDIV_I	udiv 	%r8, 0x0894, %r16
	.word 0x8143e012  ! 61: MEMBAR	membar	#StoreLoad | #Lookaside 
	.word 0xcc6a22a0  ! 62: LDSTUB_I	ldstub	%r6, [%r8 + 0x02a0]
	.word 0xe9220009  ! 64: STF_R	st	%f20, [%r9, %r8]
	.word 0xca720009  ! 65: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc64a0009  ! 65: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0x1c800001  ! 66: BPOS	bpos  	<label_0x1>
	.word 0x9e520009  ! 67: UMUL_R	umul 	%r8, %r9, %r15
	.word 0x8143e06d  ! 68: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #MemIssue | #Sync 
	.word 0x8143e007  ! 69: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore 
	.word 0xc2220009  ! 71: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc81a0009  ! 71: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xc3ea1009  ! 72: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xcb220009  ! 74: STF_R	st	%f5, [%r9, %r8]
	.word 0xc4720009  ! 75: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc8520009  ! 75: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0x8143c000  ! 76: STBAR	stbar
	.word 0xbda208a9  ! 77: FSUBs	fsubs	%f8, %f9, %f30
	.word 0xf40a0009  ! 78: LDUB_R	ldub	[%r8 + %r9], %r26
	.word 0x3c800001  ! 79: BPOS	bpos,a	<label_0x1>
	.word 0x02800002  ! 80: BE	be  	<label_0x2>
	.word 0x8d222ac8  ! 81: MULScc_I	mulscc 	%r8, 0x0ac8, %r6
	.word 0x20800002  ! 82: BN	bn,a	<label_0x2>
	.word 0xc6f21009  ! 83: STXA_R	stxa	%r3, [%r8 + %r9] 0x80
	.word 0xccaa202c  ! 84: STBA_I	stba	%r6, [%r8 + 0x002c] %asi
	.word 0x8143e031  ! 85: MEMBAR	membar	#LoadLoad | #Lookaside | #MemIssue 
	.word 0xc3ea2da4  ! 86: PREFETCHA_I	prefetcha	[%r8, + 0x0da4] %asi, #one_read
	.word 0xc45a2fd0  ! 87: LDX_I	ldx	[%r8 + 0x0fd0], %r2
	.word 0x8143c000  ! 88: STBAR	stbar
	.word 0xa8722c14  ! 89: UDIV_I	udiv 	%r8, 0x0c14, %r20
	.word 0xce220009  ! 91: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc31a0009  ! 91: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xcc320009  ! 93: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xee5a0009  ! 93: LDX_R	ldx	[%r8 + %r9], %r23
	.word 0xc4aa1009  ! 94: STBA_R	stba	%r2, [%r8 + %r9] 0x80
	.word 0x8cda0009  ! 95: SMULcc_R	smulcc 	%r8, %r9, %r6
	.word 0xf52222ac  ! 96: STF_I	st	%f26, [0x02ac, %r8]
	.word 0xa36a2b0c  ! 97: SDIVX_I	sdivx	%r8, 0x0b0c, %r17
	.word 0x88522f14  ! 98: UMUL_I	umul 	%r8, 0x0f14, %r4
	.word 0x06ca0001  ! 99: BRLZ	brlz  ,pt	%8,<label_0xa0001>
	.word 0xdf3a2398  ! 100: STDF_I	std	%f15, [0x0398, %r8]
	.word 0xe0320009  ! 102: STH_R	sth	%r16, [%r8 + %r9]
	.word 0xc4120009  ! 102: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xc6a2216c  ! 103: STWA_I	stwa	%r3, [%r8 + 0x016c] %asi
	.word 0xc2320009  ! 105: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xca5a0009  ! 105: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xc3ea2178  ! 106: PREFETCHA_I	prefetcha	[%r8, + 0x0178] %asi, #one_read
	.word 0xd9f22009  ! 107: CASXA_R	casxa	[%r8]%asi, %r9, %r12
	.word 0x87222f20  ! 108: MULScc_I	mulscc 	%r8, 0x0f20, %r3
	.word 0xc36a0009  ! 109: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0x8da209a9  ! 110: FDIVs	fdivs	%f8, %f9, %f6
	.word 0xc2921009  ! 111: LDUHA_R	lduha	[%r8, %r9] 0x80, %r1
	.word 0xc67a2be8  ! 112: SWAP_I	swap	%r3, [%r8 + 0x0be8]
	.word 0x0aca0001  ! 113: BRNZ	brnz  ,pt	%8,<label_0xa0001>
	.word 0xf1222da4  ! 114: STF_I	st	%f24, [0x0da4, %r8]
	.word 0x8143c000  ! 115: STBAR	stbar
	.word 0xc9020009  ! 116: LDF_R	ld	[%r8, %r9], %f4
	.word 0x82f20009  ! 117: UDIVcc_R	udivcc 	%r8, %r9, %r1
	.word 0x884a2678  ! 118: MULX_I	mulx 	%r8, 0x0678, %r4
	.word 0xc7f21009  ! 119: CASXA_I	casxa	[%r8] 0x80, %r9, %r3
	.word 0x8fa20829  ! 120: FADDs	fadds	%f8, %f9, %f7
	.word 0xd65a0009  ! 121: LDX_R	ldx	[%r8 + %r9], %r11
	.word 0xe01a2310  ! 122: LDD_I	ldd	[%r8 + 0x0310], %r16
	.word 0xc36a0009  ! 123: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0x12800001  ! 124: BNE	bne  	<label_0x1>
	.word 0x8143e047  ! 125: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Sync 
	.word 0xd8320009  ! 127: STH_R	sth	%r12, [%r8 + %r9]
	.word 0xca120009  ! 127: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xcef229b8  ! 128: STXA_I	stxa	%r7, [%r8 + 0x09b8] %asi
	.word 0xc4da1009  ! 129: LDXA_R	ldxa	[%r8, %r9] 0x80, %r2
	.word 0xc4d21009  ! 130: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r2
	.word 0xccd21009  ! 131: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r6
	.word 0xbfa20929  ! 132: FMULs	fmuls	%f8, %f9, %f31
	.word 0x836a0009  ! 133: SDIVX_R	sdivx	%r8, %r9, %r1
	.word 0x8143c000  ! 134: STBAR	stbar
	.word 0xc8220009  ! 136: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xcc1a0009  ! 136: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0x89a208a9  ! 137: FSUBs	fsubs	%f8, %f9, %f4
	.word 0xc3ea2608  ! 138: PREFETCHA_I	prefetcha	[%r8, + 0x0608] %asi, #one_read
	.word 0xcfe22009  ! 139: CASA_R	casa	[%r8] %asi, %r9, %r7
	.word 0xbda20829  ! 140: FADDs	fadds	%f8, %f9, %f30
	.word 0xc8720009  ! 142: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xce520009  ! 142: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0x87a208a9  ! 143: FSUBs	fsubs	%f8, %f9, %f3
	.word 0x8143e063  ! 144: MEMBAR	membar	#LoadLoad | #StoreLoad | #MemIssue | #Sync 
	.word 0xbada2014  ! 145: SMULcc_I	smulcc 	%r8, 0x0014, %r29
	.word 0x16800001  ! 146: BGE	bge  	<label_0x1>
	.word 0xc4720009  ! 148: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc2020009  ! 148: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xc3ea1009  ! 149: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc3ea1009  ! 150: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xa56a2328  ! 151: SDIVX_I	sdivx	%r8, 0x0328, %r18
	.word 0xfc1a0009  ! 152: LDD_R	ldd	[%r8 + %r9], %r30
	.word 0xc22a0009  ! 154: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc2020009  ! 154: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xc6d21009  ! 155: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r3
	.word 0xfa7a0009  ! 156: SWAP_R	swap	%r29, [%r8 + %r9]
	.word 0xed3a2260  ! 157: STDF_I	std	%f22, [0x0260, %r8]
	.word 0x8143c000  ! 158: STBAR	stbar
	.word 0xc3ea1009  ! 159: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc42a0009  ! 161: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xe81a0009  ! 161: LDD_R	ldd	[%r8 + %r9], %r20
	.word 0x04ca0001  ! 162: BRLEZ	brlez  ,pt	%8,<label_0xa0001>
	.word 0x84fa0009  ! 163: SDIVcc_R	sdivcc 	%r8, %r9, %r2
	.word 0xc3ea2030  ! 164: PREFETCHA_I	prefetcha	[%r8, + 0x0030] %asi, #one_read
	.word 0xb66a2890  ! 165: UDIVX_I	udivx 	%r8, 0x0890, %r27
	.word 0xc4ba2a68  ! 166: STDA_I	stda	%r2, [%r8 + 0x0a68] %asi
	.word 0xf6fa2de4  ! 167: SWAPA_I	swapa	%r27, [%r8 + 0x0de4] %asi
	.word 0x1a800002  ! 168: BCC	bcc  	<label_0x2>
	.word 0xc36a0009  ! 169: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc93a26f8  ! 170: STDF_I	std	%f4, [0x06f8, %r8]
	.word 0x2aca0001  ! 171: BRNZ	brnz,a,pt	%8,<label_0xa0001>
	.word 0xc36a0009  ! 172: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xacf20009  ! 173: UDIVcc_R	udivcc 	%r8, %r9, %r22
	.word 0x82da0009  ! 174: SMULcc_R	smulcc 	%r8, %r9, %r1
	.word 0xc2720009  ! 176: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xce5a0009  ! 176: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0x8e720009  ! 177: UDIV_R	udiv 	%r8, %r9, %r7
	.word 0x99222094  ! 178: MULScc_I	mulscc 	%r8, 0x0094, %r12
	.word 0x8eda0009  ! 179: SMULcc_R	smulcc 	%r8, %r9, %r7
	.word 0xfe821009  ! 180: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r31
	.word 0x2ec20001  ! 181: BRGEZ	brgez,a,nt	%8,<label_0x20001>
	.word 0xc9222a8c  ! 182: STF_I	st	%f4, [0x0a8c, %r8]
	.word 0xcab21009  ! 183: STHA_R	stha	%r5, [%r8 + %r9] 0x80
	.word 0x22800001  ! 184: BE	be,a	<label_0x1>
	.word 0xe8b21009  ! 185: STHA_R	stha	%r20, [%r8 + %r9] 0x80
	.word 0xa66a2f28  ! 186: UDIVX_I	udivx 	%r8, 0x0f28, %r19
	.word 0xc51a0009  ! 187: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xa27a0009  ! 188: SDIV_R	sdiv 	%r8, %r9, %r17
	.word 0xca6a0009  ! 189: LDSTUB_R	ldstub	%r5, [%r8 + %r9]
	.word 0xc51a2230  ! 190: LDDF_I	ldd	[%r8, 0x0230], %f2
	.word 0x8143c000  ! 191: STBAR	stbar
	.word 0x83a20929  ! 192: FMULs	fmuls	%f8, %f9, %f1
	.word 0xc62a0009  ! 194: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xea120009  ! 194: LDUH_R	lduh	[%r8 + %r9], %r21
	.word 0x8143c000  ! 195: STBAR	stbar
	.word 0xc36a2000  ! 196: PREFETCH_I	prefetch	[%r8 + 0x0000], #one_read
	.word 0xc42a0009  ! 198: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xd6020009  ! 198: LDUW_R	lduw	[%r8 + %r9], %r11
	.word 0x24800001  ! 199: BLE	ble,a	<label_0x1>
	.word 0x8e5a0009  ! 200: SMUL_R	smul 	%r8, %r9, %r7
	.word 0xb4f225bc  ! 201: UDIVcc_I	udivcc 	%r8, 0x05bc, %r26
	.word 0x8ad22158  ! 202: UMULcc_I	umulcc 	%r8, 0x0158, %r5
	.word 0x887a2fe8  ! 203: SDIV_I	sdiv 	%r8, 0x0fe8, %r4
	.word 0xc9222e9c  ! 204: STF_I	st	%f4, [0x0e9c, %r8]
	.word 0xf02a0009  ! 206: STB_R	stb	%r24, [%r8 + %r9]
	.word 0xc8120009  ! 206: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0x0a800001  ! 207: BCS	bcs  	<label_0x1>
	.word 0xc6c229b8  ! 208: LDSWA_I	ldswa	[%r8, + 0x09b8] %asi, %r3
	.word 0xe0220009  ! 210: STW_R	stw	%r16, [%r8 + %r9]
	.word 0xcc420009  ! 210: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xc36a0009  ! 211: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0x886a2ee0  ! 212: UDIVX_I	udivx 	%r8, 0x0ee0, %r4
	.word 0xcc1228fc  ! 213: LDUH_I	lduh	[%r8 + 0x08fc], %r6
	.word 0x867a0009  ! 214: SDIV_R	sdiv 	%r8, %r9, %r3
	.word 0x26ca0001  ! 215: BRLZ	brlz,a,pt	%8,<label_0xa0001>
	.word 0x32800001  ! 216: BNE	bne,a	<label_0x1>
	.word 0xe2ea2660  ! 217: LDSTUBA_I	ldstuba	%r17, [%r8 + 0x0660] %asi
	.word 0xe8220009  ! 219: STW_R	stw	%r20, [%r8 + %r9]
	.word 0xc24a0009  ! 219: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xc3ea1009  ! 220: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xce6a0009  ! 221: LDSTUB_R	ldstub	%r7, [%r8 + %r9]
	.word 0xb1a20829  ! 222: FADDs	fadds	%f8, %f9, %f24
	.word 0xb76a2e0c  ! 223: SDIVX_I	sdivx	%r8, 0x0e0c, %r27
	.word 0xda720009  ! 225: STX_R	stx	%r13, [%r8 + %r9]
	.word 0xc4420009  ! 225: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xc4ca2a6c  ! 226: LDSBA_I	ldsba	[%r8, + 0x0a6c] %asi, %r2
	.word 0x84d222a0  ! 227: UMULcc_I	umulcc 	%r8, 0x02a0, %r2
	.word 0xcaf22f18  ! 228: STXA_I	stxa	%r5, [%r8 + 0x0f18] %asi
	.word 0xca022f98  ! 229: LDUW_I	lduw	[%r8 + 0x0f98], %r5
	.word 0x8a7a0009  ! 230: SDIV_R	sdiv 	%r8, %r9, %r5
	.word 0xa6fa2898  ! 231: SDIVcc_I	sdivcc 	%r8, 0x0898, %r19
	.word 0x96d20009  ! 232: UMULcc_R	umulcc 	%r8, %r9, %r11
	.word 0xccfa2fac  ! 233: SWAPA_I	swapa	%r6, [%r8 + 0x0fac] %asi
	.word 0xbef20009  ! 234: UDIVcc_R	udivcc 	%r8, %r9, %r31
	.word 0xc22a0009  ! 236: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc65a0009  ! 236: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xc6d21009  ! 237: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r3
	.word 0xcc2a0009  ! 239: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xee020009  ! 239: LDUW_R	lduw	[%r8 + %r9], %r23
	.word 0xacf20009  ! 240: UDIVcc_R	udivcc 	%r8, %r9, %r22
	.word 0x886a2360  ! 241: UDIVX_I	udivx 	%r8, 0x0360, %r4
	.word 0xe82a0009  ! 243: STB_R	stb	%r20, [%r8 + %r9]
	.word 0xca120009  ! 243: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xea220009  ! 245: STW_R	stw	%r21, [%r8 + %r9]
	.word 0xc8420009  ! 245: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xf2da21c8  ! 246: LDXA_I	ldxa	[%r8, + 0x01c8] %asi, %r25
	.word 0x865a2780  ! 247: SMUL_I	smul 	%r8, 0x0780, %r3
	.word 0xcc220009  ! 249: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc31a0009  ! 249: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xc36a0009  ! 250: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xce8a2450  ! 251: LDUBA_I	lduba	[%r8, + 0x0450] %asi, %r7
	.word 0x0ec20001  ! 252: BRGEZ	brgez  ,nt	%8,<label_0x20001>
	.word 0x8143c000  ! 253: STBAR	stbar
	.word 0x845a0009  ! 254: SMUL_R	smul 	%r8, %r9, %r2
	.word 0xc2120009  ! 255: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xee822390  ! 256: LDUWA_I	lduwa	[%r8, + 0x0390] %asi, %r23
	.word 0xc4ea1009  ! 257: LDSTUBA_R	ldstuba	%r2, [%r8 + %r9] 0x80
	.word 0xfc220009  ! 259: STW_R	stw	%r30, [%r8 + %r9]
	.word 0xca0a0009  ! 259: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0x82d22690  ! 260: UMULcc_I	umulcc 	%r8, 0x0690, %r1
	.word 0xbba209a9  ! 261: FDIVs	fdivs	%f8, %f9, %f29
	.word 0x22800002  ! 262: BE	be,a	<label_0x2>
	.word 0xf0a21009  ! 263: STWA_R	stwa	%r24, [%r8 + %r9] 0x80
	.word 0xc53a2300  ! 264: STDF_I	std	%f2, [0x0300, %r8]
	.word 0xcc6a0009  ! 265: LDSTUB_R	ldstub	%r6, [%r8 + %r9]
	.word 0xef3a2a20  ! 266: STDF_I	std	%f23, [0x0a20, %r8]
	.word 0xc36a0009  ! 267: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0x9afa0009  ! 268: SDIVcc_R	sdivcc 	%r8, %r9, %r13
	.word 0x86da0009  ! 269: SMULcc_R	smulcc 	%r8, %r9, %r3
	.word 0x06800002  ! 270: BL	bl  	<label_0x2>
	.word 0x8143e077  ! 271: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside | #MemIssue | #Sync 
	.word 0x8143e047  ! 272: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Sync 
	.word 0xc9220009  ! 274: STF_R	st	%f4, [%r9, %r8]
	.word 0xfc720009  ! 275: STX_R	stx	%r30, [%r8 + %r9]
	.word 0xcd020009  ! 275: LDF_R	ld	[%r8, %r9], %f6
	.word 0x8afa2f98  ! 276: SDIVcc_I	sdivcc 	%r8, 0x0f98, %r5
	.word 0x8143e04b  ! 277: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Sync 
	.word 0xa65a0009  ! 278: SMUL_R	smul 	%r8, %r9, %r19
	.word 0xe85a2b20  ! 279: LDX_I	ldx	[%r8 + 0x0b20], %r20
	.word 0xc8520009  ! 280: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xfa320009  ! 282: STH_R	sth	%r29, [%r8 + %r9]
	.word 0xc41a0009  ! 282: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xe8320009  ! 284: STH_R	sth	%r20, [%r8 + %r9]
	.word 0xeb1a0009  ! 284: LDDF_R	ldd	[%r8, %r9], %f21
	.word 0x8143c000  ! 285: STBAR	stbar
	.word 0xe20a27e8  ! 286: LDUB_I	ldub	[%r8 + 0x07e8], %r17
	.word 0x8cf22988  ! 287: UDIVcc_I	udivcc 	%r8, 0x0988, %r6
	.word 0xf8720009  ! 289: STX_R	stx	%r28, [%r8 + %r9]
	.word 0xca0a0009  ! 289: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0x8e720009  ! 290: UDIV_R	udiv 	%r8, %r9, %r7
	.word 0xc8420009  ! 291: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xc5f22009  ! 292: CASXA_R	casxa	[%r8]%asi, %r9, %r2
	.word 0x12800002  ! 293: BNE	bne  	<label_0x2>
	.word 0xcc720009  ! 295: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc7020009  ! 295: LDF_R	ld	[%r8, %r9], %f3
	.word 0x8143e000  ! 296: MEMBAR	membar	
	.word 0xc66a0009  ! 297: LDSTUB_R	ldstub	%r3, [%r8 + %r9]
	.word 0xc3ea2080  ! 298: PREFETCHA_I	prefetcha	[%r8, + 0x0080] %asi, #one_read
	.word 0x8143c000  ! 299: STBAR	stbar
	.word 0xcca22b70  ! 300: STWA_I	stwa	%r6, [%r8 + 0x0b70] %asi
	.word 0xca4a0009  ! 301: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xcbf22009  ! 302: CASXA_R	casxa	[%r8]%asi, %r9, %r5
	.word 0x83a209a9  ! 303: FDIVs	fdivs	%f8, %f9, %f1
	.word 0xb6d20009  ! 304: UMULcc_R	umulcc 	%r8, %r9, %r27
	.word 0xc82a0009  ! 306: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xef1a0009  ! 306: LDDF_R	ldd	[%r8, %r9], %f23
	.word 0x00800001  ! 307: BN	bn  	<label_0x1>
	.word 0xc48225f4  ! 308: LDUWA_I	lduwa	[%r8, + 0x05f4] %asi, %r2
	.word 0x8a6a2ff8  ! 309: UDIVX_I	udivx 	%r8, 0x0ff8, %r5
	.word 0xc71a2310  ! 310: LDDF_I	ldd	[%r8, 0x0310], %f3
	.word 0xc86a2f58  ! 311: LDSTUB_I	ldstub	%r4, [%r8 + 0x0f58]
	.word 0xc62a0009  ! 313: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc4020009  ! 313: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xc3ea292c  ! 314: PREFETCHA_I	prefetcha	[%r8, + 0x092c] %asi, #one_read
	.word 0xce6a2da4  ! 315: LDSTUB_I	ldstub	%r7, [%r8 + 0x0da4]
	.word 0xc2520009  ! 316: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xd6921009  ! 317: LDUHA_R	lduha	[%r8, %r9] 0x80, %r11
	.word 0xc36a0009  ! 318: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0x3a800001  ! 319: BCC	bcc,a	<label_0x1>
	.word 0xcde22009  ! 320: CASA_R	casa	[%r8] %asi, %r9, %r6
	.word 0xcada2da8  ! 321: LDXA_I	ldxa	[%r8, + 0x0da8] %asi, %r5
	.word 0xf07a0009  ! 322: SWAP_R	swap	%r24, [%r8 + %r9]
	.word 0x8f6a0009  ! 323: SDIVX_R	sdivx	%r8, %r9, %r7
	.word 0xccea2318  ! 324: LDSTUBA_I	ldstuba	%r6, [%r8 + 0x0318] %asi
	.word 0xf8a21009  ! 325: STWA_R	stwa	%r28, [%r8 + %r9] 0x80
	.word 0xc20a0009  ! 326: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xc4da2890  ! 327: LDXA_I	ldxa	[%r8, + 0x0890] %asi, %r2
	.word 0x22c20001  ! 328: BRZ	brz,a,nt	%8,<label_0x20001>
	.word 0xc6220009  ! 330: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xda5a0009  ! 330: LDX_R	ldx	[%r8 + %r9], %r13
	.word 0x827a2328  ! 331: SDIV_I	sdiv 	%r8, 0x0328, %r1
	.word 0xf89a1009  ! 332: LDDA_R	ldda	[%r8, %r9] 0x80, %r28
	.word 0x0cc20001  ! 333: BRGZ	brgz  ,nt	%8,<label_0x20001>
	.word 0xc412220c  ! 334: LDUH_I	lduh	[%r8 + 0x020c], %r2
	.word 0xeab22260  ! 335: STHA_I	stha	%r21, [%r8 + 0x0260] %asi
	.word 0xa26a2b0c  ! 336: UDIVX_I	udivx 	%r8, 0x0b0c, %r17
	.word 0xcada2a40  ! 337: LDXA_I	ldxa	[%r8, + 0x0a40] %asi, %r5
	.word 0xbb6a0009  ! 338: SDIVX_R	sdivx	%r8, %r9, %r29
	.word 0x2cc20001  ! 339: BRGZ	brgz,a,nt	%8,<label_0x20001>
	.word 0xcab22a24  ! 340: STHA_I	stha	%r5, [%r8 + 0x0a24] %asi
	.word 0x36800001  ! 341: BGE	bge,a	<label_0x1>
	.word 0xe81a0009  ! 342: LDD_R	ldd	[%r8 + %r9], %r20
	.word 0xf02a0009  ! 344: STB_R	stb	%r24, [%r8 + %r9]
	.word 0xc25a0009  ! 344: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xfefa1009  ! 345: SWAPA_R	swapa	%r31, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 346: STBAR	stbar
	.word 0xfad223dc  ! 347: LDSHA_I	ldsha	[%r8, + 0x03dc] %asi, %r29
	.word 0x8143c000  ! 348: STBAR	stbar
	.word 0xc7020009  ! 349: LDF_R	ld	[%r8, %r9], %f3
	.word 0xb4722504  ! 350: UDIV_I	udiv 	%r8, 0x0504, %r26
	.word 0xda2a0009  ! 352: STB_R	stb	%r13, [%r8 + %r9]
	.word 0xca5a0009  ! 352: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xba5a289c  ! 353: SMUL_I	smul 	%r8, 0x089c, %r29
	.word 0xca320009  ! 355: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xce520009  ! 355: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xfada1009  ! 356: LDXA_R	ldxa	[%r8, %r9] 0x80, %r29
	.word 0xc8320009  ! 358: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xdc020009  ! 358: LDUW_R	lduw	[%r8 + %r9], %r14
	.word 0xc3ea1009  ! 359: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x12800002  ! 360: BNE	bne  	<label_0x2>
	.word 0xc3e22009  ! 361: CASA_R	casa	[%r8] %asi, %r9, %r1
	.word 0xda2a0009  ! 363: STB_R	stb	%r13, [%r8 + %r9]
	.word 0xc2420009  ! 363: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xecba1009  ! 364: STDA_R	stda	%r22, [%r8 + %r9] 0x80
	.word 0xf44a2c58  ! 365: LDSB_I	ldsb	[%r8 + 0x0c58], %r26
	.word 0x8143e06a  ! 366: MEMBAR	membar	#StoreLoad | #StoreStore | #MemIssue | #Sync 
	.word 0xdec22714  ! 367: LDSWA_I	ldswa	[%r8, + 0x0714] %asi, %r15
	.word 0x99a209a9  ! 368: FDIVs	fdivs	%f8, %f9, %f12
	.word 0xe33a2bd0  ! 369: STDF_I	std	%f17, [0x0bd0, %r8]
	.word 0x8afa224c  ! 370: SDIVcc_I	sdivcc 	%r8, 0x024c, %r5
	.word 0x8da209a9  ! 371: FDIVs	fdivs	%f8, %f9, %f6
	.word 0x40000002  ! 372: CALL	call	disp30_2
	.word 0xee8a2104  ! 373: LDUBA_I	lduba	[%r8, + 0x0104] %asi, %r23
	.word 0xcab22c6c  ! 374: STHA_I	stha	%r5, [%r8 + 0x0c6c] %asi
	.word 0xc9f21009  ! 375: CASXA_I	casxa	[%r8] 0x80, %r9, %r4
	.word 0xcd3a2508  ! 376: STDF_I	std	%f6, [0x0508, %r8]
	.word 0x87220009  ! 377: MULScc_R	mulscc 	%r8, %r9, %r3
	.word 0xec2a0009  ! 379: STB_R	stb	%r22, [%r8 + %r9]
	.word 0xcc4a0009  ! 379: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0x38800002  ! 380: BGU	bgu,a	<label_0x2>
	.word 0x8143e008  ! 381: MEMBAR	membar	#StoreStore 
	.word 0xc36a0009  ! 382: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xcd3a0009  ! 384: STDF_R	std	%f6, [%r9, %r8]
	.word 0xdc720009  ! 385: STX_R	stx	%r14, [%r8 + %r9]
	.word 0xc4420009  ! 385: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xad220009  ! 386: MULScc_R	mulscc 	%r8, %r9, %r22
	.word 0xc302269c  ! 387: LDF_I	ld	[%r8, 0x069c], %f1
	.word 0xc2aa21c8  ! 388: STBA_I	stba	%r1, [%r8 + 0x01c8] %asi
	.word 0x85a208a9  ! 389: FSUBs	fsubs	%f8, %f9, %f2
	.word 0x8143e03c  ! 390: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0xc4ba1009  ! 391: STDA_R	stda	%r2, [%r8 + %r9] 0x80
	.word 0xc2d21009  ! 392: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r1
	.word 0x8cda2378  ! 393: SMULcc_I	smulcc 	%r8, 0x0378, %r6
	.word 0xef02255c  ! 394: LDF_I	ld	[%r8, 0x055c], %f23
	.word 0xc36a26c4  ! 395: PREFETCH_I	prefetch	[%r8 + 0x06c4], #one_read
	.word 0xcb3a0009  ! 397: STDF_R	std	%f5, [%r9, %r8]
	.word 0xca720009  ! 398: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xca020009  ! 398: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xc4320009  ! 400: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xf2420009  ! 400: LDSW_R	ldsw	[%r8 + %r9], %r25
	.word 0xe46a0009  ! 401: LDSTUB_R	ldstub	%r18, [%r8 + %r9]
	.word 0xc4220009  ! 403: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xe6420009  ! 403: LDSW_R	ldsw	[%r8 + %r9], %r19
	.word 0xe13a21e0  ! 404: STDF_I	std	%f16, [0x01e0, %r8]
	.word 0xacf228cc  ! 405: UDIVcc_I	udivcc 	%r8, 0x08cc, %r22
	.word 0xc2220009  ! 407: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xcc4a0009  ! 407: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xc4d21009  ! 408: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r2
	.word 0xf2fa28b4  ! 409: SWAPA_I	swapa	%r25, [%r8 + 0x08b4] %asi
	.word 0xc36a2eb8  ! 410: PREFETCH_I	prefetch	[%r8 + 0x0eb8], #one_read
	.word 0x86da286c  ! 411: SMULcc_I	smulcc 	%r8, 0x086c, %r3
	.word 0xcd3a0009  ! 413: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc4720009  ! 414: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xe2120009  ! 414: LDUH_R	lduh	[%r8 + %r9], %r17
	.word 0x14800001  ! 415: BG	bg  	<label_0x1>
	.word 0xc5222800  ! 416: STF_I	st	%f2, [0x0800, %r8]
	.word 0xc6220009  ! 418: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xf8120009  ! 418: LDUH_R	lduh	[%r8 + %r9], %r28
	.word 0xc2a22500  ! 419: STWA_I	stwa	%r1, [%r8 + 0x0500] %asi
	.word 0xfaea1009  ! 420: LDSTUBA_R	ldstuba	%r29, [%r8 + %r9] 0x80
	.word 0xc6b21009  ! 421: STHA_R	stha	%r3, [%r8 + %r9] 0x80
	.word 0x9af228f0  ! 422: UDIVcc_I	udivcc 	%r8, 0x08f0, %r13
	.word 0xc3ea1009  ! 423: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xcb3a2c50  ! 424: STDF_I	std	%f5, [0x0c50, %r8]
	.word 0xced22c88  ! 425: LDSHA_I	ldsha	[%r8, + 0x0c88] %asi, %r7
	.word 0xc36a22a8  ! 426: PREFETCH_I	prefetch	[%r8 + 0x02a8], #one_read
	.word 0xc3ea1009  ! 427: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x8da209a9  ! 428: FDIVs	fdivs	%f8, %f9, %f6
	.word 0xce220009  ! 430: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xcc1a0009  ! 430: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xdc2a0009  ! 432: STB_R	stb	%r14, [%r8 + %r9]
	.word 0xe6020009  ! 432: LDUW_R	lduw	[%r8 + %r9], %r19
	.word 0xcff22009  ! 433: CASXA_R	casxa	[%r8]%asi, %r9, %r7
	.word 0x8143e000  ! 434: MEMBAR	membar	
	.word 0xd81a0009  ! 435: LDD_R	ldd	[%r8 + %r9], %r12
	.word 0xc9f21009  ! 436: CASXA_I	casxa	[%r8] 0x80, %r9, %r4
	.word 0xc60a2b20  ! 437: LDUB_I	ldub	[%r8 + 0x0b20], %r3
	.word 0x87a20829  ! 438: FADDs	fadds	%f8, %f9, %f3
	.word 0x86520009  ! 439: UMUL_R	umul 	%r8, %r9, %r3
	.word 0xc4a220d4  ! 440: STWA_I	stwa	%r2, [%r8 + 0x00d4] %asi
	.word 0xed1a0009  ! 441: LDDF_R	ldd	[%r8, %r9], %f22
	.word 0xecda1009  ! 442: LDXA_R	ldxa	[%r8, %r9] 0x80, %r22
	.word 0x87a20929  ! 443: FMULs	fmuls	%f8, %f9, %f3
	.word 0xfe2a0009  ! 445: STB_R	stb	%r31, [%r8 + %r9]
	.word 0xc71a0009  ! 445: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xccf22c80  ! 446: STXA_I	stxa	%r6, [%r8 + 0x0c80] %asi
	.word 0xce320009  ! 448: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc91a0009  ! 448: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0x89a209a9  ! 449: FDIVs	fdivs	%f8, %f9, %f4
	.word 0xc2da1009  ! 450: LDXA_R	ldxa	[%r8, %r9] 0x80, %r1
	.word 0x85a20929  ! 451: FMULs	fmuls	%f8, %f9, %f2
	.word 0xc36a2ab0  ! 452: PREFETCH_I	prefetch	[%r8 + 0x0ab0], #one_read
	.word 0x38800001  ! 453: BGU	bgu,a	<label_0x1>
	.word 0xaeda0009  ! 454: SMULcc_R	smulcc 	%r8, %r9, %r23
	.word 0x8143c000  ! 455: STBAR	stbar
	.word 0x97220009  ! 456: MULScc_R	mulscc 	%r8, %r9, %r11
	.word 0xb9a20929  ! 457: FMULs	fmuls	%f8, %f9, %f28
	.word 0xccaa1009  ! 458: STBA_R	stba	%r6, [%r8 + %r9] 0x80
	.word 0xc4220009  ! 460: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xcc4a0009  ! 460: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0x8efa2a64  ! 461: SDIVcc_I	sdivcc 	%r8, 0x0a64, %r7
	.word 0xca921009  ! 462: LDUHA_R	lduha	[%r8, %r9] 0x80, %r5
	.word 0xca220009  ! 464: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xe45a0009  ! 464: LDX_R	ldx	[%r8 + %r9], %r18
	.word 0xca8a1009  ! 465: LDUBA_R	lduba	[%r8, %r9] 0x80, %r5
	.word 0xc2720009  ! 467: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc8120009  ! 467: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0x8d220009  ! 468: MULScc_R	mulscc 	%r8, %r9, %r6
	.word 0x8143e068  ! 469: MEMBAR	membar	#StoreStore | #MemIssue | #Sync 
	.word 0xc6d21009  ! 470: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r3
	.word 0x24800002  ! 471: BLE	ble,a	<label_0x2>
	.word 0xc62a0009  ! 473: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc6420009  ! 473: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xc82a0009  ! 475: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xcc020009  ! 475: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xccba2b50  ! 476: STDA_I	stda	%r6, [%r8 + 0x0b50] %asi
	.word 0xa3a20829  ! 477: FADDs	fadds	%f8, %f9, %f17
	.word 0xcef21009  ! 478: STXA_R	stxa	%r7, [%r8 + %r9] 0x80
	.word 0xc3ea1009  ! 479: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xdb3a0009  ! 481: STDF_R	std	%f13, [%r9, %r8]
	.word 0xc4720009  ! 482: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xcb020009  ! 482: LDF_R	ld	[%r8, %r9], %f5
	.word 0xf2420009  ! 483: LDSW_R	ldsw	[%r8 + %r9], %r25
	.word 0x86da26d4  ! 484: SMULcc_I	smulcc 	%r8, 0x06d4, %r3
	.word 0xf66a0009  ! 485: LDSTUB_R	ldstub	%r27, [%r8 + %r9]
	.word 0xcc120009  ! 486: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0x8efa0009  ! 487: SDIVcc_R	sdivcc 	%r8, %r9, %r7
	.word 0xc26a2f04  ! 488: LDSTUB_I	ldstub	%r1, [%r8 + 0x0f04]
	.word 0x00800001  ! 489: BN	bn  	<label_0x1>
	.word 0xc3ea2aa8  ! 490: PREFETCHA_I	prefetcha	[%r8, + 0x0aa8] %asi, #one_read
	.word 0xce220009  ! 492: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc2020009  ! 492: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xfcca2644  ! 493: LDSBA_I	ldsba	[%r8, + 0x0644] %asi, %r30
	.word 0x85a209a9  ! 494: FDIVs	fdivs	%f8, %f9, %f2
	.word 0xf2aa1009  ! 495: STBA_R	stba	%r25, [%r8 + %r9] 0x80
	.word 0x2ec20001  ! 496: BRGEZ	brgez,a,nt	%8,<label_0x20001>
	.word 0xce320009  ! 498: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc60a0009  ! 498: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xe33a2b00  ! 499: STDF_I	std	%f17, [0x0b00, %r8]
	.word 0x22800001  ! 500: BE	be,a	<label_0x1>
	.word 0x8e6a0009  ! 501: UDIVX_R	udivx 	%r8, %r9, %r7
	.word 0xc8c21009  ! 502: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r4
	.word 0x8143c000  ! 503: STBAR	stbar
	.word 0xfe4227c8  ! 504: LDSW_I	ldsw	[%r8 + 0x07c8], %r31
	.word 0x86d22f00  ! 505: UMULcc_I	umulcc 	%r8, 0x0f00, %r3
	.word 0xc36a0009  ! 506: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xcc9a2170  ! 507: LDDA_I	ldda	[%r8, + 0x0170] %asi, %r6
	.word 0xca220009  ! 509: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xce020009  ! 509: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xcf222c2c  ! 510: STF_I	st	%f7, [0x0c2c, %r8]
	.word 0x32800001  ! 511: BNE	bne,a	<label_0x1>
	.word 0x26c20001  ! 512: BRLZ	brlz,a,nt	%8,<label_0x20001>
	.word 0xc2b21009  ! 513: STHA_R	stha	%r1, [%r8 + %r9] 0x80
	.word 0xcf3a2298  ! 514: STDF_I	std	%f7, [0x0298, %r8]
	.word 0x8143c000  ! 515: STBAR	stbar
	.word 0xdc8a25f4  ! 516: LDUBA_I	lduba	[%r8, + 0x05f4] %asi, %r14
	.word 0xa44a2e78  ! 517: MULX_I	mulx 	%r8, 0x0e78, %r18
	.word 0x8fa20929  ! 518: FMULs	fmuls	%f8, %f9, %f7
	.word 0xc36a2e9c  ! 519: PREFETCH_I	prefetch	[%r8 + 0x0e9c], #one_read
	.word 0xc22a0009  ! 521: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc6020009  ! 521: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0x9cfa0009  ! 522: SDIVcc_R	sdivcc 	%r8, %r9, %r14
	.word 0xc4122854  ! 523: LDUH_I	lduh	[%r8 + 0x0854], %r2
	.word 0xe8220009  ! 525: STW_R	stw	%r20, [%r8 + %r9]
	.word 0xcc520009  ! 525: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0x8143e064  ! 526: MEMBAR	membar	#LoadStore | #MemIssue | #Sync 
	.word 0xcb1a0009  ! 527: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0x98fa0009  ! 528: SDIVcc_R	sdivcc 	%r8, %r9, %r12
	.word 0xc3ea1009  ! 529: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xcb022e78  ! 530: LDF_I	ld	[%r8, 0x0e78], %f5
	.word 0x8af20009  ! 531: UDIVcc_R	udivcc 	%r8, %r9, %r5
	.word 0xdc020009  ! 532: LDUW_R	lduw	[%r8 + %r9], %r14
	.word 0x8143e07c  ! 533: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0x8ad20009  ! 534: UMULcc_R	umulcc 	%r8, %r9, %r5
	.word 0xc3ea1009  ! 535: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x3e800002  ! 536: BVC	bvc,a	<label_0x2>
	.word 0x865a27f8  ! 537: SMUL_I	smul 	%r8, 0x07f8, %r3
	.word 0xf2b224ac  ! 538: STHA_I	stha	%r25, [%r8 + 0x04ac] %asi
	.word 0xccb22624  ! 539: STHA_I	stha	%r6, [%r8 + 0x0624] %asi
	.word 0xc46a2734  ! 540: LDSTUB_I	ldstub	%r2, [%r8 + 0x0734]
	.word 0x83a208a9  ! 541: FSUBs	fsubs	%f8, %f9, %f1
	.word 0xccba29f0  ! 542: STDA_I	stda	%r6, [%r8 + 0x09f0] %asi
	.word 0x8143c000  ! 543: STBAR	stbar
	.word 0xf40222fc  ! 544: LDUW_I	lduw	[%r8 + 0x02fc], %r26
	.word 0x8143c000  ! 545: STBAR	stbar
	.word 0xc4320009  ! 547: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xce0a0009  ! 547: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0x88fa2d14  ! 548: SDIVcc_I	sdivcc 	%r8, 0x0d14, %r4
	.word 0x82fa0009  ! 549: SDIVcc_R	sdivcc 	%r8, %r9, %r1
	.word 0xca8a1009  ! 550: LDUBA_R	lduba	[%r8, %r9] 0x80, %r5
	.word 0xb24a2bac  ! 551: MULX_I	mulx 	%r8, 0x0bac, %r25
	.word 0xfe8a2634  ! 552: LDUBA_I	lduba	[%r8, + 0x0634] %asi, %r31
	.word 0xcc520009  ! 553: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xcc320009  ! 555: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc5020009  ! 555: LDF_R	ld	[%r8, %r9], %f2
	.word 0xc36a2558  ! 556: PREFETCH_I	prefetch	[%r8 + 0x0558], #one_read
	.word 0xc36a2970  ! 557: PREFETCH_I	prefetch	[%r8 + 0x0970], #one_read
	.word 0x06ca0001  ! 558: BRLZ	brlz  ,pt	%8,<label_0xa0001>
	.word 0xaa5a0009  ! 559: SMUL_R	smul 	%r8, %r9, %r21
	.word 0xde220009  ! 561: STW_R	stw	%r15, [%r8 + %r9]
	.word 0xf4120009  ! 561: LDUH_R	lduh	[%r8 + %r9], %r26
	.word 0xc36a2968  ! 562: PREFETCH_I	prefetch	[%r8 + 0x0968], #one_read
	.word 0xc65a0009  ! 563: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xccaa27fc  ! 564: STBA_I	stba	%r6, [%r8 + 0x07fc] %asi
	.word 0x88fa0009  ! 565: SDIVcc_R	sdivcc 	%r8, %r9, %r4
	.word 0x8fa20929  ! 566: FMULs	fmuls	%f8, %f9, %f7
	.word 0x00800001  ! 567: BN	bn  	<label_0x1>
	.word 0x3c800001  ! 568: BPOS	bpos,a	<label_0x1>
	.word 0xc36a2390  ! 569: PREFETCH_I	prefetch	[%r8 + 0x0390], #one_read
	.word 0xc6b21009  ! 570: STHA_R	stha	%r3, [%r8 + %r9] 0x80
	.word 0x8da20929  ! 571: FMULs	fmuls	%f8, %f9, %f6
	.word 0x8143e021  ! 572: MEMBAR	membar	#LoadLoad | #MemIssue 
	.word 0xc3ea1009  ! 573: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xf6ea1009  ! 574: LDSTUBA_R	ldstuba	%r27, [%r8 + %r9] 0x80
	.word 0xcc220009  ! 576: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xcb1a0009  ! 576: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xca220009  ! 578: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xce0a0009  ! 578: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xccda1009  ! 579: LDXA_R	ldxa	[%r8, %r9] 0x80, %r6
	.word 0xe4020009  ! 580: LDUW_R	lduw	[%r8 + %r9], %r18
	.word 0xdcd22360  ! 581: LDSHA_I	ldsha	[%r8, + 0x0360] %asi, %r14
	.word 0xdb020009  ! 582: LDF_R	ld	[%r8, %r9], %f13
	.word 0x18800001  ! 583: BGU	bgu  	<label_0x1>
	.word 0xc322247c  ! 584: STF_I	st	%f1, [0x047c, %r8]
	.word 0xb2520009  ! 585: UMUL_R	umul 	%r8, %r9, %r25
	.word 0xde922f44  ! 586: LDUHA_I	lduha	[%r8, + 0x0f44] %asi, %r15
	.word 0xcab21009  ! 587: STHA_R	stha	%r5, [%r8 + %r9] 0x80
	.word 0xc2220009  ! 589: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc85a0009  ! 589: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xb9a20829  ! 590: FADDs	fadds	%f8, %f9, %f28
	.word 0xc36a2b00  ! 591: PREFETCH_I	prefetch	[%r8 + 0x0b00], #one_read
	.word 0x844a0009  ! 592: MULX_R	mulx 	%r8, %r9, %r2
	.word 0xd6220009  ! 594: STW_R	stw	%r11, [%r8 + %r9]
	.word 0xca0a0009  ! 594: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xc6d21009  ! 595: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r3
	.word 0xc3ea1009  ! 596: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc3ea1009  ! 597: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xfb220009  ! 599: STF_R	st	%f29, [%r9, %r8]
	.word 0xc4720009  ! 600: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xce420009  ! 600: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xf8fa1009  ! 601: SWAPA_R	swapa	%r28, [%r8 + %r9] 0x80
	.word 0x8143e023  ! 602: MEMBAR	membar	#LoadLoad | #StoreLoad | #MemIssue 
	.word 0xc3ea2bc4  ! 603: PREFETCHA_I	prefetcha	[%r8, + 0x0bc4] %asi, #one_read
	.word 0xca6a2c20  ! 604: LDSTUB_I	ldstub	%r5, [%r8 + 0x0c20]
	.word 0xc36a0009  ! 605: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xe2aa1009  ! 606: STBA_R	stba	%r17, [%r8 + %r9] 0x80
	.word 0xc36a2ae8  ! 607: PREFETCH_I	prefetch	[%r8 + 0x0ae8], #one_read
	.word 0x84da2210  ! 608: SMULcc_I	smulcc 	%r8, 0x0210, %r2
	.word 0x0ec20001  ! 609: BRGEZ	brgez  ,nt	%8,<label_0x20001>
	.word 0xc7020009  ! 610: LDF_R	ld	[%r8, %r9], %f3
	.word 0xecc22188  ! 611: LDSWA_I	ldswa	[%r8, + 0x0188] %asi, %r22
	.word 0xc8aa250c  ! 612: STBA_I	stba	%r4, [%r8 + 0x050c] %asi
	.word 0xc42a0009  ! 614: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc5020009  ! 614: LDF_R	ld	[%r8, %r9], %f2
	.word 0xec1a2e40  ! 615: LDD_I	ldd	[%r8 + 0x0e40], %r22
	.word 0xdaf22eb8  ! 616: STXA_I	stxa	%r13, [%r8 + 0x0eb8] %asi
	.word 0xc4ba1009  ! 617: STDA_R	stda	%r2, [%r8 + %r9] 0x80
	.word 0xca5a0009  ! 618: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xdf220009  ! 620: STF_R	st	%f15, [%r9, %r8]
	.word 0xfa720009  ! 621: STX_R	stx	%r29, [%r8 + %r9]
	.word 0xcc420009  ! 621: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0x827a0009  ! 622: SDIV_R	sdiv 	%r8, %r9, %r1
	.word 0xda220009  ! 624: STW_R	stw	%r13, [%r8 + %r9]
	.word 0xcc120009  ! 624: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xce320009  ! 626: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xe25a0009  ! 626: LDX_R	ldx	[%r8 + %r9], %r17
	.word 0xce220009  ! 628: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xca020009  ! 628: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xa9a20929  ! 629: FMULs	fmuls	%f8, %f9, %f20
	.word 0x846a0009  ! 630: UDIVX_R	udivx 	%r8, %r9, %r2
	.word 0xc2320009  ! 632: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc8420009  ! 632: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0x0e800001  ! 633: BVS	bvs  	<label_0x1>
	.word 0x8143e007  ! 634: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore 
	.word 0xe67a0009  ! 635: SWAP_R	swap	%r19, [%r8 + %r9]
	.word 0xb3222dcc  ! 636: MULScc_I	mulscc 	%r8, 0x0dcc, %r25
	.word 0x38800002  ! 637: BGU	bgu,a	<label_0x2>
	.word 0xc51a27f8  ! 638: LDDF_I	ldd	[%r8, 0x07f8], %f2
	.word 0xcd3a0009  ! 640: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc6720009  ! 641: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xca4a0009  ! 641: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xe71a0009  ! 642: LDDF_R	ldd	[%r8, %r9], %f19
	.word 0xcc6a0009  ! 643: LDSTUB_R	ldstub	%r6, [%r8 + %r9]
	.word 0xb56a2c58  ! 644: SDIVX_I	sdivx	%r8, 0x0c58, %r26
	.word 0xc62a0009  ! 646: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xca120009  ! 646: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xccba1009  ! 647: STDA_R	stda	%r6, [%r8 + %r9] 0x80
	.word 0x8143e035  ! 648: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside | #MemIssue 
	.word 0xccca20c8  ! 649: LDSBA_I	ldsba	[%r8, + 0x00c8] %asi, %r6
	.word 0x89a209a9  ! 650: FDIVs	fdivs	%f8, %f9, %f4
	.word 0x8da20829  ! 651: FADDs	fadds	%f8, %f9, %f6
	.word 0xc3ea1009  ! 652: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc6720009  ! 654: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xcd1a0009  ! 654: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0x8143e00d  ! 655: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore 
	.word 0xd6fa1009  ! 656: SWAPA_R	swapa	%r11, [%r8 + %r9] 0x80
	.word 0x85a209a9  ! 657: FDIVs	fdivs	%f8, %f9, %f2
	.word 0xccba1009  ! 658: STDA_R	stda	%r6, [%r8 + %r9] 0x80
	.word 0xc3ea1009  ! 659: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x8143e02a  ! 660: MEMBAR	membar	#StoreLoad | #StoreStore | #MemIssue 
	.word 0xb44a0009  ! 661: MULX_R	mulx 	%r8, %r9, %r26
	.word 0xccea1009  ! 662: LDSTUBA_R	ldstuba	%r6, [%r8 + %r9] 0x80
	.word 0xf2ea2380  ! 663: LDSTUBA_I	ldstuba	%r25, [%r8 + 0x0380] %asi
	.word 0x9cd20009  ! 664: UMULcc_R	umulcc 	%r8, %r9, %r14
	.word 0x0a800001  ! 665: BCS	bcs  	<label_0x1>
	.word 0xce6a2c8c  ! 666: LDSTUB_I	ldstub	%r7, [%r8 + 0x0c8c]
	.word 0xbe4a2854  ! 667: MULX_I	mulx 	%r8, 0x0854, %r31
	.word 0x86522c90  ! 668: UMUL_I	umul 	%r8, 0x0c90, %r3
	.word 0xc3220009  ! 670: STF_R	st	%f1, [%r9, %r8]
	.word 0xca720009  ! 671: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xf65a0009  ! 671: LDX_R	ldx	[%r8 + %r9], %r27
	.word 0xcc122038  ! 672: LDUH_I	lduh	[%r8 + 0x0038], %r6
	.word 0x887a0009  ! 673: SDIV_R	sdiv 	%r8, %r9, %r4
	.word 0xca4a21e0  ! 674: LDSB_I	ldsb	[%r8 + 0x01e0], %r5
	.word 0xbcfa2010  ! 675: SDIVcc_I	sdivcc 	%r8, 0x0010, %r30
	.word 0x82d20009  ! 676: UMULcc_R	umulcc 	%r8, %r9, %r1
	.word 0xdaaa1009  ! 677: STBA_R	stba	%r13, [%r8 + %r9] 0x80
	.word 0xc36a0009  ! 678: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc8d22dc4  ! 679: LDSHA_I	ldsha	[%r8, + 0x0dc4] %asi, %r4
	.word 0xce220009  ! 681: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xca120009  ! 681: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xc87a27a8  ! 682: SWAP_I	swap	%r4, [%r8 + 0x07a8]
	.word 0xc49a1009  ! 683: LDDA_R	ldda	[%r8, %r9] 0x80, %r2
	.word 0xcc720009  ! 685: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xdd1a0009  ! 685: LDDF_R	ldd	[%r8, %r9], %f14
	.word 0xd8da2798  ! 686: LDXA_I	ldxa	[%r8, + 0x0798] %asi, %r12
	.word 0x8e722f8c  ! 687: UDIV_I	udiv 	%r8, 0x0f8c, %r7
	.word 0xf86a21e8  ! 688: LDSTUB_I	ldstub	%r28, [%r8 + 0x01e8]
	.word 0xc3ea232c  ! 689: PREFETCHA_I	prefetcha	[%r8, + 0x032c] %asi, #one_read
	.word 0x82fa2870  ! 690: SDIVcc_I	sdivcc 	%r8, 0x0870, %r1
	.word 0xc4ca2678  ! 691: LDSBA_I	ldsba	[%r8, + 0x0678] %asi, %r2
	.word 0xe3220009  ! 693: STF_R	st	%f17, [%r9, %r8]
	.word 0xde720009  ! 694: STX_R	stx	%r15, [%r8 + %r9]
	.word 0xce5a0009  ! 694: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xa7a20829  ! 695: FADDs	fadds	%f8, %f9, %f19
	.word 0x84fa2690  ! 696: SDIVcc_I	sdivcc 	%r8, 0x0690, %r2
	.word 0x8143c000  ! 697: STBAR	stbar
	.word 0xc4aa2600  ! 698: STBA_I	stba	%r2, [%r8 + 0x0600] %asi
	.word 0x88fa22c4  ! 699: SDIVcc_I	sdivcc 	%r8, 0x02c4, %r4
	.word 0xa5a20829  ! 700: FADDs	fadds	%f8, %f9, %f18
	.word 0xec9a1009  ! 701: LDDA_R	ldda	[%r8, %r9] 0x80, %r22
	.word 0x24c20001  ! 702: BRLEZ	brlez,a,nt	%8,<label_0x20001>
	.word 0xceb21009  ! 703: STHA_R	stha	%r7, [%r8 + %r9] 0x80
	.word 0xc62a0009  ! 705: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xca520009  ! 705: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xc36a0009  ! 706: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0x8b6a2e7c  ! 707: SDIVX_I	sdivx	%r8, 0x0e7c, %r5
	.word 0x867a2cc4  ! 708: SDIV_I	sdiv 	%r8, 0x0cc4, %r3
	.word 0xc6b21009  ! 709: STHA_R	stha	%r3, [%r8 + %r9] 0x80
	.word 0xbeda0009  ! 710: SMULcc_R	smulcc 	%r8, %r9, %r31
	.word 0xc33a2110  ! 711: STDF_I	std	%f1, [0x0110, %r8]
	.word 0xce5a0009  ! 712: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xe6a221dc  ! 713: STWA_I	stwa	%r19, [%r8 + 0x01dc] %asi
	.word 0xc36a0009  ! 714: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc66a204c  ! 715: LDSTUB_I	ldstub	%r3, [%r8 + 0x004c]
	.word 0x8a522f54  ! 716: UMUL_I	umul 	%r8, 0x0f54, %r5
	.word 0xfe022134  ! 717: LDUW_I	lduw	[%r8 + 0x0134], %r31
	.word 0xca320009  ! 719: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xcc020009  ! 719: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0x34800002  ! 720: BG	bg,a	<label_0x2>
	.word 0x87a20829  ! 721: FADDs	fadds	%f8, %f9, %f3
	.word 0xc6921009  ! 722: LDUHA_R	lduha	[%r8, %r9] 0x80, %r3
	.word 0x1c800001  ! 723: BPOS	bpos  	<label_0x1>
	.word 0xc4ea27c8  ! 724: LDSTUBA_I	ldstuba	%r2, [%r8 + 0x07c8] %asi
	.word 0xc42a0009  ! 726: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xdd020009  ! 726: LDF_R	ld	[%r8, %r9], %f14
	.word 0xbd220009  ! 727: MULScc_R	mulscc 	%r8, %r9, %r30
	.word 0xc28a2610  ! 728: LDUBA_I	lduba	[%r8, + 0x0610] %asi, %r1
	.word 0xb04a24c0  ! 729: MULX_I	mulx 	%r8, 0x04c0, %r24
	.word 0x8143c000  ! 730: STBAR	stbar
	.word 0x84d20009  ! 731: UMULcc_R	umulcc 	%r8, %r9, %r2
	.word 0x8143e04b  ! 732: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Sync 
	.word 0xc33a2930  ! 733: STDF_I	std	%f1, [0x0930, %r8]
	.word 0xca320009  ! 735: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc8520009  ! 735: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xc8921009  ! 736: LDUHA_R	lduha	[%r8, %r9] 0x80, %r4
	.word 0x8143c000  ! 737: STBAR	stbar
	.word 0xc2f21009  ! 738: STXA_R	stxa	%r1, [%r8 + %r9] 0x80
	.word 0xcd220009  ! 740: STF_R	st	%f6, [%r9, %r8]
	.word 0xc8720009  ! 741: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc2520009  ! 741: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0x2a800002  ! 742: BCS	bcs,a	<label_0x2>
	.word 0xc3ea22b4  ! 743: PREFETCHA_I	prefetcha	[%r8, + 0x02b4] %asi, #one_read
	.word 0xc89a2148  ! 744: LDDA_I	ldda	[%r8, + 0x0148] %asi, %r4
	.word 0x26800001  ! 745: BL	bl,a	<label_0x1>
	.word 0xca1221d0  ! 746: LDUH_I	lduh	[%r8 + 0x01d0], %r5
	.word 0xc6aa2f04  ! 747: STBA_I	stba	%r3, [%r8 + 0x0f04] %asi
	.word 0xda320009  ! 749: STH_R	sth	%r13, [%r8 + %r9]
	.word 0xf8420009  ! 749: LDSW_R	ldsw	[%r8 + %r9], %r28
	.word 0xf51a0009  ! 750: LDDF_R	ldd	[%r8, %r9], %f26
	.word 0x2a800001  ! 751: BCS	bcs,a	<label_0x1>
	.word 0xc33a21a8  ! 752: STDF_I	std	%f1, [0x01a8, %r8]
	.word 0xada208a9  ! 753: FSUBs	fsubs	%f8, %f9, %f22
	.word 0xc3ea1009  ! 754: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc36a0009  ! 755: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xede21009  ! 756: CASA_I	casa	[%r8] 0x80, %r9, %r22
	.word 0x84da0009  ! 757: SMULcc_R	smulcc 	%r8, %r9, %r2
	.word 0xfaca2d60  ! 758: LDSBA_I	ldsba	[%r8, + 0x0d60] %asi, %r29
	.word 0xc81a0009  ! 759: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xc3222e54  ! 760: STF_I	st	%f1, [0x0e54, %r8]
	.word 0x8afa0009  ! 761: SDIVcc_R	sdivcc 	%r8, %r9, %r5
	.word 0xce220009  ! 763: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc44a0009  ! 763: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0x8f6a0009  ! 764: SDIVX_R	sdivx	%r8, %r9, %r7
	.word 0x8143e07b  ! 765: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xc4420009  ! 766: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0x2c800001  ! 767: BNEG	bneg,a	<label_0x1>
	.word 0xc62a0009  ! 769: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc80a0009  ! 769: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xaad22a18  ! 770: UMULcc_I	umulcc 	%r8, 0x0a18, %r21
	.word 0xef3a20a8  ! 771: STDF_I	std	%f23, [0x00a8, %r8]
	.word 0xc4422920  ! 772: LDSW_I	ldsw	[%r8 + 0x0920], %r2
	.word 0xc6420009  ! 773: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xc47a29c8  ! 774: SWAP_I	swap	%r2, [%r8 + 0x09c8]
	.word 0x9ed20009  ! 775: UMULcc_R	umulcc 	%r8, %r9, %r15
	.word 0xc4a22ffc  ! 776: STWA_I	stwa	%r2, [%r8 + 0x0ffc] %asi
	.word 0xc8921009  ! 777: LDUHA_R	lduha	[%r8, %r9] 0x80, %r4
	.word 0xc3ea1009  ! 778: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc3ea1009  ! 779: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc7e22009  ! 780: CASA_R	casa	[%r8] %asi, %r9, %r3
	.word 0xc36a0009  ! 781: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc6220009  ! 783: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc20a0009  ! 783: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xc86a0009  ! 784: LDSTUB_R	ldstub	%r4, [%r8 + %r9]
	.word 0xcb3a2f38  ! 785: STDF_I	std	%f5, [0x0f38, %r8]
	.word 0xccda1009  ! 786: LDXA_R	ldxa	[%r8, %r9] 0x80, %r6
	.word 0xe8220009  ! 788: STW_R	stw	%r20, [%r8 + %r9]
	.word 0xca120009  ! 788: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xcef21009  ! 789: STXA_R	stxa	%r7, [%r8 + %r9] 0x80
	.word 0xf02a0009  ! 791: STB_R	stb	%r24, [%r8 + %r9]
	.word 0xfe4a0009  ! 791: LDSB_R	ldsb	[%r8 + %r9], %r31
	.word 0x0aca0001  ! 792: BRNZ	brnz  ,pt	%8,<label_0xa0001>
	.word 0xea5a0009  ! 793: LDX_R	ldx	[%r8 + %r9], %r21
	.word 0xc3ea2848  ! 794: PREFETCHA_I	prefetcha	[%r8, + 0x0848] %asi, #one_read
	.word 0x8b222684  ! 795: MULScc_I	mulscc 	%r8, 0x0684, %r5
	.word 0xc36a2530  ! 796: PREFETCH_I	prefetch	[%r8 + 0x0530], #one_read
	.word 0xecd21009  ! 797: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r22
	.word 0xc4220009  ! 799: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xe04a0009  ! 799: LDSB_R	ldsb	[%r8 + %r9], %r16
	.word 0xc36a206c  ! 800: PREFETCH_I	prefetch	[%r8 + 0x006c], #one_read
	.word 0xa36a0009  ! 801: SDIVX_R	sdivx	%r8, %r9, %r17
	.word 0xc4a22a78  ! 802: STWA_I	stwa	%r2, [%r8 + 0x0a78] %asi
	.word 0xc6320009  ! 804: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xf2520009  ! 804: LDSH_R	ldsh	[%r8 + %r9], %r25
	.word 0x3c800001  ! 805: BPOS	bpos,a	<label_0x1>
	.word 0xc7f21009  ! 806: CASXA_I	casxa	[%r8] 0x80, %r9, %r3
	.word 0xc26a2188  ! 807: LDSTUB_I	ldstub	%r1, [%r8 + 0x0188]
	.word 0xced22eb8  ! 808: LDSHA_I	ldsha	[%r8, + 0x0eb8] %asi, %r7
	.word 0x84720009  ! 809: UDIV_R	udiv 	%r8, %r9, %r2
	.word 0xc3ea1009  ! 810: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x844a2460  ! 811: MULX_I	mulx 	%r8, 0x0460, %r2
	.word 0x88f22c2c  ! 812: UDIVcc_I	udivcc 	%r8, 0x0c2c, %r4
	.word 0xc7220009  ! 814: STF_R	st	%f3, [%r9, %r8]
	.word 0xc4720009  ! 815: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc81a0009  ! 815: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x83a208a9  ! 816: FSUBs	fsubs	%f8, %f9, %f1
	.word 0xc46a0009  ! 817: LDSTUB_R	ldstub	%r2, [%r8 + %r9]
	.word 0x85a20929  ! 818: FMULs	fmuls	%f8, %f9, %f2
	.word 0xfa320009  ! 820: STH_R	sth	%r29, [%r8 + %r9]
	.word 0xcc520009  ! 820: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xcc7a2658  ! 821: SWAP_I	swap	%r6, [%r8 + 0x0658]
	.word 0xe01a0009  ! 822: LDD_R	ldd	[%r8 + %r9], %r16
	.word 0xc6320009  ! 824: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xee5a0009  ! 824: LDX_R	ldx	[%r8 + %r9], %r23
	.word 0x865a0009  ! 825: SMUL_R	smul 	%r8, %r9, %r3
	.word 0xc53a27c8  ! 826: STDF_I	std	%f2, [0x07c8, %r8]
	.word 0xc3ea20b4  ! 827: PREFETCHA_I	prefetcha	[%r8, + 0x00b4] %asi, #one_read
	.word 0xe4921009  ! 828: LDUHA_R	lduha	[%r8, %r9] 0x80, %r18
	.word 0xcc1a0009  ! 829: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xc36a2618  ! 830: PREFETCH_I	prefetch	[%r8 + 0x0618], #one_read
	.word 0xc36a280c  ! 831: PREFETCH_I	prefetch	[%r8 + 0x080c], #one_read
	.word 0x8143e038  ! 832: MEMBAR	membar	#StoreStore | #Lookaside | #MemIssue 
	.word 0xc3ea2dfc  ! 833: PREFETCHA_I	prefetcha	[%r8, + 0x0dfc] %asi, #one_read
	.word 0xde720009  ! 835: STX_R	stx	%r15, [%r8 + %r9]
	.word 0xc6420009  ! 835: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xcea22b70  ! 836: STWA_I	stwa	%r7, [%r8 + 0x0b70] %asi
	.word 0x8e4a0009  ! 837: MULX_R	mulx 	%r8, %r9, %r7
	.word 0xcad22f40  ! 838: LDSHA_I	ldsha	[%r8, + 0x0f40] %asi, %r5
	.word 0x8143e017  ! 839: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside 
	.word 0x2e800001  ! 840: BVS	bvs,a	<label_0x1>
	.word 0xcada2f00  ! 841: LDXA_I	ldxa	[%r8, + 0x0f00] %asi, %r5
	.word 0xe6ea1009  ! 842: LDSTUBA_R	ldstuba	%r19, [%r8 + %r9] 0x80
	.word 0xc8220009  ! 844: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xce4a0009  ! 844: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xcefa2e20  ! 845: SWAPA_I	swapa	%r7, [%r8 + 0x0e20] %asi
	.word 0xc6520009  ! 846: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0x8143e057  ! 847: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside | #Sync 
	.word 0xdb3a20a8  ! 848: STDF_I	std	%f13, [0x00a8, %r8]
	.word 0xc2a21009  ! 849: STWA_R	stwa	%r1, [%r8 + %r9] 0x80
	.word 0x9af20009  ! 850: UDIVcc_R	udivcc 	%r8, %r9, %r13
	.word 0xce2a0009  ! 852: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xcc4a0009  ! 852: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xc8320009  ! 854: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc4520009  ! 854: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0x8143c000  ! 855: STBAR	stbar
	.word 0xa66a20d8  ! 856: UDIVX_I	udivx 	%r8, 0x00d8, %r19
	.word 0x8143e016  ! 857: MEMBAR	membar	#StoreLoad | #LoadStore | #Lookaside 
	.word 0xca220009  ! 859: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xcd1a0009  ! 859: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xc8220009  ! 861: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc31a0009  ! 861: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xc36a0009  ! 862: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc322236c  ! 863: STF_I	st	%f1, [0x036c, %r8]
	.word 0x40000001  ! 864: CALL	call	disp30_1
	.word 0x885a2a48  ! 865: SMUL_I	smul 	%r8, 0x0a48, %r4
	.word 0x867a0009  ! 866: SDIV_R	sdiv 	%r8, %r9, %r3
	.word 0xde320009  ! 868: STH_R	sth	%r15, [%r8 + %r9]
	.word 0xd65a0009  ! 868: LDX_R	ldx	[%r8 + %r9], %r11
	.word 0xbfa208a9  ! 869: FSUBs	fsubs	%f8, %f9, %f31
	.word 0xce2a0009  ! 871: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xdf020009  ! 871: LDF_R	ld	[%r8, %r9], %f15
	.word 0x9c7a2738  ! 872: SDIV_I	sdiv 	%r8, 0x0738, %r14
	.word 0xe2b21009  ! 873: STHA_R	stha	%r17, [%r8 + %r9] 0x80
	.word 0xf4ca1009  ! 874: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r26
	.word 0xe0a21009  ! 875: STWA_R	stwa	%r16, [%r8 + %r9] 0x80
	.word 0xc4d21009  ! 876: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r2
	.word 0x8c520009  ! 877: UMUL_R	umul 	%r8, %r9, %r6
	.word 0xc4320009  ! 879: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc6020009  ! 879: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xc4220009  ! 881: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xea120009  ! 881: LDUH_R	lduh	[%r8 + %r9], %r21
	.word 0xcbf21009  ! 882: CASXA_I	casxa	[%r8] 0x80, %r9, %r5
	.word 0xd92227c4  ! 883: STF_I	st	%f12, [0x07c4, %r8]
	.word 0xfc9a25c8  ! 884: LDDA_I	ldda	[%r8, + 0x05c8] %asi, %r30
	.word 0xcc522158  ! 885: LDSH_I	ldsh	[%r8 + 0x0158], %r6
	.word 0xc5220009  ! 887: STF_R	st	%f2, [%r9, %r8]
	.word 0xde720009  ! 888: STX_R	stx	%r15, [%r8 + %r9]
	.word 0xf00a0009  ! 888: LDUB_R	ldub	[%r8 + %r9], %r24
	.word 0xa5a20929  ! 889: FMULs	fmuls	%f8, %f9, %f18
	.word 0xc36a0009  ! 890: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0x32800001  ! 891: BNE	bne,a	<label_0x1>
	.word 0xc45a24c8  ! 892: LDX_I	ldx	[%r8 + 0x04c8], %r2
	.word 0xc36a0009  ! 893: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0x84522460  ! 894: UMUL_I	umul 	%r8, 0x0460, %r2
	.word 0x18800002  ! 895: BGU	bgu  	<label_0x2>
	.word 0xcc2a0009  ! 897: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xce020009  ! 897: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0x04800001  ! 898: BLE	ble  	<label_0x1>
	.word 0xf4120009  ! 899: LDUH_R	lduh	[%r8 + %r9], %r26
	.word 0x0a800001  ! 900: BCS	bcs  	<label_0x1>
	.word 0xcbe21009  ! 901: CASA_I	casa	[%r8] 0x80, %r9, %r5
	.word 0xccfa1009  ! 902: SWAPA_R	swapa	%r6, [%r8 + %r9] 0x80
	.word 0xcc9a2730  ! 903: LDDA_I	ldda	[%r8, + 0x0730] %asi, %r6
	.word 0x8143c000  ! 904: STBAR	stbar
	.word 0xcea22478  ! 905: STWA_I	stwa	%r7, [%r8 + 0x0478] %asi
	.word 0x8fa20929  ! 906: FMULs	fmuls	%f8, %f9, %f7
	.word 0xca520009  ! 907: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xc8a21009  ! 908: STWA_R	stwa	%r4, [%r8 + %r9] 0x80
	.word 0xb0720009  ! 909: UDIV_R	udiv 	%r8, %r9, %r24
	.word 0xc8220009  ! 911: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc7020009  ! 911: LDF_R	ld	[%r8, %r9], %f3
	.word 0x83a209a9  ! 912: FDIVs	fdivs	%f8, %f9, %f1
	.word 0xc36a0009  ! 913: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xccf21009  ! 914: STXA_R	stxa	%r6, [%r8 + %r9] 0x80
	.word 0xc6420009  ! 915: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xc3ea1009  ! 916: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xda0a2914  ! 917: LDUB_I	ldub	[%r8 + 0x0914], %r13
	.word 0x16800001  ! 918: BGE	bge  	<label_0x1>
	.word 0xb84a0009  ! 919: MULX_R	mulx 	%r8, %r9, %r28
	.word 0x8143e06f  ! 920: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #MemIssue | #Sync 
	.word 0xc4220009  ! 922: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc71a0009  ! 922: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xc26a0009  ! 923: LDSTUB_R	ldstub	%r1, [%r8 + %r9]
	.word 0xe62a0009  ! 925: STB_R	stb	%r19, [%r8 + %r9]
	.word 0xc9020009  ! 925: LDF_R	ld	[%r8, %r9], %f4
	.word 0xc36a0009  ! 926: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xf73a2ca8  ! 927: STDF_I	std	%f27, [0x0ca8, %r8]
	.word 0xc6b22028  ! 928: STHA_I	stha	%r3, [%r8 + 0x0028] %asi
	.word 0xc2320009  ! 930: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xf44a0009  ! 930: LDSB_R	ldsb	[%r8 + %r9], %r26
	.word 0xc9e21009  ! 931: CASA_I	casa	[%r8] 0x80, %r9, %r4
	.word 0x83a208a9  ! 932: FSUBs	fsubs	%f8, %f9, %f1
	.word 0xb04a0009  ! 933: MULX_R	mulx 	%r8, %r9, %r24
	.word 0xa4f2202c  ! 934: UDIVcc_I	udivcc 	%r8, 0x002c, %r18
	.word 0x884a0009  ! 935: MULX_R	mulx 	%r8, %r9, %r4
	.word 0xda5221d8  ! 936: LDSH_I	ldsh	[%r8 + 0x01d8], %r13
	.word 0xc4f22d08  ! 937: STXA_I	stxa	%r2, [%r8 + 0x0d08] %asi
	.word 0xc29221ec  ! 938: LDUHA_I	lduha	[%r8, + 0x01ec] %asi, %r1
	.word 0xe85a0009  ! 939: LDX_R	ldx	[%r8 + %r9], %r20
	.word 0xaa720009  ! 940: UDIV_R	udiv 	%r8, %r9, %r21
	.word 0xc9222da0  ! 941: STF_I	st	%f4, [0x0da0, %r8]
	.word 0x14800002  ! 942: BG	bg  	<label_0x2>
	.word 0x8143c000  ! 943: STBAR	stbar
	.word 0xc9020009  ! 944: LDF_R	ld	[%r8, %r9], %f4
	.word 0x8143e007  ! 945: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore 
	.word 0xcc9a2c08  ! 946: LDDA_I	ldda	[%r8, + 0x0c08] %asi, %r6
	.word 0xcdf22009  ! 947: CASXA_R	casxa	[%r8]%asi, %r9, %r6
	.word 0x825a0009  ! 948: SMUL_R	smul 	%r8, %r9, %r1
	.word 0x8cf20009  ! 949: UDIVcc_R	udivcc 	%r8, %r9, %r6
	.word 0xc3ea2b84  ! 950: PREFETCHA_I	prefetcha	[%r8, + 0x0b84] %asi, #one_read
	.word 0x8c5a2650  ! 951: SMUL_I	smul 	%r8, 0x0650, %r6
	.word 0x89a208a9  ! 952: FSUBs	fsubs	%f8, %f9, %f4
	.word 0xe2c21009  ! 953: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r17
	.word 0xc8122e2c  ! 954: LDUH_I	lduh	[%r8 + 0x0e2c], %r4
	.word 0xf6b21009  ! 955: STHA_R	stha	%r27, [%r8 + %r9] 0x80
	.word 0xc3ea1009  ! 956: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xcbe21009  ! 957: CASA_I	casa	[%r8] 0x80, %r9, %r5
	.word 0xecda1009  ! 958: LDXA_R	ldxa	[%r8, %r9] 0x80, %r22
	.word 0xfeb227d8  ! 959: STHA_I	stha	%r31, [%r8 + 0x07d8] %asi
	.word 0x9ef20009  ! 960: UDIVcc_R	udivcc 	%r8, %r9, %r15
	.word 0xba4a2e88  ! 961: MULX_I	mulx 	%r8, 0x0e88, %r29
	.word 0xc86a0009  ! 962: LDSTUB_R	ldstub	%r4, [%r8 + %r9]
	.word 0x8143e020  ! 963: MEMBAR	membar	#MemIssue 
	.word 0xca7a0009  ! 964: SWAP_R	swap	%r5, [%r8 + %r9]
	.word 0x8143c000  ! 965: STBAR	stbar
	.word 0xc36a2cb8  ! 966: PREFETCH_I	prefetch	[%r8 + 0x0cb8], #one_read
	.word 0xcf22252c  ! 967: STF_I	st	%f7, [0x052c, %r8]
	.word 0xc8ba24f8  ! 968: STDA_I	stda	%r4, [%r8 + 0x04f8] %asi
	.word 0xcc320009  ! 970: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xca020009  ! 970: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xc3ea1009  ! 971: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc3e21009  ! 972: CASA_I	casa	[%r8] 0x80, %r9, %r1
	.word 0x2c800002  ! 973: BNEG	bneg,a	<label_0x2>
	.word 0xce6a0009  ! 974: LDSTUB_R	ldstub	%r7, [%r8 + %r9]
	.word 0xc3f21009  ! 975: CASXA_I	casxa	[%r8] 0x80, %r9, %r1
	.word 0xc3ea1009  ! 976: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc4821009  ! 977: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r2
	.word 0xc3222258  ! 978: STF_I	st	%f1, [0x0258, %r8]
	.word 0x8cda0009  ! 979: SMULcc_R	smulcc 	%r8, %r9, %r6
	.word 0x8a5a2860  ! 980: SMUL_I	smul 	%r8, 0x0860, %r5
	.word 0xe06a0009  ! 981: LDSTUB_R	ldstub	%r16, [%r8 + %r9]
	.word 0x32800001  ! 982: BNE	bne,a	<label_0x1>
	.word 0x86f22040  ! 983: UDIVcc_I	udivcc 	%r8, 0x0040, %r3
	.word 0xcab21009  ! 984: STHA_R	stha	%r5, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 985: STBAR	stbar
	.word 0xc6c21009  ! 986: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r3
	.word 0x20800001  ! 987: BN	bn,a	<label_0x1>
	.word 0x32800001  ! 988: BNE	bne,a	<label_0x1>
	.word 0x26c20001  ! 989: BRLZ	brlz,a,nt	%8,<label_0x20001>
	.word 0x8143c000  ! 990: STBAR	stbar
	.word 0xcf220009  ! 992: STF_R	st	%f7, [%r9, %r8]
	.word 0xc8720009  ! 993: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xcc520009  ! 993: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xc36a0009  ! 994: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc8220009  ! 996: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xca120009  ! 996: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xacfa2790  ! 997: SDIVcc_I	sdivcc 	%r8, 0x0790, %r22
	.word 0xc3ea1009  ! 998: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc6c228c0  ! 999: LDSWA_I	ldswa	[%r8, + 0x08c0] %asi, %r3
	.word 0xc3ea1009  ! 1000: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc36a26a4  ! 1001: PREFETCH_I	prefetch	[%r8 + 0x06a4], #one_read
	.word 0xb04a0009  ! 1002: MULX_R	mulx 	%r8, %r9, %r24
	.word 0x884a0009  ! 1003: MULX_R	mulx 	%r8, %r9, %r4
	.word 0xcef22240  ! 1004: STXA_I	stxa	%r7, [%r8 + 0x0240] %asi
	.word 0x864a0009  ! 1005: MULX_R	mulx 	%r8, %r9, %r3
	.word 0xc4220009  ! 1007: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc8420009  ! 1007: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xe80a2b90  ! 1008: LDUB_I	ldub	[%r8 + 0x0b90], %r20
	.word 0x8cda0009  ! 1009: SMULcc_R	smulcc 	%r8, %r9, %r6
	.word 0xc36a23e8  ! 1010: PREFETCH_I	prefetch	[%r8 + 0x03e8], #one_read
	.word 0x9c5a296c  ! 1011: SMUL_I	smul 	%r8, 0x096c, %r14
	.word 0xdc720009  ! 1013: STX_R	stx	%r14, [%r8 + %r9]
	.word 0xc51a0009  ! 1013: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xec320009  ! 1015: STH_R	sth	%r22, [%r8 + %r9]
	.word 0xc8420009  ! 1015: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xc0ba2780  ! 1016: STDA_I	stda	%r0, [%r8 + 0x0780] %asi
	.word 0x8143c000  ! 1017: STBAR	stbar
	.word 0x85a208a9  ! 1018: FSUBs	fsubs	%f8, %f9, %f2
	.word 0xc36a0009  ! 1019: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xce220009  ! 1021: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc2120009  ! 1021: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0x8143c000  ! 1022: STBAR	stbar
	.word 0xc5e22009  ! 1023: CASA_R	casa	[%r8] %asi, %r9, %r2
	.word 0xc53a2ff0  ! 1024: STDF_I	std	%f2, [0x0ff0, %r8]
	.word 0xecea2d78  ! 1025: LDSTUBA_I	ldstuba	%r22, [%r8 + 0x0d78] %asi
	.word 0x886a0009  ! 1026: UDIVX_R	udivx 	%r8, %r9, %r4
	.word 0xf44a20d8  ! 1027: LDSB_I	ldsb	[%r8 + 0x00d8], %r26
	.word 0x866a0009  ! 1028: UDIVX_R	udivx 	%r8, %r9, %r3
	.word 0xcc4a0009  ! 1029: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0x8143c000  ! 1030: STBAR	stbar
	.word 0xec7a0009  ! 1031: SWAP_R	swap	%r22, [%r8 + %r9]
	.word 0x00800001  ! 1032: BN	bn  	<label_0x1>
	.word 0xc4821009  ! 1033: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r2
	.word 0xc3ea1009  ! 1034: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc4220009  ! 1036: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xe04a0009  ! 1036: LDSB_R	ldsb	[%r8 + %r9], %r16
	.word 0x8143e07f  ! 1037: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0x84522350  ! 1038: UMUL_I	umul 	%r8, 0x0350, %r2
	.word 0xc3ea20e8  ! 1039: PREFETCHA_I	prefetcha	[%r8, + 0x00e8] %asi, #one_read
	.word 0x84720009  ! 1040: UDIV_R	udiv 	%r8, %r9, %r2
	.word 0xcafa1009  ! 1041: SWAPA_R	swapa	%r5, [%r8 + %r9] 0x80
	.word 0xb1a20929  ! 1042: FMULs	fmuls	%f8, %f9, %f24
	.word 0xf46a25ac  ! 1043: LDSTUB_I	ldstub	%r26, [%r8 + 0x05ac]
	.word 0xfcf21009  ! 1044: STXA_R	stxa	%r30, [%r8 + %r9] 0x80
	.word 0x8cfa0009  ! 1045: SDIVcc_R	sdivcc 	%r8, %r9, %r6
	.word 0xcfe22009  ! 1046: CASA_R	casa	[%r8] %asi, %r9, %r7
	.word 0xc46a234c  ! 1047: LDSTUB_I	ldstub	%r2, [%r8 + 0x034c]
	.word 0xc7e22009  ! 1048: CASA_R	casa	[%r8] %asi, %r9, %r3
	.word 0x18800002  ! 1049: BGU	bgu  	<label_0x2>
	.word 0xf0ea2e54  ! 1050: LDSTUBA_I	ldstuba	%r24, [%r8 + 0x0e54] %asi
	.word 0xe6220009  ! 1052: STW_R	stw	%r19, [%r8 + %r9]
	.word 0xc81a0009  ! 1052: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xc47a2638  ! 1053: SWAP_I	swap	%r2, [%r8 + 0x0638]
	.word 0x8143e073  ! 1054: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside | #MemIssue | #Sync 
	.word 0xdd020009  ! 1055: LDF_R	ld	[%r8, %r9], %f14
	.word 0xd7222878  ! 1056: STF_I	st	%f11, [0x0878, %r8]
	.word 0x827a0009  ! 1057: SDIV_R	sdiv 	%r8, %r9, %r1
	.word 0xe4320009  ! 1059: STH_R	sth	%r18, [%r8 + %r9]
	.word 0xc41a0009  ! 1059: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xce220009  ! 1061: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xca420009  ! 1061: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0x22800001  ! 1062: BE	be,a	<label_0x1>
	.word 0xb7a209a9  ! 1063: FDIVs	fdivs	%f8, %f9, %f27
	.word 0xc73a0009  ! 1065: STDF_R	std	%f3, [%r9, %r8]
	.word 0xcc720009  ! 1066: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xd65a0009  ! 1066: LDX_R	ldx	[%r8 + %r9], %r11
	.word 0xc40a0009  ! 1067: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xcd222f08  ! 1068: STF_I	st	%f6, [0x0f08, %r8]
	.word 0x24800001  ! 1069: BLE	ble,a	<label_0x1>
	.word 0xc84221d0  ! 1070: LDSW_I	ldsw	[%r8 + 0x01d0], %r4
	.word 0x2c800002  ! 1071: BNEG	bneg,a	<label_0x2>
	.word 0x8143c000  ! 1072: STBAR	stbar
	.word 0xca8a2f44  ! 1073: LDUBA_I	lduba	[%r8, + 0x0f44] %asi, %r5
	.word 0xd8020009  ! 1074: LDUW_R	lduw	[%r8 + %r9], %r12
	.word 0xc7220009  ! 1076: STF_R	st	%f3, [%r9, %r8]
	.word 0xc8720009  ! 1077: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc4420009  ! 1077: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xeeea1009  ! 1078: LDSTUBA_R	ldstuba	%r23, [%r8 + %r9] 0x80
	.word 0xe42a0009  ! 1080: STB_R	stb	%r18, [%r8 + %r9]
	.word 0xcc120009  ! 1080: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xc3ea25e8  ! 1081: PREFETCHA_I	prefetcha	[%r8, + 0x05e8] %asi, #one_read
	.word 0xd6ea29c4  ! 1082: LDSTUBA_I	ldstuba	%r11, [%r8 + 0x09c4] %asi
	.word 0xc3ea240c  ! 1083: PREFETCHA_I	prefetcha	[%r8, + 0x040c] %asi, #one_read
	.word 0xccda1009  ! 1084: LDXA_R	ldxa	[%r8, %r9] 0x80, %r6
	.word 0x1a800002  ! 1085: BCC	bcc  	<label_0x2>
	.word 0xc42a0009  ! 1087: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xcc1a0009  ! 1087: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xfe120009  ! 1088: LDUH_R	lduh	[%r8 + %r9], %r31
	.word 0xc6f22560  ! 1089: STXA_I	stxa	%r3, [%r8 + 0x0560] %asi
	.word 0xc3ea1009  ! 1090: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xe4c2288c  ! 1091: LDSWA_I	ldswa	[%r8, + 0x088c] %asi, %r18
	.word 0xd8f223d0  ! 1092: STXA_I	stxa	%r12, [%r8 + 0x03d0] %asi
	.word 0xceca1009  ! 1093: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r7
	.word 0xde2a0009  ! 1095: STB_R	stb	%r15, [%r8 + %r9]
	.word 0xc20a0009  ! 1095: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0x886a0009  ! 1096: UDIVX_R	udivx 	%r8, %r9, %r4
	.word 0xf4522a68  ! 1097: LDSH_I	ldsh	[%r8 + 0x0a68], %r26
	.word 0x8d220009  ! 1098: MULScc_R	mulscc 	%r8, %r9, %r6
	.word 0x30800002  ! 1099: BA	ba,a	<label_0x2>
	.word 0xc3ea1009  ! 1100: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x1a800001  ! 1101: BCC	bcc  	<label_0x1>
	.word 0xb2f22050  ! 1102: UDIVcc_I	udivcc 	%r8, 0x0050, %r25
	.word 0xc53a0009  ! 1104: STDF_R	std	%f2, [%r9, %r8]
	.word 0xec720009  ! 1105: STX_R	stx	%r22, [%r8 + %r9]
	.word 0xc6120009  ! 1105: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xca5a0009  ! 1106: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0x8143e00d  ! 1107: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore 
	.word 0xcc2a0009  ! 1109: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc25a0009  ! 1109: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0x8e520009  ! 1110: UMUL_R	umul 	%r8, %r9, %r7
	.word 0x8fa20829  ! 1111: FADDs	fadds	%f8, %f9, %f7
	.word 0xc8ba2648  ! 1112: STDA_I	stda	%r4, [%r8 + 0x0648] %asi
	.word 0xcc5a0009  ! 1113: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xca522460  ! 1114: LDSH_I	ldsh	[%r8 + 0x0460], %r5
	.word 0x88d22ba8  ! 1115: UMULcc_I	umulcc 	%r8, 0x0ba8, %r4
	.word 0x83a208a9  ! 1116: FSUBs	fsubs	%f8, %f9, %f1
	.word 0xfd3a0009  ! 1118: STDF_R	std	%f30, [%r9, %r8]
	.word 0xc6720009  ! 1119: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xce5a0009  ! 1119: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0x96d22134  ! 1120: UMULcc_I	umulcc 	%r8, 0x0134, %r11
	.word 0xc36a2ea0  ! 1121: PREFETCH_I	prefetch	[%r8 + 0x0ea0], #one_read
	.word 0xc45a2da0  ! 1122: LDX_I	ldx	[%r8 + 0x0da0], %r2
	.word 0xe62a0009  ! 1124: STB_R	stb	%r19, [%r8 + %r9]
	.word 0xc3020009  ! 1124: LDF_R	ld	[%r8, %r9], %f1
	.word 0xc84a2a38  ! 1125: LDSB_I	ldsb	[%r8 + 0x0a38], %r4
	.word 0xf22a0009  ! 1127: STB_R	stb	%r25, [%r8 + %r9]
	.word 0xcc420009  ! 1127: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xcc921009  ! 1128: LDUHA_R	lduha	[%r8, %r9] 0x80, %r6
	.word 0xca220009  ! 1130: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xec120009  ! 1130: LDUH_R	lduh	[%r8 + %r9], %r22
	.word 0xcff22009  ! 1131: CASXA_R	casxa	[%r8]%asi, %r9, %r7
	.word 0x8da20829  ! 1132: FADDs	fadds	%f8, %f9, %f6
	.word 0xc9220009  ! 1134: STF_R	st	%f4, [%r9, %r8]
	.word 0xc8720009  ! 1135: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xca420009  ! 1135: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0x8143c000  ! 1136: STBAR	stbar
	.word 0x8143c000  ! 1137: STBAR	stbar
	.word 0x04ca0001  ! 1138: BRLEZ	brlez  ,pt	%8,<label_0xa0001>
	.word 0xca020009  ! 1139: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0x8143c000  ! 1140: STBAR	stbar
	.word 0x8c520009  ! 1141: UMUL_R	umul 	%r8, %r9, %r6
	.word 0xc36a287c  ! 1142: PREFETCH_I	prefetch	[%r8 + 0x087c], #one_read
	.word 0xf42a0009  ! 1144: STB_R	stb	%r26, [%r8 + %r9]
	.word 0xf4020009  ! 1144: LDUW_R	lduw	[%r8 + %r9], %r26
	.word 0x8a520009  ! 1145: UMUL_R	umul 	%r8, %r9, %r5
	.word 0xc6b21009  ! 1146: STHA_R	stha	%r3, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 1147: STBAR	stbar
	.word 0xda320009  ! 1149: STH_R	sth	%r13, [%r8 + %r9]
	.word 0xcc120009  ! 1149: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xc6921009  ! 1150: LDUHA_R	lduha	[%r8, %r9] 0x80, %r3
	.word 0xc36a0009  ! 1151: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0x88720009  ! 1152: UDIV_R	udiv 	%r8, %r9, %r4
	.word 0x846a2ec0  ! 1153: UDIVX_I	udivx 	%r8, 0x0ec0, %r2
	.word 0xf2220009  ! 1155: STW_R	stw	%r25, [%r8 + %r9]
	.word 0xca420009  ! 1155: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xc36a2864  ! 1156: PREFETCH_I	prefetch	[%r8 + 0x0864], #one_read
	.word 0x2c800001  ! 1157: BNEG	bneg,a	<label_0x1>
	.word 0xc5220009  ! 1159: STF_R	st	%f2, [%r9, %r8]
	.word 0xca720009  ! 1160: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xe4520009  ! 1160: LDSH_R	ldsh	[%r8 + %r9], %r18
	.word 0xdea21009  ! 1161: STWA_R	stwa	%r15, [%r8 + %r9] 0x80
	.word 0x8143e031  ! 1162: MEMBAR	membar	#LoadLoad | #Lookaside | #MemIssue 
	.word 0xc4ba1009  ! 1163: STDA_R	stda	%r2, [%r8 + %r9] 0x80
	.word 0x896a0009  ! 1164: SDIVX_R	sdivx	%r8, %r9, %r4
	.word 0xc8da2a88  ! 1165: LDXA_I	ldxa	[%r8, + 0x0a88] %asi, %r4
	.word 0xc522255c  ! 1166: STF_I	st	%f2, [0x055c, %r8]
	.word 0x2e800002  ! 1167: BVS	bvs,a	<label_0x2>
	.word 0xc6ea206c  ! 1168: LDSTUBA_I	ldstuba	%r3, [%r8 + 0x006c] %asi
	.word 0xca320009  ! 1170: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc2020009  ! 1170: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xe4320009  ! 1172: STH_R	sth	%r18, [%r8 + %r9]
	.word 0xca020009  ! 1172: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xb05a0009  ! 1173: SMUL_R	smul 	%r8, %r9, %r24
	.word 0xccf225c8  ! 1174: STXA_I	stxa	%r6, [%r8 + 0x05c8] %asi
	.word 0xdeaa2ed8  ! 1175: STBA_I	stba	%r15, [%r8 + 0x0ed8] %asi
	.word 0x82520009  ! 1176: UMUL_R	umul 	%r8, %r9, %r1
	.word 0xca320009  ! 1178: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc6420009  ! 1178: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0x9da209a9  ! 1179: FDIVs	fdivs	%f8, %f9, %f14
	.word 0xc2320009  ! 1181: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xda0a0009  ! 1181: LDUB_R	ldub	[%r8 + %r9], %r13
	.word 0xde2a0009  ! 1183: STB_R	stb	%r15, [%r8 + %r9]
	.word 0xde4a0009  ! 1183: LDSB_R	ldsb	[%r8 + %r9], %r15
	.word 0xcaf22c28  ! 1184: STXA_I	stxa	%r5, [%r8 + 0x0c28] %asi
	.word 0xc36a0009  ! 1185: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc9220009  ! 1187: STF_R	st	%f4, [%r9, %r8]
	.word 0xe4720009  ! 1188: STX_R	stx	%r18, [%r8 + %r9]
	.word 0xc80a0009  ! 1188: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xcb3a0009  ! 1190: STDF_R	std	%f5, [%r9, %r8]
	.word 0xe0720009  ! 1191: STX_R	stx	%r16, [%r8 + %r9]
	.word 0xe00a0009  ! 1191: LDUB_R	ldub	[%r8 + %r9], %r16
	.word 0x8b220009  ! 1192: MULScc_R	mulscc 	%r8, %r9, %r5
	.word 0xe0ca2914  ! 1193: LDSBA_I	ldsba	[%r8, + 0x0914] %asi, %r16
	.word 0x8143e064  ! 1194: MEMBAR	membar	#LoadStore | #MemIssue | #Sync 
	.word 0xd6320009  ! 1196: STH_R	sth	%r11, [%r8 + %r9]
	.word 0xc51a0009  ! 1196: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xfcf21009  ! 1197: STXA_R	stxa	%r30, [%r8 + %r9] 0x80
	.word 0xb87a0009  ! 1198: SDIV_R	sdiv 	%r8, %r9, %r28
	.word 0xc67a0009  ! 1199: SWAP_R	swap	%r3, [%r8 + %r9]
	.word 0xc81a2b98  ! 1200: LDD_I	ldd	[%r8 + 0x0b98], %r4
	.word 0x826a26ec  ! 1201: UDIVX_I	udivx 	%r8, 0x06ec, %r1
	.word 0xf8320009  ! 1203: STH_R	sth	%r28, [%r8 + %r9]
	.word 0xce5a0009  ! 1203: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xca220009  ! 1205: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xce120009  ! 1205: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xc8c224e4  ! 1206: LDSWA_I	ldswa	[%r8, + 0x04e4] %asi, %r4
	.word 0xdef21009  ! 1207: STXA_R	stxa	%r15, [%r8 + %r9] 0x80
	.word 0x8f6a2588  ! 1208: SDIVX_I	sdivx	%r8, 0x0588, %r7
	.word 0xcc1a0009  ! 1209: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xc8aa2288  ! 1210: STBA_I	stba	%r4, [%r8 + 0x0288] %asi
	.word 0xea5a0009  ! 1211: LDX_R	ldx	[%r8 + %r9], %r21
	.word 0xaa5220b0  ! 1212: UMUL_I	umul 	%r8, 0x00b0, %r21
	.word 0xc3ea2428  ! 1213: PREFETCHA_I	prefetcha	[%r8, + 0x0428] %asi, #one_read
	.word 0xccba1009  ! 1214: STDA_R	stda	%r6, [%r8 + %r9] 0x80
	.word 0xccea2f6c  ! 1215: LDSTUBA_I	ldstuba	%r6, [%r8 + 0x0f6c] %asi
	.word 0xc4420009  ! 1216: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xc6ca2b14  ! 1217: LDSBA_I	ldsba	[%r8, + 0x0b14] %asi, %r3
	.word 0xc2320009  ! 1219: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xfb1a0009  ! 1219: LDDF_R	ldd	[%r8, %r9], %f29
	.word 0xbfa20929  ! 1220: FMULs	fmuls	%f8, %f9, %f31
	.word 0xdc220009  ! 1222: STW_R	stw	%r14, [%r8 + %r9]
	.word 0xff1a0009  ! 1222: LDDF_R	ldd	[%r8, %r9], %f31
	.word 0x8af20009  ! 1223: UDIVcc_R	udivcc 	%r8, %r9, %r5
	.word 0xc6022720  ! 1224: LDUW_I	lduw	[%r8 + 0x0720], %r3
	.word 0xaef20009  ! 1225: UDIVcc_R	udivcc 	%r8, %r9, %r23
	.word 0x0e800002  ! 1226: BVS	bvs  	<label_0x2>
	.word 0xce2a0009  ! 1228: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xcc020009  ! 1228: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xfc320009  ! 1230: STH_R	sth	%r30, [%r8 + %r9]
	.word 0xc31a0009  ! 1230: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0x8143e03a  ! 1231: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside | #MemIssue 
	.word 0x8143e00b  ! 1232: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore 
	.word 0x836a2ffc  ! 1233: SDIVX_I	sdivx	%r8, 0x0ffc, %r1
	.word 0xf0ba2a20  ! 1234: STDA_I	stda	%r24, [%r8 + 0x0a20] %asi
	.word 0xb4d20009  ! 1235: UMULcc_R	umulcc 	%r8, %r9, %r26
	.word 0xccba1009  ! 1236: STDA_R	stda	%r6, [%r8 + %r9] 0x80
	.word 0xec9a2970  ! 1237: LDDA_I	ldda	[%r8, + 0x0970] %asi, %r22
	.word 0xeab21009  ! 1238: STHA_R	stha	%r21, [%r8 + %r9] 0x80
	.word 0xbcd20009  ! 1239: UMULcc_R	umulcc 	%r8, %r9, %r30
	.word 0xccc21009  ! 1240: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r6
	.word 0xc73a0009  ! 1242: STDF_R	std	%f3, [%r9, %r8]
	.word 0xcc720009  ! 1243: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc8420009  ! 1243: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xe8220009  ! 1245: STW_R	stw	%r20, [%r8 + %r9]
	.word 0xca520009  ! 1245: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0x86d22a44  ! 1246: UMULcc_I	umulcc 	%r8, 0x0a44, %r3
	.word 0x0e800001  ! 1247: BVS	bvs  	<label_0x1>
	.word 0xccba1009  ! 1248: STDA_R	stda	%r6, [%r8 + %r9] 0x80
	.word 0xcab226cc  ! 1249: STHA_I	stha	%r5, [%r8 + 0x06cc] %asi
	.word 0xcf3a2b68  ! 1250: STDF_I	std	%f7, [0x0b68, %r8]
	.word 0x16800001  ! 1251: BGE	bge  	<label_0x1>
	.word 0x8143e009  ! 1252: MEMBAR	membar	#LoadLoad | #StoreStore 
	.word 0xe8220009  ! 1254: STW_R	stw	%r20, [%r8 + %r9]
	.word 0xc3020009  ! 1254: LDF_R	ld	[%r8, %r9], %f1
	.word 0xcaf22830  ! 1255: STXA_I	stxa	%r5, [%r8 + 0x0830] %asi
	.word 0xcc1a2f90  ! 1256: LDD_I	ldd	[%r8 + 0x0f90], %r6
	.word 0xdcba1009  ! 1257: STDA_R	stda	%r14, [%r8 + %r9] 0x80
	.word 0x8a5a23c8  ! 1258: SMUL_I	smul 	%r8, 0x03c8, %r5
	.word 0xc8320009  ! 1260: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xcc120009  ! 1260: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xc3ea26bc  ! 1261: PREFETCHA_I	prefetcha	[%r8, + 0x06bc] %asi, #one_read
	.word 0xca6a2210  ! 1262: LDSTUB_I	ldstub	%r5, [%r8 + 0x0210]
	.word 0x8143e01a  ! 1263: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside 
	.word 0xc2220009  ! 1265: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc6020009  ! 1265: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0x88d20009  ! 1266: UMULcc_R	umulcc 	%r8, %r9, %r4
	.word 0xfc020009  ! 1267: LDUW_R	lduw	[%r8 + %r9], %r30
	.word 0xa1a208a9  ! 1268: FSUBs	fsubs	%f8, %f9, %f16
	.word 0xc4aa1009  ! 1269: STBA_R	stba	%r2, [%r8 + %r9] 0x80
	.word 0x82fa0009  ! 1270: SDIVcc_R	sdivcc 	%r8, %r9, %r1
	.word 0xca6a0009  ! 1271: LDSTUB_R	ldstub	%r5, [%r8 + %r9]
	.word 0xdab22e74  ! 1272: STHA_I	stha	%r13, [%r8 + 0x0e74] %asi
	.word 0x8143e06f  ! 1273: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #MemIssue | #Sync 
	.word 0xc36a0009  ! 1274: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc36a0009  ! 1275: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xccca2364  ! 1276: LDSBA_I	ldsba	[%r8, + 0x0364] %asi, %r6
	.word 0xf8f21009  ! 1277: STXA_R	stxa	%r28, [%r8 + %r9] 0x80
	.word 0xdc320009  ! 1279: STH_R	sth	%r14, [%r8 + %r9]
	.word 0xc51a0009  ! 1279: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xa84a0009  ! 1280: MULX_R	mulx 	%r8, %r9, %r20
	.word 0x86f20009  ! 1281: UDIVcc_R	udivcc 	%r8, %r9, %r3
	.word 0x2ec20001  ! 1282: BRGEZ	brgez,a,nt	%8,<label_0x20001>
	.word 0x8143e001  ! 1283: MEMBAR	membar	#LoadLoad 
	.word 0xc3ea28b8  ! 1284: PREFETCHA_I	prefetcha	[%r8, + 0x08b8] %asi, #one_read
	.word 0xc2821009  ! 1285: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r1
	.word 0xcaaa1009  ! 1286: STBA_R	stba	%r5, [%r8 + %r9] 0x80
	.word 0xfaea1009  ! 1287: LDSTUBA_R	ldstuba	%r29, [%r8 + %r9] 0x80
	.word 0xc8120009  ! 1288: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xd6020009  ! 1289: LDUW_R	lduw	[%r8 + %r9], %r11
	.word 0xc49a24d0  ! 1290: LDDA_I	ldda	[%r8, + 0x04d0] %asi, %r2
	.word 0xc36a0009  ! 1291: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0x8143c000  ! 1292: STBAR	stbar
	.word 0xee2a0009  ! 1294: STB_R	stb	%r23, [%r8 + %r9]
	.word 0xcc520009  ! 1294: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0x2c800002  ! 1295: BNEG	bneg,a	<label_0x2>
	.word 0xc82a0009  ! 1297: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xce420009  ! 1297: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xcfe22009  ! 1298: CASA_R	casa	[%r8] %asi, %r9, %r7
	.word 0x2ec20001  ! 1299: BRGEZ	brgez,a,nt	%8,<label_0x20001>
	.word 0xcc2a0009  ! 1301: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc8420009  ! 1301: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0x84d20009  ! 1302: UMULcc_R	umulcc 	%r8, %r9, %r2
	.word 0x9da209a9  ! 1303: FDIVs	fdivs	%f8, %f9, %f14
	.word 0x88fa0009  ! 1304: SDIVcc_R	sdivcc 	%r8, %r9, %r4
	.word 0x8da20929  ! 1305: FMULs	fmuls	%f8, %f9, %f6
	.word 0x8ada26c0  ! 1306: SMULcc_I	smulcc 	%r8, 0x06c0, %r5
	.word 0x8143e078  ! 1307: MEMBAR	membar	#StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xc3220009  ! 1309: STF_R	st	%f1, [%r9, %r8]
	.word 0xc8720009  ! 1310: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc41a0009  ! 1310: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xacf20009  ! 1311: UDIVcc_R	udivcc 	%r8, %r9, %r22
	.word 0xcafa1009  ! 1312: SWAPA_R	swapa	%r5, [%r8 + %r9] 0x80
	.word 0x82722a58  ! 1313: UDIV_I	udiv 	%r8, 0x0a58, %r1
	.word 0xc6720009  ! 1315: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc81a0009  ! 1315: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xf4ba2bd8  ! 1316: STDA_I	stda	%r26, [%r8 + 0x0bd8] %asi
	.word 0x8b6a21c0  ! 1317: SDIVX_I	sdivx	%r8, 0x01c0, %r5
	.word 0xde2a0009  ! 1319: STB_R	stb	%r15, [%r8 + %r9]
	.word 0xf6020009  ! 1319: LDUW_R	lduw	[%r8 + %r9], %r27
	.word 0xc6b22108  ! 1320: STHA_I	stha	%r3, [%r8 + 0x0108] %asi
	.word 0xc2ea1009  ! 1321: LDSTUBA_R	ldstuba	%r1, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 1322: STBAR	stbar
	.word 0x8143c000  ! 1323: STBAR	stbar
	.word 0xc53a2730  ! 1324: STDF_I	std	%f2, [0x0730, %r8]
	.word 0xc46a203c  ! 1325: LDSTUB_I	ldstub	%r2, [%r8 + 0x003c]
	.word 0xc0ba27e8  ! 1326: STDA_I	stda	%r0, [%r8 + 0x07e8] %asi
	.word 0xc6b22a30  ! 1327: STHA_I	stha	%r3, [%r8 + 0x0a30] %asi
	.word 0x887a2b9c  ! 1328: SDIV_I	sdiv 	%r8, 0x0b9c, %r4
	.word 0xc0ba1009  ! 1329: STDA_R	stda	%r0, [%r8 + %r9] 0x80
	.word 0x8c520009  ! 1330: UMUL_R	umul 	%r8, %r9, %r6
	.word 0x8143e051  ! 1331: MEMBAR	membar	#LoadLoad | #Lookaside | #Sync 
	.word 0x8a720009  ! 1332: UDIV_R	udiv 	%r8, %r9, %r5
	.word 0xd8320009  ! 1334: STH_R	sth	%r12, [%r8 + %r9]
	.word 0xcd1a0009  ! 1334: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0x8143c000  ! 1335: STBAR	stbar
	.word 0xc4821009  ! 1336: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r2
	.word 0xc6b21009  ! 1337: STHA_R	stha	%r3, [%r8 + %r9] 0x80
	.word 0xcf3a2928  ! 1338: STDF_I	std	%f7, [0x0928, %r8]
	.word 0xd7220009  ! 1340: STF_R	st	%f11, [%r9, %r8]
	.word 0xcc720009  ! 1341: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc41a0009  ! 1341: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xcf1a2308  ! 1342: LDDF_I	ldd	[%r8, 0x0308], %f7
	.word 0xe0a22038  ! 1343: STWA_I	stwa	%r16, [%r8 + 0x0038] %asi
	.word 0xea2a0009  ! 1345: STB_R	stb	%r21, [%r8 + %r9]
	.word 0xdc5a0009  ! 1345: LDX_R	ldx	[%r8 + %r9], %r14
	.word 0x85a209a9  ! 1346: FDIVs	fdivs	%f8, %f9, %f2
	.word 0x89220009  ! 1347: MULScc_R	mulscc 	%r8, %r9, %r4
	.word 0xc4b21009  ! 1348: STHA_R	stha	%r2, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 1349: STBAR	stbar
	.word 0x8e5a0009  ! 1350: SMUL_R	smul 	%r8, %r9, %r7
	.word 0x2c800002  ! 1351: BNEG	bneg,a	<label_0x2>
	.word 0x8143c000  ! 1352: STBAR	stbar
	.word 0xc36a2d98  ! 1353: PREFETCH_I	prefetch	[%r8 + 0x0d98], #one_read
	.word 0xc36a0009  ! 1354: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xdc4a0009  ! 1355: LDSB_R	ldsb	[%r8 + %r9], %r14
	.word 0x876a29ac  ! 1356: SDIVX_I	sdivx	%r8, 0x09ac, %r3
	.word 0xf122230c  ! 1357: STF_I	st	%f24, [0x030c, %r8]
	.word 0x98fa23b0  ! 1358: SDIVcc_I	sdivcc 	%r8, 0x03b0, %r12
	.word 0x8143c000  ! 1359: STBAR	stbar
	.word 0xf0220009  ! 1361: STW_R	stw	%r24, [%r8 + %r9]
	.word 0xcf020009  ! 1361: LDF_R	ld	[%r8, %r9], %f7
	.word 0x8143c000  ! 1362: STBAR	stbar
	.word 0xcbe21009  ! 1363: CASA_I	casa	[%r8] 0x80, %r9, %r5
	.word 0xe48a1009  ! 1364: LDUBA_R	lduba	[%r8, %r9] 0x80, %r18
	.word 0xc2c2205c  ! 1365: LDSWA_I	ldswa	[%r8, + 0x005c] %asi, %r1
	.word 0xc3ea1009  ! 1366: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc93a0009  ! 1368: STDF_R	std	%f4, [%r9, %r8]
	.word 0xca720009  ! 1369: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc64a0009  ! 1369: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0x986a2a74  ! 1370: UDIVX_I	udivx 	%r8, 0x0a74, %r12
	.word 0x84f20009  ! 1371: UDIVcc_R	udivcc 	%r8, %r9, %r2
	.word 0x8143e065  ! 1372: MEMBAR	membar	#LoadLoad | #LoadStore | #MemIssue | #Sync 
	.word 0xe4220009  ! 1374: STW_R	stw	%r18, [%r8 + %r9]
	.word 0xf81a0009  ! 1374: LDD_R	ldd	[%r8 + %r9], %r28
	.word 0x8143e025  ! 1375: MEMBAR	membar	#LoadLoad | #LoadStore | #MemIssue 
	.word 0x8143e07a  ! 1376: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xc4320009  ! 1378: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc81a0009  ! 1378: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x8e7227c8  ! 1379: UDIV_I	udiv 	%r8, 0x07c8, %r7
	.word 0xc8ea2094  ! 1380: LDSTUBA_I	ldstuba	%r4, [%r8 + 0x0094] %asi
	.word 0xc40a0009  ! 1381: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xe4720009  ! 1383: STX_R	stx	%r18, [%r8 + %r9]
	.word 0xec420009  ! 1383: LDSW_R	ldsw	[%r8 + %r9], %r22
	.word 0xda7a2714  ! 1384: SWAP_I	swap	%r13, [%r8 + 0x0714]
	.word 0xc51a2b08  ! 1385: LDDF_I	ldd	[%r8, 0x0b08], %f2
	.word 0xc4220009  ! 1387: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xcd020009  ! 1387: LDF_R	ld	[%r8, %r9], %f6
	.word 0x8143c000  ! 1388: STBAR	stbar
	.word 0xcc120009  ! 1389: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0x865224a8  ! 1390: UMUL_I	umul 	%r8, 0x04a8, %r3
	.word 0xc4120009  ! 1391: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xe01a24b8  ! 1392: LDD_I	ldd	[%r8 + 0x04b8], %r16
	.word 0xc80a2000  ! 1393: LDUB_I	ldub	[%r8 + 0x0000], %r4
	.word 0x0cca0001  ! 1394: BRGZ	brgz  ,pt	%8,<label_0xa0001>
	.word 0x08800002  ! 1395: BLEU	bleu  	<label_0x2>
	.word 0xfc320009  ! 1397: STH_R	sth	%r30, [%r8 + %r9]
	.word 0xc64a0009  ! 1397: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0x3e800002  ! 1398: BVC	bvc,a	<label_0x2>
	.word 0xc3ea1009  ! 1399: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc0ba1009  ! 1400: STDA_R	stda	%r0, [%r8 + %r9] 0x80
	.word 0xbe720009  ! 1401: UDIV_R	udiv 	%r8, %r9, %r31
	.word 0xc3ea23e8  ! 1402: PREFETCHA_I	prefetcha	[%r8, + 0x03e8] %asi, #one_read
	.word 0x82da2314  ! 1403: SMULcc_I	smulcc 	%r8, 0x0314, %r1
	.word 0x8143c000  ! 1404: STBAR	stbar
	.word 0xcc2a0009  ! 1406: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xcc520009  ! 1406: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xc62a0009  ! 1408: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xcc0a0009  ! 1408: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xd6d222b8  ! 1409: LDSHA_I	ldsha	[%r8, + 0x02b8] %asi, %r11
	.word 0xcb220009  ! 1411: STF_R	st	%f5, [%r9, %r8]
	.word 0xc8720009  ! 1412: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xf60a0009  ! 1412: LDUB_R	ldub	[%r8 + %r9], %r27
	.word 0xc8220009  ! 1414: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc3020009  ! 1414: LDF_R	ld	[%r8, %r9], %f1
	.word 0xc3ea1009  ! 1415: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc5222554  ! 1416: STF_I	st	%f2, [0x0554, %r8]
	.word 0xe7e22009  ! 1417: CASA_R	casa	[%r8] %asi, %r9, %r19
	.word 0x8143e043  ! 1418: MEMBAR	membar	#LoadLoad | #StoreLoad | #Sync 
	.word 0x8143e04b  ! 1419: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Sync 
	.word 0xc36a2058  ! 1420: PREFETCH_I	prefetch	[%r8 + 0x0058], #one_read
	.word 0xcada1009  ! 1421: LDXA_R	ldxa	[%r8, %r9] 0x80, %r5
	.word 0xea6a2750  ! 1422: LDSTUB_I	ldstub	%r21, [%r8 + 0x0750]
	.word 0xc36a2c6c  ! 1423: PREFETCH_I	prefetch	[%r8 + 0x0c6c], #one_read
	.word 0x8afa0009  ! 1424: SDIVcc_R	sdivcc 	%r8, %r9, %r5
	.word 0x864a20f0  ! 1425: MULX_I	mulx 	%r8, 0x00f0, %r3
	.word 0xfe7a0009  ! 1426: SWAP_R	swap	%r31, [%r8 + %r9]
	.word 0xc4ea2164  ! 1427: LDSTUBA_I	ldstuba	%r2, [%r8 + 0x0164] %asi
	.word 0xc9222694  ! 1428: STF_I	st	%f4, [0x0694, %r8]
	.word 0xa4722e14  ! 1429: UDIV_I	udiv 	%r8, 0x0e14, %r18
	.word 0xea5a0009  ! 1430: LDX_R	ldx	[%r8 + %r9], %r21
	.word 0x8c5a0009  ! 1431: SMUL_R	smul 	%r8, %r9, %r6
	.word 0x8af20009  ! 1432: UDIVcc_R	udivcc 	%r8, %r9, %r5
	.word 0xc3ea1009  ! 1433: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc2fa2758  ! 1434: SWAPA_I	swapa	%r1, [%r8 + 0x0758] %asi
	.word 0xe9220009  ! 1436: STF_R	st	%f20, [%r9, %r8]
	.word 0xc4720009  ! 1437: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc2520009  ! 1437: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xf6b22d54  ! 1438: STHA_I	stha	%r27, [%r8 + 0x0d54] %asi
	.word 0xcde21009  ! 1439: CASA_I	casa	[%r8] 0x80, %r9, %r6
	.word 0x86d20009  ! 1440: UMULcc_R	umulcc 	%r8, %r9, %r3
	.word 0xc3ea22d8  ! 1441: PREFETCHA_I	prefetcha	[%r8, + 0x02d8] %asi, #one_read
	.word 0x0eca0001  ! 1442: BRGEZ	brgez  ,pt	%8,<label_0xa0001>
	.word 0xe8ea1009  ! 1443: LDSTUBA_R	ldstuba	%r20, [%r8 + %r9] 0x80
	.word 0x8143e045  ! 1444: MEMBAR	membar	#LoadLoad | #LoadStore | #Sync 
	.word 0x9b220009  ! 1445: MULScc_R	mulscc 	%r8, %r9, %r13
	.word 0xc8c21009  ! 1446: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r4
	.word 0xcd2220d4  ! 1447: STF_I	st	%f6, [0x00d4, %r8]
	.word 0x40000002  ! 1448: CALL	call	disp30_2
	.word 0x24800001  ! 1449: BLE	ble,a	<label_0x1>
	.word 0x82fa0009  ! 1450: SDIVcc_R	sdivcc 	%r8, %r9, %r1
	.word 0x8143e07d  ! 1451: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xca320009  ! 1453: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc60a0009  ! 1453: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xc4ba1009  ! 1454: STDA_R	stda	%r2, [%r8 + %r9] 0x80
	.word 0x99a20829  ! 1455: FADDs	fadds	%f8, %f9, %f12
	.word 0x0c800001  ! 1456: BNEG	bneg  	<label_0x1>
	.word 0x82720009  ! 1457: UDIV_R	udiv 	%r8, %r9, %r1
	.word 0x24ca0001  ! 1458: BRLEZ	brlez,a,pt	%8,<label_0xa0001>
	.word 0x8143e03d  ! 1459: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0x984a2aa8  ! 1460: MULX_I	mulx 	%r8, 0x0aa8, %r12
	.word 0xc3ea1009  ! 1461: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xdefa2b28  ! 1462: SWAPA_I	swapa	%r15, [%r8 + 0x0b28] %asi
	.word 0x8c4a2470  ! 1463: MULX_I	mulx 	%r8, 0x0470, %r6
	.word 0x84fa0009  ! 1464: SDIVcc_R	sdivcc 	%r8, %r9, %r2
	.word 0xc36a2f00  ! 1465: PREFETCH_I	prefetch	[%r8 + 0x0f00], #one_read
	.word 0xc6a21009  ! 1466: STWA_R	stwa	%r3, [%r8 + %r9] 0x80
	.word 0x14800002  ! 1467: BG	bg  	<label_0x2>
	.word 0x8143e028  ! 1468: MEMBAR	membar	#StoreStore | #MemIssue 
	.word 0x0c800002  ! 1469: BNEG	bneg  	<label_0x2>
	.word 0xc28a1009  ! 1470: LDUBA_R	lduba	[%r8, %r9] 0x80, %r1
	.word 0x847a0009  ! 1471: SDIV_R	sdiv 	%r8, %r9, %r2
	.word 0x8143e04b  ! 1472: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Sync 
	.word 0xc3ea2c5c  ! 1473: PREFETCHA_I	prefetcha	[%r8, + 0x0c5c] %asi, #one_read
	.word 0xd7222f6c  ! 1474: STF_I	st	%f11, [0x0f6c, %r8]
	.word 0x88fa239c  ! 1475: SDIVcc_I	sdivcc 	%r8, 0x039c, %r4
	.word 0xc36a2cf0  ! 1476: PREFETCH_I	prefetch	[%r8 + 0x0cf0], #one_read
	.word 0xc6220009  ! 1478: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc8420009  ! 1478: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0x8143c000  ! 1479: STBAR	stbar
	.word 0x8143e04d  ! 1480: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Sync 
	.word 0xc7e21009  ! 1481: CASA_I	casa	[%r8] 0x80, %r9, %r3
	.word 0xdc821009  ! 1482: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r14
	.word 0xbda208a9  ! 1483: FSUBs	fsubs	%f8, %f9, %f30
	.word 0x8143e062  ! 1484: MEMBAR	membar	#StoreLoad | #MemIssue | #Sync 
	.word 0xe02a0009  ! 1486: STB_R	stb	%r16, [%r8 + %r9]
	.word 0xc64a0009  ! 1486: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xfa320009  ! 1488: STH_R	sth	%r29, [%r8 + %r9]
	.word 0xca020009  ! 1488: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xce320009  ! 1490: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc4420009  ! 1490: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xc4320009  ! 1492: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xed1a0009  ! 1492: LDDF_R	ldd	[%r8, %r9], %f22
	.word 0xf252211c  ! 1493: LDSH_I	ldsh	[%r8 + 0x011c], %r25
	.word 0xcaa22b84  ! 1494: STWA_I	stwa	%r5, [%r8 + 0x0b84] %asi
	.word 0x40000002  ! 1495: CALL	call	disp30_2
	.word 0x8ba20929  ! 1496: FMULs	fmuls	%f8, %f9, %f5
	.word 0x40000001  ! 1497: CALL	call	disp30_1
	.word 0xcd220009  ! 1499: STF_R	st	%f6, [%r9, %r8]
	.word 0xec720009  ! 1500: STX_R	stx	%r22, [%r8 + %r9]
	.word 0xc85a0009  ! 1500: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xa45a0009  ! 1501: SMUL_R	smul 	%r8, %r9, %r18
	.word 0xca720009  ! 1503: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xca5a0009  ! 1503: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xcbf22009  ! 1504: CASXA_R	casxa	[%r8]%asi, %r9, %r5
	.word 0x8143e04a  ! 1505: MEMBAR	membar	#StoreLoad | #StoreStore | #Sync 
	.word 0x8da208a9  ! 1506: FSUBs	fsubs	%f8, %f9, %f6
	.word 0x8f2227d4  ! 1507: MULScc_I	mulscc 	%r8, 0x07d4, %r7
	.word 0x87a20929  ! 1508: FMULs	fmuls	%f8, %f9, %f3
	.word 0x88d22e78  ! 1509: UMULcc_I	umulcc 	%r8, 0x0e78, %r4
	.word 0xf80a280c  ! 1510: LDUB_I	ldub	[%r8 + 0x080c], %r28
	.word 0x97a209a9  ! 1511: FDIVs	fdivs	%f8, %f9, %f11
	.word 0xccca2ac4  ! 1512: LDSBA_I	ldsba	[%r8, + 0x0ac4] %asi, %r6
	.word 0x1a800001  ! 1513: BCC	bcc  	<label_0x1>
	.word 0x89a20929  ! 1514: FMULs	fmuls	%f8, %f9, %f4
	.word 0xc4ea2d64  ! 1515: LDSTUBA_I	ldstuba	%r2, [%r8 + 0x0d64] %asi
	.word 0xc36a21bc  ! 1516: PREFETCH_I	prefetch	[%r8 + 0x01bc], #one_read
	.word 0xc3ea29e0  ! 1517: PREFETCHA_I	prefetcha	[%r8, + 0x09e0] %asi, #one_read
	.word 0xc2320009  ! 1519: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xec420009  ! 1519: LDSW_R	ldsw	[%r8 + %r9], %r22
	.word 0xc89a1009  ! 1520: LDDA_R	ldda	[%r8, %r9] 0x80, %r4
	.word 0xf67a0009  ! 1521: SWAP_R	swap	%r27, [%r8 + %r9]
	.word 0xe82a0009  ! 1523: STB_R	stb	%r20, [%r8 + %r9]
	.word 0xc41a0009  ! 1523: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xc49a1009  ! 1524: LDDA_R	ldda	[%r8, %r9] 0x80, %r2
	.word 0xc3ea2104  ! 1525: PREFETCHA_I	prefetcha	[%r8, + 0x0104] %asi, #one_read
	.word 0xc8ba1009  ! 1526: STDA_R	stda	%r4, [%r8 + %r9] 0x80
	.word 0xc36a2828  ! 1527: PREFETCH_I	prefetch	[%r8 + 0x0828], #one_read
	.word 0xc2b22974  ! 1528: STHA_I	stha	%r1, [%r8 + 0x0974] %asi
	.word 0x8ba209a9  ! 1529: FDIVs	fdivs	%f8, %f9, %f5
	.word 0xcc220009  ! 1531: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc6520009  ! 1531: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xc8320009  ! 1533: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xf0020009  ! 1533: LDUW_R	lduw	[%r8 + %r9], %r24
	.word 0xc2320009  ! 1535: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc2420009  ! 1535: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0x8143c000  ! 1536: STBAR	stbar
	.word 0x8143c000  ! 1537: STBAR	stbar
	.word 0xcc5a2898  ! 1538: LDX_I	ldx	[%r8 + 0x0898], %r6
	.word 0xde2a0009  ! 1540: STB_R	stb	%r15, [%r8 + %r9]
	.word 0xcc520009  ! 1540: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xc3ea2d28  ! 1541: PREFETCHA_I	prefetcha	[%r8, + 0x0d28] %asi, #one_read
	.word 0xcd3a0009  ! 1543: STDF_R	std	%f6, [%r9, %r8]
	.word 0xcc720009  ! 1544: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xe2420009  ! 1544: LDSW_R	ldsw	[%r8 + %r9], %r17
	.word 0xdde21009  ! 1545: CASA_I	casa	[%r8] 0x80, %r9, %r14
	.word 0x8143e01b  ! 1546: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Lookaside 
	.word 0x8143c000  ! 1547: STBAR	stbar
	.word 0xc5220009  ! 1549: STF_R	st	%f2, [%r9, %r8]
	.word 0xc4720009  ! 1550: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xce120009  ! 1550: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xb6da27a0  ! 1551: SMULcc_I	smulcc 	%r8, 0x07a0, %r27
	.word 0xf53a0009  ! 1553: STDF_R	std	%f26, [%r9, %r8]
	.word 0xea720009  ! 1554: STX_R	stx	%r21, [%r8 + %r9]
	.word 0xda5a0009  ! 1554: LDX_R	ldx	[%r8 + %r9], %r13
	.word 0xf8822c40  ! 1555: LDUWA_I	lduwa	[%r8, + 0x0c40] %asi, %r28
	.word 0xca720009  ! 1557: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xca020009  ! 1557: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0x8143e057  ! 1558: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside | #Sync 
	.word 0x8143e05a  ! 1559: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside | #Sync 
	.word 0x02c20001  ! 1560: BRZ	brz  ,nt	%8,<label_0x20001>
	.word 0x8143c000  ! 1561: STBAR	stbar
	.word 0xbed20009  ! 1562: UMULcc_R	umulcc 	%r8, %r9, %r31
	.word 0xc3ea1009  ! 1563: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x8143e011  ! 1564: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x8d6a2774  ! 1565: SDIVX_I	sdivx	%r8, 0x0774, %r6
	.word 0xc4fa24b0  ! 1566: SWAPA_I	swapa	%r2, [%r8 + 0x04b0] %asi
	.word 0x10800002  ! 1567: BA	ba  	<label_0x2>
	.word 0x8143e042  ! 1568: MEMBAR	membar	#StoreLoad | #Sync 
	.word 0x84f22250  ! 1569: UDIVcc_I	udivcc 	%r8, 0x0250, %r2
	.word 0x8a722a00  ! 1570: UDIV_I	udiv 	%r8, 0x0a00, %r5
	.word 0x8143e001  ! 1571: MEMBAR	membar	#LoadLoad 
	.word 0x0a800001  ! 1572: BCS	bcs  	<label_0x1>
	.word 0xcb3a0009  ! 1574: STDF_R	std	%f5, [%r9, %r8]
	.word 0xdc720009  ! 1575: STX_R	stx	%r14, [%r8 + %r9]
	.word 0xc2020009  ! 1575: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0x89a208a9  ! 1576: FSUBs	fsubs	%f8, %f9, %f4
	.word 0x36800002  ! 1577: BGE	bge,a	<label_0x2>
	.word 0x8143c000  ! 1578: STBAR	stbar
	.word 0x8b6a29ec  ! 1579: SDIVX_I	sdivx	%r8, 0x09ec, %r5
	.word 0xfaea2794  ! 1580: LDSTUBA_I	ldstuba	%r29, [%r8 + 0x0794] %asi
	.word 0x32800001  ! 1581: BNE	bne,a	<label_0x1>
	.word 0xff1a0009  ! 1582: LDDF_R	ldd	[%r8, %r9], %f31
	.word 0xcc922944  ! 1583: LDUHA_I	lduha	[%r8, + 0x0944] %asi, %r6
	.word 0xe5e21009  ! 1584: CASA_I	casa	[%r8] 0x80, %r9, %r18
	.word 0xf81a0009  ! 1585: LDD_R	ldd	[%r8 + %r9], %r28
	.word 0xdc220009  ! 1587: STW_R	stw	%r14, [%r8 + %r9]
	.word 0xc3020009  ! 1587: LDF_R	ld	[%r8, %r9], %f1
	.word 0xe42a0009  ! 1589: STB_R	stb	%r18, [%r8 + %r9]
	.word 0xc60a0009  ! 1589: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0x8ba208a9  ! 1590: FSUBs	fsubs	%f8, %f9, %f5
	.word 0x836a0009  ! 1591: SDIVX_R	sdivx	%r8, %r9, %r1
	.word 0xacda0009  ! 1592: SMULcc_R	smulcc 	%r8, %r9, %r22
	.word 0xe7022800  ! 1593: LDF_I	ld	[%r8, 0x0800], %f19
	.word 0x866a0009  ! 1594: UDIVX_R	udivx 	%r8, %r9, %r3
	.word 0xc53a0009  ! 1596: STDF_R	std	%f2, [%r9, %r8]
	.word 0xce720009  ! 1597: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc5020009  ! 1597: LDF_R	ld	[%r8, %r9], %f2
	.word 0xc60a0009  ! 1598: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0x28800001  ! 1599: BLEU	bleu,a	<label_0x1>
	.word 0xca420009  ! 1600: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xa84a2b80  ! 1601: MULX_I	mulx 	%r8, 0x0b80, %r20
	.word 0xc36a2dd0  ! 1602: PREFETCH_I	prefetch	[%r8 + 0x0dd0], #one_read
	.word 0xc2b22c68  ! 1603: STHA_I	stha	%r1, [%r8 + 0x0c68] %asi
	.word 0x8143c000  ! 1604: STBAR	stbar
	.word 0xccba1009  ! 1605: STDA_R	stda	%r6, [%r8 + %r9] 0x80
	.word 0xc3ea1009  ! 1606: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc36a2454  ! 1607: PREFETCH_I	prefetch	[%r8 + 0x0454], #one_read
	.word 0xc32222c0  ! 1608: STF_I	st	%f1, [0x02c0, %r8]
	.word 0xccba1009  ! 1609: STDA_R	stda	%r6, [%r8 + %r9] 0x80
	.word 0x8143e076  ! 1610: MEMBAR	membar	#StoreLoad | #LoadStore | #Lookaside | #MemIssue | #Sync 
	.word 0xccb22c88  ! 1611: STHA_I	stha	%r6, [%r8 + 0x0c88] %asi
	.word 0xf2da2628  ! 1612: LDXA_I	ldxa	[%r8, + 0x0628] %asi, %r25
	.word 0x02c20001  ! 1613: BRZ	brz  ,nt	%8,<label_0x20001>
	.word 0x8143e01c  ! 1614: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside 
	.word 0x85a20929  ! 1615: FMULs	fmuls	%f8, %f9, %f2
	.word 0x0e800001  ! 1616: BVS	bvs  	<label_0x1>
	.word 0xca320009  ! 1618: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc24a0009  ! 1618: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0x32800002  ! 1619: BNE	bne,a	<label_0x2>
	.word 0xba7a0009  ! 1620: SDIV_R	sdiv 	%r8, %r9, %r29
	.word 0x9efa28b4  ! 1621: SDIVcc_I	sdivcc 	%r8, 0x08b4, %r15
	.word 0xf27a242c  ! 1622: SWAP_I	swap	%r25, [%r8 + 0x042c]
	.word 0x2a800001  ! 1623: BCS	bcs,a	<label_0x1>
	.word 0x8cf20009  ! 1624: UDIVcc_R	udivcc 	%r8, %r9, %r6
	.word 0xc8f22ef8  ! 1625: STXA_I	stxa	%r4, [%r8 + 0x0ef8] %asi
	.word 0x3e800001  ! 1626: BVC	bvc,a	<label_0x1>
	.word 0xc4220009  ! 1628: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xcc0a0009  ! 1628: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0x864a0009  ! 1629: MULX_R	mulx 	%r8, %r9, %r3
	.word 0xccf21009  ! 1630: STXA_R	stxa	%r6, [%r8 + %r9] 0x80
	.word 0xc3ea1009  ! 1631: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xf4b21009  ! 1632: STHA_R	stha	%r26, [%r8 + %r9] 0x80
	.word 0xc3ea1009  ! 1633: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xb052285c  ! 1634: UMUL_I	umul 	%r8, 0x085c, %r24
	.word 0x88720009  ! 1635: UDIV_R	udiv 	%r8, %r9, %r4
	.word 0xc6b21009  ! 1636: STHA_R	stha	%r3, [%r8 + %r9] 0x80
	.word 0xc42a0009  ! 1638: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xf8420009  ! 1638: LDSW_R	ldsw	[%r8 + %r9], %r28
	.word 0xc36a2ac4  ! 1639: PREFETCH_I	prefetch	[%r8 + 0x0ac4], #one_read
	.word 0xcd1a0009  ! 1640: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xf22a0009  ! 1642: STB_R	stb	%r25, [%r8 + %r9]
	.word 0xc8020009  ! 1642: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0x8143c000  ! 1643: STBAR	stbar
	.word 0x8143c000  ! 1644: STBAR	stbar
	.word 0xce220009  ! 1646: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xe4420009  ! 1646: LDSW_R	ldsw	[%r8 + %r9], %r18
	.word 0x9ed224c4  ! 1647: UMULcc_I	umulcc 	%r8, 0x04c4, %r15
	.word 0xd6220009  ! 1649: STW_R	stw	%r11, [%r8 + %r9]
	.word 0xc8120009  ! 1649: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0x8ba209a9  ! 1650: FDIVs	fdivs	%f8, %f9, %f5
	.word 0xf4aa1009  ! 1651: STBA_R	stba	%r26, [%r8 + %r9] 0x80
	.word 0xc52227e4  ! 1652: STF_I	st	%f2, [0x07e4, %r8]
	.word 0xc9020009  ! 1653: LDF_R	ld	[%r8, %r9], %f4
	.word 0xec821009  ! 1654: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r22
	.word 0x08800001  ! 1655: BLEU	bleu  	<label_0x1>
	.word 0x82520009  ! 1656: UMUL_R	umul 	%r8, %r9, %r1
	.word 0xc27a0009  ! 1657: SWAP_R	swap	%r1, [%r8 + %r9]
	.word 0xc9f21009  ! 1658: CASXA_I	casxa	[%r8] 0x80, %r9, %r4
	.word 0xee022c0c  ! 1659: LDUW_I	lduw	[%r8 + 0x0c0c], %r23
	.word 0x26c20001  ! 1660: BRLZ	brlz,a,nt	%8,<label_0x20001>
	.word 0x8af2272c  ! 1661: UDIVcc_I	udivcc 	%r8, 0x072c, %r5
	.word 0x0cc20001  ! 1662: BRGZ	brgz  ,nt	%8,<label_0x20001>
	.word 0xc5222424  ! 1663: STF_I	st	%f2, [0x0424, %r8]
	.word 0xc6b21009  ! 1664: STHA_R	stha	%r3, [%r8 + %r9] 0x80
	.word 0x86d20009  ! 1665: UMULcc_R	umulcc 	%r8, %r9, %r3
	.word 0xc36a0009  ! 1666: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0x885a0009  ! 1667: SMUL_R	smul 	%r8, %r9, %r4
	.word 0x826a2358  ! 1668: UDIVX_I	udivx 	%r8, 0x0358, %r1
	.word 0x8143e034  ! 1669: MEMBAR	membar	#LoadStore | #Lookaside | #MemIssue 
	.word 0xe0f21009  ! 1670: STXA_R	stxa	%r16, [%r8 + %r9] 0x80
	.word 0xb36a2010  ! 1671: SDIVX_I	sdivx	%r8, 0x0010, %r25
	.word 0x8e7a0009  ! 1672: SDIV_R	sdiv 	%r8, %r9, %r7
	.word 0xcd222d88  ! 1673: STF_I	st	%f6, [0x0d88, %r8]
	.word 0x827224e8  ! 1674: UDIV_I	udiv 	%r8, 0x04e8, %r1
	.word 0xc4720009  ! 1676: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xdc520009  ! 1676: LDSH_R	ldsh	[%r8 + %r9], %r14
	.word 0xee6a0009  ! 1677: LDSTUB_R	ldstub	%r23, [%r8 + %r9]
	.word 0x2cca0001  ! 1678: BRGZ	brgz,a,pt	%8,<label_0xa0001>
	.word 0xcf220009  ! 1680: STF_R	st	%f7, [%r9, %r8]
	.word 0xca720009  ! 1681: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xe0020009  ! 1681: LDUW_R	lduw	[%r8 + %r9], %r16
	.word 0xc7220009  ! 1683: STF_R	st	%f3, [%r9, %r8]
	.word 0xc2720009  ! 1684: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc4520009  ! 1684: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xc36a0009  ! 1685: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0x0a800002  ! 1686: BCS	bcs  	<label_0x2>
	.word 0xfa5a0009  ! 1687: LDX_R	ldx	[%r8 + %r9], %r29
	.word 0xc20227b8  ! 1688: LDUW_I	lduw	[%r8 + 0x07b8], %r1
	.word 0x88d20009  ! 1689: UMULcc_R	umulcc 	%r8, %r9, %r4
	.word 0x36800001  ! 1690: BGE	bge,a	<label_0x1>
	.word 0x97a20929  ! 1691: FMULs	fmuls	%f8, %f9, %f11
	.word 0x82da0009  ! 1692: SMULcc_R	smulcc 	%r8, %r9, %r1
	.word 0xc8220009  ! 1694: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc64a0009  ! 1694: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xc2ca1009  ! 1695: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r1
	.word 0x82fa0009  ! 1696: SDIVcc_R	sdivcc 	%r8, %r9, %r1
	.word 0xcf3a2db8  ! 1697: STDF_I	std	%f7, [0x0db8, %r8]
	.word 0xc3ea1009  ! 1698: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xef3a2610  ! 1699: STDF_I	std	%f23, [0x0610, %r8]
	.word 0xce8a1009  ! 1700: LDUBA_R	lduba	[%r8, %r9] 0x80, %r7
	.word 0xa2d20009  ! 1701: UMULcc_R	umulcc 	%r8, %r9, %r17
	.word 0x887a29d4  ! 1702: SDIV_I	sdiv 	%r8, 0x09d4, %r4
	.word 0xc3ea1009  ! 1703: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x84d22b68  ! 1704: UMULcc_I	umulcc 	%r8, 0x0b68, %r2
	.word 0xe2c223b8  ! 1705: LDSWA_I	ldswa	[%r8, + 0x03b8] %asi, %r17
	.word 0xc322207c  ! 1706: STF_I	st	%f1, [0x007c, %r8]
	.word 0x8143e03d  ! 1707: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0x8143e031  ! 1708: MEMBAR	membar	#LoadLoad | #Lookaside | #MemIssue 
	.word 0xc8ba2b10  ! 1709: STDA_I	stda	%r4, [%r8 + 0x0b10] %asi
	.word 0xc7e22009  ! 1710: CASA_R	casa	[%r8] %asi, %r9, %r3
	.word 0x89a208a9  ! 1711: FSUBs	fsubs	%f8, %f9, %f4
	.word 0xce220009  ! 1713: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc8420009  ! 1713: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xccda1009  ! 1714: LDXA_R	ldxa	[%r8, %r9] 0x80, %r6
	.word 0xc67a0009  ! 1715: SWAP_R	swap	%r3, [%r8 + %r9]
	.word 0xcc8a1009  ! 1716: LDUBA_R	lduba	[%r8, %r9] 0x80, %r6
	.word 0x40000002  ! 1717: CALL	call	disp30_2
	.word 0xc45a0009  ! 1718: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xca120009  ! 1719: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xc8ca1009  ! 1720: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r4
	.word 0x8143e00f  ! 1721: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore 
	.word 0x89a208a9  ! 1722: FSUBs	fsubs	%f8, %f9, %f4
	.word 0xc01a23d8  ! 1723: LDD_I	ldd	[%r8 + 0x03d8], %r0
	.word 0xc64a0009  ! 1724: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xc42a0009  ! 1726: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc7020009  ! 1726: LDF_R	ld	[%r8, %r9], %f3
	.word 0xa27a0009  ! 1727: SDIV_R	sdiv 	%r8, %r9, %r17
	.word 0xce7a26c8  ! 1728: SWAP_I	swap	%r7, [%r8 + 0x06c8]
	.word 0x8143c000  ! 1729: STBAR	stbar
	.word 0x04800002  ! 1730: BLE	ble  	<label_0x2>
	.word 0xce2a0009  ! 1732: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xf6120009  ! 1732: LDUH_R	lduh	[%r8 + %r9], %r27
	.word 0xf41a0009  ! 1733: LDD_R	ldd	[%r8 + %r9], %r26
	.word 0xc6c21009  ! 1734: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r3
	.word 0xc31a0009  ! 1735: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xeac2229c  ! 1736: LDSWA_I	ldswa	[%r8, + 0x029c] %asi, %r21
	.word 0x8cda0009  ! 1737: SMULcc_R	smulcc 	%r8, %r9, %r6
	.word 0x8eda0009  ! 1738: SMULcc_R	smulcc 	%r8, %r9, %r7
	.word 0xcad22bb0  ! 1739: LDSHA_I	ldsha	[%r8, + 0x0bb0] %asi, %r5
	.word 0xaba20829  ! 1740: FADDs	fadds	%f8, %f9, %f21
	.word 0xe28a23d0  ! 1741: LDUBA_I	lduba	[%r8, + 0x03d0] %asi, %r17
	.word 0xc73a0009  ! 1743: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc8720009  ! 1744: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc71a0009  ! 1744: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xaafa0009  ! 1745: SDIVcc_R	sdivcc 	%r8, %r9, %r21
	.word 0xaa722600  ! 1746: UDIV_I	udiv 	%r8, 0x0600, %r21
	.word 0x82f220bc  ! 1747: UDIVcc_I	udivcc 	%r8, 0x00bc, %r1
	.word 0xe8ba2178  ! 1748: STDA_I	stda	%r20, [%r8 + 0x0178] %asi
	.word 0xc36a0009  ! 1749: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0x02800001  ! 1750: BE	be  	<label_0x1>
	.word 0xc6220009  ! 1752: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xd8520009  ! 1752: LDSH_R	ldsh	[%r8 + %r9], %r12
	.word 0xd6f21009  ! 1753: STXA_R	stxa	%r11, [%r8 + %r9] 0x80
	.word 0x0a800002  ! 1754: BCS	bcs  	<label_0x2>
	.word 0xfc4a0009  ! 1755: LDSB_R	ldsb	[%r8 + %r9], %r30
	.word 0x865a2edc  ! 1756: SMUL_I	smul 	%r8, 0x0edc, %r3
	.word 0xc41a0009  ! 1757: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xe6320009  ! 1759: STH_R	sth	%r19, [%r8 + %r9]
	.word 0xcb020009  ! 1759: LDF_R	ld	[%r8, %r9], %f5
	.word 0xc32224e8  ! 1760: STF_I	st	%f1, [0x04e8, %r8]
	.word 0xde922b68  ! 1761: LDUHA_I	lduha	[%r8, + 0x0b68] %asi, %r15
	.word 0xc33a29d0  ! 1762: STDF_I	std	%f1, [0x09d0, %r8]
	.word 0xf0f21009  ! 1763: STXA_R	stxa	%r24, [%r8 + %r9] 0x80
	.word 0xc3ea1009  ! 1764: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x856a0009  ! 1765: SDIVX_R	sdivx	%r8, %r9, %r2
	.word 0xee921009  ! 1766: LDUHA_R	lduha	[%r8, %r9] 0x80, %r23
	.word 0xc26a0009  ! 1767: LDSTUB_R	ldstub	%r1, [%r8 + %r9]
	.word 0xa0fa2158  ! 1768: SDIVcc_I	sdivcc 	%r8, 0x0158, %r16
	.word 0xc7e21009  ! 1769: CASA_I	casa	[%r8] 0x80, %r9, %r3
	.word 0x8143e064  ! 1770: MEMBAR	membar	#LoadStore | #MemIssue | #Sync 
	.word 0xc62a0009  ! 1772: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xcc420009  ! 1772: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0x02ca0001  ! 1773: BRZ	brz  ,pt	%8,<label_0xa0001>
	.word 0xcf3a0009  ! 1775: STDF_R	std	%f7, [%r9, %r8]
	.word 0xf4720009  ! 1776: STX_R	stx	%r26, [%r8 + %r9]
	.word 0xce4a0009  ! 1776: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xe2ea2f04  ! 1777: LDSTUBA_I	ldstuba	%r17, [%r8 + 0x0f04] %asi
	.word 0xc36a0009  ! 1778: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xcc320009  ! 1780: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc24a0009  ! 1780: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xc8fa2160  ! 1781: SWAPA_I	swapa	%r4, [%r8 + 0x0160] %asi
	.word 0xc36a2bec  ! 1782: PREFETCH_I	prefetch	[%r8 + 0x0bec], #one_read
	.word 0x865a2698  ! 1783: SMUL_I	smul 	%r8, 0x0698, %r3
	.word 0x8143c000  ! 1784: STBAR	stbar
	.word 0xc3ea1009  ! 1785: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xef220009  ! 1787: STF_R	st	%f23, [%r9, %r8]
	.word 0xc4720009  ! 1788: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xcb020009  ! 1788: LDF_R	ld	[%r8, %r9], %f5
	.word 0xc5220009  ! 1790: STF_R	st	%f2, [%r9, %r8]
	.word 0xc8720009  ! 1791: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc25a0009  ! 1791: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xc4ba2a18  ! 1792: STDA_I	stda	%r2, [%r8 + 0x0a18] %asi
	.word 0xc4821009  ! 1793: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r2
	.word 0x89a20829  ! 1794: FADDs	fadds	%f8, %f9, %f4
	.word 0x8143e06b  ! 1795: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #MemIssue | #Sync 
	.word 0xc33a22c8  ! 1796: STDF_I	std	%f1, [0x02c8, %r8]
	.word 0xc8320009  ! 1798: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xce020009  ! 1798: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xcc2a0009  ! 1800: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xce020009  ! 1800: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xc46a25d8  ! 1801: LDSTUB_I	ldstub	%r2, [%r8 + 0x05d8]
	.word 0xc60a2744  ! 1802: LDUB_I	ldub	[%r8 + 0x0744], %r3
	.word 0xe22a0009  ! 1804: STB_R	stb	%r17, [%r8 + %r9]
	.word 0xce5a0009  ! 1804: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xd85a2060  ! 1805: LDX_I	ldx	[%r8 + 0x0060], %r12
	.word 0xc7f21009  ! 1806: CASXA_I	casxa	[%r8] 0x80, %r9, %r3
	.word 0xca320009  ! 1808: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xe2120009  ! 1808: LDUH_R	lduh	[%r8 + %r9], %r17
	.word 0xcb3a2350  ! 1809: STDF_I	std	%f5, [0x0350, %r8]
	.word 0xc2b22908  ! 1810: STHA_I	stha	%r1, [%r8 + 0x0908] %asi
	.word 0xde2a0009  ! 1812: STB_R	stb	%r15, [%r8 + %r9]
	.word 0xc41a0009  ! 1812: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xf0020009  ! 1813: LDUW_R	lduw	[%r8 + %r9], %r24
	.word 0x8a722e04  ! 1814: UDIV_I	udiv 	%r8, 0x0e04, %r5
	.word 0xceea1009  ! 1815: LDSTUBA_R	ldstuba	%r7, [%r8 + %r9] 0x80
	.word 0x8b220009  ! 1816: MULScc_R	mulscc 	%r8, %r9, %r5
	.word 0xc8220009  ! 1818: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xcc0a0009  ! 1818: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0x86722ff0  ! 1819: UDIV_I	udiv 	%r8, 0x0ff0, %r3
	.word 0xc4c22f10  ! 1820: LDSWA_I	ldswa	[%r8, + 0x0f10] %asi, %r2
	.word 0xcc4a0009  ! 1821: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xc46a2ec4  ! 1822: LDSTUB_I	ldstub	%r2, [%r8 + 0x0ec4]
	.word 0xc6f22b50  ! 1823: STXA_I	stxa	%r3, [%r8 + 0x0b50] %asi
	.word 0x84fa0009  ! 1824: SDIVcc_R	sdivcc 	%r8, %r9, %r2
	.word 0xccd2249c  ! 1825: LDSHA_I	ldsha	[%r8, + 0x049c] %asi, %r6
	.word 0xc3ea1009  ! 1826: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc4fa2b58  ! 1827: SWAPA_I	swapa	%r2, [%r8 + 0x0b58] %asi
	.word 0x8c5220a0  ! 1828: UMUL_I	umul 	%r8, 0x00a0, %r6
	.word 0xc3ea1009  ! 1829: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc22a0009  ! 1831: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xda5a0009  ! 1831: LDX_R	ldx	[%r8 + %r9], %r13
	.word 0x825a0009  ! 1832: SMUL_R	smul 	%r8, %r9, %r1
	.word 0x8a6a0009  ! 1833: UDIVX_R	udivx 	%r8, %r9, %r5
	.word 0x83a20829  ! 1834: FADDs	fadds	%f8, %f9, %f1
	.word 0xe0220009  ! 1836: STW_R	stw	%r16, [%r8 + %r9]
	.word 0xcc120009  ! 1836: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xdcaa27e4  ! 1837: STBA_I	stba	%r14, [%r8 + 0x07e4] %asi
	.word 0xec2a0009  ! 1839: STB_R	stb	%r22, [%r8 + %r9]
	.word 0xc64a0009  ! 1839: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0x8143c000  ! 1840: STBAR	stbar
	.word 0xecba2728  ! 1841: STDA_I	stda	%r22, [%r8 + 0x0728] %asi
	.word 0xe8da27a8  ! 1842: LDXA_I	ldxa	[%r8, + 0x07a8] %asi, %r20
	.word 0xce220009  ! 1844: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xfb1a0009  ! 1844: LDDF_R	ldd	[%r8, %r9], %f29
	.word 0xc5e21009  ! 1845: CASA_I	casa	[%r8] 0x80, %r9, %r2
	.word 0x83a20929  ! 1846: FMULs	fmuls	%f8, %f9, %f1
	.word 0x8143c000  ! 1847: STBAR	stbar
	.word 0xa9222978  ! 1848: MULScc_I	mulscc 	%r8, 0x0978, %r20
	.word 0xcb222fbc  ! 1849: STF_I	st	%f5, [0x0fbc, %r8]
	.word 0xcd3a0009  ! 1851: STDF_R	std	%f6, [%r9, %r8]
	.word 0xca720009  ! 1852: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc4020009  ! 1852: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0x88520009  ! 1853: UMUL_R	umul 	%r8, %r9, %r4
	.word 0xc6921009  ! 1854: LDUHA_R	lduha	[%r8, %r9] 0x80, %r3
	.word 0xea922778  ! 1855: LDUHA_I	lduha	[%r8, + 0x0778] %asi, %r21
	.word 0xea6a2c48  ! 1856: LDSTUB_I	ldstub	%r21, [%r8 + 0x0c48]
	.word 0xc6c21009  ! 1857: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r3
	.word 0x26800001  ! 1858: BL	bl,a	<label_0x1>
	.word 0x9ba20829  ! 1859: FADDs	fadds	%f8, %f9, %f13
	.word 0xcab21009  ! 1860: STHA_R	stha	%r5, [%r8 + %r9] 0x80
	.word 0xbada2fd0  ! 1861: SMULcc_I	smulcc 	%r8, 0x0fd0, %r29
	.word 0xd73a0009  ! 1863: STDF_R	std	%f11, [%r9, %r8]
	.word 0xe8720009  ! 1864: STX_R	stx	%r20, [%r8 + %r9]
	.word 0xf41a0009  ! 1864: LDD_R	ldd	[%r8 + %r9], %r26
	.word 0xcc7a0009  ! 1865: SWAP_R	swap	%r6, [%r8 + %r9]
	.word 0xc36a0009  ! 1866: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc6ea2fe8  ! 1867: LDSTUBA_I	ldstuba	%r3, [%r8 + 0x0fe8] %asi
	.word 0xc3ea1009  ! 1868: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x84fa2e34  ! 1869: SDIVcc_I	sdivcc 	%r8, 0x0e34, %r2
	.word 0x8143e01c  ! 1870: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside 
	.word 0xc33a2d58  ! 1871: STDF_I	std	%f1, [0x0d58, %r8]
	.word 0x826a2fb0  ! 1872: UDIVX_I	udivx 	%r8, 0x0fb0, %r1
	.word 0x8143c000  ! 1873: STBAR	stbar
	.word 0xac4a2de8  ! 1874: MULX_I	mulx 	%r8, 0x0de8, %r22
	.word 0x8143e003  ! 1875: MEMBAR	membar	#LoadLoad | #StoreLoad 
	.word 0xdb3a2d80  ! 1876: STDF_I	std	%f13, [0x0d80, %r8]
	.word 0xfe0a0009  ! 1877: LDUB_R	ldub	[%r8 + %r9], %r31
	.word 0xc93a2270  ! 1878: STDF_I	std	%f4, [0x0270, %r8]
	.word 0xc73a0009  ! 1880: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc2720009  ! 1881: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc84a0009  ! 1881: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0x8afa2168  ! 1882: SDIVcc_I	sdivcc 	%r8, 0x0168, %r5
	.word 0xc49a2518  ! 1883: LDDA_I	ldda	[%r8, + 0x0518] %asi, %r2
	.word 0xc53a0009  ! 1885: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc4720009  ! 1886: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xf6420009  ! 1886: LDSW_R	ldsw	[%r8 + %r9], %r27
	.word 0x8143e050  ! 1887: MEMBAR	membar	#Lookaside | #Sync 
	.word 0x8143c000  ! 1888: STBAR	stbar
	.word 0xe6320009  ! 1890: STH_R	sth	%r19, [%r8 + %r9]
	.word 0xc9020009  ! 1890: LDF_R	ld	[%r8, %r9], %f4
	.word 0xcf222198  ! 1891: STF_I	st	%f7, [0x0198, %r8]
	.word 0xc36a2460  ! 1892: PREFETCH_I	prefetch	[%r8 + 0x0460], #one_read
	.word 0x8143e075  ! 1893: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside | #MemIssue | #Sync 
	.word 0xc3ea1009  ! 1894: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x847a2a04  ! 1895: SDIV_I	sdiv 	%r8, 0x0a04, %r2
	.word 0x8143e01d  ! 1896: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside 
	.word 0xf6da29b8  ! 1897: LDXA_I	ldxa	[%r8, + 0x09b8] %asi, %r27
	.word 0x8da209a9  ! 1898: FDIVs	fdivs	%f8, %f9, %f6
	.word 0xc4ba1009  ! 1899: STDA_R	stda	%r2, [%r8 + %r9] 0x80
	.word 0xc8520009  ! 1900: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0x2a800002  ! 1901: BCS	bcs,a	<label_0x2>
	.word 0xc36a0009  ! 1902: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xca220009  ! 1904: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xcf020009  ! 1904: LDF_R	ld	[%r8, %r9], %f7
	.word 0x8a720009  ! 1905: UDIV_R	udiv 	%r8, %r9, %r5
	.word 0xc2320009  ! 1907: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc84a0009  ! 1907: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xc36a0009  ! 1908: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0x8a4a0009  ! 1909: MULX_R	mulx 	%r8, %r9, %r5
	.word 0xbefa2484  ! 1910: SDIVcc_I	sdivcc 	%r8, 0x0484, %r31
	.word 0x846a0009  ! 1911: UDIVX_R	udivx 	%r8, %r9, %r2
	.word 0xcc1a2868  ! 1912: LDD_I	ldd	[%r8 + 0x0868], %r6
	.word 0xc3ea1009  ! 1913: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x8143e06e  ! 1914: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #MemIssue | #Sync 
	.word 0xcd3a2230  ! 1915: STDF_I	std	%f6, [0x0230, %r8]
	.word 0x85a20829  ! 1916: FADDs	fadds	%f8, %f9, %f2
	.word 0xcf222e4c  ! 1917: STF_I	st	%f7, [0x0e4c, %r8]
	.word 0x8a4a2000  ! 1918: MULX_I	mulx 	%r8, 0x0000, %r5
	.word 0x06800002  ! 1919: BL	bl  	<label_0x2>
	.word 0x8f6a2ee4  ! 1920: SDIVX_I	sdivx	%r8, 0x0ee4, %r7
	.word 0x867a0009  ! 1921: SDIV_R	sdiv 	%r8, %r9, %r3
	.word 0xc8d21009  ! 1922: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r4
	.word 0x8c5a0009  ! 1923: SMUL_R	smul 	%r8, %r9, %r6
	.word 0x885a2350  ! 1924: SMUL_I	smul 	%r8, 0x0350, %r4
	.word 0x865a0009  ! 1925: SMUL_R	smul 	%r8, %r9, %r3
	.word 0xcaa21009  ! 1926: STWA_R	stwa	%r5, [%r8 + %r9] 0x80
	.word 0x24800001  ! 1927: BLE	ble,a	<label_0x1>
	.word 0xe4b22584  ! 1928: STHA_I	stha	%r18, [%r8 + 0x0584] %asi
	.word 0xcafa2134  ! 1929: SWAPA_I	swapa	%r5, [%r8 + 0x0134] %asi
	.word 0xca122f98  ! 1930: LDUH_I	lduh	[%r8 + 0x0f98], %r5
	.word 0xc89a1009  ! 1931: LDDA_R	ldda	[%r8, %r9] 0x80, %r4
	.word 0x82720009  ! 1932: UDIV_R	udiv 	%r8, %r9, %r1
	.word 0x82fa2ee8  ! 1933: SDIVcc_I	sdivcc 	%r8, 0x0ee8, %r1
	.word 0x8143c000  ! 1934: STBAR	stbar
	.word 0xfe4a2d9c  ! 1935: LDSB_I	ldsb	[%r8 + 0x0d9c], %r31
	.word 0x8a4a0009  ! 1936: MULX_R	mulx 	%r8, %r9, %r5
	.word 0xf2320009  ! 1938: STH_R	sth	%r25, [%r8 + %r9]
	.word 0xc2520009  ! 1938: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xcb3a2a68  ! 1939: STDF_I	std	%f5, [0x0a68, %r8]
	.word 0xc36a2e70  ! 1940: PREFETCH_I	prefetch	[%r8 + 0x0e70], #one_read
	.word 0xced22c08  ! 1941: LDSHA_I	ldsha	[%r8, + 0x0c08] %asi, %r7
	.word 0xd82a0009  ! 1943: STB_R	stb	%r12, [%r8 + %r9]
	.word 0xcc0a0009  ! 1943: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0x8fa20829  ! 1944: FADDs	fadds	%f8, %f9, %f7
	.word 0x8e6a0009  ! 1945: UDIVX_R	udivx 	%r8, %r9, %r7
	.word 0xc8220009  ! 1947: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xf8120009  ! 1947: LDUH_R	lduh	[%r8 + %r9], %r28
	.word 0xe2ca1009  ! 1948: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r17
	.word 0xbad22ac4  ! 1949: UMULcc_I	umulcc 	%r8, 0x0ac4, %r29
	.word 0x0eca0001  ! 1950: BRGEZ	brgez  ,pt	%8,<label_0xa0001>
	.word 0xc3ea1009  ! 1951: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xcf3a23e8  ! 1952: STDF_I	std	%f7, [0x03e8, %r8]
	.word 0xf8220009  ! 1954: STW_R	stw	%r28, [%r8 + %r9]
	.word 0xda5a0009  ! 1954: LDX_R	ldx	[%r8 + %r9], %r13
	.word 0xce2a0009  ! 1956: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc2120009  ! 1956: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xca520009  ! 1957: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0x8143e03b  ! 1958: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Lookaside | #MemIssue 
	.word 0xc36a2ad0  ! 1959: PREFETCH_I	prefetch	[%r8 + 0x0ad0], #one_read
	.word 0xe4ea2fc8  ! 1960: LDSTUBA_I	ldstuba	%r18, [%r8 + 0x0fc8] %asi
	.word 0xeada1009  ! 1961: LDXA_R	ldxa	[%r8, %r9] 0x80, %r21
	.word 0xfd222524  ! 1962: STF_I	st	%f30, [0x0524, %r8]
	.word 0x2e800002  ! 1963: BVS	bvs,a	<label_0x2>
	.word 0xc3ea1009  ! 1964: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc6220009  ! 1966: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xcc0a0009  ! 1966: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xe33a23a0  ! 1967: STDF_I	std	%f17, [0x03a0, %r8]
	.word 0x8da208a9  ! 1968: FSUBs	fsubs	%f8, %f9, %f6
	.word 0xeeea2910  ! 1969: LDSTUBA_I	ldstuba	%r23, [%r8 + 0x0910] %asi
	.word 0xccba2418  ! 1970: STDA_I	stda	%r6, [%r8 + 0x0418] %asi
	.word 0xc67a0009  ! 1971: SWAP_R	swap	%r3, [%r8 + %r9]
	.word 0xc3222980  ! 1972: STF_I	st	%f1, [0x0980, %r8]
	.word 0x97a20829  ! 1973: FADDs	fadds	%f8, %f9, %f11
	.word 0xc36a24ac  ! 1974: PREFETCH_I	prefetch	[%r8 + 0x04ac], #one_read
	.word 0xf0320009  ! 1976: STH_R	sth	%r24, [%r8 + %r9]
	.word 0xc41a0009  ! 1976: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xcb222660  ! 1977: STF_I	st	%f5, [0x0660, %r8]
	.word 0xc40a24f0  ! 1978: LDUB_I	ldub	[%r8 + 0x04f0], %r2
	.word 0x9f220009  ! 1979: MULScc_R	mulscc 	%r8, %r9, %r15
	.word 0xda320009  ! 1981: STH_R	sth	%r13, [%r8 + %r9]
	.word 0xda420009  ! 1981: LDSW_R	ldsw	[%r8 + %r9], %r13
	.word 0x8f6a2820  ! 1982: SDIVX_I	sdivx	%r8, 0x0820, %r7
	.word 0xc82a0009  ! 1984: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xca520009  ! 1984: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0x8143e050  ! 1985: MEMBAR	membar	#Lookaside | #Sync 
	.word 0xc36a0009  ! 1986: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc6ca1009  ! 1987: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r3
	.word 0x8143c000  ! 1988: STBAR	stbar
	.word 0xf4f21009  ! 1989: STXA_R	stxa	%r26, [%r8 + %r9] 0x80
	.word 0xc6020009  ! 1990: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0x0cca0001  ! 1991: BRGZ	brgz  ,pt	%8,<label_0xa0001>
	.word 0xc48a20cc  ! 1992: LDUBA_I	lduba	[%r8, + 0x00cc] %asi, %r2
	.word 0x99a20829  ! 1993: FADDs	fadds	%f8, %f9, %f12
	.word 0xca922e68  ! 1994: LDUHA_I	lduha	[%r8, + 0x0e68] %asi, %r5
	.word 0xef22244c  ! 1995: STF_I	st	%f23, [0x044c, %r8]
	.word 0xd6220009  ! 1997: STW_R	stw	%r11, [%r8 + %r9]
	.word 0xcb020009  ! 1997: LDF_R	ld	[%r8, %r9], %f5
	.word 0x8252235c  ! 1998: UMUL_I	umul 	%r8, 0x035c, %r1
	.word 0xc36a0009  ! 1999: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc4f225e0  ! 2000: STXA_I	stxa	%r2, [%r8 + 0x05e0] %asi
	.word 0x83a20929  ! 2001: FMULs	fmuls	%f8, %f9, %f1
	.word 0x8143c000  ! 2002: STBAR	stbar
	.word 0xe4ba1009  ! 2003: STDA_R	stda	%r18, [%r8 + %r9] 0x80
	.word 0xb1a20929  ! 2004: FMULs	fmuls	%f8, %f9, %f24
	.word 0xca220009  ! 2006: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xdc4a0009  ! 2006: LDSB_R	ldsb	[%r8 + %r9], %r14
	.word 0xc2da2fe0  ! 2007: LDXA_I	ldxa	[%r8, + 0x0fe0] %asi, %r1
	.word 0xe402256c  ! 2008: LDUW_I	lduw	[%r8 + 0x056c], %r18
	.word 0xc36a0009  ! 2009: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xcef21009  ! 2010: STXA_R	stxa	%r7, [%r8 + %r9] 0x80
	.word 0xdc220009  ! 2012: STW_R	stw	%r14, [%r8 + %r9]
	.word 0xd6420009  ! 2012: LDSW_R	ldsw	[%r8 + %r9], %r11
	.word 0xfab21009  ! 2013: STHA_R	stha	%r29, [%r8 + %r9] 0x80
	.word 0xacd20009  ! 2014: UMULcc_R	umulcc 	%r8, %r9, %r22
	.word 0xca821009  ! 2015: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r5
	.word 0xcc320009  ! 2017: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xca0a0009  ! 2017: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xca2a0009  ! 2019: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xcf1a0009  ! 2019: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xf22a0009  ! 2021: STB_R	stb	%r25, [%r8 + %r9]
	.word 0xc8520009  ! 2021: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0x40000001  ! 2022: CALL	call	disp30_1
	.word 0xc36a0009  ! 2023: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xb5a209a9  ! 2024: FDIVs	fdivs	%f8, %f9, %f26
	.word 0xee720009  ! 2026: STX_R	stx	%r23, [%r8 + %r9]
	.word 0xcf020009  ! 2026: LDF_R	ld	[%r8, %r9], %f7
	.word 0xf8a22824  ! 2027: STWA_I	stwa	%r28, [%r8 + 0x0824] %asi
	.word 0xc4ea2304  ! 2028: LDSTUBA_I	ldstuba	%r2, [%r8 + 0x0304] %asi
	.word 0x04ca0001  ! 2029: BRLEZ	brlez  ,pt	%8,<label_0xa0001>
	.word 0xc42a0009  ! 2031: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc44a0009  ! 2031: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xd6ea2394  ! 2032: LDSTUBA_I	ldstuba	%r11, [%r8 + 0x0394] %asi
	.word 0xc36a0009  ! 2033: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xce8a29f4  ! 2034: LDUBA_I	lduba	[%r8, + 0x09f4] %asi, %r7
	.word 0xc6320009  ! 2036: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc2420009  ! 2036: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xccf21009  ! 2037: STXA_R	stxa	%r6, [%r8 + %r9] 0x80
	.word 0xbeda0009  ! 2038: SMULcc_R	smulcc 	%r8, %r9, %r31
	.word 0xc53a27a0  ! 2039: STDF_I	std	%f2, [0x07a0, %r8]
	.word 0x8fa20929  ! 2040: FMULs	fmuls	%f8, %f9, %f7
	.word 0xc6220009  ! 2042: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xcd1a0009  ! 2042: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xc3ea22a0  ! 2043: PREFETCHA_I	prefetcha	[%r8, + 0x02a0] %asi, #one_read
	.word 0xc2fa1009  ! 2044: SWAPA_R	swapa	%r1, [%r8 + %r9] 0x80
	.word 0x8e4a0009  ! 2045: MULX_R	mulx 	%r8, %r9, %r7
	.word 0xc6a22e8c  ! 2046: STWA_I	stwa	%r3, [%r8 + 0x0e8c] %asi
	.word 0x82da2a94  ! 2047: SMULcc_I	smulcc 	%r8, 0x0a94, %r1
	.word 0xfd220009  ! 2049: STF_R	st	%f30, [%r9, %r8]
	.word 0xe0720009  ! 2050: STX_R	stx	%r16, [%r8 + %r9]
	.word 0xca5a0009  ! 2050: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xc28a26b8  ! 2051: LDUBA_I	lduba	[%r8, + 0x06b8] %asi, %r1
	.word 0x8143c000  ! 2052: STBAR	stbar
	.word 0xa16a0009  ! 2053: SDIVX_R	sdivx	%r8, %r9, %r16
	.word 0xc2220009  ! 2055: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xcc4a0009  ! 2055: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xff3a2338  ! 2056: STDF_I	std	%f31, [0x0338, %r8]
	.word 0xf41a2038  ! 2057: LDD_I	ldd	[%r8 + 0x0038], %r26
	.word 0x34800001  ! 2058: BG	bg,a	<label_0x1>
	.word 0xc36a2798  ! 2059: PREFETCH_I	prefetch	[%r8 + 0x0798], #one_read
	.word 0xc89227d0  ! 2060: LDUHA_I	lduha	[%r8, + 0x07d0] %asi, %r4
	.word 0x896a250c  ! 2061: SDIVX_I	sdivx	%r8, 0x050c, %r4
	.word 0xc26a0009  ! 2062: LDSTUB_R	ldstub	%r1, [%r8 + %r9]
	.word 0xa76a28b8  ! 2063: SDIVX_I	sdivx	%r8, 0x08b8, %r19
	.word 0x1e800002  ! 2064: BVC	bvc  	<label_0x2>
	.word 0xe0aa1009  ! 2065: STBA_R	stba	%r16, [%r8 + %r9] 0x80
	.word 0xf0b22a88  ! 2066: STHA_I	stha	%r24, [%r8 + 0x0a88] %asi
	.word 0xc4220009  ! 2068: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc60a0009  ! 2068: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xbe4a0009  ! 2069: MULX_R	mulx 	%r8, %r9, %r31
	.word 0xc89a2118  ! 2070: LDDA_I	ldda	[%r8, + 0x0118] %asi, %r4
	.word 0xba720009  ! 2071: UDIV_R	udiv 	%r8, %r9, %r29
	.word 0xe28224bc  ! 2072: LDUWA_I	lduwa	[%r8, + 0x04bc] %asi, %r17
	.word 0xcc320009  ! 2074: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xcc020009  ! 2074: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xb45a0009  ! 2075: SMUL_R	smul 	%r8, %r9, %r26
	.word 0xc22a0009  ! 2077: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc8520009  ! 2077: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0x8143e059  ! 2078: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside | #Sync 
	.word 0xffe22009  ! 2079: CASA_R	casa	[%r8] %asi, %r9, %r31
	.word 0xcc7a2b98  ! 2080: SWAP_I	swap	%r6, [%r8 + 0x0b98]
	.word 0xc62a0009  ! 2082: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xce020009  ! 2082: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xce522c6c  ! 2083: LDSH_I	ldsh	[%r8 + 0x0c6c], %r7
	.word 0xb0fa2010  ! 2084: SDIVcc_I	sdivcc 	%r8, 0x0010, %r24
	.word 0x8c7a2ccc  ! 2085: SDIV_I	sdiv 	%r8, 0x0ccc, %r6
	.word 0xd6320009  ! 2087: STH_R	sth	%r11, [%r8 + %r9]
	.word 0xfa4a0009  ! 2087: LDSB_R	ldsb	[%r8 + %r9], %r29
	.word 0xc5f21009  ! 2088: CASXA_I	casxa	[%r8] 0x80, %r9, %r2
	.word 0x8e720009  ! 2089: UDIV_R	udiv 	%r8, %r9, %r7
	.word 0x8143c000  ! 2090: STBAR	stbar
	.word 0xe3222218  ! 2091: STF_I	st	%f17, [0x0218, %r8]
	.word 0xf3e22009  ! 2092: CASA_R	casa	[%r8] %asi, %r9, %r25
	.word 0xcaf22ef0  ! 2093: STXA_I	stxa	%r5, [%r8 + 0x0ef0] %asi
	.word 0xc4922218  ! 2094: LDUHA_I	lduha	[%r8, + 0x0218] %asi, %r2
	.word 0xdf3a2d08  ! 2095: STDF_I	std	%f15, [0x0d08, %r8]
	.word 0x89a208a9  ! 2096: FSUBs	fsubs	%f8, %f9, %f4
	.word 0xc2fa2924  ! 2097: SWAPA_I	swapa	%r1, [%r8 + 0x0924] %asi
	.word 0x8143e067  ! 2098: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #MemIssue | #Sync 
	.word 0x845a2984  ! 2099: SMUL_I	smul 	%r8, 0x0984, %r2
	.word 0x8143e006  ! 2100: MEMBAR	membar	#StoreLoad | #LoadStore 
	.word 0xc36a28d0  ! 2101: PREFETCH_I	prefetch	[%r8 + 0x08d0], #one_read
	.word 0xeaa227b8  ! 2102: STWA_I	stwa	%r21, [%r8 + 0x07b8] %asi
	.word 0xc3ea1009  ! 2103: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x8e4a0009  ! 2104: MULX_R	mulx 	%r8, %r9, %r7
	.word 0x8143e07a  ! 2105: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xcc2a0009  ! 2107: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xfd020009  ! 2107: LDF_R	ld	[%r8, %r9], %f30
	.word 0x8143c000  ! 2108: STBAR	stbar
	.word 0x83220009  ! 2109: MULScc_R	mulscc 	%r8, %r9, %r1
	.word 0xce4a0009  ! 2110: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xc2f21009  ! 2111: STXA_R	stxa	%r1, [%r8 + %r9] 0x80
	.word 0xee720009  ! 2113: STX_R	stx	%r23, [%r8 + %r9]
	.word 0xea520009  ! 2113: LDSH_R	ldsh	[%r8 + %r9], %r21
	.word 0xf8ca1009  ! 2114: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r28
	.word 0x864a2040  ! 2115: MULX_I	mulx 	%r8, 0x0040, %r3
	.word 0xc2b21009  ! 2116: STHA_R	stha	%r1, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 2117: STBAR	stbar
	.word 0xca720009  ! 2119: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xcb1a0009  ! 2119: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xea4a0009  ! 2120: LDSB_R	ldsb	[%r8 + %r9], %r21
	.word 0xc3ea1009  ! 2121: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xe8f21009  ! 2122: STXA_R	stxa	%r20, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 2123: STBAR	stbar
	.word 0x8b6a2df8  ! 2124: SDIVX_I	sdivx	%r8, 0x0df8, %r5
	.word 0x97222bd8  ! 2125: MULScc_I	mulscc 	%r8, 0x0bd8, %r11
	.word 0xc36a0009  ! 2126: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xe722203c  ! 2127: STF_I	st	%f19, [0x003c, %r8]
	.word 0xc2220009  ! 2129: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc65a0009  ! 2129: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0x24800001  ! 2130: BLE	ble,a	<label_0x1>
	.word 0xc2320009  ! 2132: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xce4a0009  ! 2132: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xc2d22fa8  ! 2133: LDSHA_I	ldsha	[%r8, + 0x0fa8] %asi, %r1
	.word 0xccba1009  ! 2134: STDA_R	stda	%r6, [%r8 + %r9] 0x80
	.word 0xc6c22c6c  ! 2135: LDSWA_I	ldswa	[%r8, + 0x0c6c] %asi, %r3
	.word 0xc62a0009  ! 2137: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xd81a0009  ! 2137: LDD_R	ldd	[%r8 + %r9], %r12
	.word 0x9e5a2888  ! 2138: SMUL_I	smul 	%r8, 0x0888, %r15
	.word 0x2e800001  ! 2139: BVS	bvs,a	<label_0x1>
	.word 0xc36a0009  ! 2140: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc26a0009  ! 2141: LDSTUB_R	ldstub	%r1, [%r8 + %r9]
	.word 0x8143c000  ! 2142: STBAR	stbar
	.word 0x83a20829  ! 2143: FADDs	fadds	%f8, %f9, %f1
	.word 0xcb222ea0  ! 2144: STF_I	st	%f5, [0x0ea0, %r8]
	.word 0xc8aa1009  ! 2145: STBA_R	stba	%r4, [%r8 + %r9] 0x80
	.word 0xce120009  ! 2146: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0x8e7a0009  ! 2147: SDIV_R	sdiv 	%r8, %r9, %r7
	.word 0xaf222efc  ! 2148: MULScc_I	mulscc 	%r8, 0x0efc, %r23
	.word 0xee122a8c  ! 2149: LDUH_I	lduh	[%r8 + 0x0a8c], %r23
	.word 0xdc320009  ! 2151: STH_R	sth	%r14, [%r8 + %r9]
	.word 0xca020009  ! 2151: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xaada0009  ! 2152: SMULcc_R	smulcc 	%r8, %r9, %r21
	.word 0x8143e065  ! 2153: MEMBAR	membar	#LoadLoad | #LoadStore | #MemIssue | #Sync 
	.word 0xda320009  ! 2155: STH_R	sth	%r13, [%r8 + %r9]
	.word 0xcd020009  ! 2155: LDF_R	ld	[%r8, %r9], %f6
	.word 0xc6a21009  ! 2156: STWA_R	stwa	%r3, [%r8 + %r9] 0x80
	.word 0xca7a2b68  ! 2157: SWAP_I	swap	%r5, [%r8 + 0x0b68]
	.word 0x22c20001  ! 2158: BRZ	brz,a,nt	%8,<label_0x20001>
	.word 0xc8aa2a64  ! 2159: STBA_I	stba	%r4, [%r8 + 0x0a64] %asi
	.word 0xe4ba1009  ! 2160: STDA_R	stda	%r18, [%r8 + %r9] 0x80
	.word 0x40000001  ! 2161: CALL	call	disp30_1
	.word 0x8fa208a9  ! 2162: FSUBs	fsubs	%f8, %f9, %f7
	.word 0xbe4a27a0  ! 2163: MULX_I	mulx 	%r8, 0x07a0, %r31
	.word 0xba522044  ! 2164: UMUL_I	umul 	%r8, 0x0044, %r29
	.word 0xce720009  ! 2166: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xe64a0009  ! 2166: LDSB_R	ldsb	[%r8 + %r9], %r19
	.word 0xc6122ad0  ! 2167: LDUH_I	lduh	[%r8 + 0x0ad0], %r3
	.word 0x82522538  ! 2168: UMUL_I	umul 	%r8, 0x0538, %r1
	.word 0xd49a1009  ! 2169: LDDA_R	ldda	[%r8, %r9] 0x80, %r10
	.word 0xcec22f3c  ! 2170: LDSWA_I	ldswa	[%r8, + 0x0f3c] %asi, %r7
	.word 0xe53a2940  ! 2171: STDF_I	std	%f18, [0x0940, %r8]
	.word 0xca220009  ! 2173: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc8420009  ! 2173: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xccb21009  ! 2174: STHA_R	stha	%r6, [%r8 + %r9] 0x80
	.word 0xe8220009  ! 2176: STW_R	stw	%r20, [%r8 + %r9]
	.word 0xc4120009  ! 2176: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xc62a0009  ! 2178: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xcb1a0009  ! 2178: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xf22a0009  ! 2180: STB_R	stb	%r25, [%r8 + %r9]
	.word 0xcd1a0009  ! 2180: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0x824a0009  ! 2181: MULX_R	mulx 	%r8, %r9, %r1
	.word 0x8143c000  ! 2182: STBAR	stbar
	.word 0x8c4a2b5c  ! 2183: MULX_I	mulx 	%r8, 0x0b5c, %r6
	.word 0xcc8a1009  ! 2184: LDUBA_R	lduba	[%r8, %r9] 0x80, %r6
	.word 0xca220009  ! 2186: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xda020009  ! 2186: LDUW_R	lduw	[%r8 + %r9], %r13
	.word 0xc8ca201c  ! 2187: LDSBA_I	ldsba	[%r8, + 0x001c] %asi, %r4
	.word 0x867a0009  ! 2188: SDIV_R	sdiv 	%r8, %r9, %r3
	.word 0xce422af4  ! 2189: LDSW_I	ldsw	[%r8 + 0x0af4], %r7
	.word 0xc6320009  ! 2191: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xf0420009  ! 2191: LDSW_R	ldsw	[%r8 + %r9], %r24
	.word 0xdf3a2980  ! 2192: STDF_I	std	%f15, [0x0980, %r8]
	.word 0xc53a0009  ! 2194: STDF_R	std	%f2, [%r9, %r8]
	.word 0xce720009  ! 2195: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xf8520009  ! 2195: LDSH_R	ldsh	[%r8 + %r9], %r28
	.word 0xf2320009  ! 2197: STH_R	sth	%r25, [%r8 + %r9]
	.word 0xc6420009  ! 2197: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xca6a219c  ! 2198: LDSTUB_I	ldstub	%r5, [%r8 + 0x019c]
	.word 0xfeb22f30  ! 2199: STHA_I	stha	%r31, [%r8 + 0x0f30] %asi
	.word 0xc6122fa0  ! 2200: LDUH_I	lduh	[%r8 + 0x0fa0], %r3
	.word 0xcc2a0009  ! 2202: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xfe5a0009  ! 2202: LDX_R	ldx	[%r8 + %r9], %r31
	.word 0xc2320009  ! 2204: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xf05a0009  ! 2204: LDX_R	ldx	[%r8 + %r9], %r24
	.word 0xcc0a24c4  ! 2205: LDUB_I	ldub	[%r8 + 0x04c4], %r6
	.word 0xc66a2168  ! 2206: LDSTUB_I	ldstub	%r3, [%r8 + 0x0168]
	.word 0x867a2cd4  ! 2207: SDIV_I	sdiv 	%r8, 0x0cd4, %r3
	.word 0xced21009  ! 2208: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r7
	.word 0x20800002  ! 2209: BN	bn,a	<label_0x2>
	.word 0xe91a0009  ! 2210: LDDF_R	ldd	[%r8, %r9], %f20
	.word 0xa85a2ee4  ! 2211: SMUL_I	smul 	%r8, 0x0ee4, %r20
	.word 0x3c800002  ! 2212: BPOS	bpos,a	<label_0x2>
	.word 0xde6a2e60  ! 2213: LDSTUB_I	ldstub	%r15, [%r8 + 0x0e60]
	.word 0xc8022820  ! 2214: LDUW_I	lduw	[%r8 + 0x0820], %r4
	.word 0x8c7a2614  ! 2215: SDIV_I	sdiv 	%r8, 0x0614, %r6
	.word 0xe62a0009  ! 2217: STB_R	stb	%r19, [%r8 + %r9]
	.word 0xdc520009  ! 2217: LDSH_R	ldsh	[%r8 + %r9], %r14
	.word 0xcf3a2b38  ! 2218: STDF_I	std	%f7, [0x0b38, %r8]
	.word 0xca120009  ! 2219: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xc68a1009  ! 2220: LDUBA_R	lduba	[%r8, %r9] 0x80, %r3
	.word 0xe3f22009  ! 2221: CASXA_R	casxa	[%r8]%asi, %r9, %r17
	.word 0xa46a0009  ! 2222: UDIVX_R	udivx 	%r8, %r9, %r18
	.word 0x8c6a0009  ! 2223: UDIVX_R	udivx 	%r8, %r9, %r6
	.word 0xf2b22950  ! 2224: STHA_I	stha	%r25, [%r8 + 0x0950] %asi
	.word 0xc22a0009  ! 2226: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xce4a0009  ! 2226: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xd8320009  ! 2228: STH_R	sth	%r12, [%r8 + %r9]
	.word 0xc6420009  ! 2228: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0x8143c000  ! 2229: STBAR	stbar
	.word 0xcd3a0009  ! 2231: STDF_R	std	%f6, [%r9, %r8]
	.word 0xf8720009  ! 2232: STX_R	stx	%r28, [%r8 + %r9]
	.word 0xc4520009  ! 2232: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0x8d6a0009  ! 2233: SDIVX_R	sdivx	%r8, %r9, %r6
	.word 0x24ca0001  ! 2234: BRLEZ	brlez,a,pt	%8,<label_0xa0001>
	.word 0x40000001  ! 2235: CALL	call	disp30_1
	.word 0x8afa2ea0  ! 2236: SDIVcc_I	sdivcc 	%r8, 0x0ea0, %r5
	.word 0xb0f20009  ! 2237: UDIVcc_R	udivcc 	%r8, %r9, %r24
	.word 0x87a209a9  ! 2238: FDIVs	fdivs	%f8, %f9, %f3
	.word 0xc3ea1009  ! 2239: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc71a0009  ! 2240: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xc6720009  ! 2242: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc9020009  ! 2242: LDF_R	ld	[%r8, %r9], %f4
	.word 0xc65a0009  ! 2243: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xc6d21009  ! 2244: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r3
	.word 0xcaf21009  ! 2245: STXA_R	stxa	%r5, [%r8 + %r9] 0x80
	.word 0xa2f20009  ! 2246: UDIVcc_R	udivcc 	%r8, %r9, %r17
	.word 0x38800001  ! 2247: BGU	bgu,a	<label_0x1>
	.word 0xc2ea1009  ! 2248: LDSTUBA_R	ldstuba	%r1, [%r8 + %r9] 0x80
	.word 0xfe720009  ! 2250: STX_R	stx	%r31, [%r8 + %r9]
	.word 0xcc120009  ! 2250: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xc26a0009  ! 2251: LDSTUB_R	ldstub	%r1, [%r8 + %r9]
	.word 0xc6720009  ! 2253: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xe6020009  ! 2253: LDUW_R	lduw	[%r8 + %r9], %r19
	.word 0xf1220009  ! 2255: STF_R	st	%f24, [%r9, %r8]
	.word 0xee720009  ! 2256: STX_R	stx	%r23, [%r8 + %r9]
	.word 0xd65a0009  ! 2256: LDX_R	ldx	[%r8 + %r9], %r11
	.word 0x0cc20001  ! 2257: BRGZ	brgz  ,nt	%8,<label_0x20001>
	.word 0xc3220009  ! 2259: STF_R	st	%f1, [%r9, %r8]
	.word 0xc4720009  ! 2260: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc01a0009  ! 2260: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0xbcf20009  ! 2261: UDIVcc_R	udivcc 	%r8, %r9, %r30
	.word 0xc09a2940  ! 2262: LDDA_I	ldda	[%r8, + 0x0940] %asi, %r0
	.word 0xf4ba1009  ! 2263: STDA_R	stda	%r26, [%r8 + %r9] 0x80
	.word 0xd6a22c28  ! 2264: STWA_I	stwa	%r11, [%r8 + 0x0c28] %asi
	.word 0x876a25e0  ! 2265: SDIVX_I	sdivx	%r8, 0x05e0, %r3
	.word 0xce320009  ! 2267: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xd84a0009  ! 2267: LDSB_R	ldsb	[%r8 + %r9], %r12
	.word 0xcc320009  ! 2269: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc6120009  ! 2269: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xc0ba1009  ! 2270: STDA_R	stda	%r0, [%r8 + %r9] 0x80
	.word 0xc3ea2e5c  ! 2271: PREFETCHA_I	prefetcha	[%r8, + 0x0e5c] %asi, #one_read
	.word 0xf0ba2cc8  ! 2272: STDA_I	stda	%r24, [%r8 + 0x0cc8] %asi
	.word 0x8fa20829  ! 2273: FADDs	fadds	%f8, %f9, %f7
	.word 0xca6a209c  ! 2274: LDSTUB_I	ldstub	%r5, [%r8 + 0x009c]
	.word 0xccba2e00  ! 2275: STDA_I	stda	%r6, [%r8 + 0x0e00] %asi
	.word 0xa4520009  ! 2276: UMUL_R	umul 	%r8, %r9, %r18
	.word 0xec7a298c  ! 2277: SWAP_I	swap	%r22, [%r8 + 0x098c]
	.word 0xc20a0009  ! 2278: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xc36a2334  ! 2279: PREFETCH_I	prefetch	[%r8 + 0x0334], #one_read
	.word 0x28800001  ! 2280: BLEU	bleu,a	<label_0x1>
	.word 0xc86a2934  ! 2281: LDSTUB_I	ldstub	%r4, [%r8 + 0x0934]
	.word 0xfea21009  ! 2282: STWA_R	stwa	%r31, [%r8 + %r9] 0x80
	.word 0xf8b22adc  ! 2283: STHA_I	stha	%r28, [%r8 + 0x0adc] %asi
	.word 0xca7a0009  ! 2284: SWAP_R	swap	%r5, [%r8 + %r9]
	.word 0x32800001  ! 2285: BNE	bne,a	<label_0x1>
	.word 0xc2ca240c  ! 2286: LDSBA_I	ldsba	[%r8, + 0x040c] %asi, %r1
	.word 0x8143e00b  ! 2287: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore 
	.word 0xcafa1009  ! 2288: SWAPA_R	swapa	%r5, [%r8 + %r9] 0x80
	.word 0xcc2a0009  ! 2290: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc6120009  ! 2290: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xc36a2108  ! 2291: PREFETCH_I	prefetch	[%r8 + 0x0108], #one_read
	.word 0x8143c000  ! 2292: STBAR	stbar
	.word 0xc8220009  ! 2294: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xde4a0009  ! 2294: LDSB_R	ldsb	[%r8 + %r9], %r15
	.word 0x83222448  ! 2295: MULScc_I	mulscc 	%r8, 0x0448, %r1
	.word 0xcb3a0009  ! 2297: STDF_R	std	%f5, [%r9, %r8]
	.word 0xf6720009  ! 2298: STX_R	stx	%r27, [%r8 + %r9]
	.word 0xc4020009  ! 2298: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0x84520009  ! 2299: UMUL_R	umul 	%r8, %r9, %r2
	.word 0xc36a0009  ! 2300: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0x84522a54  ! 2301: UMUL_I	umul 	%r8, 0x0a54, %r2
	.word 0xff3a20f8  ! 2302: STDF_I	std	%f31, [0x00f8, %r8]
	.word 0xcc1a2148  ! 2303: LDD_I	ldd	[%r8 + 0x0148], %r6
	.word 0xca8a2920  ! 2304: LDUBA_I	lduba	[%r8, + 0x0920] %asi, %r5
	.word 0xc7222c28  ! 2305: STF_I	st	%f3, [0x0c28, %r8]
	.word 0xb47a2d74  ! 2306: SDIV_I	sdiv 	%r8, 0x0d74, %r26
	.word 0xcc120009  ! 2307: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xccba1009  ! 2308: STDA_R	stda	%r6, [%r8 + %r9] 0x80
	.word 0x8c4a0009  ! 2309: MULX_R	mulx 	%r8, %r9, %r6
	.word 0xc6320009  ! 2311: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc8520009  ! 2311: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xc3ea1009  ! 2312: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc36a28b8  ! 2313: PREFETCH_I	prefetch	[%r8 + 0x08b8], #one_read
	.word 0xc25a0009  ! 2314: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xc36a23b0  ! 2315: PREFETCH_I	prefetch	[%r8 + 0x03b0], #one_read
	.word 0xcea21009  ! 2316: STWA_R	stwa	%r7, [%r8 + %r9] 0x80
	.word 0x3c800001  ! 2317: BPOS	bpos,a	<label_0x1>
	.word 0xada20929  ! 2318: FMULs	fmuls	%f8, %f9, %f22
	.word 0x8c720009  ! 2319: UDIV_R	udiv 	%r8, %r9, %r6
	.word 0x0a800002  ! 2320: BCS	bcs  	<label_0x2>
	.word 0xe6c22748  ! 2321: LDSWA_I	ldswa	[%r8, + 0x0748] %asi, %r19
	.word 0xe49a1009  ! 2322: LDDA_R	ldda	[%r8, %r9] 0x80, %r18
	.word 0xccba1009  ! 2323: STDA_R	stda	%r6, [%r8 + %r9] 0x80
	.word 0x88720009  ! 2324: UDIV_R	udiv 	%r8, %r9, %r4
	.word 0x98f20009  ! 2325: UDIVcc_R	udivcc 	%r8, %r9, %r12
	.word 0xc3ea2214  ! 2326: PREFETCHA_I	prefetcha	[%r8, + 0x0214] %asi, #one_read
	.word 0xd89a28f8  ! 2327: LDDA_I	ldda	[%r8, + 0x08f8] %asi, %r12
	.word 0x26800001  ! 2328: BL	bl,a	<label_0x1>
	.word 0xce320009  ! 2330: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xcc0a0009  ! 2330: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xce2a0009  ! 2332: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xca020009  ! 2332: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xf73a24b0  ! 2333: STDF_I	std	%f27, [0x04b0, %r8]
	.word 0xdeaa1009  ! 2334: STBA_R	stba	%r15, [%r8 + %r9] 0x80
	.word 0x14800002  ! 2335: BG	bg  	<label_0x2>
	.word 0xd68a2368  ! 2336: LDUBA_I	lduba	[%r8, + 0x0368] %asi, %r11
	.word 0x867a2eac  ! 2337: SDIV_I	sdiv 	%r8, 0x0eac, %r3
	.word 0x2c800001  ! 2338: BNEG	bneg,a	<label_0x1>
	.word 0x1a800002  ! 2339: BCC	bcc  	<label_0x2>
	.word 0x88520009  ! 2340: UMUL_R	umul 	%r8, %r9, %r4
	.word 0xc6b222bc  ! 2341: STHA_I	stha	%r3, [%r8 + 0x02bc] %asi
	.word 0xc3e22009  ! 2342: CASA_R	casa	[%r8] %asi, %r9, %r1
	.word 0x38800001  ! 2343: BGU	bgu,a	<label_0x1>
	.word 0xc3ea2bc8  ! 2344: PREFETCHA_I	prefetcha	[%r8, + 0x0bc8] %asi, #one_read
	.word 0xcca224a0  ! 2345: STWA_I	stwa	%r6, [%r8 + 0x04a0] %asi
	.word 0xce8222f0  ! 2346: LDUWA_I	lduwa	[%r8, + 0x02f0] %asi, %r7
	.word 0x8eda0009  ! 2347: SMULcc_R	smulcc 	%r8, %r9, %r7
	.word 0xdca22040  ! 2348: STWA_I	stwa	%r14, [%r8 + 0x0040] %asi
	.word 0xc3ea2a9c  ! 2349: PREFETCHA_I	prefetcha	[%r8, + 0x0a9c] %asi, #one_read
	.word 0xef3a0009  ! 2351: STDF_R	std	%f23, [%r9, %r8]
	.word 0xc8720009  ! 2352: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc6020009  ! 2352: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0x22800001  ! 2353: BE	be,a	<label_0x1>
	.word 0x8143c000  ! 2354: STBAR	stbar
	.word 0x8143e014  ! 2355: MEMBAR	membar	#LoadStore | #Lookaside 
	.word 0xdc320009  ! 2357: STH_R	sth	%r14, [%r8 + %r9]
	.word 0xe8520009  ! 2357: LDSH_R	ldsh	[%r8 + %r9], %r20
	.word 0xe86a2928  ! 2358: LDSTUB_I	ldstub	%r20, [%r8 + 0x0928]
	.word 0xc0ba1009  ! 2359: STDA_R	stda	%r0, [%r8 + %r9] 0x80
	.word 0xb3222ef8  ! 2360: MULScc_I	mulscc 	%r8, 0x0ef8, %r25
	.word 0x88f220a0  ! 2361: UDIVcc_I	udivcc 	%r8, 0x00a0, %r4
	.word 0x8143c000  ! 2362: STBAR	stbar
	.word 0xc3ea1009  ! 2363: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xfb3a0009  ! 2365: STDF_R	std	%f29, [%r9, %r8]
	.word 0xcc720009  ! 2366: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xf85a0009  ! 2366: LDX_R	ldx	[%r8 + %r9], %r28
	.word 0xb2d2293c  ! 2367: UMULcc_I	umulcc 	%r8, 0x093c, %r25
	.word 0xce320009  ! 2369: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc6520009  ! 2369: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xc8d223a0  ! 2370: LDSHA_I	ldsha	[%r8, + 0x03a0] %asi, %r4
	.word 0x972220f8  ! 2371: MULScc_I	mulscc 	%r8, 0x00f8, %r11
	.word 0xfeb222d4  ! 2372: STHA_I	stha	%r31, [%r8 + 0x02d4] %asi
	.word 0xc22a0009  ! 2374: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xf51a0009  ! 2374: LDDF_R	ldd	[%r8, %r9], %f26
	.word 0xc36a2564  ! 2375: PREFETCH_I	prefetch	[%r8 + 0x0564], #one_read
	.word 0xc2020009  ! 2376: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xcab21009  ! 2377: STHA_R	stha	%r5, [%r8 + %r9] 0x80
	.word 0xc2ea2ff4  ! 2378: LDSTUBA_I	ldstuba	%r1, [%r8 + 0x0ff4] %asi
	.word 0x8143e013  ! 2379: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside 
	.word 0xdd222f40  ! 2380: STF_I	st	%f14, [0x0f40, %r8]
	.word 0xc2220009  ! 2382: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc2120009  ! 2382: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0x8143c000  ! 2383: STBAR	stbar
	.word 0xc36a0009  ! 2384: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc6aa205c  ! 2385: STBA_I	stba	%r3, [%r8 + 0x005c] %asi
	.word 0xc3ea24a0  ! 2386: PREFETCHA_I	prefetcha	[%r8, + 0x04a0] %asi, #one_read
	.word 0xf5f22009  ! 2387: CASXA_R	casxa	[%r8]%asi, %r9, %r26
	.word 0xe67a2dfc  ! 2388: SWAP_I	swap	%r19, [%r8 + 0x0dfc]
	.word 0xc36a0009  ! 2389: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xe2220009  ! 2391: STW_R	stw	%r17, [%r8 + %r9]
	.word 0xc2420009  ! 2391: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0x8a4a0009  ! 2392: MULX_R	mulx 	%r8, %r9, %r5
	.word 0xc3ea1009  ! 2393: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc53a0009  ! 2395: STDF_R	std	%f2, [%r9, %r8]
	.word 0xf6720009  ! 2396: STX_R	stx	%r27, [%r8 + %r9]
	.word 0xc7020009  ! 2396: LDF_R	ld	[%r8, %r9], %f3
	.word 0x8c5a0009  ! 2397: SMUL_R	smul 	%r8, %r9, %r6
	.word 0xd8320009  ! 2399: STH_R	sth	%r12, [%r8 + %r9]
	.word 0xec5a0009  ! 2399: LDX_R	ldx	[%r8 + %r9], %r22
	.word 0xcc4a2f6c  ! 2400: LDSB_I	ldsb	[%r8 + 0x0f6c], %r6
	.word 0xc4ba1009  ! 2401: STDA_R	stda	%r2, [%r8 + %r9] 0x80
	.word 0xc3220009  ! 2403: STF_R	st	%f1, [%r9, %r8]
	.word 0xc2720009  ! 2404: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc44a0009  ! 2404: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0x8143e006  ! 2405: MEMBAR	membar	#StoreLoad | #LoadStore 
	.word 0xc2fa1009  ! 2406: SWAPA_R	swapa	%r1, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 2407: STBAR	stbar
	.word 0x8ef20009  ! 2408: UDIVcc_R	udivcc 	%r8, %r9, %r7
	.word 0x88522948  ! 2409: UMUL_I	umul 	%r8, 0x0948, %r4
	.word 0xc6a21009  ! 2410: STWA_R	stwa	%r3, [%r8 + %r9] 0x80
	.word 0xc4720009  ! 2412: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xfa020009  ! 2412: LDUW_R	lduw	[%r8 + %r9], %r29
	.word 0x0ac20001  ! 2413: BRNZ	brnz  ,nt	%8,<label_0x20001>
	.word 0xccaa1009  ! 2414: STBA_R	stba	%r6, [%r8 + %r9] 0x80
	.word 0x9c720009  ! 2415: UDIV_R	udiv 	%r8, %r9, %r14
	.word 0x22c20001  ! 2416: BRZ	brz,a,nt	%8,<label_0x20001>
	.word 0xccba1009  ! 2417: STDA_R	stda	%r6, [%r8 + %r9] 0x80
	.word 0xc2da2350  ! 2418: LDXA_I	ldxa	[%r8, + 0x0350] %asi, %r1
	.word 0xca2a0009  ! 2420: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xf0420009  ! 2420: LDSW_R	ldsw	[%r8 + %r9], %r24
	.word 0xcd222f64  ! 2421: STF_I	st	%f6, [0x0f64, %r8]
	.word 0xda520009  ! 2422: LDSH_R	ldsh	[%r8 + %r9], %r13
	.word 0xce2a0009  ! 2424: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc60a0009  ! 2424: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0x8143e009  ! 2425: MEMBAR	membar	#LoadLoad | #StoreStore 
	.word 0x885225a0  ! 2426: UMUL_I	umul 	%r8, 0x05a0, %r4
	.word 0xca2a0009  ! 2428: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xef020009  ! 2428: LDF_R	ld	[%r8, %r9], %f23
	.word 0xfe5a0009  ! 2429: LDX_R	ldx	[%r8 + %r9], %r31
	.word 0x0c800001  ! 2430: BNEG	bneg  	<label_0x1>
	.word 0xcf2223fc  ! 2431: STF_I	st	%f7, [0x03fc, %r8]
	.word 0xf6320009  ! 2433: STH_R	sth	%r27, [%r8 + %r9]
	.word 0xcf020009  ! 2433: LDF_R	ld	[%r8, %r9], %f7
	.word 0x89a20829  ! 2434: FADDs	fadds	%f8, %f9, %f4
	.word 0xdc220009  ! 2436: STW_R	stw	%r14, [%r8 + %r9]
	.word 0xfa0a0009  ! 2436: LDUB_R	ldub	[%r8 + %r9], %r29
	.word 0xf0d21009  ! 2437: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r24
	.word 0xc22a0009  ! 2439: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xe24a0009  ! 2439: LDSB_R	ldsb	[%r8 + %r9], %r17
	.word 0xf9e21009  ! 2440: CASA_I	casa	[%r8] 0x80, %r9, %r28
	.word 0xe0ba1009  ! 2441: STDA_R	stda	%r16, [%r8 + %r9] 0x80
	.word 0xc49a23f8  ! 2442: LDDA_I	ldda	[%r8, + 0x03f8] %asi, %r2
	.word 0x8143e078  ! 2443: MEMBAR	membar	#StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xc6ea1009  ! 2444: LDSTUBA_R	ldstuba	%r3, [%r8 + %r9] 0x80
	.word 0xcd3a28a0  ! 2445: STDF_I	std	%f6, [0x08a0, %r8]
	.word 0xcc220009  ! 2447: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc64a0009  ! 2447: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xda0a2580  ! 2448: LDUB_I	ldub	[%r8 + 0x0580], %r13
	.word 0xfa6a2820  ! 2449: LDSTUB_I	ldstub	%r29, [%r8 + 0x0820]
	.word 0xd93a29e0  ! 2450: STDF_I	std	%f12, [0x09e0, %r8]
	.word 0xccc21009  ! 2451: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r6
	.word 0xc8a22b54  ! 2452: STWA_I	stwa	%r4, [%r8 + 0x0b54] %asi
	.word 0x8143e027  ! 2453: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #MemIssue 
	.word 0x02800001  ! 2454: BE	be  	<label_0x1>
	.word 0xc36a20f0  ! 2455: PREFETCH_I	prefetch	[%r8 + 0x00f0], #one_read
	.word 0xc4320009  ! 2457: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc80a0009  ! 2457: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xcf3a0009  ! 2459: STDF_R	std	%f7, [%r9, %r8]
	.word 0xde720009  ! 2460: STX_R	stx	%r15, [%r8 + %r9]
	.word 0xcf1a0009  ! 2460: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0x847a25b0  ! 2461: SDIV_I	sdiv 	%r8, 0x05b0, %r2
	.word 0xc4da1009  ! 2462: LDXA_R	ldxa	[%r8, %r9] 0x80, %r2
	.word 0x8143e076  ! 2463: MEMBAR	membar	#StoreLoad | #LoadStore | #Lookaside | #MemIssue | #Sync 
	.word 0xc2a21009  ! 2464: STWA_R	stwa	%r1, [%r8 + %r9] 0x80
	.word 0xfd222c0c  ! 2465: STF_I	st	%f30, [0x0c0c, %r8]
	.word 0x8143e07a  ! 2466: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xca320009  ! 2468: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xd60a0009  ! 2468: LDUB_R	ldub	[%r8 + %r9], %r11
	.word 0xea5a0009  ! 2469: LDX_R	ldx	[%r8 + %r9], %r21
	.word 0xc82a0009  ! 2471: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xfa120009  ! 2471: LDUH_R	lduh	[%r8 + %r9], %r29
	.word 0xa7222284  ! 2472: MULScc_I	mulscc 	%r8, 0x0284, %r19
	.word 0x14800001  ! 2473: BG	bg  	<label_0x1>
	.word 0xc3ea1009  ! 2474: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc27a2e4c  ! 2475: SWAP_I	swap	%r1, [%r8 + 0x0e4c]
	.word 0xbc5a2420  ! 2476: SMUL_I	smul 	%r8, 0x0420, %r30
	.word 0x8d6a2ef0  ! 2477: SDIVX_I	sdivx	%r8, 0x0ef0, %r6
	.word 0xc4320009  ! 2479: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xcc020009  ! 2479: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xc62a0009  ! 2481: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc81a0009  ! 2481: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xc3ea1009  ! 2482: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc36a22c8  ! 2483: PREFETCH_I	prefetch	[%r8 + 0x02c8], #one_read
	.word 0xc6220009  ! 2485: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xd81a0009  ! 2485: LDD_R	ldd	[%r8 + %r9], %r12
	.word 0x84da0009  ! 2486: SMULcc_R	smulcc 	%r8, %r9, %r2
	.word 0xea2a0009  ! 2488: STB_R	stb	%r21, [%r8 + %r9]
	.word 0xcc020009  ! 2488: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xda220009  ! 2490: STW_R	stw	%r13, [%r8 + %r9]
	.word 0xf0120009  ! 2490: LDUH_R	lduh	[%r8 + %r9], %r24
	.word 0xc3ea28ac  ! 2491: PREFETCHA_I	prefetcha	[%r8, + 0x08ac] %asi, #one_read
	.word 0xca4227e0  ! 2492: LDSW_I	ldsw	[%r8 + 0x07e0], %r5
	.word 0xfc5a0009  ! 2493: LDX_R	ldx	[%r8 + %r9], %r30
	.word 0xc6720009  ! 2495: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc4520009  ! 2495: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xc3ea1009  ! 2496: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x8143e000  ! 2497: MEMBAR	membar	
	.word 0xc2220009  ! 2499: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc31a0009  ! 2499: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xc3ea1009  ! 2500: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc4921009  ! 2501: LDUHA_R	lduha	[%r8, %r9] 0x80, %r2
	.word 0xc36a2e58  ! 2502: PREFETCH_I	prefetch	[%r8 + 0x0e58], #one_read
	.word 0x86f20009  ! 2503: UDIVcc_R	udivcc 	%r8, %r9, %r3
	.word 0x06c20001  ! 2504: BRLZ	brlz  ,nt	%8,<label_0x20001>
	.word 0x8cfa2210  ! 2505: SDIVcc_I	sdivcc 	%r8, 0x0210, %r6
	.word 0xd93a0009  ! 2507: STDF_R	std	%f12, [%r9, %r8]
	.word 0xde720009  ! 2508: STX_R	stx	%r15, [%r8 + %r9]
	.word 0xc80a0009  ! 2508: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xc36a22f8  ! 2509: PREFETCH_I	prefetch	[%r8 + 0x02f8], #one_read
	.word 0xc2ea2e14  ! 2510: LDSTUBA_I	ldstuba	%r1, [%r8 + 0x0e14] %asi
	.word 0x847a0009  ! 2511: SDIV_R	sdiv 	%r8, %r9, %r2
	.word 0xe93a0009  ! 2513: STDF_R	std	%f20, [%r9, %r8]
	.word 0xca720009  ! 2514: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc8120009  ! 2514: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xe8a22468  ! 2515: STWA_I	stwa	%r20, [%r8 + 0x0468] %asi
	.word 0xc9f21009  ! 2516: CASXA_I	casxa	[%r8] 0x80, %r9, %r4
	.word 0x8143e06f  ! 2517: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #MemIssue | #Sync 
	.word 0xc2b22aa4  ! 2518: STHA_I	stha	%r1, [%r8 + 0x0aa4] %asi
	.word 0xb04a0009  ! 2519: MULX_R	mulx 	%r8, %r9, %r24
	.word 0xc3220009  ! 2521: STF_R	st	%f1, [%r9, %r8]
	.word 0xc8720009  ! 2522: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xfc120009  ! 2522: LDUH_R	lduh	[%r8 + %r9], %r30
	.word 0xc81a0009  ! 2523: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xcc220009  ! 2525: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xfe120009  ! 2525: LDUH_R	lduh	[%r8 + %r9], %r31
	.word 0xc8921009  ! 2526: LDUHA_R	lduha	[%r8, %r9] 0x80, %r4
	.word 0x8143c000  ! 2527: STBAR	stbar
	.word 0xc3ea255c  ! 2528: PREFETCHA_I	prefetcha	[%r8, + 0x055c] %asi, #one_read
	.word 0xccca1009  ! 2529: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r6
	.word 0x8da209a9  ! 2530: FDIVs	fdivs	%f8, %f9, %f6
	.word 0xe4b22700  ! 2531: STHA_I	stha	%r18, [%r8 + 0x0700] %asi
	.word 0xf7220009  ! 2533: STF_R	st	%f27, [%r9, %r8]
	.word 0xce720009  ! 2534: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xf25a0009  ! 2534: LDX_R	ldx	[%r8 + %r9], %r25
	.word 0xfca22978  ! 2535: STWA_I	stwa	%r30, [%r8 + 0x0978] %asi
	.word 0xf48a1009  ! 2536: LDUBA_R	lduba	[%r8, %r9] 0x80, %r26
	.word 0xce220009  ! 2538: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc60a0009  ! 2538: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xe3220009  ! 2540: STF_R	st	%f17, [%r9, %r8]
	.word 0xfe720009  ! 2541: STX_R	stx	%r31, [%r8 + %r9]
	.word 0xfa4a0009  ! 2541: LDSB_R	ldsb	[%r8 + %r9], %r29
	.word 0x884a0009  ! 2542: MULX_R	mulx 	%r8, %r9, %r4
	.word 0xc2220009  ! 2544: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc6020009  ! 2544: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0x24c20001  ! 2545: BRLEZ	brlez,a,nt	%8,<label_0x20001>
	.word 0xc36a2b28  ! 2546: PREFETCH_I	prefetch	[%r8 + 0x0b28], #one_read
	.word 0xccea1009  ! 2547: LDSTUBA_R	ldstuba	%r6, [%r8 + %r9] 0x80
	.word 0x866a0009  ! 2548: UDIVX_R	udivx 	%r8, %r9, %r3
	.word 0x2ac20001  ! 2549: BRNZ	brnz,a,nt	%8,<label_0x20001>
	.word 0x887a0009  ! 2550: SDIV_R	sdiv 	%r8, %r9, %r4
	.word 0xed222e98  ! 2551: STF_I	st	%f22, [0x0e98, %r8]
	.word 0x8143c000  ! 2552: STBAR	stbar
	.word 0x8143e048  ! 2553: MEMBAR	membar	#StoreStore | #Sync 
	.word 0xc33a0009  ! 2555: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc2720009  ! 2556: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc80a0009  ! 2556: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0x88fa0009  ! 2557: SDIVcc_R	sdivcc 	%r8, %r9, %r4
	.word 0xc87a0009  ! 2558: SWAP_R	swap	%r4, [%r8 + %r9]
	.word 0xcef221d0  ! 2559: STXA_I	stxa	%r7, [%r8 + 0x01d0] %asi
	.word 0xc2220009  ! 2561: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xfc5a0009  ! 2561: LDX_R	ldx	[%r8 + %r9], %r30
	.word 0xf08a1009  ! 2562: LDUBA_R	lduba	[%r8, %r9] 0x80, %r24
	.word 0x8143e00c  ! 2563: MEMBAR	membar	#LoadStore | #StoreStore 
	.word 0x8cd22ef0  ! 2564: UMULcc_I	umulcc 	%r8, 0x0ef0, %r6
	.word 0xb9220009  ! 2565: MULScc_R	mulscc 	%r8, %r9, %r28
	.word 0xc41a2220  ! 2566: LDD_I	ldd	[%r8 + 0x0220], %r2
	.word 0x24ca0001  ! 2567: BRLEZ	brlez,a,pt	%8,<label_0xa0001>
	.word 0x8a5a0009  ! 2568: SMUL_R	smul 	%r8, %r9, %r5
	.word 0xb7a209a9  ! 2569: FDIVs	fdivs	%f8, %f9, %f27
	.word 0xc3ea1009  ! 2570: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x8b220009  ! 2571: MULScc_R	mulscc 	%r8, %r9, %r5
	.word 0xc36a0009  ! 2572: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0x04ca0001  ! 2573: BRLEZ	brlez  ,pt	%8,<label_0xa0001>
	.word 0xdd220009  ! 2575: STF_R	st	%f14, [%r9, %r8]
	.word 0xce720009  ! 2576: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xec1a0009  ! 2576: LDD_R	ldd	[%r8 + %r9], %r22
	.word 0xf8ea1009  ! 2577: LDSTUBA_R	ldstuba	%r28, [%r8 + %r9] 0x80
	.word 0x3a800002  ! 2578: BCC	bcc,a	<label_0x2>
	.word 0x8e7a0009  ! 2579: SDIV_R	sdiv 	%r8, %r9, %r7
	.word 0xca320009  ! 2581: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xce520009  ! 2581: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xcc0a2e94  ! 2582: LDUB_I	ldub	[%r8 + 0x0e94], %r6
	.word 0x0cca0001  ! 2583: BRGZ	brgz  ,pt	%8,<label_0xa0001>
	.word 0xcafa1009  ! 2584: SWAPA_R	swapa	%r5, [%r8 + %r9] 0x80
	.word 0xccc21009  ! 2585: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r6
	.word 0xce5a0009  ! 2586: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0x8ef20009  ! 2587: UDIVcc_R	udivcc 	%r8, %r9, %r7
	.word 0xcea22dd0  ! 2588: STWA_I	stwa	%r7, [%r8 + 0x0dd0] %asi
	.word 0x8e5a0009  ! 2589: SMUL_R	smul 	%r8, %r9, %r7
	.word 0xc2921009  ! 2590: LDUHA_R	lduha	[%r8, %r9] 0x80, %r1
	.word 0xc4220009  ! 2592: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xca420009  ! 2592: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xe4320009  ! 2594: STH_R	sth	%r18, [%r8 + %r9]
	.word 0xf5020009  ! 2594: LDF_R	ld	[%r8, %r9], %f26
	.word 0x8d6a0009  ! 2595: SDIVX_R	sdivx	%r8, %r9, %r6
	.word 0xbb220009  ! 2596: MULScc_R	mulscc 	%r8, %r9, %r29
	.word 0xc3ea1009  ! 2597: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xebe21009  ! 2598: CASA_I	casa	[%r8] 0x80, %r9, %r21
	.word 0xcff21009  ! 2599: CASXA_I	casxa	[%r8] 0x80, %r9, %r7
	.word 0xc8b21009  ! 2600: STHA_R	stha	%r4, [%r8 + %r9] 0x80
	.word 0xc68a2974  ! 2601: LDUBA_I	lduba	[%r8, + 0x0974] %asi, %r3
	.word 0x00800001  ! 2602: BN	bn  	<label_0x1>
	.word 0xc8220009  ! 2604: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc6420009  ! 2604: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xf6a227a4  ! 2605: STWA_I	stwa	%r27, [%r8 + 0x07a4] %asi
	.word 0x1e800002  ! 2606: BVC	bvc  	<label_0x2>
	.word 0xc8720009  ! 2608: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xf8020009  ! 2608: LDUW_R	lduw	[%r8 + %r9], %r28
	.word 0x0aca0001  ! 2609: BRNZ	brnz  ,pt	%8,<label_0xa0001>
	.word 0x38800001  ! 2610: BGU	bgu,a	<label_0x1>
	.word 0x8143e00d  ! 2611: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore 
	.word 0x84da0009  ! 2612: SMULcc_R	smulcc 	%r8, %r9, %r2
	.word 0xc20a2230  ! 2613: LDUB_I	ldub	[%r8 + 0x0230], %r1
	.word 0xc9220009  ! 2615: STF_R	st	%f4, [%r9, %r8]
	.word 0xc8720009  ! 2616: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc20a0009  ! 2616: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xcf3a26c0  ! 2617: STDF_I	std	%f7, [0x06c0, %r8]
	.word 0x8143e018  ! 2618: MEMBAR	membar	#StoreStore | #Lookaside 
	.word 0xac520009  ! 2619: UMUL_R	umul 	%r8, %r9, %r22
	.word 0xc2220009  ! 2621: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xce5a0009  ! 2621: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xc4320009  ! 2623: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xca420009  ! 2623: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0x88720009  ! 2624: UDIV_R	udiv 	%r8, %r9, %r4
	.word 0x8143e07d  ! 2625: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xccca1009  ! 2626: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r6
	.word 0xc8320009  ! 2628: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xce4a0009  ! 2628: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xae4a0009  ! 2629: MULX_R	mulx 	%r8, %r9, %r23
	.word 0x10800001  ! 2630: BA	ba  	<label_0x1>
	.word 0x8143c000  ! 2631: STBAR	stbar
	.word 0xc4ea2c28  ! 2632: LDSTUBA_I	ldstuba	%r2, [%r8 + 0x0c28] %asi
	.word 0xc6020009  ! 2633: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0x8143c000  ! 2634: STBAR	stbar
	.word 0xc7220009  ! 2636: STF_R	st	%f3, [%r9, %r8]
	.word 0xe6720009  ! 2637: STX_R	stx	%r19, [%r8 + %r9]
	.word 0xcb020009  ! 2637: LDF_R	ld	[%r8, %r9], %f5
	.word 0xf8b21009  ! 2638: STHA_R	stha	%r28, [%r8 + %r9] 0x80
	.word 0xecf21009  ! 2639: STXA_R	stxa	%r22, [%r8 + %r9] 0x80
	.word 0xee220009  ! 2641: STW_R	stw	%r23, [%r8 + %r9]
	.word 0xce520009  ! 2641: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xc7220009  ! 2643: STF_R	st	%f3, [%r9, %r8]
	.word 0xcc720009  ! 2644: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc8120009  ! 2644: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xc36a2518  ! 2645: PREFETCH_I	prefetch	[%r8 + 0x0518], #one_read
	.word 0xc3f22009  ! 2646: CASXA_R	casxa	[%r8]%asi, %r9, %r1
	.word 0x87a209a9  ! 2647: FDIVs	fdivs	%f8, %f9, %f3
	.word 0xe2220009  ! 2649: STW_R	stw	%r17, [%r8 + %r9]
	.word 0xc2520009  ! 2649: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xf6220009  ! 2651: STW_R	stw	%r27, [%r8 + %r9]
	.word 0xc71a0009  ! 2651: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xccb21009  ! 2652: STHA_R	stha	%r6, [%r8 + %r9] 0x80
	.word 0xb65a251c  ! 2653: SMUL_I	smul 	%r8, 0x051c, %r27
	.word 0xc20a0009  ! 2654: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0x24800001  ! 2655: BLE	ble,a	<label_0x1>
	.word 0x8c4a2d7c  ! 2656: MULX_I	mulx 	%r8, 0x0d7c, %r6
	.word 0xc3ea1009  ! 2657: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc3ea2afc  ! 2658: PREFETCHA_I	prefetcha	[%r8, + 0x0afc] %asi, #one_read
	.word 0xca7a2350  ! 2659: SWAP_I	swap	%r5, [%r8 + 0x0350]
	.word 0xc6520009  ! 2660: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xc4922d60  ! 2661: LDUHA_I	lduha	[%r8, + 0x0d60] %asi, %r2
	.word 0x8143c000  ! 2662: STBAR	stbar
	.word 0xc3ea2d4c  ! 2663: PREFETCHA_I	prefetcha	[%r8, + 0x0d4c] %asi, #one_read
	.word 0xec9a2138  ! 2664: LDDA_I	ldda	[%r8, + 0x0138] %asi, %r22
	.word 0xc3ea1009  ! 2665: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc36a2a78  ! 2666: PREFETCH_I	prefetch	[%r8 + 0x0a78], #one_read
	.word 0xc7f21009  ! 2667: CASXA_I	casxa	[%r8] 0x80, %r9, %r3
	.word 0x0e800001  ! 2668: BVS	bvs  	<label_0x1>
	.word 0xc8ea2f08  ! 2669: LDSTUBA_I	ldstuba	%r4, [%r8 + 0x0f08] %asi
	.word 0xc36a22e0  ! 2670: PREFETCH_I	prefetch	[%r8 + 0x02e0], #one_read
	.word 0xc6da26e0  ! 2671: LDXA_I	ldxa	[%r8, + 0x06e0] %asi, %r3
	.word 0xce5a2a78  ! 2672: LDX_I	ldx	[%r8 + 0x0a78], %r7
	.word 0x12800002  ! 2673: BNE	bne  	<label_0x2>
	.word 0xc8220009  ! 2675: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc8420009  ! 2675: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0x8fa20929  ! 2676: FMULs	fmuls	%f8, %f9, %f7
	.word 0xc36a0009  ! 2677: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc36a0009  ! 2678: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xca720009  ! 2680: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xd64a0009  ! 2680: LDSB_R	ldsb	[%r8 + %r9], %r11
	.word 0xfc1a2020  ! 2681: LDD_I	ldd	[%r8 + 0x0020], %r30
	.word 0xc6d21009  ! 2682: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r3
	.word 0xc73a2138  ! 2683: STDF_I	std	%f3, [0x0138, %r8]
	.word 0x22800001  ! 2684: BE	be,a	<label_0x1>
	.word 0xc86a0009  ! 2685: LDSTUB_R	ldstub	%r4, [%r8 + %r9]
	.word 0xc62a0009  ! 2687: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc8120009  ! 2687: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xf6220009  ! 2689: STW_R	stw	%r27, [%r8 + %r9]
	.word 0xcd020009  ! 2689: LDF_R	ld	[%r8, %r9], %f6
	.word 0xc5222d6c  ! 2690: STF_I	st	%f2, [0x0d6c, %r8]
	.word 0x20800002  ! 2691: BN	bn,a	<label_0x2>
	.word 0xc3ea2164  ! 2692: PREFETCHA_I	prefetcha	[%r8, + 0x0164] %asi, #one_read
	.word 0x8eda2914  ! 2693: SMULcc_I	smulcc 	%r8, 0x0914, %r7
	.word 0xcc2a0009  ! 2695: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc85a0009  ! 2695: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xce220009  ! 2697: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc4420009  ! 2697: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xc87a2270  ! 2698: SWAP_I	swap	%r4, [%r8 + 0x0270]
	.word 0xb9a20929  ! 2699: FMULs	fmuls	%f8, %f9, %f28
	.word 0xc26a0009  ! 2700: LDSTUB_R	ldstub	%r1, [%r8 + %r9]
	.word 0xcaca1009  ! 2701: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r5
	.word 0xc8220009  ! 2703: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc8520009  ! 2703: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xc36a2640  ! 2704: PREFETCH_I	prefetch	[%r8 + 0x0640], #one_read
	.word 0xc27a0009  ! 2705: SWAP_R	swap	%r1, [%r8 + %r9]
	.word 0x10800002  ! 2706: BA	ba  	<label_0x2>
	.word 0xc36a25b4  ! 2707: PREFETCH_I	prefetch	[%r8 + 0x05b4], #one_read
	.word 0xc2220009  ! 2709: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xcc1a0009  ! 2709: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0x8d6a2394  ! 2710: SDIVX_I	sdivx	%r8, 0x0394, %r6
	.word 0x8143c000  ! 2711: STBAR	stbar
	.word 0xdf3a27f8  ! 2712: STDF_I	std	%f15, [0x07f8, %r8]
	.word 0xdeaa1009  ! 2713: STBA_R	stba	%r15, [%r8 + %r9] 0x80
	.word 0xc36a20b0  ! 2714: PREFETCH_I	prefetch	[%r8 + 0x00b0], #one_read
	.word 0xf60a2048  ! 2715: LDUB_I	ldub	[%r8 + 0x0048], %r27
	.word 0x86d20009  ! 2716: UMULcc_R	umulcc 	%r8, %r9, %r3
	.word 0xcc422dfc  ! 2717: LDSW_I	ldsw	[%r8 + 0x0dfc], %r6
	.word 0xc3ea25c8  ! 2718: PREFETCHA_I	prefetcha	[%r8, + 0x05c8] %asi, #one_read
	.word 0xc2320009  ! 2720: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc41a0009  ! 2720: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xea020009  ! 2721: LDUW_R	lduw	[%r8 + %r9], %r21
	.word 0x8fa208a9  ! 2722: FSUBs	fsubs	%f8, %f9, %f7
	.word 0x8143c000  ! 2723: STBAR	stbar
	.word 0x8143c000  ! 2724: STBAR	stbar
	.word 0x8143c000  ! 2725: STBAR	stbar
	.word 0xeaf22b68  ! 2726: STXA_I	stxa	%r21, [%r8 + 0x0b68] %asi
	.word 0x8a720009  ! 2727: UDIV_R	udiv 	%r8, %r9, %r5
	.word 0x825a0009  ! 2728: SMUL_R	smul 	%r8, %r9, %r1
	.word 0xcb22245c  ! 2729: STF_I	st	%f5, [0x045c, %r8]
	.word 0x825a0009  ! 2730: SMUL_R	smul 	%r8, %r9, %r1
	.word 0xe2f21009  ! 2731: STXA_R	stxa	%r17, [%r8 + %r9] 0x80
	.word 0xcb02242c  ! 2732: LDF_I	ld	[%r8, 0x042c], %f5
	.word 0xc3ea1009  ! 2733: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x12800001  ! 2734: BNE	bne  	<label_0x1>
	.word 0xf8c21009  ! 2735: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r28
	.word 0xc81a2130  ! 2736: LDD_I	ldd	[%r8 + 0x0130], %r4
	.word 0xf8c22c9c  ! 2737: LDSWA_I	ldswa	[%r8, + 0x0c9c] %asi, %r28
	.word 0xe04a0009  ! 2738: LDSB_R	ldsb	[%r8 + %r9], %r16
	.word 0xf0020009  ! 2739: LDUW_R	lduw	[%r8 + %r9], %r24
	.word 0x00800001  ! 2740: BN	bn  	<label_0x1>
	.word 0xc4ea24dc  ! 2741: LDSTUBA_I	ldstuba	%r2, [%r8 + 0x04dc] %asi
	.word 0xe73a2be8  ! 2742: STDF_I	std	%f19, [0x0be8, %r8]
	.word 0xc84a2870  ! 2743: LDSB_I	ldsb	[%r8 + 0x0870], %r4
	.word 0xc2aa2794  ! 2744: STBA_I	stba	%r1, [%r8 + 0x0794] %asi
	.word 0xc8520009  ! 2745: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xdf222dc4  ! 2746: STF_I	st	%f15, [0x0dc4, %r8]
	.word 0xdc821009  ! 2747: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r14
	.word 0xc2c22410  ! 2748: LDSWA_I	ldswa	[%r8, + 0x0410] %asi, %r1
	.word 0x2c800001  ! 2749: BNEG	bneg,a	<label_0x1>
	.word 0xc8fa2c00  ! 2750: SWAPA_I	swapa	%r4, [%r8 + 0x0c00] %asi
	.word 0xc36a0009  ! 2751: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xce320009  ! 2753: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xca120009  ! 2753: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xc8320009  ! 2755: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xce4a0009  ! 2755: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xc36a0009  ! 2756: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xe4220009  ! 2758: STW_R	stw	%r18, [%r8 + %r9]
	.word 0xc80a0009  ! 2758: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xc36a2428  ! 2759: PREFETCH_I	prefetch	[%r8 + 0x0428], #one_read
	.word 0xbba20829  ! 2760: FADDs	fadds	%f8, %f9, %f29
	.word 0x8e6a2e9c  ! 2761: UDIVX_I	udivx 	%r8, 0x0e9c, %r7
	.word 0xfac21009  ! 2762: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r29
	.word 0xc3ea2cd0  ! 2763: PREFETCHA_I	prefetcha	[%r8, + 0x0cd0] %asi, #one_read
	.word 0xf8c22908  ! 2764: LDSWA_I	ldswa	[%r8, + 0x0908] %asi, %r28
	.word 0xc3ea2d50  ! 2765: PREFETCHA_I	prefetcha	[%r8, + 0x0d50] %asi, #one_read
	.word 0x8143e011  ! 2766: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xc0ba1009  ! 2767: STDA_R	stda	%r0, [%r8 + %r9] 0x80
	.word 0xca0223d4  ! 2768: LDUW_I	lduw	[%r8 + 0x03d4], %r5
	.word 0x8ba20929  ! 2769: FMULs	fmuls	%f8, %f9, %f5
	.word 0x8143c000  ! 2770: STBAR	stbar
	.word 0xca120009  ! 2771: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0x83220009  ! 2772: MULScc_R	mulscc 	%r8, %r9, %r1
	.word 0xecba2c08  ! 2773: STDA_I	stda	%r22, [%r8 + 0x0c08] %asi
	.word 0xca2a0009  ! 2775: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xca0a0009  ! 2775: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0x8c720009  ! 2776: UDIV_R	udiv 	%r8, %r9, %r6
	.word 0x827a2020  ! 2777: SDIV_I	sdiv 	%r8, 0x0020, %r1
	.word 0xcaea1009  ! 2778: LDSTUBA_R	ldstuba	%r5, [%r8 + %r9] 0x80
	.word 0x99a209a9  ! 2779: FDIVs	fdivs	%f8, %f9, %f12
	.word 0xc93a0009  ! 2781: STDF_R	std	%f4, [%r9, %r8]
	.word 0xfa720009  ! 2782: STX_R	stx	%r29, [%r8 + %r9]
	.word 0xc85a0009  ! 2782: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xc0ba1009  ! 2783: STDA_R	stda	%r0, [%r8 + %r9] 0x80
	.word 0xcefa2d24  ! 2784: SWAPA_I	swapa	%r7, [%r8 + 0x0d24] %asi
	.word 0x04800001  ! 2785: BLE	ble  	<label_0x1>
	.word 0x8143c000  ! 2786: STBAR	stbar
	.word 0xc36a2604  ! 2787: PREFETCH_I	prefetch	[%r8 + 0x0604], #one_read
	.word 0xd6b22014  ! 2788: STHA_I	stha	%r11, [%r8 + 0x0014] %asi
	.word 0x9f6a22b8  ! 2789: SDIVX_I	sdivx	%r8, 0x02b8, %r15
	.word 0x89a20829  ! 2790: FADDs	fadds	%f8, %f9, %f4
	.word 0x8143c000  ! 2791: STBAR	stbar
	.word 0xfc2a0009  ! 2793: STB_R	stb	%r30, [%r8 + %r9]
	.word 0xc4520009  ! 2793: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0x8d222b58  ! 2794: MULScc_I	mulscc 	%r8, 0x0b58, %r6
	.word 0xe6ea1009  ! 2795: LDSTUBA_R	ldstuba	%r19, [%r8 + %r9] 0x80
	.word 0xa04a2fc4  ! 2796: MULX_I	mulx 	%r8, 0x0fc4, %r16
	.word 0xc4ba26f0  ! 2797: STDA_I	stda	%r2, [%r8 + 0x06f0] %asi
	.word 0xc36a28a4  ! 2798: PREFETCH_I	prefetch	[%r8 + 0x08a4], #one_read
	.word 0xc9e22009  ! 2799: CASA_R	casa	[%r8] %asi, %r9, %r4
	.word 0xcada2918  ! 2800: LDXA_I	ldxa	[%r8, + 0x0918] %asi, %r5
	.word 0xca122660  ! 2801: LDUH_I	lduh	[%r8 + 0x0660], %r5
	.word 0xc8aa2e2c  ! 2802: STBA_I	stba	%r4, [%r8 + 0x0e2c] %asi
	.word 0xf82a0009  ! 2804: STB_R	stb	%r28, [%r8 + %r9]
	.word 0xf2020009  ! 2804: LDUW_R	lduw	[%r8 + %r9], %r25
	.word 0x2eca0001  ! 2805: BRGEZ	brgez,a,pt	%8,<label_0xa0001>
	.word 0x2c800002  ! 2806: BNEG	bneg,a	<label_0x2>
	.word 0xcec22ee0  ! 2807: LDSWA_I	ldswa	[%r8, + 0x0ee0] %asi, %r7
	.word 0x22800002  ! 2808: BE	be,a	<label_0x2>
	.word 0xc36a203c  ! 2809: PREFETCH_I	prefetch	[%r8 + 0x003c], #one_read
	.word 0xc3ea28b0  ! 2810: PREFETCHA_I	prefetcha	[%r8, + 0x08b0] %asi, #one_read
	.word 0x84da0009  ! 2811: SMULcc_R	smulcc 	%r8, %r9, %r2
	.word 0xc36a20a0  ! 2812: PREFETCH_I	prefetch	[%r8 + 0x00a0], #one_read
	.word 0x04ca0001  ! 2813: BRLEZ	brlez  ,pt	%8,<label_0xa0001>
	.word 0x8143e014  ! 2814: MEMBAR	membar	#LoadStore | #Lookaside 
	.word 0x8cfa0009  ! 2815: SDIVcc_R	sdivcc 	%r8, %r9, %r6
	.word 0xe6220009  ! 2817: STW_R	stw	%r19, [%r8 + %r9]
	.word 0xcb020009  ! 2817: LDF_R	ld	[%r8, %r9], %f5
	.word 0x38800001  ! 2818: BGU	bgu,a	<label_0x1>
	.word 0xf4ba1009  ! 2819: STDA_R	stda	%r26, [%r8 + %r9] 0x80
	.word 0xcc4220c0  ! 2820: LDSW_I	ldsw	[%r8 + 0x00c0], %r6
	.word 0xa2f22534  ! 2821: UDIVcc_I	udivcc 	%r8, 0x0534, %r17
	.word 0x02c20001  ! 2822: BRZ	brz  ,nt	%8,<label_0x20001>
	.word 0xd82a0009  ! 2824: STB_R	stb	%r12, [%r8 + %r9]
	.word 0xfe4a0009  ! 2824: LDSB_R	ldsb	[%r8 + %r9], %r31
	.word 0xeb3a0009  ! 2826: STDF_R	std	%f21, [%r9, %r8]
	.word 0xfe720009  ! 2827: STX_R	stx	%r31, [%r8 + %r9]
	.word 0xfc020009  ! 2827: LDUW_R	lduw	[%r8 + %r9], %r30
	.word 0xccaa2a68  ! 2828: STBA_I	stba	%r6, [%r8 + 0x0a68] %asi
	.word 0xfb3a2958  ! 2829: STDF_I	std	%f29, [0x0958, %r8]
	.word 0xca5a2010  ! 2830: LDX_I	ldx	[%r8 + 0x0010], %r5
	.word 0xe64a2a50  ! 2831: LDSB_I	ldsb	[%r8 + 0x0a50], %r19
	.word 0xcfe22009  ! 2832: CASA_R	casa	[%r8] %asi, %r9, %r7
	.word 0x8a4a267c  ! 2833: MULX_I	mulx 	%r8, 0x067c, %r5
	.word 0xe07a0009  ! 2834: SWAP_R	swap	%r16, [%r8 + %r9]
	.word 0xcf3a0009  ! 2836: STDF_R	std	%f7, [%r9, %r8]
	.word 0xd6720009  ! 2837: STX_R	stx	%r11, [%r8 + %r9]
	.word 0xc9020009  ! 2837: LDF_R	ld	[%r8, %r9], %f4
	.word 0x86f20009  ! 2838: UDIVcc_R	udivcc 	%r8, %r9, %r3
	.word 0xcff21009  ! 2839: CASXA_I	casxa	[%r8] 0x80, %r9, %r7
	.word 0xe2f22d90  ! 2840: STXA_I	stxa	%r17, [%r8 + 0x0d90] %asi
	.word 0xc33a2508  ! 2841: STDF_I	std	%f1, [0x0508, %r8]
	.word 0xcc520009  ! 2842: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xfcf22948  ! 2843: STXA_I	stxa	%r30, [%r8 + 0x0948] %asi
	.word 0xc3ea202c  ! 2844: PREFETCHA_I	prefetcha	[%r8, + 0x002c] %asi, #one_read
	.word 0xf44a0009  ! 2845: LDSB_R	ldsb	[%r8 + %r9], %r26
	.word 0xce5a2bf8  ! 2846: LDX_I	ldx	[%r8 + 0x0bf8], %r7
	.word 0xc8320009  ! 2848: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xce5a0009  ! 2848: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0x8143c000  ! 2849: STBAR	stbar
	.word 0xc4c21009  ! 2850: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r2
	.word 0xef3a0009  ! 2852: STDF_R	std	%f23, [%r9, %r8]
	.word 0xcc720009  ! 2853: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xcc120009  ! 2853: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xcc5a2f10  ! 2854: LDX_I	ldx	[%r8 + 0x0f10], %r6
	.word 0x8fa20829  ! 2855: FADDs	fadds	%f8, %f9, %f7
	.word 0xca220009  ! 2857: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xf6520009  ! 2857: LDSH_R	ldsh	[%r8 + %r9], %r27
	.word 0xc5220009  ! 2859: STF_R	st	%f2, [%r9, %r8]
	.word 0xce720009  ! 2860: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xcc0a0009  ! 2860: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xce822c6c  ! 2861: LDUWA_I	lduwa	[%r8, + 0x0c6c] %asi, %r7
	.word 0xa5222d88  ! 2862: MULScc_I	mulscc 	%r8, 0x0d88, %r18
	.word 0xca2a0009  ! 2864: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xcd1a0009  ! 2864: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0x40000001  ! 2865: CALL	call	disp30_1
	.word 0xe0220009  ! 2867: STW_R	stw	%r16, [%r8 + %r9]
	.word 0xcc5a0009  ! 2867: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xfe0a0009  ! 2868: LDUB_R	ldub	[%r8 + %r9], %r31
	.word 0xc8ea1009  ! 2869: LDSTUBA_R	ldstuba	%r4, [%r8 + %r9] 0x80
	.word 0xc36a2700  ! 2870: PREFETCH_I	prefetch	[%r8 + 0x0700], #one_read
	.word 0x9e7a2944  ! 2871: SDIV_I	sdiv 	%r8, 0x0944, %r15
	.word 0xa7220009  ! 2872: MULScc_R	mulscc 	%r8, %r9, %r19
	.word 0x8143e016  ! 2873: MEMBAR	membar	#StoreLoad | #LoadStore | #Lookaside 
	.word 0x8e520009  ! 2874: UMUL_R	umul 	%r8, %r9, %r7
	.word 0xf8220009  ! 2876: STW_R	stw	%r28, [%r8 + %r9]
	.word 0xce4a0009  ! 2876: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0x9fa208a9  ! 2877: FSUBs	fsubs	%f8, %f9, %f15
	.word 0x8e5a242c  ! 2878: SMUL_I	smul 	%r8, 0x042c, %r7
	.word 0xe6d21009  ! 2879: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r19
	.word 0xca8a2d68  ! 2880: LDUBA_I	lduba	[%r8, + 0x0d68] %asi, %r5
	.word 0x8e7a2770  ! 2881: SDIV_I	sdiv 	%r8, 0x0770, %r7
	.word 0x8da209a9  ! 2882: FDIVs	fdivs	%f8, %f9, %f6
	.word 0xc4fa1009  ! 2883: SWAPA_R	swapa	%r2, [%r8 + %r9] 0x80
	.word 0xfcc2245c  ! 2884: LDSWA_I	ldswa	[%r8, + 0x045c] %asi, %r30
	.word 0x0eca0001  ! 2885: BRGEZ	brgez  ,pt	%8,<label_0xa0001>
	.word 0x8143e02f  ! 2886: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #MemIssue 
	.word 0xe66a24e0  ! 2887: LDSTUB_I	ldstub	%r19, [%r8 + 0x04e0]
	.word 0xc6da2480  ! 2888: LDXA_I	ldxa	[%r8, + 0x0480] %asi, %r3
	.word 0x2ec20001  ! 2889: BRGEZ	brgez,a,nt	%8,<label_0x20001>
	.word 0xc3ea28dc  ! 2890: PREFETCHA_I	prefetcha	[%r8, + 0x08dc] %asi, #one_read
	.word 0x02800001  ! 2891: BE	be  	<label_0x1>
	.word 0xc2220009  ! 2893: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xfe4a0009  ! 2893: LDSB_R	ldsb	[%r8 + %r9], %r31
	.word 0xeb3a2918  ! 2894: STDF_I	std	%f21, [0x0918, %r8]
	.word 0xc2520009  ! 2895: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0x1c800002  ! 2896: BPOS	bpos  	<label_0x2>
	.word 0xeada2418  ! 2897: LDXA_I	ldxa	[%r8, + 0x0418] %asi, %r21
	.word 0xce4220c8  ! 2898: LDSW_I	ldsw	[%r8 + 0x00c8], %r7
	.word 0xcb020009  ! 2899: LDF_R	ld	[%r8, %r9], %f5
	.word 0xedf22009  ! 2900: CASXA_R	casxa	[%r8]%asi, %r9, %r22
	.word 0x8143e03c  ! 2901: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0xce720009  ! 2903: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xf4420009  ! 2903: LDSW_R	ldsw	[%r8 + %r9], %r26
	.word 0xa0722eb8  ! 2904: UDIV_I	udiv 	%r8, 0x0eb8, %r16
	.word 0xc3ea28a8  ! 2905: PREFETCHA_I	prefetcha	[%r8, + 0x08a8] %asi, #one_read
	.word 0xf7220009  ! 2907: STF_R	st	%f27, [%r9, %r8]
	.word 0xce720009  ! 2908: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xff1a0009  ! 2908: LDDF_R	ldd	[%r8, %r9], %f31
	.word 0x826a0009  ! 2909: UDIVX_R	udivx 	%r8, %r9, %r1
	.word 0x8143c000  ! 2910: STBAR	stbar
	.word 0xc26a22e8  ! 2911: LDSTUB_I	ldstub	%r1, [%r8 + 0x02e8]
	.word 0xe41a0009  ! 2912: LDD_R	ldd	[%r8 + %r9], %r18
	.word 0x22ca0001  ! 2913: BRZ	brz,a,pt	%8,<label_0xa0001>
	.word 0xc6921009  ! 2914: LDUHA_R	lduha	[%r8, %r9] 0x80, %r3
	.word 0x8143c000  ! 2915: STBAR	stbar
	.word 0xce5a0009  ! 2916: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xda220009  ! 2918: STW_R	stw	%r13, [%r8 + %r9]
	.word 0xd8020009  ! 2918: LDUW_R	lduw	[%r8 + %r9], %r12
	.word 0xca122a40  ! 2919: LDUH_I	lduh	[%r8 + 0x0a40], %r5
	.word 0x3e800001  ! 2920: BVC	bvc,a	<label_0x1>
	.word 0x02800001  ! 2921: BE	be  	<label_0x1>
	.word 0x8eda2f7c  ! 2922: SMULcc_I	smulcc 	%r8, 0x0f7c, %r7
	.word 0x34800001  ! 2923: BG	bg,a	<label_0x1>
	.word 0xbf220009  ! 2924: MULScc_R	mulscc 	%r8, %r9, %r31
	.word 0xccba2488  ! 2925: STDA_I	stda	%r6, [%r8 + 0x0488] %asi
	.word 0xc5e22009  ! 2926: CASA_R	casa	[%r8] %asi, %r9, %r2
	.word 0xc8821009  ! 2927: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r4
	.word 0xe49a1009  ! 2928: LDDA_R	ldda	[%r8, %r9] 0x80, %r18
	.word 0xc2c21009  ! 2929: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r1
	.word 0xc5022db8  ! 2930: LDF_I	ld	[%r8, 0x0db8], %f2
	.word 0xceea1009  ! 2931: LDSTUBA_R	ldstuba	%r7, [%r8 + %r9] 0x80
	.word 0x82d22618  ! 2932: UMULcc_I	umulcc 	%r8, 0x0618, %r1
	.word 0xcd3a27c8  ! 2933: STDF_I	std	%f6, [0x07c8, %r8]
	.word 0xcaaa2814  ! 2934: STBA_I	stba	%r5, [%r8 + 0x0814] %asi
	.word 0x856a2aa4  ! 2935: SDIVX_I	sdivx	%r8, 0x0aa4, %r2
	.word 0x3a800001  ! 2936: BCC	bcc,a	<label_0x1>
	.word 0xf4b21009  ! 2937: STHA_R	stha	%r26, [%r8 + %r9] 0x80
	.word 0xc5220009  ! 2939: STF_R	st	%f2, [%r9, %r8]
	.word 0xc6720009  ! 2940: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc8020009  ! 2940: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0x88da2a44  ! 2941: SMULcc_I	smulcc 	%r8, 0x0a44, %r4
	.word 0xc2220009  ! 2943: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xcc4a0009  ! 2943: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xc49a2210  ! 2944: LDDA_I	ldda	[%r8, + 0x0210] %asi, %r2
	.word 0xc89a1009  ! 2945: LDDA_R	ldda	[%r8, %r9] 0x80, %r4
	.word 0x8143c000  ! 2946: STBAR	stbar
	.word 0xc3ea1009  ! 2947: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x8ada0009  ! 2948: SMULcc_R	smulcc 	%r8, %r9, %r5
	.word 0xc2220009  ! 2950: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xcd020009  ! 2950: LDF_R	ld	[%r8, %r9], %f6
	.word 0xbda20929  ! 2951: FMULs	fmuls	%f8, %f9, %f30
	.word 0xe73a0009  ! 2953: STDF_R	std	%f19, [%r9, %r8]
	.word 0xc2720009  ! 2954: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc8120009  ! 2954: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xc36a0009  ! 2955: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xee2a0009  ! 2957: STB_R	stb	%r23, [%r8 + %r9]
	.word 0xcd020009  ! 2957: LDF_R	ld	[%r8, %r9], %f6
	.word 0xce520009  ! 2958: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xc36a0009  ! 2959: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0x99a208a9  ! 2960: FSUBs	fsubs	%f8, %f9, %f12
	.word 0x34800001  ! 2961: BG	bg,a	<label_0x1>
	.word 0xc5e22009  ! 2962: CASA_R	casa	[%r8] %asi, %r9, %r2
	.word 0x856a2fd4  ! 2963: SDIVX_I	sdivx	%r8, 0x0fd4, %r2
	.word 0x14800002  ! 2964: BG	bg  	<label_0x2>
	.word 0x8852263c  ! 2965: UMUL_I	umul 	%r8, 0x063c, %r4
	.word 0x85a20929  ! 2966: FMULs	fmuls	%f8, %f9, %f2
	.word 0xc3ea2eec  ! 2967: PREFETCHA_I	prefetcha	[%r8, + 0x0eec] %asi, #one_read
	.word 0xfa2a0009  ! 2969: STB_R	stb	%r29, [%r8 + %r9]
	.word 0xc60a0009  ! 2969: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0x884a0009  ! 2970: MULX_R	mulx 	%r8, %r9, %r4
	.word 0xa3a20929  ! 2971: FMULs	fmuls	%f8, %f9, %f17
	.word 0xdc320009  ! 2973: STH_R	sth	%r14, [%r8 + %r9]
	.word 0xec520009  ! 2973: LDSH_R	ldsh	[%r8 + %r9], %r22
	.word 0xca220009  ! 2975: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xce020009  ! 2975: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xc22a0009  ! 2977: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc8120009  ! 2977: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xe07a0009  ! 2978: SWAP_R	swap	%r16, [%r8 + %r9]
	.word 0xcc320009  ! 2980: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xf1020009  ! 2980: LDF_R	ld	[%r8, %r9], %f24
	.word 0xe62a0009  ! 2982: STB_R	stb	%r19, [%r8 + %r9]
	.word 0xfe520009  ! 2982: LDSH_R	ldsh	[%r8 + %r9], %r31
	.word 0xaa4a0009  ! 2983: MULX_R	mulx 	%r8, %r9, %r21
	.word 0xce5a2ed8  ! 2984: LDX_I	ldx	[%r8 + 0x0ed8], %r7
	.word 0x8b222320  ! 2985: MULScc_I	mulscc 	%r8, 0x0320, %r5
	.word 0xc7f22009  ! 2986: CASXA_R	casxa	[%r8]%asi, %r9, %r3
	.word 0xf06a0009  ! 2987: LDSTUB_R	ldstub	%r24, [%r8 + %r9]
	.word 0xc36a2880  ! 2988: PREFETCH_I	prefetch	[%r8 + 0x0880], #one_read
	.word 0xc89a1009  ! 2989: LDDA_R	ldda	[%r8, %r9] 0x80, %r4
	.word 0x8143e00d  ! 2990: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore 
	.word 0xc42a0009  ! 2992: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc01a0009  ! 2992: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0xc36a0009  ! 2993: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0x8ada2700  ! 2994: SMULcc_I	smulcc 	%r8, 0x0700, %r5
	.word 0xb46a0009  ! 2995: UDIVX_R	udivx 	%r8, %r9, %r26
	.word 0xc3ea2d40  ! 2996: PREFETCHA_I	prefetcha	[%r8, + 0x0d40] %asi, #one_read
	.word 0x8143c000  ! 2997: STBAR	stbar
	.word 0xceda2b10  ! 2998: LDXA_I	ldxa	[%r8, + 0x0b10] %asi, %r7
	.word 0x02800001  ! 2999: BE	be  	<label_0x1>
	.word 0x18800002  ! 3000: BGU	bgu  	<label_0x2>
	.word 0xdc0a0009  ! 3001: LDUB_R	ldub	[%r8 + %r9], %r14
	.word 0xd4ba1009  ! 3002: STDA_R	stda	%r10, [%r8 + %r9] 0x80
	.word 0x8143e05b  ! 3003: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Lookaside | #Sync 
	.word 0x1e800002  ! 3004: BVC	bvc  	<label_0x2>
	.word 0xc3ea1009  ! 3005: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc5f21009  ! 3006: CASXA_I	casxa	[%r8] 0x80, %r9, %r2
	.word 0x16800001  ! 3007: BGE	bge  	<label_0x1>
	.word 0xc2d21009  ! 3008: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r1
	.word 0xcaf21009  ! 3009: STXA_R	stxa	%r5, [%r8 + %r9] 0x80
	.word 0x8143e013  ! 3010: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside 
	.word 0x87a20929  ! 3011: FMULs	fmuls	%f8, %f9, %f3
	.word 0x12800001  ! 3012: BNE	bne  	<label_0x1>
	.word 0x8d220009  ! 3013: MULScc_R	mulscc 	%r8, %r9, %r6
	.word 0xc36a2fc8  ! 3014: PREFETCH_I	prefetch	[%r8 + 0x0fc8], #one_read
	.word 0xc53a0009  ! 3016: STDF_R	std	%f2, [%r9, %r8]
	.word 0xf6720009  ! 3017: STX_R	stx	%r27, [%r8 + %r9]
	.word 0xef020009  ! 3017: LDF_R	ld	[%r8, %r9], %f23
	.word 0xc8c21009  ! 3018: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r4
	.word 0xe89a1009  ! 3019: LDDA_R	ldda	[%r8, %r9] 0x80, %r20
	.word 0x8143c000  ! 3020: STBAR	stbar
	.word 0xc2320009  ! 3022: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc5020009  ! 3022: LDF_R	ld	[%r8, %r9], %f2
	.word 0xcc2a0009  ! 3024: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xca520009  ! 3024: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xc3ea1009  ! 3025: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc8220009  ! 3027: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xde4a0009  ! 3027: LDSB_R	ldsb	[%r8 + %r9], %r15
	.word 0xf4da1009  ! 3028: LDXA_R	ldxa	[%r8, %r9] 0x80, %r26
	.word 0x2cca0001  ! 3029: BRGZ	brgz,a,pt	%8,<label_0xa0001>
	.word 0x0cca0001  ! 3030: BRGZ	brgz  ,pt	%8,<label_0xa0001>
	.word 0xcaa21009  ! 3031: STWA_R	stwa	%r5, [%r8 + %r9] 0x80
	.word 0xc20a0009  ! 3032: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xf13a2990  ! 3033: STDF_I	std	%f24, [0x0990, %r8]
	.word 0x8143e07c  ! 3034: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0x40000001  ! 3035: CALL	call	disp30_1
	.word 0xc6b21009  ! 3036: STHA_R	stha	%r3, [%r8 + %r9] 0x80
	.word 0xce2a0009  ! 3038: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc7020009  ! 3038: LDF_R	ld	[%r8, %r9], %f3
	.word 0xccaa228c  ! 3039: STBA_I	stba	%r6, [%r8 + 0x028c] %asi
	.word 0xc9220009  ! 3041: STF_R	st	%f4, [%r9, %r8]
	.word 0xcc720009  ! 3042: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc60a0009  ! 3042: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xc3ea280c  ! 3043: PREFETCHA_I	prefetcha	[%r8, + 0x080c] %asi, #one_read
	.word 0xbda208a9  ! 3044: FSUBs	fsubs	%f8, %f9, %f30
	.word 0x8143e013  ! 3045: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside 
	.word 0xc36a0009  ! 3046: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc8720009  ! 3048: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xcc020009  ! 3048: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0x88d20009  ! 3049: UMULcc_R	umulcc 	%r8, %r9, %r4
	.word 0x36800001  ! 3050: BGE	bge,a	<label_0x1>
	.word 0xd4ba25b0  ! 3051: STDA_I	stda	%r10, [%r8 + 0x05b0] %asi
	.word 0x98522400  ! 3052: UMUL_I	umul 	%r8, 0x0400, %r12
	.word 0xe22a0009  ! 3054: STB_R	stb	%r17, [%r8 + %r9]
	.word 0xd8120009  ! 3054: LDUH_R	lduh	[%r8 + %r9], %r12
	.word 0xc53a2188  ! 3055: STDF_I	std	%f2, [0x0188, %r8]
	.word 0x84f22dd8  ! 3056: UDIVcc_I	udivcc 	%r8, 0x0dd8, %r2
	.word 0x28800001  ! 3057: BLEU	bleu,a	<label_0x1>
	.word 0xc36a0009  ! 3058: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc2b22c34  ! 3059: STHA_I	stha	%r1, [%r8 + 0x0c34] %asi
	.word 0xa44a0009  ! 3060: MULX_R	mulx 	%r8, %r9, %r18
	.word 0xca2a0009  ! 3062: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xf6420009  ! 3062: LDSW_R	ldsw	[%r8 + %r9], %r27
	.word 0xc36a0009  ! 3063: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0x2e800001  ! 3064: BVS	bvs,a	<label_0x1>
	.word 0xfc5a2030  ! 3065: LDX_I	ldx	[%r8 + 0x0030], %r30
	.word 0xc3ea2700  ! 3066: PREFETCHA_I	prefetcha	[%r8, + 0x0700] %asi, #one_read
	.word 0xccea1009  ! 3067: LDSTUBA_R	ldstuba	%r6, [%r8 + %r9] 0x80
	.word 0x8c722f80  ! 3068: UDIV_I	udiv 	%r8, 0x0f80, %r6
	.word 0xceca1009  ! 3069: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r7
	.word 0xc8ba2108  ! 3070: STDA_I	stda	%r4, [%r8 + 0x0108] %asi
	.word 0x86522bcc  ! 3071: UMUL_I	umul 	%r8, 0x0bcc, %r3
	.word 0xce320009  ! 3073: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc60a0009  ! 3073: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xc4320009  ! 3075: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xca520009  ! 3075: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xc4f22f20  ! 3076: STXA_I	stxa	%r2, [%r8 + 0x0f20] %asi
	.word 0xc8f22528  ! 3077: STXA_I	stxa	%r4, [%r8 + 0x0528] %asi
	.word 0xc4ba2018  ! 3078: STDA_I	stda	%r2, [%r8 + 0x0018] %asi
	.word 0xcbf21009  ! 3079: CASXA_I	casxa	[%r8] 0x80, %r9, %r5
	.word 0xca7a26a4  ! 3080: SWAP_I	swap	%r5, [%r8 + 0x06a4]
	.word 0xc36a0009  ! 3081: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0x28800002  ! 3082: BLEU	bleu,a	<label_0x2>
	.word 0x88f20009  ! 3083: UDIVcc_R	udivcc 	%r8, %r9, %r4
	.word 0xd8b22090  ! 3084: STHA_I	stha	%r12, [%r8 + 0x0090] %asi
	.word 0x8cf221b4  ! 3085: UDIVcc_I	udivcc 	%r8, 0x01b4, %r6
	.word 0xcbe21009  ! 3086: CASA_I	casa	[%r8] 0x80, %r9, %r5
	.word 0xc3ea1009  ! 3087: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc82a0009  ! 3089: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xe0120009  ! 3089: LDUH_R	lduh	[%r8 + %r9], %r16
	.word 0x8143c000  ! 3090: STBAR	stbar
	.word 0xea220009  ! 3092: STW_R	stw	%r21, [%r8 + %r9]
	.word 0xca120009  ! 3092: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xcc4a0009  ! 3093: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xc6da2c58  ! 3094: LDXA_I	ldxa	[%r8, + 0x0c58] %asi, %r3
	.word 0xae520009  ! 3095: UMUL_R	umul 	%r8, %r9, %r23
	.word 0xc36a22c8  ! 3096: PREFETCH_I	prefetch	[%r8 + 0x02c8], #one_read
	.word 0x04ca0001  ! 3097: BRLEZ	brlez  ,pt	%8,<label_0xa0001>
	.word 0xdc9a2ab0  ! 3098: LDDA_I	ldda	[%r8, + 0x0ab0] %asi, %r14
	.word 0xd6220009  ! 3100: STW_R	stw	%r11, [%r8 + %r9]
	.word 0xc44a0009  ! 3100: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xc73a0009  ! 3102: STDF_R	std	%f3, [%r9, %r8]
	.word 0xf0720009  ! 3103: STX_R	stx	%r24, [%r8 + %r9]
	.word 0xca4a0009  ! 3103: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0x1a800001  ! 3104: BCC	bcc  	<label_0x1>
	.word 0x82520009  ! 3105: UMUL_R	umul 	%r8, %r9, %r1
	.word 0xa6d20009  ! 3106: UMULcc_R	umulcc 	%r8, %r9, %r19
	.word 0xc85226fc  ! 3107: LDSH_I	ldsh	[%r8 + 0x06fc], %r4
	.word 0x12800002  ! 3108: BNE	bne  	<label_0x2>
	.word 0xc8922880  ! 3109: LDUHA_I	lduha	[%r8, + 0x0880] %asi, %r4
	.word 0xe4220009  ! 3111: STW_R	stw	%r18, [%r8 + %r9]
	.word 0xc8020009  ! 3111: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xa64a20bc  ! 3112: MULX_I	mulx 	%r8, 0x00bc, %r19
	.word 0xcb22221c  ! 3113: STF_I	st	%f5, [0x021c, %r8]
	.word 0x8143e06e  ! 3114: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #MemIssue | #Sync 
	.word 0xc3f22009  ! 3115: CASXA_R	casxa	[%r8]%asi, %r9, %r1
	.word 0x0a800002  ! 3116: BCS	bcs  	<label_0x2>
	.word 0x8143c000  ! 3117: STBAR	stbar
	.word 0xc8f21009  ! 3118: STXA_R	stxa	%r4, [%r8 + %r9] 0x80
	.word 0xc22a0009  ! 3120: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc64a0009  ! 3120: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xee922b14  ! 3121: LDUHA_I	lduha	[%r8, + 0x0b14] %asi, %r23
	.word 0xdc220009  ! 3123: STW_R	stw	%r14, [%r8 + %r9]
	.word 0xdf020009  ! 3123: LDF_R	ld	[%r8, %r9], %f15
	.word 0xc6220009  ! 3125: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xda5a0009  ! 3125: LDX_R	ldx	[%r8 + %r9], %r13
	.word 0xca5a0009  ! 3126: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0x8143e025  ! 3127: MEMBAR	membar	#LoadLoad | #LoadStore | #MemIssue 
	.word 0xdf3a2858  ! 3128: STDF_I	std	%f15, [0x0858, %r8]
	.word 0xdfe22009  ! 3129: CASA_R	casa	[%r8] %asi, %r9, %r15
	.word 0xc36a29a0  ! 3130: PREFETCH_I	prefetch	[%r8 + 0x09a0], #one_read
	.word 0x8143e063  ! 3131: MEMBAR	membar	#LoadLoad | #StoreLoad | #MemIssue | #Sync 
	.word 0xf53a2ea8  ! 3132: STDF_I	std	%f26, [0x0ea8, %r8]
	.word 0xccba1009  ! 3133: STDA_R	stda	%r6, [%r8 + %r9] 0x80
	.word 0xfc9a2960  ! 3134: LDDA_I	ldda	[%r8, + 0x0960] %asi, %r30
	.word 0xcea22b38  ! 3135: STWA_I	stwa	%r7, [%r8 + 0x0b38] %asi
	.word 0x8fa20829  ! 3136: FADDs	fadds	%f8, %f9, %f7
	.word 0x8cfa2608  ! 3137: SDIVcc_I	sdivcc 	%r8, 0x0608, %r6
	.word 0x2cca0001  ! 3138: BRGZ	brgz,a,pt	%8,<label_0xa0001>
	.word 0x3c800002  ! 3139: BPOS	bpos,a	<label_0x2>
	.word 0xc2522240  ! 3140: LDSH_I	ldsh	[%r8 + 0x0240], %r1
	.word 0x84f22100  ! 3141: UDIVcc_I	udivcc 	%r8, 0x0100, %r2
	.word 0x10800001  ! 3142: BA	ba  	<label_0x1>
	.word 0xc3ea28e4  ! 3143: PREFETCHA_I	prefetcha	[%r8, + 0x08e4] %asi, #one_read
	.word 0x827a2e88  ! 3144: SDIV_I	sdiv 	%r8, 0x0e88, %r1
	.word 0xca220009  ! 3146: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xce0a0009  ! 3146: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xf2720009  ! 3148: STX_R	stx	%r25, [%r8 + %r9]
	.word 0xca020009  ! 3148: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0x867a288c  ! 3149: SDIV_I	sdiv 	%r8, 0x088c, %r3
	.word 0x8143c000  ! 3150: STBAR	stbar
	.word 0xc6220009  ! 3152: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc40a0009  ! 3152: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xf33a0009  ! 3154: STDF_R	std	%f25, [%r9, %r8]
	.word 0xc6720009  ! 3155: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc8520009  ! 3155: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xc6a221d8  ! 3156: STWA_I	stwa	%r3, [%r8 + 0x01d8] %asi
	.word 0x8143e010  ! 3157: MEMBAR	membar	#Lookaside 
	.word 0x8f6a27a0  ! 3158: SDIVX_I	sdivx	%r8, 0x07a0, %r7
	.word 0xc8ca2578  ! 3159: LDSBA_I	ldsba	[%r8, + 0x0578] %asi, %r4
	.word 0xc82a0009  ! 3161: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc65a0009  ! 3161: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0x8f222380  ! 3162: MULScc_I	mulscc 	%r8, 0x0380, %r7
	.word 0x896a20f4  ! 3163: SDIVX_I	sdivx	%r8, 0x00f4, %r4
	.word 0xb4722f0c  ! 3164: UDIV_I	udiv 	%r8, 0x0f0c, %r26
	.word 0xc3ea1009  ! 3165: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xcc2a0009  ! 3167: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xdc1a0009  ! 3167: LDD_R	ldd	[%r8 + %r9], %r14
	.word 0xc6320009  ! 3169: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc81a0009  ! 3169: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xc3e22009  ! 3170: CASA_R	casa	[%r8] %asi, %r9, %r1
	.word 0x82522e24  ! 3171: UMUL_I	umul 	%r8, 0x0e24, %r1
	.word 0xb56a0009  ! 3172: SDIVX_R	sdivx	%r8, %r9, %r26
	.word 0xc33a0009  ! 3174: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc8720009  ! 3175: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xce0a0009  ! 3175: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xb66a0009  ! 3176: UDIVX_R	udivx 	%r8, %r9, %r27
	.word 0xc8f21009  ! 3177: STXA_R	stxa	%r4, [%r8 + %r9] 0x80
	.word 0xfcc22fd8  ! 3178: LDSWA_I	ldswa	[%r8, + 0x0fd8] %asi, %r30
	.word 0xc2fa2d74  ! 3179: SWAPA_I	swapa	%r1, [%r8 + 0x0d74] %asi
	.word 0x8fa208a9  ! 3180: FSUBs	fsubs	%f8, %f9, %f7
	.word 0xd9220009  ! 3182: STF_R	st	%f12, [%r9, %r8]
	.word 0xc2720009  ! 3183: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc81a0009  ! 3183: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x8143e002  ! 3184: MEMBAR	membar	#StoreLoad 
	.word 0xc6921009  ! 3185: LDUHA_R	lduha	[%r8, %r9] 0x80, %r3
	.word 0xc4120009  ! 3186: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xfeea2f10  ! 3187: LDSTUBA_I	ldstuba	%r31, [%r8 + 0x0f10] %asi
	.word 0x06c20001  ! 3188: BRLZ	brlz  ,nt	%8,<label_0x20001>
	.word 0x8143c000  ! 3189: STBAR	stbar
	.word 0xccc21009  ! 3190: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r6
	.word 0xc53a2ac0  ! 3191: STDF_I	std	%f2, [0x0ac0, %r8]
	.word 0xc6320009  ! 3193: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xdb1a0009  ! 3193: LDDF_R	ldd	[%r8, %r9], %f13
	.word 0xc65a0009  ! 3194: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xfab22d4c  ! 3195: STHA_I	stha	%r29, [%r8 + 0x0d4c] %asi
	.word 0x85222ab8  ! 3196: MULScc_I	mulscc 	%r8, 0x0ab8, %r2
	.word 0x85220009  ! 3197: MULScc_R	mulscc 	%r8, %r9, %r2
	.word 0x87a208a9  ! 3198: FSUBs	fsubs	%f8, %f9, %f3
	.word 0xca320009  ! 3200: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc60a0009  ! 3200: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xc36a0009  ! 3201: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0x8c520009  ! 3202: UMUL_R	umul 	%r8, %r9, %r6
	.word 0xcc320009  ! 3204: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xce120009  ! 3204: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xfad21009  ! 3205: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r29
	.word 0xe8220009  ! 3207: STW_R	stw	%r20, [%r8 + %r9]
	.word 0xcc020009  ! 3207: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xc8ea2aec  ! 3208: LDSTUBA_I	ldstuba	%r4, [%r8 + 0x0aec] %asi
	.word 0xac6a2424  ! 3209: UDIVX_I	udivx 	%r8, 0x0424, %r22
	.word 0xe6aa24bc  ! 3210: STBA_I	stba	%r19, [%r8 + 0x04bc] %asi
	.word 0xc7222188  ! 3211: STF_I	st	%f3, [0x0188, %r8]
	.word 0xc36a0009  ! 3212: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0x8ed20009  ! 3213: UMULcc_R	umulcc 	%r8, %r9, %r7
	.word 0xce2a0009  ! 3215: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc80a0009  ! 3215: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xccf22660  ! 3216: STXA_I	stxa	%r6, [%r8 + 0x0660] %asi
	.word 0xc36a2e3c  ! 3217: PREFETCH_I	prefetch	[%r8 + 0x0e3c], #one_read
	.word 0xc4ea1009  ! 3218: LDSTUBA_R	ldstuba	%r2, [%r8 + %r9] 0x80
	.word 0xc3ea2f0c  ! 3219: PREFETCHA_I	prefetcha	[%r8, + 0x0f0c] %asi, #one_read
	.word 0xccea1009  ! 3220: LDSTUBA_R	ldstuba	%r6, [%r8 + %r9] 0x80
	.word 0xcc7a0009  ! 3221: SWAP_R	swap	%r6, [%r8 + %r9]
	.word 0x8143c000  ! 3222: STBAR	stbar
	.word 0x8afa0009  ! 3223: SDIVcc_R	sdivcc 	%r8, %r9, %r5
	.word 0xc7020009  ! 3224: LDF_R	ld	[%r8, %r9], %f3
	.word 0xa64a2a18  ! 3225: MULX_I	mulx 	%r8, 0x0a18, %r19
	.word 0xc8c21009  ! 3226: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r4
	.word 0x83222478  ! 3227: MULScc_I	mulscc 	%r8, 0x0478, %r1
	.word 0xc4720009  ! 3229: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xea120009  ! 3229: LDUH_R	lduh	[%r8 + %r9], %r21
	.word 0x85a209a9  ! 3230: FDIVs	fdivs	%f8, %f9, %f2
	.word 0x8143c000  ! 3231: STBAR	stbar
	.word 0x8143c000  ! 3232: STBAR	stbar
	.word 0xdc320009  ! 3234: STH_R	sth	%r14, [%r8 + %r9]
	.word 0xc6420009  ! 3234: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xc8720009  ! 3236: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xce420009  ! 3236: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xe8320009  ! 3238: STH_R	sth	%r20, [%r8 + %r9]
	.word 0xf84a0009  ! 3238: LDSB_R	ldsb	[%r8 + %r9], %r28
	.word 0xc6ca2114  ! 3239: LDSBA_I	ldsba	[%r8, + 0x0114] %asi, %r3
	.word 0x8da209a9  ! 3240: FDIVs	fdivs	%f8, %f9, %f6
	.word 0x8143e04f  ! 3241: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #Sync 
	.word 0xcc4a0009  ! 3242: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xea320009  ! 3244: STH_R	sth	%r21, [%r8 + %r9]
	.word 0xc8020009  ! 3244: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0x83a20829  ! 3245: FADDs	fadds	%f8, %f9, %f1
	.word 0xcaca1009  ! 3246: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r5
	.word 0xada209a9  ! 3247: FDIVs	fdivs	%f8, %f9, %f22
	.word 0xcd3a2da8  ! 3248: STDF_I	std	%f6, [0x0da8, %r8]
	.word 0xc84a0009  ! 3249: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xc36a0009  ! 3250: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xaad22840  ! 3251: UMULcc_I	umulcc 	%r8, 0x0840, %r21
	.word 0x8efa2968  ! 3252: SDIVcc_I	sdivcc 	%r8, 0x0968, %r7
	.word 0xc8b21009  ! 3253: STHA_R	stha	%r4, [%r8 + %r9] 0x80
	.word 0xd6ca1009  ! 3254: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r11
	.word 0xd8fa1009  ! 3255: SWAPA_R	swapa	%r12, [%r8 + %r9] 0x80
	.word 0x08800001  ! 3256: BLEU	bleu  	<label_0x1>
	.word 0xeeea1009  ! 3257: LDSTUBA_R	ldstuba	%r23, [%r8 + %r9] 0x80
	.word 0xc2720009  ! 3259: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xce0a0009  ! 3259: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xaa7a2e88  ! 3260: SDIV_I	sdiv 	%r8, 0x0e88, %r21
	.word 0xc2020009  ! 3261: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xc31a2668  ! 3262: LDDF_I	ldd	[%r8, 0x0668], %f1
	.word 0xc6220009  ! 3264: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc9020009  ! 3264: LDF_R	ld	[%r8, %r9], %f4
	.word 0xc36a0009  ! 3265: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc3ea2c44  ! 3266: PREFETCHA_I	prefetcha	[%r8, + 0x0c44] %asi, #one_read
	.word 0xc2fa1009  ! 3267: SWAPA_R	swapa	%r1, [%r8 + %r9] 0x80
	.word 0x8da208a9  ! 3268: FSUBs	fsubs	%f8, %f9, %f6
	.word 0xe28221ec  ! 3269: LDUWA_I	lduwa	[%r8, + 0x01ec] %asi, %r17
	.word 0xd8220009  ! 3271: STW_R	stw	%r12, [%r8 + %r9]
	.word 0xfc1a0009  ! 3271: LDD_R	ldd	[%r8 + %r9], %r30
	.word 0xba7a2c3c  ! 3272: SDIV_I	sdiv 	%r8, 0x0c3c, %r29
	.word 0xc3ea2268  ! 3273: PREFETCHA_I	prefetcha	[%r8, + 0x0268] %asi, #one_read
	.word 0xc36a2578  ! 3274: PREFETCH_I	prefetch	[%r8 + 0x0578], #one_read
	.word 0xec2a0009  ! 3276: STB_R	stb	%r22, [%r8 + %r9]
	.word 0xc8420009  ! 3276: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0x8a520009  ! 3277: UMUL_R	umul 	%r8, %r9, %r5
	.word 0xea720009  ! 3279: STX_R	stx	%r21, [%r8 + %r9]
	.word 0xc4520009  ! 3279: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0x887a0009  ! 3280: SDIV_R	sdiv 	%r8, %r9, %r4
	.word 0x8e5a0009  ! 3281: SMUL_R	smul 	%r8, %r9, %r7
	.word 0xc6c21009  ! 3282: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r3
	.word 0xccf21009  ! 3283: STXA_R	stxa	%r6, [%r8 + %r9] 0x80
	.word 0xfcca1009  ! 3284: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r30
	.word 0xe0da2f68  ! 3285: LDXA_I	ldxa	[%r8, + 0x0f68] %asi, %r16
	.word 0xa5a20929  ! 3286: FMULs	fmuls	%f8, %f9, %f18
	.word 0xc8220009  ! 3288: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc8420009  ! 3288: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xc47a0009  ! 3289: SWAP_R	swap	%r2, [%r8 + %r9]
	.word 0xc36a2170  ! 3290: PREFETCH_I	prefetch	[%r8 + 0x0170], #one_read
	.word 0x88722d90  ! 3291: UDIV_I	udiv 	%r8, 0x0d90, %r4
	.word 0xc4122608  ! 3292: LDUH_I	lduh	[%r8 + 0x0608], %r2
	.word 0xcc921009  ! 3293: LDUHA_R	lduha	[%r8, %r9] 0x80, %r6
	.word 0xf80a0009  ! 3294: LDUB_R	ldub	[%r8 + %r9], %r28
	.word 0xea5a2158  ! 3295: LDX_I	ldx	[%r8 + 0x0158], %r21
	.word 0xbf220009  ! 3296: MULScc_R	mulscc 	%r8, %r9, %r31
	.word 0xc24a0009  ! 3297: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xcf3a0009  ! 3299: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc4720009  ! 3300: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc64a0009  ! 3300: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xd6220009  ! 3302: STW_R	stw	%r11, [%r8 + %r9]
	.word 0xcd1a0009  ! 3302: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0x8143c000  ! 3303: STBAR	stbar
	.word 0x89a20929  ! 3304: FMULs	fmuls	%f8, %f9, %f4
	.word 0xee4a242c  ! 3305: LDSB_I	ldsb	[%r8 + 0x042c], %r23
	.word 0xea7a2d14  ! 3306: SWAP_I	swap	%r21, [%r8 + 0x0d14]
	.word 0xc3ea1009  ! 3307: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x8143e022  ! 3308: MEMBAR	membar	#StoreLoad | #MemIssue 
	.word 0x8143c000  ! 3309: STBAR	stbar
	.word 0xce320009  ! 3311: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc80a0009  ! 3311: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xc36a2dbc  ! 3312: PREFETCH_I	prefetch	[%r8 + 0x0dbc], #one_read
	.word 0xc8220009  ! 3314: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc6120009  ! 3314: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xecb2274c  ! 3315: STHA_I	stha	%r22, [%r8 + 0x074c] %asi
	.word 0xae7a0009  ! 3316: SDIV_R	sdiv 	%r8, %r9, %r23
	.word 0xc82a0009  ! 3318: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xe45a0009  ! 3318: LDX_R	ldx	[%r8 + %r9], %r18
	.word 0xc6da1009  ! 3319: LDXA_R	ldxa	[%r8, %r9] 0x80, %r3
	.word 0x8672290c  ! 3320: UDIV_I	udiv 	%r8, 0x090c, %r3
	.word 0x82520009  ! 3321: UMUL_R	umul 	%r8, %r9, %r1
	.word 0xc8da1009  ! 3322: LDXA_R	ldxa	[%r8, %r9] 0x80, %r4
	.word 0xcb222150  ! 3323: STF_I	st	%f5, [0x0150, %r8]
	.word 0xafa209a9  ! 3324: FDIVs	fdivs	%f8, %f9, %f23
	.word 0xce922e30  ! 3325: LDUHA_I	lduha	[%r8, + 0x0e30] %asi, %r7
	.word 0xe53a2238  ! 3326: STDF_I	std	%f18, [0x0238, %r8]
	.word 0x9a722d24  ! 3327: UDIV_I	udiv 	%r8, 0x0d24, %r13
	.word 0xc6aa20f8  ! 3328: STBA_I	stba	%r3, [%r8 + 0x00f8] %asi
	.word 0x04c20001  ! 3329: BRLEZ	brlez  ,nt	%8,<label_0x20001>
	.word 0xc4a21009  ! 3330: STWA_R	stwa	%r2, [%r8 + %r9] 0x80
	.word 0xc3ea1009  ! 3331: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x8143c000  ! 3332: STBAR	stbar
	.word 0xcb222034  ! 3333: STF_I	st	%f5, [0x0034, %r8]
	.word 0x8e6a28a4  ! 3334: UDIVX_I	udivx 	%r8, 0x08a4, %r7
	.word 0xdc220009  ! 3336: STW_R	stw	%r14, [%r8 + %r9]
	.word 0xc6420009  ! 3336: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0x9ba20829  ! 3337: FADDs	fadds	%f8, %f9, %f13
	.word 0x8143e001  ! 3338: MEMBAR	membar	#LoadLoad 
	.word 0xc8320009  ! 3340: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc71a0009  ! 3340: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0x8143c000  ! 3341: STBAR	stbar
	.word 0xca320009  ! 3343: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc8420009  ! 3343: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0x887a22fc  ! 3344: SDIV_I	sdiv 	%r8, 0x02fc, %r4
	.word 0xb4522578  ! 3345: UMUL_I	umul 	%r8, 0x0578, %r26
	.word 0x896a0009  ! 3346: SDIVX_R	sdivx	%r8, %r9, %r4
	.word 0x87a20929  ! 3347: FMULs	fmuls	%f8, %f9, %f3
	.word 0xc5e21009  ! 3348: CASA_I	casa	[%r8] 0x80, %r9, %r2
	.word 0x8143c000  ! 3349: STBAR	stbar
	.word 0x85222374  ! 3350: MULScc_I	mulscc 	%r8, 0x0374, %r2
	.word 0xc3ea2f28  ! 3351: PREFETCHA_I	prefetcha	[%r8, + 0x0f28] %asi, #one_read
	.word 0xc6b225c8  ! 3352: STHA_I	stha	%r3, [%r8 + 0x05c8] %asi
	.word 0xc71a0009  ! 3353: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xc25a2ec8  ! 3354: LDX_I	ldx	[%r8 + 0x0ec8], %r1
	.word 0xb7220009  ! 3355: MULScc_R	mulscc 	%r8, %r9, %r27
	.word 0xe9220009  ! 3357: STF_R	st	%f20, [%r9, %r8]
	.word 0xca720009  ! 3358: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xd8120009  ! 3358: LDUH_R	lduh	[%r8 + %r9], %r12
	.word 0xc3ea1009  ! 3359: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xbad22f10  ! 3360: UMULcc_I	umulcc 	%r8, 0x0f10, %r29
	.word 0xb04a258c  ! 3361: MULX_I	mulx 	%r8, 0x058c, %r24
	.word 0xdcba1009  ! 3362: STDA_R	stda	%r14, [%r8 + %r9] 0x80
	.word 0xc2ca1009  ! 3363: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r1
	.word 0xc4220009  ! 3365: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xcf020009  ! 3365: LDF_R	ld	[%r8, %r9], %f7
	.word 0xcea22ecc  ! 3366: STWA_I	stwa	%r7, [%r8 + 0x0ecc] %asi
	.word 0x88722158  ! 3367: UDIV_I	udiv 	%r8, 0x0158, %r4
	.word 0x8da20929  ! 3368: FMULs	fmuls	%f8, %f9, %f6
	.word 0xcc5a0009  ! 3369: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0x40000001  ! 3370: CALL	call	disp30_1
	.word 0xc3ea1009  ! 3371: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xcea21009  ! 3372: STWA_R	stwa	%r7, [%r8 + %r9] 0x80
	.word 0xc84a0009  ! 3373: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xccca2340  ! 3374: LDSBA_I	ldsba	[%r8, + 0x0340] %asi, %r6
	.word 0xc62a0009  ! 3376: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xec1a0009  ! 3376: LDD_R	ldd	[%r8 + %r9], %r22
	.word 0x1c800002  ! 3377: BPOS	bpos  	<label_0x2>
	.word 0x02800001  ! 3378: BE	be  	<label_0x1>
	.word 0x845a0009  ! 3379: SMUL_R	smul 	%r8, %r9, %r2
	.word 0x8f220009  ! 3380: MULScc_R	mulscc 	%r8, %r9, %r7
	.word 0xce720009  ! 3382: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xf7020009  ! 3382: LDF_R	ld	[%r8, %r9], %f27
	.word 0xd70221d0  ! 3383: LDF_I	ld	[%r8, 0x01d0], %f11
	.word 0xc8f21009  ! 3384: STXA_R	stxa	%r4, [%r8 + %r9] 0x80
	.word 0xc71a2558  ! 3385: LDDF_I	ldd	[%r8, 0x0558], %f3
	.word 0xced228b0  ! 3386: LDSHA_I	ldsha	[%r8, + 0x08b0] %asi, %r7
	.word 0xcc921009  ! 3387: LDUHA_R	lduha	[%r8, %r9] 0x80, %r6
	.word 0xc4a225a4  ! 3388: STWA_I	stwa	%r2, [%r8 + 0x05a4] %asi
	.word 0xc9222eb4  ! 3389: STF_I	st	%f4, [0x0eb4, %r8]
	.word 0x85a20829  ! 3390: FADDs	fadds	%f8, %f9, %f2
	.word 0x8143e062  ! 3391: MEMBAR	membar	#StoreLoad | #MemIssue | #Sync 
	.word 0xfa420009  ! 3392: LDSW_R	ldsw	[%r8 + %r9], %r29
	.word 0xdeb21009  ! 3393: STHA_R	stha	%r15, [%r8 + %r9] 0x80
	.word 0xa47a2090  ! 3394: SDIV_I	sdiv 	%r8, 0x0090, %r18
	.word 0xc88a2780  ! 3395: LDUBA_I	lduba	[%r8, + 0x0780] %asi, %r4
	.word 0x32800001  ! 3396: BNE	bne,a	<label_0x1>
	.word 0xd62a0009  ! 3398: STB_R	stb	%r11, [%r8 + %r9]
	.word 0xc2120009  ! 3398: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0x887a0009  ! 3399: SDIV_R	sdiv 	%r8, %r9, %r4
	.word 0xc36a0009  ! 3400: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc6b21009  ! 3401: STHA_R	stha	%r3, [%r8 + %r9] 0x80
	.word 0x40000001  ! 3402: CALL	call	disp30_1
	.word 0x99a208a9  ! 3403: FSUBs	fsubs	%f8, %f9, %f12
	.word 0xde7a2da4  ! 3404: SWAP_I	swap	%r15, [%r8 + 0x0da4]
	.word 0x8143c000  ! 3405: STBAR	stbar
	.word 0xd93a2ca8  ! 3406: STDF_I	std	%f12, [0x0ca8, %r8]
	.word 0xc64a2204  ! 3407: LDSB_I	ldsb	[%r8 + 0x0204], %r3
	.word 0x83a208a9  ! 3408: FSUBs	fsubs	%f8, %f9, %f1
	.word 0xd8320009  ! 3410: STH_R	sth	%r12, [%r8 + %r9]
	.word 0xca420009  ! 3410: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xcf3a0009  ! 3412: STDF_R	std	%f7, [%r9, %r8]
	.word 0xca720009  ! 3413: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc84a0009  ! 3413: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0x8143e015  ! 3414: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside 
	.word 0xde220009  ! 3416: STW_R	stw	%r15, [%r8 + %r9]
	.word 0xfa0a0009  ! 3416: LDUB_R	ldub	[%r8 + %r9], %r29
	.word 0x38800002  ! 3417: BGU	bgu,a	<label_0x2>
	.word 0xf5222540  ! 3418: STF_I	st	%f26, [0x0540, %r8]
	.word 0x8143c000  ! 3419: STBAR	stbar
	.word 0x8143e000  ! 3420: MEMBAR	membar	
	.word 0xcd0227a8  ! 3421: LDF_I	ld	[%r8, 0x07a8], %f6
	.word 0xe07a0009  ! 3422: SWAP_R	swap	%r16, [%r8 + %r9]
	.word 0x8ad20009  ! 3423: UMULcc_R	umulcc 	%r8, %r9, %r5
	.word 0x844a0009  ! 3424: MULX_R	mulx 	%r8, %r9, %r2
	.word 0x8a522258  ! 3425: UMUL_I	umul 	%r8, 0x0258, %r5
	.word 0xc36a25bc  ! 3426: PREFETCH_I	prefetch	[%r8 + 0x05bc], #one_read
	.word 0xfaea2594  ! 3427: LDSTUBA_I	ldstuba	%r29, [%r8 + 0x0594] %asi
	.word 0xd89a29e8  ! 3428: LDDA_I	ldda	[%r8, + 0x09e8] %asi, %r12
	.word 0xca122830  ! 3429: LDUH_I	lduh	[%r8 + 0x0830], %r5
	.word 0xc4320009  ! 3431: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xf9020009  ! 3431: LDF_R	ld	[%r8, %r9], %f28
	.word 0xc2520009  ! 3432: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0x8143e030  ! 3433: MEMBAR	membar	#Lookaside | #MemIssue 
	.word 0xda320009  ! 3435: STH_R	sth	%r13, [%r8 + %r9]
	.word 0xfe020009  ! 3435: LDUW_R	lduw	[%r8 + %r9], %r31
	.word 0x1e800001  ! 3436: BVC	bvc  	<label_0x1>
	.word 0x40000001  ! 3437: CALL	call	disp30_1
	.word 0xce220009  ! 3439: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xe41a0009  ! 3439: LDD_R	ldd	[%r8 + %r9], %r18
	.word 0xc0ba1009  ! 3440: STDA_R	stda	%r0, [%r8 + %r9] 0x80
	.word 0xc4320009  ! 3442: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xf81a0009  ! 3442: LDD_R	ldd	[%r8 + %r9], %r28
	.word 0xc6ea1009  ! 3443: LDSTUBA_R	ldstuba	%r3, [%r8 + %r9] 0x80
	.word 0xf0aa23b0  ! 3444: STBA_I	stba	%r24, [%r8 + 0x03b0] %asi
	.word 0xc3ea21b0  ! 3445: PREFETCHA_I	prefetcha	[%r8, + 0x01b0] %asi, #one_read
	.word 0xea0a26d8  ! 3446: LDUB_I	ldub	[%r8 + 0x06d8], %r21
	.word 0x8afa25d4  ! 3447: SDIVcc_I	sdivcc 	%r8, 0x05d4, %r5
	.word 0xc8d22528  ! 3448: LDSHA_I	ldsha	[%r8, + 0x0528] %asi, %r4
	.word 0xc3ea2934  ! 3449: PREFETCHA_I	prefetcha	[%r8, + 0x0934] %asi, #one_read
	.word 0xc36a2464  ! 3450: PREFETCH_I	prefetch	[%r8 + 0x0464], #one_read
	.word 0xc40a2edc  ! 3451: LDUB_I	ldub	[%r8 + 0x0edc], %r2
	.word 0xcb220009  ! 3453: STF_R	st	%f5, [%r9, %r8]
	.word 0xc6720009  ! 3454: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xdc5a0009  ! 3454: LDX_R	ldx	[%r8 + %r9], %r14
	.word 0x10800001  ! 3455: BA	ba  	<label_0x1>
	.word 0xc67a28d4  ! 3456: SWAP_I	swap	%r3, [%r8 + 0x08d4]
	.word 0xc36a2d1c  ! 3457: PREFETCH_I	prefetch	[%r8 + 0x0d1c], #one_read
	.word 0x8da208a9  ! 3458: FSUBs	fsubs	%f8, %f9, %f6
	.word 0xcd2224f0  ! 3459: STF_I	st	%f6, [0x04f0, %r8]
	.word 0x8143c000  ! 3460: STBAR	stbar
	.word 0xc67a2c84  ! 3461: SWAP_I	swap	%r3, [%r8 + 0x0c84]
	.word 0xc4022558  ! 3462: LDUW_I	lduw	[%r8 + 0x0558], %r2
	.word 0x8cd20009  ! 3463: UMULcc_R	umulcc 	%r8, %r9, %r6
	.word 0x8143c000  ! 3464: STBAR	stbar
	.word 0x26ca0001  ! 3465: BRLZ	brlz,a,pt	%8,<label_0xa0001>
	.word 0x8143c000  ! 3466: STBAR	stbar
	.word 0xe86a2870  ! 3467: LDSTUB_I	ldstub	%r20, [%r8 + 0x0870]
	.word 0xc62a0009  ! 3469: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xce420009  ! 3469: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xca320009  ! 3471: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xe44a0009  ! 3471: LDSB_R	ldsb	[%r8 + %r9], %r18
	.word 0x8ba208a9  ! 3472: FSUBs	fsubs	%f8, %f9, %f5
	.word 0xcc6a2068  ! 3473: LDSTUB_I	ldstub	%r6, [%r8 + 0x0068]
	.word 0x8ad20009  ! 3474: UMULcc_R	umulcc 	%r8, %r9, %r5
	.word 0xc9e22009  ! 3475: CASA_R	casa	[%r8] %asi, %r9, %r4
	.word 0x8143c000  ! 3476: STBAR	stbar
	.word 0xf88a1009  ! 3477: LDUBA_R	lduba	[%r8, %r9] 0x80, %r28
	.word 0xc4720009  ! 3479: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc8520009  ! 3479: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xdaf21009  ! 3480: STXA_R	stxa	%r13, [%r8 + %r9] 0x80
	.word 0x00800002  ! 3481: BN	bn  	<label_0x2>
	.word 0xa85a0009  ! 3482: SMUL_R	smul 	%r8, %r9, %r20
	.word 0xdbe22009  ! 3483: CASA_R	casa	[%r8] %asi, %r9, %r13
	.word 0x99220009  ! 3484: MULScc_R	mulscc 	%r8, %r9, %r12
	.word 0xcf020009  ! 3485: LDF_R	ld	[%r8, %r9], %f7
	.word 0x9ba209a9  ! 3486: FDIVs	fdivs	%f8, %f9, %f13
	.word 0x8143c000  ! 3487: STBAR	stbar
	.word 0xc2220009  ! 3489: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc51a0009  ! 3489: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xe6320009  ! 3491: STH_R	sth	%r19, [%r8 + %r9]
	.word 0xcd1a0009  ! 3491: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0x40000001  ! 3492: CALL	call	disp30_1
	.word 0xc8a21009  ! 3493: STWA_R	stwa	%r4, [%r8 + %r9] 0x80
	.word 0xc36a0009  ! 3494: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0x0c800001  ! 3495: BNEG	bneg  	<label_0x1>
	.word 0x06ca0001  ! 3496: BRLZ	brlz  ,pt	%8,<label_0xa0001>
	.word 0xc3222d90  ! 3497: STF_I	st	%f1, [0x0d90, %r8]
	.word 0xc6aa223c  ! 3498: STBA_I	stba	%r3, [%r8 + 0x023c] %asi
	.word 0xc3ea1009  ! 3499: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc2aa2134  ! 3500: STBA_I	stba	%r1, [%r8 + 0x0134] %asi
	.word 0xc9e21009  ! 3501: CASA_I	casa	[%r8] 0x80, %r9, %r4
	.word 0xa44a0009  ! 3502: MULX_R	mulx 	%r8, %r9, %r18
	.word 0xc6d22994  ! 3503: LDSHA_I	ldsha	[%r8, + 0x0994] %asi, %r3
	.word 0x8eda0009  ! 3504: SMULcc_R	smulcc 	%r8, %r9, %r7
	.word 0xc5f21009  ! 3505: CASXA_I	casxa	[%r8] 0x80, %r9, %r2
	.word 0x06800001  ! 3506: BL	bl  	<label_0x1>
	.word 0x8143c000  ! 3507: STBAR	stbar
	.word 0xce12271c  ! 3508: LDUH_I	lduh	[%r8 + 0x071c], %r7
	.word 0xe62a0009  ! 3510: STB_R	stb	%r19, [%r8 + %r9]
	.word 0xc80a0009  ! 3510: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0x8e520009  ! 3511: UMUL_R	umul 	%r8, %r9, %r7
	.word 0x8143c000  ! 3512: STBAR	stbar
	.word 0xca420009  ! 3513: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xcb3a0009  ! 3515: STDF_R	std	%f5, [%r9, %r8]
	.word 0xca720009  ! 3516: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xf8020009  ! 3516: LDUW_R	lduw	[%r8 + %r9], %r28
	.word 0x84fa2434  ! 3517: SDIVcc_I	sdivcc 	%r8, 0x0434, %r2
	.word 0x8e520009  ! 3518: UMUL_R	umul 	%r8, %r9, %r7
	.word 0xccfa1009  ! 3519: SWAPA_R	swapa	%r6, [%r8 + %r9] 0x80
	.word 0xc4821009  ! 3520: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r2
	.word 0xc73a0009  ! 3522: STDF_R	std	%f3, [%r9, %r8]
	.word 0xee720009  ! 3523: STX_R	stx	%r23, [%r8 + %r9]
	.word 0xf4020009  ! 3523: LDUW_R	lduw	[%r8 + %r9], %r26
	.word 0xc7220009  ! 3525: STF_R	st	%f3, [%r9, %r8]
	.word 0xcc720009  ! 3526: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xf8020009  ! 3526: LDUW_R	lduw	[%r8 + %r9], %r28
	.word 0xc3222ab0  ! 3527: STF_I	st	%f1, [0x0ab0, %r8]
	.word 0xce220009  ! 3529: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc60a0009  ! 3529: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xc2b21009  ! 3530: STHA_R	stha	%r1, [%r8 + %r9] 0x80
	.word 0x8143e023  ! 3531: MEMBAR	membar	#LoadLoad | #StoreLoad | #MemIssue 
	.word 0xca2a0009  ! 3533: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xcc4a0009  ! 3533: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0x12800001  ! 3534: BNE	bne  	<label_0x1>
	.word 0xc3ea1009  ! 3535: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x846a0009  ! 3536: UDIVX_R	udivx 	%r8, %r9, %r2
	.word 0xd8aa1009  ! 3537: STBA_R	stba	%r12, [%r8 + %r9] 0x80
	.word 0xfc320009  ! 3539: STH_R	sth	%r30, [%r8 + %r9]
	.word 0xdc520009  ! 3539: LDSH_R	ldsh	[%r8 + %r9], %r14
	.word 0x867a2690  ! 3540: SDIV_I	sdiv 	%r8, 0x0690, %r3
	.word 0x8143e024  ! 3541: MEMBAR	membar	#LoadStore | #MemIssue 
	.word 0xe0320009  ! 3543: STH_R	sth	%r16, [%r8 + %r9]
	.word 0xc81a0009  ! 3543: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x86522fa8  ! 3544: UMUL_I	umul 	%r8, 0x0fa8, %r3
	.word 0xcaaa1009  ! 3545: STBA_R	stba	%r5, [%r8 + %r9] 0x80
	.word 0x84d20009  ! 3546: UMULcc_R	umulcc 	%r8, %r9, %r2
	.word 0x02800001  ! 3547: BE	be  	<label_0x1>
	.word 0x14800001  ! 3548: BG	bg  	<label_0x1>
	.word 0xcb2220e8  ! 3549: STF_I	st	%f5, [0x00e8, %r8]
	.word 0xbd6a0009  ! 3550: SDIVX_R	sdivx	%r8, %r9, %r30
	.word 0xe2da1009  ! 3551: LDXA_R	ldxa	[%r8, %r9] 0x80, %r17
	.word 0xc3ea1009  ! 3552: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xe42a0009  ! 3554: STB_R	stb	%r18, [%r8 + %r9]
	.word 0xc7020009  ! 3554: LDF_R	ld	[%r8, %r9], %f3
	.word 0xc6ea1009  ! 3555: LDSTUBA_R	ldstuba	%r3, [%r8 + %r9] 0x80
	.word 0xb07222f0  ! 3556: UDIV_I	udiv 	%r8, 0x02f0, %r24
	.word 0x8da20829  ! 3557: FADDs	fadds	%f8, %f9, %f6
	.word 0xcc6a2064  ! 3558: LDSTUB_I	ldstub	%r6, [%r8 + 0x0064]
	.word 0xc36a2c80  ! 3559: PREFETCH_I	prefetch	[%r8 + 0x0c80], #one_read
	.word 0x88fa0009  ! 3560: SDIVcc_R	sdivcc 	%r8, %r9, %r4
	.word 0xd9020009  ! 3561: LDF_R	ld	[%r8, %r9], %f12
	.word 0x8e4a20ac  ! 3562: MULX_I	mulx 	%r8, 0x00ac, %r7
	.word 0xc6320009  ! 3564: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xcd1a0009  ! 3564: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xf1f22009  ! 3565: CASXA_R	casxa	[%r8]%asi, %r9, %r24
	.word 0x826a0009  ! 3566: UDIVX_R	udivx 	%r8, %r9, %r1
	.word 0xe8422120  ! 3567: LDSW_I	ldsw	[%r8 + 0x0120], %r20
	.word 0xcefa2718  ! 3568: SWAPA_I	swapa	%r7, [%r8 + 0x0718] %asi
	.word 0xc4220009  ! 3570: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xe60a0009  ! 3570: LDUB_R	ldub	[%r8 + %r9], %r19
	.word 0x8d6a2590  ! 3571: SDIVX_I	sdivx	%r8, 0x0590, %r6
	.word 0xc3220009  ! 3573: STF_R	st	%f1, [%r9, %r8]
	.word 0xc4720009  ! 3574: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xce120009  ! 3574: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xf73a2908  ! 3575: STDF_I	std	%f27, [0x0908, %r8]
	.word 0x8143e033  ! 3576: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside | #MemIssue 
	.word 0x86d222b4  ! 3577: UMULcc_I	umulcc 	%r8, 0x02b4, %r3
	.word 0xc6c21009  ! 3578: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r3
	.word 0x8cf22aa0  ! 3579: UDIVcc_I	udivcc 	%r8, 0x0aa0, %r6
	.word 0xc6220009  ! 3581: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xca120009  ! 3581: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xe0320009  ! 3583: STH_R	sth	%r16, [%r8 + %r9]
	.word 0xe2520009  ! 3583: LDSH_R	ldsh	[%r8 + %r9], %r17
	.word 0xc6ea1009  ! 3584: LDSTUBA_R	ldstuba	%r3, [%r8 + %r9] 0x80
	.word 0x32800002  ! 3585: BNE	bne,a	<label_0x2>
	.word 0xc36a21f4  ! 3586: PREFETCH_I	prefetch	[%r8 + 0x01f4], #one_read
	.word 0xc33a0009  ! 3588: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc2720009  ! 3589: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xce520009  ! 3589: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0x864a0009  ! 3590: MULX_R	mulx 	%r8, %r9, %r3
	.word 0x8143c000  ! 3591: STBAR	stbar
	.word 0xf2922d10  ! 3592: LDUHA_I	lduha	[%r8, + 0x0d10] %asi, %r25
	.word 0x8143e05c  ! 3593: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0x8143e00b  ! 3594: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore 
	.word 0x8143e059  ! 3595: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside | #Sync 
	.word 0x8143e05e  ! 3596: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0xdde22009  ! 3597: CASA_R	casa	[%r8] %asi, %r9, %r14
	.word 0xc45a2a68  ! 3598: LDX_I	ldx	[%r8 + 0x0a68], %r2
	.word 0xcd3a2568  ! 3599: STDF_I	std	%f6, [0x0568, %r8]
	.word 0xfc020009  ! 3600: LDUW_R	lduw	[%r8 + %r9], %r30
	.word 0xce220009  ! 3602: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xdf020009  ! 3602: LDF_R	ld	[%r8, %r9], %f15
	.word 0xcc320009  ! 3604: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xf8520009  ! 3604: LDSH_R	ldsh	[%r8 + %r9], %r28
	.word 0xce320009  ! 3606: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xf81a0009  ! 3606: LDD_R	ldd	[%r8 + %r9], %r28
	.word 0xc6ea1009  ! 3607: LDSTUBA_R	ldstuba	%r3, [%r8 + %r9] 0x80
	.word 0xc4da1009  ! 3608: LDXA_R	ldxa	[%r8, %r9] 0x80, %r2
	.word 0x8e520009  ! 3609: UMUL_R	umul 	%r8, %r9, %r7
	.word 0x8143c000  ! 3610: STBAR	stbar
	.word 0x845a0009  ! 3611: SMUL_R	smul 	%r8, %r9, %r2
	.word 0xf40221c0  ! 3612: LDUW_I	lduw	[%r8 + 0x01c0], %r26
	.word 0xf3220009  ! 3614: STF_R	st	%f25, [%r9, %r8]
	.word 0xc8720009  ! 3615: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc24a0009  ! 3615: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xef3a2a08  ! 3616: STDF_I	std	%f23, [0x0a08, %r8]
	.word 0xccba1009  ! 3617: STDA_R	stda	%r6, [%r8 + %r9] 0x80
	.word 0xca2a0009  ! 3619: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xda020009  ! 3619: LDUW_R	lduw	[%r8 + %r9], %r13
	.word 0xc36a20e8  ! 3620: PREFETCH_I	prefetch	[%r8 + 0x00e8], #one_read
	.word 0xa1a20929  ! 3621: FMULs	fmuls	%f8, %f9, %f16
	.word 0x836a0009  ! 3622: SDIVX_R	sdivx	%r8, %r9, %r1
	.word 0xc36a0009  ! 3623: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xfc4221e0  ! 3624: LDSW_I	ldsw	[%r8 + 0x01e0], %r30
	.word 0xc73a22b0  ! 3625: STDF_I	std	%f3, [0x02b0, %r8]
	.word 0xc3ea1009  ! 3626: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x8143c000  ! 3627: STBAR	stbar
	.word 0xc3ea2f38  ! 3628: PREFETCHA_I	prefetcha	[%r8, + 0x0f38] %asi, #one_read
	.word 0xccaa2b28  ! 3629: STBA_I	stba	%r6, [%r8 + 0x0b28] %asi
	.word 0xdd222294  ! 3630: STF_I	st	%f14, [0x0294, %r8]
	.word 0x40000001  ! 3631: CALL	call	disp30_1
	.word 0x0cca0001  ! 3632: BRGZ	brgz  ,pt	%8,<label_0xa0001>
	.word 0x8143c000  ! 3633: STBAR	stbar
	.word 0xc33a2640  ! 3634: STDF_I	std	%f1, [0x0640, %r8]
	.word 0x24800002  ! 3635: BLE	ble,a	<label_0x2>
	.word 0x34800002  ! 3636: BG	bg,a	<label_0x2>
	.word 0xc81a2858  ! 3637: LDD_I	ldd	[%r8 + 0x0858], %r4
	.word 0xc8ba1009  ! 3638: STDA_R	stda	%r4, [%r8 + %r9] 0x80
	.word 0xce220009  ! 3640: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc64a0009  ! 3640: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0x1a800002  ! 3641: BCC	bcc  	<label_0x2>
	.word 0xdab22d84  ! 3642: STHA_I	stha	%r13, [%r8 + 0x0d84] %asi
	.word 0xcfe21009  ! 3643: CASA_I	casa	[%r8] 0x80, %r9, %r7
	.word 0x8ada2068  ! 3644: SMULcc_I	smulcc 	%r8, 0x0068, %r5
	.word 0xc36a2df8  ! 3645: PREFETCH_I	prefetch	[%r8 + 0x0df8], #one_read
	.word 0xfc9a2760  ! 3646: LDDA_I	ldda	[%r8, + 0x0760] %asi, %r30
	.word 0xc7e22009  ! 3647: CASA_R	casa	[%r8] %asi, %r9, %r3
	.word 0xca2a0009  ! 3649: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xd9020009  ! 3649: LDF_R	ld	[%r8, %r9], %f12
	.word 0x8143c000  ! 3650: STBAR	stbar
	.word 0xe4b224c0  ! 3651: STHA_I	stha	%r18, [%r8 + 0x04c0] %asi
	.word 0xceaa2848  ! 3652: STBA_I	stba	%r7, [%r8 + 0x0848] %asi
	.word 0xcefa27f8  ! 3653: SWAPA_I	swapa	%r7, [%r8 + 0x07f8] %asi
	.word 0xdefa1009  ! 3654: SWAPA_R	swapa	%r15, [%r8 + %r9] 0x80
	.word 0xc8120009  ! 3655: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xcc320009  ! 3657: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xff1a0009  ! 3657: LDDF_R	ldd	[%r8, %r9], %f31
	.word 0x8ada0009  ! 3658: SMULcc_R	smulcc 	%r8, %r9, %r5
	.word 0xc6821009  ! 3659: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r3
	.word 0xe0f22a68  ! 3660: STXA_I	stxa	%r16, [%r8 + 0x0a68] %asi
	.word 0xc8f224c0  ! 3661: STXA_I	stxa	%r4, [%r8 + 0x04c0] %asi
	.word 0xc3ea2bdc  ! 3662: PREFETCHA_I	prefetcha	[%r8, + 0x0bdc] %asi, #one_read
	.word 0xcaea1009  ! 3663: LDSTUBA_R	ldstuba	%r5, [%r8 + %r9] 0x80
	.word 0xd6120009  ! 3664: LDUH_R	lduh	[%r8 + %r9], %r11
	.word 0xc6da1009  ! 3665: LDXA_R	ldxa	[%r8, %r9] 0x80, %r3
	.word 0xbd6a2fd0  ! 3666: SDIVX_I	sdivx	%r8, 0x0fd0, %r30
	.word 0xce220009  ! 3668: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc71a0009  ! 3668: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xc2220009  ! 3670: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xcd1a0009  ! 3670: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xc2922848  ! 3671: LDUHA_I	lduha	[%r8, + 0x0848] %asi, %r1
	.word 0xc4522a74  ! 3672: LDSH_I	ldsh	[%r8 + 0x0a74], %r2
	.word 0xb05a27fc  ! 3673: SMUL_I	smul 	%r8, 0x07fc, %r24
	.word 0x8143c000  ! 3674: STBAR	stbar
	.word 0x8a4a0009  ! 3675: MULX_R	mulx 	%r8, %r9, %r5
	.word 0xc6320009  ! 3677: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xcc120009  ! 3677: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0x02c20001  ! 3678: BRZ	brz  ,nt	%8,<label_0x20001>
	.word 0x8143e062  ! 3679: MEMBAR	membar	#StoreLoad | #MemIssue | #Sync 
	.word 0x8afa2f34  ! 3680: SDIVcc_I	sdivcc 	%r8, 0x0f34, %r5
	.word 0x884a230c  ! 3681: MULX_I	mulx 	%r8, 0x030c, %r4
	.word 0xc22a0009  ! 3683: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xce120009  ! 3683: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xc8ea27d8  ! 3684: LDSTUBA_I	ldstuba	%r4, [%r8 + 0x07d8] %asi
	.word 0x85a20829  ! 3685: FADDs	fadds	%f8, %f9, %f2
	.word 0xae7a0009  ! 3686: SDIV_R	sdiv 	%r8, %r9, %r23
	.word 0x9f6a0009  ! 3687: SDIVX_R	sdivx	%r8, %r9, %r15
	.word 0x10800001  ! 3688: BA	ba  	<label_0x1>
	.word 0x8143c000  ! 3689: STBAR	stbar
	.word 0xf4f22fe0  ! 3690: STXA_I	stxa	%r26, [%r8 + 0x0fe0] %asi
	.word 0x40000001  ! 3691: CALL	call	disp30_1
	.word 0xda320009  ! 3693: STH_R	sth	%r13, [%r8 + %r9]
	.word 0xc4520009  ! 3693: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xc8220009  ! 3695: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xcb020009  ! 3695: LDF_R	ld	[%r8, %r9], %f5
	.word 0xc2d21009  ! 3696: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r1
	.word 0x96522c68  ! 3697: UMUL_I	umul 	%r8, 0x0c68, %r11
	.word 0xe3220009  ! 3699: STF_R	st	%f17, [%r9, %r8]
	.word 0xc6720009  ! 3700: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc64a0009  ! 3700: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xc3ea2fac  ! 3701: PREFETCHA_I	prefetcha	[%r8, + 0x0fac] %asi, #one_read
	.word 0xc3ea2818  ! 3702: PREFETCHA_I	prefetcha	[%r8, + 0x0818] %asi, #one_read
	.word 0x8143e025  ! 3703: MEMBAR	membar	#LoadLoad | #LoadStore | #MemIssue 
	.word 0xe6d22184  ! 3704: LDSHA_I	ldsha	[%r8, + 0x0184] %asi, %r19
	.word 0xce320009  ! 3706: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xcb1a0009  ! 3706: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xc28a294c  ! 3707: LDUBA_I	lduba	[%r8, + 0x094c] %asi, %r1
	.word 0x0ac20001  ! 3708: BRNZ	brnz  ,nt	%8,<label_0x20001>
	.word 0xf2320009  ! 3710: STH_R	sth	%r25, [%r8 + %r9]
	.word 0xce4a0009  ! 3710: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0x864a0009  ! 3711: MULX_R	mulx 	%r8, %r9, %r3
	.word 0x8143e05c  ! 3712: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0x8143e041  ! 3713: MEMBAR	membar	#LoadLoad | #Sync 
	.word 0x88720009  ! 3714: UDIV_R	udiv 	%r8, %r9, %r4
	.word 0xb5a208a9  ! 3715: FSUBs	fsubs	%f8, %f9, %f26
	.word 0xc64a0009  ! 3716: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xea220009  ! 3718: STW_R	stw	%r21, [%r8 + %r9]
	.word 0xc65a0009  ! 3718: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0x32800001  ! 3719: BNE	bne,a	<label_0x1>
	.word 0xccaa2148  ! 3720: STBA_I	stba	%r6, [%r8 + 0x0148] %asi
	.word 0xe2220009  ! 3722: STW_R	stw	%r17, [%r8 + %r9]
	.word 0xc91a0009  ! 3722: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xc6220009  ! 3724: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xcc1a0009  ! 3724: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xcc7a0009  ! 3725: SWAP_R	swap	%r6, [%r8 + %r9]
	.word 0x8e6a0009  ! 3726: UDIVX_R	udivx 	%r8, %r9, %r7
	.word 0xf4ba1009  ! 3727: STDA_R	stda	%r26, [%r8 + %r9] 0x80
	.word 0x36800001  ! 3728: BGE	bge,a	<label_0x1>
	.word 0xf4220009  ! 3730: STW_R	stw	%r26, [%r8 + %r9]
	.word 0xce520009  ! 3730: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xc6b22d74  ! 3731: STHA_I	stha	%r3, [%r8 + 0x0d74] %asi
	.word 0xc36a0009  ! 3732: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xcb3a28b8  ! 3733: STDF_I	std	%f5, [0x08b8, %r8]
	.word 0xbada2a90  ! 3734: SMULcc_I	smulcc 	%r8, 0x0a90, %r29
	.word 0xdc9a2fb8  ! 3735: LDDA_I	ldda	[%r8, + 0x0fb8] %asi, %r14
	.word 0x8cf22ae0  ! 3736: UDIVcc_I	udivcc 	%r8, 0x0ae0, %r6
	.word 0x8143e041  ! 3737: MEMBAR	membar	#LoadLoad | #Sync 
	.word 0x8c6a24a0  ! 3738: UDIVX_I	udivx 	%r8, 0x04a0, %r6
	.word 0x82fa0009  ! 3739: SDIVcc_R	sdivcc 	%r8, %r9, %r1
	.word 0xc51a0009  ! 3740: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0x8ba209a9  ! 3741: FDIVs	fdivs	%f8, %f9, %f5
	.word 0x00800001  ! 3742: BN	bn  	<label_0x1>
	.word 0xed3a0009  ! 3744: STDF_R	std	%f22, [%r9, %r8]
	.word 0xca720009  ! 3745: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc4520009  ! 3745: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0x8143c000  ! 3746: STBAR	stbar
	.word 0x89a20929  ! 3747: FMULs	fmuls	%f8, %f9, %f4
	.word 0xe31a0009  ! 3748: LDDF_R	ldd	[%r8, %r9], %f17
	.word 0xc3f22009  ! 3749: CASXA_R	casxa	[%r8]%asi, %r9, %r1
	.word 0x8143c000  ! 3750: STBAR	stbar
	.word 0x06800002  ! 3751: BL	bl  	<label_0x2>
	.word 0xcf3a2a70  ! 3752: STDF_I	std	%f7, [0x0a70, %r8]
	.word 0xe93a0009  ! 3754: STDF_R	std	%f20, [%r9, %r8]
	.word 0xfe720009  ! 3755: STX_R	stx	%r31, [%r8 + %r9]
	.word 0xcd1a0009  ! 3755: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0x8143c000  ! 3756: STBAR	stbar
	.word 0xcc8a1009  ! 3757: LDUBA_R	lduba	[%r8, %r9] 0x80, %r6
	.word 0xcaea2854  ! 3758: LDSTUBA_I	ldstuba	%r5, [%r8 + 0x0854] %asi
	.word 0xc3ea27bc  ! 3759: PREFETCHA_I	prefetcha	[%r8, + 0x07bc] %asi, #one_read
	.word 0xfb222f54  ! 3760: STF_I	st	%f29, [0x0f54, %r8]
	.word 0xc8d22058  ! 3761: LDSHA_I	ldsha	[%r8, + 0x0058] %asi, %r4
	.word 0xd65a28c8  ! 3762: LDX_I	ldx	[%r8 + 0x08c8], %r11
	.word 0x8e520009  ! 3763: UMUL_R	umul 	%r8, %r9, %r7
	.word 0xc6aa1009  ! 3764: STBA_R	stba	%r3, [%r8 + %r9] 0x80
	.word 0xc49a2980  ! 3765: LDDA_I	ldda	[%r8, + 0x0980] %asi, %r2
	.word 0xc36a0009  ! 3766: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0x8da20829  ! 3767: FADDs	fadds	%f8, %f9, %f6
	.word 0x8efa23c8  ! 3768: SDIVcc_I	sdivcc 	%r8, 0x03c8, %r7
	.word 0x984a0009  ! 3769: MULX_R	mulx 	%r8, %r9, %r12
	.word 0x865a2220  ! 3770: SMUL_I	smul 	%r8, 0x0220, %r3
	.word 0x86fa0009  ! 3771: SDIVcc_R	sdivcc 	%r8, %r9, %r3
	.word 0xfe320009  ! 3773: STH_R	sth	%r31, [%r8 + %r9]
	.word 0xe3020009  ! 3773: LDF_R	ld	[%r8, %r9], %f17
	.word 0x18800001  ! 3774: BGU	bgu  	<label_0x1>
	.word 0xc3ea1009  ! 3775: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x24800001  ! 3776: BLE	ble,a	<label_0x1>
	.word 0xfe8a2598  ! 3777: LDUBA_I	lduba	[%r8, + 0x0598] %asi, %r31
	.word 0x8143c000  ! 3778: STBAR	stbar
	.word 0xc7222748  ! 3779: STF_I	st	%f3, [0x0748, %r8]
	.word 0x00800001  ! 3780: BN	bn  	<label_0x1>
	.word 0xc8ca2bf8  ! 3781: LDSBA_I	ldsba	[%r8, + 0x0bf8] %asi, %r4
	.word 0x26800002  ! 3782: BL	bl,a	<label_0x2>
	.word 0xc9220009  ! 3784: STF_R	st	%f4, [%r9, %r8]
	.word 0xc2720009  ! 3785: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xdc020009  ! 3785: LDUW_R	lduw	[%r8 + %r9], %r14
	.word 0xaed20009  ! 3786: UMULcc_R	umulcc 	%r8, %r9, %r23
	.word 0xcc220009  ! 3788: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xcc020009  ! 3788: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xf2c22d70  ! 3789: LDSWA_I	ldswa	[%r8, + 0x0d70] %asi, %r25
	.word 0xc8220009  ! 3791: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc2420009  ! 3791: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0x896a2958  ! 3792: SDIVX_I	sdivx	%r8, 0x0958, %r4
	.word 0x8c6a0009  ! 3793: UDIVX_R	udivx 	%r8, %r9, %r6
	.word 0xc36a2aac  ! 3794: PREFETCH_I	prefetch	[%r8 + 0x0aac], #one_read
	.word 0x8d6a0009  ! 3795: SDIVX_R	sdivx	%r8, %r9, %r6
	.word 0x8143c000  ! 3796: STBAR	stbar
	.word 0x887a0009  ! 3797: SDIV_R	sdiv 	%r8, %r9, %r4
	.word 0xc0ba1009  ! 3798: STDA_R	stda	%r0, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 3799: STBAR	stbar
	.word 0xc8ea2eb0  ! 3800: LDSTUBA_I	ldstuba	%r4, [%r8 + 0x0eb0] %asi
	.word 0xc88a2ac0  ! 3801: LDUBA_I	lduba	[%r8, + 0x0ac0] %asi, %r4
	.word 0xc4da2040  ! 3802: LDXA_I	ldxa	[%r8, + 0x0040] %asi, %r2
	.word 0xc36a297c  ! 3803: PREFETCH_I	prefetch	[%r8 + 0x097c], #one_read
	.word 0xc60a202c  ! 3804: LDUB_I	ldub	[%r8 + 0x002c], %r3
	.word 0x8da20929  ! 3805: FMULs	fmuls	%f8, %f9, %f6
	.word 0xc4ea2190  ! 3806: LDSTUBA_I	ldstuba	%r2, [%r8 + 0x0190] %asi
	.word 0xc66a25d8  ! 3807: LDSTUB_I	ldstub	%r3, [%r8 + 0x05d8]
	.word 0xc3ea1009  ! 3808: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xca4a23c8  ! 3809: LDSB_I	ldsb	[%r8 + 0x03c8], %r5
	.word 0xc2f22ae0  ! 3810: STXA_I	stxa	%r1, [%r8 + 0x0ae0] %asi
	.word 0xe0da1009  ! 3811: LDXA_R	ldxa	[%r8, %r9] 0x80, %r16
	.word 0x986a27d0  ! 3812: UDIVX_I	udivx 	%r8, 0x07d0, %r12
	.word 0xdc8a1009  ! 3813: LDUBA_R	lduba	[%r8, %r9] 0x80, %r14
	.word 0xc5222af8  ! 3814: STF_I	st	%f2, [0x0af8, %r8]
	.word 0xca220009  ! 3816: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xdc020009  ! 3816: LDUW_R	lduw	[%r8 + %r9], %r14
	.word 0x3a800002  ! 3817: BCC	bcc,a	<label_0x2>
	.word 0xe01a2100  ! 3818: LDD_I	ldd	[%r8 + 0x0100], %r16
	.word 0xc8b21009  ! 3819: STHA_R	stha	%r4, [%r8 + %r9] 0x80
	.word 0x8af226d8  ! 3820: UDIVcc_I	udivcc 	%r8, 0x06d8, %r5
	.word 0xf4b22c44  ! 3821: STHA_I	stha	%r26, [%r8 + 0x0c44] %asi
	.word 0x14800001  ! 3822: BG	bg  	<label_0x1>
	.word 0xcd3a0009  ! 3824: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc8720009  ! 3825: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xca5a0009  ! 3825: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0x83a208a9  ! 3826: FSUBs	fsubs	%f8, %f9, %f1
	.word 0xc64a0009  ! 3827: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xc3ea1009  ! 3828: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x85a208a9  ! 3829: FSUBs	fsubs	%f8, %f9, %f2
	.word 0xc4aa2598  ! 3830: STBA_I	stba	%r2, [%r8 + 0x0598] %asi
	.word 0x8143e06a  ! 3831: MEMBAR	membar	#StoreLoad | #StoreStore | #MemIssue | #Sync 
	.word 0xc8122788  ! 3832: LDUH_I	lduh	[%r8 + 0x0788], %r4
	.word 0x825a0009  ! 3833: SMUL_R	smul 	%r8, %r9, %r1
	.word 0xec220009  ! 3835: STW_R	stw	%r22, [%r8 + %r9]
	.word 0xc25a0009  ! 3835: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xa56a2898  ! 3836: SDIVX_I	sdivx	%r8, 0x0898, %r18
	.word 0xc3ea1009  ! 3837: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xcc8a1009  ! 3838: LDUBA_R	lduba	[%r8, %r9] 0x80, %r6
	.word 0x0e800001  ! 3839: BVS	bvs  	<label_0x1>
	.word 0xfcba1009  ! 3840: STDA_R	stda	%r30, [%r8 + %r9] 0x80
	.word 0xe2220009  ! 3842: STW_R	stw	%r17, [%r8 + %r9]
	.word 0xce420009  ! 3842: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0x887a0009  ! 3843: SDIV_R	sdiv 	%r8, %r9, %r4
	.word 0xf41a2d60  ! 3844: LDD_I	ldd	[%r8 + 0x0d60], %r26
	.word 0xc82a0009  ! 3846: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xca120009  ! 3846: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0x24ca0001  ! 3847: BRLEZ	brlez,a,pt	%8,<label_0xa0001>
	.word 0xcf022760  ! 3848: LDF_I	ld	[%r8, 0x0760], %f7
	.word 0xa2fa0009  ! 3849: SDIVcc_R	sdivcc 	%r8, %r9, %r17
	.word 0xc90224a8  ! 3850: LDF_I	ld	[%r8, 0x04a8], %f4
	.word 0xc64a260c  ! 3851: LDSB_I	ldsb	[%r8 + 0x060c], %r3
	.word 0xb5a208a9  ! 3852: FSUBs	fsubs	%f8, %f9, %f26
	.word 0xc49a2ad8  ! 3853: LDDA_I	ldda	[%r8, + 0x0ad8] %asi, %r2
	.word 0xc8220009  ! 3855: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xce120009  ! 3855: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xca92286c  ! 3856: LDUHA_I	lduha	[%r8, + 0x086c] %asi, %r5
	.word 0xccca1009  ! 3857: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r6
	.word 0xfafa22c4  ! 3858: SWAPA_I	swapa	%r29, [%r8 + 0x02c4] %asi
	.word 0x8143e03e  ! 3859: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0xc62a0009  ! 3861: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xe8020009  ! 3861: LDUW_R	lduw	[%r8 + %r9], %r20
	.word 0xcac22678  ! 3862: LDSWA_I	ldswa	[%r8, + 0x0678] %asi, %r5
	.word 0xc2ca2898  ! 3863: LDSBA_I	ldsba	[%r8, + 0x0898] %asi, %r1
	.word 0xc8220009  ! 3865: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xce120009  ! 3865: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0x84da0009  ! 3866: SMULcc_R	smulcc 	%r8, %r9, %r2
	.word 0xc6ca20cc  ! 3867: LDSBA_I	ldsba	[%r8, + 0x00cc] %asi, %r3
	.word 0x8da20929  ! 3868: FMULs	fmuls	%f8, %f9, %f6
	.word 0xe0320009  ! 3870: STH_R	sth	%r16, [%r8 + %r9]
	.word 0xe8420009  ! 3870: LDSW_R	ldsw	[%r8 + %r9], %r20
	.word 0xc26a2bf8  ! 3871: LDSTUB_I	ldstub	%r1, [%r8 + 0x0bf8]
	.word 0xca320009  ! 3873: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xf81a0009  ! 3873: LDD_R	ldd	[%r8 + %r9], %r28
	.word 0xca220009  ! 3875: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc71a0009  ! 3875: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xc36a2dc8  ! 3876: PREFETCH_I	prefetch	[%r8 + 0x0dc8], #one_read
	.word 0xeb3a0009  ! 3878: STDF_R	std	%f21, [%r9, %r8]
	.word 0xf8720009  ! 3879: STX_R	stx	%r28, [%r8 + %r9]
	.word 0xce5a0009  ! 3879: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xdcb22fa4  ! 3880: STHA_I	stha	%r14, [%r8 + 0x0fa4] %asi
	.word 0xd6ea1009  ! 3881: LDSTUBA_R	ldstuba	%r11, [%r8 + %r9] 0x80
	.word 0x08800001  ! 3882: BLEU	bleu  	<label_0x1>
	.word 0x2aca0001  ! 3883: BRNZ	brnz,a,pt	%8,<label_0xa0001>
	.word 0xc89a2a58  ! 3884: LDDA_I	ldda	[%r8, + 0x0a58] %asi, %r4
	.word 0x30800002  ! 3885: BA	ba,a	<label_0x2>
	.word 0xa26a0009  ! 3886: UDIVX_R	udivx 	%r8, %r9, %r17
	.word 0xc6a21009  ! 3887: STWA_R	stwa	%r3, [%r8 + %r9] 0x80
	.word 0xc8220009  ! 3889: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xce520009  ! 3889: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0x38800002  ! 3890: BGU	bgu,a	<label_0x2>
	.word 0xc8320009  ! 3892: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc91a0009  ! 3892: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0x0eca0001  ! 3893: BRGEZ	brgez  ,pt	%8,<label_0xa0001>
	.word 0x8efa0009  ! 3894: SDIVcc_R	sdivcc 	%r8, %r9, %r7
	.word 0xfada2150  ! 3895: LDXA_I	ldxa	[%r8, + 0x0150] %asi, %r29
	.word 0xd88a1009  ! 3896: LDUBA_R	lduba	[%r8, %r9] 0x80, %r12
	.word 0xd49a2488  ! 3897: LDDA_I	ldda	[%r8, + 0x0488] %asi, %r10
	.word 0xc8ea2ca8  ! 3898: LDSTUBA_I	ldstuba	%r4, [%r8 + 0x0ca8] %asi
	.word 0xc2ca2ef4  ! 3899: LDSBA_I	ldsba	[%r8, + 0x0ef4] %asi, %r1
	.word 0xc0ba2650  ! 3900: STDA_I	stda	%r0, [%r8 + 0x0650] %asi
	.word 0xfc6a0009  ! 3901: LDSTUB_R	ldstub	%r30, [%r8 + %r9]
	.word 0xc36a0009  ! 3902: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xcff21009  ! 3903: CASXA_I	casxa	[%r8] 0x80, %r9, %r7
	.word 0x8e4a0009  ! 3904: MULX_R	mulx 	%r8, %r9, %r7
	.word 0x8143c000  ! 3905: STBAR	stbar
	.word 0xff3a2958  ! 3906: STDF_I	std	%f31, [0x0958, %r8]
	.word 0xca020009  ! 3907: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xcbe22009  ! 3908: CASA_R	casa	[%r8] %asi, %r9, %r5
	.word 0xc2320009  ! 3910: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xf2120009  ! 3910: LDUH_R	lduh	[%r8 + %r9], %r25
	.word 0xe04223d4  ! 3911: LDSW_I	ldsw	[%r8 + 0x03d4], %r16
	.word 0xc4aa2550  ! 3912: STBA_I	stba	%r2, [%r8 + 0x0550] %asi
	.word 0xe6320009  ! 3914: STH_R	sth	%r19, [%r8 + %r9]
	.word 0xf0420009  ! 3914: LDSW_R	ldsw	[%r8 + %r9], %r24
	.word 0xde2a0009  ! 3916: STB_R	stb	%r15, [%r8 + %r9]
	.word 0xc41a0009  ! 3916: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xcafa1009  ! 3917: SWAPA_R	swapa	%r5, [%r8 + %r9] 0x80
	.word 0xcf3a0009  ! 3919: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc6720009  ! 3920: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc2020009  ! 3920: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xc09a2dd8  ! 3921: LDDA_I	ldda	[%r8, + 0x0dd8] %asi, %r0
	.word 0xc8220009  ! 3923: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc84a0009  ! 3923: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xe45a0009  ! 3924: LDX_R	ldx	[%r8 + %r9], %r18
	.word 0xc4b222b0  ! 3925: STHA_I	stha	%r2, [%r8 + 0x02b0] %asi
	.word 0x2a800001  ! 3926: BCS	bcs,a	<label_0x1>
	.word 0x8a720009  ! 3927: UDIV_R	udiv 	%r8, %r9, %r5
	.word 0x8143c000  ! 3928: STBAR	stbar
	.word 0xbfa20929  ! 3929: FMULs	fmuls	%f8, %f9, %f31
	.word 0xcb020009  ! 3930: LDF_R	ld	[%r8, %r9], %f5
	.word 0x8143e01d  ! 3931: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside 
	.word 0x8da208a9  ! 3932: FSUBs	fsubs	%f8, %f9, %f6
	.word 0xca6a2a28  ! 3933: LDSTUB_I	ldstub	%r5, [%r8 + 0x0a28]
	.word 0xcaf21009  ! 3934: STXA_R	stxa	%r5, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 3935: STBAR	stbar
	.word 0x20800002  ! 3936: BN	bn,a	<label_0x2>
	.word 0xc67a2c40  ! 3937: SWAP_I	swap	%r3, [%r8 + 0x0c40]
	.word 0xc8f22ea0  ! 3938: STXA_I	stxa	%r4, [%r8 + 0x0ea0] %asi
	.word 0xc45a0009  ! 3939: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xc6720009  ! 3941: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc4420009  ! 3941: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xc36a0009  ! 3942: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xb0520009  ! 3943: UMUL_R	umul 	%r8, %r9, %r24
	.word 0xd8fa2b3c  ! 3944: SWAPA_I	swapa	%r12, [%r8 + 0x0b3c] %asi
	.word 0xc4fa1009  ! 3945: SWAPA_R	swapa	%r2, [%r8 + %r9] 0x80
	.word 0xc31a28b8  ! 3946: LDDF_I	ldd	[%r8, 0x08b8], %f1
	.word 0xcca22c58  ! 3947: STWA_I	stwa	%r6, [%r8 + 0x0c58] %asi
	.word 0xb0da0009  ! 3948: SMULcc_R	smulcc 	%r8, %r9, %r24
	.word 0xc4fa25f8  ! 3949: SWAPA_I	swapa	%r2, [%r8 + 0x05f8] %asi
	.word 0xf8220009  ! 3951: STW_R	stw	%r28, [%r8 + %r9]
	.word 0xf4020009  ! 3951: LDUW_R	lduw	[%r8 + %r9], %r26
	.word 0x8143c000  ! 3952: STBAR	stbar
	.word 0x82da0009  ! 3953: SMULcc_R	smulcc 	%r8, %r9, %r1
	.word 0x845a0009  ! 3954: SMUL_R	smul 	%r8, %r9, %r2
	.word 0xea8228e8  ! 3955: LDUWA_I	lduwa	[%r8, + 0x08e8] %asi, %r21
	.word 0xca220009  ! 3957: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xed1a0009  ! 3957: LDDF_R	ldd	[%r8, %r9], %f22
	.word 0xa1220009  ! 3958: MULScc_R	mulscc 	%r8, %r9, %r16
	.word 0xef3a0009  ! 3960: STDF_R	std	%f23, [%r9, %r8]
	.word 0xc6720009  ! 3961: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xf6520009  ! 3961: LDSH_R	ldsh	[%r8 + %r9], %r27
	.word 0x8143e02d  ! 3962: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #MemIssue 
	.word 0x8143c000  ! 3963: STBAR	stbar
	.word 0xe33a2368  ! 3964: STDF_I	std	%f17, [0x0368, %r8]
	.word 0xf6f221c8  ! 3965: STXA_I	stxa	%r27, [%r8 + 0x01c8] %asi
	.word 0xec7a0009  ! 3966: SWAP_R	swap	%r22, [%r8 + %r9]
	.word 0xefe21009  ! 3967: CASA_I	casa	[%r8] 0x80, %r9, %r23
	.word 0xccaa1009  ! 3968: STBA_R	stba	%r6, [%r8 + %r9] 0x80
	.word 0xed3a2ee8  ! 3969: STDF_I	std	%f22, [0x0ee8, %r8]
	.word 0xc3220009  ! 3971: STF_R	st	%f1, [%r9, %r8]
	.word 0xe0720009  ! 3972: STX_R	stx	%r16, [%r8 + %r9]
	.word 0xfb020009  ! 3972: LDF_R	ld	[%r8, %r9], %f29
	.word 0xc3ea20c8  ! 3973: PREFETCHA_I	prefetcha	[%r8, + 0x00c8] %asi, #one_read
	.word 0xc3ea1009  ! 3974: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x83222048  ! 3975: MULScc_I	mulscc 	%r8, 0x0048, %r1
	.word 0xfd222fb0  ! 3976: STF_I	st	%f30, [0x0fb0, %r8]
	.word 0xfe720009  ! 3978: STX_R	stx	%r31, [%r8 + %r9]
	.word 0xce4a0009  ! 3978: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0x8c4a2a60  ! 3979: MULX_I	mulx 	%r8, 0x0a60, %r6
	.word 0xd65a2fc0  ! 3980: LDX_I	ldx	[%r8 + 0x0fc0], %r11
	.word 0x2c800002  ! 3981: BNEG	bneg,a	<label_0x2>
	.word 0xc47a2b00  ! 3982: SWAP_I	swap	%r2, [%r8 + 0x0b00]
	.word 0x8143c000  ! 3983: STBAR	stbar
	.word 0xccca2368  ! 3984: LDSBA_I	ldsba	[%r8, + 0x0368] %asi, %r6
	.word 0xdc320009  ! 3986: STH_R	sth	%r14, [%r8 + %r9]
	.word 0xc41a0009  ! 3986: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x83a20929  ! 3987: FMULs	fmuls	%f8, %f9, %f1
	.word 0xc6a2253c  ! 3988: STWA_I	stwa	%r3, [%r8 + 0x053c] %asi
	.word 0x9ad226f0  ! 3989: UMULcc_I	umulcc 	%r8, 0x06f0, %r13
	.word 0xf22a0009  ! 3991: STB_R	stb	%r25, [%r8 + %r9]
	.word 0xcc120009  ! 3991: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xc6fa2bf0  ! 3992: SWAPA_I	swapa	%r3, [%r8 + 0x0bf0] %asi
	.word 0x8143c000  ! 3993: STBAR	stbar
	.word 0xc3ea1009  ! 3994: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xa2da0009  ! 3995: SMULcc_R	smulcc 	%r8, %r9, %r17
	.word 0xc6320009  ! 3997: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc2020009  ! 3997: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xf2aa1009  ! 3998: STBA_R	stba	%r25, [%r8 + %r9] 0x80
	.word 0xc6f21009  ! 3999: STXA_R	stxa	%r3, [%r8 + %r9] 0x80
        ta      T_GOOD_TRAP

th_main_1:
        setx  MAIN_BASE_DATA_VA, %r1, %r8
        setx  0x0000000000000240, %g1, %r9
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
        setx  0x5bcb77ce324c4aeb, %g1, %r0
        setx  0xf4827a53b6bfc94b, %g1, %r1
        setx  0x5ff64cb6e9f911dd, %g1, %r2
        setx  0xedae56c1122233ea, %g1, %r3
        setx  0xa4c8e1fea18da88d, %g1, %r4
        setx  0x73f0234fb272a0d1, %g1, %r5
        setx  0xc6781074b4f57ece, %g1, %r6
        setx  0x137484eba10193c7, %g1, %r7
        setx  0x94391cfcb951fc12, %g1, %r10
        setx  0x6eeb88f68472af8b, %g1, %r11
        setx  0x147053d363779850, %g1, %r12
        setx  0x286b90c2ab3d98c3, %g1, %r13
        setx  0xfb261a31aa3f067c, %g1, %r14
        setx  0xd91ae140e0a7d68c, %g1, %r15
        setx  0x965d8c1e72319eac, %g1, %r16
        setx  0xa5ab654862ba5616, %g1, %r17
        setx  0xef49eac80eab1e68, %g1, %r18
        setx  0x24d6a3e86354bd48, %g1, %r19
        setx  0xaa334c901f893140, %g1, %r20
        setx  0xa4fcf20a864b0998, %g1, %r21
        setx  0xc65ea9c8ad5f1820, %g1, %r22
        setx  0x6a98fff462b41946, %g1, %r23
        setx  0x533f03888a0dcd50, %g1, %r24
        setx  0x71dbf93e67f5003c, %g1, %r25
        setx  0xd3560b37895de55d, %g1, %r26
        setx  0x5e711f0a85df89d8, %g1, %r27
        setx  0x57d3dd74a55e6a56, %g1, %r28
        setx  0x5723f1dcb12effec, %g1, %r29
        setx  0x281afcc2d80050f4, %g1, %r30
        setx  0x9541794447d1404f, %g1, %r31
	.word 0xcea2287c  ! 1: STWA_I	stwa	%r7, [%r8 + 0x087c] %asi
	.word 0x82fa0009  ! 2: SDIVcc_R	sdivcc 	%r8, %r9, %r1
	.word 0xc6320009  ! 4: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xce520009  ! 4: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0x82da22ec  ! 5: SMULcc_I	smulcc 	%r8, 0x02ec, %r1
	.word 0xeb1a0009  ! 6: LDDF_R	ldd	[%r8, %r9], %f21
	.word 0xf6a21009  ! 7: STWA_R	stwa	%r27, [%r8 + %r9] 0x80
	.word 0x8143e015  ! 8: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside 
	.word 0xc36a21f4  ! 9: PREFETCH_I	prefetch	[%r8 + 0x01f4], #one_read
	.word 0xd8ca26c4  ! 10: LDSBA_I	ldsba	[%r8, + 0x06c4] %asi, %r12
	.word 0x2e800001  ! 11: BVS	bvs,a	<label_0x1>
	.word 0xc3ea1009  ! 12: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x885a24b8  ! 13: SMUL_I	smul 	%r8, 0x04b8, %r4
	.word 0xc3ea1009  ! 14: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x2a800001  ! 15: BCS	bcs,a	<label_0x1>
	.word 0x836a2d64  ! 16: SDIVX_I	sdivx	%r8, 0x0d64, %r1
	.word 0xc6aa2850  ! 17: STBA_I	stba	%r3, [%r8 + 0x0850] %asi
	.word 0xc36a2db8  ! 18: PREFETCH_I	prefetch	[%r8 + 0x0db8], #one_read
	.word 0xce220009  ! 20: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc80a0009  ! 20: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xc4420009  ! 21: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xcb1a2520  ! 22: LDDF_I	ldd	[%r8, 0x0520], %f5
	.word 0x8c522bfc  ! 23: UMUL_I	umul 	%r8, 0x0bfc, %r6
	.word 0x88d20009  ! 24: UMULcc_R	umulcc 	%r8, %r9, %r4
	.word 0xc6f22bf0  ! 25: STXA_I	stxa	%r3, [%r8 + 0x0bf0] %asi
	.word 0xe60a2cf4  ! 26: LDUB_I	ldub	[%r8 + 0x0cf4], %r19
	.word 0xcb3a0009  ! 28: STDF_R	std	%f5, [%r9, %r8]
	.word 0xca720009  ! 29: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc91a0009  ! 29: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xce0a0009  ! 30: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xcea2274c  ! 31: STWA_I	stwa	%r7, [%r8 + 0x074c] %asi
	.word 0x827a2878  ! 32: SDIV_I	sdiv 	%r8, 0x0878, %r1
	.word 0xc3ea1009  ! 33: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x8143c000  ! 34: STBAR	stbar
	.word 0xcc0a0009  ! 35: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xc2320009  ! 37: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc84a0009  ! 37: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xce8a2920  ! 38: LDUBA_I	lduba	[%r8, + 0x0920] %asi, %r7
	.word 0xc82a0009  ! 40: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xe41a0009  ! 40: LDD_R	ldd	[%r8 + %r9], %r18
	.word 0xf04a2480  ! 41: LDSB_I	ldsb	[%r8 + 0x0480], %r24
	.word 0x02ca0001  ! 42: BRZ	brz  ,pt	%8,<label_0xa0001>
	.word 0x8143e040  ! 43: MEMBAR	membar	#Sync 
	.word 0xc36a0009  ! 44: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xf9e22009  ! 45: CASA_R	casa	[%r8] %asi, %r9, %r28
	.word 0x856a2f00  ! 46: SDIVX_I	sdivx	%r8, 0x0f00, %r2
	.word 0xa8da0009  ! 47: SMULcc_R	smulcc 	%r8, %r9, %r20
	.word 0xccea27bc  ! 48: LDSTUBA_I	ldstuba	%r6, [%r8 + 0x07bc] %asi
	.word 0xd73a2df8  ! 49: STDF_I	std	%f11, [0x0df8, %r8]
	.word 0xca220009  ! 51: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc85a0009  ! 51: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xdc1a28a0  ! 52: LDD_I	ldd	[%r8 + 0x08a0], %r14
	.word 0xc4fa1009  ! 53: SWAPA_R	swapa	%r2, [%r8 + %r9] 0x80
	.word 0x83a20829  ! 54: FADDs	fadds	%f8, %f9, %f1
	.word 0xe2320009  ! 56: STH_R	sth	%r17, [%r8 + %r9]
	.word 0xc91a0009  ! 56: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xfde22009  ! 57: CASA_R	casa	[%r8] %asi, %r9, %r30
	.word 0xc5022290  ! 58: LDF_I	ld	[%r8, 0x0290], %f2
	.word 0xf88a2b90  ! 59: LDUBA_I	lduba	[%r8, + 0x0b90] %asi, %r28
	.word 0x887229fc  ! 60: UDIV_I	udiv 	%r8, 0x09fc, %r4
	.word 0x8143e023  ! 61: MEMBAR	membar	#LoadLoad | #StoreLoad | #MemIssue 
	.word 0xe06a2520  ! 62: LDSTUB_I	ldstub	%r16, [%r8 + 0x0520]
	.word 0xed220009  ! 64: STF_R	st	%f22, [%r9, %r8]
	.word 0xc8720009  ! 65: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xce4a0009  ! 65: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0x1c800001  ! 66: BPOS	bpos  	<label_0x1>
	.word 0xa2520009  ! 67: UMUL_R	umul 	%r8, %r9, %r17
	.word 0x8143e07f  ! 68: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0x8143e00c  ! 69: MEMBAR	membar	#LoadStore | #StoreStore 
	.word 0xc6220009  ! 71: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xfc1a0009  ! 71: LDD_R	ldd	[%r8 + %r9], %r30
	.word 0xc3ea1009  ! 72: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xcb220009  ! 74: STF_R	st	%f5, [%r9, %r8]
	.word 0xea720009  ! 75: STX_R	stx	%r21, [%r8 + %r9]
	.word 0xc6520009  ! 75: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0x8143c000  ! 76: STBAR	stbar
	.word 0xb9a208a9  ! 77: FSUBs	fsubs	%f8, %f9, %f28
	.word 0xcc0a0009  ! 78: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0x3c800002  ! 79: BPOS	bpos,a	<label_0x2>
	.word 0x22800001  ! 80: BE	be,a	<label_0x1>
	.word 0x852220a0  ! 81: MULScc_I	mulscc 	%r8, 0x00a0, %r2
	.word 0x00800001  ! 82: BN	bn  	<label_0x1>
	.word 0xc8f21009  ! 83: STXA_R	stxa	%r4, [%r8 + %r9] 0x80
	.word 0xcaaa25f0  ! 84: STBA_I	stba	%r5, [%r8 + 0x05f0] %asi
	.word 0x8143e027  ! 85: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #MemIssue 
	.word 0xc3ea2f48  ! 86: PREFETCHA_I	prefetcha	[%r8, + 0x0f48] %asi, #one_read
	.word 0xce5a2120  ! 87: LDX_I	ldx	[%r8 + 0x0120], %r7
	.word 0x8143c000  ! 88: STBAR	stbar
	.word 0x86722488  ! 89: UDIV_I	udiv 	%r8, 0x0488, %r3
	.word 0xc6220009  ! 91: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc51a0009  ! 91: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xdc320009  ! 93: STH_R	sth	%r14, [%r8 + %r9]
	.word 0xf65a0009  ! 93: LDX_R	ldx	[%r8 + %r9], %r27
	.word 0xccaa1009  ! 94: STBA_R	stba	%r6, [%r8 + %r9] 0x80
	.word 0x8cda0009  ! 95: SMULcc_R	smulcc 	%r8, %r9, %r6
	.word 0xc5222c28  ! 96: STF_I	st	%f2, [0x0c28, %r8]
	.word 0x836a2820  ! 97: SDIVX_I	sdivx	%r8, 0x0820, %r1
	.word 0x8e522fc0  ! 98: UMUL_I	umul 	%r8, 0x0fc0, %r7
	.word 0x06ca0001  ! 99: BRLZ	brlz  ,pt	%8,<label_0xa0001>
	.word 0xc53a21e0  ! 100: STDF_I	std	%f2, [0x01e0, %r8]
	.word 0xc4320009  ! 102: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xec120009  ! 102: LDUH_R	lduh	[%r8 + %r9], %r22
	.word 0xc6a225f0  ! 103: STWA_I	stwa	%r3, [%r8 + 0x05f0] %asi
	.word 0xc2320009  ! 105: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc85a0009  ! 105: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xc3ea2c88  ! 106: PREFETCHA_I	prefetcha	[%r8, + 0x0c88] %asi, #one_read
	.word 0xfdf22009  ! 107: CASXA_R	casxa	[%r8]%asi, %r9, %r30
	.word 0xab22298c  ! 108: MULScc_I	mulscc 	%r8, 0x098c, %r21
	.word 0xc36a0009  ! 109: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xbfa209a9  ! 110: FDIVs	fdivs	%f8, %f9, %f31
	.word 0xc8921009  ! 111: LDUHA_R	lduha	[%r8, %r9] 0x80, %r4
	.word 0xc87a2f40  ! 112: SWAP_I	swap	%r4, [%r8 + 0x0f40]
	.word 0x0aca0001  ! 113: BRNZ	brnz  ,pt	%8,<label_0xa0001>
	.word 0xf7222840  ! 114: STF_I	st	%f27, [0x0840, %r8]
	.word 0x8143c000  ! 115: STBAR	stbar
	.word 0xdb020009  ! 116: LDF_R	ld	[%r8, %r9], %f13
	.word 0x8cf20009  ! 117: UDIVcc_R	udivcc 	%r8, %r9, %r6
	.word 0x884a25f0  ! 118: MULX_I	mulx 	%r8, 0x05f0, %r4
	.word 0xcbf21009  ! 119: CASXA_I	casxa	[%r8] 0x80, %r9, %r5
	.word 0x85a20829  ! 120: FADDs	fadds	%f8, %f9, %f2
	.word 0xc45a0009  ! 121: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xc81a2c08  ! 122: LDD_I	ldd	[%r8 + 0x0c08], %r4
	.word 0xc36a0009  ! 123: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0x32800001  ! 124: BNE	bne,a	<label_0x1>
	.word 0x8143e057  ! 125: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside | #Sync 
	.word 0xee320009  ! 127: STH_R	sth	%r23, [%r8 + %r9]
	.word 0xc8120009  ! 127: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xc8f22fa8  ! 128: STXA_I	stxa	%r4, [%r8 + 0x0fa8] %asi
	.word 0xccda1009  ! 129: LDXA_R	ldxa	[%r8, %r9] 0x80, %r6
	.word 0xc2d21009  ! 130: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r1
	.word 0xcad21009  ! 131: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r5
	.word 0xb5a20929  ! 132: FMULs	fmuls	%f8, %f9, %f26
	.word 0xad6a0009  ! 133: SDIVX_R	sdivx	%r8, %r9, %r22
	.word 0x8143c000  ! 134: STBAR	stbar
	.word 0xf0220009  ! 136: STW_R	stw	%r24, [%r8 + %r9]
	.word 0xfc1a0009  ! 136: LDD_R	ldd	[%r8 + %r9], %r30
	.word 0x8da208a9  ! 137: FSUBs	fsubs	%f8, %f9, %f6
	.word 0xc3ea23d8  ! 138: PREFETCHA_I	prefetcha	[%r8, + 0x03d8] %asi, #one_read
	.word 0xc5e22009  ! 139: CASA_R	casa	[%r8] %asi, %r9, %r2
	.word 0x89a20829  ! 140: FADDs	fadds	%f8, %f9, %f4
	.word 0xcc720009  ! 142: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc8520009  ! 142: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xa3a208a9  ! 143: FSUBs	fsubs	%f8, %f9, %f17
	.word 0x8143e064  ! 144: MEMBAR	membar	#LoadStore | #MemIssue | #Sync 
	.word 0x9cda2ec0  ! 145: SMULcc_I	smulcc 	%r8, 0x0ec0, %r14
	.word 0x36800001  ! 146: BGE	bge,a	<label_0x1>
	.word 0xe2720009  ! 148: STX_R	stx	%r17, [%r8 + %r9]
	.word 0xc8020009  ! 148: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xc3ea1009  ! 149: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc3ea1009  ! 150: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x9d6a2ba4  ! 151: SDIVX_I	sdivx	%r8, 0x0ba4, %r14
	.word 0xc81a0009  ! 152: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xc42a0009  ! 154: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc6020009  ! 154: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xc4d21009  ! 155: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r2
	.word 0xc87a0009  ! 156: SWAP_R	swap	%r4, [%r8 + %r9]
	.word 0xed3a2568  ! 157: STDF_I	std	%f22, [0x0568, %r8]
	.word 0x8143c000  ! 158: STBAR	stbar
	.word 0xc3ea1009  ! 159: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc62a0009  ! 161: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc01a0009  ! 161: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0x24ca0001  ! 162: BRLEZ	brlez,a,pt	%8,<label_0xa0001>
	.word 0xa4fa0009  ! 163: SDIVcc_R	sdivcc 	%r8, %r9, %r18
	.word 0xc3ea2750  ! 164: PREFETCHA_I	prefetcha	[%r8, + 0x0750] %asi, #one_read
	.word 0xac6a28c0  ! 165: UDIVX_I	udivx 	%r8, 0x08c0, %r22
	.word 0xe8ba2c98  ! 166: STDA_I	stda	%r20, [%r8 + 0x0c98] %asi
	.word 0xc8fa2794  ! 167: SWAPA_I	swapa	%r4, [%r8 + 0x0794] %asi
	.word 0x1a800001  ! 168: BCC	bcc  	<label_0x1>
	.word 0xc36a0009  ! 169: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xcb3a2138  ! 170: STDF_I	std	%f5, [0x0138, %r8]
	.word 0x2ac20001  ! 171: BRNZ	brnz,a,nt	%8,<label_0x20001>
	.word 0xc36a0009  ! 172: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0x96f20009  ! 173: UDIVcc_R	udivcc 	%r8, %r9, %r11
	.word 0xb4da0009  ! 174: SMULcc_R	smulcc 	%r8, %r9, %r26
	.word 0xce720009  ! 176: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc65a0009  ! 176: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0x98720009  ! 177: UDIV_R	udiv 	%r8, %r9, %r12
	.word 0x8d222e8c  ! 178: MULScc_I	mulscc 	%r8, 0x0e8c, %r6
	.word 0xacda0009  ! 179: SMULcc_R	smulcc 	%r8, %r9, %r22
	.word 0xc2821009  ! 180: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r1
	.word 0x2eca0001  ! 181: BRGEZ	brgez,a,pt	%8,<label_0xa0001>
	.word 0xc72220c4  ! 182: STF_I	st	%f3, [0x00c4, %r8]
	.word 0xf8b21009  ! 183: STHA_R	stha	%r28, [%r8 + %r9] 0x80
	.word 0x02800001  ! 184: BE	be  	<label_0x1>
	.word 0xccb21009  ! 185: STHA_R	stha	%r6, [%r8 + %r9] 0x80
	.word 0xb46a2f64  ! 186: UDIVX_I	udivx 	%r8, 0x0f64, %r26
	.word 0xf91a0009  ! 187: LDDF_R	ldd	[%r8, %r9], %f28
	.word 0x8a7a0009  ! 188: SDIV_R	sdiv 	%r8, %r9, %r5
	.word 0xfa6a0009  ! 189: LDSTUB_R	ldstub	%r29, [%r8 + %r9]
	.word 0xcd1a2cf0  ! 190: LDDF_I	ldd	[%r8, 0x0cf0], %f6
	.word 0x8143c000  ! 191: STBAR	stbar
	.word 0x85a20929  ! 192: FMULs	fmuls	%f8, %f9, %f2
	.word 0xc42a0009  ! 194: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xe0120009  ! 194: LDUH_R	lduh	[%r8 + %r9], %r16
	.word 0x8143c000  ! 195: STBAR	stbar
	.word 0xc36a2f84  ! 196: PREFETCH_I	prefetch	[%r8 + 0x0f84], #one_read
	.word 0xce2a0009  ! 198: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xee020009  ! 198: LDUW_R	lduw	[%r8 + %r9], %r23
	.word 0x04800002  ! 199: BLE	ble  	<label_0x2>
	.word 0x8a5a0009  ! 200: SMUL_R	smul 	%r8, %r9, %r5
	.word 0x8af2267c  ! 201: UDIVcc_I	udivcc 	%r8, 0x067c, %r5
	.word 0x84d22160  ! 202: UMULcc_I	umulcc 	%r8, 0x0160, %r2
	.word 0x887a2bc0  ! 203: SDIV_I	sdiv 	%r8, 0x0bc0, %r4
	.word 0xed22271c  ! 204: STF_I	st	%f22, [0x071c, %r8]
	.word 0xdc2a0009  ! 206: STB_R	stb	%r14, [%r8 + %r9]
	.word 0xcc120009  ! 206: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0x0a800001  ! 207: BCS	bcs  	<label_0x1>
	.word 0xc8c22be0  ! 208: LDSWA_I	ldswa	[%r8, + 0x0be0] %asi, %r4
	.word 0xea220009  ! 210: STW_R	stw	%r21, [%r8 + %r9]
	.word 0xc2420009  ! 210: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xc36a0009  ! 211: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0x846a2764  ! 212: UDIVX_I	udivx 	%r8, 0x0764, %r2
	.word 0xce122d90  ! 213: LDUH_I	lduh	[%r8 + 0x0d90], %r7
	.word 0x867a0009  ! 214: SDIV_R	sdiv 	%r8, %r9, %r3
	.word 0x06ca0001  ! 215: BRLZ	brlz  ,pt	%8,<label_0xa0001>
	.word 0x12800001  ! 216: BNE	bne  	<label_0x1>
	.word 0xcaea2fe4  ! 217: LDSTUBA_I	ldstuba	%r5, [%r8 + 0x0fe4] %asi
	.word 0xce220009  ! 219: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc84a0009  ! 219: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xc3ea1009  ! 220: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc66a0009  ! 221: LDSTUB_R	ldstub	%r3, [%r8 + %r9]
	.word 0x87a20829  ! 222: FADDs	fadds	%f8, %f9, %f3
	.word 0x836a2a7c  ! 223: SDIVX_I	sdivx	%r8, 0x0a7c, %r1
	.word 0xcc720009  ! 225: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc2420009  ! 225: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xd6ca21c8  ! 226: LDSBA_I	ldsba	[%r8, + 0x01c8] %asi, %r11
	.word 0x82d221b4  ! 227: UMULcc_I	umulcc 	%r8, 0x01b4, %r1
	.word 0xcaf22ac0  ! 228: STXA_I	stxa	%r5, [%r8 + 0x0ac0] %asi
	.word 0xcc022704  ! 229: LDUW_I	lduw	[%r8 + 0x0704], %r6
	.word 0xb27a0009  ! 230: SDIV_R	sdiv 	%r8, %r9, %r25
	.word 0xbefa2040  ! 231: SDIVcc_I	sdivcc 	%r8, 0x0040, %r31
	.word 0xb0d20009  ! 232: UMULcc_R	umulcc 	%r8, %r9, %r24
	.word 0xc8fa2510  ! 233: SWAPA_I	swapa	%r4, [%r8 + 0x0510] %asi
	.word 0x8af20009  ! 234: UDIVcc_R	udivcc 	%r8, %r9, %r5
	.word 0xe62a0009  ! 236: STB_R	stb	%r19, [%r8 + %r9]
	.word 0xca5a0009  ! 236: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xc6d21009  ! 237: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r3
	.word 0xc22a0009  ! 239: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc6020009  ! 239: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0x88f20009  ! 240: UDIVcc_R	udivcc 	%r8, %r9, %r4
	.word 0xae6a2510  ! 241: UDIVX_I	udivx 	%r8, 0x0510, %r23
	.word 0xca2a0009  ! 243: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc2120009  ! 243: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xc4220009  ! 245: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xca420009  ! 245: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xcada2c28  ! 246: LDXA_I	ldxa	[%r8, + 0x0c28] %asi, %r5
	.word 0x845a27c4  ! 247: SMUL_I	smul 	%r8, 0x07c4, %r2
	.word 0xcc220009  ! 249: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xcf1a0009  ! 249: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xc36a0009  ! 250: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc48a23d0  ! 251: LDUBA_I	lduba	[%r8, + 0x03d0] %asi, %r2
	.word 0x0ec20001  ! 252: BRGEZ	brgez  ,nt	%8,<label_0x20001>
	.word 0x8143c000  ! 253: STBAR	stbar
	.word 0x8a5a0009  ! 254: SMUL_R	smul 	%r8, %r9, %r5
	.word 0xc2120009  ! 255: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xf4822b28  ! 256: LDUWA_I	lduwa	[%r8, + 0x0b28] %asi, %r26
	.word 0xc8ea1009  ! 257: LDSTUBA_R	ldstuba	%r4, [%r8 + %r9] 0x80
	.word 0xfa220009  ! 259: STW_R	stw	%r29, [%r8 + %r9]
	.word 0xc20a0009  ! 259: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0x8cd22248  ! 260: UMULcc_I	umulcc 	%r8, 0x0248, %r6
	.word 0x85a209a9  ! 261: FDIVs	fdivs	%f8, %f9, %f2
	.word 0x02800001  ! 262: BE	be  	<label_0x1>
	.word 0xc4a21009  ! 263: STWA_R	stwa	%r2, [%r8 + %r9] 0x80
	.word 0xc53a20c0  ! 264: STDF_I	std	%f2, [0x00c0, %r8]
	.word 0xc66a0009  ! 265: LDSTUB_R	ldstub	%r3, [%r8 + %r9]
	.word 0xf13a24f0  ! 266: STDF_I	std	%f24, [0x04f0, %r8]
	.word 0xc36a0009  ! 267: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0x96fa0009  ! 268: SDIVcc_R	sdivcc 	%r8, %r9, %r11
	.word 0x8cda0009  ! 269: SMULcc_R	smulcc 	%r8, %r9, %r6
	.word 0x06800001  ! 270: BL	bl  	<label_0x1>
	.word 0x8143e04e  ! 271: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Sync 
	.word 0x8143e019  ! 272: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside 
	.word 0xcd220009  ! 274: STF_R	st	%f6, [%r9, %r8]
	.word 0xd6720009  ! 275: STX_R	stx	%r11, [%r8 + %r9]
	.word 0xcd020009  ! 275: LDF_R	ld	[%r8, %r9], %f6
	.word 0x88fa277c  ! 276: SDIVcc_I	sdivcc 	%r8, 0x077c, %r4
	.word 0x8143e06f  ! 277: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #MemIssue | #Sync 
	.word 0x845a0009  ! 278: SMUL_R	smul 	%r8, %r9, %r2
	.word 0xc45a23e8  ! 279: LDX_I	ldx	[%r8 + 0x03e8], %r2
	.word 0xc6520009  ! 280: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xf8320009  ! 282: STH_R	sth	%r28, [%r8 + %r9]
	.word 0xf01a0009  ! 282: LDD_R	ldd	[%r8 + %r9], %r24
	.word 0xc8320009  ! 284: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xf51a0009  ! 284: LDDF_R	ldd	[%r8, %r9], %f26
	.word 0x8143c000  ! 285: STBAR	stbar
	.word 0xc60a22f8  ! 286: LDUB_I	ldub	[%r8 + 0x02f8], %r3
	.word 0x8ef22ab4  ! 287: UDIVcc_I	udivcc 	%r8, 0x0ab4, %r7
	.word 0xc6720009  ! 289: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xfc0a0009  ! 289: LDUB_R	ldub	[%r8 + %r9], %r30
	.word 0xb6720009  ! 290: UDIV_R	udiv 	%r8, %r9, %r27
	.word 0xca420009  ! 291: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xc5f22009  ! 292: CASXA_R	casxa	[%r8]%asi, %r9, %r2
	.word 0x32800001  ! 293: BNE	bne,a	<label_0x1>
	.word 0xca720009  ! 295: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xe7020009  ! 295: LDF_R	ld	[%r8, %r9], %f19
	.word 0x8143e02a  ! 296: MEMBAR	membar	#StoreLoad | #StoreStore | #MemIssue 
	.word 0xe66a0009  ! 297: LDSTUB_R	ldstub	%r19, [%r8 + %r9]
	.word 0xc3ea280c  ! 298: PREFETCHA_I	prefetcha	[%r8, + 0x080c] %asi, #one_read
	.word 0x8143c000  ! 299: STBAR	stbar
	.word 0xfaa225b4  ! 300: STWA_I	stwa	%r29, [%r8 + 0x05b4] %asi
	.word 0xc24a0009  ! 301: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xf5f22009  ! 302: CASXA_R	casxa	[%r8]%asi, %r9, %r26
	.word 0xa3a209a9  ! 303: FDIVs	fdivs	%f8, %f9, %f17
	.word 0x84d20009  ! 304: UMULcc_R	umulcc 	%r8, %r9, %r2
	.word 0xce2a0009  ! 306: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xfd1a0009  ! 306: LDDF_R	ldd	[%r8, %r9], %f30
	.word 0x20800001  ! 307: BN	bn,a	<label_0x1>
	.word 0xce822664  ! 308: LDUWA_I	lduwa	[%r8, + 0x0664] %asi, %r7
	.word 0x846a2550  ! 309: UDIVX_I	udivx 	%r8, 0x0550, %r2
	.word 0xf11a28d8  ! 310: LDDF_I	ldd	[%r8, 0x08d8], %f24
	.word 0xc46a2530  ! 311: LDSTUB_I	ldstub	%r2, [%r8 + 0x0530]
	.word 0xe62a0009  ! 313: STB_R	stb	%r19, [%r8 + %r9]
	.word 0xcc020009  ! 313: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xc3ea2348  ! 314: PREFETCHA_I	prefetcha	[%r8, + 0x0348] %asi, #one_read
	.word 0xc86a2fec  ! 315: LDSTUB_I	ldstub	%r4, [%r8 + 0x0fec]
	.word 0xc6520009  ! 316: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xca921009  ! 317: LDUHA_R	lduha	[%r8, %r9] 0x80, %r5
	.word 0xc36a0009  ! 318: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0x1a800001  ! 319: BCC	bcc  	<label_0x1>
	.word 0xcde22009  ! 320: CASA_R	casa	[%r8] %asi, %r9, %r6
	.word 0xf6da25e0  ! 321: LDXA_I	ldxa	[%r8, + 0x05e0] %asi, %r27
	.word 0xc87a0009  ! 322: SWAP_R	swap	%r4, [%r8 + %r9]
	.word 0xad6a0009  ! 323: SDIVX_R	sdivx	%r8, %r9, %r22
	.word 0xccea29d0  ! 324: LDSTUBA_I	ldstuba	%r6, [%r8 + 0x09d0] %asi
	.word 0xc4a21009  ! 325: STWA_R	stwa	%r2, [%r8 + %r9] 0x80
	.word 0xcc0a0009  ! 326: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xc8da27c8  ! 327: LDXA_I	ldxa	[%r8, + 0x07c8] %asi, %r4
	.word 0x02ca0001  ! 328: BRZ	brz  ,pt	%8,<label_0xa0001>
	.word 0xc2220009  ! 330: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xe05a0009  ! 330: LDX_R	ldx	[%r8 + %r9], %r16
	.word 0x847a2ef4  ! 331: SDIV_I	sdiv 	%r8, 0x0ef4, %r2
	.word 0xcc9a1009  ! 332: LDDA_R	ldda	[%r8, %r9] 0x80, %r6
	.word 0x0cc20001  ! 333: BRGZ	brgz  ,nt	%8,<label_0x20001>
	.word 0xce1228c4  ! 334: LDUH_I	lduh	[%r8 + 0x08c4], %r7
	.word 0xe6b22b2c  ! 335: STHA_I	stha	%r19, [%r8 + 0x0b2c] %asi
	.word 0x8e6a2d7c  ! 336: UDIVX_I	udivx 	%r8, 0x0d7c, %r7
	.word 0xdcda20c0  ! 337: LDXA_I	ldxa	[%r8, + 0x00c0] %asi, %r14
	.word 0xad6a0009  ! 338: SDIVX_R	sdivx	%r8, %r9, %r22
	.word 0x2cc20001  ! 339: BRGZ	brgz,a,nt	%8,<label_0x20001>
	.word 0xe0b225a0  ! 340: STHA_I	stha	%r16, [%r8 + 0x05a0] %asi
	.word 0x16800002  ! 341: BGE	bge  	<label_0x2>
	.word 0xf81a0009  ! 342: LDD_R	ldd	[%r8 + %r9], %r28
	.word 0xea2a0009  ! 344: STB_R	stb	%r21, [%r8 + %r9]
	.word 0xd85a0009  ! 344: LDX_R	ldx	[%r8 + %r9], %r12
	.word 0xcefa1009  ! 345: SWAPA_R	swapa	%r7, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 346: STBAR	stbar
	.word 0xe6d22e90  ! 347: LDSHA_I	ldsha	[%r8, + 0x0e90] %asi, %r19
	.word 0x8143c000  ! 348: STBAR	stbar
	.word 0xc3020009  ! 349: LDF_R	ld	[%r8, %r9], %f1
	.word 0x82722ad8  ! 350: UDIV_I	udiv 	%r8, 0x0ad8, %r1
	.word 0xca2a0009  ! 352: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc45a0009  ! 352: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xa05a2ab8  ! 353: SMUL_I	smul 	%r8, 0x0ab8, %r16
	.word 0xc6320009  ! 355: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xca520009  ! 355: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xccda1009  ! 356: LDXA_R	ldxa	[%r8, %r9] 0x80, %r6
	.word 0xc8320009  ! 358: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc6020009  ! 358: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xc3ea1009  ! 359: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x12800001  ! 360: BNE	bne  	<label_0x1>
	.word 0xc9e22009  ! 361: CASA_R	casa	[%r8] %asi, %r9, %r4
	.word 0xfa2a0009  ! 363: STB_R	stb	%r29, [%r8 + %r9]
	.word 0xfe420009  ! 363: LDSW_R	ldsw	[%r8 + %r9], %r31
	.word 0xccba1009  ! 364: STDA_R	stda	%r6, [%r8 + %r9] 0x80
	.word 0xc84a2370  ! 365: LDSB_I	ldsb	[%r8 + 0x0370], %r4
	.word 0x8143e03e  ! 366: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0xcac22ea8  ! 367: LDSWA_I	ldswa	[%r8, + 0x0ea8] %asi, %r5
	.word 0x99a209a9  ! 368: FDIVs	fdivs	%f8, %f9, %f12
	.word 0xcf3a2c30  ! 369: STDF_I	std	%f7, [0x0c30, %r8]
	.word 0x86fa26dc  ! 370: SDIVcc_I	sdivcc 	%r8, 0x06dc, %r3
	.word 0xaba209a9  ! 371: FDIVs	fdivs	%f8, %f9, %f21
	.word 0x40000001  ! 372: CALL	call	disp30_1
	.word 0xce8a2058  ! 373: LDUBA_I	lduba	[%r8, + 0x0058] %asi, %r7
	.word 0xc8b22f70  ! 374: STHA_I	stha	%r4, [%r8 + 0x0f70] %asi
	.word 0xd7f21009  ! 375: CASXA_I	casxa	[%r8] 0x80, %r9, %r11
	.word 0xc53a20c0  ! 376: STDF_I	std	%f2, [0x00c0, %r8]
	.word 0x87220009  ! 377: MULScc_R	mulscc 	%r8, %r9, %r3
	.word 0xca2a0009  ! 379: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xe84a0009  ! 379: LDSB_R	ldsb	[%r8 + %r9], %r20
	.word 0x38800001  ! 380: BGU	bgu,a	<label_0x1>
	.word 0x8143e018  ! 381: MEMBAR	membar	#StoreStore | #Lookaside 
	.word 0xc36a0009  ! 382: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc33a0009  ! 384: STDF_R	std	%f1, [%r9, %r8]
	.word 0xf0720009  ! 385: STX_R	stx	%r24, [%r8 + %r9]
	.word 0xc4420009  ! 385: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0x87220009  ! 386: MULScc_R	mulscc 	%r8, %r9, %r3
	.word 0xcf022c00  ! 387: LDF_I	ld	[%r8, 0x0c00], %f7
	.word 0xc4aa297c  ! 388: STBA_I	stba	%r2, [%r8 + 0x097c] %asi
	.word 0x89a208a9  ! 389: FSUBs	fsubs	%f8, %f9, %f4
	.word 0x8143e07a  ! 390: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xf4ba1009  ! 391: STDA_R	stda	%r26, [%r8 + %r9] 0x80
	.word 0xf0d21009  ! 392: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r24
	.word 0x82da2168  ! 393: SMULcc_I	smulcc 	%r8, 0x0168, %r1
	.word 0xfd022b34  ! 394: LDF_I	ld	[%r8, 0x0b34], %f30
	.word 0xc36a2124  ! 395: PREFETCH_I	prefetch	[%r8 + 0x0124], #one_read
	.word 0xcf3a0009  ! 397: STDF_R	std	%f7, [%r9, %r8]
	.word 0xce720009  ! 398: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xd6020009  ! 398: LDUW_R	lduw	[%r8 + %r9], %r11
	.word 0xc6320009  ! 400: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc2420009  ! 400: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xce6a0009  ! 401: LDSTUB_R	ldstub	%r7, [%r8 + %r9]
	.word 0xcc220009  ! 403: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xcc420009  ! 403: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xcf3a23f8  ! 404: STDF_I	std	%f7, [0x03f8, %r8]
	.word 0x88f227d4  ! 405: UDIVcc_I	udivcc 	%r8, 0x07d4, %r4
	.word 0xc2220009  ! 407: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc64a0009  ! 407: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xc8d21009  ! 408: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r4
	.word 0xc4fa2038  ! 409: SWAPA_I	swapa	%r2, [%r8 + 0x0038] %asi
	.word 0xc36a2b84  ! 410: PREFETCH_I	prefetch	[%r8 + 0x0b84], #one_read
	.word 0x8eda2084  ! 411: SMULcc_I	smulcc 	%r8, 0x0084, %r7
	.word 0xc93a0009  ! 413: STDF_R	std	%f4, [%r9, %r8]
	.word 0xec720009  ! 414: STX_R	stx	%r22, [%r8 + %r9]
	.word 0xcc120009  ! 414: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0x14800002  ! 415: BG	bg  	<label_0x2>
	.word 0xc52221a4  ! 416: STF_I	st	%f2, [0x01a4, %r8]
	.word 0xc8220009  ! 418: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xf2120009  ! 418: LDUH_R	lduh	[%r8 + %r9], %r25
	.word 0xc8a2244c  ! 419: STWA_I	stwa	%r4, [%r8 + 0x044c] %asi
	.word 0xfeea1009  ! 420: LDSTUBA_R	ldstuba	%r31, [%r8 + %r9] 0x80
	.word 0xccb21009  ! 421: STHA_R	stha	%r6, [%r8 + %r9] 0x80
	.word 0x8af22bcc  ! 422: UDIVcc_I	udivcc 	%r8, 0x0bcc, %r5
	.word 0xc3ea1009  ! 423: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc73a23b0  ! 424: STDF_I	std	%f3, [0x03b0, %r8]
	.word 0xc6d22290  ! 425: LDSHA_I	ldsha	[%r8, + 0x0290] %asi, %r3
	.word 0xc36a2f4c  ! 426: PREFETCH_I	prefetch	[%r8 + 0x0f4c], #one_read
	.word 0xc3ea1009  ! 427: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x8da209a9  ! 428: FDIVs	fdivs	%f8, %f9, %f6
	.word 0xee220009  ! 430: STW_R	stw	%r23, [%r8 + %r9]
	.word 0xcc1a0009  ! 430: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xd62a0009  ! 432: STB_R	stb	%r11, [%r8 + %r9]
	.word 0xc6020009  ! 432: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xc5f22009  ! 433: CASXA_R	casxa	[%r8]%asi, %r9, %r2
	.word 0x8143e069  ! 434: MEMBAR	membar	#LoadLoad | #StoreStore | #MemIssue | #Sync 
	.word 0xc41a0009  ! 435: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xcbf21009  ! 436: CASXA_I	casxa	[%r8] 0x80, %r9, %r5
	.word 0xf00a2f20  ! 437: LDUB_I	ldub	[%r8 + 0x0f20], %r24
	.word 0x8fa20829  ! 438: FADDs	fadds	%f8, %f9, %f7
	.word 0x86520009  ! 439: UMUL_R	umul 	%r8, %r9, %r3
	.word 0xe0a225b0  ! 440: STWA_I	stwa	%r16, [%r8 + 0x05b0] %asi
	.word 0xf51a0009  ! 441: LDDF_R	ldd	[%r8, %r9], %f26
	.word 0xccda1009  ! 442: LDXA_R	ldxa	[%r8, %r9] 0x80, %r6
	.word 0x83a20929  ! 443: FMULs	fmuls	%f8, %f9, %f1
	.word 0xdc2a0009  ! 445: STB_R	stb	%r14, [%r8 + %r9]
	.word 0xc31a0009  ! 445: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xecf22a68  ! 446: STXA_I	stxa	%r22, [%r8 + 0x0a68] %asi
	.word 0xc6320009  ! 448: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xf71a0009  ! 448: LDDF_R	ldd	[%r8, %r9], %f27
	.word 0x89a209a9  ! 449: FDIVs	fdivs	%f8, %f9, %f4
	.word 0xc8da1009  ! 450: LDXA_R	ldxa	[%r8, %r9] 0x80, %r4
	.word 0xaba20929  ! 451: FMULs	fmuls	%f8, %f9, %f21
	.word 0xc36a2ce8  ! 452: PREFETCH_I	prefetch	[%r8 + 0x0ce8], #one_read
	.word 0x18800002  ! 453: BGU	bgu  	<label_0x2>
	.word 0xbada0009  ! 454: SMULcc_R	smulcc 	%r8, %r9, %r29
	.word 0x8143c000  ! 455: STBAR	stbar
	.word 0x8f220009  ! 456: MULScc_R	mulscc 	%r8, %r9, %r7
	.word 0x83a20929  ! 457: FMULs	fmuls	%f8, %f9, %f1
	.word 0xc4aa1009  ! 458: STBA_R	stba	%r2, [%r8 + %r9] 0x80
	.word 0xca220009  ! 460: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc84a0009  ! 460: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0x86fa2874  ! 461: SDIVcc_I	sdivcc 	%r8, 0x0874, %r3
	.word 0xc2921009  ! 462: LDUHA_R	lduha	[%r8, %r9] 0x80, %r1
	.word 0xcc220009  ! 464: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xce5a0009  ! 464: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xe28a1009  ! 465: LDUBA_R	lduba	[%r8, %r9] 0x80, %r17
	.word 0xe8720009  ! 467: STX_R	stx	%r20, [%r8 + %r9]
	.word 0xca120009  ! 467: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0x89220009  ! 468: MULScc_R	mulscc 	%r8, %r9, %r4
	.word 0x8143e007  ! 469: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore 
	.word 0xc4d21009  ! 470: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r2
	.word 0x04800001  ! 471: BLE	ble  	<label_0x1>
	.word 0xce2a0009  ! 473: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xe2420009  ! 473: LDSW_R	ldsw	[%r8 + %r9], %r17
	.word 0xc82a0009  ! 475: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc6020009  ! 475: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xc4ba2c40  ! 476: STDA_I	stda	%r2, [%r8 + 0x0c40] %asi
	.word 0xa9a20829  ! 477: FADDs	fadds	%f8, %f9, %f20
	.word 0xe8f21009  ! 478: STXA_R	stxa	%r20, [%r8 + %r9] 0x80
	.word 0xc3ea1009  ! 479: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xcf3a0009  ! 481: STDF_R	std	%f7, [%r9, %r8]
	.word 0xf0720009  ! 482: STX_R	stx	%r24, [%r8 + %r9]
	.word 0xc7020009  ! 482: LDF_R	ld	[%r8, %r9], %f3
	.word 0xfa420009  ! 483: LDSW_R	ldsw	[%r8 + %r9], %r29
	.word 0xb2da2d48  ! 484: SMULcc_I	smulcc 	%r8, 0x0d48, %r25
	.word 0xf66a0009  ! 485: LDSTUB_R	ldstub	%r27, [%r8 + %r9]
	.word 0xc6120009  ! 486: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xa8fa0009  ! 487: SDIVcc_R	sdivcc 	%r8, %r9, %r20
	.word 0xce6a289c  ! 488: LDSTUB_I	ldstub	%r7, [%r8 + 0x089c]
	.word 0x20800001  ! 489: BN	bn,a	<label_0x1>
	.word 0xc3ea2028  ! 490: PREFETCHA_I	prefetcha	[%r8, + 0x0028] %asi, #one_read
	.word 0xfe220009  ! 492: STW_R	stw	%r31, [%r8 + %r9]
	.word 0xcc020009  ! 492: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xc6ca295c  ! 493: LDSBA_I	ldsba	[%r8, + 0x095c] %asi, %r3
	.word 0x83a209a9  ! 494: FDIVs	fdivs	%f8, %f9, %f1
	.word 0xc8aa1009  ! 495: STBA_R	stba	%r4, [%r8 + %r9] 0x80
	.word 0x0eca0001  ! 496: BRGEZ	brgez  ,pt	%8,<label_0xa0001>
	.word 0xc2320009  ! 498: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc20a0009  ! 498: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xc93a2f08  ! 499: STDF_I	std	%f4, [0x0f08, %r8]
	.word 0x22800001  ! 500: BE	be,a	<label_0x1>
	.word 0xae6a0009  ! 501: UDIVX_R	udivx 	%r8, %r9, %r23
	.word 0xc6c21009  ! 502: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r3
	.word 0x8143c000  ! 503: STBAR	stbar
	.word 0xc2422e04  ! 504: LDSW_I	ldsw	[%r8 + 0x0e04], %r1
	.word 0x8ad22a58  ! 505: UMULcc_I	umulcc 	%r8, 0x0a58, %r5
	.word 0xc36a0009  ! 506: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc89a2a80  ! 507: LDDA_I	ldda	[%r8, + 0x0a80] %asi, %r4
	.word 0xca220009  ! 509: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc6020009  ! 509: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xc9222228  ! 510: STF_I	st	%f4, [0x0228, %r8]
	.word 0x32800001  ! 511: BNE	bne,a	<label_0x1>
	.word 0x06ca0001  ! 512: BRLZ	brlz  ,pt	%8,<label_0xa0001>
	.word 0xc8b21009  ! 513: STHA_R	stha	%r4, [%r8 + %r9] 0x80
	.word 0xc53a2b90  ! 514: STDF_I	std	%f2, [0x0b90, %r8]
	.word 0x8143c000  ! 515: STBAR	stbar
	.word 0xc88a2acc  ! 516: LDUBA_I	lduba	[%r8, + 0x0acc] %asi, %r4
	.word 0x8a4a2224  ! 517: MULX_I	mulx 	%r8, 0x0224, %r5
	.word 0x9da20929  ! 518: FMULs	fmuls	%f8, %f9, %f14
	.word 0xc36a2034  ! 519: PREFETCH_I	prefetch	[%r8 + 0x0034], #one_read
	.word 0xc82a0009  ! 521: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xe4020009  ! 521: LDUW_R	lduw	[%r8 + %r9], %r18
	.word 0x82fa0009  ! 522: SDIVcc_R	sdivcc 	%r8, %r9, %r1
	.word 0xcc122a24  ! 523: LDUH_I	lduh	[%r8 + 0x0a24], %r6
	.word 0xf0220009  ! 525: STW_R	stw	%r24, [%r8 + %r9]
	.word 0xe4520009  ! 525: LDSH_R	ldsh	[%r8 + %r9], %r18
	.word 0x8143e065  ! 526: MEMBAR	membar	#LoadLoad | #LoadStore | #MemIssue | #Sync 
	.word 0xc91a0009  ! 527: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xa0fa0009  ! 528: SDIVcc_R	sdivcc 	%r8, %r9, %r16
	.word 0xc3ea1009  ! 529: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xe10224a8  ! 530: LDF_I	ld	[%r8, 0x04a8], %f16
	.word 0x8af20009  ! 531: UDIVcc_R	udivcc 	%r8, %r9, %r5
	.word 0xfe020009  ! 532: LDUW_R	lduw	[%r8 + %r9], %r31
	.word 0x8143e07a  ! 533: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xb8d20009  ! 534: UMULcc_R	umulcc 	%r8, %r9, %r28
	.word 0xc3ea1009  ! 535: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x3e800001  ! 536: BVC	bvc,a	<label_0x1>
	.word 0x885a28c8  ! 537: SMUL_I	smul 	%r8, 0x08c8, %r4
	.word 0xc6b22a04  ! 538: STHA_I	stha	%r3, [%r8 + 0x0a04] %asi
	.word 0xccb22aac  ! 539: STHA_I	stha	%r6, [%r8 + 0x0aac] %asi
	.word 0xca6a2f60  ! 540: LDSTUB_I	ldstub	%r5, [%r8 + 0x0f60]
	.word 0xbfa208a9  ! 541: FSUBs	fsubs	%f8, %f9, %f31
	.word 0xc4ba29a8  ! 542: STDA_I	stda	%r2, [%r8 + 0x09a8] %asi
	.word 0x8143c000  ! 543: STBAR	stbar
	.word 0xe00222ec  ! 544: LDUW_I	lduw	[%r8 + 0x02ec], %r16
	.word 0x8143c000  ! 545: STBAR	stbar
	.word 0xcc320009  ! 547: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc20a0009  ! 547: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0x86fa2c48  ! 548: SDIVcc_I	sdivcc 	%r8, 0x0c48, %r3
	.word 0x88fa0009  ! 549: SDIVcc_R	sdivcc 	%r8, %r9, %r4
	.word 0xc28a1009  ! 550: LDUBA_R	lduba	[%r8, %r9] 0x80, %r1
	.word 0x8a4a258c  ! 551: MULX_I	mulx 	%r8, 0x058c, %r5
	.word 0xe88a2ebc  ! 552: LDUBA_I	lduba	[%r8, + 0x0ebc] %asi, %r20
	.word 0xca520009  ! 553: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xc6320009  ! 555: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xdb020009  ! 555: LDF_R	ld	[%r8, %r9], %f13
	.word 0xc36a2a6c  ! 556: PREFETCH_I	prefetch	[%r8 + 0x0a6c], #one_read
	.word 0xc36a23d4  ! 557: PREFETCH_I	prefetch	[%r8 + 0x03d4], #one_read
	.word 0x26c20001  ! 558: BRLZ	brlz,a,nt	%8,<label_0x20001>
	.word 0x8c5a0009  ! 559: SMUL_R	smul 	%r8, %r9, %r6
	.word 0xcc220009  ! 561: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xca120009  ! 561: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xc36a20f4  ! 562: PREFETCH_I	prefetch	[%r8 + 0x00f4], #one_read
	.word 0xc85a0009  ! 563: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xe0aa20f0  ! 564: STBA_I	stba	%r16, [%r8 + 0x00f0] %asi
	.word 0x88fa0009  ! 565: SDIVcc_R	sdivcc 	%r8, %r9, %r4
	.word 0x8fa20929  ! 566: FMULs	fmuls	%f8, %f9, %f7
	.word 0x20800001  ! 567: BN	bn,a	<label_0x1>
	.word 0x3c800001  ! 568: BPOS	bpos,a	<label_0x1>
	.word 0xc36a21e8  ! 569: PREFETCH_I	prefetch	[%r8 + 0x01e8], #one_read
	.word 0xccb21009  ! 570: STHA_R	stha	%r6, [%r8 + %r9] 0x80
	.word 0x87a20929  ! 571: FMULs	fmuls	%f8, %f9, %f3
	.word 0x8143e01f  ! 572: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #Lookaside 
	.word 0xc3ea1009  ! 573: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xd8ea1009  ! 574: LDSTUBA_R	ldstuba	%r12, [%r8 + %r9] 0x80
	.word 0xc4220009  ! 576: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc31a0009  ! 576: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xc6220009  ! 578: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xfe0a0009  ! 578: LDUB_R	ldub	[%r8 + %r9], %r31
	.word 0xcada1009  ! 579: LDXA_R	ldxa	[%r8, %r9] 0x80, %r5
	.word 0xc8020009  ! 580: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xc4d225c8  ! 581: LDSHA_I	ldsha	[%r8, + 0x05c8] %asi, %r2
	.word 0xff020009  ! 582: LDF_R	ld	[%r8, %r9], %f31
	.word 0x18800002  ! 583: BGU	bgu  	<label_0x2>
	.word 0xc7222014  ! 584: STF_I	st	%f3, [0x0014, %r8]
	.word 0x8c520009  ! 585: UMUL_R	umul 	%r8, %r9, %r6
	.word 0xc492267c  ! 586: LDUHA_I	lduha	[%r8, + 0x067c] %asi, %r2
	.word 0xccb21009  ! 587: STHA_R	stha	%r6, [%r8 + %r9] 0x80
	.word 0xc4220009  ! 589: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xca5a0009  ! 589: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0x8ba20829  ! 590: FADDs	fadds	%f8, %f9, %f5
	.word 0xc36a2c0c  ! 591: PREFETCH_I	prefetch	[%r8 + 0x0c0c], #one_read
	.word 0x824a0009  ! 592: MULX_R	mulx 	%r8, %r9, %r1
	.word 0xc2220009  ! 594: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xce0a0009  ! 594: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xced21009  ! 595: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r7
	.word 0xc3ea1009  ! 596: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc3ea1009  ! 597: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc5220009  ! 599: STF_R	st	%f2, [%r9, %r8]
	.word 0xce720009  ! 600: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xd8420009  ! 600: LDSW_R	ldsw	[%r8 + %r9], %r12
	.word 0xc4fa1009  ! 601: SWAPA_R	swapa	%r2, [%r8 + %r9] 0x80
	.word 0x8143e07a  ! 602: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xc3ea2b98  ! 603: PREFETCHA_I	prefetcha	[%r8, + 0x0b98] %asi, #one_read
	.word 0xca6a25c4  ! 604: LDSTUB_I	ldstub	%r5, [%r8 + 0x05c4]
	.word 0xc36a0009  ! 605: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xe8aa1009  ! 606: STBA_R	stba	%r20, [%r8 + %r9] 0x80
	.word 0xc36a2b60  ! 607: PREFETCH_I	prefetch	[%r8 + 0x0b60], #one_read
	.word 0x8cda2454  ! 608: SMULcc_I	smulcc 	%r8, 0x0454, %r6
	.word 0x0ec20001  ! 609: BRGEZ	brgez  ,nt	%8,<label_0x20001>
	.word 0xc5020009  ! 610: LDF_R	ld	[%r8, %r9], %f2
	.word 0xdac225b4  ! 611: LDSWA_I	ldswa	[%r8, + 0x05b4] %asi, %r13
	.word 0xc2aa25c8  ! 612: STBA_I	stba	%r1, [%r8 + 0x05c8] %asi
	.word 0xc42a0009  ! 614: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc3020009  ! 614: LDF_R	ld	[%r8, %r9], %f1
	.word 0xe41a2940  ! 615: LDD_I	ldd	[%r8 + 0x0940], %r18
	.word 0xe6f22538  ! 616: STXA_I	stxa	%r19, [%r8 + 0x0538] %asi
	.word 0xccba1009  ! 617: STDA_R	stda	%r6, [%r8 + %r9] 0x80
	.word 0xc45a0009  ! 618: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xcd220009  ! 620: STF_R	st	%f6, [%r9, %r8]
	.word 0xfa720009  ! 621: STX_R	stx	%r29, [%r8 + %r9]
	.word 0xe8420009  ! 621: LDSW_R	ldsw	[%r8 + %r9], %r20
	.word 0x847a0009  ! 622: SDIV_R	sdiv 	%r8, %r9, %r2
	.word 0xfa220009  ! 624: STW_R	stw	%r29, [%r8 + %r9]
	.word 0xc2120009  ! 624: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xca320009  ! 626: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc85a0009  ! 626: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xc8220009  ! 628: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xfa020009  ! 628: LDUW_R	lduw	[%r8 + %r9], %r29
	.word 0x85a20929  ! 629: FMULs	fmuls	%f8, %f9, %f2
	.word 0x8e6a0009  ! 630: UDIVX_R	udivx 	%r8, %r9, %r7
	.word 0xf2320009  ! 632: STH_R	sth	%r25, [%r8 + %r9]
	.word 0xfc420009  ! 632: LDSW_R	ldsw	[%r8 + %r9], %r30
	.word 0x0e800001  ! 633: BVS	bvs  	<label_0x1>
	.word 0x8143e066  ! 634: MEMBAR	membar	#StoreLoad | #LoadStore | #MemIssue | #Sync 
	.word 0xc67a0009  ! 635: SWAP_R	swap	%r3, [%r8 + %r9]
	.word 0x85222acc  ! 636: MULScc_I	mulscc 	%r8, 0x0acc, %r2
	.word 0x18800001  ! 637: BGU	bgu  	<label_0x1>
	.word 0xcb1a2e80  ! 638: LDDF_I	ldd	[%r8, 0x0e80], %f5
	.word 0xc93a0009  ! 640: STDF_R	std	%f4, [%r9, %r8]
	.word 0xcc720009  ! 641: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xce4a0009  ! 641: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xcd1a0009  ! 642: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xcc6a0009  ! 643: LDSTUB_R	ldstub	%r6, [%r8 + %r9]
	.word 0xb56a2428  ! 644: SDIVX_I	sdivx	%r8, 0x0428, %r26
	.word 0xce2a0009  ! 646: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xce120009  ! 646: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xc8ba1009  ! 647: STDA_R	stda	%r4, [%r8 + %r9] 0x80
	.word 0x8143e017  ! 648: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside 
	.word 0xc8ca22d0  ! 649: LDSBA_I	ldsba	[%r8, + 0x02d0] %asi, %r4
	.word 0x8da209a9  ! 650: FDIVs	fdivs	%f8, %f9, %f6
	.word 0x8ba20829  ! 651: FADDs	fadds	%f8, %f9, %f5
	.word 0xc3ea1009  ! 652: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xcc720009  ! 654: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xf31a0009  ! 654: LDDF_R	ldd	[%r8, %r9], %f25
	.word 0x8143e043  ! 655: MEMBAR	membar	#LoadLoad | #StoreLoad | #Sync 
	.word 0xe6fa1009  ! 656: SWAPA_R	swapa	%r19, [%r8 + %r9] 0x80
	.word 0xa7a209a9  ! 657: FDIVs	fdivs	%f8, %f9, %f19
	.word 0xf8ba1009  ! 658: STDA_R	stda	%r28, [%r8 + %r9] 0x80
	.word 0xc3ea1009  ! 659: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x8143e036  ! 660: MEMBAR	membar	#StoreLoad | #LoadStore | #Lookaside | #MemIssue 
	.word 0x844a0009  ! 661: MULX_R	mulx 	%r8, %r9, %r2
	.word 0xecea1009  ! 662: LDSTUBA_R	ldstuba	%r22, [%r8 + %r9] 0x80
	.word 0xccea2ff0  ! 663: LDSTUBA_I	ldstuba	%r6, [%r8 + 0x0ff0] %asi
	.word 0x88d20009  ! 664: UMULcc_R	umulcc 	%r8, %r9, %r4
	.word 0x0a800001  ! 665: BCS	bcs  	<label_0x1>
	.word 0xc86a2b60  ! 666: LDSTUB_I	ldstub	%r4, [%r8 + 0x0b60]
	.word 0x824a27a4  ! 667: MULX_I	mulx 	%r8, 0x07a4, %r1
	.word 0xa0522850  ! 668: UMUL_I	umul 	%r8, 0x0850, %r16
	.word 0xc5220009  ! 670: STF_R	st	%f2, [%r9, %r8]
	.word 0xc6720009  ! 671: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xf05a0009  ! 671: LDX_R	ldx	[%r8 + %r9], %r24
	.word 0xca122924  ! 672: LDUH_I	lduh	[%r8 + 0x0924], %r5
	.word 0x887a0009  ! 673: SDIV_R	sdiv 	%r8, %r9, %r4
	.word 0xca4a2790  ! 674: LDSB_I	ldsb	[%r8 + 0x0790], %r5
	.word 0x86fa2218  ! 675: SDIVcc_I	sdivcc 	%r8, 0x0218, %r3
	.word 0x82d20009  ! 676: UMULcc_R	umulcc 	%r8, %r9, %r1
	.word 0xc6aa1009  ! 677: STBA_R	stba	%r3, [%r8 + %r9] 0x80
	.word 0xc36a0009  ! 678: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xcad22760  ! 679: LDSHA_I	ldsha	[%r8, + 0x0760] %asi, %r5
	.word 0xc4220009  ! 681: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xce120009  ! 681: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xca7a289c  ! 682: SWAP_I	swap	%r5, [%r8 + 0x089c]
	.word 0xf49a1009  ! 683: LDDA_R	ldda	[%r8, %r9] 0x80, %r26
	.word 0xc6720009  ! 685: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc31a0009  ! 685: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xcada2938  ! 686: LDXA_I	ldxa	[%r8, + 0x0938] %asi, %r5
	.word 0xac7229f4  ! 687: UDIV_I	udiv 	%r8, 0x09f4, %r22
	.word 0xcc6a2b48  ! 688: LDSTUB_I	ldstub	%r6, [%r8 + 0x0b48]
	.word 0xc3ea2cd0  ! 689: PREFETCHA_I	prefetcha	[%r8, + 0x0cd0] %asi, #one_read
	.word 0x8afa2e84  ! 690: SDIVcc_I	sdivcc 	%r8, 0x0e84, %r5
	.word 0xcaca2f48  ! 691: LDSBA_I	ldsba	[%r8, + 0x0f48] %asi, %r5
	.word 0xfb220009  ! 693: STF_R	st	%f29, [%r9, %r8]
	.word 0xf4720009  ! 694: STX_R	stx	%r26, [%r8 + %r9]
	.word 0xc25a0009  ! 694: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0x89a20829  ! 695: FADDs	fadds	%f8, %f9, %f4
	.word 0xbafa2678  ! 696: SDIVcc_I	sdivcc 	%r8, 0x0678, %r29
	.word 0x8143c000  ! 697: STBAR	stbar
	.word 0xc6aa24f0  ! 698: STBA_I	stba	%r3, [%r8 + 0x04f0] %asi
	.word 0x9afa2cbc  ! 699: SDIVcc_I	sdivcc 	%r8, 0x0cbc, %r13
	.word 0x9fa20829  ! 700: FADDs	fadds	%f8, %f9, %f15
	.word 0xf49a1009  ! 701: LDDA_R	ldda	[%r8, %r9] 0x80, %r26
	.word 0x24c20001  ! 702: BRLEZ	brlez,a,nt	%8,<label_0x20001>
	.word 0xccb21009  ! 703: STHA_R	stha	%r6, [%r8 + %r9] 0x80
	.word 0xce2a0009  ! 705: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xea520009  ! 705: LDSH_R	ldsh	[%r8 + %r9], %r21
	.word 0xc36a0009  ! 706: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xa56a2fa0  ! 707: SDIVX_I	sdivx	%r8, 0x0fa0, %r18
	.word 0x8c7a2a68  ! 708: SDIV_I	sdiv 	%r8, 0x0a68, %r6
	.word 0xe4b21009  ! 709: STHA_R	stha	%r18, [%r8 + %r9] 0x80
	.word 0xacda0009  ! 710: SMULcc_R	smulcc 	%r8, %r9, %r22
	.word 0xc93a2340  ! 711: STDF_I	std	%f4, [0x0340, %r8]
	.word 0xcc5a0009  ! 712: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xc4a22570  ! 713: STWA_I	stwa	%r2, [%r8 + 0x0570] %asi
	.word 0xc36a0009  ! 714: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc86a21e0  ! 715: LDSTUB_I	ldstub	%r4, [%r8 + 0x01e0]
	.word 0x8c5229d4  ! 716: UMUL_I	umul 	%r8, 0x09d4, %r6
	.word 0xc8022664  ! 717: LDUW_I	lduw	[%r8 + 0x0664], %r4
	.word 0xc4320009  ! 719: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc6020009  ! 719: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0x14800002  ! 720: BG	bg  	<label_0x2>
	.word 0x87a20829  ! 721: FADDs	fadds	%f8, %f9, %f3
	.word 0xe6921009  ! 722: LDUHA_R	lduha	[%r8, %r9] 0x80, %r19
	.word 0x1c800002  ! 723: BPOS	bpos  	<label_0x2>
	.word 0xc6ea2784  ! 724: LDSTUBA_I	ldstuba	%r3, [%r8 + 0x0784] %asi
	.word 0xca2a0009  ! 726: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc3020009  ! 726: LDF_R	ld	[%r8, %r9], %f1
	.word 0x89220009  ! 727: MULScc_R	mulscc 	%r8, %r9, %r4
	.word 0xc88a25e0  ! 728: LDUBA_I	lduba	[%r8, + 0x05e0] %asi, %r4
	.word 0x824a2630  ! 729: MULX_I	mulx 	%r8, 0x0630, %r1
	.word 0x8143c000  ! 730: STBAR	stbar
	.word 0x88d20009  ! 731: UMULcc_R	umulcc 	%r8, %r9, %r4
	.word 0x8143e039  ! 732: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside | #MemIssue 
	.word 0xc73a2f38  ! 733: STDF_I	std	%f3, [0x0f38, %r8]
	.word 0xc4320009  ! 735: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xf4520009  ! 735: LDSH_R	ldsh	[%r8 + %r9], %r26
	.word 0xd8921009  ! 736: LDUHA_R	lduha	[%r8, %r9] 0x80, %r12
	.word 0x8143c000  ! 737: STBAR	stbar
	.word 0xc8f21009  ! 738: STXA_R	stxa	%r4, [%r8 + %r9] 0x80
	.word 0xc9220009  ! 740: STF_R	st	%f4, [%r9, %r8]
	.word 0xc4720009  ! 741: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc2520009  ! 741: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0x2a800001  ! 742: BCS	bcs,a	<label_0x1>
	.word 0xc3ea2dd4  ! 743: PREFETCHA_I	prefetcha	[%r8, + 0x0dd4] %asi, #one_read
	.word 0xcc9a25b0  ! 744: LDDA_I	ldda	[%r8, + 0x05b0] %asi, %r6
	.word 0x26800001  ! 745: BL	bl,a	<label_0x1>
	.word 0xca122dd0  ! 746: LDUH_I	lduh	[%r8 + 0x0dd0], %r5
	.word 0xe0aa2af8  ! 747: STBA_I	stba	%r16, [%r8 + 0x0af8] %asi
	.word 0xc8320009  ! 749: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xcc420009  ! 749: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xc31a0009  ! 750: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0x0a800001  ! 751: BCS	bcs  	<label_0x1>
	.word 0xcd3a2df0  ! 752: STDF_I	std	%f6, [0x0df0, %r8]
	.word 0xa7a208a9  ! 753: FSUBs	fsubs	%f8, %f9, %f19
	.word 0xc3ea1009  ! 754: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc36a0009  ! 755: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc9e21009  ! 756: CASA_I	casa	[%r8] 0x80, %r9, %r4
	.word 0x8eda0009  ! 757: SMULcc_R	smulcc 	%r8, %r9, %r7
	.word 0xcaca2c14  ! 758: LDSBA_I	ldsba	[%r8, + 0x0c14] %asi, %r5
	.word 0xc01a0009  ! 759: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0xc72225fc  ! 760: STF_I	st	%f3, [0x05fc, %r8]
	.word 0x84fa0009  ! 761: SDIVcc_R	sdivcc 	%r8, %r9, %r2
	.word 0xc4220009  ! 763: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xe04a0009  ! 763: LDSB_R	ldsb	[%r8 + %r9], %r16
	.word 0x876a0009  ! 764: SDIVX_R	sdivx	%r8, %r9, %r3
	.word 0x8143e068  ! 765: MEMBAR	membar	#StoreStore | #MemIssue | #Sync 
	.word 0xcc420009  ! 766: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0x2c800002  ! 767: BNEG	bneg,a	<label_0x2>
	.word 0xc22a0009  ! 769: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc80a0009  ! 769: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xbad22e48  ! 770: UMULcc_I	umulcc 	%r8, 0x0e48, %r29
	.word 0xcd3a2640  ! 771: STDF_I	std	%f6, [0x0640, %r8]
	.word 0xe6422ce0  ! 772: LDSW_I	ldsw	[%r8 + 0x0ce0], %r19
	.word 0xc8420009  ! 773: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xce7a23b8  ! 774: SWAP_I	swap	%r7, [%r8 + 0x03b8]
	.word 0x8cd20009  ! 775: UMULcc_R	umulcc 	%r8, %r9, %r6
	.word 0xd8a22560  ! 776: STWA_I	stwa	%r12, [%r8 + 0x0560] %asi
	.word 0xca921009  ! 777: LDUHA_R	lduha	[%r8, %r9] 0x80, %r5
	.word 0xc3ea1009  ! 778: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc3ea1009  ! 779: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xf9e22009  ! 780: CASA_R	casa	[%r8] %asi, %r9, %r28
	.word 0xc36a0009  ! 781: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xcc220009  ! 783: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc40a0009  ! 783: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xc46a0009  ! 784: LDSTUB_R	ldstub	%r2, [%r8 + %r9]
	.word 0xf73a2da0  ! 785: STDF_I	std	%f27, [0x0da0, %r8]
	.word 0xe0da1009  ! 786: LDXA_R	ldxa	[%r8, %r9] 0x80, %r16
	.word 0xf8220009  ! 788: STW_R	stw	%r28, [%r8 + %r9]
	.word 0xd8120009  ! 788: LDUH_R	lduh	[%r8 + %r9], %r12
	.word 0xcaf21009  ! 789: STXA_R	stxa	%r5, [%r8 + %r9] 0x80
	.word 0xc42a0009  ! 791: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xd84a0009  ! 791: LDSB_R	ldsb	[%r8 + %r9], %r12
	.word 0x0aca0001  ! 792: BRNZ	brnz  ,pt	%8,<label_0xa0001>
	.word 0xc85a0009  ! 793: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xc3ea21d4  ! 794: PREFETCHA_I	prefetcha	[%r8, + 0x01d4] %asi, #one_read
	.word 0x8f22267c  ! 795: MULScc_I	mulscc 	%r8, 0x067c, %r7
	.word 0xc36a2af4  ! 796: PREFETCH_I	prefetch	[%r8 + 0x0af4], #one_read
	.word 0xccd21009  ! 797: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r6
	.word 0xea220009  ! 799: STW_R	stw	%r21, [%r8 + %r9]
	.word 0xc84a0009  ! 799: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xc36a2158  ! 800: PREFETCH_I	prefetch	[%r8 + 0x0158], #one_read
	.word 0x876a0009  ! 801: SDIVX_R	sdivx	%r8, %r9, %r3
	.word 0xc8a2204c  ! 802: STWA_I	stwa	%r4, [%r8 + 0x004c] %asi
	.word 0xea320009  ! 804: STH_R	sth	%r21, [%r8 + %r9]
	.word 0xc8520009  ! 804: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0x1c800001  ! 805: BPOS	bpos  	<label_0x1>
	.word 0xf3f21009  ! 806: CASXA_I	casxa	[%r8] 0x80, %r9, %r25
	.word 0xc66a2490  ! 807: LDSTUB_I	ldstub	%r3, [%r8 + 0x0490]
	.word 0xc4d22bcc  ! 808: LDSHA_I	ldsha	[%r8, + 0x0bcc] %asi, %r2
	.word 0xa8720009  ! 809: UDIV_R	udiv 	%r8, %r9, %r20
	.word 0xc3ea1009  ! 810: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xac4a2e0c  ! 811: MULX_I	mulx 	%r8, 0x0e0c, %r22
	.word 0xb4f229e8  ! 812: UDIVcc_I	udivcc 	%r8, 0x09e8, %r26
	.word 0xcf220009  ! 814: STF_R	st	%f7, [%r9, %r8]
	.word 0xcc720009  ! 815: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xf01a0009  ! 815: LDD_R	ldd	[%r8 + %r9], %r24
	.word 0x87a208a9  ! 816: FSUBs	fsubs	%f8, %f9, %f3
	.word 0xc86a0009  ! 817: LDSTUB_R	ldstub	%r4, [%r8 + %r9]
	.word 0x85a20929  ! 818: FMULs	fmuls	%f8, %f9, %f2
	.word 0xfa320009  ! 820: STH_R	sth	%r29, [%r8 + %r9]
	.word 0xd8520009  ! 820: LDSH_R	ldsh	[%r8 + %r9], %r12
	.word 0xcc7a2c9c  ! 821: SWAP_I	swap	%r6, [%r8 + 0x0c9c]
	.word 0xc41a0009  ! 822: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xc2320009  ! 824: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xce5a0009  ! 824: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0x885a0009  ! 825: SMUL_R	smul 	%r8, %r9, %r4
	.word 0xc93a2dd0  ! 826: STDF_I	std	%f4, [0x0dd0, %r8]
	.word 0xc3ea2ba4  ! 827: PREFETCHA_I	prefetcha	[%r8, + 0x0ba4] %asi, #one_read
	.word 0xc4921009  ! 828: LDUHA_R	lduha	[%r8, %r9] 0x80, %r2
	.word 0xc81a0009  ! 829: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xc36a202c  ! 830: PREFETCH_I	prefetch	[%r8 + 0x002c], #one_read
	.word 0xc36a2cd8  ! 831: PREFETCH_I	prefetch	[%r8 + 0x0cd8], #one_read
	.word 0x8143e07a  ! 832: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xc3ea2534  ! 833: PREFETCHA_I	prefetcha	[%r8, + 0x0534] %asi, #one_read
	.word 0xce720009  ! 835: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc6420009  ! 835: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xcaa22478  ! 836: STWA_I	stwa	%r5, [%r8 + 0x0478] %asi
	.word 0x8a4a0009  ! 837: MULX_R	mulx 	%r8, %r9, %r5
	.word 0xcad226d4  ! 838: LDSHA_I	ldsha	[%r8, + 0x06d4] %asi, %r5
	.word 0x8143e01e  ! 839: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside 
	.word 0x2e800001  ! 840: BVS	bvs,a	<label_0x1>
	.word 0xf2da2ac8  ! 841: LDXA_I	ldxa	[%r8, + 0x0ac8] %asi, %r25
	.word 0xd6ea1009  ! 842: LDSTUBA_R	ldstuba	%r11, [%r8 + %r9] 0x80
	.word 0xc2220009  ! 844: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xfc4a0009  ! 844: LDSB_R	ldsb	[%r8 + %r9], %r30
	.word 0xecfa2a0c  ! 845: SWAPA_I	swapa	%r22, [%r8 + 0x0a0c] %asi
	.word 0xca520009  ! 846: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0x8143e06b  ! 847: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #MemIssue | #Sync 
	.word 0xc73a2fd8  ! 848: STDF_I	std	%f3, [0x0fd8, %r8]
	.word 0xc8a21009  ! 849: STWA_R	stwa	%r4, [%r8 + %r9] 0x80
	.word 0x88f20009  ! 850: UDIVcc_R	udivcc 	%r8, %r9, %r4
	.word 0xca2a0009  ! 852: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc84a0009  ! 852: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xf4320009  ! 854: STH_R	sth	%r26, [%r8 + %r9]
	.word 0xfa520009  ! 854: LDSH_R	ldsh	[%r8 + %r9], %r29
	.word 0x8143c000  ! 855: STBAR	stbar
	.word 0x826a2ea4  ! 856: UDIVX_I	udivx 	%r8, 0x0ea4, %r1
	.word 0x8143e07f  ! 857: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xca220009  ! 859: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc71a0009  ! 859: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xc4220009  ! 861: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xf71a0009  ! 861: LDDF_R	ldd	[%r8, %r9], %f27
	.word 0xc36a0009  ! 862: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xcb222354  ! 863: STF_I	st	%f5, [0x0354, %r8]
	.word 0x40000001  ! 864: CALL	call	disp30_1
	.word 0x9a5a2b68  ! 865: SMUL_I	smul 	%r8, 0x0b68, %r13
	.word 0x8c7a0009  ! 866: SDIV_R	sdiv 	%r8, %r9, %r6
	.word 0xe0320009  ! 868: STH_R	sth	%r16, [%r8 + %r9]
	.word 0xc45a0009  ! 868: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0x89a208a9  ! 869: FSUBs	fsubs	%f8, %f9, %f4
	.word 0xc22a0009  ! 871: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xcd020009  ! 871: LDF_R	ld	[%r8, %r9], %f6
	.word 0x827a26c4  ! 872: SDIV_I	sdiv 	%r8, 0x06c4, %r1
	.word 0xfcb21009  ! 873: STHA_R	stha	%r30, [%r8 + %r9] 0x80
	.word 0xccca1009  ! 874: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r6
	.word 0xfca21009  ! 875: STWA_R	stwa	%r30, [%r8 + %r9] 0x80
	.word 0xc2d21009  ! 876: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r1
	.word 0x8e520009  ! 877: UMUL_R	umul 	%r8, %r9, %r7
	.word 0xf2320009  ! 879: STH_R	sth	%r25, [%r8 + %r9]
	.word 0xe0020009  ! 879: LDUW_R	lduw	[%r8 + %r9], %r16
	.word 0xce220009  ! 881: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc8120009  ! 881: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xc7f21009  ! 882: CASXA_I	casxa	[%r8] 0x80, %r9, %r3
	.word 0xcb2223b4  ! 883: STF_I	st	%f5, [0x03b4, %r8]
	.word 0xe89a2358  ! 884: LDDA_I	ldda	[%r8, + 0x0358] %asi, %r20
	.word 0xc25221ec  ! 885: LDSH_I	ldsh	[%r8 + 0x01ec], %r1
	.word 0xcf220009  ! 887: STF_R	st	%f7, [%r9, %r8]
	.word 0xca720009  ! 888: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xfe0a0009  ! 888: LDUB_R	ldub	[%r8 + %r9], %r31
	.word 0x8ba20929  ! 889: FMULs	fmuls	%f8, %f9, %f5
	.word 0xc36a0009  ! 890: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0x32800001  ! 891: BNE	bne,a	<label_0x1>
	.word 0xcc5a2090  ! 892: LDX_I	ldx	[%r8 + 0x0090], %r6
	.word 0xc36a0009  ! 893: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0x8a5220f0  ! 894: UMUL_I	umul 	%r8, 0x00f0, %r5
	.word 0x38800002  ! 895: BGU	bgu,a	<label_0x2>
	.word 0xc82a0009  ! 897: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc6020009  ! 897: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0x24800002  ! 898: BLE	ble,a	<label_0x2>
	.word 0xd8120009  ! 899: LDUH_R	lduh	[%r8 + %r9], %r12
	.word 0x2a800002  ! 900: BCS	bcs,a	<label_0x2>
	.word 0xf1e21009  ! 901: CASA_I	casa	[%r8] 0x80, %r9, %r24
	.word 0xc2fa1009  ! 902: SWAPA_R	swapa	%r1, [%r8 + %r9] 0x80
	.word 0xf89a2de0  ! 903: LDDA_I	ldda	[%r8, + 0x0de0] %asi, %r28
	.word 0x8143c000  ! 904: STBAR	stbar
	.word 0xcea22d14  ! 905: STWA_I	stwa	%r7, [%r8 + 0x0d14] %asi
	.word 0x8da20929  ! 906: FMULs	fmuls	%f8, %f9, %f6
	.word 0xcc520009  ! 907: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xc8a21009  ! 908: STWA_R	stwa	%r4, [%r8 + %r9] 0x80
	.word 0x86720009  ! 909: UDIV_R	udiv 	%r8, %r9, %r3
	.word 0xfa220009  ! 911: STW_R	stw	%r29, [%r8 + %r9]
	.word 0xdf020009  ! 911: LDF_R	ld	[%r8, %r9], %f15
	.word 0x8fa209a9  ! 912: FDIVs	fdivs	%f8, %f9, %f7
	.word 0xc36a0009  ! 913: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc8f21009  ! 914: STXA_R	stxa	%r4, [%r8 + %r9] 0x80
	.word 0xea420009  ! 915: LDSW_R	ldsw	[%r8 + %r9], %r21
	.word 0xc3ea1009  ! 916: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xce0a2718  ! 917: LDUB_I	ldub	[%r8 + 0x0718], %r7
	.word 0x16800001  ! 918: BGE	bge  	<label_0x1>
	.word 0x824a0009  ! 919: MULX_R	mulx 	%r8, %r9, %r1
	.word 0x8143e02a  ! 920: MEMBAR	membar	#StoreLoad | #StoreStore | #MemIssue 
	.word 0xca220009  ! 922: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc71a0009  ! 922: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xc66a0009  ! 923: LDSTUB_R	ldstub	%r3, [%r8 + %r9]
	.word 0xc82a0009  ! 925: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xcd020009  ! 925: LDF_R	ld	[%r8, %r9], %f6
	.word 0xc36a0009  ! 926: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xcb3a2ee0  ! 927: STDF_I	std	%f5, [0x0ee0, %r8]
	.word 0xd6b22b60  ! 928: STHA_I	stha	%r11, [%r8 + 0x0b60] %asi
	.word 0xfc320009  ! 930: STH_R	sth	%r30, [%r8 + %r9]
	.word 0xc44a0009  ! 930: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xc3e21009  ! 931: CASA_I	casa	[%r8] 0x80, %r9, %r1
	.word 0x8da208a9  ! 932: FSUBs	fsubs	%f8, %f9, %f6
	.word 0xba4a0009  ! 933: MULX_R	mulx 	%r8, %r9, %r29
	.word 0x8af22274  ! 934: UDIVcc_I	udivcc 	%r8, 0x0274, %r5
	.word 0x884a0009  ! 935: MULX_R	mulx 	%r8, %r9, %r4
	.word 0xf4522c78  ! 936: LDSH_I	ldsh	[%r8 + 0x0c78], %r26
	.word 0xd8f22df8  ! 937: STXA_I	stxa	%r12, [%r8 + 0x0df8] %asi
	.word 0xce922e98  ! 938: LDUHA_I	lduha	[%r8, + 0x0e98] %asi, %r7
	.word 0xc25a0009  ! 939: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0x8a720009  ! 940: UDIV_R	udiv 	%r8, %r9, %r5
	.word 0xcf22230c  ! 941: STF_I	st	%f7, [0x030c, %r8]
	.word 0x34800002  ! 942: BG	bg,a	<label_0x2>
	.word 0x8143c000  ! 943: STBAR	stbar
	.word 0xed020009  ! 944: LDF_R	ld	[%r8, %r9], %f22
	.word 0x8143e046  ! 945: MEMBAR	membar	#StoreLoad | #LoadStore | #Sync 
	.word 0xc49a2b58  ! 946: LDDA_I	ldda	[%r8, + 0x0b58] %asi, %r2
	.word 0xf7f22009  ! 947: CASXA_R	casxa	[%r8]%asi, %r9, %r27
	.word 0xac5a0009  ! 948: SMUL_R	smul 	%r8, %r9, %r22
	.word 0x8af20009  ! 949: UDIVcc_R	udivcc 	%r8, %r9, %r5
	.word 0xc3ea204c  ! 950: PREFETCHA_I	prefetcha	[%r8, + 0x004c] %asi, #one_read
	.word 0x9a5a229c  ! 951: SMUL_I	smul 	%r8, 0x029c, %r13
	.word 0x8da208a9  ! 952: FSUBs	fsubs	%f8, %f9, %f6
	.word 0xcec21009  ! 953: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r7
	.word 0xca122a1c  ! 954: LDUH_I	lduh	[%r8 + 0x0a1c], %r5
	.word 0xceb21009  ! 955: STHA_R	stha	%r7, [%r8 + %r9] 0x80
	.word 0xc3ea1009  ! 956: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc7e21009  ! 957: CASA_I	casa	[%r8] 0x80, %r9, %r3
	.word 0xcada1009  ! 958: LDXA_R	ldxa	[%r8, %r9] 0x80, %r5
	.word 0xe2b22838  ! 959: STHA_I	stha	%r17, [%r8 + 0x0838] %asi
	.word 0x8cf20009  ! 960: UDIVcc_R	udivcc 	%r8, %r9, %r6
	.word 0xbe4a2c78  ! 961: MULX_I	mulx 	%r8, 0x0c78, %r31
	.word 0xc86a0009  ! 962: LDSTUB_R	ldstub	%r4, [%r8 + %r9]
	.word 0x8143e050  ! 963: MEMBAR	membar	#Lookaside | #Sync 
	.word 0xce7a0009  ! 964: SWAP_R	swap	%r7, [%r8 + %r9]
	.word 0x8143c000  ! 965: STBAR	stbar
	.word 0xc36a2b68  ! 966: PREFETCH_I	prefetch	[%r8 + 0x0b68], #one_read
	.word 0xcb2228e8  ! 967: STF_I	st	%f5, [0x08e8, %r8]
	.word 0xc8ba2688  ! 968: STDA_I	stda	%r4, [%r8 + 0x0688] %asi
	.word 0xc8320009  ! 970: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xfc020009  ! 970: LDUW_R	lduw	[%r8 + %r9], %r30
	.word 0xc3ea1009  ! 971: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xcbe21009  ! 972: CASA_I	casa	[%r8] 0x80, %r9, %r5
	.word 0x0c800001  ! 973: BNEG	bneg  	<label_0x1>
	.word 0xc46a0009  ! 974: LDSTUB_R	ldstub	%r2, [%r8 + %r9]
	.word 0xe1f21009  ! 975: CASXA_I	casxa	[%r8] 0x80, %r9, %r16
	.word 0xc3ea1009  ! 976: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xee821009  ! 977: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r23
	.word 0xcf222bac  ! 978: STF_I	st	%f7, [0x0bac, %r8]
	.word 0x8cda0009  ! 979: SMULcc_R	smulcc 	%r8, %r9, %r6
	.word 0x825a2ccc  ! 980: SMUL_I	smul 	%r8, 0x0ccc, %r1
	.word 0xc46a0009  ! 981: LDSTUB_R	ldstub	%r2, [%r8 + %r9]
	.word 0x12800001  ! 982: BNE	bne  	<label_0x1>
	.word 0xb8f226c4  ! 983: UDIVcc_I	udivcc 	%r8, 0x06c4, %r28
	.word 0xccb21009  ! 984: STHA_R	stha	%r6, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 985: STBAR	stbar
	.word 0xf2c21009  ! 986: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r25
	.word 0x00800002  ! 987: BN	bn  	<label_0x2>
	.word 0x12800001  ! 988: BNE	bne  	<label_0x1>
	.word 0x06ca0001  ! 989: BRLZ	brlz  ,pt	%8,<label_0xa0001>
	.word 0x8143c000  ! 990: STBAR	stbar
	.word 0xf1220009  ! 992: STF_R	st	%f24, [%r9, %r8]
	.word 0xc4720009  ! 993: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xcc520009  ! 993: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xc36a0009  ! 994: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc8220009  ! 996: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xe8120009  ! 996: LDUH_R	lduh	[%r8 + %r9], %r20
	.word 0x8cfa254c  ! 997: SDIVcc_I	sdivcc 	%r8, 0x054c, %r6
	.word 0xc3ea1009  ! 998: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xcec22bac  ! 999: LDSWA_I	ldswa	[%r8, + 0x0bac] %asi, %r7
	.word 0xc3ea1009  ! 1000: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc36a2350  ! 1001: PREFETCH_I	prefetch	[%r8 + 0x0350], #one_read
	.word 0x8c4a0009  ! 1002: MULX_R	mulx 	%r8, %r9, %r6
	.word 0x8a4a0009  ! 1003: MULX_R	mulx 	%r8, %r9, %r5
	.word 0xcaf22a60  ! 1004: STXA_I	stxa	%r5, [%r8 + 0x0a60] %asi
	.word 0x8c4a0009  ! 1005: MULX_R	mulx 	%r8, %r9, %r6
	.word 0xcc220009  ! 1007: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xce420009  ! 1007: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xc20a2c28  ! 1008: LDUB_I	ldub	[%r8 + 0x0c28], %r1
	.word 0x96da0009  ! 1009: SMULcc_R	smulcc 	%r8, %r9, %r11
	.word 0xc36a2f04  ! 1010: PREFETCH_I	prefetch	[%r8 + 0x0f04], #one_read
	.word 0x8e5a2b50  ! 1011: SMUL_I	smul 	%r8, 0x0b50, %r7
	.word 0xde720009  ! 1013: STX_R	stx	%r15, [%r8 + %r9]
	.word 0xf71a0009  ! 1013: LDDF_R	ldd	[%r8, %r9], %f27
	.word 0xce320009  ! 1015: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc6420009  ! 1015: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xc8ba2870  ! 1016: STDA_I	stda	%r4, [%r8 + 0x0870] %asi
	.word 0x8143c000  ! 1017: STBAR	stbar
	.word 0x89a208a9  ! 1018: FSUBs	fsubs	%f8, %f9, %f4
	.word 0xc36a0009  ! 1019: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xce220009  ! 1021: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xe4120009  ! 1021: LDUH_R	lduh	[%r8 + %r9], %r18
	.word 0x8143c000  ! 1022: STBAR	stbar
	.word 0xffe22009  ! 1023: CASA_R	casa	[%r8] %asi, %r9, %r31
	.word 0xe73a25a8  ! 1024: STDF_I	std	%f19, [0x05a8, %r8]
	.word 0xd8ea260c  ! 1025: LDSTUBA_I	ldstuba	%r12, [%r8 + 0x060c] %asi
	.word 0x8e6a0009  ! 1026: UDIVX_R	udivx 	%r8, %r9, %r7
	.word 0xc44a2820  ! 1027: LDSB_I	ldsb	[%r8 + 0x0820], %r2
	.word 0x8a6a0009  ! 1028: UDIVX_R	udivx 	%r8, %r9, %r5
	.word 0xc24a0009  ! 1029: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0x8143c000  ! 1030: STBAR	stbar
	.word 0xc47a0009  ! 1031: SWAP_R	swap	%r2, [%r8 + %r9]
	.word 0x00800001  ! 1032: BN	bn  	<label_0x1>
	.word 0xea821009  ! 1033: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r21
	.word 0xc3ea1009  ! 1034: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xca220009  ! 1036: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xee4a0009  ! 1036: LDSB_R	ldsb	[%r8 + %r9], %r23
	.word 0x8143e033  ! 1037: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside | #MemIssue 
	.word 0x86522c60  ! 1038: UMUL_I	umul 	%r8, 0x0c60, %r3
	.word 0xc3ea2cfc  ! 1039: PREFETCHA_I	prefetcha	[%r8, + 0x0cfc] %asi, #one_read
	.word 0x84720009  ! 1040: UDIV_R	udiv 	%r8, %r9, %r2
	.word 0xcafa1009  ! 1041: SWAPA_R	swapa	%r5, [%r8 + %r9] 0x80
	.word 0xb1a20929  ! 1042: FMULs	fmuls	%f8, %f9, %f24
	.word 0xc46a2298  ! 1043: LDSTUB_I	ldstub	%r2, [%r8 + 0x0298]
	.word 0xc2f21009  ! 1044: STXA_R	stxa	%r1, [%r8 + %r9] 0x80
	.word 0x9afa0009  ! 1045: SDIVcc_R	sdivcc 	%r8, %r9, %r13
	.word 0xebe22009  ! 1046: CASA_R	casa	[%r8] %asi, %r9, %r21
	.word 0xdc6a2d40  ! 1047: LDSTUB_I	ldstub	%r14, [%r8 + 0x0d40]
	.word 0xe7e22009  ! 1048: CASA_R	casa	[%r8] %asi, %r9, %r19
	.word 0x38800002  ! 1049: BGU	bgu,a	<label_0x2>
	.word 0xeeea2d28  ! 1050: LDSTUBA_I	ldstuba	%r23, [%r8 + 0x0d28] %asi
	.word 0xee220009  ! 1052: STW_R	stw	%r23, [%r8 + %r9]
	.word 0xcc1a0009  ! 1052: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xe87a269c  ! 1053: SWAP_I	swap	%r20, [%r8 + 0x069c]
	.word 0x8143e06f  ! 1054: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #MemIssue | #Sync 
	.word 0xc5020009  ! 1055: LDF_R	ld	[%r8, %r9], %f2
	.word 0xe522222c  ! 1056: STF_I	st	%f18, [0x022c, %r8]
	.word 0xae7a0009  ! 1057: SDIV_R	sdiv 	%r8, %r9, %r23
	.word 0xdc320009  ! 1059: STH_R	sth	%r14, [%r8 + %r9]
	.word 0xcc1a0009  ! 1059: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xce220009  ! 1061: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc8420009  ! 1061: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0x02800002  ! 1062: BE	be  	<label_0x2>
	.word 0x8ba209a9  ! 1063: FDIVs	fdivs	%f8, %f9, %f5
	.word 0xf33a0009  ! 1065: STDF_R	std	%f25, [%r9, %r8]
	.word 0xd6720009  ! 1066: STX_R	stx	%r11, [%r8 + %r9]
	.word 0xea5a0009  ! 1066: LDX_R	ldx	[%r8 + %r9], %r21
	.word 0xca0a0009  ! 1067: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xf1222180  ! 1068: STF_I	st	%f24, [0x0180, %r8]
	.word 0x24800001  ! 1069: BLE	ble,a	<label_0x1>
	.word 0xce422cf0  ! 1070: LDSW_I	ldsw	[%r8 + 0x0cf0], %r7
	.word 0x0c800002  ! 1071: BNEG	bneg  	<label_0x2>
	.word 0x8143c000  ! 1072: STBAR	stbar
	.word 0xc88a2548  ! 1073: LDUBA_I	lduba	[%r8, + 0x0548] %asi, %r4
	.word 0xea020009  ! 1074: LDUW_R	lduw	[%r8 + %r9], %r21
	.word 0xe7220009  ! 1076: STF_R	st	%f19, [%r9, %r8]
	.word 0xfa720009  ! 1077: STX_R	stx	%r29, [%r8 + %r9]
	.word 0xcc420009  ! 1077: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xc4ea1009  ! 1078: LDSTUBA_R	ldstuba	%r2, [%r8 + %r9] 0x80
	.word 0xce2a0009  ! 1080: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xfe120009  ! 1080: LDUH_R	lduh	[%r8 + %r9], %r31
	.word 0xc3ea22f8  ! 1081: PREFETCHA_I	prefetcha	[%r8, + 0x02f8] %asi, #one_read
	.word 0xcaea2edc  ! 1082: LDSTUBA_I	ldstuba	%r5, [%r8 + 0x0edc] %asi
	.word 0xc3ea2e74  ! 1083: PREFETCHA_I	prefetcha	[%r8, + 0x0e74] %asi, #one_read
	.word 0xceda1009  ! 1084: LDXA_R	ldxa	[%r8, %r9] 0x80, %r7
	.word 0x3a800001  ! 1085: BCC	bcc,a	<label_0x1>
	.word 0xc82a0009  ! 1087: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc81a0009  ! 1087: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xe0120009  ! 1088: LDUH_R	lduh	[%r8 + %r9], %r16
	.word 0xccf22f78  ! 1089: STXA_I	stxa	%r6, [%r8 + 0x0f78] %asi
	.word 0xc3ea1009  ! 1090: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xf4c22a50  ! 1091: LDSWA_I	ldswa	[%r8, + 0x0a50] %asi, %r26
	.word 0xcef22af0  ! 1092: STXA_I	stxa	%r7, [%r8 + 0x0af0] %asi
	.word 0xceca1009  ! 1093: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r7
	.word 0xdc2a0009  ! 1095: STB_R	stb	%r14, [%r8 + %r9]
	.word 0xfe0a0009  ! 1095: LDUB_R	ldub	[%r8 + %r9], %r31
	.word 0xb86a0009  ! 1096: UDIVX_R	udivx 	%r8, %r9, %r28
	.word 0xcc522f7c  ! 1097: LDSH_I	ldsh	[%r8 + 0x0f7c], %r6
	.word 0x83220009  ! 1098: MULScc_R	mulscc 	%r8, %r9, %r1
	.word 0x10800001  ! 1099: BA	ba  	<label_0x1>
	.word 0xc3ea1009  ! 1100: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x3a800002  ! 1101: BCC	bcc,a	<label_0x2>
	.word 0x8af22f0c  ! 1102: UDIVcc_I	udivcc 	%r8, 0x0f0c, %r5
	.word 0xc73a0009  ! 1104: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc6720009  ! 1105: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xf6120009  ! 1105: LDUH_R	lduh	[%r8 + %r9], %r27
	.word 0xc25a0009  ! 1106: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0x8143e00c  ! 1107: MEMBAR	membar	#LoadStore | #StoreStore 
	.word 0xcc2a0009  ! 1109: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xce5a0009  ! 1109: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xa2520009  ! 1110: UMUL_R	umul 	%r8, %r9, %r17
	.word 0x97a20829  ! 1111: FADDs	fadds	%f8, %f9, %f11
	.word 0xe8ba2a58  ! 1112: STDA_I	stda	%r20, [%r8 + 0x0a58] %asi
	.word 0xc65a0009  ! 1113: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xc8522390  ! 1114: LDSH_I	ldsh	[%r8 + 0x0390], %r4
	.word 0xa6d220fc  ! 1115: UMULcc_I	umulcc 	%r8, 0x00fc, %r19
	.word 0xbba208a9  ! 1116: FSUBs	fsubs	%f8, %f9, %f29
	.word 0xcf3a0009  ! 1118: STDF_R	std	%f7, [%r9, %r8]
	.word 0xca720009  ! 1119: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xce5a0009  ! 1119: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0x9ed22930  ! 1120: UMULcc_I	umulcc 	%r8, 0x0930, %r15
	.word 0xc36a2940  ! 1121: PREFETCH_I	prefetch	[%r8 + 0x0940], #one_read
	.word 0xc65a2be0  ! 1122: LDX_I	ldx	[%r8 + 0x0be0], %r3
	.word 0xee2a0009  ! 1124: STB_R	stb	%r23, [%r8 + %r9]
	.word 0xc5020009  ! 1124: LDF_R	ld	[%r8, %r9], %f2
	.word 0xc64a2378  ! 1125: LDSB_I	ldsb	[%r8 + 0x0378], %r3
	.word 0xe22a0009  ! 1127: STB_R	stb	%r17, [%r8 + %r9]
	.word 0xc6420009  ! 1127: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xca921009  ! 1128: LDUHA_R	lduha	[%r8, %r9] 0x80, %r5
	.word 0xca220009  ! 1130: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xce120009  ! 1130: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xd7f22009  ! 1131: CASXA_R	casxa	[%r8]%asi, %r9, %r11
	.word 0x89a20829  ! 1132: FADDs	fadds	%f8, %f9, %f4
	.word 0xf3220009  ! 1134: STF_R	st	%f25, [%r9, %r8]
	.word 0xca720009  ! 1135: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc8420009  ! 1135: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0x8143c000  ! 1136: STBAR	stbar
	.word 0x8143c000  ! 1137: STBAR	stbar
	.word 0x04ca0001  ! 1138: BRLEZ	brlez  ,pt	%8,<label_0xa0001>
	.word 0xf6020009  ! 1139: LDUW_R	lduw	[%r8 + %r9], %r27
	.word 0x8143c000  ! 1140: STBAR	stbar
	.word 0x8c520009  ! 1141: UMUL_R	umul 	%r8, %r9, %r6
	.word 0xc36a24ac  ! 1142: PREFETCH_I	prefetch	[%r8 + 0x04ac], #one_read
	.word 0xc82a0009  ! 1144: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xee020009  ! 1144: LDUW_R	lduw	[%r8 + %r9], %r23
	.word 0x8e520009  ! 1145: UMUL_R	umul 	%r8, %r9, %r7
	.word 0xc2b21009  ! 1146: STHA_R	stha	%r1, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 1147: STBAR	stbar
	.word 0xcc320009  ! 1149: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc8120009  ! 1149: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xcc921009  ! 1150: LDUHA_R	lduha	[%r8, %r9] 0x80, %r6
	.word 0xc36a0009  ! 1151: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xaa720009  ! 1152: UDIV_R	udiv 	%r8, %r9, %r21
	.word 0x8a6a2a88  ! 1153: UDIVX_I	udivx 	%r8, 0x0a88, %r5
	.word 0xd6220009  ! 1155: STW_R	stw	%r11, [%r8 + %r9]
	.word 0xd6420009  ! 1155: LDSW_R	ldsw	[%r8 + %r9], %r11
	.word 0xc36a276c  ! 1156: PREFETCH_I	prefetch	[%r8 + 0x076c], #one_read
	.word 0x0c800001  ! 1157: BNEG	bneg  	<label_0x1>
	.word 0xc3220009  ! 1159: STF_R	st	%f1, [%r9, %r8]
	.word 0xc8720009  ! 1160: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xcc520009  ! 1160: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xf2a21009  ! 1161: STWA_R	stwa	%r25, [%r8 + %r9] 0x80
	.word 0x8143e027  ! 1162: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #MemIssue 
	.word 0xc4ba1009  ! 1163: STDA_R	stda	%r2, [%r8 + %r9] 0x80
	.word 0x8d6a0009  ! 1164: SDIVX_R	sdivx	%r8, %r9, %r6
	.word 0xc6da2b78  ! 1165: LDXA_I	ldxa	[%r8, + 0x0b78] %asi, %r3
	.word 0xed222350  ! 1166: STF_I	st	%f22, [0x0350, %r8]
	.word 0x2e800002  ! 1167: BVS	bvs,a	<label_0x2>
	.word 0xccea24b0  ! 1168: LDSTUBA_I	ldstuba	%r6, [%r8 + 0x04b0] %asi
	.word 0xcc320009  ! 1170: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc8020009  ! 1170: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xc8320009  ! 1172: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xf4020009  ! 1172: LDUW_R	lduw	[%r8 + %r9], %r26
	.word 0xb05a0009  ! 1173: SMUL_R	smul 	%r8, %r9, %r24
	.word 0xccf22870  ! 1174: STXA_I	stxa	%r6, [%r8 + 0x0870] %asi
	.word 0xc8aa2a2c  ! 1175: STBA_I	stba	%r4, [%r8 + 0x0a2c] %asi
	.word 0xaa520009  ! 1176: UMUL_R	umul 	%r8, %r9, %r21
	.word 0xc6320009  ! 1178: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xce420009  ! 1178: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0x89a209a9  ! 1179: FDIVs	fdivs	%f8, %f9, %f4
	.word 0xc4320009  ! 1181: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc60a0009  ! 1181: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xc62a0009  ! 1183: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xcc4a0009  ! 1183: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xccf22ab0  ! 1184: STXA_I	stxa	%r6, [%r8 + 0x0ab0] %asi
	.word 0xc36a0009  ! 1185: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc9220009  ! 1187: STF_R	st	%f4, [%r9, %r8]
	.word 0xda720009  ! 1188: STX_R	stx	%r13, [%r8 + %r9]
	.word 0xc20a0009  ! 1188: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xcf3a0009  ! 1190: STDF_R	std	%f7, [%r9, %r8]
	.word 0xce720009  ! 1191: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xe00a0009  ! 1191: LDUB_R	ldub	[%r8 + %r9], %r16
	.word 0x97220009  ! 1192: MULScc_R	mulscc 	%r8, %r9, %r11
	.word 0xc4ca2b98  ! 1193: LDSBA_I	ldsba	[%r8, + 0x0b98] %asi, %r2
	.word 0x8143e00c  ! 1194: MEMBAR	membar	#LoadStore | #StoreStore 
	.word 0xce320009  ! 1196: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc91a0009  ! 1196: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xfaf21009  ! 1197: STXA_R	stxa	%r29, [%r8 + %r9] 0x80
	.word 0x8c7a0009  ! 1198: SDIV_R	sdiv 	%r8, %r9, %r6
	.word 0xc87a0009  ! 1199: SWAP_R	swap	%r4, [%r8 + %r9]
	.word 0xc41a21a8  ! 1200: LDD_I	ldd	[%r8 + 0x01a8], %r2
	.word 0x846a22d8  ! 1201: UDIVX_I	udivx 	%r8, 0x02d8, %r2
	.word 0xe6320009  ! 1203: STH_R	sth	%r19, [%r8 + %r9]
	.word 0xc65a0009  ! 1203: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xc2220009  ! 1205: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc2120009  ! 1205: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xc4c22c5c  ! 1206: LDSWA_I	ldswa	[%r8, + 0x0c5c] %asi, %r2
	.word 0xc8f21009  ! 1207: STXA_R	stxa	%r4, [%r8 + %r9] 0x80
	.word 0x8b6a2014  ! 1208: SDIVX_I	sdivx	%r8, 0x0014, %r5
	.word 0xe01a0009  ! 1209: LDD_R	ldd	[%r8 + %r9], %r16
	.word 0xcaaa2528  ! 1210: STBA_I	stba	%r5, [%r8 + 0x0528] %asi
	.word 0xe25a0009  ! 1211: LDX_R	ldx	[%r8 + %r9], %r17
	.word 0x845220a4  ! 1212: UMUL_I	umul 	%r8, 0x00a4, %r2
	.word 0xc3ea2e54  ! 1213: PREFETCHA_I	prefetcha	[%r8, + 0x0e54] %asi, #one_read
	.word 0xccba1009  ! 1214: STDA_R	stda	%r6, [%r8 + %r9] 0x80
	.word 0xc8ea2b88  ! 1215: LDSTUBA_I	ldstuba	%r4, [%r8 + 0x0b88] %asi
	.word 0xc6420009  ! 1216: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xceca2320  ! 1217: LDSBA_I	ldsba	[%r8, + 0x0320] %asi, %r7
	.word 0xcc320009  ! 1219: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc51a0009  ! 1219: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xa9a20929  ! 1220: FMULs	fmuls	%f8, %f9, %f20
	.word 0xc8220009  ! 1222: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xf11a0009  ! 1222: LDDF_R	ldd	[%r8, %r9], %f24
	.word 0xb2f20009  ! 1223: UDIVcc_R	udivcc 	%r8, %r9, %r25
	.word 0xfa022974  ! 1224: LDUW_I	lduw	[%r8 + 0x0974], %r29
	.word 0x8ef20009  ! 1225: UDIVcc_R	udivcc 	%r8, %r9, %r7
	.word 0x0e800001  ! 1226: BVS	bvs  	<label_0x1>
	.word 0xcc2a0009  ! 1228: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc8020009  ! 1228: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xc6320009  ! 1230: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xd71a0009  ! 1230: LDDF_R	ldd	[%r8, %r9], %f11
	.word 0x8143e002  ! 1231: MEMBAR	membar	#StoreLoad 
	.word 0x8143e079  ! 1232: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xb36a262c  ! 1233: SDIVX_I	sdivx	%r8, 0x062c, %r25
	.word 0xf8ba2c68  ! 1234: STDA_I	stda	%r28, [%r8 + 0x0c68] %asi
	.word 0xa8d20009  ! 1235: UMULcc_R	umulcc 	%r8, %r9, %r20
	.word 0xccba1009  ! 1236: STDA_R	stda	%r6, [%r8 + %r9] 0x80
	.word 0xcc9a2c00  ! 1237: LDDA_I	ldda	[%r8, + 0x0c00] %asi, %r6
	.word 0xccb21009  ! 1238: STHA_R	stha	%r6, [%r8 + %r9] 0x80
	.word 0x86d20009  ! 1239: UMULcc_R	umulcc 	%r8, %r9, %r3
	.word 0xeec21009  ! 1240: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r23
	.word 0xcf3a0009  ! 1242: STDF_R	std	%f7, [%r9, %r8]
	.word 0xca720009  ! 1243: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc8420009  ! 1243: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xc2220009  ! 1245: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc8520009  ! 1245: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0x8cd22db8  ! 1246: UMULcc_I	umulcc 	%r8, 0x0db8, %r6
	.word 0x2e800002  ! 1247: BVS	bvs,a	<label_0x2>
	.word 0xf8ba1009  ! 1248: STDA_R	stda	%r28, [%r8 + %r9] 0x80
	.word 0xc2b22e14  ! 1249: STHA_I	stha	%r1, [%r8 + 0x0e14] %asi
	.word 0xfd3a2488  ! 1250: STDF_I	std	%f30, [0x0488, %r8]
	.word 0x36800002  ! 1251: BGE	bge,a	<label_0x2>
	.word 0x8143e05e  ! 1252: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0xdc220009  ! 1254: STW_R	stw	%r14, [%r8 + %r9]
	.word 0xc5020009  ! 1254: LDF_R	ld	[%r8, %r9], %f2
	.word 0xccf222c8  ! 1255: STXA_I	stxa	%r6, [%r8 + 0x02c8] %asi
	.word 0xc41a2300  ! 1256: LDD_I	ldd	[%r8 + 0x0300], %r2
	.word 0xccba1009  ! 1257: STDA_R	stda	%r6, [%r8 + %r9] 0x80
	.word 0x845a2ef8  ! 1258: SMUL_I	smul 	%r8, 0x0ef8, %r2
	.word 0xf6320009  ! 1260: STH_R	sth	%r27, [%r8 + %r9]
	.word 0xf4120009  ! 1260: LDUH_R	lduh	[%r8 + %r9], %r26
	.word 0xc3ea2754  ! 1261: PREFETCHA_I	prefetcha	[%r8, + 0x0754] %asi, #one_read
	.word 0xfa6a28bc  ! 1262: LDSTUB_I	ldstub	%r29, [%r8 + 0x08bc]
	.word 0x8143e00a  ! 1263: MEMBAR	membar	#StoreLoad | #StoreStore 
	.word 0xf2220009  ! 1265: STW_R	stw	%r25, [%r8 + %r9]
	.word 0xcc020009  ! 1265: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xaed20009  ! 1266: UMULcc_R	umulcc 	%r8, %r9, %r23
	.word 0xcc020009  ! 1267: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xa5a208a9  ! 1268: FSUBs	fsubs	%f8, %f9, %f18
	.word 0xcaaa1009  ! 1269: STBA_R	stba	%r5, [%r8 + %r9] 0x80
	.word 0xaafa0009  ! 1270: SDIVcc_R	sdivcc 	%r8, %r9, %r21
	.word 0xc86a0009  ! 1271: LDSTUB_R	ldstub	%r4, [%r8 + %r9]
	.word 0xccb22a48  ! 1272: STHA_I	stha	%r6, [%r8 + 0x0a48] %asi
	.word 0x8143e00a  ! 1273: MEMBAR	membar	#StoreLoad | #StoreStore 
	.word 0xc36a0009  ! 1274: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc36a0009  ! 1275: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xd8ca21d0  ! 1276: LDSBA_I	ldsba	[%r8, + 0x01d0] %asi, %r12
	.word 0xcef21009  ! 1277: STXA_R	stxa	%r7, [%r8 + %r9] 0x80
	.word 0xfe320009  ! 1279: STH_R	sth	%r31, [%r8 + %r9]
	.word 0xc71a0009  ! 1279: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0x824a0009  ! 1280: MULX_R	mulx 	%r8, %r9, %r1
	.word 0x9ef20009  ! 1281: UDIVcc_R	udivcc 	%r8, %r9, %r15
	.word 0x2ec20001  ! 1282: BRGEZ	brgez,a,nt	%8,<label_0x20001>
	.word 0x8143e070  ! 1283: MEMBAR	membar	#Lookaside | #MemIssue | #Sync 
	.word 0xc3ea2e28  ! 1284: PREFETCHA_I	prefetcha	[%r8, + 0x0e28] %asi, #one_read
	.word 0xc2821009  ! 1285: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r1
	.word 0xc6aa1009  ! 1286: STBA_R	stba	%r3, [%r8 + %r9] 0x80
	.word 0xdeea1009  ! 1287: LDSTUBA_R	ldstuba	%r15, [%r8 + %r9] 0x80
	.word 0xca120009  ! 1288: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xc2020009  ! 1289: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xfc9a26b0  ! 1290: LDDA_I	ldda	[%r8, + 0x06b0] %asi, %r30
	.word 0xc36a0009  ! 1291: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0x8143c000  ! 1292: STBAR	stbar
	.word 0xf62a0009  ! 1294: STB_R	stb	%r27, [%r8 + %r9]
	.word 0xca520009  ! 1294: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0x2c800002  ! 1295: BNEG	bneg,a	<label_0x2>
	.word 0xea2a0009  ! 1297: STB_R	stb	%r21, [%r8 + %r9]
	.word 0xc4420009  ! 1297: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xf3e22009  ! 1298: CASA_R	casa	[%r8] %asi, %r9, %r25
	.word 0x2eca0001  ! 1299: BRGEZ	brgez,a,pt	%8,<label_0xa0001>
	.word 0xc82a0009  ! 1301: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc6420009  ! 1301: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0x82d20009  ! 1302: UMULcc_R	umulcc 	%r8, %r9, %r1
	.word 0x83a209a9  ! 1303: FDIVs	fdivs	%f8, %f9, %f1
	.word 0x86fa0009  ! 1304: SDIVcc_R	sdivcc 	%r8, %r9, %r3
	.word 0x89a20929  ! 1305: FMULs	fmuls	%f8, %f9, %f4
	.word 0x88da2488  ! 1306: SMULcc_I	smulcc 	%r8, 0x0488, %r4
	.word 0x8143e07a  ! 1307: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xcf220009  ! 1309: STF_R	st	%f7, [%r9, %r8]
	.word 0xce720009  ! 1310: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc01a0009  ! 1310: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0x86f20009  ! 1311: UDIVcc_R	udivcc 	%r8, %r9, %r3
	.word 0xdcfa1009  ! 1312: SWAPA_R	swapa	%r14, [%r8 + %r9] 0x80
	.word 0x88722b24  ! 1313: UDIV_I	udiv 	%r8, 0x0b24, %r4
	.word 0xc4720009  ! 1315: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc41a0009  ! 1315: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xf4ba2838  ! 1316: STDA_I	stda	%r26, [%r8 + 0x0838] %asi
	.word 0xbd6a2a88  ! 1317: SDIVX_I	sdivx	%r8, 0x0a88, %r30
	.word 0xc22a0009  ! 1319: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc6020009  ! 1319: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xecb22a98  ! 1320: STHA_I	stha	%r22, [%r8 + 0x0a98] %asi
	.word 0xe6ea1009  ! 1321: LDSTUBA_R	ldstuba	%r19, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 1322: STBAR	stbar
	.word 0x8143c000  ! 1323: STBAR	stbar
	.word 0xed3a29c0  ! 1324: STDF_I	std	%f22, [0x09c0, %r8]
	.word 0xda6a2508  ! 1325: LDSTUB_I	ldstub	%r13, [%r8 + 0x0508]
	.word 0xe4ba2950  ! 1326: STDA_I	stda	%r18, [%r8 + 0x0950] %asi
	.word 0xccb22738  ! 1327: STHA_I	stha	%r6, [%r8 + 0x0738] %asi
	.word 0x847a2a98  ! 1328: SDIV_I	sdiv 	%r8, 0x0a98, %r2
	.word 0xe0ba1009  ! 1329: STDA_R	stda	%r16, [%r8 + %r9] 0x80
	.word 0x8a520009  ! 1330: UMUL_R	umul 	%r8, %r9, %r5
	.word 0x8143e073  ! 1331: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside | #MemIssue | #Sync 
	.word 0x82720009  ! 1332: UDIV_R	udiv 	%r8, %r9, %r1
	.word 0xfc320009  ! 1334: STH_R	sth	%r30, [%r8 + %r9]
	.word 0xd71a0009  ! 1334: LDDF_R	ldd	[%r8, %r9], %f11
	.word 0x8143c000  ! 1335: STBAR	stbar
	.word 0xca821009  ! 1336: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r5
	.word 0xfab21009  ! 1337: STHA_R	stha	%r29, [%r8 + %r9] 0x80
	.word 0xfd3a25c0  ! 1338: STDF_I	std	%f30, [0x05c0, %r8]
	.word 0xeb220009  ! 1340: STF_R	st	%f21, [%r9, %r8]
	.word 0xc8720009  ! 1341: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc41a0009  ! 1341: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xcf1a28f0  ! 1342: LDDF_I	ldd	[%r8, 0x08f0], %f7
	.word 0xc6a222e4  ! 1343: STWA_I	stwa	%r3, [%r8 + 0x02e4] %asi
	.word 0xe02a0009  ! 1345: STB_R	stb	%r16, [%r8 + %r9]
	.word 0xc85a0009  ! 1345: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0x8da209a9  ! 1346: FDIVs	fdivs	%f8, %f9, %f6
	.word 0x9f220009  ! 1347: MULScc_R	mulscc 	%r8, %r9, %r15
	.word 0xe4b21009  ! 1348: STHA_R	stha	%r18, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 1349: STBAR	stbar
	.word 0x8a5a0009  ! 1350: SMUL_R	smul 	%r8, %r9, %r5
	.word 0x0c800001  ! 1351: BNEG	bneg  	<label_0x1>
	.word 0x8143c000  ! 1352: STBAR	stbar
	.word 0xc36a2a98  ! 1353: PREFETCH_I	prefetch	[%r8 + 0x0a98], #one_read
	.word 0xc36a0009  ! 1354: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc84a0009  ! 1355: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0x856a24c0  ! 1356: SDIVX_I	sdivx	%r8, 0x04c0, %r2
	.word 0xcf2224c8  ! 1357: STF_I	st	%f7, [0x04c8, %r8]
	.word 0xa0fa21d4  ! 1358: SDIVcc_I	sdivcc 	%r8, 0x01d4, %r16
	.word 0x8143c000  ! 1359: STBAR	stbar
	.word 0xe6220009  ! 1361: STW_R	stw	%r19, [%r8 + %r9]
	.word 0xfb020009  ! 1361: LDF_R	ld	[%r8, %r9], %f29
	.word 0x8143c000  ! 1362: STBAR	stbar
	.word 0xc9e21009  ! 1363: CASA_I	casa	[%r8] 0x80, %r9, %r4
	.word 0xf08a1009  ! 1364: LDUBA_R	lduba	[%r8, %r9] 0x80, %r24
	.word 0xcec22384  ! 1365: LDSWA_I	ldswa	[%r8, + 0x0384] %asi, %r7
	.word 0xc3ea1009  ! 1366: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xeb3a0009  ! 1368: STDF_R	std	%f21, [%r9, %r8]
	.word 0xd8720009  ! 1369: STX_R	stx	%r12, [%r8 + %r9]
	.word 0xfa4a0009  ! 1369: LDSB_R	ldsb	[%r8 + %r9], %r29
	.word 0x846a2070  ! 1370: UDIVX_I	udivx 	%r8, 0x0070, %r2
	.word 0x8ef20009  ! 1371: UDIVcc_R	udivcc 	%r8, %r9, %r7
	.word 0x8143e019  ! 1372: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside 
	.word 0xc2220009  ! 1374: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc41a0009  ! 1374: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x8143e04d  ! 1375: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Sync 
	.word 0x8143e039  ! 1376: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside | #MemIssue 
	.word 0xfc320009  ! 1378: STH_R	sth	%r30, [%r8 + %r9]
	.word 0xcc1a0009  ! 1378: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0x8c722a14  ! 1379: UDIV_I	udiv 	%r8, 0x0a14, %r6
	.word 0xc6ea2f8c  ! 1380: LDSTUBA_I	ldstuba	%r3, [%r8 + 0x0f8c] %asi
	.word 0xdc0a0009  ! 1381: LDUB_R	ldub	[%r8 + %r9], %r14
	.word 0xcc720009  ! 1383: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xcc420009  ! 1383: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xce7a20c4  ! 1384: SWAP_I	swap	%r7, [%r8 + 0x00c4]
	.word 0xe51a2220  ! 1385: LDDF_I	ldd	[%r8, 0x0220], %f18
	.word 0xc2220009  ! 1387: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc7020009  ! 1387: LDF_R	ld	[%r8, %r9], %f3
	.word 0x8143c000  ! 1388: STBAR	stbar
	.word 0xc2120009  ! 1389: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xb2522e74  ! 1390: UMUL_I	umul 	%r8, 0x0e74, %r25
	.word 0xcc120009  ! 1391: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xc01a2b98  ! 1392: LDD_I	ldd	[%r8 + 0x0b98], %r0
	.word 0xc80a2c1c  ! 1393: LDUB_I	ldub	[%r8 + 0x0c1c], %r4
	.word 0x0cc20001  ! 1394: BRGZ	brgz  ,nt	%8,<label_0x20001>
	.word 0x08800001  ! 1395: BLEU	bleu  	<label_0x1>
	.word 0xe6320009  ! 1397: STH_R	sth	%r19, [%r8 + %r9]
	.word 0xe24a0009  ! 1397: LDSB_R	ldsb	[%r8 + %r9], %r17
	.word 0x3e800002  ! 1398: BVC	bvc,a	<label_0x2>
	.word 0xc3ea1009  ! 1399: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc4ba1009  ! 1400: STDA_R	stda	%r2, [%r8 + %r9] 0x80
	.word 0x9c720009  ! 1401: UDIV_R	udiv 	%r8, %r9, %r14
	.word 0xc3ea26e0  ! 1402: PREFETCHA_I	prefetcha	[%r8, + 0x06e0] %asi, #one_read
	.word 0x86da2530  ! 1403: SMULcc_I	smulcc 	%r8, 0x0530, %r3
	.word 0x8143c000  ! 1404: STBAR	stbar
	.word 0xf82a0009  ! 1406: STB_R	stb	%r28, [%r8 + %r9]
	.word 0xe6520009  ! 1406: LDSH_R	ldsh	[%r8 + %r9], %r19
	.word 0xcc2a0009  ! 1408: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xce0a0009  ! 1408: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xced221a8  ! 1409: LDSHA_I	ldsha	[%r8, + 0x01a8] %asi, %r7
	.word 0xcb220009  ! 1411: STF_R	st	%f5, [%r9, %r8]
	.word 0xce720009  ! 1412: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xca0a0009  ! 1412: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xce220009  ! 1414: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xef020009  ! 1414: LDF_R	ld	[%r8, %r9], %f23
	.word 0xc3ea1009  ! 1415: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xcd2221f8  ! 1416: STF_I	st	%f6, [0x01f8, %r8]
	.word 0xcbe22009  ! 1417: CASA_R	casa	[%r8] %asi, %r9, %r5
	.word 0x8143e014  ! 1418: MEMBAR	membar	#LoadStore | #Lookaside 
	.word 0x8143e05e  ! 1419: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0xc36a2da0  ! 1420: PREFETCH_I	prefetch	[%r8 + 0x0da0], #one_read
	.word 0xdada1009  ! 1421: LDXA_R	ldxa	[%r8, %r9] 0x80, %r13
	.word 0xcc6a2850  ! 1422: LDSTUB_I	ldstub	%r6, [%r8 + 0x0850]
	.word 0xc36a2bb0  ! 1423: PREFETCH_I	prefetch	[%r8 + 0x0bb0], #one_read
	.word 0xaafa0009  ! 1424: SDIVcc_R	sdivcc 	%r8, %r9, %r21
	.word 0x8c4a23b4  ! 1425: MULX_I	mulx 	%r8, 0x03b4, %r6
	.word 0xc47a0009  ! 1426: SWAP_R	swap	%r2, [%r8 + %r9]
	.word 0xc4ea2350  ! 1427: LDSTUBA_I	ldstuba	%r2, [%r8 + 0x0350] %asi
	.word 0xd9222dcc  ! 1428: STF_I	st	%f12, [0x0dcc, %r8]
	.word 0x82722074  ! 1429: UDIV_I	udiv 	%r8, 0x0074, %r1
	.word 0xd65a0009  ! 1430: LDX_R	ldx	[%r8 + %r9], %r11
	.word 0x9c5a0009  ! 1431: SMUL_R	smul 	%r8, %r9, %r14
	.word 0x84f20009  ! 1432: UDIVcc_R	udivcc 	%r8, %r9, %r2
	.word 0xc3ea1009  ! 1433: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xf0fa2220  ! 1434: SWAPA_I	swapa	%r24, [%r8 + 0x0220] %asi
	.word 0xc9220009  ! 1436: STF_R	st	%f4, [%r9, %r8]
	.word 0xf2720009  ! 1437: STX_R	stx	%r25, [%r8 + %r9]
	.word 0xe4520009  ! 1437: LDSH_R	ldsh	[%r8 + %r9], %r18
	.word 0xcab220f8  ! 1438: STHA_I	stha	%r5, [%r8 + 0x00f8] %asi
	.word 0xcfe21009  ! 1439: CASA_I	casa	[%r8] 0x80, %r9, %r7
	.word 0x8cd20009  ! 1440: UMULcc_R	umulcc 	%r8, %r9, %r6
	.word 0xc3ea2420  ! 1441: PREFETCHA_I	prefetcha	[%r8, + 0x0420] %asi, #one_read
	.word 0x0eca0001  ! 1442: BRGEZ	brgez  ,pt	%8,<label_0xa0001>
	.word 0xc6ea1009  ! 1443: LDSTUBA_R	ldstuba	%r3, [%r8 + %r9] 0x80
	.word 0x8143e07f  ! 1444: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0x83220009  ! 1445: MULScc_R	mulscc 	%r8, %r9, %r1
	.word 0xe2c21009  ! 1446: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r17
	.word 0xc92226b0  ! 1447: STF_I	st	%f4, [0x06b0, %r8]
	.word 0x40000001  ! 1448: CALL	call	disp30_1
	.word 0x24800001  ! 1449: BLE	ble,a	<label_0x1>
	.word 0x8cfa0009  ! 1450: SDIVcc_R	sdivcc 	%r8, %r9, %r6
	.word 0x8143e06c  ! 1451: MEMBAR	membar	#LoadStore | #StoreStore | #MemIssue | #Sync 
	.word 0xc8320009  ! 1453: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc40a0009  ! 1453: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xecba1009  ! 1454: STDA_R	stda	%r22, [%r8 + %r9] 0x80
	.word 0xa1a20829  ! 1455: FADDs	fadds	%f8, %f9, %f16
	.word 0x2c800001  ! 1456: BNEG	bneg,a	<label_0x1>
	.word 0x9c720009  ! 1457: UDIV_R	udiv 	%r8, %r9, %r14
	.word 0x24c20001  ! 1458: BRLEZ	brlez,a,nt	%8,<label_0x20001>
	.word 0x8143e07d  ! 1459: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0x8e4a2fc4  ! 1460: MULX_I	mulx 	%r8, 0x0fc4, %r7
	.word 0xc3ea1009  ! 1461: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc8fa2338  ! 1462: SWAPA_I	swapa	%r4, [%r8 + 0x0338] %asi
	.word 0x884a24a8  ! 1463: MULX_I	mulx 	%r8, 0x04a8, %r4
	.word 0xb6fa0009  ! 1464: SDIVcc_R	sdivcc 	%r8, %r9, %r27
	.word 0xc36a2cf4  ! 1465: PREFETCH_I	prefetch	[%r8 + 0x0cf4], #one_read
	.word 0xc6a21009  ! 1466: STWA_R	stwa	%r3, [%r8 + %r9] 0x80
	.word 0x14800001  ! 1467: BG	bg  	<label_0x1>
	.word 0x8143e047  ! 1468: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Sync 
	.word 0x2c800002  ! 1469: BNEG	bneg,a	<label_0x2>
	.word 0xdc8a1009  ! 1470: LDUBA_R	lduba	[%r8, %r9] 0x80, %r14
	.word 0x887a0009  ! 1471: SDIV_R	sdiv 	%r8, %r9, %r4
	.word 0x8143e03a  ! 1472: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside | #MemIssue 
	.word 0xc3ea23bc  ! 1473: PREFETCHA_I	prefetcha	[%r8, + 0x03bc] %asi, #one_read
	.word 0xc92222c8  ! 1474: STF_I	st	%f4, [0x02c8, %r8]
	.word 0xa8fa2aa4  ! 1475: SDIVcc_I	sdivcc 	%r8, 0x0aa4, %r20
	.word 0xc36a27a0  ! 1476: PREFETCH_I	prefetch	[%r8 + 0x07a0], #one_read
	.word 0xdc220009  ! 1478: STW_R	stw	%r14, [%r8 + %r9]
	.word 0xc6420009  ! 1478: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0x8143c000  ! 1479: STBAR	stbar
	.word 0x8143e059  ! 1480: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside | #Sync 
	.word 0xcde21009  ! 1481: CASA_I	casa	[%r8] 0x80, %r9, %r6
	.word 0xf8821009  ! 1482: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r28
	.word 0xaba208a9  ! 1483: FSUBs	fsubs	%f8, %f9, %f21
	.word 0x8143e055  ! 1484: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside | #Sync 
	.word 0xc82a0009  ! 1486: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xcc4a0009  ! 1486: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xc8320009  ! 1488: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc4020009  ! 1488: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xcc320009  ! 1490: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xcc420009  ! 1490: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xc6320009  ! 1492: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc51a0009  ! 1492: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xcc522318  ! 1493: LDSH_I	ldsh	[%r8 + 0x0318], %r6
	.word 0xc8a22d5c  ! 1494: STWA_I	stwa	%r4, [%r8 + 0x0d5c] %asi
	.word 0x40000002  ! 1495: CALL	call	disp30_2
	.word 0xbda20929  ! 1496: FMULs	fmuls	%f8, %f9, %f30
	.word 0x40000001  ! 1497: CALL	call	disp30_1
	.word 0xcd220009  ! 1499: STF_R	st	%f6, [%r9, %r8]
	.word 0xc8720009  ! 1500: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xcc5a0009  ! 1500: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0x865a0009  ! 1501: SMUL_R	smul 	%r8, %r9, %r3
	.word 0xc4720009  ! 1503: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xcc5a0009  ! 1503: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xcdf22009  ! 1504: CASXA_R	casxa	[%r8]%asi, %r9, %r6
	.word 0x8143e023  ! 1505: MEMBAR	membar	#LoadLoad | #StoreLoad | #MemIssue 
	.word 0x87a208a9  ! 1506: FSUBs	fsubs	%f8, %f9, %f3
	.word 0x83222040  ! 1507: MULScc_I	mulscc 	%r8, 0x0040, %r1
	.word 0x83a20929  ! 1508: FMULs	fmuls	%f8, %f9, %f1
	.word 0xbed226c0  ! 1509: UMULcc_I	umulcc 	%r8, 0x06c0, %r31
	.word 0xc60a2f80  ! 1510: LDUB_I	ldub	[%r8 + 0x0f80], %r3
	.word 0x8fa209a9  ! 1511: FDIVs	fdivs	%f8, %f9, %f7
	.word 0xcaca2264  ! 1512: LDSBA_I	ldsba	[%r8, + 0x0264] %asi, %r5
	.word 0x3a800001  ! 1513: BCC	bcc,a	<label_0x1>
	.word 0xbba20929  ! 1514: FMULs	fmuls	%f8, %f9, %f29
	.word 0xcaea2b28  ! 1515: LDSTUBA_I	ldstuba	%r5, [%r8 + 0x0b28] %asi
	.word 0xc36a2e48  ! 1516: PREFETCH_I	prefetch	[%r8 + 0x0e48], #one_read
	.word 0xc3ea2df4  ! 1517: PREFETCHA_I	prefetcha	[%r8, + 0x0df4] %asi, #one_read
	.word 0xca320009  ! 1519: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc8420009  ! 1519: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xcc9a1009  ! 1520: LDDA_R	ldda	[%r8, %r9] 0x80, %r6
	.word 0xfe7a0009  ! 1521: SWAP_R	swap	%r31, [%r8 + %r9]
	.word 0xcc2a0009  ! 1523: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc41a0009  ! 1523: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xc89a1009  ! 1524: LDDA_R	ldda	[%r8, %r9] 0x80, %r4
	.word 0xc3ea2180  ! 1525: PREFETCHA_I	prefetcha	[%r8, + 0x0180] %asi, #one_read
	.word 0xc4ba1009  ! 1526: STDA_R	stda	%r2, [%r8 + %r9] 0x80
	.word 0xc36a2b40  ! 1527: PREFETCH_I	prefetch	[%r8 + 0x0b40], #one_read
	.word 0xfeb22ba0  ! 1528: STHA_I	stha	%r31, [%r8 + 0x0ba0] %asi
	.word 0xbfa209a9  ! 1529: FDIVs	fdivs	%f8, %f9, %f31
	.word 0xc4220009  ! 1531: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xcc520009  ! 1531: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xdc320009  ! 1533: STH_R	sth	%r14, [%r8 + %r9]
	.word 0xd6020009  ! 1533: LDUW_R	lduw	[%r8 + %r9], %r11
	.word 0xc2320009  ! 1535: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xca420009  ! 1535: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0x8143c000  ! 1536: STBAR	stbar
	.word 0x8143c000  ! 1537: STBAR	stbar
	.word 0xc25a2558  ! 1538: LDX_I	ldx	[%r8 + 0x0558], %r1
	.word 0xc42a0009  ! 1540: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc6520009  ! 1540: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xc3ea218c  ! 1541: PREFETCHA_I	prefetcha	[%r8, + 0x018c] %asi, #one_read
	.word 0xc73a0009  ! 1543: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc4720009  ! 1544: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xe6420009  ! 1544: LDSW_R	ldsw	[%r8 + %r9], %r19
	.word 0xdfe21009  ! 1545: CASA_I	casa	[%r8] 0x80, %r9, %r15
	.word 0x8143e064  ! 1546: MEMBAR	membar	#LoadStore | #MemIssue | #Sync 
	.word 0x8143c000  ! 1547: STBAR	stbar
	.word 0xe5220009  ! 1549: STF_R	st	%f18, [%r9, %r8]
	.word 0xc4720009  ! 1550: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xcc120009  ! 1550: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0x88da231c  ! 1551: SMULcc_I	smulcc 	%r8, 0x031c, %r4
	.word 0xdf3a0009  ! 1553: STDF_R	std	%f15, [%r9, %r8]
	.word 0xfa720009  ! 1554: STX_R	stx	%r29, [%r8 + %r9]
	.word 0xc45a0009  ! 1554: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xf8822e64  ! 1555: LDUWA_I	lduwa	[%r8, + 0x0e64] %asi, %r28
	.word 0xd6720009  ! 1557: STX_R	stx	%r11, [%r8 + %r9]
	.word 0xc2020009  ! 1557: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0x8143e03a  ! 1558: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside | #MemIssue 
	.word 0x8143e00d  ! 1559: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore 
	.word 0x22ca0001  ! 1560: BRZ	brz,a,pt	%8,<label_0xa0001>
	.word 0x8143c000  ! 1561: STBAR	stbar
	.word 0x9cd20009  ! 1562: UMULcc_R	umulcc 	%r8, %r9, %r14
	.word 0xc3ea1009  ! 1563: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x8143e00c  ! 1564: MEMBAR	membar	#LoadStore | #StoreStore 
	.word 0x8f6a2590  ! 1565: SDIVX_I	sdivx	%r8, 0x0590, %r7
	.word 0xc6fa23d4  ! 1566: SWAPA_I	swapa	%r3, [%r8 + 0x03d4] %asi
	.word 0x10800001  ! 1567: BA	ba  	<label_0x1>
	.word 0x8143e068  ! 1568: MEMBAR	membar	#StoreStore | #MemIssue | #Sync 
	.word 0x8ef2254c  ! 1569: UDIVcc_I	udivcc 	%r8, 0x054c, %r7
	.word 0xa07221d0  ! 1570: UDIV_I	udiv 	%r8, 0x01d0, %r16
	.word 0x8143e004  ! 1571: MEMBAR	membar	#LoadStore 
	.word 0x2a800002  ! 1572: BCS	bcs,a	<label_0x2>
	.word 0xc73a0009  ! 1574: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc2720009  ! 1575: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xf8020009  ! 1575: LDUW_R	lduw	[%r8 + %r9], %r28
	.word 0xa7a208a9  ! 1576: FSUBs	fsubs	%f8, %f9, %f19
	.word 0x16800001  ! 1577: BGE	bge  	<label_0x1>
	.word 0x8143c000  ! 1578: STBAR	stbar
	.word 0x896a2430  ! 1579: SDIVX_I	sdivx	%r8, 0x0430, %r4
	.word 0xc6ea2fb4  ! 1580: LDSTUBA_I	ldstuba	%r3, [%r8 + 0x0fb4] %asi
	.word 0x12800002  ! 1581: BNE	bne  	<label_0x2>
	.word 0xed1a0009  ! 1582: LDDF_R	ldd	[%r8, %r9], %f22
	.word 0xfe922d78  ! 1583: LDUHA_I	lduha	[%r8, + 0x0d78] %asi, %r31
	.word 0xc5e21009  ! 1584: CASA_I	casa	[%r8] 0x80, %r9, %r2
	.word 0xe01a0009  ! 1585: LDD_R	ldd	[%r8 + %r9], %r16
	.word 0xda220009  ! 1587: STW_R	stw	%r13, [%r8 + %r9]
	.word 0xdf020009  ! 1587: LDF_R	ld	[%r8, %r9], %f15
	.word 0xc62a0009  ! 1589: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc40a0009  ! 1589: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xa9a208a9  ! 1590: FSUBs	fsubs	%f8, %f9, %f20
	.word 0x8f6a0009  ! 1591: SDIVX_R	sdivx	%r8, %r9, %r7
	.word 0x8ada0009  ! 1592: SMULcc_R	smulcc 	%r8, %r9, %r5
	.word 0xc5022414  ! 1593: LDF_I	ld	[%r8, 0x0414], %f2
	.word 0x866a0009  ! 1594: UDIVX_R	udivx 	%r8, %r9, %r3
	.word 0xe13a0009  ! 1596: STDF_R	std	%f16, [%r9, %r8]
	.word 0xcc720009  ! 1597: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xfd020009  ! 1597: LDF_R	ld	[%r8, %r9], %f30
	.word 0xcc0a0009  ! 1598: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0x28800001  ! 1599: BLEU	bleu,a	<label_0x1>
	.word 0xc8420009  ! 1600: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0x884a2560  ! 1601: MULX_I	mulx 	%r8, 0x0560, %r4
	.word 0xc36a258c  ! 1602: PREFETCH_I	prefetch	[%r8 + 0x058c], #one_read
	.word 0xe8b22b80  ! 1603: STHA_I	stha	%r20, [%r8 + 0x0b80] %asi
	.word 0x8143c000  ! 1604: STBAR	stbar
	.word 0xccba1009  ! 1605: STDA_R	stda	%r6, [%r8 + %r9] 0x80
	.word 0xc3ea1009  ! 1606: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc36a26bc  ! 1607: PREFETCH_I	prefetch	[%r8 + 0x06bc], #one_read
	.word 0xf52228ac  ! 1608: STF_I	st	%f26, [0x08ac, %r8]
	.word 0xf8ba1009  ! 1609: STDA_R	stda	%r28, [%r8 + %r9] 0x80
	.word 0x8143e049  ! 1610: MEMBAR	membar	#LoadLoad | #StoreStore | #Sync 
	.word 0xccb22e18  ! 1611: STHA_I	stha	%r6, [%r8 + 0x0e18] %asi
	.word 0xe8da2780  ! 1612: LDXA_I	ldxa	[%r8, + 0x0780] %asi, %r20
	.word 0x22c20001  ! 1613: BRZ	brz,a,nt	%8,<label_0x20001>
	.word 0x8143e07a  ! 1614: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0x8ba20929  ! 1615: FMULs	fmuls	%f8, %f9, %f5
	.word 0x0e800001  ! 1616: BVS	bvs  	<label_0x1>
	.word 0xce320009  ! 1618: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc84a0009  ! 1618: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0x12800001  ! 1619: BNE	bne  	<label_0x1>
	.word 0xa47a0009  ! 1620: SDIV_R	sdiv 	%r8, %r9, %r18
	.word 0x8afa2620  ! 1621: SDIVcc_I	sdivcc 	%r8, 0x0620, %r5
	.word 0xc67a2118  ! 1622: SWAP_I	swap	%r3, [%r8 + 0x0118]
	.word 0x2a800001  ! 1623: BCS	bcs,a	<label_0x1>
	.word 0x8af20009  ! 1624: UDIVcc_R	udivcc 	%r8, %r9, %r5
	.word 0xc8f222a0  ! 1625: STXA_I	stxa	%r4, [%r8 + 0x02a0] %asi
	.word 0x3e800002  ! 1626: BVC	bvc,a	<label_0x2>
	.word 0xc2220009  ! 1628: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xf60a0009  ! 1628: LDUB_R	ldub	[%r8 + %r9], %r27
	.word 0x864a0009  ! 1629: MULX_R	mulx 	%r8, %r9, %r3
	.word 0xcaf21009  ! 1630: STXA_R	stxa	%r5, [%r8 + %r9] 0x80
	.word 0xc3ea1009  ! 1631: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xe4b21009  ! 1632: STHA_R	stha	%r18, [%r8 + %r9] 0x80
	.word 0xc3ea1009  ! 1633: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x82522f70  ! 1634: UMUL_I	umul 	%r8, 0x0f70, %r1
	.word 0x8c720009  ! 1635: UDIV_R	udiv 	%r8, %r9, %r6
	.word 0xdeb21009  ! 1636: STHA_R	stha	%r15, [%r8 + %r9] 0x80
	.word 0xca2a0009  ! 1638: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc6420009  ! 1638: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xc36a24e4  ! 1639: PREFETCH_I	prefetch	[%r8 + 0x04e4], #one_read
	.word 0xc91a0009  ! 1640: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xea2a0009  ! 1642: STB_R	stb	%r21, [%r8 + %r9]
	.word 0xc6020009  ! 1642: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0x8143c000  ! 1643: STBAR	stbar
	.word 0x8143c000  ! 1644: STBAR	stbar
	.word 0xf2220009  ! 1646: STW_R	stw	%r25, [%r8 + %r9]
	.word 0xc4420009  ! 1646: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0x8cd22a60  ! 1647: UMULcc_I	umulcc 	%r8, 0x0a60, %r6
	.word 0xec220009  ! 1649: STW_R	stw	%r22, [%r8 + %r9]
	.word 0xfa120009  ! 1649: LDUH_R	lduh	[%r8 + %r9], %r29
	.word 0x87a209a9  ! 1650: FDIVs	fdivs	%f8, %f9, %f3
	.word 0xe0aa1009  ! 1651: STBA_R	stba	%r16, [%r8 + %r9] 0x80
	.word 0xe52220e0  ! 1652: STF_I	st	%f18, [0x00e0, %r8]
	.word 0xf5020009  ! 1653: LDF_R	ld	[%r8, %r9], %f26
	.word 0xc8821009  ! 1654: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r4
	.word 0x08800001  ! 1655: BLEU	bleu  	<label_0x1>
	.word 0xb8520009  ! 1656: UMUL_R	umul 	%r8, %r9, %r28
	.word 0xc87a0009  ! 1657: SWAP_R	swap	%r4, [%r8 + %r9]
	.word 0xc5f21009  ! 1658: CASXA_I	casxa	[%r8] 0x80, %r9, %r2
	.word 0xce0220a8  ! 1659: LDUW_I	lduw	[%r8 + 0x00a8], %r7
	.word 0x06ca0001  ! 1660: BRLZ	brlz  ,pt	%8,<label_0xa0001>
	.word 0xbaf2211c  ! 1661: UDIVcc_I	udivcc 	%r8, 0x011c, %r29
	.word 0x2cc20001  ! 1662: BRGZ	brgz,a,nt	%8,<label_0x20001>
	.word 0xcb2223c4  ! 1663: STF_I	st	%f5, [0x03c4, %r8]
	.word 0xe6b21009  ! 1664: STHA_R	stha	%r19, [%r8 + %r9] 0x80
	.word 0xb2d20009  ! 1665: UMULcc_R	umulcc 	%r8, %r9, %r25
	.word 0xc36a0009  ! 1666: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0x865a0009  ! 1667: SMUL_R	smul 	%r8, %r9, %r3
	.word 0xa46a2f68  ! 1668: UDIVX_I	udivx 	%r8, 0x0f68, %r18
	.word 0x8143e06b  ! 1669: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #MemIssue | #Sync 
	.word 0xcef21009  ! 1670: STXA_R	stxa	%r7, [%r8 + %r9] 0x80
	.word 0x896a2e7c  ! 1671: SDIVX_I	sdivx	%r8, 0x0e7c, %r4
	.word 0x867a0009  ! 1672: SDIV_R	sdiv 	%r8, %r9, %r3
	.word 0xcf222b4c  ! 1673: STF_I	st	%f7, [0x0b4c, %r8]
	.word 0xbe722a9c  ! 1674: UDIV_I	udiv 	%r8, 0x0a9c, %r31
	.word 0xea720009  ! 1676: STX_R	stx	%r21, [%r8 + %r9]
	.word 0xce520009  ! 1676: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xe46a0009  ! 1677: LDSTUB_R	ldstub	%r18, [%r8 + %r9]
	.word 0x2cc20001  ! 1678: BRGZ	brgz,a,nt	%8,<label_0x20001>
	.word 0xe1220009  ! 1680: STF_R	st	%f16, [%r9, %r8]
	.word 0xca720009  ! 1681: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc4020009  ! 1681: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xe5220009  ! 1683: STF_R	st	%f18, [%r9, %r8]
	.word 0xc2720009  ! 1684: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xcc520009  ! 1684: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xc36a0009  ! 1685: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0x0a800002  ! 1686: BCS	bcs  	<label_0x2>
	.word 0xee5a0009  ! 1687: LDX_R	ldx	[%r8 + %r9], %r23
	.word 0xce022894  ! 1688: LDUW_I	lduw	[%r8 + 0x0894], %r7
	.word 0xa0d20009  ! 1689: UMULcc_R	umulcc 	%r8, %r9, %r16
	.word 0x36800002  ! 1690: BGE	bge,a	<label_0x2>
	.word 0x9ba20929  ! 1691: FMULs	fmuls	%f8, %f9, %f13
	.word 0x8ada0009  ! 1692: SMULcc_R	smulcc 	%r8, %r9, %r5
	.word 0xce220009  ! 1694: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc24a0009  ! 1694: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xc4ca1009  ! 1695: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r2
	.word 0x86fa0009  ! 1696: SDIVcc_R	sdivcc 	%r8, %r9, %r3
	.word 0xd73a2018  ! 1697: STDF_I	std	%f11, [0x0018, %r8]
	.word 0xc3ea1009  ! 1698: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xef3a20d8  ! 1699: STDF_I	std	%f23, [0x00d8, %r8]
	.word 0xcc8a1009  ! 1700: LDUBA_R	lduba	[%r8, %r9] 0x80, %r6
	.word 0x9cd20009  ! 1701: UMULcc_R	umulcc 	%r8, %r9, %r14
	.word 0x867a2fa0  ! 1702: SDIV_I	sdiv 	%r8, 0x0fa0, %r3
	.word 0xc3ea1009  ! 1703: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x9ed22120  ! 1704: UMULcc_I	umulcc 	%r8, 0x0120, %r15
	.word 0xc6c22714  ! 1705: LDSWA_I	ldswa	[%r8, + 0x0714] %asi, %r3
	.word 0xcf2220a8  ! 1706: STF_I	st	%f7, [0x00a8, %r8]
	.word 0x8143e042  ! 1707: MEMBAR	membar	#StoreLoad | #Sync 
	.word 0x8143e00f  ! 1708: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore 
	.word 0xc0ba2998  ! 1709: STDA_I	stda	%r0, [%r8 + 0x0998] %asi
	.word 0xc9e22009  ! 1710: CASA_R	casa	[%r8] %asi, %r9, %r4
	.word 0x83a208a9  ! 1711: FSUBs	fsubs	%f8, %f9, %f1
	.word 0xe0220009  ! 1713: STW_R	stw	%r16, [%r8 + %r9]
	.word 0xee420009  ! 1713: LDSW_R	ldsw	[%r8 + %r9], %r23
	.word 0xcada1009  ! 1714: LDXA_R	ldxa	[%r8, %r9] 0x80, %r5
	.word 0xca7a0009  ! 1715: SWAP_R	swap	%r5, [%r8 + %r9]
	.word 0xf48a1009  ! 1716: LDUBA_R	lduba	[%r8, %r9] 0x80, %r26
	.word 0x40000001  ! 1717: CALL	call	disp30_1
	.word 0xca5a0009  ! 1718: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xcc120009  ! 1719: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xe8ca1009  ! 1720: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r20
	.word 0x8143e016  ! 1721: MEMBAR	membar	#StoreLoad | #LoadStore | #Lookaside 
	.word 0x8da208a9  ! 1722: FSUBs	fsubs	%f8, %f9, %f6
	.word 0xdc1a2e70  ! 1723: LDD_I	ldd	[%r8 + 0x0e70], %r14
	.word 0xc24a0009  ! 1724: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xca2a0009  ! 1726: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xcd020009  ! 1726: LDF_R	ld	[%r8, %r9], %f6
	.word 0xb67a0009  ! 1727: SDIV_R	sdiv 	%r8, %r9, %r27
	.word 0xc87a2d14  ! 1728: SWAP_I	swap	%r4, [%r8 + 0x0d14]
	.word 0x8143c000  ! 1729: STBAR	stbar
	.word 0x24800002  ! 1730: BLE	ble,a	<label_0x2>
	.word 0xc82a0009  ! 1732: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xce120009  ! 1732: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xc41a0009  ! 1733: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xcac21009  ! 1734: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r5
	.word 0xc51a0009  ! 1735: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xf6c22738  ! 1736: LDSWA_I	ldswa	[%r8, + 0x0738] %asi, %r27
	.word 0x88da0009  ! 1737: SMULcc_R	smulcc 	%r8, %r9, %r4
	.word 0x8ada0009  ! 1738: SMULcc_R	smulcc 	%r8, %r9, %r5
	.word 0xc8d22504  ! 1739: LDSHA_I	ldsha	[%r8, + 0x0504] %asi, %r4
	.word 0xbda20829  ! 1740: FADDs	fadds	%f8, %f9, %f30
	.word 0xfc8a28e4  ! 1741: LDUBA_I	lduba	[%r8, + 0x08e4] %asi, %r30
	.word 0xc73a0009  ! 1743: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc8720009  ! 1744: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc51a0009  ! 1744: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0x8efa0009  ! 1745: SDIVcc_R	sdivcc 	%r8, %r9, %r7
	.word 0x8c722880  ! 1746: UDIV_I	udiv 	%r8, 0x0880, %r6
	.word 0x88f229b8  ! 1747: UDIVcc_I	udivcc 	%r8, 0x09b8, %r4
	.word 0xf0ba2538  ! 1748: STDA_I	stda	%r24, [%r8 + 0x0538] %asi
	.word 0xc36a0009  ! 1749: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0x22800001  ! 1750: BE	be,a	<label_0x1>
	.word 0xcc220009  ! 1752: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc8520009  ! 1752: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xe8f21009  ! 1753: STXA_R	stxa	%r20, [%r8 + %r9] 0x80
	.word 0x0a800001  ! 1754: BCS	bcs  	<label_0x1>
	.word 0xc24a0009  ! 1755: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0x885a2ba4  ! 1756: SMUL_I	smul 	%r8, 0x0ba4, %r4
	.word 0xcc1a0009  ! 1757: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xde320009  ! 1759: STH_R	sth	%r15, [%r8 + %r9]
	.word 0xc5020009  ! 1759: LDF_R	ld	[%r8, %r9], %f2
	.word 0xc7222454  ! 1760: STF_I	st	%f3, [0x0454, %r8]
	.word 0xee922330  ! 1761: LDUHA_I	lduha	[%r8, + 0x0330] %asi, %r23
	.word 0xc53a2c70  ! 1762: STDF_I	std	%f2, [0x0c70, %r8]
	.word 0xcaf21009  ! 1763: STXA_R	stxa	%r5, [%r8 + %r9] 0x80
	.word 0xc3ea1009  ! 1764: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x836a0009  ! 1765: SDIVX_R	sdivx	%r8, %r9, %r1
	.word 0xce921009  ! 1766: LDUHA_R	lduha	[%r8, %r9] 0x80, %r7
	.word 0xcc6a0009  ! 1767: LDSTUB_R	ldstub	%r6, [%r8 + %r9]
	.word 0x8cfa2f20  ! 1768: SDIVcc_I	sdivcc 	%r8, 0x0f20, %r6
	.word 0xc5e21009  ! 1769: CASA_I	casa	[%r8] 0x80, %r9, %r2
	.word 0x8143e054  ! 1770: MEMBAR	membar	#LoadStore | #Lookaside | #Sync 
	.word 0xf02a0009  ! 1772: STB_R	stb	%r24, [%r8 + %r9]
	.word 0xc8420009  ! 1772: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0x02c20001  ! 1773: BRZ	brz  ,nt	%8,<label_0x20001>
	.word 0xd73a0009  ! 1775: STDF_R	std	%f11, [%r9, %r8]
	.word 0xce720009  ! 1776: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc84a0009  ! 1776: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xc6ea2b34  ! 1777: LDSTUBA_I	ldstuba	%r3, [%r8 + 0x0b34] %asi
	.word 0xc36a0009  ! 1778: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc8320009  ! 1780: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc24a0009  ! 1780: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xc4fa2388  ! 1781: SWAPA_I	swapa	%r2, [%r8 + 0x0388] %asi
	.word 0xc36a2760  ! 1782: PREFETCH_I	prefetch	[%r8 + 0x0760], #one_read
	.word 0x845a22dc  ! 1783: SMUL_I	smul 	%r8, 0x02dc, %r2
	.word 0x8143c000  ! 1784: STBAR	stbar
	.word 0xc3ea1009  ! 1785: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc9220009  ! 1787: STF_R	st	%f4, [%r9, %r8]
	.word 0xce720009  ! 1788: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc5020009  ! 1788: LDF_R	ld	[%r8, %r9], %f2
	.word 0xc9220009  ! 1790: STF_R	st	%f4, [%r9, %r8]
	.word 0xca720009  ! 1791: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc25a0009  ! 1791: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xe4ba2070  ! 1792: STDA_I	stda	%r18, [%r8 + 0x0070] %asi
	.word 0xf6821009  ! 1793: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r27
	.word 0x97a20829  ! 1794: FADDs	fadds	%f8, %f9, %f11
	.word 0x8143e018  ! 1795: MEMBAR	membar	#StoreStore | #Lookaside 
	.word 0xc33a2e98  ! 1796: STDF_I	std	%f1, [0x0e98, %r8]
	.word 0xc2320009  ! 1798: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc4020009  ! 1798: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xc82a0009  ! 1800: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc2020009  ! 1800: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xca6a2770  ! 1801: LDSTUB_I	ldstub	%r5, [%r8 + 0x0770]
	.word 0xca0a2e0c  ! 1802: LDUB_I	ldub	[%r8 + 0x0e0c], %r5
	.word 0xc42a0009  ! 1804: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc85a0009  ! 1804: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xc65a23f0  ! 1805: LDX_I	ldx	[%r8 + 0x03f0], %r3
	.word 0xe5f21009  ! 1806: CASXA_I	casxa	[%r8] 0x80, %r9, %r18
	.word 0xf0320009  ! 1808: STH_R	sth	%r24, [%r8 + %r9]
	.word 0xda120009  ! 1808: LDUH_R	lduh	[%r8 + %r9], %r13
	.word 0xcd3a2408  ! 1809: STDF_I	std	%f6, [0x0408, %r8]
	.word 0xecb2233c  ! 1810: STHA_I	stha	%r22, [%r8 + 0x033c] %asi
	.word 0xc62a0009  ! 1812: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc81a0009  ! 1812: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xc8020009  ! 1813: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0x96722320  ! 1814: UDIV_I	udiv 	%r8, 0x0320, %r11
	.word 0xc6ea1009  ! 1815: LDSTUBA_R	ldstuba	%r3, [%r8 + %r9] 0x80
	.word 0x83220009  ! 1816: MULScc_R	mulscc 	%r8, %r9, %r1
	.word 0xce220009  ! 1818: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xca0a0009  ! 1818: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0x98722200  ! 1819: UDIV_I	udiv 	%r8, 0x0200, %r12
	.word 0xc8c22478  ! 1820: LDSWA_I	ldswa	[%r8, + 0x0478] %asi, %r4
	.word 0xc84a0009  ! 1821: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xc66a242c  ! 1822: LDSTUB_I	ldstub	%r3, [%r8 + 0x042c]
	.word 0xccf22180  ! 1823: STXA_I	stxa	%r6, [%r8 + 0x0180] %asi
	.word 0x8cfa0009  ! 1824: SDIVcc_R	sdivcc 	%r8, %r9, %r6
	.word 0xc6d22ce4  ! 1825: LDSHA_I	ldsha	[%r8, + 0x0ce4] %asi, %r3
	.word 0xc3ea1009  ! 1826: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xccfa2940  ! 1827: SWAPA_I	swapa	%r6, [%r8 + 0x0940] %asi
	.word 0x8252206c  ! 1828: UMUL_I	umul 	%r8, 0x006c, %r1
	.word 0xc3ea1009  ! 1829: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xf82a0009  ! 1831: STB_R	stb	%r28, [%r8 + %r9]
	.word 0xd65a0009  ! 1831: LDX_R	ldx	[%r8 + %r9], %r11
	.word 0x8a5a0009  ! 1832: SMUL_R	smul 	%r8, %r9, %r5
	.word 0x866a0009  ! 1833: UDIVX_R	udivx 	%r8, %r9, %r3
	.word 0x8fa20829  ! 1834: FADDs	fadds	%f8, %f9, %f7
	.word 0xc6220009  ! 1836: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xd6120009  ! 1836: LDUH_R	lduh	[%r8 + %r9], %r11
	.word 0xccaa2918  ! 1837: STBA_I	stba	%r6, [%r8 + 0x0918] %asi
	.word 0xce2a0009  ! 1839: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xe44a0009  ! 1839: LDSB_R	ldsb	[%r8 + %r9], %r18
	.word 0x8143c000  ! 1840: STBAR	stbar
	.word 0xe4ba2c90  ! 1841: STDA_I	stda	%r18, [%r8 + 0x0c90] %asi
	.word 0xeeda2b60  ! 1842: LDXA_I	ldxa	[%r8, + 0x0b60] %asi, %r23
	.word 0xfe220009  ! 1844: STW_R	stw	%r31, [%r8 + %r9]
	.word 0xcd1a0009  ! 1844: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xcbe21009  ! 1845: CASA_I	casa	[%r8] 0x80, %r9, %r5
	.word 0x8da20929  ! 1846: FMULs	fmuls	%f8, %f9, %f6
	.word 0x8143c000  ! 1847: STBAR	stbar
	.word 0x8522259c  ! 1848: MULScc_I	mulscc 	%r8, 0x059c, %r2
	.word 0xcb2222a8  ! 1849: STF_I	st	%f5, [0x02a8, %r8]
	.word 0xc33a0009  ! 1851: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc2720009  ! 1852: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xee020009  ! 1852: LDUW_R	lduw	[%r8 + %r9], %r23
	.word 0x8a520009  ! 1853: UMUL_R	umul 	%r8, %r9, %r5
	.word 0xc4921009  ! 1854: LDUHA_R	lduha	[%r8, %r9] 0x80, %r2
	.word 0xdc922ed4  ! 1855: LDUHA_I	lduha	[%r8, + 0x0ed4] %asi, %r14
	.word 0xc46a22e8  ! 1856: LDSTUB_I	ldstub	%r2, [%r8 + 0x02e8]
	.word 0xc2c21009  ! 1857: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r1
	.word 0x26800001  ! 1858: BL	bl,a	<label_0x1>
	.word 0x83a20829  ! 1859: FADDs	fadds	%f8, %f9, %f1
	.word 0xccb21009  ! 1860: STHA_R	stha	%r6, [%r8 + %r9] 0x80
	.word 0x84da2fc4  ! 1861: SMULcc_I	smulcc 	%r8, 0x0fc4, %r2
	.word 0xef3a0009  ! 1863: STDF_R	std	%f23, [%r9, %r8]
	.word 0xc2720009  ! 1864: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc41a0009  ! 1864: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xcc7a0009  ! 1865: SWAP_R	swap	%r6, [%r8 + %r9]
	.word 0xc36a0009  ! 1866: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xfaea21c8  ! 1867: LDSTUBA_I	ldstuba	%r29, [%r8 + 0x01c8] %asi
	.word 0xc3ea1009  ! 1868: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x86fa2058  ! 1869: SDIVcc_I	sdivcc 	%r8, 0x0058, %r3
	.word 0x8143e028  ! 1870: MEMBAR	membar	#StoreStore | #MemIssue 
	.word 0xc53a2c30  ! 1871: STDF_I	std	%f2, [0x0c30, %r8]
	.word 0x886a2260  ! 1872: UDIVX_I	udivx 	%r8, 0x0260, %r4
	.word 0x8143c000  ! 1873: STBAR	stbar
	.word 0x8a4a20ec  ! 1874: MULX_I	mulx 	%r8, 0x00ec, %r5
	.word 0x8143e042  ! 1875: MEMBAR	membar	#StoreLoad | #Sync 
	.word 0xdb3a2580  ! 1876: STDF_I	std	%f13, [0x0580, %r8]
	.word 0xce0a0009  ! 1877: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xcf3a2720  ! 1878: STDF_I	std	%f7, [0x0720, %r8]
	.word 0xc93a0009  ! 1880: STDF_R	std	%f4, [%r9, %r8]
	.word 0xc8720009  ! 1881: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc24a0009  ! 1881: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0x88fa2d60  ! 1882: SDIVcc_I	sdivcc 	%r8, 0x0d60, %r4
	.word 0xcc9a2c28  ! 1883: LDDA_I	ldda	[%r8, + 0x0c28] %asi, %r6
	.word 0xc33a0009  ! 1885: STDF_R	std	%f1, [%r9, %r8]
	.word 0xcc720009  ! 1886: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xca420009  ! 1886: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0x8143e07b  ! 1887: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0x8143c000  ! 1888: STBAR	stbar
	.word 0xce320009  ! 1890: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xf7020009  ! 1890: LDF_R	ld	[%r8, %r9], %f27
	.word 0xef222ff0  ! 1891: STF_I	st	%f23, [0x0ff0, %r8]
	.word 0xc36a2218  ! 1892: PREFETCH_I	prefetch	[%r8 + 0x0218], #one_read
	.word 0x8143e057  ! 1893: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside | #Sync 
	.word 0xc3ea1009  ! 1894: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x867a2048  ! 1895: SDIV_I	sdiv 	%r8, 0x0048, %r3
	.word 0x8143e062  ! 1896: MEMBAR	membar	#StoreLoad | #MemIssue | #Sync 
	.word 0xcada2bc0  ! 1897: LDXA_I	ldxa	[%r8, + 0x0bc0] %asi, %r5
	.word 0x83a209a9  ! 1898: FDIVs	fdivs	%f8, %f9, %f1
	.word 0xdcba1009  ! 1899: STDA_R	stda	%r14, [%r8 + %r9] 0x80
	.word 0xc8520009  ! 1900: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0x2a800001  ! 1901: BCS	bcs,a	<label_0x1>
	.word 0xc36a0009  ! 1902: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xec220009  ! 1904: STW_R	stw	%r22, [%r8 + %r9]
	.word 0xe9020009  ! 1904: LDF_R	ld	[%r8, %r9], %f20
	.word 0x84720009  ! 1905: UDIV_R	udiv 	%r8, %r9, %r2
	.word 0xc8320009  ! 1907: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xf04a0009  ! 1907: LDSB_R	ldsb	[%r8 + %r9], %r24
	.word 0xc36a0009  ! 1908: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0x884a0009  ! 1909: MULX_R	mulx 	%r8, %r9, %r4
	.word 0x9afa2780  ! 1910: SDIVcc_I	sdivcc 	%r8, 0x0780, %r13
	.word 0x846a0009  ! 1911: UDIVX_R	udivx 	%r8, %r9, %r2
	.word 0xcc1a2798  ! 1912: LDD_I	ldd	[%r8 + 0x0798], %r6
	.word 0xc3ea1009  ! 1913: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x8143e07e  ! 1914: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xc33a2788  ! 1915: STDF_I	std	%f1, [0x0788, %r8]
	.word 0x9da20829  ! 1916: FADDs	fadds	%f8, %f9, %f14
	.word 0xe5222db8  ! 1917: STF_I	st	%f18, [0x0db8, %r8]
	.word 0x844a2970  ! 1918: MULX_I	mulx 	%r8, 0x0970, %r2
	.word 0x26800002  ! 1919: BL	bl,a	<label_0x2>
	.word 0x836a2254  ! 1920: SDIVX_I	sdivx	%r8, 0x0254, %r1
	.word 0x827a0009  ! 1921: SDIV_R	sdiv 	%r8, %r9, %r1
	.word 0xc8d21009  ! 1922: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r4
	.word 0x845a0009  ! 1923: SMUL_R	smul 	%r8, %r9, %r2
	.word 0x8a5a2c44  ! 1924: SMUL_I	smul 	%r8, 0x0c44, %r5
	.word 0x865a0009  ! 1925: SMUL_R	smul 	%r8, %r9, %r3
	.word 0xc4a21009  ! 1926: STWA_R	stwa	%r2, [%r8 + %r9] 0x80
	.word 0x24800001  ! 1927: BLE	ble,a	<label_0x1>
	.word 0xc8b221f8  ! 1928: STHA_I	stha	%r4, [%r8 + 0x01f8] %asi
	.word 0xfcfa2d18  ! 1929: SWAPA_I	swapa	%r30, [%r8 + 0x0d18] %asi
	.word 0xce122964  ! 1930: LDUH_I	lduh	[%r8 + 0x0964], %r7
	.word 0xdc9a1009  ! 1931: LDDA_R	ldda	[%r8, %r9] 0x80, %r14
	.word 0x8e720009  ! 1932: UDIV_R	udiv 	%r8, %r9, %r7
	.word 0xa6fa2e70  ! 1933: SDIVcc_I	sdivcc 	%r8, 0x0e70, %r19
	.word 0x8143c000  ! 1934: STBAR	stbar
	.word 0xdc4a2180  ! 1935: LDSB_I	ldsb	[%r8 + 0x0180], %r14
	.word 0x8c4a0009  ! 1936: MULX_R	mulx 	%r8, %r9, %r6
	.word 0xf8320009  ! 1938: STH_R	sth	%r28, [%r8 + %r9]
	.word 0xc4520009  ! 1938: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xc73a2958  ! 1939: STDF_I	std	%f3, [0x0958, %r8]
	.word 0xc36a2a54  ! 1940: PREFETCH_I	prefetch	[%r8 + 0x0a54], #one_read
	.word 0xc2d2267c  ! 1941: LDSHA_I	ldsha	[%r8, + 0x067c] %asi, %r1
	.word 0xfa2a0009  ! 1943: STB_R	stb	%r29, [%r8 + %r9]
	.word 0xc20a0009  ! 1943: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0x83a20829  ! 1944: FADDs	fadds	%f8, %f9, %f1
	.word 0x866a0009  ! 1945: UDIVX_R	udivx 	%r8, %r9, %r3
	.word 0xcc220009  ! 1947: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc2120009  ! 1947: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xc2ca1009  ! 1948: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r1
	.word 0xbed22d24  ! 1949: UMULcc_I	umulcc 	%r8, 0x0d24, %r31
	.word 0x2eca0001  ! 1950: BRGEZ	brgez,a,pt	%8,<label_0xa0001>
	.word 0xc3ea1009  ! 1951: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc33a26d0  ! 1952: STDF_I	std	%f1, [0x06d0, %r8]
	.word 0xf0220009  ! 1954: STW_R	stw	%r24, [%r8 + %r9]
	.word 0xca5a0009  ! 1954: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xd62a0009  ! 1956: STB_R	stb	%r11, [%r8 + %r9]
	.word 0xcc120009  ! 1956: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xc4520009  ! 1957: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0x8143e062  ! 1958: MEMBAR	membar	#StoreLoad | #MemIssue | #Sync 
	.word 0xc36a2d50  ! 1959: PREFETCH_I	prefetch	[%r8 + 0x0d50], #one_read
	.word 0xc8ea2e8c  ! 1960: LDSTUBA_I	ldstuba	%r4, [%r8 + 0x0e8c] %asi
	.word 0xceda1009  ! 1961: LDXA_R	ldxa	[%r8, %r9] 0x80, %r7
	.word 0xfd2229ec  ! 1962: STF_I	st	%f30, [0x09ec, %r8]
	.word 0x2e800001  ! 1963: BVS	bvs,a	<label_0x1>
	.word 0xc3ea1009  ! 1964: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xfa220009  ! 1966: STW_R	stw	%r29, [%r8 + %r9]
	.word 0xc80a0009  ! 1966: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xf93a2838  ! 1967: STDF_I	std	%f28, [0x0838, %r8]
	.word 0xb9a208a9  ! 1968: FSUBs	fsubs	%f8, %f9, %f28
	.word 0xcaea2de4  ! 1969: LDSTUBA_I	ldstuba	%r5, [%r8 + 0x0de4] %asi
	.word 0xf4ba23a8  ! 1970: STDA_I	stda	%r26, [%r8 + 0x03a8] %asi
	.word 0xe07a0009  ! 1971: SWAP_R	swap	%r16, [%r8 + %r9]
	.word 0xcb222b54  ! 1972: STF_I	st	%f5, [0x0b54, %r8]
	.word 0x8ba20829  ! 1973: FADDs	fadds	%f8, %f9, %f5
	.word 0xc36a280c  ! 1974: PREFETCH_I	prefetch	[%r8 + 0x080c], #one_read
	.word 0xca320009  ! 1976: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xcc1a0009  ! 1976: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xc5222c2c  ! 1977: STF_I	st	%f2, [0x0c2c, %r8]
	.word 0xc80a2c14  ! 1978: LDUB_I	ldub	[%r8 + 0x0c14], %r4
	.word 0x8f220009  ! 1979: MULScc_R	mulscc 	%r8, %r9, %r7
	.word 0xc6320009  ! 1981: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xf6420009  ! 1981: LDSW_R	ldsw	[%r8 + %r9], %r27
	.word 0x896a25f4  ! 1982: SDIVX_I	sdivx	%r8, 0x05f4, %r4
	.word 0xc62a0009  ! 1984: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc6520009  ! 1984: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0x8143e070  ! 1985: MEMBAR	membar	#Lookaside | #MemIssue | #Sync 
	.word 0xc36a0009  ! 1986: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xfcca1009  ! 1987: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r30
	.word 0x8143c000  ! 1988: STBAR	stbar
	.word 0xc8f21009  ! 1989: STXA_R	stxa	%r4, [%r8 + %r9] 0x80
	.word 0xc6020009  ! 1990: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0x0cc20001  ! 1991: BRGZ	brgz  ,nt	%8,<label_0x20001>
	.word 0xe48a23d8  ! 1992: LDUBA_I	lduba	[%r8, + 0x03d8] %asi, %r18
	.word 0xaba20829  ! 1993: FADDs	fadds	%f8, %f9, %f21
	.word 0xee922474  ! 1994: LDUHA_I	lduha	[%r8, + 0x0474] %asi, %r23
	.word 0xfd222a4c  ! 1995: STF_I	st	%f30, [0x0a4c, %r8]
	.word 0xcc220009  ! 1997: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc5020009  ! 1997: LDF_R	ld	[%r8, %r9], %f2
	.word 0x86522aac  ! 1998: UMUL_I	umul 	%r8, 0x0aac, %r3
	.word 0xc36a0009  ! 1999: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xdaf22938  ! 2000: STXA_I	stxa	%r13, [%r8 + 0x0938] %asi
	.word 0x8fa20929  ! 2001: FMULs	fmuls	%f8, %f9, %f7
	.word 0x8143c000  ! 2002: STBAR	stbar
	.word 0xc4ba1009  ! 2003: STDA_R	stda	%r2, [%r8 + %r9] 0x80
	.word 0x9da20929  ! 2004: FMULs	fmuls	%f8, %f9, %f14
	.word 0xc8220009  ! 2006: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xee4a0009  ! 2006: LDSB_R	ldsb	[%r8 + %r9], %r23
	.word 0xccda2048  ! 2007: LDXA_I	ldxa	[%r8, + 0x0048] %asi, %r6
	.word 0xc6022094  ! 2008: LDUW_I	lduw	[%r8 + 0x0094], %r3
	.word 0xc36a0009  ! 2009: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xccf21009  ! 2010: STXA_R	stxa	%r6, [%r8 + %r9] 0x80
	.word 0xf4220009  ! 2012: STW_R	stw	%r26, [%r8 + %r9]
	.word 0xc8420009  ! 2012: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xc6b21009  ! 2013: STHA_R	stha	%r3, [%r8 + %r9] 0x80
	.word 0xa2d20009  ! 2014: UMULcc_R	umulcc 	%r8, %r9, %r17
	.word 0xc6821009  ! 2015: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r3
	.word 0xd8320009  ! 2017: STH_R	sth	%r12, [%r8 + %r9]
	.word 0xd60a0009  ! 2017: LDUB_R	ldub	[%r8 + %r9], %r11
	.word 0xd62a0009  ! 2019: STB_R	stb	%r11, [%r8 + %r9]
	.word 0xc51a0009  ! 2019: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xc42a0009  ! 2021: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc6520009  ! 2021: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0x40000002  ! 2022: CALL	call	disp30_2
	.word 0xc36a0009  ! 2023: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0x8da209a9  ! 2024: FDIVs	fdivs	%f8, %f9, %f6
	.word 0xfe720009  ! 2026: STX_R	stx	%r31, [%r8 + %r9]
	.word 0xc3020009  ! 2026: LDF_R	ld	[%r8, %r9], %f1
	.word 0xcea22c2c  ! 2027: STWA_I	stwa	%r7, [%r8 + 0x0c2c] %asi
	.word 0xc8ea270c  ! 2028: LDSTUBA_I	ldstuba	%r4, [%r8 + 0x070c] %asi
	.word 0x04ca0001  ! 2029: BRLEZ	brlez  ,pt	%8,<label_0xa0001>
	.word 0xcc2a0009  ! 2031: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xcc4a0009  ! 2031: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xceea2154  ! 2032: LDSTUBA_I	ldstuba	%r7, [%r8 + 0x0154] %asi
	.word 0xc36a0009  ! 2033: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xf88a2e0c  ! 2034: LDUBA_I	lduba	[%r8, + 0x0e0c] %asi, %r28
	.word 0xc6320009  ! 2036: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xce420009  ! 2036: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xc6f21009  ! 2037: STXA_R	stxa	%r3, [%r8 + %r9] 0x80
	.word 0x8ada0009  ! 2038: SMULcc_R	smulcc 	%r8, %r9, %r5
	.word 0xcb3a24c8  ! 2039: STDF_I	std	%f5, [0x04c8, %r8]
	.word 0x89a20929  ! 2040: FMULs	fmuls	%f8, %f9, %f4
	.word 0xe6220009  ! 2042: STW_R	stw	%r19, [%r8 + %r9]
	.word 0xdd1a0009  ! 2042: LDDF_R	ldd	[%r8, %r9], %f14
	.word 0xc3ea2d10  ! 2043: PREFETCHA_I	prefetcha	[%r8, + 0x0d10] %asi, #one_read
	.word 0xe4fa1009  ! 2044: SWAPA_R	swapa	%r18, [%r8 + %r9] 0x80
	.word 0x864a0009  ! 2045: MULX_R	mulx 	%r8, %r9, %r3
	.word 0xc2a22100  ! 2046: STWA_I	stwa	%r1, [%r8 + 0x0100] %asi
	.word 0xacda2cb4  ! 2047: SMULcc_I	smulcc 	%r8, 0x0cb4, %r22
	.word 0xc7220009  ! 2049: STF_R	st	%f3, [%r9, %r8]
	.word 0xcc720009  ! 2050: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xcc5a0009  ! 2050: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xfe8a20c8  ! 2051: LDUBA_I	lduba	[%r8, + 0x00c8] %asi, %r31
	.word 0x8143c000  ! 2052: STBAR	stbar
	.word 0x896a0009  ! 2053: SDIVX_R	sdivx	%r8, %r9, %r4
	.word 0xc4220009  ! 2055: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xd64a0009  ! 2055: LDSB_R	ldsb	[%r8 + %r9], %r11
	.word 0xc73a2348  ! 2056: STDF_I	std	%f3, [0x0348, %r8]
	.word 0xcc1a2ac0  ! 2057: LDD_I	ldd	[%r8 + 0x0ac0], %r6
	.word 0x34800001  ! 2058: BG	bg,a	<label_0x1>
	.word 0xc36a2670  ! 2059: PREFETCH_I	prefetch	[%r8 + 0x0670], #one_read
	.word 0xcc9228e0  ! 2060: LDUHA_I	lduha	[%r8, + 0x08e0] %asi, %r6
	.word 0x8d6a29cc  ! 2061: SDIVX_I	sdivx	%r8, 0x09cc, %r6
	.word 0xe86a0009  ! 2062: LDSTUB_R	ldstub	%r20, [%r8 + %r9]
	.word 0x836a2dd0  ! 2063: SDIVX_I	sdivx	%r8, 0x0dd0, %r1
	.word 0x3e800001  ! 2064: BVC	bvc,a	<label_0x1>
	.word 0xc4aa1009  ! 2065: STBA_R	stba	%r2, [%r8 + %r9] 0x80
	.word 0xccb2260c  ! 2066: STHA_I	stha	%r6, [%r8 + 0x060c] %asi
	.word 0xfa220009  ! 2068: STW_R	stw	%r29, [%r8 + %r9]
	.word 0xd80a0009  ! 2068: LDUB_R	ldub	[%r8 + %r9], %r12
	.word 0x8c4a0009  ! 2069: MULX_R	mulx 	%r8, %r9, %r6
	.word 0xc89a2968  ! 2070: LDDA_I	ldda	[%r8, + 0x0968] %asi, %r4
	.word 0x8a720009  ! 2071: UDIV_R	udiv 	%r8, %r9, %r5
	.word 0xc8822628  ! 2072: LDUWA_I	lduwa	[%r8, + 0x0628] %asi, %r4
	.word 0xf8320009  ! 2074: STH_R	sth	%r28, [%r8 + %r9]
	.word 0xe6020009  ! 2074: LDUW_R	lduw	[%r8 + %r9], %r19
	.word 0x865a0009  ! 2075: SMUL_R	smul 	%r8, %r9, %r3
	.word 0xcc2a0009  ! 2077: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xca520009  ! 2077: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0x8143e004  ! 2078: MEMBAR	membar	#LoadStore 
	.word 0xcde22009  ! 2079: CASA_R	casa	[%r8] %asi, %r9, %r6
	.word 0xca7a28c0  ! 2080: SWAP_I	swap	%r5, [%r8 + 0x08c0]
	.word 0xc62a0009  ! 2082: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xca020009  ! 2082: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xca52246c  ! 2083: LDSH_I	ldsh	[%r8 + 0x046c], %r5
	.word 0x8cfa2b24  ! 2084: SDIVcc_I	sdivcc 	%r8, 0x0b24, %r6
	.word 0x8a7a2898  ! 2085: SDIV_I	sdiv 	%r8, 0x0898, %r5
	.word 0xcc320009  ! 2087: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc24a0009  ! 2087: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xf9f21009  ! 2088: CASXA_I	casxa	[%r8] 0x80, %r9, %r28
	.word 0x88720009  ! 2089: UDIV_R	udiv 	%r8, %r9, %r4
	.word 0x8143c000  ! 2090: STBAR	stbar
	.word 0xc32229c0  ! 2091: STF_I	st	%f1, [0x09c0, %r8]
	.word 0xcde22009  ! 2092: CASA_R	casa	[%r8] %asi, %r9, %r6
	.word 0xcaf22688  ! 2093: STXA_I	stxa	%r5, [%r8 + 0x0688] %asi
	.word 0xfe922014  ! 2094: LDUHA_I	lduha	[%r8, + 0x0014] %asi, %r31
	.word 0xdf3a2e60  ! 2095: STDF_I	std	%f15, [0x0e60, %r8]
	.word 0xb9a208a9  ! 2096: FSUBs	fsubs	%f8, %f9, %f28
	.word 0xc2fa2aa8  ! 2097: SWAPA_I	swapa	%r1, [%r8 + 0x0aa8] %asi
	.word 0x8143e03a  ! 2098: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside | #MemIssue 
	.word 0x8e5a2cd4  ! 2099: SMUL_I	smul 	%r8, 0x0cd4, %r7
	.word 0x8143e028  ! 2100: MEMBAR	membar	#StoreStore | #MemIssue 
	.word 0xc36a289c  ! 2101: PREFETCH_I	prefetch	[%r8 + 0x089c], #one_read
	.word 0xcea227c4  ! 2102: STWA_I	stwa	%r7, [%r8 + 0x07c4] %asi
	.word 0xc3ea1009  ! 2103: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x824a0009  ! 2104: MULX_R	mulx 	%r8, %r9, %r1
	.word 0x8143e02c  ! 2105: MEMBAR	membar	#LoadStore | #StoreStore | #MemIssue 
	.word 0xc62a0009  ! 2107: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc5020009  ! 2107: LDF_R	ld	[%r8, %r9], %f2
	.word 0x8143c000  ! 2108: STBAR	stbar
	.word 0x8d220009  ! 2109: MULScc_R	mulscc 	%r8, %r9, %r6
	.word 0xc24a0009  ! 2110: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xc8f21009  ! 2111: STXA_R	stxa	%r4, [%r8 + %r9] 0x80
	.word 0xc4720009  ! 2113: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xcc520009  ! 2113: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xc6ca1009  ! 2114: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r3
	.word 0x824a2c04  ! 2115: MULX_I	mulx 	%r8, 0x0c04, %r1
	.word 0xc4b21009  ! 2116: STHA_R	stha	%r2, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 2117: STBAR	stbar
	.word 0xca720009  ! 2119: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xeb1a0009  ! 2119: LDDF_R	ldd	[%r8, %r9], %f21
	.word 0xc64a0009  ! 2120: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xc3ea1009  ! 2121: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xccf21009  ! 2122: STXA_R	stxa	%r6, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 2123: STBAR	stbar
	.word 0x976a2e4c  ! 2124: SDIVX_I	sdivx	%r8, 0x0e4c, %r11
	.word 0xa1222a8c  ! 2125: MULScc_I	mulscc 	%r8, 0x0a8c, %r16
	.word 0xc36a0009  ! 2126: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xf322257c  ! 2127: STF_I	st	%f25, [0x057c, %r8]
	.word 0xc4220009  ! 2129: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xcc5a0009  ! 2129: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0x04800001  ! 2130: BLE	ble  	<label_0x1>
	.word 0xce320009  ! 2132: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xfe4a0009  ! 2132: LDSB_R	ldsb	[%r8 + %r9], %r31
	.word 0xf6d2207c  ! 2133: LDSHA_I	ldsha	[%r8, + 0x007c] %asi, %r27
	.word 0xccba1009  ! 2134: STDA_R	stda	%r6, [%r8 + %r9] 0x80
	.word 0xcec22b00  ! 2135: LDSWA_I	ldswa	[%r8, + 0x0b00] %asi, %r7
	.word 0xf02a0009  ! 2137: STB_R	stb	%r24, [%r8 + %r9]
	.word 0xec1a0009  ! 2137: LDD_R	ldd	[%r8 + %r9], %r22
	.word 0xb85a2e64  ! 2138: SMUL_I	smul 	%r8, 0x0e64, %r28
	.word 0x2e800001  ! 2139: BVS	bvs,a	<label_0x1>
	.word 0xc36a0009  ! 2140: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc26a0009  ! 2141: LDSTUB_R	ldstub	%r1, [%r8 + %r9]
	.word 0x8143c000  ! 2142: STBAR	stbar
	.word 0x8ba20829  ! 2143: FADDs	fadds	%f8, %f9, %f5
	.word 0xe5222188  ! 2144: STF_I	st	%f18, [0x0188, %r8]
	.word 0xc2aa1009  ! 2145: STBA_R	stba	%r1, [%r8 + %r9] 0x80
	.word 0xe8120009  ! 2146: LDUH_R	lduh	[%r8 + %r9], %r20
	.word 0x887a0009  ! 2147: SDIV_R	sdiv 	%r8, %r9, %r4
	.word 0x972223ac  ! 2148: MULScc_I	mulscc 	%r8, 0x03ac, %r11
	.word 0xc412226c  ! 2149: LDUH_I	lduh	[%r8 + 0x026c], %r2
	.word 0xca320009  ! 2151: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xdc020009  ! 2151: LDUW_R	lduw	[%r8 + %r9], %r14
	.word 0x82da0009  ! 2152: SMULcc_R	smulcc 	%r8, %r9, %r1
	.word 0x8143e078  ! 2153: MEMBAR	membar	#StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xee320009  ! 2155: STH_R	sth	%r23, [%r8 + %r9]
	.word 0xdb020009  ! 2155: LDF_R	ld	[%r8, %r9], %f13
	.word 0xe4a21009  ! 2156: STWA_R	stwa	%r18, [%r8 + %r9] 0x80
	.word 0xda7a2968  ! 2157: SWAP_I	swap	%r13, [%r8 + 0x0968]
	.word 0x22ca0001  ! 2158: BRZ	brz,a,pt	%8,<label_0xa0001>
	.word 0xf2aa2f18  ! 2159: STBA_I	stba	%r25, [%r8 + 0x0f18] %asi
	.word 0xfcba1009  ! 2160: STDA_R	stda	%r30, [%r8 + %r9] 0x80
	.word 0x40000001  ! 2161: CALL	call	disp30_1
	.word 0x85a208a9  ! 2162: FSUBs	fsubs	%f8, %f9, %f2
	.word 0x824a2c58  ! 2163: MULX_I	mulx 	%r8, 0x0c58, %r1
	.word 0x8e5225b0  ! 2164: UMUL_I	umul 	%r8, 0x05b0, %r7
	.word 0xcc720009  ! 2166: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc24a0009  ! 2166: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xc6122f78  ! 2167: LDUH_I	lduh	[%r8 + 0x0f78], %r3
	.word 0x84522d44  ! 2168: UMUL_I	umul 	%r8, 0x0d44, %r2
	.word 0xc49a1009  ! 2169: LDDA_R	ldda	[%r8, %r9] 0x80, %r2
	.word 0xfec22440  ! 2170: LDSWA_I	ldswa	[%r8, + 0x0440] %asi, %r31
	.word 0xeb3a2148  ! 2171: STDF_I	std	%f21, [0x0148, %r8]
	.word 0xc4220009  ! 2173: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc2420009  ! 2173: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xceb21009  ! 2174: STHA_R	stha	%r7, [%r8 + %r9] 0x80
	.word 0xc2220009  ! 2176: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xea120009  ! 2176: LDUH_R	lduh	[%r8 + %r9], %r21
	.word 0xc82a0009  ! 2178: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc91a0009  ! 2178: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xda2a0009  ! 2180: STB_R	stb	%r13, [%r8 + %r9]
	.word 0xc71a0009  ! 2180: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0x8e4a0009  ! 2181: MULX_R	mulx 	%r8, %r9, %r7
	.word 0x8143c000  ! 2182: STBAR	stbar
	.word 0x8a4a2680  ! 2183: MULX_I	mulx 	%r8, 0x0680, %r5
	.word 0xce8a1009  ! 2184: LDUBA_R	lduba	[%r8, %r9] 0x80, %r7
	.word 0xf2220009  ! 2186: STW_R	stw	%r25, [%r8 + %r9]
	.word 0xc4020009  ! 2186: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xdcca2040  ! 2187: LDSBA_I	ldsba	[%r8, + 0x0040] %asi, %r14
	.word 0xbe7a0009  ! 2188: SDIV_R	sdiv 	%r8, %r9, %r31
	.word 0xc84222cc  ! 2189: LDSW_I	ldsw	[%r8 + 0x02cc], %r4
	.word 0xc6320009  ! 2191: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xe2420009  ! 2191: LDSW_R	ldsw	[%r8 + %r9], %r17
	.word 0xc53a25d8  ! 2192: STDF_I	std	%f2, [0x05d8, %r8]
	.word 0xc93a0009  ! 2194: STDF_R	std	%f4, [%r9, %r8]
	.word 0xf4720009  ! 2195: STX_R	stx	%r26, [%r8 + %r9]
	.word 0xc8520009  ! 2195: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xe2320009  ! 2197: STH_R	sth	%r17, [%r8 + %r9]
	.word 0xcc420009  ! 2197: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xc46a22e0  ! 2198: LDSTUB_I	ldstub	%r2, [%r8 + 0x02e0]
	.word 0xceb22570  ! 2199: STHA_I	stha	%r7, [%r8 + 0x0570] %asi
	.word 0xe2122178  ! 2200: LDUH_I	lduh	[%r8 + 0x0178], %r17
	.word 0xc22a0009  ! 2202: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc25a0009  ! 2202: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xce320009  ! 2204: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc65a0009  ! 2204: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xc80a25ac  ! 2205: LDUB_I	ldub	[%r8 + 0x05ac], %r4
	.word 0xc86a2594  ! 2206: LDSTUB_I	ldstub	%r4, [%r8 + 0x0594]
	.word 0xa47a2c4c  ! 2207: SDIV_I	sdiv 	%r8, 0x0c4c, %r18
	.word 0xecd21009  ! 2208: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r22
	.word 0x20800001  ! 2209: BN	bn,a	<label_0x1>
	.word 0xc71a0009  ! 2210: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0x8e5a2ed4  ! 2211: SMUL_I	smul 	%r8, 0x0ed4, %r7
	.word 0x3c800002  ! 2212: BPOS	bpos,a	<label_0x2>
	.word 0xcc6a2a50  ! 2213: LDSTUB_I	ldstub	%r6, [%r8 + 0x0a50]
	.word 0xc8022df4  ! 2214: LDUW_I	lduw	[%r8 + 0x0df4], %r4
	.word 0x8e7a2944  ! 2215: SDIV_I	sdiv 	%r8, 0x0944, %r7
	.word 0xd82a0009  ! 2217: STB_R	stb	%r12, [%r8 + %r9]
	.word 0xc4520009  ! 2217: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xc73a2be8  ! 2218: STDF_I	std	%f3, [0x0be8, %r8]
	.word 0xf4120009  ! 2219: LDUH_R	lduh	[%r8 + %r9], %r26
	.word 0xc68a1009  ! 2220: LDUBA_R	lduba	[%r8, %r9] 0x80, %r3
	.word 0xcff22009  ! 2221: CASXA_R	casxa	[%r8]%asi, %r9, %r7
	.word 0x8c6a0009  ! 2222: UDIVX_R	udivx 	%r8, %r9, %r6
	.word 0x8c6a0009  ! 2223: UDIVX_R	udivx 	%r8, %r9, %r6
	.word 0xeeb22d64  ! 2224: STHA_I	stha	%r23, [%r8 + 0x0d64] %asi
	.word 0xe02a0009  ! 2226: STB_R	stb	%r16, [%r8 + %r9]
	.word 0xe24a0009  ! 2226: LDSB_R	ldsb	[%r8 + %r9], %r17
	.word 0xdc320009  ! 2228: STH_R	sth	%r14, [%r8 + %r9]
	.word 0xc6420009  ! 2228: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0x8143c000  ! 2229: STBAR	stbar
	.word 0xcd3a0009  ! 2231: STDF_R	std	%f6, [%r9, %r8]
	.word 0xfc720009  ! 2232: STX_R	stx	%r30, [%r8 + %r9]
	.word 0xe6520009  ! 2232: LDSH_R	ldsh	[%r8 + %r9], %r19
	.word 0x8f6a0009  ! 2233: SDIVX_R	sdivx	%r8, %r9, %r7
	.word 0x24c20001  ! 2234: BRLEZ	brlez,a,nt	%8,<label_0x20001>
	.word 0x40000002  ! 2235: CALL	call	disp30_2
	.word 0x88fa2f74  ! 2236: SDIVcc_I	sdivcc 	%r8, 0x0f74, %r4
	.word 0xacf20009  ! 2237: UDIVcc_R	udivcc 	%r8, %r9, %r22
	.word 0x99a209a9  ! 2238: FDIVs	fdivs	%f8, %f9, %f12
	.word 0xc3ea1009  ! 2239: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xcb1a0009  ! 2240: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xc2720009  ! 2242: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xcf020009  ! 2242: LDF_R	ld	[%r8, %r9], %f7
	.word 0xc25a0009  ! 2243: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xced21009  ! 2244: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r7
	.word 0xd6f21009  ! 2245: STXA_R	stxa	%r11, [%r8 + %r9] 0x80
	.word 0x8cf20009  ! 2246: UDIVcc_R	udivcc 	%r8, %r9, %r6
	.word 0x18800002  ! 2247: BGU	bgu  	<label_0x2>
	.word 0xc4ea1009  ! 2248: LDSTUBA_R	ldstuba	%r2, [%r8 + %r9] 0x80
	.word 0xcc720009  ! 2250: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xe8120009  ! 2250: LDUH_R	lduh	[%r8 + %r9], %r20
	.word 0xc26a0009  ! 2251: LDSTUB_R	ldstub	%r1, [%r8 + %r9]
	.word 0xda720009  ! 2253: STX_R	stx	%r13, [%r8 + %r9]
	.word 0xc8020009  ! 2253: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xed220009  ! 2255: STF_R	st	%f22, [%r9, %r8]
	.word 0xc4720009  ! 2256: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc85a0009  ! 2256: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0x0cc20001  ! 2257: BRGZ	brgz  ,nt	%8,<label_0x20001>
	.word 0xcb220009  ! 2259: STF_R	st	%f5, [%r9, %r8]
	.word 0xcc720009  ! 2260: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc81a0009  ! 2260: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x82f20009  ! 2261: UDIVcc_R	udivcc 	%r8, %r9, %r1
	.word 0xe89a2938  ! 2262: LDDA_I	ldda	[%r8, + 0x0938] %asi, %r20
	.word 0xc4ba1009  ! 2263: STDA_R	stda	%r2, [%r8 + %r9] 0x80
	.word 0xfaa22ce0  ! 2264: STWA_I	stwa	%r29, [%r8 + 0x0ce0] %asi
	.word 0x8d6a2190  ! 2265: SDIVX_I	sdivx	%r8, 0x0190, %r6
	.word 0xf2320009  ! 2267: STH_R	sth	%r25, [%r8 + %r9]
	.word 0xcc4a0009  ! 2267: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xfc320009  ! 2269: STH_R	sth	%r30, [%r8 + %r9]
	.word 0xc4120009  ! 2269: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xc4ba1009  ! 2270: STDA_R	stda	%r2, [%r8 + %r9] 0x80
	.word 0xc3ea2160  ! 2271: PREFETCHA_I	prefetcha	[%r8, + 0x0160] %asi, #one_read
	.word 0xdcba2d70  ! 2272: STDA_I	stda	%r14, [%r8 + 0x0d70] %asi
	.word 0x9ba20829  ! 2273: FADDs	fadds	%f8, %f9, %f13
	.word 0xc86a245c  ! 2274: LDSTUB_I	ldstub	%r4, [%r8 + 0x045c]
	.word 0xccba2fa0  ! 2275: STDA_I	stda	%r6, [%r8 + 0x0fa0] %asi
	.word 0x8a520009  ! 2276: UMUL_R	umul 	%r8, %r9, %r5
	.word 0xc47a2734  ! 2277: SWAP_I	swap	%r2, [%r8 + 0x0734]
	.word 0xc60a0009  ! 2278: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xc36a26fc  ! 2279: PREFETCH_I	prefetch	[%r8 + 0x06fc], #one_read
	.word 0x08800001  ! 2280: BLEU	bleu  	<label_0x1>
	.word 0xf46a2540  ! 2281: LDSTUB_I	ldstub	%r26, [%r8 + 0x0540]
	.word 0xcca21009  ! 2282: STWA_R	stwa	%r6, [%r8 + %r9] 0x80
	.word 0xc4b226cc  ! 2283: STHA_I	stha	%r2, [%r8 + 0x06cc] %asi
	.word 0xc87a0009  ! 2284: SWAP_R	swap	%r4, [%r8 + %r9]
	.word 0x32800001  ! 2285: BNE	bne,a	<label_0x1>
	.word 0xc2ca2978  ! 2286: LDSBA_I	ldsba	[%r8, + 0x0978] %asi, %r1
	.word 0x8143e050  ! 2287: MEMBAR	membar	#Lookaside | #Sync 
	.word 0xc2fa1009  ! 2288: SWAPA_R	swapa	%r1, [%r8 + %r9] 0x80
	.word 0xcc2a0009  ! 2290: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xcc120009  ! 2290: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xc36a280c  ! 2291: PREFETCH_I	prefetch	[%r8 + 0x080c], #one_read
	.word 0x8143c000  ! 2292: STBAR	stbar
	.word 0xca220009  ! 2294: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xea4a0009  ! 2294: LDSB_R	ldsb	[%r8 + %r9], %r21
	.word 0x852224d0  ! 2295: MULScc_I	mulscc 	%r8, 0x04d0, %r2
	.word 0xf93a0009  ! 2297: STDF_R	std	%f28, [%r9, %r8]
	.word 0xc2720009  ! 2298: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xcc020009  ! 2298: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0x88520009  ! 2299: UMUL_R	umul 	%r8, %r9, %r4
	.word 0xc36a0009  ! 2300: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xb8522888  ! 2301: UMUL_I	umul 	%r8, 0x0888, %r28
	.word 0xe93a2838  ! 2302: STDF_I	std	%f20, [0x0838, %r8]
	.word 0xdc1a2b60  ! 2303: LDD_I	ldd	[%r8 + 0x0b60], %r14
	.word 0xcc8a28ec  ! 2304: LDUBA_I	lduba	[%r8, + 0x08ec] %asi, %r6
	.word 0xed22248c  ! 2305: STF_I	st	%f22, [0x048c, %r8]
	.word 0xaa7a2960  ! 2306: SDIV_I	sdiv 	%r8, 0x0960, %r21
	.word 0xc2120009  ! 2307: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xccba1009  ! 2308: STDA_R	stda	%r6, [%r8 + %r9] 0x80
	.word 0x8a4a0009  ! 2309: MULX_R	mulx 	%r8, %r9, %r5
	.word 0xcc320009  ! 2311: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc6520009  ! 2311: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xc3ea1009  ! 2312: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc36a2428  ! 2313: PREFETCH_I	prefetch	[%r8 + 0x0428], #one_read
	.word 0xcc5a0009  ! 2314: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xc36a2774  ! 2315: PREFETCH_I	prefetch	[%r8 + 0x0774], #one_read
	.word 0xc6a21009  ! 2316: STWA_R	stwa	%r3, [%r8 + %r9] 0x80
	.word 0x3c800001  ! 2317: BPOS	bpos,a	<label_0x1>
	.word 0x8ba20929  ! 2318: FMULs	fmuls	%f8, %f9, %f5
	.word 0xb0720009  ! 2319: UDIV_R	udiv 	%r8, %r9, %r24
	.word 0x0a800001  ! 2320: BCS	bcs  	<label_0x1>
	.word 0xc6c22830  ! 2321: LDSWA_I	ldswa	[%r8, + 0x0830] %asi, %r3
	.word 0xc89a1009  ! 2322: LDDA_R	ldda	[%r8, %r9] 0x80, %r4
	.word 0xf0ba1009  ! 2323: STDA_R	stda	%r24, [%r8 + %r9] 0x80
	.word 0x84720009  ! 2324: UDIV_R	udiv 	%r8, %r9, %r2
	.word 0x8cf20009  ! 2325: UDIVcc_R	udivcc 	%r8, %r9, %r6
	.word 0xc3ea2dc4  ! 2326: PREFETCHA_I	prefetcha	[%r8, + 0x0dc4] %asi, #one_read
	.word 0xf09a20a0  ! 2327: LDDA_I	ldda	[%r8, + 0x00a0] %asi, %r24
	.word 0x26800001  ! 2328: BL	bl,a	<label_0x1>
	.word 0xca320009  ! 2330: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xe20a0009  ! 2330: LDUB_R	ldub	[%r8 + %r9], %r17
	.word 0xc42a0009  ! 2332: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xcc020009  ! 2332: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xf73a2c68  ! 2333: STDF_I	std	%f27, [0x0c68, %r8]
	.word 0xc8aa1009  ! 2334: STBA_R	stba	%r4, [%r8 + %r9] 0x80
	.word 0x34800002  ! 2335: BG	bg,a	<label_0x2>
	.word 0xe08a2d4c  ! 2336: LDUBA_I	lduba	[%r8, + 0x0d4c] %asi, %r16
	.word 0xa87a2668  ! 2337: SDIV_I	sdiv 	%r8, 0x0668, %r20
	.word 0x2c800001  ! 2338: BNEG	bneg,a	<label_0x1>
	.word 0x1a800001  ! 2339: BCC	bcc  	<label_0x1>
	.word 0x84520009  ! 2340: UMUL_R	umul 	%r8, %r9, %r2
	.word 0xc4b227b0  ! 2341: STHA_I	stha	%r2, [%r8 + 0x07b0] %asi
	.word 0xede22009  ! 2342: CASA_R	casa	[%r8] %asi, %r9, %r22
	.word 0x18800001  ! 2343: BGU	bgu  	<label_0x1>
	.word 0xc3ea27cc  ! 2344: PREFETCHA_I	prefetcha	[%r8, + 0x07cc] %asi, #one_read
	.word 0xe0a22cbc  ! 2345: STWA_I	stwa	%r16, [%r8 + 0x0cbc] %asi
	.word 0xf882233c  ! 2346: LDUWA_I	lduwa	[%r8, + 0x033c] %asi, %r28
	.word 0x9ada0009  ! 2347: SMULcc_R	smulcc 	%r8, %r9, %r13
	.word 0xcca22850  ! 2348: STWA_I	stwa	%r6, [%r8 + 0x0850] %asi
	.word 0xc3ea25c0  ! 2349: PREFETCHA_I	prefetcha	[%r8, + 0x05c0] %asi, #one_read
	.word 0xe13a0009  ! 2351: STDF_R	std	%f16, [%r9, %r8]
	.word 0xca720009  ! 2352: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc8020009  ! 2352: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0x02800001  ! 2353: BE	be  	<label_0x1>
	.word 0x8143c000  ! 2354: STBAR	stbar
	.word 0x8143e04f  ! 2355: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #Sync 
	.word 0xc2320009  ! 2357: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xea520009  ! 2357: LDSH_R	ldsh	[%r8 + %r9], %r21
	.word 0xf06a276c  ! 2358: LDSTUB_I	ldstub	%r24, [%r8 + 0x076c]
	.word 0xe0ba1009  ! 2359: STDA_R	stda	%r16, [%r8 + %r9] 0x80
	.word 0x8b222e44  ! 2360: MULScc_I	mulscc 	%r8, 0x0e44, %r5
	.word 0x8ef22ad8  ! 2361: UDIVcc_I	udivcc 	%r8, 0x0ad8, %r7
	.word 0x8143c000  ! 2362: STBAR	stbar
	.word 0xc3ea1009  ! 2363: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xe33a0009  ! 2365: STDF_R	std	%f17, [%r9, %r8]
	.word 0xc2720009  ! 2366: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xce5a0009  ! 2366: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0x8cd22564  ! 2367: UMULcc_I	umulcc 	%r8, 0x0564, %r6
	.word 0xe6320009  ! 2369: STH_R	sth	%r19, [%r8 + %r9]
	.word 0xc6520009  ! 2369: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xced225a4  ! 2370: LDSHA_I	ldsha	[%r8, + 0x05a4] %asi, %r7
	.word 0xa12228e0  ! 2371: MULScc_I	mulscc 	%r8, 0x08e0, %r16
	.word 0xc4b225d8  ! 2372: STHA_I	stha	%r2, [%r8 + 0x05d8] %asi
	.word 0xc82a0009  ! 2374: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc91a0009  ! 2374: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xc36a275c  ! 2375: PREFETCH_I	prefetch	[%r8 + 0x075c], #one_read
	.word 0xe6020009  ! 2376: LDUW_R	lduw	[%r8 + %r9], %r19
	.word 0xf0b21009  ! 2377: STHA_R	stha	%r24, [%r8 + %r9] 0x80
	.word 0xccea25ec  ! 2378: LDSTUBA_I	ldstuba	%r6, [%r8 + 0x05ec] %asi
	.word 0x8143e00d  ! 2379: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore 
	.word 0xc5222878  ! 2380: STF_I	st	%f2, [0x0878, %r8]
	.word 0xc6220009  ! 2382: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc4120009  ! 2382: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0x8143c000  ! 2383: STBAR	stbar
	.word 0xc36a0009  ! 2384: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc2aa2e84  ! 2385: STBA_I	stba	%r1, [%r8 + 0x0e84] %asi
	.word 0xc3ea2084  ! 2386: PREFETCHA_I	prefetcha	[%r8, + 0x0084] %asi, #one_read
	.word 0xc9f22009  ! 2387: CASXA_R	casxa	[%r8]%asi, %r9, %r4
	.word 0xe87a2638  ! 2388: SWAP_I	swap	%r20, [%r8 + 0x0638]
	.word 0xc36a0009  ! 2389: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xcc220009  ! 2391: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xca420009  ! 2391: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0x8e4a0009  ! 2392: MULX_R	mulx 	%r8, %r9, %r7
	.word 0xc3ea1009  ! 2393: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xf33a0009  ! 2395: STDF_R	std	%f25, [%r9, %r8]
	.word 0xe2720009  ! 2396: STX_R	stx	%r17, [%r8 + %r9]
	.word 0xc7020009  ! 2396: LDF_R	ld	[%r8, %r9], %f3
	.word 0x845a0009  ! 2397: SMUL_R	smul 	%r8, %r9, %r2
	.word 0xc8320009  ! 2399: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xec5a0009  ! 2399: LDX_R	ldx	[%r8 + %r9], %r22
	.word 0xf44a22c4  ! 2400: LDSB_I	ldsb	[%r8 + 0x02c4], %r26
	.word 0xf0ba1009  ! 2401: STDA_R	stda	%r24, [%r8 + %r9] 0x80
	.word 0xc5220009  ! 2403: STF_R	st	%f2, [%r9, %r8]
	.word 0xc2720009  ! 2404: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc84a0009  ! 2404: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0x8143e046  ! 2405: MEMBAR	membar	#StoreLoad | #LoadStore | #Sync 
	.word 0xc2fa1009  ! 2406: SWAPA_R	swapa	%r1, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 2407: STBAR	stbar
	.word 0x96f20009  ! 2408: UDIVcc_R	udivcc 	%r8, %r9, %r11
	.word 0xa652296c  ! 2409: UMUL_I	umul 	%r8, 0x096c, %r19
	.word 0xc2a21009  ! 2410: STWA_R	stwa	%r1, [%r8 + %r9] 0x80
	.word 0xf0720009  ! 2412: STX_R	stx	%r24, [%r8 + %r9]
	.word 0xec020009  ! 2412: LDUW_R	lduw	[%r8 + %r9], %r22
	.word 0x0ac20001  ! 2413: BRNZ	brnz  ,nt	%8,<label_0x20001>
	.word 0xcaaa1009  ! 2414: STBA_R	stba	%r5, [%r8 + %r9] 0x80
	.word 0x84720009  ! 2415: UDIV_R	udiv 	%r8, %r9, %r2
	.word 0x02c20001  ! 2416: BRZ	brz  ,nt	%8,<label_0x20001>
	.word 0xe0ba1009  ! 2417: STDA_R	stda	%r16, [%r8 + %r9] 0x80
	.word 0xc4da2348  ! 2418: LDXA_I	ldxa	[%r8, + 0x0348] %asi, %r2
	.word 0xc82a0009  ! 2420: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc4420009  ! 2420: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xc922204c  ! 2421: STF_I	st	%f4, [0x004c, %r8]
	.word 0xcc520009  ! 2422: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xc42a0009  ! 2424: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xca0a0009  ! 2424: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0x8143e03e  ! 2425: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0x82522a14  ! 2426: UMUL_I	umul 	%r8, 0x0a14, %r1
	.word 0xfc2a0009  ! 2428: STB_R	stb	%r30, [%r8 + %r9]
	.word 0xe9020009  ! 2428: LDF_R	ld	[%r8, %r9], %f20
	.word 0xf45a0009  ! 2429: LDX_R	ldx	[%r8 + %r9], %r26
	.word 0x0c800001  ! 2430: BNEG	bneg  	<label_0x1>
	.word 0xe322254c  ! 2431: STF_I	st	%f17, [0x054c, %r8]
	.word 0xc2320009  ! 2433: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xdb020009  ! 2433: LDF_R	ld	[%r8, %r9], %f13
	.word 0x8ba20829  ! 2434: FADDs	fadds	%f8, %f9, %f5
	.word 0xce220009  ! 2436: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xcc0a0009  ! 2436: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xcad21009  ! 2437: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r5
	.word 0xcc2a0009  ! 2439: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xf04a0009  ! 2439: LDSB_R	ldsb	[%r8 + %r9], %r24
	.word 0xcde21009  ! 2440: CASA_I	casa	[%r8] 0x80, %r9, %r6
	.word 0xc4ba1009  ! 2441: STDA_R	stda	%r2, [%r8 + %r9] 0x80
	.word 0xe49a2b90  ! 2442: LDDA_I	ldda	[%r8, + 0x0b90] %asi, %r18
	.word 0x8143e017  ! 2443: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside 
	.word 0xc8ea1009  ! 2444: LDSTUBA_R	ldstuba	%r4, [%r8 + %r9] 0x80
	.word 0xe13a20f8  ! 2445: STDF_I	std	%f16, [0x00f8, %r8]
	.word 0xda220009  ! 2447: STW_R	stw	%r13, [%r8 + %r9]
	.word 0xe04a0009  ! 2447: LDSB_R	ldsb	[%r8 + %r9], %r16
	.word 0xca0a2eac  ! 2448: LDUB_I	ldub	[%r8 + 0x0eac], %r5
	.word 0xde6a2960  ! 2449: LDSTUB_I	ldstub	%r15, [%r8 + 0x0960]
	.word 0xff3a2588  ! 2450: STDF_I	std	%f31, [0x0588, %r8]
	.word 0xc2c21009  ! 2451: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r1
	.word 0xcca2229c  ! 2452: STWA_I	stwa	%r6, [%r8 + 0x029c] %asi
	.word 0x8143e030  ! 2453: MEMBAR	membar	#Lookaside | #MemIssue 
	.word 0x22800002  ! 2454: BE	be,a	<label_0x2>
	.word 0xc36a24a0  ! 2455: PREFETCH_I	prefetch	[%r8 + 0x04a0], #one_read
	.word 0xf8320009  ! 2457: STH_R	sth	%r28, [%r8 + %r9]
	.word 0xc40a0009  ! 2457: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xf73a0009  ! 2459: STDF_R	std	%f27, [%r9, %r8]
	.word 0xca720009  ! 2460: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xcb1a0009  ! 2460: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0x9c7a2500  ! 2461: SDIV_I	sdiv 	%r8, 0x0500, %r14
	.word 0xceda1009  ! 2462: LDXA_R	ldxa	[%r8, %r9] 0x80, %r7
	.word 0x8143e029  ! 2463: MEMBAR	membar	#LoadLoad | #StoreStore | #MemIssue 
	.word 0xcea21009  ! 2464: STWA_R	stwa	%r7, [%r8 + %r9] 0x80
	.word 0xcf222cf8  ! 2465: STF_I	st	%f7, [0x0cf8, %r8]
	.word 0x8143e02a  ! 2466: MEMBAR	membar	#StoreLoad | #StoreStore | #MemIssue 
	.word 0xce320009  ! 2468: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc20a0009  ! 2468: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xfe5a0009  ! 2469: LDX_R	ldx	[%r8 + %r9], %r31
	.word 0xc42a0009  ! 2471: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc6120009  ! 2471: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0x83222e84  ! 2472: MULScc_I	mulscc 	%r8, 0x0e84, %r1
	.word 0x14800001  ! 2473: BG	bg  	<label_0x1>
	.word 0xc3ea1009  ! 2474: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc87a204c  ! 2475: SWAP_I	swap	%r4, [%r8 + 0x004c]
	.word 0x8a5a2698  ! 2476: SMUL_I	smul 	%r8, 0x0698, %r5
	.word 0xa56a2684  ! 2477: SDIVX_I	sdivx	%r8, 0x0684, %r18
	.word 0xf8320009  ! 2479: STH_R	sth	%r28, [%r8 + %r9]
	.word 0xca020009  ! 2479: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xee2a0009  ! 2481: STB_R	stb	%r23, [%r8 + %r9]
	.word 0xc81a0009  ! 2481: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xc3ea1009  ! 2482: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc36a23c0  ! 2483: PREFETCH_I	prefetch	[%r8 + 0x03c0], #one_read
	.word 0xe2220009  ! 2485: STW_R	stw	%r17, [%r8 + %r9]
	.word 0xc41a0009  ! 2485: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x8cda0009  ! 2486: SMULcc_R	smulcc 	%r8, %r9, %r6
	.word 0xf82a0009  ! 2488: STB_R	stb	%r28, [%r8 + %r9]
	.word 0xee020009  ! 2488: LDUW_R	lduw	[%r8 + %r9], %r23
	.word 0xcc220009  ! 2490: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc4120009  ! 2490: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xc3ea2304  ! 2491: PREFETCHA_I	prefetcha	[%r8, + 0x0304] %asi, #one_read
	.word 0xc8422e40  ! 2492: LDSW_I	ldsw	[%r8 + 0x0e40], %r4
	.word 0xd85a0009  ! 2493: LDX_R	ldx	[%r8 + %r9], %r12
	.word 0xf8720009  ! 2495: STX_R	stx	%r28, [%r8 + %r9]
	.word 0xde520009  ! 2495: LDSH_R	ldsh	[%r8 + %r9], %r15
	.word 0xc3ea1009  ! 2496: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x8143e065  ! 2497: MEMBAR	membar	#LoadLoad | #LoadStore | #MemIssue | #Sync 
	.word 0xc2220009  ! 2499: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xfd1a0009  ! 2499: LDDF_R	ldd	[%r8, %r9], %f30
	.word 0xc3ea1009  ! 2500: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xec921009  ! 2501: LDUHA_R	lduha	[%r8, %r9] 0x80, %r22
	.word 0xc36a2530  ! 2502: PREFETCH_I	prefetch	[%r8 + 0x0530], #one_read
	.word 0x9cf20009  ! 2503: UDIVcc_R	udivcc 	%r8, %r9, %r14
	.word 0x26c20001  ! 2504: BRLZ	brlz,a,nt	%8,<label_0x20001>
	.word 0x8cfa26fc  ! 2505: SDIVcc_I	sdivcc 	%r8, 0x06fc, %r6
	.word 0xcf3a0009  ! 2507: STDF_R	std	%f7, [%r9, %r8]
	.word 0xf8720009  ! 2508: STX_R	stx	%r28, [%r8 + %r9]
	.word 0xe80a0009  ! 2508: LDUB_R	ldub	[%r8 + %r9], %r20
	.word 0xc36a2c10  ! 2509: PREFETCH_I	prefetch	[%r8 + 0x0c10], #one_read
	.word 0xc8ea27a8  ! 2510: LDSTUBA_I	ldstuba	%r4, [%r8 + 0x07a8] %asi
	.word 0x847a0009  ! 2511: SDIV_R	sdiv 	%r8, %r9, %r2
	.word 0xc73a0009  ! 2513: STDF_R	std	%f3, [%r9, %r8]
	.word 0xf8720009  ! 2514: STX_R	stx	%r28, [%r8 + %r9]
	.word 0xc2120009  ! 2514: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xc4a22718  ! 2515: STWA_I	stwa	%r2, [%r8 + 0x0718] %asi
	.word 0xcbf21009  ! 2516: CASXA_I	casxa	[%r8] 0x80, %r9, %r5
	.word 0x8143e06a  ! 2517: MEMBAR	membar	#StoreLoad | #StoreStore | #MemIssue | #Sync 
	.word 0xccb22df0  ! 2518: STHA_I	stha	%r6, [%r8 + 0x0df0] %asi
	.word 0x864a0009  ! 2519: MULX_R	mulx 	%r8, %r9, %r3
	.word 0xef220009  ! 2521: STF_R	st	%f23, [%r9, %r8]
	.word 0xc8720009  ! 2522: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc2120009  ! 2522: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xe81a0009  ! 2523: LDD_R	ldd	[%r8 + %r9], %r20
	.word 0xce220009  ! 2525: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xe4120009  ! 2525: LDUH_R	lduh	[%r8 + %r9], %r18
	.word 0xfa921009  ! 2526: LDUHA_R	lduha	[%r8, %r9] 0x80, %r29
	.word 0x8143c000  ! 2527: STBAR	stbar
	.word 0xc3ea27c0  ! 2528: PREFETCHA_I	prefetcha	[%r8, + 0x07c0] %asi, #one_read
	.word 0xcaca1009  ! 2529: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r5
	.word 0xbba209a9  ! 2530: FDIVs	fdivs	%f8, %f9, %f29
	.word 0xceb22e80  ! 2531: STHA_I	stha	%r7, [%r8 + 0x0e80] %asi
	.word 0xdd220009  ! 2533: STF_R	st	%f14, [%r9, %r8]
	.word 0xc4720009  ! 2534: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc25a0009  ! 2534: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xf6a22890  ! 2535: STWA_I	stwa	%r27, [%r8 + 0x0890] %asi
	.word 0xca8a1009  ! 2536: LDUBA_R	lduba	[%r8, %r9] 0x80, %r5
	.word 0xd6220009  ! 2538: STW_R	stw	%r11, [%r8 + %r9]
	.word 0xc80a0009  ! 2538: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xdf220009  ! 2540: STF_R	st	%f15, [%r9, %r8]
	.word 0xca720009  ! 2541: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xca4a0009  ! 2541: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0x8c4a0009  ! 2542: MULX_R	mulx 	%r8, %r9, %r6
	.word 0xee220009  ! 2544: STW_R	stw	%r23, [%r8 + %r9]
	.word 0xfc020009  ! 2544: LDUW_R	lduw	[%r8 + %r9], %r30
	.word 0x04ca0001  ! 2545: BRLEZ	brlez  ,pt	%8,<label_0xa0001>
	.word 0xc36a2214  ! 2546: PREFETCH_I	prefetch	[%r8 + 0x0214], #one_read
	.word 0xcaea1009  ! 2547: LDSTUBA_R	ldstuba	%r5, [%r8 + %r9] 0x80
	.word 0x846a0009  ! 2548: UDIVX_R	udivx 	%r8, %r9, %r2
	.word 0x2aca0001  ! 2549: BRNZ	brnz,a,pt	%8,<label_0xa0001>
	.word 0xb87a0009  ! 2550: SDIV_R	sdiv 	%r8, %r9, %r28
	.word 0xc5222f14  ! 2551: STF_I	st	%f2, [0x0f14, %r8]
	.word 0x8143c000  ! 2552: STBAR	stbar
	.word 0x8143e01d  ! 2553: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside 
	.word 0xc93a0009  ! 2555: STDF_R	std	%f4, [%r9, %r8]
	.word 0xce720009  ! 2556: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xfa0a0009  ! 2556: LDUB_R	ldub	[%r8 + %r9], %r29
	.word 0x86fa0009  ! 2557: SDIVcc_R	sdivcc 	%r8, %r9, %r3
	.word 0xc27a0009  ! 2558: SWAP_R	swap	%r1, [%r8 + %r9]
	.word 0xc4f22608  ! 2559: STXA_I	stxa	%r2, [%r8 + 0x0608] %asi
	.word 0xd6220009  ! 2561: STW_R	stw	%r11, [%r8 + %r9]
	.word 0xc65a0009  ! 2561: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xdc8a1009  ! 2562: LDUBA_R	lduba	[%r8, %r9] 0x80, %r14
	.word 0x8143e050  ! 2563: MEMBAR	membar	#Lookaside | #Sync 
	.word 0x84d22d14  ! 2564: UMULcc_I	umulcc 	%r8, 0x0d14, %r2
	.word 0xb9220009  ! 2565: MULScc_R	mulscc 	%r8, %r9, %r28
	.word 0xe01a2690  ! 2566: LDD_I	ldd	[%r8 + 0x0690], %r16
	.word 0x24c20001  ! 2567: BRLEZ	brlez,a,nt	%8,<label_0x20001>
	.word 0xae5a0009  ! 2568: SMUL_R	smul 	%r8, %r9, %r23
	.word 0x8fa209a9  ! 2569: FDIVs	fdivs	%f8, %f9, %f7
	.word 0xc3ea1009  ! 2570: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x85220009  ! 2571: MULScc_R	mulscc 	%r8, %r9, %r2
	.word 0xc36a0009  ! 2572: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0x04c20001  ! 2573: BRLEZ	brlez  ,nt	%8,<label_0x20001>
	.word 0xcd220009  ! 2575: STF_R	st	%f6, [%r9, %r8]
	.word 0xce720009  ! 2576: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xcc1a0009  ! 2576: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xceea1009  ! 2577: LDSTUBA_R	ldstuba	%r7, [%r8 + %r9] 0x80
	.word 0x3a800001  ! 2578: BCC	bcc,a	<label_0x1>
	.word 0x827a0009  ! 2579: SDIV_R	sdiv 	%r8, %r9, %r1
	.word 0xf8320009  ! 2581: STH_R	sth	%r28, [%r8 + %r9]
	.word 0xca520009  ! 2581: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xe20a20fc  ! 2582: LDUB_I	ldub	[%r8 + 0x00fc], %r17
	.word 0x2cca0001  ! 2583: BRGZ	brgz,a,pt	%8,<label_0xa0001>
	.word 0xc8fa1009  ! 2584: SWAPA_R	swapa	%r4, [%r8 + %r9] 0x80
	.word 0xc4c21009  ! 2585: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r2
	.word 0xd85a0009  ! 2586: LDX_R	ldx	[%r8 + %r9], %r12
	.word 0x96f20009  ! 2587: UDIVcc_R	udivcc 	%r8, %r9, %r11
	.word 0xcca22ff0  ! 2588: STWA_I	stwa	%r6, [%r8 + 0x0ff0] %asi
	.word 0xb45a0009  ! 2589: SMUL_R	smul 	%r8, %r9, %r26
	.word 0xce921009  ! 2590: LDUHA_R	lduha	[%r8, %r9] 0x80, %r7
	.word 0xfa220009  ! 2592: STW_R	stw	%r29, [%r8 + %r9]
	.word 0xce420009  ! 2592: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xc2320009  ! 2594: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc5020009  ! 2594: LDF_R	ld	[%r8, %r9], %f2
	.word 0xb76a0009  ! 2595: SDIVX_R	sdivx	%r8, %r9, %r27
	.word 0x85220009  ! 2596: MULScc_R	mulscc 	%r8, %r9, %r2
	.word 0xc3ea1009  ! 2597: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc9e21009  ! 2598: CASA_I	casa	[%r8] 0x80, %r9, %r4
	.word 0xcff21009  ! 2599: CASXA_I	casxa	[%r8] 0x80, %r9, %r7
	.word 0xceb21009  ! 2600: STHA_R	stha	%r7, [%r8 + %r9] 0x80
	.word 0xe68a2bb4  ! 2601: LDUBA_I	lduba	[%r8, + 0x0bb4] %asi, %r19
	.word 0x00800001  ! 2602: BN	bn  	<label_0x1>
	.word 0xc2220009  ! 2604: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xcc420009  ! 2604: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xcea2289c  ! 2605: STWA_I	stwa	%r7, [%r8 + 0x089c] %asi
	.word 0x3e800002  ! 2606: BVC	bvc,a	<label_0x2>
	.word 0xc2720009  ! 2608: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xca020009  ! 2608: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0x2aca0001  ! 2609: BRNZ	brnz,a,pt	%8,<label_0xa0001>
	.word 0x18800001  ! 2610: BGU	bgu  	<label_0x1>
	.word 0x8143e019  ! 2611: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside 
	.word 0xa0da0009  ! 2612: SMULcc_R	smulcc 	%r8, %r9, %r16
	.word 0xde0a2458  ! 2613: LDUB_I	ldub	[%r8 + 0x0458], %r15
	.word 0xcf220009  ! 2615: STF_R	st	%f7, [%r9, %r8]
	.word 0xf0720009  ! 2616: STX_R	stx	%r24, [%r8 + %r9]
	.word 0xf00a0009  ! 2616: LDUB_R	ldub	[%r8 + %r9], %r24
	.word 0xdb3a20a8  ! 2617: STDF_I	std	%f13, [0x00a8, %r8]
	.word 0x8143e02f  ! 2618: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #MemIssue 
	.word 0x84520009  ! 2619: UMUL_R	umul 	%r8, %r9, %r2
	.word 0xc8220009  ! 2621: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xce5a0009  ! 2621: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xc4320009  ! 2623: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xd8420009  ! 2623: LDSW_R	ldsw	[%r8 + %r9], %r12
	.word 0x88720009  ! 2624: UDIV_R	udiv 	%r8, %r9, %r4
	.word 0x8143e001  ! 2625: MEMBAR	membar	#LoadLoad 
	.word 0xdeca1009  ! 2626: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r15
	.word 0xf2320009  ! 2628: STH_R	sth	%r25, [%r8 + %r9]
	.word 0xc44a0009  ! 2628: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0x8c4a0009  ! 2629: MULX_R	mulx 	%r8, %r9, %r6
	.word 0x10800001  ! 2630: BA	ba  	<label_0x1>
	.word 0x8143c000  ! 2631: STBAR	stbar
	.word 0xceea21a4  ! 2632: LDSTUBA_I	ldstuba	%r7, [%r8 + 0x01a4] %asi
	.word 0xee020009  ! 2633: LDUW_R	lduw	[%r8 + %r9], %r23
	.word 0x8143c000  ! 2634: STBAR	stbar
	.word 0xcd220009  ! 2636: STF_R	st	%f6, [%r9, %r8]
	.word 0xc8720009  ! 2637: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc3020009  ! 2637: LDF_R	ld	[%r8, %r9], %f1
	.word 0xc2b21009  ! 2638: STHA_R	stha	%r1, [%r8 + %r9] 0x80
	.word 0xc4f21009  ! 2639: STXA_R	stxa	%r2, [%r8 + %r9] 0x80
	.word 0xf2220009  ! 2641: STW_R	stw	%r25, [%r8 + %r9]
	.word 0xca520009  ! 2641: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xc9220009  ! 2643: STF_R	st	%f4, [%r9, %r8]
	.word 0xf8720009  ! 2644: STX_R	stx	%r28, [%r8 + %r9]
	.word 0xc2120009  ! 2644: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xc36a2bf4  ! 2645: PREFETCH_I	prefetch	[%r8 + 0x0bf4], #one_read
	.word 0xcff22009  ! 2646: CASXA_R	casxa	[%r8]%asi, %r9, %r7
	.word 0x99a209a9  ! 2647: FDIVs	fdivs	%f8, %f9, %f12
	.word 0xfe220009  ! 2649: STW_R	stw	%r31, [%r8 + %r9]
	.word 0xca520009  ! 2649: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xdc220009  ! 2651: STW_R	stw	%r14, [%r8 + %r9]
	.word 0xcf1a0009  ! 2651: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xc8b21009  ! 2652: STHA_R	stha	%r4, [%r8 + %r9] 0x80
	.word 0x8e5a2840  ! 2653: SMUL_I	smul 	%r8, 0x0840, %r7
	.word 0xcc0a0009  ! 2654: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0x04800001  ! 2655: BLE	ble  	<label_0x1>
	.word 0x8c4a269c  ! 2656: MULX_I	mulx 	%r8, 0x069c, %r6
	.word 0xc3ea1009  ! 2657: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc3ea27a4  ! 2658: PREFETCHA_I	prefetcha	[%r8, + 0x07a4] %asi, #one_read
	.word 0xcc7a20c4  ! 2659: SWAP_I	swap	%r6, [%r8 + 0x00c4]
	.word 0xc2520009  ! 2660: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xc4922ec4  ! 2661: LDUHA_I	lduha	[%r8, + 0x0ec4] %asi, %r2
	.word 0x8143c000  ! 2662: STBAR	stbar
	.word 0xc3ea24d4  ! 2663: PREFETCHA_I	prefetcha	[%r8, + 0x04d4] %asi, #one_read
	.word 0xc89a2550  ! 2664: LDDA_I	ldda	[%r8, + 0x0550] %asi, %r4
	.word 0xc3ea1009  ! 2665: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc36a2d6c  ! 2666: PREFETCH_I	prefetch	[%r8 + 0x0d6c], #one_read
	.word 0xcff21009  ! 2667: CASXA_I	casxa	[%r8] 0x80, %r9, %r7
	.word 0x0e800002  ! 2668: BVS	bvs  	<label_0x2>
	.word 0xf2ea2ea0  ! 2669: LDSTUBA_I	ldstuba	%r25, [%r8 + 0x0ea0] %asi
	.word 0xc36a24c8  ! 2670: PREFETCH_I	prefetch	[%r8 + 0x04c8], #one_read
	.word 0xc4da2830  ! 2671: LDXA_I	ldxa	[%r8, + 0x0830] %asi, %r2
	.word 0xc85a2680  ! 2672: LDX_I	ldx	[%r8 + 0x0680], %r4
	.word 0x12800001  ! 2673: BNE	bne  	<label_0x1>
	.word 0xce220009  ! 2675: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc6420009  ! 2675: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0x87a20929  ! 2676: FMULs	fmuls	%f8, %f9, %f3
	.word 0xc36a0009  ! 2677: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc36a0009  ! 2678: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xec720009  ! 2680: STX_R	stx	%r22, [%r8 + %r9]
	.word 0xc64a0009  ! 2680: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xe41a2640  ! 2681: LDD_I	ldd	[%r8 + 0x0640], %r18
	.word 0xcad21009  ! 2682: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r5
	.word 0xc93a26b8  ! 2683: STDF_I	std	%f4, [0x06b8, %r8]
	.word 0x02800002  ! 2684: BE	be  	<label_0x2>
	.word 0xce6a0009  ! 2685: LDSTUB_R	ldstub	%r7, [%r8 + %r9]
	.word 0xcc2a0009  ! 2687: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xda120009  ! 2687: LDUH_R	lduh	[%r8 + %r9], %r13
	.word 0xc8220009  ! 2689: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xe1020009  ! 2689: LDF_R	ld	[%r8, %r9], %f16
	.word 0xfb222e68  ! 2690: STF_I	st	%f29, [0x0e68, %r8]
	.word 0x20800001  ! 2691: BN	bn,a	<label_0x1>
	.word 0xc3ea2eb4  ! 2692: PREFETCHA_I	prefetcha	[%r8, + 0x0eb4] %asi, #one_read
	.word 0x9eda2c14  ! 2693: SMULcc_I	smulcc 	%r8, 0x0c14, %r15
	.word 0xca2a0009  ! 2695: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xcc5a0009  ! 2695: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xce220009  ! 2697: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xf8420009  ! 2697: LDSW_R	ldsw	[%r8 + %r9], %r28
	.word 0xc87a2540  ! 2698: SWAP_I	swap	%r4, [%r8 + 0x0540]
	.word 0x8ba20929  ! 2699: FMULs	fmuls	%f8, %f9, %f5
	.word 0xc26a0009  ! 2700: LDSTUB_R	ldstub	%r1, [%r8 + %r9]
	.word 0xceca1009  ! 2701: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r7
	.word 0xea220009  ! 2703: STW_R	stw	%r21, [%r8 + %r9]
	.word 0xda520009  ! 2703: LDSH_R	ldsh	[%r8 + %r9], %r13
	.word 0xc36a2210  ! 2704: PREFETCH_I	prefetch	[%r8 + 0x0210], #one_read
	.word 0xf87a0009  ! 2705: SWAP_R	swap	%r28, [%r8 + %r9]
	.word 0x30800001  ! 2706: BA	ba,a	<label_0x1>
	.word 0xc36a2a34  ! 2707: PREFETCH_I	prefetch	[%r8 + 0x0a34], #one_read
	.word 0xd8220009  ! 2709: STW_R	stw	%r12, [%r8 + %r9]
	.word 0xc41a0009  ! 2709: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x856a2594  ! 2710: SDIVX_I	sdivx	%r8, 0x0594, %r2
	.word 0x8143c000  ! 2711: STBAR	stbar
	.word 0xc33a2678  ! 2712: STDF_I	std	%f1, [0x0678, %r8]
	.word 0xceaa1009  ! 2713: STBA_R	stba	%r7, [%r8 + %r9] 0x80
	.word 0xc36a2f4c  ! 2714: PREFETCH_I	prefetch	[%r8 + 0x0f4c], #one_read
	.word 0xc60a2bdc  ! 2715: LDUB_I	ldub	[%r8 + 0x0bdc], %r3
	.word 0x84d20009  ! 2716: UMULcc_R	umulcc 	%r8, %r9, %r2
	.word 0xee4223c4  ! 2717: LDSW_I	ldsw	[%r8 + 0x03c4], %r23
	.word 0xc3ea2048  ! 2718: PREFETCHA_I	prefetcha	[%r8, + 0x0048] %asi, #one_read
	.word 0xdc320009  ! 2720: STH_R	sth	%r14, [%r8 + %r9]
	.word 0xf01a0009  ! 2720: LDD_R	ldd	[%r8 + %r9], %r24
	.word 0xcc020009  ! 2721: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0x8ba208a9  ! 2722: FSUBs	fsubs	%f8, %f9, %f5
	.word 0x8143c000  ! 2723: STBAR	stbar
	.word 0x8143c000  ! 2724: STBAR	stbar
	.word 0x8143c000  ! 2725: STBAR	stbar
	.word 0xe0f22b58  ! 2726: STXA_I	stxa	%r16, [%r8 + 0x0b58] %asi
	.word 0x82720009  ! 2727: UDIV_R	udiv 	%r8, %r9, %r1
	.word 0x885a0009  ! 2728: SMUL_R	smul 	%r8, %r9, %r4
	.word 0xc7222cf4  ! 2729: STF_I	st	%f3, [0x0cf4, %r8]
	.word 0x8c5a0009  ! 2730: SMUL_R	smul 	%r8, %r9, %r6
	.word 0xcef21009  ! 2731: STXA_R	stxa	%r7, [%r8 + %r9] 0x80
	.word 0xf7022024  ! 2732: LDF_I	ld	[%r8, 0x0024], %f27
	.word 0xc3ea1009  ! 2733: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x32800001  ! 2734: BNE	bne,a	<label_0x1>
	.word 0xccc21009  ! 2735: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r6
	.word 0xcc1a2a80  ! 2736: LDD_I	ldd	[%r8 + 0x0a80], %r6
	.word 0xc4c224ac  ! 2737: LDSWA_I	ldswa	[%r8, + 0x04ac] %asi, %r2
	.word 0xcc4a0009  ! 2738: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xe0020009  ! 2739: LDUW_R	lduw	[%r8 + %r9], %r16
	.word 0x00800001  ! 2740: BN	bn  	<label_0x1>
	.word 0xd8ea2e30  ! 2741: LDSTUBA_I	ldstuba	%r12, [%r8 + 0x0e30] %asi
	.word 0xcb3a24f0  ! 2742: STDF_I	std	%f5, [0x04f0, %r8]
	.word 0xdc4a2190  ! 2743: LDSB_I	ldsb	[%r8 + 0x0190], %r14
	.word 0xf6aa2c5c  ! 2744: STBA_I	stba	%r27, [%r8 + 0x0c5c] %asi
	.word 0xfe520009  ! 2745: LDSH_R	ldsh	[%r8 + %r9], %r31
	.word 0xc7222530  ! 2746: STF_I	st	%f3, [0x0530, %r8]
	.word 0xce821009  ! 2747: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r7
	.word 0xcac22d4c  ! 2748: LDSWA_I	ldswa	[%r8, + 0x0d4c] %asi, %r5
	.word 0x0c800001  ! 2749: BNEG	bneg  	<label_0x1>
	.word 0xccfa2cb8  ! 2750: SWAPA_I	swapa	%r6, [%r8 + 0x0cb8] %asi
	.word 0xc36a0009  ! 2751: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xca320009  ! 2753: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xcc120009  ! 2753: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xc2320009  ! 2755: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xce4a0009  ! 2755: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xc36a0009  ! 2756: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc8220009  ! 2758: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xcc0a0009  ! 2758: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xc36a2d28  ! 2759: PREFETCH_I	prefetch	[%r8 + 0x0d28], #one_read
	.word 0x8fa20829  ! 2760: FADDs	fadds	%f8, %f9, %f7
	.word 0x866a2b00  ! 2761: UDIVX_I	udivx 	%r8, 0x0b00, %r3
	.word 0xe6c21009  ! 2762: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r19
	.word 0xc3ea216c  ! 2763: PREFETCHA_I	prefetcha	[%r8, + 0x016c] %asi, #one_read
	.word 0xc8c22af4  ! 2764: LDSWA_I	ldswa	[%r8, + 0x0af4] %asi, %r4
	.word 0xc3ea2314  ! 2765: PREFETCHA_I	prefetcha	[%r8, + 0x0314] %asi, #one_read
	.word 0x8143e07b  ! 2766: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xc8ba1009  ! 2767: STDA_R	stda	%r4, [%r8 + %r9] 0x80
	.word 0xc40226d4  ! 2768: LDUW_I	lduw	[%r8 + 0x06d4], %r2
	.word 0x9ba20929  ! 2769: FMULs	fmuls	%f8, %f9, %f13
	.word 0x8143c000  ! 2770: STBAR	stbar
	.word 0xca120009  ! 2771: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xad220009  ! 2772: MULScc_R	mulscc 	%r8, %r9, %r22
	.word 0xc0ba2e60  ! 2773: STDA_I	stda	%r0, [%r8 + 0x0e60] %asi
	.word 0xc42a0009  ! 2775: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xe40a0009  ! 2775: LDUB_R	ldub	[%r8 + %r9], %r18
	.word 0x8a720009  ! 2776: UDIV_R	udiv 	%r8, %r9, %r5
	.word 0xaa7a2520  ! 2777: SDIV_I	sdiv 	%r8, 0x0520, %r21
	.word 0xf2ea1009  ! 2778: LDSTUBA_R	ldstuba	%r25, [%r8 + %r9] 0x80
	.word 0xb5a209a9  ! 2779: FDIVs	fdivs	%f8, %f9, %f26
	.word 0xfb3a0009  ! 2781: STDF_R	std	%f29, [%r9, %r8]
	.word 0xe0720009  ! 2782: STX_R	stx	%r16, [%r8 + %r9]
	.word 0xc25a0009  ! 2782: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xecba1009  ! 2783: STDA_R	stda	%r22, [%r8 + %r9] 0x80
	.word 0xf0fa28c8  ! 2784: SWAPA_I	swapa	%r24, [%r8 + 0x08c8] %asi
	.word 0x24800001  ! 2785: BLE	ble,a	<label_0x1>
	.word 0x8143c000  ! 2786: STBAR	stbar
	.word 0xc36a29b4  ! 2787: PREFETCH_I	prefetch	[%r8 + 0x09b4], #one_read
	.word 0xd6b228b4  ! 2788: STHA_I	stha	%r11, [%r8 + 0x08b4] %asi
	.word 0x976a2490  ! 2789: SDIVX_I	sdivx	%r8, 0x0490, %r11
	.word 0x85a20829  ! 2790: FADDs	fadds	%f8, %f9, %f2
	.word 0x8143c000  ! 2791: STBAR	stbar
	.word 0xfe2a0009  ! 2793: STB_R	stb	%r31, [%r8 + %r9]
	.word 0xc8520009  ! 2793: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0x8f2228d4  ! 2794: MULScc_I	mulscc 	%r8, 0x08d4, %r7
	.word 0xc2ea1009  ! 2795: LDSTUBA_R	ldstuba	%r1, [%r8 + %r9] 0x80
	.word 0xb04a239c  ! 2796: MULX_I	mulx 	%r8, 0x039c, %r24
	.word 0xc4ba2030  ! 2797: STDA_I	stda	%r2, [%r8 + 0x0030] %asi
	.word 0xc36a2c28  ! 2798: PREFETCH_I	prefetch	[%r8 + 0x0c28], #one_read
	.word 0xc9e22009  ! 2799: CASA_R	casa	[%r8] %asi, %r9, %r4
	.word 0xf2da2388  ! 2800: LDXA_I	ldxa	[%r8, + 0x0388] %asi, %r25
	.word 0xc212266c  ! 2801: LDUH_I	lduh	[%r8 + 0x066c], %r1
	.word 0xc4aa26b0  ! 2802: STBA_I	stba	%r2, [%r8 + 0x06b0] %asi
	.word 0xcc2a0009  ! 2804: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xda020009  ! 2804: LDUW_R	lduw	[%r8 + %r9], %r13
	.word 0x0eca0001  ! 2805: BRGEZ	brgez  ,pt	%8,<label_0xa0001>
	.word 0x0c800001  ! 2806: BNEG	bneg  	<label_0x1>
	.word 0xcec22180  ! 2807: LDSWA_I	ldswa	[%r8, + 0x0180] %asi, %r7
	.word 0x22800002  ! 2808: BE	be,a	<label_0x2>
	.word 0xc36a28b0  ! 2809: PREFETCH_I	prefetch	[%r8 + 0x08b0], #one_read
	.word 0xc3ea2838  ! 2810: PREFETCHA_I	prefetcha	[%r8, + 0x0838] %asi, #one_read
	.word 0x8eda0009  ! 2811: SMULcc_R	smulcc 	%r8, %r9, %r7
	.word 0xc36a2da0  ! 2812: PREFETCH_I	prefetch	[%r8 + 0x0da0], #one_read
	.word 0x24ca0001  ! 2813: BRLEZ	brlez,a,pt	%8,<label_0xa0001>
	.word 0x8143e019  ! 2814: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside 
	.word 0x8efa0009  ! 2815: SDIVcc_R	sdivcc 	%r8, %r9, %r7
	.word 0xf8220009  ! 2817: STW_R	stw	%r28, [%r8 + %r9]
	.word 0xcf020009  ! 2817: LDF_R	ld	[%r8, %r9], %f7
	.word 0x18800001  ! 2818: BGU	bgu  	<label_0x1>
	.word 0xc8ba1009  ! 2819: STDA_R	stda	%r4, [%r8 + %r9] 0x80
	.word 0xfa4221f4  ! 2820: LDSW_I	ldsw	[%r8 + 0x01f4], %r29
	.word 0xaaf22a6c  ! 2821: UDIVcc_I	udivcc 	%r8, 0x0a6c, %r21
	.word 0x22ca0001  ! 2822: BRZ	brz,a,pt	%8,<label_0xa0001>
	.word 0xc82a0009  ! 2824: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xca4a0009  ! 2824: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xcb3a0009  ! 2826: STDF_R	std	%f5, [%r9, %r8]
	.word 0xf0720009  ! 2827: STX_R	stx	%r24, [%r8 + %r9]
	.word 0xfa020009  ! 2827: LDUW_R	lduw	[%r8 + %r9], %r29
	.word 0xc4aa27a8  ! 2828: STBA_I	stba	%r2, [%r8 + 0x07a8] %asi
	.word 0xcf3a2228  ! 2829: STDF_I	std	%f7, [0x0228, %r8]
	.word 0xc25a2030  ! 2830: LDX_I	ldx	[%r8 + 0x0030], %r1
	.word 0xc44a255c  ! 2831: LDSB_I	ldsb	[%r8 + 0x055c], %r2
	.word 0xc7e22009  ! 2832: CASA_R	casa	[%r8] %asi, %r9, %r3
	.word 0x8a4a26ac  ! 2833: MULX_I	mulx 	%r8, 0x06ac, %r5
	.word 0xc67a0009  ! 2834: SWAP_R	swap	%r3, [%r8 + %r9]
	.word 0xc33a0009  ! 2836: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc4720009  ! 2837: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xcf020009  ! 2837: LDF_R	ld	[%r8, %r9], %f7
	.word 0x88f20009  ! 2838: UDIVcc_R	udivcc 	%r8, %r9, %r4
	.word 0xc9f21009  ! 2839: CASXA_I	casxa	[%r8] 0x80, %r9, %r4
	.word 0xc4f22528  ! 2840: STXA_I	stxa	%r2, [%r8 + 0x0528] %asi
	.word 0xc73a2ef0  ! 2841: STDF_I	std	%f3, [0x0ef0, %r8]
	.word 0xf6520009  ! 2842: LDSH_R	ldsh	[%r8 + %r9], %r27
	.word 0xc2f22128  ! 2843: STXA_I	stxa	%r1, [%r8 + 0x0128] %asi
	.word 0xc3ea2270  ! 2844: PREFETCHA_I	prefetcha	[%r8, + 0x0270] %asi, #one_read
	.word 0xca4a0009  ! 2845: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xf25a2298  ! 2846: LDX_I	ldx	[%r8 + 0x0298], %r25
	.word 0xcc320009  ! 2848: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc65a0009  ! 2848: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0x8143c000  ! 2849: STBAR	stbar
	.word 0xcec21009  ! 2850: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r7
	.word 0xc93a0009  ! 2852: STDF_R	std	%f4, [%r9, %r8]
	.word 0xc8720009  ! 2853: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xd8120009  ! 2853: LDUH_R	lduh	[%r8 + %r9], %r12
	.word 0xde5a2f58  ! 2854: LDX_I	ldx	[%r8 + 0x0f58], %r15
	.word 0x83a20829  ! 2855: FADDs	fadds	%f8, %f9, %f1
	.word 0xc8220009  ! 2857: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xcc520009  ! 2857: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xdf220009  ! 2859: STF_R	st	%f15, [%r9, %r8]
	.word 0xc8720009  ! 2860: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xca0a0009  ! 2860: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xc8822ac0  ! 2861: LDUWA_I	lduwa	[%r8, + 0x0ac0] %asi, %r4
	.word 0xb32223f0  ! 2862: MULScc_I	mulscc 	%r8, 0x03f0, %r25
	.word 0xcc2a0009  ! 2864: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc31a0009  ! 2864: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0x40000002  ! 2865: CALL	call	disp30_2
	.word 0xc2220009  ! 2867: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xe05a0009  ! 2867: LDX_R	ldx	[%r8 + %r9], %r16
	.word 0xc80a0009  ! 2868: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xcaea1009  ! 2869: LDSTUBA_R	ldstuba	%r5, [%r8 + %r9] 0x80
	.word 0xc36a20ac  ! 2870: PREFETCH_I	prefetch	[%r8 + 0x00ac], #one_read
	.word 0x8c7a2a6c  ! 2871: SDIV_I	sdiv 	%r8, 0x0a6c, %r6
	.word 0x85220009  ! 2872: MULScc_R	mulscc 	%r8, %r9, %r2
	.word 0x8143e00c  ! 2873: MEMBAR	membar	#LoadStore | #StoreStore 
	.word 0x8a520009  ! 2874: UMUL_R	umul 	%r8, %r9, %r5
	.word 0xde220009  ! 2876: STW_R	stw	%r15, [%r8 + %r9]
	.word 0xd84a0009  ! 2876: LDSB_R	ldsb	[%r8 + %r9], %r12
	.word 0x8fa208a9  ! 2877: FSUBs	fsubs	%f8, %f9, %f7
	.word 0xbe5a2388  ! 2878: SMUL_I	smul 	%r8, 0x0388, %r31
	.word 0xccd21009  ! 2879: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r6
	.word 0xce8a2bec  ! 2880: LDUBA_I	lduba	[%r8, + 0x0bec] %asi, %r7
	.word 0x9e7a2044  ! 2881: SDIV_I	sdiv 	%r8, 0x0044, %r15
	.word 0x87a209a9  ! 2882: FDIVs	fdivs	%f8, %f9, %f3
	.word 0xcefa1009  ! 2883: SWAPA_R	swapa	%r7, [%r8 + %r9] 0x80
	.word 0xcec22038  ! 2884: LDSWA_I	ldswa	[%r8, + 0x0038] %asi, %r7
	.word 0x0eca0001  ! 2885: BRGEZ	brgez  ,pt	%8,<label_0xa0001>
	.word 0x8143e05a  ! 2886: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside | #Sync 
	.word 0xe26a21d8  ! 2887: LDSTUB_I	ldstub	%r17, [%r8 + 0x01d8]
	.word 0xceda2a50  ! 2888: LDXA_I	ldxa	[%r8, + 0x0a50] %asi, %r7
	.word 0x0ec20001  ! 2889: BRGEZ	brgez  ,nt	%8,<label_0x20001>
	.word 0xc3ea2db0  ! 2890: PREFETCHA_I	prefetcha	[%r8, + 0x0db0] %asi, #one_read
	.word 0x22800001  ! 2891: BE	be,a	<label_0x1>
	.word 0xcc220009  ! 2893: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc44a0009  ! 2893: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xf33a2598  ! 2894: STDF_I	std	%f25, [0x0598, %r8]
	.word 0xc4520009  ! 2895: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0x3c800002  ! 2896: BPOS	bpos,a	<label_0x2>
	.word 0xccda2b00  ! 2897: LDXA_I	ldxa	[%r8, + 0x0b00] %asi, %r6
	.word 0xfe42234c  ! 2898: LDSW_I	ldsw	[%r8 + 0x034c], %r31
	.word 0xc9020009  ! 2899: LDF_R	ld	[%r8, %r9], %f4
	.word 0xedf22009  ! 2900: CASXA_R	casxa	[%r8]%asi, %r9, %r22
	.word 0x8143e01c  ! 2901: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside 
	.word 0xe4720009  ! 2903: STX_R	stx	%r18, [%r8 + %r9]
	.word 0xe8420009  ! 2903: LDSW_R	ldsw	[%r8 + %r9], %r20
	.word 0x827226d0  ! 2904: UDIV_I	udiv 	%r8, 0x06d0, %r1
	.word 0xc3ea2b00  ! 2905: PREFETCHA_I	prefetcha	[%r8, + 0x0b00] %asi, #one_read
	.word 0xc7220009  ! 2907: STF_R	st	%f3, [%r9, %r8]
	.word 0xc4720009  ! 2908: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc71a0009  ! 2908: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0x8e6a0009  ! 2909: UDIVX_R	udivx 	%r8, %r9, %r7
	.word 0x8143c000  ! 2910: STBAR	stbar
	.word 0xf26a2808  ! 2911: LDSTUB_I	ldstub	%r25, [%r8 + 0x0808]
	.word 0xec1a0009  ! 2912: LDD_R	ldd	[%r8 + %r9], %r22
	.word 0x22ca0001  ! 2913: BRZ	brz,a,pt	%8,<label_0xa0001>
	.word 0xc2921009  ! 2914: LDUHA_R	lduha	[%r8, %r9] 0x80, %r1
	.word 0x8143c000  ! 2915: STBAR	stbar
	.word 0xce5a0009  ! 2916: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xfc220009  ! 2918: STW_R	stw	%r30, [%r8 + %r9]
	.word 0xce020009  ! 2918: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xc6122408  ! 2919: LDUH_I	lduh	[%r8 + 0x0408], %r3
	.word 0x3e800002  ! 2920: BVC	bvc,a	<label_0x2>
	.word 0x22800001  ! 2921: BE	be,a	<label_0x1>
	.word 0x8eda28cc  ! 2922: SMULcc_I	smulcc 	%r8, 0x08cc, %r7
	.word 0x14800001  ! 2923: BG	bg  	<label_0x1>
	.word 0xa1220009  ! 2924: MULScc_R	mulscc 	%r8, %r9, %r16
	.word 0xfcba2070  ! 2925: STDA_I	stda	%r30, [%r8 + 0x0070] %asi
	.word 0xc3e22009  ! 2926: CASA_R	casa	[%r8] %asi, %r9, %r1
	.word 0xc8821009  ! 2927: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r4
	.word 0xc09a1009  ! 2928: LDDA_R	ldda	[%r8, %r9] 0x80, %r0
	.word 0xc2c21009  ! 2929: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r1
	.word 0xdd022a9c  ! 2930: LDF_I	ld	[%r8, 0x0a9c], %f14
	.word 0xccea1009  ! 2931: LDSTUBA_R	ldstuba	%r6, [%r8 + %r9] 0x80
	.word 0x8ad22b74  ! 2932: UMULcc_I	umulcc 	%r8, 0x0b74, %r5
	.word 0xcf3a2880  ! 2933: STDF_I	std	%f7, [0x0880, %r8]
	.word 0xcaaa2a14  ! 2934: STBA_I	stba	%r5, [%r8 + 0x0a14] %asi
	.word 0x876a2adc  ! 2935: SDIVX_I	sdivx	%r8, 0x0adc, %r3
	.word 0x1a800002  ! 2936: BCC	bcc  	<label_0x2>
	.word 0xc2b21009  ! 2937: STHA_R	stha	%r1, [%r8 + %r9] 0x80
	.word 0xfb220009  ! 2939: STF_R	st	%f29, [%r9, %r8]
	.word 0xc8720009  ! 2940: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xf0020009  ! 2940: LDUW_R	lduw	[%r8 + %r9], %r24
	.word 0xbcda2ca8  ! 2941: SMULcc_I	smulcc 	%r8, 0x0ca8, %r30
	.word 0xc8220009  ! 2943: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc44a0009  ! 2943: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xc09a2bc0  ! 2944: LDDA_I	ldda	[%r8, + 0x0bc0] %asi, %r0
	.word 0xf89a1009  ! 2945: LDDA_R	ldda	[%r8, %r9] 0x80, %r28
	.word 0x8143c000  ! 2946: STBAR	stbar
	.word 0xc3ea1009  ! 2947: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xa0da0009  ! 2948: SMULcc_R	smulcc 	%r8, %r9, %r16
	.word 0xcc220009  ! 2950: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xcd020009  ! 2950: LDF_R	ld	[%r8, %r9], %f6
	.word 0x8da20929  ! 2951: FMULs	fmuls	%f8, %f9, %f6
	.word 0xf33a0009  ! 2953: STDF_R	std	%f25, [%r9, %r8]
	.word 0xc6720009  ! 2954: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xf8120009  ! 2954: LDUH_R	lduh	[%r8 + %r9], %r28
	.word 0xc36a0009  ! 2955: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xce2a0009  ! 2957: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xe7020009  ! 2957: LDF_R	ld	[%r8, %r9], %f19
	.word 0xfc520009  ! 2958: LDSH_R	ldsh	[%r8 + %r9], %r30
	.word 0xc36a0009  ! 2959: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0x8da208a9  ! 2960: FSUBs	fsubs	%f8, %f9, %f6
	.word 0x14800001  ! 2961: BG	bg  	<label_0x1>
	.word 0xcde22009  ! 2962: CASA_R	casa	[%r8] %asi, %r9, %r6
	.word 0x8f6a27f4  ! 2963: SDIVX_I	sdivx	%r8, 0x07f4, %r7
	.word 0x14800001  ! 2964: BG	bg  	<label_0x1>
	.word 0xba52282c  ! 2965: UMUL_I	umul 	%r8, 0x082c, %r29
	.word 0xb5a20929  ! 2966: FMULs	fmuls	%f8, %f9, %f26
	.word 0xc3ea2980  ! 2967: PREFETCHA_I	prefetcha	[%r8, + 0x0980] %asi, #one_read
	.word 0xce2a0009  ! 2969: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xf40a0009  ! 2969: LDUB_R	ldub	[%r8 + %r9], %r26
	.word 0xa44a0009  ! 2970: MULX_R	mulx 	%r8, %r9, %r18
	.word 0x89a20929  ! 2971: FMULs	fmuls	%f8, %f9, %f4
	.word 0xca320009  ! 2973: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc2520009  ! 2973: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xc2220009  ! 2975: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xee020009  ! 2975: LDUW_R	lduw	[%r8 + %r9], %r23
	.word 0xfc2a0009  ! 2977: STB_R	stb	%r30, [%r8 + %r9]
	.word 0xe6120009  ! 2977: LDUH_R	lduh	[%r8 + %r9], %r19
	.word 0xce7a0009  ! 2978: SWAP_R	swap	%r7, [%r8 + %r9]
	.word 0xe6320009  ! 2980: STH_R	sth	%r19, [%r8 + %r9]
	.word 0xcf020009  ! 2980: LDF_R	ld	[%r8, %r9], %f7
	.word 0xcc2a0009  ! 2982: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xcc520009  ! 2982: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0x884a0009  ! 2983: MULX_R	mulx 	%r8, %r9, %r4
	.word 0xce5a2988  ! 2984: LDX_I	ldx	[%r8 + 0x0988], %r7
	.word 0xb7222b80  ! 2985: MULScc_I	mulscc 	%r8, 0x0b80, %r27
	.word 0xcdf22009  ! 2986: CASXA_R	casxa	[%r8]%asi, %r9, %r6
	.word 0xca6a0009  ! 2987: LDSTUB_R	ldstub	%r5, [%r8 + %r9]
	.word 0xc36a2518  ! 2988: PREFETCH_I	prefetch	[%r8 + 0x0518], #one_read
	.word 0xcc9a1009  ! 2989: LDDA_R	ldda	[%r8, %r9] 0x80, %r6
	.word 0x8143e057  ! 2990: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside | #Sync 
	.word 0xcc2a0009  ! 2992: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xf01a0009  ! 2992: LDD_R	ldd	[%r8 + %r9], %r24
	.word 0xc36a0009  ! 2993: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0x82da27ec  ! 2994: SMULcc_I	smulcc 	%r8, 0x07ec, %r1
	.word 0xb26a0009  ! 2995: UDIVX_R	udivx 	%r8, %r9, %r25
	.word 0xc3ea2f88  ! 2996: PREFETCHA_I	prefetcha	[%r8, + 0x0f88] %asi, #one_read
	.word 0x8143c000  ! 2997: STBAR	stbar
	.word 0xc6da2568  ! 2998: LDXA_I	ldxa	[%r8, + 0x0568] %asi, %r3
	.word 0x02800002  ! 2999: BE	be  	<label_0x2>
	.word 0x18800001  ! 3000: BGU	bgu  	<label_0x1>
	.word 0xd80a0009  ! 3001: LDUB_R	ldub	[%r8 + %r9], %r12
	.word 0xc8ba1009  ! 3002: STDA_R	stda	%r4, [%r8 + %r9] 0x80
	.word 0x8143e034  ! 3003: MEMBAR	membar	#LoadStore | #Lookaside | #MemIssue 
	.word 0x1e800001  ! 3004: BVC	bvc  	<label_0x1>
	.word 0xc3ea1009  ! 3005: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc5f21009  ! 3006: CASXA_I	casxa	[%r8] 0x80, %r9, %r2
	.word 0x36800002  ! 3007: BGE	bge,a	<label_0x2>
	.word 0xc6d21009  ! 3008: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r3
	.word 0xcaf21009  ! 3009: STXA_R	stxa	%r5, [%r8 + %r9] 0x80
	.word 0x8143e055  ! 3010: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside | #Sync 
	.word 0xb3a20929  ! 3011: FMULs	fmuls	%f8, %f9, %f25
	.word 0x12800002  ! 3012: BNE	bne  	<label_0x2>
	.word 0x85220009  ! 3013: MULScc_R	mulscc 	%r8, %r9, %r2
	.word 0xc36a21b4  ! 3014: PREFETCH_I	prefetch	[%r8 + 0x01b4], #one_read
	.word 0xf33a0009  ! 3016: STDF_R	std	%f25, [%r9, %r8]
	.word 0xf6720009  ! 3017: STX_R	stx	%r27, [%r8 + %r9]
	.word 0xeb020009  ! 3017: LDF_R	ld	[%r8, %r9], %f21
	.word 0xcac21009  ! 3018: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r5
	.word 0xe09a1009  ! 3019: LDDA_R	ldda	[%r8, %r9] 0x80, %r16
	.word 0x8143c000  ! 3020: STBAR	stbar
	.word 0xec320009  ! 3022: STH_R	sth	%r22, [%r8 + %r9]
	.word 0xcf020009  ! 3022: LDF_R	ld	[%r8, %r9], %f7
	.word 0xcc2a0009  ! 3024: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc2520009  ! 3024: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xc3ea1009  ! 3025: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xe2220009  ! 3027: STW_R	stw	%r17, [%r8 + %r9]
	.word 0xd64a0009  ! 3027: LDSB_R	ldsb	[%r8 + %r9], %r11
	.word 0xcada1009  ! 3028: LDXA_R	ldxa	[%r8, %r9] 0x80, %r5
	.word 0x2cc20001  ! 3029: BRGZ	brgz,a,nt	%8,<label_0x20001>
	.word 0x2cc20001  ! 3030: BRGZ	brgz,a,nt	%8,<label_0x20001>
	.word 0xf0a21009  ! 3031: STWA_R	stwa	%r24, [%r8 + %r9] 0x80
	.word 0xc40a0009  ! 3032: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xf93a2fa0  ! 3033: STDF_I	std	%f28, [0x0fa0, %r8]
	.word 0x8143e075  ! 3034: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside | #MemIssue | #Sync 
	.word 0x40000001  ! 3035: CALL	call	disp30_1
	.word 0xdab21009  ! 3036: STHA_R	stha	%r13, [%r8 + %r9] 0x80
	.word 0xc82a0009  ! 3038: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xf1020009  ! 3038: LDF_R	ld	[%r8, %r9], %f24
	.word 0xcaaa2c2c  ! 3039: STBA_I	stba	%r5, [%r8 + 0x0c2c] %asi
	.word 0xcf220009  ! 3041: STF_R	st	%f7, [%r9, %r8]
	.word 0xce720009  ! 3042: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc80a0009  ! 3042: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xc3ea2638  ! 3043: PREFETCHA_I	prefetcha	[%r8, + 0x0638] %asi, #one_read
	.word 0x83a208a9  ! 3044: FSUBs	fsubs	%f8, %f9, %f1
	.word 0x8143e009  ! 3045: MEMBAR	membar	#LoadLoad | #StoreStore 
	.word 0xc36a0009  ! 3046: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc4720009  ! 3048: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xf0020009  ! 3048: LDUW_R	lduw	[%r8 + %r9], %r24
	.word 0x8ed20009  ! 3049: UMULcc_R	umulcc 	%r8, %r9, %r7
	.word 0x36800002  ! 3050: BGE	bge,a	<label_0x2>
	.word 0xc4ba2d30  ! 3051: STDA_I	stda	%r2, [%r8 + 0x0d30] %asi
	.word 0x8c5229fc  ! 3052: UMUL_I	umul 	%r8, 0x09fc, %r6
	.word 0xe62a0009  ! 3054: STB_R	stb	%r19, [%r8 + %r9]
	.word 0xca120009  ! 3054: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xcf3a2058  ! 3055: STDF_I	std	%f7, [0x0058, %r8]
	.word 0x84f227c4  ! 3056: UDIVcc_I	udivcc 	%r8, 0x07c4, %r2
	.word 0x28800002  ! 3057: BLEU	bleu,a	<label_0x2>
	.word 0xc36a0009  ! 3058: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xcab22fcc  ! 3059: STHA_I	stha	%r5, [%r8 + 0x0fcc] %asi
	.word 0x884a0009  ! 3060: MULX_R	mulx 	%r8, %r9, %r4
	.word 0xc62a0009  ! 3062: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc8420009  ! 3062: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xc36a0009  ! 3063: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0x2e800001  ! 3064: BVS	bvs,a	<label_0x1>
	.word 0xc25a2ae0  ! 3065: LDX_I	ldx	[%r8 + 0x0ae0], %r1
	.word 0xc3ea2094  ! 3066: PREFETCHA_I	prefetcha	[%r8, + 0x0094] %asi, #one_read
	.word 0xe2ea1009  ! 3067: LDSTUBA_R	ldstuba	%r17, [%r8 + %r9] 0x80
	.word 0xba72221c  ! 3068: UDIV_I	udiv 	%r8, 0x021c, %r29
	.word 0xc4ca1009  ! 3069: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r2
	.word 0xf4ba2a78  ! 3070: STDA_I	stda	%r26, [%r8 + 0x0a78] %asi
	.word 0x9c5222c4  ! 3071: UMUL_I	umul 	%r8, 0x02c4, %r14
	.word 0xcc320009  ! 3073: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc80a0009  ! 3073: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xf2320009  ! 3075: STH_R	sth	%r25, [%r8 + %r9]
	.word 0xee520009  ! 3075: LDSH_R	ldsh	[%r8 + %r9], %r23
	.word 0xc4f22b18  ! 3076: STXA_I	stxa	%r2, [%r8 + 0x0b18] %asi
	.word 0xc8f22d90  ! 3077: STXA_I	stxa	%r4, [%r8 + 0x0d90] %asi
	.word 0xccba2258  ! 3078: STDA_I	stda	%r6, [%r8 + 0x0258] %asi
	.word 0xc5f21009  ! 3079: CASXA_I	casxa	[%r8] 0x80, %r9, %r2
	.word 0xca7a26ec  ! 3080: SWAP_I	swap	%r5, [%r8 + 0x06ec]
	.word 0xc36a0009  ! 3081: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0x28800001  ! 3082: BLEU	bleu,a	<label_0x1>
	.word 0x84f20009  ! 3083: UDIVcc_R	udivcc 	%r8, %r9, %r2
	.word 0xeeb22c10  ! 3084: STHA_I	stha	%r23, [%r8 + 0x0c10] %asi
	.word 0x8af22640  ! 3085: UDIVcc_I	udivcc 	%r8, 0x0640, %r5
	.word 0xe3e21009  ! 3086: CASA_I	casa	[%r8] 0x80, %r9, %r17
	.word 0xc3ea1009  ! 3087: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xda2a0009  ! 3089: STB_R	stb	%r13, [%r8 + %r9]
	.word 0xce120009  ! 3089: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0x8143c000  ! 3090: STBAR	stbar
	.word 0xe2220009  ! 3092: STW_R	stw	%r17, [%r8 + %r9]
	.word 0xc6120009  ! 3092: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xf44a0009  ! 3093: LDSB_R	ldsb	[%r8 + %r9], %r26
	.word 0xdada2ab0  ! 3094: LDXA_I	ldxa	[%r8, + 0x0ab0] %asi, %r13
	.word 0x8e520009  ! 3095: UMUL_R	umul 	%r8, %r9, %r7
	.word 0xc36a2020  ! 3096: PREFETCH_I	prefetch	[%r8 + 0x0020], #one_read
	.word 0x04ca0001  ! 3097: BRLEZ	brlez  ,pt	%8,<label_0xa0001>
	.word 0xcc9a2ab8  ! 3098: LDDA_I	ldda	[%r8, + 0x0ab8] %asi, %r6
	.word 0xee220009  ! 3100: STW_R	stw	%r23, [%r8 + %r9]
	.word 0xce4a0009  ! 3100: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xc73a0009  ! 3102: STDF_R	std	%f3, [%r9, %r8]
	.word 0xca720009  ! 3103: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xce4a0009  ! 3103: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0x3a800002  ! 3104: BCC	bcc,a	<label_0x2>
	.word 0xbe520009  ! 3105: UMUL_R	umul 	%r8, %r9, %r31
	.word 0x86d20009  ! 3106: UMULcc_R	umulcc 	%r8, %r9, %r3
	.word 0xe05220d0  ! 3107: LDSH_I	ldsh	[%r8 + 0x00d0], %r16
	.word 0x12800001  ! 3108: BNE	bne  	<label_0x1>
	.word 0xca9225d0  ! 3109: LDUHA_I	lduha	[%r8, + 0x05d0] %asi, %r5
	.word 0xc4220009  ! 3111: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xf6020009  ! 3111: LDUW_R	lduw	[%r8 + %r9], %r27
	.word 0x864a2d14  ! 3112: MULX_I	mulx 	%r8, 0x0d14, %r3
	.word 0xcf2229b8  ! 3113: STF_I	st	%f7, [0x09b8, %r8]
	.word 0x8143e00f  ! 3114: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore 
	.word 0xc3f22009  ! 3115: CASXA_R	casxa	[%r8]%asi, %r9, %r1
	.word 0x0a800002  ! 3116: BCS	bcs  	<label_0x2>
	.word 0x8143c000  ! 3117: STBAR	stbar
	.word 0xc4f21009  ! 3118: STXA_R	stxa	%r2, [%r8 + %r9] 0x80
	.word 0xcc2a0009  ! 3120: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc24a0009  ! 3120: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xce922a8c  ! 3121: LDUHA_I	lduha	[%r8, + 0x0a8c] %asi, %r7
	.word 0xf8220009  ! 3123: STW_R	stw	%r28, [%r8 + %r9]
	.word 0xc5020009  ! 3123: LDF_R	ld	[%r8, %r9], %f2
	.word 0xc6220009  ! 3125: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xca5a0009  ! 3125: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xf05a0009  ! 3126: LDX_R	ldx	[%r8 + %r9], %r24
	.word 0x8143e026  ! 3127: MEMBAR	membar	#StoreLoad | #LoadStore | #MemIssue 
	.word 0xc53a22f0  ! 3128: STDF_I	std	%f2, [0x02f0, %r8]
	.word 0xfde22009  ! 3129: CASA_R	casa	[%r8] %asi, %r9, %r30
	.word 0xc36a2a38  ! 3130: PREFETCH_I	prefetch	[%r8 + 0x0a38], #one_read
	.word 0x8143e026  ! 3131: MEMBAR	membar	#StoreLoad | #LoadStore | #MemIssue 
	.word 0xc73a28a8  ! 3132: STDF_I	std	%f3, [0x08a8, %r8]
	.word 0xccba1009  ! 3133: STDA_R	stda	%r6, [%r8 + %r9] 0x80
	.word 0xf49a2510  ! 3134: LDDA_I	ldda	[%r8, + 0x0510] %asi, %r26
	.word 0xcaa22dd8  ! 3135: STWA_I	stwa	%r5, [%r8 + 0x0dd8] %asi
	.word 0x85a20829  ! 3136: FADDs	fadds	%f8, %f9, %f2
	.word 0x86fa2424  ! 3137: SDIVcc_I	sdivcc 	%r8, 0x0424, %r3
	.word 0x2cca0001  ! 3138: BRGZ	brgz,a,pt	%8,<label_0xa0001>
	.word 0x3c800002  ! 3139: BPOS	bpos,a	<label_0x2>
	.word 0xf652215c  ! 3140: LDSH_I	ldsh	[%r8 + 0x015c], %r27
	.word 0x82f228b8  ! 3141: UDIVcc_I	udivcc 	%r8, 0x08b8, %r1
	.word 0x30800001  ! 3142: BA	ba,a	<label_0x1>
	.word 0xc3ea2694  ! 3143: PREFETCHA_I	prefetcha	[%r8, + 0x0694] %asi, #one_read
	.word 0x887a2e08  ! 3144: SDIV_I	sdiv 	%r8, 0x0e08, %r4
	.word 0xc8220009  ! 3146: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xca0a0009  ! 3146: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xc6720009  ! 3148: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xce020009  ! 3148: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xb87a2f50  ! 3149: SDIV_I	sdiv 	%r8, 0x0f50, %r28
	.word 0x8143c000  ! 3150: STBAR	stbar
	.word 0xcc220009  ! 3152: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xcc0a0009  ! 3152: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xcf3a0009  ! 3154: STDF_R	std	%f7, [%r9, %r8]
	.word 0xe8720009  ! 3155: STX_R	stx	%r20, [%r8 + %r9]
	.word 0xc6520009  ! 3155: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xc2a22e4c  ! 3156: STWA_I	stwa	%r1, [%r8 + 0x0e4c] %asi
	.word 0x8143e030  ! 3157: MEMBAR	membar	#Lookaside | #MemIssue 
	.word 0xb56a2d54  ! 3158: SDIVX_I	sdivx	%r8, 0x0d54, %r26
	.word 0xf8ca2558  ! 3159: LDSBA_I	ldsba	[%r8, + 0x0558] %asi, %r28
	.word 0xca2a0009  ! 3161: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xcc5a0009  ! 3161: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0x8f2221b0  ! 3162: MULScc_I	mulscc 	%r8, 0x01b0, %r7
	.word 0x8b6a2948  ! 3163: SDIVX_I	sdivx	%r8, 0x0948, %r5
	.word 0xb8722368  ! 3164: UDIV_I	udiv 	%r8, 0x0368, %r28
	.word 0xc3ea1009  ! 3165: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xca2a0009  ! 3167: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc81a0009  ! 3167: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xc6320009  ! 3169: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc81a0009  ! 3169: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xcbe22009  ! 3170: CASA_R	casa	[%r8] %asi, %r9, %r5
	.word 0xbc522b54  ! 3171: UMUL_I	umul 	%r8, 0x0b54, %r30
	.word 0x876a0009  ! 3172: SDIVX_R	sdivx	%r8, %r9, %r3
	.word 0xd73a0009  ! 3174: STDF_R	std	%f11, [%r9, %r8]
	.word 0xc2720009  ! 3175: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc60a0009  ! 3175: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xac6a0009  ! 3176: UDIVX_R	udivx 	%r8, %r9, %r22
	.word 0xccf21009  ! 3177: STXA_R	stxa	%r6, [%r8 + %r9] 0x80
	.word 0xc2c22230  ! 3178: LDSWA_I	ldswa	[%r8, + 0x0230] %asi, %r1
	.word 0xc2fa2708  ! 3179: SWAPA_I	swapa	%r1, [%r8 + 0x0708] %asi
	.word 0x8fa208a9  ! 3180: FSUBs	fsubs	%f8, %f9, %f7
	.word 0xc3220009  ! 3182: STF_R	st	%f1, [%r9, %r8]
	.word 0xf4720009  ! 3183: STX_R	stx	%r26, [%r8 + %r9]
	.word 0xc81a0009  ! 3183: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x8143e036  ! 3184: MEMBAR	membar	#StoreLoad | #LoadStore | #Lookaside | #MemIssue 
	.word 0xe2921009  ! 3185: LDUHA_R	lduha	[%r8, %r9] 0x80, %r17
	.word 0xca120009  ! 3186: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xc4ea2938  ! 3187: LDSTUBA_I	ldstuba	%r2, [%r8 + 0x0938] %asi
	.word 0x06ca0001  ! 3188: BRLZ	brlz  ,pt	%8,<label_0xa0001>
	.word 0x8143c000  ! 3189: STBAR	stbar
	.word 0xe0c21009  ! 3190: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r16
	.word 0xe13a2e88  ! 3191: STDF_I	std	%f16, [0x0e88, %r8]
	.word 0xca320009  ! 3193: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xcf1a0009  ! 3193: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xc85a0009  ! 3194: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xccb22c50  ! 3195: STHA_I	stha	%r6, [%r8 + 0x0c50] %asi
	.word 0x8f222898  ! 3196: MULScc_I	mulscc 	%r8, 0x0898, %r7
	.word 0x89220009  ! 3197: MULScc_R	mulscc 	%r8, %r9, %r4
	.word 0x8da208a9  ! 3198: FSUBs	fsubs	%f8, %f9, %f6
	.word 0xc8320009  ! 3200: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xcc0a0009  ! 3200: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xc36a0009  ! 3201: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0x82520009  ! 3202: UMUL_R	umul 	%r8, %r9, %r1
	.word 0xce320009  ! 3204: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xca120009  ! 3204: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xc8d21009  ! 3205: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r4
	.word 0xc8220009  ! 3207: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xea020009  ! 3207: LDUW_R	lduw	[%r8 + %r9], %r21
	.word 0xe4ea2474  ! 3208: LDSTUBA_I	ldstuba	%r18, [%r8 + 0x0474] %asi
	.word 0x9a6a2220  ! 3209: UDIVX_I	udivx 	%r8, 0x0220, %r13
	.word 0xc4aa226c  ! 3210: STBA_I	stba	%r2, [%r8 + 0x026c] %asi
	.word 0xcd222e10  ! 3211: STF_I	st	%f6, [0x0e10, %r8]
	.word 0xc36a0009  ! 3212: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xa6d20009  ! 3213: UMULcc_R	umulcc 	%r8, %r9, %r19
	.word 0xc22a0009  ! 3215: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xce0a0009  ! 3215: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xf6f22140  ! 3216: STXA_I	stxa	%r27, [%r8 + 0x0140] %asi
	.word 0xc36a2084  ! 3217: PREFETCH_I	prefetch	[%r8 + 0x0084], #one_read
	.word 0xc4ea1009  ! 3218: LDSTUBA_R	ldstuba	%r2, [%r8 + %r9] 0x80
	.word 0xc3ea23c4  ! 3219: PREFETCHA_I	prefetcha	[%r8, + 0x03c4] %asi, #one_read
	.word 0xc4ea1009  ! 3220: LDSTUBA_R	ldstuba	%r2, [%r8 + %r9] 0x80
	.word 0xca7a0009  ! 3221: SWAP_R	swap	%r5, [%r8 + %r9]
	.word 0x8143c000  ! 3222: STBAR	stbar
	.word 0xb0fa0009  ! 3223: SDIVcc_R	sdivcc 	%r8, %r9, %r24
	.word 0xf1020009  ! 3224: LDF_R	ld	[%r8, %r9], %f24
	.word 0x844a2c78  ! 3225: MULX_I	mulx 	%r8, 0x0c78, %r2
	.word 0xcac21009  ! 3226: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r5
	.word 0x8d222a48  ! 3227: MULScc_I	mulscc 	%r8, 0x0a48, %r6
	.word 0xc4720009  ! 3229: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc4120009  ! 3229: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0x8fa209a9  ! 3230: FDIVs	fdivs	%f8, %f9, %f7
	.word 0x8143c000  ! 3231: STBAR	stbar
	.word 0x8143c000  ! 3232: STBAR	stbar
	.word 0xcc320009  ! 3234: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xd6420009  ! 3234: LDSW_R	ldsw	[%r8 + %r9], %r11
	.word 0xde720009  ! 3236: STX_R	stx	%r15, [%r8 + %r9]
	.word 0xdc420009  ! 3236: LDSW_R	ldsw	[%r8 + %r9], %r14
	.word 0xc2320009  ! 3238: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc44a0009  ! 3238: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xfeca29a4  ! 3239: LDSBA_I	ldsba	[%r8, + 0x09a4] %asi, %r31
	.word 0xb1a209a9  ! 3240: FDIVs	fdivs	%f8, %f9, %f24
	.word 0x8143e048  ! 3241: MEMBAR	membar	#StoreStore | #Sync 
	.word 0xe04a0009  ! 3242: LDSB_R	ldsb	[%r8 + %r9], %r16
	.word 0xc8320009  ! 3244: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xe6020009  ! 3244: LDUW_R	lduw	[%r8 + %r9], %r19
	.word 0x9fa20829  ! 3245: FADDs	fadds	%f8, %f9, %f15
	.word 0xc8ca1009  ! 3246: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r4
	.word 0x83a209a9  ! 3247: FDIVs	fdivs	%f8, %f9, %f1
	.word 0xdf3a2858  ! 3248: STDF_I	std	%f15, [0x0858, %r8]
	.word 0xcc4a0009  ! 3249: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xc36a0009  ! 3250: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xa8d22cf4  ! 3251: UMULcc_I	umulcc 	%r8, 0x0cf4, %r20
	.word 0x86fa27ec  ! 3252: SDIVcc_I	sdivcc 	%r8, 0x07ec, %r3
	.word 0xcab21009  ! 3253: STHA_R	stha	%r5, [%r8 + %r9] 0x80
	.word 0xceca1009  ! 3254: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r7
	.word 0xccfa1009  ! 3255: SWAPA_R	swapa	%r6, [%r8 + %r9] 0x80
	.word 0x08800001  ! 3256: BLEU	bleu  	<label_0x1>
	.word 0xc6ea1009  ! 3257: LDSTUBA_R	ldstuba	%r3, [%r8 + %r9] 0x80
	.word 0xc2720009  ! 3259: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc40a0009  ! 3259: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0x827a2b44  ! 3260: SDIV_I	sdiv 	%r8, 0x0b44, %r1
	.word 0xc2020009  ! 3261: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xcf1a29e8  ! 3262: LDDF_I	ldd	[%r8, 0x09e8], %f7
	.word 0xca220009  ! 3264: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xcd020009  ! 3264: LDF_R	ld	[%r8, %r9], %f6
	.word 0xc36a0009  ! 3265: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc3ea21d4  ! 3266: PREFETCHA_I	prefetcha	[%r8, + 0x01d4] %asi, #one_read
	.word 0xccfa1009  ! 3267: SWAPA_R	swapa	%r6, [%r8 + %r9] 0x80
	.word 0xbfa208a9  ! 3268: FSUBs	fsubs	%f8, %f9, %f31
	.word 0xf6822784  ! 3269: LDUWA_I	lduwa	[%r8, + 0x0784] %asi, %r27
	.word 0xc6220009  ! 3271: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc81a0009  ! 3271: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x827a2efc  ! 3272: SDIV_I	sdiv 	%r8, 0x0efc, %r1
	.word 0xc3ea2888  ! 3273: PREFETCHA_I	prefetcha	[%r8, + 0x0888] %asi, #one_read
	.word 0xc36a22b4  ! 3274: PREFETCH_I	prefetch	[%r8 + 0x02b4], #one_read
	.word 0xc42a0009  ! 3276: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc8420009  ! 3276: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0x88520009  ! 3277: UMUL_R	umul 	%r8, %r9, %r4
	.word 0xc8720009  ! 3279: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xca520009  ! 3279: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xa47a0009  ! 3280: SDIV_R	sdiv 	%r8, %r9, %r18
	.word 0xa45a0009  ! 3281: SMUL_R	smul 	%r8, %r9, %r18
	.word 0xc2c21009  ! 3282: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r1
	.word 0xccf21009  ! 3283: STXA_R	stxa	%r6, [%r8 + %r9] 0x80
	.word 0xdcca1009  ! 3284: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r14
	.word 0xc6da2638  ! 3285: LDXA_I	ldxa	[%r8, + 0x0638] %asi, %r3
	.word 0x87a20929  ! 3286: FMULs	fmuls	%f8, %f9, %f3
	.word 0xc8220009  ! 3288: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc8420009  ! 3288: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xe87a0009  ! 3289: SWAP_R	swap	%r20, [%r8 + %r9]
	.word 0xc36a2a08  ! 3290: PREFETCH_I	prefetch	[%r8 + 0x0a08], #one_read
	.word 0x8e722a78  ! 3291: UDIV_I	udiv 	%r8, 0x0a78, %r7
	.word 0xce122078  ! 3292: LDUH_I	lduh	[%r8 + 0x0078], %r7
	.word 0xe0921009  ! 3293: LDUHA_R	lduha	[%r8, %r9] 0x80, %r16
	.word 0xc40a0009  ! 3294: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xc25a2d88  ! 3295: LDX_I	ldx	[%r8 + 0x0d88], %r1
	.word 0xad220009  ! 3296: MULScc_R	mulscc 	%r8, %r9, %r22
	.word 0xc44a0009  ! 3297: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xcf3a0009  ! 3299: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc4720009  ! 3300: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xe44a0009  ! 3300: LDSB_R	ldsb	[%r8 + %r9], %r18
	.word 0xcc220009  ! 3302: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc91a0009  ! 3302: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0x8143c000  ! 3303: STBAR	stbar
	.word 0xb3a20929  ! 3304: FMULs	fmuls	%f8, %f9, %f25
	.word 0xd64a2b34  ! 3305: LDSB_I	ldsb	[%r8 + 0x0b34], %r11
	.word 0xc47a24f0  ! 3306: SWAP_I	swap	%r2, [%r8 + 0x04f0]
	.word 0xc3ea1009  ! 3307: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x8143e065  ! 3308: MEMBAR	membar	#LoadLoad | #LoadStore | #MemIssue | #Sync 
	.word 0x8143c000  ! 3309: STBAR	stbar
	.word 0xc2320009  ! 3311: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xe40a0009  ! 3311: LDUB_R	ldub	[%r8 + %r9], %r18
	.word 0xc36a2568  ! 3312: PREFETCH_I	prefetch	[%r8 + 0x0568], #one_read
	.word 0xec220009  ! 3314: STW_R	stw	%r22, [%r8 + %r9]
	.word 0xc2120009  ! 3314: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xc2b22d84  ! 3315: STHA_I	stha	%r1, [%r8 + 0x0d84] %asi
	.word 0x8a7a0009  ! 3316: SDIV_R	sdiv 	%r8, %r9, %r5
	.word 0xca2a0009  ! 3318: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc45a0009  ! 3318: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xc4da1009  ! 3319: LDXA_R	ldxa	[%r8, %r9] 0x80, %r2
	.word 0x8a722740  ! 3320: UDIV_I	udiv 	%r8, 0x0740, %r5
	.word 0x9c520009  ! 3321: UMUL_R	umul 	%r8, %r9, %r14
	.word 0xeada1009  ! 3322: LDXA_R	ldxa	[%r8, %r9] 0x80, %r21
	.word 0xc52221d8  ! 3323: STF_I	st	%f2, [0x01d8, %r8]
	.word 0xaba209a9  ! 3324: FDIVs	fdivs	%f8, %f9, %f21
	.word 0xc69228b0  ! 3325: LDUHA_I	lduha	[%r8, + 0x08b0] %asi, %r3
	.word 0xd93a2fa8  ! 3326: STDF_I	std	%f12, [0x0fa8, %r8]
	.word 0x8a722628  ! 3327: UDIV_I	udiv 	%r8, 0x0628, %r5
	.word 0xc2aa2574  ! 3328: STBA_I	stba	%r1, [%r8 + 0x0574] %asi
	.word 0x24ca0001  ! 3329: BRLEZ	brlez,a,pt	%8,<label_0xa0001>
	.word 0xc6a21009  ! 3330: STWA_R	stwa	%r3, [%r8 + %r9] 0x80
	.word 0xc3ea1009  ! 3331: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x8143c000  ! 3332: STBAR	stbar
	.word 0xc3222154  ! 3333: STF_I	st	%f1, [0x0154, %r8]
	.word 0x826a2550  ! 3334: UDIVX_I	udivx 	%r8, 0x0550, %r1
	.word 0xc6220009  ! 3336: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc6420009  ! 3336: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xafa20829  ! 3337: FADDs	fadds	%f8, %f9, %f23
	.word 0x8143e01c  ! 3338: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside 
	.word 0xf8320009  ! 3340: STH_R	sth	%r28, [%r8 + %r9]
	.word 0xcf1a0009  ! 3340: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0x8143c000  ! 3341: STBAR	stbar
	.word 0xc6320009  ! 3343: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xcc420009  ! 3343: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0x887a26b4  ! 3344: SDIV_I	sdiv 	%r8, 0x06b4, %r4
	.word 0x84522890  ! 3345: UMUL_I	umul 	%r8, 0x0890, %r2
	.word 0x8d6a0009  ! 3346: SDIVX_R	sdivx	%r8, %r9, %r6
	.word 0xafa20929  ! 3347: FMULs	fmuls	%f8, %f9, %f23
	.word 0xdfe21009  ! 3348: CASA_I	casa	[%r8] 0x80, %r9, %r15
	.word 0x8143c000  ! 3349: STBAR	stbar
	.word 0x89222170  ! 3350: MULScc_I	mulscc 	%r8, 0x0170, %r4
	.word 0xc3ea222c  ! 3351: PREFETCHA_I	prefetcha	[%r8, + 0x022c] %asi, #one_read
	.word 0xc8b22a58  ! 3352: STHA_I	stha	%r4, [%r8 + 0x0a58] %asi
	.word 0xf11a0009  ! 3353: LDDF_R	ldd	[%r8, %r9], %f24
	.word 0xcc5a2818  ! 3354: LDX_I	ldx	[%r8 + 0x0818], %r6
	.word 0x8d220009  ! 3355: MULScc_R	mulscc 	%r8, %r9, %r6
	.word 0xd7220009  ! 3357: STF_R	st	%f11, [%r9, %r8]
	.word 0xc8720009  ! 3358: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc2120009  ! 3358: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xc3ea1009  ! 3359: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xa8d220a8  ! 3360: UMULcc_I	umulcc 	%r8, 0x00a8, %r20
	.word 0xaa4a2a90  ! 3361: MULX_I	mulx 	%r8, 0x0a90, %r21
	.word 0xccba1009  ! 3362: STDA_R	stda	%r6, [%r8 + %r9] 0x80
	.word 0xc4ca1009  ! 3363: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r2
	.word 0xc2220009  ! 3365: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc9020009  ! 3365: LDF_R	ld	[%r8, %r9], %f4
	.word 0xf2a22f94  ! 3366: STWA_I	stwa	%r25, [%r8 + 0x0f94] %asi
	.word 0x8272298c  ! 3367: UDIV_I	udiv 	%r8, 0x098c, %r1
	.word 0x8da20929  ! 3368: FMULs	fmuls	%f8, %f9, %f6
	.word 0xc45a0009  ! 3369: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0x40000001  ! 3370: CALL	call	disp30_1
	.word 0xc3ea1009  ! 3371: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc4a21009  ! 3372: STWA_R	stwa	%r2, [%r8 + %r9] 0x80
	.word 0xc64a0009  ! 3373: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xc4ca2b28  ! 3374: LDSBA_I	ldsba	[%r8, + 0x0b28] %asi, %r2
	.word 0xc82a0009  ! 3376: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc81a0009  ! 3376: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x1c800002  ! 3377: BPOS	bpos  	<label_0x2>
	.word 0x22800002  ! 3378: BE	be,a	<label_0x2>
	.word 0x8e5a0009  ! 3379: SMUL_R	smul 	%r8, %r9, %r7
	.word 0x85220009  ! 3380: MULScc_R	mulscc 	%r8, %r9, %r2
	.word 0xce720009  ! 3382: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xfb020009  ! 3382: LDF_R	ld	[%r8, %r9], %f29
	.word 0xcb022fa4  ! 3383: LDF_I	ld	[%r8, 0x0fa4], %f5
	.word 0xc2f21009  ! 3384: STXA_R	stxa	%r1, [%r8 + %r9] 0x80
	.word 0xcd1a24b8  ! 3385: LDDF_I	ldd	[%r8, 0x04b8], %f6
	.word 0xd6d22a50  ! 3386: LDSHA_I	ldsha	[%r8, + 0x0a50] %asi, %r11
	.word 0xd8921009  ! 3387: LDUHA_R	lduha	[%r8, %r9] 0x80, %r12
	.word 0xf0a22dbc  ! 3388: STWA_I	stwa	%r24, [%r8 + 0x0dbc] %asi
	.word 0xc52224d8  ! 3389: STF_I	st	%f2, [0x04d8, %r8]
	.word 0xaba20829  ! 3390: FADDs	fadds	%f8, %f9, %f21
	.word 0x8143e07b  ! 3391: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xce420009  ! 3392: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xe4b21009  ! 3393: STHA_R	stha	%r18, [%r8 + %r9] 0x80
	.word 0x847a2248  ! 3394: SDIV_I	sdiv 	%r8, 0x0248, %r2
	.word 0xf88a2ddc  ! 3395: LDUBA_I	lduba	[%r8, + 0x0ddc] %asi, %r28
	.word 0x12800001  ! 3396: BNE	bne  	<label_0x1>
	.word 0xc62a0009  ! 3398: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc8120009  ! 3398: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0x887a0009  ! 3399: SDIV_R	sdiv 	%r8, %r9, %r4
	.word 0xc36a0009  ! 3400: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xfab21009  ! 3401: STHA_R	stha	%r29, [%r8 + %r9] 0x80
	.word 0x40000001  ! 3402: CALL	call	disp30_1
	.word 0x8ba208a9  ! 3403: FSUBs	fsubs	%f8, %f9, %f5
	.word 0xc67a2ad0  ! 3404: SWAP_I	swap	%r3, [%r8 + 0x0ad0]
	.word 0x8143c000  ! 3405: STBAR	stbar
	.word 0xf53a25d8  ! 3406: STDF_I	std	%f26, [0x05d8, %r8]
	.word 0xc84a21b4  ! 3407: LDSB_I	ldsb	[%r8 + 0x01b4], %r4
	.word 0x85a208a9  ! 3408: FSUBs	fsubs	%f8, %f9, %f2
	.word 0xc4320009  ! 3410: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xca420009  ! 3410: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xcf3a0009  ! 3412: STDF_R	std	%f7, [%r9, %r8]
	.word 0xfc720009  ! 3413: STX_R	stx	%r30, [%r8 + %r9]
	.word 0xca4a0009  ! 3413: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0x8143e04f  ! 3414: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #Sync 
	.word 0xc4220009  ! 3416: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xf20a0009  ! 3416: LDUB_R	ldub	[%r8 + %r9], %r25
	.word 0x38800001  ! 3417: BGU	bgu,a	<label_0x1>
	.word 0xc5222cbc  ! 3418: STF_I	st	%f2, [0x0cbc, %r8]
	.word 0x8143c000  ! 3419: STBAR	stbar
	.word 0x8143e035  ! 3420: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside | #MemIssue 
	.word 0xf9022c64  ! 3421: LDF_I	ld	[%r8, 0x0c64], %f28
	.word 0xc47a0009  ! 3422: SWAP_R	swap	%r2, [%r8 + %r9]
	.word 0x88d20009  ! 3423: UMULcc_R	umulcc 	%r8, %r9, %r4
	.word 0x8a4a0009  ! 3424: MULX_R	mulx 	%r8, %r9, %r5
	.word 0xa45224d8  ! 3425: UMUL_I	umul 	%r8, 0x04d8, %r18
	.word 0xc36a2b7c  ! 3426: PREFETCH_I	prefetch	[%r8 + 0x0b7c], #one_read
	.word 0xc4ea25a4  ! 3427: LDSTUBA_I	ldstuba	%r2, [%r8 + 0x05a4] %asi
	.word 0xdc9a2b78  ! 3428: LDDA_I	ldda	[%r8, + 0x0b78] %asi, %r14
	.word 0xc212219c  ! 3429: LDUH_I	lduh	[%r8 + 0x019c], %r1
	.word 0xf0320009  ! 3431: STH_R	sth	%r24, [%r8 + %r9]
	.word 0xcf020009  ! 3431: LDF_R	ld	[%r8, %r9], %f7
	.word 0xc2520009  ! 3432: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0x8143e07e  ! 3433: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xf8320009  ! 3435: STH_R	sth	%r28, [%r8 + %r9]
	.word 0xc4020009  ! 3435: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0x3e800001  ! 3436: BVC	bvc,a	<label_0x1>
	.word 0x40000001  ! 3437: CALL	call	disp30_1
	.word 0xc8220009  ! 3439: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc81a0009  ! 3439: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xf0ba1009  ! 3440: STDA_R	stda	%r24, [%r8 + %r9] 0x80
	.word 0xf2320009  ! 3442: STH_R	sth	%r25, [%r8 + %r9]
	.word 0xc81a0009  ! 3442: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xc4ea1009  ! 3443: LDSTUBA_R	ldstuba	%r2, [%r8 + %r9] 0x80
	.word 0xccaa2f18  ! 3444: STBA_I	stba	%r6, [%r8 + 0x0f18] %asi
	.word 0xc3ea2204  ! 3445: PREFETCHA_I	prefetcha	[%r8, + 0x0204] %asi, #one_read
	.word 0xc80a21b8  ! 3446: LDUB_I	ldub	[%r8 + 0x01b8], %r4
	.word 0x86fa23a8  ! 3447: SDIVcc_I	sdivcc 	%r8, 0x03a8, %r3
	.word 0xc2d2232c  ! 3448: LDSHA_I	ldsha	[%r8, + 0x032c] %asi, %r1
	.word 0xc3ea2e2c  ! 3449: PREFETCHA_I	prefetcha	[%r8, + 0x0e2c] %asi, #one_read
	.word 0xc36a248c  ! 3450: PREFETCH_I	prefetch	[%r8 + 0x048c], #one_read
	.word 0xc40a24a0  ! 3451: LDUB_I	ldub	[%r8 + 0x04a0], %r2
	.word 0xcb220009  ! 3453: STF_R	st	%f5, [%r9, %r8]
	.word 0xd6720009  ! 3454: STX_R	stx	%r11, [%r8 + %r9]
	.word 0xca5a0009  ! 3454: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0x30800001  ! 3455: BA	ba,a	<label_0x1>
	.word 0xc87a2d70  ! 3456: SWAP_I	swap	%r4, [%r8 + 0x0d70]
	.word 0xc36a2cc4  ! 3457: PREFETCH_I	prefetch	[%r8 + 0x0cc4], #one_read
	.word 0x85a208a9  ! 3458: FSUBs	fsubs	%f8, %f9, %f2
	.word 0xc722249c  ! 3459: STF_I	st	%f3, [0x049c, %r8]
	.word 0x8143c000  ! 3460: STBAR	stbar
	.word 0xe47a2648  ! 3461: SWAP_I	swap	%r18, [%r8 + 0x0648]
	.word 0xc6022d00  ! 3462: LDUW_I	lduw	[%r8 + 0x0d00], %r3
	.word 0x8ad20009  ! 3463: UMULcc_R	umulcc 	%r8, %r9, %r5
	.word 0x8143c000  ! 3464: STBAR	stbar
	.word 0x26c20001  ! 3465: BRLZ	brlz,a,nt	%8,<label_0x20001>
	.word 0x8143c000  ! 3466: STBAR	stbar
	.word 0xce6a2ddc  ! 3467: LDSTUB_I	ldstub	%r7, [%r8 + 0x0ddc]
	.word 0xc42a0009  ! 3469: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc4420009  ! 3469: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xc2320009  ! 3471: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xce4a0009  ! 3471: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0x9ba208a9  ! 3472: FSUBs	fsubs	%f8, %f9, %f13
	.word 0xc26a22a0  ! 3473: LDSTUB_I	ldstub	%r1, [%r8 + 0x02a0]
	.word 0x8ed20009  ! 3474: UMULcc_R	umulcc 	%r8, %r9, %r7
	.word 0xe5e22009  ! 3475: CASA_R	casa	[%r8] %asi, %r9, %r18
	.word 0x8143c000  ! 3476: STBAR	stbar
	.word 0xca8a1009  ! 3477: LDUBA_R	lduba	[%r8, %r9] 0x80, %r5
	.word 0xc4720009  ! 3479: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xce520009  ! 3479: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xc4f21009  ! 3480: STXA_R	stxa	%r2, [%r8 + %r9] 0x80
	.word 0x20800001  ! 3481: BN	bn,a	<label_0x1>
	.word 0x8c5a0009  ! 3482: SMUL_R	smul 	%r8, %r9, %r6
	.word 0xdfe22009  ! 3483: CASA_R	casa	[%r8] %asi, %r9, %r15
	.word 0x87220009  ! 3484: MULScc_R	mulscc 	%r8, %r9, %r3
	.word 0xcb020009  ! 3485: LDF_R	ld	[%r8, %r9], %f5
	.word 0xb5a209a9  ! 3486: FDIVs	fdivs	%f8, %f9, %f26
	.word 0x8143c000  ! 3487: STBAR	stbar
	.word 0xc6220009  ! 3489: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xe11a0009  ! 3489: LDDF_R	ldd	[%r8, %r9], %f16
	.word 0xfe320009  ! 3491: STH_R	sth	%r31, [%r8 + %r9]
	.word 0xcd1a0009  ! 3491: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0x40000002  ! 3492: CALL	call	disp30_2
	.word 0xcca21009  ! 3493: STWA_R	stwa	%r6, [%r8 + %r9] 0x80
	.word 0xc36a0009  ! 3494: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0x0c800001  ! 3495: BNEG	bneg  	<label_0x1>
	.word 0x26ca0001  ! 3496: BRLZ	brlz,a,pt	%8,<label_0xa0001>
	.word 0xc7222c28  ! 3497: STF_I	st	%f3, [0x0c28, %r8]
	.word 0xdeaa224c  ! 3498: STBA_I	stba	%r15, [%r8 + 0x024c] %asi
	.word 0xc3ea1009  ! 3499: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xcaaa2518  ! 3500: STBA_I	stba	%r5, [%r8 + 0x0518] %asi
	.word 0xc7e21009  ! 3501: CASA_I	casa	[%r8] 0x80, %r9, %r3
	.word 0x884a0009  ! 3502: MULX_R	mulx 	%r8, %r9, %r4
	.word 0xfed22bfc  ! 3503: LDSHA_I	ldsha	[%r8, + 0x0bfc] %asi, %r31
	.word 0x82da0009  ! 3504: SMULcc_R	smulcc 	%r8, %r9, %r1
	.word 0xf3f21009  ! 3505: CASXA_I	casxa	[%r8] 0x80, %r9, %r25
	.word 0x26800001  ! 3506: BL	bl,a	<label_0x1>
	.word 0x8143c000  ! 3507: STBAR	stbar
	.word 0xfa1222bc  ! 3508: LDUH_I	lduh	[%r8 + 0x02bc], %r29
	.word 0xde2a0009  ! 3510: STB_R	stb	%r15, [%r8 + %r9]
	.word 0xcc0a0009  ! 3510: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0x84520009  ! 3511: UMUL_R	umul 	%r8, %r9, %r2
	.word 0x8143c000  ! 3512: STBAR	stbar
	.word 0xc6420009  ! 3513: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xcb3a0009  ! 3515: STDF_R	std	%f5, [%r9, %r8]
	.word 0xc4720009  ! 3516: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xca020009  ! 3516: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xa0fa21dc  ! 3517: SDIVcc_I	sdivcc 	%r8, 0x01dc, %r16
	.word 0x88520009  ! 3518: UMUL_R	umul 	%r8, %r9, %r4
	.word 0xf4fa1009  ! 3519: SWAPA_R	swapa	%r26, [%r8 + %r9] 0x80
	.word 0xce821009  ! 3520: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r7
	.word 0xdd3a0009  ! 3522: STDF_R	std	%f14, [%r9, %r8]
	.word 0xc2720009  ! 3523: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xe6020009  ! 3523: LDUW_R	lduw	[%r8 + %r9], %r19
	.word 0xcb220009  ! 3525: STF_R	st	%f5, [%r9, %r8]
	.word 0xc8720009  ! 3526: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xf4020009  ! 3526: LDUW_R	lduw	[%r8 + %r9], %r26
	.word 0xc5222d20  ! 3527: STF_I	st	%f2, [0x0d20, %r8]
	.word 0xc4220009  ! 3529: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xce0a0009  ! 3529: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xc8b21009  ! 3530: STHA_R	stha	%r4, [%r8 + %r9] 0x80
	.word 0x8143e05e  ! 3531: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0xc62a0009  ! 3533: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc44a0009  ! 3533: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0x32800002  ! 3534: BNE	bne,a	<label_0x2>
	.word 0xc3ea1009  ! 3535: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xaa6a0009  ! 3536: UDIVX_R	udivx 	%r8, %r9, %r21
	.word 0xc4aa1009  ! 3537: STBA_R	stba	%r2, [%r8 + %r9] 0x80
	.word 0xcc320009  ! 3539: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc4520009  ! 3539: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0x8a7a2de0  ! 3540: SDIV_I	sdiv 	%r8, 0x0de0, %r5
	.word 0x8143e029  ! 3541: MEMBAR	membar	#LoadLoad | #StoreStore | #MemIssue 
	.word 0xc6320009  ! 3543: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc41a0009  ! 3543: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x84522a24  ! 3544: UMUL_I	umul 	%r8, 0x0a24, %r2
	.word 0xc2aa1009  ! 3545: STBA_R	stba	%r1, [%r8 + %r9] 0x80
	.word 0x86d20009  ! 3546: UMULcc_R	umulcc 	%r8, %r9, %r3
	.word 0x22800002  ! 3547: BE	be,a	<label_0x2>
	.word 0x34800001  ! 3548: BG	bg,a	<label_0x1>
	.word 0xc52224e0  ! 3549: STF_I	st	%f2, [0x04e0, %r8]
	.word 0x896a0009  ! 3550: SDIVX_R	sdivx	%r8, %r9, %r4
	.word 0xf0da1009  ! 3551: LDXA_R	ldxa	[%r8, %r9] 0x80, %r24
	.word 0xc3ea1009  ! 3552: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xce2a0009  ! 3554: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xff020009  ! 3554: LDF_R	ld	[%r8, %r9], %f31
	.word 0xc4ea1009  ! 3555: LDSTUBA_R	ldstuba	%r2, [%r8 + %r9] 0x80
	.word 0x8e722864  ! 3556: UDIV_I	udiv 	%r8, 0x0864, %r7
	.word 0x8fa20829  ! 3557: FADDs	fadds	%f8, %f9, %f7
	.word 0xce6a2398  ! 3558: LDSTUB_I	ldstub	%r7, [%r8 + 0x0398]
	.word 0xc36a25c4  ! 3559: PREFETCH_I	prefetch	[%r8 + 0x05c4], #one_read
	.word 0x88fa0009  ! 3560: SDIVcc_R	sdivcc 	%r8, %r9, %r4
	.word 0xc9020009  ! 3561: LDF_R	ld	[%r8, %r9], %f4
	.word 0x824a28a0  ! 3562: MULX_I	mulx 	%r8, 0x08a0, %r1
	.word 0xce320009  ! 3564: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xdd1a0009  ! 3564: LDDF_R	ldd	[%r8, %r9], %f14
	.word 0xcbf22009  ! 3565: CASXA_R	casxa	[%r8]%asi, %r9, %r5
	.word 0xb66a0009  ! 3566: UDIVX_R	udivx 	%r8, %r9, %r27
	.word 0xc64227b8  ! 3567: LDSW_I	ldsw	[%r8 + 0x07b8], %r3
	.word 0xc8fa20b4  ! 3568: SWAPA_I	swapa	%r4, [%r8 + 0x00b4] %asi
	.word 0xcc220009  ! 3570: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xca0a0009  ! 3570: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0x8b6a2f84  ! 3571: SDIVX_I	sdivx	%r8, 0x0f84, %r5
	.word 0xc7220009  ! 3573: STF_R	st	%f3, [%r9, %r8]
	.word 0xe8720009  ! 3574: STX_R	stx	%r20, [%r8 + %r9]
	.word 0xd8120009  ! 3574: LDUH_R	lduh	[%r8 + %r9], %r12
	.word 0xcf3a2300  ! 3575: STDF_I	std	%f7, [0x0300, %r8]
	.word 0x8143e05b  ! 3576: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Lookaside | #Sync 
	.word 0xbad22584  ! 3577: UMULcc_I	umulcc 	%r8, 0x0584, %r29
	.word 0xcac21009  ! 3578: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r5
	.word 0x86f22528  ! 3579: UDIVcc_I	udivcc 	%r8, 0x0528, %r3
	.word 0xcc220009  ! 3581: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xde120009  ! 3581: LDUH_R	lduh	[%r8 + %r9], %r15
	.word 0xf6320009  ! 3583: STH_R	sth	%r27, [%r8 + %r9]
	.word 0xde520009  ! 3583: LDSH_R	ldsh	[%r8 + %r9], %r15
	.word 0xc4ea1009  ! 3584: LDSTUBA_R	ldstuba	%r2, [%r8 + %r9] 0x80
	.word 0x32800002  ! 3585: BNE	bne,a	<label_0x2>
	.word 0xc36a27f4  ! 3586: PREFETCH_I	prefetch	[%r8 + 0x07f4], #one_read
	.word 0xe13a0009  ! 3588: STDF_R	std	%f16, [%r9, %r8]
	.word 0xc2720009  ! 3589: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc6520009  ! 3589: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0x8e4a0009  ! 3590: MULX_R	mulx 	%r8, %r9, %r7
	.word 0x8143c000  ! 3591: STBAR	stbar
	.word 0xc6922978  ! 3592: LDUHA_I	lduha	[%r8, + 0x0978] %asi, %r3
	.word 0x8143e02f  ! 3593: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #MemIssue 
	.word 0x8143e07c  ! 3594: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0x8143e000  ! 3595: MEMBAR	membar	
	.word 0x8143e059  ! 3596: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside | #Sync 
	.word 0xc3e22009  ! 3597: CASA_R	casa	[%r8] %asi, %r9, %r1
	.word 0xc65a22b8  ! 3598: LDX_I	ldx	[%r8 + 0x02b8], %r3
	.word 0xc53a2a98  ! 3599: STDF_I	std	%f2, [0x0a98, %r8]
	.word 0xca020009  ! 3600: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xc6220009  ! 3602: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xcf020009  ! 3602: LDF_R	ld	[%r8, %r9], %f7
	.word 0xc4320009  ! 3604: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xe2520009  ! 3604: LDSH_R	ldsh	[%r8 + %r9], %r17
	.word 0xce320009  ! 3606: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc81a0009  ! 3606: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xf2ea1009  ! 3607: LDSTUBA_R	ldstuba	%r25, [%r8 + %r9] 0x80
	.word 0xc4da1009  ! 3608: LDXA_R	ldxa	[%r8, %r9] 0x80, %r2
	.word 0x96520009  ! 3609: UMUL_R	umul 	%r8, %r9, %r11
	.word 0x8143c000  ! 3610: STBAR	stbar
	.word 0x845a0009  ! 3611: SMUL_R	smul 	%r8, %r9, %r2
	.word 0xce02220c  ! 3612: LDUW_I	lduw	[%r8 + 0x020c], %r7
	.word 0xc3220009  ! 3614: STF_R	st	%f1, [%r9, %r8]
	.word 0xce720009  ! 3615: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xca4a0009  ! 3615: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xcb3a2c98  ! 3616: STDF_I	std	%f5, [0x0c98, %r8]
	.word 0xccba1009  ! 3617: STDA_R	stda	%r6, [%r8 + %r9] 0x80
	.word 0xca2a0009  ! 3619: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc6020009  ! 3619: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xc36a2e90  ! 3620: PREFETCH_I	prefetch	[%r8 + 0x0e90], #one_read
	.word 0x89a20929  ! 3621: FMULs	fmuls	%f8, %f9, %f4
	.word 0x8d6a0009  ! 3622: SDIVX_R	sdivx	%r8, %r9, %r6
	.word 0xc36a0009  ! 3623: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xfc422404  ! 3624: LDSW_I	ldsw	[%r8 + 0x0404], %r30
	.word 0xd73a2c58  ! 3625: STDF_I	std	%f11, [0x0c58, %r8]
	.word 0xc3ea1009  ! 3626: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x8143c000  ! 3627: STBAR	stbar
	.word 0xc3ea2370  ! 3628: PREFETCHA_I	prefetcha	[%r8, + 0x0370] %asi, #one_read
	.word 0xc6aa2cdc  ! 3629: STBA_I	stba	%r3, [%r8 + 0x0cdc] %asi
	.word 0xcd2227f4  ! 3630: STF_I	st	%f6, [0x07f4, %r8]
	.word 0x40000001  ! 3631: CALL	call	disp30_1
	.word 0x0cca0001  ! 3632: BRGZ	brgz  ,pt	%8,<label_0xa0001>
	.word 0x8143c000  ! 3633: STBAR	stbar
	.word 0xc93a2ac8  ! 3634: STDF_I	std	%f4, [0x0ac8, %r8]
	.word 0x04800001  ! 3635: BLE	ble  	<label_0x1>
	.word 0x34800001  ! 3636: BG	bg,a	<label_0x1>
	.word 0xe41a2b90  ! 3637: LDD_I	ldd	[%r8 + 0x0b90], %r18
	.word 0xc4ba1009  ! 3638: STDA_R	stda	%r2, [%r8 + %r9] 0x80
	.word 0xcc220009  ! 3640: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xec4a0009  ! 3640: LDSB_R	ldsb	[%r8 + %r9], %r22
	.word 0x3a800001  ! 3641: BCC	bcc,a	<label_0x1>
	.word 0xcab22be4  ! 3642: STHA_I	stha	%r5, [%r8 + 0x0be4] %asi
	.word 0xcbe21009  ! 3643: CASA_I	casa	[%r8] 0x80, %r9, %r5
	.word 0x8eda2fe0  ! 3644: SMULcc_I	smulcc 	%r8, 0x0fe0, %r7
	.word 0xc36a2de0  ! 3645: PREFETCH_I	prefetch	[%r8 + 0x0de0], #one_read
	.word 0xcc9a2ad0  ! 3646: LDDA_I	ldda	[%r8, + 0x0ad0] %asi, %r6
	.word 0xc7e22009  ! 3647: CASA_R	casa	[%r8] %asi, %r9, %r3
	.word 0xc42a0009  ! 3649: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xeb020009  ! 3649: LDF_R	ld	[%r8, %r9], %f21
	.word 0x8143c000  ! 3650: STBAR	stbar
	.word 0xf6b22250  ! 3651: STHA_I	stha	%r27, [%r8 + 0x0250] %asi
	.word 0xcaaa2abc  ! 3652: STBA_I	stba	%r5, [%r8 + 0x0abc] %asi
	.word 0xe4fa21f8  ! 3653: SWAPA_I	swapa	%r18, [%r8 + 0x01f8] %asi
	.word 0xc6fa1009  ! 3654: SWAPA_R	swapa	%r3, [%r8 + %r9] 0x80
	.word 0xc6120009  ! 3655: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xca320009  ! 3657: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xcd1a0009  ! 3657: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0x86da0009  ! 3658: SMULcc_R	smulcc 	%r8, %r9, %r3
	.word 0xd6821009  ! 3659: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r11
	.word 0xe6f22d80  ! 3660: STXA_I	stxa	%r19, [%r8 + 0x0d80] %asi
	.word 0xeaf223d0  ! 3661: STXA_I	stxa	%r21, [%r8 + 0x03d0] %asi
	.word 0xc3ea2ccc  ! 3662: PREFETCHA_I	prefetcha	[%r8, + 0x0ccc] %asi, #one_read
	.word 0xccea1009  ! 3663: LDSTUBA_R	ldstuba	%r6, [%r8 + %r9] 0x80
	.word 0xf6120009  ! 3664: LDUH_R	lduh	[%r8 + %r9], %r27
	.word 0xccda1009  ! 3665: LDXA_R	ldxa	[%r8, %r9] 0x80, %r6
	.word 0xab6a2608  ! 3666: SDIVX_I	sdivx	%r8, 0x0608, %r21
	.word 0xc6220009  ! 3668: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc91a0009  ! 3668: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xdc220009  ! 3670: STW_R	stw	%r14, [%r8 + %r9]
	.word 0xcd1a0009  ! 3670: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xc6922c64  ! 3671: LDUHA_I	lduha	[%r8, + 0x0c64] %asi, %r3
	.word 0xf8522ec0  ! 3672: LDSH_I	ldsh	[%r8 + 0x0ec0], %r28
	.word 0x885a232c  ! 3673: SMUL_I	smul 	%r8, 0x032c, %r4
	.word 0x8143c000  ! 3674: STBAR	stbar
	.word 0x824a0009  ! 3675: MULX_R	mulx 	%r8, %r9, %r1
	.word 0xc6320009  ! 3677: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xea120009  ! 3677: LDUH_R	lduh	[%r8 + %r9], %r21
	.word 0x22c20001  ! 3678: BRZ	brz,a,nt	%8,<label_0x20001>
	.word 0x8143e03d  ! 3679: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0x86fa2d6c  ! 3680: SDIVcc_I	sdivcc 	%r8, 0x0d6c, %r3
	.word 0x8e4a231c  ! 3681: MULX_I	mulx 	%r8, 0x031c, %r7
	.word 0xfe2a0009  ! 3683: STB_R	stb	%r31, [%r8 + %r9]
	.word 0xcc120009  ! 3683: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xceea2c4c  ! 3684: LDSTUBA_I	ldstuba	%r7, [%r8 + 0x0c4c] %asi
	.word 0x8ba20829  ! 3685: FADDs	fadds	%f8, %f9, %f5
	.word 0x887a0009  ! 3686: SDIV_R	sdiv 	%r8, %r9, %r4
	.word 0x8b6a0009  ! 3687: SDIVX_R	sdivx	%r8, %r9, %r5
	.word 0x10800001  ! 3688: BA	ba  	<label_0x1>
	.word 0x8143c000  ! 3689: STBAR	stbar
	.word 0xc4f22830  ! 3690: STXA_I	stxa	%r2, [%r8 + 0x0830] %asi
	.word 0x40000002  ! 3691: CALL	call	disp30_2
	.word 0xc8320009  ! 3693: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc6520009  ! 3693: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xfe220009  ! 3695: STW_R	stw	%r31, [%r8 + %r9]
	.word 0xc7020009  ! 3695: LDF_R	ld	[%r8, %r9], %f3
	.word 0xc8d21009  ! 3696: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r4
	.word 0x88522f3c  ! 3697: UMUL_I	umul 	%r8, 0x0f3c, %r4
	.word 0xdf220009  ! 3699: STF_R	st	%f15, [%r9, %r8]
	.word 0xc4720009  ! 3700: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xcc4a0009  ! 3700: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xc3ea2e64  ! 3701: PREFETCHA_I	prefetcha	[%r8, + 0x0e64] %asi, #one_read
	.word 0xc3ea21ec  ! 3702: PREFETCHA_I	prefetcha	[%r8, + 0x01ec] %asi, #one_read
	.word 0x8143e048  ! 3703: MEMBAR	membar	#StoreStore | #Sync 
	.word 0xe0d2251c  ! 3704: LDSHA_I	ldsha	[%r8, + 0x051c] %asi, %r16
	.word 0xce320009  ! 3706: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc71a0009  ! 3706: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xe48a257c  ! 3707: LDUBA_I	lduba	[%r8, + 0x057c] %asi, %r18
	.word 0x2aca0001  ! 3708: BRNZ	brnz,a,pt	%8,<label_0xa0001>
	.word 0xc2320009  ! 3710: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xe04a0009  ! 3710: LDSB_R	ldsb	[%r8 + %r9], %r16
	.word 0x8a4a0009  ! 3711: MULX_R	mulx 	%r8, %r9, %r5
	.word 0x8143e036  ! 3712: MEMBAR	membar	#StoreLoad | #LoadStore | #Lookaside | #MemIssue 
	.word 0x8143e06b  ! 3713: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #MemIssue | #Sync 
	.word 0x84720009  ! 3714: UDIV_R	udiv 	%r8, %r9, %r2
	.word 0x8fa208a9  ! 3715: FSUBs	fsubs	%f8, %f9, %f7
	.word 0xca4a0009  ! 3716: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xce220009  ! 3718: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xce5a0009  ! 3718: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0x12800002  ! 3719: BNE	bne  	<label_0x2>
	.word 0xf2aa2b84  ! 3720: STBA_I	stba	%r25, [%r8 + 0x0b84] %asi
	.word 0xc8220009  ! 3722: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc71a0009  ! 3722: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xee220009  ! 3724: STW_R	stw	%r23, [%r8 + %r9]
	.word 0xc41a0009  ! 3724: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xe47a0009  ! 3725: SWAP_R	swap	%r18, [%r8 + %r9]
	.word 0xb86a0009  ! 3726: UDIVX_R	udivx 	%r8, %r9, %r28
	.word 0xf8ba1009  ! 3727: STDA_R	stda	%r28, [%r8 + %r9] 0x80
	.word 0x16800002  ! 3728: BGE	bge  	<label_0x2>
	.word 0xfa220009  ! 3730: STW_R	stw	%r29, [%r8 + %r9]
	.word 0xc8520009  ! 3730: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xdab222e4  ! 3731: STHA_I	stha	%r13, [%r8 + 0x02e4] %asi
	.word 0xc36a0009  ! 3732: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc33a23a8  ! 3733: STDF_I	std	%f1, [0x03a8, %r8]
	.word 0x84da275c  ! 3734: SMULcc_I	smulcc 	%r8, 0x075c, %r2
	.word 0xc89a2ed8  ! 3735: LDDA_I	ldda	[%r8, + 0x0ed8] %asi, %r4
	.word 0x9ef222d4  ! 3736: UDIVcc_I	udivcc 	%r8, 0x02d4, %r15
	.word 0x8143e028  ! 3737: MEMBAR	membar	#StoreStore | #MemIssue 
	.word 0x8c6a260c  ! 3738: UDIVX_I	udivx 	%r8, 0x060c, %r6
	.word 0x9cfa0009  ! 3739: SDIVcc_R	sdivcc 	%r8, %r9, %r14
	.word 0xc51a0009  ! 3740: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0x97a209a9  ! 3741: FDIVs	fdivs	%f8, %f9, %f11
	.word 0x20800002  ! 3742: BN	bn,a	<label_0x2>
	.word 0xc53a0009  ! 3744: STDF_R	std	%f2, [%r9, %r8]
	.word 0xcc720009  ! 3745: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xda520009  ! 3745: LDSH_R	ldsh	[%r8 + %r9], %r13
	.word 0x8143c000  ! 3746: STBAR	stbar
	.word 0x99a20929  ! 3747: FMULs	fmuls	%f8, %f9, %f12
	.word 0xd71a0009  ! 3748: LDDF_R	ldd	[%r8, %r9], %f11
	.word 0xc7f22009  ! 3749: CASXA_R	casxa	[%r8]%asi, %r9, %r3
	.word 0x8143c000  ! 3750: STBAR	stbar
	.word 0x26800001  ! 3751: BL	bl,a	<label_0x1>
	.word 0xe53a2098  ! 3752: STDF_I	std	%f18, [0x0098, %r8]
	.word 0xef3a0009  ! 3754: STDF_R	std	%f23, [%r9, %r8]
	.word 0xc2720009  ! 3755: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xfd1a0009  ! 3755: LDDF_R	ldd	[%r8, %r9], %f30
	.word 0x8143c000  ! 3756: STBAR	stbar
	.word 0xf28a1009  ! 3757: LDUBA_R	lduba	[%r8, %r9] 0x80, %r25
	.word 0xc6ea22a4  ! 3758: LDSTUBA_I	ldstuba	%r3, [%r8 + 0x02a4] %asi
	.word 0xc3ea2030  ! 3759: PREFETCHA_I	prefetcha	[%r8, + 0x0030] %asi, #one_read
	.word 0xc7222020  ! 3760: STF_I	st	%f3, [0x0020, %r8]
	.word 0xdad22374  ! 3761: LDSHA_I	ldsha	[%r8, + 0x0374] %asi, %r13
	.word 0xc45a2be8  ! 3762: LDX_I	ldx	[%r8 + 0x0be8], %r2
	.word 0x86520009  ! 3763: UMUL_R	umul 	%r8, %r9, %r3
	.word 0xf0aa1009  ! 3764: STBA_R	stba	%r24, [%r8 + %r9] 0x80
	.word 0xcc9a24f0  ! 3765: LDDA_I	ldda	[%r8, + 0x04f0] %asi, %r6
	.word 0xc36a0009  ! 3766: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xb1a20829  ! 3767: FADDs	fadds	%f8, %f9, %f24
	.word 0x88fa2964  ! 3768: SDIVcc_I	sdivcc 	%r8, 0x0964, %r4
	.word 0x824a0009  ! 3769: MULX_R	mulx 	%r8, %r9, %r1
	.word 0xba5a244c  ! 3770: SMUL_I	smul 	%r8, 0x044c, %r29
	.word 0x8afa0009  ! 3771: SDIVcc_R	sdivcc 	%r8, %r9, %r5
	.word 0xc6320009  ! 3773: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc9020009  ! 3773: LDF_R	ld	[%r8, %r9], %f4
	.word 0x38800001  ! 3774: BGU	bgu,a	<label_0x1>
	.word 0xc3ea1009  ! 3775: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x04800002  ! 3776: BLE	ble  	<label_0x2>
	.word 0xd68a21c8  ! 3777: LDUBA_I	lduba	[%r8, + 0x01c8] %asi, %r11
	.word 0x8143c000  ! 3778: STBAR	stbar
	.word 0xf3222620  ! 3779: STF_I	st	%f25, [0x0620, %r8]
	.word 0x00800001  ! 3780: BN	bn  	<label_0x1>
	.word 0xcaca265c  ! 3781: LDSBA_I	ldsba	[%r8, + 0x065c] %asi, %r5
	.word 0x06800001  ! 3782: BL	bl  	<label_0x1>
	.word 0xc3220009  ! 3784: STF_R	st	%f1, [%r9, %r8]
	.word 0xf8720009  ! 3785: STX_R	stx	%r28, [%r8 + %r9]
	.word 0xea020009  ! 3785: LDUW_R	lduw	[%r8 + %r9], %r21
	.word 0x8ad20009  ! 3786: UMULcc_R	umulcc 	%r8, %r9, %r5
	.word 0xd8220009  ! 3788: STW_R	stw	%r12, [%r8 + %r9]
	.word 0xee020009  ! 3788: LDUW_R	lduw	[%r8 + %r9], %r23
	.word 0xcac229a0  ! 3789: LDSWA_I	ldswa	[%r8, + 0x09a0] %asi, %r5
	.word 0xca220009  ! 3791: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc4420009  ! 3791: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0x8d6a2de8  ! 3792: SDIVX_I	sdivx	%r8, 0x0de8, %r6
	.word 0xbc6a0009  ! 3793: UDIVX_R	udivx 	%r8, %r9, %r30
	.word 0xc36a25e8  ! 3794: PREFETCH_I	prefetch	[%r8 + 0x05e8], #one_read
	.word 0x8d6a0009  ! 3795: SDIVX_R	sdivx	%r8, %r9, %r6
	.word 0x8143c000  ! 3796: STBAR	stbar
	.word 0x8a7a0009  ! 3797: SDIV_R	sdiv 	%r8, %r9, %r5
	.word 0xd8ba1009  ! 3798: STDA_R	stda	%r12, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 3799: STBAR	stbar
	.word 0xdeea2848  ! 3800: LDSTUBA_I	ldstuba	%r15, [%r8 + 0x0848] %asi
	.word 0xf28a2308  ! 3801: LDUBA_I	lduba	[%r8, + 0x0308] %asi, %r25
	.word 0xfada2300  ! 3802: LDXA_I	ldxa	[%r8, + 0x0300] %asi, %r29
	.word 0xc36a2404  ! 3803: PREFETCH_I	prefetch	[%r8 + 0x0404], #one_read
	.word 0xcc0a255c  ! 3804: LDUB_I	ldub	[%r8 + 0x055c], %r6
	.word 0x83a20929  ! 3805: FMULs	fmuls	%f8, %f9, %f1
	.word 0xfaea2e34  ! 3806: LDSTUBA_I	ldstuba	%r29, [%r8 + 0x0e34] %asi
	.word 0xc86a263c  ! 3807: LDSTUB_I	ldstub	%r4, [%r8 + 0x063c]
	.word 0xc3ea1009  ! 3808: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc44a29f4  ! 3809: LDSB_I	ldsb	[%r8 + 0x09f4], %r2
	.word 0xe0f22318  ! 3810: STXA_I	stxa	%r16, [%r8 + 0x0318] %asi
	.word 0xc6da1009  ! 3811: LDXA_R	ldxa	[%r8, %r9] 0x80, %r3
	.word 0xa86a2cf8  ! 3812: UDIVX_I	udivx 	%r8, 0x0cf8, %r20
	.word 0xec8a1009  ! 3813: LDUBA_R	lduba	[%r8, %r9] 0x80, %r22
	.word 0xcd2227b4  ! 3814: STF_I	st	%f6, [0x07b4, %r8]
	.word 0xf8220009  ! 3816: STW_R	stw	%r28, [%r8 + %r9]
	.word 0xce020009  ! 3816: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0x1a800001  ! 3817: BCC	bcc  	<label_0x1>
	.word 0xc41a2398  ! 3818: LDD_I	ldd	[%r8 + 0x0398], %r2
	.word 0xc4b21009  ! 3819: STHA_R	stha	%r2, [%r8 + %r9] 0x80
	.word 0xaef224b0  ! 3820: UDIVcc_I	udivcc 	%r8, 0x04b0, %r23
	.word 0xeab228c4  ! 3821: STHA_I	stha	%r21, [%r8 + 0x08c4] %asi
	.word 0x34800001  ! 3822: BG	bg,a	<label_0x1>
	.word 0xc33a0009  ! 3824: STDF_R	std	%f1, [%r9, %r8]
	.word 0xe6720009  ! 3825: STX_R	stx	%r19, [%r8 + %r9]
	.word 0xc85a0009  ! 3825: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xb7a208a9  ! 3826: FSUBs	fsubs	%f8, %f9, %f27
	.word 0xc24a0009  ! 3827: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xc3ea1009  ! 3828: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x99a208a9  ! 3829: FSUBs	fsubs	%f8, %f9, %f12
	.word 0xe6aa2a24  ! 3830: STBA_I	stba	%r19, [%r8 + 0x0a24] %asi
	.word 0x8143e07b  ! 3831: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xc21223a0  ! 3832: LDUH_I	lduh	[%r8 + 0x03a0], %r1
	.word 0x8a5a0009  ! 3833: SMUL_R	smul 	%r8, %r9, %r5
	.word 0xc6220009  ! 3835: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xcc5a0009  ! 3835: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0x976a2a30  ! 3836: SDIVX_I	sdivx	%r8, 0x0a30, %r11
	.word 0xc3ea1009  ! 3837: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xd68a1009  ! 3838: LDUBA_R	lduba	[%r8, %r9] 0x80, %r11
	.word 0x2e800001  ! 3839: BVS	bvs,a	<label_0x1>
	.word 0xc8ba1009  ! 3840: STDA_R	stda	%r4, [%r8 + %r9] 0x80
	.word 0xe2220009  ! 3842: STW_R	stw	%r17, [%r8 + %r9]
	.word 0xda420009  ! 3842: LDSW_R	ldsw	[%r8 + %r9], %r13
	.word 0xb47a0009  ! 3843: SDIV_R	sdiv 	%r8, %r9, %r26
	.word 0xc81a2288  ! 3844: LDD_I	ldd	[%r8 + 0x0288], %r4
	.word 0xc62a0009  ! 3846: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xcc120009  ! 3846: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0x24c20001  ! 3847: BRLEZ	brlez,a,nt	%8,<label_0x20001>
	.word 0xdd022030  ! 3848: LDF_I	ld	[%r8, 0x0030], %f14
	.word 0x96fa0009  ! 3849: SDIVcc_R	sdivcc 	%r8, %r9, %r11
	.word 0xc3022114  ! 3850: LDF_I	ld	[%r8, 0x0114], %f1
	.word 0xe84a2ecc  ! 3851: LDSB_I	ldsb	[%r8 + 0x0ecc], %r20
	.word 0x83a208a9  ! 3852: FSUBs	fsubs	%f8, %f9, %f1
	.word 0xcc9a2758  ! 3853: LDDA_I	ldda	[%r8, + 0x0758] %asi, %r6
	.word 0xc6220009  ! 3855: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc6120009  ! 3855: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xc692296c  ! 3856: LDUHA_I	lduha	[%r8, + 0x096c] %asi, %r3
	.word 0xc4ca1009  ! 3857: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r2
	.word 0xccfa26d0  ! 3858: SWAPA_I	swapa	%r6, [%r8 + 0x06d0] %asi
	.word 0x8143e065  ! 3859: MEMBAR	membar	#LoadLoad | #LoadStore | #MemIssue | #Sync 
	.word 0xf42a0009  ! 3861: STB_R	stb	%r26, [%r8 + %r9]
	.word 0xec020009  ! 3861: LDUW_R	lduw	[%r8 + %r9], %r22
	.word 0xeac22ff0  ! 3862: LDSWA_I	ldswa	[%r8, + 0x0ff0] %asi, %r21
	.word 0xc4ca28a8  ! 3863: LDSBA_I	ldsba	[%r8, + 0x08a8] %asi, %r2
	.word 0xfc220009  ! 3865: STW_R	stw	%r30, [%r8 + %r9]
	.word 0xc8120009  ! 3865: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xb6da0009  ! 3866: SMULcc_R	smulcc 	%r8, %r9, %r27
	.word 0xdaca2a1c  ! 3867: LDSBA_I	ldsba	[%r8, + 0x0a1c] %asi, %r13
	.word 0x9fa20929  ! 3868: FMULs	fmuls	%f8, %f9, %f15
	.word 0xc6320009  ! 3870: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xca420009  ! 3870: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xce6a2c2c  ! 3871: LDSTUB_I	ldstub	%r7, [%r8 + 0x0c2c]
	.word 0xcc320009  ! 3873: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xcc1a0009  ! 3873: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xc8220009  ! 3875: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc31a0009  ! 3875: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xc36a2dc8  ! 3876: PREFETCH_I	prefetch	[%r8 + 0x0dc8], #one_read
	.word 0xcd3a0009  ! 3878: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc4720009  ! 3879: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc85a0009  ! 3879: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xe4b22b6c  ! 3880: STHA_I	stha	%r18, [%r8 + 0x0b6c] %asi
	.word 0xceea1009  ! 3881: LDSTUBA_R	ldstuba	%r7, [%r8 + %r9] 0x80
	.word 0x28800001  ! 3882: BLEU	bleu,a	<label_0x1>
	.word 0x0aca0001  ! 3883: BRNZ	brnz  ,pt	%8,<label_0xa0001>
	.word 0xc09a2080  ! 3884: LDDA_I	ldda	[%r8, + 0x0080] %asi, %r0
	.word 0x10800002  ! 3885: BA	ba  	<label_0x2>
	.word 0x826a0009  ! 3886: UDIVX_R	udivx 	%r8, %r9, %r1
	.word 0xc2a21009  ! 3887: STWA_R	stwa	%r1, [%r8 + %r9] 0x80
	.word 0xf0220009  ! 3889: STW_R	stw	%r24, [%r8 + %r9]
	.word 0xc4520009  ! 3889: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0x38800001  ! 3890: BGU	bgu,a	<label_0x1>
	.word 0xc6320009  ! 3892: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xcd1a0009  ! 3892: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0x2ec20001  ! 3893: BRGEZ	brgez,a,nt	%8,<label_0x20001>
	.word 0x8efa0009  ! 3894: SDIVcc_R	sdivcc 	%r8, %r9, %r7
	.word 0xc8da2900  ! 3895: LDXA_I	ldxa	[%r8, + 0x0900] %asi, %r4
	.word 0xc48a1009  ! 3896: LDUBA_R	lduba	[%r8, %r9] 0x80, %r2
	.word 0xc89a2a30  ! 3897: LDDA_I	ldda	[%r8, + 0x0a30] %asi, %r4
	.word 0xceea2b7c  ! 3898: LDSTUBA_I	ldstuba	%r7, [%r8 + 0x0b7c] %asi
	.word 0xf8ca2a40  ! 3899: LDSBA_I	ldsba	[%r8, + 0x0a40] %asi, %r28
	.word 0xc8ba26b8  ! 3900: STDA_I	stda	%r4, [%r8 + 0x06b8] %asi
	.word 0xc86a0009  ! 3901: LDSTUB_R	ldstub	%r4, [%r8 + %r9]
	.word 0xc36a0009  ! 3902: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xe7f21009  ! 3903: CASXA_I	casxa	[%r8] 0x80, %r9, %r19
	.word 0xb24a0009  ! 3904: MULX_R	mulx 	%r8, %r9, %r25
	.word 0x8143c000  ! 3905: STBAR	stbar
	.word 0xc93a2cd8  ! 3906: STDF_I	std	%f4, [0x0cd8, %r8]
	.word 0xce020009  ! 3907: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xcfe22009  ! 3908: CASA_R	casa	[%r8] %asi, %r9, %r7
	.word 0xc8320009  ! 3910: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xcc120009  ! 3910: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xe0422794  ! 3911: LDSW_I	ldsw	[%r8 + 0x0794], %r16
	.word 0xeeaa24b0  ! 3912: STBA_I	stba	%r23, [%r8 + 0x04b0] %asi
	.word 0xce320009  ! 3914: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xf4420009  ! 3914: LDSW_R	ldsw	[%r8 + %r9], %r26
	.word 0xc82a0009  ! 3916: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xcc1a0009  ! 3916: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xdcfa1009  ! 3917: SWAPA_R	swapa	%r14, [%r8 + %r9] 0x80
	.word 0xc53a0009  ! 3919: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc4720009  ! 3920: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc6020009  ! 3920: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xc89a25a8  ! 3921: LDDA_I	ldda	[%r8, + 0x05a8] %asi, %r4
	.word 0xc8220009  ! 3923: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc84a0009  ! 3923: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xc65a0009  ! 3924: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xc2b22110  ! 3925: STHA_I	stha	%r1, [%r8 + 0x0110] %asi
	.word 0x0a800002  ! 3926: BCS	bcs  	<label_0x2>
	.word 0x84720009  ! 3927: UDIV_R	udiv 	%r8, %r9, %r2
	.word 0x8143c000  ! 3928: STBAR	stbar
	.word 0xbba20929  ! 3929: FMULs	fmuls	%f8, %f9, %f29
	.word 0xc9020009  ! 3930: LDF_R	ld	[%r8, %r9], %f4
	.word 0x8143e013  ! 3931: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside 
	.word 0x8ba208a9  ! 3932: FSUBs	fsubs	%f8, %f9, %f5
	.word 0xca6a2c84  ! 3933: LDSTUB_I	ldstub	%r5, [%r8 + 0x0c84]
	.word 0xc4f21009  ! 3934: STXA_R	stxa	%r2, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 3935: STBAR	stbar
	.word 0x00800001  ! 3936: BN	bn  	<label_0x1>
	.word 0xf27a2234  ! 3937: SWAP_I	swap	%r25, [%r8 + 0x0234]
	.word 0xcef22718  ! 3938: STXA_I	stxa	%r7, [%r8 + 0x0718] %asi
	.word 0xe85a0009  ! 3939: LDX_R	ldx	[%r8 + %r9], %r20
	.word 0xc8720009  ! 3941: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xee420009  ! 3941: LDSW_R	ldsw	[%r8 + %r9], %r23
	.word 0xc36a0009  ! 3942: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0x86520009  ! 3943: UMUL_R	umul 	%r8, %r9, %r3
	.word 0xf8fa2810  ! 3944: SWAPA_I	swapa	%r28, [%r8 + 0x0810] %asi
	.word 0xccfa1009  ! 3945: SWAPA_R	swapa	%r6, [%r8 + %r9] 0x80
	.word 0xcf1a2ba0  ! 3946: LDDF_I	ldd	[%r8, 0x0ba0], %f7
	.word 0xcaa22128  ! 3947: STWA_I	stwa	%r5, [%r8 + 0x0128] %asi
	.word 0x82da0009  ! 3948: SMULcc_R	smulcc 	%r8, %r9, %r1
	.word 0xc2fa25a8  ! 3949: SWAPA_I	swapa	%r1, [%r8 + 0x05a8] %asi
	.word 0xf6220009  ! 3951: STW_R	stw	%r27, [%r8 + %r9]
	.word 0xca020009  ! 3951: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0x8143c000  ! 3952: STBAR	stbar
	.word 0x8eda0009  ! 3953: SMULcc_R	smulcc 	%r8, %r9, %r7
	.word 0x8a5a0009  ! 3954: SMUL_R	smul 	%r8, %r9, %r5
	.word 0xcc822d40  ! 3955: LDUWA_I	lduwa	[%r8, + 0x0d40] %asi, %r6
	.word 0xce220009  ! 3957: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xe31a0009  ! 3957: LDDF_R	ldd	[%r8, %r9], %f17
	.word 0xa1220009  ! 3958: MULScc_R	mulscc 	%r8, %r9, %r16
	.word 0xc93a0009  ! 3960: STDF_R	std	%f4, [%r9, %r8]
	.word 0xc2720009  ! 3961: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc4520009  ! 3961: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0x8143e058  ! 3962: MEMBAR	membar	#StoreStore | #Lookaside | #Sync 
	.word 0x8143c000  ! 3963: STBAR	stbar
	.word 0xfb3a2d50  ! 3964: STDF_I	std	%f29, [0x0d50, %r8]
	.word 0xc8f22188  ! 3965: STXA_I	stxa	%r4, [%r8 + 0x0188] %asi
	.word 0xc47a0009  ! 3966: SWAP_R	swap	%r2, [%r8 + %r9]
	.word 0xc9e21009  ! 3967: CASA_I	casa	[%r8] 0x80, %r9, %r4
	.word 0xeeaa1009  ! 3968: STBA_R	stba	%r23, [%r8 + %r9] 0x80
	.word 0xc73a2e60  ! 3969: STDF_I	std	%f3, [0x0e60, %r8]
	.word 0xef220009  ! 3971: STF_R	st	%f23, [%r9, %r8]
	.word 0xfe720009  ! 3972: STX_R	stx	%r31, [%r8 + %r9]
	.word 0xc3020009  ! 3972: LDF_R	ld	[%r8, %r9], %f1
	.word 0xc3ea2380  ! 3973: PREFETCHA_I	prefetcha	[%r8, + 0x0380] %asi, #one_read
	.word 0xc3ea1009  ! 3974: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x8d2227e0  ! 3975: MULScc_I	mulscc 	%r8, 0x07e0, %r6
	.word 0xc72222f8  ! 3976: STF_I	st	%f3, [0x02f8, %r8]
	.word 0xe6720009  ! 3978: STX_R	stx	%r19, [%r8 + %r9]
	.word 0xc24a0009  ! 3978: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0x8a4a2070  ! 3979: MULX_I	mulx 	%r8, 0x0070, %r5
	.word 0xc85a2d48  ! 3980: LDX_I	ldx	[%r8 + 0x0d48], %r4
	.word 0x0c800002  ! 3981: BNEG	bneg  	<label_0x2>
	.word 0xde7a21c4  ! 3982: SWAP_I	swap	%r15, [%r8 + 0x01c4]
	.word 0x8143c000  ! 3983: STBAR	stbar
	.word 0xceca2798  ! 3984: LDSBA_I	ldsba	[%r8, + 0x0798] %asi, %r7
	.word 0xc8320009  ! 3986: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc81a0009  ! 3986: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x8da20929  ! 3987: FMULs	fmuls	%f8, %f9, %f6
	.word 0xcea22c40  ! 3988: STWA_I	stwa	%r7, [%r8 + 0x0c40] %asi
	.word 0x84d22678  ! 3989: UMULcc_I	umulcc 	%r8, 0x0678, %r2
	.word 0xc22a0009  ! 3991: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc8120009  ! 3991: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xe0fa2074  ! 3992: SWAPA_I	swapa	%r16, [%r8 + 0x0074] %asi
	.word 0x8143c000  ! 3993: STBAR	stbar
	.word 0xc3ea1009  ! 3994: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x82da0009  ! 3995: SMULcc_R	smulcc 	%r8, %r9, %r1
	.word 0xc4320009  ! 3997: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc4020009  ! 3997: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xc4aa1009  ! 3998: STBA_R	stba	%r2, [%r8 + %r9] 0x80
	.word 0xc8f21009  ! 3999: STXA_R	stxa	%r4, [%r8 + %r9] 0x80
        ta      T_GOOD_TRAP

th_main_2:
        setx  MAIN_BASE_DATA_VA, %r1, %r8
        setx  0x0000000000000240, %g1, %r9
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
        setx  0x5bcb77ce324c4aeb, %g1, %r0
        setx  0xf4827a53b6bfc94b, %g1, %r1
        setx  0x5ff64cb6e9f911dd, %g1, %r2
        setx  0xedae56c1122233ea, %g1, %r3
        setx  0xa4c8e1fea18da88d, %g1, %r4
        setx  0x73f0234fb272a0d1, %g1, %r5
        setx  0xc6781074b4f57ece, %g1, %r6
        setx  0x137484eba10193c7, %g1, %r7
        setx  0x94391cfcb951fc12, %g1, %r10
        setx  0x6eeb88f68472af8b, %g1, %r11
        setx  0x147053d363779850, %g1, %r12
        setx  0x286b90c2ab3d98c3, %g1, %r13
        setx  0xfb261a31aa3f067c, %g1, %r14
        setx  0xd91ae140e0a7d68c, %g1, %r15
        setx  0x965d8c1e72319eac, %g1, %r16
        setx  0xa5ab654862ba5616, %g1, %r17
        setx  0xef49eac80eab1e68, %g1, %r18
        setx  0x24d6a3e86354bd48, %g1, %r19
        setx  0xaa334c901f893140, %g1, %r20
        setx  0xa4fcf20a864b0998, %g1, %r21
        setx  0xc65ea9c8ad5f1820, %g1, %r22
        setx  0x6a98fff462b41946, %g1, %r23
        setx  0x533f03888a0dcd50, %g1, %r24
        setx  0x71dbf93e67f5003c, %g1, %r25
        setx  0xd3560b37895de55d, %g1, %r26
        setx  0x5e711f0a85df89d8, %g1, %r27
        setx  0x57d3dd74a55e6a56, %g1, %r28
        setx  0x5723f1dcb12effec, %g1, %r29
        setx  0x281afcc2d80050f4, %g1, %r30
        setx  0x9541794447d1404f, %g1, %r31
	.word 0xfaa22e10  ! 1: STWA_I	stwa	%r29, [%r8 + 0x0e10] %asi
	.word 0x88fa0009  ! 2: SDIVcc_R	sdivcc 	%r8, %r9, %r4
	.word 0xc6320009  ! 4: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xca520009  ! 4: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xa6da279c  ! 5: SMULcc_I	smulcc 	%r8, 0x079c, %r19
	.word 0xcf1a0009  ! 6: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xc4a21009  ! 7: STWA_R	stwa	%r2, [%r8 + %r9] 0x80
	.word 0x8143e051  ! 8: MEMBAR	membar	#LoadLoad | #Lookaside | #Sync 
	.word 0xc36a2268  ! 9: PREFETCH_I	prefetch	[%r8 + 0x0268], #one_read
	.word 0xc4ca216c  ! 10: LDSBA_I	ldsba	[%r8, + 0x016c] %asi, %r2
	.word 0x0e800002  ! 11: BVS	bvs  	<label_0x2>
	.word 0xc3ea1009  ! 12: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xba5a289c  ! 13: SMUL_I	smul 	%r8, 0x089c, %r29
	.word 0xc3ea1009  ! 14: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x0a800001  ! 15: BCS	bcs  	<label_0x1>
	.word 0xbb6a21b0  ! 16: SDIVX_I	sdivx	%r8, 0x01b0, %r29
	.word 0xdaaa2970  ! 17: STBA_I	stba	%r13, [%r8 + 0x0970] %asi
	.word 0xc36a2e10  ! 18: PREFETCH_I	prefetch	[%r8 + 0x0e10], #one_read
	.word 0xc4220009  ! 20: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc20a0009  ! 20: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xcc420009  ! 21: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xc31a22c8  ! 22: LDDF_I	ldd	[%r8, 0x02c8], %f1
	.word 0xb652267c  ! 23: UMUL_I	umul 	%r8, 0x067c, %r27
	.word 0x9ad20009  ! 24: UMULcc_R	umulcc 	%r8, %r9, %r13
	.word 0xc2f229a0  ! 25: STXA_I	stxa	%r1, [%r8 + 0x09a0] %asi
	.word 0xca0a2854  ! 26: LDUB_I	ldub	[%r8 + 0x0854], %r5
	.word 0xf13a0009  ! 28: STDF_R	std	%f24, [%r9, %r8]
	.word 0xc2720009  ! 29: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xf31a0009  ! 29: LDDF_R	ldd	[%r8, %r9], %f25
	.word 0xcc0a0009  ! 30: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xcea22a88  ! 31: STWA_I	stwa	%r7, [%r8 + 0x0a88] %asi
	.word 0x887a2e8c  ! 32: SDIV_I	sdiv 	%r8, 0x0e8c, %r4
	.word 0xc3ea1009  ! 33: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x8143c000  ! 34: STBAR	stbar
	.word 0xd60a0009  ! 35: LDUB_R	ldub	[%r8 + %r9], %r11
	.word 0xdc320009  ! 37: STH_R	sth	%r14, [%r8 + %r9]
	.word 0xc44a0009  ! 37: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xea8a22cc  ! 38: LDUBA_I	lduba	[%r8, + 0x02cc] %asi, %r21
	.word 0xce2a0009  ! 40: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc01a0009  ! 40: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0xde4a27c0  ! 41: LDSB_I	ldsb	[%r8 + 0x07c0], %r15
	.word 0x02ca0001  ! 42: BRZ	brz  ,pt	%8,<label_0xa0001>
	.word 0x8143e02a  ! 43: MEMBAR	membar	#StoreLoad | #StoreStore | #MemIssue 
	.word 0xc36a0009  ! 44: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc9e22009  ! 45: CASA_R	casa	[%r8] %asi, %r9, %r4
	.word 0x8b6a297c  ! 46: SDIVX_I	sdivx	%r8, 0x097c, %r5
	.word 0x84da0009  ! 47: SMULcc_R	smulcc 	%r8, %r9, %r2
	.word 0xc6ea26f0  ! 48: LDSTUBA_I	ldstuba	%r3, [%r8 + 0x06f0] %asi
	.word 0xc73a2040  ! 49: STDF_I	std	%f3, [0x0040, %r8]
	.word 0xd6220009  ! 51: STW_R	stw	%r11, [%r8 + %r9]
	.word 0xee5a0009  ! 51: LDX_R	ldx	[%r8 + %r9], %r23
	.word 0xe81a2e28  ! 52: LDD_I	ldd	[%r8 + 0x0e28], %r20
	.word 0xccfa1009  ! 53: SWAPA_R	swapa	%r6, [%r8 + %r9] 0x80
	.word 0x87a20829  ! 54: FADDs	fadds	%f8, %f9, %f3
	.word 0xc2320009  ! 56: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc91a0009  ! 56: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xcfe22009  ! 57: CASA_R	casa	[%r8] %asi, %r9, %r7
	.word 0xc9022820  ! 58: LDF_I	ld	[%r8, 0x0820], %f4
	.word 0xc68a2d48  ! 59: LDUBA_I	lduba	[%r8, + 0x0d48] %asi, %r3
	.word 0x827229f0  ! 60: UDIV_I	udiv 	%r8, 0x09f0, %r1
	.word 0x8143e00f  ! 61: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore 
	.word 0xe06a2260  ! 62: LDSTUB_I	ldstub	%r16, [%r8 + 0x0260]
	.word 0xcd220009  ! 64: STF_R	st	%f6, [%r9, %r8]
	.word 0xc4720009  ! 65: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xec4a0009  ! 65: LDSB_R	ldsb	[%r8 + %r9], %r22
	.word 0x3c800002  ! 66: BPOS	bpos,a	<label_0x2>
	.word 0xac520009  ! 67: UMUL_R	umul 	%r8, %r9, %r22
	.word 0x8143e055  ! 68: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside | #Sync 
	.word 0x8143e031  ! 69: MEMBAR	membar	#LoadLoad | #Lookaside | #MemIssue 
	.word 0xe8220009  ! 71: STW_R	stw	%r20, [%r8 + %r9]
	.word 0xcc1a0009  ! 71: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xc3ea1009  ! 72: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xcd220009  ! 74: STF_R	st	%f6, [%r9, %r8]
	.word 0xd8720009  ! 75: STX_R	stx	%r12, [%r8 + %r9]
	.word 0xcc520009  ! 75: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0x8143c000  ! 76: STBAR	stbar
	.word 0xa3a208a9  ! 77: FSUBs	fsubs	%f8, %f9, %f17
	.word 0xc60a0009  ! 78: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0x3c800001  ! 79: BPOS	bpos,a	<label_0x1>
	.word 0x02800001  ! 80: BE	be  	<label_0x1>
	.word 0x8b222de0  ! 81: MULScc_I	mulscc 	%r8, 0x0de0, %r5
	.word 0x00800002  ! 82: BN	bn  	<label_0x2>
	.word 0xc8f21009  ! 83: STXA_R	stxa	%r4, [%r8 + %r9] 0x80
	.word 0xc4aa2d04  ! 84: STBA_I	stba	%r2, [%r8 + 0x0d04] %asi
	.word 0x8143e00b  ! 85: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore 
	.word 0xc3ea2f90  ! 86: PREFETCHA_I	prefetcha	[%r8, + 0x0f90] %asi, #one_read
	.word 0xca5a2448  ! 87: LDX_I	ldx	[%r8 + 0x0448], %r5
	.word 0x8143c000  ! 88: STBAR	stbar
	.word 0xa0722ef8  ! 89: UDIV_I	udiv 	%r8, 0x0ef8, %r16
	.word 0xca220009  ! 91: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xcf1a0009  ! 91: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xe6320009  ! 93: STH_R	sth	%r19, [%r8 + %r9]
	.word 0xcc5a0009  ! 93: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xceaa1009  ! 94: STBA_R	stba	%r7, [%r8 + %r9] 0x80
	.word 0x9eda0009  ! 95: SMULcc_R	smulcc 	%r8, %r9, %r15
	.word 0xc322298c  ! 96: STF_I	st	%f1, [0x098c, %r8]
	.word 0x836a200c  ! 97: SDIVX_I	sdivx	%r8, 0x000c, %r1
	.word 0x86522198  ! 98: UMUL_I	umul 	%r8, 0x0198, %r3
	.word 0x06c20001  ! 99: BRLZ	brlz  ,nt	%8,<label_0x20001>
	.word 0xcd3a2cc8  ! 100: STDF_I	std	%f6, [0x0cc8, %r8]
	.word 0xe2320009  ! 102: STH_R	sth	%r17, [%r8 + %r9]
	.word 0xc2120009  ! 102: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xcaa2235c  ! 103: STWA_I	stwa	%r5, [%r8 + 0x035c] %asi
	.word 0xc6320009  ! 105: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xce5a0009  ! 105: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xc3ea2ea8  ! 106: PREFETCHA_I	prefetcha	[%r8, + 0x0ea8] %asi, #one_read
	.word 0xcbf22009  ! 107: CASXA_R	casxa	[%r8]%asi, %r9, %r5
	.word 0x83222acc  ! 108: MULScc_I	mulscc 	%r8, 0x0acc, %r1
	.word 0xc36a0009  ! 109: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0x87a209a9  ! 110: FDIVs	fdivs	%f8, %f9, %f3
	.word 0xc4921009  ! 111: LDUHA_R	lduha	[%r8, %r9] 0x80, %r2
	.word 0xc47a288c  ! 112: SWAP_I	swap	%r2, [%r8 + 0x088c]
	.word 0x0aca0001  ! 113: BRNZ	brnz  ,pt	%8,<label_0xa0001>
	.word 0xef222000  ! 114: STF_I	st	%f23, [0x0000, %r8]
	.word 0x8143c000  ! 115: STBAR	stbar
	.word 0xcb020009  ! 116: LDF_R	ld	[%r8, %r9], %f5
	.word 0x86f20009  ! 117: UDIVcc_R	udivcc 	%r8, %r9, %r3
	.word 0x824a20e0  ! 118: MULX_I	mulx 	%r8, 0x00e0, %r1
	.word 0xc3f21009  ! 119: CASXA_I	casxa	[%r8] 0x80, %r9, %r1
	.word 0xb9a20829  ! 120: FADDs	fadds	%f8, %f9, %f28
	.word 0xf05a0009  ! 121: LDX_R	ldx	[%r8 + %r9], %r24
	.word 0xf81a2848  ! 122: LDD_I	ldd	[%r8 + 0x0848], %r28
	.word 0xc36a0009  ! 123: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0x12800001  ! 124: BNE	bne  	<label_0x1>
	.word 0x8143e072  ! 125: MEMBAR	membar	#StoreLoad | #Lookaside | #MemIssue | #Sync 
	.word 0xe8320009  ! 127: STH_R	sth	%r20, [%r8 + %r9]
	.word 0xc8120009  ! 127: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xeaf22c70  ! 128: STXA_I	stxa	%r21, [%r8 + 0x0c70] %asi
	.word 0xc4da1009  ! 129: LDXA_R	ldxa	[%r8, %r9] 0x80, %r2
	.word 0xe0d21009  ! 130: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r16
	.word 0xc4d21009  ! 131: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r2
	.word 0xb5a20929  ! 132: FMULs	fmuls	%f8, %f9, %f26
	.word 0x856a0009  ! 133: SDIVX_R	sdivx	%r8, %r9, %r2
	.word 0x8143c000  ! 134: STBAR	stbar
	.word 0xc8220009  ! 136: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xf41a0009  ! 136: LDD_R	ldd	[%r8 + %r9], %r26
	.word 0x8da208a9  ! 137: FSUBs	fsubs	%f8, %f9, %f6
	.word 0xc3ea2dd4  ! 138: PREFETCHA_I	prefetcha	[%r8, + 0x0dd4] %asi, #one_read
	.word 0xd9e22009  ! 139: CASA_R	casa	[%r8] %asi, %r9, %r12
	.word 0x83a20829  ! 140: FADDs	fadds	%f8, %f9, %f1
	.word 0xc8720009  ! 142: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xf2520009  ! 142: LDSH_R	ldsh	[%r8 + %r9], %r25
	.word 0x85a208a9  ! 143: FSUBs	fsubs	%f8, %f9, %f2
	.word 0x8143e002  ! 144: MEMBAR	membar	#StoreLoad 
	.word 0x82da277c  ! 145: SMULcc_I	smulcc 	%r8, 0x077c, %r1
	.word 0x16800001  ! 146: BGE	bge  	<label_0x1>
	.word 0xc6720009  ! 148: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xd6020009  ! 148: LDUW_R	lduw	[%r8 + %r9], %r11
	.word 0xc3ea1009  ! 149: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc3ea1009  ! 150: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x8f6a282c  ! 151: SDIVX_I	sdivx	%r8, 0x082c, %r7
	.word 0xc81a0009  ! 152: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xee2a0009  ! 154: STB_R	stb	%r23, [%r8 + %r9]
	.word 0xe4020009  ! 154: LDUW_R	lduw	[%r8 + %r9], %r18
	.word 0xccd21009  ! 155: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r6
	.word 0xc67a0009  ! 156: SWAP_R	swap	%r3, [%r8 + %r9]
	.word 0xcb3a23a8  ! 157: STDF_I	std	%f5, [0x03a8, %r8]
	.word 0x8143c000  ! 158: STBAR	stbar
	.word 0xc3ea1009  ! 159: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xca2a0009  ! 161: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc01a0009  ! 161: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0x04ca0001  ! 162: BRLEZ	brlez  ,pt	%8,<label_0xa0001>
	.word 0x8cfa0009  ! 163: SDIVcc_R	sdivcc 	%r8, %r9, %r6
	.word 0xc3ea27b8  ! 164: PREFETCHA_I	prefetcha	[%r8, + 0x07b8] %asi, #one_read
	.word 0xb06a2a70  ! 165: UDIVX_I	udivx 	%r8, 0x0a70, %r24
	.word 0xe8ba2420  ! 166: STDA_I	stda	%r20, [%r8 + 0x0420] %asi
	.word 0xc8fa2a34  ! 167: SWAPA_I	swapa	%r4, [%r8 + 0x0a34] %asi
	.word 0x3a800002  ! 168: BCC	bcc,a	<label_0x2>
	.word 0xc36a0009  ! 169: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xcb3a2658  ! 170: STDF_I	std	%f5, [0x0658, %r8]
	.word 0x2aca0001  ! 171: BRNZ	brnz,a,pt	%8,<label_0xa0001>
	.word 0xc36a0009  ! 172: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0x84f20009  ! 173: UDIVcc_R	udivcc 	%r8, %r9, %r2
	.word 0x8eda0009  ! 174: SMULcc_R	smulcc 	%r8, %r9, %r7
	.word 0xce720009  ! 176: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xec5a0009  ! 176: LDX_R	ldx	[%r8 + %r9], %r22
	.word 0x9c720009  ! 177: UDIV_R	udiv 	%r8, %r9, %r14
	.word 0xb1222d18  ! 178: MULScc_I	mulscc 	%r8, 0x0d18, %r24
	.word 0x8ada0009  ! 179: SMULcc_R	smulcc 	%r8, %r9, %r5
	.word 0xc6821009  ! 180: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r3
	.word 0x0ec20001  ! 181: BRGEZ	brgez  ,nt	%8,<label_0x20001>
	.word 0xfd222b58  ! 182: STF_I	st	%f30, [0x0b58, %r8]
	.word 0xf2b21009  ! 183: STHA_R	stha	%r25, [%r8 + %r9] 0x80
	.word 0x22800001  ! 184: BE	be,a	<label_0x1>
	.word 0xceb21009  ! 185: STHA_R	stha	%r7, [%r8 + %r9] 0x80
	.word 0xa86a27d0  ! 186: UDIVX_I	udivx 	%r8, 0x07d0, %r20
	.word 0xdd1a0009  ! 187: LDDF_R	ldd	[%r8, %r9], %f14
	.word 0x867a0009  ! 188: SDIV_R	sdiv 	%r8, %r9, %r3
	.word 0xfc6a0009  ! 189: LDSTUB_R	ldstub	%r30, [%r8 + %r9]
	.word 0xcd1a23c0  ! 190: LDDF_I	ldd	[%r8, 0x03c0], %f6
	.word 0x8143c000  ! 191: STBAR	stbar
	.word 0xa7a20929  ! 192: FMULs	fmuls	%f8, %f9, %f19
	.word 0xc22a0009  ! 194: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xcc120009  ! 194: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0x8143c000  ! 195: STBAR	stbar
	.word 0xc36a2ac0  ! 196: PREFETCH_I	prefetch	[%r8 + 0x0ac0], #one_read
	.word 0xca2a0009  ! 198: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xca020009  ! 198: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0x04800001  ! 199: BLE	ble  	<label_0x1>
	.word 0x8e5a0009  ! 200: SMUL_R	smul 	%r8, %r9, %r7
	.word 0xaaf22438  ! 201: UDIVcc_I	udivcc 	%r8, 0x0438, %r21
	.word 0x84d22190  ! 202: UMULcc_I	umulcc 	%r8, 0x0190, %r2
	.word 0xb67a2838  ! 203: SDIV_I	sdiv 	%r8, 0x0838, %r27
	.word 0xdf222a64  ! 204: STF_I	st	%f15, [0x0a64, %r8]
	.word 0xc82a0009  ! 206: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc4120009  ! 206: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0x0a800001  ! 207: BCS	bcs  	<label_0x1>
	.word 0xcec22324  ! 208: LDSWA_I	ldswa	[%r8, + 0x0324] %asi, %r7
	.word 0xc8220009  ! 210: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc6420009  ! 210: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xc36a0009  ! 211: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0x8a6a237c  ! 212: UDIVX_I	udivx 	%r8, 0x037c, %r5
	.word 0xd6122610  ! 213: LDUH_I	lduh	[%r8 + 0x0610], %r11
	.word 0x847a0009  ! 214: SDIV_R	sdiv 	%r8, %r9, %r2
	.word 0x06c20001  ! 215: BRLZ	brlz  ,nt	%8,<label_0x20001>
	.word 0x12800002  ! 216: BNE	bne  	<label_0x2>
	.word 0xcaea21fc  ! 217: LDSTUBA_I	ldstuba	%r5, [%r8 + 0x01fc] %asi
	.word 0xf0220009  ! 219: STW_R	stw	%r24, [%r8 + %r9]
	.word 0xc44a0009  ! 219: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xc3ea1009  ! 220: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xde6a0009  ! 221: LDSTUB_R	ldstub	%r15, [%r8 + %r9]
	.word 0x89a20829  ! 222: FADDs	fadds	%f8, %f9, %f4
	.word 0xa76a262c  ! 223: SDIVX_I	sdivx	%r8, 0x062c, %r19
	.word 0xfe720009  ! 225: STX_R	stx	%r31, [%r8 + %r9]
	.word 0xc6420009  ! 225: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xcaca203c  ! 226: LDSBA_I	ldsba	[%r8, + 0x003c] %asi, %r5
	.word 0xbad22924  ! 227: UMULcc_I	umulcc 	%r8, 0x0924, %r29
	.word 0xc2f22360  ! 228: STXA_I	stxa	%r1, [%r8 + 0x0360] %asi
	.word 0xca022cdc  ! 229: LDUW_I	lduw	[%r8 + 0x0cdc], %r5
	.word 0x847a0009  ! 230: SDIV_R	sdiv 	%r8, %r9, %r2
	.word 0x8efa253c  ! 231: SDIVcc_I	sdivcc 	%r8, 0x053c, %r7
	.word 0x8cd20009  ! 232: UMULcc_R	umulcc 	%r8, %r9, %r6
	.word 0xc6fa27d8  ! 233: SWAPA_I	swapa	%r3, [%r8 + 0x07d8] %asi
	.word 0xb4f20009  ! 234: UDIVcc_R	udivcc 	%r8, %r9, %r26
	.word 0xc22a0009  ! 236: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc45a0009  ! 236: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xead21009  ! 237: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r21
	.word 0xcc2a0009  ! 239: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xce020009  ! 239: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0x9ef20009  ! 240: UDIVcc_R	udivcc 	%r8, %r9, %r15
	.word 0x866a2fdc  ! 241: UDIVX_I	udivx 	%r8, 0x0fdc, %r3
	.word 0xca2a0009  ! 243: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xce120009  ! 243: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xc4220009  ! 245: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xfe420009  ! 245: LDSW_R	ldsw	[%r8 + %r9], %r31
	.word 0xc2da2ba0  ! 246: LDXA_I	ldxa	[%r8, + 0x0ba0] %asi, %r1
	.word 0xa65a2d7c  ! 247: SMUL_I	smul 	%r8, 0x0d7c, %r19
	.word 0xc2220009  ! 249: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc71a0009  ! 249: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xc36a0009  ! 250: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xe08a2824  ! 251: LDUBA_I	lduba	[%r8, + 0x0824] %asi, %r16
	.word 0x0eca0001  ! 252: BRGEZ	brgez  ,pt	%8,<label_0xa0001>
	.word 0x8143c000  ! 253: STBAR	stbar
	.word 0xac5a0009  ! 254: SMUL_R	smul 	%r8, %r9, %r22
	.word 0xce120009  ! 255: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xca8229e8  ! 256: LDUWA_I	lduwa	[%r8, + 0x09e8] %asi, %r5
	.word 0xdeea1009  ! 257: LDSTUBA_R	ldstuba	%r15, [%r8 + %r9] 0x80
	.word 0xcc220009  ! 259: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc40a0009  ! 259: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xaad223c8  ! 260: UMULcc_I	umulcc 	%r8, 0x03c8, %r21
	.word 0xbba209a9  ! 261: FDIVs	fdivs	%f8, %f9, %f29
	.word 0x22800001  ! 262: BE	be,a	<label_0x1>
	.word 0xe2a21009  ! 263: STWA_R	stwa	%r17, [%r8 + %r9] 0x80
	.word 0xc93a2058  ! 264: STDF_I	std	%f4, [0x0058, %r8]
	.word 0xca6a0009  ! 265: LDSTUB_R	ldstub	%r5, [%r8 + %r9]
	.word 0xc73a29a0  ! 266: STDF_I	std	%f3, [0x09a0, %r8]
	.word 0xc36a0009  ! 267: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xb2fa0009  ! 268: SDIVcc_R	sdivcc 	%r8, %r9, %r25
	.word 0xbada0009  ! 269: SMULcc_R	smulcc 	%r8, %r9, %r29
	.word 0x06800002  ! 270: BL	bl  	<label_0x2>
	.word 0x8143e00a  ! 271: MEMBAR	membar	#StoreLoad | #StoreStore 
	.word 0x8143e05c  ! 272: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0xcd220009  ! 274: STF_R	st	%f6, [%r9, %r8]
	.word 0xc4720009  ! 275: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xf1020009  ! 275: LDF_R	ld	[%r8, %r9], %f24
	.word 0x82fa2b14  ! 276: SDIVcc_I	sdivcc 	%r8, 0x0b14, %r1
	.word 0x8143e055  ! 277: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside | #Sync 
	.word 0xa45a0009  ! 278: SMUL_R	smul 	%r8, %r9, %r18
	.word 0xf85a25f0  ! 279: LDX_I	ldx	[%r8 + 0x05f0], %r28
	.word 0xe0520009  ! 280: LDSH_R	ldsh	[%r8 + %r9], %r16
	.word 0xe8320009  ! 282: STH_R	sth	%r20, [%r8 + %r9]
	.word 0xc81a0009  ! 282: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xc2320009  ! 284: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xcd1a0009  ! 284: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0x8143c000  ! 285: STBAR	stbar
	.word 0xca0a2884  ! 286: LDUB_I	ldub	[%r8 + 0x0884], %r5
	.word 0xa4f224e8  ! 287: UDIVcc_I	udivcc 	%r8, 0x04e8, %r18
	.word 0xe0720009  ! 289: STX_R	stx	%r16, [%r8 + %r9]
	.word 0xca0a0009  ! 289: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xa8720009  ! 290: UDIV_R	udiv 	%r8, %r9, %r20
	.word 0xda420009  ! 291: LDSW_R	ldsw	[%r8 + %r9], %r13
	.word 0xebf22009  ! 292: CASXA_R	casxa	[%r8]%asi, %r9, %r21
	.word 0x12800001  ! 293: BNE	bne  	<label_0x1>
	.word 0xf8720009  ! 295: STX_R	stx	%r28, [%r8 + %r9]
	.word 0xc5020009  ! 295: LDF_R	ld	[%r8, %r9], %f2
	.word 0x8143e074  ! 296: MEMBAR	membar	#LoadStore | #Lookaside | #MemIssue | #Sync 
	.word 0xc66a0009  ! 297: LDSTUB_R	ldstub	%r3, [%r8 + %r9]
	.word 0xc3ea21fc  ! 298: PREFETCHA_I	prefetcha	[%r8, + 0x01fc] %asi, #one_read
	.word 0x8143c000  ! 299: STBAR	stbar
	.word 0xe2a22b30  ! 300: STWA_I	stwa	%r17, [%r8 + 0x0b30] %asi
	.word 0xc64a0009  ! 301: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xf7f22009  ! 302: CASXA_R	casxa	[%r8]%asi, %r9, %r27
	.word 0x89a209a9  ! 303: FDIVs	fdivs	%f8, %f9, %f4
	.word 0xbad20009  ! 304: UMULcc_R	umulcc 	%r8, %r9, %r29
	.word 0xe42a0009  ! 306: STB_R	stb	%r18, [%r8 + %r9]
	.word 0xf31a0009  ! 306: LDDF_R	ldd	[%r8, %r9], %f25
	.word 0x20800002  ! 307: BN	bn,a	<label_0x2>
	.word 0xce822f24  ! 308: LDUWA_I	lduwa	[%r8, + 0x0f24] %asi, %r7
	.word 0x9c6a2164  ! 309: UDIVX_I	udivx 	%r8, 0x0164, %r14
	.word 0xd71a2fe8  ! 310: LDDF_I	ldd	[%r8, 0x0fe8], %f11
	.word 0xea6a2034  ! 311: LDSTUB_I	ldstub	%r21, [%r8 + 0x0034]
	.word 0xc82a0009  ! 313: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xec020009  ! 313: LDUW_R	lduw	[%r8 + %r9], %r22
	.word 0xc3ea2228  ! 314: PREFETCHA_I	prefetcha	[%r8, + 0x0228] %asi, #one_read
	.word 0xdc6a2390  ! 315: LDSTUB_I	ldstub	%r14, [%r8 + 0x0390]
	.word 0xc8520009  ! 316: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xfa921009  ! 317: LDUHA_R	lduha	[%r8, %r9] 0x80, %r29
	.word 0xc36a0009  ! 318: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0x3a800002  ! 319: BCC	bcc,a	<label_0x2>
	.word 0xf1e22009  ! 320: CASA_R	casa	[%r8] %asi, %r9, %r24
	.word 0xccda2e58  ! 321: LDXA_I	ldxa	[%r8, + 0x0e58] %asi, %r6
	.word 0xf87a0009  ! 322: SWAP_R	swap	%r28, [%r8 + %r9]
	.word 0x876a0009  ! 323: SDIVX_R	sdivx	%r8, %r9, %r3
	.word 0xf8ea203c  ! 324: LDSTUBA_I	ldstuba	%r28, [%r8 + 0x003c] %asi
	.word 0xe8a21009  ! 325: STWA_R	stwa	%r20, [%r8 + %r9] 0x80
	.word 0xc60a0009  ! 326: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xc2da2d10  ! 327: LDXA_I	ldxa	[%r8, + 0x0d10] %asi, %r1
	.word 0x02ca0001  ! 328: BRZ	brz  ,pt	%8,<label_0xa0001>
	.word 0xcc220009  ! 330: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc85a0009  ! 330: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xa07a2f78  ! 331: SDIV_I	sdiv 	%r8, 0x0f78, %r16
	.word 0xc89a1009  ! 332: LDDA_R	ldda	[%r8, %r9] 0x80, %r4
	.word 0x2cca0001  ! 333: BRGZ	brgz,a,pt	%8,<label_0xa0001>
	.word 0xc6122bc8  ! 334: LDUH_I	lduh	[%r8 + 0x0bc8], %r3
	.word 0xf8b224b8  ! 335: STHA_I	stha	%r28, [%r8 + 0x04b8] %asi
	.word 0x8a6a290c  ! 336: UDIVX_I	udivx 	%r8, 0x090c, %r5
	.word 0xe8da2eb8  ! 337: LDXA_I	ldxa	[%r8, + 0x0eb8] %asi, %r20
	.word 0x836a0009  ! 338: SDIVX_R	sdivx	%r8, %r9, %r1
	.word 0x2cca0001  ! 339: BRGZ	brgz,a,pt	%8,<label_0xa0001>
	.word 0xc2b22048  ! 340: STHA_I	stha	%r1, [%r8 + 0x0048] %asi
	.word 0x16800002  ! 341: BGE	bge  	<label_0x2>
	.word 0xcc1a0009  ! 342: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xcc2a0009  ! 344: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc65a0009  ! 344: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xc2fa1009  ! 345: SWAPA_R	swapa	%r1, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 346: STBAR	stbar
	.word 0xc2d22f64  ! 347: LDSHA_I	ldsha	[%r8, + 0x0f64] %asi, %r1
	.word 0x8143c000  ! 348: STBAR	stbar
	.word 0xfd020009  ! 349: LDF_R	ld	[%r8, %r9], %f30
	.word 0xa0722c1c  ! 350: UDIV_I	udiv 	%r8, 0x0c1c, %r16
	.word 0xc62a0009  ! 352: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc65a0009  ! 352: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0x825a22c8  ! 353: SMUL_I	smul 	%r8, 0x02c8, %r1
	.word 0xcc320009  ! 355: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc4520009  ! 355: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xf4da1009  ! 356: LDXA_R	ldxa	[%r8, %r9] 0x80, %r26
	.word 0xc6320009  ! 358: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xd6020009  ! 358: LDUW_R	lduw	[%r8 + %r9], %r11
	.word 0xc3ea1009  ! 359: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x32800001  ! 360: BNE	bne,a	<label_0x1>
	.word 0xcde22009  ! 361: CASA_R	casa	[%r8] %asi, %r9, %r6
	.word 0xc42a0009  ! 363: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xca420009  ! 363: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xc4ba1009  ! 364: STDA_R	stda	%r2, [%r8 + %r9] 0x80
	.word 0xe84a2c24  ! 365: LDSB_I	ldsb	[%r8 + 0x0c24], %r20
	.word 0x8143e067  ! 366: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #MemIssue | #Sync 
	.word 0xf0c22024  ! 367: LDSWA_I	ldswa	[%r8, + 0x0024] %asi, %r24
	.word 0xbba209a9  ! 368: FDIVs	fdivs	%f8, %f9, %f29
	.word 0xcb3a2288  ! 369: STDF_I	std	%f5, [0x0288, %r8]
	.word 0x8efa21e4  ! 370: SDIVcc_I	sdivcc 	%r8, 0x01e4, %r7
	.word 0xb3a209a9  ! 371: FDIVs	fdivs	%f8, %f9, %f25
	.word 0x40000001  ! 372: CALL	call	disp30_1
	.word 0xca8a2094  ! 373: LDUBA_I	lduba	[%r8, + 0x0094] %asi, %r5
	.word 0xc6b225d8  ! 374: STHA_I	stha	%r3, [%r8 + 0x05d8] %asi
	.word 0xf1f21009  ! 375: CASXA_I	casxa	[%r8] 0x80, %r9, %r24
	.word 0xe73a2390  ! 376: STDF_I	std	%f19, [0x0390, %r8]
	.word 0x83220009  ! 377: MULScc_R	mulscc 	%r8, %r9, %r1
	.word 0xe62a0009  ! 379: STB_R	stb	%r19, [%r8 + %r9]
	.word 0xdc4a0009  ! 379: LDSB_R	ldsb	[%r8 + %r9], %r14
	.word 0x18800001  ! 380: BGU	bgu  	<label_0x1>
	.word 0x8143e02d  ! 381: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #MemIssue 
	.word 0xc36a0009  ! 382: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc73a0009  ! 384: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc6720009  ! 385: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc4420009  ! 385: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0x85220009  ! 386: MULScc_R	mulscc 	%r8, %r9, %r2
	.word 0xc7022178  ! 387: LDF_I	ld	[%r8, 0x0178], %f3
	.word 0xc8aa21e4  ! 388: STBA_I	stba	%r4, [%r8 + 0x01e4] %asi
	.word 0x83a208a9  ! 389: FSUBs	fsubs	%f8, %f9, %f1
	.word 0x8143e001  ! 390: MEMBAR	membar	#LoadLoad 
	.word 0xc4ba1009  ! 391: STDA_R	stda	%r2, [%r8 + %r9] 0x80
	.word 0xc2d21009  ! 392: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r1
	.word 0x8cda23fc  ! 393: SMULcc_I	smulcc 	%r8, 0x03fc, %r6
	.word 0xff022224  ! 394: LDF_I	ld	[%r8, 0x0224], %f31
	.word 0xc36a2148  ! 395: PREFETCH_I	prefetch	[%r8 + 0x0148], #one_read
	.word 0xc93a0009  ! 397: STDF_R	std	%f4, [%r9, %r8]
	.word 0xc8720009  ! 398: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xca020009  ! 398: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xd8320009  ! 400: STH_R	sth	%r12, [%r8 + %r9]
	.word 0xf6420009  ! 400: LDSW_R	ldsw	[%r8 + %r9], %r27
	.word 0xea6a0009  ! 401: LDSTUB_R	ldstub	%r21, [%r8 + %r9]
	.word 0xce220009  ! 403: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xcc420009  ! 403: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xd73a2150  ! 404: STDF_I	std	%f11, [0x0150, %r8]
	.word 0x84f22138  ! 405: UDIVcc_I	udivcc 	%r8, 0x0138, %r2
	.word 0xca220009  ! 407: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc84a0009  ! 407: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xc6d21009  ! 408: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r3
	.word 0xfcfa2688  ! 409: SWAPA_I	swapa	%r30, [%r8 + 0x0688] %asi
	.word 0xc36a2524  ! 410: PREFETCH_I	prefetch	[%r8 + 0x0524], #one_read
	.word 0x8cda25c0  ! 411: SMULcc_I	smulcc 	%r8, 0x05c0, %r6
	.word 0xc73a0009  ! 413: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc6720009  ! 414: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xcc120009  ! 414: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0x34800001  ! 415: BG	bg,a	<label_0x1>
	.word 0xc522278c  ! 416: STF_I	st	%f2, [0x078c, %r8]
	.word 0xda220009  ! 418: STW_R	stw	%r13, [%r8 + %r9]
	.word 0xe4120009  ! 418: LDUH_R	lduh	[%r8 + %r9], %r18
	.word 0xcea22fa8  ! 419: STWA_I	stwa	%r7, [%r8 + 0x0fa8] %asi
	.word 0xc2ea1009  ! 420: LDSTUBA_R	ldstuba	%r1, [%r8 + %r9] 0x80
	.word 0xceb21009  ! 421: STHA_R	stha	%r7, [%r8 + %r9] 0x80
	.word 0x8af22304  ! 422: UDIVcc_I	udivcc 	%r8, 0x0304, %r5
	.word 0xc3ea1009  ! 423: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc73a2e08  ! 424: STDF_I	std	%f3, [0x0e08, %r8]
	.word 0xecd22168  ! 425: LDSHA_I	ldsha	[%r8, + 0x0168] %asi, %r22
	.word 0xc36a24d4  ! 426: PREFETCH_I	prefetch	[%r8 + 0x04d4], #one_read
	.word 0xc3ea1009  ! 427: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xb1a209a9  ! 428: FDIVs	fdivs	%f8, %f9, %f24
	.word 0xca220009  ! 430: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xe01a0009  ! 430: LDD_R	ldd	[%r8 + %r9], %r16
	.word 0xc82a0009  ! 432: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xce020009  ! 432: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xf5f22009  ! 433: CASXA_R	casxa	[%r8]%asi, %r9, %r26
	.word 0x8143e02f  ! 434: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #MemIssue 
	.word 0xc01a0009  ! 435: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0xc3f21009  ! 436: CASXA_I	casxa	[%r8] 0x80, %r9, %r1
	.word 0xe60a2164  ! 437: LDUB_I	ldub	[%r8 + 0x0164], %r19
	.word 0x8da20829  ! 438: FADDs	fadds	%f8, %f9, %f6
	.word 0x8e520009  ! 439: UMUL_R	umul 	%r8, %r9, %r7
	.word 0xcaa22044  ! 440: STWA_I	stwa	%r5, [%r8 + 0x0044] %asi
	.word 0xc51a0009  ! 441: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xcada1009  ! 442: LDXA_R	ldxa	[%r8, %r9] 0x80, %r5
	.word 0xada20929  ! 443: FMULs	fmuls	%f8, %f9, %f22
	.word 0xc22a0009  ! 445: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xe71a0009  ! 445: LDDF_R	ldd	[%r8, %r9], %f19
	.word 0xc6f22fa0  ! 446: STXA_I	stxa	%r3, [%r8 + 0x0fa0] %asi
	.word 0xc2320009  ! 448: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc91a0009  ! 448: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xbfa209a9  ! 449: FDIVs	fdivs	%f8, %f9, %f31
	.word 0xc8da1009  ! 450: LDXA_R	ldxa	[%r8, %r9] 0x80, %r4
	.word 0xbba20929  ! 451: FMULs	fmuls	%f8, %f9, %f29
	.word 0xc36a2214  ! 452: PREFETCH_I	prefetch	[%r8 + 0x0214], #one_read
	.word 0x38800002  ! 453: BGU	bgu,a	<label_0x2>
	.word 0x8eda0009  ! 454: SMULcc_R	smulcc 	%r8, %r9, %r7
	.word 0x8143c000  ! 455: STBAR	stbar
	.word 0x8d220009  ! 456: MULScc_R	mulscc 	%r8, %r9, %r6
	.word 0x8fa20929  ! 457: FMULs	fmuls	%f8, %f9, %f7
	.word 0xcaaa1009  ! 458: STBA_R	stba	%r5, [%r8 + %r9] 0x80
	.word 0xe4220009  ! 460: STW_R	stw	%r18, [%r8 + %r9]
	.word 0xc84a0009  ! 460: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xb6fa2f88  ! 461: SDIVcc_I	sdivcc 	%r8, 0x0f88, %r27
	.word 0xd8921009  ! 462: LDUHA_R	lduha	[%r8, %r9] 0x80, %r12
	.word 0xcc220009  ! 464: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xcc5a0009  ! 464: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xcc8a1009  ! 465: LDUBA_R	lduba	[%r8, %r9] 0x80, %r6
	.word 0xc8720009  ! 467: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xce120009  ! 467: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0x89220009  ! 468: MULScc_R	mulscc 	%r8, %r9, %r4
	.word 0x8143e025  ! 469: MEMBAR	membar	#LoadLoad | #LoadStore | #MemIssue 
	.word 0xced21009  ! 470: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r7
	.word 0x04800001  ! 471: BLE	ble  	<label_0x1>
	.word 0xc62a0009  ! 473: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc4420009  ! 473: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xca2a0009  ! 475: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xf2020009  ! 475: LDUW_R	lduw	[%r8 + %r9], %r25
	.word 0xccba27f8  ! 476: STDA_I	stda	%r6, [%r8 + 0x07f8] %asi
	.word 0x87a20829  ! 477: FADDs	fadds	%f8, %f9, %f3
	.word 0xc8f21009  ! 478: STXA_R	stxa	%r4, [%r8 + %r9] 0x80
	.word 0xc3ea1009  ! 479: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xfb3a0009  ! 481: STDF_R	std	%f29, [%r9, %r8]
	.word 0xde720009  ! 482: STX_R	stx	%r15, [%r8 + %r9]
	.word 0xf9020009  ! 482: LDF_R	ld	[%r8, %r9], %f28
	.word 0xca420009  ! 483: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0x88da2a64  ! 484: SMULcc_I	smulcc 	%r8, 0x0a64, %r4
	.word 0xda6a0009  ! 485: LDSTUB_R	ldstub	%r13, [%r8 + %r9]
	.word 0xec120009  ! 486: LDUH_R	lduh	[%r8 + %r9], %r22
	.word 0x86fa0009  ! 487: SDIVcc_R	sdivcc 	%r8, %r9, %r3
	.word 0xf86a2fec  ! 488: LDSTUB_I	ldstub	%r28, [%r8 + 0x0fec]
	.word 0x20800001  ! 489: BN	bn,a	<label_0x1>
	.word 0xc3ea24f0  ! 490: PREFETCHA_I	prefetcha	[%r8, + 0x04f0] %asi, #one_read
	.word 0xc2220009  ! 492: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xcc020009  ! 492: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xf2ca2c18  ! 493: LDSBA_I	ldsba	[%r8, + 0x0c18] %asi, %r25
	.word 0x85a209a9  ! 494: FDIVs	fdivs	%f8, %f9, %f2
	.word 0xc4aa1009  ! 495: STBA_R	stba	%r2, [%r8 + %r9] 0x80
	.word 0x2ec20001  ! 496: BRGEZ	brgez,a,nt	%8,<label_0x20001>
	.word 0xf6320009  ! 498: STH_R	sth	%r27, [%r8 + %r9]
	.word 0xf20a0009  ! 498: LDUB_R	ldub	[%r8 + %r9], %r25
	.word 0xc33a2b70  ! 499: STDF_I	std	%f1, [0x0b70, %r8]
	.word 0x22800001  ! 500: BE	be,a	<label_0x1>
	.word 0x986a0009  ! 501: UDIVX_R	udivx 	%r8, %r9, %r12
	.word 0xdcc21009  ! 502: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r14
	.word 0x8143c000  ! 503: STBAR	stbar
	.word 0xcc4225b0  ! 504: LDSW_I	ldsw	[%r8 + 0x05b0], %r6
	.word 0x8ad22078  ! 505: UMULcc_I	umulcc 	%r8, 0x0078, %r5
	.word 0xc36a0009  ! 506: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc49a2940  ! 507: LDDA_I	ldda	[%r8, + 0x0940] %asi, %r2
	.word 0xee220009  ! 509: STW_R	stw	%r23, [%r8 + %r9]
	.word 0xc6020009  ! 509: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xf3222680  ! 510: STF_I	st	%f25, [0x0680, %r8]
	.word 0x32800001  ! 511: BNE	bne,a	<label_0x1>
	.word 0x26ca0001  ! 512: BRLZ	brlz,a,pt	%8,<label_0xa0001>
	.word 0xe6b21009  ! 513: STHA_R	stha	%r19, [%r8 + %r9] 0x80
	.word 0xdb3a24c8  ! 514: STDF_I	std	%f13, [0x04c8, %r8]
	.word 0x8143c000  ! 515: STBAR	stbar
	.word 0xee8a2eb4  ! 516: LDUBA_I	lduba	[%r8, + 0x0eb4] %asi, %r23
	.word 0x8c4a270c  ! 517: MULX_I	mulx 	%r8, 0x070c, %r6
	.word 0x8fa20929  ! 518: FMULs	fmuls	%f8, %f9, %f7
	.word 0xc36a25d4  ! 519: PREFETCH_I	prefetch	[%r8 + 0x05d4], #one_read
	.word 0xc42a0009  ! 521: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc2020009  ! 521: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0x88fa0009  ! 522: SDIVcc_R	sdivcc 	%r8, %r9, %r4
	.word 0xc4122a18  ! 523: LDUH_I	lduh	[%r8 + 0x0a18], %r2
	.word 0xca220009  ! 525: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xca520009  ! 525: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0x8143e034  ! 526: MEMBAR	membar	#LoadStore | #Lookaside | #MemIssue 
	.word 0xc51a0009  ! 527: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0x84fa0009  ! 528: SDIVcc_R	sdivcc 	%r8, %r9, %r2
	.word 0xc3ea1009  ! 529: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc5022420  ! 530: LDF_I	ld	[%r8, 0x0420], %f2
	.word 0x86f20009  ! 531: UDIVcc_R	udivcc 	%r8, %r9, %r3
	.word 0xc6020009  ! 532: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0x8143e021  ! 533: MEMBAR	membar	#LoadLoad | #MemIssue 
	.word 0x88d20009  ! 534: UMULcc_R	umulcc 	%r8, %r9, %r4
	.word 0xc3ea1009  ! 535: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x3e800001  ! 536: BVC	bvc,a	<label_0x1>
	.word 0x8a5a26f0  ! 537: SMUL_I	smul 	%r8, 0x06f0, %r5
	.word 0xdcb2235c  ! 538: STHA_I	stha	%r14, [%r8 + 0x035c] %asi
	.word 0xf6b221cc  ! 539: STHA_I	stha	%r27, [%r8 + 0x01cc] %asi
	.word 0xe06a263c  ! 540: LDSTUB_I	ldstub	%r16, [%r8 + 0x063c]
	.word 0xbfa208a9  ! 541: FSUBs	fsubs	%f8, %f9, %f31
	.word 0xc4ba2788  ! 542: STDA_I	stda	%r2, [%r8 + 0x0788] %asi
	.word 0x8143c000  ! 543: STBAR	stbar
	.word 0xce022ecc  ! 544: LDUW_I	lduw	[%r8 + 0x0ecc], %r7
	.word 0x8143c000  ! 545: STBAR	stbar
	.word 0xc4320009  ! 547: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xca0a0009  ! 547: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0x8efa2d28  ! 548: SDIVcc_I	sdivcc 	%r8, 0x0d28, %r7
	.word 0x88fa0009  ! 549: SDIVcc_R	sdivcc 	%r8, %r9, %r4
	.word 0xc68a1009  ! 550: LDUBA_R	lduba	[%r8, %r9] 0x80, %r3
	.word 0x8e4a2794  ! 551: MULX_I	mulx 	%r8, 0x0794, %r7
	.word 0xcc8a2584  ! 552: LDUBA_I	lduba	[%r8, + 0x0584] %asi, %r6
	.word 0xe2520009  ! 553: LDSH_R	ldsh	[%r8 + %r9], %r17
	.word 0xcc320009  ! 555: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc9020009  ! 555: LDF_R	ld	[%r8, %r9], %f4
	.word 0xc36a2524  ! 556: PREFETCH_I	prefetch	[%r8 + 0x0524], #one_read
	.word 0xc36a22bc  ! 557: PREFETCH_I	prefetch	[%r8 + 0x02bc], #one_read
	.word 0x26ca0001  ! 558: BRLZ	brlz,a,pt	%8,<label_0xa0001>
	.word 0x8c5a0009  ! 559: SMUL_R	smul 	%r8, %r9, %r6
	.word 0xec220009  ! 561: STW_R	stw	%r22, [%r8 + %r9]
	.word 0xfe120009  ! 561: LDUH_R	lduh	[%r8 + %r9], %r31
	.word 0xc36a2d5c  ! 562: PREFETCH_I	prefetch	[%r8 + 0x0d5c], #one_read
	.word 0xc85a0009  ! 563: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xceaa2b7c  ! 564: STBA_I	stba	%r7, [%r8 + 0x0b7c] %asi
	.word 0x86fa0009  ! 565: SDIVcc_R	sdivcc 	%r8, %r9, %r3
	.word 0x83a20929  ! 566: FMULs	fmuls	%f8, %f9, %f1
	.word 0x00800001  ! 567: BN	bn  	<label_0x1>
	.word 0x1c800002  ! 568: BPOS	bpos  	<label_0x2>
	.word 0xc36a27e4  ! 569: PREFETCH_I	prefetch	[%r8 + 0x07e4], #one_read
	.word 0xdab21009  ! 570: STHA_R	stha	%r13, [%r8 + %r9] 0x80
	.word 0x85a20929  ! 571: FMULs	fmuls	%f8, %f9, %f2
	.word 0x8143e07d  ! 572: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xc3ea1009  ! 573: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xcaea1009  ! 574: LDSTUBA_R	ldstuba	%r5, [%r8 + %r9] 0x80
	.word 0xce220009  ! 576: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xcd1a0009  ! 576: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xce220009  ! 578: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xdc0a0009  ! 578: LDUB_R	ldub	[%r8 + %r9], %r14
	.word 0xc4da1009  ! 579: LDXA_R	ldxa	[%r8, %r9] 0x80, %r2
	.word 0xce020009  ! 580: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xc8d22b9c  ! 581: LDSHA_I	ldsha	[%r8, + 0x0b9c] %asi, %r4
	.word 0xc7020009  ! 582: LDF_R	ld	[%r8, %r9], %f3
	.word 0x18800001  ! 583: BGU	bgu  	<label_0x1>
	.word 0xc52227d8  ! 584: STF_I	st	%f2, [0x07d8, %r8]
	.word 0x8c520009  ! 585: UMUL_R	umul 	%r8, %r9, %r6
	.word 0xc4922b28  ! 586: LDUHA_I	lduha	[%r8, + 0x0b28] %asi, %r2
	.word 0xccb21009  ! 587: STHA_R	stha	%r6, [%r8 + %r9] 0x80
	.word 0xc4220009  ! 589: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xde5a0009  ! 589: LDX_R	ldx	[%r8 + %r9], %r15
	.word 0xa5a20829  ! 590: FADDs	fadds	%f8, %f9, %f18
	.word 0xc36a21c0  ! 591: PREFETCH_I	prefetch	[%r8 + 0x01c0], #one_read
	.word 0x884a0009  ! 592: MULX_R	mulx 	%r8, %r9, %r4
	.word 0xce220009  ! 594: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc20a0009  ! 594: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xccd21009  ! 595: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r6
	.word 0xc3ea1009  ! 596: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc3ea1009  ! 597: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc9220009  ! 599: STF_R	st	%f4, [%r9, %r8]
	.word 0xcc720009  ! 600: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xdc420009  ! 600: LDSW_R	ldsw	[%r8 + %r9], %r14
	.word 0xc4fa1009  ! 601: SWAPA_R	swapa	%r2, [%r8 + %r9] 0x80
	.word 0x8143e02e  ! 602: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #MemIssue 
	.word 0xc3ea28ec  ! 603: PREFETCHA_I	prefetcha	[%r8, + 0x08ec] %asi, #one_read
	.word 0xd66a2808  ! 604: LDSTUB_I	ldstub	%r11, [%r8 + 0x0808]
	.word 0xc36a0009  ! 605: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xe8aa1009  ! 606: STBA_R	stba	%r20, [%r8 + %r9] 0x80
	.word 0xc36a2818  ! 607: PREFETCH_I	prefetch	[%r8 + 0x0818], #one_read
	.word 0x8eda28a8  ! 608: SMULcc_I	smulcc 	%r8, 0x08a8, %r7
	.word 0x0ec20001  ! 609: BRGEZ	brgez  ,nt	%8,<label_0x20001>
	.word 0xf7020009  ! 610: LDF_R	ld	[%r8, %r9], %f27
	.word 0xcac226e4  ! 611: LDSWA_I	ldswa	[%r8, + 0x06e4] %asi, %r5
	.word 0xceaa2d9c  ! 612: STBA_I	stba	%r7, [%r8 + 0x0d9c] %asi
	.word 0xf82a0009  ! 614: STB_R	stb	%r28, [%r8 + %r9]
	.word 0xcf020009  ! 614: LDF_R	ld	[%r8, %r9], %f7
	.word 0xf01a29f0  ! 615: LDD_I	ldd	[%r8 + 0x09f0], %r24
	.word 0xc2f22df8  ! 616: STXA_I	stxa	%r1, [%r8 + 0x0df8] %asi
	.word 0xc0ba1009  ! 617: STDA_R	stda	%r0, [%r8 + %r9] 0x80
	.word 0xc65a0009  ! 618: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xcb220009  ! 620: STF_R	st	%f5, [%r9, %r8]
	.word 0xe8720009  ! 621: STX_R	stx	%r20, [%r8 + %r9]
	.word 0xc2420009  ! 621: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0x8e7a0009  ! 622: SDIV_R	sdiv 	%r8, %r9, %r7
	.word 0xc6220009  ! 624: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xfc120009  ! 624: LDUH_R	lduh	[%r8 + %r9], %r30
	.word 0xfc320009  ! 626: STH_R	sth	%r30, [%r8 + %r9]
	.word 0xca5a0009  ! 626: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xe8220009  ! 628: STW_R	stw	%r20, [%r8 + %r9]
	.word 0xc6020009  ! 628: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0x9fa20929  ! 629: FMULs	fmuls	%f8, %f9, %f15
	.word 0x826a0009  ! 630: UDIVX_R	udivx 	%r8, %r9, %r1
	.word 0xe0320009  ! 632: STH_R	sth	%r16, [%r8 + %r9]
	.word 0xca420009  ! 632: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0x2e800001  ! 633: BVS	bvs,a	<label_0x1>
	.word 0x8143e05e  ! 634: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0xc87a0009  ! 635: SWAP_R	swap	%r4, [%r8 + %r9]
	.word 0xa3222990  ! 636: MULScc_I	mulscc 	%r8, 0x0990, %r17
	.word 0x38800001  ! 637: BGU	bgu,a	<label_0x1>
	.word 0xcb1a2c60  ! 638: LDDF_I	ldd	[%r8, 0x0c60], %f5
	.word 0xed3a0009  ! 640: STDF_R	std	%f22, [%r9, %r8]
	.word 0xfa720009  ! 641: STX_R	stx	%r29, [%r8 + %r9]
	.word 0xce4a0009  ! 641: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xd71a0009  ! 642: LDDF_R	ldd	[%r8, %r9], %f11
	.word 0xf66a0009  ! 643: LDSTUB_R	ldstub	%r27, [%r8 + %r9]
	.word 0x896a2b10  ! 644: SDIVX_I	sdivx	%r8, 0x0b10, %r4
	.word 0xc62a0009  ! 646: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xca120009  ! 646: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xc0ba1009  ! 647: STDA_R	stda	%r0, [%r8 + %r9] 0x80
	.word 0x8143e026  ! 648: MEMBAR	membar	#StoreLoad | #LoadStore | #MemIssue 
	.word 0xdeca2af0  ! 649: LDSBA_I	ldsba	[%r8, + 0x0af0] %asi, %r15
	.word 0xaba209a9  ! 650: FDIVs	fdivs	%f8, %f9, %f21
	.word 0x85a20829  ! 651: FADDs	fadds	%f8, %f9, %f2
	.word 0xc3ea1009  ! 652: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xde720009  ! 654: STX_R	stx	%r15, [%r8 + %r9]
	.word 0xcf1a0009  ! 654: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0x8143e017  ! 655: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside 
	.word 0xc4fa1009  ! 656: SWAPA_R	swapa	%r2, [%r8 + %r9] 0x80
	.word 0x83a209a9  ! 657: FDIVs	fdivs	%f8, %f9, %f1
	.word 0xc8ba1009  ! 658: STDA_R	stda	%r4, [%r8 + %r9] 0x80
	.word 0xc3ea1009  ! 659: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x8143e03e  ! 660: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0xb64a0009  ! 661: MULX_R	mulx 	%r8, %r9, %r27
	.word 0xc2ea1009  ! 662: LDSTUBA_R	ldstuba	%r1, [%r8 + %r9] 0x80
	.word 0xc8ea2028  ! 663: LDSTUBA_I	ldstuba	%r4, [%r8 + 0x0028] %asi
	.word 0x9ad20009  ! 664: UMULcc_R	umulcc 	%r8, %r9, %r13
	.word 0x0a800002  ! 665: BCS	bcs  	<label_0x2>
	.word 0xc26a2db0  ! 666: LDSTUB_I	ldstub	%r1, [%r8 + 0x0db0]
	.word 0x8a4a2abc  ! 667: MULX_I	mulx 	%r8, 0x0abc, %r5
	.word 0xb0522630  ! 668: UMUL_I	umul 	%r8, 0x0630, %r24
	.word 0xe1220009  ! 670: STF_R	st	%f16, [%r9, %r8]
	.word 0xfa720009  ! 671: STX_R	stx	%r29, [%r8 + %r9]
	.word 0xce5a0009  ! 671: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xcc122cc4  ! 672: LDUH_I	lduh	[%r8 + 0x0cc4], %r6
	.word 0x827a0009  ! 673: SDIV_R	sdiv 	%r8, %r9, %r1
	.word 0xce4a278c  ! 674: LDSB_I	ldsb	[%r8 + 0x078c], %r7
	.word 0x8efa20bc  ! 675: SDIVcc_I	sdivcc 	%r8, 0x00bc, %r7
	.word 0x8ad20009  ! 676: UMULcc_R	umulcc 	%r8, %r9, %r5
	.word 0xeaaa1009  ! 677: STBA_R	stba	%r21, [%r8 + %r9] 0x80
	.word 0xc36a0009  ! 678: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xfcd22af4  ! 679: LDSHA_I	ldsha	[%r8, + 0x0af4] %asi, %r30
	.word 0xc6220009  ! 681: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc8120009  ! 681: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xca7a24a0  ! 682: SWAP_I	swap	%r5, [%r8 + 0x04a0]
	.word 0xc49a1009  ! 683: LDDA_R	ldda	[%r8, %r9] 0x80, %r2
	.word 0xca720009  ! 685: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc51a0009  ! 685: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xc2da2e30  ! 686: LDXA_I	ldxa	[%r8, + 0x0e30] %asi, %r1
	.word 0x867220cc  ! 687: UDIV_I	udiv 	%r8, 0x00cc, %r3
	.word 0xec6a2dd8  ! 688: LDSTUB_I	ldstub	%r22, [%r8 + 0x0dd8]
	.word 0xc3ea2a18  ! 689: PREFETCHA_I	prefetcha	[%r8, + 0x0a18] %asi, #one_read
	.word 0x8cfa2b6c  ! 690: SDIVcc_I	sdivcc 	%r8, 0x0b6c, %r6
	.word 0xd8ca2dec  ! 691: LDSBA_I	ldsba	[%r8, + 0x0dec] %asi, %r12
	.word 0xc5220009  ! 693: STF_R	st	%f2, [%r9, %r8]
	.word 0xdc720009  ! 694: STX_R	stx	%r14, [%r8 + %r9]
	.word 0xe05a0009  ! 694: LDX_R	ldx	[%r8 + %r9], %r16
	.word 0x87a20829  ! 695: FADDs	fadds	%f8, %f9, %f3
	.word 0x8cfa22c0  ! 696: SDIVcc_I	sdivcc 	%r8, 0x02c0, %r6
	.word 0x8143c000  ! 697: STBAR	stbar
	.word 0xc6aa2d20  ! 698: STBA_I	stba	%r3, [%r8 + 0x0d20] %asi
	.word 0xa0fa2c00  ! 699: SDIVcc_I	sdivcc 	%r8, 0x0c00, %r16
	.word 0x83a20829  ! 700: FADDs	fadds	%f8, %f9, %f1
	.word 0xc09a1009  ! 701: LDDA_R	ldda	[%r8, %r9] 0x80, %r0
	.word 0x04c20001  ! 702: BRLEZ	brlez  ,nt	%8,<label_0x20001>
	.word 0xe6b21009  ! 703: STHA_R	stha	%r19, [%r8 + %r9] 0x80
	.word 0xda2a0009  ! 705: STB_R	stb	%r13, [%r8 + %r9]
	.word 0xc4520009  ! 705: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xc36a0009  ! 706: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xa96a2f48  ! 707: SDIVX_I	sdivx	%r8, 0x0f48, %r20
	.word 0x8e7a2a94  ! 708: SDIV_I	sdiv 	%r8, 0x0a94, %r7
	.word 0xdeb21009  ! 709: STHA_R	stha	%r15, [%r8 + %r9] 0x80
	.word 0x9cda0009  ! 710: SMULcc_R	smulcc 	%r8, %r9, %r14
	.word 0xcb3a27b0  ! 711: STDF_I	std	%f5, [0x07b0, %r8]
	.word 0xf45a0009  ! 712: LDX_R	ldx	[%r8 + %r9], %r26
	.word 0xf4a22cdc  ! 713: STWA_I	stwa	%r26, [%r8 + 0x0cdc] %asi
	.word 0xc36a0009  ! 714: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xce6a242c  ! 715: LDSTUB_I	ldstub	%r7, [%r8 + 0x042c]
	.word 0xae522948  ! 716: UMUL_I	umul 	%r8, 0x0948, %r23
	.word 0xde0225fc  ! 717: LDUW_I	lduw	[%r8 + 0x05fc], %r15
	.word 0xc8320009  ! 719: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xfa020009  ! 719: LDUW_R	lduw	[%r8 + %r9], %r29
	.word 0x14800001  ! 720: BG	bg  	<label_0x1>
	.word 0x99a20829  ! 721: FADDs	fadds	%f8, %f9, %f12
	.word 0xd6921009  ! 722: LDUHA_R	lduha	[%r8, %r9] 0x80, %r11
	.word 0x3c800001  ! 723: BPOS	bpos,a	<label_0x1>
	.word 0xc2ea29a0  ! 724: LDSTUBA_I	ldstuba	%r1, [%r8 + 0x09a0] %asi
	.word 0xc62a0009  ! 726: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc5020009  ! 726: LDF_R	ld	[%r8, %r9], %f2
	.word 0x85220009  ! 727: MULScc_R	mulscc 	%r8, %r9, %r2
	.word 0xc48a2750  ! 728: LDUBA_I	lduba	[%r8, + 0x0750] %asi, %r2
	.word 0x8c4a2a00  ! 729: MULX_I	mulx 	%r8, 0x0a00, %r6
	.word 0x8143c000  ! 730: STBAR	stbar
	.word 0x8ad20009  ! 731: UMULcc_R	umulcc 	%r8, %r9, %r5
	.word 0x8143e05a  ! 732: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside | #Sync 
	.word 0xd73a2b70  ! 733: STDF_I	std	%f11, [0x0b70, %r8]
	.word 0xc6320009  ! 735: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc8520009  ! 735: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xd8921009  ! 736: LDUHA_R	lduha	[%r8, %r9] 0x80, %r12
	.word 0x8143c000  ! 737: STBAR	stbar
	.word 0xc4f21009  ! 738: STXA_R	stxa	%r2, [%r8 + %r9] 0x80
	.word 0xc5220009  ! 740: STF_R	st	%f2, [%r9, %r8]
	.word 0xc4720009  ! 741: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc4520009  ! 741: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0x0a800001  ! 742: BCS	bcs  	<label_0x1>
	.word 0xc3ea2168  ! 743: PREFETCHA_I	prefetcha	[%r8, + 0x0168] %asi, #one_read
	.word 0xc89a2368  ! 744: LDDA_I	ldda	[%r8, + 0x0368] %asi, %r4
	.word 0x26800001  ! 745: BL	bl,a	<label_0x1>
	.word 0xea122480  ! 746: LDUH_I	lduh	[%r8 + 0x0480], %r21
	.word 0xe0aa26f8  ! 747: STBA_I	stba	%r16, [%r8 + 0x06f8] %asi
	.word 0xc8320009  ! 749: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc8420009  ! 749: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xe31a0009  ! 750: LDDF_R	ldd	[%r8, %r9], %f17
	.word 0x0a800001  ! 751: BCS	bcs  	<label_0x1>
	.word 0xdf3a24c0  ! 752: STDF_I	std	%f15, [0x04c0, %r8]
	.word 0x8fa208a9  ! 753: FSUBs	fsubs	%f8, %f9, %f7
	.word 0xc3ea1009  ! 754: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc36a0009  ! 755: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xdbe21009  ! 756: CASA_I	casa	[%r8] 0x80, %r9, %r13
	.word 0x88da0009  ! 757: SMULcc_R	smulcc 	%r8, %r9, %r4
	.word 0xe4ca2bc0  ! 758: LDSBA_I	ldsba	[%r8, + 0x0bc0] %asi, %r18
	.word 0xc41a0009  ! 759: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xf522250c  ! 760: STF_I	st	%f26, [0x050c, %r8]
	.word 0xa6fa0009  ! 761: SDIVcc_R	sdivcc 	%r8, %r9, %r19
	.word 0xf4220009  ! 763: STW_R	stw	%r26, [%r8 + %r9]
	.word 0xce4a0009  ! 763: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0x8d6a0009  ! 764: SDIVX_R	sdivx	%r8, %r9, %r6
	.word 0x8143e07d  ! 765: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xf0420009  ! 766: LDSW_R	ldsw	[%r8 + %r9], %r24
	.word 0x0c800002  ! 767: BNEG	bneg  	<label_0x2>
	.word 0xce2a0009  ! 769: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xca0a0009  ! 769: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0x86d2219c  ! 770: UMULcc_I	umulcc 	%r8, 0x019c, %r3
	.word 0xcf3a2310  ! 771: STDF_I	std	%f7, [0x0310, %r8]
	.word 0xc2422974  ! 772: LDSW_I	ldsw	[%r8 + 0x0974], %r1
	.word 0xde420009  ! 773: LDSW_R	ldsw	[%r8 + %r9], %r15
	.word 0xce7a22ec  ! 774: SWAP_I	swap	%r7, [%r8 + 0x02ec]
	.word 0xb4d20009  ! 775: UMULcc_R	umulcc 	%r8, %r9, %r26
	.word 0xe4a22988  ! 776: STWA_I	stwa	%r18, [%r8 + 0x0988] %asi
	.word 0xc6921009  ! 777: LDUHA_R	lduha	[%r8, %r9] 0x80, %r3
	.word 0xc3ea1009  ! 778: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc3ea1009  ! 779: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc3e22009  ! 780: CASA_R	casa	[%r8] %asi, %r9, %r1
	.word 0xc36a0009  ! 781: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xea220009  ! 783: STW_R	stw	%r21, [%r8 + %r9]
	.word 0xc40a0009  ! 783: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xca6a0009  ! 784: LDSTUB_R	ldstub	%r5, [%r8 + %r9]
	.word 0xc53a2730  ! 785: STDF_I	std	%f2, [0x0730, %r8]
	.word 0xc8da1009  ! 786: LDXA_R	ldxa	[%r8, %r9] 0x80, %r4
	.word 0xcc220009  ! 788: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xca120009  ! 788: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xc4f21009  ! 789: STXA_R	stxa	%r2, [%r8 + %r9] 0x80
	.word 0xee2a0009  ! 791: STB_R	stb	%r23, [%r8 + %r9]
	.word 0xda4a0009  ! 791: LDSB_R	ldsb	[%r8 + %r9], %r13
	.word 0x2aca0001  ! 792: BRNZ	brnz,a,pt	%8,<label_0xa0001>
	.word 0xc85a0009  ! 793: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xc3ea29dc  ! 794: PREFETCHA_I	prefetcha	[%r8, + 0x09dc] %asi, #one_read
	.word 0x8f222330  ! 795: MULScc_I	mulscc 	%r8, 0x0330, %r7
	.word 0xc36a2514  ! 796: PREFETCH_I	prefetch	[%r8 + 0x0514], #one_read
	.word 0xead21009  ! 797: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r21
	.word 0xca220009  ! 799: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xe64a0009  ! 799: LDSB_R	ldsb	[%r8 + %r9], %r19
	.word 0xc36a243c  ! 800: PREFETCH_I	prefetch	[%r8 + 0x043c], #one_read
	.word 0xa16a0009  ! 801: SDIVX_R	sdivx	%r8, %r9, %r16
	.word 0xdea22bec  ! 802: STWA_I	stwa	%r15, [%r8 + 0x0bec] %asi
	.word 0xcc320009  ! 804: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xca520009  ! 804: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0x3c800001  ! 805: BPOS	bpos,a	<label_0x1>
	.word 0xcbf21009  ! 806: CASXA_I	casxa	[%r8] 0x80, %r9, %r5
	.word 0xc46a2668  ! 807: LDSTUB_I	ldstub	%r2, [%r8 + 0x0668]
	.word 0xc2d22850  ! 808: LDSHA_I	ldsha	[%r8, + 0x0850] %asi, %r1
	.word 0x8c720009  ! 809: UDIV_R	udiv 	%r8, %r9, %r6
	.word 0xc3ea1009  ! 810: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x824a24c4  ! 811: MULX_I	mulx 	%r8, 0x04c4, %r1
	.word 0x82f22adc  ! 812: UDIVcc_I	udivcc 	%r8, 0x0adc, %r1
	.word 0xc9220009  ! 814: STF_R	st	%f4, [%r9, %r8]
	.word 0xca720009  ! 815: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xf01a0009  ! 815: LDD_R	ldd	[%r8 + %r9], %r24
	.word 0x8ba208a9  ! 816: FSUBs	fsubs	%f8, %f9, %f5
	.word 0xca6a0009  ! 817: LDSTUB_R	ldstub	%r5, [%r8 + %r9]
	.word 0xa9a20929  ! 818: FMULs	fmuls	%f8, %f9, %f20
	.word 0xc2320009  ! 820: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xf4520009  ! 820: LDSH_R	ldsh	[%r8 + %r9], %r26
	.word 0xee7a2040  ! 821: SWAP_I	swap	%r23, [%r8 + 0x0040]
	.word 0xc01a0009  ! 822: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0xc2320009  ! 824: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xca5a0009  ! 824: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xba5a0009  ! 825: SMUL_R	smul 	%r8, %r9, %r29
	.word 0xc73a2868  ! 826: STDF_I	std	%f3, [0x0868, %r8]
	.word 0xc3ea283c  ! 827: PREFETCHA_I	prefetcha	[%r8, + 0x083c] %asi, #one_read
	.word 0xee921009  ! 828: LDUHA_R	lduha	[%r8, %r9] 0x80, %r23
	.word 0xcc1a0009  ! 829: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xc36a2724  ! 830: PREFETCH_I	prefetch	[%r8 + 0x0724], #one_read
	.word 0xc36a23c4  ! 831: PREFETCH_I	prefetch	[%r8 + 0x03c4], #one_read
	.word 0x8143e046  ! 832: MEMBAR	membar	#StoreLoad | #LoadStore | #Sync 
	.word 0xc3ea2934  ! 833: PREFETCHA_I	prefetcha	[%r8, + 0x0934] %asi, #one_read
	.word 0xc6720009  ! 835: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xce420009  ! 835: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xcaa227c0  ! 836: STWA_I	stwa	%r5, [%r8 + 0x07c0] %asi
	.word 0x8a4a0009  ! 837: MULX_R	mulx 	%r8, %r9, %r5
	.word 0xded22a98  ! 838: LDSHA_I	ldsha	[%r8, + 0x0a98] %asi, %r15
	.word 0x8143e07b  ! 839: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0x0e800002  ! 840: BVS	bvs  	<label_0x2>
	.word 0xe6da2c80  ! 841: LDXA_I	ldxa	[%r8, + 0x0c80] %asi, %r19
	.word 0xc6ea1009  ! 842: LDSTUBA_R	ldstuba	%r3, [%r8 + %r9] 0x80
	.word 0xcc220009  ! 844: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc64a0009  ! 844: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xcefa25b4  ! 845: SWAPA_I	swapa	%r7, [%r8 + 0x05b4] %asi
	.word 0xcc520009  ! 846: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0x8143e031  ! 847: MEMBAR	membar	#LoadLoad | #Lookaside | #MemIssue 
	.word 0xcf3a2c18  ! 848: STDF_I	std	%f7, [0x0c18, %r8]
	.word 0xfca21009  ! 849: STWA_R	stwa	%r30, [%r8 + %r9] 0x80
	.word 0x82f20009  ! 850: UDIVcc_R	udivcc 	%r8, %r9, %r1
	.word 0xc42a0009  ! 852: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc64a0009  ! 852: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xca320009  ! 854: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xea520009  ! 854: LDSH_R	ldsh	[%r8 + %r9], %r21
	.word 0x8143c000  ! 855: STBAR	stbar
	.word 0xba6a2d48  ! 856: UDIVX_I	udivx 	%r8, 0x0d48, %r29
	.word 0x8143e007  ! 857: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore 
	.word 0xf2220009  ! 859: STW_R	stw	%r25, [%r8 + %r9]
	.word 0xc31a0009  ! 859: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xe2220009  ! 861: STW_R	stw	%r17, [%r8 + %r9]
	.word 0xcd1a0009  ! 861: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xc36a0009  ! 862: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xf9222cb0  ! 863: STF_I	st	%f28, [0x0cb0, %r8]
	.word 0x40000001  ! 864: CALL	call	disp30_1
	.word 0xbe5a2d4c  ! 865: SMUL_I	smul 	%r8, 0x0d4c, %r31
	.word 0x867a0009  ! 866: SDIV_R	sdiv 	%r8, %r9, %r3
	.word 0xca320009  ! 868: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xde5a0009  ! 868: LDX_R	ldx	[%r8 + %r9], %r15
	.word 0x87a208a9  ! 869: FSUBs	fsubs	%f8, %f9, %f3
	.word 0xdc2a0009  ! 871: STB_R	stb	%r14, [%r8 + %r9]
	.word 0xcb020009  ! 871: LDF_R	ld	[%r8, %r9], %f5
	.word 0x8c7a284c  ! 872: SDIV_I	sdiv 	%r8, 0x084c, %r6
	.word 0xc4b21009  ! 873: STHA_R	stha	%r2, [%r8 + %r9] 0x80
	.word 0xceca1009  ! 874: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r7
	.word 0xc2a21009  ! 875: STWA_R	stwa	%r1, [%r8 + %r9] 0x80
	.word 0xdad21009  ! 876: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r13
	.word 0x88520009  ! 877: UMUL_R	umul 	%r8, %r9, %r4
	.word 0xd8320009  ! 879: STH_R	sth	%r12, [%r8 + %r9]
	.word 0xc2020009  ! 879: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xca220009  ! 881: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xf6120009  ! 881: LDUH_R	lduh	[%r8 + %r9], %r27
	.word 0xc7f21009  ! 882: CASXA_I	casxa	[%r8] 0x80, %r9, %r3
	.word 0xd9222990  ! 883: STF_I	st	%f12, [0x0990, %r8]
	.word 0xc49a25d8  ! 884: LDDA_I	ldda	[%r8, + 0x05d8] %asi, %r2
	.word 0xcc522568  ! 885: LDSH_I	ldsh	[%r8 + 0x0568], %r6
	.word 0xc5220009  ! 887: STF_R	st	%f2, [%r9, %r8]
	.word 0xe4720009  ! 888: STX_R	stx	%r18, [%r8 + %r9]
	.word 0xc80a0009  ! 888: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xada20929  ! 889: FMULs	fmuls	%f8, %f9, %f22
	.word 0xc36a0009  ! 890: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0x32800002  ! 891: BNE	bne,a	<label_0x2>
	.word 0xfe5a2b68  ! 892: LDX_I	ldx	[%r8 + 0x0b68], %r31
	.word 0xc36a0009  ! 893: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xae522230  ! 894: UMUL_I	umul 	%r8, 0x0230, %r23
	.word 0x18800001  ! 895: BGU	bgu  	<label_0x1>
	.word 0xf02a0009  ! 897: STB_R	stb	%r24, [%r8 + %r9]
	.word 0xca020009  ! 897: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0x24800001  ! 898: BLE	ble,a	<label_0x1>
	.word 0xcc120009  ! 899: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0x0a800002  ! 900: BCS	bcs  	<label_0x2>
	.word 0xcfe21009  ! 901: CASA_I	casa	[%r8] 0x80, %r9, %r7
	.word 0xc6fa1009  ! 902: SWAPA_R	swapa	%r3, [%r8 + %r9] 0x80
	.word 0xe09a2388  ! 903: LDDA_I	ldda	[%r8, + 0x0388] %asi, %r16
	.word 0x8143c000  ! 904: STBAR	stbar
	.word 0xf0a22d18  ! 905: STWA_I	stwa	%r24, [%r8 + 0x0d18] %asi
	.word 0xb5a20929  ! 906: FMULs	fmuls	%f8, %f9, %f26
	.word 0xd8520009  ! 907: LDSH_R	ldsh	[%r8 + %r9], %r12
	.word 0xc6a21009  ! 908: STWA_R	stwa	%r3, [%r8 + %r9] 0x80
	.word 0x88720009  ! 909: UDIV_R	udiv 	%r8, %r9, %r4
	.word 0xe4220009  ! 911: STW_R	stw	%r18, [%r8 + %r9]
	.word 0xcb020009  ! 911: LDF_R	ld	[%r8, %r9], %f5
	.word 0xb1a209a9  ! 912: FDIVs	fdivs	%f8, %f9, %f24
	.word 0xc36a0009  ! 913: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xccf21009  ! 914: STXA_R	stxa	%r6, [%r8 + %r9] 0x80
	.word 0xc6420009  ! 915: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xc3ea1009  ! 916: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xea0a21fc  ! 917: LDUB_I	ldub	[%r8 + 0x01fc], %r21
	.word 0x36800001  ! 918: BGE	bge,a	<label_0x1>
	.word 0xac4a0009  ! 919: MULX_R	mulx 	%r8, %r9, %r22
	.word 0x8143e008  ! 920: MEMBAR	membar	#StoreStore 
	.word 0xc6220009  ! 922: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xd91a0009  ! 922: LDDF_R	ldd	[%r8, %r9], %f12
	.word 0xc66a0009  ! 923: LDSTUB_R	ldstub	%r3, [%r8 + %r9]
	.word 0xc62a0009  ! 925: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc7020009  ! 925: LDF_R	ld	[%r8, %r9], %f3
	.word 0xc36a0009  ! 926: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc53a2070  ! 927: STDF_I	std	%f2, [0x0070, %r8]
	.word 0xdab22b78  ! 928: STHA_I	stha	%r13, [%r8 + 0x0b78] %asi
	.word 0xc8320009  ! 930: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xca4a0009  ! 930: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xc7e21009  ! 931: CASA_I	casa	[%r8] 0x80, %r9, %r3
	.word 0xb5a208a9  ! 932: FSUBs	fsubs	%f8, %f9, %f26
	.word 0x8c4a0009  ! 933: MULX_R	mulx 	%r8, %r9, %r6
	.word 0x88f22cbc  ! 934: UDIVcc_I	udivcc 	%r8, 0x0cbc, %r4
	.word 0x9a4a0009  ! 935: MULX_R	mulx 	%r8, %r9, %r13
	.word 0xf2522878  ! 936: LDSH_I	ldsh	[%r8 + 0x0878], %r25
	.word 0xc4f22d38  ! 937: STXA_I	stxa	%r2, [%r8 + 0x0d38] %asi
	.word 0xe0922f50  ! 938: LDUHA_I	lduha	[%r8, + 0x0f50] %asi, %r16
	.word 0xca5a0009  ! 939: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0x82720009  ! 940: UDIV_R	udiv 	%r8, %r9, %r1
	.word 0xf92221fc  ! 941: STF_I	st	%f28, [0x01fc, %r8]
	.word 0x14800002  ! 942: BG	bg  	<label_0x2>
	.word 0x8143c000  ! 943: STBAR	stbar
	.word 0xc9020009  ! 944: LDF_R	ld	[%r8, %r9], %f4
	.word 0x8143e033  ! 945: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside | #MemIssue 
	.word 0xc89a29f8  ! 946: LDDA_I	ldda	[%r8, + 0x09f8] %asi, %r4
	.word 0xcdf22009  ! 947: CASXA_R	casxa	[%r8]%asi, %r9, %r6
	.word 0x825a0009  ! 948: SMUL_R	smul 	%r8, %r9, %r1
	.word 0x84f20009  ! 949: UDIVcc_R	udivcc 	%r8, %r9, %r2
	.word 0xc3ea21cc  ! 950: PREFETCHA_I	prefetcha	[%r8, + 0x01cc] %asi, #one_read
	.word 0x9a5a22a0  ! 951: SMUL_I	smul 	%r8, 0x02a0, %r13
	.word 0x9fa208a9  ! 952: FSUBs	fsubs	%f8, %f9, %f15
	.word 0xe2c21009  ! 953: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r17
	.word 0xe61225d0  ! 954: LDUH_I	lduh	[%r8 + 0x05d0], %r19
	.word 0xccb21009  ! 955: STHA_R	stha	%r6, [%r8 + %r9] 0x80
	.word 0xc3ea1009  ! 956: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc3e21009  ! 957: CASA_I	casa	[%r8] 0x80, %r9, %r1
	.word 0xf4da1009  ! 958: LDXA_R	ldxa	[%r8, %r9] 0x80, %r26
	.word 0xfab22b24  ! 959: STHA_I	stha	%r29, [%r8 + 0x0b24] %asi
	.word 0xbaf20009  ! 960: UDIVcc_R	udivcc 	%r8, %r9, %r29
	.word 0xa84a24c8  ! 961: MULX_I	mulx 	%r8, 0x04c8, %r20
	.word 0xce6a0009  ! 962: LDSTUB_R	ldstub	%r7, [%r8 + %r9]
	.word 0x8143e01c  ! 963: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside 
	.word 0xca7a0009  ! 964: SWAP_R	swap	%r5, [%r8 + %r9]
	.word 0x8143c000  ! 965: STBAR	stbar
	.word 0xc36a2e48  ! 966: PREFETCH_I	prefetch	[%r8 + 0x0e48], #one_read
	.word 0xc7222cd0  ! 967: STF_I	st	%f3, [0x0cd0, %r8]
	.word 0xc4ba26b8  ! 968: STDA_I	stda	%r2, [%r8 + 0x06b8] %asi
	.word 0xc6320009  ! 970: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xca020009  ! 970: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xc3ea1009  ! 971: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xcde21009  ! 972: CASA_I	casa	[%r8] 0x80, %r9, %r6
	.word 0x2c800002  ! 973: BNEG	bneg,a	<label_0x2>
	.word 0xc26a0009  ! 974: LDSTUB_R	ldstub	%r1, [%r8 + %r9]
	.word 0xe1f21009  ! 975: CASXA_I	casxa	[%r8] 0x80, %r9, %r16
	.word 0xc3ea1009  ! 976: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc8821009  ! 977: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r4
	.word 0xff222f10  ! 978: STF_I	st	%f31, [0x0f10, %r8]
	.word 0x8ada0009  ! 979: SMULcc_R	smulcc 	%r8, %r9, %r5
	.word 0xa85a2204  ! 980: SMUL_I	smul 	%r8, 0x0204, %r20
	.word 0xde6a0009  ! 981: LDSTUB_R	ldstub	%r15, [%r8 + %r9]
	.word 0x32800002  ! 982: BNE	bne,a	<label_0x2>
	.word 0x82f22210  ! 983: UDIVcc_I	udivcc 	%r8, 0x0210, %r1
	.word 0xc2b21009  ! 984: STHA_R	stha	%r1, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 985: STBAR	stbar
	.word 0xcec21009  ! 986: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r7
	.word 0x20800001  ! 987: BN	bn,a	<label_0x1>
	.word 0x32800001  ! 988: BNE	bne,a	<label_0x1>
	.word 0x26ca0001  ! 989: BRLZ	brlz,a,pt	%8,<label_0xa0001>
	.word 0x8143c000  ! 990: STBAR	stbar
	.word 0xfb220009  ! 992: STF_R	st	%f29, [%r9, %r8]
	.word 0xf4720009  ! 993: STX_R	stx	%r26, [%r8 + %r9]
	.word 0xf4520009  ! 993: LDSH_R	ldsh	[%r8 + %r9], %r26
	.word 0xc36a0009  ! 994: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc2220009  ! 996: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc6120009  ! 996: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0x86fa2ea0  ! 997: SDIVcc_I	sdivcc 	%r8, 0x0ea0, %r3
	.word 0xc3ea1009  ! 998: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xfec22434  ! 999: LDSWA_I	ldswa	[%r8, + 0x0434] %asi, %r31
	.word 0xc3ea1009  ! 1000: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc36a2808  ! 1001: PREFETCH_I	prefetch	[%r8 + 0x0808], #one_read
	.word 0x844a0009  ! 1002: MULX_R	mulx 	%r8, %r9, %r2
	.word 0xb64a0009  ! 1003: MULX_R	mulx 	%r8, %r9, %r27
	.word 0xf0f22130  ! 1004: STXA_I	stxa	%r24, [%r8 + 0x0130] %asi
	.word 0x8c4a0009  ! 1005: MULX_R	mulx 	%r8, %r9, %r6
	.word 0xc6220009  ! 1007: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc8420009  ! 1007: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xe60a2630  ! 1008: LDUB_I	ldub	[%r8 + 0x0630], %r19
	.word 0x9ada0009  ! 1009: SMULcc_R	smulcc 	%r8, %r9, %r13
	.word 0xc36a2628  ! 1010: PREFETCH_I	prefetch	[%r8 + 0x0628], #one_read
	.word 0x825a2758  ! 1011: SMUL_I	smul 	%r8, 0x0758, %r1
	.word 0xc4720009  ! 1013: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xcf1a0009  ! 1013: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xc4320009  ! 1015: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xca420009  ! 1015: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xc4ba28e8  ! 1016: STDA_I	stda	%r2, [%r8 + 0x08e8] %asi
	.word 0x8143c000  ! 1017: STBAR	stbar
	.word 0x85a208a9  ! 1018: FSUBs	fsubs	%f8, %f9, %f2
	.word 0xc36a0009  ! 1019: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc2220009  ! 1021: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xca120009  ! 1021: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0x8143c000  ! 1022: STBAR	stbar
	.word 0xc3e22009  ! 1023: CASA_R	casa	[%r8] %asi, %r9, %r1
	.word 0xc33a2510  ! 1024: STDF_I	std	%f1, [0x0510, %r8]
	.word 0xecea2904  ! 1025: LDSTUBA_I	ldstuba	%r22, [%r8 + 0x0904] %asi
	.word 0x886a0009  ! 1026: UDIVX_R	udivx 	%r8, %r9, %r4
	.word 0xf84a2944  ! 1027: LDSB_I	ldsb	[%r8 + 0x0944], %r28
	.word 0xb66a0009  ! 1028: UDIVX_R	udivx 	%r8, %r9, %r27
	.word 0xf04a0009  ! 1029: LDSB_R	ldsb	[%r8 + %r9], %r24
	.word 0x8143c000  ! 1030: STBAR	stbar
	.word 0xca7a0009  ! 1031: SWAP_R	swap	%r5, [%r8 + %r9]
	.word 0x20800001  ! 1032: BN	bn,a	<label_0x1>
	.word 0xc6821009  ! 1033: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r3
	.word 0xc3ea1009  ! 1034: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xf0220009  ! 1036: STW_R	stw	%r24, [%r8 + %r9]
	.word 0xe64a0009  ! 1036: LDSB_R	ldsb	[%r8 + %r9], %r19
	.word 0x8143e05f  ! 1037: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0xac522fd0  ! 1038: UMUL_I	umul 	%r8, 0x0fd0, %r22
	.word 0xc3ea2708  ! 1039: PREFETCHA_I	prefetcha	[%r8, + 0x0708] %asi, #one_read
	.word 0x86720009  ! 1040: UDIV_R	udiv 	%r8, %r9, %r3
	.word 0xc6fa1009  ! 1041: SWAPA_R	swapa	%r3, [%r8 + %r9] 0x80
	.word 0x8fa20929  ! 1042: FMULs	fmuls	%f8, %f9, %f7
	.word 0xc46a2340  ! 1043: LDSTUB_I	ldstub	%r2, [%r8 + 0x0340]
	.word 0xc2f21009  ! 1044: STXA_R	stxa	%r1, [%r8 + %r9] 0x80
	.word 0x82fa0009  ! 1045: SDIVcc_R	sdivcc 	%r8, %r9, %r1
	.word 0xc9e22009  ! 1046: CASA_R	casa	[%r8] %asi, %r9, %r4
	.word 0xc86a29b8  ! 1047: LDSTUB_I	ldstub	%r4, [%r8 + 0x09b8]
	.word 0xc9e22009  ! 1048: CASA_R	casa	[%r8] %asi, %r9, %r4
	.word 0x38800002  ! 1049: BGU	bgu,a	<label_0x2>
	.word 0xcaea2720  ! 1050: LDSTUBA_I	ldstuba	%r5, [%r8 + 0x0720] %asi
	.word 0xfe220009  ! 1052: STW_R	stw	%r31, [%r8 + %r9]
	.word 0xc01a0009  ! 1052: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0xc27a2f38  ! 1053: SWAP_I	swap	%r1, [%r8 + 0x0f38]
	.word 0x8143e066  ! 1054: MEMBAR	membar	#StoreLoad | #LoadStore | #MemIssue | #Sync 
	.word 0xcf020009  ! 1055: LDF_R	ld	[%r8, %r9], %f7
	.word 0xc9222abc  ! 1056: STF_I	st	%f4, [0x0abc, %r8]
	.word 0x8e7a0009  ! 1057: SDIV_R	sdiv 	%r8, %r9, %r7
	.word 0xc4320009  ! 1059: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc41a0009  ! 1059: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xe8220009  ! 1061: STW_R	stw	%r20, [%r8 + %r9]
	.word 0xca420009  ! 1061: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0x22800002  ! 1062: BE	be,a	<label_0x2>
	.word 0x8fa209a9  ! 1063: FDIVs	fdivs	%f8, %f9, %f7
	.word 0xe53a0009  ! 1065: STDF_R	std	%f18, [%r9, %r8]
	.word 0xc6720009  ! 1066: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc45a0009  ! 1066: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xce0a0009  ! 1067: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xcf222e80  ! 1068: STF_I	st	%f7, [0x0e80, %r8]
	.word 0x04800002  ! 1069: BLE	ble  	<label_0x2>
	.word 0xc4422298  ! 1070: LDSW_I	ldsw	[%r8 + 0x0298], %r2
	.word 0x0c800002  ! 1071: BNEG	bneg  	<label_0x2>
	.word 0x8143c000  ! 1072: STBAR	stbar
	.word 0xca8a2ea8  ! 1073: LDUBA_I	lduba	[%r8, + 0x0ea8] %asi, %r5
	.word 0xe4020009  ! 1074: LDUW_R	lduw	[%r8 + %r9], %r18
	.word 0xcb220009  ! 1076: STF_R	st	%f5, [%r9, %r8]
	.word 0xc8720009  ! 1077: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc4420009  ! 1077: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xc2ea1009  ! 1078: LDSTUBA_R	ldstuba	%r1, [%r8 + %r9] 0x80
	.word 0xce2a0009  ! 1080: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xca120009  ! 1080: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xc3ea2738  ! 1081: PREFETCHA_I	prefetcha	[%r8, + 0x0738] %asi, #one_read
	.word 0xceea2458  ! 1082: LDSTUBA_I	ldstuba	%r7, [%r8 + 0x0458] %asi
	.word 0xc3ea2120  ! 1083: PREFETCHA_I	prefetcha	[%r8, + 0x0120] %asi, #one_read
	.word 0xcada1009  ! 1084: LDXA_R	ldxa	[%r8, %r9] 0x80, %r5
	.word 0x1a800002  ! 1085: BCC	bcc  	<label_0x2>
	.word 0xc82a0009  ! 1087: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xf01a0009  ! 1087: LDD_R	ldd	[%r8 + %r9], %r24
	.word 0xc6120009  ! 1088: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xccf22bb0  ! 1089: STXA_I	stxa	%r6, [%r8 + 0x0bb0] %asi
	.word 0xc3ea1009  ! 1090: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xdcc223f0  ! 1091: LDSWA_I	ldswa	[%r8, + 0x03f0] %asi, %r14
	.word 0xc8f22c50  ! 1092: STXA_I	stxa	%r4, [%r8 + 0x0c50] %asi
	.word 0xcaca1009  ! 1093: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r5
	.word 0xcc2a0009  ! 1095: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xe60a0009  ! 1095: LDUB_R	ldub	[%r8 + %r9], %r19
	.word 0xb66a0009  ! 1096: UDIVX_R	udivx 	%r8, %r9, %r27
	.word 0xc4522de4  ! 1097: LDSH_I	ldsh	[%r8 + 0x0de4], %r2
	.word 0xb9220009  ! 1098: MULScc_R	mulscc 	%r8, %r9, %r28
	.word 0x10800001  ! 1099: BA	ba  	<label_0x1>
	.word 0xc3ea1009  ! 1100: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x3a800001  ! 1101: BCC	bcc,a	<label_0x1>
	.word 0xb6f22280  ! 1102: UDIVcc_I	udivcc 	%r8, 0x0280, %r27
	.word 0xc33a0009  ! 1104: STDF_R	std	%f1, [%r9, %r8]
	.word 0xce720009  ! 1105: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc2120009  ! 1105: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xce5a0009  ! 1106: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0x8143e038  ! 1107: MEMBAR	membar	#StoreStore | #Lookaside | #MemIssue 
	.word 0xe62a0009  ! 1109: STB_R	stb	%r19, [%r8 + %r9]
	.word 0xc25a0009  ! 1109: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0x88520009  ! 1110: UMUL_R	umul 	%r8, %r9, %r4
	.word 0x8fa20829  ! 1111: FADDs	fadds	%f8, %f9, %f7
	.word 0xc4ba2f98  ! 1112: STDA_I	stda	%r2, [%r8 + 0x0f98] %asi
	.word 0xca5a0009  ! 1113: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xcc522fa4  ! 1114: LDSH_I	ldsh	[%r8 + 0x0fa4], %r6
	.word 0x82d222d0  ! 1115: UMULcc_I	umulcc 	%r8, 0x02d0, %r1
	.word 0x89a208a9  ! 1116: FSUBs	fsubs	%f8, %f9, %f4
	.word 0xc93a0009  ! 1118: STDF_R	std	%f4, [%r9, %r8]
	.word 0xca720009  ! 1119: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xea5a0009  ! 1119: LDX_R	ldx	[%r8 + %r9], %r21
	.word 0x8ed22950  ! 1120: UMULcc_I	umulcc 	%r8, 0x0950, %r7
	.word 0xc36a25d4  ! 1121: PREFETCH_I	prefetch	[%r8 + 0x05d4], #one_read
	.word 0xe05a24a0  ! 1122: LDX_I	ldx	[%r8 + 0x04a0], %r16
	.word 0xc22a0009  ! 1124: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc9020009  ! 1124: LDF_R	ld	[%r8, %r9], %f4
	.word 0xc64a279c  ! 1125: LDSB_I	ldsb	[%r8 + 0x079c], %r3
	.word 0xd62a0009  ! 1127: STB_R	stb	%r11, [%r8 + %r9]
	.word 0xe2420009  ! 1127: LDSW_R	ldsw	[%r8 + %r9], %r17
	.word 0xce921009  ! 1128: LDUHA_R	lduha	[%r8, %r9] 0x80, %r7
	.word 0xf6220009  ! 1130: STW_R	stw	%r27, [%r8 + %r9]
	.word 0xca120009  ! 1130: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xf3f22009  ! 1131: CASXA_R	casxa	[%r8]%asi, %r9, %r25
	.word 0xaba20829  ! 1132: FADDs	fadds	%f8, %f9, %f21
	.word 0xcd220009  ! 1134: STF_R	st	%f6, [%r9, %r8]
	.word 0xfa720009  ! 1135: STX_R	stx	%r29, [%r8 + %r9]
	.word 0xc4420009  ! 1135: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0x8143c000  ! 1136: STBAR	stbar
	.word 0x8143c000  ! 1137: STBAR	stbar
	.word 0x04ca0001  ! 1138: BRLEZ	brlez  ,pt	%8,<label_0xa0001>
	.word 0xcc020009  ! 1139: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0x8143c000  ! 1140: STBAR	stbar
	.word 0xb8520009  ! 1141: UMUL_R	umul 	%r8, %r9, %r28
	.word 0xc36a2110  ! 1142: PREFETCH_I	prefetch	[%r8 + 0x0110], #one_read
	.word 0xc42a0009  ! 1144: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xca020009  ! 1144: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xa8520009  ! 1145: UMUL_R	umul 	%r8, %r9, %r20
	.word 0xc6b21009  ! 1146: STHA_R	stha	%r3, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 1147: STBAR	stbar
	.word 0xcc320009  ! 1149: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc2120009  ! 1149: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xca921009  ! 1150: LDUHA_R	lduha	[%r8, %r9] 0x80, %r5
	.word 0xc36a0009  ! 1151: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0x86720009  ! 1152: UDIV_R	udiv 	%r8, %r9, %r3
	.word 0x846a2058  ! 1153: UDIVX_I	udivx 	%r8, 0x0058, %r2
	.word 0xf2220009  ! 1155: STW_R	stw	%r25, [%r8 + %r9]
	.word 0xec420009  ! 1155: LDSW_R	ldsw	[%r8 + %r9], %r22
	.word 0xc36a25fc  ! 1156: PREFETCH_I	prefetch	[%r8 + 0x05fc], #one_read
	.word 0x0c800001  ! 1157: BNEG	bneg  	<label_0x1>
	.word 0xd9220009  ! 1159: STF_R	st	%f12, [%r9, %r8]
	.word 0xc8720009  ! 1160: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xca520009  ! 1160: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xcaa21009  ! 1161: STWA_R	stwa	%r5, [%r8 + %r9] 0x80
	.word 0x8143e044  ! 1162: MEMBAR	membar	#LoadStore | #Sync 
	.word 0xe4ba1009  ! 1163: STDA_R	stda	%r18, [%r8 + %r9] 0x80
	.word 0x8d6a0009  ! 1164: SDIVX_R	sdivx	%r8, %r9, %r6
	.word 0xc6da2580  ! 1165: LDXA_I	ldxa	[%r8, + 0x0580] %asi, %r3
	.word 0xdd222fc0  ! 1166: STF_I	st	%f14, [0x0fc0, %r8]
	.word 0x0e800001  ! 1167: BVS	bvs  	<label_0x1>
	.word 0xc4ea223c  ! 1168: LDSTUBA_I	ldstuba	%r2, [%r8 + 0x023c] %asi
	.word 0xc6320009  ! 1170: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc4020009  ! 1170: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xd6320009  ! 1172: STH_R	sth	%r11, [%r8 + %r9]
	.word 0xc8020009  ! 1172: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0x8a5a0009  ! 1173: SMUL_R	smul 	%r8, %r9, %r5
	.word 0xcaf22268  ! 1174: STXA_I	stxa	%r5, [%r8 + 0x0268] %asi
	.word 0xc8aa2688  ! 1175: STBA_I	stba	%r4, [%r8 + 0x0688] %asi
	.word 0xb0520009  ! 1176: UMUL_R	umul 	%r8, %r9, %r24
	.word 0xf4320009  ! 1178: STH_R	sth	%r26, [%r8 + %r9]
	.word 0xcc420009  ! 1178: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0x8ba209a9  ! 1179: FDIVs	fdivs	%f8, %f9, %f5
	.word 0xf2320009  ! 1181: STH_R	sth	%r25, [%r8 + %r9]
	.word 0xcc0a0009  ! 1181: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xce2a0009  ! 1183: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xcc4a0009  ! 1183: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xc6f22870  ! 1184: STXA_I	stxa	%r3, [%r8 + 0x0870] %asi
	.word 0xc36a0009  ! 1185: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc5220009  ! 1187: STF_R	st	%f2, [%r9, %r8]
	.word 0xc8720009  ! 1188: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc60a0009  ! 1188: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xc93a0009  ! 1190: STDF_R	std	%f4, [%r9, %r8]
	.word 0xfa720009  ! 1191: STX_R	stx	%r29, [%r8 + %r9]
	.word 0xc40a0009  ! 1191: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0x8f220009  ! 1192: MULScc_R	mulscc 	%r8, %r9, %r7
	.word 0xc4ca2ee4  ! 1193: LDSBA_I	ldsba	[%r8, + 0x0ee4] %asi, %r2
	.word 0x8143e008  ! 1194: MEMBAR	membar	#StoreStore 
	.word 0xc2320009  ! 1196: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xcb1a0009  ! 1196: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xfcf21009  ! 1197: STXA_R	stxa	%r30, [%r8 + %r9] 0x80
	.word 0x8a7a0009  ! 1198: SDIV_R	sdiv 	%r8, %r9, %r5
	.word 0xc47a0009  ! 1199: SWAP_R	swap	%r2, [%r8 + %r9]
	.word 0xc41a2c98  ! 1200: LDD_I	ldd	[%r8 + 0x0c98], %r2
	.word 0xb66a2ae4  ! 1201: UDIVX_I	udivx 	%r8, 0x0ae4, %r27
	.word 0xc8320009  ! 1203: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xfa5a0009  ! 1203: LDX_R	ldx	[%r8 + %r9], %r29
	.word 0xd6220009  ! 1205: STW_R	stw	%r11, [%r8 + %r9]
	.word 0xc6120009  ! 1205: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xdac22fb4  ! 1206: LDSWA_I	ldswa	[%r8, + 0x0fb4] %asi, %r13
	.word 0xc8f21009  ! 1207: STXA_R	stxa	%r4, [%r8 + %r9] 0x80
	.word 0x836a2ae0  ! 1208: SDIVX_I	sdivx	%r8, 0x0ae0, %r1
	.word 0xc81a0009  ! 1209: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xceaa2404  ! 1210: STBA_I	stba	%r7, [%r8 + 0x0404] %asi
	.word 0xea5a0009  ! 1211: LDX_R	ldx	[%r8 + %r9], %r21
	.word 0x86522ebc  ! 1212: UMUL_I	umul 	%r8, 0x0ebc, %r3
	.word 0xc3ea2cf0  ! 1213: PREFETCHA_I	prefetcha	[%r8, + 0x0cf0] %asi, #one_read
	.word 0xc8ba1009  ! 1214: STDA_R	stda	%r4, [%r8 + %r9] 0x80
	.word 0xc8ea2110  ! 1215: LDSTUBA_I	ldstuba	%r4, [%r8 + 0x0110] %asi
	.word 0xea420009  ! 1216: LDSW_R	ldsw	[%r8 + %r9], %r21
	.word 0xdaca24ec  ! 1217: LDSBA_I	ldsba	[%r8, + 0x04ec] %asi, %r13
	.word 0xc6320009  ! 1219: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc91a0009  ! 1219: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0x99a20929  ! 1220: FMULs	fmuls	%f8, %f9, %f12
	.word 0xce220009  ! 1222: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc71a0009  ! 1222: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0x8cf20009  ! 1223: UDIVcc_R	udivcc 	%r8, %r9, %r6
	.word 0xc40229e0  ! 1224: LDUW_I	lduw	[%r8 + 0x09e0], %r2
	.word 0xb8f20009  ! 1225: UDIVcc_R	udivcc 	%r8, %r9, %r28
	.word 0x2e800002  ! 1226: BVS	bvs,a	<label_0x2>
	.word 0xe82a0009  ! 1228: STB_R	stb	%r20, [%r8 + %r9]
	.word 0xfc020009  ! 1228: LDUW_R	lduw	[%r8 + %r9], %r30
	.word 0xf2320009  ! 1230: STH_R	sth	%r25, [%r8 + %r9]
	.word 0xcb1a0009  ! 1230: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0x8143e044  ! 1231: MEMBAR	membar	#LoadStore | #Sync 
	.word 0x8143e011  ! 1232: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x8b6a2428  ! 1233: SDIVX_I	sdivx	%r8, 0x0428, %r5
	.word 0xf8ba2e98  ! 1234: STDA_I	stda	%r28, [%r8 + 0x0e98] %asi
	.word 0x84d20009  ! 1235: UMULcc_R	umulcc 	%r8, %r9, %r2
	.word 0xc8ba1009  ! 1236: STDA_R	stda	%r4, [%r8 + %r9] 0x80
	.word 0xc49a2fb0  ! 1237: LDDA_I	ldda	[%r8, + 0x0fb0] %asi, %r2
	.word 0xc4b21009  ! 1238: STHA_R	stha	%r2, [%r8 + %r9] 0x80
	.word 0xaed20009  ! 1239: UMULcc_R	umulcc 	%r8, %r9, %r23
	.word 0xc6c21009  ! 1240: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r3
	.word 0xf93a0009  ! 1242: STDF_R	std	%f28, [%r9, %r8]
	.word 0xce720009  ! 1243: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xde420009  ! 1243: LDSW_R	ldsw	[%r8 + %r9], %r15
	.word 0xcc220009  ! 1245: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xf6520009  ! 1245: LDSH_R	ldsh	[%r8 + %r9], %r27
	.word 0xa4d22ae8  ! 1246: UMULcc_I	umulcc 	%r8, 0x0ae8, %r18
	.word 0x0e800001  ! 1247: BVS	bvs  	<label_0x1>
	.word 0xccba1009  ! 1248: STDA_R	stda	%r6, [%r8 + %r9] 0x80
	.word 0xc4b22fa4  ! 1249: STHA_I	stha	%r2, [%r8 + 0x0fa4] %asi
	.word 0xc93a2268  ! 1250: STDF_I	std	%f4, [0x0268, %r8]
	.word 0x36800002  ! 1251: BGE	bge,a	<label_0x2>
	.word 0x8143e04c  ! 1252: MEMBAR	membar	#LoadStore | #StoreStore | #Sync 
	.word 0xce220009  ! 1254: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xcf020009  ! 1254: LDF_R	ld	[%r8, %r9], %f7
	.word 0xc8f22048  ! 1255: STXA_I	stxa	%r4, [%r8 + 0x0048] %asi
	.word 0xc81a2ff8  ! 1256: LDD_I	ldd	[%r8 + 0x0ff8], %r4
	.word 0xccba1009  ! 1257: STDA_R	stda	%r6, [%r8 + %r9] 0x80
	.word 0xb85a2e50  ! 1258: SMUL_I	smul 	%r8, 0x0e50, %r28
	.word 0xce320009  ! 1260: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xce120009  ! 1260: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xc3ea221c  ! 1261: PREFETCHA_I	prefetcha	[%r8, + 0x021c] %asi, #one_read
	.word 0xce6a264c  ! 1262: LDSTUB_I	ldstub	%r7, [%r8 + 0x064c]
	.word 0x8143e03f  ! 1263: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0xc4220009  ! 1265: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xf6020009  ! 1265: LDUW_R	lduw	[%r8 + %r9], %r27
	.word 0x8ed20009  ! 1266: UMULcc_R	umulcc 	%r8, %r9, %r7
	.word 0xec020009  ! 1267: LDUW_R	lduw	[%r8 + %r9], %r22
	.word 0x8fa208a9  ! 1268: FSUBs	fsubs	%f8, %f9, %f7
	.word 0xceaa1009  ! 1269: STBA_R	stba	%r7, [%r8 + %r9] 0x80
	.word 0x82fa0009  ! 1270: SDIVcc_R	sdivcc 	%r8, %r9, %r1
	.word 0xc66a0009  ! 1271: LDSTUB_R	ldstub	%r3, [%r8 + %r9]
	.word 0xceb2235c  ! 1272: STHA_I	stha	%r7, [%r8 + 0x035c] %asi
	.word 0x8143e039  ! 1273: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside | #MemIssue 
	.word 0xc36a0009  ! 1274: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc36a0009  ! 1275: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xcaca2d3c  ! 1276: LDSBA_I	ldsba	[%r8, + 0x0d3c] %asi, %r5
	.word 0xccf21009  ! 1277: STXA_R	stxa	%r6, [%r8 + %r9] 0x80
	.word 0xf2320009  ! 1279: STH_R	sth	%r25, [%r8 + %r9]
	.word 0xc51a0009  ! 1279: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xb64a0009  ! 1280: MULX_R	mulx 	%r8, %r9, %r27
	.word 0xb0f20009  ! 1281: UDIVcc_R	udivcc 	%r8, %r9, %r24
	.word 0x0eca0001  ! 1282: BRGEZ	brgez  ,pt	%8,<label_0xa0001>
	.word 0x8143e05e  ! 1283: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0xc3ea2d4c  ! 1284: PREFETCHA_I	prefetcha	[%r8, + 0x0d4c] %asi, #one_read
	.word 0xce821009  ! 1285: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r7
	.word 0xfcaa1009  ! 1286: STBA_R	stba	%r30, [%r8 + %r9] 0x80
	.word 0xceea1009  ! 1287: LDSTUBA_R	ldstuba	%r7, [%r8 + %r9] 0x80
	.word 0xca120009  ! 1288: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xca020009  ! 1289: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xd49a29a8  ! 1290: LDDA_I	ldda	[%r8, + 0x09a8] %asi, %r10
	.word 0xc36a0009  ! 1291: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0x8143c000  ! 1292: STBAR	stbar
	.word 0xf82a0009  ! 1294: STB_R	stb	%r28, [%r8 + %r9]
	.word 0xc4520009  ! 1294: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0x2c800001  ! 1295: BNEG	bneg,a	<label_0x1>
	.word 0xec2a0009  ! 1297: STB_R	stb	%r22, [%r8 + %r9]
	.word 0xc2420009  ! 1297: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xdde22009  ! 1298: CASA_R	casa	[%r8] %asi, %r9, %r14
	.word 0x2ec20001  ! 1299: BRGEZ	brgez,a,nt	%8,<label_0x20001>
	.word 0xdc2a0009  ! 1301: STB_R	stb	%r14, [%r8 + %r9]
	.word 0xca420009  ! 1301: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0x98d20009  ! 1302: UMULcc_R	umulcc 	%r8, %r9, %r12
	.word 0xb3a209a9  ! 1303: FDIVs	fdivs	%f8, %f9, %f25
	.word 0x8afa0009  ! 1304: SDIVcc_R	sdivcc 	%r8, %r9, %r5
	.word 0x8da20929  ! 1305: FMULs	fmuls	%f8, %f9, %f6
	.word 0x8eda2e68  ! 1306: SMULcc_I	smulcc 	%r8, 0x0e68, %r7
	.word 0x8143e037  ! 1307: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside | #MemIssue 
	.word 0xc5220009  ! 1309: STF_R	st	%f2, [%r9, %r8]
	.word 0xcc720009  ! 1310: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc81a0009  ! 1310: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x86f20009  ! 1311: UDIVcc_R	udivcc 	%r8, %r9, %r3
	.word 0xc8fa1009  ! 1312: SWAPA_R	swapa	%r4, [%r8 + %r9] 0x80
	.word 0xb87223d8  ! 1313: UDIV_I	udiv 	%r8, 0x03d8, %r28
	.word 0xe6720009  ! 1315: STX_R	stx	%r19, [%r8 + %r9]
	.word 0xc81a0009  ! 1315: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xecba2978  ! 1316: STDA_I	stda	%r22, [%r8 + 0x0978] %asi
	.word 0x836a2074  ! 1317: SDIVX_I	sdivx	%r8, 0x0074, %r1
	.word 0xc22a0009  ! 1319: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xdc020009  ! 1319: LDUW_R	lduw	[%r8 + %r9], %r14
	.word 0xf8b22438  ! 1320: STHA_I	stha	%r28, [%r8 + 0x0438] %asi
	.word 0xceea1009  ! 1321: LDSTUBA_R	ldstuba	%r7, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 1322: STBAR	stbar
	.word 0x8143c000  ! 1323: STBAR	stbar
	.word 0xf13a2238  ! 1324: STDF_I	std	%f24, [0x0238, %r8]
	.word 0xc26a2e18  ! 1325: LDSTUB_I	ldstub	%r1, [%r8 + 0x0e18]
	.word 0xccba2780  ! 1326: STDA_I	stda	%r6, [%r8 + 0x0780] %asi
	.word 0xc4b22328  ! 1327: STHA_I	stha	%r2, [%r8 + 0x0328] %asi
	.word 0x8a7a2f58  ! 1328: SDIV_I	sdiv 	%r8, 0x0f58, %r5
	.word 0xc0ba1009  ! 1329: STDA_R	stda	%r0, [%r8 + %r9] 0x80
	.word 0x8e520009  ! 1330: UMUL_R	umul 	%r8, %r9, %r7
	.word 0x8143e07c  ! 1331: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0x82720009  ! 1332: UDIV_R	udiv 	%r8, %r9, %r1
	.word 0xc8320009  ! 1334: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xe11a0009  ! 1334: LDDF_R	ldd	[%r8, %r9], %f16
	.word 0x8143c000  ! 1335: STBAR	stbar
	.word 0xce821009  ! 1336: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r7
	.word 0xe0b21009  ! 1337: STHA_R	stha	%r16, [%r8 + %r9] 0x80
	.word 0xf33a2608  ! 1338: STDF_I	std	%f25, [0x0608, %r8]
	.word 0xc9220009  ! 1340: STF_R	st	%f4, [%r9, %r8]
	.word 0xf6720009  ! 1341: STX_R	stx	%r27, [%r8 + %r9]
	.word 0xcc1a0009  ! 1341: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xc91a2630  ! 1342: LDDF_I	ldd	[%r8, 0x0630], %f4
	.word 0xc8a225c0  ! 1343: STWA_I	stwa	%r4, [%r8 + 0x05c0] %asi
	.word 0xcc2a0009  ! 1345: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xcc5a0009  ! 1345: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0x8ba209a9  ! 1346: FDIVs	fdivs	%f8, %f9, %f5
	.word 0x89220009  ! 1347: MULScc_R	mulscc 	%r8, %r9, %r4
	.word 0xceb21009  ! 1348: STHA_R	stha	%r7, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 1349: STBAR	stbar
	.word 0x825a0009  ! 1350: SMUL_R	smul 	%r8, %r9, %r1
	.word 0x2c800001  ! 1351: BNEG	bneg,a	<label_0x1>
	.word 0x8143c000  ! 1352: STBAR	stbar
	.word 0xc36a2adc  ! 1353: PREFETCH_I	prefetch	[%r8 + 0x0adc], #one_read
	.word 0xc36a0009  ! 1354: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xcc4a0009  ! 1355: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0x856a22e4  ! 1356: SDIVX_I	sdivx	%r8, 0x02e4, %r2
	.word 0xe9222a04  ! 1357: STF_I	st	%f20, [0x0a04, %r8]
	.word 0x9efa2f58  ! 1358: SDIVcc_I	sdivcc 	%r8, 0x0f58, %r15
	.word 0x8143c000  ! 1359: STBAR	stbar
	.word 0xce220009  ! 1361: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc7020009  ! 1361: LDF_R	ld	[%r8, %r9], %f3
	.word 0x8143c000  ! 1362: STBAR	stbar
	.word 0xede21009  ! 1363: CASA_I	casa	[%r8] 0x80, %r9, %r22
	.word 0xc68a1009  ! 1364: LDUBA_R	lduba	[%r8, %r9] 0x80, %r3
	.word 0xc4c22e00  ! 1365: LDSWA_I	ldswa	[%r8, + 0x0e00] %asi, %r2
	.word 0xc3ea1009  ! 1366: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xf33a0009  ! 1368: STDF_R	std	%f25, [%r9, %r8]
	.word 0xcc720009  ! 1369: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xce4a0009  ! 1369: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0x886a26ec  ! 1370: UDIVX_I	udivx 	%r8, 0x06ec, %r4
	.word 0x8cf20009  ! 1371: UDIVcc_R	udivcc 	%r8, %r9, %r6
	.word 0x8143e063  ! 1372: MEMBAR	membar	#LoadLoad | #StoreLoad | #MemIssue | #Sync 
	.word 0xc6220009  ! 1374: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc41a0009  ! 1374: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x8143e073  ! 1375: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside | #MemIssue | #Sync 
	.word 0x8143e060  ! 1376: MEMBAR	membar	#MemIssue | #Sync 
	.word 0xc2320009  ! 1378: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xf41a0009  ! 1378: LDD_R	ldd	[%r8 + %r9], %r26
	.word 0xb0722118  ! 1379: UDIV_I	udiv 	%r8, 0x0118, %r24
	.word 0xfaea214c  ! 1380: LDSTUBA_I	ldstuba	%r29, [%r8 + 0x014c] %asi
	.word 0xc80a0009  ! 1381: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xc4720009  ! 1383: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xcc420009  ! 1383: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xce7a23a8  ! 1384: SWAP_I	swap	%r7, [%r8 + 0x03a8]
	.word 0xcd1a2318  ! 1385: LDDF_I	ldd	[%r8, 0x0318], %f6
	.word 0xc2220009  ! 1387: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc3020009  ! 1387: LDF_R	ld	[%r8, %r9], %f1
	.word 0x8143c000  ! 1388: STBAR	stbar
	.word 0xcc120009  ! 1389: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xba52280c  ! 1390: UMUL_I	umul 	%r8, 0x080c, %r29
	.word 0xca120009  ! 1391: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xe81a2050  ! 1392: LDD_I	ldd	[%r8 + 0x0050], %r20
	.word 0xc20a2db4  ! 1393: LDUB_I	ldub	[%r8 + 0x0db4], %r1
	.word 0x0cca0001  ! 1394: BRGZ	brgz  ,pt	%8,<label_0xa0001>
	.word 0x08800001  ! 1395: BLEU	bleu  	<label_0x1>
	.word 0xc2320009  ! 1397: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc44a0009  ! 1397: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0x3e800001  ! 1398: BVC	bvc,a	<label_0x1>
	.word 0xc3ea1009  ! 1399: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xccba1009  ! 1400: STDA_R	stda	%r6, [%r8 + %r9] 0x80
	.word 0x98720009  ! 1401: UDIV_R	udiv 	%r8, %r9, %r12
	.word 0xc3ea22c4  ! 1402: PREFETCHA_I	prefetcha	[%r8, + 0x02c4] %asi, #one_read
	.word 0xbada28dc  ! 1403: SMULcc_I	smulcc 	%r8, 0x08dc, %r29
	.word 0x8143c000  ! 1404: STBAR	stbar
	.word 0xe62a0009  ! 1406: STB_R	stb	%r19, [%r8 + %r9]
	.word 0xce520009  ! 1406: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xda2a0009  ! 1408: STB_R	stb	%r13, [%r8 + %r9]
	.word 0xc60a0009  ! 1408: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xc2d22998  ! 1409: LDSHA_I	ldsha	[%r8, + 0x0998] %asi, %r1
	.word 0xcb220009  ! 1411: STF_R	st	%f5, [%r9, %r8]
	.word 0xc4720009  ! 1412: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xcc0a0009  ! 1412: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xce220009  ! 1414: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xff020009  ! 1414: LDF_R	ld	[%r8, %r9], %f31
	.word 0xc3ea1009  ! 1415: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xcd222a28  ! 1416: STF_I	st	%f6, [0x0a28, %r8]
	.word 0xcde22009  ! 1417: CASA_R	casa	[%r8] %asi, %r9, %r6
	.word 0x8143e008  ! 1418: MEMBAR	membar	#StoreStore 
	.word 0x8143e07d  ! 1419: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xc36a28f4  ! 1420: PREFETCH_I	prefetch	[%r8 + 0x08f4], #one_read
	.word 0xceda1009  ! 1421: LDXA_R	ldxa	[%r8, %r9] 0x80, %r7
	.word 0xcc6a2a04  ! 1422: LDSTUB_I	ldstub	%r6, [%r8 + 0x0a04]
	.word 0xc36a2c38  ! 1423: PREFETCH_I	prefetch	[%r8 + 0x0c38], #one_read
	.word 0x84fa0009  ! 1424: SDIVcc_R	sdivcc 	%r8, %r9, %r2
	.word 0x884a2458  ! 1425: MULX_I	mulx 	%r8, 0x0458, %r4
	.word 0xee7a0009  ! 1426: SWAP_R	swap	%r23, [%r8 + %r9]
	.word 0xcaea2d50  ! 1427: LDSTUBA_I	ldstuba	%r5, [%r8 + 0x0d50] %asi
	.word 0xd72227c0  ! 1428: STF_I	st	%f11, [0x07c0, %r8]
	.word 0xa6722b8c  ! 1429: UDIV_I	udiv 	%r8, 0x0b8c, %r19
	.word 0xc65a0009  ! 1430: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0x8a5a0009  ! 1431: SMUL_R	smul 	%r8, %r9, %r5
	.word 0x9cf20009  ! 1432: UDIVcc_R	udivcc 	%r8, %r9, %r14
	.word 0xc3ea1009  ! 1433: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xcefa2988  ! 1434: SWAPA_I	swapa	%r7, [%r8 + 0x0988] %asi
	.word 0xcb220009  ! 1436: STF_R	st	%f5, [%r9, %r8]
	.word 0xd8720009  ! 1437: STX_R	stx	%r12, [%r8 + %r9]
	.word 0xca520009  ! 1437: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xc4b22d1c  ! 1438: STHA_I	stha	%r2, [%r8 + 0x0d1c] %asi
	.word 0xffe21009  ! 1439: CASA_I	casa	[%r8] 0x80, %r9, %r31
	.word 0x88d20009  ! 1440: UMULcc_R	umulcc 	%r8, %r9, %r4
	.word 0xc3ea2644  ! 1441: PREFETCHA_I	prefetcha	[%r8, + 0x0644] %asi, #one_read
	.word 0x0eca0001  ! 1442: BRGEZ	brgez  ,pt	%8,<label_0xa0001>
	.word 0xf2ea1009  ! 1443: LDSTUBA_R	ldstuba	%r25, [%r8 + %r9] 0x80
	.word 0x8143e039  ! 1444: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside | #MemIssue 
	.word 0x8d220009  ! 1445: MULScc_R	mulscc 	%r8, %r9, %r6
	.word 0xeec21009  ! 1446: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r23
	.word 0xef222aa0  ! 1447: STF_I	st	%f23, [0x0aa0, %r8]
	.word 0x40000001  ! 1448: CALL	call	disp30_1
	.word 0x04800001  ! 1449: BLE	ble  	<label_0x1>
	.word 0x84fa0009  ! 1450: SDIVcc_R	sdivcc 	%r8, %r9, %r2
	.word 0x8143e017  ! 1451: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside 
	.word 0xca320009  ! 1453: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xce0a0009  ! 1453: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xe4ba1009  ! 1454: STDA_R	stda	%r18, [%r8 + %r9] 0x80
	.word 0x9ba20829  ! 1455: FADDs	fadds	%f8, %f9, %f13
	.word 0x0c800001  ! 1456: BNEG	bneg  	<label_0x1>
	.word 0x8c720009  ! 1457: UDIV_R	udiv 	%r8, %r9, %r6
	.word 0x24c20001  ! 1458: BRLEZ	brlez,a,nt	%8,<label_0x20001>
	.word 0x8143e021  ! 1459: MEMBAR	membar	#LoadLoad | #MemIssue 
	.word 0x824a262c  ! 1460: MULX_I	mulx 	%r8, 0x062c, %r1
	.word 0xc3ea1009  ! 1461: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc6fa2e0c  ! 1462: SWAPA_I	swapa	%r3, [%r8 + 0x0e0c] %asi
	.word 0x8a4a2f14  ! 1463: MULX_I	mulx 	%r8, 0x0f14, %r5
	.word 0x88fa0009  ! 1464: SDIVcc_R	sdivcc 	%r8, %r9, %r4
	.word 0xc36a2e64  ! 1465: PREFETCH_I	prefetch	[%r8 + 0x0e64], #one_read
	.word 0xcaa21009  ! 1466: STWA_R	stwa	%r5, [%r8 + %r9] 0x80
	.word 0x34800001  ! 1467: BG	bg,a	<label_0x1>
	.word 0x8143e04c  ! 1468: MEMBAR	membar	#LoadStore | #StoreStore | #Sync 
	.word 0x2c800001  ! 1469: BNEG	bneg,a	<label_0x1>
	.word 0xcc8a1009  ! 1470: LDUBA_R	lduba	[%r8, %r9] 0x80, %r6
	.word 0x887a0009  ! 1471: SDIV_R	sdiv 	%r8, %r9, %r4
	.word 0x8143e060  ! 1472: MEMBAR	membar	#MemIssue | #Sync 
	.word 0xc3ea265c  ! 1473: PREFETCHA_I	prefetcha	[%r8, + 0x065c] %asi, #one_read
	.word 0xcf222bc4  ! 1474: STF_I	st	%f7, [0x0bc4, %r8]
	.word 0x84fa2e80  ! 1475: SDIVcc_I	sdivcc 	%r8, 0x0e80, %r2
	.word 0xc36a2834  ! 1476: PREFETCH_I	prefetch	[%r8 + 0x0834], #one_read
	.word 0xc8220009  ! 1478: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc2420009  ! 1478: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0x8143c000  ! 1479: STBAR	stbar
	.word 0x8143e001  ! 1480: MEMBAR	membar	#LoadLoad 
	.word 0xebe21009  ! 1481: CASA_I	casa	[%r8] 0x80, %r9, %r21
	.word 0xcc821009  ! 1482: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r6
	.word 0x8ba208a9  ! 1483: FSUBs	fsubs	%f8, %f9, %f5
	.word 0x8143e07c  ! 1484: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xc82a0009  ! 1486: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc84a0009  ! 1486: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xcc320009  ! 1488: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xf0020009  ! 1488: LDUW_R	lduw	[%r8 + %r9], %r24
	.word 0xc8320009  ! 1490: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xec420009  ! 1490: LDSW_R	ldsw	[%r8 + %r9], %r22
	.word 0xe8320009  ! 1492: STH_R	sth	%r20, [%r8 + %r9]
	.word 0xcd1a0009  ! 1492: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xce522dd4  ! 1493: LDSH_I	ldsh	[%r8 + 0x0dd4], %r7
	.word 0xc8a22d8c  ! 1494: STWA_I	stwa	%r4, [%r8 + 0x0d8c] %asi
	.word 0x40000002  ! 1495: CALL	call	disp30_2
	.word 0x83a20929  ! 1496: FMULs	fmuls	%f8, %f9, %f1
	.word 0x40000001  ! 1497: CALL	call	disp30_1
	.word 0xc5220009  ! 1499: STF_R	st	%f2, [%r9, %r8]
	.word 0xea720009  ! 1500: STX_R	stx	%r21, [%r8 + %r9]
	.word 0xc25a0009  ! 1500: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0x8a5a0009  ! 1501: SMUL_R	smul 	%r8, %r9, %r5
	.word 0xce720009  ! 1503: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xce5a0009  ! 1503: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xd7f22009  ! 1504: CASXA_R	casxa	[%r8]%asi, %r9, %r11
	.word 0x8143e01e  ! 1505: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside 
	.word 0xb3a208a9  ! 1506: FSUBs	fsubs	%f8, %f9, %f25
	.word 0x9f222910  ! 1507: MULScc_I	mulscc 	%r8, 0x0910, %r15
	.word 0xb9a20929  ! 1508: FMULs	fmuls	%f8, %f9, %f28
	.word 0x88d22940  ! 1509: UMULcc_I	umulcc 	%r8, 0x0940, %r4
	.word 0xde0a22bc  ! 1510: LDUB_I	ldub	[%r8 + 0x02bc], %r15
	.word 0x99a209a9  ! 1511: FDIVs	fdivs	%f8, %f9, %f12
	.word 0xc8ca27a0  ! 1512: LDSBA_I	ldsba	[%r8, + 0x07a0] %asi, %r4
	.word 0x3a800001  ! 1513: BCC	bcc,a	<label_0x1>
	.word 0x83a20929  ! 1514: FMULs	fmuls	%f8, %f9, %f1
	.word 0xdaea24e4  ! 1515: LDSTUBA_I	ldstuba	%r13, [%r8 + 0x04e4] %asi
	.word 0xc36a2580  ! 1516: PREFETCH_I	prefetch	[%r8 + 0x0580], #one_read
	.word 0xc3ea29d0  ! 1517: PREFETCHA_I	prefetcha	[%r8, + 0x09d0] %asi, #one_read
	.word 0xca320009  ! 1519: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc4420009  ! 1519: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xe89a1009  ! 1520: LDDA_R	ldda	[%r8, %r9] 0x80, %r20
	.word 0xea7a0009  ! 1521: SWAP_R	swap	%r21, [%r8 + %r9]
	.word 0xee2a0009  ! 1523: STB_R	stb	%r23, [%r8 + %r9]
	.word 0xcc1a0009  ! 1523: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xc49a1009  ! 1524: LDDA_R	ldda	[%r8, %r9] 0x80, %r2
	.word 0xc3ea2878  ! 1525: PREFETCHA_I	prefetcha	[%r8, + 0x0878] %asi, #one_read
	.word 0xccba1009  ! 1526: STDA_R	stda	%r6, [%r8 + %r9] 0x80
	.word 0xc36a2260  ! 1527: PREFETCH_I	prefetch	[%r8 + 0x0260], #one_read
	.word 0xe0b22654  ! 1528: STHA_I	stha	%r16, [%r8 + 0x0654] %asi
	.word 0x89a209a9  ! 1529: FDIVs	fdivs	%f8, %f9, %f4
	.word 0xc4220009  ! 1531: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc6520009  ! 1531: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xc4320009  ! 1533: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xfa020009  ! 1533: LDUW_R	lduw	[%r8 + %r9], %r29
	.word 0xcc320009  ! 1535: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xca420009  ! 1535: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0x8143c000  ! 1536: STBAR	stbar
	.word 0x8143c000  ! 1537: STBAR	stbar
	.word 0xf65a2f18  ! 1538: LDX_I	ldx	[%r8 + 0x0f18], %r27
	.word 0xcc2a0009  ! 1540: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xce520009  ! 1540: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xc3ea2d54  ! 1541: PREFETCHA_I	prefetcha	[%r8, + 0x0d54] %asi, #one_read
	.word 0xcf3a0009  ! 1543: STDF_R	std	%f7, [%r9, %r8]
	.word 0xf6720009  ! 1544: STX_R	stx	%r27, [%r8 + %r9]
	.word 0xc2420009  ! 1544: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xc3e21009  ! 1545: CASA_I	casa	[%r8] 0x80, %r9, %r1
	.word 0x8143e025  ! 1546: MEMBAR	membar	#LoadLoad | #LoadStore | #MemIssue 
	.word 0x8143c000  ! 1547: STBAR	stbar
	.word 0xcf220009  ! 1549: STF_R	st	%f7, [%r9, %r8]
	.word 0xc6720009  ! 1550: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xea120009  ! 1550: LDUH_R	lduh	[%r8 + %r9], %r21
	.word 0xacda28cc  ! 1551: SMULcc_I	smulcc 	%r8, 0x08cc, %r22
	.word 0xc93a0009  ! 1553: STDF_R	std	%f4, [%r9, %r8]
	.word 0xf6720009  ! 1554: STX_R	stx	%r27, [%r8 + %r9]
	.word 0xf85a0009  ! 1554: LDX_R	ldx	[%r8 + %r9], %r28
	.word 0xca8227f0  ! 1555: LDUWA_I	lduwa	[%r8, + 0x07f0] %asi, %r5
	.word 0xc4720009  ! 1557: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xcc020009  ! 1557: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0x8143e068  ! 1558: MEMBAR	membar	#StoreStore | #MemIssue | #Sync 
	.word 0x8143e007  ! 1559: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore 
	.word 0x22c20001  ! 1560: BRZ	brz,a,nt	%8,<label_0x20001>
	.word 0x8143c000  ! 1561: STBAR	stbar
	.word 0x82d20009  ! 1562: UMULcc_R	umulcc 	%r8, %r9, %r1
	.word 0xc3ea1009  ! 1563: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x8143e065  ! 1564: MEMBAR	membar	#LoadLoad | #LoadStore | #MemIssue | #Sync 
	.word 0x8f6a2810  ! 1565: SDIVX_I	sdivx	%r8, 0x0810, %r7
	.word 0xc2fa25c0  ! 1566: SWAPA_I	swapa	%r1, [%r8 + 0x05c0] %asi
	.word 0x30800001  ! 1567: BA	ba,a	<label_0x1>
	.word 0x8143e058  ! 1568: MEMBAR	membar	#StoreStore | #Lookaside | #Sync 
	.word 0x8af22574  ! 1569: UDIVcc_I	udivcc 	%r8, 0x0574, %r5
	.word 0xb4722998  ! 1570: UDIV_I	udiv 	%r8, 0x0998, %r26
	.word 0x8143e035  ! 1571: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside | #MemIssue 
	.word 0x2a800002  ! 1572: BCS	bcs,a	<label_0x2>
	.word 0xe33a0009  ! 1574: STDF_R	std	%f17, [%r9, %r8]
	.word 0xf4720009  ! 1575: STX_R	stx	%r26, [%r8 + %r9]
	.word 0xc8020009  ! 1575: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0x8fa208a9  ! 1576: FSUBs	fsubs	%f8, %f9, %f7
	.word 0x36800001  ! 1577: BGE	bge,a	<label_0x1>
	.word 0x8143c000  ! 1578: STBAR	stbar
	.word 0x876a24dc  ! 1579: SDIVX_I	sdivx	%r8, 0x04dc, %r3
	.word 0xc6ea2f34  ! 1580: LDSTUBA_I	ldstuba	%r3, [%r8 + 0x0f34] %asi
	.word 0x12800002  ! 1581: BNE	bne  	<label_0x2>
	.word 0xc51a0009  ! 1582: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xdc922bd4  ! 1583: LDUHA_I	lduha	[%r8, + 0x0bd4] %asi, %r14
	.word 0xcbe21009  ! 1584: CASA_I	casa	[%r8] 0x80, %r9, %r5
	.word 0xc81a0009  ! 1585: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xe4220009  ! 1587: STW_R	stw	%r18, [%r8 + %r9]
	.word 0xd7020009  ! 1587: LDF_R	ld	[%r8, %r9], %f11
	.word 0xc22a0009  ! 1589: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xce0a0009  ! 1589: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0x8ba208a9  ! 1590: FSUBs	fsubs	%f8, %f9, %f5
	.word 0x8d6a0009  ! 1591: SDIVX_R	sdivx	%r8, %r9, %r6
	.word 0x82da0009  ! 1592: SMULcc_R	smulcc 	%r8, %r9, %r1
	.word 0xeb022a1c  ! 1593: LDF_I	ld	[%r8, 0x0a1c], %f21
	.word 0x826a0009  ! 1594: UDIVX_R	udivx 	%r8, %r9, %r1
	.word 0xc53a0009  ! 1596: STDF_R	std	%f2, [%r9, %r8]
	.word 0xf8720009  ! 1597: STX_R	stx	%r28, [%r8 + %r9]
	.word 0xc7020009  ! 1597: LDF_R	ld	[%r8, %r9], %f3
	.word 0xca0a0009  ! 1598: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0x08800001  ! 1599: BLEU	bleu  	<label_0x1>
	.word 0xf8420009  ! 1600: LDSW_R	ldsw	[%r8 + %r9], %r28
	.word 0x824a2e24  ! 1601: MULX_I	mulx 	%r8, 0x0e24, %r1
	.word 0xc36a2ec8  ! 1602: PREFETCH_I	prefetch	[%r8 + 0x0ec8], #one_read
	.word 0xc6b22c20  ! 1603: STHA_I	stha	%r3, [%r8 + 0x0c20] %asi
	.word 0x8143c000  ! 1604: STBAR	stbar
	.word 0xc8ba1009  ! 1605: STDA_R	stda	%r4, [%r8 + %r9] 0x80
	.word 0xc3ea1009  ! 1606: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc36a2708  ! 1607: PREFETCH_I	prefetch	[%r8 + 0x0708], #one_read
	.word 0xef222d1c  ! 1608: STF_I	st	%f23, [0x0d1c, %r8]
	.word 0xc8ba1009  ! 1609: STDA_R	stda	%r4, [%r8 + %r9] 0x80
	.word 0x8143e03a  ! 1610: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside | #MemIssue 
	.word 0xc4b22e70  ! 1611: STHA_I	stha	%r2, [%r8 + 0x0e70] %asi
	.word 0xcada2af0  ! 1612: LDXA_I	ldxa	[%r8, + 0x0af0] %asi, %r5
	.word 0x02ca0001  ! 1613: BRZ	brz  ,pt	%8,<label_0xa0001>
	.word 0x8143e071  ! 1614: MEMBAR	membar	#LoadLoad | #Lookaside | #MemIssue | #Sync 
	.word 0x85a20929  ! 1615: FMULs	fmuls	%f8, %f9, %f2
	.word 0x0e800002  ! 1616: BVS	bvs  	<label_0x2>
	.word 0xc8320009  ! 1618: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc44a0009  ! 1618: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0x32800002  ! 1619: BNE	bne,a	<label_0x2>
	.word 0xae7a0009  ! 1620: SDIV_R	sdiv 	%r8, %r9, %r23
	.word 0xa4fa29a0  ! 1621: SDIVcc_I	sdivcc 	%r8, 0x09a0, %r18
	.word 0xea7a21f8  ! 1622: SWAP_I	swap	%r21, [%r8 + 0x01f8]
	.word 0x0a800002  ! 1623: BCS	bcs  	<label_0x2>
	.word 0xa8f20009  ! 1624: UDIVcc_R	udivcc 	%r8, %r9, %r20
	.word 0xc4f22b30  ! 1625: STXA_I	stxa	%r2, [%r8 + 0x0b30] %asi
	.word 0x1e800002  ! 1626: BVC	bvc  	<label_0x2>
	.word 0xca220009  ! 1628: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc20a0009  ! 1628: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0x864a0009  ! 1629: MULX_R	mulx 	%r8, %r9, %r3
	.word 0xeef21009  ! 1630: STXA_R	stxa	%r23, [%r8 + %r9] 0x80
	.word 0xc3ea1009  ! 1631: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xcab21009  ! 1632: STHA_R	stha	%r5, [%r8 + %r9] 0x80
	.word 0xc3ea1009  ! 1633: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x88522a44  ! 1634: UMUL_I	umul 	%r8, 0x0a44, %r4
	.word 0x84720009  ! 1635: UDIV_R	udiv 	%r8, %r9, %r2
	.word 0xf0b21009  ! 1636: STHA_R	stha	%r24, [%r8 + %r9] 0x80
	.word 0xce2a0009  ! 1638: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc6420009  ! 1638: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xc36a2084  ! 1639: PREFETCH_I	prefetch	[%r8 + 0x0084], #one_read
	.word 0xcd1a0009  ! 1640: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xc62a0009  ! 1642: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xf6020009  ! 1642: LDUW_R	lduw	[%r8 + %r9], %r27
	.word 0x8143c000  ! 1643: STBAR	stbar
	.word 0x8143c000  ! 1644: STBAR	stbar
	.word 0xc2220009  ! 1646: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc6420009  ! 1646: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0x82d22858  ! 1647: UMULcc_I	umulcc 	%r8, 0x0858, %r1
	.word 0xf4220009  ! 1649: STW_R	stw	%r26, [%r8 + %r9]
	.word 0xf8120009  ! 1649: LDUH_R	lduh	[%r8 + %r9], %r28
	.word 0x87a209a9  ! 1650: FDIVs	fdivs	%f8, %f9, %f3
	.word 0xdcaa1009  ! 1651: STBA_R	stba	%r14, [%r8 + %r9] 0x80
	.word 0xc7222e68  ! 1652: STF_I	st	%f3, [0x0e68, %r8]
	.word 0xc7020009  ! 1653: LDF_R	ld	[%r8, %r9], %f3
	.word 0xdc821009  ! 1654: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r14
	.word 0x28800001  ! 1655: BLEU	bleu,a	<label_0x1>
	.word 0x9e520009  ! 1656: UMUL_R	umul 	%r8, %r9, %r15
	.word 0xec7a0009  ! 1657: SWAP_R	swap	%r22, [%r8 + %r9]
	.word 0xcdf21009  ! 1658: CASXA_I	casxa	[%r8] 0x80, %r9, %r6
	.word 0xca022868  ! 1659: LDUW_I	lduw	[%r8 + 0x0868], %r5
	.word 0x06ca0001  ! 1660: BRLZ	brlz  ,pt	%8,<label_0xa0001>
	.word 0x86f22ee0  ! 1661: UDIVcc_I	udivcc 	%r8, 0x0ee0, %r3
	.word 0x0cc20001  ! 1662: BRGZ	brgz  ,nt	%8,<label_0x20001>
	.word 0xcb222610  ! 1663: STF_I	st	%f5, [0x0610, %r8]
	.word 0xe8b21009  ! 1664: STHA_R	stha	%r20, [%r8 + %r9] 0x80
	.word 0x8cd20009  ! 1665: UMULcc_R	umulcc 	%r8, %r9, %r6
	.word 0xc36a0009  ! 1666: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xbc5a0009  ! 1667: SMUL_R	smul 	%r8, %r9, %r30
	.word 0xaa6a2a44  ! 1668: UDIVX_I	udivx 	%r8, 0x0a44, %r21
	.word 0x8143e04a  ! 1669: MEMBAR	membar	#StoreLoad | #StoreStore | #Sync 
	.word 0xf8f21009  ! 1670: STXA_R	stxa	%r28, [%r8 + %r9] 0x80
	.word 0xbd6a25fc  ! 1671: SDIVX_I	sdivx	%r8, 0x05fc, %r30
	.word 0x827a0009  ! 1672: SDIV_R	sdiv 	%r8, %r9, %r1
	.word 0xc3222c50  ! 1673: STF_I	st	%f1, [0x0c50, %r8]
	.word 0x8c722628  ! 1674: UDIV_I	udiv 	%r8, 0x0628, %r6
	.word 0xc4720009  ! 1676: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xca520009  ! 1676: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xd86a0009  ! 1677: LDSTUB_R	ldstub	%r12, [%r8 + %r9]
	.word 0x2cca0001  ! 1678: BRGZ	brgz,a,pt	%8,<label_0xa0001>
	.word 0xcb220009  ! 1680: STF_R	st	%f5, [%r9, %r8]
	.word 0xc2720009  ! 1681: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc4020009  ! 1681: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xf3220009  ! 1683: STF_R	st	%f25, [%r9, %r8]
	.word 0xf2720009  ! 1684: STX_R	stx	%r25, [%r8 + %r9]
	.word 0xc2520009  ! 1684: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xc36a0009  ! 1685: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0x2a800001  ! 1686: BCS	bcs,a	<label_0x1>
	.word 0xc65a0009  ! 1687: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xfc02289c  ! 1688: LDUW_I	lduw	[%r8 + 0x089c], %r30
	.word 0x82d20009  ! 1689: UMULcc_R	umulcc 	%r8, %r9, %r1
	.word 0x16800001  ! 1690: BGE	bge  	<label_0x1>
	.word 0x8ba20929  ! 1691: FMULs	fmuls	%f8, %f9, %f5
	.word 0x88da0009  ! 1692: SMULcc_R	smulcc 	%r8, %r9, %r4
	.word 0xca220009  ! 1694: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc44a0009  ! 1694: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xf4ca1009  ! 1695: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r26
	.word 0x8cfa0009  ! 1696: SDIVcc_R	sdivcc 	%r8, %r9, %r6
	.word 0xf73a21c0  ! 1697: STDF_I	std	%f27, [0x01c0, %r8]
	.word 0xc3ea1009  ! 1698: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xe13a2140  ! 1699: STDF_I	std	%f16, [0x0140, %r8]
	.word 0xcc8a1009  ! 1700: LDUBA_R	lduba	[%r8, %r9] 0x80, %r6
	.word 0x84d20009  ! 1701: UMULcc_R	umulcc 	%r8, %r9, %r2
	.word 0x867a21b4  ! 1702: SDIV_I	sdiv 	%r8, 0x01b4, %r3
	.word 0xc3ea1009  ! 1703: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x8ad2270c  ! 1704: UMULcc_I	umulcc 	%r8, 0x070c, %r5
	.word 0xc6c22ac4  ! 1705: LDSWA_I	ldswa	[%r8, + 0x0ac4] %asi, %r3
	.word 0xdb222b20  ! 1706: STF_I	st	%f13, [0x0b20, %r8]
	.word 0x8143e032  ! 1707: MEMBAR	membar	#StoreLoad | #Lookaside | #MemIssue 
	.word 0x8143e038  ! 1708: MEMBAR	membar	#StoreStore | #Lookaside | #MemIssue 
	.word 0xf0ba29d0  ! 1709: STDA_I	stda	%r24, [%r8 + 0x09d0] %asi
	.word 0xc3e22009  ! 1710: CASA_R	casa	[%r8] %asi, %r9, %r1
	.word 0x85a208a9  ! 1711: FSUBs	fsubs	%f8, %f9, %f2
	.word 0xf4220009  ! 1713: STW_R	stw	%r26, [%r8 + %r9]
	.word 0xc2420009  ! 1713: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xceda1009  ! 1714: LDXA_R	ldxa	[%r8, %r9] 0x80, %r7
	.word 0xdc7a0009  ! 1715: SWAP_R	swap	%r14, [%r8 + %r9]
	.word 0xcc8a1009  ! 1716: LDUBA_R	lduba	[%r8, %r9] 0x80, %r6
	.word 0x40000001  ! 1717: CALL	call	disp30_1
	.word 0xe05a0009  ! 1718: LDX_R	ldx	[%r8 + %r9], %r16
	.word 0xc4120009  ! 1719: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xe4ca1009  ! 1720: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r18
	.word 0x8143e07a  ! 1721: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xbfa208a9  ! 1722: FSUBs	fsubs	%f8, %f9, %f31
	.word 0xcc1a2110  ! 1723: LDD_I	ldd	[%r8 + 0x0110], %r6
	.word 0xc64a0009  ! 1724: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xc42a0009  ! 1726: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc9020009  ! 1726: LDF_R	ld	[%r8, %r9], %f4
	.word 0x8c7a0009  ! 1727: SDIV_R	sdiv 	%r8, %r9, %r6
	.word 0xfc7a23f8  ! 1728: SWAP_I	swap	%r30, [%r8 + 0x03f8]
	.word 0x8143c000  ! 1729: STBAR	stbar
	.word 0x24800002  ! 1730: BLE	ble,a	<label_0x2>
	.word 0xca2a0009  ! 1732: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xce120009  ! 1732: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xe01a0009  ! 1733: LDD_R	ldd	[%r8 + %r9], %r16
	.word 0xdac21009  ! 1734: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r13
	.word 0xe71a0009  ! 1735: LDDF_R	ldd	[%r8, %r9], %f19
	.word 0xc4c22018  ! 1736: LDSWA_I	ldswa	[%r8, + 0x0018] %asi, %r2
	.word 0xa8da0009  ! 1737: SMULcc_R	smulcc 	%r8, %r9, %r20
	.word 0x86da0009  ! 1738: SMULcc_R	smulcc 	%r8, %r9, %r3
	.word 0xc4d229f0  ! 1739: LDSHA_I	ldsha	[%r8, + 0x09f0] %asi, %r2
	.word 0xb3a20829  ! 1740: FADDs	fadds	%f8, %f9, %f25
	.word 0xce8a2bb4  ! 1741: LDUBA_I	lduba	[%r8, + 0x0bb4] %asi, %r7
	.word 0xc33a0009  ! 1743: STDF_R	std	%f1, [%r9, %r8]
	.word 0xe2720009  ! 1744: STX_R	stx	%r17, [%r8 + %r9]
	.word 0xd71a0009  ! 1744: LDDF_R	ldd	[%r8, %r9], %f11
	.word 0x8efa0009  ! 1745: SDIVcc_R	sdivcc 	%r8, %r9, %r7
	.word 0xb87221c8  ! 1746: UDIV_I	udiv 	%r8, 0x01c8, %r28
	.word 0x82f22e54  ! 1747: UDIVcc_I	udivcc 	%r8, 0x0e54, %r1
	.word 0xc4ba2a28  ! 1748: STDA_I	stda	%r2, [%r8 + 0x0a28] %asi
	.word 0xc36a0009  ! 1749: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0x02800002  ! 1750: BE	be  	<label_0x2>
	.word 0xca220009  ! 1752: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xf2520009  ! 1752: LDSH_R	ldsh	[%r8 + %r9], %r25
	.word 0xcef21009  ! 1753: STXA_R	stxa	%r7, [%r8 + %r9] 0x80
	.word 0x2a800001  ! 1754: BCS	bcs,a	<label_0x1>
	.word 0xc84a0009  ! 1755: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0x8e5a2b14  ! 1756: SMUL_I	smul 	%r8, 0x0b14, %r7
	.word 0xf01a0009  ! 1757: LDD_R	ldd	[%r8 + %r9], %r24
	.word 0xc4320009  ! 1759: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xcb020009  ! 1759: LDF_R	ld	[%r8, %r9], %f5
	.word 0xcf222e64  ! 1760: STF_I	st	%f7, [0x0e64, %r8]
	.word 0xc2922c00  ! 1761: LDUHA_I	lduha	[%r8, + 0x0c00] %asi, %r1
	.word 0xcb3a2278  ! 1762: STDF_I	std	%f5, [0x0278, %r8]
	.word 0xdef21009  ! 1763: STXA_R	stxa	%r15, [%r8 + %r9] 0x80
	.word 0xc3ea1009  ! 1764: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x896a0009  ! 1765: SDIVX_R	sdivx	%r8, %r9, %r4
	.word 0xce921009  ! 1766: LDUHA_R	lduha	[%r8, %r9] 0x80, %r7
	.word 0xdc6a0009  ! 1767: LDSTUB_R	ldstub	%r14, [%r8 + %r9]
	.word 0x86fa2a18  ! 1768: SDIVcc_I	sdivcc 	%r8, 0x0a18, %r3
	.word 0xdbe21009  ! 1769: CASA_I	casa	[%r8] 0x80, %r9, %r13
	.word 0x8143e036  ! 1770: MEMBAR	membar	#StoreLoad | #LoadStore | #Lookaside | #MemIssue 
	.word 0xca2a0009  ! 1772: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xdc420009  ! 1772: LDSW_R	ldsw	[%r8 + %r9], %r14
	.word 0x22c20001  ! 1773: BRZ	brz,a,nt	%8,<label_0x20001>
	.word 0xc93a0009  ! 1775: STDF_R	std	%f4, [%r9, %r8]
	.word 0xde720009  ! 1776: STX_R	stx	%r15, [%r8 + %r9]
	.word 0xe64a0009  ! 1776: LDSB_R	ldsb	[%r8 + %r9], %r19
	.word 0xc4ea2328  ! 1777: LDSTUBA_I	ldstuba	%r2, [%r8 + 0x0328] %asi
	.word 0xc36a0009  ! 1778: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc6320009  ! 1780: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xe04a0009  ! 1780: LDSB_R	ldsb	[%r8 + %r9], %r16
	.word 0xc6fa23b0  ! 1781: SWAPA_I	swapa	%r3, [%r8 + 0x03b0] %asi
	.word 0xc36a2944  ! 1782: PREFETCH_I	prefetch	[%r8 + 0x0944], #one_read
	.word 0x845a2664  ! 1783: SMUL_I	smul 	%r8, 0x0664, %r2
	.word 0x8143c000  ! 1784: STBAR	stbar
	.word 0xc3ea1009  ! 1785: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xd7220009  ! 1787: STF_R	st	%f11, [%r9, %r8]
	.word 0xc4720009  ! 1788: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xdd020009  ! 1788: LDF_R	ld	[%r8, %r9], %f14
	.word 0xf3220009  ! 1790: STF_R	st	%f25, [%r9, %r8]
	.word 0xce720009  ! 1791: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc85a0009  ! 1791: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xc8ba2688  ! 1792: STDA_I	stda	%r4, [%r8 + 0x0688] %asi
	.word 0xea821009  ! 1793: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r21
	.word 0xa5a20829  ! 1794: FADDs	fadds	%f8, %f9, %f18
	.word 0x8143e014  ! 1795: MEMBAR	membar	#LoadStore | #Lookaside 
	.word 0xdb3a2f50  ! 1796: STDF_I	std	%f13, [0x0f50, %r8]
	.word 0xcc320009  ! 1798: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xda020009  ! 1798: LDUW_R	lduw	[%r8 + %r9], %r13
	.word 0xcc2a0009  ! 1800: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xf2020009  ! 1800: LDUW_R	lduw	[%r8 + %r9], %r25
	.word 0xce6a281c  ! 1801: LDSTUB_I	ldstub	%r7, [%r8 + 0x081c]
	.word 0xda0a2b88  ! 1802: LDUB_I	ldub	[%r8 + 0x0b88], %r13
	.word 0xe42a0009  ! 1804: STB_R	stb	%r18, [%r8 + %r9]
	.word 0xc85a0009  ! 1804: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xe05a2ba8  ! 1805: LDX_I	ldx	[%r8 + 0x0ba8], %r16
	.word 0xcff21009  ! 1806: CASXA_I	casxa	[%r8] 0x80, %r9, %r7
	.word 0xca320009  ! 1808: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xce120009  ! 1808: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xe73a2d50  ! 1809: STDF_I	std	%f19, [0x0d50, %r8]
	.word 0xceb22d14  ! 1810: STHA_I	stha	%r7, [%r8 + 0x0d14] %asi
	.word 0xc82a0009  ! 1812: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xcc1a0009  ! 1812: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xec020009  ! 1813: LDUW_R	lduw	[%r8 + %r9], %r22
	.word 0x8e722d6c  ! 1814: UDIV_I	udiv 	%r8, 0x0d6c, %r7
	.word 0xc2ea1009  ! 1815: LDSTUBA_R	ldstuba	%r1, [%r8 + %r9] 0x80
	.word 0x87220009  ! 1816: MULScc_R	mulscc 	%r8, %r9, %r3
	.word 0xfc220009  ! 1818: STW_R	stw	%r30, [%r8 + %r9]
	.word 0xc20a0009  ! 1818: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xb872246c  ! 1819: UDIV_I	udiv 	%r8, 0x046c, %r28
	.word 0xe8c22a9c  ! 1820: LDSWA_I	ldswa	[%r8, + 0x0a9c] %asi, %r20
	.word 0xc84a0009  ! 1821: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xc46a2ca0  ! 1822: LDSTUB_I	ldstub	%r2, [%r8 + 0x0ca0]
	.word 0xccf221a8  ! 1823: STXA_I	stxa	%r6, [%r8 + 0x01a8] %asi
	.word 0x86fa0009  ! 1824: SDIVcc_R	sdivcc 	%r8, %r9, %r3
	.word 0xf8d223b8  ! 1825: LDSHA_I	ldsha	[%r8, + 0x03b8] %asi, %r28
	.word 0xc3ea1009  ! 1826: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc4fa207c  ! 1827: SWAPA_I	swapa	%r2, [%r8 + 0x007c] %asi
	.word 0x8a522924  ! 1828: UMUL_I	umul 	%r8, 0x0924, %r5
	.word 0xc3ea1009  ! 1829: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc22a0009  ! 1831: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xe05a0009  ! 1831: LDX_R	ldx	[%r8 + %r9], %r16
	.word 0x9a5a0009  ! 1832: SMUL_R	smul 	%r8, %r9, %r13
	.word 0xb26a0009  ! 1833: UDIVX_R	udivx 	%r8, %r9, %r25
	.word 0x83a20829  ! 1834: FADDs	fadds	%f8, %f9, %f1
	.word 0xc8220009  ! 1836: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xf0120009  ! 1836: LDUH_R	lduh	[%r8 + %r9], %r24
	.word 0xecaa2bb4  ! 1837: STBA_I	stba	%r22, [%r8 + 0x0bb4] %asi
	.word 0xee2a0009  ! 1839: STB_R	stb	%r23, [%r8 + %r9]
	.word 0xc64a0009  ! 1839: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0x8143c000  ! 1840: STBAR	stbar
	.word 0xc4ba29f0  ! 1841: STDA_I	stda	%r2, [%r8 + 0x09f0] %asi
	.word 0xceda2c30  ! 1842: LDXA_I	ldxa	[%r8, + 0x0c30] %asi, %r7
	.word 0xc2220009  ! 1844: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xff1a0009  ! 1844: LDDF_R	ldd	[%r8, %r9], %f31
	.word 0xcbe21009  ! 1845: CASA_I	casa	[%r8] 0x80, %r9, %r5
	.word 0x83a20929  ! 1846: FMULs	fmuls	%f8, %f9, %f1
	.word 0x8143c000  ! 1847: STBAR	stbar
	.word 0x83222b74  ! 1848: MULScc_I	mulscc 	%r8, 0x0b74, %r1
	.word 0xc3222f94  ! 1849: STF_I	st	%f1, [0x0f94, %r8]
	.word 0xe33a0009  ! 1851: STDF_R	std	%f17, [%r9, %r8]
	.word 0xc6720009  ! 1852: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc6020009  ! 1852: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0x8a520009  ! 1853: UMUL_R	umul 	%r8, %r9, %r5
	.word 0xe6921009  ! 1854: LDUHA_R	lduha	[%r8, %r9] 0x80, %r19
	.word 0xce922628  ! 1855: LDUHA_I	lduha	[%r8, + 0x0628] %asi, %r7
	.word 0xce6a2efc  ! 1856: LDSTUB_I	ldstub	%r7, [%r8 + 0x0efc]
	.word 0xc6c21009  ! 1857: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r3
	.word 0x06800001  ! 1858: BL	bl  	<label_0x1>
	.word 0x8da20829  ! 1859: FADDs	fadds	%f8, %f9, %f6
	.word 0xc8b21009  ! 1860: STHA_R	stha	%r4, [%r8 + %r9] 0x80
	.word 0x86da29ac  ! 1861: SMULcc_I	smulcc 	%r8, 0x09ac, %r3
	.word 0xcb3a0009  ! 1863: STDF_R	std	%f5, [%r9, %r8]
	.word 0xf0720009  ! 1864: STX_R	stx	%r24, [%r8 + %r9]
	.word 0xcc1a0009  ! 1864: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xce7a0009  ! 1865: SWAP_R	swap	%r7, [%r8 + %r9]
	.word 0xc36a0009  ! 1866: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xfcea2894  ! 1867: LDSTUBA_I	ldstuba	%r30, [%r8 + 0x0894] %asi
	.word 0xc3ea1009  ! 1868: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x8efa2240  ! 1869: SDIVcc_I	sdivcc 	%r8, 0x0240, %r7
	.word 0x8143e04f  ! 1870: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #Sync 
	.word 0xc93a2828  ! 1871: STDF_I	std	%f4, [0x0828, %r8]
	.word 0x8c6a206c  ! 1872: UDIVX_I	udivx 	%r8, 0x006c, %r6
	.word 0x8143c000  ! 1873: STBAR	stbar
	.word 0x864a2fd0  ! 1874: MULX_I	mulx 	%r8, 0x0fd0, %r3
	.word 0x8143e056  ! 1875: MEMBAR	membar	#StoreLoad | #LoadStore | #Lookaside | #Sync 
	.word 0xcf3a2058  ! 1876: STDF_I	std	%f7, [0x0058, %r8]
	.word 0xfc0a0009  ! 1877: LDUB_R	ldub	[%r8 + %r9], %r30
	.word 0xc53a2b28  ! 1878: STDF_I	std	%f2, [0x0b28, %r8]
	.word 0xc33a0009  ! 1880: STDF_R	std	%f1, [%r9, %r8]
	.word 0xf8720009  ! 1881: STX_R	stx	%r28, [%r8 + %r9]
	.word 0xf04a0009  ! 1881: LDSB_R	ldsb	[%r8 + %r9], %r24
	.word 0xbefa2f48  ! 1882: SDIVcc_I	sdivcc 	%r8, 0x0f48, %r31
	.word 0xe49a2b30  ! 1883: LDDA_I	ldda	[%r8, + 0x0b30] %asi, %r18
	.word 0xcb3a0009  ! 1885: STDF_R	std	%f5, [%r9, %r8]
	.word 0xce720009  ! 1886: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xf4420009  ! 1886: LDSW_R	ldsw	[%r8 + %r9], %r26
	.word 0x8143e066  ! 1887: MEMBAR	membar	#StoreLoad | #LoadStore | #MemIssue | #Sync 
	.word 0x8143c000  ! 1888: STBAR	stbar
	.word 0xd6320009  ! 1890: STH_R	sth	%r11, [%r8 + %r9]
	.word 0xc9020009  ! 1890: LDF_R	ld	[%r8, %r9], %f4
	.word 0xc9222f04  ! 1891: STF_I	st	%f4, [0x0f04, %r8]
	.word 0xc36a2004  ! 1892: PREFETCH_I	prefetch	[%r8 + 0x0004], #one_read
	.word 0x8143e06d  ! 1893: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #MemIssue | #Sync 
	.word 0xc3ea1009  ! 1894: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xb67a2c10  ! 1895: SDIV_I	sdiv 	%r8, 0x0c10, %r27
	.word 0x8143e015  ! 1896: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside 
	.word 0xf6da2d98  ! 1897: LDXA_I	ldxa	[%r8, + 0x0d98] %asi, %r27
	.word 0x83a209a9  ! 1898: FDIVs	fdivs	%f8, %f9, %f1
	.word 0xdcba1009  ! 1899: STDA_R	stda	%r14, [%r8 + %r9] 0x80
	.word 0xcc520009  ! 1900: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0x2a800002  ! 1901: BCS	bcs,a	<label_0x2>
	.word 0xc36a0009  ! 1902: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xe0220009  ! 1904: STW_R	stw	%r16, [%r8 + %r9]
	.word 0xd7020009  ! 1904: LDF_R	ld	[%r8, %r9], %f11
	.word 0x88720009  ! 1905: UDIV_R	udiv 	%r8, %r9, %r4
	.word 0xe6320009  ! 1907: STH_R	sth	%r19, [%r8 + %r9]
	.word 0xcc4a0009  ! 1907: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xc36a0009  ! 1908: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0x8c4a0009  ! 1909: MULX_R	mulx 	%r8, %r9, %r6
	.word 0x84fa2af0  ! 1910: SDIVcc_I	sdivcc 	%r8, 0x0af0, %r2
	.word 0x8a6a0009  ! 1911: UDIVX_R	udivx 	%r8, %r9, %r5
	.word 0xc81a2b90  ! 1912: LDD_I	ldd	[%r8 + 0x0b90], %r4
	.word 0xc3ea1009  ! 1913: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x8143e050  ! 1914: MEMBAR	membar	#Lookaside | #Sync 
	.word 0xdb3a2330  ! 1915: STDF_I	std	%f13, [0x0330, %r8]
	.word 0x89a20829  ! 1916: FADDs	fadds	%f8, %f9, %f4
	.word 0xcd222800  ! 1917: STF_I	st	%f6, [0x0800, %r8]
	.word 0x8c4a27f4  ! 1918: MULX_I	mulx 	%r8, 0x07f4, %r6
	.word 0x06800001  ! 1919: BL	bl  	<label_0x1>
	.word 0xbd6a2504  ! 1920: SDIVX_I	sdivx	%r8, 0x0504, %r30
	.word 0x8c7a0009  ! 1921: SDIV_R	sdiv 	%r8, %r9, %r6
	.word 0xced21009  ! 1922: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r7
	.word 0xb65a0009  ! 1923: SMUL_R	smul 	%r8, %r9, %r27
	.word 0x865a22c4  ! 1924: SMUL_I	smul 	%r8, 0x02c4, %r3
	.word 0x8a5a0009  ! 1925: SMUL_R	smul 	%r8, %r9, %r5
	.word 0xdaa21009  ! 1926: STWA_R	stwa	%r13, [%r8 + %r9] 0x80
	.word 0x24800002  ! 1927: BLE	ble,a	<label_0x2>
	.word 0xf8b22360  ! 1928: STHA_I	stha	%r28, [%r8 + 0x0360] %asi
	.word 0xccfa2524  ! 1929: SWAPA_I	swapa	%r6, [%r8 + 0x0524] %asi
	.word 0xce12200c  ! 1930: LDUH_I	lduh	[%r8 + 0x000c], %r7
	.word 0xf49a1009  ! 1931: LDDA_R	ldda	[%r8, %r9] 0x80, %r26
	.word 0x8a720009  ! 1932: UDIV_R	udiv 	%r8, %r9, %r5
	.word 0x8efa2208  ! 1933: SDIVcc_I	sdivcc 	%r8, 0x0208, %r7
	.word 0x8143c000  ! 1934: STBAR	stbar
	.word 0xcc4a2b3c  ! 1935: LDSB_I	ldsb	[%r8 + 0x0b3c], %r6
	.word 0xb84a0009  ! 1936: MULX_R	mulx 	%r8, %r9, %r28
	.word 0xc8320009  ! 1938: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc8520009  ! 1938: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xc73a2528  ! 1939: STDF_I	std	%f3, [0x0528, %r8]
	.word 0xc36a2d98  ! 1940: PREFETCH_I	prefetch	[%r8 + 0x0d98], #one_read
	.word 0xccd22bdc  ! 1941: LDSHA_I	ldsha	[%r8, + 0x0bdc] %asi, %r6
	.word 0xe82a0009  ! 1943: STB_R	stb	%r20, [%r8 + %r9]
	.word 0xc60a0009  ! 1943: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0x8fa20829  ! 1944: FADDs	fadds	%f8, %f9, %f7
	.word 0x8a6a0009  ! 1945: UDIVX_R	udivx 	%r8, %r9, %r5
	.word 0xca220009  ! 1947: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc8120009  ! 1947: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xdaca1009  ! 1948: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r13
	.word 0x9ad22bbc  ! 1949: UMULcc_I	umulcc 	%r8, 0x0bbc, %r13
	.word 0x2eca0001  ! 1950: BRGEZ	brgez,a,pt	%8,<label_0xa0001>
	.word 0xc3ea1009  ! 1951: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc73a2408  ! 1952: STDF_I	std	%f3, [0x0408, %r8]
	.word 0xcc220009  ! 1954: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xfa5a0009  ! 1954: LDX_R	ldx	[%r8 + %r9], %r29
	.word 0xc42a0009  ! 1956: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc4120009  ! 1956: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xc4520009  ! 1957: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0x8143e07c  ! 1958: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xc36a2978  ! 1959: PREFETCH_I	prefetch	[%r8 + 0x0978], #one_read
	.word 0xd8ea2e74  ! 1960: LDSTUBA_I	ldstuba	%r12, [%r8 + 0x0e74] %asi
	.word 0xe2da1009  ! 1961: LDXA_R	ldxa	[%r8, %r9] 0x80, %r17
	.word 0xe72221b4  ! 1962: STF_I	st	%f19, [0x01b4, %r8]
	.word 0x2e800001  ! 1963: BVS	bvs,a	<label_0x1>
	.word 0xc3ea1009  ! 1964: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc8220009  ! 1966: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc80a0009  ! 1966: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xc53a27e0  ! 1967: STDF_I	std	%f2, [0x07e0, %r8]
	.word 0x85a208a9  ! 1968: FSUBs	fsubs	%f8, %f9, %f2
	.word 0xc2ea2dfc  ! 1969: LDSTUBA_I	ldstuba	%r1, [%r8 + 0x0dfc] %asi
	.word 0xc8ba2678  ! 1970: STDA_I	stda	%r4, [%r8 + 0x0678] %asi
	.word 0xc67a0009  ! 1971: SWAP_R	swap	%r3, [%r8 + %r9]
	.word 0xf52228f4  ! 1972: STF_I	st	%f26, [0x08f4, %r8]
	.word 0x87a20829  ! 1973: FADDs	fadds	%f8, %f9, %f3
	.word 0xc36a2410  ! 1974: PREFETCH_I	prefetch	[%r8 + 0x0410], #one_read
	.word 0xc8320009  ! 1976: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc81a0009  ! 1976: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xc7222ac0  ! 1977: STF_I	st	%f3, [0x0ac0, %r8]
	.word 0xf60a23b4  ! 1978: LDUB_I	ldub	[%r8 + 0x03b4], %r27
	.word 0x89220009  ! 1979: MULScc_R	mulscc 	%r8, %r9, %r4
	.word 0xc2320009  ! 1981: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xcc420009  ! 1981: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0x876a25b8  ! 1982: SDIVX_I	sdivx	%r8, 0x05b8, %r3
	.word 0xc82a0009  ! 1984: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xcc520009  ! 1984: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0x8143e000  ! 1985: MEMBAR	membar	
	.word 0xc36a0009  ! 1986: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xdcca1009  ! 1987: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r14
	.word 0x8143c000  ! 1988: STBAR	stbar
	.word 0xcaf21009  ! 1989: STXA_R	stxa	%r5, [%r8 + %r9] 0x80
	.word 0xda020009  ! 1990: LDUW_R	lduw	[%r8 + %r9], %r13
	.word 0x2cca0001  ! 1991: BRGZ	brgz,a,pt	%8,<label_0xa0001>
	.word 0xce8a2c98  ! 1992: LDUBA_I	lduba	[%r8, + 0x0c98] %asi, %r7
	.word 0x9ba20829  ! 1993: FADDs	fadds	%f8, %f9, %f13
	.word 0xc2922abc  ! 1994: LDUHA_I	lduha	[%r8, + 0x0abc] %asi, %r1
	.word 0xcd222dbc  ! 1995: STF_I	st	%f6, [0x0dbc, %r8]
	.word 0xc4220009  ! 1997: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc7020009  ! 1997: LDF_R	ld	[%r8, %r9], %f3
	.word 0x885223d0  ! 1998: UMUL_I	umul 	%r8, 0x03d0, %r4
	.word 0xc36a0009  ! 1999: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xf8f22ed0  ! 2000: STXA_I	stxa	%r28, [%r8 + 0x0ed0] %asi
	.word 0xb5a20929  ! 2001: FMULs	fmuls	%f8, %f9, %f26
	.word 0x8143c000  ! 2002: STBAR	stbar
	.word 0xccba1009  ! 2003: STDA_R	stda	%r6, [%r8 + %r9] 0x80
	.word 0x8da20929  ! 2004: FMULs	fmuls	%f8, %f9, %f6
	.word 0xcc220009  ! 2006: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xfa4a0009  ! 2006: LDSB_R	ldsb	[%r8 + %r9], %r29
	.word 0xf2da22a8  ! 2007: LDXA_I	ldxa	[%r8, + 0x02a8] %asi, %r25
	.word 0xcc022468  ! 2008: LDUW_I	lduw	[%r8 + 0x0468], %r6
	.word 0xc36a0009  ! 2009: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xdef21009  ! 2010: STXA_R	stxa	%r15, [%r8 + %r9] 0x80
	.word 0xcc220009  ! 2012: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc8420009  ! 2012: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xdab21009  ! 2013: STHA_R	stha	%r13, [%r8 + %r9] 0x80
	.word 0x88d20009  ! 2014: UMULcc_R	umulcc 	%r8, %r9, %r4
	.word 0xc4821009  ! 2015: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r2
	.word 0xc2320009  ! 2017: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc60a0009  ! 2017: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xcc2a0009  ! 2019: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc71a0009  ! 2019: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xf02a0009  ! 2021: STB_R	stb	%r24, [%r8 + %r9]
	.word 0xc6520009  ! 2021: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0x40000002  ! 2022: CALL	call	disp30_2
	.word 0xc36a0009  ! 2023: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xbfa209a9  ! 2024: FDIVs	fdivs	%f8, %f9, %f31
	.word 0xc8720009  ! 2026: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xcf020009  ! 2026: LDF_R	ld	[%r8, %r9], %f7
	.word 0xc4a22a34  ! 2027: STWA_I	stwa	%r2, [%r8 + 0x0a34] %asi
	.word 0xd6ea2070  ! 2028: LDSTUBA_I	ldstuba	%r11, [%r8 + 0x0070] %asi
	.word 0x24ca0001  ! 2029: BRLEZ	brlez,a,pt	%8,<label_0xa0001>
	.word 0xc62a0009  ! 2031: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xf44a0009  ! 2031: LDSB_R	ldsb	[%r8 + %r9], %r26
	.word 0xeaea2ff8  ! 2032: LDSTUBA_I	ldstuba	%r21, [%r8 + 0x0ff8] %asi
	.word 0xc36a0009  ! 2033: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xea8a29b0  ! 2034: LDUBA_I	lduba	[%r8, + 0x09b0] %asi, %r21
	.word 0xe2320009  ! 2036: STH_R	sth	%r17, [%r8 + %r9]
	.word 0xfc420009  ! 2036: LDSW_R	ldsw	[%r8 + %r9], %r30
	.word 0xc8f21009  ! 2037: STXA_R	stxa	%r4, [%r8 + %r9] 0x80
	.word 0x8eda0009  ! 2038: SMULcc_R	smulcc 	%r8, %r9, %r7
	.word 0xcb3a22f0  ! 2039: STDF_I	std	%f5, [0x02f0, %r8]
	.word 0xb7a20929  ! 2040: FMULs	fmuls	%f8, %f9, %f27
	.word 0xc2220009  ! 2042: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xd71a0009  ! 2042: LDDF_R	ldd	[%r8, %r9], %f11
	.word 0xc3ea23f0  ! 2043: PREFETCHA_I	prefetcha	[%r8, + 0x03f0] %asi, #one_read
	.word 0xc6fa1009  ! 2044: SWAPA_R	swapa	%r3, [%r8 + %r9] 0x80
	.word 0x884a0009  ! 2045: MULX_R	mulx 	%r8, %r9, %r4
	.word 0xcea227fc  ! 2046: STWA_I	stwa	%r7, [%r8 + 0x07fc] %asi
	.word 0x8ada2a54  ! 2047: SMULcc_I	smulcc 	%r8, 0x0a54, %r5
	.word 0xc3220009  ! 2049: STF_R	st	%f1, [%r9, %r8]
	.word 0xca720009  ! 2050: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc45a0009  ! 2050: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xfe8a2fd0  ! 2051: LDUBA_I	lduba	[%r8, + 0x0fd0] %asi, %r31
	.word 0x8143c000  ! 2052: STBAR	stbar
	.word 0x876a0009  ! 2053: SDIVX_R	sdivx	%r8, %r9, %r3
	.word 0xc6220009  ! 2055: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc24a0009  ! 2055: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xdf3a2b48  ! 2056: STDF_I	std	%f15, [0x0b48, %r8]
	.word 0xc81a2a50  ! 2057: LDD_I	ldd	[%r8 + 0x0a50], %r4
	.word 0x34800002  ! 2058: BG	bg,a	<label_0x2>
	.word 0xc36a249c  ! 2059: PREFETCH_I	prefetch	[%r8 + 0x049c], #one_read
	.word 0xc4922504  ! 2060: LDUHA_I	lduha	[%r8, + 0x0504] %asi, %r2
	.word 0xb16a283c  ! 2061: SDIVX_I	sdivx	%r8, 0x083c, %r24
	.word 0xc86a0009  ! 2062: LDSTUB_R	ldstub	%r4, [%r8 + %r9]
	.word 0x876a2a84  ! 2063: SDIVX_I	sdivx	%r8, 0x0a84, %r3
	.word 0x1e800001  ! 2064: BVC	bvc  	<label_0x1>
	.word 0xdaaa1009  ! 2065: STBA_R	stba	%r13, [%r8 + %r9] 0x80
	.word 0xc4b220bc  ! 2066: STHA_I	stha	%r2, [%r8 + 0x00bc] %asi
	.word 0xe2220009  ! 2068: STW_R	stw	%r17, [%r8 + %r9]
	.word 0xcc0a0009  ! 2068: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0x844a0009  ! 2069: MULX_R	mulx 	%r8, %r9, %r2
	.word 0xe89a2d78  ! 2070: LDDA_I	ldda	[%r8, + 0x0d78] %asi, %r20
	.word 0x86720009  ! 2071: UDIV_R	udiv 	%r8, %r9, %r3
	.word 0xc2822850  ! 2072: LDUWA_I	lduwa	[%r8, + 0x0850] %asi, %r1
	.word 0xc6320009  ! 2074: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xfe020009  ! 2074: LDUW_R	lduw	[%r8 + %r9], %r31
	.word 0x8a5a0009  ! 2075: SMUL_R	smul 	%r8, %r9, %r5
	.word 0xf82a0009  ! 2077: STB_R	stb	%r28, [%r8 + %r9]
	.word 0xc2520009  ! 2077: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0x8143e05d  ! 2078: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0xf5e22009  ! 2079: CASA_R	casa	[%r8] %asi, %r9, %r26
	.word 0xc67a2960  ! 2080: SWAP_I	swap	%r3, [%r8 + 0x0960]
	.word 0xcc2a0009  ! 2082: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xe6020009  ! 2082: LDUW_R	lduw	[%r8 + %r9], %r19
	.word 0xc4522534  ! 2083: LDSH_I	ldsh	[%r8 + 0x0534], %r2
	.word 0x86fa2130  ! 2084: SDIVcc_I	sdivcc 	%r8, 0x0130, %r3
	.word 0xa47a29e0  ! 2085: SDIV_I	sdiv 	%r8, 0x09e0, %r18
	.word 0xde320009  ! 2087: STH_R	sth	%r15, [%r8 + %r9]
	.word 0xce4a0009  ! 2087: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xc3f21009  ! 2088: CASXA_I	casxa	[%r8] 0x80, %r9, %r1
	.word 0xb0720009  ! 2089: UDIV_R	udiv 	%r8, %r9, %r24
	.word 0x8143c000  ! 2090: STBAR	stbar
	.word 0xcf2222b4  ! 2091: STF_I	st	%f7, [0x02b4, %r8]
	.word 0xe3e22009  ! 2092: CASA_R	casa	[%r8] %asi, %r9, %r17
	.word 0xe8f22ef8  ! 2093: STXA_I	stxa	%r20, [%r8 + 0x0ef8] %asi
	.word 0xee92208c  ! 2094: LDUHA_I	lduha	[%r8, + 0x008c] %asi, %r23
	.word 0xcf3a2510  ! 2095: STDF_I	std	%f7, [0x0510, %r8]
	.word 0x8ba208a9  ! 2096: FSUBs	fsubs	%f8, %f9, %f5
	.word 0xc6fa2164  ! 2097: SWAPA_I	swapa	%r3, [%r8 + 0x0164] %asi
	.word 0x8143e01c  ! 2098: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside 
	.word 0xb25a2904  ! 2099: SMUL_I	smul 	%r8, 0x0904, %r25
	.word 0x8143e072  ! 2100: MEMBAR	membar	#StoreLoad | #Lookaside | #MemIssue | #Sync 
	.word 0xc36a2224  ! 2101: PREFETCH_I	prefetch	[%r8 + 0x0224], #one_read
	.word 0xcaa22f2c  ! 2102: STWA_I	stwa	%r5, [%r8 + 0x0f2c] %asi
	.word 0xc3ea1009  ! 2103: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x824a0009  ! 2104: MULX_R	mulx 	%r8, %r9, %r1
	.word 0x8143e046  ! 2105: MEMBAR	membar	#StoreLoad | #LoadStore | #Sync 
	.word 0xe42a0009  ! 2107: STB_R	stb	%r18, [%r8 + %r9]
	.word 0xc3020009  ! 2107: LDF_R	ld	[%r8, %r9], %f1
	.word 0x8143c000  ! 2108: STBAR	stbar
	.word 0x8f220009  ! 2109: MULScc_R	mulscc 	%r8, %r9, %r7
	.word 0xc64a0009  ! 2110: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xd8f21009  ! 2111: STXA_R	stxa	%r12, [%r8 + %r9] 0x80
	.word 0xce720009  ! 2113: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc2520009  ! 2113: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xceca1009  ! 2114: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r7
	.word 0x964a21f0  ! 2115: MULX_I	mulx 	%r8, 0x01f0, %r11
	.word 0xc6b21009  ! 2116: STHA_R	stha	%r3, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 2117: STBAR	stbar
	.word 0xec720009  ! 2119: STX_R	stx	%r22, [%r8 + %r9]
	.word 0xe11a0009  ! 2119: LDDF_R	ldd	[%r8, %r9], %f16
	.word 0xcc4a0009  ! 2120: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xc3ea1009  ! 2121: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xf6f21009  ! 2122: STXA_R	stxa	%r27, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 2123: STBAR	stbar
	.word 0x836a2e20  ! 2124: SDIVX_I	sdivx	%r8, 0x0e20, %r1
	.word 0x8b222558  ! 2125: MULScc_I	mulscc 	%r8, 0x0558, %r5
	.word 0xc36a0009  ! 2126: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xfb222a40  ! 2127: STF_I	st	%f29, [0x0a40, %r8]
	.word 0xcc220009  ! 2129: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc45a0009  ! 2129: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0x04800001  ! 2130: BLE	ble  	<label_0x1>
	.word 0xee320009  ! 2132: STH_R	sth	%r23, [%r8 + %r9]
	.word 0xc24a0009  ! 2132: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xced22898  ! 2133: LDSHA_I	ldsha	[%r8, + 0x0898] %asi, %r7
	.word 0xe8ba1009  ! 2134: STDA_R	stda	%r20, [%r8 + %r9] 0x80
	.word 0xdac22b64  ! 2135: LDSWA_I	ldswa	[%r8, + 0x0b64] %asi, %r13
	.word 0xca2a0009  ! 2137: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc41a0009  ! 2137: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x8a5a26f0  ! 2138: SMUL_I	smul 	%r8, 0x06f0, %r5
	.word 0x0e800002  ! 2139: BVS	bvs  	<label_0x2>
	.word 0xc36a0009  ! 2140: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xfa6a0009  ! 2141: LDSTUB_R	ldstub	%r29, [%r8 + %r9]
	.word 0x8143c000  ! 2142: STBAR	stbar
	.word 0x89a20829  ! 2143: FADDs	fadds	%f8, %f9, %f4
	.word 0xc7222ce8  ! 2144: STF_I	st	%f3, [0x0ce8, %r8]
	.word 0xccaa1009  ! 2145: STBA_R	stba	%r6, [%r8 + %r9] 0x80
	.word 0xc8120009  ! 2146: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0x867a0009  ! 2147: SDIV_R	sdiv 	%r8, %r9, %r3
	.word 0x8f222104  ! 2148: MULScc_I	mulscc 	%r8, 0x0104, %r7
	.word 0xc8122a34  ! 2149: LDUH_I	lduh	[%r8 + 0x0a34], %r4
	.word 0xce320009  ! 2151: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc4020009  ! 2151: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0x96da0009  ! 2152: SMULcc_R	smulcc 	%r8, %r9, %r11
	.word 0x8143e06c  ! 2153: MEMBAR	membar	#LoadStore | #StoreStore | #MemIssue | #Sync 
	.word 0xc4320009  ! 2155: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xcd020009  ! 2155: LDF_R	ld	[%r8, %r9], %f6
	.word 0xc4a21009  ! 2156: STWA_R	stwa	%r2, [%r8 + %r9] 0x80
	.word 0xe67a2244  ! 2157: SWAP_I	swap	%r19, [%r8 + 0x0244]
	.word 0x02c20001  ! 2158: BRZ	brz  ,nt	%8,<label_0x20001>
	.word 0xe4aa2210  ! 2159: STBA_I	stba	%r18, [%r8 + 0x0210] %asi
	.word 0xc4ba1009  ! 2160: STDA_R	stda	%r2, [%r8 + %r9] 0x80
	.word 0x40000001  ! 2161: CALL	call	disp30_1
	.word 0x87a208a9  ! 2162: FSUBs	fsubs	%f8, %f9, %f3
	.word 0x864a2d18  ! 2163: MULX_I	mulx 	%r8, 0x0d18, %r3
	.word 0x845228f4  ! 2164: UMUL_I	umul 	%r8, 0x08f4, %r2
	.word 0xc2720009  ! 2166: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xcc4a0009  ! 2166: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xc8122cdc  ! 2167: LDUH_I	lduh	[%r8 + 0x0cdc], %r4
	.word 0x8a5225a0  ! 2168: UMUL_I	umul 	%r8, 0x05a0, %r5
	.word 0xcc9a1009  ! 2169: LDDA_R	ldda	[%r8, %r9] 0x80, %r6
	.word 0xc2c22174  ! 2170: LDSWA_I	ldswa	[%r8, + 0x0174] %asi, %r1
	.word 0xe53a29d8  ! 2171: STDF_I	std	%f18, [0x09d8, %r8]
	.word 0xe8220009  ! 2173: STW_R	stw	%r20, [%r8 + %r9]
	.word 0xc2420009  ! 2173: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xcab21009  ! 2174: STHA_R	stha	%r5, [%r8 + %r9] 0x80
	.word 0xcc220009  ! 2176: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xd6120009  ! 2176: LDUH_R	lduh	[%r8 + %r9], %r11
	.word 0xc62a0009  ! 2178: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc51a0009  ! 2178: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xde2a0009  ! 2180: STB_R	stb	%r15, [%r8 + %r9]
	.word 0xc31a0009  ! 2180: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0x8e4a0009  ! 2181: MULX_R	mulx 	%r8, %r9, %r7
	.word 0x8143c000  ! 2182: STBAR	stbar
	.word 0x884a25b4  ! 2183: MULX_I	mulx 	%r8, 0x05b4, %r4
	.word 0xca8a1009  ! 2184: LDUBA_R	lduba	[%r8, %r9] 0x80, %r5
	.word 0xda220009  ! 2186: STW_R	stw	%r13, [%r8 + %r9]
	.word 0xc2020009  ! 2186: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xc2ca20a4  ! 2187: LDSBA_I	ldsba	[%r8, + 0x00a4] %asi, %r1
	.word 0xa47a0009  ! 2188: SDIV_R	sdiv 	%r8, %r9, %r18
	.word 0xc2422b08  ! 2189: LDSW_I	ldsw	[%r8 + 0x0b08], %r1
	.word 0xca320009  ! 2191: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xce420009  ! 2191: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xe33a2238  ! 2192: STDF_I	std	%f17, [0x0238, %r8]
	.word 0xe13a0009  ! 2194: STDF_R	std	%f16, [%r9, %r8]
	.word 0xca720009  ! 2195: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc4520009  ! 2195: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xce320009  ! 2197: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc4420009  ! 2197: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xc66a2228  ! 2198: LDSTUB_I	ldstub	%r3, [%r8 + 0x0228]
	.word 0xc8b2242c  ! 2199: STHA_I	stha	%r4, [%r8 + 0x042c] %asi
	.word 0xc2122b54  ! 2200: LDUH_I	lduh	[%r8 + 0x0b54], %r1
	.word 0xd82a0009  ! 2202: STB_R	stb	%r12, [%r8 + %r9]
	.word 0xc85a0009  ! 2202: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xfc320009  ! 2204: STH_R	sth	%r30, [%r8 + %r9]
	.word 0xf45a0009  ! 2204: LDX_R	ldx	[%r8 + %r9], %r26
	.word 0xe80a2528  ! 2205: LDUB_I	ldub	[%r8 + 0x0528], %r20
	.word 0xe66a2874  ! 2206: LDSTUB_I	ldstub	%r19, [%r8 + 0x0874]
	.word 0xae7a21bc  ! 2207: SDIV_I	sdiv 	%r8, 0x01bc, %r23
	.word 0xc8d21009  ! 2208: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r4
	.word 0x00800001  ! 2209: BN	bn  	<label_0x1>
	.word 0xcd1a0009  ! 2210: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0x865a2a2c  ! 2211: SMUL_I	smul 	%r8, 0x0a2c, %r3
	.word 0x1c800002  ! 2212: BPOS	bpos  	<label_0x2>
	.word 0xc86a2068  ! 2213: LDSTUB_I	ldstub	%r4, [%r8 + 0x0068]
	.word 0xfa0225f0  ! 2214: LDUW_I	lduw	[%r8 + 0x05f0], %r29
	.word 0x827a274c  ! 2215: SDIV_I	sdiv 	%r8, 0x074c, %r1
	.word 0xc22a0009  ! 2217: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xcc520009  ! 2217: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xcb3a2868  ! 2218: STDF_I	std	%f5, [0x0868, %r8]
	.word 0xe4120009  ! 2219: LDUH_R	lduh	[%r8 + %r9], %r18
	.word 0xee8a1009  ! 2220: LDUBA_R	lduba	[%r8, %r9] 0x80, %r23
	.word 0xe9f22009  ! 2221: CASXA_R	casxa	[%r8]%asi, %r9, %r20
	.word 0x8e6a0009  ! 2222: UDIVX_R	udivx 	%r8, %r9, %r7
	.word 0x826a0009  ! 2223: UDIVX_R	udivx 	%r8, %r9, %r1
	.word 0xccb22b18  ! 2224: STHA_I	stha	%r6, [%r8 + 0x0b18] %asi
	.word 0xe02a0009  ! 2226: STB_R	stb	%r16, [%r8 + %r9]
	.word 0xd64a0009  ! 2226: LDSB_R	ldsb	[%r8 + %r9], %r11
	.word 0xcc320009  ! 2228: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc4420009  ! 2228: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0x8143c000  ! 2229: STBAR	stbar
	.word 0xc93a0009  ! 2231: STDF_R	std	%f4, [%r9, %r8]
	.word 0xfe720009  ! 2232: STX_R	stx	%r31, [%r8 + %r9]
	.word 0xda520009  ! 2232: LDSH_R	ldsh	[%r8 + %r9], %r13
	.word 0xa36a0009  ! 2233: SDIVX_R	sdivx	%r8, %r9, %r17
	.word 0x24ca0001  ! 2234: BRLEZ	brlez,a,pt	%8,<label_0xa0001>
	.word 0x40000002  ! 2235: CALL	call	disp30_2
	.word 0x8efa2808  ! 2236: SDIVcc_I	sdivcc 	%r8, 0x0808, %r7
	.word 0x86f20009  ! 2237: UDIVcc_R	udivcc 	%r8, %r9, %r3
	.word 0x8da209a9  ! 2238: FDIVs	fdivs	%f8, %f9, %f6
	.word 0xc3ea1009  ! 2239: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xcd1a0009  ! 2240: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xdc720009  ! 2242: STX_R	stx	%r14, [%r8 + %r9]
	.word 0xc7020009  ! 2242: LDF_R	ld	[%r8, %r9], %f3
	.word 0xf65a0009  ! 2243: LDX_R	ldx	[%r8 + %r9], %r27
	.word 0xd8d21009  ! 2244: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r12
	.word 0xcef21009  ! 2245: STXA_R	stxa	%r7, [%r8 + %r9] 0x80
	.word 0x86f20009  ! 2246: UDIVcc_R	udivcc 	%r8, %r9, %r3
	.word 0x38800002  ! 2247: BGU	bgu,a	<label_0x2>
	.word 0xc2ea1009  ! 2248: LDSTUBA_R	ldstuba	%r1, [%r8 + %r9] 0x80
	.word 0xce720009  ! 2250: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xcc120009  ! 2250: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xfc6a0009  ! 2251: LDSTUB_R	ldstub	%r30, [%r8 + %r9]
	.word 0xc6720009  ! 2253: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc2020009  ! 2253: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xcf220009  ! 2255: STF_R	st	%f7, [%r9, %r8]
	.word 0xc4720009  ! 2256: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xcc5a0009  ! 2256: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0x0cca0001  ! 2257: BRGZ	brgz  ,pt	%8,<label_0xa0001>
	.word 0xfb220009  ! 2259: STF_R	st	%f29, [%r9, %r8]
	.word 0xf8720009  ! 2260: STX_R	stx	%r28, [%r8 + %r9]
	.word 0xe81a0009  ! 2260: LDD_R	ldd	[%r8 + %r9], %r20
	.word 0x84f20009  ! 2261: UDIVcc_R	udivcc 	%r8, %r9, %r2
	.word 0xf49a2398  ! 2262: LDDA_I	ldda	[%r8, + 0x0398] %asi, %r26
	.word 0xccba1009  ! 2263: STDA_R	stda	%r6, [%r8 + %r9] 0x80
	.word 0xc2a22334  ! 2264: STWA_I	stwa	%r1, [%r8 + 0x0334] %asi
	.word 0x996a2c60  ! 2265: SDIVX_I	sdivx	%r8, 0x0c60, %r12
	.word 0xde320009  ! 2267: STH_R	sth	%r15, [%r8 + %r9]
	.word 0xda4a0009  ! 2267: LDSB_R	ldsb	[%r8 + %r9], %r13
	.word 0xc6320009  ! 2269: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xce120009  ! 2269: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xccba1009  ! 2270: STDA_R	stda	%r6, [%r8 + %r9] 0x80
	.word 0xc3ea206c  ! 2271: PREFETCHA_I	prefetcha	[%r8, + 0x006c] %asi, #one_read
	.word 0xccba2b68  ! 2272: STDA_I	stda	%r6, [%r8 + 0x0b68] %asi
	.word 0x8da20829  ! 2273: FADDs	fadds	%f8, %f9, %f6
	.word 0xfe6a2380  ! 2274: LDSTUB_I	ldstub	%r31, [%r8 + 0x0380]
	.word 0xc8ba2d68  ! 2275: STDA_I	stda	%r4, [%r8 + 0x0d68] %asi
	.word 0x86520009  ! 2276: UMUL_R	umul 	%r8, %r9, %r3
	.word 0xc47a2c7c  ! 2277: SWAP_I	swap	%r2, [%r8 + 0x0c7c]
	.word 0xcc0a0009  ! 2278: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xc36a2644  ! 2279: PREFETCH_I	prefetch	[%r8 + 0x0644], #one_read
	.word 0x28800001  ! 2280: BLEU	bleu,a	<label_0x1>
	.word 0xc66a21a4  ! 2281: LDSTUB_I	ldstub	%r3, [%r8 + 0x01a4]
	.word 0xc6a21009  ! 2282: STWA_R	stwa	%r3, [%r8 + %r9] 0x80
	.word 0xecb22368  ! 2283: STHA_I	stha	%r22, [%r8 + 0x0368] %asi
	.word 0xf67a0009  ! 2284: SWAP_R	swap	%r27, [%r8 + %r9]
	.word 0x32800002  ! 2285: BNE	bne,a	<label_0x2>
	.word 0xe4ca25a4  ! 2286: LDSBA_I	ldsba	[%r8, + 0x05a4] %asi, %r18
	.word 0x8143e050  ! 2287: MEMBAR	membar	#Lookaside | #Sync 
	.word 0xe4fa1009  ! 2288: SWAPA_R	swapa	%r18, [%r8 + %r9] 0x80
	.word 0xcc2a0009  ! 2290: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xce120009  ! 2290: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xc36a24f4  ! 2291: PREFETCH_I	prefetch	[%r8 + 0x04f4], #one_read
	.word 0x8143c000  ! 2292: STBAR	stbar
	.word 0xe2220009  ! 2294: STW_R	stw	%r17, [%r8 + %r9]
	.word 0xc24a0009  ! 2294: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0x972220b4  ! 2295: MULScc_I	mulscc 	%r8, 0x00b4, %r11
	.word 0xc73a0009  ! 2297: STDF_R	std	%f3, [%r9, %r8]
	.word 0xda720009  ! 2298: STX_R	stx	%r13, [%r8 + %r9]
	.word 0xda020009  ! 2298: LDUW_R	lduw	[%r8 + %r9], %r13
	.word 0x84520009  ! 2299: UMUL_R	umul 	%r8, %r9, %r2
	.word 0xc36a0009  ! 2300: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0x8a522ad0  ! 2301: UMUL_I	umul 	%r8, 0x0ad0, %r5
	.word 0xc53a2c18  ! 2302: STDF_I	std	%f2, [0x0c18, %r8]
	.word 0xcc1a2088  ! 2303: LDD_I	ldd	[%r8 + 0x0088], %r6
	.word 0xe28a2224  ! 2304: LDUBA_I	lduba	[%r8, + 0x0224] %asi, %r17
	.word 0xe32222e0  ! 2305: STF_I	st	%f17, [0x02e0, %r8]
	.word 0xb47a2ae8  ! 2306: SDIV_I	sdiv 	%r8, 0x0ae8, %r26
	.word 0xc8120009  ! 2307: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xc8ba1009  ! 2308: STDA_R	stda	%r4, [%r8 + %r9] 0x80
	.word 0xa24a0009  ! 2309: MULX_R	mulx 	%r8, %r9, %r17
	.word 0xca320009  ! 2311: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc8520009  ! 2311: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xc3ea1009  ! 2312: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc36a2c58  ! 2313: PREFETCH_I	prefetch	[%r8 + 0x0c58], #one_read
	.word 0xc25a0009  ! 2314: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xc36a2e58  ! 2315: PREFETCH_I	prefetch	[%r8 + 0x0e58], #one_read
	.word 0xfca21009  ! 2316: STWA_R	stwa	%r30, [%r8 + %r9] 0x80
	.word 0x3c800001  ! 2317: BPOS	bpos,a	<label_0x1>
	.word 0x99a20929  ! 2318: FMULs	fmuls	%f8, %f9, %f12
	.word 0xb0720009  ! 2319: UDIV_R	udiv 	%r8, %r9, %r24
	.word 0x0a800001  ! 2320: BCS	bcs  	<label_0x1>
	.word 0xc2c22fc4  ! 2321: LDSWA_I	ldswa	[%r8, + 0x0fc4] %asi, %r1
	.word 0xc89a1009  ! 2322: LDDA_R	ldda	[%r8, %r9] 0x80, %r4
	.word 0xccba1009  ! 2323: STDA_R	stda	%r6, [%r8 + %r9] 0x80
	.word 0xb8720009  ! 2324: UDIV_R	udiv 	%r8, %r9, %r28
	.word 0xbcf20009  ! 2325: UDIVcc_R	udivcc 	%r8, %r9, %r30
	.word 0xc3ea2104  ! 2326: PREFETCHA_I	prefetcha	[%r8, + 0x0104] %asi, #one_read
	.word 0xc49a2938  ! 2327: LDDA_I	ldda	[%r8, + 0x0938] %asi, %r2
	.word 0x06800002  ! 2328: BL	bl  	<label_0x2>
	.word 0xcc320009  ! 2330: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xce0a0009  ! 2330: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xee2a0009  ! 2332: STB_R	stb	%r23, [%r8 + %r9]
	.word 0xc6020009  ! 2332: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xc73a2b90  ! 2333: STDF_I	std	%f3, [0x0b90, %r8]
	.word 0xcaaa1009  ! 2334: STBA_R	stba	%r5, [%r8 + %r9] 0x80
	.word 0x14800001  ! 2335: BG	bg  	<label_0x1>
	.word 0xcc8a25e4  ! 2336: LDUBA_I	lduba	[%r8, + 0x05e4] %asi, %r6
	.word 0x8a7a2894  ! 2337: SDIV_I	sdiv 	%r8, 0x0894, %r5
	.word 0x0c800002  ! 2338: BNEG	bneg  	<label_0x2>
	.word 0x1a800001  ! 2339: BCC	bcc  	<label_0x1>
	.word 0x96520009  ! 2340: UMUL_R	umul 	%r8, %r9, %r11
	.word 0xdab22f70  ! 2341: STHA_I	stha	%r13, [%r8 + 0x0f70] %asi
	.word 0xc3e22009  ! 2342: CASA_R	casa	[%r8] %asi, %r9, %r1
	.word 0x18800001  ! 2343: BGU	bgu  	<label_0x1>
	.word 0xc3ea25e4  ! 2344: PREFETCHA_I	prefetcha	[%r8, + 0x05e4] %asi, #one_read
	.word 0xc8a22560  ! 2345: STWA_I	stwa	%r4, [%r8 + 0x0560] %asi
	.word 0xca822c38  ! 2346: LDUWA_I	lduwa	[%r8, + 0x0c38] %asi, %r5
	.word 0x8ada0009  ! 2347: SMULcc_R	smulcc 	%r8, %r9, %r5
	.word 0xeea224c0  ! 2348: STWA_I	stwa	%r23, [%r8 + 0x04c0] %asi
	.word 0xc3ea2bbc  ! 2349: PREFETCHA_I	prefetcha	[%r8, + 0x0bbc] %asi, #one_read
	.word 0xe33a0009  ! 2351: STDF_R	std	%f17, [%r9, %r8]
	.word 0xc6720009  ! 2352: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc2020009  ! 2352: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0x02800001  ! 2353: BE	be  	<label_0x1>
	.word 0x8143c000  ! 2354: STBAR	stbar
	.word 0x8143e03d  ! 2355: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0xc4320009  ! 2357: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xca520009  ! 2357: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xc66a2374  ! 2358: LDSTUB_I	ldstub	%r3, [%r8 + 0x0374]
	.word 0xd8ba1009  ! 2359: STDA_R	stda	%r12, [%r8 + %r9] 0x80
	.word 0x9f222888  ! 2360: MULScc_I	mulscc 	%r8, 0x0888, %r15
	.word 0xaef22c88  ! 2361: UDIVcc_I	udivcc 	%r8, 0x0c88, %r23
	.word 0x8143c000  ! 2362: STBAR	stbar
	.word 0xc3ea1009  ! 2363: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xeb3a0009  ! 2365: STDF_R	std	%f21, [%r9, %r8]
	.word 0xcc720009  ! 2366: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xca5a0009  ! 2366: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0x8cd22328  ! 2367: UMULcc_I	umulcc 	%r8, 0x0328, %r6
	.word 0xc2320009  ! 2369: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xee520009  ! 2369: LDSH_R	ldsh	[%r8 + %r9], %r23
	.word 0xf4d22684  ! 2370: LDSHA_I	ldsha	[%r8, + 0x0684] %asi, %r26
	.word 0x8d222514  ! 2371: MULScc_I	mulscc 	%r8, 0x0514, %r6
	.word 0xc4b22750  ! 2372: STHA_I	stha	%r2, [%r8 + 0x0750] %asi
	.word 0xce2a0009  ! 2374: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xdb1a0009  ! 2374: LDDF_R	ldd	[%r8, %r9], %f13
	.word 0xc36a29a4  ! 2375: PREFETCH_I	prefetch	[%r8 + 0x09a4], #one_read
	.word 0xc6020009  ! 2376: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xf8b21009  ! 2377: STHA_R	stha	%r28, [%r8 + %r9] 0x80
	.word 0xc8ea2fe0  ! 2378: LDSTUBA_I	ldstuba	%r4, [%r8 + 0x0fe0] %asi
	.word 0x8143e071  ! 2379: MEMBAR	membar	#LoadLoad | #Lookaside | #MemIssue | #Sync 
	.word 0xe722209c  ! 2380: STF_I	st	%f19, [0x009c, %r8]
	.word 0xc4220009  ! 2382: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xce120009  ! 2382: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0x8143c000  ! 2383: STBAR	stbar
	.word 0xc36a0009  ! 2384: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc6aa25f8  ! 2385: STBA_I	stba	%r3, [%r8 + 0x05f8] %asi
	.word 0xc3ea25ec  ! 2386: PREFETCHA_I	prefetcha	[%r8, + 0x05ec] %asi, #one_read
	.word 0xe3f22009  ! 2387: CASXA_R	casxa	[%r8]%asi, %r9, %r17
	.word 0xc67a2b98  ! 2388: SWAP_I	swap	%r3, [%r8 + 0x0b98]
	.word 0xc36a0009  ! 2389: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xcc220009  ! 2391: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc6420009  ! 2391: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0x884a0009  ! 2392: MULX_R	mulx 	%r8, %r9, %r4
	.word 0xc3ea1009  ! 2393: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc93a0009  ! 2395: STDF_R	std	%f4, [%r9, %r8]
	.word 0xf2720009  ! 2396: STX_R	stx	%r25, [%r8 + %r9]
	.word 0xcb020009  ! 2396: LDF_R	ld	[%r8, %r9], %f5
	.word 0x865a0009  ! 2397: SMUL_R	smul 	%r8, %r9, %r3
	.word 0xc2320009  ! 2399: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xd85a0009  ! 2399: LDX_R	ldx	[%r8 + %r9], %r12
	.word 0xca4a2b4c  ! 2400: LDSB_I	ldsb	[%r8 + 0x0b4c], %r5
	.word 0xc8ba1009  ! 2401: STDA_R	stda	%r4, [%r8 + %r9] 0x80
	.word 0xdf220009  ! 2403: STF_R	st	%f15, [%r9, %r8]
	.word 0xc8720009  ! 2404: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xcc4a0009  ! 2404: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0x8143e054  ! 2405: MEMBAR	membar	#LoadStore | #Lookaside | #Sync 
	.word 0xc4fa1009  ! 2406: SWAPA_R	swapa	%r2, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 2407: STBAR	stbar
	.word 0x8ef20009  ! 2408: UDIVcc_R	udivcc 	%r8, %r9, %r7
	.word 0x8e522340  ! 2409: UMUL_I	umul 	%r8, 0x0340, %r7
	.word 0xc6a21009  ! 2410: STWA_R	stwa	%r3, [%r8 + %r9] 0x80
	.word 0xe2720009  ! 2412: STX_R	stx	%r17, [%r8 + %r9]
	.word 0xc8020009  ! 2412: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0x0aca0001  ! 2413: BRNZ	brnz  ,pt	%8,<label_0xa0001>
	.word 0xf0aa1009  ! 2414: STBA_R	stba	%r24, [%r8 + %r9] 0x80
	.word 0x8e720009  ! 2415: UDIV_R	udiv 	%r8, %r9, %r7
	.word 0x02c20001  ! 2416: BRZ	brz  ,nt	%8,<label_0x20001>
	.word 0xe4ba1009  ! 2417: STDA_R	stda	%r18, [%r8 + %r9] 0x80
	.word 0xc8da23c8  ! 2418: LDXA_I	ldxa	[%r8, + 0x03c8] %asi, %r4
	.word 0xca2a0009  ! 2420: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc8420009  ! 2420: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xc3222ec8  ! 2421: STF_I	st	%f1, [0x0ec8, %r8]
	.word 0xc2520009  ! 2422: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xc22a0009  ! 2424: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xd60a0009  ! 2424: LDUB_R	ldub	[%r8 + %r9], %r11
	.word 0x8143e028  ! 2425: MEMBAR	membar	#StoreStore | #MemIssue 
	.word 0x8a522a50  ! 2426: UMUL_I	umul 	%r8, 0x0a50, %r5
	.word 0xc42a0009  ! 2428: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc3020009  ! 2428: LDF_R	ld	[%r8, %r9], %f1
	.word 0xea5a0009  ! 2429: LDX_R	ldx	[%r8 + %r9], %r21
	.word 0x2c800002  ! 2430: BNEG	bneg,a	<label_0x2>
	.word 0xc52228a8  ! 2431: STF_I	st	%f2, [0x08a8, %r8]
	.word 0xca320009  ! 2433: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc3020009  ! 2433: LDF_R	ld	[%r8, %r9], %f1
	.word 0xa3a20829  ! 2434: FADDs	fadds	%f8, %f9, %f17
	.word 0xca220009  ! 2436: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xcc0a0009  ! 2436: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xced21009  ! 2437: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r7
	.word 0xc42a0009  ! 2439: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xf84a0009  ! 2439: LDSB_R	ldsb	[%r8 + %r9], %r28
	.word 0xdbe21009  ! 2440: CASA_I	casa	[%r8] 0x80, %r9, %r13
	.word 0xc4ba1009  ! 2441: STDA_R	stda	%r2, [%r8 + %r9] 0x80
	.word 0xcc9a2310  ! 2442: LDDA_I	ldda	[%r8, + 0x0310] %asi, %r6
	.word 0x8143e05a  ! 2443: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside | #Sync 
	.word 0xc2ea1009  ! 2444: LDSTUBA_R	ldstuba	%r1, [%r8 + %r9] 0x80
	.word 0xc33a25f0  ! 2445: STDF_I	std	%f1, [0x05f0, %r8]
	.word 0xfa220009  ! 2447: STW_R	stw	%r29, [%r8 + %r9]
	.word 0xcc4a0009  ! 2447: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xfc0a2f54  ! 2448: LDUB_I	ldub	[%r8 + 0x0f54], %r30
	.word 0xce6a27c4  ! 2449: LDSTUB_I	ldstub	%r7, [%r8 + 0x07c4]
	.word 0xcd3a2500  ! 2450: STDF_I	std	%f6, [0x0500, %r8]
	.word 0xd6c21009  ! 2451: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r11
	.word 0xc4a22144  ! 2452: STWA_I	stwa	%r2, [%r8 + 0x0144] %asi
	.word 0x8143e01f  ! 2453: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #Lookaside 
	.word 0x22800002  ! 2454: BE	be,a	<label_0x2>
	.word 0xc36a2bc0  ! 2455: PREFETCH_I	prefetch	[%r8 + 0x0bc0], #one_read
	.word 0xce320009  ! 2457: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc60a0009  ! 2457: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xc93a0009  ! 2459: STDF_R	std	%f4, [%r9, %r8]
	.word 0xec720009  ! 2460: STX_R	stx	%r22, [%r8 + %r9]
	.word 0xdf1a0009  ! 2460: LDDF_R	ldd	[%r8, %r9], %f15
	.word 0x8e7a2104  ! 2461: SDIV_I	sdiv 	%r8, 0x0104, %r7
	.word 0xccda1009  ! 2462: LDXA_R	ldxa	[%r8, %r9] 0x80, %r6
	.word 0x8143e033  ! 2463: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside | #MemIssue 
	.word 0xc4a21009  ! 2464: STWA_R	stwa	%r2, [%r8 + %r9] 0x80
	.word 0xf92221b8  ! 2465: STF_I	st	%f28, [0x01b8, %r8]
	.word 0x8143e029  ! 2466: MEMBAR	membar	#LoadLoad | #StoreStore | #MemIssue 
	.word 0xc6320009  ! 2468: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xcc0a0009  ! 2468: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xe05a0009  ! 2469: LDX_R	ldx	[%r8 + %r9], %r16
	.word 0xca2a0009  ! 2471: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xca120009  ! 2471: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0x89222aa0  ! 2472: MULScc_I	mulscc 	%r8, 0x0aa0, %r4
	.word 0x14800001  ! 2473: BG	bg  	<label_0x1>
	.word 0xc3ea1009  ! 2474: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc67a28f0  ! 2475: SWAP_I	swap	%r3, [%r8 + 0x08f0]
	.word 0x825a26cc  ! 2476: SMUL_I	smul 	%r8, 0x06cc, %r1
	.word 0xab6a222c  ! 2477: SDIVX_I	sdivx	%r8, 0x022c, %r21
	.word 0xf8320009  ! 2479: STH_R	sth	%r28, [%r8 + %r9]
	.word 0xfa020009  ! 2479: LDUW_R	lduw	[%r8 + %r9], %r29
	.word 0xc22a0009  ! 2481: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xfc1a0009  ! 2481: LDD_R	ldd	[%r8 + %r9], %r30
	.word 0xc3ea1009  ! 2482: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc36a2a90  ! 2483: PREFETCH_I	prefetch	[%r8 + 0x0a90], #one_read
	.word 0xce220009  ! 2485: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xf01a0009  ! 2485: LDD_R	ldd	[%r8 + %r9], %r24
	.word 0xa8da0009  ! 2486: SMULcc_R	smulcc 	%r8, %r9, %r20
	.word 0xec2a0009  ! 2488: STB_R	stb	%r22, [%r8 + %r9]
	.word 0xcc020009  ! 2488: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xde220009  ! 2490: STW_R	stw	%r15, [%r8 + %r9]
	.word 0xc8120009  ! 2490: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xc3ea2e3c  ! 2491: PREFETCHA_I	prefetcha	[%r8, + 0x0e3c] %asi, #one_read
	.word 0xcc422e28  ! 2492: LDSW_I	ldsw	[%r8 + 0x0e28], %r6
	.word 0xc65a0009  ! 2493: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xc2720009  ! 2495: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xe6520009  ! 2495: LDSH_R	ldsh	[%r8 + %r9], %r19
	.word 0xc3ea1009  ! 2496: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x8143e032  ! 2497: MEMBAR	membar	#StoreLoad | #Lookaside | #MemIssue 
	.word 0xc4220009  ! 2499: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xcd1a0009  ! 2499: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xc3ea1009  ! 2500: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xf6921009  ! 2501: LDUHA_R	lduha	[%r8, %r9] 0x80, %r27
	.word 0xc36a2c98  ! 2502: PREFETCH_I	prefetch	[%r8 + 0x0c98], #one_read
	.word 0x8cf20009  ! 2503: UDIVcc_R	udivcc 	%r8, %r9, %r6
	.word 0x26ca0001  ! 2504: BRLZ	brlz,a,pt	%8,<label_0xa0001>
	.word 0x9efa2b7c  ! 2505: SDIVcc_I	sdivcc 	%r8, 0x0b7c, %r15
	.word 0xf73a0009  ! 2507: STDF_R	std	%f27, [%r9, %r8]
	.word 0xce720009  ! 2508: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc40a0009  ! 2508: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xc36a26e4  ! 2509: PREFETCH_I	prefetch	[%r8 + 0x06e4], #one_read
	.word 0xc2ea2638  ! 2510: LDSTUBA_I	ldstuba	%r1, [%r8 + 0x0638] %asi
	.word 0x887a0009  ! 2511: SDIV_R	sdiv 	%r8, %r9, %r4
	.word 0xef3a0009  ! 2513: STDF_R	std	%f23, [%r9, %r8]
	.word 0xce720009  ! 2514: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc4120009  ! 2514: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xc6a228fc  ! 2515: STWA_I	stwa	%r3, [%r8 + 0x08fc] %asi
	.word 0xf3f21009  ! 2516: CASXA_I	casxa	[%r8] 0x80, %r9, %r25
	.word 0x8143e076  ! 2517: MEMBAR	membar	#StoreLoad | #LoadStore | #Lookaside | #MemIssue | #Sync 
	.word 0xc6b227d4  ! 2518: STHA_I	stha	%r3, [%r8 + 0x07d4] %asi
	.word 0x824a0009  ! 2519: MULX_R	mulx 	%r8, %r9, %r1
	.word 0xcb220009  ! 2521: STF_R	st	%f5, [%r9, %r8]
	.word 0xc6720009  ! 2522: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xf4120009  ! 2522: LDUH_R	lduh	[%r8 + %r9], %r26
	.word 0xdc1a0009  ! 2523: LDD_R	ldd	[%r8 + %r9], %r14
	.word 0xfa220009  ! 2525: STW_R	stw	%r29, [%r8 + %r9]
	.word 0xca120009  ! 2525: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xf8921009  ! 2526: LDUHA_R	lduha	[%r8, %r9] 0x80, %r28
	.word 0x8143c000  ! 2527: STBAR	stbar
	.word 0xc3ea2f3c  ! 2528: PREFETCHA_I	prefetcha	[%r8, + 0x0f3c] %asi, #one_read
	.word 0xe4ca1009  ! 2529: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r18
	.word 0xb1a209a9  ! 2530: FDIVs	fdivs	%f8, %f9, %f24
	.word 0xc6b22080  ! 2531: STHA_I	stha	%r3, [%r8 + 0x0080] %asi
	.word 0xc5220009  ! 2533: STF_R	st	%f2, [%r9, %r8]
	.word 0xc8720009  ! 2534: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xce5a0009  ! 2534: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xcca22e1c  ! 2535: STWA_I	stwa	%r6, [%r8 + 0x0e1c] %asi
	.word 0xc28a1009  ! 2536: LDUBA_R	lduba	[%r8, %r9] 0x80, %r1
	.word 0xc6220009  ! 2538: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xca0a0009  ! 2538: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xc3220009  ! 2540: STF_R	st	%f1, [%r9, %r8]
	.word 0xc4720009  ! 2541: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xde4a0009  ! 2541: LDSB_R	ldsb	[%r8 + %r9], %r15
	.word 0x8c4a0009  ! 2542: MULX_R	mulx 	%r8, %r9, %r6
	.word 0xc8220009  ! 2544: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xca020009  ! 2544: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0x04c20001  ! 2545: BRLEZ	brlez  ,nt	%8,<label_0x20001>
	.word 0xc36a24e4  ! 2546: PREFETCH_I	prefetch	[%r8 + 0x04e4], #one_read
	.word 0xc6ea1009  ! 2547: LDSTUBA_R	ldstuba	%r3, [%r8 + %r9] 0x80
	.word 0xa26a0009  ! 2548: UDIVX_R	udivx 	%r8, %r9, %r17
	.word 0x2aca0001  ! 2549: BRNZ	brnz,a,pt	%8,<label_0xa0001>
	.word 0x8e7a0009  ! 2550: SDIV_R	sdiv 	%r8, %r9, %r7
	.word 0xc5222a40  ! 2551: STF_I	st	%f2, [0x0a40, %r8]
	.word 0x8143c000  ! 2552: STBAR	stbar
	.word 0x8143e060  ! 2553: MEMBAR	membar	#MemIssue | #Sync 
	.word 0xcb3a0009  ! 2555: STDF_R	std	%f5, [%r9, %r8]
	.word 0xe8720009  ! 2556: STX_R	stx	%r20, [%r8 + %r9]
	.word 0xc40a0009  ! 2556: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0x8afa0009  ! 2557: SDIVcc_R	sdivcc 	%r8, %r9, %r5
	.word 0xca7a0009  ! 2558: SWAP_R	swap	%r5, [%r8 + %r9]
	.word 0xc2f22d80  ! 2559: STXA_I	stxa	%r1, [%r8 + 0x0d80] %asi
	.word 0xc8220009  ! 2561: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xca5a0009  ! 2561: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xe48a1009  ! 2562: LDUBA_R	lduba	[%r8, %r9] 0x80, %r18
	.word 0x8143e025  ! 2563: MEMBAR	membar	#LoadLoad | #LoadStore | #MemIssue 
	.word 0x84d22300  ! 2564: UMULcc_I	umulcc 	%r8, 0x0300, %r2
	.word 0x89220009  ! 2565: MULScc_R	mulscc 	%r8, %r9, %r4
	.word 0xe41a23b8  ! 2566: LDD_I	ldd	[%r8 + 0x03b8], %r18
	.word 0x24c20001  ! 2567: BRLEZ	brlez,a,nt	%8,<label_0x20001>
	.word 0x8c5a0009  ! 2568: SMUL_R	smul 	%r8, %r9, %r6
	.word 0x8ba209a9  ! 2569: FDIVs	fdivs	%f8, %f9, %f5
	.word 0xc3ea1009  ! 2570: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x8b220009  ! 2571: MULScc_R	mulscc 	%r8, %r9, %r5
	.word 0xc36a0009  ! 2572: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0x24ca0001  ! 2573: BRLEZ	brlez,a,pt	%8,<label_0xa0001>
	.word 0xd9220009  ! 2575: STF_R	st	%f12, [%r9, %r8]
	.word 0xcc720009  ! 2576: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xec1a0009  ! 2576: LDD_R	ldd	[%r8 + %r9], %r22
	.word 0xe2ea1009  ! 2577: LDSTUBA_R	ldstuba	%r17, [%r8 + %r9] 0x80
	.word 0x1a800002  ! 2578: BCC	bcc  	<label_0x2>
	.word 0x867a0009  ! 2579: SDIV_R	sdiv 	%r8, %r9, %r3
	.word 0xcc320009  ! 2581: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc4520009  ! 2581: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xc80a2a3c  ! 2582: LDUB_I	ldub	[%r8 + 0x0a3c], %r4
	.word 0x2cca0001  ! 2583: BRGZ	brgz,a,pt	%8,<label_0xa0001>
	.word 0xcafa1009  ! 2584: SWAPA_R	swapa	%r5, [%r8 + %r9] 0x80
	.word 0xf6c21009  ! 2585: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r27
	.word 0xc25a0009  ! 2586: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0x86f20009  ! 2587: UDIVcc_R	udivcc 	%r8, %r9, %r3
	.word 0xcaa22198  ! 2588: STWA_I	stwa	%r5, [%r8 + 0x0198] %asi
	.word 0x9a5a0009  ! 2589: SMUL_R	smul 	%r8, %r9, %r13
	.word 0xcc921009  ! 2590: LDUHA_R	lduha	[%r8, %r9] 0x80, %r6
	.word 0xce220009  ! 2592: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xd6420009  ! 2592: LDSW_R	ldsw	[%r8 + %r9], %r11
	.word 0xc8320009  ! 2594: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xcf020009  ! 2594: LDF_R	ld	[%r8, %r9], %f7
	.word 0x836a0009  ! 2595: SDIVX_R	sdivx	%r8, %r9, %r1
	.word 0x8f220009  ! 2596: MULScc_R	mulscc 	%r8, %r9, %r7
	.word 0xc3ea1009  ! 2597: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xd7e21009  ! 2598: CASA_I	casa	[%r8] 0x80, %r9, %r11
	.word 0xc5f21009  ! 2599: CASXA_I	casxa	[%r8] 0x80, %r9, %r2
	.word 0xcab21009  ! 2600: STHA_R	stha	%r5, [%r8 + %r9] 0x80
	.word 0xcc8a203c  ! 2601: LDUBA_I	lduba	[%r8, + 0x003c] %asi, %r6
	.word 0x20800002  ! 2602: BN	bn,a	<label_0x2>
	.word 0xce220009  ! 2604: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc4420009  ! 2604: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xd6a22ce8  ! 2605: STWA_I	stwa	%r11, [%r8 + 0x0ce8] %asi
	.word 0x1e800002  ! 2606: BVC	bvc  	<label_0x2>
	.word 0xcc720009  ! 2608: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc2020009  ! 2608: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0x2ac20001  ! 2609: BRNZ	brnz,a,nt	%8,<label_0x20001>
	.word 0x18800001  ! 2610: BGU	bgu  	<label_0x1>
	.word 0x8143e024  ! 2611: MEMBAR	membar	#LoadStore | #MemIssue 
	.word 0xb0da0009  ! 2612: SMULcc_R	smulcc 	%r8, %r9, %r24
	.word 0xc80a2460  ! 2613: LDUB_I	ldub	[%r8 + 0x0460], %r4
	.word 0xf9220009  ! 2615: STF_R	st	%f28, [%r9, %r8]
	.word 0xcc720009  ! 2616: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc20a0009  ! 2616: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xf93a2f80  ! 2617: STDF_I	std	%f28, [0x0f80, %r8]
	.word 0x8143e02c  ! 2618: MEMBAR	membar	#LoadStore | #StoreStore | #MemIssue 
	.word 0x8e520009  ! 2619: UMUL_R	umul 	%r8, %r9, %r7
	.word 0xcc220009  ! 2621: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xda5a0009  ! 2621: LDX_R	ldx	[%r8 + %r9], %r13
	.word 0xfe320009  ! 2623: STH_R	sth	%r31, [%r8 + %r9]
	.word 0xca420009  ! 2623: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xaa720009  ! 2624: UDIV_R	udiv 	%r8, %r9, %r21
	.word 0x8143e04c  ! 2625: MEMBAR	membar	#LoadStore | #StoreStore | #Sync 
	.word 0xfaca1009  ! 2626: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r29
	.word 0xcc320009  ! 2628: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xca4a0009  ! 2628: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0x9c4a0009  ! 2629: MULX_R	mulx 	%r8, %r9, %r14
	.word 0x10800002  ! 2630: BA	ba  	<label_0x2>
	.word 0x8143c000  ! 2631: STBAR	stbar
	.word 0xcaea246c  ! 2632: LDSTUBA_I	ldstuba	%r5, [%r8 + 0x046c] %asi
	.word 0xec020009  ! 2633: LDUW_R	lduw	[%r8 + %r9], %r22
	.word 0x8143c000  ! 2634: STBAR	stbar
	.word 0xc9220009  ! 2636: STF_R	st	%f4, [%r9, %r8]
	.word 0xca720009  ! 2637: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xcd020009  ! 2637: LDF_R	ld	[%r8, %r9], %f6
	.word 0xf6b21009  ! 2638: STHA_R	stha	%r27, [%r8 + %r9] 0x80
	.word 0xe0f21009  ! 2639: STXA_R	stxa	%r16, [%r8 + %r9] 0x80
	.word 0xc4220009  ! 2641: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc6520009  ! 2641: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xcb220009  ! 2643: STF_R	st	%f5, [%r9, %r8]
	.word 0xcc720009  ! 2644: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xca120009  ! 2644: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xc36a2130  ! 2645: PREFETCH_I	prefetch	[%r8 + 0x0130], #one_read
	.word 0xcff22009  ! 2646: CASXA_R	casxa	[%r8]%asi, %r9, %r7
	.word 0x87a209a9  ! 2647: FDIVs	fdivs	%f8, %f9, %f3
	.word 0xec220009  ! 2649: STW_R	stw	%r22, [%r8 + %r9]
	.word 0xcc520009  ! 2649: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xca220009  ! 2651: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xe51a0009  ! 2651: LDDF_R	ldd	[%r8, %r9], %f18
	.word 0xc8b21009  ! 2652: STHA_R	stha	%r4, [%r8 + %r9] 0x80
	.word 0x8e5a2bd8  ! 2653: SMUL_I	smul 	%r8, 0x0bd8, %r7
	.word 0xcc0a0009  ! 2654: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0x04800001  ! 2655: BLE	ble  	<label_0x1>
	.word 0x8a4a2f68  ! 2656: MULX_I	mulx 	%r8, 0x0f68, %r5
	.word 0xc3ea1009  ! 2657: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc3ea29a4  ! 2658: PREFETCHA_I	prefetcha	[%r8, + 0x09a4] %asi, #one_read
	.word 0xce7a2128  ! 2659: SWAP_I	swap	%r7, [%r8 + 0x0128]
	.word 0xe0520009  ! 2660: LDSH_R	ldsh	[%r8 + %r9], %r16
	.word 0xe69227f4  ! 2661: LDUHA_I	lduha	[%r8, + 0x07f4] %asi, %r19
	.word 0x8143c000  ! 2662: STBAR	stbar
	.word 0xc3ea29a4  ! 2663: PREFETCHA_I	prefetcha	[%r8, + 0x09a4] %asi, #one_read
	.word 0xcc9a2648  ! 2664: LDDA_I	ldda	[%r8, + 0x0648] %asi, %r6
	.word 0xc3ea1009  ! 2665: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc36a24f8  ! 2666: PREFETCH_I	prefetch	[%r8 + 0x04f8], #one_read
	.word 0xc7f21009  ! 2667: CASXA_I	casxa	[%r8] 0x80, %r9, %r3
	.word 0x2e800002  ! 2668: BVS	bvs,a	<label_0x2>
	.word 0xccea26b4  ! 2669: LDSTUBA_I	ldstuba	%r6, [%r8 + 0x06b4] %asi
	.word 0xc36a2468  ! 2670: PREFETCH_I	prefetch	[%r8 + 0x0468], #one_read
	.word 0xc2da2e60  ! 2671: LDXA_I	ldxa	[%r8, + 0x0e60] %asi, %r1
	.word 0xce5a2d10  ! 2672: LDX_I	ldx	[%r8 + 0x0d10], %r7
	.word 0x12800001  ! 2673: BNE	bne  	<label_0x1>
	.word 0xd8220009  ! 2675: STW_R	stw	%r12, [%r8 + %r9]
	.word 0xce420009  ! 2675: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xa5a20929  ! 2676: FMULs	fmuls	%f8, %f9, %f18
	.word 0xc36a0009  ! 2677: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc36a0009  ! 2678: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc8720009  ! 2680: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xce4a0009  ! 2680: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xe01a2138  ! 2681: LDD_I	ldd	[%r8 + 0x0138], %r16
	.word 0xe4d21009  ! 2682: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r18
	.word 0xcf3a22c0  ! 2683: STDF_I	std	%f7, [0x02c0, %r8]
	.word 0x22800002  ! 2684: BE	be,a	<label_0x2>
	.word 0xc46a0009  ! 2685: LDSTUB_R	ldstub	%r2, [%r8 + %r9]
	.word 0xfe2a0009  ! 2687: STB_R	stb	%r31, [%r8 + %r9]
	.word 0xc4120009  ! 2687: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xc8220009  ! 2689: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc3020009  ! 2689: LDF_R	ld	[%r8, %r9], %f1
	.word 0xc9222f9c  ! 2690: STF_I	st	%f4, [0x0f9c, %r8]
	.word 0x20800002  ! 2691: BN	bn,a	<label_0x2>
	.word 0xc3ea21d0  ! 2692: PREFETCHA_I	prefetcha	[%r8, + 0x01d0] %asi, #one_read
	.word 0x8cda2ab4  ! 2693: SMULcc_I	smulcc 	%r8, 0x0ab4, %r6
	.word 0xce2a0009  ! 2695: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xca5a0009  ! 2695: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xce220009  ! 2697: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc8420009  ! 2697: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xe47a28f4  ! 2698: SWAP_I	swap	%r18, [%r8 + 0x08f4]
	.word 0xb5a20929  ! 2699: FMULs	fmuls	%f8, %f9, %f26
	.word 0xc86a0009  ! 2700: LDSTUB_R	ldstub	%r4, [%r8 + %r9]
	.word 0xc4ca1009  ! 2701: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r2
	.word 0xc2220009  ! 2703: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc4520009  ! 2703: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xc36a2404  ! 2704: PREFETCH_I	prefetch	[%r8 + 0x0404], #one_read
	.word 0xf67a0009  ! 2705: SWAP_R	swap	%r27, [%r8 + %r9]
	.word 0x30800001  ! 2706: BA	ba,a	<label_0x1>
	.word 0xc36a2408  ! 2707: PREFETCH_I	prefetch	[%r8 + 0x0408], #one_read
	.word 0xca220009  ! 2709: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xcc1a0009  ! 2709: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0x8d6a2258  ! 2710: SDIVX_I	sdivx	%r8, 0x0258, %r6
	.word 0x8143c000  ! 2711: STBAR	stbar
	.word 0xed3a2d10  ! 2712: STDF_I	std	%f22, [0x0d10, %r8]
	.word 0xe6aa1009  ! 2713: STBA_R	stba	%r19, [%r8 + %r9] 0x80
	.word 0xc36a27e8  ! 2714: PREFETCH_I	prefetch	[%r8 + 0x07e8], #one_read
	.word 0xce0a2d04  ! 2715: LDUB_I	ldub	[%r8 + 0x0d04], %r7
	.word 0x8ad20009  ! 2716: UMULcc_R	umulcc 	%r8, %r9, %r5
	.word 0xee422320  ! 2717: LDSW_I	ldsw	[%r8 + 0x0320], %r23
	.word 0xc3ea2d80  ! 2718: PREFETCHA_I	prefetcha	[%r8, + 0x0d80] %asi, #one_read
	.word 0xcc320009  ! 2720: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc41a0009  ! 2720: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xc2020009  ! 2721: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xb3a208a9  ! 2722: FSUBs	fsubs	%f8, %f9, %f25
	.word 0x8143c000  ! 2723: STBAR	stbar
	.word 0x8143c000  ! 2724: STBAR	stbar
	.word 0x8143c000  ! 2725: STBAR	stbar
	.word 0xcaf22b40  ! 2726: STXA_I	stxa	%r5, [%r8 + 0x0b40] %asi
	.word 0x88720009  ! 2727: UDIV_R	udiv 	%r8, %r9, %r4
	.word 0x8c5a0009  ! 2728: SMUL_R	smul 	%r8, %r9, %r6
	.word 0xf12229bc  ! 2729: STF_I	st	%f24, [0x09bc, %r8]
	.word 0x845a0009  ! 2730: SMUL_R	smul 	%r8, %r9, %r2
	.word 0xe2f21009  ! 2731: STXA_R	stxa	%r17, [%r8 + %r9] 0x80
	.word 0xcf022078  ! 2732: LDF_I	ld	[%r8, 0x0078], %f7
	.word 0xc3ea1009  ! 2733: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x32800001  ! 2734: BNE	bne,a	<label_0x1>
	.word 0xc4c21009  ! 2735: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r2
	.word 0xc81a2ef8  ! 2736: LDD_I	ldd	[%r8 + 0x0ef8], %r4
	.word 0xd6c225e8  ! 2737: LDSWA_I	ldswa	[%r8, + 0x05e8] %asi, %r11
	.word 0xc44a0009  ! 2738: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xc2020009  ! 2739: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0x20800001  ! 2740: BN	bn,a	<label_0x1>
	.word 0xceea2068  ! 2741: LDSTUBA_I	ldstuba	%r7, [%r8 + 0x0068] %asi
	.word 0xdb3a28a8  ! 2742: STDF_I	std	%f13, [0x08a8, %r8]
	.word 0xc44a2cf8  ! 2743: LDSB_I	ldsb	[%r8 + 0x0cf8], %r2
	.word 0xceaa2938  ! 2744: STBA_I	stba	%r7, [%r8 + 0x0938] %asi
	.word 0xf4520009  ! 2745: LDSH_R	ldsh	[%r8 + %r9], %r26
	.word 0xcb222300  ! 2746: STF_I	st	%f5, [0x0300, %r8]
	.word 0xca821009  ! 2747: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r5
	.word 0xfec22f24  ! 2748: LDSWA_I	ldswa	[%r8, + 0x0f24] %asi, %r31
	.word 0x2c800001  ! 2749: BNEG	bneg,a	<label_0x1>
	.word 0xc8fa2fa8  ! 2750: SWAPA_I	swapa	%r4, [%r8 + 0x0fa8] %asi
	.word 0xc36a0009  ! 2751: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xd6320009  ! 2753: STH_R	sth	%r11, [%r8 + %r9]
	.word 0xce120009  ! 2753: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xc6320009  ! 2755: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc24a0009  ! 2755: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xc36a0009  ! 2756: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc4220009  ! 2758: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc60a0009  ! 2758: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xc36a2ef8  ! 2759: PREFETCH_I	prefetch	[%r8 + 0x0ef8], #one_read
	.word 0x87a20829  ! 2760: FADDs	fadds	%f8, %f9, %f3
	.word 0x846a2fdc  ! 2761: UDIVX_I	udivx 	%r8, 0x0fdc, %r2
	.word 0xfac21009  ! 2762: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r29
	.word 0xc3ea2834  ! 2763: PREFETCHA_I	prefetcha	[%r8, + 0x0834] %asi, #one_read
	.word 0xf0c22530  ! 2764: LDSWA_I	ldswa	[%r8, + 0x0530] %asi, %r24
	.word 0xc3ea2ad4  ! 2765: PREFETCHA_I	prefetcha	[%r8, + 0x0ad4] %asi, #one_read
	.word 0x8143e03b  ! 2766: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Lookaside | #MemIssue 
	.word 0xc8ba1009  ! 2767: STDA_R	stda	%r4, [%r8 + %r9] 0x80
	.word 0xec022b0c  ! 2768: LDUW_I	lduw	[%r8 + 0x0b0c], %r22
	.word 0xa7a20929  ! 2769: FMULs	fmuls	%f8, %f9, %f19
	.word 0x8143c000  ! 2770: STBAR	stbar
	.word 0xcc120009  ! 2771: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0x8f220009  ! 2772: MULScc_R	mulscc 	%r8, %r9, %r7
	.word 0xe4ba2a88  ! 2773: STDA_I	stda	%r18, [%r8 + 0x0a88] %asi
	.word 0xf22a0009  ! 2775: STB_R	stb	%r25, [%r8 + %r9]
	.word 0xc80a0009  ! 2775: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0x88720009  ! 2776: UDIV_R	udiv 	%r8, %r9, %r4
	.word 0x847a2ed8  ! 2777: SDIV_I	sdiv 	%r8, 0x0ed8, %r2
	.word 0xc8ea1009  ! 2778: LDSTUBA_R	ldstuba	%r4, [%r8 + %r9] 0x80
	.word 0x83a209a9  ! 2779: FDIVs	fdivs	%f8, %f9, %f1
	.word 0xc93a0009  ! 2781: STDF_R	std	%f4, [%r9, %r8]
	.word 0xca720009  ! 2782: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xca5a0009  ! 2782: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xecba1009  ! 2783: STDA_R	stda	%r22, [%r8 + %r9] 0x80
	.word 0xc2fa267c  ! 2784: SWAPA_I	swapa	%r1, [%r8 + 0x067c] %asi
	.word 0x24800002  ! 2785: BLE	ble,a	<label_0x2>
	.word 0x8143c000  ! 2786: STBAR	stbar
	.word 0xc36a2edc  ! 2787: PREFETCH_I	prefetch	[%r8 + 0x0edc], #one_read
	.word 0xc4b22dcc  ! 2788: STHA_I	stha	%r2, [%r8 + 0x0dcc] %asi
	.word 0x9f6a2024  ! 2789: SDIVX_I	sdivx	%r8, 0x0024, %r15
	.word 0x87a20829  ! 2790: FADDs	fadds	%f8, %f9, %f3
	.word 0x8143c000  ! 2791: STBAR	stbar
	.word 0xcc2a0009  ! 2793: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xea520009  ! 2793: LDSH_R	ldsh	[%r8 + %r9], %r21
	.word 0xb72225f4  ! 2794: MULScc_I	mulscc 	%r8, 0x05f4, %r27
	.word 0xceea1009  ! 2795: LDSTUBA_R	ldstuba	%r7, [%r8 + %r9] 0x80
	.word 0x9c4a2658  ! 2796: MULX_I	mulx 	%r8, 0x0658, %r14
	.word 0xe8ba2030  ! 2797: STDA_I	stda	%r20, [%r8 + 0x0030] %asi
	.word 0xc36a2340  ! 2798: PREFETCH_I	prefetch	[%r8 + 0x0340], #one_read
	.word 0xcbe22009  ! 2799: CASA_R	casa	[%r8] %asi, %r9, %r5
	.word 0xc2da2980  ! 2800: LDXA_I	ldxa	[%r8, + 0x0980] %asi, %r1
	.word 0xcc1229d8  ! 2801: LDUH_I	lduh	[%r8 + 0x09d8], %r6
	.word 0xf4aa2004  ! 2802: STBA_I	stba	%r26, [%r8 + 0x0004] %asi
	.word 0xc22a0009  ! 2804: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xce020009  ! 2804: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0x2eca0001  ! 2805: BRGEZ	brgez,a,pt	%8,<label_0xa0001>
	.word 0x2c800001  ! 2806: BNEG	bneg,a	<label_0x1>
	.word 0xc8c227a0  ! 2807: LDSWA_I	ldswa	[%r8, + 0x07a0] %asi, %r4
	.word 0x22800002  ! 2808: BE	be,a	<label_0x2>
	.word 0xc36a2224  ! 2809: PREFETCH_I	prefetch	[%r8 + 0x0224], #one_read
	.word 0xc3ea2b3c  ! 2810: PREFETCHA_I	prefetcha	[%r8, + 0x0b3c] %asi, #one_read
	.word 0x82da0009  ! 2811: SMULcc_R	smulcc 	%r8, %r9, %r1
	.word 0xc36a2438  ! 2812: PREFETCH_I	prefetch	[%r8 + 0x0438], #one_read
	.word 0x24ca0001  ! 2813: BRLEZ	brlez,a,pt	%8,<label_0xa0001>
	.word 0x8143e077  ! 2814: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside | #MemIssue | #Sync 
	.word 0x82fa0009  ! 2815: SDIVcc_R	sdivcc 	%r8, %r9, %r1
	.word 0xee220009  ! 2817: STW_R	stw	%r23, [%r8 + %r9]
	.word 0xcb020009  ! 2817: LDF_R	ld	[%r8, %r9], %f5
	.word 0x38800002  ! 2818: BGU	bgu,a	<label_0x2>
	.word 0xecba1009  ! 2819: STDA_R	stda	%r22, [%r8 + %r9] 0x80
	.word 0xca422eac  ! 2820: LDSW_I	ldsw	[%r8 + 0x0eac], %r5
	.word 0x8ef229c0  ! 2821: UDIVcc_I	udivcc 	%r8, 0x09c0, %r7
	.word 0x22ca0001  ! 2822: BRZ	brz,a,pt	%8,<label_0xa0001>
	.word 0xce2a0009  ! 2824: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc64a0009  ! 2824: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xc73a0009  ! 2826: STDF_R	std	%f3, [%r9, %r8]
	.word 0xce720009  ! 2827: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc4020009  ! 2827: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xc4aa2a18  ! 2828: STBA_I	stba	%r2, [%r8 + 0x0a18] %asi
	.word 0xfb3a2a30  ! 2829: STDF_I	std	%f29, [0x0a30, %r8]
	.word 0xfe5a2928  ! 2830: LDX_I	ldx	[%r8 + 0x0928], %r31
	.word 0xca4a204c  ! 2831: LDSB_I	ldsb	[%r8 + 0x004c], %r5
	.word 0xc9e22009  ! 2832: CASA_R	casa	[%r8] %asi, %r9, %r4
	.word 0xae4a22a0  ! 2833: MULX_I	mulx 	%r8, 0x02a0, %r23
	.word 0xc27a0009  ! 2834: SWAP_R	swap	%r1, [%r8 + %r9]
	.word 0xff3a0009  ! 2836: STDF_R	std	%f31, [%r9, %r8]
	.word 0xce720009  ! 2837: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc9020009  ! 2837: LDF_R	ld	[%r8, %r9], %f4
	.word 0xb6f20009  ! 2838: UDIVcc_R	udivcc 	%r8, %r9, %r27
	.word 0xc3f21009  ! 2839: CASXA_I	casxa	[%r8] 0x80, %r9, %r1
	.word 0xe8f227d8  ! 2840: STXA_I	stxa	%r20, [%r8 + 0x07d8] %asi
	.word 0xd93a2548  ! 2841: STDF_I	std	%f12, [0x0548, %r8]
	.word 0xc8520009  ! 2842: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xccf22cb0  ! 2843: STXA_I	stxa	%r6, [%r8 + 0x0cb0] %asi
	.word 0xc3ea26ec  ! 2844: PREFETCHA_I	prefetcha	[%r8, + 0x06ec] %asi, #one_read
	.word 0xce4a0009  ! 2845: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xc85a21b8  ! 2846: LDX_I	ldx	[%r8 + 0x01b8], %r4
	.word 0xce320009  ! 2848: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc65a0009  ! 2848: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0x8143c000  ! 2849: STBAR	stbar
	.word 0xf8c21009  ! 2850: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r28
	.word 0xdd3a0009  ! 2852: STDF_R	std	%f14, [%r9, %r8]
	.word 0xce720009  ! 2853: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc4120009  ! 2853: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xc85a20f8  ! 2854: LDX_I	ldx	[%r8 + 0x00f8], %r4
	.word 0x99a20829  ! 2855: FADDs	fadds	%f8, %f9, %f12
	.word 0xca220009  ! 2857: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xce520009  ! 2857: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xcd220009  ! 2859: STF_R	st	%f6, [%r9, %r8]
	.word 0xc6720009  ! 2860: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xca0a0009  ! 2860: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xdc8229a8  ! 2861: LDUWA_I	lduwa	[%r8, + 0x09a8] %asi, %r14
	.word 0x83222840  ! 2862: MULScc_I	mulscc 	%r8, 0x0840, %r1
	.word 0xc42a0009  ! 2864: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xfb1a0009  ! 2864: LDDF_R	ldd	[%r8, %r9], %f29
	.word 0x40000001  ! 2865: CALL	call	disp30_1
	.word 0xfa220009  ! 2867: STW_R	stw	%r29, [%r8 + %r9]
	.word 0xca5a0009  ! 2867: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xc80a0009  ! 2868: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xc2ea1009  ! 2869: LDSTUBA_R	ldstuba	%r1, [%r8 + %r9] 0x80
	.word 0xc36a269c  ! 2870: PREFETCH_I	prefetch	[%r8 + 0x069c], #one_read
	.word 0x887a2dac  ! 2871: SDIV_I	sdiv 	%r8, 0x0dac, %r4
	.word 0x87220009  ! 2872: MULScc_R	mulscc 	%r8, %r9, %r3
	.word 0x8143e035  ! 2873: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside | #MemIssue 
	.word 0x84520009  ! 2874: UMUL_R	umul 	%r8, %r9, %r2
	.word 0xc4220009  ! 2876: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xce4a0009  ! 2876: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0x89a208a9  ! 2877: FSUBs	fsubs	%f8, %f9, %f4
	.word 0x845a28a0  ! 2878: SMUL_I	smul 	%r8, 0x08a0, %r2
	.word 0xcad21009  ! 2879: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r5
	.word 0xc28a2888  ! 2880: LDUBA_I	lduba	[%r8, + 0x0888] %asi, %r1
	.word 0x987a272c  ! 2881: SDIV_I	sdiv 	%r8, 0x072c, %r12
	.word 0x9ba209a9  ! 2882: FDIVs	fdivs	%f8, %f9, %f13
	.word 0xe6fa1009  ! 2883: SWAPA_R	swapa	%r19, [%r8 + %r9] 0x80
	.word 0xccc226d4  ! 2884: LDSWA_I	ldswa	[%r8, + 0x06d4] %asi, %r6
	.word 0x0eca0001  ! 2885: BRGEZ	brgez  ,pt	%8,<label_0xa0001>
	.word 0x8143e036  ! 2886: MEMBAR	membar	#StoreLoad | #LoadStore | #Lookaside | #MemIssue 
	.word 0xd86a24c4  ! 2887: LDSTUB_I	ldstub	%r12, [%r8 + 0x04c4]
	.word 0xcada2b08  ! 2888: LDXA_I	ldxa	[%r8, + 0x0b08] %asi, %r5
	.word 0x0eca0001  ! 2889: BRGEZ	brgez  ,pt	%8,<label_0xa0001>
	.word 0xc3ea2918  ! 2890: PREFETCHA_I	prefetcha	[%r8, + 0x0918] %asi, #one_read
	.word 0x22800001  ! 2891: BE	be,a	<label_0x1>
	.word 0xce220009  ! 2893: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xcc4a0009  ! 2893: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xc73a2f00  ! 2894: STDF_I	std	%f3, [0x0f00, %r8]
	.word 0xca520009  ! 2895: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0x3c800001  ! 2896: BPOS	bpos,a	<label_0x1>
	.word 0xc6da2700  ! 2897: LDXA_I	ldxa	[%r8, + 0x0700] %asi, %r3
	.word 0xc6422388  ! 2898: LDSW_I	ldsw	[%r8 + 0x0388], %r3
	.word 0xf5020009  ! 2899: LDF_R	ld	[%r8, %r9], %f26
	.word 0xcbf22009  ! 2900: CASXA_R	casxa	[%r8]%asi, %r9, %r5
	.word 0x8143e025  ! 2901: MEMBAR	membar	#LoadLoad | #LoadStore | #MemIssue 
	.word 0xea720009  ! 2903: STX_R	stx	%r21, [%r8 + %r9]
	.word 0xce420009  ! 2903: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0x8e7223c8  ! 2904: UDIV_I	udiv 	%r8, 0x03c8, %r7
	.word 0xc3ea2ed4  ! 2905: PREFETCHA_I	prefetcha	[%r8, + 0x0ed4] %asi, #one_read
	.word 0xd9220009  ! 2907: STF_R	st	%f12, [%r9, %r8]
	.word 0xd6720009  ! 2908: STX_R	stx	%r11, [%r8 + %r9]
	.word 0xff1a0009  ! 2908: LDDF_R	ldd	[%r8, %r9], %f31
	.word 0x8a6a0009  ! 2909: UDIVX_R	udivx 	%r8, %r9, %r5
	.word 0x8143c000  ! 2910: STBAR	stbar
	.word 0xec6a2794  ! 2911: LDSTUB_I	ldstub	%r22, [%r8 + 0x0794]
	.word 0xec1a0009  ! 2912: LDD_R	ldd	[%r8 + %r9], %r22
	.word 0x02ca0001  ! 2913: BRZ	brz  ,pt	%8,<label_0xa0001>
	.word 0xda921009  ! 2914: LDUHA_R	lduha	[%r8, %r9] 0x80, %r13
	.word 0x8143c000  ! 2915: STBAR	stbar
	.word 0xd85a0009  ! 2916: LDX_R	ldx	[%r8 + %r9], %r12
	.word 0xcc220009  ! 2918: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xce020009  ! 2918: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xce122a7c  ! 2919: LDUH_I	lduh	[%r8 + 0x0a7c], %r7
	.word 0x1e800001  ! 2920: BVC	bvc  	<label_0x1>
	.word 0x02800002  ! 2921: BE	be  	<label_0x2>
	.word 0x84da2194  ! 2922: SMULcc_I	smulcc 	%r8, 0x0194, %r2
	.word 0x14800002  ! 2923: BG	bg  	<label_0x2>
	.word 0x8d220009  ! 2924: MULScc_R	mulscc 	%r8, %r9, %r6
	.word 0xc4ba2780  ! 2925: STDA_I	stda	%r2, [%r8 + 0x0780] %asi
	.word 0xcbe22009  ! 2926: CASA_R	casa	[%r8] %asi, %r9, %r5
	.word 0xcc821009  ! 2927: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r6
	.word 0xe09a1009  ! 2928: LDDA_R	ldda	[%r8, %r9] 0x80, %r16
	.word 0xccc21009  ! 2929: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r6
	.word 0xcf022d40  ! 2930: LDF_I	ld	[%r8, 0x0d40], %f7
	.word 0xc4ea1009  ! 2931: LDSTUBA_R	ldstuba	%r2, [%r8 + %r9] 0x80
	.word 0xa4d229a8  ! 2932: UMULcc_I	umulcc 	%r8, 0x09a8, %r18
	.word 0xcb3a2fb8  ! 2933: STDF_I	std	%f5, [0x0fb8, %r8]
	.word 0xc4aa2700  ! 2934: STBA_I	stba	%r2, [%r8 + 0x0700] %asi
	.word 0xbd6a279c  ! 2935: SDIVX_I	sdivx	%r8, 0x079c, %r30
	.word 0x3a800002  ! 2936: BCC	bcc,a	<label_0x2>
	.word 0xc6b21009  ! 2937: STHA_R	stha	%r3, [%r8 + %r9] 0x80
	.word 0xcd220009  ! 2939: STF_R	st	%f6, [%r9, %r8]
	.word 0xca720009  ! 2940: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xf2020009  ! 2940: LDUW_R	lduw	[%r8 + %r9], %r25
	.word 0x8eda2454  ! 2941: SMULcc_I	smulcc 	%r8, 0x0454, %r7
	.word 0xce220009  ! 2943: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc84a0009  ! 2943: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xf89a2728  ! 2944: LDDA_I	ldda	[%r8, + 0x0728] %asi, %r28
	.word 0xe49a1009  ! 2945: LDDA_R	ldda	[%r8, %r9] 0x80, %r18
	.word 0x8143c000  ! 2946: STBAR	stbar
	.word 0xc3ea1009  ! 2947: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xaada0009  ! 2948: SMULcc_R	smulcc 	%r8, %r9, %r21
	.word 0xda220009  ! 2950: STW_R	stw	%r13, [%r8 + %r9]
	.word 0xc7020009  ! 2950: LDF_R	ld	[%r8, %r9], %f3
	.word 0xa9a20929  ! 2951: FMULs	fmuls	%f8, %f9, %f20
	.word 0xcd3a0009  ! 2953: STDF_R	std	%f6, [%r9, %r8]
	.word 0xce720009  ! 2954: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc4120009  ! 2954: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xc36a0009  ! 2955: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xca2a0009  ! 2957: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xcb020009  ! 2957: LDF_R	ld	[%r8, %r9], %f5
	.word 0xc8520009  ! 2958: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xc36a0009  ! 2959: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0x8ba208a9  ! 2960: FSUBs	fsubs	%f8, %f9, %f5
	.word 0x34800002  ! 2961: BG	bg,a	<label_0x2>
	.word 0xcfe22009  ! 2962: CASA_R	casa	[%r8] %asi, %r9, %r7
	.word 0x856a20d0  ! 2963: SDIVX_I	sdivx	%r8, 0x00d0, %r2
	.word 0x14800002  ! 2964: BG	bg  	<label_0x2>
	.word 0xa45222c0  ! 2965: UMUL_I	umul 	%r8, 0x02c0, %r18
	.word 0x89a20929  ! 2966: FMULs	fmuls	%f8, %f9, %f4
	.word 0xc3ea2094  ! 2967: PREFETCHA_I	prefetcha	[%r8, + 0x0094] %asi, #one_read
	.word 0xc82a0009  ! 2969: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xce0a0009  ! 2969: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xae4a0009  ! 2970: MULX_R	mulx 	%r8, %r9, %r23
	.word 0x8da20929  ! 2971: FMULs	fmuls	%f8, %f9, %f6
	.word 0xf8320009  ! 2973: STH_R	sth	%r28, [%r8 + %r9]
	.word 0xca520009  ! 2973: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xcc220009  ! 2975: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xca020009  ! 2975: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xe62a0009  ! 2977: STB_R	stb	%r19, [%r8 + %r9]
	.word 0xc8120009  ! 2977: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xe07a0009  ! 2978: SWAP_R	swap	%r16, [%r8 + %r9]
	.word 0xc6320009  ! 2980: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xcd020009  ! 2980: LDF_R	ld	[%r8, %r9], %f6
	.word 0xca2a0009  ! 2982: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xca520009  ! 2982: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0x824a0009  ! 2983: MULX_R	mulx 	%r8, %r9, %r1
	.word 0xe65a20e0  ! 2984: LDX_I	ldx	[%r8 + 0x00e0], %r19
	.word 0x89222320  ! 2985: MULScc_I	mulscc 	%r8, 0x0320, %r4
	.word 0xcdf22009  ! 2986: CASXA_R	casxa	[%r8]%asi, %r9, %r6
	.word 0xca6a0009  ! 2987: LDSTUB_R	ldstub	%r5, [%r8 + %r9]
	.word 0xc36a2c18  ! 2988: PREFETCH_I	prefetch	[%r8 + 0x0c18], #one_read
	.word 0xe89a1009  ! 2989: LDDA_R	ldda	[%r8, %r9] 0x80, %r20
	.word 0x8143e042  ! 2990: MEMBAR	membar	#StoreLoad | #Sync 
	.word 0xc42a0009  ! 2992: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc81a0009  ! 2992: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xc36a0009  ! 2993: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xa0da28c4  ! 2994: SMULcc_I	smulcc 	%r8, 0x08c4, %r16
	.word 0x8a6a0009  ! 2995: UDIVX_R	udivx 	%r8, %r9, %r5
	.word 0xc3ea2614  ! 2996: PREFETCHA_I	prefetcha	[%r8, + 0x0614] %asi, #one_read
	.word 0x8143c000  ! 2997: STBAR	stbar
	.word 0xccda2f80  ! 2998: LDXA_I	ldxa	[%r8, + 0x0f80] %asi, %r6
	.word 0x02800001  ! 2999: BE	be  	<label_0x1>
	.word 0x18800001  ! 3000: BGU	bgu  	<label_0x1>
	.word 0xf80a0009  ! 3001: LDUB_R	ldub	[%r8 + %r9], %r28
	.word 0xf8ba1009  ! 3002: STDA_R	stda	%r28, [%r8 + %r9] 0x80
	.word 0x8143e03d  ! 3003: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0x3e800002  ! 3004: BVC	bvc,a	<label_0x2>
	.word 0xc3ea1009  ! 3005: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xcbf21009  ! 3006: CASXA_I	casxa	[%r8] 0x80, %r9, %r5
	.word 0x36800001  ! 3007: BGE	bge,a	<label_0x1>
	.word 0xcad21009  ! 3008: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r5
	.word 0xc6f21009  ! 3009: STXA_R	stxa	%r3, [%r8 + %r9] 0x80
	.word 0x8143e024  ! 3010: MEMBAR	membar	#LoadStore | #MemIssue 
	.word 0xb7a20929  ! 3011: FMULs	fmuls	%f8, %f9, %f27
	.word 0x32800001  ! 3012: BNE	bne,a	<label_0x1>
	.word 0xaf220009  ! 3013: MULScc_R	mulscc 	%r8, %r9, %r23
	.word 0xc36a2e60  ! 3014: PREFETCH_I	prefetch	[%r8 + 0x0e60], #one_read
	.word 0xcb3a0009  ! 3016: STDF_R	std	%f5, [%r9, %r8]
	.word 0xd6720009  ! 3017: STX_R	stx	%r11, [%r8 + %r9]
	.word 0xc5020009  ! 3017: LDF_R	ld	[%r8, %r9], %f2
	.word 0xc8c21009  ! 3018: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r4
	.word 0xd89a1009  ! 3019: LDDA_R	ldda	[%r8, %r9] 0x80, %r12
	.word 0x8143c000  ! 3020: STBAR	stbar
	.word 0xfc320009  ! 3022: STH_R	sth	%r30, [%r8 + %r9]
	.word 0xf5020009  ! 3022: LDF_R	ld	[%r8, %r9], %f26
	.word 0xd82a0009  ! 3024: STB_R	stb	%r12, [%r8 + %r9]
	.word 0xe4520009  ! 3024: LDSH_R	ldsh	[%r8 + %r9], %r18
	.word 0xc3ea1009  ! 3025: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xde220009  ! 3027: STW_R	stw	%r15, [%r8 + %r9]
	.word 0xc44a0009  ! 3027: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xc6da1009  ! 3028: LDXA_R	ldxa	[%r8, %r9] 0x80, %r3
	.word 0x2cc20001  ! 3029: BRGZ	brgz,a,nt	%8,<label_0x20001>
	.word 0x0cc20001  ! 3030: BRGZ	brgz  ,nt	%8,<label_0x20001>
	.word 0xfaa21009  ! 3031: STWA_R	stwa	%r29, [%r8 + %r9] 0x80
	.word 0xc60a0009  ! 3032: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xc33a2c48  ! 3033: STDF_I	std	%f1, [0x0c48, %r8]
	.word 0x8143e035  ! 3034: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside | #MemIssue 
	.word 0x40000002  ! 3035: CALL	call	disp30_2
	.word 0xfcb21009  ! 3036: STHA_R	stha	%r30, [%r8 + %r9] 0x80
	.word 0xc82a0009  ! 3038: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xcd020009  ! 3038: LDF_R	ld	[%r8, %r9], %f6
	.word 0xccaa223c  ! 3039: STBA_I	stba	%r6, [%r8 + 0x023c] %asi
	.word 0xcd220009  ! 3041: STF_R	st	%f6, [%r9, %r8]
	.word 0xca720009  ! 3042: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xce0a0009  ! 3042: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xc3ea2500  ! 3043: PREFETCHA_I	prefetcha	[%r8, + 0x0500] %asi, #one_read
	.word 0x83a208a9  ! 3044: FSUBs	fsubs	%f8, %f9, %f1
	.word 0x8143e04a  ! 3045: MEMBAR	membar	#StoreLoad | #StoreStore | #Sync 
	.word 0xc36a0009  ! 3046: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xf2720009  ! 3048: STX_R	stx	%r25, [%r8 + %r9]
	.word 0xc8020009  ! 3048: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0x82d20009  ! 3049: UMULcc_R	umulcc 	%r8, %r9, %r1
	.word 0x16800001  ! 3050: BGE	bge  	<label_0x1>
	.word 0xc8ba2fc8  ! 3051: STDA_I	stda	%r4, [%r8 + 0x0fc8] %asi
	.word 0x8e5228e8  ! 3052: UMUL_I	umul 	%r8, 0x08e8, %r7
	.word 0xf02a0009  ! 3054: STB_R	stb	%r24, [%r8 + %r9]
	.word 0xcc120009  ! 3054: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xc33a2ed8  ! 3055: STDF_I	std	%f1, [0x0ed8, %r8]
	.word 0x82f22774  ! 3056: UDIVcc_I	udivcc 	%r8, 0x0774, %r1
	.word 0x08800002  ! 3057: BLEU	bleu  	<label_0x2>
	.word 0xc36a0009  ! 3058: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc2b22ebc  ! 3059: STHA_I	stha	%r1, [%r8 + 0x0ebc] %asi
	.word 0xa84a0009  ! 3060: MULX_R	mulx 	%r8, %r9, %r20
	.word 0xe22a0009  ! 3062: STB_R	stb	%r17, [%r8 + %r9]
	.word 0xca420009  ! 3062: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xc36a0009  ! 3063: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0x0e800001  ! 3064: BVS	bvs  	<label_0x1>
	.word 0xcc5a2350  ! 3065: LDX_I	ldx	[%r8 + 0x0350], %r6
	.word 0xc3ea21f4  ! 3066: PREFETCHA_I	prefetcha	[%r8, + 0x01f4] %asi, #one_read
	.word 0xcaea1009  ! 3067: LDSTUBA_R	ldstuba	%r5, [%r8 + %r9] 0x80
	.word 0xb47222d4  ! 3068: UDIV_I	udiv 	%r8, 0x02d4, %r26
	.word 0xe8ca1009  ! 3069: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r20
	.word 0xc0ba2b10  ! 3070: STDA_I	stda	%r0, [%r8 + 0x0b10] %asi
	.word 0x8a522aa4  ! 3071: UMUL_I	umul 	%r8, 0x0aa4, %r5
	.word 0xf2320009  ! 3073: STH_R	sth	%r25, [%r8 + %r9]
	.word 0xc40a0009  ! 3073: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xc2320009  ! 3075: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xfe520009  ! 3075: LDSH_R	ldsh	[%r8 + %r9], %r31
	.word 0xcef22d68  ! 3076: STXA_I	stxa	%r7, [%r8 + 0x0d68] %asi
	.word 0xc4f22d60  ! 3077: STXA_I	stxa	%r2, [%r8 + 0x0d60] %asi
	.word 0xc4ba2fa0  ! 3078: STDA_I	stda	%r2, [%r8 + 0x0fa0] %asi
	.word 0xcdf21009  ! 3079: CASXA_I	casxa	[%r8] 0x80, %r9, %r6
	.word 0xe27a2fac  ! 3080: SWAP_I	swap	%r17, [%r8 + 0x0fac]
	.word 0xc36a0009  ! 3081: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0x08800001  ! 3082: BLEU	bleu  	<label_0x1>
	.word 0x82f20009  ! 3083: UDIVcc_R	udivcc 	%r8, %r9, %r1
	.word 0xe4b22148  ! 3084: STHA_I	stha	%r18, [%r8 + 0x0148] %asi
	.word 0x86f22970  ! 3085: UDIVcc_I	udivcc 	%r8, 0x0970, %r3
	.word 0xc3e21009  ! 3086: CASA_I	casa	[%r8] 0x80, %r9, %r1
	.word 0xc3ea1009  ! 3087: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xcc2a0009  ! 3089: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xca120009  ! 3089: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0x8143c000  ! 3090: STBAR	stbar
	.word 0xc4220009  ! 3092: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xde120009  ! 3092: LDUH_R	lduh	[%r8 + %r9], %r15
	.word 0xc24a0009  ! 3093: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xf2da2b70  ! 3094: LDXA_I	ldxa	[%r8, + 0x0b70] %asi, %r25
	.word 0x8c520009  ! 3095: UMUL_R	umul 	%r8, %r9, %r6
	.word 0xc36a2870  ! 3096: PREFETCH_I	prefetch	[%r8 + 0x0870], #one_read
	.word 0x04c20001  ! 3097: BRLEZ	brlez  ,nt	%8,<label_0x20001>
	.word 0xc89a28a0  ! 3098: LDDA_I	ldda	[%r8, + 0x08a0] %asi, %r4
	.word 0xda220009  ! 3100: STW_R	stw	%r13, [%r8 + %r9]
	.word 0xe64a0009  ! 3100: LDSB_R	ldsb	[%r8 + %r9], %r19
	.word 0xc93a0009  ! 3102: STDF_R	std	%f4, [%r9, %r8]
	.word 0xcc720009  ! 3103: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc44a0009  ! 3103: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0x3a800001  ! 3104: BCC	bcc,a	<label_0x1>
	.word 0x82520009  ! 3105: UMUL_R	umul 	%r8, %r9, %r1
	.word 0x8ed20009  ! 3106: UMULcc_R	umulcc 	%r8, %r9, %r7
	.word 0xc4522ae8  ! 3107: LDSH_I	ldsh	[%r8 + 0x0ae8], %r2
	.word 0x12800001  ! 3108: BNE	bne  	<label_0x1>
	.word 0xce922e8c  ! 3109: LDUHA_I	lduha	[%r8, + 0x0e8c] %asi, %r7
	.word 0xe2220009  ! 3111: STW_R	stw	%r17, [%r8 + %r9]
	.word 0xc8020009  ! 3111: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0x824a2c20  ! 3112: MULX_I	mulx 	%r8, 0x0c20, %r1
	.word 0xcb22267c  ! 3113: STF_I	st	%f5, [0x067c, %r8]
	.word 0x8143e02c  ! 3114: MEMBAR	membar	#LoadStore | #StoreStore | #MemIssue 
	.word 0xcff22009  ! 3115: CASXA_R	casxa	[%r8]%asi, %r9, %r7
	.word 0x2a800001  ! 3116: BCS	bcs,a	<label_0x1>
	.word 0x8143c000  ! 3117: STBAR	stbar
	.word 0xc2f21009  ! 3118: STXA_R	stxa	%r1, [%r8 + %r9] 0x80
	.word 0xc22a0009  ! 3120: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc44a0009  ! 3120: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xec922060  ! 3121: LDUHA_I	lduha	[%r8, + 0x0060] %asi, %r22
	.word 0xcc220009  ! 3123: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc7020009  ! 3123: LDF_R	ld	[%r8, %r9], %f3
	.word 0xca220009  ! 3125: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xfc5a0009  ! 3125: LDX_R	ldx	[%r8 + %r9], %r30
	.word 0xe65a0009  ! 3126: LDX_R	ldx	[%r8 + %r9], %r19
	.word 0x8143e05f  ! 3127: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0xc53a2e88  ! 3128: STDF_I	std	%f2, [0x0e88, %r8]
	.word 0xe9e22009  ! 3129: CASA_R	casa	[%r8] %asi, %r9, %r20
	.word 0xc36a230c  ! 3130: PREFETCH_I	prefetch	[%r8 + 0x030c], #one_read
	.word 0x8143e047  ! 3131: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Sync 
	.word 0xe53a2ce8  ! 3132: STDF_I	std	%f18, [0x0ce8, %r8]
	.word 0xe0ba1009  ! 3133: STDA_R	stda	%r16, [%r8 + %r9] 0x80
	.word 0xcc9a2ac8  ! 3134: LDDA_I	ldda	[%r8, + 0x0ac8] %asi, %r6
	.word 0xc2a227c8  ! 3135: STWA_I	stwa	%r1, [%r8 + 0x07c8] %asi
	.word 0x87a20829  ! 3136: FADDs	fadds	%f8, %f9, %f3
	.word 0x84fa28e4  ! 3137: SDIVcc_I	sdivcc 	%r8, 0x08e4, %r2
	.word 0x2cca0001  ! 3138: BRGZ	brgz,a,pt	%8,<label_0xa0001>
	.word 0x1c800001  ! 3139: BPOS	bpos  	<label_0x1>
	.word 0xc852200c  ! 3140: LDSH_I	ldsh	[%r8 + 0x000c], %r4
	.word 0x82f223b8  ! 3141: UDIVcc_I	udivcc 	%r8, 0x03b8, %r1
	.word 0x10800001  ! 3142: BA	ba  	<label_0x1>
	.word 0xc3ea2b64  ! 3143: PREFETCHA_I	prefetcha	[%r8, + 0x0b64] %asi, #one_read
	.word 0x887a20e8  ! 3144: SDIV_I	sdiv 	%r8, 0x00e8, %r4
	.word 0xce220009  ! 3146: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xf80a0009  ! 3146: LDUB_R	ldub	[%r8 + %r9], %r28
	.word 0xcc720009  ! 3148: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc2020009  ! 3148: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0x8a7a2ecc  ! 3149: SDIV_I	sdiv 	%r8, 0x0ecc, %r5
	.word 0x8143c000  ! 3150: STBAR	stbar
	.word 0xfe220009  ! 3152: STW_R	stw	%r31, [%r8 + %r9]
	.word 0xc80a0009  ! 3152: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xfd3a0009  ! 3154: STDF_R	std	%f30, [%r9, %r8]
	.word 0xda720009  ! 3155: STX_R	stx	%r13, [%r8 + %r9]
	.word 0xec520009  ! 3155: LDSH_R	ldsh	[%r8 + %r9], %r22
	.word 0xc2a228ec  ! 3156: STWA_I	stwa	%r1, [%r8 + 0x08ec] %asi
	.word 0x8143e057  ! 3157: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside | #Sync 
	.word 0x876a2bd8  ! 3158: SDIVX_I	sdivx	%r8, 0x0bd8, %r3
	.word 0xdaca2200  ! 3159: LDSBA_I	ldsba	[%r8, + 0x0200] %asi, %r13
	.word 0xde2a0009  ! 3161: STB_R	stb	%r15, [%r8 + %r9]
	.word 0xe85a0009  ! 3161: LDX_R	ldx	[%r8 + %r9], %r20
	.word 0x8d22224c  ! 3162: MULScc_I	mulscc 	%r8, 0x024c, %r6
	.word 0xb96a28a8  ! 3163: SDIVX_I	sdivx	%r8, 0x08a8, %r28
	.word 0xac722fec  ! 3164: UDIV_I	udiv 	%r8, 0x0fec, %r22
	.word 0xc3ea1009  ! 3165: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc82a0009  ! 3167: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xf41a0009  ! 3167: LDD_R	ldd	[%r8 + %r9], %r26
	.word 0xe6320009  ! 3169: STH_R	sth	%r19, [%r8 + %r9]
	.word 0xc81a0009  ! 3169: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xc7e22009  ! 3170: CASA_R	casa	[%r8] %asi, %r9, %r3
	.word 0x9e522d78  ! 3171: UMUL_I	umul 	%r8, 0x0d78, %r15
	.word 0x8b6a0009  ! 3172: SDIVX_R	sdivx	%r8, %r9, %r5
	.word 0xc33a0009  ! 3174: STDF_R	std	%f1, [%r9, %r8]
	.word 0xcc720009  ! 3175: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xda0a0009  ! 3175: LDUB_R	ldub	[%r8 + %r9], %r13
	.word 0x8a6a0009  ! 3176: UDIVX_R	udivx 	%r8, %r9, %r5
	.word 0xccf21009  ! 3177: STXA_R	stxa	%r6, [%r8 + %r9] 0x80
	.word 0xcac22e34  ! 3178: LDSWA_I	ldswa	[%r8, + 0x0e34] %asi, %r5
	.word 0xc2fa2374  ! 3179: SWAPA_I	swapa	%r1, [%r8 + 0x0374] %asi
	.word 0x9ba208a9  ! 3180: FSUBs	fsubs	%f8, %f9, %f13
	.word 0xc3220009  ! 3182: STF_R	st	%f1, [%r9, %r8]
	.word 0xce720009  ! 3183: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc41a0009  ! 3183: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x8143e030  ! 3184: MEMBAR	membar	#Lookaside | #MemIssue 
	.word 0xc6921009  ! 3185: LDUHA_R	lduha	[%r8, %r9] 0x80, %r3
	.word 0xca120009  ! 3186: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xc4ea275c  ! 3187: LDSTUBA_I	ldstuba	%r2, [%r8 + 0x075c] %asi
	.word 0x06c20001  ! 3188: BRLZ	brlz  ,nt	%8,<label_0x20001>
	.word 0x8143c000  ! 3189: STBAR	stbar
	.word 0xcec21009  ! 3190: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r7
	.word 0xcf3a2f68  ! 3191: STDF_I	std	%f7, [0x0f68, %r8]
	.word 0xf6320009  ! 3193: STH_R	sth	%r27, [%r8 + %r9]
	.word 0xc51a0009  ! 3193: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xca5a0009  ! 3194: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xccb22554  ! 3195: STHA_I	stha	%r6, [%r8 + 0x0554] %asi
	.word 0x8d2225e8  ! 3196: MULScc_I	mulscc 	%r8, 0x05e8, %r6
	.word 0x8f220009  ! 3197: MULScc_R	mulscc 	%r8, %r9, %r7
	.word 0x83a208a9  ! 3198: FSUBs	fsubs	%f8, %f9, %f1
	.word 0xc8320009  ! 3200: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc20a0009  ! 3200: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xc36a0009  ! 3201: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0x8a520009  ! 3202: UMUL_R	umul 	%r8, %r9, %r5
	.word 0xe2320009  ! 3204: STH_R	sth	%r17, [%r8 + %r9]
	.word 0xc8120009  ! 3204: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xccd21009  ! 3205: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r6
	.word 0xe0220009  ! 3207: STW_R	stw	%r16, [%r8 + %r9]
	.word 0xc8020009  ! 3207: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xceea2e34  ! 3208: LDSTUBA_I	ldstuba	%r7, [%r8 + 0x0e34] %asi
	.word 0x8c6a2488  ! 3209: UDIVX_I	udivx 	%r8, 0x0488, %r6
	.word 0xf6aa29cc  ! 3210: STBA_I	stba	%r27, [%r8 + 0x09cc] %asi
	.word 0xc7222424  ! 3211: STF_I	st	%f3, [0x0424, %r8]
	.word 0xc36a0009  ! 3212: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0x8ad20009  ! 3213: UMULcc_R	umulcc 	%r8, %r9, %r5
	.word 0xc22a0009  ! 3215: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xe40a0009  ! 3215: LDUB_R	ldub	[%r8 + %r9], %r18
	.word 0xfcf22820  ! 3216: STXA_I	stxa	%r30, [%r8 + 0x0820] %asi
	.word 0xc36a26e0  ! 3217: PREFETCH_I	prefetch	[%r8 + 0x06e0], #one_read
	.word 0xd6ea1009  ! 3218: LDSTUBA_R	ldstuba	%r11, [%r8 + %r9] 0x80
	.word 0xc3ea2c64  ! 3219: PREFETCHA_I	prefetcha	[%r8, + 0x0c64] %asi, #one_read
	.word 0xc6ea1009  ! 3220: LDSTUBA_R	ldstuba	%r3, [%r8 + %r9] 0x80
	.word 0xce7a0009  ! 3221: SWAP_R	swap	%r7, [%r8 + %r9]
	.word 0x8143c000  ! 3222: STBAR	stbar
	.word 0xb4fa0009  ! 3223: SDIVcc_R	sdivcc 	%r8, %r9, %r26
	.word 0xcb020009  ! 3224: LDF_R	ld	[%r8, %r9], %f5
	.word 0xae4a2dcc  ! 3225: MULX_I	mulx 	%r8, 0x0dcc, %r23
	.word 0xe8c21009  ! 3226: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r20
	.word 0xa5222a94  ! 3227: MULScc_I	mulscc 	%r8, 0x0a94, %r18
	.word 0xc8720009  ! 3229: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xda120009  ! 3229: LDUH_R	lduh	[%r8 + %r9], %r13
	.word 0x8da209a9  ! 3230: FDIVs	fdivs	%f8, %f9, %f6
	.word 0x8143c000  ! 3231: STBAR	stbar
	.word 0x8143c000  ! 3232: STBAR	stbar
	.word 0xf8320009  ! 3234: STH_R	sth	%r28, [%r8 + %r9]
	.word 0xce420009  ! 3234: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xc2720009  ! 3236: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc4420009  ! 3236: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xe0320009  ! 3238: STH_R	sth	%r16, [%r8 + %r9]
	.word 0xca4a0009  ! 3238: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xceca2e44  ! 3239: LDSBA_I	ldsba	[%r8, + 0x0e44] %asi, %r7
	.word 0x8ba209a9  ! 3240: FDIVs	fdivs	%f8, %f9, %f5
	.word 0x8143e072  ! 3241: MEMBAR	membar	#StoreLoad | #Lookaside | #MemIssue | #Sync 
	.word 0xc64a0009  ! 3242: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xe2320009  ! 3244: STH_R	sth	%r17, [%r8 + %r9]
	.word 0xc4020009  ! 3244: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0x83a20829  ! 3245: FADDs	fadds	%f8, %f9, %f1
	.word 0xc6ca1009  ! 3246: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r3
	.word 0x83a209a9  ! 3247: FDIVs	fdivs	%f8, %f9, %f1
	.word 0xc53a2e20  ! 3248: STDF_I	std	%f2, [0x0e20, %r8]
	.word 0xd84a0009  ! 3249: LDSB_R	ldsb	[%r8 + %r9], %r12
	.word 0xc36a0009  ! 3250: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xb6d22c68  ! 3251: UMULcc_I	umulcc 	%r8, 0x0c68, %r27
	.word 0x88fa2810  ! 3252: SDIVcc_I	sdivcc 	%r8, 0x0810, %r4
	.word 0xf2b21009  ! 3253: STHA_R	stha	%r25, [%r8 + %r9] 0x80
	.word 0xc4ca1009  ! 3254: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r2
	.word 0xc4fa1009  ! 3255: SWAPA_R	swapa	%r2, [%r8 + %r9] 0x80
	.word 0x28800001  ! 3256: BLEU	bleu,a	<label_0x1>
	.word 0xceea1009  ! 3257: LDSTUBA_R	ldstuba	%r7, [%r8 + %r9] 0x80
	.word 0xfc720009  ! 3259: STX_R	stx	%r30, [%r8 + %r9]
	.word 0xc40a0009  ! 3259: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0x867a2ee4  ! 3260: SDIV_I	sdiv 	%r8, 0x0ee4, %r3
	.word 0xcc020009  ! 3261: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xcd1a2b68  ! 3262: LDDF_I	ldd	[%r8, 0x0b68], %f6
	.word 0xc6220009  ! 3264: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xcf020009  ! 3264: LDF_R	ld	[%r8, %r9], %f7
	.word 0xc36a0009  ! 3265: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc3ea2078  ! 3266: PREFETCHA_I	prefetcha	[%r8, + 0x0078] %asi, #one_read
	.word 0xc4fa1009  ! 3267: SWAPA_R	swapa	%r2, [%r8 + %r9] 0x80
	.word 0xbba208a9  ! 3268: FSUBs	fsubs	%f8, %f9, %f29
	.word 0xda82268c  ! 3269: LDUWA_I	lduwa	[%r8, + 0x068c] %asi, %r13
	.word 0xfc220009  ! 3271: STW_R	stw	%r30, [%r8 + %r9]
	.word 0xc81a0009  ! 3271: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x867a2b50  ! 3272: SDIV_I	sdiv 	%r8, 0x0b50, %r3
	.word 0xc3ea266c  ! 3273: PREFETCHA_I	prefetcha	[%r8, + 0x066c] %asi, #one_read
	.word 0xc36a2584  ! 3274: PREFETCH_I	prefetch	[%r8 + 0x0584], #one_read
	.word 0xce2a0009  ! 3276: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xda420009  ! 3276: LDSW_R	ldsw	[%r8 + %r9], %r13
	.word 0x8c520009  ! 3277: UMUL_R	umul 	%r8, %r9, %r6
	.word 0xf0720009  ! 3279: STX_R	stx	%r24, [%r8 + %r9]
	.word 0xf0520009  ! 3279: LDSH_R	ldsh	[%r8 + %r9], %r24
	.word 0x8c7a0009  ! 3280: SDIV_R	sdiv 	%r8, %r9, %r6
	.word 0x845a0009  ! 3281: SMUL_R	smul 	%r8, %r9, %r2
	.word 0xcec21009  ! 3282: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r7
	.word 0xcef21009  ! 3283: STXA_R	stxa	%r7, [%r8 + %r9] 0x80
	.word 0xd6ca1009  ! 3284: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r11
	.word 0xc4da2248  ! 3285: LDXA_I	ldxa	[%r8, + 0x0248] %asi, %r2
	.word 0x8fa20929  ! 3286: FMULs	fmuls	%f8, %f9, %f7
	.word 0xf2220009  ! 3288: STW_R	stw	%r25, [%r8 + %r9]
	.word 0xca420009  ! 3288: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xcc7a0009  ! 3289: SWAP_R	swap	%r6, [%r8 + %r9]
	.word 0xc36a2eac  ! 3290: PREFETCH_I	prefetch	[%r8 + 0x0eac], #one_read
	.word 0xbc722230  ! 3291: UDIV_I	udiv 	%r8, 0x0230, %r30
	.word 0xe2122830  ! 3292: LDUH_I	lduh	[%r8 + 0x0830], %r17
	.word 0xc4921009  ! 3293: LDUHA_R	lduha	[%r8, %r9] 0x80, %r2
	.word 0xce0a0009  ! 3294: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xc85a21a0  ! 3295: LDX_I	ldx	[%r8 + 0x01a0], %r4
	.word 0x83220009  ! 3296: MULScc_R	mulscc 	%r8, %r9, %r1
	.word 0xce4a0009  ! 3297: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xcf3a0009  ! 3299: STDF_R	std	%f7, [%r9, %r8]
	.word 0xca720009  ! 3300: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xf84a0009  ! 3300: LDSB_R	ldsb	[%r8 + %r9], %r28
	.word 0xce220009  ! 3302: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xe31a0009  ! 3302: LDDF_R	ldd	[%r8, %r9], %f17
	.word 0x8143c000  ! 3303: STBAR	stbar
	.word 0x8da20929  ! 3304: FMULs	fmuls	%f8, %f9, %f6
	.word 0xc24a2fec  ! 3305: LDSB_I	ldsb	[%r8 + 0x0fec], %r1
	.word 0xe47a2b9c  ! 3306: SWAP_I	swap	%r18, [%r8 + 0x0b9c]
	.word 0xc3ea1009  ! 3307: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x8143e027  ! 3308: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #MemIssue 
	.word 0x8143c000  ! 3309: STBAR	stbar
	.word 0xc2320009  ! 3311: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xdc0a0009  ! 3311: LDUB_R	ldub	[%r8 + %r9], %r14
	.word 0xc36a220c  ! 3312: PREFETCH_I	prefetch	[%r8 + 0x020c], #one_read
	.word 0xc8220009  ! 3314: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc4120009  ! 3314: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xdab22924  ! 3315: STHA_I	stha	%r13, [%r8 + 0x0924] %asi
	.word 0xa07a0009  ! 3316: SDIV_R	sdiv 	%r8, %r9, %r16
	.word 0xc62a0009  ! 3318: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xfc5a0009  ! 3318: LDX_R	ldx	[%r8 + %r9], %r30
	.word 0xc8da1009  ! 3319: LDXA_R	ldxa	[%r8, %r9] 0x80, %r4
	.word 0x8e722810  ! 3320: UDIV_I	udiv 	%r8, 0x0810, %r7
	.word 0x8e520009  ! 3321: UMUL_R	umul 	%r8, %r9, %r7
	.word 0xecda1009  ! 3322: LDXA_R	ldxa	[%r8, %r9] 0x80, %r22
	.word 0xef222cd0  ! 3323: STF_I	st	%f23, [0x0cd0, %r8]
	.word 0xb5a209a9  ! 3324: FDIVs	fdivs	%f8, %f9, %f26
	.word 0xc4922654  ! 3325: LDUHA_I	lduha	[%r8, + 0x0654] %asi, %r2
	.word 0xfb3a29a0  ! 3326: STDF_I	std	%f29, [0x09a0, %r8]
	.word 0x96722654  ! 3327: UDIV_I	udiv 	%r8, 0x0654, %r11
	.word 0xc2aa28c8  ! 3328: STBA_I	stba	%r1, [%r8 + 0x08c8] %asi
	.word 0x04c20001  ! 3329: BRLEZ	brlez  ,nt	%8,<label_0x20001>
	.word 0xe8a21009  ! 3330: STWA_R	stwa	%r20, [%r8 + %r9] 0x80
	.word 0xc3ea1009  ! 3331: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x8143c000  ! 3332: STBAR	stbar
	.word 0xcb222de8  ! 3333: STF_I	st	%f5, [0x0de8, %r8]
	.word 0x826a2d24  ! 3334: UDIVX_I	udivx 	%r8, 0x0d24, %r1
	.word 0xc2220009  ! 3336: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xe8420009  ! 3336: LDSW_R	ldsw	[%r8 + %r9], %r20
	.word 0x85a20829  ! 3337: FADDs	fadds	%f8, %f9, %f2
	.word 0x8143e034  ! 3338: MEMBAR	membar	#LoadStore | #Lookaside | #MemIssue 
	.word 0xcc320009  ! 3340: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xcb1a0009  ! 3340: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0x8143c000  ! 3341: STBAR	stbar
	.word 0xce320009  ! 3343: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xfc420009  ! 3343: LDSW_R	ldsw	[%r8 + %r9], %r30
	.word 0x8a7a2304  ! 3344: SDIV_I	sdiv 	%r8, 0x0304, %r5
	.word 0x8a52210c  ! 3345: UMUL_I	umul 	%r8, 0x010c, %r5
	.word 0xbf6a0009  ! 3346: SDIVX_R	sdivx	%r8, %r9, %r31
	.word 0xafa20929  ! 3347: FMULs	fmuls	%f8, %f9, %f23
	.word 0xc3e21009  ! 3348: CASA_I	casa	[%r8] 0x80, %r9, %r1
	.word 0x8143c000  ! 3349: STBAR	stbar
	.word 0x8b222f88  ! 3350: MULScc_I	mulscc 	%r8, 0x0f88, %r5
	.word 0xc3ea2528  ! 3351: PREFETCHA_I	prefetcha	[%r8, + 0x0528] %asi, #one_read
	.word 0xcab220c4  ! 3352: STHA_I	stha	%r5, [%r8 + 0x00c4] %asi
	.word 0xff1a0009  ! 3353: LDDF_R	ldd	[%r8, %r9], %f31
	.word 0xe25a2750  ! 3354: LDX_I	ldx	[%r8 + 0x0750], %r17
	.word 0x8d220009  ! 3355: MULScc_R	mulscc 	%r8, %r9, %r6
	.word 0xdf220009  ! 3357: STF_R	st	%f15, [%r9, %r8]
	.word 0xde720009  ! 3358: STX_R	stx	%r15, [%r8 + %r9]
	.word 0xc4120009  ! 3358: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xc3ea1009  ! 3359: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x8ad2204c  ! 3360: UMULcc_I	umulcc 	%r8, 0x004c, %r5
	.word 0x8e4a20f8  ! 3361: MULX_I	mulx 	%r8, 0x00f8, %r7
	.word 0xccba1009  ! 3362: STDA_R	stda	%r6, [%r8 + %r9] 0x80
	.word 0xc6ca1009  ! 3363: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r3
	.word 0xc4220009  ! 3365: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xfb020009  ! 3365: LDF_R	ld	[%r8, %r9], %f29
	.word 0xcea22b58  ! 3366: STWA_I	stwa	%r7, [%r8 + 0x0b58] %asi
	.word 0xa6722044  ! 3367: UDIV_I	udiv 	%r8, 0x0044, %r19
	.word 0x8ba20929  ! 3368: FMULs	fmuls	%f8, %f9, %f5
	.word 0xc65a0009  ! 3369: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0x40000001  ! 3370: CALL	call	disp30_1
	.word 0xc3ea1009  ! 3371: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xcea21009  ! 3372: STWA_R	stwa	%r7, [%r8 + %r9] 0x80
	.word 0xc64a0009  ! 3373: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xfeca2348  ! 3374: LDSBA_I	ldsba	[%r8, + 0x0348] %asi, %r31
	.word 0xf62a0009  ! 3376: STB_R	stb	%r27, [%r8 + %r9]
	.word 0xc81a0009  ! 3376: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x3c800002  ! 3377: BPOS	bpos,a	<label_0x2>
	.word 0x02800001  ! 3378: BE	be  	<label_0x1>
	.word 0x885a0009  ! 3379: SMUL_R	smul 	%r8, %r9, %r4
	.word 0x89220009  ! 3380: MULScc_R	mulscc 	%r8, %r9, %r4
	.word 0xdc720009  ! 3382: STX_R	stx	%r14, [%r8 + %r9]
	.word 0xe5020009  ! 3382: LDF_R	ld	[%r8, %r9], %f18
	.word 0xdb022ff0  ! 3383: LDF_I	ld	[%r8, 0x0ff0], %f13
	.word 0xd8f21009  ! 3384: STXA_R	stxa	%r12, [%r8 + %r9] 0x80
	.word 0xc71a2270  ! 3385: LDDF_I	ldd	[%r8, 0x0270], %f3
	.word 0xc8d22f30  ! 3386: LDSHA_I	ldsha	[%r8, + 0x0f30] %asi, %r4
	.word 0xdc921009  ! 3387: LDUHA_R	lduha	[%r8, %r9] 0x80, %r14
	.word 0xc2a22d8c  ! 3388: STWA_I	stwa	%r1, [%r8 + 0x0d8c] %asi
	.word 0xc5222070  ! 3389: STF_I	st	%f2, [0x0070, %r8]
	.word 0xb7a20829  ! 3390: FADDs	fadds	%f8, %f9, %f27
	.word 0x8143e021  ! 3391: MEMBAR	membar	#LoadLoad | #MemIssue 
	.word 0xcc420009  ! 3392: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xf2b21009  ! 3393: STHA_R	stha	%r25, [%r8 + %r9] 0x80
	.word 0x8a7a278c  ! 3394: SDIV_I	sdiv 	%r8, 0x078c, %r5
	.word 0xcc8a281c  ! 3395: LDUBA_I	lduba	[%r8, + 0x081c] %asi, %r6
	.word 0x32800002  ! 3396: BNE	bne,a	<label_0x2>
	.word 0xc62a0009  ! 3398: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xce120009  ! 3398: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0x887a0009  ! 3399: SDIV_R	sdiv 	%r8, %r9, %r4
	.word 0xc36a0009  ! 3400: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xcab21009  ! 3401: STHA_R	stha	%r5, [%r8 + %r9] 0x80
	.word 0x40000002  ! 3402: CALL	call	disp30_2
	.word 0x8fa208a9  ! 3403: FSUBs	fsubs	%f8, %f9, %f7
	.word 0xca7a259c  ! 3404: SWAP_I	swap	%r5, [%r8 + 0x059c]
	.word 0x8143c000  ! 3405: STBAR	stbar
	.word 0xc73a20b0  ! 3406: STDF_I	std	%f3, [0x00b0, %r8]
	.word 0xca4a2020  ! 3407: LDSB_I	ldsb	[%r8 + 0x0020], %r5
	.word 0x9ba208a9  ! 3408: FSUBs	fsubs	%f8, %f9, %f13
	.word 0xda320009  ! 3410: STH_R	sth	%r13, [%r8 + %r9]
	.word 0xcc420009  ! 3410: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xc33a0009  ! 3412: STDF_R	std	%f1, [%r9, %r8]
	.word 0xf4720009  ! 3413: STX_R	stx	%r26, [%r8 + %r9]
	.word 0xc64a0009  ! 3413: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0x8143e074  ! 3414: MEMBAR	membar	#LoadStore | #Lookaside | #MemIssue | #Sync 
	.word 0xfc220009  ! 3416: STW_R	stw	%r30, [%r8 + %r9]
	.word 0xf80a0009  ! 3416: LDUB_R	ldub	[%r8 + %r9], %r28
	.word 0x18800002  ! 3417: BGU	bgu  	<label_0x2>
	.word 0xd7222614  ! 3418: STF_I	st	%f11, [0x0614, %r8]
	.word 0x8143c000  ! 3419: STBAR	stbar
	.word 0x8143e071  ! 3420: MEMBAR	membar	#LoadLoad | #Lookaside | #MemIssue | #Sync 
	.word 0xc5022e5c  ! 3421: LDF_I	ld	[%r8, 0x0e5c], %f2
	.word 0xea7a0009  ! 3422: SWAP_R	swap	%r21, [%r8 + %r9]
	.word 0x8cd20009  ! 3423: UMULcc_R	umulcc 	%r8, %r9, %r6
	.word 0xb44a0009  ! 3424: MULX_R	mulx 	%r8, %r9, %r26
	.word 0x8252226c  ! 3425: UMUL_I	umul 	%r8, 0x026c, %r1
	.word 0xc36a25b4  ! 3426: PREFETCH_I	prefetch	[%r8 + 0x05b4], #one_read
	.word 0xf6ea2e7c  ! 3427: LDSTUBA_I	ldstuba	%r27, [%r8 + 0x0e7c] %asi
	.word 0xcc9a2ce0  ! 3428: LDDA_I	ldda	[%r8, + 0x0ce0] %asi, %r6
	.word 0xe01223c0  ! 3429: LDUH_I	lduh	[%r8 + 0x03c0], %r16
	.word 0xc2320009  ! 3431: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xdb020009  ! 3431: LDF_R	ld	[%r8, %r9], %f13
	.word 0xc6520009  ! 3432: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0x8143e07e  ! 3433: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xca320009  ! 3435: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xe8020009  ! 3435: LDUW_R	lduw	[%r8 + %r9], %r20
	.word 0x1e800001  ! 3436: BVC	bvc  	<label_0x1>
	.word 0x40000001  ! 3437: CALL	call	disp30_1
	.word 0xce220009  ! 3439: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xf41a0009  ! 3439: LDD_R	ldd	[%r8 + %r9], %r26
	.word 0xfcba1009  ! 3440: STDA_R	stda	%r30, [%r8 + %r9] 0x80
	.word 0xce320009  ! 3442: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xe41a0009  ! 3442: LDD_R	ldd	[%r8 + %r9], %r18
	.word 0xc8ea1009  ! 3443: LDSTUBA_R	ldstuba	%r4, [%r8 + %r9] 0x80
	.word 0xc2aa27ec  ! 3444: STBA_I	stba	%r1, [%r8 + 0x07ec] %asi
	.word 0xc3ea2950  ! 3445: PREFETCHA_I	prefetcha	[%r8, + 0x0950] %asi, #one_read
	.word 0xc40a23b4  ! 3446: LDUB_I	ldub	[%r8 + 0x03b4], %r2
	.word 0x82fa2edc  ! 3447: SDIVcc_I	sdivcc 	%r8, 0x0edc, %r1
	.word 0xcad22e80  ! 3448: LDSHA_I	ldsha	[%r8, + 0x0e80] %asi, %r5
	.word 0xc3ea2814  ! 3449: PREFETCHA_I	prefetcha	[%r8, + 0x0814] %asi, #one_read
	.word 0xc36a2f58  ! 3450: PREFETCH_I	prefetch	[%r8 + 0x0f58], #one_read
	.word 0xe40a2248  ! 3451: LDUB_I	ldub	[%r8 + 0x0248], %r18
	.word 0xe1220009  ! 3453: STF_R	st	%f16, [%r9, %r8]
	.word 0xcc720009  ! 3454: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc65a0009  ! 3454: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0x10800002  ! 3455: BA	ba  	<label_0x2>
	.word 0xca7a2e08  ! 3456: SWAP_I	swap	%r5, [%r8 + 0x0e08]
	.word 0xc36a2c08  ! 3457: PREFETCH_I	prefetch	[%r8 + 0x0c08], #one_read
	.word 0x8ba208a9  ! 3458: FSUBs	fsubs	%f8, %f9, %f5
	.word 0xf5222694  ! 3459: STF_I	st	%f26, [0x0694, %r8]
	.word 0x8143c000  ! 3460: STBAR	stbar
	.word 0xc27a2958  ! 3461: SWAP_I	swap	%r1, [%r8 + 0x0958]
	.word 0xc8022eec  ! 3462: LDUW_I	lduw	[%r8 + 0x0eec], %r4
	.word 0x84d20009  ! 3463: UMULcc_R	umulcc 	%r8, %r9, %r2
	.word 0x8143c000  ! 3464: STBAR	stbar
	.word 0x26c20001  ! 3465: BRLZ	brlz,a,nt	%8,<label_0x20001>
	.word 0x8143c000  ! 3466: STBAR	stbar
	.word 0xda6a247c  ! 3467: LDSTUB_I	ldstub	%r13, [%r8 + 0x047c]
	.word 0xc82a0009  ! 3469: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc4420009  ! 3469: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xce320009  ! 3471: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xf44a0009  ! 3471: LDSB_R	ldsb	[%r8 + %r9], %r26
	.word 0x89a208a9  ! 3472: FSUBs	fsubs	%f8, %f9, %f4
	.word 0xc26a2e14  ! 3473: LDSTUB_I	ldstub	%r1, [%r8 + 0x0e14]
	.word 0x82d20009  ! 3474: UMULcc_R	umulcc 	%r8, %r9, %r1
	.word 0xebe22009  ! 3475: CASA_R	casa	[%r8] %asi, %r9, %r21
	.word 0x8143c000  ! 3476: STBAR	stbar
	.word 0xcc8a1009  ! 3477: LDUBA_R	lduba	[%r8, %r9] 0x80, %r6
	.word 0xc8720009  ! 3479: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xca520009  ! 3479: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xc2f21009  ! 3480: STXA_R	stxa	%r1, [%r8 + %r9] 0x80
	.word 0x00800001  ! 3481: BN	bn  	<label_0x1>
	.word 0x8a5a0009  ! 3482: SMUL_R	smul 	%r8, %r9, %r5
	.word 0xc3e22009  ! 3483: CASA_R	casa	[%r8] %asi, %r9, %r1
	.word 0x83220009  ! 3484: MULScc_R	mulscc 	%r8, %r9, %r1
	.word 0xc5020009  ! 3485: LDF_R	ld	[%r8, %r9], %f2
	.word 0x87a209a9  ! 3486: FDIVs	fdivs	%f8, %f9, %f3
	.word 0x8143c000  ! 3487: STBAR	stbar
	.word 0xc2220009  ! 3489: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc51a0009  ! 3489: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xc8320009  ! 3491: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc51a0009  ! 3491: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0x40000002  ! 3492: CALL	call	disp30_2
	.word 0xcaa21009  ! 3493: STWA_R	stwa	%r5, [%r8 + %r9] 0x80
	.word 0xc36a0009  ! 3494: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0x2c800001  ! 3495: BNEG	bneg,a	<label_0x1>
	.word 0x06c20001  ! 3496: BRLZ	brlz  ,nt	%8,<label_0x20001>
	.word 0xe32229fc  ! 3497: STF_I	st	%f17, [0x09fc, %r8]
	.word 0xf0aa25cc  ! 3498: STBA_I	stba	%r24, [%r8 + 0x05cc] %asi
	.word 0xc3ea1009  ! 3499: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc6aa2954  ! 3500: STBA_I	stba	%r3, [%r8 + 0x0954] %asi
	.word 0xcde21009  ! 3501: CASA_I	casa	[%r8] 0x80, %r9, %r6
	.word 0xa24a0009  ! 3502: MULX_R	mulx 	%r8, %r9, %r17
	.word 0xecd22588  ! 3503: LDSHA_I	ldsha	[%r8, + 0x0588] %asi, %r22
	.word 0x82da0009  ! 3504: SMULcc_R	smulcc 	%r8, %r9, %r1
	.word 0xe1f21009  ! 3505: CASXA_I	casxa	[%r8] 0x80, %r9, %r16
	.word 0x06800001  ! 3506: BL	bl  	<label_0x1>
	.word 0x8143c000  ! 3507: STBAR	stbar
	.word 0xec122b18  ! 3508: LDUH_I	lduh	[%r8 + 0x0b18], %r22
	.word 0xec2a0009  ! 3510: STB_R	stb	%r22, [%r8 + %r9]
	.word 0xc40a0009  ! 3510: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0x82520009  ! 3511: UMUL_R	umul 	%r8, %r9, %r1
	.word 0x8143c000  ! 3512: STBAR	stbar
	.word 0xc4420009  ! 3513: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xe73a0009  ! 3515: STDF_R	std	%f19, [%r9, %r8]
	.word 0xf8720009  ! 3516: STX_R	stx	%r28, [%r8 + %r9]
	.word 0xca020009  ! 3516: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0x82fa2314  ! 3517: SDIVcc_I	sdivcc 	%r8, 0x0314, %r1
	.word 0x86520009  ! 3518: UMUL_R	umul 	%r8, %r9, %r3
	.word 0xc8fa1009  ! 3519: SWAPA_R	swapa	%r4, [%r8 + %r9] 0x80
	.word 0xc6821009  ! 3520: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r3
	.word 0xc73a0009  ! 3522: STDF_R	std	%f3, [%r9, %r8]
	.word 0xe8720009  ! 3523: STX_R	stx	%r20, [%r8 + %r9]
	.word 0xe2020009  ! 3523: LDUW_R	lduw	[%r8 + %r9], %r17
	.word 0xf3220009  ! 3525: STF_R	st	%f25, [%r9, %r8]
	.word 0xe2720009  ! 3526: STX_R	stx	%r17, [%r8 + %r9]
	.word 0xcc020009  ! 3526: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xc9222a88  ! 3527: STF_I	st	%f4, [0x0a88, %r8]
	.word 0xcc220009  ! 3529: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc20a0009  ! 3529: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xc6b21009  ! 3530: STHA_R	stha	%r3, [%r8 + %r9] 0x80
	.word 0x8143e07d  ! 3531: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xe42a0009  ! 3533: STB_R	stb	%r18, [%r8 + %r9]
	.word 0xe24a0009  ! 3533: LDSB_R	ldsb	[%r8 + %r9], %r17
	.word 0x12800001  ! 3534: BNE	bne  	<label_0x1>
	.word 0xc3ea1009  ! 3535: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xba6a0009  ! 3536: UDIVX_R	udivx 	%r8, %r9, %r29
	.word 0xccaa1009  ! 3537: STBA_R	stba	%r6, [%r8 + %r9] 0x80
	.word 0xca320009  ! 3539: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc8520009  ! 3539: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xaa7a2dac  ! 3540: SDIV_I	sdiv 	%r8, 0x0dac, %r21
	.word 0x8143e046  ! 3541: MEMBAR	membar	#StoreLoad | #LoadStore | #Sync 
	.word 0xfe320009  ! 3543: STH_R	sth	%r31, [%r8 + %r9]
	.word 0xc01a0009  ! 3543: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0x9a5224ec  ! 3544: UMUL_I	umul 	%r8, 0x04ec, %r13
	.word 0xcaaa1009  ! 3545: STBA_R	stba	%r5, [%r8 + %r9] 0x80
	.word 0xa8d20009  ! 3546: UMULcc_R	umulcc 	%r8, %r9, %r20
	.word 0x22800001  ! 3547: BE	be,a	<label_0x1>
	.word 0x34800001  ! 3548: BG	bg,a	<label_0x1>
	.word 0xcf222788  ! 3549: STF_I	st	%f7, [0x0788, %r8]
	.word 0xb56a0009  ! 3550: SDIVX_R	sdivx	%r8, %r9, %r26
	.word 0xceda1009  ! 3551: LDXA_R	ldxa	[%r8, %r9] 0x80, %r7
	.word 0xc3ea1009  ! 3552: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xd82a0009  ! 3554: STB_R	stb	%r12, [%r8 + %r9]
	.word 0xf7020009  ! 3554: LDF_R	ld	[%r8, %r9], %f27
	.word 0xf6ea1009  ! 3555: LDSTUBA_R	ldstuba	%r27, [%r8 + %r9] 0x80
	.word 0x8e7229f8  ! 3556: UDIV_I	udiv 	%r8, 0x09f8, %r7
	.word 0x8fa20829  ! 3557: FADDs	fadds	%f8, %f9, %f7
	.word 0xc26a2b30  ! 3558: LDSTUB_I	ldstub	%r1, [%r8 + 0x0b30]
	.word 0xc36a228c  ! 3559: PREFETCH_I	prefetch	[%r8 + 0x028c], #one_read
	.word 0x86fa0009  ! 3560: SDIVcc_R	sdivcc 	%r8, %r9, %r3
	.word 0xc5020009  ! 3561: LDF_R	ld	[%r8, %r9], %f2
	.word 0xa24a274c  ! 3562: MULX_I	mulx 	%r8, 0x074c, %r17
	.word 0xe6320009  ! 3564: STH_R	sth	%r19, [%r8 + %r9]
	.word 0xc91a0009  ! 3564: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xcbf22009  ! 3565: CASXA_R	casxa	[%r8]%asi, %r9, %r5
	.word 0x866a0009  ! 3566: UDIVX_R	udivx 	%r8, %r9, %r3
	.word 0xc2422dc8  ! 3567: LDSW_I	ldsw	[%r8 + 0x0dc8], %r1
	.word 0xc2fa2e04  ! 3568: SWAPA_I	swapa	%r1, [%r8 + 0x0e04] %asi
	.word 0xc4220009  ! 3570: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xe80a0009  ! 3570: LDUB_R	ldub	[%r8 + %r9], %r20
	.word 0xb56a2ba0  ! 3571: SDIVX_I	sdivx	%r8, 0x0ba0, %r26
	.word 0xc5220009  ! 3573: STF_R	st	%f2, [%r9, %r8]
	.word 0xec720009  ! 3574: STX_R	stx	%r22, [%r8 + %r9]
	.word 0xda120009  ! 3574: LDUH_R	lduh	[%r8 + %r9], %r13
	.word 0xcd3a2e40  ! 3575: STDF_I	std	%f6, [0x0e40, %r8]
	.word 0x8143e031  ! 3576: MEMBAR	membar	#LoadLoad | #Lookaside | #MemIssue 
	.word 0x88d227bc  ! 3577: UMULcc_I	umulcc 	%r8, 0x07bc, %r4
	.word 0xeac21009  ! 3578: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r21
	.word 0x8cf227e8  ! 3579: UDIVcc_I	udivcc 	%r8, 0x07e8, %r6
	.word 0xcc220009  ! 3581: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xf4120009  ! 3581: LDUH_R	lduh	[%r8 + %r9], %r26
	.word 0xe6320009  ! 3583: STH_R	sth	%r19, [%r8 + %r9]
	.word 0xee520009  ! 3583: LDSH_R	ldsh	[%r8 + %r9], %r23
	.word 0xecea1009  ! 3584: LDSTUBA_R	ldstuba	%r22, [%r8 + %r9] 0x80
	.word 0x12800001  ! 3585: BNE	bne  	<label_0x1>
	.word 0xc36a2ad0  ! 3586: PREFETCH_I	prefetch	[%r8 + 0x0ad0], #one_read
	.word 0xc93a0009  ! 3588: STDF_R	std	%f4, [%r9, %r8]
	.word 0xf4720009  ! 3589: STX_R	stx	%r26, [%r8 + %r9]
	.word 0xca520009  ! 3589: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0x824a0009  ! 3590: MULX_R	mulx 	%r8, %r9, %r1
	.word 0x8143c000  ! 3591: STBAR	stbar
	.word 0xc69229b8  ! 3592: LDUHA_I	lduha	[%r8, + 0x09b8] %asi, %r3
	.word 0x8143e05b  ! 3593: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Lookaside | #Sync 
	.word 0x8143e073  ! 3594: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside | #MemIssue | #Sync 
	.word 0x8143e076  ! 3595: MEMBAR	membar	#StoreLoad | #LoadStore | #Lookaside | #MemIssue | #Sync 
	.word 0x8143e01a  ! 3596: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside 
	.word 0xcde22009  ! 3597: CASA_R	casa	[%r8] %asi, %r9, %r6
	.word 0xe65a2e38  ! 3598: LDX_I	ldx	[%r8 + 0x0e38], %r19
	.word 0xc53a2e38  ! 3599: STDF_I	std	%f2, [0x0e38, %r8]
	.word 0xe4020009  ! 3600: LDUW_R	lduw	[%r8 + %r9], %r18
	.word 0xe6220009  ! 3602: STW_R	stw	%r19, [%r8 + %r9]
	.word 0xdf020009  ! 3602: LDF_R	ld	[%r8, %r9], %f15
	.word 0xde320009  ! 3604: STH_R	sth	%r15, [%r8 + %r9]
	.word 0xc2520009  ! 3604: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xce320009  ! 3606: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xec1a0009  ! 3606: LDD_R	ldd	[%r8 + %r9], %r22
	.word 0xd8ea1009  ! 3607: LDSTUBA_R	ldstuba	%r12, [%r8 + %r9] 0x80
	.word 0xc6da1009  ! 3608: LDXA_R	ldxa	[%r8, %r9] 0x80, %r3
	.word 0x8c520009  ! 3609: UMUL_R	umul 	%r8, %r9, %r6
	.word 0x8143c000  ! 3610: STBAR	stbar
	.word 0x865a0009  ! 3611: SMUL_R	smul 	%r8, %r9, %r3
	.word 0xc802273c  ! 3612: LDUW_I	lduw	[%r8 + 0x073c], %r4
	.word 0xc7220009  ! 3614: STF_R	st	%f3, [%r9, %r8]
	.word 0xcc720009  ! 3615: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc44a0009  ! 3615: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xcf3a21e8  ! 3616: STDF_I	std	%f7, [0x01e8, %r8]
	.word 0xe0ba1009  ! 3617: STDA_R	stda	%r16, [%r8 + %r9] 0x80
	.word 0xc22a0009  ! 3619: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc6020009  ! 3619: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xc36a22c4  ! 3620: PREFETCH_I	prefetch	[%r8 + 0x02c4], #one_read
	.word 0xa9a20929  ! 3621: FMULs	fmuls	%f8, %f9, %f20
	.word 0x8d6a0009  ! 3622: SDIVX_R	sdivx	%r8, %r9, %r6
	.word 0xc36a0009  ! 3623: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xcc4228e4  ! 3624: LDSW_I	ldsw	[%r8 + 0x08e4], %r6
	.word 0xfb3a2c38  ! 3625: STDF_I	std	%f29, [0x0c38, %r8]
	.word 0xc3ea1009  ! 3626: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x8143c000  ! 3627: STBAR	stbar
	.word 0xc3ea2b3c  ! 3628: PREFETCHA_I	prefetcha	[%r8, + 0x0b3c] %asi, #one_read
	.word 0xc2aa2ffc  ! 3629: STBA_I	stba	%r1, [%r8 + 0x0ffc] %asi
	.word 0xc7222ad0  ! 3630: STF_I	st	%f3, [0x0ad0, %r8]
	.word 0x40000002  ! 3631: CALL	call	disp30_2
	.word 0x0cc20001  ! 3632: BRGZ	brgz  ,nt	%8,<label_0x20001>
	.word 0x8143c000  ! 3633: STBAR	stbar
	.word 0xc53a2bb0  ! 3634: STDF_I	std	%f2, [0x0bb0, %r8]
	.word 0x04800001  ! 3635: BLE	ble  	<label_0x1>
	.word 0x14800001  ! 3636: BG	bg  	<label_0x1>
	.word 0xe81a2498  ! 3637: LDD_I	ldd	[%r8 + 0x0498], %r20
	.word 0xf8ba1009  ! 3638: STDA_R	stda	%r28, [%r8 + %r9] 0x80
	.word 0xe6220009  ! 3640: STW_R	stw	%r19, [%r8 + %r9]
	.word 0xc44a0009  ! 3640: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0x3a800002  ! 3641: BCC	bcc,a	<label_0x2>
	.word 0xc4b22588  ! 3642: STHA_I	stha	%r2, [%r8 + 0x0588] %asi
	.word 0xcde21009  ! 3643: CASA_I	casa	[%r8] 0x80, %r9, %r6
	.word 0xbeda2490  ! 3644: SMULcc_I	smulcc 	%r8, 0x0490, %r31
	.word 0xc36a2a44  ! 3645: PREFETCH_I	prefetch	[%r8 + 0x0a44], #one_read
	.word 0xf89a2160  ! 3646: LDDA_I	ldda	[%r8, + 0x0160] %asi, %r28
	.word 0xc5e22009  ! 3647: CASA_R	casa	[%r8] %asi, %r9, %r2
	.word 0xcc2a0009  ! 3649: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc5020009  ! 3649: LDF_R	ld	[%r8, %r9], %f2
	.word 0x8143c000  ! 3650: STBAR	stbar
	.word 0xc4b22f78  ! 3651: STHA_I	stha	%r2, [%r8 + 0x0f78] %asi
	.word 0xe2aa2d9c  ! 3652: STBA_I	stba	%r17, [%r8 + 0x0d9c] %asi
	.word 0xe4fa2530  ! 3653: SWAPA_I	swapa	%r18, [%r8 + 0x0530] %asi
	.word 0xcafa1009  ! 3654: SWAPA_R	swapa	%r5, [%r8 + %r9] 0x80
	.word 0xc4120009  ! 3655: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xc6320009  ! 3657: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc71a0009  ! 3657: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0x96da0009  ! 3658: SMULcc_R	smulcc 	%r8, %r9, %r11
	.word 0xfa821009  ! 3659: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r29
	.word 0xc4f22560  ! 3660: STXA_I	stxa	%r2, [%r8 + 0x0560] %asi
	.word 0xcaf22cf0  ! 3661: STXA_I	stxa	%r5, [%r8 + 0x0cf0] %asi
	.word 0xc3ea2770  ! 3662: PREFETCHA_I	prefetcha	[%r8, + 0x0770] %asi, #one_read
	.word 0xceea1009  ! 3663: LDSTUBA_R	ldstuba	%r7, [%r8 + %r9] 0x80
	.word 0xcc120009  ! 3664: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xeada1009  ! 3665: LDXA_R	ldxa	[%r8, %r9] 0x80, %r21
	.word 0xb36a2a60  ! 3666: SDIVX_I	sdivx	%r8, 0x0a60, %r25
	.word 0xde220009  ! 3668: STW_R	stw	%r15, [%r8 + %r9]
	.word 0xf71a0009  ! 3668: LDDF_R	ldd	[%r8, %r9], %f27
	.word 0xfe220009  ! 3670: STW_R	stw	%r31, [%r8 + %r9]
	.word 0xcf1a0009  ! 3670: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xfe922b98  ! 3671: LDUHA_I	lduha	[%r8, + 0x0b98] %asi, %r31
	.word 0xca5228b8  ! 3672: LDSH_I	ldsh	[%r8 + 0x08b8], %r5
	.word 0xb85a250c  ! 3673: SMUL_I	smul 	%r8, 0x050c, %r28
	.word 0x8143c000  ! 3674: STBAR	stbar
	.word 0x8a4a0009  ! 3675: MULX_R	mulx 	%r8, %r9, %r5
	.word 0xc8320009  ! 3677: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc4120009  ! 3677: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0x02c20001  ! 3678: BRZ	brz  ,nt	%8,<label_0x20001>
	.word 0x8143e067  ! 3679: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #MemIssue | #Sync 
	.word 0x8afa294c  ! 3680: SDIVcc_I	sdivcc 	%r8, 0x094c, %r5
	.word 0x864a2a30  ! 3681: MULX_I	mulx 	%r8, 0x0a30, %r3
	.word 0xf82a0009  ! 3683: STB_R	stb	%r28, [%r8 + %r9]
	.word 0xee120009  ! 3683: LDUH_R	lduh	[%r8 + %r9], %r23
	.word 0xc6ea2860  ! 3684: LDSTUBA_I	ldstuba	%r3, [%r8 + 0x0860] %asi
	.word 0xb5a20829  ! 3685: FADDs	fadds	%f8, %f9, %f26
	.word 0x9e7a0009  ! 3686: SDIV_R	sdiv 	%r8, %r9, %r15
	.word 0x856a0009  ! 3687: SDIVX_R	sdivx	%r8, %r9, %r2
	.word 0x30800001  ! 3688: BA	ba,a	<label_0x1>
	.word 0x8143c000  ! 3689: STBAR	stbar
	.word 0xcef228a0  ! 3690: STXA_I	stxa	%r7, [%r8 + 0x08a0] %asi
	.word 0x40000001  ! 3691: CALL	call	disp30_1
	.word 0xca320009  ! 3693: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xce520009  ! 3693: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xce220009  ! 3695: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xe9020009  ! 3695: LDF_R	ld	[%r8, %r9], %f20
	.word 0xc4d21009  ! 3696: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r2
	.word 0x885226dc  ! 3697: UMUL_I	umul 	%r8, 0x06dc, %r4
	.word 0xcb220009  ! 3699: STF_R	st	%f5, [%r9, %r8]
	.word 0xec720009  ! 3700: STX_R	stx	%r22, [%r8 + %r9]
	.word 0xce4a0009  ! 3700: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xc3ea2b6c  ! 3701: PREFETCHA_I	prefetcha	[%r8, + 0x0b6c] %asi, #one_read
	.word 0xc3ea2aa0  ! 3702: PREFETCHA_I	prefetcha	[%r8, + 0x0aa0] %asi, #one_read
	.word 0x8143e058  ! 3703: MEMBAR	membar	#StoreStore | #Lookaside | #Sync 
	.word 0xecd22320  ! 3704: LDSHA_I	ldsha	[%r8, + 0x0320] %asi, %r22
	.word 0xc2320009  ! 3706: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xcd1a0009  ! 3706: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xc88a2b20  ! 3707: LDUBA_I	lduba	[%r8, + 0x0b20] %asi, %r4
	.word 0x0ac20001  ! 3708: BRNZ	brnz  ,nt	%8,<label_0x20001>
	.word 0xd8320009  ! 3710: STH_R	sth	%r12, [%r8 + %r9]
	.word 0xf04a0009  ! 3710: LDSB_R	ldsb	[%r8 + %r9], %r24
	.word 0x884a0009  ! 3711: MULX_R	mulx 	%r8, %r9, %r4
	.word 0x8143e069  ! 3712: MEMBAR	membar	#LoadLoad | #StoreStore | #MemIssue | #Sync 
	.word 0x8143e067  ! 3713: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #MemIssue | #Sync 
	.word 0x8e720009  ! 3714: UDIV_R	udiv 	%r8, %r9, %r7
	.word 0xbba208a9  ! 3715: FSUBs	fsubs	%f8, %f9, %f29
	.word 0xd64a0009  ! 3716: LDSB_R	ldsb	[%r8 + %r9], %r11
	.word 0xcc220009  ! 3718: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xcc5a0009  ! 3718: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0x12800001  ! 3719: BNE	bne  	<label_0x1>
	.word 0xcaaa21ac  ! 3720: STBA_I	stba	%r5, [%r8 + 0x01ac] %asi
	.word 0xc6220009  ! 3722: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc51a0009  ! 3722: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xc6220009  ! 3724: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xcc1a0009  ! 3724: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xc87a0009  ! 3725: SWAP_R	swap	%r4, [%r8 + %r9]
	.word 0x846a0009  ! 3726: UDIVX_R	udivx 	%r8, %r9, %r2
	.word 0xc4ba1009  ! 3727: STDA_R	stda	%r2, [%r8 + %r9] 0x80
	.word 0x16800002  ! 3728: BGE	bge  	<label_0x2>
	.word 0xc2220009  ! 3730: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc2520009  ! 3730: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xc6b22118  ! 3731: STHA_I	stha	%r3, [%r8 + 0x0118] %asi
	.word 0xc36a0009  ! 3732: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xff3a2c10  ! 3733: STDF_I	std	%f31, [0x0c10, %r8]
	.word 0x84da2088  ! 3734: SMULcc_I	smulcc 	%r8, 0x0088, %r2
	.word 0xc49a2bd0  ! 3735: LDDA_I	ldda	[%r8, + 0x0bd0] %asi, %r2
	.word 0xaef22f0c  ! 3736: UDIVcc_I	udivcc 	%r8, 0x0f0c, %r23
	.word 0x8143e005  ! 3737: MEMBAR	membar	#LoadLoad | #LoadStore 
	.word 0xbe6a2458  ! 3738: UDIVX_I	udivx 	%r8, 0x0458, %r31
	.word 0x8afa0009  ! 3739: SDIVcc_R	sdivcc 	%r8, %r9, %r5
	.word 0xc31a0009  ! 3740: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0x8fa209a9  ! 3741: FDIVs	fdivs	%f8, %f9, %f7
	.word 0x00800001  ! 3742: BN	bn  	<label_0x1>
	.word 0xc33a0009  ! 3744: STDF_R	std	%f1, [%r9, %r8]
	.word 0xe8720009  ! 3745: STX_R	stx	%r20, [%r8 + %r9]
	.word 0xc6520009  ! 3745: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0x8143c000  ! 3746: STBAR	stbar
	.word 0x85a20929  ! 3747: FMULs	fmuls	%f8, %f9, %f2
	.word 0xcb1a0009  ! 3748: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xf7f22009  ! 3749: CASXA_R	casxa	[%r8]%asi, %r9, %r27
	.word 0x8143c000  ! 3750: STBAR	stbar
	.word 0x26800002  ! 3751: BL	bl,a	<label_0x2>
	.word 0xcd3a2c38  ! 3752: STDF_I	std	%f6, [0x0c38, %r8]
	.word 0xc33a0009  ! 3754: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc4720009  ! 3755: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xcd1a0009  ! 3755: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0x8143c000  ! 3756: STBAR	stbar
	.word 0xfa8a1009  ! 3757: LDUBA_R	lduba	[%r8, %r9] 0x80, %r29
	.word 0xc6ea2b8c  ! 3758: LDSTUBA_I	ldstuba	%r3, [%r8 + 0x0b8c] %asi
	.word 0xc3ea2708  ! 3759: PREFETCHA_I	prefetcha	[%r8, + 0x0708] %asi, #one_read
	.word 0xed222708  ! 3760: STF_I	st	%f22, [0x0708, %r8]
	.word 0xc4d22704  ! 3761: LDSHA_I	ldsha	[%r8, + 0x0704] %asi, %r2
	.word 0xc25a2260  ! 3762: LDX_I	ldx	[%r8 + 0x0260], %r1
	.word 0xa2520009  ! 3763: UMUL_R	umul 	%r8, %r9, %r17
	.word 0xeeaa1009  ! 3764: STBA_R	stba	%r23, [%r8 + %r9] 0x80
	.word 0xc89a2670  ! 3765: LDDA_I	ldda	[%r8, + 0x0670] %asi, %r4
	.word 0xc36a0009  ! 3766: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0x83a20829  ! 3767: FADDs	fadds	%f8, %f9, %f1
	.word 0x88fa2540  ! 3768: SDIVcc_I	sdivcc 	%r8, 0x0540, %r4
	.word 0x884a0009  ! 3769: MULX_R	mulx 	%r8, %r9, %r4
	.word 0xaa5a270c  ! 3770: SMUL_I	smul 	%r8, 0x070c, %r21
	.word 0x8afa0009  ! 3771: SDIVcc_R	sdivcc 	%r8, %r9, %r5
	.word 0xda320009  ! 3773: STH_R	sth	%r13, [%r8 + %r9]
	.word 0xe9020009  ! 3773: LDF_R	ld	[%r8, %r9], %f20
	.word 0x38800001  ! 3774: BGU	bgu,a	<label_0x1>
	.word 0xc3ea1009  ! 3775: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x04800001  ! 3776: BLE	ble  	<label_0x1>
	.word 0xcc8a2868  ! 3777: LDUBA_I	lduba	[%r8, + 0x0868] %asi, %r6
	.word 0x8143c000  ! 3778: STBAR	stbar
	.word 0xf922267c  ! 3779: STF_I	st	%f28, [0x067c, %r8]
	.word 0x00800002  ! 3780: BN	bn  	<label_0x2>
	.word 0xccca2670  ! 3781: LDSBA_I	ldsba	[%r8, + 0x0670] %asi, %r6
	.word 0x06800001  ! 3782: BL	bl  	<label_0x1>
	.word 0xff220009  ! 3784: STF_R	st	%f31, [%r9, %r8]
	.word 0xce720009  ! 3785: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xea020009  ! 3785: LDUW_R	lduw	[%r8 + %r9], %r21
	.word 0xa8d20009  ! 3786: UMULcc_R	umulcc 	%r8, %r9, %r20
	.word 0xca220009  ! 3788: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xdc020009  ! 3788: LDUW_R	lduw	[%r8 + %r9], %r14
	.word 0xc2c22304  ! 3789: LDSWA_I	ldswa	[%r8, + 0x0304] %asi, %r1
	.word 0xf2220009  ! 3791: STW_R	stw	%r25, [%r8 + %r9]
	.word 0xf4420009  ! 3791: LDSW_R	ldsw	[%r8 + %r9], %r26
	.word 0x976a29b8  ! 3792: SDIVX_I	sdivx	%r8, 0x09b8, %r11
	.word 0xb06a0009  ! 3793: UDIVX_R	udivx 	%r8, %r9, %r24
	.word 0xc36a2718  ! 3794: PREFETCH_I	prefetch	[%r8 + 0x0718], #one_read
	.word 0xab6a0009  ! 3795: SDIVX_R	sdivx	%r8, %r9, %r21
	.word 0x8143c000  ! 3796: STBAR	stbar
	.word 0x9a7a0009  ! 3797: SDIV_R	sdiv 	%r8, %r9, %r13
	.word 0xc8ba1009  ! 3798: STDA_R	stda	%r4, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 3799: STBAR	stbar
	.word 0xc8ea2618  ! 3800: LDSTUBA_I	ldstuba	%r4, [%r8 + 0x0618] %asi
	.word 0xcc8a2128  ! 3801: LDUBA_I	lduba	[%r8, + 0x0128] %asi, %r6
	.word 0xc6da2c40  ! 3802: LDXA_I	ldxa	[%r8, + 0x0c40] %asi, %r3
	.word 0xc36a2c58  ! 3803: PREFETCH_I	prefetch	[%r8 + 0x0c58], #one_read
	.word 0xc60a2b38  ! 3804: LDUB_I	ldub	[%r8 + 0x0b38], %r3
	.word 0xbfa20929  ! 3805: FMULs	fmuls	%f8, %f9, %f31
	.word 0xc2ea29f4  ! 3806: LDSTUBA_I	ldstuba	%r1, [%r8 + 0x09f4] %asi
	.word 0xfc6a2874  ! 3807: LDSTUB_I	ldstub	%r30, [%r8 + 0x0874]
	.word 0xc3ea1009  ! 3808: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xca4a2df4  ! 3809: LDSB_I	ldsb	[%r8 + 0x0df4], %r5
	.word 0xc4f22ab8  ! 3810: STXA_I	stxa	%r2, [%r8 + 0x0ab8] %asi
	.word 0xc6da1009  ! 3811: LDXA_R	ldxa	[%r8, %r9] 0x80, %r3
	.word 0xb06a2194  ! 3812: UDIVX_I	udivx 	%r8, 0x0194, %r24
	.word 0xd88a1009  ! 3813: LDUBA_R	lduba	[%r8, %r9] 0x80, %r12
	.word 0xf7222c40  ! 3814: STF_I	st	%f27, [0x0c40, %r8]
	.word 0xf2220009  ! 3816: STW_R	stw	%r25, [%r8 + %r9]
	.word 0xc2020009  ! 3816: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0x1a800001  ! 3817: BCC	bcc  	<label_0x1>
	.word 0xcc1a2858  ! 3818: LDD_I	ldd	[%r8 + 0x0858], %r6
	.word 0xd8b21009  ! 3819: STHA_R	stha	%r12, [%r8 + %r9] 0x80
	.word 0x8af2287c  ! 3820: UDIVcc_I	udivcc 	%r8, 0x087c, %r5
	.word 0xc2b22f1c  ! 3821: STHA_I	stha	%r1, [%r8 + 0x0f1c] %asi
	.word 0x14800002  ! 3822: BG	bg  	<label_0x2>
	.word 0xc53a0009  ! 3824: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc8720009  ! 3825: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xe25a0009  ! 3825: LDX_R	ldx	[%r8 + %r9], %r17
	.word 0x87a208a9  ! 3826: FSUBs	fsubs	%f8, %f9, %f3
	.word 0xc64a0009  ! 3827: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xc3ea1009  ! 3828: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x85a208a9  ! 3829: FSUBs	fsubs	%f8, %f9, %f2
	.word 0xf8aa2ac8  ! 3830: STBA_I	stba	%r28, [%r8 + 0x0ac8] %asi
	.word 0x8143e03e  ! 3831: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0xc4122cb8  ! 3832: LDUH_I	lduh	[%r8 + 0x0cb8], %r2
	.word 0x8a5a0009  ! 3833: SMUL_R	smul 	%r8, %r9, %r5
	.word 0xc6220009  ! 3835: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xce5a0009  ! 3835: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0x836a200c  ! 3836: SDIVX_I	sdivx	%r8, 0x000c, %r1
	.word 0xc3ea1009  ! 3837: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xca8a1009  ! 3838: LDUBA_R	lduba	[%r8, %r9] 0x80, %r5
	.word 0x2e800001  ! 3839: BVS	bvs,a	<label_0x1>
	.word 0xf8ba1009  ! 3840: STDA_R	stda	%r28, [%r8 + %r9] 0x80
	.word 0xea220009  ! 3842: STW_R	stw	%r21, [%r8 + %r9]
	.word 0xc8420009  ! 3842: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0x8e7a0009  ! 3843: SDIV_R	sdiv 	%r8, %r9, %r7
	.word 0xc81a2e48  ! 3844: LDD_I	ldd	[%r8 + 0x0e48], %r4
	.word 0xc22a0009  ! 3846: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc2120009  ! 3846: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0x04ca0001  ! 3847: BRLEZ	brlez  ,pt	%8,<label_0xa0001>
	.word 0xc7022c78  ! 3848: LDF_I	ld	[%r8, 0x0c78], %f3
	.word 0xb2fa0009  ! 3849: SDIVcc_R	sdivcc 	%r8, %r9, %r25
	.word 0xc5022164  ! 3850: LDF_I	ld	[%r8, 0x0164], %f2
	.word 0xc64a2124  ! 3851: LDSB_I	ldsb	[%r8 + 0x0124], %r3
	.word 0xa1a208a9  ! 3852: FSUBs	fsubs	%f8, %f9, %f16
	.word 0xf49a23d0  ! 3853: LDDA_I	ldda	[%r8, + 0x03d0] %asi, %r26
	.word 0xd8220009  ! 3855: STW_R	stw	%r12, [%r8 + %r9]
	.word 0xce120009  ! 3855: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xc6922368  ! 3856: LDUHA_I	lduha	[%r8, + 0x0368] %asi, %r3
	.word 0xc6ca1009  ! 3857: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r3
	.word 0xcafa26d8  ! 3858: SWAPA_I	swapa	%r5, [%r8 + 0x06d8] %asi
	.word 0x8143e045  ! 3859: MEMBAR	membar	#LoadLoad | #LoadStore | #Sync 
	.word 0xf02a0009  ! 3861: STB_R	stb	%r24, [%r8 + %r9]
	.word 0xd6020009  ! 3861: LDUW_R	lduw	[%r8 + %r9], %r11
	.word 0xccc22d84  ! 3862: LDSWA_I	ldswa	[%r8, + 0x0d84] %asi, %r6
	.word 0xc2ca2a74  ! 3863: LDSBA_I	ldsba	[%r8, + 0x0a74] %asi, %r1
	.word 0xcc220009  ! 3865: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xcc120009  ! 3865: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0x84da0009  ! 3866: SMULcc_R	smulcc 	%r8, %r9, %r2
	.word 0xceca2d28  ! 3867: LDSBA_I	ldsba	[%r8, + 0x0d28] %asi, %r7
	.word 0x85a20929  ! 3868: FMULs	fmuls	%f8, %f9, %f2
	.word 0xce320009  ! 3870: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xce420009  ! 3870: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xf66a21f0  ! 3871: LDSTUB_I	ldstub	%r27, [%r8 + 0x01f0]
	.word 0xc2320009  ! 3873: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xcc1a0009  ! 3873: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xd8220009  ! 3875: STW_R	stw	%r12, [%r8 + %r9]
	.word 0xc31a0009  ! 3875: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xc36a2648  ! 3876: PREFETCH_I	prefetch	[%r8 + 0x0648], #one_read
	.word 0xcb3a0009  ! 3878: STDF_R	std	%f5, [%r9, %r8]
	.word 0xcc720009  ! 3879: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xee5a0009  ! 3879: LDX_R	ldx	[%r8 + %r9], %r23
	.word 0xc4b22e94  ! 3880: STHA_I	stha	%r2, [%r8 + 0x0e94] %asi
	.word 0xc6ea1009  ! 3881: LDSTUBA_R	ldstuba	%r3, [%r8 + %r9] 0x80
	.word 0x28800001  ! 3882: BLEU	bleu,a	<label_0x1>
	.word 0x0ac20001  ! 3883: BRNZ	brnz  ,nt	%8,<label_0x20001>
	.word 0xc89a28f0  ! 3884: LDDA_I	ldda	[%r8, + 0x08f0] %asi, %r4
	.word 0x10800001  ! 3885: BA	ba  	<label_0x1>
	.word 0x826a0009  ! 3886: UDIVX_R	udivx 	%r8, %r9, %r1
	.word 0xf4a21009  ! 3887: STWA_R	stwa	%r26, [%r8 + %r9] 0x80
	.word 0xea220009  ! 3889: STW_R	stw	%r21, [%r8 + %r9]
	.word 0xc2520009  ! 3889: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0x38800001  ! 3890: BGU	bgu,a	<label_0x1>
	.word 0xfc320009  ! 3892: STH_R	sth	%r30, [%r8 + %r9]
	.word 0xc91a0009  ! 3892: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0x0eca0001  ! 3893: BRGEZ	brgez  ,pt	%8,<label_0xa0001>
	.word 0xa8fa0009  ! 3894: SDIVcc_R	sdivcc 	%r8, %r9, %r20
	.word 0xc2da2e30  ! 3895: LDXA_I	ldxa	[%r8, + 0x0e30] %asi, %r1
	.word 0xc88a1009  ! 3896: LDUBA_R	lduba	[%r8, %r9] 0x80, %r4
	.word 0xc89a20f8  ! 3897: LDDA_I	ldda	[%r8, + 0x00f8] %asi, %r4
	.word 0xcaea27f8  ! 3898: LDSTUBA_I	ldstuba	%r5, [%r8 + 0x07f8] %asi
	.word 0xe2ca2a68  ! 3899: LDSBA_I	ldsba	[%r8, + 0x0a68] %asi, %r17
	.word 0xd8ba2720  ! 3900: STDA_I	stda	%r12, [%r8 + 0x0720] %asi
	.word 0xde6a0009  ! 3901: LDSTUB_R	ldstub	%r15, [%r8 + %r9]
	.word 0xc36a0009  ! 3902: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xf9f21009  ! 3903: CASXA_I	casxa	[%r8] 0x80, %r9, %r28
	.word 0x824a0009  ! 3904: MULX_R	mulx 	%r8, %r9, %r1
	.word 0x8143c000  ! 3905: STBAR	stbar
	.word 0xdd3a2238  ! 3906: STDF_I	std	%f14, [0x0238, %r8]
	.word 0xce020009  ! 3907: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xe7e22009  ! 3908: CASA_R	casa	[%r8] %asi, %r9, %r19
	.word 0xc6320009  ! 3910: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xca120009  ! 3910: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xfc422cd8  ! 3911: LDSW_I	ldsw	[%r8 + 0x0cd8], %r30
	.word 0xc8aa22a4  ! 3912: STBA_I	stba	%r4, [%r8 + 0x02a4] %asi
	.word 0xc2320009  ! 3914: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc2420009  ! 3914: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xe42a0009  ! 3916: STB_R	stb	%r18, [%r8 + %r9]
	.word 0xe41a0009  ! 3916: LDD_R	ldd	[%r8 + %r9], %r18
	.word 0xcefa1009  ! 3917: SWAPA_R	swapa	%r7, [%r8 + %r9] 0x80
	.word 0xcd3a0009  ! 3919: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc8720009  ! 3920: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc6020009  ! 3920: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xc49a2760  ! 3921: LDDA_I	ldda	[%r8, + 0x0760] %asi, %r2
	.word 0xfa220009  ! 3923: STW_R	stw	%r29, [%r8 + %r9]
	.word 0xc24a0009  ! 3923: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xc25a0009  ! 3924: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xd6b222f0  ! 3925: STHA_I	stha	%r11, [%r8 + 0x02f0] %asi
	.word 0x2a800001  ! 3926: BCS	bcs,a	<label_0x1>
	.word 0x84720009  ! 3927: UDIV_R	udiv 	%r8, %r9, %r2
	.word 0x8143c000  ! 3928: STBAR	stbar
	.word 0x8fa20929  ! 3929: FMULs	fmuls	%f8, %f9, %f7
	.word 0xc3020009  ! 3930: LDF_R	ld	[%r8, %r9], %f1
	.word 0x8143e00c  ! 3931: MEMBAR	membar	#LoadStore | #StoreStore 
	.word 0x85a208a9  ! 3932: FSUBs	fsubs	%f8, %f9, %f2
	.word 0xca6a2600  ! 3933: LDSTUB_I	ldstub	%r5, [%r8 + 0x0600]
	.word 0xc8f21009  ! 3934: STXA_R	stxa	%r4, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 3935: STBAR	stbar
	.word 0x00800001  ! 3936: BN	bn  	<label_0x1>
	.word 0xde7a2474  ! 3937: SWAP_I	swap	%r15, [%r8 + 0x0474]
	.word 0xc8f22498  ! 3938: STXA_I	stxa	%r4, [%r8 + 0x0498] %asi
	.word 0xc85a0009  ! 3939: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xe6720009  ! 3941: STX_R	stx	%r19, [%r8 + %r9]
	.word 0xf2420009  ! 3941: LDSW_R	ldsw	[%r8 + %r9], %r25
	.word 0xc36a0009  ! 3942: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0x86520009  ! 3943: UMUL_R	umul 	%r8, %r9, %r3
	.word 0xccfa25d4  ! 3944: SWAPA_I	swapa	%r6, [%r8 + 0x05d4] %asi
	.word 0xc6fa1009  ! 3945: SWAPA_R	swapa	%r3, [%r8 + %r9] 0x80
	.word 0xc51a2a78  ! 3946: LDDF_I	ldd	[%r8, 0x0a78], %f2
	.word 0xc2a2263c  ! 3947: STWA_I	stwa	%r1, [%r8 + 0x063c] %asi
	.word 0xbcda0009  ! 3948: SMULcc_R	smulcc 	%r8, %r9, %r30
	.word 0xc6fa2228  ! 3949: SWAPA_I	swapa	%r3, [%r8 + 0x0228] %asi
	.word 0xfa220009  ! 3951: STW_R	stw	%r29, [%r8 + %r9]
	.word 0xca020009  ! 3951: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0x8143c000  ! 3952: STBAR	stbar
	.word 0x9eda0009  ! 3953: SMULcc_R	smulcc 	%r8, %r9, %r15
	.word 0xb45a0009  ! 3954: SMUL_R	smul 	%r8, %r9, %r26
	.word 0xc6822264  ! 3955: LDUWA_I	lduwa	[%r8, + 0x0264] %asi, %r3
	.word 0xc8220009  ! 3957: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc91a0009  ! 3957: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0x8f220009  ! 3958: MULScc_R	mulscc 	%r8, %r9, %r7
	.word 0xc53a0009  ! 3960: STDF_R	std	%f2, [%r9, %r8]
	.word 0xcc720009  ! 3961: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xca520009  ! 3961: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0x8143e03c  ! 3962: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0x8143c000  ! 3963: STBAR	stbar
	.word 0xff3a2df0  ! 3964: STDF_I	std	%f31, [0x0df0, %r8]
	.word 0xfcf22770  ! 3965: STXA_I	stxa	%r30, [%r8 + 0x0770] %asi
	.word 0xca7a0009  ! 3966: SWAP_R	swap	%r5, [%r8 + %r9]
	.word 0xf7e21009  ! 3967: CASA_I	casa	[%r8] 0x80, %r9, %r27
	.word 0xc8aa1009  ! 3968: STBA_R	stba	%r4, [%r8 + %r9] 0x80
	.word 0xc53a2cf8  ! 3969: STDF_I	std	%f2, [0x0cf8, %r8]
	.word 0xc7220009  ! 3971: STF_R	st	%f3, [%r9, %r8]
	.word 0xce720009  ! 3972: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xcd020009  ! 3972: LDF_R	ld	[%r8, %r9], %f6
	.word 0xc3ea2e78  ! 3973: PREFETCHA_I	prefetcha	[%r8, + 0x0e78] %asi, #one_read
	.word 0xc3ea1009  ! 3974: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x8d222478  ! 3975: MULScc_I	mulscc 	%r8, 0x0478, %r6
	.word 0xcf222210  ! 3976: STF_I	st	%f7, [0x0210, %r8]
	.word 0xc4720009  ! 3978: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xce4a0009  ! 3978: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xbc4a2330  ! 3979: MULX_I	mulx 	%r8, 0x0330, %r30
	.word 0xc25a2b08  ! 3980: LDX_I	ldx	[%r8 + 0x0b08], %r1
	.word 0x2c800001  ! 3981: BNEG	bneg,a	<label_0x1>
	.word 0xc87a2cd4  ! 3982: SWAP_I	swap	%r4, [%r8 + 0x0cd4]
	.word 0x8143c000  ! 3983: STBAR	stbar
	.word 0xe8ca2ef4  ! 3984: LDSBA_I	ldsba	[%r8, + 0x0ef4] %asi, %r20
	.word 0xc8320009  ! 3986: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc41a0009  ! 3986: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x8ba20929  ! 3987: FMULs	fmuls	%f8, %f9, %f5
	.word 0xc8a222d0  ! 3988: STWA_I	stwa	%r4, [%r8 + 0x02d0] %asi
	.word 0xb8d220b0  ! 3989: UMULcc_I	umulcc 	%r8, 0x00b0, %r28
	.word 0xc82a0009  ! 3991: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xda120009  ! 3991: LDUH_R	lduh	[%r8 + %r9], %r13
	.word 0xc2fa2c30  ! 3992: SWAPA_I	swapa	%r1, [%r8 + 0x0c30] %asi
	.word 0x8143c000  ! 3993: STBAR	stbar
	.word 0xc3ea1009  ! 3994: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x8eda0009  ! 3995: SMULcc_R	smulcc 	%r8, %r9, %r7
	.word 0xc6320009  ! 3997: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc8020009  ! 3997: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xccaa1009  ! 3998: STBA_R	stba	%r6, [%r8 + %r9] 0x80
	.word 0xd6f21009  ! 3999: STXA_R	stxa	%r11, [%r8 + %r9] 0x80
        ta      T_GOOD_TRAP

th_main_3:
        setx  MAIN_BASE_DATA_VA, %r1, %r8
        setx  0x0000000000000240, %g1, %r9
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
        setx  0x5bcb77ce324c4aeb, %g1, %r0
        setx  0xf4827a53b6bfc94b, %g1, %r1
        setx  0x5ff64cb6e9f911dd, %g1, %r2
        setx  0xedae56c1122233ea, %g1, %r3
        setx  0xa4c8e1fea18da88d, %g1, %r4
        setx  0x73f0234fb272a0d1, %g1, %r5
        setx  0xc6781074b4f57ece, %g1, %r6
        setx  0x137484eba10193c7, %g1, %r7
        setx  0x94391cfcb951fc12, %g1, %r10
        setx  0x6eeb88f68472af8b, %g1, %r11
        setx  0x147053d363779850, %g1, %r12
        setx  0x286b90c2ab3d98c3, %g1, %r13
        setx  0xfb261a31aa3f067c, %g1, %r14
        setx  0xd91ae140e0a7d68c, %g1, %r15
        setx  0x965d8c1e72319eac, %g1, %r16
        setx  0xa5ab654862ba5616, %g1, %r17
        setx  0xef49eac80eab1e68, %g1, %r18
        setx  0x24d6a3e86354bd48, %g1, %r19
        setx  0xaa334c901f893140, %g1, %r20
        setx  0xa4fcf20a864b0998, %g1, %r21
        setx  0xc65ea9c8ad5f1820, %g1, %r22
        setx  0x6a98fff462b41946, %g1, %r23
        setx  0x533f03888a0dcd50, %g1, %r24
        setx  0x71dbf93e67f5003c, %g1, %r25
        setx  0xd3560b37895de55d, %g1, %r26
        setx  0x5e711f0a85df89d8, %g1, %r27
        setx  0x57d3dd74a55e6a56, %g1, %r28
        setx  0x5723f1dcb12effec, %g1, %r29
        setx  0x281afcc2d80050f4, %g1, %r30
        setx  0x9541794447d1404f, %g1, %r31
	.word 0xc2a22650  ! 1: STWA_I	stwa	%r1, [%r8 + 0x0650] %asi
	.word 0x82fa0009  ! 2: SDIVcc_R	sdivcc 	%r8, %r9, %r1
	.word 0xc2320009  ! 4: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc4520009  ! 4: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0x98da21d8  ! 5: SMULcc_I	smulcc 	%r8, 0x01d8, %r12
	.word 0xc91a0009  ! 6: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xcca21009  ! 7: STWA_R	stwa	%r6, [%r8 + %r9] 0x80
	.word 0x8143e01f  ! 8: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #Lookaside 
	.word 0xc36a2af0  ! 9: PREFETCH_I	prefetch	[%r8 + 0x0af0], #one_read
	.word 0xc8ca2c68  ! 10: LDSBA_I	ldsba	[%r8, + 0x0c68] %asi, %r4
	.word 0x2e800001  ! 11: BVS	bvs,a	<label_0x1>
	.word 0xc3ea1009  ! 12: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x8c5a28f4  ! 13: SMUL_I	smul 	%r8, 0x08f4, %r6
	.word 0xc3ea1009  ! 14: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x0a800001  ! 15: BCS	bcs  	<label_0x1>
	.word 0xa76a2540  ! 16: SDIVX_I	sdivx	%r8, 0x0540, %r19
	.word 0xc2aa2030  ! 17: STBA_I	stba	%r1, [%r8 + 0x0030] %asi
	.word 0xc36a2060  ! 18: PREFETCH_I	prefetch	[%r8 + 0x0060], #one_read
	.word 0xc4220009  ! 20: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xcc0a0009  ! 20: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xf4420009  ! 21: LDSW_R	ldsw	[%r8 + %r9], %r26
	.word 0xe91a2440  ! 22: LDDF_I	ldd	[%r8, 0x0440], %f20
	.word 0x82522e70  ! 23: UMUL_I	umul 	%r8, 0x0e70, %r1
	.word 0x8ed20009  ! 24: UMULcc_R	umulcc 	%r8, %r9, %r7
	.word 0xc6f226a8  ! 25: STXA_I	stxa	%r3, [%r8 + 0x06a8] %asi
	.word 0xcc0a2c58  ! 26: LDUB_I	ldub	[%r8 + 0x0c58], %r6
	.word 0xc53a0009  ! 28: STDF_R	std	%f2, [%r9, %r8]
	.word 0xce720009  ! 29: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xf91a0009  ! 29: LDDF_R	ldd	[%r8, %r9], %f28
	.word 0xe20a0009  ! 30: LDUB_R	ldub	[%r8 + %r9], %r17
	.word 0xe4a22480  ! 31: STWA_I	stwa	%r18, [%r8 + 0x0480] %asi
	.word 0xa87a2174  ! 32: SDIV_I	sdiv 	%r8, 0x0174, %r20
	.word 0xc3ea1009  ! 33: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x8143c000  ! 34: STBAR	stbar
	.word 0xca0a0009  ! 35: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xc2320009  ! 37: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xcc4a0009  ! 37: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xc68a2310  ! 38: LDUBA_I	lduba	[%r8, + 0x0310] %asi, %r3
	.word 0xe82a0009  ! 40: STB_R	stb	%r20, [%r8 + %r9]
	.word 0xc41a0009  ! 40: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xe24a2ecc  ! 41: LDSB_I	ldsb	[%r8 + 0x0ecc], %r17
	.word 0x22c20001  ! 42: BRZ	brz,a,nt	%8,<label_0x20001>
	.word 0x8143e05c  ! 43: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0xc36a0009  ! 44: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xefe22009  ! 45: CASA_R	casa	[%r8] %asi, %r9, %r23
	.word 0xb36a2944  ! 46: SDIVX_I	sdivx	%r8, 0x0944, %r25
	.word 0xb6da0009  ! 47: SMULcc_R	smulcc 	%r8, %r9, %r27
	.word 0xccea24b4  ! 48: LDSTUBA_I	ldstuba	%r6, [%r8 + 0x04b4] %asi
	.word 0xc73a2b88  ! 49: STDF_I	std	%f3, [0x0b88, %r8]
	.word 0xc8220009  ! 51: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc65a0009  ! 51: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xc81a2298  ! 52: LDD_I	ldd	[%r8 + 0x0298], %r4
	.word 0xf6fa1009  ! 53: SWAPA_R	swapa	%r27, [%r8 + %r9] 0x80
	.word 0xb9a20829  ! 54: FADDs	fadds	%f8, %f9, %f28
	.word 0xee320009  ! 56: STH_R	sth	%r23, [%r8 + %r9]
	.word 0xc31a0009  ! 56: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xf7e22009  ! 57: CASA_R	casa	[%r8] %asi, %r9, %r27
	.word 0xc90225c8  ! 58: LDF_I	ld	[%r8, 0x05c8], %f4
	.word 0xc28a27b0  ! 59: LDUBA_I	lduba	[%r8, + 0x07b0] %asi, %r1
	.word 0xae72279c  ! 60: UDIV_I	udiv 	%r8, 0x079c, %r23
	.word 0x8143e047  ! 61: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Sync 
	.word 0xca6a2578  ! 62: LDSTUB_I	ldstub	%r5, [%r8 + 0x0578]
	.word 0xcf220009  ! 64: STF_R	st	%f7, [%r9, %r8]
	.word 0xc4720009  ! 65: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc24a0009  ! 65: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0x3c800001  ! 66: BPOS	bpos,a	<label_0x1>
	.word 0x8c520009  ! 67: UMUL_R	umul 	%r8, %r9, %r6
	.word 0x8143e015  ! 68: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside 
	.word 0x8143e061  ! 69: MEMBAR	membar	#LoadLoad | #MemIssue | #Sync 
	.word 0xc8220009  ! 71: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xcc1a0009  ! 71: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xc3ea1009  ! 72: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xcd220009  ! 74: STF_R	st	%f6, [%r9, %r8]
	.word 0xe2720009  ! 75: STX_R	stx	%r17, [%r8 + %r9]
	.word 0xcc520009  ! 75: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0x8143c000  ! 76: STBAR	stbar
	.word 0x8da208a9  ! 77: FSUBs	fsubs	%f8, %f9, %f6
	.word 0xca0a0009  ! 78: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0x1c800001  ! 79: BPOS	bpos  	<label_0x1>
	.word 0x02800002  ! 80: BE	be  	<label_0x2>
	.word 0x85222db4  ! 81: MULScc_I	mulscc 	%r8, 0x0db4, %r2
	.word 0x20800002  ! 82: BN	bn,a	<label_0x2>
	.word 0xc2f21009  ! 83: STXA_R	stxa	%r1, [%r8 + %r9] 0x80
	.word 0xd6aa208c  ! 84: STBA_I	stba	%r11, [%r8 + 0x008c] %asi
	.word 0x8143e057  ! 85: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside | #Sync 
	.word 0xc3ea2678  ! 86: PREFETCHA_I	prefetcha	[%r8, + 0x0678] %asi, #one_read
	.word 0xf05a27c8  ! 87: LDX_I	ldx	[%r8 + 0x07c8], %r24
	.word 0x8143c000  ! 88: STBAR	stbar
	.word 0x98722538  ! 89: UDIV_I	udiv 	%r8, 0x0538, %r12
	.word 0xc6220009  ! 91: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc91a0009  ! 91: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xc6320009  ! 93: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc85a0009  ! 93: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xc2aa1009  ! 94: STBA_R	stba	%r1, [%r8 + %r9] 0x80
	.word 0x8cda0009  ! 95: SMULcc_R	smulcc 	%r8, %r9, %r6
	.word 0xc3222e7c  ! 96: STF_I	st	%f1, [0x0e7c, %r8]
	.word 0x896a236c  ! 97: SDIVX_I	sdivx	%r8, 0x036c, %r4
	.word 0x8a5220fc  ! 98: UMUL_I	umul 	%r8, 0x00fc, %r5
	.word 0x06c20001  ! 99: BRLZ	brlz  ,nt	%8,<label_0x20001>
	.word 0xc53a2878  ! 100: STDF_I	std	%f2, [0x0878, %r8]
	.word 0xea320009  ! 102: STH_R	sth	%r21, [%r8 + %r9]
	.word 0xde120009  ! 102: LDUH_R	lduh	[%r8 + %r9], %r15
	.word 0xc4a2279c  ! 103: STWA_I	stwa	%r2, [%r8 + 0x079c] %asi
	.word 0xe2320009  ! 105: STH_R	sth	%r17, [%r8 + %r9]
	.word 0xc85a0009  ! 105: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xc3ea28e0  ! 106: PREFETCHA_I	prefetcha	[%r8, + 0x08e0] %asi, #one_read
	.word 0xddf22009  ! 107: CASXA_R	casxa	[%r8]%asi, %r9, %r14
	.word 0xbd222c64  ! 108: MULScc_I	mulscc 	%r8, 0x0c64, %r30
	.word 0xc36a0009  ! 109: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0x8fa209a9  ! 110: FDIVs	fdivs	%f8, %f9, %f7
	.word 0xc2921009  ! 111: LDUHA_R	lduha	[%r8, %r9] 0x80, %r1
	.word 0xcc7a2508  ! 112: SWAP_I	swap	%r6, [%r8 + 0x0508]
	.word 0x0aca0001  ! 113: BRNZ	brnz  ,pt	%8,<label_0xa0001>
	.word 0xe9222218  ! 114: STF_I	st	%f20, [0x0218, %r8]
	.word 0x8143c000  ! 115: STBAR	stbar
	.word 0xc5020009  ! 116: LDF_R	ld	[%r8, %r9], %f2
	.word 0x9cf20009  ! 117: UDIVcc_R	udivcc 	%r8, %r9, %r14
	.word 0x884a28e4  ! 118: MULX_I	mulx 	%r8, 0x08e4, %r4
	.word 0xc9f21009  ! 119: CASXA_I	casxa	[%r8] 0x80, %r9, %r4
	.word 0x89a20829  ! 120: FADDs	fadds	%f8, %f9, %f4
	.word 0xc25a0009  ! 121: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xc81a2990  ! 122: LDD_I	ldd	[%r8 + 0x0990], %r4
	.word 0xc36a0009  ! 123: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0x12800002  ! 124: BNE	bne  	<label_0x2>
	.word 0x8143e004  ! 125: MEMBAR	membar	#LoadStore 
	.word 0xcc320009  ! 127: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc8120009  ! 127: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xc2f22e78  ! 128: STXA_I	stxa	%r1, [%r8 + 0x0e78] %asi
	.word 0xcada1009  ! 129: LDXA_R	ldxa	[%r8, %r9] 0x80, %r5
	.word 0xc4d21009  ! 130: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r2
	.word 0xfcd21009  ! 131: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r30
	.word 0x8ba20929  ! 132: FMULs	fmuls	%f8, %f9, %f5
	.word 0x836a0009  ! 133: SDIVX_R	sdivx	%r8, %r9, %r1
	.word 0x8143c000  ! 134: STBAR	stbar
	.word 0xc4220009  ! 136: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xf81a0009  ! 136: LDD_R	ldd	[%r8 + %r9], %r28
	.word 0xb9a208a9  ! 137: FSUBs	fsubs	%f8, %f9, %f28
	.word 0xc3ea2000  ! 138: PREFETCHA_I	prefetcha	[%r8, + 0x0000] %asi, #one_read
	.word 0xcbe22009  ! 139: CASA_R	casa	[%r8] %asi, %r9, %r5
	.word 0x8fa20829  ! 140: FADDs	fadds	%f8, %f9, %f7
	.word 0xca720009  ! 142: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xe2520009  ! 142: LDSH_R	ldsh	[%r8 + %r9], %r17
	.word 0x83a208a9  ! 143: FSUBs	fsubs	%f8, %f9, %f1
	.word 0x8143e01b  ! 144: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Lookaside 
	.word 0x8cda2f64  ! 145: SMULcc_I	smulcc 	%r8, 0x0f64, %r6
	.word 0x16800001  ! 146: BGE	bge  	<label_0x1>
	.word 0xf4720009  ! 148: STX_R	stx	%r26, [%r8 + %r9]
	.word 0xc4020009  ! 148: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xc3ea1009  ! 149: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc3ea1009  ! 150: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x8d6a24d8  ! 151: SDIVX_I	sdivx	%r8, 0x04d8, %r6
	.word 0xf81a0009  ! 152: LDD_R	ldd	[%r8 + %r9], %r28
	.word 0xc22a0009  ! 154: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc4020009  ! 154: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xced21009  ! 155: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r7
	.word 0xc87a0009  ! 156: SWAP_R	swap	%r4, [%r8 + %r9]
	.word 0xdd3a24e8  ! 157: STDF_I	std	%f14, [0x04e8, %r8]
	.word 0x8143c000  ! 158: STBAR	stbar
	.word 0xc3ea1009  ! 159: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc82a0009  ! 161: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc81a0009  ! 161: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x04c20001  ! 162: BRLEZ	brlez  ,nt	%8,<label_0x20001>
	.word 0xa6fa0009  ! 163: SDIVcc_R	sdivcc 	%r8, %r9, %r19
	.word 0xc3ea2c84  ! 164: PREFETCHA_I	prefetcha	[%r8, + 0x0c84] %asi, #one_read
	.word 0x846a2294  ! 165: UDIVX_I	udivx 	%r8, 0x0294, %r2
	.word 0xccba2230  ! 166: STDA_I	stda	%r6, [%r8 + 0x0230] %asi
	.word 0xf8fa29b8  ! 167: SWAPA_I	swapa	%r28, [%r8 + 0x09b8] %asi
	.word 0x1a800002  ! 168: BCC	bcc  	<label_0x2>
	.word 0xc36a0009  ! 169: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc73a2220  ! 170: STDF_I	std	%f3, [0x0220, %r8]
	.word 0x2ac20001  ! 171: BRNZ	brnz,a,nt	%8,<label_0x20001>
	.word 0xc36a0009  ! 172: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xb6f20009  ! 173: UDIVcc_R	udivcc 	%r8, %r9, %r27
	.word 0xbcda0009  ! 174: SMULcc_R	smulcc 	%r8, %r9, %r30
	.word 0xc4720009  ! 176: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc45a0009  ! 176: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0x86720009  ! 177: UDIV_R	udiv 	%r8, %r9, %r3
	.word 0x8f2226f4  ! 178: MULScc_I	mulscc 	%r8, 0x06f4, %r7
	.word 0x88da0009  ! 179: SMULcc_R	smulcc 	%r8, %r9, %r4
	.word 0xd6821009  ! 180: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r11
	.word 0x0eca0001  ! 181: BRGEZ	brgez  ,pt	%8,<label_0xa0001>
	.word 0xc3222ddc  ! 182: STF_I	st	%f1, [0x0ddc, %r8]
	.word 0xcab21009  ! 183: STHA_R	stha	%r5, [%r8 + %r9] 0x80
	.word 0x02800001  ! 184: BE	be  	<label_0x1>
	.word 0xdab21009  ! 185: STHA_R	stha	%r13, [%r8 + %r9] 0x80
	.word 0x866a27f0  ! 186: UDIVX_I	udivx 	%r8, 0x07f0, %r3
	.word 0xf11a0009  ! 187: LDDF_R	ldd	[%r8, %r9], %f24
	.word 0x887a0009  ! 188: SDIV_R	sdiv 	%r8, %r9, %r4
	.word 0xc86a0009  ! 189: LDSTUB_R	ldstub	%r4, [%r8 + %r9]
	.word 0xc31a2740  ! 190: LDDF_I	ldd	[%r8, 0x0740], %f1
	.word 0x8143c000  ! 191: STBAR	stbar
	.word 0x83a20929  ! 192: FMULs	fmuls	%f8, %f9, %f1
	.word 0xce2a0009  ! 194: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xca120009  ! 194: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0x8143c000  ! 195: STBAR	stbar
	.word 0xc36a2ef0  ! 196: PREFETCH_I	prefetch	[%r8 + 0x0ef0], #one_read
	.word 0xea2a0009  ! 198: STB_R	stb	%r21, [%r8 + %r9]
	.word 0xe0020009  ! 198: LDUW_R	lduw	[%r8 + %r9], %r16
	.word 0x04800002  ! 199: BLE	ble  	<label_0x2>
	.word 0x8e5a0009  ! 200: SMUL_R	smul 	%r8, %r9, %r7
	.word 0x8ef2215c  ! 201: UDIVcc_I	udivcc 	%r8, 0x015c, %r7
	.word 0xb2d22fc0  ! 202: UMULcc_I	umulcc 	%r8, 0x0fc0, %r25
	.word 0xac7a2de0  ! 203: SDIV_I	sdiv 	%r8, 0x0de0, %r22
	.word 0xc522258c  ! 204: STF_I	st	%f2, [0x058c, %r8]
	.word 0xca2a0009  ! 206: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xce120009  ! 206: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0x0a800002  ! 207: BCS	bcs  	<label_0x2>
	.word 0xc4c222a8  ! 208: LDSWA_I	ldswa	[%r8, + 0x02a8] %asi, %r2
	.word 0xe6220009  ! 210: STW_R	stw	%r19, [%r8 + %r9]
	.word 0xec420009  ! 210: LDSW_R	ldsw	[%r8 + %r9], %r22
	.word 0xc36a0009  ! 211: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0x846a2898  ! 212: UDIVX_I	udivx 	%r8, 0x0898, %r2
	.word 0xe01224fc  ! 213: LDUH_I	lduh	[%r8 + 0x04fc], %r16
	.word 0x847a0009  ! 214: SDIV_R	sdiv 	%r8, %r9, %r2
	.word 0x06c20001  ! 215: BRLZ	brlz  ,nt	%8,<label_0x20001>
	.word 0x12800002  ! 216: BNE	bne  	<label_0x2>
	.word 0xc2ea2830  ! 217: LDSTUBA_I	ldstuba	%r1, [%r8 + 0x0830] %asi
	.word 0xcc220009  ! 219: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xca4a0009  ! 219: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xc3ea1009  ! 220: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xe26a0009  ! 221: LDSTUB_R	ldstub	%r17, [%r8 + %r9]
	.word 0x87a20829  ! 222: FADDs	fadds	%f8, %f9, %f3
	.word 0x8d6a2d84  ! 223: SDIVX_I	sdivx	%r8, 0x0d84, %r6
	.word 0xc8720009  ! 225: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xcc420009  ! 225: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xccca27c8  ! 226: LDSBA_I	ldsba	[%r8, + 0x07c8] %asi, %r6
	.word 0x8ed223ac  ! 227: UMULcc_I	umulcc 	%r8, 0x03ac, %r7
	.word 0xe6f22f88  ! 228: STXA_I	stxa	%r19, [%r8 + 0x0f88] %asi
	.word 0xce02218c  ! 229: LDUW_I	lduw	[%r8 + 0x018c], %r7
	.word 0xbe7a0009  ! 230: SDIV_R	sdiv 	%r8, %r9, %r31
	.word 0x8cfa2a48  ! 231: SDIVcc_I	sdivcc 	%r8, 0x0a48, %r6
	.word 0x86d20009  ! 232: UMULcc_R	umulcc 	%r8, %r9, %r3
	.word 0xd6fa2388  ! 233: SWAPA_I	swapa	%r11, [%r8 + 0x0388] %asi
	.word 0x84f20009  ! 234: UDIVcc_R	udivcc 	%r8, %r9, %r2
	.word 0xcc2a0009  ! 236: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xf25a0009  ! 236: LDX_R	ldx	[%r8 + %r9], %r25
	.word 0xced21009  ! 237: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r7
	.word 0xc62a0009  ! 239: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xe8020009  ! 239: LDUW_R	lduw	[%r8 + %r9], %r20
	.word 0x82f20009  ! 240: UDIVcc_R	udivcc 	%r8, %r9, %r1
	.word 0x8a6a2d04  ! 241: UDIVX_I	udivx 	%r8, 0x0d04, %r5
	.word 0xc82a0009  ! 243: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xcc120009  ! 243: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xca220009  ! 245: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc8420009  ! 245: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xc8da2b48  ! 246: LDXA_I	ldxa	[%r8, + 0x0b48] %asi, %r4
	.word 0xa85a2090  ! 247: SMUL_I	smul 	%r8, 0x0090, %r20
	.word 0xc6220009  ! 249: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xdf1a0009  ! 249: LDDF_R	ldd	[%r8, %r9], %f15
	.word 0xc36a0009  ! 250: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xca8a2058  ! 251: LDUBA_I	lduba	[%r8, + 0x0058] %asi, %r5
	.word 0x0eca0001  ! 252: BRGEZ	brgez  ,pt	%8,<label_0xa0001>
	.word 0x8143c000  ! 253: STBAR	stbar
	.word 0x8e5a0009  ! 254: SMUL_R	smul 	%r8, %r9, %r7
	.word 0xca120009  ! 255: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xca822a48  ! 256: LDUWA_I	lduwa	[%r8, + 0x0a48] %asi, %r5
	.word 0xc2ea1009  ! 257: LDSTUBA_R	ldstuba	%r1, [%r8 + %r9] 0x80
	.word 0xc6220009  ! 259: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc20a0009  ! 259: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0x9cd22bd8  ! 260: UMULcc_I	umulcc 	%r8, 0x0bd8, %r14
	.word 0x89a209a9  ! 261: FDIVs	fdivs	%f8, %f9, %f4
	.word 0x22800002  ! 262: BE	be,a	<label_0x2>
	.word 0xcea21009  ! 263: STWA_R	stwa	%r7, [%r8 + %r9] 0x80
	.word 0xc33a2ab0  ! 264: STDF_I	std	%f1, [0x0ab0, %r8]
	.word 0xde6a0009  ! 265: LDSTUB_R	ldstub	%r15, [%r8 + %r9]
	.word 0xcb3a26a8  ! 266: STDF_I	std	%f5, [0x06a8, %r8]
	.word 0xc36a0009  ! 267: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0x8cfa0009  ! 268: SDIVcc_R	sdivcc 	%r8, %r9, %r6
	.word 0x84da0009  ! 269: SMULcc_R	smulcc 	%r8, %r9, %r2
	.word 0x06800001  ! 270: BL	bl  	<label_0x1>
	.word 0x8143e060  ! 271: MEMBAR	membar	#MemIssue | #Sync 
	.word 0x8143e056  ! 272: MEMBAR	membar	#StoreLoad | #LoadStore | #Lookaside | #Sync 
	.word 0xe7220009  ! 274: STF_R	st	%f19, [%r9, %r8]
	.word 0xc2720009  ! 275: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc7020009  ! 275: LDF_R	ld	[%r8, %r9], %f3
	.word 0xa6fa2cc8  ! 276: SDIVcc_I	sdivcc 	%r8, 0x0cc8, %r19
	.word 0x8143e018  ! 277: MEMBAR	membar	#StoreStore | #Lookaside 
	.word 0x845a0009  ! 278: SMUL_R	smul 	%r8, %r9, %r2
	.word 0xcc5a2e00  ! 279: LDX_I	ldx	[%r8 + 0x0e00], %r6
	.word 0xf0520009  ! 280: LDSH_R	ldsh	[%r8 + %r9], %r24
	.word 0xc4320009  ! 282: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xe01a0009  ! 282: LDD_R	ldd	[%r8 + %r9], %r16
	.word 0xcc320009  ! 284: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xcd1a0009  ! 284: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0x8143c000  ! 285: STBAR	stbar
	.word 0xf80a2214  ! 286: LDUB_I	ldub	[%r8 + 0x0214], %r28
	.word 0x8ef22fb4  ! 287: UDIVcc_I	udivcc 	%r8, 0x0fb4, %r7
	.word 0xf0720009  ! 289: STX_R	stx	%r24, [%r8 + %r9]
	.word 0xc80a0009  ! 289: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0x96720009  ! 290: UDIV_R	udiv 	%r8, %r9, %r11
	.word 0xc4420009  ! 291: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xe5f22009  ! 292: CASXA_R	casxa	[%r8]%asi, %r9, %r18
	.word 0x32800001  ! 293: BNE	bne,a	<label_0x1>
	.word 0xda720009  ! 295: STX_R	stx	%r13, [%r8 + %r9]
	.word 0xc9020009  ! 295: LDF_R	ld	[%r8, %r9], %f4
	.word 0x8143e007  ! 296: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore 
	.word 0xee6a0009  ! 297: LDSTUB_R	ldstub	%r23, [%r8 + %r9]
	.word 0xc3ea2b18  ! 298: PREFETCHA_I	prefetcha	[%r8, + 0x0b18] %asi, #one_read
	.word 0x8143c000  ! 299: STBAR	stbar
	.word 0xcca221a4  ! 300: STWA_I	stwa	%r6, [%r8 + 0x01a4] %asi
	.word 0xc84a0009  ! 301: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xc5f22009  ! 302: CASXA_R	casxa	[%r8]%asi, %r9, %r2
	.word 0x97a209a9  ! 303: FDIVs	fdivs	%f8, %f9, %f11
	.word 0x8ed20009  ! 304: UMULcc_R	umulcc 	%r8, %r9, %r7
	.word 0xca2a0009  ! 306: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc51a0009  ! 306: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0x20800001  ! 307: BN	bn,a	<label_0x1>
	.word 0xc4822ab0  ! 308: LDUWA_I	lduwa	[%r8, + 0x0ab0] %asi, %r2
	.word 0xbc6a2638  ! 309: UDIVX_I	udivx 	%r8, 0x0638, %r30
	.word 0xcb1a2468  ! 310: LDDF_I	ldd	[%r8, 0x0468], %f5
	.word 0xc66a2988  ! 311: LDSTUB_I	ldstub	%r3, [%r8 + 0x0988]
	.word 0xe22a0009  ! 313: STB_R	stb	%r17, [%r8 + %r9]
	.word 0xf4020009  ! 313: LDUW_R	lduw	[%r8 + %r9], %r26
	.word 0xc3ea2138  ! 314: PREFETCHA_I	prefetcha	[%r8, + 0x0138] %asi, #one_read
	.word 0xca6a2b40  ! 315: LDSTUB_I	ldstub	%r5, [%r8 + 0x0b40]
	.word 0xc8520009  ! 316: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xc2921009  ! 317: LDUHA_R	lduha	[%r8, %r9] 0x80, %r1
	.word 0xc36a0009  ! 318: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0x3a800001  ! 319: BCC	bcc,a	<label_0x1>
	.word 0xc9e22009  ! 320: CASA_R	casa	[%r8] %asi, %r9, %r4
	.word 0xc6da2190  ! 321: LDXA_I	ldxa	[%r8, + 0x0190] %asi, %r3
	.word 0xcc7a0009  ! 322: SWAP_R	swap	%r6, [%r8 + %r9]
	.word 0x856a0009  ! 323: SDIVX_R	sdivx	%r8, %r9, %r2
	.word 0xfcea2de4  ! 324: LDSTUBA_I	ldstuba	%r30, [%r8 + 0x0de4] %asi
	.word 0xc2a21009  ! 325: STWA_R	stwa	%r1, [%r8 + %r9] 0x80
	.word 0xe80a0009  ! 326: LDUB_R	ldub	[%r8 + %r9], %r20
	.word 0xcada24e8  ! 327: LDXA_I	ldxa	[%r8, + 0x04e8] %asi, %r5
	.word 0x02c20001  ! 328: BRZ	brz  ,nt	%8,<label_0x20001>
	.word 0xfc220009  ! 330: STW_R	stw	%r30, [%r8 + %r9]
	.word 0xcc5a0009  ! 330: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0x8c7a2ba8  ! 331: SDIV_I	sdiv 	%r8, 0x0ba8, %r6
	.word 0xc89a1009  ! 332: LDDA_R	ldda	[%r8, %r9] 0x80, %r4
	.word 0x0cc20001  ! 333: BRGZ	brgz  ,nt	%8,<label_0x20001>
	.word 0xe8122e1c  ! 334: LDUH_I	lduh	[%r8 + 0x0e1c], %r20
	.word 0xc2b2277c  ! 335: STHA_I	stha	%r1, [%r8 + 0x077c] %asi
	.word 0x9e6a2998  ! 336: UDIVX_I	udivx 	%r8, 0x0998, %r15
	.word 0xceda2f58  ! 337: LDXA_I	ldxa	[%r8, + 0x0f58] %asi, %r7
	.word 0x856a0009  ! 338: SDIVX_R	sdivx	%r8, %r9, %r2
	.word 0x0cc20001  ! 339: BRGZ	brgz  ,nt	%8,<label_0x20001>
	.word 0xfab22ff8  ! 340: STHA_I	stha	%r29, [%r8 + 0x0ff8] %asi
	.word 0x36800001  ! 341: BGE	bge,a	<label_0x1>
	.word 0xc81a0009  ! 342: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xec2a0009  ! 344: STB_R	stb	%r22, [%r8 + %r9]
	.word 0xca5a0009  ! 344: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xe4fa1009  ! 345: SWAPA_R	swapa	%r18, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 346: STBAR	stbar
	.word 0xcad22594  ! 347: LDSHA_I	ldsha	[%r8, + 0x0594] %asi, %r5
	.word 0x8143c000  ! 348: STBAR	stbar
	.word 0xc3020009  ! 349: LDF_R	ld	[%r8, %r9], %f1
	.word 0xba722b5c  ! 350: UDIV_I	udiv 	%r8, 0x0b5c, %r29
	.word 0xc82a0009  ! 352: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xd65a0009  ! 352: LDX_R	ldx	[%r8 + %r9], %r11
	.word 0x865a2b68  ! 353: SMUL_I	smul 	%r8, 0x0b68, %r3
	.word 0xca320009  ! 355: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xcc520009  ! 355: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xf0da1009  ! 356: LDXA_R	ldxa	[%r8, %r9] 0x80, %r24
	.word 0xfa320009  ! 358: STH_R	sth	%r29, [%r8 + %r9]
	.word 0xcc020009  ! 358: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xc3ea1009  ! 359: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x32800002  ! 360: BNE	bne,a	<label_0x2>
	.word 0xcfe22009  ! 361: CASA_R	casa	[%r8] %asi, %r9, %r7
	.word 0xc42a0009  ! 363: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xcc420009  ! 363: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xd4ba1009  ! 364: STDA_R	stda	%r10, [%r8 + %r9] 0x80
	.word 0xc44a2e58  ! 365: LDSB_I	ldsb	[%r8 + 0x0e58], %r2
	.word 0x8143e05a  ! 366: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside | #Sync 
	.word 0xc4c22a2c  ! 367: LDSWA_I	ldswa	[%r8, + 0x0a2c] %asi, %r2
	.word 0x8fa209a9  ! 368: FDIVs	fdivs	%f8, %f9, %f7
	.word 0xf93a27e0  ! 369: STDF_I	std	%f28, [0x07e0, %r8]
	.word 0x8efa22ac  ! 370: SDIVcc_I	sdivcc 	%r8, 0x02ac, %r7
	.word 0x8da209a9  ! 371: FDIVs	fdivs	%f8, %f9, %f6
	.word 0x40000002  ! 372: CALL	call	disp30_2
	.word 0xce8a23dc  ! 373: LDUBA_I	lduba	[%r8, + 0x03dc] %asi, %r7
	.word 0xc8b22518  ! 374: STHA_I	stha	%r4, [%r8 + 0x0518] %asi
	.word 0xcff21009  ! 375: CASXA_I	casxa	[%r8] 0x80, %r9, %r7
	.word 0xcd3a2710  ! 376: STDF_I	std	%f6, [0x0710, %r8]
	.word 0x87220009  ! 377: MULScc_R	mulscc 	%r8, %r9, %r3
	.word 0xfa2a0009  ! 379: STB_R	stb	%r29, [%r8 + %r9]
	.word 0xce4a0009  ! 379: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0x38800001  ! 380: BGU	bgu,a	<label_0x1>
	.word 0x8143e025  ! 381: MEMBAR	membar	#LoadLoad | #LoadStore | #MemIssue 
	.word 0xc36a0009  ! 382: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc93a0009  ! 384: STDF_R	std	%f4, [%r9, %r8]
	.word 0xd8720009  ! 385: STX_R	stx	%r12, [%r8 + %r9]
	.word 0xca420009  ! 385: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0x8b220009  ! 386: MULScc_R	mulscc 	%r8, %r9, %r5
	.word 0xdb022c70  ! 387: LDF_I	ld	[%r8, 0x0c70], %f13
	.word 0xc2aa2610  ! 388: STBA_I	stba	%r1, [%r8 + 0x0610] %asi
	.word 0x89a208a9  ! 389: FSUBs	fsubs	%f8, %f9, %f4
	.word 0x8143e003  ! 390: MEMBAR	membar	#LoadLoad | #StoreLoad 
	.word 0xe4ba1009  ! 391: STDA_R	stda	%r18, [%r8 + %r9] 0x80
	.word 0xf8d21009  ! 392: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r28
	.word 0x8cda27a0  ! 393: SMULcc_I	smulcc 	%r8, 0x07a0, %r6
	.word 0xf1022124  ! 394: LDF_I	ld	[%r8, 0x0124], %f24
	.word 0xc36a28ac  ! 395: PREFETCH_I	prefetch	[%r8 + 0x08ac], #one_read
	.word 0xcd3a0009  ! 397: STDF_R	std	%f6, [%r9, %r8]
	.word 0xe4720009  ! 398: STX_R	stx	%r18, [%r8 + %r9]
	.word 0xce020009  ! 398: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xf2320009  ! 400: STH_R	sth	%r25, [%r8 + %r9]
	.word 0xce420009  ! 400: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xc26a0009  ! 401: LDSTUB_R	ldstub	%r1, [%r8 + %r9]
	.word 0xcc220009  ! 403: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc4420009  ! 403: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xc93a25e8  ! 404: STDF_I	std	%f4, [0x05e8, %r8]
	.word 0x84f22ad4  ! 405: UDIVcc_I	udivcc 	%r8, 0x0ad4, %r2
	.word 0xcc220009  ! 407: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xda4a0009  ! 407: LDSB_R	ldsb	[%r8 + %r9], %r13
	.word 0xc6d21009  ! 408: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r3
	.word 0xcefa2608  ! 409: SWAPA_I	swapa	%r7, [%r8 + 0x0608] %asi
	.word 0xc36a28ac  ! 410: PREFETCH_I	prefetch	[%r8 + 0x08ac], #one_read
	.word 0x8ada2398  ! 411: SMULcc_I	smulcc 	%r8, 0x0398, %r5
	.word 0xcf3a0009  ! 413: STDF_R	std	%f7, [%r9, %r8]
	.word 0xe2720009  ! 414: STX_R	stx	%r17, [%r8 + %r9]
	.word 0xc8120009  ! 414: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0x34800002  ! 415: BG	bg,a	<label_0x2>
	.word 0xc3222a88  ! 416: STF_I	st	%f1, [0x0a88, %r8]
	.word 0xc8220009  ! 418: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xe4120009  ! 418: LDUH_R	lduh	[%r8 + %r9], %r18
	.word 0xc8a22c60  ! 419: STWA_I	stwa	%r4, [%r8 + 0x0c60] %asi
	.word 0xc8ea1009  ! 420: LDSTUBA_R	ldstuba	%r4, [%r8 + %r9] 0x80
	.word 0xdcb21009  ! 421: STHA_R	stha	%r14, [%r8 + %r9] 0x80
	.word 0x8ef229e4  ! 422: UDIVcc_I	udivcc 	%r8, 0x09e4, %r7
	.word 0xc3ea1009  ! 423: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xfd3a2fa8  ! 424: STDF_I	std	%f30, [0x0fa8, %r8]
	.word 0xf6d22944  ! 425: LDSHA_I	ldsha	[%r8, + 0x0944] %asi, %r27
	.word 0xc36a2240  ! 426: PREFETCH_I	prefetch	[%r8 + 0x0240], #one_read
	.word 0xc3ea1009  ! 427: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x85a209a9  ! 428: FDIVs	fdivs	%f8, %f9, %f2
	.word 0xee220009  ! 430: STW_R	stw	%r23, [%r8 + %r9]
	.word 0xc41a0009  ! 430: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xf62a0009  ! 432: STB_R	stb	%r27, [%r8 + %r9]
	.word 0xfe020009  ! 432: LDUW_R	lduw	[%r8 + %r9], %r31
	.word 0xc7f22009  ! 433: CASXA_R	casxa	[%r8]%asi, %r9, %r3
	.word 0x8143e004  ! 434: MEMBAR	membar	#LoadStore 
	.word 0xdc1a0009  ! 435: LDD_R	ldd	[%r8 + %r9], %r14
	.word 0xc5f21009  ! 436: CASXA_I	casxa	[%r8] 0x80, %r9, %r2
	.word 0xce0a2a84  ! 437: LDUB_I	ldub	[%r8 + 0x0a84], %r7
	.word 0x8da20829  ! 438: FADDs	fadds	%f8, %f9, %f6
	.word 0x8a520009  ! 439: UMUL_R	umul 	%r8, %r9, %r5
	.word 0xc2a22ca4  ! 440: STWA_I	stwa	%r1, [%r8 + 0x0ca4] %asi
	.word 0xc31a0009  ! 441: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xccda1009  ! 442: LDXA_R	ldxa	[%r8, %r9] 0x80, %r6
	.word 0xb9a20929  ! 443: FMULs	fmuls	%f8, %f9, %f28
	.word 0xc82a0009  ! 445: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc71a0009  ! 445: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xfaf22378  ! 446: STXA_I	stxa	%r29, [%r8 + 0x0378] %asi
	.word 0xca320009  ! 448: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc71a0009  ! 448: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0x89a209a9  ! 449: FDIVs	fdivs	%f8, %f9, %f4
	.word 0xceda1009  ! 450: LDXA_R	ldxa	[%r8, %r9] 0x80, %r7
	.word 0xada20929  ! 451: FMULs	fmuls	%f8, %f9, %f22
	.word 0xc36a2900  ! 452: PREFETCH_I	prefetch	[%r8 + 0x0900], #one_read
	.word 0x18800001  ! 453: BGU	bgu  	<label_0x1>
	.word 0xb0da0009  ! 454: SMULcc_R	smulcc 	%r8, %r9, %r24
	.word 0x8143c000  ! 455: STBAR	stbar
	.word 0x85220009  ! 456: MULScc_R	mulscc 	%r8, %r9, %r2
	.word 0x8ba20929  ! 457: FMULs	fmuls	%f8, %f9, %f5
	.word 0xccaa1009  ! 458: STBA_R	stba	%r6, [%r8 + %r9] 0x80
	.word 0xea220009  ! 460: STW_R	stw	%r21, [%r8 + %r9]
	.word 0xec4a0009  ! 460: LDSB_R	ldsb	[%r8 + %r9], %r22
	.word 0xa0fa2b7c  ! 461: SDIVcc_I	sdivcc 	%r8, 0x0b7c, %r16
	.word 0xf8921009  ! 462: LDUHA_R	lduha	[%r8, %r9] 0x80, %r28
	.word 0xca220009  ! 464: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xe85a0009  ! 464: LDX_R	ldx	[%r8 + %r9], %r20
	.word 0xcc8a1009  ! 465: LDUBA_R	lduba	[%r8, %r9] 0x80, %r6
	.word 0xcc720009  ! 467: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xea120009  ! 467: LDUH_R	lduh	[%r8 + %r9], %r21
	.word 0x89220009  ! 468: MULScc_R	mulscc 	%r8, %r9, %r4
	.word 0x8143e03f  ! 469: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0xcad21009  ! 470: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r5
	.word 0x04800001  ! 471: BLE	ble  	<label_0x1>
	.word 0xc42a0009  ! 473: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc6420009  ! 473: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xd62a0009  ! 475: STB_R	stb	%r11, [%r8 + %r9]
	.word 0xca020009  ! 475: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xccba2e90  ! 476: STDA_I	stda	%r6, [%r8 + 0x0e90] %asi
	.word 0xa7a20829  ! 477: FADDs	fadds	%f8, %f9, %f19
	.word 0xf2f21009  ! 478: STXA_R	stxa	%r25, [%r8 + %r9] 0x80
	.word 0xc3ea1009  ! 479: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xcd3a0009  ! 481: STDF_R	std	%f6, [%r9, %r8]
	.word 0xca720009  ! 482: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc3020009  ! 482: LDF_R	ld	[%r8, %r9], %f1
	.word 0xfc420009  ! 483: LDSW_R	ldsw	[%r8 + %r9], %r30
	.word 0x88da2a84  ! 484: SMULcc_I	smulcc 	%r8, 0x0a84, %r4
	.word 0xc86a0009  ! 485: LDSTUB_R	ldstub	%r4, [%r8 + %r9]
	.word 0xcc120009  ! 486: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0x82fa0009  ! 487: SDIVcc_R	sdivcc 	%r8, %r9, %r1
	.word 0xe66a2468  ! 488: LDSTUB_I	ldstub	%r19, [%r8 + 0x0468]
	.word 0x00800001  ! 489: BN	bn  	<label_0x1>
	.word 0xc3ea2cc8  ! 490: PREFETCHA_I	prefetcha	[%r8, + 0x0cc8] %asi, #one_read
	.word 0xce220009  ! 492: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc4020009  ! 492: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xdaca2834  ! 493: LDSBA_I	ldsba	[%r8, + 0x0834] %asi, %r13
	.word 0x83a209a9  ! 494: FDIVs	fdivs	%f8, %f9, %f1
	.word 0xccaa1009  ! 495: STBA_R	stba	%r6, [%r8 + %r9] 0x80
	.word 0x2eca0001  ! 496: BRGEZ	brgez,a,pt	%8,<label_0xa0001>
	.word 0xc4320009  ! 498: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xca0a0009  ! 498: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xc93a2da8  ! 499: STDF_I	std	%f4, [0x0da8, %r8]
	.word 0x22800002  ! 500: BE	be,a	<label_0x2>
	.word 0xb46a0009  ! 501: UDIVX_R	udivx 	%r8, %r9, %r26
	.word 0xc6c21009  ! 502: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r3
	.word 0x8143c000  ! 503: STBAR	stbar
	.word 0xc8422ac4  ! 504: LDSW_I	ldsw	[%r8 + 0x0ac4], %r4
	.word 0xbad22624  ! 505: UMULcc_I	umulcc 	%r8, 0x0624, %r29
	.word 0xc36a0009  ! 506: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xfc9a2480  ! 507: LDDA_I	ldda	[%r8, + 0x0480] %asi, %r30
	.word 0xce220009  ! 509: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xca020009  ! 509: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xcb2226f0  ! 510: STF_I	st	%f5, [0x06f0, %r8]
	.word 0x12800001  ! 511: BNE	bne  	<label_0x1>
	.word 0x26c20001  ! 512: BRLZ	brlz,a,nt	%8,<label_0x20001>
	.word 0xc6b21009  ! 513: STHA_R	stha	%r3, [%r8 + %r9] 0x80
	.word 0xc53a2478  ! 514: STDF_I	std	%f2, [0x0478, %r8]
	.word 0x8143c000  ! 515: STBAR	stbar
	.word 0xcc8a253c  ! 516: LDUBA_I	lduba	[%r8, + 0x053c] %asi, %r6
	.word 0x964a2d6c  ! 517: MULX_I	mulx 	%r8, 0x0d6c, %r11
	.word 0xb3a20929  ! 518: FMULs	fmuls	%f8, %f9, %f25
	.word 0xc36a2848  ! 519: PREFETCH_I	prefetch	[%r8 + 0x0848], #one_read
	.word 0xc62a0009  ! 521: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xcc020009  ! 521: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0x82fa0009  ! 522: SDIVcc_R	sdivcc 	%r8, %r9, %r1
	.word 0xca122b5c  ! 523: LDUH_I	lduh	[%r8 + 0x0b5c], %r5
	.word 0xc2220009  ! 525: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xca520009  ! 525: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0x8143e058  ! 526: MEMBAR	membar	#StoreStore | #Lookaside | #Sync 
	.word 0xcd1a0009  ! 527: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0x86fa0009  ! 528: SDIVcc_R	sdivcc 	%r8, %r9, %r3
	.word 0xc3ea1009  ! 529: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xcd022240  ! 530: LDF_I	ld	[%r8, 0x0240], %f6
	.word 0x8ef20009  ! 531: UDIVcc_R	udivcc 	%r8, %r9, %r7
	.word 0xc4020009  ! 532: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0x8143e00a  ! 533: MEMBAR	membar	#StoreLoad | #StoreStore 
	.word 0x8cd20009  ! 534: UMULcc_R	umulcc 	%r8, %r9, %r6
	.word 0xc3ea1009  ! 535: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x3e800001  ! 536: BVC	bvc,a	<label_0x1>
	.word 0x865a2a94  ! 537: SMUL_I	smul 	%r8, 0x0a94, %r3
	.word 0xc8b22060  ! 538: STHA_I	stha	%r4, [%r8 + 0x0060] %asi
	.word 0xfeb22d00  ! 539: STHA_I	stha	%r31, [%r8 + 0x0d00] %asi
	.word 0xea6a2b28  ! 540: LDSTUB_I	ldstub	%r21, [%r8 + 0x0b28]
	.word 0x8fa208a9  ! 541: FSUBs	fsubs	%f8, %f9, %f7
	.word 0xc4ba2d28  ! 542: STDA_I	stda	%r2, [%r8 + 0x0d28] %asi
	.word 0x8143c000  ! 543: STBAR	stbar
	.word 0xca022ab0  ! 544: LDUW_I	lduw	[%r8 + 0x0ab0], %r5
	.word 0x8143c000  ! 545: STBAR	stbar
	.word 0xde320009  ! 547: STH_R	sth	%r15, [%r8 + %r9]
	.word 0xc20a0009  ! 547: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0x88fa2914  ! 548: SDIVcc_I	sdivcc 	%r8, 0x0914, %r4
	.word 0x86fa0009  ! 549: SDIVcc_R	sdivcc 	%r8, %r9, %r3
	.word 0xcc8a1009  ! 550: LDUBA_R	lduba	[%r8, %r9] 0x80, %r6
	.word 0x8c4a2c20  ! 551: MULX_I	mulx 	%r8, 0x0c20, %r6
	.word 0xfe8a288c  ! 552: LDUBA_I	lduba	[%r8, + 0x088c] %asi, %r31
	.word 0xe6520009  ! 553: LDSH_R	ldsh	[%r8 + %r9], %r19
	.word 0xc4320009  ! 555: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc7020009  ! 555: LDF_R	ld	[%r8, %r9], %f3
	.word 0xc36a238c  ! 556: PREFETCH_I	prefetch	[%r8 + 0x038c], #one_read
	.word 0xc36a2398  ! 557: PREFETCH_I	prefetch	[%r8 + 0x0398], #one_read
	.word 0x06ca0001  ! 558: BRLZ	brlz  ,pt	%8,<label_0xa0001>
	.word 0x845a0009  ! 559: SMUL_R	smul 	%r8, %r9, %r2
	.word 0xc8220009  ! 561: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc6120009  ! 561: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xc36a23c0  ! 562: PREFETCH_I	prefetch	[%r8 + 0x03c0], #one_read
	.word 0xca5a0009  ! 563: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xdcaa277c  ! 564: STBA_I	stba	%r14, [%r8 + 0x077c] %asi
	.word 0x8efa0009  ! 565: SDIVcc_R	sdivcc 	%r8, %r9, %r7
	.word 0xa1a20929  ! 566: FMULs	fmuls	%f8, %f9, %f16
	.word 0x00800002  ! 567: BN	bn  	<label_0x2>
	.word 0x3c800002  ! 568: BPOS	bpos,a	<label_0x2>
	.word 0xc36a255c  ! 569: PREFETCH_I	prefetch	[%r8 + 0x055c], #one_read
	.word 0xc4b21009  ! 570: STHA_R	stha	%r2, [%r8 + %r9] 0x80
	.word 0x87a20929  ! 571: FMULs	fmuls	%f8, %f9, %f3
	.word 0x8143e031  ! 572: MEMBAR	membar	#LoadLoad | #Lookaside | #MemIssue 
	.word 0xc3ea1009  ! 573: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xdcea1009  ! 574: LDSTUBA_R	ldstuba	%r14, [%r8 + %r9] 0x80
	.word 0xca220009  ! 576: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc71a0009  ! 576: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xc6220009  ! 578: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc60a0009  ! 578: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xfcda1009  ! 579: LDXA_R	ldxa	[%r8, %r9] 0x80, %r30
	.word 0xc6020009  ! 580: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xf2d22c30  ! 581: LDSHA_I	ldsha	[%r8, + 0x0c30] %asi, %r25
	.word 0xcd020009  ! 582: LDF_R	ld	[%r8, %r9], %f6
	.word 0x38800001  ! 583: BGU	bgu,a	<label_0x1>
	.word 0xe3222944  ! 584: STF_I	st	%f17, [0x0944, %r8]
	.word 0x8c520009  ! 585: UMUL_R	umul 	%r8, %r9, %r6
	.word 0xc2922884  ! 586: LDUHA_I	lduha	[%r8, + 0x0884] %asi, %r1
	.word 0xc4b21009  ! 587: STHA_R	stha	%r2, [%r8 + %r9] 0x80
	.word 0xca220009  ! 589: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xdc5a0009  ! 589: LDX_R	ldx	[%r8 + %r9], %r14
	.word 0x8fa20829  ! 590: FADDs	fadds	%f8, %f9, %f7
	.word 0xc36a2f94  ! 591: PREFETCH_I	prefetch	[%r8 + 0x0f94], #one_read
	.word 0x884a0009  ! 592: MULX_R	mulx 	%r8, %r9, %r4
	.word 0xde220009  ! 594: STW_R	stw	%r15, [%r8 + %r9]
	.word 0xec0a0009  ! 594: LDUB_R	ldub	[%r8 + %r9], %r22
	.word 0xced21009  ! 595: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r7
	.word 0xc3ea1009  ! 596: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc3ea1009  ! 597: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc5220009  ! 599: STF_R	st	%f2, [%r9, %r8]
	.word 0xca720009  ! 600: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xea420009  ! 600: LDSW_R	ldsw	[%r8 + %r9], %r21
	.word 0xc4fa1009  ! 601: SWAPA_R	swapa	%r2, [%r8 + %r9] 0x80
	.word 0x8143e015  ! 602: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside 
	.word 0xc3ea241c  ! 603: PREFETCHA_I	prefetcha	[%r8, + 0x041c] %asi, #one_read
	.word 0xca6a220c  ! 604: LDSTUB_I	ldstub	%r5, [%r8 + 0x020c]
	.word 0xc36a0009  ! 605: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xceaa1009  ! 606: STBA_R	stba	%r7, [%r8 + %r9] 0x80
	.word 0xc36a27ac  ! 607: PREFETCH_I	prefetch	[%r8 + 0x07ac], #one_read
	.word 0xa8da2c90  ! 608: SMULcc_I	smulcc 	%r8, 0x0c90, %r20
	.word 0x2ec20001  ! 609: BRGEZ	brgez,a,nt	%8,<label_0x20001>
	.word 0xcf020009  ! 610: LDF_R	ld	[%r8, %r9], %f7
	.word 0xe6c22d9c  ! 611: LDSWA_I	ldswa	[%r8, + 0x0d9c] %asi, %r19
	.word 0xeaaa2b7c  ! 612: STBA_I	stba	%r21, [%r8 + 0x0b7c] %asi
	.word 0xc22a0009  ! 614: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xfd020009  ! 614: LDF_R	ld	[%r8, %r9], %f30
	.word 0xc41a2588  ! 615: LDD_I	ldd	[%r8 + 0x0588], %r2
	.word 0xeef22a00  ! 616: STXA_I	stxa	%r23, [%r8 + 0x0a00] %asi
	.word 0xe0ba1009  ! 617: STDA_R	stda	%r16, [%r8 + %r9] 0x80
	.word 0xc45a0009  ! 618: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xc7220009  ! 620: STF_R	st	%f3, [%r9, %r8]
	.word 0xca720009  ! 621: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xea420009  ! 621: LDSW_R	ldsw	[%r8 + %r9], %r21
	.word 0x8a7a0009  ! 622: SDIV_R	sdiv 	%r8, %r9, %r5
	.word 0xf4220009  ! 624: STW_R	stw	%r26, [%r8 + %r9]
	.word 0xc6120009  ! 624: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xe8320009  ! 626: STH_R	sth	%r20, [%r8 + %r9]
	.word 0xde5a0009  ! 626: LDX_R	ldx	[%r8 + %r9], %r15
	.word 0xca220009  ! 628: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xcc020009  ! 628: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0x83a20929  ! 629: FMULs	fmuls	%f8, %f9, %f1
	.word 0x966a0009  ! 630: UDIVX_R	udivx 	%r8, %r9, %r11
	.word 0xce320009  ! 632: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc2420009  ! 632: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0x2e800002  ! 633: BVS	bvs,a	<label_0x2>
	.word 0x8143e01d  ! 634: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside 
	.word 0xfe7a0009  ! 635: SWAP_R	swap	%r31, [%r8 + %r9]
	.word 0x8f222d5c  ! 636: MULScc_I	mulscc 	%r8, 0x0d5c, %r7
	.word 0x38800001  ! 637: BGU	bgu,a	<label_0x1>
	.word 0xc51a2f98  ! 638: LDDF_I	ldd	[%r8, 0x0f98], %f2
	.word 0xc73a0009  ! 640: STDF_R	std	%f3, [%r9, %r8]
	.word 0xce720009  ! 641: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xfc4a0009  ! 641: LDSB_R	ldsb	[%r8 + %r9], %r30
	.word 0xd91a0009  ! 642: LDDF_R	ldd	[%r8, %r9], %f12
	.word 0xfc6a0009  ! 643: LDSTUB_R	ldstub	%r30, [%r8 + %r9]
	.word 0xa96a25e0  ! 644: SDIVX_I	sdivx	%r8, 0x05e0, %r20
	.word 0xce2a0009  ! 646: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xf4120009  ! 646: LDUH_R	lduh	[%r8 + %r9], %r26
	.word 0xe8ba1009  ! 647: STDA_R	stda	%r20, [%r8 + %r9] 0x80
	.word 0x8143e037  ! 648: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside | #MemIssue 
	.word 0xc8ca298c  ! 649: LDSBA_I	ldsba	[%r8, + 0x098c] %asi, %r4
	.word 0x97a209a9  ! 650: FDIVs	fdivs	%f8, %f9, %f11
	.word 0x89a20829  ! 651: FADDs	fadds	%f8, %f9, %f4
	.word 0xc3ea1009  ! 652: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xcc720009  ! 654: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xe71a0009  ! 654: LDDF_R	ldd	[%r8, %r9], %f19
	.word 0x8143e072  ! 655: MEMBAR	membar	#StoreLoad | #Lookaside | #MemIssue | #Sync 
	.word 0xcefa1009  ! 656: SWAPA_R	swapa	%r7, [%r8 + %r9] 0x80
	.word 0x97a209a9  ! 657: FDIVs	fdivs	%f8, %f9, %f11
	.word 0xf4ba1009  ! 658: STDA_R	stda	%r26, [%r8 + %r9] 0x80
	.word 0xc3ea1009  ! 659: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x8143e022  ! 660: MEMBAR	membar	#StoreLoad | #MemIssue 
	.word 0x884a0009  ! 661: MULX_R	mulx 	%r8, %r9, %r4
	.word 0xccea1009  ! 662: LDSTUBA_R	ldstuba	%r6, [%r8 + %r9] 0x80
	.word 0xc4ea2050  ! 663: LDSTUBA_I	ldstuba	%r2, [%r8 + 0x0050] %asi
	.word 0x8ed20009  ! 664: UMULcc_R	umulcc 	%r8, %r9, %r7
	.word 0x2a800001  ! 665: BCS	bcs,a	<label_0x1>
	.word 0xc66a2f5c  ! 666: LDSTUB_I	ldstub	%r3, [%r8 + 0x0f5c]
	.word 0x8c4a27b0  ! 667: MULX_I	mulx 	%r8, 0x07b0, %r6
	.word 0x86522724  ! 668: UMUL_I	umul 	%r8, 0x0724, %r3
	.word 0xc7220009  ! 670: STF_R	st	%f3, [%r9, %r8]
	.word 0xf8720009  ! 671: STX_R	stx	%r28, [%r8 + %r9]
	.word 0xdc5a0009  ! 671: LDX_R	ldx	[%r8 + %r9], %r14
	.word 0xe6122018  ! 672: LDUH_I	lduh	[%r8 + 0x0018], %r19
	.word 0x8c7a0009  ! 673: SDIV_R	sdiv 	%r8, %r9, %r6
	.word 0xee4a2158  ! 674: LDSB_I	ldsb	[%r8 + 0x0158], %r23
	.word 0x86fa26b4  ! 675: SDIVcc_I	sdivcc 	%r8, 0x06b4, %r3
	.word 0x8cd20009  ! 676: UMULcc_R	umulcc 	%r8, %r9, %r6
	.word 0xe4aa1009  ! 677: STBA_R	stba	%r18, [%r8 + %r9] 0x80
	.word 0xc36a0009  ! 678: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc8d224dc  ! 679: LDSHA_I	ldsha	[%r8, + 0x04dc] %asi, %r4
	.word 0xfe220009  ! 681: STW_R	stw	%r31, [%r8 + %r9]
	.word 0xca120009  ! 681: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xc87a2334  ! 682: SWAP_I	swap	%r4, [%r8 + 0x0334]
	.word 0xc49a1009  ! 683: LDDA_R	ldda	[%r8, %r9] 0x80, %r2
	.word 0xc8720009  ! 685: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xe51a0009  ! 685: LDDF_R	ldd	[%r8, %r9], %f18
	.word 0xccda2c30  ! 686: LDXA_I	ldxa	[%r8, + 0x0c30] %asi, %r6
	.word 0x88722d40  ! 687: UDIV_I	udiv 	%r8, 0x0d40, %r4
	.word 0xc86a2120  ! 688: LDSTUB_I	ldstub	%r4, [%r8 + 0x0120]
	.word 0xc3ea224c  ! 689: PREFETCHA_I	prefetcha	[%r8, + 0x024c] %asi, #one_read
	.word 0x8efa2720  ! 690: SDIVcc_I	sdivcc 	%r8, 0x0720, %r7
	.word 0xe6ca278c  ! 691: LDSBA_I	ldsba	[%r8, + 0x078c] %asi, %r19
	.word 0xcf220009  ! 693: STF_R	st	%f7, [%r9, %r8]
	.word 0xc4720009  ! 694: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xce5a0009  ! 694: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0x89a20829  ! 695: FADDs	fadds	%f8, %f9, %f4
	.word 0xb4fa2304  ! 696: SDIVcc_I	sdivcc 	%r8, 0x0304, %r26
	.word 0x8143c000  ! 697: STBAR	stbar
	.word 0xd8aa2dac  ! 698: STBA_I	stba	%r12, [%r8 + 0x0dac] %asi
	.word 0x88fa24ec  ! 699: SDIVcc_I	sdivcc 	%r8, 0x04ec, %r4
	.word 0x83a20829  ! 700: FADDs	fadds	%f8, %f9, %f1
	.word 0xc09a1009  ! 701: LDDA_R	ldda	[%r8, %r9] 0x80, %r0
	.word 0x24ca0001  ! 702: BRLEZ	brlez,a,pt	%8,<label_0xa0001>
	.word 0xc8b21009  ! 703: STHA_R	stha	%r4, [%r8 + %r9] 0x80
	.word 0xda2a0009  ! 705: STB_R	stb	%r13, [%r8 + %r9]
	.word 0xe8520009  ! 705: LDSH_R	ldsh	[%r8 + %r9], %r20
	.word 0xc36a0009  ! 706: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0x896a2e44  ! 707: SDIVX_I	sdivx	%r8, 0x0e44, %r4
	.word 0x8e7a29d8  ! 708: SDIV_I	sdiv 	%r8, 0x09d8, %r7
	.word 0xdab21009  ! 709: STHA_R	stha	%r13, [%r8 + %r9] 0x80
	.word 0x8eda0009  ! 710: SMULcc_R	smulcc 	%r8, %r9, %r7
	.word 0xc33a2a58  ! 711: STDF_I	std	%f1, [0x0a58, %r8]
	.word 0xea5a0009  ! 712: LDX_R	ldx	[%r8 + %r9], %r21
	.word 0xc4a2214c  ! 713: STWA_I	stwa	%r2, [%r8 + 0x014c] %asi
	.word 0xc36a0009  ! 714: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xdc6a2f5c  ! 715: LDSTUB_I	ldstub	%r14, [%r8 + 0x0f5c]
	.word 0x825227b0  ! 716: UMUL_I	umul 	%r8, 0x07b0, %r1
	.word 0xc202231c  ! 717: LDUW_I	lduw	[%r8 + 0x031c], %r1
	.word 0xf2320009  ! 719: STH_R	sth	%r25, [%r8 + %r9]
	.word 0xe4020009  ! 719: LDUW_R	lduw	[%r8 + %r9], %r18
	.word 0x14800002  ! 720: BG	bg  	<label_0x2>
	.word 0x9fa20829  ! 721: FADDs	fadds	%f8, %f9, %f15
	.word 0xce921009  ! 722: LDUHA_R	lduha	[%r8, %r9] 0x80, %r7
	.word 0x3c800002  ! 723: BPOS	bpos,a	<label_0x2>
	.word 0xc4ea2184  ! 724: LDSTUBA_I	ldstuba	%r2, [%r8 + 0x0184] %asi
	.word 0xce2a0009  ! 726: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xcb020009  ! 726: LDF_R	ld	[%r8, %r9], %f5
	.word 0xb3220009  ! 727: MULScc_R	mulscc 	%r8, %r9, %r25
	.word 0xce8a25a4  ! 728: LDUBA_I	lduba	[%r8, + 0x05a4] %asi, %r7
	.word 0xb84a2950  ! 729: MULX_I	mulx 	%r8, 0x0950, %r28
	.word 0x8143c000  ! 730: STBAR	stbar
	.word 0xaad20009  ! 731: UMULcc_R	umulcc 	%r8, %r9, %r21
	.word 0x8143e06b  ! 732: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #MemIssue | #Sync 
	.word 0xfb3a27f8  ! 733: STDF_I	std	%f29, [0x07f8, %r8]
	.word 0xce320009  ! 735: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xea520009  ! 735: LDSH_R	ldsh	[%r8 + %r9], %r21
	.word 0xf6921009  ! 736: LDUHA_R	lduha	[%r8, %r9] 0x80, %r27
	.word 0x8143c000  ! 737: STBAR	stbar
	.word 0xcaf21009  ! 738: STXA_R	stxa	%r5, [%r8 + %r9] 0x80
	.word 0xc3220009  ! 740: STF_R	st	%f1, [%r9, %r8]
	.word 0xce720009  ! 741: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xfe520009  ! 741: LDSH_R	ldsh	[%r8 + %r9], %r31
	.word 0x0a800001  ! 742: BCS	bcs  	<label_0x1>
	.word 0xc3ea259c  ! 743: PREFETCHA_I	prefetcha	[%r8, + 0x059c] %asi, #one_read
	.word 0xcc9a2cf8  ! 744: LDDA_I	ldda	[%r8, + 0x0cf8] %asi, %r6
	.word 0x26800001  ! 745: BL	bl,a	<label_0x1>
	.word 0xc41225ec  ! 746: LDUH_I	lduh	[%r8 + 0x05ec], %r2
	.word 0xceaa2558  ! 747: STBA_I	stba	%r7, [%r8 + 0x0558] %asi
	.word 0xd6320009  ! 749: STH_R	sth	%r11, [%r8 + %r9]
	.word 0xc4420009  ! 749: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xc31a0009  ! 750: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0x0a800001  ! 751: BCS	bcs  	<label_0x1>
	.word 0xcb3a2498  ! 752: STDF_I	std	%f5, [0x0498, %r8]
	.word 0x8fa208a9  ! 753: FSUBs	fsubs	%f8, %f9, %f7
	.word 0xc3ea1009  ! 754: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc36a0009  ! 755: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xe1e21009  ! 756: CASA_I	casa	[%r8] 0x80, %r9, %r16
	.word 0x8cda0009  ! 757: SMULcc_R	smulcc 	%r8, %r9, %r6
	.word 0xceca203c  ! 758: LDSBA_I	ldsba	[%r8, + 0x003c] %asi, %r7
	.word 0xf41a0009  ! 759: LDD_R	ldd	[%r8 + %r9], %r26
	.word 0xf122227c  ! 760: STF_I	st	%f24, [0x027c, %r8]
	.word 0x96fa0009  ! 761: SDIVcc_R	sdivcc 	%r8, %r9, %r11
	.word 0xde220009  ! 763: STW_R	stw	%r15, [%r8 + %r9]
	.word 0xcc4a0009  ! 763: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xab6a0009  ! 764: SDIVX_R	sdivx	%r8, %r9, %r21
	.word 0x8143e02b  ! 765: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #MemIssue 
	.word 0xca420009  ! 766: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0x0c800001  ! 767: BNEG	bneg  	<label_0x1>
	.word 0xca2a0009  ! 769: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc40a0009  ! 769: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0x8ed22d7c  ! 770: UMULcc_I	umulcc 	%r8, 0x0d7c, %r7
	.word 0xc33a2dd8  ! 771: STDF_I	std	%f1, [0x0dd8, %r8]
	.word 0xc24228a8  ! 772: LDSW_I	ldsw	[%r8 + 0x08a8], %r1
	.word 0xce420009  ! 773: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xc67a2624  ! 774: SWAP_I	swap	%r3, [%r8 + 0x0624]
	.word 0x86d20009  ! 775: UMULcc_R	umulcc 	%r8, %r9, %r3
	.word 0xc8a224cc  ! 776: STWA_I	stwa	%r4, [%r8 + 0x04cc] %asi
	.word 0xc6921009  ! 777: LDUHA_R	lduha	[%r8, %r9] 0x80, %r3
	.word 0xc3ea1009  ! 778: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc3ea1009  ! 779: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc9e22009  ! 780: CASA_R	casa	[%r8] %asi, %r9, %r4
	.word 0xc36a0009  ! 781: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc8220009  ! 783: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xca0a0009  ! 783: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xe66a0009  ! 784: LDSTUB_R	ldstub	%r19, [%r8 + %r9]
	.word 0xcf3a2180  ! 785: STDF_I	std	%f7, [0x0180, %r8]
	.word 0xc6da1009  ! 786: LDXA_R	ldxa	[%r8, %r9] 0x80, %r3
	.word 0xfc220009  ! 788: STW_R	stw	%r30, [%r8 + %r9]
	.word 0xda120009  ! 788: LDUH_R	lduh	[%r8 + %r9], %r13
	.word 0xc2f21009  ! 789: STXA_R	stxa	%r1, [%r8 + %r9] 0x80
	.word 0xc82a0009  ! 791: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xce4a0009  ! 791: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0x0ac20001  ! 792: BRNZ	brnz  ,nt	%8,<label_0x20001>
	.word 0xdc5a0009  ! 793: LDX_R	ldx	[%r8 + %r9], %r14
	.word 0xc3ea26f8  ! 794: PREFETCHA_I	prefetcha	[%r8, + 0x06f8] %asi, #one_read
	.word 0x8b222984  ! 795: MULScc_I	mulscc 	%r8, 0x0984, %r5
	.word 0xc36a2a60  ! 796: PREFETCH_I	prefetch	[%r8 + 0x0a60], #one_read
	.word 0xf8d21009  ! 797: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r28
	.word 0xcc220009  ! 799: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc84a0009  ! 799: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xc36a2360  ! 800: PREFETCH_I	prefetch	[%r8 + 0x0360], #one_read
	.word 0x8d6a0009  ! 801: SDIVX_R	sdivx	%r8, %r9, %r6
	.word 0xfea221d0  ! 802: STWA_I	stwa	%r31, [%r8 + 0x01d0] %asi
	.word 0xcc320009  ! 804: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc4520009  ! 804: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0x1c800001  ! 805: BPOS	bpos  	<label_0x1>
	.word 0xcff21009  ! 806: CASXA_I	casxa	[%r8] 0x80, %r9, %r7
	.word 0xc66a2c14  ! 807: LDSTUB_I	ldstub	%r3, [%r8 + 0x0c14]
	.word 0xe2d22810  ! 808: LDSHA_I	ldsha	[%r8, + 0x0810] %asi, %r17
	.word 0xaa720009  ! 809: UDIV_R	udiv 	%r8, %r9, %r21
	.word 0xc3ea1009  ! 810: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x8e4a2cd4  ! 811: MULX_I	mulx 	%r8, 0x0cd4, %r7
	.word 0x88f22cfc  ! 812: UDIVcc_I	udivcc 	%r8, 0x0cfc, %r4
	.word 0xcb220009  ! 814: STF_R	st	%f5, [%r9, %r8]
	.word 0xc2720009  ! 815: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xcc1a0009  ! 815: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0x87a208a9  ! 816: FSUBs	fsubs	%f8, %f9, %f3
	.word 0xc86a0009  ! 817: LDSTUB_R	ldstub	%r4, [%r8 + %r9]
	.word 0x8fa20929  ! 818: FMULs	fmuls	%f8, %f9, %f7
	.word 0xc2320009  ! 820: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc2520009  ! 820: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xc67a2ca4  ! 821: SWAP_I	swap	%r3, [%r8 + 0x0ca4]
	.word 0xd41a0009  ! 822: LDD_R	ldd	[%r8 + %r9], %r10
	.word 0xce320009  ! 824: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xf25a0009  ! 824: LDX_R	ldx	[%r8 + %r9], %r25
	.word 0x8e5a0009  ! 825: SMUL_R	smul 	%r8, %r9, %r7
	.word 0xf53a2c68  ! 826: STDF_I	std	%f26, [0x0c68, %r8]
	.word 0xc3ea2f70  ! 827: PREFETCHA_I	prefetcha	[%r8, + 0x0f70] %asi, #one_read
	.word 0xe4921009  ! 828: LDUHA_R	lduha	[%r8, %r9] 0x80, %r18
	.word 0xc41a0009  ! 829: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xc36a2b34  ! 830: PREFETCH_I	prefetch	[%r8 + 0x0b34], #one_read
	.word 0xc36a261c  ! 831: PREFETCH_I	prefetch	[%r8 + 0x061c], #one_read
	.word 0x8143e041  ! 832: MEMBAR	membar	#LoadLoad | #Sync 
	.word 0xc3ea2ac4  ! 833: PREFETCHA_I	prefetcha	[%r8, + 0x0ac4] %asi, #one_read
	.word 0xcc720009  ! 835: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xca420009  ! 835: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xcea22d8c  ! 836: STWA_I	stwa	%r7, [%r8 + 0x0d8c] %asi
	.word 0x8a4a0009  ! 837: MULX_R	mulx 	%r8, %r9, %r5
	.word 0xc8d22874  ! 838: LDSHA_I	ldsha	[%r8, + 0x0874] %asi, %r4
	.word 0x8143e05a  ! 839: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside | #Sync 
	.word 0x2e800001  ! 840: BVS	bvs,a	<label_0x1>
	.word 0xc2da2108  ! 841: LDXA_I	ldxa	[%r8, + 0x0108] %asi, %r1
	.word 0xeeea1009  ! 842: LDSTUBA_R	ldstuba	%r23, [%r8 + %r9] 0x80
	.word 0xcc220009  ! 844: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xd64a0009  ! 844: LDSB_R	ldsb	[%r8 + %r9], %r11
	.word 0xc4fa23dc  ! 845: SWAPA_I	swapa	%r2, [%r8 + 0x03dc] %asi
	.word 0xc6520009  ! 846: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0x8143e01e  ! 847: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside 
	.word 0xcd3a2d00  ! 848: STDF_I	std	%f6, [0x0d00, %r8]
	.word 0xe2a21009  ! 849: STWA_R	stwa	%r17, [%r8 + %r9] 0x80
	.word 0x88f20009  ! 850: UDIVcc_R	udivcc 	%r8, %r9, %r4
	.word 0xc82a0009  ! 852: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xcc4a0009  ! 852: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xc6320009  ! 854: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc8520009  ! 854: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0x8143c000  ! 855: STBAR	stbar
	.word 0x846a2730  ! 856: UDIVX_I	udivx 	%r8, 0x0730, %r2
	.word 0x8143e059  ! 857: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside | #Sync 
	.word 0xc8220009  ! 859: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xcd1a0009  ! 859: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xca220009  ! 861: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xcb1a0009  ! 861: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xc36a0009  ! 862: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xf3222fa4  ! 863: STF_I	st	%f25, [0x0fa4, %r8]
	.word 0x40000001  ! 864: CALL	call	disp30_1
	.word 0x845a2630  ! 865: SMUL_I	smul 	%r8, 0x0630, %r2
	.word 0x8e7a0009  ! 866: SDIV_R	sdiv 	%r8, %r9, %r7
	.word 0xc8320009  ! 868: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xcc5a0009  ! 868: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0x87a208a9  ! 869: FSUBs	fsubs	%f8, %f9, %f3
	.word 0xce2a0009  ! 871: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xcf020009  ! 871: LDF_R	ld	[%r8, %r9], %f7
	.word 0xb27a275c  ! 872: SDIV_I	sdiv 	%r8, 0x075c, %r25
	.word 0xc4b21009  ! 873: STHA_R	stha	%r2, [%r8 + %r9] 0x80
	.word 0xc4ca1009  ! 874: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r2
	.word 0xc8a21009  ! 875: STWA_R	stwa	%r4, [%r8 + %r9] 0x80
	.word 0xc4d21009  ! 876: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r2
	.word 0x82520009  ! 877: UMUL_R	umul 	%r8, %r9, %r1
	.word 0xcc320009  ! 879: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xfa020009  ! 879: LDUW_R	lduw	[%r8 + %r9], %r29
	.word 0xc6220009  ! 881: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xea120009  ! 881: LDUH_R	lduh	[%r8 + %r9], %r21
	.word 0xdff21009  ! 882: CASXA_I	casxa	[%r8] 0x80, %r9, %r15
	.word 0xdb2221dc  ! 883: STF_I	st	%f13, [0x01dc, %r8]
	.word 0xc49a2030  ! 884: LDDA_I	ldda	[%r8, + 0x0030] %asi, %r2
	.word 0xf0522a4c  ! 885: LDSH_I	ldsh	[%r8 + 0x0a4c], %r24
	.word 0xf1220009  ! 887: STF_R	st	%f24, [%r9, %r8]
	.word 0xe0720009  ! 888: STX_R	stx	%r16, [%r8 + %r9]
	.word 0xfc0a0009  ! 888: LDUB_R	ldub	[%r8 + %r9], %r30
	.word 0x8ba20929  ! 889: FMULs	fmuls	%f8, %f9, %f5
	.word 0xc36a0009  ! 890: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0x12800001  ! 891: BNE	bne  	<label_0x1>
	.word 0xc45a2d48  ! 892: LDX_I	ldx	[%r8 + 0x0d48], %r2
	.word 0xc36a0009  ! 893: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xaa522e48  ! 894: UMUL_I	umul 	%r8, 0x0e48, %r21
	.word 0x38800002  ! 895: BGU	bgu,a	<label_0x2>
	.word 0xca2a0009  ! 897: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xcc020009  ! 897: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0x24800001  ! 898: BLE	ble,a	<label_0x1>
	.word 0xc2120009  ! 899: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0x2a800002  ! 900: BCS	bcs,a	<label_0x2>
	.word 0xc3e21009  ! 901: CASA_I	casa	[%r8] 0x80, %r9, %r1
	.word 0xccfa1009  ! 902: SWAPA_R	swapa	%r6, [%r8 + %r9] 0x80
	.word 0xf49a29b8  ! 903: LDDA_I	ldda	[%r8, + 0x09b8] %asi, %r26
	.word 0x8143c000  ! 904: STBAR	stbar
	.word 0xc6a22b24  ! 905: STWA_I	stwa	%r3, [%r8 + 0x0b24] %asi
	.word 0x83a20929  ! 906: FMULs	fmuls	%f8, %f9, %f1
	.word 0xca520009  ! 907: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xc8a21009  ! 908: STWA_R	stwa	%r4, [%r8 + %r9] 0x80
	.word 0xa2720009  ! 909: UDIV_R	udiv 	%r8, %r9, %r17
	.word 0xc4220009  ! 911: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xed020009  ! 911: LDF_R	ld	[%r8, %r9], %f22
	.word 0x8da209a9  ! 912: FDIVs	fdivs	%f8, %f9, %f6
	.word 0xc36a0009  ! 913: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xcaf21009  ! 914: STXA_R	stxa	%r5, [%r8 + %r9] 0x80
	.word 0xca420009  ! 915: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xc3ea1009  ! 916: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xea0a24f0  ! 917: LDUB_I	ldub	[%r8 + 0x04f0], %r21
	.word 0x36800001  ! 918: BGE	bge,a	<label_0x1>
	.word 0xb64a0009  ! 919: MULX_R	mulx 	%r8, %r9, %r27
	.word 0x8143e05c  ! 920: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0xcc220009  ! 922: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc51a0009  ! 922: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xc86a0009  ! 923: LDSTUB_R	ldstub	%r4, [%r8 + %r9]
	.word 0xd62a0009  ! 925: STB_R	stb	%r11, [%r8 + %r9]
	.word 0xc5020009  ! 925: LDF_R	ld	[%r8, %r9], %f2
	.word 0xc36a0009  ! 926: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xd73a2208  ! 927: STDF_I	std	%f11, [0x0208, %r8]
	.word 0xecb22bf0  ! 928: STHA_I	stha	%r22, [%r8 + 0x0bf0] %asi
	.word 0xce320009  ! 930: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc44a0009  ! 930: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xcbe21009  ! 931: CASA_I	casa	[%r8] 0x80, %r9, %r5
	.word 0x89a208a9  ! 932: FSUBs	fsubs	%f8, %f9, %f4
	.word 0xac4a0009  ! 933: MULX_R	mulx 	%r8, %r9, %r22
	.word 0xacf22570  ! 934: UDIVcc_I	udivcc 	%r8, 0x0570, %r22
	.word 0x8a4a0009  ! 935: MULX_R	mulx 	%r8, %r9, %r5
	.word 0xcc5221b8  ! 936: LDSH_I	ldsh	[%r8 + 0x01b8], %r6
	.word 0xc4f22bb0  ! 937: STXA_I	stxa	%r2, [%r8 + 0x0bb0] %asi
	.word 0xc49225e4  ! 938: LDUHA_I	lduha	[%r8, + 0x05e4] %asi, %r2
	.word 0xca5a0009  ! 939: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0x86720009  ! 940: UDIV_R	udiv 	%r8, %r9, %r3
	.word 0xcb2225c0  ! 941: STF_I	st	%f5, [0x05c0, %r8]
	.word 0x14800002  ! 942: BG	bg  	<label_0x2>
	.word 0x8143c000  ! 943: STBAR	stbar
	.word 0xcf020009  ! 944: LDF_R	ld	[%r8, %r9], %f7
	.word 0x8143e032  ! 945: MEMBAR	membar	#StoreLoad | #Lookaside | #MemIssue 
	.word 0xc49a2e20  ! 946: LDDA_I	ldda	[%r8, + 0x0e20] %asi, %r2
	.word 0xdbf22009  ! 947: CASXA_R	casxa	[%r8]%asi, %r9, %r13
	.word 0x9a5a0009  ! 948: SMUL_R	smul 	%r8, %r9, %r13
	.word 0x8cf20009  ! 949: UDIVcc_R	udivcc 	%r8, %r9, %r6
	.word 0xc3ea2600  ! 950: PREFETCHA_I	prefetcha	[%r8, + 0x0600] %asi, #one_read
	.word 0xb25a2484  ! 951: SMUL_I	smul 	%r8, 0x0484, %r25
	.word 0xb5a208a9  ! 952: FSUBs	fsubs	%f8, %f9, %f26
	.word 0xc8c21009  ! 953: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r4
	.word 0xcc122d08  ! 954: LDUH_I	lduh	[%r8 + 0x0d08], %r6
	.word 0xdcb21009  ! 955: STHA_R	stha	%r14, [%r8 + %r9] 0x80
	.word 0xc3ea1009  ! 956: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xcfe21009  ! 957: CASA_I	casa	[%r8] 0x80, %r9, %r7
	.word 0xeada1009  ! 958: LDXA_R	ldxa	[%r8, %r9] 0x80, %r21
	.word 0xf0b22e58  ! 959: STHA_I	stha	%r24, [%r8 + 0x0e58] %asi
	.word 0x8cf20009  ! 960: UDIVcc_R	udivcc 	%r8, %r9, %r6
	.word 0x8e4a2b08  ! 961: MULX_I	mulx 	%r8, 0x0b08, %r7
	.word 0xf66a0009  ! 962: LDSTUB_R	ldstub	%r27, [%r8 + %r9]
	.word 0x8143e04a  ! 963: MEMBAR	membar	#StoreLoad | #StoreStore | #Sync 
	.word 0xca7a0009  ! 964: SWAP_R	swap	%r5, [%r8 + %r9]
	.word 0x8143c000  ! 965: STBAR	stbar
	.word 0xc36a2a64  ! 966: PREFETCH_I	prefetch	[%r8 + 0x0a64], #one_read
	.word 0xf522299c  ! 967: STF_I	st	%f26, [0x099c, %r8]
	.word 0xe8ba2a88  ! 968: STDA_I	stda	%r20, [%r8 + 0x0a88] %asi
	.word 0xc4320009  ! 970: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xda020009  ! 970: LDUW_R	lduw	[%r8 + %r9], %r13
	.word 0xc3ea1009  ! 971: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xcde21009  ! 972: CASA_I	casa	[%r8] 0x80, %r9, %r6
	.word 0x2c800001  ! 973: BNEG	bneg,a	<label_0x1>
	.word 0xc86a0009  ! 974: LDSTUB_R	ldstub	%r4, [%r8 + %r9]
	.word 0xf9f21009  ! 975: CASXA_I	casxa	[%r8] 0x80, %r9, %r28
	.word 0xc3ea1009  ! 976: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc4821009  ! 977: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r2
	.word 0xcd22250c  ! 978: STF_I	st	%f6, [0x050c, %r8]
	.word 0x8cda0009  ! 979: SMULcc_R	smulcc 	%r8, %r9, %r6
	.word 0x9e5a2e84  ! 980: SMUL_I	smul 	%r8, 0x0e84, %r15
	.word 0xce6a0009  ! 981: LDSTUB_R	ldstub	%r7, [%r8 + %r9]
	.word 0x12800001  ! 982: BNE	bne  	<label_0x1>
	.word 0x82f22c50  ! 983: UDIVcc_I	udivcc 	%r8, 0x0c50, %r1
	.word 0xceb21009  ! 984: STHA_R	stha	%r7, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 985: STBAR	stbar
	.word 0xc4c21009  ! 986: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r2
	.word 0x00800001  ! 987: BN	bn  	<label_0x1>
	.word 0x12800001  ! 988: BNE	bne  	<label_0x1>
	.word 0x06ca0001  ! 989: BRLZ	brlz  ,pt	%8,<label_0xa0001>
	.word 0x8143c000  ! 990: STBAR	stbar
	.word 0xe7220009  ! 992: STF_R	st	%f19, [%r9, %r8]
	.word 0xc2720009  ! 993: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc8520009  ! 993: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xc36a0009  ! 994: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc6220009  ! 996: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc4120009  ! 996: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0x88fa29b0  ! 997: SDIVcc_I	sdivcc 	%r8, 0x09b0, %r4
	.word 0xc3ea1009  ! 998: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xdac22744  ! 999: LDSWA_I	ldswa	[%r8, + 0x0744] %asi, %r13
	.word 0xc3ea1009  ! 1000: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc36a28e0  ! 1001: PREFETCH_I	prefetch	[%r8 + 0x08e0], #one_read
	.word 0x864a0009  ! 1002: MULX_R	mulx 	%r8, %r9, %r3
	.word 0x8a4a0009  ! 1003: MULX_R	mulx 	%r8, %r9, %r5
	.word 0xc6f22430  ! 1004: STXA_I	stxa	%r3, [%r8 + 0x0430] %asi
	.word 0xba4a0009  ! 1005: MULX_R	mulx 	%r8, %r9, %r29
	.word 0xca220009  ! 1007: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc8420009  ! 1007: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xc40a2a94  ! 1008: LDUB_I	ldub	[%r8 + 0x0a94], %r2
	.word 0x8cda0009  ! 1009: SMULcc_R	smulcc 	%r8, %r9, %r6
	.word 0xc36a203c  ! 1010: PREFETCH_I	prefetch	[%r8 + 0x003c], #one_read
	.word 0x8c5a2724  ! 1011: SMUL_I	smul 	%r8, 0x0724, %r6
	.word 0xdc720009  ! 1013: STX_R	stx	%r14, [%r8 + %r9]
	.word 0xc31a0009  ! 1013: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xcc320009  ! 1015: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xcc420009  ! 1015: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xfcba2c00  ! 1016: STDA_I	stda	%r30, [%r8 + 0x0c00] %asi
	.word 0x8143c000  ! 1017: STBAR	stbar
	.word 0x87a208a9  ! 1018: FSUBs	fsubs	%f8, %f9, %f3
	.word 0xc36a0009  ! 1019: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc6220009  ! 1021: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xfa120009  ! 1021: LDUH_R	lduh	[%r8 + %r9], %r29
	.word 0x8143c000  ! 1022: STBAR	stbar
	.word 0xc7e22009  ! 1023: CASA_R	casa	[%r8] %asi, %r9, %r3
	.word 0xc73a2000  ! 1024: STDF_I	std	%f3, [0x0000, %r8]
	.word 0xc4ea267c  ! 1025: LDSTUBA_I	ldstuba	%r2, [%r8 + 0x067c] %asi
	.word 0xa66a0009  ! 1026: UDIVX_R	udivx 	%r8, %r9, %r19
	.word 0xda4a2bec  ! 1027: LDSB_I	ldsb	[%r8 + 0x0bec], %r13
	.word 0x8c6a0009  ! 1028: UDIVX_R	udivx 	%r8, %r9, %r6
	.word 0xc24a0009  ! 1029: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0x8143c000  ! 1030: STBAR	stbar
	.word 0xe07a0009  ! 1031: SWAP_R	swap	%r16, [%r8 + %r9]
	.word 0x00800001  ! 1032: BN	bn  	<label_0x1>
	.word 0xc8821009  ! 1033: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r4
	.word 0xc3ea1009  ! 1034: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xf4220009  ! 1036: STW_R	stw	%r26, [%r8 + %r9]
	.word 0xc84a0009  ! 1036: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0x8143e02f  ! 1037: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #MemIssue 
	.word 0x86522190  ! 1038: UMUL_I	umul 	%r8, 0x0190, %r3
	.word 0xc3ea27ac  ! 1039: PREFETCHA_I	prefetcha	[%r8, + 0x07ac] %asi, #one_read
	.word 0x82720009  ! 1040: UDIV_R	udiv 	%r8, %r9, %r1
	.word 0xc2fa1009  ! 1041: SWAPA_R	swapa	%r1, [%r8 + %r9] 0x80
	.word 0x99a20929  ! 1042: FMULs	fmuls	%f8, %f9, %f12
	.word 0xc86a230c  ! 1043: LDSTUB_I	ldstub	%r4, [%r8 + 0x030c]
	.word 0xf6f21009  ! 1044: STXA_R	stxa	%r27, [%r8 + %r9] 0x80
	.word 0xbefa0009  ! 1045: SDIVcc_R	sdivcc 	%r8, %r9, %r31
	.word 0xc5e22009  ! 1046: CASA_R	casa	[%r8] %asi, %r9, %r2
	.word 0xfc6a2c54  ! 1047: LDSTUB_I	ldstub	%r30, [%r8 + 0x0c54]
	.word 0xc3e22009  ! 1048: CASA_R	casa	[%r8] %asi, %r9, %r1
	.word 0x38800001  ! 1049: BGU	bgu,a	<label_0x1>
	.word 0xf0ea2b80  ! 1050: LDSTUBA_I	ldstuba	%r24, [%r8 + 0x0b80] %asi
	.word 0xc8220009  ! 1052: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc81a0009  ! 1052: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xc67a2714  ! 1053: SWAP_I	swap	%r3, [%r8 + 0x0714]
	.word 0x8143e063  ! 1054: MEMBAR	membar	#LoadLoad | #StoreLoad | #MemIssue | #Sync 
	.word 0xcd020009  ! 1055: LDF_R	ld	[%r8, %r9], %f6
	.word 0xc7222154  ! 1056: STF_I	st	%f3, [0x0154, %r8]
	.word 0x987a0009  ! 1057: SDIV_R	sdiv 	%r8, %r9, %r12
	.word 0xc6320009  ! 1059: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc01a0009  ! 1059: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0xc6220009  ! 1061: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xf2420009  ! 1061: LDSW_R	ldsw	[%r8 + %r9], %r25
	.word 0x02800001  ! 1062: BE	be  	<label_0x1>
	.word 0x89a209a9  ! 1063: FDIVs	fdivs	%f8, %f9, %f4
	.word 0xc53a0009  ! 1065: STDF_R	std	%f2, [%r9, %r8]
	.word 0xcc720009  ! 1066: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xe85a0009  ! 1066: LDX_R	ldx	[%r8 + %r9], %r20
	.word 0xda0a0009  ! 1067: LDUB_R	ldub	[%r8 + %r9], %r13
	.word 0xc7222124  ! 1068: STF_I	st	%f3, [0x0124, %r8]
	.word 0x24800001  ! 1069: BLE	ble,a	<label_0x1>
	.word 0xf24221ac  ! 1070: LDSW_I	ldsw	[%r8 + 0x01ac], %r25
	.word 0x2c800001  ! 1071: BNEG	bneg,a	<label_0x1>
	.word 0x8143c000  ! 1072: STBAR	stbar
	.word 0xc68a2244  ! 1073: LDUBA_I	lduba	[%r8, + 0x0244] %asi, %r3
	.word 0xc6020009  ! 1074: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xcb220009  ! 1076: STF_R	st	%f5, [%r9, %r8]
	.word 0xc8720009  ! 1077: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xf4420009  ! 1077: LDSW_R	ldsw	[%r8 + %r9], %r26
	.word 0xc4ea1009  ! 1078: LDSTUBA_R	ldstuba	%r2, [%r8 + %r9] 0x80
	.word 0xc42a0009  ! 1080: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xe6120009  ! 1080: LDUH_R	lduh	[%r8 + %r9], %r19
	.word 0xc3ea26cc  ! 1081: PREFETCHA_I	prefetcha	[%r8, + 0x06cc] %asi, #one_read
	.word 0xcaea2f08  ! 1082: LDSTUBA_I	ldstuba	%r5, [%r8 + 0x0f08] %asi
	.word 0xc3ea2db0  ! 1083: PREFETCHA_I	prefetcha	[%r8, + 0x0db0] %asi, #one_read
	.word 0xcada1009  ! 1084: LDXA_R	ldxa	[%r8, %r9] 0x80, %r5
	.word 0x3a800001  ! 1085: BCC	bcc,a	<label_0x1>
	.word 0xc22a0009  ! 1087: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc81a0009  ! 1087: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xc4120009  ! 1088: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xcaf22068  ! 1089: STXA_I	stxa	%r5, [%r8 + 0x0068] %asi
	.word 0xc3ea1009  ! 1090: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xccc22bbc  ! 1091: LDSWA_I	ldswa	[%r8, + 0x0bbc] %asi, %r6
	.word 0xcaf22418  ! 1092: STXA_I	stxa	%r5, [%r8 + 0x0418] %asi
	.word 0xc8ca1009  ! 1093: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r4
	.word 0xc62a0009  ! 1095: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xe20a0009  ! 1095: LDUB_R	ldub	[%r8 + %r9], %r17
	.word 0x9e6a0009  ! 1096: UDIVX_R	udivx 	%r8, %r9, %r15
	.word 0xc4522540  ! 1097: LDSH_I	ldsh	[%r8 + 0x0540], %r2
	.word 0x8f220009  ! 1098: MULScc_R	mulscc 	%r8, %r9, %r7
	.word 0x30800002  ! 1099: BA	ba,a	<label_0x2>
	.word 0xc3ea1009  ! 1100: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x1a800001  ! 1101: BCC	bcc  	<label_0x1>
	.word 0x84f22b2c  ! 1102: UDIVcc_I	udivcc 	%r8, 0x0b2c, %r2
	.word 0xf93a0009  ! 1104: STDF_R	std	%f28, [%r9, %r8]
	.word 0xca720009  ! 1105: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc2120009  ! 1105: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xc45a0009  ! 1106: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0x8143e038  ! 1107: MEMBAR	membar	#StoreStore | #Lookaside | #MemIssue 
	.word 0xc22a0009  ! 1109: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc25a0009  ! 1109: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0x86520009  ! 1110: UMUL_R	umul 	%r8, %r9, %r3
	.word 0xafa20829  ! 1111: FADDs	fadds	%f8, %f9, %f23
	.word 0xccba2dd0  ! 1112: STDA_I	stda	%r6, [%r8 + 0x0dd0] %asi
	.word 0xc45a0009  ! 1113: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xce5229c4  ! 1114: LDSH_I	ldsh	[%r8 + 0x09c4], %r7
	.word 0x82d22814  ! 1115: UMULcc_I	umulcc 	%r8, 0x0814, %r1
	.word 0x89a208a9  ! 1116: FSUBs	fsubs	%f8, %f9, %f4
	.word 0xdb3a0009  ! 1118: STDF_R	std	%f13, [%r9, %r8]
	.word 0xc6720009  ! 1119: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xca5a0009  ! 1119: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0x8ad22a00  ! 1120: UMULcc_I	umulcc 	%r8, 0x0a00, %r5
	.word 0xc36a2730  ! 1121: PREFETCH_I	prefetch	[%r8 + 0x0730], #one_read
	.word 0xca5a2680  ! 1122: LDX_I	ldx	[%r8 + 0x0680], %r5
	.word 0xfc2a0009  ! 1124: STB_R	stb	%r30, [%r8 + %r9]
	.word 0xc7020009  ! 1124: LDF_R	ld	[%r8, %r9], %f3
	.word 0xe24a23cc  ! 1125: LDSB_I	ldsb	[%r8 + 0x03cc], %r17
	.word 0xc22a0009  ! 1127: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xcc420009  ! 1127: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xc4921009  ! 1128: LDUHA_R	lduha	[%r8, %r9] 0x80, %r2
	.word 0xce220009  ! 1130: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xce120009  ! 1130: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xc7f22009  ! 1131: CASXA_R	casxa	[%r8]%asi, %r9, %r3
	.word 0x87a20829  ! 1132: FADDs	fadds	%f8, %f9, %f3
	.word 0xf7220009  ! 1134: STF_R	st	%f27, [%r9, %r8]
	.word 0xf6720009  ! 1135: STX_R	stx	%r27, [%r8 + %r9]
	.word 0xea420009  ! 1135: LDSW_R	ldsw	[%r8 + %r9], %r21
	.word 0x8143c000  ! 1136: STBAR	stbar
	.word 0x8143c000  ! 1137: STBAR	stbar
	.word 0x24ca0001  ! 1138: BRLEZ	brlez,a,pt	%8,<label_0xa0001>
	.word 0xce020009  ! 1139: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0x8143c000  ! 1140: STBAR	stbar
	.word 0x8e520009  ! 1141: UMUL_R	umul 	%r8, %r9, %r7
	.word 0xc36a2e84  ! 1142: PREFETCH_I	prefetch	[%r8 + 0x0e84], #one_read
	.word 0xce2a0009  ! 1144: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc6020009  ! 1144: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0x8c520009  ! 1145: UMUL_R	umul 	%r8, %r9, %r6
	.word 0xc4b21009  ! 1146: STHA_R	stha	%r2, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 1147: STBAR	stbar
	.word 0xe2320009  ! 1149: STH_R	sth	%r17, [%r8 + %r9]
	.word 0xce120009  ! 1149: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xd8921009  ! 1150: LDUHA_R	lduha	[%r8, %r9] 0x80, %r12
	.word 0xc36a0009  ! 1151: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xa2720009  ! 1152: UDIV_R	udiv 	%r8, %r9, %r17
	.word 0x8c6a299c  ! 1153: UDIVX_I	udivx 	%r8, 0x099c, %r6
	.word 0xc4220009  ! 1155: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc2420009  ! 1155: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xc36a2f7c  ! 1156: PREFETCH_I	prefetch	[%r8 + 0x0f7c], #one_read
	.word 0x2c800001  ! 1157: BNEG	bneg,a	<label_0x1>
	.word 0xf7220009  ! 1159: STF_R	st	%f27, [%r9, %r8]
	.word 0xc2720009  ! 1160: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xf2520009  ! 1160: LDSH_R	ldsh	[%r8 + %r9], %r25
	.word 0xf8a21009  ! 1161: STWA_R	stwa	%r28, [%r8 + %r9] 0x80
	.word 0x8143e04f  ! 1162: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #Sync 
	.word 0xc0ba1009  ! 1163: STDA_R	stda	%r0, [%r8 + %r9] 0x80
	.word 0x8f6a0009  ! 1164: SDIVX_R	sdivx	%r8, %r9, %r7
	.word 0xc4da2898  ! 1165: LDXA_I	ldxa	[%r8, + 0x0898] %asi, %r2
	.word 0xc92225d0  ! 1166: STF_I	st	%f4, [0x05d0, %r8]
	.word 0x2e800002  ! 1167: BVS	bvs,a	<label_0x2>
	.word 0xf4ea23e4  ! 1168: LDSTUBA_I	ldstuba	%r26, [%r8 + 0x03e4] %asi
	.word 0xc8320009  ! 1170: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xde020009  ! 1170: LDUW_R	lduw	[%r8 + %r9], %r15
	.word 0xcc320009  ! 1172: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc4020009  ! 1172: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xac5a0009  ! 1173: SMUL_R	smul 	%r8, %r9, %r22
	.word 0xc2f225e8  ! 1174: STXA_I	stxa	%r1, [%r8 + 0x05e8] %asi
	.word 0xf6aa2cb8  ! 1175: STBA_I	stba	%r27, [%r8 + 0x0cb8] %asi
	.word 0x8a520009  ! 1176: UMUL_R	umul 	%r8, %r9, %r5
	.word 0xfe320009  ! 1178: STH_R	sth	%r31, [%r8 + %r9]
	.word 0xc2420009  ! 1178: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0x85a209a9  ! 1179: FDIVs	fdivs	%f8, %f9, %f2
	.word 0xc8320009  ! 1181: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc40a0009  ! 1181: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xca2a0009  ! 1183: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc64a0009  ! 1183: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xccf223b8  ! 1184: STXA_I	stxa	%r6, [%r8 + 0x03b8] %asi
	.word 0xc36a0009  ! 1185: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc7220009  ! 1187: STF_R	st	%f3, [%r9, %r8]
	.word 0xcc720009  ! 1188: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xda0a0009  ! 1188: LDUB_R	ldub	[%r8 + %r9], %r13
	.word 0xf73a0009  ! 1190: STDF_R	std	%f27, [%r9, %r8]
	.word 0xca720009  ! 1191: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc60a0009  ! 1191: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xa5220009  ! 1192: MULScc_R	mulscc 	%r8, %r9, %r18
	.word 0xfcca2820  ! 1193: LDSBA_I	ldsba	[%r8, + 0x0820] %asi, %r30
	.word 0x8143e031  ! 1194: MEMBAR	membar	#LoadLoad | #Lookaside | #MemIssue 
	.word 0xcc320009  ! 1196: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xcf1a0009  ! 1196: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xc4f21009  ! 1197: STXA_R	stxa	%r2, [%r8 + %r9] 0x80
	.word 0x8a7a0009  ! 1198: SDIV_R	sdiv 	%r8, %r9, %r5
	.word 0xc67a0009  ! 1199: SWAP_R	swap	%r3, [%r8 + %r9]
	.word 0xe01a2cd8  ! 1200: LDD_I	ldd	[%r8 + 0x0cd8], %r16
	.word 0x826a2fd4  ! 1201: UDIVX_I	udivx 	%r8, 0x0fd4, %r1
	.word 0xc8320009  ! 1203: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xcc5a0009  ! 1203: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xcc220009  ! 1205: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xe2120009  ! 1205: LDUH_R	lduh	[%r8 + %r9], %r17
	.word 0xdac22624  ! 1206: LDSWA_I	ldswa	[%r8, + 0x0624] %asi, %r13
	.word 0xe4f21009  ! 1207: STXA_R	stxa	%r18, [%r8 + %r9] 0x80
	.word 0x856a2158  ! 1208: SDIVX_I	sdivx	%r8, 0x0158, %r2
	.word 0xcc1a0009  ! 1209: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xc4aa24b8  ! 1210: STBA_I	stba	%r2, [%r8 + 0x04b8] %asi
	.word 0xc85a0009  ! 1211: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0x8a522cb4  ! 1212: UMUL_I	umul 	%r8, 0x0cb4, %r5
	.word 0xc3ea2034  ! 1213: PREFETCHA_I	prefetcha	[%r8, + 0x0034] %asi, #one_read
	.word 0xc4ba1009  ! 1214: STDA_R	stda	%r2, [%r8 + %r9] 0x80
	.word 0xe4ea289c  ! 1215: LDSTUBA_I	ldstuba	%r18, [%r8 + 0x089c] %asi
	.word 0xca420009  ! 1216: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xf0ca2c00  ! 1217: LDSBA_I	ldsba	[%r8, + 0x0c00] %asi, %r24
	.word 0xc8320009  ! 1219: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc71a0009  ! 1219: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0x89a20929  ! 1220: FMULs	fmuls	%f8, %f9, %f4
	.word 0xee220009  ! 1222: STW_R	stw	%r23, [%r8 + %r9]
	.word 0xcb1a0009  ! 1222: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0x84f20009  ! 1223: UDIVcc_R	udivcc 	%r8, %r9, %r2
	.word 0xfe022e20  ! 1224: LDUW_I	lduw	[%r8 + 0x0e20], %r31
	.word 0xaef20009  ! 1225: UDIVcc_R	udivcc 	%r8, %r9, %r23
	.word 0x2e800002  ! 1226: BVS	bvs,a	<label_0x2>
	.word 0xce2a0009  ! 1228: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xca020009  ! 1228: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xec320009  ! 1230: STH_R	sth	%r22, [%r8 + %r9]
	.word 0xed1a0009  ! 1230: LDDF_R	ldd	[%r8, %r9], %f22
	.word 0x8143e053  ! 1231: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside | #Sync 
	.word 0x8143e052  ! 1232: MEMBAR	membar	#StoreLoad | #Lookaside | #Sync 
	.word 0xb96a2e70  ! 1233: SDIVX_I	sdivx	%r8, 0x0e70, %r28
	.word 0xd8ba2170  ! 1234: STDA_I	stda	%r12, [%r8 + 0x0170] %asi
	.word 0x86d20009  ! 1235: UMULcc_R	umulcc 	%r8, %r9, %r3
	.word 0xc4ba1009  ! 1236: STDA_R	stda	%r2, [%r8 + %r9] 0x80
	.word 0xec9a2738  ! 1237: LDDA_I	ldda	[%r8, + 0x0738] %asi, %r22
	.word 0xe2b21009  ! 1238: STHA_R	stha	%r17, [%r8 + %r9] 0x80
	.word 0x8ed20009  ! 1239: UMULcc_R	umulcc 	%r8, %r9, %r7
	.word 0xe2c21009  ! 1240: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r17
	.word 0xfb3a0009  ! 1242: STDF_R	std	%f29, [%r9, %r8]
	.word 0xce720009  ! 1243: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xce420009  ! 1243: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xc8220009  ! 1245: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc6520009  ! 1245: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0x86d22d48  ! 1246: UMULcc_I	umulcc 	%r8, 0x0d48, %r3
	.word 0x0e800001  ! 1247: BVS	bvs  	<label_0x1>
	.word 0xccba1009  ! 1248: STDA_R	stda	%r6, [%r8 + %r9] 0x80
	.word 0xcab22bb4  ! 1249: STHA_I	stha	%r5, [%r8 + 0x0bb4] %asi
	.word 0xc93a2488  ! 1250: STDF_I	std	%f4, [0x0488, %r8]
	.word 0x36800002  ! 1251: BGE	bge,a	<label_0x2>
	.word 0x8143e021  ! 1252: MEMBAR	membar	#LoadLoad | #MemIssue 
	.word 0xc2220009  ! 1254: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xcf020009  ! 1254: LDF_R	ld	[%r8, %r9], %f7
	.word 0xe8f22ba8  ! 1255: STXA_I	stxa	%r20, [%r8 + 0x0ba8] %asi
	.word 0xcc1a2220  ! 1256: LDD_I	ldd	[%r8 + 0x0220], %r6
	.word 0xc0ba1009  ! 1257: STDA_R	stda	%r0, [%r8 + %r9] 0x80
	.word 0xbc5a2554  ! 1258: SMUL_I	smul 	%r8, 0x0554, %r30
	.word 0xc6320009  ! 1260: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc4120009  ! 1260: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xc3ea2a34  ! 1261: PREFETCHA_I	prefetcha	[%r8, + 0x0a34] %asi, #one_read
	.word 0xc26a2560  ! 1262: LDSTUB_I	ldstub	%r1, [%r8 + 0x0560]
	.word 0x8143e064  ! 1263: MEMBAR	membar	#LoadStore | #MemIssue | #Sync 
	.word 0xc2220009  ! 1265: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc6020009  ! 1265: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0x86d20009  ! 1266: UMULcc_R	umulcc 	%r8, %r9, %r3
	.word 0xf6020009  ! 1267: LDUW_R	lduw	[%r8 + %r9], %r27
	.word 0xada208a9  ! 1268: FSUBs	fsubs	%f8, %f9, %f22
	.word 0xc4aa1009  ! 1269: STBA_R	stba	%r2, [%r8 + %r9] 0x80
	.word 0xbcfa0009  ! 1270: SDIVcc_R	sdivcc 	%r8, %r9, %r30
	.word 0xd86a0009  ! 1271: LDSTUB_R	ldstub	%r12, [%r8 + %r9]
	.word 0xc2b227d8  ! 1272: STHA_I	stha	%r1, [%r8 + 0x07d8] %asi
	.word 0x8143e004  ! 1273: MEMBAR	membar	#LoadStore 
	.word 0xc36a0009  ! 1274: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc36a0009  ! 1275: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xccca2a88  ! 1276: LDSBA_I	ldsba	[%r8, + 0x0a88] %asi, %r6
	.word 0xc8f21009  ! 1277: STXA_R	stxa	%r4, [%r8 + %r9] 0x80
	.word 0xee320009  ! 1279: STH_R	sth	%r23, [%r8 + %r9]
	.word 0xcb1a0009  ! 1279: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0x864a0009  ! 1280: MULX_R	mulx 	%r8, %r9, %r3
	.word 0xbef20009  ! 1281: UDIVcc_R	udivcc 	%r8, %r9, %r31
	.word 0x0ec20001  ! 1282: BRGEZ	brgez  ,nt	%8,<label_0x20001>
	.word 0x8143e047  ! 1283: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Sync 
	.word 0xc3ea266c  ! 1284: PREFETCHA_I	prefetcha	[%r8, + 0x066c] %asi, #one_read
	.word 0xca821009  ! 1285: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r5
	.word 0xc6aa1009  ! 1286: STBA_R	stba	%r3, [%r8 + %r9] 0x80
	.word 0xeeea1009  ! 1287: LDSTUBA_R	ldstuba	%r23, [%r8 + %r9] 0x80
	.word 0xca120009  ! 1288: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xce020009  ! 1289: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xc49a2930  ! 1290: LDDA_I	ldda	[%r8, + 0x0930] %asi, %r2
	.word 0xc36a0009  ! 1291: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0x8143c000  ! 1292: STBAR	stbar
	.word 0xca2a0009  ! 1294: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xda520009  ! 1294: LDSH_R	ldsh	[%r8 + %r9], %r13
	.word 0x2c800001  ! 1295: BNEG	bneg,a	<label_0x1>
	.word 0xea2a0009  ! 1297: STB_R	stb	%r21, [%r8 + %r9]
	.word 0xfc420009  ! 1297: LDSW_R	ldsw	[%r8 + %r9], %r30
	.word 0xc9e22009  ! 1298: CASA_R	casa	[%r8] %asi, %r9, %r4
	.word 0x0ec20001  ! 1299: BRGEZ	brgez  ,nt	%8,<label_0x20001>
	.word 0xf62a0009  ! 1301: STB_R	stb	%r27, [%r8 + %r9]
	.word 0xd6420009  ! 1301: LDSW_R	ldsw	[%r8 + %r9], %r11
	.word 0x82d20009  ! 1302: UMULcc_R	umulcc 	%r8, %r9, %r1
	.word 0x8fa209a9  ! 1303: FDIVs	fdivs	%f8, %f9, %f7
	.word 0x88fa0009  ! 1304: SDIVcc_R	sdivcc 	%r8, %r9, %r4
	.word 0xa9a20929  ! 1305: FMULs	fmuls	%f8, %f9, %f20
	.word 0xa8da2994  ! 1306: SMULcc_I	smulcc 	%r8, 0x0994, %r20
	.word 0x8143e04b  ! 1307: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Sync 
	.word 0xc7220009  ! 1309: STF_R	st	%f3, [%r9, %r8]
	.word 0xc8720009  ! 1310: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xcc1a0009  ! 1310: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0x84f20009  ! 1311: UDIVcc_R	udivcc 	%r8, %r9, %r2
	.word 0xe2fa1009  ! 1312: SWAPA_R	swapa	%r17, [%r8 + %r9] 0x80
	.word 0x84722cb4  ! 1313: UDIV_I	udiv 	%r8, 0x0cb4, %r2
	.word 0xc4720009  ! 1315: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xcc1a0009  ! 1315: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xc4ba2078  ! 1316: STDA_I	stda	%r2, [%r8 + 0x0078] %asi
	.word 0x8f6a2944  ! 1317: SDIVX_I	sdivx	%r8, 0x0944, %r7
	.word 0xca2a0009  ! 1319: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc6020009  ! 1319: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xfeb22e4c  ! 1320: STHA_I	stha	%r31, [%r8 + 0x0e4c] %asi
	.word 0xc4ea1009  ! 1321: LDSTUBA_R	ldstuba	%r2, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 1322: STBAR	stbar
	.word 0x8143c000  ! 1323: STBAR	stbar
	.word 0xef3a2f30  ! 1324: STDF_I	std	%f23, [0x0f30, %r8]
	.word 0xcc6a2fd0  ! 1325: LDSTUB_I	ldstub	%r6, [%r8 + 0x0fd0]
	.word 0xc8ba27b8  ! 1326: STDA_I	stda	%r4, [%r8 + 0x07b8] %asi
	.word 0xe2b22af4  ! 1327: STHA_I	stha	%r17, [%r8 + 0x0af4] %asi
	.word 0x8e7a2fe8  ! 1328: SDIV_I	sdiv 	%r8, 0x0fe8, %r7
	.word 0xc4ba1009  ! 1329: STDA_R	stda	%r2, [%r8 + %r9] 0x80
	.word 0x8e520009  ! 1330: UMUL_R	umul 	%r8, %r9, %r7
	.word 0x8143e04c  ! 1331: MEMBAR	membar	#LoadStore | #StoreStore | #Sync 
	.word 0x86720009  ! 1332: UDIV_R	udiv 	%r8, %r9, %r3
	.word 0xe2320009  ! 1334: STH_R	sth	%r17, [%r8 + %r9]
	.word 0xc91a0009  ! 1334: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0x8143c000  ! 1335: STBAR	stbar
	.word 0xca821009  ! 1336: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r5
	.word 0xccb21009  ! 1337: STHA_R	stha	%r6, [%r8 + %r9] 0x80
	.word 0xef3a2f58  ! 1338: STDF_I	std	%f23, [0x0f58, %r8]
	.word 0xc9220009  ! 1340: STF_R	st	%f4, [%r9, %r8]
	.word 0xf6720009  ! 1341: STX_R	stx	%r27, [%r8 + %r9]
	.word 0xc41a0009  ! 1341: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xe11a2168  ! 1342: LDDF_I	ldd	[%r8, 0x0168], %f16
	.word 0xcea22720  ! 1343: STWA_I	stwa	%r7, [%r8 + 0x0720] %asi
	.word 0xe62a0009  ! 1345: STB_R	stb	%r19, [%r8 + %r9]
	.word 0xca5a0009  ! 1345: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0x8fa209a9  ! 1346: FDIVs	fdivs	%f8, %f9, %f7
	.word 0xa3220009  ! 1347: MULScc_R	mulscc 	%r8, %r9, %r17
	.word 0xc2b21009  ! 1348: STHA_R	stha	%r1, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 1349: STBAR	stbar
	.word 0x8c5a0009  ! 1350: SMUL_R	smul 	%r8, %r9, %r6
	.word 0x0c800002  ! 1351: BNEG	bneg  	<label_0x2>
	.word 0x8143c000  ! 1352: STBAR	stbar
	.word 0xc36a2458  ! 1353: PREFETCH_I	prefetch	[%r8 + 0x0458], #one_read
	.word 0xc36a0009  ! 1354: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc64a0009  ! 1355: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xbf6a2600  ! 1356: SDIVX_I	sdivx	%r8, 0x0600, %r31
	.word 0xcd222514  ! 1357: STF_I	st	%f6, [0x0514, %r8]
	.word 0x88fa28f0  ! 1358: SDIVcc_I	sdivcc 	%r8, 0x08f0, %r4
	.word 0x8143c000  ! 1359: STBAR	stbar
	.word 0xc8220009  ! 1361: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xf9020009  ! 1361: LDF_R	ld	[%r8, %r9], %f28
	.word 0x8143c000  ! 1362: STBAR	stbar
	.word 0xc5e21009  ! 1363: CASA_I	casa	[%r8] 0x80, %r9, %r2
	.word 0xcc8a1009  ! 1364: LDUBA_R	lduba	[%r8, %r9] 0x80, %r6
	.word 0xc4c22fec  ! 1365: LDSWA_I	ldswa	[%r8, + 0x0fec] %asi, %r2
	.word 0xc3ea1009  ! 1366: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xcb3a0009  ! 1368: STDF_R	std	%f5, [%r9, %r8]
	.word 0xce720009  ! 1369: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xcc4a0009  ! 1369: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xac6a2d78  ! 1370: UDIVX_I	udivx 	%r8, 0x0d78, %r22
	.word 0x8cf20009  ! 1371: UDIVcc_R	udivcc 	%r8, %r9, %r6
	.word 0x8143e010  ! 1372: MEMBAR	membar	#Lookaside 
	.word 0xe4220009  ! 1374: STW_R	stw	%r18, [%r8 + %r9]
	.word 0xc81a0009  ! 1374: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x8143e034  ! 1375: MEMBAR	membar	#LoadStore | #Lookaside | #MemIssue 
	.word 0x8143e001  ! 1376: MEMBAR	membar	#LoadLoad 
	.word 0xc4320009  ! 1378: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xe01a0009  ! 1378: LDD_R	ldd	[%r8 + %r9], %r16
	.word 0x8872291c  ! 1379: UDIV_I	udiv 	%r8, 0x091c, %r4
	.word 0xe8ea298c  ! 1380: LDSTUBA_I	ldstuba	%r20, [%r8 + 0x098c] %asi
	.word 0xce0a0009  ! 1381: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xc4720009  ! 1383: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc4420009  ! 1383: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xca7a2874  ! 1384: SWAP_I	swap	%r5, [%r8 + 0x0874]
	.word 0xd91a2438  ! 1385: LDDF_I	ldd	[%r8, 0x0438], %f12
	.word 0xc4220009  ! 1387: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xcd020009  ! 1387: LDF_R	ld	[%r8, %r9], %f6
	.word 0x8143c000  ! 1388: STBAR	stbar
	.word 0xc2120009  ! 1389: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xb252237c  ! 1390: UMUL_I	umul 	%r8, 0x037c, %r25
	.word 0xec120009  ! 1391: LDUH_R	lduh	[%r8 + %r9], %r22
	.word 0xc81a2528  ! 1392: LDD_I	ldd	[%r8 + 0x0528], %r4
	.word 0xcc0a2414  ! 1393: LDUB_I	ldub	[%r8 + 0x0414], %r6
	.word 0x2cc20001  ! 1394: BRGZ	brgz,a,nt	%8,<label_0x20001>
	.word 0x28800001  ! 1395: BLEU	bleu,a	<label_0x1>
	.word 0xf2320009  ! 1397: STH_R	sth	%r25, [%r8 + %r9]
	.word 0xca4a0009  ! 1397: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0x3e800001  ! 1398: BVC	bvc,a	<label_0x1>
	.word 0xc3ea1009  ! 1399: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xccba1009  ! 1400: STDA_R	stda	%r6, [%r8 + %r9] 0x80
	.word 0xb0720009  ! 1401: UDIV_R	udiv 	%r8, %r9, %r24
	.word 0xc3ea2eb0  ! 1402: PREFETCHA_I	prefetcha	[%r8, + 0x0eb0] %asi, #one_read
	.word 0x84da2af0  ! 1403: SMULcc_I	smulcc 	%r8, 0x0af0, %r2
	.word 0x8143c000  ! 1404: STBAR	stbar
	.word 0xd82a0009  ! 1406: STB_R	stb	%r12, [%r8 + %r9]
	.word 0xca520009  ! 1406: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xc22a0009  ! 1408: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xcc0a0009  ! 1408: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xead22ea4  ! 1409: LDSHA_I	ldsha	[%r8, + 0x0ea4] %asi, %r21
	.word 0xc5220009  ! 1411: STF_R	st	%f2, [%r9, %r8]
	.word 0xc2720009  ! 1412: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xcc0a0009  ! 1412: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xca220009  ! 1414: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc5020009  ! 1414: LDF_R	ld	[%r8, %r9], %f2
	.word 0xc3ea1009  ! 1415: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc3222d7c  ! 1416: STF_I	st	%f1, [0x0d7c, %r8]
	.word 0xcbe22009  ! 1417: CASA_R	casa	[%r8] %asi, %r9, %r5
	.word 0x8143e079  ! 1418: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0x8143e054  ! 1419: MEMBAR	membar	#LoadStore | #Lookaside | #Sync 
	.word 0xc36a278c  ! 1420: PREFETCH_I	prefetch	[%r8 + 0x078c], #one_read
	.word 0xc6da1009  ! 1421: LDXA_R	ldxa	[%r8, %r9] 0x80, %r3
	.word 0xc26a27e4  ! 1422: LDSTUB_I	ldstub	%r1, [%r8 + 0x07e4]
	.word 0xc36a236c  ! 1423: PREFETCH_I	prefetch	[%r8 + 0x036c], #one_read
	.word 0x88fa0009  ! 1424: SDIVcc_R	sdivcc 	%r8, %r9, %r4
	.word 0x9e4a2524  ! 1425: MULX_I	mulx 	%r8, 0x0524, %r15
	.word 0xf67a0009  ! 1426: SWAP_R	swap	%r27, [%r8 + %r9]
	.word 0xc6ea2454  ! 1427: LDSTUBA_I	ldstuba	%r3, [%r8 + 0x0454] %asi
	.word 0xcf222674  ! 1428: STF_I	st	%f7, [0x0674, %r8]
	.word 0x8a722cf0  ! 1429: UDIV_I	udiv 	%r8, 0x0cf0, %r5
	.word 0xda5a0009  ! 1430: LDX_R	ldx	[%r8 + %r9], %r13
	.word 0x8e5a0009  ! 1431: SMUL_R	smul 	%r8, %r9, %r7
	.word 0x84f20009  ! 1432: UDIVcc_R	udivcc 	%r8, %r9, %r2
	.word 0xc3ea1009  ! 1433: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xf8fa2c00  ! 1434: SWAPA_I	swapa	%r28, [%r8 + 0x0c00] %asi
	.word 0xe5220009  ! 1436: STF_R	st	%f18, [%r9, %r8]
	.word 0xce720009  ! 1437: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc8520009  ! 1437: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xc2b22ac8  ! 1438: STHA_I	stha	%r1, [%r8 + 0x0ac8] %asi
	.word 0xc5e21009  ! 1439: CASA_I	casa	[%r8] 0x80, %r9, %r2
	.word 0xa8d20009  ! 1440: UMULcc_R	umulcc 	%r8, %r9, %r20
	.word 0xc3ea2130  ! 1441: PREFETCHA_I	prefetcha	[%r8, + 0x0130] %asi, #one_read
	.word 0x0ec20001  ! 1442: BRGEZ	brgez  ,nt	%8,<label_0x20001>
	.word 0xccea1009  ! 1443: LDSTUBA_R	ldstuba	%r6, [%r8 + %r9] 0x80
	.word 0x8143e02b  ! 1444: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #MemIssue 
	.word 0x8d220009  ! 1445: MULScc_R	mulscc 	%r8, %r9, %r6
	.word 0xc8c21009  ! 1446: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r4
	.word 0xc5222518  ! 1447: STF_I	st	%f2, [0x0518, %r8]
	.word 0x40000001  ! 1448: CALL	call	disp30_1
	.word 0x04800001  ! 1449: BLE	ble  	<label_0x1>
	.word 0x8cfa0009  ! 1450: SDIVcc_R	sdivcc 	%r8, %r9, %r6
	.word 0x8143e03f  ! 1451: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0xe6320009  ! 1453: STH_R	sth	%r19, [%r8 + %r9]
	.word 0xc20a0009  ! 1453: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xd8ba1009  ! 1454: STDA_R	stda	%r12, [%r8 + %r9] 0x80
	.word 0x9da20829  ! 1455: FADDs	fadds	%f8, %f9, %f14
	.word 0x2c800002  ! 1456: BNEG	bneg,a	<label_0x2>
	.word 0xac720009  ! 1457: UDIV_R	udiv 	%r8, %r9, %r22
	.word 0x04c20001  ! 1458: BRLEZ	brlez  ,nt	%8,<label_0x20001>
	.word 0x8143e015  ! 1459: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside 
	.word 0x8a4a2ec8  ! 1460: MULX_I	mulx 	%r8, 0x0ec8, %r5
	.word 0xc3ea1009  ! 1461: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xfefa2ccc  ! 1462: SWAPA_I	swapa	%r31, [%r8 + 0x0ccc] %asi
	.word 0x9c4a2400  ! 1463: MULX_I	mulx 	%r8, 0x0400, %r14
	.word 0x8cfa0009  ! 1464: SDIVcc_R	sdivcc 	%r8, %r9, %r6
	.word 0xc36a28ac  ! 1465: PREFETCH_I	prefetch	[%r8 + 0x08ac], #one_read
	.word 0xc4a21009  ! 1466: STWA_R	stwa	%r2, [%r8 + %r9] 0x80
	.word 0x14800001  ! 1467: BG	bg  	<label_0x1>
	.word 0x8143e000  ! 1468: MEMBAR	membar	
	.word 0x0c800002  ! 1469: BNEG	bneg  	<label_0x2>
	.word 0xce8a1009  ! 1470: LDUBA_R	lduba	[%r8, %r9] 0x80, %r7
	.word 0xaa7a0009  ! 1471: SDIV_R	sdiv 	%r8, %r9, %r21
	.word 0x8143e05e  ! 1472: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0xc3ea279c  ! 1473: PREFETCHA_I	prefetcha	[%r8, + 0x079c] %asi, #one_read
	.word 0xdb222654  ! 1474: STF_I	st	%f13, [0x0654, %r8]
	.word 0x84fa28b4  ! 1475: SDIVcc_I	sdivcc 	%r8, 0x08b4, %r2
	.word 0xc36a2ab4  ! 1476: PREFETCH_I	prefetch	[%r8 + 0x0ab4], #one_read
	.word 0xc4220009  ! 1478: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xfa420009  ! 1478: LDSW_R	ldsw	[%r8 + %r9], %r29
	.word 0x8143c000  ! 1479: STBAR	stbar
	.word 0x8143e029  ! 1480: MEMBAR	membar	#LoadLoad | #StoreStore | #MemIssue 
	.word 0xd7e21009  ! 1481: CASA_I	casa	[%r8] 0x80, %r9, %r11
	.word 0xca821009  ! 1482: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r5
	.word 0x83a208a9  ! 1483: FSUBs	fsubs	%f8, %f9, %f1
	.word 0x8143e004  ! 1484: MEMBAR	membar	#LoadStore 
	.word 0xc42a0009  ! 1486: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xd64a0009  ! 1486: LDSB_R	ldsb	[%r8 + %r9], %r11
	.word 0xca320009  ! 1488: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xca020009  ! 1488: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xf6320009  ! 1490: STH_R	sth	%r27, [%r8 + %r9]
	.word 0xc2420009  ! 1490: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xc2320009  ! 1492: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xcb1a0009  ! 1492: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xc85224d4  ! 1493: LDSH_I	ldsh	[%r8 + 0x04d4], %r4
	.word 0xf2a22c00  ! 1494: STWA_I	stwa	%r25, [%r8 + 0x0c00] %asi
	.word 0x40000002  ! 1495: CALL	call	disp30_2
	.word 0x85a20929  ! 1496: FMULs	fmuls	%f8, %f9, %f2
	.word 0x40000001  ! 1497: CALL	call	disp30_1
	.word 0xf5220009  ! 1499: STF_R	st	%f26, [%r9, %r8]
	.word 0xe2720009  ! 1500: STX_R	stx	%r17, [%r8 + %r9]
	.word 0xce5a0009  ! 1500: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0x8e5a0009  ! 1501: SMUL_R	smul 	%r8, %r9, %r7
	.word 0xca720009  ! 1503: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xde5a0009  ! 1503: LDX_R	ldx	[%r8 + %r9], %r15
	.word 0xc9f22009  ! 1504: CASXA_R	casxa	[%r8]%asi, %r9, %r4
	.word 0x8143e004  ! 1505: MEMBAR	membar	#LoadStore 
	.word 0x83a208a9  ! 1506: FSUBs	fsubs	%f8, %f9, %f1
	.word 0xa1222358  ! 1507: MULScc_I	mulscc 	%r8, 0x0358, %r16
	.word 0xb7a20929  ! 1508: FMULs	fmuls	%f8, %f9, %f27
	.word 0x86d224e4  ! 1509: UMULcc_I	umulcc 	%r8, 0x04e4, %r3
	.word 0xcc0a22a4  ! 1510: LDUB_I	ldub	[%r8 + 0x02a4], %r6
	.word 0xaba209a9  ! 1511: FDIVs	fdivs	%f8, %f9, %f21
	.word 0xc8ca25f8  ! 1512: LDSBA_I	ldsba	[%r8, + 0x05f8] %asi, %r4
	.word 0x1a800001  ! 1513: BCC	bcc  	<label_0x1>
	.word 0xbfa20929  ! 1514: FMULs	fmuls	%f8, %f9, %f31
	.word 0xd6ea2708  ! 1515: LDSTUBA_I	ldstuba	%r11, [%r8 + 0x0708] %asi
	.word 0xc36a2d3c  ! 1516: PREFETCH_I	prefetch	[%r8 + 0x0d3c], #one_read
	.word 0xc3ea2bdc  ! 1517: PREFETCHA_I	prefetcha	[%r8, + 0x0bdc] %asi, #one_read
	.word 0xc2320009  ! 1519: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc8420009  ! 1519: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xc89a1009  ! 1520: LDDA_R	ldda	[%r8, %r9] 0x80, %r4
	.word 0xda7a0009  ! 1521: SWAP_R	swap	%r13, [%r8 + %r9]
	.word 0xe22a0009  ! 1523: STB_R	stb	%r17, [%r8 + %r9]
	.word 0xd81a0009  ! 1523: LDD_R	ldd	[%r8 + %r9], %r12
	.word 0xc89a1009  ! 1524: LDDA_R	ldda	[%r8, %r9] 0x80, %r4
	.word 0xc3ea2bc4  ! 1525: PREFETCHA_I	prefetcha	[%r8, + 0x0bc4] %asi, #one_read
	.word 0xc4ba1009  ! 1526: STDA_R	stda	%r2, [%r8 + %r9] 0x80
	.word 0xc36a2034  ! 1527: PREFETCH_I	prefetch	[%r8 + 0x0034], #one_read
	.word 0xdcb224dc  ! 1528: STHA_I	stha	%r14, [%r8 + 0x04dc] %asi
	.word 0xafa209a9  ! 1529: FDIVs	fdivs	%f8, %f9, %f23
	.word 0xc4220009  ! 1531: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xec520009  ! 1531: LDSH_R	ldsh	[%r8 + %r9], %r22
	.word 0xc4320009  ! 1533: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xca020009  ! 1533: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xca320009  ! 1535: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc6420009  ! 1535: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0x8143c000  ! 1536: STBAR	stbar
	.word 0x8143c000  ! 1537: STBAR	stbar
	.word 0xc65a27f0  ! 1538: LDX_I	ldx	[%r8 + 0x07f0], %r3
	.word 0xc22a0009  ! 1540: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xea520009  ! 1540: LDSH_R	ldsh	[%r8 + %r9], %r21
	.word 0xc3ea2960  ! 1541: PREFETCHA_I	prefetcha	[%r8, + 0x0960] %asi, #one_read
	.word 0xc53a0009  ! 1543: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc4720009  ! 1544: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc8420009  ! 1544: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xd7e21009  ! 1545: CASA_I	casa	[%r8] 0x80, %r9, %r11
	.word 0x8143e077  ! 1546: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside | #MemIssue | #Sync 
	.word 0x8143c000  ! 1547: STBAR	stbar
	.word 0xc3220009  ! 1549: STF_R	st	%f1, [%r9, %r8]
	.word 0xe0720009  ! 1550: STX_R	stx	%r16, [%r8 + %r9]
	.word 0xc6120009  ! 1550: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xa0da23c0  ! 1551: SMULcc_I	smulcc 	%r8, 0x03c0, %r16
	.word 0xef3a0009  ! 1553: STDF_R	std	%f23, [%r9, %r8]
	.word 0xc2720009  ! 1554: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc25a0009  ! 1554: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xca822d88  ! 1555: LDUWA_I	lduwa	[%r8, + 0x0d88] %asi, %r5
	.word 0xce720009  ! 1557: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xce020009  ! 1557: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0x8143e047  ! 1558: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Sync 
	.word 0x8143e064  ! 1559: MEMBAR	membar	#LoadStore | #MemIssue | #Sync 
	.word 0x22c20001  ! 1560: BRZ	brz,a,nt	%8,<label_0x20001>
	.word 0x8143c000  ! 1561: STBAR	stbar
	.word 0x84d20009  ! 1562: UMULcc_R	umulcc 	%r8, %r9, %r2
	.word 0xc3ea1009  ! 1563: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x8143e057  ! 1564: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside | #Sync 
	.word 0x8f6a21b8  ! 1565: SDIVX_I	sdivx	%r8, 0x01b8, %r7
	.word 0xc6fa2950  ! 1566: SWAPA_I	swapa	%r3, [%r8 + 0x0950] %asi
	.word 0x30800001  ! 1567: BA	ba,a	<label_0x1>
	.word 0x8143e03a  ! 1568: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside | #MemIssue 
	.word 0xbef22b28  ! 1569: UDIVcc_I	udivcc 	%r8, 0x0b28, %r31
	.word 0x82722f74  ! 1570: UDIV_I	udiv 	%r8, 0x0f74, %r1
	.word 0x8143e009  ! 1571: MEMBAR	membar	#LoadLoad | #StoreStore 
	.word 0x2a800001  ! 1572: BCS	bcs,a	<label_0x1>
	.word 0xcb3a0009  ! 1574: STDF_R	std	%f5, [%r9, %r8]
	.word 0xce720009  ! 1575: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc6020009  ! 1575: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0x99a208a9  ! 1576: FSUBs	fsubs	%f8, %f9, %f12
	.word 0x36800001  ! 1577: BGE	bge,a	<label_0x1>
	.word 0x8143c000  ! 1578: STBAR	stbar
	.word 0x876a2c9c  ! 1579: SDIVX_I	sdivx	%r8, 0x0c9c, %r3
	.word 0xccea2d3c  ! 1580: LDSTUBA_I	ldstuba	%r6, [%r8 + 0x0d3c] %asi
	.word 0x12800002  ! 1581: BNE	bne  	<label_0x2>
	.word 0xc31a0009  ! 1582: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xce9225c4  ! 1583: LDUHA_I	lduha	[%r8, + 0x05c4] %asi, %r7
	.word 0xc7e21009  ! 1584: CASA_I	casa	[%r8] 0x80, %r9, %r3
	.word 0xc81a0009  ! 1585: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xc2220009  ! 1587: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xcf020009  ! 1587: LDF_R	ld	[%r8, %r9], %f7
	.word 0xc82a0009  ! 1589: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xca0a0009  ! 1589: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0x8ba208a9  ! 1590: FSUBs	fsubs	%f8, %f9, %f5
	.word 0x876a0009  ! 1591: SDIVX_R	sdivx	%r8, %r9, %r3
	.word 0x8ada0009  ! 1592: SMULcc_R	smulcc 	%r8, %r9, %r5
	.word 0xc5022ff8  ! 1593: LDF_I	ld	[%r8, 0x0ff8], %f2
	.word 0x8c6a0009  ! 1594: UDIVX_R	udivx 	%r8, %r9, %r6
	.word 0xc33a0009  ! 1596: STDF_R	std	%f1, [%r9, %r8]
	.word 0xfe720009  ! 1597: STX_R	stx	%r31, [%r8 + %r9]
	.word 0xc5020009  ! 1597: LDF_R	ld	[%r8, %r9], %f2
	.word 0xfe0a0009  ! 1598: LDUB_R	ldub	[%r8 + %r9], %r31
	.word 0x08800002  ! 1599: BLEU	bleu  	<label_0x2>
	.word 0xcc420009  ! 1600: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0x8c4a2514  ! 1601: MULX_I	mulx 	%r8, 0x0514, %r6
	.word 0xc36a23c8  ! 1602: PREFETCH_I	prefetch	[%r8 + 0x03c8], #one_read
	.word 0xeab22ae0  ! 1603: STHA_I	stha	%r21, [%r8 + 0x0ae0] %asi
	.word 0x8143c000  ! 1604: STBAR	stbar
	.word 0xe4ba1009  ! 1605: STDA_R	stda	%r18, [%r8 + %r9] 0x80
	.word 0xc3ea1009  ! 1606: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc36a2aec  ! 1607: PREFETCH_I	prefetch	[%r8 + 0x0aec], #one_read
	.word 0xcd222e48  ! 1608: STF_I	st	%f6, [0x0e48, %r8]
	.word 0xe0ba1009  ! 1609: STDA_R	stda	%r16, [%r8 + %r9] 0x80
	.word 0x8143e06e  ! 1610: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #MemIssue | #Sync 
	.word 0xdab2240c  ! 1611: STHA_I	stha	%r13, [%r8 + 0x040c] %asi
	.word 0xd6da22f8  ! 1612: LDXA_I	ldxa	[%r8, + 0x02f8] %asi, %r11
	.word 0x02ca0001  ! 1613: BRZ	brz  ,pt	%8,<label_0xa0001>
	.word 0x8143e028  ! 1614: MEMBAR	membar	#StoreStore | #MemIssue 
	.word 0x9da20929  ! 1615: FMULs	fmuls	%f8, %f9, %f14
	.word 0x0e800002  ! 1616: BVS	bvs  	<label_0x2>
	.word 0xf6320009  ! 1618: STH_R	sth	%r27, [%r8 + %r9]
	.word 0xda4a0009  ! 1618: LDSB_R	ldsb	[%r8 + %r9], %r13
	.word 0x12800001  ! 1619: BNE	bne  	<label_0x1>
	.word 0xb67a0009  ! 1620: SDIV_R	sdiv 	%r8, %r9, %r27
	.word 0xb8fa23e8  ! 1621: SDIVcc_I	sdivcc 	%r8, 0x03e8, %r28
	.word 0xfa7a2e80  ! 1622: SWAP_I	swap	%r29, [%r8 + 0x0e80]
	.word 0x2a800001  ! 1623: BCS	bcs,a	<label_0x1>
	.word 0xbef20009  ! 1624: UDIVcc_R	udivcc 	%r8, %r9, %r31
	.word 0xccf223b0  ! 1625: STXA_I	stxa	%r6, [%r8 + 0x03b0] %asi
	.word 0x1e800002  ! 1626: BVC	bvc  	<label_0x2>
	.word 0xe2220009  ! 1628: STW_R	stw	%r17, [%r8 + %r9]
	.word 0xce0a0009  ! 1628: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0x964a0009  ! 1629: MULX_R	mulx 	%r8, %r9, %r11
	.word 0xc6f21009  ! 1630: STXA_R	stxa	%r3, [%r8 + %r9] 0x80
	.word 0xc3ea1009  ! 1631: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xeab21009  ! 1632: STHA_R	stha	%r21, [%r8 + %r9] 0x80
	.word 0xc3ea1009  ! 1633: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x82522bf4  ! 1634: UMUL_I	umul 	%r8, 0x0bf4, %r1
	.word 0x82720009  ! 1635: UDIV_R	udiv 	%r8, %r9, %r1
	.word 0xfeb21009  ! 1636: STHA_R	stha	%r31, [%r8 + %r9] 0x80
	.word 0xdc2a0009  ! 1638: STB_R	stb	%r14, [%r8 + %r9]
	.word 0xe2420009  ! 1638: LDSW_R	ldsw	[%r8 + %r9], %r17
	.word 0xc36a2d1c  ! 1639: PREFETCH_I	prefetch	[%r8 + 0x0d1c], #one_read
	.word 0xc91a0009  ! 1640: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xc42a0009  ! 1642: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xd8020009  ! 1642: LDUW_R	lduw	[%r8 + %r9], %r12
	.word 0x8143c000  ! 1643: STBAR	stbar
	.word 0x8143c000  ! 1644: STBAR	stbar
	.word 0xca220009  ! 1646: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xca420009  ! 1646: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0x84d22188  ! 1647: UMULcc_I	umulcc 	%r8, 0x0188, %r2
	.word 0xcc220009  ! 1649: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc8120009  ! 1649: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0x9ba209a9  ! 1650: FDIVs	fdivs	%f8, %f9, %f13
	.word 0xe8aa1009  ! 1651: STBA_R	stba	%r20, [%r8 + %r9] 0x80
	.word 0xc9222fe0  ! 1652: STF_I	st	%f4, [0x0fe0, %r8]
	.word 0xfb020009  ! 1653: LDF_R	ld	[%r8, %r9], %f29
	.word 0xca821009  ! 1654: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r5
	.word 0x28800002  ! 1655: BLEU	bleu,a	<label_0x2>
	.word 0x8a520009  ! 1656: UMUL_R	umul 	%r8, %r9, %r5
	.word 0xdc7a0009  ! 1657: SWAP_R	swap	%r14, [%r8 + %r9]
	.word 0xcff21009  ! 1658: CASXA_I	casxa	[%r8] 0x80, %r9, %r7
	.word 0xf2022314  ! 1659: LDUW_I	lduw	[%r8 + 0x0314], %r25
	.word 0x06c20001  ! 1660: BRLZ	brlz  ,nt	%8,<label_0x20001>
	.word 0x82f22ee8  ! 1661: UDIVcc_I	udivcc 	%r8, 0x0ee8, %r1
	.word 0x0cca0001  ! 1662: BRGZ	brgz  ,pt	%8,<label_0xa0001>
	.word 0xe9222d70  ! 1663: STF_I	st	%f20, [0x0d70, %r8]
	.word 0xcab21009  ! 1664: STHA_R	stha	%r5, [%r8 + %r9] 0x80
	.word 0x86d20009  ! 1665: UMULcc_R	umulcc 	%r8, %r9, %r3
	.word 0xc36a0009  ! 1666: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0x865a0009  ! 1667: SMUL_R	smul 	%r8, %r9, %r3
	.word 0xbc6a2658  ! 1668: UDIVX_I	udivx 	%r8, 0x0658, %r30
	.word 0x8143e010  ! 1669: MEMBAR	membar	#Lookaside 
	.word 0xc4f21009  ! 1670: STXA_R	stxa	%r2, [%r8 + %r9] 0x80
	.word 0xa56a29b8  ! 1671: SDIVX_I	sdivx	%r8, 0x09b8, %r18
	.word 0x8c7a0009  ! 1672: SDIV_R	sdiv 	%r8, %r9, %r6
	.word 0xc5222358  ! 1673: STF_I	st	%f2, [0x0358, %r8]
	.word 0x867227b0  ! 1674: UDIV_I	udiv 	%r8, 0x07b0, %r3
	.word 0xc4720009  ! 1676: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc8520009  ! 1676: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xca6a0009  ! 1677: LDSTUB_R	ldstub	%r5, [%r8 + %r9]
	.word 0x0cca0001  ! 1678: BRGZ	brgz  ,pt	%8,<label_0xa0001>
	.word 0xc7220009  ! 1680: STF_R	st	%f3, [%r9, %r8]
	.word 0xc4720009  ! 1681: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc4020009  ! 1681: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xcf220009  ! 1683: STF_R	st	%f7, [%r9, %r8]
	.word 0xc4720009  ! 1684: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc6520009  ! 1684: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xc36a0009  ! 1685: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0x0a800001  ! 1686: BCS	bcs  	<label_0x1>
	.word 0xf25a0009  ! 1687: LDX_R	ldx	[%r8 + %r9], %r25
	.word 0xc2022ef8  ! 1688: LDUW_I	lduw	[%r8 + 0x0ef8], %r1
	.word 0x84d20009  ! 1689: UMULcc_R	umulcc 	%r8, %r9, %r2
	.word 0x16800001  ! 1690: BGE	bge  	<label_0x1>
	.word 0x87a20929  ! 1691: FMULs	fmuls	%f8, %f9, %f3
	.word 0xb4da0009  ! 1692: SMULcc_R	smulcc 	%r8, %r9, %r26
	.word 0xee220009  ! 1694: STW_R	stw	%r23, [%r8 + %r9]
	.word 0xca4a0009  ! 1694: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xc8ca1009  ! 1695: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r4
	.word 0x82fa0009  ! 1696: SDIVcc_R	sdivcc 	%r8, %r9, %r1
	.word 0xd73a2598  ! 1697: STDF_I	std	%f11, [0x0598, %r8]
	.word 0xc3ea1009  ! 1698: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xcb3a28a0  ! 1699: STDF_I	std	%f5, [0x08a0, %r8]
	.word 0xca8a1009  ! 1700: LDUBA_R	lduba	[%r8, %r9] 0x80, %r5
	.word 0xacd20009  ! 1701: UMULcc_R	umulcc 	%r8, %r9, %r22
	.word 0x827a2894  ! 1702: SDIV_I	sdiv 	%r8, 0x0894, %r1
	.word 0xc3ea1009  ! 1703: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xbcd221a8  ! 1704: UMULcc_I	umulcc 	%r8, 0x01a8, %r30
	.word 0xcec22cbc  ! 1705: LDSWA_I	ldswa	[%r8, + 0x0cbc] %asi, %r7
	.word 0xcd222efc  ! 1706: STF_I	st	%f6, [0x0efc, %r8]
	.word 0x8143e053  ! 1707: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside | #Sync 
	.word 0x8143e033  ! 1708: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside | #MemIssue 
	.word 0xc8ba2bf0  ! 1709: STDA_I	stda	%r4, [%r8 + 0x0bf0] %asi
	.word 0xc7e22009  ! 1710: CASA_R	casa	[%r8] %asi, %r9, %r3
	.word 0x87a208a9  ! 1711: FSUBs	fsubs	%f8, %f9, %f3
	.word 0xc4220009  ! 1713: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc4420009  ! 1713: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xdcda1009  ! 1714: LDXA_R	ldxa	[%r8, %r9] 0x80, %r14
	.word 0xfe7a0009  ! 1715: SWAP_R	swap	%r31, [%r8 + %r9]
	.word 0xc68a1009  ! 1716: LDUBA_R	lduba	[%r8, %r9] 0x80, %r3
	.word 0x40000001  ! 1717: CALL	call	disp30_1
	.word 0xcc5a0009  ! 1718: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xc6120009  ! 1719: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xcaca1009  ! 1720: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r5
	.word 0x8143e025  ! 1721: MEMBAR	membar	#LoadLoad | #LoadStore | #MemIssue 
	.word 0x83a208a9  ! 1722: FSUBs	fsubs	%f8, %f9, %f1
	.word 0xc81a2980  ! 1723: LDD_I	ldd	[%r8 + 0x0980], %r4
	.word 0xcc4a0009  ! 1724: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xc82a0009  ! 1726: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xcd020009  ! 1726: LDF_R	ld	[%r8, %r9], %f6
	.word 0x967a0009  ! 1727: SDIV_R	sdiv 	%r8, %r9, %r11
	.word 0xdc7a2c58  ! 1728: SWAP_I	swap	%r14, [%r8 + 0x0c58]
	.word 0x8143c000  ! 1729: STBAR	stbar
	.word 0x24800002  ! 1730: BLE	ble,a	<label_0x2>
	.word 0xcc2a0009  ! 1732: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xce120009  ! 1732: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xd81a0009  ! 1733: LDD_R	ldd	[%r8 + %r9], %r12
	.word 0xcac21009  ! 1734: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r5
	.word 0xcb1a0009  ! 1735: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xc2c228f0  ! 1736: LDSWA_I	ldswa	[%r8, + 0x08f0] %asi, %r1
	.word 0x8eda0009  ! 1737: SMULcc_R	smulcc 	%r8, %r9, %r7
	.word 0x84da0009  ! 1738: SMULcc_R	smulcc 	%r8, %r9, %r2
	.word 0xcad22e9c  ! 1739: LDSHA_I	ldsha	[%r8, + 0x0e9c] %asi, %r5
	.word 0xb3a20829  ! 1740: FADDs	fadds	%f8, %f9, %f25
	.word 0xc88a2af8  ! 1741: LDUBA_I	lduba	[%r8, + 0x0af8] %asi, %r4
	.word 0xcd3a0009  ! 1743: STDF_R	std	%f6, [%r9, %r8]
	.word 0xe2720009  ! 1744: STX_R	stx	%r17, [%r8 + %r9]
	.word 0xef1a0009  ! 1744: LDDF_R	ldd	[%r8, %r9], %f23
	.word 0x86fa0009  ! 1745: SDIVcc_R	sdivcc 	%r8, %r9, %r3
	.word 0x987224fc  ! 1746: UDIV_I	udiv 	%r8, 0x04fc, %r12
	.word 0xa0f22680  ! 1747: UDIVcc_I	udivcc 	%r8, 0x0680, %r16
	.word 0xc4ba2370  ! 1748: STDA_I	stda	%r2, [%r8 + 0x0370] %asi
	.word 0xc36a0009  ! 1749: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0x02800001  ! 1750: BE	be  	<label_0x1>
	.word 0xec220009  ! 1752: STW_R	stw	%r22, [%r8 + %r9]
	.word 0xce520009  ! 1752: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xccf21009  ! 1753: STXA_R	stxa	%r6, [%r8 + %r9] 0x80
	.word 0x0a800001  ! 1754: BCS	bcs  	<label_0x1>
	.word 0xca4a0009  ! 1755: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0x8c5a22c4  ! 1756: SMUL_I	smul 	%r8, 0x02c4, %r6
	.word 0xc81a0009  ! 1757: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xce320009  ! 1759: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xcd020009  ! 1759: LDF_R	ld	[%r8, %r9], %f6
	.word 0xc92227a0  ! 1760: STF_I	st	%f4, [0x07a0, %r8]
	.word 0xc69225b0  ! 1761: LDUHA_I	lduha	[%r8, + 0x05b0] %asi, %r3
	.word 0xc73a2698  ! 1762: STDF_I	std	%f3, [0x0698, %r8]
	.word 0xccf21009  ! 1763: STXA_R	stxa	%r6, [%r8 + %r9] 0x80
	.word 0xc3ea1009  ! 1764: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x8b6a0009  ! 1765: SDIVX_R	sdivx	%r8, %r9, %r5
	.word 0xdc921009  ! 1766: LDUHA_R	lduha	[%r8, %r9] 0x80, %r14
	.word 0xf86a0009  ! 1767: LDSTUB_R	ldstub	%r28, [%r8 + %r9]
	.word 0x8afa2d84  ! 1768: SDIVcc_I	sdivcc 	%r8, 0x0d84, %r5
	.word 0xdfe21009  ! 1769: CASA_I	casa	[%r8] 0x80, %r9, %r15
	.word 0x8143e06f  ! 1770: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #MemIssue | #Sync 
	.word 0xe22a0009  ! 1772: STB_R	stb	%r17, [%r8 + %r9]
	.word 0xcc420009  ! 1772: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0x02c20001  ! 1773: BRZ	brz  ,nt	%8,<label_0x20001>
	.word 0xe93a0009  ! 1775: STDF_R	std	%f20, [%r9, %r8]
	.word 0xdc720009  ! 1776: STX_R	stx	%r14, [%r8 + %r9]
	.word 0xe64a0009  ! 1776: LDSB_R	ldsb	[%r8 + %r9], %r19
	.word 0xc2ea24bc  ! 1777: LDSTUBA_I	ldstuba	%r1, [%r8 + 0x04bc] %asi
	.word 0xc36a0009  ! 1778: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xce320009  ! 1780: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc84a0009  ! 1780: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xc8fa25f8  ! 1781: SWAPA_I	swapa	%r4, [%r8 + 0x05f8] %asi
	.word 0xc36a2544  ! 1782: PREFETCH_I	prefetch	[%r8 + 0x0544], #one_read
	.word 0x8a5a25ac  ! 1783: SMUL_I	smul 	%r8, 0x05ac, %r5
	.word 0x8143c000  ! 1784: STBAR	stbar
	.word 0xc3ea1009  ! 1785: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xcd220009  ! 1787: STF_R	st	%f6, [%r9, %r8]
	.word 0xc6720009  ! 1788: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc3020009  ! 1788: LDF_R	ld	[%r8, %r9], %f1
	.word 0xc9220009  ! 1790: STF_R	st	%f4, [%r9, %r8]
	.word 0xea720009  ! 1791: STX_R	stx	%r21, [%r8 + %r9]
	.word 0xc25a0009  ! 1791: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xc4ba2c00  ! 1792: STDA_I	stda	%r2, [%r8 + 0x0c00] %asi
	.word 0xda821009  ! 1793: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r13
	.word 0x85a20829  ! 1794: FADDs	fadds	%f8, %f9, %f2
	.word 0x8143e077  ! 1795: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside | #MemIssue | #Sync 
	.word 0xcf3a2b90  ! 1796: STDF_I	std	%f7, [0x0b90, %r8]
	.word 0xea320009  ! 1798: STH_R	sth	%r21, [%r8 + %r9]
	.word 0xe4020009  ! 1798: LDUW_R	lduw	[%r8 + %r9], %r18
	.word 0xf62a0009  ! 1800: STB_R	stb	%r27, [%r8 + %r9]
	.word 0xce020009  ! 1800: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xe86a2378  ! 1801: LDSTUB_I	ldstub	%r20, [%r8 + 0x0378]
	.word 0xe60a2774  ! 1802: LDUB_I	ldub	[%r8 + 0x0774], %r19
	.word 0xce2a0009  ! 1804: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xd85a0009  ! 1804: LDX_R	ldx	[%r8 + %r9], %r12
	.word 0xca5a2760  ! 1805: LDX_I	ldx	[%r8 + 0x0760], %r5
	.word 0xcbf21009  ! 1806: CASXA_I	casxa	[%r8] 0x80, %r9, %r5
	.word 0xc2320009  ! 1808: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc4120009  ! 1808: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xc93a2d08  ! 1809: STDF_I	std	%f4, [0x0d08, %r8]
	.word 0xcab2268c  ! 1810: STHA_I	stha	%r5, [%r8 + 0x068c] %asi
	.word 0xcc2a0009  ! 1812: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc01a0009  ! 1812: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0xd6020009  ! 1813: LDUW_R	lduw	[%r8 + %r9], %r11
	.word 0x8a722314  ! 1814: UDIV_I	udiv 	%r8, 0x0314, %r5
	.word 0xf4ea1009  ! 1815: LDSTUBA_R	ldstuba	%r26, [%r8 + %r9] 0x80
	.word 0xa9220009  ! 1816: MULScc_R	mulscc 	%r8, %r9, %r20
	.word 0xc4220009  ! 1818: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc80a0009  ! 1818: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0x847228a4  ! 1819: UDIV_I	udiv 	%r8, 0x08a4, %r2
	.word 0xcec22650  ! 1820: LDSWA_I	ldswa	[%r8, + 0x0650] %asi, %r7
	.word 0xf24a0009  ! 1821: LDSB_R	ldsb	[%r8 + %r9], %r25
	.word 0xc26a2390  ! 1822: LDSTUB_I	ldstub	%r1, [%r8 + 0x0390]
	.word 0xdaf22178  ! 1823: STXA_I	stxa	%r13, [%r8 + 0x0178] %asi
	.word 0x82fa0009  ! 1824: SDIVcc_R	sdivcc 	%r8, %r9, %r1
	.word 0xead22290  ! 1825: LDSHA_I	ldsha	[%r8, + 0x0290] %asi, %r21
	.word 0xc3ea1009  ! 1826: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc4fa2f94  ! 1827: SWAPA_I	swapa	%r2, [%r8 + 0x0f94] %asi
	.word 0x825228a8  ! 1828: UMUL_I	umul 	%r8, 0x08a8, %r1
	.word 0xc3ea1009  ! 1829: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xe02a0009  ! 1831: STB_R	stb	%r16, [%r8 + %r9]
	.word 0xca5a0009  ! 1831: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0x865a0009  ! 1832: SMUL_R	smul 	%r8, %r9, %r3
	.word 0x866a0009  ! 1833: UDIVX_R	udivx 	%r8, %r9, %r3
	.word 0x85a20829  ! 1834: FADDs	fadds	%f8, %f9, %f2
	.word 0xc2220009  ! 1836: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xdc120009  ! 1836: LDUH_R	lduh	[%r8 + %r9], %r14
	.word 0xf8aa2014  ! 1837: STBA_I	stba	%r28, [%r8 + 0x0014] %asi
	.word 0xe62a0009  ! 1839: STB_R	stb	%r19, [%r8 + %r9]
	.word 0xc44a0009  ! 1839: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0x8143c000  ! 1840: STBAR	stbar
	.word 0xccba20a0  ! 1841: STDA_I	stda	%r6, [%r8 + 0x00a0] %asi
	.word 0xcada2240  ! 1842: LDXA_I	ldxa	[%r8, + 0x0240] %asi, %r5
	.word 0xce220009  ! 1844: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc71a0009  ! 1844: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xd9e21009  ! 1845: CASA_I	casa	[%r8] 0x80, %r9, %r12
	.word 0x83a20929  ! 1846: FMULs	fmuls	%f8, %f9, %f1
	.word 0x8143c000  ! 1847: STBAR	stbar
	.word 0xbd222dd4  ! 1848: MULScc_I	mulscc 	%r8, 0x0dd4, %r30
	.word 0xc5222660  ! 1849: STF_I	st	%f2, [0x0660, %r8]
	.word 0xcd3a0009  ! 1851: STDF_R	std	%f6, [%r9, %r8]
	.word 0xf8720009  ! 1852: STX_R	stx	%r28, [%r8 + %r9]
	.word 0xda020009  ! 1852: LDUW_R	lduw	[%r8 + %r9], %r13
	.word 0xb8520009  ! 1853: UMUL_R	umul 	%r8, %r9, %r28
	.word 0xc8921009  ! 1854: LDUHA_R	lduha	[%r8, %r9] 0x80, %r4
	.word 0xde922890  ! 1855: LDUHA_I	lduha	[%r8, + 0x0890] %asi, %r15
	.word 0xf86a2178  ! 1856: LDSTUB_I	ldstub	%r28, [%r8 + 0x0178]
	.word 0xe6c21009  ! 1857: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r19
	.word 0x26800001  ! 1858: BL	bl,a	<label_0x1>
	.word 0xb1a20829  ! 1859: FADDs	fadds	%f8, %f9, %f24
	.word 0xfcb21009  ! 1860: STHA_R	stha	%r30, [%r8 + %r9] 0x80
	.word 0x82da29cc  ! 1861: SMULcc_I	smulcc 	%r8, 0x09cc, %r1
	.word 0xcb3a0009  ! 1863: STDF_R	std	%f5, [%r9, %r8]
	.word 0xc8720009  ! 1864: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xcc1a0009  ! 1864: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xde7a0009  ! 1865: SWAP_R	swap	%r15, [%r8 + %r9]
	.word 0xc36a0009  ! 1866: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xfaea2dc4  ! 1867: LDSTUBA_I	ldstuba	%r29, [%r8 + 0x0dc4] %asi
	.word 0xc3ea1009  ! 1868: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x8efa2344  ! 1869: SDIVcc_I	sdivcc 	%r8, 0x0344, %r7
	.word 0x8143e021  ! 1870: MEMBAR	membar	#LoadLoad | #MemIssue 
	.word 0xef3a26f0  ! 1871: STDF_I	std	%f23, [0x06f0, %r8]
	.word 0x886a2ff0  ! 1872: UDIVX_I	udivx 	%r8, 0x0ff0, %r4
	.word 0x8143c000  ! 1873: STBAR	stbar
	.word 0x8c4a2118  ! 1874: MULX_I	mulx 	%r8, 0x0118, %r6
	.word 0x8143e027  ! 1875: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #MemIssue 
	.word 0xeb3a24c8  ! 1876: STDF_I	std	%f21, [0x04c8, %r8]
	.word 0xf80a0009  ! 1877: LDUB_R	ldub	[%r8 + %r9], %r28
	.word 0xe33a2660  ! 1878: STDF_I	std	%f17, [0x0660, %r8]
	.word 0xfd3a0009  ! 1880: STDF_R	std	%f30, [%r9, %r8]
	.word 0xc4720009  ! 1881: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc24a0009  ! 1881: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0x8afa2cfc  ! 1882: SDIVcc_I	sdivcc 	%r8, 0x0cfc, %r5
	.word 0xc89a2798  ! 1883: LDDA_I	ldda	[%r8, + 0x0798] %asi, %r4
	.word 0xe33a0009  ! 1885: STDF_R	std	%f17, [%r9, %r8]
	.word 0xc2720009  ! 1886: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc8420009  ! 1886: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0x8143e01e  ! 1887: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside 
	.word 0x8143c000  ! 1888: STBAR	stbar
	.word 0xde320009  ! 1890: STH_R	sth	%r15, [%r8 + %r9]
	.word 0xcb020009  ! 1890: LDF_R	ld	[%r8, %r9], %f5
	.word 0xc5222f20  ! 1891: STF_I	st	%f2, [0x0f20, %r8]
	.word 0xc36a21d0  ! 1892: PREFETCH_I	prefetch	[%r8 + 0x01d0], #one_read
	.word 0x8143e00b  ! 1893: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore 
	.word 0xc3ea1009  ! 1894: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x827a2b5c  ! 1895: SDIV_I	sdiv 	%r8, 0x0b5c, %r1
	.word 0x8143e00e  ! 1896: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore 
	.word 0xcada2c20  ! 1897: LDXA_I	ldxa	[%r8, + 0x0c20] %asi, %r5
	.word 0x83a209a9  ! 1898: FDIVs	fdivs	%f8, %f9, %f1
	.word 0xdcba1009  ! 1899: STDA_R	stda	%r14, [%r8 + %r9] 0x80
	.word 0xc6520009  ! 1900: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0x2a800002  ! 1901: BCS	bcs,a	<label_0x2>
	.word 0xc36a0009  ! 1902: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xde220009  ! 1904: STW_R	stw	%r15, [%r8 + %r9]
	.word 0xc3020009  ! 1904: LDF_R	ld	[%r8, %r9], %f1
	.word 0x8c720009  ! 1905: UDIV_R	udiv 	%r8, %r9, %r6
	.word 0xc6320009  ! 1907: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xce4a0009  ! 1907: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xc36a0009  ! 1908: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0x884a0009  ! 1909: MULX_R	mulx 	%r8, %r9, %r4
	.word 0x8afa21d0  ! 1910: SDIVcc_I	sdivcc 	%r8, 0x01d0, %r5
	.word 0x9e6a0009  ! 1911: UDIVX_R	udivx 	%r8, %r9, %r15
	.word 0xcc1a2f10  ! 1912: LDD_I	ldd	[%r8 + 0x0f10], %r6
	.word 0xc3ea1009  ! 1913: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x8143e000  ! 1914: MEMBAR	membar	
	.word 0xfb3a2af0  ! 1915: STDF_I	std	%f29, [0x0af0, %r8]
	.word 0x9da20829  ! 1916: FADDs	fadds	%f8, %f9, %f14
	.word 0xc9222b80  ! 1917: STF_I	st	%f4, [0x0b80, %r8]
	.word 0x9a4a2728  ! 1918: MULX_I	mulx 	%r8, 0x0728, %r13
	.word 0x06800001  ! 1919: BL	bl  	<label_0x1>
	.word 0x876a2e18  ! 1920: SDIVX_I	sdivx	%r8, 0x0e18, %r3
	.word 0x9e7a0009  ! 1921: SDIV_R	sdiv 	%r8, %r9, %r15
	.word 0xc4d21009  ! 1922: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r2
	.word 0x825a0009  ! 1923: SMUL_R	smul 	%r8, %r9, %r1
	.word 0x865a2a64  ! 1924: SMUL_I	smul 	%r8, 0x0a64, %r3
	.word 0x885a0009  ! 1925: SMUL_R	smul 	%r8, %r9, %r4
	.word 0xc6a21009  ! 1926: STWA_R	stwa	%r3, [%r8 + %r9] 0x80
	.word 0x24800002  ! 1927: BLE	ble,a	<label_0x2>
	.word 0xf4b22920  ! 1928: STHA_I	stha	%r26, [%r8 + 0x0920] %asi
	.word 0xe4fa2930  ! 1929: SWAPA_I	swapa	%r18, [%r8 + 0x0930] %asi
	.word 0xc2122b90  ! 1930: LDUH_I	lduh	[%r8 + 0x0b90], %r1
	.word 0xcc9a1009  ! 1931: LDDA_R	ldda	[%r8, %r9] 0x80, %r6
	.word 0x8e720009  ! 1932: UDIV_R	udiv 	%r8, %r9, %r7
	.word 0x86fa2ea0  ! 1933: SDIVcc_I	sdivcc 	%r8, 0x0ea0, %r3
	.word 0x8143c000  ! 1934: STBAR	stbar
	.word 0xc64a2d14  ! 1935: LDSB_I	ldsb	[%r8 + 0x0d14], %r3
	.word 0x824a0009  ! 1936: MULX_R	mulx 	%r8, %r9, %r1
	.word 0xc2320009  ! 1938: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xec520009  ! 1938: LDSH_R	ldsh	[%r8 + %r9], %r22
	.word 0xcf3a2b50  ! 1939: STDF_I	std	%f7, [0x0b50, %r8]
	.word 0xc36a29a8  ! 1940: PREFETCH_I	prefetch	[%r8 + 0x09a8], #one_read
	.word 0xccd221c4  ! 1941: LDSHA_I	ldsha	[%r8, + 0x01c4] %asi, %r6
	.word 0xce2a0009  ! 1943: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xfe0a0009  ! 1943: LDUB_R	ldub	[%r8 + %r9], %r31
	.word 0xafa20829  ! 1944: FADDs	fadds	%f8, %f9, %f23
	.word 0xb86a0009  ! 1945: UDIVX_R	udivx 	%r8, %r9, %r28
	.word 0xc8220009  ! 1947: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xca120009  ! 1947: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xeeca1009  ! 1948: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r23
	.word 0x84d22c8c  ! 1949: UMULcc_I	umulcc 	%r8, 0x0c8c, %r2
	.word 0x2eca0001  ! 1950: BRGEZ	brgez,a,pt	%8,<label_0xa0001>
	.word 0xc3ea1009  ! 1951: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xd93a22c8  ! 1952: STDF_I	std	%f12, [0x02c8, %r8]
	.word 0xec220009  ! 1954: STW_R	stw	%r22, [%r8 + %r9]
	.word 0xce5a0009  ! 1954: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xca2a0009  ! 1956: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xcc120009  ! 1956: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xf4520009  ! 1957: LDSH_R	ldsh	[%r8 + %r9], %r26
	.word 0x8143e03c  ! 1958: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0xc36a2cb0  ! 1959: PREFETCH_I	prefetch	[%r8 + 0x0cb0], #one_read
	.word 0xceea2b48  ! 1960: LDSTUBA_I	ldstuba	%r7, [%r8 + 0x0b48] %asi
	.word 0xcada1009  ! 1961: LDXA_R	ldxa	[%r8, %r9] 0x80, %r5
	.word 0xe1222628  ! 1962: STF_I	st	%f16, [0x0628, %r8]
	.word 0x2e800002  ! 1963: BVS	bvs,a	<label_0x2>
	.word 0xc3ea1009  ! 1964: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xcc220009  ! 1966: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xde0a0009  ! 1966: LDUB_R	ldub	[%r8 + %r9], %r15
	.word 0xc33a2cc0  ! 1967: STDF_I	std	%f1, [0x0cc0, %r8]
	.word 0x85a208a9  ! 1968: FSUBs	fsubs	%f8, %f9, %f2
	.word 0xfcea2994  ! 1969: LDSTUBA_I	ldstuba	%r30, [%r8 + 0x0994] %asi
	.word 0xc8ba2618  ! 1970: STDA_I	stda	%r4, [%r8 + 0x0618] %asi
	.word 0xc47a0009  ! 1971: SWAP_R	swap	%r2, [%r8 + %r9]
	.word 0xc5222fa0  ! 1972: STF_I	st	%f2, [0x0fa0, %r8]
	.word 0x8da20829  ! 1973: FADDs	fadds	%f8, %f9, %f6
	.word 0xc36a2df8  ! 1974: PREFETCH_I	prefetch	[%r8 + 0x0df8], #one_read
	.word 0xc8320009  ! 1976: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc41a0009  ! 1976: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xc7222a4c  ! 1977: STF_I	st	%f3, [0x0a4c, %r8]
	.word 0xea0a28dc  ! 1978: LDUB_I	ldub	[%r8 + 0x08dc], %r21
	.word 0x99220009  ! 1979: MULScc_R	mulscc 	%r8, %r9, %r12
	.word 0xce320009  ! 1981: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xe8420009  ! 1981: LDSW_R	ldsw	[%r8 + %r9], %r20
	.word 0xb36a2fb0  ! 1982: SDIVX_I	sdivx	%r8, 0x0fb0, %r25
	.word 0xc62a0009  ! 1984: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xfe520009  ! 1984: LDSH_R	ldsh	[%r8 + %r9], %r31
	.word 0x8143e06f  ! 1985: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #MemIssue | #Sync 
	.word 0xc36a0009  ! 1986: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc6ca1009  ! 1987: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r3
	.word 0x8143c000  ! 1988: STBAR	stbar
	.word 0xcef21009  ! 1989: STXA_R	stxa	%r7, [%r8 + %r9] 0x80
	.word 0xdc020009  ! 1990: LDUW_R	lduw	[%r8 + %r9], %r14
	.word 0x0cc20001  ! 1991: BRGZ	brgz  ,nt	%8,<label_0x20001>
	.word 0xca8a24cc  ! 1992: LDUBA_I	lduba	[%r8, + 0x04cc] %asi, %r5
	.word 0x85a20829  ! 1993: FADDs	fadds	%f8, %f9, %f2
	.word 0xcc922994  ! 1994: LDUHA_I	lduha	[%r8, + 0x0994] %asi, %r6
	.word 0xf922232c  ! 1995: STF_I	st	%f28, [0x032c, %r8]
	.word 0xfe220009  ! 1997: STW_R	stw	%r31, [%r8 + %r9]
	.word 0xcb020009  ! 1997: LDF_R	ld	[%r8, %r9], %f5
	.word 0xae522d48  ! 1998: UMUL_I	umul 	%r8, 0x0d48, %r23
	.word 0xc36a0009  ! 1999: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xf8f22b30  ! 2000: STXA_I	stxa	%r28, [%r8 + 0x0b30] %asi
	.word 0x89a20929  ! 2001: FMULs	fmuls	%f8, %f9, %f4
	.word 0x8143c000  ! 2002: STBAR	stbar
	.word 0xecba1009  ! 2003: STDA_R	stda	%r22, [%r8 + %r9] 0x80
	.word 0x83a20929  ! 2004: FMULs	fmuls	%f8, %f9, %f1
	.word 0xf6220009  ! 2006: STW_R	stw	%r27, [%r8 + %r9]
	.word 0xca4a0009  ! 2006: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xf4da2730  ! 2007: LDXA_I	ldxa	[%r8, + 0x0730] %asi, %r26
	.word 0xce022950  ! 2008: LDUW_I	lduw	[%r8 + 0x0950], %r7
	.word 0xc36a0009  ! 2009: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xccf21009  ! 2010: STXA_R	stxa	%r6, [%r8 + %r9] 0x80
	.word 0xc6220009  ! 2012: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xdc420009  ! 2012: LDSW_R	ldsw	[%r8 + %r9], %r14
	.word 0xceb21009  ! 2013: STHA_R	stha	%r7, [%r8 + %r9] 0x80
	.word 0x84d20009  ! 2014: UMULcc_R	umulcc 	%r8, %r9, %r2
	.word 0xc4821009  ! 2015: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r2
	.word 0xce320009  ! 2017: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xfe0a0009  ! 2017: LDUB_R	ldub	[%r8 + %r9], %r31
	.word 0xee2a0009  ! 2019: STB_R	stb	%r23, [%r8 + %r9]
	.word 0xdd1a0009  ! 2019: LDDF_R	ldd	[%r8, %r9], %f14
	.word 0xc22a0009  ! 2021: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xee520009  ! 2021: LDSH_R	ldsh	[%r8 + %r9], %r23
	.word 0x40000001  ! 2022: CALL	call	disp30_1
	.word 0xc36a0009  ! 2023: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0x83a209a9  ! 2024: FDIVs	fdivs	%f8, %f9, %f1
	.word 0xfa720009  ! 2026: STX_R	stx	%r29, [%r8 + %r9]
	.word 0xcb020009  ! 2026: LDF_R	ld	[%r8, %r9], %f5
	.word 0xcea2262c  ! 2027: STWA_I	stwa	%r7, [%r8 + 0x062c] %asi
	.word 0xc4ea2adc  ! 2028: LDSTUBA_I	ldstuba	%r2, [%r8 + 0x0adc] %asi
	.word 0x04ca0001  ! 2029: BRLEZ	brlez  ,pt	%8,<label_0xa0001>
	.word 0xc42a0009  ! 2031: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xfc4a0009  ! 2031: LDSB_R	ldsb	[%r8 + %r9], %r30
	.word 0xc8ea2890  ! 2032: LDSTUBA_I	ldstuba	%r4, [%r8 + 0x0890] %asi
	.word 0xc36a0009  ! 2033: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc48a2900  ! 2034: LDUBA_I	lduba	[%r8, + 0x0900] %asi, %r2
	.word 0xca320009  ! 2036: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc4420009  ! 2036: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xc6f21009  ! 2037: STXA_R	stxa	%r3, [%r8 + %r9] 0x80
	.word 0x88da0009  ! 2038: SMULcc_R	smulcc 	%r8, %r9, %r4
	.word 0xc53a21e0  ! 2039: STDF_I	std	%f2, [0x01e0, %r8]
	.word 0x8ba20929  ! 2040: FMULs	fmuls	%f8, %f9, %f5
	.word 0xce220009  ! 2042: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xf11a0009  ! 2042: LDDF_R	ldd	[%r8, %r9], %f24
	.word 0xc3ea2194  ! 2043: PREFETCHA_I	prefetcha	[%r8, + 0x0194] %asi, #one_read
	.word 0xdefa1009  ! 2044: SWAPA_R	swapa	%r15, [%r8 + %r9] 0x80
	.word 0x824a0009  ! 2045: MULX_R	mulx 	%r8, %r9, %r1
	.word 0xcaa22a70  ! 2046: STWA_I	stwa	%r5, [%r8 + 0x0a70] %asi
	.word 0xa8da2e4c  ! 2047: SMULcc_I	smulcc 	%r8, 0x0e4c, %r20
	.word 0xfd220009  ! 2049: STF_R	st	%f30, [%r9, %r8]
	.word 0xc4720009  ! 2050: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xce5a0009  ! 2050: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xc48a2988  ! 2051: LDUBA_I	lduba	[%r8, + 0x0988] %asi, %r2
	.word 0x8143c000  ! 2052: STBAR	stbar
	.word 0xb36a0009  ! 2053: SDIVX_R	sdivx	%r8, %r9, %r25
	.word 0xcc220009  ! 2055: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xce4a0009  ! 2055: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xcb3a2c48  ! 2056: STDF_I	std	%f5, [0x0c48, %r8]
	.word 0xc41a2628  ! 2057: LDD_I	ldd	[%r8 + 0x0628], %r2
	.word 0x34800002  ! 2058: BG	bg,a	<label_0x2>
	.word 0xc36a2afc  ! 2059: PREFETCH_I	prefetch	[%r8 + 0x0afc], #one_read
	.word 0xc692278c  ! 2060: LDUHA_I	lduha	[%r8, + 0x078c] %asi, %r3
	.word 0x896a2000  ! 2061: SDIVX_I	sdivx	%r8, 0x0000, %r4
	.word 0xce6a0009  ! 2062: LDSTUB_R	ldstub	%r7, [%r8 + %r9]
	.word 0xbf6a2704  ! 2063: SDIVX_I	sdivx	%r8, 0x0704, %r31
	.word 0x1e800002  ! 2064: BVC	bvc  	<label_0x2>
	.word 0xc8aa1009  ! 2065: STBA_R	stba	%r4, [%r8 + %r9] 0x80
	.word 0xcab22758  ! 2066: STHA_I	stha	%r5, [%r8 + 0x0758] %asi
	.word 0xe0220009  ! 2068: STW_R	stw	%r16, [%r8 + %r9]
	.word 0xce0a0009  ! 2068: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0x8c4a0009  ! 2069: MULX_R	mulx 	%r8, %r9, %r6
	.word 0xc89a2028  ! 2070: LDDA_I	ldda	[%r8, + 0x0028] %asi, %r4
	.word 0x8c720009  ! 2071: UDIV_R	udiv 	%r8, %r9, %r6
	.word 0xc48227cc  ! 2072: LDUWA_I	lduwa	[%r8, + 0x07cc] %asi, %r2
	.word 0xc8320009  ! 2074: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xce020009  ! 2074: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xbe5a0009  ! 2075: SMUL_R	smul 	%r8, %r9, %r31
	.word 0xf02a0009  ! 2077: STB_R	stb	%r24, [%r8 + %r9]
	.word 0xca520009  ! 2077: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0x8143e067  ! 2078: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #MemIssue | #Sync 
	.word 0xcde22009  ! 2079: CASA_R	casa	[%r8] %asi, %r9, %r6
	.word 0xc27a2c58  ! 2080: SWAP_I	swap	%r1, [%r8 + 0x0c58]
	.word 0xcc2a0009  ! 2082: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xce020009  ! 2082: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xca522ea8  ! 2083: LDSH_I	ldsh	[%r8 + 0x0ea8], %r5
	.word 0x84fa2d6c  ! 2084: SDIVcc_I	sdivcc 	%r8, 0x0d6c, %r2
	.word 0x8a7a2d70  ! 2085: SDIV_I	sdiv 	%r8, 0x0d70, %r5
	.word 0xf0320009  ! 2087: STH_R	sth	%r24, [%r8 + %r9]
	.word 0xfe4a0009  ! 2087: LDSB_R	ldsb	[%r8 + %r9], %r31
	.word 0xc7f21009  ! 2088: CASXA_I	casxa	[%r8] 0x80, %r9, %r3
	.word 0x8e720009  ! 2089: UDIV_R	udiv 	%r8, %r9, %r7
	.word 0x8143c000  ! 2090: STBAR	stbar
	.word 0xcf222a60  ! 2091: STF_I	st	%f7, [0x0a60, %r8]
	.word 0xcde22009  ! 2092: CASA_R	casa	[%r8] %asi, %r9, %r6
	.word 0xe4f22998  ! 2093: STXA_I	stxa	%r18, [%r8 + 0x0998] %asi
	.word 0xc69221d8  ! 2094: LDUHA_I	lduha	[%r8, + 0x01d8] %asi, %r3
	.word 0xcb3a2b88  ! 2095: STDF_I	std	%f5, [0x0b88, %r8]
	.word 0xb5a208a9  ! 2096: FSUBs	fsubs	%f8, %f9, %f26
	.word 0xccfa202c  ! 2097: SWAPA_I	swapa	%r6, [%r8 + 0x002c] %asi
	.word 0x8143e006  ! 2098: MEMBAR	membar	#StoreLoad | #LoadStore 
	.word 0x8e5a2870  ! 2099: SMUL_I	smul 	%r8, 0x0870, %r7
	.word 0x8143e022  ! 2100: MEMBAR	membar	#StoreLoad | #MemIssue 
	.word 0xc36a2c78  ! 2101: PREFETCH_I	prefetch	[%r8 + 0x0c78], #one_read
	.word 0xc4a22ff4  ! 2102: STWA_I	stwa	%r2, [%r8 + 0x0ff4] %asi
	.word 0xc3ea1009  ! 2103: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x844a0009  ! 2104: MULX_R	mulx 	%r8, %r9, %r2
	.word 0x8143e041  ! 2105: MEMBAR	membar	#LoadLoad | #Sync 
	.word 0xe62a0009  ! 2107: STB_R	stb	%r19, [%r8 + %r9]
	.word 0xf3020009  ! 2107: LDF_R	ld	[%r8, %r9], %f25
	.word 0x8143c000  ! 2108: STBAR	stbar
	.word 0x9b220009  ! 2109: MULScc_R	mulscc 	%r8, %r9, %r13
	.word 0xcc4a0009  ! 2110: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xc2f21009  ! 2111: STXA_R	stxa	%r1, [%r8 + %r9] 0x80
	.word 0xc8720009  ! 2113: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc6520009  ! 2113: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xc8ca1009  ! 2114: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r4
	.word 0x8c4a2e6c  ! 2115: MULX_I	mulx 	%r8, 0x0e6c, %r6
	.word 0xc2b21009  ! 2116: STHA_R	stha	%r1, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 2117: STBAR	stbar
	.word 0xf8720009  ! 2119: STX_R	stx	%r28, [%r8 + %r9]
	.word 0xc91a0009  ! 2119: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xcc4a0009  ! 2120: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xc3ea1009  ! 2121: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xf2f21009  ! 2122: STXA_R	stxa	%r25, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 2123: STBAR	stbar
	.word 0x836a29ac  ! 2124: SDIVX_I	sdivx	%r8, 0x09ac, %r1
	.word 0x8322216c  ! 2125: MULScc_I	mulscc 	%r8, 0x016c, %r1
	.word 0xc36a0009  ! 2126: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xd9222528  ! 2127: STF_I	st	%f12, [0x0528, %r8]
	.word 0xcc220009  ! 2129: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xde5a0009  ! 2129: LDX_R	ldx	[%r8 + %r9], %r15
	.word 0x24800001  ! 2130: BLE	ble,a	<label_0x1>
	.word 0xec320009  ! 2132: STH_R	sth	%r22, [%r8 + %r9]
	.word 0xca4a0009  ! 2132: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xcad22338  ! 2133: LDSHA_I	ldsha	[%r8, + 0x0338] %asi, %r5
	.word 0xf8ba1009  ! 2134: STDA_R	stda	%r28, [%r8 + %r9] 0x80
	.word 0xc4c222c0  ! 2135: LDSWA_I	ldswa	[%r8, + 0x02c0] %asi, %r2
	.word 0xca2a0009  ! 2137: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xe81a0009  ! 2137: LDD_R	ldd	[%r8 + %r9], %r20
	.word 0x8a5a246c  ! 2138: SMUL_I	smul 	%r8, 0x046c, %r5
	.word 0x2e800001  ! 2139: BVS	bvs,a	<label_0x1>
	.word 0xc36a0009  ! 2140: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc86a0009  ! 2141: LDSTUB_R	ldstub	%r4, [%r8 + %r9]
	.word 0x8143c000  ! 2142: STBAR	stbar
	.word 0x89a20829  ! 2143: FADDs	fadds	%f8, %f9, %f4
	.word 0xcf222bfc  ! 2144: STF_I	st	%f7, [0x0bfc, %r8]
	.word 0xceaa1009  ! 2145: STBA_R	stba	%r7, [%r8 + %r9] 0x80
	.word 0xca120009  ! 2146: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0x8c7a0009  ! 2147: SDIV_R	sdiv 	%r8, %r9, %r6
	.word 0xa72226dc  ! 2148: MULScc_I	mulscc 	%r8, 0x06dc, %r19
	.word 0xea122448  ! 2149: LDUH_I	lduh	[%r8 + 0x0448], %r21
	.word 0xc6320009  ! 2151: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc6020009  ! 2151: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0x86da0009  ! 2152: SMULcc_R	smulcc 	%r8, %r9, %r3
	.word 0x8143e057  ! 2153: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside | #Sync 
	.word 0xc4320009  ! 2155: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xf1020009  ! 2155: LDF_R	ld	[%r8, %r9], %f24
	.word 0xeaa21009  ! 2156: STWA_R	stwa	%r21, [%r8 + %r9] 0x80
	.word 0xc67a24d0  ! 2157: SWAP_I	swap	%r3, [%r8 + 0x04d0]
	.word 0x02ca0001  ! 2158: BRZ	brz  ,pt	%8,<label_0xa0001>
	.word 0xd8aa28bc  ! 2159: STBA_I	stba	%r12, [%r8 + 0x08bc] %asi
	.word 0xecba1009  ! 2160: STDA_R	stda	%r22, [%r8 + %r9] 0x80
	.word 0x40000001  ! 2161: CALL	call	disp30_1
	.word 0x85a208a9  ! 2162: FSUBs	fsubs	%f8, %f9, %f2
	.word 0x8e4a27b4  ! 2163: MULX_I	mulx 	%r8, 0x07b4, %r7
	.word 0x82522354  ! 2164: UMUL_I	umul 	%r8, 0x0354, %r1
	.word 0xc4720009  ! 2166: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xcc4a0009  ! 2166: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xce122d80  ! 2167: LDUH_I	lduh	[%r8 + 0x0d80], %r7
	.word 0x8652273c  ! 2168: UMUL_I	umul 	%r8, 0x073c, %r3
	.word 0xc09a1009  ! 2169: LDDA_R	ldda	[%r8, %r9] 0x80, %r0
	.word 0xc8c2257c  ! 2170: LDSWA_I	ldswa	[%r8, + 0x057c] %asi, %r4
	.word 0xcf3a2ba0  ! 2171: STDF_I	std	%f7, [0x0ba0, %r8]
	.word 0xec220009  ! 2173: STW_R	stw	%r22, [%r8 + %r9]
	.word 0xc8420009  ! 2173: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xe2b21009  ! 2174: STHA_R	stha	%r17, [%r8 + %r9] 0x80
	.word 0xc6220009  ! 2176: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc8120009  ! 2176: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xc22a0009  ! 2178: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xd71a0009  ! 2178: LDDF_R	ldd	[%r8, %r9], %f11
	.word 0xe62a0009  ! 2180: STB_R	stb	%r19, [%r8 + %r9]
	.word 0xcd1a0009  ! 2180: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0x8e4a0009  ! 2181: MULX_R	mulx 	%r8, %r9, %r7
	.word 0x8143c000  ! 2182: STBAR	stbar
	.word 0xbc4a2cf4  ! 2183: MULX_I	mulx 	%r8, 0x0cf4, %r30
	.word 0xc48a1009  ! 2184: LDUBA_R	lduba	[%r8, %r9] 0x80, %r2
	.word 0xc4220009  ! 2186: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xce020009  ! 2186: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xcaca2538  ! 2187: LDSBA_I	ldsba	[%r8, + 0x0538] %asi, %r5
	.word 0x867a0009  ! 2188: SDIV_R	sdiv 	%r8, %r9, %r3
	.word 0xcc422230  ! 2189: LDSW_I	ldsw	[%r8 + 0x0230], %r6
	.word 0xf6320009  ! 2191: STH_R	sth	%r27, [%r8 + %r9]
	.word 0xcc420009  ! 2191: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xef3a2bb0  ! 2192: STDF_I	std	%f23, [0x0bb0, %r8]
	.word 0xc93a0009  ! 2194: STDF_R	std	%f4, [%r9, %r8]
	.word 0xc2720009  ! 2195: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xe0520009  ! 2195: LDSH_R	ldsh	[%r8 + %r9], %r16
	.word 0xc6320009  ! 2197: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc4420009  ! 2197: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xd66a230c  ! 2198: LDSTUB_I	ldstub	%r11, [%r8 + 0x030c]
	.word 0xc2b223b0  ! 2199: STHA_I	stha	%r1, [%r8 + 0x03b0] %asi
	.word 0xfe122dac  ! 2200: LDUH_I	lduh	[%r8 + 0x0dac], %r31
	.word 0xfc2a0009  ! 2202: STB_R	stb	%r30, [%r8 + %r9]
	.word 0xe85a0009  ! 2202: LDX_R	ldx	[%r8 + %r9], %r20
	.word 0xcc320009  ! 2204: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xcc5a0009  ! 2204: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xcc0a2118  ! 2205: LDUB_I	ldub	[%r8 + 0x0118], %r6
	.word 0xce6a27f4  ! 2206: LDSTUB_I	ldstub	%r7, [%r8 + 0x07f4]
	.word 0x8e7a2d94  ! 2207: SDIV_I	sdiv 	%r8, 0x0d94, %r7
	.word 0xc2d21009  ! 2208: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r1
	.word 0x20800001  ! 2209: BN	bn,a	<label_0x1>
	.word 0xc51a0009  ! 2210: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xb25a2bd4  ! 2211: SMUL_I	smul 	%r8, 0x0bd4, %r25
	.word 0x1c800001  ! 2212: BPOS	bpos  	<label_0x1>
	.word 0xce6a2650  ! 2213: LDSTUB_I	ldstub	%r7, [%r8 + 0x0650]
	.word 0xee0229cc  ! 2214: LDUW_I	lduw	[%r8 + 0x09cc], %r23
	.word 0x9c7a2198  ! 2215: SDIV_I	sdiv 	%r8, 0x0198, %r14
	.word 0xc22a0009  ! 2217: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xca520009  ! 2217: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xc33a2480  ! 2218: STDF_I	std	%f1, [0x0480, %r8]
	.word 0xca120009  ! 2219: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xcc8a1009  ! 2220: LDUBA_R	lduba	[%r8, %r9] 0x80, %r6
	.word 0xebf22009  ! 2221: CASXA_R	casxa	[%r8]%asi, %r9, %r21
	.word 0xae6a0009  ! 2222: UDIVX_R	udivx 	%r8, %r9, %r23
	.word 0x886a0009  ! 2223: UDIVX_R	udivx 	%r8, %r9, %r4
	.word 0xc4b22464  ! 2224: STHA_I	stha	%r2, [%r8 + 0x0464] %asi
	.word 0xce2a0009  ! 2226: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc84a0009  ! 2226: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xf8320009  ! 2228: STH_R	sth	%r28, [%r8 + %r9]
	.word 0xd8420009  ! 2228: LDSW_R	ldsw	[%r8 + %r9], %r12
	.word 0x8143c000  ! 2229: STBAR	stbar
	.word 0xc33a0009  ! 2231: STDF_R	std	%f1, [%r9, %r8]
	.word 0xe8720009  ! 2232: STX_R	stx	%r20, [%r8 + %r9]
	.word 0xc6520009  ! 2232: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0x836a0009  ! 2233: SDIVX_R	sdivx	%r8, %r9, %r1
	.word 0x24ca0001  ! 2234: BRLEZ	brlez,a,pt	%8,<label_0xa0001>
	.word 0x40000001  ! 2235: CALL	call	disp30_1
	.word 0x8efa29bc  ! 2236: SDIVcc_I	sdivcc 	%r8, 0x09bc, %r7
	.word 0x88f20009  ! 2237: UDIVcc_R	udivcc 	%r8, %r9, %r4
	.word 0x8ba209a9  ! 2238: FDIVs	fdivs	%f8, %f9, %f5
	.word 0xc3ea1009  ! 2239: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc71a0009  ! 2240: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xda720009  ! 2242: STX_R	stx	%r13, [%r8 + %r9]
	.word 0xc3020009  ! 2242: LDF_R	ld	[%r8, %r9], %f1
	.word 0xe85a0009  ! 2243: LDX_R	ldx	[%r8 + %r9], %r20
	.word 0xc8d21009  ! 2244: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r4
	.word 0xcaf21009  ! 2245: STXA_R	stxa	%r5, [%r8 + %r9] 0x80
	.word 0xbcf20009  ! 2246: UDIVcc_R	udivcc 	%r8, %r9, %r30
	.word 0x18800001  ! 2247: BGU	bgu  	<label_0x1>
	.word 0xc6ea1009  ! 2248: LDSTUBA_R	ldstuba	%r3, [%r8 + %r9] 0x80
	.word 0xce720009  ! 2250: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc6120009  ! 2250: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xf46a0009  ! 2251: LDSTUB_R	ldstub	%r26, [%r8 + %r9]
	.word 0xca720009  ! 2253: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xe8020009  ! 2253: LDUW_R	lduw	[%r8 + %r9], %r20
	.word 0xc9220009  ! 2255: STF_R	st	%f4, [%r9, %r8]
	.word 0xca720009  ! 2256: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc25a0009  ! 2256: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0x2cc20001  ! 2257: BRGZ	brgz,a,nt	%8,<label_0x20001>
	.word 0xc3220009  ! 2259: STF_R	st	%f1, [%r9, %r8]
	.word 0xf6720009  ! 2260: STX_R	stx	%r27, [%r8 + %r9]
	.word 0xc41a0009  ! 2260: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x82f20009  ! 2261: UDIVcc_R	udivcc 	%r8, %r9, %r1
	.word 0xe09a2890  ! 2262: LDDA_I	ldda	[%r8, + 0x0890] %asi, %r16
	.word 0xc0ba1009  ! 2263: STDA_R	stda	%r0, [%r8 + %r9] 0x80
	.word 0xc6a229d4  ! 2264: STWA_I	stwa	%r3, [%r8 + 0x09d4] %asi
	.word 0x8b6a2778  ! 2265: SDIVX_I	sdivx	%r8, 0x0778, %r5
	.word 0xc4320009  ! 2267: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xec4a0009  ! 2267: LDSB_R	ldsb	[%r8 + %r9], %r22
	.word 0xd6320009  ! 2269: STH_R	sth	%r11, [%r8 + %r9]
	.word 0xc4120009  ! 2269: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xd4ba1009  ! 2270: STDA_R	stda	%r10, [%r8 + %r9] 0x80
	.word 0xc3ea2dcc  ! 2271: PREFETCHA_I	prefetcha	[%r8, + 0x0dcc] %asi, #one_read
	.word 0xc8ba2a70  ! 2272: STDA_I	stda	%r4, [%r8 + 0x0a70] %asi
	.word 0x83a20829  ! 2273: FADDs	fadds	%f8, %f9, %f1
	.word 0xc46a212c  ! 2274: LDSTUB_I	ldstub	%r2, [%r8 + 0x012c]
	.word 0xc4ba2d80  ! 2275: STDA_I	stda	%r2, [%r8 + 0x0d80] %asi
	.word 0x8e520009  ! 2276: UMUL_R	umul 	%r8, %r9, %r7
	.word 0xca7a27c8  ! 2277: SWAP_I	swap	%r5, [%r8 + 0x07c8]
	.word 0xc40a0009  ! 2278: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xc36a26a8  ! 2279: PREFETCH_I	prefetch	[%r8 + 0x06a8], #one_read
	.word 0x08800002  ! 2280: BLEU	bleu  	<label_0x2>
	.word 0xcc6a2ad0  ! 2281: LDSTUB_I	ldstub	%r6, [%r8 + 0x0ad0]
	.word 0xcaa21009  ! 2282: STWA_R	stwa	%r5, [%r8 + %r9] 0x80
	.word 0xfeb22ff8  ! 2283: STHA_I	stha	%r31, [%r8 + 0x0ff8] %asi
	.word 0xe47a0009  ! 2284: SWAP_R	swap	%r18, [%r8 + %r9]
	.word 0x12800002  ! 2285: BNE	bne  	<label_0x2>
	.word 0xcaca22d4  ! 2286: LDSBA_I	ldsba	[%r8, + 0x02d4] %asi, %r5
	.word 0x8143e052  ! 2287: MEMBAR	membar	#StoreLoad | #Lookaside | #Sync 
	.word 0xf0fa1009  ! 2288: SWAPA_R	swapa	%r24, [%r8 + %r9] 0x80
	.word 0xfe2a0009  ! 2290: STB_R	stb	%r31, [%r8 + %r9]
	.word 0xca120009  ! 2290: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xc36a2224  ! 2291: PREFETCH_I	prefetch	[%r8 + 0x0224], #one_read
	.word 0x8143c000  ! 2292: STBAR	stbar
	.word 0xc6220009  ! 2294: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xce4a0009  ! 2294: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0x8f222508  ! 2295: MULScc_I	mulscc 	%r8, 0x0508, %r7
	.word 0xcb3a0009  ! 2297: STDF_R	std	%f5, [%r9, %r8]
	.word 0xc4720009  ! 2298: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xd8020009  ! 2298: LDUW_R	lduw	[%r8 + %r9], %r12
	.word 0x84520009  ! 2299: UMUL_R	umul 	%r8, %r9, %r2
	.word 0xc36a0009  ! 2300: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0x885222f4  ! 2301: UMUL_I	umul 	%r8, 0x02f4, %r4
	.word 0xc73a2028  ! 2302: STDF_I	std	%f3, [0x0028, %r8]
	.word 0xcc1a2560  ! 2303: LDD_I	ldd	[%r8 + 0x0560], %r6
	.word 0xce8a238c  ! 2304: LDUBA_I	lduba	[%r8, + 0x038c] %asi, %r7
	.word 0xe92220e0  ! 2305: STF_I	st	%f20, [0x00e0, %r8]
	.word 0x867a2dfc  ! 2306: SDIV_I	sdiv 	%r8, 0x0dfc, %r3
	.word 0xcc120009  ! 2307: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xc4ba1009  ! 2308: STDA_R	stda	%r2, [%r8 + %r9] 0x80
	.word 0x824a0009  ! 2309: MULX_R	mulx 	%r8, %r9, %r1
	.word 0xe8320009  ! 2311: STH_R	sth	%r20, [%r8 + %r9]
	.word 0xe0520009  ! 2311: LDSH_R	ldsh	[%r8 + %r9], %r16
	.word 0xc3ea1009  ! 2312: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc36a21b8  ! 2313: PREFETCH_I	prefetch	[%r8 + 0x01b8], #one_read
	.word 0xf65a0009  ! 2314: LDX_R	ldx	[%r8 + %r9], %r27
	.word 0xc36a2adc  ! 2315: PREFETCH_I	prefetch	[%r8 + 0x0adc], #one_read
	.word 0xf0a21009  ! 2316: STWA_R	stwa	%r24, [%r8 + %r9] 0x80
	.word 0x1c800001  ! 2317: BPOS	bpos  	<label_0x1>
	.word 0xa5a20929  ! 2318: FMULs	fmuls	%f8, %f9, %f18
	.word 0x84720009  ! 2319: UDIV_R	udiv 	%r8, %r9, %r2
	.word 0x0a800001  ! 2320: BCS	bcs  	<label_0x1>
	.word 0xfcc22f38  ! 2321: LDSWA_I	ldswa	[%r8, + 0x0f38] %asi, %r30
	.word 0xc89a1009  ! 2322: LDDA_R	ldda	[%r8, %r9] 0x80, %r4
	.word 0xc4ba1009  ! 2323: STDA_R	stda	%r2, [%r8 + %r9] 0x80
	.word 0xba720009  ! 2324: UDIV_R	udiv 	%r8, %r9, %r29
	.word 0x8cf20009  ! 2325: UDIVcc_R	udivcc 	%r8, %r9, %r6
	.word 0xc3ea23d8  ! 2326: PREFETCHA_I	prefetcha	[%r8, + 0x03d8] %asi, #one_read
	.word 0xe89a2248  ! 2327: LDDA_I	ldda	[%r8, + 0x0248] %asi, %r20
	.word 0x06800001  ! 2328: BL	bl  	<label_0x1>
	.word 0xc6320009  ! 2330: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xce0a0009  ! 2330: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xc82a0009  ! 2332: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc6020009  ! 2332: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xcb3a2c38  ! 2333: STDF_I	std	%f5, [0x0c38, %r8]
	.word 0xceaa1009  ! 2334: STBA_R	stba	%r7, [%r8 + %r9] 0x80
	.word 0x14800001  ! 2335: BG	bg  	<label_0x1>
	.word 0xc28a2184  ! 2336: LDUBA_I	lduba	[%r8, + 0x0184] %asi, %r1
	.word 0x887a2220  ! 2337: SDIV_I	sdiv 	%r8, 0x0220, %r4
	.word 0x0c800001  ! 2338: BNEG	bneg  	<label_0x1>
	.word 0x1a800002  ! 2339: BCC	bcc  	<label_0x2>
	.word 0x82520009  ! 2340: UMUL_R	umul 	%r8, %r9, %r1
	.word 0xceb22d4c  ! 2341: STHA_I	stha	%r7, [%r8 + 0x0d4c] %asi
	.word 0xe1e22009  ! 2342: CASA_R	casa	[%r8] %asi, %r9, %r16
	.word 0x38800001  ! 2343: BGU	bgu,a	<label_0x1>
	.word 0xc3ea24a0  ! 2344: PREFETCHA_I	prefetcha	[%r8, + 0x04a0] %asi, #one_read
	.word 0xc8a225e8  ! 2345: STWA_I	stwa	%r4, [%r8 + 0x05e8] %asi
	.word 0xf2822bc8  ! 2346: LDUWA_I	lduwa	[%r8, + 0x0bc8] %asi, %r25
	.word 0xb2da0009  ! 2347: SMULcc_R	smulcc 	%r8, %r9, %r25
	.word 0xc8a22a44  ! 2348: STWA_I	stwa	%r4, [%r8 + 0x0a44] %asi
	.word 0xc3ea22b4  ! 2349: PREFETCHA_I	prefetcha	[%r8, + 0x02b4] %asi, #one_read
	.word 0xc93a0009  ! 2351: STDF_R	std	%f4, [%r9, %r8]
	.word 0xc8720009  ! 2352: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xca020009  ! 2352: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0x22800001  ! 2353: BE	be,a	<label_0x1>
	.word 0x8143c000  ! 2354: STBAR	stbar
	.word 0x8143e015  ! 2355: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside 
	.word 0xde320009  ! 2357: STH_R	sth	%r15, [%r8 + %r9]
	.word 0xc2520009  ! 2357: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xcc6a2ed4  ! 2358: LDSTUB_I	ldstub	%r6, [%r8 + 0x0ed4]
	.word 0xccba1009  ! 2359: STDA_R	stda	%r6, [%r8 + %r9] 0x80
	.word 0xb5222e8c  ! 2360: MULScc_I	mulscc 	%r8, 0x0e8c, %r26
	.word 0x86f22d14  ! 2361: UDIVcc_I	udivcc 	%r8, 0x0d14, %r3
	.word 0x8143c000  ! 2362: STBAR	stbar
	.word 0xc3ea1009  ! 2363: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc93a0009  ! 2365: STDF_R	std	%f4, [%r9, %r8]
	.word 0xce720009  ! 2366: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc25a0009  ! 2366: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xbed22708  ! 2367: UMULcc_I	umulcc 	%r8, 0x0708, %r31
	.word 0xc8320009  ! 2369: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xf6520009  ! 2369: LDSH_R	ldsh	[%r8 + %r9], %r27
	.word 0xf6d22280  ! 2370: LDSHA_I	ldsha	[%r8, + 0x0280] %asi, %r27
	.word 0x89222c84  ! 2371: MULScc_I	mulscc 	%r8, 0x0c84, %r4
	.word 0xccb22d6c  ! 2372: STHA_I	stha	%r6, [%r8 + 0x0d6c] %asi
	.word 0xc82a0009  ! 2374: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xdb1a0009  ! 2374: LDDF_R	ldd	[%r8, %r9], %f13
	.word 0xc36a2270  ! 2375: PREFETCH_I	prefetch	[%r8 + 0x0270], #one_read
	.word 0xc2020009  ! 2376: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xc8b21009  ! 2377: STHA_R	stha	%r4, [%r8 + %r9] 0x80
	.word 0xc6ea2e8c  ! 2378: LDSTUBA_I	ldstuba	%r3, [%r8 + 0x0e8c] %asi
	.word 0x8143e024  ! 2379: MEMBAR	membar	#LoadStore | #MemIssue 
	.word 0xc92228f0  ! 2380: STF_I	st	%f4, [0x08f0, %r8]
	.word 0xe4220009  ! 2382: STW_R	stw	%r18, [%r8 + %r9]
	.word 0xc8120009  ! 2382: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0x8143c000  ! 2383: STBAR	stbar
	.word 0xc36a0009  ! 2384: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xceaa2698  ! 2385: STBA_I	stba	%r7, [%r8 + 0x0698] %asi
	.word 0xc3ea2188  ! 2386: PREFETCHA_I	prefetcha	[%r8, + 0x0188] %asi, #one_read
	.word 0xc9f22009  ! 2387: CASXA_R	casxa	[%r8]%asi, %r9, %r4
	.word 0xdc7a2224  ! 2388: SWAP_I	swap	%r14, [%r8 + 0x0224]
	.word 0xc36a0009  ! 2389: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xca220009  ! 2391: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xca420009  ! 2391: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0x9a4a0009  ! 2392: MULX_R	mulx 	%r8, %r9, %r13
	.word 0xc3ea1009  ! 2393: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc93a0009  ! 2395: STDF_R	std	%f4, [%r9, %r8]
	.word 0xc2720009  ! 2396: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xeb020009  ! 2396: LDF_R	ld	[%r8, %r9], %f21
	.word 0x8e5a0009  ! 2397: SMUL_R	smul 	%r8, %r9, %r7
	.word 0xce320009  ! 2399: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc85a0009  ! 2399: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xce4a2b50  ! 2400: LDSB_I	ldsb	[%r8 + 0x0b50], %r7
	.word 0xe0ba1009  ! 2401: STDA_R	stda	%r16, [%r8 + %r9] 0x80
	.word 0xe1220009  ! 2403: STF_R	st	%f16, [%r9, %r8]
	.word 0xc2720009  ! 2404: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xca4a0009  ! 2404: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0x8143e001  ! 2405: MEMBAR	membar	#LoadLoad 
	.word 0xc4fa1009  ! 2406: SWAPA_R	swapa	%r2, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 2407: STBAR	stbar
	.word 0x86f20009  ! 2408: UDIVcc_R	udivcc 	%r8, %r9, %r3
	.word 0x8e522008  ! 2409: UMUL_I	umul 	%r8, 0x0008, %r7
	.word 0xc8a21009  ! 2410: STWA_R	stwa	%r4, [%r8 + %r9] 0x80
	.word 0xf0720009  ! 2412: STX_R	stx	%r24, [%r8 + %r9]
	.word 0xd8020009  ! 2412: LDUW_R	lduw	[%r8 + %r9], %r12
	.word 0x2ac20001  ! 2413: BRNZ	brnz,a,nt	%8,<label_0x20001>
	.word 0xc6aa1009  ! 2414: STBA_R	stba	%r3, [%r8 + %r9] 0x80
	.word 0x8c720009  ! 2415: UDIV_R	udiv 	%r8, %r9, %r6
	.word 0x02ca0001  ! 2416: BRZ	brz  ,pt	%8,<label_0xa0001>
	.word 0xc8ba1009  ! 2417: STDA_R	stda	%r4, [%r8 + %r9] 0x80
	.word 0xfada2ce0  ! 2418: LDXA_I	ldxa	[%r8, + 0x0ce0] %asi, %r29
	.word 0xcc2a0009  ! 2420: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc8420009  ! 2420: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xcd222abc  ! 2421: STF_I	st	%f6, [0x0abc, %r8]
	.word 0xce520009  ! 2422: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xc82a0009  ! 2424: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xca0a0009  ! 2424: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0x8143e033  ! 2425: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside | #MemIssue 
	.word 0x8a522328  ! 2426: UMUL_I	umul 	%r8, 0x0328, %r5
	.word 0xc42a0009  ! 2428: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc5020009  ! 2428: LDF_R	ld	[%r8, %r9], %f2
	.word 0xc85a0009  ! 2429: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0x2c800001  ! 2430: BNEG	bneg,a	<label_0x1>
	.word 0xef222fdc  ! 2431: STF_I	st	%f23, [0x0fdc, %r8]
	.word 0xf6320009  ! 2433: STH_R	sth	%r27, [%r8 + %r9]
	.word 0xcd020009  ! 2433: LDF_R	ld	[%r8, %r9], %f6
	.word 0x8da20829  ! 2434: FADDs	fadds	%f8, %f9, %f6
	.word 0xe6220009  ! 2436: STW_R	stw	%r19, [%r8 + %r9]
	.word 0xc40a0009  ! 2436: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xced21009  ! 2437: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r7
	.word 0xcc2a0009  ! 2439: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xca4a0009  ! 2439: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xe9e21009  ! 2440: CASA_I	casa	[%r8] 0x80, %r9, %r20
	.word 0xccba1009  ! 2441: STDA_R	stda	%r6, [%r8 + %r9] 0x80
	.word 0xc89a2098  ! 2442: LDDA_I	ldda	[%r8, + 0x0098] %asi, %r4
	.word 0x8143e066  ! 2443: MEMBAR	membar	#StoreLoad | #LoadStore | #MemIssue | #Sync 
	.word 0xc6ea1009  ! 2444: LDSTUBA_R	ldstuba	%r3, [%r8 + %r9] 0x80
	.word 0xc33a2be0  ! 2445: STDF_I	std	%f1, [0x0be0, %r8]
	.word 0xcc220009  ! 2447: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xe84a0009  ! 2447: LDSB_R	ldsb	[%r8 + %r9], %r20
	.word 0xc40a2480  ! 2448: LDUB_I	ldub	[%r8 + 0x0480], %r2
	.word 0xc66a2498  ! 2449: LDSTUB_I	ldstub	%r3, [%r8 + 0x0498]
	.word 0xcd3a2990  ! 2450: STDF_I	std	%f6, [0x0990, %r8]
	.word 0xcac21009  ! 2451: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r5
	.word 0xcea22234  ! 2452: STWA_I	stwa	%r7, [%r8 + 0x0234] %asi
	.word 0x8143e041  ! 2453: MEMBAR	membar	#LoadLoad | #Sync 
	.word 0x22800001  ! 2454: BE	be,a	<label_0x1>
	.word 0xc36a2e3c  ! 2455: PREFETCH_I	prefetch	[%r8 + 0x0e3c], #one_read
	.word 0xc2320009  ! 2457: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc60a0009  ! 2457: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xc33a0009  ! 2459: STDF_R	std	%f1, [%r9, %r8]
	.word 0xdc720009  ! 2460: STX_R	stx	%r14, [%r8 + %r9]
	.word 0xd91a0009  ! 2460: LDDF_R	ldd	[%r8, %r9], %f12
	.word 0x847a2c30  ! 2461: SDIV_I	sdiv 	%r8, 0x0c30, %r2
	.word 0xc4da1009  ! 2462: LDXA_R	ldxa	[%r8, %r9] 0x80, %r2
	.word 0x8143e06b  ! 2463: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #MemIssue | #Sync 
	.word 0xcaa21009  ! 2464: STWA_R	stwa	%r5, [%r8 + %r9] 0x80
	.word 0xc72223e4  ! 2465: STF_I	st	%f3, [0x03e4, %r8]
	.word 0x8143e072  ! 2466: MEMBAR	membar	#StoreLoad | #Lookaside | #MemIssue | #Sync 
	.word 0xf2320009  ! 2468: STH_R	sth	%r25, [%r8 + %r9]
	.word 0xcc0a0009  ! 2468: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xf05a0009  ! 2469: LDX_R	ldx	[%r8 + %r9], %r24
	.word 0xd82a0009  ! 2471: STB_R	stb	%r12, [%r8 + %r9]
	.word 0xcc120009  ! 2471: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0x87222520  ! 2472: MULScc_I	mulscc 	%r8, 0x0520, %r3
	.word 0x34800001  ! 2473: BG	bg,a	<label_0x1>
	.word 0xc3ea1009  ! 2474: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xce7a2464  ! 2475: SWAP_I	swap	%r7, [%r8 + 0x0464]
	.word 0x825a29e8  ! 2476: SMUL_I	smul 	%r8, 0x09e8, %r1
	.word 0x8d6a2578  ! 2477: SDIVX_I	sdivx	%r8, 0x0578, %r6
	.word 0xc4320009  ! 2479: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xd8020009  ! 2479: LDUW_R	lduw	[%r8 + %r9], %r12
	.word 0xee2a0009  ! 2481: STB_R	stb	%r23, [%r8 + %r9]
	.word 0xe41a0009  ! 2481: LDD_R	ldd	[%r8 + %r9], %r18
	.word 0xc3ea1009  ! 2482: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc36a2cc4  ! 2483: PREFETCH_I	prefetch	[%r8 + 0x0cc4], #one_read
	.word 0xc2220009  ! 2485: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xe01a0009  ! 2485: LDD_R	ldd	[%r8 + %r9], %r16
	.word 0x9cda0009  ! 2486: SMULcc_R	smulcc 	%r8, %r9, %r14
	.word 0xf82a0009  ! 2488: STB_R	stb	%r28, [%r8 + %r9]
	.word 0xc6020009  ! 2488: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xce220009  ! 2490: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc8120009  ! 2490: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xc3ea25dc  ! 2491: PREFETCHA_I	prefetcha	[%r8, + 0x05dc] %asi, #one_read
	.word 0xc6422384  ! 2492: LDSW_I	ldsw	[%r8 + 0x0384], %r3
	.word 0xe85a0009  ! 2493: LDX_R	ldx	[%r8 + %r9], %r20
	.word 0xc6720009  ! 2495: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xf6520009  ! 2495: LDSH_R	ldsh	[%r8 + %r9], %r27
	.word 0xc3ea1009  ! 2496: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x8143e05d  ! 2497: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0xd6220009  ! 2499: STW_R	stw	%r11, [%r8 + %r9]
	.word 0xc31a0009  ! 2499: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xc3ea1009  ! 2500: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc8921009  ! 2501: LDUHA_R	lduha	[%r8, %r9] 0x80, %r4
	.word 0xc36a2b40  ! 2502: PREFETCH_I	prefetch	[%r8 + 0x0b40], #one_read
	.word 0xa8f20009  ! 2503: UDIVcc_R	udivcc 	%r8, %r9, %r20
	.word 0x06ca0001  ! 2504: BRLZ	brlz  ,pt	%8,<label_0xa0001>
	.word 0x8cfa2cbc  ! 2505: SDIVcc_I	sdivcc 	%r8, 0x0cbc, %r6
	.word 0xc73a0009  ! 2507: STDF_R	std	%f3, [%r9, %r8]
	.word 0xca720009  ! 2508: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xcc0a0009  ! 2508: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xc36a25e0  ! 2509: PREFETCH_I	prefetch	[%r8 + 0x05e0], #one_read
	.word 0xc8ea2c98  ! 2510: LDSTUBA_I	ldstuba	%r4, [%r8 + 0x0c98] %asi
	.word 0xb07a0009  ! 2511: SDIV_R	sdiv 	%r8, %r9, %r24
	.word 0xfd3a0009  ! 2513: STDF_R	std	%f30, [%r9, %r8]
	.word 0xce720009  ! 2514: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc2120009  ! 2514: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xd8a2292c  ! 2515: STWA_I	stwa	%r12, [%r8 + 0x092c] %asi
	.word 0xf1f21009  ! 2516: CASXA_I	casxa	[%r8] 0x80, %r9, %r24
	.word 0x8143e03b  ! 2517: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Lookaside | #MemIssue 
	.word 0xdcb22f14  ! 2518: STHA_I	stha	%r14, [%r8 + 0x0f14] %asi
	.word 0x884a0009  ! 2519: MULX_R	mulx 	%r8, %r9, %r4
	.word 0xcd220009  ! 2521: STF_R	st	%f6, [%r9, %r8]
	.word 0xde720009  ! 2522: STX_R	stx	%r15, [%r8 + %r9]
	.word 0xde120009  ! 2522: LDUH_R	lduh	[%r8 + %r9], %r15
	.word 0xc81a0009  ! 2523: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xc8220009  ! 2525: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc8120009  ! 2525: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xc8921009  ! 2526: LDUHA_R	lduha	[%r8, %r9] 0x80, %r4
	.word 0x8143c000  ! 2527: STBAR	stbar
	.word 0xc3ea2650  ! 2528: PREFETCHA_I	prefetcha	[%r8, + 0x0650] %asi, #one_read
	.word 0xccca1009  ! 2529: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r6
	.word 0xaba209a9  ! 2530: FDIVs	fdivs	%f8, %f9, %f21
	.word 0xfcb225b4  ! 2531: STHA_I	stha	%r30, [%r8 + 0x05b4] %asi
	.word 0xeb220009  ! 2533: STF_R	st	%f21, [%r9, %r8]
	.word 0xc2720009  ! 2534: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc45a0009  ! 2534: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xf4a22118  ! 2535: STWA_I	stwa	%r26, [%r8 + 0x0118] %asi
	.word 0xcc8a1009  ! 2536: LDUBA_R	lduba	[%r8, %r9] 0x80, %r6
	.word 0xc4220009  ! 2538: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xe00a0009  ! 2538: LDUB_R	ldub	[%r8 + %r9], %r16
	.word 0xef220009  ! 2540: STF_R	st	%f23, [%r9, %r8]
	.word 0xcc720009  ! 2541: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xde4a0009  ! 2541: LDSB_R	ldsb	[%r8 + %r9], %r15
	.word 0xa64a0009  ! 2542: MULX_R	mulx 	%r8, %r9, %r19
	.word 0xec220009  ! 2544: STW_R	stw	%r22, [%r8 + %r9]
	.word 0xfe020009  ! 2544: LDUW_R	lduw	[%r8 + %r9], %r31
	.word 0x24c20001  ! 2545: BRLEZ	brlez,a,nt	%8,<label_0x20001>
	.word 0xc36a2494  ! 2546: PREFETCH_I	prefetch	[%r8 + 0x0494], #one_read
	.word 0xc6ea1009  ! 2547: LDSTUBA_R	ldstuba	%r3, [%r8 + %r9] 0x80
	.word 0x886a0009  ! 2548: UDIVX_R	udivx 	%r8, %r9, %r4
	.word 0x2ac20001  ! 2549: BRNZ	brnz,a,nt	%8,<label_0x20001>
	.word 0xac7a0009  ! 2550: SDIV_R	sdiv 	%r8, %r9, %r22
	.word 0xcf222ce0  ! 2551: STF_I	st	%f7, [0x0ce0, %r8]
	.word 0x8143c000  ! 2552: STBAR	stbar
	.word 0x8143e012  ! 2553: MEMBAR	membar	#StoreLoad | #Lookaside 
	.word 0xc33a0009  ! 2555: STDF_R	std	%f1, [%r9, %r8]
	.word 0xf8720009  ! 2556: STX_R	stx	%r28, [%r8 + %r9]
	.word 0xc40a0009  ! 2556: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xa6fa0009  ! 2557: SDIVcc_R	sdivcc 	%r8, %r9, %r19
	.word 0xf87a0009  ! 2558: SWAP_R	swap	%r28, [%r8 + %r9]
	.word 0xc6f22110  ! 2559: STXA_I	stxa	%r3, [%r8 + 0x0110] %asi
	.word 0xf4220009  ! 2561: STW_R	stw	%r26, [%r8 + %r9]
	.word 0xcc5a0009  ! 2561: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xc88a1009  ! 2562: LDUBA_R	lduba	[%r8, %r9] 0x80, %r4
	.word 0x8143e033  ! 2563: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside | #MemIssue 
	.word 0x88d22b1c  ! 2564: UMULcc_I	umulcc 	%r8, 0x0b1c, %r4
	.word 0x83220009  ! 2565: MULScc_R	mulscc 	%r8, %r9, %r1
	.word 0xc41a23d8  ! 2566: LDD_I	ldd	[%r8 + 0x03d8], %r2
	.word 0x24c20001  ! 2567: BRLEZ	brlez,a,nt	%8,<label_0x20001>
	.word 0x965a0009  ! 2568: SMUL_R	smul 	%r8, %r9, %r11
	.word 0x89a209a9  ! 2569: FDIVs	fdivs	%f8, %f9, %f4
	.word 0xc3ea1009  ! 2570: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x8b220009  ! 2571: MULScc_R	mulscc 	%r8, %r9, %r5
	.word 0xc36a0009  ! 2572: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0x24ca0001  ! 2573: BRLEZ	brlez,a,pt	%8,<label_0xa0001>
	.word 0xff220009  ! 2575: STF_R	st	%f31, [%r9, %r8]
	.word 0xfc720009  ! 2576: STX_R	stx	%r30, [%r8 + %r9]
	.word 0xd81a0009  ! 2576: LDD_R	ldd	[%r8 + %r9], %r12
	.word 0xc2ea1009  ! 2577: LDSTUBA_R	ldstuba	%r1, [%r8 + %r9] 0x80
	.word 0x1a800002  ! 2578: BCC	bcc  	<label_0x2>
	.word 0xba7a0009  ! 2579: SDIV_R	sdiv 	%r8, %r9, %r29
	.word 0xda320009  ! 2581: STH_R	sth	%r13, [%r8 + %r9]
	.word 0xfa520009  ! 2581: LDSH_R	ldsh	[%r8 + %r9], %r29
	.word 0xc20a2398  ! 2582: LDUB_I	ldub	[%r8 + 0x0398], %r1
	.word 0x0cc20001  ! 2583: BRGZ	brgz  ,nt	%8,<label_0x20001>
	.word 0xcafa1009  ! 2584: SWAPA_R	swapa	%r5, [%r8 + %r9] 0x80
	.word 0xc8c21009  ! 2585: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r4
	.word 0xc25a0009  ! 2586: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xb0f20009  ! 2587: UDIVcc_R	udivcc 	%r8, %r9, %r24
	.word 0xc2a229ec  ! 2588: STWA_I	stwa	%r1, [%r8 + 0x09ec] %asi
	.word 0x825a0009  ! 2589: SMUL_R	smul 	%r8, %r9, %r1
	.word 0xc4921009  ! 2590: LDUHA_R	lduha	[%r8, %r9] 0x80, %r2
	.word 0xca220009  ! 2592: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xca420009  ! 2592: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xca320009  ! 2594: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xe1020009  ! 2594: LDF_R	ld	[%r8, %r9], %f16
	.word 0xa56a0009  ! 2595: SDIVX_R	sdivx	%r8, %r9, %r18
	.word 0xb9220009  ! 2596: MULScc_R	mulscc 	%r8, %r9, %r28
	.word 0xc3ea1009  ! 2597: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xdbe21009  ! 2598: CASA_I	casa	[%r8] 0x80, %r9, %r13
	.word 0xfff21009  ! 2599: CASXA_I	casxa	[%r8] 0x80, %r9, %r31
	.word 0xceb21009  ! 2600: STHA_R	stha	%r7, [%r8 + %r9] 0x80
	.word 0xf88a2aa4  ! 2601: LDUBA_I	lduba	[%r8, + 0x0aa4] %asi, %r28
	.word 0x00800002  ! 2602: BN	bn  	<label_0x2>
	.word 0xde220009  ! 2604: STW_R	stw	%r15, [%r8 + %r9]
	.word 0xcc420009  ! 2604: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xfea22f3c  ! 2605: STWA_I	stwa	%r31, [%r8 + 0x0f3c] %asi
	.word 0x1e800001  ! 2606: BVC	bvc  	<label_0x1>
	.word 0xce720009  ! 2608: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xce020009  ! 2608: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0x2ac20001  ! 2609: BRNZ	brnz,a,nt	%8,<label_0x20001>
	.word 0x38800001  ! 2610: BGU	bgu,a	<label_0x1>
	.word 0x8143e043  ! 2611: MEMBAR	membar	#LoadLoad | #StoreLoad | #Sync 
	.word 0x82da0009  ! 2612: SMULcc_R	smulcc 	%r8, %r9, %r1
	.word 0xc20a2104  ! 2613: LDUB_I	ldub	[%r8 + 0x0104], %r1
	.word 0xcb220009  ! 2615: STF_R	st	%f5, [%r9, %r8]
	.word 0xcc720009  ! 2616: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc20a0009  ! 2616: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xdb3a2290  ! 2617: STDF_I	std	%f13, [0x0290, %r8]
	.word 0x8143e03b  ! 2618: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Lookaside | #MemIssue 
	.word 0x82520009  ! 2619: UMUL_R	umul 	%r8, %r9, %r1
	.word 0xce220009  ! 2621: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xfe5a0009  ! 2621: LDX_R	ldx	[%r8 + %r9], %r31
	.word 0xe6320009  ! 2623: STH_R	sth	%r19, [%r8 + %r9]
	.word 0xca420009  ! 2623: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0x86720009  ! 2624: UDIV_R	udiv 	%r8, %r9, %r3
	.word 0x8143e009  ! 2625: MEMBAR	membar	#LoadLoad | #StoreStore 
	.word 0xc2ca1009  ! 2626: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r1
	.word 0xc2320009  ! 2628: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc44a0009  ! 2628: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0x8c4a0009  ! 2629: MULX_R	mulx 	%r8, %r9, %r6
	.word 0x30800001  ! 2630: BA	ba,a	<label_0x1>
	.word 0x8143c000  ! 2631: STBAR	stbar
	.word 0xf6ea224c  ! 2632: LDSTUBA_I	ldstuba	%r27, [%r8 + 0x024c] %asi
	.word 0xde020009  ! 2633: LDUW_R	lduw	[%r8 + %r9], %r15
	.word 0x8143c000  ! 2634: STBAR	stbar
	.word 0xc5220009  ! 2636: STF_R	st	%f2, [%r9, %r8]
	.word 0xc8720009  ! 2637: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xff020009  ! 2637: LDF_R	ld	[%r8, %r9], %f31
	.word 0xc4b21009  ! 2638: STHA_R	stha	%r2, [%r8 + %r9] 0x80
	.word 0xeaf21009  ! 2639: STXA_R	stxa	%r21, [%r8 + %r9] 0x80
	.word 0xc4220009  ! 2641: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xe6520009  ! 2641: LDSH_R	ldsh	[%r8 + %r9], %r19
	.word 0xc3220009  ! 2643: STF_R	st	%f1, [%r9, %r8]
	.word 0xc4720009  ! 2644: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc2120009  ! 2644: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xc36a2eec  ! 2645: PREFETCH_I	prefetch	[%r8 + 0x0eec], #one_read
	.word 0xfbf22009  ! 2646: CASXA_R	casxa	[%r8]%asi, %r9, %r29
	.word 0x8fa209a9  ! 2647: FDIVs	fdivs	%f8, %f9, %f7
	.word 0xc2220009  ! 2649: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xfe520009  ! 2649: LDSH_R	ldsh	[%r8 + %r9], %r31
	.word 0xe6220009  ! 2651: STW_R	stw	%r19, [%r8 + %r9]
	.word 0xc31a0009  ! 2651: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xccb21009  ! 2652: STHA_R	stha	%r6, [%r8 + %r9] 0x80
	.word 0x865a2914  ! 2653: SMUL_I	smul 	%r8, 0x0914, %r3
	.word 0xc80a0009  ! 2654: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0x24800001  ! 2655: BLE	ble,a	<label_0x1>
	.word 0x8e4a22e4  ! 2656: MULX_I	mulx 	%r8, 0x02e4, %r7
	.word 0xc3ea1009  ! 2657: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc3ea2c58  ! 2658: PREFETCHA_I	prefetcha	[%r8, + 0x0c58] %asi, #one_read
	.word 0xcc7a2878  ! 2659: SWAP_I	swap	%r6, [%r8 + 0x0878]
	.word 0xf6520009  ! 2660: LDSH_R	ldsh	[%r8 + %r9], %r27
	.word 0xc49222e8  ! 2661: LDUHA_I	lduha	[%r8, + 0x02e8] %asi, %r2
	.word 0x8143c000  ! 2662: STBAR	stbar
	.word 0xc3ea244c  ! 2663: PREFETCHA_I	prefetcha	[%r8, + 0x044c] %asi, #one_read
	.word 0xf49a2a78  ! 2664: LDDA_I	ldda	[%r8, + 0x0a78] %asi, %r26
	.word 0xc3ea1009  ! 2665: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc36a2218  ! 2666: PREFETCH_I	prefetch	[%r8 + 0x0218], #one_read
	.word 0xc7f21009  ! 2667: CASXA_I	casxa	[%r8] 0x80, %r9, %r3
	.word 0x0e800002  ! 2668: BVS	bvs  	<label_0x2>
	.word 0xc8ea2684  ! 2669: LDSTUBA_I	ldstuba	%r4, [%r8 + 0x0684] %asi
	.word 0xc36a2fe8  ! 2670: PREFETCH_I	prefetch	[%r8 + 0x0fe8], #one_read
	.word 0xc4da22e0  ! 2671: LDXA_I	ldxa	[%r8, + 0x02e0] %asi, %r2
	.word 0xc85a2808  ! 2672: LDX_I	ldx	[%r8 + 0x0808], %r4
	.word 0x12800001  ! 2673: BNE	bne  	<label_0x1>
	.word 0xc4220009  ! 2675: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xca420009  ! 2675: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0x8da20929  ! 2676: FMULs	fmuls	%f8, %f9, %f6
	.word 0xc36a0009  ! 2677: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc36a0009  ! 2678: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xe2720009  ! 2680: STX_R	stx	%r17, [%r8 + %r9]
	.word 0xc64a0009  ! 2680: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xc81a2400  ! 2681: LDD_I	ldd	[%r8 + 0x0400], %r4
	.word 0xced21009  ! 2682: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r7
	.word 0xc33a2b30  ! 2683: STDF_I	std	%f1, [0x0b30, %r8]
	.word 0x22800002  ! 2684: BE	be,a	<label_0x2>
	.word 0xe86a0009  ! 2685: LDSTUB_R	ldstub	%r20, [%r8 + %r9]
	.word 0xf62a0009  ! 2687: STB_R	stb	%r27, [%r8 + %r9]
	.word 0xc8120009  ! 2687: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xdc220009  ! 2689: STW_R	stw	%r14, [%r8 + %r9]
	.word 0xc5020009  ! 2689: LDF_R	ld	[%r8, %r9], %f2
	.word 0xeb222dc0  ! 2690: STF_I	st	%f21, [0x0dc0, %r8]
	.word 0x00800001  ! 2691: BN	bn  	<label_0x1>
	.word 0xc3ea2bb0  ! 2692: PREFETCHA_I	prefetcha	[%r8, + 0x0bb0] %asi, #one_read
	.word 0x8eda229c  ! 2693: SMULcc_I	smulcc 	%r8, 0x029c, %r7
	.word 0xc82a0009  ! 2695: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc85a0009  ! 2695: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xde220009  ! 2697: STW_R	stw	%r15, [%r8 + %r9]
	.word 0xc6420009  ! 2697: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xc27a2b1c  ! 2698: SWAP_I	swap	%r1, [%r8 + 0x0b1c]
	.word 0xa1a20929  ! 2699: FMULs	fmuls	%f8, %f9, %f16
	.word 0xc26a0009  ! 2700: LDSTUB_R	ldstub	%r1, [%r8 + %r9]
	.word 0xc6ca1009  ! 2701: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r3
	.word 0xc4220009  ! 2703: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xe4520009  ! 2703: LDSH_R	ldsh	[%r8 + %r9], %r18
	.word 0xc36a202c  ! 2704: PREFETCH_I	prefetch	[%r8 + 0x002c], #one_read
	.word 0xc87a0009  ! 2705: SWAP_R	swap	%r4, [%r8 + %r9]
	.word 0x30800001  ! 2706: BA	ba,a	<label_0x1>
	.word 0xc36a22b8  ! 2707: PREFETCH_I	prefetch	[%r8 + 0x02b8], #one_read
	.word 0xc6220009  ! 2709: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xf81a0009  ! 2709: LDD_R	ldd	[%r8 + %r9], %r28
	.word 0x8b6a2408  ! 2710: SDIVX_I	sdivx	%r8, 0x0408, %r5
	.word 0x8143c000  ! 2711: STBAR	stbar
	.word 0xc33a21a8  ! 2712: STDF_I	std	%f1, [0x01a8, %r8]
	.word 0xdeaa1009  ! 2713: STBA_R	stba	%r15, [%r8 + %r9] 0x80
	.word 0xc36a22f8  ! 2714: PREFETCH_I	prefetch	[%r8 + 0x02f8], #one_read
	.word 0xc20a2418  ! 2715: LDUB_I	ldub	[%r8 + 0x0418], %r1
	.word 0xa0d20009  ! 2716: UMULcc_R	umulcc 	%r8, %r9, %r16
	.word 0xf4422b18  ! 2717: LDSW_I	ldsw	[%r8 + 0x0b18], %r26
	.word 0xc3ea2320  ! 2718: PREFETCHA_I	prefetcha	[%r8, + 0x0320] %asi, #one_read
	.word 0xcc320009  ! 2720: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xf01a0009  ! 2720: LDD_R	ldd	[%r8 + %r9], %r24
	.word 0xe4020009  ! 2721: LDUW_R	lduw	[%r8 + %r9], %r18
	.word 0x8fa208a9  ! 2722: FSUBs	fsubs	%f8, %f9, %f7
	.word 0x8143c000  ! 2723: STBAR	stbar
	.word 0x8143c000  ! 2724: STBAR	stbar
	.word 0x8143c000  ! 2725: STBAR	stbar
	.word 0xc2f228c8  ! 2726: STXA_I	stxa	%r1, [%r8 + 0x08c8] %asi
	.word 0x84720009  ! 2727: UDIV_R	udiv 	%r8, %r9, %r2
	.word 0xbc5a0009  ! 2728: SMUL_R	smul 	%r8, %r9, %r30
	.word 0xc322288c  ! 2729: STF_I	st	%f1, [0x088c, %r8]
	.word 0xae5a0009  ! 2730: SMUL_R	smul 	%r8, %r9, %r23
	.word 0xc2f21009  ! 2731: STXA_R	stxa	%r1, [%r8 + %r9] 0x80
	.word 0xdf022538  ! 2732: LDF_I	ld	[%r8, 0x0538], %f15
	.word 0xc3ea1009  ! 2733: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x12800001  ! 2734: BNE	bne  	<label_0x1>
	.word 0xc6c21009  ! 2735: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r3
	.word 0xc01a2088  ! 2736: LDD_I	ldd	[%r8 + 0x0088], %r0
	.word 0xc4c22f1c  ! 2737: LDSWA_I	ldswa	[%r8, + 0x0f1c] %asi, %r2
	.word 0xc44a0009  ! 2738: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xea020009  ! 2739: LDUW_R	lduw	[%r8 + %r9], %r21
	.word 0x20800002  ! 2740: BN	bn,a	<label_0x2>
	.word 0xceea2bac  ! 2741: LDSTUBA_I	ldstuba	%r7, [%r8 + 0x0bac] %asi
	.word 0xc33a27a8  ! 2742: STDF_I	std	%f1, [0x07a8, %r8]
	.word 0xf84a28a0  ! 2743: LDSB_I	ldsb	[%r8 + 0x08a0], %r28
	.word 0xccaa2688  ! 2744: STBA_I	stba	%r6, [%r8 + 0x0688] %asi
	.word 0xce520009  ! 2745: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xcf222614  ! 2746: STF_I	st	%f7, [0x0614, %r8]
	.word 0xc2821009  ! 2747: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r1
	.word 0xe4c22b00  ! 2748: LDSWA_I	ldswa	[%r8, + 0x0b00] %asi, %r18
	.word 0x0c800002  ! 2749: BNEG	bneg  	<label_0x2>
	.word 0xc4fa2e08  ! 2750: SWAPA_I	swapa	%r2, [%r8 + 0x0e08] %asi
	.word 0xc36a0009  ! 2751: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xce320009  ! 2753: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc4120009  ! 2753: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xce320009  ! 2755: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc84a0009  ! 2755: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xc36a0009  ! 2756: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xda220009  ! 2758: STW_R	stw	%r13, [%r8 + %r9]
	.word 0xfe0a0009  ! 2758: LDUB_R	ldub	[%r8 + %r9], %r31
	.word 0xc36a2874  ! 2759: PREFETCH_I	prefetch	[%r8 + 0x0874], #one_read
	.word 0xb3a20829  ! 2760: FADDs	fadds	%f8, %f9, %f25
	.word 0x8a6a2550  ! 2761: UDIVX_I	udivx 	%r8, 0x0550, %r5
	.word 0xecc21009  ! 2762: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r22
	.word 0xc3ea209c  ! 2763: PREFETCHA_I	prefetcha	[%r8, + 0x009c] %asi, #one_read
	.word 0xc6c22d0c  ! 2764: LDSWA_I	ldswa	[%r8, + 0x0d0c] %asi, %r3
	.word 0xc3ea2dbc  ! 2765: PREFETCHA_I	prefetcha	[%r8, + 0x0dbc] %asi, #one_read
	.word 0x8143e057  ! 2766: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside | #Sync 
	.word 0xc4ba1009  ! 2767: STDA_R	stda	%r2, [%r8 + %r9] 0x80
	.word 0xe80227e0  ! 2768: LDUW_I	lduw	[%r8 + 0x07e0], %r20
	.word 0xa1a20929  ! 2769: FMULs	fmuls	%f8, %f9, %f16
	.word 0x8143c000  ! 2770: STBAR	stbar
	.word 0xc6120009  ! 2771: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xad220009  ! 2772: MULScc_R	mulscc 	%r8, %r9, %r22
	.word 0xc4ba2e88  ! 2773: STDA_I	stda	%r2, [%r8 + 0x0e88] %asi
	.word 0xfc2a0009  ! 2775: STB_R	stb	%r30, [%r8 + %r9]
	.word 0xca0a0009  ! 2775: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0x86720009  ! 2776: UDIV_R	udiv 	%r8, %r9, %r3
	.word 0xb87a204c  ! 2777: SDIV_I	sdiv 	%r8, 0x004c, %r28
	.word 0xf0ea1009  ! 2778: LDSTUBA_R	ldstuba	%r24, [%r8 + %r9] 0x80
	.word 0x89a209a9  ! 2779: FDIVs	fdivs	%f8, %f9, %f4
	.word 0xc73a0009  ! 2781: STDF_R	std	%f3, [%r9, %r8]
	.word 0xca720009  ! 2782: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xf65a0009  ! 2782: LDX_R	ldx	[%r8 + %r9], %r27
	.word 0xc8ba1009  ! 2783: STDA_R	stda	%r4, [%r8 + %r9] 0x80
	.word 0xcefa2dbc  ! 2784: SWAPA_I	swapa	%r7, [%r8 + 0x0dbc] %asi
	.word 0x04800001  ! 2785: BLE	ble  	<label_0x1>
	.word 0x8143c000  ! 2786: STBAR	stbar
	.word 0xc36a20c4  ! 2787: PREFETCH_I	prefetch	[%r8 + 0x00c4], #one_read
	.word 0xc4b22924  ! 2788: STHA_I	stha	%r2, [%r8 + 0x0924] %asi
	.word 0x8f6a20bc  ! 2789: SDIVX_I	sdivx	%r8, 0x00bc, %r7
	.word 0xaba20829  ! 2790: FADDs	fadds	%f8, %f9, %f21
	.word 0x8143c000  ! 2791: STBAR	stbar
	.word 0xe42a0009  ! 2793: STB_R	stb	%r18, [%r8 + %r9]
	.word 0xc4520009  ! 2793: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0x87222500  ! 2794: MULScc_I	mulscc 	%r8, 0x0500, %r3
	.word 0xc4ea1009  ! 2795: LDSTUBA_R	ldstuba	%r2, [%r8 + %r9] 0x80
	.word 0x8c4a2ba0  ! 2796: MULX_I	mulx 	%r8, 0x0ba0, %r6
	.word 0xc0ba2358  ! 2797: STDA_I	stda	%r0, [%r8 + 0x0358] %asi
	.word 0xc36a2ffc  ! 2798: PREFETCH_I	prefetch	[%r8 + 0x0ffc], #one_read
	.word 0xc9e22009  ! 2799: CASA_R	casa	[%r8] %asi, %r9, %r4
	.word 0xc8da2648  ! 2800: LDXA_I	ldxa	[%r8, + 0x0648] %asi, %r4
	.word 0xc8122404  ! 2801: LDUH_I	lduh	[%r8 + 0x0404], %r4
	.word 0xc6aa2e74  ! 2802: STBA_I	stba	%r3, [%r8 + 0x0e74] %asi
	.word 0xfa2a0009  ! 2804: STB_R	stb	%r29, [%r8 + %r9]
	.word 0xc6020009  ! 2804: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0x0eca0001  ! 2805: BRGEZ	brgez  ,pt	%8,<label_0xa0001>
	.word 0x2c800001  ! 2806: BNEG	bneg,a	<label_0x1>
	.word 0xc2c22d54  ! 2807: LDSWA_I	ldswa	[%r8, + 0x0d54] %asi, %r1
	.word 0x02800001  ! 2808: BE	be  	<label_0x1>
	.word 0xc36a26e0  ! 2809: PREFETCH_I	prefetch	[%r8 + 0x06e0], #one_read
	.word 0xc3ea2728  ! 2810: PREFETCHA_I	prefetcha	[%r8, + 0x0728] %asi, #one_read
	.word 0x86da0009  ! 2811: SMULcc_R	smulcc 	%r8, %r9, %r3
	.word 0xc36a2b40  ! 2812: PREFETCH_I	prefetch	[%r8 + 0x0b40], #one_read
	.word 0x04c20001  ! 2813: BRLEZ	brlez  ,nt	%8,<label_0x20001>
	.word 0x8143e06c  ! 2814: MEMBAR	membar	#LoadStore | #StoreStore | #MemIssue | #Sync 
	.word 0xa8fa0009  ! 2815: SDIVcc_R	sdivcc 	%r8, %r9, %r20
	.word 0xc6220009  ! 2817: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xcf020009  ! 2817: LDF_R	ld	[%r8, %r9], %f7
	.word 0x38800001  ! 2818: BGU	bgu,a	<label_0x1>
	.word 0xccba1009  ! 2819: STDA_R	stda	%r6, [%r8 + %r9] 0x80
	.word 0xc242265c  ! 2820: LDSW_I	ldsw	[%r8 + 0x065c], %r1
	.word 0xb2f22898  ! 2821: UDIVcc_I	udivcc 	%r8, 0x0898, %r25
	.word 0x02c20001  ! 2822: BRZ	brz  ,nt	%8,<label_0x20001>
	.word 0xc82a0009  ! 2824: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc64a0009  ! 2824: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xcb3a0009  ! 2826: STDF_R	std	%f5, [%r9, %r8]
	.word 0xc6720009  ! 2827: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc4020009  ! 2827: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xcaaa2a10  ! 2828: STBA_I	stba	%r5, [%r8 + 0x0a10] %asi
	.word 0xcd3a2810  ! 2829: STDF_I	std	%f6, [0x0810, %r8]
	.word 0xce5a2cd0  ! 2830: LDX_I	ldx	[%r8 + 0x0cd0], %r7
	.word 0xc64a2b48  ! 2831: LDSB_I	ldsb	[%r8 + 0x0b48], %r3
	.word 0xc7e22009  ! 2832: CASA_R	casa	[%r8] %asi, %r9, %r3
	.word 0xb24a2e1c  ! 2833: MULX_I	mulx 	%r8, 0x0e1c, %r25
	.word 0xf87a0009  ! 2834: SWAP_R	swap	%r28, [%r8 + %r9]
	.word 0xc93a0009  ! 2836: STDF_R	std	%f4, [%r9, %r8]
	.word 0xca720009  ! 2837: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xed020009  ! 2837: LDF_R	ld	[%r8, %r9], %f22
	.word 0x8cf20009  ! 2838: UDIVcc_R	udivcc 	%r8, %r9, %r6
	.word 0xf3f21009  ! 2839: CASXA_I	casxa	[%r8] 0x80, %r9, %r25
	.word 0xf8f22168  ! 2840: STXA_I	stxa	%r28, [%r8 + 0x0168] %asi
	.word 0xc33a2080  ! 2841: STDF_I	std	%f1, [0x0080, %r8]
	.word 0xca520009  ! 2842: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xc2f223f8  ! 2843: STXA_I	stxa	%r1, [%r8 + 0x03f8] %asi
	.word 0xc3ea2798  ! 2844: PREFETCHA_I	prefetcha	[%r8, + 0x0798] %asi, #one_read
	.word 0xfe4a0009  ! 2845: LDSB_R	ldsb	[%r8 + %r9], %r31
	.word 0xcc5a21d8  ! 2846: LDX_I	ldx	[%r8 + 0x01d8], %r6
	.word 0xec320009  ! 2848: STH_R	sth	%r22, [%r8 + %r9]
	.word 0xc45a0009  ! 2848: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0x8143c000  ! 2849: STBAR	stbar
	.word 0xfec21009  ! 2850: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r31
	.word 0xf53a0009  ! 2852: STDF_R	std	%f26, [%r9, %r8]
	.word 0xc6720009  ! 2853: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xda120009  ! 2853: LDUH_R	lduh	[%r8 + %r9], %r13
	.word 0xc25a2dc8  ! 2854: LDX_I	ldx	[%r8 + 0x0dc8], %r1
	.word 0x8ba20829  ! 2855: FADDs	fadds	%f8, %f9, %f5
	.word 0xe8220009  ! 2857: STW_R	stw	%r20, [%r8 + %r9]
	.word 0xe0520009  ! 2857: LDSH_R	ldsh	[%r8 + %r9], %r16
	.word 0xdb220009  ! 2859: STF_R	st	%f13, [%r9, %r8]
	.word 0xc6720009  ! 2860: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xce0a0009  ! 2860: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xca8224bc  ! 2861: LDUWA_I	lduwa	[%r8, + 0x04bc] %asi, %r5
	.word 0x8b222364  ! 2862: MULScc_I	mulscc 	%r8, 0x0364, %r5
	.word 0xf82a0009  ! 2864: STB_R	stb	%r28, [%r8 + %r9]
	.word 0xc31a0009  ! 2864: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0x40000001  ! 2865: CALL	call	disp30_1
	.word 0xc2220009  ! 2867: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc85a0009  ! 2867: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xca0a0009  ! 2868: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xc4ea1009  ! 2869: LDSTUBA_R	ldstuba	%r2, [%r8 + %r9] 0x80
	.word 0xc36a2dc8  ! 2870: PREFETCH_I	prefetch	[%r8 + 0x0dc8], #one_read
	.word 0x8e7a2950  ! 2871: SDIV_I	sdiv 	%r8, 0x0950, %r7
	.word 0x83220009  ! 2872: MULScc_R	mulscc 	%r8, %r9, %r1
	.word 0x8143e032  ! 2873: MEMBAR	membar	#StoreLoad | #Lookaside | #MemIssue 
	.word 0xa8520009  ! 2874: UMUL_R	umul 	%r8, %r9, %r20
	.word 0xd6220009  ! 2876: STW_R	stw	%r11, [%r8 + %r9]
	.word 0xca4a0009  ! 2876: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0x8da208a9  ! 2877: FSUBs	fsubs	%f8, %f9, %f6
	.word 0xaa5a23d4  ! 2878: SMUL_I	smul 	%r8, 0x03d4, %r21
	.word 0xc6d21009  ! 2879: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r3
	.word 0xc68a2508  ! 2880: LDUBA_I	lduba	[%r8, + 0x0508] %asi, %r3
	.word 0x8c7a26b0  ! 2881: SDIV_I	sdiv 	%r8, 0x06b0, %r6
	.word 0x83a209a9  ! 2882: FDIVs	fdivs	%f8, %f9, %f1
	.word 0xc6fa1009  ! 2883: SWAPA_R	swapa	%r3, [%r8 + %r9] 0x80
	.word 0xcac22024  ! 2884: LDSWA_I	ldswa	[%r8, + 0x0024] %asi, %r5
	.word 0x0ec20001  ! 2885: BRGEZ	brgez  ,nt	%8,<label_0x20001>
	.word 0x8143e03b  ! 2886: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Lookaside | #MemIssue 
	.word 0xf66a2db0  ! 2887: LDSTUB_I	ldstub	%r27, [%r8 + 0x0db0]
	.word 0xc4da2c88  ! 2888: LDXA_I	ldxa	[%r8, + 0x0c88] %asi, %r2
	.word 0x0eca0001  ! 2889: BRGEZ	brgez  ,pt	%8,<label_0xa0001>
	.word 0xc3ea2e14  ! 2890: PREFETCHA_I	prefetcha	[%r8, + 0x0e14] %asi, #one_read
	.word 0x22800001  ! 2891: BE	be,a	<label_0x1>
	.word 0xc6220009  ! 2893: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xcc4a0009  ! 2893: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xc33a25f0  ! 2894: STDF_I	std	%f1, [0x05f0, %r8]
	.word 0xc6520009  ! 2895: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0x3c800002  ! 2896: BPOS	bpos,a	<label_0x2>
	.word 0xf6da2b30  ! 2897: LDXA_I	ldxa	[%r8, + 0x0b30] %asi, %r27
	.word 0xf6422f98  ! 2898: LDSW_I	ldsw	[%r8 + 0x0f98], %r27
	.word 0xcb020009  ! 2899: LDF_R	ld	[%r8, %r9], %f5
	.word 0xcdf22009  ! 2900: CASXA_R	casxa	[%r8]%asi, %r9, %r6
	.word 0x8143e055  ! 2901: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside | #Sync 
	.word 0xc2720009  ! 2903: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc6420009  ! 2903: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0x8e7228e0  ! 2904: UDIV_I	udiv 	%r8, 0x08e0, %r7
	.word 0xc3ea27c0  ! 2905: PREFETCHA_I	prefetcha	[%r8, + 0x07c0] %asi, #one_read
	.word 0xcb220009  ! 2907: STF_R	st	%f5, [%r9, %r8]
	.word 0xc4720009  ! 2908: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xfb1a0009  ! 2908: LDDF_R	ldd	[%r8, %r9], %f29
	.word 0x8e6a0009  ! 2909: UDIVX_R	udivx 	%r8, %r9, %r7
	.word 0x8143c000  ! 2910: STBAR	stbar
	.word 0xc46a2c64  ! 2911: LDSTUB_I	ldstub	%r2, [%r8 + 0x0c64]
	.word 0xf01a0009  ! 2912: LDD_R	ldd	[%r8 + %r9], %r24
	.word 0x22ca0001  ! 2913: BRZ	brz,a,pt	%8,<label_0xa0001>
	.word 0xdc921009  ! 2914: LDUHA_R	lduha	[%r8, %r9] 0x80, %r14
	.word 0x8143c000  ! 2915: STBAR	stbar
	.word 0xcc5a0009  ! 2916: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xf8220009  ! 2918: STW_R	stw	%r28, [%r8 + %r9]
	.word 0xc6020009  ! 2918: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xc2122678  ! 2919: LDUH_I	lduh	[%r8 + 0x0678], %r1
	.word 0x3e800002  ! 2920: BVC	bvc,a	<label_0x2>
	.word 0x02800001  ! 2921: BE	be  	<label_0x1>
	.word 0x84da2fd0  ! 2922: SMULcc_I	smulcc 	%r8, 0x0fd0, %r2
	.word 0x14800001  ! 2923: BG	bg  	<label_0x1>
	.word 0x85220009  ! 2924: MULScc_R	mulscc 	%r8, %r9, %r2
	.word 0xc8ba27a0  ! 2925: STDA_I	stda	%r4, [%r8 + 0x07a0] %asi
	.word 0xc7e22009  ! 2926: CASA_R	casa	[%r8] %asi, %r9, %r3
	.word 0xc2821009  ! 2927: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r1
	.word 0xc49a1009  ! 2928: LDDA_R	ldda	[%r8, %r9] 0x80, %r2
	.word 0xecc21009  ! 2929: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r22
	.word 0xc9022758  ! 2930: LDF_I	ld	[%r8, 0x0758], %f4
	.word 0xc6ea1009  ! 2931: LDSTUBA_R	ldstuba	%r3, [%r8 + %r9] 0x80
	.word 0x8cd221b0  ! 2932: UMULcc_I	umulcc 	%r8, 0x01b0, %r6
	.word 0xc93a2d20  ! 2933: STDF_I	std	%f4, [0x0d20, %r8]
	.word 0xf0aa2834  ! 2934: STBA_I	stba	%r24, [%r8 + 0x0834] %asi
	.word 0x836a2d4c  ! 2935: SDIVX_I	sdivx	%r8, 0x0d4c, %r1
	.word 0x1a800001  ! 2936: BCC	bcc  	<label_0x1>
	.word 0xc4b21009  ! 2937: STHA_R	stha	%r2, [%r8 + %r9] 0x80
	.word 0xcb220009  ! 2939: STF_R	st	%f5, [%r9, %r8]
	.word 0xfc720009  ! 2940: STX_R	stx	%r30, [%r8 + %r9]
	.word 0xce020009  ! 2940: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0x8ada2b14  ! 2941: SMULcc_I	smulcc 	%r8, 0x0b14, %r5
	.word 0xd6220009  ! 2943: STW_R	stw	%r11, [%r8 + %r9]
	.word 0xca4a0009  ! 2943: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xf49a2058  ! 2944: LDDA_I	ldda	[%r8, + 0x0058] %asi, %r26
	.word 0xc49a1009  ! 2945: LDDA_R	ldda	[%r8, %r9] 0x80, %r2
	.word 0x8143c000  ! 2946: STBAR	stbar
	.word 0xc3ea1009  ! 2947: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xa4da0009  ! 2948: SMULcc_R	smulcc 	%r8, %r9, %r18
	.word 0xca220009  ! 2950: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xe3020009  ! 2950: LDF_R	ld	[%r8, %r9], %f17
	.word 0x85a20929  ! 2951: FMULs	fmuls	%f8, %f9, %f2
	.word 0xcd3a0009  ! 2953: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc4720009  ! 2954: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc8120009  ! 2954: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xc36a0009  ! 2955: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xca2a0009  ! 2957: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc9020009  ! 2957: LDF_R	ld	[%r8, %r9], %f4
	.word 0xca520009  ! 2958: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xc36a0009  ! 2959: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0x89a208a9  ! 2960: FSUBs	fsubs	%f8, %f9, %f4
	.word 0x34800002  ! 2961: BG	bg,a	<label_0x2>
	.word 0xcfe22009  ! 2962: CASA_R	casa	[%r8] %asi, %r9, %r7
	.word 0xad6a2a60  ! 2963: SDIVX_I	sdivx	%r8, 0x0a60, %r22
	.word 0x34800001  ! 2964: BG	bg,a	<label_0x1>
	.word 0xaa5225a0  ! 2965: UMUL_I	umul 	%r8, 0x05a0, %r21
	.word 0xbba20929  ! 2966: FMULs	fmuls	%f8, %f9, %f29
	.word 0xc3ea2738  ! 2967: PREFETCHA_I	prefetcha	[%r8, + 0x0738] %asi, #one_read
	.word 0xcc2a0009  ! 2969: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xcc0a0009  ! 2969: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xaa4a0009  ! 2970: MULX_R	mulx 	%r8, %r9, %r21
	.word 0x8ba20929  ! 2971: FMULs	fmuls	%f8, %f9, %f5
	.word 0xc8320009  ! 2973: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xde520009  ! 2973: LDSH_R	ldsh	[%r8 + %r9], %r15
	.word 0xfc220009  ! 2975: STW_R	stw	%r30, [%r8 + %r9]
	.word 0xea020009  ! 2975: LDUW_R	lduw	[%r8 + %r9], %r21
	.word 0xce2a0009  ! 2977: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xca120009  ! 2977: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xc87a0009  ! 2978: SWAP_R	swap	%r4, [%r8 + %r9]
	.word 0xf0320009  ! 2980: STH_R	sth	%r24, [%r8 + %r9]
	.word 0xef020009  ! 2980: LDF_R	ld	[%r8, %r9], %f23
	.word 0xc22a0009  ! 2982: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xcc520009  ! 2982: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xb24a0009  ! 2983: MULX_R	mulx 	%r8, %r9, %r25
	.word 0xc85a2420  ! 2984: LDX_I	ldx	[%r8 + 0x0420], %r4
	.word 0x85222c70  ! 2985: MULScc_I	mulscc 	%r8, 0x0c70, %r2
	.word 0xf9f22009  ! 2986: CASXA_R	casxa	[%r8]%asi, %r9, %r28
	.word 0xf66a0009  ! 2987: LDSTUB_R	ldstub	%r27, [%r8 + %r9]
	.word 0xc36a2940  ! 2988: PREFETCH_I	prefetch	[%r8 + 0x0940], #one_read
	.word 0xc49a1009  ! 2989: LDDA_R	ldda	[%r8, %r9] 0x80, %r2
	.word 0x8143e06b  ! 2990: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #MemIssue | #Sync 
	.word 0xca2a0009  ! 2992: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xe01a0009  ! 2992: LDD_R	ldd	[%r8 + %r9], %r16
	.word 0xc36a0009  ! 2993: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0x9cda21ec  ! 2994: SMULcc_I	smulcc 	%r8, 0x01ec, %r14
	.word 0xaa6a0009  ! 2995: UDIVX_R	udivx 	%r8, %r9, %r21
	.word 0xc3ea2ebc  ! 2996: PREFETCHA_I	prefetcha	[%r8, + 0x0ebc] %asi, #one_read
	.word 0x8143c000  ! 2997: STBAR	stbar
	.word 0xc6da21a8  ! 2998: LDXA_I	ldxa	[%r8, + 0x01a8] %asi, %r3
	.word 0x22800001  ! 2999: BE	be,a	<label_0x1>
	.word 0x38800002  ! 3000: BGU	bgu,a	<label_0x2>
	.word 0xe00a0009  ! 3001: LDUB_R	ldub	[%r8 + %r9], %r16
	.word 0xc8ba1009  ! 3002: STDA_R	stda	%r4, [%r8 + %r9] 0x80
	.word 0x8143e02b  ! 3003: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #MemIssue 
	.word 0x1e800001  ! 3004: BVC	bvc  	<label_0x1>
	.word 0xc3ea1009  ! 3005: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc5f21009  ! 3006: CASXA_I	casxa	[%r8] 0x80, %r9, %r2
	.word 0x16800002  ! 3007: BGE	bge  	<label_0x2>
	.word 0xc2d21009  ! 3008: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r1
	.word 0xeaf21009  ! 3009: STXA_R	stxa	%r21, [%r8 + %r9] 0x80
	.word 0x8143e02b  ! 3010: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #MemIssue 
	.word 0x8fa20929  ! 3011: FMULs	fmuls	%f8, %f9, %f7
	.word 0x12800002  ! 3012: BNE	bne  	<label_0x2>
	.word 0x83220009  ! 3013: MULScc_R	mulscc 	%r8, %r9, %r1
	.word 0xc36a258c  ! 3014: PREFETCH_I	prefetch	[%r8 + 0x058c], #one_read
	.word 0xd73a0009  ! 3016: STDF_R	std	%f11, [%r9, %r8]
	.word 0xcc720009  ! 3017: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xcb020009  ! 3017: LDF_R	ld	[%r8, %r9], %f5
	.word 0xcac21009  ! 3018: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r5
	.word 0xc09a1009  ! 3019: LDDA_R	ldda	[%r8, %r9] 0x80, %r0
	.word 0x8143c000  ! 3020: STBAR	stbar
	.word 0xe0320009  ! 3022: STH_R	sth	%r16, [%r8 + %r9]
	.word 0xdd020009  ! 3022: LDF_R	ld	[%r8, %r9], %f14
	.word 0xee2a0009  ! 3024: STB_R	stb	%r23, [%r8 + %r9]
	.word 0xc2520009  ! 3024: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xc3ea1009  ! 3025: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xde220009  ! 3027: STW_R	stw	%r15, [%r8 + %r9]
	.word 0xc64a0009  ! 3027: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xceda1009  ! 3028: LDXA_R	ldxa	[%r8, %r9] 0x80, %r7
	.word 0x0cc20001  ! 3029: BRGZ	brgz  ,nt	%8,<label_0x20001>
	.word 0x0cca0001  ! 3030: BRGZ	brgz  ,pt	%8,<label_0xa0001>
	.word 0xe8a21009  ! 3031: STWA_R	stwa	%r20, [%r8 + %r9] 0x80
	.word 0xdc0a0009  ! 3032: LDUB_R	ldub	[%r8 + %r9], %r14
	.word 0xcd3a2248  ! 3033: STDF_I	std	%f6, [0x0248, %r8]
	.word 0x8143e06a  ! 3034: MEMBAR	membar	#StoreLoad | #StoreStore | #MemIssue | #Sync 
	.word 0x40000001  ! 3035: CALL	call	disp30_1
	.word 0xe2b21009  ! 3036: STHA_R	stha	%r17, [%r8 + %r9] 0x80
	.word 0xc42a0009  ! 3038: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc7020009  ! 3038: LDF_R	ld	[%r8, %r9], %f3
	.word 0xceaa2100  ! 3039: STBA_I	stba	%r7, [%r8 + 0x0100] %asi
	.word 0xc3220009  ! 3041: STF_R	st	%f1, [%r9, %r8]
	.word 0xce720009  ! 3042: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xf80a0009  ! 3042: LDUB_R	ldub	[%r8 + %r9], %r28
	.word 0xc3ea2308  ! 3043: PREFETCHA_I	prefetcha	[%r8, + 0x0308] %asi, #one_read
	.word 0x8fa208a9  ! 3044: FSUBs	fsubs	%f8, %f9, %f7
	.word 0x8143e070  ! 3045: MEMBAR	membar	#Lookaside | #MemIssue | #Sync 
	.word 0xc36a0009  ! 3046: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc6720009  ! 3048: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xfa020009  ! 3048: LDUW_R	lduw	[%r8 + %r9], %r29
	.word 0xa8d20009  ! 3049: UMULcc_R	umulcc 	%r8, %r9, %r20
	.word 0x36800001  ! 3050: BGE	bge,a	<label_0x1>
	.word 0xc4ba2af0  ! 3051: STDA_I	stda	%r2, [%r8 + 0x0af0] %asi
	.word 0xbc522b8c  ! 3052: UMUL_I	umul 	%r8, 0x0b8c, %r30
	.word 0xf02a0009  ! 3054: STB_R	stb	%r24, [%r8 + %r9]
	.word 0xe8120009  ! 3054: LDUH_R	lduh	[%r8 + %r9], %r20
	.word 0xc73a21f0  ! 3055: STDF_I	std	%f3, [0x01f0, %r8]
	.word 0xaef22650  ! 3056: UDIVcc_I	udivcc 	%r8, 0x0650, %r23
	.word 0x28800001  ! 3057: BLEU	bleu,a	<label_0x1>
	.word 0xc36a0009  ! 3058: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xcab22a4c  ! 3059: STHA_I	stha	%r5, [%r8 + 0x0a4c] %asi
	.word 0xb24a0009  ! 3060: MULX_R	mulx 	%r8, %r9, %r25
	.word 0xc62a0009  ! 3062: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xce420009  ! 3062: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xc36a0009  ! 3063: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0x2e800002  ! 3064: BVS	bvs,a	<label_0x2>
	.word 0xc85a2b20  ! 3065: LDX_I	ldx	[%r8 + 0x0b20], %r4
	.word 0xc3ea2b38  ! 3066: PREFETCHA_I	prefetcha	[%r8, + 0x0b38] %asi, #one_read
	.word 0xeeea1009  ! 3067: LDSTUBA_R	ldstuba	%r23, [%r8 + %r9] 0x80
	.word 0x8e7226bc  ! 3068: UDIV_I	udiv 	%r8, 0x06bc, %r7
	.word 0xcaca1009  ! 3069: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r5
	.word 0xc4ba2a70  ! 3070: STDA_I	stda	%r2, [%r8 + 0x0a70] %asi
	.word 0xa65221b4  ! 3071: UMUL_I	umul 	%r8, 0x01b4, %r19
	.word 0xf6320009  ! 3073: STH_R	sth	%r27, [%r8 + %r9]
	.word 0xc40a0009  ! 3073: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xcc320009  ! 3075: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xca520009  ! 3075: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xcaf222c0  ! 3076: STXA_I	stxa	%r5, [%r8 + 0x02c0] %asi
	.word 0xcaf22398  ! 3077: STXA_I	stxa	%r5, [%r8 + 0x0398] %asi
	.word 0xf0ba2960  ! 3078: STDA_I	stda	%r24, [%r8 + 0x0960] %asi
	.word 0xc5f21009  ! 3079: CASXA_I	casxa	[%r8] 0x80, %r9, %r2
	.word 0xc47a2164  ! 3080: SWAP_I	swap	%r2, [%r8 + 0x0164]
	.word 0xc36a0009  ! 3081: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0x08800001  ! 3082: BLEU	bleu  	<label_0x1>
	.word 0x8af20009  ! 3083: UDIVcc_R	udivcc 	%r8, %r9, %r5
	.word 0xecb22810  ! 3084: STHA_I	stha	%r22, [%r8 + 0x0810] %asi
	.word 0x82f22954  ! 3085: UDIVcc_I	udivcc 	%r8, 0x0954, %r1
	.word 0xcde21009  ! 3086: CASA_I	casa	[%r8] 0x80, %r9, %r6
	.word 0xc3ea1009  ! 3087: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xce2a0009  ! 3089: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xca120009  ! 3089: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0x8143c000  ! 3090: STBAR	stbar
	.word 0xca220009  ! 3092: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xca120009  ! 3092: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xce4a0009  ! 3093: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xccda24f8  ! 3094: LDXA_I	ldxa	[%r8, + 0x04f8] %asi, %r6
	.word 0x8c520009  ! 3095: UMUL_R	umul 	%r8, %r9, %r6
	.word 0xc36a2f7c  ! 3096: PREFETCH_I	prefetch	[%r8 + 0x0f7c], #one_read
	.word 0x24c20001  ! 3097: BRLEZ	brlez,a,nt	%8,<label_0x20001>
	.word 0xcc9a2b98  ! 3098: LDDA_I	ldda	[%r8, + 0x0b98] %asi, %r6
	.word 0xc8220009  ! 3100: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xca4a0009  ! 3100: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xcb3a0009  ! 3102: STDF_R	std	%f5, [%r9, %r8]
	.word 0xca720009  ! 3103: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xd64a0009  ! 3103: LDSB_R	ldsb	[%r8 + %r9], %r11
	.word 0x3a800002  ! 3104: BCC	bcc,a	<label_0x2>
	.word 0x8a520009  ! 3105: UMUL_R	umul 	%r8, %r9, %r5
	.word 0x96d20009  ! 3106: UMULcc_R	umulcc 	%r8, %r9, %r11
	.word 0xc2522920  ! 3107: LDSH_I	ldsh	[%r8 + 0x0920], %r1
	.word 0x12800001  ! 3108: BNE	bne  	<label_0x1>
	.word 0xe49223d8  ! 3109: LDUHA_I	lduha	[%r8, + 0x03d8] %asi, %r18
	.word 0xf2220009  ! 3111: STW_R	stw	%r25, [%r8 + %r9]
	.word 0xc4020009  ! 3111: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0x884a2a14  ! 3112: MULX_I	mulx 	%r8, 0x0a14, %r4
	.word 0xe3222dd8  ! 3113: STF_I	st	%f17, [0x0dd8, %r8]
	.word 0x8143e008  ! 3114: MEMBAR	membar	#StoreStore 
	.word 0xf1f22009  ! 3115: CASXA_R	casxa	[%r8]%asi, %r9, %r24
	.word 0x0a800002  ! 3116: BCS	bcs  	<label_0x2>
	.word 0x8143c000  ! 3117: STBAR	stbar
	.word 0xc8f21009  ! 3118: STXA_R	stxa	%r4, [%r8 + %r9] 0x80
	.word 0xf62a0009  ! 3120: STB_R	stb	%r27, [%r8 + %r9]
	.word 0xdc4a0009  ! 3120: LDSB_R	ldsb	[%r8 + %r9], %r14
	.word 0xca9227f4  ! 3121: LDUHA_I	lduha	[%r8, + 0x07f4] %asi, %r5
	.word 0xcc220009  ! 3123: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xfb020009  ! 3123: LDF_R	ld	[%r8, %r9], %f29
	.word 0xc4220009  ! 3125: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc45a0009  ! 3125: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xe05a0009  ! 3126: LDX_R	ldx	[%r8 + %r9], %r16
	.word 0x8143e03f  ! 3127: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0xc33a2320  ! 3128: STDF_I	std	%f1, [0x0320, %r8]
	.word 0xcde22009  ! 3129: CASA_R	casa	[%r8] %asi, %r9, %r6
	.word 0xc36a2984  ! 3130: PREFETCH_I	prefetch	[%r8 + 0x0984], #one_read
	.word 0x8143e05e  ! 3131: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0xc33a2fb8  ! 3132: STDF_I	std	%f1, [0x0fb8, %r8]
	.word 0xccba1009  ! 3133: STDA_R	stda	%r6, [%r8 + %r9] 0x80
	.word 0xcc9a22f8  ! 3134: LDDA_I	ldda	[%r8, + 0x02f8] %asi, %r6
	.word 0xd8a22a84  ! 3135: STWA_I	stwa	%r12, [%r8 + 0x0a84] %asi
	.word 0x85a20829  ! 3136: FADDs	fadds	%f8, %f9, %f2
	.word 0x8afa2f38  ! 3137: SDIVcc_I	sdivcc 	%r8, 0x0f38, %r5
	.word 0x2cc20001  ! 3138: BRGZ	brgz,a,nt	%8,<label_0x20001>
	.word 0x3c800001  ! 3139: BPOS	bpos,a	<label_0x1>
	.word 0xce522928  ! 3140: LDSH_I	ldsh	[%r8 + 0x0928], %r7
	.word 0xa2f22c9c  ! 3141: UDIVcc_I	udivcc 	%r8, 0x0c9c, %r17
	.word 0x30800001  ! 3142: BA	ba,a	<label_0x1>
	.word 0xc3ea2904  ! 3143: PREFETCHA_I	prefetcha	[%r8, + 0x0904] %asi, #one_read
	.word 0x8e7a24c4  ! 3144: SDIV_I	sdiv 	%r8, 0x04c4, %r7
	.word 0xca220009  ! 3146: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc20a0009  ! 3146: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xc2720009  ! 3148: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc2020009  ! 3148: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xba7a2798  ! 3149: SDIV_I	sdiv 	%r8, 0x0798, %r29
	.word 0x8143c000  ! 3150: STBAR	stbar
	.word 0xc4220009  ! 3152: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xe40a0009  ! 3152: LDUB_R	ldub	[%r8 + %r9], %r18
	.word 0xcf3a0009  ! 3154: STDF_R	std	%f7, [%r9, %r8]
	.word 0xca720009  ! 3155: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xce520009  ! 3155: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xeca22bf0  ! 3156: STWA_I	stwa	%r22, [%r8 + 0x0bf0] %asi
	.word 0x8143e020  ! 3157: MEMBAR	membar	#MemIssue 
	.word 0x836a2b3c  ! 3158: SDIVX_I	sdivx	%r8, 0x0b3c, %r1
	.word 0xc2ca28d8  ! 3159: LDSBA_I	ldsba	[%r8, + 0x08d8] %asi, %r1
	.word 0xc62a0009  ! 3161: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xce5a0009  ! 3161: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0x8b222108  ! 3162: MULScc_I	mulscc 	%r8, 0x0108, %r5
	.word 0x836a2f80  ! 3163: SDIVX_I	sdivx	%r8, 0x0f80, %r1
	.word 0x86722d70  ! 3164: UDIV_I	udiv 	%r8, 0x0d70, %r3
	.word 0xc3ea1009  ! 3165: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xce2a0009  ! 3167: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xcc1a0009  ! 3167: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xc4320009  ! 3169: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xd41a0009  ! 3169: LDD_R	ldd	[%r8 + %r9], %r10
	.word 0xfbe22009  ! 3170: CASA_R	casa	[%r8] %asi, %r9, %r29
	.word 0x84522178  ! 3171: UMUL_I	umul 	%r8, 0x0178, %r2
	.word 0xbb6a0009  ! 3172: SDIVX_R	sdivx	%r8, %r9, %r29
	.word 0xc73a0009  ! 3174: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc4720009  ! 3175: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc60a0009  ! 3175: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xa66a0009  ! 3176: UDIVX_R	udivx 	%r8, %r9, %r19
	.word 0xf0f21009  ! 3177: STXA_R	stxa	%r24, [%r8 + %r9] 0x80
	.word 0xcec226e8  ! 3178: LDSWA_I	ldswa	[%r8, + 0x06e8] %asi, %r7
	.word 0xe0fa28b0  ! 3179: SWAPA_I	swapa	%r16, [%r8 + 0x08b0] %asi
	.word 0x85a208a9  ! 3180: FSUBs	fsubs	%f8, %f9, %f2
	.word 0xe9220009  ! 3182: STF_R	st	%f20, [%r9, %r8]
	.word 0xcc720009  ! 3183: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xd81a0009  ! 3183: LDD_R	ldd	[%r8 + %r9], %r12
	.word 0x8143e05b  ! 3184: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Lookaside | #Sync 
	.word 0xee921009  ! 3185: LDUHA_R	lduha	[%r8, %r9] 0x80, %r23
	.word 0xca120009  ! 3186: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xe8ea25ac  ! 3187: LDSTUBA_I	ldstuba	%r20, [%r8 + 0x05ac] %asi
	.word 0x06c20001  ! 3188: BRLZ	brlz  ,nt	%8,<label_0x20001>
	.word 0x8143c000  ! 3189: STBAR	stbar
	.word 0xc6c21009  ! 3190: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r3
	.word 0xcb3a2098  ! 3191: STDF_I	std	%f5, [0x0098, %r8]
	.word 0xf4320009  ! 3193: STH_R	sth	%r26, [%r8 + %r9]
	.word 0xfb1a0009  ! 3193: LDDF_R	ldd	[%r8, %r9], %f29
	.word 0xcc5a0009  ! 3194: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xc6b22e40  ! 3195: STHA_I	stha	%r3, [%r8 + 0x0e40] %asi
	.word 0x83222048  ! 3196: MULScc_I	mulscc 	%r8, 0x0048, %r1
	.word 0x87220009  ! 3197: MULScc_R	mulscc 	%r8, %r9, %r3
	.word 0x9da208a9  ! 3198: FSUBs	fsubs	%f8, %f9, %f14
	.word 0xc4320009  ! 3200: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xee0a0009  ! 3200: LDUB_R	ldub	[%r8 + %r9], %r23
	.word 0xc36a0009  ! 3201: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xb6520009  ! 3202: UMUL_R	umul 	%r8, %r9, %r27
	.word 0xc6320009  ! 3204: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc8120009  ! 3204: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xe8d21009  ! 3205: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r20
	.word 0xce220009  ! 3207: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xcc020009  ! 3207: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xceea2498  ! 3208: LDSTUBA_I	ldstuba	%r7, [%r8 + 0x0498] %asi
	.word 0x846a2d34  ! 3209: UDIVX_I	udivx 	%r8, 0x0d34, %r2
	.word 0xc2aa268c  ! 3210: STBA_I	stba	%r1, [%r8 + 0x068c] %asi
	.word 0xc72223f0  ! 3211: STF_I	st	%f3, [0x03f0, %r8]
	.word 0xc36a0009  ! 3212: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xa8d20009  ! 3213: UMULcc_R	umulcc 	%r8, %r9, %r20
	.word 0xc62a0009  ! 3215: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc60a0009  ! 3215: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xcef22630  ! 3216: STXA_I	stxa	%r7, [%r8 + 0x0630] %asi
	.word 0xc36a21b0  ! 3217: PREFETCH_I	prefetch	[%r8 + 0x01b0], #one_read
	.word 0xe4ea1009  ! 3218: LDSTUBA_R	ldstuba	%r18, [%r8 + %r9] 0x80
	.word 0xc3ea27c0  ! 3219: PREFETCHA_I	prefetcha	[%r8, + 0x07c0] %asi, #one_read
	.word 0xccea1009  ! 3220: LDSTUBA_R	ldstuba	%r6, [%r8 + %r9] 0x80
	.word 0xf27a0009  ! 3221: SWAP_R	swap	%r25, [%r8 + %r9]
	.word 0x8143c000  ! 3222: STBAR	stbar
	.word 0x84fa0009  ! 3223: SDIVcc_R	sdivcc 	%r8, %r9, %r2
	.word 0xc7020009  ! 3224: LDF_R	ld	[%r8, %r9], %f3
	.word 0x844a257c  ! 3225: MULX_I	mulx 	%r8, 0x057c, %r2
	.word 0xcec21009  ! 3226: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r7
	.word 0xa1222458  ! 3227: MULScc_I	mulscc 	%r8, 0x0458, %r16
	.word 0xf4720009  ! 3229: STX_R	stx	%r26, [%r8 + %r9]
	.word 0xcc120009  ! 3229: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0x8fa209a9  ! 3230: FDIVs	fdivs	%f8, %f9, %f7
	.word 0x8143c000  ! 3231: STBAR	stbar
	.word 0x8143c000  ! 3232: STBAR	stbar
	.word 0xc2320009  ! 3234: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xde420009  ! 3234: LDSW_R	ldsw	[%r8 + %r9], %r15
	.word 0xce720009  ! 3236: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc2420009  ! 3236: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xd8320009  ! 3238: STH_R	sth	%r12, [%r8 + %r9]
	.word 0xc24a0009  ! 3238: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xfcca2c50  ! 3239: LDSBA_I	ldsba	[%r8, + 0x0c50] %asi, %r30
	.word 0x89a209a9  ! 3240: FDIVs	fdivs	%f8, %f9, %f4
	.word 0x8143e006  ! 3241: MEMBAR	membar	#StoreLoad | #LoadStore 
	.word 0xc24a0009  ! 3242: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xf4320009  ! 3244: STH_R	sth	%r26, [%r8 + %r9]
	.word 0xc4020009  ! 3244: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0x83a20829  ! 3245: FADDs	fadds	%f8, %f9, %f1
	.word 0xcaca1009  ! 3246: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r5
	.word 0xbfa209a9  ! 3247: FDIVs	fdivs	%f8, %f9, %f31
	.word 0xc53a2190  ! 3248: STDF_I	std	%f2, [0x0190, %r8]
	.word 0xca4a0009  ! 3249: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xc36a0009  ! 3250: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xaed22b58  ! 3251: UMULcc_I	umulcc 	%r8, 0x0b58, %r23
	.word 0x84fa23d0  ! 3252: SDIVcc_I	sdivcc 	%r8, 0x03d0, %r2
	.word 0xfab21009  ! 3253: STHA_R	stha	%r29, [%r8 + %r9] 0x80
	.word 0xdeca1009  ! 3254: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r15
	.word 0xc2fa1009  ! 3255: SWAPA_R	swapa	%r1, [%r8 + %r9] 0x80
	.word 0x08800001  ! 3256: BLEU	bleu  	<label_0x1>
	.word 0xcaea1009  ! 3257: LDSTUBA_R	ldstuba	%r5, [%r8 + %r9] 0x80
	.word 0xc2720009  ! 3259: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc60a0009  ! 3259: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xae7a28d0  ! 3260: SDIV_I	sdiv 	%r8, 0x08d0, %r23
	.word 0xc6020009  ! 3261: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xc31a2a00  ! 3262: LDDF_I	ldd	[%r8, 0x0a00], %f1
	.word 0xfc220009  ! 3264: STW_R	stw	%r30, [%r8 + %r9]
	.word 0xc9020009  ! 3264: LDF_R	ld	[%r8, %r9], %f4
	.word 0xc36a0009  ! 3265: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc3ea2afc  ! 3266: PREFETCHA_I	prefetcha	[%r8, + 0x0afc] %asi, #one_read
	.word 0xc2fa1009  ! 3267: SWAPA_R	swapa	%r1, [%r8 + %r9] 0x80
	.word 0x89a208a9  ! 3268: FSUBs	fsubs	%f8, %f9, %f4
	.word 0xf68226e8  ! 3269: LDUWA_I	lduwa	[%r8, + 0x06e8] %asi, %r27
	.word 0xcc220009  ! 3271: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc81a0009  ! 3271: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xb27a2cb0  ! 3272: SDIV_I	sdiv 	%r8, 0x0cb0, %r25
	.word 0xc3ea2204  ! 3273: PREFETCHA_I	prefetcha	[%r8, + 0x0204] %asi, #one_read
	.word 0xc36a2590  ! 3274: PREFETCH_I	prefetch	[%r8 + 0x0590], #one_read
	.word 0xc22a0009  ! 3276: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xca420009  ! 3276: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xa4520009  ! 3277: UMUL_R	umul 	%r8, %r9, %r18
	.word 0xc8720009  ! 3279: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xea520009  ! 3279: LDSH_R	ldsh	[%r8 + %r9], %r21
	.word 0x867a0009  ! 3280: SDIV_R	sdiv 	%r8, %r9, %r3
	.word 0x8e5a0009  ! 3281: SMUL_R	smul 	%r8, %r9, %r7
	.word 0xccc21009  ! 3282: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r6
	.word 0xdef21009  ! 3283: STXA_R	stxa	%r15, [%r8 + %r9] 0x80
	.word 0xc2ca1009  ! 3284: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r1
	.word 0xdeda2f80  ! 3285: LDXA_I	ldxa	[%r8, + 0x0f80] %asi, %r15
	.word 0xafa20929  ! 3286: FMULs	fmuls	%f8, %f9, %f23
	.word 0xc2220009  ! 3288: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xcc420009  ! 3288: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xcc7a0009  ! 3289: SWAP_R	swap	%r6, [%r8 + %r9]
	.word 0xc36a24dc  ! 3290: PREFETCH_I	prefetch	[%r8 + 0x04dc], #one_read
	.word 0x86722bbc  ! 3291: UDIV_I	udiv 	%r8, 0x0bbc, %r3
	.word 0xcc122b00  ! 3292: LDUH_I	lduh	[%r8 + 0x0b00], %r6
	.word 0xce921009  ! 3293: LDUHA_R	lduha	[%r8, %r9] 0x80, %r7
	.word 0xe20a0009  ! 3294: LDUB_R	ldub	[%r8 + %r9], %r17
	.word 0xcc5a2ff8  ! 3295: LDX_I	ldx	[%r8 + 0x0ff8], %r6
	.word 0x89220009  ! 3296: MULScc_R	mulscc 	%r8, %r9, %r4
	.word 0xc24a0009  ! 3297: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xc73a0009  ! 3299: STDF_R	std	%f3, [%r9, %r8]
	.word 0xe0720009  ! 3300: STX_R	stx	%r16, [%r8 + %r9]
	.word 0xde4a0009  ! 3300: LDSB_R	ldsb	[%r8 + %r9], %r15
	.word 0xca220009  ! 3302: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xcf1a0009  ! 3302: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0x8143c000  ! 3303: STBAR	stbar
	.word 0x87a20929  ! 3304: FMULs	fmuls	%f8, %f9, %f3
	.word 0xc44a2f40  ! 3305: LDSB_I	ldsb	[%r8 + 0x0f40], %r2
	.word 0xea7a28f0  ! 3306: SWAP_I	swap	%r21, [%r8 + 0x08f0]
	.word 0xc3ea1009  ! 3307: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x8143e055  ! 3308: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside | #Sync 
	.word 0x8143c000  ! 3309: STBAR	stbar
	.word 0xc6320009  ! 3311: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xcc0a0009  ! 3311: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xc36a2e08  ! 3312: PREFETCH_I	prefetch	[%r8 + 0x0e08], #one_read
	.word 0xc4220009  ! 3314: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc8120009  ! 3314: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xecb22408  ! 3315: STHA_I	stha	%r22, [%r8 + 0x0408] %asi
	.word 0x847a0009  ! 3316: SDIV_R	sdiv 	%r8, %r9, %r2
	.word 0xe62a0009  ! 3318: STB_R	stb	%r19, [%r8 + %r9]
	.word 0xc45a0009  ! 3318: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xdeda1009  ! 3319: LDXA_R	ldxa	[%r8, %r9] 0x80, %r15
	.word 0x8c7229f4  ! 3320: UDIV_I	udiv 	%r8, 0x09f4, %r6
	.word 0x84520009  ! 3321: UMUL_R	umul 	%r8, %r9, %r2
	.word 0xccda1009  ! 3322: LDXA_R	ldxa	[%r8, %r9] 0x80, %r6
	.word 0xcf222138  ! 3323: STF_I	st	%f7, [0x0138, %r8]
	.word 0x83a209a9  ! 3324: FDIVs	fdivs	%f8, %f9, %f1
	.word 0xc4922378  ! 3325: LDUHA_I	lduha	[%r8, + 0x0378] %asi, %r2
	.word 0xcf3a2e78  ! 3326: STDF_I	std	%f7, [0x0e78, %r8]
	.word 0x82722428  ! 3327: UDIV_I	udiv 	%r8, 0x0428, %r1
	.word 0xe0aa21bc  ! 3328: STBA_I	stba	%r16, [%r8 + 0x01bc] %asi
	.word 0x24c20001  ! 3329: BRLEZ	brlez,a,nt	%8,<label_0x20001>
	.word 0xeaa21009  ! 3330: STWA_R	stwa	%r21, [%r8 + %r9] 0x80
	.word 0xc3ea1009  ! 3331: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x8143c000  ! 3332: STBAR	stbar
	.word 0xff222f78  ! 3333: STF_I	st	%f31, [0x0f78, %r8]
	.word 0xb66a2ac4  ! 3334: UDIVX_I	udivx 	%r8, 0x0ac4, %r27
	.word 0xc6220009  ! 3336: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc2420009  ! 3336: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0x8ba20829  ! 3337: FADDs	fadds	%f8, %f9, %f5
	.word 0x8143e001  ! 3338: MEMBAR	membar	#LoadLoad 
	.word 0xce320009  ! 3340: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xf71a0009  ! 3340: LDDF_R	ldd	[%r8, %r9], %f27
	.word 0x8143c000  ! 3341: STBAR	stbar
	.word 0xf4320009  ! 3343: STH_R	sth	%r26, [%r8 + %r9]
	.word 0xc6420009  ! 3343: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xb67a2db4  ! 3344: SDIV_I	sdiv 	%r8, 0x0db4, %r27
	.word 0x8452245c  ! 3345: UMUL_I	umul 	%r8, 0x045c, %r2
	.word 0x876a0009  ! 3346: SDIVX_R	sdivx	%r8, %r9, %r3
	.word 0x9da20929  ! 3347: FMULs	fmuls	%f8, %f9, %f14
	.word 0xcfe21009  ! 3348: CASA_I	casa	[%r8] 0x80, %r9, %r7
	.word 0x8143c000  ! 3349: STBAR	stbar
	.word 0x8b222d58  ! 3350: MULScc_I	mulscc 	%r8, 0x0d58, %r5
	.word 0xc3ea20f0  ! 3351: PREFETCHA_I	prefetcha	[%r8, + 0x00f0] %asi, #one_read
	.word 0xc4b22964  ! 3352: STHA_I	stha	%r2, [%r8 + 0x0964] %asi
	.word 0xf51a0009  ! 3353: LDDF_R	ldd	[%r8, %r9], %f26
	.word 0xc25a2960  ! 3354: LDX_I	ldx	[%r8 + 0x0960], %r1
	.word 0x85220009  ! 3355: MULScc_R	mulscc 	%r8, %r9, %r2
	.word 0xcd220009  ! 3357: STF_R	st	%f6, [%r9, %r8]
	.word 0xc6720009  ! 3358: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xca120009  ! 3358: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xc3ea1009  ! 3359: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xb4d2257c  ! 3360: UMULcc_I	umulcc 	%r8, 0x057c, %r26
	.word 0xb64a2890  ! 3361: MULX_I	mulx 	%r8, 0x0890, %r27
	.word 0xc8ba1009  ! 3362: STDA_R	stda	%r4, [%r8 + %r9] 0x80
	.word 0xcaca1009  ! 3363: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r5
	.word 0xc2220009  ! 3365: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xcb020009  ! 3365: LDF_R	ld	[%r8, %r9], %f5
	.word 0xe6a2273c  ! 3366: STWA_I	stwa	%r19, [%r8 + 0x073c] %asi
	.word 0xb8722c04  ! 3367: UDIV_I	udiv 	%r8, 0x0c04, %r28
	.word 0x9da20929  ! 3368: FMULs	fmuls	%f8, %f9, %f14
	.word 0xc45a0009  ! 3369: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0x40000001  ! 3370: CALL	call	disp30_1
	.word 0xc3ea1009  ! 3371: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc2a21009  ! 3372: STWA_R	stwa	%r1, [%r8 + %r9] 0x80
	.word 0xf04a0009  ! 3373: LDSB_R	ldsb	[%r8 + %r9], %r24
	.word 0xc2ca291c  ! 3374: LDSBA_I	ldsba	[%r8, + 0x091c] %asi, %r1
	.word 0xca2a0009  ! 3376: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xcc1a0009  ! 3376: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0x1c800001  ! 3377: BPOS	bpos  	<label_0x1>
	.word 0x22800002  ! 3378: BE	be,a	<label_0x2>
	.word 0xa85a0009  ! 3379: SMUL_R	smul 	%r8, %r9, %r20
	.word 0x9f220009  ! 3380: MULScc_R	mulscc 	%r8, %r9, %r15
	.word 0xd8720009  ! 3382: STX_R	stx	%r12, [%r8 + %r9]
	.word 0xfd020009  ! 3382: LDF_R	ld	[%r8, %r9], %f30
	.word 0xcf0223c4  ! 3383: LDF_I	ld	[%r8, 0x03c4], %f7
	.word 0xccf21009  ! 3384: STXA_R	stxa	%r6, [%r8 + %r9] 0x80
	.word 0xc51a2d48  ! 3385: LDDF_I	ldd	[%r8, 0x0d48], %f2
	.word 0xc6d22d30  ! 3386: LDSHA_I	ldsha	[%r8, + 0x0d30] %asi, %r3
	.word 0xd6921009  ! 3387: LDUHA_R	lduha	[%r8, %r9] 0x80, %r11
	.word 0xcea22808  ! 3388: STWA_I	stwa	%r7, [%r8 + 0x0808] %asi
	.word 0xcd222950  ! 3389: STF_I	st	%f6, [0x0950, %r8]
	.word 0x83a20829  ! 3390: FADDs	fadds	%f8, %f9, %f1
	.word 0x8143e05d  ! 3391: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0xf4420009  ! 3392: LDSW_R	ldsw	[%r8 + %r9], %r26
	.word 0xc4b21009  ! 3393: STHA_R	stha	%r2, [%r8 + %r9] 0x80
	.word 0xa47a2fbc  ! 3394: SDIV_I	sdiv 	%r8, 0x0fbc, %r18
	.word 0xe48a2a30  ! 3395: LDUBA_I	lduba	[%r8, + 0x0a30] %asi, %r18
	.word 0x12800001  ! 3396: BNE	bne  	<label_0x1>
	.word 0xc42a0009  ! 3398: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xce120009  ! 3398: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0x867a0009  ! 3399: SDIV_R	sdiv 	%r8, %r9, %r3
	.word 0xc36a0009  ! 3400: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xf6b21009  ! 3401: STHA_R	stha	%r27, [%r8 + %r9] 0x80
	.word 0x40000001  ! 3402: CALL	call	disp30_1
	.word 0x83a208a9  ! 3403: FSUBs	fsubs	%f8, %f9, %f1
	.word 0xc87a2788  ! 3404: SWAP_I	swap	%r4, [%r8 + 0x0788]
	.word 0x8143c000  ! 3405: STBAR	stbar
	.word 0xcd3a2d48  ! 3406: STDF_I	std	%f6, [0x0d48, %r8]
	.word 0xfe4a2be0  ! 3407: LDSB_I	ldsb	[%r8 + 0x0be0], %r31
	.word 0x9da208a9  ! 3408: FSUBs	fsubs	%f8, %f9, %f14
	.word 0xf0320009  ! 3410: STH_R	sth	%r24, [%r8 + %r9]
	.word 0xc2420009  ! 3410: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xc53a0009  ! 3412: STDF_R	std	%f2, [%r9, %r8]
	.word 0xfa720009  ! 3413: STX_R	stx	%r29, [%r8 + %r9]
	.word 0xf24a0009  ! 3413: LDSB_R	ldsb	[%r8 + %r9], %r25
	.word 0x8143e01a  ! 3414: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside 
	.word 0xca220009  ! 3416: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xde0a0009  ! 3416: LDUB_R	ldub	[%r8 + %r9], %r15
	.word 0x38800001  ! 3417: BGU	bgu,a	<label_0x1>
	.word 0xef222a00  ! 3418: STF_I	st	%f23, [0x0a00, %r8]
	.word 0x8143c000  ! 3419: STBAR	stbar
	.word 0x8143e05c  ! 3420: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0xe7022118  ! 3421: LDF_I	ld	[%r8, 0x0118], %f19
	.word 0xc87a0009  ! 3422: SWAP_R	swap	%r4, [%r8 + %r9]
	.word 0x86d20009  ! 3423: UMULcc_R	umulcc 	%r8, %r9, %r3
	.word 0x8e4a0009  ! 3424: MULX_R	mulx 	%r8, %r9, %r7
	.word 0x8a522908  ! 3425: UMUL_I	umul 	%r8, 0x0908, %r5
	.word 0xc36a2e64  ! 3426: PREFETCH_I	prefetch	[%r8 + 0x0e64], #one_read
	.word 0xd8ea2234  ! 3427: LDSTUBA_I	ldstuba	%r12, [%r8 + 0x0234] %asi
	.word 0xcc9a27e8  ! 3428: LDDA_I	ldda	[%r8, + 0x07e8] %asi, %r6
	.word 0xc4122684  ! 3429: LDUH_I	lduh	[%r8 + 0x0684], %r2
	.word 0xea320009  ! 3431: STH_R	sth	%r21, [%r8 + %r9]
	.word 0xc7020009  ! 3431: LDF_R	ld	[%r8, %r9], %f3
	.word 0xc2520009  ! 3432: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0x8143e05e  ! 3433: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0xdc320009  ! 3435: STH_R	sth	%r14, [%r8 + %r9]
	.word 0xc6020009  ! 3435: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0x3e800001  ! 3436: BVC	bvc,a	<label_0x1>
	.word 0x40000001  ! 3437: CALL	call	disp30_1
	.word 0xf0220009  ! 3439: STW_R	stw	%r24, [%r8 + %r9]
	.word 0xec1a0009  ! 3439: LDD_R	ldd	[%r8 + %r9], %r22
	.word 0xc4ba1009  ! 3440: STDA_R	stda	%r2, [%r8 + %r9] 0x80
	.word 0xc2320009  ! 3442: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xe81a0009  ! 3442: LDD_R	ldd	[%r8 + %r9], %r20
	.word 0xdaea1009  ! 3443: LDSTUBA_R	ldstuba	%r13, [%r8 + %r9] 0x80
	.word 0xc4aa2448  ! 3444: STBA_I	stba	%r2, [%r8 + 0x0448] %asi
	.word 0xc3ea2e80  ! 3445: PREFETCHA_I	prefetcha	[%r8, + 0x0e80] %asi, #one_read
	.word 0xe20a2ce4  ! 3446: LDUB_I	ldub	[%r8 + 0x0ce4], %r17
	.word 0x8cfa2e20  ! 3447: SDIVcc_I	sdivcc 	%r8, 0x0e20, %r6
	.word 0xc2d228b8  ! 3448: LDSHA_I	ldsha	[%r8, + 0x08b8] %asi, %r1
	.word 0xc3ea2bb4  ! 3449: PREFETCHA_I	prefetcha	[%r8, + 0x0bb4] %asi, #one_read
	.word 0xc36a2f24  ! 3450: PREFETCH_I	prefetch	[%r8 + 0x0f24], #one_read
	.word 0xc20a2ae4  ! 3451: LDUB_I	ldub	[%r8 + 0x0ae4], %r1
	.word 0xc7220009  ! 3453: STF_R	st	%f3, [%r9, %r8]
	.word 0xd8720009  ! 3454: STX_R	stx	%r12, [%r8 + %r9]
	.word 0xe25a0009  ! 3454: LDX_R	ldx	[%r8 + %r9], %r17
	.word 0x10800002  ! 3455: BA	ba  	<label_0x2>
	.word 0xfe7a2bd8  ! 3456: SWAP_I	swap	%r31, [%r8 + 0x0bd8]
	.word 0xc36a218c  ! 3457: PREFETCH_I	prefetch	[%r8 + 0x018c], #one_read
	.word 0x85a208a9  ! 3458: FSUBs	fsubs	%f8, %f9, %f2
	.word 0xcd222c6c  ! 3459: STF_I	st	%f6, [0x0c6c, %r8]
	.word 0x8143c000  ! 3460: STBAR	stbar
	.word 0xf27a2184  ! 3461: SWAP_I	swap	%r25, [%r8 + 0x0184]
	.word 0xc2022374  ! 3462: LDUW_I	lduw	[%r8 + 0x0374], %r1
	.word 0xb8d20009  ! 3463: UMULcc_R	umulcc 	%r8, %r9, %r28
	.word 0x8143c000  ! 3464: STBAR	stbar
	.word 0x26ca0001  ! 3465: BRLZ	brlz,a,pt	%8,<label_0xa0001>
	.word 0x8143c000  ! 3466: STBAR	stbar
	.word 0xcc6a2820  ! 3467: LDSTUB_I	ldstub	%r6, [%r8 + 0x0820]
	.word 0xf02a0009  ! 3469: STB_R	stb	%r24, [%r8 + %r9]
	.word 0xc8420009  ! 3469: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xc8320009  ! 3471: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xcc4a0009  ! 3471: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xb7a208a9  ! 3472: FSUBs	fsubs	%f8, %f9, %f27
	.word 0xf46a2a24  ! 3473: LDSTUB_I	ldstub	%r26, [%r8 + 0x0a24]
	.word 0x98d20009  ! 3474: UMULcc_R	umulcc 	%r8, %r9, %r12
	.word 0xcbe22009  ! 3475: CASA_R	casa	[%r8] %asi, %r9, %r5
	.word 0x8143c000  ! 3476: STBAR	stbar
	.word 0xee8a1009  ! 3477: LDUBA_R	lduba	[%r8, %r9] 0x80, %r23
	.word 0xec720009  ! 3479: STX_R	stx	%r22, [%r8 + %r9]
	.word 0xda520009  ! 3479: LDSH_R	ldsh	[%r8 + %r9], %r13
	.word 0xf6f21009  ! 3480: STXA_R	stxa	%r27, [%r8 + %r9] 0x80
	.word 0x20800001  ! 3481: BN	bn,a	<label_0x1>
	.word 0xb25a0009  ! 3482: SMUL_R	smul 	%r8, %r9, %r25
	.word 0xffe22009  ! 3483: CASA_R	casa	[%r8] %asi, %r9, %r31
	.word 0xad220009  ! 3484: MULScc_R	mulscc 	%r8, %r9, %r22
	.word 0xc7020009  ! 3485: LDF_R	ld	[%r8, %r9], %f3
	.word 0x83a209a9  ! 3486: FDIVs	fdivs	%f8, %f9, %f1
	.word 0x8143c000  ! 3487: STBAR	stbar
	.word 0xdc220009  ! 3489: STW_R	stw	%r14, [%r8 + %r9]
	.word 0xc51a0009  ! 3489: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xfe320009  ! 3491: STH_R	sth	%r31, [%r8 + %r9]
	.word 0xc51a0009  ! 3491: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0x40000001  ! 3492: CALL	call	disp30_1
	.word 0xe0a21009  ! 3493: STWA_R	stwa	%r16, [%r8 + %r9] 0x80
	.word 0xc36a0009  ! 3494: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0x2c800001  ! 3495: BNEG	bneg,a	<label_0x1>
	.word 0x26c20001  ! 3496: BRLZ	brlz,a,nt	%8,<label_0x20001>
	.word 0xc7222e94  ! 3497: STF_I	st	%f3, [0x0e94, %r8]
	.word 0xc6aa246c  ! 3498: STBA_I	stba	%r3, [%r8 + 0x046c] %asi
	.word 0xc3ea1009  ! 3499: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xe8aa2780  ! 3500: STBA_I	stba	%r20, [%r8 + 0x0780] %asi
	.word 0xcde21009  ! 3501: CASA_I	casa	[%r8] 0x80, %r9, %r6
	.word 0x884a0009  ! 3502: MULX_R	mulx 	%r8, %r9, %r4
	.word 0xcad229b8  ! 3503: LDSHA_I	ldsha	[%r8, + 0x09b8] %asi, %r5
	.word 0x98da0009  ! 3504: SMULcc_R	smulcc 	%r8, %r9, %r12
	.word 0xc9f21009  ! 3505: CASXA_I	casxa	[%r8] 0x80, %r9, %r4
	.word 0x26800002  ! 3506: BL	bl,a	<label_0x2>
	.word 0x8143c000  ! 3507: STBAR	stbar
	.word 0xc2122020  ! 3508: LDUH_I	lduh	[%r8 + 0x0020], %r1
	.word 0xca2a0009  ! 3510: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xfc0a0009  ! 3510: LDUB_R	ldub	[%r8 + %r9], %r30
	.word 0x9c520009  ! 3511: UMUL_R	umul 	%r8, %r9, %r14
	.word 0x8143c000  ! 3512: STBAR	stbar
	.word 0xfa420009  ! 3513: LDSW_R	ldsw	[%r8 + %r9], %r29
	.word 0xcd3a0009  ! 3515: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc8720009  ! 3516: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc6020009  ! 3516: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0x86fa22d4  ! 3517: SDIVcc_I	sdivcc 	%r8, 0x02d4, %r3
	.word 0x8c520009  ! 3518: UMUL_R	umul 	%r8, %r9, %r6
	.word 0xdafa1009  ! 3519: SWAPA_R	swapa	%r13, [%r8 + %r9] 0x80
	.word 0xc2821009  ! 3520: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r1
	.word 0xc53a0009  ! 3522: STDF_R	std	%f2, [%r9, %r8]
	.word 0xe0720009  ! 3523: STX_R	stx	%r16, [%r8 + %r9]
	.word 0xc4020009  ! 3523: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xc5220009  ! 3525: STF_R	st	%f2, [%r9, %r8]
	.word 0xf4720009  ! 3526: STX_R	stx	%r26, [%r8 + %r9]
	.word 0xcc020009  ! 3526: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xc5222e90  ! 3527: STF_I	st	%f2, [0x0e90, %r8]
	.word 0xcc220009  ! 3529: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc20a0009  ! 3529: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xfab21009  ! 3530: STHA_R	stha	%r29, [%r8 + %r9] 0x80
	.word 0x8143e033  ! 3531: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside | #MemIssue 
	.word 0xce2a0009  ! 3533: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xce4a0009  ! 3533: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0x12800001  ! 3534: BNE	bne  	<label_0x1>
	.word 0xc3ea1009  ! 3535: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xaa6a0009  ! 3536: UDIVX_R	udivx 	%r8, %r9, %r21
	.word 0xd8aa1009  ! 3537: STBA_R	stba	%r12, [%r8 + %r9] 0x80
	.word 0xc8320009  ! 3539: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xce520009  ! 3539: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0x827a221c  ! 3540: SDIV_I	sdiv 	%r8, 0x021c, %r1
	.word 0x8143e03d  ! 3541: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0xc4320009  ! 3543: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc41a0009  ! 3543: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x9a522f3c  ! 3544: UMUL_I	umul 	%r8, 0x0f3c, %r13
	.word 0xceaa1009  ! 3545: STBA_R	stba	%r7, [%r8 + %r9] 0x80
	.word 0x8cd20009  ! 3546: UMULcc_R	umulcc 	%r8, %r9, %r6
	.word 0x22800001  ! 3547: BE	be,a	<label_0x1>
	.word 0x34800001  ! 3548: BG	bg,a	<label_0x1>
	.word 0xe1222298  ! 3549: STF_I	st	%f16, [0x0298, %r8]
	.word 0x8f6a0009  ! 3550: SDIVX_R	sdivx	%r8, %r9, %r7
	.word 0xc2da1009  ! 3551: LDXA_R	ldxa	[%r8, %r9] 0x80, %r1
	.word 0xc3ea1009  ! 3552: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xf42a0009  ! 3554: STB_R	stb	%r26, [%r8 + %r9]
	.word 0xcd020009  ! 3554: LDF_R	ld	[%r8, %r9], %f6
	.word 0xd8ea1009  ! 3555: LDSTUBA_R	ldstuba	%r12, [%r8 + %r9] 0x80
	.word 0x847223b8  ! 3556: UDIV_I	udiv 	%r8, 0x03b8, %r2
	.word 0x9da20829  ! 3557: FADDs	fadds	%f8, %f9, %f14
	.word 0xc66a2740  ! 3558: LDSTUB_I	ldstub	%r3, [%r8 + 0x0740]
	.word 0xc36a246c  ! 3559: PREFETCH_I	prefetch	[%r8 + 0x046c], #one_read
	.word 0xb2fa0009  ! 3560: SDIVcc_R	sdivcc 	%r8, %r9, %r25
	.word 0xcb020009  ! 3561: LDF_R	ld	[%r8, %r9], %f5
	.word 0x8a4a2d94  ! 3562: MULX_I	mulx 	%r8, 0x0d94, %r5
	.word 0xe8320009  ! 3564: STH_R	sth	%r20, [%r8 + %r9]
	.word 0xc31a0009  ! 3564: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xc9f22009  ! 3565: CASXA_R	casxa	[%r8]%asi, %r9, %r4
	.word 0x826a0009  ! 3566: UDIVX_R	udivx 	%r8, %r9, %r1
	.word 0xe242295c  ! 3567: LDSW_I	ldsw	[%r8 + 0x095c], %r17
	.word 0xdafa2168  ! 3568: SWAPA_I	swapa	%r13, [%r8 + 0x0168] %asi
	.word 0xc4220009  ! 3570: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc20a0009  ! 3570: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0x996a2c60  ! 3571: SDIVX_I	sdivx	%r8, 0x0c60, %r12
	.word 0xed220009  ! 3573: STF_R	st	%f22, [%r9, %r8]
	.word 0xfa720009  ! 3574: STX_R	stx	%r29, [%r8 + %r9]
	.word 0xcc120009  ! 3574: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xfb3a29b8  ! 3575: STDF_I	std	%f29, [0x09b8, %r8]
	.word 0x8143e041  ! 3576: MEMBAR	membar	#LoadLoad | #Sync 
	.word 0xa8d22ac8  ! 3577: UMULcc_I	umulcc 	%r8, 0x0ac8, %r20
	.word 0xc6c21009  ! 3578: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r3
	.word 0x88f22c6c  ! 3579: UDIVcc_I	udivcc 	%r8, 0x0c6c, %r4
	.word 0xc6220009  ! 3581: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xfe120009  ! 3581: LDUH_R	lduh	[%r8 + %r9], %r31
	.word 0xc6320009  ! 3583: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xcc520009  ! 3583: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xf8ea1009  ! 3584: LDSTUBA_R	ldstuba	%r28, [%r8 + %r9] 0x80
	.word 0x32800001  ! 3585: BNE	bne,a	<label_0x1>
	.word 0xc36a2cdc  ! 3586: PREFETCH_I	prefetch	[%r8 + 0x0cdc], #one_read
	.word 0xc33a0009  ! 3588: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc4720009  ! 3589: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xfc520009  ! 3589: LDSH_R	ldsh	[%r8 + %r9], %r30
	.word 0xbc4a0009  ! 3590: MULX_R	mulx 	%r8, %r9, %r30
	.word 0x8143c000  ! 3591: STBAR	stbar
	.word 0xc8922a9c  ! 3592: LDUHA_I	lduha	[%r8, + 0x0a9c] %asi, %r4
	.word 0x8143e031  ! 3593: MEMBAR	membar	#LoadLoad | #Lookaside | #MemIssue 
	.word 0x8143e01a  ! 3594: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside 
	.word 0x8143e054  ! 3595: MEMBAR	membar	#LoadStore | #Lookaside | #Sync 
	.word 0x8143e011  ! 3596: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xc7e22009  ! 3597: CASA_R	casa	[%r8] %asi, %r9, %r3
	.word 0xda5a2338  ! 3598: LDX_I	ldx	[%r8 + 0x0338], %r13
	.word 0xcf3a25c8  ! 3599: STDF_I	std	%f7, [0x05c8, %r8]
	.word 0xda020009  ! 3600: LDUW_R	lduw	[%r8 + %r9], %r13
	.word 0xc8220009  ! 3602: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc9020009  ! 3602: LDF_R	ld	[%r8, %r9], %f4
	.word 0xc6320009  ! 3604: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xcc520009  ! 3604: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xe4320009  ! 3606: STH_R	sth	%r18, [%r8 + %r9]
	.word 0xc81a0009  ! 3606: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xc6ea1009  ! 3607: LDSTUBA_R	ldstuba	%r3, [%r8 + %r9] 0x80
	.word 0xccda1009  ! 3608: LDXA_R	ldxa	[%r8, %r9] 0x80, %r6
	.word 0xba520009  ! 3609: UMUL_R	umul 	%r8, %r9, %r29
	.word 0x8143c000  ! 3610: STBAR	stbar
	.word 0x8e5a0009  ! 3611: SMUL_R	smul 	%r8, %r9, %r7
	.word 0xf2022604  ! 3612: LDUW_I	lduw	[%r8 + 0x0604], %r25
	.word 0xcf220009  ! 3614: STF_R	st	%f7, [%r9, %r8]
	.word 0xf0720009  ! 3615: STX_R	stx	%r24, [%r8 + %r9]
	.word 0xc64a0009  ! 3615: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xcb3a22d8  ! 3616: STDF_I	std	%f5, [0x02d8, %r8]
	.word 0xc4ba1009  ! 3617: STDA_R	stda	%r2, [%r8 + %r9] 0x80
	.word 0xca2a0009  ! 3619: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc2020009  ! 3619: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xc36a2c80  ! 3620: PREFETCH_I	prefetch	[%r8 + 0x0c80], #one_read
	.word 0xaba20929  ! 3621: FMULs	fmuls	%f8, %f9, %f21
	.word 0xbd6a0009  ! 3622: SDIVX_R	sdivx	%r8, %r9, %r30
	.word 0xc36a0009  ! 3623: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc4422f68  ! 3624: LDSW_I	ldsw	[%r8 + 0x0f68], %r2
	.word 0xd93a22a0  ! 3625: STDF_I	std	%f12, [0x02a0, %r8]
	.word 0xc3ea1009  ! 3626: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x8143c000  ! 3627: STBAR	stbar
	.word 0xc3ea2ba4  ! 3628: PREFETCHA_I	prefetcha	[%r8, + 0x0ba4] %asi, #one_read
	.word 0xcaaa2460  ! 3629: STBA_I	stba	%r5, [%r8 + 0x0460] %asi
	.word 0xcd222a60  ! 3630: STF_I	st	%f6, [0x0a60, %r8]
	.word 0x40000002  ! 3631: CALL	call	disp30_2
	.word 0x2cc20001  ! 3632: BRGZ	brgz,a,nt	%8,<label_0x20001>
	.word 0x8143c000  ! 3633: STBAR	stbar
	.word 0xd93a26a8  ! 3634: STDF_I	std	%f12, [0x06a8, %r8]
	.word 0x24800001  ! 3635: BLE	ble,a	<label_0x1>
	.word 0x34800001  ! 3636: BG	bg,a	<label_0x1>
	.word 0xc81a2830  ! 3637: LDD_I	ldd	[%r8 + 0x0830], %r4
	.word 0xc8ba1009  ! 3638: STDA_R	stda	%r4, [%r8 + %r9] 0x80
	.word 0xca220009  ! 3640: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc24a0009  ! 3640: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0x3a800001  ! 3641: BCC	bcc,a	<label_0x1>
	.word 0xc6b22984  ! 3642: STHA_I	stha	%r3, [%r8 + 0x0984] %asi
	.word 0xc7e21009  ! 3643: CASA_I	casa	[%r8] 0x80, %r9, %r3
	.word 0x84da2ebc  ! 3644: SMULcc_I	smulcc 	%r8, 0x0ebc, %r2
	.word 0xc36a2244  ! 3645: PREFETCH_I	prefetch	[%r8 + 0x0244], #one_read
	.word 0xe49a23c8  ! 3646: LDDA_I	ldda	[%r8, + 0x03c8] %asi, %r18
	.word 0xcde22009  ! 3647: CASA_R	casa	[%r8] %asi, %r9, %r6
	.word 0xc42a0009  ! 3649: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xcd020009  ! 3649: LDF_R	ld	[%r8, %r9], %f6
	.word 0x8143c000  ! 3650: STBAR	stbar
	.word 0xceb22c1c  ! 3651: STHA_I	stha	%r7, [%r8 + 0x0c1c] %asi
	.word 0xfcaa29b0  ! 3652: STBA_I	stba	%r30, [%r8 + 0x09b0] %asi
	.word 0xfefa2c38  ! 3653: SWAPA_I	swapa	%r31, [%r8 + 0x0c38] %asi
	.word 0xe4fa1009  ! 3654: SWAPA_R	swapa	%r18, [%r8 + %r9] 0x80
	.word 0xc4120009  ! 3655: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xd8320009  ! 3657: STH_R	sth	%r12, [%r8 + %r9]
	.word 0xc91a0009  ! 3657: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xaeda0009  ! 3658: SMULcc_R	smulcc 	%r8, %r9, %r23
	.word 0xca821009  ! 3659: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r5
	.word 0xc4f22e10  ! 3660: STXA_I	stxa	%r2, [%r8 + 0x0e10] %asi
	.word 0xf4f22908  ! 3661: STXA_I	stxa	%r26, [%r8 + 0x0908] %asi
	.word 0xc3ea2268  ! 3662: PREFETCHA_I	prefetcha	[%r8, + 0x0268] %asi, #one_read
	.word 0xc8ea1009  ! 3663: LDSTUBA_R	ldstuba	%r4, [%r8 + %r9] 0x80
	.word 0xd6120009  ! 3664: LDUH_R	lduh	[%r8 + %r9], %r11
	.word 0xccda1009  ! 3665: LDXA_R	ldxa	[%r8, %r9] 0x80, %r6
	.word 0x8b6a2134  ! 3666: SDIVX_I	sdivx	%r8, 0x0134, %r5
	.word 0xce220009  ! 3668: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xe71a0009  ! 3668: LDDF_R	ldd	[%r8, %r9], %f19
	.word 0xce220009  ! 3670: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xcf1a0009  ! 3670: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xfe922d2c  ! 3671: LDUHA_I	lduha	[%r8, + 0x0d2c] %asi, %r31
	.word 0xc8522e80  ! 3672: LDSH_I	ldsh	[%r8 + 0x0e80], %r4
	.word 0xba5a23fc  ! 3673: SMUL_I	smul 	%r8, 0x03fc, %r29
	.word 0x8143c000  ! 3674: STBAR	stbar
	.word 0x9e4a0009  ! 3675: MULX_R	mulx 	%r8, %r9, %r15
	.word 0xcc320009  ! 3677: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc4120009  ! 3677: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0x02c20001  ! 3678: BRZ	brz  ,nt	%8,<label_0x20001>
	.word 0x8143e00b  ! 3679: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore 
	.word 0x82fa2518  ! 3680: SDIVcc_I	sdivcc 	%r8, 0x0518, %r1
	.word 0x8a4a2db8  ! 3681: MULX_I	mulx 	%r8, 0x0db8, %r5
	.word 0xdc2a0009  ! 3683: STB_R	stb	%r14, [%r8 + %r9]
	.word 0xca120009  ! 3683: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xeaea2e20  ! 3684: LDSTUBA_I	ldstuba	%r21, [%r8 + 0x0e20] %asi
	.word 0x89a20829  ! 3685: FADDs	fadds	%f8, %f9, %f4
	.word 0xbe7a0009  ! 3686: SDIV_R	sdiv 	%r8, %r9, %r31
	.word 0x8f6a0009  ! 3687: SDIVX_R	sdivx	%r8, %r9, %r7
	.word 0x10800001  ! 3688: BA	ba  	<label_0x1>
	.word 0x8143c000  ! 3689: STBAR	stbar
	.word 0xc2f226a8  ! 3690: STXA_I	stxa	%r1, [%r8 + 0x06a8] %asi
	.word 0x40000002  ! 3691: CALL	call	disp30_2
	.word 0xc8320009  ! 3693: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xca520009  ! 3693: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xc2220009  ! 3695: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc5020009  ! 3695: LDF_R	ld	[%r8, %r9], %f2
	.word 0xcad21009  ! 3696: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r5
	.word 0x885227dc  ! 3697: UMUL_I	umul 	%r8, 0x07dc, %r4
	.word 0xcf220009  ! 3699: STF_R	st	%f7, [%r9, %r8]
	.word 0xcc720009  ! 3700: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc24a0009  ! 3700: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xc3ea2a1c  ! 3701: PREFETCHA_I	prefetcha	[%r8, + 0x0a1c] %asi, #one_read
	.word 0xc3ea2ce4  ! 3702: PREFETCHA_I	prefetcha	[%r8, + 0x0ce4] %asi, #one_read
	.word 0x8143e05d  ! 3703: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0xf6d22b80  ! 3704: LDSHA_I	ldsha	[%r8, + 0x0b80] %asi, %r27
	.word 0xcc320009  ! 3706: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xcd1a0009  ! 3706: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xca8a2e94  ! 3707: LDUBA_I	lduba	[%r8, + 0x0e94] %asi, %r5
	.word 0x2aca0001  ! 3708: BRNZ	brnz,a,pt	%8,<label_0xa0001>
	.word 0xce320009  ! 3710: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xda4a0009  ! 3710: LDSB_R	ldsb	[%r8 + %r9], %r13
	.word 0x8a4a0009  ! 3711: MULX_R	mulx 	%r8, %r9, %r5
	.word 0x8143e049  ! 3712: MEMBAR	membar	#LoadLoad | #StoreStore | #Sync 
	.word 0x8143e058  ! 3713: MEMBAR	membar	#StoreStore | #Lookaside | #Sync 
	.word 0x84720009  ! 3714: UDIV_R	udiv 	%r8, %r9, %r2
	.word 0x8ba208a9  ! 3715: FSUBs	fsubs	%f8, %f9, %f5
	.word 0xcc4a0009  ! 3716: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xdc220009  ! 3718: STW_R	stw	%r14, [%r8 + %r9]
	.word 0xca5a0009  ! 3718: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0x12800002  ! 3719: BNE	bne  	<label_0x2>
	.word 0xe4aa230c  ! 3720: STBA_I	stba	%r18, [%r8 + 0x030c] %asi
	.word 0xfe220009  ! 3722: STW_R	stw	%r31, [%r8 + %r9]
	.word 0xc31a0009  ! 3722: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xce220009  ! 3724: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xcc1a0009  ! 3724: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xc87a0009  ! 3725: SWAP_R	swap	%r4, [%r8 + %r9]
	.word 0x886a0009  ! 3726: UDIVX_R	udivx 	%r8, %r9, %r4
	.word 0xc4ba1009  ! 3727: STDA_R	stda	%r2, [%r8 + %r9] 0x80
	.word 0x36800002  ! 3728: BGE	bge,a	<label_0x2>
	.word 0xc4220009  ! 3730: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xca520009  ! 3730: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xfab22698  ! 3731: STHA_I	stha	%r29, [%r8 + 0x0698] %asi
	.word 0xc36a0009  ! 3732: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc53a2c38  ! 3733: STDF_I	std	%f2, [0x0c38, %r8]
	.word 0xbcda2408  ! 3734: SMULcc_I	smulcc 	%r8, 0x0408, %r30
	.word 0xc09a26a0  ! 3735: LDDA_I	ldda	[%r8, + 0x06a0] %asi, %r0
	.word 0x82f22854  ! 3736: UDIVcc_I	udivcc 	%r8, 0x0854, %r1
	.word 0x8143e070  ! 3737: MEMBAR	membar	#Lookaside | #MemIssue | #Sync 
	.word 0xbe6a2fac  ! 3738: UDIVX_I	udivx 	%r8, 0x0fac, %r31
	.word 0x84fa0009  ! 3739: SDIVcc_R	sdivcc 	%r8, %r9, %r2
	.word 0xc51a0009  ! 3740: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0x9fa209a9  ! 3741: FDIVs	fdivs	%f8, %f9, %f15
	.word 0x20800001  ! 3742: BN	bn,a	<label_0x1>
	.word 0xc33a0009  ! 3744: STDF_R	std	%f1, [%r9, %r8]
	.word 0xda720009  ! 3745: STX_R	stx	%r13, [%r8 + %r9]
	.word 0xc8520009  ! 3745: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0x8143c000  ! 3746: STBAR	stbar
	.word 0x85a20929  ! 3747: FMULs	fmuls	%f8, %f9, %f2
	.word 0xcd1a0009  ! 3748: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xc7f22009  ! 3749: CASXA_R	casxa	[%r8]%asi, %r9, %r3
	.word 0x8143c000  ! 3750: STBAR	stbar
	.word 0x06800001  ! 3751: BL	bl  	<label_0x1>
	.word 0xc93a2be0  ! 3752: STDF_I	std	%f4, [0x0be0, %r8]
	.word 0xcb3a0009  ! 3754: STDF_R	std	%f5, [%r9, %r8]
	.word 0xc2720009  ! 3755: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xf11a0009  ! 3755: LDDF_R	ldd	[%r8, %r9], %f24
	.word 0x8143c000  ! 3756: STBAR	stbar
	.word 0xc68a1009  ! 3757: LDUBA_R	lduba	[%r8, %r9] 0x80, %r3
	.word 0xc2ea25c0  ! 3758: LDSTUBA_I	ldstuba	%r1, [%r8 + 0x05c0] %asi
	.word 0xc3ea2b3c  ! 3759: PREFETCHA_I	prefetcha	[%r8, + 0x0b3c] %asi, #one_read
	.word 0xc72226f0  ! 3760: STF_I	st	%f3, [0x06f0, %r8]
	.word 0xc2d22800  ! 3761: LDSHA_I	ldsha	[%r8, + 0x0800] %asi, %r1
	.word 0xca5a2708  ! 3762: LDX_I	ldx	[%r8 + 0x0708], %r5
	.word 0x86520009  ! 3763: UMUL_R	umul 	%r8, %r9, %r3
	.word 0xceaa1009  ! 3764: STBA_R	stba	%r7, [%r8 + %r9] 0x80
	.word 0xe89a2658  ! 3765: LDDA_I	ldda	[%r8, + 0x0658] %asi, %r20
	.word 0xc36a0009  ! 3766: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0x83a20829  ! 3767: FADDs	fadds	%f8, %f9, %f1
	.word 0x82fa298c  ! 3768: SDIVcc_I	sdivcc 	%r8, 0x098c, %r1
	.word 0x9a4a0009  ! 3769: MULX_R	mulx 	%r8, %r9, %r13
	.word 0x825a20f4  ! 3770: SMUL_I	smul 	%r8, 0x00f4, %r1
	.word 0x9afa0009  ! 3771: SDIVcc_R	sdivcc 	%r8, %r9, %r13
	.word 0xf4320009  ! 3773: STH_R	sth	%r26, [%r8 + %r9]
	.word 0xe7020009  ! 3773: LDF_R	ld	[%r8, %r9], %f19
	.word 0x38800001  ! 3774: BGU	bgu,a	<label_0x1>
	.word 0xc3ea1009  ! 3775: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x24800001  ! 3776: BLE	ble,a	<label_0x1>
	.word 0xc68a260c  ! 3777: LDUBA_I	lduba	[%r8, + 0x060c] %asi, %r3
	.word 0x8143c000  ! 3778: STBAR	stbar
	.word 0xcb2224b4  ! 3779: STF_I	st	%f5, [0x04b4, %r8]
	.word 0x00800001  ! 3780: BN	bn  	<label_0x1>
	.word 0xdaca20bc  ! 3781: LDSBA_I	ldsba	[%r8, + 0x00bc] %asi, %r13
	.word 0x06800001  ! 3782: BL	bl  	<label_0x1>
	.word 0xc5220009  ! 3784: STF_R	st	%f2, [%r9, %r8]
	.word 0xcc720009  ! 3785: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc4020009  ! 3785: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0x84d20009  ! 3786: UMULcc_R	umulcc 	%r8, %r9, %r2
	.word 0xdc220009  ! 3788: STW_R	stw	%r14, [%r8 + %r9]
	.word 0xee020009  ! 3788: LDUW_R	lduw	[%r8 + %r9], %r23
	.word 0xf4c22c30  ! 3789: LDSWA_I	ldswa	[%r8, + 0x0c30] %asi, %r26
	.word 0xc2220009  ! 3791: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc6420009  ! 3791: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0x896a26a4  ! 3792: SDIVX_I	sdivx	%r8, 0x06a4, %r4
	.word 0x866a0009  ! 3793: UDIVX_R	udivx 	%r8, %r9, %r3
	.word 0xc36a2968  ! 3794: PREFETCH_I	prefetch	[%r8 + 0x0968], #one_read
	.word 0x8f6a0009  ! 3795: SDIVX_R	sdivx	%r8, %r9, %r7
	.word 0x8143c000  ! 3796: STBAR	stbar
	.word 0xa07a0009  ! 3797: SDIV_R	sdiv 	%r8, %r9, %r16
	.word 0xf4ba1009  ! 3798: STDA_R	stda	%r26, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 3799: STBAR	stbar
	.word 0xc8ea2d2c  ! 3800: LDSTUBA_I	ldstuba	%r4, [%r8 + 0x0d2c] %asi
	.word 0xce8a2060  ! 3801: LDUBA_I	lduba	[%r8, + 0x0060] %asi, %r7
	.word 0xcada21e8  ! 3802: LDXA_I	ldxa	[%r8, + 0x01e8] %asi, %r5
	.word 0xc36a2d28  ! 3803: PREFETCH_I	prefetch	[%r8 + 0x0d28], #one_read
	.word 0xc20a26c4  ! 3804: LDUB_I	ldub	[%r8 + 0x06c4], %r1
	.word 0x97a20929  ! 3805: FMULs	fmuls	%f8, %f9, %f11
	.word 0xc4ea27e8  ! 3806: LDSTUBA_I	ldstuba	%r2, [%r8 + 0x07e8] %asi
	.word 0xf06a2e9c  ! 3807: LDSTUB_I	ldstub	%r24, [%r8 + 0x0e9c]
	.word 0xc3ea1009  ! 3808: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xe24a2fe4  ! 3809: LDSB_I	ldsb	[%r8 + 0x0fe4], %r17
	.word 0xc6f22540  ! 3810: STXA_I	stxa	%r3, [%r8 + 0x0540] %asi
	.word 0xcada1009  ! 3811: LDXA_R	ldxa	[%r8, %r9] 0x80, %r5
	.word 0x846a2494  ! 3812: UDIVX_I	udivx 	%r8, 0x0494, %r2
	.word 0xe68a1009  ! 3813: LDUBA_R	lduba	[%r8, %r9] 0x80, %r19
	.word 0xc92225a4  ! 3814: STF_I	st	%f4, [0x05a4, %r8]
	.word 0xe4220009  ! 3816: STW_R	stw	%r18, [%r8 + %r9]
	.word 0xc2020009  ! 3816: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0x1a800002  ! 3817: BCC	bcc  	<label_0x2>
	.word 0xc41a2f78  ! 3818: LDD_I	ldd	[%r8 + 0x0f78], %r2
	.word 0xc8b21009  ! 3819: STHA_R	stha	%r4, [%r8 + %r9] 0x80
	.word 0xbcf220f4  ! 3820: UDIVcc_I	udivcc 	%r8, 0x00f4, %r30
	.word 0xe6b223f4  ! 3821: STHA_I	stha	%r19, [%r8 + 0x03f4] %asi
	.word 0x14800001  ! 3822: BG	bg  	<label_0x1>
	.word 0xcd3a0009  ! 3824: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc4720009  ! 3825: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc25a0009  ! 3825: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0x85a208a9  ! 3826: FSUBs	fsubs	%f8, %f9, %f2
	.word 0xec4a0009  ! 3827: LDSB_R	ldsb	[%r8 + %r9], %r22
	.word 0xc3ea1009  ! 3828: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x89a208a9  ! 3829: FSUBs	fsubs	%f8, %f9, %f4
	.word 0xc6aa2a78  ! 3830: STBA_I	stba	%r3, [%r8 + 0x0a78] %asi
	.word 0x8143e041  ! 3831: MEMBAR	membar	#LoadLoad | #Sync 
	.word 0xc2122b8c  ! 3832: LDUH_I	lduh	[%r8 + 0x0b8c], %r1
	.word 0x885a0009  ! 3833: SMUL_R	smul 	%r8, %r9, %r4
	.word 0xf4220009  ! 3835: STW_R	stw	%r26, [%r8 + %r9]
	.word 0xc25a0009  ! 3835: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0x8d6a29e4  ! 3836: SDIVX_I	sdivx	%r8, 0x09e4, %r6
	.word 0xc3ea1009  ! 3837: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xfc8a1009  ! 3838: LDUBA_R	lduba	[%r8, %r9] 0x80, %r30
	.word 0x0e800001  ! 3839: BVS	bvs  	<label_0x1>
	.word 0xf8ba1009  ! 3840: STDA_R	stda	%r28, [%r8 + %r9] 0x80
	.word 0xc6220009  ! 3842: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc4420009  ! 3842: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0x8a7a0009  ! 3843: SDIV_R	sdiv 	%r8, %r9, %r5
	.word 0xcc1a25a0  ! 3844: LDD_I	ldd	[%r8 + 0x05a0], %r6
	.word 0xc62a0009  ! 3846: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xdc120009  ! 3846: LDUH_R	lduh	[%r8 + %r9], %r14
	.word 0x04ca0001  ! 3847: BRLEZ	brlez  ,pt	%8,<label_0xa0001>
	.word 0xc3022180  ! 3848: LDF_I	ld	[%r8, 0x0180], %f1
	.word 0x8efa0009  ! 3849: SDIVcc_R	sdivcc 	%r8, %r9, %r7
	.word 0xf5022ed4  ! 3850: LDF_I	ld	[%r8, 0x0ed4], %f26
	.word 0xce4a2dfc  ! 3851: LDSB_I	ldsb	[%r8 + 0x0dfc], %r7
	.word 0x85a208a9  ! 3852: FSUBs	fsubs	%f8, %f9, %f2
	.word 0xcc9a2228  ! 3853: LDDA_I	ldda	[%r8, + 0x0228] %asi, %r6
	.word 0xf6220009  ! 3855: STW_R	stw	%r27, [%r8 + %r9]
	.word 0xc4120009  ! 3855: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xfc92274c  ! 3856: LDUHA_I	lduha	[%r8, + 0x074c] %asi, %r30
	.word 0xe0ca1009  ! 3857: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r16
	.word 0xc2fa2654  ! 3858: SWAPA_I	swapa	%r1, [%r8 + 0x0654] %asi
	.word 0x8143e050  ! 3859: MEMBAR	membar	#Lookaside | #Sync 
	.word 0xe22a0009  ! 3861: STB_R	stb	%r17, [%r8 + %r9]
	.word 0xc8020009  ! 3861: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xe2c22ac0  ! 3862: LDSWA_I	ldswa	[%r8, + 0x0ac0] %asi, %r17
	.word 0xe4ca2780  ! 3863: LDSBA_I	ldsba	[%r8, + 0x0780] %asi, %r18
	.word 0xf0220009  ! 3865: STW_R	stw	%r24, [%r8 + %r9]
	.word 0xfa120009  ! 3865: LDUH_R	lduh	[%r8 + %r9], %r29
	.word 0x86da0009  ! 3866: SMULcc_R	smulcc 	%r8, %r9, %r3
	.word 0xe6ca29cc  ! 3867: LDSBA_I	ldsba	[%r8, + 0x09cc] %asi, %r19
	.word 0x9da20929  ! 3868: FMULs	fmuls	%f8, %f9, %f14
	.word 0xc8320009  ! 3870: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc4420009  ! 3870: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xcc6a24a0  ! 3871: LDSTUB_I	ldstub	%r6, [%r8 + 0x04a0]
	.word 0xf0320009  ! 3873: STH_R	sth	%r24, [%r8 + %r9]
	.word 0xc41a0009  ! 3873: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xda220009  ! 3875: STW_R	stw	%r13, [%r8 + %r9]
	.word 0xcb1a0009  ! 3875: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xc36a2584  ! 3876: PREFETCH_I	prefetch	[%r8 + 0x0584], #one_read
	.word 0xe33a0009  ! 3878: STDF_R	std	%f17, [%r9, %r8]
	.word 0xc8720009  ! 3879: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc25a0009  ! 3879: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xfcb225a0  ! 3880: STHA_I	stha	%r30, [%r8 + 0x05a0] %asi
	.word 0xc2ea1009  ! 3881: LDSTUBA_R	ldstuba	%r1, [%r8 + %r9] 0x80
	.word 0x08800002  ! 3882: BLEU	bleu  	<label_0x2>
	.word 0x2aca0001  ! 3883: BRNZ	brnz,a,pt	%8,<label_0xa0001>
	.word 0xd89a28e0  ! 3884: LDDA_I	ldda	[%r8, + 0x08e0] %asi, %r12
	.word 0x30800002  ! 3885: BA	ba,a	<label_0x2>
	.word 0xa66a0009  ! 3886: UDIVX_R	udivx 	%r8, %r9, %r19
	.word 0xc2a21009  ! 3887: STWA_R	stwa	%r1, [%r8 + %r9] 0x80
	.word 0xc4220009  ! 3889: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xf2520009  ! 3889: LDSH_R	ldsh	[%r8 + %r9], %r25
	.word 0x18800001  ! 3890: BGU	bgu  	<label_0x1>
	.word 0xce320009  ! 3892: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xff1a0009  ! 3892: LDDF_R	ldd	[%r8, %r9], %f31
	.word 0x0ec20001  ! 3893: BRGEZ	brgez  ,nt	%8,<label_0x20001>
	.word 0x82fa0009  ! 3894: SDIVcc_R	sdivcc 	%r8, %r9, %r1
	.word 0xc8da28a8  ! 3895: LDXA_I	ldxa	[%r8, + 0x08a8] %asi, %r4
	.word 0xc88a1009  ! 3896: LDUBA_R	lduba	[%r8, %r9] 0x80, %r4
	.word 0xc49a2cb0  ! 3897: LDDA_I	ldda	[%r8, + 0x0cb0] %asi, %r2
	.word 0xf2ea2994  ! 3898: LDSTUBA_I	ldstuba	%r25, [%r8 + 0x0994] %asi
	.word 0xfcca2154  ! 3899: LDSBA_I	ldsba	[%r8, + 0x0154] %asi, %r30
	.word 0xfcba2210  ! 3900: STDA_I	stda	%r30, [%r8 + 0x0210] %asi
	.word 0xc66a0009  ! 3901: LDSTUB_R	ldstub	%r3, [%r8 + %r9]
	.word 0xc36a0009  ! 3902: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xcff21009  ! 3903: CASXA_I	casxa	[%r8] 0x80, %r9, %r7
	.word 0x964a0009  ! 3904: MULX_R	mulx 	%r8, %r9, %r11
	.word 0x8143c000  ! 3905: STBAR	stbar
	.word 0xeb3a24b8  ! 3906: STDF_I	std	%f21, [0x04b8, %r8]
	.word 0xf2020009  ! 3907: LDUW_R	lduw	[%r8 + %r9], %r25
	.word 0xc7e22009  ! 3908: CASA_R	casa	[%r8] %asi, %r9, %r3
	.word 0xce320009  ! 3910: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc2120009  ! 3910: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xc84228c0  ! 3911: LDSW_I	ldsw	[%r8 + 0x08c0], %r4
	.word 0xe0aa2884  ! 3912: STBA_I	stba	%r16, [%r8 + 0x0884] %asi
	.word 0xc6320009  ! 3914: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xfe420009  ! 3914: LDSW_R	ldsw	[%r8 + %r9], %r31
	.word 0xd62a0009  ! 3916: STB_R	stb	%r11, [%r8 + %r9]
	.word 0xcc1a0009  ! 3916: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xe4fa1009  ! 3917: SWAPA_R	swapa	%r18, [%r8 + %r9] 0x80
	.word 0xc33a0009  ! 3919: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc4720009  ! 3920: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xcc020009  ! 3920: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xf49a2590  ! 3921: LDDA_I	ldda	[%r8, + 0x0590] %asi, %r26
	.word 0xca220009  ! 3923: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xf44a0009  ! 3923: LDSB_R	ldsb	[%r8 + %r9], %r26
	.word 0xca5a0009  ! 3924: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xc4b22efc  ! 3925: STHA_I	stha	%r2, [%r8 + 0x0efc] %asi
	.word 0x2a800001  ! 3926: BCS	bcs,a	<label_0x1>
	.word 0x84720009  ! 3927: UDIV_R	udiv 	%r8, %r9, %r2
	.word 0x8143c000  ! 3928: STBAR	stbar
	.word 0x85a20929  ! 3929: FMULs	fmuls	%f8, %f9, %f2
	.word 0xcd020009  ! 3930: LDF_R	ld	[%r8, %r9], %f6
	.word 0x8143e034  ! 3931: MEMBAR	membar	#LoadStore | #Lookaside | #MemIssue 
	.word 0x85a208a9  ! 3932: FSUBs	fsubs	%f8, %f9, %f2
	.word 0xcc6a27bc  ! 3933: LDSTUB_I	ldstub	%r6, [%r8 + 0x07bc]
	.word 0xe6f21009  ! 3934: STXA_R	stxa	%r19, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 3935: STBAR	stbar
	.word 0x00800001  ! 3936: BN	bn  	<label_0x1>
	.word 0xc67a2688  ! 3937: SWAP_I	swap	%r3, [%r8 + 0x0688]
	.word 0xcaf22f18  ! 3938: STXA_I	stxa	%r5, [%r8 + 0x0f18] %asi
	.word 0xce5a0009  ! 3939: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xfc720009  ! 3941: STX_R	stx	%r30, [%r8 + %r9]
	.word 0xc4420009  ! 3941: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xc36a0009  ! 3942: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0x8e520009  ! 3943: UMUL_R	umul 	%r8, %r9, %r7
	.word 0xccfa2cc4  ! 3944: SWAPA_I	swapa	%r6, [%r8 + 0x0cc4] %asi
	.word 0xcefa1009  ! 3945: SWAPA_R	swapa	%r7, [%r8 + %r9] 0x80
	.word 0xc91a2038  ! 3946: LDDF_I	ldd	[%r8, 0x0038], %f4
	.word 0xe8a226ac  ! 3947: STWA_I	stwa	%r20, [%r8 + 0x06ac] %asi
	.word 0x84da0009  ! 3948: SMULcc_R	smulcc 	%r8, %r9, %r2
	.word 0xc2fa2394  ! 3949: SWAPA_I	swapa	%r1, [%r8 + 0x0394] %asi
	.word 0xf0220009  ! 3951: STW_R	stw	%r24, [%r8 + %r9]
	.word 0xce020009  ! 3951: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0x8143c000  ! 3952: STBAR	stbar
	.word 0x84da0009  ! 3953: SMULcc_R	smulcc 	%r8, %r9, %r2
	.word 0x865a0009  ! 3954: SMUL_R	smul 	%r8, %r9, %r3
	.word 0xce822fb8  ! 3955: LDUWA_I	lduwa	[%r8, + 0x0fb8] %asi, %r7
	.word 0xce220009  ! 3957: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xf91a0009  ! 3957: LDDF_R	ldd	[%r8, %r9], %f28
	.word 0x85220009  ! 3958: MULScc_R	mulscc 	%r8, %r9, %r2
	.word 0xd73a0009  ! 3960: STDF_R	std	%f11, [%r9, %r8]
	.word 0xce720009  ! 3961: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc8520009  ! 3961: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0x8143e078  ! 3962: MEMBAR	membar	#StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0x8143c000  ! 3963: STBAR	stbar
	.word 0xcb3a2ed0  ! 3964: STDF_I	std	%f5, [0x0ed0, %r8]
	.word 0xcaf22bb8  ! 3965: STXA_I	stxa	%r5, [%r8 + 0x0bb8] %asi
	.word 0xe27a0009  ! 3966: SWAP_R	swap	%r17, [%r8 + %r9]
	.word 0xc3e21009  ! 3967: CASA_I	casa	[%r8] 0x80, %r9, %r1
	.word 0xceaa1009  ! 3968: STBA_R	stba	%r7, [%r8 + %r9] 0x80
	.word 0xe53a2c30  ! 3969: STDF_I	std	%f18, [0x0c30, %r8]
	.word 0xc9220009  ! 3971: STF_R	st	%f4, [%r9, %r8]
	.word 0xe0720009  ! 3972: STX_R	stx	%r16, [%r8 + %r9]
	.word 0xd9020009  ! 3972: LDF_R	ld	[%r8, %r9], %f12
	.word 0xc3ea2a28  ! 3973: PREFETCHA_I	prefetcha	[%r8, + 0x0a28] %asi, #one_read
	.word 0xc3ea1009  ! 3974: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x85222e48  ! 3975: MULScc_I	mulscc 	%r8, 0x0e48, %r2
	.word 0xcb222ee4  ! 3976: STF_I	st	%f5, [0x0ee4, %r8]
	.word 0xfe720009  ! 3978: STX_R	stx	%r31, [%r8 + %r9]
	.word 0xc24a0009  ! 3978: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0x824a2360  ! 3979: MULX_I	mulx 	%r8, 0x0360, %r1
	.word 0xec5a2bf8  ! 3980: LDX_I	ldx	[%r8 + 0x0bf8], %r22
	.word 0x2c800001  ! 3981: BNEG	bneg,a	<label_0x1>
	.word 0xea7a2e94  ! 3982: SWAP_I	swap	%r21, [%r8 + 0x0e94]
	.word 0x8143c000  ! 3983: STBAR	stbar
	.word 0xceca282c  ! 3984: LDSBA_I	ldsba	[%r8, + 0x082c] %asi, %r7
	.word 0xc8320009  ! 3986: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xec1a0009  ! 3986: LDD_R	ldd	[%r8 + %r9], %r22
	.word 0xb7a20929  ! 3987: FMULs	fmuls	%f8, %f9, %f27
	.word 0xc4a22694  ! 3988: STWA_I	stwa	%r2, [%r8 + 0x0694] %asi
	.word 0x8ad22ec8  ! 3989: UMULcc_I	umulcc 	%r8, 0x0ec8, %r5
	.word 0xdc2a0009  ! 3991: STB_R	stb	%r14, [%r8 + %r9]
	.word 0xc2120009  ! 3991: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xc8fa2698  ! 3992: SWAPA_I	swapa	%r4, [%r8 + 0x0698] %asi
	.word 0x8143c000  ! 3993: STBAR	stbar
	.word 0xc3ea1009  ! 3994: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x8cda0009  ! 3995: SMULcc_R	smulcc 	%r8, %r9, %r6
	.word 0xe4320009  ! 3997: STH_R	sth	%r18, [%r8 + %r9]
	.word 0xcc020009  ! 3997: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xccaa1009  ! 3998: STBA_R	stba	%r6, [%r8 + %r9] 0x80
	.word 0xccf21009  ! 3999: STXA_R	stxa	%r6, [%r8 + %r9] 0x80
        ta      T_GOOD_TRAP

.data
	.word  0xe100ee0f,0xeccb4a76,0x58c1f351,0x79f5cd6f
	.word  0x7381079d,0x664d7449,0x505f9dfc,0x79f32979
	.word  0x298e168e,0xb73f67b3,0x90650e5c,0xc1e6c8f3
	.word  0x5889ed43,0x76272bdb,0xc5125f91,0xbe204e7b
	.word  0xfc467172,0x38d99ee4,0x20e749c2,0xd408d04d
	.word  0x399cdb23,0xe5d67d4d,0x83f8a058,0x79179bb8
	.word  0x5d490f22,0xd113ad23,0x1891150b,0xd9726856
	.word  0xa8e60e86,0xd0082a67,0x9c02fb12,0xca202a97
	.word  0x6d090b1c,0x31de66de,0xe8f2a498,0xcd5c3604
	.word  0xf7be5d90,0xe99a427e,0xd9aab8db,0x07943c48
	.word  0x847849a6,0xb329b534,0xef3dcffd,0xd4a07bf9
	.word  0x06375ad3,0x064d65fa,0xc9b9503e,0x87718ece
	.word  0xf9960241,0x492f911c,0x99119a33,0x64eae6bf
	.word  0xf0e3dd80,0x995ec1db,0xf0c3d752,0x41fc648b
	.word  0x8501f21e,0xb1767331,0xf48cab7f,0xf151adc4
	.word  0x8967daec,0x08cf7b99,0x27416005,0xce081e8f
	.word  0xa066980b,0x146df500,0x15149758,0x50859208
	.word  0xf190b593,0xe189bdbe,0x2b05c3b0,0x8a5b71e3
	.word  0x55c219ee,0xa19741bf,0xfaff2a2e,0x6ed2eea9
	.word  0xdf499583,0x008483f4,0xeaa00954,0x529b6dd9
	.word  0x24d28875,0xdfb4e32c,0x92416d7c,0xc78c0cf2
	.word  0x3345a593,0xfeabfdfa,0x43a6fce3,0xf26fb9b1
	.word  0xfc29c02b,0x6ef4beba,0x7f0609e5,0x62326e8f
	.word  0xb5e122b7,0x86c8b66c,0xfee32306,0x30024c11
	.word  0x726d4c86,0xd9b50dff,0x7b59481a,0xc8a8b9f0
	.word  0x27ce89e9,0xe90f21ac,0xc8e2fe70,0x6d54274f
	.word  0xee3e82bf,0x54b86849,0x1faf0950,0x0f910cd4
	.word  0xd01eb6d1,0xe38790cd,0xa43bb328,0x2b0624f0
	.word  0xbf5db23f,0xdf9a2d70,0x619a7eee,0x7bc13df5
	.word  0x0a9d6f8b,0x69d2df6b,0xb9fce4bd,0xac49fef2
	.word  0x9ed6a54b,0xb83744ad,0xb2be44b2,0xf4aea595
	.word  0x14b9c1c3,0x14a82796,0x34603754,0x5d4bbf66
	.word  0x8b2c5a0c,0xa48dfa79,0x4e4ec285,0x4084a354
	.word  0x6f6e3135,0xa4f4c852,0xd4463ea6,0x3e1f2dd1
	.word  0xa76574a6,0x24395165,0x44515353,0xe7ec6602
	.word  0x61a4d782,0x899897ad,0x88b7b383,0xa53cea2c
	.word  0x26d789ac,0xdec3f919,0x17083efc,0x86086320
	.word  0x0f8a1c97,0xc9dba72a,0x136c8deb,0x370ea9ba
	.word  0x7929cc00,0xb31c9437,0x3d7205e6,0x15be7beb
	.word  0x1adc93e0,0xb775eb53,0x8511009b,0xc605dc2f
	.word  0xc03fa9b8,0xecf65189,0xf07686e8,0xdbd569fe
	.word  0xb5a3a1ad,0xc09a224f,0x9165115a,0xd5c38a21
	.word  0x02eac11f,0x1cddd092,0x68372544,0xd97f4489
	.word  0x8538ffe2,0xcdeb898a,0x5d3afa49,0x76ace3d7
	.word  0xf1d3412a,0x3bc0c23d,0x4869a2e1,0x83c9f0a7
	.word  0x48702380,0xdc2ee70f,0xfd5a3164,0x881a0cb2
	.word  0x80907e47,0xa1219c84,0x74dc00d2,0xf0a26870
	.word  0xb7f8880a,0xa6434758,0x30615d04,0x0eb7a91e
	.word  0x0e7b6119,0x180dbf3a,0x3e30542a,0x66974584
	.word  0x9e1c5d48,0xda0b47ce,0x0a65d470,0x87ffd06e
	.word  0x7b6afd57,0xb2254b5d,0x7dc2e24b,0xea71037c
	.word  0x67a70f24,0x08574691,0xc4d41707,0xc08586da
	.word  0xda5146d0,0x889421ea,0xf8dc09e4,0xa3029247
	.word  0xb106068a,0xbbb0238b,0x125d1ce3,0xc86447ff
	.word  0x546250d7,0x3cde9614,0x8c291ecd,0x3104abdd
	.word  0x05ab83b6,0xb0dbc9d4,0xe7c4683c,0xf87a3101
	.word  0x33d85517,0xe735757e,0xce023f09,0xed0e7cb7
	.word  0x6c11dddf,0x9c8e7bf1,0xc96d1dcf,0x90dda603
	.word  0xbe457480,0x1c934dd0,0x6f1c4443,0xc2e9bd08
	.word  0xaec7bf10,0xe6df74ba,0xb413bb85,0x4ddd7d90
	.word  0x3685df42,0xda3cec4f,0xbeb91cff,0xe3b9609b
	.word  0x15ec3f0b,0xe5d92fe1,0xdb972b27,0xe87ddc68
	.word  0xa69802d7,0x79a8d0ac,0xfde3e004,0x9cb7d6f9
	.word  0xecbea06f,0x3a8f6ef5,0x496185c0,0x2bda50b6
	.word  0xaad02151,0xf7788798,0x87e99a72,0x3c944b62
	.word  0x9776043d,0x99c23ae4,0x65fce910,0xf25ed2b0
	.word  0xb81bcac1,0xaebed0d6,0x24291608,0x87232ff5
	.word  0x6cd6feff,0x03b3e218,0x2ae5b41a,0x6faf2796
	.word  0x10e70bec,0xb05a2d37,0xabb3cb55,0x1d767361
	.word  0x8e4220d2,0xf2677649,0x12ef3c10,0xa587d104
	.word  0xb359dcc9,0x017028d2,0x2f832139,0x2988216c
	.word  0x8015ccf2,0x9096e64a,0x1e5a54dd,0x0e657d2b
	.word  0xee9d4cea,0x8e3c00bf,0x37c3f35b,0x2213ad23
	.word  0x6a7e215e,0x287c36ac,0x4a6b6481,0x1551937f
	.word  0x2077dcbe,0xa72dc747,0x29448f1c,0x89695eb8
	.word  0x347688c0,0x2761fc1a,0x1facf0e2,0x36ef7f7a
	.word  0x92bf0b3b,0x6fb06217,0x1df59d33,0x5b7362cd
	.word  0x18c641c1,0x9647e67f,0x657b534d,0x782dede4
	.word  0xc84cdefb,0x4e66d87f,0x17ca7973,0x63561aa3
	.word  0x2927177f,0xb49a85d6,0x03bb71b4,0x54d9908f
	.word  0x17cf00ff,0x835fce8f,0xa47257ec,0xacc214fe
	.word  0x49aea088,0xfd0ca4da,0x385d030e,0x3800eae7
	.word  0xc4369928,0x3c04c5f7,0xa409c1f3,0x6659739c
	.word  0x83a882eb,0x77bdb995,0x2642da20,0xec2d9dca
	.word  0x915cf15c,0x0b269396,0x70ee57d0,0x60ae3c32
	.word  0xd42ebc71,0xa07e08d7,0x165abc24,0x5ecffca1
	.word  0x27efd8ce,0xa6f1c210,0xe12a55f3,0x9d64ab0f
	.word  0xba757421,0x3075e8b0,0x896edd6a,0xca6a0a1d
	.word  0xe185c500,0xaa6613a1,0xbe5aaca5,0x924586ba
	.word  0x09911eb4,0xd21c26ce,0x47321204,0x17b06cdf
	.word  0x10445605,0x179dd95a,0x1a7b950b,0xb11701f1
	.word  0xc2b40c16,0xc7c347b8,0x9af207dd,0x0a686d2d
	.word  0x65b85c16,0xde4953f9,0x8aa83917,0xf4f06f0b
	.word  0x5ca1c52f,0x4495e13a,0x38a0d362,0x5b75def9
	.word  0xd239455a,0x5df9c68e,0x13dc6851,0x29ef944e
	.word  0x26be2f24,0x92f9e895,0x04c2d197,0x287ff4ab
	.word  0x9be9a394,0x878aad7e,0x2425c1d6,0x16611e34
	.word  0xff3ad87d,0x89317d0e,0x0f4b965a,0x12b6cfdc
	.word  0x24987ce7,0xcb25fc68,0xc0347e04,0x0f3b783b
	.word  0x896a2b7d,0xcd0d0146,0xb2c62989,0x0bbf8780
	.word  0x1db073f7,0x1f779306,0x1f72d635,0x04413af9
	.word  0xca05555a,0x1988dafc,0xb27cbaed,0xde45bba9
	.word  0x24aae8fb,0x87f56bb7,0x24e36140,0x3784b79f
	.word  0x35a8b81c,0xdc6c3087,0x76291c84,0x7a3b011b
	.word  0x98e9526c,0xa2f9d8ba,0x1bd4cb1f,0x750342e4
	.word  0xf1e871c7,0x0e6ddd40,0x01351a01,0xc2af169d
	.word  0x6864b9eb,0x0db3664d,0x0471c64c,0x605d3509
	.word  0xeccf28a8,0xe208c8ef,0xb05d5756,0xee929b6d
	.word  0x8a5e0baa,0xcf6ef03a,0xdbd9b203,0x3e5507e4
	.word  0x9a3f630e,0x7f1ef93d,0xc73565c2,0xb6c6628b
	.word  0xa52e145f,0xc9395e04,0xbd1e5521,0xa53812eb
	.word  0xfb02e3de,0x2b3fa81a,0x54c10102,0x058b8da9
	.word  0x4a5cc749,0x56ca0b32,0x3b669347,0x852acf7d
	.word  0x37bfc511,0x670b1dcb,0xcb44c2eb,0x759382a6
	.word  0xf18051df,0xbb451c40,0x060c0d6e,0x3cc74777
	.word  0x2b2b7cca,0x10906605,0xaa40fb1d,0x0c560deb
	.word  0x851453ff,0x73dd4ad3,0xcfb72b1e,0x59026276
	.word  0xd5826da5,0xe2638b2c,0xeae32d25,0xb85ffa81
	.word  0x5a633c2e,0xa857c206,0xfcd28a36,0x5216cfa8
	.word  0xc7b67989,0xc1ac322b,0x1bd88174,0xc87aa289
	.word  0x5d66f772,0x792ef8dc,0xfcc09a1f,0x95d4c0cf
	.word  0x4517c73f,0x916f08f1,0x57a60577,0xb5c3e789
	.word  0x3500bb05,0xc015615e,0x169114c7,0x061dceaf
	.word  0x81cea048,0x2ea39c59,0x81d02a61,0x373ceb09
	.word  0x5c2a97a9,0x27d1b319,0xdb8c38a7,0xacf48435
	.word  0x4c52eb53,0xd5208ec1,0x15c470cf,0xc8fb97b5
	.word  0x1e53e809,0xbc81fc9d,0x3ca02a86,0xb7cab310
	.word  0x68c9c89c,0x20955766,0xdf1c1b6a,0xa7d879ec
	.word  0x2b3224ff,0x118635ef,0x23db61f5,0x6ead992b
	.word  0x3b0717bc,0x1e4acd14,0xeb88dca0,0x0ebc35de
	.word  0x45b0ae10,0x8deddd07,0x07f23ca7,0x66f40663
	.word  0xf8d3b6f2,0x520b92b5,0x9795b091,0x315147ff
	.word  0x946d2471,0xbf081204,0x61817dfc,0x2b5aec51
	.word  0xab5ceefa,0xefc1c639,0xc66ad684,0x8717809e
	.word  0xf1b8a121,0xaa97e206,0xf46c8284,0x21e90a59
	.word  0x8c68952f,0x06844395,0x1ed15770,0xd5a4a337
	.word  0x6500bb42,0x8d544695,0xdfde2def,0x5ca28afc
	.word  0x07a39b1e,0x12f72e55,0x0aeed7e5,0xcea40ffa
	.word  0x917ec16b,0x2d8fb2e4,0x10266fcc,0x55fec0e3
	.word  0xc27c13f3,0x6d6d8b2e,0x5a78e95d,0xdcec6238
	.word  0xe71addbb,0x74f5b759,0x545e8d77,0xd8c90c13
	.word  0x71cfe5a9,0x8522ce34,0x99d37dd2,0xa8d02e81
	.word  0xcd864458,0xe42f92c0,0x2482edaa,0xc1cad9e8
	.word  0x5ee4275f,0x3f538972,0x2d619ced,0x42d50f9e
	.word  0x88cdf16f,0xdb123b74,0xd30594c5,0xf35051c6
	.word  0x8751dfa4,0x1dd40129,0xcb7a15b0,0xfe8d4226
	.word  0x7697d388,0x7dc0357c,0xc6a2dd83,0x3c9f2a18
	.word  0xc2735304,0x638dd18a,0xd90a43d6,0x5001b1da
	.word  0xedc1231a,0xda5f5e32,0x9a59e1f2,0xd8037ca6
	.word  0xead69469,0x258b3be7,0xe5a4d466,0xc95a1073
	.word  0x9607ae84,0xd76ce5bc,0x0361ec26,0xd8fa223a
	.word  0x2325f3bb,0x6f3209bd,0x5fbb3e2b,0x1f865ca7
	.word  0xdc1a1f28,0x7241773f,0xa741bb68,0x9b886c5f
	.word  0x0cf0001b,0xaf0f8a83,0xab88a1f8,0xfe17b095
	.word  0x53f6d52a,0x2f8d7099,0x73a7df25,0x5cebc7ee
	.word  0x51ea1008,0xd324945a,0x8b818bcc,0x98403a6f
	.word  0xabba3b59,0x4f47421a,0x149a6076,0x4380bc23
	.word  0xae60c370,0x923193cd,0x41fae716,0x61810a2c
	.word  0x4d47ebef,0x3acef0d6,0x2fa0aec5,0xd91b0f1e
	.word  0xfd8a565f,0x4b12668b,0xd95134e5,0xd859f83e
	.word  0x31c61849,0x1b4456ac,0x6ace4e6a,0x5e43aabb
	.word  0x146f2b89,0xe2e7b476,0x11fc2850,0xbe74bd44
	.word  0x26553041,0xc2c46421,0x4e9b06c4,0x14d19b47
	.word  0xa092207a,0xb0f84e7f,0x4741b129,0xa740327a
	.word  0x0683bc8c,0xdf8e134f,0x17f54ed1,0x2f601c96
	.word  0xb5b43640,0xf3ae4677,0xa0b0c9d4,0x42440315
	.word  0xa26b5860,0x27672a5a,0x6fc061a1,0x15486726
	.word  0xb09c0958,0xd8680a15,0x3f82356f,0xee3b4fd7
	.word  0x9e833ca3,0x2716e099,0xc0cc4d83,0xc8666b48
	.word  0xaf3b6463,0xbebcd759,0xebd3827e,0x3cd46e7a
	.word  0x63e66a94,0xee87733f,0xbb202c12,0x64300524
	.word  0x97e71a73,0x1fcae0db,0x0a51efeb,0xd43ffb23
	.word  0x2614816f,0x4842fbf5,0x37d76007,0x695aebac
	.word  0xf8d77789,0x9ca15fd3,0x609d78d4,0x4f78a218
	.word  0xef433a67,0x8c65e472,0x26865705,0x1e267604
	.word  0x2ad399aa,0xd003b15f,0x062f4efe,0xb1c2f687
	.word  0xc884f3bf,0xd3e4d1c9,0x1eac00c4,0x6393fc29
	.word  0x5f39203f,0x06a57269,0x070b15cd,0x4142c887
	.word  0x259374ac,0xf452443b,0x3f3cc716,0xebe2d4d7
	.word  0x174002f5,0x0b30f911,0x1b375153,0xeb650aac
	.word  0xd9303e43,0x61054ea0,0xa47d6cd9,0xfba46a33
	.word  0x0f5c0cce,0x07bba0e1,0x7e06f71d,0x3a1af8a7
	.word  0xb0c9d33c,0xef28e883,0x591f8c8e,0x61b20543
	.word  0x781e97dd,0x205b516a,0x3da8a362,0x8253eba3
	.word  0x7555bd02,0x57a9fa77,0x372a42d9,0xfbc32011
	.word  0xad72f090,0x85610e91,0x115cb090,0x9f9d4d54
	.word  0x8534c14f,0xe55a2c80,0x2317a6fc,0x084245d3
	.word  0x5a9ecd14,0x38ea4f86,0x198d5ef2,0x6e9be186
	.word  0xa099085f,0x006c5a47,0x548f604b,0xcaca1881
	.word  0x757b4e44,0x74e58ae0,0x75d226b9,0x27529e6a
	.word  0x3c782fc0,0x454c78f8,0xd7e125bd,0x3954410a
	.word  0x25cc52f4,0x6e3bf984,0xeead8e96,0xd4b71cc7
	.word  0xd8ecf3a1,0x2b825bb1,0x639b8a39,0xcff6d843
	.word  0x268e6623,0x429499e6,0xa3badaa2,0x60bafc92
	.word  0x5a1e2226,0x721c52db,0xa97c320b,0x62407346
	.word  0x94f887c6,0x9eb03e13,0x63c928b7,0x6de34c5b
	.word  0x7f00fbcf,0x4af08e67,0xf946c843,0x170b0c51
	.word  0x80749378,0x30632d28,0xfe7442a4,0xb7b3a0be
	.word  0xb6b820d1,0x5687da3b,0x2f21f63e,0xc344b641
	.word  0x58e689ab,0xfb9567bb,0x92592d85,0x6401daa1
	.word  0x17f2b36d,0x818dcb10,0x0ed779d0,0x7f8fca56
	.word  0x79bb3a92,0x6e804ae6,0x60f0e852,0xbf75a10d
	.word  0xbddb8d4b,0x6587d836,0xafc99975,0xff0e190d
	.word  0x4e0a44e5,0x19f0c839,0x30d28de5,0x281190b9
	.word  0xd385f9a6,0xa5777fe8,0xafc06c31,0x470ee511
	.word  0x1fd790f8,0x1bb36174,0xc2833381,0x1e54e812
	.word  0xed85bcc8,0x9d7ee617,0x55fa3c67,0xdd4177ec
	.word  0xb14937e1,0x7d701b6a,0xa1a63d80,0x74c39a62
	.word  0xc4f618f1,0x5e9fca2c,0x6cfb54be,0xf391b5ce
	.word  0x7d5500eb,0xb1d7a8e8,0x9a82ef8b,0x4e62996a
	.word  0x2884e92a,0x9e7d8839,0xa2b31fbc,0x51526def
	.word  0xfc3204a5,0xafa05a1f,0x75fb6559,0x4b3920cb
	.word  0x01f492a1,0xd21b3aa6,0xed1ee7c8,0x9826d883
	.word  0xf2233a32,0xcda087d4,0x2c98c760,0xf4229a43
	.word  0x972bf922,0x4712da5f,0x276fc7f2,0xcbe22dcd
	.word  0xe85a2cf4,0x57f26c31,0x356b0f01,0x13244d47
	.word  0x84a032f9,0x74754017,0x1dd880f6,0x02540342
	.word  0x68d914c0,0xa42f0532,0x560ecf3b,0x28edfe2f
	.word  0x58ac81fa,0x254d722c,0xe33414a3,0x404b3e46
	.word  0xc904347e,0x83f2811e,0x6fc460ec,0xacddae80
	.word  0x60e6cda6,0x98a36167,0x940f6ea2,0x21d69e55
	.word  0x126ec594,0xd88b29b1,0x986aa247,0xbdc487ff
	.word  0x69f66830,0xde841648,0x7d8041ea,0x75cef98c
	.word  0x0a5b0388,0x70842080,0x543ad4e5,0x71c5de09
	.word  0x2dd534a3,0x6151a232,0xb62706e6,0x7a3dd01c
	.word  0x1fcea4c5,0xe8a391f4,0x45552821,0xe45d2230
	.word  0x548d8cad,0x22b7f0db,0xc913147f,0x7b145786
	.word  0x486c184e,0x3eba132f,0xfebc3f3b,0x0dc7aec3
	.word  0x3c89cc96,0xd188e1a4,0xf6ccf6f5,0xade392df
	.word  0xa980e9fb,0x35eb0235,0x49a96b54,0xa3293fc5
	.word  0x4f6c5e0a,0xf032a197,0xc4821e46,0x63bf860f
	.word  0xcd707656,0xd4d0b48b,0xaae6c586,0x04026c44
	.word  0x27541c7b,0xb3784272,0xec6fa880,0xb55d5c87
	.word  0x198db430,0x77cdc6af,0x0017a11b,0xaecba485
	.word  0x2e23351b,0xb0fe136a,0xae72145a,0x8c9bdbb3
	.word  0xa0c6e182,0xb9c44b39,0x056d7b8f,0x49d3676e
	.word  0x45acfe3d,0xa304a289,0x39e93560,0xc9b4810e
	.word  0x4b764408,0x88dbb172,0xd05d2a10,0x697baeed
	.word  0x3f8fbc31,0xaa0d3d9c,0x54230fbf,0xaea77bc3
	.word  0x170c85bd,0x40d6a21a,0xca54b32e,0xb72f4781
	.word  0x24de018f,0xe2ac550d,0x4ef550bc,0x9283b0ff
	.word  0xdd0b6ca9,0xd06d4c7c,0x9d14dcd4,0x8a383bb6
	.word  0x41ac4227,0x9bca4b21,0xf4a7a6e1,0x756d81e3
	.word  0x9240bb81,0xbd121636,0x3f376994,0x870e611c
	.word  0x8d570e0e,0xe3bf8c7b,0x3eb35553,0x3d96ea63
	.word  0x046ef9a3,0x5f9acaa2,0xfb095508,0x754c0afb
	.word  0xc1ad7233,0xb2372887,0x8c541c4e,0xb85f9714
	.word  0x771e821a,0xee974b22,0xdcb35ca7,0xfaf0e3e6
	.word  0x2763f645,0x9ee4c6b8,0x78f9c83e,0x6a49cfe0
	.word  0xbed823c6,0xf80a534f,0x36300f2f,0x7fb5cd88
	.word  0xd1907978,0x23bc259c,0xdd5d744c,0x0d6e7e1c
	.word  0x767b0580,0x26c68499,0xc7a9b1ee,0xda30a153
	.word  0xe3922bd5,0x01ec8b51,0x571b2f80,0x65d1043c
	.word  0x603f048f,0x6c1c83c6,0x67814e7f,0xda7317ae
	.word  0x7fc5f21e,0x526a617a,0xb986ebe6,0xa1947107
	.word  0xdd03850f,0xe5b78d6b,0xc3b18752,0xaacb0005

!!# /************************************************************
!!# *
!!# * File:         stb_raw_0.j
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
!!#   IJ_set_rvar (Rv_lop_wt, "{5}");
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
!!# inst_type: stb_raw 
!!# 	   | lop %rvar Rv_lop_wt
!!# 		{
!!# 		   IJ_generate ("th", $1);
!!# 		}
!!# ;
!!# 
!!# stb_raw: store_r load_r
!!# {
!!#    IJ_generate_va ("th", $1, $2, NULL);
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
!! Rule   1 (line  117), Count:  3899  inst_block           -> inst_type 
!! Rule   2 (line  118), Count:  3899  inst_block           -> inst_block inst_type 
!! Rule   3 (line  121), Count:  1099  inst_type            -> stb_raw 
!! Rule   4 (line  122), Count:  2799  inst_type            -> lop 
!! Rule   5 (line  128), Count:  1099  stb_raw              -> store_r load_r 
!! Rule   6 (line  134), Count:   288  lop                  -> mul 
!! Rule   7 (line  134), Count:   271  lop                  -> div 
!! Rule   8 (line  134), Count:   279  lop                  -> fpop 
!! Rule   9 (line  134), Count:   276  lop                  -> load 
!! Rule  10 (line  134), Count:   275  lop                  -> asi_load 
!! Rule  11 (line  134), Count:   284  lop                  -> asi_st 
!! Rule  12 (line  134), Count:   270  lop                  -> br 
!! Rule  13 (line  134), Count:   275  lop                  -> membar 
!! Rule  14 (line  134), Count:   275  lop                  -> atomic 
!! Rule  15 (line  134), Count:   297  lop                  -> prefetch 
!! Rule  16 (line  137), Count:   120  store_r              -> tSTB_R 
!! Rule  17 (line  137), Count:   131  store_r              -> tSTH_R 
!! Rule  18 (line  137), Count:   156  store_r              -> tSTW_R 
!! Rule  19 (line  137), Count:   139  store_r              -> tSTX_R 
!! Rule  22 (line  140), Count:    59  load_r               -> tLDSB_R 
!! Rule  23 (line  140), Count:    55  load_r               -> tLDSH_R 
!! Rule  24 (line  140), Count:    63  load_r               -> tLDSW_R 
!! Rule  25 (line  140), Count:    49  load_r               -> tLDUB_R 
!! Rule  26 (line  140), Count:    61  load_r               -> tLDUH_R 
!! Rule  27 (line  140), Count:    67  load_r               -> tLDUW_R 
!! Rule  28 (line  140), Count:    48  load_r               -> tLDX_R 
!! Rule  29 (line  140), Count:    39  load_r               -> tLDD_R 
!! Rule  30 (line  140), Count:    50  load_r               -> tLDF_R 
!! Rule  31 (line  140), Count:    49  load_r               -> tLDDF_R 
!! Rule  32 (line  143), Count:   132  fpop                 -> st_fp 
!! Rule  33 (line  143), Count:   146  fpop                 -> arith_fp 
!! Rule  34 (line  146), Count:    31  mul                  -> tMULX_R 
!! Rule  35 (line  146), Count:    24  mul                  -> tMULX_I 
!! Rule  36 (line  146), Count:    25  mul                  -> tUMUL_R 
!! Rule  37 (line  146), Count:    23  mul                  -> tUMUL_I 
!! Rule  38 (line  146), Count:    25  mul                  -> tSMUL_R 
!! Rule  39 (line  146), Count:    19  mul                  -> tSMUL_I 
!! Rule  40 (line  146), Count:    26  mul                  -> tUMULcc_R 
!! Rule  41 (line  146), Count:    18  mul                  -> tUMULcc_I 
!! Rule  42 (line  146), Count:    26  mul                  -> tSMULcc_R 
!! Rule  43 (line  146), Count:    16  mul                  -> tSMULcc_I 
!! Rule  44 (line  146), Count:    24  mul                  -> tMULScc_R 
!! Rule  45 (line  146), Count:    20  mul                  -> tMULScc_I 
!! Rule  46 (line  149), Count:    19  div                  -> tUDIV_I 
!! Rule  47 (line  149), Count:    22  div                  -> tUDIV_R 
!! Rule  48 (line  149), Count:    23  div                  -> tSDIV_I 
!! Rule  49 (line  149), Count:    23  div                  -> tSDIV_R 
!! Rule  50 (line  149), Count:    16  div                  -> tSDIVX_R 
!! Rule  51 (line  149), Count:    30  div                  -> tSDIVX_I 
!! Rule  52 (line  149), Count:    19  div                  -> tUDIVX_R 
!! Rule  53 (line  149), Count:    16  div                  -> tUDIVX_I 
!! Rule  54 (line  149), Count:    18  div                  -> tUDIVcc_I 
!! Rule  55 (line  149), Count:    23  div                  -> tUDIVcc_R 
!! Rule  56 (line  149), Count:    26  div                  -> tSDIVcc_I 
!! Rule  57 (line  149), Count:    25  div                  -> tSDIVcc_R 
!! Rule  58 (line  152), Count:    16  load                 -> tLDSB_R 
!! Rule  59 (line  152), Count:    12  load                 -> tLDSB_I 
!! Rule  60 (line  152), Count:    13  load                 -> tLDSH_R 
!! Rule  61 (line  152), Count:     8  load                 -> tLDSH_I 
!! Rule  62 (line  152), Count:     9  load                 -> tLDSW_R 
!! Rule  63 (line  152), Count:    10  load                 -> tLDSW_I 
!! Rule  64 (line  152), Count:    13  load                 -> tLDUB_R 
!! Rule  65 (line  152), Count:    16  load                 -> tLDUB_I 
!! Rule  66 (line  152), Count:    14  load                 -> tLDUH_R 
!! Rule  67 (line  152), Count:    15  load                 -> tLDUH_I 
!! Rule  68 (line  152), Count:    14  load                 -> tLDUW_R 
!! Rule  69 (line  152), Count:    10  load                 -> tLDUW_I 
!! Rule  70 (line  152), Count:    23  load                 -> tLDX_R 
!! Rule  71 (line  152), Count:    16  load                 -> tLDX_I 
!! Rule  72 (line  152), Count:    11  load                 -> tLDD_R 
!! Rule  73 (line  152), Count:    15  load                 -> tLDD_I 
!! Rule  74 (line  152), Count:    10  load                 -> tLDF_I 
!! Rule  75 (line  152), Count:    11  load                 -> tLDF_R 
!! Rule  76 (line  152), Count:     8  load                 -> tLDDF_I 
!! Rule  77 (line  152), Count:    13  load                 -> tLDDF_R 
!! Rule  78 (line  155), Count:    15  asi_load             -> tLDSBA_R 
!! Rule  79 (line  155), Count:    19  asi_load             -> tLDSBA_I 
!! Rule  80 (line  155), Count:    18  asi_load             -> tLDSHA_R 
!! Rule  81 (line  155), Count:    16  asi_load             -> tLDSHA_I 
!! Rule  82 (line  155), Count:    17  asi_load             -> tLDSWA_R 
!! Rule  83 (line  155), Count:    20  asi_load             -> tLDSWA_I 
!! Rule  84 (line  155), Count:    14  asi_load             -> tLDUBA_R 
!! Rule  85 (line  155), Count:    19  asi_load             -> tLDUBA_I 
!! Rule  86 (line  155), Count:    17  asi_load             -> tLDUHA_R 
!! Rule  87 (line  155), Count:    14  asi_load             -> tLDUHA_I 
!! Rule  88 (line  155), Count:    12  asi_load             -> tLDUWA_R 
!! Rule  89 (line  155), Count:     7  asi_load             -> tLDUWA_I 
!! Rule  90 (line  155), Count:    18  asi_load             -> tLDXA_R 
!! Rule  91 (line  155), Count:    20  asi_load             -> tLDXA_I 
!! Rule  92 (line  155), Count:    11  asi_load             -> tLDDA_R 
!! Rule  93 (line  155), Count:    23  asi_load             -> tLDDA_I 
!! Rule  94 (line  158), Count:    17  asi_st               -> tSTBA_R 
!! Rule  95 (line  158), Count:    26  asi_st               -> tSTBA_I 
!! Rule  96 (line  158), Count:    32  asi_st               -> tSTHA_R 
!! Rule  97 (line  158), Count:    36  asi_st               -> tSTHA_I 
!! Rule  98 (line  158), Count:    18  asi_st               -> tSTWA_R 
!! Rule  99 (line  158), Count:    29  asi_st               -> tSTWA_I 
!! Rule 100 (line  158), Count:    28  asi_st               -> tSTXA_R 
!! Rule 101 (line  158), Count:    28  asi_st               -> tSTXA_I 
!! Rule 102 (line  158), Count:    39  asi_st               -> tSTDA_R 
!! Rule 103 (line  158), Count:    22  asi_st               -> tSTDA_I 
!! Rule 104 (line  161), Count:     7  br                   -> tBA 
!! Rule 105 (line  161), Count:    13  br                   -> tBN 
!! Rule 106 (line  161), Count:    18  br                   -> tBNE 
!! Rule 107 (line  161), Count:    14  br                   -> tBE 
!! Rule 108 (line  161), Count:    12  br                   -> tBG 
!! Rule 109 (line  161), Count:    11  br                   -> tBLE 
!! Rule 110 (line  161), Count:     8  br                   -> tBGE 
!! Rule 111 (line  161), Count:     7  br                   -> tBL 
!! Rule 112 (line  161), Count:    13  br                   -> tBGU 
!! Rule 113 (line  161), Count:     7  br                   -> tBLEU 
!! Rule 114 (line  162), Count:    10  br                   -> tBCC 
!! Rule 115 (line  162), Count:    13  br                   -> tBCS 
!! Rule 116 (line  162), Count:     9  br                   -> tBPOS 
!! Rule 117 (line  162), Count:    13  br                   -> tBNEG 
!! Rule 118 (line  162), Count:     7  br                   -> tBVC 
!! Rule 119 (line  162), Count:    11  br                   -> tBVS 
!! Rule 120 (line  162), Count:     9  br                   -> tBRZ 
!! Rule 121 (line  162), Count:    12  br                   -> tBRLEZ 
!! Rule 122 (line  163), Count:     9  br                   -> tBRLZ 
!! Rule 123 (line  163), Count:     7  br                   -> tBRNZ 
!! Rule 124 (line  163), Count:    11  br                   -> tBRGZ 
!! Rule 125 (line  163), Count:    11  br                   -> tBRGEZ 
!! Rule 126 (line  163), Count:    16  br                   -> tCALL 
!! Rule 127 (line  166), Count:   140  membar               -> tMEMBAR 
!! Rule 128 (line  166), Count:   134  membar               -> tSTBAR 
!! Rule 129 (line  169), Count:    25  atomic               -> tCASA_R 
!! Rule 130 (line  169), Count:    18  atomic               -> tCASA_I 
!! Rule 131 (line  169), Count:    14  atomic               -> tCASXA_R 
!! Rule 132 (line  169), Count:    16  atomic               -> tCASXA_I 
!! Rule 133 (line  169), Count:    32  atomic               -> tLDSTUBA_I 
!! Rule 134 (line  169), Count:    32  atomic               -> tLDSTUB_I 
!! Rule 135 (line  169), Count:    22  atomic               -> tLDSTUB_R 
!! Rule 136 (line  169), Count:    27  atomic               -> tLDSTUBA_R 
!! Rule 137 (line  169), Count:    21  atomic               -> tSWAP_I 
!! Rule 138 (line  169), Count:    21  atomic               -> tSWAP_R 
!! Rule 139 (line  169), Count:    19  atomic               -> tSWAPA_I 
!! Rule 140 (line  169), Count:    17  atomic               -> tSWAPA_R 
!! Rule 142 (line  172), Count:    60  st_fp                -> tSTF_I 
!! Rule 143 (line  172), Count:    71  st_fp                -> tSTDF_I 
!! Rule 145 (line  175), Count:    34  arith_fp             -> tFADDs 
!! Rule 146 (line  175), Count:    37  arith_fp             -> tFSUBs 
!! Rule 147 (line  175), Count:    41  arith_fp             -> tFMULs 
!! Rule 148 (line  175), Count:    31  arith_fp             -> tFDIVs 
!! Rule 149 (line  178), Count:    80  prefetch             -> tPREFETCH_I 
!! Rule 150 (line  178), Count:    69  prefetch             -> tPREFETCH_R 
!! Rule 151 (line  178), Count:    60  prefetch             -> tPREFETCHA_I 
!! 
!!   257: Token tSTB_R	Count = 121
!!   258: Token tSTH_R	Count = 132
!!   259: Token tSTW_R	Count = 157
!!   260: Token tSTX_R	Count = 140
!!   261: Token tSTF_R	Count = 49
!!   262: Token tSTDF_R	Count = 52
!!   263: Token tLDSB_R	Count = 77
!!   264: Token tLDSH_R	Count = 70
!!   265: Token tLDSW_R	Count = 74
!!   266: Token tLDUB_R	Count = 64
!!   267: Token tLDUH_R	Count = 77
!!   268: Token tLDUW_R	Count = 83
!!   269: Token tLDX_R	Count = 73
!!   270: Token tLDD_R	Count = 52
!!   271: Token tLDF_R	Count = 63
!!   272: Token tLDDF_R	Count = 64
!!   273: Token tMULX_R	Count = 32
!!   274: Token tMULX_I	Count = 25
!!   275: Token tUMUL_R	Count = 26
!!   276: Token tUMUL_I	Count = 24
!!   277: Token tSMUL_R	Count = 26
!!   278: Token tSMUL_I	Count = 20
!!   279: Token tUMULcc_R	Count = 27
!!   280: Token tUMULcc_I	Count = 19
!!   281: Token tSMULcc_R	Count = 27
!!   282: Token tSMULcc_I	Count = 17
!!   283: Token tMULScc_R	Count = 25
!!   284: Token tMULScc_I	Count = 21
!!   285: Token tUDIV_I	Count = 20
!!   286: Token tUDIV_R	Count = 23
!!   287: Token tSDIV_I	Count = 24
!!   288: Token tSDIV_R	Count = 24
!!   289: Token tSDIVX_R	Count = 17
!!   290: Token tSDIVX_I	Count = 31
!!   291: Token tUDIVX_R	Count = 20
!!   292: Token tUDIVX_I	Count = 17
!!   293: Token tUDIVcc_I	Count = 19
!!   294: Token tUDIVcc_R	Count = 24
!!   295: Token tSDIVcc_I	Count = 27
!!   296: Token tSDIVcc_R	Count = 26
!!   297: Token tLDSB_I	Count = 13
!!   298: Token tLDSH_I	Count = 9
!!   299: Token tLDSW_I	Count = 11
!!   300: Token tLDUB_I	Count = 17
!!   301: Token tLDUH_I	Count = 16
!!   302: Token tLDUW_I	Count = 11
!!   303: Token tLDX_I	Count = 17
!!   304: Token tLDD_I	Count = 16
!!   305: Token tLDF_I	Count = 11
!!   306: Token tLDDF_I	Count = 9
!!   307: Token tLDSBA_R	Count = 16
!!   308: Token tLDSBA_I	Count = 20
!!   309: Token tLDSHA_R	Count = 19
!!   310: Token tLDSHA_I	Count = 17
!!   311: Token tLDSWA_R	Count = 18
!!   312: Token tLDSWA_I	Count = 21
!!   313: Token tLDUBA_R	Count = 15
!!   314: Token tLDUBA_I	Count = 20
!!   315: Token tLDUHA_R	Count = 18
!!   316: Token tLDUHA_I	Count = 15
!!   317: Token tLDUWA_R	Count = 13
!!   318: Token tLDUWA_I	Count = 8
!!   319: Token tLDXA_R	Count = 19
!!   320: Token tLDXA_I	Count = 21
!!   321: Token tLDDA_R	Count = 12
!!   322: Token tLDDA_I	Count = 24
!!   323: Token tSTBA_R	Count = 18
!!   324: Token tSTBA_I	Count = 27
!!   325: Token tSTHA_R	Count = 33
!!   326: Token tSTHA_I	Count = 37
!!   327: Token tSTWA_R	Count = 19
!!   328: Token tSTWA_I	Count = 30
!!   329: Token tSTXA_R	Count = 29
!!   330: Token tSTXA_I	Count = 29
!!   331: Token tSTDA_R	Count = 40
!!   332: Token tSTDA_I	Count = 23
!!   333: Token tBA	Count = 8
!!   334: Token tBN	Count = 14
!!   335: Token tBNE	Count = 19
!!   336: Token tBE	Count = 15
!!   337: Token tBG	Count = 13
!!   338: Token tBLE	Count = 12
!!   339: Token tBGE	Count = 9
!!   340: Token tBL	Count = 8
!!   341: Token tBGU	Count = 14
!!   342: Token tBLEU	Count = 8
!!   343: Token tBCC	Count = 11
!!   344: Token tBCS	Count = 14
!!   345: Token tBPOS	Count = 10
!!   346: Token tBNEG	Count = 14
!!   347: Token tBVC	Count = 8
!!   348: Token tBVS	Count = 12
!!   349: Token tBRZ	Count = 10
!!   350: Token tBRLEZ	Count = 13
!!   351: Token tBRLZ	Count = 10
!!   352: Token tBRNZ	Count = 8
!!   353: Token tBRGZ	Count = 12
!!   354: Token tBRGEZ	Count = 12
!!   355: Token tCALL	Count = 17
!!   356: Token tMEMBAR	Count = 141
!!   357: Token tSTBAR	Count = 135
!!   358: Token tCASA_R	Count = 26
!!   359: Token tCASA_I	Count = 19
!!   360: Token tCASXA_R	Count = 15
!!   361: Token tCASXA_I	Count = 17
!!   362: Token tLDSTUBA_I	Count = 33
!!   363: Token tLDSTUB_I	Count = 33
!!   364: Token tLDSTUB_R	Count = 23
!!   365: Token tLDSTUBA_R	Count = 28
!!   366: Token tSWAP_I	Count = 22
!!   367: Token tSWAP_R	Count = 22
!!   368: Token tSWAPA_I	Count = 20
!!   369: Token tSWAPA_R	Count = 18
!!   370: Token tSTF_I	Count = 61
!!   371: Token tSTDF_I	Count = 72
!!   372: Token tFADDs	Count = 35
!!   373: Token tFSUBs	Count = 38
!!   374: Token tFMULs	Count = 42
!!   375: Token tFDIVs	Count = 32
!!   376: Token tPREFETCH_I	Count = 81
!!   377: Token tPREFETCH_R	Count = 70
!!   378: Token tPREFETCHA_I	Count = 61
!!   379: Token tPREFETCHA_R	Count = 86
!! 
!! 
!! +++ finish +++

