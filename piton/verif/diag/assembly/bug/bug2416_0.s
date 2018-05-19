// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: bug2416_0.s
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
   random seed:	595550537
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
        setx  0x00000000000007b0, %g1, %r9
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
        setx  0xd9daa06e0c7457ad, %g1, %r0
        setx  0x4ae97153872ebce3, %g1, %r1
        setx  0x2fd40e5d9598e12b, %g1, %r2
        setx  0x6443ba0a8a370f63, %g1, %r3
        setx  0x129a09cd92d1cc18, %g1, %r4
        setx  0x2faf5c782d36a214, %g1, %r5
        setx  0x86c145267a1f5eaf, %g1, %r6
        setx  0x6bd45c8899f608c0, %g1, %r7
        setx  0x04e79cb66ed06514, %g1, %r10
        setx  0xfe80b4893b8189b4, %g1, %r11
        setx  0x48f149232e11dc76, %g1, %r12
        setx  0xf2fd752936a76260, %g1, %r13
        setx  0xd9584b935ad7b9a8, %g1, %r14
        setx  0x5e49a0dae10799ec, %g1, %r15
        setx  0xe5549c57675568df, %g1, %r16
        setx  0xcaddad922758bb37, %g1, %r17
        setx  0x6b75e6ea8ab61429, %g1, %r18
        setx  0x773183f018cfc03b, %g1, %r19
        setx  0xde17ecb51e3535e4, %g1, %r20
        setx  0xe2a946287f826f30, %g1, %r21
        setx  0x898ffa56d8be10ed, %g1, %r22
        setx  0xda2d7d02af626bf5, %g1, %r23
        setx  0xd4912d915490d70b, %g1, %r24
        setx  0xe0b30c9174d8cc55, %g1, %r25
        setx  0x80e7ae422f5b69ed, %g1, %r26
        setx  0xb834692889e2d0e7, %g1, %r27
        setx  0x5c14f6c3e95c88cf, %g1, %r28
        setx  0xdfd2fc4f1879bce7, %g1, %r29
        setx  0xe1d41ebdf3db4984, %g1, %r30
        setx  0xfbf6a2e748cd4d40, %g1, %r31
	.word 0xc84a0009  ! 5: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0x12800004  ! 7: BNE	bne  	<label_0x4>
	.word 0x98fa0009  ! 9: SDIVcc_R	sdivcc 	%r8, %r9, %r12
	.word 0x8ef20009  ! 10: UDIVcc_R	udivcc 	%r8, %r9, %r7
	.word 0xaafa0009  ! 11: SDIVcc_R	sdivcc 	%r8, %r9, %r21
	.word 0xf06a0009  ! 13: LDSTUB_R	ldstub	%r24, [%r8 + %r9]
	.word 0xccba2388  ! 15: STDA_I	stda	%r6, [%r8 + 0x0388] %asi
	.word 0xc41a0009  ! 16: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x10800008  ! 17: BA	ba  	<label_0x8>
	.word 0x8d220009  ! 18: MULScc_R	mulscc 	%r8, %r9, %r6
	.word 0xc3f21009  ! 19: CASXA_I	casxa	[%r8] 0x80, %r9, %r1
	.word 0x99a209a9  ! 20: FDIVs	fdivs	%f8, %f9, %f12
	.word 0xe4120009  ! 21: LDUH_R	lduh	[%r8 + %r9], %r18
	.word 0xcd3a2a68  ! 22: STDF_I	std	%f6, [0x0a68, %r8]
	.word 0xc73a2c80  ! 23: STDF_I	std	%f3, [0x0c80, %r8]
	.word 0xca5a0009  ! 24: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xaa4a0009  ! 25: MULX_R	mulx 	%r8, %r9, %r21
	.word 0x8ba20929  ! 26: FMULs	fmuls	%f8, %f9, %f5
	.word 0xf0ea239c  ! 27: LDSTUBA_I	ldstuba	%r24, [%r8 + 0x039c] %asi
	.word 0x8143e032  ! 28: MEMBAR	membar	#StoreLoad | #Lookaside | #MemIssue 
	.word 0xc5e21009  ! 29: CASA_I	casa	[%r8] 0x80, %r9, %r2
	.word 0xc4d223c8  ! 30: LDSHA_I	ldsha	[%r8, + 0x03c8] %asi, %r2
	.word 0xb8d229a8  ! 31: UMULcc_I	umulcc 	%r8, 0x09a8, %r28
	.word 0xc3ea2c08  ! 32: PREFETCHA_I	prefetcha	[%r8, + 0x0c08] %asi, #one_read
	.word 0x2cca0004  ! 33: BRGZ	brgz,a,pt	%8,<label_0xa0004>
	.word 0x8143e064  ! 34: MEMBAR	membar	#LoadStore | #MemIssue | #Sync 
	.word 0xc4ca1009  ! 35: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r2
	.word 0xcad221f8  ! 36: LDSHA_I	ldsha	[%r8, + 0x01f8] %asi, %r5
	.word 0x8143c000  ! 37: STBAR	stbar
	.word 0x86da0009  ! 38: SMULcc_R	smulcc 	%r8, %r9, %r3
	.word 0xaad20009  ! 40: UMULcc_R	umulcc 	%r8, %r9, %r21
	.word 0xc4fa1009  ! 41: SWAPA_R	swapa	%r2, [%r8 + %r9] 0x80
	.word 0xafa208a9  ! 42: FSUBs	fsubs	%f8, %f9, %f23
	.word 0x40000008  ! 43: CALL	call	disp30_8
	.word 0xba522ef8  ! 44: UMUL_I	umul 	%r8, 0x0ef8, %r29
	.word 0x8143e054  ! 45: MEMBAR	membar	#LoadStore | #Lookaside | #Sync 
	.word 0xc36a2330  ! 46: PREFETCH_I	prefetch	[%r8 + 0x0330], #one_read
	.word 0xac720009  ! 47: UDIV_R	udiv 	%r8, %r9, %r22
	.word 0xb9a209a9  ! 49: FDIVs	fdivs	%f8, %f9, %f28
	.word 0x82720009  ! 50: UDIV_R	udiv 	%r8, %r9, %r1
	.word 0x8143e07a  ! 51: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0x8143c000  ! 52: STBAR	stbar
	.word 0x8143c000  ! 53: STBAR	stbar
	.word 0x8cfa0009  ! 54: SDIVcc_R	sdivcc 	%r8, %r9, %r6
	.word 0xcdf21009  ! 55: CASXA_I	casxa	[%r8] 0x80, %r9, %r6
	.word 0x8143c000  ! 56: STBAR	stbar
	.word 0xcc4a0009  ! 57: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xead22318  ! 58: LDSHA_I	ldsha	[%r8, + 0x0318] %asi, %r21
	.word 0xfc7a0009  ! 59: SWAP_R	swap	%r30, [%r8 + %r9]
	.word 0x8a4a0009  ! 60: MULX_R	mulx 	%r8, %r9, %r5
	.word 0xfa5a0009  ! 61: LDX_R	ldx	[%r8 + %r9], %r29
	.word 0xc4ba1009  ! 62: STDA_R	stda	%r2, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 63: STBAR	stbar
	.word 0x85222c40  ! 64: MULScc_I	mulscc 	%r8, 0x0c40, %r2
	.word 0xc4120009  ! 65: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xc64a2db0  ! 66: LDSB_I	ldsb	[%r8 + 0x0db0], %r3
	.word 0xaba20929  ! 67: FMULs	fmuls	%f8, %f9, %f21
	.word 0xe81a0009  ! 68: LDD_R	ldd	[%r8 + %r9], %r20
	.word 0xf0ba1009  ! 69: STDA_R	stda	%r24, [%r8 + %r9] 0x80
	.word 0x28800004  ! 70: BLEU	bleu,a	<label_0x4>
	.word 0x82fa0009  ! 71: SDIVcc_R	sdivcc 	%r8, %r9, %r1
	.word 0x8cf20009  ! 72: UDIVcc_R	udivcc 	%r8, %r9, %r6
	.word 0xf08a1009  ! 73: LDUBA_R	lduba	[%r8, %r9] 0x80, %r24
	.word 0xc6a2253c  ! 74: STWA_I	stwa	%r3, [%r8 + 0x053c] %asi
	.word 0xcefa1009  ! 75: SWAPA_R	swapa	%r7, [%r8 + %r9] 0x80
	.word 0x22800004  ! 76: BE	be,a	<label_0x4>
	.word 0x8fa209a9  ! 77: FDIVs	fdivs	%f8, %f9, %f7
	.word 0x8143e011  ! 78: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xa3a209a9  ! 79: FDIVs	fdivs	%f8, %f9, %f17
	.word 0xf0fa2014  ! 80: SWAPA_I	swapa	%r24, [%r8 + 0x0014] %asi
	.word 0xfc7a263c  ! 81: SWAP_I	swap	%r30, [%r8 + 0x063c]
	.word 0xe0ba2770  ! 82: STDA_I	stda	%r16, [%r8 + 0x0770] %asi
	.word 0xb36a0009  ! 83: SDIVX_R	sdivx	%r8, %r9, %r25
	.word 0xcaa229b8  ! 84: STWA_I	stwa	%r5, [%r8 + 0x09b8] %asi
	.word 0xfaca2298  ! 85: LDSBA_I	ldsba	[%r8, + 0x0298] %asi, %r29
	.word 0x8143e074  ! 86: MEMBAR	membar	#LoadStore | #Lookaside | #MemIssue | #Sync 
	.word 0xc3ea20f4  ! 87: PREFETCHA_I	prefetcha	[%r8, + 0x00f4] %asi, #one_read
	.word 0xcdf22009  ! 88: CASXA_R	casxa	[%r8]%asi, %r9, %r6
	.word 0xc6a22b14  ! 89: STWA_I	stwa	%r3, [%r8 + 0x0b14] %asi
	.word 0xccaa1009  ! 90: STBA_R	stba	%r6, [%r8 + %r9] 0x80
	.word 0x8b2224d4  ! 92: MULScc_I	mulscc 	%r8, 0x04d4, %r5
	.word 0x12800004  ! 93: BNE	bne  	<label_0x4>
	.word 0xe0ba29a8  ! 94: STDA_I	stda	%r16, [%r8 + 0x09a8] %asi
	.word 0xf01a2510  ! 95: LDD_I	ldd	[%r8 + 0x0510], %r24
	.word 0x8143e044  ! 96: MEMBAR	membar	#LoadStore | #Sync 
	.word 0x32800004  ! 97: BNE	bne,a	<label_0x4>
	.word 0xa0520009  ! 98: UMUL_R	umul 	%r8, %r9, %r16
	.word 0xcdf21009  ! 99: CASXA_I	casxa	[%r8] 0x80, %r9, %r6
	.word 0xc3ea2344  ! 100: PREFETCHA_I	prefetcha	[%r8, + 0x0344] %asi, #one_read
	.word 0xccb226e0  ! 101: STHA_I	stha	%r6, [%r8 + 0x06e0] %asi
	.word 0x865a0009  ! 102: SMUL_R	smul 	%r8, %r9, %r3
	.word 0x8143e016  ! 103: MEMBAR	membar	#StoreLoad | #LoadStore | #Lookaside 
	.word 0xca6a0009  ! 104: LDSTUB_R	ldstub	%r5, [%r8 + %r9]
	.word 0x20800004  ! 105: BN	bn,a	<label_0x4>
	.word 0xec522330  ! 106: LDSH_I	ldsh	[%r8 + 0x0330], %r22
	.word 0x2e800004  ! 107: BVS	bvs,a	<label_0x4>
	.word 0xe7220009  ! 108: STF_R	st	%f19, [%r9, %r8]
	.word 0xc4c21009  ! 109: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r2
	.word 0xf4aa1009  ! 110: STBA_R	stba	%r26, [%r8 + %r9] 0x80
	.word 0xcd3a0009  ! 112: STDF_R	std	%f6, [%r9, %r8]
	.word 0xdc1a2660  ! 113: LDD_I	ldd	[%r8 + 0x0660], %r14
	.word 0xccf22e28  ! 114: STXA_I	stxa	%r6, [%r8 + 0x0e28] %asi
	.word 0xa3a20829  ! 115: FADDs	fadds	%f8, %f9, %f17
	.word 0xc3ea21c4  ! 116: PREFETCHA_I	prefetcha	[%r8, + 0x01c4] %asi, #one_read
	.word 0x8a720009  ! 117: UDIV_R	udiv 	%r8, %r9, %r5
	.word 0xb7a20829  ! 118: FADDs	fadds	%f8, %f9, %f27
	.word 0x06800008  ! 119: BL	bl  	<label_0x8>
	.word 0x8a520009  ! 121: UMUL_R	umul 	%r8, %r9, %r5
	.word 0xa07a0009  ! 123: SDIV_R	sdiv 	%r8, %r9, %r16
	.word 0x887a0009  ! 124: SDIV_R	sdiv 	%r8, %r9, %r4
	.word 0xc6ca246c  ! 125: LDSBA_I	ldsba	[%r8, + 0x046c] %asi, %r3
	.word 0xe6da1009  ! 127: LDXA_R	ldxa	[%r8, %r9] 0x80, %r19
	.word 0x866a0009  ! 128: UDIVX_R	udivx 	%r8, %r9, %r3
	.word 0xdc9a2730  ! 129: LDDA_I	ldda	[%r8, + 0x0730] %asi, %r14
	.word 0xd81a2db8  ! 130: LDD_I	ldd	[%r8 + 0x0db8], %r12
	.word 0xd89a1009  ! 131: LDDA_R	ldda	[%r8, %r9] 0x80, %r12
	.word 0xd8ba1009  ! 132: STDA_R	stda	%r12, [%r8 + %r9] 0x80
	.word 0xf81a0009  ! 133: LDD_R	ldd	[%r8 + %r9], %r28
	.word 0xcaca2d18  ! 134: LDSBA_I	ldsba	[%r8, + 0x0d18] %asi, %r5
	.word 0x2a800004  ! 135: BCS	bcs,a	<label_0x4>
	.word 0x8143c000  ! 136: STBAR	stbar
	.word 0xc7220009  ! 137: STF_R	st	%f3, [%r9, %r8]
	.word 0xc3ea2654  ! 138: PREFETCHA_I	prefetcha	[%r8, + 0x0654] %asi, #one_read
	.word 0x8143c000  ! 140: STBAR	stbar
	.word 0x8c4a2e44  ! 141: MULX_I	mulx 	%r8, 0x0e44, %r6
	.word 0xced22fb0  ! 142: LDSHA_I	ldsha	[%r8, + 0x0fb0] %asi, %r7
	.word 0xc87a2180  ! 143: SWAP_I	swap	%r4, [%r8 + 0x0180]
	.word 0x8c722170  ! 144: UDIV_I	udiv 	%r8, 0x0170, %r6
	.word 0xe88a1009  ! 145: LDUBA_R	lduba	[%r8, %r9] 0x80, %r20
	.word 0xb86a2844  ! 147: UDIVX_I	udivx 	%r8, 0x0844, %r28
	.word 0xc6ca1009  ! 149: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r3
	.word 0x8143e00a  ! 150: MEMBAR	membar	#StoreLoad | #StoreStore 
	.word 0x88da25e0  ! 151: SMULcc_I	smulcc 	%r8, 0x05e0, %r4
	.word 0xe4aa2080  ! 153: STBA_I	stba	%r18, [%r8 + 0x0080] %asi
	.word 0x82fa2fb0  ! 154: SDIVcc_I	sdivcc 	%r8, 0x0fb0, %r1
	.word 0x865a0009  ! 155: SMUL_R	smul 	%r8, %r9, %r3
	.word 0x88f20009  ! 156: UDIVcc_R	udivcc 	%r8, %r9, %r4
	.word 0x85a20829  ! 157: FADDs	fadds	%f8, %f9, %f2
	.word 0xc33a2488  ! 158: STDF_I	std	%f1, [0x0488, %r8]
	.word 0xef3a0009  ! 159: STDF_R	std	%f23, [%r9, %r8]
	.word 0x02800004  ! 160: BE	be  	<label_0x4>
	.word 0x8143c000  ! 161: STBAR	stbar
	.word 0xc3e22009  ! 162: CASA_R	casa	[%r8] %asi, %r9, %r1
	.word 0xc6422134  ! 163: LDSW_I	ldsw	[%r8 + 0x0134], %r3
	.word 0x8ba20829  ! 164: FADDs	fadds	%f8, %f9, %f5
	.word 0x8c6a0009  ! 165: UDIVX_R	udivx 	%r8, %r9, %r6
	.word 0x40000008  ! 166: CALL	call	disp30_8
	.word 0xcff22009  ! 167: CASXA_R	casxa	[%r8]%asi, %r9, %r7
	.word 0xceaa2d20  ! 168: STBA_I	stba	%r7, [%r8 + 0x0d20] %asi
	.word 0xc3ea2f70  ! 169: PREFETCHA_I	prefetcha	[%r8, + 0x0f70] %asi, #one_read
	.word 0xc47a0009  ! 170: SWAP_R	swap	%r2, [%r8 + %r9]
	.word 0x8143c000  ! 171: STBAR	stbar
	.word 0x8143e019  ! 172: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside 
	.word 0x10800008  ! 173: BA	ba  	<label_0x8>
	.word 0xc4ca1009  ! 174: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r2
	.word 0x886a0009  ! 175: UDIVX_R	udivx 	%r8, %r9, %r4
	.word 0xcad21009  ! 176: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r5
	.word 0x30800004  ! 177: BA	ba,a	<label_0x4>
	.word 0xc4b22ee0  ! 178: STHA_I	stha	%r2, [%r8 + 0x0ee0] %asi
	.word 0x84f20009  ! 180: UDIVcc_R	udivcc 	%r8, %r9, %r2
	.word 0xa8d222e0  ! 181: UMULcc_I	umulcc 	%r8, 0x02e0, %r20
	.word 0xc36a2a3c  ! 182: PREFETCH_I	prefetch	[%r8 + 0x0a3c], #one_read
	.word 0x30800008  ! 183: BA	ba,a	<label_0x8>
	.word 0xe4ba1009  ! 184: STDA_R	stda	%r18, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 185: STBAR	stbar
	.word 0xc852271c  ! 186: LDSH_I	ldsh	[%r8 + 0x071c], %r4
	.word 0x8143c000  ! 187: STBAR	stbar
	.word 0xa56a20e4  ! 188: SDIVX_I	sdivx	%r8, 0x00e4, %r18
	.word 0xc6a22754  ! 189: STWA_I	stwa	%r3, [%r8 + 0x0754] %asi
	.word 0xcc4a2e00  ! 190: LDSB_I	ldsb	[%r8 + 0x0e00], %r6
	.word 0xafa20929  ! 191: FMULs	fmuls	%f8, %f9, %f23
	.word 0xe09a1009  ! 193: LDDA_R	ldda	[%r8, %r9] 0x80, %r16
	.word 0x8143c000  ! 194: STBAR	stbar
	.word 0xca6a0009  ! 195: LDSTUB_R	ldstub	%r5, [%r8 + %r9]
	.word 0x8da20829  ! 196: FADDs	fadds	%f8, %f9, %f6
	.word 0x8143c000  ! 197: STBAR	stbar
	.word 0xfcba1009  ! 198: STDA_R	stda	%r30, [%r8 + %r9] 0x80
	.word 0x8cda2a64  ! 199: SMULcc_I	smulcc 	%r8, 0x0a64, %r6
	.word 0x8da20929  ! 200: FMULs	fmuls	%f8, %f9, %f6
	.word 0x96520009  ! 201: UMUL_R	umul 	%r8, %r9, %r11
	.word 0xc2da1009  ! 202: LDXA_R	ldxa	[%r8, %r9] 0x80, %r1
	.word 0xcc7a267c  ! 203: SWAP_I	swap	%r6, [%r8 + 0x067c]
	.word 0xb6f20009  ! 204: UDIVcc_R	udivcc 	%r8, %r9, %r27
	.word 0x8143c000  ! 205: STBAR	stbar
	.word 0x84522378  ! 206: UMUL_I	umul 	%r8, 0x0378, %r2
	.word 0xfa520009  ! 207: LDSH_R	ldsh	[%r8 + %r9], %r29
	.word 0xc4ba1009  ! 208: STDA_R	stda	%r2, [%r8 + %r9] 0x80
	.word 0x9e5a0009  ! 209: SMUL_R	smul 	%r8, %r9, %r15
	.word 0x08800008  ! 210: BLEU	bleu  	<label_0x8>
	.word 0xcef227f0  ! 211: STXA_I	stxa	%r7, [%r8 + 0x07f0] %asi
	.word 0xf00a0009  ! 212: LDUB_R	ldub	[%r8 + %r9], %r24
	.word 0xe0f21009  ! 213: STXA_R	stxa	%r16, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 214: STBAR	stbar
	.word 0x8ed20009  ! 215: UMULcc_R	umulcc 	%r8, %r9, %r7
	.word 0xc36a2484  ! 216: PREFETCH_I	prefetch	[%r8 + 0x0484], #one_read
	.word 0xa67a2c04  ! 217: SDIV_I	sdiv 	%r8, 0x0c04, %r19
	.word 0xc2aa1009  ! 218: STBA_R	stba	%r1, [%r8 + %r9] 0x80
	.word 0xc49a1009  ! 220: LDDA_R	ldda	[%r8, %r9] 0x80, %r2
	.word 0xca8a1009  ! 221: LDUBA_R	lduba	[%r8, %r9] 0x80, %r5
	.word 0x04800004  ! 222: BLE	ble  	<label_0x4>
	.word 0xd4fa1009  ! 223: SWAPA_R	swapa	%r10, [%r8 + %r9] 0x80
	.word 0xe4aa1009  ! 224: STBA_R	stba	%r18, [%r8 + %r9] 0x80
	.word 0xc87a0009  ! 225: SWAP_R	swap	%r4, [%r8 + %r9]
	.word 0x8143e059  ! 226: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside | #Sync 
	.word 0x8143e03f  ! 227: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0xe8ba1009  ! 228: STDA_R	stda	%r20, [%r8 + %r9] 0x80
	.word 0xcc8a2698  ! 229: LDUBA_I	lduba	[%r8, + 0x0698] %asi, %r6
	.word 0xc73a23b8  ! 230: STDF_I	std	%f3, [0x03b8, %r8]
	.word 0xccea29d8  ! 231: LDSTUBA_I	ldstuba	%r6, [%r8 + 0x09d8] %asi
	.word 0x8e4a280c  ! 232: MULX_I	mulx 	%r8, 0x080c, %r7
	.word 0x12800004  ! 233: BNE	bne  	<label_0x4>
	.word 0xf85a2630  ! 234: LDX_I	ldx	[%r8 + 0x0630], %r28
	.word 0xcc9a1009  ! 235: LDDA_R	ldda	[%r8, %r9] 0x80, %r6
	.word 0x28800004  ! 236: BLEU	bleu,a	<label_0x4>
	.word 0x08800008  ! 237: BLEU	bleu  	<label_0x8>
	.word 0xc7f22009  ! 238: CASXA_R	casxa	[%r8]%asi, %r9, %r3
	.word 0xc3ea27cc  ! 239: PREFETCHA_I	prefetcha	[%r8, + 0x07cc] %asi, #one_read
	.word 0xd66a21f0  ! 240: LDSTUB_I	ldstub	%r11, [%r8 + 0x01f0]
	.word 0x8143e066  ! 241: MEMBAR	membar	#StoreLoad | #LoadStore | #MemIssue | #Sync 
	.word 0xdb220009  ! 242: STF_R	st	%f13, [%r9, %r8]
	.word 0xc2922410  ! 243: LDUHA_I	lduha	[%r8, + 0x0410] %asi, %r1
	.word 0xc4ea233c  ! 244: LDSTUBA_I	ldstuba	%r2, [%r8 + 0x033c] %asi
	.word 0x1e800008  ! 245: BVC	bvc  	<label_0x8>
	.word 0x84fa0009  ! 246: SDIVcc_R	sdivcc 	%r8, %r9, %r2
	.word 0xc8c21009  ! 247: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r4
	.word 0x8143c000  ! 248: STBAR	stbar
	.word 0x8143e010  ! 249: MEMBAR	membar	#Lookaside 
	.word 0x847a25a8  ! 250: SDIV_I	sdiv 	%r8, 0x05a8, %r2
	.word 0xcac22184  ! 251: LDSWA_I	ldswa	[%r8, + 0x0184] %asi, %r5
	.word 0x88da23cc  ! 252: SMULcc_I	smulcc 	%r8, 0x03cc, %r4
	.word 0xda4a0009  ! 253: LDSB_R	ldsb	[%r8 + %r9], %r13
	.word 0xec8a20ec  ! 254: LDUBA_I	lduba	[%r8, + 0x00ec] %asi, %r22
	.word 0x8143c000  ! 255: STBAR	stbar
	.word 0xa9a20829  ! 256: FADDs	fadds	%f8, %f9, %f20
	.word 0xef3a0009  ! 257: STDF_R	std	%f23, [%r9, %r8]
	.word 0x967a0009  ! 258: SDIV_R	sdiv 	%r8, %r9, %r11
	.word 0xd4fa1009  ! 259: SWAPA_R	swapa	%r10, [%r8 + %r9] 0x80
	.word 0xe6120009  ! 260: LDUH_R	lduh	[%r8 + %r9], %r19
	.word 0x84d20009  ! 261: UMULcc_R	umulcc 	%r8, %r9, %r2
	.word 0x887a2b44  ! 262: SDIV_I	sdiv 	%r8, 0x0b44, %r4
	.word 0xc80a0009  ! 263: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xed22216c  ! 264: STF_I	st	%f22, [0x016c, %r8]
	.word 0xc36a20a0  ! 265: PREFETCH_I	prefetch	[%r8 + 0x00a0], #one_read
	.word 0xc2fa1009  ! 266: SWAPA_R	swapa	%r1, [%r8 + %r9] 0x80
	.word 0x8a7a0009  ! 267: SDIV_R	sdiv 	%r8, %r9, %r5
	.word 0x84da21c8  ! 270: SMULcc_I	smulcc 	%r8, 0x01c8, %r2
	.word 0xe6aa2b78  ! 271: STBA_I	stba	%r19, [%r8 + 0x0b78] %asi
	.word 0xc2ca1009  ! 272: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r1
	.word 0x88fa2e5c  ! 273: SDIVcc_I	sdivcc 	%r8, 0x0e5c, %r4
	.word 0xca921009  ! 274: LDUHA_R	lduha	[%r8, %r9] 0x80, %r5
	.word 0xdcf21009  ! 275: STXA_R	stxa	%r14, [%r8 + %r9] 0x80
	.word 0xe53a2230  ! 276: STDF_I	std	%f18, [0x0230, %r8]
	.word 0xcde22009  ! 277: CASA_R	casa	[%r8] %asi, %r9, %r6
	.word 0x9a5222b0  ! 278: UMUL_I	umul 	%r8, 0x02b0, %r13
	.word 0xc3f21009  ! 279: CASXA_I	casxa	[%r8] 0x80, %r9, %r1
	.word 0xc87a2770  ! 280: SWAP_I	swap	%r4, [%r8 + 0x0770]
	.word 0x885a0009  ! 281: SMUL_R	smul 	%r8, %r9, %r4
	.word 0x02800004  ! 282: BE	be  	<label_0x4>
	.word 0x98720009  ! 283: UDIV_R	udiv 	%r8, %r9, %r12
	.word 0x8143c000  ! 284: STBAR	stbar
	.word 0xc36a2308  ! 285: PREFETCH_I	prefetch	[%r8 + 0x0308], #one_read
	.word 0xfa5a2398  ! 286: LDX_I	ldx	[%r8 + 0x0398], %r29
	.word 0x8143c000  ! 287: STBAR	stbar
	.word 0xceea1009  ! 288: LDSTUBA_R	ldstuba	%r7, [%r8 + %r9] 0x80
	.word 0x876a0009  ! 289: SDIVX_R	sdivx	%r8, %r9, %r3
	.word 0x8fa209a9  ! 290: FDIVs	fdivs	%f8, %f9, %f7
	.word 0x8143e028  ! 291: MEMBAR	membar	#StoreStore | #MemIssue 
	.word 0xc52221c4  ! 292: STF_I	st	%f2, [0x01c4, %r8]
	.word 0x88522598  ! 293: UMUL_I	umul 	%r8, 0x0598, %r4
	.word 0x88fa0009  ! 294: SDIVcc_R	sdivcc 	%r8, %r9, %r4
	.word 0x2e800008  ! 295: BVS	bvs,a	<label_0x8>
	.word 0x34800008  ! 296: BG	bg,a	<label_0x8>
	.word 0x867a0009  ! 297: SDIV_R	sdiv 	%r8, %r9, %r3
	.word 0x22800004  ! 298: BE	be,a	<label_0x4>
	.word 0xd6f22e68  ! 299: STXA_I	stxa	%r11, [%r8 + 0x0e68] %asi
	.word 0xc3ea2e64  ! 300: PREFETCHA_I	prefetcha	[%r8, + 0x0e64] %asi, #one_read
	.word 0x88fa25d8  ! 301: SDIVcc_I	sdivcc 	%r8, 0x05d8, %r4
	.word 0x8143c000  ! 302: STBAR	stbar
	.word 0x20800004  ! 303: BN	bn,a	<label_0x4>
	.word 0xd4fa1009  ! 304: SWAPA_R	swapa	%r10, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 305: STBAR	stbar
	.word 0xc2b22844  ! 306: STHA_I	stha	%r1, [%r8 + 0x0844] %asi
	.word 0xc8ea2afc  ! 307: LDSTUBA_I	ldstuba	%r4, [%r8 + 0x0afc] %asi
	.word 0x8143c000  ! 308: STBAR	stbar
	.word 0x18800004  ! 309: BGU	bgu  	<label_0x4>
	.word 0x36800004  ! 310: BGE	bge,a	<label_0x4>
	.word 0xcaaa1009  ! 311: STBA_R	stba	%r5, [%r8 + %r9] 0x80
	.word 0x97a20829  ! 312: FADDs	fadds	%f8, %f9, %f11
	.word 0x864a0009  ! 313: MULX_R	mulx 	%r8, %r9, %r3
	.word 0xc8921009  ! 314: LDUHA_R	lduha	[%r8, %r9] 0x80, %r4
	.word 0x85a20929  ! 315: FMULs	fmuls	%f8, %f9, %f2
	.word 0xeff22009  ! 316: CASXA_R	casxa	[%r8]%asi, %r9, %r23
	.word 0x836a27c8  ! 317: SDIVX_I	sdivx	%r8, 0x07c8, %r1
	.word 0xc5222328  ! 318: STF_I	st	%f2, [0x0328, %r8]
	.word 0xcb220009  ! 319: STF_R	st	%f5, [%r9, %r8]
	.word 0xf89a1009  ! 320: LDDA_R	ldda	[%r8, %r9] 0x80, %r28
	.word 0xcd222bf0  ! 321: STF_I	st	%f6, [0x0bf0, %r8]
	.word 0xceda1009  ! 322: LDXA_R	ldxa	[%r8, %r9] 0x80, %r7
	.word 0xc36a2a24  ! 323: PREFETCH_I	prefetch	[%r8 + 0x0a24], #one_read
	.word 0xccfa1009  ! 324: SWAPA_R	swapa	%r6, [%r8 + %r9] 0x80
	.word 0xf85a2348  ! 325: LDX_I	ldx	[%r8 + 0x0348], %r28
	.word 0xc6da2fd8  ! 326: LDXA_I	ldxa	[%r8, + 0x0fd8] %asi, %r3
	.word 0xf67a2510  ! 327: SWAP_I	swap	%r27, [%r8 + 0x0510]
	.word 0x82522a9c  ! 328: UMUL_I	umul 	%r8, 0x0a9c, %r1
	.word 0xe4ba1009  ! 329: STDA_R	stda	%r18, [%r8 + %r9] 0x80
	.word 0xc89a2680  ! 330: LDDA_I	ldda	[%r8, + 0x0680] %asi, %r4
	.word 0x3a800004  ! 331: BCC	bcc,a	<label_0x4>
	.word 0xc9f21009  ! 332: CASXA_I	casxa	[%r8] 0x80, %r9, %r4
	.word 0xceea1009  ! 333: LDSTUBA_R	ldstuba	%r7, [%r8 + %r9] 0x80
	.word 0x22c20004  ! 334: BRZ	brz,a,nt	%8,<label_0x20004>
	.word 0xab6a2d50  ! 335: SDIVX_I	sdivx	%r8, 0x0d50, %r21
	.word 0xd4a21009  ! 336: STWA_R	stwa	%r10, [%r8 + %r9] 0x80
	.word 0xf2d21009  ! 337: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r25
	.word 0xcf3a0009  ! 338: STDF_R	std	%f7, [%r9, %r8]
	.word 0x8143e05f  ! 339: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0xc3f22009  ! 340: CASXA_R	casxa	[%r8]%asi, %r9, %r1
	.word 0xe4ba1009  ! 341: STDA_R	stda	%r18, [%r8 + %r9] 0x80
	.word 0x856a2e68  ! 342: SDIVX_I	sdivx	%r8, 0x0e68, %r2
	.word 0xbef226f8  ! 343: UDIVcc_I	udivcc 	%r8, 0x06f8, %r31
	.word 0xc8520009  ! 344: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xfcba2850  ! 345: STDA_I	stda	%r30, [%r8 + 0x0850] %asi
	.word 0x86522938  ! 346: UMUL_I	umul 	%r8, 0x0938, %r3
	.word 0x8ef228c4  ! 347: UDIVcc_I	udivcc 	%r8, 0x08c4, %r7
	.word 0xfcaa1009  ! 348: STBA_R	stba	%r30, [%r8 + %r9] 0x80
	.word 0xa52220d4  ! 349: MULScc_I	mulscc 	%r8, 0x00d4, %r18
	.word 0xf44a2c18  ! 350: LDSB_I	ldsb	[%r8 + 0x0c18], %r26
	.word 0xafa208a9  ! 351: FSUBs	fsubs	%f8, %f9, %f23
	.word 0xca022e78  ! 352: LDUW_I	lduw	[%r8 + 0x0e78], %r5
	.word 0xcf3a2828  ! 353: STDF_I	std	%f7, [0x0828, %r8]
	.word 0xc36a2dbc  ! 354: PREFETCH_I	prefetch	[%r8 + 0x0dbc], #one_read
	.word 0xf07a29b4  ! 355: SWAP_I	swap	%r24, [%r8 + 0x09b4]
	.word 0xd89a28d0  ! 356: LDDA_I	ldda	[%r8, + 0x08d0] %asi, %r12
	.word 0xcc12245c  ! 357: LDUH_I	lduh	[%r8 + 0x045c], %r6
	.word 0xc6020009  ! 358: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xc4aa1009  ! 359: STBA_R	stba	%r2, [%r8 + %r9] 0x80
	.word 0xdcba2c40  ! 360: STDA_I	stda	%r14, [%r8 + 0x0c40] %asi
	.word 0xea1225f0  ! 361: LDUH_I	lduh	[%r8 + 0x05f0], %r21
	.word 0x8cfa0009  ! 362: SDIVcc_R	sdivcc 	%r8, %r9, %r6
	.word 0x83a209a9  ! 363: FDIVs	fdivs	%f8, %f9, %f1
	.word 0xac6a2b2c  ! 364: UDIVX_I	udivx 	%r8, 0x0b2c, %r22
	.word 0x88720009  ! 366: UDIV_R	udiv 	%r8, %r9, %r4
	.word 0xce822b2c  ! 367: LDUWA_I	lduwa	[%r8, + 0x0b2c] %asi, %r7
	.word 0x06ca0004  ! 368: BRLZ	brlz  ,pt	%8,<label_0xa0004>
	.word 0xa2f221fc  ! 369: UDIVcc_I	udivcc 	%r8, 0x01fc, %r17
	.word 0x8ad20009  ! 370: UMULcc_R	umulcc 	%r8, %r9, %r5
	.word 0x8b6a0009  ! 371: SDIVX_R	sdivx	%r8, %r9, %r5
	.word 0x2aca0004  ! 372: BRNZ	brnz,a,pt	%8,<label_0xa0004>
	.word 0x8c720009  ! 373: UDIV_R	udiv 	%r8, %r9, %r6
	.word 0xc9220009  ! 374: STF_R	st	%f4, [%r9, %r8]
	.word 0xe09a1009  ! 375: LDDA_R	ldda	[%r8, %r9] 0x80, %r16
	.word 0xf33a0009  ! 376: STDF_R	std	%f25, [%r9, %r8]
	.word 0x83a20829  ! 377: FADDs	fadds	%f8, %f9, %f1
	.word 0x8ba209a9  ! 378: FDIVs	fdivs	%f8, %f9, %f5
	.word 0x1a800004  ! 379: BCC	bcc  	<label_0x4>
	.word 0xcaaa248c  ! 380: STBA_I	stba	%r5, [%r8 + 0x048c] %asi
	.word 0xbcd223b0  ! 381: UMULcc_I	umulcc 	%r8, 0x03b0, %r30
	.word 0x8c6a20a0  ! 382: UDIVX_I	udivx 	%r8, 0x00a0, %r6
	.word 0x8143e00d  ! 383: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore 
	.word 0x89a20929  ! 384: FMULs	fmuls	%f8, %f9, %f4
	.word 0x02800004  ! 385: BE	be  	<label_0x4>
	.word 0x30800008  ! 386: BA	ba,a	<label_0x8>
	.word 0xce120009  ! 387: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0x825a2358  ! 388: SMUL_I	smul 	%r8, 0x0358, %r1
	.word 0xc3ea21f4  ! 389: PREFETCHA_I	prefetcha	[%r8, + 0x01f4] %asi, #one_read
	.word 0xb4f2270c  ! 390: UDIVcc_I	udivcc 	%r8, 0x070c, %r26
	.word 0x0a800004  ! 391: BCS	bcs  	<label_0x4>
	.word 0x8143e017  ! 392: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside 
	.word 0xc4420009  ! 393: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0x20800004  ! 394: BN	bn,a	<label_0x4>
	.word 0x99222e10  ! 396: MULScc_I	mulscc 	%r8, 0x0e10, %r12
	.word 0x83a208a9  ! 397: FSUBs	fsubs	%f8, %f9, %f1
	.word 0xe89a24f0  ! 398: LDDA_I	ldda	[%r8, + 0x04f0] %asi, %r20
	.word 0x8472259c  ! 399: UDIV_I	udiv 	%r8, 0x059c, %r2
	.word 0x8143c000  ! 400: STBAR	stbar
	.word 0xfbf21009  ! 401: CASXA_I	casxa	[%r8] 0x80, %r9, %r29
	.word 0xcc1a2fe0  ! 402: LDD_I	ldd	[%r8 + 0x0fe0], %r6
	.word 0x8afa2808  ! 403: SDIVcc_I	sdivcc 	%r8, 0x0808, %r5
	.word 0xc28a1009  ! 404: LDUBA_R	lduba	[%r8, %r9] 0x80, %r1
	.word 0x82fa2bb0  ! 405: SDIVcc_I	sdivcc 	%r8, 0x0bb0, %r1
	.word 0x8143c000  ! 406: STBAR	stbar
	.word 0xc25a0009  ! 407: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xc3ea2ffc  ! 408: PREFETCHA_I	prefetcha	[%r8, + 0x0ffc] %asi, #one_read
	.word 0x8143e009  ! 409: MEMBAR	membar	#LoadLoad | #StoreStore 
	.word 0x8e7220ac  ! 410: UDIV_I	udiv 	%r8, 0x00ac, %r7
	.word 0x86fa29b8  ! 411: SDIVcc_I	sdivcc 	%r8, 0x09b8, %r3
	.word 0xc2922c84  ! 412: LDUHA_I	lduha	[%r8, + 0x0c84] %asi, %r1
	.word 0xba5a2cbc  ! 413: SMUL_I	smul 	%r8, 0x0cbc, %r29
	.word 0x8c6a2270  ! 414: UDIVX_I	udivx 	%r8, 0x0270, %r6
	.word 0xc2921009  ! 415: LDUHA_R	lduha	[%r8, %r9] 0x80, %r1
	.word 0xc6d21009  ! 416: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r3
	.word 0xd6122d38  ! 417: LDUH_I	lduh	[%r8 + 0x0d38], %r11
	.word 0x8143e03f  ! 418: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0xd6da1009  ! 419: LDXA_R	ldxa	[%r8, %r9] 0x80, %r11
	.word 0xcff22009  ! 420: CASXA_R	casxa	[%r8]%asi, %r9, %r7
	.word 0xbe522610  ! 421: UMUL_I	umul 	%r8, 0x0610, %r31
	.word 0xdd220009  ! 422: STF_R	st	%f14, [%r9, %r8]
	.word 0xc2a21009  ! 423: STWA_R	stwa	%r1, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 424: STBAR	stbar
	.word 0x8c7a0009  ! 425: SDIV_R	sdiv 	%r8, %r9, %r6
	.word 0x0a800004  ! 426: BCS	bcs  	<label_0x4>
	.word 0x8143c000  ! 427: STBAR	stbar
	.word 0x9c520009  ! 428: UMUL_R	umul 	%r8, %r9, %r14
	.word 0x8143e052  ! 429: MEMBAR	membar	#StoreLoad | #Lookaside | #Sync 
	.word 0x8143c000  ! 430: STBAR	stbar
	.word 0xb6f22a18  ! 431: UDIVcc_I	udivcc 	%r8, 0x0a18, %r27
	.word 0x00800004  ! 432: BN	bn  	<label_0x4>
	.word 0xc36a2858  ! 433: PREFETCH_I	prefetch	[%r8 + 0x0858], #one_read
	.word 0x8143c000  ! 434: STBAR	stbar
	.word 0x10800004  ! 435: BA	ba  	<label_0x4>
	.word 0xc4ba1009  ! 436: STDA_R	stda	%r2, [%r8 + %r9] 0x80
	.word 0xcc822d74  ! 437: LDUWA_I	lduwa	[%r8, + 0x0d74] %asi, %r6
	.word 0x2c800004  ! 438: BNEG	bneg,a	<label_0x4>
	.word 0xf4fa1009  ! 439: SWAPA_R	swapa	%r26, [%r8 + %r9] 0x80
	.word 0xcbe22009  ! 441: CASA_R	casa	[%r8] %asi, %r9, %r5
	.word 0x9a522cc8  ! 442: UMUL_I	umul 	%r8, 0x0cc8, %r13
	.word 0x8143c000  ! 443: STBAR	stbar
	.word 0xdc9a1009  ! 444: LDDA_R	ldda	[%r8, %r9] 0x80, %r14
	.word 0x40000004  ! 445: CALL	call	disp30_4
	.word 0x8143e02e  ! 446: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #MemIssue 
	.word 0x8143e01e  ! 447: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside 
	.word 0x8143c000  ! 448: STBAR	stbar
	.word 0x8143e05d  ! 449: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0xd8d21009  ! 450: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r12
	.word 0xc3ea2a4c  ! 451: PREFETCHA_I	prefetcha	[%r8, + 0x0a4c] %asi, #one_read
	.word 0xe1220009  ! 452: STF_R	st	%f16, [%r9, %r8]
	.word 0xcada2cc8  ! 453: LDXA_I	ldxa	[%r8, + 0x0cc8] %asi, %r5
	.word 0x8b220009  ! 454: MULScc_R	mulscc 	%r8, %r9, %r5
	.word 0xaefa0009  ! 455: SDIVcc_R	sdivcc 	%r8, %r9, %r23
	.word 0x88da0009  ! 456: SMULcc_R	smulcc 	%r8, %r9, %r4
	.word 0x8143c000  ! 457: STBAR	stbar
	.word 0x8da20929  ! 458: FMULs	fmuls	%f8, %f9, %f6
	.word 0xcc420009  ! 459: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0x84fa2db4  ! 461: SDIVcc_I	sdivcc 	%r8, 0x0db4, %r2
	.word 0xce520009  ! 462: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xee822a00  ! 463: LDUWA_I	lduwa	[%r8, + 0x0a00] %asi, %r23
	.word 0x8143e014  ! 464: MEMBAR	membar	#LoadStore | #Lookaside 
	.word 0x8ba209a9  ! 465: FDIVs	fdivs	%f8, %f9, %f5
	.word 0xca921009  ! 466: LDUHA_R	lduha	[%r8, %r9] 0x80, %r5
	.word 0x86720009  ! 467: UDIV_R	udiv 	%r8, %r9, %r3
	.word 0xf1f21009  ! 468: CASXA_I	casxa	[%r8] 0x80, %r9, %r24
	.word 0x84fa0009  ! 469: SDIVcc_R	sdivcc 	%r8, %r9, %r2
	.word 0x8afa0009  ! 470: SDIVcc_R	sdivcc 	%r8, %r9, %r5
	.word 0xcf3a2f98  ! 471: STDF_I	std	%f7, [0x0f98, %r8]
	.word 0x8143c000  ! 472: STBAR	stbar
	.word 0x2c800008  ! 473: BNEG	bneg,a	<label_0x8>
	.word 0x04ca0004  ! 474: BRLEZ	brlez  ,pt	%8,<label_0xa0004>
	.word 0xcde22009  ! 475: CASA_R	casa	[%r8] %asi, %r9, %r6
	.word 0x8143e058  ! 476: MEMBAR	membar	#StoreStore | #Lookaside | #Sync 
	.word 0x8143e06f  ! 477: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #MemIssue | #Sync 
	.word 0xf9e21009  ! 478: CASA_I	casa	[%r8] 0x80, %r9, %r28
	.word 0x04ca0004  ! 479: BRLEZ	brlez  ,pt	%8,<label_0xa0004>
	.word 0xcc422d10  ! 480: LDSW_I	ldsw	[%r8 + 0x0d10], %r6
	.word 0xc3ea2304  ! 481: PREFETCHA_I	prefetcha	[%r8, + 0x0304] %asi, #one_read
	.word 0x8143e064  ! 482: MEMBAR	membar	#LoadStore | #MemIssue | #Sync 
	.word 0xbb222c80  ! 483: MULScc_I	mulscc 	%r8, 0x0c80, %r29
	.word 0xfcba2d78  ! 484: STDA_I	stda	%r30, [%r8 + 0x0d78] %asi
	.word 0x8143e019  ! 485: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside 
	.word 0xca6a0009  ! 486: LDSTUB_R	ldstub	%r5, [%r8 + %r9]
	.word 0x2a800004  ! 487: BCS	bcs,a	<label_0x4>
	.word 0x8143c000  ! 488: STBAR	stbar
	.word 0x8143c000  ! 489: STBAR	stbar
	.word 0xc60a2754  ! 490: LDUB_I	ldub	[%r8 + 0x0754], %r3
	.word 0xde7a0009  ! 491: SWAP_R	swap	%r15, [%r8 + %r9]
	.word 0xf6ea1009  ! 492: LDSTUBA_R	ldstuba	%r27, [%r8 + %r9] 0x80
	.word 0xccaa1009  ! 493: STBA_R	stba	%r6, [%r8 + %r9] 0x80
	.word 0x8143e02a  ! 494: MEMBAR	membar	#StoreLoad | #StoreStore | #MemIssue 
	.word 0xeeaa1009  ! 495: STBA_R	stba	%r23, [%r8 + %r9] 0x80
	.word 0xb2720009  ! 496: UDIV_R	udiv 	%r8, %r9, %r25
	.word 0x12800004  ! 497: BNE	bne  	<label_0x4>
	.word 0xc36a2bc8  ! 498: PREFETCH_I	prefetch	[%r8 + 0x0bc8], #one_read
	.word 0x88da0009  ! 499: SMULcc_R	smulcc 	%r8, %r9, %r4
	.word 0xca8a1009  ! 500: LDUBA_R	lduba	[%r8, %r9] 0x80, %r5
	.word 0x8143e045  ! 501: MEMBAR	membar	#LoadLoad | #LoadStore | #Sync 
	.word 0xca822084  ! 502: LDUWA_I	lduwa	[%r8, + 0x0084] %asi, %r5
	.word 0x04800008  ! 503: BLE	ble  	<label_0x8>
	.word 0xe6f22be0  ! 504: STXA_I	stxa	%r19, [%r8 + 0x0be0] %asi
	.word 0xcb220009  ! 505: STF_R	st	%f5, [%r9, %r8]
	.word 0x8fa209a9  ! 506: FDIVs	fdivs	%f8, %f9, %f7
	.word 0xcc5a0009  ! 507: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xaada0009  ! 508: SMULcc_R	smulcc 	%r8, %r9, %r21
	.word 0xc212278c  ! 509: LDUH_I	lduh	[%r8 + 0x078c], %r1
	.word 0xcb2229cc  ! 510: STF_I	st	%f5, [0x09cc, %r8]
	.word 0xca020009  ! 511: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xce7a2e6c  ! 512: SWAP_I	swap	%r7, [%r8 + 0x0e6c]
	.word 0xc3ea2544  ! 513: PREFETCHA_I	prefetcha	[%r8, + 0x0544] %asi, #one_read
	.word 0xc4ca28c8  ! 514: LDSBA_I	ldsba	[%r8, + 0x08c8] %asi, %r2
	.word 0x8c4a0009  ! 515: MULX_R	mulx 	%r8, %r9, %r6
	.word 0xcada2798  ! 516: LDXA_I	ldxa	[%r8, + 0x0798] %asi, %r5
	.word 0xb7a20829  ! 517: FADDs	fadds	%f8, %f9, %f27
	.word 0xed22256c  ! 518: STF_I	st	%f22, [0x056c, %r8]
	.word 0xba5a0009  ! 519: SMUL_R	smul 	%r8, %r9, %r29
	.word 0xc6ea1009  ! 520: LDSTUBA_R	ldstuba	%r3, [%r8 + %r9] 0x80
	.word 0xca5a2748  ! 521: LDX_I	ldx	[%r8 + 0x0748], %r5
	.word 0xdd3a0009  ! 522: STDF_R	std	%f14, [%r9, %r8]
	.word 0x8143e060  ! 523: MEMBAR	membar	#MemIssue | #Sync 
	.word 0x86f20009  ! 524: UDIVcc_R	udivcc 	%r8, %r9, %r3
	.word 0xcc6a0009  ! 525: LDSTUB_R	ldstub	%r6, [%r8 + %r9]
	.word 0x896a2240  ! 526: SDIVX_I	sdivx	%r8, 0x0240, %r4
	.word 0xc3222098  ! 527: STF_I	st	%f1, [0x0098, %r8]
	.word 0xfeaa1009  ! 528: STBA_R	stba	%r31, [%r8 + %r9] 0x80
	.word 0xcbf21009  ! 529: CASXA_I	casxa	[%r8] 0x80, %r9, %r5
	.word 0x30800004  ! 530: BA	ba,a	<label_0x4>
	.word 0x8143e051  ! 531: MEMBAR	membar	#LoadLoad | #Lookaside | #Sync 
	.word 0x86520009  ! 532: UMUL_R	umul 	%r8, %r9, %r3
	.word 0xf6aa281c  ! 533: STBA_I	stba	%r27, [%r8 + 0x081c] %asi
	.word 0xa8d20009  ! 534: UMULcc_R	umulcc 	%r8, %r9, %r20
	.word 0x8143c000  ! 535: STBAR	stbar
	.word 0xcc5a0009  ! 536: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xfeaa25f0  ! 537: STBA_I	stba	%r31, [%r8 + 0x05f0] %asi
	.word 0xc2a21009  ! 538: STWA_R	stwa	%r1, [%r8 + %r9] 0x80
	.word 0xe8b225a4  ! 539: STHA_I	stha	%r20, [%r8 + 0x05a4] %asi
	.word 0x2aca0004  ! 540: BRNZ	brnz,a,pt	%8,<label_0xa0004>
	.word 0x8143e038  ! 541: MEMBAR	membar	#StoreStore | #Lookaside | #MemIssue 
	.word 0xb3a208a9  ! 542: FSUBs	fsubs	%f8, %f9, %f25
	.word 0x2ec20008  ! 543: BRGEZ	brgez,a,nt	%8,<label_0x20008>
	.word 0xe4520009  ! 544: LDSH_R	ldsh	[%r8 + %r9], %r18
	.word 0xc47a0009  ! 545: SWAP_R	swap	%r2, [%r8 + %r9]
	.word 0xc8fa20a4  ! 546: SWAPA_I	swapa	%r4, [%r8 + 0x00a4] %asi
	.word 0xda7a2c08  ! 547: SWAP_I	swap	%r13, [%r8 + 0x0c08]
	.word 0xc36a25b0  ! 548: PREFETCH_I	prefetch	[%r8 + 0x05b0], #one_read
	.word 0xcc0221c8  ! 549: LDUW_I	lduw	[%r8 + 0x01c8], %r6
	.word 0x88d20009  ! 550: UMULcc_R	umulcc 	%r8, %r9, %r4
	.word 0xcaea2eb0  ! 551: LDSTUBA_I	ldstuba	%r5, [%r8 + 0x0eb0] %asi
	.word 0x8143e07c  ! 552: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0x8143e07b  ! 553: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0x8143c000  ! 554: STBAR	stbar
	.word 0x887a0009  ! 555: SDIV_R	sdiv 	%r8, %r9, %r4
	.word 0xce6a26e0  ! 556: LDSTUB_I	ldstub	%r7, [%r8 + 0x06e0]
	.word 0x00800008  ! 557: BN	bn  	<label_0x8>
	.word 0x8143c000  ! 558: STBAR	stbar
	.word 0x24800004  ! 559: BLE	ble,a	<label_0x4>
	.word 0xf40a2354  ! 560: LDUB_I	ldub	[%r8 + 0x0354], %r26
	.word 0x8143e03d  ! 561: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0xc3e22009  ! 562: CASA_R	casa	[%r8] %asi, %r9, %r1
	.word 0x88f20009  ! 563: UDIVcc_R	udivcc 	%r8, %r9, %r4
	.word 0xa76a0009  ! 564: SDIVX_R	sdivx	%r8, %r9, %r19
	.word 0xc36a2a14  ! 565: PREFETCH_I	prefetch	[%r8 + 0x0a14], #one_read
	.word 0xcaf21009  ! 566: STXA_R	stxa	%r5, [%r8 + %r9] 0x80
	.word 0xf28a1009  ! 567: LDUBA_R	lduba	[%r8, %r9] 0x80, %r25
	.word 0xbe522c44  ! 569: UMUL_I	umul 	%r8, 0x0c44, %r31
	.word 0xc52225f8  ! 570: STF_I	st	%f2, [0x05f8, %r8]
	.word 0xccd22d1c  ! 571: LDSHA_I	ldsha	[%r8, + 0x0d1c] %asi, %r6
	.word 0xa46a2b74  ! 572: UDIVX_I	udivx 	%r8, 0x0b74, %r18
	.word 0xe41a0009  ! 573: LDD_R	ldd	[%r8 + %r9], %r18
	.word 0xfc92280c  ! 574: LDUHA_I	lduha	[%r8, + 0x080c] %asi, %r30
	.word 0xfcfa1009  ! 575: SWAPA_R	swapa	%r30, [%r8 + %r9] 0x80
	.word 0xcc4a0009  ! 576: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0x8143e03c  ! 577: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0xc3ea2898  ! 578: PREFETCHA_I	prefetcha	[%r8, + 0x0898] %asi, #one_read
	.word 0xf66a0009  ! 579: LDSTUB_R	ldstub	%r27, [%r8 + %r9]
	.word 0xf68a1009  ! 581: LDUBA_R	lduba	[%r8, %r9] 0x80, %r27
	.word 0x0c800008  ! 582: BNEG	bneg  	<label_0x8>
	.word 0xc8b21009  ! 583: STHA_R	stha	%r4, [%r8 + %r9] 0x80
	.word 0x8d220009  ! 584: MULScc_R	mulscc 	%r8, %r9, %r6
	.word 0x884a0009  ! 585: MULX_R	mulx 	%r8, %r9, %r4
	.word 0xbfa20829  ! 586: FADDs	fadds	%f8, %f9, %f31
	.word 0x8143e04b  ! 587: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Sync 
	.word 0x8143e043  ! 588: MEMBAR	membar	#LoadLoad | #StoreLoad | #Sync 
	.word 0x8143e05c  ! 589: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0xa86a0009  ! 590: UDIVX_R	udivx 	%r8, %r9, %r20
	.word 0xc36a29e8  ! 591: PREFETCH_I	prefetch	[%r8 + 0x09e8], #one_read
	.word 0x20800008  ! 592: BN	bn,a	<label_0x8>
	.word 0x0eca0004  ! 594: BRGEZ	brgez  ,pt	%8,<label_0xa0004>
	.word 0xf4f22028  ! 595: STXA_I	stxa	%r26, [%r8 + 0x0028] %asi
	.word 0x8143e06a  ! 597: MEMBAR	membar	#StoreLoad | #StoreStore | #MemIssue | #Sync 
	.word 0xcde21009  ! 599: CASA_I	casa	[%r8] 0x80, %r9, %r6
	.word 0xf4a2271c  ! 600: STWA_I	stwa	%r26, [%r8 + 0x071c] %asi
	.word 0x8a4a2678  ! 601: MULX_I	mulx 	%r8, 0x0678, %r5
	.word 0x866a0009  ! 602: UDIVX_R	udivx 	%r8, %r9, %r3
	.word 0xc8c22590  ! 603: LDSWA_I	ldswa	[%r8, + 0x0590] %asi, %r4
	.word 0xe6821009  ! 604: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r19
	.word 0x36800008  ! 605: BGE	bge,a	<label_0x8>
	.word 0xb0d20009  ! 606: UMULcc_R	umulcc 	%r8, %r9, %r24
	.word 0x8e522cd4  ! 607: UMUL_I	umul 	%r8, 0x0cd4, %r7
	.word 0xe0f21009  ! 608: STXA_R	stxa	%r16, [%r8 + %r9] 0x80
	.word 0xc3ea2448  ! 609: PREFETCHA_I	prefetcha	[%r8, + 0x0448] %asi, #one_read
	.word 0xa47a2558  ! 610: SDIV_I	sdiv 	%r8, 0x0558, %r18
	.word 0x0a800004  ! 611: BCS	bcs  	<label_0x4>
	.word 0xce4a2ad8  ! 612: LDSB_I	ldsb	[%r8 + 0x0ad8], %r7
	.word 0xc4f226c8  ! 613: STXA_I	stxa	%r2, [%r8 + 0x06c8] %asi
	.word 0x85a20829  ! 614: FADDs	fadds	%f8, %f9, %f2
	.word 0xd8f22a48  ! 615: STXA_I	stxa	%r12, [%r8 + 0x0a48] %asi
	.word 0xfd3a2130  ! 616: STDF_I	std	%f30, [0x0130, %r8]
	.word 0xe8da1009  ! 618: LDXA_R	ldxa	[%r8, %r9] 0x80, %r20
	.word 0xc9222b2c  ! 619: STF_I	st	%f4, [0x0b2c, %r8]
	.word 0xfc020009  ! 620: LDUW_R	lduw	[%r8 + %r9], %r30
	.word 0xa7a20829  ! 621: FADDs	fadds	%f8, %f9, %f19
	.word 0x08800004  ! 622: BLEU	bleu  	<label_0x4>
	.word 0xc36a23b0  ! 623: PREFETCH_I	prefetch	[%r8 + 0x03b0], #one_read
	.word 0x88722564  ! 624: UDIV_I	udiv 	%r8, 0x0564, %r4
	.word 0x82f20009  ! 625: UDIVcc_R	udivcc 	%r8, %r9, %r1
	.word 0x84720009  ! 626: UDIV_R	udiv 	%r8, %r9, %r2
	.word 0x8143c000  ! 627: STBAR	stbar
	.word 0xb6fa0009  ! 628: SDIVcc_R	sdivcc 	%r8, %r9, %r27
	.word 0xc8420009  ! 629: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0x8143e005  ! 630: MEMBAR	membar	#LoadLoad | #LoadStore 
	.word 0x22ca0004  ! 631: BRZ	brz,a,pt	%8,<label_0xa0004>
	.word 0xf21221b0  ! 632: LDUH_I	lduh	[%r8 + 0x01b0], %r25
	.word 0xceaa1009  ! 633: STBA_R	stba	%r7, [%r8 + %r9] 0x80
	.word 0xc65a0009  ! 634: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xc36a2198  ! 635: PREFETCH_I	prefetch	[%r8 + 0x0198], #one_read
	.word 0x8143c000  ! 636: STBAR	stbar
	.word 0xa76a0009  ! 637: SDIVX_R	sdivx	%r8, %r9, %r19
	.word 0x8af228d8  ! 638: UDIVcc_I	udivcc 	%r8, 0x08d8, %r5
	.word 0xcb3a0009  ! 639: STDF_R	std	%f5, [%r9, %r8]
	.word 0xc41a27b0  ! 640: LDD_I	ldd	[%r8 + 0x07b0], %r2
	.word 0x846a0009  ! 641: UDIVX_R	udivx 	%r8, %r9, %r2
	.word 0x8143c000  ! 642: STBAR	stbar
	.word 0xc24a2cc8  ! 643: LDSB_I	ldsb	[%r8 + 0x0cc8], %r1
	.word 0xb3222d58  ! 644: MULScc_I	mulscc 	%r8, 0x0d58, %r25
	.word 0x08800004  ! 645: BLEU	bleu  	<label_0x4>
	.word 0x8a7a26c0  ! 647: SDIV_I	sdiv 	%r8, 0x06c0, %r5
	.word 0xcc921009  ! 648: LDUHA_R	lduha	[%r8, %r9] 0x80, %r6
	.word 0x8fa20929  ! 649: FMULs	fmuls	%f8, %f9, %f7
	.word 0xfc0a0009  ! 650: LDUB_R	ldub	[%r8 + %r9], %r30
	.word 0xe8ba2c60  ! 651: STDA_I	stda	%r20, [%r8 + 0x0c60] %asi
	.word 0xa5a209a9  ! 652: FDIVs	fdivs	%f8, %f9, %f18
	.word 0x0e800008  ! 653: BVS	bvs  	<label_0x8>
	.word 0xf04a0009  ! 654: LDSB_R	ldsb	[%r8 + %r9], %r24
	.word 0x8143e029  ! 655: MEMBAR	membar	#LoadLoad | #StoreStore | #MemIssue 
	.word 0x8143c000  ! 656: STBAR	stbar
	.word 0xa24a20fc  ! 657: MULX_I	mulx 	%r8, 0x00fc, %r17
	.word 0xce4a2d38  ! 658: LDSB_I	ldsb	[%r8 + 0x0d38], %r7
	.word 0xccf21009  ! 659: STXA_R	stxa	%r6, [%r8 + %r9] 0x80
	.word 0xcbf22009  ! 660: CASXA_R	casxa	[%r8]%asi, %r9, %r5
	.word 0xfec21009  ! 661: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r31
	.word 0xc36a2708  ! 662: PREFETCH_I	prefetch	[%r8 + 0x0708], #one_read
	.word 0xc2da1009  ! 663: LDXA_R	ldxa	[%r8, %r9] 0x80, %r1
	.word 0xc3220009  ! 665: STF_R	st	%f1, [%r9, %r8]
	.word 0xcaaa1009  ! 666: STBA_R	stba	%r5, [%r8 + %r9] 0x80
	.word 0xfbf22009  ! 667: CASXA_R	casxa	[%r8]%asi, %r9, %r29
	.word 0xc3f22009  ! 668: CASXA_R	casxa	[%r8]%asi, %r9, %r1
	.word 0xc85a0009  ! 669: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xc8fa1009  ! 670: SWAPA_R	swapa	%r4, [%r8 + %r9] 0x80
	.word 0x8e522ed8  ! 671: UMUL_I	umul 	%r8, 0x0ed8, %r7
	.word 0xe8f21009  ! 672: STXA_R	stxa	%r20, [%r8 + %r9] 0x80
	.word 0x827a26c8  ! 673: SDIV_I	sdiv 	%r8, 0x06c8, %r1
	.word 0xc6fa1009  ! 674: SWAPA_R	swapa	%r3, [%r8 + %r9] 0x80
	.word 0xc6520009  ! 675: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0x8c720009  ! 676: UDIV_R	udiv 	%r8, %r9, %r6
	.word 0xccea2e3c  ! 677: LDSTUBA_I	ldstuba	%r6, [%r8 + 0x0e3c] %asi
	.word 0x8143e046  ! 678: MEMBAR	membar	#StoreLoad | #LoadStore | #Sync 
	.word 0xc24223e0  ! 679: LDSW_I	ldsw	[%r8 + 0x03e0], %r1
	.word 0xc81a2340  ! 680: LDD_I	ldd	[%r8 + 0x0340], %r4
	.word 0x8143e057  ! 681: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside | #Sync 
	.word 0xc6d21009  ! 682: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r3
	.word 0xc60a26f8  ! 683: LDUB_I	ldub	[%r8 + 0x06f8], %r3
	.word 0xc3ea2e88  ! 684: PREFETCHA_I	prefetcha	[%r8, + 0x0e88] %asi, #one_read
	.word 0xceaa2cc0  ! 685: STBA_I	stba	%r7, [%r8 + 0x0cc0] %asi
	.word 0x0e800004  ! 686: BVS	bvs  	<label_0x4>
	.word 0x84da0009  ! 687: SMULcc_R	smulcc 	%r8, %r9, %r2
	.word 0xce6a27d0  ! 688: LDSTUB_I	ldstub	%r7, [%r8 + 0x07d0]
	.word 0xdafa1009  ! 689: SWAPA_R	swapa	%r13, [%r8 + %r9] 0x80
	.word 0x846a2ad8  ! 690: UDIVX_I	udivx 	%r8, 0x0ad8, %r2
	.word 0xccaa1009  ! 691: STBA_R	stba	%r6, [%r8 + %r9] 0x80
	.word 0xb76a2aa0  ! 692: SDIVX_I	sdivx	%r8, 0x0aa0, %r27
	.word 0xd85221d0  ! 693: LDSH_I	ldsh	[%r8 + 0x01d0], %r12
	.word 0x8143c000  ! 694: STBAR	stbar
	.word 0x85a208a9  ! 695: FSUBs	fsubs	%f8, %f9, %f2
	.word 0x8143c000  ! 696: STBAR	stbar
	.word 0xc4921009  ! 697: LDUHA_R	lduha	[%r8, %r9] 0x80, %r2
	.word 0x8c4a2504  ! 698: MULX_I	mulx 	%r8, 0x0504, %r6
	.word 0xfaa22a48  ! 699: STWA_I	stwa	%r29, [%r8 + 0x0a48] %asi
	.word 0x89a208a9  ! 700: FSUBs	fsubs	%f8, %f9, %f4
	.word 0xc68a2bf4  ! 701: LDUBA_I	lduba	[%r8, + 0x0bf4] %asi, %r3
	.word 0xceb22874  ! 702: STHA_I	stha	%r7, [%r8 + 0x0874] %asi
	.word 0xbada0009  ! 703: SMULcc_R	smulcc 	%r8, %r9, %r29
	.word 0xcf3a2690  ! 704: STDF_I	std	%f7, [0x0690, %r8]
	.word 0xfcb21009  ! 705: STHA_R	stha	%r30, [%r8 + %r9] 0x80
	.word 0xc3ea2300  ! 706: PREFETCHA_I	prefetcha	[%r8, + 0x0300] %asi, #one_read
	.word 0x8c6a2730  ! 707: UDIVX_I	udivx 	%r8, 0x0730, %r6
	.word 0xbf6a2c64  ! 708: SDIVX_I	sdivx	%r8, 0x0c64, %r31
	.word 0x8143c000  ! 709: STBAR	stbar
	.word 0x8a5a0009  ! 710: SMUL_R	smul 	%r8, %r9, %r5
	.word 0x06800004  ! 711: BL	bl  	<label_0x4>
	.word 0x8143c000  ! 712: STBAR	stbar
	.word 0x845a2c88  ! 713: SMUL_I	smul 	%r8, 0x0c88, %r2
	.word 0xcc4a2dec  ! 714: LDSB_I	ldsb	[%r8 + 0x0dec], %r6
	.word 0x8143e069  ! 715: MEMBAR	membar	#LoadLoad | #StoreStore | #MemIssue | #Sync 
	.word 0xc6f22828  ! 716: STXA_I	stxa	%r3, [%r8 + 0x0828] %asi
	.word 0x89a20929  ! 717: FMULs	fmuls	%f8, %f9, %f4
	.word 0xcc020009  ! 718: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xdaf21009  ! 719: STXA_R	stxa	%r13, [%r8 + %r9] 0x80
	.word 0xce8228c4  ! 720: LDUWA_I	lduwa	[%r8, + 0x08c4] %asi, %r7
	.word 0xafa20829  ! 721: FADDs	fadds	%f8, %f9, %f23
	.word 0xc6ca1009  ! 722: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r3
	.word 0xc2b21009  ! 723: STHA_R	stha	%r1, [%r8 + %r9] 0x80
	.word 0x04c20008  ! 724: BRLEZ	brlez  ,nt	%8,<label_0x20008>
	.word 0xa2fa0009  ! 725: SDIVcc_R	sdivcc 	%r8, %r9, %r17
	.word 0xaf6a2c8c  ! 726: SDIVX_I	sdivx	%r8, 0x0c8c, %r23
	.word 0x22c20004  ! 727: BRZ	brz,a,nt	%8,<label_0x20004>
	.word 0x2e800004  ! 728: BVS	bvs,a	<label_0x4>
	.word 0xcbe21009  ! 729: CASA_I	casa	[%r8] 0x80, %r9, %r5
	.word 0x8f6a213c  ! 730: SDIVX_I	sdivx	%r8, 0x013c, %r7
	.word 0x83a20929  ! 731: FMULs	fmuls	%f8, %f9, %f1
	.word 0x0aca0004  ! 732: BRNZ	brnz  ,pt	%8,<label_0xa0004>
	.word 0xc2fa1009  ! 733: SWAPA_R	swapa	%r1, [%r8 + %r9] 0x80
	.word 0xceea277c  ! 734: LDSTUBA_I	ldstuba	%r7, [%r8 + 0x077c] %asi
	.word 0xce120009  ! 735: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xccba1009  ! 736: STDA_R	stda	%r6, [%r8 + %r9] 0x80
	.word 0x96d220dc  ! 737: UMULcc_I	umulcc 	%r8, 0x00dc, %r11
	.word 0xdfe21009  ! 738: CASA_I	casa	[%r8] 0x80, %r9, %r15
	.word 0xecba25a8  ! 739: STDA_I	stda	%r22, [%r8 + 0x05a8] %asi
	.word 0xd8b21009  ! 740: STHA_R	stha	%r12, [%r8 + %r9] 0x80
	.word 0x876a2360  ! 741: SDIVX_I	sdivx	%r8, 0x0360, %r3
	.word 0xc65a0009  ! 742: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0x8e4a0009  ! 743: MULX_R	mulx 	%r8, %r9, %r7
	.word 0xe0422520  ! 744: LDSW_I	ldsw	[%r8 + 0x0520], %r16
	.word 0x847a2dd0  ! 745: SDIV_I	sdiv 	%r8, 0x0dd0, %r2
	.word 0xc36a2918  ! 746: PREFETCH_I	prefetch	[%r8 + 0x0918], #one_read
	.word 0xca522ec8  ! 748: LDSH_I	ldsh	[%r8 + 0x0ec8], %r5
	.word 0xc66a2ff0  ! 749: LDSTUB_I	ldstub	%r3, [%r8 + 0x0ff0]
	.word 0xb8520009  ! 750: UMUL_R	umul 	%r8, %r9, %r28
	.word 0x28800004  ! 751: BLEU	bleu,a	<label_0x4>
	.word 0x8ad20009  ! 752: UMULcc_R	umulcc 	%r8, %r9, %r5
	.word 0x8143c000  ! 753: STBAR	stbar
	.word 0x85a20929  ! 754: FMULs	fmuls	%f8, %f9, %f2
	.word 0x945a0009  ! 755: SMUL_R	smul 	%r8, %r9, %r10
	.word 0xc73a2950  ! 756: STDF_I	std	%f3, [0x0950, %r8]
	.word 0xee0225c4  ! 757: LDUW_I	lduw	[%r8 + 0x05c4], %r23
	.word 0xb3a208a9  ! 758: FSUBs	fsubs	%f8, %f9, %f25
	.word 0xc3ea2928  ! 759: PREFETCHA_I	prefetcha	[%r8, + 0x0928] %asi, #one_read
	.word 0xca420009  ! 760: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xc4c22c04  ! 762: LDSWA_I	ldswa	[%r8, + 0x0c04] %asi, %r2
	.word 0x8143e023  ! 764: MEMBAR	membar	#LoadLoad | #StoreLoad | #MemIssue 
	.word 0xbfa20929  ! 766: FMULs	fmuls	%f8, %f9, %f31
	.word 0x2c800004  ! 767: BNEG	bneg,a	<label_0x4>
	.word 0xc68a1009  ! 769: LDUBA_R	lduba	[%r8, %r9] 0x80, %r3
	.word 0x8143c000  ! 770: STBAR	stbar
	.word 0x8ba209a9  ! 771: FDIVs	fdivs	%f8, %f9, %f5
	.word 0xa44a0009  ! 772: MULX_R	mulx 	%r8, %r9, %r18
	.word 0x8143c000  ! 773: STBAR	stbar
	.word 0xe73a0009  ! 774: STDF_R	std	%f19, [%r9, %r8]
	.word 0xc6020009  ! 775: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0x8143e06f  ! 776: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #MemIssue | #Sync 
	.word 0xc7222948  ! 777: STF_I	st	%f3, [0x0948, %r8]
	.word 0xcbf22009  ! 778: CASXA_R	casxa	[%r8]%asi, %r9, %r5
	.word 0x94722274  ! 779: UDIV_I	udiv 	%r8, 0x0274, %r10
	.word 0x8143c000  ! 780: STBAR	stbar
	.word 0x84d20009  ! 781: UMULcc_R	umulcc 	%r8, %r9, %r2
	.word 0x946a0009  ! 782: UDIVX_R	udivx 	%r8, %r9, %r10
	.word 0xcbf21009  ! 783: CASXA_I	casxa	[%r8] 0x80, %r9, %r5
	.word 0xf09a1009  ! 784: LDDA_R	ldda	[%r8, %r9] 0x80, %r24
	.word 0x8ad22938  ! 785: UMULcc_I	umulcc 	%r8, 0x0938, %r5
	.word 0xe4da1009  ! 786: LDXA_R	ldxa	[%r8, %r9] 0x80, %r18
	.word 0xc3ea2fe0  ! 787: PREFETCHA_I	prefetcha	[%r8, + 0x0fe0] %asi, #one_read
	.word 0xc7e22009  ! 788: CASA_R	casa	[%r8] %asi, %r9, %r3
	.word 0x89a20929  ! 789: FMULs	fmuls	%f8, %f9, %f4
	.word 0xc6b21009  ! 790: STHA_R	stha	%r3, [%r8 + %r9] 0x80
	.word 0xca9220c8  ! 791: LDUHA_I	lduha	[%r8, + 0x00c8] %asi, %r5
	.word 0xb6d22424  ! 792: UMULcc_I	umulcc 	%r8, 0x0424, %r27
	.word 0x8143c000  ! 793: STBAR	stbar
	.word 0xc2b21009  ! 794: STHA_R	stha	%r1, [%r8 + %r9] 0x80
	.word 0xd93a0009  ! 795: STDF_R	std	%f12, [%r9, %r8]
	.word 0xc8d2244c  ! 796: LDSHA_I	ldsha	[%r8, + 0x044c] %asi, %r4
	.word 0xd60a0009  ! 798: LDUB_R	ldub	[%r8 + %r9], %r11
	.word 0xcaea1009  ! 799: LDSTUBA_R	ldstuba	%r5, [%r8 + %r9] 0x80
	.word 0xcc8a2228  ! 800: LDUBA_I	lduba	[%r8, + 0x0228] %asi, %r6
	.word 0xc6c21009  ! 801: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r3
	.word 0x8f6a2458  ! 802: SDIVX_I	sdivx	%r8, 0x0458, %r7
	.word 0xc66a2be0  ! 803: LDSTUB_I	ldstub	%r3, [%r8 + 0x0be0]
	.word 0xc2a21009  ! 804: STWA_R	stwa	%r1, [%r8 + %r9] 0x80
	.word 0xc8da2350  ! 805: LDXA_I	ldxa	[%r8, + 0x0350] %asi, %r4
	.word 0xc36a2f28  ! 806: PREFETCH_I	prefetch	[%r8 + 0x0f28], #one_read
	.word 0x0c800004  ! 807: BNEG	bneg  	<label_0x4>
	.word 0xc53a2898  ! 808: STDF_I	std	%f2, [0x0898, %r8]
	.word 0x8143c000  ! 809: STBAR	stbar
	.word 0x36800004  ! 810: BGE	bge,a	<label_0x4>
	.word 0x86f20009  ! 811: UDIVcc_R	udivcc 	%r8, %r9, %r3
	.word 0xe7222104  ! 812: STF_I	st	%f19, [0x0104, %r8]
	.word 0xc8d21009  ! 813: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r4
	.word 0x8143e057  ! 814: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside | #Sync 
	.word 0x3e800004  ! 815: BVC	bvc,a	<label_0x4>
	.word 0x99a20829  ! 816: FADDs	fadds	%f8, %f9, %f12
	.word 0x8b220009  ! 818: MULScc_R	mulscc 	%r8, %r9, %r5
	.word 0x1c800008  ! 819: BPOS	bpos  	<label_0x8>
	.word 0xce8a2f0c  ! 820: LDUBA_I	lduba	[%r8, + 0x0f0c] %asi, %r7
	.word 0x8143c000  ! 821: STBAR	stbar
	.word 0xbe4a0009  ! 822: MULX_R	mulx 	%r8, %r9, %r31
	.word 0xe84a0009  ! 823: LDSB_R	ldsb	[%r8 + %r9], %r20
	.word 0x896a0009  ! 824: SDIVX_R	sdivx	%r8, %r9, %r4
	.word 0x8143c000  ! 825: STBAR	stbar
	.word 0x0e800008  ! 826: BVS	bvs  	<label_0x8>
	.word 0xfac22898  ! 827: LDSWA_I	ldswa	[%r8, + 0x0898] %asi, %r29
	.word 0xc3ea2548  ! 828: PREFETCHA_I	prefetcha	[%r8, + 0x0548] %asi, #one_read
	.word 0xa96a0009  ! 829: SDIVX_R	sdivx	%r8, %r9, %r20
	.word 0xc4821009  ! 831: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r2
	.word 0x0cca0004  ! 832: BRGZ	brgz  ,pt	%8,<label_0xa0004>
	.word 0xc60a0009  ! 833: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xcaca1009  ! 834: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r5
	.word 0xc2ca1009  ! 835: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r1
	.word 0x8143c000  ! 836: STBAR	stbar
	.word 0xf06a2914  ! 837: LDSTUB_I	ldstub	%r24, [%r8 + 0x0914]
	.word 0xc7220009  ! 838: STF_R	st	%f3, [%r9, %r8]
	.word 0xc2420009  ! 839: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xd6da2950  ! 840: LDXA_I	ldxa	[%r8, + 0x0950] %asi, %r11
	.word 0xc7f21009  ! 841: CASXA_I	casxa	[%r8] 0x80, %r9, %r3
	.word 0x98d20009  ! 842: UMULcc_R	umulcc 	%r8, %r9, %r12
	.word 0xccb21009  ! 843: STHA_R	stha	%r6, [%r8 + %r9] 0x80
	.word 0xc2c22a30  ! 844: LDSWA_I	ldswa	[%r8, + 0x0a30] %asi, %r1
	.word 0x8143e040  ! 845: MEMBAR	membar	#Sync 
	.word 0x8d6a0009  ! 846: SDIVX_R	sdivx	%r8, %r9, %r6
	.word 0x87a20929  ! 847: FMULs	fmuls	%f8, %f9, %f3
	.word 0xcac22eac  ! 848: LDSWA_I	ldswa	[%r8, + 0x0eac] %asi, %r5
	.word 0xc36a2cc0  ! 849: PREFETCH_I	prefetch	[%r8 + 0x0cc0], #one_read
	.word 0x8143c000  ! 850: STBAR	stbar
	.word 0xcd3a0009  ! 851: STDF_R	std	%f6, [%r9, %r8]
	.word 0xcaaa2d6c  ! 852: STBA_I	stba	%r5, [%r8 + 0x0d6c] %asi
	.word 0x846a0009  ! 853: UDIVX_R	udivx 	%r8, %r9, %r2
	.word 0xba5a2150  ! 854: SMUL_I	smul 	%r8, 0x0150, %r29
	.word 0x9ad22c08  ! 855: UMULcc_I	umulcc 	%r8, 0x0c08, %r13
	.word 0xcd2221ac  ! 856: STF_I	st	%f6, [0x01ac, %r8]
	.word 0x887a2488  ! 857: SDIV_I	sdiv 	%r8, 0x0488, %r4
	.word 0x8143c000  ! 858: STBAR	stbar
	.word 0x8143c000  ! 859: STBAR	stbar
	.word 0x22c20004  ! 860: BRZ	brz,a,nt	%8,<label_0x20004>
	.word 0x38800004  ! 861: BGU	bgu,a	<label_0x4>
	.word 0xc73a29d8  ! 862: STDF_I	std	%f3, [0x09d8, %r8]
	.word 0x8ed20009  ! 863: UMULcc_R	umulcc 	%r8, %r9, %r7
	.word 0x8143c000  ! 864: STBAR	stbar
	.word 0xe89a1009  ! 865: LDDA_R	ldda	[%r8, %r9] 0x80, %r20
	.word 0xc4b21009  ! 866: STHA_R	stha	%r2, [%r8 + %r9] 0x80
	.word 0xdc1a0009  ! 867: LDD_R	ldd	[%r8 + %r9], %r14
	.word 0xf3220009  ! 868: STF_R	st	%f25, [%r9, %r8]
	.word 0xf45a0009  ! 869: LDX_R	ldx	[%r8 + %r9], %r26
	.word 0xccda2630  ! 870: LDXA_I	ldxa	[%r8, + 0x0630] %asi, %r6
	.word 0xc36a2e34  ! 871: PREFETCH_I	prefetch	[%r8 + 0x0e34], #one_read
	.word 0x885a21cc  ! 872: SMUL_I	smul 	%r8, 0x01cc, %r4
	.word 0xd6022fc8  ! 873: LDUW_I	lduw	[%r8 + 0x0fc8], %r11
	.word 0xe40a2364  ! 874: LDUB_I	ldub	[%r8 + 0x0364], %r18
	.word 0xcc822f98  ! 875: LDUWA_I	lduwa	[%r8, + 0x0f98] %asi, %r6
	.word 0x827a2c7c  ! 876: SDIV_I	sdiv 	%r8, 0x0c7c, %r1
	.word 0x8a7a2024  ! 877: SDIV_I	sdiv 	%r8, 0x0024, %r5
	.word 0x8143c000  ! 878: STBAR	stbar
	.word 0x8143e068  ! 879: MEMBAR	membar	#StoreStore | #MemIssue | #Sync 
	.word 0x8e52256c  ! 880: UMUL_I	umul 	%r8, 0x056c, %r7
	.word 0x8143e035  ! 881: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside | #MemIssue 
	.word 0x8143c000  ! 882: STBAR	stbar
	.word 0x847224f0  ! 883: UDIV_I	udiv 	%r8, 0x04f0, %r2
	.word 0xf41a0009  ! 884: LDD_R	ldd	[%r8 + %r9], %r26
	.word 0xdf220009  ! 885: STF_R	st	%f15, [%r9, %r8]
	.word 0x8143e056  ! 886: MEMBAR	membar	#StoreLoad | #LoadStore | #Lookaside | #Sync 
	.word 0x825a2aec  ! 887: SMUL_I	smul 	%r8, 0x0aec, %r1
	.word 0xc36a2744  ! 888: PREFETCH_I	prefetch	[%r8 + 0x0744], #one_read
	.word 0xcad21009  ! 890: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r5
	.word 0xeefa294c  ! 891: SWAPA_I	swapa	%r23, [%r8 + 0x094c] %asi
	.word 0xd8ba2848  ! 893: STDA_I	stda	%r12, [%r8 + 0x0848] %asi
	.word 0xc2ea1009  ! 894: LDSTUBA_R	ldstuba	%r1, [%r8 + %r9] 0x80
	.word 0x8143e017  ! 895: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside 
	.word 0xc2420009  ! 896: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xc8022670  ! 897: LDUW_I	lduw	[%r8 + 0x0670], %r4
	.word 0xe88a263c  ! 898: LDUBA_I	lduba	[%r8, + 0x063c] %asi, %r20
	.word 0x85220009  ! 899: MULScc_R	mulscc 	%r8, %r9, %r2
	.word 0x8143e073  ! 900: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside | #MemIssue | #Sync 
	.word 0x0c800008  ! 901: BNEG	bneg  	<label_0x8>
	.word 0xce52230c  ! 902: LDSH_I	ldsh	[%r8 + 0x030c], %r7
	.word 0xf4ca1009  ! 903: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r26
	.word 0xc67a0009  ! 904: SWAP_R	swap	%r3, [%r8 + %r9]
	.word 0x8ed22c94  ! 905: UMULcc_I	umulcc 	%r8, 0x0c94, %r7
	.word 0xc88229f8  ! 906: LDUWA_I	lduwa	[%r8, + 0x09f8] %asi, %r4
	.word 0x2a800008  ! 907: BCS	bcs,a	<label_0x8>
	.word 0x8143c000  ! 908: STBAR	stbar
	.word 0xcf3a0009  ! 909: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc24a2438  ! 910: LDSB_I	ldsb	[%r8 + 0x0438], %r1
	.word 0xcada1009  ! 911: LDXA_R	ldxa	[%r8, %r9] 0x80, %r5
	.word 0xf87a2494  ! 912: SWAP_I	swap	%r28, [%r8 + 0x0494]
	.word 0x8143e001  ! 913: MEMBAR	membar	#LoadLoad 
	.word 0x82d22ef4  ! 914: UMULcc_I	umulcc 	%r8, 0x0ef4, %r1
	.word 0xf80a0009  ! 915: LDUB_R	ldub	[%r8 + %r9], %r28
	.word 0xcaea2484  ! 916: LDSTUBA_I	ldstuba	%r5, [%r8 + 0x0484] %asi
	.word 0xe3f21009  ! 917: CASXA_I	casxa	[%r8] 0x80, %r9, %r17
	.word 0xd66a2944  ! 918: LDSTUB_I	ldstub	%r11, [%r8 + 0x0944]
	.word 0xc3ea2570  ! 919: PREFETCHA_I	prefetcha	[%r8, + 0x0570] %asi, #one_read
	.word 0xef3a0009  ! 920: STDF_R	std	%f23, [%r9, %r8]
	.word 0x8143c000  ! 921: STBAR	stbar
	.word 0xc65a0009  ! 922: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0x04800004  ! 923: BLE	ble  	<label_0x4>
	.word 0xc3222e7c  ! 924: STF_I	st	%f1, [0x0e7c, %r8]
	.word 0xc2fa1009  ! 927: SWAPA_R	swapa	%r1, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 928: STBAR	stbar
	.word 0xe0ba2a98  ! 929: STDA_I	stda	%r16, [%r8 + 0x0a98] %asi
	.word 0xc20a2594  ! 931: LDUB_I	ldub	[%r8 + 0x0594], %r1
	.word 0x8fa208a9  ! 932: FSUBs	fsubs	%f8, %f9, %f7
	.word 0x2aca0004  ! 933: BRNZ	brnz,a,pt	%8,<label_0xa0004>
	.word 0x845a22e0  ! 934: SMUL_I	smul 	%r8, 0x02e0, %r2
	.word 0xe89a1009  ! 935: LDDA_R	ldda	[%r8, %r9] 0x80, %r20
	.word 0x2ec20004  ! 936: BRGEZ	brgez,a,nt	%8,<label_0x20004>
	.word 0x94f2207c  ! 937: UDIVcc_I	udivcc 	%r8, 0x007c, %r10
	.word 0xc36a2ca0  ! 938: PREFETCH_I	prefetch	[%r8 + 0x0ca0], #one_read
	.word 0x40000004  ! 939: CALL	call	disp30_4
	.word 0x89a209a9  ! 940: FDIVs	fdivs	%f8, %f9, %f4
	.word 0x8ba20929  ! 941: FMULs	fmuls	%f8, %f9, %f5
	.word 0xb44a0009  ! 942: MULX_R	mulx 	%r8, %r9, %r26
	.word 0xeb220009  ! 943: STF_R	st	%f21, [%r9, %r8]
	.word 0x8143c000  ! 944: STBAR	stbar
	.word 0x40000004  ! 946: CALL	call	disp30_4
	.word 0xc46a2278  ! 947: LDSTUB_I	ldstub	%r2, [%r8 + 0x0278]
	.word 0xa5220009  ! 949: MULScc_R	mulscc 	%r8, %r9, %r18
	.word 0xc8d21009  ! 950: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r4
	.word 0x2ec20008  ! 951: BRGEZ	brgez,a,nt	%8,<label_0x20008>
	.word 0xa8520009  ! 952: UMUL_R	umul 	%r8, %r9, %r20
	.word 0xc8921009  ! 953: LDUHA_R	lduha	[%r8, %r9] 0x80, %r4
	.word 0x84da2a14  ! 954: SMULcc_I	smulcc 	%r8, 0x0a14, %r2
	.word 0xec9a1009  ! 955: LDDA_R	ldda	[%r8, %r9] 0x80, %r22
	.word 0xc28a2280  ! 956: LDUBA_I	lduba	[%r8, + 0x0280] %asi, %r1
	.word 0xc46a2fc0  ! 957: LDSTUB_I	ldstub	%r2, [%r8 + 0x0fc0]
	.word 0xfcd21009  ! 958: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r30
	.word 0xc93a0009  ! 959: STDF_R	std	%f4, [%r9, %r8]
	.word 0x8cfa0009  ! 960: SDIVcc_R	sdivcc 	%r8, %r9, %r6
	.word 0x83a20929  ! 961: FMULs	fmuls	%f8, %f9, %f1
	.word 0x2ac20008  ! 962: BRNZ	brnz,a,nt	%8,<label_0x20008>
	.word 0xc3ea2a5c  ! 963: PREFETCHA_I	prefetcha	[%r8, + 0x0a5c] %asi, #one_read
	.word 0x84722968  ! 964: UDIV_I	udiv 	%r8, 0x0968, %r2
	.word 0x8143c000  ! 965: STBAR	stbar
	.word 0xc6520009  ! 966: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0x8ba20929  ! 967: FMULs	fmuls	%f8, %f9, %f5
	.word 0x8143c000  ! 968: STBAR	stbar
	.word 0xdde22009  ! 969: CASA_R	casa	[%r8] %asi, %r9, %r14
	.word 0x40000008  ! 970: CALL	call	disp30_8
	.word 0x8efa0009  ! 973: SDIVcc_R	sdivcc 	%r8, %r9, %r7
	.word 0x896a0009  ! 974: SDIVX_R	sdivx	%r8, %r9, %r4
	.word 0xce520009  ! 975: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xc93a0009  ! 976: STDF_R	std	%f4, [%r9, %r8]
	.word 0x867a0009  ! 977: SDIV_R	sdiv 	%r8, %r9, %r3
	.word 0xcd3a2b00  ! 978: STDF_I	std	%f6, [0x0b00, %r8]
	.word 0x8143c000  ! 979: STBAR	stbar
	.word 0xc66a0009  ! 980: LDSTUB_R	ldstub	%r3, [%r8 + %r9]
	.word 0x9fa20929  ! 981: FMULs	fmuls	%f8, %f9, %f15
	.word 0xc36a2d08  ! 982: PREFETCH_I	prefetch	[%r8 + 0x0d08], #one_read
	.word 0xc65a0009  ! 983: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0x88522af0  ! 984: UMUL_I	umul 	%r8, 0x0af0, %r4
	.word 0x04800004  ! 985: BLE	ble  	<label_0x4>
	.word 0xc5f22009  ! 986: CASXA_R	casxa	[%r8]%asi, %r9, %r2
	.word 0xb85223c4  ! 987: UMUL_I	umul 	%r8, 0x03c4, %r28
	.word 0xc41a0009  ! 988: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x04800008  ! 989: BLE	ble  	<label_0x8>
	.word 0xc46a2b5c  ! 990: LDSTUB_I	ldstub	%r2, [%r8 + 0x0b5c]
	.word 0xc48a22c4  ! 991: LDUBA_I	lduba	[%r8, + 0x02c4] %asi, %r2
	.word 0xef220009  ! 992: STF_R	st	%f23, [%r9, %r8]
	.word 0x8143e03c  ! 993: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0xa8d20009  ! 994: UMULcc_R	umulcc 	%r8, %r9, %r20
	.word 0xe88a2c94  ! 995: LDUBA_I	lduba	[%r8, + 0x0c94] %asi, %r20
	.word 0xc8aa2444  ! 996: STBA_I	stba	%r4, [%r8 + 0x0444] %asi
	.word 0x8da209a9  ! 997: FDIVs	fdivs	%f8, %f9, %f6
	.word 0x84f22724  ! 998: UDIVcc_I	udivcc 	%r8, 0x0724, %r2
	.word 0x8143c000  ! 999: STBAR	stbar
        ta      T_GOOD_TRAP

th_main_1:
        setx  MAIN_BASE_DATA_VA, %r1, %r8
        setx  0x00000000000007b0, %g1, %r9
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
        setx  0xd9daa06e0c7457ad, %g1, %r0
        setx  0x4ae97153872ebce3, %g1, %r1
        setx  0x2fd40e5d9598e12b, %g1, %r2
        setx  0x6443ba0a8a370f63, %g1, %r3
        setx  0x129a09cd92d1cc18, %g1, %r4
        setx  0x2faf5c782d36a214, %g1, %r5
        setx  0x86c145267a1f5eaf, %g1, %r6
        setx  0x6bd45c8899f608c0, %g1, %r7
        setx  0x04e79cb66ed06514, %g1, %r10
        setx  0xfe80b4893b8189b4, %g1, %r11
        setx  0x48f149232e11dc76, %g1, %r12
        setx  0xf2fd752936a76260, %g1, %r13
        setx  0xd9584b935ad7b9a8, %g1, %r14
        setx  0x5e49a0dae10799ec, %g1, %r15
        setx  0xe5549c57675568df, %g1, %r16
        setx  0xcaddad922758bb37, %g1, %r17
        setx  0x6b75e6ea8ab61429, %g1, %r18
        setx  0x773183f018cfc03b, %g1, %r19
        setx  0xde17ecb51e3535e4, %g1, %r20
        setx  0xe2a946287f826f30, %g1, %r21
        setx  0x898ffa56d8be10ed, %g1, %r22
        setx  0xda2d7d02af626bf5, %g1, %r23
        setx  0xd4912d915490d70b, %g1, %r24
        setx  0xe0b30c9174d8cc55, %g1, %r25
        setx  0x80e7ae422f5b69ed, %g1, %r26
        setx  0xb834692889e2d0e7, %g1, %r27
        setx  0x5c14f6c3e95c88cf, %g1, %r28
        setx  0xdfd2fc4f1879bce7, %g1, %r29
        setx  0xe1d41ebdf3db4984, %g1, %r30
        setx  0xfbf6a2e748cd4d40, %g1, %r31
	.word 0xca4a0009  ! 5: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0x32800008  ! 7: BNE	bne,a	<label_0x8>
	.word 0x82fa0009  ! 9: SDIVcc_R	sdivcc 	%r8, %r9, %r1
	.word 0x88f20009  ! 10: UDIVcc_R	udivcc 	%r8, %r9, %r4
	.word 0x82fa0009  ! 11: SDIVcc_R	sdivcc 	%r8, %r9, %r1
	.word 0xca6a0009  ! 13: LDSTUB_R	ldstub	%r5, [%r8 + %r9]
	.word 0xf8ba2bf0  ! 15: STDA_I	stda	%r28, [%r8 + 0x0bf0] %asi
	.word 0xd81a0009  ! 16: LDD_R	ldd	[%r8 + %r9], %r12
	.word 0x10800004  ! 17: BA	ba  	<label_0x4>
	.word 0x83220009  ! 18: MULScc_R	mulscc 	%r8, %r9, %r1
	.word 0xc9f21009  ! 19: CASXA_I	casxa	[%r8] 0x80, %r9, %r4
	.word 0x8fa209a9  ! 20: FDIVs	fdivs	%f8, %f9, %f7
	.word 0xca120009  ! 21: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xc73a27a0  ! 22: STDF_I	std	%f3, [0x07a0, %r8]
	.word 0xf33a2c10  ! 23: STDF_I	std	%f25, [0x0c10, %r8]
	.word 0xd45a0009  ! 24: LDX_R	ldx	[%r8 + %r9], %r10
	.word 0xbe4a0009  ! 25: MULX_R	mulx 	%r8, %r9, %r31
	.word 0xbfa20929  ! 26: FMULs	fmuls	%f8, %f9, %f31
	.word 0xc8ea2188  ! 27: LDSTUBA_I	ldstuba	%r4, [%r8 + 0x0188] %asi
	.word 0x8143e008  ! 28: MEMBAR	membar	#StoreStore 
	.word 0xcde21009  ! 29: CASA_I	casa	[%r8] 0x80, %r9, %r6
	.word 0xfcd22d60  ! 30: LDSHA_I	ldsha	[%r8, + 0x0d60] %asi, %r30
	.word 0x88d2255c  ! 31: UMULcc_I	umulcc 	%r8, 0x055c, %r4
	.word 0xc3ea2258  ! 32: PREFETCHA_I	prefetcha	[%r8, + 0x0258] %asi, #one_read
	.word 0x2cc20004  ! 33: BRGZ	brgz,a,nt	%8,<label_0x20004>
	.word 0x8143e027  ! 34: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #MemIssue 
	.word 0xceca1009  ! 35: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r7
	.word 0xc2d22a78  ! 36: LDSHA_I	ldsha	[%r8, + 0x0a78] %asi, %r1
	.word 0x8143c000  ! 37: STBAR	stbar
	.word 0x84da0009  ! 38: SMULcc_R	smulcc 	%r8, %r9, %r2
	.word 0x8ed20009  ! 40: UMULcc_R	umulcc 	%r8, %r9, %r7
	.word 0xc2fa1009  ! 41: SWAPA_R	swapa	%r1, [%r8 + %r9] 0x80
	.word 0xada208a9  ! 42: FSUBs	fsubs	%f8, %f9, %f22
	.word 0x40000004  ! 43: CALL	call	disp30_4
	.word 0x945226a0  ! 44: UMUL_I	umul 	%r8, 0x06a0, %r10
	.word 0x8143e03d  ! 45: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0xc36a2170  ! 46: PREFETCH_I	prefetch	[%r8 + 0x0170], #one_read
	.word 0x88720009  ! 47: UDIV_R	udiv 	%r8, %r9, %r4
	.word 0x8da209a9  ! 49: FDIVs	fdivs	%f8, %f9, %f6
	.word 0x82720009  ! 50: UDIV_R	udiv 	%r8, %r9, %r1
	.word 0x8143e00f  ! 51: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore 
	.word 0x8143c000  ! 52: STBAR	stbar
	.word 0x8143c000  ! 53: STBAR	stbar
	.word 0x8afa0009  ! 54: SDIVcc_R	sdivcc 	%r8, %r9, %r5
	.word 0xc3f21009  ! 55: CASXA_I	casxa	[%r8] 0x80, %r9, %r1
	.word 0x8143c000  ! 56: STBAR	stbar
	.word 0xc84a0009  ! 57: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xccd22bbc  ! 58: LDSHA_I	ldsha	[%r8, + 0x0bbc] %asi, %r6
	.word 0xfc7a0009  ! 59: SWAP_R	swap	%r30, [%r8 + %r9]
	.word 0xa44a0009  ! 60: MULX_R	mulx 	%r8, %r9, %r18
	.word 0xcc5a0009  ! 61: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xe0ba1009  ! 62: STDA_R	stda	%r16, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 63: STBAR	stbar
	.word 0x9b2228d8  ! 64: MULScc_I	mulscc 	%r8, 0x08d8, %r13
	.word 0xce120009  ! 65: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xc24a2608  ! 66: LDSB_I	ldsb	[%r8 + 0x0608], %r1
	.word 0xbba20929  ! 67: FMULs	fmuls	%f8, %f9, %f29
	.word 0xe41a0009  ! 68: LDD_R	ldd	[%r8 + %r9], %r18
	.word 0xe0ba1009  ! 69: STDA_R	stda	%r16, [%r8 + %r9] 0x80
	.word 0x28800004  ! 70: BLEU	bleu,a	<label_0x4>
	.word 0x8efa0009  ! 71: SDIVcc_R	sdivcc 	%r8, %r9, %r7
	.word 0x84f20009  ! 72: UDIVcc_R	udivcc 	%r8, %r9, %r2
	.word 0xc88a1009  ! 73: LDUBA_R	lduba	[%r8, %r9] 0x80, %r4
	.word 0xf6a22b1c  ! 74: STWA_I	stwa	%r27, [%r8 + 0x0b1c] %asi
	.word 0xcafa1009  ! 75: SWAPA_R	swapa	%r5, [%r8 + %r9] 0x80
	.word 0x22800004  ! 76: BE	be,a	<label_0x4>
	.word 0x89a209a9  ! 77: FDIVs	fdivs	%f8, %f9, %f4
	.word 0x8143e060  ! 78: MEMBAR	membar	#MemIssue | #Sync 
	.word 0x83a209a9  ! 79: FDIVs	fdivs	%f8, %f9, %f1
	.word 0xc8fa23c8  ! 80: SWAPA_I	swapa	%r4, [%r8 + 0x03c8] %asi
	.word 0xc67a2cd4  ! 81: SWAP_I	swap	%r3, [%r8 + 0x0cd4]
	.word 0xc4ba2e70  ! 82: STDA_I	stda	%r2, [%r8 + 0x0e70] %asi
	.word 0x8d6a0009  ! 83: SDIVX_R	sdivx	%r8, %r9, %r6
	.word 0xcea226f8  ! 84: STWA_I	stwa	%r7, [%r8 + 0x06f8] %asi
	.word 0xf8ca2100  ! 85: LDSBA_I	ldsba	[%r8, + 0x0100] %asi, %r28
	.word 0x8143e056  ! 86: MEMBAR	membar	#StoreLoad | #LoadStore | #Lookaside | #Sync 
	.word 0xc3ea2cf8  ! 87: PREFETCHA_I	prefetcha	[%r8, + 0x0cf8] %asi, #one_read
	.word 0xfff22009  ! 88: CASXA_R	casxa	[%r8]%asi, %r9, %r31
	.word 0xe2a22d2c  ! 89: STWA_I	stwa	%r17, [%r8 + 0x0d2c] %asi
	.word 0xe8aa1009  ! 90: STBA_R	stba	%r20, [%r8 + %r9] 0x80
	.word 0x852227e8  ! 92: MULScc_I	mulscc 	%r8, 0x07e8, %r2
	.word 0x12800004  ! 93: BNE	bne  	<label_0x4>
	.word 0xe8ba2170  ! 94: STDA_I	stda	%r20, [%r8 + 0x0170] %asi
	.word 0xe01a2758  ! 95: LDD_I	ldd	[%r8 + 0x0758], %r16
	.word 0x8143e036  ! 96: MEMBAR	membar	#StoreLoad | #LoadStore | #Lookaside | #MemIssue 
	.word 0x12800008  ! 97: BNE	bne  	<label_0x8>
	.word 0xbe520009  ! 98: UMUL_R	umul 	%r8, %r9, %r31
	.word 0xeff21009  ! 99: CASXA_I	casxa	[%r8] 0x80, %r9, %r23
	.word 0xc3ea2c30  ! 100: PREFETCHA_I	prefetcha	[%r8, + 0x0c30] %asi, #one_read
	.word 0xc2b220e4  ! 101: STHA_I	stha	%r1, [%r8 + 0x00e4] %asi
	.word 0x845a0009  ! 102: SMUL_R	smul 	%r8, %r9, %r2
	.word 0x8143e00a  ! 103: MEMBAR	membar	#StoreLoad | #StoreStore 
	.word 0xe06a0009  ! 104: LDSTUB_R	ldstub	%r16, [%r8 + %r9]
	.word 0x00800004  ! 105: BN	bn  	<label_0x4>
	.word 0xee5226e4  ! 106: LDSH_I	ldsh	[%r8 + 0x06e4], %r23
	.word 0x0e800008  ! 107: BVS	bvs  	<label_0x8>
	.word 0xcd220009  ! 108: STF_R	st	%f6, [%r9, %r8]
	.word 0xfac21009  ! 109: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r29
	.word 0xdcaa1009  ! 110: STBA_R	stba	%r14, [%r8 + %r9] 0x80
	.word 0xcf3a0009  ! 112: STDF_R	std	%f7, [%r9, %r8]
	.word 0xdc1a2fc8  ! 113: LDD_I	ldd	[%r8 + 0x0fc8], %r14
	.word 0xecf22cd0  ! 114: STXA_I	stxa	%r22, [%r8 + 0x0cd0] %asi
	.word 0xb3a20829  ! 115: FADDs	fadds	%f8, %f9, %f25
	.word 0xc3ea2f00  ! 116: PREFETCHA_I	prefetcha	[%r8, + 0x0f00] %asi, #one_read
	.word 0x84720009  ! 117: UDIV_R	udiv 	%r8, %r9, %r2
	.word 0xada20829  ! 118: FADDs	fadds	%f8, %f9, %f22
	.word 0x26800004  ! 119: BL	bl,a	<label_0x4>
	.word 0xb0520009  ! 121: UMUL_R	umul 	%r8, %r9, %r24
	.word 0x887a0009  ! 123: SDIV_R	sdiv 	%r8, %r9, %r4
	.word 0x887a0009  ! 124: SDIV_R	sdiv 	%r8, %r9, %r4
	.word 0xc6ca2354  ! 125: LDSBA_I	ldsba	[%r8, + 0x0354] %asi, %r3
	.word 0xdeda1009  ! 127: LDXA_R	ldxa	[%r8, %r9] 0x80, %r15
	.word 0xba6a0009  ! 128: UDIVX_R	udivx 	%r8, %r9, %r29
	.word 0xfc9a2ec8  ! 129: LDDA_I	ldda	[%r8, + 0x0ec8] %asi, %r30
	.word 0xd81a2c48  ! 130: LDD_I	ldd	[%r8 + 0x0c48], %r12
	.word 0xec9a1009  ! 131: LDDA_R	ldda	[%r8, %r9] 0x80, %r22
	.word 0xe8ba1009  ! 132: STDA_R	stda	%r20, [%r8 + %r9] 0x80
	.word 0xfc1a0009  ! 133: LDD_R	ldd	[%r8 + %r9], %r30
	.word 0xfeca25b0  ! 134: LDSBA_I	ldsba	[%r8, + 0x05b0] %asi, %r31
	.word 0x2a800004  ! 135: BCS	bcs,a	<label_0x4>
	.word 0x8143c000  ! 136: STBAR	stbar
	.word 0xf7220009  ! 137: STF_R	st	%f27, [%r9, %r8]
	.word 0xc3ea2f24  ! 138: PREFETCHA_I	prefetcha	[%r8, + 0x0f24] %asi, #one_read
	.word 0x8143c000  ! 140: STBAR	stbar
	.word 0x884a2420  ! 141: MULX_I	mulx 	%r8, 0x0420, %r4
	.word 0xc4d22b20  ! 142: LDSHA_I	ldsha	[%r8, + 0x0b20] %asi, %r2
	.word 0xc67a20f8  ! 143: SWAP_I	swap	%r3, [%r8 + 0x00f8]
	.word 0x887227a8  ! 144: UDIV_I	udiv 	%r8, 0x07a8, %r4
	.word 0xc68a1009  ! 145: LDUBA_R	lduba	[%r8, %r9] 0x80, %r3
	.word 0x846a25ac  ! 147: UDIVX_I	udivx 	%r8, 0x05ac, %r2
	.word 0xc2ca1009  ! 149: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r1
	.word 0x8143e005  ! 150: MEMBAR	membar	#LoadLoad | #LoadStore 
	.word 0x82da2e64  ! 151: SMULcc_I	smulcc 	%r8, 0x0e64, %r1
	.word 0xceaa2780  ! 153: STBA_I	stba	%r7, [%r8 + 0x0780] %asi
	.word 0x8cfa2758  ! 154: SDIVcc_I	sdivcc 	%r8, 0x0758, %r6
	.word 0x885a0009  ! 155: SMUL_R	smul 	%r8, %r9, %r4
	.word 0xacf20009  ! 156: UDIVcc_R	udivcc 	%r8, %r9, %r22
	.word 0x83a20829  ! 157: FADDs	fadds	%f8, %f9, %f1
	.word 0xcd3a28e8  ! 158: STDF_I	std	%f6, [0x08e8, %r8]
	.word 0xef3a0009  ! 159: STDF_R	std	%f23, [%r9, %r8]
	.word 0x02800004  ! 160: BE	be  	<label_0x4>
	.word 0x8143c000  ! 161: STBAR	stbar
	.word 0xc7e22009  ! 162: CASA_R	casa	[%r8] %asi, %r9, %r3
	.word 0xc2422760  ! 163: LDSW_I	ldsw	[%r8 + 0x0760], %r1
	.word 0xa3a20829  ! 164: FADDs	fadds	%f8, %f9, %f17
	.word 0x8e6a0009  ! 165: UDIVX_R	udivx 	%r8, %r9, %r7
	.word 0x40000004  ! 166: CALL	call	disp30_4
	.word 0xc5f22009  ! 167: CASXA_R	casxa	[%r8]%asi, %r9, %r2
	.word 0xc6aa27c4  ! 168: STBA_I	stba	%r3, [%r8 + 0x07c4] %asi
	.word 0xc3ea27a8  ! 169: PREFETCHA_I	prefetcha	[%r8, + 0x07a8] %asi, #one_read
	.word 0xc47a0009  ! 170: SWAP_R	swap	%r2, [%r8 + %r9]
	.word 0x8143c000  ! 171: STBAR	stbar
	.word 0x8143e034  ! 172: MEMBAR	membar	#LoadStore | #Lookaside | #MemIssue 
	.word 0x30800008  ! 173: BA	ba,a	<label_0x8>
	.word 0xceca1009  ! 174: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r7
	.word 0x846a0009  ! 175: UDIVX_R	udivx 	%r8, %r9, %r2
	.word 0xc4d21009  ! 176: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r2
	.word 0x30800004  ! 177: BA	ba,a	<label_0x4>
	.word 0xcab22748  ! 178: STHA_I	stha	%r5, [%r8 + 0x0748] %asi
	.word 0x8ef20009  ! 180: UDIVcc_R	udivcc 	%r8, %r9, %r7
	.word 0xa2d22e08  ! 181: UMULcc_I	umulcc 	%r8, 0x0e08, %r17
	.word 0xc36a29bc  ! 182: PREFETCH_I	prefetch	[%r8 + 0x09bc], #one_read
	.word 0x30800008  ! 183: BA	ba,a	<label_0x8>
	.word 0xd8ba1009  ! 184: STDA_R	stda	%r12, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 185: STBAR	stbar
	.word 0xc652205c  ! 186: LDSH_I	ldsh	[%r8 + 0x005c], %r3
	.word 0x8143c000  ! 187: STBAR	stbar
	.word 0xb56a2100  ! 188: SDIVX_I	sdivx	%r8, 0x0100, %r26
	.word 0xc8a22060  ! 189: STWA_I	stwa	%r4, [%r8 + 0x0060] %asi
	.word 0xc64a2864  ! 190: LDSB_I	ldsb	[%r8 + 0x0864], %r3
	.word 0x8ba20929  ! 191: FMULs	fmuls	%f8, %f9, %f5
	.word 0xf09a1009  ! 193: LDDA_R	ldda	[%r8, %r9] 0x80, %r24
	.word 0x8143c000  ! 194: STBAR	stbar
	.word 0xcc6a0009  ! 195: LDSTUB_R	ldstub	%r6, [%r8 + %r9]
	.word 0xb9a20829  ! 196: FADDs	fadds	%f8, %f9, %f28
	.word 0x8143c000  ! 197: STBAR	stbar
	.word 0xc4ba1009  ! 198: STDA_R	stda	%r2, [%r8 + %r9] 0x80
	.word 0x88da2e40  ! 199: SMULcc_I	smulcc 	%r8, 0x0e40, %r4
	.word 0x89a20929  ! 200: FMULs	fmuls	%f8, %f9, %f4
	.word 0x8c520009  ! 201: UMUL_R	umul 	%r8, %r9, %r6
	.word 0xceda1009  ! 202: LDXA_R	ldxa	[%r8, %r9] 0x80, %r7
	.word 0xfa7a2adc  ! 203: SWAP_I	swap	%r29, [%r8 + 0x0adc]
	.word 0xbcf20009  ! 204: UDIVcc_R	udivcc 	%r8, %r9, %r30
	.word 0x8143c000  ! 205: STBAR	stbar
	.word 0x8c522138  ! 206: UMUL_I	umul 	%r8, 0x0138, %r6
	.word 0xfa520009  ! 207: LDSH_R	ldsh	[%r8 + %r9], %r29
	.word 0xe8ba1009  ! 208: STDA_R	stda	%r20, [%r8 + %r9] 0x80
	.word 0x865a0009  ! 209: SMUL_R	smul 	%r8, %r9, %r3
	.word 0x08800008  ! 210: BLEU	bleu  	<label_0x8>
	.word 0xc6f224b8  ! 211: STXA_I	stxa	%r3, [%r8 + 0x04b8] %asi
	.word 0xe60a0009  ! 212: LDUB_R	ldub	[%r8 + %r9], %r19
	.word 0xc4f21009  ! 213: STXA_R	stxa	%r2, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 214: STBAR	stbar
	.word 0x98d20009  ! 215: UMULcc_R	umulcc 	%r8, %r9, %r12
	.word 0xc36a2d04  ! 216: PREFETCH_I	prefetch	[%r8 + 0x0d04], #one_read
	.word 0x8a7a2f68  ! 217: SDIV_I	sdiv 	%r8, 0x0f68, %r5
	.word 0xc6aa1009  ! 218: STBA_R	stba	%r3, [%r8 + %r9] 0x80
	.word 0xc49a1009  ! 220: LDDA_R	ldda	[%r8, %r9] 0x80, %r2
	.word 0xc88a1009  ! 221: LDUBA_R	lduba	[%r8, %r9] 0x80, %r4
	.word 0x04800004  ! 222: BLE	ble  	<label_0x4>
	.word 0xcafa1009  ! 223: SWAPA_R	swapa	%r5, [%r8 + %r9] 0x80
	.word 0xdaaa1009  ! 224: STBA_R	stba	%r13, [%r8 + %r9] 0x80
	.word 0xca7a0009  ! 225: SWAP_R	swap	%r5, [%r8 + %r9]
	.word 0x8143e020  ! 226: MEMBAR	membar	#MemIssue 
	.word 0x8143e072  ! 227: MEMBAR	membar	#StoreLoad | #Lookaside | #MemIssue | #Sync 
	.word 0xf0ba1009  ! 228: STDA_R	stda	%r24, [%r8 + %r9] 0x80
	.word 0xe68a2ef8  ! 229: LDUBA_I	lduba	[%r8, + 0x0ef8] %asi, %r19
	.word 0xd93a2b98  ! 230: STDF_I	std	%f12, [0x0b98, %r8]
	.word 0xf4ea2be4  ! 231: LDSTUBA_I	ldstuba	%r26, [%r8 + 0x0be4] %asi
	.word 0x824a2d7c  ! 232: MULX_I	mulx 	%r8, 0x0d7c, %r1
	.word 0x32800004  ! 233: BNE	bne,a	<label_0x4>
	.word 0xd85a2e10  ! 234: LDX_I	ldx	[%r8 + 0x0e10], %r12
	.word 0xfc9a1009  ! 235: LDDA_R	ldda	[%r8, %r9] 0x80, %r30
	.word 0x28800004  ! 236: BLEU	bleu,a	<label_0x4>
	.word 0x08800008  ! 237: BLEU	bleu  	<label_0x8>
	.word 0xcff22009  ! 238: CASXA_R	casxa	[%r8]%asi, %r9, %r7
	.word 0xc3ea224c  ! 239: PREFETCHA_I	prefetcha	[%r8, + 0x024c] %asi, #one_read
	.word 0xfe6a207c  ! 240: LDSTUB_I	ldstub	%r31, [%r8 + 0x007c]
	.word 0x8143e037  ! 241: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside | #MemIssue 
	.word 0xed220009  ! 242: STF_R	st	%f22, [%r9, %r8]
	.word 0xca92292c  ! 243: LDUHA_I	lduha	[%r8, + 0x092c] %asi, %r5
	.word 0xdcea2d78  ! 244: LDSTUBA_I	ldstuba	%r14, [%r8 + 0x0d78] %asi
	.word 0x1e800004  ! 245: BVC	bvc  	<label_0x4>
	.word 0xa6fa0009  ! 246: SDIVcc_R	sdivcc 	%r8, %r9, %r19
	.word 0xc6c21009  ! 247: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r3
	.word 0x8143c000  ! 248: STBAR	stbar
	.word 0x8143e005  ! 249: MEMBAR	membar	#LoadLoad | #LoadStore 
	.word 0x847a22a8  ! 250: SDIV_I	sdiv 	%r8, 0x02a8, %r2
	.word 0xf6c22f34  ! 251: LDSWA_I	ldswa	[%r8, + 0x0f34] %asi, %r27
	.word 0x8ada2cb0  ! 252: SMULcc_I	smulcc 	%r8, 0x0cb0, %r5
	.word 0xca4a0009  ! 253: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xc68a2948  ! 254: LDUBA_I	lduba	[%r8, + 0x0948] %asi, %r3
	.word 0x8143c000  ! 255: STBAR	stbar
	.word 0x9ba20829  ! 256: FADDs	fadds	%f8, %f9, %f13
	.word 0xf53a0009  ! 257: STDF_R	std	%f26, [%r9, %r8]
	.word 0xa67a0009  ! 258: SDIV_R	sdiv 	%r8, %r9, %r19
	.word 0xdefa1009  ! 259: SWAPA_R	swapa	%r15, [%r8 + %r9] 0x80
	.word 0xc6120009  ! 260: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xbed20009  ! 261: UMULcc_R	umulcc 	%r8, %r9, %r31
	.word 0x827a25a4  ! 262: SDIV_I	sdiv 	%r8, 0x05a4, %r1
	.word 0xc60a0009  ! 263: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xcf222d98  ! 264: STF_I	st	%f7, [0x0d98, %r8]
	.word 0xc36a2758  ! 265: PREFETCH_I	prefetch	[%r8 + 0x0758], #one_read
	.word 0xcafa1009  ! 266: SWAPA_R	swapa	%r5, [%r8 + %r9] 0x80
	.word 0x8c7a0009  ! 267: SDIV_R	sdiv 	%r8, %r9, %r6
	.word 0x98da27a0  ! 270: SMULcc_I	smulcc 	%r8, 0x07a0, %r12
	.word 0xe4aa2644  ! 271: STBA_I	stba	%r18, [%r8 + 0x0644] %asi
	.word 0xcaca1009  ! 272: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r5
	.word 0xbafa26f0  ! 273: SDIVcc_I	sdivcc 	%r8, 0x06f0, %r29
	.word 0xc2921009  ! 274: LDUHA_R	lduha	[%r8, %r9] 0x80, %r1
	.word 0xfcf21009  ! 275: STXA_R	stxa	%r30, [%r8 + %r9] 0x80
	.word 0xc93a2520  ! 276: STDF_I	std	%f4, [0x0520, %r8]
	.word 0xdbe22009  ! 277: CASA_R	casa	[%r8] %asi, %r9, %r13
	.word 0x8a5226c8  ! 278: UMUL_I	umul 	%r8, 0x06c8, %r5
	.word 0xf9f21009  ! 279: CASXA_I	casxa	[%r8] 0x80, %r9, %r28
	.word 0xc27a2350  ! 280: SWAP_I	swap	%r1, [%r8 + 0x0350]
	.word 0x865a0009  ! 281: SMUL_R	smul 	%r8, %r9, %r3
	.word 0x02800004  ! 282: BE	be  	<label_0x4>
	.word 0xa4720009  ! 283: UDIV_R	udiv 	%r8, %r9, %r18
	.word 0x8143c000  ! 284: STBAR	stbar
	.word 0xc36a25b4  ! 285: PREFETCH_I	prefetch	[%r8 + 0x05b4], #one_read
	.word 0xc85a2a00  ! 286: LDX_I	ldx	[%r8 + 0x0a00], %r4
	.word 0x8143c000  ! 287: STBAR	stbar
	.word 0xc2ea1009  ! 288: LDSTUBA_R	ldstuba	%r1, [%r8 + %r9] 0x80
	.word 0x8b6a0009  ! 289: SDIVX_R	sdivx	%r8, %r9, %r5
	.word 0x87a209a9  ! 290: FDIVs	fdivs	%f8, %f9, %f3
	.word 0x8143e05e  ! 291: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0xdb2226f0  ! 292: STF_I	st	%f13, [0x06f0, %r8]
	.word 0x8c522f4c  ! 293: UMUL_I	umul 	%r8, 0x0f4c, %r6
	.word 0x8efa0009  ! 294: SDIVcc_R	sdivcc 	%r8, %r9, %r7
	.word 0x2e800004  ! 295: BVS	bvs,a	<label_0x4>
	.word 0x34800004  ! 296: BG	bg,a	<label_0x4>
	.word 0x9c7a0009  ! 297: SDIV_R	sdiv 	%r8, %r9, %r14
	.word 0x02800008  ! 298: BE	be  	<label_0x8>
	.word 0xdaf22f28  ! 299: STXA_I	stxa	%r13, [%r8 + 0x0f28] %asi
	.word 0xc3ea2608  ! 300: PREFETCHA_I	prefetcha	[%r8, + 0x0608] %asi, #one_read
	.word 0x88fa216c  ! 301: SDIVcc_I	sdivcc 	%r8, 0x016c, %r4
	.word 0x8143c000  ! 302: STBAR	stbar
	.word 0x20800004  ! 303: BN	bn,a	<label_0x4>
	.word 0xc4fa1009  ! 304: SWAPA_R	swapa	%r2, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 305: STBAR	stbar
	.word 0xf2b226cc  ! 306: STHA_I	stha	%r25, [%r8 + 0x06cc] %asi
	.word 0xe0ea2d74  ! 307: LDSTUBA_I	ldstuba	%r16, [%r8 + 0x0d74] %asi
	.word 0x8143c000  ! 308: STBAR	stbar
	.word 0x18800004  ! 309: BGU	bgu  	<label_0x4>
	.word 0x16800004  ! 310: BGE	bge  	<label_0x4>
	.word 0xc8aa1009  ! 311: STBA_R	stba	%r4, [%r8 + %r9] 0x80
	.word 0x85a20829  ! 312: FADDs	fadds	%f8, %f9, %f2
	.word 0x8e4a0009  ! 313: MULX_R	mulx 	%r8, %r9, %r7
	.word 0xc6921009  ! 314: LDUHA_R	lduha	[%r8, %r9] 0x80, %r3
	.word 0xb3a20929  ! 315: FMULs	fmuls	%f8, %f9, %f25
	.word 0xe5f22009  ! 316: CASXA_R	casxa	[%r8]%asi, %r9, %r18
	.word 0x836a2a58  ! 317: SDIVX_I	sdivx	%r8, 0x0a58, %r1
	.word 0xc9222578  ! 318: STF_I	st	%f4, [0x0578, %r8]
	.word 0xcf220009  ! 319: STF_R	st	%f7, [%r9, %r8]
	.word 0xec9a1009  ! 320: LDDA_R	ldda	[%r8, %r9] 0x80, %r22
	.word 0xc9222e1c  ! 321: STF_I	st	%f4, [0x0e1c, %r8]
	.word 0xc6da1009  ! 322: LDXA_R	ldxa	[%r8, %r9] 0x80, %r3
	.word 0xc36a20d0  ! 323: PREFETCH_I	prefetch	[%r8 + 0x00d0], #one_read
	.word 0xdefa1009  ! 324: SWAPA_R	swapa	%r15, [%r8 + %r9] 0x80
	.word 0xc85a29d0  ! 325: LDX_I	ldx	[%r8 + 0x09d0], %r4
	.word 0xc6da2300  ! 326: LDXA_I	ldxa	[%r8, + 0x0300] %asi, %r3
	.word 0xce7a2e4c  ! 327: SWAP_I	swap	%r7, [%r8 + 0x0e4c]
	.word 0x8e522c98  ! 328: UMUL_I	umul 	%r8, 0x0c98, %r7
	.word 0xd8ba1009  ! 329: STDA_R	stda	%r12, [%r8 + %r9] 0x80
	.word 0xcc9a2bf0  ! 330: LDDA_I	ldda	[%r8, + 0x0bf0] %asi, %r6
	.word 0x1a800008  ! 331: BCC	bcc  	<label_0x8>
	.word 0xd9f21009  ! 332: CASXA_I	casxa	[%r8] 0x80, %r9, %r12
	.word 0xc8ea1009  ! 333: LDSTUBA_R	ldstuba	%r4, [%r8 + %r9] 0x80
	.word 0x22ca0008  ! 334: BRZ	brz,a,pt	%8,<label_0xa0008>
	.word 0xa96a29d4  ! 335: SDIVX_I	sdivx	%r8, 0x09d4, %r20
	.word 0xcca21009  ! 336: STWA_R	stwa	%r6, [%r8 + %r9] 0x80
	.word 0xced21009  ! 337: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r7
	.word 0xf33a0009  ! 338: STDF_R	std	%f25, [%r9, %r8]
	.word 0x8143e025  ! 339: MEMBAR	membar	#LoadLoad | #LoadStore | #MemIssue 
	.word 0xcdf22009  ! 340: CASXA_R	casxa	[%r8]%asi, %r9, %r6
	.word 0xf0ba1009  ! 341: STDA_R	stda	%r24, [%r8 + %r9] 0x80
	.word 0x876a273c  ! 342: SDIVX_I	sdivx	%r8, 0x073c, %r3
	.word 0xa8f22764  ! 343: UDIVcc_I	udivcc 	%r8, 0x0764, %r20
	.word 0xc4520009  ! 344: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xe8ba2930  ! 345: STDA_I	stda	%r20, [%r8 + 0x0930] %asi
	.word 0x96522538  ! 346: UMUL_I	umul 	%r8, 0x0538, %r11
	.word 0x84f22264  ! 347: UDIVcc_I	udivcc 	%r8, 0x0264, %r2
	.word 0xc2aa1009  ! 348: STBA_R	stba	%r1, [%r8 + %r9] 0x80
	.word 0x8522216c  ! 349: MULScc_I	mulscc 	%r8, 0x016c, %r2
	.word 0xcc4a2de0  ! 350: LDSB_I	ldsb	[%r8 + 0x0de0], %r6
	.word 0x83a208a9  ! 351: FSUBs	fsubs	%f8, %f9, %f1
	.word 0xc4022b2c  ! 352: LDUW_I	lduw	[%r8 + 0x0b2c], %r2
	.word 0xc33a28d0  ! 353: STDF_I	std	%f1, [0x08d0, %r8]
	.word 0xc36a2824  ! 354: PREFETCH_I	prefetch	[%r8 + 0x0824], #one_read
	.word 0xfc7a2b10  ! 355: SWAP_I	swap	%r30, [%r8 + 0x0b10]
	.word 0xfc9a2338  ! 356: LDDA_I	ldda	[%r8, + 0x0338] %asi, %r30
	.word 0xe6122fc0  ! 357: LDUH_I	lduh	[%r8 + 0x0fc0], %r19
	.word 0xce020009  ! 358: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xc4aa1009  ! 359: STBA_R	stba	%r2, [%r8 + %r9] 0x80
	.word 0xc4ba2378  ! 360: STDA_I	stda	%r2, [%r8 + 0x0378] %asi
	.word 0xf012278c  ! 361: LDUH_I	lduh	[%r8 + 0x078c], %r24
	.word 0x96fa0009  ! 362: SDIVcc_R	sdivcc 	%r8, %r9, %r11
	.word 0x85a209a9  ! 363: FDIVs	fdivs	%f8, %f9, %f2
	.word 0x8c6a2eac  ! 364: UDIVX_I	udivx 	%r8, 0x0eac, %r6
	.word 0x8a720009  ! 366: UDIV_R	udiv 	%r8, %r9, %r5
	.word 0xcc8221a4  ! 367: LDUWA_I	lduwa	[%r8, + 0x01a4] %asi, %r6
	.word 0x06ca0004  ! 368: BRLZ	brlz  ,pt	%8,<label_0xa0004>
	.word 0x86f22ad4  ! 369: UDIVcc_I	udivcc 	%r8, 0x0ad4, %r3
	.word 0x8ed20009  ! 370: UMULcc_R	umulcc 	%r8, %r9, %r7
	.word 0x8d6a0009  ! 371: SDIVX_R	sdivx	%r8, %r9, %r6
	.word 0x2aca0004  ! 372: BRNZ	brnz,a,pt	%8,<label_0xa0004>
	.word 0x84720009  ! 373: UDIV_R	udiv 	%r8, %r9, %r2
	.word 0xc9220009  ! 374: STF_R	st	%f4, [%r9, %r8]
	.word 0xcc9a1009  ! 375: LDDA_R	ldda	[%r8, %r9] 0x80, %r6
	.word 0xd53a0009  ! 376: STDF_R	std	%f10, [%r9, %r8]
	.word 0x89a20829  ! 377: FADDs	fadds	%f8, %f9, %f4
	.word 0x89a209a9  ! 378: FDIVs	fdivs	%f8, %f9, %f4
	.word 0x3a800008  ! 379: BCC	bcc,a	<label_0x8>
	.word 0xc4aa26ec  ! 380: STBA_I	stba	%r2, [%r8 + 0x06ec] %asi
	.word 0x8ed22664  ! 381: UMULcc_I	umulcc 	%r8, 0x0664, %r7
	.word 0x866a25d4  ! 382: UDIVX_I	udivx 	%r8, 0x05d4, %r3
	.word 0x8143e013  ! 383: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside 
	.word 0x83a20929  ! 384: FMULs	fmuls	%f8, %f9, %f1
	.word 0x22800004  ! 385: BE	be,a	<label_0x4>
	.word 0x30800004  ! 386: BA	ba,a	<label_0x4>
	.word 0xc6120009  ! 387: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0x865a2fb0  ! 388: SMUL_I	smul 	%r8, 0x0fb0, %r3
	.word 0xc3ea28ec  ! 389: PREFETCHA_I	prefetcha	[%r8, + 0x08ec] %asi, #one_read
	.word 0x88f22ba8  ! 390: UDIVcc_I	udivcc 	%r8, 0x0ba8, %r4
	.word 0x0a800004  ! 391: BCS	bcs  	<label_0x4>
	.word 0x8143e045  ! 392: MEMBAR	membar	#LoadLoad | #LoadStore | #Sync 
	.word 0xda420009  ! 393: LDSW_R	ldsw	[%r8 + %r9], %r13
	.word 0x20800008  ! 394: BN	bn,a	<label_0x8>
	.word 0x9522265c  ! 396: MULScc_I	mulscc 	%r8, 0x065c, %r10
	.word 0x9ba208a9  ! 397: FSUBs	fsubs	%f8, %f9, %f13
	.word 0xf49a21c0  ! 398: LDDA_I	ldda	[%r8, + 0x01c0] %asi, %r26
	.word 0x9c72212c  ! 399: UDIV_I	udiv 	%r8, 0x012c, %r14
	.word 0x8143c000  ! 400: STBAR	stbar
	.word 0xcbf21009  ! 401: CASXA_I	casxa	[%r8] 0x80, %r9, %r5
	.word 0xc41a21f8  ! 402: LDD_I	ldd	[%r8 + 0x01f8], %r2
	.word 0x8afa2fa4  ! 403: SDIVcc_I	sdivcc 	%r8, 0x0fa4, %r5
	.word 0xde8a1009  ! 404: LDUBA_R	lduba	[%r8, %r9] 0x80, %r15
	.word 0xa6fa27dc  ! 405: SDIVcc_I	sdivcc 	%r8, 0x07dc, %r19
	.word 0x8143c000  ! 406: STBAR	stbar
	.word 0xc85a0009  ! 407: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xc3ea26e0  ! 408: PREFETCHA_I	prefetcha	[%r8, + 0x06e0] %asi, #one_read
	.word 0x8143e04b  ! 409: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Sync 
	.word 0x8c722970  ! 410: UDIV_I	udiv 	%r8, 0x0970, %r6
	.word 0x8efa2650  ! 411: SDIVcc_I	sdivcc 	%r8, 0x0650, %r7
	.word 0xc89228d8  ! 412: LDUHA_I	lduha	[%r8, + 0x08d8] %asi, %r4
	.word 0x9a5a2034  ! 413: SMUL_I	smul 	%r8, 0x0034, %r13
	.word 0x8c6a2bec  ! 414: UDIVX_I	udivx 	%r8, 0x0bec, %r6
	.word 0xc4921009  ! 415: LDUHA_R	lduha	[%r8, %r9] 0x80, %r2
	.word 0xced21009  ! 416: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r7
	.word 0xc412299c  ! 417: LDUH_I	lduh	[%r8 + 0x099c], %r2
	.word 0x8143e00c  ! 418: MEMBAR	membar	#LoadStore | #StoreStore 
	.word 0xceda1009  ! 419: LDXA_R	ldxa	[%r8, %r9] 0x80, %r7
	.word 0xf3f22009  ! 420: CASXA_R	casxa	[%r8]%asi, %r9, %r25
	.word 0x8c522ed8  ! 421: UMUL_I	umul 	%r8, 0x0ed8, %r6
	.word 0xc3220009  ! 422: STF_R	st	%f1, [%r9, %r8]
	.word 0xcea21009  ! 423: STWA_R	stwa	%r7, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 424: STBAR	stbar
	.word 0x827a0009  ! 425: SDIV_R	sdiv 	%r8, %r9, %r1
	.word 0x2a800004  ! 426: BCS	bcs,a	<label_0x4>
	.word 0x8143c000  ! 427: STBAR	stbar
	.word 0x84520009  ! 428: UMUL_R	umul 	%r8, %r9, %r2
	.word 0x8143e068  ! 429: MEMBAR	membar	#StoreStore | #MemIssue | #Sync 
	.word 0x8143c000  ! 430: STBAR	stbar
	.word 0x84f222c4  ! 431: UDIVcc_I	udivcc 	%r8, 0x02c4, %r2
	.word 0x20800008  ! 432: BN	bn,a	<label_0x8>
	.word 0xc36a23cc  ! 433: PREFETCH_I	prefetch	[%r8 + 0x03cc], #one_read
	.word 0x8143c000  ! 434: STBAR	stbar
	.word 0x10800004  ! 435: BA	ba  	<label_0x4>
	.word 0xe8ba1009  ! 436: STDA_R	stda	%r20, [%r8 + %r9] 0x80
	.word 0xe6822f0c  ! 437: LDUWA_I	lduwa	[%r8, + 0x0f0c] %asi, %r19
	.word 0x0c800008  ! 438: BNEG	bneg  	<label_0x8>
	.word 0xc6fa1009  ! 439: SWAPA_R	swapa	%r3, [%r8 + %r9] 0x80
	.word 0xf1e22009  ! 441: CASA_R	casa	[%r8] %asi, %r9, %r24
	.word 0x8a5228a0  ! 442: UMUL_I	umul 	%r8, 0x08a0, %r5
	.word 0x8143c000  ! 443: STBAR	stbar
	.word 0xdc9a1009  ! 444: LDDA_R	ldda	[%r8, %r9] 0x80, %r14
	.word 0x40000008  ! 445: CALL	call	disp30_8
	.word 0x8143e067  ! 446: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #MemIssue | #Sync 
	.word 0x8143e024  ! 447: MEMBAR	membar	#LoadStore | #MemIssue 
	.word 0x8143c000  ! 448: STBAR	stbar
	.word 0x8143e064  ! 449: MEMBAR	membar	#LoadStore | #MemIssue | #Sync 
	.word 0xc6d21009  ! 450: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r3
	.word 0xc3ea2a5c  ! 451: PREFETCHA_I	prefetcha	[%r8, + 0x0a5c] %asi, #one_read
	.word 0xcf220009  ! 452: STF_R	st	%f7, [%r9, %r8]
	.word 0xc6da2890  ! 453: LDXA_I	ldxa	[%r8, + 0x0890] %asi, %r3
	.word 0x8b220009  ! 454: MULScc_R	mulscc 	%r8, %r9, %r5
	.word 0x88fa0009  ! 455: SDIVcc_R	sdivcc 	%r8, %r9, %r4
	.word 0x8eda0009  ! 456: SMULcc_R	smulcc 	%r8, %r9, %r7
	.word 0x8143c000  ! 457: STBAR	stbar
	.word 0x83a20929  ! 458: FMULs	fmuls	%f8, %f9, %f1
	.word 0xce420009  ! 459: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xbcfa240c  ! 461: SDIVcc_I	sdivcc 	%r8, 0x040c, %r30
	.word 0xc4520009  ! 462: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xc2822d1c  ! 463: LDUWA_I	lduwa	[%r8, + 0x0d1c] %asi, %r1
	.word 0x8143e059  ! 464: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside | #Sync 
	.word 0xb5a209a9  ! 465: FDIVs	fdivs	%f8, %f9, %f26
	.word 0xf6921009  ! 466: LDUHA_R	lduha	[%r8, %r9] 0x80, %r27
	.word 0xa6720009  ! 467: UDIV_R	udiv 	%r8, %r9, %r19
	.word 0xc7f21009  ! 468: CASXA_I	casxa	[%r8] 0x80, %r9, %r3
	.word 0x8efa0009  ! 469: SDIVcc_R	sdivcc 	%r8, %r9, %r7
	.word 0x88fa0009  ! 470: SDIVcc_R	sdivcc 	%r8, %r9, %r4
	.word 0xcb3a25b8  ! 471: STDF_I	std	%f5, [0x05b8, %r8]
	.word 0x8143c000  ! 472: STBAR	stbar
	.word 0x2c800004  ! 473: BNEG	bneg,a	<label_0x4>
	.word 0x04c20008  ! 474: BRLEZ	brlez  ,nt	%8,<label_0x20008>
	.word 0xe9e22009  ! 475: CASA_R	casa	[%r8] %asi, %r9, %r20
	.word 0x8143e021  ! 476: MEMBAR	membar	#LoadLoad | #MemIssue 
	.word 0x8143e078  ! 477: MEMBAR	membar	#StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xc9e21009  ! 478: CASA_I	casa	[%r8] 0x80, %r9, %r4
	.word 0x04ca0008  ! 479: BRLEZ	brlez  ,pt	%8,<label_0xa0008>
	.word 0xce422a5c  ! 480: LDSW_I	ldsw	[%r8 + 0x0a5c], %r7
	.word 0xc3ea2c10  ! 481: PREFETCHA_I	prefetcha	[%r8, + 0x0c10] %asi, #one_read
	.word 0x8143e03d  ! 482: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0x83222084  ! 483: MULScc_I	mulscc 	%r8, 0x0084, %r1
	.word 0xf8ba2da0  ! 484: STDA_I	stda	%r28, [%r8 + 0x0da0] %asi
	.word 0x8143e068  ! 485: MEMBAR	membar	#StoreStore | #MemIssue | #Sync 
	.word 0xca6a0009  ! 486: LDSTUB_R	ldstub	%r5, [%r8 + %r9]
	.word 0x0a800004  ! 487: BCS	bcs  	<label_0x4>
	.word 0x8143c000  ! 488: STBAR	stbar
	.word 0x8143c000  ! 489: STBAR	stbar
	.word 0xf80a2da0  ! 490: LDUB_I	ldub	[%r8 + 0x0da0], %r28
	.word 0xca7a0009  ! 491: SWAP_R	swap	%r5, [%r8 + %r9]
	.word 0xdcea1009  ! 492: LDSTUBA_R	ldstuba	%r14, [%r8 + %r9] 0x80
	.word 0xfeaa1009  ! 493: STBA_R	stba	%r31, [%r8 + %r9] 0x80
	.word 0x8143e022  ! 494: MEMBAR	membar	#StoreLoad | #MemIssue 
	.word 0xc2aa1009  ! 495: STBA_R	stba	%r1, [%r8 + %r9] 0x80
	.word 0xb2720009  ! 496: UDIV_R	udiv 	%r8, %r9, %r25
	.word 0x32800004  ! 497: BNE	bne,a	<label_0x4>
	.word 0xc36a2be0  ! 498: PREFETCH_I	prefetch	[%r8 + 0x0be0], #one_read
	.word 0x8cda0009  ! 499: SMULcc_R	smulcc 	%r8, %r9, %r6
	.word 0xfc8a1009  ! 500: LDUBA_R	lduba	[%r8, %r9] 0x80, %r30
	.word 0x8143e053  ! 501: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside | #Sync 
	.word 0xe682296c  ! 502: LDUWA_I	lduwa	[%r8, + 0x096c] %asi, %r19
	.word 0x04800004  ! 503: BLE	ble  	<label_0x4>
	.word 0xdaf22750  ! 504: STXA_I	stxa	%r13, [%r8 + 0x0750] %asi
	.word 0xcd220009  ! 505: STF_R	st	%f6, [%r9, %r8]
	.word 0x85a209a9  ! 506: FDIVs	fdivs	%f8, %f9, %f2
	.word 0xc45a0009  ! 507: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0x88da0009  ! 508: SMULcc_R	smulcc 	%r8, %r9, %r4
	.word 0xc4122eac  ! 509: LDUH_I	lduh	[%r8 + 0x0eac], %r2
	.word 0xf5222488  ! 510: STF_I	st	%f26, [0x0488, %r8]
	.word 0xcc020009  ! 511: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xc47a2248  ! 512: SWAP_I	swap	%r2, [%r8 + 0x0248]
	.word 0xc3ea20a0  ! 513: PREFETCHA_I	prefetcha	[%r8, + 0x00a0] %asi, #one_read
	.word 0xc2ca20b4  ! 514: LDSBA_I	ldsba	[%r8, + 0x00b4] %asi, %r1
	.word 0x8e4a0009  ! 515: MULX_R	mulx 	%r8, %r9, %r7
	.word 0xe4da2b00  ! 516: LDXA_I	ldxa	[%r8, + 0x0b00] %asi, %r18
	.word 0x83a20829  ! 517: FADDs	fadds	%f8, %f9, %f1
	.word 0xc5222b00  ! 518: STF_I	st	%f2, [0x0b00, %r8]
	.word 0x845a0009  ! 519: SMUL_R	smul 	%r8, %r9, %r2
	.word 0xc8ea1009  ! 520: LDSTUBA_R	ldstuba	%r4, [%r8 + %r9] 0x80
	.word 0xc85a28a8  ! 521: LDX_I	ldx	[%r8 + 0x08a8], %r4
	.word 0xc93a0009  ! 522: STDF_R	std	%f4, [%r9, %r8]
	.word 0x8143e009  ! 523: MEMBAR	membar	#LoadLoad | #StoreStore 
	.word 0x88f20009  ! 524: UDIVcc_R	udivcc 	%r8, %r9, %r4
	.word 0xc86a0009  ! 525: LDSTUB_R	ldstub	%r4, [%r8 + %r9]
	.word 0x856a28fc  ! 526: SDIVX_I	sdivx	%r8, 0x08fc, %r2
	.word 0xcd222f48  ! 527: STF_I	st	%f6, [0x0f48, %r8]
	.word 0xf0aa1009  ! 528: STBA_R	stba	%r24, [%r8 + %r9] 0x80
	.word 0xcff21009  ! 529: CASXA_I	casxa	[%r8] 0x80, %r9, %r7
	.word 0x30800004  ! 530: BA	ba,a	<label_0x4>
	.word 0x8143e02f  ! 531: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #MemIssue 
	.word 0x8a520009  ! 532: UMUL_R	umul 	%r8, %r9, %r5
	.word 0xfaaa28d4  ! 533: STBA_I	stba	%r29, [%r8 + 0x08d4] %asi
	.word 0xbed20009  ! 534: UMULcc_R	umulcc 	%r8, %r9, %r31
	.word 0x8143c000  ! 535: STBAR	stbar
	.word 0xde5a0009  ! 536: LDX_R	ldx	[%r8 + %r9], %r15
	.word 0xc6aa2700  ! 537: STBA_I	stba	%r3, [%r8 + 0x0700] %asi
	.word 0xcea21009  ! 538: STWA_R	stwa	%r7, [%r8 + %r9] 0x80
	.word 0xc2b22698  ! 539: STHA_I	stha	%r1, [%r8 + 0x0698] %asi
	.word 0x2ac20004  ! 540: BRNZ	brnz,a,nt	%8,<label_0x20004>
	.word 0x8143e032  ! 541: MEMBAR	membar	#StoreLoad | #Lookaside | #MemIssue 
	.word 0xb1a208a9  ! 542: FSUBs	fsubs	%f8, %f9, %f24
	.word 0x2eca0004  ! 543: BRGEZ	brgez,a,pt	%8,<label_0xa0004>
	.word 0xc2520009  ! 544: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xc87a0009  ! 545: SWAP_R	swap	%r4, [%r8 + %r9]
	.word 0xcefa22c4  ! 546: SWAPA_I	swapa	%r7, [%r8 + 0x02c4] %asi
	.word 0xc47a2c54  ! 547: SWAP_I	swap	%r2, [%r8 + 0x0c54]
	.word 0xc36a261c  ! 548: PREFETCH_I	prefetch	[%r8 + 0x061c], #one_read
	.word 0xc60221cc  ! 549: LDUW_I	lduw	[%r8 + 0x01cc], %r3
	.word 0xbad20009  ! 550: UMULcc_R	umulcc 	%r8, %r9, %r29
	.word 0xceea2ecc  ! 551: LDSTUBA_I	ldstuba	%r7, [%r8 + 0x0ecc] %asi
	.word 0x8143e021  ! 552: MEMBAR	membar	#LoadLoad | #MemIssue 
	.word 0x8143e067  ! 553: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #MemIssue | #Sync 
	.word 0x8143c000  ! 554: STBAR	stbar
	.word 0x8a7a0009  ! 555: SDIV_R	sdiv 	%r8, %r9, %r5
	.word 0xca6a25d0  ! 556: LDSTUB_I	ldstub	%r5, [%r8 + 0x05d0]
	.word 0x20800004  ! 557: BN	bn,a	<label_0x4>
	.word 0x8143c000  ! 558: STBAR	stbar
	.word 0x24800004  ! 559: BLE	ble,a	<label_0x4>
	.word 0xc40a2eec  ! 560: LDUB_I	ldub	[%r8 + 0x0eec], %r2
	.word 0x8143e019  ! 561: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside 
	.word 0xcbe22009  ! 562: CASA_R	casa	[%r8] %asi, %r9, %r5
	.word 0x88f20009  ! 563: UDIVcc_R	udivcc 	%r8, %r9, %r4
	.word 0x8f6a0009  ! 564: SDIVX_R	sdivx	%r8, %r9, %r7
	.word 0xc36a24dc  ! 565: PREFETCH_I	prefetch	[%r8 + 0x04dc], #one_read
	.word 0xf6f21009  ! 566: STXA_R	stxa	%r27, [%r8 + %r9] 0x80
	.word 0xfa8a1009  ! 567: LDUBA_R	lduba	[%r8, %r9] 0x80, %r29
	.word 0x84522fa4  ! 569: UMUL_I	umul 	%r8, 0x0fa4, %r2
	.word 0xc7222e84  ! 570: STF_I	st	%f3, [0x0e84, %r8]
	.word 0xfed2208c  ! 571: LDSHA_I	ldsha	[%r8, + 0x008c] %asi, %r31
	.word 0x8c6a2a40  ! 572: UDIVX_I	udivx 	%r8, 0x0a40, %r6
	.word 0xf41a0009  ! 573: LDD_R	ldd	[%r8 + %r9], %r26
	.word 0xc49228c8  ! 574: LDUHA_I	lduha	[%r8, + 0x08c8] %asi, %r2
	.word 0xc2fa1009  ! 575: SWAPA_R	swapa	%r1, [%r8 + %r9] 0x80
	.word 0xde4a0009  ! 576: LDSB_R	ldsb	[%r8 + %r9], %r15
	.word 0x8143e008  ! 577: MEMBAR	membar	#StoreStore 
	.word 0xc3ea2a2c  ! 578: PREFETCHA_I	prefetcha	[%r8, + 0x0a2c] %asi, #one_read
	.word 0xcc6a0009  ! 579: LDSTUB_R	ldstub	%r6, [%r8 + %r9]
	.word 0xce8a1009  ! 581: LDUBA_R	lduba	[%r8, %r9] 0x80, %r7
	.word 0x0c800004  ! 582: BNEG	bneg  	<label_0x4>
	.word 0xc2b21009  ! 583: STHA_R	stha	%r1, [%r8 + %r9] 0x80
	.word 0x87220009  ! 584: MULScc_R	mulscc 	%r8, %r9, %r3
	.word 0x884a0009  ! 585: MULX_R	mulx 	%r8, %r9, %r4
	.word 0x89a20829  ! 586: FADDs	fadds	%f8, %f9, %f4
	.word 0x8143e056  ! 587: MEMBAR	membar	#StoreLoad | #LoadStore | #Lookaside | #Sync 
	.word 0x8143e044  ! 588: MEMBAR	membar	#LoadStore | #Sync 
	.word 0x8143e01f  ! 589: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #Lookaside 
	.word 0x886a0009  ! 590: UDIVX_R	udivx 	%r8, %r9, %r4
	.word 0xc36a2a20  ! 591: PREFETCH_I	prefetch	[%r8 + 0x0a20], #one_read
	.word 0x00800004  ! 592: BN	bn  	<label_0x4>
	.word 0x2ec20008  ! 594: BRGEZ	brgez,a,nt	%8,<label_0x20008>
	.word 0xc8f22e70  ! 595: STXA_I	stxa	%r4, [%r8 + 0x0e70] %asi
	.word 0x8143e066  ! 597: MEMBAR	membar	#StoreLoad | #LoadStore | #MemIssue | #Sync 
	.word 0xf7e21009  ! 599: CASA_I	casa	[%r8] 0x80, %r9, %r27
	.word 0xcca22c3c  ! 600: STWA_I	stwa	%r6, [%r8 + 0x0c3c] %asi
	.word 0x864a266c  ! 601: MULX_I	mulx 	%r8, 0x066c, %r3
	.word 0xa06a0009  ! 602: UDIVX_R	udivx 	%r8, %r9, %r16
	.word 0xc8c22508  ! 603: LDSWA_I	ldswa	[%r8, + 0x0508] %asi, %r4
	.word 0xd6821009  ! 604: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r11
	.word 0x36800004  ! 605: BGE	bge,a	<label_0x4>
	.word 0x8ad20009  ! 606: UMULcc_R	umulcc 	%r8, %r9, %r5
	.word 0x86522e0c  ! 607: UMUL_I	umul 	%r8, 0x0e0c, %r3
	.word 0xcaf21009  ! 608: STXA_R	stxa	%r5, [%r8 + %r9] 0x80
	.word 0xc3ea2248  ! 609: PREFETCHA_I	prefetcha	[%r8, + 0x0248] %asi, #one_read
	.word 0x9c7a2440  ! 610: SDIV_I	sdiv 	%r8, 0x0440, %r14
	.word 0x2a800004  ! 611: BCS	bcs,a	<label_0x4>
	.word 0xc64a29e0  ! 612: LDSB_I	ldsb	[%r8 + 0x09e0], %r3
	.word 0xd8f22c20  ! 613: STXA_I	stxa	%r12, [%r8 + 0x0c20] %asi
	.word 0x8da20829  ! 614: FADDs	fadds	%f8, %f9, %f6
	.word 0xcef226f8  ! 615: STXA_I	stxa	%r7, [%r8 + 0x06f8] %asi
	.word 0xd53a2990  ! 616: STDF_I	std	%f10, [0x0990, %r8]
	.word 0xeada1009  ! 618: LDXA_R	ldxa	[%r8, %r9] 0x80, %r21
	.word 0xc3222528  ! 619: STF_I	st	%f1, [0x0528, %r8]
	.word 0xc6020009  ! 620: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xbfa20829  ! 621: FADDs	fadds	%f8, %f9, %f31
	.word 0x28800004  ! 622: BLEU	bleu,a	<label_0x4>
	.word 0xc36a25e0  ! 623: PREFETCH_I	prefetch	[%r8 + 0x05e0], #one_read
	.word 0x86722750  ! 624: UDIV_I	udiv 	%r8, 0x0750, %r3
	.word 0x84f20009  ! 625: UDIVcc_R	udivcc 	%r8, %r9, %r2
	.word 0xbc720009  ! 626: UDIV_R	udiv 	%r8, %r9, %r30
	.word 0x8143c000  ! 627: STBAR	stbar
	.word 0x8efa0009  ! 628: SDIVcc_R	sdivcc 	%r8, %r9, %r7
	.word 0xd8420009  ! 629: LDSW_R	ldsw	[%r8 + %r9], %r12
	.word 0x8143e03e  ! 630: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0x22c20004  ! 631: BRZ	brz,a,nt	%8,<label_0x20004>
	.word 0xda122b14  ! 632: LDUH_I	lduh	[%r8 + 0x0b14], %r13
	.word 0xccaa1009  ! 633: STBA_R	stba	%r6, [%r8 + %r9] 0x80
	.word 0xc45a0009  ! 634: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xc36a2f28  ! 635: PREFETCH_I	prefetch	[%r8 + 0x0f28], #one_read
	.word 0x8143c000  ! 636: STBAR	stbar
	.word 0x8b6a0009  ! 637: SDIVX_R	sdivx	%r8, %r9, %r5
	.word 0x88f22320  ! 638: UDIVcc_I	udivcc 	%r8, 0x0320, %r4
	.word 0xc93a0009  ! 639: STDF_R	std	%f4, [%r9, %r8]
	.word 0xc41a26d0  ! 640: LDD_I	ldd	[%r8 + 0x06d0], %r2
	.word 0x8a6a0009  ! 641: UDIVX_R	udivx 	%r8, %r9, %r5
	.word 0x8143c000  ! 642: STBAR	stbar
	.word 0xce4a2b7c  ! 643: LDSB_I	ldsb	[%r8 + 0x0b7c], %r7
	.word 0x9b2229b0  ! 644: MULScc_I	mulscc 	%r8, 0x09b0, %r13
	.word 0x28800004  ! 645: BLEU	bleu,a	<label_0x4>
	.word 0x8a7a2d8c  ! 647: SDIV_I	sdiv 	%r8, 0x0d8c, %r5
	.word 0xc2921009  ! 648: LDUHA_R	lduha	[%r8, %r9] 0x80, %r1
	.word 0x87a20929  ! 649: FMULs	fmuls	%f8, %f9, %f3
	.word 0xca0a0009  ! 650: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xf4ba25d8  ! 651: STDA_I	stda	%r26, [%r8 + 0x05d8] %asi
	.word 0x85a209a9  ! 652: FDIVs	fdivs	%f8, %f9, %f2
	.word 0x2e800008  ! 653: BVS	bvs,a	<label_0x8>
	.word 0xc44a0009  ! 654: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0x8143e012  ! 655: MEMBAR	membar	#StoreLoad | #Lookaside 
	.word 0x8143c000  ! 656: STBAR	stbar
	.word 0xa04a27ec  ! 657: MULX_I	mulx 	%r8, 0x07ec, %r16
	.word 0xc24a25f4  ! 658: LDSB_I	ldsb	[%r8 + 0x05f4], %r1
	.word 0xccf21009  ! 659: STXA_R	stxa	%r6, [%r8 + %r9] 0x80
	.word 0xf7f22009  ! 660: CASXA_R	casxa	[%r8]%asi, %r9, %r27
	.word 0xc6c21009  ! 661: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r3
	.word 0xc36a2494  ! 662: PREFETCH_I	prefetch	[%r8 + 0x0494], #one_read
	.word 0xcada1009  ! 663: LDXA_R	ldxa	[%r8, %r9] 0x80, %r5
	.word 0xc3220009  ! 665: STF_R	st	%f1, [%r9, %r8]
	.word 0xf2aa1009  ! 666: STBA_R	stba	%r25, [%r8 + %r9] 0x80
	.word 0xc7f22009  ! 667: CASXA_R	casxa	[%r8]%asi, %r9, %r3
	.word 0xfff22009  ! 668: CASXA_R	casxa	[%r8]%asi, %r9, %r31
	.word 0xc65a0009  ! 669: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xc4fa1009  ! 670: SWAPA_R	swapa	%r2, [%r8 + %r9] 0x80
	.word 0x84522660  ! 671: UMUL_I	umul 	%r8, 0x0660, %r2
	.word 0xcef21009  ! 672: STXA_R	stxa	%r7, [%r8 + %r9] 0x80
	.word 0x847a2048  ! 673: SDIV_I	sdiv 	%r8, 0x0048, %r2
	.word 0xc8fa1009  ! 674: SWAPA_R	swapa	%r4, [%r8 + %r9] 0x80
	.word 0xce520009  ! 675: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0x8a720009  ! 676: UDIV_R	udiv 	%r8, %r9, %r5
	.word 0xc8ea2a7c  ! 677: LDSTUBA_I	ldstuba	%r4, [%r8 + 0x0a7c] %asi
	.word 0x8143e00b  ! 678: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore 
	.word 0xc842293c  ! 679: LDSW_I	ldsw	[%r8 + 0x093c], %r4
	.word 0xd41a2ea8  ! 680: LDD_I	ldd	[%r8 + 0x0ea8], %r10
	.word 0x8143e068  ! 681: MEMBAR	membar	#StoreStore | #MemIssue | #Sync 
	.word 0xfed21009  ! 682: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r31
	.word 0xfc0a2a00  ! 683: LDUB_I	ldub	[%r8 + 0x0a00], %r30
	.word 0xc3ea2a9c  ! 684: PREFETCHA_I	prefetcha	[%r8, + 0x0a9c] %asi, #one_read
	.word 0xc6aa27b0  ! 685: STBA_I	stba	%r3, [%r8 + 0x07b0] %asi
	.word 0x0e800008  ! 686: BVS	bvs  	<label_0x8>
	.word 0x88da0009  ! 687: SMULcc_R	smulcc 	%r8, %r9, %r4
	.word 0xcc6a2100  ! 688: LDSTUB_I	ldstub	%r6, [%r8 + 0x0100]
	.word 0xccfa1009  ! 689: SWAPA_R	swapa	%r6, [%r8 + %r9] 0x80
	.word 0xb66a2738  ! 690: UDIVX_I	udivx 	%r8, 0x0738, %r27
	.word 0xc8aa1009  ! 691: STBA_R	stba	%r4, [%r8 + %r9] 0x80
	.word 0xb36a2c24  ! 692: SDIVX_I	sdivx	%r8, 0x0c24, %r25
	.word 0xca522f78  ! 693: LDSH_I	ldsh	[%r8 + 0x0f78], %r5
	.word 0x8143c000  ! 694: STBAR	stbar
	.word 0x83a208a9  ! 695: FSUBs	fsubs	%f8, %f9, %f1
	.word 0x8143c000  ! 696: STBAR	stbar
	.word 0xd6921009  ! 697: LDUHA_R	lduha	[%r8, %r9] 0x80, %r11
	.word 0xba4a2528  ! 698: MULX_I	mulx 	%r8, 0x0528, %r29
	.word 0xc6a2248c  ! 699: STWA_I	stwa	%r3, [%r8 + 0x048c] %asi
	.word 0xb9a208a9  ! 700: FSUBs	fsubs	%f8, %f9, %f28
	.word 0xc28a2958  ! 701: LDUBA_I	lduba	[%r8, + 0x0958] %asi, %r1
	.word 0xc2b22648  ! 702: STHA_I	stha	%r1, [%r8 + 0x0648] %asi
	.word 0x8eda0009  ! 703: SMULcc_R	smulcc 	%r8, %r9, %r7
	.word 0xe73a2648  ! 704: STDF_I	std	%f19, [0x0648, %r8]
	.word 0xeeb21009  ! 705: STHA_R	stha	%r23, [%r8 + %r9] 0x80
	.word 0xc3ea2ec4  ! 706: PREFETCHA_I	prefetcha	[%r8, + 0x0ec4] %asi, #one_read
	.word 0x8e6a21a4  ! 707: UDIVX_I	udivx 	%r8, 0x01a4, %r7
	.word 0x896a2134  ! 708: SDIVX_I	sdivx	%r8, 0x0134, %r4
	.word 0x8143c000  ! 709: STBAR	stbar
	.word 0x865a0009  ! 710: SMUL_R	smul 	%r8, %r9, %r3
	.word 0x26800004  ! 711: BL	bl,a	<label_0x4>
	.word 0x8143c000  ! 712: STBAR	stbar
	.word 0x965a29e4  ! 713: SMUL_I	smul 	%r8, 0x09e4, %r11
	.word 0xce4a27a0  ! 714: LDSB_I	ldsb	[%r8 + 0x07a0], %r7
	.word 0x8143e038  ! 715: MEMBAR	membar	#StoreStore | #Lookaside | #MemIssue 
	.word 0xecf22150  ! 716: STXA_I	stxa	%r22, [%r8 + 0x0150] %asi
	.word 0xafa20929  ! 717: FMULs	fmuls	%f8, %f9, %f23
	.word 0xc6020009  ! 718: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xc4f21009  ! 719: STXA_R	stxa	%r2, [%r8 + %r9] 0x80
	.word 0xd4822578  ! 720: LDUWA_I	lduwa	[%r8, + 0x0578] %asi, %r10
	.word 0xb5a20829  ! 721: FADDs	fadds	%f8, %f9, %f26
	.word 0xccca1009  ! 722: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r6
	.word 0xe4b21009  ! 723: STHA_R	stha	%r18, [%r8 + %r9] 0x80
	.word 0x24ca0004  ! 724: BRLEZ	brlez,a,pt	%8,<label_0xa0004>
	.word 0x94fa0009  ! 725: SDIVcc_R	sdivcc 	%r8, %r9, %r10
	.word 0xb76a20e4  ! 726: SDIVX_I	sdivx	%r8, 0x00e4, %r27
	.word 0x02c20004  ! 727: BRZ	brz  ,nt	%8,<label_0x20004>
	.word 0x2e800008  ! 728: BVS	bvs,a	<label_0x8>
	.word 0xcde21009  ! 729: CASA_I	casa	[%r8] 0x80, %r9, %r6
	.word 0x8f6a2884  ! 730: SDIVX_I	sdivx	%r8, 0x0884, %r7
	.word 0x8ba20929  ! 731: FMULs	fmuls	%f8, %f9, %f5
	.word 0x0ac20008  ! 732: BRNZ	brnz  ,nt	%8,<label_0x20008>
	.word 0xf0fa1009  ! 733: SWAPA_R	swapa	%r24, [%r8 + %r9] 0x80
	.word 0xccea2000  ! 734: LDSTUBA_I	ldstuba	%r6, [%r8 + 0x0000] %asi
	.word 0xca120009  ! 735: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xf8ba1009  ! 736: STDA_R	stda	%r28, [%r8 + %r9] 0x80
	.word 0x94d2221c  ! 737: UMULcc_I	umulcc 	%r8, 0x021c, %r10
	.word 0xf9e21009  ! 738: CASA_I	casa	[%r8] 0x80, %r9, %r28
	.word 0xe4ba2628  ! 739: STDA_I	stda	%r18, [%r8 + 0x0628] %asi
	.word 0xcab21009  ! 740: STHA_R	stha	%r5, [%r8 + %r9] 0x80
	.word 0xbd6a29d8  ! 741: SDIVX_I	sdivx	%r8, 0x09d8, %r30
	.word 0xca5a0009  ! 742: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0x884a0009  ! 743: MULX_R	mulx 	%r8, %r9, %r4
	.word 0xc442213c  ! 744: LDSW_I	ldsw	[%r8 + 0x013c], %r2
	.word 0xbe7a2200  ! 745: SDIV_I	sdiv 	%r8, 0x0200, %r31
	.word 0xc36a28c4  ! 746: PREFETCH_I	prefetch	[%r8 + 0x08c4], #one_read
	.word 0xee52200c  ! 748: LDSH_I	ldsh	[%r8 + 0x000c], %r23
	.word 0xc46a28bc  ! 749: LDSTUB_I	ldstub	%r2, [%r8 + 0x08bc]
	.word 0x8a520009  ! 750: UMUL_R	umul 	%r8, %r9, %r5
	.word 0x28800008  ! 751: BLEU	bleu,a	<label_0x8>
	.word 0x8cd20009  ! 752: UMULcc_R	umulcc 	%r8, %r9, %r6
	.word 0x8143c000  ! 753: STBAR	stbar
	.word 0x8fa20929  ! 754: FMULs	fmuls	%f8, %f9, %f7
	.word 0x825a0009  ! 755: SMUL_R	smul 	%r8, %r9, %r1
	.word 0xcb3a26f0  ! 756: STDF_I	std	%f5, [0x06f0, %r8]
	.word 0xf6022184  ! 757: LDUW_I	lduw	[%r8 + 0x0184], %r27
	.word 0x9da208a9  ! 758: FSUBs	fsubs	%f8, %f9, %f14
	.word 0xc3ea27bc  ! 759: PREFETCHA_I	prefetcha	[%r8, + 0x07bc] %asi, #one_read
	.word 0xca420009  ! 760: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xc8c224b8  ! 762: LDSWA_I	ldswa	[%r8, + 0x04b8] %asi, %r4
	.word 0x8143e063  ! 764: MEMBAR	membar	#LoadLoad | #StoreLoad | #MemIssue | #Sync 
	.word 0x8ba20929  ! 766: FMULs	fmuls	%f8, %f9, %f5
	.word 0x2c800004  ! 767: BNEG	bneg,a	<label_0x4>
	.word 0xc88a1009  ! 769: LDUBA_R	lduba	[%r8, %r9] 0x80, %r4
	.word 0x8143c000  ! 770: STBAR	stbar
	.word 0x89a209a9  ! 771: FDIVs	fdivs	%f8, %f9, %f4
	.word 0x844a0009  ! 772: MULX_R	mulx 	%r8, %r9, %r2
	.word 0x8143c000  ! 773: STBAR	stbar
	.word 0xd73a0009  ! 774: STDF_R	std	%f11, [%r9, %r8]
	.word 0xce020009  ! 775: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0x8143e05d  ! 776: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0xc32223fc  ! 777: STF_I	st	%f1, [0x03fc, %r8]
	.word 0xcdf22009  ! 778: CASXA_R	casxa	[%r8]%asi, %r9, %r6
	.word 0x8472232c  ! 779: UDIV_I	udiv 	%r8, 0x032c, %r2
	.word 0x8143c000  ! 780: STBAR	stbar
	.word 0xbad20009  ! 781: UMULcc_R	umulcc 	%r8, %r9, %r29
	.word 0x886a0009  ! 782: UDIVX_R	udivx 	%r8, %r9, %r4
	.word 0xc5f21009  ! 783: CASXA_I	casxa	[%r8] 0x80, %r9, %r2
	.word 0xe09a1009  ! 784: LDDA_R	ldda	[%r8, %r9] 0x80, %r16
	.word 0xa2d22b8c  ! 785: UMULcc_I	umulcc 	%r8, 0x0b8c, %r17
	.word 0xecda1009  ! 786: LDXA_R	ldxa	[%r8, %r9] 0x80, %r22
	.word 0xc3ea2140  ! 787: PREFETCHA_I	prefetcha	[%r8, + 0x0140] %asi, #one_read
	.word 0xf7e22009  ! 788: CASA_R	casa	[%r8] %asi, %r9, %r27
	.word 0xb1a20929  ! 789: FMULs	fmuls	%f8, %f9, %f24
	.word 0xf0b21009  ! 790: STHA_R	stha	%r24, [%r8 + %r9] 0x80
	.word 0xc2922b9c  ! 791: LDUHA_I	lduha	[%r8, + 0x0b9c] %asi, %r1
	.word 0x8cd22480  ! 792: UMULcc_I	umulcc 	%r8, 0x0480, %r6
	.word 0x8143c000  ! 793: STBAR	stbar
	.word 0xceb21009  ! 794: STHA_R	stha	%r7, [%r8 + %r9] 0x80
	.word 0xcf3a0009  ! 795: STDF_R	std	%f7, [%r9, %r8]
	.word 0xfcd22d98  ! 796: LDSHA_I	ldsha	[%r8, + 0x0d98] %asi, %r30
	.word 0xca0a0009  ! 798: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xc2ea1009  ! 799: LDSTUBA_R	ldstuba	%r1, [%r8 + %r9] 0x80
	.word 0xca8a2484  ! 800: LDUBA_I	lduba	[%r8, + 0x0484] %asi, %r5
	.word 0xcec21009  ! 801: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r7
	.word 0x836a23f4  ! 802: SDIVX_I	sdivx	%r8, 0x03f4, %r1
	.word 0xd86a29c8  ! 803: LDSTUB_I	ldstub	%r12, [%r8 + 0x09c8]
	.word 0xc6a21009  ! 804: STWA_R	stwa	%r3, [%r8 + %r9] 0x80
	.word 0xcada2370  ! 805: LDXA_I	ldxa	[%r8, + 0x0370] %asi, %r5
	.word 0xc36a2490  ! 806: PREFETCH_I	prefetch	[%r8 + 0x0490], #one_read
	.word 0x0c800008  ! 807: BNEG	bneg  	<label_0x8>
	.word 0xdd3a2190  ! 808: STDF_I	std	%f14, [0x0190, %r8]
	.word 0x8143c000  ! 809: STBAR	stbar
	.word 0x16800004  ! 810: BGE	bge  	<label_0x4>
	.word 0xb8f20009  ! 811: UDIVcc_R	udivcc 	%r8, %r9, %r28
	.word 0xcb222620  ! 812: STF_I	st	%f5, [0x0620, %r8]
	.word 0xead21009  ! 813: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r21
	.word 0x8143e050  ! 814: MEMBAR	membar	#Lookaside | #Sync 
	.word 0x1e800008  ! 815: BVC	bvc  	<label_0x8>
	.word 0x85a20829  ! 816: FADDs	fadds	%f8, %f9, %f2
	.word 0x8b220009  ! 818: MULScc_R	mulscc 	%r8, %r9, %r5
	.word 0x3c800008  ! 819: BPOS	bpos,a	<label_0x8>
	.word 0xcc8a2700  ! 820: LDUBA_I	lduba	[%r8, + 0x0700] %asi, %r6
	.word 0x8143c000  ! 821: STBAR	stbar
	.word 0x844a0009  ! 822: MULX_R	mulx 	%r8, %r9, %r2
	.word 0xc84a0009  ! 823: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0x8d6a0009  ! 824: SDIVX_R	sdivx	%r8, %r9, %r6
	.word 0x8143c000  ! 825: STBAR	stbar
	.word 0x2e800004  ! 826: BVS	bvs,a	<label_0x4>
	.word 0xfcc223b4  ! 827: LDSWA_I	ldswa	[%r8, + 0x03b4] %asi, %r30
	.word 0xc3ea24cc  ! 828: PREFETCHA_I	prefetcha	[%r8, + 0x04cc] %asi, #one_read
	.word 0x8f6a0009  ! 829: SDIVX_R	sdivx	%r8, %r9, %r7
	.word 0xca821009  ! 831: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r5
	.word 0x2cca0008  ! 832: BRGZ	brgz,a,pt	%8,<label_0xa0008>
	.word 0xf60a0009  ! 833: LDUB_R	ldub	[%r8 + %r9], %r27
	.word 0xc6ca1009  ! 834: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r3
	.word 0xe4ca1009  ! 835: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r18
	.word 0x8143c000  ! 836: STBAR	stbar
	.word 0xc26a2fa4  ! 837: LDSTUB_I	ldstub	%r1, [%r8 + 0x0fa4]
	.word 0xc9220009  ! 838: STF_R	st	%f4, [%r9, %r8]
	.word 0xc2420009  ! 839: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xfeda2c80  ! 840: LDXA_I	ldxa	[%r8, + 0x0c80] %asi, %r31
	.word 0xc5f21009  ! 841: CASXA_I	casxa	[%r8] 0x80, %r9, %r2
	.word 0xa6d20009  ! 842: UMULcc_R	umulcc 	%r8, %r9, %r19
	.word 0xc4b21009  ! 843: STHA_R	stha	%r2, [%r8 + %r9] 0x80
	.word 0xf8c22ffc  ! 844: LDSWA_I	ldswa	[%r8, + 0x0ffc] %asi, %r28
	.word 0x8143e059  ! 845: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside | #Sync 
	.word 0x9f6a0009  ! 846: SDIVX_R	sdivx	%r8, %r9, %r15
	.word 0x8da20929  ! 847: FMULs	fmuls	%f8, %f9, %f6
	.word 0xc6c22754  ! 848: LDSWA_I	ldswa	[%r8, + 0x0754] %asi, %r3
	.word 0xc36a2d74  ! 849: PREFETCH_I	prefetch	[%r8 + 0x0d74], #one_read
	.word 0x8143c000  ! 850: STBAR	stbar
	.word 0xcb3a0009  ! 851: STDF_R	std	%f5, [%r9, %r8]
	.word 0xc8aa27ac  ! 852: STBA_I	stba	%r4, [%r8 + 0x07ac] %asi
	.word 0xa06a0009  ! 853: UDIVX_R	udivx 	%r8, %r9, %r16
	.word 0xb85a2f38  ! 854: SMUL_I	smul 	%r8, 0x0f38, %r28
	.word 0x82d223ec  ! 855: UMULcc_I	umulcc 	%r8, 0x03ec, %r1
	.word 0xcb2226d4  ! 856: STF_I	st	%f5, [0x06d4, %r8]
	.word 0x8a7a2e8c  ! 857: SDIV_I	sdiv 	%r8, 0x0e8c, %r5
	.word 0x8143c000  ! 858: STBAR	stbar
	.word 0x8143c000  ! 859: STBAR	stbar
	.word 0x22ca0008  ! 860: BRZ	brz,a,pt	%8,<label_0xa0008>
	.word 0x18800004  ! 861: BGU	bgu  	<label_0x4>
	.word 0xc73a2888  ! 862: STDF_I	std	%f3, [0x0888, %r8]
	.word 0x82d20009  ! 863: UMULcc_R	umulcc 	%r8, %r9, %r1
	.word 0x8143c000  ! 864: STBAR	stbar
	.word 0xf09a1009  ! 865: LDDA_R	ldda	[%r8, %r9] 0x80, %r24
	.word 0xeeb21009  ! 866: STHA_R	stha	%r23, [%r8 + %r9] 0x80
	.word 0xdc1a0009  ! 867: LDD_R	ldd	[%r8 + %r9], %r14
	.word 0xc7220009  ! 868: STF_R	st	%f3, [%r9, %r8]
	.word 0xf85a0009  ! 869: LDX_R	ldx	[%r8 + %r9], %r28
	.word 0xc8da27b8  ! 870: LDXA_I	ldxa	[%r8, + 0x07b8] %asi, %r4
	.word 0xc36a23f8  ! 871: PREFETCH_I	prefetch	[%r8 + 0x03f8], #one_read
	.word 0xbc5a2f44  ! 872: SMUL_I	smul 	%r8, 0x0f44, %r30
	.word 0xf00227e8  ! 873: LDUW_I	lduw	[%r8 + 0x07e8], %r24
	.word 0xc80a2be4  ! 874: LDUB_I	ldub	[%r8 + 0x0be4], %r4
	.word 0xda822904  ! 875: LDUWA_I	lduwa	[%r8, + 0x0904] %asi, %r13
	.word 0x8e7a2528  ! 876: SDIV_I	sdiv 	%r8, 0x0528, %r7
	.word 0x9a7a2d68  ! 877: SDIV_I	sdiv 	%r8, 0x0d68, %r13
	.word 0x8143c000  ! 878: STBAR	stbar
	.word 0x8143e004  ! 879: MEMBAR	membar	#LoadStore 
	.word 0x8e52264c  ! 880: UMUL_I	umul 	%r8, 0x064c, %r7
	.word 0x8143e020  ! 881: MEMBAR	membar	#MemIssue 
	.word 0x8143c000  ! 882: STBAR	stbar
	.word 0x82722e14  ! 883: UDIV_I	udiv 	%r8, 0x0e14, %r1
	.word 0xec1a0009  ! 884: LDD_R	ldd	[%r8 + %r9], %r22
	.word 0xe3220009  ! 885: STF_R	st	%f17, [%r9, %r8]
	.word 0x8143e029  ! 886: MEMBAR	membar	#LoadLoad | #StoreStore | #MemIssue 
	.word 0x885a23ac  ! 887: SMUL_I	smul 	%r8, 0x03ac, %r4
	.word 0xc36a256c  ! 888: PREFETCH_I	prefetch	[%r8 + 0x056c], #one_read
	.word 0xc8d21009  ! 890: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r4
	.word 0xcafa2b24  ! 891: SWAPA_I	swapa	%r5, [%r8 + 0x0b24] %asi
	.word 0xc4ba2748  ! 893: STDA_I	stda	%r2, [%r8 + 0x0748] %asi
	.word 0xeeea1009  ! 894: LDSTUBA_R	ldstuba	%r23, [%r8 + %r9] 0x80
	.word 0x8143e054  ! 895: MEMBAR	membar	#LoadStore | #Lookaside | #Sync 
	.word 0xc2420009  ! 896: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xe602230c  ! 897: LDUW_I	lduw	[%r8 + 0x030c], %r19
	.word 0xf28a2134  ! 898: LDUBA_I	lduba	[%r8, + 0x0134] %asi, %r25
	.word 0x83220009  ! 899: MULScc_R	mulscc 	%r8, %r9, %r1
	.word 0x8143e009  ! 900: MEMBAR	membar	#LoadLoad | #StoreStore 
	.word 0x2c800004  ! 901: BNEG	bneg,a	<label_0x4>
	.word 0xe0522540  ! 902: LDSH_I	ldsh	[%r8 + 0x0540], %r16
	.word 0xc4ca1009  ! 903: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r2
	.word 0xfa7a0009  ! 904: SWAP_R	swap	%r29, [%r8 + %r9]
	.word 0x8cd22250  ! 905: UMULcc_I	umulcc 	%r8, 0x0250, %r6
	.word 0xc88227cc  ! 906: LDUWA_I	lduwa	[%r8, + 0x07cc] %asi, %r4
	.word 0x2a800008  ! 907: BCS	bcs,a	<label_0x8>
	.word 0x8143c000  ! 908: STBAR	stbar
	.word 0xc93a0009  ! 909: STDF_R	std	%f4, [%r9, %r8]
	.word 0xea4a2110  ! 910: LDSB_I	ldsb	[%r8 + 0x0110], %r21
	.word 0xc6da1009  ! 911: LDXA_R	ldxa	[%r8, %r9] 0x80, %r3
	.word 0xc47a27b0  ! 912: SWAP_I	swap	%r2, [%r8 + 0x07b0]
	.word 0x8143e072  ! 913: MEMBAR	membar	#StoreLoad | #Lookaside | #MemIssue | #Sync 
	.word 0x84d22518  ! 914: UMULcc_I	umulcc 	%r8, 0x0518, %r2
	.word 0xce0a0009  ! 915: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xf2ea255c  ! 916: LDSTUBA_I	ldstuba	%r25, [%r8 + 0x055c] %asi
	.word 0xc3f21009  ! 917: CASXA_I	casxa	[%r8] 0x80, %r9, %r1
	.word 0xc46a2294  ! 918: LDSTUB_I	ldstub	%r2, [%r8 + 0x0294]
	.word 0xc3ea2ba8  ! 919: PREFETCHA_I	prefetcha	[%r8, + 0x0ba8] %asi, #one_read
	.word 0xcb3a0009  ! 920: STDF_R	std	%f5, [%r9, %r8]
	.word 0x8143c000  ! 921: STBAR	stbar
	.word 0xcc5a0009  ! 922: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0x24800008  ! 923: BLE	ble,a	<label_0x8>
	.word 0xc72223a8  ! 924: STF_I	st	%f3, [0x03a8, %r8]
	.word 0xdefa1009  ! 927: SWAPA_R	swapa	%r15, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 928: STBAR	stbar
	.word 0xe0ba2b80  ! 929: STDA_I	stda	%r16, [%r8 + 0x0b80] %asi
	.word 0xca0a29a0  ! 931: LDUB_I	ldub	[%r8 + 0x09a0], %r5
	.word 0x8fa208a9  ! 932: FSUBs	fsubs	%f8, %f9, %f7
	.word 0x2ac20004  ! 933: BRNZ	brnz,a,nt	%8,<label_0x20004>
	.word 0x825a2c48  ! 934: SMUL_I	smul 	%r8, 0x0c48, %r1
	.word 0xe89a1009  ! 935: LDDA_R	ldda	[%r8, %r9] 0x80, %r20
	.word 0x0ec20004  ! 936: BRGEZ	brgez  ,nt	%8,<label_0x20004>
	.word 0x82f222e0  ! 937: UDIVcc_I	udivcc 	%r8, 0x02e0, %r1
	.word 0xc36a2334  ! 938: PREFETCH_I	prefetch	[%r8 + 0x0334], #one_read
	.word 0x40000004  ! 939: CALL	call	disp30_4
	.word 0x83a209a9  ! 940: FDIVs	fdivs	%f8, %f9, %f1
	.word 0x89a20929  ! 941: FMULs	fmuls	%f8, %f9, %f4
	.word 0x8c4a0009  ! 942: MULX_R	mulx 	%r8, %r9, %r6
	.word 0xc3220009  ! 943: STF_R	st	%f1, [%r9, %r8]
	.word 0x8143c000  ! 944: STBAR	stbar
	.word 0x40000004  ! 946: CALL	call	disp30_4
	.word 0xd46a231c  ! 947: LDSTUB_I	ldstub	%r10, [%r8 + 0x031c]
	.word 0x8b220009  ! 949: MULScc_R	mulscc 	%r8, %r9, %r5
	.word 0xf2d21009  ! 950: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r25
	.word 0x0eca0004  ! 951: BRGEZ	brgez  ,pt	%8,<label_0xa0004>
	.word 0x8e520009  ! 952: UMUL_R	umul 	%r8, %r9, %r7
	.word 0xe6921009  ! 953: LDUHA_R	lduha	[%r8, %r9] 0x80, %r19
	.word 0x8ada28cc  ! 954: SMULcc_I	smulcc 	%r8, 0x08cc, %r5
	.word 0xc89a1009  ! 955: LDDA_R	ldda	[%r8, %r9] 0x80, %r4
	.word 0xe88a2150  ! 956: LDUBA_I	lduba	[%r8, + 0x0150] %asi, %r20
	.word 0xce6a2064  ! 957: LDSTUB_I	ldstub	%r7, [%r8 + 0x0064]
	.word 0xc4d21009  ! 958: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r2
	.word 0xcf3a0009  ! 959: STDF_R	std	%f7, [%r9, %r8]
	.word 0x88fa0009  ! 960: SDIVcc_R	sdivcc 	%r8, %r9, %r4
	.word 0x83a20929  ! 961: FMULs	fmuls	%f8, %f9, %f1
	.word 0x0ac20004  ! 962: BRNZ	brnz  ,nt	%8,<label_0x20004>
	.word 0xc3ea2950  ! 963: PREFETCHA_I	prefetcha	[%r8, + 0x0950] %asi, #one_read
	.word 0x887224d8  ! 964: UDIV_I	udiv 	%r8, 0x04d8, %r4
	.word 0x8143c000  ! 965: STBAR	stbar
	.word 0xc6520009  ! 966: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0x8fa20929  ! 967: FMULs	fmuls	%f8, %f9, %f7
	.word 0x8143c000  ! 968: STBAR	stbar
	.word 0xd9e22009  ! 969: CASA_R	casa	[%r8] %asi, %r9, %r12
	.word 0x40000004  ! 970: CALL	call	disp30_4
	.word 0x8efa0009  ! 973: SDIVcc_R	sdivcc 	%r8, %r9, %r7
	.word 0x996a0009  ! 974: SDIVX_R	sdivx	%r8, %r9, %r12
	.word 0xd4520009  ! 975: LDSH_R	ldsh	[%r8 + %r9], %r10
	.word 0xcf3a0009  ! 976: STDF_R	std	%f7, [%r9, %r8]
	.word 0x847a0009  ! 977: SDIV_R	sdiv 	%r8, %r9, %r2
	.word 0xc53a2890  ! 978: STDF_I	std	%f2, [0x0890, %r8]
	.word 0x8143c000  ! 979: STBAR	stbar
	.word 0xf46a0009  ! 980: LDSTUB_R	ldstub	%r26, [%r8 + %r9]
	.word 0x8ba20929  ! 981: FMULs	fmuls	%f8, %f9, %f5
	.word 0xc36a2ca0  ! 982: PREFETCH_I	prefetch	[%r8 + 0x0ca0], #one_read
	.word 0xfe5a0009  ! 983: LDX_R	ldx	[%r8 + %r9], %r31
	.word 0x865222ac  ! 984: UMUL_I	umul 	%r8, 0x02ac, %r3
	.word 0x04800004  ! 985: BLE	ble  	<label_0x4>
	.word 0xc9f22009  ! 986: CASXA_R	casxa	[%r8]%asi, %r9, %r4
	.word 0xb2522208  ! 987: UMUL_I	umul 	%r8, 0x0208, %r25
	.word 0xe01a0009  ! 988: LDD_R	ldd	[%r8 + %r9], %r16
	.word 0x04800004  ! 989: BLE	ble  	<label_0x4>
	.word 0xf46a25fc  ! 990: LDSTUB_I	ldstub	%r26, [%r8 + 0x05fc]
	.word 0xc28a2b08  ! 991: LDUBA_I	lduba	[%r8, + 0x0b08] %asi, %r1
	.word 0xc7220009  ! 992: STF_R	st	%f3, [%r9, %r8]
	.word 0x8143e01b  ! 993: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Lookaside 
	.word 0x9ed20009  ! 994: UMULcc_R	umulcc 	%r8, %r9, %r15
	.word 0xd68a2338  ! 995: LDUBA_I	lduba	[%r8, + 0x0338] %asi, %r11
	.word 0xc2aa223c  ! 996: STBA_I	stba	%r1, [%r8 + 0x023c] %asi
	.word 0x83a209a9  ! 997: FDIVs	fdivs	%f8, %f9, %f1
	.word 0x86f22820  ! 998: UDIVcc_I	udivcc 	%r8, 0x0820, %r3
	.word 0x8143c000  ! 999: STBAR	stbar
        ta      T_GOOD_TRAP

th_main_2:
        setx  MAIN_BASE_DATA_VA, %r1, %r8
        setx  0x00000000000007b0, %g1, %r9
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
        setx  0xd9daa06e0c7457ad, %g1, %r0
        setx  0x4ae97153872ebce3, %g1, %r1
        setx  0x2fd40e5d9598e12b, %g1, %r2
        setx  0x6443ba0a8a370f63, %g1, %r3
        setx  0x129a09cd92d1cc18, %g1, %r4
        setx  0x2faf5c782d36a214, %g1, %r5
        setx  0x86c145267a1f5eaf, %g1, %r6
        setx  0x6bd45c8899f608c0, %g1, %r7
        setx  0x04e79cb66ed06514, %g1, %r10
        setx  0xfe80b4893b8189b4, %g1, %r11
        setx  0x48f149232e11dc76, %g1, %r12
        setx  0xf2fd752936a76260, %g1, %r13
        setx  0xd9584b935ad7b9a8, %g1, %r14
        setx  0x5e49a0dae10799ec, %g1, %r15
        setx  0xe5549c57675568df, %g1, %r16
        setx  0xcaddad922758bb37, %g1, %r17
        setx  0x6b75e6ea8ab61429, %g1, %r18
        setx  0x773183f018cfc03b, %g1, %r19
        setx  0xde17ecb51e3535e4, %g1, %r20
        setx  0xe2a946287f826f30, %g1, %r21
        setx  0x898ffa56d8be10ed, %g1, %r22
        setx  0xda2d7d02af626bf5, %g1, %r23
        setx  0xd4912d915490d70b, %g1, %r24
        setx  0xe0b30c9174d8cc55, %g1, %r25
        setx  0x80e7ae422f5b69ed, %g1, %r26
        setx  0xb834692889e2d0e7, %g1, %r27
        setx  0x5c14f6c3e95c88cf, %g1, %r28
        setx  0xdfd2fc4f1879bce7, %g1, %r29
        setx  0xe1d41ebdf3db4984, %g1, %r30
        setx  0xfbf6a2e748cd4d40, %g1, %r31
	.word 0xc84a0009  ! 5: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0x12800008  ! 7: BNE	bne  	<label_0x8>
	.word 0xbcfa0009  ! 9: SDIVcc_R	sdivcc 	%r8, %r9, %r30
	.word 0xbaf20009  ! 10: UDIVcc_R	udivcc 	%r8, %r9, %r29
	.word 0xb8fa0009  ! 11: SDIVcc_R	sdivcc 	%r8, %r9, %r28
	.word 0xd86a0009  ! 13: LDSTUB_R	ldstub	%r12, [%r8 + %r9]
	.word 0xfcba2a88  ! 15: STDA_I	stda	%r30, [%r8 + 0x0a88] %asi
	.word 0xfc1a0009  ! 16: LDD_R	ldd	[%r8 + %r9], %r30
	.word 0x30800004  ! 17: BA	ba,a	<label_0x4>
	.word 0x89220009  ! 18: MULScc_R	mulscc 	%r8, %r9, %r4
	.word 0xc3f21009  ! 19: CASXA_I	casxa	[%r8] 0x80, %r9, %r1
	.word 0x87a209a9  ! 20: FDIVs	fdivs	%f8, %f9, %f3
	.word 0xc4120009  ! 21: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xcd3a2438  ! 22: STDF_I	std	%f6, [0x0438, %r8]
	.word 0xcd3a2420  ! 23: STDF_I	std	%f6, [0x0420, %r8]
	.word 0xc65a0009  ! 24: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0x944a0009  ! 25: MULX_R	mulx 	%r8, %r9, %r10
	.word 0xa7a20929  ! 26: FMULs	fmuls	%f8, %f9, %f19
	.word 0xccea2a60  ! 27: LDSTUBA_I	ldstuba	%r6, [%r8 + 0x0a60] %asi
	.word 0x8143e011  ! 28: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xc7e21009  ! 29: CASA_I	casa	[%r8] 0x80, %r9, %r3
	.word 0xd6d22fdc  ! 30: LDSHA_I	ldsha	[%r8, + 0x0fdc] %asi, %r11
	.word 0x9ed2289c  ! 31: UMULcc_I	umulcc 	%r8, 0x089c, %r15
	.word 0xc3ea2d14  ! 32: PREFETCHA_I	prefetcha	[%r8, + 0x0d14] %asi, #one_read
	.word 0x0cc20004  ! 33: BRGZ	brgz  ,nt	%8,<label_0x20004>
	.word 0x8143e005  ! 34: MEMBAR	membar	#LoadLoad | #LoadStore 
	.word 0xceca1009  ! 35: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r7
	.word 0xcad22df8  ! 36: LDSHA_I	ldsha	[%r8, + 0x0df8] %asi, %r5
	.word 0x8143c000  ! 37: STBAR	stbar
	.word 0x8cda0009  ! 38: SMULcc_R	smulcc 	%r8, %r9, %r6
	.word 0x86d20009  ! 40: UMULcc_R	umulcc 	%r8, %r9, %r3
	.word 0xc6fa1009  ! 41: SWAPA_R	swapa	%r3, [%r8 + %r9] 0x80
	.word 0xaba208a9  ! 42: FSUBs	fsubs	%f8, %f9, %f21
	.word 0x40000004  ! 43: CALL	call	disp30_4
	.word 0x8a52281c  ! 44: UMUL_I	umul 	%r8, 0x081c, %r5
	.word 0x8143e014  ! 45: MEMBAR	membar	#LoadStore | #Lookaside 
	.word 0xc36a24c0  ! 46: PREFETCH_I	prefetch	[%r8 + 0x04c0], #one_read
	.word 0xba720009  ! 47: UDIV_R	udiv 	%r8, %r9, %r29
	.word 0x83a209a9  ! 49: FDIVs	fdivs	%f8, %f9, %f1
	.word 0x84720009  ! 50: UDIV_R	udiv 	%r8, %r9, %r2
	.word 0x8143e023  ! 51: MEMBAR	membar	#LoadLoad | #StoreLoad | #MemIssue 
	.word 0x8143c000  ! 52: STBAR	stbar
	.word 0x8143c000  ! 53: STBAR	stbar
	.word 0xbcfa0009  ! 54: SDIVcc_R	sdivcc 	%r8, %r9, %r30
	.word 0xc3f21009  ! 55: CASXA_I	casxa	[%r8] 0x80, %r9, %r1
	.word 0x8143c000  ! 56: STBAR	stbar
	.word 0xe24a0009  ! 57: LDSB_R	ldsb	[%r8 + %r9], %r17
	.word 0xced227a8  ! 58: LDSHA_I	ldsha	[%r8, + 0x07a8] %asi, %r7
	.word 0xc27a0009  ! 59: SWAP_R	swap	%r1, [%r8 + %r9]
	.word 0xac4a0009  ! 60: MULX_R	mulx 	%r8, %r9, %r22
	.word 0xca5a0009  ! 61: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xc4ba1009  ! 62: STDA_R	stda	%r2, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 63: STBAR	stbar
	.word 0x8d2229b8  ! 64: MULScc_I	mulscc 	%r8, 0x09b8, %r6
	.word 0xce120009  ! 65: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xc44a27cc  ! 66: LDSB_I	ldsb	[%r8 + 0x07cc], %r2
	.word 0x9fa20929  ! 67: FMULs	fmuls	%f8, %f9, %f15
	.word 0xc81a0009  ! 68: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xc8ba1009  ! 69: STDA_R	stda	%r4, [%r8 + %r9] 0x80
	.word 0x28800008  ! 70: BLEU	bleu,a	<label_0x8>
	.word 0x8efa0009  ! 71: SDIVcc_R	sdivcc 	%r8, %r9, %r7
	.word 0x82f20009  ! 72: UDIVcc_R	udivcc 	%r8, %r9, %r1
	.word 0xc68a1009  ! 73: LDUBA_R	lduba	[%r8, %r9] 0x80, %r3
	.word 0xcea22a98  ! 74: STWA_I	stwa	%r7, [%r8 + 0x0a98] %asi
	.word 0xcefa1009  ! 75: SWAPA_R	swapa	%r7, [%r8 + %r9] 0x80
	.word 0x02800004  ! 76: BE	be  	<label_0x4>
	.word 0x8ba209a9  ! 77: FDIVs	fdivs	%f8, %f9, %f5
	.word 0x8143e04a  ! 78: MEMBAR	membar	#StoreLoad | #StoreStore | #Sync 
	.word 0xbba209a9  ! 79: FDIVs	fdivs	%f8, %f9, %f29
	.word 0xc6fa27a0  ! 80: SWAPA_I	swapa	%r3, [%r8 + 0x07a0] %asi
	.word 0xe27a2dfc  ! 81: SWAP_I	swap	%r17, [%r8 + 0x0dfc]
	.word 0xf8ba22c8  ! 82: STDA_I	stda	%r28, [%r8 + 0x02c8] %asi
	.word 0x896a0009  ! 83: SDIVX_R	sdivx	%r8, %r9, %r4
	.word 0xcea22308  ! 84: STWA_I	stwa	%r7, [%r8 + 0x0308] %asi
	.word 0xcaca2628  ! 85: LDSBA_I	ldsba	[%r8, + 0x0628] %asi, %r5
	.word 0x8143e045  ! 86: MEMBAR	membar	#LoadLoad | #LoadStore | #Sync 
	.word 0xc3ea2fbc  ! 87: PREFETCHA_I	prefetcha	[%r8, + 0x0fbc] %asi, #one_read
	.word 0xe1f22009  ! 88: CASXA_R	casxa	[%r8]%asi, %r9, %r16
	.word 0xe2a22908  ! 89: STWA_I	stwa	%r17, [%r8 + 0x0908] %asi
	.word 0xccaa1009  ! 90: STBA_R	stba	%r6, [%r8 + %r9] 0x80
	.word 0x8b222a38  ! 92: MULScc_I	mulscc 	%r8, 0x0a38, %r5
	.word 0x32800004  ! 93: BNE	bne,a	<label_0x4>
	.word 0xc8ba2da0  ! 94: STDA_I	stda	%r4, [%r8 + 0x0da0] %asi
	.word 0xc41a25a8  ! 95: LDD_I	ldd	[%r8 + 0x05a8], %r2
	.word 0x8143e00d  ! 96: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore 
	.word 0x32800004  ! 97: BNE	bne,a	<label_0x4>
	.word 0xba520009  ! 98: UMUL_R	umul 	%r8, %r9, %r29
	.word 0xc5f21009  ! 99: CASXA_I	casxa	[%r8] 0x80, %r9, %r2
	.word 0xc3ea2de8  ! 100: PREFETCHA_I	prefetcha	[%r8, + 0x0de8] %asi, #one_read
	.word 0xcab220e4  ! 101: STHA_I	stha	%r5, [%r8 + 0x00e4] %asi
	.word 0x8e5a0009  ! 102: SMUL_R	smul 	%r8, %r9, %r7
	.word 0x8143e071  ! 103: MEMBAR	membar	#LoadLoad | #Lookaside | #MemIssue | #Sync 
	.word 0xe06a0009  ! 104: LDSTUB_R	ldstub	%r16, [%r8 + %r9]
	.word 0x00800008  ! 105: BN	bn  	<label_0x8>
	.word 0xfe522b3c  ! 106: LDSH_I	ldsh	[%r8 + 0x0b3c], %r31
	.word 0x0e800004  ! 107: BVS	bvs  	<label_0x4>
	.word 0xcf220009  ! 108: STF_R	st	%f7, [%r9, %r8]
	.word 0xe0c21009  ! 109: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r16
	.word 0xccaa1009  ! 110: STBA_R	stba	%r6, [%r8 + %r9] 0x80
	.word 0xe73a0009  ! 112: STDF_R	std	%f19, [%r9, %r8]
	.word 0xcc1a2930  ! 113: LDD_I	ldd	[%r8 + 0x0930], %r6
	.word 0xdcf22000  ! 114: STXA_I	stxa	%r14, [%r8 + 0x0000] %asi
	.word 0x87a20829  ! 115: FADDs	fadds	%f8, %f9, %f3
	.word 0xc3ea22a0  ! 116: PREFETCHA_I	prefetcha	[%r8, + 0x02a0] %asi, #one_read
	.word 0x82720009  ! 117: UDIV_R	udiv 	%r8, %r9, %r1
	.word 0x89a20829  ! 118: FADDs	fadds	%f8, %f9, %f4
	.word 0x26800008  ! 119: BL	bl,a	<label_0x8>
	.word 0x8e520009  ! 121: UMUL_R	umul 	%r8, %r9, %r7
	.word 0x8e7a0009  ! 123: SDIV_R	sdiv 	%r8, %r9, %r7
	.word 0x887a0009  ! 124: SDIV_R	sdiv 	%r8, %r9, %r4
	.word 0xe4ca284c  ! 125: LDSBA_I	ldsba	[%r8, + 0x084c] %asi, %r18
	.word 0xc8da1009  ! 127: LDXA_R	ldxa	[%r8, %r9] 0x80, %r4
	.word 0xb86a0009  ! 128: UDIVX_R	udivx 	%r8, %r9, %r28
	.word 0xc89a27c8  ! 129: LDDA_I	ldda	[%r8, + 0x07c8] %asi, %r4
	.word 0xe81a2b40  ! 130: LDD_I	ldd	[%r8 + 0x0b40], %r20
	.word 0xfc9a1009  ! 131: LDDA_R	ldda	[%r8, %r9] 0x80, %r30
	.word 0xd4ba1009  ! 132: STDA_R	stda	%r10, [%r8 + %r9] 0x80
	.word 0xf41a0009  ! 133: LDD_R	ldd	[%r8 + %r9], %r26
	.word 0xc8ca23e4  ! 134: LDSBA_I	ldsba	[%r8, + 0x03e4] %asi, %r4
	.word 0x0a800008  ! 135: BCS	bcs  	<label_0x8>
	.word 0x8143c000  ! 136: STBAR	stbar
	.word 0xcd220009  ! 137: STF_R	st	%f6, [%r9, %r8]
	.word 0xc3ea2350  ! 138: PREFETCHA_I	prefetcha	[%r8, + 0x0350] %asi, #one_read
	.word 0x8143c000  ! 140: STBAR	stbar
	.word 0x864a2dec  ! 141: MULX_I	mulx 	%r8, 0x0dec, %r3
	.word 0xded2210c  ! 142: LDSHA_I	ldsha	[%r8, + 0x010c] %asi, %r15
	.word 0xc87a2be8  ! 143: SWAP_I	swap	%r4, [%r8 + 0x0be8]
	.word 0xb6722584  ! 144: UDIV_I	udiv 	%r8, 0x0584, %r27
	.word 0xcc8a1009  ! 145: LDUBA_R	lduba	[%r8, %r9] 0x80, %r6
	.word 0x866a2710  ! 147: UDIVX_I	udivx 	%r8, 0x0710, %r3
	.word 0xc2ca1009  ! 149: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r1
	.word 0x8143e025  ! 150: MEMBAR	membar	#LoadLoad | #LoadStore | #MemIssue 
	.word 0xb0da2084  ! 151: SMULcc_I	smulcc 	%r8, 0x0084, %r24
	.word 0xc4aa29cc  ! 153: STBA_I	stba	%r2, [%r8 + 0x09cc] %asi
	.word 0x8efa26e0  ! 154: SDIVcc_I	sdivcc 	%r8, 0x06e0, %r7
	.word 0x8e5a0009  ! 155: SMUL_R	smul 	%r8, %r9, %r7
	.word 0x8af20009  ! 156: UDIVcc_R	udivcc 	%r8, %r9, %r5
	.word 0x9da20829  ! 157: FADDs	fadds	%f8, %f9, %f14
	.word 0xf53a25c0  ! 158: STDF_I	std	%f26, [0x05c0, %r8]
	.word 0xcd3a0009  ! 159: STDF_R	std	%f6, [%r9, %r8]
	.word 0x02800008  ! 160: BE	be  	<label_0x8>
	.word 0x8143c000  ! 161: STBAR	stbar
	.word 0xcbe22009  ! 162: CASA_R	casa	[%r8] %asi, %r9, %r5
	.word 0xc4422120  ! 163: LDSW_I	ldsw	[%r8 + 0x0120], %r2
	.word 0x99a20829  ! 164: FADDs	fadds	%f8, %f9, %f12
	.word 0x986a0009  ! 165: UDIVX_R	udivx 	%r8, %r9, %r12
	.word 0x40000004  ! 166: CALL	call	disp30_4
	.word 0xedf22009  ! 167: CASXA_R	casxa	[%r8]%asi, %r9, %r22
	.word 0xd4aa29d4  ! 168: STBA_I	stba	%r10, [%r8 + 0x09d4] %asi
	.word 0xc3ea287c  ! 169: PREFETCHA_I	prefetcha	[%r8, + 0x087c] %asi, #one_read
	.word 0xc27a0009  ! 170: SWAP_R	swap	%r1, [%r8 + %r9]
	.word 0x8143c000  ! 171: STBAR	stbar
	.word 0x8143e02d  ! 172: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #MemIssue 
	.word 0x30800004  ! 173: BA	ba,a	<label_0x4>
	.word 0xe2ca1009  ! 174: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r17
	.word 0x846a0009  ! 175: UDIVX_R	udivx 	%r8, %r9, %r2
	.word 0xc6d21009  ! 176: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r3
	.word 0x30800004  ! 177: BA	ba,a	<label_0x4>
	.word 0xc8b22894  ! 178: STHA_I	stha	%r4, [%r8 + 0x0894] %asi
	.word 0xa8f20009  ! 180: UDIVcc_R	udivcc 	%r8, %r9, %r20
	.word 0x8ed220c8  ! 181: UMULcc_I	umulcc 	%r8, 0x00c8, %r7
	.word 0xc36a27c4  ! 182: PREFETCH_I	prefetch	[%r8 + 0x07c4], #one_read
	.word 0x10800008  ! 183: BA	ba  	<label_0x8>
	.word 0xf8ba1009  ! 184: STDA_R	stda	%r28, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 185: STBAR	stbar
	.word 0xc45225c4  ! 186: LDSH_I	ldsh	[%r8 + 0x05c4], %r2
	.word 0x8143c000  ! 187: STBAR	stbar
	.word 0x896a285c  ! 188: SDIVX_I	sdivx	%r8, 0x085c, %r4
	.word 0xeaa22ad0  ! 189: STWA_I	stwa	%r21, [%r8 + 0x0ad0] %asi
	.word 0xc44a2268  ! 190: LDSB_I	ldsb	[%r8 + 0x0268], %r2
	.word 0xada20929  ! 191: FMULs	fmuls	%f8, %f9, %f22
	.word 0xc49a1009  ! 193: LDDA_R	ldda	[%r8, %r9] 0x80, %r2
	.word 0x8143c000  ! 194: STBAR	stbar
	.word 0xc46a0009  ! 195: LDSTUB_R	ldstub	%r2, [%r8 + %r9]
	.word 0xb3a20829  ! 196: FADDs	fadds	%f8, %f9, %f25
	.word 0x8143c000  ! 197: STBAR	stbar
	.word 0xccba1009  ! 198: STDA_R	stda	%r6, [%r8 + %r9] 0x80
	.word 0x86da2f2c  ! 199: SMULcc_I	smulcc 	%r8, 0x0f2c, %r3
	.word 0x85a20929  ! 200: FMULs	fmuls	%f8, %f9, %f2
	.word 0x8a520009  ! 201: UMUL_R	umul 	%r8, %r9, %r5
	.word 0xc8da1009  ! 202: LDXA_R	ldxa	[%r8, %r9] 0x80, %r4
	.word 0xc47a29a0  ! 203: SWAP_I	swap	%r2, [%r8 + 0x09a0]
	.word 0xb6f20009  ! 204: UDIVcc_R	udivcc 	%r8, %r9, %r27
	.word 0x8143c000  ! 205: STBAR	stbar
	.word 0xb8522fe4  ! 206: UMUL_I	umul 	%r8, 0x0fe4, %r28
	.word 0xce520009  ! 207: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xfcba1009  ! 208: STDA_R	stda	%r30, [%r8 + %r9] 0x80
	.word 0x865a0009  ! 209: SMUL_R	smul 	%r8, %r9, %r3
	.word 0x28800008  ! 210: BLEU	bleu,a	<label_0x8>
	.word 0xe8f22a68  ! 211: STXA_I	stxa	%r20, [%r8 + 0x0a68] %asi
	.word 0xca0a0009  ! 212: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xcef21009  ! 213: STXA_R	stxa	%r7, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 214: STBAR	stbar
	.word 0x8ad20009  ! 215: UMULcc_R	umulcc 	%r8, %r9, %r5
	.word 0xc36a2ff4  ! 216: PREFETCH_I	prefetch	[%r8 + 0x0ff4], #one_read
	.word 0x867a2554  ! 217: SDIV_I	sdiv 	%r8, 0x0554, %r3
	.word 0xcaaa1009  ! 218: STBA_R	stba	%r5, [%r8 + %r9] 0x80
	.word 0xec9a1009  ! 220: LDDA_R	ldda	[%r8, %r9] 0x80, %r22
	.word 0xde8a1009  ! 221: LDUBA_R	lduba	[%r8, %r9] 0x80, %r15
	.word 0x04800008  ! 222: BLE	ble  	<label_0x8>
	.word 0xc6fa1009  ! 223: SWAPA_R	swapa	%r3, [%r8 + %r9] 0x80
	.word 0xc6aa1009  ! 224: STBA_R	stba	%r3, [%r8 + %r9] 0x80
	.word 0xc87a0009  ! 225: SWAP_R	swap	%r4, [%r8 + %r9]
	.word 0x8143e00e  ! 226: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore 
	.word 0x8143e041  ! 227: MEMBAR	membar	#LoadLoad | #Sync 
	.word 0xf4ba1009  ! 228: STDA_R	stda	%r26, [%r8 + %r9] 0x80
	.word 0xde8a2048  ! 229: LDUBA_I	lduba	[%r8, + 0x0048] %asi, %r15
	.word 0xc33a2340  ! 230: STDF_I	std	%f1, [0x0340, %r8]
	.word 0xf0ea274c  ! 231: LDSTUBA_I	ldstuba	%r24, [%r8 + 0x074c] %asi
	.word 0x964a29d4  ! 232: MULX_I	mulx 	%r8, 0x09d4, %r11
	.word 0x32800004  ! 233: BNE	bne,a	<label_0x4>
	.word 0xd85a2200  ! 234: LDX_I	ldx	[%r8 + 0x0200], %r12
	.word 0xd89a1009  ! 235: LDDA_R	ldda	[%r8, %r9] 0x80, %r12
	.word 0x08800008  ! 236: BLEU	bleu  	<label_0x8>
	.word 0x28800004  ! 237: BLEU	bleu,a	<label_0x4>
	.word 0xc7f22009  ! 238: CASXA_R	casxa	[%r8]%asi, %r9, %r3
	.word 0xc3ea22dc  ! 239: PREFETCHA_I	prefetcha	[%r8, + 0x02dc] %asi, #one_read
	.word 0xc86a20f4  ! 240: LDSTUB_I	ldstub	%r4, [%r8 + 0x00f4]
	.word 0x8143e07c  ! 241: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xe9220009  ! 242: STF_R	st	%f20, [%r9, %r8]
	.word 0xfa92297c  ! 243: LDUHA_I	lduha	[%r8, + 0x097c] %asi, %r29
	.word 0xecea2854  ! 244: LDSTUBA_I	ldstuba	%r22, [%r8 + 0x0854] %asi
	.word 0x1e800004  ! 245: BVC	bvc  	<label_0x4>
	.word 0x86fa0009  ! 246: SDIVcc_R	sdivcc 	%r8, %r9, %r3
	.word 0xcac21009  ! 247: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r5
	.word 0x8143c000  ! 248: STBAR	stbar
	.word 0x8143e037  ! 249: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside | #MemIssue 
	.word 0x827a2a78  ! 250: SDIV_I	sdiv 	%r8, 0x0a78, %r1
	.word 0xf0c22eac  ! 251: LDSWA_I	ldswa	[%r8, + 0x0eac] %asi, %r24
	.word 0x86da2378  ! 252: SMULcc_I	smulcc 	%r8, 0x0378, %r3
	.word 0xca4a0009  ! 253: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xc48a2ce0  ! 254: LDUBA_I	lduba	[%r8, + 0x0ce0] %asi, %r2
	.word 0x8143c000  ! 255: STBAR	stbar
	.word 0xb3a20829  ! 256: FADDs	fadds	%f8, %f9, %f25
	.word 0xcf3a0009  ! 257: STDF_R	std	%f7, [%r9, %r8]
	.word 0x847a0009  ! 258: SDIV_R	sdiv 	%r8, %r9, %r2
	.word 0xc4fa1009  ! 259: SWAPA_R	swapa	%r2, [%r8 + %r9] 0x80
	.word 0xce120009  ! 260: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xaad20009  ! 261: UMULcc_R	umulcc 	%r8, %r9, %r21
	.word 0x8a7a2ff8  ! 262: SDIV_I	sdiv 	%r8, 0x0ff8, %r5
	.word 0xc40a0009  ! 263: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xcb22255c  ! 264: STF_I	st	%f5, [0x055c, %r8]
	.word 0xc36a20ac  ! 265: PREFETCH_I	prefetch	[%r8 + 0x00ac], #one_read
	.word 0xe4fa1009  ! 266: SWAPA_R	swapa	%r18, [%r8 + %r9] 0x80
	.word 0x967a0009  ! 267: SDIV_R	sdiv 	%r8, %r9, %r11
	.word 0xa0da2344  ! 270: SMULcc_I	smulcc 	%r8, 0x0344, %r16
	.word 0xc6aa2020  ! 271: STBA_I	stba	%r3, [%r8 + 0x0020] %asi
	.word 0xceca1009  ! 272: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r7
	.word 0x86fa2ed4  ! 273: SDIVcc_I	sdivcc 	%r8, 0x0ed4, %r3
	.word 0xfa921009  ! 274: LDUHA_R	lduha	[%r8, %r9] 0x80, %r29
	.word 0xc4f21009  ! 275: STXA_R	stxa	%r2, [%r8 + %r9] 0x80
	.word 0xcd3a2938  ! 276: STDF_I	std	%f6, [0x0938, %r8]
	.word 0xcbe22009  ! 277: CASA_R	casa	[%r8] %asi, %r9, %r5
	.word 0x8852271c  ! 278: UMUL_I	umul 	%r8, 0x071c, %r4
	.word 0xcdf21009  ! 279: CASXA_I	casxa	[%r8] 0x80, %r9, %r6
	.word 0xe87a2404  ! 280: SWAP_I	swap	%r20, [%r8 + 0x0404]
	.word 0x845a0009  ! 281: SMUL_R	smul 	%r8, %r9, %r2
	.word 0x02800004  ! 282: BE	be  	<label_0x4>
	.word 0x86720009  ! 283: UDIV_R	udiv 	%r8, %r9, %r3
	.word 0x8143c000  ! 284: STBAR	stbar
	.word 0xc36a2c70  ! 285: PREFETCH_I	prefetch	[%r8 + 0x0c70], #one_read
	.word 0xf25a2a20  ! 286: LDX_I	ldx	[%r8 + 0x0a20], %r25
	.word 0x8143c000  ! 287: STBAR	stbar
	.word 0xf0ea1009  ! 288: LDSTUBA_R	ldstuba	%r24, [%r8 + %r9] 0x80
	.word 0x876a0009  ! 289: SDIVX_R	sdivx	%r8, %r9, %r3
	.word 0xada209a9  ! 290: FDIVs	fdivs	%f8, %f9, %f22
	.word 0x8143e077  ! 291: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside | #MemIssue | #Sync 
	.word 0xcf222f6c  ! 292: STF_I	st	%f7, [0x0f6c, %r8]
	.word 0xbc522a98  ! 293: UMUL_I	umul 	%r8, 0x0a98, %r30
	.word 0xbefa0009  ! 294: SDIVcc_R	sdivcc 	%r8, %r9, %r31
	.word 0x0e800004  ! 295: BVS	bvs  	<label_0x4>
	.word 0x34800004  ! 296: BG	bg,a	<label_0x4>
	.word 0x8a7a0009  ! 297: SDIV_R	sdiv 	%r8, %r9, %r5
	.word 0x22800008  ! 298: BE	be,a	<label_0x8>
	.word 0xcaf227e8  ! 299: STXA_I	stxa	%r5, [%r8 + 0x07e8] %asi
	.word 0xc3ea209c  ! 300: PREFETCHA_I	prefetcha	[%r8, + 0x009c] %asi, #one_read
	.word 0xb8fa2e9c  ! 301: SDIVcc_I	sdivcc 	%r8, 0x0e9c, %r28
	.word 0x8143c000  ! 302: STBAR	stbar
	.word 0x00800004  ! 303: BN	bn  	<label_0x4>
	.word 0xe2fa1009  ! 304: SWAPA_R	swapa	%r17, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 305: STBAR	stbar
	.word 0xc6b221e8  ! 306: STHA_I	stha	%r3, [%r8 + 0x01e8] %asi
	.word 0xceea2d8c  ! 307: LDSTUBA_I	ldstuba	%r7, [%r8 + 0x0d8c] %asi
	.word 0x8143c000  ! 308: STBAR	stbar
	.word 0x18800008  ! 309: BGU	bgu  	<label_0x8>
	.word 0x16800008  ! 310: BGE	bge  	<label_0x8>
	.word 0xe4aa1009  ! 311: STBA_R	stba	%r18, [%r8 + %r9] 0x80
	.word 0x8da20829  ! 312: FADDs	fadds	%f8, %f9, %f6
	.word 0x864a0009  ! 313: MULX_R	mulx 	%r8, %r9, %r3
	.word 0xc8921009  ! 314: LDUHA_R	lduha	[%r8, %r9] 0x80, %r4
	.word 0x89a20929  ! 315: FMULs	fmuls	%f8, %f9, %f4
	.word 0xcbf22009  ! 316: CASXA_R	casxa	[%r8]%asi, %r9, %r5
	.word 0x836a2cb8  ! 317: SDIVX_I	sdivx	%r8, 0x0cb8, %r1
	.word 0xc5222820  ! 318: STF_I	st	%f2, [0x0820, %r8]
	.word 0xc5220009  ! 319: STF_R	st	%f2, [%r9, %r8]
	.word 0xcc9a1009  ! 320: LDDA_R	ldda	[%r8, %r9] 0x80, %r6
	.word 0xd5222a18  ! 321: STF_I	st	%f10, [0x0a18, %r8]
	.word 0xdeda1009  ! 322: LDXA_R	ldxa	[%r8, %r9] 0x80, %r15
	.word 0xc36a2c8c  ! 323: PREFETCH_I	prefetch	[%r8 + 0x0c8c], #one_read
	.word 0xf6fa1009  ! 324: SWAPA_R	swapa	%r27, [%r8 + %r9] 0x80
	.word 0xc85a2328  ! 325: LDX_I	ldx	[%r8 + 0x0328], %r4
	.word 0xceda2f08  ! 326: LDXA_I	ldxa	[%r8, + 0x0f08] %asi, %r7
	.word 0xce7a21a8  ! 327: SWAP_I	swap	%r7, [%r8 + 0x01a8]
	.word 0x84522470  ! 328: UMUL_I	umul 	%r8, 0x0470, %r2
	.word 0xdcba1009  ! 329: STDA_R	stda	%r14, [%r8 + %r9] 0x80
	.word 0xf49a2520  ! 330: LDDA_I	ldda	[%r8, + 0x0520] %asi, %r26
	.word 0x1a800004  ! 331: BCC	bcc  	<label_0x4>
	.word 0xfff21009  ! 332: CASXA_I	casxa	[%r8] 0x80, %r9, %r31
	.word 0xceea1009  ! 333: LDSTUBA_R	ldstuba	%r7, [%r8 + %r9] 0x80
	.word 0x02ca0008  ! 334: BRZ	brz  ,pt	%8,<label_0xa0008>
	.word 0x8d6a2ee4  ! 335: SDIVX_I	sdivx	%r8, 0x0ee4, %r6
	.word 0xcaa21009  ! 336: STWA_R	stwa	%r5, [%r8 + %r9] 0x80
	.word 0xdcd21009  ! 337: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r14
	.word 0xc93a0009  ! 338: STDF_R	std	%f4, [%r9, %r8]
	.word 0x8143e00c  ! 339: MEMBAR	membar	#LoadStore | #StoreStore 
	.word 0xfbf22009  ! 340: CASXA_R	casxa	[%r8]%asi, %r9, %r29
	.word 0xf4ba1009  ! 341: STDA_R	stda	%r26, [%r8 + %r9] 0x80
	.word 0xab6a2b5c  ! 342: SDIVX_I	sdivx	%r8, 0x0b5c, %r21
	.word 0x8af22da8  ! 343: UDIVcc_I	udivcc 	%r8, 0x0da8, %r5
	.word 0xc8520009  ! 344: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xd8ba2230  ! 345: STDA_I	stda	%r12, [%r8 + 0x0230] %asi
	.word 0xba522dc8  ! 346: UMUL_I	umul 	%r8, 0x0dc8, %r29
	.word 0x8af226ac  ! 347: UDIVcc_I	udivcc 	%r8, 0x06ac, %r5
	.word 0xd8aa1009  ! 348: STBA_R	stba	%r12, [%r8 + %r9] 0x80
	.word 0xbf2220ec  ! 349: MULScc_I	mulscc 	%r8, 0x00ec, %r31
	.word 0xc64a2ec0  ! 350: LDSB_I	ldsb	[%r8 + 0x0ec0], %r3
	.word 0xbfa208a9  ! 351: FSUBs	fsubs	%f8, %f9, %f31
	.word 0xda022274  ! 352: LDUW_I	lduw	[%r8 + 0x0274], %r13
	.word 0xff3a21d8  ! 353: STDF_I	std	%f31, [0x01d8, %r8]
	.word 0xc36a2814  ! 354: PREFETCH_I	prefetch	[%r8 + 0x0814], #one_read
	.word 0xca7a2938  ! 355: SWAP_I	swap	%r5, [%r8 + 0x0938]
	.word 0xec9a2b08  ! 356: LDDA_I	ldda	[%r8, + 0x0b08] %asi, %r22
	.word 0xca122f90  ! 357: LDUH_I	lduh	[%r8 + 0x0f90], %r5
	.word 0xec020009  ! 358: LDUW_R	lduw	[%r8 + %r9], %r22
	.word 0xceaa1009  ! 359: STBA_R	stba	%r7, [%r8 + %r9] 0x80
	.word 0xdcba2ca0  ! 360: STDA_I	stda	%r14, [%r8 + 0x0ca0] %asi
	.word 0xce122a78  ! 361: LDUH_I	lduh	[%r8 + 0x0a78], %r7
	.word 0x88fa0009  ! 362: SDIVcc_R	sdivcc 	%r8, %r9, %r4
	.word 0x89a209a9  ! 363: FDIVs	fdivs	%f8, %f9, %f4
	.word 0x8c6a2138  ! 364: UDIVX_I	udivx 	%r8, 0x0138, %r6
	.word 0xba720009  ! 366: UDIV_R	udiv 	%r8, %r9, %r29
	.word 0xfa82299c  ! 367: LDUWA_I	lduwa	[%r8, + 0x099c] %asi, %r29
	.word 0x06c20004  ! 368: BRLZ	brlz  ,nt	%8,<label_0x20004>
	.word 0x8cf22594  ! 369: UDIVcc_I	udivcc 	%r8, 0x0594, %r6
	.word 0xaad20009  ! 370: UMULcc_R	umulcc 	%r8, %r9, %r21
	.word 0xb76a0009  ! 371: SDIVX_R	sdivx	%r8, %r9, %r27
	.word 0x0aca0004  ! 372: BRNZ	brnz  ,pt	%8,<label_0xa0004>
	.word 0xb2720009  ! 373: UDIV_R	udiv 	%r8, %r9, %r25
	.word 0xc3220009  ! 374: STF_R	st	%f1, [%r9, %r8]
	.word 0xdc9a1009  ! 375: LDDA_R	ldda	[%r8, %r9] 0x80, %r14
	.word 0xf93a0009  ! 376: STDF_R	std	%f28, [%r9, %r8]
	.word 0x8ba20829  ! 377: FADDs	fadds	%f8, %f9, %f5
	.word 0x83a209a9  ! 378: FDIVs	fdivs	%f8, %f9, %f1
	.word 0x1a800004  ! 379: BCC	bcc  	<label_0x4>
	.word 0xc6aa2988  ! 380: STBA_I	stba	%r3, [%r8 + 0x0988] %asi
	.word 0x86d22968  ! 381: UMULcc_I	umulcc 	%r8, 0x0968, %r3
	.word 0x826a2144  ! 382: UDIVX_I	udivx 	%r8, 0x0144, %r1
	.word 0x8143e011  ! 383: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x87a20929  ! 384: FMULs	fmuls	%f8, %f9, %f3
	.word 0x22800008  ! 385: BE	be,a	<label_0x8>
	.word 0x30800004  ! 386: BA	ba,a	<label_0x4>
	.word 0xc6120009  ! 387: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0x8c5a2048  ! 388: SMUL_I	smul 	%r8, 0x0048, %r6
	.word 0xc3ea2688  ! 389: PREFETCHA_I	prefetcha	[%r8, + 0x0688] %asi, #one_read
	.word 0x96f22c00  ! 390: UDIVcc_I	udivcc 	%r8, 0x0c00, %r11
	.word 0x2a800004  ! 391: BCS	bcs,a	<label_0x4>
	.word 0x8143e055  ! 392: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside | #Sync 
	.word 0xce420009  ! 393: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0x20800008  ! 394: BN	bn,a	<label_0x8>
	.word 0xb72224d0  ! 396: MULScc_I	mulscc 	%r8, 0x04d0, %r27
	.word 0xb7a208a9  ! 397: FSUBs	fsubs	%f8, %f9, %f27
	.word 0xcc9a25f8  ! 398: LDDA_I	ldda	[%r8, + 0x05f8] %asi, %r6
	.word 0xb07224f0  ! 399: UDIV_I	udiv 	%r8, 0x04f0, %r24
	.word 0x8143c000  ! 400: STBAR	stbar
	.word 0xd5f21009  ! 401: CASXA_I	casxa	[%r8] 0x80, %r9, %r10
	.word 0xfc1a2558  ! 402: LDD_I	ldd	[%r8 + 0x0558], %r30
	.word 0x8efa2760  ! 403: SDIVcc_I	sdivcc 	%r8, 0x0760, %r7
	.word 0xc28a1009  ! 404: LDUBA_R	lduba	[%r8, %r9] 0x80, %r1
	.word 0x84fa24dc  ! 405: SDIVcc_I	sdivcc 	%r8, 0x04dc, %r2
	.word 0x8143c000  ! 406: STBAR	stbar
	.word 0xc85a0009  ! 407: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xc3ea20ac  ! 408: PREFETCHA_I	prefetcha	[%r8, + 0x00ac] %asi, #one_read
	.word 0x8143e074  ! 409: MEMBAR	membar	#LoadStore | #Lookaside | #MemIssue | #Sync 
	.word 0x8672203c  ! 410: UDIV_I	udiv 	%r8, 0x003c, %r3
	.word 0x88fa2998  ! 411: SDIVcc_I	sdivcc 	%r8, 0x0998, %r4
	.word 0xcc9224c4  ! 412: LDUHA_I	lduha	[%r8, + 0x04c4] %asi, %r6
	.word 0x8c5a2e54  ! 413: SMUL_I	smul 	%r8, 0x0e54, %r6
	.word 0x8e6a2738  ! 414: UDIVX_I	udivx 	%r8, 0x0738, %r7
	.word 0xcc921009  ! 415: LDUHA_R	lduha	[%r8, %r9] 0x80, %r6
	.word 0xecd21009  ! 416: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r22
	.word 0xe612213c  ! 417: LDUH_I	lduh	[%r8 + 0x013c], %r19
	.word 0x8143e02e  ! 418: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #MemIssue 
	.word 0xc2da1009  ! 419: LDXA_R	ldxa	[%r8, %r9] 0x80, %r1
	.word 0xc3f22009  ! 420: CASXA_R	casxa	[%r8]%asi, %r9, %r1
	.word 0x8e522824  ! 421: UMUL_I	umul 	%r8, 0x0824, %r7
	.word 0xdd220009  ! 422: STF_R	st	%f14, [%r9, %r8]
	.word 0xe2a21009  ! 423: STWA_R	stwa	%r17, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 424: STBAR	stbar
	.word 0x8e7a0009  ! 425: SDIV_R	sdiv 	%r8, %r9, %r7
	.word 0x0a800004  ! 426: BCS	bcs  	<label_0x4>
	.word 0x8143c000  ! 427: STBAR	stbar
	.word 0x8a520009  ! 428: UMUL_R	umul 	%r8, %r9, %r5
	.word 0x8143e055  ! 429: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside | #Sync 
	.word 0x8143c000  ! 430: STBAR	stbar
	.word 0x88f22310  ! 431: UDIVcc_I	udivcc 	%r8, 0x0310, %r4
	.word 0x00800004  ! 432: BN	bn  	<label_0x4>
	.word 0xc36a23a8  ! 433: PREFETCH_I	prefetch	[%r8 + 0x03a8], #one_read
	.word 0x8143c000  ! 434: STBAR	stbar
	.word 0x10800004  ! 435: BA	ba  	<label_0x4>
	.word 0xf8ba1009  ! 436: STDA_R	stda	%r28, [%r8 + %r9] 0x80
	.word 0xc68226c4  ! 437: LDUWA_I	lduwa	[%r8, + 0x06c4] %asi, %r3
	.word 0x0c800004  ! 438: BNEG	bneg  	<label_0x4>
	.word 0xc6fa1009  ! 439: SWAPA_R	swapa	%r3, [%r8 + %r9] 0x80
	.word 0xdde22009  ! 441: CASA_R	casa	[%r8] %asi, %r9, %r14
	.word 0x84522760  ! 442: UMUL_I	umul 	%r8, 0x0760, %r2
	.word 0x8143c000  ! 443: STBAR	stbar
	.word 0xd49a1009  ! 444: LDDA_R	ldda	[%r8, %r9] 0x80, %r10
	.word 0x40000004  ! 445: CALL	call	disp30_4
	.word 0x8143e00a  ! 446: MEMBAR	membar	#StoreLoad | #StoreStore 
	.word 0x8143e04c  ! 447: MEMBAR	membar	#LoadStore | #StoreStore | #Sync 
	.word 0x8143c000  ! 448: STBAR	stbar
	.word 0x8143e07b  ! 449: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xced21009  ! 450: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r7
	.word 0xc3ea2210  ! 451: PREFETCHA_I	prefetcha	[%r8, + 0x0210] %asi, #one_read
	.word 0xcb220009  ! 452: STF_R	st	%f5, [%r9, %r8]
	.word 0xc6da2bf8  ! 453: LDXA_I	ldxa	[%r8, + 0x0bf8] %asi, %r3
	.word 0x8d220009  ! 454: MULScc_R	mulscc 	%r8, %r9, %r6
	.word 0x86fa0009  ! 455: SDIVcc_R	sdivcc 	%r8, %r9, %r3
	.word 0x8eda0009  ! 456: SMULcc_R	smulcc 	%r8, %r9, %r7
	.word 0x8143c000  ! 457: STBAR	stbar
	.word 0x8da20929  ! 458: FMULs	fmuls	%f8, %f9, %f6
	.word 0xc2420009  ! 459: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xbefa2318  ! 461: SDIVcc_I	sdivcc 	%r8, 0x0318, %r31
	.word 0xce520009  ! 462: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xe8822e48  ! 463: LDUWA_I	lduwa	[%r8, + 0x0e48] %asi, %r20
	.word 0x8143e01b  ! 464: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Lookaside 
	.word 0x85a209a9  ! 465: FDIVs	fdivs	%f8, %f9, %f2
	.word 0xc4921009  ! 466: LDUHA_R	lduha	[%r8, %r9] 0x80, %r2
	.word 0x8a720009  ! 467: UDIV_R	udiv 	%r8, %r9, %r5
	.word 0xc7f21009  ! 468: CASXA_I	casxa	[%r8] 0x80, %r9, %r3
	.word 0x86fa0009  ! 469: SDIVcc_R	sdivcc 	%r8, %r9, %r3
	.word 0x94fa0009  ! 470: SDIVcc_R	sdivcc 	%r8, %r9, %r10
	.word 0xdb3a2b58  ! 471: STDF_I	std	%f13, [0x0b58, %r8]
	.word 0x8143c000  ! 472: STBAR	stbar
	.word 0x0c800004  ! 473: BNEG	bneg  	<label_0x4>
	.word 0x04c20004  ! 474: BRLEZ	brlez  ,nt	%8,<label_0x20004>
	.word 0xcfe22009  ! 475: CASA_R	casa	[%r8] %asi, %r9, %r7
	.word 0x8143e00d  ! 476: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore 
	.word 0x8143e02d  ! 477: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #MemIssue 
	.word 0xc7e21009  ! 478: CASA_I	casa	[%r8] 0x80, %r9, %r3
	.word 0x24ca0004  ! 479: BRLEZ	brlez,a,pt	%8,<label_0xa0004>
	.word 0xcc422518  ! 480: LDSW_I	ldsw	[%r8 + 0x0518], %r6
	.word 0xc3ea29c4  ! 481: PREFETCHA_I	prefetcha	[%r8, + 0x09c4] %asi, #one_read
	.word 0x8143e02b  ! 482: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #MemIssue 
	.word 0xbd2224f4  ! 483: MULScc_I	mulscc 	%r8, 0x04f4, %r30
	.word 0xd4ba2d10  ! 484: STDA_I	stda	%r10, [%r8 + 0x0d10] %asi
	.word 0x8143e06d  ! 485: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #MemIssue | #Sync 
	.word 0xca6a0009  ! 486: LDSTUB_R	ldstub	%r5, [%r8 + %r9]
	.word 0x0a800004  ! 487: BCS	bcs  	<label_0x4>
	.word 0x8143c000  ! 488: STBAR	stbar
	.word 0x8143c000  ! 489: STBAR	stbar
	.word 0xca0a2538  ! 490: LDUB_I	ldub	[%r8 + 0x0538], %r5
	.word 0xc47a0009  ! 491: SWAP_R	swap	%r2, [%r8 + %r9]
	.word 0xfcea1009  ! 492: LDSTUBA_R	ldstuba	%r30, [%r8 + %r9] 0x80
	.word 0xe8aa1009  ! 493: STBA_R	stba	%r20, [%r8 + %r9] 0x80
	.word 0x8143e038  ! 494: MEMBAR	membar	#StoreStore | #Lookaside | #MemIssue 
	.word 0xc6aa1009  ! 495: STBA_R	stba	%r3, [%r8 + %r9] 0x80
	.word 0x84720009  ! 496: UDIV_R	udiv 	%r8, %r9, %r2
	.word 0x32800004  ! 497: BNE	bne,a	<label_0x4>
	.word 0xc36a224c  ! 498: PREFETCH_I	prefetch	[%r8 + 0x024c], #one_read
	.word 0xaeda0009  ! 499: SMULcc_R	smulcc 	%r8, %r9, %r23
	.word 0xcc8a1009  ! 500: LDUBA_R	lduba	[%r8, %r9] 0x80, %r6
	.word 0x8143e036  ! 501: MEMBAR	membar	#StoreLoad | #LoadStore | #Lookaside | #MemIssue 
	.word 0xee822cf8  ! 502: LDUWA_I	lduwa	[%r8, + 0x0cf8] %asi, %r23
	.word 0x04800004  ! 503: BLE	ble  	<label_0x4>
	.word 0xc6f22170  ! 504: STXA_I	stxa	%r3, [%r8 + 0x0170] %asi
	.word 0xc9220009  ! 505: STF_R	st	%f4, [%r9, %r8]
	.word 0x89a209a9  ! 506: FDIVs	fdivs	%f8, %f9, %f4
	.word 0xf65a0009  ! 507: LDX_R	ldx	[%r8 + %r9], %r27
	.word 0xa8da0009  ! 508: SMULcc_R	smulcc 	%r8, %r9, %r20
	.word 0xc6122f1c  ! 509: LDUH_I	lduh	[%r8 + 0x0f1c], %r3
	.word 0xf322216c  ! 510: STF_I	st	%f25, [0x016c, %r8]
	.word 0xc2020009  ! 511: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xfe7a21c8  ! 512: SWAP_I	swap	%r31, [%r8 + 0x01c8]
	.word 0xc3ea25ac  ! 513: PREFETCHA_I	prefetcha	[%r8, + 0x05ac] %asi, #one_read
	.word 0xe0ca22d4  ! 514: LDSBA_I	ldsba	[%r8, + 0x02d4] %asi, %r16
	.word 0x984a0009  ! 515: MULX_R	mulx 	%r8, %r9, %r12
	.word 0xc4da2b58  ! 516: LDXA_I	ldxa	[%r8, + 0x0b58] %asi, %r2
	.word 0x95a20829  ! 517: FADDs	fadds	%f8, %f9, %f10
	.word 0xd72221c4  ! 518: STF_I	st	%f11, [0x01c4, %r8]
	.word 0x825a0009  ! 519: SMUL_R	smul 	%r8, %r9, %r1
	.word 0xc2ea1009  ! 520: LDSTUBA_R	ldstuba	%r1, [%r8 + %r9] 0x80
	.word 0xe65a2be8  ! 521: LDX_I	ldx	[%r8 + 0x0be8], %r19
	.word 0xff3a0009  ! 522: STDF_R	std	%f31, [%r9, %r8]
	.word 0x8143e051  ! 523: MEMBAR	membar	#LoadLoad | #Lookaside | #Sync 
	.word 0xa8f20009  ! 524: UDIVcc_R	udivcc 	%r8, %r9, %r20
	.word 0xc66a0009  ! 525: LDSTUB_R	ldstub	%r3, [%r8 + %r9]
	.word 0x896a2c3c  ! 526: SDIVX_I	sdivx	%r8, 0x0c3c, %r4
	.word 0xc7222810  ! 527: STF_I	st	%f3, [0x0810, %r8]
	.word 0xceaa1009  ! 528: STBA_R	stba	%r7, [%r8 + %r9] 0x80
	.word 0xcdf21009  ! 529: CASXA_I	casxa	[%r8] 0x80, %r9, %r6
	.word 0x30800008  ! 530: BA	ba,a	<label_0x8>
	.word 0x8143e061  ! 531: MEMBAR	membar	#LoadLoad | #MemIssue | #Sync 
	.word 0x84520009  ! 532: UMUL_R	umul 	%r8, %r9, %r2
	.word 0xe8aa2244  ! 533: STBA_I	stba	%r20, [%r8 + 0x0244] %asi
	.word 0xa4d20009  ! 534: UMULcc_R	umulcc 	%r8, %r9, %r18
	.word 0x8143c000  ! 535: STBAR	stbar
	.word 0xfa5a0009  ! 536: LDX_R	ldx	[%r8 + %r9], %r29
	.word 0xecaa2014  ! 537: STBA_I	stba	%r22, [%r8 + 0x0014] %asi
	.word 0xe6a21009  ! 538: STWA_R	stwa	%r19, [%r8 + %r9] 0x80
	.word 0xceb221a8  ! 539: STHA_I	stha	%r7, [%r8 + 0x01a8] %asi
	.word 0x0ac20008  ! 540: BRNZ	brnz  ,nt	%8,<label_0x20008>
	.word 0x8143e057  ! 541: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside | #Sync 
	.word 0x8da208a9  ! 542: FSUBs	fsubs	%f8, %f9, %f6
	.word 0x0eca0004  ! 543: BRGEZ	brgez  ,pt	%8,<label_0xa0004>
	.word 0xc4520009  ! 544: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xca7a0009  ! 545: SWAP_R	swap	%r5, [%r8 + %r9]
	.word 0xc6fa2350  ! 546: SWAPA_I	swapa	%r3, [%r8 + 0x0350] %asi
	.word 0xc87a2b20  ! 547: SWAP_I	swap	%r4, [%r8 + 0x0b20]
	.word 0xc36a2514  ! 548: PREFETCH_I	prefetch	[%r8 + 0x0514], #one_read
	.word 0xc4022000  ! 549: LDUW_I	lduw	[%r8 + 0x0000], %r2
	.word 0x84d20009  ! 550: UMULcc_R	umulcc 	%r8, %r9, %r2
	.word 0xceea2a1c  ! 551: LDSTUBA_I	ldstuba	%r7, [%r8 + 0x0a1c] %asi
	.word 0x8143e019  ! 552: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside 
	.word 0x8143e009  ! 553: MEMBAR	membar	#LoadLoad | #StoreStore 
	.word 0x8143c000  ! 554: STBAR	stbar
	.word 0x827a0009  ! 555: SDIV_R	sdiv 	%r8, %r9, %r1
	.word 0xc26a27b8  ! 556: LDSTUB_I	ldstub	%r1, [%r8 + 0x07b8]
	.word 0x00800004  ! 557: BN	bn  	<label_0x4>
	.word 0x8143c000  ! 558: STBAR	stbar
	.word 0x24800004  ! 559: BLE	ble,a	<label_0x4>
	.word 0xe80a2fe0  ! 560: LDUB_I	ldub	[%r8 + 0x0fe0], %r20
	.word 0x8143e063  ! 561: MEMBAR	membar	#LoadLoad | #StoreLoad | #MemIssue | #Sync 
	.word 0xc5e22009  ! 562: CASA_R	casa	[%r8] %asi, %r9, %r2
	.word 0xaaf20009  ! 563: UDIVcc_R	udivcc 	%r8, %r9, %r21
	.word 0x8d6a0009  ! 564: SDIVX_R	sdivx	%r8, %r9, %r6
	.word 0xc36a2dfc  ! 565: PREFETCH_I	prefetch	[%r8 + 0x0dfc], #one_read
	.word 0xe6f21009  ! 566: STXA_R	stxa	%r19, [%r8 + %r9] 0x80
	.word 0xf48a1009  ! 567: LDUBA_R	lduba	[%r8, %r9] 0x80, %r26
	.word 0x8c522734  ! 569: UMUL_I	umul 	%r8, 0x0734, %r6
	.word 0xfd2228bc  ! 570: STF_I	st	%f30, [0x08bc, %r8]
	.word 0xfad22f04  ! 571: LDSHA_I	ldsha	[%r8, + 0x0f04] %asi, %r29
	.word 0x8a6a27a8  ! 572: UDIVX_I	udivx 	%r8, 0x07a8, %r5
	.word 0xd41a0009  ! 573: LDD_R	ldd	[%r8 + %r9], %r10
	.word 0xd6922d3c  ! 574: LDUHA_I	lduha	[%r8, + 0x0d3c] %asi, %r11
	.word 0xc6fa1009  ! 575: SWAPA_R	swapa	%r3, [%r8 + %r9] 0x80
	.word 0xca4a0009  ! 576: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0x8143e00e  ! 577: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore 
	.word 0xc3ea28a0  ! 578: PREFETCHA_I	prefetcha	[%r8, + 0x08a0] %asi, #one_read
	.word 0xd46a0009  ! 579: LDSTUB_R	ldstub	%r10, [%r8 + %r9]
	.word 0xfe8a1009  ! 581: LDUBA_R	lduba	[%r8, %r9] 0x80, %r31
	.word 0x2c800004  ! 582: BNEG	bneg,a	<label_0x4>
	.word 0xc6b21009  ! 583: STHA_R	stha	%r3, [%r8 + %r9] 0x80
	.word 0x85220009  ! 584: MULScc_R	mulscc 	%r8, %r9, %r2
	.word 0x864a0009  ! 585: MULX_R	mulx 	%r8, %r9, %r3
	.word 0x8fa20829  ! 586: FADDs	fadds	%f8, %f9, %f7
	.word 0x8143e00e  ! 587: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore 
	.word 0x8143e00c  ! 588: MEMBAR	membar	#LoadStore | #StoreStore 
	.word 0x8143e003  ! 589: MEMBAR	membar	#LoadLoad | #StoreLoad 
	.word 0xa46a0009  ! 590: UDIVX_R	udivx 	%r8, %r9, %r18
	.word 0xc36a29d8  ! 591: PREFETCH_I	prefetch	[%r8 + 0x09d8], #one_read
	.word 0x20800004  ! 592: BN	bn,a	<label_0x4>
	.word 0x2eca0008  ! 594: BRGEZ	brgez,a,pt	%8,<label_0xa0008>
	.word 0xc8f22900  ! 595: STXA_I	stxa	%r4, [%r8 + 0x0900] %asi
	.word 0x8143e03a  ! 597: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside | #MemIssue 
	.word 0xcbe21009  ! 599: CASA_I	casa	[%r8] 0x80, %r9, %r5
	.word 0xe0a22628  ! 600: STWA_I	stwa	%r16, [%r8 + 0x0628] %asi
	.word 0x8e4a2dd0  ! 601: MULX_I	mulx 	%r8, 0x0dd0, %r7
	.word 0x946a0009  ! 602: UDIVX_R	udivx 	%r8, %r9, %r10
	.word 0xd6c22c48  ! 603: LDSWA_I	ldswa	[%r8, + 0x0c48] %asi, %r11
	.word 0xcc821009  ! 604: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r6
	.word 0x36800004  ! 605: BGE	bge,a	<label_0x4>
	.word 0xb6d20009  ! 606: UMULcc_R	umulcc 	%r8, %r9, %r27
	.word 0x98522774  ! 607: UMUL_I	umul 	%r8, 0x0774, %r12
	.word 0xeef21009  ! 608: STXA_R	stxa	%r23, [%r8 + %r9] 0x80
	.word 0xc3ea2b2c  ! 609: PREFETCHA_I	prefetcha	[%r8, + 0x0b2c] %asi, #one_read
	.word 0x8e7a2060  ! 610: SDIV_I	sdiv 	%r8, 0x0060, %r7
	.word 0x2a800008  ! 611: BCS	bcs,a	<label_0x8>
	.word 0xda4a211c  ! 612: LDSB_I	ldsb	[%r8 + 0x011c], %r13
	.word 0xd8f22680  ! 613: STXA_I	stxa	%r12, [%r8 + 0x0680] %asi
	.word 0xafa20829  ! 614: FADDs	fadds	%f8, %f9, %f23
	.word 0xf2f22ee8  ! 615: STXA_I	stxa	%r25, [%r8 + 0x0ee8] %asi
	.word 0xc33a2f50  ! 616: STDF_I	std	%f1, [0x0f50, %r8]
	.word 0xd6da1009  ! 618: LDXA_R	ldxa	[%r8, %r9] 0x80, %r11
	.word 0xe1222aec  ! 619: STF_I	st	%f16, [0x0aec, %r8]
	.word 0xc4020009  ! 620: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0x8ba20829  ! 621: FADDs	fadds	%f8, %f9, %f5
	.word 0x28800008  ! 622: BLEU	bleu,a	<label_0x8>
	.word 0xc36a2650  ! 623: PREFETCH_I	prefetch	[%r8 + 0x0650], #one_read
	.word 0x9a722b5c  ! 624: UDIV_I	udiv 	%r8, 0x0b5c, %r13
	.word 0x9af20009  ! 625: UDIVcc_R	udivcc 	%r8, %r9, %r13
	.word 0xb2720009  ! 626: UDIV_R	udiv 	%r8, %r9, %r25
	.word 0x8143c000  ! 627: STBAR	stbar
	.word 0xb0fa0009  ! 628: SDIVcc_R	sdivcc 	%r8, %r9, %r24
	.word 0xce420009  ! 629: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0x8143e035  ! 630: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside | #MemIssue 
	.word 0x02ca0004  ! 631: BRZ	brz  ,pt	%8,<label_0xa0004>
	.word 0xec1228c0  ! 632: LDUH_I	lduh	[%r8 + 0x08c0], %r22
	.word 0xceaa1009  ! 633: STBA_R	stba	%r7, [%r8 + %r9] 0x80
	.word 0xc25a0009  ! 634: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xc36a2fcc  ! 635: PREFETCH_I	prefetch	[%r8 + 0x0fcc], #one_read
	.word 0x8143c000  ! 636: STBAR	stbar
	.word 0x8f6a0009  ! 637: SDIVX_R	sdivx	%r8, %r9, %r7
	.word 0xbef22f1c  ! 638: UDIVcc_I	udivcc 	%r8, 0x0f1c, %r31
	.word 0xc53a0009  ! 639: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc81a2020  ! 640: LDD_I	ldd	[%r8 + 0x0020], %r4
	.word 0xbc6a0009  ! 641: UDIVX_R	udivx 	%r8, %r9, %r30
	.word 0x8143c000  ! 642: STBAR	stbar
	.word 0xc64a2238  ! 643: LDSB_I	ldsb	[%r8 + 0x0238], %r3
	.word 0x8922266c  ! 644: MULScc_I	mulscc 	%r8, 0x066c, %r4
	.word 0x28800008  ! 645: BLEU	bleu,a	<label_0x8>
	.word 0x8a7a2b04  ! 647: SDIV_I	sdiv 	%r8, 0x0b04, %r5
	.word 0xfc921009  ! 648: LDUHA_R	lduha	[%r8, %r9] 0x80, %r30
	.word 0x9da20929  ! 649: FMULs	fmuls	%f8, %f9, %f14
	.word 0xde0a0009  ! 650: LDUB_R	ldub	[%r8 + %r9], %r15
	.word 0xf4ba2278  ! 651: STDA_I	stda	%r26, [%r8 + 0x0278] %asi
	.word 0x89a209a9  ! 652: FDIVs	fdivs	%f8, %f9, %f4
	.word 0x0e800004  ! 653: BVS	bvs  	<label_0x4>
	.word 0xc44a0009  ! 654: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0x8143e06f  ! 655: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #MemIssue | #Sync 
	.word 0x8143c000  ! 656: STBAR	stbar
	.word 0xbc4a22a4  ! 657: MULX_I	mulx 	%r8, 0x02a4, %r30
	.word 0xda4a2aec  ! 658: LDSB_I	ldsb	[%r8 + 0x0aec], %r13
	.word 0xdef21009  ! 659: STXA_R	stxa	%r15, [%r8 + %r9] 0x80
	.word 0xebf22009  ! 660: CASXA_R	casxa	[%r8]%asi, %r9, %r21
	.word 0xcec21009  ! 661: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r7
	.word 0xc36a28d0  ! 662: PREFETCH_I	prefetch	[%r8 + 0x08d0], #one_read
	.word 0xcada1009  ! 663: LDXA_R	ldxa	[%r8, %r9] 0x80, %r5
	.word 0xc5220009  ! 665: STF_R	st	%f2, [%r9, %r8]
	.word 0xc4aa1009  ! 666: STBA_R	stba	%r2, [%r8 + %r9] 0x80
	.word 0xebf22009  ! 667: CASXA_R	casxa	[%r8]%asi, %r9, %r21
	.word 0xcbf22009  ! 668: CASXA_R	casxa	[%r8]%asi, %r9, %r5
	.word 0xc45a0009  ! 669: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xc8fa1009  ! 670: SWAPA_R	swapa	%r4, [%r8 + %r9] 0x80
	.word 0x84522318  ! 671: UMUL_I	umul 	%r8, 0x0318, %r2
	.word 0xfef21009  ! 672: STXA_R	stxa	%r31, [%r8 + %r9] 0x80
	.word 0x867a2314  ! 673: SDIV_I	sdiv 	%r8, 0x0314, %r3
	.word 0xc8fa1009  ! 674: SWAPA_R	swapa	%r4, [%r8 + %r9] 0x80
	.word 0xca520009  ! 675: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xba720009  ! 676: UDIV_R	udiv 	%r8, %r9, %r29
	.word 0xceea2c64  ! 677: LDSTUBA_I	ldstuba	%r7, [%r8 + 0x0c64] %asi
	.word 0x8143e007  ! 678: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore 
	.word 0xcc422fe8  ! 679: LDSW_I	ldsw	[%r8 + 0x0fe8], %r6
	.word 0xc41a2d00  ! 680: LDD_I	ldd	[%r8 + 0x0d00], %r2
	.word 0x8143e033  ! 681: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside | #MemIssue 
	.word 0xead21009  ! 682: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r21
	.word 0xf80a2290  ! 683: LDUB_I	ldub	[%r8 + 0x0290], %r28
	.word 0xc3ea2274  ! 684: PREFETCHA_I	prefetcha	[%r8, + 0x0274] %asi, #one_read
	.word 0xe8aa25ac  ! 685: STBA_I	stba	%r20, [%r8 + 0x05ac] %asi
	.word 0x0e800004  ! 686: BVS	bvs  	<label_0x4>
	.word 0x82da0009  ! 687: SMULcc_R	smulcc 	%r8, %r9, %r1
	.word 0xcc6a2954  ! 688: LDSTUB_I	ldstub	%r6, [%r8 + 0x0954]
	.word 0xc2fa1009  ! 689: SWAPA_R	swapa	%r1, [%r8 + %r9] 0x80
	.word 0xb66a2418  ! 690: UDIVX_I	udivx 	%r8, 0x0418, %r27
	.word 0xcaaa1009  ! 691: STBA_R	stba	%r5, [%r8 + %r9] 0x80
	.word 0x876a2148  ! 692: SDIVX_I	sdivx	%r8, 0x0148, %r3
	.word 0xce5226a8  ! 693: LDSH_I	ldsh	[%r8 + 0x06a8], %r7
	.word 0x8143c000  ! 694: STBAR	stbar
	.word 0x8fa208a9  ! 695: FSUBs	fsubs	%f8, %f9, %f7
	.word 0x8143c000  ! 696: STBAR	stbar
	.word 0xf2921009  ! 697: LDUHA_R	lduha	[%r8, %r9] 0x80, %r25
	.word 0xb04a224c  ! 698: MULX_I	mulx 	%r8, 0x024c, %r24
	.word 0xcea2297c  ! 699: STWA_I	stwa	%r7, [%r8 + 0x097c] %asi
	.word 0x87a208a9  ! 700: FSUBs	fsubs	%f8, %f9, %f3
	.word 0xc68a2994  ! 701: LDUBA_I	lduba	[%r8, + 0x0994] %asi, %r3
	.word 0xdcb22c88  ! 702: STHA_I	stha	%r14, [%r8 + 0x0c88] %asi
	.word 0x86da0009  ! 703: SMULcc_R	smulcc 	%r8, %r9, %r3
	.word 0xeb3a2480  ! 704: STDF_I	std	%f21, [0x0480, %r8]
	.word 0xceb21009  ! 705: STHA_R	stha	%r7, [%r8 + %r9] 0x80
	.word 0xc3ea2a80  ! 706: PREFETCHA_I	prefetcha	[%r8, + 0x0a80] %asi, #one_read
	.word 0x886a2afc  ! 707: UDIVX_I	udivx 	%r8, 0x0afc, %r4
	.word 0x856a2a40  ! 708: SDIVX_I	sdivx	%r8, 0x0a40, %r2
	.word 0x8143c000  ! 709: STBAR	stbar
	.word 0x825a0009  ! 710: SMUL_R	smul 	%r8, %r9, %r1
	.word 0x06800004  ! 711: BL	bl  	<label_0x4>
	.word 0x8143c000  ! 712: STBAR	stbar
	.word 0xa25a2890  ! 713: SMUL_I	smul 	%r8, 0x0890, %r17
	.word 0xc64a27ec  ! 714: LDSB_I	ldsb	[%r8 + 0x07ec], %r3
	.word 0x8143e061  ! 715: MEMBAR	membar	#LoadLoad | #MemIssue | #Sync 
	.word 0xc6f22e60  ! 716: STXA_I	stxa	%r3, [%r8 + 0x0e60] %asi
	.word 0x83a20929  ! 717: FMULs	fmuls	%f8, %f9, %f1
	.word 0xc8020009  ! 718: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xeaf21009  ! 719: STXA_R	stxa	%r21, [%r8 + %r9] 0x80
	.word 0xd8822d8c  ! 720: LDUWA_I	lduwa	[%r8, + 0x0d8c] %asi, %r12
	.word 0x97a20829  ! 721: FADDs	fadds	%f8, %f9, %f11
	.word 0xc8ca1009  ! 722: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r4
	.word 0xc6b21009  ! 723: STHA_R	stha	%r3, [%r8 + %r9] 0x80
	.word 0x04ca0008  ! 724: BRLEZ	brlez  ,pt	%8,<label_0xa0008>
	.word 0x82fa0009  ! 725: SDIVcc_R	sdivcc 	%r8, %r9, %r1
	.word 0x9f6a2dc0  ! 726: SDIVX_I	sdivx	%r8, 0x0dc0, %r15
	.word 0x22c20004  ! 727: BRZ	brz,a,nt	%8,<label_0x20004>
	.word 0x0e800004  ! 728: BVS	bvs  	<label_0x4>
	.word 0xd9e21009  ! 729: CASA_I	casa	[%r8] 0x80, %r9, %r12
	.word 0x896a2654  ! 730: SDIVX_I	sdivx	%r8, 0x0654, %r4
	.word 0x8da20929  ! 731: FMULs	fmuls	%f8, %f9, %f6
	.word 0x2aca0004  ! 732: BRNZ	brnz,a,pt	%8,<label_0xa0004>
	.word 0xc8fa1009  ! 733: SWAPA_R	swapa	%r4, [%r8 + %r9] 0x80
	.word 0xeaea2254  ! 734: LDSTUBA_I	ldstuba	%r21, [%r8 + 0x0254] %asi
	.word 0xc4120009  ! 735: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xd8ba1009  ! 736: STDA_R	stda	%r12, [%r8 + %r9] 0x80
	.word 0x8ed221ac  ! 737: UMULcc_I	umulcc 	%r8, 0x01ac, %r7
	.word 0xcde21009  ! 738: CASA_I	casa	[%r8] 0x80, %r9, %r6
	.word 0xc8ba29a8  ! 739: STDA_I	stda	%r4, [%r8 + 0x09a8] %asi
	.word 0xccb21009  ! 740: STHA_R	stha	%r6, [%r8 + %r9] 0x80
	.word 0x836a2d58  ! 741: SDIVX_I	sdivx	%r8, 0x0d58, %r1
	.word 0xc45a0009  ! 742: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0x984a0009  ! 743: MULX_R	mulx 	%r8, %r9, %r12
	.word 0xea422c08  ! 744: LDSW_I	ldsw	[%r8 + 0x0c08], %r21
	.word 0x8c7a2390  ! 745: SDIV_I	sdiv 	%r8, 0x0390, %r6
	.word 0xc36a2c50  ! 746: PREFETCH_I	prefetch	[%r8 + 0x0c50], #one_read
	.word 0xc4522584  ! 748: LDSH_I	ldsh	[%r8 + 0x0584], %r2
	.word 0xce6a2204  ! 749: LDSTUB_I	ldstub	%r7, [%r8 + 0x0204]
	.word 0xb0520009  ! 750: UMUL_R	umul 	%r8, %r9, %r24
	.word 0x28800008  ! 751: BLEU	bleu,a	<label_0x8>
	.word 0x82d20009  ! 752: UMULcc_R	umulcc 	%r8, %r9, %r1
	.word 0x8143c000  ! 753: STBAR	stbar
	.word 0x8ba20929  ! 754: FMULs	fmuls	%f8, %f9, %f5
	.word 0x985a0009  ! 755: SMUL_R	smul 	%r8, %r9, %r12
	.word 0xdd3a2c88  ! 756: STDF_I	std	%f14, [0x0c88, %r8]
	.word 0xc8022bc4  ! 757: LDUW_I	lduw	[%r8 + 0x0bc4], %r4
	.word 0xb9a208a9  ! 758: FSUBs	fsubs	%f8, %f9, %f28
	.word 0xc3ea2fb8  ! 759: PREFETCHA_I	prefetcha	[%r8, + 0x0fb8] %asi, #one_read
	.word 0xce420009  ! 760: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xdac22b3c  ! 762: LDSWA_I	ldswa	[%r8, + 0x0b3c] %asi, %r13
	.word 0x8143e01f  ! 764: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #Lookaside 
	.word 0x9ba20929  ! 766: FMULs	fmuls	%f8, %f9, %f13
	.word 0x0c800004  ! 767: BNEG	bneg  	<label_0x4>
	.word 0xc48a1009  ! 769: LDUBA_R	lduba	[%r8, %r9] 0x80, %r2
	.word 0x8143c000  ! 770: STBAR	stbar
	.word 0x8fa209a9  ! 771: FDIVs	fdivs	%f8, %f9, %f7
	.word 0xa64a0009  ! 772: MULX_R	mulx 	%r8, %r9, %r19
	.word 0x8143c000  ! 773: STBAR	stbar
	.word 0xcf3a0009  ! 774: STDF_R	std	%f7, [%r9, %r8]
	.word 0xe8020009  ! 775: LDUW_R	lduw	[%r8 + %r9], %r20
	.word 0x8143e014  ! 776: MEMBAR	membar	#LoadStore | #Lookaside 
	.word 0xef2222bc  ! 777: STF_I	st	%f23, [0x02bc, %r8]
	.word 0xc5f22009  ! 778: CASXA_R	casxa	[%r8]%asi, %r9, %r2
	.word 0x96722f74  ! 779: UDIV_I	udiv 	%r8, 0x0f74, %r11
	.word 0x8143c000  ! 780: STBAR	stbar
	.word 0x98d20009  ! 781: UMULcc_R	umulcc 	%r8, %r9, %r12
	.word 0x8a6a0009  ! 782: UDIVX_R	udivx 	%r8, %r9, %r5
	.word 0xc3f21009  ! 783: CASXA_I	casxa	[%r8] 0x80, %r9, %r1
	.word 0xc89a1009  ! 784: LDDA_R	ldda	[%r8, %r9] 0x80, %r4
	.word 0xbad225ac  ! 785: UMULcc_I	umulcc 	%r8, 0x05ac, %r29
	.word 0xc8da1009  ! 786: LDXA_R	ldxa	[%r8, %r9] 0x80, %r4
	.word 0xc3ea2798  ! 787: PREFETCHA_I	prefetcha	[%r8, + 0x0798] %asi, #one_read
	.word 0xc9e22009  ! 788: CASA_R	casa	[%r8] %asi, %r9, %r4
	.word 0xbda20929  ! 789: FMULs	fmuls	%f8, %f9, %f30
	.word 0xc4b21009  ! 790: STHA_R	stha	%r2, [%r8 + %r9] 0x80
	.word 0xc292273c  ! 791: LDUHA_I	lduha	[%r8, + 0x073c] %asi, %r1
	.word 0x88d2248c  ! 792: UMULcc_I	umulcc 	%r8, 0x048c, %r4
	.word 0x8143c000  ! 793: STBAR	stbar
	.word 0xc2b21009  ! 794: STHA_R	stha	%r1, [%r8 + %r9] 0x80
	.word 0xe33a0009  ! 795: STDF_R	std	%f17, [%r9, %r8]
	.word 0xdcd22ea8  ! 796: LDSHA_I	ldsha	[%r8, + 0x0ea8] %asi, %r14
	.word 0xca0a0009  ! 798: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xc2ea1009  ! 799: LDSTUBA_R	ldstuba	%r1, [%r8 + %r9] 0x80
	.word 0xc48a2f24  ! 800: LDUBA_I	lduba	[%r8, + 0x0f24] %asi, %r2
	.word 0xc6c21009  ! 801: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r3
	.word 0x896a2858  ! 802: SDIVX_I	sdivx	%r8, 0x0858, %r4
	.word 0xe46a289c  ! 803: LDSTUB_I	ldstub	%r18, [%r8 + 0x089c]
	.word 0xc4a21009  ! 804: STWA_R	stwa	%r2, [%r8 + %r9] 0x80
	.word 0xecda26f0  ! 805: LDXA_I	ldxa	[%r8, + 0x06f0] %asi, %r22
	.word 0xc36a2820  ! 806: PREFETCH_I	prefetch	[%r8 + 0x0820], #one_read
	.word 0x0c800008  ! 807: BNEG	bneg  	<label_0x8>
	.word 0xc53a2620  ! 808: STDF_I	std	%f2, [0x0620, %r8]
	.word 0x8143c000  ! 809: STBAR	stbar
	.word 0x16800008  ! 810: BGE	bge  	<label_0x8>
	.word 0x8af20009  ! 811: UDIVcc_R	udivcc 	%r8, %r9, %r5
	.word 0xc9222df4  ! 812: STF_I	st	%f4, [0x0df4, %r8]
	.word 0xc2d21009  ! 813: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r1
	.word 0x8143e03e  ! 814: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0x1e800004  ! 815: BVC	bvc  	<label_0x4>
	.word 0x83a20829  ! 816: FADDs	fadds	%f8, %f9, %f1
	.word 0xa3220009  ! 818: MULScc_R	mulscc 	%r8, %r9, %r17
	.word 0x1c800008  ! 819: BPOS	bpos  	<label_0x8>
	.word 0xc28a264c  ! 820: LDUBA_I	lduba	[%r8, + 0x064c] %asi, %r1
	.word 0x8143c000  ! 821: STBAR	stbar
	.word 0xb04a0009  ! 822: MULX_R	mulx 	%r8, %r9, %r24
	.word 0xe84a0009  ! 823: LDSB_R	ldsb	[%r8 + %r9], %r20
	.word 0x836a0009  ! 824: SDIVX_R	sdivx	%r8, %r9, %r1
	.word 0x8143c000  ! 825: STBAR	stbar
	.word 0x0e800004  ! 826: BVS	bvs  	<label_0x4>
	.word 0xd4c22624  ! 827: LDSWA_I	ldswa	[%r8, + 0x0624] %asi, %r10
	.word 0xc3ea26ac  ! 828: PREFETCHA_I	prefetcha	[%r8, + 0x06ac] %asi, #one_read
	.word 0x9f6a0009  ! 829: SDIVX_R	sdivx	%r8, %r9, %r15
	.word 0xc6821009  ! 831: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r3
	.word 0x2cca0004  ! 832: BRGZ	brgz,a,pt	%8,<label_0xa0004>
	.word 0xc60a0009  ! 833: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xfeca1009  ! 834: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r31
	.word 0xc2ca1009  ! 835: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r1
	.word 0x8143c000  ! 836: STBAR	stbar
	.word 0xe26a21c8  ! 837: LDSTUB_I	ldstub	%r17, [%r8 + 0x01c8]
	.word 0xcf220009  ! 838: STF_R	st	%f7, [%r9, %r8]
	.word 0xce420009  ! 839: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xc2da2620  ! 840: LDXA_I	ldxa	[%r8, + 0x0620] %asi, %r1
	.word 0xfdf21009  ! 841: CASXA_I	casxa	[%r8] 0x80, %r9, %r30
	.word 0x86d20009  ! 842: UMULcc_R	umulcc 	%r8, %r9, %r3
	.word 0xc2b21009  ! 843: STHA_R	stha	%r1, [%r8 + %r9] 0x80
	.word 0xd6c22ebc  ! 844: LDSWA_I	ldswa	[%r8, + 0x0ebc] %asi, %r11
	.word 0x8143e072  ! 845: MEMBAR	membar	#StoreLoad | #Lookaside | #MemIssue | #Sync 
	.word 0x836a0009  ! 846: SDIVX_R	sdivx	%r8, %r9, %r1
	.word 0x99a20929  ! 847: FMULs	fmuls	%f8, %f9, %f12
	.word 0xcac22b0c  ! 848: LDSWA_I	ldswa	[%r8, + 0x0b0c] %asi, %r5
	.word 0xc36a2630  ! 849: PREFETCH_I	prefetch	[%r8 + 0x0630], #one_read
	.word 0x8143c000  ! 850: STBAR	stbar
	.word 0xff3a0009  ! 851: STDF_R	std	%f31, [%r9, %r8]
	.word 0xcaaa2238  ! 852: STBA_I	stba	%r5, [%r8 + 0x0238] %asi
	.word 0x8c6a0009  ! 853: UDIVX_R	udivx 	%r8, %r9, %r6
	.word 0xa25a2ddc  ! 854: SMUL_I	smul 	%r8, 0x0ddc, %r17
	.word 0x82d22b84  ! 855: UMULcc_I	umulcc 	%r8, 0x0b84, %r1
	.word 0xcb22261c  ! 856: STF_I	st	%f5, [0x061c, %r8]
	.word 0x867a27c4  ! 857: SDIV_I	sdiv 	%r8, 0x07c4, %r3
	.word 0x8143c000  ! 858: STBAR	stbar
	.word 0x8143c000  ! 859: STBAR	stbar
	.word 0x02c20008  ! 860: BRZ	brz  ,nt	%8,<label_0x20008>
	.word 0x18800008  ! 861: BGU	bgu  	<label_0x8>
	.word 0xc73a2fc8  ! 862: STDF_I	std	%f3, [0x0fc8, %r8]
	.word 0x88d20009  ! 863: UMULcc_R	umulcc 	%r8, %r9, %r4
	.word 0x8143c000  ! 864: STBAR	stbar
	.word 0xe09a1009  ! 865: LDDA_R	ldda	[%r8, %r9] 0x80, %r16
	.word 0xf6b21009  ! 866: STHA_R	stha	%r27, [%r8 + %r9] 0x80
	.word 0xec1a0009  ! 867: LDD_R	ldd	[%r8 + %r9], %r22
	.word 0xc7220009  ! 868: STF_R	st	%f3, [%r9, %r8]
	.word 0xf65a0009  ! 869: LDX_R	ldx	[%r8 + %r9], %r27
	.word 0xc8da2648  ! 870: LDXA_I	ldxa	[%r8, + 0x0648] %asi, %r4
	.word 0xc36a25bc  ! 871: PREFETCH_I	prefetch	[%r8 + 0x05bc], #one_read
	.word 0x945a2ac4  ! 872: SMUL_I	smul 	%r8, 0x0ac4, %r10
	.word 0xc2022db4  ! 873: LDUW_I	lduw	[%r8 + 0x0db4], %r1
	.word 0xf40a23e4  ! 874: LDUB_I	ldub	[%r8 + 0x03e4], %r26
	.word 0xca82276c  ! 875: LDUWA_I	lduwa	[%r8, + 0x076c] %asi, %r5
	.word 0x8a7a2130  ! 876: SDIV_I	sdiv 	%r8, 0x0130, %r5
	.word 0x827a21cc  ! 877: SDIV_I	sdiv 	%r8, 0x01cc, %r1
	.word 0x8143c000  ! 878: STBAR	stbar
	.word 0x8143e009  ! 879: MEMBAR	membar	#LoadLoad | #StoreStore 
	.word 0x88522a1c  ! 880: UMUL_I	umul 	%r8, 0x0a1c, %r4
	.word 0x8143e003  ! 881: MEMBAR	membar	#LoadLoad | #StoreLoad 
	.word 0x8143c000  ! 882: STBAR	stbar
	.word 0xb672208c  ! 883: UDIV_I	udiv 	%r8, 0x008c, %r27
	.word 0xd81a0009  ! 884: LDD_R	ldd	[%r8 + %r9], %r12
	.word 0xcf220009  ! 885: STF_R	st	%f7, [%r9, %r8]
	.word 0x8143e014  ! 886: MEMBAR	membar	#LoadStore | #Lookaside 
	.word 0xb45a20ac  ! 887: SMUL_I	smul 	%r8, 0x00ac, %r26
	.word 0xc36a2da0  ! 888: PREFETCH_I	prefetch	[%r8 + 0x0da0], #one_read
	.word 0xc6d21009  ! 890: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r3
	.word 0xc4fa2a18  ! 891: SWAPA_I	swapa	%r2, [%r8 + 0x0a18] %asi
	.word 0xd4ba20f8  ! 893: STDA_I	stda	%r10, [%r8 + 0x00f8] %asi
	.word 0xc8ea1009  ! 894: LDSTUBA_R	ldstuba	%r4, [%r8 + %r9] 0x80
	.word 0x8143e06c  ! 895: MEMBAR	membar	#LoadStore | #StoreStore | #MemIssue | #Sync 
	.word 0xc8420009  ! 896: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xc80221f4  ! 897: LDUW_I	lduw	[%r8 + 0x01f4], %r4
	.word 0xce8a2928  ! 898: LDUBA_I	lduba	[%r8, + 0x0928] %asi, %r7
	.word 0x87220009  ! 899: MULScc_R	mulscc 	%r8, %r9, %r3
	.word 0x8143e00c  ! 900: MEMBAR	membar	#LoadStore | #StoreStore 
	.word 0x0c800004  ! 901: BNEG	bneg  	<label_0x4>
	.word 0xc8522ae8  ! 902: LDSH_I	ldsh	[%r8 + 0x0ae8], %r4
	.word 0xc6ca1009  ! 903: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r3
	.word 0xc87a0009  ! 904: SWAP_R	swap	%r4, [%r8 + %r9]
	.word 0x96d22ed8  ! 905: UMULcc_I	umulcc 	%r8, 0x0ed8, %r11
	.word 0xfc8222d0  ! 906: LDUWA_I	lduwa	[%r8, + 0x02d0] %asi, %r30
	.word 0x2a800004  ! 907: BCS	bcs,a	<label_0x4>
	.word 0x8143c000  ! 908: STBAR	stbar
	.word 0xc33a0009  ! 909: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc64a2ff0  ! 910: LDSB_I	ldsb	[%r8 + 0x0ff0], %r3
	.word 0xcada1009  ! 911: LDXA_R	ldxa	[%r8, %r9] 0x80, %r5
	.word 0xc27a2ab8  ! 912: SWAP_I	swap	%r1, [%r8 + 0x0ab8]
	.word 0x8143e02e  ! 913: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #MemIssue 
	.word 0x84d22628  ! 914: UMULcc_I	umulcc 	%r8, 0x0628, %r2
	.word 0xc60a0009  ! 915: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xd6ea2c20  ! 916: LDSTUBA_I	ldstuba	%r11, [%r8 + 0x0c20] %asi
	.word 0xc7f21009  ! 917: CASXA_I	casxa	[%r8] 0x80, %r9, %r3
	.word 0xc46a2538  ! 918: LDSTUB_I	ldstub	%r2, [%r8 + 0x0538]
	.word 0xc3ea2410  ! 919: PREFETCHA_I	prefetcha	[%r8, + 0x0410] %asi, #one_read
	.word 0xc73a0009  ! 920: STDF_R	std	%f3, [%r9, %r8]
	.word 0x8143c000  ! 921: STBAR	stbar
	.word 0xe65a0009  ! 922: LDX_R	ldx	[%r8 + %r9], %r19
	.word 0x24800008  ! 923: BLE	ble,a	<label_0x8>
	.word 0xef222a78  ! 924: STF_I	st	%f23, [0x0a78, %r8]
	.word 0xc8fa1009  ! 927: SWAPA_R	swapa	%r4, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 928: STBAR	stbar
	.word 0xd8ba2f00  ! 929: STDA_I	stda	%r12, [%r8 + 0x0f00] %asi
	.word 0xde0a2028  ! 931: LDUB_I	ldub	[%r8 + 0x0028], %r15
	.word 0xb7a208a9  ! 932: FSUBs	fsubs	%f8, %f9, %f27
	.word 0x2ac20004  ! 933: BRNZ	brnz,a,nt	%8,<label_0x20004>
	.word 0x885a2600  ! 934: SMUL_I	smul 	%r8, 0x0600, %r4
	.word 0xdc9a1009  ! 935: LDDA_R	ldda	[%r8, %r9] 0x80, %r14
	.word 0x0ec20008  ! 936: BRGEZ	brgez  ,nt	%8,<label_0x20008>
	.word 0x88f22048  ! 937: UDIVcc_I	udivcc 	%r8, 0x0048, %r4
	.word 0xc36a285c  ! 938: PREFETCH_I	prefetch	[%r8 + 0x085c], #one_read
	.word 0x40000004  ! 939: CALL	call	disp30_4
	.word 0x97a209a9  ! 940: FDIVs	fdivs	%f8, %f9, %f11
	.word 0x8da20929  ! 941: FMULs	fmuls	%f8, %f9, %f6
	.word 0x864a0009  ! 942: MULX_R	mulx 	%r8, %r9, %r3
	.word 0xcf220009  ! 943: STF_R	st	%f7, [%r9, %r8]
	.word 0x8143c000  ! 944: STBAR	stbar
	.word 0x40000004  ! 946: CALL	call	disp30_4
	.word 0xf26a2af4  ! 947: LDSTUB_I	ldstub	%r25, [%r8 + 0x0af4]
	.word 0x89220009  ! 949: MULScc_R	mulscc 	%r8, %r9, %r4
	.word 0xccd21009  ! 950: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r6
	.word 0x2ec20004  ! 951: BRGEZ	brgez,a,nt	%8,<label_0x20004>
	.word 0x82520009  ! 952: UMUL_R	umul 	%r8, %r9, %r1
	.word 0xc6921009  ! 953: LDUHA_R	lduha	[%r8, %r9] 0x80, %r3
	.word 0x82da25b8  ! 954: SMULcc_I	smulcc 	%r8, 0x05b8, %r1
	.word 0xf09a1009  ! 955: LDDA_R	ldda	[%r8, %r9] 0x80, %r24
	.word 0xcc8a2c38  ! 956: LDUBA_I	lduba	[%r8, + 0x0c38] %asi, %r6
	.word 0xc26a2bd0  ! 957: LDSTUB_I	ldstub	%r1, [%r8 + 0x0bd0]
	.word 0xcad21009  ! 958: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r5
	.word 0xcb3a0009  ! 959: STDF_R	std	%f5, [%r9, %r8]
	.word 0x86fa0009  ! 960: SDIVcc_R	sdivcc 	%r8, %r9, %r3
	.word 0x85a20929  ! 961: FMULs	fmuls	%f8, %f9, %f2
	.word 0x0aca0004  ! 962: BRNZ	brnz  ,pt	%8,<label_0xa0004>
	.word 0xc3ea2120  ! 963: PREFETCHA_I	prefetcha	[%r8, + 0x0120] %asi, #one_read
	.word 0x8a722850  ! 964: UDIV_I	udiv 	%r8, 0x0850, %r5
	.word 0x8143c000  ! 965: STBAR	stbar
	.word 0xc6520009  ! 966: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0x97a20929  ! 967: FMULs	fmuls	%f8, %f9, %f11
	.word 0x8143c000  ! 968: STBAR	stbar
	.word 0xefe22009  ! 969: CASA_R	casa	[%r8] %asi, %r9, %r23
	.word 0x40000004  ! 970: CALL	call	disp30_4
	.word 0x8afa0009  ! 973: SDIVcc_R	sdivcc 	%r8, %r9, %r5
	.word 0x8b6a0009  ! 974: SDIVX_R	sdivx	%r8, %r9, %r5
	.word 0xea520009  ! 975: LDSH_R	ldsh	[%r8 + %r9], %r21
	.word 0xc33a0009  ! 976: STDF_R	std	%f1, [%r9, %r8]
	.word 0x887a0009  ! 977: SDIV_R	sdiv 	%r8, %r9, %r4
	.word 0xe73a26c0  ! 978: STDF_I	std	%f19, [0x06c0, %r8]
	.word 0x8143c000  ! 979: STBAR	stbar
	.word 0xc86a0009  ! 980: LDSTUB_R	ldstub	%r4, [%r8 + %r9]
	.word 0xb5a20929  ! 981: FMULs	fmuls	%f8, %f9, %f26
	.word 0xc36a21c0  ! 982: PREFETCH_I	prefetch	[%r8 + 0x01c0], #one_read
	.word 0xe85a0009  ! 983: LDX_R	ldx	[%r8 + %r9], %r20
	.word 0xba522c4c  ! 984: UMUL_I	umul 	%r8, 0x0c4c, %r29
	.word 0x24800004  ! 985: BLE	ble,a	<label_0x4>
	.word 0xc7f22009  ! 986: CASXA_R	casxa	[%r8]%asi, %r9, %r3
	.word 0x845221b0  ! 987: UMUL_I	umul 	%r8, 0x01b0, %r2
	.word 0xec1a0009  ! 988: LDD_R	ldd	[%r8 + %r9], %r22
	.word 0x24800004  ! 989: BLE	ble,a	<label_0x4>
	.word 0xdc6a2204  ! 990: LDSTUB_I	ldstub	%r14, [%r8 + 0x0204]
	.word 0xd68a240c  ! 991: LDUBA_I	lduba	[%r8, + 0x040c] %asi, %r11
	.word 0xc5220009  ! 992: STF_R	st	%f2, [%r9, %r8]
	.word 0x8143e035  ! 993: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside | #MemIssue 
	.word 0x9ed20009  ! 994: UMULcc_R	umulcc 	%r8, %r9, %r15
	.word 0xee8a20e8  ! 995: LDUBA_I	lduba	[%r8, + 0x00e8] %asi, %r23
	.word 0xcaaa2794  ! 996: STBA_I	stba	%r5, [%r8 + 0x0794] %asi
	.word 0x89a209a9  ! 997: FDIVs	fdivs	%f8, %f9, %f4
	.word 0xbef22fb8  ! 998: UDIVcc_I	udivcc 	%r8, 0x0fb8, %r31
	.word 0x8143c000  ! 999: STBAR	stbar
        ta      T_GOOD_TRAP

th_main_3:
        setx  MAIN_BASE_DATA_VA, %r1, %r8
        setx  0x00000000000007b0, %g1, %r9
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
        setx  0xd9daa06e0c7457ad, %g1, %r0
        setx  0x4ae97153872ebce3, %g1, %r1
        setx  0x2fd40e5d9598e12b, %g1, %r2
        setx  0x6443ba0a8a370f63, %g1, %r3
        setx  0x129a09cd92d1cc18, %g1, %r4
        setx  0x2faf5c782d36a214, %g1, %r5
        setx  0x86c145267a1f5eaf, %g1, %r6
        setx  0x6bd45c8899f608c0, %g1, %r7
        setx  0x04e79cb66ed06514, %g1, %r10
        setx  0xfe80b4893b8189b4, %g1, %r11
        setx  0x48f149232e11dc76, %g1, %r12
        setx  0xf2fd752936a76260, %g1, %r13
        setx  0xd9584b935ad7b9a8, %g1, %r14
        setx  0x5e49a0dae10799ec, %g1, %r15
        setx  0xe5549c57675568df, %g1, %r16
        setx  0xcaddad922758bb37, %g1, %r17
        setx  0x6b75e6ea8ab61429, %g1, %r18
        setx  0x773183f018cfc03b, %g1, %r19
        setx  0xde17ecb51e3535e4, %g1, %r20
        setx  0xe2a946287f826f30, %g1, %r21
        setx  0x898ffa56d8be10ed, %g1, %r22
        setx  0xda2d7d02af626bf5, %g1, %r23
        setx  0xd4912d915490d70b, %g1, %r24
        setx  0xe0b30c9174d8cc55, %g1, %r25
        setx  0x80e7ae422f5b69ed, %g1, %r26
        setx  0xb834692889e2d0e7, %g1, %r27
        setx  0x5c14f6c3e95c88cf, %g1, %r28
        setx  0xdfd2fc4f1879bce7, %g1, %r29
        setx  0xe1d41ebdf3db4984, %g1, %r30
        setx  0xfbf6a2e748cd4d40, %g1, %r31
	.word 0xe64a0009  ! 5: LDSB_R	ldsb	[%r8 + %r9], %r19
	.word 0x32800004  ! 7: BNE	bne,a	<label_0x4>
	.word 0x82fa0009  ! 9: SDIVcc_R	sdivcc 	%r8, %r9, %r1
	.word 0x8ef20009  ! 10: UDIVcc_R	udivcc 	%r8, %r9, %r7
	.word 0x88fa0009  ! 11: SDIVcc_R	sdivcc 	%r8, %r9, %r4
	.word 0xc66a0009  ! 13: LDSTUB_R	ldstub	%r3, [%r8 + %r9]
	.word 0xe4ba2140  ! 15: STDA_I	stda	%r18, [%r8 + 0x0140] %asi
	.word 0xf81a0009  ! 16: LDD_R	ldd	[%r8 + %r9], %r28
	.word 0x30800004  ! 17: BA	ba,a	<label_0x4>
	.word 0x97220009  ! 18: MULScc_R	mulscc 	%r8, %r9, %r11
	.word 0xc7f21009  ! 19: CASXA_I	casxa	[%r8] 0x80, %r9, %r3
	.word 0xb7a209a9  ! 20: FDIVs	fdivs	%f8, %f9, %f27
	.word 0xc6120009  ! 21: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xc73a27d8  ! 22: STDF_I	std	%f3, [0x07d8, %r8]
	.word 0xed3a25f0  ! 23: STDF_I	std	%f22, [0x05f0, %r8]
	.word 0xcc5a0009  ! 24: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0x9a4a0009  ! 25: MULX_R	mulx 	%r8, %r9, %r13
	.word 0x8fa20929  ! 26: FMULs	fmuls	%f8, %f9, %f7
	.word 0xc2ea2994  ! 27: LDSTUBA_I	ldstuba	%r1, [%r8 + 0x0994] %asi
	.word 0x8143e011  ! 28: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xcbe21009  ! 29: CASA_I	casa	[%r8] 0x80, %r9, %r5
	.word 0xc8d226f8  ! 30: LDSHA_I	ldsha	[%r8, + 0x06f8] %asi, %r4
	.word 0x8ed22368  ! 31: UMULcc_I	umulcc 	%r8, 0x0368, %r7
	.word 0xc3ea26b4  ! 32: PREFETCHA_I	prefetcha	[%r8, + 0x06b4] %asi, #one_read
	.word 0x2cca0004  ! 33: BRGZ	brgz,a,pt	%8,<label_0xa0004>
	.word 0x8143e079  ! 34: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xc2ca1009  ! 35: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r1
	.word 0xe0d22758  ! 36: LDSHA_I	ldsha	[%r8, + 0x0758] %asi, %r16
	.word 0x8143c000  ! 37: STBAR	stbar
	.word 0x9ada0009  ! 38: SMULcc_R	smulcc 	%r8, %r9, %r13
	.word 0x8ed20009  ! 40: UMULcc_R	umulcc 	%r8, %r9, %r7
	.word 0xc8fa1009  ! 41: SWAPA_R	swapa	%r4, [%r8 + %r9] 0x80
	.word 0x9da208a9  ! 42: FSUBs	fsubs	%f8, %f9, %f14
	.word 0x40000004  ! 43: CALL	call	disp30_4
	.word 0x8a522658  ! 44: UMUL_I	umul 	%r8, 0x0658, %r5
	.word 0x8143e03e  ! 45: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0xc36a2ed4  ! 46: PREFETCH_I	prefetch	[%r8 + 0x0ed4], #one_read
	.word 0xa2720009  ! 47: UDIV_R	udiv 	%r8, %r9, %r17
	.word 0x8fa209a9  ! 49: FDIVs	fdivs	%f8, %f9, %f7
	.word 0xa0720009  ! 50: UDIV_R	udiv 	%r8, %r9, %r16
	.word 0x8143e033  ! 51: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside | #MemIssue 
	.word 0x8143c000  ! 52: STBAR	stbar
	.word 0x8143c000  ! 53: STBAR	stbar
	.word 0x84fa0009  ! 54: SDIVcc_R	sdivcc 	%r8, %r9, %r2
	.word 0xcdf21009  ! 55: CASXA_I	casxa	[%r8] 0x80, %r9, %r6
	.word 0x8143c000  ! 56: STBAR	stbar
	.word 0xf84a0009  ! 57: LDSB_R	ldsb	[%r8 + %r9], %r28
	.word 0xc4d22170  ! 58: LDSHA_I	ldsha	[%r8, + 0x0170] %asi, %r2
	.word 0xe87a0009  ! 59: SWAP_R	swap	%r20, [%r8 + %r9]
	.word 0xa44a0009  ! 60: MULX_R	mulx 	%r8, %r9, %r18
	.word 0xc45a0009  ! 61: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xd8ba1009  ! 62: STDA_R	stda	%r12, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 63: STBAR	stbar
	.word 0x8d2227b8  ! 64: MULScc_I	mulscc 	%r8, 0x07b8, %r6
	.word 0xc6120009  ! 65: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xc44a2c44  ! 66: LDSB_I	ldsb	[%r8 + 0x0c44], %r2
	.word 0x85a20929  ! 67: FMULs	fmuls	%f8, %f9, %f2
	.word 0xe81a0009  ! 68: LDD_R	ldd	[%r8 + %r9], %r20
	.word 0xf4ba1009  ! 69: STDA_R	stda	%r26, [%r8 + %r9] 0x80
	.word 0x08800008  ! 70: BLEU	bleu  	<label_0x8>
	.word 0xb0fa0009  ! 71: SDIVcc_R	sdivcc 	%r8, %r9, %r24
	.word 0x8cf20009  ! 72: UDIVcc_R	udivcc 	%r8, %r9, %r6
	.word 0xda8a1009  ! 73: LDUBA_R	lduba	[%r8, %r9] 0x80, %r13
	.word 0xc4a221d4  ! 74: STWA_I	stwa	%r2, [%r8 + 0x01d4] %asi
	.word 0xc8fa1009  ! 75: SWAPA_R	swapa	%r4, [%r8 + %r9] 0x80
	.word 0x02800004  ! 76: BE	be  	<label_0x4>
	.word 0xbda209a9  ! 77: FDIVs	fdivs	%f8, %f9, %f30
	.word 0x8143e041  ! 78: MEMBAR	membar	#LoadLoad | #Sync 
	.word 0x87a209a9  ! 79: FDIVs	fdivs	%f8, %f9, %f3
	.word 0xccfa2d8c  ! 80: SWAPA_I	swapa	%r6, [%r8 + 0x0d8c] %asi
	.word 0xfa7a25ac  ! 81: SWAP_I	swap	%r29, [%r8 + 0x05ac]
	.word 0xc4ba2300  ! 82: STDA_I	stda	%r2, [%r8 + 0x0300] %asi
	.word 0x976a0009  ! 83: SDIVX_R	sdivx	%r8, %r9, %r11
	.word 0xf6a22cbc  ! 84: STWA_I	stwa	%r27, [%r8 + 0x0cbc] %asi
	.word 0xcaca2c78  ! 85: LDSBA_I	ldsba	[%r8, + 0x0c78] %asi, %r5
	.word 0x8143e02e  ! 86: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #MemIssue 
	.word 0xc3ea2434  ! 87: PREFETCHA_I	prefetcha	[%r8, + 0x0434] %asi, #one_read
	.word 0xc3f22009  ! 88: CASXA_R	casxa	[%r8]%asi, %r9, %r1
	.word 0xcea227e4  ! 89: STWA_I	stwa	%r7, [%r8 + 0x07e4] %asi
	.word 0xfaaa1009  ! 90: STBA_R	stba	%r29, [%r8 + %r9] 0x80
	.word 0x83222510  ! 92: MULScc_I	mulscc 	%r8, 0x0510, %r1
	.word 0x32800008  ! 93: BNE	bne,a	<label_0x8>
	.word 0xf8ba2f08  ! 94: STDA_I	stda	%r28, [%r8 + 0x0f08] %asi
	.word 0xcc1a2580  ! 95: LDD_I	ldd	[%r8 + 0x0580], %r6
	.word 0x8143e054  ! 96: MEMBAR	membar	#LoadStore | #Lookaside | #Sync 
	.word 0x32800004  ! 97: BNE	bne,a	<label_0x4>
	.word 0xa0520009  ! 98: UMUL_R	umul 	%r8, %r9, %r16
	.word 0xdbf21009  ! 99: CASXA_I	casxa	[%r8] 0x80, %r9, %r13
	.word 0xc3ea22c0  ! 100: PREFETCHA_I	prefetcha	[%r8, + 0x02c0] %asi, #one_read
	.word 0xc4b226ac  ! 101: STHA_I	stha	%r2, [%r8 + 0x06ac] %asi
	.word 0xbe5a0009  ! 102: SMUL_R	smul 	%r8, %r9, %r31
	.word 0x8143e03c  ! 103: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0xc46a0009  ! 104: LDSTUB_R	ldstub	%r2, [%r8 + %r9]
	.word 0x00800008  ! 105: BN	bn  	<label_0x8>
	.word 0xfa5222e4  ! 106: LDSH_I	ldsh	[%r8 + 0x02e4], %r29
	.word 0x0e800008  ! 107: BVS	bvs  	<label_0x8>
	.word 0xcf220009  ! 108: STF_R	st	%f7, [%r9, %r8]
	.word 0xc4c21009  ! 109: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r2
	.word 0xe8aa1009  ! 110: STBA_R	stba	%r20, [%r8 + %r9] 0x80
	.word 0xe93a0009  ! 112: STDF_R	std	%f20, [%r9, %r8]
	.word 0xc41a20c8  ! 113: LDD_I	ldd	[%r8 + 0x00c8], %r2
	.word 0xc6f22720  ! 114: STXA_I	stxa	%r3, [%r8 + 0x0720] %asi
	.word 0x89a20829  ! 115: FADDs	fadds	%f8, %f9, %f4
	.word 0xc3ea2c1c  ! 116: PREFETCHA_I	prefetcha	[%r8, + 0x0c1c] %asi, #one_read
	.word 0x88720009  ! 117: UDIV_R	udiv 	%r8, %r9, %r4
	.word 0x85a20829  ! 118: FADDs	fadds	%f8, %f9, %f2
	.word 0x26800004  ! 119: BL	bl,a	<label_0x4>
	.word 0x84520009  ! 121: UMUL_R	umul 	%r8, %r9, %r2
	.word 0x8e7a0009  ! 123: SDIV_R	sdiv 	%r8, %r9, %r7
	.word 0x847a0009  ! 124: SDIV_R	sdiv 	%r8, %r9, %r2
	.word 0xc4ca28bc  ! 125: LDSBA_I	ldsba	[%r8, + 0x08bc] %asi, %r2
	.word 0xc2da1009  ! 127: LDXA_R	ldxa	[%r8, %r9] 0x80, %r1
	.word 0x9c6a0009  ! 128: UDIVX_R	udivx 	%r8, %r9, %r14
	.word 0xec9a2698  ! 129: LDDA_I	ldda	[%r8, + 0x0698] %asi, %r22
	.word 0xf01a22e0  ! 130: LDD_I	ldd	[%r8 + 0x02e0], %r24
	.word 0xd89a1009  ! 131: LDDA_R	ldda	[%r8, %r9] 0x80, %r12
	.word 0xc4ba1009  ! 132: STDA_R	stda	%r2, [%r8 + %r9] 0x80
	.word 0xc81a0009  ! 133: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xc2ca20dc  ! 134: LDSBA_I	ldsba	[%r8, + 0x00dc] %asi, %r1
	.word 0x0a800004  ! 135: BCS	bcs  	<label_0x4>
	.word 0x8143c000  ! 136: STBAR	stbar
	.word 0xc5220009  ! 137: STF_R	st	%f2, [%r9, %r8]
	.word 0xc3ea244c  ! 138: PREFETCHA_I	prefetcha	[%r8, + 0x044c] %asi, #one_read
	.word 0x8143c000  ! 140: STBAR	stbar
	.word 0x824a24ac  ! 141: MULX_I	mulx 	%r8, 0x04ac, %r1
	.word 0xecd22604  ! 142: LDSHA_I	ldsha	[%r8, + 0x0604] %asi, %r22
	.word 0xc47a2c88  ! 143: SWAP_I	swap	%r2, [%r8 + 0x0c88]
	.word 0x82722ddc  ! 144: UDIV_I	udiv 	%r8, 0x0ddc, %r1
	.word 0xca8a1009  ! 145: LDUBA_R	lduba	[%r8, %r9] 0x80, %r5
	.word 0xb26a26a4  ! 147: UDIVX_I	udivx 	%r8, 0x06a4, %r25
	.word 0xc8ca1009  ! 149: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r4
	.word 0x8143e068  ! 150: MEMBAR	membar	#StoreStore | #MemIssue | #Sync 
	.word 0x86da21a0  ! 151: SMULcc_I	smulcc 	%r8, 0x01a0, %r3
	.word 0xc4aa26c8  ! 153: STBA_I	stba	%r2, [%r8 + 0x06c8] %asi
	.word 0x8efa26a0  ! 154: SDIVcc_I	sdivcc 	%r8, 0x06a0, %r7
	.word 0xb25a0009  ! 155: SMUL_R	smul 	%r8, %r9, %r25
	.word 0x8cf20009  ! 156: UDIVcc_R	udivcc 	%r8, %r9, %r6
	.word 0x8fa20829  ! 157: FADDs	fadds	%f8, %f9, %f7
	.word 0xc73a2a08  ! 158: STDF_I	std	%f3, [0x0a08, %r8]
	.word 0xe73a0009  ! 159: STDF_R	std	%f19, [%r9, %r8]
	.word 0x22800004  ! 160: BE	be,a	<label_0x4>
	.word 0x8143c000  ! 161: STBAR	stbar
	.word 0xc7e22009  ! 162: CASA_R	casa	[%r8] %asi, %r9, %r3
	.word 0xca422698  ! 163: LDSW_I	ldsw	[%r8 + 0x0698], %r5
	.word 0x87a20829  ! 164: FADDs	fadds	%f8, %f9, %f3
	.word 0x846a0009  ! 165: UDIVX_R	udivx 	%r8, %r9, %r2
	.word 0x40000004  ! 166: CALL	call	disp30_4
	.word 0xdbf22009  ! 167: CASXA_R	casxa	[%r8]%asi, %r9, %r13
	.word 0xd8aa20e8  ! 168: STBA_I	stba	%r12, [%r8 + 0x00e8] %asi
	.word 0xc3ea23f4  ! 169: PREFETCHA_I	prefetcha	[%r8, + 0x03f4] %asi, #one_read
	.word 0xc87a0009  ! 170: SWAP_R	swap	%r4, [%r8 + %r9]
	.word 0x8143c000  ! 171: STBAR	stbar
	.word 0x8143e029  ! 172: MEMBAR	membar	#LoadLoad | #StoreStore | #MemIssue 
	.word 0x30800008  ! 173: BA	ba,a	<label_0x8>
	.word 0xc4ca1009  ! 174: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r2
	.word 0x866a0009  ! 175: UDIVX_R	udivx 	%r8, %r9, %r3
	.word 0xced21009  ! 176: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r7
	.word 0x30800004  ! 177: BA	ba,a	<label_0x4>
	.word 0xc8b2247c  ! 178: STHA_I	stha	%r4, [%r8 + 0x047c] %asi
	.word 0xa0f20009  ! 180: UDIVcc_R	udivcc 	%r8, %r9, %r16
	.word 0x86d22da0  ! 181: UMULcc_I	umulcc 	%r8, 0x0da0, %r3
	.word 0xc36a23a4  ! 182: PREFETCH_I	prefetch	[%r8 + 0x03a4], #one_read
	.word 0x30800004  ! 183: BA	ba,a	<label_0x4>
	.word 0xc8ba1009  ! 184: STDA_R	stda	%r4, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 185: STBAR	stbar
	.word 0xd4522ab4  ! 186: LDSH_I	ldsh	[%r8 + 0x0ab4], %r10
	.word 0x8143c000  ! 187: STBAR	stbar
	.word 0x876a2354  ! 188: SDIVX_I	sdivx	%r8, 0x0354, %r3
	.word 0xe8a223e8  ! 189: STWA_I	stwa	%r20, [%r8 + 0x03e8] %asi
	.word 0xc84a252c  ! 190: LDSB_I	ldsb	[%r8 + 0x052c], %r4
	.word 0x87a20929  ! 191: FMULs	fmuls	%f8, %f9, %f3
	.word 0xf89a1009  ! 193: LDDA_R	ldda	[%r8, %r9] 0x80, %r28
	.word 0x8143c000  ! 194: STBAR	stbar
	.word 0xc46a0009  ! 195: LDSTUB_R	ldstub	%r2, [%r8 + %r9]
	.word 0x85a20829  ! 196: FADDs	fadds	%f8, %f9, %f2
	.word 0x8143c000  ! 197: STBAR	stbar
	.word 0xe8ba1009  ! 198: STDA_R	stda	%r20, [%r8 + %r9] 0x80
	.word 0x8eda2764  ! 199: SMULcc_I	smulcc 	%r8, 0x0764, %r7
	.word 0x85a20929  ! 200: FMULs	fmuls	%f8, %f9, %f2
	.word 0x88520009  ! 201: UMUL_R	umul 	%r8, %r9, %r4
	.word 0xccda1009  ! 202: LDXA_R	ldxa	[%r8, %r9] 0x80, %r6
	.word 0xc87a28d8  ! 203: SWAP_I	swap	%r4, [%r8 + 0x08d8]
	.word 0x8ef20009  ! 204: UDIVcc_R	udivcc 	%r8, %r9, %r7
	.word 0x8143c000  ! 205: STBAR	stbar
	.word 0x865229d8  ! 206: UMUL_I	umul 	%r8, 0x09d8, %r3
	.word 0xce520009  ! 207: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xccba1009  ! 208: STDA_R	stda	%r6, [%r8 + %r9] 0x80
	.word 0x825a0009  ! 209: SMUL_R	smul 	%r8, %r9, %r1
	.word 0x28800008  ! 210: BLEU	bleu,a	<label_0x8>
	.word 0xc6f22700  ! 211: STXA_I	stxa	%r3, [%r8 + 0x0700] %asi
	.word 0xce0a0009  ! 212: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xeef21009  ! 213: STXA_R	stxa	%r23, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 214: STBAR	stbar
	.word 0x82d20009  ! 215: UMULcc_R	umulcc 	%r8, %r9, %r1
	.word 0xc36a28c0  ! 216: PREFETCH_I	prefetch	[%r8 + 0x08c0], #one_read
	.word 0xa67a2264  ! 217: SDIV_I	sdiv 	%r8, 0x0264, %r19
	.word 0xceaa1009  ! 218: STBA_R	stba	%r7, [%r8 + %r9] 0x80
	.word 0xfc9a1009  ! 220: LDDA_R	ldda	[%r8, %r9] 0x80, %r30
	.word 0xc48a1009  ! 221: LDUBA_R	lduba	[%r8, %r9] 0x80, %r2
	.word 0x24800008  ! 222: BLE	ble,a	<label_0x8>
	.word 0xd8fa1009  ! 223: SWAPA_R	swapa	%r12, [%r8 + %r9] 0x80
	.word 0xceaa1009  ! 224: STBA_R	stba	%r7, [%r8 + %r9] 0x80
	.word 0xcc7a0009  ! 225: SWAP_R	swap	%r6, [%r8 + %r9]
	.word 0x8143e057  ! 226: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside | #Sync 
	.word 0x8143e027  ! 227: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #MemIssue 
	.word 0xd4ba1009  ! 228: STDA_R	stda	%r10, [%r8 + %r9] 0x80
	.word 0xe28a269c  ! 229: LDUBA_I	lduba	[%r8, + 0x069c] %asi, %r17
	.word 0xcd3a2590  ! 230: STDF_I	std	%f6, [0x0590, %r8]
	.word 0xfcea2800  ! 231: LDSTUBA_I	ldstuba	%r30, [%r8 + 0x0800] %asi
	.word 0xa84a262c  ! 232: MULX_I	mulx 	%r8, 0x062c, %r20
	.word 0x12800004  ! 233: BNE	bne  	<label_0x4>
	.word 0xf05a26c8  ! 234: LDX_I	ldx	[%r8 + 0x06c8], %r24
	.word 0xdc9a1009  ! 235: LDDA_R	ldda	[%r8, %r9] 0x80, %r14
	.word 0x08800004  ! 236: BLEU	bleu  	<label_0x4>
	.word 0x28800004  ! 237: BLEU	bleu,a	<label_0x4>
	.word 0xcff22009  ! 238: CASXA_R	casxa	[%r8]%asi, %r9, %r7
	.word 0xc3ea2010  ! 239: PREFETCHA_I	prefetcha	[%r8, + 0x0010] %asi, #one_read
	.word 0xca6a2e94  ! 240: LDSTUB_I	ldstub	%r5, [%r8 + 0x0e94]
	.word 0x8143e068  ! 241: MEMBAR	membar	#StoreStore | #MemIssue | #Sync 
	.word 0xf9220009  ! 242: STF_R	st	%f28, [%r9, %r8]
	.word 0xf6922ae8  ! 243: LDUHA_I	lduha	[%r8, + 0x0ae8] %asi, %r27
	.word 0xc8ea22d4  ! 244: LDSTUBA_I	ldstuba	%r4, [%r8 + 0x02d4] %asi
	.word 0x3e800004  ! 245: BVC	bvc,a	<label_0x4>
	.word 0x88fa0009  ! 246: SDIVcc_R	sdivcc 	%r8, %r9, %r4
	.word 0xccc21009  ! 247: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r6
	.word 0x8143c000  ! 248: STBAR	stbar
	.word 0x8143e023  ! 249: MEMBAR	membar	#LoadLoad | #StoreLoad | #MemIssue 
	.word 0xac7a2b04  ! 250: SDIV_I	sdiv 	%r8, 0x0b04, %r22
	.word 0xc6c220b8  ! 251: LDSWA_I	ldswa	[%r8, + 0x00b8] %asi, %r3
	.word 0x82da2978  ! 252: SMULcc_I	smulcc 	%r8, 0x0978, %r1
	.word 0xc44a0009  ! 253: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xd88a2608  ! 254: LDUBA_I	lduba	[%r8, + 0x0608] %asi, %r12
	.word 0x8143c000  ! 255: STBAR	stbar
	.word 0x85a20829  ! 256: FADDs	fadds	%f8, %f9, %f2
	.word 0xcb3a0009  ! 257: STDF_R	std	%f5, [%r9, %r8]
	.word 0x887a0009  ! 258: SDIV_R	sdiv 	%r8, %r9, %r4
	.word 0xc4fa1009  ! 259: SWAPA_R	swapa	%r2, [%r8 + %r9] 0x80
	.word 0xec120009  ! 260: LDUH_R	lduh	[%r8 + %r9], %r22
	.word 0x88d20009  ! 261: UMULcc_R	umulcc 	%r8, %r9, %r4
	.word 0x867a2ba0  ! 262: SDIV_I	sdiv 	%r8, 0x0ba0, %r3
	.word 0xee0a0009  ! 263: LDUB_R	ldub	[%r8 + %r9], %r23
	.word 0xc52223b4  ! 264: STF_I	st	%f2, [0x03b4, %r8]
	.word 0xc36a2f3c  ! 265: PREFETCH_I	prefetch	[%r8 + 0x0f3c], #one_read
	.word 0xc2fa1009  ! 266: SWAPA_R	swapa	%r1, [%r8 + %r9] 0x80
	.word 0x8e7a0009  ! 267: SDIV_R	sdiv 	%r8, %r9, %r7
	.word 0x8cda23b8  ! 270: SMULcc_I	smulcc 	%r8, 0x03b8, %r6
	.word 0xc6aa29a8  ! 271: STBA_I	stba	%r3, [%r8 + 0x09a8] %asi
	.word 0xfeca1009  ! 272: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r31
	.word 0x8efa26cc  ! 273: SDIVcc_I	sdivcc 	%r8, 0x06cc, %r7
	.word 0xfa921009  ! 274: LDUHA_R	lduha	[%r8, %r9] 0x80, %r29
	.word 0xecf21009  ! 275: STXA_R	stxa	%r22, [%r8 + %r9] 0x80
	.word 0xc33a2728  ! 276: STDF_I	std	%f1, [0x0728, %r8]
	.word 0xdfe22009  ! 277: CASA_R	casa	[%r8] %asi, %r9, %r15
	.word 0x8e522f28  ! 278: UMUL_I	umul 	%r8, 0x0f28, %r7
	.word 0xd7f21009  ! 279: CASXA_I	casxa	[%r8] 0x80, %r9, %r11
	.word 0xf27a2354  ! 280: SWAP_I	swap	%r25, [%r8 + 0x0354]
	.word 0x885a0009  ! 281: SMUL_R	smul 	%r8, %r9, %r4
	.word 0x22800004  ! 282: BE	be,a	<label_0x4>
	.word 0xae720009  ! 283: UDIV_R	udiv 	%r8, %r9, %r23
	.word 0x8143c000  ! 284: STBAR	stbar
	.word 0xc36a2a58  ! 285: PREFETCH_I	prefetch	[%r8 + 0x0a58], #one_read
	.word 0xde5a25a0  ! 286: LDX_I	ldx	[%r8 + 0x05a0], %r15
	.word 0x8143c000  ! 287: STBAR	stbar
	.word 0xfcea1009  ! 288: LDSTUBA_R	ldstuba	%r30, [%r8 + %r9] 0x80
	.word 0x8b6a0009  ! 289: SDIVX_R	sdivx	%r8, %r9, %r5
	.word 0x9fa209a9  ! 290: FDIVs	fdivs	%f8, %f9, %f15
	.word 0x8143e064  ! 291: MEMBAR	membar	#LoadStore | #MemIssue | #Sync 
	.word 0xef222210  ! 292: STF_I	st	%f23, [0x0210, %r8]
	.word 0x8e522bd0  ! 293: UMUL_I	umul 	%r8, 0x0bd0, %r7
	.word 0x86fa0009  ! 294: SDIVcc_R	sdivcc 	%r8, %r9, %r3
	.word 0x0e800004  ! 295: BVS	bvs  	<label_0x4>
	.word 0x14800004  ! 296: BG	bg  	<label_0x4>
	.word 0xbe7a0009  ! 297: SDIV_R	sdiv 	%r8, %r9, %r31
	.word 0x02800008  ! 298: BE	be  	<label_0x8>
	.word 0xcaf229d0  ! 299: STXA_I	stxa	%r5, [%r8 + 0x09d0] %asi
	.word 0xc3ea28ec  ! 300: PREFETCHA_I	prefetcha	[%r8, + 0x08ec] %asi, #one_read
	.word 0x8cfa2030  ! 301: SDIVcc_I	sdivcc 	%r8, 0x0030, %r6
	.word 0x8143c000  ! 302: STBAR	stbar
	.word 0x20800004  ! 303: BN	bn,a	<label_0x4>
	.word 0xc2fa1009  ! 304: SWAPA_R	swapa	%r1, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 305: STBAR	stbar
	.word 0xfab22500  ! 306: STHA_I	stha	%r29, [%r8 + 0x0500] %asi
	.word 0xcaea21cc  ! 307: LDSTUBA_I	ldstuba	%r5, [%r8 + 0x01cc] %asi
	.word 0x8143c000  ! 308: STBAR	stbar
	.word 0x18800004  ! 309: BGU	bgu  	<label_0x4>
	.word 0x16800004  ! 310: BGE	bge  	<label_0x4>
	.word 0xf4aa1009  ! 311: STBA_R	stba	%r26, [%r8 + %r9] 0x80
	.word 0x8da20829  ! 312: FADDs	fadds	%f8, %f9, %f6
	.word 0x824a0009  ! 313: MULX_R	mulx 	%r8, %r9, %r1
	.word 0xc8921009  ! 314: LDUHA_R	lduha	[%r8, %r9] 0x80, %r4
	.word 0x9fa20929  ! 315: FMULs	fmuls	%f8, %f9, %f15
	.word 0xddf22009  ! 316: CASXA_R	casxa	[%r8]%asi, %r9, %r14
	.word 0x856a26bc  ! 317: SDIVX_I	sdivx	%r8, 0x06bc, %r2
	.word 0xd7222cb0  ! 318: STF_I	st	%f11, [0x0cb0, %r8]
	.word 0xcf220009  ! 319: STF_R	st	%f7, [%r9, %r8]
	.word 0xe49a1009  ! 320: LDDA_R	ldda	[%r8, %r9] 0x80, %r18
	.word 0xed222f5c  ! 321: STF_I	st	%f22, [0x0f5c, %r8]
	.word 0xc6da1009  ! 322: LDXA_R	ldxa	[%r8, %r9] 0x80, %r3
	.word 0xc36a2554  ! 323: PREFETCH_I	prefetch	[%r8 + 0x0554], #one_read
	.word 0xccfa1009  ! 324: SWAPA_R	swapa	%r6, [%r8 + %r9] 0x80
	.word 0xc85a29d8  ! 325: LDX_I	ldx	[%r8 + 0x09d8], %r4
	.word 0xd4da2fb8  ! 326: LDXA_I	ldxa	[%r8, + 0x0fb8] %asi, %r10
	.word 0xf07a2a70  ! 327: SWAP_I	swap	%r24, [%r8 + 0x0a70]
	.word 0x8e522918  ! 328: UMUL_I	umul 	%r8, 0x0918, %r7
	.word 0xd4ba1009  ! 329: STDA_R	stda	%r10, [%r8 + %r9] 0x80
	.word 0xd49a2f58  ! 330: LDDA_I	ldda	[%r8, + 0x0f58] %asi, %r10
	.word 0x3a800008  ! 331: BCC	bcc,a	<label_0x8>
	.word 0xe7f21009  ! 332: CASXA_I	casxa	[%r8] 0x80, %r9, %r19
	.word 0xd6ea1009  ! 333: LDSTUBA_R	ldstuba	%r11, [%r8 + %r9] 0x80
	.word 0x22ca0004  ! 334: BRZ	brz,a,pt	%8,<label_0xa0004>
	.word 0x996a20d8  ! 335: SDIVX_I	sdivx	%r8, 0x00d8, %r12
	.word 0xc6a21009  ! 336: STWA_R	stwa	%r3, [%r8 + %r9] 0x80
	.word 0xc6d21009  ! 337: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r3
	.word 0xc33a0009  ! 338: STDF_R	std	%f1, [%r9, %r8]
	.word 0x8143e066  ! 339: MEMBAR	membar	#StoreLoad | #LoadStore | #MemIssue | #Sync 
	.word 0xcdf22009  ! 340: CASXA_R	casxa	[%r8]%asi, %r9, %r6
	.word 0xc8ba1009  ! 341: STDA_R	stda	%r4, [%r8 + %r9] 0x80
	.word 0x836a2b80  ! 342: SDIVX_I	sdivx	%r8, 0x0b80, %r1
	.word 0x86f22180  ! 343: UDIVcc_I	udivcc 	%r8, 0x0180, %r3
	.word 0xc2520009  ! 344: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xc8ba21f8  ! 345: STDA_I	stda	%r4, [%r8 + 0x01f8] %asi
	.word 0x8c522e10  ! 346: UMUL_I	umul 	%r8, 0x0e10, %r6
	.word 0x8cf224dc  ! 347: UDIVcc_I	udivcc 	%r8, 0x04dc, %r6
	.word 0xe6aa1009  ! 348: STBA_R	stba	%r19, [%r8 + %r9] 0x80
	.word 0xa922281c  ! 349: MULScc_I	mulscc 	%r8, 0x081c, %r20
	.word 0xce4a2e64  ! 350: LDSB_I	ldsb	[%r8 + 0x0e64], %r7
	.word 0x8da208a9  ! 351: FSUBs	fsubs	%f8, %f9, %f6
	.word 0xe6022ec4  ! 352: LDUW_I	lduw	[%r8 + 0x0ec4], %r19
	.word 0xcb3a2028  ! 353: STDF_I	std	%f5, [0x0028, %r8]
	.word 0xc36a2b80  ! 354: PREFETCH_I	prefetch	[%r8 + 0x0b80], #one_read
	.word 0xc47a2d8c  ! 355: SWAP_I	swap	%r2, [%r8 + 0x0d8c]
	.word 0xd49a2bd0  ! 356: LDDA_I	ldda	[%r8, + 0x0bd0] %asi, %r10
	.word 0xc4122964  ! 357: LDUH_I	lduh	[%r8 + 0x0964], %r2
	.word 0xce020009  ! 358: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xd4aa1009  ! 359: STBA_R	stba	%r10, [%r8 + %r9] 0x80
	.word 0xe8ba23b8  ! 360: STDA_I	stda	%r20, [%r8 + 0x03b8] %asi
	.word 0xe2122594  ! 361: LDUH_I	lduh	[%r8 + 0x0594], %r17
	.word 0x8afa0009  ! 362: SDIVcc_R	sdivcc 	%r8, %r9, %r5
	.word 0x95a209a9  ! 363: FDIVs	fdivs	%f8, %f9, %f10
	.word 0x966a2294  ! 364: UDIVX_I	udivx 	%r8, 0x0294, %r11
	.word 0x86720009  ! 366: UDIV_R	udiv 	%r8, %r9, %r3
	.word 0xca822614  ! 367: LDUWA_I	lduwa	[%r8, + 0x0614] %asi, %r5
	.word 0x26ca0008  ! 368: BRLZ	brlz,a,pt	%8,<label_0xa0008>
	.word 0x86f22f78  ! 369: UDIVcc_I	udivcc 	%r8, 0x0f78, %r3
	.word 0x8ad20009  ! 370: UMULcc_R	umulcc 	%r8, %r9, %r5
	.word 0x876a0009  ! 371: SDIVX_R	sdivx	%r8, %r9, %r3
	.word 0x2aca0004  ! 372: BRNZ	brnz,a,pt	%8,<label_0xa0004>
	.word 0x86720009  ! 373: UDIV_R	udiv 	%r8, %r9, %r3
	.word 0xed220009  ! 374: STF_R	st	%f22, [%r9, %r8]
	.word 0xec9a1009  ! 375: LDDA_R	ldda	[%r8, %r9] 0x80, %r22
	.word 0xc93a0009  ! 376: STDF_R	std	%f4, [%r9, %r8]
	.word 0x87a20829  ! 377: FADDs	fadds	%f8, %f9, %f3
	.word 0xa5a209a9  ! 378: FDIVs	fdivs	%f8, %f9, %f18
	.word 0x3a800008  ! 379: BCC	bcc,a	<label_0x8>
	.word 0xc2aa2f7c  ! 380: STBA_I	stba	%r1, [%r8 + 0x0f7c] %asi
	.word 0x8ad22fa8  ! 381: UMULcc_I	umulcc 	%r8, 0x0fa8, %r5
	.word 0x886a2500  ! 382: UDIVX_I	udivx 	%r8, 0x0500, %r4
	.word 0x8143e05a  ! 383: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside | #Sync 
	.word 0xb3a20929  ! 384: FMULs	fmuls	%f8, %f9, %f25
	.word 0x02800004  ! 385: BE	be  	<label_0x4>
	.word 0x10800004  ! 386: BA	ba  	<label_0x4>
	.word 0xc8120009  ! 387: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xbe5a2d30  ! 388: SMUL_I	smul 	%r8, 0x0d30, %r31
	.word 0xc3ea2548  ! 389: PREFETCHA_I	prefetcha	[%r8, + 0x0548] %asi, #one_read
	.word 0x82f22e34  ! 390: UDIVcc_I	udivcc 	%r8, 0x0e34, %r1
	.word 0x0a800004  ! 391: BCS	bcs  	<label_0x4>
	.word 0x8143e027  ! 392: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #MemIssue 
	.word 0xc6420009  ! 393: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0x00800008  ! 394: BN	bn  	<label_0x8>
	.word 0xad22298c  ! 396: MULScc_I	mulscc 	%r8, 0x098c, %r22
	.word 0xb3a208a9  ! 397: FSUBs	fsubs	%f8, %f9, %f25
	.word 0xf09a29b8  ! 398: LDDA_I	ldda	[%r8, + 0x09b8] %asi, %r24
	.word 0x82722100  ! 399: UDIV_I	udiv 	%r8, 0x0100, %r1
	.word 0x8143c000  ! 400: STBAR	stbar
	.word 0xc9f21009  ! 401: CASXA_I	casxa	[%r8] 0x80, %r9, %r4
	.word 0xe81a2610  ! 402: LDD_I	ldd	[%r8 + 0x0610], %r20
	.word 0x88fa2744  ! 403: SDIVcc_I	sdivcc 	%r8, 0x0744, %r4
	.word 0xfe8a1009  ! 404: LDUBA_R	lduba	[%r8, %r9] 0x80, %r31
	.word 0x8afa267c  ! 405: SDIVcc_I	sdivcc 	%r8, 0x067c, %r5
	.word 0x8143c000  ! 406: STBAR	stbar
	.word 0xcc5a0009  ! 407: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xc3ea20b8  ! 408: PREFETCHA_I	prefetcha	[%r8, + 0x00b8] %asi, #one_read
	.word 0x8143e078  ! 409: MEMBAR	membar	#StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0x827227c8  ! 410: UDIV_I	udiv 	%r8, 0x07c8, %r1
	.word 0xbcfa2fdc  ! 411: SDIVcc_I	sdivcc 	%r8, 0x0fdc, %r30
	.word 0xf2922ab0  ! 412: LDUHA_I	lduha	[%r8, + 0x0ab0] %asi, %r25
	.word 0x865a2fb8  ! 413: SMUL_I	smul 	%r8, 0x0fb8, %r3
	.word 0x9c6a2560  ! 414: UDIVX_I	udivx 	%r8, 0x0560, %r14
	.word 0xdc921009  ! 415: LDUHA_R	lduha	[%r8, %r9] 0x80, %r14
	.word 0xd6d21009  ! 416: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r11
	.word 0xca122480  ! 417: LDUH_I	lduh	[%r8 + 0x0480], %r5
	.word 0x8143e002  ! 418: MEMBAR	membar	#StoreLoad 
	.word 0xc8da1009  ! 419: LDXA_R	ldxa	[%r8, %r9] 0x80, %r4
	.word 0xcdf22009  ! 420: CASXA_R	casxa	[%r8]%asi, %r9, %r6
	.word 0x8c522628  ! 421: UMUL_I	umul 	%r8, 0x0628, %r6
	.word 0xcf220009  ! 422: STF_R	st	%f7, [%r9, %r8]
	.word 0xc2a21009  ! 423: STWA_R	stwa	%r1, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 424: STBAR	stbar
	.word 0x827a0009  ! 425: SDIV_R	sdiv 	%r8, %r9, %r1
	.word 0x2a800004  ! 426: BCS	bcs,a	<label_0x4>
	.word 0x8143c000  ! 427: STBAR	stbar
	.word 0x88520009  ! 428: UMUL_R	umul 	%r8, %r9, %r4
	.word 0x8143e052  ! 429: MEMBAR	membar	#StoreLoad | #Lookaside | #Sync 
	.word 0x8143c000  ! 430: STBAR	stbar
	.word 0xacf22944  ! 431: UDIVcc_I	udivcc 	%r8, 0x0944, %r22
	.word 0x00800004  ! 432: BN	bn  	<label_0x4>
	.word 0xc36a23fc  ! 433: PREFETCH_I	prefetch	[%r8 + 0x03fc], #one_read
	.word 0x8143c000  ! 434: STBAR	stbar
	.word 0x10800004  ! 435: BA	ba  	<label_0x4>
	.word 0xc8ba1009  ! 436: STDA_R	stda	%r4, [%r8 + %r9] 0x80
	.word 0xde82279c  ! 437: LDUWA_I	lduwa	[%r8, + 0x079c] %asi, %r15
	.word 0x0c800004  ! 438: BNEG	bneg  	<label_0x4>
	.word 0xc8fa1009  ! 439: SWAPA_R	swapa	%r4, [%r8 + %r9] 0x80
	.word 0xc9e22009  ! 441: CASA_R	casa	[%r8] %asi, %r9, %r4
	.word 0x84522ae8  ! 442: UMUL_I	umul 	%r8, 0x0ae8, %r2
	.word 0x8143c000  ! 443: STBAR	stbar
	.word 0xdc9a1009  ! 444: LDDA_R	ldda	[%r8, %r9] 0x80, %r14
	.word 0x40000008  ! 445: CALL	call	disp30_8
	.word 0x8143e079  ! 446: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0x8143e06f  ! 447: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #MemIssue | #Sync 
	.word 0x8143c000  ! 448: STBAR	stbar
	.word 0x8143e043  ! 449: MEMBAR	membar	#LoadLoad | #StoreLoad | #Sync 
	.word 0xc4d21009  ! 450: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r2
	.word 0xc3ea2bb0  ! 451: PREFETCHA_I	prefetcha	[%r8, + 0x0bb0] %asi, #one_read
	.word 0xcf220009  ! 452: STF_R	st	%f7, [%r9, %r8]
	.word 0xfcda25c8  ! 453: LDXA_I	ldxa	[%r8, + 0x05c8] %asi, %r30
	.word 0x8f220009  ! 454: MULScc_R	mulscc 	%r8, %r9, %r7
	.word 0x84fa0009  ! 455: SDIVcc_R	sdivcc 	%r8, %r9, %r2
	.word 0xa6da0009  ! 456: SMULcc_R	smulcc 	%r8, %r9, %r19
	.word 0x8143c000  ! 457: STBAR	stbar
	.word 0x8fa20929  ! 458: FMULs	fmuls	%f8, %f9, %f7
	.word 0xec420009  ! 459: LDSW_R	ldsw	[%r8 + %r9], %r22
	.word 0x88fa2f1c  ! 461: SDIVcc_I	sdivcc 	%r8, 0x0f1c, %r4
	.word 0xcc520009  ! 462: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xe8822520  ! 463: LDUWA_I	lduwa	[%r8, + 0x0520] %asi, %r20
	.word 0x8143e048  ! 464: MEMBAR	membar	#StoreStore | #Sync 
	.word 0x8fa209a9  ! 465: FDIVs	fdivs	%f8, %f9, %f7
	.word 0xc2921009  ! 466: LDUHA_R	lduha	[%r8, %r9] 0x80, %r1
	.word 0xbe720009  ! 467: UDIV_R	udiv 	%r8, %r9, %r31
	.word 0xcff21009  ! 468: CASXA_I	casxa	[%r8] 0x80, %r9, %r7
	.word 0x82fa0009  ! 469: SDIVcc_R	sdivcc 	%r8, %r9, %r1
	.word 0x8afa0009  ! 470: SDIVcc_R	sdivcc 	%r8, %r9, %r5
	.word 0xc93a2520  ! 471: STDF_I	std	%f4, [0x0520, %r8]
	.word 0x8143c000  ! 472: STBAR	stbar
	.word 0x0c800004  ! 473: BNEG	bneg  	<label_0x4>
	.word 0x04ca0004  ! 474: BRLEZ	brlez  ,pt	%8,<label_0xa0004>
	.word 0xc3e22009  ! 475: CASA_R	casa	[%r8] %asi, %r9, %r1
	.word 0x8143e078  ! 476: MEMBAR	membar	#StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0x8143e02c  ! 477: MEMBAR	membar	#LoadStore | #StoreStore | #MemIssue 
	.word 0xfde21009  ! 478: CASA_I	casa	[%r8] 0x80, %r9, %r30
	.word 0x24ca0004  ! 479: BRLEZ	brlez,a,pt	%8,<label_0xa0004>
	.word 0xc8422e8c  ! 480: LDSW_I	ldsw	[%r8 + 0x0e8c], %r4
	.word 0xc3ea2c14  ! 481: PREFETCHA_I	prefetcha	[%r8, + 0x0c14] %asi, #one_read
	.word 0x8143e029  ! 482: MEMBAR	membar	#LoadLoad | #StoreStore | #MemIssue 
	.word 0x89222f20  ! 483: MULScc_I	mulscc 	%r8, 0x0f20, %r4
	.word 0xccba2768  ! 484: STDA_I	stda	%r6, [%r8 + 0x0768] %asi
	.word 0x8143e067  ! 485: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #MemIssue | #Sync 
	.word 0xce6a0009  ! 486: LDSTUB_R	ldstub	%r7, [%r8 + %r9]
	.word 0x0a800004  ! 487: BCS	bcs  	<label_0x4>
	.word 0x8143c000  ! 488: STBAR	stbar
	.word 0x8143c000  ! 489: STBAR	stbar
	.word 0xc60a2394  ! 490: LDUB_I	ldub	[%r8 + 0x0394], %r3
	.word 0xce7a0009  ! 491: SWAP_R	swap	%r7, [%r8 + %r9]
	.word 0xceea1009  ! 492: LDSTUBA_R	ldstuba	%r7, [%r8 + %r9] 0x80
	.word 0xc8aa1009  ! 493: STBA_R	stba	%r4, [%r8 + %r9] 0x80
	.word 0x8143e039  ! 494: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside | #MemIssue 
	.word 0xd4aa1009  ! 495: STBA_R	stba	%r10, [%r8 + %r9] 0x80
	.word 0xb8720009  ! 496: UDIV_R	udiv 	%r8, %r9, %r28
	.word 0x12800004  ! 497: BNE	bne  	<label_0x4>
	.word 0xc36a2c24  ! 498: PREFETCH_I	prefetch	[%r8 + 0x0c24], #one_read
	.word 0x8ada0009  ! 499: SMULcc_R	smulcc 	%r8, %r9, %r5
	.word 0xca8a1009  ! 500: LDUBA_R	lduba	[%r8, %r9] 0x80, %r5
	.word 0x8143e019  ! 501: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside 
	.word 0xce8222b0  ! 502: LDUWA_I	lduwa	[%r8, + 0x02b0] %asi, %r7
	.word 0x24800004  ! 503: BLE	ble,a	<label_0x4>
	.word 0xd6f222f8  ! 504: STXA_I	stxa	%r11, [%r8 + 0x02f8] %asi
	.word 0xcd220009  ! 505: STF_R	st	%f6, [%r9, %r8]
	.word 0xb3a209a9  ! 506: FDIVs	fdivs	%f8, %f9, %f25
	.word 0xcc5a0009  ! 507: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xb6da0009  ! 508: SMULcc_R	smulcc 	%r8, %r9, %r27
	.word 0xe812233c  ! 509: LDUH_I	lduh	[%r8 + 0x033c], %r20
	.word 0xcd2228f0  ! 510: STF_I	st	%f6, [0x08f0, %r8]
	.word 0xfc020009  ! 511: LDUW_R	lduw	[%r8 + %r9], %r30
	.word 0xfa7a2378  ! 512: SWAP_I	swap	%r29, [%r8 + 0x0378]
	.word 0xc3ea243c  ! 513: PREFETCHA_I	prefetcha	[%r8, + 0x043c] %asi, #one_read
	.word 0xceca2590  ! 514: LDSBA_I	ldsba	[%r8, + 0x0590] %asi, %r7
	.word 0x8c4a0009  ! 515: MULX_R	mulx 	%r8, %r9, %r6
	.word 0xcada2c00  ! 516: LDXA_I	ldxa	[%r8, + 0x0c00] %asi, %r5
	.word 0xada20829  ! 517: FADDs	fadds	%f8, %f9, %f22
	.word 0xcd222e6c  ! 518: STF_I	st	%f6, [0x0e6c, %r8]
	.word 0xbe5a0009  ! 519: SMUL_R	smul 	%r8, %r9, %r31
	.word 0xceea1009  ! 520: LDSTUBA_R	ldstuba	%r7, [%r8 + %r9] 0x80
	.word 0xcc5a2b88  ! 521: LDX_I	ldx	[%r8 + 0x0b88], %r6
	.word 0xcf3a0009  ! 522: STDF_R	std	%f7, [%r9, %r8]
	.word 0x8143e048  ! 523: MEMBAR	membar	#StoreStore | #Sync 
	.word 0x84f20009  ! 524: UDIVcc_R	udivcc 	%r8, %r9, %r2
	.word 0xca6a0009  ! 525: LDSTUB_R	ldstub	%r5, [%r8 + %r9]
	.word 0x8d6a2780  ! 526: SDIVX_I	sdivx	%r8, 0x0780, %r6
	.word 0xc92223d4  ! 527: STF_I	st	%f4, [0x03d4, %r8]
	.word 0xcaaa1009  ! 528: STBA_R	stba	%r5, [%r8 + %r9] 0x80
	.word 0xcff21009  ! 529: CASXA_I	casxa	[%r8] 0x80, %r9, %r7
	.word 0x30800004  ! 530: BA	ba,a	<label_0x4>
	.word 0x8143e04d  ! 531: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Sync 
	.word 0x8e520009  ! 532: UMUL_R	umul 	%r8, %r9, %r7
	.word 0xecaa26b4  ! 533: STBA_I	stba	%r22, [%r8 + 0x06b4] %asi
	.word 0xb8d20009  ! 534: UMULcc_R	umulcc 	%r8, %r9, %r28
	.word 0x8143c000  ! 535: STBAR	stbar
	.word 0xd85a0009  ! 536: LDX_R	ldx	[%r8 + %r9], %r12
	.word 0xd8aa2cf8  ! 537: STBA_I	stba	%r12, [%r8 + 0x0cf8] %asi
	.word 0xcea21009  ! 538: STWA_R	stwa	%r7, [%r8 + %r9] 0x80
	.word 0xeeb2287c  ! 539: STHA_I	stha	%r23, [%r8 + 0x087c] %asi
	.word 0x0ac20004  ! 540: BRNZ	brnz  ,nt	%8,<label_0x20004>
	.word 0x8143e055  ! 541: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside | #Sync 
	.word 0x8ba208a9  ! 542: FSUBs	fsubs	%f8, %f9, %f5
	.word 0x0eca0008  ! 543: BRGEZ	brgez  ,pt	%8,<label_0xa0008>
	.word 0xd6520009  ! 544: LDSH_R	ldsh	[%r8 + %r9], %r11
	.word 0xce7a0009  ! 545: SWAP_R	swap	%r7, [%r8 + %r9]
	.word 0xf0fa2de0  ! 546: SWAPA_I	swapa	%r24, [%r8 + 0x0de0] %asi
	.word 0xd67a2f3c  ! 547: SWAP_I	swap	%r11, [%r8 + 0x0f3c]
	.word 0xc36a234c  ! 548: PREFETCH_I	prefetch	[%r8 + 0x034c], #one_read
	.word 0xc80227dc  ! 549: LDUW_I	lduw	[%r8 + 0x07dc], %r4
	.word 0x96d20009  ! 550: UMULcc_R	umulcc 	%r8, %r9, %r11
	.word 0xc8ea26f4  ! 551: LDSTUBA_I	ldstuba	%r4, [%r8 + 0x06f4] %asi
	.word 0x8143e00a  ! 552: MEMBAR	membar	#StoreLoad | #StoreStore 
	.word 0x8143e03a  ! 553: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside | #MemIssue 
	.word 0x8143c000  ! 554: STBAR	stbar
	.word 0xa67a0009  ! 555: SDIV_R	sdiv 	%r8, %r9, %r19
	.word 0xcc6a208c  ! 556: LDSTUB_I	ldstub	%r6, [%r8 + 0x008c]
	.word 0x20800004  ! 557: BN	bn,a	<label_0x4>
	.word 0x8143c000  ! 558: STBAR	stbar
	.word 0x24800008  ! 559: BLE	ble,a	<label_0x8>
	.word 0xe60a26d0  ! 560: LDUB_I	ldub	[%r8 + 0x06d0], %r19
	.word 0x8143e077  ! 561: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside | #MemIssue | #Sync 
	.word 0xcfe22009  ! 562: CASA_R	casa	[%r8] %asi, %r9, %r7
	.word 0xb6f20009  ! 563: UDIVcc_R	udivcc 	%r8, %r9, %r27
	.word 0x896a0009  ! 564: SDIVX_R	sdivx	%r8, %r9, %r4
	.word 0xc36a2e94  ! 565: PREFETCH_I	prefetch	[%r8 + 0x0e94], #one_read
	.word 0xf4f21009  ! 566: STXA_R	stxa	%r26, [%r8 + %r9] 0x80
	.word 0xc48a1009  ! 567: LDUBA_R	lduba	[%r8, %r9] 0x80, %r2
	.word 0x9e522f2c  ! 569: UMUL_I	umul 	%r8, 0x0f2c, %r15
	.word 0xff2228c0  ! 570: STF_I	st	%f31, [0x08c0, %r8]
	.word 0xc6d22210  ! 571: LDSHA_I	ldsha	[%r8, + 0x0210] %asi, %r3
	.word 0xba6a2650  ! 572: UDIVX_I	udivx 	%r8, 0x0650, %r29
	.word 0xc41a0009  ! 573: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xf2922a40  ! 574: LDUHA_I	lduha	[%r8, + 0x0a40] %asi, %r25
	.word 0xf8fa1009  ! 575: SWAPA_R	swapa	%r28, [%r8 + %r9] 0x80
	.word 0xc24a0009  ! 576: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0x8143e02c  ! 577: MEMBAR	membar	#LoadStore | #StoreStore | #MemIssue 
	.word 0xc3ea2acc  ! 578: PREFETCHA_I	prefetcha	[%r8, + 0x0acc] %asi, #one_read
	.word 0xce6a0009  ! 579: LDSTUB_R	ldstub	%r7, [%r8 + %r9]
	.word 0xc88a1009  ! 581: LDUBA_R	lduba	[%r8, %r9] 0x80, %r4
	.word 0x2c800004  ! 582: BNEG	bneg,a	<label_0x4>
	.word 0xd8b21009  ! 583: STHA_R	stha	%r12, [%r8 + %r9] 0x80
	.word 0x85220009  ! 584: MULScc_R	mulscc 	%r8, %r9, %r2
	.word 0x844a0009  ! 585: MULX_R	mulx 	%r8, %r9, %r2
	.word 0x87a20829  ! 586: FADDs	fadds	%f8, %f9, %f3
	.word 0x8143e027  ! 587: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #MemIssue 
	.word 0x8143e02d  ! 588: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #MemIssue 
	.word 0x8143e015  ! 589: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside 
	.word 0x8e6a0009  ! 590: UDIVX_R	udivx 	%r8, %r9, %r7
	.word 0xc36a2b40  ! 591: PREFETCH_I	prefetch	[%r8 + 0x0b40], #one_read
	.word 0x20800004  ! 592: BN	bn,a	<label_0x4>
	.word 0x2ec20004  ! 594: BRGEZ	brgez,a,nt	%8,<label_0x20004>
	.word 0xccf22c58  ! 595: STXA_I	stxa	%r6, [%r8 + 0x0c58] %asi
	.word 0x8143e066  ! 597: MEMBAR	membar	#StoreLoad | #LoadStore | #MemIssue | #Sync 
	.word 0xc5e21009  ! 599: CASA_I	casa	[%r8] 0x80, %r9, %r2
	.word 0xeca22434  ! 600: STWA_I	stwa	%r22, [%r8 + 0x0434] %asi
	.word 0xb84a2150  ! 601: MULX_I	mulx 	%r8, 0x0150, %r28
	.word 0x8e6a0009  ! 602: UDIVX_R	udivx 	%r8, %r9, %r7
	.word 0xcac22ad4  ! 603: LDSWA_I	ldswa	[%r8, + 0x0ad4] %asi, %r5
	.word 0xc2821009  ! 604: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r1
	.word 0x36800004  ! 605: BGE	bge,a	<label_0x4>
	.word 0x84d20009  ! 606: UMULcc_R	umulcc 	%r8, %r9, %r2
	.word 0x82522b90  ! 607: UMUL_I	umul 	%r8, 0x0b90, %r1
	.word 0xdaf21009  ! 608: STXA_R	stxa	%r13, [%r8 + %r9] 0x80
	.word 0xc3ea21b4  ! 609: PREFETCHA_I	prefetcha	[%r8, + 0x01b4] %asi, #one_read
	.word 0x827a2334  ! 610: SDIV_I	sdiv 	%r8, 0x0334, %r1
	.word 0x2a800004  ! 611: BCS	bcs,a	<label_0x4>
	.word 0xc64a2eac  ! 612: LDSB_I	ldsb	[%r8 + 0x0eac], %r3
	.word 0xc8f22fd0  ! 613: STXA_I	stxa	%r4, [%r8 + 0x0fd0] %asi
	.word 0x8fa20829  ! 614: FADDs	fadds	%f8, %f9, %f7
	.word 0xeaf221b0  ! 615: STXA_I	stxa	%r21, [%r8 + 0x01b0] %asi
	.word 0xcd3a2610  ! 616: STDF_I	std	%f6, [0x0610, %r8]
	.word 0xf2da1009  ! 618: LDXA_R	ldxa	[%r8, %r9] 0x80, %r25
	.word 0xcf2221ec  ! 619: STF_I	st	%f7, [0x01ec, %r8]
	.word 0xc2020009  ! 620: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0x8da20829  ! 621: FADDs	fadds	%f8, %f9, %f6
	.word 0x28800004  ! 622: BLEU	bleu,a	<label_0x4>
	.word 0xc36a249c  ! 623: PREFETCH_I	prefetch	[%r8 + 0x049c], #one_read
	.word 0x8a722218  ! 624: UDIV_I	udiv 	%r8, 0x0218, %r5
	.word 0x88f20009  ! 625: UDIVcc_R	udivcc 	%r8, %r9, %r4
	.word 0xaa720009  ! 626: UDIV_R	udiv 	%r8, %r9, %r21
	.word 0x8143c000  ! 627: STBAR	stbar
	.word 0x84fa0009  ! 628: SDIVcc_R	sdivcc 	%r8, %r9, %r2
	.word 0xe4420009  ! 629: LDSW_R	ldsw	[%r8 + %r9], %r18
	.word 0x8143e075  ! 630: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside | #MemIssue | #Sync 
	.word 0x22ca0008  ! 631: BRZ	brz,a,pt	%8,<label_0xa0008>
	.word 0xc2122560  ! 632: LDUH_I	lduh	[%r8 + 0x0560], %r1
	.word 0xfcaa1009  ! 633: STBA_R	stba	%r30, [%r8 + %r9] 0x80
	.word 0xc45a0009  ! 634: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xc36a20a8  ! 635: PREFETCH_I	prefetch	[%r8 + 0x00a8], #one_read
	.word 0x8143c000  ! 636: STBAR	stbar
	.word 0x836a0009  ! 637: SDIVX_R	sdivx	%r8, %r9, %r1
	.word 0x8ef22900  ! 638: UDIVcc_I	udivcc 	%r8, 0x0900, %r7
	.word 0xfd3a0009  ! 639: STDF_R	std	%f30, [%r9, %r8]
	.word 0xc41a2400  ! 640: LDD_I	ldd	[%r8 + 0x0400], %r2
	.word 0xba6a0009  ! 641: UDIVX_R	udivx 	%r8, %r9, %r29
	.word 0x8143c000  ! 642: STBAR	stbar
	.word 0xec4a2f98  ! 643: LDSB_I	ldsb	[%r8 + 0x0f98], %r22
	.word 0x9f22254c  ! 644: MULScc_I	mulscc 	%r8, 0x054c, %r15
	.word 0x28800008  ! 645: BLEU	bleu,a	<label_0x8>
	.word 0x827a298c  ! 647: SDIV_I	sdiv 	%r8, 0x098c, %r1
	.word 0xf8921009  ! 648: LDUHA_R	lduha	[%r8, %r9] 0x80, %r28
	.word 0xb3a20929  ! 649: FMULs	fmuls	%f8, %f9, %f25
	.word 0xc20a0009  ! 650: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xe4ba29a0  ! 651: STDA_I	stda	%r18, [%r8 + 0x09a0] %asi
	.word 0x8da209a9  ! 652: FDIVs	fdivs	%f8, %f9, %f6
	.word 0x0e800008  ! 653: BVS	bvs  	<label_0x8>
	.word 0xfa4a0009  ! 654: LDSB_R	ldsb	[%r8 + %r9], %r29
	.word 0x8143e021  ! 655: MEMBAR	membar	#LoadLoad | #MemIssue 
	.word 0x8143c000  ! 656: STBAR	stbar
	.word 0x8a4a25dc  ! 657: MULX_I	mulx 	%r8, 0x05dc, %r5
	.word 0xcc4a2440  ! 658: LDSB_I	ldsb	[%r8 + 0x0440], %r6
	.word 0xc6f21009  ! 659: STXA_R	stxa	%r3, [%r8 + %r9] 0x80
	.word 0xc3f22009  ! 660: CASXA_R	casxa	[%r8]%asi, %r9, %r1
	.word 0xf4c21009  ! 661: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r26
	.word 0xc36a2534  ! 662: PREFETCH_I	prefetch	[%r8 + 0x0534], #one_read
	.word 0xceda1009  ! 663: LDXA_R	ldxa	[%r8, %r9] 0x80, %r7
	.word 0xcf220009  ! 665: STF_R	st	%f7, [%r9, %r8]
	.word 0xc8aa1009  ! 666: STBA_R	stba	%r4, [%r8 + %r9] 0x80
	.word 0xf7f22009  ! 667: CASXA_R	casxa	[%r8]%asi, %r9, %r27
	.word 0xcbf22009  ! 668: CASXA_R	casxa	[%r8]%asi, %r9, %r5
	.word 0xc25a0009  ! 669: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xc2fa1009  ! 670: SWAPA_R	swapa	%r1, [%r8 + %r9] 0x80
	.word 0x845222c8  ! 671: UMUL_I	umul 	%r8, 0x02c8, %r2
	.word 0xcef21009  ! 672: STXA_R	stxa	%r7, [%r8 + %r9] 0x80
	.word 0xb47a2e7c  ! 673: SDIV_I	sdiv 	%r8, 0x0e7c, %r26
	.word 0xccfa1009  ! 674: SWAPA_R	swapa	%r6, [%r8 + %r9] 0x80
	.word 0xc6520009  ! 675: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0x8e720009  ! 676: UDIV_R	udiv 	%r8, %r9, %r7
	.word 0xccea2e74  ! 677: LDSTUBA_I	ldstuba	%r6, [%r8 + 0x0e74] %asi
	.word 0x8143e063  ! 678: MEMBAR	membar	#LoadLoad | #StoreLoad | #MemIssue | #Sync 
	.word 0xc8422d8c  ! 679: LDSW_I	ldsw	[%r8 + 0x0d8c], %r4
	.word 0xc41a2b38  ! 680: LDD_I	ldd	[%r8 + 0x0b38], %r2
	.word 0x8143e046  ! 681: MEMBAR	membar	#StoreLoad | #LoadStore | #Sync 
	.word 0xfad21009  ! 682: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r29
	.word 0xc20a2590  ! 683: LDUB_I	ldub	[%r8 + 0x0590], %r1
	.word 0xc3ea2338  ! 684: PREFETCHA_I	prefetcha	[%r8, + 0x0338] %asi, #one_read
	.word 0xc8aa2650  ! 685: STBA_I	stba	%r4, [%r8 + 0x0650] %asi
	.word 0x0e800004  ! 686: BVS	bvs  	<label_0x4>
	.word 0x84da0009  ! 687: SMULcc_R	smulcc 	%r8, %r9, %r2
	.word 0xc86a2a3c  ! 688: LDSTUB_I	ldstub	%r4, [%r8 + 0x0a3c]
	.word 0xd8fa1009  ! 689: SWAPA_R	swapa	%r12, [%r8 + %r9] 0x80
	.word 0xa46a2ac8  ! 690: UDIVX_I	udivx 	%r8, 0x0ac8, %r18
	.word 0xd6aa1009  ! 691: STBA_R	stba	%r11, [%r8 + %r9] 0x80
	.word 0xb96a26c8  ! 692: SDIVX_I	sdivx	%r8, 0x06c8, %r28
	.word 0xe6522f40  ! 693: LDSH_I	ldsh	[%r8 + 0x0f40], %r19
	.word 0x8143c000  ! 694: STBAR	stbar
	.word 0xb5a208a9  ! 695: FSUBs	fsubs	%f8, %f9, %f26
	.word 0x8143c000  ! 696: STBAR	stbar
	.word 0xce921009  ! 697: LDUHA_R	lduha	[%r8, %r9] 0x80, %r7
	.word 0x844a24b8  ! 698: MULX_I	mulx 	%r8, 0x04b8, %r2
	.word 0xdea22004  ! 699: STWA_I	stwa	%r15, [%r8 + 0x0004] %asi
	.word 0x8da208a9  ! 700: FSUBs	fsubs	%f8, %f9, %f6
	.word 0xc48a20d4  ! 701: LDUBA_I	lduba	[%r8, + 0x00d4] %asi, %r2
	.word 0xc4b22684  ! 702: STHA_I	stha	%r2, [%r8 + 0x0684] %asi
	.word 0x86da0009  ! 703: SMULcc_R	smulcc 	%r8, %r9, %r3
	.word 0xd93a2330  ! 704: STDF_I	std	%f12, [0x0330, %r8]
	.word 0xecb21009  ! 705: STHA_R	stha	%r22, [%r8 + %r9] 0x80
	.word 0xc3ea2820  ! 706: PREFETCHA_I	prefetcha	[%r8, + 0x0820] %asi, #one_read
	.word 0x9c6a2fec  ! 707: UDIVX_I	udivx 	%r8, 0x0fec, %r14
	.word 0x8d6a2100  ! 708: SDIVX_I	sdivx	%r8, 0x0100, %r6
	.word 0x8143c000  ! 709: STBAR	stbar
	.word 0x8e5a0009  ! 710: SMUL_R	smul 	%r8, %r9, %r7
	.word 0x06800004  ! 711: BL	bl  	<label_0x4>
	.word 0x8143c000  ! 712: STBAR	stbar
	.word 0x825a2ac4  ! 713: SMUL_I	smul 	%r8, 0x0ac4, %r1
	.word 0xd84a2fe0  ! 714: LDSB_I	ldsb	[%r8 + 0x0fe0], %r12
	.word 0x8143e05e  ! 715: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0xc4f221c0  ! 716: STXA_I	stxa	%r2, [%r8 + 0x01c0] %asi
	.word 0x9fa20929  ! 717: FMULs	fmuls	%f8, %f9, %f15
	.word 0xe2020009  ! 718: LDUW_R	lduw	[%r8 + %r9], %r17
	.word 0xfcf21009  ! 719: STXA_R	stxa	%r30, [%r8 + %r9] 0x80
	.word 0xe68221c4  ! 720: LDUWA_I	lduwa	[%r8, + 0x01c4] %asi, %r19
	.word 0x87a20829  ! 721: FADDs	fadds	%f8, %f9, %f3
	.word 0xccca1009  ! 722: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r6
	.word 0xc4b21009  ! 723: STHA_R	stha	%r2, [%r8 + %r9] 0x80
	.word 0x04ca0004  ! 724: BRLEZ	brlez  ,pt	%8,<label_0xa0004>
	.word 0x9afa0009  ! 725: SDIVcc_R	sdivcc 	%r8, %r9, %r13
	.word 0x896a2240  ! 726: SDIVX_I	sdivx	%r8, 0x0240, %r4
	.word 0x02ca0008  ! 727: BRZ	brz  ,pt	%8,<label_0xa0008>
	.word 0x2e800004  ! 728: BVS	bvs,a	<label_0x4>
	.word 0xc9e21009  ! 729: CASA_I	casa	[%r8] 0x80, %r9, %r4
	.word 0x856a2d70  ! 730: SDIVX_I	sdivx	%r8, 0x0d70, %r2
	.word 0x8da20929  ! 731: FMULs	fmuls	%f8, %f9, %f6
	.word 0x2aca0004  ! 732: BRNZ	brnz,a,pt	%8,<label_0xa0004>
	.word 0xc4fa1009  ! 733: SWAPA_R	swapa	%r2, [%r8 + %r9] 0x80
	.word 0xd4ea2d24  ! 734: LDSTUBA_I	ldstuba	%r10, [%r8 + 0x0d24] %asi
	.word 0xc8120009  ! 735: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xc4ba1009  ! 736: STDA_R	stda	%r2, [%r8 + %r9] 0x80
	.word 0x8ad2202c  ! 737: UMULcc_I	umulcc 	%r8, 0x002c, %r5
	.word 0xc9e21009  ! 738: CASA_I	casa	[%r8] 0x80, %r9, %r4
	.word 0xd4ba2ac0  ! 739: STDA_I	stda	%r10, [%r8 + 0x0ac0] %asi
	.word 0xfeb21009  ! 740: STHA_R	stha	%r31, [%r8 + %r9] 0x80
	.word 0x896a270c  ! 741: SDIVX_I	sdivx	%r8, 0x070c, %r4
	.word 0xce5a0009  ! 742: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0x844a0009  ! 743: MULX_R	mulx 	%r8, %r9, %r2
	.word 0xca422c44  ! 744: LDSW_I	ldsw	[%r8 + 0x0c44], %r5
	.word 0x827a2f34  ! 745: SDIV_I	sdiv 	%r8, 0x0f34, %r1
	.word 0xc36a2450  ! 746: PREFETCH_I	prefetch	[%r8 + 0x0450], #one_read
	.word 0xc6522b48  ! 748: LDSH_I	ldsh	[%r8 + 0x0b48], %r3
	.word 0xca6a2068  ! 749: LDSTUB_I	ldstub	%r5, [%r8 + 0x0068]
	.word 0x86520009  ! 750: UMUL_R	umul 	%r8, %r9, %r3
	.word 0x28800004  ! 751: BLEU	bleu,a	<label_0x4>
	.word 0x82d20009  ! 752: UMULcc_R	umulcc 	%r8, %r9, %r1
	.word 0x8143c000  ! 753: STBAR	stbar
	.word 0x8da20929  ! 754: FMULs	fmuls	%f8, %f9, %f6
	.word 0x845a0009  ! 755: SMUL_R	smul 	%r8, %r9, %r2
	.word 0xcf3a2910  ! 756: STDF_I	std	%f7, [0x0910, %r8]
	.word 0xcc0221c0  ! 757: LDUW_I	lduw	[%r8 + 0x01c0], %r6
	.word 0x83a208a9  ! 758: FSUBs	fsubs	%f8, %f9, %f1
	.word 0xc3ea20f8  ! 759: PREFETCHA_I	prefetcha	[%r8, + 0x00f8] %asi, #one_read
	.word 0xce420009  ! 760: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xc4c221c4  ! 762: LDSWA_I	ldswa	[%r8, + 0x01c4] %asi, %r2
	.word 0x8143e07e  ! 764: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0x8da20929  ! 766: FMULs	fmuls	%f8, %f9, %f6
	.word 0x0c800004  ! 767: BNEG	bneg  	<label_0x4>
	.word 0xc68a1009  ! 769: LDUBA_R	lduba	[%r8, %r9] 0x80, %r3
	.word 0x8143c000  ! 770: STBAR	stbar
	.word 0xafa209a9  ! 771: FDIVs	fdivs	%f8, %f9, %f23
	.word 0x8e4a0009  ! 772: MULX_R	mulx 	%r8, %r9, %r7
	.word 0x8143c000  ! 773: STBAR	stbar
	.word 0xc73a0009  ! 774: STDF_R	std	%f3, [%r9, %r8]
	.word 0xec020009  ! 775: LDUW_R	lduw	[%r8 + %r9], %r22
	.word 0x8143e039  ! 776: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside | #MemIssue 
	.word 0xc3222f58  ! 777: STF_I	st	%f1, [0x0f58, %r8]
	.word 0xcdf22009  ! 778: CASXA_R	casxa	[%r8]%asi, %r9, %r6
	.word 0x887221a8  ! 779: UDIV_I	udiv 	%r8, 0x01a8, %r4
	.word 0x8143c000  ! 780: STBAR	stbar
	.word 0x8cd20009  ! 781: UMULcc_R	umulcc 	%r8, %r9, %r6
	.word 0x8c6a0009  ! 782: UDIVX_R	udivx 	%r8, %r9, %r6
	.word 0xd5f21009  ! 783: CASXA_I	casxa	[%r8] 0x80, %r9, %r10
	.word 0xd49a1009  ! 784: LDDA_R	ldda	[%r8, %r9] 0x80, %r10
	.word 0x84d22790  ! 785: UMULcc_I	umulcc 	%r8, 0x0790, %r2
	.word 0xfada1009  ! 786: LDXA_R	ldxa	[%r8, %r9] 0x80, %r29
	.word 0xc3ea20e0  ! 787: PREFETCHA_I	prefetcha	[%r8, + 0x00e0] %asi, #one_read
	.word 0xebe22009  ! 788: CASA_R	casa	[%r8] %asi, %r9, %r21
	.word 0x87a20929  ! 789: FMULs	fmuls	%f8, %f9, %f3
	.word 0xccb21009  ! 790: STHA_R	stha	%r6, [%r8 + %r9] 0x80
	.word 0xd6922668  ! 791: LDUHA_I	lduha	[%r8, + 0x0668] %asi, %r11
	.word 0xbed22b10  ! 792: UMULcc_I	umulcc 	%r8, 0x0b10, %r31
	.word 0x8143c000  ! 793: STBAR	stbar
	.word 0xc6b21009  ! 794: STHA_R	stha	%r3, [%r8 + %r9] 0x80
	.word 0xc73a0009  ! 795: STDF_R	std	%f3, [%r9, %r8]
	.word 0xced227f8  ! 796: LDSHA_I	ldsha	[%r8, + 0x07f8] %asi, %r7
	.word 0xe60a0009  ! 798: LDUB_R	ldub	[%r8 + %r9], %r19
	.word 0xcaea1009  ! 799: LDSTUBA_R	ldstuba	%r5, [%r8 + %r9] 0x80
	.word 0xce8a2598  ! 800: LDUBA_I	lduba	[%r8, + 0x0598] %asi, %r7
	.word 0xc8c21009  ! 801: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r4
	.word 0xad6a2568  ! 802: SDIVX_I	sdivx	%r8, 0x0568, %r22
	.word 0xe46a2e4c  ! 803: LDSTUB_I	ldstub	%r18, [%r8 + 0x0e4c]
	.word 0xcca21009  ! 804: STWA_R	stwa	%r6, [%r8 + %r9] 0x80
	.word 0xf2da2788  ! 805: LDXA_I	ldxa	[%r8, + 0x0788] %asi, %r25
	.word 0xc36a2448  ! 806: PREFETCH_I	prefetch	[%r8 + 0x0448], #one_read
	.word 0x2c800004  ! 807: BNEG	bneg,a	<label_0x4>
	.word 0xcf3a2e28  ! 808: STDF_I	std	%f7, [0x0e28, %r8]
	.word 0x8143c000  ! 809: STBAR	stbar
	.word 0x16800008  ! 810: BGE	bge  	<label_0x8>
	.word 0x88f20009  ! 811: UDIVcc_R	udivcc 	%r8, %r9, %r4
	.word 0xcd222948  ! 812: STF_I	st	%f6, [0x0948, %r8]
	.word 0xccd21009  ! 813: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r6
	.word 0x8143e05c  ! 814: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0x1e800004  ! 815: BVC	bvc  	<label_0x4>
	.word 0x87a20829  ! 816: FADDs	fadds	%f8, %f9, %f3
	.word 0x8b220009  ! 818: MULScc_R	mulscc 	%r8, %r9, %r5
	.word 0x3c800004  ! 819: BPOS	bpos,a	<label_0x4>
	.word 0xd88a2208  ! 820: LDUBA_I	lduba	[%r8, + 0x0208] %asi, %r12
	.word 0x8143c000  ! 821: STBAR	stbar
	.word 0x8c4a0009  ! 822: MULX_R	mulx 	%r8, %r9, %r6
	.word 0xe64a0009  ! 823: LDSB_R	ldsb	[%r8 + %r9], %r19
	.word 0x8f6a0009  ! 824: SDIVX_R	sdivx	%r8, %r9, %r7
	.word 0x8143c000  ! 825: STBAR	stbar
	.word 0x0e800004  ! 826: BVS	bvs  	<label_0x4>
	.word 0xc8c22214  ! 827: LDSWA_I	ldswa	[%r8, + 0x0214] %asi, %r4
	.word 0xc3ea2e50  ! 828: PREFETCHA_I	prefetcha	[%r8, + 0x0e50] %asi, #one_read
	.word 0x8f6a0009  ! 829: SDIVX_R	sdivx	%r8, %r9, %r7
	.word 0xea821009  ! 831: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r21
	.word 0x2cc20004  ! 832: BRGZ	brgz,a,nt	%8,<label_0x20004>
	.word 0xe20a0009  ! 833: LDUB_R	ldub	[%r8 + %r9], %r17
	.word 0xf4ca1009  ! 834: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r26
	.word 0xc6ca1009  ! 835: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r3
	.word 0x8143c000  ! 836: STBAR	stbar
	.word 0xc86a2020  ! 837: LDSTUB_I	ldstub	%r4, [%r8 + 0x0020]
	.word 0xc9220009  ! 838: STF_R	st	%f4, [%r9, %r8]
	.word 0xf2420009  ! 839: LDSW_R	ldsw	[%r8 + %r9], %r25
	.word 0xcada28d0  ! 840: LDXA_I	ldxa	[%r8, + 0x08d0] %asi, %r5
	.word 0xc9f21009  ! 841: CASXA_I	casxa	[%r8] 0x80, %r9, %r4
	.word 0x88d20009  ! 842: UMULcc_R	umulcc 	%r8, %r9, %r4
	.word 0xcab21009  ! 843: STHA_R	stha	%r5, [%r8 + %r9] 0x80
	.word 0xd4c22248  ! 844: LDSWA_I	ldswa	[%r8, + 0x0248] %asi, %r10
	.word 0x8143e056  ! 845: MEMBAR	membar	#StoreLoad | #LoadStore | #Lookaside | #Sync 
	.word 0x876a0009  ! 846: SDIVX_R	sdivx	%r8, %r9, %r3
	.word 0x8fa20929  ! 847: FMULs	fmuls	%f8, %f9, %f7
	.word 0xecc22d18  ! 848: LDSWA_I	ldswa	[%r8, + 0x0d18] %asi, %r22
	.word 0xc36a2fc0  ! 849: PREFETCH_I	prefetch	[%r8 + 0x0fc0], #one_read
	.word 0x8143c000  ! 850: STBAR	stbar
	.word 0xc53a0009  ! 851: STDF_R	std	%f2, [%r9, %r8]
	.word 0xe0aa2714  ! 852: STBA_I	stba	%r16, [%r8 + 0x0714] %asi
	.word 0x866a0009  ! 853: UDIVX_R	udivx 	%r8, %r9, %r3
	.word 0x985a2658  ! 854: SMUL_I	smul 	%r8, 0x0658, %r12
	.word 0x88d227b4  ! 855: UMULcc_I	umulcc 	%r8, 0x07b4, %r4
	.word 0xe72220ac  ! 856: STF_I	st	%f19, [0x00ac, %r8]
	.word 0x847a2484  ! 857: SDIV_I	sdiv 	%r8, 0x0484, %r2
	.word 0x8143c000  ! 858: STBAR	stbar
	.word 0x8143c000  ! 859: STBAR	stbar
	.word 0x02ca0008  ! 860: BRZ	brz  ,pt	%8,<label_0xa0008>
	.word 0x38800004  ! 861: BGU	bgu,a	<label_0x4>
	.word 0xc53a25b8  ! 862: STDF_I	std	%f2, [0x05b8, %r8]
	.word 0x84d20009  ! 863: UMULcc_R	umulcc 	%r8, %r9, %r2
	.word 0x8143c000  ! 864: STBAR	stbar
	.word 0xec9a1009  ! 865: LDDA_R	ldda	[%r8, %r9] 0x80, %r22
	.word 0xf0b21009  ! 866: STHA_R	stha	%r24, [%r8 + %r9] 0x80
	.word 0xc81a0009  ! 867: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xc5220009  ! 868: STF_R	st	%f2, [%r9, %r8]
	.word 0xec5a0009  ! 869: LDX_R	ldx	[%r8 + %r9], %r22
	.word 0xccda2880  ! 870: LDXA_I	ldxa	[%r8, + 0x0880] %asi, %r6
	.word 0xc36a2930  ! 871: PREFETCH_I	prefetch	[%r8 + 0x0930], #one_read
	.word 0xb25a279c  ! 872: SMUL_I	smul 	%r8, 0x079c, %r25
	.word 0xd60222e0  ! 873: LDUW_I	lduw	[%r8 + 0x02e0], %r11
	.word 0xc80a2014  ! 874: LDUB_I	ldub	[%r8 + 0x0014], %r4
	.word 0xc2822f70  ! 875: LDUWA_I	lduwa	[%r8, + 0x0f70] %asi, %r1
	.word 0x8e7a25b4  ! 876: SDIV_I	sdiv 	%r8, 0x05b4, %r7
	.word 0x8c7a2d44  ! 877: SDIV_I	sdiv 	%r8, 0x0d44, %r6
	.word 0x8143c000  ! 878: STBAR	stbar
	.word 0x8143e04c  ! 879: MEMBAR	membar	#LoadStore | #StoreStore | #Sync 
	.word 0x8c522060  ! 880: UMUL_I	umul 	%r8, 0x0060, %r6
	.word 0x8143e034  ! 881: MEMBAR	membar	#LoadStore | #Lookaside | #MemIssue 
	.word 0x8143c000  ! 882: STBAR	stbar
	.word 0x8c7223f0  ! 883: UDIV_I	udiv 	%r8, 0x03f0, %r6
	.word 0xf01a0009  ! 884: LDD_R	ldd	[%r8 + %r9], %r24
	.word 0xe3220009  ! 885: STF_R	st	%f17, [%r9, %r8]
	.word 0x8143e00c  ! 886: MEMBAR	membar	#LoadStore | #StoreStore 
	.word 0xaa5a21b0  ! 887: SMUL_I	smul 	%r8, 0x01b0, %r21
	.word 0xc36a2c04  ! 888: PREFETCH_I	prefetch	[%r8 + 0x0c04], #one_read
	.word 0xf6d21009  ! 890: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r27
	.word 0xf8fa229c  ! 891: SWAPA_I	swapa	%r28, [%r8 + 0x029c] %asi
	.word 0xd4ba22f0  ! 893: STDA_I	stda	%r10, [%r8 + 0x02f0] %asi
	.word 0xc4ea1009  ! 894: LDSTUBA_R	ldstuba	%r2, [%r8 + %r9] 0x80
	.word 0x8143e03d  ! 895: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0xc2420009  ! 896: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xea022468  ! 897: LDUW_I	lduw	[%r8 + 0x0468], %r21
	.word 0xc68a2a64  ! 898: LDUBA_I	lduba	[%r8, + 0x0a64] %asi, %r3
	.word 0x8f220009  ! 899: MULScc_R	mulscc 	%r8, %r9, %r7
	.word 0x8143e006  ! 900: MEMBAR	membar	#StoreLoad | #LoadStore 
	.word 0x2c800004  ! 901: BNEG	bneg,a	<label_0x4>
	.word 0xc252247c  ! 902: LDSH_I	ldsh	[%r8 + 0x047c], %r1
	.word 0xc2ca1009  ! 903: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r1
	.word 0xce7a0009  ! 904: SWAP_R	swap	%r7, [%r8 + %r9]
	.word 0x8ed22a74  ! 905: UMULcc_I	umulcc 	%r8, 0x0a74, %r7
	.word 0xc6822870  ! 906: LDUWA_I	lduwa	[%r8, + 0x0870] %asi, %r3
	.word 0x0a800004  ! 907: BCS	bcs  	<label_0x4>
	.word 0x8143c000  ! 908: STBAR	stbar
	.word 0xff3a0009  ! 909: STDF_R	std	%f31, [%r9, %r8]
	.word 0xcc4a2594  ! 910: LDSB_I	ldsb	[%r8 + 0x0594], %r6
	.word 0xeeda1009  ! 911: LDXA_R	ldxa	[%r8, %r9] 0x80, %r23
	.word 0xe67a2c40  ! 912: SWAP_I	swap	%r19, [%r8 + 0x0c40]
	.word 0x8143e05d  ! 913: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0x8cd22108  ! 914: UMULcc_I	umulcc 	%r8, 0x0108, %r6
	.word 0xc20a0009  ! 915: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xdaea2944  ! 916: LDSTUBA_I	ldstuba	%r13, [%r8 + 0x0944] %asi
	.word 0xeff21009  ! 917: CASXA_I	casxa	[%r8] 0x80, %r9, %r23
	.word 0xf26a2464  ! 918: LDSTUB_I	ldstub	%r25, [%r8 + 0x0464]
	.word 0xc3ea290c  ! 919: PREFETCHA_I	prefetcha	[%r8, + 0x090c] %asi, #one_read
	.word 0xed3a0009  ! 920: STDF_R	std	%f22, [%r9, %r8]
	.word 0x8143c000  ! 921: STBAR	stbar
	.word 0xca5a0009  ! 922: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0x04800004  ! 923: BLE	ble  	<label_0x4>
	.word 0xf3222a88  ! 924: STF_I	st	%f25, [0x0a88, %r8]
	.word 0xc6fa1009  ! 927: SWAPA_R	swapa	%r3, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 928: STBAR	stbar
	.word 0xd4ba28e0  ! 929: STDA_I	stda	%r10, [%r8 + 0x08e0] %asi
	.word 0xc60a2440  ! 931: LDUB_I	ldub	[%r8 + 0x0440], %r3
	.word 0x8fa208a9  ! 932: FSUBs	fsubs	%f8, %f9, %f7
	.word 0x2aca0004  ! 933: BRNZ	brnz,a,pt	%8,<label_0xa0004>
	.word 0x945a28d8  ! 934: SMUL_I	smul 	%r8, 0x08d8, %r10
	.word 0xc49a1009  ! 935: LDDA_R	ldda	[%r8, %r9] 0x80, %r2
	.word 0x2ec20004  ! 936: BRGEZ	brgez,a,nt	%8,<label_0x20004>
	.word 0xbaf226d0  ! 937: UDIVcc_I	udivcc 	%r8, 0x06d0, %r29
	.word 0xc36a2348  ! 938: PREFETCH_I	prefetch	[%r8 + 0x0348], #one_read
	.word 0x40000008  ! 939: CALL	call	disp30_8
	.word 0x83a209a9  ! 940: FDIVs	fdivs	%f8, %f9, %f1
	.word 0x87a20929  ! 941: FMULs	fmuls	%f8, %f9, %f3
	.word 0x844a0009  ! 942: MULX_R	mulx 	%r8, %r9, %r2
	.word 0xc7220009  ! 943: STF_R	st	%f3, [%r9, %r8]
	.word 0x8143c000  ! 944: STBAR	stbar
	.word 0x40000008  ! 946: CALL	call	disp30_8
	.word 0xce6a2760  ! 947: LDSTUB_I	ldstub	%r7, [%r8 + 0x0760]
	.word 0x8b220009  ! 949: MULScc_R	mulscc 	%r8, %r9, %r5
	.word 0xf8d21009  ! 950: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r28
	.word 0x2eca0004  ! 951: BRGEZ	brgez,a,pt	%8,<label_0xa0004>
	.word 0x8a520009  ! 952: UMUL_R	umul 	%r8, %r9, %r5
	.word 0xc6921009  ! 953: LDUHA_R	lduha	[%r8, %r9] 0x80, %r3
	.word 0xb8da2114  ! 954: SMULcc_I	smulcc 	%r8, 0x0114, %r28
	.word 0xe89a1009  ! 955: LDDA_R	ldda	[%r8, %r9] 0x80, %r20
	.word 0xce8a2664  ! 956: LDUBA_I	lduba	[%r8, + 0x0664] %asi, %r7
	.word 0xdc6a2ac8  ! 957: LDSTUB_I	ldstub	%r14, [%r8 + 0x0ac8]
	.word 0xcad21009  ! 958: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r5
	.word 0xcb3a0009  ! 959: STDF_R	std	%f5, [%r9, %r8]
	.word 0x98fa0009  ! 960: SDIVcc_R	sdivcc 	%r8, %r9, %r12
	.word 0x8da20929  ! 961: FMULs	fmuls	%f8, %f9, %f6
	.word 0x0ac20004  ! 962: BRNZ	brnz  ,nt	%8,<label_0x20004>
	.word 0xc3ea25e0  ! 963: PREFETCHA_I	prefetcha	[%r8, + 0x05e0] %asi, #one_read
	.word 0x86722668  ! 964: UDIV_I	udiv 	%r8, 0x0668, %r3
	.word 0x8143c000  ! 965: STBAR	stbar
	.word 0xcc520009  ! 966: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0x85a20929  ! 967: FMULs	fmuls	%f8, %f9, %f2
	.word 0x8143c000  ! 968: STBAR	stbar
	.word 0xf3e22009  ! 969: CASA_R	casa	[%r8] %asi, %r9, %r25
	.word 0x40000004  ! 970: CALL	call	disp30_4
	.word 0xaafa0009  ! 973: SDIVcc_R	sdivcc 	%r8, %r9, %r21
	.word 0x8d6a0009  ! 974: SDIVX_R	sdivx	%r8, %r9, %r6
	.word 0xc4520009  ! 975: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xef3a0009  ! 976: STDF_R	std	%f23, [%r9, %r8]
	.word 0x8e7a0009  ! 977: SDIV_R	sdiv 	%r8, %r9, %r7
	.word 0xd93a2768  ! 978: STDF_I	std	%f12, [0x0768, %r8]
	.word 0x8143c000  ! 979: STBAR	stbar
	.word 0xcc6a0009  ! 980: LDSTUB_R	ldstub	%r6, [%r8 + %r9]
	.word 0x87a20929  ! 981: FMULs	fmuls	%f8, %f9, %f3
	.word 0xc36a2c54  ! 982: PREFETCH_I	prefetch	[%r8 + 0x0c54], #one_read
	.word 0xca5a0009  ! 983: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xb6522f7c  ! 984: UMUL_I	umul 	%r8, 0x0f7c, %r27
	.word 0x04800004  ! 985: BLE	ble  	<label_0x4>
	.word 0xe7f22009  ! 986: CASXA_R	casxa	[%r8]%asi, %r9, %r19
	.word 0x8c5223bc  ! 987: UMUL_I	umul 	%r8, 0x03bc, %r6
	.word 0xdc1a0009  ! 988: LDD_R	ldd	[%r8 + %r9], %r14
	.word 0x24800004  ! 989: BLE	ble,a	<label_0x4>
	.word 0xc86a277c  ! 990: LDSTUB_I	ldstub	%r4, [%r8 + 0x077c]
	.word 0xc48a23f4  ! 991: LDUBA_I	lduba	[%r8, + 0x03f4] %asi, %r2
	.word 0xc3220009  ! 992: STF_R	st	%f1, [%r9, %r8]
	.word 0x8143e06e  ! 993: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #MemIssue | #Sync 
	.word 0xa2d20009  ! 994: UMULcc_R	umulcc 	%r8, %r9, %r17
	.word 0xca8a2358  ! 995: LDUBA_I	lduba	[%r8, + 0x0358] %asi, %r5
	.word 0xcaaa2fb8  ! 996: STBA_I	stba	%r5, [%r8 + 0x0fb8] %asi
	.word 0x85a209a9  ! 997: FDIVs	fdivs	%f8, %f9, %f2
	.word 0xb2f22a68  ! 998: UDIVcc_I	udivcc 	%r8, 0x0a68, %r25
	.word 0x8143c000  ! 999: STBAR	stbar
        ta      T_GOOD_TRAP

.data
	.word  0xd32300a6,0xa9fb8415,0x7cb807c1,0x92c0958c
	.word  0xd227b3af,0x923f93fe,0x7407849b,0xbcc5997f
	.word  0xf7ce7369,0xcac83d64,0x2b6f475d,0xe94f89de
	.word  0xc9b75113,0x05a74dc4,0x5a3a0f85,0x07d483e0
	.word  0xa56f40e6,0x9da1dad2,0xcced7250,0x91a19322
	.word  0xc50e556c,0x9f2579a3,0x1b31f1ca,0x4384284c
	.word  0x162662a5,0x6045ed16,0x16681b28,0xc26aae37
	.word  0x9cfa9fb2,0xc4829835,0x4808df90,0x86c28b51
	.word  0x9479845a,0x5b313669,0x01ff3546,0xbef7d06e
	.word  0x17f79fd1,0xc177ba18,0x3c53ed5f,0x193dd52e
	.word  0x13c42d51,0x3b46b46b,0x35a0100d,0xd88063e3
	.word  0x92ee3cc6,0xae62dc86,0xb344e282,0x7fec3581
	.word  0xfaf81853,0xb0ccb5f3,0xbff4b572,0x350d9dd0
	.word  0xe1be17ea,0xf2929187,0x198c64e7,0x95586e6a
	.word  0x75de1546,0xfa06fc32,0xea94ad8b,0xa540008e
	.word  0x7e3d4387,0x93dd5c12,0x49eb1149,0xfd839e76
	.word  0xe426b033,0x4dfe2aa9,0x4035ba56,0x71ddd575
	.word  0xe580d16a,0xeaf189c2,0xb3ae5cb5,0xcb2ed891
	.word  0x5a3c09dd,0x118d6d70,0x32abaca6,0xa2fa780e
	.word  0xac5d814c,0x3517bc56,0x1ad551cf,0x55a58c08
	.word  0xec157cb0,0x6381ef14,0x0f64dc61,0x40e07099
	.word  0x6db88641,0x0ed9b984,0xe64513c5,0xd49a986a
	.word  0xb87521a9,0x0ec320c4,0x08b33712,0x7b00616b
	.word  0x245978e6,0x943e1f30,0x4f187290,0x4a723bba
	.word  0x7817c7f4,0xbd424ac0,0x65547335,0x7d4bf83e
	.word  0xff854db2,0x037e9496,0x80059fbd,0x3309fdef
	.word  0x0a7f6495,0xe5fbd6f2,0x7144879c,0xf2bdb006
	.word  0x670e9955,0xc00968aa,0xb8af012d,0x68491c29
	.word  0xde529384,0xa9701eb6,0xa15ec355,0xedad15f9
	.word  0x1cc6316a,0x00493ab3,0xadb6ac5f,0x656ccf16
	.word  0xfb007c28,0xb0d3d4c8,0x602acd53,0x96026f5a
	.word  0xb8df4c7d,0x2f5794e1,0x213c47e1,0x01cbde29
	.word  0xc767768a,0x56ffbec1,0xc9a3522f,0xf50fcf06
	.word  0x3c06b232,0x0472e45b,0x2280b752,0x533545cc
	.word  0x15c33e27,0x74275bef,0x176bb861,0x9a138a4b
	.word  0x43f8c67c,0x40ec75a5,0x31edfe33,0x5e8740ea
	.word  0x774a123e,0xc402b7a6,0x7921b4a4,0xcc469dcb
	.word  0x15ed538c,0x5e7e8284,0x3ea081d7,0xf84abd8c
	.word  0x7c61b4e8,0x5d5a5f23,0x7613a93b,0x7dfaab01
	.word  0x39a4ee50,0x9afe7ace,0xd1484163,0x695b15fc
	.word  0x7c4b6098,0x1202934a,0x99ca748f,0x68d18b6b
	.word  0x7f5cd0e8,0x0525ec13,0x66ba2d0d,0x416897a0
	.word  0x405c8135,0xa50817eb,0xb42a4f5f,0xab01c05c
	.word  0x60e07243,0x8189e321,0x0c62698c,0xd81bae04
	.word  0xa72f2c28,0x65de858f,0x606bf400,0x56faad30
	.word  0xfb9874e3,0xc1553d83,0x2035d798,0x1a0ad27f
	.word  0x0f48cc08,0xa36cef9f,0xf10c8891,0x4842b38b
	.word  0x7e8c7da8,0x30793ec3,0x877f9ead,0xb6cec1b7
	.word  0x95f854e0,0x3d2a4aa8,0xc396678a,0x36b18a06
	.word  0x34eba31d,0xb31888f9,0xe3a79f8d,0x70518404
	.word  0x64180d87,0x6b121357,0x8c13518a,0xeb5d3c35
	.word  0x9d940e1e,0x0e64df6f,0x3c9aa064,0x0d848e89
	.word  0x3fd89bde,0x2867ece0,0x8b951110,0x87b8e525
	.word  0x84f3ac33,0xfc52f3db,0x46a07fd9,0xc575ca04
	.word  0x342e4d62,0x9d5bea9d,0x176c253b,0x965bcc42
	.word  0xb53e7de7,0xcd3166e6,0x05b8f5d8,0x1488579d
	.word  0xa0605827,0x926f8735,0x7e98d547,0x8a160b80
	.word  0xafe85713,0x67b3d55f,0x4fcbd637,0xabe0c89e
	.word  0x39d56f48,0xc65b3677,0x72e51931,0x1f5cb662
	.word  0x44ea2e2e,0x1795b252,0xd0655fe2,0xf979420b
	.word  0x32e1d78b,0x6c05831c,0x13bb5a8c,0x2210beff
	.word  0x790d674d,0xa17e39eb,0x793aec4a,0x053d708a
	.word  0xdf5b4446,0xb1ef1248,0x6d201340,0x1e7f34e7
	.word  0x9fc557ec,0x82b5abdb,0xf20e3323,0x73d9fefa
	.word  0x514c1cce,0xe95e6082,0x0f254571,0x81b23368
	.word  0xe08a101b,0xd5fa329d,0x65db0de6,0xdb009c8c
	.word  0x75c8ff0b,0x5b960b05,0x53fc8e7e,0x40b72ac4
	.word  0x8c84aa5e,0xd929c558,0x5c12473a,0xeda2b929
	.word  0xacbd1d51,0xff7e5082,0x44252045,0x5d15b099
	.word  0x77f6b388,0x55e74e42,0xccddce05,0x5344c35c
	.word  0xdbb00779,0x793aa1d6,0xd034a35c,0x76f6aa23
	.word  0x483e87ae,0x63ee6b1b,0xbc9f488a,0x2e43cca6
	.word  0x608cd2d5,0x748e0ec8,0x67f74978,0xc6ae3f8b
	.word  0x19176693,0x19de5a81,0xf510e728,0x35a4a5bf
	.word  0x523ce34f,0xd176d5af,0xd4958963,0x14402af9
	.word  0x6eb04680,0xec69e8db,0x3108aed6,0x6dad7958
	.word  0xf99d4ca7,0xd7ff4f41,0x32bc26bf,0x23535f2c
	.word  0x189b5a90,0xa27e0939,0x8abf011e,0x0edce4fd
	.word  0x2f2f4e19,0x66dcf599,0x97639b49,0xf93b4dbe
	.word  0x9be252b7,0xc58dc94e,0x53d5fe86,0x5a7290c3
	.word  0x8b84ea2f,0x0752b3db,0x5bf26a07,0x9c0b9d79
	.word  0x96beee4d,0x009b8c95,0x21be7904,0x5f96f1cd
	.word  0x06e5315b,0x436b9210,0x49571d18,0x1d6179cf
	.word  0x4e98e9ce,0x2311fb13,0x581defcd,0x5c85ea16
	.word  0xb4e5db9f,0x3cbdc581,0xad5ced84,0xb4b4b3b3
	.word  0x97df45e1,0x17ed0f9b,0xa3b8f5a0,0xeecd8b7f
	.word  0xde0b7374,0xc402e4af,0x05bb5746,0x76e60d5a
	.word  0x5ff0b043,0xfba606c0,0xa9ec54a8,0xc87465f2
	.word  0x6c832edd,0xc9994947,0x77ea0c99,0xc4322ce2
	.word  0x3d2c6b7e,0xc514fbbc,0xfbf42304,0x44343c86
	.word  0x524cb795,0xf82c1e37,0xc44e69fa,0xafc313cf
	.word  0x691f4013,0xe2ab4a7f,0x286b49f2,0x671ad612
	.word  0xf56026e2,0x0078cf5e,0xd8329d3d,0x4d2c41c1
	.word  0x5b54dfdb,0x4fd98b02,0x04a8b60a,0x505e0000
	.word  0x82412985,0xb5943ae7,0xfc48c643,0xf7a87cd7
	.word  0x61c95a32,0x21f82348,0xb70ff965,0x91035fcf
	.word  0xe4eaf58c,0x6343fa88,0x52f18f75,0x5276fac5
	.word  0x90199919,0x08a4444a,0xbc8472db,0xb6c1dec7
	.word  0x8343264d,0xb4d0a6eb,0xf5aa7aa8,0xef5aa09c
	.word  0x40b88df9,0x5319f068,0x24c85aff,0xf76e8f31
	.word  0x12b215d4,0x3fc08da0,0xe1109037,0xc17b0667
	.word  0x2482a6df,0xf60ae6dc,0x7444eafd,0x8a7a2ea5
	.word  0x47d7a4cd,0xc4108bb8,0x0a9e1f13,0xc594a408
	.word  0xa765faea,0x32057247,0xc0abdc01,0xacef25e0
	.word  0x71267524,0x680e5ee0,0xeb82a4bb,0x49884027
	.word  0x10ee27e9,0x11597693,0xb0644e3e,0xacd3161a
	.word  0xa80ca205,0xc453dd85,0xe1af3e92,0x05d4cb50
	.word  0x2a45f22a,0x21e76c9e,0xedb2a688,0x15cc5ff9
	.word  0x551b0f8c,0x13d6f75f,0xd9031c03,0x5a664136
	.word  0xc39c551a,0xa74d9f38,0xdd19356c,0x311730b8
	.word  0x629d5b6c,0x679d3f23,0x8fac690e,0x18bf245c
	.word  0x435350d1,0x2741a082,0xef273f35,0xa1dbb4ad
	.word  0x3af86d1c,0x23e6e310,0x8301e556,0x99d18d29
	.word  0x3518b3bc,0x89aed3dd,0xd10277a7,0x1daffa75
	.word  0xde61ad9a,0xe9a789f1,0xde4c7897,0xede11e05
	.word  0xa5ad663c,0xe989d839,0x3d11286a,0xdae98fde
	.word  0x03afea32,0x563065d8,0xe4c6cac6,0xfe273a39
	.word  0xb8712ff8,0xf901b316,0x0f404ce7,0xacb983d8
	.word  0x07a45b51,0x7facdb6a,0x3dc4af1f,0x9f220785
	.word  0xd4eaf464,0x6b368cb9,0x7d8be0e9,0x230c371a
	.word  0xe2569113,0xa332fd95,0x26aeacaa,0x6fed1ad2
	.word  0x5169b089,0x52cebbe0,0xe72a04a6,0xbe73f1ee
	.word  0x960b19e4,0x075e7253,0x0f93cff7,0x740c3685
	.word  0x7e119379,0x4939406d,0x94d8802e,0x82df3c89
	.word  0xab081564,0xda7f1789,0x27553bbe,0x97189ade
	.word  0x62b60dbb,0x5cb9dd56,0x88759805,0x06a6c411
	.word  0xf205a23a,0x00cc3467,0xf6581a65,0x234550c8
	.word  0x0a8f21bd,0x27a20061,0xf1e95c36,0xd7016be4
	.word  0x2536d0d4,0xb82f5bfe,0x9df16e24,0xa924c586
	.word  0x3ccfc03c,0xba9d2710,0xccb98184,0xa7b3e99c
	.word  0xc2ea4648,0x9e4da7cf,0x35f60cca,0x5e77b9b0
	.word  0x3e12af08,0xbbbd0c48,0x74230eea,0x49de39cc
	.word  0x6e23e726,0x4f8c95d1,0x4aba21f4,0x73182607
	.word  0x9850f24a,0x0e1e12fa,0x66efe058,0x184c1211
	.word  0xadd93474,0x47e32a28,0x9700bd90,0x7fe6d2bd
	.word  0x8edcb25b,0xaff4294a,0x60b90f8d,0x5b1e6a06
	.word  0xfb560b52,0xd1a3768c,0x525dfccd,0x61617a96
	.word  0x2315d10e,0x11b59ba5,0x294fac97,0xd09a538e
	.word  0xf466d10d,0x7f5c6ea7,0x4f460ce6,0x3d8eea59
	.word  0xf3e8da9d,0x4b5a4f09,0x9b73fd59,0xd5cb684f
	.word  0xdd12098d,0x30d30cd3,0xc073d299,0x6f292d7a
	.word  0xc9f9cdbc,0xeef67e61,0x06295956,0x41f840ab
	.word  0x04f0d11c,0x84d264b5,0x175a5bff,0x81ebad95
	.word  0xf9f79893,0x77bb681c,0x3fbd35d4,0xe685505b
	.word  0xb14e7280,0x6a6b048b,0x67cf8710,0x97ab91f1
	.word  0x43b4bf73,0xfabc91cc,0x0829023b,0xb8ca0141
	.word  0x0b335b3d,0xeea80316,0x0b705a13,0x20f95bcf
	.word  0x00ca6040,0xcc6dd69d,0x8e19337c,0x63180085
	.word  0x2e1af173,0x50c86433,0xd6150d46,0x8e87a61d
	.word  0xd2869c97,0x0f03be1f,0x835987b4,0x02b657f8
	.word  0xc25822ef,0x45dc91b3,0x1939c650,0xfaa36876
	.word  0x91196884,0x871a4b2c,0xae49fb8a,0xf13f6372
	.word  0x480605c9,0xa86a28c6,0x16a1446d,0xef15fe30
	.word  0xc4529683,0x4a94ddf3,0x3e385c82,0xb76a0cec
	.word  0x348c491e,0xc8916893,0x0ea888b1,0x6fd50ccc
	.word  0xef07b69b,0xc95e29a6,0x7fee6c17,0xffdd8798
	.word  0xb07e78f9,0x51d2fd16,0xc2e6cb11,0xae5d34c8
	.word  0xed07ed1c,0x2de572aa,0xb20b8279,0x170b17c9
	.word  0xd03c17cb,0xcb6eb255,0x5ffa416d,0x711e96df
	.word  0xa521e0dd,0xc7b29af7,0xd1773d80,0x31e3593c
	.word  0x65c5b859,0x5d627e37,0x291559d3,0xef6ed78a
	.word  0x4672fe3c,0x5f5db705,0x4eed6dd5,0xdd4662de
	.word  0xeef21b16,0xbf87b924,0xca162324,0x0e022eee
	.word  0xb3b22826,0xf222bf6b,0xbfa53ba9,0x8458a02c
	.word  0x53a2010f,0x0fc4f912,0x4e6e263e,0x7aeecf20
	.word  0x4346c62e,0xf85c644a,0x965c7484,0xfa11609a
	.word  0x3e99af22,0x23777826,0x0e92d37f,0x1e40929a
	.word  0x60e65c61,0x383139b9,0x697ecd9c,0xfe66c777
	.word  0xb5dd98f5,0x02227d55,0x5c6d08b9,0x0b8836ed
	.word  0x7166d66f,0xaa3cbc1e,0xd4398774,0x95a11e55
	.word  0x7bf7e3ed,0x5d715dbe,0xfad75eab,0xb6a750a3
	.word  0xf063fc28,0x96952df8,0x2ee92385,0xac6f0651
	.word  0x00bc1e93,0x3eb8eeb4,0xdd1d4b64,0x1ace85ed
	.word  0x29e0209d,0x89ad1f36,0x1e77b2bd,0xdffd07ca
	.word  0x85e20118,0x6f4f3f49,0x0d81998d,0x59aecef1
	.word  0x48e1ba16,0x83ea51d8,0x3d6b32d1,0x748353f9
	.word  0xb3110912,0x8f64f632,0xbf4ce7fd,0xcaff6a20
	.word  0xfa63a394,0xeed4a696,0xc8418099,0x75b532e8
	.word  0x78597967,0xd196be9c,0x293cdb11,0x5dfd20f9
	.word  0x5ee20924,0x61690896,0x6fa71f81,0x7ecf3f33
	.word  0xb97a6d17,0xe412086c,0xfe4a601c,0xef92af19
	.word  0x0d9355c2,0xb25e8517,0x3740c8e0,0x9029847e
	.word  0xb4748df2,0x65ef0dcb,0x91bf698b,0xd5388d52
	.word  0x86023dfc,0x6606aa85,0x575ecbeb,0xbcf0d474
	.word  0x3be94b35,0x4931ee7e,0x71a488cc,0xeeefad83
	.word  0xbc1557bb,0x6d8ca731,0xf1c46aad,0xc2235ad4
	.word  0xdb7c394d,0x39ed500e,0xb4d9d795,0x46904b41
	.word  0x1b4cdf98,0xa27c146a,0xc2420e11,0xce2c4520
	.word  0xc73cb23e,0x15cc4b2a,0xc425900e,0x206c7988
	.word  0xc4ea579d,0x3436a33c,0x6f7232ea,0x186f80e9
	.word  0x2fafaa9b,0xa2d0614d,0xff350c47,0xb38055d0
	.word  0xe43595cf,0x067678d6,0x8b72780b,0x1dbe2ebe
	.word  0xf266bb73,0x73be1b17,0x348d8382,0x249b6c1c
	.word  0x884f1794,0xb0213c57,0x7f7c14fc,0x1dd19f49
	.word  0x8df64391,0xf5f180b6,0x3065b7af,0xfb88b311
	.word  0x3ef943be,0x084fea0f,0x92f94e73,0xc62c3113
	.word  0xe650467c,0xc7992610,0xa779dd4a,0x29ffd2f0
	.word  0x2f3c4cc1,0x8d37660f,0x9de6f0ae,0xa75f009d
	.word  0x08670b6f,0x455cb44a,0x11e2b58b,0xc255a85b
	.word  0x01b483e5,0x65175d3b,0x6700c5ac,0x90450b8f
	.word  0x6fcd9c56,0x70f46072,0xbc6d3ce5,0x341967d7
	.word  0xe89f26f0,0xd1239582,0xa7b4e160,0x0d427941
	.word  0x9ee03936,0x801f0e68,0x06c869a1,0xef08c3f0
	.word  0x601d0033,0x4ef7aaf1,0x948d9f91,0xec64bfe3
	.word  0xaa8bbc19,0xdcb8813d,0xe0cbe106,0xeabcbe47
	.word  0x82332004,0xd36ee7f4,0x84297cfe,0x53eba4b3
	.word  0xf16219a3,0xbdd1e4e5,0x83867048,0x5ea5b3b3
	.word  0x58384f6d,0x91082d2d,0xb7951708,0xf5cd1481
	.word  0x928225b5,0x480cf0f1,0x3d11efcc,0x3dc7abf2
	.word  0x8c226b8d,0xe862aae4,0x7150d2c8,0x0d5c8abb
	.word  0x04a1f315,0x1527da2a,0x1b28d018,0xd088759d
	.word  0xe576b30d,0xbfd93354,0x824e7ec0,0x39c528c4
	.word  0x5e054dda,0x07a0b5d6,0x588bb72a,0x470eb62c
	.word  0x8661ce2d,0x7852ee85,0xc4e9c74e,0xd2b514d9
	.word  0x0b950783,0x65758d0c,0x5f7e1ca5,0x4e08b7f3
	.word  0x2cade34b,0x8b88ef00,0x710fd912,0x4ed7ce34
	.word  0x29f550a9,0x1da2957d,0x7e9e1a3b,0x6c7f975d
	.word  0x3b8ed958,0x42c82a2d,0xc34ddd86,0xe4fb7cd5
	.word  0xe8abc435,0xac830e5d,0xee4202cc,0x38b48f6b
	.word  0xb1bea753,0x2b99405a,0xa1a5214d,0x217f27c8
	.word  0x9944336e,0x164d9005,0x44e9f440,0xb3b4e27d
	.word  0x785d2818,0x6e116651,0x18dbc4ae,0x2593e957
	.word  0xb2732316,0x23c496b9,0xbd10108e,0x697f4795
	.word  0x0c6c18d1,0xe69d2c8f,0xb0b8830d,0x4eff4812
	.word  0x0476ab5b,0x4575fb61,0x980d504a,0x7e88fc68
	.word  0xadae3116,0x4c63f84e,0x7c42407b,0x74b12d5d
	.word  0x64135bd8,0xbf32300c,0xef95cd7f,0x14e6236e
	.word  0x425071d1,0x73160fc6,0xeb923951,0x9daa5939
	.word  0x3e2693c0,0xf30790c0,0xc7dcd85b,0xb658b20f
	.word  0x50517b23,0x943adac3,0x0c202119,0xb59ba100
	.word  0x8264fe4d,0x352f7965,0x1ff9f1eb,0x668cc8eb
	.word  0x82e4b401,0xe386c227,0x03df5ebe,0xcd112b04
	.word  0x0b02e067,0x07632acc,0xfca5cace,0x6db356c0
	.word  0xde521a27,0xaece6172,0x38f5001a,0x4146f84a
	.word  0xe91119e9,0xb20329e9,0xe8d13a11,0x97f7afeb
	.word  0x3a1c5ab8,0x27fab976,0xb7827483,0x196aa796
	.word  0x4344343d,0x37cc8b16,0x73dea3a2,0xf16c2869
	.word  0x294a8b62,0x22fdd17f,0x7864637d,0x06468d75
	.word  0x2876ecbb,0xbb2a914b,0xe8d75427,0xaf4471fc
	.word  0xad24d739,0x386c44e1,0x959c1ff5,0xac4c44aa
	.word  0xb225643d,0x6398d64b,0xb61043f3,0x3b6304da
	.word  0x6ece66cf,0x731e22e3,0xe42c56c2,0x7f883506
	.word  0x3c44aaa2,0xfae5c19a,0xa31c3b94,0xa82193a6
	.word  0xa6878e2f,0x9b475da5,0xa83aa036,0xf3a6fbfa
	.word  0xec9e826d,0xa4324d1f,0x65d7160e,0xaaca57ab
	.word  0x3a0f1942,0x64750b46,0x7974c9c2,0x8262fa85
	.word  0x0571cc26,0x2db8e39e,0x89147ce0,0xe3ad5e5f
	.word  0x7e0ee8dc,0xacdba179,0x31db0217,0xd744b713
	.word  0x74a64184,0x9ed5cbb9,0x3abf3292,0xc38b66cc
	.word  0x6855992d,0x0f1ed700,0xf5039345,0xd760233a
	.word  0xda18f23d,0x6d442f67,0x0316f1b2,0xcceae84e
	.word  0xbb85e808,0xda7d6dfd,0xf1a42abc,0x068e4197
	.word  0x2f852b5b,0xc4a78659,0xc2bfa80f,0xc69c4804
	.word  0x89b8d352,0x851bb94d,0x9bcf8178,0xf694f728
	.word  0x71e98d9f,0xfeb1210b,0x7f5932d7,0x7b81342d
	.word  0x27705a6b,0x43ee48d0,0x2e3171fd,0x114c7d6b


