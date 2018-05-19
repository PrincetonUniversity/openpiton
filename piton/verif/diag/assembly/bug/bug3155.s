// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: bug3155.s
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
   random seed:	316040039
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
        setx  0x0000000000000350, %g1, %r11
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
        setx  0x542b2bd2d87489e1, %g1, %r0
        setx  0x7b8e60d1785bc2e7, %g1, %r1
        setx  0xa1b287d6dfd57730, %g1, %r2
        setx  0xfd691a8c554e3d11, %g1, %r3
        setx  0x752da8edbcdd62e6, %g1, %r4
        setx  0x8321744ffd8f98ce, %g1, %r5
        setx  0xa2b70fdf9f46b135, %g1, %r6
        setx  0x1b8da7865c0722fb, %g1, %r7
        setx  0xaa6093848ad4b5dd, %g1, %r8
        setx  0xc4a24eeca2ebbb2f, %g1, %r9
        setx  0x63e538d2248f6336, %g1, %r12
        setx  0xd3c84d230255e7a5, %g1, %r13
        setx  0xeedf34b7bdb0c5c5, %g1, %r14
        setx  0xb626040eb904037d, %g1, %r15
        setx  0xa9cd4192de69cfff, %g1, %r16
        setx  0xb13d02b2b66d9240, %g1, %r17
        setx  0x1cad8aae58578de1, %g1, %r18
        setx  0x5ba3fe2ef17dfaf5, %g1, %r19
        setx  0xdc11c31e6e5adc1f, %g1, %r20
        setx  0x01766ada68d258f5, %g1, %r21
        setx  0xf535c46a922344ce, %g1, %r22
        setx  0xe342a26b0c525050, %g1, %r23
        setx  0x10f67ea596806b7d, %g1, %r24
        setx  0xb3b30743eaf540f3, %g1, %r25
        setx  0x68b7a3eeb21edc10, %g1, %r26
        setx  0x58e47e946aa1a723, %g1, %r27
        setx  0x598feda0d21fc30a, %g1, %r28
        setx  0x2aaa538b9dfba7a5, %g1, %r29
        setx  0xdf3052992767cc42, %g1, %r30
        setx  0xc59acb4cc52014bd, %g1, %r31
	.word 0xdaf2aaa0  ! 5: STXA_I	stxa	%r13, [%r10 + 0x0aa0] %asi
	.word 0xecb2a9bc  ! 6: STHA_I	stha	%r22, [%r10 + 0x09bc] %asi
	.word 0xe412800b  ! 8: LDUH_R	lduh	[%r10 + %r11], %r18
	.word 0xe0ba900b  ! 9: STDA_R	stda	%r16, [%r10 + %r11] 0x80
	.word 0x8143e040  ! 10: MEMBAR	membar	#Sync 
	.word 0xceda900b  ! 11: LDXA_R	ldxa	[%r10, %r11] 0x80, %r7
	.word 0xb1da800b  ! 12: FLUSH_R	dis not found

	.word 0xd09a900b  ! 13: LDDA_R	ldda	[%r10, %r11] 0x80, %r8
	.word 0xdc1aa790  ! 14: LDD_I	ldd	[%r10 + 0x0790], %r14
	.word 0xbcfaa498  ! 15: SDIVcc_I	sdivcc 	%r10, 0x0498, %r30
	.word 0x26800003  ! 16: BL	bl,a	<label_0x3>
	.word 0x8143e051  ! 17: MEMBAR	membar	#LoadLoad | #Lookaside | #Sync 
	.word 0xd20aaa90  ! 18: LDUB_I	ldub	[%r10 + 0x0a90], %r9
	.word 0xc81aa2d8  ! 19: LDD_I	ldd	[%r10 + 0x02d8], %r4
	.word 0xcc0a800b  ! 20: LDUB_R	ldub	[%r10 + %r11], %r6
	.word 0xc4faa8a0  ! 21: SWAPA_I	swapa	%r2, [%r10 + 0x08a0] %asi
	.word 0x86daa968  ! 22: SMULcc_I	smulcc 	%r10, 0x0968, %r3
	.word 0xc81a800b  ! 23: LDD_R	ldd	[%r10 + %r11], %r4
	.word 0xc60aab50  ! 24: LDUB_I	ldub	[%r10 + 0x0b50], %r3
	.word 0x84f2800b  ! 25: UDIVcc_R	udivcc 	%r10, %r11, %r2
	.word 0x8ef2800b  ! 26: UDIVcc_R	udivcc 	%r10, %r11, %r7
	.word 0xe7f2a00b  ! 27: CASXA_R	casxa	[%r10]%asi, %r11, %r19
	.word 0x8143e053  ! 28: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside | #Sync 
	.word 0x886aa8a8  ! 29: UDIVX_I	udivx 	%r10, 0x08a8, %r4
	.word 0x9c72800b  ! 30: UDIV_R	udiv 	%r10, %r11, %r14
	.word 0x856aa24c  ! 31: SDIVX_I	sdivx	%r10, 0x024c, %r2
	.word 0x89a2892b  ! 32: FMULs	fmuls	%f10, %f11, %f4
	.word 0xb27aab2c  ! 33: SDIV_I	sdiv 	%r10, 0x0b2c, %r25
	.word 0x93da800b  ! 34: FLUSH_R	dis not found

	.word 0x8143c000  ! 35: STBAR	stbar
	.word 0x93a288ab  ! 36: FSUBs	fsubs	%f10, %f11, %f9
	.word 0x8143e067  ! 37: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #MemIssue | #Sync 
	.word 0xc93aa790  ! 38: STDF_I	std	%f4, [0x0790, %r10]
	.word 0xf6aa900b  ! 39: STBA_R	stba	%r27, [%r10 + %r11] 0x80
	.word 0xd0a2900b  ! 40: STWA_R	stwa	%r8, [%r10 + %r11] 0x80
	.word 0x8b6aaaa4  ! 41: SDIVX_I	sdivx	%r10, 0x0aa4, %r5
	.word 0xcf3aace8  ! 42: STDF_I	std	%f7, [0x0ce8, %r10]
	.word 0xd07a800b  ! 43: SWAP_R	swap	%r8, [%r10 + %r11]
	.word 0xc212ab50  ! 44: LDUH_I	lduh	[%r10 + 0x0b50], %r1
	.word 0xcca2900b  ! 45: STWA_R	stwa	%r6, [%r10 + %r11] 0x80
	.word 0xc36aa3fc  ! 46: PREFETCH_I	prefetch	[%r10 + 0x03fc], #one_read
	.word 0xeff2a00b  ! 47: CASXA_R	casxa	[%r10]%asi, %r11, %r23
	.word 0xcde2900b  ! 48: CASA_I	casa	[%r10] 0x80, %r11, %r6
	.word 0xa5daa564  ! 49: FLUSH_I	dis not found

	.word 0xd0b2900b  ! 50: STHA_R	stha	%r8, [%r10 + %r11] 0x80
	.word 0xd0da900b  ! 51: LDXA_R	ldxa	[%r10, %r11] 0x80, %r8
	.word 0x887aaab8  ! 52: SDIV_I	sdiv 	%r10, 0x0ab8, %r4
	.word 0xd8f2900b  ! 53: STXA_R	stxa	%r12, [%r10 + %r11] 0x80
	.word 0xa9a2892b  ! 54: FMULs	fmuls	%f10, %f11, %f20
	.word 0xe6fa900b  ! 55: SWAPA_R	swapa	%r19, [%r10 + %r11] 0x80
	.word 0xe1f2a00b  ! 56: CASXA_R	casxa	[%r10]%asi, %r11, %r16
	.word 0xf892900b  ! 57: LDUHA_R	lduha	[%r10, %r11] 0x80, %r28
	.word 0xca4aad44  ! 58: LDSB_I	ldsb	[%r10 + 0x0d44], %r5
	.word 0xf2b2900b  ! 59: STHA_R	stha	%r25, [%r10 + %r11] 0x80
	.word 0xe722a708  ! 60: STF_I	st	%f19, [0x0708, %r10]
	.word 0xd09aac90  ! 61: LDDA_I	ldda	[%r10, + 0x0c90] %asi, %r8
	.word 0xeaeaa4fc  ! 62: LDSTUBA_I	ldstuba	%r21, [%r10 + 0x04fc] %asi
	.word 0x8143e066  ! 63: MEMBAR	membar	#StoreLoad | #LoadStore | #MemIssue | #Sync 
	.word 0xf242800b  ! 64: LDSW_R	ldsw	[%r10 + %r11], %r25
	.word 0x826a800b  ! 65: UDIVX_R	udivx 	%r10, %r11, %r1
	.word 0x847a800b  ! 66: SDIV_R	sdiv 	%r10, %r11, %r2
	.word 0xc36a800b  ! 67: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0xa9da800b  ! 68: FLUSH_R	dis not found

	.word 0x8143c000  ! 69: STBAR	stbar
	.word 0xe8fa900b  ! 70: SWAPA_R	swapa	%r20, [%r10 + %r11] 0x80
	.word 0x8bda800b  ! 71: FLUSH_R	dis not found

	.word 0xc4faa6b4  ! 72: SWAPA_I	swapa	%r2, [%r10 + 0x06b4] %asi
	.word 0x8dda800b  ! 73: FLUSH_R	dis not found

	.word 0xcec2a460  ! 74: LDSWA_I	ldswa	[%r10, + 0x0460] %asi, %r7
	.word 0xccc2900b  ! 75: LDSWA_R	ldswa	[%r10, %r11] 0x80, %r6
	.word 0x85daa424  ! 76: FLUSH_I	dis not found

	.word 0xccaa900b  ! 77: STBA_R	stba	%r6, [%r10 + %r11] 0x80
	.word 0x8143e079  ! 78: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xc3eaa884  ! 79: PREFETCHA_I	prefetcha	[%r10, + 0x0884] %asi, #one_read
	.word 0xf2da900b  ! 80: LDXA_R	ldxa	[%r10, %r11] 0x80, %r25
	.word 0x9272a828  ! 81: UDIV_I	udiv 	%r10, 0x0828, %r9
	.word 0xc6aaa9b0  ! 82: STBA_I	stba	%r3, [%r10 + 0x09b0] %asi
	.word 0x9e52a7b8  ! 83: UMUL_I	umul 	%r10, 0x07b8, %r15
	.word 0x8143c000  ! 84: STBAR	stbar
	.word 0x8143c000  ! 85: STBAR	stbar
	.word 0xc442800b  ! 86: LDSW_R	ldsw	[%r10 + %r11], %r2
	.word 0x9b22ae3c  ! 87: MULScc_I	mulscc 	%r10, 0x0e3c, %r13
	.word 0x8143c000  ! 88: STBAR	stbar
	.word 0xcd3aa8b0  ! 89: STDF_I	std	%f6, [0x08b0, %r10]
	.word 0x8143c000  ! 90: STBAR	stbar
	.word 0x8afa800b  ! 91: SDIVcc_R	sdivcc 	%r10, %r11, %r5
	.word 0x8452a360  ! 92: UMUL_I	umul 	%r10, 0x0360, %r2
	.word 0x8143c000  ! 93: STBAR	stbar
	.word 0xe452800b  ! 94: LDSH_R	ldsh	[%r10 + %r11], %r18
	.word 0xc6c2a990  ! 95: LDSWA_I	ldswa	[%r10, + 0x0990] %asi, %r3
	.word 0xc3eaab00  ! 96: PREFETCHA_I	prefetcha	[%r10, + 0x0b00] %asi, #one_read
	.word 0xf33aae38  ! 97: STDF_I	std	%f25, [0x0e38, %r10]
	.word 0x91daab1c  ! 98: FLUSH_I	dis not found

	.word 0x36800003  ! 99: BGE	bge,a	<label_0x3>
	.word 0xc2d2a4e8  ! 100: LDSHA_I	ldsha	[%r10, + 0x04e8] %asi, %r1
	.word 0xe8c2ae6c  ! 101: LDSWA_I	ldswa	[%r10, + 0x0e6c] %asi, %r20
	.word 0xa87aa0ac  ! 102: SDIV_I	sdiv 	%r10, 0x00ac, %r20
	.word 0x88f2800b  ! 103: UDIVcc_R	udivcc 	%r10, %r11, %r4
	.word 0xea7a800b  ! 104: SWAP_R	swap	%r21, [%r10 + %r11]
	.word 0x8bdaa1bc  ! 105: FLUSH_I	dis not found

	.word 0x91daab24  ! 106: FLUSH_I	dis not found

	.word 0x85a289ab  ! 107: FDIVs	fdivs	%f10, %f11, %f2
	.word 0xc36a800b  ! 108: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0xa9daaa0c  ! 109: FLUSH_I	dis not found

	.word 0xea42800b  ! 111: LDSW_R	ldsw	[%r10 + %r11], %r21
	.word 0xcb22a74c  ! 113: STF_I	st	%f5, [0x074c, %r10]
	.word 0xcc12800b  ! 114: LDUH_R	lduh	[%r10 + %r11], %r6
	.word 0xccea900b  ! 115: LDSTUBA_R	ldstuba	%r6, [%r10 + %r11] 0x80
	.word 0x1e800001  ! 116: BVC	bvc  	<label_0x1>
	.word 0x8143c000  ! 117: STBAR	stbar
	.word 0xca0a800b  ! 118: LDUB_R	ldub	[%r10 + %r11], %r5
	.word 0x0c800003  ! 120: BNEG	bneg  	<label_0x3>
	.word 0x93da800b  ! 121: FLUSH_R	dis not found

	.word 0xccfa900b  ! 122: SWAPA_R	swapa	%r6, [%r10 + %r11] 0x80
	.word 0xb1daa090  ! 123: FLUSH_I	dis not found

	.word 0xc3ea900b  ! 124: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0x865aa534  ! 125: SMUL_I	smul 	%r10, 0x0534, %r3
	.word 0xf2aa900b  ! 126: STBA_R	stba	%r25, [%r10 + %r11] 0x80
	.word 0xc682900b  ! 127: LDUWA_R	lduwa	[%r10, %r11] 0x80, %r3
	.word 0x82f2800b  ! 128: UDIVcc_R	udivcc 	%r10, %r11, %r1
	.word 0xa05aa3d0  ! 131: SMUL_I	smul 	%r10, 0x03d0, %r16
	.word 0x99daad38  ! 132: FLUSH_I	dis not found

	.word 0x8143c000  ! 133: STBAR	stbar
	.word 0xce8a900b  ! 134: LDUBA_R	lduba	[%r10, %r11] 0x80, %r7
	.word 0x8143c000  ! 135: STBAR	stbar
	.word 0x84d2800b  ! 136: UMULcc_R	umulcc 	%r10, %r11, %r2
	.word 0xccfaa868  ! 137: SWAPA_I	swapa	%r6, [%r10 + 0x0868] %asi
	.word 0x00800001  ! 138: BN	bn  	<label_0x1>
	.word 0x8143c000  ! 139: STBAR	stbar
	.word 0xd8aaa01c  ! 140: STBA_I	stba	%r12, [%r10 + 0x001c] %asi
	.word 0xd0ea900b  ! 141: LDSTUBA_R	ldstuba	%r8, [%r10 + %r11] 0x80
	.word 0xcaa2aed4  ! 142: STWA_I	stwa	%r5, [%r10 + 0x0ed4] %asi
	.word 0x8fdaadb8  ! 143: FLUSH_I	dis not found

	.word 0xdcaaa974  ! 144: STBA_I	stba	%r14, [%r10 + 0x0974] %asi
	.word 0xad22800b  ! 145: MULScc_R	mulscc 	%r10, %r11, %r22
	.word 0xa3da800b  ! 146: FLUSH_R	dis not found

	.word 0xec6a800b  ! 147: LDSTUB_R	ldstub	%r22, [%r10 + %r11]
	.word 0x3a800003  ! 148: BCC	bcc,a	<label_0x3>
	.word 0xf7e2900b  ! 149: CASA_I	casa	[%r10] 0x80, %r11, %r27
	.word 0xecc2acd0  ! 150: LDSWA_I	ldswa	[%r10, + 0x0cd0] %asi, %r22
	.word 0xbfa2892b  ! 151: FMULs	fmuls	%f10, %f11, %f31
	.word 0x8143e014  ! 152: MEMBAR	membar	#LoadStore | #Lookaside 
	.word 0xc3eaa80c  ! 153: PREFETCHA_I	prefetcha	[%r10, + 0x080c] %asi, #one_read
	.word 0xb86aae3c  ! 154: UDIVX_I	udivx 	%r10, 0x0e3c, %r28
	.word 0x83daa730  ! 155: FLUSH_I	dis not found

	.word 0x8c4a800b  ! 157: MULX_R	mulx 	%r10, %r11, %r6
	.word 0x8fdaa448  ! 158: FLUSH_I	dis not found

	.word 0x93da800b  ! 159: FLUSH_R	dis not found

	.word 0xd3e2a00b  ! 160: CASA_R	casa	[%r10] %asi, %r11, %r9
	.word 0xdc1aab18  ! 161: LDD_I	ldd	[%r10 + 0x0b18], %r14
	.word 0xb06aa328  ! 162: UDIVX_I	udivx 	%r10, 0x0328, %r24
	.word 0x32800003  ! 163: BNE	bne,a	<label_0x3>
	.word 0xc68a900b  ! 167: LDUBA_R	lduba	[%r10, %r11] 0x80, %r3
	.word 0x8af2800b  ! 168: UDIVcc_R	udivcc 	%r10, %r11, %r5
	.word 0xcc82a260  ! 169: LDUWA_I	lduwa	[%r10, + 0x0260] %asi, %r6
	.word 0xbcd2800b  ! 170: UMULcc_R	umulcc 	%r10, %r11, %r30
	.word 0xccca900b  ! 171: LDSBA_R	ldsba	[%r10, %r11] 0x80, %r6
	.word 0x8ad2a06c  ! 172: UMULcc_I	umulcc 	%r10, 0x006c, %r5
	.word 0x8143c000  ! 173: STBAR	stbar
	.word 0xd2b2900b  ! 174: STHA_R	stha	%r9, [%r10 + %r11] 0x80
	.word 0x904aaae0  ! 175: MULX_I	mulx 	%r10, 0x0ae0, %r8
	.word 0xf122a89c  ! 176: STF_I	st	%f24, [0x089c, %r10]
	.word 0x22800003  ! 177: BE	be,a	<label_0x3>
	.word 0xcadaadb8  ! 178: LDXA_I	ldxa	[%r10, + 0x0db8] %asi, %r5
	.word 0xc3eaac00  ! 179: PREFETCHA_I	prefetcha	[%r10, + 0x0c00] %asi, #one_read
	.word 0x8143e03d  ! 180: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0xb452a828  ! 181: UMUL_I	umul 	%r10, 0x0828, %r26
	.word 0xb6faa724  ! 182: SDIVcc_I	sdivcc 	%r10, 0x0724, %r27
	.word 0x8d6aabb8  ! 183: SDIVX_I	sdivx	%r10, 0x0bb8, %r6
	.word 0x8a5aa22c  ! 184: SMUL_I	smul 	%r10, 0x022c, %r5
	.word 0xde6a800b  ! 187: LDSTUB_R	ldstub	%r15, [%r10 + %r11]
	.word 0x85daad44  ! 188: FLUSH_I	dis not found

	.word 0xc81a800b  ! 189: LDD_R	ldd	[%r10 + %r11], %r4
	.word 0xc5f2a00b  ! 190: CASXA_R	casxa	[%r10]%asi, %r11, %r2
	.word 0xc87aac78  ! 191: SWAP_I	swap	%r4, [%r10 + 0x0c78]
	.word 0xe44a800b  ! 192: LDSB_R	ldsb	[%r10 + %r11], %r18
	.word 0xbbdaa118  ! 193: FLUSH_I	dis not found

	.word 0x0cca0001  ! 194: BRGZ	brgz  ,pt	%8,<label_0xa0001>
	.word 0x92f2800b  ! 195: UDIVcc_R	udivcc 	%r10, %r11, %r9
	.word 0x93a289ab  ! 196: FDIVs	fdivs	%f10, %f11, %f9
	.word 0xc842800b  ! 197: LDSW_R	ldsw	[%r10 + %r11], %r4
	.word 0x89da800b  ! 198: FLUSH_R	dis not found

	.word 0x1a800001  ! 199: BCC	bcc  	<label_0x1>
	.word 0xbc72800b  ! 200: UDIV_R	udiv 	%r10, %r11, %r30
	.word 0x0aca0003  ! 201: BRNZ	brnz  ,pt	%8,<label_0xa0003>
	.word 0xccc2ad40  ! 202: LDSWA_I	ldswa	[%r10, + 0x0d40] %asi, %r6
	.word 0xc8b2a2c0  ! 203: STHA_I	stha	%r4, [%r10 + 0x02c0] %asi
	.word 0xbc72a568  ! 204: UDIV_I	udiv 	%r10, 0x0568, %r30
	.word 0xead2a478  ! 205: LDSHA_I	ldsha	[%r10, + 0x0478] %asi, %r21
	.word 0xc8ea900b  ! 206: LDSTUBA_R	ldstuba	%r4, [%r10 + %r11] 0x80
	.word 0x86d2a714  ! 207: UMULcc_I	umulcc 	%r10, 0x0714, %r3
	.word 0x8143e047  ! 208: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Sync 
	.word 0xd0ca900b  ! 209: LDSBA_R	ldsba	[%r10, %r11] 0x80, %r8
	.word 0xccc2900b  ! 210: LDSWA_R	ldswa	[%r10, %r11] 0x80, %r6
	.word 0xc36aa8dc  ! 211: PREFETCH_I	prefetch	[%r10 + 0x08dc], #one_read
	.word 0x8c52800b  ! 212: UMUL_R	umul 	%r10, %r11, %r6
	.word 0x8fa289ab  ! 213: FDIVs	fdivs	%f10, %f11, %f7
	.word 0x84faa030  ! 214: SDIVcc_I	sdivcc 	%r10, 0x0030, %r2
	.word 0x8143e02d  ! 215: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #MemIssue 
	.word 0xd002800b  ! 216: LDUW_R	lduw	[%r10 + %r11], %r8
	.word 0xc4a2adc8  ! 217: STWA_I	stwa	%r2, [%r10 + 0x0dc8] %asi
	.word 0x83da800b  ! 218: FLUSH_R	dis not found

	.word 0x8bdaa8c8  ! 219: FLUSH_I	dis not found

	.word 0x0ac20003  ! 221: BRNZ	brnz  ,nt	%8,<label_0x20003>
	.word 0x8252a360  ! 222: UMUL_I	umul 	%r10, 0x0360, %r1
	.word 0x83a2882b  ! 223: FADDs	fadds	%f10, %f11, %f1
	.word 0xcafa900b  ! 224: SWAPA_R	swapa	%r5, [%r10 + %r11] 0x80
	.word 0x866a800b  ! 225: UDIVX_R	udivx 	%r10, %r11, %r3
	.word 0x8e4aa590  ! 226: MULX_I	mulx 	%r10, 0x0590, %r7
	.word 0xcb3a800b  ! 227: STDF_R	std	%f5, [%r11, %r10]
	.word 0x88d2ac90  ! 228: UMULcc_I	umulcc 	%r10, 0x0c90, %r4
	.word 0xd24aa820  ! 229: LDSB_I	ldsb	[%r10 + 0x0820], %r9
	.word 0xe212adc8  ! 230: LDUH_I	lduh	[%r10 + 0x0dc8], %r17
	.word 0xf27a800b  ! 231: SWAP_R	swap	%r25, [%r10 + %r11]
	.word 0xe4aaaa74  ! 232: STBA_I	stba	%r18, [%r10 + 0x0a74] %asi
	.word 0xe1e2a00b  ! 233: CASA_R	casa	[%r10] %asi, %r11, %r16
	.word 0x8143c000  ! 234: STBAR	stbar
	.word 0x22c20003  ! 235: BRZ	brz,a,nt	%8,<label_0x20003>
	.word 0xc36a800b  ! 236: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0xc8fa900b  ! 237: SWAPA_R	swapa	%r4, [%r10 + %r11] 0x80
	.word 0xc9e2a00b  ! 238: CASA_R	casa	[%r10] %asi, %r11, %r4
	.word 0xc4f2900b  ! 239: STXA_R	stxa	%r2, [%r10 + %r11] 0x80
	.word 0x2cc20001  ! 240: BRGZ	brgz,a,nt	%8,<label_0x20001>
	.word 0x8bdaab60  ! 242: FLUSH_I	dis not found

	.word 0x3a800001  ! 243: BCC	bcc,a	<label_0x1>
	.word 0x8143c000  ! 244: STBAR	stbar
	.word 0xafda800b  ! 245: FLUSH_R	dis not found

	.word 0xcb22800b  ! 246: STF_R	st	%f5, [%r11, %r10]
	.word 0x89da800b  ! 247: FLUSH_R	dis not found

	.word 0xcc42800b  ! 248: LDSW_R	ldsw	[%r10 + %r11], %r6
	.word 0x92f2800b  ! 249: UDIVcc_R	udivcc 	%r10, %r11, %r9
	.word 0xc81a800b  ! 250: LDD_R	ldd	[%r10 + %r11], %r4
	.word 0xc3ea900b  ! 251: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0xc6f2a070  ! 252: STXA_I	stxa	%r3, [%r10 + 0x0070] %asi
	.word 0x84d2a70c  ! 253: UMULcc_I	umulcc 	%r10, 0x070c, %r2
	.word 0x38800001  ! 254: BGU	bgu,a	<label_0x1>
	.word 0x9e52a9c8  ! 255: UMUL_I	umul 	%r10, 0x09c8, %r15
	.word 0x8472ab90  ! 256: UDIV_I	udiv 	%r10, 0x0b90, %r2
	.word 0x8ddaa1c8  ! 257: FLUSH_I	dis not found

	.word 0xc2a2900b  ! 258: STWA_R	stwa	%r1, [%r10 + %r11] 0x80
	.word 0x9fa288ab  ! 259: FSUBs	fsubs	%f10, %f11, %f15
	.word 0xba52aa38  ! 260: UMUL_I	umul 	%r10, 0x0a38, %r29
	.word 0x9a6aaca0  ! 261: UDIVX_I	udivx 	%r10, 0x0ca0, %r13
	.word 0xbbdaaa10  ! 262: FLUSH_I	dis not found

	.word 0x83da800b  ! 263: FLUSH_R	dis not found

	.word 0xcb3a800b  ! 264: STDF_R	std	%f5, [%r11, %r10]
	.word 0x1c800003  ! 265: BPOS	bpos  	<label_0x3>
	.word 0x8ddaa19c  ! 266: FLUSH_I	dis not found

	.word 0x87a289ab  ! 267: FDIVs	fdivs	%f10, %f11, %f3
	.word 0xd01a800b  ! 268: LDD_R	ldd	[%r10 + %r11], %r8
	.word 0x40000001  ! 269: CALL	call	disp30_1
	.word 0xd1e2a00b  ! 270: CASA_R	casa	[%r10] %asi, %r11, %r8
	.word 0xd80aa69c  ! 271: LDUB_I	ldub	[%r10 + 0x069c], %r12
	.word 0x8143c000  ! 272: STBAR	stbar
	.word 0xc89aa828  ! 273: LDDA_I	ldda	[%r10, + 0x0828] %asi, %r4
	.word 0x12800003  ! 274: BNE	bne  	<label_0x3>
	.word 0x8d6aa4d8  ! 275: SDIVX_I	sdivx	%r10, 0x04d8, %r6
	.word 0xf8aa900b  ! 276: STBA_R	stba	%r28, [%r10 + %r11] 0x80
	.word 0x9072800b  ! 277: UDIV_R	udiv 	%r10, %r11, %r8
	.word 0x8143c000  ! 278: STBAR	stbar
	.word 0x8ada800b  ! 279: SMULcc_R	smulcc 	%r10, %r11, %r5
	.word 0xe89a900b  ! 280: LDDA_R	ldda	[%r10, %r11] 0x80, %r20
	.word 0xe80a800b  ! 281: LDUB_R	ldub	[%r10 + %r11], %r20
	.word 0x8852a3a4  ! 282: UMUL_I	umul 	%r10, 0x03a4, %r4
	.word 0xaa5aa094  ! 283: SMUL_I	smul 	%r10, 0x0094, %r21
	.word 0xccf2900b  ! 284: STXA_R	stxa	%r6, [%r10 + %r11] 0x80
	.word 0xc8aaa688  ! 285: STBA_I	stba	%r4, [%r10 + 0x0688] %asi
	.word 0xb1da800b  ! 286: FLUSH_R	dis not found

	.word 0xceeaa910  ! 287: LDSTUBA_I	ldstuba	%r7, [%r10 + 0x0910] %asi
	.word 0x85da800b  ! 288: FLUSH_R	dis not found

	.word 0x00800001  ! 289: BN	bn  	<label_0x1>
	.word 0xc452800b  ! 290: LDSH_R	ldsh	[%r10 + %r11], %r2
	.word 0xb922800b  ! 291: MULScc_R	mulscc 	%r10, %r11, %r28
	.word 0x8143c000  ! 292: STBAR	stbar
	.word 0xf08aac40  ! 293: LDUBA_I	lduba	[%r10, + 0x0c40] %asi, %r24
	.word 0x9adaa850  ! 294: SMULcc_I	smulcc 	%r10, 0x0850, %r13
	.word 0xe13a800b  ! 295: STDF_R	std	%f16, [%r11, %r10]
	.word 0x9072800b  ! 296: UDIV_R	udiv 	%r10, %r11, %r8
	.word 0xdcfaa650  ! 297: SWAPA_I	swapa	%r14, [%r10 + 0x0650] %asi
	.word 0xc36a800b  ! 298: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0xc6b2900b  ! 299: STHA_R	stha	%r3, [%r10 + %r11] 0x80
	.word 0xd1f2a00b  ! 300: CASXA_R	casxa	[%r10]%asi, %r11, %r8
	.word 0x86d2800b  ! 301: UMULcc_R	umulcc 	%r10, %r11, %r3
	.word 0xc4ba900b  ! 302: STDA_R	stda	%r2, [%r10 + %r11] 0x80
	.word 0x8143c000  ! 303: STBAR	stbar
	.word 0x8cd2800b  ! 304: UMULcc_R	umulcc 	%r10, %r11, %r6
	.word 0xcecaa5ec  ! 305: LDSBA_I	ldsba	[%r10, + 0x05ec] %asi, %r7
	.word 0xccbaafe8  ! 306: STDA_I	stda	%r6, [%r10 + 0x0fe8] %asi
	.word 0xd3e2a00b  ! 307: CASA_R	casa	[%r10] %asi, %r11, %r9
	.word 0xcbf2a00b  ! 308: CASXA_R	casxa	[%r10]%asi, %r11, %r5
	.word 0xb2faa36c  ! 309: SDIVcc_I	sdivcc 	%r10, 0x036c, %r25
	.word 0xfca2900b  ! 310: STWA_R	stwa	%r30, [%r10 + %r11] 0x80
	.word 0x8143e036  ! 311: MEMBAR	membar	#StoreLoad | #LoadStore | #Lookaside | #MemIssue 
	.word 0xd0f2af30  ! 312: STXA_I	stxa	%r8, [%r10 + 0x0f30] %asi
	.word 0xcf22800b  ! 313: STF_R	st	%f7, [%r11, %r10]
	.word 0xcf3a800b  ! 314: STDF_R	std	%f7, [%r11, %r10]
	.word 0xd0aaa870  ! 315: STBA_I	stba	%r8, [%r10 + 0x0870] %asi
	.word 0xc2ea900b  ! 316: LDSTUBA_R	ldstuba	%r1, [%r10 + %r11] 0x80
	.word 0x18800001  ! 317: BGU	bgu  	<label_0x1>
	.word 0xf27aa538  ! 318: SWAP_I	swap	%r25, [%r10 + 0x0538]
	.word 0xb322800b  ! 319: MULScc_R	mulscc 	%r10, %r11, %r25
	.word 0xd2fa900b  ! 320: SWAPA_R	swapa	%r9, [%r10 + %r11] 0x80
	.word 0x2c800001  ! 321: BNEG	bneg,a	<label_0x1>
	.word 0xfd22800b  ! 322: STF_R	st	%f30, [%r11, %r10]
	.word 0xf9f2900b  ! 323: CASXA_I	casxa	[%r10] 0x80, %r11, %r28
	.word 0x2c800001  ! 324: BNEG	bneg,a	<label_0x1>
	.word 0xf652a898  ! 325: LDSH_I	ldsh	[%r10 + 0x0898], %r27
	.word 0xc3eaa778  ! 326: PREFETCHA_I	prefetcha	[%r10, + 0x0778] %asi, #one_read
	.word 0xc89aa570  ! 328: LDDA_I	ldda	[%r10, + 0x0570] %asi, %r4
	.word 0x82fa800b  ! 329: SDIVcc_R	sdivcc 	%r10, %r11, %r1
	.word 0x8143c000  ! 330: STBAR	stbar
	.word 0xec02a240  ! 331: LDUW_I	lduw	[%r10 + 0x0240], %r22
	.word 0x8da2892b  ! 332: FMULs	fmuls	%f10, %f11, %f6
	.word 0x8143c000  ! 334: STBAR	stbar
	.word 0xcc6aaa90  ! 335: LDSTUB_I	ldstub	%r6, [%r10 + 0x0a90]
	.word 0xbbdaa8d4  ! 336: FLUSH_I	dis not found

	.word 0x9fdaa65c  ! 337: FLUSH_I	dis not found

	.word 0x0c800001  ! 338: BNEG	bneg  	<label_0x1>
	.word 0x8fa288ab  ! 340: FSUBs	fsubs	%f10, %f11, %f7
	.word 0x9cf2a408  ! 341: UDIVcc_I	udivcc 	%r10, 0x0408, %r14
	.word 0x91da800b  ! 342: FLUSH_R	dis not found

	.word 0xc89a900b  ! 343: LDDA_R	ldda	[%r10, %r11] 0x80, %r4
	.word 0x98f2a2c0  ! 344: UDIVcc_I	udivcc 	%r10, 0x02c0, %r12
	.word 0xc64a800b  ! 345: LDSB_R	ldsb	[%r10 + %r11], %r3
	.word 0x8ef2a6b4  ! 346: UDIVcc_I	udivcc 	%r10, 0x06b4, %r7
	.word 0xa45aa210  ! 347: SMUL_I	smul 	%r10, 0x0210, %r18
	.word 0x887a800b  ! 348: SDIV_R	sdiv 	%r10, %r11, %r4
	.word 0xb872ac24  ! 349: UDIV_I	udiv 	%r10, 0x0c24, %r28
	.word 0x8143c000  ! 350: STBAR	stbar
	.word 0x40000001  ! 351: CALL	call	disp30_1
	.word 0xfa8aae00  ! 352: LDUBA_I	lduba	[%r10, + 0x0e00] %asi, %r29
	.word 0x8143e028  ! 353: MEMBAR	membar	#StoreStore | #MemIssue 
	.word 0xca82900b  ! 354: LDUWA_R	lduwa	[%r10, %r11] 0x80, %r5
	.word 0x88f2800b  ! 355: UDIVcc_R	udivcc 	%r10, %r11, %r4
	.word 0xb9a2882b  ! 356: FADDs	fadds	%f10, %f11, %f28
	.word 0x84d2800b  ! 357: UMULcc_R	umulcc 	%r10, %r11, %r2
	.word 0xeecaa190  ! 358: LDSBA_I	ldsba	[%r10, + 0x0190] %asi, %r23
	.word 0xc3ea900b  ! 359: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0xac7aa940  ! 360: SDIV_I	sdiv 	%r10, 0x0940, %r22
	.word 0x8bdaada4  ! 361: FLUSH_I	dis not found

	.word 0x8143c000  ! 363: STBAR	stbar
	.word 0x8143c000  ! 364: STBAR	stbar
	.word 0xccd2900b  ! 365: LDSHA_R	ldsha	[%r10, %r11] 0x80, %r6
	.word 0xc4ca900b  ! 366: LDSBA_R	ldsba	[%r10, %r11] 0x80, %r2
	.word 0xa852adc8  ! 368: UMUL_I	umul 	%r10, 0x0dc8, %r20
	.word 0x8143e033  ! 369: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside | #MemIssue 
	.word 0x9252acfc  ! 370: UMUL_I	umul 	%r10, 0x0cfc, %r9
	.word 0x8143e039  ! 371: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside | #MemIssue 
	.word 0xce42ad2c  ! 372: LDSW_I	ldsw	[%r10 + 0x0d2c], %r7
	.word 0x8dda800b  ! 373: FLUSH_R	dis not found

	.word 0x88faacec  ! 374: SDIVcc_I	sdivcc 	%r10, 0x0cec, %r4
	.word 0xf07aabc4  ! 375: SWAP_I	swap	%r24, [%r10 + 0x0bc4]
	.word 0xb5a288ab  ! 376: FSUBs	fsubs	%f10, %f11, %f26
	.word 0xc3ea900b  ! 377: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0x8c72800b  ! 378: UDIV_R	udiv 	%r10, %r11, %r6
	.word 0x8143e034  ! 379: MEMBAR	membar	#LoadStore | #Lookaside | #MemIssue 
	.word 0x864a800b  ! 380: MULX_R	mulx 	%r10, %r11, %r3
	.word 0x32800003  ! 381: BNE	bne,a	<label_0x3>
	.word 0x89daa118  ! 382: FLUSH_I	dis not found

	.word 0x8143c000  ! 383: STBAR	stbar
	.word 0xcca2a174  ! 384: STWA_I	stwa	%r6, [%r10 + 0x0174] %asi
	.word 0x8143c000  ! 385: STBAR	stbar
	.word 0xd0ca900b  ! 387: LDSBA_R	ldsba	[%r10, %r11] 0x80, %r8
	.word 0xa5da800b  ! 388: FLUSH_R	dis not found

	.word 0xc8ba900b  ! 389: STDA_R	stda	%r4, [%r10 + %r11] 0x80
	.word 0xd27aa134  ! 390: SWAP_I	swap	%r9, [%r10 + 0x0134]
	.word 0x8143e009  ! 391: MEMBAR	membar	#LoadLoad | #StoreStore 
	.word 0x8143e01a  ! 392: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside 
	.word 0x8143e046  ! 393: MEMBAR	membar	#StoreLoad | #LoadStore | #Sync 
	.word 0xc36aa860  ! 394: PREFETCH_I	prefetch	[%r10 + 0x0860], #one_read
	.word 0xce5aacd8  ! 395: LDX_I	ldx	[%r10 + 0x0cd8], %r7
	.word 0xeadaa988  ! 396: LDXA_I	ldxa	[%r10, + 0x0988] %asi, %r21
	.word 0xa7daafc8  ! 397: FLUSH_I	dis not found

	.word 0x8143c000  ! 398: STBAR	stbar
	.word 0xafda800b  ! 399: FLUSH_R	dis not found

	.word 0xc53aad70  ! 400: STDF_I	std	%f2, [0x0d70, %r10]
	.word 0xe05a800b  ! 401: LDX_R	ldx	[%r10 + %r11], %r16
	.word 0xa2f2a0e0  ! 402: UDIVcc_I	udivcc 	%r10, 0x00e0, %r17
	.word 0x9bda800b  ! 403: FLUSH_R	dis not found

	.word 0x9a52800b  ! 404: UMUL_R	umul 	%r10, %r11, %r13
	.word 0x3c800003  ! 405: BPOS	bpos,a	<label_0x3>
	.word 0xf93aa290  ! 406: STDF_I	std	%f28, [0x0290, %r10]
	.word 0xceb2aa44  ! 407: STHA_I	stha	%r7, [%r10 + 0x0a44] %asi
	.word 0xc4ca900b  ! 408: LDSBA_R	ldsba	[%r10, %r11] 0x80, %r2
	.word 0xe812800b  ! 409: LDUH_R	lduh	[%r10 + %r11], %r20
	.word 0xec4a800b  ! 410: LDSB_R	ldsb	[%r10 + %r11], %r22
	.word 0x06800001  ! 411: BL	bl  	<label_0x1>
	.word 0xcaa2aebc  ! 412: STWA_I	stwa	%r5, [%r10 + 0x0ebc] %asi
	.word 0x845a800b  ! 413: SMUL_R	smul 	%r10, %r11, %r2
	.word 0x1a800003  ! 414: BCC	bcc  	<label_0x3>
	.word 0x32800001  ! 415: BNE	bne,a	<label_0x1>
	.word 0x92da800b  ! 416: SMULcc_R	smulcc 	%r10, %r11, %r9
	.word 0xc36a800b  ! 417: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0xea4aa680  ! 418: LDSB_I	ldsb	[%r10 + 0x0680], %r21
	.word 0xfeaa900b  ! 419: STBA_R	stba	%r31, [%r10 + %r11] 0x80
	.word 0x8143c000  ! 420: STBAR	stbar
	.word 0xf8aaac78  ! 422: STBA_I	stba	%r28, [%r10 + 0x0c78] %asi
	.word 0xf6eaa594  ! 423: LDSTUBA_I	ldstuba	%r27, [%r10 + 0x0594] %asi
	.word 0x8cfa800b  ! 425: SDIVcc_R	sdivcc 	%r10, %r11, %r6
	.word 0x8143e022  ! 426: MEMBAR	membar	#StoreLoad | #MemIssue 
	.word 0xbc52800b  ! 427: UMUL_R	umul 	%r10, %r11, %r30
	.word 0x20800003  ! 428: BN	bn,a	<label_0x3>
	.word 0x867aa360  ! 429: SDIV_I	sdiv 	%r10, 0x0360, %r3
	.word 0x2cca0001  ! 430: BRGZ	brgz,a,pt	%8,<label_0xa0001>
	.word 0xccf2900b  ! 431: STXA_R	stxa	%r6, [%r10 + %r11] 0x80
	.word 0x8143c000  ! 432: STBAR	stbar
	.word 0xd0a2ab9c  ! 433: STWA_I	stwa	%r8, [%r10 + 0x0b9c] %asi
	.word 0xeaeaad30  ! 434: LDSTUBA_I	ldstuba	%r21, [%r10 + 0x0d30] %asi
	.word 0x8e6a800b  ! 435: UDIVX_R	udivx 	%r10, %r11, %r7
	.word 0x82f2800b  ! 436: UDIVcc_R	udivcc 	%r10, %r11, %r1
	.word 0x22ca0003  ! 437: BRZ	brz,a,pt	%8,<label_0xa0003>
	.word 0xc3eaa460  ! 438: PREFETCHA_I	prefetcha	[%r10, + 0x0460] %asi, #one_read
	.word 0xcc82a5c0  ! 439: LDUWA_I	lduwa	[%r10, + 0x05c0] %asi, %r6
	.word 0x8143e01f  ! 440: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #Lookaside 
	.word 0xe00aa240  ! 441: LDUB_I	ldub	[%r10 + 0x0240], %r16
	.word 0xc452ac48  ! 442: LDSH_I	ldsh	[%r10 + 0x0c48], %r2
	.word 0xa5a2892b  ! 443: FMULs	fmuls	%f10, %f11, %f18
	.word 0x916aa6e0  ! 444: SDIVX_I	sdivx	%r10, 0x06e0, %r8
	.word 0xcf22800b  ! 445: STF_R	st	%f7, [%r11, %r10]
	.word 0xd2a2aff0  ! 446: STWA_I	stwa	%r9, [%r10 + 0x0ff0] %asi
	.word 0x8c52800b  ! 447: UMUL_R	umul 	%r10, %r11, %r6
	.word 0x90f2ad88  ! 448: UDIVcc_I	udivcc 	%r10, 0x0d88, %r8
	.word 0xcd22800b  ! 450: STF_R	st	%f6, [%r11, %r10]
	.word 0x04800001  ! 451: BLE	ble  	<label_0x1>
	.word 0xd2a2900b  ! 452: STWA_R	stwa	%r9, [%r10 + %r11] 0x80
	.word 0xf87aa97c  ! 453: SWAP_I	swap	%r28, [%r10 + 0x097c]
	.word 0xcc7aa128  ! 454: SWAP_I	swap	%r6, [%r10 + 0x0128]
	.word 0x8143e00d  ! 455: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore 
	.word 0x3a800001  ! 456: BCC	bcc,a	<label_0x1>
	.word 0xdc0a800b  ! 457: LDUB_R	ldub	[%r10 + %r11], %r14
	.word 0x8fda800b  ! 458: FLUSH_R	dis not found

	.word 0x1a800003  ! 459: BCC	bcc  	<label_0x3>
	.word 0xc4aaa8a0  ! 460: STBA_I	stba	%r2, [%r10 + 0x08a0] %asi
	.word 0x8d22a9b8  ! 461: MULScc_I	mulscc 	%r10, 0x09b8, %r6
	.word 0x8143c000  ! 462: STBAR	stbar
	.word 0xc3ea900b  ! 463: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0xc20aae20  ! 464: LDUB_I	ldub	[%r10 + 0x0e20], %r1
	.word 0x84d2800b  ! 465: UMULcc_R	umulcc 	%r10, %r11, %r2
	.word 0x83da800b  ! 466: FLUSH_R	dis not found

	.word 0x8afaaff4  ! 467: SDIVcc_I	sdivcc 	%r10, 0x0ff4, %r5
	.word 0xfc7a800b  ! 468: SWAP_R	swap	%r30, [%r10 + %r11]
	.word 0x8143c000  ! 469: STBAR	stbar
	.word 0xd082900b  ! 470: LDUWA_R	lduwa	[%r10, %r11] 0x80, %r8
	.word 0x8143c000  ! 471: STBAR	stbar
	.word 0xf882900b  ! 472: LDUWA_R	lduwa	[%r10, %r11] 0x80, %r28
	.word 0xd1e2900b  ! 473: CASA_I	casa	[%r10] 0x80, %r11, %r8
	.word 0xe13aa360  ! 474: STDF_I	std	%f16, [0x0360, %r10]
	.word 0x0ac20001  ! 475: BRNZ	brnz  ,nt	%8,<label_0x20001>
	.word 0xd0aa900b  ! 476: STBA_R	stba	%r8, [%r10 + %r11] 0x80
	.word 0x8fdaaddc  ! 477: FLUSH_I	dis not found

	.word 0x8a72800b  ! 478: UDIV_R	udiv 	%r10, %r11, %r5
	.word 0x8fdaa64c  ! 479: FLUSH_I	dis not found

	.word 0x8143e013  ! 480: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside 
	.word 0xd0f2900b  ! 481: STXA_R	stxa	%r8, [%r10 + %r11] 0x80
	.word 0xc36aa97c  ! 482: PREFETCH_I	prefetch	[%r10 + 0x097c], #one_read
	.word 0x8143e028  ! 483: MEMBAR	membar	#StoreStore | #MemIssue 
	.word 0xfaf2a910  ! 484: STXA_I	stxa	%r29, [%r10 + 0x0910] %asi
	.word 0x9af2abe0  ! 485: UDIVcc_I	udivcc 	%r10, 0x0be0, %r13
	.word 0xcfe2900b  ! 486: CASA_I	casa	[%r10] 0x80, %r11, %r7
	.word 0xb0fa800b  ! 487: SDIVcc_R	sdivcc 	%r10, %r11, %r24
	.word 0x06c20003  ! 488: BRLZ	brlz  ,nt	%8,<label_0x20003>
	.word 0xc41aa680  ! 489: LDD_I	ldd	[%r10 + 0x0680], %r2
	.word 0x06c20003  ! 490: BRLZ	brlz  ,nt	%8,<label_0x20003>
	.word 0x876a800b  ! 491: SDIVX_R	sdivx	%r10, %r11, %r3
	.word 0xda6a800b  ! 492: LDSTUB_R	ldstub	%r13, [%r10 + %r11]
	.word 0xe2a2a798  ! 493: STWA_I	stwa	%r17, [%r10 + 0x0798] %asi
	.word 0x8cf2a640  ! 494: UDIVcc_I	udivcc 	%r10, 0x0640, %r6
	.word 0xe4ba900b  ! 495: STDA_R	stda	%r18, [%r10 + %r11] 0x80
	.word 0x8143e022  ! 496: MEMBAR	membar	#StoreLoad | #MemIssue 
	.word 0x8fa289ab  ! 497: FDIVs	fdivs	%f10, %f11, %f7
	.word 0x2eca0001  ! 498: BRGEZ	brgez,a,pt	%8,<label_0xa0001>
	.word 0x10800003  ! 499: BA	ba  	<label_0x3>
	.word 0xcccaa454  ! 500: LDSBA_I	ldsba	[%r10, + 0x0454] %asi, %r6
	.word 0xc4d2900b  ! 501: LDSHA_R	ldsha	[%r10, %r11] 0x80, %r2
	.word 0x8fdaaa84  ! 502: FLUSH_I	dis not found

	.word 0x92fa800b  ! 503: SDIVcc_R	sdivcc 	%r10, %r11, %r9
	.word 0xa1da800b  ! 504: FLUSH_R	dis not found

	.word 0xcf22800b  ! 505: STF_R	st	%f7, [%r11, %r10]
	.word 0xce8aa6ac  ! 506: LDUBA_I	lduba	[%r10, + 0x06ac] %asi, %r7
	.word 0xea52800b  ! 507: LDSH_R	ldsh	[%r10 + %r11], %r21
	.word 0xc452800b  ! 508: LDSH_R	ldsh	[%r10 + %r11], %r2
	.word 0xc67a800b  ! 509: SWAP_R	swap	%r3, [%r10 + %r11]
	.word 0xc652a418  ! 510: LDSH_I	ldsh	[%r10 + 0x0418], %r3
	.word 0xc8aaa420  ! 511: STBA_I	stba	%r4, [%r10 + 0x0420] %asi
	.word 0x90f2800b  ! 512: UDIVcc_R	udivcc 	%r10, %r11, %r8
	.word 0x8143c000  ! 513: STBAR	stbar
	.word 0xbbdaa52c  ! 514: FLUSH_I	dis not found

	.word 0xc3ea900b  ! 515: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0xf442800b  ! 516: LDSW_R	ldsw	[%r10 + %r11], %r26
	.word 0x8ed2abdc  ! 517: UMULcc_I	umulcc 	%r10, 0x0bdc, %r7
	.word 0xe48a900b  ! 518: LDUBA_R	lduba	[%r10, %r11] 0x80, %r18
	.word 0xa1da800b  ! 519: FLUSH_R	dis not found

	.word 0xe8b2ac1c  ! 520: STHA_I	stha	%r20, [%r10 + 0x0c1c] %asi
	.word 0xa47a800b  ! 521: SDIV_R	sdiv 	%r10, %r11, %r18
	.word 0xcb3aa1e8  ! 522: STDF_I	std	%f5, [0x01e8, %r10]
	.word 0xc6ca900b  ! 524: LDSBA_R	ldsba	[%r10, %r11] 0x80, %r3
	.word 0xcc92900b  ! 525: LDUHA_R	lduha	[%r10, %r11] 0x80, %r6
	.word 0xcf22a634  ! 526: STF_I	st	%f7, [0x0634, %r10]
	.word 0x8a72ae30  ! 527: UDIV_I	udiv 	%r10, 0x0e30, %r5
	.word 0x9bdaa9a4  ! 528: FLUSH_I	dis not found

	.word 0xccaaad60  ! 529: STBA_I	stba	%r6, [%r10 + 0x0d60] %asi
	.word 0xa6faa520  ! 530: SDIVcc_I	sdivcc 	%r10, 0x0520, %r19
	.word 0xdf3a800b  ! 531: STDF_R	std	%f15, [%r11, %r10]
	.word 0x99da800b  ! 532: FLUSH_R	dis not found

	.word 0xc602a910  ! 533: LDUW_I	lduw	[%r10 + 0x0910], %r3
	.word 0xca02a0e0  ! 534: LDUW_I	lduw	[%r10 + 0x00e0], %r5
	.word 0x8143e052  ! 535: MEMBAR	membar	#StoreLoad | #Lookaside | #Sync 
	.word 0x82d2a828  ! 536: UMULcc_I	umulcc 	%r10, 0x0828, %r1
	.word 0x83da800b  ! 537: FLUSH_R	dis not found

	.word 0xc36a800b  ! 538: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x8c72a73c  ! 539: UDIV_I	udiv 	%r10, 0x073c, %r6
	.word 0xcc8a900b  ! 540: LDUBA_R	lduba	[%r10, %r11] 0x80, %r6
	.word 0x8143c000  ! 541: STBAR	stbar
	.word 0xbbdaaaf8  ! 542: FLUSH_I	dis not found

	.word 0x8143c000  ! 543: STBAR	stbar
	.word 0xaba289ab  ! 544: FDIVs	fdivs	%f10, %f11, %f21
	.word 0xf2f2a2e0  ! 545: STXA_I	stxa	%r25, [%r10 + 0x02e0] %asi
	.word 0x86daaaec  ! 546: SMULcc_I	smulcc 	%r10, 0x0aec, %r3
	.word 0xd202800b  ! 547: LDUW_R	lduw	[%r10 + %r11], %r9
	.word 0xa6faaeb4  ! 548: SDIVcc_I	sdivcc 	%r10, 0x0eb4, %r19
	.word 0xe64a800b  ! 549: LDSB_R	ldsb	[%r10 + %r11], %r19
	.word 0xec9a900b  ! 550: LDDA_R	ldda	[%r10, %r11] 0x80, %r22
	.word 0xf64aafa0  ! 551: LDSB_I	ldsb	[%r10 + 0x0fa0], %r27
	.word 0xcab2aff0  ! 552: STHA_I	stha	%r5, [%r10 + 0x0ff0] %asi
	.word 0xc3eaab58  ! 553: PREFETCHA_I	prefetcha	[%r10, + 0x0b58] %asi, #one_read
	.word 0xa9a289ab  ! 554: FDIVs	fdivs	%f10, %f11, %f20
	.word 0xc86aa418  ! 555: LDSTUB_I	ldstub	%r4, [%r10 + 0x0418]
	.word 0xdcb2900b  ! 556: STHA_R	stha	%r14, [%r10 + %r11] 0x80
	.word 0x9da289ab  ! 557: FDIVs	fdivs	%f10, %f11, %f14
	.word 0x9122800b  ! 559: MULScc_R	mulscc 	%r10, %r11, %r8
	.word 0x8143c000  ! 560: STBAR	stbar
	.word 0xf28aa47c  ! 561: LDUBA_I	lduba	[%r10, + 0x047c] %asi, %r25
	.word 0xf0ba900b  ! 562: STDA_R	stda	%r24, [%r10 + %r11] 0x80
	.word 0x86d2ae18  ! 563: UMULcc_I	umulcc 	%r10, 0x0e18, %r3
	.word 0x9cf2a15c  ! 565: UDIVcc_I	udivcc 	%r10, 0x015c, %r14
	.word 0x9afa800b  ! 566: SDIVcc_R	sdivcc 	%r10, %r11, %r13
	.word 0x986aab78  ! 567: UDIVX_I	udivx 	%r10, 0x0b78, %r12
	.word 0xb6faa1b8  ! 568: SDIVcc_I	sdivcc 	%r10, 0x01b8, %r27
	.word 0xc3eaa5a4  ! 569: PREFETCHA_I	prefetcha	[%r10, + 0x05a4] %asi, #one_read
	.word 0x8143e058  ! 570: MEMBAR	membar	#StoreStore | #Lookaside | #Sync 
	.word 0x824aa650  ! 571: MULX_I	mulx 	%r10, 0x0650, %r1
	.word 0xc41aa970  ! 572: LDD_I	ldd	[%r10 + 0x0970], %r2
	.word 0x22800001  ! 573: BE	be,a	<label_0x1>
	.word 0x2ec20003  ! 574: BRGEZ	brgez,a,nt	%8,<label_0x20003>
	.word 0x28800001  ! 576: BLEU	bleu,a	<label_0x1>
	.word 0x8ddaa84c  ! 577: FLUSH_I	dis not found

	.word 0x8a4aaf54  ! 578: MULX_I	mulx 	%r10, 0x0f54, %r5
	.word 0x85da800b  ! 579: FLUSH_R	dis not found

	.word 0x08800001  ! 580: BLEU	bleu  	<label_0x1>
	.word 0xf0b2a008  ! 581: STHA_I	stha	%r24, [%r10 + 0x0008] %asi
	.word 0xc3eaa250  ! 582: PREFETCHA_I	prefetcha	[%r10, + 0x0250] %asi, #one_read
	.word 0x16800001  ! 583: BGE	bge  	<label_0x1>
	.word 0xac5a800b  ! 584: SMUL_R	smul 	%r10, %r11, %r22
	.word 0xe06aada0  ! 586: LDSTUB_I	ldstub	%r16, [%r10 + 0x0da0]
	.word 0x2cca0001  ! 587: BRGZ	brgz,a,pt	%8,<label_0xa0001>
	.word 0xc68aa338  ! 588: LDUBA_I	lduba	[%r10, + 0x0338] %asi, %r3
	.word 0xceb2a5c0  ! 589: STHA_I	stha	%r7, [%r10 + 0x05c0] %asi
	.word 0x36800001  ! 590: BGE	bge,a	<label_0x1>
	.word 0xc412800b  ! 591: LDUH_R	lduh	[%r10 + %r11], %r2
	.word 0x10800001  ! 592: BA	ba  	<label_0x1>
	.word 0x89a288ab  ! 593: FSUBs	fsubs	%f10, %f11, %f4
	.word 0x9bdaa228  ! 594: FLUSH_I	dis not found

	.word 0xe9e2a00b  ! 595: CASA_R	casa	[%r10] %asi, %r11, %r20
	.word 0xc93aa300  ! 596: STDF_I	std	%f4, [0x0300, %r10]
	.word 0xc2aa900b  ! 597: STBA_R	stba	%r1, [%r10 + %r11] 0x80
	.word 0x87daa8fc  ! 598: FLUSH_I	dis not found

	.word 0xd2fa900b  ! 599: SWAPA_R	swapa	%r9, [%r10 + %r11] 0x80
	.word 0x8143c000  ! 600: STBAR	stbar
	.word 0xcd22a7c0  ! 601: STF_I	st	%f6, [0x07c0, %r10]
	.word 0x38800001  ! 602: BGU	bgu,a	<label_0x1>
	.word 0xdc52af24  ! 603: LDSH_I	ldsh	[%r10 + 0x0f24], %r14
	.word 0xc36a800b  ! 604: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x22ca0001  ! 605: BRZ	brz,a,pt	%8,<label_0xa0001>
	.word 0x89da800b  ! 606: FLUSH_R	dis not found

	.word 0x8fdaa864  ! 607: FLUSH_I	dis not found

	.word 0xc81aa628  ! 608: LDD_I	ldd	[%r10 + 0x0628], %r4
	.word 0xceaa900b  ! 609: STBA_R	stba	%r7, [%r10 + %r11] 0x80
	.word 0xec6aa2c4  ! 610: LDSTUB_I	ldstub	%r22, [%r10 + 0x02c4]
	.word 0x10800001  ! 611: BA	ba  	<label_0x1>
	.word 0xe2faad30  ! 613: SWAPA_I	swapa	%r17, [%r10 + 0x0d30] %asi
	.word 0x92da800b  ! 614: SMULcc_R	smulcc 	%r10, %r11, %r9
	.word 0xd08a900b  ! 615: LDUBA_R	lduba	[%r10, %r11] 0x80, %r8
	.word 0x8b6a800b  ! 616: SDIVX_R	sdivx	%r10, %r11, %r5
	.word 0xaddaa434  ! 617: FLUSH_I	dis not found

	.word 0xec9aadd0  ! 618: LDDA_I	ldda	[%r10, + 0x0dd0] %asi, %r22
	.word 0x87daa728  ! 619: FLUSH_I	dis not found

	.word 0xe2a2a820  ! 620: STWA_I	stwa	%r17, [%r10 + 0x0820] %asi
	.word 0xced2900b  ! 621: LDSHA_R	ldsha	[%r10, %r11] 0x80, %r7
	.word 0xc09aa220  ! 622: LDDA_I	ldda	[%r10, + 0x0220] %asi, %r0
	.word 0x8eda800b  ! 623: SMULcc_R	smulcc 	%r10, %r11, %r7
	.word 0xc85a800b  ! 624: LDX_R	ldx	[%r10 + %r11], %r4
	.word 0xc36a800b  ! 625: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0xcaf2900b  ! 626: STXA_R	stxa	%r5, [%r10 + %r11] 0x80
	.word 0xc67a800b  ! 627: SWAP_R	swap	%r3, [%r10 + %r11]
	.word 0x9c6aa54c  ! 628: UDIVX_I	udivx 	%r10, 0x054c, %r14
	.word 0xe9e2a00b  ! 629: CASA_R	casa	[%r10] %asi, %r11, %r20
	.word 0x8143e026  ! 630: MEMBAR	membar	#StoreLoad | #LoadStore | #MemIssue 
	.word 0x1a800001  ! 631: BCC	bcc  	<label_0x1>
	.word 0x83da800b  ! 632: FLUSH_R	dis not found

	.word 0xc922a4f8  ! 633: STF_I	st	%f4, [0x04f8, %r10]
	.word 0xfb22800b  ! 634: STF_R	st	%f29, [%r11, %r10]
	.word 0xcc12800b  ! 635: LDUH_R	lduh	[%r10 + %r11], %r6
	.word 0xe0d2afc4  ! 636: LDSHA_I	ldsha	[%r10, + 0x0fc4] %asi, %r16
	.word 0x8143c000  ! 637: STBAR	stbar
	.word 0xc64aac68  ! 638: LDSB_I	ldsb	[%r10 + 0x0c68], %r3
	.word 0x83daaba8  ! 639: FLUSH_I	dis not found

	.word 0xd89a900b  ! 640: LDDA_R	ldda	[%r10, %r11] 0x80, %r12
	.word 0xb0fa800b  ! 641: SDIVcc_R	sdivcc 	%r10, %r11, %r24
	.word 0xafda800b  ! 642: FLUSH_R	dis not found

	.word 0x2cc20001  ! 643: BRGZ	brgz,a,nt	%8,<label_0x20001>
	.word 0xc68aadd0  ! 644: LDUBA_I	lduba	[%r10, + 0x0dd0] %asi, %r3
	.word 0x3e800001  ! 645: BVC	bvc,a	<label_0x1>
	.word 0x8143e06d  ! 646: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #MemIssue | #Sync 
	.word 0x8143c000  ! 647: STBAR	stbar
	.word 0x8fa2892b  ! 648: FMULs	fmuls	%f10, %f11, %f7
	.word 0xc3eaa078  ! 649: PREFETCHA_I	prefetcha	[%r10, + 0x0078] %asi, #one_read
	.word 0x9ba2882b  ! 650: FADDs	fadds	%f10, %f11, %f13
	.word 0xdcd2900b  ! 651: LDSHA_R	ldsha	[%r10, %r11] 0x80, %r14
	.word 0x8a72800b  ! 652: UDIV_R	udiv 	%r10, %r11, %r5
	.word 0xafa2892b  ! 654: FMULs	fmuls	%f10, %f11, %f23
	.word 0x8472800b  ! 655: UDIV_R	udiv 	%r10, %r11, %r2
	.word 0x92f2a4ec  ! 656: UDIVcc_I	udivcc 	%r10, 0x04ec, %r9
	.word 0x85a288ab  ! 657: FSUBs	fsubs	%f10, %f11, %f2
	.word 0xfad2ac84  ! 659: LDSHA_I	ldsha	[%r10, + 0x0c84] %asi, %r29
	.word 0xc8b2a0cc  ! 660: STHA_I	stha	%r4, [%r10 + 0x00cc] %asi
	.word 0xa4faaff8  ! 661: SDIVcc_I	sdivcc 	%r10, 0x0ff8, %r18
	.word 0xcbe2a00b  ! 662: CASA_R	casa	[%r10] %asi, %r11, %r5
	.word 0xde02800b  ! 663: LDUW_R	lduw	[%r10 + %r11], %r15
	.word 0x90faaf60  ! 664: SDIVcc_I	sdivcc 	%r10, 0x0f60, %r8
	.word 0x02ca0001  ! 665: BRZ	brz  ,pt	%8,<label_0xa0001>
	.word 0xaba2882b  ! 666: FADDs	fadds	%f10, %f11, %f21
	.word 0xa07aa510  ! 667: SDIV_I	sdiv 	%r10, 0x0510, %r16
	.word 0x8d22ae00  ! 668: MULScc_I	mulscc 	%r10, 0x0e00, %r6
	.word 0xc73aa6a8  ! 669: STDF_I	std	%f3, [0x06a8, %r10]
	.word 0x00800001  ! 670: BN	bn  	<label_0x1>
	.word 0x9252800b  ! 671: UMUL_R	umul 	%r10, %r11, %r9
	.word 0x847aa060  ! 672: SDIV_I	sdiv 	%r10, 0x0060, %r2
	.word 0x83a288ab  ! 673: FSUBs	fsubs	%f10, %f11, %f1
	.word 0xd3f2900b  ! 674: CASXA_I	casxa	[%r10] 0x80, %r11, %r9
	.word 0x936a800b  ! 675: SDIVX_R	sdivx	%r10, %r11, %r9
	.word 0xd01a800b  ! 676: LDD_R	ldd	[%r10 + %r11], %r8
	.word 0xc602a5e4  ! 677: LDUW_I	lduw	[%r10 + 0x05e4], %r3
	.word 0x91daabcc  ! 678: FLUSH_I	dis not found

	.word 0xc3eaaac8  ! 679: PREFETCHA_I	prefetcha	[%r10, + 0x0ac8] %asi, #one_read
	.word 0x8dda800b  ! 680: FLUSH_R	dis not found

	.word 0xc80aa3f0  ! 681: LDUB_I	ldub	[%r10 + 0x03f0], %r4
	.word 0xfeb2ad8c  ! 682: STHA_I	stha	%r31, [%r10 + 0x0d8c] %asi
	.word 0xcaaa900b  ! 683: STBA_R	stba	%r5, [%r10 + %r11] 0x80
	.word 0xca42ae3c  ! 684: LDSW_I	ldsw	[%r10 + 0x0e3c], %r5
	.word 0xf5e2a00b  ! 685: CASA_R	casa	[%r10] %asi, %r11, %r26
	.word 0x0e800003  ! 686: BVS	bvs  	<label_0x3>
	.word 0xc33a800b  ! 687: STDF_R	std	%f1, [%r11, %r10]
	.word 0x2aca0003  ! 688: BRNZ	brnz,a,pt	%8,<label_0xa0003>
	.word 0xb672a900  ! 689: UDIV_I	udiv 	%r10, 0x0900, %r27
	.word 0xf522800b  ! 690: STF_R	st	%f26, [%r11, %r10]
	.word 0xdaf2aca0  ! 691: STXA_I	stxa	%r13, [%r10 + 0x0ca0] %asi
	.word 0xe292900b  ! 692: LDUHA_R	lduha	[%r10, %r11] 0x80, %r17
	.word 0x8143c000  ! 693: STBAR	stbar
	.word 0x9a4a800b  ! 694: MULX_R	mulx 	%r10, %r11, %r13
	.word 0xc36aad70  ! 695: PREFETCH_I	prefetch	[%r10 + 0x0d70], #one_read
	.word 0xd84a800b  ! 696: LDSB_R	ldsb	[%r10 + %r11], %r12
	.word 0xdc82900b  ! 697: LDUWA_R	lduwa	[%r10, %r11] 0x80, %r14
	.word 0xb072800b  ! 698: UDIV_R	udiv 	%r10, %r11, %r24
	.word 0x8fda800b  ! 699: FLUSH_R	dis not found

	.word 0x8143c000  ! 700: STBAR	stbar
	.word 0xd2caa5fc  ! 701: LDSBA_I	ldsba	[%r10, + 0x05fc] %asi, %r9
	.word 0xcde2900b  ! 702: CASA_I	casa	[%r10] 0x80, %r11, %r6
	.word 0x02c20003  ! 703: BRZ	brz  ,nt	%8,<label_0x20003>
	.word 0x8143c000  ! 704: STBAR	stbar
	.word 0x8852aa10  ! 705: UMUL_I	umul 	%r10, 0x0a10, %r4
	.word 0xccda900b  ! 706: LDXA_R	ldxa	[%r10, %r11] 0x80, %r6
	.word 0xdbe2900b  ! 707: CASA_I	casa	[%r10] 0x80, %r11, %r13
	.word 0xf2d2900b  ! 708: LDSHA_R	ldsha	[%r10, %r11] 0x80, %r25
	.word 0xbd22800b  ! 709: MULScc_R	mulscc 	%r10, %r11, %r30
	.word 0x91da800b  ! 710: FLUSH_R	dis not found

	.word 0xd922800b  ! 711: STF_R	st	%f12, [%r11, %r10]
	.word 0x8143c000  ! 712: STBAR	stbar
	.word 0xf5e2900b  ! 713: CASA_I	casa	[%r10] 0x80, %r11, %r26
	.word 0x8143e002  ! 714: MEMBAR	membar	#StoreLoad 
	.word 0x8c4a800b  ! 715: MULX_R	mulx 	%r10, %r11, %r6
	.word 0x0e800001  ! 716: BVS	bvs  	<label_0x1>
	.word 0xc2fa900b  ! 717: SWAPA_R	swapa	%r1, [%r10 + %r11] 0x80
	.word 0xd84a800b  ! 718: LDSB_R	ldsb	[%r10 + %r11], %r12
	.word 0x8a7aa4b0  ! 719: SDIV_I	sdiv 	%r10, 0x04b0, %r5
	.word 0x87a2892b  ! 720: FMULs	fmuls	%f10, %f11, %f3
	.word 0xed3a800b  ! 721: STDF_R	std	%f22, [%r11, %r10]
	.word 0x06800003  ! 722: BL	bl  	<label_0x3>
	.word 0xfadaacc8  ! 723: LDXA_I	ldxa	[%r10, + 0x0cc8] %asi, %r29
	.word 0xc36a800b  ! 724: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x8ef2a300  ! 725: UDIVcc_I	udivcc 	%r10, 0x0300, %r7
	.word 0xc692900b  ! 726: LDUHA_R	lduha	[%r10, %r11] 0x80, %r3
	.word 0x84f2800b  ! 727: UDIVcc_R	udivcc 	%r10, %r11, %r2
	.word 0xd01a800b  ! 728: LDD_R	ldd	[%r10 + %r11], %r8
	.word 0xeef2aff8  ! 729: STXA_I	stxa	%r23, [%r10 + 0x0ff8] %asi
	.word 0x2a800003  ! 730: BCS	bcs,a	<label_0x3>
	.word 0xd122800b  ! 731: STF_R	st	%f8, [%r11, %r10]
	.word 0xc6c2900b  ! 732: LDSWA_R	ldswa	[%r10, %r11] 0x80, %r3
	.word 0x8bda800b  ! 733: FLUSH_R	dis not found

	.word 0x8143c000  ! 734: STBAR	stbar
	.word 0x89daac04  ! 735: FLUSH_I	dis not found

	.word 0xc36aad64  ! 736: PREFETCH_I	prefetch	[%r10 + 0x0d64], #one_read
	.word 0xd0ca900b  ! 737: LDSBA_R	ldsba	[%r10, %r11] 0x80, %r8
	.word 0x0ac20003  ! 738: BRNZ	brnz  ,nt	%8,<label_0x20003>
	.word 0x8143c000  ! 739: STBAR	stbar
	.word 0x93da800b  ! 740: FLUSH_R	dis not found

	.word 0xb9a288ab  ! 741: FSUBs	fsubs	%f10, %f11, %f28
	.word 0xcc6a800b  ! 742: LDSTUB_R	ldstub	%r6, [%r10 + %r11]
	.word 0x06c20001  ! 743: BRLZ	brlz  ,nt	%8,<label_0x20001>
	.word 0x9072ae64  ! 744: UDIV_I	udiv 	%r10, 0x0e64, %r8
	.word 0xc8a2ac28  ! 745: STWA_I	stwa	%r4, [%r10 + 0x0c28] %asi
	.word 0x8652ab70  ! 746: UMUL_I	umul 	%r10, 0x0b70, %r3
	.word 0x83daa000  ! 747: FLUSH_I	dis not found

	.word 0xf6faa57c  ! 748: SWAPA_I	swapa	%r27, [%r10 + 0x057c] %asi
	.word 0x83a289ab  ! 749: FDIVs	fdivs	%f10, %f11, %f1
	.word 0xc4eaa514  ! 750: LDSTUBA_I	ldstuba	%r2, [%r10 + 0x0514] %asi
	.word 0xc4ea900b  ! 751: LDSTUBA_R	ldstuba	%r2, [%r10 + %r11] 0x80
	.word 0x87daaa70  ! 752: FLUSH_I	dis not found

	.word 0xd002800b  ! 753: LDUW_R	lduw	[%r10 + %r11], %r8
	.word 0x8143c000  ! 754: STBAR	stbar
	.word 0x8143e068  ! 755: MEMBAR	membar	#StoreStore | #MemIssue | #Sync 
	.word 0xd88a900b  ! 756: LDUBA_R	lduba	[%r10, %r11] 0x80, %r12
	.word 0x06800001  ! 757: BL	bl  	<label_0x1>
	.word 0x8672acdc  ! 758: UDIV_I	udiv 	%r10, 0x0cdc, %r3
	.word 0xcafaaca0  ! 759: SWAPA_I	swapa	%r5, [%r10 + 0x0ca0] %asi
	.word 0xee12800b  ! 760: LDUH_R	lduh	[%r10 + %r11], %r23
	.word 0xc36a800b  ! 761: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0xc5e2900b  ! 762: CASA_I	casa	[%r10] 0x80, %r11, %r2
	.word 0x924aa9cc  ! 763: MULX_I	mulx 	%r10, 0x09cc, %r9
	.word 0x8afaa6ec  ! 764: SDIVcc_I	sdivcc 	%r10, 0x06ec, %r5
	.word 0x84f2800b  ! 765: UDIVcc_R	udivcc 	%r10, %r11, %r2
	.word 0xecd2a624  ! 766: LDSHA_I	ldsha	[%r10, + 0x0624] %asi, %r22
	.word 0x8143c000  ! 767: STBAR	stbar
	.word 0xceaa900b  ! 768: STBA_R	stba	%r7, [%r10 + %r11] 0x80
	.word 0xdab2900b  ! 769: STHA_R	stha	%r13, [%r10 + %r11] 0x80
	.word 0xf80aa408  ! 770: LDUB_I	ldub	[%r10 + 0x0408], %r28
	.word 0xe0aaa6a0  ! 771: STBA_I	stba	%r16, [%r10 + 0x06a0] %asi
	.word 0xc73a800b  ! 772: STDF_R	std	%f3, [%r11, %r10]
	.word 0xca42800b  ! 773: LDSW_R	ldsw	[%r10 + %r11], %r5
	.word 0x9d6aad4c  ! 774: SDIVX_I	sdivx	%r10, 0x0d4c, %r14
	.word 0xf122800b  ! 775: STF_R	st	%f24, [%r11, %r10]
	.word 0xc722800b  ! 776: STF_R	st	%f3, [%r11, %r10]
	.word 0x12800003  ! 777: BNE	bne  	<label_0x3>
	.word 0x884a800b  ! 778: MULX_R	mulx 	%r10, %r11, %r4
	.word 0x9dda800b  ! 779: FLUSH_R	dis not found

	.word 0x26c20001  ! 780: BRLZ	brlz,a,nt	%8,<label_0x20001>
	.word 0xc3ea900b  ! 781: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0xb67a800b  ! 782: SDIV_R	sdiv 	%r10, %r11, %r27
	.word 0xb3a289ab  ! 783: FDIVs	fdivs	%f10, %f11, %f25
	.word 0xc86a800b  ! 784: LDSTUB_R	ldstub	%r4, [%r10 + %r11]
	.word 0xe09a900b  ! 786: LDDA_R	ldda	[%r10, %r11] 0x80, %r16
	.word 0xbe5aa470  ! 787: SMUL_I	smul 	%r10, 0x0470, %r31
	.word 0x10800001  ! 788: BA	ba  	<label_0x1>
	.word 0x91a2892b  ! 789: FMULs	fmuls	%f10, %f11, %f8
	.word 0x8252ae8c  ! 790: UMUL_I	umul 	%r10, 0x0e8c, %r1
	.word 0x04800003  ! 791: BLE	ble  	<label_0x3>
	.word 0x0ec20001  ! 792: BRGEZ	brgez  ,nt	%8,<label_0x20001>
	.word 0xd06aa6d4  ! 793: LDSTUB_I	ldstub	%r8, [%r10 + 0x06d4]
	.word 0x864a800b  ! 794: MULX_R	mulx 	%r10, %r11, %r3
	.word 0xbe72a140  ! 795: UDIV_I	udiv 	%r10, 0x0140, %r31
	.word 0xdedaad80  ! 796: LDXA_I	ldxa	[%r10, + 0x0d80] %asi, %r15
	.word 0xce4a800b  ! 797: LDSB_R	ldsb	[%r10 + %r11], %r7
	.word 0xcaaaa338  ! 798: STBA_I	stba	%r5, [%r10 + 0x0338] %asi
	.word 0xd0b2ae28  ! 799: STHA_I	stha	%r8, [%r10 + 0x0e28] %asi
	.word 0x85daaf88  ! 800: FLUSH_I	dis not found

	.word 0xd2f2900b  ! 801: STXA_R	stxa	%r9, [%r10 + %r11] 0x80
	.word 0xd13aa5a8  ! 802: STDF_I	std	%f8, [0x05a8, %r10]
	.word 0xe01aa370  ! 803: LDD_I	ldd	[%r10 + 0x0370], %r16
	.word 0xaa52a13c  ! 804: UMUL_I	umul 	%r10, 0x013c, %r21
	.word 0x1c800003  ! 805: BPOS	bpos  	<label_0x3>
	.word 0x34800001  ! 806: BG	bg,a	<label_0x1>
	.word 0xa84aa38c  ! 807: MULX_I	mulx 	%r10, 0x038c, %r20
	.word 0xf81a800b  ! 808: LDD_R	ldd	[%r10 + %r11], %r28
	.word 0xcf3aab78  ! 809: STDF_I	std	%f7, [0x0b78, %r10]
	.word 0xf28a900b  ! 810: LDUBA_R	lduba	[%r10, %r11] 0x80, %r25
	.word 0x98f2acc8  ! 811: UDIVcc_I	udivcc 	%r10, 0x0cc8, %r12
	.word 0xd06aa394  ! 812: LDSTUB_I	ldstub	%r8, [%r10 + 0x0394]
	.word 0xbddaa31c  ! 813: FLUSH_I	dis not found

	.word 0xabdaa7dc  ! 814: FLUSH_I	dis not found

	.word 0xc3eaa5b0  ! 815: PREFETCHA_I	prefetcha	[%r10, + 0x05b0] %asi, #one_read
	.word 0x987a800b  ! 816: SDIV_R	sdiv 	%r10, %r11, %r12
	.word 0x2aca0001  ! 817: BRNZ	brnz,a,pt	%8,<label_0xa0001>
	.word 0x8da2882b  ! 818: FADDs	fadds	%f10, %f11, %f6
	.word 0x907aad0c  ! 819: SDIV_I	sdiv 	%r10, 0x0d0c, %r8
	.word 0xd89aad18  ! 820: LDDA_I	ldda	[%r10, + 0x0d18] %asi, %r12
	.word 0xe2faa4d8  ! 821: SWAPA_I	swapa	%r17, [%r10 + 0x04d8] %asi
	.word 0xd292900b  ! 822: LDUHA_R	lduha	[%r10, %r11] 0x80, %r9
	.word 0xa1a289ab  ! 823: FDIVs	fdivs	%f10, %f11, %f16
	.word 0x8afa800b  ! 825: SDIVcc_R	sdivcc 	%r10, %r11, %r5
	.word 0x93da800b  ! 826: FLUSH_R	dis not found

	.word 0xdc7a800b  ! 827: SWAP_R	swap	%r14, [%r10 + %r11]
	.word 0xd08aab5c  ! 828: LDUBA_I	lduba	[%r10, + 0x0b5c] %asi, %r8
	.word 0x8a6aa5e4  ! 829: UDIVX_I	udivx 	%r10, 0x05e4, %r5
	.word 0xad6aa554  ! 830: SDIVX_I	sdivx	%r10, 0x0554, %r22
	.word 0xca6aa9f8  ! 831: LDSTUB_I	ldstub	%r5, [%r10 + 0x09f8]
	.word 0xc6daab80  ! 832: LDXA_I	ldxa	[%r10, + 0x0b80] %asi, %r3
	.word 0x89daae54  ! 833: FLUSH_I	dis not found

	.word 0xb672a890  ! 834: UDIV_I	udiv 	%r10, 0x0890, %r27
	.word 0xce8a900b  ! 835: LDUBA_R	lduba	[%r10, %r11] 0x80, %r7
	.word 0xa45aa93c  ! 836: SMUL_I	smul 	%r10, 0x093c, %r18
	.word 0xafda800b  ! 837: FLUSH_R	dis not found

	.word 0x30800003  ! 838: BA	ba,a	<label_0x3>
	.word 0xda7a800b  ! 839: SWAP_R	swap	%r13, [%r10 + %r11]
	.word 0x8c7a800b  ! 840: SDIV_R	sdiv 	%r10, %r11, %r6
	.word 0x3a800001  ! 841: BCC	bcc,a	<label_0x1>
	.word 0xd0ea900b  ! 842: LDSTUBA_R	ldstuba	%r8, [%r10 + %r11] 0x80
	.word 0xe522a800  ! 843: STF_I	st	%f18, [0x0800, %r10]
	.word 0x0cca0003  ! 844: BRGZ	brgz  ,pt	%8,<label_0xa0003>
	.word 0xfed2a13c  ! 845: LDSHA_I	ldsha	[%r10, + 0x013c] %asi, %r31
	.word 0xcff2a00b  ! 846: CASXA_R	casxa	[%r10]%asi, %r11, %r7
	.word 0x8fdaa5d0  ! 847: FLUSH_I	dis not found

	.word 0x8ef2ab2c  ! 848: UDIVcc_I	udivcc 	%r10, 0x0b2c, %r7
	.word 0xc36aaf44  ! 849: PREFETCH_I	prefetch	[%r10 + 0x0f44], #one_read
	.word 0x8143c000  ! 850: STBAR	stbar
	.word 0xc28aadfc  ! 851: LDUBA_I	lduba	[%r10, + 0x0dfc] %asi, %r1
	.word 0x8143c000  ! 852: STBAR	stbar
	.word 0xc6c2a924  ! 853: LDSWA_I	ldswa	[%r10, + 0x0924] %asi, %r3
	.word 0xd0ba900b  ! 854: STDA_R	stda	%r8, [%r10 + %r11] 0x80
	.word 0x8143e058  ! 855: MEMBAR	membar	#StoreStore | #Lookaside | #Sync 
	.word 0xeaea900b  ! 856: LDSTUBA_R	ldstuba	%r21, [%r10 + %r11] 0x80
	.word 0x8a4aafb0  ! 857: MULX_I	mulx 	%r10, 0x0fb0, %r5
	.word 0xa5a289ab  ! 858: FDIVs	fdivs	%f10, %f11, %f18
	.word 0xc68aa458  ! 859: LDUBA_I	lduba	[%r10, + 0x0458] %asi, %r3
	.word 0x8e5a800b  ! 861: SMUL_R	smul 	%r10, %r11, %r7
	.word 0x04c20001  ! 862: BRLEZ	brlez  ,nt	%8,<label_0x20001>
	.word 0xc6d2900b  ! 863: LDSHA_R	ldsha	[%r10, %r11] 0x80, %r3
	.word 0xcada900b  ! 864: LDXA_R	ldxa	[%r10, %r11] 0x80, %r5
	.word 0x89a289ab  ! 865: FDIVs	fdivs	%f10, %f11, %f4
	.word 0xd0b2a608  ! 866: STHA_I	stha	%r8, [%r10 + 0x0608] %asi
	.word 0x0c800001  ! 867: BNEG	bneg  	<label_0x1>
	.word 0x8cdaa010  ! 868: SMULcc_I	smulcc 	%r10, 0x0010, %r6
	.word 0xd00aaf2c  ! 869: LDUB_I	ldub	[%r10 + 0x0f2c], %r8
	.word 0x8143c000  ! 870: STBAR	stbar
	.word 0xcea2a430  ! 871: STWA_I	stwa	%r7, [%r10 + 0x0430] %asi
	.word 0xbfdaad9c  ! 872: FLUSH_I	dis not found

	.word 0x87da800b  ! 873: FLUSH_R	dis not found

	.word 0x876aab30  ! 874: SDIVX_I	sdivx	%r10, 0x0b30, %r3
	.word 0xc6eaa3c0  ! 875: LDSTUBA_I	ldstuba	%r3, [%r10 + 0x03c0] %asi
	.word 0xce8aa094  ! 876: LDUBA_I	lduba	[%r10, + 0x0094] %asi, %r7
	.word 0x886a800b  ! 877: UDIVX_R	udivx 	%r10, %r11, %r4
	.word 0xc4fa900b  ! 878: SWAPA_R	swapa	%r2, [%r10 + %r11] 0x80
	.word 0xac52800b  ! 879: UMUL_R	umul 	%r10, %r11, %r22
	.word 0xe01aae50  ! 880: LDD_I	ldd	[%r10 + 0x0e50], %r16
	.word 0x8143e078  ! 881: MEMBAR	membar	#StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0x88f2800b  ! 882: UDIVcc_R	udivcc 	%r10, %r11, %r4
	.word 0xe93a800b  ! 883: STDF_R	std	%f20, [%r11, %r10]
	.word 0xd922ac98  ! 884: STF_I	st	%f12, [0x0c98, %r10]
	.word 0x8143e043  ! 885: MEMBAR	membar	#LoadLoad | #StoreLoad | #Sync 
	.word 0xdcba900b  ! 886: STDA_R	stda	%r14, [%r10 + %r11] 0x80
	.word 0xccf2900b  ! 887: STXA_R	stxa	%r6, [%r10 + %r11] 0x80
	.word 0xf722800b  ! 888: STF_R	st	%f27, [%r11, %r10]
	.word 0xd13a800b  ! 889: STDF_R	std	%f8, [%r11, %r10]
	.word 0x1e800003  ! 890: BVC	bvc  	<label_0x3>
	.word 0xb64a800b  ! 891: MULX_R	mulx 	%r10, %r11, %r27
	.word 0xcc82a6d4  ! 892: LDUWA_I	lduwa	[%r10, + 0x06d4] %asi, %r6
	.word 0xc3eaac08  ! 893: PREFETCHA_I	prefetcha	[%r10, + 0x0c08] %asi, #one_read
	.word 0xbfdaaf70  ! 894: FLUSH_I	dis not found

	.word 0x04ca0001  ! 895: BRLEZ	brlez  ,pt	%8,<label_0xa0001>
	.word 0xcc12800b  ! 896: LDUH_R	lduh	[%r10 + %r11], %r6
	.word 0x8472800b  ! 897: UDIV_R	udiv 	%r10, %r11, %r2
	.word 0x8852800b  ! 898: UMUL_R	umul 	%r10, %r11, %r4
	.word 0xf26a800b  ! 899: LDSTUB_R	ldstub	%r25, [%r10 + %r11]
	.word 0x8143c000  ! 901: STBAR	stbar
	.word 0x87a288ab  ! 902: FSUBs	fsubs	%f10, %f11, %f3
	.word 0x91a2892b  ! 903: FMULs	fmuls	%f10, %f11, %f8
	.word 0xe9f2900b  ! 904: CASXA_I	casxa	[%r10] 0x80, %r11, %r20
	.word 0xfa02a238  ! 905: LDUW_I	lduw	[%r10 + 0x0238], %r29
	.word 0x8afa800b  ! 906: SDIVcc_R	sdivcc 	%r10, %r11, %r5
	.word 0xbedaabcc  ! 907: SMULcc_I	smulcc 	%r10, 0x0bcc, %r31
	.word 0x1a800003  ! 908: BCC	bcc  	<label_0x3>
	.word 0xdf22a9e4  ! 909: STF_I	st	%f15, [0x09e4, %r10]
	.word 0x87da800b  ! 910: FLUSH_R	dis not found

	.word 0x93da800b  ! 911: FLUSH_R	dis not found

	.word 0x8143e00a  ! 912: MEMBAR	membar	#StoreLoad | #StoreStore 
	.word 0x89da800b  ! 913: FLUSH_R	dis not found

	.word 0xf722800b  ! 914: STF_R	st	%f27, [%r11, %r10]
	.word 0x8143e051  ! 915: MEMBAR	membar	#LoadLoad | #Lookaside | #Sync 
	.word 0x8143e028  ! 916: MEMBAR	membar	#StoreStore | #MemIssue 
	.word 0xc3eaad54  ! 917: PREFETCHA_I	prefetcha	[%r10, + 0x0d54] %asi, #one_read
	.word 0xd0a2900b  ! 918: STWA_R	stwa	%r8, [%r10 + %r11] 0x80
	.word 0x92f2a378  ! 919: UDIVcc_I	udivcc 	%r10, 0x0378, %r9
	.word 0xd0ba900b  ! 920: STDA_R	stda	%r8, [%r10 + %r11] 0x80
	.word 0x8ed2800b  ! 921: UMULcc_R	umulcc 	%r10, %r11, %r7
	.word 0x83da800b  ! 922: FLUSH_R	dis not found

	.word 0xe2b2900b  ! 923: STHA_R	stha	%r17, [%r10 + %r11] 0x80
	.word 0xb7da800b  ! 924: FLUSH_R	dis not found

	.word 0xc26aa4e8  ! 925: LDSTUB_I	ldstub	%r1, [%r10 + 0x04e8]
	.word 0xc26a800b  ! 926: LDSTUB_R	ldstub	%r1, [%r10 + %r11]
	.word 0xd0ba900b  ! 927: STDA_R	stda	%r8, [%r10 + %r11] 0x80
	.word 0xa25aa5f8  ! 928: SMUL_I	smul 	%r10, 0x05f8, %r17
	.word 0xbe6a800b  ! 929: UDIVX_R	udivx 	%r10, %r11, %r31
	.word 0xc2c2900b  ! 930: LDSWA_R	ldswa	[%r10, %r11] 0x80, %r1
	.word 0xc36aa718  ! 931: PREFETCH_I	prefetch	[%r10 + 0x0718], #one_read
	.word 0xccfaae68  ! 932: SWAPA_I	swapa	%r6, [%r10 + 0x0e68] %asi
	.word 0xc27aad68  ! 933: SWAP_I	swap	%r1, [%r10 + 0x0d68]
	.word 0xc53aaec0  ! 934: STDF_I	std	%f2, [0x0ec0, %r10]
	.word 0xca52a94c  ! 935: LDSH_I	ldsh	[%r10 + 0x094c], %r5
	.word 0xc4f2a3e8  ! 938: STXA_I	stxa	%r2, [%r10 + 0x03e8] %asi
	.word 0x8143c000  ! 939: STBAR	stbar
	.word 0x8e7aa920  ! 940: SDIV_I	sdiv 	%r10, 0x0920, %r7
	.word 0x04800003  ! 941: BLE	ble  	<label_0x3>
	.word 0xc612a0b0  ! 942: LDUH_I	lduh	[%r10 + 0x00b0], %r3
	.word 0xccd2900b  ! 943: LDSHA_R	ldsha	[%r10, %r11] 0x80, %r6
	.word 0x87a2892b  ! 944: FMULs	fmuls	%f10, %f11, %f3
	.word 0x826a800b  ! 945: UDIVX_R	udivx 	%r10, %r11, %r1
	.word 0xd2fa900b  ! 946: SWAPA_R	swapa	%r9, [%r10 + %r11] 0x80
	.word 0xa2fa800b  ! 947: SDIVcc_R	sdivcc 	%r10, %r11, %r17
	.word 0x83daa7cc  ! 948: FLUSH_I	dis not found

	.word 0x8c4aaec0  ! 949: MULX_I	mulx 	%r10, 0x0ec0, %r6
	.word 0x825aa248  ! 950: SMUL_I	smul 	%r10, 0x0248, %r1
	.word 0x8143c000  ! 951: STBAR	stbar
	.word 0x8ba288ab  ! 952: FSUBs	fsubs	%f10, %f11, %f5
	.word 0xc3e2900b  ! 953: CASA_I	casa	[%r10] 0x80, %r11, %r1
	.word 0x9a6aa4fc  ! 954: UDIVX_I	udivx 	%r10, 0x04fc, %r13
	.word 0x8143c000  ! 955: STBAR	stbar
	.word 0xd042a1fc  ! 956: LDSW_I	ldsw	[%r10 + 0x01fc], %r8
	.word 0xd06a800b  ! 957: LDSTUB_R	ldstub	%r8, [%r10 + %r11]
	.word 0x91daac90  ! 958: FLUSH_I	dis not found

	.word 0x89daa738  ! 959: FLUSH_I	dis not found

	.word 0x8143c000  ! 960: STBAR	stbar
	.word 0x87daa5f8  ! 961: FLUSH_I	dis not found

	.word 0x8b22a9a4  ! 962: MULScc_I	mulscc 	%r10, 0x09a4, %r5
	.word 0xc36a800b  ! 963: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x85a288ab  ! 964: FSUBs	fsubs	%f10, %f11, %f2
	.word 0xf4c2900b  ! 965: LDSWA_R	ldswa	[%r10, %r11] 0x80, %r26
	.word 0xd86a800b  ! 966: LDSTUB_R	ldstub	%r12, [%r10 + %r11]
	.word 0xdff2900b  ! 967: CASXA_I	casxa	[%r10] 0x80, %r11, %r15
	.word 0x1a800003  ! 968: BCC	bcc  	<label_0x3>
	.word 0xf0a2900b  ! 969: STWA_R	stwa	%r24, [%r10 + %r11] 0x80
	.word 0xfa82a34c  ! 970: LDUWA_I	lduwa	[%r10, + 0x034c] %asi, %r29
	.word 0x92fa800b  ! 971: SDIVcc_R	sdivcc 	%r10, %r11, %r9
	.word 0x26800001  ! 973: BL	bl,a	<label_0x1>
	.word 0x3c800003  ! 974: BPOS	bpos,a	<label_0x3>
	.word 0xcd3aa450  ! 975: STDF_I	std	%f6, [0x0450, %r10]
	.word 0x8143c000  ! 976: STBAR	stbar
	.word 0xc6daa8c8  ! 977: LDXA_I	ldxa	[%r10, + 0x08c8] %asi, %r3
	.word 0x8fda800b  ! 978: FLUSH_R	dis not found

	.word 0x8143e016  ! 979: MEMBAR	membar	#StoreLoad | #LoadStore | #Lookaside 
	.word 0xca42a1c8  ! 980: LDSW_I	ldsw	[%r10 + 0x01c8], %r5
	.word 0xa64a800b  ! 981: MULX_R	mulx 	%r10, %r11, %r19
	.word 0x9e52a5dc  ! 982: UMUL_I	umul 	%r10, 0x05dc, %r15
	.word 0xce12aaa4  ! 983: LDUH_I	lduh	[%r10 + 0x0aa4], %r7
	.word 0xc6fa900b  ! 984: SWAPA_R	swapa	%r3, [%r10 + %r11] 0x80
	.word 0x24ca0001  ! 985: BRLEZ	brlez,a,pt	%8,<label_0xa0001>
	.word 0x8ed2a374  ! 986: UMULcc_I	umulcc 	%r10, 0x0374, %r7
	.word 0x85a2892b  ! 987: FMULs	fmuls	%f10, %f11, %f2
	.word 0xc49a900b  ! 988: LDDA_R	ldda	[%r10, %r11] 0x80, %r2
	.word 0x8472a904  ! 989: UDIV_I	udiv 	%r10, 0x0904, %r2
	.word 0x845a800b  ! 990: SMUL_R	smul 	%r10, %r11, %r2
	.word 0x8cda800b  ! 991: SMULcc_R	smulcc 	%r10, %r11, %r6
	.word 0x99da800b  ! 992: FLUSH_R	dis not found

	.word 0xada2882b  ! 993: FADDs	fadds	%f10, %f11, %f22
	.word 0xc3eaa638  ! 994: PREFETCHA_I	prefetcha	[%r10, + 0x0638] %asi, #one_read
	.word 0xf492900b  ! 995: LDUHA_R	lduha	[%r10, %r11] 0x80, %r26
	.word 0x87a288ab  ! 996: FSUBs	fsubs	%f10, %f11, %f3
	.word 0x18800003  ! 998: BGU	bgu  	<label_0x3>
	.word 0xec8aa07c  ! 999: LDUBA_I	lduba	[%r10, + 0x007c] %asi, %r22
	nop
	nop
	nop
        ta      T_GOOD_TRAP
th_main_1:
        setx  MAIN_BASE_DATA_VA, %r1, %r10
        setx  0x0000000000000350, %g1, %r11
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
        setx  0x542b2bd2d87489e1, %g1, %r0
        setx  0x7b8e60d1785bc2e7, %g1, %r1
        setx  0xa1b287d6dfd57730, %g1, %r2
        setx  0xfd691a8c554e3d11, %g1, %r3
        setx  0x752da8edbcdd62e6, %g1, %r4
        setx  0x8321744ffd8f98ce, %g1, %r5
        setx  0xa2b70fdf9f46b135, %g1, %r6
        setx  0x1b8da7865c0722fb, %g1, %r7
        setx  0xaa6093848ad4b5dd, %g1, %r8
        setx  0xc4a24eeca2ebbb2f, %g1, %r9
        setx  0x63e538d2248f6336, %g1, %r12
        setx  0xd3c84d230255e7a5, %g1, %r13
        setx  0xeedf34b7bdb0c5c5, %g1, %r14
        setx  0xb626040eb904037d, %g1, %r15
        setx  0xa9cd4192de69cfff, %g1, %r16
        setx  0xb13d02b2b66d9240, %g1, %r17
        setx  0x1cad8aae58578de1, %g1, %r18
        setx  0x5ba3fe2ef17dfaf5, %g1, %r19
        setx  0xdc11c31e6e5adc1f, %g1, %r20
        setx  0x01766ada68d258f5, %g1, %r21
        setx  0xf535c46a922344ce, %g1, %r22
        setx  0xe342a26b0c525050, %g1, %r23
        setx  0x10f67ea596806b7d, %g1, %r24
        setx  0xb3b30743eaf540f3, %g1, %r25
        setx  0x68b7a3eeb21edc10, %g1, %r26
        setx  0x58e47e946aa1a723, %g1, %r27
        setx  0x598feda0d21fc30a, %g1, %r28
        setx  0x2aaa538b9dfba7a5, %g1, %r29
        setx  0xdf3052992767cc42, %g1, %r30
        setx  0xc59acb4cc52014bd, %g1, %r31
	.word 0xcaf2a078  ! 5: STXA_I	stxa	%r5, [%r10 + 0x0078] %asi
	.word 0xccb2ad88  ! 6: STHA_I	stha	%r6, [%r10 + 0x0d88] %asi
	.word 0xc612800b  ! 8: LDUH_R	lduh	[%r10 + %r11], %r3
	.word 0xc0ba900b  ! 9: STDA_R	stda	%r0, [%r10 + %r11] 0x80
	.word 0x8143e017  ! 10: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside 
	.word 0xf0da900b  ! 11: LDXA_R	ldxa	[%r10, %r11] 0x80, %r24
	.word 0x91da800b  ! 12: FLUSH_R	dis not found

	.word 0xc49a900b  ! 13: LDDA_R	ldda	[%r10, %r11] 0x80, %r2
	.word 0xd01aa420  ! 14: LDD_I	ldd	[%r10 + 0x0420], %r8
	.word 0xa6faad28  ! 15: SDIVcc_I	sdivcc 	%r10, 0x0d28, %r19
	.word 0x06800003  ! 16: BL	bl  	<label_0x3>
	.word 0x8143e07b  ! 17: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xcc0aa8f0  ! 18: LDUB_I	ldub	[%r10 + 0x08f0], %r6
	.word 0xc81aa6f8  ! 19: LDD_I	ldd	[%r10 + 0x06f8], %r4
	.word 0xd80a800b  ! 20: LDUB_R	ldub	[%r10 + %r11], %r12
	.word 0xccfaad40  ! 21: SWAPA_I	swapa	%r6, [%r10 + 0x0d40] %asi
	.word 0x8cdaa5ec  ! 22: SMULcc_I	smulcc 	%r10, 0x05ec, %r6
	.word 0xcc1a800b  ! 23: LDD_R	ldd	[%r10 + %r11], %r6
	.word 0xfa0aafb8  ! 24: LDUB_I	ldub	[%r10 + 0x0fb8], %r29
	.word 0x84f2800b  ! 25: UDIVcc_R	udivcc 	%r10, %r11, %r2
	.word 0xb6f2800b  ! 26: UDIVcc_R	udivcc 	%r10, %r11, %r27
	.word 0xcdf2a00b  ! 27: CASXA_R	casxa	[%r10]%asi, %r11, %r6
	.word 0x8143e04b  ! 28: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Sync 
	.word 0x906aace8  ! 29: UDIVX_I	udivx 	%r10, 0x0ce8, %r8
	.word 0xa672800b  ! 30: UDIV_R	udiv 	%r10, %r11, %r19
	.word 0x8f6aa358  ! 31: SDIVX_I	sdivx	%r10, 0x0358, %r7
	.word 0x93a2892b  ! 32: FMULs	fmuls	%f10, %f11, %f9
	.word 0x867aa268  ! 33: SDIV_I	sdiv 	%r10, 0x0268, %r3
	.word 0xb7da800b  ! 34: FLUSH_R	dis not found

	.word 0x8143c000  ! 35: STBAR	stbar
	.word 0x8fa288ab  ! 36: FSUBs	fsubs	%f10, %f11, %f7
	.word 0x8143e00b  ! 37: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore 
	.word 0xeb3aae98  ! 38: STDF_I	std	%f21, [0x0e98, %r10]
	.word 0xfcaa900b  ! 39: STBA_R	stba	%r30, [%r10 + %r11] 0x80
	.word 0xcca2900b  ! 40: STWA_R	stwa	%r6, [%r10 + %r11] 0x80
	.word 0xa56aa1c4  ! 41: SDIVX_I	sdivx	%r10, 0x01c4, %r18
	.word 0xc93aa9d0  ! 42: STDF_I	std	%f4, [0x09d0, %r10]
	.word 0xe67a800b  ! 43: SWAP_R	swap	%r19, [%r10 + %r11]
	.word 0xda12af6c  ! 44: LDUH_I	lduh	[%r10 + 0x0f6c], %r13
	.word 0xcca2900b  ! 45: STWA_R	stwa	%r6, [%r10 + %r11] 0x80
	.word 0xc36aa398  ! 46: PREFETCH_I	prefetch	[%r10 + 0x0398], #one_read
	.word 0xcff2a00b  ! 47: CASXA_R	casxa	[%r10]%asi, %r11, %r7
	.word 0xe1e2900b  ! 48: CASA_I	casa	[%r10] 0x80, %r11, %r16
	.word 0xafdaa9a8  ! 49: FLUSH_I	dis not found

	.word 0xd8b2900b  ! 50: STHA_R	stha	%r12, [%r10 + %r11] 0x80
	.word 0xdada900b  ! 51: LDXA_R	ldxa	[%r10, %r11] 0x80, %r13
	.word 0x887aa518  ! 52: SDIV_I	sdiv 	%r10, 0x0518, %r4
	.word 0xc8f2900b  ! 53: STXA_R	stxa	%r4, [%r10 + %r11] 0x80
	.word 0xafa2892b  ! 54: FMULs	fmuls	%f10, %f11, %f23
	.word 0xfafa900b  ! 55: SWAPA_R	swapa	%r29, [%r10 + %r11] 0x80
	.word 0xc5f2a00b  ! 56: CASXA_R	casxa	[%r10]%asi, %r11, %r2
	.word 0xcc92900b  ! 57: LDUHA_R	lduha	[%r10, %r11] 0x80, %r6
	.word 0xe24aa250  ! 58: LDSB_I	ldsb	[%r10 + 0x0250], %r17
	.word 0xf0b2900b  ! 59: STHA_R	stha	%r24, [%r10 + %r11] 0x80
	.word 0xf322a774  ! 60: STF_I	st	%f25, [0x0774, %r10]
	.word 0xe49aa6d0  ! 61: LDDA_I	ldda	[%r10, + 0x06d0] %asi, %r18
	.word 0xceeaabe4  ! 62: LDSTUBA_I	ldstuba	%r7, [%r10 + 0x0be4] %asi
	.word 0x8143e003  ! 63: MEMBAR	membar	#LoadLoad | #StoreLoad 
	.word 0xea42800b  ! 64: LDSW_R	ldsw	[%r10 + %r11], %r21
	.word 0xb26a800b  ! 65: UDIVX_R	udivx 	%r10, %r11, %r25
	.word 0x827a800b  ! 66: SDIV_R	sdiv 	%r10, %r11, %r1
	.word 0xc36a800b  ! 67: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x85da800b  ! 68: FLUSH_R	dis not found

	.word 0x8143c000  ! 69: STBAR	stbar
	.word 0xc4fa900b  ! 70: SWAPA_R	swapa	%r2, [%r10 + %r11] 0x80
	.word 0x91da800b  ! 71: FLUSH_R	dis not found

	.word 0xf6faa774  ! 72: SWAPA_I	swapa	%r27, [%r10 + 0x0774] %asi
	.word 0xa9da800b  ! 73: FLUSH_R	dis not found

	.word 0xd2c2ae50  ! 74: LDSWA_I	ldswa	[%r10, + 0x0e50] %asi, %r9
	.word 0xcec2900b  ! 75: LDSWA_R	ldswa	[%r10, %r11] 0x80, %r7
	.word 0x89daae5c  ! 76: FLUSH_I	dis not found

	.word 0xc4aa900b  ! 77: STBA_R	stba	%r2, [%r10 + %r11] 0x80
	.word 0x8143e036  ! 78: MEMBAR	membar	#StoreLoad | #LoadStore | #Lookaside | #MemIssue 
	.word 0xc3eaa50c  ! 79: PREFETCHA_I	prefetcha	[%r10, + 0x050c] %asi, #one_read
	.word 0xcada900b  ! 80: LDXA_R	ldxa	[%r10, %r11] 0x80, %r5
	.word 0x8872a454  ! 81: UDIV_I	udiv 	%r10, 0x0454, %r4
	.word 0xc4aaaea4  ! 82: STBA_I	stba	%r2, [%r10 + 0x0ea4] %asi
	.word 0xaa52a674  ! 83: UMUL_I	umul 	%r10, 0x0674, %r21
	.word 0x8143c000  ! 84: STBAR	stbar
	.word 0x8143c000  ! 85: STBAR	stbar
	.word 0xfe42800b  ! 86: LDSW_R	ldsw	[%r10 + %r11], %r31
	.word 0x8922ab58  ! 87: MULScc_I	mulscc 	%r10, 0x0b58, %r4
	.word 0x8143c000  ! 88: STBAR	stbar
	.word 0xcb3aa4e8  ! 89: STDF_I	std	%f5, [0x04e8, %r10]
	.word 0x8143c000  ! 90: STBAR	stbar
	.word 0xa6fa800b  ! 91: SDIVcc_R	sdivcc 	%r10, %r11, %r19
	.word 0x8a52a7d0  ! 92: UMUL_I	umul 	%r10, 0x07d0, %r5
	.word 0x8143c000  ! 93: STBAR	stbar
	.word 0xca52800b  ! 94: LDSH_R	ldsh	[%r10 + %r11], %r5
	.word 0xc4c2a80c  ! 95: LDSWA_I	ldswa	[%r10, + 0x080c] %asi, %r2
	.word 0xc3eaa3a4  ! 96: PREFETCHA_I	prefetcha	[%r10, + 0x03a4] %asi, #one_read
	.word 0xdb3aaed0  ! 97: STDF_I	std	%f13, [0x0ed0, %r10]
	.word 0x8fdaa718  ! 98: FLUSH_I	dis not found

	.word 0x36800001  ! 99: BGE	bge,a	<label_0x1>
	.word 0xeed2af04  ! 100: LDSHA_I	ldsha	[%r10, + 0x0f04] %asi, %r23
	.word 0xf0c2ad78  ! 101: LDSWA_I	ldswa	[%r10, + 0x0d78] %asi, %r24
	.word 0x867aa6e8  ! 102: SDIV_I	sdiv 	%r10, 0x06e8, %r3
	.word 0x86f2800b  ! 103: UDIVcc_R	udivcc 	%r10, %r11, %r3
	.word 0xc47a800b  ! 104: SWAP_R	swap	%r2, [%r10 + %r11]
	.word 0x89daa49c  ! 105: FLUSH_I	dis not found

	.word 0xa1daa948  ! 106: FLUSH_I	dis not found

	.word 0x8ba289ab  ! 107: FDIVs	fdivs	%f10, %f11, %f5
	.word 0xc36a800b  ! 108: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x83daa41c  ! 109: FLUSH_I	dis not found

	.word 0xd042800b  ! 111: LDSW_R	ldsw	[%r10 + %r11], %r8
	.word 0xc522a03c  ! 113: STF_I	st	%f2, [0x003c, %r10]
	.word 0xd012800b  ! 114: LDUH_R	lduh	[%r10 + %r11], %r8
	.word 0xe8ea900b  ! 115: LDSTUBA_R	ldstuba	%r20, [%r10 + %r11] 0x80
	.word 0x3e800001  ! 116: BVC	bvc,a	<label_0x1>
	.word 0x8143c000  ! 117: STBAR	stbar
	.word 0xfa0a800b  ! 118: LDUB_R	ldub	[%r10 + %r11], %r29
	.word 0x0c800003  ! 120: BNEG	bneg  	<label_0x3>
	.word 0xa3da800b  ! 121: FLUSH_R	dis not found

	.word 0xccfa900b  ! 122: SWAPA_R	swapa	%r6, [%r10 + %r11] 0x80
	.word 0x91daaff4  ! 123: FLUSH_I	dis not found

	.word 0xc3ea900b  ! 124: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0xac5aa968  ! 125: SMUL_I	smul 	%r10, 0x0968, %r22
	.word 0xf6aa900b  ! 126: STBA_R	stba	%r27, [%r10 + %r11] 0x80
	.word 0xca82900b  ! 127: LDUWA_R	lduwa	[%r10, %r11] 0x80, %r5
	.word 0xb8f2800b  ! 128: UDIVcc_R	udivcc 	%r10, %r11, %r28
	.word 0x9a5aa3b0  ! 131: SMUL_I	smul 	%r10, 0x03b0, %r13
	.word 0x85daac3c  ! 132: FLUSH_I	dis not found

	.word 0x8143c000  ! 133: STBAR	stbar
	.word 0xce8a900b  ! 134: LDUBA_R	lduba	[%r10, %r11] 0x80, %r7
	.word 0x8143c000  ! 135: STBAR	stbar
	.word 0x86d2800b  ! 136: UMULcc_R	umulcc 	%r10, %r11, %r3
	.word 0xf6faa788  ! 137: SWAPA_I	swapa	%r27, [%r10 + 0x0788] %asi
	.word 0x20800003  ! 138: BN	bn,a	<label_0x3>
	.word 0x8143c000  ! 139: STBAR	stbar
	.word 0xc4aaa320  ! 140: STBA_I	stba	%r2, [%r10 + 0x0320] %asi
	.word 0xdaea900b  ! 141: LDSTUBA_R	ldstuba	%r13, [%r10 + %r11] 0x80
	.word 0xc8a2a5c4  ! 142: STWA_I	stwa	%r4, [%r10 + 0x05c4] %asi
	.word 0x83daa0fc  ! 143: FLUSH_I	dis not found

	.word 0xccaaae8c  ! 144: STBA_I	stba	%r6, [%r10 + 0x0e8c] %asi
	.word 0xa522800b  ! 145: MULScc_R	mulscc 	%r10, %r11, %r18
	.word 0xbbda800b  ! 146: FLUSH_R	dis not found

	.word 0xc66a800b  ! 147: LDSTUB_R	ldstub	%r3, [%r10 + %r11]
	.word 0x1a800001  ! 148: BCC	bcc  	<label_0x1>
	.word 0xc5e2900b  ! 149: CASA_I	casa	[%r10] 0x80, %r11, %r2
	.word 0xc6c2af28  ! 150: LDSWA_I	ldswa	[%r10, + 0x0f28] %asi, %r3
	.word 0xbda2892b  ! 151: FMULs	fmuls	%f10, %f11, %f30
	.word 0x8143e006  ! 152: MEMBAR	membar	#StoreLoad | #LoadStore 
	.word 0xc3eaa4a0  ! 153: PREFETCHA_I	prefetcha	[%r10, + 0x04a0] %asi, #one_read
	.word 0x926aa63c  ! 154: UDIVX_I	udivx 	%r10, 0x063c, %r9
	.word 0x93daaf78  ! 155: FLUSH_I	dis not found

	.word 0x8c4a800b  ! 157: MULX_R	mulx 	%r10, %r11, %r6
	.word 0xa5daae94  ! 158: FLUSH_I	dis not found

	.word 0x99da800b  ! 159: FLUSH_R	dis not found

	.word 0xd3e2a00b  ! 160: CASA_R	casa	[%r10] %asi, %r11, %r9
	.word 0xe81aabf8  ! 161: LDD_I	ldd	[%r10 + 0x0bf8], %r20
	.word 0x906aad88  ! 162: UDIVX_I	udivx 	%r10, 0x0d88, %r8
	.word 0x12800001  ! 163: BNE	bne  	<label_0x1>
	.word 0xce8a900b  ! 167: LDUBA_R	lduba	[%r10, %r11] 0x80, %r7
	.word 0x86f2800b  ! 168: UDIVcc_R	udivcc 	%r10, %r11, %r3
	.word 0xc882ad04  ! 169: LDUWA_I	lduwa	[%r10, + 0x0d04] %asi, %r4
	.word 0xa0d2800b  ! 170: UMULcc_R	umulcc 	%r10, %r11, %r16
	.word 0xfeca900b  ! 171: LDSBA_R	ldsba	[%r10, %r11] 0x80, %r31
	.word 0xa8d2a594  ! 172: UMULcc_I	umulcc 	%r10, 0x0594, %r20
	.word 0x8143c000  ! 173: STBAR	stbar
	.word 0xc2b2900b  ! 174: STHA_R	stha	%r1, [%r10 + %r11] 0x80
	.word 0x864aaf44  ! 175: MULX_I	mulx 	%r10, 0x0f44, %r3
	.word 0xd122a194  ! 176: STF_I	st	%f8, [0x0194, %r10]
	.word 0x02800003  ! 177: BE	be  	<label_0x3>
	.word 0xcadaa4e0  ! 178: LDXA_I	ldxa	[%r10, + 0x04e0] %asi, %r5
	.word 0xc3eaa3c4  ! 179: PREFETCHA_I	prefetcha	[%r10, + 0x03c4] %asi, #one_read
	.word 0x8143e060  ! 180: MEMBAR	membar	#MemIssue | #Sync 
	.word 0x9252af4c  ! 181: UMUL_I	umul 	%r10, 0x0f4c, %r9
	.word 0x86faa6b0  ! 182: SDIVcc_I	sdivcc 	%r10, 0x06b0, %r3
	.word 0x856aa9fc  ! 183: SDIVX_I	sdivx	%r10, 0x09fc, %r2
	.word 0x885aabac  ! 184: SMUL_I	smul 	%r10, 0x0bac, %r4
	.word 0xc26a800b  ! 187: LDSTUB_R	ldstub	%r1, [%r10 + %r11]
	.word 0x87daa4b0  ! 188: FLUSH_I	dis not found

	.word 0xc41a800b  ! 189: LDD_R	ldd	[%r10 + %r11], %r2
	.word 0xe1f2a00b  ! 190: CASXA_R	casxa	[%r10]%asi, %r11, %r16
	.word 0xf87aa544  ! 191: SWAP_I	swap	%r28, [%r10 + 0x0544]
	.word 0xd04a800b  ! 192: LDSB_R	ldsb	[%r10 + %r11], %r8
	.word 0xbbdaa880  ! 193: FLUSH_I	dis not found

	.word 0x2cca0001  ! 194: BRGZ	brgz,a,pt	%8,<label_0xa0001>
	.word 0x8af2800b  ! 195: UDIVcc_R	udivcc 	%r10, %r11, %r5
	.word 0xada289ab  ! 196: FDIVs	fdivs	%f10, %f11, %f22
	.word 0xcc42800b  ! 197: LDSW_R	ldsw	[%r10 + %r11], %r6
	.word 0x9dda800b  ! 198: FLUSH_R	dis not found

	.word 0x1a800003  ! 199: BCC	bcc  	<label_0x3>
	.word 0x8472800b  ! 200: UDIV_R	udiv 	%r10, %r11, %r2
	.word 0x0aca0001  ! 201: BRNZ	brnz  ,pt	%8,<label_0xa0001>
	.word 0xcac2af1c  ! 202: LDSWA_I	ldswa	[%r10, + 0x0f1c] %asi, %r5
	.word 0xc4b2a800  ! 203: STHA_I	stha	%r2, [%r10 + 0x0800] %asi
	.word 0x9072a868  ! 204: UDIV_I	udiv 	%r10, 0x0868, %r8
	.word 0xcad2aad4  ! 205: LDSHA_I	ldsha	[%r10, + 0x0ad4] %asi, %r5
	.word 0xd0ea900b  ! 206: LDSTUBA_R	ldstuba	%r8, [%r10 + %r11] 0x80
	.word 0xa2d2aa8c  ! 207: UMULcc_I	umulcc 	%r10, 0x0a8c, %r17
	.word 0x8143e022  ! 208: MEMBAR	membar	#StoreLoad | #MemIssue 
	.word 0xd2ca900b  ! 209: LDSBA_R	ldsba	[%r10, %r11] 0x80, %r9
	.word 0xc2c2900b  ! 210: LDSWA_R	ldswa	[%r10, %r11] 0x80, %r1
	.word 0xc36aa250  ! 211: PREFETCH_I	prefetch	[%r10 + 0x0250], #one_read
	.word 0x8452800b  ! 212: UMUL_R	umul 	%r10, %r11, %r2
	.word 0x8da289ab  ! 213: FDIVs	fdivs	%f10, %f11, %f6
	.word 0x8afaab8c  ! 214: SDIVcc_I	sdivcc 	%r10, 0x0b8c, %r5
	.word 0x8143e00d  ! 215: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore 
	.word 0xf002800b  ! 216: LDUW_R	lduw	[%r10 + %r11], %r24
	.word 0xcca2a804  ! 217: STWA_I	stwa	%r6, [%r10 + 0x0804] %asi
	.word 0x93da800b  ! 218: FLUSH_R	dis not found

	.word 0x93daa144  ! 219: FLUSH_I	dis not found

	.word 0x0ac20003  ! 221: BRNZ	brnz  ,nt	%8,<label_0x20003>
	.word 0x8452ac2c  ! 222: UMUL_I	umul 	%r10, 0x0c2c, %r2
	.word 0x87a2882b  ! 223: FADDs	fadds	%f10, %f11, %f3
	.word 0xcefa900b  ! 224: SWAPA_R	swapa	%r7, [%r10 + %r11] 0x80
	.word 0x986a800b  ! 225: UDIVX_R	udivx 	%r10, %r11, %r12
	.word 0xa84aa0c8  ! 226: MULX_I	mulx 	%r10, 0x00c8, %r20
	.word 0xcd3a800b  ! 227: STDF_R	std	%f6, [%r11, %r10]
	.word 0x8ad2a9ec  ! 228: UMULcc_I	umulcc 	%r10, 0x09ec, %r5
	.word 0xce4aabc8  ! 229: LDSB_I	ldsb	[%r10 + 0x0bc8], %r7
	.word 0xf612a688  ! 230: LDUH_I	lduh	[%r10 + 0x0688], %r27
	.word 0xd27a800b  ! 231: SWAP_R	swap	%r9, [%r10 + %r11]
	.word 0xc8aaaf88  ! 232: STBA_I	stba	%r4, [%r10 + 0x0f88] %asi
	.word 0xd1e2a00b  ! 233: CASA_R	casa	[%r10] %asi, %r11, %r8
	.word 0x8143c000  ! 234: STBAR	stbar
	.word 0x02ca0001  ! 235: BRZ	brz  ,pt	%8,<label_0xa0001>
	.word 0xc36a800b  ! 236: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0xcefa900b  ! 237: SWAPA_R	swapa	%r7, [%r10 + %r11] 0x80
	.word 0xcfe2a00b  ! 238: CASA_R	casa	[%r10] %asi, %r11, %r7
	.word 0xc8f2900b  ! 239: STXA_R	stxa	%r4, [%r10 + %r11] 0x80
	.word 0x2cca0003  ! 240: BRGZ	brgz,a,pt	%8,<label_0xa0003>
	.word 0x93daa410  ! 242: FLUSH_I	dis not found

	.word 0x3a800001  ! 243: BCC	bcc,a	<label_0x1>
	.word 0x8143c000  ! 244: STBAR	stbar
	.word 0x93da800b  ! 245: FLUSH_R	dis not found

	.word 0xc322800b  ! 246: STF_R	st	%f1, [%r11, %r10]
	.word 0x8dda800b  ! 247: FLUSH_R	dis not found

	.word 0xd242800b  ! 248: LDSW_R	ldsw	[%r10 + %r11], %r9
	.word 0xbaf2800b  ! 249: UDIVcc_R	udivcc 	%r10, %r11, %r29
	.word 0xc81a800b  ! 250: LDD_R	ldd	[%r10 + %r11], %r4
	.word 0xc3ea900b  ! 251: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0xccf2a180  ! 252: STXA_I	stxa	%r6, [%r10 + 0x0180] %asi
	.word 0xbad2aed4  ! 253: UMULcc_I	umulcc 	%r10, 0x0ed4, %r29
	.word 0x38800001  ! 254: BGU	bgu,a	<label_0x1>
	.word 0x8a52a028  ! 255: UMUL_I	umul 	%r10, 0x0028, %r5
	.word 0x8a72a8e4  ! 256: UDIV_I	udiv 	%r10, 0x08e4, %r5
	.word 0x85daa7d4  ! 257: FLUSH_I	dis not found

	.word 0xcca2900b  ! 258: STWA_R	stwa	%r6, [%r10 + %r11] 0x80
	.word 0xa7a288ab  ! 259: FSUBs	fsubs	%f10, %f11, %f19
	.word 0xb452adc4  ! 260: UMUL_I	umul 	%r10, 0x0dc4, %r26
	.word 0x886aa13c  ! 261: UDIVX_I	udivx 	%r10, 0x013c, %r4
	.word 0x8ddaaa0c  ! 262: FLUSH_I	dis not found

	.word 0x8dda800b  ! 263: FLUSH_R	dis not found

	.word 0xc53a800b  ! 264: STDF_R	std	%f2, [%r11, %r10]
	.word 0x3c800001  ! 265: BPOS	bpos,a	<label_0x1>
	.word 0x83daaf50  ! 266: FLUSH_I	dis not found

	.word 0x8da289ab  ! 267: FDIVs	fdivs	%f10, %f11, %f6
	.word 0xc01a800b  ! 268: LDD_R	ldd	[%r10 + %r11], %r0
	.word 0x40000001  ! 269: CALL	call	disp30_1
	.word 0xc3e2a00b  ! 270: CASA_R	casa	[%r10] %asi, %r11, %r1
	.word 0xf80aa330  ! 271: LDUB_I	ldub	[%r10 + 0x0330], %r28
	.word 0x8143c000  ! 272: STBAR	stbar
	.word 0xc09aac40  ! 273: LDDA_I	ldda	[%r10, + 0x0c40] %asi, %r0
	.word 0x12800001  ! 274: BNE	bne  	<label_0x1>
	.word 0x876aa110  ! 275: SDIVX_I	sdivx	%r10, 0x0110, %r3
	.word 0xc2aa900b  ! 276: STBA_R	stba	%r1, [%r10 + %r11] 0x80
	.word 0x9072800b  ! 277: UDIV_R	udiv 	%r10, %r11, %r8
	.word 0x8143c000  ! 278: STBAR	stbar
	.word 0x90da800b  ! 279: SMULcc_R	smulcc 	%r10, %r11, %r8
	.word 0xf89a900b  ! 280: LDDA_R	ldda	[%r10, %r11] 0x80, %r28
	.word 0xd00a800b  ! 281: LDUB_R	ldub	[%r10 + %r11], %r8
	.word 0x9052a580  ! 282: UMUL_I	umul 	%r10, 0x0580, %r8
	.word 0x905aa944  ! 283: SMUL_I	smul 	%r10, 0x0944, %r8
	.word 0xccf2900b  ! 284: STXA_R	stxa	%r6, [%r10 + %r11] 0x80
	.word 0xc2aaa79c  ! 285: STBA_I	stba	%r1, [%r10 + 0x079c] %asi
	.word 0x93da800b  ! 286: FLUSH_R	dis not found

	.word 0xc6eaa990  ! 287: LDSTUBA_I	ldstuba	%r3, [%r10 + 0x0990] %asi
	.word 0x87da800b  ! 288: FLUSH_R	dis not found

	.word 0x20800003  ! 289: BN	bn,a	<label_0x3>
	.word 0xf852800b  ! 290: LDSH_R	ldsh	[%r10 + %r11], %r28
	.word 0x9122800b  ! 291: MULScc_R	mulscc 	%r10, %r11, %r8
	.word 0x8143c000  ! 292: STBAR	stbar
	.word 0xc48aa430  ! 293: LDUBA_I	lduba	[%r10, + 0x0430] %asi, %r2
	.word 0xa4daae94  ! 294: SMULcc_I	smulcc 	%r10, 0x0e94, %r18
	.word 0xcb3a800b  ! 295: STDF_R	std	%f5, [%r11, %r10]
	.word 0x8a72800b  ! 296: UDIV_R	udiv 	%r10, %r11, %r5
	.word 0xf0faa584  ! 297: SWAPA_I	swapa	%r24, [%r10 + 0x0584] %asi
	.word 0xc36a800b  ! 298: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0xc2b2900b  ! 299: STHA_R	stha	%r1, [%r10 + %r11] 0x80
	.word 0xc7f2a00b  ! 300: CASXA_R	casxa	[%r10]%asi, %r11, %r3
	.word 0x82d2800b  ! 301: UMULcc_R	umulcc 	%r10, %r11, %r1
	.word 0xfcba900b  ! 302: STDA_R	stda	%r30, [%r10 + %r11] 0x80
	.word 0x8143c000  ! 303: STBAR	stbar
	.word 0xaed2800b  ! 304: UMULcc_R	umulcc 	%r10, %r11, %r23
	.word 0xcccaa100  ! 305: LDSBA_I	ldsba	[%r10, + 0x0100] %asi, %r6
	.word 0xf8baaf00  ! 306: STDA_I	stda	%r28, [%r10 + 0x0f00] %asi
	.word 0xcfe2a00b  ! 307: CASA_R	casa	[%r10] %asi, %r11, %r7
	.word 0xcff2a00b  ! 308: CASXA_R	casxa	[%r10]%asi, %r11, %r7
	.word 0xb8faa6c4  ! 309: SDIVcc_I	sdivcc 	%r10, 0x06c4, %r28
	.word 0xc4a2900b  ! 310: STWA_R	stwa	%r2, [%r10 + %r11] 0x80
	.word 0x8143e02e  ! 311: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #MemIssue 
	.word 0xc8f2aea0  ! 312: STXA_I	stxa	%r4, [%r10 + 0x0ea0] %asi
	.word 0xd322800b  ! 313: STF_R	st	%f9, [%r11, %r10]
	.word 0xeb3a800b  ! 314: STDF_R	std	%f21, [%r11, %r10]
	.word 0xceaaa230  ! 315: STBA_I	stba	%r7, [%r10 + 0x0230] %asi
	.word 0xc6ea900b  ! 316: LDSTUBA_R	ldstuba	%r3, [%r10 + %r11] 0x80
	.word 0x38800001  ! 317: BGU	bgu,a	<label_0x1>
	.word 0xc87aafe0  ! 318: SWAP_I	swap	%r4, [%r10 + 0x0fe0]
	.word 0x8922800b  ! 319: MULScc_R	mulscc 	%r10, %r11, %r4
	.word 0xcafa900b  ! 320: SWAPA_R	swapa	%r5, [%r10 + %r11] 0x80
	.word 0x2c800001  ! 321: BNEG	bneg,a	<label_0x1>
	.word 0xd122800b  ! 322: STF_R	st	%f8, [%r11, %r10]
	.word 0xc3f2900b  ! 323: CASXA_I	casxa	[%r10] 0x80, %r11, %r1
	.word 0x2c800001  ! 324: BNEG	bneg,a	<label_0x1>
	.word 0xca52a23c  ! 325: LDSH_I	ldsh	[%r10 + 0x023c], %r5
	.word 0xc3eaaaf4  ! 326: PREFETCHA_I	prefetcha	[%r10, + 0x0af4] %asi, #one_read
	.word 0xcc9aa710  ! 328: LDDA_I	ldda	[%r10, + 0x0710] %asi, %r6
	.word 0x82fa800b  ! 329: SDIVcc_R	sdivcc 	%r10, %r11, %r1
	.word 0x8143c000  ! 330: STBAR	stbar
	.word 0xce02a68c  ! 331: LDUW_I	lduw	[%r10 + 0x068c], %r7
	.word 0x83a2892b  ! 332: FMULs	fmuls	%f10, %f11, %f1
	.word 0x8143c000  ! 334: STBAR	stbar
	.word 0xce6aa858  ! 335: LDSTUB_I	ldstub	%r7, [%r10 + 0x0858]
	.word 0x89daa000  ! 336: FLUSH_I	dis not found

	.word 0xa3daa658  ! 337: FLUSH_I	dis not found

	.word 0x2c800001  ! 338: BNEG	bneg,a	<label_0x1>
	.word 0x8da288ab  ! 340: FSUBs	fsubs	%f10, %f11, %f6
	.word 0xb2f2a754  ! 341: UDIVcc_I	udivcc 	%r10, 0x0754, %r25
	.word 0xa5da800b  ! 342: FLUSH_R	dis not found

	.word 0xe89a900b  ! 343: LDDA_R	ldda	[%r10, %r11] 0x80, %r20
	.word 0x92f2af78  ! 344: UDIVcc_I	udivcc 	%r10, 0x0f78, %r9
	.word 0xcc4a800b  ! 345: LDSB_R	ldsb	[%r10 + %r11], %r6
	.word 0x8cf2a0c4  ! 346: UDIVcc_I	udivcc 	%r10, 0x00c4, %r6
	.word 0x845aab7c  ! 347: SMUL_I	smul 	%r10, 0x0b7c, %r2
	.word 0x8e7a800b  ! 348: SDIV_R	sdiv 	%r10, %r11, %r7
	.word 0x9072a250  ! 349: UDIV_I	udiv 	%r10, 0x0250, %r8
	.word 0x8143c000  ! 350: STBAR	stbar
	.word 0x40000001  ! 351: CALL	call	disp30_1
	.word 0xfe8aa0ec  ! 352: LDUBA_I	lduba	[%r10, + 0x00ec] %asi, %r31
	.word 0x8143e028  ! 353: MEMBAR	membar	#StoreStore | #MemIssue 
	.word 0xce82900b  ! 354: LDUWA_R	lduwa	[%r10, %r11] 0x80, %r7
	.word 0x8ef2800b  ! 355: UDIVcc_R	udivcc 	%r10, %r11, %r7
	.word 0x8fa2882b  ! 356: FADDs	fadds	%f10, %f11, %f7
	.word 0x8ed2800b  ! 357: UMULcc_R	umulcc 	%r10, %r11, %r7
	.word 0xd0caa2dc  ! 358: LDSBA_I	ldsba	[%r10, + 0x02dc] %asi, %r8
	.word 0xc3ea900b  ! 359: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0x8a7aa2ac  ! 360: SDIV_I	sdiv 	%r10, 0x02ac, %r5
	.word 0x9fdaa354  ! 361: FLUSH_I	dis not found

	.word 0x8143c000  ! 363: STBAR	stbar
	.word 0x8143c000  ! 364: STBAR	stbar
	.word 0xc6d2900b  ! 365: LDSHA_R	ldsha	[%r10, %r11] 0x80, %r3
	.word 0xf8ca900b  ! 366: LDSBA_R	ldsba	[%r10, %r11] 0x80, %r28
	.word 0xb452ae6c  ! 368: UMUL_I	umul 	%r10, 0x0e6c, %r26
	.word 0x8143e06a  ! 369: MEMBAR	membar	#StoreLoad | #StoreStore | #MemIssue | #Sync 
	.word 0x8a52ab9c  ! 370: UMUL_I	umul 	%r10, 0x0b9c, %r5
	.word 0x8143e067  ! 371: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #MemIssue | #Sync 
	.word 0xc842a83c  ! 372: LDSW_I	ldsw	[%r10 + 0x083c], %r4
	.word 0x8dda800b  ! 373: FLUSH_R	dis not found

	.word 0x8efaaf24  ! 374: SDIVcc_I	sdivcc 	%r10, 0x0f24, %r7
	.word 0xdc7aa978  ! 375: SWAP_I	swap	%r14, [%r10 + 0x0978]
	.word 0x89a288ab  ! 376: FSUBs	fsubs	%f10, %f11, %f4
	.word 0xc3ea900b  ! 377: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0x8e72800b  ! 378: UDIV_R	udiv 	%r10, %r11, %r7
	.word 0x8143e050  ! 379: MEMBAR	membar	#Lookaside | #Sync 
	.word 0x884a800b  ! 380: MULX_R	mulx 	%r10, %r11, %r4
	.word 0x32800001  ! 381: BNE	bne,a	<label_0x1>
	.word 0xbfdaad6c  ! 382: FLUSH_I	dis not found

	.word 0x8143c000  ! 383: STBAR	stbar
	.word 0xdca2ab40  ! 384: STWA_I	stwa	%r14, [%r10 + 0x0b40] %asi
	.word 0x8143c000  ! 385: STBAR	stbar
	.word 0xc6ca900b  ! 387: LDSBA_R	ldsba	[%r10, %r11] 0x80, %r3
	.word 0x93da800b  ! 388: FLUSH_R	dis not found

	.word 0xd8ba900b  ! 389: STDA_R	stda	%r12, [%r10 + %r11] 0x80
	.word 0xde7aa040  ! 390: SWAP_I	swap	%r15, [%r10 + 0x0040]
	.word 0x8143e079  ! 391: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0x8143e064  ! 392: MEMBAR	membar	#LoadStore | #MemIssue | #Sync 
	.word 0x8143e028  ! 393: MEMBAR	membar	#StoreStore | #MemIssue 
	.word 0xc36aaebc  ! 394: PREFETCH_I	prefetch	[%r10 + 0x0ebc], #one_read
	.word 0xc65aa0d0  ! 395: LDX_I	ldx	[%r10 + 0x00d0], %r3
	.word 0xdedaa788  ! 396: LDXA_I	ldxa	[%r10, + 0x0788] %asi, %r15
	.word 0x87daaa50  ! 397: FLUSH_I	dis not found

	.word 0x8143c000  ! 398: STBAR	stbar
	.word 0x91da800b  ! 399: FLUSH_R	dis not found

	.word 0xc93aa580  ! 400: STDF_I	std	%f4, [0x0580, %r10]
	.word 0xe65a800b  ! 401: LDX_R	ldx	[%r10 + %r11], %r19
	.word 0x8ef2a048  ! 402: UDIVcc_I	udivcc 	%r10, 0x0048, %r7
	.word 0x85da800b  ! 403: FLUSH_R	dis not found

	.word 0x8652800b  ! 404: UMUL_R	umul 	%r10, %r11, %r3
	.word 0x3c800001  ! 405: BPOS	bpos,a	<label_0x1>
	.word 0xd13aa638  ! 406: STDF_I	std	%f8, [0x0638, %r10]
	.word 0xc6b2aeb8  ! 407: STHA_I	stha	%r3, [%r10 + 0x0eb8] %asi
	.word 0xccca900b  ! 408: LDSBA_R	ldsba	[%r10, %r11] 0x80, %r6
	.word 0xd212800b  ! 409: LDUH_R	lduh	[%r10 + %r11], %r9
	.word 0xdc4a800b  ! 410: LDSB_R	ldsb	[%r10 + %r11], %r14
	.word 0x26800001  ! 411: BL	bl,a	<label_0x1>
	.word 0xd0a2ab94  ! 412: STWA_I	stwa	%r8, [%r10 + 0x0b94] %asi
	.word 0x825a800b  ! 413: SMUL_R	smul 	%r10, %r11, %r1
	.word 0x3a800003  ! 414: BCC	bcc,a	<label_0x3>
	.word 0x32800001  ! 415: BNE	bne,a	<label_0x1>
	.word 0x84da800b  ! 416: SMULcc_R	smulcc 	%r10, %r11, %r2
	.word 0xc36a800b  ! 417: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0xd24aa454  ! 418: LDSB_I	ldsb	[%r10 + 0x0454], %r9
	.word 0xc8aa900b  ! 419: STBA_R	stba	%r4, [%r10 + %r11] 0x80
	.word 0x8143c000  ! 420: STBAR	stbar
	.word 0xc8aaac00  ! 422: STBA_I	stba	%r4, [%r10 + 0x0c00] %asi
	.word 0xd0eaa024  ! 423: LDSTUBA_I	ldstuba	%r8, [%r10 + 0x0024] %asi
	.word 0x86fa800b  ! 425: SDIVcc_R	sdivcc 	%r10, %r11, %r3
	.word 0x8143e044  ! 426: MEMBAR	membar	#LoadStore | #Sync 
	.word 0xbc52800b  ! 427: UMUL_R	umul 	%r10, %r11, %r30
	.word 0x00800001  ! 428: BN	bn  	<label_0x1>
	.word 0xaa7aa960  ! 429: SDIV_I	sdiv 	%r10, 0x0960, %r21
	.word 0x2cc20001  ! 430: BRGZ	brgz,a,nt	%8,<label_0x20001>
	.word 0xccf2900b  ! 431: STXA_R	stxa	%r6, [%r10 + %r11] 0x80
	.word 0x8143c000  ! 432: STBAR	stbar
	.word 0xc2a2a3a4  ! 433: STWA_I	stwa	%r1, [%r10 + 0x03a4] %asi
	.word 0xc6eaa5fc  ! 434: LDSTUBA_I	ldstuba	%r3, [%r10 + 0x05fc] %asi
	.word 0x8e6a800b  ! 435: UDIVX_R	udivx 	%r10, %r11, %r7
	.word 0x8af2800b  ! 436: UDIVcc_R	udivcc 	%r10, %r11, %r5
	.word 0x22c20003  ! 437: BRZ	brz,a,nt	%8,<label_0x20003>
	.word 0xc3eaaca4  ! 438: PREFETCHA_I	prefetcha	[%r10, + 0x0ca4] %asi, #one_read
	.word 0xc882ac8c  ! 439: LDUWA_I	lduwa	[%r10, + 0x0c8c] %asi, %r4
	.word 0x8143e058  ! 440: MEMBAR	membar	#StoreStore | #Lookaside | #Sync 
	.word 0xd00aa5a4  ! 441: LDUB_I	ldub	[%r10 + 0x05a4], %r8
	.word 0xe052ad5c  ! 442: LDSH_I	ldsh	[%r10 + 0x0d5c], %r16
	.word 0x85a2892b  ! 443: FMULs	fmuls	%f10, %f11, %f2
	.word 0x8b6aa568  ! 444: SDIVX_I	sdivx	%r10, 0x0568, %r5
	.word 0xe922800b  ! 445: STF_R	st	%f20, [%r11, %r10]
	.word 0xcca2ae00  ! 446: STWA_I	stwa	%r6, [%r10 + 0x0e00] %asi
	.word 0x8252800b  ! 447: UMUL_R	umul 	%r10, %r11, %r1
	.word 0x82f2a41c  ! 448: UDIVcc_I	udivcc 	%r10, 0x041c, %r1
	.word 0xc722800b  ! 450: STF_R	st	%f3, [%r11, %r10]
	.word 0x24800001  ! 451: BLE	ble,a	<label_0x1>
	.word 0xc4a2900b  ! 452: STWA_R	stwa	%r2, [%r10 + %r11] 0x80
	.word 0xf07aa59c  ! 453: SWAP_I	swap	%r24, [%r10 + 0x059c]
	.word 0xc47aaf74  ! 454: SWAP_I	swap	%r2, [%r10 + 0x0f74]
	.word 0x8143e00f  ! 455: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore 
	.word 0x1a800001  ! 456: BCC	bcc  	<label_0x1>
	.word 0xce0a800b  ! 457: LDUB_R	ldub	[%r10 + %r11], %r7
	.word 0xb9da800b  ! 458: FLUSH_R	dis not found

	.word 0x1a800003  ! 459: BCC	bcc  	<label_0x3>
	.word 0xceaaaf2c  ! 460: STBA_I	stba	%r7, [%r10 + 0x0f2c] %asi
	.word 0x9322ac38  ! 461: MULScc_I	mulscc 	%r10, 0x0c38, %r9
	.word 0x8143c000  ! 462: STBAR	stbar
	.word 0xc3ea900b  ! 463: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0xc80aa880  ! 464: LDUB_I	ldub	[%r10 + 0x0880], %r4
	.word 0xa0d2800b  ! 465: UMULcc_R	umulcc 	%r10, %r11, %r16
	.word 0x93da800b  ! 466: FLUSH_R	dis not found

	.word 0x8afaa61c  ! 467: SDIVcc_I	sdivcc 	%r10, 0x061c, %r5
	.word 0xcc7a800b  ! 468: SWAP_R	swap	%r6, [%r10 + %r11]
	.word 0x8143c000  ! 469: STBAR	stbar
	.word 0xce82900b  ! 470: LDUWA_R	lduwa	[%r10, %r11] 0x80, %r7
	.word 0x8143c000  ! 471: STBAR	stbar
	.word 0xc482900b  ! 472: LDUWA_R	lduwa	[%r10, %r11] 0x80, %r2
	.word 0xd1e2900b  ! 473: CASA_I	casa	[%r10] 0x80, %r11, %r8
	.word 0xf13aa7b8  ! 474: STDF_I	std	%f24, [0x07b8, %r10]
	.word 0x0ac20001  ! 475: BRNZ	brnz  ,nt	%8,<label_0x20001>
	.word 0xc2aa900b  ! 476: STBA_R	stba	%r1, [%r10 + %r11] 0x80
	.word 0x91daa570  ! 477: FLUSH_I	dis not found

	.word 0x9272800b  ! 478: UDIV_R	udiv 	%r10, %r11, %r9
	.word 0xa1daa664  ! 479: FLUSH_I	dis not found

	.word 0x8143e053  ! 480: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside | #Sync 
	.word 0xe4f2900b  ! 481: STXA_R	stxa	%r18, [%r10 + %r11] 0x80
	.word 0xc36aab2c  ! 482: PREFETCH_I	prefetch	[%r10 + 0x0b2c], #one_read
	.word 0x8143e067  ! 483: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #MemIssue | #Sync 
	.word 0xf8f2afb8  ! 484: STXA_I	stxa	%r28, [%r10 + 0x0fb8] %asi
	.word 0x92f2a8e8  ! 485: UDIVcc_I	udivcc 	%r10, 0x08e8, %r9
	.word 0xcde2900b  ! 486: CASA_I	casa	[%r10] 0x80, %r11, %r6
	.word 0xb8fa800b  ! 487: SDIVcc_R	sdivcc 	%r10, %r11, %r28
	.word 0x06ca0001  ! 488: BRLZ	brlz  ,pt	%8,<label_0xa0001>
	.word 0xfc1aa138  ! 489: LDD_I	ldd	[%r10 + 0x0138], %r30
	.word 0x26c20001  ! 490: BRLZ	brlz,a,nt	%8,<label_0x20001>
	.word 0x876a800b  ! 491: SDIVX_R	sdivx	%r10, %r11, %r3
	.word 0xf86a800b  ! 492: LDSTUB_R	ldstub	%r28, [%r10 + %r11]
	.word 0xc2a2a3bc  ! 493: STWA_I	stwa	%r1, [%r10 + 0x03bc] %asi
	.word 0x8af2a544  ! 494: UDIVcc_I	udivcc 	%r10, 0x0544, %r5
	.word 0xc8ba900b  ! 495: STDA_R	stda	%r4, [%r10 + %r11] 0x80
	.word 0x8143e02c  ! 496: MEMBAR	membar	#LoadStore | #StoreStore | #MemIssue 
	.word 0x8ba289ab  ! 497: FDIVs	fdivs	%f10, %f11, %f5
	.word 0x2eca0001  ! 498: BRGEZ	brgez,a,pt	%8,<label_0xa0001>
	.word 0x10800003  ! 499: BA	ba  	<label_0x3>
	.word 0xc2caaf90  ! 500: LDSBA_I	ldsba	[%r10, + 0x0f90] %asi, %r1
	.word 0xc4d2900b  ! 501: LDSHA_R	ldsha	[%r10, %r11] 0x80, %r2
	.word 0x93daa128  ! 502: FLUSH_I	dis not found

	.word 0x90fa800b  ! 503: SDIVcc_R	sdivcc 	%r10, %r11, %r8
	.word 0x9dda800b  ! 504: FLUSH_R	dis not found

	.word 0xc322800b  ! 505: STF_R	st	%f1, [%r11, %r10]
	.word 0xc88aa044  ! 506: LDUBA_I	lduba	[%r10, + 0x0044] %asi, %r4
	.word 0xe852800b  ! 507: LDSH_R	ldsh	[%r10 + %r11], %r20
	.word 0xd252800b  ! 508: LDSH_R	ldsh	[%r10 + %r11], %r9
	.word 0xce7a800b  ! 509: SWAP_R	swap	%r7, [%r10 + %r11]
	.word 0xc652aaa0  ! 510: LDSH_I	ldsh	[%r10 + 0x0aa0], %r3
	.word 0xe0aaa4d4  ! 511: STBA_I	stba	%r16, [%r10 + 0x04d4] %asi
	.word 0x8af2800b  ! 512: UDIVcc_R	udivcc 	%r10, %r11, %r5
	.word 0x8143c000  ! 513: STBAR	stbar
	.word 0x87daaa24  ! 514: FLUSH_I	dis not found

	.word 0xc3ea900b  ! 515: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0xcc42800b  ! 516: LDSW_R	ldsw	[%r10 + %r11], %r6
	.word 0xb2d2a7a4  ! 517: UMULcc_I	umulcc 	%r10, 0x07a4, %r25
	.word 0xcc8a900b  ! 518: LDUBA_R	lduba	[%r10, %r11] 0x80, %r6
	.word 0x83da800b  ! 519: FLUSH_R	dis not found

	.word 0xc2b2a150  ! 520: STHA_I	stha	%r1, [%r10 + 0x0150] %asi
	.word 0x8e7a800b  ! 521: SDIV_R	sdiv 	%r10, %r11, %r7
	.word 0xdb3aa570  ! 522: STDF_I	std	%f13, [0x0570, %r10]
	.word 0xecca900b  ! 524: LDSBA_R	ldsba	[%r10, %r11] 0x80, %r22
	.word 0xca92900b  ! 525: LDUHA_R	lduha	[%r10, %r11] 0x80, %r5
	.word 0xdf22a7b0  ! 526: STF_I	st	%f15, [0x07b0, %r10]
	.word 0x9a72a3c0  ! 527: UDIV_I	udiv 	%r10, 0x03c0, %r13
	.word 0x91daa1f0  ! 528: FLUSH_I	dis not found

	.word 0xc6aaae44  ! 529: STBA_I	stba	%r3, [%r10 + 0x0e44] %asi
	.word 0x92faa0ac  ! 530: SDIVcc_I	sdivcc 	%r10, 0x00ac, %r9
	.word 0xd13a800b  ! 531: STDF_R	std	%f8, [%r11, %r10]
	.word 0x91da800b  ! 532: FLUSH_R	dis not found

	.word 0xf402aa98  ! 533: LDUW_I	lduw	[%r10 + 0x0a98], %r26
	.word 0xf002a730  ! 534: LDUW_I	lduw	[%r10 + 0x0730], %r24
	.word 0x8143e043  ! 535: MEMBAR	membar	#LoadLoad | #StoreLoad | #Sync 
	.word 0x90d2a0cc  ! 536: UMULcc_I	umulcc 	%r10, 0x00cc, %r8
	.word 0xabda800b  ! 537: FLUSH_R	dis not found

	.word 0xc36a800b  ! 538: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x8872ac38  ! 539: UDIV_I	udiv 	%r10, 0x0c38, %r4
	.word 0xec8a900b  ! 540: LDUBA_R	lduba	[%r10, %r11] 0x80, %r22
	.word 0x8143c000  ! 541: STBAR	stbar
	.word 0x89daa080  ! 542: FLUSH_I	dis not found

	.word 0x8143c000  ! 543: STBAR	stbar
	.word 0x8da289ab  ! 544: FDIVs	fdivs	%f10, %f11, %f6
	.word 0xcef2a180  ! 545: STXA_I	stxa	%r7, [%r10 + 0x0180] %asi
	.word 0x90daa70c  ! 546: SMULcc_I	smulcc 	%r10, 0x070c, %r8
	.word 0xc602800b  ! 547: LDUW_R	lduw	[%r10 + %r11], %r3
	.word 0x86faa590  ! 548: SDIVcc_I	sdivcc 	%r10, 0x0590, %r3
	.word 0xc44a800b  ! 549: LDSB_R	ldsb	[%r10 + %r11], %r2
	.word 0xd09a900b  ! 550: LDDA_R	ldda	[%r10, %r11] 0x80, %r8
	.word 0xd24aaa8c  ! 551: LDSB_I	ldsb	[%r10 + 0x0a8c], %r9
	.word 0xc6b2a594  ! 552: STHA_I	stha	%r3, [%r10 + 0x0594] %asi
	.word 0xc3eaab5c  ! 553: PREFETCHA_I	prefetcha	[%r10, + 0x0b5c] %asi, #one_read
	.word 0x87a289ab  ! 554: FDIVs	fdivs	%f10, %f11, %f3
	.word 0xc86aa49c  ! 555: LDSTUB_I	ldstub	%r4, [%r10 + 0x049c]
	.word 0xeeb2900b  ! 556: STHA_R	stha	%r23, [%r10 + %r11] 0x80
	.word 0xb5a289ab  ! 557: FDIVs	fdivs	%f10, %f11, %f26
	.word 0x8722800b  ! 559: MULScc_R	mulscc 	%r10, %r11, %r3
	.word 0x8143c000  ! 560: STBAR	stbar
	.word 0xcc8aa050  ! 561: LDUBA_I	lduba	[%r10, + 0x0050] %asi, %r6
	.word 0xf4ba900b  ! 562: STDA_R	stda	%r26, [%r10 + %r11] 0x80
	.word 0x92d2aa74  ! 563: UMULcc_I	umulcc 	%r10, 0x0a74, %r9
	.word 0x86f2a8d4  ! 565: UDIVcc_I	udivcc 	%r10, 0x08d4, %r3
	.word 0xbefa800b  ! 566: SDIVcc_R	sdivcc 	%r10, %r11, %r31
	.word 0x866aa9c8  ! 567: UDIVX_I	udivx 	%r10, 0x09c8, %r3
	.word 0x8efaa678  ! 568: SDIVcc_I	sdivcc 	%r10, 0x0678, %r7
	.word 0xc3eaa3f4  ! 569: PREFETCHA_I	prefetcha	[%r10, + 0x03f4] %asi, #one_read
	.word 0x8143e044  ! 570: MEMBAR	membar	#LoadStore | #Sync 
	.word 0x8c4aa46c  ! 571: MULX_I	mulx 	%r10, 0x046c, %r6
	.word 0xc41aa758  ! 572: LDD_I	ldd	[%r10 + 0x0758], %r2
	.word 0x22800003  ! 573: BE	be,a	<label_0x3>
	.word 0x2ec20003  ! 574: BRGEZ	brgez,a,nt	%8,<label_0x20003>
	.word 0x08800001  ! 576: BLEU	bleu  	<label_0x1>
	.word 0xb3daa120  ! 577: FLUSH_I	dis not found

	.word 0x844aac9c  ! 578: MULX_I	mulx 	%r10, 0x0c9c, %r2
	.word 0xb9da800b  ! 579: FLUSH_R	dis not found

	.word 0x28800003  ! 580: BLEU	bleu,a	<label_0x3>
	.word 0xf2b2ae48  ! 581: STHA_I	stha	%r25, [%r10 + 0x0e48] %asi
	.word 0xc3eaa5c8  ! 582: PREFETCHA_I	prefetcha	[%r10, + 0x05c8] %asi, #one_read
	.word 0x16800003  ! 583: BGE	bge  	<label_0x3>
	.word 0x825a800b  ! 584: SMUL_R	smul 	%r10, %r11, %r1
	.word 0xc26aa0c8  ! 586: LDSTUB_I	ldstub	%r1, [%r10 + 0x00c8]
	.word 0x2cc20001  ! 587: BRGZ	brgz,a,nt	%8,<label_0x20001>
	.word 0xd08aab3c  ! 588: LDUBA_I	lduba	[%r10, + 0x0b3c] %asi, %r8
	.word 0xc4b2a684  ! 589: STHA_I	stha	%r2, [%r10 + 0x0684] %asi
	.word 0x36800001  ! 590: BGE	bge,a	<label_0x1>
	.word 0xcc12800b  ! 591: LDUH_R	lduh	[%r10 + %r11], %r6
	.word 0x30800001  ! 592: BA	ba,a	<label_0x1>
	.word 0x8da288ab  ! 593: FSUBs	fsubs	%f10, %f11, %f6
	.word 0x8ddaade0  ! 594: FLUSH_I	dis not found

	.word 0xcbe2a00b  ! 595: CASA_R	casa	[%r10] %asi, %r11, %r5
	.word 0xeb3aa5d0  ! 596: STDF_I	std	%f21, [0x05d0, %r10]
	.word 0xcaaa900b  ! 597: STBA_R	stba	%r5, [%r10 + %r11] 0x80
	.word 0x85daa8e4  ! 598: FLUSH_I	dis not found

	.word 0xfcfa900b  ! 599: SWAPA_R	swapa	%r30, [%r10 + %r11] 0x80
	.word 0x8143c000  ! 600: STBAR	stbar
	.word 0xf522a784  ! 601: STF_I	st	%f26, [0x0784, %r10]
	.word 0x38800003  ! 602: BGU	bgu,a	<label_0x3>
	.word 0xe052a33c  ! 603: LDSH_I	ldsh	[%r10 + 0x033c], %r16
	.word 0xc36a800b  ! 604: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x02c20001  ! 605: BRZ	brz  ,nt	%8,<label_0x20001>
	.word 0xbdda800b  ! 606: FLUSH_R	dis not found

	.word 0xa7daab40  ! 607: FLUSH_I	dis not found

	.word 0xcc1aa310  ! 608: LDD_I	ldd	[%r10 + 0x0310], %r6
	.word 0xc4aa900b  ! 609: STBA_R	stba	%r2, [%r10 + %r11] 0x80
	.word 0xcc6aa3c8  ! 610: LDSTUB_I	ldstub	%r6, [%r10 + 0x03c8]
	.word 0x30800003  ! 611: BA	ba,a	<label_0x3>
	.word 0xe8faaa54  ! 613: SWAPA_I	swapa	%r20, [%r10 + 0x0a54] %asi
	.word 0x8eda800b  ! 614: SMULcc_R	smulcc 	%r10, %r11, %r7
	.word 0xc48a900b  ! 615: LDUBA_R	lduba	[%r10, %r11] 0x80, %r2
	.word 0xa16a800b  ! 616: SDIVX_R	sdivx	%r10, %r11, %r16
	.word 0x8bdaa850  ! 617: FLUSH_I	dis not found

	.word 0xc49aa560  ! 618: LDDA_I	ldda	[%r10, + 0x0560] %asi, %r2
	.word 0x85daa660  ! 619: FLUSH_I	dis not found

	.word 0xc6a2a644  ! 620: STWA_I	stwa	%r3, [%r10 + 0x0644] %asi
	.word 0xc6d2900b  ! 621: LDSHA_R	ldsha	[%r10, %r11] 0x80, %r3
	.word 0xcc9aaa88  ! 622: LDDA_I	ldda	[%r10, + 0x0a88] %asi, %r6
	.word 0x82da800b  ! 623: SMULcc_R	smulcc 	%r10, %r11, %r1
	.word 0xc25a800b  ! 624: LDX_R	ldx	[%r10 + %r11], %r1
	.word 0xc36a800b  ! 625: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0xccf2900b  ! 626: STXA_R	stxa	%r6, [%r10 + %r11] 0x80
	.word 0xca7a800b  ! 627: SWAP_R	swap	%r5, [%r10 + %r11]
	.word 0x8e6aa474  ! 628: UDIVX_I	udivx 	%r10, 0x0474, %r7
	.word 0xe5e2a00b  ! 629: CASA_R	casa	[%r10] %asi, %r11, %r18
	.word 0x8143e02d  ! 630: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #MemIssue 
	.word 0x3a800001  ! 631: BCC	bcc,a	<label_0x1>
	.word 0x93da800b  ! 632: FLUSH_R	dis not found

	.word 0xc322a5c0  ! 633: STF_I	st	%f1, [0x05c0, %r10]
	.word 0xc322800b  ! 634: STF_R	st	%f1, [%r11, %r10]
	.word 0xc212800b  ! 635: LDUH_R	lduh	[%r10 + %r11], %r1
	.word 0xc6d2a0d8  ! 636: LDSHA_I	ldsha	[%r10, + 0x00d8] %asi, %r3
	.word 0x8143c000  ! 637: STBAR	stbar
	.word 0xc44aa050  ! 638: LDSB_I	ldsb	[%r10 + 0x0050], %r2
	.word 0x89daaf4c  ! 639: FLUSH_I	dis not found

	.word 0xdc9a900b  ! 640: LDDA_R	ldda	[%r10, %r11] 0x80, %r14
	.word 0x86fa800b  ! 641: SDIVcc_R	sdivcc 	%r10, %r11, %r3
	.word 0x9bda800b  ! 642: FLUSH_R	dis not found

	.word 0x0cc20001  ! 643: BRGZ	brgz  ,nt	%8,<label_0x20001>
	.word 0xf48aa0b4  ! 644: LDUBA_I	lduba	[%r10, + 0x00b4] %asi, %r26
	.word 0x3e800001  ! 645: BVC	bvc,a	<label_0x1>
	.word 0x8143e02f  ! 646: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #MemIssue 
	.word 0x8143c000  ! 647: STBAR	stbar
	.word 0x85a2892b  ! 648: FMULs	fmuls	%f10, %f11, %f2
	.word 0xc3eaa4e4  ! 649: PREFETCHA_I	prefetcha	[%r10, + 0x04e4] %asi, #one_read
	.word 0x8ba2882b  ! 650: FADDs	fadds	%f10, %f11, %f5
	.word 0xd2d2900b  ! 651: LDSHA_R	ldsha	[%r10, %r11] 0x80, %r9
	.word 0xba72800b  ! 652: UDIV_R	udiv 	%r10, %r11, %r29
	.word 0x83a2892b  ! 654: FMULs	fmuls	%f10, %f11, %f1
	.word 0x8272800b  ! 655: UDIV_R	udiv 	%r10, %r11, %r1
	.word 0x9af2a364  ! 656: UDIVcc_I	udivcc 	%r10, 0x0364, %r13
	.word 0xada288ab  ! 657: FSUBs	fsubs	%f10, %f11, %f22
	.word 0xe8d2a81c  ! 659: LDSHA_I	ldsha	[%r10, + 0x081c] %asi, %r20
	.word 0xfcb2af54  ! 660: STHA_I	stha	%r30, [%r10 + 0x0f54] %asi
	.word 0x86faa170  ! 661: SDIVcc_I	sdivcc 	%r10, 0x0170, %r3
	.word 0xebe2a00b  ! 662: CASA_R	casa	[%r10] %asi, %r11, %r21
	.word 0xce02800b  ! 663: LDUW_R	lduw	[%r10 + %r11], %r7
	.word 0x88faabd0  ! 664: SDIVcc_I	sdivcc 	%r10, 0x0bd0, %r4
	.word 0x02ca0001  ! 665: BRZ	brz  ,pt	%8,<label_0xa0001>
	.word 0x85a2882b  ! 666: FADDs	fadds	%f10, %f11, %f2
	.word 0xaa7aaabc  ! 667: SDIV_I	sdiv 	%r10, 0x0abc, %r21
	.word 0xb322ae98  ! 668: MULScc_I	mulscc 	%r10, 0x0e98, %r25
	.word 0xcb3aad30  ! 669: STDF_I	std	%f5, [0x0d30, %r10]
	.word 0x20800001  ! 670: BN	bn,a	<label_0x1>
	.word 0x8e52800b  ! 671: UMUL_R	umul 	%r10, %r11, %r7
	.word 0xba7aa330  ! 672: SDIV_I	sdiv 	%r10, 0x0330, %r29
	.word 0xb3a288ab  ! 673: FSUBs	fsubs	%f10, %f11, %f25
	.word 0xe7f2900b  ! 674: CASXA_I	casxa	[%r10] 0x80, %r11, %r19
	.word 0x896a800b  ! 675: SDIVX_R	sdivx	%r10, %r11, %r4
	.word 0xcc1a800b  ! 676: LDD_R	ldd	[%r10 + %r11], %r6
	.word 0xfc02a40c  ! 677: LDUW_I	lduw	[%r10 + 0x040c], %r30
	.word 0x8fdaa7b4  ! 678: FLUSH_I	dis not found

	.word 0xc3eaa42c  ! 679: PREFETCHA_I	prefetcha	[%r10, + 0x042c] %asi, #one_read
	.word 0x93da800b  ! 680: FLUSH_R	dis not found

	.word 0xce0aabc8  ! 681: LDUB_I	ldub	[%r10 + 0x0bc8], %r7
	.word 0xceb2a4a8  ! 682: STHA_I	stha	%r7, [%r10 + 0x04a8] %asi
	.word 0xceaa900b  ! 683: STBA_R	stba	%r7, [%r10 + %r11] 0x80
	.word 0xc642ac70  ! 684: LDSW_I	ldsw	[%r10 + 0x0c70], %r3
	.word 0xd3e2a00b  ! 685: CASA_R	casa	[%r10] %asi, %r11, %r9
	.word 0x0e800001  ! 686: BVS	bvs  	<label_0x1>
	.word 0xed3a800b  ! 687: STDF_R	std	%f22, [%r11, %r10]
	.word 0x0aca0001  ! 688: BRNZ	brnz  ,pt	%8,<label_0xa0001>
	.word 0x8c72a810  ! 689: UDIV_I	udiv 	%r10, 0x0810, %r6
	.word 0xd922800b  ! 690: STF_R	st	%f12, [%r11, %r10]
	.word 0xd2f2a280  ! 691: STXA_I	stxa	%r9, [%r10 + 0x0280] %asi
	.word 0xd292900b  ! 692: LDUHA_R	lduha	[%r10, %r11] 0x80, %r9
	.word 0x8143c000  ! 693: STBAR	stbar
	.word 0x864a800b  ! 694: MULX_R	mulx 	%r10, %r11, %r3
	.word 0xc36aa964  ! 695: PREFETCH_I	prefetch	[%r10 + 0x0964], #one_read
	.word 0xc24a800b  ! 696: LDSB_R	ldsb	[%r10 + %r11], %r1
	.word 0xe282900b  ! 697: LDUWA_R	lduwa	[%r10, %r11] 0x80, %r17
	.word 0x8a72800b  ! 698: UDIV_R	udiv 	%r10, %r11, %r5
	.word 0x9bda800b  ! 699: FLUSH_R	dis not found

	.word 0x8143c000  ! 700: STBAR	stbar
	.word 0xeacaa530  ! 701: LDSBA_I	ldsba	[%r10, + 0x0530] %asi, %r21
	.word 0xe7e2900b  ! 702: CASA_I	casa	[%r10] 0x80, %r11, %r19
	.word 0x22ca0001  ! 703: BRZ	brz,a,pt	%8,<label_0xa0001>
	.word 0x8143c000  ! 704: STBAR	stbar
	.word 0x8852a00c  ! 705: UMUL_I	umul 	%r10, 0x000c, %r4
	.word 0xceda900b  ! 706: LDXA_R	ldxa	[%r10, %r11] 0x80, %r7
	.word 0xdde2900b  ! 707: CASA_I	casa	[%r10] 0x80, %r11, %r14
	.word 0xe0d2900b  ! 708: LDSHA_R	ldsha	[%r10, %r11] 0x80, %r16
	.word 0x8522800b  ! 709: MULScc_R	mulscc 	%r10, %r11, %r2
	.word 0x8bda800b  ! 710: FLUSH_R	dis not found

	.word 0xc522800b  ! 711: STF_R	st	%f2, [%r11, %r10]
	.word 0x8143c000  ! 712: STBAR	stbar
	.word 0xd3e2900b  ! 713: CASA_I	casa	[%r10] 0x80, %r11, %r9
	.word 0x8143e06e  ! 714: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #MemIssue | #Sync 
	.word 0x844a800b  ! 715: MULX_R	mulx 	%r10, %r11, %r2
	.word 0x0e800003  ! 716: BVS	bvs  	<label_0x3>
	.word 0xcefa900b  ! 717: SWAPA_R	swapa	%r7, [%r10 + %r11] 0x80
	.word 0xd24a800b  ! 718: LDSB_R	ldsb	[%r10 + %r11], %r9
	.word 0x867aa060  ! 719: SDIV_I	sdiv 	%r10, 0x0060, %r3
	.word 0x91a2892b  ! 720: FMULs	fmuls	%f10, %f11, %f8
	.word 0xc93a800b  ! 721: STDF_R	std	%f4, [%r11, %r10]
	.word 0x26800003  ! 722: BL	bl,a	<label_0x3>
	.word 0xecdaaac0  ! 723: LDXA_I	ldxa	[%r10, + 0x0ac0] %asi, %r22
	.word 0xc36a800b  ! 724: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0xbaf2a128  ! 725: UDIVcc_I	udivcc 	%r10, 0x0128, %r29
	.word 0xce92900b  ! 726: LDUHA_R	lduha	[%r10, %r11] 0x80, %r7
	.word 0xbef2800b  ! 727: UDIVcc_R	udivcc 	%r10, %r11, %r31
	.word 0xf01a800b  ! 728: LDD_R	ldd	[%r10 + %r11], %r24
	.word 0xf4f2a708  ! 729: STXA_I	stxa	%r26, [%r10 + 0x0708] %asi
	.word 0x0a800001  ! 730: BCS	bcs  	<label_0x1>
	.word 0xfb22800b  ! 731: STF_R	st	%f29, [%r11, %r10]
	.word 0xd0c2900b  ! 732: LDSWA_R	ldswa	[%r10, %r11] 0x80, %r8
	.word 0xa3da800b  ! 733: FLUSH_R	dis not found

	.word 0x8143c000  ! 734: STBAR	stbar
	.word 0x83daa6ec  ! 735: FLUSH_I	dis not found

	.word 0xc36aac18  ! 736: PREFETCH_I	prefetch	[%r10 + 0x0c18], #one_read
	.word 0xcaca900b  ! 737: LDSBA_R	ldsba	[%r10, %r11] 0x80, %r5
	.word 0x2ac20001  ! 738: BRNZ	brnz,a,nt	%8,<label_0x20001>
	.word 0x8143c000  ! 739: STBAR	stbar
	.word 0xbdda800b  ! 740: FLUSH_R	dis not found

	.word 0x8da288ab  ! 741: FSUBs	fsubs	%f10, %f11, %f6
	.word 0xc66a800b  ! 742: LDSTUB_R	ldstub	%r3, [%r10 + %r11]
	.word 0x06ca0003  ! 743: BRLZ	brlz  ,pt	%8,<label_0xa0003>
	.word 0x8a72ac14  ! 744: UDIV_I	udiv 	%r10, 0x0c14, %r5
	.word 0xd2a2ac2c  ! 745: STWA_I	stwa	%r9, [%r10 + 0x0c2c] %asi
	.word 0x8852af0c  ! 746: UMUL_I	umul 	%r10, 0x0f0c, %r4
	.word 0x8ddaa680  ! 747: FLUSH_I	dis not found

	.word 0xc8faa624  ! 748: SWAPA_I	swapa	%r4, [%r10 + 0x0624] %asi
	.word 0xbda289ab  ! 749: FDIVs	fdivs	%f10, %f11, %f30
	.word 0xdeeaa250  ! 750: LDSTUBA_I	ldstuba	%r15, [%r10 + 0x0250] %asi
	.word 0xceea900b  ! 751: LDSTUBA_R	ldstuba	%r7, [%r10 + %r11] 0x80
	.word 0x87daa78c  ! 752: FLUSH_I	dis not found

	.word 0xe002800b  ! 753: LDUW_R	lduw	[%r10 + %r11], %r16
	.word 0x8143c000  ! 754: STBAR	stbar
	.word 0x8143e011  ! 755: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xc88a900b  ! 756: LDUBA_R	lduba	[%r10, %r11] 0x80, %r4
	.word 0x26800003  ! 757: BL	bl,a	<label_0x3>
	.word 0x8872a7f0  ! 758: UDIV_I	udiv 	%r10, 0x07f0, %r4
	.word 0xf6faa26c  ! 759: SWAPA_I	swapa	%r27, [%r10 + 0x026c] %asi
	.word 0xce12800b  ! 760: LDUH_R	lduh	[%r10 + %r11], %r7
	.word 0xc36a800b  ! 761: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0xf9e2900b  ! 762: CASA_I	casa	[%r10] 0x80, %r11, %r28
	.word 0x8c4aa544  ! 763: MULX_I	mulx 	%r10, 0x0544, %r6
	.word 0x92faa7dc  ! 764: SDIVcc_I	sdivcc 	%r10, 0x07dc, %r9
	.word 0xa2f2800b  ! 765: UDIVcc_R	udivcc 	%r10, %r11, %r17
	.word 0xecd2a43c  ! 766: LDSHA_I	ldsha	[%r10, + 0x043c] %asi, %r22
	.word 0x8143c000  ! 767: STBAR	stbar
	.word 0xc4aa900b  ! 768: STBA_R	stba	%r2, [%r10 + %r11] 0x80
	.word 0xe2b2900b  ! 769: STHA_R	stha	%r17, [%r10 + %r11] 0x80
	.word 0xe40aaa2c  ! 770: LDUB_I	ldub	[%r10 + 0x0a2c], %r18
	.word 0xf6aaa4b4  ! 771: STBA_I	stba	%r27, [%r10 + 0x04b4] %asi
	.word 0xcd3a800b  ! 772: STDF_R	std	%f6, [%r11, %r10]
	.word 0xf242800b  ! 773: LDSW_R	ldsw	[%r10 + %r11], %r25
	.word 0xbd6aada8  ! 774: SDIVX_I	sdivx	%r10, 0x0da8, %r30
	.word 0xc722800b  ! 775: STF_R	st	%f3, [%r11, %r10]
	.word 0xdf22800b  ! 776: STF_R	st	%f15, [%r11, %r10]
	.word 0x32800003  ! 777: BNE	bne,a	<label_0x3>
	.word 0xa04a800b  ! 778: MULX_R	mulx 	%r10, %r11, %r16
	.word 0x91da800b  ! 779: FLUSH_R	dis not found

	.word 0x06c20001  ! 780: BRLZ	brlz  ,nt	%8,<label_0x20001>
	.word 0xc3ea900b  ! 781: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0x987a800b  ! 782: SDIV_R	sdiv 	%r10, %r11, %r12
	.word 0x89a289ab  ! 783: FDIVs	fdivs	%f10, %f11, %f4
	.word 0xc86a800b  ! 784: LDSTUB_R	ldstub	%r4, [%r10 + %r11]
	.word 0xd09a900b  ! 786: LDDA_R	ldda	[%r10, %r11] 0x80, %r8
	.word 0x925aafc0  ! 787: SMUL_I	smul 	%r10, 0x0fc0, %r9
	.word 0x30800001  ! 788: BA	ba,a	<label_0x1>
	.word 0xb9a2892b  ! 789: FMULs	fmuls	%f10, %f11, %f28
	.word 0x8e52a10c  ! 790: UMUL_I	umul 	%r10, 0x010c, %r7
	.word 0x24800001  ! 791: BLE	ble,a	<label_0x1>
	.word 0x0ec20001  ! 792: BRGEZ	brgez  ,nt	%8,<label_0x20001>
	.word 0xc66aad5c  ! 793: LDSTUB_I	ldstub	%r3, [%r10 + 0x0d5c]
	.word 0x8a4a800b  ! 794: MULX_R	mulx 	%r10, %r11, %r5
	.word 0x9272ae20  ! 795: UDIV_I	udiv 	%r10, 0x0e20, %r9
	.word 0xcadaade8  ! 796: LDXA_I	ldxa	[%r10, + 0x0de8] %asi, %r5
	.word 0xe04a800b  ! 797: LDSB_R	ldsb	[%r10 + %r11], %r16
	.word 0xfaaaabcc  ! 798: STBA_I	stba	%r29, [%r10 + 0x0bcc] %asi
	.word 0xd0b2aa3c  ! 799: STHA_I	stha	%r8, [%r10 + 0x0a3c] %asi
	.word 0xbbdaaef8  ! 800: FLUSH_I	dis not found

	.word 0xc8f2900b  ! 801: STXA_R	stxa	%r4, [%r10 + %r11] 0x80
	.word 0xe13aa288  ! 802: STDF_I	std	%f16, [0x0288, %r10]
	.word 0xf41aa8c8  ! 803: LDD_I	ldd	[%r10 + 0x08c8], %r26
	.word 0xa452ab28  ! 804: UMUL_I	umul 	%r10, 0x0b28, %r18
	.word 0x1c800003  ! 805: BPOS	bpos  	<label_0x3>
	.word 0x34800001  ! 806: BG	bg,a	<label_0x1>
	.word 0x904aa19c  ! 807: MULX_I	mulx 	%r10, 0x019c, %r8
	.word 0xcc1a800b  ! 808: LDD_R	ldd	[%r10 + %r11], %r6
	.word 0xcb3aa3f0  ! 809: STDF_I	std	%f5, [0x03f0, %r10]
	.word 0xce8a900b  ! 810: LDUBA_R	lduba	[%r10, %r11] 0x80, %r7
	.word 0x84f2a04c  ! 811: UDIVcc_I	udivcc 	%r10, 0x004c, %r2
	.word 0xc26aa31c  ! 812: LDSTUB_I	ldstub	%r1, [%r10 + 0x031c]
	.word 0x91daa590  ! 813: FLUSH_I	dis not found

	.word 0x91daab64  ! 814: FLUSH_I	dis not found

	.word 0xc3eaae4c  ! 815: PREFETCHA_I	prefetcha	[%r10, + 0x0e4c] %asi, #one_read
	.word 0xa67a800b  ! 816: SDIV_R	sdiv 	%r10, %r11, %r19
	.word 0x2aca0003  ! 817: BRNZ	brnz,a,pt	%8,<label_0xa0003>
	.word 0x93a2882b  ! 818: FADDs	fadds	%f10, %f11, %f9
	.word 0x8e7aaaf4  ! 819: SDIV_I	sdiv 	%r10, 0x0af4, %r7
	.word 0xe09aa480  ! 820: LDDA_I	ldda	[%r10, + 0x0480] %asi, %r16
	.word 0xd0faa5d0  ! 821: SWAPA_I	swapa	%r8, [%r10 + 0x05d0] %asi
	.word 0xc892900b  ! 822: LDUHA_R	lduha	[%r10, %r11] 0x80, %r4
	.word 0x85a289ab  ! 823: FDIVs	fdivs	%f10, %f11, %f2
	.word 0x8afa800b  ! 825: SDIVcc_R	sdivcc 	%r10, %r11, %r5
	.word 0x83da800b  ! 826: FLUSH_R	dis not found

	.word 0xf27a800b  ! 827: SWAP_R	swap	%r25, [%r10 + %r11]
	.word 0xce8aa330  ! 828: LDUBA_I	lduba	[%r10, + 0x0330] %asi, %r7
	.word 0xac6aaf44  ! 829: UDIVX_I	udivx 	%r10, 0x0f44, %r22
	.word 0x996aacbc  ! 830: SDIVX_I	sdivx	%r10, 0x0cbc, %r12
	.word 0xe66aa530  ! 831: LDSTUB_I	ldstub	%r19, [%r10 + 0x0530]
	.word 0xc4daacf8  ! 832: LDXA_I	ldxa	[%r10, + 0x0cf8] %asi, %r2
	.word 0xbddaa634  ! 833: FLUSH_I	dis not found

	.word 0x8e72aca4  ! 834: UDIV_I	udiv 	%r10, 0x0ca4, %r7
	.word 0xf28a900b  ! 835: LDUBA_R	lduba	[%r10, %r11] 0x80, %r25
	.word 0x845aae1c  ! 836: SMUL_I	smul 	%r10, 0x0e1c, %r2
	.word 0x8bda800b  ! 837: FLUSH_R	dis not found

	.word 0x30800001  ! 838: BA	ba,a	<label_0x1>
	.word 0xd07a800b  ! 839: SWAP_R	swap	%r8, [%r10 + %r11]
	.word 0xac7a800b  ! 840: SDIV_R	sdiv 	%r10, %r11, %r22
	.word 0x1a800001  ! 841: BCC	bcc  	<label_0x1>
	.word 0xe2ea900b  ! 842: LDSTUBA_R	ldstuba	%r17, [%r10 + %r11] 0x80
	.word 0xcb22a954  ! 843: STF_I	st	%f5, [0x0954, %r10]
	.word 0x2cca0003  ! 844: BRGZ	brgz,a,pt	%8,<label_0xa0003>
	.word 0xf0d2a7ec  ! 845: LDSHA_I	ldsha	[%r10, + 0x07ec] %asi, %r24
	.word 0xf7f2a00b  ! 846: CASXA_R	casxa	[%r10]%asi, %r11, %r27
	.word 0xaddaa398  ! 847: FLUSH_I	dis not found

	.word 0x92f2ad8c  ! 848: UDIVcc_I	udivcc 	%r10, 0x0d8c, %r9
	.word 0xc36aa654  ! 849: PREFETCH_I	prefetch	[%r10 + 0x0654], #one_read
	.word 0x8143c000  ! 850: STBAR	stbar
	.word 0xf48aae58  ! 851: LDUBA_I	lduba	[%r10, + 0x0e58] %asi, %r26
	.word 0x8143c000  ! 852: STBAR	stbar
	.word 0xd2c2aa48  ! 853: LDSWA_I	ldswa	[%r10, + 0x0a48] %asi, %r9
	.word 0xd0ba900b  ! 854: STDA_R	stda	%r8, [%r10 + %r11] 0x80
	.word 0x8143e034  ! 855: MEMBAR	membar	#LoadStore | #Lookaside | #MemIssue 
	.word 0xc6ea900b  ! 856: LDSTUBA_R	ldstuba	%r3, [%r10 + %r11] 0x80
	.word 0x884aa128  ! 857: MULX_I	mulx 	%r10, 0x0128, %r4
	.word 0x83a289ab  ! 858: FDIVs	fdivs	%f10, %f11, %f1
	.word 0xfa8aada0  ! 859: LDUBA_I	lduba	[%r10, + 0x0da0] %asi, %r29
	.word 0x825a800b  ! 861: SMUL_R	smul 	%r10, %r11, %r1
	.word 0x04c20001  ! 862: BRLEZ	brlez  ,nt	%8,<label_0x20001>
	.word 0xfed2900b  ! 863: LDSHA_R	ldsha	[%r10, %r11] 0x80, %r31
	.word 0xc2da900b  ! 864: LDXA_R	ldxa	[%r10, %r11] 0x80, %r1
	.word 0x87a289ab  ! 865: FDIVs	fdivs	%f10, %f11, %f3
	.word 0xf6b2a084  ! 866: STHA_I	stha	%r27, [%r10 + 0x0084] %asi
	.word 0x0c800001  ! 867: BNEG	bneg  	<label_0x1>
	.word 0x8cdaaf30  ! 868: SMULcc_I	smulcc 	%r10, 0x0f30, %r6
	.word 0xe00aafb0  ! 869: LDUB_I	ldub	[%r10 + 0x0fb0], %r16
	.word 0x8143c000  ! 870: STBAR	stbar
	.word 0xfca2a2fc  ! 871: STWA_I	stwa	%r30, [%r10 + 0x02fc] %asi
	.word 0xb5daae64  ! 872: FLUSH_I	dis not found

	.word 0xbdda800b  ! 873: FLUSH_R	dis not found

	.word 0x856aa1e8  ! 874: SDIVX_I	sdivx	%r10, 0x01e8, %r2
	.word 0xeceaa28c  ! 875: LDSTUBA_I	ldstuba	%r22, [%r10 + 0x028c] %asi
	.word 0xc68aa49c  ! 876: LDUBA_I	lduba	[%r10, + 0x049c] %asi, %r3
	.word 0x906a800b  ! 877: UDIVX_R	udivx 	%r10, %r11, %r8
	.word 0xdafa900b  ! 878: SWAPA_R	swapa	%r13, [%r10 + %r11] 0x80
	.word 0x8c52800b  ! 879: UMUL_R	umul 	%r10, %r11, %r6
	.word 0xdc1aa200  ! 880: LDD_I	ldd	[%r10 + 0x0200], %r14
	.word 0x8143e050  ! 881: MEMBAR	membar	#Lookaside | #Sync 
	.word 0x8cf2800b  ! 882: UDIVcc_R	udivcc 	%r10, %r11, %r6
	.word 0xcb3a800b  ! 883: STDF_R	std	%f5, [%r11, %r10]
	.word 0xc522a0e4  ! 884: STF_I	st	%f2, [0x00e4, %r10]
	.word 0x8143e03c  ! 885: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0xc4ba900b  ! 886: STDA_R	stda	%r2, [%r10 + %r11] 0x80
	.word 0xc2f2900b  ! 887: STXA_R	stxa	%r1, [%r10 + %r11] 0x80
	.word 0xcb22800b  ! 888: STF_R	st	%f5, [%r11, %r10]
	.word 0xc53a800b  ! 889: STDF_R	std	%f2, [%r11, %r10]
	.word 0x3e800003  ! 890: BVC	bvc,a	<label_0x3>
	.word 0xba4a800b  ! 891: MULX_R	mulx 	%r10, %r11, %r29
	.word 0xc882ae44  ! 892: LDUWA_I	lduwa	[%r10, + 0x0e44] %asi, %r4
	.word 0xc3eaa310  ! 893: PREFETCHA_I	prefetcha	[%r10, + 0x0310] %asi, #one_read
	.word 0xafdaa91c  ! 894: FLUSH_I	dis not found

	.word 0x24c20001  ! 895: BRLEZ	brlez,a,nt	%8,<label_0x20001>
	.word 0xf012800b  ! 896: LDUH_R	lduh	[%r10 + %r11], %r24
	.word 0xaa72800b  ! 897: UDIV_R	udiv 	%r10, %r11, %r21
	.word 0x8852800b  ! 898: UMUL_R	umul 	%r10, %r11, %r4
	.word 0xcc6a800b  ! 899: LDSTUB_R	ldstub	%r6, [%r10 + %r11]
	.word 0x8143c000  ! 901: STBAR	stbar
	.word 0x8da288ab  ! 902: FSUBs	fsubs	%f10, %f11, %f6
	.word 0xada2892b  ! 903: FMULs	fmuls	%f10, %f11, %f22
	.word 0xf9f2900b  ! 904: CASXA_I	casxa	[%r10] 0x80, %r11, %r28
	.word 0xdc02a6a8  ! 905: LDUW_I	lduw	[%r10 + 0x06a8], %r14
	.word 0xbefa800b  ! 906: SDIVcc_R	sdivcc 	%r10, %r11, %r31
	.word 0x84daa414  ! 907: SMULcc_I	smulcc 	%r10, 0x0414, %r2
	.word 0x3a800001  ! 908: BCC	bcc,a	<label_0x1>
	.word 0xc922a328  ! 909: STF_I	st	%f4, [0x0328, %r10]
	.word 0x83da800b  ! 910: FLUSH_R	dis not found

	.word 0x83da800b  ! 911: FLUSH_R	dis not found

	.word 0x8143e005  ! 912: MEMBAR	membar	#LoadLoad | #LoadStore 
	.word 0x83da800b  ! 913: FLUSH_R	dis not found

	.word 0xc322800b  ! 914: STF_R	st	%f1, [%r11, %r10]
	.word 0x8143e021  ! 915: MEMBAR	membar	#LoadLoad | #MemIssue 
	.word 0x8143e057  ! 916: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside | #Sync 
	.word 0xc3eaaad8  ! 917: PREFETCHA_I	prefetcha	[%r10, + 0x0ad8] %asi, #one_read
	.word 0xf2a2900b  ! 918: STWA_R	stwa	%r25, [%r10 + %r11] 0x80
	.word 0x8ef2af34  ! 919: UDIVcc_I	udivcc 	%r10, 0x0f34, %r7
	.word 0xc8ba900b  ! 920: STDA_R	stda	%r4, [%r10 + %r11] 0x80
	.word 0x84d2800b  ! 921: UMULcc_R	umulcc 	%r10, %r11, %r2
	.word 0x91da800b  ! 922: FLUSH_R	dis not found

	.word 0xc6b2900b  ! 923: STHA_R	stha	%r3, [%r10 + %r11] 0x80
	.word 0x83da800b  ! 924: FLUSH_R	dis not found

	.word 0xc86aa97c  ! 925: LDSTUB_I	ldstub	%r4, [%r10 + 0x097c]
	.word 0xc86a800b  ! 926: LDSTUB_R	ldstub	%r4, [%r10 + %r11]
	.word 0xd0ba900b  ! 927: STDA_R	stda	%r8, [%r10 + %r11] 0x80
	.word 0x825aa5f8  ! 928: SMUL_I	smul 	%r10, 0x05f8, %r1
	.word 0x886a800b  ! 929: UDIVX_R	udivx 	%r10, %r11, %r4
	.word 0xfec2900b  ! 930: LDSWA_R	ldswa	[%r10, %r11] 0x80, %r31
	.word 0xc36aa87c  ! 931: PREFETCH_I	prefetch	[%r10 + 0x087c], #one_read
	.word 0xc2faa4c8  ! 932: SWAPA_I	swapa	%r1, [%r10 + 0x04c8] %asi
	.word 0xce7aab2c  ! 933: SWAP_I	swap	%r7, [%r10 + 0x0b2c]
	.word 0xd93aae78  ! 934: STDF_I	std	%f12, [0x0e78, %r10]
	.word 0xc452a574  ! 935: LDSH_I	ldsh	[%r10 + 0x0574], %r2
	.word 0xdef2aab8  ! 938: STXA_I	stxa	%r15, [%r10 + 0x0ab8] %asi
	.word 0x8143c000  ! 939: STBAR	stbar
	.word 0x887aa704  ! 940: SDIV_I	sdiv 	%r10, 0x0704, %r4
	.word 0x24800001  ! 941: BLE	ble,a	<label_0x1>
	.word 0xca12a8f4  ! 942: LDUH_I	lduh	[%r10 + 0x08f4], %r5
	.word 0xccd2900b  ! 943: LDSHA_R	ldsha	[%r10, %r11] 0x80, %r6
	.word 0x91a2892b  ! 944: FMULs	fmuls	%f10, %f11, %f8
	.word 0x926a800b  ! 945: UDIVX_R	udivx 	%r10, %r11, %r9
	.word 0xf8fa900b  ! 946: SWAPA_R	swapa	%r28, [%r10 + %r11] 0x80
	.word 0x8afa800b  ! 947: SDIVcc_R	sdivcc 	%r10, %r11, %r5
	.word 0x9fdaa374  ! 948: FLUSH_I	dis not found

	.word 0x8c4aa5a4  ! 949: MULX_I	mulx 	%r10, 0x05a4, %r6
	.word 0x865aa78c  ! 950: SMUL_I	smul 	%r10, 0x078c, %r3
	.word 0x8143c000  ! 951: STBAR	stbar
	.word 0x87a288ab  ! 952: FSUBs	fsubs	%f10, %f11, %f3
	.word 0xcde2900b  ! 953: CASA_I	casa	[%r10] 0x80, %r11, %r6
	.word 0x8e6aa248  ! 954: UDIVX_I	udivx 	%r10, 0x0248, %r7
	.word 0x8143c000  ! 955: STBAR	stbar
	.word 0xd242a42c  ! 956: LDSW_I	ldsw	[%r10 + 0x042c], %r9
	.word 0xd06a800b  ! 957: LDSTUB_R	ldstub	%r8, [%r10 + %r11]
	.word 0x87daa7ac  ! 958: FLUSH_I	dis not found

	.word 0xbfdaace4  ! 959: FLUSH_I	dis not found

	.word 0x8143c000  ! 960: STBAR	stbar
	.word 0x91daaa64  ! 961: FLUSH_I	dis not found

	.word 0xa922add8  ! 962: MULScc_I	mulscc 	%r10, 0x0dd8, %r20
	.word 0xc36a800b  ! 963: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x83a288ab  ! 964: FSUBs	fsubs	%f10, %f11, %f1
	.word 0xf0c2900b  ! 965: LDSWA_R	ldswa	[%r10, %r11] 0x80, %r24
	.word 0xce6a800b  ! 966: LDSTUB_R	ldstub	%r7, [%r10 + %r11]
	.word 0xc7f2900b  ! 967: CASXA_I	casxa	[%r10] 0x80, %r11, %r3
	.word 0x1a800001  ! 968: BCC	bcc  	<label_0x1>
	.word 0xc4a2900b  ! 969: STWA_R	stwa	%r2, [%r10 + %r11] 0x80
	.word 0xd082af10  ! 970: LDUWA_I	lduwa	[%r10, + 0x0f10] %asi, %r8
	.word 0xbefa800b  ! 971: SDIVcc_R	sdivcc 	%r10, %r11, %r31
	.word 0x26800001  ! 973: BL	bl,a	<label_0x1>
	.word 0x1c800001  ! 974: BPOS	bpos  	<label_0x1>
	.word 0xe73aa238  ! 975: STDF_I	std	%f19, [0x0238, %r10]
	.word 0x8143c000  ! 976: STBAR	stbar
	.word 0xdedaa438  ! 977: LDXA_I	ldxa	[%r10, + 0x0438] %asi, %r15
	.word 0x8dda800b  ! 978: FLUSH_R	dis not found

	.word 0x8143e053  ! 979: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside | #Sync 
	.word 0xc842a2f4  ! 980: LDSW_I	ldsw	[%r10 + 0x02f4], %r4
	.word 0x8e4a800b  ! 981: MULX_R	mulx 	%r10, %r11, %r7
	.word 0x8e52a89c  ! 982: UMUL_I	umul 	%r10, 0x089c, %r7
	.word 0xe012aa44  ! 983: LDUH_I	lduh	[%r10 + 0x0a44], %r16
	.word 0xc6fa900b  ! 984: SWAPA_R	swapa	%r3, [%r10 + %r11] 0x80
	.word 0x04c20001  ! 985: BRLEZ	brlez  ,nt	%8,<label_0x20001>
	.word 0x9ed2afac  ! 986: UMULcc_I	umulcc 	%r10, 0x0fac, %r15
	.word 0xbba2892b  ! 987: FMULs	fmuls	%f10, %f11, %f29
	.word 0xc09a900b  ! 988: LDDA_R	ldda	[%r10, %r11] 0x80, %r0
	.word 0xa272a4c8  ! 989: UDIV_I	udiv 	%r10, 0x04c8, %r17
	.word 0xb65a800b  ! 990: SMUL_R	smul 	%r10, %r11, %r27
	.word 0x90da800b  ! 991: SMULcc_R	smulcc 	%r10, %r11, %r8
	.word 0x8fda800b  ! 992: FLUSH_R	dis not found

	.word 0xbda2882b  ! 993: FADDs	fadds	%f10, %f11, %f30
	.word 0xc3eaa654  ! 994: PREFETCHA_I	prefetcha	[%r10, + 0x0654] %asi, #one_read
	.word 0xc892900b  ! 995: LDUHA_R	lduha	[%r10, %r11] 0x80, %r4
	.word 0x87a288ab  ! 996: FSUBs	fsubs	%f10, %f11, %f3
	.word 0x38800001  ! 998: BGU	bgu,a	<label_0x1>
	.word 0xc28aae34  ! 999: LDUBA_I	lduba	[%r10, + 0x0e34] %asi, %r1
	nop
	nop
	nop
        ta      T_GOOD_TRAP
th_main_2:
        setx  MAIN_BASE_DATA_VA, %r1, %r10
        setx  0x0000000000000350, %g1, %r11
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
        setx  0x542b2bd2d87489e1, %g1, %r0
        setx  0x7b8e60d1785bc2e7, %g1, %r1
        setx  0xa1b287d6dfd57730, %g1, %r2
        setx  0xfd691a8c554e3d11, %g1, %r3
        setx  0x752da8edbcdd62e6, %g1, %r4
        setx  0x8321744ffd8f98ce, %g1, %r5
        setx  0xa2b70fdf9f46b135, %g1, %r6
        setx  0x1b8da7865c0722fb, %g1, %r7
        setx  0xaa6093848ad4b5dd, %g1, %r8
        setx  0xc4a24eeca2ebbb2f, %g1, %r9
        setx  0x63e538d2248f6336, %g1, %r12
        setx  0xd3c84d230255e7a5, %g1, %r13
        setx  0xeedf34b7bdb0c5c5, %g1, %r14
        setx  0xb626040eb904037d, %g1, %r15
        setx  0xa9cd4192de69cfff, %g1, %r16
        setx  0xb13d02b2b66d9240, %g1, %r17
        setx  0x1cad8aae58578de1, %g1, %r18
        setx  0x5ba3fe2ef17dfaf5, %g1, %r19
        setx  0xdc11c31e6e5adc1f, %g1, %r20
        setx  0x01766ada68d258f5, %g1, %r21
        setx  0xf535c46a922344ce, %g1, %r22
        setx  0xe342a26b0c525050, %g1, %r23
        setx  0x10f67ea596806b7d, %g1, %r24
        setx  0xb3b30743eaf540f3, %g1, %r25
        setx  0x68b7a3eeb21edc10, %g1, %r26
        setx  0x58e47e946aa1a723, %g1, %r27
        setx  0x598feda0d21fc30a, %g1, %r28
        setx  0x2aaa538b9dfba7a5, %g1, %r29
        setx  0xdf3052992767cc42, %g1, %r30
        setx  0xc59acb4cc52014bd, %g1, %r31
	.word 0xcef2a730  ! 5: STXA_I	stxa	%r7, [%r10 + 0x0730] %asi
	.word 0xf6b2a18c  ! 6: STHA_I	stha	%r27, [%r10 + 0x018c] %asi
	.word 0xe612800b  ! 8: LDUH_R	lduh	[%r10 + %r11], %r19
	.word 0xf0ba900b  ! 9: STDA_R	stda	%r24, [%r10 + %r11] 0x80
	.word 0x8143e00b  ! 10: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore 
	.word 0xceda900b  ! 11: LDXA_R	ldxa	[%r10, %r11] 0x80, %r7
	.word 0xa3da800b  ! 12: FLUSH_R	dis not found

	.word 0xd09a900b  ! 13: LDDA_R	ldda	[%r10, %r11] 0x80, %r8
	.word 0xc81aafe0  ! 14: LDD_I	ldd	[%r10 + 0x0fe0], %r4
	.word 0xaefaaec0  ! 15: SDIVcc_I	sdivcc 	%r10, 0x0ec0, %r23
	.word 0x06800003  ! 16: BL	bl  	<label_0x3>
	.word 0x8143e06a  ! 17: MEMBAR	membar	#StoreLoad | #StoreStore | #MemIssue | #Sync 
	.word 0xf60aac44  ! 18: LDUB_I	ldub	[%r10 + 0x0c44], %r27
	.word 0xf01aa5d0  ! 19: LDD_I	ldd	[%r10 + 0x05d0], %r24
	.word 0xc20a800b  ! 20: LDUB_R	ldub	[%r10 + %r11], %r1
	.word 0xc8faa378  ! 21: SWAPA_I	swapa	%r4, [%r10 + 0x0378] %asi
	.word 0x82daac58  ! 22: SMULcc_I	smulcc 	%r10, 0x0c58, %r1
	.word 0xcc1a800b  ! 23: LDD_R	ldd	[%r10 + %r11], %r6
	.word 0xc60aa0e8  ! 24: LDUB_I	ldub	[%r10 + 0x00e8], %r3
	.word 0xaaf2800b  ! 25: UDIVcc_R	udivcc 	%r10, %r11, %r21
	.word 0x86f2800b  ! 26: UDIVcc_R	udivcc 	%r10, %r11, %r3
	.word 0xcdf2a00b  ! 27: CASXA_R	casxa	[%r10]%asi, %r11, %r6
	.word 0x8143e030  ! 28: MEMBAR	membar	#Lookaside | #MemIssue 
	.word 0x866aa0f0  ! 29: UDIVX_I	udivx 	%r10, 0x00f0, %r3
	.word 0x9072800b  ! 30: UDIV_R	udiv 	%r10, %r11, %r8
	.word 0x896aa2e0  ! 31: SDIVX_I	sdivx	%r10, 0x02e0, %r4
	.word 0xb5a2892b  ! 32: FMULs	fmuls	%f10, %f11, %f26
	.word 0x8e7aa1c8  ! 33: SDIV_I	sdiv 	%r10, 0x01c8, %r7
	.word 0xa5da800b  ! 34: FLUSH_R	dis not found

	.word 0x8143c000  ! 35: STBAR	stbar
	.word 0x87a288ab  ! 36: FSUBs	fsubs	%f10, %f11, %f3
	.word 0x8143e02e  ! 37: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #MemIssue 
	.word 0xcd3aaa18  ! 38: STDF_I	std	%f6, [0x0a18, %r10]
	.word 0xcaaa900b  ! 39: STBA_R	stba	%r5, [%r10 + %r11] 0x80
	.word 0xe0a2900b  ! 40: STWA_R	stwa	%r16, [%r10 + %r11] 0x80
	.word 0x8f6aa874  ! 41: SDIVX_I	sdivx	%r10, 0x0874, %r7
	.word 0xc93aa9d0  ! 42: STDF_I	std	%f4, [0x09d0, %r10]
	.word 0xd27a800b  ! 43: SWAP_R	swap	%r9, [%r10 + %r11]
	.word 0xca12affc  ! 44: LDUH_I	lduh	[%r10 + 0x0ffc], %r5
	.word 0xc2a2900b  ! 45: STWA_R	stwa	%r1, [%r10 + %r11] 0x80
	.word 0xc36aa064  ! 46: PREFETCH_I	prefetch	[%r10 + 0x0064], #one_read
	.word 0xcbf2a00b  ! 47: CASXA_R	casxa	[%r10]%asi, %r11, %r5
	.word 0xcde2900b  ! 48: CASA_I	casa	[%r10] 0x80, %r11, %r6
	.word 0xbbdaa4ac  ! 49: FLUSH_I	dis not found

	.word 0xfcb2900b  ! 50: STHA_R	stha	%r30, [%r10 + %r11] 0x80
	.word 0xe8da900b  ! 51: LDXA_R	ldxa	[%r10, %r11] 0x80, %r20
	.word 0x987aabcc  ! 52: SDIV_I	sdiv 	%r10, 0x0bcc, %r12
	.word 0xdaf2900b  ! 53: STXA_R	stxa	%r13, [%r10 + %r11] 0x80
	.word 0x8fa2892b  ! 54: FMULs	fmuls	%f10, %f11, %f7
	.word 0xc6fa900b  ! 55: SWAPA_R	swapa	%r3, [%r10 + %r11] 0x80
	.word 0xc3f2a00b  ! 56: CASXA_R	casxa	[%r10]%asi, %r11, %r1
	.word 0xc492900b  ! 57: LDUHA_R	lduha	[%r10, %r11] 0x80, %r2
	.word 0xc64aae4c  ! 58: LDSB_I	ldsb	[%r10 + 0x0e4c], %r3
	.word 0xe2b2900b  ! 59: STHA_R	stha	%r17, [%r10 + %r11] 0x80
	.word 0xd322a66c  ! 60: STF_I	st	%f9, [0x066c, %r10]
	.word 0xcc9aa948  ! 61: LDDA_I	ldda	[%r10, + 0x0948] %asi, %r6
	.word 0xfceaa650  ! 62: LDSTUBA_I	ldstuba	%r30, [%r10 + 0x0650] %asi
	.word 0x8143e01c  ! 63: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside 
	.word 0xc442800b  ! 64: LDSW_R	ldsw	[%r10 + %r11], %r2
	.word 0x906a800b  ! 65: UDIVX_R	udivx 	%r10, %r11, %r8
	.word 0x927a800b  ! 66: SDIV_R	sdiv 	%r10, %r11, %r9
	.word 0xc36a800b  ! 67: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0xa1da800b  ! 68: FLUSH_R	dis not found

	.word 0x8143c000  ! 69: STBAR	stbar
	.word 0xd8fa900b  ! 70: SWAPA_R	swapa	%r12, [%r10 + %r11] 0x80
	.word 0xa9da800b  ! 71: FLUSH_R	dis not found

	.word 0xccfaa400  ! 72: SWAPA_I	swapa	%r6, [%r10 + 0x0400] %asi
	.word 0xb3da800b  ! 73: FLUSH_R	dis not found

	.word 0xd0c2ac10  ! 74: LDSWA_I	ldswa	[%r10, + 0x0c10] %asi, %r8
	.word 0xc2c2900b  ! 75: LDSWA_R	ldswa	[%r10, %r11] 0x80, %r1
	.word 0x9bdaa280  ! 76: FLUSH_I	dis not found

	.word 0xe8aa900b  ! 77: STBA_R	stba	%r20, [%r10 + %r11] 0x80
	.word 0x8143e00a  ! 78: MEMBAR	membar	#StoreLoad | #StoreStore 
	.word 0xc3eaa29c  ! 79: PREFETCHA_I	prefetcha	[%r10, + 0x029c] %asi, #one_read
	.word 0xc2da900b  ! 80: LDXA_R	ldxa	[%r10, %r11] 0x80, %r1
	.word 0x8a72a7a0  ! 81: UDIV_I	udiv 	%r10, 0x07a0, %r5
	.word 0xd2aaac5c  ! 82: STBA_I	stba	%r9, [%r10 + 0x0c5c] %asi
	.word 0xa852a9a4  ! 83: UMUL_I	umul 	%r10, 0x09a4, %r20
	.word 0x8143c000  ! 84: STBAR	stbar
	.word 0x8143c000  ! 85: STBAR	stbar
	.word 0xc242800b  ! 86: LDSW_R	ldsw	[%r10 + %r11], %r1
	.word 0x9922abe0  ! 87: MULScc_I	mulscc 	%r10, 0x0be0, %r12
	.word 0x8143c000  ! 88: STBAR	stbar
	.word 0xcf3aaeb8  ! 89: STDF_I	std	%f7, [0x0eb8, %r10]
	.word 0x8143c000  ! 90: STBAR	stbar
	.word 0x86fa800b  ! 91: SDIVcc_R	sdivcc 	%r10, %r11, %r3
	.word 0x8e52aa68  ! 92: UMUL_I	umul 	%r10, 0x0a68, %r7
	.word 0x8143c000  ! 93: STBAR	stbar
	.word 0xce52800b  ! 94: LDSH_R	ldsh	[%r10 + %r11], %r7
	.word 0xd0c2a9c4  ! 95: LDSWA_I	ldswa	[%r10, + 0x09c4] %asi, %r8
	.word 0xc3eaa288  ! 96: PREFETCHA_I	prefetcha	[%r10, + 0x0288] %asi, #one_read
	.word 0xcb3aaa70  ! 97: STDF_I	std	%f5, [0x0a70, %r10]
	.word 0xa3daa8c4  ! 98: FLUSH_I	dis not found

	.word 0x16800001  ! 99: BGE	bge  	<label_0x1>
	.word 0xd0d2aed4  ! 100: LDSHA_I	ldsha	[%r10, + 0x0ed4] %asi, %r8
	.word 0xc8c2a554  ! 101: LDSWA_I	ldswa	[%r10, + 0x0554] %asi, %r4
	.word 0x8a7aad20  ! 102: SDIV_I	sdiv 	%r10, 0x0d20, %r5
	.word 0x92f2800b  ! 103: UDIVcc_R	udivcc 	%r10, %r11, %r9
	.word 0xe47a800b  ! 104: SWAP_R	swap	%r18, [%r10 + %r11]
	.word 0x8bdaa564  ! 105: FLUSH_I	dis not found

	.word 0x8ddaaddc  ! 106: FLUSH_I	dis not found

	.word 0x8ba289ab  ! 107: FDIVs	fdivs	%f10, %f11, %f5
	.word 0xc36a800b  ! 108: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0xa7daabcc  ! 109: FLUSH_I	dis not found

	.word 0xcc42800b  ! 111: LDSW_R	ldsw	[%r10 + %r11], %r6
	.word 0xcb22a5cc  ! 113: STF_I	st	%f5, [0x05cc, %r10]
	.word 0xe012800b  ! 114: LDUH_R	lduh	[%r10 + %r11], %r16
	.word 0xe4ea900b  ! 115: LDSTUBA_R	ldstuba	%r18, [%r10 + %r11] 0x80
	.word 0x1e800003  ! 116: BVC	bvc  	<label_0x3>
	.word 0x8143c000  ! 117: STBAR	stbar
	.word 0xd00a800b  ! 118: LDUB_R	ldub	[%r10 + %r11], %r8
	.word 0x2c800001  ! 120: BNEG	bneg,a	<label_0x1>
	.word 0x9bda800b  ! 121: FLUSH_R	dis not found

	.word 0xc4fa900b  ! 122: SWAPA_R	swapa	%r2, [%r10 + %r11] 0x80
	.word 0x83daa2bc  ! 123: FLUSH_I	dis not found

	.word 0xc3ea900b  ! 124: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0x9a5aa3d8  ! 125: SMUL_I	smul 	%r10, 0x03d8, %r13
	.word 0xe8aa900b  ! 126: STBA_R	stba	%r20, [%r10 + %r11] 0x80
	.word 0xd082900b  ! 127: LDUWA_R	lduwa	[%r10, %r11] 0x80, %r8
	.word 0x88f2800b  ! 128: UDIVcc_R	udivcc 	%r10, %r11, %r4
	.word 0x825aa9cc  ! 131: SMUL_I	smul 	%r10, 0x09cc, %r1
	.word 0x83daa5cc  ! 132: FLUSH_I	dis not found

	.word 0x8143c000  ! 133: STBAR	stbar
	.word 0xca8a900b  ! 134: LDUBA_R	lduba	[%r10, %r11] 0x80, %r5
	.word 0x8143c000  ! 135: STBAR	stbar
	.word 0x88d2800b  ! 136: UMULcc_R	umulcc 	%r10, %r11, %r4
	.word 0xdafaa3a0  ! 137: SWAPA_I	swapa	%r13, [%r10 + 0x03a0] %asi
	.word 0x20800003  ! 138: BN	bn,a	<label_0x3>
	.word 0x8143c000  ! 139: STBAR	stbar
	.word 0xc6aaa594  ! 140: STBA_I	stba	%r3, [%r10 + 0x0594] %asi
	.word 0xe4ea900b  ! 141: LDSTUBA_R	ldstuba	%r18, [%r10 + %r11] 0x80
	.word 0xc2a2a174  ! 142: STWA_I	stwa	%r1, [%r10 + 0x0174] %asi
	.word 0x93daa814  ! 143: FLUSH_I	dis not found

	.word 0xd8aaad70  ! 144: STBA_I	stba	%r12, [%r10 + 0x0d70] %asi
	.word 0x9f22800b  ! 145: MULScc_R	mulscc 	%r10, %r11, %r15
	.word 0x8dda800b  ! 146: FLUSH_R	dis not found

	.word 0xc66a800b  ! 147: LDSTUB_R	ldstub	%r3, [%r10 + %r11]
	.word 0x3a800001  ! 148: BCC	bcc,a	<label_0x1>
	.word 0xc7e2900b  ! 149: CASA_I	casa	[%r10] 0x80, %r11, %r3
	.word 0xdec2af28  ! 150: LDSWA_I	ldswa	[%r10, + 0x0f28] %asi, %r15
	.word 0x8ba2892b  ! 151: FMULs	fmuls	%f10, %f11, %f5
	.word 0x8143e07a  ! 152: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xc3eaae5c  ! 153: PREFETCHA_I	prefetcha	[%r10, + 0x0e5c] %asi, #one_read
	.word 0xa66aa070  ! 154: UDIVX_I	udivx 	%r10, 0x0070, %r19
	.word 0x85daaa88  ! 155: FLUSH_I	dis not found

	.word 0x904a800b  ! 157: MULX_R	mulx 	%r10, %r11, %r8
	.word 0x8fdaa1d8  ! 158: FLUSH_I	dis not found

	.word 0x8dda800b  ! 159: FLUSH_R	dis not found

	.word 0xcde2a00b  ! 160: CASA_R	casa	[%r10] %asi, %r11, %r6
	.word 0xd01aa528  ! 161: LDD_I	ldd	[%r10 + 0x0528], %r8
	.word 0x866aa8b4  ! 162: UDIVX_I	udivx 	%r10, 0x08b4, %r3
	.word 0x12800001  ! 163: BNE	bne  	<label_0x1>
	.word 0xc88a900b  ! 167: LDUBA_R	lduba	[%r10, %r11] 0x80, %r4
	.word 0x82f2800b  ! 168: UDIVcc_R	udivcc 	%r10, %r11, %r1
	.word 0xf882a3b4  ! 169: LDUWA_I	lduwa	[%r10, + 0x03b4] %asi, %r28
	.word 0xa4d2800b  ! 170: UMULcc_R	umulcc 	%r10, %r11, %r18
	.word 0xf2ca900b  ! 171: LDSBA_R	ldsba	[%r10, %r11] 0x80, %r25
	.word 0x8ad2a468  ! 172: UMULcc_I	umulcc 	%r10, 0x0468, %r5
	.word 0x8143c000  ! 173: STBAR	stbar
	.word 0xd8b2900b  ! 174: STHA_R	stha	%r12, [%r10 + %r11] 0x80
	.word 0xa04aa9b0  ! 175: MULX_I	mulx 	%r10, 0x09b0, %r16
	.word 0xef22a6d0  ! 176: STF_I	st	%f23, [0x06d0, %r10]
	.word 0x22800001  ! 177: BE	be,a	<label_0x1>
	.word 0xeedaa1b8  ! 178: LDXA_I	ldxa	[%r10, + 0x01b8] %asi, %r23
	.word 0xc3eaaefc  ! 179: PREFETCHA_I	prefetcha	[%r10, + 0x0efc] %asi, #one_read
	.word 0x8143e068  ! 180: MEMBAR	membar	#StoreStore | #MemIssue | #Sync 
	.word 0x8e52a70c  ! 181: UMUL_I	umul 	%r10, 0x070c, %r7
	.word 0x92faae10  ! 182: SDIVcc_I	sdivcc 	%r10, 0x0e10, %r9
	.word 0x8b6aa460  ! 183: SDIVX_I	sdivx	%r10, 0x0460, %r5
	.word 0x8c5aaaac  ! 184: SMUL_I	smul 	%r10, 0x0aac, %r6
	.word 0xc46a800b  ! 187: LDSTUB_R	ldstub	%r2, [%r10 + %r11]
	.word 0xa1daab6c  ! 188: FLUSH_I	dis not found

	.word 0xd01a800b  ! 189: LDD_R	ldd	[%r10 + %r11], %r8
	.word 0xd1f2a00b  ! 190: CASXA_R	casxa	[%r10]%asi, %r11, %r8
	.word 0xc47aabb8  ! 191: SWAP_I	swap	%r2, [%r10 + 0x0bb8]
	.word 0xde4a800b  ! 192: LDSB_R	ldsb	[%r10 + %r11], %r15
	.word 0xb5daa948  ! 193: FLUSH_I	dis not found

	.word 0x2cca0001  ! 194: BRGZ	brgz,a,pt	%8,<label_0xa0001>
	.word 0x8af2800b  ! 195: UDIVcc_R	udivcc 	%r10, %r11, %r5
	.word 0x93a289ab  ! 196: FDIVs	fdivs	%f10, %f11, %f9
	.word 0xe242800b  ! 197: LDSW_R	ldsw	[%r10 + %r11], %r17
	.word 0x8fda800b  ! 198: FLUSH_R	dis not found

	.word 0x3a800001  ! 199: BCC	bcc,a	<label_0x1>
	.word 0xaa72800b  ! 200: UDIV_R	udiv 	%r10, %r11, %r21
	.word 0x2aca0003  ! 201: BRNZ	brnz,a,pt	%8,<label_0xa0003>
	.word 0xd0c2ae30  ! 202: LDSWA_I	ldswa	[%r10, + 0x0e30] %asi, %r8
	.word 0xeeb2aae4  ! 203: STHA_I	stha	%r23, [%r10 + 0x0ae4] %asi
	.word 0x8c72a904  ! 204: UDIV_I	udiv 	%r10, 0x0904, %r6
	.word 0xd2d2a1bc  ! 205: LDSHA_I	ldsha	[%r10, + 0x01bc] %asi, %r9
	.word 0xe2ea900b  ! 206: LDSTUBA_R	ldstuba	%r17, [%r10 + %r11] 0x80
	.word 0xb2d2aa50  ! 207: UMULcc_I	umulcc 	%r10, 0x0a50, %r25
	.word 0x8143e043  ! 208: MEMBAR	membar	#LoadLoad | #StoreLoad | #Sync 
	.word 0xc4ca900b  ! 209: LDSBA_R	ldsba	[%r10, %r11] 0x80, %r2
	.word 0xf2c2900b  ! 210: LDSWA_R	ldswa	[%r10, %r11] 0x80, %r25
	.word 0xc36aae68  ! 211: PREFETCH_I	prefetch	[%r10 + 0x0e68], #one_read
	.word 0xb252800b  ! 212: UMUL_R	umul 	%r10, %r11, %r25
	.word 0x8fa289ab  ! 213: FDIVs	fdivs	%f10, %f11, %f7
	.word 0x8afaa074  ! 214: SDIVcc_I	sdivcc 	%r10, 0x0074, %r5
	.word 0x8143e026  ! 215: MEMBAR	membar	#StoreLoad | #LoadStore | #MemIssue 
	.word 0xc802800b  ! 216: LDUW_R	lduw	[%r10 + %r11], %r4
	.word 0xcaa2ad88  ! 217: STWA_I	stwa	%r5, [%r10 + 0x0d88] %asi
	.word 0x91da800b  ! 218: FLUSH_R	dis not found

	.word 0xbddaa8e8  ! 219: FLUSH_I	dis not found

	.word 0x0aca0003  ! 221: BRNZ	brnz  ,pt	%8,<label_0xa0003>
	.word 0xb452a1e8  ! 222: UMUL_I	umul 	%r10, 0x01e8, %r26
	.word 0x91a2882b  ! 223: FADDs	fadds	%f10, %f11, %f8
	.word 0xcafa900b  ! 224: SWAPA_R	swapa	%r5, [%r10 + %r11] 0x80
	.word 0x906a800b  ! 225: UDIVX_R	udivx 	%r10, %r11, %r8
	.word 0x8c4aa14c  ! 226: MULX_I	mulx 	%r10, 0x014c, %r6
	.word 0xc73a800b  ! 227: STDF_R	std	%f3, [%r11, %r10]
	.word 0x9cd2aad8  ! 228: UMULcc_I	umulcc 	%r10, 0x0ad8, %r14
	.word 0xc44aaedc  ! 229: LDSB_I	ldsb	[%r10 + 0x0edc], %r2
	.word 0xd012ae34  ! 230: LDUH_I	lduh	[%r10 + 0x0e34], %r8
	.word 0xc47a800b  ! 231: SWAP_R	swap	%r2, [%r10 + %r11]
	.word 0xd0aaa07c  ! 232: STBA_I	stba	%r8, [%r10 + 0x007c] %asi
	.word 0xc9e2a00b  ! 233: CASA_R	casa	[%r10] %asi, %r11, %r4
	.word 0x8143c000  ! 234: STBAR	stbar
	.word 0x02c20003  ! 235: BRZ	brz  ,nt	%8,<label_0x20003>
	.word 0xc36a800b  ! 236: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0xcefa900b  ! 237: SWAPA_R	swapa	%r7, [%r10 + %r11] 0x80
	.word 0xc3e2a00b  ! 238: CASA_R	casa	[%r10] %asi, %r11, %r1
	.word 0xd0f2900b  ! 239: STXA_R	stxa	%r8, [%r10 + %r11] 0x80
	.word 0x2cc20001  ! 240: BRGZ	brgz,a,nt	%8,<label_0x20001>
	.word 0x87daabe4  ! 242: FLUSH_I	dis not found

	.word 0x3a800003  ! 243: BCC	bcc,a	<label_0x3>
	.word 0x8143c000  ! 244: STBAR	stbar
	.word 0x8bda800b  ! 245: FLUSH_R	dis not found

	.word 0xd322800b  ! 246: STF_R	st	%f9, [%r11, %r10]
	.word 0x91da800b  ! 247: FLUSH_R	dis not found

	.word 0xe042800b  ! 248: LDSW_R	ldsw	[%r10 + %r11], %r16
	.word 0x92f2800b  ! 249: UDIVcc_R	udivcc 	%r10, %r11, %r9
	.word 0xf41a800b  ! 250: LDD_R	ldd	[%r10 + %r11], %r26
	.word 0xc3ea900b  ! 251: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0xeaf2a458  ! 252: STXA_I	stxa	%r21, [%r10 + 0x0458] %asi
	.word 0x90d2aec0  ! 253: UMULcc_I	umulcc 	%r10, 0x0ec0, %r8
	.word 0x18800001  ! 254: BGU	bgu  	<label_0x1>
	.word 0xa852a3f8  ! 255: UMUL_I	umul 	%r10, 0x03f8, %r20
	.word 0x8272a114  ! 256: UDIV_I	udiv 	%r10, 0x0114, %r1
	.word 0x8fdaa954  ! 257: FLUSH_I	dis not found

	.word 0xfea2900b  ! 258: STWA_R	stwa	%r31, [%r10 + %r11] 0x80
	.word 0x9ba288ab  ! 259: FSUBs	fsubs	%f10, %f11, %f13
	.word 0x9052a0c4  ! 260: UMUL_I	umul 	%r10, 0x00c4, %r8
	.word 0x926aaa14  ! 261: UDIVX_I	udivx 	%r10, 0x0a14, %r9
	.word 0x9ddaab9c  ! 262: FLUSH_I	dis not found

	.word 0x8dda800b  ! 263: FLUSH_R	dis not found

	.word 0xc53a800b  ! 264: STDF_R	std	%f2, [%r11, %r10]
	.word 0x3c800001  ! 265: BPOS	bpos,a	<label_0x1>
	.word 0x91daa520  ! 266: FLUSH_I	dis not found

	.word 0xa9a289ab  ! 267: FDIVs	fdivs	%f10, %f11, %f20
	.word 0xc81a800b  ! 268: LDD_R	ldd	[%r10 + %r11], %r4
	.word 0x40000001  ! 269: CALL	call	disp30_1
	.word 0xd1e2a00b  ! 270: CASA_R	casa	[%r10] %asi, %r11, %r8
	.word 0xde0aa19c  ! 271: LDUB_I	ldub	[%r10 + 0x019c], %r15
	.word 0x8143c000  ! 272: STBAR	stbar
	.word 0xc49aa740  ! 273: LDDA_I	ldda	[%r10, + 0x0740] %asi, %r2
	.word 0x12800003  ! 274: BNE	bne  	<label_0x3>
	.word 0x916aa8dc  ! 275: SDIVX_I	sdivx	%r10, 0x08dc, %r8
	.word 0xe0aa900b  ! 276: STBA_R	stba	%r16, [%r10 + %r11] 0x80
	.word 0x9272800b  ! 277: UDIV_R	udiv 	%r10, %r11, %r9
	.word 0x8143c000  ! 278: STBAR	stbar
	.word 0x8ada800b  ! 279: SMULcc_R	smulcc 	%r10, %r11, %r5
	.word 0xcc9a900b  ! 280: LDDA_R	ldda	[%r10, %r11] 0x80, %r6
	.word 0xc60a800b  ! 281: LDUB_R	ldub	[%r10 + %r11], %r3
	.word 0x9052a338  ! 282: UMUL_I	umul 	%r10, 0x0338, %r8
	.word 0x8a5aa0d4  ! 283: SMUL_I	smul 	%r10, 0x00d4, %r5
	.word 0xd2f2900b  ! 284: STXA_R	stxa	%r9, [%r10 + %r11] 0x80
	.word 0xceaaa3ec  ! 285: STBA_I	stba	%r7, [%r10 + 0x03ec] %asi
	.word 0x91da800b  ! 286: FLUSH_R	dis not found

	.word 0xe0eaa634  ! 287: LDSTUBA_I	ldstuba	%r16, [%r10 + 0x0634] %asi
	.word 0xbdda800b  ! 288: FLUSH_R	dis not found

	.word 0x00800001  ! 289: BN	bn  	<label_0x1>
	.word 0xca52800b  ! 290: LDSH_R	ldsh	[%r10 + %r11], %r5
	.word 0x8f22800b  ! 291: MULScc_R	mulscc 	%r10, %r11, %r7
	.word 0x8143c000  ! 292: STBAR	stbar
	.word 0xc68aaddc  ! 293: LDUBA_I	lduba	[%r10, + 0x0ddc] %asi, %r3
	.word 0xa2daa1c8  ! 294: SMULcc_I	smulcc 	%r10, 0x01c8, %r17
	.word 0xe73a800b  ! 295: STDF_R	std	%f19, [%r11, %r10]
	.word 0x9072800b  ! 296: UDIV_R	udiv 	%r10, %r11, %r8
	.word 0xc2faa194  ! 297: SWAPA_I	swapa	%r1, [%r10 + 0x0194] %asi
	.word 0xc36a800b  ! 298: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0xd0b2900b  ! 299: STHA_R	stha	%r8, [%r10 + %r11] 0x80
	.word 0xc3f2a00b  ! 300: CASXA_R	casxa	[%r10]%asi, %r11, %r1
	.word 0x8ad2800b  ! 301: UMULcc_R	umulcc 	%r10, %r11, %r5
	.word 0xc8ba900b  ! 302: STDA_R	stda	%r4, [%r10 + %r11] 0x80
	.word 0x8143c000  ! 303: STBAR	stbar
	.word 0xb2d2800b  ! 304: UMULcc_R	umulcc 	%r10, %r11, %r25
	.word 0xc4caaa1c  ! 305: LDSBA_I	ldsba	[%r10, + 0x0a1c] %asi, %r2
	.word 0xccbaab30  ! 306: STDA_I	stda	%r6, [%r10 + 0x0b30] %asi
	.word 0xdbe2a00b  ! 307: CASA_R	casa	[%r10] %asi, %r11, %r13
	.word 0xd3f2a00b  ! 308: CASXA_R	casxa	[%r10]%asi, %r11, %r9
	.word 0x8efaa8d4  ! 309: SDIVcc_I	sdivcc 	%r10, 0x08d4, %r7
	.word 0xc6a2900b  ! 310: STWA_R	stwa	%r3, [%r10 + %r11] 0x80
	.word 0x8143e05f  ! 311: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0xcaf2a458  ! 312: STXA_I	stxa	%r5, [%r10 + 0x0458] %asi
	.word 0xc522800b  ! 313: STF_R	st	%f2, [%r11, %r10]
	.word 0xc73a800b  ! 314: STDF_R	std	%f3, [%r11, %r10]
	.word 0xe4aaa0b8  ! 315: STBA_I	stba	%r18, [%r10 + 0x00b8] %asi
	.word 0xe2ea900b  ! 316: LDSTUBA_R	ldstuba	%r17, [%r10 + %r11] 0x80
	.word 0x38800001  ! 317: BGU	bgu,a	<label_0x1>
	.word 0xcc7aa274  ! 318: SWAP_I	swap	%r6, [%r10 + 0x0274]
	.word 0x9122800b  ! 319: MULScc_R	mulscc 	%r10, %r11, %r8
	.word 0xc8fa900b  ! 320: SWAPA_R	swapa	%r4, [%r10 + %r11] 0x80
	.word 0x2c800001  ! 321: BNEG	bneg,a	<label_0x1>
	.word 0xe922800b  ! 322: STF_R	st	%f20, [%r11, %r10]
	.word 0xc3f2900b  ! 323: CASXA_I	casxa	[%r10] 0x80, %r11, %r1
	.word 0x0c800001  ! 324: BNEG	bneg  	<label_0x1>
	.word 0xcc52a81c  ! 325: LDSH_I	ldsh	[%r10 + 0x081c], %r6
	.word 0xc3eaa1c4  ! 326: PREFETCHA_I	prefetcha	[%r10, + 0x01c4] %asi, #one_read
	.word 0xd09aa1c8  ! 328: LDDA_I	ldda	[%r10, + 0x01c8] %asi, %r8
	.word 0x8afa800b  ! 329: SDIVcc_R	sdivcc 	%r10, %r11, %r5
	.word 0x8143c000  ! 330: STBAR	stbar
	.word 0xd002a108  ! 331: LDUW_I	lduw	[%r10 + 0x0108], %r8
	.word 0xafa2892b  ! 332: FMULs	fmuls	%f10, %f11, %f23
	.word 0x8143c000  ! 334: STBAR	stbar
	.word 0xca6aae3c  ! 335: LDSTUB_I	ldstub	%r5, [%r10 + 0x0e3c]
	.word 0xa9daae94  ! 336: FLUSH_I	dis not found

	.word 0x93daadc8  ! 337: FLUSH_I	dis not found

	.word 0x0c800003  ! 338: BNEG	bneg  	<label_0x3>
	.word 0x89a288ab  ! 340: FSUBs	fsubs	%f10, %f11, %f4
	.word 0x8cf2a7ec  ! 341: UDIVcc_I	udivcc 	%r10, 0x07ec, %r6
	.word 0xa3da800b  ! 342: FLUSH_R	dis not found

	.word 0xd09a900b  ! 343: LDDA_R	ldda	[%r10, %r11] 0x80, %r8
	.word 0x86f2a18c  ! 344: UDIVcc_I	udivcc 	%r10, 0x018c, %r3
	.word 0xc64a800b  ! 345: LDSB_R	ldsb	[%r10 + %r11], %r3
	.word 0x8af2abc4  ! 346: UDIVcc_I	udivcc 	%r10, 0x0bc4, %r5
	.word 0x825aa030  ! 347: SMUL_I	smul 	%r10, 0x0030, %r1
	.word 0xa07a800b  ! 348: SDIV_R	sdiv 	%r10, %r11, %r16
	.word 0xac72a36c  ! 349: UDIV_I	udiv 	%r10, 0x036c, %r22
	.word 0x8143c000  ! 350: STBAR	stbar
	.word 0x40000001  ! 351: CALL	call	disp30_1
	.word 0xc68aa5d8  ! 352: LDUBA_I	lduba	[%r10, + 0x05d8] %asi, %r3
	.word 0x8143e055  ! 353: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside | #Sync 
	.word 0xc482900b  ! 354: LDUWA_R	lduwa	[%r10, %r11] 0x80, %r2
	.word 0xb0f2800b  ! 355: UDIVcc_R	udivcc 	%r10, %r11, %r24
	.word 0x8fa2882b  ! 356: FADDs	fadds	%f10, %f11, %f7
	.word 0x8ed2800b  ! 357: UMULcc_R	umulcc 	%r10, %r11, %r7
	.word 0xd2caa794  ! 358: LDSBA_I	ldsba	[%r10, + 0x0794] %asi, %r9
	.word 0xc3ea900b  ! 359: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0xbc7aa3bc  ! 360: SDIV_I	sdiv 	%r10, 0x03bc, %r30
	.word 0xa7daa2d4  ! 361: FLUSH_I	dis not found

	.word 0x8143c000  ! 363: STBAR	stbar
	.word 0x8143c000  ! 364: STBAR	stbar
	.word 0xc2d2900b  ! 365: LDSHA_R	ldsha	[%r10, %r11] 0x80, %r1
	.word 0xc6ca900b  ! 366: LDSBA_R	ldsba	[%r10, %r11] 0x80, %r3
	.word 0xae52ac50  ! 368: UMUL_I	umul 	%r10, 0x0c50, %r23
	.word 0x8143e021  ! 369: MEMBAR	membar	#LoadLoad | #MemIssue 
	.word 0x8a52a47c  ! 370: UMUL_I	umul 	%r10, 0x047c, %r5
	.word 0x8143e01a  ! 371: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside 
	.word 0xce42a508  ! 372: LDSW_I	ldsw	[%r10 + 0x0508], %r7
	.word 0xa1da800b  ! 373: FLUSH_R	dis not found

	.word 0x9afaaf58  ! 374: SDIVcc_I	sdivcc 	%r10, 0x0f58, %r13
	.word 0xc47aa25c  ! 375: SWAP_I	swap	%r2, [%r10 + 0x025c]
	.word 0x83a288ab  ! 376: FSUBs	fsubs	%f10, %f11, %f1
	.word 0xc3ea900b  ! 377: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0x9872800b  ! 378: UDIV_R	udiv 	%r10, %r11, %r12
	.word 0x8143e03e  ! 379: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0x844a800b  ! 380: MULX_R	mulx 	%r10, %r11, %r2
	.word 0x32800001  ! 381: BNE	bne,a	<label_0x1>
	.word 0x8bdaa81c  ! 382: FLUSH_I	dis not found

	.word 0x8143c000  ! 383: STBAR	stbar
	.word 0xcaa2afc4  ! 384: STWA_I	stwa	%r5, [%r10 + 0x0fc4] %asi
	.word 0x8143c000  ! 385: STBAR	stbar
	.word 0xe6ca900b  ! 387: LDSBA_R	ldsba	[%r10, %r11] 0x80, %r19
	.word 0x87da800b  ! 388: FLUSH_R	dis not found

	.word 0xc8ba900b  ! 389: STDA_R	stda	%r4, [%r10 + %r11] 0x80
	.word 0xfc7aa9b8  ! 390: SWAP_I	swap	%r30, [%r10 + 0x09b8]
	.word 0x8143e010  ! 391: MEMBAR	membar	#Lookaside 
	.word 0x8143e06e  ! 392: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #MemIssue | #Sync 
	.word 0x8143e003  ! 393: MEMBAR	membar	#LoadLoad | #StoreLoad 
	.word 0xc36aa4a0  ! 394: PREFETCH_I	prefetch	[%r10 + 0x04a0], #one_read
	.word 0xc65aa2b8  ! 395: LDX_I	ldx	[%r10 + 0x02b8], %r3
	.word 0xfadaa258  ! 396: LDXA_I	ldxa	[%r10, + 0x0258] %asi, %r29
	.word 0x85daa724  ! 397: FLUSH_I	dis not found

	.word 0x8143c000  ! 398: STBAR	stbar
	.word 0x8fda800b  ! 399: FLUSH_R	dis not found

	.word 0xc73aaef0  ! 400: STDF_I	std	%f3, [0x0ef0, %r10]
	.word 0xd25a800b  ! 401: LDX_R	ldx	[%r10 + %r11], %r9
	.word 0x8ef2ab20  ! 402: UDIVcc_I	udivcc 	%r10, 0x0b20, %r7
	.word 0x9fda800b  ! 403: FLUSH_R	dis not found

	.word 0x9052800b  ! 404: UMUL_R	umul 	%r10, %r11, %r8
	.word 0x1c800001  ! 405: BPOS	bpos  	<label_0x1>
	.word 0xd33aa550  ! 406: STDF_I	std	%f9, [0x0550, %r10]
	.word 0xd2b2aa34  ! 407: STHA_I	stha	%r9, [%r10 + 0x0a34] %asi
	.word 0xd8ca900b  ! 408: LDSBA_R	ldsba	[%r10, %r11] 0x80, %r12
	.word 0xe212800b  ! 409: LDUH_R	lduh	[%r10 + %r11], %r17
	.word 0xd24a800b  ! 410: LDSB_R	ldsb	[%r10 + %r11], %r9
	.word 0x06800001  ! 411: BL	bl  	<label_0x1>
	.word 0xcea2a5c0  ! 412: STWA_I	stwa	%r7, [%r10 + 0x05c0] %asi
	.word 0xba5a800b  ! 413: SMUL_R	smul 	%r10, %r11, %r29
	.word 0x1a800001  ! 414: BCC	bcc  	<label_0x1>
	.word 0x12800001  ! 415: BNE	bne  	<label_0x1>
	.word 0x88da800b  ! 416: SMULcc_R	smulcc 	%r10, %r11, %r4
	.word 0xc36a800b  ! 417: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0xfa4aae9c  ! 418: LDSB_I	ldsb	[%r10 + 0x0e9c], %r29
	.word 0xc6aa900b  ! 419: STBA_R	stba	%r3, [%r10 + %r11] 0x80
	.word 0x8143c000  ! 420: STBAR	stbar
	.word 0xd0aaabb0  ! 422: STBA_I	stba	%r8, [%r10 + 0x0bb0] %asi
	.word 0xc8eaa770  ! 423: LDSTUBA_I	ldstuba	%r4, [%r10 + 0x0770] %asi
	.word 0xbefa800b  ! 425: SDIVcc_R	sdivcc 	%r10, %r11, %r31
	.word 0x8143e061  ! 426: MEMBAR	membar	#LoadLoad | #MemIssue | #Sync 
	.word 0x8852800b  ! 427: UMUL_R	umul 	%r10, %r11, %r4
	.word 0x00800001  ! 428: BN	bn  	<label_0x1>
	.word 0xac7aa938  ! 429: SDIV_I	sdiv 	%r10, 0x0938, %r22
	.word 0x2cc20001  ! 430: BRGZ	brgz,a,nt	%8,<label_0x20001>
	.word 0xc2f2900b  ! 431: STXA_R	stxa	%r1, [%r10 + %r11] 0x80
	.word 0x8143c000  ! 432: STBAR	stbar
	.word 0xc8a2a984  ! 433: STWA_I	stwa	%r4, [%r10 + 0x0984] %asi
	.word 0xcceaad04  ! 434: LDSTUBA_I	ldstuba	%r6, [%r10 + 0x0d04] %asi
	.word 0x926a800b  ! 435: UDIVX_R	udivx 	%r10, %r11, %r9
	.word 0x9af2800b  ! 436: UDIVcc_R	udivcc 	%r10, %r11, %r13
	.word 0x02ca0001  ! 437: BRZ	brz  ,pt	%8,<label_0xa0001>
	.word 0xc3eaa01c  ! 438: PREFETCHA_I	prefetcha	[%r10, + 0x001c] %asi, #one_read
	.word 0xce82a12c  ! 439: LDUWA_I	lduwa	[%r10, + 0x012c] %asi, %r7
	.word 0x8143e00a  ! 440: MEMBAR	membar	#StoreLoad | #StoreStore 
	.word 0xce0aaf58  ! 441: LDUB_I	ldub	[%r10 + 0x0f58], %r7
	.word 0xfa52aa94  ! 442: LDSH_I	ldsh	[%r10 + 0x0a94], %r29
	.word 0x85a2892b  ! 443: FMULs	fmuls	%f10, %f11, %f2
	.word 0xa16aa3fc  ! 444: SDIVX_I	sdivx	%r10, 0x03fc, %r16
	.word 0xe522800b  ! 445: STF_R	st	%f18, [%r11, %r10]
	.word 0xdea2a040  ! 446: STWA_I	stwa	%r15, [%r10 + 0x0040] %asi
	.word 0x8652800b  ! 447: UMUL_R	umul 	%r10, %r11, %r3
	.word 0x88f2aafc  ! 448: UDIVcc_I	udivcc 	%r10, 0x0afc, %r4
	.word 0xe322800b  ! 450: STF_R	st	%f17, [%r11, %r10]
	.word 0x04800003  ! 451: BLE	ble  	<label_0x3>
	.word 0xd2a2900b  ! 452: STWA_R	stwa	%r9, [%r10 + %r11] 0x80
	.word 0xdc7aa41c  ! 453: SWAP_I	swap	%r14, [%r10 + 0x041c]
	.word 0xf47aa3ec  ! 454: SWAP_I	swap	%r26, [%r10 + 0x03ec]
	.word 0x8143e02f  ! 455: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #MemIssue 
	.word 0x3a800003  ! 456: BCC	bcc,a	<label_0x3>
	.word 0xca0a800b  ! 457: LDUB_R	ldub	[%r10 + %r11], %r5
	.word 0xa3da800b  ! 458: FLUSH_R	dis not found

	.word 0x3a800003  ! 459: BCC	bcc,a	<label_0x3>
	.word 0xdeaaa378  ! 460: STBA_I	stba	%r15, [%r10 + 0x0378] %asi
	.word 0xa322af48  ! 461: MULScc_I	mulscc 	%r10, 0x0f48, %r17
	.word 0x8143c000  ! 462: STBAR	stbar
	.word 0xc3ea900b  ! 463: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0xd00aa294  ! 464: LDUB_I	ldub	[%r10 + 0x0294], %r8
	.word 0x8ed2800b  ! 465: UMULcc_R	umulcc 	%r10, %r11, %r7
	.word 0x83da800b  ! 466: FLUSH_R	dis not found

	.word 0x90faa39c  ! 467: SDIVcc_I	sdivcc 	%r10, 0x039c, %r8
	.word 0xcc7a800b  ! 468: SWAP_R	swap	%r6, [%r10 + %r11]
	.word 0x8143c000  ! 469: STBAR	stbar
	.word 0xea82900b  ! 470: LDUWA_R	lduwa	[%r10, %r11] 0x80, %r21
	.word 0x8143c000  ! 471: STBAR	stbar
	.word 0xdc82900b  ! 472: LDUWA_R	lduwa	[%r10, %r11] 0x80, %r14
	.word 0xdde2900b  ! 473: CASA_I	casa	[%r10] 0x80, %r11, %r14
	.word 0xe53aa3c0  ! 474: STDF_I	std	%f18, [0x03c0, %r10]
	.word 0x2ac20001  ! 475: BRNZ	brnz,a,nt	%8,<label_0x20001>
	.word 0xd0aa900b  ! 476: STBA_R	stba	%r8, [%r10 + %r11] 0x80
	.word 0x8ddaa96c  ! 477: FLUSH_I	dis not found

	.word 0x9a72800b  ! 478: UDIV_R	udiv 	%r10, %r11, %r13
	.word 0x89daacbc  ! 479: FLUSH_I	dis not found

	.word 0x8143e037  ! 480: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside | #MemIssue 
	.word 0xecf2900b  ! 481: STXA_R	stxa	%r22, [%r10 + %r11] 0x80
	.word 0xc36aa534  ! 482: PREFETCH_I	prefetch	[%r10 + 0x0534], #one_read
	.word 0x8143e03e  ! 483: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0xd8f2a200  ! 484: STXA_I	stxa	%r12, [%r10 + 0x0200] %asi
	.word 0x8cf2a5c8  ! 485: UDIVcc_I	udivcc 	%r10, 0x05c8, %r6
	.word 0xefe2900b  ! 486: CASA_I	casa	[%r10] 0x80, %r11, %r23
	.word 0xb4fa800b  ! 487: SDIVcc_R	sdivcc 	%r10, %r11, %r26
	.word 0x26c20003  ! 488: BRLZ	brlz,a,nt	%8,<label_0x20003>
	.word 0xf01aa638  ! 489: LDD_I	ldd	[%r10 + 0x0638], %r24
	.word 0x26c20003  ! 490: BRLZ	brlz,a,nt	%8,<label_0x20003>
	.word 0xb16a800b  ! 491: SDIVX_R	sdivx	%r10, %r11, %r24
	.word 0xd26a800b  ! 492: LDSTUB_R	ldstub	%r9, [%r10 + %r11]
	.word 0xc6a2aafc  ! 493: STWA_I	stwa	%r3, [%r10 + 0x0afc] %asi
	.word 0x84f2a67c  ! 494: UDIVcc_I	udivcc 	%r10, 0x067c, %r2
	.word 0xd8ba900b  ! 495: STDA_R	stda	%r12, [%r10 + %r11] 0x80
	.word 0x8143e043  ! 496: MEMBAR	membar	#LoadLoad | #StoreLoad | #Sync 
	.word 0x8ba289ab  ! 497: FDIVs	fdivs	%f10, %f11, %f5
	.word 0x2eca0001  ! 498: BRGEZ	brgez,a,pt	%8,<label_0xa0001>
	.word 0x30800001  ! 499: BA	ba,a	<label_0x1>
	.word 0xc6caa7b8  ! 500: LDSBA_I	ldsba	[%r10, + 0x07b8] %asi, %r3
	.word 0xc8d2900b  ! 501: LDSHA_R	ldsha	[%r10, %r11] 0x80, %r4
	.word 0xb5daa3a4  ! 502: FLUSH_I	dis not found

	.word 0x82fa800b  ! 503: SDIVcc_R	sdivcc 	%r10, %r11, %r1
	.word 0x93da800b  ! 504: FLUSH_R	dis not found

	.word 0xc522800b  ! 505: STF_R	st	%f2, [%r11, %r10]
	.word 0xda8aa9cc  ! 506: LDUBA_I	lduba	[%r10, + 0x09cc] %asi, %r13
	.word 0xce52800b  ! 507: LDSH_R	ldsh	[%r10 + %r11], %r7
	.word 0xd252800b  ! 508: LDSH_R	ldsh	[%r10 + %r11], %r9
	.word 0xcc7a800b  ! 509: SWAP_R	swap	%r6, [%r10 + %r11]
	.word 0xfc52ae18  ! 510: LDSH_I	ldsh	[%r10 + 0x0e18], %r30
	.word 0xeaaaa554  ! 511: STBA_I	stba	%r21, [%r10 + 0x0554] %asi
	.word 0x86f2800b  ! 512: UDIVcc_R	udivcc 	%r10, %r11, %r3
	.word 0x8143c000  ! 513: STBAR	stbar
	.word 0xb5daaff8  ! 514: FLUSH_I	dis not found

	.word 0xc3ea900b  ! 515: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0xfe42800b  ! 516: LDSW_R	ldsw	[%r10 + %r11], %r31
	.word 0x9ad2ac68  ! 517: UMULcc_I	umulcc 	%r10, 0x0c68, %r13
	.word 0xc48a900b  ! 518: LDUBA_R	lduba	[%r10, %r11] 0x80, %r2
	.word 0xbdda800b  ! 519: FLUSH_R	dis not found

	.word 0xceb2aa38  ! 520: STHA_I	stha	%r7, [%r10 + 0x0a38] %asi
	.word 0xb47a800b  ! 521: SDIV_R	sdiv 	%r10, %r11, %r26
	.word 0xc73aa040  ! 522: STDF_I	std	%f3, [0x0040, %r10]
	.word 0xc4ca900b  ! 524: LDSBA_R	ldsba	[%r10, %r11] 0x80, %r2
	.word 0xc292900b  ! 525: LDUHA_R	lduha	[%r10, %r11] 0x80, %r1
	.word 0xfd22a778  ! 526: STF_I	st	%f30, [0x0778, %r10]
	.word 0xa872a594  ! 527: UDIV_I	udiv 	%r10, 0x0594, %r20
	.word 0xa9daab00  ! 528: FLUSH_I	dis not found

	.word 0xc2aaacd8  ! 529: STBA_I	stba	%r1, [%r10 + 0x0cd8] %asi
	.word 0x82faad80  ! 530: SDIVcc_I	sdivcc 	%r10, 0x0d80, %r1
	.word 0xc93a800b  ! 531: STDF_R	std	%f4, [%r11, %r10]
	.word 0x8fda800b  ! 532: FLUSH_R	dis not found

	.word 0xea02ac34  ! 533: LDUW_I	lduw	[%r10 + 0x0c34], %r21
	.word 0xda02a5a8  ! 534: LDUW_I	lduw	[%r10 + 0x05a8], %r13
	.word 0x8143e001  ! 535: MEMBAR	membar	#LoadLoad 
	.word 0x88d2a128  ! 536: UMULcc_I	umulcc 	%r10, 0x0128, %r4
	.word 0xb1da800b  ! 537: FLUSH_R	dis not found

	.word 0xc36a800b  ! 538: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x8272a79c  ! 539: UDIV_I	udiv 	%r10, 0x079c, %r1
	.word 0xc28a900b  ! 540: LDUBA_R	lduba	[%r10, %r11] 0x80, %r1
	.word 0x8143c000  ! 541: STBAR	stbar
	.word 0x89daa5f0  ! 542: FLUSH_I	dis not found

	.word 0x8143c000  ! 543: STBAR	stbar
	.word 0x8da289ab  ! 544: FDIVs	fdivs	%f10, %f11, %f6
	.word 0xf2f2a078  ! 545: STXA_I	stxa	%r25, [%r10 + 0x0078] %asi
	.word 0x88daa5b8  ! 546: SMULcc_I	smulcc 	%r10, 0x05b8, %r4
	.word 0xfc02800b  ! 547: LDUW_R	lduw	[%r10 + %r11], %r30
	.word 0x88faa498  ! 548: SDIVcc_I	sdivcc 	%r10, 0x0498, %r4
	.word 0xc64a800b  ! 549: LDSB_R	ldsb	[%r10 + %r11], %r3
	.word 0xc89a900b  ! 550: LDDA_R	ldda	[%r10, %r11] 0x80, %r4
	.word 0xec4aa5f0  ! 551: LDSB_I	ldsb	[%r10 + 0x05f0], %r22
	.word 0xd0b2ab60  ! 552: STHA_I	stha	%r8, [%r10 + 0x0b60] %asi
	.word 0xc3eaaaac  ! 553: PREFETCHA_I	prefetcha	[%r10, + 0x0aac] %asi, #one_read
	.word 0x91a289ab  ! 554: FDIVs	fdivs	%f10, %f11, %f8
	.word 0xc66aadac  ! 555: LDSTUB_I	ldstub	%r3, [%r10 + 0x0dac]
	.word 0xfeb2900b  ! 556: STHA_R	stha	%r31, [%r10 + %r11] 0x80
	.word 0x93a289ab  ! 557: FDIVs	fdivs	%f10, %f11, %f9
	.word 0xb122800b  ! 559: MULScc_R	mulscc 	%r10, %r11, %r24
	.word 0x8143c000  ! 560: STBAR	stbar
	.word 0xd08aab1c  ! 561: LDUBA_I	lduba	[%r10, + 0x0b1c] %asi, %r8
	.word 0xc0ba900b  ! 562: STDA_R	stda	%r0, [%r10 + %r11] 0x80
	.word 0x86d2a5c0  ! 563: UMULcc_I	umulcc 	%r10, 0x05c0, %r3
	.word 0x88f2a4c4  ! 565: UDIVcc_I	udivcc 	%r10, 0x04c4, %r4
	.word 0xb6fa800b  ! 566: SDIVcc_R	sdivcc 	%r10, %r11, %r27
	.word 0x8c6aa100  ! 567: UDIVX_I	udivx 	%r10, 0x0100, %r6
	.word 0x92faab94  ! 568: SDIVcc_I	sdivcc 	%r10, 0x0b94, %r9
	.word 0xc3eaaad4  ! 569: PREFETCHA_I	prefetcha	[%r10, + 0x0ad4] %asi, #one_read
	.word 0x8143e048  ! 570: MEMBAR	membar	#StoreStore | #Sync 
	.word 0x904aa844  ! 571: MULX_I	mulx 	%r10, 0x0844, %r8
	.word 0xf81aaf10  ! 572: LDD_I	ldd	[%r10 + 0x0f10], %r28
	.word 0x02800003  ! 573: BE	be  	<label_0x3>
	.word 0x0eca0001  ! 574: BRGEZ	brgez  ,pt	%8,<label_0xa0001>
	.word 0x28800001  ! 576: BLEU	bleu,a	<label_0x1>
	.word 0x85daa15c  ! 577: FLUSH_I	dis not found

	.word 0xa24aa120  ! 578: MULX_I	mulx 	%r10, 0x0120, %r17
	.word 0xafda800b  ! 579: FLUSH_R	dis not found

	.word 0x08800001  ! 580: BLEU	bleu  	<label_0x1>
	.word 0xc2b2ac4c  ! 581: STHA_I	stha	%r1, [%r10 + 0x0c4c] %asi
	.word 0xc3eaa50c  ! 582: PREFETCHA_I	prefetcha	[%r10, + 0x050c] %asi, #one_read
	.word 0x36800001  ! 583: BGE	bge,a	<label_0x1>
	.word 0x8a5a800b  ! 584: SMUL_R	smul 	%r10, %r11, %r5
	.word 0xd86aa00c  ! 586: LDSTUB_I	ldstub	%r12, [%r10 + 0x000c]
	.word 0x2cc20001  ! 587: BRGZ	brgz,a,nt	%8,<label_0x20001>
	.word 0xcc8aa2b4  ! 588: LDUBA_I	lduba	[%r10, + 0x02b4] %asi, %r6
	.word 0xe2b2a0fc  ! 589: STHA_I	stha	%r17, [%r10 + 0x00fc] %asi
	.word 0x16800001  ! 590: BGE	bge  	<label_0x1>
	.word 0xce12800b  ! 591: LDUH_R	lduh	[%r10 + %r11], %r7
	.word 0x30800001  ! 592: BA	ba,a	<label_0x1>
	.word 0xada288ab  ! 593: FSUBs	fsubs	%f10, %f11, %f22
	.word 0x91daa580  ! 594: FLUSH_I	dis not found

	.word 0xc3e2a00b  ! 595: CASA_R	casa	[%r10] %asi, %r11, %r1
	.word 0xef3aad18  ! 596: STDF_I	std	%f23, [0x0d18, %r10]
	.word 0xdaaa900b  ! 597: STBA_R	stba	%r13, [%r10 + %r11] 0x80
	.word 0x85daa000  ! 598: FLUSH_I	dis not found

	.word 0xc4fa900b  ! 599: SWAPA_R	swapa	%r2, [%r10 + %r11] 0x80
	.word 0x8143c000  ! 600: STBAR	stbar
	.word 0xd322aa5c  ! 601: STF_I	st	%f9, [0x0a5c, %r10]
	.word 0x18800003  ! 602: BGU	bgu  	<label_0x3>
	.word 0xca52af38  ! 603: LDSH_I	ldsh	[%r10 + 0x0f38], %r5
	.word 0xc36a800b  ! 604: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x02c20001  ! 605: BRZ	brz  ,nt	%8,<label_0x20001>
	.word 0x8fda800b  ! 606: FLUSH_R	dis not found

	.word 0xbddaada8  ! 607: FLUSH_I	dis not found

	.word 0xc41aafc8  ! 608: LDD_I	ldd	[%r10 + 0x0fc8], %r2
	.word 0xc2aa900b  ! 609: STBA_R	stba	%r1, [%r10 + %r11] 0x80
	.word 0xc26aa774  ! 610: LDSTUB_I	ldstub	%r1, [%r10 + 0x0774]
	.word 0x30800001  ! 611: BA	ba,a	<label_0x1>
	.word 0xeefaae70  ! 613: SWAPA_I	swapa	%r23, [%r10 + 0x0e70] %asi
	.word 0xa6da800b  ! 614: SMULcc_R	smulcc 	%r10, %r11, %r19
	.word 0xd28a900b  ! 615: LDUBA_R	lduba	[%r10, %r11] 0x80, %r9
	.word 0x8d6a800b  ! 616: SDIVX_R	sdivx	%r10, %r11, %r6
	.word 0x91daafcc  ! 617: FLUSH_I	dis not found

	.word 0xc89aae88  ! 618: LDDA_I	ldda	[%r10, + 0x0e88] %asi, %r4
	.word 0x91daa520  ! 619: FLUSH_I	dis not found

	.word 0xc2a2a5ac  ! 620: STWA_I	stwa	%r1, [%r10 + 0x05ac] %asi
	.word 0xd0d2900b  ! 621: LDSHA_R	ldsha	[%r10, %r11] 0x80, %r8
	.word 0xd89aa770  ! 622: LDDA_I	ldda	[%r10, + 0x0770] %asi, %r12
	.word 0x8cda800b  ! 623: SMULcc_R	smulcc 	%r10, %r11, %r6
	.word 0xcc5a800b  ! 624: LDX_R	ldx	[%r10 + %r11], %r6
	.word 0xc36a800b  ! 625: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0xfaf2900b  ! 626: STXA_R	stxa	%r29, [%r10 + %r11] 0x80
	.word 0xea7a800b  ! 627: SWAP_R	swap	%r21, [%r10 + %r11]
	.word 0x866aac44  ! 628: UDIVX_I	udivx 	%r10, 0x0c44, %r3
	.word 0xc5e2a00b  ! 629: CASA_R	casa	[%r10] %asi, %r11, %r2
	.word 0x8143e029  ! 630: MEMBAR	membar	#LoadLoad | #StoreStore | #MemIssue 
	.word 0x1a800001  ! 631: BCC	bcc  	<label_0x1>
	.word 0x91da800b  ! 632: FLUSH_R	dis not found

	.word 0xf522a028  ! 633: STF_I	st	%f26, [0x0028, %r10]
	.word 0xc922800b  ! 634: STF_R	st	%f4, [%r11, %r10]
	.word 0xd212800b  ! 635: LDUH_R	lduh	[%r10 + %r11], %r9
	.word 0xfcd2aecc  ! 636: LDSHA_I	ldsha	[%r10, + 0x0ecc] %asi, %r30
	.word 0x8143c000  ! 637: STBAR	stbar
	.word 0xc44aa248  ! 638: LDSB_I	ldsb	[%r10 + 0x0248], %r2
	.word 0xb9daa740  ! 639: FLUSH_I	dis not found

	.word 0xf09a900b  ! 640: LDDA_R	ldda	[%r10, %r11] 0x80, %r24
	.word 0x9cfa800b  ! 641: SDIVcc_R	sdivcc 	%r10, %r11, %r14
	.word 0xa7da800b  ! 642: FLUSH_R	dis not found

	.word 0x2cca0003  ! 643: BRGZ	brgz,a,pt	%8,<label_0xa0003>
	.word 0xee8aa760  ! 644: LDUBA_I	lduba	[%r10, + 0x0760] %asi, %r23
	.word 0x3e800003  ! 645: BVC	bvc,a	<label_0x3>
	.word 0x8143e02f  ! 646: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #MemIssue 
	.word 0x8143c000  ! 647: STBAR	stbar
	.word 0x89a2892b  ! 648: FMULs	fmuls	%f10, %f11, %f4
	.word 0xc3eaa868  ! 649: PREFETCHA_I	prefetcha	[%r10, + 0x0868] %asi, #one_read
	.word 0x89a2882b  ! 650: FADDs	fadds	%f10, %f11, %f4
	.word 0xcad2900b  ! 651: LDSHA_R	ldsha	[%r10, %r11] 0x80, %r5
	.word 0x8672800b  ! 652: UDIV_R	udiv 	%r10, %r11, %r3
	.word 0x8ba2892b  ! 654: FMULs	fmuls	%f10, %f11, %f5
	.word 0x8672800b  ! 655: UDIV_R	udiv 	%r10, %r11, %r3
	.word 0x88f2a36c  ! 656: UDIVcc_I	udivcc 	%r10, 0x036c, %r4
	.word 0x85a288ab  ! 657: FSUBs	fsubs	%f10, %f11, %f2
	.word 0xc2d2aa70  ! 659: LDSHA_I	ldsha	[%r10, + 0x0a70] %asi, %r1
	.word 0xc4b2a238  ! 660: STHA_I	stha	%r2, [%r10 + 0x0238] %asi
	.word 0xbafaa644  ! 661: SDIVcc_I	sdivcc 	%r10, 0x0644, %r29
	.word 0xc7e2a00b  ! 662: CASA_R	casa	[%r10] %asi, %r11, %r3
	.word 0xca02800b  ! 663: LDUW_R	lduw	[%r10 + %r11], %r5
	.word 0x82faa0cc  ! 664: SDIVcc_I	sdivcc 	%r10, 0x00cc, %r1
	.word 0x02c20001  ! 665: BRZ	brz  ,nt	%8,<label_0x20001>
	.word 0x9fa2882b  ! 666: FADDs	fadds	%f10, %f11, %f15
	.word 0x8c7aae4c  ! 667: SDIV_I	sdiv 	%r10, 0x0e4c, %r6
	.word 0x8b22a354  ! 668: MULScc_I	mulscc 	%r10, 0x0354, %r5
	.word 0xf13aa3e8  ! 669: STDF_I	std	%f24, [0x03e8, %r10]
	.word 0x00800001  ! 670: BN	bn  	<label_0x1>
	.word 0x8652800b  ! 671: UMUL_R	umul 	%r10, %r11, %r3
	.word 0xae7aa130  ! 672: SDIV_I	sdiv 	%r10, 0x0130, %r23
	.word 0xb1a288ab  ! 673: FSUBs	fsubs	%f10, %f11, %f24
	.word 0xeff2900b  ! 674: CASXA_I	casxa	[%r10] 0x80, %r11, %r23
	.word 0x8f6a800b  ! 675: SDIVX_R	sdivx	%r10, %r11, %r7
	.word 0xc81a800b  ! 676: LDD_R	ldd	[%r10 + %r11], %r4
	.word 0xfa02aafc  ! 677: LDUW_I	lduw	[%r10 + 0x0afc], %r29
	.word 0x83daa534  ! 678: FLUSH_I	dis not found

	.word 0xc3eaa280  ! 679: PREFETCHA_I	prefetcha	[%r10, + 0x0280] %asi, #one_read
	.word 0x87da800b  ! 680: FLUSH_R	dis not found

	.word 0xf40aaf68  ! 681: LDUB_I	ldub	[%r10 + 0x0f68], %r26
	.word 0xc8b2ab40  ! 682: STHA_I	stha	%r4, [%r10 + 0x0b40] %asi
	.word 0xf8aa900b  ! 683: STBA_R	stba	%r28, [%r10 + %r11] 0x80
	.word 0xfa42a310  ! 684: LDSW_I	ldsw	[%r10 + 0x0310], %r29
	.word 0xc9e2a00b  ! 685: CASA_R	casa	[%r10] %asi, %r11, %r4
	.word 0x2e800001  ! 686: BVS	bvs,a	<label_0x1>
	.word 0xc53a800b  ! 687: STDF_R	std	%f2, [%r11, %r10]
	.word 0x0aca0003  ! 688: BRNZ	brnz  ,pt	%8,<label_0xa0003>
	.word 0xac72ae50  ! 689: UDIV_I	udiv 	%r10, 0x0e50, %r22
	.word 0xcb22800b  ! 690: STF_R	st	%f5, [%r11, %r10]
	.word 0xc8f2a0a0  ! 691: STXA_I	stxa	%r4, [%r10 + 0x00a0] %asi
	.word 0xd892900b  ! 692: LDUHA_R	lduha	[%r10, %r11] 0x80, %r12
	.word 0x8143c000  ! 693: STBAR	stbar
	.word 0x864a800b  ! 694: MULX_R	mulx 	%r10, %r11, %r3
	.word 0xc36aa9d4  ! 695: PREFETCH_I	prefetch	[%r10 + 0x09d4], #one_read
	.word 0xcc4a800b  ! 696: LDSB_R	ldsb	[%r10 + %r11], %r6
	.word 0xc482900b  ! 697: LDUWA_R	lduwa	[%r10, %r11] 0x80, %r2
	.word 0x8a72800b  ! 698: UDIV_R	udiv 	%r10, %r11, %r5
	.word 0xa7da800b  ! 699: FLUSH_R	dis not found

	.word 0x8143c000  ! 700: STBAR	stbar
	.word 0xc2caae4c  ! 701: LDSBA_I	ldsba	[%r10, + 0x0e4c] %asi, %r1
	.word 0xcde2900b  ! 702: CASA_I	casa	[%r10] 0x80, %r11, %r6
	.word 0x02c20003  ! 703: BRZ	brz  ,nt	%8,<label_0x20003>
	.word 0x8143c000  ! 704: STBAR	stbar
	.word 0xa852aa04  ! 705: UMUL_I	umul 	%r10, 0x0a04, %r20
	.word 0xceda900b  ! 706: LDXA_R	ldxa	[%r10, %r11] 0x80, %r7
	.word 0xcbe2900b  ! 707: CASA_I	casa	[%r10] 0x80, %r11, %r5
	.word 0xc4d2900b  ! 708: LDSHA_R	ldsha	[%r10, %r11] 0x80, %r2
	.word 0x8b22800b  ! 709: MULScc_R	mulscc 	%r10, %r11, %r5
	.word 0x8bda800b  ! 710: FLUSH_R	dis not found

	.word 0xf922800b  ! 711: STF_R	st	%f28, [%r11, %r10]
	.word 0x8143c000  ! 712: STBAR	stbar
	.word 0xdbe2900b  ! 713: CASA_I	casa	[%r10] 0x80, %r11, %r13
	.word 0x8143e020  ! 714: MEMBAR	membar	#MemIssue 
	.word 0xae4a800b  ! 715: MULX_R	mulx 	%r10, %r11, %r23
	.word 0x0e800001  ! 716: BVS	bvs  	<label_0x1>
	.word 0xd2fa900b  ! 717: SWAPA_R	swapa	%r9, [%r10 + %r11] 0x80
	.word 0xda4a800b  ! 718: LDSB_R	ldsb	[%r10 + %r11], %r13
	.word 0xae7aa210  ! 719: SDIV_I	sdiv 	%r10, 0x0210, %r23
	.word 0x91a2892b  ! 720: FMULs	fmuls	%f10, %f11, %f8
	.word 0xc53a800b  ! 721: STDF_R	std	%f2, [%r11, %r10]
	.word 0x06800001  ! 722: BL	bl  	<label_0x1>
	.word 0xecdaab38  ! 723: LDXA_I	ldxa	[%r10, + 0x0b38] %asi, %r22
	.word 0xc36a800b  ! 724: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x92f2ab48  ! 725: UDIVcc_I	udivcc 	%r10, 0x0b48, %r9
	.word 0xc292900b  ! 726: LDUHA_R	lduha	[%r10, %r11] 0x80, %r1
	.word 0x8cf2800b  ! 727: UDIVcc_R	udivcc 	%r10, %r11, %r6
	.word 0xcc1a800b  ! 728: LDD_R	ldd	[%r10 + %r11], %r6
	.word 0xc4f2aa20  ! 729: STXA_I	stxa	%r2, [%r10 + 0x0a20] %asi
	.word 0x0a800001  ! 730: BCS	bcs  	<label_0x1>
	.word 0xd322800b  ! 731: STF_R	st	%f9, [%r11, %r10]
	.word 0xe0c2900b  ! 732: LDSWA_R	ldswa	[%r10, %r11] 0x80, %r16
	.word 0x8fda800b  ! 733: FLUSH_R	dis not found

	.word 0x8143c000  ! 734: STBAR	stbar
	.word 0x87daa504  ! 735: FLUSH_I	dis not found

	.word 0xc36aacdc  ! 736: PREFETCH_I	prefetch	[%r10 + 0x0cdc], #one_read
	.word 0xd0ca900b  ! 737: LDSBA_R	ldsba	[%r10, %r11] 0x80, %r8
	.word 0x2ac20003  ! 738: BRNZ	brnz,a,nt	%8,<label_0x20003>
	.word 0x8143c000  ! 739: STBAR	stbar
	.word 0xbfda800b  ! 740: FLUSH_R	dis not found

	.word 0x8da288ab  ! 741: FSUBs	fsubs	%f10, %f11, %f6
	.word 0xcc6a800b  ! 742: LDSTUB_R	ldstub	%r6, [%r10 + %r11]
	.word 0x06c20001  ! 743: BRLZ	brlz  ,nt	%8,<label_0x20001>
	.word 0xb872ad48  ! 744: UDIV_I	udiv 	%r10, 0x0d48, %r28
	.word 0xc6a2ad6c  ! 745: STWA_I	stwa	%r3, [%r10 + 0x0d6c] %asi
	.word 0x8452a750  ! 746: UMUL_I	umul 	%r10, 0x0750, %r2
	.word 0xa5daad58  ! 747: FLUSH_I	dis not found

	.word 0xd2faa5f8  ! 748: SWAPA_I	swapa	%r9, [%r10 + 0x05f8] %asi
	.word 0x87a289ab  ! 749: FDIVs	fdivs	%f10, %f11, %f3
	.word 0xd2eaad24  ! 750: LDSTUBA_I	ldstuba	%r9, [%r10 + 0x0d24] %asi
	.word 0xe2ea900b  ! 751: LDSTUBA_R	ldstuba	%r17, [%r10 + %r11] 0x80
	.word 0x9fdaae00  ! 752: FLUSH_I	dis not found

	.word 0xc202800b  ! 753: LDUW_R	lduw	[%r10 + %r11], %r1
	.word 0x8143c000  ! 754: STBAR	stbar
	.word 0x8143e053  ! 755: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside | #Sync 
	.word 0xd08a900b  ! 756: LDUBA_R	lduba	[%r10, %r11] 0x80, %r8
	.word 0x06800001  ! 757: BL	bl  	<label_0x1>
	.word 0xb672ad6c  ! 758: UDIV_I	udiv 	%r10, 0x0d6c, %r27
	.word 0xc4faa19c  ! 759: SWAPA_I	swapa	%r2, [%r10 + 0x019c] %asi
	.word 0xd812800b  ! 760: LDUH_R	lduh	[%r10 + %r11], %r12
	.word 0xc36a800b  ! 761: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0xfde2900b  ! 762: CASA_I	casa	[%r10] 0x80, %r11, %r30
	.word 0xa44aa7c8  ! 763: MULX_I	mulx 	%r10, 0x07c8, %r18
	.word 0x92faa8b0  ! 764: SDIVcc_I	sdivcc 	%r10, 0x08b0, %r9
	.word 0x86f2800b  ! 765: UDIVcc_R	udivcc 	%r10, %r11, %r3
	.word 0xe4d2ab08  ! 766: LDSHA_I	ldsha	[%r10, + 0x0b08] %asi, %r18
	.word 0x8143c000  ! 767: STBAR	stbar
	.word 0xf0aa900b  ! 768: STBA_R	stba	%r24, [%r10 + %r11] 0x80
	.word 0xf8b2900b  ! 769: STHA_R	stha	%r28, [%r10 + %r11] 0x80
	.word 0xce0aa25c  ! 770: LDUB_I	ldub	[%r10 + 0x025c], %r7
	.word 0xccaaabb8  ! 771: STBA_I	stba	%r6, [%r10 + 0x0bb8] %asi
	.word 0xcf3a800b  ! 772: STDF_R	std	%f7, [%r11, %r10]
	.word 0xce42800b  ! 773: LDSW_R	ldsw	[%r10 + %r11], %r7
	.word 0x9b6aab6c  ! 774: SDIVX_I	sdivx	%r10, 0x0b6c, %r13
	.word 0xd122800b  ! 775: STF_R	st	%f8, [%r11, %r10]
	.word 0xd322800b  ! 776: STF_R	st	%f9, [%r11, %r10]
	.word 0x12800003  ! 777: BNE	bne  	<label_0x3>
	.word 0x8c4a800b  ! 778: MULX_R	mulx 	%r10, %r11, %r6
	.word 0x8bda800b  ! 779: FLUSH_R	dis not found

	.word 0x06ca0003  ! 780: BRLZ	brlz  ,pt	%8,<label_0xa0003>
	.word 0xc3ea900b  ! 781: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0x927a800b  ! 782: SDIV_R	sdiv 	%r10, %r11, %r9
	.word 0xb3a289ab  ! 783: FDIVs	fdivs	%f10, %f11, %f25
	.word 0xf46a800b  ! 784: LDSTUB_R	ldstub	%r26, [%r10 + %r11]
	.word 0xcc9a900b  ! 786: LDDA_R	ldda	[%r10, %r11] 0x80, %r6
	.word 0x905aa17c  ! 787: SMUL_I	smul 	%r10, 0x017c, %r8
	.word 0x10800001  ! 788: BA	ba  	<label_0x1>
	.word 0xa7a2892b  ! 789: FMULs	fmuls	%f10, %f11, %f19
	.word 0xac52a568  ! 790: UMUL_I	umul 	%r10, 0x0568, %r22
	.word 0x04800001  ! 791: BLE	ble  	<label_0x1>
	.word 0x2ec20001  ! 792: BRGEZ	brgez,a,nt	%8,<label_0x20001>
	.word 0xfc6aa880  ! 793: LDSTUB_I	ldstub	%r30, [%r10 + 0x0880]
	.word 0x824a800b  ! 794: MULX_R	mulx 	%r10, %r11, %r1
	.word 0x8472a4b8  ! 795: UDIV_I	udiv 	%r10, 0x04b8, %r2
	.word 0xc4daaed0  ! 796: LDXA_I	ldxa	[%r10, + 0x0ed0] %asi, %r2
	.word 0xc24a800b  ! 797: LDSB_R	ldsb	[%r10 + %r11], %r1
	.word 0xc8aaad48  ! 798: STBA_I	stba	%r4, [%r10 + 0x0d48] %asi
	.word 0xc4b2a010  ! 799: STHA_I	stha	%r2, [%r10 + 0x0010] %asi
	.word 0xabdaa03c  ! 800: FLUSH_I	dis not found

	.word 0xd0f2900b  ! 801: STXA_R	stxa	%r8, [%r10 + %r11] 0x80
	.word 0xc93aad38  ! 802: STDF_I	std	%f4, [0x0d38, %r10]
	.word 0xcc1aaf28  ! 803: LDD_I	ldd	[%r10 + 0x0f28], %r6
	.word 0x8652add4  ! 804: UMUL_I	umul 	%r10, 0x0dd4, %r3
	.word 0x1c800001  ! 805: BPOS	bpos  	<label_0x1>
	.word 0x34800003  ! 806: BG	bg,a	<label_0x3>
	.word 0xaa4aa4ac  ! 807: MULX_I	mulx 	%r10, 0x04ac, %r21
	.word 0xc01a800b  ! 808: LDD_R	ldd	[%r10 + %r11], %r0
	.word 0xd33aab38  ! 809: STDF_I	std	%f9, [0x0b38, %r10]
	.word 0xc68a900b  ! 810: LDUBA_R	lduba	[%r10, %r11] 0x80, %r3
	.word 0x82f2ab10  ! 811: UDIVcc_I	udivcc 	%r10, 0x0b10, %r1
	.word 0xe06aa44c  ! 812: LDSTUB_I	ldstub	%r16, [%r10 + 0x044c]
	.word 0x87daab98  ! 813: FLUSH_I	dis not found

	.word 0x9ddaa69c  ! 814: FLUSH_I	dis not found

	.word 0xc3eaab84  ! 815: PREFETCHA_I	prefetcha	[%r10, + 0x0b84] %asi, #one_read
	.word 0x887a800b  ! 816: SDIV_R	sdiv 	%r10, %r11, %r4
	.word 0x2ac20003  ! 817: BRNZ	brnz,a,nt	%8,<label_0x20003>
	.word 0xada2882b  ! 818: FADDs	fadds	%f10, %f11, %f22
	.word 0xbc7aac70  ! 819: SDIV_I	sdiv 	%r10, 0x0c70, %r30
	.word 0xdc9aae88  ! 820: LDDA_I	ldda	[%r10, + 0x0e88] %asi, %r14
	.word 0xc8faaedc  ! 821: SWAPA_I	swapa	%r4, [%r10 + 0x0edc] %asi
	.word 0xd292900b  ! 822: LDUHA_R	lduha	[%r10, %r11] 0x80, %r9
	.word 0x85a289ab  ! 823: FDIVs	fdivs	%f10, %f11, %f2
	.word 0x92fa800b  ! 825: SDIVcc_R	sdivcc 	%r10, %r11, %r9
	.word 0x8bda800b  ! 826: FLUSH_R	dis not found

	.word 0xfc7a800b  ! 827: SWAP_R	swap	%r30, [%r10 + %r11]
	.word 0xc48aaae4  ! 828: LDUBA_I	lduba	[%r10, + 0x0ae4] %asi, %r2
	.word 0x926aa228  ! 829: UDIVX_I	udivx 	%r10, 0x0228, %r9
	.word 0x876aa82c  ! 830: SDIVX_I	sdivx	%r10, 0x082c, %r3
	.word 0xf06aa2e8  ! 831: LDSTUB_I	ldstub	%r24, [%r10 + 0x02e8]
	.word 0xdedaaab0  ! 832: LDXA_I	ldxa	[%r10, + 0x0ab0] %asi, %r15
	.word 0x93daa040  ! 833: FLUSH_I	dis not found

	.word 0x8872a818  ! 834: UDIV_I	udiv 	%r10, 0x0818, %r4
	.word 0xd28a900b  ! 835: LDUBA_R	lduba	[%r10, %r11] 0x80, %r9
	.word 0x905aa768  ! 836: SMUL_I	smul 	%r10, 0x0768, %r8
	.word 0x87da800b  ! 837: FLUSH_R	dis not found

	.word 0x10800001  ! 838: BA	ba  	<label_0x1>
	.word 0xca7a800b  ! 839: SWAP_R	swap	%r5, [%r10 + %r11]
	.word 0x907a800b  ! 840: SDIV_R	sdiv 	%r10, %r11, %r8
	.word 0x3a800001  ! 841: BCC	bcc,a	<label_0x1>
	.word 0xcaea900b  ! 842: LDSTUBA_R	ldstuba	%r5, [%r10 + %r11] 0x80
	.word 0xd322a928  ! 843: STF_I	st	%f9, [0x0928, %r10]
	.word 0x2cca0001  ! 844: BRGZ	brgz,a,pt	%8,<label_0xa0001>
	.word 0xe0d2a43c  ! 845: LDSHA_I	ldsha	[%r10, + 0x043c] %asi, %r16
	.word 0xd3f2a00b  ! 846: CASXA_R	casxa	[%r10]%asi, %r11, %r9
	.word 0xb1daaa64  ! 847: FLUSH_I	dis not found

	.word 0x90f2acb8  ! 848: UDIVcc_I	udivcc 	%r10, 0x0cb8, %r8
	.word 0xc36aa4d0  ! 849: PREFETCH_I	prefetch	[%r10 + 0x04d0], #one_read
	.word 0x8143c000  ! 850: STBAR	stbar
	.word 0xfa8aa39c  ! 851: LDUBA_I	lduba	[%r10, + 0x039c] %asi, %r29
	.word 0x8143c000  ! 852: STBAR	stbar
	.word 0xfcc2aca0  ! 853: LDSWA_I	ldswa	[%r10, + 0x0ca0] %asi, %r30
	.word 0xc4ba900b  ! 854: STDA_R	stda	%r2, [%r10 + %r11] 0x80
	.word 0x8143e04c  ! 855: MEMBAR	membar	#LoadStore | #StoreStore | #Sync 
	.word 0xcaea900b  ! 856: LDSTUBA_R	ldstuba	%r5, [%r10 + %r11] 0x80
	.word 0x8a4aa1d4  ! 857: MULX_I	mulx 	%r10, 0x01d4, %r5
	.word 0x87a289ab  ! 858: FDIVs	fdivs	%f10, %f11, %f3
	.word 0xfe8aadc0  ! 859: LDUBA_I	lduba	[%r10, + 0x0dc0] %asi, %r31
	.word 0xae5a800b  ! 861: SMUL_R	smul 	%r10, %r11, %r23
	.word 0x24c20003  ! 862: BRLEZ	brlez,a,nt	%8,<label_0x20003>
	.word 0xccd2900b  ! 863: LDSHA_R	ldsha	[%r10, %r11] 0x80, %r6
	.word 0xcada900b  ! 864: LDXA_R	ldxa	[%r10, %r11] 0x80, %r5
	.word 0x87a289ab  ! 865: FDIVs	fdivs	%f10, %f11, %f3
	.word 0xf6b2aa40  ! 866: STHA_I	stha	%r27, [%r10 + 0x0a40] %asi
	.word 0x2c800001  ! 867: BNEG	bneg,a	<label_0x1>
	.word 0x92daa8a8  ! 868: SMULcc_I	smulcc 	%r10, 0x08a8, %r9
	.word 0xf80aa35c  ! 869: LDUB_I	ldub	[%r10 + 0x035c], %r28
	.word 0x8143c000  ! 870: STBAR	stbar
	.word 0xc4a2a3a4  ! 871: STWA_I	stwa	%r2, [%r10 + 0x03a4] %asi
	.word 0xb7daab58  ! 872: FLUSH_I	dis not found

	.word 0x9dda800b  ! 873: FLUSH_R	dis not found

	.word 0x8f6aa438  ! 874: SDIVX_I	sdivx	%r10, 0x0438, %r7
	.word 0xfeeaa9e0  ! 875: LDSTUBA_I	ldstuba	%r31, [%r10 + 0x09e0] %asi
	.word 0xc28aaf74  ! 876: LDUBA_I	lduba	[%r10, + 0x0f74] %asi, %r1
	.word 0x826a800b  ! 877: UDIVX_R	udivx 	%r10, %r11, %r1
	.word 0xfcfa900b  ! 878: SWAPA_R	swapa	%r30, [%r10 + %r11] 0x80
	.word 0x9252800b  ! 879: UMUL_R	umul 	%r10, %r11, %r9
	.word 0xec1aa978  ! 880: LDD_I	ldd	[%r10 + 0x0978], %r22
	.word 0x8143e057  ! 881: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside | #Sync 
	.word 0xa2f2800b  ! 882: UDIVcc_R	udivcc 	%r10, %r11, %r17
	.word 0xfd3a800b  ! 883: STDF_R	std	%f30, [%r11, %r10]
	.word 0xcd22a6c8  ! 884: STF_I	st	%f6, [0x06c8, %r10]
	.word 0x8143e057  ! 885: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside | #Sync 
	.word 0xccba900b  ! 886: STDA_R	stda	%r6, [%r10 + %r11] 0x80
	.word 0xccf2900b  ! 887: STXA_R	stxa	%r6, [%r10 + %r11] 0x80
	.word 0xf722800b  ! 888: STF_R	st	%f27, [%r11, %r10]
	.word 0xf93a800b  ! 889: STDF_R	std	%f28, [%r11, %r10]
	.word 0x3e800003  ! 890: BVC	bvc,a	<label_0x3>
	.word 0x904a800b  ! 891: MULX_R	mulx 	%r10, %r11, %r8
	.word 0xf082a980  ! 892: LDUWA_I	lduwa	[%r10, + 0x0980] %asi, %r24
	.word 0xc3eaab6c  ! 893: PREFETCHA_I	prefetcha	[%r10, + 0x0b6c] %asi, #one_read
	.word 0x85daa820  ! 894: FLUSH_I	dis not found

	.word 0x24c20001  ! 895: BRLEZ	brlez,a,nt	%8,<label_0x20001>
	.word 0xca12800b  ! 896: LDUH_R	lduh	[%r10 + %r11], %r5
	.word 0x8e72800b  ! 897: UDIV_R	udiv 	%r10, %r11, %r7
	.word 0x9252800b  ! 898: UMUL_R	umul 	%r10, %r11, %r9
	.word 0xd06a800b  ! 899: LDSTUB_R	ldstub	%r8, [%r10 + %r11]
	.word 0x8143c000  ! 901: STBAR	stbar
	.word 0xa7a288ab  ! 902: FSUBs	fsubs	%f10, %f11, %f19
	.word 0x93a2892b  ! 903: FMULs	fmuls	%f10, %f11, %f9
	.word 0xd3f2900b  ! 904: CASXA_I	casxa	[%r10] 0x80, %r11, %r9
	.word 0xcc02a2bc  ! 905: LDUW_I	lduw	[%r10 + 0x02bc], %r6
	.word 0x82fa800b  ! 906: SDIVcc_R	sdivcc 	%r10, %r11, %r1
	.word 0x90daad20  ! 907: SMULcc_I	smulcc 	%r10, 0x0d20, %r8
	.word 0x3a800003  ! 908: BCC	bcc,a	<label_0x3>
	.word 0xc322a19c  ! 909: STF_I	st	%f1, [0x019c, %r10]
	.word 0x83da800b  ! 910: FLUSH_R	dis not found

	.word 0x8bda800b  ! 911: FLUSH_R	dis not found

	.word 0x8143e04c  ! 912: MEMBAR	membar	#LoadStore | #StoreStore | #Sync 
	.word 0x83da800b  ! 913: FLUSH_R	dis not found

	.word 0xcb22800b  ! 914: STF_R	st	%f5, [%r11, %r10]
	.word 0x8143e03f  ! 915: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0x8143e04e  ! 916: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Sync 
	.word 0xc3eaa26c  ! 917: PREFETCHA_I	prefetcha	[%r10, + 0x026c] %asi, #one_read
	.word 0xcca2900b  ! 918: STWA_R	stwa	%r6, [%r10 + %r11] 0x80
	.word 0x86f2aa88  ! 919: UDIVcc_I	udivcc 	%r10, 0x0a88, %r3
	.word 0xc4ba900b  ! 920: STDA_R	stda	%r2, [%r10 + %r11] 0x80
	.word 0xb6d2800b  ! 921: UMULcc_R	umulcc 	%r10, %r11, %r27
	.word 0x89da800b  ! 922: FLUSH_R	dis not found

	.word 0xc6b2900b  ! 923: STHA_R	stha	%r3, [%r10 + %r11] 0x80
	.word 0x91da800b  ! 924: FLUSH_R	dis not found

	.word 0xc66aa1f0  ! 925: LDSTUB_I	ldstub	%r3, [%r10 + 0x01f0]
	.word 0xde6a800b  ! 926: LDSTUB_R	ldstub	%r15, [%r10 + %r11]
	.word 0xecba900b  ! 927: STDA_R	stda	%r22, [%r10 + %r11] 0x80
	.word 0x885aa1cc  ! 928: SMUL_I	smul 	%r10, 0x01cc, %r4
	.word 0x8a6a800b  ! 929: UDIVX_R	udivx 	%r10, %r11, %r5
	.word 0xcec2900b  ! 930: LDSWA_R	ldswa	[%r10, %r11] 0x80, %r7
	.word 0xc36aaff4  ! 931: PREFETCH_I	prefetch	[%r10 + 0x0ff4], #one_read
	.word 0xfefaa368  ! 932: SWAPA_I	swapa	%r31, [%r10 + 0x0368] %asi
	.word 0xf67aac30  ! 933: SWAP_I	swap	%r27, [%r10 + 0x0c30]
	.word 0xc33aa7c0  ! 934: STDF_I	std	%f1, [0x07c0, %r10]
	.word 0xce52ae58  ! 935: LDSH_I	ldsh	[%r10 + 0x0e58], %r7
	.word 0xcaf2a9b0  ! 938: STXA_I	stxa	%r5, [%r10 + 0x09b0] %asi
	.word 0x8143c000  ! 939: STBAR	stbar
	.word 0xb87aa81c  ! 940: SDIV_I	sdiv 	%r10, 0x081c, %r28
	.word 0x24800001  ! 941: BLE	ble,a	<label_0x1>
	.word 0xc412aa30  ! 942: LDUH_I	lduh	[%r10 + 0x0a30], %r2
	.word 0xced2900b  ! 943: LDSHA_R	ldsha	[%r10, %r11] 0x80, %r7
	.word 0x9da2892b  ! 944: FMULs	fmuls	%f10, %f11, %f14
	.word 0xac6a800b  ! 945: UDIVX_R	udivx 	%r10, %r11, %r22
	.word 0xfafa900b  ! 946: SWAPA_R	swapa	%r29, [%r10 + %r11] 0x80
	.word 0xb0fa800b  ! 947: SDIVcc_R	sdivcc 	%r10, %r11, %r24
	.word 0x8ddaa4a4  ! 948: FLUSH_I	dis not found

	.word 0x8e4aaa18  ! 949: MULX_I	mulx 	%r10, 0x0a18, %r7
	.word 0x9c5aa058  ! 950: SMUL_I	smul 	%r10, 0x0058, %r14
	.word 0x8143c000  ! 951: STBAR	stbar
	.word 0x91a288ab  ! 952: FSUBs	fsubs	%f10, %f11, %f8
	.word 0xc5e2900b  ! 953: CASA_I	casa	[%r10] 0x80, %r11, %r2
	.word 0xae6aa2ec  ! 954: UDIVX_I	udivx 	%r10, 0x02ec, %r23
	.word 0x8143c000  ! 955: STBAR	stbar
	.word 0xd242af04  ! 956: LDSW_I	ldsw	[%r10 + 0x0f04], %r9
	.word 0xcc6a800b  ! 957: LDSTUB_R	ldstub	%r6, [%r10 + %r11]
	.word 0x83daae68  ! 958: FLUSH_I	dis not found

	.word 0x8fdaa46c  ! 959: FLUSH_I	dis not found

	.word 0x8143c000  ! 960: STBAR	stbar
	.word 0x93daa5c8  ! 961: FLUSH_I	dis not found

	.word 0x9322a58c  ! 962: MULScc_I	mulscc 	%r10, 0x058c, %r9
	.word 0xc36a800b  ! 963: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x8da288ab  ! 964: FSUBs	fsubs	%f10, %f11, %f6
	.word 0xc2c2900b  ! 965: LDSWA_R	ldswa	[%r10, %r11] 0x80, %r1
	.word 0xc26a800b  ! 966: LDSTUB_R	ldstub	%r1, [%r10 + %r11]
	.word 0xc5f2900b  ! 967: CASXA_I	casxa	[%r10] 0x80, %r11, %r2
	.word 0x3a800003  ! 968: BCC	bcc,a	<label_0x3>
	.word 0xd2a2900b  ! 969: STWA_R	stwa	%r9, [%r10 + %r11] 0x80
	.word 0xcc82ac4c  ! 970: LDUWA_I	lduwa	[%r10, + 0x0c4c] %asi, %r6
	.word 0x88fa800b  ! 971: SDIVcc_R	sdivcc 	%r10, %r11, %r4
	.word 0x06800003  ! 973: BL	bl  	<label_0x3>
	.word 0x3c800001  ! 974: BPOS	bpos,a	<label_0x1>
	.word 0xcd3aa438  ! 975: STDF_I	std	%f6, [0x0438, %r10]
	.word 0x8143c000  ! 976: STBAR	stbar
	.word 0xe0daac30  ! 977: LDXA_I	ldxa	[%r10, + 0x0c30] %asi, %r16
	.word 0x8fda800b  ! 978: FLUSH_R	dis not found

	.word 0x8143e014  ! 979: MEMBAR	membar	#LoadStore | #Lookaside 
	.word 0xfe42a840  ! 980: LDSW_I	ldsw	[%r10 + 0x0840], %r31
	.word 0xae4a800b  ! 981: MULX_R	mulx 	%r10, %r11, %r23
	.word 0xba52a5f0  ! 982: UMUL_I	umul 	%r10, 0x05f0, %r29
	.word 0xfe12abbc  ! 983: LDUH_I	lduh	[%r10 + 0x0bbc], %r31
	.word 0xfafa900b  ! 984: SWAPA_R	swapa	%r29, [%r10 + %r11] 0x80
	.word 0x04c20001  ! 985: BRLEZ	brlez  ,nt	%8,<label_0x20001>
	.word 0x92d2a3b4  ! 986: UMULcc_I	umulcc 	%r10, 0x03b4, %r9
	.word 0x91a2892b  ! 987: FMULs	fmuls	%f10, %f11, %f8
	.word 0xd09a900b  ! 988: LDDA_R	ldda	[%r10, %r11] 0x80, %r8
	.word 0x8272acc8  ! 989: UDIV_I	udiv 	%r10, 0x0cc8, %r1
	.word 0xa85a800b  ! 990: SMUL_R	smul 	%r10, %r11, %r20
	.word 0xacda800b  ! 991: SMULcc_R	smulcc 	%r10, %r11, %r22
	.word 0x83da800b  ! 992: FLUSH_R	dis not found

	.word 0x89a2882b  ! 993: FADDs	fadds	%f10, %f11, %f4
	.word 0xc3eaae94  ! 994: PREFETCHA_I	prefetcha	[%r10, + 0x0e94] %asi, #one_read
	.word 0xc692900b  ! 995: LDUHA_R	lduha	[%r10, %r11] 0x80, %r3
	.word 0xafa288ab  ! 996: FSUBs	fsubs	%f10, %f11, %f23
	.word 0x38800001  ! 998: BGU	bgu,a	<label_0x1>
	.word 0xe88aa118  ! 999: LDUBA_I	lduba	[%r10, + 0x0118] %asi, %r20
	nop
	nop
	nop
        ta      T_GOOD_TRAP
th_main_3:
        setx  MAIN_BASE_DATA_VA, %r1, %r10
        setx  0x0000000000000350, %g1, %r11
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
        setx  0x542b2bd2d87489e1, %g1, %r0
        setx  0x7b8e60d1785bc2e7, %g1, %r1
        setx  0xa1b287d6dfd57730, %g1, %r2
        setx  0xfd691a8c554e3d11, %g1, %r3
        setx  0x752da8edbcdd62e6, %g1, %r4
        setx  0x8321744ffd8f98ce, %g1, %r5
        setx  0xa2b70fdf9f46b135, %g1, %r6
        setx  0x1b8da7865c0722fb, %g1, %r7
        setx  0xaa6093848ad4b5dd, %g1, %r8
        setx  0xc4a24eeca2ebbb2f, %g1, %r9
        setx  0x63e538d2248f6336, %g1, %r12
        setx  0xd3c84d230255e7a5, %g1, %r13
        setx  0xeedf34b7bdb0c5c5, %g1, %r14
        setx  0xb626040eb904037d, %g1, %r15
        setx  0xa9cd4192de69cfff, %g1, %r16
        setx  0xb13d02b2b66d9240, %g1, %r17
        setx  0x1cad8aae58578de1, %g1, %r18
        setx  0x5ba3fe2ef17dfaf5, %g1, %r19
        setx  0xdc11c31e6e5adc1f, %g1, %r20
        setx  0x01766ada68d258f5, %g1, %r21
        setx  0xf535c46a922344ce, %g1, %r22
        setx  0xe342a26b0c525050, %g1, %r23
        setx  0x10f67ea596806b7d, %g1, %r24
        setx  0xb3b30743eaf540f3, %g1, %r25
        setx  0x68b7a3eeb21edc10, %g1, %r26
        setx  0x58e47e946aa1a723, %g1, %r27
        setx  0x598feda0d21fc30a, %g1, %r28
        setx  0x2aaa538b9dfba7a5, %g1, %r29
        setx  0xdf3052992767cc42, %g1, %r30
        setx  0xc59acb4cc52014bd, %g1, %r31
	.word 0xccf2a960  ! 5: STXA_I	stxa	%r6, [%r10 + 0x0960] %asi
	.word 0xe6b2aeb0  ! 6: STHA_I	stha	%r19, [%r10 + 0x0eb0] %asi
	.word 0xe612800b  ! 8: LDUH_R	lduh	[%r10 + %r11], %r19
	.word 0xc8ba900b  ! 9: STDA_R	stda	%r4, [%r10 + %r11] 0x80
	.word 0x8143e012  ! 10: MEMBAR	membar	#StoreLoad | #Lookaside 
	.word 0xc8da900b  ! 11: LDXA_R	ldxa	[%r10, %r11] 0x80, %r4
	.word 0x8fda800b  ! 12: FLUSH_R	dis not found

	.word 0xf49a900b  ! 13: LDDA_R	ldda	[%r10, %r11] 0x80, %r26
	.word 0xc81aadf0  ! 14: LDD_I	ldd	[%r10 + 0x0df0], %r4
	.word 0x90faae08  ! 15: SDIVcc_I	sdivcc 	%r10, 0x0e08, %r8
	.word 0x06800001  ! 16: BL	bl  	<label_0x1>
	.word 0x8143e016  ! 17: MEMBAR	membar	#StoreLoad | #LoadStore | #Lookaside 
	.word 0xca0aa8e4  ! 18: LDUB_I	ldub	[%r10 + 0x08e4], %r5
	.word 0xf81aa168  ! 19: LDD_I	ldd	[%r10 + 0x0168], %r28
	.word 0xca0a800b  ! 20: LDUB_R	ldub	[%r10 + %r11], %r5
	.word 0xcafaa3a0  ! 21: SWAPA_I	swapa	%r5, [%r10 + 0x03a0] %asi
	.word 0x8adaafdc  ! 22: SMULcc_I	smulcc 	%r10, 0x0fdc, %r5
	.word 0xc41a800b  ! 23: LDD_R	ldd	[%r10 + %r11], %r2
	.word 0xca0aaae8  ! 24: LDUB_I	ldub	[%r10 + 0x0ae8], %r5
	.word 0x82f2800b  ! 25: UDIVcc_R	udivcc 	%r10, %r11, %r1
	.word 0x9cf2800b  ! 26: UDIVcc_R	udivcc 	%r10, %r11, %r14
	.word 0xcdf2a00b  ! 27: CASXA_R	casxa	[%r10]%asi, %r11, %r6
	.word 0x8143e070  ! 28: MEMBAR	membar	#Lookaside | #MemIssue | #Sync 
	.word 0x906aa120  ! 29: UDIVX_I	udivx 	%r10, 0x0120, %r8
	.word 0x8472800b  ! 30: UDIV_R	udiv 	%r10, %r11, %r2
	.word 0x936aa740  ! 31: SDIVX_I	sdivx	%r10, 0x0740, %r9
	.word 0xbfa2892b  ! 32: FMULs	fmuls	%f10, %f11, %f31
	.word 0xba7aa04c  ! 33: SDIV_I	sdiv 	%r10, 0x004c, %r29
	.word 0x8bda800b  ! 34: FLUSH_R	dis not found

	.word 0x8143c000  ! 35: STBAR	stbar
	.word 0xbda288ab  ! 36: FSUBs	fsubs	%f10, %f11, %f30
	.word 0x8143e024  ! 37: MEMBAR	membar	#LoadStore | #MemIssue 
	.word 0xf93aa5f0  ! 38: STDF_I	std	%f28, [0x05f0, %r10]
	.word 0xccaa900b  ! 39: STBA_R	stba	%r6, [%r10 + %r11] 0x80
	.word 0xc2a2900b  ! 40: STWA_R	stwa	%r1, [%r10 + %r11] 0x80
	.word 0x8f6aa158  ! 41: SDIVX_I	sdivx	%r10, 0x0158, %r7
	.word 0xc73aae18  ! 42: STDF_I	std	%f3, [0x0e18, %r10]
	.word 0xd07a800b  ! 43: SWAP_R	swap	%r8, [%r10 + %r11]
	.word 0xfc12a17c  ! 44: LDUH_I	lduh	[%r10 + 0x017c], %r30
	.word 0xeaa2900b  ! 45: STWA_R	stwa	%r21, [%r10 + %r11] 0x80
	.word 0xc36aa858  ! 46: PREFETCH_I	prefetch	[%r10 + 0x0858], #one_read
	.word 0xcbf2a00b  ! 47: CASXA_R	casxa	[%r10]%asi, %r11, %r5
	.word 0xf5e2900b  ! 48: CASA_I	casa	[%r10] 0x80, %r11, %r26
	.word 0x93daaad0  ! 49: FLUSH_I	dis not found

	.word 0xd0b2900b  ! 50: STHA_R	stha	%r8, [%r10 + %r11] 0x80
	.word 0xc8da900b  ! 51: LDXA_R	ldxa	[%r10, %r11] 0x80, %r4
	.word 0x8c7aaf4c  ! 52: SDIV_I	sdiv 	%r10, 0x0f4c, %r6
	.word 0xccf2900b  ! 53: STXA_R	stxa	%r6, [%r10 + %r11] 0x80
	.word 0x87a2892b  ! 54: FMULs	fmuls	%f10, %f11, %f3
	.word 0xf0fa900b  ! 55: SWAPA_R	swapa	%r24, [%r10 + %r11] 0x80
	.word 0xcdf2a00b  ! 56: CASXA_R	casxa	[%r10]%asi, %r11, %r6
	.word 0xcc92900b  ! 57: LDUHA_R	lduha	[%r10, %r11] 0x80, %r6
	.word 0xca4aa400  ! 58: LDSB_I	ldsb	[%r10 + 0x0400], %r5
	.word 0xd2b2900b  ! 59: STHA_R	stha	%r9, [%r10 + %r11] 0x80
	.word 0xc522a954  ! 60: STF_I	st	%f2, [0x0954, %r10]
	.word 0xc49aa020  ! 61: LDDA_I	ldda	[%r10, + 0x0020] %asi, %r2
	.word 0xc4eaa4a4  ! 62: LDSTUBA_I	ldstuba	%r2, [%r10 + 0x04a4] %asi
	.word 0x8143e030  ! 63: MEMBAR	membar	#Lookaside | #MemIssue 
	.word 0xc442800b  ! 64: LDSW_R	ldsw	[%r10 + %r11], %r2
	.word 0xba6a800b  ! 65: UDIVX_R	udivx 	%r10, %r11, %r29
	.word 0xa07a800b  ! 66: SDIV_R	sdiv 	%r10, %r11, %r16
	.word 0xc36a800b  ! 67: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x8fda800b  ! 68: FLUSH_R	dis not found

	.word 0x8143c000  ! 69: STBAR	stbar
	.word 0xecfa900b  ! 70: SWAPA_R	swapa	%r22, [%r10 + %r11] 0x80
	.word 0x93da800b  ! 71: FLUSH_R	dis not found

	.word 0xc8faa500  ! 72: SWAPA_I	swapa	%r4, [%r10 + 0x0500] %asi
	.word 0x8fda800b  ! 73: FLUSH_R	dis not found

	.word 0xd2c2a6a4  ! 74: LDSWA_I	ldswa	[%r10, + 0x06a4] %asi, %r9
	.word 0xccc2900b  ! 75: LDSWA_R	ldswa	[%r10, %r11] 0x80, %r6
	.word 0x8ddaa6e0  ! 76: FLUSH_I	dis not found

	.word 0xd2aa900b  ! 77: STBA_R	stba	%r9, [%r10 + %r11] 0x80
	.word 0x8143e031  ! 78: MEMBAR	membar	#LoadLoad | #Lookaside | #MemIssue 
	.word 0xc3eaad8c  ! 79: PREFETCHA_I	prefetcha	[%r10, + 0x0d8c] %asi, #one_read
	.word 0xceda900b  ! 80: LDXA_R	ldxa	[%r10, %r11] 0x80, %r7
	.word 0x8a72aa6c  ! 81: UDIV_I	udiv 	%r10, 0x0a6c, %r5
	.word 0xd0aaa0c4  ! 82: STBA_I	stba	%r8, [%r10 + 0x00c4] %asi
	.word 0x8c52af8c  ! 83: UMUL_I	umul 	%r10, 0x0f8c, %r6
	.word 0x8143c000  ! 84: STBAR	stbar
	.word 0x8143c000  ! 85: STBAR	stbar
	.word 0xcc42800b  ! 86: LDSW_R	ldsw	[%r10 + %r11], %r6
	.word 0xab22a470  ! 87: MULScc_I	mulscc 	%r10, 0x0470, %r21
	.word 0x8143c000  ! 88: STBAR	stbar
	.word 0xff3aab90  ! 89: STDF_I	std	%f31, [0x0b90, %r10]
	.word 0x8143c000  ! 90: STBAR	stbar
	.word 0xa8fa800b  ! 91: SDIVcc_R	sdivcc 	%r10, %r11, %r20
	.word 0xb452a140  ! 92: UMUL_I	umul 	%r10, 0x0140, %r26
	.word 0x8143c000  ! 93: STBAR	stbar
	.word 0xd252800b  ! 94: LDSH_R	ldsh	[%r10 + %r11], %r9
	.word 0xccc2ab00  ! 95: LDSWA_I	ldswa	[%r10, + 0x0b00] %asi, %r6
	.word 0xc3eaa31c  ! 96: PREFETCHA_I	prefetcha	[%r10, + 0x031c] %asi, #one_read
	.word 0xc73aa0f0  ! 97: STDF_I	std	%f3, [0x00f0, %r10]
	.word 0x89daa28c  ! 98: FLUSH_I	dis not found

	.word 0x16800001  ! 99: BGE	bge  	<label_0x1>
	.word 0xc2d2a6ac  ! 100: LDSHA_I	ldsha	[%r10, + 0x06ac] %asi, %r1
	.word 0xc8c2ac78  ! 101: LDSWA_I	ldswa	[%r10, + 0x0c78] %asi, %r4
	.word 0x847aa3d0  ! 102: SDIV_I	sdiv 	%r10, 0x03d0, %r2
	.word 0x98f2800b  ! 103: UDIVcc_R	udivcc 	%r10, %r11, %r12
	.word 0xe47a800b  ! 104: SWAP_R	swap	%r18, [%r10 + %r11]
	.word 0x85daaee0  ! 105: FLUSH_I	dis not found

	.word 0x83daa31c  ! 106: FLUSH_I	dis not found

	.word 0x8fa289ab  ! 107: FDIVs	fdivs	%f10, %f11, %f7
	.word 0xc36a800b  ! 108: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x87daae74  ! 109: FLUSH_I	dis not found

	.word 0xca42800b  ! 111: LDSW_R	ldsw	[%r10 + %r11], %r5
	.word 0xff22a16c  ! 113: STF_I	st	%f31, [0x016c, %r10]
	.word 0xd812800b  ! 114: LDUH_R	lduh	[%r10 + %r11], %r12
	.word 0xf4ea900b  ! 115: LDSTUBA_R	ldstuba	%r26, [%r10 + %r11] 0x80
	.word 0x3e800001  ! 116: BVC	bvc,a	<label_0x1>
	.word 0x8143c000  ! 117: STBAR	stbar
	.word 0xc80a800b  ! 118: LDUB_R	ldub	[%r10 + %r11], %r4
	.word 0x0c800001  ! 120: BNEG	bneg  	<label_0x1>
	.word 0x8bda800b  ! 121: FLUSH_R	dis not found

	.word 0xd0fa900b  ! 122: SWAPA_R	swapa	%r8, [%r10 + %r11] 0x80
	.word 0x8ddaa584  ! 123: FLUSH_I	dis not found

	.word 0xc3ea900b  ! 124: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0x865aa0c4  ! 125: SMUL_I	smul 	%r10, 0x00c4, %r3
	.word 0xd0aa900b  ! 126: STBA_R	stba	%r8, [%r10 + %r11] 0x80
	.word 0xc882900b  ! 127: LDUWA_R	lduwa	[%r10, %r11] 0x80, %r4
	.word 0x90f2800b  ! 128: UDIVcc_R	udivcc 	%r10, %r11, %r8
	.word 0xba5aa600  ! 131: SMUL_I	smul 	%r10, 0x0600, %r29
	.word 0x87daabd8  ! 132: FLUSH_I	dis not found

	.word 0x8143c000  ! 133: STBAR	stbar
	.word 0xca8a900b  ! 134: LDUBA_R	lduba	[%r10, %r11] 0x80, %r5
	.word 0x8143c000  ! 135: STBAR	stbar
	.word 0x9cd2800b  ! 136: UMULcc_R	umulcc 	%r10, %r11, %r14
	.word 0xcefaa3ec  ! 137: SWAPA_I	swapa	%r7, [%r10 + 0x03ec] %asi
	.word 0x20800001  ! 138: BN	bn,a	<label_0x1>
	.word 0x8143c000  ! 139: STBAR	stbar
	.word 0xd0aaa234  ! 140: STBA_I	stba	%r8, [%r10 + 0x0234] %asi
	.word 0xc6ea900b  ! 141: LDSTUBA_R	ldstuba	%r3, [%r10 + %r11] 0x80
	.word 0xc6a2a8f8  ! 142: STWA_I	stwa	%r3, [%r10 + 0x08f8] %asi
	.word 0x9fdaa210  ! 143: FLUSH_I	dis not found

	.word 0xd2aaa594  ! 144: STBA_I	stba	%r9, [%r10 + 0x0594] %asi
	.word 0x8522800b  ! 145: MULScc_R	mulscc 	%r10, %r11, %r2
	.word 0x8dda800b  ! 146: FLUSH_R	dis not found

	.word 0xc46a800b  ! 147: LDSTUB_R	ldstub	%r2, [%r10 + %r11]
	.word 0x3a800001  ! 148: BCC	bcc,a	<label_0x1>
	.word 0xcde2900b  ! 149: CASA_I	casa	[%r10] 0x80, %r11, %r6
	.word 0xc8c2a4fc  ! 150: LDSWA_I	ldswa	[%r10, + 0x04fc] %asi, %r4
	.word 0x83a2892b  ! 151: FMULs	fmuls	%f10, %f11, %f1
	.word 0x8143e04a  ! 152: MEMBAR	membar	#StoreLoad | #StoreStore | #Sync 
	.word 0xc3eaa47c  ! 153: PREFETCHA_I	prefetcha	[%r10, + 0x047c] %asi, #one_read
	.word 0xb46aa32c  ! 154: UDIVX_I	udivx 	%r10, 0x032c, %r26
	.word 0x8bdaafd4  ! 155: FLUSH_I	dis not found

	.word 0xa44a800b  ! 157: MULX_R	mulx 	%r10, %r11, %r18
	.word 0x91daab28  ! 158: FLUSH_I	dis not found

	.word 0x87da800b  ! 159: FLUSH_R	dis not found

	.word 0xd3e2a00b  ! 160: CASA_R	casa	[%r10] %asi, %r11, %r9
	.word 0xc41aa628  ! 161: LDD_I	ldd	[%r10 + 0x0628], %r2
	.word 0x826aa700  ! 162: UDIVX_I	udivx 	%r10, 0x0700, %r1
	.word 0x12800003  ! 163: BNE	bne  	<label_0x3>
	.word 0xdc8a900b  ! 167: LDUBA_R	lduba	[%r10, %r11] 0x80, %r14
	.word 0xaef2800b  ! 168: UDIVcc_R	udivcc 	%r10, %r11, %r23
	.word 0xc482a020  ! 169: LDUWA_I	lduwa	[%r10, + 0x0020] %asi, %r2
	.word 0xacd2800b  ! 170: UMULcc_R	umulcc 	%r10, %r11, %r22
	.word 0xd0ca900b  ! 171: LDSBA_R	ldsba	[%r10, %r11] 0x80, %r8
	.word 0x84d2a960  ! 172: UMULcc_I	umulcc 	%r10, 0x0960, %r2
	.word 0x8143c000  ! 173: STBAR	stbar
	.word 0xdcb2900b  ! 174: STHA_R	stha	%r14, [%r10 + %r11] 0x80
	.word 0x9c4aaaa0  ! 175: MULX_I	mulx 	%r10, 0x0aa0, %r14
	.word 0xd122a924  ! 176: STF_I	st	%f8, [0x0924, %r10]
	.word 0x02800001  ! 177: BE	be  	<label_0x1>
	.word 0xdcdaa1b8  ! 178: LDXA_I	ldxa	[%r10, + 0x01b8] %asi, %r14
	.word 0xc3eaae58  ! 179: PREFETCHA_I	prefetcha	[%r10, + 0x0e58] %asi, #one_read
	.word 0x8143e075  ! 180: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside | #MemIssue | #Sync 
	.word 0xa052ace8  ! 181: UMUL_I	umul 	%r10, 0x0ce8, %r16
	.word 0x82faac38  ! 182: SDIVcc_I	sdivcc 	%r10, 0x0c38, %r1
	.word 0xa96aacc4  ! 183: SDIVX_I	sdivx	%r10, 0x0cc4, %r20
	.word 0x8e5aa020  ! 184: SMUL_I	smul 	%r10, 0x0020, %r7
	.word 0xec6a800b  ! 187: LDSTUB_R	ldstub	%r22, [%r10 + %r11]
	.word 0x93daa588  ! 188: FLUSH_I	dis not found

	.word 0xec1a800b  ! 189: LDD_R	ldd	[%r10 + %r11], %r22
	.word 0xcbf2a00b  ! 190: CASXA_R	casxa	[%r10]%asi, %r11, %r5
	.word 0xc87aa8b8  ! 191: SWAP_I	swap	%r4, [%r10 + 0x08b8]
	.word 0xc44a800b  ! 192: LDSB_R	ldsb	[%r10 + %r11], %r2
	.word 0x8ddaa1a8  ! 193: FLUSH_I	dis not found

	.word 0x2cca0001  ! 194: BRGZ	brgz,a,pt	%8,<label_0xa0001>
	.word 0x8cf2800b  ! 195: UDIVcc_R	udivcc 	%r10, %r11, %r6
	.word 0x8da289ab  ! 196: FDIVs	fdivs	%f10, %f11, %f6
	.word 0xd242800b  ! 197: LDSW_R	ldsw	[%r10 + %r11], %r9
	.word 0x8dda800b  ! 198: FLUSH_R	dis not found

	.word 0x3a800001  ! 199: BCC	bcc,a	<label_0x1>
	.word 0x9072800b  ! 200: UDIV_R	udiv 	%r10, %r11, %r8
	.word 0x2ac20001  ! 201: BRNZ	brnz,a,nt	%8,<label_0x20001>
	.word 0xe2c2a698  ! 202: LDSWA_I	ldswa	[%r10, + 0x0698] %asi, %r17
	.word 0xf8b2a53c  ! 203: STHA_I	stha	%r28, [%r10 + 0x053c] %asi
	.word 0xa272a4d0  ! 204: UDIV_I	udiv 	%r10, 0x04d0, %r17
	.word 0xcad2a6c4  ! 205: LDSHA_I	ldsha	[%r10, + 0x06c4] %asi, %r5
	.word 0xdeea900b  ! 206: LDSTUBA_R	ldstuba	%r15, [%r10 + %r11] 0x80
	.word 0xbed2a264  ! 207: UMULcc_I	umulcc 	%r10, 0x0264, %r31
	.word 0x8143e004  ! 208: MEMBAR	membar	#LoadStore 
	.word 0xe6ca900b  ! 209: LDSBA_R	ldsba	[%r10, %r11] 0x80, %r19
	.word 0xc6c2900b  ! 210: LDSWA_R	ldswa	[%r10, %r11] 0x80, %r3
	.word 0xc36aa59c  ! 211: PREFETCH_I	prefetch	[%r10 + 0x059c], #one_read
	.word 0x8a52800b  ! 212: UMUL_R	umul 	%r10, %r11, %r5
	.word 0x83a289ab  ! 213: FDIVs	fdivs	%f10, %f11, %f1
	.word 0x88faa724  ! 214: SDIVcc_I	sdivcc 	%r10, 0x0724, %r4
	.word 0x8143e04b  ! 215: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Sync 
	.word 0xc202800b  ! 216: LDUW_R	lduw	[%r10 + %r11], %r1
	.word 0xd8a2acb0  ! 217: STWA_I	stwa	%r12, [%r10 + 0x0cb0] %asi
	.word 0xbdda800b  ! 218: FLUSH_R	dis not found

	.word 0x89daa7c0  ! 219: FLUSH_I	dis not found

	.word 0x0ac20001  ! 221: BRNZ	brnz  ,nt	%8,<label_0x20001>
	.word 0x8452a098  ! 222: UMUL_I	umul 	%r10, 0x0098, %r2
	.word 0x8da2882b  ! 223: FADDs	fadds	%f10, %f11, %f6
	.word 0xc4fa900b  ! 224: SWAPA_R	swapa	%r2, [%r10 + %r11] 0x80
	.word 0x866a800b  ! 225: UDIVX_R	udivx 	%r10, %r11, %r3
	.word 0x8a4aa248  ! 226: MULX_I	mulx 	%r10, 0x0248, %r5
	.word 0xc73a800b  ! 227: STDF_R	std	%f3, [%r11, %r10]
	.word 0x86d2ae38  ! 228: UMULcc_I	umulcc 	%r10, 0x0e38, %r3
	.word 0xdc4aa91c  ! 229: LDSB_I	ldsb	[%r10 + 0x091c], %r14
	.word 0xd212a444  ! 230: LDUH_I	lduh	[%r10 + 0x0444], %r9
	.word 0xcc7a800b  ! 231: SWAP_R	swap	%r6, [%r10 + %r11]
	.word 0xceaaabcc  ! 232: STBA_I	stba	%r7, [%r10 + 0x0bcc] %asi
	.word 0xcde2a00b  ! 233: CASA_R	casa	[%r10] %asi, %r11, %r6
	.word 0x8143c000  ! 234: STBAR	stbar
	.word 0x02ca0001  ! 235: BRZ	brz  ,pt	%8,<label_0xa0001>
	.word 0xc36a800b  ! 236: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0xd2fa900b  ! 237: SWAPA_R	swapa	%r9, [%r10 + %r11] 0x80
	.word 0xc9e2a00b  ! 238: CASA_R	casa	[%r10] %asi, %r11, %r4
	.word 0xd2f2900b  ! 239: STXA_R	stxa	%r9, [%r10 + %r11] 0x80
	.word 0x0cc20003  ! 240: BRGZ	brgz  ,nt	%8,<label_0x20003>
	.word 0x93daac80  ! 242: FLUSH_I	dis not found

	.word 0x3a800001  ! 243: BCC	bcc,a	<label_0x1>
	.word 0x8143c000  ! 244: STBAR	stbar
	.word 0xb9da800b  ! 245: FLUSH_R	dis not found

	.word 0xcf22800b  ! 246: STF_R	st	%f7, [%r11, %r10]
	.word 0x87da800b  ! 247: FLUSH_R	dis not found

	.word 0xc442800b  ! 248: LDSW_R	ldsw	[%r10 + %r11], %r2
	.word 0x84f2800b  ! 249: UDIVcc_R	udivcc 	%r10, %r11, %r2
	.word 0xd01a800b  ! 250: LDD_R	ldd	[%r10 + %r11], %r8
	.word 0xc3ea900b  ! 251: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0xdaf2a5b8  ! 252: STXA_I	stxa	%r13, [%r10 + 0x05b8] %asi
	.word 0x92d2a7e8  ! 253: UMULcc_I	umulcc 	%r10, 0x07e8, %r9
	.word 0x38800001  ! 254: BGU	bgu,a	<label_0x1>
	.word 0x8252a5bc  ! 255: UMUL_I	umul 	%r10, 0x05bc, %r1
	.word 0x8472a32c  ! 256: UDIV_I	udiv 	%r10, 0x032c, %r2
	.word 0x87daa624  ! 257: FLUSH_I	dis not found

	.word 0xcaa2900b  ! 258: STWA_R	stwa	%r5, [%r10 + %r11] 0x80
	.word 0x93a288ab  ! 259: FSUBs	fsubs	%f10, %f11, %f9
	.word 0x9252a6ac  ! 260: UMUL_I	umul 	%r10, 0x06ac, %r9
	.word 0x8a6aa84c  ! 261: UDIVX_I	udivx 	%r10, 0x084c, %r5
	.word 0x8ddaa9cc  ! 262: FLUSH_I	dis not found

	.word 0x8bda800b  ! 263: FLUSH_R	dis not found

	.word 0xdb3a800b  ! 264: STDF_R	std	%f13, [%r11, %r10]
	.word 0x1c800001  ! 265: BPOS	bpos  	<label_0x1>
	.word 0x93daa180  ! 266: FLUSH_I	dis not found

	.word 0x8ba289ab  ! 267: FDIVs	fdivs	%f10, %f11, %f5
	.word 0xe01a800b  ! 268: LDD_R	ldd	[%r10 + %r11], %r16
	.word 0x40000003  ! 269: CALL	call	disp30_3
	.word 0xe5e2a00b  ! 270: CASA_R	casa	[%r10] %asi, %r11, %r18
	.word 0xc20aa1d8  ! 271: LDUB_I	ldub	[%r10 + 0x01d8], %r1
	.word 0x8143c000  ! 272: STBAR	stbar
	.word 0xd09aaca8  ! 273: LDDA_I	ldda	[%r10, + 0x0ca8] %asi, %r8
	.word 0x32800001  ! 274: BNE	bne,a	<label_0x1>
	.word 0x8d6aa320  ! 275: SDIVX_I	sdivx	%r10, 0x0320, %r6
	.word 0xd8aa900b  ! 276: STBA_R	stba	%r12, [%r10 + %r11] 0x80
	.word 0x8672800b  ! 277: UDIV_R	udiv 	%r10, %r11, %r3
	.word 0x8143c000  ! 278: STBAR	stbar
	.word 0xb2da800b  ! 279: SMULcc_R	smulcc 	%r10, %r11, %r25
	.word 0xd09a900b  ! 280: LDDA_R	ldda	[%r10, %r11] 0x80, %r8
	.word 0xc80a800b  ! 281: LDUB_R	ldub	[%r10 + %r11], %r4
	.word 0xbc52a748  ! 282: UMUL_I	umul 	%r10, 0x0748, %r30
	.word 0xb85aa258  ! 283: SMUL_I	smul 	%r10, 0x0258, %r28
	.word 0xd8f2900b  ! 284: STXA_R	stxa	%r12, [%r10 + %r11] 0x80
	.word 0xc4aaa3e4  ! 285: STBA_I	stba	%r2, [%r10 + 0x03e4] %asi
	.word 0x91da800b  ! 286: FLUSH_R	dis not found

	.word 0xfaeaa0b8  ! 287: LDSTUBA_I	ldstuba	%r29, [%r10 + 0x00b8] %asi
	.word 0xa7da800b  ! 288: FLUSH_R	dis not found

	.word 0x00800001  ! 289: BN	bn  	<label_0x1>
	.word 0xd252800b  ! 290: LDSH_R	ldsh	[%r10 + %r11], %r9
	.word 0xb522800b  ! 291: MULScc_R	mulscc 	%r10, %r11, %r26
	.word 0x8143c000  ! 292: STBAR	stbar
	.word 0xcc8aa140  ! 293: LDUBA_I	lduba	[%r10, + 0x0140] %asi, %r6
	.word 0x8adaabf8  ! 294: SMULcc_I	smulcc 	%r10, 0x0bf8, %r5
	.word 0xdf3a800b  ! 295: STDF_R	std	%f15, [%r11, %r10]
	.word 0x8272800b  ! 296: UDIV_R	udiv 	%r10, %r11, %r1
	.word 0xc4faa860  ! 297: SWAPA_I	swapa	%r2, [%r10 + 0x0860] %asi
	.word 0xc36a800b  ! 298: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0xcab2900b  ! 299: STHA_R	stha	%r5, [%r10 + %r11] 0x80
	.word 0xd3f2a00b  ! 300: CASXA_R	casxa	[%r10]%asi, %r11, %r9
	.word 0x84d2800b  ! 301: UMULcc_R	umulcc 	%r10, %r11, %r2
	.word 0xc0ba900b  ! 302: STDA_R	stda	%r0, [%r10 + %r11] 0x80
	.word 0x8143c000  ! 303: STBAR	stbar
	.word 0x8cd2800b  ! 304: UMULcc_R	umulcc 	%r10, %r11, %r6
	.word 0xd2caa1d0  ! 305: LDSBA_I	ldsba	[%r10, + 0x01d0] %asi, %r9
	.word 0xc4baa348  ! 306: STDA_I	stda	%r2, [%r10 + 0x0348] %asi
	.word 0xc5e2a00b  ! 307: CASA_R	casa	[%r10] %asi, %r11, %r2
	.word 0xc5f2a00b  ! 308: CASXA_R	casxa	[%r10]%asi, %r11, %r2
	.word 0xb6faaa3c  ! 309: SDIVcc_I	sdivcc 	%r10, 0x0a3c, %r27
	.word 0xc4a2900b  ! 310: STWA_R	stwa	%r2, [%r10 + %r11] 0x80
	.word 0x8143e063  ! 311: MEMBAR	membar	#LoadLoad | #StoreLoad | #MemIssue | #Sync 
	.word 0xcaf2a360  ! 312: STXA_I	stxa	%r5, [%r10 + 0x0360] %asi
	.word 0xdb22800b  ! 313: STF_R	st	%f13, [%r11, %r10]
	.word 0xc73a800b  ! 314: STDF_R	std	%f3, [%r11, %r10]
	.word 0xccaaa608  ! 315: STBA_I	stba	%r6, [%r10 + 0x0608] %asi
	.word 0xc2ea900b  ! 316: LDSTUBA_R	ldstuba	%r1, [%r10 + %r11] 0x80
	.word 0x38800001  ! 317: BGU	bgu,a	<label_0x1>
	.word 0xe67aafd8  ! 318: SWAP_I	swap	%r19, [%r10 + 0x0fd8]
	.word 0x8f22800b  ! 319: MULScc_R	mulscc 	%r10, %r11, %r7
	.word 0xc8fa900b  ! 320: SWAPA_R	swapa	%r4, [%r10 + %r11] 0x80
	.word 0x2c800001  ! 321: BNEG	bneg,a	<label_0x1>
	.word 0xc722800b  ! 322: STF_R	st	%f3, [%r11, %r10]
	.word 0xc9f2900b  ! 323: CASXA_I	casxa	[%r10] 0x80, %r11, %r4
	.word 0x2c800001  ! 324: BNEG	bneg,a	<label_0x1>
	.word 0xd252a1fc  ! 325: LDSH_I	ldsh	[%r10 + 0x01fc], %r9
	.word 0xc3eaa9e4  ! 326: PREFETCHA_I	prefetcha	[%r10, + 0x09e4] %asi, #one_read
	.word 0xd09aa340  ! 328: LDDA_I	ldda	[%r10, + 0x0340] %asi, %r8
	.word 0x98fa800b  ! 329: SDIVcc_R	sdivcc 	%r10, %r11, %r12
	.word 0x8143c000  ! 330: STBAR	stbar
	.word 0xc202af5c  ! 331: LDUW_I	lduw	[%r10 + 0x0f5c], %r1
	.word 0x8ba2892b  ! 332: FMULs	fmuls	%f10, %f11, %f5
	.word 0x8143c000  ! 334: STBAR	stbar
	.word 0xf66aa610  ! 335: LDSTUB_I	ldstub	%r27, [%r10 + 0x0610]
	.word 0x87daa2f4  ! 336: FLUSH_I	dis not found

	.word 0x87daa4bc  ! 337: FLUSH_I	dis not found

	.word 0x0c800003  ! 338: BNEG	bneg  	<label_0x3>
	.word 0xa3a288ab  ! 340: FSUBs	fsubs	%f10, %f11, %f17
	.word 0xbaf2aa9c  ! 341: UDIVcc_I	udivcc 	%r10, 0x0a9c, %r29
	.word 0x8dda800b  ! 342: FLUSH_R	dis not found

	.word 0xcc9a900b  ! 343: LDDA_R	ldda	[%r10, %r11] 0x80, %r6
	.word 0x9cf2a8c8  ! 344: UDIVcc_I	udivcc 	%r10, 0x08c8, %r14
	.word 0xca4a800b  ! 345: LDSB_R	ldsb	[%r10 + %r11], %r5
	.word 0x88f2a748  ! 346: UDIVcc_I	udivcc 	%r10, 0x0748, %r4
	.word 0x845aab1c  ! 347: SMUL_I	smul 	%r10, 0x0b1c, %r2
	.word 0xac7a800b  ! 348: SDIV_R	sdiv 	%r10, %r11, %r22
	.word 0x8e72af18  ! 349: UDIV_I	udiv 	%r10, 0x0f18, %r7
	.word 0x8143c000  ! 350: STBAR	stbar
	.word 0x40000001  ! 351: CALL	call	disp30_1
	.word 0xf28aa6e8  ! 352: LDUBA_I	lduba	[%r10, + 0x06e8] %asi, %r25
	.word 0x8143e047  ! 353: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Sync 
	.word 0xde82900b  ! 354: LDUWA_R	lduwa	[%r10, %r11] 0x80, %r15
	.word 0x86f2800b  ! 355: UDIVcc_R	udivcc 	%r10, %r11, %r3
	.word 0x89a2882b  ! 356: FADDs	fadds	%f10, %f11, %f4
	.word 0xaad2800b  ! 357: UMULcc_R	umulcc 	%r10, %r11, %r21
	.word 0xcecaac8c  ! 358: LDSBA_I	ldsba	[%r10, + 0x0c8c] %asi, %r7
	.word 0xc3ea900b  ! 359: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0xa67aac8c  ! 360: SDIV_I	sdiv 	%r10, 0x0c8c, %r19
	.word 0x89daa800  ! 361: FLUSH_I	dis not found

	.word 0x8143c000  ! 363: STBAR	stbar
	.word 0x8143c000  ! 364: STBAR	stbar
	.word 0xcad2900b  ! 365: LDSHA_R	ldsha	[%r10, %r11] 0x80, %r5
	.word 0xfaca900b  ! 366: LDSBA_R	ldsba	[%r10, %r11] 0x80, %r29
	.word 0xb252a974  ! 368: UMUL_I	umul 	%r10, 0x0974, %r25
	.word 0x8143e03e  ! 369: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0x8e52a9cc  ! 370: UMUL_I	umul 	%r10, 0x09cc, %r7
	.word 0x8143e03b  ! 371: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Lookaside | #MemIssue 
	.word 0xce42a7a8  ! 372: LDSW_I	ldsw	[%r10 + 0x07a8], %r7
	.word 0x89da800b  ! 373: FLUSH_R	dis not found

	.word 0x90faa038  ! 374: SDIVcc_I	sdivcc 	%r10, 0x0038, %r8
	.word 0xcc7aaa98  ! 375: SWAP_I	swap	%r6, [%r10 + 0x0a98]
	.word 0xb1a288ab  ! 376: FSUBs	fsubs	%f10, %f11, %f24
	.word 0xc3ea900b  ! 377: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0xba72800b  ! 378: UDIV_R	udiv 	%r10, %r11, %r29
	.word 0x8143e03f  ! 379: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0x824a800b  ! 380: MULX_R	mulx 	%r10, %r11, %r1
	.word 0x12800001  ! 381: BNE	bne  	<label_0x1>
	.word 0x9bdaab8c  ! 382: FLUSH_I	dis not found

	.word 0x8143c000  ! 383: STBAR	stbar
	.word 0xf4a2ace4  ! 384: STWA_I	stwa	%r26, [%r10 + 0x0ce4] %asi
	.word 0x8143c000  ! 385: STBAR	stbar
	.word 0xdaca900b  ! 387: LDSBA_R	ldsba	[%r10, %r11] 0x80, %r13
	.word 0xa3da800b  ! 388: FLUSH_R	dis not found

	.word 0xd0ba900b  ! 389: STDA_R	stda	%r8, [%r10 + %r11] 0x80
	.word 0xc27aac50  ! 390: SWAP_I	swap	%r1, [%r10 + 0x0c50]
	.word 0x8143e04a  ! 391: MEMBAR	membar	#StoreLoad | #StoreStore | #Sync 
	.word 0x8143e06e  ! 392: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #MemIssue | #Sync 
	.word 0x8143e015  ! 393: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside 
	.word 0xc36aa2ec  ! 394: PREFETCH_I	prefetch	[%r10 + 0x02ec], #one_read
	.word 0xce5aa5c8  ! 395: LDX_I	ldx	[%r10 + 0x05c8], %r7
	.word 0xc6daafd8  ! 396: LDXA_I	ldxa	[%r10, + 0x0fd8] %asi, %r3
	.word 0xaddaad80  ! 397: FLUSH_I	dis not found

	.word 0x8143c000  ! 398: STBAR	stbar
	.word 0xbfda800b  ! 399: FLUSH_R	dis not found

	.word 0xcf3aa838  ! 400: STDF_I	std	%f7, [0x0838, %r10]
	.word 0xd25a800b  ! 401: LDX_R	ldx	[%r10 + %r11], %r9
	.word 0x88f2a60c  ! 402: UDIVcc_I	udivcc 	%r10, 0x060c, %r4
	.word 0x93da800b  ! 403: FLUSH_R	dis not found

	.word 0x9252800b  ! 404: UMUL_R	umul 	%r10, %r11, %r9
	.word 0x1c800001  ! 405: BPOS	bpos  	<label_0x1>
	.word 0xd33aab40  ! 406: STDF_I	std	%f9, [0x0b40, %r10]
	.word 0xc2b2ae6c  ! 407: STHA_I	stha	%r1, [%r10 + 0x0e6c] %asi
	.word 0xd0ca900b  ! 408: LDSBA_R	ldsba	[%r10, %r11] 0x80, %r8
	.word 0xe412800b  ! 409: LDUH_R	lduh	[%r10 + %r11], %r18
	.word 0xce4a800b  ! 410: LDSB_R	ldsb	[%r10 + %r11], %r7
	.word 0x26800001  ! 411: BL	bl,a	<label_0x1>
	.word 0xeaa2a9d8  ! 412: STWA_I	stwa	%r21, [%r10 + 0x09d8] %asi
	.word 0x865a800b  ! 413: SMUL_R	smul 	%r10, %r11, %r3
	.word 0x3a800003  ! 414: BCC	bcc,a	<label_0x3>
	.word 0x12800001  ! 415: BNE	bne  	<label_0x1>
	.word 0x86da800b  ! 416: SMULcc_R	smulcc 	%r10, %r11, %r3
	.word 0xc36a800b  ! 417: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0xc24aae44  ! 418: LDSB_I	ldsb	[%r10 + 0x0e44], %r1
	.word 0xc4aa900b  ! 419: STBA_R	stba	%r2, [%r10 + %r11] 0x80
	.word 0x8143c000  ! 420: STBAR	stbar
	.word 0xc4aaa2a0  ! 422: STBA_I	stba	%r2, [%r10 + 0x02a0] %asi
	.word 0xcceaac04  ! 423: LDSTUBA_I	ldstuba	%r6, [%r10 + 0x0c04] %asi
	.word 0x90fa800b  ! 425: SDIVcc_R	sdivcc 	%r10, %r11, %r8
	.word 0x8143e03d  ! 426: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0xac52800b  ! 427: UMUL_R	umul 	%r10, %r11, %r22
	.word 0x00800001  ! 428: BN	bn  	<label_0x1>
	.word 0xa27aa628  ! 429: SDIV_I	sdiv 	%r10, 0x0628, %r17
	.word 0x2cc20001  ! 430: BRGZ	brgz,a,nt	%8,<label_0x20001>
	.word 0xcaf2900b  ! 431: STXA_R	stxa	%r5, [%r10 + %r11] 0x80
	.word 0x8143c000  ! 432: STBAR	stbar
	.word 0xc6a2ae80  ! 433: STWA_I	stwa	%r3, [%r10 + 0x0e80] %asi
	.word 0xc8eaa064  ! 434: LDSTUBA_I	ldstuba	%r4, [%r10 + 0x0064] %asi
	.word 0xbc6a800b  ! 435: UDIVX_R	udivx 	%r10, %r11, %r30
	.word 0x8af2800b  ! 436: UDIVcc_R	udivcc 	%r10, %r11, %r5
	.word 0x22c20001  ! 437: BRZ	brz,a,nt	%8,<label_0x20001>
	.word 0xc3eaab9c  ! 438: PREFETCHA_I	prefetcha	[%r10, + 0x0b9c] %asi, #one_read
	.word 0xc482af04  ! 439: LDUWA_I	lduwa	[%r10, + 0x0f04] %asi, %r2
	.word 0x8143e06a  ! 440: MEMBAR	membar	#StoreLoad | #StoreStore | #MemIssue | #Sync 
	.word 0xdc0aa4ec  ! 441: LDUB_I	ldub	[%r10 + 0x04ec], %r14
	.word 0xda52a4c8  ! 442: LDSH_I	ldsh	[%r10 + 0x04c8], %r13
	.word 0x83a2892b  ! 443: FMULs	fmuls	%f10, %f11, %f1
	.word 0x936aa368  ! 444: SDIVX_I	sdivx	%r10, 0x0368, %r9
	.word 0xc322800b  ! 445: STF_R	st	%f1, [%r11, %r10]
	.word 0xcea2a6e8  ! 446: STWA_I	stwa	%r7, [%r10 + 0x06e8] %asi
	.word 0xa052800b  ! 447: UMUL_R	umul 	%r10, %r11, %r16
	.word 0xa8f2a13c  ! 448: UDIVcc_I	udivcc 	%r10, 0x013c, %r20
	.word 0xf922800b  ! 450: STF_R	st	%f28, [%r11, %r10]
	.word 0x24800003  ! 451: BLE	ble,a	<label_0x3>
	.word 0xcca2900b  ! 452: STWA_R	stwa	%r6, [%r10 + %r11] 0x80
	.word 0xc67aa564  ! 453: SWAP_I	swap	%r3, [%r10 + 0x0564]
	.word 0xfe7aa690  ! 454: SWAP_I	swap	%r31, [%r10 + 0x0690]
	.word 0x8143e01b  ! 455: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Lookaside 
	.word 0x1a800001  ! 456: BCC	bcc  	<label_0x1>
	.word 0xd20a800b  ! 457: LDUB_R	ldub	[%r10 + %r11], %r9
	.word 0x9dda800b  ! 458: FLUSH_R	dis not found

	.word 0x1a800001  ! 459: BCC	bcc  	<label_0x1>
	.word 0xf6aaa740  ! 460: STBA_I	stba	%r27, [%r10 + 0x0740] %asi
	.word 0x8322a73c  ! 461: MULScc_I	mulscc 	%r10, 0x073c, %r1
	.word 0x8143c000  ! 462: STBAR	stbar
	.word 0xc3ea900b  ! 463: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0xe60aad8c  ! 464: LDUB_I	ldub	[%r10 + 0x0d8c], %r19
	.word 0x88d2800b  ! 465: UMULcc_R	umulcc 	%r10, %r11, %r4
	.word 0x91da800b  ! 466: FLUSH_R	dis not found

	.word 0x8afaa918  ! 467: SDIVcc_I	sdivcc 	%r10, 0x0918, %r5
	.word 0xc27a800b  ! 468: SWAP_R	swap	%r1, [%r10 + %r11]
	.word 0x8143c000  ! 469: STBAR	stbar
	.word 0xf882900b  ! 470: LDUWA_R	lduwa	[%r10, %r11] 0x80, %r28
	.word 0x8143c000  ! 471: STBAR	stbar
	.word 0xc282900b  ! 472: LDUWA_R	lduwa	[%r10, %r11] 0x80, %r1
	.word 0xd1e2900b  ! 473: CASA_I	casa	[%r10] 0x80, %r11, %r8
	.word 0xc73aa7f0  ! 474: STDF_I	std	%f3, [0x07f0, %r10]
	.word 0x0ac20001  ! 475: BRNZ	brnz  ,nt	%8,<label_0x20001>
	.word 0xc6aa900b  ! 476: STBA_R	stba	%r3, [%r10 + %r11] 0x80
	.word 0x89daa53c  ! 477: FLUSH_I	dis not found

	.word 0x8272800b  ! 478: UDIV_R	udiv 	%r10, %r11, %r1
	.word 0x8bdaab44  ! 479: FLUSH_I	dis not found

	.word 0x8143e072  ! 480: MEMBAR	membar	#StoreLoad | #Lookaside | #MemIssue | #Sync 
	.word 0xdaf2900b  ! 481: STXA_R	stxa	%r13, [%r10 + %r11] 0x80
	.word 0xc36aab68  ! 482: PREFETCH_I	prefetch	[%r10 + 0x0b68], #one_read
	.word 0x8143e071  ! 483: MEMBAR	membar	#LoadLoad | #Lookaside | #MemIssue | #Sync 
	.word 0xc2f2a828  ! 484: STXA_I	stxa	%r1, [%r10 + 0x0828] %asi
	.word 0x92f2a67c  ! 485: UDIVcc_I	udivcc 	%r10, 0x067c, %r9
	.word 0xc5e2900b  ! 486: CASA_I	casa	[%r10] 0x80, %r11, %r2
	.word 0x8efa800b  ! 487: SDIVcc_R	sdivcc 	%r10, %r11, %r7
	.word 0x26ca0003  ! 488: BRLZ	brlz,a,pt	%8,<label_0xa0003>
	.word 0xe81aaf58  ! 489: LDD_I	ldd	[%r10 + 0x0f58], %r20
	.word 0x26ca0003  ! 490: BRLZ	brlz,a,pt	%8,<label_0xa0003>
	.word 0x8d6a800b  ! 491: SDIVX_R	sdivx	%r10, %r11, %r6
	.word 0xe06a800b  ! 492: LDSTUB_R	ldstub	%r16, [%r10 + %r11]
	.word 0xd2a2ab08  ! 493: STWA_I	stwa	%r9, [%r10 + 0x0b08] %asi
	.word 0xa2f2accc  ! 494: UDIVcc_I	udivcc 	%r10, 0x0ccc, %r17
	.word 0xf8ba900b  ! 495: STDA_R	stda	%r28, [%r10 + %r11] 0x80
	.word 0x8143e044  ! 496: MEMBAR	membar	#LoadStore | #Sync 
	.word 0x9ba289ab  ! 497: FDIVs	fdivs	%f10, %f11, %f13
	.word 0x0eca0003  ! 498: BRGEZ	brgez  ,pt	%8,<label_0xa0003>
	.word 0x10800003  ! 499: BA	ba  	<label_0x3>
	.word 0xd2caac70  ! 500: LDSBA_I	ldsba	[%r10, + 0x0c70] %asi, %r9
	.word 0xced2900b  ! 501: LDSHA_R	ldsha	[%r10, %r11] 0x80, %r7
	.word 0xbfdaada0  ! 502: FLUSH_I	dis not found

	.word 0x84fa800b  ! 503: SDIVcc_R	sdivcc 	%r10, %r11, %r2
	.word 0xbbda800b  ! 504: FLUSH_R	dis not found

	.word 0xc922800b  ! 505: STF_R	st	%f4, [%r11, %r10]
	.word 0xce8aaab0  ! 506: LDUBA_I	lduba	[%r10, + 0x0ab0] %asi, %r7
	.word 0xc252800b  ! 507: LDSH_R	ldsh	[%r10 + %r11], %r1
	.word 0xcc52800b  ! 508: LDSH_R	ldsh	[%r10 + %r11], %r6
	.word 0xc27a800b  ! 509: SWAP_R	swap	%r1, [%r10 + %r11]
	.word 0xf452a64c  ! 510: LDSH_I	ldsh	[%r10 + 0x064c], %r26
	.word 0xc2aaaafc  ! 511: STBA_I	stba	%r1, [%r10 + 0x0afc] %asi
	.word 0xbaf2800b  ! 512: UDIVcc_R	udivcc 	%r10, %r11, %r29
	.word 0x8143c000  ! 513: STBAR	stbar
	.word 0xb1daafcc  ! 514: FLUSH_I	dis not found

	.word 0xc3ea900b  ! 515: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0xde42800b  ! 516: LDSW_R	ldsw	[%r10 + %r11], %r15
	.word 0x8ed2a860  ! 517: UMULcc_I	umulcc 	%r10, 0x0860, %r7
	.word 0xe28a900b  ! 518: LDUBA_R	lduba	[%r10, %r11] 0x80, %r17
	.word 0x8bda800b  ! 519: FLUSH_R	dis not found

	.word 0xccb2aff0  ! 520: STHA_I	stha	%r6, [%r10 + 0x0ff0] %asi
	.word 0x847a800b  ! 521: SDIV_R	sdiv 	%r10, %r11, %r2
	.word 0xc73aaf70  ! 522: STDF_I	std	%f3, [0x0f70, %r10]
	.word 0xd0ca900b  ! 524: LDSBA_R	ldsba	[%r10, %r11] 0x80, %r8
	.word 0xd092900b  ! 525: LDUHA_R	lduha	[%r10, %r11] 0x80, %r8
	.word 0xd322a38c  ! 526: STF_I	st	%f9, [0x038c, %r10]
	.word 0x8872a0d4  ! 527: UDIV_I	udiv 	%r10, 0x00d4, %r4
	.word 0x93daa404  ! 528: FLUSH_I	dis not found

	.word 0xd0aaae18  ! 529: STBA_I	stba	%r8, [%r10 + 0x0e18] %asi
	.word 0xaafaac0c  ! 530: SDIVcc_I	sdivcc 	%r10, 0x0c0c, %r21
	.word 0xeb3a800b  ! 531: STDF_R	std	%f21, [%r11, %r10]
	.word 0x8bda800b  ! 532: FLUSH_R	dis not found

	.word 0xc602a4ac  ! 533: LDUW_I	lduw	[%r10 + 0x04ac], %r3
	.word 0xc802a5c0  ! 534: LDUW_I	lduw	[%r10 + 0x05c0], %r4
	.word 0x8143e056  ! 535: MEMBAR	membar	#StoreLoad | #LoadStore | #Lookaside | #Sync 
	.word 0x82d2aa78  ! 536: UMULcc_I	umulcc 	%r10, 0x0a78, %r1
	.word 0x87da800b  ! 537: FLUSH_R	dis not found

	.word 0xc36a800b  ! 538: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x8a72a738  ! 539: UDIV_I	udiv 	%r10, 0x0738, %r5
	.word 0xc88a900b  ! 540: LDUBA_R	lduba	[%r10, %r11] 0x80, %r4
	.word 0x8143c000  ! 541: STBAR	stbar
	.word 0x8bdaac9c  ! 542: FLUSH_I	dis not found

	.word 0x8143c000  ! 543: STBAR	stbar
	.word 0x8fa289ab  ! 544: FDIVs	fdivs	%f10, %f11, %f7
	.word 0xeef2a468  ! 545: STXA_I	stxa	%r23, [%r10 + 0x0468] %asi
	.word 0x92daa988  ! 546: SMULcc_I	smulcc 	%r10, 0x0988, %r9
	.word 0xf602800b  ! 547: LDUW_R	lduw	[%r10 + %r11], %r27
	.word 0x9efaafdc  ! 548: SDIVcc_I	sdivcc 	%r10, 0x0fdc, %r15
	.word 0xda4a800b  ! 549: LDSB_R	ldsb	[%r10 + %r11], %r13
	.word 0xd09a900b  ! 550: LDDA_R	ldda	[%r10, %r11] 0x80, %r8
	.word 0xc44aaa94  ! 551: LDSB_I	ldsb	[%r10 + 0x0a94], %r2
	.word 0xc4b2aa0c  ! 552: STHA_I	stha	%r2, [%r10 + 0x0a0c] %asi
	.word 0xc3eaa67c  ! 553: PREFETCHA_I	prefetcha	[%r10, + 0x067c] %asi, #one_read
	.word 0xa9a289ab  ! 554: FDIVs	fdivs	%f10, %f11, %f20
	.word 0xcc6aac68  ! 555: LDSTUB_I	ldstub	%r6, [%r10 + 0x0c68]
	.word 0xd2b2900b  ! 556: STHA_R	stha	%r9, [%r10 + %r11] 0x80
	.word 0x87a289ab  ! 557: FDIVs	fdivs	%f10, %f11, %f3
	.word 0xb122800b  ! 559: MULScc_R	mulscc 	%r10, %r11, %r24
	.word 0x8143c000  ! 560: STBAR	stbar
	.word 0xca8aa304  ! 561: LDUBA_I	lduba	[%r10, + 0x0304] %asi, %r5
	.word 0xe0ba900b  ! 562: STDA_R	stda	%r16, [%r10 + %r11] 0x80
	.word 0xa8d2ac10  ! 563: UMULcc_I	umulcc 	%r10, 0x0c10, %r20
	.word 0x82f2ae48  ! 565: UDIVcc_I	udivcc 	%r10, 0x0e48, %r1
	.word 0x84fa800b  ! 566: SDIVcc_R	sdivcc 	%r10, %r11, %r2
	.word 0x926aa808  ! 567: UDIVX_I	udivx 	%r10, 0x0808, %r9
	.word 0x88faabc8  ! 568: SDIVcc_I	sdivcc 	%r10, 0x0bc8, %r4
	.word 0xc3eaa4e0  ! 569: PREFETCHA_I	prefetcha	[%r10, + 0x04e0] %asi, #one_read
	.word 0x8143e05b  ! 570: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Lookaside | #Sync 
	.word 0x824aa0d0  ! 571: MULX_I	mulx 	%r10, 0x00d0, %r1
	.word 0xd01aaa68  ! 572: LDD_I	ldd	[%r10 + 0x0a68], %r8
	.word 0x22800001  ! 573: BE	be,a	<label_0x1>
	.word 0x0ec20001  ! 574: BRGEZ	brgez  ,nt	%8,<label_0x20001>
	.word 0x28800001  ! 576: BLEU	bleu,a	<label_0x1>
	.word 0x91daa9bc  ! 577: FLUSH_I	dis not found

	.word 0x864aa850  ! 578: MULX_I	mulx 	%r10, 0x0850, %r3
	.word 0xa7da800b  ! 579: FLUSH_R	dis not found

	.word 0x08800001  ! 580: BLEU	bleu  	<label_0x1>
	.word 0xc8b2ab88  ! 581: STHA_I	stha	%r4, [%r10 + 0x0b88] %asi
	.word 0xc3eaa9b8  ! 582: PREFETCHA_I	prefetcha	[%r10, + 0x09b8] %asi, #one_read
	.word 0x36800001  ! 583: BGE	bge,a	<label_0x1>
	.word 0x925a800b  ! 584: SMUL_R	smul 	%r10, %r11, %r9
	.word 0xf26aa304  ! 586: LDSTUB_I	ldstub	%r25, [%r10 + 0x0304]
	.word 0x2cc20001  ! 587: BRGZ	brgz,a,nt	%8,<label_0x20001>
	.word 0xc48aa6d8  ! 588: LDUBA_I	lduba	[%r10, + 0x06d8] %asi, %r2
	.word 0xceb2a8ac  ! 589: STHA_I	stha	%r7, [%r10 + 0x08ac] %asi
	.word 0x36800001  ! 590: BGE	bge,a	<label_0x1>
	.word 0xc612800b  ! 591: LDUH_R	lduh	[%r10 + %r11], %r3
	.word 0x10800001  ! 592: BA	ba  	<label_0x1>
	.word 0xb3a288ab  ! 593: FSUBs	fsubs	%f10, %f11, %f25
	.word 0x85daa1fc  ! 594: FLUSH_I	dis not found

	.word 0xd3e2a00b  ! 595: CASA_R	casa	[%r10] %asi, %r11, %r9
	.word 0xcb3aa068  ! 596: STDF_I	std	%f5, [0x0068, %r10]
	.word 0xd0aa900b  ! 597: STBA_R	stba	%r8, [%r10 + %r11] 0x80
	.word 0x91daa6d0  ! 598: FLUSH_I	dis not found

	.word 0xecfa900b  ! 599: SWAPA_R	swapa	%r22, [%r10 + %r11] 0x80
	.word 0x8143c000  ! 600: STBAR	stbar
	.word 0xdd22ab50  ! 601: STF_I	st	%f14, [0x0b50, %r10]
	.word 0x38800001  ! 602: BGU	bgu,a	<label_0x1>
	.word 0xf252acf0  ! 603: LDSH_I	ldsh	[%r10 + 0x0cf0], %r25
	.word 0xc36a800b  ! 604: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x22c20001  ! 605: BRZ	brz,a,nt	%8,<label_0x20001>
	.word 0x8dda800b  ! 606: FLUSH_R	dis not found

	.word 0x9bdaa7c8  ! 607: FLUSH_I	dis not found

	.word 0xd01aac10  ! 608: LDD_I	ldd	[%r10 + 0x0c10], %r8
	.word 0xceaa900b  ! 609: STBA_R	stba	%r7, [%r10 + %r11] 0x80
	.word 0xe86aa228  ! 610: LDSTUB_I	ldstub	%r20, [%r10 + 0x0228]
	.word 0x30800003  ! 611: BA	ba,a	<label_0x3>
	.word 0xf6faa5fc  ! 613: SWAPA_I	swapa	%r27, [%r10 + 0x05fc] %asi
	.word 0xbada800b  ! 614: SMULcc_R	smulcc 	%r10, %r11, %r29
	.word 0xc68a900b  ! 615: LDUBA_R	lduba	[%r10, %r11] 0x80, %r3
	.word 0xb16a800b  ! 616: SDIVX_R	sdivx	%r10, %r11, %r24
	.word 0x87daa030  ! 617: FLUSH_I	dis not found

	.word 0xcc9aad10  ! 618: LDDA_I	ldda	[%r10, + 0x0d10] %asi, %r6
	.word 0x89daa918  ! 619: FLUSH_I	dis not found

	.word 0xd8a2a108  ! 620: STWA_I	stwa	%r12, [%r10 + 0x0108] %asi
	.word 0xc4d2900b  ! 621: LDSHA_R	ldsha	[%r10, %r11] 0x80, %r2
	.word 0xc89aa0b0  ! 622: LDDA_I	ldda	[%r10, + 0x00b0] %asi, %r4
	.word 0x8ada800b  ! 623: SMULcc_R	smulcc 	%r10, %r11, %r5
	.word 0xc25a800b  ! 624: LDX_R	ldx	[%r10 + %r11], %r1
	.word 0xc36a800b  ! 625: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0xc8f2900b  ! 626: STXA_R	stxa	%r4, [%r10 + %r11] 0x80
	.word 0xd07a800b  ! 627: SWAP_R	swap	%r8, [%r10 + %r11]
	.word 0xb66aa474  ! 628: UDIVX_I	udivx 	%r10, 0x0474, %r27
	.word 0xcbe2a00b  ! 629: CASA_R	casa	[%r10] %asi, %r11, %r5
	.word 0x8143e01a  ! 630: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside 
	.word 0x1a800001  ! 631: BCC	bcc  	<label_0x1>
	.word 0x9dda800b  ! 632: FLUSH_R	dis not found

	.word 0xc322a5f0  ! 633: STF_I	st	%f1, [0x05f0, %r10]
	.word 0xdb22800b  ! 634: STF_R	st	%f13, [%r11, %r10]
	.word 0xc412800b  ! 635: LDUH_R	lduh	[%r10 + %r11], %r2
	.word 0xd0d2ac04  ! 636: LDSHA_I	ldsha	[%r10, + 0x0c04] %asi, %r8
	.word 0x8143c000  ! 637: STBAR	stbar
	.word 0xce4aa330  ! 638: LDSB_I	ldsb	[%r10 + 0x0330], %r7
	.word 0x89daa0c8  ! 639: FLUSH_I	dis not found

	.word 0xc49a900b  ! 640: LDDA_R	ldda	[%r10, %r11] 0x80, %r2
	.word 0x9afa800b  ! 641: SDIVcc_R	sdivcc 	%r10, %r11, %r13
	.word 0xa5da800b  ! 642: FLUSH_R	dis not found

	.word 0x2cc20003  ! 643: BRGZ	brgz,a,nt	%8,<label_0x20003>
	.word 0xce8aa5a8  ! 644: LDUBA_I	lduba	[%r10, + 0x05a8] %asi, %r7
	.word 0x3e800001  ! 645: BVC	bvc,a	<label_0x1>
	.word 0x8143e009  ! 646: MEMBAR	membar	#LoadLoad | #StoreStore 
	.word 0x8143c000  ! 647: STBAR	stbar
	.word 0x89a2892b  ! 648: FMULs	fmuls	%f10, %f11, %f4
	.word 0xc3eaa2a8  ! 649: PREFETCHA_I	prefetcha	[%r10, + 0x02a8] %asi, #one_read
	.word 0xa7a2882b  ! 650: FADDs	fadds	%f10, %f11, %f19
	.word 0xd2d2900b  ! 651: LDSHA_R	ldsha	[%r10, %r11] 0x80, %r9
	.word 0x9e72800b  ! 652: UDIV_R	udiv 	%r10, %r11, %r15
	.word 0x8da2892b  ! 654: FMULs	fmuls	%f10, %f11, %f6
	.word 0xb472800b  ! 655: UDIV_R	udiv 	%r10, %r11, %r26
	.word 0x8af2a83c  ! 656: UDIVcc_I	udivcc 	%r10, 0x083c, %r5
	.word 0x93a288ab  ! 657: FSUBs	fsubs	%f10, %f11, %f9
	.word 0xced2ac7c  ! 659: LDSHA_I	ldsha	[%r10, + 0x0c7c] %asi, %r7
	.word 0xe6b2ac2c  ! 660: STHA_I	stha	%r19, [%r10 + 0x0c2c] %asi
	.word 0xb2faa594  ! 661: SDIVcc_I	sdivcc 	%r10, 0x0594, %r25
	.word 0xe7e2a00b  ! 662: CASA_R	casa	[%r10] %asi, %r11, %r19
	.word 0xd202800b  ! 663: LDUW_R	lduw	[%r10 + %r11], %r9
	.word 0x8cfaa948  ! 664: SDIVcc_I	sdivcc 	%r10, 0x0948, %r6
	.word 0x02ca0003  ! 665: BRZ	brz  ,pt	%8,<label_0xa0003>
	.word 0x87a2882b  ! 666: FADDs	fadds	%f10, %f11, %f3
	.word 0x847aa988  ! 667: SDIV_I	sdiv 	%r10, 0x0988, %r2
	.word 0x9122ae18  ! 668: MULScc_I	mulscc 	%r10, 0x0e18, %r8
	.word 0xcf3aa088  ! 669: STDF_I	std	%f7, [0x0088, %r10]
	.word 0x00800003  ! 670: BN	bn  	<label_0x3>
	.word 0x9052800b  ! 671: UMUL_R	umul 	%r10, %r11, %r8
	.word 0x8a7aabf8  ! 672: SDIV_I	sdiv 	%r10, 0x0bf8, %r5
	.word 0xbba288ab  ! 673: FSUBs	fsubs	%f10, %f11, %f29
	.word 0xf3f2900b  ! 674: CASXA_I	casxa	[%r10] 0x80, %r11, %r25
	.word 0x916a800b  ! 675: SDIVX_R	sdivx	%r10, %r11, %r8
	.word 0xec1a800b  ! 676: LDD_R	ldd	[%r10 + %r11], %r22
	.word 0xd202a118  ! 677: LDUW_I	lduw	[%r10 + 0x0118], %r9
	.word 0x8fdaa620  ! 678: FLUSH_I	dis not found

	.word 0xc3eaa0cc  ! 679: PREFETCHA_I	prefetcha	[%r10, + 0x00cc] %asi, #one_read
	.word 0xb9da800b  ! 680: FLUSH_R	dis not found

	.word 0xe80aa9cc  ! 681: LDUB_I	ldub	[%r10 + 0x09cc], %r20
	.word 0xd0b2a1a0  ! 682: STHA_I	stha	%r8, [%r10 + 0x01a0] %asi
	.word 0xc8aa900b  ! 683: STBA_R	stba	%r4, [%r10 + %r11] 0x80
	.word 0xd042a568  ! 684: LDSW_I	ldsw	[%r10 + 0x0568], %r8
	.word 0xc9e2a00b  ! 685: CASA_R	casa	[%r10] %asi, %r11, %r4
	.word 0x0e800003  ! 686: BVS	bvs  	<label_0x3>
	.word 0xc53a800b  ! 687: STDF_R	std	%f2, [%r11, %r10]
	.word 0x2ac20001  ! 688: BRNZ	brnz,a,nt	%8,<label_0x20001>
	.word 0x8672a818  ! 689: UDIV_I	udiv 	%r10, 0x0818, %r3
	.word 0xed22800b  ! 690: STF_R	st	%f22, [%r11, %r10]
	.word 0xc8f2a560  ! 691: STXA_I	stxa	%r4, [%r10 + 0x0560] %asi
	.word 0xc292900b  ! 692: LDUHA_R	lduha	[%r10, %r11] 0x80, %r1
	.word 0x8143c000  ! 693: STBAR	stbar
	.word 0x904a800b  ! 694: MULX_R	mulx 	%r10, %r11, %r8
	.word 0xc36aae8c  ! 695: PREFETCH_I	prefetch	[%r10 + 0x0e8c], #one_read
	.word 0xca4a800b  ! 696: LDSB_R	ldsb	[%r10 + %r11], %r5
	.word 0xd082900b  ! 697: LDUWA_R	lduwa	[%r10, %r11] 0x80, %r8
	.word 0x9072800b  ! 698: UDIV_R	udiv 	%r10, %r11, %r8
	.word 0x85da800b  ! 699: FLUSH_R	dis not found

	.word 0x8143c000  ! 700: STBAR	stbar
	.word 0xf4caaf28  ! 701: LDSBA_I	ldsba	[%r10, + 0x0f28] %asi, %r26
	.word 0xc9e2900b  ! 702: CASA_I	casa	[%r10] 0x80, %r11, %r4
	.word 0x22c20003  ! 703: BRZ	brz,a,nt	%8,<label_0x20003>
	.word 0x8143c000  ! 704: STBAR	stbar
	.word 0x8c52a4fc  ! 705: UMUL_I	umul 	%r10, 0x04fc, %r6
	.word 0xf2da900b  ! 706: LDXA_R	ldxa	[%r10, %r11] 0x80, %r25
	.word 0xd1e2900b  ! 707: CASA_I	casa	[%r10] 0x80, %r11, %r8
	.word 0xccd2900b  ! 708: LDSHA_R	ldsha	[%r10, %r11] 0x80, %r6
	.word 0xb122800b  ! 709: MULScc_R	mulscc 	%r10, %r11, %r24
	.word 0x85da800b  ! 710: FLUSH_R	dis not found

	.word 0xcf22800b  ! 711: STF_R	st	%f7, [%r11, %r10]
	.word 0x8143c000  ! 712: STBAR	stbar
	.word 0xc7e2900b  ! 713: CASA_I	casa	[%r10] 0x80, %r11, %r3
	.word 0x8143e018  ! 714: MEMBAR	membar	#StoreStore | #Lookaside 
	.word 0xa64a800b  ! 715: MULX_R	mulx 	%r10, %r11, %r19
	.word 0x2e800003  ! 716: BVS	bvs,a	<label_0x3>
	.word 0xc6fa900b  ! 717: SWAPA_R	swapa	%r3, [%r10 + %r11] 0x80
	.word 0xca4a800b  ! 718: LDSB_R	ldsb	[%r10 + %r11], %r5
	.word 0xba7aa26c  ! 719: SDIV_I	sdiv 	%r10, 0x026c, %r29
	.word 0x8fa2892b  ! 720: FMULs	fmuls	%f10, %f11, %f7
	.word 0xc33a800b  ! 721: STDF_R	std	%f1, [%r11, %r10]
	.word 0x06800003  ! 722: BL	bl  	<label_0x3>
	.word 0xd2daafe0  ! 723: LDXA_I	ldxa	[%r10, + 0x0fe0] %asi, %r9
	.word 0xc36a800b  ! 724: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0xa6f2a77c  ! 725: UDIVcc_I	udivcc 	%r10, 0x077c, %r19
	.word 0xcc92900b  ! 726: LDUHA_R	lduha	[%r10, %r11] 0x80, %r6
	.word 0x90f2800b  ! 727: UDIVcc_R	udivcc 	%r10, %r11, %r8
	.word 0xec1a800b  ! 728: LDD_R	ldd	[%r10 + %r11], %r22
	.word 0xc4f2af68  ! 729: STXA_I	stxa	%r2, [%r10 + 0x0f68] %asi
	.word 0x2a800001  ! 730: BCS	bcs,a	<label_0x1>
	.word 0xd122800b  ! 731: STF_R	st	%f8, [%r11, %r10]
	.word 0xc2c2900b  ! 732: LDSWA_R	ldswa	[%r10, %r11] 0x80, %r1
	.word 0x85da800b  ! 733: FLUSH_R	dis not found

	.word 0x8143c000  ! 734: STBAR	stbar
	.word 0x89daa478  ! 735: FLUSH_I	dis not found

	.word 0xc36aa194  ! 736: PREFETCH_I	prefetch	[%r10 + 0x0194], #one_read
	.word 0xc6ca900b  ! 737: LDSBA_R	ldsba	[%r10, %r11] 0x80, %r3
	.word 0x2aca0003  ! 738: BRNZ	brnz,a,pt	%8,<label_0xa0003>
	.word 0x8143c000  ! 739: STBAR	stbar
	.word 0xabda800b  ! 740: FLUSH_R	dis not found

	.word 0x89a288ab  ! 741: FSUBs	fsubs	%f10, %f11, %f4
	.word 0xea6a800b  ! 742: LDSTUB_R	ldstub	%r21, [%r10 + %r11]
	.word 0x06c20001  ! 743: BRLZ	brlz  ,nt	%8,<label_0x20001>
	.word 0x8a72ac70  ! 744: UDIV_I	udiv 	%r10, 0x0c70, %r5
	.word 0xd0a2a5b4  ! 745: STWA_I	stwa	%r8, [%r10 + 0x05b4] %asi
	.word 0x8852ad80  ! 746: UMUL_I	umul 	%r10, 0x0d80, %r4
	.word 0x83daaac8  ! 747: FLUSH_I	dis not found

	.word 0xf2faaad0  ! 748: SWAPA_I	swapa	%r25, [%r10 + 0x0ad0] %asi
	.word 0x8fa289ab  ! 749: FDIVs	fdivs	%f10, %f11, %f7
	.word 0xe8eaa0d4  ! 750: LDSTUBA_I	ldstuba	%r20, [%r10 + 0x00d4] %asi
	.word 0xecea900b  ! 751: LDSTUBA_R	ldstuba	%r22, [%r10 + %r11] 0x80
	.word 0x89daa520  ! 752: FLUSH_I	dis not found

	.word 0xc802800b  ! 753: LDUW_R	lduw	[%r10 + %r11], %r4
	.word 0x8143c000  ! 754: STBAR	stbar
	.word 0x8143e034  ! 755: MEMBAR	membar	#LoadStore | #Lookaside | #MemIssue 
	.word 0xd28a900b  ! 756: LDUBA_R	lduba	[%r10, %r11] 0x80, %r9
	.word 0x26800001  ! 757: BL	bl,a	<label_0x1>
	.word 0x8472a10c  ! 758: UDIV_I	udiv 	%r10, 0x010c, %r2
	.word 0xc8faa488  ! 759: SWAPA_I	swapa	%r4, [%r10 + 0x0488] %asi
	.word 0xc212800b  ! 760: LDUH_R	lduh	[%r10 + %r11], %r1
	.word 0xc36a800b  ! 761: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0xc7e2900b  ! 762: CASA_I	casa	[%r10] 0x80, %r11, %r3
	.word 0x8e4aab24  ! 763: MULX_I	mulx 	%r10, 0x0b24, %r7
	.word 0x84faa294  ! 764: SDIVcc_I	sdivcc 	%r10, 0x0294, %r2
	.word 0xa0f2800b  ! 765: UDIVcc_R	udivcc 	%r10, %r11, %r16
	.word 0xccd2a8f4  ! 766: LDSHA_I	ldsha	[%r10, + 0x08f4] %asi, %r6
	.word 0x8143c000  ! 767: STBAR	stbar
	.word 0xccaa900b  ! 768: STBA_R	stba	%r6, [%r10 + %r11] 0x80
	.word 0xc8b2900b  ! 769: STHA_R	stha	%r4, [%r10 + %r11] 0x80
	.word 0xd20aab78  ! 770: LDUB_I	ldub	[%r10 + 0x0b78], %r9
	.word 0xeeaaad6c  ! 771: STBA_I	stba	%r23, [%r10 + 0x0d6c] %asi
	.word 0xc53a800b  ! 772: STDF_R	std	%f2, [%r11, %r10]
	.word 0xf042800b  ! 773: LDSW_R	ldsw	[%r10 + %r11], %r24
	.word 0x916aa148  ! 774: SDIVX_I	sdivx	%r10, 0x0148, %r8
	.word 0xc722800b  ! 775: STF_R	st	%f3, [%r11, %r10]
	.word 0xf322800b  ! 776: STF_R	st	%f25, [%r11, %r10]
	.word 0x32800001  ! 777: BNE	bne,a	<label_0x1>
	.word 0x824a800b  ! 778: MULX_R	mulx 	%r10, %r11, %r1
	.word 0x83da800b  ! 779: FLUSH_R	dis not found

	.word 0x26c20001  ! 780: BRLZ	brlz,a,nt	%8,<label_0x20001>
	.word 0xc3ea900b  ! 781: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0x927a800b  ! 782: SDIV_R	sdiv 	%r10, %r11, %r9
	.word 0xaba289ab  ! 783: FDIVs	fdivs	%f10, %f11, %f21
	.word 0xd26a800b  ! 784: LDSTUB_R	ldstub	%r9, [%r10 + %r11]
	.word 0xdc9a900b  ! 786: LDDA_R	ldda	[%r10, %r11] 0x80, %r14
	.word 0xa25aa398  ! 787: SMUL_I	smul 	%r10, 0x0398, %r17
	.word 0x10800001  ! 788: BA	ba  	<label_0x1>
	.word 0x8fa2892b  ! 789: FMULs	fmuls	%f10, %f11, %f7
	.word 0xbe52a3e4  ! 790: UMUL_I	umul 	%r10, 0x03e4, %r31
	.word 0x24800003  ! 791: BLE	ble,a	<label_0x3>
	.word 0x0ec20001  ! 792: BRGEZ	brgez  ,nt	%8,<label_0x20001>
	.word 0xc86aab00  ! 793: LDSTUB_I	ldstub	%r4, [%r10 + 0x0b00]
	.word 0x8a4a800b  ! 794: MULX_R	mulx 	%r10, %r11, %r5
	.word 0x8c72ac58  ! 795: UDIV_I	udiv 	%r10, 0x0c58, %r6
	.word 0xc2daa220  ! 796: LDXA_I	ldxa	[%r10, + 0x0220] %asi, %r1
	.word 0xd84a800b  ! 797: LDSB_R	ldsb	[%r10 + %r11], %r12
	.word 0xe0aaa4b8  ! 798: STBA_I	stba	%r16, [%r10 + 0x04b8] %asi
	.word 0xc2b2aa9c  ! 799: STHA_I	stha	%r1, [%r10 + 0x0a9c] %asi
	.word 0x8fdaacf8  ! 800: FLUSH_I	dis not found

	.word 0xd0f2900b  ! 801: STXA_R	stxa	%r8, [%r10 + %r11] 0x80
	.word 0xd13aa8c8  ! 802: STDF_I	std	%f8, [0x08c8, %r10]
	.word 0xe81aa210  ! 803: LDD_I	ldd	[%r10 + 0x0210], %r20
	.word 0x8a52a36c  ! 804: UMUL_I	umul 	%r10, 0x036c, %r5
	.word 0x3c800001  ! 805: BPOS	bpos,a	<label_0x1>
	.word 0x14800001  ! 806: BG	bg  	<label_0x1>
	.word 0xb84aa98c  ! 807: MULX_I	mulx 	%r10, 0x098c, %r28
	.word 0xc01a800b  ! 808: LDD_R	ldd	[%r10 + %r11], %r0
	.word 0xc53aa3f8  ! 809: STDF_I	std	%f2, [0x03f8, %r10]
	.word 0xf68a900b  ! 810: LDUBA_R	lduba	[%r10, %r11] 0x80, %r27
	.word 0xaaf2a694  ! 811: UDIVcc_I	udivcc 	%r10, 0x0694, %r21
	.word 0xca6aaf18  ! 812: LDSTUB_I	ldstub	%r5, [%r10 + 0x0f18]
	.word 0x8ddaabdc  ! 813: FLUSH_I	dis not found

	.word 0x99daa3cc  ! 814: FLUSH_I	dis not found

	.word 0xc3eaaf38  ! 815: PREFETCHA_I	prefetcha	[%r10, + 0x0f38] %asi, #one_read
	.word 0xa67a800b  ! 816: SDIV_R	sdiv 	%r10, %r11, %r19
	.word 0x0aca0003  ! 817: BRNZ	brnz  ,pt	%8,<label_0xa0003>
	.word 0x87a2882b  ! 818: FADDs	fadds	%f10, %f11, %f3
	.word 0xa27aab88  ! 819: SDIV_I	sdiv 	%r10, 0x0b88, %r17
	.word 0xc89aa8e8  ! 820: LDDA_I	ldda	[%r10, + 0x08e8] %asi, %r4
	.word 0xc2faa180  ! 821: SWAPA_I	swapa	%r1, [%r10 + 0x0180] %asi
	.word 0xee92900b  ! 822: LDUHA_R	lduha	[%r10, %r11] 0x80, %r23
	.word 0xaba289ab  ! 823: FDIVs	fdivs	%f10, %f11, %f21
	.word 0x82fa800b  ! 825: SDIVcc_R	sdivcc 	%r10, %r11, %r1
	.word 0x8dda800b  ! 826: FLUSH_R	dis not found

	.word 0xec7a800b  ! 827: SWAP_R	swap	%r22, [%r10 + %r11]
	.word 0xcc8aa5a4  ! 828: LDUBA_I	lduba	[%r10, + 0x05a4] %asi, %r6
	.word 0xa86aac18  ! 829: UDIVX_I	udivx 	%r10, 0x0c18, %r20
	.word 0x8b6aa9c4  ! 830: SDIVX_I	sdivx	%r10, 0x09c4, %r5
	.word 0xc66aa850  ! 831: LDSTUB_I	ldstub	%r3, [%r10 + 0x0850]
	.word 0xfadaacc8  ! 832: LDXA_I	ldxa	[%r10, + 0x0cc8] %asi, %r29
	.word 0xa1daabc4  ! 833: FLUSH_I	dis not found

	.word 0x9a72aaf4  ! 834: UDIV_I	udiv 	%r10, 0x0af4, %r13
	.word 0xc48a900b  ! 835: LDUBA_R	lduba	[%r10, %r11] 0x80, %r2
	.word 0x865aa170  ! 836: SMUL_I	smul 	%r10, 0x0170, %r3
	.word 0x91da800b  ! 837: FLUSH_R	dis not found

	.word 0x10800001  ! 838: BA	ba  	<label_0x1>
	.word 0xfc7a800b  ! 839: SWAP_R	swap	%r30, [%r10 + %r11]
	.word 0x927a800b  ! 840: SDIV_R	sdiv 	%r10, %r11, %r9
	.word 0x1a800001  ! 841: BCC	bcc  	<label_0x1>
	.word 0xfcea900b  ! 842: LDSTUBA_R	ldstuba	%r30, [%r10 + %r11] 0x80
	.word 0xd322a72c  ! 843: STF_I	st	%f9, [0x072c, %r10]
	.word 0x0cc20003  ! 844: BRGZ	brgz  ,nt	%8,<label_0x20003>
	.word 0xc2d2a4a8  ! 845: LDSHA_I	ldsha	[%r10, + 0x04a8] %asi, %r1
	.word 0xc7f2a00b  ! 846: CASXA_R	casxa	[%r10]%asi, %r11, %r3
	.word 0x83daa850  ! 847: FLUSH_I	dis not found

	.word 0x9af2a424  ! 848: UDIVcc_I	udivcc 	%r10, 0x0424, %r13
	.word 0xc36aa80c  ! 849: PREFETCH_I	prefetch	[%r10 + 0x080c], #one_read
	.word 0x8143c000  ! 850: STBAR	stbar
	.word 0xca8aabd4  ! 851: LDUBA_I	lduba	[%r10, + 0x0bd4] %asi, %r5
	.word 0x8143c000  ! 852: STBAR	stbar
	.word 0xfac2ab8c  ! 853: LDSWA_I	ldswa	[%r10, + 0x0b8c] %asi, %r29
	.word 0xd0ba900b  ! 854: STDA_R	stda	%r8, [%r10 + %r11] 0x80
	.word 0x8143e02a  ! 855: MEMBAR	membar	#StoreLoad | #StoreStore | #MemIssue 
	.word 0xdaea900b  ! 856: LDSTUBA_R	ldstuba	%r13, [%r10 + %r11] 0x80
	.word 0x824aa2dc  ! 857: MULX_I	mulx 	%r10, 0x02dc, %r1
	.word 0x8fa289ab  ! 858: FDIVs	fdivs	%f10, %f11, %f7
	.word 0xd28aa5c0  ! 859: LDUBA_I	lduba	[%r10, + 0x05c0] %asi, %r9
	.word 0xb25a800b  ! 861: SMUL_R	smul 	%r10, %r11, %r25
	.word 0x24c20001  ! 862: BRLEZ	brlez,a,nt	%8,<label_0x20001>
	.word 0xc2d2900b  ! 863: LDSHA_R	ldsha	[%r10, %r11] 0x80, %r1
	.word 0xf6da900b  ! 864: LDXA_R	ldxa	[%r10, %r11] 0x80, %r27
	.word 0x85a289ab  ! 865: FDIVs	fdivs	%f10, %f11, %f2
	.word 0xceb2a664  ! 866: STHA_I	stha	%r7, [%r10 + 0x0664] %asi
	.word 0x2c800003  ! 867: BNEG	bneg,a	<label_0x3>
	.word 0xacdaa91c  ! 868: SMULcc_I	smulcc 	%r10, 0x091c, %r22
	.word 0xd00aa308  ! 869: LDUB_I	ldub	[%r10 + 0x0308], %r8
	.word 0x8143c000  ! 870: STBAR	stbar
	.word 0xcaa2a8e4  ! 871: STWA_I	stwa	%r5, [%r10 + 0x08e4] %asi
	.word 0x83daa590  ! 872: FLUSH_I	dis not found

	.word 0x87da800b  ! 873: FLUSH_R	dis not found

	.word 0xb96aa450  ! 874: SDIVX_I	sdivx	%r10, 0x0450, %r28
	.word 0xceeaa4b8  ! 875: LDSTUBA_I	ldstuba	%r7, [%r10 + 0x04b8] %asi
	.word 0xc68aac4c  ! 876: LDUBA_I	lduba	[%r10, + 0x0c4c] %asi, %r3
	.word 0x9c6a800b  ! 877: UDIVX_R	udivx 	%r10, %r11, %r14
	.word 0xf6fa900b  ! 878: SWAPA_R	swapa	%r27, [%r10 + %r11] 0x80
	.word 0x9252800b  ! 879: UMUL_R	umul 	%r10, %r11, %r9
	.word 0xc81aa048  ! 880: LDD_I	ldd	[%r10 + 0x0048], %r4
	.word 0x8143e025  ! 881: MEMBAR	membar	#LoadLoad | #LoadStore | #MemIssue 
	.word 0x92f2800b  ! 882: UDIVcc_R	udivcc 	%r10, %r11, %r9
	.word 0xe33a800b  ! 883: STDF_R	std	%f17, [%r11, %r10]
	.word 0xc922aa7c  ! 884: STF_I	st	%f4, [0x0a7c, %r10]
	.word 0x8143e040  ! 885: MEMBAR	membar	#Sync 
	.word 0xe0ba900b  ! 886: STDA_R	stda	%r16, [%r10 + %r11] 0x80
	.word 0xd2f2900b  ! 887: STXA_R	stxa	%r9, [%r10 + %r11] 0x80
	.word 0xd322800b  ! 888: STF_R	st	%f9, [%r11, %r10]
	.word 0xcf3a800b  ! 889: STDF_R	std	%f7, [%r11, %r10]
	.word 0x1e800001  ! 890: BVC	bvc  	<label_0x1>
	.word 0x8a4a800b  ! 891: MULX_R	mulx 	%r10, %r11, %r5
	.word 0xc482a728  ! 892: LDUWA_I	lduwa	[%r10, + 0x0728] %asi, %r2
	.word 0xc3eaa80c  ! 893: PREFETCHA_I	prefetcha	[%r10, + 0x080c] %asi, #one_read
	.word 0x91daa674  ! 894: FLUSH_I	dis not found

	.word 0x04ca0001  ! 895: BRLEZ	brlez  ,pt	%8,<label_0xa0001>
	.word 0xce12800b  ! 896: LDUH_R	lduh	[%r10 + %r11], %r7
	.word 0x8872800b  ! 897: UDIV_R	udiv 	%r10, %r11, %r4
	.word 0xb052800b  ! 898: UMUL_R	umul 	%r10, %r11, %r24
	.word 0xd26a800b  ! 899: LDSTUB_R	ldstub	%r9, [%r10 + %r11]
	.word 0x8143c000  ! 901: STBAR	stbar
	.word 0x87a288ab  ! 902: FSUBs	fsubs	%f10, %f11, %f3
	.word 0xb7a2892b  ! 903: FMULs	fmuls	%f10, %f11, %f27
	.word 0xcbf2900b  ! 904: CASXA_I	casxa	[%r10] 0x80, %r11, %r5
	.word 0xcc02a3ec  ! 905: LDUW_I	lduw	[%r10 + 0x03ec], %r6
	.word 0x92fa800b  ! 906: SDIVcc_R	sdivcc 	%r10, %r11, %r9
	.word 0xa8daa0ac  ! 907: SMULcc_I	smulcc 	%r10, 0x00ac, %r20
	.word 0x3a800001  ! 908: BCC	bcc,a	<label_0x1>
	.word 0xcd22a9fc  ! 909: STF_I	st	%f6, [0x09fc, %r10]
	.word 0x8dda800b  ! 910: FLUSH_R	dis not found

	.word 0x91da800b  ! 911: FLUSH_R	dis not found

	.word 0x8143e074  ! 912: MEMBAR	membar	#LoadStore | #Lookaside | #MemIssue | #Sync 
	.word 0x8dda800b  ! 913: FLUSH_R	dis not found

	.word 0xcf22800b  ! 914: STF_R	st	%f7, [%r11, %r10]
	.word 0x8143e011  ! 915: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x8143e034  ! 916: MEMBAR	membar	#LoadStore | #Lookaside | #MemIssue 
	.word 0xc3eaaa2c  ! 917: PREFETCHA_I	prefetcha	[%r10, + 0x0a2c] %asi, #one_read
	.word 0xe2a2900b  ! 918: STWA_R	stwa	%r17, [%r10 + %r11] 0x80
	.word 0xb2f2ac9c  ! 919: UDIVcc_I	udivcc 	%r10, 0x0c9c, %r25
	.word 0xf4ba900b  ! 920: STDA_R	stda	%r26, [%r10 + %r11] 0x80
	.word 0x90d2800b  ! 921: UMULcc_R	umulcc 	%r10, %r11, %r8
	.word 0xb7da800b  ! 922: FLUSH_R	dis not found

	.word 0xd0b2900b  ! 923: STHA_R	stha	%r8, [%r10 + %r11] 0x80
	.word 0x8dda800b  ! 924: FLUSH_R	dis not found

	.word 0xc26aaaf8  ! 925: LDSTUB_I	ldstub	%r1, [%r10 + 0x0af8]
	.word 0xea6a800b  ! 926: LDSTUB_R	ldstub	%r21, [%r10 + %r11]
	.word 0xc0ba900b  ! 927: STDA_R	stda	%r0, [%r10 + %r11] 0x80
	.word 0x865aa468  ! 928: SMUL_I	smul 	%r10, 0x0468, %r3
	.word 0x866a800b  ! 929: UDIVX_R	udivx 	%r10, %r11, %r3
	.word 0xd2c2900b  ! 930: LDSWA_R	ldswa	[%r10, %r11] 0x80, %r9
	.word 0xc36aa834  ! 931: PREFETCH_I	prefetch	[%r10 + 0x0834], #one_read
	.word 0xc6faa790  ! 932: SWAPA_I	swapa	%r3, [%r10 + 0x0790] %asi
	.word 0xc87aa2d4  ! 933: SWAP_I	swap	%r4, [%r10 + 0x02d4]
	.word 0xe73aae10  ! 934: STDF_I	std	%f19, [0x0e10, %r10]
	.word 0xca52a470  ! 935: LDSH_I	ldsh	[%r10 + 0x0470], %r5
	.word 0xeaf2a4e0  ! 938: STXA_I	stxa	%r21, [%r10 + 0x04e0] %asi
	.word 0x8143c000  ! 939: STBAR	stbar
	.word 0x8a7aa4f8  ! 940: SDIV_I	sdiv 	%r10, 0x04f8, %r5
	.word 0x04800003  ! 941: BLE	ble  	<label_0x3>
	.word 0xf412a790  ! 942: LDUH_I	lduh	[%r10 + 0x0790], %r26
	.word 0xc6d2900b  ! 943: LDSHA_R	ldsha	[%r10, %r11] 0x80, %r3
	.word 0x8fa2892b  ! 944: FMULs	fmuls	%f10, %f11, %f7
	.word 0xae6a800b  ! 945: UDIVX_R	udivx 	%r10, %r11, %r23
	.word 0xeafa900b  ! 946: SWAPA_R	swapa	%r21, [%r10 + %r11] 0x80
	.word 0x88fa800b  ! 947: SDIVcc_R	sdivcc 	%r10, %r11, %r4
	.word 0x9fdaa7cc  ! 948: FLUSH_I	dis not found

	.word 0xaa4aa8f8  ! 949: MULX_I	mulx 	%r10, 0x08f8, %r21
	.word 0x845aa6b8  ! 950: SMUL_I	smul 	%r10, 0x06b8, %r2
	.word 0x8143c000  ! 951: STBAR	stbar
	.word 0xa1a288ab  ! 952: FSUBs	fsubs	%f10, %f11, %f16
	.word 0xdde2900b  ! 953: CASA_I	casa	[%r10] 0x80, %r11, %r14
	.word 0x8a6aaab4  ! 954: UDIVX_I	udivx 	%r10, 0x0ab4, %r5
	.word 0x8143c000  ! 955: STBAR	stbar
	.word 0xf042a68c  ! 956: LDSW_I	ldsw	[%r10 + 0x068c], %r24
	.word 0xc46a800b  ! 957: LDSTUB_R	ldstub	%r2, [%r10 + %r11]
	.word 0x89daaf1c  ! 958: FLUSH_I	dis not found

	.word 0x85daa6dc  ! 959: FLUSH_I	dis not found

	.word 0x8143c000  ! 960: STBAR	stbar
	.word 0xb7daae70  ! 961: FLUSH_I	dis not found

	.word 0x9b22a7ac  ! 962: MULScc_I	mulscc 	%r10, 0x07ac, %r13
	.word 0xc36a800b  ! 963: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x91a288ab  ! 964: FSUBs	fsubs	%f10, %f11, %f8
	.word 0xf2c2900b  ! 965: LDSWA_R	ldswa	[%r10, %r11] 0x80, %r25
	.word 0xee6a800b  ! 966: LDSTUB_R	ldstub	%r23, [%r10 + %r11]
	.word 0xe9f2900b  ! 967: CASXA_I	casxa	[%r10] 0x80, %r11, %r20
	.word 0x3a800003  ! 968: BCC	bcc,a	<label_0x3>
	.word 0xc4a2900b  ! 969: STWA_R	stwa	%r2, [%r10 + %r11] 0x80
	.word 0xc882aff0  ! 970: LDUWA_I	lduwa	[%r10, + 0x0ff0] %asi, %r4
	.word 0xbefa800b  ! 971: SDIVcc_R	sdivcc 	%r10, %r11, %r31
	.word 0x06800001  ! 973: BL	bl  	<label_0x1>
	.word 0x3c800001  ! 974: BPOS	bpos,a	<label_0x1>
	.word 0xeb3aaf10  ! 975: STDF_I	std	%f21, [0x0f10, %r10]
	.word 0x8143c000  ! 976: STBAR	stbar
	.word 0xcadaaa88  ! 977: LDXA_I	ldxa	[%r10, + 0x0a88] %asi, %r5
	.word 0x87da800b  ! 978: FLUSH_R	dis not found

	.word 0x8143e075  ! 979: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside | #MemIssue | #Sync 
	.word 0xc842aa58  ! 980: LDSW_I	ldsw	[%r10 + 0x0a58], %r4
	.word 0x824a800b  ! 981: MULX_R	mulx 	%r10, %r11, %r1
	.word 0xae52af40  ! 982: UMUL_I	umul 	%r10, 0x0f40, %r23
	.word 0xea12a700  ! 983: LDUH_I	lduh	[%r10 + 0x0700], %r21
	.word 0xcefa900b  ! 984: SWAPA_R	swapa	%r7, [%r10 + %r11] 0x80
	.word 0x04c20003  ! 985: BRLEZ	brlez  ,nt	%8,<label_0x20003>
	.word 0x84d2aef0  ! 986: UMULcc_I	umulcc 	%r10, 0x0ef0, %r2
	.word 0xaba2892b  ! 987: FMULs	fmuls	%f10, %f11, %f21
	.word 0xec9a900b  ! 988: LDDA_R	ldda	[%r10, %r11] 0x80, %r22
	.word 0x8872a558  ! 989: UDIV_I	udiv 	%r10, 0x0558, %r4
	.word 0xae5a800b  ! 990: SMUL_R	smul 	%r10, %r11, %r23
	.word 0x90da800b  ! 991: SMULcc_R	smulcc 	%r10, %r11, %r8
	.word 0x8dda800b  ! 992: FLUSH_R	dis not found

	.word 0x8da2882b  ! 993: FADDs	fadds	%f10, %f11, %f6
	.word 0xc3eaa2bc  ! 994: PREFETCHA_I	prefetcha	[%r10, + 0x02bc] %asi, #one_read
	.word 0xca92900b  ! 995: LDUHA_R	lduha	[%r10, %r11] 0x80, %r5
	.word 0xbba288ab  ! 996: FSUBs	fsubs	%f10, %f11, %f29
	.word 0x38800001  ! 998: BGU	bgu,a	<label_0x1>
	.word 0xd08aa5d4  ! 999: LDUBA_I	lduba	[%r10, + 0x05d4] %asi, %r8
	nop
	nop
	nop
        ta      T_GOOD_TRAP

.data
	.word  0xc1c2ed9e,0x8ed39a72,0xfc7558a9,0x4cb7e3a7
	.word  0x603596a8,0xafe459c7,0x6cadeec4,0x34af67c4
	.word  0xc205db4e,0x113f7cc7,0xb5f096bb,0xe0cd7982
	.word  0x33316f1a,0xafebd139,0x599f0683,0x8ebf1cfe
	.word  0x7e9821fd,0x926b0653,0x89f066ab,0xfaea22f6
	.word  0xcfadabd1,0x2f6d39db,0x7a021121,0x6f8a9db5
	.word  0x91afd286,0x66606891,0x2c38f470,0x42eb0a82
	.word  0xf0ed0cbc,0xd9ef11a0,0xd9d0e8b2,0xef207b8d
	.word  0x03da8789,0xe3114f09,0xb830a310,0x26c90ef4
	.word  0x123047ae,0x9f5641f6,0xfb150c18,0xb6c23f8f
	.word  0x1034fff7,0xd5cf277e,0xd6bec7ed,0x79ab1abd
	.word  0x0d8a1f87,0x57c84a34,0xf452731a,0x59a0eacc
	.word  0xfd46b3d5,0x77171c62,0x7e6db7c4,0x5a9ae318
	.word  0xebc542d9,0xa97f44d0,0x9f93c677,0x37bee6da
	.word  0xf9b857ec,0x3db9a7a7,0x30d603e7,0x82fcf77e
	.word  0x040995c2,0x04671b5e,0xcc82f3bd,0x8f925985
	.word  0x3a12577a,0x7830437f,0x4a04243b,0x059263b5
	.word  0x2cdf0561,0x151e3a46,0x82c8a3c5,0x14cfdb4e
	.word  0xa5f4127b,0xa35e676b,0x5d5e36e1,0x35cfbcac
	.word  0x5258eec8,0x1974292d,0x6415d5ef,0xb67747dd
	.word  0x1a3ed2b6,0x12db61e7,0x9647f8ab,0xd9377daa
	.word  0xb2de5176,0x9a1888e2,0x160b7a3f,0x709aa2ec
	.word  0x814fda65,0xd4feb08d,0x3ccc3315,0x0ab83cb2
	.word  0x4974f066,0x6701a5c7,0x6dc21795,0x666afb0f
	.word  0xa7000b21,0xa7ba34f5,0x2f7246fb,0xcdcf80fd
	.word  0x0afb2650,0xa635d144,0x02411670,0xe43c5798
	.word  0x04f633e8,0xf52ced6c,0xfcbcc7f7,0xb893b62e
	.word  0xca31456d,0x7a3d0ca8,0xf55114a4,0xcaad1dc3
	.word  0xd401fff2,0x83f0d63b,0x7926fc73,0x7e5ee2b6
	.word  0xbfa40c50,0xdf34750b,0xcef23aa3,0xf704c535
	.word  0x62f4081c,0xcfd09a8c,0x24e85f89,0x95884c7e
	.word  0xa360d358,0x9d2bb9b6,0x7577ab91,0x936619ad
	.word  0x21c4134c,0xd38ea1b3,0x6f27bb8d,0x520a56a9
	.word  0x70247fb6,0xba029749,0xd370d293,0x5cf0cd36
	.word  0xdd901774,0x75297cb7,0xbb39aeea,0x20500a1d
	.word  0x35e0b3ba,0x100d9c9e,0xe1439629,0x728034bd
	.word  0x05560996,0xbbb2cd6f,0xe1d7b9cb,0x646f859a
	.word  0x47454f2a,0xc4314fe0,0xc81ea953,0x6bb46e26
	.word  0x410208c6,0x4c5d8b67,0x3dbfc59b,0x74853a4d
	.word  0xa7e039a4,0x6e226767,0x03ac9dd5,0x6deccea1
	.word  0x3d899be8,0xfa03546c,0x8a9347c8,0xfda0dca7
	.word  0xf9d2b587,0xac89e977,0x8d766d66,0x445e1e41
	.word  0x5b1c4ba3,0x8f8e9107,0x7e312989,0x70594f59
	.word  0x880b23cf,0x12d08f6b,0xd837a0cc,0x22eb88cc
	.word  0x8fddc832,0x3e4339ca,0x99f77679,0x833feff0
	.word  0xa776eb3c,0x0d2c8f1b,0x2acd1053,0x95092d99
	.word  0x9b7c467b,0xe31101c2,0x37f3e78d,0x94a14c1c
	.word  0xaa2fc274,0xcc49047b,0xafcd678c,0x17b0fb89
	.word  0xa0b062a7,0x3277efa5,0xecc3af6e,0x5b6a2a23
	.word  0x060ae951,0xaea1de2f,0xd1589deb,0x606630a2
	.word  0x049658b8,0xb3605942,0x9ac4f06a,0x012b7a50
	.word  0x7a940663,0xa647fd38,0xd52c5a80,0x839f91c0
	.word  0xb2d6cea0,0xe189e808,0x0f58a37a,0xb38f010d
	.word  0x483bed1e,0x4ce2af44,0x6d6b352e,0x98b07931
	.word  0xe8e5a075,0xf62eb606,0x427e96d6,0x7676dc83
	.word  0x90e22d42,0xe46e4f25,0x962d5133,0x32bb2637
	.word  0xc693b5f7,0x64f541b2,0x1a173f09,0xe1f5e311
	.word  0x1aa8f885,0xecc12266,0x5146f907,0x8e17a6d7
	.word  0x84c4ffec,0xb4665dfd,0xed8b6a65,0x1610fd02
	.word  0xcd40d574,0x44d54fd8,0x2d0a667d,0x414a53e2
	.word  0xb52cde9d,0x433db2fc,0x4affcf17,0x9c7d2ea3
	.word  0xf9d1acb4,0x70637791,0xf009d374,0xddd89914
	.word  0x007d5657,0xa5e119d7,0xaf89f340,0xc90a4e5b
	.word  0xc35e8f9d,0x8ce81d1f,0x3aa97713,0xe5e6b5c7
	.word  0x7e7f5132,0xe71b4810,0xb0b97fe0,0xc982346c
	.word  0x5184acb8,0xa980d3ef,0x58280896,0x0a1128d3
	.word  0x7e3bf3e7,0x1520a1d1,0x44337c28,0xc7f0c3a9
	.word  0xd4760c3f,0xa06e5c1c,0xb29a7e27,0x2a52201f
	.word  0xbfbf5c38,0x556bd615,0x3d55aeb1,0xc38e8130
	.word  0x31c58236,0xb9f25478,0x0107d4fb,0xb6cb2862
	.word  0x03eca457,0x09bc85c3,0x2b1a8c99,0x0a32d07c
	.word  0x1134ddae,0xcba8d4b6,0xbd4c6d62,0x9c3a2359
	.word  0xf4b9d6cb,0x870e5c25,0xaffe5f53,0x764bb50b
	.word  0x401acd47,0x95797e43,0xabd0e816,0x6be3cf39
	.word  0x2bdb9e7d,0xbfa59106,0x972fccb7,0x54aa58e8
	.word  0x16c12192,0x095542f4,0xf6001dca,0x086b8c4d
	.word  0xe4662a0a,0x641e2ce1,0x2e6d7e05,0xf9ea860d
	.word  0xd1649ee6,0xc23a7d6a,0x905c6994,0xc624db7b
	.word  0x5cef736c,0x6b12a186,0xa895e701,0x55adb2cc
	.word  0xfa44ac63,0x29ab0774,0x099bcb51,0x0a81476b
	.word  0xe94cdb7d,0x3ecfb3f5,0xb524ade0,0x4019aa9f
	.word  0xc6a44037,0x3fc9f7dd,0xf2726cfd,0x523c2a80
	.word  0xc5d872d3,0x1c77ab53,0x1ca505b7,0xdbfd17e6
	.word  0x7f283ac9,0x5cd2945c,0x8cd5b347,0xccc9047e
	.word  0x1015fe19,0x67372834,0xc63054dc,0xed156e3d
	.word  0xd4649b55,0x1e25da32,0xc15f3c55,0xea734550
	.word  0x5269b45b,0x4f63af29,0x0f327d45,0xa53895a8
	.word  0x0cb6918d,0x191e8b5b,0x57edf619,0x9e0c672e
	.word  0x2b696f7b,0xf8d6ca3d,0xd7597a01,0x8c46f568
	.word  0x49a11125,0xcc59f3f3,0xf452e2b7,0x5b4b5882
	.word  0xa8959dce,0x978ae83c,0x4e43051f,0x7865e090
	.word  0x98c43f55,0x6c980fe1,0xae5b379f,0xc4b56950
	.word  0x59d86224,0x130a39be,0x240d826a,0x1df9c0b2
	.word  0xaabc6ae5,0x9c02802e,0x4189e04e,0x835d9948
	.word  0x8357e490,0x2c0e68d0,0x6cf5e7ef,0xa2808a73
	.word  0xc74ed689,0xee3986cd,0xe387442a,0x3d1e1e64
	.word  0x052a672f,0xea361478,0x2eb6599f,0x9ab8c260
	.word  0xbad17c89,0x382d0a99,0xa514f2ed,0xeab7a081
	.word  0x3ba60a32,0xb72ccc96,0xd4d8b155,0xd86bf11a
	.word  0x8db76f30,0xdc98c1ca,0xb526f094,0xc8a86f99
	.word  0x2ebe9a86,0xa96c85ee,0x1e1f3601,0x9660d461
	.word  0xaf6372bc,0x0278ed61,0xc2bde3ec,0x898b5785
	.word  0xd8a46358,0xade34c5e,0xc8f65ee7,0x831534fe
	.word  0x7e2927af,0x7e5898de,0xcf9550d4,0xde611fb3
	.word  0x61cdfc48,0x19b8acb9,0x69152d61,0xba8f6079
	.word  0x396cec98,0xa13fde98,0x72d88b21,0x8cd3cc44
	.word  0xb2580449,0xce6f2d3e,0x0bb2a32b,0x08dc433e
	.word  0xfc89d9c3,0xdac48786,0x4edb67b2,0x4da5d55b
	.word  0x3cc4d5fe,0x0a69ed20,0xf4c741f4,0x9dec0404
	.word  0xec9548b4,0x933b2317,0xce3e406c,0xd31cd28a
	.word  0x5cfe3d6a,0xc84cc589,0x3f27247c,0x51cc1fc3
	.word  0xc104a9b1,0x79e5c7f7,0x04a54f54,0xcd991886
	.word  0x73a5aff6,0x2079079d,0x84b50bd7,0x680ae897
	.word  0x11f2ce5b,0x2aac70cb,0xac9cd706,0xb34eee36
	.word  0x80a8ca50,0xe2b7fbb9,0x4aa22658,0xdf8225b0
	.word  0xd468acc2,0xd7358e6a,0x238ab8e6,0xee04129e
	.word  0x867fbc72,0x36e18ac1,0x9c767972,0x880bd582
	.word  0x9b3092d6,0xed23a4a1,0xbe5448a9,0x40df37c8
	.word  0x2de23eb4,0x487fdb26,0xb673ac96,0x2e9eeb75
	.word  0xd2807fd5,0xe69c8aef,0xcb5e9b2c,0x5c777b30
	.word  0x1c543199,0xf3894575,0xbafd705d,0xb949fbfb
	.word  0xc0064b61,0x3d9c29c8,0xced22069,0x1f5ec26e
	.word  0x5340154e,0xf1e3760d,0xfef7cd50,0x1c940c64
	.word  0xa8625ae3,0x029fb4db,0xb495d257,0xf234c342
	.word  0x62387310,0xf47cd70f,0xd0b1e4d6,0x80e46e4c
	.word  0x128e5e0c,0x2e3e3f06,0x8f4470c5,0x6efc9a32
	.word  0xeff65080,0x94e8570f,0x3a38c4c9,0x15617cc1
	.word  0xe7090627,0x86f443fc,0x4143f157,0xdc8a9fba
	.word  0xc77b78cd,0x0ec6db50,0x5471e812,0x23074d50
	.word  0x7ea38625,0x9a09b3c5,0xe56c74da,0x763f4f4d
	.word  0xcfe932ac,0x33ef8a30,0xe5c24318,0x219e4a9a
	.word  0x0237db1e,0x3b19bf63,0x17d25131,0x34460ab9
	.word  0x1abd9ac8,0x75136257,0xa288a8df,0x50db3d1b
	.word  0x37cdf7bc,0x31109eaf,0xa8368206,0x3b139a2f
	.word  0x758faa69,0xc00e1952,0x5ad67ba0,0x0466b180
	.word  0x11a7a4ed,0x65715a92,0x27708b58,0x8ac44ee5
	.word  0xde856208,0x035420dd,0x98505046,0x72692369
	.word  0x82501c42,0x87528dd8,0x7ae25d8b,0x802350c5
	.word  0x3ceab987,0x765bbccb,0x02c6793a,0xb5dc58ca
	.word  0xfb14616a,0x0d5ba49c,0x62c82614,0x355ec980
	.word  0x0a453551,0xe90296a3,0x2d827d5b,0x6249e5f1
	.word  0x480cc5e9,0xb2fc1caf,0x31363c68,0x3f1d3358
	.word  0xfe304b85,0x532474dd,0x7011a8ba,0xba0a10b5
	.word  0x243d5280,0x62e7db12,0x580cd624,0x37041b77
	.word  0xfa2686e3,0xc93f47a1,0x9b454c93,0x6906f9c5
	.word  0x29aaedc1,0xc23c8cbb,0xff2a52e9,0x8f6482e8
	.word  0x1155216f,0x2674259c,0x668c64eb,0xaa8a0ff2
	.word  0x168faf5a,0x8b021181,0x2e153bfa,0x2c2fd353
	.word  0x35b17f49,0xafb5debd,0x5c53dcc5,0xec26bd8b
	.word  0x8b701a26,0x9102d3ab,0x006e0321,0x15b6cb16
	.word  0xb587785c,0xc21280ac,0x66117af5,0xbd875166
	.word  0x73964dfa,0xb4987971,0x74282476,0xba86b085
	.word  0xd7a287aa,0xff1e166a,0xeb529ab6,0xf627ae68
	.word  0x6d812c28,0xe75787e6,0xdd878bb2,0x8684f492
	.word  0x1d19abd7,0xeac49e80,0xe6f27c5d,0x163c58e8
	.word  0x0725300b,0xae84dac1,0x93a786eb,0x98ca46df
	.word  0x8d4cd798,0x97dcac56,0xa435064a,0x4183f31f
	.word  0x3ed50b22,0x7932fe16,0x767388e2,0xe8ab9f08
	.word  0x79197873,0x3f386729,0x2f77e2db,0x08769c6a
	.word  0xe61f1099,0xb9388bba,0x591e065c,0x040751b7
	.word  0x3579ace6,0x1fb5d9a7,0x87442c29,0xc2f281a3
	.word  0x787d4601,0x04735958,0x4dff80ce,0x1cbad3dc
	.word  0x24cf337b,0xb49afa56,0xa7e9e82c,0x040dff13
	.word  0xcd32c171,0xc90cfee8,0x4090fcfe,0x124bc074
	.word  0xdc06bf12,0x99b7d290,0x121370f7,0xb76f693a
	.word  0x7b580274,0xdbb4d0f6,0xaafc381b,0xdaa4368e
	.word  0x47e9efa7,0x08e2af95,0xf823f178,0xd10f4e9c
	.word  0xb18ba623,0xf23b7919,0x45ad3130,0x8e0fde67
	.word  0x6d50ec52,0x9cef6ee5,0xbc23995d,0x8559299d
	.word  0x851428c3,0x38f59ea6,0x509b93b4,0xe8916b07
	.word  0x2caf9a8a,0x47798c0c,0xc2a42a3c,0xa275bbcb
	.word  0x57a86c52,0x7d809d9c,0xc0f6efdf,0xdc189aa7
	.word  0xf1361656,0xf3e4b642,0x547f29cb,0x6488fb4b
	.word  0x5ce942c6,0x13c2d38a,0x44fcd239,0xa2278244
	.word  0x94cecbff,0x2b60c441,0xabd6c988,0x9894167a
	.word  0x0947a7c7,0x0df21e0e,0x54fc6e23,0xd52ae5bc
	.word  0x5f58a5fe,0x92dd74ca,0x5fd86fa7,0xa0fe62e7
	.word  0xa4cee3d1,0xbfb51969,0x6f62c899,0x125e5fca
	.word  0xcc96f678,0x6e76916e,0x26abc0a4,0x52ccb8f4
	.word  0x6e23022d,0xdb53f579,0xdb5abed9,0xda39bf41
	.word  0x6908c2aa,0x74c07859,0x2f60a1bc,0x2f0b0dae
	.word  0x59d6c3f1,0x853f40e4,0x24365230,0x01c4635f
	.word  0xe35a9d21,0x9ca92d57,0x4bd70627,0xf63dbb58
	.word  0xb698d1d3,0x811912bb,0xcf3ac5d4,0x084f6853
	.word  0x54ac1cdd,0x12e29d92,0x5993660b,0x8596d667
	.word  0x3579deb5,0x4e52c74f,0x8f042bbd,0x97c3c62f
	.word  0x76070726,0x8a72a56d,0x0da69438,0x68ea9aa2
	.word  0x040e9c18,0xcfba5ec5,0x1e18814c,0xfd5ee0c7
	.word  0x7a92d7cc,0xf0aacb45,0x5f92a2cb,0x94d85ec6
	.word  0x69ba00f6,0x24c8136f,0x13fb19c2,0xe0596d99
	.word  0x110fbc59,0x1a173978,0x8ce4352f,0x035a8f04
	.word  0xc9da9f7f,0xda823e69,0x14898f85,0x3a5123df
	.word  0x5b957d3b,0xb44777c3,0xa8d59bbf,0x230cf15a
	.word  0x00bb4875,0x3b513b28,0x20e7f7d1,0x373a418c
	.word  0x956c80e1,0x50f0af05,0x80ee25b6,0xf9a911db
	.word  0x97c781ca,0xd047afe3,0x5c0337a9,0x6a6484e8
	.word  0xea4a1dae,0xf9c4b0f6,0x13821384,0xe58e4f86
	.word  0xa1402277,0xdc8f2b09,0xe6c4f5ab,0x05f603a2
	.word  0xe1f1f80b,0x6eee29d0,0xaac91ebc,0xda3fb450
	.word  0x2d54e091,0x3e6e9885,0xbb5d1725,0x8c295369
	.word  0xc626139b,0x331d9028,0xa768966e,0x6f527b35
	.word  0x2e326c2c,0xe61cc6db,0x3c073b33,0x975d9855
	.word  0xc0940b0c,0x73583bab,0x848828fe,0xa62970c6
	.word  0x578cb6c9,0xceb45c38,0x9378cb58,0xaf76cdac
	.word  0xdb49cd50,0x4a94e115,0x42cf7f92,0xfed9754c
	.word  0x1065aaba,0x3e954951,0xd2dcbffa,0x70e2c31f
	.word  0x2f798d5f,0x731907a0,0xd81a786c,0x0950b87f
	.word  0x9b53f303,0x08f3d605,0x72c36361,0xab42f7ac
	.word  0x8092f9c2,0xe26f0dea,0xae947eb8,0x1786e957
	.word  0x9639f034,0x8e4a0af8,0xd20f4665,0x2271b1e7
	.word  0x5b883e26,0xa735eb06,0x162a3504,0x806f36d1
	.word  0xe796c4d3,0x6ed4a4d5,0xdf3c51e8,0x6b09fd0a
	.word  0xaedb3707,0x2b223798,0x850654ea,0xa514bda7
	.word  0x6010d0d4,0x87a3b8d7,0x25485779,0xdc2cf65b
	.word  0x3564ce7d,0xd8369229,0xc503173d,0x17fc6847
	.word  0x121e297e,0xe351722e,0xae59f4bc,0xf411597c
	.word  0x79b319a0,0xc6261604,0x20c138f9,0xcad0d41b
	.word  0x18fb4e69,0x7c021c3c,0x201762f8,0x8f15e8d7
	.word  0xfef41850,0xcc67f29d,0x4722734a,0x91e496cf
	.word  0x412ce765,0x099b5da3,0xf9f2d718,0x666b7360
	.word  0xa0cd5e9b,0xe6ed7cf6,0x621a30d5,0xad11374b
	.word  0x212b0ba4,0x198756fc,0x56195d42,0x222866f2
	.word  0xcbe16553,0x8c03d8e2,0x3f91706e,0x85c43474
	.word  0x56b57ca7,0xc9a0cea4,0xe69159f7,0x39cdf069
	.word  0x647bca62,0x834f94a5,0x6c29926e,0xd467e792
	.word  0x69eb7b41,0xf57609bd,0xb9dbd3d4,0x4aea1390
	.word  0x11f80353,0xf2cb86ef,0x7f2d9f8b,0xd1e871f1
	.word  0xd58097e5,0xb86dd60d,0x2c638cda,0xfa9b5018
	.word  0xfe3c3149,0x7f7cb2b7,0xfc21105c,0xadd57132
	.word  0xadfbae4e,0xc5d5c01f,0x5b3b5022,0x338ed7b5
	.word  0x56dcb1b5,0x2e855e0e,0xc8930364,0x5fd3c8c8
	.word  0x758f9cf3,0x6e9a5625,0x3138f38b,0xa4987fb3
	.word  0xea8060a5,0xd6ffdf41,0xad2b1de3,0xe3dba4c0
	.word  0x043c93ae,0x24dc5323,0x73a392a5,0x8130d6d7
	.word  0xde7d3a00,0xf6578479,0x69fd2c14,0x43ecbd7b
	.word  0xe42d079e,0x34cc6892,0xa62f9b86,0xc8c5f4d9
	.word  0x831ec0f5,0x60dd0907,0x7066f856,0x51c231ee
	.word  0xe92e6047,0xf0f07082,0x80d346ab,0xd9867f0e
	.word  0x1ec41b68,0xfabd01ae,0xd17c0911,0xbfc145e4
	.word  0x8d12051c,0x722559d9,0x1c822743,0x3585cb1a
	.word  0x0cefabb4,0x9d21b785,0xd7ee87e9,0x7b058ef1
	.word  0xe1aa436f,0x30266472,0xfcbd223e,0x323741e0
	.word  0x33035f64,0x10d3fd59,0x6ad4595d,0xf8ef5c5a
	.word  0xbbbd31b6,0x462cc8cc,0x0b5ae1a6,0x1cffcb42
	.word  0x3eaa84c9,0x24b36431,0x642a3f96,0x3743a52c
	.word  0xac05e4b2,0x198fb72a,0x986bcc1d,0xafb9e269
	.word  0x882dd7f5,0xa01571f5,0xd551623d,0x51d58c9a
	.word  0x4fa31c81,0x9f477fdf,0x0f808afe,0xe650fad6
	.word  0xa40ecbf6,0x5c510af8,0x1b297727,0xc0ecf6ca
	.word  0xb0383463,0xdb97094a,0x66e1d994,0x455ca489
	.word  0xa07df097,0xb158eb9e,0xacbabf36,0xa8342050
	.word  0x74c5360c,0xb7ceb513,0x456e80ac,0xed6a1336
	.word  0x385f30c0,0xe400c312,0x1725de44,0x6fc7d351
	.word  0xa73d5de6,0x27d2434f,0x694b29a0,0x35949c8b
	.word  0xaf38a746,0x188d38af,0xab32009a,0xe34f72c0
	.word  0xd396b67c,0xf776f9af,0xec763604,0xff521c5e

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
!! Rule   3 (line  130), Count:    84  inst_type            -> mul 
!! Rule   4 (line  130), Count:   111  inst_type            -> div 
!! Rule   5 (line  130), Count:    89  inst_type            -> fpop 
!! Rule   6 (line  130), Count:    81  inst_type            -> load 
!! Rule   7 (line  130), Count:    94  inst_type            -> asi_load 
!! Rule   8 (line  130), Count:    82  inst_type            -> asi_st 
!! Rule   9 (line  130), Count:    87  inst_type            -> br 
!! Rule  10 (line  130), Count:    93  inst_type            -> membar 
!! Rule  11 (line  130), Count:    93  inst_type            -> atomic 
!! Rule  12 (line  130), Count:    96  inst_type            -> flush 
!! Rule  13 (line  131), Count:    79  inst_type            -> prefetch 
!! Rule  14 (line  137), Count:    46  fpop                 -> st_fp 
!! Rule  15 (line  137), Count:    42  fpop                 -> arith_fp 
!! Rule  16 (line  140), Count:     7  mul                  -> tMULX_R 
!! Rule  17 (line  140), Count:     7  mul                  -> tMULX_I 
!! Rule  18 (line  140), Count:     7  mul                  -> tUMUL_R 
!! Rule  19 (line  140), Count:    13  mul                  -> tUMUL_I 
!! Rule  20 (line  140), Count:     3  mul                  -> tSMUL_R 
!! Rule  21 (line  140), Count:     8  mul                  -> tSMUL_I 
!! Rule  22 (line  140), Count:     6  mul                  -> tUMULcc_R 
!! Rule  23 (line  140), Count:     7  mul                  -> tUMULcc_I 
!! Rule  24 (line  140), Count:     4  mul                  -> tSMULcc_R 
!! Rule  25 (line  140), Count:     4  mul                  -> tSMULcc_I 
!! Rule  26 (line  140), Count:     4  mul                  -> tMULScc_R 
!! Rule  27 (line  140), Count:     3  mul                  -> tMULScc_I 
!! Rule  28 (line  143), Count:    11  div                  -> tUDIV_I 
!! Rule  29 (line  143), Count:     9  div                  -> tUDIV_R 
!! Rule  30 (line  143), Count:     9  div                  -> tSDIV_I 
!! Rule  31 (line  143), Count:     5  div                  -> tSDIV_R 
!! Rule  32 (line  143), Count:     2  div                  -> tSDIVX_R 
!! Rule  33 (line  143), Count:     7  div                  -> tSDIVX_I 
!! Rule  34 (line  143), Count:     5  div                  -> tUDIVX_R 
!! Rule  35 (line  143), Count:     7  div                  -> tUDIVX_I 
!! Rule  36 (line  143), Count:    12  div                  -> tUDIVcc_I 
!! Rule  37 (line  143), Count:    12  div                  -> tUDIVcc_R 
!! Rule  38 (line  143), Count:    11  div                  -> tSDIVcc_I 
!! Rule  39 (line  143), Count:    10  div                  -> tSDIVcc_R 
!! Rule  40 (line  146), Count:     6  load                 -> tLDSB_R 
!! Rule  41 (line  146), Count:     4  load                 -> tLDSB_I 
!! Rule  42 (line  146), Count:     3  load                 -> tLDSH_R 
!! Rule  43 (line  146), Count:     4  load                 -> tLDSH_I 
!! Rule  44 (line  146), Count:     6  load                 -> tLDSW_R 
!! Rule  45 (line  146), Count:     3  load                 -> tLDSW_I 
!! Rule  46 (line  146), Count:     3  load                 -> tLDUB_R 
!! Rule  47 (line  146), Count:     7  load                 -> tLDUB_I 
!! Rule  48 (line  146), Count:     6  load                 -> tLDUH_R 
!! Rule  49 (line  146), Count:     3  load                 -> tLDUH_I 
!! Rule  50 (line  146), Count:     3  load                 -> tLDUW_R 
!! Rule  51 (line  146), Count:     4  load                 -> tLDUW_I 
!! Rule  52 (line  146), Count:     1  load                 -> tLDX_R 
!! Rule  53 (line  146), Count:     0  load                 -> tLDX_I 
!! Rule  54 (line  146), Count:     6  load                 -> tLDD_R 
!! Rule  55 (line  146), Count:     7  load                 -> tLDD_I 
!! Rule  56 (line  149), Count:     6  asi_load             -> tLDSBA_R 
!! Rule  57 (line  149), Count:     3  asi_load             -> tLDSBA_I 
!! Rule  58 (line  149), Count:     7  asi_load             -> tLDSHA_R 
!! Rule  59 (line  149), Count:     5  asi_load             -> tLDSHA_I 
!! Rule  60 (line  149), Count:     4  asi_load             -> tLDSWA_R 
!! Rule  61 (line  149), Count:     5  asi_load             -> tLDSWA_I 
!! Rule  62 (line  149), Count:     7  asi_load             -> tLDUBA_R 
!! Rule  63 (line  149), Count:    10  asi_load             -> tLDUBA_I 
!! Rule  64 (line  149), Count:     5  asi_load             -> tLDUHA_R 
!! Rule  65 (line  149), Count:     0  asi_load             -> tLDUHA_I 
!! Rule  66 (line  149), Count:     4  asi_load             -> tLDUWA_R 
!! Rule  67 (line  149), Count:     3  asi_load             -> tLDUWA_I 
!! Rule  68 (line  149), Count:     4  asi_load             -> tLDXA_R 
!! Rule  69 (line  149), Count:     5  asi_load             -> tLDXA_I 
!! Rule  70 (line  149), Count:     6  asi_load             -> tLDDA_R 
!! Rule  71 (line  149), Count:     5  asi_load             -> tLDDA_I 
!! Rule  72 (line  152), Count:     9  asi_st               -> tSTBA_R 
!! Rule  73 (line  152), Count:    11  asi_st               -> tSTBA_I 
!! Rule  74 (line  152), Count:     6  asi_st               -> tSTHA_R 
!! Rule  75 (line  152), Count:    10  asi_st               -> tSTHA_I 
!! Rule  76 (line  152), Count:     6  asi_st               -> tSTWA_R 
!! Rule  77 (line  152), Count:     9  asi_st               -> tSTWA_I 
!! Rule  78 (line  152), Count:     7  asi_st               -> tSTXA_R 
!! Rule  79 (line  152), Count:     7  asi_st               -> tSTXA_I 
!! Rule  80 (line  152), Count:     8  asi_st               -> tSTDA_R 
!! Rule  81 (line  152), Count:     0  asi_st               -> tSTDA_I 
!! Rule  82 (line  155), Count:     4  br                   -> tBA 
!! Rule  83 (line  155), Count:     3  br                   -> tBN 
!! Rule  84 (line  155), Count:     4  br                   -> tBNE 
!! Rule  85 (line  155), Count:     1  br                   -> tBE 
!! Rule  86 (line  155), Count:     0  br                   -> tBG 
!! Rule  87 (line  155), Count:     2  br                   -> tBLE 
!! Rule  88 (line  155), Count:     2  br                   -> tBGE 
!! Rule  89 (line  155), Count:     4  br                   -> tBL 
!! Rule  90 (line  155), Count:     3  br                   -> tBGU 
!! Rule  91 (line  155), Count:     1  br                   -> tBLEU 
!! Rule  92 (line  156), Count:     9  br                   -> tBCC 
!! Rule  93 (line  156), Count:     0  br                   -> tBCS 
!! Rule  94 (line  156), Count:     3  br                   -> tBPOS 
!! Rule  95 (line  156), Count:     4  br                   -> tBNEG 
!! Rule  96 (line  156), Count:     2  br                   -> tBVC 
!! Rule  97 (line  156), Count:     1  br                   -> tBVS 
!! Rule  98 (line  156), Count:     4  br                   -> tBRZ 
!! Rule  99 (line  156), Count:     2  br                   -> tBRLEZ 
!! Rule 100 (line  157), Count:     3  br                   -> tBRLZ 
!! Rule 101 (line  157), Count:     5  br                   -> tBRNZ 
!! Rule 102 (line  157), Count:     5  br                   -> tBRGZ 
!! Rule 103 (line  157), Count:     2  br                   -> tBRGEZ 
!! Rule 104 (line  157), Count:     1  br                   -> tCALL 
!! Rule 105 (line  160), Count:    37  membar               -> tMEMBAR 
!! Rule 106 (line  160), Count:    55  membar               -> tSTBAR 
!! Rule 107 (line  163), Count:     8  atomic               -> tCASA_R 
!! Rule 108 (line  163), Count:     8  atomic               -> tCASA_I 
!! Rule 109 (line  163), Count:     6  atomic               -> tCASXA_R 
!! Rule 110 (line  163), Count:     3  atomic               -> tCASXA_I 
!! Rule 111 (line  163), Count:     5  atomic               -> tLDSTUBA_I 
!! Rule 112 (line  163), Count:     7  atomic               -> tLDSTUB_I 
!! Rule 113 (line  163), Count:     8  atomic               -> tLDSTUB_R 
!! Rule 114 (line  163), Count:     6  atomic               -> tLDSTUBA_R 
!! Rule 115 (line  163), Count:     6  atomic               -> tSWAP_I 
!! Rule 116 (line  163), Count:     7  atomic               -> tSWAP_R 
!! Rule 117 (line  163), Count:     8  atomic               -> tSWAPA_I 
!! Rule 118 (line  163), Count:    10  atomic               -> tSWAPA_R 
!! Rule 119 (line  166), Count:    13  st_fp                -> tSTF_R 
!! Rule 120 (line  166), Count:     8  st_fp                -> tSTF_I 
!! Rule 121 (line  166), Count:    13  st_fp                -> tSTDF_I 
!! Rule 122 (line  166), Count:     9  st_fp                -> tSTDF_R 
!! Rule 123 (line  169), Count:     5  arith_fp             -> tFADDs 
!! Rule 124 (line  169), Count:    11  arith_fp             -> tFSUBs 
!! Rule 125 (line  169), Count:    11  arith_fp             -> tFMULs 
!! Rule 126 (line  169), Count:    12  arith_fp             -> tFDIVs 
!! Rule 127 (line  172), Count:    21  prefetch             -> tPREFETCH_I 
!! Rule 128 (line  172), Count:    18  prefetch             -> tPREFETCH_R 
!! Rule 129 (line  172), Count:    19  prefetch             -> tPREFETCHA_I 
!! Rule 130 (line  172), Count:    18  prefetch             -> tPREFETCHA_R 
!! Rule 131 (line  175), Count:    50  flush                -> tFLUSH_I 
!! 
!!   257: Token tMULX_R	Count = 8
!!   258: Token tMULX_I	Count = 8
!!   259: Token tUMUL_R	Count = 8
!!   260: Token tUMUL_I	Count = 14
!!   261: Token tSMUL_R	Count = 4
!!   262: Token tSMUL_I	Count = 9
!!   263: Token tUMULcc_R	Count = 7
!!   264: Token tUMULcc_I	Count = 8
!!   265: Token tSMULcc_R	Count = 5
!!   266: Token tSMULcc_I	Count = 5
!!   267: Token tMULScc_R	Count = 5
!!   268: Token tMULScc_I	Count = 4
!!   269: Token tUDIV_I	Count = 12
!!   270: Token tUDIV_R	Count = 10
!!   271: Token tSDIV_I	Count = 10
!!   272: Token tSDIV_R	Count = 6
!!   273: Token tSDIVX_R	Count = 3
!!   274: Token tSDIVX_I	Count = 8
!!   275: Token tUDIVX_R	Count = 6
!!   276: Token tUDIVX_I	Count = 8
!!   277: Token tUDIVcc_I	Count = 13
!!   278: Token tUDIVcc_R	Count = 13
!!   279: Token tSDIVcc_I	Count = 12
!!   280: Token tSDIVcc_R	Count = 11
!!   281: Token tLDSB_R	Count = 7
!!   282: Token tLDSB_I	Count = 5
!!   283: Token tLDSH_R	Count = 4
!!   284: Token tLDSH_I	Count = 5
!!   285: Token tLDSW_R	Count = 7
!!   286: Token tLDSW_I	Count = 4
!!   287: Token tLDUB_R	Count = 4
!!   288: Token tLDUB_I	Count = 8
!!   289: Token tLDUH_R	Count = 7
!!   290: Token tLDUH_I	Count = 4
!!   291: Token tLDUW_R	Count = 4
!!   292: Token tLDUW_I	Count = 5
!!   293: Token tLDX_R	Count = 2
!!   294: Token tLDX_I	Count = 1
!!   295: Token tLDD_R	Count = 7
!!   296: Token tLDD_I	Count = 8
!!   297: Token tLDSBA_R	Count = 7
!!   298: Token tLDSBA_I	Count = 4
!!   299: Token tLDSHA_R	Count = 8
!!   300: Token tLDSHA_I	Count = 6
!!   301: Token tLDSWA_R	Count = 5
!!   302: Token tLDSWA_I	Count = 6
!!   303: Token tLDUBA_R	Count = 8
!!   304: Token tLDUBA_I	Count = 11
!!   305: Token tLDUHA_R	Count = 6
!!   306: Token tLDUHA_I	Count = 1
!!   307: Token tLDUWA_R	Count = 5
!!   308: Token tLDUWA_I	Count = 4
!!   309: Token tLDXA_R	Count = 5
!!   310: Token tLDXA_I	Count = 6
!!   311: Token tLDDA_R	Count = 7
!!   312: Token tLDDA_I	Count = 6
!!   313: Token tSTBA_R	Count = 10
!!   314: Token tSTBA_I	Count = 12
!!   315: Token tSTHA_R	Count = 7
!!   316: Token tSTHA_I	Count = 11
!!   317: Token tSTWA_R	Count = 7
!!   318: Token tSTWA_I	Count = 10
!!   319: Token tSTXA_R	Count = 8
!!   320: Token tSTXA_I	Count = 8
!!   321: Token tSTDA_R	Count = 9
!!   322: Token tSTDA_I	Count = 1
!!   323: Token tBA	Count = 5
!!   324: Token tBN	Count = 4
!!   325: Token tBNE	Count = 5
!!   326: Token tBE	Count = 2
!!   327: Token tBG	Count = 1
!!   328: Token tBLE	Count = 3
!!   329: Token tBGE	Count = 3
!!   330: Token tBL	Count = 5
!!   331: Token tBGU	Count = 4
!!   332: Token tBLEU	Count = 2
!!   333: Token tBCC	Count = 10
!!   334: Token tBCS	Count = 1
!!   335: Token tBPOS	Count = 4
!!   336: Token tBNEG	Count = 5
!!   337: Token tBVC	Count = 3
!!   338: Token tBVS	Count = 2
!!   339: Token tBRZ	Count = 5
!!   340: Token tBRLEZ	Count = 3
!!   341: Token tBRLZ	Count = 4
!!   342: Token tBRNZ	Count = 6
!!   343: Token tBRGZ	Count = 6
!!   344: Token tBRGEZ	Count = 3
!!   345: Token tCALL	Count = 2
!!   346: Token tMEMBAR	Count = 38
!!   347: Token tSTBAR	Count = 56
!!   348: Token tCASA_R	Count = 9
!!   349: Token tCASA_I	Count = 9
!!   350: Token tCASXA_R	Count = 7
!!   351: Token tCASXA_I	Count = 4
!!   352: Token tLDSTUBA_I	Count = 6
!!   353: Token tLDSTUB_I	Count = 8
!!   354: Token tLDSTUB_R	Count = 9
!!   355: Token tLDSTUBA_R	Count = 7
!!   356: Token tSWAP_I	Count = 7
!!   357: Token tSWAP_R	Count = 8
!!   358: Token tSWAPA_I	Count = 9
!!   359: Token tSWAPA_R	Count = 11
!!   360: Token tSTF_R	Count = 14
!!   361: Token tSTF_I	Count = 9
!!   362: Token tSTDF_I	Count = 14
!!   363: Token tSTDF_R	Count = 10
!!   364: Token tFADDs	Count = 6
!!   365: Token tFSUBs	Count = 12
!!   366: Token tFMULs	Count = 12
!!   367: Token tFDIVs	Count = 13
!!   368: Token tPREFETCH_I	Count = 22
!!   369: Token tPREFETCH_R	Count = 19
!!   370: Token tPREFETCHA_I	Count = 20
!!   371: Token tPREFETCHA_R	Count = 19
!!   372: Token tFLUSH_I	Count = 51
!!   373: Token tFLUSH_R	Count = 46
!! 
!! 
!! +++ finish +++

