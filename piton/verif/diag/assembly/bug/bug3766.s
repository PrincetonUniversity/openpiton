// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: bug3766.s
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
   random seed:	141235351
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
        setx  MAIN_BASE_DATA_VA, %r1, %r8
        setx  0x0000000000000f40, %g1, %r9
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
        setx  0x3474e3870f113f46, %g1, %r0
        setx  0x7962e4909cb34bd1, %g1, %r1
        setx  0x068c08e021aa1b54, %g1, %r2
        setx  0xce26a444671567b8, %g1, %r3
        setx  0x9ff941a276fe547f, %g1, %r4
        setx  0x8fa3ca3b0cfa8d82, %g1, %r5
        setx  0x4ddac487ea7fb64a, %g1, %r6
        setx  0x932a83593a863aed, %g1, %r7
        setx  0xfbf35da77b571906, %g1, %r10
        setx  0x38d5b325a7343126, %g1, %r11
        setx  0xa07863441f1915fb, %g1, %r12
        setx  0x0fadce9efa86eb10, %g1, %r13
        setx  0x2524acda6e2ca5c3, %g1, %r14
        setx  0x06d54561586172fe, %g1, %r15
        setx  0xc26ec7ed3028a7e6, %g1, %r16
        setx  0xbf5d702183b4d518, %g1, %r17
        setx  0xc12ce802da3e8952, %g1, %r18
        setx  0xe4747f1c72747eed, %g1, %r19
        setx  0xaa1fed9d209c8ea2, %g1, %r20
        setx  0x4d138f7d49c50311, %g1, %r21
        setx  0xde23e906a6f227a1, %g1, %r22
        setx  0x33e8767070dbb57f, %g1, %r23
        setx  0x0687286d915c44f6, %g1, %r24
        setx  0x18fa3f5625d90017, %g1, %r25
        setx  0xa18ae2af93ea4627, %g1, %r26
        setx  0xf0c3e20fc107549c, %g1, %r27
        setx  0xd5c18a799c1b41dd, %g1, %r28
        setx  0x0372ad554cd26431, %g1, %r29
        setx  0x896aa5e1c821a67c, %g1, %r30
        setx  0x1a36e51a6c9d479b, %g1, %r31
	.word 0x26c20004  ! 5: BRLZ	brlz,a,nt	%8,<label_0x20004>
	.word 0x8da209a9  ! 6: FDIVs	fdivs	%f8, %f9, %f6
	.word 0x8143c000  ! 7: STBAR	stbar
	.word 0xa2522e9c  ! 8: UMUL_I	umul 	%r8, 0x0e9c, %r17
	.word 0xcc520009  ! 9: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xf89a2748  ! 10: LDDA_I	ldda	[%r8, + 0x0748] %asi, %r28
	.word 0xc33a0009  ! 11: STDF_R	std	%f1, [%r9, %r8]
	.word 0x0a800008  ! 12: BCS	bcs  	<label_0x8>
	.word 0x2cca0008  ! 13: BRGZ	brgz,a,pt	%8,<label_0xa0008>
	.word 0xfc6a2ad0  ! 14: LDSTUB_I	ldstub	%r30, [%r8 + 0x0ad0]
	.word 0xcb220009  ! 16: STF_R	st	%f5, [%r9, %r8]
	.word 0xfe821009  ! 17: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r31
	.word 0x826a2500  ! 18: UDIVX_I	udivx 	%r8, 0x0500, %r1
	.word 0xc2ea2580  ! 19: LDSTUBA_I	ldstuba	%r1, [%r8 + 0x0580] %asi
	.word 0xc49a29c8  ! 20: LDDA_I	ldda	[%r8, + 0x09c8] %asi, %r2
	.word 0xc3ea266c  ! 21: PREFETCHA_I	prefetcha	[%r8, + 0x066c] %asi, #one_read
	.word 0xcff22009  ! 22: CASXA_R	casxa	[%r8]%asi, %r9, %r7
	.word 0x8ad20009  ! 23: UMULcc_R	umulcc 	%r8, %r9, %r5
	.word 0xb7220009  ! 24: MULScc_R	mulscc 	%r8, %r9, %r27
	.word 0xfc1a2768  ! 25: LDD_I	ldd	[%r8 + 0x0768], %r30
	.word 0x8fa209a9  ! 28: FDIVs	fdivs	%f8, %f9, %f7
	.word 0xc9e21009  ! 29: CASA_I	casa	[%r8] 0x80, %r9, %r4
	.word 0xceea1009  ! 30: LDSTUBA_R	ldstuba	%r7, [%r8 + %r9] 0x80
	.word 0xc47a0009  ! 31: SWAP_R	swap	%r2, [%r8 + %r9]
	.word 0x8143c000  ! 32: STBAR	stbar
	.word 0x8ada0009  ! 33: SMULcc_R	smulcc 	%r8, %r9, %r5
	.word 0xa24a0009  ! 34: MULX_R	mulx 	%r8, %r9, %r17
	.word 0xc3ea2688  ! 35: PREFETCHA_I	prefetcha	[%r8, + 0x0688] %asi, #one_read
	.word 0xe09a1009  ! 36: LDDA_R	ldda	[%r8, %r9] 0x80, %r16
	.word 0x8143e011  ! 38: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x8143c000  ! 39: STBAR	stbar
	.word 0xf4822b04  ! 40: LDUWA_I	lduwa	[%r8, + 0x0b04] %asi, %r26
	.word 0xebe21009  ! 41: CASA_I	casa	[%r8] 0x80, %r9, %r21
	.word 0xcd3a28f0  ! 43: STDF_I	std	%f6, [0x08f0, %r8]
	.word 0x8efa2330  ! 44: SDIVcc_I	sdivcc 	%r8, 0x0330, %r7
	.word 0xca520009  ! 45: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xcaea2d30  ! 46: LDSTUBA_I	ldstuba	%r5, [%r8 + 0x0d30] %asi
	.word 0x8143e011  ! 48: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xc9f22009  ! 49: CASXA_R	casxa	[%r8]%asi, %r9, %r4
	.word 0xf4da2b90  ! 50: LDXA_I	ldxa	[%r8, + 0x0b90] %asi, %r26
	.word 0x34800004  ! 51: BG	bg,a	<label_0x4>
	.word 0xc3ea2f9c  ! 52: PREFETCHA_I	prefetcha	[%r8, + 0x0f9c] %asi, #one_read
	.word 0xcff22009  ! 53: CASXA_R	casxa	[%r8]%asi, %r9, %r7
	.word 0xfcba2678  ! 54: STDA_I	stda	%r30, [%r8 + 0x0678] %asi
	.word 0x8cda0009  ! 55: SMULcc_R	smulcc 	%r8, %r9, %r6
	.word 0x8fa208a9  ! 56: FSUBs	fsubs	%f8, %f9, %f7
	.word 0xa8da0009  ! 57: SMULcc_R	smulcc 	%r8, %r9, %r20
	.word 0xc3222518  ! 58: STF_I	st	%f1, [0x0518, %r8]
	.word 0xd4ba1009  ! 60: STDA_R	stda	%r10, [%r8 + %r9] 0x80
	.word 0xc84227e0  ! 61: LDSW_I	ldsw	[%r8 + 0x07e0], %r4
	.word 0xe4ba1009  ! 62: STDA_R	stda	%r18, [%r8 + %r9] 0x80
	.word 0xe8da1009  ! 63: LDXA_R	ldxa	[%r8, %r9] 0x80, %r20
	.word 0xc7222460  ! 64: STF_I	st	%f3, [0x0460, %r8]
	.word 0xcefa1009  ! 65: SWAPA_R	swapa	%r7, [%r8 + %r9] 0x80
	.word 0x40000004  ! 66: CALL	call	disp30_4
	.word 0xc2a21009  ! 67: STWA_R	stwa	%r1, [%r8 + %r9] 0x80
	.word 0xc2ca26e4  ! 68: LDSBA_I	ldsba	[%r8, + 0x06e4] %asi, %r1
	.word 0x8b6a0009  ! 69: SDIVX_R	sdivx	%r8, %r9, %r5
	.word 0xfd222be0  ! 70: STF_I	st	%f30, [0x0be0, %r8]
	.word 0xc84a2324  ! 71: LDSB_I	ldsb	[%r8 + 0x0324], %r4
	.word 0xce4a0009  ! 72: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xcf2222b4  ! 73: STF_I	st	%f7, [0x02b4, %r8]
	.word 0xc3ea28f0  ! 74: PREFETCHA_I	prefetcha	[%r8, + 0x08f0] %asi, #one_read
	.word 0x84da2ce8  ! 75: SMULcc_I	smulcc 	%r8, 0x0ce8, %r2
	.word 0xca7a0009  ! 76: SWAP_R	swap	%r5, [%r8 + %r9]
	.word 0x04800004  ! 78: BLE	ble  	<label_0x4>
	.word 0x0ac20004  ! 79: BRNZ	brnz  ,nt	%8,<label_0x20004>
	.word 0x04ca0008  ! 80: BRLEZ	brlez  ,pt	%8,<label_0xa0008>
	.word 0xe0da1009  ! 81: LDXA_R	ldxa	[%r8, %r9] 0x80, %r16
	.word 0x89a20829  ! 82: FADDs	fadds	%f8, %f9, %f4
	.word 0xca7a2468  ! 83: SWAP_I	swap	%r5, [%r8 + 0x0468]
	.word 0x12800004  ! 84: BNE	bne  	<label_0x4>
	.word 0xc2b22c60  ! 86: STHA_I	stha	%r1, [%r8 + 0x0c60] %asi
	.word 0x8a522440  ! 87: UMUL_I	umul 	%r8, 0x0440, %r5
	.word 0xcef22bbc  ! 88: STXA_I	stxa	%r7, [%r8 + 0x0bbc] %asi
	.word 0x0ac20004  ! 89: BRNZ	brnz  ,nt	%8,<label_0x20004>
	.word 0xc2122e3c  ! 90: LDUH_I	lduh	[%r8 + 0x0e3c], %r1
	.word 0xc36a2a34  ! 91: PREFETCH_I	prefetch	[%r8 + 0x0a34], #one_read
	.word 0xfcda1009  ! 92: LDXA_R	ldxa	[%r8, %r9] 0x80, %r30
	.word 0xc6ca1009  ! 93: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r3
	.word 0x95a208a9  ! 94: FSUBs	fsubs	%f8, %f9, %f10
	.word 0x10800008  ! 95: BA	ba  	<label_0x8>
	.word 0x8143c000  ! 96: STBAR	stbar
	.word 0xccba1009  ! 97: STDA_R	stda	%r6, [%r8 + %r9] 0x80
	.word 0x3c800004  ! 98: BPOS	bpos,a	<label_0x4>
	.word 0x02ca0008  ! 99: BRZ	brz  ,pt	%8,<label_0xa0008>
	.word 0x825a20d4  ! 101: SMUL_I	smul 	%r8, 0x00d4, %r1
	.word 0x85a209a9  ! 102: FDIVs	fdivs	%f8, %f9, %f2
	.word 0xc6522830  ! 103: LDSH_I	ldsh	[%r8 + 0x0830], %r3
	.word 0x86da2478  ! 104: SMULcc_I	smulcc 	%r8, 0x0478, %r3
	.word 0xc2f22a98  ! 105: STXA_I	stxa	%r1, [%r8 + 0x0a98] %asi
	.word 0xe06a0009  ! 106: LDSTUB_R	ldstub	%r16, [%r8 + %r9]
	.word 0x86fa0009  ! 107: SDIVcc_R	sdivcc 	%r8, %r9, %r3
	.word 0x8143c000  ! 108: STBAR	stbar
	.word 0x9a722c2c  ! 109: UDIV_I	udiv 	%r8, 0x0c2c, %r13
	.word 0xcea21009  ! 110: STWA_R	stwa	%r7, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 111: STBAR	stbar
	.word 0xe5f21009  ! 112: CASXA_I	casxa	[%r8] 0x80, %r9, %r18
	.word 0x83a209a9  ! 113: FDIVs	fdivs	%f8, %f9, %f1
	.word 0xc6522cfc  ! 114: LDSH_I	ldsh	[%r8 + 0x0cfc], %r3
	.word 0xcaaa2860  ! 115: STBA_I	stba	%r5, [%r8 + 0x0860] %asi
	.word 0xcc020009  ! 116: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xfaa21009  ! 117: STWA_R	stwa	%r29, [%r8 + %r9] 0x80
	.word 0xc3ea25fc  ! 118: PREFETCHA_I	prefetcha	[%r8, + 0x05fc] %asi, #one_read
	.word 0x12800004  ! 119: BNE	bne  	<label_0x4>
	.word 0x24ca0004  ! 122: BRLEZ	brlez,a,pt	%8,<label_0xa0004>
	.word 0x8143e011  ! 123: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x8143e011  ! 124: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x89a20829  ! 126: FADDs	fadds	%f8, %f9, %f4
	.word 0xec9a2dac  ! 127: LDDA_I	ldda	[%r8, + 0x0dac] %asi, %r22
	.word 0x96da0009  ! 129: SMULcc_R	smulcc 	%r8, %r9, %r11
	.word 0xc4aa206c  ! 130: STBA_I	stba	%r2, [%r8 + 0x006c] %asi
	.word 0x83222c8c  ! 132: MULScc_I	mulscc 	%r8, 0x0c8c, %r1
	.word 0x8143c000  ! 133: STBAR	stbar
	.word 0x8143c000  ! 134: STBAR	stbar
	.word 0x8143c000  ! 135: STBAR	stbar
	.word 0x845a2730  ! 136: SMUL_I	smul 	%r8, 0x0730, %r2
	.word 0x8143c000  ! 137: STBAR	stbar
	.word 0x32800004  ! 138: BNE	bne,a	<label_0x4>
	.word 0x8b220009  ! 139: MULScc_R	mulscc 	%r8, %r9, %r5
	.word 0x8143c000  ! 140: STBAR	stbar
	.word 0xcaf22ee4  ! 141: STXA_I	stxa	%r5, [%r8 + 0x0ee4] %asi
	.word 0x825a0009  ! 142: SMUL_R	smul 	%r8, %r9, %r1
	.word 0xf4ba24b8  ! 143: STDA_I	stda	%r26, [%r8 + 0x04b8] %asi
	.word 0xb5a209a9  ! 144: FDIVs	fdivs	%f8, %f9, %f26
	.word 0xcdf21009  ! 145: CASXA_I	casxa	[%r8] 0x80, %r9, %r6
	.word 0x8a5a26bc  ! 146: SMUL_I	smul 	%r8, 0x06bc, %r5
	.word 0xff222fbc  ! 147: STF_I	st	%f31, [0x0fbc, %r8]
	.word 0x8143c000  ! 148: STBAR	stbar
	.word 0xc2aa1009  ! 149: STBA_R	stba	%r1, [%r8 + %r9] 0x80
	.word 0xcc0a0009  ! 150: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xca122c20  ! 151: LDUH_I	lduh	[%r8 + 0x0c20], %r5
	.word 0x32800004  ! 152: BNE	bne,a	<label_0x4>
	.word 0x26ca0004  ! 153: BRLZ	brlz,a,pt	%8,<label_0xa0004>
	.word 0xc3ea255c  ! 154: PREFETCHA_I	prefetcha	[%r8, + 0x055c] %asi, #one_read
	.word 0x88da2268  ! 155: SMULcc_I	smulcc 	%r8, 0x0268, %r4
	.word 0x8143e011  ! 156: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xcaa21009  ! 157: STWA_R	stwa	%r5, [%r8 + %r9] 0x80
	.word 0xd6ea1009  ! 159: LDSTUBA_R	ldstuba	%r11, [%r8 + %r9] 0x80
	.word 0x844a2fc0  ! 160: MULX_I	mulx 	%r8, 0x0fc0, %r2
	.word 0x845a2314  ! 161: SMUL_I	smul 	%r8, 0x0314, %r2
	.word 0x8cfa29f0  ! 162: SDIVcc_I	sdivcc 	%r8, 0x09f0, %r6
	.word 0xf8ba1009  ! 165: STDA_R	stda	%r28, [%r8 + %r9] 0x80
	.word 0xc2ca1009  ! 166: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r1
	.word 0xf0ca1009  ! 167: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r24
	.word 0xfeca2b80  ! 168: LDSBA_I	ldsba	[%r8, + 0x0b80] %asi, %r31
	.word 0x0e800004  ! 169: BVS	bvs  	<label_0x4>
	.word 0x98da0009  ! 170: SMULcc_R	smulcc 	%r8, %r9, %r12
	.word 0xec1225c0  ! 171: LDUH_I	lduh	[%r8 + 0x05c0], %r22
	.word 0x82520009  ! 172: UMUL_R	umul 	%r8, %r9, %r1
	.word 0x8c722824  ! 173: UDIV_I	udiv 	%r8, 0x0824, %r6
	.word 0xc93a236c  ! 174: STDF_I	std	%f4, [0x036c, %r8]
	.word 0xc93a0009  ! 175: STDF_R	std	%f4, [%r9, %r8]
	.word 0x0a800008  ! 176: BCS	bcs  	<label_0x8>
	.word 0xc36a2124  ! 177: PREFETCH_I	prefetch	[%r8 + 0x0124], #one_read
	.word 0xc2aa1009  ! 178: STBA_R	stba	%r1, [%r8 + %r9] 0x80
	.word 0x86d20009  ! 179: UMULcc_R	umulcc 	%r8, %r9, %r3
	.word 0xa9a208a9  ! 180: FSUBs	fsubs	%f8, %f9, %f20
	.word 0xde52256c  ! 181: LDSH_I	ldsh	[%r8 + 0x056c], %r15
	.word 0x8143e011  ! 182: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x0ac20004  ! 183: BRNZ	brnz  ,nt	%8,<label_0x20004>
	.word 0xce120009  ! 184: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xc3e21009  ! 185: CASA_I	casa	[%r8] 0x80, %r9, %r1
	.word 0xb7a208a9  ! 186: FSUBs	fsubs	%f8, %f9, %f27
	.word 0xdea21009  ! 187: STWA_R	stwa	%r15, [%r8 + %r9] 0x80
	.word 0x0c800008  ! 188: BNEG	bneg  	<label_0x8>
	.word 0x846a239c  ! 189: UDIVX_I	udivx 	%r8, 0x039c, %r2
	.word 0xcac220ec  ! 190: LDSWA_I	ldswa	[%r8, + 0x00ec] %asi, %r5
	.word 0xc36a2204  ! 191: PREFETCH_I	prefetch	[%r8 + 0x0204], #one_read
	.word 0xd8922254  ! 193: LDUHA_I	lduha	[%r8, + 0x0254] %asi, %r12
	.word 0xfc120009  ! 194: LDUH_R	lduh	[%r8 + %r9], %r30
	.word 0x83a20929  ! 195: FMULs	fmuls	%f8, %f9, %f1
	.word 0xcc1a2b18  ! 196: LDD_I	ldd	[%r8 + 0x0b18], %r6
	.word 0xccf229d0  ! 197: STXA_I	stxa	%r6, [%r8 + 0x09d0] %asi
	.word 0x846a0009  ! 198: UDIVX_R	udivx 	%r8, %r9, %r2
	.word 0xc3f21009  ! 199: CASXA_I	casxa	[%r8] 0x80, %r9, %r1
	.word 0xc7222974  ! 200: STF_I	st	%f3, [0x0974, %r8]
	.word 0x8143c000  ! 201: STBAR	stbar
	.word 0x964a21f4  ! 202: MULX_I	mulx 	%r8, 0x01f4, %r11
	.word 0x86d20009  ! 203: UMULcc_R	umulcc 	%r8, %r9, %r3
	.word 0xc8ca1009  ! 204: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r4
	.word 0xc84a0009  ! 205: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xcec21009  ! 206: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r7
	.word 0xcc520009  ! 207: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xca5a0009  ! 208: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xa4720009  ! 209: UDIV_R	udiv 	%r8, %r9, %r18
	.word 0xe0120009  ! 210: LDUH_R	lduh	[%r8 + %r9], %r16
	.word 0xcff21009  ! 211: CASXA_I	casxa	[%r8] 0x80, %r9, %r7
	.word 0xc4c2225c  ! 212: LDSWA_I	ldswa	[%r8, + 0x025c] %asi, %r2
	.word 0x8143e011  ! 213: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xeeaa1009  ! 214: STBA_R	stba	%r23, [%r8 + %r9] 0x80
	.word 0xc66a0009  ! 215: LDSTUB_R	ldstub	%r3, [%r8 + %r9]
	.word 0x32800004  ! 216: BNE	bne,a	<label_0x4>
	.word 0xc86a2094  ! 217: LDSTUB_I	ldstub	%r4, [%r8 + 0x0094]
	.word 0xa722276c  ! 218: MULScc_I	mulscc 	%r8, 0x076c, %r19
	.word 0xc3ea1009  ! 219: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xce922c54  ! 220: LDUHA_I	lduha	[%r8, + 0x0c54] %asi, %r7
	.word 0xdf3a2a34  ! 221: STDF_I	std	%f15, [0x0a34, %r8]
	.word 0xc2b21009  ! 223: STHA_R	stha	%r1, [%r8 + %r9] 0x80
	.word 0x2e800008  ! 225: BVS	bvs,a	<label_0x8>
	.word 0x88f222dc  ! 226: UDIVcc_I	udivcc 	%r8, 0x02dc, %r4
	.word 0xc3f21009  ! 227: CASXA_I	casxa	[%r8] 0x80, %r9, %r1
	.word 0x86da2594  ! 228: SMULcc_I	smulcc 	%r8, 0x0594, %r3
	.word 0xc6ca25b4  ! 229: LDSBA_I	ldsba	[%r8, + 0x05b4] %asi, %r3
	.word 0xfeda2ba8  ! 230: LDXA_I	ldxa	[%r8, + 0x0ba8] %asi, %r31
	.word 0xfb2222b4  ! 231: STF_I	st	%f29, [0x02b4, %r8]
	.word 0xc48a2ac0  ! 232: LDUBA_I	lduba	[%r8, + 0x0ac0] %asi, %r2
	.word 0xe7220009  ! 233: STF_R	st	%f19, [%r9, %r8]
	.word 0x24c20004  ! 234: BRLEZ	brlez,a,nt	%8,<label_0x20004>
	.word 0x886a0009  ! 235: UDIVX_R	udivx 	%r8, %r9, %r4
	.word 0x867a0009  ! 236: SDIV_R	sdiv 	%r8, %r9, %r3
	.word 0x1c800008  ! 237: BPOS	bpos  	<label_0x8>
	.word 0xcaf2234c  ! 238: STXA_I	stxa	%r5, [%r8 + 0x034c] %asi
	.word 0xcca22764  ! 239: STWA_I	stwa	%r6, [%r8 + 0x0764] %asi
	.word 0x2e800004  ! 240: BVS	bvs,a	<label_0x4>
	.word 0xc2ea23b0  ! 241: LDSTUBA_I	ldstuba	%r1, [%r8 + 0x03b0] %asi
	.word 0xc47a2e64  ! 242: SWAP_I	swap	%r2, [%r8 + 0x0e64]
	.word 0xc3ea2598  ! 243: PREFETCHA_I	prefetcha	[%r8, + 0x0598] %asi, #one_read
	.word 0xc26a0009  ! 244: LDSTUB_R	ldstub	%r1, [%r8 + %r9]
	.word 0x8f6a2748  ! 245: SDIVX_I	sdivx	%r8, 0x0748, %r7
	.word 0x965228ac  ! 246: UMUL_I	umul 	%r8, 0x08ac, %r11
	.word 0x3c800004  ! 247: BPOS	bpos,a	<label_0x4>
	.word 0x0c800004  ! 248: BNEG	bneg  	<label_0x4>
	.word 0xc80a0009  ! 249: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0x8143c000  ! 250: STBAR	stbar
	.word 0xdc1a0009  ! 251: LDD_R	ldd	[%r8 + %r9], %r14
	.word 0xc67a206c  ! 252: SWAP_I	swap	%r3, [%r8 + 0x006c]
	.word 0xe6f22f94  ! 253: STXA_I	stxa	%r19, [%r8 + 0x0f94] %asi
	.word 0xcc520009  ! 254: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0x8143c000  ! 255: STBAR	stbar
	.word 0x0e800004  ! 256: BVS	bvs  	<label_0x4>
	.word 0x984a268c  ! 257: MULX_I	mulx 	%r8, 0x068c, %r12
	.word 0xcf220009  ! 258: STF_R	st	%f7, [%r9, %r8]
	.word 0xc522273c  ! 259: STF_I	st	%f2, [0x073c, %r8]
	.word 0xc3ea1009  ! 260: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xfcba283c  ! 261: STDA_I	stda	%r30, [%r8 + 0x083c] %asi
	.word 0x856a23d0  ! 263: SDIVX_I	sdivx	%r8, 0x03d0, %r2
	.word 0xd4aa2f30  ! 264: STBA_I	stba	%r10, [%r8 + 0x0f30] %asi
	.word 0xcfe21009  ! 265: CASA_I	casa	[%r8] 0x80, %r9, %r7
	.word 0xcd222460  ! 267: STF_I	st	%f6, [0x0460, %r8]
	.word 0xf8120009  ! 268: LDUH_R	lduh	[%r8 + %r9], %r28
	.word 0x89a209a9  ! 269: FDIVs	fdivs	%f8, %f9, %f4
	.word 0x8d220009  ! 270: MULScc_R	mulscc 	%r8, %r9, %r6
	.word 0xce4a0009  ! 271: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0x8143c000  ! 272: STBAR	stbar
	.word 0x3a800008  ! 273: BCC	bcc,a	<label_0x8>
	.word 0x8b220009  ! 274: MULScc_R	mulscc 	%r8, %r9, %r5
	.word 0xc36a2180  ! 275: PREFETCH_I	prefetch	[%r8 + 0x0180], #one_read
	.word 0x8143c000  ! 276: STBAR	stbar
	.word 0xce921009  ! 277: LDUHA_R	lduha	[%r8, %r9] 0x80, %r7
	.word 0x8c722e40  ! 278: UDIV_I	udiv 	%r8, 0x0e40, %r6
	.word 0xd68a27f8  ! 280: LDUBA_I	lduba	[%r8, + 0x07f8] %asi, %r11
	.word 0x8a522314  ! 281: UMUL_I	umul 	%r8, 0x0314, %r5
	.word 0x8143c000  ! 282: STBAR	stbar
	.word 0x8143e011  ! 283: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xda6a2a9c  ! 284: LDSTUB_I	ldstub	%r13, [%r8 + 0x0a9c]
	.word 0x8143e011  ! 285: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x8143e011  ! 286: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x0c800004  ! 287: BNEG	bneg  	<label_0x4>
	.word 0x16800004  ! 288: BGE	bge  	<label_0x4>
	.word 0x8143e011  ! 289: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xb06a0009  ! 290: UDIVX_R	udivx 	%r8, %r9, %r24
	.word 0xc2fa1009  ! 291: SWAPA_R	swapa	%r1, [%r8 + %r9] 0x80
	.word 0xd8aa1009  ! 292: STBA_R	stba	%r12, [%r8 + %r9] 0x80
	.word 0x82722cb4  ! 293: UDIV_I	udiv 	%r8, 0x0cb4, %r1
	.word 0xc36a2f48  ! 294: PREFETCH_I	prefetch	[%r8 + 0x0f48], #one_read
	.word 0xcab21009  ! 295: STHA_R	stha	%r5, [%r8 + %r9] 0x80
	.word 0xc53a282c  ! 296: STDF_I	std	%f2, [0x082c, %r8]
	.word 0xfefa2448  ! 297: SWAPA_I	swapa	%r31, [%r8 + 0x0448] %asi
	.word 0xcada2b78  ! 298: LDXA_I	ldxa	[%r8, + 0x0b78] %asi, %r5
	.word 0xc41a2a64  ! 299: LDD_I	ldd	[%r8 + 0x0a64], %r2
	.word 0xae722c6c  ! 301: UDIV_I	udiv 	%r8, 0x0c6c, %r23
	.word 0xcec22e74  ! 302: LDSWA_I	ldswa	[%r8, + 0x0e74] %asi, %r7
	.word 0xcd220009  ! 303: STF_R	st	%f6, [%r9, %r8]
	.word 0x8c5a0009  ! 304: SMUL_R	smul 	%r8, %r9, %r6
	.word 0x3a800004  ! 305: BCC	bcc,a	<label_0x4>
	.word 0xce522e64  ! 306: LDSH_I	ldsh	[%r8 + 0x0e64], %r7
	.word 0x8143e011  ! 307: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xf8ea1009  ! 308: LDSTUBA_R	ldstuba	%r28, [%r8 + %r9] 0x80
	.word 0x8b6a0009  ! 309: SDIVX_R	sdivx	%r8, %r9, %r5
	.word 0xcc6a0009  ! 310: LDSTUB_R	ldstub	%r6, [%r8 + %r9]
	.word 0xc8f21009  ! 311: STXA_R	stxa	%r4, [%r8 + %r9] 0x80
	.word 0x04800008  ! 312: BLE	ble  	<label_0x8>
	.word 0xcb3a0009  ! 313: STDF_R	std	%f5, [%r9, %r8]
	.word 0x00800004  ! 314: BN	bn  	<label_0x4>
	.word 0xb8fa25e0  ! 315: SDIVcc_I	sdivcc 	%r8, 0x05e0, %r28
	.word 0xe1e21009  ! 316: CASA_I	casa	[%r8] 0x80, %r9, %r16
	.word 0xfb3a0009  ! 317: STDF_R	std	%f29, [%r9, %r8]
	.word 0x3e800008  ! 318: BVC	bvc,a	<label_0x8>
	.word 0x85a208a9  ! 319: FSUBs	fsubs	%f8, %f9, %f2
	.word 0xc6a21009  ! 320: STWA_R	stwa	%r3, [%r8 + %r9] 0x80
	.word 0xe85a0009  ! 321: LDX_R	ldx	[%r8 + %r9], %r20
	.word 0xd4022418  ! 322: LDUW_I	lduw	[%r8 + 0x0418], %r10
	.word 0x30800004  ! 323: BA	ba,a	<label_0x4>
	.word 0xc3ea2278  ! 324: PREFETCHA_I	prefetcha	[%r8, + 0x0278] %asi, #one_read
	.word 0xd6921009  ! 326: LDUHA_R	lduha	[%r8, %r9] 0x80, %r11
	.word 0x8143e011  ! 328: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xcec21009  ! 329: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r7
	.word 0xd922263c  ! 330: STF_I	st	%f12, [0x063c, %r8]
	.word 0xc61221f0  ! 331: LDUH_I	lduh	[%r8 + 0x01f0], %r3
	.word 0xe4ca26cc  ! 332: LDSBA_I	ldsba	[%r8, + 0x06cc] %asi, %r18
	.word 0x02c20004  ! 333: BRZ	brz  ,nt	%8,<label_0x20004>
	.word 0xcfe21009  ! 334: CASA_I	casa	[%r8] 0x80, %r9, %r7
	.word 0xc3f21009  ! 335: CASXA_I	casxa	[%r8] 0x80, %r9, %r1
	.word 0x8143c000  ! 336: STBAR	stbar
	.word 0x88d220d4  ! 337: UMULcc_I	umulcc 	%r8, 0x00d4, %r4
	.word 0xca520009  ! 338: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0x2aca0004  ! 339: BRNZ	brnz,a,pt	%8,<label_0xa0004>
	.word 0xd7e22009  ! 340: CASA_R	casa	[%r8] %asi, %r9, %r11
	.word 0x0aca0008  ! 341: BRNZ	brnz  ,pt	%8,<label_0xa0008>
	.word 0x85a20929  ! 342: FMULs	fmuls	%f8, %f9, %f2
	.word 0x8143e011  ! 343: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xcb220009  ! 344: STF_R	st	%f5, [%r9, %r8]
	.word 0x06800004  ! 345: BL	bl  	<label_0x4>
	.word 0xc4ba2ffc  ! 346: STDA_I	stda	%r2, [%r8 + 0x0ffc] %asi
	.word 0xc36a1009  ! 347: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc2da1009  ! 348: LDXA_R	ldxa	[%r8, %r9] 0x80, %r1
	.word 0xc7220009  ! 350: STF_R	st	%f3, [%r9, %r8]
	.word 0x84f22714  ! 352: UDIVcc_I	udivcc 	%r8, 0x0714, %r2
	.word 0xcef22194  ! 353: STXA_I	stxa	%r7, [%r8 + 0x0194] %asi
	.word 0x8c720009  ! 354: UDIV_R	udiv 	%r8, %r9, %r6
	.word 0xa4f20009  ! 355: UDIVcc_R	udivcc 	%r8, %r9, %r18
	.word 0xc4fa1009  ! 356: SWAPA_R	swapa	%r2, [%r8 + %r9] 0x80
	.word 0xc53a0009  ! 357: STDF_R	std	%f2, [%r9, %r8]
	.word 0x0eca0008  ! 358: BRGEZ	brgez  ,pt	%8,<label_0xa0008>
	.word 0xfcaa1009  ! 359: STBA_R	stba	%r30, [%r8 + %r9] 0x80
	.word 0x884a0009  ! 360: MULX_R	mulx 	%r8, %r9, %r4
	.word 0xcca22180  ! 361: STWA_I	stwa	%r6, [%r8 + 0x0180] %asi
	.word 0xc3f22009  ! 362: CASXA_R	casxa	[%r8]%asi, %r9, %r1
	.word 0xcac22004  ! 363: LDSWA_I	ldswa	[%r8, + 0x0004] %asi, %r5
	.word 0x8143e011  ! 364: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xd72223d4  ! 365: STF_I	st	%f11, [0x03d4, %r8]
	.word 0x8e520009  ! 366: UMUL_R	umul 	%r8, %r9, %r7
	.word 0x8af2245c  ! 367: UDIVcc_I	udivcc 	%r8, 0x045c, %r5
	.word 0xc2a21009  ! 368: STWA_R	stwa	%r1, [%r8 + %r9] 0x80
	.word 0xe8ba1009  ! 369: STDA_R	stda	%r20, [%r8 + %r9] 0x80
	.word 0xb05a0009  ! 370: SMUL_R	smul 	%r8, %r9, %r24
	.word 0x8e5a2dc8  ! 371: SMUL_I	smul 	%r8, 0x0dc8, %r7
	.word 0x8143c000  ! 372: STBAR	stbar
	.word 0x8143e011  ! 373: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xca4a21e0  ! 374: LDSB_I	ldsb	[%r8 + 0x01e0], %r5
	.word 0xb8da2aa0  ! 375: SMULcc_I	smulcc 	%r8, 0x0aa0, %r28
	.word 0xd4da2fa8  ! 376: LDXA_I	ldxa	[%r8, + 0x0fa8] %asi, %r10
	.word 0x88da2920  ! 377: SMULcc_I	smulcc 	%r8, 0x0920, %r4
	.word 0x826a0009  ! 378: UDIVX_R	udivx 	%r8, %r9, %r1
	.word 0x88f20009  ! 379: UDIVcc_R	udivcc 	%r8, %r9, %r4
	.word 0xe26a2320  ! 380: LDSTUB_I	ldstub	%r17, [%r8 + 0x0320]
	.word 0xc36a26ec  ! 381: PREFETCH_I	prefetch	[%r8 + 0x06ec], #one_read
	.word 0x89a20829  ! 383: FADDs	fadds	%f8, %f9, %f4
	.word 0xceca1009  ! 384: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r7
	.word 0xe6ca286c  ! 385: LDSBA_I	ldsba	[%r8, + 0x086c] %asi, %r19
	.word 0x8143e011  ! 386: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xf2d227cc  ! 387: LDSHA_I	ldsha	[%r8, + 0x07cc] %asi, %r25
	.word 0x8143c000  ! 388: STBAR	stbar
	.word 0x0cca0004  ! 389: BRGZ	brgz  ,pt	%8,<label_0xa0004>
	.word 0x0eca0004  ! 392: BRGEZ	brgez  ,pt	%8,<label_0xa0004>
	.word 0x8c5a0009  ! 393: SMUL_R	smul 	%r8, %r9, %r6
	.word 0x8143c000  ! 394: STBAR	stbar
	.word 0xc8ba26b4  ! 395: STDA_I	stda	%r4, [%r8 + 0x06b4] %asi
	.word 0xe3e21009  ! 396: CASA_I	casa	[%r8] 0x80, %r9, %r17
	.word 0xe0c229f8  ! 397: LDSWA_I	ldswa	[%r8, + 0x09f8] %asi, %r16
	.word 0x08800004  ! 398: BLEU	bleu  	<label_0x4>
	.word 0xc4fa22fc  ! 399: SWAPA_I	swapa	%r2, [%r8 + 0x02fc] %asi
	.word 0xe2a22760  ! 400: STWA_I	stwa	%r17, [%r8 + 0x0760] %asi
	.word 0xc6aa210c  ! 401: STBA_I	stba	%r3, [%r8 + 0x010c] %asi
	.word 0x8143e011  ! 402: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xc4b21009  ! 403: STHA_R	stha	%r2, [%r8 + %r9] 0x80
	.word 0xf5f21009  ! 404: CASXA_I	casxa	[%r8] 0x80, %r9, %r26
	.word 0x86da2a38  ! 405: SMULcc_I	smulcc 	%r8, 0x0a38, %r3
	.word 0x36800004  ! 406: BGE	bge,a	<label_0x4>
	.word 0x9e6a237c  ! 407: UDIVX_I	udivx 	%r8, 0x037c, %r15
	.word 0xdc9a2bdc  ! 408: LDDA_I	ldda	[%r8, + 0x0bdc] %asi, %r14
	.word 0x86fa2644  ! 409: SDIVcc_I	sdivcc 	%r8, 0x0644, %r3
	.word 0xce4a0009  ! 410: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xc4c21009  ! 411: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r2
	.word 0x8c7a2e34  ! 412: SDIV_I	sdiv 	%r8, 0x0e34, %r6
	.word 0xb3a209a9  ! 413: FDIVs	fdivs	%f8, %f9, %f25
	.word 0xcef22fb4  ! 414: STXA_I	stxa	%r7, [%r8 + 0x0fb4] %asi
	.word 0x83a20829  ! 415: FADDs	fadds	%f8, %f9, %f1
	.word 0xfa922e4c  ! 416: LDUHA_I	lduha	[%r8, + 0x0e4c] %asi, %r29
	.word 0xc4da2b0c  ! 417: LDXA_I	ldxa	[%r8, + 0x0b0c] %asi, %r2
	.word 0x8143c000  ! 418: STBAR	stbar
	.word 0x8143c000  ! 419: STBAR	stbar
	.word 0x966a2420  ! 420: UDIVX_I	udivx 	%r8, 0x0420, %r11
	.word 0xc66a0009  ! 421: LDSTUB_R	ldstub	%r3, [%r8 + %r9]
	.word 0x8da209a9  ! 422: FDIVs	fdivs	%f8, %f9, %f6
	.word 0x86f20009  ! 423: UDIVcc_R	udivcc 	%r8, %r9, %r3
	.word 0xc26a2b30  ! 424: LDSTUB_I	ldstub	%r1, [%r8 + 0x0b30]
	.word 0xca4a2b6c  ! 425: LDSB_I	ldsb	[%r8 + 0x0b6c], %r5
	.word 0xe0a22028  ! 426: STWA_I	stwa	%r16, [%r8 + 0x0028] %asi
	.word 0x8143e011  ! 427: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xc2fa1009  ! 428: SWAPA_R	swapa	%r1, [%r8 + %r9] 0x80
	.word 0xf73a0009  ! 429: STDF_R	std	%f27, [%r9, %r8]
	.word 0x8143c000  ! 430: STBAR	stbar
	.word 0xceca1009  ! 431: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r7
	.word 0x26ca0008  ! 432: BRLZ	brlz,a,pt	%8,<label_0xa0008>
	.word 0x9e720009  ! 433: UDIV_R	udiv 	%r8, %r9, %r15
	.word 0xceb2286c  ! 434: STHA_I	stha	%r7, [%r8 + 0x086c] %asi
	.word 0x844a2edc  ! 435: MULX_I	mulx 	%r8, 0x0edc, %r2
	.word 0x8eda2b08  ! 436: SMULcc_I	smulcc 	%r8, 0x0b08, %r7
	.word 0xc3ea1009  ! 437: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc4c2282c  ! 438: LDSWA_I	ldswa	[%r8, + 0x082c] %asi, %r2
	.word 0xc4ca2340  ! 439: LDSBA_I	ldsba	[%r8, + 0x0340] %asi, %r2
	.word 0x8143e011  ! 440: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x8143c000  ! 441: STBAR	stbar
	.word 0x86da0009  ! 442: SMULcc_R	smulcc 	%r8, %r9, %r3
	.word 0xc45a2558  ! 443: LDX_I	ldx	[%r8 + 0x0558], %r2
	.word 0x87a209a9  ! 444: FDIVs	fdivs	%f8, %f9, %f3
	.word 0x36800008  ! 445: BGE	bge,a	<label_0x8>
	.word 0x40000004  ! 446: CALL	call	disp30_4
	.word 0xcf220009  ! 447: STF_R	st	%f7, [%r9, %r8]
	.word 0xdc921009  ! 448: LDUHA_R	lduha	[%r8, %r9] 0x80, %r14
	.word 0x86f20009  ! 449: UDIVcc_R	udivcc 	%r8, %r9, %r3
	.word 0xd8122c9c  ! 450: LDUH_I	lduh	[%r8 + 0x0c9c], %r12
	.word 0xc36a1009  ! 451: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xaaf20009  ! 452: UDIVcc_R	udivcc 	%r8, %r9, %r21
	.word 0xccc21009  ! 453: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r6
	.word 0x8143e011  ! 454: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xce7a0009  ! 455: SWAP_R	swap	%r7, [%r8 + %r9]
	.word 0xc3222310  ! 456: STF_I	st	%f1, [0x0310, %r8]
	.word 0x88fa20a4  ! 457: SDIVcc_I	sdivcc 	%r8, 0x00a4, %r4
	.word 0x8ba209a9  ! 458: FDIVs	fdivs	%f8, %f9, %f5
	.word 0x82da23f4  ! 459: SMULcc_I	smulcc 	%r8, 0x03f4, %r1
	.word 0xccb226c0  ! 460: STHA_I	stha	%r6, [%r8 + 0x06c0] %asi
	.word 0xd4ca2e98  ! 461: LDSBA_I	ldsba	[%r8, + 0x0e98] %asi, %r10
	.word 0xcec21009  ! 462: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r7
	.word 0xa7a208a9  ! 463: FSUBs	fsubs	%f8, %f9, %f19
	.word 0xc8b21009  ! 464: STHA_R	stha	%r4, [%r8 + %r9] 0x80
	.word 0x83a209a9  ! 465: FDIVs	fdivs	%f8, %f9, %f1
	.word 0xc36a2e18  ! 466: PREFETCH_I	prefetch	[%r8 + 0x0e18], #one_read
	.word 0xca0223a0  ! 467: LDUW_I	lduw	[%r8 + 0x03a0], %r5
	.word 0x89a209a9  ! 468: FDIVs	fdivs	%f8, %f9, %f4
	.word 0xfa6a0009  ! 469: LDSTUB_R	ldstub	%r29, [%r8 + %r9]
	.word 0xe26a0009  ! 470: LDSTUB_R	ldstub	%r17, [%r8 + %r9]
	.word 0xa87222a0  ! 471: UDIV_I	udiv 	%r8, 0x02a0, %r20
	.word 0xc9f22009  ! 472: CASXA_R	casxa	[%r8]%asi, %r9, %r4
	.word 0x84720009  ! 473: UDIV_R	udiv 	%r8, %r9, %r2
	.word 0xc88221b8  ! 474: LDUWA_I	lduwa	[%r8, + 0x01b8] %asi, %r4
	.word 0xc6a22498  ! 475: STWA_I	stwa	%r3, [%r8 + 0x0498] %asi
	.word 0xc8fa274c  ! 476: SWAPA_I	swapa	%r4, [%r8 + 0x074c] %asi
	.word 0xccca24b8  ! 477: LDSBA_I	ldsba	[%r8, + 0x04b8] %asi, %r6
	.word 0x40000004  ! 478: CALL	call	disp30_4
	.word 0xedf21009  ! 479: CASXA_I	casxa	[%r8] 0x80, %r9, %r22
	.word 0xe27a21a8  ! 480: SWAP_I	swap	%r17, [%r8 + 0x01a8]
	.word 0xc4ca24dc  ! 481: LDSBA_I	ldsba	[%r8, + 0x04dc] %asi, %r2
	.word 0xc40a0009  ! 482: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xc3ea2aa8  ! 483: PREFETCHA_I	prefetcha	[%r8, + 0x0aa8] %asi, #one_read
	.word 0xd8d22f28  ! 484: LDSHA_I	ldsha	[%r8, + 0x0f28] %asi, %r12
	.word 0x8a4a2d40  ! 485: MULX_I	mulx 	%r8, 0x0d40, %r5
	.word 0xfef22c9c  ! 487: STXA_I	stxa	%r31, [%r8 + 0x0c9c] %asi
	.word 0x28800008  ! 488: BLEU	bleu,a	<label_0x8>
	.word 0x8143e011  ! 489: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x40000008  ! 490: CALL	call	disp30_8
	.word 0xcf222be4  ! 492: STF_I	st	%f7, [0x0be4, %r8]
	.word 0x06ca0004  ! 493: BRLZ	brlz  ,pt	%8,<label_0xa0004>
	.word 0x02800004  ! 494: BE	be  	<label_0x4>
	.word 0xc81a0009  ! 495: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xc642204c  ! 496: LDSW_I	ldsw	[%r8 + 0x004c], %r3
	.word 0xca0a22c8  ! 497: LDUB_I	ldub	[%r8 + 0x02c8], %r5
	.word 0xccf21009  ! 498: STXA_R	stxa	%r6, [%r8 + %r9] 0x80
	.word 0xc8ca1009  ! 499: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r4
	.word 0xc5f21009  ! 500: CASXA_I	casxa	[%r8] 0x80, %r9, %r2
	.word 0xc322217c  ! 501: STF_I	st	%f1, [0x017c, %r8]
	.word 0xdeaa1009  ! 502: STBA_R	stba	%r15, [%r8 + %r9] 0x80
	.word 0x8143e011  ! 503: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xc2fa24a4  ! 504: SWAPA_I	swapa	%r1, [%r8 + 0x04a4] %asi
	.word 0x1c800008  ! 505: BPOS	bpos  	<label_0x8>
	.word 0xf5f21009  ! 506: CASXA_I	casxa	[%r8] 0x80, %r9, %r26
	.word 0xc8020009  ! 507: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0x2cca0008  ! 508: BRGZ	brgz,a,pt	%8,<label_0xa0008>
	.word 0x3a800004  ! 509: BCC	bcc,a	<label_0x4>
	.word 0xc36a2004  ! 510: PREFETCH_I	prefetch	[%r8 + 0x0004], #one_read
	.word 0x88f22338  ! 511: UDIVcc_I	udivcc 	%r8, 0x0338, %r4
	.word 0xde5a0009  ! 512: LDX_R	ldx	[%r8 + %r9], %r15
	.word 0xc20a2eb0  ! 513: LDUB_I	ldub	[%r8 + 0x0eb0], %r1
	.word 0x82da2d34  ! 514: SMULcc_I	smulcc 	%r8, 0x0d34, %r1
	.word 0xceda27ac  ! 515: LDXA_I	ldxa	[%r8, + 0x07ac] %asi, %r7
	.word 0x8c520009  ! 516: UMUL_R	umul 	%r8, %r9, %r6
	.word 0x85a20829  ! 518: FADDs	fadds	%f8, %f9, %f2
	.word 0xc4a228fc  ! 519: STWA_I	stwa	%r2, [%r8 + 0x08fc] %asi
	.word 0x8143e011  ! 520: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x8143c000  ! 521: STBAR	stbar
	.word 0x8143c000  ! 523: STBAR	stbar
	.word 0xdd220009  ! 524: STF_R	st	%f14, [%r9, %r8]
	.word 0xc36a1009  ! 525: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xccaa2fa0  ! 526: STBA_I	stba	%r6, [%r8 + 0x0fa0] %asi
	.word 0x826a2d54  ! 527: UDIVX_I	udivx 	%r8, 0x0d54, %r1
	.word 0xa05a0009  ! 528: SMUL_R	smul 	%r8, %r9, %r16
	.word 0x8143e011  ! 529: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x987a0009  ! 530: SDIV_R	sdiv 	%r8, %r9, %r12
	.word 0xdcfa1009  ! 532: SWAPA_R	swapa	%r14, [%r8 + %r9] 0x80
	.word 0x8143e011  ! 533: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xc6520009  ! 534: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xc4520009  ! 535: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xe49a22b0  ! 536: LDDA_I	ldda	[%r8, + 0x02b0] %asi, %r18
	.word 0x28800008  ! 537: BLEU	bleu,a	<label_0x8>
	.word 0xba720009  ! 538: UDIV_R	udiv 	%r8, %r9, %r29
	.word 0xc3ea2d80  ! 539: PREFETCHA_I	prefetcha	[%r8, + 0x0d80] %asi, #one_read
	.word 0xc64a2d90  ! 540: LDSB_I	ldsb	[%r8 + 0x0d90], %r3
	.word 0xc2122254  ! 541: LDUH_I	lduh	[%r8 + 0x0254], %r1
	.word 0xc68a2360  ! 542: LDUBA_I	lduba	[%r8, + 0x0360] %asi, %r3
	.word 0x8143e011  ! 543: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xcc6a22b0  ! 544: LDSTUB_I	ldstub	%r6, [%r8 + 0x02b0]
	.word 0xdc9a1009  ! 545: LDDA_R	ldda	[%r8, %r9] 0x80, %r14
	.word 0x8143e011  ! 546: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xc46a2388  ! 547: LDSTUB_I	ldstub	%r2, [%r8 + 0x0388]
	.word 0xdc9a29e0  ! 548: LDDA_I	ldda	[%r8, + 0x09e0] %asi, %r14
	.word 0xa4d22080  ! 549: UMULcc_I	umulcc 	%r8, 0x0080, %r18
	.word 0x8143c000  ! 550: STBAR	stbar
	.word 0xc36a2f40  ! 551: PREFETCH_I	prefetch	[%r8 + 0x0f40], #one_read
	.word 0xb0da2e6c  ! 552: SMULcc_I	smulcc 	%r8, 0x0e6c, %r24
	.word 0xcfe22009  ! 553: CASA_R	casa	[%r8] %asi, %r9, %r7
	.word 0xdab21009  ! 554: STHA_R	stha	%r13, [%r8 + %r9] 0x80
	.word 0x88720009  ! 555: UDIV_R	udiv 	%r8, %r9, %r4
	.word 0xfa92221c  ! 558: LDUHA_I	lduha	[%r8, + 0x021c] %asi, %r29
	.word 0x8d6a0009  ! 559: SDIVX_R	sdivx	%r8, %r9, %r6
	.word 0xcea21009  ! 560: STWA_R	stwa	%r7, [%r8 + %r9] 0x80
	.word 0xc4a22638  ! 561: STWA_I	stwa	%r2, [%r8 + 0x0638] %asi
	.word 0xa8da2f94  ! 562: SMULcc_I	smulcc 	%r8, 0x0f94, %r20
	.word 0xdc6a2d94  ! 563: LDSTUB_I	ldstub	%r14, [%r8 + 0x0d94]
	.word 0x02800004  ! 564: BE	be  	<label_0x4>
	.word 0xc3ea1009  ! 565: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xdafa2538  ! 566: SWAPA_I	swapa	%r13, [%r8 + 0x0538] %asi
	.word 0xc5e21009  ! 568: CASA_I	casa	[%r8] 0x80, %r9, %r2
	.word 0xcc520009  ! 569: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xcea2221c  ! 570: STWA_I	stwa	%r7, [%r8 + 0x021c] %asi
	.word 0xce7a0009  ! 571: SWAP_R	swap	%r7, [%r8 + %r9]
	.word 0xff3a2644  ! 572: STDF_I	std	%f31, [0x0644, %r8]
	.word 0xc4fa1009  ! 573: SWAPA_R	swapa	%r2, [%r8 + %r9] 0x80
	.word 0xa47a0009  ! 574: SDIV_R	sdiv 	%r8, %r9, %r18
	.word 0x8143c000  ! 575: STBAR	stbar
	.word 0xcd3a235c  ! 576: STDF_I	std	%f6, [0x035c, %r8]
	.word 0xc80a0009  ! 578: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xfc5a2e58  ! 579: LDX_I	ldx	[%r8 + 0x0e58], %r30
	.word 0x8ad20009  ! 580: UMULcc_R	umulcc 	%r8, %r9, %r5
	.word 0xc7f21009  ! 581: CASXA_I	casxa	[%r8] 0x80, %r9, %r3
	.word 0x8143c000  ! 582: STBAR	stbar
	.word 0xc4a22c38  ! 583: STWA_I	stwa	%r2, [%r8 + 0x0c38] %asi
	.word 0xc3ea239c  ! 584: PREFETCHA_I	prefetcha	[%r8, + 0x039c] %asi, #one_read
	.word 0xf67a275c  ! 585: SWAP_I	swap	%r27, [%r8 + 0x075c]
	.word 0xf2d22970  ! 586: LDSHA_I	ldsha	[%r8, + 0x0970] %asi, %r25
	.word 0x8143c000  ! 587: STBAR	stbar
	.word 0x8ba209a9  ! 588: FDIVs	fdivs	%f8, %f9, %f5
	.word 0xccb21009  ! 589: STHA_R	stha	%r6, [%r8 + %r9] 0x80
	.word 0xe0020009  ! 590: LDUW_R	lduw	[%r8 + %r9], %r16
	.word 0x8b6a2998  ! 591: SDIVX_I	sdivx	%r8, 0x0998, %r5
	.word 0x9e7a0009  ! 592: SDIV_R	sdiv 	%r8, %r9, %r15
	.word 0xcdf21009  ! 593: CASXA_I	casxa	[%r8] 0x80, %r9, %r6
	.word 0x8143c000  ! 594: STBAR	stbar
	.word 0x82f20009  ! 595: UDIVcc_R	udivcc 	%r8, %r9, %r1
	.word 0xc2fa2f60  ! 596: SWAPA_I	swapa	%r1, [%r8 + 0x0f60] %asi
	.word 0xe2a229c8  ! 597: STWA_I	stwa	%r17, [%r8 + 0x09c8] %asi
	.word 0xe68a2efc  ! 598: LDUBA_I	lduba	[%r8, + 0x0efc] %asi, %r19
	.word 0xcff21009  ! 599: CASXA_I	casxa	[%r8] 0x80, %r9, %r7
	.word 0x8e522ff8  ! 600: UMUL_I	umul 	%r8, 0x0ff8, %r7
	.word 0x8d220009  ! 601: MULScc_R	mulscc 	%r8, %r9, %r6
	.word 0xf7220009  ! 602: STF_R	st	%f27, [%r9, %r8]
	.word 0xccd21009  ! 603: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r6
	.word 0x0cc20004  ! 604: BRGZ	brgz  ,nt	%8,<label_0x20004>
	.word 0xa26a2e7c  ! 605: UDIVX_I	udivx 	%r8, 0x0e7c, %r17
	.word 0x8143e011  ! 606: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x8fa20929  ! 607: FMULs	fmuls	%f8, %f9, %f7
	.word 0xe2d227f0  ! 608: LDSHA_I	ldsha	[%r8, + 0x07f0] %asi, %r17
	.word 0x40000004  ! 609: CALL	call	disp30_4
	.word 0xa6f22840  ! 610: UDIVcc_I	udivcc 	%r8, 0x0840, %r19
	.word 0xea0a0009  ! 611: LDUB_R	ldub	[%r8 + %r9], %r21
	.word 0xccca1009  ! 612: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r6
	.word 0x8143e011  ! 613: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x04800008  ! 614: BLE	ble  	<label_0x8>
	.word 0xf0020009  ! 615: LDUW_R	lduw	[%r8 + %r9], %r24
	.word 0x82d22b38  ! 616: UMULcc_I	umulcc 	%r8, 0x0b38, %r1
	.word 0xc36a2250  ! 617: PREFETCH_I	prefetch	[%r8 + 0x0250], #one_read
	.word 0x8143e011  ! 620: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xc8da1009  ! 621: LDXA_R	ldxa	[%r8, %r9] 0x80, %r4
	.word 0x8da208a9  ! 622: FSUBs	fsubs	%f8, %f9, %f6
	.word 0xcea21009  ! 623: STWA_R	stwa	%r7, [%r8 + %r9] 0x80
	.word 0xc2a21009  ! 624: STWA_R	stwa	%r1, [%r8 + %r9] 0x80
	.word 0xdeea2fc4  ! 625: LDSTUBA_I	ldstuba	%r15, [%r8 + 0x0fc4] %asi
	.word 0xc2422794  ! 626: LDSW_I	ldsw	[%r8 + 0x0794], %r1
	.word 0x26800004  ! 627: BL	bl,a	<label_0x4>
	.word 0xc81a232c  ! 629: LDD_I	ldd	[%r8 + 0x032c], %r4
	.word 0x8143c000  ! 630: STBAR	stbar
	.word 0x8143c000  ! 631: STBAR	stbar
	.word 0xc3ea2efc  ! 632: PREFETCHA_I	prefetcha	[%r8, + 0x0efc] %asi, #one_read
	.word 0xf9e22009  ! 633: CASA_R	casa	[%r8] %asi, %r9, %r28
	.word 0x8143e011  ! 634: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x2c800004  ! 635: BNEG	bneg,a	<label_0x4>
	.word 0xe20a0009  ! 636: LDUB_R	ldub	[%r8 + %r9], %r17
	.word 0xc28a1009  ! 638: LDUBA_R	lduba	[%r8, %r9] 0x80, %r1
	.word 0xcafa2008  ! 639: SWAPA_I	swapa	%r5, [%r8 + 0x0008] %asi
	.word 0x87a209a9  ! 640: FDIVs	fdivs	%f8, %f9, %f3
	.word 0xc4821009  ! 641: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r2
	.word 0xe09a1009  ! 642: LDDA_R	ldda	[%r8, %r9] 0x80, %r16
	.word 0xc2022ba8  ! 643: LDUW_I	lduw	[%r8 + 0x0ba8], %r1
	.word 0x8143c000  ! 644: STBAR	stbar
	.word 0xe6b22adc  ! 645: STHA_I	stha	%r19, [%r8 + 0x0adc] %asi
	.word 0xcd3a0009  ! 646: STDF_R	std	%f6, [%r9, %r8]
	.word 0x8143e011  ! 647: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x0ac20004  ! 648: BRNZ	brnz  ,nt	%8,<label_0x20004>
	.word 0x8143c000  ! 649: STBAR	stbar
	.word 0xb27a2274  ! 650: SDIV_I	sdiv 	%r8, 0x0274, %r25
	.word 0xec1a2384  ! 651: LDD_I	ldd	[%r8 + 0x0384], %r22
	.word 0xcaaa2474  ! 652: STBA_I	stba	%r5, [%r8 + 0x0474] %asi
	.word 0x8143e011  ! 653: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x2e800004  ! 654: BVS	bvs,a	<label_0x4>
	.word 0x9a6a2e94  ! 655: UDIVX_I	udivx 	%r8, 0x0e94, %r13
	.word 0x82da0009  ! 656: SMULcc_R	smulcc 	%r8, %r9, %r1
	.word 0xf86a0009  ! 657: LDSTUB_R	ldstub	%r28, [%r8 + %r9]
	.word 0xc36a21cc  ! 658: PREFETCH_I	prefetch	[%r8 + 0x01cc], #one_read
	.word 0xe8b22338  ! 659: STHA_I	stha	%r20, [%r8 + 0x0338] %asi
	.word 0x896a21b8  ! 660: SDIVX_I	sdivx	%r8, 0x01b8, %r4
	.word 0xe2ca22f0  ! 661: LDSBA_I	ldsba	[%r8, + 0x02f0] %asi, %r17
	.word 0x40000008  ! 663: CALL	call	disp30_8
	.word 0xc8ea2198  ! 664: LDSTUBA_I	ldstuba	%r4, [%r8 + 0x0198] %asi
	.word 0x8ed20009  ! 665: UMULcc_R	umulcc 	%r8, %r9, %r7
	.word 0xc32228f8  ! 667: STF_I	st	%f1, [0x08f8, %r8]
	.word 0xd4b22e10  ! 669: STHA_I	stha	%r10, [%r8 + 0x0e10] %asi
	.word 0x8143c000  ! 670: STBAR	stbar
	.word 0xc67a2f9c  ! 671: SWAP_I	swap	%r3, [%r8 + 0x0f9c]
	.word 0x0aca0004  ! 672: BRNZ	brnz  ,pt	%8,<label_0xa0004>
	.word 0xcaf21009  ! 673: STXA_R	stxa	%r5, [%r8 + %r9] 0x80
	.word 0xc36a2afc  ! 674: PREFETCH_I	prefetch	[%r8 + 0x0afc], #one_read
	.word 0xc5222e3c  ! 675: STF_I	st	%f2, [0x0e3c, %r8]
	.word 0x84d20009  ! 677: UMULcc_R	umulcc 	%r8, %r9, %r2
	.word 0x08800004  ! 678: BLEU	bleu  	<label_0x4>
	.word 0xe53a0009  ! 679: STDF_R	std	%f18, [%r9, %r8]
	.word 0x8143e011  ! 680: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x06800008  ! 681: BL	bl  	<label_0x8>
	.word 0xde6a2f64  ! 682: LDSTUB_I	ldstub	%r15, [%r8 + 0x0f64]
	.word 0x8d222a84  ! 683: MULScc_I	mulscc 	%r8, 0x0a84, %r6
	.word 0xcaa2278c  ! 685: STWA_I	stwa	%r5, [%r8 + 0x078c] %asi
	.word 0xcc122bec  ! 686: LDUH_I	lduh	[%r8 + 0x0bec], %r6
	.word 0xc4b22574  ! 687: STHA_I	stha	%r2, [%r8 + 0x0574] %asi
	.word 0x825220d4  ! 688: UMUL_I	umul 	%r8, 0x00d4, %r1
	.word 0xcaaa1009  ! 689: STBA_R	stba	%r5, [%r8 + %r9] 0x80
	.word 0xc85a0009  ! 690: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xcd3a237c  ! 691: STDF_I	std	%f6, [0x037c, %r8]
	.word 0x94520009  ! 692: UMUL_R	umul 	%r8, %r9, %r10
	.word 0xc36a2438  ! 693: PREFETCH_I	prefetch	[%r8 + 0x0438], #one_read
	.word 0x26800004  ! 694: BL	bl,a	<label_0x4>
	.word 0x9ef224c4  ! 695: UDIVcc_I	udivcc 	%r8, 0x04c4, %r15
	.word 0xcc4a2f78  ! 696: LDSB_I	ldsb	[%r8 + 0x0f78], %r6
	.word 0xf2f22ab4  ! 697: STXA_I	stxa	%r25, [%r8 + 0x0ab4] %asi
	.word 0x8e4a0009  ! 698: MULX_R	mulx 	%r8, %r9, %r7
	.word 0xf2da1009  ! 699: LDXA_R	ldxa	[%r8, %r9] 0x80, %r25
	.word 0x8ada2604  ! 700: SMULcc_I	smulcc 	%r8, 0x0604, %r5
	.word 0xe9f21009  ! 701: CASXA_I	casxa	[%r8] 0x80, %r9, %r20
	.word 0x85220009  ! 702: MULScc_R	mulscc 	%r8, %r9, %r2
	.word 0x8143c000  ! 703: STBAR	stbar
	.word 0xc3e21009  ! 704: CASA_I	casa	[%r8] 0x80, %r9, %r1
	.word 0x84522914  ! 705: UMUL_I	umul 	%r8, 0x0914, %r2
	.word 0xbe522f08  ! 706: UMUL_I	umul 	%r8, 0x0f08, %r31
	.word 0xec0a254c  ! 707: LDUB_I	ldub	[%r8 + 0x054c], %r22
	.word 0xc4921009  ! 708: LDUHA_R	lduha	[%r8, %r9] 0x80, %r2
	.word 0xc3ea1009  ! 709: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc4122e54  ! 710: LDUH_I	lduh	[%r8 + 0x0e54], %r2
	.word 0xc85a25f4  ! 712: LDX_I	ldx	[%r8 + 0x05f4], %r4
	.word 0xcc0a0009  ! 713: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xa0720009  ! 715: UDIV_R	udiv 	%r8, %r9, %r16
	.word 0xc4420009  ! 716: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xf06a0009  ! 718: LDSTUB_R	ldstub	%r24, [%r8 + %r9]
	.word 0x84da25e0  ! 719: SMULcc_I	smulcc 	%r8, 0x05e0, %r2
	.word 0xc4d21009  ! 720: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r2
	.word 0xcc020009  ! 721: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0x8143e011  ! 722: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x2c800008  ! 723: BNEG	bneg,a	<label_0x8>
	.word 0x22800004  ! 724: BE	be,a	<label_0x4>
	.word 0xa9a209a9  ! 725: FDIVs	fdivs	%f8, %f9, %f20
	.word 0xef2228a8  ! 726: STF_I	st	%f23, [0x08a8, %r8]
	.word 0xc4ba1009  ! 727: STDA_R	stda	%r2, [%r8 + %r9] 0x80
	.word 0x2a800004  ! 728: BCS	bcs,a	<label_0x4>
	.word 0x8ba209a9  ! 729: FDIVs	fdivs	%f8, %f9, %f5
	.word 0x845a0009  ! 730: SMUL_R	smul 	%r8, %r9, %r2
	.word 0xccaa2014  ! 731: STBA_I	stba	%r6, [%r8 + 0x0014] %asi
	.word 0xd4a21009  ! 732: STWA_R	stwa	%r10, [%r8 + %r9] 0x80
	.word 0x8143e011  ! 733: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xccf21009  ! 734: STXA_R	stxa	%r6, [%r8 + %r9] 0x80
	.word 0xe81a0009  ! 735: LDD_R	ldd	[%r8 + %r9], %r20
	.word 0xc3ea1009  ! 736: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xf20221b0  ! 737: LDUW_I	lduw	[%r8 + 0x01b0], %r25
	.word 0x8143c000  ! 738: STBAR	stbar
	.word 0x83a20929  ! 739: FMULs	fmuls	%f8, %f9, %f1
	.word 0x0aca0008  ! 740: BRNZ	brnz  ,pt	%8,<label_0xa0008>
	.word 0xb0d20009  ! 741: UMULcc_R	umulcc 	%r8, %r9, %r24
	.word 0xe0922264  ! 742: LDUHA_I	lduha	[%r8, + 0x0264] %asi, %r16
	.word 0x866a2db4  ! 743: UDIVX_I	udivx 	%r8, 0x0db4, %r3
	.word 0xebe22009  ! 744: CASA_R	casa	[%r8] %asi, %r9, %r21
	.word 0x8143c000  ! 745: STBAR	stbar
	.word 0xc87a271c  ! 746: SWAP_I	swap	%r4, [%r8 + 0x071c]
	.word 0xae7a27a8  ! 747: SDIV_I	sdiv 	%r8, 0x07a8, %r23
	.word 0x865a0009  ! 748: SMUL_R	smul 	%r8, %r9, %r3
	.word 0xc3ea1009  ! 749: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x88fa24b0  ! 750: SDIVcc_I	sdivcc 	%r8, 0x04b0, %r4
	.word 0xcf3a0009  ! 751: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc28a1009  ! 752: LDUBA_R	lduba	[%r8, %r9] 0x80, %r1
	.word 0xf84a0009  ! 754: LDSB_R	ldsb	[%r8 + %r9], %r28
	.word 0xeb222338  ! 755: STF_I	st	%f21, [0x0338, %r8]
	.word 0xce6a2750  ! 757: LDSTUB_I	ldstub	%r7, [%r8 + 0x0750]
	.word 0x12800008  ! 758: BNE	bne  	<label_0x8>
	.word 0xccb2295c  ! 759: STHA_I	stha	%r6, [%r8 + 0x095c] %asi
	.word 0xc2b22e64  ! 760: STHA_I	stha	%r1, [%r8 + 0x0e64] %asi
	.word 0xcd3a2c84  ! 761: STDF_I	std	%f6, [0x0c84, %r8]
	.word 0xccaa2854  ! 762: STBA_I	stba	%r6, [%r8 + 0x0854] %asi
	.word 0xd8c21009  ! 763: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r12
	.word 0xed3a27f0  ! 764: STDF_I	std	%f22, [0x07f0, %r8]
	.word 0x8143e011  ! 765: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x40000008  ! 766: CALL	call	disp30_8
	.word 0xf8b21009  ! 767: STHA_R	stha	%r28, [%r8 + %r9] 0x80
	.word 0xc2ca1009  ! 768: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r1
	.word 0x8143e011  ! 769: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x84520009  ! 770: UMUL_R	umul 	%r8, %r9, %r2
	.word 0xdc0a0009  ! 771: LDUB_R	ldub	[%r8 + %r9], %r14
	.word 0xf4a21009  ! 772: STWA_R	stwa	%r26, [%r8 + %r9] 0x80
	.word 0xcc1a0009  ! 773: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0x08800004  ! 774: BLEU	bleu  	<label_0x4>
	.word 0xc3ea1009  ! 775: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc8ba1009  ! 776: STDA_R	stda	%r4, [%r8 + %r9] 0x80
	.word 0x896a28c8  ! 778: SDIVX_I	sdivx	%r8, 0x08c8, %r4
	.word 0xc6020009  ! 779: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xd8422518  ! 780: LDSW_I	ldsw	[%r8 + 0x0518], %r12
	.word 0xf8922164  ! 781: LDUHA_I	lduha	[%r8, + 0x0164] %asi, %r28
	.word 0xc2ea1009  ! 782: LDSTUBA_R	ldstuba	%r1, [%r8 + %r9] 0x80
	.word 0xc6d22acc  ! 783: LDSHA_I	ldsha	[%r8, + 0x0acc] %asi, %r3
	.word 0x2cc20004  ! 784: BRGZ	brgz,a,nt	%8,<label_0x20004>
	.word 0xe0da2158  ! 785: LDXA_I	ldxa	[%r8, + 0x0158] %asi, %r16
	.word 0xf53a2a20  ! 786: STDF_I	std	%f26, [0x0a20, %r8]
	.word 0xfcea238c  ! 787: LDSTUBA_I	ldstuba	%r30, [%r8 + 0x038c] %asi
	.word 0x06800004  ! 788: BL	bl  	<label_0x4>
	.word 0x83a208a9  ! 789: FSUBs	fsubs	%f8, %f9, %f1
	.word 0x8143c000  ! 790: STBAR	stbar
	.word 0xc73a2740  ! 791: STDF_I	std	%f3, [0x0740, %r8]
	.word 0xcab21009  ! 792: STHA_R	stha	%r5, [%r8 + %r9] 0x80
	.word 0xccda2084  ! 793: LDXA_I	ldxa	[%r8, + 0x0084] %asi, %r6
	.word 0xc4821009  ! 794: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r2
	.word 0xc4122db0  ! 795: LDUH_I	lduh	[%r8 + 0x0db0], %r2
	.word 0xc36a2770  ! 796: PREFETCH_I	prefetch	[%r8 + 0x0770], #one_read
	.word 0x964a0009  ! 798: MULX_R	mulx 	%r8, %r9, %r11
	.word 0x8143c000  ! 799: STBAR	stbar
	.word 0x8143e011  ! 800: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xb8da0009  ! 802: SMULcc_R	smulcc 	%r8, %r9, %r28
	.word 0xc41a0009  ! 803: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x8143c000  ! 804: STBAR	stbar
	.word 0xcafa1009  ! 805: SWAPA_R	swapa	%r5, [%r8 + %r9] 0x80
	.word 0xc65a0009  ! 806: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xfeaa1009  ! 807: STBA_R	stba	%r31, [%r8 + %r9] 0x80
	.word 0xf07a0009  ! 808: SWAP_R	swap	%r24, [%r8 + %r9]
	.word 0xc6ea2764  ! 809: LDSTUBA_I	ldstuba	%r3, [%r8 + 0x0764] %asi
	.word 0x2e800004  ! 810: BVS	bvs,a	<label_0x4>
	.word 0xcf3a0009  ! 811: STDF_R	std	%f7, [%r9, %r8]
	.word 0xdcaa1009  ! 812: STBA_R	stba	%r14, [%r8 + %r9] 0x80
	.word 0x84da2650  ! 813: SMULcc_I	smulcc 	%r8, 0x0650, %r2
	.word 0xdab229ac  ! 814: STHA_I	stha	%r13, [%r8 + 0x09ac] %asi
	.word 0xb56a2a74  ! 815: SDIVX_I	sdivx	%r8, 0x0a74, %r26
	.word 0x85222a54  ! 816: MULScc_I	mulscc 	%r8, 0x0a54, %r2
	.word 0x9cfa0009  ! 817: SDIVcc_R	sdivcc 	%r8, %r9, %r14
	.word 0xc36a2b4c  ! 818: PREFETCH_I	prefetch	[%r8 + 0x0b4c], #one_read
	.word 0xc8da1009  ! 819: LDXA_R	ldxa	[%r8, %r9] 0x80, %r4
	.word 0x26c20004  ! 820: BRLZ	brlz,a,nt	%8,<label_0x20004>
	.word 0x1a800004  ! 821: BCC	bcc  	<label_0x4>
	.word 0x8a7a2f90  ! 822: SDIV_I	sdiv 	%r8, 0x0f90, %r5
	.word 0x87a20929  ! 823: FMULs	fmuls	%f8, %f9, %f3
	.word 0xccba1009  ! 824: STDA_R	stda	%r6, [%r8 + %r9] 0x80
	.word 0xcaaa1009  ! 825: STBA_R	stba	%r5, [%r8 + %r9] 0x80
	.word 0x82f20009  ! 826: UDIVcc_R	udivcc 	%r8, %r9, %r1
	.word 0xc6f21009  ! 827: STXA_R	stxa	%r3, [%r8 + %r9] 0x80
	.word 0xc4ea2824  ! 828: LDSTUBA_I	ldstuba	%r2, [%r8 + 0x0824] %asi
	.word 0xc24a2154  ! 829: LDSB_I	ldsb	[%r8 + 0x0154], %r1
	.word 0x24c20004  ! 830: BRLEZ	brlez,a,nt	%8,<label_0x20004>
	.word 0xc6522948  ! 831: LDSH_I	ldsh	[%r8 + 0x0948], %r3
	.word 0xc26a0009  ! 832: LDSTUB_R	ldstub	%r1, [%r8 + %r9]
	.word 0xfe52204c  ! 833: LDSH_I	ldsh	[%r8 + 0x004c], %r31
	.word 0xd6f22530  ! 834: STXA_I	stxa	%r11, [%r8 + 0x0530] %asi
	.word 0x30800008  ! 835: BA	ba,a	<label_0x8>
	.word 0xc3ea29ac  ! 836: PREFETCHA_I	prefetcha	[%r8, + 0x09ac] %asi, #one_read
	.word 0xcdf22009  ! 837: CASXA_R	casxa	[%r8]%asi, %r9, %r6
	.word 0x8143c000  ! 838: STBAR	stbar
	.word 0xda120009  ! 839: LDUH_R	lduh	[%r8 + %r9], %r13
	.word 0xc4aa2b28  ! 840: STBA_I	stba	%r2, [%r8 + 0x0b28] %asi
	.word 0xf87a0009  ! 841: SWAP_R	swap	%r28, [%r8 + %r9]
	.word 0xd44a2e80  ! 842: LDSB_I	ldsb	[%r8 + 0x0e80], %r10
	.word 0x8143e011  ! 843: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x0ac20004  ! 844: BRNZ	brnz  ,nt	%8,<label_0x20004>
	.word 0x14800008  ! 846: BG	bg  	<label_0x8>
	.word 0x88da0009  ! 847: SMULcc_R	smulcc 	%r8, %r9, %r4
	.word 0x2c800004  ! 848: BNEG	bneg,a	<label_0x4>
	.word 0x8c6a0009  ! 849: UDIVX_R	udivx 	%r8, %r9, %r6
	.word 0xcc6a2ed4  ! 850: LDSTUB_I	ldstub	%r6, [%r8 + 0x0ed4]
	.word 0xc2aa1009  ! 851: STBA_R	stba	%r1, [%r8 + %r9] 0x80
	.word 0x84520009  ! 852: UMUL_R	umul 	%r8, %r9, %r2
	.word 0x8ad22bd0  ! 853: UMULcc_I	umulcc 	%r8, 0x0bd0, %r5
	.word 0xc36a260c  ! 854: PREFETCH_I	prefetch	[%r8 + 0x060c], #one_read
	.word 0xcd220009  ! 855: STF_R	st	%f6, [%r9, %r8]
	.word 0xe46a2fd4  ! 856: LDSTUB_I	ldstub	%r18, [%r8 + 0x0fd4]
	.word 0xc60a0009  ! 857: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xc85a23f4  ! 858: LDX_I	ldx	[%r8 + 0x03f4], %r4
	.word 0x8ada0009  ! 859: SMULcc_R	smulcc 	%r8, %r9, %r5
	.word 0xc26a2a80  ! 860: LDSTUB_I	ldstub	%r1, [%r8 + 0x0a80]
	.word 0x8ba209a9  ! 861: FDIVs	fdivs	%f8, %f9, %f5
	.word 0x8d6a0009  ! 862: SDIVX_R	sdivx	%r8, %r9, %r6
	.word 0xc80a0009  ! 863: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xe4c22284  ! 864: LDSWA_I	ldswa	[%r8, + 0x0284] %asi, %r18
	.word 0xc5f22009  ! 865: CASXA_R	casxa	[%r8]%asi, %r9, %r2
	.word 0xc27a0009  ! 866: SWAP_R	swap	%r1, [%r8 + %r9]
	.word 0x85a20929  ! 867: FMULs	fmuls	%f8, %f9, %f2
	.word 0xe6120009  ! 868: LDUH_R	lduh	[%r8 + %r9], %r19
	.word 0xe2921009  ! 869: LDUHA_R	lduha	[%r8, %r9] 0x80, %r17
	.word 0x86720009  ! 870: UDIV_R	udiv 	%r8, %r9, %r3
	.word 0x14800004  ! 871: BG	bg  	<label_0x4>
	.word 0x85a20829  ! 872: FADDs	fadds	%f8, %f9, %f2
	.word 0xdcba2d14  ! 873: STDA_I	stda	%r14, [%r8 + 0x0d14] %asi
	.word 0xccc21009  ! 874: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r6
	.word 0x8ba208a9  ! 875: FSUBs	fsubs	%f8, %f9, %f5
	.word 0xceca1009  ! 876: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r7
	.word 0x8143e011  ! 877: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x827224cc  ! 878: UDIV_I	udiv 	%r8, 0x04cc, %r1
	.word 0xc3ea2170  ! 879: PREFETCHA_I	prefetcha	[%r8, + 0x0170] %asi, #one_read
	.word 0xc81a2638  ! 880: LDD_I	ldd	[%r8 + 0x0638], %r4
	.word 0x0c800004  ! 881: BNEG	bneg  	<label_0x4>
	.word 0x885a0009  ! 883: SMUL_R	smul 	%r8, %r9, %r4
	.word 0xe0ba2878  ! 884: STDA_I	stda	%r16, [%r8 + 0x0878] %asi
	.word 0x8ba20829  ! 885: FADDs	fadds	%f8, %f9, %f5
	.word 0xf53a0009  ! 886: STDF_R	std	%f26, [%r9, %r8]
	.word 0x84722784  ! 887: UDIV_I	udiv 	%r8, 0x0784, %r2
	.word 0x86f20009  ! 888: UDIVcc_R	udivcc 	%r8, %r9, %r3
	.word 0x8e722ac0  ! 889: UDIV_I	udiv 	%r8, 0x0ac0, %r7
	.word 0xc28a1009  ! 890: LDUBA_R	lduba	[%r8, %r9] 0x80, %r1
	.word 0xfb220009  ! 891: STF_R	st	%f29, [%r9, %r8]
	.word 0xfab2263c  ! 892: STHA_I	stha	%r29, [%r8 + 0x063c] %asi
	.word 0xf60a2530  ! 893: LDUB_I	ldub	[%r8 + 0x0530], %r27
	.word 0xa2fa2b40  ! 894: SDIVcc_I	sdivcc 	%r8, 0x0b40, %r17
	.word 0xca5a20dc  ! 895: LDX_I	ldx	[%r8 + 0x00dc], %r5
	.word 0xc3ea1009  ! 896: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x886a0009  ! 897: UDIVX_R	udivx 	%r8, %r9, %r4
	.word 0xf4020009  ! 898: LDUW_R	lduw	[%r8 + %r9], %r26
	.word 0xd6d21009  ! 899: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r11
	.word 0xc8da1009  ! 900: LDXA_R	ldxa	[%r8, %r9] 0x80, %r4
	.word 0x02c20004  ! 904: BRZ	brz  ,nt	%8,<label_0x20004>
	.word 0xce7a2b80  ! 905: SWAP_I	swap	%r7, [%r8 + 0x0b80]
	.word 0x0a800008  ! 906: BCS	bcs  	<label_0x8>
	.word 0xc5220009  ! 907: STF_R	st	%f2, [%r9, %r8]
	.word 0x84f20009  ! 908: UDIVcc_R	udivcc 	%r8, %r9, %r2
	.word 0xc4ba1009  ! 909: STDA_R	stda	%r2, [%r8 + %r9] 0x80
	.word 0xcc9a254c  ! 910: LDDA_I	ldda	[%r8, + 0x054c] %asi, %r6
	.word 0xc3ea21c8  ! 911: PREFETCHA_I	prefetcha	[%r8, + 0x01c8] %asi, #one_read
	.word 0xfa520009  ! 912: LDSH_R	ldsh	[%r8 + %r9], %r29
	.word 0x8143e011  ! 913: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x8a7a2098  ! 914: SDIV_I	sdiv 	%r8, 0x0098, %r5
	.word 0xf0aa1009  ! 915: STBA_R	stba	%r24, [%r8 + %r9] 0x80
	.word 0x06ca0004  ! 917: BRLZ	brlz  ,pt	%8,<label_0xa0004>
	.word 0xf20a2e24  ! 918: LDUB_I	ldub	[%r8 + 0x0e24], %r25
	.word 0xca0a22e0  ! 920: LDUB_I	ldub	[%r8 + 0x02e0], %r5
	.word 0xce6a0009  ! 921: LDSTUB_R	ldstub	%r7, [%r8 + %r9]
	.word 0x8f6a29f0  ! 922: SDIVX_I	sdivx	%r8, 0x09f0, %r7
	.word 0xca020009  ! 923: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xc8aa1009  ! 924: STBA_R	stba	%r4, [%r8 + %r9] 0x80
	.word 0xc36a1009  ! 925: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc73a0009  ! 926: STDF_R	std	%f3, [%r9, %r8]
	.word 0xcaca2634  ! 927: LDSBA_I	ldsba	[%r8, + 0x0634] %asi, %r5
	.word 0xc4921009  ! 928: LDUHA_R	lduha	[%r8, %r9] 0x80, %r2
	.word 0x8cfa0009  ! 929: SDIVcc_R	sdivcc 	%r8, %r9, %r6
	.word 0x8143e011  ! 930: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x8143c000  ! 931: STBAR	stbar
	.word 0x896a0009  ! 934: SDIVX_R	sdivx	%r8, %r9, %r4
	.word 0x87a208a9  ! 935: FSUBs	fsubs	%f8, %f9, %f3
	.word 0x02800004  ! 936: BE	be  	<label_0x4>
	.word 0xf0d21009  ! 937: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r24
	.word 0xc4821009  ! 938: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r2
	.word 0x984a2fdc  ! 939: MULX_I	mulx 	%r8, 0x0fdc, %r12
	.word 0xa5220009  ! 940: MULScc_R	mulscc 	%r8, %r9, %r18
	.word 0xc49a1009  ! 941: LDDA_R	ldda	[%r8, %r9] 0x80, %r2
	.word 0x824a0009  ! 942: MULX_R	mulx 	%r8, %r9, %r1
	.word 0xcd3a0009  ! 943: STDF_R	std	%f6, [%r9, %r8]
	.word 0xb4d22864  ! 944: UMULcc_I	umulcc 	%r8, 0x0864, %r26
	.word 0xf6a21009  ! 945: STWA_R	stwa	%r27, [%r8 + %r9] 0x80
	.word 0xca6a0009  ! 946: LDSTUB_R	ldstub	%r5, [%r8 + %r9]
	.word 0x97a20929  ! 947: FMULs	fmuls	%f8, %f9, %f11
	.word 0xce921009  ! 948: LDUHA_R	lduha	[%r8, %r9] 0x80, %r7
	.word 0x16800004  ! 949: BGE	bge  	<label_0x4>
	.word 0xc36a21a8  ! 950: PREFETCH_I	prefetch	[%r8 + 0x01a8], #one_read
	.word 0xc2b2261c  ! 951: STHA_I	stha	%r1, [%r8 + 0x061c] %asi
	.word 0x83a20829  ! 952: FADDs	fadds	%f8, %f9, %f1
	.word 0xe0b21009  ! 953: STHA_R	stha	%r16, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 955: STBAR	stbar
	.word 0x8da20929  ! 956: FMULs	fmuls	%f8, %f9, %f6
	.word 0x9c7a0009  ! 957: SDIV_R	sdiv 	%r8, %r9, %r14
	.word 0xe9220009  ! 958: STF_R	st	%f20, [%r9, %r8]
	.word 0xc5220009  ! 959: STF_R	st	%f2, [%r9, %r8]
	.word 0x8ef20009  ! 960: UDIVcc_R	udivcc 	%r8, %r9, %r7
	.word 0xc3f21009  ! 961: CASXA_I	casxa	[%r8] 0x80, %r9, %r1
	.word 0x06800004  ! 962: BL	bl  	<label_0x4>
	.word 0xc3ea2548  ! 963: PREFETCHA_I	prefetcha	[%r8, + 0x0548] %asi, #one_read
	.word 0xce7a2470  ! 965: SWAP_I	swap	%r7, [%r8 + 0x0470]
	.word 0xe0da2c34  ! 966: LDXA_I	ldxa	[%r8, + 0x0c34] %asi, %r16
	.word 0x04ca0008  ! 967: BRLEZ	brlez  ,pt	%8,<label_0xa0008>
	.word 0xc7f21009  ! 968: CASXA_I	casxa	[%r8] 0x80, %r9, %r3
	.word 0xa0722f2c  ! 969: UDIV_I	udiv 	%r8, 0x0f2c, %r16
	.word 0xc7f21009  ! 970: CASXA_I	casxa	[%r8] 0x80, %r9, %r3
	.word 0xbd6a2338  ! 971: SDIVX_I	sdivx	%r8, 0x0338, %r30
	.word 0x8143c000  ! 972: STBAR	stbar
	.word 0x0a800004  ! 973: BCS	bcs  	<label_0x4>
	.word 0xcab21009  ! 975: STHA_R	stha	%r5, [%r8 + %r9] 0x80
	.word 0xbada0009  ! 976: SMULcc_R	smulcc 	%r8, %r9, %r29
	.word 0x87a20829  ! 977: FADDs	fadds	%f8, %f9, %f3
	.word 0x8f222524  ! 978: MULScc_I	mulscc 	%r8, 0x0524, %r7
	.word 0xf44a0009  ! 979: LDSB_R	ldsb	[%r8 + %r9], %r26
	.word 0xf2aa2bf8  ! 980: STBA_I	stba	%r25, [%r8 + 0x0bf8] %asi
	.word 0xc80a2d1c  ! 981: LDUB_I	ldub	[%r8 + 0x0d1c], %r4
	.word 0xc2821009  ! 982: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r1
	.word 0x876a0009  ! 983: SDIVX_R	sdivx	%r8, %r9, %r3
	.word 0xada209a9  ! 984: FDIVs	fdivs	%f8, %f9, %f22
	.word 0xc36a2a70  ! 985: PREFETCH_I	prefetch	[%r8 + 0x0a70], #one_read
	.word 0xcd3a2024  ! 986: STDF_I	std	%f6, [0x0024, %r8]
	.word 0x8143c000  ! 987: STBAR	stbar
	.word 0x2aca0004  ! 988: BRNZ	brnz,a,pt	%8,<label_0xa0004>
	.word 0x8e6a2464  ! 989: UDIVX_I	udivx 	%r8, 0x0464, %r7
	.word 0xe6b22314  ! 990: STHA_I	stha	%r19, [%r8 + 0x0314] %asi
	.word 0x8cd20009  ! 991: UMULcc_R	umulcc 	%r8, %r9, %r6
	.word 0xae522744  ! 992: UMUL_I	umul 	%r8, 0x0744, %r23
	.word 0x83a208a9  ! 993: FSUBs	fsubs	%f8, %f9, %f1
	.word 0xb85a2500  ! 994: SMUL_I	smul 	%r8, 0x0500, %r28
	.word 0x26c20004  ! 995: BRLZ	brlz,a,nt	%8,<label_0x20004>
	.word 0xcd3a21cc  ! 996: STDF_I	std	%f6, [0x01cc, %r8]
	.word 0x95a208a9  ! 997: FSUBs	fsubs	%f8, %f9, %f10
	.word 0xf28a2934  ! 998: LDUBA_I	lduba	[%r8, + 0x0934] %asi, %r25
	.word 0x845a2658  ! 999: SMUL_I	smul 	%r8, 0x0658, %r2
        ta      T_GOOD_TRAP

th_main_1:
        setx  MAIN_BASE_DATA_VA, %r1, %r8
        setx  0x0000000000000f40, %g1, %r9
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
        setx  0x3474e3870f113f46, %g1, %r0
        setx  0x7962e4909cb34bd1, %g1, %r1
        setx  0x068c08e021aa1b54, %g1, %r2
        setx  0xce26a444671567b8, %g1, %r3
        setx  0x9ff941a276fe547f, %g1, %r4
        setx  0x8fa3ca3b0cfa8d82, %g1, %r5
        setx  0x4ddac487ea7fb64a, %g1, %r6
        setx  0x932a83593a863aed, %g1, %r7
        setx  0xfbf35da77b571906, %g1, %r10
        setx  0x38d5b325a7343126, %g1, %r11
        setx  0xa07863441f1915fb, %g1, %r12
        setx  0x0fadce9efa86eb10, %g1, %r13
        setx  0x2524acda6e2ca5c3, %g1, %r14
        setx  0x06d54561586172fe, %g1, %r15
        setx  0xc26ec7ed3028a7e6, %g1, %r16
        setx  0xbf5d702183b4d518, %g1, %r17
        setx  0xc12ce802da3e8952, %g1, %r18
        setx  0xe4747f1c72747eed, %g1, %r19
        setx  0xaa1fed9d209c8ea2, %g1, %r20
        setx  0x4d138f7d49c50311, %g1, %r21
        setx  0xde23e906a6f227a1, %g1, %r22
        setx  0x33e8767070dbb57f, %g1, %r23
        setx  0x0687286d915c44f6, %g1, %r24
        setx  0x18fa3f5625d90017, %g1, %r25
        setx  0xa18ae2af93ea4627, %g1, %r26
        setx  0xf0c3e20fc107549c, %g1, %r27
        setx  0xd5c18a799c1b41dd, %g1, %r28
        setx  0x0372ad554cd26431, %g1, %r29
        setx  0x896aa5e1c821a67c, %g1, %r30
        setx  0x1a36e51a6c9d479b, %g1, %r31
	.word 0x06c20004  ! 5: BRLZ	brlz  ,nt	%8,<label_0x20004>
	.word 0x87a209a9  ! 6: FDIVs	fdivs	%f8, %f9, %f3
	.word 0x8143c000  ! 7: STBAR	stbar
	.word 0x8e522394  ! 8: UMUL_I	umul 	%r8, 0x0394, %r7
	.word 0xea520009  ! 9: LDSH_R	ldsh	[%r8 + %r9], %r21
	.word 0xcc9a2d80  ! 10: LDDA_I	ldda	[%r8, + 0x0d80] %asi, %r6
	.word 0xc53a0009  ! 11: STDF_R	std	%f2, [%r9, %r8]
	.word 0x2a800004  ! 12: BCS	bcs,a	<label_0x4>
	.word 0x0cc20004  ! 13: BRGZ	brgz  ,nt	%8,<label_0x20004>
	.word 0xc66a2fd8  ! 14: LDSTUB_I	ldstub	%r3, [%r8 + 0x0fd8]
	.word 0xe9220009  ! 16: STF_R	st	%f20, [%r9, %r8]
	.word 0xc4821009  ! 17: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r2
	.word 0x826a299c  ! 18: UDIVX_I	udivx 	%r8, 0x099c, %r1
	.word 0xc4ea23dc  ! 19: LDSTUBA_I	ldstuba	%r2, [%r8 + 0x03dc] %asi
	.word 0xe09a2164  ! 20: LDDA_I	ldda	[%r8, + 0x0164] %asi, %r16
	.word 0xc3ea2310  ! 21: PREFETCHA_I	prefetcha	[%r8, + 0x0310] %asi, #one_read
	.word 0xc5f22009  ! 22: CASXA_R	casxa	[%r8]%asi, %r9, %r2
	.word 0xb8d20009  ! 23: UMULcc_R	umulcc 	%r8, %r9, %r28
	.word 0x89220009  ! 24: MULScc_R	mulscc 	%r8, %r9, %r4
	.word 0xe41a2464  ! 25: LDD_I	ldd	[%r8 + 0x0464], %r18
	.word 0xbda209a9  ! 28: FDIVs	fdivs	%f8, %f9, %f30
	.word 0xd7e21009  ! 29: CASA_I	casa	[%r8] 0x80, %r9, %r11
	.word 0xc2ea1009  ! 30: LDSTUBA_R	ldstuba	%r1, [%r8 + %r9] 0x80
	.word 0xfe7a0009  ! 31: SWAP_R	swap	%r31, [%r8 + %r9]
	.word 0x8143c000  ! 32: STBAR	stbar
	.word 0x8ada0009  ! 33: SMULcc_R	smulcc 	%r8, %r9, %r5
	.word 0x9c4a0009  ! 34: MULX_R	mulx 	%r8, %r9, %r14
	.word 0xc3ea235c  ! 35: PREFETCHA_I	prefetcha	[%r8, + 0x035c] %asi, #one_read
	.word 0xd89a1009  ! 36: LDDA_R	ldda	[%r8, %r9] 0x80, %r12
	.word 0x8143e011  ! 38: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x8143c000  ! 39: STBAR	stbar
	.word 0xca8224c8  ! 40: LDUWA_I	lduwa	[%r8, + 0x04c8] %asi, %r5
	.word 0xc7e21009  ! 41: CASA_I	casa	[%r8] 0x80, %r9, %r3
	.word 0xc73a2084  ! 43: STDF_I	std	%f3, [0x0084, %r8]
	.word 0xb6fa2bcc  ! 44: SDIVcc_I	sdivcc 	%r8, 0x0bcc, %r27
	.word 0xc6520009  ! 45: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xcaea2420  ! 46: LDSTUBA_I	ldstuba	%r5, [%r8 + 0x0420] %asi
	.word 0x8143e011  ! 48: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xcff22009  ! 49: CASXA_R	casxa	[%r8]%asi, %r9, %r7
	.word 0xc6da2a94  ! 50: LDXA_I	ldxa	[%r8, + 0x0a94] %asi, %r3
	.word 0x14800004  ! 51: BG	bg  	<label_0x4>
	.word 0xc3ea2a4c  ! 52: PREFETCHA_I	prefetcha	[%r8, + 0x0a4c] %asi, #one_read
	.word 0xcff22009  ! 53: CASXA_R	casxa	[%r8]%asi, %r9, %r7
	.word 0xc4ba28bc  ! 54: STDA_I	stda	%r2, [%r8 + 0x08bc] %asi
	.word 0x8eda0009  ! 55: SMULcc_R	smulcc 	%r8, %r9, %r7
	.word 0x87a208a9  ! 56: FSUBs	fsubs	%f8, %f9, %f3
	.word 0x82da0009  ! 57: SMULcc_R	smulcc 	%r8, %r9, %r1
	.word 0xcf222bc8  ! 58: STF_I	st	%f7, [0x0bc8, %r8]
	.word 0xe8ba1009  ! 60: STDA_R	stda	%r20, [%r8 + %r9] 0x80
	.word 0xc2422cb0  ! 61: LDSW_I	ldsw	[%r8 + 0x0cb0], %r1
	.word 0xe0ba1009  ! 62: STDA_R	stda	%r16, [%r8 + %r9] 0x80
	.word 0xe0da1009  ! 63: LDXA_R	ldxa	[%r8, %r9] 0x80, %r16
	.word 0xfb2223e8  ! 64: STF_I	st	%f29, [0x03e8, %r8]
	.word 0xc8fa1009  ! 65: SWAPA_R	swapa	%r4, [%r8 + %r9] 0x80
	.word 0x40000004  ! 66: CALL	call	disp30_4
	.word 0xc8a21009  ! 67: STWA_R	stwa	%r4, [%r8 + %r9] 0x80
	.word 0xd4ca20b0  ! 68: LDSBA_I	ldsba	[%r8, + 0x00b0] %asi, %r10
	.word 0x8b6a0009  ! 69: SDIVX_R	sdivx	%r8, %r9, %r5
	.word 0xcf2224fc  ! 70: STF_I	st	%f7, [0x04fc, %r8]
	.word 0xca4a298c  ! 71: LDSB_I	ldsb	[%r8 + 0x098c], %r5
	.word 0xce4a0009  ! 72: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xe1222390  ! 73: STF_I	st	%f16, [0x0390, %r8]
	.word 0xc3ea298c  ! 74: PREFETCHA_I	prefetcha	[%r8, + 0x098c] %asi, #one_read
	.word 0x82da21b8  ! 75: SMULcc_I	smulcc 	%r8, 0x01b8, %r1
	.word 0xce7a0009  ! 76: SWAP_R	swap	%r7, [%r8 + %r9]
	.word 0x24800004  ! 78: BLE	ble,a	<label_0x4>
	.word 0x2ac20004  ! 79: BRNZ	brnz,a,nt	%8,<label_0x20004>
	.word 0x24ca0004  ! 80: BRLEZ	brlez,a,pt	%8,<label_0xa0004>
	.word 0xcada1009  ! 81: LDXA_R	ldxa	[%r8, %r9] 0x80, %r5
	.word 0xb7a20829  ! 82: FADDs	fadds	%f8, %f9, %f27
	.word 0xfa7a2d18  ! 83: SWAP_I	swap	%r29, [%r8 + 0x0d18]
	.word 0x32800004  ! 84: BNE	bne,a	<label_0x4>
	.word 0xc8b22d1c  ! 86: STHA_I	stha	%r4, [%r8 + 0x0d1c] %asi
	.word 0xa45223d8  ! 87: UMUL_I	umul 	%r8, 0x03d8, %r18
	.word 0xfef22f64  ! 88: STXA_I	stxa	%r31, [%r8 + 0x0f64] %asi
	.word 0x0aca0004  ! 89: BRNZ	brnz  ,pt	%8,<label_0xa0004>
	.word 0xe6122b60  ! 90: LDUH_I	lduh	[%r8 + 0x0b60], %r19
	.word 0xc36a26e0  ! 91: PREFETCH_I	prefetch	[%r8 + 0x06e0], #one_read
	.word 0xc4da1009  ! 92: LDXA_R	ldxa	[%r8, %r9] 0x80, %r2
	.word 0xeaca1009  ! 93: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r21
	.word 0x87a208a9  ! 94: FSUBs	fsubs	%f8, %f9, %f3
	.word 0x10800004  ! 95: BA	ba  	<label_0x4>
	.word 0x8143c000  ! 96: STBAR	stbar
	.word 0xf4ba1009  ! 97: STDA_R	stda	%r26, [%r8 + %r9] 0x80
	.word 0x3c800008  ! 98: BPOS	bpos,a	<label_0x8>
	.word 0x02c20004  ! 99: BRZ	brz  ,nt	%8,<label_0x20004>
	.word 0x8e5a2554  ! 101: SMUL_I	smul 	%r8, 0x0554, %r7
	.word 0x83a209a9  ! 102: FDIVs	fdivs	%f8, %f9, %f1
	.word 0xc85223a0  ! 103: LDSH_I	ldsh	[%r8 + 0x03a0], %r4
	.word 0x8eda203c  ! 104: SMULcc_I	smulcc 	%r8, 0x003c, %r7
	.word 0xd8f22d68  ! 105: STXA_I	stxa	%r12, [%r8 + 0x0d68] %asi
	.word 0xf26a0009  ! 106: LDSTUB_R	ldstub	%r25, [%r8 + %r9]
	.word 0x88fa0009  ! 107: SDIVcc_R	sdivcc 	%r8, %r9, %r4
	.word 0x8143c000  ! 108: STBAR	stbar
	.word 0x827221e0  ! 109: UDIV_I	udiv 	%r8, 0x01e0, %r1
	.word 0xc6a21009  ! 110: STWA_R	stwa	%r3, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 111: STBAR	stbar
	.word 0xedf21009  ! 112: CASXA_I	casxa	[%r8] 0x80, %r9, %r22
	.word 0xaba209a9  ! 113: FDIVs	fdivs	%f8, %f9, %f21
	.word 0xde522e2c  ! 114: LDSH_I	ldsh	[%r8 + 0x0e2c], %r15
	.word 0xceaa234c  ! 115: STBA_I	stba	%r7, [%r8 + 0x034c] %asi
	.word 0xca020009  ! 116: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xcca21009  ! 117: STWA_R	stwa	%r6, [%r8 + %r9] 0x80
	.word 0xc3ea20b0  ! 118: PREFETCHA_I	prefetcha	[%r8, + 0x00b0] %asi, #one_read
	.word 0x32800004  ! 119: BNE	bne,a	<label_0x4>
	.word 0x04ca0004  ! 122: BRLEZ	brlez  ,pt	%8,<label_0xa0004>
	.word 0x8143e011  ! 123: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x8143e011  ! 124: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xb9a20829  ! 126: FADDs	fadds	%f8, %f9, %f28
	.word 0xfc9a2684  ! 127: LDDA_I	ldda	[%r8, + 0x0684] %asi, %r30
	.word 0x86da0009  ! 129: SMULcc_R	smulcc 	%r8, %r9, %r3
	.word 0xcaaa263c  ! 130: STBA_I	stba	%r5, [%r8 + 0x063c] %asi
	.word 0x89222008  ! 132: MULScc_I	mulscc 	%r8, 0x0008, %r4
	.word 0x8143c000  ! 133: STBAR	stbar
	.word 0x8143c000  ! 134: STBAR	stbar
	.word 0x8143c000  ! 135: STBAR	stbar
	.word 0x845a2684  ! 136: SMUL_I	smul 	%r8, 0x0684, %r2
	.word 0x8143c000  ! 137: STBAR	stbar
	.word 0x12800004  ! 138: BNE	bne  	<label_0x4>
	.word 0x9f220009  ! 139: MULScc_R	mulscc 	%r8, %r9, %r15
	.word 0x8143c000  ! 140: STBAR	stbar
	.word 0xc4f22888  ! 141: STXA_I	stxa	%r2, [%r8 + 0x0888] %asi
	.word 0x885a0009  ! 142: SMUL_R	smul 	%r8, %r9, %r4
	.word 0xdcba2208  ! 143: STDA_I	stda	%r14, [%r8 + 0x0208] %asi
	.word 0x83a209a9  ! 144: FDIVs	fdivs	%f8, %f9, %f1
	.word 0xdbf21009  ! 145: CASXA_I	casxa	[%r8] 0x80, %r9, %r13
	.word 0xaa5a2a30  ! 146: SMUL_I	smul 	%r8, 0x0a30, %r21
	.word 0xcf2227b4  ! 147: STF_I	st	%f7, [0x07b4, %r8]
	.word 0x8143c000  ! 148: STBAR	stbar
	.word 0xc6aa1009  ! 149: STBA_R	stba	%r3, [%r8 + %r9] 0x80
	.word 0xfe0a0009  ! 150: LDUB_R	ldub	[%r8 + %r9], %r31
	.word 0xca122c58  ! 151: LDUH_I	lduh	[%r8 + 0x0c58], %r5
	.word 0x12800004  ! 152: BNE	bne  	<label_0x4>
	.word 0x06ca0008  ! 153: BRLZ	brlz  ,pt	%8,<label_0xa0008>
	.word 0xc3ea292c  ! 154: PREFETCHA_I	prefetcha	[%r8, + 0x092c] %asi, #one_read
	.word 0xb6da2b40  ! 155: SMULcc_I	smulcc 	%r8, 0x0b40, %r27
	.word 0x8143e011  ! 156: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xcca21009  ! 157: STWA_R	stwa	%r6, [%r8 + %r9] 0x80
	.word 0xdaea1009  ! 159: LDSTUBA_R	ldstuba	%r13, [%r8 + %r9] 0x80
	.word 0x824a25f8  ! 160: MULX_I	mulx 	%r8, 0x05f8, %r1
	.word 0xbe5a2a74  ! 161: SMUL_I	smul 	%r8, 0x0a74, %r31
	.word 0x86fa2388  ! 162: SDIVcc_I	sdivcc 	%r8, 0x0388, %r3
	.word 0xc4ba1009  ! 165: STDA_R	stda	%r2, [%r8 + %r9] 0x80
	.word 0xcaca1009  ! 166: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r5
	.word 0xe2ca1009  ! 167: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r17
	.word 0xccca2284  ! 168: LDSBA_I	ldsba	[%r8, + 0x0284] %asi, %r6
	.word 0x2e800004  ! 169: BVS	bvs,a	<label_0x4>
	.word 0x9cda0009  ! 170: SMULcc_R	smulcc 	%r8, %r9, %r14
	.word 0xc8122a2c  ! 171: LDUH_I	lduh	[%r8 + 0x0a2c], %r4
	.word 0x8a520009  ! 172: UMUL_R	umul 	%r8, %r9, %r5
	.word 0x84722c60  ! 173: UDIV_I	udiv 	%r8, 0x0c60, %r2
	.word 0xef3a2ba8  ! 174: STDF_I	std	%f23, [0x0ba8, %r8]
	.word 0xd93a0009  ! 175: STDF_R	std	%f12, [%r9, %r8]
	.word 0x0a800004  ! 176: BCS	bcs  	<label_0x4>
	.word 0xc36a2960  ! 177: PREFETCH_I	prefetch	[%r8 + 0x0960], #one_read
	.word 0xf8aa1009  ! 178: STBA_R	stba	%r28, [%r8 + %r9] 0x80
	.word 0x88d20009  ! 179: UMULcc_R	umulcc 	%r8, %r9, %r4
	.word 0x8da208a9  ! 180: FSUBs	fsubs	%f8, %f9, %f6
	.word 0xca522b34  ! 181: LDSH_I	ldsh	[%r8 + 0x0b34], %r5
	.word 0x8143e011  ! 182: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x2ac20008  ! 183: BRNZ	brnz,a,nt	%8,<label_0x20008>
	.word 0xc8120009  ! 184: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xdbe21009  ! 185: CASA_I	casa	[%r8] 0x80, %r9, %r13
	.word 0x95a208a9  ! 186: FSUBs	fsubs	%f8, %f9, %f10
	.word 0xeea21009  ! 187: STWA_R	stwa	%r23, [%r8 + %r9] 0x80
	.word 0x2c800004  ! 188: BNEG	bneg,a	<label_0x4>
	.word 0xbe6a2028  ! 189: UDIVX_I	udivx 	%r8, 0x0028, %r31
	.word 0xd6c222b4  ! 190: LDSWA_I	ldswa	[%r8, + 0x02b4] %asi, %r11
	.word 0xc36a2868  ! 191: PREFETCH_I	prefetch	[%r8 + 0x0868], #one_read
	.word 0xc6922e38  ! 193: LDUHA_I	lduha	[%r8, + 0x0e38] %asi, %r3
	.word 0xc8120009  ! 194: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0x8ba20929  ! 195: FMULs	fmuls	%f8, %f9, %f5
	.word 0xec1a2244  ! 196: LDD_I	ldd	[%r8 + 0x0244], %r22
	.word 0xcaf227c4  ! 197: STXA_I	stxa	%r5, [%r8 + 0x07c4] %asi
	.word 0x866a0009  ! 198: UDIVX_R	udivx 	%r8, %r9, %r3
	.word 0xc7f21009  ! 199: CASXA_I	casxa	[%r8] 0x80, %r9, %r3
	.word 0xcb222e28  ! 200: STF_I	st	%f5, [0x0e28, %r8]
	.word 0x8143c000  ! 201: STBAR	stbar
	.word 0x864a2e18  ! 202: MULX_I	mulx 	%r8, 0x0e18, %r3
	.word 0xa2d20009  ! 203: UMULcc_R	umulcc 	%r8, %r9, %r17
	.word 0xc4ca1009  ! 204: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r2
	.word 0xc44a0009  ! 205: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xc8c21009  ! 206: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r4
	.word 0xc2520009  ! 207: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xd65a0009  ! 208: LDX_R	ldx	[%r8 + %r9], %r11
	.word 0x9e720009  ! 209: UDIV_R	udiv 	%r8, %r9, %r15
	.word 0xc6120009  ! 210: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xd9f21009  ! 211: CASXA_I	casxa	[%r8] 0x80, %r9, %r12
	.word 0xc6c229d8  ! 212: LDSWA_I	ldswa	[%r8, + 0x09d8] %asi, %r3
	.word 0x8143e011  ! 213: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xe8aa1009  ! 214: STBA_R	stba	%r20, [%r8 + %r9] 0x80
	.word 0xc66a0009  ! 215: LDSTUB_R	ldstub	%r3, [%r8 + %r9]
	.word 0x32800004  ! 216: BNE	bne,a	<label_0x4>
	.word 0xcc6a264c  ! 217: LDSTUB_I	ldstub	%r6, [%r8 + 0x064c]
	.word 0x87222204  ! 218: MULScc_I	mulscc 	%r8, 0x0204, %r3
	.word 0xc3ea1009  ! 219: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc8922328  ! 220: LDUHA_I	lduha	[%r8, + 0x0328] %asi, %r4
	.word 0xfb3a2d00  ! 221: STDF_I	std	%f29, [0x0d00, %r8]
	.word 0xc8b21009  ! 223: STHA_R	stha	%r4, [%r8 + %r9] 0x80
	.word 0x2e800008  ! 225: BVS	bvs,a	<label_0x8>
	.word 0x8ef225a0  ! 226: UDIVcc_I	udivcc 	%r8, 0x05a0, %r7
	.word 0xc3f21009  ! 227: CASXA_I	casxa	[%r8] 0x80, %r9, %r1
	.word 0xb6da2264  ! 228: SMULcc_I	smulcc 	%r8, 0x0264, %r27
	.word 0xc6ca21b8  ! 229: LDSBA_I	ldsba	[%r8, + 0x01b8] %asi, %r3
	.word 0xf0da2c2c  ! 230: LDXA_I	ldxa	[%r8, + 0x0c2c] %asi, %r24
	.word 0xdf2229f0  ! 231: STF_I	st	%f15, [0x09f0, %r8]
	.word 0xce8a226c  ! 232: LDUBA_I	lduba	[%r8, + 0x026c] %asi, %r7
	.word 0xc5220009  ! 233: STF_R	st	%f2, [%r9, %r8]
	.word 0x24c20004  ! 234: BRLEZ	brlez,a,nt	%8,<label_0x20004>
	.word 0x9a6a0009  ! 235: UDIVX_R	udivx 	%r8, %r9, %r13
	.word 0x947a0009  ! 236: SDIV_R	sdiv 	%r8, %r9, %r10
	.word 0x1c800008  ! 237: BPOS	bpos  	<label_0x8>
	.word 0xdaf22964  ! 238: STXA_I	stxa	%r13, [%r8 + 0x0964] %asi
	.word 0xc8a22abc  ! 239: STWA_I	stwa	%r4, [%r8 + 0x0abc] %asi
	.word 0x0e800008  ! 240: BVS	bvs  	<label_0x8>
	.word 0xc2ea2d5c  ! 241: LDSTUBA_I	ldstuba	%r1, [%r8 + 0x0d5c] %asi
	.word 0xcc7a232c  ! 242: SWAP_I	swap	%r6, [%r8 + 0x032c]
	.word 0xc3ea2aac  ! 243: PREFETCHA_I	prefetcha	[%r8, + 0x0aac] %asi, #one_read
	.word 0xc26a0009  ! 244: LDSTUB_R	ldstub	%r1, [%r8 + %r9]
	.word 0x876a20ac  ! 245: SDIVX_I	sdivx	%r8, 0x00ac, %r3
	.word 0xbe5229b0  ! 246: UMUL_I	umul 	%r8, 0x09b0, %r31
	.word 0x3c800004  ! 247: BPOS	bpos,a	<label_0x4>
	.word 0x2c800004  ! 248: BNEG	bneg,a	<label_0x4>
	.word 0xcc0a0009  ! 249: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0x8143c000  ! 250: STBAR	stbar
	.word 0xec1a0009  ! 251: LDD_R	ldd	[%r8 + %r9], %r22
	.word 0xd87a25c0  ! 252: SWAP_I	swap	%r12, [%r8 + 0x05c0]
	.word 0xecf229c4  ! 253: STXA_I	stxa	%r22, [%r8 + 0x09c4] %asi
	.word 0xc8520009  ! 254: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0x8143c000  ! 255: STBAR	stbar
	.word 0x0e800008  ! 256: BVS	bvs  	<label_0x8>
	.word 0x824a2e8c  ! 257: MULX_I	mulx 	%r8, 0x0e8c, %r1
	.word 0xed220009  ! 258: STF_R	st	%f22, [%r9, %r8]
	.word 0xcf222a48  ! 259: STF_I	st	%f7, [0x0a48, %r8]
	.word 0xc3ea1009  ! 260: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xecba22a4  ! 261: STDA_I	stda	%r22, [%r8 + 0x02a4] %asi
	.word 0x836a231c  ! 263: SDIVX_I	sdivx	%r8, 0x031c, %r1
	.word 0xceaa2580  ! 264: STBA_I	stba	%r7, [%r8 + 0x0580] %asi
	.word 0xc7e21009  ! 265: CASA_I	casa	[%r8] 0x80, %r9, %r3
	.word 0xc5222928  ! 267: STF_I	st	%f2, [0x0928, %r8]
	.word 0xc2120009  ! 268: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0x8ba209a9  ! 269: FDIVs	fdivs	%f8, %f9, %f5
	.word 0x89220009  ! 270: MULScc_R	mulscc 	%r8, %r9, %r4
	.word 0xf84a0009  ! 271: LDSB_R	ldsb	[%r8 + %r9], %r28
	.word 0x8143c000  ! 272: STBAR	stbar
	.word 0x3a800004  ! 273: BCC	bcc,a	<label_0x4>
	.word 0xab220009  ! 274: MULScc_R	mulscc 	%r8, %r9, %r21
	.word 0xc36a2de8  ! 275: PREFETCH_I	prefetch	[%r8 + 0x0de8], #one_read
	.word 0x8143c000  ! 276: STBAR	stbar
	.word 0xc8921009  ! 277: LDUHA_R	lduha	[%r8, %r9] 0x80, %r4
	.word 0x82722188  ! 278: UDIV_I	udiv 	%r8, 0x0188, %r1
	.word 0xcc8a29f0  ! 280: LDUBA_I	lduba	[%r8, + 0x09f0] %asi, %r6
	.word 0x8a522910  ! 281: UMUL_I	umul 	%r8, 0x0910, %r5
	.word 0x8143c000  ! 282: STBAR	stbar
	.word 0x8143e011  ! 283: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xf86a23b8  ! 284: LDSTUB_I	ldstub	%r28, [%r8 + 0x03b8]
	.word 0x8143e011  ! 285: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x8143e011  ! 286: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x2c800008  ! 287: BNEG	bneg,a	<label_0x8>
	.word 0x36800004  ! 288: BGE	bge,a	<label_0x4>
	.word 0x8143e011  ! 289: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x8c6a0009  ! 290: UDIVX_R	udivx 	%r8, %r9, %r6
	.word 0xccfa1009  ! 291: SWAPA_R	swapa	%r6, [%r8 + %r9] 0x80
	.word 0xf0aa1009  ! 292: STBA_R	stba	%r24, [%r8 + %r9] 0x80
	.word 0xa6722a9c  ! 293: UDIV_I	udiv 	%r8, 0x0a9c, %r19
	.word 0xc36a2d2c  ! 294: PREFETCH_I	prefetch	[%r8 + 0x0d2c], #one_read
	.word 0xceb21009  ! 295: STHA_R	stha	%r7, [%r8 + %r9] 0x80
	.word 0xf73a21dc  ! 296: STDF_I	std	%f27, [0x01dc, %r8]
	.word 0xecfa2f04  ! 297: SWAPA_I	swapa	%r22, [%r8 + 0x0f04] %asi
	.word 0xccda21f0  ! 298: LDXA_I	ldxa	[%r8, + 0x01f0] %asi, %r6
	.word 0xf81a29ac  ! 299: LDD_I	ldd	[%r8 + 0x09ac], %r28
	.word 0x8a722ca0  ! 301: UDIV_I	udiv 	%r8, 0x0ca0, %r5
	.word 0xc4c22c14  ! 302: LDSWA_I	ldswa	[%r8, + 0x0c14] %asi, %r2
	.word 0xc3220009  ! 303: STF_R	st	%f1, [%r9, %r8]
	.word 0x845a0009  ! 304: SMUL_R	smul 	%r8, %r9, %r2
	.word 0x1a800008  ! 305: BCC	bcc  	<label_0x8>
	.word 0xc8522e18  ! 306: LDSH_I	ldsh	[%r8 + 0x0e18], %r4
	.word 0x8143e011  ! 307: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xc2ea1009  ! 308: LDSTUBA_R	ldstuba	%r1, [%r8 + %r9] 0x80
	.word 0x856a0009  ! 309: SDIVX_R	sdivx	%r8, %r9, %r2
	.word 0xc66a0009  ! 310: LDSTUB_R	ldstub	%r3, [%r8 + %r9]
	.word 0xf4f21009  ! 311: STXA_R	stxa	%r26, [%r8 + %r9] 0x80
	.word 0x04800004  ! 312: BLE	ble  	<label_0x4>
	.word 0xcd3a0009  ! 313: STDF_R	std	%f6, [%r9, %r8]
	.word 0x00800004  ! 314: BN	bn  	<label_0x4>
	.word 0x94fa2128  ! 315: SDIVcc_I	sdivcc 	%r8, 0x0128, %r10
	.word 0xd7e21009  ! 316: CASA_I	casa	[%r8] 0x80, %r9, %r11
	.word 0xfd3a0009  ! 317: STDF_R	std	%f30, [%r9, %r8]
	.word 0x1e800008  ! 318: BVC	bvc  	<label_0x8>
	.word 0x85a208a9  ! 319: FSUBs	fsubs	%f8, %f9, %f2
	.word 0xc4a21009  ! 320: STWA_R	stwa	%r2, [%r8 + %r9] 0x80
	.word 0xc25a0009  ! 321: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xf2022088  ! 322: LDUW_I	lduw	[%r8 + 0x0088], %r25
	.word 0x30800004  ! 323: BA	ba,a	<label_0x4>
	.word 0xc3ea2290  ! 324: PREFETCHA_I	prefetcha	[%r8, + 0x0290] %asi, #one_read
	.word 0xde921009  ! 326: LDUHA_R	lduha	[%r8, %r9] 0x80, %r15
	.word 0x8143e011  ! 328: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xc6c21009  ! 329: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r3
	.word 0xcf222170  ! 330: STF_I	st	%f7, [0x0170, %r8]
	.word 0xc8122774  ! 331: LDUH_I	lduh	[%r8 + 0x0774], %r4
	.word 0xfaca21b4  ! 332: LDSBA_I	ldsba	[%r8, + 0x01b4] %asi, %r29
	.word 0x02ca0004  ! 333: BRZ	brz  ,pt	%8,<label_0xa0004>
	.word 0xf5e21009  ! 334: CASA_I	casa	[%r8] 0x80, %r9, %r26
	.word 0xc5f21009  ! 335: CASXA_I	casxa	[%r8] 0x80, %r9, %r2
	.word 0x8143c000  ! 336: STBAR	stbar
	.word 0x84d22428  ! 337: UMULcc_I	umulcc 	%r8, 0x0428, %r2
	.word 0xce520009  ! 338: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0x0aca0004  ! 339: BRNZ	brnz  ,pt	%8,<label_0xa0004>
	.word 0xcfe22009  ! 340: CASA_R	casa	[%r8] %asi, %r9, %r7
	.word 0x2ac20004  ! 341: BRNZ	brnz,a,nt	%8,<label_0x20004>
	.word 0x89a20929  ! 342: FMULs	fmuls	%f8, %f9, %f4
	.word 0x8143e011  ! 343: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xc3220009  ! 344: STF_R	st	%f1, [%r9, %r8]
	.word 0x06800008  ! 345: BL	bl  	<label_0x8>
	.word 0xe0ba29ac  ! 346: STDA_I	stda	%r16, [%r8 + 0x09ac] %asi
	.word 0xc36a1009  ! 347: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xd6da1009  ! 348: LDXA_R	ldxa	[%r8, %r9] 0x80, %r11
	.word 0xc5220009  ! 350: STF_R	st	%f2, [%r9, %r8]
	.word 0x82f22db0  ! 352: UDIVcc_I	udivcc 	%r8, 0x0db0, %r1
	.word 0xc4f22130  ! 353: STXA_I	stxa	%r2, [%r8 + 0x0130] %asi
	.word 0x8e720009  ! 354: UDIV_R	udiv 	%r8, %r9, %r7
	.word 0x82f20009  ! 355: UDIVcc_R	udivcc 	%r8, %r9, %r1
	.word 0xe4fa1009  ! 356: SWAPA_R	swapa	%r18, [%r8 + %r9] 0x80
	.word 0xdd3a0009  ! 357: STDF_R	std	%f14, [%r9, %r8]
	.word 0x2eca0008  ! 358: BRGEZ	brgez,a,pt	%8,<label_0xa0008>
	.word 0xdaaa1009  ! 359: STBA_R	stba	%r13, [%r8 + %r9] 0x80
	.word 0xa84a0009  ! 360: MULX_R	mulx 	%r8, %r9, %r20
	.word 0xc4a222cc  ! 361: STWA_I	stwa	%r2, [%r8 + 0x02cc] %asi
	.word 0xcff22009  ! 362: CASXA_R	casxa	[%r8]%asi, %r9, %r7
	.word 0xd8c22644  ! 363: LDSWA_I	ldswa	[%r8, + 0x0644] %asi, %r12
	.word 0x8143e011  ! 364: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xc9222a04  ! 365: STF_I	st	%f4, [0x0a04, %r8]
	.word 0x88520009  ! 366: UMUL_R	umul 	%r8, %r9, %r4
	.word 0xacf2218c  ! 367: UDIVcc_I	udivcc 	%r8, 0x018c, %r22
	.word 0xcaa21009  ! 368: STWA_R	stwa	%r5, [%r8 + %r9] 0x80
	.word 0xc4ba1009  ! 369: STDA_R	stda	%r2, [%r8 + %r9] 0x80
	.word 0x865a0009  ! 370: SMUL_R	smul 	%r8, %r9, %r3
	.word 0x8a5a24c8  ! 371: SMUL_I	smul 	%r8, 0x04c8, %r5
	.word 0x8143c000  ! 372: STBAR	stbar
	.word 0x8143e011  ! 373: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xcc4a2bd8  ! 374: LDSB_I	ldsb	[%r8 + 0x0bd8], %r6
	.word 0xb4da27c4  ! 375: SMULcc_I	smulcc 	%r8, 0x07c4, %r26
	.word 0xceda250c  ! 376: LDXA_I	ldxa	[%r8, + 0x050c] %asi, %r7
	.word 0x8cda26f8  ! 377: SMULcc_I	smulcc 	%r8, 0x06f8, %r6
	.word 0x866a0009  ! 378: UDIVX_R	udivx 	%r8, %r9, %r3
	.word 0x9cf20009  ! 379: UDIVcc_R	udivcc 	%r8, %r9, %r14
	.word 0xe66a25fc  ! 380: LDSTUB_I	ldstub	%r19, [%r8 + 0x05fc]
	.word 0xc36a2c38  ! 381: PREFETCH_I	prefetch	[%r8 + 0x0c38], #one_read
	.word 0xb3a20829  ! 383: FADDs	fadds	%f8, %f9, %f25
	.word 0xcaca1009  ! 384: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r5
	.word 0xc6ca2e34  ! 385: LDSBA_I	ldsba	[%r8, + 0x0e34] %asi, %r3
	.word 0x8143e011  ! 386: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xced226e0  ! 387: LDSHA_I	ldsha	[%r8, + 0x06e0] %asi, %r7
	.word 0x8143c000  ! 388: STBAR	stbar
	.word 0x2cc20008  ! 389: BRGZ	brgz,a,nt	%8,<label_0x20008>
	.word 0x2eca0004  ! 392: BRGEZ	brgez,a,pt	%8,<label_0xa0004>
	.word 0x8e5a0009  ! 393: SMUL_R	smul 	%r8, %r9, %r7
	.word 0x8143c000  ! 394: STBAR	stbar
	.word 0xe0ba2808  ! 395: STDA_I	stda	%r16, [%r8 + 0x0808] %asi
	.word 0xede21009  ! 396: CASA_I	casa	[%r8] 0x80, %r9, %r22
	.word 0xc8c221f8  ! 397: LDSWA_I	ldswa	[%r8, + 0x01f8] %asi, %r4
	.word 0x28800004  ! 398: BLEU	bleu,a	<label_0x4>
	.word 0xc6fa25d4  ! 399: SWAPA_I	swapa	%r3, [%r8 + 0x05d4] %asi
	.word 0xc8a22fa4  ! 400: STWA_I	stwa	%r4, [%r8 + 0x0fa4] %asi
	.word 0xc4aa2318  ! 401: STBA_I	stba	%r2, [%r8 + 0x0318] %asi
	.word 0x8143e011  ! 402: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xcab21009  ! 403: STHA_R	stha	%r5, [%r8 + %r9] 0x80
	.word 0xcff21009  ! 404: CASXA_I	casxa	[%r8] 0x80, %r9, %r7
	.word 0x86da29d8  ! 405: SMULcc_I	smulcc 	%r8, 0x09d8, %r3
	.word 0x36800004  ! 406: BGE	bge,a	<label_0x4>
	.word 0x866a22f0  ! 407: UDIVX_I	udivx 	%r8, 0x02f0, %r3
	.word 0xc89a22a4  ! 408: LDDA_I	ldda	[%r8, + 0x02a4] %asi, %r4
	.word 0x86fa2028  ! 409: SDIVcc_I	sdivcc 	%r8, 0x0028, %r3
	.word 0xc44a0009  ! 410: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xc4c21009  ! 411: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r2
	.word 0x8c7a2fa4  ! 412: SDIV_I	sdiv 	%r8, 0x0fa4, %r6
	.word 0xafa209a9  ! 413: FDIVs	fdivs	%f8, %f9, %f23
	.word 0xd4f22bf8  ! 414: STXA_I	stxa	%r10, [%r8 + 0x0bf8] %asi
	.word 0x87a20829  ! 415: FADDs	fadds	%f8, %f9, %f3
	.word 0xc6922460  ! 416: LDUHA_I	lduha	[%r8, + 0x0460] %asi, %r3
	.word 0xf6da27c0  ! 417: LDXA_I	ldxa	[%r8, + 0x07c0] %asi, %r27
	.word 0x8143c000  ! 418: STBAR	stbar
	.word 0x8143c000  ! 419: STBAR	stbar
	.word 0x846a2ae0  ! 420: UDIVX_I	udivx 	%r8, 0x0ae0, %r2
	.word 0xf66a0009  ! 421: LDSTUB_R	ldstub	%r27, [%r8 + %r9]
	.word 0x8fa209a9  ! 422: FDIVs	fdivs	%f8, %f9, %f7
	.word 0x8ef20009  ! 423: UDIVcc_R	udivcc 	%r8, %r9, %r7
	.word 0xc26a22c0  ! 424: LDSTUB_I	ldstub	%r1, [%r8 + 0x02c0]
	.word 0xf64a2e00  ! 425: LDSB_I	ldsb	[%r8 + 0x0e00], %r27
	.word 0xeaa22a0c  ! 426: STWA_I	stwa	%r21, [%r8 + 0x0a0c] %asi
	.word 0x8143e011  ! 427: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xeefa1009  ! 428: SWAPA_R	swapa	%r23, [%r8 + %r9] 0x80
	.word 0xf13a0009  ! 429: STDF_R	std	%f24, [%r9, %r8]
	.word 0x8143c000  ! 430: STBAR	stbar
	.word 0xdcca1009  ! 431: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r14
	.word 0x26c20008  ! 432: BRLZ	brlz,a,nt	%8,<label_0x20008>
	.word 0xa0720009  ! 433: UDIV_R	udiv 	%r8, %r9, %r16
	.word 0xccb22128  ! 434: STHA_I	stha	%r6, [%r8 + 0x0128] %asi
	.word 0xb44a24cc  ! 435: MULX_I	mulx 	%r8, 0x04cc, %r26
	.word 0x82da20e4  ! 436: SMULcc_I	smulcc 	%r8, 0x00e4, %r1
	.word 0xc3ea1009  ! 437: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xf6c22a64  ! 438: LDSWA_I	ldswa	[%r8, + 0x0a64] %asi, %r27
	.word 0xc8ca26d0  ! 439: LDSBA_I	ldsba	[%r8, + 0x06d0] %asi, %r4
	.word 0x8143e011  ! 440: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x8143c000  ! 441: STBAR	stbar
	.word 0x9ada0009  ! 442: SMULcc_R	smulcc 	%r8, %r9, %r13
	.word 0xc25a2c14  ! 443: LDX_I	ldx	[%r8 + 0x0c14], %r1
	.word 0xa3a209a9  ! 444: FDIVs	fdivs	%f8, %f9, %f17
	.word 0x16800008  ! 445: BGE	bge  	<label_0x8>
	.word 0x40000004  ! 446: CALL	call	disp30_4
	.word 0xc9220009  ! 447: STF_R	st	%f4, [%r9, %r8]
	.word 0xc4921009  ! 448: LDUHA_R	lduha	[%r8, %r9] 0x80, %r2
	.word 0x8cf20009  ! 449: UDIVcc_R	udivcc 	%r8, %r9, %r6
	.word 0xc6122528  ! 450: LDUH_I	lduh	[%r8 + 0x0528], %r3
	.word 0xc36a1009  ! 451: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xb2f20009  ! 452: UDIVcc_R	udivcc 	%r8, %r9, %r25
	.word 0xe4c21009  ! 453: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r18
	.word 0x8143e011  ! 454: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xfe7a0009  ! 455: SWAP_R	swap	%r31, [%r8 + %r9]
	.word 0xc7222b90  ! 456: STF_I	st	%f3, [0x0b90, %r8]
	.word 0x8afa2350  ! 457: SDIVcc_I	sdivcc 	%r8, 0x0350, %r5
	.word 0x8da209a9  ! 458: FDIVs	fdivs	%f8, %f9, %f6
	.word 0xbcda2388  ! 459: SMULcc_I	smulcc 	%r8, 0x0388, %r30
	.word 0xc4b22f54  ! 460: STHA_I	stha	%r2, [%r8 + 0x0f54] %asi
	.word 0xc8ca2d80  ! 461: LDSBA_I	ldsba	[%r8, + 0x0d80] %asi, %r4
	.word 0xcec21009  ! 462: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r7
	.word 0x8da208a9  ! 463: FSUBs	fsubs	%f8, %f9, %f6
	.word 0xccb21009  ! 464: STHA_R	stha	%r6, [%r8 + %r9] 0x80
	.word 0x89a209a9  ! 465: FDIVs	fdivs	%f8, %f9, %f4
	.word 0xc36a27a8  ! 466: PREFETCH_I	prefetch	[%r8 + 0x07a8], #one_read
	.word 0xc8022180  ! 467: LDUW_I	lduw	[%r8 + 0x0180], %r4
	.word 0xbfa209a9  ! 468: FDIVs	fdivs	%f8, %f9, %f31
	.word 0xf66a0009  ! 469: LDSTUB_R	ldstub	%r27, [%r8 + %r9]
	.word 0xce6a0009  ! 470: LDSTUB_R	ldstub	%r7, [%r8 + %r9]
	.word 0x98722c10  ! 471: UDIV_I	udiv 	%r8, 0x0c10, %r12
	.word 0xedf22009  ! 472: CASXA_R	casxa	[%r8]%asi, %r9, %r22
	.word 0xb8720009  ! 473: UDIV_R	udiv 	%r8, %r9, %r28
	.word 0xce822310  ! 474: LDUWA_I	lduwa	[%r8, + 0x0310] %asi, %r7
	.word 0xc8a22bec  ! 475: STWA_I	stwa	%r4, [%r8 + 0x0bec] %asi
	.word 0xcefa2dac  ! 476: SWAPA_I	swapa	%r7, [%r8 + 0x0dac] %asi
	.word 0xc6ca2968  ! 477: LDSBA_I	ldsba	[%r8, + 0x0968] %asi, %r3
	.word 0x40000008  ! 478: CALL	call	disp30_8
	.word 0xd7f21009  ! 479: CASXA_I	casxa	[%r8] 0x80, %r9, %r11
	.word 0xca7a28b0  ! 480: SWAP_I	swap	%r5, [%r8 + 0x08b0]
	.word 0xfcca2b34  ! 481: LDSBA_I	ldsba	[%r8, + 0x0b34] %asi, %r30
	.word 0xd60a0009  ! 482: LDUB_R	ldub	[%r8 + %r9], %r11
	.word 0xc3ea2364  ! 483: PREFETCHA_I	prefetcha	[%r8, + 0x0364] %asi, #one_read
	.word 0xc8d221d8  ! 484: LDSHA_I	ldsha	[%r8, + 0x01d8] %asi, %r4
	.word 0x884a26d0  ! 485: MULX_I	mulx 	%r8, 0x06d0, %r4
	.word 0xc6f221b8  ! 487: STXA_I	stxa	%r3, [%r8 + 0x01b8] %asi
	.word 0x08800004  ! 488: BLEU	bleu  	<label_0x4>
	.word 0x8143e011  ! 489: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x40000004  ! 490: CALL	call	disp30_4
	.word 0xc3222298  ! 492: STF_I	st	%f1, [0x0298, %r8]
	.word 0x26ca0008  ! 493: BRLZ	brlz,a,pt	%8,<label_0xa0008>
	.word 0x22800004  ! 494: BE	be,a	<label_0x4>
	.word 0xc81a0009  ! 495: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xc4422ec4  ! 496: LDSW_I	ldsw	[%r8 + 0x0ec4], %r2
	.word 0xc80a2788  ! 497: LDUB_I	ldub	[%r8 + 0x0788], %r4
	.word 0xf0f21009  ! 498: STXA_R	stxa	%r24, [%r8 + %r9] 0x80
	.word 0xe4ca1009  ! 499: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r18
	.word 0xcdf21009  ! 500: CASXA_I	casxa	[%r8] 0x80, %r9, %r6
	.word 0xc7222cd8  ! 501: STF_I	st	%f3, [0x0cd8, %r8]
	.word 0xdeaa1009  ! 502: STBA_R	stba	%r15, [%r8 + %r9] 0x80
	.word 0x8143e011  ! 503: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xc4fa2ac8  ! 504: SWAPA_I	swapa	%r2, [%r8 + 0x0ac8] %asi
	.word 0x1c800008  ! 505: BPOS	bpos  	<label_0x8>
	.word 0xd5f21009  ! 506: CASXA_I	casxa	[%r8] 0x80, %r9, %r10
	.word 0xde020009  ! 507: LDUW_R	lduw	[%r8 + %r9], %r15
	.word 0x2cc20004  ! 508: BRGZ	brgz,a,nt	%8,<label_0x20004>
	.word 0x3a800004  ! 509: BCC	bcc,a	<label_0x4>
	.word 0xc36a2238  ! 510: PREFETCH_I	prefetch	[%r8 + 0x0238], #one_read
	.word 0x8ef22c98  ! 511: UDIVcc_I	udivcc 	%r8, 0x0c98, %r7
	.word 0xd65a0009  ! 512: LDX_R	ldx	[%r8 + %r9], %r11
	.word 0xc20a2ac8  ! 513: LDUB_I	ldub	[%r8 + 0x0ac8], %r1
	.word 0x88da23e8  ! 514: SMULcc_I	smulcc 	%r8, 0x03e8, %r4
	.word 0xeada2f54  ! 515: LDXA_I	ldxa	[%r8, + 0x0f54] %asi, %r21
	.word 0x8e520009  ! 516: UMUL_R	umul 	%r8, %r9, %r7
	.word 0x8fa20829  ! 518: FADDs	fadds	%f8, %f9, %f7
	.word 0xfaa22780  ! 519: STWA_I	stwa	%r29, [%r8 + 0x0780] %asi
	.word 0x8143e011  ! 520: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x8143c000  ! 521: STBAR	stbar
	.word 0x8143c000  ! 523: STBAR	stbar
	.word 0xc9220009  ! 524: STF_R	st	%f4, [%r9, %r8]
	.word 0xc36a1009  ! 525: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc2aa237c  ! 526: STBA_I	stba	%r1, [%r8 + 0x037c] %asi
	.word 0xbc6a2260  ! 527: UDIVX_I	udivx 	%r8, 0x0260, %r30
	.word 0x865a0009  ! 528: SMUL_R	smul 	%r8, %r9, %r3
	.word 0x8143e011  ! 529: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x827a0009  ! 530: SDIV_R	sdiv 	%r8, %r9, %r1
	.word 0xf8fa1009  ! 532: SWAPA_R	swapa	%r28, [%r8 + %r9] 0x80
	.word 0x8143e011  ! 533: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xc6520009  ! 534: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xf0520009  ! 535: LDSH_R	ldsh	[%r8 + %r9], %r24
	.word 0xc89a2588  ! 536: LDDA_I	ldda	[%r8, + 0x0588] %asi, %r4
	.word 0x08800004  ! 537: BLEU	bleu  	<label_0x4>
	.word 0x82720009  ! 538: UDIV_R	udiv 	%r8, %r9, %r1
	.word 0xc3ea24b8  ! 539: PREFETCHA_I	prefetcha	[%r8, + 0x04b8] %asi, #one_read
	.word 0xc24a265c  ! 540: LDSB_I	ldsb	[%r8 + 0x065c], %r1
	.word 0xcc122ed8  ! 541: LDUH_I	lduh	[%r8 + 0x0ed8], %r6
	.word 0xc28a28a8  ! 542: LDUBA_I	lduba	[%r8, + 0x08a8] %asi, %r1
	.word 0x8143e011  ! 543: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xe66a2984  ! 544: LDSTUB_I	ldstub	%r19, [%r8 + 0x0984]
	.word 0xf89a1009  ! 545: LDDA_R	ldda	[%r8, %r9] 0x80, %r28
	.word 0x8143e011  ! 546: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xcc6a2300  ! 547: LDSTUB_I	ldstub	%r6, [%r8 + 0x0300]
	.word 0xdc9a2480  ! 548: LDDA_I	ldda	[%r8, + 0x0480] %asi, %r14
	.word 0x8ad22090  ! 549: UMULcc_I	umulcc 	%r8, 0x0090, %r5
	.word 0x8143c000  ! 550: STBAR	stbar
	.word 0xc36a2a4c  ! 551: PREFETCH_I	prefetch	[%r8 + 0x0a4c], #one_read
	.word 0x8ada2194  ! 552: SMULcc_I	smulcc 	%r8, 0x0194, %r5
	.word 0xcde22009  ! 553: CASA_R	casa	[%r8] %asi, %r9, %r6
	.word 0xe4b21009  ! 554: STHA_R	stha	%r18, [%r8 + %r9] 0x80
	.word 0xaa720009  ! 555: UDIV_R	udiv 	%r8, %r9, %r21
	.word 0xce922c9c  ! 558: LDUHA_I	lduha	[%r8, + 0x0c9c] %asi, %r7
	.word 0x836a0009  ! 559: SDIVX_R	sdivx	%r8, %r9, %r1
	.word 0xc6a21009  ! 560: STWA_R	stwa	%r3, [%r8 + %r9] 0x80
	.word 0xc4a22ca8  ! 561: STWA_I	stwa	%r2, [%r8 + 0x0ca8] %asi
	.word 0x8ada23c8  ! 562: SMULcc_I	smulcc 	%r8, 0x03c8, %r5
	.word 0xc46a2ef8  ! 563: LDSTUB_I	ldstub	%r2, [%r8 + 0x0ef8]
	.word 0x02800004  ! 564: BE	be  	<label_0x4>
	.word 0xc3ea1009  ! 565: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc6fa2c58  ! 566: SWAPA_I	swapa	%r3, [%r8 + 0x0c58] %asi
	.word 0xcbe21009  ! 568: CASA_I	casa	[%r8] 0x80, %r9, %r5
	.word 0xc6520009  ! 569: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xe8a22aac  ! 570: STWA_I	stwa	%r20, [%r8 + 0x0aac] %asi
	.word 0xc87a0009  ! 571: SWAP_R	swap	%r4, [%r8 + %r9]
	.word 0xcd3a2848  ! 572: STDF_I	std	%f6, [0x0848, %r8]
	.word 0xf0fa1009  ! 573: SWAPA_R	swapa	%r24, [%r8 + %r9] 0x80
	.word 0xba7a0009  ! 574: SDIV_R	sdiv 	%r8, %r9, %r29
	.word 0x8143c000  ! 575: STBAR	stbar
	.word 0xc33a2820  ! 576: STDF_I	std	%f1, [0x0820, %r8]
	.word 0xce0a0009  ! 578: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xe25a28e8  ! 579: LDX_I	ldx	[%r8 + 0x08e8], %r17
	.word 0x8cd20009  ! 580: UMULcc_R	umulcc 	%r8, %r9, %r6
	.word 0xc3f21009  ! 581: CASXA_I	casxa	[%r8] 0x80, %r9, %r1
	.word 0x8143c000  ! 582: STBAR	stbar
	.word 0xf0a22030  ! 583: STWA_I	stwa	%r24, [%r8 + 0x0030] %asi
	.word 0xc3ea21e8  ! 584: PREFETCHA_I	prefetcha	[%r8, + 0x01e8] %asi, #one_read
	.word 0xcc7a2610  ! 585: SWAP_I	swap	%r6, [%r8 + 0x0610]
	.word 0xfad2245c  ! 586: LDSHA_I	ldsha	[%r8, + 0x045c] %asi, %r29
	.word 0x8143c000  ! 587: STBAR	stbar
	.word 0x87a209a9  ! 588: FDIVs	fdivs	%f8, %f9, %f3
	.word 0xe8b21009  ! 589: STHA_R	stha	%r20, [%r8 + %r9] 0x80
	.word 0xce020009  ! 590: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0x956a2a90  ! 591: SDIVX_I	sdivx	%r8, 0x0a90, %r10
	.word 0x847a0009  ! 592: SDIV_R	sdiv 	%r8, %r9, %r2
	.word 0xdbf21009  ! 593: CASXA_I	casxa	[%r8] 0x80, %r9, %r13
	.word 0x8143c000  ! 594: STBAR	stbar
	.word 0x94f20009  ! 595: UDIVcc_R	udivcc 	%r8, %r9, %r10
	.word 0xc6fa2884  ! 596: SWAPA_I	swapa	%r3, [%r8 + 0x0884] %asi
	.word 0xf4a2229c  ! 597: STWA_I	stwa	%r26, [%r8 + 0x029c] %asi
	.word 0xc68a2d10  ! 598: LDUBA_I	lduba	[%r8, + 0x0d10] %asi, %r3
	.word 0xc9f21009  ! 599: CASXA_I	casxa	[%r8] 0x80, %r9, %r4
	.word 0x86522214  ! 600: UMUL_I	umul 	%r8, 0x0214, %r3
	.word 0x87220009  ! 601: MULScc_R	mulscc 	%r8, %r9, %r3
	.word 0xc3220009  ! 602: STF_R	st	%f1, [%r9, %r8]
	.word 0xf4d21009  ! 603: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r26
	.word 0x0cca0004  ! 604: BRGZ	brgz  ,pt	%8,<label_0xa0004>
	.word 0x886a26b8  ! 605: UDIVX_I	udivx 	%r8, 0x06b8, %r4
	.word 0x8143e011  ! 606: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x8fa20929  ! 607: FMULs	fmuls	%f8, %f9, %f7
	.word 0xc4d22664  ! 608: LDSHA_I	ldsha	[%r8, + 0x0664] %asi, %r2
	.word 0x40000008  ! 609: CALL	call	disp30_8
	.word 0x8ef22618  ! 610: UDIVcc_I	udivcc 	%r8, 0x0618, %r7
	.word 0xc40a0009  ! 611: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xe8ca1009  ! 612: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r20
	.word 0x8143e011  ! 613: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x24800004  ! 614: BLE	ble,a	<label_0x4>
	.word 0xc4020009  ! 615: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0x82d222fc  ! 616: UMULcc_I	umulcc 	%r8, 0x02fc, %r1
	.word 0xc36a2d64  ! 617: PREFETCH_I	prefetch	[%r8 + 0x0d64], #one_read
	.word 0x8143e011  ! 620: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xc4da1009  ! 621: LDXA_R	ldxa	[%r8, %r9] 0x80, %r2
	.word 0x9da208a9  ! 622: FSUBs	fsubs	%f8, %f9, %f14
	.word 0xc4a21009  ! 623: STWA_R	stwa	%r2, [%r8 + %r9] 0x80
	.word 0xc6a21009  ! 624: STWA_R	stwa	%r3, [%r8 + %r9] 0x80
	.word 0xc4ea2598  ! 625: LDSTUBA_I	ldstuba	%r2, [%r8 + 0x0598] %asi
	.word 0xc2422428  ! 626: LDSW_I	ldsw	[%r8 + 0x0428], %r1
	.word 0x26800004  ! 627: BL	bl,a	<label_0x4>
	.word 0xfc1a2cd0  ! 629: LDD_I	ldd	[%r8 + 0x0cd0], %r30
	.word 0x8143c000  ! 630: STBAR	stbar
	.word 0x8143c000  ! 631: STBAR	stbar
	.word 0xc3ea2960  ! 632: PREFETCHA_I	prefetcha	[%r8, + 0x0960] %asi, #one_read
	.word 0xcde22009  ! 633: CASA_R	casa	[%r8] %asi, %r9, %r6
	.word 0x8143e011  ! 634: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x2c800004  ! 635: BNEG	bneg,a	<label_0x4>
	.word 0xc60a0009  ! 636: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xc68a1009  ! 638: LDUBA_R	lduba	[%r8, %r9] 0x80, %r3
	.word 0xeafa253c  ! 639: SWAPA_I	swapa	%r21, [%r8 + 0x053c] %asi
	.word 0xa9a209a9  ! 640: FDIVs	fdivs	%f8, %f9, %f20
	.word 0xcc821009  ! 641: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r6
	.word 0xec9a1009  ! 642: LDDA_R	ldda	[%r8, %r9] 0x80, %r22
	.word 0xc4022c18  ! 643: LDUW_I	lduw	[%r8 + 0x0c18], %r2
	.word 0x8143c000  ! 644: STBAR	stbar
	.word 0xc2b228f4  ! 645: STHA_I	stha	%r1, [%r8 + 0x08f4] %asi
	.word 0xcd3a0009  ! 646: STDF_R	std	%f6, [%r9, %r8]
	.word 0x8143e011  ! 647: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x0aca0004  ! 648: BRNZ	brnz  ,pt	%8,<label_0xa0004>
	.word 0x8143c000  ! 649: STBAR	stbar
	.word 0x867a2e94  ! 650: SDIV_I	sdiv 	%r8, 0x0e94, %r3
	.word 0xd81a2d60  ! 651: LDD_I	ldd	[%r8 + 0x0d60], %r12
	.word 0xe6aa2c10  ! 652: STBA_I	stba	%r19, [%r8 + 0x0c10] %asi
	.word 0x8143e011  ! 653: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x2e800008  ! 654: BVS	bvs,a	<label_0x8>
	.word 0x9e6a25f0  ! 655: UDIVX_I	udivx 	%r8, 0x05f0, %r15
	.word 0xb8da0009  ! 656: SMULcc_R	smulcc 	%r8, %r9, %r28
	.word 0xf86a0009  ! 657: LDSTUB_R	ldstub	%r28, [%r8 + %r9]
	.word 0xc36a23dc  ! 658: PREFETCH_I	prefetch	[%r8 + 0x03dc], #one_read
	.word 0xc8b2291c  ! 659: STHA_I	stha	%r4, [%r8 + 0x091c] %asi
	.word 0x8f6a2790  ! 660: SDIVX_I	sdivx	%r8, 0x0790, %r7
	.word 0xd8ca2bcc  ! 661: LDSBA_I	ldsba	[%r8, + 0x0bcc] %asi, %r12
	.word 0x40000004  ! 663: CALL	call	disp30_4
	.word 0xccea298c  ! 664: LDSTUBA_I	ldstuba	%r6, [%r8 + 0x098c] %asi
	.word 0x82d20009  ! 665: UMULcc_R	umulcc 	%r8, %r9, %r1
	.word 0xd72222e8  ! 667: STF_I	st	%f11, [0x02e8, %r8]
	.word 0xc2b22628  ! 669: STHA_I	stha	%r1, [%r8 + 0x0628] %asi
	.word 0x8143c000  ! 670: STBAR	stbar
	.word 0xc27a2da4  ! 671: SWAP_I	swap	%r1, [%r8 + 0x0da4]
	.word 0x2aca0008  ! 672: BRNZ	brnz,a,pt	%8,<label_0xa0008>
	.word 0xccf21009  ! 673: STXA_R	stxa	%r6, [%r8 + %r9] 0x80
	.word 0xc36a2324  ! 674: PREFETCH_I	prefetch	[%r8 + 0x0324], #one_read
	.word 0xc5222194  ! 675: STF_I	st	%f2, [0x0194, %r8]
	.word 0x98d20009  ! 677: UMULcc_R	umulcc 	%r8, %r9, %r12
	.word 0x08800008  ! 678: BLEU	bleu  	<label_0x8>
	.word 0xe53a0009  ! 679: STDF_R	std	%f18, [%r9, %r8]
	.word 0x8143e011  ! 680: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x06800004  ! 681: BL	bl  	<label_0x4>
	.word 0xc26a2b14  ! 682: LDSTUB_I	ldstub	%r1, [%r8 + 0x0b14]
	.word 0x8b2222e8  ! 683: MULScc_I	mulscc 	%r8, 0x02e8, %r5
	.word 0xcca22acc  ! 685: STWA_I	stwa	%r6, [%r8 + 0x0acc] %asi
	.word 0xce1220d8  ! 686: LDUH_I	lduh	[%r8 + 0x00d8], %r7
	.word 0xceb22968  ! 687: STHA_I	stha	%r7, [%r8 + 0x0968] %asi
	.word 0xbc5228b8  ! 688: UMUL_I	umul 	%r8, 0x08b8, %r30
	.word 0xceaa1009  ! 689: STBA_R	stba	%r7, [%r8 + %r9] 0x80
	.word 0xf85a0009  ! 690: LDX_R	ldx	[%r8 + %r9], %r28
	.word 0xc33a2948  ! 691: STDF_I	std	%f1, [0x0948, %r8]
	.word 0x8c520009  ! 692: UMUL_R	umul 	%r8, %r9, %r6
	.word 0xc36a26bc  ! 693: PREFETCH_I	prefetch	[%r8 + 0x06bc], #one_read
	.word 0x26800004  ! 694: BL	bl,a	<label_0x4>
	.word 0xb4f22988  ! 695: UDIVcc_I	udivcc 	%r8, 0x0988, %r26
	.word 0xca4a27c4  ! 696: LDSB_I	ldsb	[%r8 + 0x07c4], %r5
	.word 0xecf22344  ! 697: STXA_I	stxa	%r22, [%r8 + 0x0344] %asi
	.word 0x844a0009  ! 698: MULX_R	mulx 	%r8, %r9, %r2
	.word 0xccda1009  ! 699: LDXA_R	ldxa	[%r8, %r9] 0x80, %r6
	.word 0x8eda2938  ! 700: SMULcc_I	smulcc 	%r8, 0x0938, %r7
	.word 0xf9f21009  ! 701: CASXA_I	casxa	[%r8] 0x80, %r9, %r28
	.word 0xa9220009  ! 702: MULScc_R	mulscc 	%r8, %r9, %r20
	.word 0x8143c000  ! 703: STBAR	stbar
	.word 0xe1e21009  ! 704: CASA_I	casa	[%r8] 0x80, %r9, %r16
	.word 0x86522a24  ! 705: UMUL_I	umul 	%r8, 0x0a24, %r3
	.word 0xb4522188  ! 706: UMUL_I	umul 	%r8, 0x0188, %r26
	.word 0xc20a2fe0  ! 707: LDUB_I	ldub	[%r8 + 0x0fe0], %r1
	.word 0xfc921009  ! 708: LDUHA_R	lduha	[%r8, %r9] 0x80, %r30
	.word 0xc3ea1009  ! 709: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xf8122344  ! 710: LDUH_I	lduh	[%r8 + 0x0344], %r28
	.word 0xc85a2f50  ! 712: LDX_I	ldx	[%r8 + 0x0f50], %r4
	.word 0xc80a0009  ! 713: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0x88720009  ! 715: UDIV_R	udiv 	%r8, %r9, %r4
	.word 0xc6420009  ! 716: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xf86a0009  ! 718: LDSTUB_R	ldstub	%r28, [%r8 + %r9]
	.word 0x88da2d24  ! 719: SMULcc_I	smulcc 	%r8, 0x0d24, %r4
	.word 0xcad21009  ! 720: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r5
	.word 0xcc020009  ! 721: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0x8143e011  ! 722: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x0c800008  ! 723: BNEG	bneg  	<label_0x8>
	.word 0x22800004  ! 724: BE	be,a	<label_0x4>
	.word 0xada209a9  ! 725: FDIVs	fdivs	%f8, %f9, %f22
	.word 0xc92229fc  ! 726: STF_I	st	%f4, [0x09fc, %r8]
	.word 0xfcba1009  ! 727: STDA_R	stda	%r30, [%r8 + %r9] 0x80
	.word 0x2a800004  ! 728: BCS	bcs,a	<label_0x4>
	.word 0x85a209a9  ! 729: FDIVs	fdivs	%f8, %f9, %f2
	.word 0x8e5a0009  ! 730: SMUL_R	smul 	%r8, %r9, %r7
	.word 0xcaaa251c  ! 731: STBA_I	stba	%r5, [%r8 + 0x051c] %asi
	.word 0xcea21009  ! 732: STWA_R	stwa	%r7, [%r8 + %r9] 0x80
	.word 0x8143e011  ! 733: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xcef21009  ! 734: STXA_R	stxa	%r7, [%r8 + %r9] 0x80
	.word 0xc41a0009  ! 735: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xc3ea1009  ! 736: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc40225c4  ! 737: LDUW_I	lduw	[%r8 + 0x05c4], %r2
	.word 0x8143c000  ! 738: STBAR	stbar
	.word 0x89a20929  ! 739: FMULs	fmuls	%f8, %f9, %f4
	.word 0x0ac20004  ! 740: BRNZ	brnz  ,nt	%8,<label_0x20004>
	.word 0x8cd20009  ! 741: UMULcc_R	umulcc 	%r8, %r9, %r6
	.word 0xcc922030  ! 742: LDUHA_I	lduha	[%r8, + 0x0030] %asi, %r6
	.word 0x8e6a2dcc  ! 743: UDIVX_I	udivx 	%r8, 0x0dcc, %r7
	.word 0xe5e22009  ! 744: CASA_R	casa	[%r8] %asi, %r9, %r18
	.word 0x8143c000  ! 745: STBAR	stbar
	.word 0xca7a2950  ! 746: SWAP_I	swap	%r5, [%r8 + 0x0950]
	.word 0x847a2bd0  ! 747: SDIV_I	sdiv 	%r8, 0x0bd0, %r2
	.word 0xa85a0009  ! 748: SMUL_R	smul 	%r8, %r9, %r20
	.word 0xc3ea1009  ! 749: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xaafa2d78  ! 750: SDIVcc_I	sdivcc 	%r8, 0x0d78, %r21
	.word 0xc93a0009  ! 751: STDF_R	std	%f4, [%r9, %r8]
	.word 0xcc8a1009  ! 752: LDUBA_R	lduba	[%r8, %r9] 0x80, %r6
	.word 0xc44a0009  ! 754: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xdb222574  ! 755: STF_I	st	%f13, [0x0574, %r8]
	.word 0xc66a2750  ! 757: LDSTUB_I	ldstub	%r3, [%r8 + 0x0750]
	.word 0x32800004  ! 758: BNE	bne,a	<label_0x4>
	.word 0xccb2279c  ! 759: STHA_I	stha	%r6, [%r8 + 0x079c] %asi
	.word 0xc6b22ec8  ! 760: STHA_I	stha	%r3, [%r8 + 0x0ec8] %asi
	.word 0xcf3a25e4  ! 761: STDF_I	std	%f7, [0x05e4, %r8]
	.word 0xceaa23a0  ! 762: STBA_I	stba	%r7, [%r8 + 0x03a0] %asi
	.word 0xcec21009  ! 763: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r7
	.word 0xcb3a25c0  ! 764: STDF_I	std	%f5, [0x05c0, %r8]
	.word 0x8143e011  ! 765: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x40000004  ! 766: CALL	call	disp30_4
	.word 0xd8b21009  ! 767: STHA_R	stha	%r12, [%r8 + %r9] 0x80
	.word 0xe0ca1009  ! 768: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r16
	.word 0x8143e011  ! 769: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x8c520009  ! 770: UMUL_R	umul 	%r8, %r9, %r6
	.word 0xcc0a0009  ! 771: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xe0a21009  ! 772: STWA_R	stwa	%r16, [%r8 + %r9] 0x80
	.word 0xd81a0009  ! 773: LDD_R	ldd	[%r8 + %r9], %r12
	.word 0x28800004  ! 774: BLEU	bleu,a	<label_0x4>
	.word 0xc3ea1009  ! 775: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xe0ba1009  ! 776: STDA_R	stda	%r16, [%r8 + %r9] 0x80
	.word 0xad6a2284  ! 778: SDIVX_I	sdivx	%r8, 0x0284, %r22
	.word 0xda020009  ! 779: LDUW_R	lduw	[%r8 + %r9], %r13
	.word 0xca42201c  ! 780: LDSW_I	ldsw	[%r8 + 0x001c], %r5
	.word 0xca922ba0  ! 781: LDUHA_I	lduha	[%r8, + 0x0ba0] %asi, %r5
	.word 0xceea1009  ! 782: LDSTUBA_R	ldstuba	%r7, [%r8 + %r9] 0x80
	.word 0xc8d2299c  ! 783: LDSHA_I	ldsha	[%r8, + 0x099c] %asi, %r4
	.word 0x0cca0008  ! 784: BRGZ	brgz  ,pt	%8,<label_0xa0008>
	.word 0xc4da21c8  ! 785: LDXA_I	ldxa	[%r8, + 0x01c8] %asi, %r2
	.word 0xc73a29b0  ! 786: STDF_I	std	%f3, [0x09b0, %r8]
	.word 0xceea24ac  ! 787: LDSTUBA_I	ldstuba	%r7, [%r8 + 0x04ac] %asi
	.word 0x26800004  ! 788: BL	bl,a	<label_0x4>
	.word 0xb1a208a9  ! 789: FSUBs	fsubs	%f8, %f9, %f24
	.word 0x8143c000  ! 790: STBAR	stbar
	.word 0xdd3a224c  ! 791: STDF_I	std	%f14, [0x024c, %r8]
	.word 0xf6b21009  ! 792: STHA_R	stha	%r27, [%r8 + %r9] 0x80
	.word 0xc8da2aa0  ! 793: LDXA_I	ldxa	[%r8, + 0x0aa0] %asi, %r4
	.word 0xc6821009  ! 794: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r3
	.word 0xe2122be4  ! 795: LDUH_I	lduh	[%r8 + 0x0be4], %r17
	.word 0xc36a2d0c  ! 796: PREFETCH_I	prefetch	[%r8 + 0x0d0c], #one_read
	.word 0xae4a0009  ! 798: MULX_R	mulx 	%r8, %r9, %r23
	.word 0x8143c000  ! 799: STBAR	stbar
	.word 0x8143e011  ! 800: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x86da0009  ! 802: SMULcc_R	smulcc 	%r8, %r9, %r3
	.word 0xc41a0009  ! 803: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x8143c000  ! 804: STBAR	stbar
	.word 0xccfa1009  ! 805: SWAPA_R	swapa	%r6, [%r8 + %r9] 0x80
	.word 0xf25a0009  ! 806: LDX_R	ldx	[%r8 + %r9], %r25
	.word 0xcaaa1009  ! 807: STBA_R	stba	%r5, [%r8 + %r9] 0x80
	.word 0xe67a0009  ! 808: SWAP_R	swap	%r19, [%r8 + %r9]
	.word 0xceea22d4  ! 809: LDSTUBA_I	ldstuba	%r7, [%r8 + 0x02d4] %asi
	.word 0x0e800004  ! 810: BVS	bvs  	<label_0x4>
	.word 0xc33a0009  ! 811: STDF_R	std	%f1, [%r9, %r8]
	.word 0xe8aa1009  ! 812: STBA_R	stba	%r20, [%r8 + %r9] 0x80
	.word 0x9eda2548  ! 813: SMULcc_I	smulcc 	%r8, 0x0548, %r15
	.word 0xcab22ecc  ! 814: STHA_I	stha	%r5, [%r8 + 0x0ecc] %asi
	.word 0x836a246c  ! 815: SDIVX_I	sdivx	%r8, 0x046c, %r1
	.word 0x8f222c88  ! 816: MULScc_I	mulscc 	%r8, 0x0c88, %r7
	.word 0xb6fa0009  ! 817: SDIVcc_R	sdivcc 	%r8, %r9, %r27
	.word 0xc36a2750  ! 818: PREFETCH_I	prefetch	[%r8 + 0x0750], #one_read
	.word 0xe6da1009  ! 819: LDXA_R	ldxa	[%r8, %r9] 0x80, %r19
	.word 0x26ca0004  ! 820: BRLZ	brlz,a,pt	%8,<label_0xa0004>
	.word 0x1a800004  ! 821: BCC	bcc  	<label_0x4>
	.word 0xb87a207c  ! 822: SDIV_I	sdiv 	%r8, 0x007c, %r28
	.word 0x87a20929  ! 823: FMULs	fmuls	%f8, %f9, %f3
	.word 0xccba1009  ! 824: STDA_R	stda	%r6, [%r8 + %r9] 0x80
	.word 0xfaaa1009  ! 825: STBA_R	stba	%r29, [%r8 + %r9] 0x80
	.word 0xa6f20009  ! 826: UDIVcc_R	udivcc 	%r8, %r9, %r19
	.word 0xcaf21009  ! 827: STXA_R	stxa	%r5, [%r8 + %r9] 0x80
	.word 0xdcea21dc  ! 828: LDSTUBA_I	ldstuba	%r14, [%r8 + 0x01dc] %asi
	.word 0xfe4a2e48  ! 829: LDSB_I	ldsb	[%r8 + 0x0e48], %r31
	.word 0x24ca0004  ! 830: BRLEZ	brlez,a,pt	%8,<label_0xa0004>
	.word 0xda5221a4  ! 831: LDSH_I	ldsh	[%r8 + 0x01a4], %r13
	.word 0xc46a0009  ! 832: LDSTUB_R	ldstub	%r2, [%r8 + %r9]
	.word 0xf4522170  ! 833: LDSH_I	ldsh	[%r8 + 0x0170], %r26
	.word 0xcaf225a8  ! 834: STXA_I	stxa	%r5, [%r8 + 0x05a8] %asi
	.word 0x10800004  ! 835: BA	ba  	<label_0x4>
	.word 0xc3ea23a4  ! 836: PREFETCHA_I	prefetcha	[%r8, + 0x03a4] %asi, #one_read
	.word 0xeff22009  ! 837: CASXA_R	casxa	[%r8]%asi, %r9, %r23
	.word 0x8143c000  ! 838: STBAR	stbar
	.word 0xfa120009  ! 839: LDUH_R	lduh	[%r8 + %r9], %r29
	.word 0xeaaa262c  ! 840: STBA_I	stba	%r21, [%r8 + 0x062c] %asi
	.word 0xe47a0009  ! 841: SWAP_R	swap	%r18, [%r8 + %r9]
	.word 0xce4a280c  ! 842: LDSB_I	ldsb	[%r8 + 0x080c], %r7
	.word 0x8143e011  ! 843: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x0ac20004  ! 844: BRNZ	brnz  ,nt	%8,<label_0x20004>
	.word 0x34800004  ! 846: BG	bg,a	<label_0x4>
	.word 0xa8da0009  ! 847: SMULcc_R	smulcc 	%r8, %r9, %r20
	.word 0x0c800004  ! 848: BNEG	bneg  	<label_0x4>
	.word 0xb06a0009  ! 849: UDIVX_R	udivx 	%r8, %r9, %r24
	.word 0xc86a2e9c  ! 850: LDSTUB_I	ldstub	%r4, [%r8 + 0x0e9c]
	.word 0xfeaa1009  ! 851: STBA_R	stba	%r31, [%r8 + %r9] 0x80
	.word 0x8c520009  ! 852: UMUL_R	umul 	%r8, %r9, %r6
	.word 0x88d22488  ! 853: UMULcc_I	umulcc 	%r8, 0x0488, %r4
	.word 0xc36a20d8  ! 854: PREFETCH_I	prefetch	[%r8 + 0x00d8], #one_read
	.word 0xf3220009  ! 855: STF_R	st	%f25, [%r9, %r8]
	.word 0xec6a238c  ! 856: LDSTUB_I	ldstub	%r22, [%r8 + 0x038c]
	.word 0xe40a0009  ! 857: LDUB_R	ldub	[%r8 + %r9], %r18
	.word 0xf65a2fac  ! 858: LDX_I	ldx	[%r8 + 0x0fac], %r27
	.word 0x86da0009  ! 859: SMULcc_R	smulcc 	%r8, %r9, %r3
	.word 0xd46a23e0  ! 860: LDSTUB_I	ldstub	%r10, [%r8 + 0x03e0]
	.word 0x8ba209a9  ! 861: FDIVs	fdivs	%f8, %f9, %f5
	.word 0x856a0009  ! 862: SDIVX_R	sdivx	%r8, %r9, %r2
	.word 0xd60a0009  ! 863: LDUB_R	ldub	[%r8 + %r9], %r11
	.word 0xf8c22774  ! 864: LDSWA_I	ldswa	[%r8, + 0x0774] %asi, %r28
	.word 0xcbf22009  ! 865: CASXA_R	casxa	[%r8]%asi, %r9, %r5
	.word 0xf87a0009  ! 866: SWAP_R	swap	%r28, [%r8 + %r9]
	.word 0xb9a20929  ! 867: FMULs	fmuls	%f8, %f9, %f28
	.word 0xc2120009  ! 868: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xc8921009  ! 869: LDUHA_R	lduha	[%r8, %r9] 0x80, %r4
	.word 0x8a720009  ! 870: UDIV_R	udiv 	%r8, %r9, %r5
	.word 0x34800004  ! 871: BG	bg,a	<label_0x4>
	.word 0xa5a20829  ! 872: FADDs	fadds	%f8, %f9, %f18
	.word 0xe4ba2d9c  ! 873: STDA_I	stda	%r18, [%r8 + 0x0d9c] %asi
	.word 0xc4c21009  ! 874: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r2
	.word 0x85a208a9  ! 875: FSUBs	fsubs	%f8, %f9, %f2
	.word 0xd8ca1009  ! 876: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r12
	.word 0x8143e011  ! 877: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x8a722e5c  ! 878: UDIV_I	udiv 	%r8, 0x0e5c, %r5
	.word 0xc3ea2808  ! 879: PREFETCHA_I	prefetcha	[%r8, + 0x0808] %asi, #one_read
	.word 0xfc1a27fc  ! 880: LDD_I	ldd	[%r8 + 0x07fc], %r30
	.word 0x2c800004  ! 881: BNEG	bneg,a	<label_0x4>
	.word 0x9e5a0009  ! 883: SMUL_R	smul 	%r8, %r9, %r15
	.word 0xe0ba2794  ! 884: STDA_I	stda	%r16, [%r8 + 0x0794] %asi
	.word 0x87a20829  ! 885: FADDs	fadds	%f8, %f9, %f3
	.word 0xcf3a0009  ! 886: STDF_R	std	%f7, [%r9, %r8]
	.word 0x9c722a30  ! 887: UDIV_I	udiv 	%r8, 0x0a30, %r14
	.word 0x86f20009  ! 888: UDIVcc_R	udivcc 	%r8, %r9, %r3
	.word 0x8a722410  ! 889: UDIV_I	udiv 	%r8, 0x0410, %r5
	.word 0xf88a1009  ! 890: LDUBA_R	lduba	[%r8, %r9] 0x80, %r28
	.word 0xe5220009  ! 891: STF_R	st	%f18, [%r9, %r8]
	.word 0xf6b22428  ! 892: STHA_I	stha	%r27, [%r8 + 0x0428] %asi
	.word 0xc20a25fc  ! 893: LDUB_I	ldub	[%r8 + 0x05fc], %r1
	.word 0x88fa2d34  ! 894: SDIVcc_I	sdivcc 	%r8, 0x0d34, %r4
	.word 0xc85a2b2c  ! 895: LDX_I	ldx	[%r8 + 0x0b2c], %r4
	.word 0xc3ea1009  ! 896: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x8c6a0009  ! 897: UDIVX_R	udivx 	%r8, %r9, %r6
	.word 0xc8020009  ! 898: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xf8d21009  ! 899: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r28
	.word 0xc4da1009  ! 900: LDXA_R	ldxa	[%r8, %r9] 0x80, %r2
	.word 0x02c20004  ! 904: BRZ	brz  ,nt	%8,<label_0x20004>
	.word 0xc67a25fc  ! 905: SWAP_I	swap	%r3, [%r8 + 0x05fc]
	.word 0x2a800004  ! 906: BCS	bcs,a	<label_0x4>
	.word 0xc3220009  ! 907: STF_R	st	%f1, [%r9, %r8]
	.word 0xa4f20009  ! 908: UDIVcc_R	udivcc 	%r8, %r9, %r18
	.word 0xc4ba1009  ! 909: STDA_R	stda	%r2, [%r8 + %r9] 0x80
	.word 0xfc9a2a14  ! 910: LDDA_I	ldda	[%r8, + 0x0a14] %asi, %r30
	.word 0xc3ea24b4  ! 911: PREFETCHA_I	prefetcha	[%r8, + 0x04b4] %asi, #one_read
	.word 0xc2520009  ! 912: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0x8143e011  ! 913: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x8c7a2138  ! 914: SDIV_I	sdiv 	%r8, 0x0138, %r6
	.word 0xc2aa1009  ! 915: STBA_R	stba	%r1, [%r8 + %r9] 0x80
	.word 0x26ca0004  ! 917: BRLZ	brlz,a,pt	%8,<label_0xa0004>
	.word 0xce0a2ba8  ! 918: LDUB_I	ldub	[%r8 + 0x0ba8], %r7
	.word 0xce0a2e48  ! 920: LDUB_I	ldub	[%r8 + 0x0e48], %r7
	.word 0xc86a0009  ! 921: LDSTUB_R	ldstub	%r4, [%r8 + %r9]
	.word 0x876a2ab0  ! 922: SDIVX_I	sdivx	%r8, 0x0ab0, %r3
	.word 0xc6020009  ! 923: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xcaaa1009  ! 924: STBA_R	stba	%r5, [%r8 + %r9] 0x80
	.word 0xc36a1009  ! 925: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xcf3a0009  ! 926: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc6ca2310  ! 927: LDSBA_I	ldsba	[%r8, + 0x0310] %asi, %r3
	.word 0xca921009  ! 928: LDUHA_R	lduha	[%r8, %r9] 0x80, %r5
	.word 0x8afa0009  ! 929: SDIVcc_R	sdivcc 	%r8, %r9, %r5
	.word 0x8143e011  ! 930: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x8143c000  ! 931: STBAR	stbar
	.word 0x8d6a0009  ! 934: SDIVX_R	sdivx	%r8, %r9, %r6
	.word 0xa7a208a9  ! 935: FSUBs	fsubs	%f8, %f9, %f19
	.word 0x02800004  ! 936: BE	be  	<label_0x4>
	.word 0xdcd21009  ! 937: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r14
	.word 0xf6821009  ! 938: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r27
	.word 0xac4a207c  ! 939: MULX_I	mulx 	%r8, 0x007c, %r22
	.word 0x87220009  ! 940: MULScc_R	mulscc 	%r8, %r9, %r3
	.word 0xf09a1009  ! 941: LDDA_R	ldda	[%r8, %r9] 0x80, %r24
	.word 0x884a0009  ! 942: MULX_R	mulx 	%r8, %r9, %r4
	.word 0xc73a0009  ! 943: STDF_R	std	%f3, [%r9, %r8]
	.word 0xa0d22380  ! 944: UMULcc_I	umulcc 	%r8, 0x0380, %r16
	.word 0xcea21009  ! 945: STWA_R	stwa	%r7, [%r8 + %r9] 0x80
	.word 0xca6a0009  ! 946: LDSTUB_R	ldstub	%r5, [%r8 + %r9]
	.word 0x8da20929  ! 947: FMULs	fmuls	%f8, %f9, %f6
	.word 0xd8921009  ! 948: LDUHA_R	lduha	[%r8, %r9] 0x80, %r12
	.word 0x36800004  ! 949: BGE	bge,a	<label_0x4>
	.word 0xc36a242c  ! 950: PREFETCH_I	prefetch	[%r8 + 0x042c], #one_read
	.word 0xccb22240  ! 951: STHA_I	stha	%r6, [%r8 + 0x0240] %asi
	.word 0x8fa20829  ! 952: FADDs	fadds	%f8, %f9, %f7
	.word 0xccb21009  ! 953: STHA_R	stha	%r6, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 955: STBAR	stbar
	.word 0x8ba20929  ! 956: FMULs	fmuls	%f8, %f9, %f5
	.word 0xa87a0009  ! 957: SDIV_R	sdiv 	%r8, %r9, %r20
	.word 0xc3220009  ! 958: STF_R	st	%f1, [%r9, %r8]
	.word 0xc7220009  ! 959: STF_R	st	%f3, [%r9, %r8]
	.word 0x86f20009  ! 960: UDIVcc_R	udivcc 	%r8, %r9, %r3
	.word 0xf3f21009  ! 961: CASXA_I	casxa	[%r8] 0x80, %r9, %r25
	.word 0x06800004  ! 962: BL	bl  	<label_0x4>
	.word 0xc3ea2508  ! 963: PREFETCHA_I	prefetcha	[%r8, + 0x0508] %asi, #one_read
	.word 0xce7a2ef0  ! 965: SWAP_I	swap	%r7, [%r8 + 0x0ef0]
	.word 0xf0da2c88  ! 966: LDXA_I	ldxa	[%r8, + 0x0c88] %asi, %r24
	.word 0x24ca0004  ! 967: BRLEZ	brlez,a,pt	%8,<label_0xa0004>
	.word 0xc5f21009  ! 968: CASXA_I	casxa	[%r8] 0x80, %r9, %r2
	.word 0x86722c38  ! 969: UDIV_I	udiv 	%r8, 0x0c38, %r3
	.word 0xcbf21009  ! 970: CASXA_I	casxa	[%r8] 0x80, %r9, %r5
	.word 0xab6a21fc  ! 971: SDIVX_I	sdivx	%r8, 0x01fc, %r21
	.word 0x8143c000  ! 972: STBAR	stbar
	.word 0x2a800004  ! 973: BCS	bcs,a	<label_0x4>
	.word 0xccb21009  ! 975: STHA_R	stha	%r6, [%r8 + %r9] 0x80
	.word 0x86da0009  ! 976: SMULcc_R	smulcc 	%r8, %r9, %r3
	.word 0x85a20829  ! 977: FADDs	fadds	%f8, %f9, %f2
	.word 0x87222700  ! 978: MULScc_I	mulscc 	%r8, 0x0700, %r3
	.word 0xc24a0009  ! 979: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xdaaa24a0  ! 980: STBA_I	stba	%r13, [%r8 + 0x04a0] %asi
	.word 0xca0a2d3c  ! 981: LDUB_I	ldub	[%r8 + 0x0d3c], %r5
	.word 0xc6821009  ! 982: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r3
	.word 0xbd6a0009  ! 983: SDIVX_R	sdivx	%r8, %r9, %r30
	.word 0x8ba209a9  ! 984: FDIVs	fdivs	%f8, %f9, %f5
	.word 0xc36a2c70  ! 985: PREFETCH_I	prefetch	[%r8 + 0x0c70], #one_read
	.word 0xc33a2438  ! 986: STDF_I	std	%f1, [0x0438, %r8]
	.word 0x8143c000  ! 987: STBAR	stbar
	.word 0x2aca0008  ! 988: BRNZ	brnz,a,pt	%8,<label_0xa0008>
	.word 0x8c6a2684  ! 989: UDIVX_I	udivx 	%r8, 0x0684, %r6
	.word 0xc2b220d8  ! 990: STHA_I	stha	%r1, [%r8 + 0x00d8] %asi
	.word 0x8ed20009  ! 991: UMULcc_R	umulcc 	%r8, %r9, %r7
	.word 0x94522634  ! 992: UMUL_I	umul 	%r8, 0x0634, %r10
	.word 0xbfa208a9  ! 993: FSUBs	fsubs	%f8, %f9, %f31
	.word 0x865a255c  ! 994: SMUL_I	smul 	%r8, 0x055c, %r3
	.word 0x06c20004  ! 995: BRLZ	brlz  ,nt	%8,<label_0x20004>
	.word 0xd93a2aa4  ! 996: STDF_I	std	%f12, [0x0aa4, %r8]
	.word 0x89a208a9  ! 997: FSUBs	fsubs	%f8, %f9, %f4
	.word 0xde8a2dec  ! 998: LDUBA_I	lduba	[%r8, + 0x0dec] %asi, %r15
	.word 0x8c5a2b84  ! 999: SMUL_I	smul 	%r8, 0x0b84, %r6
        ta      T_GOOD_TRAP

th_main_2:
        setx  MAIN_BASE_DATA_VA, %r1, %r8
        setx  0x0000000000000f40, %g1, %r9
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
        setx  0x3474e3870f113f46, %g1, %r0
        setx  0x7962e4909cb34bd1, %g1, %r1
        setx  0x068c08e021aa1b54, %g1, %r2
        setx  0xce26a444671567b8, %g1, %r3
        setx  0x9ff941a276fe547f, %g1, %r4
        setx  0x8fa3ca3b0cfa8d82, %g1, %r5
        setx  0x4ddac487ea7fb64a, %g1, %r6
        setx  0x932a83593a863aed, %g1, %r7
        setx  0xfbf35da77b571906, %g1, %r10
        setx  0x38d5b325a7343126, %g1, %r11
        setx  0xa07863441f1915fb, %g1, %r12
        setx  0x0fadce9efa86eb10, %g1, %r13
        setx  0x2524acda6e2ca5c3, %g1, %r14
        setx  0x06d54561586172fe, %g1, %r15
        setx  0xc26ec7ed3028a7e6, %g1, %r16
        setx  0xbf5d702183b4d518, %g1, %r17
        setx  0xc12ce802da3e8952, %g1, %r18
        setx  0xe4747f1c72747eed, %g1, %r19
        setx  0xaa1fed9d209c8ea2, %g1, %r20
        setx  0x4d138f7d49c50311, %g1, %r21
        setx  0xde23e906a6f227a1, %g1, %r22
        setx  0x33e8767070dbb57f, %g1, %r23
        setx  0x0687286d915c44f6, %g1, %r24
        setx  0x18fa3f5625d90017, %g1, %r25
        setx  0xa18ae2af93ea4627, %g1, %r26
        setx  0xf0c3e20fc107549c, %g1, %r27
        setx  0xd5c18a799c1b41dd, %g1, %r28
        setx  0x0372ad554cd26431, %g1, %r29
        setx  0x896aa5e1c821a67c, %g1, %r30
        setx  0x1a36e51a6c9d479b, %g1, %r31
	.word 0x06c20004  ! 5: BRLZ	brlz  ,nt	%8,<label_0x20004>
	.word 0x8fa209a9  ! 6: FDIVs	fdivs	%f8, %f9, %f7
	.word 0x8143c000  ! 7: STBAR	stbar
	.word 0x88522104  ! 8: UMUL_I	umul 	%r8, 0x0104, %r4
	.word 0xc2520009  ! 9: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xfc9a2118  ! 10: LDDA_I	ldda	[%r8, + 0x0118] %asi, %r30
	.word 0xcf3a0009  ! 11: STDF_R	std	%f7, [%r9, %r8]
	.word 0x2a800008  ! 12: BCS	bcs,a	<label_0x8>
	.word 0x2cca0004  ! 13: BRGZ	brgz,a,pt	%8,<label_0xa0004>
	.word 0xc26a2778  ! 14: LDSTUB_I	ldstub	%r1, [%r8 + 0x0778]
	.word 0xcd220009  ! 16: STF_R	st	%f6, [%r9, %r8]
	.word 0xc6821009  ! 17: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r3
	.word 0x886a2a98  ! 18: UDIVX_I	udivx 	%r8, 0x0a98, %r4
	.word 0xccea21bc  ! 19: LDSTUBA_I	ldstuba	%r6, [%r8 + 0x01bc] %asi
	.word 0xc49a2ef8  ! 20: LDDA_I	ldda	[%r8, + 0x0ef8] %asi, %r2
	.word 0xc3ea2a10  ! 21: PREFETCHA_I	prefetcha	[%r8, + 0x0a10] %asi, #one_read
	.word 0xc9f22009  ! 22: CASXA_R	casxa	[%r8]%asi, %r9, %r4
	.word 0x8ad20009  ! 23: UMULcc_R	umulcc 	%r8, %r9, %r5
	.word 0x9f220009  ! 24: MULScc_R	mulscc 	%r8, %r9, %r15
	.word 0xd41a291c  ! 25: LDD_I	ldd	[%r8 + 0x091c], %r10
	.word 0x8ba209a9  ! 28: FDIVs	fdivs	%f8, %f9, %f5
	.word 0xdde21009  ! 29: CASA_I	casa	[%r8] 0x80, %r9, %r14
	.word 0xceea1009  ! 30: LDSTUBA_R	ldstuba	%r7, [%r8 + %r9] 0x80
	.word 0xc27a0009  ! 31: SWAP_R	swap	%r1, [%r8 + %r9]
	.word 0x8143c000  ! 32: STBAR	stbar
	.word 0x86da0009  ! 33: SMULcc_R	smulcc 	%r8, %r9, %r3
	.word 0xb64a0009  ! 34: MULX_R	mulx 	%r8, %r9, %r27
	.word 0xc3ea2948  ! 35: PREFETCHA_I	prefetcha	[%r8, + 0x0948] %asi, #one_read
	.word 0xe49a1009  ! 36: LDDA_R	ldda	[%r8, %r9] 0x80, %r18
	.word 0x8143e011  ! 38: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x8143c000  ! 39: STBAR	stbar
	.word 0xc482201c  ! 40: LDUWA_I	lduwa	[%r8, + 0x001c] %asi, %r2
	.word 0xfbe21009  ! 41: CASA_I	casa	[%r8] 0x80, %r9, %r29
	.word 0xef3a2db4  ! 43: STDF_I	std	%f23, [0x0db4, %r8]
	.word 0x84fa217c  ! 44: SDIVcc_I	sdivcc 	%r8, 0x017c, %r2
	.word 0xc8520009  ! 45: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xe4ea2690  ! 46: LDSTUBA_I	ldstuba	%r18, [%r8 + 0x0690] %asi
	.word 0x8143e011  ! 48: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xd5f22009  ! 49: CASXA_R	casxa	[%r8]%asi, %r9, %r10
	.word 0xd8da2d9c  ! 50: LDXA_I	ldxa	[%r8, + 0x0d9c] %asi, %r12
	.word 0x14800004  ! 51: BG	bg  	<label_0x4>
	.word 0xc3ea2234  ! 52: PREFETCHA_I	prefetcha	[%r8, + 0x0234] %asi, #one_read
	.word 0xc5f22009  ! 53: CASXA_R	casxa	[%r8]%asi, %r9, %r2
	.word 0xf4ba2f28  ! 54: STDA_I	stda	%r26, [%r8 + 0x0f28] %asi
	.word 0xb6da0009  ! 55: SMULcc_R	smulcc 	%r8, %r9, %r27
	.word 0x83a208a9  ! 56: FSUBs	fsubs	%f8, %f9, %f1
	.word 0x8cda0009  ! 57: SMULcc_R	smulcc 	%r8, %r9, %r6
	.word 0xc3222848  ! 58: STF_I	st	%f1, [0x0848, %r8]
	.word 0xf0ba1009  ! 60: STDA_R	stda	%r24, [%r8 + %r9] 0x80
	.word 0xc2422f48  ! 61: LDSW_I	ldsw	[%r8 + 0x0f48], %r1
	.word 0xe8ba1009  ! 62: STDA_R	stda	%r20, [%r8 + %r9] 0x80
	.word 0xfcda1009  ! 63: LDXA_R	ldxa	[%r8, %r9] 0x80, %r30
	.word 0xcf222258  ! 64: STF_I	st	%f7, [0x0258, %r8]
	.word 0xc6fa1009  ! 65: SWAPA_R	swapa	%r3, [%r8 + %r9] 0x80
	.word 0x40000004  ! 66: CALL	call	disp30_4
	.word 0xcea21009  ! 67: STWA_R	stwa	%r7, [%r8 + %r9] 0x80
	.word 0xc4ca2be4  ! 68: LDSBA_I	ldsba	[%r8, + 0x0be4] %asi, %r2
	.word 0x896a0009  ! 69: SDIVX_R	sdivx	%r8, %r9, %r4
	.word 0xc9222bd0  ! 70: STF_I	st	%f4, [0x0bd0, %r8]
	.word 0xcc4a2858  ! 71: LDSB_I	ldsb	[%r8 + 0x0858], %r6
	.word 0xc24a0009  ! 72: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xc3222b9c  ! 73: STF_I	st	%f1, [0x0b9c, %r8]
	.word 0xc3ea2a10  ! 74: PREFETCHA_I	prefetcha	[%r8, + 0x0a10] %asi, #one_read
	.word 0xa6da27bc  ! 75: SMULcc_I	smulcc 	%r8, 0x07bc, %r19
	.word 0xca7a0009  ! 76: SWAP_R	swap	%r5, [%r8 + %r9]
	.word 0x24800004  ! 78: BLE	ble,a	<label_0x4>
	.word 0x2aca0004  ! 79: BRNZ	brnz,a,pt	%8,<label_0xa0004>
	.word 0x04c20004  ! 80: BRLEZ	brlez  ,nt	%8,<label_0x20004>
	.word 0xcada1009  ! 81: LDXA_R	ldxa	[%r8, %r9] 0x80, %r5
	.word 0x8ba20829  ! 82: FADDs	fadds	%f8, %f9, %f5
	.word 0xce7a2754  ! 83: SWAP_I	swap	%r7, [%r8 + 0x0754]
	.word 0x12800004  ! 84: BNE	bne  	<label_0x4>
	.word 0xc2b22dcc  ! 86: STHA_I	stha	%r1, [%r8 + 0x0dcc] %asi
	.word 0xac522260  ! 87: UMUL_I	umul 	%r8, 0x0260, %r22
	.word 0xc8f22360  ! 88: STXA_I	stxa	%r4, [%r8 + 0x0360] %asi
	.word 0x2ac20004  ! 89: BRNZ	brnz,a,nt	%8,<label_0x20004>
	.word 0xcc122fb8  ! 90: LDUH_I	lduh	[%r8 + 0x0fb8], %r6
	.word 0xc36a22a8  ! 91: PREFETCH_I	prefetch	[%r8 + 0x02a8], #one_read
	.word 0xdeda1009  ! 92: LDXA_R	ldxa	[%r8, %r9] 0x80, %r15
	.word 0xfaca1009  ! 93: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r29
	.word 0x83a208a9  ! 94: FSUBs	fsubs	%f8, %f9, %f1
	.word 0x30800008  ! 95: BA	ba,a	<label_0x8>
	.word 0x8143c000  ! 96: STBAR	stbar
	.word 0xe8ba1009  ! 97: STDA_R	stda	%r20, [%r8 + %r9] 0x80
	.word 0x3c800004  ! 98: BPOS	bpos,a	<label_0x4>
	.word 0x02c20008  ! 99: BRZ	brz  ,nt	%8,<label_0x20008>
	.word 0x845a231c  ! 101: SMUL_I	smul 	%r8, 0x031c, %r2
	.word 0xa5a209a9  ! 102: FDIVs	fdivs	%f8, %f9, %f18
	.word 0xc25225cc  ! 103: LDSH_I	ldsh	[%r8 + 0x05cc], %r1
	.word 0x8eda2748  ! 104: SMULcc_I	smulcc 	%r8, 0x0748, %r7
	.word 0xc4f22d30  ! 105: STXA_I	stxa	%r2, [%r8 + 0x0d30] %asi
	.word 0xf06a0009  ! 106: LDSTUB_R	ldstub	%r24, [%r8 + %r9]
	.word 0xacfa0009  ! 107: SDIVcc_R	sdivcc 	%r8, %r9, %r22
	.word 0x8143c000  ! 108: STBAR	stbar
	.word 0x8872277c  ! 109: UDIV_I	udiv 	%r8, 0x077c, %r4
	.word 0xc6a21009  ! 110: STWA_R	stwa	%r3, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 111: STBAR	stbar
	.word 0xc3f21009  ! 112: CASXA_I	casxa	[%r8] 0x80, %r9, %r1
	.word 0x85a209a9  ! 113: FDIVs	fdivs	%f8, %f9, %f2
	.word 0xee522948  ! 114: LDSH_I	ldsh	[%r8 + 0x0948], %r23
	.word 0xc8aa2028  ! 115: STBA_I	stba	%r4, [%r8 + 0x0028] %asi
	.word 0xe0020009  ! 116: LDUW_R	lduw	[%r8 + %r9], %r16
	.word 0xcca21009  ! 117: STWA_R	stwa	%r6, [%r8 + %r9] 0x80
	.word 0xc3ea2530  ! 118: PREFETCHA_I	prefetcha	[%r8, + 0x0530] %asi, #one_read
	.word 0x32800004  ! 119: BNE	bne,a	<label_0x4>
	.word 0x24c20004  ! 122: BRLEZ	brlez,a,nt	%8,<label_0x20004>
	.word 0x8143e011  ! 123: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x8143e011  ! 124: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x89a20829  ! 126: FADDs	fadds	%f8, %f9, %f4
	.word 0xfc9a27d8  ! 127: LDDA_I	ldda	[%r8, + 0x07d8] %asi, %r30
	.word 0x84da0009  ! 129: SMULcc_R	smulcc 	%r8, %r9, %r2
	.word 0xceaa258c  ! 130: STBA_I	stba	%r7, [%r8 + 0x058c] %asi
	.word 0x832224d0  ! 132: MULScc_I	mulscc 	%r8, 0x04d0, %r1
	.word 0x8143c000  ! 133: STBAR	stbar
	.word 0x8143c000  ! 134: STBAR	stbar
	.word 0x8143c000  ! 135: STBAR	stbar
	.word 0xb25a256c  ! 136: SMUL_I	smul 	%r8, 0x056c, %r25
	.word 0x8143c000  ! 137: STBAR	stbar
	.word 0x12800004  ! 138: BNE	bne  	<label_0x4>
	.word 0x8d220009  ! 139: MULScc_R	mulscc 	%r8, %r9, %r6
	.word 0x8143c000  ! 140: STBAR	stbar
	.word 0xcaf22130  ! 141: STXA_I	stxa	%r5, [%r8 + 0x0130] %asi
	.word 0x8e5a0009  ! 142: SMUL_R	smul 	%r8, %r9, %r7
	.word 0xe0ba28fc  ! 143: STDA_I	stda	%r16, [%r8 + 0x08fc] %asi
	.word 0xa1a209a9  ! 144: FDIVs	fdivs	%f8, %f9, %f16
	.word 0xe9f21009  ! 145: CASXA_I	casxa	[%r8] 0x80, %r9, %r20
	.word 0xb85a272c  ! 146: SMUL_I	smul 	%r8, 0x072c, %r28
	.word 0xc3222bf8  ! 147: STF_I	st	%f1, [0x0bf8, %r8]
	.word 0x8143c000  ! 148: STBAR	stbar
	.word 0xc2aa1009  ! 149: STBA_R	stba	%r1, [%r8 + %r9] 0x80
	.word 0xc40a0009  ! 150: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xce122560  ! 151: LDUH_I	lduh	[%r8 + 0x0560], %r7
	.word 0x32800008  ! 152: BNE	bne,a	<label_0x8>
	.word 0x26c20004  ! 153: BRLZ	brlz,a,nt	%8,<label_0x20004>
	.word 0xc3ea2400  ! 154: PREFETCHA_I	prefetcha	[%r8, + 0x0400] %asi, #one_read
	.word 0x8cda22d4  ! 155: SMULcc_I	smulcc 	%r8, 0x02d4, %r6
	.word 0x8143e011  ! 156: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xcca21009  ! 157: STWA_R	stwa	%r6, [%r8 + %r9] 0x80
	.word 0xc2ea1009  ! 159: LDSTUBA_R	ldstuba	%r1, [%r8 + %r9] 0x80
	.word 0x844a272c  ! 160: MULX_I	mulx 	%r8, 0x072c, %r2
	.word 0x8a5a2328  ! 161: SMUL_I	smul 	%r8, 0x0328, %r5
	.word 0x88fa2860  ! 162: SDIVcc_I	sdivcc 	%r8, 0x0860, %r4
	.word 0xecba1009  ! 165: STDA_R	stda	%r22, [%r8 + %r9] 0x80
	.word 0xceca1009  ! 166: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r7
	.word 0xf4ca1009  ! 167: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r26
	.word 0xfeca249c  ! 168: LDSBA_I	ldsba	[%r8, + 0x049c] %asi, %r31
	.word 0x2e800004  ! 169: BVS	bvs,a	<label_0x4>
	.word 0x8cda0009  ! 170: SMULcc_R	smulcc 	%r8, %r9, %r6
	.word 0xca122644  ! 171: LDUH_I	lduh	[%r8 + 0x0644], %r5
	.word 0x8e520009  ! 172: UMUL_R	umul 	%r8, %r9, %r7
	.word 0x8a7226d4  ! 173: UDIV_I	udiv 	%r8, 0x06d4, %r5
	.word 0xcd3a2ee8  ! 174: STDF_I	std	%f6, [0x0ee8, %r8]
	.word 0xef3a0009  ! 175: STDF_R	std	%f23, [%r9, %r8]
	.word 0x2a800008  ! 176: BCS	bcs,a	<label_0x8>
	.word 0xc36a2e28  ! 177: PREFETCH_I	prefetch	[%r8 + 0x0e28], #one_read
	.word 0xe2aa1009  ! 178: STBA_R	stba	%r17, [%r8 + %r9] 0x80
	.word 0x88d20009  ! 179: UMULcc_R	umulcc 	%r8, %r9, %r4
	.word 0xa7a208a9  ! 180: FSUBs	fsubs	%f8, %f9, %f19
	.word 0xc8522ce0  ! 181: LDSH_I	ldsh	[%r8 + 0x0ce0], %r4
	.word 0x8143e011  ! 182: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x2aca0008  ! 183: BRNZ	brnz,a,pt	%8,<label_0xa0008>
	.word 0xfe120009  ! 184: LDUH_R	lduh	[%r8 + %r9], %r31
	.word 0xc5e21009  ! 185: CASA_I	casa	[%r8] 0x80, %r9, %r2
	.word 0x89a208a9  ! 186: FSUBs	fsubs	%f8, %f9, %f4
	.word 0xcca21009  ! 187: STWA_R	stwa	%r6, [%r8 + %r9] 0x80
	.word 0x2c800004  ! 188: BNEG	bneg,a	<label_0x4>
	.word 0x946a2bfc  ! 189: UDIVX_I	udivx 	%r8, 0x0bfc, %r10
	.word 0xc2c22e88  ! 190: LDSWA_I	ldswa	[%r8, + 0x0e88] %asi, %r1
	.word 0xc36a2fb0  ! 191: PREFETCH_I	prefetch	[%r8 + 0x0fb0], #one_read
	.word 0xca9225f4  ! 193: LDUHA_I	lduha	[%r8, + 0x05f4] %asi, %r5
	.word 0xf8120009  ! 194: LDUH_R	lduh	[%r8 + %r9], %r28
	.word 0x8ba20929  ! 195: FMULs	fmuls	%f8, %f9, %f5
	.word 0xcc1a2204  ! 196: LDD_I	ldd	[%r8 + 0x0204], %r6
	.word 0xc8f22e08  ! 197: STXA_I	stxa	%r4, [%r8 + 0x0e08] %asi
	.word 0x8c6a0009  ! 198: UDIVX_R	udivx 	%r8, %r9, %r6
	.word 0xcbf21009  ! 199: CASXA_I	casxa	[%r8] 0x80, %r9, %r5
	.word 0xc32227cc  ! 200: STF_I	st	%f1, [0x07cc, %r8]
	.word 0x8143c000  ! 201: STBAR	stbar
	.word 0x884a2e50  ! 202: MULX_I	mulx 	%r8, 0x0e50, %r4
	.word 0xacd20009  ! 203: UMULcc_R	umulcc 	%r8, %r9, %r22
	.word 0xc4ca1009  ! 204: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r2
	.word 0xc84a0009  ! 205: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xd8c21009  ! 206: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r12
	.word 0xcc520009  ! 207: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xdc5a0009  ! 208: LDX_R	ldx	[%r8 + %r9], %r14
	.word 0x84720009  ! 209: UDIV_R	udiv 	%r8, %r9, %r2
	.word 0xc8120009  ! 210: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xcdf21009  ! 211: CASXA_I	casxa	[%r8] 0x80, %r9, %r6
	.word 0xccc228f0  ! 212: LDSWA_I	ldswa	[%r8, + 0x08f0] %asi, %r6
	.word 0x8143e011  ! 213: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xc2aa1009  ! 214: STBA_R	stba	%r1, [%r8 + %r9] 0x80
	.word 0xc46a0009  ! 215: LDSTUB_R	ldstub	%r2, [%r8 + %r9]
	.word 0x32800004  ! 216: BNE	bne,a	<label_0x4>
	.word 0xd86a250c  ! 217: LDSTUB_I	ldstub	%r12, [%r8 + 0x050c]
	.word 0x832223dc  ! 218: MULScc_I	mulscc 	%r8, 0x03dc, %r1
	.word 0xc3ea1009  ! 219: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc8922544  ! 220: LDUHA_I	lduha	[%r8, + 0x0544] %asi, %r4
	.word 0xc33a23a0  ! 221: STDF_I	std	%f1, [0x03a0, %r8]
	.word 0xc4b21009  ! 223: STHA_R	stha	%r2, [%r8 + %r9] 0x80
	.word 0x2e800008  ! 225: BVS	bvs,a	<label_0x8>
	.word 0x86f22288  ! 226: UDIVcc_I	udivcc 	%r8, 0x0288, %r3
	.word 0xfdf21009  ! 227: CASXA_I	casxa	[%r8] 0x80, %r9, %r30
	.word 0x9eda2eb0  ! 228: SMULcc_I	smulcc 	%r8, 0x0eb0, %r15
	.word 0xf0ca27a4  ! 229: LDSBA_I	ldsba	[%r8, + 0x07a4] %asi, %r24
	.word 0xc6da2b40  ! 230: LDXA_I	ldxa	[%r8, + 0x0b40] %asi, %r3
	.word 0xc9222d38  ! 231: STF_I	st	%f4, [0x0d38, %r8]
	.word 0xc88a235c  ! 232: LDUBA_I	lduba	[%r8, + 0x035c] %asi, %r4
	.word 0xcf220009  ! 233: STF_R	st	%f7, [%r9, %r8]
	.word 0x04c20004  ! 234: BRLEZ	brlez  ,nt	%8,<label_0x20004>
	.word 0x8a6a0009  ! 235: UDIVX_R	udivx 	%r8, %r9, %r5
	.word 0x847a0009  ! 236: SDIV_R	sdiv 	%r8, %r9, %r2
	.word 0x3c800004  ! 237: BPOS	bpos,a	<label_0x4>
	.word 0xcef22938  ! 238: STXA_I	stxa	%r7, [%r8 + 0x0938] %asi
	.word 0xc8a22c78  ! 239: STWA_I	stwa	%r4, [%r8 + 0x0c78] %asi
	.word 0x0e800004  ! 240: BVS	bvs  	<label_0x4>
	.word 0xcaea2c8c  ! 241: LDSTUBA_I	ldstuba	%r5, [%r8 + 0x0c8c] %asi
	.word 0xe67a2a24  ! 242: SWAP_I	swap	%r19, [%r8 + 0x0a24]
	.word 0xc3ea2ecc  ! 243: PREFETCHA_I	prefetcha	[%r8, + 0x0ecc] %asi, #one_read
	.word 0xcc6a0009  ! 244: LDSTUB_R	ldstub	%r6, [%r8 + %r9]
	.word 0xa16a224c  ! 245: SDIVX_I	sdivx	%r8, 0x024c, %r16
	.word 0x985220b0  ! 246: UMUL_I	umul 	%r8, 0x00b0, %r12
	.word 0x1c800008  ! 247: BPOS	bpos  	<label_0x8>
	.word 0x2c800004  ! 248: BNEG	bneg,a	<label_0x4>
	.word 0xcc0a0009  ! 249: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0x8143c000  ! 250: STBAR	stbar
	.word 0xd81a0009  ! 251: LDD_R	ldd	[%r8 + %r9], %r12
	.word 0xf87a2b6c  ! 252: SWAP_I	swap	%r28, [%r8 + 0x0b6c]
	.word 0xccf2214c  ! 253: STXA_I	stxa	%r6, [%r8 + 0x014c] %asi
	.word 0xd4520009  ! 254: LDSH_R	ldsh	[%r8 + %r9], %r10
	.word 0x8143c000  ! 255: STBAR	stbar
	.word 0x2e800004  ! 256: BVS	bvs,a	<label_0x4>
	.word 0x944a2768  ! 257: MULX_I	mulx 	%r8, 0x0768, %r10
	.word 0xc5220009  ! 258: STF_R	st	%f2, [%r9, %r8]
	.word 0xe3222794  ! 259: STF_I	st	%f17, [0x0794, %r8]
	.word 0xc3ea1009  ! 260: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xecba21e4  ! 261: STDA_I	stda	%r22, [%r8 + 0x01e4] %asi
	.word 0xbf6a2360  ! 263: SDIVX_I	sdivx	%r8, 0x0360, %r31
	.word 0xccaa297c  ! 264: STBA_I	stba	%r6, [%r8 + 0x097c] %asi
	.word 0xcde21009  ! 265: CASA_I	casa	[%r8] 0x80, %r9, %r6
	.word 0xe5222394  ! 267: STF_I	st	%f18, [0x0394, %r8]
	.word 0xce120009  ! 268: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0x8da209a9  ! 269: FDIVs	fdivs	%f8, %f9, %f6
	.word 0x8f220009  ! 270: MULScc_R	mulscc 	%r8, %r9, %r7
	.word 0xc84a0009  ! 271: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0x8143c000  ! 272: STBAR	stbar
	.word 0x1a800004  ! 273: BCC	bcc  	<label_0x4>
	.word 0x89220009  ! 274: MULScc_R	mulscc 	%r8, %r9, %r4
	.word 0xc36a2d40  ! 275: PREFETCH_I	prefetch	[%r8 + 0x0d40], #one_read
	.word 0x8143c000  ! 276: STBAR	stbar
	.word 0xc2921009  ! 277: LDUHA_R	lduha	[%r8, %r9] 0x80, %r1
	.word 0x847225c8  ! 278: UDIV_I	udiv 	%r8, 0x05c8, %r2
	.word 0xc48a2768  ! 280: LDUBA_I	lduba	[%r8, + 0x0768] %asi, %r2
	.word 0x8a522dbc  ! 281: UMUL_I	umul 	%r8, 0x0dbc, %r5
	.word 0x8143c000  ! 282: STBAR	stbar
	.word 0x8143e011  ! 283: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xc86a2b60  ! 284: LDSTUB_I	ldstub	%r4, [%r8 + 0x0b60]
	.word 0x8143e011  ! 285: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x8143e011  ! 286: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x2c800008  ! 287: BNEG	bneg,a	<label_0x8>
	.word 0x36800004  ! 288: BGE	bge,a	<label_0x4>
	.word 0x8143e011  ! 289: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x966a0009  ! 290: UDIVX_R	udivx 	%r8, %r9, %r11
	.word 0xecfa1009  ! 291: SWAPA_R	swapa	%r22, [%r8 + %r9] 0x80
	.word 0xe6aa1009  ! 292: STBA_R	stba	%r19, [%r8 + %r9] 0x80
	.word 0x8e722e7c  ! 293: UDIV_I	udiv 	%r8, 0x0e7c, %r7
	.word 0xc36a2b5c  ! 294: PREFETCH_I	prefetch	[%r8 + 0x0b5c], #one_read
	.word 0xdab21009  ! 295: STHA_R	stha	%r13, [%r8 + %r9] 0x80
	.word 0xc33a25f8  ! 296: STDF_I	std	%f1, [0x05f8, %r8]
	.word 0xccfa2f58  ! 297: SWAPA_I	swapa	%r6, [%r8 + 0x0f58] %asi
	.word 0xc4da2b34  ! 298: LDXA_I	ldxa	[%r8, + 0x0b34] %asi, %r2
	.word 0xec1a245c  ! 299: LDD_I	ldd	[%r8 + 0x045c], %r22
	.word 0x8c7228d8  ! 301: UDIV_I	udiv 	%r8, 0x08d8, %r6
	.word 0xc4c224d0  ! 302: LDSWA_I	ldswa	[%r8, + 0x04d0] %asi, %r2
	.word 0xc7220009  ! 303: STF_R	st	%f3, [%r9, %r8]
	.word 0x8e5a0009  ! 304: SMUL_R	smul 	%r8, %r9, %r7
	.word 0x1a800004  ! 305: BCC	bcc  	<label_0x4>
	.word 0xcc522014  ! 306: LDSH_I	ldsh	[%r8 + 0x0014], %r6
	.word 0x8143e011  ! 307: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xc6ea1009  ! 308: LDSTUBA_R	ldstuba	%r3, [%r8 + %r9] 0x80
	.word 0x8d6a0009  ! 309: SDIVX_R	sdivx	%r8, %r9, %r6
	.word 0xc86a0009  ! 310: LDSTUB_R	ldstub	%r4, [%r8 + %r9]
	.word 0xdaf21009  ! 311: STXA_R	stxa	%r13, [%r8 + %r9] 0x80
	.word 0x24800004  ! 312: BLE	ble,a	<label_0x4>
	.word 0xc53a0009  ! 313: STDF_R	std	%f2, [%r9, %r8]
	.word 0x20800008  ! 314: BN	bn,a	<label_0x8>
	.word 0x9efa2e60  ! 315: SDIVcc_I	sdivcc 	%r8, 0x0e60, %r15
	.word 0xc5e21009  ! 316: CASA_I	casa	[%r8] 0x80, %r9, %r2
	.word 0xcd3a0009  ! 317: STDF_R	std	%f6, [%r9, %r8]
	.word 0x1e800004  ! 318: BVC	bvc  	<label_0x4>
	.word 0x8da208a9  ! 319: FSUBs	fsubs	%f8, %f9, %f6
	.word 0xc2a21009  ! 320: STWA_R	stwa	%r1, [%r8 + %r9] 0x80
	.word 0xf25a0009  ! 321: LDX_R	ldx	[%r8 + %r9], %r25
	.word 0xd4022ac4  ! 322: LDUW_I	lduw	[%r8 + 0x0ac4], %r10
	.word 0x30800008  ! 323: BA	ba,a	<label_0x8>
	.word 0xc3ea2738  ! 324: PREFETCHA_I	prefetcha	[%r8, + 0x0738] %asi, #one_read
	.word 0xf0921009  ! 326: LDUHA_R	lduha	[%r8, %r9] 0x80, %r24
	.word 0x8143e011  ! 328: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xcac21009  ! 329: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r5
	.word 0xe12225ec  ! 330: STF_I	st	%f16, [0x05ec, %r8]
	.word 0xc6122a38  ! 331: LDUH_I	lduh	[%r8 + 0x0a38], %r3
	.word 0xc2ca2740  ! 332: LDSBA_I	ldsba	[%r8, + 0x0740] %asi, %r1
	.word 0x02ca0004  ! 333: BRZ	brz  ,pt	%8,<label_0xa0004>
	.word 0xc3e21009  ! 334: CASA_I	casa	[%r8] 0x80, %r9, %r1
	.word 0xc5f21009  ! 335: CASXA_I	casxa	[%r8] 0x80, %r9, %r2
	.word 0x8143c000  ! 336: STBAR	stbar
	.word 0x84d22bb0  ! 337: UMULcc_I	umulcc 	%r8, 0x0bb0, %r2
	.word 0xc6520009  ! 338: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0x0aca0004  ! 339: BRNZ	brnz  ,pt	%8,<label_0xa0004>
	.word 0xe7e22009  ! 340: CASA_R	casa	[%r8] %asi, %r9, %r19
	.word 0x0ac20004  ! 341: BRNZ	brnz  ,nt	%8,<label_0x20004>
	.word 0xa7a20929  ! 342: FMULs	fmuls	%f8, %f9, %f19
	.word 0x8143e011  ! 343: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xfb220009  ! 344: STF_R	st	%f29, [%r9, %r8]
	.word 0x06800004  ! 345: BL	bl  	<label_0x4>
	.word 0xf0ba2678  ! 346: STDA_I	stda	%r24, [%r8 + 0x0678] %asi
	.word 0xc36a1009  ! 347: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xccda1009  ! 348: LDXA_R	ldxa	[%r8, %r9] 0x80, %r6
	.word 0xf1220009  ! 350: STF_R	st	%f24, [%r9, %r8]
	.word 0x82f220e8  ! 352: UDIVcc_I	udivcc 	%r8, 0x00e8, %r1
	.word 0xcef22af0  ! 353: STXA_I	stxa	%r7, [%r8 + 0x0af0] %asi
	.word 0x84720009  ! 354: UDIV_R	udiv 	%r8, %r9, %r2
	.word 0xacf20009  ! 355: UDIVcc_R	udivcc 	%r8, %r9, %r22
	.word 0xeafa1009  ! 356: SWAPA_R	swapa	%r21, [%r8 + %r9] 0x80
	.word 0xc93a0009  ! 357: STDF_R	std	%f4, [%r9, %r8]
	.word 0x0ec20004  ! 358: BRGEZ	brgez  ,nt	%8,<label_0x20004>
	.word 0xcaaa1009  ! 359: STBA_R	stba	%r5, [%r8 + %r9] 0x80
	.word 0x824a0009  ! 360: MULX_R	mulx 	%r8, %r9, %r1
	.word 0xc4a22214  ! 361: STWA_I	stwa	%r2, [%r8 + 0x0214] %asi
	.word 0xc7f22009  ! 362: CASXA_R	casxa	[%r8]%asi, %r9, %r3
	.word 0xcec227c8  ! 363: LDSWA_I	ldswa	[%r8, + 0x07c8] %asi, %r7
	.word 0x8143e011  ! 364: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xcb22261c  ! 365: STF_I	st	%f5, [0x061c, %r8]
	.word 0xae520009  ! 366: UMUL_R	umul 	%r8, %r9, %r23
	.word 0xaaf2294c  ! 367: UDIVcc_I	udivcc 	%r8, 0x094c, %r21
	.word 0xe6a21009  ! 368: STWA_R	stwa	%r19, [%r8 + %r9] 0x80
	.word 0xf8ba1009  ! 369: STDA_R	stda	%r28, [%r8 + %r9] 0x80
	.word 0xb65a0009  ! 370: SMUL_R	smul 	%r8, %r9, %r27
	.word 0x845a20f0  ! 371: SMUL_I	smul 	%r8, 0x00f0, %r2
	.word 0x8143c000  ! 372: STBAR	stbar
	.word 0x8143e011  ! 373: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xcc4a2520  ! 374: LDSB_I	ldsb	[%r8 + 0x0520], %r6
	.word 0x9cda22e8  ! 375: SMULcc_I	smulcc 	%r8, 0x02e8, %r14
	.word 0xceda25cc  ! 376: LDXA_I	ldxa	[%r8, + 0x05cc] %asi, %r7
	.word 0x8eda2d30  ! 377: SMULcc_I	smulcc 	%r8, 0x0d30, %r7
	.word 0xb86a0009  ! 378: UDIVX_R	udivx 	%r8, %r9, %r28
	.word 0x86f20009  ! 379: UDIVcc_R	udivcc 	%r8, %r9, %r3
	.word 0xc46a2000  ! 380: LDSTUB_I	ldstub	%r2, [%r8 + 0x0000]
	.word 0xc36a2fd4  ! 381: PREFETCH_I	prefetch	[%r8 + 0x0fd4], #one_read
	.word 0x99a20829  ! 383: FADDs	fadds	%f8, %f9, %f12
	.word 0xccca1009  ! 384: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r6
	.word 0xc6ca28e8  ! 385: LDSBA_I	ldsba	[%r8, + 0x08e8] %asi, %r3
	.word 0x8143e011  ! 386: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xc6d22360  ! 387: LDSHA_I	ldsha	[%r8, + 0x0360] %asi, %r3
	.word 0x8143c000  ! 388: STBAR	stbar
	.word 0x0cc20004  ! 389: BRGZ	brgz  ,nt	%8,<label_0x20004>
	.word 0x0eca0008  ! 392: BRGEZ	brgez  ,pt	%8,<label_0xa0008>
	.word 0x825a0009  ! 393: SMUL_R	smul 	%r8, %r9, %r1
	.word 0x8143c000  ! 394: STBAR	stbar
	.word 0xf4ba2ea0  ! 395: STDA_I	stda	%r26, [%r8 + 0x0ea0] %asi
	.word 0xe9e21009  ! 396: CASA_I	casa	[%r8] 0x80, %r9, %r20
	.word 0xe4c22384  ! 397: LDSWA_I	ldswa	[%r8, + 0x0384] %asi, %r18
	.word 0x28800004  ! 398: BLEU	bleu,a	<label_0x4>
	.word 0xdefa2b3c  ! 399: SWAPA_I	swapa	%r15, [%r8 + 0x0b3c] %asi
	.word 0xc2a22894  ! 400: STWA_I	stwa	%r1, [%r8 + 0x0894] %asi
	.word 0xeeaa2cf8  ! 401: STBA_I	stba	%r23, [%r8 + 0x0cf8] %asi
	.word 0x8143e011  ! 402: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xe8b21009  ! 403: STHA_R	stha	%r20, [%r8 + %r9] 0x80
	.word 0xf7f21009  ! 404: CASXA_I	casxa	[%r8] 0x80, %r9, %r27
	.word 0xa0da23b0  ! 405: SMULcc_I	smulcc 	%r8, 0x03b0, %r16
	.word 0x16800004  ! 406: BGE	bge  	<label_0x4>
	.word 0x8a6a2938  ! 407: UDIVX_I	udivx 	%r8, 0x0938, %r5
	.word 0xec9a2fd8  ! 408: LDDA_I	ldda	[%r8, + 0x0fd8] %asi, %r22
	.word 0x8efa201c  ! 409: SDIVcc_I	sdivcc 	%r8, 0x001c, %r7
	.word 0xc64a0009  ! 410: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xf6c21009  ! 411: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r27
	.word 0x8a7a266c  ! 412: SDIV_I	sdiv 	%r8, 0x066c, %r5
	.word 0x8ba209a9  ! 413: FDIVs	fdivs	%f8, %f9, %f5
	.word 0xc4f22ea8  ! 414: STXA_I	stxa	%r2, [%r8 + 0x0ea8] %asi
	.word 0x87a20829  ! 415: FADDs	fadds	%f8, %f9, %f3
	.word 0xce922a20  ! 416: LDUHA_I	lduha	[%r8, + 0x0a20] %asi, %r7
	.word 0xc2da24f0  ! 417: LDXA_I	ldxa	[%r8, + 0x04f0] %asi, %r1
	.word 0x8143c000  ! 418: STBAR	stbar
	.word 0x8143c000  ! 419: STBAR	stbar
	.word 0x826a2a34  ! 420: UDIVX_I	udivx 	%r8, 0x0a34, %r1
	.word 0xe26a0009  ! 421: LDSTUB_R	ldstub	%r17, [%r8 + %r9]
	.word 0x85a209a9  ! 422: FDIVs	fdivs	%f8, %f9, %f2
	.word 0x88f20009  ! 423: UDIVcc_R	udivcc 	%r8, %r9, %r4
	.word 0xc86a275c  ! 424: LDSTUB_I	ldstub	%r4, [%r8 + 0x075c]
	.word 0xc24a2300  ! 425: LDSB_I	ldsb	[%r8 + 0x0300], %r1
	.word 0xcca22fc8  ! 426: STWA_I	stwa	%r6, [%r8 + 0x0fc8] %asi
	.word 0x8143e011  ! 427: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xfafa1009  ! 428: SWAPA_R	swapa	%r29, [%r8 + %r9] 0x80
	.word 0xc93a0009  ! 429: STDF_R	std	%f4, [%r9, %r8]
	.word 0x8143c000  ! 430: STBAR	stbar
	.word 0xc8ca1009  ! 431: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r4
	.word 0x26ca0004  ! 432: BRLZ	brlz,a,pt	%8,<label_0xa0004>
	.word 0x8a720009  ! 433: UDIV_R	udiv 	%r8, %r9, %r5
	.word 0xc8b2268c  ! 434: STHA_I	stha	%r4, [%r8 + 0x068c] %asi
	.word 0x884a2350  ! 435: MULX_I	mulx 	%r8, 0x0350, %r4
	.word 0x86da2e3c  ! 436: SMULcc_I	smulcc 	%r8, 0x0e3c, %r3
	.word 0xc3ea1009  ! 437: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc4c22d28  ! 438: LDSWA_I	ldswa	[%r8, + 0x0d28] %asi, %r2
	.word 0xdeca29a8  ! 439: LDSBA_I	ldsba	[%r8, + 0x09a8] %asi, %r15
	.word 0x8143e011  ! 440: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x8143c000  ! 441: STBAR	stbar
	.word 0x8eda0009  ! 442: SMULcc_R	smulcc 	%r8, %r9, %r7
	.word 0xc45a2bac  ! 443: LDX_I	ldx	[%r8 + 0x0bac], %r2
	.word 0xbfa209a9  ! 444: FDIVs	fdivs	%f8, %f9, %f31
	.word 0x36800004  ! 445: BGE	bge,a	<label_0x4>
	.word 0x40000004  ! 446: CALL	call	disp30_4
	.word 0xcd220009  ! 447: STF_R	st	%f6, [%r9, %r8]
	.word 0xce921009  ! 448: LDUHA_R	lduha	[%r8, %r9] 0x80, %r7
	.word 0x82f20009  ! 449: UDIVcc_R	udivcc 	%r8, %r9, %r1
	.word 0xcc122344  ! 450: LDUH_I	lduh	[%r8 + 0x0344], %r6
	.word 0xc36a1009  ! 451: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0x8cf20009  ! 452: UDIVcc_R	udivcc 	%r8, %r9, %r6
	.word 0xc6c21009  ! 453: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r3
	.word 0x8143e011  ! 454: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xc67a0009  ! 455: SWAP_R	swap	%r3, [%r8 + %r9]
	.word 0xc3222d48  ! 456: STF_I	st	%f1, [0x0d48, %r8]
	.word 0x8efa21f0  ! 457: SDIVcc_I	sdivcc 	%r8, 0x01f0, %r7
	.word 0xbba209a9  ! 458: FDIVs	fdivs	%f8, %f9, %f29
	.word 0xb8da2038  ! 459: SMULcc_I	smulcc 	%r8, 0x0038, %r28
	.word 0xc4b22ef0  ! 460: STHA_I	stha	%r2, [%r8 + 0x0ef0] %asi
	.word 0xf2ca28d4  ! 461: LDSBA_I	ldsba	[%r8, + 0x08d4] %asi, %r25
	.word 0xc8c21009  ! 462: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r4
	.word 0x83a208a9  ! 463: FSUBs	fsubs	%f8, %f9, %f1
	.word 0xe4b21009  ! 464: STHA_R	stha	%r18, [%r8 + %r9] 0x80
	.word 0x8ba209a9  ! 465: FDIVs	fdivs	%f8, %f9, %f5
	.word 0xc36a2d1c  ! 466: PREFETCH_I	prefetch	[%r8 + 0x0d1c], #one_read
	.word 0xc2022348  ! 467: LDUW_I	lduw	[%r8 + 0x0348], %r1
	.word 0x8fa209a9  ! 468: FDIVs	fdivs	%f8, %f9, %f7
	.word 0xe66a0009  ! 469: LDSTUB_R	ldstub	%r19, [%r8 + %r9]
	.word 0xee6a0009  ! 470: LDSTUB_R	ldstub	%r23, [%r8 + %r9]
	.word 0x8c722ec0  ! 471: UDIV_I	udiv 	%r8, 0x0ec0, %r6
	.word 0xeff22009  ! 472: CASXA_R	casxa	[%r8]%asi, %r9, %r23
	.word 0x9c720009  ! 473: UDIV_R	udiv 	%r8, %r9, %r14
	.word 0xd882299c  ! 474: LDUWA_I	lduwa	[%r8, + 0x099c] %asi, %r12
	.word 0xc4a221cc  ! 475: STWA_I	stwa	%r2, [%r8 + 0x01cc] %asi
	.word 0xc2fa2b1c  ! 476: SWAPA_I	swapa	%r1, [%r8 + 0x0b1c] %asi
	.word 0xd8ca2618  ! 477: LDSBA_I	ldsba	[%r8, + 0x0618] %asi, %r12
	.word 0x40000004  ! 478: CALL	call	disp30_4
	.word 0xfff21009  ! 479: CASXA_I	casxa	[%r8] 0x80, %r9, %r31
	.word 0xf87a26c4  ! 480: SWAP_I	swap	%r28, [%r8 + 0x06c4]
	.word 0xeeca20f8  ! 481: LDSBA_I	ldsba	[%r8, + 0x00f8] %asi, %r23
	.word 0xc20a0009  ! 482: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xc3ea2a88  ! 483: PREFETCHA_I	prefetcha	[%r8, + 0x0a88] %asi, #one_read
	.word 0xc4d22e7c  ! 484: LDSHA_I	ldsha	[%r8, + 0x0e7c] %asi, %r2
	.word 0x864a2128  ! 485: MULX_I	mulx 	%r8, 0x0128, %r3
	.word 0xf4f22438  ! 487: STXA_I	stxa	%r26, [%r8 + 0x0438] %asi
	.word 0x08800004  ! 488: BLEU	bleu  	<label_0x4>
	.word 0x8143e011  ! 489: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x40000004  ! 490: CALL	call	disp30_4
	.word 0xed222034  ! 492: STF_I	st	%f22, [0x0034, %r8]
	.word 0x26c20008  ! 493: BRLZ	brlz,a,nt	%8,<label_0x20008>
	.word 0x22800008  ! 494: BE	be,a	<label_0x8>
	.word 0xe81a0009  ! 495: LDD_R	ldd	[%r8 + %r9], %r20
	.word 0xe04221ec  ! 496: LDSW_I	ldsw	[%r8 + 0x01ec], %r16
	.word 0xc80a2ef8  ! 497: LDUB_I	ldub	[%r8 + 0x0ef8], %r4
	.word 0xcef21009  ! 498: STXA_R	stxa	%r7, [%r8 + %r9] 0x80
	.word 0xd4ca1009  ! 499: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r10
	.word 0xf3f21009  ! 500: CASXA_I	casxa	[%r8] 0x80, %r9, %r25
	.word 0xcb2229e0  ! 501: STF_I	st	%f5, [0x09e0, %r8]
	.word 0xc8aa1009  ! 502: STBA_R	stba	%r4, [%r8 + %r9] 0x80
	.word 0x8143e011  ! 503: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xcafa24c4  ! 504: SWAPA_I	swapa	%r5, [%r8 + 0x04c4] %asi
	.word 0x1c800004  ! 505: BPOS	bpos  	<label_0x4>
	.word 0xc7f21009  ! 506: CASXA_I	casxa	[%r8] 0x80, %r9, %r3
	.word 0xc6020009  ! 507: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0x0cca0004  ! 508: BRGZ	brgz  ,pt	%8,<label_0xa0004>
	.word 0x3a800004  ! 509: BCC	bcc,a	<label_0x4>
	.word 0xc36a27cc  ! 510: PREFETCH_I	prefetch	[%r8 + 0x07cc], #one_read
	.word 0xb2f220a4  ! 511: UDIVcc_I	udivcc 	%r8, 0x00a4, %r25
	.word 0xc45a0009  ! 512: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xc40a21ac  ! 513: LDUB_I	ldub	[%r8 + 0x01ac], %r2
	.word 0xbada26ac  ! 514: SMULcc_I	smulcc 	%r8, 0x06ac, %r29
	.word 0xc6da2604  ! 515: LDXA_I	ldxa	[%r8, + 0x0604] %asi, %r3
	.word 0x84520009  ! 516: UMUL_R	umul 	%r8, %r9, %r2
	.word 0xa5a20829  ! 518: FADDs	fadds	%f8, %f9, %f18
	.word 0xc6a22b80  ! 519: STWA_I	stwa	%r3, [%r8 + 0x0b80] %asi
	.word 0x8143e011  ! 520: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x8143c000  ! 521: STBAR	stbar
	.word 0x8143c000  ! 523: STBAR	stbar
	.word 0xc9220009  ! 524: STF_R	st	%f4, [%r9, %r8]
	.word 0xc36a1009  ! 525: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc8aa23e4  ! 526: STBA_I	stba	%r4, [%r8 + 0x03e4] %asi
	.word 0x886a2e6c  ! 527: UDIVX_I	udivx 	%r8, 0x0e6c, %r4
	.word 0x8c5a0009  ! 528: SMUL_R	smul 	%r8, %r9, %r6
	.word 0x8143e011  ! 529: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x8c7a0009  ! 530: SDIV_R	sdiv 	%r8, %r9, %r6
	.word 0xccfa1009  ! 532: SWAPA_R	swapa	%r6, [%r8 + %r9] 0x80
	.word 0x8143e011  ! 533: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xc6520009  ! 534: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xc6520009  ! 535: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xdc9a22cc  ! 536: LDDA_I	ldda	[%r8, + 0x02cc] %asi, %r14
	.word 0x08800004  ! 537: BLEU	bleu  	<label_0x4>
	.word 0x98720009  ! 538: UDIV_R	udiv 	%r8, %r9, %r12
	.word 0xc3ea27d4  ! 539: PREFETCHA_I	prefetcha	[%r8, + 0x07d4] %asi, #one_read
	.word 0xcc4a29d4  ! 540: LDSB_I	ldsb	[%r8 + 0x09d4], %r6
	.word 0xc4122608  ! 541: LDUH_I	lduh	[%r8 + 0x0608], %r2
	.word 0xf68a2c18  ! 542: LDUBA_I	lduba	[%r8, + 0x0c18] %asi, %r27
	.word 0x8143e011  ! 543: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xc66a2b30  ! 544: LDSTUB_I	ldstub	%r3, [%r8 + 0x0b30]
	.word 0xd49a1009  ! 545: LDDA_R	ldda	[%r8, %r9] 0x80, %r10
	.word 0x8143e011  ! 546: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xca6a2cf0  ! 547: LDSTUB_I	ldstub	%r5, [%r8 + 0x0cf0]
	.word 0xc49a2b54  ! 548: LDDA_I	ldda	[%r8, + 0x0b54] %asi, %r2
	.word 0x88d22830  ! 549: UMULcc_I	umulcc 	%r8, 0x0830, %r4
	.word 0x8143c000  ! 550: STBAR	stbar
	.word 0xc36a2e9c  ! 551: PREFETCH_I	prefetch	[%r8 + 0x0e9c], #one_read
	.word 0x82da2b24  ! 552: SMULcc_I	smulcc 	%r8, 0x0b24, %r1
	.word 0xc9e22009  ! 553: CASA_R	casa	[%r8] %asi, %r9, %r4
	.word 0xc8b21009  ! 554: STHA_R	stha	%r4, [%r8 + %r9] 0x80
	.word 0x8e720009  ! 555: UDIV_R	udiv 	%r8, %r9, %r7
	.word 0xca9221c4  ! 558: LDUHA_I	lduha	[%r8, + 0x01c4] %asi, %r5
	.word 0xbf6a0009  ! 559: SDIVX_R	sdivx	%r8, %r9, %r31
	.word 0xd4a21009  ! 560: STWA_R	stwa	%r10, [%r8 + %r9] 0x80
	.word 0xd8a22f28  ! 561: STWA_I	stwa	%r12, [%r8 + 0x0f28] %asi
	.word 0x82da26f8  ! 562: SMULcc_I	smulcc 	%r8, 0x06f8, %r1
	.word 0xc86a22d4  ! 563: LDSTUB_I	ldstub	%r4, [%r8 + 0x02d4]
	.word 0x02800004  ! 564: BE	be  	<label_0x4>
	.word 0xc3ea1009  ! 565: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xcafa2550  ! 566: SWAPA_I	swapa	%r5, [%r8 + 0x0550] %asi
	.word 0xefe21009  ! 568: CASA_I	casa	[%r8] 0x80, %r9, %r23
	.word 0xc6520009  ! 569: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xf2a2228c  ! 570: STWA_I	stwa	%r25, [%r8 + 0x028c] %asi
	.word 0xcc7a0009  ! 571: SWAP_R	swap	%r6, [%r8 + %r9]
	.word 0xc73a2148  ! 572: STDF_I	std	%f3, [0x0148, %r8]
	.word 0xcafa1009  ! 573: SWAPA_R	swapa	%r5, [%r8 + %r9] 0x80
	.word 0x9a7a0009  ! 574: SDIV_R	sdiv 	%r8, %r9, %r13
	.word 0x8143c000  ! 575: STBAR	stbar
	.word 0xe73a2a58  ! 576: STDF_I	std	%f19, [0x0a58, %r8]
	.word 0xc60a0009  ! 578: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xc45a216c  ! 579: LDX_I	ldx	[%r8 + 0x016c], %r2
	.word 0x84d20009  ! 580: UMULcc_R	umulcc 	%r8, %r9, %r2
	.word 0xd7f21009  ! 581: CASXA_I	casxa	[%r8] 0x80, %r9, %r11
	.word 0x8143c000  ! 582: STBAR	stbar
	.word 0xcea225b0  ! 583: STWA_I	stwa	%r7, [%r8 + 0x05b0] %asi
	.word 0xc3ea2828  ! 584: PREFETCHA_I	prefetcha	[%r8, + 0x0828] %asi, #one_read
	.word 0xc67a295c  ! 585: SWAP_I	swap	%r3, [%r8 + 0x095c]
	.word 0xc8d22208  ! 586: LDSHA_I	ldsha	[%r8, + 0x0208] %asi, %r4
	.word 0x8143c000  ! 587: STBAR	stbar
	.word 0x85a209a9  ! 588: FDIVs	fdivs	%f8, %f9, %f2
	.word 0xecb21009  ! 589: STHA_R	stha	%r22, [%r8 + %r9] 0x80
	.word 0xc4020009  ! 590: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0x856a23b0  ! 591: SDIVX_I	sdivx	%r8, 0x03b0, %r2
	.word 0x847a0009  ! 592: SDIV_R	sdiv 	%r8, %r9, %r2
	.word 0xc7f21009  ! 593: CASXA_I	casxa	[%r8] 0x80, %r9, %r3
	.word 0x8143c000  ! 594: STBAR	stbar
	.word 0x86f20009  ! 595: UDIVcc_R	udivcc 	%r8, %r9, %r3
	.word 0xc2fa2130  ! 596: SWAPA_I	swapa	%r1, [%r8 + 0x0130] %asi
	.word 0xeaa2207c  ! 597: STWA_I	stwa	%r21, [%r8 + 0x007c] %asi
	.word 0xce8a22d0  ! 598: LDUBA_I	lduba	[%r8, + 0x02d0] %asi, %r7
	.word 0xc9f21009  ! 599: CASXA_I	casxa	[%r8] 0x80, %r9, %r4
	.word 0x88522410  ! 600: UMUL_I	umul 	%r8, 0x0410, %r4
	.word 0x83220009  ! 601: MULScc_R	mulscc 	%r8, %r9, %r1
	.word 0xe7220009  ! 602: STF_R	st	%f19, [%r9, %r8]
	.word 0xc2d21009  ! 603: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r1
	.word 0x2cc20008  ! 604: BRGZ	brgz,a,nt	%8,<label_0x20008>
	.word 0xbe6a2064  ! 605: UDIVX_I	udivx 	%r8, 0x0064, %r31
	.word 0x8143e011  ! 606: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x89a20929  ! 607: FMULs	fmuls	%f8, %f9, %f4
	.word 0xe0d22ba0  ! 608: LDSHA_I	ldsha	[%r8, + 0x0ba0] %asi, %r16
	.word 0x40000004  ! 609: CALL	call	disp30_4
	.word 0x8af22830  ! 610: UDIVcc_I	udivcc 	%r8, 0x0830, %r5
	.word 0xee0a0009  ! 611: LDUB_R	ldub	[%r8 + %r9], %r23
	.word 0xcaca1009  ! 612: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r5
	.word 0x8143e011  ! 613: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x24800008  ! 614: BLE	ble,a	<label_0x8>
	.word 0xce020009  ! 615: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xa6d22fa8  ! 616: UMULcc_I	umulcc 	%r8, 0x0fa8, %r19
	.word 0xc36a2990  ! 617: PREFETCH_I	prefetch	[%r8 + 0x0990], #one_read
	.word 0x8143e011  ! 620: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xfeda1009  ! 621: LDXA_R	ldxa	[%r8, %r9] 0x80, %r31
	.word 0x87a208a9  ! 622: FSUBs	fsubs	%f8, %f9, %f3
	.word 0xc4a21009  ! 623: STWA_R	stwa	%r2, [%r8 + %r9] 0x80
	.word 0xe8a21009  ! 624: STWA_R	stwa	%r20, [%r8 + %r9] 0x80
	.word 0xc8ea2994  ! 625: LDSTUBA_I	ldstuba	%r4, [%r8 + 0x0994] %asi
	.word 0xce4221a0  ! 626: LDSW_I	ldsw	[%r8 + 0x01a0], %r7
	.word 0x26800004  ! 627: BL	bl,a	<label_0x4>
	.word 0xdc1a2c3c  ! 629: LDD_I	ldd	[%r8 + 0x0c3c], %r14
	.word 0x8143c000  ! 630: STBAR	stbar
	.word 0x8143c000  ! 631: STBAR	stbar
	.word 0xc3ea2bc0  ! 632: PREFETCHA_I	prefetcha	[%r8, + 0x0bc0] %asi, #one_read
	.word 0xc3e22009  ! 633: CASA_R	casa	[%r8] %asi, %r9, %r1
	.word 0x8143e011  ! 634: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x0c800004  ! 635: BNEG	bneg  	<label_0x4>
	.word 0xee0a0009  ! 636: LDUB_R	ldub	[%r8 + %r9], %r23
	.word 0xf48a1009  ! 638: LDUBA_R	lduba	[%r8, %r9] 0x80, %r26
	.word 0xe4fa27e8  ! 639: SWAPA_I	swapa	%r18, [%r8 + 0x07e8] %asi
	.word 0x85a209a9  ! 640: FDIVs	fdivs	%f8, %f9, %f2
	.word 0xca821009  ! 641: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r5
	.word 0xc49a1009  ! 642: LDDA_R	ldda	[%r8, %r9] 0x80, %r2
	.word 0xca022220  ! 643: LDUW_I	lduw	[%r8 + 0x0220], %r5
	.word 0x8143c000  ! 644: STBAR	stbar
	.word 0xc4b22c8c  ! 645: STHA_I	stha	%r2, [%r8 + 0x0c8c] %asi
	.word 0xcb3a0009  ! 646: STDF_R	std	%f5, [%r9, %r8]
	.word 0x8143e011  ! 647: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x2aca0008  ! 648: BRNZ	brnz,a,pt	%8,<label_0xa0008>
	.word 0x8143c000  ! 649: STBAR	stbar
	.word 0x827a2418  ! 650: SDIV_I	sdiv 	%r8, 0x0418, %r1
	.word 0xf81a2620  ! 651: LDD_I	ldd	[%r8 + 0x0620], %r28
	.word 0xdcaa29bc  ! 652: STBA_I	stba	%r14, [%r8 + 0x09bc] %asi
	.word 0x8143e011  ! 653: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x0e800008  ! 654: BVS	bvs  	<label_0x8>
	.word 0xa46a2ea0  ! 655: UDIVX_I	udivx 	%r8, 0x0ea0, %r18
	.word 0x9cda0009  ! 656: SMULcc_R	smulcc 	%r8, %r9, %r14
	.word 0xd66a0009  ! 657: LDSTUB_R	ldstub	%r11, [%r8 + %r9]
	.word 0xc36a2cf8  ! 658: PREFETCH_I	prefetch	[%r8 + 0x0cf8], #one_read
	.word 0xd4b226ac  ! 659: STHA_I	stha	%r10, [%r8 + 0x06ac] %asi
	.word 0xb16a24ac  ! 660: SDIVX_I	sdivx	%r8, 0x04ac, %r24
	.word 0xdaca217c  ! 661: LDSBA_I	ldsba	[%r8, + 0x017c] %asi, %r13
	.word 0x40000004  ! 663: CALL	call	disp30_4
	.word 0xceea2368  ! 664: LDSTUBA_I	ldstuba	%r7, [%r8 + 0x0368] %asi
	.word 0x88d20009  ! 665: UMULcc_R	umulcc 	%r8, %r9, %r4
	.word 0xd7222b80  ! 667: STF_I	st	%f11, [0x0b80, %r8]
	.word 0xcab22190  ! 669: STHA_I	stha	%r5, [%r8 + 0x0190] %asi
	.word 0x8143c000  ! 670: STBAR	stbar
	.word 0xce7a275c  ! 671: SWAP_I	swap	%r7, [%r8 + 0x075c]
	.word 0x0ac20008  ! 672: BRNZ	brnz  ,nt	%8,<label_0x20008>
	.word 0xc4f21009  ! 673: STXA_R	stxa	%r2, [%r8 + %r9] 0x80
	.word 0xc36a2944  ! 674: PREFETCH_I	prefetch	[%r8 + 0x0944], #one_read
	.word 0xc3222654  ! 675: STF_I	st	%f1, [0x0654, %r8]
	.word 0xb2d20009  ! 677: UMULcc_R	umulcc 	%r8, %r9, %r25
	.word 0x28800008  ! 678: BLEU	bleu,a	<label_0x8>
	.word 0xc93a0009  ! 679: STDF_R	std	%f4, [%r9, %r8]
	.word 0x8143e011  ! 680: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x26800004  ! 681: BL	bl,a	<label_0x4>
	.word 0xc26a2b78  ! 682: LDSTUB_I	ldstub	%r1, [%r8 + 0x0b78]
	.word 0x8322204c  ! 683: MULScc_I	mulscc 	%r8, 0x004c, %r1
	.word 0xfca22e4c  ! 685: STWA_I	stwa	%r30, [%r8 + 0x0e4c] %asi
	.word 0xce122fec  ! 686: LDUH_I	lduh	[%r8 + 0x0fec], %r7
	.word 0xcab22c98  ! 687: STHA_I	stha	%r5, [%r8 + 0x0c98] %asi
	.word 0x86522514  ! 688: UMUL_I	umul 	%r8, 0x0514, %r3
	.word 0xeeaa1009  ! 689: STBA_R	stba	%r23, [%r8 + %r9] 0x80
	.word 0xcc5a0009  ! 690: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xc93a2698  ! 691: STDF_I	std	%f4, [0x0698, %r8]
	.word 0x8a520009  ! 692: UMUL_R	umul 	%r8, %r9, %r5
	.word 0xc36a2fb4  ! 693: PREFETCH_I	prefetch	[%r8 + 0x0fb4], #one_read
	.word 0x06800004  ! 694: BL	bl  	<label_0x4>
	.word 0x88f229d4  ! 695: UDIVcc_I	udivcc 	%r8, 0x09d4, %r4
	.word 0xd44a2c90  ! 696: LDSB_I	ldsb	[%r8 + 0x0c90], %r10
	.word 0xc8f22c2c  ! 697: STXA_I	stxa	%r4, [%r8 + 0x0c2c] %asi
	.word 0x864a0009  ! 698: MULX_R	mulx 	%r8, %r9, %r3
	.word 0xceda1009  ! 699: LDXA_R	ldxa	[%r8, %r9] 0x80, %r7
	.word 0x8cda24e4  ! 700: SMULcc_I	smulcc 	%r8, 0x04e4, %r6
	.word 0xc5f21009  ! 701: CASXA_I	casxa	[%r8] 0x80, %r9, %r2
	.word 0xaf220009  ! 702: MULScc_R	mulscc 	%r8, %r9, %r23
	.word 0x8143c000  ! 703: STBAR	stbar
	.word 0xc7e21009  ! 704: CASA_I	casa	[%r8] 0x80, %r9, %r3
	.word 0x8a5225a8  ! 705: UMUL_I	umul 	%r8, 0x05a8, %r5
	.word 0x88522d28  ! 706: UMUL_I	umul 	%r8, 0x0d28, %r4
	.word 0xc40a23fc  ! 707: LDUB_I	ldub	[%r8 + 0x03fc], %r2
	.word 0xea921009  ! 708: LDUHA_R	lduha	[%r8, %r9] 0x80, %r21
	.word 0xc3ea1009  ! 709: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xce122718  ! 710: LDUH_I	lduh	[%r8 + 0x0718], %r7
	.word 0xc65a2bd8  ! 712: LDX_I	ldx	[%r8 + 0x0bd8], %r3
	.word 0xca0a0009  ! 713: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0x96720009  ! 715: UDIV_R	udiv 	%r8, %r9, %r11
	.word 0xca420009  ! 716: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xc86a0009  ! 718: LDSTUB_R	ldstub	%r4, [%r8 + %r9]
	.word 0xa6da2300  ! 719: SMULcc_I	smulcc 	%r8, 0x0300, %r19
	.word 0xd6d21009  ! 720: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r11
	.word 0xcc020009  ! 721: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0x8143e011  ! 722: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x2c800004  ! 723: BNEG	bneg,a	<label_0x4>
	.word 0x22800004  ! 724: BE	be,a	<label_0x4>
	.word 0x83a209a9  ! 725: FDIVs	fdivs	%f8, %f9, %f1
	.word 0xff222c60  ! 726: STF_I	st	%f31, [0x0c60, %r8]
	.word 0xd8ba1009  ! 727: STDA_R	stda	%r12, [%r8 + %r9] 0x80
	.word 0x2a800004  ! 728: BCS	bcs,a	<label_0x4>
	.word 0x8fa209a9  ! 729: FDIVs	fdivs	%f8, %f9, %f7
	.word 0x8c5a0009  ! 730: SMUL_R	smul 	%r8, %r9, %r6
	.word 0xeeaa23c4  ! 731: STBA_I	stba	%r23, [%r8 + 0x03c4] %asi
	.word 0xcca21009  ! 732: STWA_R	stwa	%r6, [%r8 + %r9] 0x80
	.word 0x8143e011  ! 733: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xcef21009  ! 734: STXA_R	stxa	%r7, [%r8 + %r9] 0x80
	.word 0xe81a0009  ! 735: LDD_R	ldd	[%r8 + %r9], %r20
	.word 0xc3ea1009  ! 736: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xca022a44  ! 737: LDUW_I	lduw	[%r8 + 0x0a44], %r5
	.word 0x8143c000  ! 738: STBAR	stbar
	.word 0x8da20929  ! 739: FMULs	fmuls	%f8, %f9, %f6
	.word 0x2ac20004  ! 740: BRNZ	brnz,a,nt	%8,<label_0x20004>
	.word 0xa6d20009  ! 741: UMULcc_R	umulcc 	%r8, %r9, %r19
	.word 0xc4922e14  ! 742: LDUHA_I	lduha	[%r8, + 0x0e14] %asi, %r2
	.word 0xb86a2524  ! 743: UDIVX_I	udivx 	%r8, 0x0524, %r28
	.word 0xc9e22009  ! 744: CASA_R	casa	[%r8] %asi, %r9, %r4
	.word 0x8143c000  ! 745: STBAR	stbar
	.word 0xce7a2d5c  ! 746: SWAP_I	swap	%r7, [%r8 + 0x0d5c]
	.word 0xae7a2bdc  ! 747: SDIV_I	sdiv 	%r8, 0x0bdc, %r23
	.word 0x9a5a0009  ! 748: SMUL_R	smul 	%r8, %r9, %r13
	.word 0xc3ea1009  ! 749: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x84fa2768  ! 750: SDIVcc_I	sdivcc 	%r8, 0x0768, %r2
	.word 0xc53a0009  ! 751: STDF_R	std	%f2, [%r9, %r8]
	.word 0xcc8a1009  ! 752: LDUBA_R	lduba	[%r8, %r9] 0x80, %r6
	.word 0xce4a0009  ! 754: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xcf222bc0  ! 755: STF_I	st	%f7, [0x0bc0, %r8]
	.word 0xce6a2634  ! 757: LDSTUB_I	ldstub	%r7, [%r8 + 0x0634]
	.word 0x12800008  ! 758: BNE	bne  	<label_0x8>
	.word 0xc2b226c4  ! 759: STHA_I	stha	%r1, [%r8 + 0x06c4] %asi
	.word 0xe4b224a0  ! 760: STHA_I	stha	%r18, [%r8 + 0x04a0] %asi
	.word 0xe33a2110  ! 761: STDF_I	std	%f17, [0x0110, %r8]
	.word 0xe8aa2598  ! 762: STBA_I	stba	%r20, [%r8 + 0x0598] %asi
	.word 0xcac21009  ! 763: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r5
	.word 0xe13a265c  ! 764: STDF_I	std	%f16, [0x065c, %r8]
	.word 0x8143e011  ! 765: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x40000004  ! 766: CALL	call	disp30_4
	.word 0xdcb21009  ! 767: STHA_R	stha	%r14, [%r8 + %r9] 0x80
	.word 0xcaca1009  ! 768: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r5
	.word 0x8143e011  ! 769: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x82520009  ! 770: UMUL_R	umul 	%r8, %r9, %r1
	.word 0xc40a0009  ! 771: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xcea21009  ! 772: STWA_R	stwa	%r7, [%r8 + %r9] 0x80
	.word 0xf01a0009  ! 773: LDD_R	ldd	[%r8 + %r9], %r24
	.word 0x28800008  ! 774: BLEU	bleu,a	<label_0x8>
	.word 0xc3ea1009  ! 775: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xe0ba1009  ! 776: STDA_R	stda	%r16, [%r8 + %r9] 0x80
	.word 0x8d6a2694  ! 778: SDIVX_I	sdivx	%r8, 0x0694, %r6
	.word 0xc2020009  ! 779: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xce422538  ! 780: LDSW_I	ldsw	[%r8 + 0x0538], %r7
	.word 0xc6922bc4  ! 781: LDUHA_I	lduha	[%r8, + 0x0bc4] %asi, %r3
	.word 0xd4ea1009  ! 782: LDSTUBA_R	ldstuba	%r10, [%r8 + %r9] 0x80
	.word 0xdad22cec  ! 783: LDSHA_I	ldsha	[%r8, + 0x0cec] %asi, %r13
	.word 0x0cca0008  ! 784: BRGZ	brgz  ,pt	%8,<label_0xa0008>
	.word 0xe2da2f68  ! 785: LDXA_I	ldxa	[%r8, + 0x0f68] %asi, %r17
	.word 0xcb3a2474  ! 786: STDF_I	std	%f5, [0x0474, %r8]
	.word 0xceea2c08  ! 787: LDSTUBA_I	ldstuba	%r7, [%r8 + 0x0c08] %asi
	.word 0x06800008  ! 788: BL	bl  	<label_0x8>
	.word 0xa9a208a9  ! 789: FSUBs	fsubs	%f8, %f9, %f20
	.word 0x8143c000  ! 790: STBAR	stbar
	.word 0xc53a2e74  ! 791: STDF_I	std	%f2, [0x0e74, %r8]
	.word 0xfcb21009  ! 792: STHA_R	stha	%r30, [%r8 + %r9] 0x80
	.word 0xfeda23e0  ! 793: LDXA_I	ldxa	[%r8, + 0x03e0] %asi, %r31
	.word 0xfc821009  ! 794: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r30
	.word 0xca122fdc  ! 795: LDUH_I	lduh	[%r8 + 0x0fdc], %r5
	.word 0xc36a2868  ! 796: PREFETCH_I	prefetch	[%r8 + 0x0868], #one_read
	.word 0x9e4a0009  ! 798: MULX_R	mulx 	%r8, %r9, %r15
	.word 0x8143c000  ! 799: STBAR	stbar
	.word 0x8143e011  ! 800: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xaada0009  ! 802: SMULcc_R	smulcc 	%r8, %r9, %r21
	.word 0xe81a0009  ! 803: LDD_R	ldd	[%r8 + %r9], %r20
	.word 0x8143c000  ! 804: STBAR	stbar
	.word 0xcefa1009  ! 805: SWAPA_R	swapa	%r7, [%r8 + %r9] 0x80
	.word 0xc65a0009  ! 806: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xceaa1009  ! 807: STBA_R	stba	%r7, [%r8 + %r9] 0x80
	.word 0xe27a0009  ! 808: SWAP_R	swap	%r17, [%r8 + %r9]
	.word 0xcaea2648  ! 809: LDSTUBA_I	ldstuba	%r5, [%r8 + 0x0648] %asi
	.word 0x0e800004  ! 810: BVS	bvs  	<label_0x4>
	.word 0xe93a0009  ! 811: STDF_R	std	%f20, [%r9, %r8]
	.word 0xceaa1009  ! 812: STBA_R	stba	%r7, [%r8 + %r9] 0x80
	.word 0xa6da21f0  ! 813: SMULcc_I	smulcc 	%r8, 0x01f0, %r19
	.word 0xc4b220bc  ! 814: STHA_I	stha	%r2, [%r8 + 0x00bc] %asi
	.word 0x896a2408  ! 815: SDIVX_I	sdivx	%r8, 0x0408, %r4
	.word 0xbd2228b0  ! 816: MULScc_I	mulscc 	%r8, 0x08b0, %r30
	.word 0xa2fa0009  ! 817: SDIVcc_R	sdivcc 	%r8, %r9, %r17
	.word 0xc36a224c  ! 818: PREFETCH_I	prefetch	[%r8 + 0x024c], #one_read
	.word 0xdcda1009  ! 819: LDXA_R	ldxa	[%r8, %r9] 0x80, %r14
	.word 0x26ca0004  ! 820: BRLZ	brlz,a,pt	%8,<label_0xa0004>
	.word 0x1a800004  ! 821: BCC	bcc  	<label_0x4>
	.word 0x9c7a2388  ! 822: SDIV_I	sdiv 	%r8, 0x0388, %r14
	.word 0x8fa20929  ! 823: FMULs	fmuls	%f8, %f9, %f7
	.word 0xd4ba1009  ! 824: STDA_R	stda	%r10, [%r8 + %r9] 0x80
	.word 0xc8aa1009  ! 825: STBA_R	stba	%r4, [%r8 + %r9] 0x80
	.word 0x8cf20009  ! 826: UDIVcc_R	udivcc 	%r8, %r9, %r6
	.word 0xc2f21009  ! 827: STXA_R	stxa	%r1, [%r8 + %r9] 0x80
	.word 0xc8ea2f90  ! 828: LDSTUBA_I	ldstuba	%r4, [%r8 + 0x0f90] %asi
	.word 0xe24a2ebc  ! 829: LDSB_I	ldsb	[%r8 + 0x0ebc], %r17
	.word 0x04ca0008  ! 830: BRLEZ	brlez  ,pt	%8,<label_0xa0008>
	.word 0xe6522edc  ! 831: LDSH_I	ldsh	[%r8 + 0x0edc], %r19
	.word 0xec6a0009  ! 832: LDSTUB_R	ldstub	%r22, [%r8 + %r9]
	.word 0xc4522c78  ! 833: LDSH_I	ldsh	[%r8 + 0x0c78], %r2
	.word 0xc6f22e34  ! 834: STXA_I	stxa	%r3, [%r8 + 0x0e34] %asi
	.word 0x10800004  ! 835: BA	ba  	<label_0x4>
	.word 0xc3ea2aa8  ! 836: PREFETCHA_I	prefetcha	[%r8, + 0x0aa8] %asi, #one_read
	.word 0xc7f22009  ! 837: CASXA_R	casxa	[%r8]%asi, %r9, %r3
	.word 0x8143c000  ! 838: STBAR	stbar
	.word 0xca120009  ! 839: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xc6aa2d78  ! 840: STBA_I	stba	%r3, [%r8 + 0x0d78] %asi
	.word 0xce7a0009  ! 841: SWAP_R	swap	%r7, [%r8 + %r9]
	.word 0xce4a23dc  ! 842: LDSB_I	ldsb	[%r8 + 0x03dc], %r7
	.word 0x8143e011  ! 843: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x0aca0008  ! 844: BRNZ	brnz  ,pt	%8,<label_0xa0008>
	.word 0x34800004  ! 846: BG	bg,a	<label_0x4>
	.word 0x8ada0009  ! 847: SMULcc_R	smulcc 	%r8, %r9, %r5
	.word 0x0c800004  ! 848: BNEG	bneg  	<label_0x4>
	.word 0x866a0009  ! 849: UDIVX_R	udivx 	%r8, %r9, %r3
	.word 0xf26a21b0  ! 850: LDSTUB_I	ldstub	%r25, [%r8 + 0x01b0]
	.word 0xceaa1009  ! 851: STBA_R	stba	%r7, [%r8 + %r9] 0x80
	.word 0x88520009  ! 852: UMUL_R	umul 	%r8, %r9, %r4
	.word 0x9cd225d8  ! 853: UMULcc_I	umulcc 	%r8, 0x05d8, %r14
	.word 0xc36a2848  ! 854: PREFETCH_I	prefetch	[%r8 + 0x0848], #one_read
	.word 0xf1220009  ! 855: STF_R	st	%f24, [%r9, %r8]
	.word 0xf66a2c64  ! 856: LDSTUB_I	ldstub	%r27, [%r8 + 0x0c64]
	.word 0xc40a0009  ! 857: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xf25a28b0  ! 858: LDX_I	ldx	[%r8 + 0x08b0], %r25
	.word 0x9ada0009  ! 859: SMULcc_R	smulcc 	%r8, %r9, %r13
	.word 0xc86a21cc  ! 860: LDSTUB_I	ldstub	%r4, [%r8 + 0x01cc]
	.word 0x8fa209a9  ! 861: FDIVs	fdivs	%f8, %f9, %f7
	.word 0x8d6a0009  ! 862: SDIVX_R	sdivx	%r8, %r9, %r6
	.word 0xca0a0009  ! 863: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xccc22044  ! 864: LDSWA_I	ldswa	[%r8, + 0x0044] %asi, %r6
	.word 0xfdf22009  ! 865: CASXA_R	casxa	[%r8]%asi, %r9, %r30
	.word 0xc47a0009  ! 866: SWAP_R	swap	%r2, [%r8 + %r9]
	.word 0x8fa20929  ! 867: FMULs	fmuls	%f8, %f9, %f7
	.word 0xce120009  ! 868: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xc8921009  ! 869: LDUHA_R	lduha	[%r8, %r9] 0x80, %r4
	.word 0x88720009  ! 870: UDIV_R	udiv 	%r8, %r9, %r4
	.word 0x34800008  ! 871: BG	bg,a	<label_0x8>
	.word 0x8da20829  ! 872: FADDs	fadds	%f8, %f9, %f6
	.word 0xf4ba2668  ! 873: STDA_I	stda	%r26, [%r8 + 0x0668] %asi
	.word 0xf2c21009  ! 874: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r25
	.word 0x85a208a9  ! 875: FSUBs	fsubs	%f8, %f9, %f2
	.word 0xdeca1009  ! 876: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r15
	.word 0x8143e011  ! 877: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x86722f84  ! 878: UDIV_I	udiv 	%r8, 0x0f84, %r3
	.word 0xc3ea2394  ! 879: PREFETCHA_I	prefetcha	[%r8, + 0x0394] %asi, #one_read
	.word 0xd81a2398  ! 880: LDD_I	ldd	[%r8 + 0x0398], %r12
	.word 0x2c800004  ! 881: BNEG	bneg,a	<label_0x4>
	.word 0x885a0009  ! 883: SMUL_R	smul 	%r8, %r9, %r4
	.word 0xd4ba2fb4  ! 884: STDA_I	stda	%r10, [%r8 + 0x0fb4] %asi
	.word 0x8da20829  ! 885: FADDs	fadds	%f8, %f9, %f6
	.word 0xd73a0009  ! 886: STDF_R	std	%f11, [%r9, %r8]
	.word 0x8a722b0c  ! 887: UDIV_I	udiv 	%r8, 0x0b0c, %r5
	.word 0x88f20009  ! 888: UDIVcc_R	udivcc 	%r8, %r9, %r4
	.word 0x9c7221bc  ! 889: UDIV_I	udiv 	%r8, 0x01bc, %r14
	.word 0xca8a1009  ! 890: LDUBA_R	lduba	[%r8, %r9] 0x80, %r5
	.word 0xc3220009  ! 891: STF_R	st	%f1, [%r9, %r8]
	.word 0xdcb2218c  ! 892: STHA_I	stha	%r14, [%r8 + 0x018c] %asi
	.word 0xc60a2af4  ! 893: LDUB_I	ldub	[%r8 + 0x0af4], %r3
	.word 0x8afa2c04  ! 894: SDIVcc_I	sdivcc 	%r8, 0x0c04, %r5
	.word 0xea5a2a10  ! 895: LDX_I	ldx	[%r8 + 0x0a10], %r21
	.word 0xc3ea1009  ! 896: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x886a0009  ! 897: UDIVX_R	udivx 	%r8, %r9, %r4
	.word 0xc6020009  ! 898: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xd4d21009  ! 899: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r10
	.word 0xe4da1009  ! 900: LDXA_R	ldxa	[%r8, %r9] 0x80, %r18
	.word 0x02ca0004  ! 904: BRZ	brz  ,pt	%8,<label_0xa0004>
	.word 0xc87a25e4  ! 905: SWAP_I	swap	%r4, [%r8 + 0x05e4]
	.word 0x0a800008  ! 906: BCS	bcs  	<label_0x8>
	.word 0xcb220009  ! 907: STF_R	st	%f5, [%r9, %r8]
	.word 0xbaf20009  ! 908: UDIVcc_R	udivcc 	%r8, %r9, %r29
	.word 0xc4ba1009  ! 909: STDA_R	stda	%r2, [%r8 + %r9] 0x80
	.word 0xc49a2694  ! 910: LDDA_I	ldda	[%r8, + 0x0694] %asi, %r2
	.word 0xc3ea22f0  ! 911: PREFETCHA_I	prefetcha	[%r8, + 0x02f0] %asi, #one_read
	.word 0xc2520009  ! 912: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0x8143e011  ! 913: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x827a2890  ! 914: SDIV_I	sdiv 	%r8, 0x0890, %r1
	.word 0xcaaa1009  ! 915: STBA_R	stba	%r5, [%r8 + %r9] 0x80
	.word 0x06c20004  ! 917: BRLZ	brlz  ,nt	%8,<label_0x20004>
	.word 0xf20a23f0  ! 918: LDUB_I	ldub	[%r8 + 0x03f0], %r25
	.word 0xcc0a22e4  ! 920: LDUB_I	ldub	[%r8 + 0x02e4], %r6
	.word 0xc86a0009  ! 921: LDSTUB_R	ldstub	%r4, [%r8 + %r9]
	.word 0x856a24e4  ! 922: SDIVX_I	sdivx	%r8, 0x04e4, %r2
	.word 0xcc020009  ! 923: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xc8aa1009  ! 924: STBA_R	stba	%r4, [%r8 + %r9] 0x80
	.word 0xc36a1009  ! 925: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xcd3a0009  ! 926: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc4ca2a54  ! 927: LDSBA_I	ldsba	[%r8, + 0x0a54] %asi, %r2
	.word 0xca921009  ! 928: LDUHA_R	lduha	[%r8, %r9] 0x80, %r5
	.word 0x86fa0009  ! 929: SDIVcc_R	sdivcc 	%r8, %r9, %r3
	.word 0x8143e011  ! 930: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x8143c000  ! 931: STBAR	stbar
	.word 0xbf6a0009  ! 934: SDIVX_R	sdivx	%r8, %r9, %r31
	.word 0x95a208a9  ! 935: FSUBs	fsubs	%f8, %f9, %f10
	.word 0x22800004  ! 936: BE	be,a	<label_0x4>
	.word 0xfad21009  ! 937: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r29
	.word 0xc2821009  ! 938: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r1
	.word 0x964a22c8  ! 939: MULX_I	mulx 	%r8, 0x02c8, %r11
	.word 0xab220009  ! 940: MULScc_R	mulscc 	%r8, %r9, %r21
	.word 0xc49a1009  ! 941: LDDA_R	ldda	[%r8, %r9] 0x80, %r2
	.word 0xa04a0009  ! 942: MULX_R	mulx 	%r8, %r9, %r16
	.word 0xcf3a0009  ! 943: STDF_R	std	%f7, [%r9, %r8]
	.word 0x8ad22aa0  ! 944: UMULcc_I	umulcc 	%r8, 0x0aa0, %r5
	.word 0xc2a21009  ! 945: STWA_R	stwa	%r1, [%r8 + %r9] 0x80
	.word 0xc66a0009  ! 946: LDSTUB_R	ldstub	%r3, [%r8 + %r9]
	.word 0x89a20929  ! 947: FMULs	fmuls	%f8, %f9, %f4
	.word 0xcc921009  ! 948: LDUHA_R	lduha	[%r8, %r9] 0x80, %r6
	.word 0x16800004  ! 949: BGE	bge  	<label_0x4>
	.word 0xc36a248c  ! 950: PREFETCH_I	prefetch	[%r8 + 0x048c], #one_read
	.word 0xc4b226d4  ! 951: STHA_I	stha	%r2, [%r8 + 0x06d4] %asi
	.word 0x89a20829  ! 952: FADDs	fadds	%f8, %f9, %f4
	.word 0xc8b21009  ! 953: STHA_R	stha	%r4, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 955: STBAR	stbar
	.word 0xa7a20929  ! 956: FMULs	fmuls	%f8, %f9, %f19
	.word 0x8a7a0009  ! 957: SDIV_R	sdiv 	%r8, %r9, %r5
	.word 0xcd220009  ! 958: STF_R	st	%f6, [%r9, %r8]
	.word 0xc7220009  ! 959: STF_R	st	%f3, [%r9, %r8]
	.word 0xa2f20009  ! 960: UDIVcc_R	udivcc 	%r8, %r9, %r17
	.word 0xc3f21009  ! 961: CASXA_I	casxa	[%r8] 0x80, %r9, %r1
	.word 0x26800004  ! 962: BL	bl,a	<label_0x4>
	.word 0xc3ea2b88  ! 963: PREFETCHA_I	prefetcha	[%r8, + 0x0b88] %asi, #one_read
	.word 0xc67a2a04  ! 965: SWAP_I	swap	%r3, [%r8 + 0x0a04]
	.word 0xcada27f8  ! 966: LDXA_I	ldxa	[%r8, + 0x07f8] %asi, %r5
	.word 0x24c20004  ! 967: BRLEZ	brlez,a,nt	%8,<label_0x20004>
	.word 0xc9f21009  ! 968: CASXA_I	casxa	[%r8] 0x80, %r9, %r4
	.word 0x88722354  ! 969: UDIV_I	udiv 	%r8, 0x0354, %r4
	.word 0xc7f21009  ! 970: CASXA_I	casxa	[%r8] 0x80, %r9, %r3
	.word 0xa16a21c4  ! 971: SDIVX_I	sdivx	%r8, 0x01c4, %r16
	.word 0x8143c000  ! 972: STBAR	stbar
	.word 0x0a800004  ! 973: BCS	bcs  	<label_0x4>
	.word 0xcab21009  ! 975: STHA_R	stha	%r5, [%r8 + %r9] 0x80
	.word 0xa0da0009  ! 976: SMULcc_R	smulcc 	%r8, %r9, %r16
	.word 0xbfa20829  ! 977: FADDs	fadds	%f8, %f9, %f31
	.word 0x87222d0c  ! 978: MULScc_I	mulscc 	%r8, 0x0d0c, %r3
	.word 0xca4a0009  ! 979: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xf2aa28cc  ! 980: STBA_I	stba	%r25, [%r8 + 0x08cc] %asi
	.word 0xe40a2cc0  ! 981: LDUB_I	ldub	[%r8 + 0x0cc0], %r18
	.word 0xc8821009  ! 982: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r4
	.word 0x876a0009  ! 983: SDIVX_R	sdivx	%r8, %r9, %r3
	.word 0x87a209a9  ! 984: FDIVs	fdivs	%f8, %f9, %f3
	.word 0xc36a2de8  ! 985: PREFETCH_I	prefetch	[%r8 + 0x0de8], #one_read
	.word 0xc53a2418  ! 986: STDF_I	std	%f2, [0x0418, %r8]
	.word 0x8143c000  ! 987: STBAR	stbar
	.word 0x0ac20004  ! 988: BRNZ	brnz  ,nt	%8,<label_0x20004>
	.word 0x866a2bd0  ! 989: UDIVX_I	udivx 	%r8, 0x0bd0, %r3
	.word 0xc2b22c74  ! 990: STHA_I	stha	%r1, [%r8 + 0x0c74] %asi
	.word 0x82d20009  ! 991: UMULcc_R	umulcc 	%r8, %r9, %r1
	.word 0x82522bf4  ! 992: UMUL_I	umul 	%r8, 0x0bf4, %r1
	.word 0x85a208a9  ! 993: FSUBs	fsubs	%f8, %f9, %f2
	.word 0x845a29e8  ! 994: SMUL_I	smul 	%r8, 0x09e8, %r2
	.word 0x06c20004  ! 995: BRLZ	brlz  ,nt	%8,<label_0x20004>
	.word 0xcd3a2ba8  ! 996: STDF_I	std	%f6, [0x0ba8, %r8]
	.word 0x9fa208a9  ! 997: FSUBs	fsubs	%f8, %f9, %f15
	.word 0xcc8a2344  ! 998: LDUBA_I	lduba	[%r8, + 0x0344] %asi, %r6
	.word 0xa65a208c  ! 999: SMUL_I	smul 	%r8, 0x008c, %r19
        ta      T_GOOD_TRAP

th_main_3:
        setx  MAIN_BASE_DATA_VA, %r1, %r8
        setx  0x0000000000000f40, %g1, %r9
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
        setx  0x3474e3870f113f46, %g1, %r0
        setx  0x7962e4909cb34bd1, %g1, %r1
        setx  0x068c08e021aa1b54, %g1, %r2
        setx  0xce26a444671567b8, %g1, %r3
        setx  0x9ff941a276fe547f, %g1, %r4
        setx  0x8fa3ca3b0cfa8d82, %g1, %r5
        setx  0x4ddac487ea7fb64a, %g1, %r6
        setx  0x932a83593a863aed, %g1, %r7
        setx  0xfbf35da77b571906, %g1, %r10
        setx  0x38d5b325a7343126, %g1, %r11
        setx  0xa07863441f1915fb, %g1, %r12
        setx  0x0fadce9efa86eb10, %g1, %r13
        setx  0x2524acda6e2ca5c3, %g1, %r14
        setx  0x06d54561586172fe, %g1, %r15
        setx  0xc26ec7ed3028a7e6, %g1, %r16
        setx  0xbf5d702183b4d518, %g1, %r17
        setx  0xc12ce802da3e8952, %g1, %r18
        setx  0xe4747f1c72747eed, %g1, %r19
        setx  0xaa1fed9d209c8ea2, %g1, %r20
        setx  0x4d138f7d49c50311, %g1, %r21
        setx  0xde23e906a6f227a1, %g1, %r22
        setx  0x33e8767070dbb57f, %g1, %r23
        setx  0x0687286d915c44f6, %g1, %r24
        setx  0x18fa3f5625d90017, %g1, %r25
        setx  0xa18ae2af93ea4627, %g1, %r26
        setx  0xf0c3e20fc107549c, %g1, %r27
        setx  0xd5c18a799c1b41dd, %g1, %r28
        setx  0x0372ad554cd26431, %g1, %r29
        setx  0x896aa5e1c821a67c, %g1, %r30
        setx  0x1a36e51a6c9d479b, %g1, %r31
	.word 0x06ca0004  ! 5: BRLZ	brlz  ,pt	%8,<label_0xa0004>
	.word 0x83a209a9  ! 6: FDIVs	fdivs	%f8, %f9, %f1
	.word 0x8143c000  ! 7: STBAR	stbar
	.word 0xa2522df4  ! 8: UMUL_I	umul 	%r8, 0x0df4, %r17
	.word 0xc8520009  ! 9: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xdc9a20f0  ! 10: LDDA_I	ldda	[%r8, + 0x00f0] %asi, %r14
	.word 0xd73a0009  ! 11: STDF_R	std	%f11, [%r9, %r8]
	.word 0x0a800004  ! 12: BCS	bcs  	<label_0x4>
	.word 0x2cc20004  ! 13: BRGZ	brgz,a,nt	%8,<label_0x20004>
	.word 0xfa6a2bac  ! 14: LDSTUB_I	ldstub	%r29, [%r8 + 0x0bac]
	.word 0xc5220009  ! 16: STF_R	st	%f2, [%r9, %r8]
	.word 0xc6821009  ! 17: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r3
	.word 0x966a2e94  ! 18: UDIVX_I	udivx 	%r8, 0x0e94, %r11
	.word 0xe8ea25c8  ! 19: LDSTUBA_I	ldstuba	%r20, [%r8 + 0x05c8] %asi
	.word 0xe09a2244  ! 20: LDDA_I	ldda	[%r8, + 0x0244] %asi, %r16
	.word 0xc3ea26e0  ! 21: PREFETCHA_I	prefetcha	[%r8, + 0x06e0] %asi, #one_read
	.word 0xc3f22009  ! 22: CASXA_R	casxa	[%r8]%asi, %r9, %r1
	.word 0x8ed20009  ! 23: UMULcc_R	umulcc 	%r8, %r9, %r7
	.word 0x85220009  ! 24: MULScc_R	mulscc 	%r8, %r9, %r2
	.word 0xf01a2c9c  ! 25: LDD_I	ldd	[%r8 + 0x0c9c], %r24
	.word 0x89a209a9  ! 28: FDIVs	fdivs	%f8, %f9, %f4
	.word 0xcde21009  ! 29: CASA_I	casa	[%r8] 0x80, %r9, %r6
	.word 0xccea1009  ! 30: LDSTUBA_R	ldstuba	%r6, [%r8 + %r9] 0x80
	.word 0xf87a0009  ! 31: SWAP_R	swap	%r28, [%r8 + %r9]
	.word 0x8143c000  ! 32: STBAR	stbar
	.word 0x8ada0009  ! 33: SMULcc_R	smulcc 	%r8, %r9, %r5
	.word 0x8a4a0009  ! 34: MULX_R	mulx 	%r8, %r9, %r5
	.word 0xc3ea2418  ! 35: PREFETCHA_I	prefetcha	[%r8, + 0x0418] %asi, #one_read
	.word 0xd49a1009  ! 36: LDDA_R	ldda	[%r8, %r9] 0x80, %r10
	.word 0x8143e011  ! 38: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x8143c000  ! 39: STBAR	stbar
	.word 0xc48223c0  ! 40: LDUWA_I	lduwa	[%r8, + 0x03c0] %asi, %r2
	.word 0xcfe21009  ! 41: CASA_I	casa	[%r8] 0x80, %r9, %r7
	.word 0xe13a20a4  ! 43: STDF_I	std	%f16, [0x00a4, %r8]
	.word 0xbcfa2778  ! 44: SDIVcc_I	sdivcc 	%r8, 0x0778, %r30
	.word 0xfc520009  ! 45: LDSH_R	ldsh	[%r8 + %r9], %r30
	.word 0xe4ea2f08  ! 46: LDSTUBA_I	ldstuba	%r18, [%r8 + 0x0f08] %asi
	.word 0x8143e011  ! 48: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xcdf22009  ! 49: CASXA_R	casxa	[%r8]%asi, %r9, %r6
	.word 0xcada2bf8  ! 50: LDXA_I	ldxa	[%r8, + 0x0bf8] %asi, %r5
	.word 0x14800008  ! 51: BG	bg  	<label_0x8>
	.word 0xc3ea2f90  ! 52: PREFETCHA_I	prefetcha	[%r8, + 0x0f90] %asi, #one_read
	.word 0xcdf22009  ! 53: CASXA_R	casxa	[%r8]%asi, %r9, %r6
	.word 0xc4ba2860  ! 54: STDA_I	stda	%r2, [%r8 + 0x0860] %asi
	.word 0x8ada0009  ! 55: SMULcc_R	smulcc 	%r8, %r9, %r5
	.word 0x83a208a9  ! 56: FSUBs	fsubs	%f8, %f9, %f1
	.word 0x8cda0009  ! 57: SMULcc_R	smulcc 	%r8, %r9, %r6
	.word 0xc3222a38  ! 58: STF_I	st	%f1, [0x0a38, %r8]
	.word 0xf0ba1009  ! 60: STDA_R	stda	%r24, [%r8 + %r9] 0x80
	.word 0xd442270c  ! 61: LDSW_I	ldsw	[%r8 + 0x070c], %r10
	.word 0xf8ba1009  ! 62: STDA_R	stda	%r28, [%r8 + %r9] 0x80
	.word 0xfcda1009  ! 63: LDXA_R	ldxa	[%r8, %r9] 0x80, %r30
	.word 0xc3222ee0  ! 64: STF_I	st	%f1, [0x0ee0, %r8]
	.word 0xccfa1009  ! 65: SWAPA_R	swapa	%r6, [%r8 + %r9] 0x80
	.word 0x40000008  ! 66: CALL	call	disp30_8
	.word 0xc4a21009  ! 67: STWA_R	stwa	%r2, [%r8 + %r9] 0x80
	.word 0xc6ca2770  ! 68: LDSBA_I	ldsba	[%r8, + 0x0770] %asi, %r3
	.word 0x896a0009  ! 69: SDIVX_R	sdivx	%r8, %r9, %r4
	.word 0xc9222290  ! 70: STF_I	st	%f4, [0x0290, %r8]
	.word 0xc64a2eac  ! 71: LDSB_I	ldsb	[%r8 + 0x0eac], %r3
	.word 0xe04a0009  ! 72: LDSB_R	ldsb	[%r8 + %r9], %r16
	.word 0xc3222240  ! 73: STF_I	st	%f1, [0x0240, %r8]
	.word 0xc3ea2098  ! 74: PREFETCHA_I	prefetcha	[%r8, + 0x0098] %asi, #one_read
	.word 0x84da2c58  ! 75: SMULcc_I	smulcc 	%r8, 0x0c58, %r2
	.word 0xd87a0009  ! 76: SWAP_R	swap	%r12, [%r8 + %r9]
	.word 0x04800008  ! 78: BLE	ble  	<label_0x8>
	.word 0x2aca0008  ! 79: BRNZ	brnz,a,pt	%8,<label_0xa0008>
	.word 0x04c20008  ! 80: BRLEZ	brlez  ,nt	%8,<label_0x20008>
	.word 0xc2da1009  ! 81: LDXA_R	ldxa	[%r8, %r9] 0x80, %r1
	.word 0x8ba20829  ! 82: FADDs	fadds	%f8, %f9, %f5
	.word 0xca7a244c  ! 83: SWAP_I	swap	%r5, [%r8 + 0x044c]
	.word 0x32800004  ! 84: BNE	bne,a	<label_0x4>
	.word 0xccb224a8  ! 86: STHA_I	stha	%r6, [%r8 + 0x04a8] %asi
	.word 0x8a5224f0  ! 87: UMUL_I	umul 	%r8, 0x04f0, %r5
	.word 0xcaf22850  ! 88: STXA_I	stxa	%r5, [%r8 + 0x0850] %asi
	.word 0x2aca0004  ! 89: BRNZ	brnz,a,pt	%8,<label_0xa0004>
	.word 0xce122558  ! 90: LDUH_I	lduh	[%r8 + 0x0558], %r7
	.word 0xc36a2430  ! 91: PREFETCH_I	prefetch	[%r8 + 0x0430], #one_read
	.word 0xccda1009  ! 92: LDXA_R	ldxa	[%r8, %r9] 0x80, %r6
	.word 0xdcca1009  ! 93: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r14
	.word 0x8da208a9  ! 94: FSUBs	fsubs	%f8, %f9, %f6
	.word 0x30800004  ! 95: BA	ba,a	<label_0x4>
	.word 0x8143c000  ! 96: STBAR	stbar
	.word 0xc8ba1009  ! 97: STDA_R	stda	%r4, [%r8 + %r9] 0x80
	.word 0x3c800004  ! 98: BPOS	bpos,a	<label_0x4>
	.word 0x02c20004  ! 99: BRZ	brz  ,nt	%8,<label_0x20004>
	.word 0x865a2e38  ! 101: SMUL_I	smul 	%r8, 0x0e38, %r3
	.word 0xa5a209a9  ! 102: FDIVs	fdivs	%f8, %f9, %f18
	.word 0xf4522714  ! 103: LDSH_I	ldsh	[%r8 + 0x0714], %r26
	.word 0x82da21a4  ! 104: SMULcc_I	smulcc 	%r8, 0x01a4, %r1
	.word 0xcef225f0  ! 105: STXA_I	stxa	%r7, [%r8 + 0x05f0] %asi
	.word 0xcc6a0009  ! 106: LDSTUB_R	ldstub	%r6, [%r8 + %r9]
	.word 0x8efa0009  ! 107: SDIVcc_R	sdivcc 	%r8, %r9, %r7
	.word 0x8143c000  ! 108: STBAR	stbar
	.word 0x84722e9c  ! 109: UDIV_I	udiv 	%r8, 0x0e9c, %r2
	.word 0xc8a21009  ! 110: STWA_R	stwa	%r4, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 111: STBAR	stbar
	.word 0xc3f21009  ! 112: CASXA_I	casxa	[%r8] 0x80, %r9, %r1
	.word 0x85a209a9  ! 113: FDIVs	fdivs	%f8, %f9, %f2
	.word 0xd4522170  ! 114: LDSH_I	ldsh	[%r8 + 0x0170], %r10
	.word 0xc8aa2e64  ! 115: STBA_I	stba	%r4, [%r8 + 0x0e64] %asi
	.word 0xc6020009  ! 116: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xcea21009  ! 117: STWA_R	stwa	%r7, [%r8 + %r9] 0x80
	.word 0xc3ea25c8  ! 118: PREFETCHA_I	prefetcha	[%r8, + 0x05c8] %asi, #one_read
	.word 0x12800008  ! 119: BNE	bne  	<label_0x8>
	.word 0x24ca0004  ! 122: BRLEZ	brlez,a,pt	%8,<label_0xa0004>
	.word 0x8143e011  ! 123: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x8143e011  ! 124: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xafa20829  ! 126: FADDs	fadds	%f8, %f9, %f23
	.word 0xfc9a227c  ! 127: LDDA_I	ldda	[%r8, + 0x027c] %asi, %r30
	.word 0x84da0009  ! 129: SMULcc_R	smulcc 	%r8, %r9, %r2
	.word 0xc2aa2494  ! 130: STBA_I	stba	%r1, [%r8 + 0x0494] %asi
	.word 0x83222a60  ! 132: MULScc_I	mulscc 	%r8, 0x0a60, %r1
	.word 0x8143c000  ! 133: STBAR	stbar
	.word 0x8143c000  ! 134: STBAR	stbar
	.word 0x8143c000  ! 135: STBAR	stbar
	.word 0x945a2d08  ! 136: SMUL_I	smul 	%r8, 0x0d08, %r10
	.word 0x8143c000  ! 137: STBAR	stbar
	.word 0x32800004  ! 138: BNE	bne,a	<label_0x4>
	.word 0x97220009  ! 139: MULScc_R	mulscc 	%r8, %r9, %r11
	.word 0x8143c000  ! 140: STBAR	stbar
	.word 0xc2f225a0  ! 141: STXA_I	stxa	%r1, [%r8 + 0x05a0] %asi
	.word 0x9e5a0009  ! 142: SMUL_R	smul 	%r8, %r9, %r15
	.word 0xd8ba28a0  ! 143: STDA_I	stda	%r12, [%r8 + 0x08a0] %asi
	.word 0xbfa209a9  ! 144: FDIVs	fdivs	%f8, %f9, %f31
	.word 0xfbf21009  ! 145: CASXA_I	casxa	[%r8] 0x80, %r9, %r29
	.word 0x865a2a6c  ! 146: SMUL_I	smul 	%r8, 0x0a6c, %r3
	.word 0xc7222538  ! 147: STF_I	st	%f3, [0x0538, %r8]
	.word 0x8143c000  ! 148: STBAR	stbar
	.word 0xf6aa1009  ! 149: STBA_R	stba	%r27, [%r8 + %r9] 0x80
	.word 0xce0a0009  ! 150: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xce122c58  ! 151: LDUH_I	lduh	[%r8 + 0x0c58], %r7
	.word 0x32800004  ! 152: BNE	bne,a	<label_0x4>
	.word 0x06ca0008  ! 153: BRLZ	brlz  ,pt	%8,<label_0xa0008>
	.word 0xc3ea2b1c  ! 154: PREFETCHA_I	prefetcha	[%r8, + 0x0b1c] %asi, #one_read
	.word 0x8eda2d94  ! 155: SMULcc_I	smulcc 	%r8, 0x0d94, %r7
	.word 0x8143e011  ! 156: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xc2a21009  ! 157: STWA_R	stwa	%r1, [%r8 + %r9] 0x80
	.word 0xccea1009  ! 159: LDSTUBA_R	ldstuba	%r6, [%r8 + %r9] 0x80
	.word 0x864a2b40  ! 160: MULX_I	mulx 	%r8, 0x0b40, %r3
	.word 0x8a5a2030  ! 161: SMUL_I	smul 	%r8, 0x0030, %r5
	.word 0x88fa2dd0  ! 162: SDIVcc_I	sdivcc 	%r8, 0x0dd0, %r4
	.word 0xe0ba1009  ! 165: STDA_R	stda	%r16, [%r8 + %r9] 0x80
	.word 0xdeca1009  ! 166: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r15
	.word 0xdeca1009  ! 167: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r15
	.word 0xc2ca2f0c  ! 168: LDSBA_I	ldsba	[%r8, + 0x0f0c] %asi, %r1
	.word 0x2e800008  ! 169: BVS	bvs,a	<label_0x8>
	.word 0xb0da0009  ! 170: SMULcc_R	smulcc 	%r8, %r9, %r24
	.word 0xce122e4c  ! 171: LDUH_I	lduh	[%r8 + 0x0e4c], %r7
	.word 0xba520009  ! 172: UMUL_R	umul 	%r8, %r9, %r29
	.word 0x8e722d58  ! 173: UDIV_I	udiv 	%r8, 0x0d58, %r7
	.word 0xcd3a23d0  ! 174: STDF_I	std	%f6, [0x03d0, %r8]
	.word 0xd73a0009  ! 175: STDF_R	std	%f11, [%r9, %r8]
	.word 0x2a800004  ! 176: BCS	bcs,a	<label_0x4>
	.word 0xc36a2668  ! 177: PREFETCH_I	prefetch	[%r8 + 0x0668], #one_read
	.word 0xc2aa1009  ! 178: STBA_R	stba	%r1, [%r8 + %r9] 0x80
	.word 0xb4d20009  ! 179: UMULcc_R	umulcc 	%r8, %r9, %r26
	.word 0xb5a208a9  ! 180: FSUBs	fsubs	%f8, %f9, %f26
	.word 0xc4522008  ! 181: LDSH_I	ldsh	[%r8 + 0x0008], %r2
	.word 0x8143e011  ! 182: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x2ac20004  ! 183: BRNZ	brnz,a,nt	%8,<label_0x20004>
	.word 0xc6120009  ! 184: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xcde21009  ! 185: CASA_I	casa	[%r8] 0x80, %r9, %r6
	.word 0xaba208a9  ! 186: FSUBs	fsubs	%f8, %f9, %f21
	.word 0xc6a21009  ! 187: STWA_R	stwa	%r3, [%r8 + %r9] 0x80
	.word 0x0c800004  ! 188: BNEG	bneg  	<label_0x4>
	.word 0xb66a28f0  ! 189: UDIVX_I	udivx 	%r8, 0x08f0, %r27
	.word 0xcac221c0  ! 190: LDSWA_I	ldswa	[%r8, + 0x01c0] %asi, %r5
	.word 0xc36a28a4  ! 191: PREFETCH_I	prefetch	[%r8 + 0x08a4], #one_read
	.word 0xf8922124  ! 193: LDUHA_I	lduha	[%r8, + 0x0124] %asi, %r28
	.word 0xca120009  ! 194: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0x9da20929  ! 195: FMULs	fmuls	%f8, %f9, %f14
	.word 0xf81a220c  ! 196: LDD_I	ldd	[%r8 + 0x020c], %r28
	.word 0xc4f2234c  ! 197: STXA_I	stxa	%r2, [%r8 + 0x034c] %asi
	.word 0x846a0009  ! 198: UDIVX_R	udivx 	%r8, %r9, %r2
	.word 0xedf21009  ! 199: CASXA_I	casxa	[%r8] 0x80, %r9, %r22
	.word 0xed222c58  ! 200: STF_I	st	%f22, [0x0c58, %r8]
	.word 0x8143c000  ! 201: STBAR	stbar
	.word 0xa24a22e8  ! 202: MULX_I	mulx 	%r8, 0x02e8, %r17
	.word 0x8cd20009  ! 203: UMULcc_R	umulcc 	%r8, %r9, %r6
	.word 0xceca1009  ! 204: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r7
	.word 0xc84a0009  ! 205: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xe8c21009  ! 206: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r20
	.word 0xc6520009  ! 207: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xcc5a0009  ! 208: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xa2720009  ! 209: UDIV_R	udiv 	%r8, %r9, %r17
	.word 0xc2120009  ! 210: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xc5f21009  ! 211: CASXA_I	casxa	[%r8] 0x80, %r9, %r2
	.word 0xc2c229e8  ! 212: LDSWA_I	ldswa	[%r8, + 0x09e8] %asi, %r1
	.word 0x8143e011  ! 213: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xc2aa1009  ! 214: STBA_R	stba	%r1, [%r8 + %r9] 0x80
	.word 0xc86a0009  ! 215: LDSTUB_R	ldstub	%r4, [%r8 + %r9]
	.word 0x12800004  ! 216: BNE	bne  	<label_0x4>
	.word 0xcc6a2e0c  ! 217: LDSTUB_I	ldstub	%r6, [%r8 + 0x0e0c]
	.word 0xb3222d88  ! 218: MULScc_I	mulscc 	%r8, 0x0d88, %r25
	.word 0xc3ea1009  ! 219: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xca9227ec  ! 220: LDUHA_I	lduha	[%r8, + 0x07ec] %asi, %r5
	.word 0xeb3a221c  ! 221: STDF_I	std	%f21, [0x021c, %r8]
	.word 0xc2b21009  ! 223: STHA_R	stha	%r1, [%r8 + %r9] 0x80
	.word 0x0e800004  ! 225: BVS	bvs  	<label_0x4>
	.word 0x82f22eb4  ! 226: UDIVcc_I	udivcc 	%r8, 0x0eb4, %r1
	.word 0xc7f21009  ! 227: CASXA_I	casxa	[%r8] 0x80, %r9, %r3
	.word 0x8cda2ba4  ! 228: SMULcc_I	smulcc 	%r8, 0x0ba4, %r6
	.word 0xceca2be0  ! 229: LDSBA_I	ldsba	[%r8, + 0x0be0] %asi, %r7
	.word 0xc4da2608  ! 230: LDXA_I	ldxa	[%r8, + 0x0608] %asi, %r2
	.word 0xc522203c  ! 231: STF_I	st	%f2, [0x003c, %r8]
	.word 0xc28a25e4  ! 232: LDUBA_I	lduba	[%r8, + 0x05e4] %asi, %r1
	.word 0xe7220009  ! 233: STF_R	st	%f19, [%r9, %r8]
	.word 0x04c20008  ! 234: BRLEZ	brlez  ,nt	%8,<label_0x20008>
	.word 0x946a0009  ! 235: UDIVX_R	udivx 	%r8, %r9, %r10
	.word 0x847a0009  ! 236: SDIV_R	sdiv 	%r8, %r9, %r2
	.word 0x3c800004  ! 237: BPOS	bpos,a	<label_0x4>
	.word 0xccf22624  ! 238: STXA_I	stxa	%r6, [%r8 + 0x0624] %asi
	.word 0xcea222d0  ! 239: STWA_I	stwa	%r7, [%r8 + 0x02d0] %asi
	.word 0x0e800004  ! 240: BVS	bvs  	<label_0x4>
	.word 0xeeea2090  ! 241: LDSTUBA_I	ldstuba	%r23, [%r8 + 0x0090] %asi
	.word 0xce7a2630  ! 242: SWAP_I	swap	%r7, [%r8 + 0x0630]
	.word 0xc3ea2068  ! 243: PREFETCHA_I	prefetcha	[%r8, + 0x0068] %asi, #one_read
	.word 0xe66a0009  ! 244: LDSTUB_R	ldstub	%r19, [%r8 + %r9]
	.word 0x896a2a3c  ! 245: SDIVX_I	sdivx	%r8, 0x0a3c, %r4
	.word 0x88522b90  ! 246: UMUL_I	umul 	%r8, 0x0b90, %r4
	.word 0x1c800004  ! 247: BPOS	bpos  	<label_0x4>
	.word 0x2c800004  ! 248: BNEG	bneg,a	<label_0x4>
	.word 0xcc0a0009  ! 249: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0x8143c000  ! 250: STBAR	stbar
	.word 0xf41a0009  ! 251: LDD_R	ldd	[%r8 + %r9], %r26
	.word 0xc47a252c  ! 252: SWAP_I	swap	%r2, [%r8 + 0x052c]
	.word 0xd6f22708  ! 253: STXA_I	stxa	%r11, [%r8 + 0x0708] %asi
	.word 0xc2520009  ! 254: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0x8143c000  ! 255: STBAR	stbar
	.word 0x2e800004  ! 256: BVS	bvs,a	<label_0x4>
	.word 0x824a2560  ! 257: MULX_I	mulx 	%r8, 0x0560, %r1
	.word 0xcd220009  ! 258: STF_R	st	%f6, [%r9, %r8]
	.word 0xcf2220dc  ! 259: STF_I	st	%f7, [0x00dc, %r8]
	.word 0xc3ea1009  ! 260: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xd8ba2e6c  ! 261: STDA_I	stda	%r12, [%r8 + 0x0e6c] %asi
	.word 0xad6a2640  ! 263: SDIVX_I	sdivx	%r8, 0x0640, %r22
	.word 0xceaa2eb0  ! 264: STBA_I	stba	%r7, [%r8 + 0x0eb0] %asi
	.word 0xcde21009  ! 265: CASA_I	casa	[%r8] 0x80, %r9, %r6
	.word 0xdf2225bc  ! 267: STF_I	st	%f15, [0x05bc, %r8]
	.word 0xe8120009  ! 268: LDUH_R	lduh	[%r8 + %r9], %r20
	.word 0x8ba209a9  ! 269: FDIVs	fdivs	%f8, %f9, %f5
	.word 0x83220009  ! 270: MULScc_R	mulscc 	%r8, %r9, %r1
	.word 0xec4a0009  ! 271: LDSB_R	ldsb	[%r8 + %r9], %r22
	.word 0x8143c000  ! 272: STBAR	stbar
	.word 0x3a800004  ! 273: BCC	bcc,a	<label_0x4>
	.word 0x85220009  ! 274: MULScc_R	mulscc 	%r8, %r9, %r2
	.word 0xc36a26c4  ! 275: PREFETCH_I	prefetch	[%r8 + 0x06c4], #one_read
	.word 0x8143c000  ! 276: STBAR	stbar
	.word 0xc8921009  ! 277: LDUHA_R	lduha	[%r8, %r9] 0x80, %r4
	.word 0x88722040  ! 278: UDIV_I	udiv 	%r8, 0x0040, %r4
	.word 0xea8a2dd8  ! 280: LDUBA_I	lduba	[%r8, + 0x0dd8] %asi, %r21
	.word 0x82522868  ! 281: UMUL_I	umul 	%r8, 0x0868, %r1
	.word 0x8143c000  ! 282: STBAR	stbar
	.word 0x8143e011  ! 283: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xfc6a2d04  ! 284: LDSTUB_I	ldstub	%r30, [%r8 + 0x0d04]
	.word 0x8143e011  ! 285: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x8143e011  ! 286: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x2c800004  ! 287: BNEG	bneg,a	<label_0x4>
	.word 0x16800004  ! 288: BGE	bge  	<label_0x4>
	.word 0x8143e011  ! 289: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x846a0009  ! 290: UDIVX_R	udivx 	%r8, %r9, %r2
	.word 0xdafa1009  ! 291: SWAPA_R	swapa	%r13, [%r8 + %r9] 0x80
	.word 0xc2aa1009  ! 292: STBA_R	stba	%r1, [%r8 + %r9] 0x80
	.word 0x987220a4  ! 293: UDIV_I	udiv 	%r8, 0x00a4, %r12
	.word 0xc36a2f58  ! 294: PREFETCH_I	prefetch	[%r8 + 0x0f58], #one_read
	.word 0xcab21009  ! 295: STHA_R	stha	%r5, [%r8 + %r9] 0x80
	.word 0xc33a2c64  ! 296: STDF_I	std	%f1, [0x0c64, %r8]
	.word 0xcefa2e88  ! 297: SWAPA_I	swapa	%r7, [%r8 + 0x0e88] %asi
	.word 0xeada2d0c  ! 298: LDXA_I	ldxa	[%r8, + 0x0d0c] %asi, %r21
	.word 0xe01a2318  ! 299: LDD_I	ldd	[%r8 + 0x0318], %r16
	.word 0xa0722570  ! 301: UDIV_I	udiv 	%r8, 0x0570, %r16
	.word 0xf6c22a50  ! 302: LDSWA_I	ldswa	[%r8, + 0x0a50] %asi, %r27
	.word 0xcd220009  ! 303: STF_R	st	%f6, [%r9, %r8]
	.word 0x8e5a0009  ! 304: SMUL_R	smul 	%r8, %r9, %r7
	.word 0x3a800004  ! 305: BCC	bcc,a	<label_0x4>
	.word 0xc852256c  ! 306: LDSH_I	ldsh	[%r8 + 0x056c], %r4
	.word 0x8143e011  ! 307: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xf6ea1009  ! 308: LDSTUBA_R	ldstuba	%r27, [%r8 + %r9] 0x80
	.word 0xb96a0009  ! 309: SDIVX_R	sdivx	%r8, %r9, %r28
	.word 0xfa6a0009  ! 310: LDSTUB_R	ldstub	%r29, [%r8 + %r9]
	.word 0xc4f21009  ! 311: STXA_R	stxa	%r2, [%r8 + %r9] 0x80
	.word 0x24800004  ! 312: BLE	ble,a	<label_0x4>
	.word 0xc93a0009  ! 313: STDF_R	std	%f4, [%r9, %r8]
	.word 0x00800008  ! 314: BN	bn  	<label_0x8>
	.word 0xb6fa22c4  ! 315: SDIVcc_I	sdivcc 	%r8, 0x02c4, %r27
	.word 0xfbe21009  ! 316: CASA_I	casa	[%r8] 0x80, %r9, %r29
	.word 0xe53a0009  ! 317: STDF_R	std	%f18, [%r9, %r8]
	.word 0x3e800008  ! 318: BVC	bvc,a	<label_0x8>
	.word 0x83a208a9  ! 319: FSUBs	fsubs	%f8, %f9, %f1
	.word 0xc2a21009  ! 320: STWA_R	stwa	%r1, [%r8 + %r9] 0x80
	.word 0xc85a0009  ! 321: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xc2022010  ! 322: LDUW_I	lduw	[%r8 + 0x0010], %r1
	.word 0x10800008  ! 323: BA	ba  	<label_0x8>
	.word 0xc3ea251c  ! 324: PREFETCHA_I	prefetcha	[%r8, + 0x051c] %asi, #one_read
	.word 0xda921009  ! 326: LDUHA_R	lduha	[%r8, %r9] 0x80, %r13
	.word 0x8143e011  ! 328: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xcec21009  ! 329: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r7
	.word 0xc5222f80  ! 330: STF_I	st	%f2, [0x0f80, %r8]
	.word 0xfa122fd4  ! 331: LDUH_I	lduh	[%r8 + 0x0fd4], %r29
	.word 0xceca2c2c  ! 332: LDSBA_I	ldsba	[%r8, + 0x0c2c] %asi, %r7
	.word 0x22ca0004  ! 333: BRZ	brz,a,pt	%8,<label_0xa0004>
	.word 0xc7e21009  ! 334: CASA_I	casa	[%r8] 0x80, %r9, %r3
	.word 0xcdf21009  ! 335: CASXA_I	casxa	[%r8] 0x80, %r9, %r6
	.word 0x8143c000  ! 336: STBAR	stbar
	.word 0x9ed22888  ! 337: UMULcc_I	umulcc 	%r8, 0x0888, %r15
	.word 0xc6520009  ! 338: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0x2ac20004  ! 339: BRNZ	brnz,a,nt	%8,<label_0x20004>
	.word 0xf1e22009  ! 340: CASA_R	casa	[%r8] %asi, %r9, %r24
	.word 0x0ac20004  ! 341: BRNZ	brnz  ,nt	%8,<label_0x20004>
	.word 0x83a20929  ! 342: FMULs	fmuls	%f8, %f9, %f1
	.word 0x8143e011  ! 343: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xfb220009  ! 344: STF_R	st	%f29, [%r9, %r8]
	.word 0x06800004  ! 345: BL	bl  	<label_0x4>
	.word 0xe4ba2064  ! 346: STDA_I	stda	%r18, [%r8 + 0x0064] %asi
	.word 0xc36a1009  ! 347: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc8da1009  ! 348: LDXA_R	ldxa	[%r8, %r9] 0x80, %r4
	.word 0xc5220009  ! 350: STF_R	st	%f2, [%r9, %r8]
	.word 0xa0f22d90  ! 352: UDIVcc_I	udivcc 	%r8, 0x0d90, %r16
	.word 0xeaf2246c  ! 353: STXA_I	stxa	%r21, [%r8 + 0x046c] %asi
	.word 0xb4720009  ! 354: UDIV_R	udiv 	%r8, %r9, %r26
	.word 0x8ef20009  ! 355: UDIVcc_R	udivcc 	%r8, %r9, %r7
	.word 0xcafa1009  ! 356: SWAPA_R	swapa	%r5, [%r8 + %r9] 0x80
	.word 0xcb3a0009  ! 357: STDF_R	std	%f5, [%r9, %r8]
	.word 0x2eca0008  ! 358: BRGEZ	brgez,a,pt	%8,<label_0xa0008>
	.word 0xcaaa1009  ! 359: STBA_R	stba	%r5, [%r8 + %r9] 0x80
	.word 0x884a0009  ! 360: MULX_R	mulx 	%r8, %r9, %r4
	.word 0xcca22938  ! 361: STWA_I	stwa	%r6, [%r8 + 0x0938] %asi
	.word 0xcbf22009  ! 362: CASXA_R	casxa	[%r8]%asi, %r9, %r5
	.word 0xc8c22cbc  ! 363: LDSWA_I	ldswa	[%r8, + 0x0cbc] %asi, %r4
	.word 0x8143e011  ! 364: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xc92225c4  ! 365: STF_I	st	%f4, [0x05c4, %r8]
	.word 0x84520009  ! 366: UMUL_R	umul 	%r8, %r9, %r2
	.word 0x88f223cc  ! 367: UDIVcc_I	udivcc 	%r8, 0x03cc, %r4
	.word 0xcaa21009  ! 368: STWA_R	stwa	%r5, [%r8 + %r9] 0x80
	.word 0xf8ba1009  ! 369: STDA_R	stda	%r28, [%r8 + %r9] 0x80
	.word 0x865a0009  ! 370: SMUL_R	smul 	%r8, %r9, %r3
	.word 0x845a2080  ! 371: SMUL_I	smul 	%r8, 0x0080, %r2
	.word 0x8143c000  ! 372: STBAR	stbar
	.word 0x8143e011  ! 373: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xca4a23b4  ! 374: LDSB_I	ldsb	[%r8 + 0x03b4], %r5
	.word 0x82da2a78  ! 375: SMULcc_I	smulcc 	%r8, 0x0a78, %r1
	.word 0xc8da2a5c  ! 376: LDXA_I	ldxa	[%r8, + 0x0a5c] %asi, %r4
	.word 0x88da2cb8  ! 377: SMULcc_I	smulcc 	%r8, 0x0cb8, %r4
	.word 0xbc6a0009  ! 378: UDIVX_R	udivx 	%r8, %r9, %r30
	.word 0xa2f20009  ! 379: UDIVcc_R	udivcc 	%r8, %r9, %r17
	.word 0xc86a22b0  ! 380: LDSTUB_I	ldstub	%r4, [%r8 + 0x02b0]
	.word 0xc36a205c  ! 381: PREFETCH_I	prefetch	[%r8 + 0x005c], #one_read
	.word 0xa1a20829  ! 383: FADDs	fadds	%f8, %f9, %f16
	.word 0xc8ca1009  ! 384: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r4
	.word 0xc2ca24ac  ! 385: LDSBA_I	ldsba	[%r8, + 0x04ac] %asi, %r1
	.word 0x8143e011  ! 386: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xd8d22de8  ! 387: LDSHA_I	ldsha	[%r8, + 0x0de8] %asi, %r12
	.word 0x8143c000  ! 388: STBAR	stbar
	.word 0x0cc20008  ! 389: BRGZ	brgz  ,nt	%8,<label_0x20008>
	.word 0x0ec20008  ! 392: BRGEZ	brgez  ,nt	%8,<label_0x20008>
	.word 0x865a0009  ! 393: SMUL_R	smul 	%r8, %r9, %r3
	.word 0x8143c000  ! 394: STBAR	stbar
	.word 0xc4ba28b4  ! 395: STDA_I	stda	%r2, [%r8 + 0x08b4] %asi
	.word 0xcde21009  ! 396: CASA_I	casa	[%r8] 0x80, %r9, %r6
	.word 0xcec22090  ! 397: LDSWA_I	ldswa	[%r8, + 0x0090] %asi, %r7
	.word 0x08800008  ! 398: BLEU	bleu  	<label_0x8>
	.word 0xc8fa2adc  ! 399: SWAPA_I	swapa	%r4, [%r8 + 0x0adc] %asi
	.word 0xcca22c10  ! 400: STWA_I	stwa	%r6, [%r8 + 0x0c10] %asi
	.word 0xc4aa2404  ! 401: STBA_I	stba	%r2, [%r8 + 0x0404] %asi
	.word 0x8143e011  ! 402: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xdeb21009  ! 403: STHA_R	stha	%r15, [%r8 + %r9] 0x80
	.word 0xcff21009  ! 404: CASXA_I	casxa	[%r8] 0x80, %r9, %r7
	.word 0xacda2994  ! 405: SMULcc_I	smulcc 	%r8, 0x0994, %r22
	.word 0x16800008  ! 406: BGE	bge  	<label_0x8>
	.word 0xa86a23fc  ! 407: UDIVX_I	udivx 	%r8, 0x03fc, %r20
	.word 0xc89a2084  ! 408: LDDA_I	ldda	[%r8, + 0x0084] %asi, %r4
	.word 0x8afa24b4  ! 409: SDIVcc_I	sdivcc 	%r8, 0x04b4, %r5
	.word 0xc64a0009  ! 410: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xcac21009  ! 411: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r5
	.word 0x9c7a25fc  ! 412: SDIV_I	sdiv 	%r8, 0x05fc, %r14
	.word 0x85a209a9  ! 413: FDIVs	fdivs	%f8, %f9, %f2
	.word 0xe8f2241c  ! 414: STXA_I	stxa	%r20, [%r8 + 0x041c] %asi
	.word 0x8ba20829  ! 415: FADDs	fadds	%f8, %f9, %f5
	.word 0xf0922ca8  ! 416: LDUHA_I	lduha	[%r8, + 0x0ca8] %asi, %r24
	.word 0xc2da2b98  ! 417: LDXA_I	ldxa	[%r8, + 0x0b98] %asi, %r1
	.word 0x8143c000  ! 418: STBAR	stbar
	.word 0x8143c000  ! 419: STBAR	stbar
	.word 0xb26a2a10  ! 420: UDIVX_I	udivx 	%r8, 0x0a10, %r25
	.word 0xcc6a0009  ! 421: LDSTUB_R	ldstub	%r6, [%r8 + %r9]
	.word 0xa3a209a9  ! 422: FDIVs	fdivs	%f8, %f9, %f17
	.word 0x86f20009  ! 423: UDIVcc_R	udivcc 	%r8, %r9, %r3
	.word 0xee6a2c1c  ! 424: LDSTUB_I	ldstub	%r23, [%r8 + 0x0c1c]
	.word 0xc24a25b0  ! 425: LDSB_I	ldsb	[%r8 + 0x05b0], %r1
	.word 0xf4a22998  ! 426: STWA_I	stwa	%r26, [%r8 + 0x0998] %asi
	.word 0x8143e011  ! 427: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xdcfa1009  ! 428: SWAPA_R	swapa	%r14, [%r8 + %r9] 0x80
	.word 0xdd3a0009  ! 429: STDF_R	std	%f14, [%r9, %r8]
	.word 0x8143c000  ! 430: STBAR	stbar
	.word 0xc2ca1009  ! 431: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r1
	.word 0x06ca0004  ! 432: BRLZ	brlz  ,pt	%8,<label_0xa0004>
	.word 0x96720009  ! 433: UDIV_R	udiv 	%r8, %r9, %r11
	.word 0xd6b2274c  ! 434: STHA_I	stha	%r11, [%r8 + 0x074c] %asi
	.word 0xb24a2a30  ! 435: MULX_I	mulx 	%r8, 0x0a30, %r25
	.word 0x86da248c  ! 436: SMULcc_I	smulcc 	%r8, 0x048c, %r3
	.word 0xc3ea1009  ! 437: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc2c228ec  ! 438: LDSWA_I	ldswa	[%r8, + 0x08ec] %asi, %r1
	.word 0xc6ca2ce4  ! 439: LDSBA_I	ldsba	[%r8, + 0x0ce4] %asi, %r3
	.word 0x8143e011  ! 440: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x8143c000  ! 441: STBAR	stbar
	.word 0x8eda0009  ! 442: SMULcc_R	smulcc 	%r8, %r9, %r7
	.word 0xe65a21b8  ! 443: LDX_I	ldx	[%r8 + 0x01b8], %r19
	.word 0x8fa209a9  ! 444: FDIVs	fdivs	%f8, %f9, %f7
	.word 0x16800004  ! 445: BGE	bge  	<label_0x4>
	.word 0x40000004  ! 446: CALL	call	disp30_4
	.word 0xcf220009  ! 447: STF_R	st	%f7, [%r9, %r8]
	.word 0xde921009  ! 448: LDUHA_R	lduha	[%r8, %r9] 0x80, %r15
	.word 0xb0f20009  ! 449: UDIVcc_R	udivcc 	%r8, %r9, %r24
	.word 0xca122eac  ! 450: LDUH_I	lduh	[%r8 + 0x0eac], %r5
	.word 0xc36a1009  ! 451: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0x8ef20009  ! 452: UDIVcc_R	udivcc 	%r8, %r9, %r7
	.word 0xc4c21009  ! 453: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r2
	.word 0x8143e011  ! 454: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xc47a0009  ! 455: SWAP_R	swap	%r2, [%r8 + %r9]
	.word 0xdf222770  ! 456: STF_I	st	%f15, [0x0770, %r8]
	.word 0x8cfa2590  ! 457: SDIVcc_I	sdivcc 	%r8, 0x0590, %r6
	.word 0x83a209a9  ! 458: FDIVs	fdivs	%f8, %f9, %f1
	.word 0x98da2fd0  ! 459: SMULcc_I	smulcc 	%r8, 0x0fd0, %r12
	.word 0xdeb2271c  ! 460: STHA_I	stha	%r15, [%r8 + 0x071c] %asi
	.word 0xdeca2508  ! 461: LDSBA_I	ldsba	[%r8, + 0x0508] %asi, %r15
	.word 0xdec21009  ! 462: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r15
	.word 0x89a208a9  ! 463: FSUBs	fsubs	%f8, %f9, %f4
	.word 0xceb21009  ! 464: STHA_R	stha	%r7, [%r8 + %r9] 0x80
	.word 0x8da209a9  ! 465: FDIVs	fdivs	%f8, %f9, %f6
	.word 0xc36a2a14  ! 466: PREFETCH_I	prefetch	[%r8 + 0x0a14], #one_read
	.word 0xce022ae4  ! 467: LDUW_I	lduw	[%r8 + 0x0ae4], %r7
	.word 0x83a209a9  ! 468: FDIVs	fdivs	%f8, %f9, %f1
	.word 0xc46a0009  ! 469: LDSTUB_R	ldstub	%r2, [%r8 + %r9]
	.word 0xc86a0009  ! 470: LDSTUB_R	ldstub	%r4, [%r8 + %r9]
	.word 0x8a72271c  ! 471: UDIV_I	udiv 	%r8, 0x071c, %r5
	.word 0xcbf22009  ! 472: CASXA_R	casxa	[%r8]%asi, %r9, %r5
	.word 0xa8720009  ! 473: UDIV_R	udiv 	%r8, %r9, %r20
	.word 0xc8822a08  ! 474: LDUWA_I	lduwa	[%r8, + 0x0a08] %asi, %r4
	.word 0xcea22a0c  ! 475: STWA_I	stwa	%r7, [%r8 + 0x0a0c] %asi
	.word 0xdcfa2550  ! 476: SWAPA_I	swapa	%r14, [%r8 + 0x0550] %asi
	.word 0xc8ca22e8  ! 477: LDSBA_I	ldsba	[%r8, + 0x02e8] %asi, %r4
	.word 0x40000004  ! 478: CALL	call	disp30_4
	.word 0xc9f21009  ! 479: CASXA_I	casxa	[%r8] 0x80, %r9, %r4
	.word 0xc27a2e10  ! 480: SWAP_I	swap	%r1, [%r8 + 0x0e10]
	.word 0xf6ca2434  ! 481: LDSBA_I	ldsba	[%r8, + 0x0434] %asi, %r27
	.word 0xc80a0009  ! 482: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xc3ea21f8  ! 483: PREFETCHA_I	prefetcha	[%r8, + 0x01f8] %asi, #one_read
	.word 0xded22cc8  ! 484: LDSHA_I	ldsha	[%r8, + 0x0cc8] %asi, %r15
	.word 0xb44a20ac  ! 485: MULX_I	mulx 	%r8, 0x00ac, %r26
	.word 0xc6f2203c  ! 487: STXA_I	stxa	%r3, [%r8 + 0x003c] %asi
	.word 0x08800004  ! 488: BLEU	bleu  	<label_0x4>
	.word 0x8143e011  ! 489: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x40000004  ! 490: CALL	call	disp30_4
	.word 0xf7222a30  ! 492: STF_I	st	%f27, [0x0a30, %r8]
	.word 0x26c20008  ! 493: BRLZ	brlz,a,nt	%8,<label_0x20008>
	.word 0x02800008  ! 494: BE	be  	<label_0x8>
	.word 0xdc1a0009  ! 495: LDD_R	ldd	[%r8 + %r9], %r14
	.word 0xf042274c  ! 496: LDSW_I	ldsw	[%r8 + 0x074c], %r24
	.word 0xc20a2460  ! 497: LDUB_I	ldub	[%r8 + 0x0460], %r1
	.word 0xccf21009  ! 498: STXA_R	stxa	%r6, [%r8 + %r9] 0x80
	.word 0xc8ca1009  ! 499: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r4
	.word 0xc9f21009  ! 500: CASXA_I	casxa	[%r8] 0x80, %r9, %r4
	.word 0xc722273c  ! 501: STF_I	st	%f3, [0x073c, %r8]
	.word 0xdeaa1009  ! 502: STBA_R	stba	%r15, [%r8 + %r9] 0x80
	.word 0x8143e011  ! 503: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xe6fa2c70  ! 504: SWAPA_I	swapa	%r19, [%r8 + 0x0c70] %asi
	.word 0x3c800004  ! 505: BPOS	bpos,a	<label_0x4>
	.word 0xc3f21009  ! 506: CASXA_I	casxa	[%r8] 0x80, %r9, %r1
	.word 0xda020009  ! 507: LDUW_R	lduw	[%r8 + %r9], %r13
	.word 0x0cca0004  ! 508: BRGZ	brgz  ,pt	%8,<label_0xa0004>
	.word 0x3a800004  ! 509: BCC	bcc,a	<label_0x4>
	.word 0xc36a2600  ! 510: PREFETCH_I	prefetch	[%r8 + 0x0600], #one_read
	.word 0x98f227e0  ! 511: UDIVcc_I	udivcc 	%r8, 0x07e0, %r12
	.word 0xd45a0009  ! 512: LDX_R	ldx	[%r8 + %r9], %r10
	.word 0xc80a2448  ! 513: LDUB_I	ldub	[%r8 + 0x0448], %r4
	.word 0x82da2624  ! 514: SMULcc_I	smulcc 	%r8, 0x0624, %r1
	.word 0xe0da2e54  ! 515: LDXA_I	ldxa	[%r8, + 0x0e54] %asi, %r16
	.word 0xb6520009  ! 516: UMUL_R	umul 	%r8, %r9, %r27
	.word 0x8fa20829  ! 518: FADDs	fadds	%f8, %f9, %f7
	.word 0xcaa22f80  ! 519: STWA_I	stwa	%r5, [%r8 + 0x0f80] %asi
	.word 0x8143e011  ! 520: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x8143c000  ! 521: STBAR	stbar
	.word 0x8143c000  ! 523: STBAR	stbar
	.word 0xd5220009  ! 524: STF_R	st	%f10, [%r9, %r8]
	.word 0xc36a1009  ! 525: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xf0aa2788  ! 526: STBA_I	stba	%r24, [%r8 + 0x0788] %asi
	.word 0x8a6a2824  ! 527: UDIVX_I	udivx 	%r8, 0x0824, %r5
	.word 0x965a0009  ! 528: SMUL_R	smul 	%r8, %r9, %r11
	.word 0x8143e011  ! 529: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x887a0009  ! 530: SDIV_R	sdiv 	%r8, %r9, %r4
	.word 0xc2fa1009  ! 532: SWAPA_R	swapa	%r1, [%r8 + %r9] 0x80
	.word 0x8143e011  ! 533: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xc2520009  ! 534: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xce520009  ! 535: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xe89a2330  ! 536: LDDA_I	ldda	[%r8, + 0x0330] %asi, %r20
	.word 0x08800008  ! 537: BLEU	bleu  	<label_0x8>
	.word 0x86720009  ! 538: UDIV_R	udiv 	%r8, %r9, %r3
	.word 0xc3ea2168  ! 539: PREFETCHA_I	prefetcha	[%r8, + 0x0168] %asi, #one_read
	.word 0xc24a28a8  ! 540: LDSB_I	ldsb	[%r8 + 0x08a8], %r1
	.word 0xc212208c  ! 541: LDUH_I	lduh	[%r8 + 0x008c], %r1
	.word 0xf28a2cd0  ! 542: LDUBA_I	lduba	[%r8, + 0x0cd0] %asi, %r25
	.word 0x8143e011  ! 543: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xe46a26bc  ! 544: LDSTUB_I	ldstub	%r18, [%r8 + 0x06bc]
	.word 0xd49a1009  ! 545: LDDA_R	ldda	[%r8, %r9] 0x80, %r10
	.word 0x8143e011  ! 546: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xfc6a2290  ! 547: LDSTUB_I	ldstub	%r30, [%r8 + 0x0290]
	.word 0xf09a2fac  ! 548: LDDA_I	ldda	[%r8, + 0x0fac] %asi, %r24
	.word 0x82d22dcc  ! 549: UMULcc_I	umulcc 	%r8, 0x0dcc, %r1
	.word 0x8143c000  ! 550: STBAR	stbar
	.word 0xc36a220c  ! 551: PREFETCH_I	prefetch	[%r8 + 0x020c], #one_read
	.word 0x88da22b8  ! 552: SMULcc_I	smulcc 	%r8, 0x02b8, %r4
	.word 0xcfe22009  ! 553: CASA_R	casa	[%r8] %asi, %r9, %r7
	.word 0xc8b21009  ! 554: STHA_R	stha	%r4, [%r8 + %r9] 0x80
	.word 0x86720009  ! 555: UDIV_R	udiv 	%r8, %r9, %r3
	.word 0xee92280c  ! 558: LDUHA_I	lduha	[%r8, + 0x080c] %asi, %r23
	.word 0xbd6a0009  ! 559: SDIVX_R	sdivx	%r8, %r9, %r30
	.word 0xc4a21009  ! 560: STWA_R	stwa	%r2, [%r8 + %r9] 0x80
	.word 0xc2a22834  ! 561: STWA_I	stwa	%r1, [%r8 + 0x0834] %asi
	.word 0x8ada2564  ! 562: SMULcc_I	smulcc 	%r8, 0x0564, %r5
	.word 0xcc6a27cc  ! 563: LDSTUB_I	ldstub	%r6, [%r8 + 0x07cc]
	.word 0x22800008  ! 564: BE	be,a	<label_0x8>
	.word 0xc3ea1009  ! 565: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xcafa2a7c  ! 566: SWAPA_I	swapa	%r5, [%r8 + 0x0a7c] %asi
	.word 0xc7e21009  ! 568: CASA_I	casa	[%r8] 0x80, %r9, %r3
	.word 0xc2520009  ! 569: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xcca22e40  ! 570: STWA_I	stwa	%r6, [%r8 + 0x0e40] %asi
	.word 0xc47a0009  ! 571: SWAP_R	swap	%r2, [%r8 + %r9]
	.word 0xcd3a2758  ! 572: STDF_I	std	%f6, [0x0758, %r8]
	.word 0xc4fa1009  ! 573: SWAPA_R	swapa	%r2, [%r8 + %r9] 0x80
	.word 0x8a7a0009  ! 574: SDIV_R	sdiv 	%r8, %r9, %r5
	.word 0x8143c000  ! 575: STBAR	stbar
	.word 0xc33a2a10  ! 576: STDF_I	std	%f1, [0x0a10, %r8]
	.word 0xf40a0009  ! 578: LDUB_R	ldub	[%r8 + %r9], %r26
	.word 0xc45a2c4c  ! 579: LDX_I	ldx	[%r8 + 0x0c4c], %r2
	.word 0x88d20009  ! 580: UMULcc_R	umulcc 	%r8, %r9, %r4
	.word 0xdbf21009  ! 581: CASXA_I	casxa	[%r8] 0x80, %r9, %r13
	.word 0x8143c000  ! 582: STBAR	stbar
	.word 0xcca222f8  ! 583: STWA_I	stwa	%r6, [%r8 + 0x02f8] %asi
	.word 0xc3ea2d24  ! 584: PREFETCHA_I	prefetcha	[%r8, + 0x0d24] %asi, #one_read
	.word 0xc47a2318  ! 585: SWAP_I	swap	%r2, [%r8 + 0x0318]
	.word 0xf4d2215c  ! 586: LDSHA_I	ldsha	[%r8, + 0x015c] %asi, %r26
	.word 0x8143c000  ! 587: STBAR	stbar
	.word 0xaba209a9  ! 588: FDIVs	fdivs	%f8, %f9, %f21
	.word 0xceb21009  ! 589: STHA_R	stha	%r7, [%r8 + %r9] 0x80
	.word 0xc4020009  ! 590: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xab6a2910  ! 591: SDIVX_I	sdivx	%r8, 0x0910, %r21
	.word 0x847a0009  ! 592: SDIV_R	sdiv 	%r8, %r9, %r2
	.word 0xc9f21009  ! 593: CASXA_I	casxa	[%r8] 0x80, %r9, %r4
	.word 0x8143c000  ! 594: STBAR	stbar
	.word 0x88f20009  ! 595: UDIVcc_R	udivcc 	%r8, %r9, %r4
	.word 0xc8fa22fc  ! 596: SWAPA_I	swapa	%r4, [%r8 + 0x02fc] %asi
	.word 0xc6a22d84  ! 597: STWA_I	stwa	%r3, [%r8 + 0x0d84] %asi
	.word 0xda8a29d4  ! 598: LDUBA_I	lduba	[%r8, + 0x09d4] %asi, %r13
	.word 0xe3f21009  ! 599: CASXA_I	casxa	[%r8] 0x80, %r9, %r17
	.word 0x9a5229c0  ! 600: UMUL_I	umul 	%r8, 0x09c0, %r13
	.word 0x8f220009  ! 601: MULScc_R	mulscc 	%r8, %r9, %r7
	.word 0xc3220009  ! 602: STF_R	st	%f1, [%r9, %r8]
	.word 0xc2d21009  ! 603: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r1
	.word 0x0cc20008  ! 604: BRGZ	brgz  ,nt	%8,<label_0x20008>
	.word 0x8a6a2d34  ! 605: UDIVX_I	udivx 	%r8, 0x0d34, %r5
	.word 0x8143e011  ! 606: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x83a20929  ! 607: FMULs	fmuls	%f8, %f9, %f1
	.word 0xe0d223f4  ! 608: LDSHA_I	ldsha	[%r8, + 0x03f4] %asi, %r16
	.word 0x40000004  ! 609: CALL	call	disp30_4
	.word 0x96f222d8  ! 610: UDIVcc_I	udivcc 	%r8, 0x02d8, %r11
	.word 0xce0a0009  ! 611: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xcaca1009  ! 612: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r5
	.word 0x8143e011  ! 613: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x04800004  ! 614: BLE	ble  	<label_0x4>
	.word 0xc4020009  ! 615: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0x98d22cb4  ! 616: UMULcc_I	umulcc 	%r8, 0x0cb4, %r12
	.word 0xc36a22c4  ! 617: PREFETCH_I	prefetch	[%r8 + 0x02c4], #one_read
	.word 0x8143e011  ! 620: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xc2da1009  ! 621: LDXA_R	ldxa	[%r8, %r9] 0x80, %r1
	.word 0x8fa208a9  ! 622: FSUBs	fsubs	%f8, %f9, %f7
	.word 0xcaa21009  ! 623: STWA_R	stwa	%r5, [%r8 + %r9] 0x80
	.word 0xc8a21009  ! 624: STWA_R	stwa	%r4, [%r8 + %r9] 0x80
	.word 0xeeea2e58  ! 625: LDSTUBA_I	ldstuba	%r23, [%r8 + 0x0e58] %asi
	.word 0xe6422fc0  ! 626: LDSW_I	ldsw	[%r8 + 0x0fc0], %r19
	.word 0x26800008  ! 627: BL	bl,a	<label_0x8>
	.word 0xf01a22e8  ! 629: LDD_I	ldd	[%r8 + 0x02e8], %r24
	.word 0x8143c000  ! 630: STBAR	stbar
	.word 0x8143c000  ! 631: STBAR	stbar
	.word 0xc3ea2d44  ! 632: PREFETCHA_I	prefetcha	[%r8, + 0x0d44] %asi, #one_read
	.word 0xffe22009  ! 633: CASA_R	casa	[%r8] %asi, %r9, %r31
	.word 0x8143e011  ! 634: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x0c800004  ! 635: BNEG	bneg  	<label_0x4>
	.word 0xc20a0009  ! 636: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xcc8a1009  ! 638: LDUBA_R	lduba	[%r8, %r9] 0x80, %r6
	.word 0xccfa273c  ! 639: SWAPA_I	swapa	%r6, [%r8 + 0x073c] %asi
	.word 0x97a209a9  ! 640: FDIVs	fdivs	%f8, %f9, %f11
	.word 0xfe821009  ! 641: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r31
	.word 0xec9a1009  ! 642: LDDA_R	ldda	[%r8, %r9] 0x80, %r22
	.word 0xc8022498  ! 643: LDUW_I	lduw	[%r8 + 0x0498], %r4
	.word 0x8143c000  ! 644: STBAR	stbar
	.word 0xceb228c0  ! 645: STHA_I	stha	%r7, [%r8 + 0x08c0] %asi
	.word 0xc33a0009  ! 646: STDF_R	std	%f1, [%r9, %r8]
	.word 0x8143e011  ! 647: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x2ac20004  ! 648: BRNZ	brnz,a,nt	%8,<label_0x20004>
	.word 0x8143c000  ! 649: STBAR	stbar
	.word 0xbe7a2a64  ! 650: SDIV_I	sdiv 	%r8, 0x0a64, %r31
	.word 0xe01a2254  ! 651: LDD_I	ldd	[%r8 + 0x0254], %r16
	.word 0xc4aa2188  ! 652: STBA_I	stba	%r2, [%r8 + 0x0188] %asi
	.word 0x8143e011  ! 653: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x2e800008  ! 654: BVS	bvs,a	<label_0x8>
	.word 0x826a2eec  ! 655: UDIVX_I	udivx 	%r8, 0x0eec, %r1
	.word 0x88da0009  ! 656: SMULcc_R	smulcc 	%r8, %r9, %r4
	.word 0xc86a0009  ! 657: LDSTUB_R	ldstub	%r4, [%r8 + %r9]
	.word 0xc36a2d34  ! 658: PREFETCH_I	prefetch	[%r8 + 0x0d34], #one_read
	.word 0xccb226b4  ! 659: STHA_I	stha	%r6, [%r8 + 0x06b4] %asi
	.word 0x856a2414  ! 660: SDIVX_I	sdivx	%r8, 0x0414, %r2
	.word 0xceca2360  ! 661: LDSBA_I	ldsba	[%r8, + 0x0360] %asi, %r7
	.word 0x40000004  ! 663: CALL	call	disp30_4
	.word 0xceea2018  ! 664: LDSTUBA_I	ldstuba	%r7, [%r8 + 0x0018] %asi
	.word 0x8ad20009  ! 665: UMULcc_R	umulcc 	%r8, %r9, %r5
	.word 0xcf2224e4  ! 667: STF_I	st	%f7, [0x04e4, %r8]
	.word 0xc8b22cc8  ! 669: STHA_I	stha	%r4, [%r8 + 0x0cc8] %asi
	.word 0x8143c000  ! 670: STBAR	stbar
	.word 0xca7a2fc8  ! 671: SWAP_I	swap	%r5, [%r8 + 0x0fc8]
	.word 0x2ac20004  ! 672: BRNZ	brnz,a,nt	%8,<label_0x20004>
	.word 0xf8f21009  ! 673: STXA_R	stxa	%r28, [%r8 + %r9] 0x80
	.word 0xc36a2388  ! 674: PREFETCH_I	prefetch	[%r8 + 0x0388], #one_read
	.word 0xc72220f4  ! 675: STF_I	st	%f3, [0x00f4, %r8]
	.word 0x82d20009  ! 677: UMULcc_R	umulcc 	%r8, %r9, %r1
	.word 0x28800008  ! 678: BLEU	bleu,a	<label_0x8>
	.word 0xc53a0009  ! 679: STDF_R	std	%f2, [%r9, %r8]
	.word 0x8143e011  ! 680: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x06800004  ! 681: BL	bl  	<label_0x4>
	.word 0xc46a2c80  ! 682: LDSTUB_I	ldstub	%r2, [%r8 + 0x0c80]
	.word 0x8d222264  ! 683: MULScc_I	mulscc 	%r8, 0x0264, %r6
	.word 0xc4a22bd4  ! 685: STWA_I	stwa	%r2, [%r8 + 0x0bd4] %asi
	.word 0xce122f6c  ! 686: LDUH_I	lduh	[%r8 + 0x0f6c], %r7
	.word 0xc6b229a0  ! 687: STHA_I	stha	%r3, [%r8 + 0x09a0] %asi
	.word 0x96522138  ! 688: UMUL_I	umul 	%r8, 0x0138, %r11
	.word 0xc8aa1009  ! 689: STBA_R	stba	%r4, [%r8 + %r9] 0x80
	.word 0xd65a0009  ! 690: LDX_R	ldx	[%r8 + %r9], %r11
	.word 0xc93a2fc0  ! 691: STDF_I	std	%f4, [0x0fc0, %r8]
	.word 0x9c520009  ! 692: UMUL_R	umul 	%r8, %r9, %r14
	.word 0xc36a2bd0  ! 693: PREFETCH_I	prefetch	[%r8 + 0x0bd0], #one_read
	.word 0x06800008  ! 694: BL	bl  	<label_0x8>
	.word 0x88f225ac  ! 695: UDIVcc_I	udivcc 	%r8, 0x05ac, %r4
	.word 0xc64a2fc4  ! 696: LDSB_I	ldsb	[%r8 + 0x0fc4], %r3
	.word 0xc6f228d0  ! 697: STXA_I	stxa	%r3, [%r8 + 0x08d0] %asi
	.word 0xbc4a0009  ! 698: MULX_R	mulx 	%r8, %r9, %r30
	.word 0xc2da1009  ! 699: LDXA_R	ldxa	[%r8, %r9] 0x80, %r1
	.word 0x88da25cc  ! 700: SMULcc_I	smulcc 	%r8, 0x05cc, %r4
	.word 0xc3f21009  ! 701: CASXA_I	casxa	[%r8] 0x80, %r9, %r1
	.word 0x8f220009  ! 702: MULScc_R	mulscc 	%r8, %r9, %r7
	.word 0x8143c000  ! 703: STBAR	stbar
	.word 0xcfe21009  ! 704: CASA_I	casa	[%r8] 0x80, %r9, %r7
	.word 0x885221a0  ! 705: UMUL_I	umul 	%r8, 0x01a0, %r4
	.word 0x8c5224cc  ! 706: UMUL_I	umul 	%r8, 0x04cc, %r6
	.word 0xdc0a2bf4  ! 707: LDUB_I	ldub	[%r8 + 0x0bf4], %r14
	.word 0xd4921009  ! 708: LDUHA_R	lduha	[%r8, %r9] 0x80, %r10
	.word 0xc3ea1009  ! 709: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xce122d34  ! 710: LDUH_I	lduh	[%r8 + 0x0d34], %r7
	.word 0xc85a2774  ! 712: LDX_I	ldx	[%r8 + 0x0774], %r4
	.word 0xe80a0009  ! 713: LDUB_R	ldub	[%r8 + %r9], %r20
	.word 0x86720009  ! 715: UDIV_R	udiv 	%r8, %r9, %r3
	.word 0xfa420009  ! 716: LDSW_R	ldsw	[%r8 + %r9], %r29
	.word 0xc66a0009  ! 718: LDSTUB_R	ldstub	%r3, [%r8 + %r9]
	.word 0x8cda268c  ! 719: SMULcc_I	smulcc 	%r8, 0x068c, %r6
	.word 0xf8d21009  ! 720: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r28
	.word 0xf2020009  ! 721: LDUW_R	lduw	[%r8 + %r9], %r25
	.word 0x8143e011  ! 722: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x2c800004  ! 723: BNEG	bneg,a	<label_0x4>
	.word 0x02800004  ! 724: BE	be  	<label_0x4>
	.word 0x8da209a9  ! 725: FDIVs	fdivs	%f8, %f9, %f6
	.word 0xcf222cdc  ! 726: STF_I	st	%f7, [0x0cdc, %r8]
	.word 0xecba1009  ! 727: STDA_R	stda	%r22, [%r8 + %r9] 0x80
	.word 0x0a800004  ! 728: BCS	bcs  	<label_0x4>
	.word 0x9ba209a9  ! 729: FDIVs	fdivs	%f8, %f9, %f13
	.word 0x985a0009  ! 730: SMUL_R	smul 	%r8, %r9, %r12
	.word 0xfeaa2494  ! 731: STBA_I	stba	%r31, [%r8 + 0x0494] %asi
	.word 0xcea21009  ! 732: STWA_R	stwa	%r7, [%r8 + %r9] 0x80
	.word 0x8143e011  ! 733: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xcef21009  ! 734: STXA_R	stxa	%r7, [%r8 + %r9] 0x80
	.word 0xcc1a0009  ! 735: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xc3ea1009  ! 736: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc4022964  ! 737: LDUW_I	lduw	[%r8 + 0x0964], %r2
	.word 0x8143c000  ! 738: STBAR	stbar
	.word 0x8ba20929  ! 739: FMULs	fmuls	%f8, %f9, %f5
	.word 0x2ac20004  ! 740: BRNZ	brnz,a,nt	%8,<label_0x20004>
	.word 0x8ed20009  ! 741: UMULcc_R	umulcc 	%r8, %r9, %r7
	.word 0xc8922778  ! 742: LDUHA_I	lduha	[%r8, + 0x0778] %asi, %r4
	.word 0x8a6a20d0  ! 743: UDIVX_I	udivx 	%r8, 0x00d0, %r5
	.word 0xc9e22009  ! 744: CASA_R	casa	[%r8] %asi, %r9, %r4
	.word 0x8143c000  ! 745: STBAR	stbar
	.word 0xc67a26cc  ! 746: SWAP_I	swap	%r3, [%r8 + 0x06cc]
	.word 0x8e7a2f58  ! 747: SDIV_I	sdiv 	%r8, 0x0f58, %r7
	.word 0xae5a0009  ! 748: SMUL_R	smul 	%r8, %r9, %r23
	.word 0xc3ea1009  ! 749: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x8efa2604  ! 750: SDIVcc_I	sdivcc 	%r8, 0x0604, %r7
	.word 0xcf3a0009  ! 751: STDF_R	std	%f7, [%r9, %r8]
	.word 0xca8a1009  ! 752: LDUBA_R	lduba	[%r8, %r9] 0x80, %r5
	.word 0xc24a0009  ! 754: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xcb2222d8  ! 755: STF_I	st	%f5, [0x02d8, %r8]
	.word 0xd46a25bc  ! 757: LDSTUB_I	ldstub	%r10, [%r8 + 0x05bc]
	.word 0x12800004  ! 758: BNE	bne  	<label_0x4>
	.word 0xd4b2219c  ! 759: STHA_I	stha	%r10, [%r8 + 0x019c] %asi
	.word 0xfcb2241c  ! 760: STHA_I	stha	%r30, [%r8 + 0x041c] %asi
	.word 0xcd3a2fcc  ! 761: STDF_I	std	%f6, [0x0fcc, %r8]
	.word 0xc2aa2f0c  ! 762: STBA_I	stba	%r1, [%r8 + 0x0f0c] %asi
	.word 0xc8c21009  ! 763: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r4
	.word 0xc33a2968  ! 764: STDF_I	std	%f1, [0x0968, %r8]
	.word 0x8143e011  ! 765: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x40000004  ! 766: CALL	call	disp30_4
	.word 0xecb21009  ! 767: STHA_R	stha	%r22, [%r8 + %r9] 0x80
	.word 0xf8ca1009  ! 768: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r28
	.word 0x8143e011  ! 769: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xaa520009  ! 770: UMUL_R	umul 	%r8, %r9, %r21
	.word 0xfc0a0009  ! 771: LDUB_R	ldub	[%r8 + %r9], %r30
	.word 0xc4a21009  ! 772: STWA_R	stwa	%r2, [%r8 + %r9] 0x80
	.word 0xe81a0009  ! 773: LDD_R	ldd	[%r8 + %r9], %r20
	.word 0x08800004  ! 774: BLEU	bleu  	<label_0x4>
	.word 0xc3ea1009  ! 775: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc8ba1009  ! 776: STDA_R	stda	%r4, [%r8 + %r9] 0x80
	.word 0x8d6a226c  ! 778: SDIVX_I	sdivx	%r8, 0x026c, %r6
	.word 0xce020009  ! 779: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xd4422bcc  ! 780: LDSW_I	ldsw	[%r8 + 0x0bcc], %r10
	.word 0xf492207c  ! 781: LDUHA_I	lduha	[%r8, + 0x007c] %asi, %r26
	.word 0xe4ea1009  ! 782: LDSTUBA_R	ldstuba	%r18, [%r8 + %r9] 0x80
	.word 0xc8d228c0  ! 783: LDSHA_I	ldsha	[%r8, + 0x08c0] %asi, %r4
	.word 0x0cc20004  ! 784: BRGZ	brgz  ,nt	%8,<label_0x20004>
	.word 0xdcda2e3c  ! 785: LDXA_I	ldxa	[%r8, + 0x0e3c] %asi, %r14
	.word 0xcb3a26fc  ! 786: STDF_I	std	%f5, [0x06fc, %r8]
	.word 0xc4ea27f4  ! 787: LDSTUBA_I	ldstuba	%r2, [%r8 + 0x07f4] %asi
	.word 0x06800008  ! 788: BL	bl  	<label_0x8>
	.word 0x8ba208a9  ! 789: FSUBs	fsubs	%f8, %f9, %f5
	.word 0x8143c000  ! 790: STBAR	stbar
	.word 0xf33a2a90  ! 791: STDF_I	std	%f25, [0x0a90, %r8]
	.word 0xcab21009  ! 792: STHA_R	stha	%r5, [%r8 + %r9] 0x80
	.word 0xf6da2154  ! 793: LDXA_I	ldxa	[%r8, + 0x0154] %asi, %r27
	.word 0xc4821009  ! 794: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r2
	.word 0xca12228c  ! 795: LDUH_I	lduh	[%r8 + 0x028c], %r5
	.word 0xc36a26b4  ! 796: PREFETCH_I	prefetch	[%r8 + 0x06b4], #one_read
	.word 0x8e4a0009  ! 798: MULX_R	mulx 	%r8, %r9, %r7
	.word 0x8143c000  ! 799: STBAR	stbar
	.word 0x8143e011  ! 800: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x82da0009  ! 802: SMULcc_R	smulcc 	%r8, %r9, %r1
	.word 0xcc1a0009  ! 803: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0x8143c000  ! 804: STBAR	stbar
	.word 0xc2fa1009  ! 805: SWAPA_R	swapa	%r1, [%r8 + %r9] 0x80
	.word 0xce5a0009  ! 806: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xccaa1009  ! 807: STBA_R	stba	%r6, [%r8 + %r9] 0x80
	.word 0xcc7a0009  ! 808: SWAP_R	swap	%r6, [%r8 + %r9]
	.word 0xc8ea2200  ! 809: LDSTUBA_I	ldstuba	%r4, [%r8 + 0x0200] %asi
	.word 0x2e800008  ! 810: BVS	bvs,a	<label_0x8>
	.word 0xcb3a0009  ! 811: STDF_R	std	%f5, [%r9, %r8]
	.word 0xf6aa1009  ! 812: STBA_R	stba	%r27, [%r8 + %r9] 0x80
	.word 0x84da2cd0  ! 813: SMULcc_I	smulcc 	%r8, 0x0cd0, %r2
	.word 0xf2b228b0  ! 814: STHA_I	stha	%r25, [%r8 + 0x08b0] %asi
	.word 0xa76a2a18  ! 815: SDIVX_I	sdivx	%r8, 0x0a18, %r19
	.word 0x87222368  ! 816: MULScc_I	mulscc 	%r8, 0x0368, %r3
	.word 0x8cfa0009  ! 817: SDIVcc_R	sdivcc 	%r8, %r9, %r6
	.word 0xc36a2704  ! 818: PREFETCH_I	prefetch	[%r8 + 0x0704], #one_read
	.word 0xc4da1009  ! 819: LDXA_R	ldxa	[%r8, %r9] 0x80, %r2
	.word 0x26c20008  ! 820: BRLZ	brlz,a,nt	%8,<label_0x20008>
	.word 0x3a800008  ! 821: BCC	bcc,a	<label_0x8>
	.word 0x8e7a2448  ! 822: SDIV_I	sdiv 	%r8, 0x0448, %r7
	.word 0x87a20929  ! 823: FMULs	fmuls	%f8, %f9, %f3
	.word 0xecba1009  ! 824: STDA_R	stda	%r22, [%r8 + %r9] 0x80
	.word 0xd8aa1009  ! 825: STBA_R	stba	%r12, [%r8 + %r9] 0x80
	.word 0xa0f20009  ! 826: UDIVcc_R	udivcc 	%r8, %r9, %r16
	.word 0xc2f21009  ! 827: STXA_R	stxa	%r1, [%r8 + %r9] 0x80
	.word 0xccea20f0  ! 828: LDSTUBA_I	ldstuba	%r6, [%r8 + 0x00f0] %asi
	.word 0xc44a2674  ! 829: LDSB_I	ldsb	[%r8 + 0x0674], %r2
	.word 0x04ca0004  ! 830: BRLEZ	brlez  ,pt	%8,<label_0xa0004>
	.word 0xcc5229c8  ! 831: LDSH_I	ldsh	[%r8 + 0x09c8], %r6
	.word 0xcc6a0009  ! 832: LDSTUB_R	ldstub	%r6, [%r8 + %r9]
	.word 0xe6522fd4  ! 833: LDSH_I	ldsh	[%r8 + 0x0fd4], %r19
	.word 0xc6f22f88  ! 834: STXA_I	stxa	%r3, [%r8 + 0x0f88] %asi
	.word 0x10800004  ! 835: BA	ba  	<label_0x4>
	.word 0xc3ea207c  ! 836: PREFETCHA_I	prefetcha	[%r8, + 0x007c] %asi, #one_read
	.word 0xd7f22009  ! 837: CASXA_R	casxa	[%r8]%asi, %r9, %r11
	.word 0x8143c000  ! 838: STBAR	stbar
	.word 0xca120009  ! 839: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xccaa296c  ! 840: STBA_I	stba	%r6, [%r8 + 0x096c] %asi
	.word 0xca7a0009  ! 841: SWAP_R	swap	%r5, [%r8 + %r9]
	.word 0xce4a2b7c  ! 842: LDSB_I	ldsb	[%r8 + 0x0b7c], %r7
	.word 0x8143e011  ! 843: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x0aca0004  ! 844: BRNZ	brnz  ,pt	%8,<label_0xa0004>
	.word 0x34800004  ! 846: BG	bg,a	<label_0x4>
	.word 0x82da0009  ! 847: SMULcc_R	smulcc 	%r8, %r9, %r1
	.word 0x0c800004  ! 848: BNEG	bneg  	<label_0x4>
	.word 0xa46a0009  ! 849: UDIVX_R	udivx 	%r8, %r9, %r18
	.word 0xde6a2cd4  ! 850: LDSTUB_I	ldstub	%r15, [%r8 + 0x0cd4]
	.word 0xc2aa1009  ! 851: STBA_R	stba	%r1, [%r8 + %r9] 0x80
	.word 0xa4520009  ! 852: UMUL_R	umul 	%r8, %r9, %r18
	.word 0x98d224ec  ! 853: UMULcc_I	umulcc 	%r8, 0x04ec, %r12
	.word 0xc36a2050  ! 854: PREFETCH_I	prefetch	[%r8 + 0x0050], #one_read
	.word 0xf9220009  ! 855: STF_R	st	%f28, [%r9, %r8]
	.word 0xc46a2798  ! 856: LDSTUB_I	ldstub	%r2, [%r8 + 0x0798]
	.word 0xd60a0009  ! 857: LDUB_R	ldub	[%r8 + %r9], %r11
	.word 0xca5a2290  ! 858: LDX_I	ldx	[%r8 + 0x0290], %r5
	.word 0x82da0009  ! 859: SMULcc_R	smulcc 	%r8, %r9, %r1
	.word 0xc66a2504  ! 860: LDSTUB_I	ldstub	%r3, [%r8 + 0x0504]
	.word 0x8da209a9  ! 861: FDIVs	fdivs	%f8, %f9, %f6
	.word 0xbd6a0009  ! 862: SDIVX_R	sdivx	%r8, %r9, %r30
	.word 0xfa0a0009  ! 863: LDUB_R	ldub	[%r8 + %r9], %r29
	.word 0xe0c22a5c  ! 864: LDSWA_I	ldswa	[%r8, + 0x0a5c] %asi, %r16
	.word 0xcff22009  ! 865: CASXA_R	casxa	[%r8]%asi, %r9, %r7
	.word 0xca7a0009  ! 866: SWAP_R	swap	%r5, [%r8 + %r9]
	.word 0x89a20929  ! 867: FMULs	fmuls	%f8, %f9, %f4
	.word 0xce120009  ! 868: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xce921009  ! 869: LDUHA_R	lduha	[%r8, %r9] 0x80, %r7
	.word 0x8e720009  ! 870: UDIV_R	udiv 	%r8, %r9, %r7
	.word 0x14800004  ! 871: BG	bg  	<label_0x4>
	.word 0x85a20829  ! 872: FADDs	fadds	%f8, %f9, %f2
	.word 0xf0ba2738  ! 873: STDA_I	stda	%r24, [%r8 + 0x0738] %asi
	.word 0xd6c21009  ! 874: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r11
	.word 0xb7a208a9  ! 875: FSUBs	fsubs	%f8, %f9, %f27
	.word 0xccca1009  ! 876: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r6
	.word 0x8143e011  ! 877: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xbc7225f0  ! 878: UDIV_I	udiv 	%r8, 0x05f0, %r30
	.word 0xc3ea27d4  ! 879: PREFETCHA_I	prefetcha	[%r8, + 0x07d4] %asi, #one_read
	.word 0xdc1a2300  ! 880: LDD_I	ldd	[%r8 + 0x0300], %r14
	.word 0x0c800004  ! 881: BNEG	bneg  	<label_0x4>
	.word 0x8a5a0009  ! 883: SMUL_R	smul 	%r8, %r9, %r5
	.word 0xd4ba2830  ! 884: STDA_I	stda	%r10, [%r8 + 0x0830] %asi
	.word 0x89a20829  ! 885: FADDs	fadds	%f8, %f9, %f4
	.word 0xc73a0009  ! 886: STDF_R	std	%f3, [%r9, %r8]
	.word 0x88722b78  ! 887: UDIV_I	udiv 	%r8, 0x0b78, %r4
	.word 0x8af20009  ! 888: UDIVcc_R	udivcc 	%r8, %r9, %r5
	.word 0x8a7228cc  ! 889: UDIV_I	udiv 	%r8, 0x08cc, %r5
	.word 0xd48a1009  ! 890: LDUBA_R	lduba	[%r8, %r9] 0x80, %r10
	.word 0xcf220009  ! 891: STF_R	st	%f7, [%r9, %r8]
	.word 0xccb22a18  ! 892: STHA_I	stha	%r6, [%r8 + 0x0a18] %asi
	.word 0xec0a2ad0  ! 893: LDUB_I	ldub	[%r8 + 0x0ad0], %r22
	.word 0x9cfa2bac  ! 894: SDIVcc_I	sdivcc 	%r8, 0x0bac, %r14
	.word 0xc25a2e30  ! 895: LDX_I	ldx	[%r8 + 0x0e30], %r1
	.word 0xc3ea1009  ! 896: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x8e6a0009  ! 897: UDIVX_R	udivx 	%r8, %r9, %r7
	.word 0xec020009  ! 898: LDUW_R	lduw	[%r8 + %r9], %r22
	.word 0xcad21009  ! 899: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r5
	.word 0xc2da1009  ! 900: LDXA_R	ldxa	[%r8, %r9] 0x80, %r1
	.word 0x02c20004  ! 904: BRZ	brz  ,nt	%8,<label_0x20004>
	.word 0xcc7a2c50  ! 905: SWAP_I	swap	%r6, [%r8 + 0x0c50]
	.word 0x2a800004  ! 906: BCS	bcs,a	<label_0x4>
	.word 0xcb220009  ! 907: STF_R	st	%f5, [%r9, %r8]
	.word 0x84f20009  ! 908: UDIVcc_R	udivcc 	%r8, %r9, %r2
	.word 0xf4ba1009  ! 909: STDA_R	stda	%r26, [%r8 + %r9] 0x80
	.word 0xd49a2bf0  ! 910: LDDA_I	ldda	[%r8, + 0x0bf0] %asi, %r10
	.word 0xc3ea21d4  ! 911: PREFETCHA_I	prefetcha	[%r8, + 0x01d4] %asi, #one_read
	.word 0xce520009  ! 912: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0x8143e011  ! 913: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x8e7a2ba8  ! 914: SDIV_I	sdiv 	%r8, 0x0ba8, %r7
	.word 0xcaaa1009  ! 915: STBA_R	stba	%r5, [%r8 + %r9] 0x80
	.word 0x06c20004  ! 917: BRLZ	brlz  ,nt	%8,<label_0x20004>
	.word 0xf80a2438  ! 918: LDUB_I	ldub	[%r8 + 0x0438], %r28
	.word 0xc40a2104  ! 920: LDUB_I	ldub	[%r8 + 0x0104], %r2
	.word 0xe66a0009  ! 921: LDSTUB_R	ldstub	%r19, [%r8 + %r9]
	.word 0xbb6a2444  ! 922: SDIVX_I	sdivx	%r8, 0x0444, %r29
	.word 0xc8020009  ! 923: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xe0aa1009  ! 924: STBA_R	stba	%r16, [%r8 + %r9] 0x80
	.word 0xc36a1009  ! 925: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc93a0009  ! 926: STDF_R	std	%f4, [%r9, %r8]
	.word 0xc2ca2744  ! 927: LDSBA_I	ldsba	[%r8, + 0x0744] %asi, %r1
	.word 0xc4921009  ! 928: LDUHA_R	lduha	[%r8, %r9] 0x80, %r2
	.word 0xbafa0009  ! 929: SDIVcc_R	sdivcc 	%r8, %r9, %r29
	.word 0x8143e011  ! 930: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x8143c000  ! 931: STBAR	stbar
	.word 0x896a0009  ! 934: SDIVX_R	sdivx	%r8, %r9, %r4
	.word 0x8da208a9  ! 935: FSUBs	fsubs	%f8, %f9, %f6
	.word 0x22800004  ! 936: BE	be,a	<label_0x4>
	.word 0xccd21009  ! 937: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r6
	.word 0xe8821009  ! 938: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r20
	.word 0xa44a2f30  ! 939: MULX_I	mulx 	%r8, 0x0f30, %r18
	.word 0x8b220009  ! 940: MULScc_R	mulscc 	%r8, %r9, %r5
	.word 0xe49a1009  ! 941: LDDA_R	ldda	[%r8, %r9] 0x80, %r18
	.word 0x864a0009  ! 942: MULX_R	mulx 	%r8, %r9, %r3
	.word 0xc33a0009  ! 943: STDF_R	std	%f1, [%r9, %r8]
	.word 0x86d22ef0  ! 944: UMULcc_I	umulcc 	%r8, 0x0ef0, %r3
	.word 0xeaa21009  ! 945: STWA_R	stwa	%r21, [%r8 + %r9] 0x80
	.word 0xc86a0009  ! 946: LDSTUB_R	ldstub	%r4, [%r8 + %r9]
	.word 0x8da20929  ! 947: FMULs	fmuls	%f8, %f9, %f6
	.word 0xe4921009  ! 948: LDUHA_R	lduha	[%r8, %r9] 0x80, %r18
	.word 0x36800004  ! 949: BGE	bge,a	<label_0x4>
	.word 0xc36a2c80  ! 950: PREFETCH_I	prefetch	[%r8 + 0x0c80], #one_read
	.word 0xc4b22cdc  ! 951: STHA_I	stha	%r2, [%r8 + 0x0cdc] %asi
	.word 0xa7a20829  ! 952: FADDs	fadds	%f8, %f9, %f19
	.word 0xe6b21009  ! 953: STHA_R	stha	%r19, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 955: STBAR	stbar
	.word 0xbda20929  ! 956: FMULs	fmuls	%f8, %f9, %f30
	.word 0xa07a0009  ! 957: SDIV_R	sdiv 	%r8, %r9, %r16
	.word 0xc9220009  ! 958: STF_R	st	%f4, [%r9, %r8]
	.word 0xf1220009  ! 959: STF_R	st	%f24, [%r9, %r8]
	.word 0x86f20009  ! 960: UDIVcc_R	udivcc 	%r8, %r9, %r3
	.word 0xf5f21009  ! 961: CASXA_I	casxa	[%r8] 0x80, %r9, %r26
	.word 0x26800004  ! 962: BL	bl,a	<label_0x4>
	.word 0xc3ea24d4  ! 963: PREFETCHA_I	prefetcha	[%r8, + 0x04d4] %asi, #one_read
	.word 0xcc7a2be4  ! 965: SWAP_I	swap	%r6, [%r8 + 0x0be4]
	.word 0xc8da2454  ! 966: LDXA_I	ldxa	[%r8, + 0x0454] %asi, %r4
	.word 0x24c20008  ! 967: BRLEZ	brlez,a,nt	%8,<label_0x20008>
	.word 0xf9f21009  ! 968: CASXA_I	casxa	[%r8] 0x80, %r9, %r28
	.word 0x8a722108  ! 969: UDIV_I	udiv 	%r8, 0x0108, %r5
	.word 0xd9f21009  ! 970: CASXA_I	casxa	[%r8] 0x80, %r9, %r12
	.word 0x876a2074  ! 971: SDIVX_I	sdivx	%r8, 0x0074, %r3
	.word 0x8143c000  ! 972: STBAR	stbar
	.word 0x2a800004  ! 973: BCS	bcs,a	<label_0x4>
	.word 0xccb21009  ! 975: STHA_R	stha	%r6, [%r8 + %r9] 0x80
	.word 0x8ada0009  ! 976: SMULcc_R	smulcc 	%r8, %r9, %r5
	.word 0xa5a20829  ! 977: FADDs	fadds	%f8, %f9, %f18
	.word 0x892224ec  ! 978: MULScc_I	mulscc 	%r8, 0x04ec, %r4
	.word 0xf04a0009  ! 979: LDSB_R	ldsb	[%r8 + %r9], %r24
	.word 0xc2aa2150  ! 980: STBA_I	stba	%r1, [%r8 + 0x0150] %asi
	.word 0xe00a2550  ! 981: LDUB_I	ldub	[%r8 + 0x0550], %r16
	.word 0xea821009  ! 982: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r21
	.word 0xa56a0009  ! 983: SDIVX_R	sdivx	%r8, %r9, %r18
	.word 0x89a209a9  ! 984: FDIVs	fdivs	%f8, %f9, %f4
	.word 0xc36a2aac  ! 985: PREFETCH_I	prefetch	[%r8 + 0x0aac], #one_read
	.word 0xc73a2444  ! 986: STDF_I	std	%f3, [0x0444, %r8]
	.word 0x8143c000  ! 987: STBAR	stbar
	.word 0x2ac20008  ! 988: BRNZ	brnz,a,nt	%8,<label_0x20008>
	.word 0x8a6a2728  ! 989: UDIVX_I	udivx 	%r8, 0x0728, %r5
	.word 0xf0b22118  ! 990: STHA_I	stha	%r24, [%r8 + 0x0118] %asi
	.word 0x84d20009  ! 991: UMULcc_R	umulcc 	%r8, %r9, %r2
	.word 0xba52236c  ! 992: UMUL_I	umul 	%r8, 0x036c, %r29
	.word 0x8da208a9  ! 993: FSUBs	fsubs	%f8, %f9, %f6
	.word 0xa05a2328  ! 994: SMUL_I	smul 	%r8, 0x0328, %r16
	.word 0x06c20008  ! 995: BRLZ	brlz  ,nt	%8,<label_0x20008>
	.word 0xc53a2074  ! 996: STDF_I	std	%f2, [0x0074, %r8]
	.word 0x89a208a9  ! 997: FSUBs	fsubs	%f8, %f9, %f4
	.word 0xce8a2c54  ! 998: LDUBA_I	lduba	[%r8, + 0x0c54] %asi, %r7
	.word 0x8c5a2390  ! 999: SMUL_I	smul 	%r8, 0x0390, %r6
        ta      T_GOOD_TRAP

.data
	.word  0xe9d86e58,0x3ccb7730,0xc6cc9501,0x5ca1b938
	.word  0x49777ddf,0xde55fe32,0x51690614,0xd8de6097
	.word  0x3cbb6ebf,0xdc441886,0x1b39b322,0x050a1b56
	.word  0x817fbdc5,0x37603185,0xe931efca,0xed60f607
	.word  0x0ca9fae3,0x51bf9f3d,0x6bf80d59,0xc31b42b6
	.word  0xc9938bf5,0xea1b552e,0x3a98d013,0x39604d9b
	.word  0x88818019,0x57e8900c,0xb117b050,0x61c7a4a5
	.word  0xf39db37f,0x688ed705,0xca799e3e,0xe3a7edaf
	.word  0xee699b7b,0x1b1fde0a,0xafdc92b6,0xc1adf30a
	.word  0x1da9f957,0x6594b234,0x7e40451d,0xf85a1e6d
	.word  0x897f7a05,0xd0174b3a,0x2881301e,0xd97acfaf
	.word  0xfc9cdced,0x3326eff7,0xfbbffe21,0x0dbaca05
	.word  0x8bb3df3b,0x86b2e7f5,0x9eb55650,0x90ab77b4
	.word  0xec173798,0xdeacc920,0x4daff938,0x6a0b1efc
	.word  0x5d2b137f,0x003cc366,0x222a5445,0xb0f240b0
	.word  0xcdab2ef4,0x43145153,0xd05e2312,0x5a4270fb
	.word  0x7f043d43,0xc7c4f1b6,0x5327d3e8,0x8b8c02f3
	.word  0x93abf8cb,0x6b6b3c35,0x368bab14,0x2a571024
	.word  0x1a2956d1,0x1e6d96be,0xae277828,0xb9177ba6
	.word  0x4355dde9,0x1618559d,0xc11d78ec,0xa4324b6b
	.word  0xf2a18135,0x77aa66e9,0x977b48fe,0x150daa09
	.word  0x9735a26b,0x0555199e,0xf8838244,0x041f4207
	.word  0xe0386b5a,0x46b58515,0x2e91e112,0xdcb73e5e
	.word  0x7e096df1,0x0074f4e5,0x08a656f6,0x58f8c1e7
	.word  0x3d699bc3,0xb86cdd02,0xc4e6f10a,0xdaa82b90
	.word  0xf9d3929b,0xfb7f2c4e,0xb7f4091e,0x1a1d6cd7
	.word  0xa149cde3,0x1a92d4d5,0xf1bf5574,0x4ca494d7
	.word  0x4a702acd,0x6910fd41,0x2cafc2c0,0xfac3a02c
	.word  0x0d04b878,0xb046e117,0x3dc56257,0x1ddc42bf
	.word  0xe969821e,0x7e731b71,0x6aa20d6b,0x4177b8ff
	.word  0x4cffc891,0xcbd88ac9,0xbb35e3f7,0x8ab7fcdb
	.word  0x03568fc4,0x397a51c4,0xffe8b81a,0x0bb74fca
	.word  0xd9684a39,0xc37e1f98,0x70f1414c,0x9b447343
	.word  0x36c2d713,0x2f5e8331,0xfbaaf5d3,0x371c695a
	.word  0x4bf07bdd,0xedac4e94,0xee0b819c,0xe93a6c53
	.word  0xcdb89524,0xd716c499,0xc233616f,0x13d2ea1d
	.word  0xeb4621ae,0x3434183b,0x648a67e1,0x33a9db67
	.word  0x54c77103,0x663c379a,0x8aef0158,0x5c9a3ad2
	.word  0xbe1ae7c2,0x4583d858,0x6d371533,0xbce8fc78
	.word  0xb2655e30,0x4c2dd508,0x8ea6a240,0x968ac288
	.word  0x4ea1affa,0xf6869b7d,0xd64bec56,0xdd8dbbe4
	.word  0x7f168aa6,0xe6809291,0xd311257d,0x59bdc0ee
	.word  0x37043fce,0x88f3c963,0x66f326d2,0x2fd01275
	.word  0xd485a463,0xaef6302f,0x204cbaaf,0x139e2082
	.word  0xd7e74599,0xafe11ef9,0x8725618d,0x90988dde
	.word  0x54f384a7,0x0cd876af,0xd9d66714,0x69eebdc5
	.word  0x5c048a15,0x71051caa,0xf0a4885c,0xe62f3c58
	.word  0xf2ae8b0d,0x5ca3efea,0x0cb6682d,0x966b6b1c
	.word  0x7821118f,0x20c4570b,0x4ee48b04,0xb79c7ab1
	.word  0x340d2cec,0xa768d4ac,0x49fe436f,0x35313b57
	.word  0x2c77eb28,0xb12317e3,0x33b92c5d,0x7331c327
	.word  0x41b5f8f3,0x31aedc1f,0x35caf71a,0x1828fe40
	.word  0x83fc6ae0,0x70286f8c,0x7a4acff0,0x63b7b88f
	.word  0x5178812e,0x2e917c43,0x9dd01a3f,0x695b6049
	.word  0x84bdc320,0x8bf039d9,0x7ac24b67,0x50d917e4
	.word  0x609a39cf,0xcbdb54b7,0x6342fdb0,0x666340c5
	.word  0x28960311,0x77774918,0x6c3e2646,0xb2c75ee0
	.word  0xab530f9b,0x4e8fdb1a,0xe6b2093f,0x8131c8bb
	.word  0x42cf81e9,0xf898e874,0x21d73a4e,0xd8916a76
	.word  0x18d325e2,0xd2582ab1,0x33d7c4cb,0xa3afc9b5
	.word  0xd5c1fa6b,0x1ceb3ee3,0xbd94a987,0x1e9b1973
	.word  0x2649e96e,0x47fcc6d1,0xe7e6c535,0xcfe0b306
	.word  0x2c640a2f,0x518e0528,0x5d5e9b8a,0x9df31bb4
	.word  0xc2c0b1a2,0x887e025d,0x22d17b8a,0x85c20719
	.word  0x9a34ecdd,0x5881f6ad,0x1163c116,0x1debfac2
	.word  0xfeebaeec,0x6b471a63,0xf7ad786c,0x6d3def3e
	.word  0x5e6756a1,0x10bec03c,0x55b61f7b,0xb9c46744
	.word  0x0cf180f9,0x823be1d3,0x276f839d,0x7659cb55
	.word  0x1a9a98d0,0x61e3c12f,0xa3582607,0x1fe5b4c5
	.word  0x7e711175,0x0c986cf8,0x7007690b,0xd6413be3
	.word  0x844c5a5f,0xe0649af6,0x2082f259,0xa8a3e1ac
	.word  0x972a8127,0x4a2bde5e,0x2dbb5f51,0x501812cc
	.word  0x4892cb3c,0x92a46385,0x0aa78d45,0x0157250a
	.word  0x29c86775,0xd5dab510,0x9e282abb,0xf5077699
	.word  0xe3308755,0x2f473b30,0x6209de6d,0xbc9997d3
	.word  0xd5b8d329,0xee803aee,0xa1e60e33,0x692f930d
	.word  0x44418401,0x416535b0,0xed96da8d,0xbf01ce8b
	.word  0x9028e767,0xe4434c22,0xd1dda956,0xd0fe0bf4
	.word  0x14aaa3ef,0x05cc5948,0xb2a3e68d,0x7c6703f1
	.word  0x6a561d07,0xc24c6540,0x0d99bb4c,0xc9f3b656
	.word  0x1ebf2a82,0xf10be8aa,0x3a2f7f05,0xaf8fbb56
	.word  0x55dc0fb6,0x4dd67aa8,0x77111628,0x4a7593d8
	.word  0xe09a1ec7,0x49bd11cb,0xa45af439,0x8ddbfbe5
	.word  0xf6c779c2,0xb6f5443c,0xb1a32d57,0xe7aba0c0
	.word  0x1799f46f,0x9959ac80,0x84cac4b9,0xb1682ad9
	.word  0xa164f51d,0x21d54169,0xdb59d36a,0xcde2e5a6
	.word  0x6d207fc5,0xe78903fa,0xdf3828c0,0xf96f7862
	.word  0x40834474,0x571e4701,0x5d9833e6,0x5f875e76
	.word  0x04218991,0x739ccda1,0x3a344f2c,0xc699f5d9
	.word  0x64459f6c,0x975854ed,0x81d88e88,0x50f43006
	.word  0xa8cbed67,0x1aa2d49e,0xae2620af,0x97f9e5d6
	.word  0x142798dc,0xaf2d639b,0xb2c54b58,0x87a4bcd1
	.word  0x831e9c19,0x84301119,0x15385070,0x0387dd40
	.word  0xf6efddd9,0x7dc20ed4,0x6b834171,0xd02387e6
	.word  0xc4ed018b,0x34ae4db6,0x7499c8e3,0x926a2ba6
	.word  0x47ab81a2,0x9ab8284b,0x8cb83516,0x9c3326c0
	.word  0xe542ea94,0x7d3c689c,0x8c0c412c,0x5354aa67
	.word  0xe66e433c,0xe0d0bde2,0x79c8f222,0x8029f329
	.word  0x134a08c4,0x2d6b7f3b,0xa57f47b9,0xb6ad8a27
	.word  0x824ade74,0x61485c5e,0xa2992f7e,0x9db430c5
	.word  0xe7846f8f,0xcde5b997,0x472a1b7b,0xea2abbeb
	.word  0xea08f9f6,0xfd5fbe5e,0xaef85ba8,0x5b88f299
	.word  0x62e68858,0x3b79aa78,0x86d47eb2,0x3a10e86a
	.word  0x814c97fe,0x01426366,0x8871d722,0x8cc61f09
	.word  0xab85e6a2,0xa47bdcda,0xe19dcd4e,0xcc943f61
	.word  0x6adba1b9,0xa14aedb8,0xcafb5704,0x6f28a60e
	.word  0x1e1ba1fe,0x833f262d,0x30cd825d,0x53fd1a57
	.word  0x42e7d0dc,0x5bb0a6f0,0x0d31c299,0x4dffce5d
	.word  0xb8affdad,0xeb3d67bb,0x6b976179,0xb4fa1d78
	.word  0x8fdb07d1,0x29585a5e,0x1b0cae5e,0x1e898315
	.word  0x8c328918,0x399ee674,0xae5947bb,0x55567fcb
	.word  0x61f4005f,0x3b1ce48a,0x0bb40ac8,0xe28c58c7
	.word  0xa5625966,0xe7cc1d7c,0x697167c4,0x805387f6
	.word  0xa6e3b985,0x640f8a4a,0x26caadb8,0x1b9eaef7
	.word  0xf8ed8e09,0xbbb663f1,0x827a6317,0x021b39fc
	.word  0x57eafa67,0xee959e3a,0x617c5ca5,0x7f871c00
	.word  0x49562182,0x9071aa60,0xea121545,0x28cf748d
	.word  0x1ea4487a,0x4116813d,0x5f75e08c,0xe5227b28
	.word  0x783fa8e8,0x54af7c12,0x65b2da66,0x3091097b
	.word  0x764e6771,0x4446dd39,0x5ee11e38,0xcad736f7
	.word  0xc43077cf,0x75eee563,0x3f033d8c,0xc38b983f
	.word  0xc0bd4476,0x8bdbdd57,0x8019b8e1,0xb8d9a902
	.word  0x76d78768,0x2be7b9e8,0x4a15edad,0x3b5b353a
	.word  0xc272b650,0xece5e11d,0xccd4bde0,0x87342685
	.word  0xd304500e,0x96c83961,0x4dfee4a2,0x48d2aea0
	.word  0x3d1a1a93,0x3de47ec5,0xf9cf1197,0xd29aa753
	.word  0xe4e2a672,0xf7214352,0x3c74dbba,0x9e7163f4
	.word  0xaea804ec,0x0b1bac90,0x7b172919,0x49ff043b
	.word  0xc50535e3,0xab5d8339,0xa2090fa1,0x2287ef67
	.word  0x72ad21a8,0xc2df7278,0x9777a5ed,0x7e3f4ce5
	.word  0x747d58b2,0xba835c4d,0xaa501600,0x072ec902
	.word  0xc477f944,0x37636abf,0x71da753b,0xdca54a19
	.word  0xcd678ae3,0xb53e302d,0x85c55c71,0xbaf9f823
	.word  0x3d9d4b41,0xa1912f68,0x9c62a6bf,0xc5410ddc
	.word  0x10a09523,0xdfef7ec2,0x68802622,0xe5f74911
	.word  0x3ada857a,0x1a6b4ac3,0x68f71f01,0x7aae96b5
	.word  0x5d74a46d,0x86e4b0bb,0xa6282ba6,0x513b06f3
	.word  0x54262e81,0x4d1c732e,0x7ce2f0ac,0x418742c4
	.word  0x6635f7a5,0x67713966,0xc5a8fcc2,0x83494711
	.word  0x64c1de3e,0x7b6fe1e5,0x0b256722,0x9c55e532
	.word  0x9c77450e,0xd1f4ff80,0xff989998,0xf37fbff6
	.word  0x378da01a,0x71a5fe32,0x9171f837,0xee2e9120
	.word  0x60b7ab1d,0xacc4aad0,0xb4af911b,0x9eecff91
	.word  0xb40c4a03,0xc5d39dd7,0xa5cbf320,0x1e839126
	.word  0x879f3e62,0x63e663f7,0x9c374d4a,0x4f5dce4e
	.word  0xca3056f2,0x5e908ef0,0x1fe13fc3,0x846f2809
	.word  0x13d6e743,0x37f13c02,0xed24a5a9,0x6d8e624a
	.word  0x9a62b274,0xb523d42f,0x019c928e,0xa045a187
	.word  0x8adda4d9,0x55db09eb,0xb8050ca1,0x75859360
	.word  0xd314ae66,0xd60ec59c,0xe9791433,0x2ad449ee
	.word  0x285d3b74,0x79a838cb,0x634807e9,0x2fdc5e48
	.word  0xa7b92aae,0x25080444,0x72277f12,0x02ca98e8
	.word  0xf81f445f,0x1ef796c2,0x5de20094,0x6d5485ae
	.word  0x4bcf88db,0x7ba957ae,0xf7bf501f,0xc338c76d
	.word  0x9f690480,0x641eb694,0x353a9cfb,0xa4278b29
	.word  0xe4035ac0,0xc77307e7,0x2606f3a2,0x7729d005
	.word  0xd7d52535,0xd4a90d7d,0xe5cac33b,0xc6d1bfb6
	.word  0x64667c84,0x482995d7,0xa437ee92,0xf0394c14
	.word  0x9f56a794,0x57f53a1b,0x4bf9f00a,0xf70c6bb4
	.word  0x435f991f,0x93d7077f,0xc1324fc6,0x5f5db0aa
	.word  0x3b0ee9ab,0xbf2bf98b,0x8748c066,0x0216117a
	.word  0x6e525d19,0x43ff6afc,0x7fca4487,0x413a8279
	.word  0xe96d4328,0x1ffcda6a,0x215c3d6f,0x1122564e
	.word  0x8448b563,0x637f44f4,0x41ce894e,0xab1a8d42
	.word  0xd9dbb9af,0xa6bb4d0f,0x745c7179,0x88f89fe1
	.word  0xeffe6d31,0x5faac37a,0xd7c3e6a8,0xd363080e
	.word  0xbb3aaf74,0xa74ac7fc,0x5e5afbe5,0x096ed5b9
	.word  0x96cfefd9,0x3f723ec9,0xfc59e0e2,0x4a5417f9
	.word  0x73d15954,0xd7f206b6,0xf0813a11,0xfd75e9ec
	.word  0x923d8be0,0x5d453e57,0x40a05cc1,0xf723bc47
	.word  0xdc532ecf,0x3ed08f80,0x25b8a553,0x8ce14273
	.word  0x3280df74,0xe21d1d83,0x5475873d,0xcc0d418a
	.word  0x24bd11e3,0xa680b83f,0xdfb40df5,0x2a4e4e9f
	.word  0x55fba0d5,0x3e960e7f,0xf3312d86,0x5493c795
	.word  0x20fb8cd0,0x13a6c2aa,0xa2db18b0,0x7e2af83d
	.word  0x411196ac,0xdc8efed7,0x88901f84,0x20ba769d
	.word  0xed6b7f33,0x4967a8ee,0xe33f1ce6,0xe42abee7
	.word  0x2e003ce2,0xd3b6db99,0x6cb05021,0x138c0e00
	.word  0x71722a67,0xa324d3dc,0x0510bfef,0x5cc4b7f1
	.word  0xc726547d,0xb4dc4d8f,0x4f5be17b,0x049d68e3
	.word  0xc43824f7,0xdf797daa,0x9239a0d5,0xb78825b8
	.word  0xb3283841,0x4fd6416c,0x25f73639,0x03fd203d
	.word  0x07000fae,0x44160a5b,0x39767e8a,0xd7f93a3b
	.word  0xef3e2dc9,0xb60a7550,0xa378f85e,0xcabf289e
	.word  0xf3b9b074,0x7af058f6,0x921d3d97,0x804ca8f9
	.word  0xa9f8463b,0xc7a883aa,0x0b3916e3,0xefd7a868
	.word  0x3094a7ec,0x8d30acc8,0xdf36b811,0xe3ffab4d
	.word  0x56209a9d,0xad063da9,0x02b73213,0x0053f118
	.word  0x3f15358e,0xaf1d68ed,0x7e737f8c,0x85e72ceb
	.word  0xf905010b,0x1747784d,0x1c73f5c4,0x89d3b72b
	.word  0x5d15ec46,0x8114793e,0x074971b1,0x24cc8de0
	.word  0x88c0a308,0xfc0e11b4,0xf014eca0,0x14e284c5
	.word  0xc38d672a,0x14479c5c,0x86e7034a,0xd3511799
	.word  0xcfaf1cb2,0x62f2ee57,0xaf29146f,0x8553a5d8
	.word  0x0c65f27c,0xe43b6dff,0x39532b73,0x5489e0fd
	.word  0xef29d9b1,0x78a7d274,0xc59a22ba,0x11ac8eba
	.word  0x8f9b2378,0x6fecfe9f,0xadcd3694,0x70f587d0
	.word  0x8bfb7675,0x5e38bb8f,0xbb36184e,0xbbb92dde
	.word  0xa73bb794,0xe8018a61,0x60501313,0x9d777c55
	.word  0xf84f9090,0x432807da,0xd891a6c7,0x969737c8
	.word  0x96a7ec2a,0x6bae1057,0xff6aca1c,0x0afd6d6f
	.word  0x7ef7e391,0x380a1ad3,0x0ba38b9d,0x9c9dc8e1
	.word  0x682d1e25,0xc177a037,0xdcce5ace,0x33be25a6
	.word  0x1fbde7b4,0x4ad92574,0xacc4cee8,0xe595af1c
	.word  0x2e556b59,0x97303823,0x7ce86539,0x58cbf87c
	.word  0x094b7a98,0xe3ee497f,0xfe54b518,0xe8f1b52d
	.word  0xa2af7db2,0x46f1c3a7,0x4b757fb5,0x78e2d8b3
	.word  0x4baaff10,0x694fc9a0,0x9bfa9c2b,0x659e3cde
	.word  0xfd19cf75,0x06efd763,0x3a8acef4,0x000bdd54
	.word  0x20f89212,0xc6d4dcc2,0x824b4d93,0x01082aaa
	.word  0x43f342ce,0x5d9daad4,0xf5d7c1b7,0xf0f459fc
	.word  0xf5468f2f,0x19d166b1,0xe5644912,0x4e94b19d
	.word  0x2c55c3ae,0xc5022bd2,0xc431a549,0x54e4a43d
	.word  0xb5d1fc6c,0x597ac8c0,0x2cebf023,0xbcacf7cf
	.word  0xb341f963,0x9939f511,0x3d81d915,0xf8af2bdd
	.word  0x73544b4a,0xc3573488,0x53c41951,0xb85c5a67
	.word  0xcc0033b4,0x7c9c194a,0x564b52d6,0x602226b7
	.word  0xe87cb52a,0x0bbbf12d,0xc6b0e6b5,0xe5c34eb6
	.word  0x690793bc,0x39266d68,0xf891a6b3,0x3c665055
	.word  0x3d455f13,0x55579a23,0x1acda7ed,0x187b3f99
	.word  0x8f8af6b3,0x479518c0,0x4c29c236,0x2bf70c3b
	.word  0x1dd86085,0xa7b23eff,0x6506d828,0x4f08e531
	.word  0xc53c50ec,0xcc68c343,0xe2f75ac6,0x8b29887a
	.word  0x250a1fbe,0xd4856739,0x057fd1ad,0xe6109b27
	.word  0x08e4c75e,0x3a224a4e,0x387be37f,0xe7940a62
	.word  0x144816f3,0x61f59ac6,0x81774560,0x9f70fcbe
	.word  0xf9b54899,0xa651dd6c,0xa77ea8ec,0xe2e5a699
	.word  0x2a1e590b,0xfdd61842,0xbbcd482c,0xc153cf0d
	.word  0x919d85d1,0xab2a30c1,0xb17dbc6f,0xb83d2f0a
	.word  0x6f17bfb6,0xb51f4838,0x4ded9b84,0xe4300939
	.word  0xfad6f41d,0xc3ad10b2,0x7ef04c8e,0x2dd82bc4
	.word  0x54bbefbe,0xb55dc5a2,0x401a0451,0x10993d01
	.word  0x092fc466,0xae12725c,0xbd4bb8c2,0xd7931562
	.word  0x0fef2c15,0x4980b2c1,0x9b2537ed,0xf9fa7615
	.word  0x05ec2fdd,0x4bed3bc2,0x410a21f1,0xaffc6e77
	.word  0x3a61adbe,0xbba40cae,0x27ce56f6,0xf1d64e70
	.word  0x113f148f,0x36f7310a,0x89084bd3,0xae754c8a
	.word  0xe919059c,0x5dd40ba9,0x82fcf3c7,0xdf82b0d6
	.word  0x54ee452e,0xc8d2a678,0x3fd5c38c,0xa3e45363
	.word  0xbcaa4ea4,0xad58c41e,0x3d2727d0,0x4a58ec1a
	.word  0xc409edec,0x46543801,0x2e3ecfc6,0x85b7154f
	.word  0x88ebd8e8,0x8e997073,0xf151d546,0xe4d90277
	.word  0x4904009a,0xc08be9e0,0x65563a6c,0x2f2acdaf
	.word  0x9b9de5fc,0xcea9561e,0x40041e7f,0x4eae15b1
	.word  0xf880f049,0x12a956db,0xc68e8dab,0xd15c8b49
	.word  0x42dd1e43,0x05144c36,0xfa183561,0x896512fa
	.word  0x4f7cc8f9,0xc72b7c94,0xdf4fbf1d,0x31177472
	.word  0x3048056a,0x48faeca5,0x73c1502a,0xb30d3178
	.word  0xda8b06dd,0xa56eaeb1,0xdef71ed2,0xe4f75946
	.word  0x6e914a0e,0x5cf87611,0x18da2698,0x0a2257fb
	.word  0x900439bb,0x386f2f3c,0xa9c7f554,0x9319d1df
	.word  0xb48cfebf,0x9d8977a1,0x96d2e28e,0x48557171
	.word  0x4436a6c7,0x87ec6fc6,0xdd333183,0xaa975ea1
	.word  0x95558a2a,0x9999defb,0x3d4c0257,0x51b46acf
	.word  0xfacdb522,0xf6b27b90,0xbb6e111f,0x6f10d277
	.word  0x4754a455,0xbf8c879e,0x8ce34f95,0x47151a65



