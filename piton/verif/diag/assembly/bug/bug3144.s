// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: bug3144.s
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
   random seed:	91033935
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
        setx  0x0000000000000d50, %g1, %r11
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
        setx  0x653244824866282d, %g1, %r0
        setx  0x197514cd24d9239f, %g1, %r1
        setx  0xb705c3aeda7e4560, %g1, %r2
        setx  0x184ced64a4a6ee39, %g1, %r3
        setx  0xec0249a582e74086, %g1, %r4
        setx  0xb6a108dfcd5a8cda, %g1, %r5
        setx  0x6cb9d98f206a38fd, %g1, %r6
        setx  0xa004ec92c47849eb, %g1, %r7
        setx  0x042600d8dcd9e20d, %g1, %r8
        setx  0xad5e61704af825df, %g1, %r9
        setx  0x8dbda4ca39a588de, %g1, %r12
        setx  0x9219978fa35856c9, %g1, %r13
        setx  0xf4ee28231e580d09, %g1, %r14
        setx  0xab31667ed34ad729, %g1, %r15
        setx  0x836d502e590eb343, %g1, %r16
        setx  0x4b71a922f89dea7c, %g1, %r17
        setx  0x554c9fae81ef886d, %g1, %r18
        setx  0x4ae5b5aab28419dd, %g1, %r19
        setx  0x007fdb5a48ffd07b, %g1, %r20
        setx  0xfd4c8ede73b78595, %g1, %r21
        setx  0x35fa99ba0fb45236, %g1, %r22
        setx  0x5306b62370a6ab0c, %g1, %r23
        setx  0xa889f11dbbd173ad, %g1, %r24
        setx  0xb77480db12a7726b, %g1, %r25
        setx  0x7aa7f57e71d9a41c, %g1, %r26
        setx  0x818449ecce9498e7, %g1, %r27
        setx  0xbd55a02c918a8626, %g1, %r28
        setx  0xd935fd539aa26cfd, %g1, %r29
        setx  0xae4030ed4ec2bb4e, %g1, %r30
        setx  0x54d4b54c2757b7ed, %g1, %r31
	.word 0xea82900b  ! 5: LDUWA_R	lduwa	[%r10, %r11] 0x80, %r21
	.word 0xf60aa550  ! 6: LDUB_I	ldub	[%r10 + 0x0550], %r27
	.word 0x87a289ab  ! 7: FDIVs	fdivs	%f10, %f11, %f3
	.word 0xdc9a900b  ! 8: LDDA_R	ldda	[%r10, %r11] 0x80, %r14
	.word 0xd202800b  ! 9: LDUW_R	lduw	[%r10 + %r11], %r9
	.word 0xdea2900b  ! 10: STWA_R	stwa	%r15, [%r10 + %r11] 0x80
	.word 0x9efaa338  ! 11: SDIVcc_I	sdivcc 	%r10, 0x0338, %r15
	.word 0x84f2800b  ! 13: UDIVcc_R	udivcc 	%r10, %r11, %r2
	.word 0xee7aace0  ! 14: SWAP_I	swap	%r23, [%r10 + 0x0ce0]
	.word 0x3e800001  ! 15: BVC	bvc,a	<label_0x1>
	.word 0x90d2a098  ! 16: UMULcc_I	umulcc 	%r10, 0x0098, %r8
	.word 0xc452a048  ! 17: LDSH_I	ldsh	[%r10 + 0x0048], %r2
	.word 0x9dda800b  ! 18: FLUSH_R	dis not found

	.word 0x40000001  ! 19: CALL	call	disp30_1
	.word 0xcca2a704  ! 20: STWA_I	stwa	%r6, [%r10 + 0x0704] %asi
	.word 0xc36a800b  ! 21: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x8143e008  ! 22: MEMBAR	membar	#StoreStore 
	.word 0xeaa2900b  ! 23: STWA_R	stwa	%r21, [%r10 + %r11] 0x80
	.word 0xd3e2900b  ! 24: CASA_I	casa	[%r10] 0x80, %r11, %r9
	.word 0x916a800b  ! 25: SDIVX_R	sdivx	%r10, %r11, %r8
	.word 0xc64aaabc  ! 26: LDSB_I	ldsb	[%r10 + 0x0abc], %r3
	.word 0xc6f2a588  ! 27: STXA_I	stxa	%r3, [%r10 + 0x0588] %asi
	.word 0xd13aa4c8  ! 28: STDF_I	std	%f8, [0x04c8, %r10]
	.word 0xa1da800b  ! 29: FLUSH_R	dis not found

	.word 0x8e72ad1c  ! 32: UDIV_I	udiv 	%r10, 0x0d1c, %r7
	.word 0x2cca0001  ! 34: BRGZ	brgz,a,pt	%8,<label_0xa0001>
	.word 0x8143e023  ! 36: MEMBAR	membar	#LoadLoad | #StoreLoad | #MemIssue 
	.word 0x8fdaaf14  ! 37: FLUSH_I	dis not found

	.word 0xe73aa8c0  ! 38: STDF_I	std	%f19, [0x08c0, %r10]
	.word 0x8e4a800b  ! 39: MULX_R	mulx 	%r10, %r11, %r7
	.word 0x1c800001  ! 40: BPOS	bpos  	<label_0x1>
	.word 0x89a289ab  ! 41: FDIVs	fdivs	%f10, %f11, %f4
	.word 0xc20a800b  ! 42: LDUB_R	ldub	[%r10 + %r11], %r1
	.word 0xfdf2a00b  ! 43: CASXA_R	casxa	[%r10]%asi, %r11, %r30
	.word 0xccba900b  ! 44: STDA_R	stda	%r6, [%r10 + %r11] 0x80
	.word 0x925aa050  ! 45: SMUL_I	smul 	%r10, 0x0050, %r9
	.word 0xc3ea900b  ! 46: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0xd0aaab6c  ! 49: STBA_I	stba	%r8, [%r10 + 0x0b6c] %asi
	.word 0xcaeaa0e8  ! 52: LDSTUBA_I	ldstuba	%r5, [%r10 + 0x00e8] %asi
	.word 0xc87a800b  ! 53: SWAP_R	swap	%r4, [%r10 + %r11]
	.word 0x8cf2a728  ! 54: UDIVcc_I	udivcc 	%r10, 0x0728, %r6
	.word 0x8143e016  ! 56: MEMBAR	membar	#StoreLoad | #LoadStore | #Lookaside 
	.word 0x8872800b  ! 57: UDIV_R	udiv 	%r10, %r11, %r4
	.word 0x8f6aa9e8  ! 58: SDIVX_I	sdivx	%r10, 0x09e8, %r7
	.word 0x10800001  ! 59: BA	ba  	<label_0x1>
	.word 0xf4c2a60c  ! 60: LDSWA_I	ldswa	[%r10, + 0x060c] %asi, %r26
	.word 0xf482900b  ! 61: LDUWA_R	lduwa	[%r10, %r11] 0x80, %r26
	.word 0xc66a800b  ! 62: LDSTUB_R	ldstub	%r3, [%r10 + %r11]
	.word 0x8522800b  ! 63: MULScc_R	mulscc 	%r10, %r11, %r2
	.word 0x887a800b  ! 64: SDIV_R	sdiv 	%r10, %r11, %r4
	.word 0xd9e2a00b  ! 65: CASA_R	casa	[%r10] %asi, %r11, %r12
	.word 0xd242a1f0  ! 66: LDSW_I	ldsw	[%r10 + 0x01f0], %r9
	.word 0x8143e004  ! 67: MEMBAR	membar	#LoadStore 
	.word 0xf4c2900b  ! 68: LDSWA_R	ldswa	[%r10, %r11] 0x80, %r26
	.word 0xc212a740  ! 69: LDUH_I	lduh	[%r10 + 0x0740], %r1
	.word 0x8143e017  ! 70: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside 
	.word 0xdb3aaf28  ! 71: STDF_I	std	%f13, [0x0f28, %r10]
	.word 0x90f2800b  ! 72: UDIVcc_R	udivcc 	%r10, %r11, %r8
	.word 0xc3eaa0f4  ! 73: PREFETCHA_I	prefetcha	[%r10, + 0x00f4] %asi, #one_read
	.word 0x2cc20001  ! 74: BRGZ	brgz,a,nt	%8,<label_0x20001>
	.word 0x85da800b  ! 75: FLUSH_R	dis not found

	.word 0xc9e2a00b  ! 76: CASA_R	casa	[%r10] %asi, %r11, %r4
	.word 0x86f2aea4  ! 77: UDIVcc_I	udivcc 	%r10, 0x0ea4, %r3
	.word 0x0c800001  ! 78: BNEG	bneg  	<label_0x1>
	.word 0x36800001  ! 79: BGE	bge,a	<label_0x1>
	.word 0xed22800b  ! 80: STF_R	st	%f22, [%r11, %r10]
	.word 0xceeaa600  ! 81: LDSTUBA_I	ldstuba	%r7, [%r10 + 0x0600] %asi
	.word 0x8143c000  ! 82: STBAR	stbar
	.word 0xf8baa160  ! 83: STDA_I	stda	%r28, [%r10 + 0x0160] %asi
	.word 0x8143c000  ! 84: STBAR	stbar
	.word 0x02c20001  ! 85: BRZ	brz  ,nt	%8,<label_0x20001>
	.word 0xa5a2892b  ! 86: FMULs	fmuls	%f10, %f11, %f18
	.word 0x824a800b  ! 87: MULX_R	mulx 	%r10, %r11, %r1
	.word 0x8cdaacfc  ! 88: SMULcc_I	smulcc 	%r10, 0x0cfc, %r6
	.word 0x8bdaad54  ! 89: FLUSH_I	dis not found

	.word 0xdc82900b  ! 90: LDUWA_R	lduwa	[%r10, %r11] 0x80, %r14
	.word 0x8143e078  ! 91: MEMBAR	membar	#StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0x0a800001  ! 92: BCS	bcs  	<label_0x1>
	.word 0xea02800b  ! 93: LDUW_R	lduw	[%r10 + %r11], %r21
	.word 0xfbe2a00b  ! 94: CASA_R	casa	[%r10] %asi, %r11, %r29
	.word 0xbcda800b  ! 95: SMULcc_R	smulcc 	%r10, %r11, %r30
	.word 0x8143c000  ! 96: STBAR	stbar
	.word 0xc3eaaa9c  ! 97: PREFETCHA_I	prefetcha	[%r10, + 0x0a9c] %asi, #one_read
	.word 0x8c4a800b  ! 99: MULX_R	mulx 	%r10, %r11, %r6
	.word 0x8143c000  ! 100: STBAR	stbar
	.word 0x90da800b  ! 101: SMULcc_R	smulcc 	%r10, %r11, %r8
	.word 0xce12800b  ! 102: LDUH_R	lduh	[%r10 + %r11], %r7
	.word 0xf53a800b  ! 103: STDF_R	std	%f26, [%r11, %r10]
	.word 0xe28a900b  ! 104: LDUBA_R	lduba	[%r10, %r11] 0x80, %r17
	.word 0x8143c000  ! 105: STBAR	stbar
	.word 0xdcba900b  ! 106: STDA_R	stda	%r14, [%r10 + %r11] 0x80
	.word 0xc252800b  ! 107: LDSH_R	ldsh	[%r10 + %r11], %r1
	.word 0xd252a71c  ! 108: LDSH_I	ldsh	[%r10 + 0x071c], %r9
	.word 0x9dda800b  ! 109: FLUSH_R	dis not found

	.word 0xfcca900b  ! 110: LDSBA_R	ldsba	[%r10, %r11] 0x80, %r30
	.word 0xc60a800b  ! 111: LDUB_R	ldub	[%r10 + %r11], %r3
	.word 0xede2a00b  ! 112: CASA_R	casa	[%r10] %asi, %r11, %r22
	.word 0x3a800003  ! 113: BCC	bcc,a	<label_0x3>
	.word 0x85daa9c4  ! 114: FLUSH_I	dis not found

	.word 0xcd3a800b  ! 115: STDF_R	std	%f6, [%r11, %r10]
	.word 0x8143c000  ! 116: STBAR	stbar
	.word 0xd06aa3e0  ! 117: LDSTUB_I	ldstub	%r8, [%r10 + 0x03e0]
	.word 0xc36a800b  ! 118: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0xc2a2900b  ! 119: STWA_R	stwa	%r1, [%r10 + %r11] 0x80
	.word 0x91da800b  ! 120: FLUSH_R	dis not found

	.word 0xf722800b  ! 122: STF_R	st	%f27, [%r11, %r10]
	.word 0x825aac68  ! 123: SMUL_I	smul 	%r10, 0x0c68, %r1
	.word 0xc40a800b  ! 124: LDUB_R	ldub	[%r10 + %r11], %r2
	.word 0xec12a048  ! 126: LDUH_I	lduh	[%r10 + 0x0048], %r22
	.word 0xc442abac  ! 128: LDSW_I	ldsw	[%r10 + 0x0bac], %r2
	.word 0xc26a800b  ! 129: LDSTUB_R	ldstub	%r1, [%r10 + %r11]
	.word 0x8143e01a  ! 130: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside 
	.word 0xc20aa0fc  ! 131: LDUB_I	ldub	[%r10 + 0x00fc], %r1
	.word 0xce12a1d8  ! 132: LDUH_I	lduh	[%r10 + 0x01d8], %r7
	.word 0x8ef2800b  ! 133: UDIVcc_R	udivcc 	%r10, %r11, %r7
	.word 0xb872a8e0  ! 134: UDIV_I	udiv 	%r10, 0x08e0, %r28
	.word 0xdeb2900b  ! 135: STHA_R	stha	%r15, [%r10 + %r11] 0x80
	.word 0xc852800b  ! 136: LDSH_R	ldsh	[%r10 + %r11], %r4
	.word 0x8143e056  ! 137: MEMBAR	membar	#StoreLoad | #LoadStore | #Lookaside | #Sync 
	.word 0xc3ea900b  ! 138: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0xd8caac14  ! 139: LDSBA_I	ldsba	[%r10, + 0x0c14] %asi, %r12
	.word 0x18800001  ! 141: BGU	bgu  	<label_0x1>
	.word 0xd852800b  ! 142: LDSH_R	ldsh	[%r10 + %r11], %r12
	.word 0x92da800b  ! 143: SMULcc_R	smulcc 	%r10, %r11, %r9
	.word 0xc68a900b  ! 144: LDUBA_R	lduba	[%r10, %r11] 0x80, %r3
	.word 0xf882a9c4  ! 145: LDUWA_I	lduwa	[%r10, + 0x09c4] %asi, %r28
	.word 0x8143c000  ! 146: STBAR	stbar
	.word 0xdefa900b  ! 147: SWAPA_R	swapa	%r15, [%r10 + %r11] 0x80
	.word 0xcb3aa4d8  ! 148: STDF_I	std	%f5, [0x04d8, %r10]
	.word 0x2a800001  ! 149: BCS	bcs,a	<label_0x1>
	.word 0xdb22afc4  ! 150: STF_I	st	%f13, [0x0fc4, %r10]
	.word 0xc3eaad5c  ! 151: PREFETCHA_I	prefetcha	[%r10, + 0x0d5c] %asi, #one_read
	.word 0x8143e048  ! 152: MEMBAR	membar	#StoreStore | #Sync 
	.word 0x8143c000  ! 153: STBAR	stbar
	.word 0xceb2a7e8  ! 154: STHA_I	stha	%r7, [%r10 + 0x07e8] %asi
	.word 0x8143e032  ! 155: MEMBAR	membar	#StoreLoad | #Lookaside | #MemIssue 
	.word 0xce92900b  ! 156: LDUHA_R	lduha	[%r10, %r11] 0x80, %r7
	.word 0xecba900b  ! 157: STDA_R	stda	%r22, [%r10 + %r11] 0x80
	.word 0xcac2a0cc  ! 158: LDSWA_I	ldswa	[%r10, + 0x00cc] %asi, %r5
	.word 0x0a800001  ! 159: BCS	bcs  	<label_0x1>
	.word 0xbfdaa1ec  ! 160: FLUSH_I	dis not found

	.word 0xd252af80  ! 161: LDSH_I	ldsh	[%r10 + 0x0f80], %r9
	.word 0xcd22800b  ! 162: STF_R	st	%f6, [%r11, %r10]
	.word 0xc292a008  ! 163: LDUHA_I	lduha	[%r10, + 0x0008] %asi, %r1
	.word 0x8ddaa0f4  ! 164: FLUSH_I	dis not found

	.word 0x8e4aae60  ! 165: MULX_I	mulx 	%r10, 0x0e60, %r7
	.word 0x1a800003  ! 166: BCC	bcc  	<label_0x3>
	.word 0xf44aa2e8  ! 167: LDSB_I	ldsb	[%r10 + 0x02e8], %r26
	.word 0xb47aa940  ! 168: SDIV_I	sdiv 	%r10, 0x0940, %r26
	.word 0x8143c000  ! 169: STBAR	stbar
	.word 0x8143c000  ! 170: STBAR	stbar
	.word 0x8e52a604  ! 171: UMUL_I	umul 	%r10, 0x0604, %r7
	.word 0xc3eaa204  ! 172: PREFETCHA_I	prefetcha	[%r10, + 0x0204] %asi, #one_read
	.word 0xc20aa530  ! 173: LDUB_I	ldub	[%r10 + 0x0530], %r1
	.word 0xcca2900b  ! 174: STWA_R	stwa	%r6, [%r10 + %r11] 0x80
	.word 0x99a289ab  ! 175: FDIVs	fdivs	%f10, %f11, %f12
	.word 0xd2f2af00  ! 176: STXA_I	stxa	%r9, [%r10 + 0x0f00] %asi
	.word 0x9322aee8  ! 177: MULScc_I	mulscc 	%r10, 0x0ee8, %r9
	.word 0x8143c000  ! 178: STBAR	stbar
	.word 0xc4fa900b  ! 179: SWAPA_R	swapa	%r2, [%r10 + %r11] 0x80
	.word 0xc8baa2b0  ! 180: STDA_I	stda	%r4, [%r10 + 0x02b0] %asi
	.word 0x0a800001  ! 181: BCS	bcs  	<label_0x1>
	.word 0xc4fa900b  ! 182: SWAPA_R	swapa	%r2, [%r10 + %r11] 0x80
	.word 0x8143c000  ! 183: STBAR	stbar
	.word 0xe3f2a00b  ! 184: CASXA_R	casxa	[%r10]%asi, %r11, %r17
	.word 0x8143e000  ! 185: MEMBAR	membar	
	.word 0xca02a74c  ! 186: LDUW_I	lduw	[%r10 + 0x074c], %r5
	.word 0xe7f2900b  ! 187: CASXA_I	casxa	[%r10] 0x80, %r11, %r19
	.word 0xa1a289ab  ! 188: FDIVs	fdivs	%f10, %f11, %f16
	.word 0x30800003  ! 189: BA	ba,a	<label_0x3>
	.word 0xc36aaf98  ! 190: PREFETCH_I	prefetch	[%r10 + 0x0f98], #one_read
	.word 0x22800001  ! 191: BE	be,a	<label_0x1>
	.word 0xc44a800b  ! 192: LDSB_R	ldsb	[%r10 + %r11], %r2
	.word 0xf89aad90  ! 193: LDDA_I	ldda	[%r10, + 0x0d90] %asi, %r28
	.word 0x93da800b  ! 194: FLUSH_R	dis not found

	.word 0x8ed2800b  ! 195: UMULcc_R	umulcc 	%r10, %r11, %r7
	.word 0x8bda800b  ! 196: FLUSH_R	dis not found

	.word 0x8ba288ab  ! 197: FSUBs	fsubs	%f10, %f11, %f5
	.word 0xe2aaa674  ! 198: STBA_I	stba	%r17, [%r10 + 0x0674] %asi
	.word 0x1e800003  ! 199: BVC	bvc  	<label_0x3>
	.word 0x8143e02a  ! 200: MEMBAR	membar	#StoreLoad | #StoreStore | #MemIssue 
	.word 0xb3a289ab  ! 201: FDIVs	fdivs	%f10, %f11, %f25
	.word 0xc81aa8d8  ! 202: LDD_I	ldd	[%r10 + 0x08d8], %r4
	.word 0xf93aa868  ! 203: STDF_I	std	%f28, [0x0868, %r10]
	.word 0xc36a800b  ! 204: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0xc4a2900b  ! 206: STWA_R	stwa	%r2, [%r10 + %r11] 0x80
	.word 0xf0f2a178  ! 207: STXA_I	stxa	%r24, [%r10 + 0x0178] %asi
	.word 0x93a2892b  ! 208: FMULs	fmuls	%f10, %f11, %f9
	.word 0x88d2800b  ! 209: UMULcc_R	umulcc 	%r10, %r11, %r4
	.word 0xc88a900b  ! 210: LDUBA_R	lduba	[%r10, %r11] 0x80, %r4
	.word 0x8143e039  ! 211: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside | #MemIssue 
	.word 0xc9e2a00b  ! 212: CASA_R	casa	[%r10] %asi, %r11, %r4
	.word 0xa44a800b  ! 213: MULX_R	mulx 	%r10, %r11, %r18
	.word 0x8143c000  ! 214: STBAR	stbar
	.word 0xf082900b  ! 215: LDUWA_R	lduwa	[%r10, %r11] 0x80, %r24
	.word 0x89daae28  ! 216: FLUSH_I	dis not found

	.word 0xc882a68c  ! 217: LDUWA_I	lduwa	[%r10, + 0x068c] %asi, %r4
	.word 0xb872800b  ! 218: UDIV_R	udiv 	%r10, %r11, %r28
	.word 0x8ed2800b  ! 219: UMULcc_R	umulcc 	%r10, %r11, %r7
	.word 0x85daaee8  ! 220: FLUSH_I	dis not found

	.word 0xd00a800b  ! 221: LDUB_R	ldub	[%r10 + %r11], %r8
	.word 0xfc0aa8a8  ! 222: LDUB_I	ldub	[%r10 + 0x08a8], %r30
	.word 0x92faa7d4  ! 223: SDIVcc_I	sdivcc 	%r10, 0x07d4, %r9
	.word 0xcea2a6f0  ! 224: STWA_I	stwa	%r7, [%r10 + 0x06f0] %asi
	.word 0xc3eaa504  ! 225: PREFETCHA_I	prefetcha	[%r10, + 0x0504] %asi, #one_read
	.word 0xc4b2900b  ! 226: STHA_R	stha	%r2, [%r10 + %r11] 0x80
	.word 0x26c20001  ! 227: BRLZ	brlz,a,nt	%8,<label_0x20001>
	.word 0xd212800b  ! 228: LDUH_R	lduh	[%r10 + %r11], %r9
	.word 0x8143e055  ! 229: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside | #Sync 
	.word 0xce4aaf74  ! 230: LDSB_I	ldsb	[%r10 + 0x0f74], %r7
	.word 0xfd3a800b  ! 231: STDF_R	std	%f30, [%r11, %r10]
	.word 0xcc0aaaf4  ! 232: LDUB_I	ldub	[%r10 + 0x0af4], %r6
	.word 0x8143e07c  ! 233: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xd202800b  ! 234: LDUW_R	lduw	[%r10 + %r11], %r9
	.word 0xc41a800b  ! 235: LDD_R	ldd	[%r10 + %r11], %r2
	.word 0xbe6aab88  ! 236: UDIVX_I	udivx 	%r10, 0x0b88, %r31
	.word 0x8dda800b  ! 237: FLUSH_R	dis not found

	.word 0xc4d2a3f0  ! 238: LDSHA_I	ldsha	[%r10, + 0x03f0] %asi, %r2
	.word 0x91daa31c  ! 239: FLUSH_I	dis not found

	.word 0xeeca900b  ! 240: LDSBA_R	ldsba	[%r10, %r11] 0x80, %r23
	.word 0x8143e04c  ! 241: MEMBAR	membar	#LoadStore | #StoreStore | #Sync 
	.word 0xc36a800b  ! 242: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0xe41aa838  ! 243: LDD_I	ldd	[%r10 + 0x0838], %r18
	.word 0xec4aa924  ! 244: LDSB_I	ldsb	[%r10 + 0x0924], %r22
	.word 0xc5f2a00b  ! 245: CASXA_R	casxa	[%r10]%asi, %r11, %r2
	.word 0x8f22afa0  ! 246: MULScc_I	mulscc 	%r10, 0x0fa0, %r7
	.word 0x8143e073  ! 248: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside | #MemIssue | #Sync 
	.word 0xc20aa154  ! 250: LDUB_I	ldub	[%r10 + 0x0154], %r1
	.word 0x04800001  ! 251: BLE	ble  	<label_0x1>
	.word 0xe692ab68  ! 252: LDUHA_I	lduha	[%r10, + 0x0b68] %asi, %r19
	.word 0x24800003  ! 253: BLE	ble,a	<label_0x3>
	.word 0xf8c2a960  ! 254: LDSWA_I	ldswa	[%r10, + 0x0960] %asi, %r28
	.word 0xad22a1d4  ! 255: MULScc_I	mulscc 	%r10, 0x01d4, %r22
	.word 0x8143e06e  ! 256: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #MemIssue | #Sync 
	.word 0x8143c000  ! 257: STBAR	stbar
	.word 0xe7f2a00b  ! 258: CASXA_R	casxa	[%r10]%asi, %r11, %r19
	.word 0xcad2a8dc  ! 259: LDSHA_I	ldsha	[%r10, + 0x08dc] %asi, %r5
	.word 0xc6ea900b  ! 260: LDSTUBA_R	ldstuba	%r3, [%r10 + %r11] 0x80
	.word 0x18800001  ! 261: BGU	bgu  	<label_0x1>
	.word 0xd8fa900b  ! 262: SWAPA_R	swapa	%r12, [%r10 + %r11] 0x80
	.word 0xf8eaaed0  ! 263: LDSTUBA_I	ldstuba	%r28, [%r10 + 0x0ed0] %asi
	.word 0xccba900b  ! 264: STDA_R	stda	%r6, [%r10 + %r11] 0x80
	.word 0xc36a800b  ! 265: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0xf812a07c  ! 266: LDUH_I	lduh	[%r10 + 0x007c], %r28
	.word 0xd24aaa70  ! 267: LDSB_I	ldsb	[%r10 + 0x0a70], %r9
	.word 0x8143c000  ! 268: STBAR	stbar
	.word 0xc81aa340  ! 269: LDD_I	ldd	[%r10 + 0x0340], %r4
	.word 0x87da800b  ! 270: FLUSH_R	dis not found

	.word 0x8143c000  ! 271: STBAR	stbar
	.word 0x8e52800b  ! 272: UMUL_R	umul 	%r10, %r11, %r7
	.word 0xd06a800b  ! 273: LDSTUB_R	ldstub	%r8, [%r10 + %r11]
	.word 0xc4aaa49c  ! 274: STBA_I	stba	%r2, [%r10 + 0x049c] %asi
	.word 0xcc7aa6d8  ! 275: SWAP_I	swap	%r6, [%r10 + 0x06d8]
	.word 0x06c20003  ! 276: BRLZ	brlz  ,nt	%8,<label_0x20003>
	.word 0x8ad2800b  ! 277: UMULcc_R	umulcc 	%r10, %r11, %r5
	.word 0xc3eaa38c  ! 278: PREFETCHA_I	prefetcha	[%r10, + 0x038c] %asi, #one_read
	.word 0x8c7aa328  ! 279: SDIV_I	sdiv 	%r10, 0x0328, %r6
	.word 0x8143c000  ! 280: STBAR	stbar
	.word 0x8143e031  ! 281: MEMBAR	membar	#LoadLoad | #Lookaside | #MemIssue 
	.word 0x8143e008  ! 282: MEMBAR	membar	#StoreStore 
	.word 0xd012a554  ! 283: LDUH_I	lduh	[%r10 + 0x0554], %r8
	.word 0x2eca0001  ! 284: BRGEZ	brgez,a,pt	%8,<label_0xa0001>
	.word 0x8272800b  ! 285: UDIV_R	udiv 	%r10, %r11, %r1
	.word 0xb3daa778  ! 286: FLUSH_I	dis not found

	.word 0x985a800b  ! 287: SMUL_R	smul 	%r10, %r11, %r12
	.word 0x847a800b  ! 288: SDIV_R	sdiv 	%r10, %r11, %r2
	.word 0xde42800b  ! 289: LDSW_R	ldsw	[%r10 + %r11], %r15
	.word 0xc8aaac04  ! 290: STBA_I	stba	%r4, [%r10 + 0x0c04] %asi
	.word 0xd0d2900b  ! 291: LDSHA_R	ldsha	[%r10, %r11] 0x80, %r8
	.word 0x40000003  ! 292: CALL	call	disp30_3
	.word 0xc66a800b  ! 293: LDSTUB_R	ldstub	%r3, [%r10 + %r11]
	.word 0xd89a900b  ! 294: LDDA_R	ldda	[%r10, %r11] 0x80, %r12
	.word 0x8143c000  ! 295: STBAR	stbar
	.word 0x8afaa34c  ! 296: SDIVcc_I	sdivcc 	%r10, 0x034c, %r5
	.word 0x8143c000  ! 297: STBAR	stbar
	.word 0x82da800b  ! 298: SMULcc_R	smulcc 	%r10, %r11, %r1
	.word 0xfe52800b  ! 299: LDSH_R	ldsh	[%r10 + %r11], %r31
	.word 0xf8f2900b  ! 300: STXA_R	stxa	%r28, [%r10 + %r11] 0x80
	.word 0xd09a900b  ! 301: LDDA_R	ldda	[%r10, %r11] 0x80, %r8
	.word 0xfe6aa608  ! 302: LDSTUB_I	ldstub	%r31, [%r10 + 0x0608]
	.word 0xd3e2a00b  ! 303: CASA_R	casa	[%r10] %asi, %r11, %r9
	.word 0x83da800b  ! 304: FLUSH_R	dis not found

	.word 0x93da800b  ! 305: FLUSH_R	dis not found

	.word 0xc3eaab60  ! 306: PREFETCHA_I	prefetcha	[%r10, + 0x0b60] %asi, #one_read
	.word 0x02ca0003  ! 307: BRZ	brz  ,pt	%8,<label_0xa0003>
	.word 0xc89a900b  ! 308: LDDA_R	ldda	[%r10, %r11] 0x80, %r4
	.word 0x9ddaa970  ! 309: FLUSH_I	dis not found

	.word 0x8143e012  ! 310: MEMBAR	membar	#StoreLoad | #Lookaside 
	.word 0xaa4aa508  ! 312: MULX_I	mulx 	%r10, 0x0508, %r21
	.word 0x8a5aaccc  ! 313: SMUL_I	smul 	%r10, 0x0ccc, %r5
	.word 0xeeb2afe8  ! 314: STHA_I	stha	%r23, [%r10 + 0x0fe8] %asi
	.word 0xfa6aa674  ! 315: LDSTUB_I	ldstub	%r29, [%r10 + 0x0674]
	.word 0xfcbaa940  ! 316: STDA_I	stda	%r30, [%r10 + 0x0940] %asi
	.word 0x8143c000  ! 317: STBAR	stbar
	.word 0xe522a650  ! 318: STF_I	st	%f18, [0x0650, %r10]
	.word 0x40000001  ! 319: CALL	call	disp30_1
	.word 0x82f2800b  ! 320: UDIVcc_R	udivcc 	%r10, %r11, %r1
	.word 0x40000001  ! 321: CALL	call	disp30_1
	.word 0x86d2aa2c  ! 322: UMULcc_I	umulcc 	%r10, 0x0a2c, %r3
	.word 0x82da800b  ! 323: SMULcc_R	smulcc 	%r10, %r11, %r1
	.word 0x9ddaa1f0  ! 324: FLUSH_I	dis not found

	.word 0x836aa7c4  ! 325: SDIVX_I	sdivx	%r10, 0x07c4, %r1
	.word 0xc36a800b  ! 326: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x8143c000  ! 327: STBAR	stbar
	.word 0x8143c000  ! 328: STBAR	stbar
	.word 0xca82900b  ! 329: LDUWA_R	lduwa	[%r10, %r11] 0x80, %r5
	.word 0xc6aa900b  ! 330: STBA_R	stba	%r3, [%r10 + %r11] 0x80
	.word 0xc8ea900b  ! 331: LDSTUBA_R	ldstuba	%r4, [%r10 + %r11] 0x80
	.word 0x04800001  ! 332: BLE	ble  	<label_0x1>
	.word 0x8d6aa2a0  ! 333: SDIVX_I	sdivx	%r10, 0x02a0, %r6
	.word 0x0ac20001  ! 334: BRNZ	brnz  ,nt	%8,<label_0x20001>
	.word 0xd8ea900b  ! 335: LDSTUBA_R	ldstuba	%r12, [%r10 + %r11] 0x80
	.word 0xf06aaccc  ! 336: LDSTUB_I	ldstub	%r24, [%r10 + 0x0ccc]
	.word 0xbc7aaf70  ! 337: SDIV_I	sdiv 	%r10, 0x0f70, %r30
	.word 0x8143e021  ! 338: MEMBAR	membar	#LoadLoad | #MemIssue 
	.word 0xe2c2ae14  ! 339: LDSWA_I	ldswa	[%r10, + 0x0e14] %asi, %r17
	.word 0x0e800001  ! 340: BVS	bvs  	<label_0x1>
	.word 0xcac2afa8  ! 341: LDSWA_I	ldswa	[%r10, + 0x0fa8] %asi, %r5
	.word 0xb1a2892b  ! 342: FMULs	fmuls	%f10, %f11, %f24
	.word 0xc4b2ab5c  ! 343: STHA_I	stha	%r2, [%r10 + 0x0b5c] %asi
	.word 0x8143e07c  ! 344: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xccd2900b  ! 345: LDSHA_R	ldsha	[%r10, %r11] 0x80, %r6
	.word 0xa7a2892b  ! 346: FMULs	fmuls	%f10, %f11, %f19
	.word 0x83da800b  ! 347: FLUSH_R	dis not found

	.word 0x0c800001  ! 348: BNEG	bneg  	<label_0x1>
	.word 0xf242a024  ! 349: LDSW_I	ldsw	[%r10 + 0x0024], %r25
	.word 0x20800001  ! 350: BN	bn,a	<label_0x1>
	.word 0xb722aad4  ! 351: MULScc_I	mulscc 	%r10, 0x0ad4, %r27
	.word 0x88f2800b  ! 352: UDIVcc_R	udivcc 	%r10, %r11, %r4
	.word 0xc36aa2f0  ! 353: PREFETCH_I	prefetch	[%r10 + 0x02f0], #one_read
	.word 0xe6f2900b  ! 354: STXA_R	stxa	%r19, [%r10 + %r11] 0x80
	.word 0x3e800003  ! 355: BVC	bvc,a	<label_0x3>
	.word 0xd0c2a42c  ! 356: LDSWA_I	ldswa	[%r10, + 0x042c] %asi, %r8
	.word 0xafa2892b  ! 358: FMULs	fmuls	%f10, %f11, %f23
	.word 0x22ca0001  ! 359: BRZ	brz,a,pt	%8,<label_0xa0001>
	.word 0x0cc20001  ! 360: BRGZ	brgz  ,nt	%8,<label_0x20001>
	.word 0x83da800b  ! 361: FLUSH_R	dis not found

	.word 0xcaeaa6cc  ! 362: LDSTUBA_I	ldstuba	%r5, [%r10 + 0x06cc] %asi
	.word 0xdf3aaf20  ! 363: STDF_I	std	%f15, [0x0f20, %r10]
	.word 0x8a4aa748  ! 364: MULX_I	mulx 	%r10, 0x0748, %r5
	.word 0xc41aa6f8  ! 365: LDD_I	ldd	[%r10 + 0x06f8], %r2
	.word 0xe46a800b  ! 366: LDSTUB_R	ldstub	%r18, [%r10 + %r11]
	.word 0xc452ac98  ! 367: LDSH_I	ldsh	[%r10 + 0x0c98], %r2
	.word 0x8143c000  ! 368: STBAR	stbar
	.word 0xdf22a7d0  ! 369: STF_I	st	%f15, [0x07d0, %r10]
	.word 0xc36aad64  ! 370: PREFETCH_I	prefetch	[%r10 + 0x0d64], #one_read
	.word 0x1c800003  ! 371: BPOS	bpos  	<label_0x3>
	.word 0x24ca0003  ! 372: BRLEZ	brlez,a,pt	%8,<label_0xa0003>
	.word 0xc81a800b  ! 373: LDD_R	ldd	[%r10 + %r11], %r4
	.word 0xe8b2a784  ! 374: STHA_I	stha	%r20, [%r10 + 0x0784] %asi
	.word 0xc93a800b  ! 375: STDF_R	std	%f4, [%r11, %r10]
	.word 0x8e72800b  ! 376: UDIV_R	udiv 	%r10, %r11, %r7
	.word 0x8143e001  ! 377: MEMBAR	membar	#LoadLoad 
	.word 0xc41aaa58  ! 378: LDD_I	ldd	[%r10 + 0x0a58], %r2
	.word 0xcac2a9b8  ! 379: LDSWA_I	ldswa	[%r10, + 0x09b8] %asi, %r5
	.word 0x8143e029  ! 380: MEMBAR	membar	#LoadLoad | #StoreStore | #MemIssue 
	.word 0x2c800003  ! 381: BNEG	bneg,a	<label_0x3>
	.word 0xd33aa438  ! 382: STDF_I	std	%f9, [0x0438, %r10]
	.word 0xf4d2900b  ! 383: LDSHA_R	ldsha	[%r10, %r11] 0x80, %r26
	.word 0xc20a800b  ! 384: LDUB_R	ldub	[%r10 + %r11], %r1
	.word 0xaef2a608  ! 385: UDIVcc_I	udivcc 	%r10, 0x0608, %r23
	.word 0xc36aaa04  ! 386: PREFETCH_I	prefetch	[%r10 + 0x0a04], #one_read
	.word 0x2e800001  ! 387: BVS	bvs,a	<label_0x1>
	.word 0x8143e048  ! 388: MEMBAR	membar	#StoreStore | #Sync 
	.word 0xebf2a00b  ! 389: CASXA_R	casxa	[%r10]%asi, %r11, %r21
	.word 0x91daa670  ! 390: FLUSH_I	dis not found

	.word 0x916a800b  ! 391: SDIVX_R	sdivx	%r10, %r11, %r8
	.word 0xb04a800b  ! 392: MULX_R	mulx 	%r10, %r11, %r24
	.word 0xbe52800b  ! 393: UMUL_R	umul 	%r10, %r11, %r31
	.word 0xcdf2900b  ! 394: CASXA_I	casxa	[%r10] 0x80, %r11, %r6
	.word 0x83da800b  ! 395: FLUSH_R	dis not found

	.word 0xdd22a410  ! 396: STF_I	st	%f14, [0x0410, %r10]
	.word 0x89daaa84  ! 397: FLUSH_I	dis not found

	.word 0x8143c000  ! 398: STBAR	stbar
	.word 0xe4baa2f0  ! 399: STDA_I	stda	%r18, [%r10 + 0x02f0] %asi
	.word 0x8143c000  ! 400: STBAR	stbar
	.word 0x89da800b  ! 401: FLUSH_R	dis not found

	.word 0x26ca0003  ! 402: BRLZ	brlz,a,pt	%8,<label_0xa0003>
	.word 0x9c72a8b8  ! 403: UDIV_I	udiv 	%r10, 0x08b8, %r14
	.word 0xc41a800b  ! 404: LDD_R	ldd	[%r10 + %r11], %r2
	.word 0xc36aa028  ! 405: PREFETCH_I	prefetch	[%r10 + 0x0028], #one_read
	.word 0x1c800001  ! 406: BPOS	bpos  	<label_0x1>
	.word 0x916a800b  ! 407: SDIVX_R	sdivx	%r10, %r11, %r8
	.word 0x8f6aa674  ! 408: SDIVX_I	sdivx	%r10, 0x0674, %r7
	.word 0x91a289ab  ! 409: FDIVs	fdivs	%f10, %f11, %f8
	.word 0x93a2892b  ! 410: FMULs	fmuls	%f10, %f11, %f9
	.word 0x8143c000  ! 412: STBAR	stbar
	.word 0xc45aa148  ! 413: LDX_I	ldx	[%r10 + 0x0148], %r2
	.word 0xcc1a800b  ! 414: LDD_R	ldd	[%r10 + %r11], %r6
	.word 0xdeda900b  ! 415: LDXA_R	ldxa	[%r10, %r11] 0x80, %r15
	.word 0x8f22a8b8  ! 417: MULScc_I	mulscc 	%r10, 0x08b8, %r7
	.word 0xc612a27c  ! 418: LDUH_I	lduh	[%r10 + 0x027c], %r3
	.word 0xc402800b  ! 419: LDUW_R	lduw	[%r10 + %r11], %r2
	.word 0xfeeaa6a0  ! 420: LDSTUBA_I	ldstuba	%r31, [%r10 + 0x06a0] %asi
	.word 0x1c800001  ! 421: BPOS	bpos  	<label_0x1>
	.word 0x87daad5c  ! 422: FLUSH_I	dis not found

	.word 0xce42a31c  ! 423: LDSW_I	ldsw	[%r10 + 0x031c], %r7
	.word 0xc93aa318  ! 424: STDF_I	std	%f4, [0x0318, %r10]
	.word 0x8b22800b  ! 425: MULScc_R	mulscc 	%r10, %r11, %r5
	.word 0x8e5aa710  ! 426: SMUL_I	smul 	%r10, 0x0710, %r7
	.word 0xaad2ad68  ! 427: UMULcc_I	umulcc 	%r10, 0x0d68, %r21
	.word 0x8143e071  ! 428: MEMBAR	membar	#LoadLoad | #Lookaside | #MemIssue | #Sync 
	.word 0xa1daacec  ! 429: FLUSH_I	dis not found

	.word 0xce6aa5b0  ! 430: LDSTUB_I	ldstub	%r7, [%r10 + 0x05b0]
	.word 0xc6d2a8c0  ! 431: LDSHA_I	ldsha	[%r10, + 0x08c0] %asi, %r3
	.word 0xcc6aa314  ! 432: LDSTUB_I	ldstub	%r6, [%r10 + 0x0314]
	.word 0xc8b2900b  ! 433: STHA_R	stha	%r4, [%r10 + %r11] 0x80
	.word 0xc9e2900b  ! 434: CASA_I	casa	[%r10] 0x80, %r11, %r4
	.word 0x827a800b  ! 435: SDIV_R	sdiv 	%r10, %r11, %r1
	.word 0x89da800b  ! 436: FLUSH_R	dis not found

	.word 0x1e800001  ! 437: BVC	bvc  	<label_0x1>
	.word 0x887a800b  ! 438: SDIV_R	sdiv 	%r10, %r11, %r4
	.word 0x886a800b  ! 439: UDIVX_R	udivx 	%r10, %r11, %r4
	.word 0x9252800b  ! 440: UMUL_R	umul 	%r10, %r11, %r9
	.word 0x93da800b  ! 441: FLUSH_R	dis not found

	.word 0x8c52a830  ! 442: UMUL_I	umul 	%r10, 0x0830, %r6
	.word 0xb36aa08c  ! 443: SDIVX_I	sdivx	%r10, 0x008c, %r25
	.word 0xc3ea900b  ! 444: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0xc682a878  ! 445: LDUWA_I	lduwa	[%r10, + 0x0878] %asi, %r3
	.word 0x91da800b  ! 446: FLUSH_R	dis not found

	.word 0x8af2a1f4  ! 448: UDIVcc_I	udivcc 	%r10, 0x01f4, %r5
	.word 0x8143c000  ! 449: STBAR	stbar
	.word 0x87da800b  ! 450: FLUSH_R	dis not found

	.word 0xcd22800b  ! 451: STF_R	st	%f6, [%r11, %r10]
	.word 0x93daa404  ! 452: FLUSH_I	dis not found

	.word 0xb85aad6c  ! 453: SMUL_I	smul 	%r10, 0x0d6c, %r28
	.word 0x8143e05b  ! 454: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Lookaside | #Sync 
	.word 0xcc92900b  ! 457: LDUHA_R	lduha	[%r10, %r11] 0x80, %r6
	.word 0xfc12800b  ! 458: LDUH_R	lduh	[%r10 + %r11], %r30
	.word 0xc8aaa1d8  ! 459: STBA_I	stba	%r4, [%r10 + 0x01d8] %asi
	.word 0x87daa68c  ! 460: FLUSH_I	dis not found

	.word 0xc482af1c  ! 461: LDUWA_I	lduwa	[%r10, + 0x0f1c] %asi, %r2
	.word 0xf002800b  ! 462: LDUW_R	lduw	[%r10 + %r11], %r24
	.word 0x26c20003  ! 463: BRLZ	brlz,a,nt	%8,<label_0x20003>
	.word 0xc36aac38  ! 464: PREFETCH_I	prefetch	[%r10 + 0x0c38], #one_read
	.word 0xc4ca900b  ! 465: LDSBA_R	ldsba	[%r10, %r11] 0x80, %r2
	.word 0x8143c000  ! 466: STBAR	stbar
	.word 0x2a800001  ! 467: BCS	bcs,a	<label_0x1>
	.word 0x825aa5e8  ! 468: SMUL_I	smul 	%r10, 0x05e8, %r1
	.word 0xcbf2a00b  ! 469: CASXA_R	casxa	[%r10]%asi, %r11, %r5
	.word 0x8672800b  ! 471: UDIV_R	udiv 	%r10, %r11, %r3
	.word 0xfef2a5c0  ! 473: STXA_I	stxa	%r31, [%r10 + 0x05c0] %asi
	.word 0xceaaac3c  ! 474: STBA_I	stba	%r7, [%r10 + 0x0c3c] %asi
	.word 0x846a800b  ! 475: UDIVX_R	udivx 	%r10, %r11, %r2
	.word 0x8ba2892b  ! 476: FMULs	fmuls	%f10, %f11, %f5
	.word 0xcefaaf78  ! 477: SWAPA_I	swapa	%r7, [%r10 + 0x0f78] %asi
	.word 0xc27a800b  ! 478: SWAP_R	swap	%r1, [%r10 + %r11]
	.word 0xc65aa0d0  ! 479: LDX_I	ldx	[%r10 + 0x00d0], %r3
	.word 0xc3eaaf58  ! 480: PREFETCHA_I	prefetcha	[%r10, + 0x0f58] %asi, #one_read
	.word 0x8143c000  ! 481: STBAR	stbar
	.word 0xd13aa9c8  ! 482: STDF_I	std	%f8, [0x09c8, %r10]
	.word 0x8143c000  ! 483: STBAR	stbar
	.word 0xceda900b  ! 484: LDXA_R	ldxa	[%r10, %r11] 0x80, %r7
	.word 0x8143e068  ! 485: MEMBAR	membar	#StoreStore | #MemIssue | #Sync 
	.word 0x8fda800b  ! 486: FLUSH_R	dis not found

	.word 0xccb2900b  ! 487: STHA_R	stha	%r6, [%r10 + %r11] 0x80
	.word 0xe08a900b  ! 488: LDUBA_R	lduba	[%r10, %r11] 0x80, %r16
	.word 0xbc7aac7c  ! 489: SDIV_I	sdiv 	%r10, 0x0c7c, %r30
	.word 0xc5e2a00b  ! 490: CASA_R	casa	[%r10] %asi, %r11, %r2
	.word 0x8e6aa7e0  ! 491: UDIVX_I	udivx 	%r10, 0x07e0, %r7
	.word 0x8143c000  ! 492: STBAR	stbar
	.word 0x8dda800b  ! 493: FLUSH_R	dis not found

	.word 0xc522800b  ! 494: STF_R	st	%f2, [%r11, %r10]
	.word 0xe5e2a00b  ! 495: CASA_R	casa	[%r10] %asi, %r11, %r18
	.word 0xdccaa1fc  ! 496: LDSBA_I	ldsba	[%r10, + 0x01fc] %asi, %r14
	.word 0x04800003  ! 497: BLE	ble  	<label_0x3>
	.word 0xcdf2900b  ! 498: CASXA_I	casxa	[%r10] 0x80, %r11, %r6
	.word 0xc36a800b  ! 499: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0xc2daa030  ! 500: LDXA_I	ldxa	[%r10, + 0x0030] %asi, %r1
	.word 0xe4f2a858  ! 501: STXA_I	stxa	%r18, [%r10 + 0x0858] %asi
	.word 0xd01a800b  ! 502: LDD_R	ldd	[%r10 + %r11], %r8
	.word 0xba4aa17c  ! 503: MULX_I	mulx 	%r10, 0x017c, %r29
	.word 0x10800001  ! 504: BA	ba  	<label_0x1>
	.word 0xd0f2a2b0  ! 505: STXA_I	stxa	%r8, [%r10 + 0x02b0] %asi
	.word 0xe49aa3a0  ! 506: LDDA_I	ldda	[%r10, + 0x03a0] %asi, %r18
	.word 0xf3f2900b  ! 507: CASXA_I	casxa	[%r10] 0x80, %r11, %r25
	.word 0xc6ca900b  ! 508: LDSBA_R	ldsba	[%r10, %r11] 0x80, %r3
	.word 0x8fda800b  ! 509: FLUSH_R	dis not found

	.word 0xe0aa900b  ! 510: STBA_R	stba	%r16, [%r10 + %r11] 0x80
	.word 0xbefaafa0  ! 511: SDIVcc_I	sdivcc 	%r10, 0x0fa0, %r31
	.word 0xb1daac18  ! 512: FLUSH_I	dis not found

	.word 0xc36aa3a8  ! 513: PREFETCH_I	prefetch	[%r10 + 0x03a8], #one_read
	.word 0xf88aa66c  ! 514: LDUBA_I	lduba	[%r10, + 0x066c] %asi, %r28
	.word 0xc46a800b  ! 515: LDSTUB_R	ldstub	%r2, [%r10 + %r11]
	.word 0xecfaadec  ! 516: SWAPA_I	swapa	%r22, [%r10 + 0x0dec] %asi
	.word 0x93da800b  ! 517: FLUSH_R	dis not found

	.word 0xca42800b  ! 518: LDSW_R	ldsw	[%r10 + %r11], %r5
	.word 0x8afa800b  ! 519: SDIVcc_R	sdivcc 	%r10, %r11, %r5
	.word 0x26800001  ! 520: BL	bl,a	<label_0x1>
	.word 0xc292adb4  ! 521: LDUHA_I	lduha	[%r10, + 0x0db4] %asi, %r1
	.word 0x8f22a6f8  ! 523: MULScc_I	mulscc 	%r10, 0x06f8, %r7
	.word 0xd33a800b  ! 525: STDF_R	std	%f9, [%r11, %r10]
	.word 0xec42800b  ! 526: LDSW_R	ldsw	[%r10 + %r11], %r22
	.word 0xaa6aa394  ! 527: UDIVX_I	udivx 	%r10, 0x0394, %r21
	.word 0xc36a800b  ! 528: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0xbc5aab50  ! 529: SMUL_I	smul 	%r10, 0x0b50, %r30
	.word 0xc4b2900b  ! 530: STHA_R	stha	%r2, [%r10 + %r11] 0x80
	.word 0x93a288ab  ! 531: FSUBs	fsubs	%f10, %f11, %f9
	.word 0xa1da800b  ! 532: FLUSH_R	dis not found

	.word 0xfc12800b  ! 533: LDUH_R	lduh	[%r10 + %r11], %r30
	.word 0x8143c000  ! 534: STBAR	stbar
	.word 0xe0ba900b  ! 536: STDA_R	stda	%r16, [%r10 + %r11] 0x80
	.word 0x8b22a9d8  ! 537: MULScc_I	mulscc 	%r10, 0x09d8, %r5
	.word 0xb7daae5c  ! 538: FLUSH_I	dis not found

	.word 0xca92a304  ! 539: LDUHA_I	lduha	[%r10, + 0x0304] %asi, %r5
	.word 0x90d2800b  ! 540: UMULcc_R	umulcc 	%r10, %r11, %r8
	.word 0x86f2a300  ! 541: UDIVcc_I	udivcc 	%r10, 0x0300, %r3
	.word 0xe492aaa8  ! 542: LDUHA_I	lduha	[%r10, + 0x0aa8] %asi, %r18
	.word 0xc8daa680  ! 543: LDXA_I	ldxa	[%r10, + 0x0680] %asi, %r4
	.word 0xcc42800b  ! 544: LDSW_R	ldsw	[%r10 + %r11], %r6
	.word 0xae4aaff0  ! 545: MULX_I	mulx 	%r10, 0x0ff0, %r23
	.word 0xc36a800b  ! 546: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0xccd2900b  ! 548: LDSHA_R	ldsha	[%r10, %r11] 0x80, %r6
	.word 0x885aaa2c  ! 549: SMUL_I	smul 	%r10, 0x0a2c, %r4
	.word 0x8143e03c  ! 550: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0xc2ea900b  ! 551: LDSTUBA_R	ldstuba	%r1, [%r10 + %r11] 0x80
	.word 0x16800003  ! 553: BGE	bge  	<label_0x3>
	.word 0xcac2900b  ! 554: LDSWA_R	ldswa	[%r10, %r11] 0x80, %r5
	.word 0x8652800b  ! 555: UMUL_R	umul 	%r10, %r11, %r3
	.word 0xf3f2a00b  ! 556: CASXA_R	casxa	[%r10]%asi, %r11, %r25
	.word 0x91da800b  ! 557: FLUSH_R	dis not found

	.word 0xaf22800b  ! 558: MULScc_R	mulscc 	%r10, %r11, %r23
	.word 0xc53a800b  ! 559: STDF_R	std	%f2, [%r11, %r10]
	.word 0x8143e000  ! 560: MEMBAR	membar	
	.word 0xfafa900b  ! 561: SWAPA_R	swapa	%r29, [%r10 + %r11] 0x80
	.word 0xc36a800b  ! 562: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x84d2a8e0  ! 563: UMULcc_I	umulcc 	%r10, 0x08e0, %r2
	.word 0xce52800b  ! 564: LDSH_R	ldsh	[%r10 + %r11], %r7
	.word 0x8fda800b  ! 565: FLUSH_R	dis not found

	.word 0xc66aa828  ! 566: LDSTUB_I	ldstub	%r3, [%r10 + 0x0828]
	.word 0x865a800b  ! 567: SMUL_R	smul 	%r10, %r11, %r3
	.word 0xa922a80c  ! 569: MULScc_I	mulscc 	%r10, 0x080c, %r20
	.word 0x8143e062  ! 570: MEMBAR	membar	#StoreLoad | #MemIssue | #Sync 
	.word 0xea0aaecc  ! 571: LDUB_I	ldub	[%r10 + 0x0ecc], %r21
	.word 0x90f2a638  ! 572: UDIVcc_I	udivcc 	%r10, 0x0638, %r8
	.word 0x04c20003  ! 573: BRLEZ	brlez  ,nt	%8,<label_0x20003>
	.word 0xcdf2900b  ! 574: CASXA_I	casxa	[%r10] 0x80, %r11, %r6
	.word 0x83a2892b  ! 575: FMULs	fmuls	%f10, %f11, %f1
	.word 0xa3a288ab  ! 576: FSUBs	fsubs	%f10, %f11, %f17
	.word 0x8143e03c  ! 577: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0xcceaa874  ! 578: LDSTUBA_I	ldstuba	%r6, [%r10 + 0x0874] %asi
	.word 0x3a800003  ! 579: BCC	bcc,a	<label_0x3>
	.word 0xca7a800b  ! 580: SWAP_R	swap	%r5, [%r10 + %r11]
	.word 0x9cf2800b  ! 581: UDIVcc_R	udivcc 	%r10, %r11, %r14
	.word 0xcc52a624  ! 582: LDSH_I	ldsh	[%r10 + 0x0624], %r6
	.word 0xb1da800b  ! 583: FLUSH_R	dis not found

	.word 0xe4ba900b  ! 584: STDA_R	stda	%r18, [%r10 + %r11] 0x80
	.word 0xdc5aa0b0  ! 585: LDX_I	ldx	[%r10 + 0x00b0], %r14
	.word 0x83daae9c  ! 586: FLUSH_I	dis not found

	.word 0x916aac90  ! 587: SDIVX_I	sdivx	%r10, 0x0c90, %r8
	.word 0xc852800b  ! 588: LDSH_R	ldsh	[%r10 + %r11], %r4
	.word 0x84da800b  ! 589: SMULcc_R	smulcc 	%r10, %r11, %r2
	.word 0xfe4a800b  ! 590: LDSB_R	ldsb	[%r10 + %r11], %r31
	.word 0xc36aa3d4  ! 591: PREFETCH_I	prefetch	[%r10 + 0x03d4], #one_read
	.word 0x8e7a800b  ! 592: SDIV_R	sdiv 	%r10, %r11, %r7
	.word 0xda0a800b  ! 593: LDUB_R	ldub	[%r10 + %r11], %r13
	.word 0xc41a800b  ! 594: LDD_R	ldd	[%r10 + %r11], %r2
	.word 0xc20aa000  ! 595: LDUB_I	ldub	[%r10 + 0x0000], %r1
	.word 0xee8a900b  ! 596: LDUBA_R	lduba	[%r10, %r11] 0x80, %r23
	.word 0xc8fa900b  ! 597: SWAPA_R	swapa	%r4, [%r10 + %r11] 0x80
	.word 0x896aa770  ! 598: SDIVX_I	sdivx	%r10, 0x0770, %r4
	.word 0xf6d2900b  ! 600: LDSHA_R	ldsha	[%r10, %r11] 0x80, %r27
	.word 0x8143c000  ! 601: STBAR	stbar
	.word 0xd122800b  ! 602: STF_R	st	%f8, [%r11, %r10]
	.word 0x9122800b  ! 603: MULScc_R	mulscc 	%r10, %r11, %r8
	.word 0x8143c000  ! 604: STBAR	stbar
	.word 0x12800001  ! 605: BNE	bne  	<label_0x1>
	.word 0xc8d2900b  ! 606: LDSHA_R	ldsha	[%r10, %r11] 0x80, %r4
	.word 0x8472800b  ! 607: UDIV_R	udiv 	%r10, %r11, %r2
	.word 0x98daa65c  ! 608: SMULcc_I	smulcc 	%r10, 0x065c, %r12
	.word 0x8a7a800b  ! 609: SDIV_R	sdiv 	%r10, %r11, %r5
	.word 0xce7aa1ac  ! 610: SWAP_I	swap	%r7, [%r10 + 0x01ac]
	.word 0x8672800b  ! 611: UDIV_R	udiv 	%r10, %r11, %r3
	.word 0xc36a800b  ! 612: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x36800003  ! 613: BGE	bge,a	<label_0x3>
	.word 0xc652800b  ! 614: LDSH_R	ldsh	[%r10 + %r11], %r3
	.word 0x83a2892b  ! 615: FMULs	fmuls	%f10, %f11, %f1
	.word 0xdc7aab34  ! 616: SWAP_I	swap	%r14, [%r10 + 0x0b34]
	.word 0xfd22a250  ! 617: STF_I	st	%f30, [0x0250, %r10]
	.word 0xf6aaadd4  ! 618: STBA_I	stba	%r27, [%r10 + 0x0dd4] %asi
	.word 0xf8faad68  ! 619: SWAPA_I	swapa	%r28, [%r10 + 0x0d68] %asi
	.word 0x85daa67c  ! 620: FLUSH_I	dis not found

	.word 0x8da2882b  ! 621: FADDs	fadds	%f10, %f11, %f6
	.word 0xce92a37c  ! 622: LDUHA_I	lduha	[%r10, + 0x037c] %asi, %r7
	.word 0x83daa140  ! 623: FLUSH_I	dis not found

	.word 0x8c52800b  ! 624: UMUL_R	umul 	%r10, %r11, %r6
	.word 0xcef2a0a0  ! 625: STXA_I	stxa	%r7, [%r10 + 0x00a0] %asi
	.word 0x9a5a800b  ! 626: SMUL_R	smul 	%r10, %r11, %r13
	.word 0x06800001  ! 627: BL	bl  	<label_0x1>
	.word 0xc882900b  ! 628: LDUWA_R	lduwa	[%r10, %r11] 0x80, %r4
	.word 0xceda900b  ! 629: LDXA_R	ldxa	[%r10, %r11] 0x80, %r7
	.word 0x24c20003  ! 630: BRLEZ	brlez,a,nt	%8,<label_0x20003>
	.word 0xc3eaa634  ! 631: PREFETCHA_I	prefetcha	[%r10, + 0x0634] %asi, #one_read
	.word 0x8fdaab5c  ! 632: FLUSH_I	dis not found

	.word 0x83a289ab  ! 633: FDIVs	fdivs	%f10, %f11, %f1
	.word 0xd0caae20  ! 634: LDSBA_I	ldsba	[%r10, + 0x0e20] %asi, %r8
	.word 0xc722a858  ! 635: STF_I	st	%f3, [0x0858, %r10]
	.word 0xcaa2aac0  ! 636: STWA_I	stwa	%r5, [%r10 + 0x0ac0] %asi
	.word 0xc24aa898  ! 637: LDSB_I	ldsb	[%r10 + 0x0898], %r1
	.word 0xc322800b  ! 638: STF_R	st	%f1, [%r11, %r10]
	.word 0xbddaaa10  ! 639: FLUSH_I	dis not found

	.word 0xeab2900b  ! 640: STHA_R	stha	%r21, [%r10 + %r11] 0x80
	.word 0x90f2a1b8  ! 641: UDIVcc_I	udivcc 	%r10, 0x01b8, %r8
	.word 0xfeaa900b  ! 642: STBA_R	stba	%r31, [%r10 + %r11] 0x80
	.word 0x8143e01e  ! 643: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside 
	.word 0x8c5aa4c0  ! 644: SMUL_I	smul 	%r10, 0x04c0, %r6
	.word 0xb5daae24  ! 645: FLUSH_I	dis not found

	.word 0xc3ea900b  ! 646: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0xe4a2a12c  ! 647: STWA_I	stwa	%r18, [%r10 + 0x012c] %asi
	.word 0xc9e2900b  ! 648: CASA_I	casa	[%r10] 0x80, %r11, %r4
	.word 0xc4ba900b  ! 649: STDA_R	stda	%r2, [%r10 + %r11] 0x80
	.word 0xc41aab20  ! 650: LDD_I	ldd	[%r10 + 0x0b20], %r2
	.word 0xd2aaaaec  ! 651: STBA_I	stba	%r9, [%r10 + 0x0aec] %asi
	.word 0xa5daa5e4  ! 653: FLUSH_I	dis not found

	.word 0xc322800b  ! 654: STF_R	st	%f1, [%r11, %r10]
	.word 0x9af2aa68  ! 655: UDIVcc_I	udivcc 	%r10, 0x0a68, %r13
	.word 0xf4ba900b  ! 656: STDA_R	stda	%r26, [%r10 + %r11] 0x80
	.word 0xd2ea900b  ! 657: LDSTUBA_R	ldstuba	%r9, [%r10 + %r11] 0x80
	.word 0x84d2a300  ! 658: UMULcc_I	umulcc 	%r10, 0x0300, %r2
	.word 0x8ddaa52c  ! 659: FLUSH_I	dis not found

	.word 0xcaa2a570  ! 660: STWA_I	stwa	%r5, [%r10 + 0x0570] %asi
	.word 0x92f2800b  ! 661: UDIVcc_R	udivcc 	%r10, %r11, %r9
	.word 0x06ca0003  ! 662: BRLZ	brlz  ,pt	%8,<label_0xa0003>
	.word 0x8143e00c  ! 663: MEMBAR	membar	#LoadStore | #StoreStore 
	.word 0xf87aade8  ! 664: SWAP_I	swap	%r28, [%r10 + 0x0de8]
	.word 0x83da800b  ! 665: FLUSH_R	dis not found

	.word 0x9fda800b  ! 666: FLUSH_R	dis not found

	.word 0xfbf2900b  ! 667: CASXA_I	casxa	[%r10] 0x80, %r11, %r29
	.word 0x8143c000  ! 668: STBAR	stbar
	.word 0x06800001  ! 669: BL	bl  	<label_0x1>
	.word 0x20800001  ! 670: BN	bn,a	<label_0x1>
	.word 0xbcda800b  ! 671: SMULcc_R	smulcc 	%r10, %r11, %r30
	.word 0x9052a5ac  ! 672: UMUL_I	umul 	%r10, 0x05ac, %r8
	.word 0xc922a470  ! 673: STF_I	st	%f4, [0x0470, %r10]
	.word 0xfa02800b  ! 674: LDUW_R	lduw	[%r10 + %r11], %r29
	.word 0xc3ea900b  ! 675: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0xc7e2900b  ! 676: CASA_I	casa	[%r10] 0x80, %r11, %r3
	.word 0xe6b2a1bc  ! 677: STHA_I	stha	%r19, [%r10 + 0x01bc] %asi
	.word 0x91daa0c0  ! 678: FLUSH_I	dis not found

	.word 0xcb3a800b  ! 679: STDF_R	std	%f5, [%r11, %r10]
	.word 0x93da800b  ! 680: FLUSH_R	dis not found

	.word 0x8cf2800b  ! 681: UDIVcc_R	udivcc 	%r10, %r11, %r6
	.word 0x9da2892b  ! 682: FMULs	fmuls	%f10, %f11, %f14
	.word 0xc8aa900b  ! 684: STBA_R	stba	%r4, [%r10 + %r11] 0x80
	.word 0x8143e060  ! 685: MEMBAR	membar	#MemIssue | #Sync 
	.word 0x87da800b  ! 686: FLUSH_R	dis not found

	.word 0xceb2a768  ! 687: STHA_I	stha	%r7, [%r10 + 0x0768] %asi
	.word 0xca52a210  ! 688: LDSH_I	ldsh	[%r10 + 0x0210], %r5
	.word 0xdab2900b  ! 689: STHA_R	stha	%r13, [%r10 + %r11] 0x80
	.word 0x8143e022  ! 690: MEMBAR	membar	#StoreLoad | #MemIssue 
	.word 0x905a800b  ! 691: SMUL_R	smul 	%r10, %r11, %r8
	.word 0x16800001  ! 692: BGE	bge  	<label_0x1>
	.word 0xc3ea900b  ! 693: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0x8c6a800b  ! 694: UDIVX_R	udivx 	%r10, %r11, %r6
	.word 0xc642800b  ! 695: LDSW_R	ldsw	[%r10 + %r11], %r3
	.word 0x82daa8c4  ! 696: SMULcc_I	smulcc 	%r10, 0x08c4, %r1
	.word 0x8c4a800b  ! 697: MULX_R	mulx 	%r10, %r11, %r6
	.word 0xa1a2892b  ! 699: FMULs	fmuls	%f10, %f11, %f16
	.word 0x83da800b  ! 700: FLUSH_R	dis not found

	.word 0x87a289ab  ! 701: FDIVs	fdivs	%f10, %f11, %f3
	.word 0xc852afb4  ! 702: LDSH_I	ldsh	[%r10 + 0x0fb4], %r4
	.word 0x8143c000  ! 704: STBAR	stbar
	.word 0xe8baa240  ! 705: STDA_I	stda	%r20, [%r10 + 0x0240] %asi
	.word 0xe442800b  ! 706: LDSW_R	ldsw	[%r10 + %r11], %r18
	.word 0x8143e049  ! 707: MEMBAR	membar	#LoadLoad | #StoreStore | #Sync 
	.word 0xa6daabc0  ! 708: SMULcc_I	smulcc 	%r10, 0x0bc0, %r19
	.word 0x40000003  ! 709: CALL	call	disp30_3
	.word 0xccbaa4f8  ! 710: STDA_I	stda	%r6, [%r10 + 0x04f8] %asi
	.word 0xc3eaac48  ! 711: PREFETCHA_I	prefetcha	[%r10, + 0x0c48] %asi, #one_read
	.word 0x8b22ae70  ! 712: MULScc_I	mulscc 	%r10, 0x0e70, %r5
	.word 0xf482aeb8  ! 714: LDUWA_I	lduwa	[%r10, + 0x0eb8] %asi, %r26
	.word 0xc20a800b  ! 715: LDUB_R	ldub	[%r10 + %r11], %r1
	.word 0x2c800001  ! 716: BNEG	bneg,a	<label_0x1>
	.word 0xcd3aa818  ! 717: STDF_I	std	%f6, [0x0818, %r10]
	.word 0xe3e2a00b  ! 718: CASA_R	casa	[%r10] %asi, %r11, %r17
	.word 0xab6a800b  ! 719: SDIVX_R	sdivx	%r10, %r11, %r21
	.word 0x88daaca8  ! 720: SMULcc_I	smulcc 	%r10, 0x0ca8, %r4
	.word 0x9dda800b  ! 721: FLUSH_R	dis not found

	.word 0xfbe2900b  ! 722: CASA_I	casa	[%r10] 0x80, %r11, %r29
	.word 0xce82a238  ! 723: LDUWA_I	lduwa	[%r10, + 0x0238] %asi, %r7
	.word 0x8143e004  ! 724: MEMBAR	membar	#LoadStore 
	.word 0xcef2900b  ! 725: STXA_R	stxa	%r7, [%r10 + %r11] 0x80
	.word 0x3c800003  ! 726: BPOS	bpos,a	<label_0x3>
	.word 0x8143e02b  ! 727: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #MemIssue 
	.word 0x8143c000  ! 728: STBAR	stbar
	.word 0xddf2900b  ! 729: CASXA_I	casxa	[%r10] 0x80, %r11, %r14
	.word 0xb7da800b  ! 730: FLUSH_R	dis not found

	.word 0x8efa800b  ! 731: SDIVcc_R	sdivcc 	%r10, %r11, %r7
	.word 0x12800001  ! 732: BNE	bne  	<label_0x1>
	.word 0x986a800b  ! 733: UDIVX_R	udivx 	%r10, %r11, %r12
	.word 0xc892a574  ! 734: LDUHA_I	lduha	[%r10, + 0x0574] %asi, %r4
	.word 0xc36a800b  ! 735: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x8143e00d  ! 736: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore 
	.word 0xc9e2a00b  ! 737: CASA_R	casa	[%r10] %asi, %r11, %r4
	.word 0xca4a800b  ! 739: LDSB_R	ldsb	[%r10 + %r11], %r5
	.word 0x8fa288ab  ! 740: FSUBs	fsubs	%f10, %f11, %f7
	.word 0xd01a800b  ! 741: LDD_R	ldd	[%r10 + %r11], %r8
	.word 0xd33aa548  ! 742: STDF_I	std	%f9, [0x0548, %r10]
	.word 0xa2d2ac4c  ! 743: UMULcc_I	umulcc 	%r10, 0x0c4c, %r17
	.word 0xeaca900b  ! 744: LDSBA_R	ldsba	[%r10, %r11] 0x80, %r21
	.word 0xd0f2900b  ! 745: STXA_R	stxa	%r8, [%r10 + %r11] 0x80
	.word 0xf202800b  ! 746: LDUW_R	lduw	[%r10 + %r11], %r25
	.word 0xccea900b  ! 747: LDSTUBA_R	ldstuba	%r6, [%r10 + %r11] 0x80
	.word 0xc36aab60  ! 748: PREFETCH_I	prefetch	[%r10 + 0x0b60], #one_read
	.word 0x8143e030  ! 749: MEMBAR	membar	#Lookaside | #MemIssue 
	.word 0x0ac20001  ! 750: BRNZ	brnz  ,nt	%8,<label_0x20001>
	.word 0xcadaaf58  ! 751: LDXA_I	ldxa	[%r10, + 0x0f58] %asi, %r5
	.word 0xcaaa900b  ! 752: STBA_R	stba	%r5, [%r10 + %r11] 0x80
	.word 0xcea2900b  ! 753: STWA_R	stwa	%r7, [%r10 + %r11] 0x80
	.word 0x2a800003  ! 754: BCS	bcs,a	<label_0x3>
	.word 0xfa42a640  ! 755: LDSW_I	ldsw	[%r10 + 0x0640], %r29
	.word 0xc33a800b  ! 756: STDF_R	std	%f1, [%r11, %r10]
	.word 0x8143c000  ! 757: STBAR	stbar
	.word 0x9fda800b  ! 758: FLUSH_R	dis not found

	.word 0x8143c000  ! 759: STBAR	stbar
	.word 0xa872ab7c  ! 760: UDIV_I	udiv 	%r10, 0x0b7c, %r20
	.word 0xc2b2afd0  ! 761: STHA_I	stha	%r1, [%r10 + 0x0fd0] %asi
	.word 0xe6f2a020  ! 762: STXA_I	stxa	%r19, [%r10 + 0x0020] %asi
	.word 0xc2f2a4a0  ! 763: STXA_I	stxa	%r1, [%r10 + 0x04a0] %asi
	.word 0x8143e008  ! 764: MEMBAR	membar	#StoreStore 
	.word 0xd0ba900b  ! 765: STDA_R	stda	%r8, [%r10 + %r11] 0x80
	.word 0x8143e025  ! 766: MEMBAR	membar	#LoadLoad | #LoadStore | #MemIssue 
	.word 0xecb2afa8  ! 767: STHA_I	stha	%r22, [%r10 + 0x0fa8] %asi
	.word 0xc852800b  ! 768: LDSH_R	ldsh	[%r10 + %r11], %r4
	.word 0x9fdaa350  ! 769: FLUSH_I	dis not found

	.word 0x89daaf14  ! 770: FLUSH_I	dis not found

	.word 0xfc6aaea8  ! 771: LDSTUB_I	ldstub	%r30, [%r10 + 0x0ea8]
	.word 0xceaaa488  ! 772: STBA_I	stba	%r7, [%r10 + 0x0488] %asi
	.word 0x92d2800b  ! 773: UMULcc_R	umulcc 	%r10, %r11, %r9
	.word 0x8143c000  ! 774: STBAR	stbar
	.word 0x8143e061  ! 775: MEMBAR	membar	#LoadLoad | #MemIssue | #Sync 
	.word 0xd26a800b  ! 776: LDSTUB_R	ldstub	%r9, [%r10 + %r11]
	.word 0x8143c000  ! 777: STBAR	stbar
	.word 0x40000001  ! 778: CALL	call	disp30_1
	.word 0xafdaa1c8  ! 779: FLUSH_I	dis not found

	.word 0x2cca0003  ! 780: BRGZ	brgz,a,pt	%8,<label_0xa0003>
	.word 0x2c800003  ! 781: BNEG	bneg,a	<label_0x3>
	.word 0xea0a800b  ! 782: LDUB_R	ldub	[%r10 + %r11], %r21
	.word 0x876aa5fc  ! 783: SDIVX_I	sdivx	%r10, 0x05fc, %r3
	.word 0x9c7a800b  ! 784: SDIV_R	sdiv 	%r10, %r11, %r14
	.word 0xa3daa3f0  ! 785: FLUSH_I	dis not found

	.word 0xc3eaae3c  ! 786: PREFETCHA_I	prefetcha	[%r10, + 0x0e3c] %asi, #one_read
	.word 0x86fa800b  ! 787: SDIVcc_R	sdivcc 	%r10, %r11, %r3
	.word 0x9852800b  ! 788: UMUL_R	umul 	%r10, %r11, %r12
	.word 0x87da800b  ! 789: FLUSH_R	dis not found

	.word 0xc66aad2c  ! 790: LDSTUB_I	ldstub	%r3, [%r10 + 0x0d2c]
	.word 0x1a800001  ! 791: BCC	bcc  	<label_0x1>
	.word 0x8143c000  ! 792: STBAR	stbar
	.word 0x83daaf80  ! 793: FLUSH_I	dis not found

	.word 0x8272800b  ! 794: UDIV_R	udiv 	%r10, %r11, %r1
	.word 0x22ca0001  ! 796: BRZ	brz,a,pt	%8,<label_0xa0001>
	.word 0x8efaac2c  ! 797: SDIVcc_I	sdivcc 	%r10, 0x0c2c, %r7
	.word 0x2aca0003  ! 798: BRNZ	brnz,a,pt	%8,<label_0xa0003>
	.word 0xcf22add0  ! 799: STF_I	st	%f7, [0x0dd0, %r10]
	.word 0xc36a800b  ! 800: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0xc93a800b  ! 801: STDF_R	std	%f4, [%r11, %r10]
	.word 0xa652acb0  ! 802: UMUL_I	umul 	%r10, 0x0cb0, %r19
	.word 0x93daa620  ! 803: FLUSH_I	dis not found

	.word 0x86daa798  ! 804: SMULcc_I	smulcc 	%r10, 0x0798, %r3
	.word 0x8143e040  ! 805: MEMBAR	membar	#Sync 
	.word 0x8fda800b  ! 806: FLUSH_R	dis not found

	.word 0x2ac20003  ! 807: BRNZ	brnz,a,nt	%8,<label_0x20003>
	.word 0xb1a289ab  ! 808: FDIVs	fdivs	%f10, %f11, %f24
	.word 0xbcdaa294  ! 809: SMULcc_I	smulcc 	%r10, 0x0294, %r30
	.word 0xea6a800b  ! 810: LDSTUB_R	ldstub	%r21, [%r10 + %r11]
	.word 0xc682a998  ! 811: LDUWA_I	lduwa	[%r10, + 0x0998] %asi, %r3
	.word 0xf53a800b  ! 812: STDF_R	std	%f26, [%r11, %r10]
	.word 0xd27a800b  ! 813: SWAP_R	swap	%r9, [%r10 + %r11]
	.word 0xd082900b  ! 814: LDUWA_R	lduwa	[%r10, %r11] 0x80, %r8
	.word 0xc36aa688  ! 815: PREFETCH_I	prefetch	[%r10 + 0x0688], #one_read
	.word 0x0aca0001  ! 816: BRNZ	brnz  ,pt	%8,<label_0xa0001>
	.word 0x93da800b  ! 818: FLUSH_R	dis not found

	.word 0xcb22800b  ! 820: STF_R	st	%f5, [%r11, %r10]
	.word 0x89da800b  ! 821: FLUSH_R	dis not found

	.word 0x9bdaa154  ! 822: FLUSH_I	dis not found

	.word 0x85da800b  ! 823: FLUSH_R	dis not found

	.word 0x8143c000  ! 825: STBAR	stbar
	.word 0xd282900b  ! 826: LDUWA_R	lduwa	[%r10, %r11] 0x80, %r9
	.word 0xd0caa37c  ! 827: LDSBA_I	ldsba	[%r10, + 0x037c] %asi, %r8
	.word 0x846a800b  ! 828: UDIVX_R	udivx 	%r10, %r11, %r2
	.word 0xceaaa2f4  ! 829: STBA_I	stba	%r7, [%r10 + 0x02f4] %asi
	.word 0xcc02800b  ! 830: LDUW_R	lduw	[%r10 + %r11], %r6
	.word 0x85daa7f8  ! 831: FLUSH_I	dis not found

	.word 0x99a2892b  ! 832: FMULs	fmuls	%f10, %f11, %f12
	.word 0x8143e05b  ! 833: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Lookaside | #Sync 
	.word 0xc3ea900b  ! 834: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0xfc12800b  ! 835: LDUH_R	lduh	[%r10 + %r11], %r30
	.word 0xc8b2a01c  ! 836: STHA_I	stha	%r4, [%r10 + 0x001c] %asi
	.word 0xec02a6f4  ! 838: LDUW_I	lduw	[%r10 + 0x06f4], %r22
	.word 0x8ddaaa08  ! 840: FLUSH_I	dis not found

	.word 0x9fa2892b  ! 841: FMULs	fmuls	%f10, %f11, %f15
	.word 0xc802800b  ! 842: LDUW_R	lduw	[%r10 + %r11], %r4
	.word 0xcf3a800b  ! 843: STDF_R	std	%f7, [%r11, %r10]
	.word 0xd0aaaa34  ! 844: STBA_I	stba	%r8, [%r10 + 0x0a34] %asi
	.word 0xda0a800b  ! 845: LDUB_R	ldub	[%r10 + %r11], %r13
	.word 0xe40a800b  ! 846: LDUB_R	ldub	[%r10 + %r11], %r18
	.word 0xc922800b  ! 847: STF_R	st	%f4, [%r11, %r10]
	.word 0xdada900b  ! 848: LDXA_R	ldxa	[%r10, %r11] 0x80, %r13
	.word 0x89a2892b  ! 849: FMULs	fmuls	%f10, %f11, %f4
	.word 0xb1daa864  ! 850: FLUSH_I	dis not found

	.word 0x0ac20001  ! 851: BRNZ	brnz  ,nt	%8,<label_0x20001>
	.word 0xe8a2900b  ! 852: STWA_R	stwa	%r20, [%r10 + %r11] 0x80
	.word 0x8143e07b  ! 853: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xd0da900b  ! 854: LDXA_R	ldxa	[%r10, %r11] 0x80, %r8
	.word 0xc4aaa2bc  ! 855: STBA_I	stba	%r2, [%r10 + 0x02bc] %asi
	.word 0x8672ab28  ! 856: UDIV_I	udiv 	%r10, 0x0b28, %r3
	.word 0xa7daa3f8  ! 857: FLUSH_I	dis not found

	.word 0x89da800b  ! 858: FLUSH_R	dis not found

	.word 0xc3ea900b  ! 859: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0xc60a800b  ! 860: LDUB_R	ldub	[%r10 + %r11], %r3
	.word 0xc452ae94  ! 861: LDSH_I	ldsh	[%r10 + 0x0e94], %r2
	.word 0xc6daa9c0  ! 862: LDXA_I	ldxa	[%r10, + 0x09c0] %asi, %r3
	.word 0x8bda800b  ! 863: FLUSH_R	dis not found

	.word 0xa07a800b  ! 864: SDIV_R	sdiv 	%r10, %r11, %r16
	.word 0xdc6a800b  ! 865: LDSTUB_R	ldstub	%r14, [%r10 + %r11]
	.word 0x924aadd4  ! 866: MULX_I	mulx 	%r10, 0x0dd4, %r9
	.word 0xd06a800b  ! 867: LDSTUB_R	ldstub	%r8, [%r10 + %r11]
	.word 0x84fa800b  ! 868: SDIVcc_R	sdivcc 	%r10, %r11, %r2
	.word 0xcedaa5f0  ! 871: LDXA_I	ldxa	[%r10, + 0x05f0] %asi, %r7
	.word 0xca6a800b  ! 872: LDSTUB_R	ldstub	%r5, [%r10 + %r11]
	.word 0xc3ea900b  ! 873: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0xf49a900b  ! 874: LDDA_R	ldda	[%r10, %r11] 0x80, %r26
	.word 0xc8f2900b  ! 875: STXA_R	stxa	%r4, [%r10 + %r11] 0x80
	.word 0xe26a800b  ! 876: LDSTUB_R	ldstub	%r17, [%r10 + %r11]
	.word 0xada2892b  ! 878: FMULs	fmuls	%f10, %f11, %f22
	.word 0xa36a800b  ! 879: SDIVX_R	sdivx	%r10, %r11, %r17
	.word 0x8143e01a  ! 880: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside 
	.word 0x906a800b  ! 881: UDIVX_R	udivx 	%r10, %r11, %r8
	.word 0x8ba289ab  ! 882: FDIVs	fdivs	%f10, %f11, %f5
	.word 0xc73a800b  ! 883: STDF_R	std	%f3, [%r11, %r10]
	.word 0xc67a800b  ! 885: SWAP_R	swap	%r3, [%r10 + %r11]
	.word 0x83da800b  ! 886: FLUSH_R	dis not found

	.word 0xced2a508  ! 887: LDSHA_I	ldsha	[%r10, + 0x0508] %asi, %r7
	.word 0xc36a800b  ! 888: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x867aa164  ! 889: SDIV_I	sdiv 	%r10, 0x0164, %r3
	.word 0xbbda800b  ! 890: FLUSH_R	dis not found

	.word 0xdd3a800b  ! 891: STDF_R	std	%f14, [%r11, %r10]
	.word 0xc4ba900b  ! 892: STDA_R	stda	%r2, [%r10 + %r11] 0x80
	.word 0xfafaa974  ! 894: SWAPA_I	swapa	%r29, [%r10 + 0x0974] %asi
	.word 0xc292ad98  ! 896: LDUHA_I	lduha	[%r10, + 0x0d98] %asi, %r1
	.word 0x916a800b  ! 897: SDIVX_R	sdivx	%r10, %r11, %r8
	.word 0xe212a46c  ! 898: LDUH_I	lduh	[%r10 + 0x046c], %r17
	.word 0xccfa900b  ! 899: SWAPA_R	swapa	%r6, [%r10 + %r11] 0x80
	.word 0xa0f2800b  ! 900: UDIVcc_R	udivcc 	%r10, %r11, %r16
	.word 0x02c20001  ! 901: BRZ	brz  ,nt	%8,<label_0x20001>
	.word 0x26800001  ! 902: BL	bl,a	<label_0x1>
	.word 0xe8aa900b  ! 903: STBA_R	stba	%r20, [%r10 + %r11] 0x80
	.word 0xccbaadf0  ! 904: STDA_I	stda	%r6, [%r10 + 0x0df0] %asi
	.word 0xd252800b  ! 905: LDSH_R	ldsh	[%r10 + %r11], %r9
	.word 0xc6ca900b  ! 906: LDSBA_R	ldsba	[%r10, %r11] 0x80, %r3
	.word 0x8bdaa958  ! 907: FLUSH_I	dis not found

	.word 0xc25a800b  ! 908: LDX_R	ldx	[%r10 + %r11], %r1
	.word 0x91daafc0  ! 909: FLUSH_I	dis not found

	.word 0x8143e068  ! 910: MEMBAR	membar	#StoreStore | #MemIssue | #Sync 
	.word 0xbda288ab  ! 911: FSUBs	fsubs	%f10, %f11, %f30
	.word 0x8472800b  ! 912: UDIV_R	udiv 	%r10, %r11, %r2
	.word 0xec42800b  ! 913: LDSW_R	ldsw	[%r10 + %r11], %r22
	.word 0xc8d2900b  ! 914: LDSHA_R	ldsha	[%r10, %r11] 0x80, %r4
	.word 0x8a72a61c  ! 915: UDIV_I	udiv 	%r10, 0x061c, %r5
	.word 0xc492a540  ! 916: LDUHA_I	lduha	[%r10, + 0x0540] %asi, %r2
	.word 0x8d6a800b  ! 917: SDIVX_R	sdivx	%r10, %r11, %r6
	.word 0xe8da900b  ! 918: LDXA_R	ldxa	[%r10, %r11] 0x80, %r20
	.word 0x32800001  ! 919: BNE	bne,a	<label_0x1>
	.word 0x827a800b  ! 920: SDIV_R	sdiv 	%r10, %r11, %r1
	.word 0x85a289ab  ! 921: FDIVs	fdivs	%f10, %f11, %f2
	.word 0xc3ea900b  ! 922: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0x8143e014  ! 924: MEMBAR	membar	#LoadStore | #Lookaside 
	.word 0x40000003  ! 926: CALL	call	disp30_3
	.word 0x8efaa2dc  ! 927: SDIVcc_I	sdivcc 	%r10, 0x02dc, %r7
	.word 0xfff2900b  ! 928: CASXA_I	casxa	[%r10] 0x80, %r11, %r31
	.word 0x26800001  ! 930: BL	bl,a	<label_0x1>
	.word 0xbafa800b  ! 931: SDIVcc_R	sdivcc 	%r10, %r11, %r29
	.word 0xeaa2ad08  ! 932: STWA_I	stwa	%r21, [%r10 + 0x0d08] %asi
	.word 0x8272800b  ! 933: UDIV_R	udiv 	%r10, %r11, %r1
	.word 0xc4aa900b  ! 934: STBA_R	stba	%r2, [%r10 + %r11] 0x80
	.word 0xcedaa6e8  ! 935: LDXA_I	ldxa	[%r10, + 0x06e8] %asi, %r7
	.word 0x8143c000  ! 936: STBAR	stbar
	.word 0x2c800003  ! 937: BNEG	bneg,a	<label_0x3>
	.word 0xcf3a800b  ! 938: STDF_R	std	%f7, [%r11, %r10]
	.word 0xc3eaabbc  ! 939: PREFETCHA_I	prefetcha	[%r10, + 0x0bbc] %asi, #one_read
	.word 0x9fda800b  ! 940: FLUSH_R	dis not found

	.word 0xe1e2a00b  ! 941: CASA_R	casa	[%r10] %asi, %r11, %r16
	.word 0xccfa900b  ! 942: SWAPA_R	swapa	%r6, [%r10 + %r11] 0x80
	.word 0xcc92900b  ! 943: LDUHA_R	lduha	[%r10, %r11] 0x80, %r6
	.word 0xc9e2900b  ! 944: CASA_I	casa	[%r10] 0x80, %r11, %r4
	.word 0x8143c000  ! 945: STBAR	stbar
	.word 0x0cca0003  ! 946: BRGZ	brgz  ,pt	%8,<label_0xa0003>
	.word 0x9fa288ab  ! 947: FSUBs	fsubs	%f10, %f11, %f15
	.word 0x9f6aa850  ! 951: SDIVX_I	sdivx	%r10, 0x0850, %r15
	.word 0xaed2800b  ! 952: UMULcc_R	umulcc 	%r10, %r11, %r23
	.word 0x8143e06f  ! 953: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #MemIssue | #Sync 
	.word 0xd2f2a0a8  ! 954: STXA_I	stxa	%r9, [%r10 + 0x00a8] %asi
	.word 0xa5daae78  ! 955: FLUSH_I	dis not found

	.word 0xd292900b  ! 956: LDUHA_R	lduha	[%r10, %r11] 0x80, %r9
	.word 0xf0d2900b  ! 957: LDSHA_R	ldsha	[%r10, %r11] 0x80, %r24
	.word 0xc8fa900b  ! 958: SWAPA_R	swapa	%r4, [%r10 + %r11] 0x80
	.word 0x8143c000  ! 959: STBAR	stbar
	.word 0x38800001  ! 960: BGU	bgu,a	<label_0x1>
	.word 0x24c20003  ! 961: BRLEZ	brlez,a,nt	%8,<label_0x20003>
	.word 0xfe52800b  ! 962: LDSH_R	ldsh	[%r10 + %r11], %r31
	.word 0xc80a800b  ! 963: LDUB_R	ldub	[%r10 + %r11], %r4
	.word 0xc66aa240  ! 964: LDSTUB_I	ldstub	%r3, [%r10 + 0x0240]
	.word 0x87da800b  ! 965: FLUSH_R	dis not found

	.word 0xc36a800b  ! 966: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x8143c000  ! 967: STBAR	stbar
	.word 0xd0c2900b  ! 968: LDSWA_R	ldswa	[%r10, %r11] 0x80, %r8
	.word 0x8a6a800b  ! 969: UDIVX_R	udivx 	%r10, %r11, %r5
	.word 0x8143e034  ! 970: MEMBAR	membar	#LoadStore | #Lookaside | #MemIssue 
	.word 0xc402a690  ! 971: LDUW_I	lduw	[%r10 + 0x0690], %r2
	.word 0x927a800b  ! 972: SDIV_R	sdiv 	%r10, %r11, %r9
	.word 0xc73a800b  ! 973: STDF_R	std	%f3, [%r11, %r10]
	.word 0xc2ca900b  ! 974: LDSBA_R	ldsba	[%r10, %r11] 0x80, %r1
	.word 0x87daa764  ! 975: FLUSH_I	dis not found

	.word 0xe2aa900b  ! 976: STBA_R	stba	%r17, [%r10 + %r11] 0x80
	.word 0x8143e062  ! 978: MEMBAR	membar	#StoreLoad | #MemIssue | #Sync 
	.word 0xb5a288ab  ! 979: FSUBs	fsubs	%f10, %f11, %f26
	.word 0x8143c000  ! 980: STBAR	stbar
	.word 0xfed2abf8  ! 981: LDSHA_I	ldsha	[%r10, + 0x0bf8] %asi, %r31
	.word 0x8fdaaa9c  ! 982: FLUSH_I	dis not found

	.word 0x92f2800b  ! 983: UDIVcc_R	udivcc 	%r10, %r11, %r9
	.word 0xb9a289ab  ! 984: FDIVs	fdivs	%f10, %f11, %f28
	.word 0xc8b2a5e4  ! 985: STHA_I	stha	%r4, [%r10 + 0x05e4] %asi
	.word 0xb9da800b  ! 986: FLUSH_R	dis not found

	.word 0xfe92900b  ! 987: LDUHA_R	lduha	[%r10, %r11] 0x80, %r31
	.word 0xacd2a490  ! 988: UMULcc_I	umulcc 	%r10, 0x0490, %r22
	.word 0x8c6a800b  ! 989: UDIVX_R	udivx 	%r10, %r11, %r6
	.word 0x0cca0001  ! 990: BRGZ	brgz  ,pt	%8,<label_0xa0001>
	.word 0xde92abcc  ! 991: LDUHA_I	lduha	[%r10, + 0x0bcc] %asi, %r15
	.word 0xce6a800b  ! 992: LDSTUB_R	ldstub	%r7, [%r10 + %r11]
	.word 0xf46a800b  ! 993: LDSTUB_R	ldstub	%r26, [%r10 + %r11]
	.word 0xca4aa358  ! 994: LDSB_I	ldsb	[%r10 + 0x0358], %r5
	.word 0xdefa900b  ! 995: SWAPA_R	swapa	%r15, [%r10 + %r11] 0x80
	.word 0xa7da800b  ! 996: FLUSH_R	dis not found

	.word 0xd2aaa4d4  ! 997: STBA_I	stba	%r9, [%r10 + 0x04d4] %asi
	.word 0xe6c2ab00  ! 998: LDSWA_I	ldswa	[%r10, + 0x0b00] %asi, %r19
	.word 0xcaaaaf8c  ! 999: STBA_I	stba	%r5, [%r10 + 0x0f8c] %asi
	nop
	nop
	nop
        ta      T_GOOD_TRAP
th_main_1:
        setx  MAIN_BASE_DATA_VA, %r1, %r10
        setx  0x0000000000000d50, %g1, %r11
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
        setx  0x653244824866282d, %g1, %r0
        setx  0x197514cd24d9239f, %g1, %r1
        setx  0xb705c3aeda7e4560, %g1, %r2
        setx  0x184ced64a4a6ee39, %g1, %r3
        setx  0xec0249a582e74086, %g1, %r4
        setx  0xb6a108dfcd5a8cda, %g1, %r5
        setx  0x6cb9d98f206a38fd, %g1, %r6
        setx  0xa004ec92c47849eb, %g1, %r7
        setx  0x042600d8dcd9e20d, %g1, %r8
        setx  0xad5e61704af825df, %g1, %r9
        setx  0x8dbda4ca39a588de, %g1, %r12
        setx  0x9219978fa35856c9, %g1, %r13
        setx  0xf4ee28231e580d09, %g1, %r14
        setx  0xab31667ed34ad729, %g1, %r15
        setx  0x836d502e590eb343, %g1, %r16
        setx  0x4b71a922f89dea7c, %g1, %r17
        setx  0x554c9fae81ef886d, %g1, %r18
        setx  0x4ae5b5aab28419dd, %g1, %r19
        setx  0x007fdb5a48ffd07b, %g1, %r20
        setx  0xfd4c8ede73b78595, %g1, %r21
        setx  0x35fa99ba0fb45236, %g1, %r22
        setx  0x5306b62370a6ab0c, %g1, %r23
        setx  0xa889f11dbbd173ad, %g1, %r24
        setx  0xb77480db12a7726b, %g1, %r25
        setx  0x7aa7f57e71d9a41c, %g1, %r26
        setx  0x818449ecce9498e7, %g1, %r27
        setx  0xbd55a02c918a8626, %g1, %r28
        setx  0xd935fd539aa26cfd, %g1, %r29
        setx  0xae4030ed4ec2bb4e, %g1, %r30
        setx  0x54d4b54c2757b7ed, %g1, %r31
	.word 0xe282900b  ! 5: LDUWA_R	lduwa	[%r10, %r11] 0x80, %r17
	.word 0xc80aac2c  ! 6: LDUB_I	ldub	[%r10 + 0x0c2c], %r4
	.word 0x91a289ab  ! 7: FDIVs	fdivs	%f10, %f11, %f8
	.word 0xfc9a900b  ! 8: LDDA_R	ldda	[%r10, %r11] 0x80, %r30
	.word 0xd002800b  ! 9: LDUW_R	lduw	[%r10 + %r11], %r8
	.word 0xc6a2900b  ! 10: STWA_R	stwa	%r3, [%r10 + %r11] 0x80
	.word 0xaefaaad4  ! 11: SDIVcc_I	sdivcc 	%r10, 0x0ad4, %r23
	.word 0x8ef2800b  ! 13: UDIVcc_R	udivcc 	%r10, %r11, %r7
	.word 0xc47aa6f8  ! 14: SWAP_I	swap	%r2, [%r10 + 0x06f8]
	.word 0x1e800001  ! 15: BVC	bvc  	<label_0x1>
	.word 0xa0d2aa3c  ! 16: UMULcc_I	umulcc 	%r10, 0x0a3c, %r16
	.word 0xca52a194  ! 17: LDSH_I	ldsh	[%r10 + 0x0194], %r5
	.word 0xa7da800b  ! 18: FLUSH_R	dis not found

	.word 0x40000003  ! 19: CALL	call	disp30_3
	.word 0xd2a2a770  ! 20: STWA_I	stwa	%r9, [%r10 + 0x0770] %asi
	.word 0xc36a800b  ! 21: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x8143e000  ! 22: MEMBAR	membar	
	.word 0xc2a2900b  ! 23: STWA_R	stwa	%r1, [%r10 + %r11] 0x80
	.word 0xffe2900b  ! 24: CASA_I	casa	[%r10] 0x80, %r11, %r31
	.word 0x896a800b  ! 25: SDIVX_R	sdivx	%r10, %r11, %r4
	.word 0xfa4aa2a0  ! 26: LDSB_I	ldsb	[%r10 + 0x02a0], %r29
	.word 0xf6f2ad80  ! 27: STXA_I	stxa	%r27, [%r10 + 0x0d80] %asi
	.word 0xd93aa1f0  ! 28: STDF_I	std	%f12, [0x01f0, %r10]
	.word 0x87da800b  ! 29: FLUSH_R	dis not found

	.word 0xbc72a804  ! 32: UDIV_I	udiv 	%r10, 0x0804, %r30
	.word 0x0cca0001  ! 34: BRGZ	brgz  ,pt	%8,<label_0xa0001>
	.word 0x8143e043  ! 36: MEMBAR	membar	#LoadLoad | #StoreLoad | #Sync 
	.word 0x8ddaa748  ! 37: FLUSH_I	dis not found

	.word 0xdb3aac60  ! 38: STDF_I	std	%f13, [0x0c60, %r10]
	.word 0x8e4a800b  ! 39: MULX_R	mulx 	%r10, %r11, %r7
	.word 0x1c800001  ! 40: BPOS	bpos  	<label_0x1>
	.word 0xa9a289ab  ! 41: FDIVs	fdivs	%f10, %f11, %f20
	.word 0xfe0a800b  ! 42: LDUB_R	ldub	[%r10 + %r11], %r31
	.word 0xc7f2a00b  ! 43: CASXA_R	casxa	[%r10]%asi, %r11, %r3
	.word 0xd0ba900b  ! 44: STDA_R	stda	%r8, [%r10 + %r11] 0x80
	.word 0xbe5aa5f8  ! 45: SMUL_I	smul 	%r10, 0x05f8, %r31
	.word 0xc3ea900b  ! 46: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0xd2aaa47c  ! 49: STBA_I	stba	%r9, [%r10 + 0x047c] %asi
	.word 0xc2eaa39c  ! 52: LDSTUBA_I	ldstuba	%r1, [%r10 + 0x039c] %asi
	.word 0xee7a800b  ! 53: SWAP_R	swap	%r23, [%r10 + %r11]
	.word 0x86f2ab40  ! 54: UDIVcc_I	udivcc 	%r10, 0x0b40, %r3
	.word 0x8143e043  ! 56: MEMBAR	membar	#LoadLoad | #StoreLoad | #Sync 
	.word 0x8c72800b  ! 57: UDIV_R	udiv 	%r10, %r11, %r6
	.word 0x9f6aaae8  ! 58: SDIVX_I	sdivx	%r10, 0x0ae8, %r15
	.word 0x10800001  ! 59: BA	ba  	<label_0x1>
	.word 0xdcc2a044  ! 60: LDSWA_I	ldswa	[%r10, + 0x0044] %asi, %r14
	.word 0xc682900b  ! 61: LDUWA_R	lduwa	[%r10, %r11] 0x80, %r3
	.word 0xce6a800b  ! 62: LDSTUB_R	ldstub	%r7, [%r10 + %r11]
	.word 0x9322800b  ! 63: MULScc_R	mulscc 	%r10, %r11, %r9
	.word 0xbc7a800b  ! 64: SDIV_R	sdiv 	%r10, %r11, %r30
	.word 0xd1e2a00b  ! 65: CASA_R	casa	[%r10] %asi, %r11, %r8
	.word 0xec42a454  ! 66: LDSW_I	ldsw	[%r10 + 0x0454], %r22
	.word 0x8143e052  ! 67: MEMBAR	membar	#StoreLoad | #Lookaside | #Sync 
	.word 0xe4c2900b  ! 68: LDSWA_R	ldswa	[%r10, %r11] 0x80, %r18
	.word 0xec12a208  ! 69: LDUH_I	lduh	[%r10 + 0x0208], %r22
	.word 0x8143e054  ! 70: MEMBAR	membar	#LoadStore | #Lookaside | #Sync 
	.word 0xc33aa0f0  ! 71: STDF_I	std	%f1, [0x00f0, %r10]
	.word 0x9af2800b  ! 72: UDIVcc_R	udivcc 	%r10, %r11, %r13
	.word 0xc3eaa38c  ! 73: PREFETCHA_I	prefetcha	[%r10, + 0x038c] %asi, #one_read
	.word 0x0cca0001  ! 74: BRGZ	brgz  ,pt	%8,<label_0xa0001>
	.word 0x89da800b  ! 75: FLUSH_R	dis not found

	.word 0xede2a00b  ! 76: CASA_R	casa	[%r10] %asi, %r11, %r22
	.word 0x86f2ad0c  ! 77: UDIVcc_I	udivcc 	%r10, 0x0d0c, %r3
	.word 0x2c800003  ! 78: BNEG	bneg,a	<label_0x3>
	.word 0x16800001  ! 79: BGE	bge  	<label_0x1>
	.word 0xcb22800b  ! 80: STF_R	st	%f5, [%r11, %r10]
	.word 0xe0eaa5e4  ! 81: LDSTUBA_I	ldstuba	%r16, [%r10 + 0x05e4] %asi
	.word 0x8143c000  ! 82: STBAR	stbar
	.word 0xc8baa3f8  ! 83: STDA_I	stda	%r4, [%r10 + 0x03f8] %asi
	.word 0x8143c000  ! 84: STBAR	stbar
	.word 0x22ca0003  ! 85: BRZ	brz,a,pt	%8,<label_0xa0003>
	.word 0x8da2892b  ! 86: FMULs	fmuls	%f10, %f11, %f6
	.word 0x904a800b  ! 87: MULX_R	mulx 	%r10, %r11, %r8
	.word 0x9cdaa560  ! 88: SMULcc_I	smulcc 	%r10, 0x0560, %r14
	.word 0x87daaf94  ! 89: FLUSH_I	dis not found

	.word 0xf282900b  ! 90: LDUWA_R	lduwa	[%r10, %r11] 0x80, %r25
	.word 0x8143e024  ! 91: MEMBAR	membar	#LoadStore | #MemIssue 
	.word 0x0a800003  ! 92: BCS	bcs  	<label_0x3>
	.word 0xcc02800b  ! 93: LDUW_R	lduw	[%r10 + %r11], %r6
	.word 0xdfe2a00b  ! 94: CASA_R	casa	[%r10] %asi, %r11, %r15
	.word 0x8cda800b  ! 95: SMULcc_R	smulcc 	%r10, %r11, %r6
	.word 0x8143c000  ! 96: STBAR	stbar
	.word 0xc3eaa2a8  ! 97: PREFETCHA_I	prefetcha	[%r10, + 0x02a8] %asi, #one_read
	.word 0xbe4a800b  ! 99: MULX_R	mulx 	%r10, %r11, %r31
	.word 0x8143c000  ! 100: STBAR	stbar
	.word 0x8cda800b  ! 101: SMULcc_R	smulcc 	%r10, %r11, %r6
	.word 0xca12800b  ! 102: LDUH_R	lduh	[%r10 + %r11], %r5
	.word 0xf53a800b  ! 103: STDF_R	std	%f26, [%r11, %r10]
	.word 0xce8a900b  ! 104: LDUBA_R	lduba	[%r10, %r11] 0x80, %r7
	.word 0x8143c000  ! 105: STBAR	stbar
	.word 0xf0ba900b  ! 106: STDA_R	stda	%r24, [%r10 + %r11] 0x80
	.word 0xd252800b  ! 107: LDSH_R	ldsh	[%r10 + %r11], %r9
	.word 0xd252aa18  ! 108: LDSH_I	ldsh	[%r10 + 0x0a18], %r9
	.word 0xa7da800b  ! 109: FLUSH_R	dis not found

	.word 0xccca900b  ! 110: LDSBA_R	ldsba	[%r10, %r11] 0x80, %r6
	.word 0xca0a800b  ! 111: LDUB_R	ldub	[%r10 + %r11], %r5
	.word 0xe7e2a00b  ! 112: CASA_R	casa	[%r10] %asi, %r11, %r19
	.word 0x1a800001  ! 113: BCC	bcc  	<label_0x1>
	.word 0x87daac00  ! 114: FLUSH_I	dis not found

	.word 0xcb3a800b  ! 115: STDF_R	std	%f5, [%r11, %r10]
	.word 0x8143c000  ! 116: STBAR	stbar
	.word 0xe66aa738  ! 117: LDSTUB_I	ldstub	%r19, [%r10 + 0x0738]
	.word 0xc36a800b  ! 118: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0xcaa2900b  ! 119: STWA_R	stwa	%r5, [%r10 + %r11] 0x80
	.word 0x8fda800b  ! 120: FLUSH_R	dis not found

	.word 0xc722800b  ! 122: STF_R	st	%f3, [%r11, %r10]
	.word 0x905aae40  ! 123: SMUL_I	smul 	%r10, 0x0e40, %r8
	.word 0xc80a800b  ! 124: LDUB_R	ldub	[%r10 + %r11], %r4
	.word 0xc412af70  ! 126: LDUH_I	lduh	[%r10 + 0x0f70], %r2
	.word 0xd242ae5c  ! 128: LDSW_I	ldsw	[%r10 + 0x0e5c], %r9
	.word 0xc66a800b  ! 129: LDSTUB_R	ldstub	%r3, [%r10 + %r11]
	.word 0x8143e065  ! 130: MEMBAR	membar	#LoadLoad | #LoadStore | #MemIssue | #Sync 
	.word 0xc60aa6d4  ! 131: LDUB_I	ldub	[%r10 + 0x06d4], %r3
	.word 0xce12adf0  ! 132: LDUH_I	lduh	[%r10 + 0x0df0], %r7
	.word 0x82f2800b  ! 133: UDIVcc_R	udivcc 	%r10, %r11, %r1
	.word 0xb072a058  ! 134: UDIV_I	udiv 	%r10, 0x0058, %r24
	.word 0xcab2900b  ! 135: STHA_R	stha	%r5, [%r10 + %r11] 0x80
	.word 0xc652800b  ! 136: LDSH_R	ldsh	[%r10 + %r11], %r3
	.word 0x8143e00a  ! 137: MEMBAR	membar	#StoreLoad | #StoreStore 
	.word 0xc3ea900b  ! 138: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0xc2caa92c  ! 139: LDSBA_I	ldsba	[%r10, + 0x092c] %asi, %r1
	.word 0x38800003  ! 141: BGU	bgu,a	<label_0x3>
	.word 0xc852800b  ! 142: LDSH_R	ldsh	[%r10 + %r11], %r4
	.word 0x8eda800b  ! 143: SMULcc_R	smulcc 	%r10, %r11, %r7
	.word 0xd28a900b  ! 144: LDUBA_R	lduba	[%r10, %r11] 0x80, %r9
	.word 0xc282a2a8  ! 145: LDUWA_I	lduwa	[%r10, + 0x02a8] %asi, %r1
	.word 0x8143c000  ! 146: STBAR	stbar
	.word 0xeefa900b  ! 147: SWAPA_R	swapa	%r23, [%r10 + %r11] 0x80
	.word 0xc33aa2a8  ! 148: STDF_I	std	%f1, [0x02a8, %r10]
	.word 0x0a800001  ! 149: BCS	bcs  	<label_0x1>
	.word 0xc922a4d8  ! 150: STF_I	st	%f4, [0x04d8, %r10]
	.word 0xc3eaa668  ! 151: PREFETCHA_I	prefetcha	[%r10, + 0x0668] %asi, #one_read
	.word 0x8143e036  ! 152: MEMBAR	membar	#StoreLoad | #LoadStore | #Lookaside | #MemIssue 
	.word 0x8143c000  ! 153: STBAR	stbar
	.word 0xc2b2aa2c  ! 154: STHA_I	stha	%r1, [%r10 + 0x0a2c] %asi
	.word 0x8143e05b  ! 155: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Lookaside | #Sync 
	.word 0xc892900b  ! 156: LDUHA_R	lduha	[%r10, %r11] 0x80, %r4
	.word 0xd0ba900b  ! 157: STDA_R	stda	%r8, [%r10 + %r11] 0x80
	.word 0xd2c2ab7c  ! 158: LDSWA_I	ldswa	[%r10, + 0x0b7c] %asi, %r9
	.word 0x2a800001  ! 159: BCS	bcs,a	<label_0x1>
	.word 0x8ddaa3c4  ! 160: FLUSH_I	dis not found

	.word 0xc852a0cc  ! 161: LDSH_I	ldsh	[%r10 + 0x00cc], %r4
	.word 0xcb22800b  ! 162: STF_R	st	%f5, [%r11, %r10]
	.word 0xc892a9f4  ! 163: LDUHA_I	lduha	[%r10, + 0x09f4] %asi, %r4
	.word 0x89daa904  ! 164: FLUSH_I	dis not found

	.word 0x824aa474  ! 165: MULX_I	mulx 	%r10, 0x0474, %r1
	.word 0x1a800001  ! 166: BCC	bcc  	<label_0x1>
	.word 0xca4aa9e4  ! 167: LDSB_I	ldsb	[%r10 + 0x09e4], %r5
	.word 0xae7aab78  ! 168: SDIV_I	sdiv 	%r10, 0x0b78, %r23
	.word 0x8143c000  ! 169: STBAR	stbar
	.word 0x8143c000  ! 170: STBAR	stbar
	.word 0xb852a06c  ! 171: UMUL_I	umul 	%r10, 0x006c, %r28
	.word 0xc3eaa81c  ! 172: PREFETCHA_I	prefetcha	[%r10, + 0x081c] %asi, #one_read
	.word 0xe60aa58c  ! 173: LDUB_I	ldub	[%r10 + 0x058c], %r19
	.word 0xc6a2900b  ! 174: STWA_R	stwa	%r3, [%r10 + %r11] 0x80
	.word 0xb5a289ab  ! 175: FDIVs	fdivs	%f10, %f11, %f26
	.word 0xd0f2aaa8  ! 176: STXA_I	stxa	%r8, [%r10 + 0x0aa8] %asi
	.word 0x8322a250  ! 177: MULScc_I	mulscc 	%r10, 0x0250, %r1
	.word 0x8143c000  ! 178: STBAR	stbar
	.word 0xd2fa900b  ! 179: SWAPA_R	swapa	%r9, [%r10 + %r11] 0x80
	.word 0xe4baa5b0  ! 180: STDA_I	stda	%r18, [%r10 + 0x05b0] %asi
	.word 0x0a800001  ! 181: BCS	bcs  	<label_0x1>
	.word 0xd0fa900b  ! 182: SWAPA_R	swapa	%r8, [%r10 + %r11] 0x80
	.word 0x8143c000  ! 183: STBAR	stbar
	.word 0xcff2a00b  ! 184: CASXA_R	casxa	[%r10]%asi, %r11, %r7
	.word 0x8143e019  ! 185: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside 
	.word 0xfe02af84  ! 186: LDUW_I	lduw	[%r10 + 0x0f84], %r31
	.word 0xd3f2900b  ! 187: CASXA_I	casxa	[%r10] 0x80, %r11, %r9
	.word 0x85a289ab  ! 188: FDIVs	fdivs	%f10, %f11, %f2
	.word 0x10800001  ! 189: BA	ba  	<label_0x1>
	.word 0xc36aa48c  ! 190: PREFETCH_I	prefetch	[%r10 + 0x048c], #one_read
	.word 0x02800001  ! 191: BE	be  	<label_0x1>
	.word 0xf84a800b  ! 192: LDSB_R	ldsb	[%r10 + %r11], %r28
	.word 0xe09aade8  ! 193: LDDA_I	ldda	[%r10, + 0x0de8] %asi, %r16
	.word 0x85da800b  ! 194: FLUSH_R	dis not found

	.word 0x84d2800b  ! 195: UMULcc_R	umulcc 	%r10, %r11, %r2
	.word 0x8fda800b  ! 196: FLUSH_R	dis not found

	.word 0xbfa288ab  ! 197: FSUBs	fsubs	%f10, %f11, %f31
	.word 0xceaaa5a4  ! 198: STBA_I	stba	%r7, [%r10 + 0x05a4] %asi
	.word 0x1e800003  ! 199: BVC	bvc  	<label_0x3>
	.word 0x8143e02a  ! 200: MEMBAR	membar	#StoreLoad | #StoreStore | #MemIssue 
	.word 0xaba289ab  ! 201: FDIVs	fdivs	%f10, %f11, %f21
	.word 0xcc1aa358  ! 202: LDD_I	ldd	[%r10 + 0x0358], %r6
	.word 0xcd3aab50  ! 203: STDF_I	std	%f6, [0x0b50, %r10]
	.word 0xc36a800b  ! 204: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0xfca2900b  ! 206: STWA_R	stwa	%r30, [%r10 + %r11] 0x80
	.word 0xc4f2a940  ! 207: STXA_I	stxa	%r2, [%r10 + 0x0940] %asi
	.word 0x85a2892b  ! 208: FMULs	fmuls	%f10, %f11, %f2
	.word 0x8ad2800b  ! 209: UMULcc_R	umulcc 	%r10, %r11, %r5
	.word 0xc28a900b  ! 210: LDUBA_R	lduba	[%r10, %r11] 0x80, %r1
	.word 0x8143e07c  ! 211: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xe1e2a00b  ! 212: CASA_R	casa	[%r10] %asi, %r11, %r16
	.word 0x844a800b  ! 213: MULX_R	mulx 	%r10, %r11, %r2
	.word 0x8143c000  ! 214: STBAR	stbar
	.word 0xee82900b  ! 215: LDUWA_R	lduwa	[%r10, %r11] 0x80, %r23
	.word 0x99daaa18  ! 216: FLUSH_I	dis not found

	.word 0xca82ad3c  ! 217: LDUWA_I	lduwa	[%r10, + 0x0d3c] %asi, %r5
	.word 0xa272800b  ! 218: UDIV_R	udiv 	%r10, %r11, %r17
	.word 0xbed2800b  ! 219: UMULcc_R	umulcc 	%r10, %r11, %r31
	.word 0xa1daad4c  ! 220: FLUSH_I	dis not found

	.word 0xce0a800b  ! 221: LDUB_R	ldub	[%r10 + %r11], %r7
	.word 0xc20aa0b4  ! 222: LDUB_I	ldub	[%r10 + 0x00b4], %r1
	.word 0xbcfaa7b0  ! 223: SDIVcc_I	sdivcc 	%r10, 0x07b0, %r30
	.word 0xd2a2a1a4  ! 224: STWA_I	stwa	%r9, [%r10 + 0x01a4] %asi
	.word 0xc3eaa2f4  ! 225: PREFETCHA_I	prefetcha	[%r10, + 0x02f4] %asi, #one_read
	.word 0xc4b2900b  ! 226: STHA_R	stha	%r2, [%r10 + %r11] 0x80
	.word 0x26c20001  ! 227: BRLZ	brlz,a,nt	%8,<label_0x20001>
	.word 0xca12800b  ! 228: LDUH_R	lduh	[%r10 + %r11], %r5
	.word 0x8143e046  ! 229: MEMBAR	membar	#StoreLoad | #LoadStore | #Sync 
	.word 0xc24aa7ac  ! 230: LDSB_I	ldsb	[%r10 + 0x07ac], %r1
	.word 0xd13a800b  ! 231: STDF_R	std	%f8, [%r11, %r10]
	.word 0xe80aaebc  ! 232: LDUB_I	ldub	[%r10 + 0x0ebc], %r20
	.word 0x8143e060  ! 233: MEMBAR	membar	#MemIssue | #Sync 
	.word 0xf602800b  ! 234: LDUW_R	lduw	[%r10 + %r11], %r27
	.word 0xf01a800b  ! 235: LDD_R	ldd	[%r10 + %r11], %r24
	.word 0xae6aa980  ! 236: UDIVX_I	udivx 	%r10, 0x0980, %r23
	.word 0x91da800b  ! 237: FLUSH_R	dis not found

	.word 0xc6d2a710  ! 238: LDSHA_I	ldsha	[%r10, + 0x0710] %asi, %r3
	.word 0x87daa49c  ! 239: FLUSH_I	dis not found

	.word 0xc6ca900b  ! 240: LDSBA_R	ldsba	[%r10, %r11] 0x80, %r3
	.word 0x8143e05b  ! 241: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Lookaside | #Sync 
	.word 0xc36a800b  ! 242: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0xd81aa200  ! 243: LDD_I	ldd	[%r10 + 0x0200], %r12
	.word 0xc24aa780  ! 244: LDSB_I	ldsb	[%r10 + 0x0780], %r1
	.word 0xc7f2a00b  ! 245: CASXA_R	casxa	[%r10]%asi, %r11, %r3
	.word 0x8722a434  ! 246: MULScc_I	mulscc 	%r10, 0x0434, %r3
	.word 0x8143e038  ! 248: MEMBAR	membar	#StoreStore | #Lookaside | #MemIssue 
	.word 0xfa0aabd4  ! 250: LDUB_I	ldub	[%r10 + 0x0bd4], %r29
	.word 0x24800001  ! 251: BLE	ble,a	<label_0x1>
	.word 0xca92a524  ! 252: LDUHA_I	lduha	[%r10, + 0x0524] %asi, %r5
	.word 0x04800001  ! 253: BLE	ble  	<label_0x1>
	.word 0xfec2a710  ! 254: LDSWA_I	ldswa	[%r10, + 0x0710] %asi, %r31
	.word 0xa322a8c8  ! 255: MULScc_I	mulscc 	%r10, 0x08c8, %r17
	.word 0x8143e02a  ! 256: MEMBAR	membar	#StoreLoad | #StoreStore | #MemIssue 
	.word 0x8143c000  ! 257: STBAR	stbar
	.word 0xf1f2a00b  ! 258: CASXA_R	casxa	[%r10]%asi, %r11, %r24
	.word 0xfed2ac80  ! 259: LDSHA_I	ldsha	[%r10, + 0x0c80] %asi, %r31
	.word 0xceea900b  ! 260: LDSTUBA_R	ldstuba	%r7, [%r10 + %r11] 0x80
	.word 0x18800001  ! 261: BGU	bgu  	<label_0x1>
	.word 0xc2fa900b  ! 262: SWAPA_R	swapa	%r1, [%r10 + %r11] 0x80
	.word 0xc2eaab94  ! 263: LDSTUBA_I	ldstuba	%r1, [%r10 + 0x0b94] %asi
	.word 0xe0ba900b  ! 264: STDA_R	stda	%r16, [%r10 + %r11] 0x80
	.word 0xc36a800b  ! 265: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0xc812ad68  ! 266: LDUH_I	lduh	[%r10 + 0x0d68], %r4
	.word 0xcc4aa450  ! 267: LDSB_I	ldsb	[%r10 + 0x0450], %r6
	.word 0x8143c000  ! 268: STBAR	stbar
	.word 0xc81aa870  ! 269: LDD_I	ldd	[%r10 + 0x0870], %r4
	.word 0x8bda800b  ! 270: FLUSH_R	dis not found

	.word 0x8143c000  ! 271: STBAR	stbar
	.word 0x9a52800b  ! 272: UMUL_R	umul 	%r10, %r11, %r13
	.word 0xe26a800b  ! 273: LDSTUB_R	ldstub	%r17, [%r10 + %r11]
	.word 0xdcaaac94  ! 274: STBA_I	stba	%r14, [%r10 + 0x0c94] %asi
	.word 0xd27aa3ac  ! 275: SWAP_I	swap	%r9, [%r10 + 0x03ac]
	.word 0x06c20001  ! 276: BRLZ	brlz  ,nt	%8,<label_0x20001>
	.word 0xaad2800b  ! 277: UMULcc_R	umulcc 	%r10, %r11, %r21
	.word 0xc3eaaaa0  ! 278: PREFETCHA_I	prefetcha	[%r10, + 0x0aa0] %asi, #one_read
	.word 0x8e7aa08c  ! 279: SDIV_I	sdiv 	%r10, 0x008c, %r7
	.word 0x8143c000  ! 280: STBAR	stbar
	.word 0x8143e076  ! 281: MEMBAR	membar	#StoreLoad | #LoadStore | #Lookaside | #MemIssue | #Sync 
	.word 0x8143e012  ! 282: MEMBAR	membar	#StoreLoad | #Lookaside 
	.word 0xca12ac48  ! 283: LDUH_I	lduh	[%r10 + 0x0c48], %r5
	.word 0x2ec20001  ! 284: BRGEZ	brgez,a,nt	%8,<label_0x20001>
	.word 0x8e72800b  ! 285: UDIV_R	udiv 	%r10, %r11, %r7
	.word 0xabdaae64  ! 286: FLUSH_I	dis not found

	.word 0xa25a800b  ! 287: SMUL_R	smul 	%r10, %r11, %r17
	.word 0x907a800b  ! 288: SDIV_R	sdiv 	%r10, %r11, %r8
	.word 0xee42800b  ! 289: LDSW_R	ldsw	[%r10 + %r11], %r23
	.word 0xc6aaae9c  ! 290: STBA_I	stba	%r3, [%r10 + 0x0e9c] %asi
	.word 0xd0d2900b  ! 291: LDSHA_R	ldsha	[%r10, %r11] 0x80, %r8
	.word 0x40000001  ! 292: CALL	call	disp30_1
	.word 0xf86a800b  ! 293: LDSTUB_R	ldstub	%r28, [%r10 + %r11]
	.word 0xc09a900b  ! 294: LDDA_R	ldda	[%r10, %r11] 0x80, %r0
	.word 0x8143c000  ! 295: STBAR	stbar
	.word 0xacfaa97c  ! 296: SDIVcc_I	sdivcc 	%r10, 0x097c, %r22
	.word 0x8143c000  ! 297: STBAR	stbar
	.word 0x86da800b  ! 298: SMULcc_R	smulcc 	%r10, %r11, %r3
	.word 0xc452800b  ! 299: LDSH_R	ldsh	[%r10 + %r11], %r2
	.word 0xcaf2900b  ! 300: STXA_R	stxa	%r5, [%r10 + %r11] 0x80
	.word 0xc89a900b  ! 301: LDDA_R	ldda	[%r10, %r11] 0x80, %r4
	.word 0xce6aa610  ! 302: LDSTUB_I	ldstub	%r7, [%r10 + 0x0610]
	.word 0xd3e2a00b  ! 303: CASA_R	casa	[%r10] %asi, %r11, %r9
	.word 0x83da800b  ! 304: FLUSH_R	dis not found

	.word 0x8fda800b  ! 305: FLUSH_R	dis not found

	.word 0xc3eaaabc  ! 306: PREFETCHA_I	prefetcha	[%r10, + 0x0abc] %asi, #one_read
	.word 0x02c20001  ! 307: BRZ	brz  ,nt	%8,<label_0x20001>
	.word 0xc49a900b  ! 308: LDDA_R	ldda	[%r10, %r11] 0x80, %r2
	.word 0x85daaf68  ! 309: FLUSH_I	dis not found

	.word 0x8143e072  ! 310: MEMBAR	membar	#StoreLoad | #Lookaside | #MemIssue | #Sync 
	.word 0xaa4aa5f8  ! 312: MULX_I	mulx 	%r10, 0x05f8, %r21
	.word 0x865aa8f0  ! 313: SMUL_I	smul 	%r10, 0x08f0, %r3
	.word 0xc2b2aa14  ! 314: STHA_I	stha	%r1, [%r10 + 0x0a14] %asi
	.word 0xd26aa4f0  ! 315: LDSTUB_I	ldstub	%r9, [%r10 + 0x04f0]
	.word 0xf4baa3e0  ! 316: STDA_I	stda	%r26, [%r10 + 0x03e0] %asi
	.word 0x8143c000  ! 317: STBAR	stbar
	.word 0xed22a3b8  ! 318: STF_I	st	%f22, [0x03b8, %r10]
	.word 0x40000001  ! 319: CALL	call	disp30_1
	.word 0xb2f2800b  ! 320: UDIVcc_R	udivcc 	%r10, %r11, %r25
	.word 0x40000001  ! 321: CALL	call	disp30_1
	.word 0x92d2aa8c  ! 322: UMULcc_I	umulcc 	%r10, 0x0a8c, %r9
	.word 0x8cda800b  ! 323: SMULcc_R	smulcc 	%r10, %r11, %r6
	.word 0xbbdaa900  ! 324: FLUSH_I	dis not found

	.word 0xa36aa568  ! 325: SDIVX_I	sdivx	%r10, 0x0568, %r17
	.word 0xc36a800b  ! 326: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x8143c000  ! 327: STBAR	stbar
	.word 0x8143c000  ! 328: STBAR	stbar
	.word 0xde82900b  ! 329: LDUWA_R	lduwa	[%r10, %r11] 0x80, %r15
	.word 0xd8aa900b  ! 330: STBA_R	stba	%r12, [%r10 + %r11] 0x80
	.word 0xceea900b  ! 331: LDSTUBA_R	ldstuba	%r7, [%r10 + %r11] 0x80
	.word 0x04800003  ! 332: BLE	ble  	<label_0x3>
	.word 0x836aa9b0  ! 333: SDIVX_I	sdivx	%r10, 0x09b0, %r1
	.word 0x2aca0003  ! 334: BRNZ	brnz,a,pt	%8,<label_0xa0003>
	.word 0xd2ea900b  ! 335: LDSTUBA_R	ldstuba	%r9, [%r10 + %r11] 0x80
	.word 0xc66aac44  ! 336: LDSTUB_I	ldstub	%r3, [%r10 + 0x0c44]
	.word 0x8e7aa938  ! 337: SDIV_I	sdiv 	%r10, 0x0938, %r7
	.word 0x8143e00c  ! 338: MEMBAR	membar	#LoadStore | #StoreStore 
	.word 0xd0c2a520  ! 339: LDSWA_I	ldswa	[%r10, + 0x0520] %asi, %r8
	.word 0x0e800001  ! 340: BVS	bvs  	<label_0x1>
	.word 0xd2c2afb8  ! 341: LDSWA_I	ldswa	[%r10, + 0x0fb8] %asi, %r9
	.word 0x91a2892b  ! 342: FMULs	fmuls	%f10, %f11, %f8
	.word 0xd0b2ae44  ! 343: STHA_I	stha	%r8, [%r10 + 0x0e44] %asi
	.word 0x8143e059  ! 344: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside | #Sync 
	.word 0xc6d2900b  ! 345: LDSHA_R	ldsha	[%r10, %r11] 0x80, %r3
	.word 0x87a2892b  ! 346: FMULs	fmuls	%f10, %f11, %f3
	.word 0x89da800b  ! 347: FLUSH_R	dis not found

	.word 0x2c800003  ! 348: BNEG	bneg,a	<label_0x3>
	.word 0xec42ac5c  ! 349: LDSW_I	ldsw	[%r10 + 0x0c5c], %r22
	.word 0x20800001  ! 350: BN	bn,a	<label_0x1>
	.word 0x9322af94  ! 351: MULScc_I	mulscc 	%r10, 0x0f94, %r9
	.word 0xa0f2800b  ! 352: UDIVcc_R	udivcc 	%r10, %r11, %r16
	.word 0xc36aadbc  ! 353: PREFETCH_I	prefetch	[%r10 + 0x0dbc], #one_read
	.word 0xc4f2900b  ! 354: STXA_R	stxa	%r2, [%r10 + %r11] 0x80
	.word 0x3e800003  ! 355: BVC	bvc,a	<label_0x3>
	.word 0xccc2a44c  ! 356: LDSWA_I	ldswa	[%r10, + 0x044c] %asi, %r6
	.word 0xb9a2892b  ! 358: FMULs	fmuls	%f10, %f11, %f28
	.word 0x22c20003  ! 359: BRZ	brz,a,nt	%8,<label_0x20003>
	.word 0x0cc20001  ! 360: BRGZ	brgz  ,nt	%8,<label_0x20001>
	.word 0x93da800b  ! 361: FLUSH_R	dis not found

	.word 0xceeaa9f4  ! 362: LDSTUBA_I	ldstuba	%r7, [%r10 + 0x09f4] %asi
	.word 0xc93aaf68  ! 363: STDF_I	std	%f4, [0x0f68, %r10]
	.word 0xb44aaa00  ! 364: MULX_I	mulx 	%r10, 0x0a00, %r26
	.word 0xd01aafc0  ! 365: LDD_I	ldd	[%r10 + 0x0fc0], %r8
	.word 0xc46a800b  ! 366: LDSTUB_R	ldstub	%r2, [%r10 + %r11]
	.word 0xcc52a05c  ! 367: LDSH_I	ldsh	[%r10 + 0x005c], %r6
	.word 0x8143c000  ! 368: STBAR	stbar
	.word 0xcf22a030  ! 369: STF_I	st	%f7, [0x0030, %r10]
	.word 0xc36aa904  ! 370: PREFETCH_I	prefetch	[%r10 + 0x0904], #one_read
	.word 0x1c800001  ! 371: BPOS	bpos  	<label_0x1>
	.word 0x24ca0001  ! 372: BRLEZ	brlez,a,pt	%8,<label_0xa0001>
	.word 0xd01a800b  ! 373: LDD_R	ldd	[%r10 + %r11], %r8
	.word 0xccb2a648  ! 374: STHA_I	stha	%r6, [%r10 + 0x0648] %asi
	.word 0xcd3a800b  ! 375: STDF_R	std	%f6, [%r11, %r10]
	.word 0x8472800b  ! 376: UDIV_R	udiv 	%r10, %r11, %r2
	.word 0x8143e02a  ! 377: MEMBAR	membar	#StoreLoad | #StoreStore | #MemIssue 
	.word 0xd01aa418  ! 378: LDD_I	ldd	[%r10 + 0x0418], %r8
	.word 0xeec2a1b8  ! 379: LDSWA_I	ldswa	[%r10, + 0x01b8] %asi, %r23
	.word 0x8143e02f  ! 380: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #MemIssue 
	.word 0x2c800003  ! 381: BNEG	bneg,a	<label_0x3>
	.word 0xcd3aa1f0  ! 382: STDF_I	std	%f6, [0x01f0, %r10]
	.word 0xcad2900b  ! 383: LDSHA_R	ldsha	[%r10, %r11] 0x80, %r5
	.word 0xcc0a800b  ! 384: LDUB_R	ldub	[%r10 + %r11], %r6
	.word 0x8af2ad18  ! 385: UDIVcc_I	udivcc 	%r10, 0x0d18, %r5
	.word 0xc36aaa40  ! 386: PREFETCH_I	prefetch	[%r10 + 0x0a40], #one_read
	.word 0x2e800003  ! 387: BVS	bvs,a	<label_0x3>
	.word 0x8143e02c  ! 388: MEMBAR	membar	#LoadStore | #StoreStore | #MemIssue 
	.word 0xd3f2a00b  ! 389: CASXA_R	casxa	[%r10]%asi, %r11, %r9
	.word 0x91daabf8  ! 390: FLUSH_I	dis not found

	.word 0x896a800b  ! 391: SDIVX_R	sdivx	%r10, %r11, %r4
	.word 0x924a800b  ! 392: MULX_R	mulx 	%r10, %r11, %r9
	.word 0xb652800b  ! 393: UMUL_R	umul 	%r10, %r11, %r27
	.word 0xcdf2900b  ! 394: CASXA_I	casxa	[%r10] 0x80, %r11, %r6
	.word 0x8fda800b  ! 395: FLUSH_R	dis not found

	.word 0xd322ab54  ! 396: STF_I	st	%f9, [0x0b54, %r10]
	.word 0xbfdaa638  ! 397: FLUSH_I	dis not found

	.word 0x8143c000  ! 398: STBAR	stbar
	.word 0xccbaa670  ! 399: STDA_I	stda	%r6, [%r10 + 0x0670] %asi
	.word 0x8143c000  ! 400: STBAR	stbar
	.word 0xb1da800b  ! 401: FLUSH_R	dis not found

	.word 0x26c20001  ! 402: BRLZ	brlz,a,nt	%8,<label_0x20001>
	.word 0x9072acf4  ! 403: UDIV_I	udiv 	%r10, 0x0cf4, %r8
	.word 0xe41a800b  ! 404: LDD_R	ldd	[%r10 + %r11], %r18
	.word 0xc36aaa7c  ! 405: PREFETCH_I	prefetch	[%r10 + 0x0a7c], #one_read
	.word 0x1c800001  ! 406: BPOS	bpos  	<label_0x1>
	.word 0x836a800b  ! 407: SDIVX_R	sdivx	%r10, %r11, %r1
	.word 0x8f6aaaa4  ! 408: SDIVX_I	sdivx	%r10, 0x0aa4, %r7
	.word 0x87a289ab  ! 409: FDIVs	fdivs	%f10, %f11, %f3
	.word 0xa9a2892b  ! 410: FMULs	fmuls	%f10, %f11, %f20
	.word 0x8143c000  ! 412: STBAR	stbar
	.word 0xc65aa228  ! 413: LDX_I	ldx	[%r10 + 0x0228], %r3
	.word 0xc41a800b  ! 414: LDD_R	ldd	[%r10 + %r11], %r2
	.word 0xdcda900b  ! 415: LDXA_R	ldxa	[%r10, %r11] 0x80, %r14
	.word 0xb722ab30  ! 417: MULScc_I	mulscc 	%r10, 0x0b30, %r27
	.word 0xcc12a88c  ! 418: LDUH_I	lduh	[%r10 + 0x088c], %r6
	.word 0xc602800b  ! 419: LDUW_R	lduw	[%r10 + %r11], %r3
	.word 0xf8eaa5a8  ! 420: LDSTUBA_I	ldstuba	%r28, [%r10 + 0x05a8] %asi
	.word 0x1c800001  ! 421: BPOS	bpos  	<label_0x1>
	.word 0xbbdaac9c  ! 422: FLUSH_I	dis not found

	.word 0xcc42a030  ! 423: LDSW_I	ldsw	[%r10 + 0x0030], %r6
	.word 0xcb3aa108  ! 424: STDF_I	std	%f5, [0x0108, %r10]
	.word 0x8f22800b  ! 425: MULScc_R	mulscc 	%r10, %r11, %r7
	.word 0x925aa414  ! 426: SMUL_I	smul 	%r10, 0x0414, %r9
	.word 0xa4d2a58c  ! 427: UMULcc_I	umulcc 	%r10, 0x058c, %r18
	.word 0x8143e04d  ! 428: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Sync 
	.word 0x89daa958  ! 429: FLUSH_I	dis not found

	.word 0xe06aaac8  ! 430: LDSTUB_I	ldstub	%r16, [%r10 + 0x0ac8]
	.word 0xd2d2a4cc  ! 431: LDSHA_I	ldsha	[%r10, + 0x04cc] %asi, %r9
	.word 0xc86aa158  ! 432: LDSTUB_I	ldstub	%r4, [%r10 + 0x0158]
	.word 0xd0b2900b  ! 433: STHA_R	stha	%r8, [%r10 + %r11] 0x80
	.word 0xc3e2900b  ! 434: CASA_I	casa	[%r10] 0x80, %r11, %r1
	.word 0xba7a800b  ! 435: SDIV_R	sdiv 	%r10, %r11, %r29
	.word 0xbfda800b  ! 436: FLUSH_R	dis not found

	.word 0x1e800001  ! 437: BVC	bvc  	<label_0x1>
	.word 0x907a800b  ! 438: SDIV_R	sdiv 	%r10, %r11, %r8
	.word 0x906a800b  ! 439: UDIVX_R	udivx 	%r10, %r11, %r8
	.word 0x9a52800b  ! 440: UMUL_R	umul 	%r10, %r11, %r13
	.word 0x83da800b  ! 441: FLUSH_R	dis not found

	.word 0x8652a6c4  ! 442: UMUL_I	umul 	%r10, 0x06c4, %r3
	.word 0x8d6aa770  ! 443: SDIVX_I	sdivx	%r10, 0x0770, %r6
	.word 0xc3ea900b  ! 444: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0xc282a8f8  ! 445: LDUWA_I	lduwa	[%r10, + 0x08f8] %asi, %r1
	.word 0x83da800b  ! 446: FLUSH_R	dis not found

	.word 0x9ef2a200  ! 448: UDIVcc_I	udivcc 	%r10, 0x0200, %r15
	.word 0x8143c000  ! 449: STBAR	stbar
	.word 0x85da800b  ! 450: FLUSH_R	dis not found

	.word 0xc722800b  ! 451: STF_R	st	%f3, [%r11, %r10]
	.word 0xb9daa9fc  ! 452: FLUSH_I	dis not found

	.word 0xbc5aac74  ! 453: SMUL_I	smul 	%r10, 0x0c74, %r30
	.word 0x8143e001  ! 454: MEMBAR	membar	#LoadLoad 
	.word 0xc292900b  ! 457: LDUHA_R	lduha	[%r10, %r11] 0x80, %r1
	.word 0xd212800b  ! 458: LDUH_R	lduh	[%r10 + %r11], %r9
	.word 0xd2aaa3ec  ! 459: STBA_I	stba	%r9, [%r10 + 0x03ec] %asi
	.word 0x8ddaa2bc  ! 460: FLUSH_I	dis not found

	.word 0xca82a1a0  ! 461: LDUWA_I	lduwa	[%r10, + 0x01a0] %asi, %r5
	.word 0xce02800b  ! 462: LDUW_R	lduw	[%r10 + %r11], %r7
	.word 0x26ca0001  ! 463: BRLZ	brlz,a,pt	%8,<label_0xa0001>
	.word 0xc36aa450  ! 464: PREFETCH_I	prefetch	[%r10 + 0x0450], #one_read
	.word 0xf0ca900b  ! 465: LDSBA_R	ldsba	[%r10, %r11] 0x80, %r24
	.word 0x8143c000  ! 466: STBAR	stbar
	.word 0x0a800001  ! 467: BCS	bcs  	<label_0x1>
	.word 0xae5aad24  ! 468: SMUL_I	smul 	%r10, 0x0d24, %r23
	.word 0xfdf2a00b  ! 469: CASXA_R	casxa	[%r10]%asi, %r11, %r30
	.word 0x8c72800b  ! 471: UDIV_R	udiv 	%r10, %r11, %r6
	.word 0xf0f2ac58  ! 473: STXA_I	stxa	%r24, [%r10 + 0x0c58] %asi
	.word 0xd2aaa150  ! 474: STBA_I	stba	%r9, [%r10 + 0x0150] %asi
	.word 0x9c6a800b  ! 475: UDIVX_R	udivx 	%r10, %r11, %r14
	.word 0xbba2892b  ! 476: FMULs	fmuls	%f10, %f11, %f29
	.word 0xf2faa84c  ! 477: SWAPA_I	swapa	%r25, [%r10 + 0x084c] %asi
	.word 0xcc7a800b  ! 478: SWAP_R	swap	%r6, [%r10 + %r11]
	.word 0xe05aa6a0  ! 479: LDX_I	ldx	[%r10 + 0x06a0], %r16
	.word 0xc3eaa8ec  ! 480: PREFETCHA_I	prefetcha	[%r10, + 0x08ec] %asi, #one_read
	.word 0x8143c000  ! 481: STBAR	stbar
	.word 0xcd3aa748  ! 482: STDF_I	std	%f6, [0x0748, %r10]
	.word 0x8143c000  ! 483: STBAR	stbar
	.word 0xf2da900b  ! 484: LDXA_R	ldxa	[%r10, %r11] 0x80, %r25
	.word 0x8143e011  ! 485: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x8fda800b  ! 486: FLUSH_R	dis not found

	.word 0xf0b2900b  ! 487: STHA_R	stha	%r24, [%r10 + %r11] 0x80
	.word 0xea8a900b  ! 488: LDUBA_R	lduba	[%r10, %r11] 0x80, %r21
	.word 0x907aa24c  ! 489: SDIV_I	sdiv 	%r10, 0x024c, %r8
	.word 0xcfe2a00b  ! 490: CASA_R	casa	[%r10] %asi, %r11, %r7
	.word 0x846aa880  ! 491: UDIVX_I	udivx 	%r10, 0x0880, %r2
	.word 0x8143c000  ! 492: STBAR	stbar
	.word 0x8dda800b  ! 493: FLUSH_R	dis not found

	.word 0xcf22800b  ! 494: STF_R	st	%f7, [%r11, %r10]
	.word 0xe9e2a00b  ! 495: CASA_R	casa	[%r10] %asi, %r11, %r20
	.word 0xcacaa0b8  ! 496: LDSBA_I	ldsba	[%r10, + 0x00b8] %asi, %r5
	.word 0x24800001  ! 497: BLE	ble,a	<label_0x1>
	.word 0xc5f2900b  ! 498: CASXA_I	casxa	[%r10] 0x80, %r11, %r2
	.word 0xc36a800b  ! 499: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0xc4daa380  ! 500: LDXA_I	ldxa	[%r10, + 0x0380] %asi, %r2
	.word 0xc8f2a070  ! 501: STXA_I	stxa	%r4, [%r10 + 0x0070] %asi
	.word 0xc41a800b  ! 502: LDD_R	ldd	[%r10 + %r11], %r2
	.word 0x924aa5fc  ! 503: MULX_I	mulx 	%r10, 0x05fc, %r9
	.word 0x30800003  ! 504: BA	ba,a	<label_0x3>
	.word 0xdaf2abb0  ! 505: STXA_I	stxa	%r13, [%r10 + 0x0bb0] %asi
	.word 0xd09aa3f8  ! 506: LDDA_I	ldda	[%r10, + 0x03f8] %asi, %r8
	.word 0xc5f2900b  ! 507: CASXA_I	casxa	[%r10] 0x80, %r11, %r2
	.word 0xc2ca900b  ! 508: LDSBA_R	ldsba	[%r10, %r11] 0x80, %r1
	.word 0x83da800b  ! 509: FLUSH_R	dis not found

	.word 0xeeaa900b  ! 510: STBA_R	stba	%r23, [%r10 + %r11] 0x80
	.word 0x88faac64  ! 511: SDIVcc_I	sdivcc 	%r10, 0x0c64, %r4
	.word 0x8fdaa00c  ! 512: FLUSH_I	dis not found

	.word 0xc36aa784  ! 513: PREFETCH_I	prefetch	[%r10 + 0x0784], #one_read
	.word 0xc68aa980  ! 514: LDUBA_I	lduba	[%r10, + 0x0980] %asi, %r3
	.word 0xc86a800b  ! 515: LDSTUB_R	ldstub	%r4, [%r10 + %r11]
	.word 0xd0faa694  ! 516: SWAPA_I	swapa	%r8, [%r10 + 0x0694] %asi
	.word 0x8dda800b  ! 517: FLUSH_R	dis not found

	.word 0xd042800b  ! 518: LDSW_R	ldsw	[%r10 + %r11], %r8
	.word 0x8cfa800b  ! 519: SDIVcc_R	sdivcc 	%r10, %r11, %r6
	.word 0x06800001  ! 520: BL	bl  	<label_0x1>
	.word 0xe292abcc  ! 521: LDUHA_I	lduha	[%r10, + 0x0bcc] %asi, %r17
	.word 0x8f22a044  ! 523: MULScc_I	mulscc 	%r10, 0x0044, %r7
	.word 0xe13a800b  ! 525: STDF_R	std	%f16, [%r11, %r10]
	.word 0xda42800b  ! 526: LDSW_R	ldsw	[%r10 + %r11], %r13
	.word 0x9e6aa10c  ! 527: UDIVX_I	udivx 	%r10, 0x010c, %r15
	.word 0xc36a800b  ! 528: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x905aa074  ! 529: SMUL_I	smul 	%r10, 0x0074, %r8
	.word 0xc8b2900b  ! 530: STHA_R	stha	%r4, [%r10 + %r11] 0x80
	.word 0x87a288ab  ! 531: FSUBs	fsubs	%f10, %f11, %f3
	.word 0x85da800b  ! 532: FLUSH_R	dis not found

	.word 0xea12800b  ! 533: LDUH_R	lduh	[%r10 + %r11], %r21
	.word 0x8143c000  ! 534: STBAR	stbar
	.word 0xd0ba900b  ! 536: STDA_R	stda	%r8, [%r10 + %r11] 0x80
	.word 0x8b22a2f8  ! 537: MULScc_I	mulscc 	%r10, 0x02f8, %r5
	.word 0x83daae64  ! 538: FLUSH_I	dis not found

	.word 0xc692a158  ! 539: LDUHA_I	lduha	[%r10, + 0x0158] %asi, %r3
	.word 0xa6d2800b  ! 540: UMULcc_R	umulcc 	%r10, %r11, %r19
	.word 0x9ef2acd4  ! 541: UDIVcc_I	udivcc 	%r10, 0x0cd4, %r15
	.word 0xfa92ae34  ! 542: LDUHA_I	lduha	[%r10, + 0x0e34] %asi, %r29
	.word 0xc8daa0d8  ! 543: LDXA_I	ldxa	[%r10, + 0x00d8] %asi, %r4
	.word 0xca42800b  ! 544: LDSW_R	ldsw	[%r10 + %r11], %r5
	.word 0x864aaab0  ! 545: MULX_I	mulx 	%r10, 0x0ab0, %r3
	.word 0xc36a800b  ! 546: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0xc2d2900b  ! 548: LDSHA_R	ldsha	[%r10, %r11] 0x80, %r1
	.word 0x865aab8c  ! 549: SMUL_I	smul 	%r10, 0x0b8c, %r3
	.word 0x8143e057  ! 550: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside | #Sync 
	.word 0xfeea900b  ! 551: LDSTUBA_R	ldstuba	%r31, [%r10 + %r11] 0x80
	.word 0x36800003  ! 553: BGE	bge,a	<label_0x3>
	.word 0xcac2900b  ! 554: LDSWA_R	ldswa	[%r10, %r11] 0x80, %r5
	.word 0xaa52800b  ! 555: UMUL_R	umul 	%r10, %r11, %r21
	.word 0xc7f2a00b  ! 556: CASXA_R	casxa	[%r10]%asi, %r11, %r3
	.word 0x8bda800b  ! 557: FLUSH_R	dis not found

	.word 0x8522800b  ! 558: MULScc_R	mulscc 	%r10, %r11, %r2
	.word 0xc33a800b  ! 559: STDF_R	std	%f1, [%r11, %r10]
	.word 0x8143e021  ! 560: MEMBAR	membar	#LoadLoad | #MemIssue 
	.word 0xd2fa900b  ! 561: SWAPA_R	swapa	%r9, [%r10 + %r11] 0x80
	.word 0xc36a800b  ! 562: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0xaed2a6ac  ! 563: UMULcc_I	umulcc 	%r10, 0x06ac, %r23
	.word 0xd252800b  ! 564: LDSH_R	ldsh	[%r10 + %r11], %r9
	.word 0x8dda800b  ! 565: FLUSH_R	dis not found

	.word 0xf26aadb8  ! 566: LDSTUB_I	ldstub	%r25, [%r10 + 0x0db8]
	.word 0x8a5a800b  ! 567: SMUL_R	smul 	%r10, %r11, %r5
	.word 0x8d22a0f4  ! 569: MULScc_I	mulscc 	%r10, 0x00f4, %r6
	.word 0x8143e024  ! 570: MEMBAR	membar	#LoadStore | #MemIssue 
	.word 0xd00aa4b4  ! 571: LDUB_I	ldub	[%r10 + 0x04b4], %r8
	.word 0x82f2aeac  ! 572: UDIVcc_I	udivcc 	%r10, 0x0eac, %r1
	.word 0x24c20003  ! 573: BRLEZ	brlez,a,nt	%8,<label_0x20003>
	.word 0xf1f2900b  ! 574: CASXA_I	casxa	[%r10] 0x80, %r11, %r24
	.word 0x9fa2892b  ! 575: FMULs	fmuls	%f10, %f11, %f15
	.word 0x8da288ab  ! 576: FSUBs	fsubs	%f10, %f11, %f6
	.word 0x8143e02b  ! 577: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #MemIssue 
	.word 0xe0eaa878  ! 578: LDSTUBA_I	ldstuba	%r16, [%r10 + 0x0878] %asi
	.word 0x1a800001  ! 579: BCC	bcc  	<label_0x1>
	.word 0xd07a800b  ! 580: SWAP_R	swap	%r8, [%r10 + %r11]
	.word 0x90f2800b  ! 581: UDIVcc_R	udivcc 	%r10, %r11, %r8
	.word 0xc652a778  ! 582: LDSH_I	ldsh	[%r10 + 0x0778], %r3
	.word 0x9dda800b  ! 583: FLUSH_R	dis not found

	.word 0xf4ba900b  ! 584: STDA_R	stda	%r26, [%r10 + %r11] 0x80
	.word 0xca5aab88  ! 585: LDX_I	ldx	[%r10 + 0x0b88], %r5
	.word 0x83daaad0  ! 586: FLUSH_I	dis not found

	.word 0x896aae34  ! 587: SDIVX_I	sdivx	%r10, 0x0e34, %r4
	.word 0xca52800b  ! 588: LDSH_R	ldsh	[%r10 + %r11], %r5
	.word 0x92da800b  ! 589: SMULcc_R	smulcc 	%r10, %r11, %r9
	.word 0xd24a800b  ! 590: LDSB_R	ldsb	[%r10 + %r11], %r9
	.word 0xc36aa17c  ! 591: PREFETCH_I	prefetch	[%r10 + 0x017c], #one_read
	.word 0x867a800b  ! 592: SDIV_R	sdiv 	%r10, %r11, %r3
	.word 0xd00a800b  ! 593: LDUB_R	ldub	[%r10 + %r11], %r8
	.word 0xc81a800b  ! 594: LDD_R	ldd	[%r10 + %r11], %r4
	.word 0xc60aa4ec  ! 595: LDUB_I	ldub	[%r10 + 0x04ec], %r3
	.word 0xc68a900b  ! 596: LDUBA_R	lduba	[%r10, %r11] 0x80, %r3
	.word 0xc6fa900b  ! 597: SWAPA_R	swapa	%r3, [%r10 + %r11] 0x80
	.word 0xb36aaacc  ! 598: SDIVX_I	sdivx	%r10, 0x0acc, %r25
	.word 0xc6d2900b  ! 600: LDSHA_R	ldsha	[%r10, %r11] 0x80, %r3
	.word 0x8143c000  ! 601: STBAR	stbar
	.word 0xc522800b  ! 602: STF_R	st	%f2, [%r11, %r10]
	.word 0x9f22800b  ! 603: MULScc_R	mulscc 	%r10, %r11, %r15
	.word 0x8143c000  ! 604: STBAR	stbar
	.word 0x12800001  ! 605: BNE	bne  	<label_0x1>
	.word 0xeed2900b  ! 606: LDSHA_R	ldsha	[%r10, %r11] 0x80, %r23
	.word 0x8472800b  ! 607: UDIV_R	udiv 	%r10, %r11, %r2
	.word 0x8edaa124  ! 608: SMULcc_I	smulcc 	%r10, 0x0124, %r7
	.word 0xa07a800b  ! 609: SDIV_R	sdiv 	%r10, %r11, %r16
	.word 0xca7aa3bc  ! 610: SWAP_I	swap	%r5, [%r10 + 0x03bc]
	.word 0x8672800b  ! 611: UDIV_R	udiv 	%r10, %r11, %r3
	.word 0xc36a800b  ! 612: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x36800001  ! 613: BGE	bge,a	<label_0x1>
	.word 0xca52800b  ! 614: LDSH_R	ldsh	[%r10 + %r11], %r5
	.word 0x93a2892b  ! 615: FMULs	fmuls	%f10, %f11, %f9
	.word 0xc47aa9d8  ! 616: SWAP_I	swap	%r2, [%r10 + 0x09d8]
	.word 0xcb22a2ac  ! 617: STF_I	st	%f5, [0x02ac, %r10]
	.word 0xd0aaa0d8  ! 618: STBA_I	stba	%r8, [%r10 + 0x00d8] %asi
	.word 0xccfaa224  ! 619: SWAPA_I	swapa	%r6, [%r10 + 0x0224] %asi
	.word 0x85daab54  ! 620: FLUSH_I	dis not found

	.word 0x87a2882b  ! 621: FADDs	fadds	%f10, %f11, %f3
	.word 0xf092a628  ! 622: LDUHA_I	lduha	[%r10, + 0x0628] %asi, %r24
	.word 0x93daa228  ! 623: FLUSH_I	dis not found

	.word 0x8252800b  ! 624: UMUL_R	umul 	%r10, %r11, %r1
	.word 0xc6f2a598  ! 625: STXA_I	stxa	%r3, [%r10 + 0x0598] %asi
	.word 0x8e5a800b  ! 626: SMUL_R	smul 	%r10, %r11, %r7
	.word 0x26800003  ! 627: BL	bl,a	<label_0x3>
	.word 0xcc82900b  ! 628: LDUWA_R	lduwa	[%r10, %r11] 0x80, %r6
	.word 0xe6da900b  ! 629: LDXA_R	ldxa	[%r10, %r11] 0x80, %r19
	.word 0x04ca0001  ! 630: BRLEZ	brlez  ,pt	%8,<label_0xa0001>
	.word 0xc3eaa1f8  ! 631: PREFETCHA_I	prefetcha	[%r10, + 0x01f8] %asi, #one_read
	.word 0x89daa6e0  ! 632: FLUSH_I	dis not found

	.word 0x83a289ab  ! 633: FDIVs	fdivs	%f10, %f11, %f1
	.word 0xc2caac08  ! 634: LDSBA_I	ldsba	[%r10, + 0x0c08] %asi, %r1
	.word 0xd322aedc  ! 635: STF_I	st	%f9, [0x0edc, %r10]
	.word 0xc6a2acac  ! 636: STWA_I	stwa	%r3, [%r10 + 0x0cac] %asi
	.word 0xca4aaa08  ! 637: LDSB_I	ldsb	[%r10 + 0x0a08], %r5
	.word 0xed22800b  ! 638: STF_R	st	%f22, [%r11, %r10]
	.word 0x89daaef4  ! 639: FLUSH_I	dis not found

	.word 0xdcb2900b  ! 640: STHA_R	stha	%r14, [%r10 + %r11] 0x80
	.word 0x9cf2a478  ! 641: UDIVcc_I	udivcc 	%r10, 0x0478, %r14
	.word 0xcaaa900b  ! 642: STBA_R	stba	%r5, [%r10 + %r11] 0x80
	.word 0x8143e00a  ! 643: MEMBAR	membar	#StoreLoad | #StoreStore 
	.word 0x985aaf24  ! 644: SMUL_I	smul 	%r10, 0x0f24, %r12
	.word 0x8ddaadcc  ! 645: FLUSH_I	dis not found

	.word 0xc3ea900b  ! 646: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0xdca2a6a0  ! 647: STWA_I	stwa	%r14, [%r10 + 0x06a0] %asi
	.word 0xebe2900b  ! 648: CASA_I	casa	[%r10] 0x80, %r11, %r21
	.word 0xe4ba900b  ! 649: STDA_R	stda	%r18, [%r10 + %r11] 0x80
	.word 0xe81aab68  ! 650: LDD_I	ldd	[%r10 + 0x0b68], %r20
	.word 0xd0aaa290  ! 651: STBA_I	stba	%r8, [%r10 + 0x0290] %asi
	.word 0xb5daa70c  ! 653: FLUSH_I	dis not found

	.word 0xc322800b  ! 654: STF_R	st	%f1, [%r11, %r10]
	.word 0x82f2a2f8  ! 655: UDIVcc_I	udivcc 	%r10, 0x02f8, %r1
	.word 0xf8ba900b  ! 656: STDA_R	stda	%r28, [%r10 + %r11] 0x80
	.word 0xc6ea900b  ! 657: LDSTUBA_R	ldstuba	%r3, [%r10 + %r11] 0x80
	.word 0x90d2a654  ! 658: UMULcc_I	umulcc 	%r10, 0x0654, %r8
	.word 0x8bdaa060  ! 659: FLUSH_I	dis not found

	.word 0xf0a2afc8  ! 660: STWA_I	stwa	%r24, [%r10 + 0x0fc8] %asi
	.word 0x86f2800b  ! 661: UDIVcc_R	udivcc 	%r10, %r11, %r3
	.word 0x26ca0001  ! 662: BRLZ	brlz,a,pt	%8,<label_0xa0001>
	.word 0x8143e011  ! 663: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xde7aac60  ! 664: SWAP_I	swap	%r15, [%r10 + 0x0c60]
	.word 0x87da800b  ! 665: FLUSH_R	dis not found

	.word 0x83da800b  ! 666: FLUSH_R	dis not found

	.word 0xc5f2900b  ! 667: CASXA_I	casxa	[%r10] 0x80, %r11, %r2
	.word 0x8143c000  ! 668: STBAR	stbar
	.word 0x06800001  ! 669: BL	bl  	<label_0x1>
	.word 0x00800003  ! 670: BN	bn  	<label_0x3>
	.word 0xbeda800b  ! 671: SMULcc_R	smulcc 	%r10, %r11, %r31
	.word 0xa052a2dc  ! 672: UMUL_I	umul 	%r10, 0x02dc, %r16
	.word 0xc522a784  ! 673: STF_I	st	%f2, [0x0784, %r10]
	.word 0xdc02800b  ! 674: LDUW_R	lduw	[%r10 + %r11], %r14
	.word 0xc3ea900b  ! 675: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0xc5e2900b  ! 676: CASA_I	casa	[%r10] 0x80, %r11, %r2
	.word 0xf2b2ab84  ! 677: STHA_I	stha	%r25, [%r10 + 0x0b84] %asi
	.word 0xa9daafd8  ! 678: FLUSH_I	dis not found

	.word 0xd13a800b  ! 679: STDF_R	std	%f8, [%r11, %r10]
	.word 0x83da800b  ! 680: FLUSH_R	dis not found

	.word 0x8cf2800b  ! 681: UDIVcc_R	udivcc 	%r10, %r11, %r6
	.word 0x91a2892b  ! 682: FMULs	fmuls	%f10, %f11, %f8
	.word 0xc6aa900b  ! 684: STBA_R	stba	%r3, [%r10 + %r11] 0x80
	.word 0x8143e009  ! 685: MEMBAR	membar	#LoadLoad | #StoreStore 
	.word 0x89da800b  ! 686: FLUSH_R	dis not found

	.word 0xe8b2a4ac  ! 687: STHA_I	stha	%r20, [%r10 + 0x04ac] %asi
	.word 0xca52a228  ! 688: LDSH_I	ldsh	[%r10 + 0x0228], %r5
	.word 0xccb2900b  ! 689: STHA_R	stha	%r6, [%r10 + %r11] 0x80
	.word 0x8143e030  ! 690: MEMBAR	membar	#Lookaside | #MemIssue 
	.word 0x9a5a800b  ! 691: SMUL_R	smul 	%r10, %r11, %r13
	.word 0x16800001  ! 692: BGE	bge  	<label_0x1>
	.word 0xc3ea900b  ! 693: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0x8e6a800b  ! 694: UDIVX_R	udivx 	%r10, %r11, %r7
	.word 0xc642800b  ! 695: LDSW_R	ldsw	[%r10 + %r11], %r3
	.word 0x82daaab0  ! 696: SMULcc_I	smulcc 	%r10, 0x0ab0, %r1
	.word 0x9e4a800b  ! 697: MULX_R	mulx 	%r10, %r11, %r15
	.word 0x87a2892b  ! 699: FMULs	fmuls	%f10, %f11, %f3
	.word 0x87da800b  ! 700: FLUSH_R	dis not found

	.word 0x83a289ab  ! 701: FDIVs	fdivs	%f10, %f11, %f1
	.word 0xe052a664  ! 702: LDSH_I	ldsh	[%r10 + 0x0664], %r16
	.word 0x8143c000  ! 704: STBAR	stbar
	.word 0xe4baa670  ! 705: STDA_I	stda	%r18, [%r10 + 0x0670] %asi
	.word 0xee42800b  ! 706: LDSW_R	ldsw	[%r10 + %r11], %r23
	.word 0x8143e01e  ! 707: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside 
	.word 0x8edaa0d4  ! 708: SMULcc_I	smulcc 	%r10, 0x00d4, %r7
	.word 0x40000001  ! 709: CALL	call	disp30_1
	.word 0xccbaa608  ! 710: STDA_I	stda	%r6, [%r10 + 0x0608] %asi
	.word 0xc3eaa354  ! 711: PREFETCHA_I	prefetcha	[%r10, + 0x0354] %asi, #one_read
	.word 0xa322a668  ! 712: MULScc_I	mulscc 	%r10, 0x0668, %r17
	.word 0xd082a014  ! 714: LDUWA_I	lduwa	[%r10, + 0x0014] %asi, %r8
	.word 0xe60a800b  ! 715: LDUB_R	ldub	[%r10 + %r11], %r19
	.word 0x2c800001  ! 716: BNEG	bneg,a	<label_0x1>
	.word 0xc73aaaa8  ! 717: STDF_I	std	%f3, [0x0aa8, %r10]
	.word 0xc7e2a00b  ! 718: CASA_R	casa	[%r10] %asi, %r11, %r3
	.word 0xb56a800b  ! 719: SDIVX_R	sdivx	%r10, %r11, %r26
	.word 0x88daaf10  ! 720: SMULcc_I	smulcc 	%r10, 0x0f10, %r4
	.word 0x99da800b  ! 721: FLUSH_R	dis not found

	.word 0xf1e2900b  ! 722: CASA_I	casa	[%r10] 0x80, %r11, %r24
	.word 0xc482a3a8  ! 723: LDUWA_I	lduwa	[%r10, + 0x03a8] %asi, %r2
	.word 0x8143e070  ! 724: MEMBAR	membar	#Lookaside | #MemIssue | #Sync 
	.word 0xd0f2900b  ! 725: STXA_R	stxa	%r8, [%r10 + %r11] 0x80
	.word 0x3c800001  ! 726: BPOS	bpos,a	<label_0x1>
	.word 0x8143e06c  ! 727: MEMBAR	membar	#LoadStore | #StoreStore | #MemIssue | #Sync 
	.word 0x8143c000  ! 728: STBAR	stbar
	.word 0xd9f2900b  ! 729: CASXA_I	casxa	[%r10] 0x80, %r11, %r12
	.word 0xadda800b  ! 730: FLUSH_R	dis not found

	.word 0x8afa800b  ! 731: SDIVcc_R	sdivcc 	%r10, %r11, %r5
	.word 0x32800001  ! 732: BNE	bne,a	<label_0x1>
	.word 0x926a800b  ! 733: UDIVX_R	udivx 	%r10, %r11, %r9
	.word 0xf692a128  ! 734: LDUHA_I	lduha	[%r10, + 0x0128] %asi, %r27
	.word 0xc36a800b  ! 735: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x8143e003  ! 736: MEMBAR	membar	#LoadLoad | #StoreLoad 
	.word 0xf1e2a00b  ! 737: CASA_R	casa	[%r10] %asi, %r11, %r24
	.word 0xf44a800b  ! 739: LDSB_R	ldsb	[%r10 + %r11], %r26
	.word 0xbba288ab  ! 740: FSUBs	fsubs	%f10, %f11, %f29
	.word 0xcc1a800b  ! 741: LDD_R	ldd	[%r10 + %r11], %r6
	.word 0xcf3aaf30  ! 742: STDF_I	std	%f7, [0x0f30, %r10]
	.word 0xbad2aee4  ! 743: UMULcc_I	umulcc 	%r10, 0x0ee4, %r29
	.word 0xd0ca900b  ! 744: LDSBA_R	ldsba	[%r10, %r11] 0x80, %r8
	.word 0xc6f2900b  ! 745: STXA_R	stxa	%r3, [%r10 + %r11] 0x80
	.word 0xc802800b  ! 746: LDUW_R	lduw	[%r10 + %r11], %r4
	.word 0xceea900b  ! 747: LDSTUBA_R	ldstuba	%r7, [%r10 + %r11] 0x80
	.word 0xc36aaf50  ! 748: PREFETCH_I	prefetch	[%r10 + 0x0f50], #one_read
	.word 0x8143e062  ! 749: MEMBAR	membar	#StoreLoad | #MemIssue | #Sync 
	.word 0x2aca0003  ! 750: BRNZ	brnz,a,pt	%8,<label_0xa0003>
	.word 0xf8daa058  ! 751: LDXA_I	ldxa	[%r10, + 0x0058] %asi, %r28
	.word 0xc8aa900b  ! 752: STBA_R	stba	%r4, [%r10 + %r11] 0x80
	.word 0xc8a2900b  ! 753: STWA_R	stwa	%r4, [%r10 + %r11] 0x80
	.word 0x0a800003  ! 754: BCS	bcs  	<label_0x3>
	.word 0xd242a074  ! 755: LDSW_I	ldsw	[%r10 + 0x0074], %r9
	.word 0xd13a800b  ! 756: STDF_R	std	%f8, [%r11, %r10]
	.word 0x8143c000  ! 757: STBAR	stbar
	.word 0x93da800b  ! 758: FLUSH_R	dis not found

	.word 0x8143c000  ! 759: STBAR	stbar
	.word 0x8872a724  ! 760: UDIV_I	udiv 	%r10, 0x0724, %r4
	.word 0xd2b2a434  ! 761: STHA_I	stha	%r9, [%r10 + 0x0434] %asi
	.word 0xf2f2a6b0  ! 762: STXA_I	stxa	%r25, [%r10 + 0x06b0] %asi
	.word 0xc2f2ac20  ! 763: STXA_I	stxa	%r1, [%r10 + 0x0c20] %asi
	.word 0x8143e040  ! 764: MEMBAR	membar	#Sync 
	.word 0xc8ba900b  ! 765: STDA_R	stda	%r4, [%r10 + %r11] 0x80
	.word 0x8143e029  ! 766: MEMBAR	membar	#LoadLoad | #StoreStore | #MemIssue 
	.word 0xe2b2a7ac  ! 767: STHA_I	stha	%r17, [%r10 + 0x07ac] %asi
	.word 0xc452800b  ! 768: LDSH_R	ldsh	[%r10 + %r11], %r2
	.word 0x99daa6b0  ! 769: FLUSH_I	dis not found

	.word 0x83daa434  ! 770: FLUSH_I	dis not found

	.word 0xce6aa2b0  ! 771: LDSTUB_I	ldstub	%r7, [%r10 + 0x02b0]
	.word 0xd2aaadec  ! 772: STBA_I	stba	%r9, [%r10 + 0x0dec] %asi
	.word 0x8ad2800b  ! 773: UMULcc_R	umulcc 	%r10, %r11, %r5
	.word 0x8143c000  ! 774: STBAR	stbar
	.word 0x8143e062  ! 775: MEMBAR	membar	#StoreLoad | #MemIssue | #Sync 
	.word 0xd26a800b  ! 776: LDSTUB_R	ldstub	%r9, [%r10 + %r11]
	.word 0x8143c000  ! 777: STBAR	stbar
	.word 0x40000001  ! 778: CALL	call	disp30_1
	.word 0x8fdaaaa4  ! 779: FLUSH_I	dis not found

	.word 0x0cca0001  ! 780: BRGZ	brgz  ,pt	%8,<label_0xa0001>
	.word 0x0c800001  ! 781: BNEG	bneg  	<label_0x1>
	.word 0xca0a800b  ! 782: LDUB_R	ldub	[%r10 + %r11], %r5
	.word 0x836aa0b8  ! 783: SDIVX_I	sdivx	%r10, 0x00b8, %r1
	.word 0xb87a800b  ! 784: SDIV_R	sdiv 	%r10, %r11, %r28
	.word 0x9bdaa460  ! 785: FLUSH_I	dis not found

	.word 0xc3eaa848  ! 786: PREFETCHA_I	prefetcha	[%r10, + 0x0848] %asi, #one_read
	.word 0x84fa800b  ! 787: SDIVcc_R	sdivcc 	%r10, %r11, %r2
	.word 0x8e52800b  ! 788: UMUL_R	umul 	%r10, %r11, %r7
	.word 0x8fda800b  ! 789: FLUSH_R	dis not found

	.word 0xe66aa94c  ! 790: LDSTUB_I	ldstub	%r19, [%r10 + 0x094c]
	.word 0x3a800001  ! 791: BCC	bcc,a	<label_0x1>
	.word 0x8143c000  ! 792: STBAR	stbar
	.word 0x91daad4c  ! 793: FLUSH_I	dis not found

	.word 0x8c72800b  ! 794: UDIV_R	udiv 	%r10, %r11, %r6
	.word 0x02ca0003  ! 796: BRZ	brz  ,pt	%8,<label_0xa0003>
	.word 0x8cfaadd4  ! 797: SDIVcc_I	sdivcc 	%r10, 0x0dd4, %r6
	.word 0x2ac20001  ! 798: BRNZ	brnz,a,nt	%8,<label_0x20001>
	.word 0xcd22ac24  ! 799: STF_I	st	%f6, [0x0c24, %r10]
	.word 0xc36a800b  ! 800: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0xcb3a800b  ! 801: STDF_R	std	%f5, [%r11, %r10]
	.word 0x8a52ace0  ! 802: UMUL_I	umul 	%r10, 0x0ce0, %r5
	.word 0x8ddaa000  ! 803: FLUSH_I	dis not found

	.word 0xbadaa6d0  ! 804: SMULcc_I	smulcc 	%r10, 0x06d0, %r29
	.word 0x8143e00d  ! 805: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore 
	.word 0x8dda800b  ! 806: FLUSH_R	dis not found

	.word 0x0ac20001  ! 807: BRNZ	brnz  ,nt	%8,<label_0x20001>
	.word 0x8fa289ab  ! 808: FDIVs	fdivs	%f10, %f11, %f7
	.word 0x92daaec8  ! 809: SMULcc_I	smulcc 	%r10, 0x0ec8, %r9
	.word 0xc86a800b  ! 810: LDSTUB_R	ldstub	%r4, [%r10 + %r11]
	.word 0xf082a448  ! 811: LDUWA_I	lduwa	[%r10, + 0x0448] %asi, %r24
	.word 0xe33a800b  ! 812: STDF_R	std	%f17, [%r11, %r10]
	.word 0xc27a800b  ! 813: SWAP_R	swap	%r1, [%r10 + %r11]
	.word 0xfa82900b  ! 814: LDUWA_R	lduwa	[%r10, %r11] 0x80, %r29
	.word 0xc36aa0d8  ! 815: PREFETCH_I	prefetch	[%r10 + 0x00d8], #one_read
	.word 0x0ac20003  ! 816: BRNZ	brnz  ,nt	%8,<label_0x20003>
	.word 0x89da800b  ! 818: FLUSH_R	dis not found

	.word 0xcb22800b  ! 820: STF_R	st	%f5, [%r11, %r10]
	.word 0x8dda800b  ! 821: FLUSH_R	dis not found

	.word 0x89daacc4  ! 822: FLUSH_I	dis not found

	.word 0x87da800b  ! 823: FLUSH_R	dis not found

	.word 0x8143c000  ! 825: STBAR	stbar
	.word 0xca82900b  ! 826: LDUWA_R	lduwa	[%r10, %r11] 0x80, %r5
	.word 0xcccaa350  ! 827: LDSBA_I	ldsba	[%r10, + 0x0350] %asi, %r6
	.word 0x9e6a800b  ! 828: UDIVX_R	udivx 	%r10, %r11, %r15
	.word 0xeeaaa404  ! 829: STBA_I	stba	%r23, [%r10 + 0x0404] %asi
	.word 0xee02800b  ! 830: LDUW_R	lduw	[%r10 + %r11], %r23
	.word 0x8bdaabb4  ! 831: FLUSH_I	dis not found

	.word 0x83a2892b  ! 832: FMULs	fmuls	%f10, %f11, %f1
	.word 0x8143e00d  ! 833: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore 
	.word 0xc3ea900b  ! 834: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0xca12800b  ! 835: LDUH_R	lduh	[%r10 + %r11], %r5
	.word 0xcab2adac  ! 836: STHA_I	stha	%r5, [%r10 + 0x0dac] %asi
	.word 0xf602abdc  ! 838: LDUW_I	lduw	[%r10 + 0x0bdc], %r27
	.word 0x87daa940  ! 840: FLUSH_I	dis not found

	.word 0x85a2892b  ! 841: FMULs	fmuls	%f10, %f11, %f2
	.word 0xd202800b  ! 842: LDUW_R	lduw	[%r10 + %r11], %r9
	.word 0xd13a800b  ! 843: STDF_R	std	%f8, [%r11, %r10]
	.word 0xdcaaae74  ! 844: STBA_I	stba	%r14, [%r10 + 0x0e74] %asi
	.word 0xd00a800b  ! 845: LDUB_R	ldub	[%r10 + %r11], %r8
	.word 0xfe0a800b  ! 846: LDUB_R	ldub	[%r10 + %r11], %r31
	.word 0xc922800b  ! 847: STF_R	st	%f4, [%r11, %r10]
	.word 0xc6da900b  ! 848: LDXA_R	ldxa	[%r10, %r11] 0x80, %r3
	.word 0x9ba2892b  ! 849: FMULs	fmuls	%f10, %f11, %f13
	.word 0x8ddaa62c  ! 850: FLUSH_I	dis not found

	.word 0x2ac20001  ! 851: BRNZ	brnz,a,nt	%8,<label_0x20001>
	.word 0xeaa2900b  ! 852: STWA_R	stwa	%r21, [%r10 + %r11] 0x80
	.word 0x8143e03e  ! 853: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0xc4da900b  ! 854: LDXA_R	ldxa	[%r10, %r11] 0x80, %r2
	.word 0xcaaaa024  ! 855: STBA_I	stba	%r5, [%r10 + 0x0024] %asi
	.word 0x8872a1f8  ! 856: UDIV_I	udiv 	%r10, 0x01f8, %r4
	.word 0x83daa620  ! 857: FLUSH_I	dis not found

	.word 0xbdda800b  ! 858: FLUSH_R	dis not found

	.word 0xc3ea900b  ! 859: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0xca0a800b  ! 860: LDUB_R	ldub	[%r10 + %r11], %r5
	.word 0xc252a410  ! 861: LDSH_I	ldsh	[%r10 + 0x0410], %r1
	.word 0xccdaa278  ! 862: LDXA_I	ldxa	[%r10, + 0x0278] %asi, %r6
	.word 0x8bda800b  ! 863: FLUSH_R	dis not found

	.word 0xbe7a800b  ! 864: SDIV_R	sdiv 	%r10, %r11, %r31
	.word 0xce6a800b  ! 865: LDSTUB_R	ldstub	%r7, [%r10 + %r11]
	.word 0x864aa1f4  ! 866: MULX_I	mulx 	%r10, 0x01f4, %r3
	.word 0xc26a800b  ! 867: LDSTUB_R	ldstub	%r1, [%r10 + %r11]
	.word 0xaafa800b  ! 868: SDIVcc_R	sdivcc 	%r10, %r11, %r21
	.word 0xccdaaca8  ! 871: LDXA_I	ldxa	[%r10, + 0x0ca8] %asi, %r6
	.word 0xc86a800b  ! 872: LDSTUB_R	ldstub	%r4, [%r10 + %r11]
	.word 0xc3ea900b  ! 873: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0xf09a900b  ! 874: LDDA_R	ldda	[%r10, %r11] 0x80, %r24
	.word 0xd2f2900b  ! 875: STXA_R	stxa	%r9, [%r10 + %r11] 0x80
	.word 0xca6a800b  ! 876: LDSTUB_R	ldstub	%r5, [%r10 + %r11]
	.word 0x8ba2892b  ! 878: FMULs	fmuls	%f10, %f11, %f5
	.word 0x836a800b  ! 879: SDIVX_R	sdivx	%r10, %r11, %r1
	.word 0x8143e02c  ! 880: MEMBAR	membar	#LoadStore | #StoreStore | #MemIssue 
	.word 0x9c6a800b  ! 881: UDIVX_R	udivx 	%r10, %r11, %r14
	.word 0xbfa289ab  ! 882: FDIVs	fdivs	%f10, %f11, %f31
	.word 0xc33a800b  ! 883: STDF_R	std	%f1, [%r11, %r10]
	.word 0xc27a800b  ! 885: SWAP_R	swap	%r1, [%r10 + %r11]
	.word 0xbbda800b  ! 886: FLUSH_R	dis not found

	.word 0xc6d2ad40  ! 887: LDSHA_I	ldsha	[%r10, + 0x0d40] %asi, %r3
	.word 0xc36a800b  ! 888: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0xb07aa67c  ! 889: SDIV_I	sdiv 	%r10, 0x067c, %r24
	.word 0x93da800b  ! 890: FLUSH_R	dis not found

	.word 0xcb3a800b  ! 891: STDF_R	std	%f5, [%r11, %r10]
	.word 0xc8ba900b  ! 892: STDA_R	stda	%r4, [%r10 + %r11] 0x80
	.word 0xf8faaa5c  ! 894: SWAPA_I	swapa	%r28, [%r10 + 0x0a5c] %asi
	.word 0xe292aadc  ! 896: LDUHA_I	lduha	[%r10, + 0x0adc] %asi, %r17
	.word 0x8b6a800b  ! 897: SDIVX_R	sdivx	%r10, %r11, %r5
	.word 0xe812adb8  ! 898: LDUH_I	lduh	[%r10 + 0x0db8], %r20
	.word 0xccfa900b  ! 899: SWAPA_R	swapa	%r6, [%r10 + %r11] 0x80
	.word 0xa6f2800b  ! 900: UDIVcc_R	udivcc 	%r10, %r11, %r19
	.word 0x02ca0001  ! 901: BRZ	brz  ,pt	%8,<label_0xa0001>
	.word 0x26800001  ! 902: BL	bl,a	<label_0x1>
	.word 0xccaa900b  ! 903: STBA_R	stba	%r6, [%r10 + %r11] 0x80
	.word 0xd0baa6a8  ! 904: STDA_I	stda	%r8, [%r10 + 0x06a8] %asi
	.word 0xc852800b  ! 905: LDSH_R	ldsh	[%r10 + %r11], %r4
	.word 0xc6ca900b  ! 906: LDSBA_R	ldsba	[%r10, %r11] 0x80, %r3
	.word 0x89daac8c  ! 907: FLUSH_I	dis not found

	.word 0xd05a800b  ! 908: LDX_R	ldx	[%r10 + %r11], %r8
	.word 0x93daa5c4  ! 909: FLUSH_I	dis not found

	.word 0x8143e06f  ! 910: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #MemIssue | #Sync 
	.word 0xa1a288ab  ! 911: FSUBs	fsubs	%f10, %f11, %f16
	.word 0xa072800b  ! 912: UDIV_R	udiv 	%r10, %r11, %r16
	.word 0xd842800b  ! 913: LDSW_R	ldsw	[%r10 + %r11], %r12
	.word 0xc6d2900b  ! 914: LDSHA_R	ldsha	[%r10, %r11] 0x80, %r3
	.word 0x8872a514  ! 915: UDIV_I	udiv 	%r10, 0x0514, %r4
	.word 0xd092a2f0  ! 916: LDUHA_I	lduha	[%r10, + 0x02f0] %asi, %r8
	.word 0x876a800b  ! 917: SDIVX_R	sdivx	%r10, %r11, %r3
	.word 0xc6da900b  ! 918: LDXA_R	ldxa	[%r10, %r11] 0x80, %r3
	.word 0x12800001  ! 919: BNE	bne  	<label_0x1>
	.word 0xbc7a800b  ! 920: SDIV_R	sdiv 	%r10, %r11, %r30
	.word 0x83a289ab  ! 921: FDIVs	fdivs	%f10, %f11, %f1
	.word 0xc3ea900b  ! 922: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0x8143e02e  ! 924: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #MemIssue 
	.word 0x40000001  ! 926: CALL	call	disp30_1
	.word 0x8afaa540  ! 927: SDIVcc_I	sdivcc 	%r10, 0x0540, %r5
	.word 0xfff2900b  ! 928: CASXA_I	casxa	[%r10] 0x80, %r11, %r31
	.word 0x06800003  ! 930: BL	bl  	<label_0x3>
	.word 0x90fa800b  ! 931: SDIVcc_R	sdivcc 	%r10, %r11, %r8
	.word 0xf6a2ad34  ! 932: STWA_I	stwa	%r27, [%r10 + 0x0d34] %asi
	.word 0x8272800b  ! 933: UDIV_R	udiv 	%r10, %r11, %r1
	.word 0xe8aa900b  ! 934: STBA_R	stba	%r20, [%r10 + %r11] 0x80
	.word 0xeedaae18  ! 935: LDXA_I	ldxa	[%r10, + 0x0e18] %asi, %r23
	.word 0x8143c000  ! 936: STBAR	stbar
	.word 0x0c800001  ! 937: BNEG	bneg  	<label_0x1>
	.word 0xf13a800b  ! 938: STDF_R	std	%f24, [%r11, %r10]
	.word 0xc3eaa2f4  ! 939: PREFETCHA_I	prefetcha	[%r10, + 0x02f4] %asi, #one_read
	.word 0xb1da800b  ! 940: FLUSH_R	dis not found

	.word 0xc5e2a00b  ! 941: CASA_R	casa	[%r10] %asi, %r11, %r2
	.word 0xc4fa900b  ! 942: SWAPA_R	swapa	%r2, [%r10 + %r11] 0x80
	.word 0xce92900b  ! 943: LDUHA_R	lduha	[%r10, %r11] 0x80, %r7
	.word 0xcfe2900b  ! 944: CASA_I	casa	[%r10] 0x80, %r11, %r7
	.word 0x8143c000  ! 945: STBAR	stbar
	.word 0x2cc20001  ! 946: BRGZ	brgz,a,nt	%8,<label_0x20001>
	.word 0x89a288ab  ! 947: FSUBs	fsubs	%f10, %f11, %f4
	.word 0x8f6aad24  ! 951: SDIVX_I	sdivx	%r10, 0x0d24, %r7
	.word 0x8cd2800b  ! 952: UMULcc_R	umulcc 	%r10, %r11, %r6
	.word 0x8143e038  ! 953: MEMBAR	membar	#StoreStore | #Lookaside | #MemIssue 
	.word 0xc6f2ae38  ! 954: STXA_I	stxa	%r3, [%r10 + 0x0e38] %asi
	.word 0xb7daa280  ! 955: FLUSH_I	dis not found

	.word 0xc892900b  ! 956: LDUHA_R	lduha	[%r10, %r11] 0x80, %r4
	.word 0xd0d2900b  ! 957: LDSHA_R	ldsha	[%r10, %r11] 0x80, %r8
	.word 0xccfa900b  ! 958: SWAPA_R	swapa	%r6, [%r10 + %r11] 0x80
	.word 0x8143c000  ! 959: STBAR	stbar
	.word 0x18800001  ! 960: BGU	bgu  	<label_0x1>
	.word 0x04ca0003  ! 961: BRLEZ	brlez  ,pt	%8,<label_0xa0003>
	.word 0xf252800b  ! 962: LDSH_R	ldsh	[%r10 + %r11], %r25
	.word 0xca0a800b  ! 963: LDUB_R	ldub	[%r10 + %r11], %r5
	.word 0xcc6aa220  ! 964: LDSTUB_I	ldstub	%r6, [%r10 + 0x0220]
	.word 0x85da800b  ! 965: FLUSH_R	dis not found

	.word 0xc36a800b  ! 966: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x8143c000  ! 967: STBAR	stbar
	.word 0xc4c2900b  ! 968: LDSWA_R	ldswa	[%r10, %r11] 0x80, %r2
	.word 0xac6a800b  ! 969: UDIVX_R	udivx 	%r10, %r11, %r22
	.word 0x8143e057  ! 970: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside | #Sync 
	.word 0xe602a6a0  ! 971: LDUW_I	lduw	[%r10 + 0x06a0], %r19
	.word 0x9e7a800b  ! 972: SDIV_R	sdiv 	%r10, %r11, %r15
	.word 0xc93a800b  ! 973: STDF_R	std	%f4, [%r11, %r10]
	.word 0xe8ca900b  ! 974: LDSBA_R	ldsba	[%r10, %r11] 0x80, %r20
	.word 0x8fdaaad4  ! 975: FLUSH_I	dis not found

	.word 0xe8aa900b  ! 976: STBA_R	stba	%r20, [%r10 + %r11] 0x80
	.word 0x8143e02a  ! 978: MEMBAR	membar	#StoreLoad | #StoreStore | #MemIssue 
	.word 0x85a288ab  ! 979: FSUBs	fsubs	%f10, %f11, %f2
	.word 0x8143c000  ! 980: STBAR	stbar
	.word 0xc6d2a118  ! 981: LDSHA_I	ldsha	[%r10, + 0x0118] %asi, %r3
	.word 0x91daa338  ! 982: FLUSH_I	dis not found

	.word 0x84f2800b  ! 983: UDIVcc_R	udivcc 	%r10, %r11, %r2
	.word 0x8fa289ab  ! 984: FDIVs	fdivs	%f10, %f11, %f7
	.word 0xc6b2a5cc  ! 985: STHA_I	stha	%r3, [%r10 + 0x05cc] %asi
	.word 0x89da800b  ! 986: FLUSH_R	dis not found

	.word 0xf092900b  ! 987: LDUHA_R	lduha	[%r10, %r11] 0x80, %r24
	.word 0x88d2a1d0  ! 988: UMULcc_I	umulcc 	%r10, 0x01d0, %r4
	.word 0x926a800b  ! 989: UDIVX_R	udivx 	%r10, %r11, %r9
	.word 0x0cc20001  ! 990: BRGZ	brgz  ,nt	%8,<label_0x20001>
	.word 0xd292a588  ! 991: LDUHA_I	lduha	[%r10, + 0x0588] %asi, %r9
	.word 0xfe6a800b  ! 992: LDSTUB_R	ldstub	%r31, [%r10 + %r11]
	.word 0xc66a800b  ! 993: LDSTUB_R	ldstub	%r3, [%r10 + %r11]
	.word 0xc84aa3cc  ! 994: LDSB_I	ldsb	[%r10 + 0x03cc], %r4
	.word 0xf6fa900b  ! 995: SWAPA_R	swapa	%r27, [%r10 + %r11] 0x80
	.word 0x85da800b  ! 996: FLUSH_R	dis not found

	.word 0xe2aaa874  ! 997: STBA_I	stba	%r17, [%r10 + 0x0874] %asi
	.word 0xc4c2a08c  ! 998: LDSWA_I	ldswa	[%r10, + 0x008c] %asi, %r2
	.word 0xccaaae34  ! 999: STBA_I	stba	%r6, [%r10 + 0x0e34] %asi
	nop
	nop
	nop
        ta      T_GOOD_TRAP
th_main_2:
        setx  MAIN_BASE_DATA_VA, %r1, %r10
        setx  0x0000000000000d50, %g1, %r11
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
        setx  0x653244824866282d, %g1, %r0
        setx  0x197514cd24d9239f, %g1, %r1
        setx  0xb705c3aeda7e4560, %g1, %r2
        setx  0x184ced64a4a6ee39, %g1, %r3
        setx  0xec0249a582e74086, %g1, %r4
        setx  0xb6a108dfcd5a8cda, %g1, %r5
        setx  0x6cb9d98f206a38fd, %g1, %r6
        setx  0xa004ec92c47849eb, %g1, %r7
        setx  0x042600d8dcd9e20d, %g1, %r8
        setx  0xad5e61704af825df, %g1, %r9
        setx  0x8dbda4ca39a588de, %g1, %r12
        setx  0x9219978fa35856c9, %g1, %r13
        setx  0xf4ee28231e580d09, %g1, %r14
        setx  0xab31667ed34ad729, %g1, %r15
        setx  0x836d502e590eb343, %g1, %r16
        setx  0x4b71a922f89dea7c, %g1, %r17
        setx  0x554c9fae81ef886d, %g1, %r18
        setx  0x4ae5b5aab28419dd, %g1, %r19
        setx  0x007fdb5a48ffd07b, %g1, %r20
        setx  0xfd4c8ede73b78595, %g1, %r21
        setx  0x35fa99ba0fb45236, %g1, %r22
        setx  0x5306b62370a6ab0c, %g1, %r23
        setx  0xa889f11dbbd173ad, %g1, %r24
        setx  0xb77480db12a7726b, %g1, %r25
        setx  0x7aa7f57e71d9a41c, %g1, %r26
        setx  0x818449ecce9498e7, %g1, %r27
        setx  0xbd55a02c918a8626, %g1, %r28
        setx  0xd935fd539aa26cfd, %g1, %r29
        setx  0xae4030ed4ec2bb4e, %g1, %r30
        setx  0x54d4b54c2757b7ed, %g1, %r31
	.word 0xe482900b  ! 5: LDUWA_R	lduwa	[%r10, %r11] 0x80, %r18
	.word 0xee0aa0ac  ! 6: LDUB_I	ldub	[%r10 + 0x00ac], %r23
	.word 0x8ba289ab  ! 7: FDIVs	fdivs	%f10, %f11, %f5
	.word 0xc09a900b  ! 8: LDDA_R	ldda	[%r10, %r11] 0x80, %r0
	.word 0xca02800b  ! 9: LDUW_R	lduw	[%r10 + %r11], %r5
	.word 0xc6a2900b  ! 10: STWA_R	stwa	%r3, [%r10 + %r11] 0x80
	.word 0x98faaf34  ! 11: SDIVcc_I	sdivcc 	%r10, 0x0f34, %r12
	.word 0xaaf2800b  ! 13: UDIVcc_R	udivcc 	%r10, %r11, %r21
	.word 0xf47aaa10  ! 14: SWAP_I	swap	%r26, [%r10 + 0x0a10]
	.word 0x1e800001  ! 15: BVC	bvc  	<label_0x1>
	.word 0xacd2a698  ! 16: UMULcc_I	umulcc 	%r10, 0x0698, %r22
	.word 0xea52a3c4  ! 17: LDSH_I	ldsh	[%r10 + 0x03c4], %r21
	.word 0xb9da800b  ! 18: FLUSH_R	dis not found

	.word 0x40000003  ! 19: CALL	call	disp30_3
	.word 0xe0a2a7c0  ! 20: STWA_I	stwa	%r16, [%r10 + 0x07c0] %asi
	.word 0xc36a800b  ! 21: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x8143e037  ! 22: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside | #MemIssue 
	.word 0xcea2900b  ! 23: STWA_R	stwa	%r7, [%r10 + %r11] 0x80
	.word 0xefe2900b  ! 24: CASA_I	casa	[%r10] 0x80, %r11, %r23
	.word 0x936a800b  ! 25: SDIVX_R	sdivx	%r10, %r11, %r9
	.word 0xf24aa1a8  ! 26: LDSB_I	ldsb	[%r10 + 0x01a8], %r25
	.word 0xcef2adc8  ! 27: STXA_I	stxa	%r7, [%r10 + 0x0dc8] %asi
	.word 0xff3aa710  ! 28: STDF_I	std	%f31, [0x0710, %r10]
	.word 0x8bda800b  ! 29: FLUSH_R	dis not found

	.word 0x9072a76c  ! 32: UDIV_I	udiv 	%r10, 0x076c, %r8
	.word 0x0cc20003  ! 34: BRGZ	brgz  ,nt	%8,<label_0x20003>
	.word 0x8143e008  ! 36: MEMBAR	membar	#StoreStore 
	.word 0x8bdaac78  ! 37: FLUSH_I	dis not found

	.word 0xfb3aabf8  ! 38: STDF_I	std	%f29, [0x0bf8, %r10]
	.word 0x8c4a800b  ! 39: MULX_R	mulx 	%r10, %r11, %r6
	.word 0x1c800001  ! 40: BPOS	bpos  	<label_0x1>
	.word 0x91a289ab  ! 41: FDIVs	fdivs	%f10, %f11, %f8
	.word 0xf80a800b  ! 42: LDUB_R	ldub	[%r10 + %r11], %r28
	.word 0xd3f2a00b  ! 43: CASXA_R	casxa	[%r10]%asi, %r11, %r9
	.word 0xf0ba900b  ! 44: STDA_R	stda	%r24, [%r10 + %r11] 0x80
	.word 0xa05aae8c  ! 45: SMUL_I	smul 	%r10, 0x0e8c, %r16
	.word 0xc3ea900b  ! 46: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0xccaaa13c  ! 49: STBA_I	stba	%r6, [%r10 + 0x013c] %asi
	.word 0xf0eaa5a4  ! 52: LDSTUBA_I	ldstuba	%r24, [%r10 + 0x05a4] %asi
	.word 0xd07a800b  ! 53: SWAP_R	swap	%r8, [%r10 + %r11]
	.word 0x82f2a328  ! 54: UDIVcc_I	udivcc 	%r10, 0x0328, %r1
	.word 0x8143e042  ! 56: MEMBAR	membar	#StoreLoad | #Sync 
	.word 0x8c72800b  ! 57: UDIV_R	udiv 	%r10, %r11, %r6
	.word 0x836aaff0  ! 58: SDIVX_I	sdivx	%r10, 0x0ff0, %r1
	.word 0x10800003  ! 59: BA	ba  	<label_0x3>
	.word 0xd0c2a730  ! 60: LDSWA_I	ldswa	[%r10, + 0x0730] %asi, %r8
	.word 0xd282900b  ! 61: LDUWA_R	lduwa	[%r10, %r11] 0x80, %r9
	.word 0xcc6a800b  ! 62: LDSTUB_R	ldstub	%r6, [%r10 + %r11]
	.word 0x8922800b  ! 63: MULScc_R	mulscc 	%r10, %r11, %r4
	.word 0xb67a800b  ! 64: SDIV_R	sdiv 	%r10, %r11, %r27
	.word 0xc7e2a00b  ! 65: CASA_R	casa	[%r10] %asi, %r11, %r3
	.word 0xc842a7a0  ! 66: LDSW_I	ldsw	[%r10 + 0x07a0], %r4
	.word 0x8143e04c  ! 67: MEMBAR	membar	#LoadStore | #StoreStore | #Sync 
	.word 0xf4c2900b  ! 68: LDSWA_R	ldswa	[%r10, %r11] 0x80, %r26
	.word 0xf612af4c  ! 69: LDUH_I	lduh	[%r10 + 0x0f4c], %r27
	.word 0x8143e013  ! 70: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside 
	.word 0xc93aaa30  ! 71: STDF_I	std	%f4, [0x0a30, %r10]
	.word 0x88f2800b  ! 72: UDIVcc_R	udivcc 	%r10, %r11, %r4
	.word 0xc3eaa140  ! 73: PREFETCHA_I	prefetcha	[%r10, + 0x0140] %asi, #one_read
	.word 0x2cca0001  ! 74: BRGZ	brgz,a,pt	%8,<label_0xa0001>
	.word 0x87da800b  ! 75: FLUSH_R	dis not found

	.word 0xd3e2a00b  ! 76: CASA_R	casa	[%r10] %asi, %r11, %r9
	.word 0x82f2ab90  ! 77: UDIVcc_I	udivcc 	%r10, 0x0b90, %r1
	.word 0x0c800001  ! 78: BNEG	bneg  	<label_0x1>
	.word 0x16800003  ! 79: BGE	bge  	<label_0x3>
	.word 0xd322800b  ! 80: STF_R	st	%f9, [%r11, %r10]
	.word 0xf6eaa8dc  ! 81: LDSTUBA_I	ldstuba	%r27, [%r10 + 0x08dc] %asi
	.word 0x8143c000  ! 82: STBAR	stbar
	.word 0xc4baa330  ! 83: STDA_I	stda	%r2, [%r10 + 0x0330] %asi
	.word 0x8143c000  ! 84: STBAR	stbar
	.word 0x02c20003  ! 85: BRZ	brz  ,nt	%8,<label_0x20003>
	.word 0x87a2892b  ! 86: FMULs	fmuls	%f10, %f11, %f3
	.word 0x824a800b  ! 87: MULX_R	mulx 	%r10, %r11, %r1
	.word 0x82daa6c4  ! 88: SMULcc_I	smulcc 	%r10, 0x06c4, %r1
	.word 0x9fdaa99c  ! 89: FLUSH_I	dis not found

	.word 0xe882900b  ! 90: LDUWA_R	lduwa	[%r10, %r11] 0x80, %r20
	.word 0x8143e048  ! 91: MEMBAR	membar	#StoreStore | #Sync 
	.word 0x2a800001  ! 92: BCS	bcs,a	<label_0x1>
	.word 0xd202800b  ! 93: LDUW_R	lduw	[%r10 + %r11], %r9
	.word 0xc3e2a00b  ! 94: CASA_R	casa	[%r10] %asi, %r11, %r1
	.word 0x88da800b  ! 95: SMULcc_R	smulcc 	%r10, %r11, %r4
	.word 0x8143c000  ! 96: STBAR	stbar
	.word 0xc3eaa1c4  ! 97: PREFETCHA_I	prefetcha	[%r10, + 0x01c4] %asi, #one_read
	.word 0xaa4a800b  ! 99: MULX_R	mulx 	%r10, %r11, %r21
	.word 0x8143c000  ! 100: STBAR	stbar
	.word 0xb0da800b  ! 101: SMULcc_R	smulcc 	%r10, %r11, %r24
	.word 0xe412800b  ! 102: LDUH_R	lduh	[%r10 + %r11], %r18
	.word 0xc93a800b  ! 103: STDF_R	std	%f4, [%r11, %r10]
	.word 0xf48a900b  ! 104: LDUBA_R	lduba	[%r10, %r11] 0x80, %r26
	.word 0x8143c000  ! 105: STBAR	stbar
	.word 0xd0ba900b  ! 106: STDA_R	stda	%r8, [%r10 + %r11] 0x80
	.word 0xc652800b  ! 107: LDSH_R	ldsh	[%r10 + %r11], %r3
	.word 0xfe52a340  ! 108: LDSH_I	ldsh	[%r10 + 0x0340], %r31
	.word 0xbfda800b  ! 109: FLUSH_R	dis not found

	.word 0xe2ca900b  ! 110: LDSBA_R	ldsba	[%r10, %r11] 0x80, %r17
	.word 0xcc0a800b  ! 111: LDUB_R	ldub	[%r10 + %r11], %r6
	.word 0xe1e2a00b  ! 112: CASA_R	casa	[%r10] %asi, %r11, %r16
	.word 0x3a800001  ! 113: BCC	bcc,a	<label_0x1>
	.word 0xafdaa1c8  ! 114: FLUSH_I	dis not found

	.word 0xed3a800b  ! 115: STDF_R	std	%f22, [%r11, %r10]
	.word 0x8143c000  ! 116: STBAR	stbar
	.word 0xfe6aaeac  ! 117: LDSTUB_I	ldstub	%r31, [%r10 + 0x0eac]
	.word 0xc36a800b  ! 118: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0xcca2900b  ! 119: STWA_R	stwa	%r6, [%r10 + %r11] 0x80
	.word 0x87da800b  ! 120: FLUSH_R	dis not found

	.word 0xd122800b  ! 122: STF_R	st	%f8, [%r11, %r10]
	.word 0x985aa300  ! 123: SMUL_I	smul 	%r10, 0x0300, %r12
	.word 0xd00a800b  ! 124: LDUB_R	ldub	[%r10 + %r11], %r8
	.word 0xfc12afcc  ! 126: LDUH_I	lduh	[%r10 + 0x0fcc], %r30
	.word 0xec42ad28  ! 128: LDSW_I	ldsw	[%r10 + 0x0d28], %r22
	.word 0xfc6a800b  ! 129: LDSTUB_R	ldstub	%r30, [%r10 + %r11]
	.word 0x8143e016  ! 130: MEMBAR	membar	#StoreLoad | #LoadStore | #Lookaside 
	.word 0xd00aa9a8  ! 131: LDUB_I	ldub	[%r10 + 0x09a8], %r8
	.word 0xc612aa34  ! 132: LDUH_I	lduh	[%r10 + 0x0a34], %r3
	.word 0xa8f2800b  ! 133: UDIVcc_R	udivcc 	%r10, %r11, %r20
	.word 0x9272a9c8  ! 134: UDIV_I	udiv 	%r10, 0x09c8, %r9
	.word 0xf4b2900b  ! 135: STHA_R	stha	%r26, [%r10 + %r11] 0x80
	.word 0xc652800b  ! 136: LDSH_R	ldsh	[%r10 + %r11], %r3
	.word 0x8143e018  ! 137: MEMBAR	membar	#StoreStore | #Lookaside 
	.word 0xc3ea900b  ! 138: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0xd0caa804  ! 139: LDSBA_I	ldsba	[%r10, + 0x0804] %asi, %r8
	.word 0x18800003  ! 141: BGU	bgu  	<label_0x3>
	.word 0xf452800b  ! 142: LDSH_R	ldsh	[%r10 + %r11], %r26
	.word 0x8ada800b  ! 143: SMULcc_R	smulcc 	%r10, %r11, %r5
	.word 0xc28a900b  ! 144: LDUBA_R	lduba	[%r10, %r11] 0x80, %r1
	.word 0xca82af7c  ! 145: LDUWA_I	lduwa	[%r10, + 0x0f7c] %asi, %r5
	.word 0x8143c000  ! 146: STBAR	stbar
	.word 0xdcfa900b  ! 147: SWAPA_R	swapa	%r14, [%r10 + %r11] 0x80
	.word 0xcb3aa7a0  ! 148: STDF_I	std	%f5, [0x07a0, %r10]
	.word 0x2a800001  ! 149: BCS	bcs,a	<label_0x1>
	.word 0xcb22a3bc  ! 150: STF_I	st	%f5, [0x03bc, %r10]
	.word 0xc3eaa5bc  ! 151: PREFETCHA_I	prefetcha	[%r10, + 0x05bc] %asi, #one_read
	.word 0x8143e050  ! 152: MEMBAR	membar	#Lookaside | #Sync 
	.word 0x8143c000  ! 153: STBAR	stbar
	.word 0xcab2a590  ! 154: STHA_I	stha	%r5, [%r10 + 0x0590] %asi
	.word 0x8143e056  ! 155: MEMBAR	membar	#StoreLoad | #LoadStore | #Lookaside | #Sync 
	.word 0xcc92900b  ! 156: LDUHA_R	lduha	[%r10, %r11] 0x80, %r6
	.word 0xe4ba900b  ! 157: STDA_R	stda	%r18, [%r10 + %r11] 0x80
	.word 0xc2c2a19c  ! 158: LDSWA_I	ldswa	[%r10, + 0x019c] %asi, %r1
	.word 0x0a800001  ! 159: BCS	bcs  	<label_0x1>
	.word 0x8fdaaa0c  ! 160: FLUSH_I	dis not found

	.word 0xe052ae1c  ! 161: LDSH_I	ldsh	[%r10 + 0x0e1c], %r16
	.word 0xcd22800b  ! 162: STF_R	st	%f6, [%r11, %r10]
	.word 0xd892a89c  ! 163: LDUHA_I	lduha	[%r10, + 0x089c] %asi, %r12
	.word 0xa1daa228  ! 164: FLUSH_I	dis not found

	.word 0x924aaf00  ! 165: MULX_I	mulx 	%r10, 0x0f00, %r9
	.word 0x3a800001  ! 166: BCC	bcc,a	<label_0x1>
	.word 0xd24aa66c  ! 167: LDSB_I	ldsb	[%r10 + 0x066c], %r9
	.word 0xba7aa994  ! 168: SDIV_I	sdiv 	%r10, 0x0994, %r29
	.word 0x8143c000  ! 169: STBAR	stbar
	.word 0x8143c000  ! 170: STBAR	stbar
	.word 0xa252affc  ! 171: UMUL_I	umul 	%r10, 0x0ffc, %r17
	.word 0xc3eaa7b0  ! 172: PREFETCHA_I	prefetcha	[%r10, + 0x07b0] %asi, #one_read
	.word 0xec0aaa5c  ! 173: LDUB_I	ldub	[%r10 + 0x0a5c], %r22
	.word 0xcca2900b  ! 174: STWA_R	stwa	%r6, [%r10 + %r11] 0x80
	.word 0x89a289ab  ! 175: FDIVs	fdivs	%f10, %f11, %f4
	.word 0xc8f2aa30  ! 176: STXA_I	stxa	%r4, [%r10 + 0x0a30] %asi
	.word 0xbf22a3f0  ! 177: MULScc_I	mulscc 	%r10, 0x03f0, %r31
	.word 0x8143c000  ! 178: STBAR	stbar
	.word 0xdcfa900b  ! 179: SWAPA_R	swapa	%r14, [%r10 + %r11] 0x80
	.word 0xccbaa7c0  ! 180: STDA_I	stda	%r6, [%r10 + 0x07c0] %asi
	.word 0x2a800003  ! 181: BCS	bcs,a	<label_0x3>
	.word 0xdafa900b  ! 182: SWAPA_R	swapa	%r13, [%r10 + %r11] 0x80
	.word 0x8143c000  ! 183: STBAR	stbar
	.word 0xf3f2a00b  ! 184: CASXA_R	casxa	[%r10]%asi, %r11, %r25
	.word 0x8143e044  ! 185: MEMBAR	membar	#LoadStore | #Sync 
	.word 0xca02a010  ! 186: LDUW_I	lduw	[%r10 + 0x0010], %r5
	.word 0xc5f2900b  ! 187: CASXA_I	casxa	[%r10] 0x80, %r11, %r2
	.word 0x8fa289ab  ! 188: FDIVs	fdivs	%f10, %f11, %f7
	.word 0x10800001  ! 189: BA	ba  	<label_0x1>
	.word 0xc36aa928  ! 190: PREFETCH_I	prefetch	[%r10 + 0x0928], #one_read
	.word 0x22800003  ! 191: BE	be,a	<label_0x3>
	.word 0xda4a800b  ! 192: LDSB_R	ldsb	[%r10 + %r11], %r13
	.word 0xe09aadf8  ! 193: LDDA_I	ldda	[%r10, + 0x0df8] %asi, %r16
	.word 0xa1da800b  ! 194: FLUSH_R	dis not found

	.word 0xa4d2800b  ! 195: UMULcc_R	umulcc 	%r10, %r11, %r18
	.word 0xa1da800b  ! 196: FLUSH_R	dis not found

	.word 0xa7a288ab  ! 197: FSUBs	fsubs	%f10, %f11, %f19
	.word 0xf2aaa874  ! 198: STBA_I	stba	%r25, [%r10 + 0x0874] %asi
	.word 0x3e800001  ! 199: BVC	bvc,a	<label_0x1>
	.word 0x8143e07d  ! 200: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xbba289ab  ! 201: FDIVs	fdivs	%f10, %f11, %f29
	.word 0xc41aa710  ! 202: LDD_I	ldd	[%r10 + 0x0710], %r2
	.word 0xfd3aa6b8  ! 203: STDF_I	std	%f30, [0x06b8, %r10]
	.word 0xc36a800b  ! 204: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0xc8a2900b  ! 206: STWA_R	stwa	%r4, [%r10 + %r11] 0x80
	.word 0xd0f2a9a0  ! 207: STXA_I	stxa	%r8, [%r10 + 0x09a0] %asi
	.word 0x8ba2892b  ! 208: FMULs	fmuls	%f10, %f11, %f5
	.word 0x88d2800b  ! 209: UMULcc_R	umulcc 	%r10, %r11, %r4
	.word 0xdc8a900b  ! 210: LDUBA_R	lduba	[%r10, %r11] 0x80, %r14
	.word 0x8143e075  ! 211: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside | #MemIssue | #Sync 
	.word 0xdde2a00b  ! 212: CASA_R	casa	[%r10] %asi, %r11, %r14
	.word 0x904a800b  ! 213: MULX_R	mulx 	%r10, %r11, %r8
	.word 0x8143c000  ! 214: STBAR	stbar
	.word 0xc682900b  ! 215: LDUWA_R	lduwa	[%r10, %r11] 0x80, %r3
	.word 0x93daac58  ! 216: FLUSH_I	dis not found

	.word 0xe682a158  ! 217: LDUWA_I	lduwa	[%r10, + 0x0158] %asi, %r19
	.word 0x8472800b  ! 218: UDIV_R	udiv 	%r10, %r11, %r2
	.word 0xb4d2800b  ! 219: UMULcc_R	umulcc 	%r10, %r11, %r26
	.word 0x8ddaa8b8  ! 220: FLUSH_I	dis not found

	.word 0xe40a800b  ! 221: LDUB_R	ldub	[%r10 + %r11], %r18
	.word 0xc20aa330  ! 222: LDUB_I	ldub	[%r10 + 0x0330], %r1
	.word 0x82faa5b8  ! 223: SDIVcc_I	sdivcc 	%r10, 0x05b8, %r1
	.word 0xdea2a658  ! 224: STWA_I	stwa	%r15, [%r10 + 0x0658] %asi
	.word 0xc3eaa4fc  ! 225: PREFETCHA_I	prefetcha	[%r10, + 0x04fc] %asi, #one_read
	.word 0xd0b2900b  ! 226: STHA_R	stha	%r8, [%r10 + %r11] 0x80
	.word 0x26c20003  ! 227: BRLZ	brlz,a,nt	%8,<label_0x20003>
	.word 0xc412800b  ! 228: LDUH_R	lduh	[%r10 + %r11], %r2
	.word 0x8143e071  ! 229: MEMBAR	membar	#LoadLoad | #Lookaside | #MemIssue | #Sync 
	.word 0xd04aaea8  ! 230: LDSB_I	ldsb	[%r10 + 0x0ea8], %r8
	.word 0xc73a800b  ! 231: STDF_R	std	%f3, [%r11, %r10]
	.word 0xc60aae98  ! 232: LDUB_I	ldub	[%r10 + 0x0e98], %r3
	.word 0x8143e06b  ! 233: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #MemIssue | #Sync 
	.word 0xce02800b  ! 234: LDUW_R	lduw	[%r10 + %r11], %r7
	.word 0xcc1a800b  ! 235: LDD_R	ldd	[%r10 + %r11], %r6
	.word 0x926aa8d8  ! 236: UDIVX_I	udivx 	%r10, 0x08d8, %r9
	.word 0x9dda800b  ! 237: FLUSH_R	dis not found

	.word 0xd2d2a764  ! 238: LDSHA_I	ldsha	[%r10, + 0x0764] %asi, %r9
	.word 0xbbdaa558  ! 239: FLUSH_I	dis not found

	.word 0xe8ca900b  ! 240: LDSBA_R	ldsba	[%r10, %r11] 0x80, %r20
	.word 0x8143e015  ! 241: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside 
	.word 0xc36a800b  ! 242: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0xf81aa468  ! 243: LDD_I	ldd	[%r10 + 0x0468], %r28
	.word 0xd84aa760  ! 244: LDSB_I	ldsb	[%r10 + 0x0760], %r12
	.word 0xd1f2a00b  ! 245: CASXA_R	casxa	[%r10]%asi, %r11, %r8
	.word 0xa522aec4  ! 246: MULScc_I	mulscc 	%r10, 0x0ec4, %r18
	.word 0x8143e03c  ! 248: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0xc20aa38c  ! 250: LDUB_I	ldub	[%r10 + 0x038c], %r1
	.word 0x04800001  ! 251: BLE	ble  	<label_0x1>
	.word 0xc292a4d0  ! 252: LDUHA_I	lduha	[%r10, + 0x04d0] %asi, %r1
	.word 0x04800001  ! 253: BLE	ble  	<label_0x1>
	.word 0xc6c2ac38  ! 254: LDSWA_I	ldswa	[%r10, + 0x0c38] %asi, %r3
	.word 0x8322abbc  ! 255: MULScc_I	mulscc 	%r10, 0x0bbc, %r1
	.word 0x8143e047  ! 256: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Sync 
	.word 0x8143c000  ! 257: STBAR	stbar
	.word 0xe5f2a00b  ! 258: CASXA_R	casxa	[%r10]%asi, %r11, %r18
	.word 0xe6d2a7a8  ! 259: LDSHA_I	ldsha	[%r10, + 0x07a8] %asi, %r19
	.word 0xc4ea900b  ! 260: LDSTUBA_R	ldstuba	%r2, [%r10 + %r11] 0x80
	.word 0x18800001  ! 261: BGU	bgu  	<label_0x1>
	.word 0xdafa900b  ! 262: SWAPA_R	swapa	%r13, [%r10 + %r11] 0x80
	.word 0xceeaac30  ! 263: LDSTUBA_I	ldstuba	%r7, [%r10 + 0x0c30] %asi
	.word 0xc8ba900b  ! 264: STDA_R	stda	%r4, [%r10 + %r11] 0x80
	.word 0xc36a800b  ! 265: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0xec12aff0  ! 266: LDUH_I	lduh	[%r10 + 0x0ff0], %r22
	.word 0xd24aa50c  ! 267: LDSB_I	ldsb	[%r10 + 0x050c], %r9
	.word 0x8143c000  ! 268: STBAR	stbar
	.word 0xe81aa498  ! 269: LDD_I	ldd	[%r10 + 0x0498], %r20
	.word 0x87da800b  ! 270: FLUSH_R	dis not found

	.word 0x8143c000  ! 271: STBAR	stbar
	.word 0x8a52800b  ! 272: UMUL_R	umul 	%r10, %r11, %r5
	.word 0xc66a800b  ! 273: LDSTUB_R	ldstub	%r3, [%r10 + %r11]
	.word 0xceaaa120  ! 274: STBA_I	stba	%r7, [%r10 + 0x0120] %asi
	.word 0xd27aad1c  ! 275: SWAP_I	swap	%r9, [%r10 + 0x0d1c]
	.word 0x26ca0003  ! 276: BRLZ	brlz,a,pt	%8,<label_0xa0003>
	.word 0x8ad2800b  ! 277: UMULcc_R	umulcc 	%r10, %r11, %r5
	.word 0xc3eaae14  ! 278: PREFETCHA_I	prefetcha	[%r10, + 0x0e14] %asi, #one_read
	.word 0x927aa84c  ! 279: SDIV_I	sdiv 	%r10, 0x084c, %r9
	.word 0x8143c000  ! 280: STBAR	stbar
	.word 0x8143e078  ! 281: MEMBAR	membar	#StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0x8143e04e  ! 282: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Sync 
	.word 0xd012a1f0  ! 283: LDUH_I	lduh	[%r10 + 0x01f0], %r8
	.word 0x0eca0001  ! 284: BRGEZ	brgez  ,pt	%8,<label_0xa0001>
	.word 0x9872800b  ! 285: UDIV_R	udiv 	%r10, %r11, %r12
	.word 0xb3daa8bc  ! 286: FLUSH_I	dis not found

	.word 0xaa5a800b  ! 287: SMUL_R	smul 	%r10, %r11, %r21
	.word 0x8e7a800b  ! 288: SDIV_R	sdiv 	%r10, %r11, %r7
	.word 0xf242800b  ! 289: LDSW_R	ldsw	[%r10 + %r11], %r25
	.word 0xe8aaaa2c  ! 290: STBA_I	stba	%r20, [%r10 + 0x0a2c] %asi
	.word 0xfed2900b  ! 291: LDSHA_R	ldsha	[%r10, %r11] 0x80, %r31
	.word 0x40000001  ! 292: CALL	call	disp30_1
	.word 0xd06a800b  ! 293: LDSTUB_R	ldstub	%r8, [%r10 + %r11]
	.word 0xd09a900b  ! 294: LDDA_R	ldda	[%r10, %r11] 0x80, %r8
	.word 0x8143c000  ! 295: STBAR	stbar
	.word 0x92faafa4  ! 296: SDIVcc_I	sdivcc 	%r10, 0x0fa4, %r9
	.word 0x8143c000  ! 297: STBAR	stbar
	.word 0xa6da800b  ! 298: SMULcc_R	smulcc 	%r10, %r11, %r19
	.word 0xfe52800b  ! 299: LDSH_R	ldsh	[%r10 + %r11], %r31
	.word 0xc6f2900b  ! 300: STXA_R	stxa	%r3, [%r10 + %r11] 0x80
	.word 0xc89a900b  ! 301: LDDA_R	ldda	[%r10, %r11] 0x80, %r4
	.word 0xe26aa940  ! 302: LDSTUB_I	ldstub	%r17, [%r10 + 0x0940]
	.word 0xc3e2a00b  ! 303: CASA_R	casa	[%r10] %asi, %r11, %r1
	.word 0x9bda800b  ! 304: FLUSH_R	dis not found

	.word 0x93da800b  ! 305: FLUSH_R	dis not found

	.word 0xc3eaa900  ! 306: PREFETCHA_I	prefetcha	[%r10, + 0x0900] %asi, #one_read
	.word 0x02c20003  ! 307: BRZ	brz  ,nt	%8,<label_0x20003>
	.word 0xec9a900b  ! 308: LDDA_R	ldda	[%r10, %r11] 0x80, %r22
	.word 0xa3daa2a8  ! 309: FLUSH_I	dis not found

	.word 0x8143e079  ! 310: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0x924aa2bc  ! 312: MULX_I	mulx 	%r10, 0x02bc, %r9
	.word 0xb05aa4c4  ! 313: SMUL_I	smul 	%r10, 0x04c4, %r24
	.word 0xcab2a638  ! 314: STHA_I	stha	%r5, [%r10 + 0x0638] %asi
	.word 0xfa6aa914  ! 315: LDSTUB_I	ldstub	%r29, [%r10 + 0x0914]
	.word 0xccbaa8f8  ! 316: STDA_I	stda	%r6, [%r10 + 0x08f8] %asi
	.word 0x8143c000  ! 317: STBAR	stbar
	.word 0xe122a974  ! 318: STF_I	st	%f16, [0x0974, %r10]
	.word 0x40000001  ! 319: CALL	call	disp30_1
	.word 0x8cf2800b  ! 320: UDIVcc_R	udivcc 	%r10, %r11, %r6
	.word 0x40000003  ! 321: CALL	call	disp30_3
	.word 0x88d2ac90  ! 322: UMULcc_I	umulcc 	%r10, 0x0c90, %r4
	.word 0x8cda800b  ! 323: SMULcc_R	smulcc 	%r10, %r11, %r6
	.word 0x87daa454  ! 324: FLUSH_I	dis not found

	.word 0x916aa1ac  ! 325: SDIVX_I	sdivx	%r10, 0x01ac, %r8
	.word 0xc36a800b  ! 326: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x8143c000  ! 327: STBAR	stbar
	.word 0x8143c000  ! 328: STBAR	stbar
	.word 0xec82900b  ! 329: LDUWA_R	lduwa	[%r10, %r11] 0x80, %r22
	.word 0xfcaa900b  ! 330: STBA_R	stba	%r30, [%r10 + %r11] 0x80
	.word 0xc2ea900b  ! 331: LDSTUBA_R	ldstuba	%r1, [%r10 + %r11] 0x80
	.word 0x24800001  ! 332: BLE	ble,a	<label_0x1>
	.word 0xad6aa068  ! 333: SDIVX_I	sdivx	%r10, 0x0068, %r22
	.word 0x0ac20003  ! 334: BRNZ	brnz  ,nt	%8,<label_0x20003>
	.word 0xc2ea900b  ! 335: LDSTUBA_R	ldstuba	%r1, [%r10 + %r11] 0x80
	.word 0xc26aa7d0  ! 336: LDSTUB_I	ldstub	%r1, [%r10 + 0x07d0]
	.word 0x8c7aacb0  ! 337: SDIV_I	sdiv 	%r10, 0x0cb0, %r6
	.word 0x8143e052  ! 338: MEMBAR	membar	#StoreLoad | #Lookaside | #Sync 
	.word 0xe0c2aff0  ! 339: LDSWA_I	ldswa	[%r10, + 0x0ff0] %asi, %r16
	.word 0x0e800001  ! 340: BVS	bvs  	<label_0x1>
	.word 0xd0c2aa78  ! 341: LDSWA_I	ldswa	[%r10, + 0x0a78] %asi, %r8
	.word 0xb7a2892b  ! 342: FMULs	fmuls	%f10, %f11, %f27
	.word 0xc4b2a0dc  ! 343: STHA_I	stha	%r2, [%r10 + 0x00dc] %asi
	.word 0x8143e006  ! 344: MEMBAR	membar	#StoreLoad | #LoadStore 
	.word 0xced2900b  ! 345: LDSHA_R	ldsha	[%r10, %r11] 0x80, %r7
	.word 0xaba2892b  ! 346: FMULs	fmuls	%f10, %f11, %f21
	.word 0x89da800b  ! 347: FLUSH_R	dis not found

	.word 0x2c800001  ! 348: BNEG	bneg,a	<label_0x1>
	.word 0xce42aef4  ! 349: LDSW_I	ldsw	[%r10 + 0x0ef4], %r7
	.word 0x00800001  ! 350: BN	bn  	<label_0x1>
	.word 0x8b22a8d4  ! 351: MULScc_I	mulscc 	%r10, 0x08d4, %r5
	.word 0x82f2800b  ! 352: UDIVcc_R	udivcc 	%r10, %r11, %r1
	.word 0xc36aae20  ! 353: PREFETCH_I	prefetch	[%r10 + 0x0e20], #one_read
	.word 0xcef2900b  ! 354: STXA_R	stxa	%r7, [%r10 + %r11] 0x80
	.word 0x3e800003  ! 355: BVC	bvc,a	<label_0x3>
	.word 0xcec2aed0  ! 356: LDSWA_I	ldswa	[%r10, + 0x0ed0] %asi, %r7
	.word 0x83a2892b  ! 358: FMULs	fmuls	%f10, %f11, %f1
	.word 0x22ca0003  ! 359: BRZ	brz,a,pt	%8,<label_0xa0003>
	.word 0x0cc20001  ! 360: BRGZ	brgz  ,nt	%8,<label_0x20001>
	.word 0x93da800b  ! 361: FLUSH_R	dis not found

	.word 0xfeeaa6f0  ! 362: LDSTUBA_I	ldstuba	%r31, [%r10 + 0x06f0] %asi
	.word 0xd13aac30  ! 363: STDF_I	std	%f8, [0x0c30, %r10]
	.word 0x884aa82c  ! 364: MULX_I	mulx 	%r10, 0x082c, %r4
	.word 0xc81aa888  ! 365: LDD_I	ldd	[%r10 + 0x0888], %r4
	.word 0xd06a800b  ! 366: LDSTUB_R	ldstub	%r8, [%r10 + %r11]
	.word 0xd052a6c0  ! 367: LDSH_I	ldsh	[%r10 + 0x06c0], %r8
	.word 0x8143c000  ! 368: STBAR	stbar
	.word 0xfd22ab5c  ! 369: STF_I	st	%f30, [0x0b5c, %r10]
	.word 0xc36aafc0  ! 370: PREFETCH_I	prefetch	[%r10 + 0x0fc0], #one_read
	.word 0x1c800001  ! 371: BPOS	bpos  	<label_0x1>
	.word 0x04ca0003  ! 372: BRLEZ	brlez  ,pt	%8,<label_0xa0003>
	.word 0xe81a800b  ! 373: LDD_R	ldd	[%r10 + %r11], %r20
	.word 0xdab2acd0  ! 374: STHA_I	stha	%r13, [%r10 + 0x0cd0] %asi
	.word 0xc73a800b  ! 375: STDF_R	std	%f3, [%r11, %r10]
	.word 0xb472800b  ! 376: UDIV_R	udiv 	%r10, %r11, %r26
	.word 0x8143e027  ! 377: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #MemIssue 
	.word 0xcc1aac98  ! 378: LDD_I	ldd	[%r10 + 0x0c98], %r6
	.word 0xccc2a52c  ! 379: LDSWA_I	ldswa	[%r10, + 0x052c] %asi, %r6
	.word 0x8143e00b  ! 380: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore 
	.word 0x2c800001  ! 381: BNEG	bneg,a	<label_0x1>
	.word 0xc53aa478  ! 382: STDF_I	std	%f2, [0x0478, %r10]
	.word 0xc6d2900b  ! 383: LDSHA_R	ldsha	[%r10, %r11] 0x80, %r3
	.word 0xc80a800b  ! 384: LDUB_R	ldub	[%r10 + %r11], %r4
	.word 0xbef2a238  ! 385: UDIVcc_I	udivcc 	%r10, 0x0238, %r31
	.word 0xc36aa0a8  ! 386: PREFETCH_I	prefetch	[%r10 + 0x00a8], #one_read
	.word 0x2e800003  ! 387: BVS	bvs,a	<label_0x3>
	.word 0x8143e03c  ! 388: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0xd9f2a00b  ! 389: CASXA_R	casxa	[%r10]%asi, %r11, %r12
	.word 0x9fdaa420  ! 390: FLUSH_I	dis not found

	.word 0x876a800b  ! 391: SDIVX_R	sdivx	%r10, %r11, %r3
	.word 0xac4a800b  ! 392: MULX_R	mulx 	%r10, %r11, %r22
	.word 0xb452800b  ! 393: UMUL_R	umul 	%r10, %r11, %r26
	.word 0xcdf2900b  ! 394: CASXA_I	casxa	[%r10] 0x80, %r11, %r6
	.word 0x91da800b  ! 395: FLUSH_R	dis not found

	.word 0xd122a130  ! 396: STF_I	st	%f8, [0x0130, %r10]
	.word 0x8ddaa158  ! 397: FLUSH_I	dis not found

	.word 0x8143c000  ! 398: STBAR	stbar
	.word 0xd0baad18  ! 399: STDA_I	stda	%r8, [%r10 + 0x0d18] %asi
	.word 0x8143c000  ! 400: STBAR	stbar
	.word 0x85da800b  ! 401: FLUSH_R	dis not found

	.word 0x26c20003  ! 402: BRLZ	brlz,a,nt	%8,<label_0x20003>
	.word 0x8e72a188  ! 403: UDIV_I	udiv 	%r10, 0x0188, %r7
	.word 0xc81a800b  ! 404: LDD_R	ldd	[%r10 + %r11], %r4
	.word 0xc36aa2c0  ! 405: PREFETCH_I	prefetch	[%r10 + 0x02c0], #one_read
	.word 0x3c800001  ! 406: BPOS	bpos,a	<label_0x1>
	.word 0x916a800b  ! 407: SDIVX_R	sdivx	%r10, %r11, %r8
	.word 0x896aa7e4  ! 408: SDIVX_I	sdivx	%r10, 0x07e4, %r4
	.word 0x85a289ab  ! 409: FDIVs	fdivs	%f10, %f11, %f2
	.word 0x8fa2892b  ! 410: FMULs	fmuls	%f10, %f11, %f7
	.word 0x8143c000  ! 412: STBAR	stbar
	.word 0xc25aa640  ! 413: LDX_I	ldx	[%r10 + 0x0640], %r1
	.word 0xf41a800b  ! 414: LDD_R	ldd	[%r10 + %r11], %r26
	.word 0xecda900b  ! 415: LDXA_R	ldxa	[%r10, %r11] 0x80, %r22
	.word 0x8d22ac9c  ! 417: MULScc_I	mulscc 	%r10, 0x0c9c, %r6
	.word 0xc412accc  ! 418: LDUH_I	lduh	[%r10 + 0x0ccc], %r2
	.word 0xde02800b  ! 419: LDUW_R	lduw	[%r10 + %r11], %r15
	.word 0xd0eaa374  ! 420: LDSTUBA_I	ldstuba	%r8, [%r10 + 0x0374] %asi
	.word 0x1c800001  ! 421: BPOS	bpos  	<label_0x1>
	.word 0xb3daab9c  ! 422: FLUSH_I	dis not found

	.word 0xce42aedc  ! 423: LDSW_I	ldsw	[%r10 + 0x0edc], %r7
	.word 0xe73aafa0  ! 424: STDF_I	std	%f19, [0x0fa0, %r10]
	.word 0x8922800b  ! 425: MULScc_R	mulscc 	%r10, %r11, %r4
	.word 0x905aa8a4  ! 426: SMUL_I	smul 	%r10, 0x08a4, %r8
	.word 0x8ed2a8e8  ! 427: UMULcc_I	umulcc 	%r10, 0x08e8, %r7
	.word 0x8143e06a  ! 428: MEMBAR	membar	#StoreLoad | #StoreStore | #MemIssue | #Sync 
	.word 0xb9daaa40  ! 429: FLUSH_I	dis not found

	.word 0xe66aa358  ! 430: LDSTUB_I	ldstub	%r19, [%r10 + 0x0358]
	.word 0xcad2a3ec  ! 431: LDSHA_I	ldsha	[%r10, + 0x03ec] %asi, %r5
	.word 0xe86aac60  ! 432: LDSTUB_I	ldstub	%r20, [%r10 + 0x0c60]
	.word 0xceb2900b  ! 433: STHA_R	stha	%r7, [%r10 + %r11] 0x80
	.word 0xe3e2900b  ! 434: CASA_I	casa	[%r10] 0x80, %r11, %r17
	.word 0xa07a800b  ! 435: SDIV_R	sdiv 	%r10, %r11, %r16
	.word 0x8fda800b  ! 436: FLUSH_R	dis not found

	.word 0x1e800003  ! 437: BVC	bvc  	<label_0x3>
	.word 0x827a800b  ! 438: SDIV_R	sdiv 	%r10, %r11, %r1
	.word 0x8e6a800b  ! 439: UDIVX_R	udivx 	%r10, %r11, %r7
	.word 0x8652800b  ! 440: UMUL_R	umul 	%r10, %r11, %r3
	.word 0x85da800b  ! 441: FLUSH_R	dis not found

	.word 0xb652a2c0  ! 442: UMUL_I	umul 	%r10, 0x02c0, %r27
	.word 0x856aad60  ! 443: SDIVX_I	sdivx	%r10, 0x0d60, %r2
	.word 0xc3ea900b  ! 444: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0xce82a1c8  ! 445: LDUWA_I	lduwa	[%r10, + 0x01c8] %asi, %r7
	.word 0x8bda800b  ! 446: FLUSH_R	dis not found

	.word 0x8af2a014  ! 448: UDIVcc_I	udivcc 	%r10, 0x0014, %r5
	.word 0x8143c000  ! 449: STBAR	stbar
	.word 0x8bda800b  ! 450: FLUSH_R	dis not found

	.word 0xc922800b  ! 451: STF_R	st	%f4, [%r11, %r10]
	.word 0xb5daa4b8  ! 452: FLUSH_I	dis not found

	.word 0x8e5aabac  ! 453: SMUL_I	smul 	%r10, 0x0bac, %r7
	.word 0x8143e045  ! 454: MEMBAR	membar	#LoadLoad | #LoadStore | #Sync 
	.word 0xec92900b  ! 457: LDUHA_R	lduha	[%r10, %r11] 0x80, %r22
	.word 0xdc12800b  ! 458: LDUH_R	lduh	[%r10 + %r11], %r14
	.word 0xfcaaaa2c  ! 459: STBA_I	stba	%r30, [%r10 + 0x0a2c] %asi
	.word 0x89daafb8  ! 460: FLUSH_I	dis not found

	.word 0xca82aaf8  ! 461: LDUWA_I	lduwa	[%r10, + 0x0af8] %asi, %r5
	.word 0xca02800b  ! 462: LDUW_R	lduw	[%r10 + %r11], %r5
	.word 0x26c20003  ! 463: BRLZ	brlz,a,nt	%8,<label_0x20003>
	.word 0xc36aaad0  ! 464: PREFETCH_I	prefetch	[%r10 + 0x0ad0], #one_read
	.word 0xc8ca900b  ! 465: LDSBA_R	ldsba	[%r10, %r11] 0x80, %r4
	.word 0x8143c000  ! 466: STBAR	stbar
	.word 0x2a800003  ! 467: BCS	bcs,a	<label_0x3>
	.word 0x8e5aa90c  ! 468: SMUL_I	smul 	%r10, 0x090c, %r7
	.word 0xc9f2a00b  ! 469: CASXA_R	casxa	[%r10]%asi, %r11, %r4
	.word 0x8272800b  ! 471: UDIV_R	udiv 	%r10, %r11, %r1
	.word 0xc2f2a768  ! 473: STXA_I	stxa	%r1, [%r10 + 0x0768] %asi
	.word 0xc6aaa8f4  ! 474: STBA_I	stba	%r3, [%r10 + 0x08f4] %asi
	.word 0x846a800b  ! 475: UDIVX_R	udivx 	%r10, %r11, %r2
	.word 0x85a2892b  ! 476: FMULs	fmuls	%f10, %f11, %f2
	.word 0xfafaabac  ! 477: SWAPA_I	swapa	%r29, [%r10 + 0x0bac] %asi
	.word 0xcc7a800b  ! 478: SWAP_R	swap	%r6, [%r10 + %r11]
	.word 0xd05aa490  ! 479: LDX_I	ldx	[%r10 + 0x0490], %r8
	.word 0xc3eaa468  ! 480: PREFETCHA_I	prefetcha	[%r10, + 0x0468] %asi, #one_read
	.word 0x8143c000  ! 481: STBAR	stbar
	.word 0xcb3aa190  ! 482: STDF_I	std	%f5, [0x0190, %r10]
	.word 0x8143c000  ! 483: STBAR	stbar
	.word 0xfeda900b  ! 484: LDXA_R	ldxa	[%r10, %r11] 0x80, %r31
	.word 0x8143e05a  ! 485: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside | #Sync 
	.word 0x89da800b  ! 486: FLUSH_R	dis not found

	.word 0xeab2900b  ! 487: STHA_R	stha	%r21, [%r10 + %r11] 0x80
	.word 0xde8a900b  ! 488: LDUBA_R	lduba	[%r10, %r11] 0x80, %r15
	.word 0x927aaed8  ! 489: SDIV_I	sdiv 	%r10, 0x0ed8, %r9
	.word 0xf3e2a00b  ! 490: CASA_R	casa	[%r10] %asi, %r11, %r25
	.word 0x9e6aad74  ! 491: UDIVX_I	udivx 	%r10, 0x0d74, %r15
	.word 0x8143c000  ! 492: STBAR	stbar
	.word 0x8dda800b  ! 493: FLUSH_R	dis not found

	.word 0xe322800b  ! 494: STF_R	st	%f17, [%r11, %r10]
	.word 0xd3e2a00b  ! 495: CASA_R	casa	[%r10] %asi, %r11, %r9
	.word 0xd2caa9a4  ! 496: LDSBA_I	ldsba	[%r10, + 0x09a4] %asi, %r9
	.word 0x04800001  ! 497: BLE	ble  	<label_0x1>
	.word 0xc9f2900b  ! 498: CASXA_I	casxa	[%r10] 0x80, %r11, %r4
	.word 0xc36a800b  ! 499: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0xdadaa6a0  ! 500: LDXA_I	ldxa	[%r10, + 0x06a0] %asi, %r13
	.word 0xd0f2a800  ! 501: STXA_I	stxa	%r8, [%r10 + 0x0800] %asi
	.word 0xf81a800b  ! 502: LDD_R	ldd	[%r10 + %r11], %r28
	.word 0x8e4aa7c8  ! 503: MULX_I	mulx 	%r10, 0x07c8, %r7
	.word 0x10800001  ! 504: BA	ba  	<label_0x1>
	.word 0xd8f2a148  ! 505: STXA_I	stxa	%r12, [%r10 + 0x0148] %asi
	.word 0xfc9aa4d0  ! 506: LDDA_I	ldda	[%r10, + 0x04d0] %asi, %r30
	.word 0xcdf2900b  ! 507: CASXA_I	casxa	[%r10] 0x80, %r11, %r6
	.word 0xdcca900b  ! 508: LDSBA_R	ldsba	[%r10, %r11] 0x80, %r14
	.word 0x91da800b  ! 509: FLUSH_R	dis not found

	.word 0xc4aa900b  ! 510: STBA_R	stba	%r2, [%r10 + %r11] 0x80
	.word 0x82faa518  ! 511: SDIVcc_I	sdivcc 	%r10, 0x0518, %r1
	.word 0x93daa318  ! 512: FLUSH_I	dis not found

	.word 0xc36aa7a0  ! 513: PREFETCH_I	prefetch	[%r10 + 0x07a0], #one_read
	.word 0xd08aa978  ! 514: LDUBA_I	lduba	[%r10, + 0x0978] %asi, %r8
	.word 0xda6a800b  ! 515: LDSTUB_R	ldstub	%r13, [%r10 + %r11]
	.word 0xc8faa6a0  ! 516: SWAPA_I	swapa	%r4, [%r10 + 0x06a0] %asi
	.word 0xbfda800b  ! 517: FLUSH_R	dis not found

	.word 0xea42800b  ! 518: LDSW_R	ldsw	[%r10 + %r11], %r21
	.word 0xbafa800b  ! 519: SDIVcc_R	sdivcc 	%r10, %r11, %r29
	.word 0x06800001  ! 520: BL	bl  	<label_0x1>
	.word 0xcc92adf4  ! 521: LDUHA_I	lduha	[%r10, + 0x0df4] %asi, %r6
	.word 0xad22a880  ! 523: MULScc_I	mulscc 	%r10, 0x0880, %r22
	.word 0xef3a800b  ! 525: STDF_R	std	%f23, [%r11, %r10]
	.word 0xf842800b  ! 526: LDSW_R	ldsw	[%r10 + %r11], %r28
	.word 0x9a6aa064  ! 527: UDIVX_I	udivx 	%r10, 0x0064, %r13
	.word 0xc36a800b  ! 528: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x925aa048  ! 529: SMUL_I	smul 	%r10, 0x0048, %r9
	.word 0xc8b2900b  ! 530: STHA_R	stha	%r4, [%r10 + %r11] 0x80
	.word 0xbfa288ab  ! 531: FSUBs	fsubs	%f10, %f11, %f31
	.word 0xadda800b  ! 532: FLUSH_R	dis not found

	.word 0xce12800b  ! 533: LDUH_R	lduh	[%r10 + %r11], %r7
	.word 0x8143c000  ! 534: STBAR	stbar
	.word 0xf4ba900b  ! 536: STDA_R	stda	%r26, [%r10 + %r11] 0x80
	.word 0x8322aa1c  ! 537: MULScc_I	mulscc 	%r10, 0x0a1c, %r1
	.word 0xabdaab84  ! 538: FLUSH_I	dis not found

	.word 0xd292ad14  ! 539: LDUHA_I	lduha	[%r10, + 0x0d14] %asi, %r9
	.word 0x98d2800b  ! 540: UMULcc_R	umulcc 	%r10, %r11, %r12
	.word 0x8af2aff0  ! 541: UDIVcc_I	udivcc 	%r10, 0x0ff0, %r5
	.word 0xf292a734  ! 542: LDUHA_I	lduha	[%r10, + 0x0734] %asi, %r25
	.word 0xc6daad60  ! 543: LDXA_I	ldxa	[%r10, + 0x0d60] %asi, %r3
	.word 0xf642800b  ! 544: LDSW_R	ldsw	[%r10 + %r11], %r27
	.word 0x8a4aaf28  ! 545: MULX_I	mulx 	%r10, 0x0f28, %r5
	.word 0xc36a800b  ! 546: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0xd0d2900b  ! 548: LDSHA_R	ldsha	[%r10, %r11] 0x80, %r8
	.word 0xba5aa1d8  ! 549: SMUL_I	smul 	%r10, 0x01d8, %r29
	.word 0x8143e07e  ! 550: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xdaea900b  ! 551: LDSTUBA_R	ldstuba	%r13, [%r10 + %r11] 0x80
	.word 0x36800003  ! 553: BGE	bge,a	<label_0x3>
	.word 0xd2c2900b  ! 554: LDSWA_R	ldswa	[%r10, %r11] 0x80, %r9
	.word 0xa652800b  ! 555: UMUL_R	umul 	%r10, %r11, %r19
	.word 0xdff2a00b  ! 556: CASXA_R	casxa	[%r10]%asi, %r11, %r15
	.word 0x99da800b  ! 557: FLUSH_R	dis not found

	.word 0x9f22800b  ! 558: MULScc_R	mulscc 	%r10, %r11, %r15
	.word 0xfd3a800b  ! 559: STDF_R	std	%f30, [%r11, %r10]
	.word 0x8143e03a  ! 560: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside | #MemIssue 
	.word 0xcafa900b  ! 561: SWAPA_R	swapa	%r5, [%r10 + %r11] 0x80
	.word 0xc36a800b  ! 562: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x92d2af6c  ! 563: UMULcc_I	umulcc 	%r10, 0x0f6c, %r9
	.word 0xcc52800b  ! 564: LDSH_R	ldsh	[%r10 + %r11], %r6
	.word 0xb1da800b  ! 565: FLUSH_R	dis not found

	.word 0xc26aa088  ! 566: LDSTUB_I	ldstub	%r1, [%r10 + 0x0088]
	.word 0x925a800b  ! 567: SMUL_R	smul 	%r10, %r11, %r9
	.word 0x8d22a370  ! 569: MULScc_I	mulscc 	%r10, 0x0370, %r6
	.word 0x8143e054  ! 570: MEMBAR	membar	#LoadStore | #Lookaside | #Sync 
	.word 0xd00aa29c  ! 571: LDUB_I	ldub	[%r10 + 0x029c], %r8
	.word 0x8ef2a9e8  ! 572: UDIVcc_I	udivcc 	%r10, 0x09e8, %r7
	.word 0x24c20001  ! 573: BRLEZ	brlez,a,nt	%8,<label_0x20001>
	.word 0xcbf2900b  ! 574: CASXA_I	casxa	[%r10] 0x80, %r11, %r5
	.word 0x9fa2892b  ! 575: FMULs	fmuls	%f10, %f11, %f15
	.word 0x8da288ab  ! 576: FSUBs	fsubs	%f10, %f11, %f6
	.word 0x8143e00a  ! 577: MEMBAR	membar	#StoreLoad | #StoreStore 
	.word 0xd0eaaf54  ! 578: LDSTUBA_I	ldstuba	%r8, [%r10 + 0x0f54] %asi
	.word 0x3a800001  ! 579: BCC	bcc,a	<label_0x1>
	.word 0xc47a800b  ! 580: SWAP_R	swap	%r2, [%r10 + %r11]
	.word 0x8ef2800b  ! 581: UDIVcc_R	udivcc 	%r10, %r11, %r7
	.word 0xc252a3d4  ! 582: LDSH_I	ldsh	[%r10 + 0x03d4], %r1
	.word 0x89da800b  ! 583: FLUSH_R	dis not found

	.word 0xdcba900b  ! 584: STDA_R	stda	%r14, [%r10 + %r11] 0x80
	.word 0xe25aa080  ! 585: LDX_I	ldx	[%r10 + 0x0080], %r17
	.word 0x87daaa48  ! 586: FLUSH_I	dis not found

	.word 0x8d6aa7b0  ! 587: SDIVX_I	sdivx	%r10, 0x07b0, %r6
	.word 0xd252800b  ! 588: LDSH_R	ldsh	[%r10 + %r11], %r9
	.word 0x92da800b  ! 589: SMULcc_R	smulcc 	%r10, %r11, %r9
	.word 0xd04a800b  ! 590: LDSB_R	ldsb	[%r10 + %r11], %r8
	.word 0xc36aaecc  ! 591: PREFETCH_I	prefetch	[%r10 + 0x0ecc], #one_read
	.word 0x827a800b  ! 592: SDIV_R	sdiv 	%r10, %r11, %r1
	.word 0xf40a800b  ! 593: LDUB_R	ldub	[%r10 + %r11], %r26
	.word 0xe81a800b  ! 594: LDD_R	ldd	[%r10 + %r11], %r20
	.word 0xc40aa5f8  ! 595: LDUB_I	ldub	[%r10 + 0x05f8], %r2
	.word 0xf08a900b  ! 596: LDUBA_R	lduba	[%r10, %r11] 0x80, %r24
	.word 0xc2fa900b  ! 597: SWAPA_R	swapa	%r1, [%r10 + %r11] 0x80
	.word 0x916aacb8  ! 598: SDIVX_I	sdivx	%r10, 0x0cb8, %r8
	.word 0xf6d2900b  ! 600: LDSHA_R	ldsha	[%r10, %r11] 0x80, %r27
	.word 0x8143c000  ! 601: STBAR	stbar
	.word 0xc522800b  ! 602: STF_R	st	%f2, [%r11, %r10]
	.word 0x9122800b  ! 603: MULScc_R	mulscc 	%r10, %r11, %r8
	.word 0x8143c000  ! 604: STBAR	stbar
	.word 0x12800001  ! 605: BNE	bne  	<label_0x1>
	.word 0xf6d2900b  ! 606: LDSHA_R	ldsha	[%r10, %r11] 0x80, %r27
	.word 0x8872800b  ! 607: UDIV_R	udiv 	%r10, %r11, %r4
	.word 0x8edaa608  ! 608: SMULcc_I	smulcc 	%r10, 0x0608, %r7
	.word 0x827a800b  ! 609: SDIV_R	sdiv 	%r10, %r11, %r1
	.word 0xfa7aad64  ! 610: SWAP_I	swap	%r29, [%r10 + 0x0d64]
	.word 0xb472800b  ! 611: UDIV_R	udiv 	%r10, %r11, %r26
	.word 0xc36a800b  ! 612: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x36800001  ! 613: BGE	bge,a	<label_0x1>
	.word 0xc252800b  ! 614: LDSH_R	ldsh	[%r10 + %r11], %r1
	.word 0x87a2892b  ! 615: FMULs	fmuls	%f10, %f11, %f3
	.word 0xe07aa29c  ! 616: SWAP_I	swap	%r16, [%r10 + 0x029c]
	.word 0xdf22a20c  ! 617: STF_I	st	%f15, [0x020c, %r10]
	.word 0xd0aaae50  ! 618: STBA_I	stba	%r8, [%r10 + 0x0e50] %asi
	.word 0xc2faa308  ! 619: SWAPA_I	swapa	%r1, [%r10 + 0x0308] %asi
	.word 0xa7daac9c  ! 620: FLUSH_I	dis not found

	.word 0xbba2882b  ! 621: FADDs	fadds	%f10, %f11, %f29
	.word 0xde92ac28  ! 622: LDUHA_I	lduha	[%r10, + 0x0c28] %asi, %r15
	.word 0x83daa458  ! 623: FLUSH_I	dis not found

	.word 0x8a52800b  ! 624: UMUL_R	umul 	%r10, %r11, %r5
	.word 0xc2f2a7d0  ! 625: STXA_I	stxa	%r1, [%r10 + 0x07d0] %asi
	.word 0x925a800b  ! 626: SMUL_R	smul 	%r10, %r11, %r9
	.word 0x26800003  ! 627: BL	bl,a	<label_0x3>
	.word 0xf482900b  ! 628: LDUWA_R	lduwa	[%r10, %r11] 0x80, %r26
	.word 0xc4da900b  ! 629: LDXA_R	ldxa	[%r10, %r11] 0x80, %r2
	.word 0x04c20001  ! 630: BRLEZ	brlez  ,nt	%8,<label_0x20001>
	.word 0xc3eaa78c  ! 631: PREFETCHA_I	prefetcha	[%r10, + 0x078c] %asi, #one_read
	.word 0x8ddaaffc  ! 632: FLUSH_I	dis not found

	.word 0xb9a289ab  ! 633: FDIVs	fdivs	%f10, %f11, %f28
	.word 0xc8caaf68  ! 634: LDSBA_I	ldsba	[%r10, + 0x0f68] %asi, %r4
	.word 0xcb22a534  ! 635: STF_I	st	%f5, [0x0534, %r10]
	.word 0xcea2a424  ! 636: STWA_I	stwa	%r7, [%r10 + 0x0424] %asi
	.word 0xc84aae78  ! 637: LDSB_I	ldsb	[%r10 + 0x0e78], %r4
	.word 0xe322800b  ! 638: STF_R	st	%f17, [%r11, %r10]
	.word 0x8ddaa500  ! 639: FLUSH_I	dis not found

	.word 0xc6b2900b  ! 640: STHA_R	stha	%r3, [%r10 + %r11] 0x80
	.word 0x84f2a8d4  ! 641: UDIVcc_I	udivcc 	%r10, 0x08d4, %r2
	.word 0xc2aa900b  ! 642: STBA_R	stba	%r1, [%r10 + %r11] 0x80
	.word 0x8143e04b  ! 643: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Sync 
	.word 0x8a5aaf50  ! 644: SMUL_I	smul 	%r10, 0x0f50, %r5
	.word 0xabdaaa60  ! 645: FLUSH_I	dis not found

	.word 0xc3ea900b  ! 646: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0xc2a2a400  ! 647: STWA_I	stwa	%r1, [%r10 + 0x0400] %asi
	.word 0xcde2900b  ! 648: CASA_I	casa	[%r10] 0x80, %r11, %r6
	.word 0xccba900b  ! 649: STDA_R	stda	%r6, [%r10 + %r11] 0x80
	.word 0xc41aa1c8  ! 650: LDD_I	ldd	[%r10 + 0x01c8], %r2
	.word 0xeaaaa70c  ! 651: STBA_I	stba	%r21, [%r10 + 0x070c] %asi
	.word 0xabdaa268  ! 653: FLUSH_I	dis not found

	.word 0xc922800b  ! 654: STF_R	st	%f4, [%r11, %r10]
	.word 0x8cf2a8e4  ! 655: UDIVcc_I	udivcc 	%r10, 0x08e4, %r6
	.word 0xe8ba900b  ! 656: STDA_R	stda	%r20, [%r10 + %r11] 0x80
	.word 0xf4ea900b  ! 657: LDSTUBA_R	ldstuba	%r26, [%r10 + %r11] 0x80
	.word 0x8ad2a648  ! 658: UMULcc_I	umulcc 	%r10, 0x0648, %r5
	.word 0x8ddaa680  ! 659: FLUSH_I	dis not found

	.word 0xc2a2a7d4  ! 660: STWA_I	stwa	%r1, [%r10 + 0x07d4] %asi
	.word 0x90f2800b  ! 661: UDIVcc_R	udivcc 	%r10, %r11, %r8
	.word 0x26ca0001  ! 662: BRLZ	brlz,a,pt	%8,<label_0xa0001>
	.word 0x8143e01b  ! 663: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Lookaside 
	.word 0xc27aaebc  ! 664: SWAP_I	swap	%r1, [%r10 + 0x0ebc]
	.word 0x8bda800b  ! 665: FLUSH_R	dis not found

	.word 0x85da800b  ! 666: FLUSH_R	dis not found

	.word 0xebf2900b  ! 667: CASXA_I	casxa	[%r10] 0x80, %r11, %r21
	.word 0x8143c000  ! 668: STBAR	stbar
	.word 0x06800001  ! 669: BL	bl  	<label_0x1>
	.word 0x20800001  ! 670: BN	bn,a	<label_0x1>
	.word 0x92da800b  ! 671: SMULcc_R	smulcc 	%r10, %r11, %r9
	.word 0x8452ac8c  ! 672: UMUL_I	umul 	%r10, 0x0c8c, %r2
	.word 0xf922a3c0  ! 673: STF_I	st	%f28, [0x03c0, %r10]
	.word 0xce02800b  ! 674: LDUW_R	lduw	[%r10 + %r11], %r7
	.word 0xc3ea900b  ! 675: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0xc3e2900b  ! 676: CASA_I	casa	[%r10] 0x80, %r11, %r1
	.word 0xceb2ad68  ! 677: STHA_I	stha	%r7, [%r10 + 0x0d68] %asi
	.word 0x8ddaa510  ! 678: FLUSH_I	dis not found

	.word 0xd93a800b  ! 679: STDF_R	std	%f12, [%r11, %r10]
	.word 0x87da800b  ! 680: FLUSH_R	dis not found

	.word 0xbcf2800b  ! 681: UDIVcc_R	udivcc 	%r10, %r11, %r30
	.word 0xb7a2892b  ! 682: FMULs	fmuls	%f10, %f11, %f27
	.word 0xe2aa900b  ! 684: STBA_R	stba	%r17, [%r10 + %r11] 0x80
	.word 0x8143e005  ! 685: MEMBAR	membar	#LoadLoad | #LoadStore 
	.word 0xa1da800b  ! 686: FLUSH_R	dis not found

	.word 0xc2b2a398  ! 687: STHA_I	stha	%r1, [%r10 + 0x0398] %asi
	.word 0xc252ae24  ! 688: LDSH_I	ldsh	[%r10 + 0x0e24], %r1
	.word 0xccb2900b  ! 689: STHA_R	stha	%r6, [%r10 + %r11] 0x80
	.word 0x8143e034  ! 690: MEMBAR	membar	#LoadStore | #Lookaside | #MemIssue 
	.word 0x8c5a800b  ! 691: SMUL_R	smul 	%r10, %r11, %r6
	.word 0x36800003  ! 692: BGE	bge,a	<label_0x3>
	.word 0xc3ea900b  ! 693: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0x8e6a800b  ! 694: UDIVX_R	udivx 	%r10, %r11, %r7
	.word 0xc442800b  ! 695: LDSW_R	ldsw	[%r10 + %r11], %r2
	.word 0xb8daa0a4  ! 696: SMULcc_I	smulcc 	%r10, 0x00a4, %r28
	.word 0xa84a800b  ! 697: MULX_R	mulx 	%r10, %r11, %r20
	.word 0x85a2892b  ! 699: FMULs	fmuls	%f10, %f11, %f2
	.word 0x93da800b  ! 700: FLUSH_R	dis not found

	.word 0x89a289ab  ! 701: FDIVs	fdivs	%f10, %f11, %f4
	.word 0xfc52a964  ! 702: LDSH_I	ldsh	[%r10 + 0x0964], %r30
	.word 0x8143c000  ! 704: STBAR	stbar
	.word 0xccbaafc8  ! 705: STDA_I	stda	%r6, [%r10 + 0x0fc8] %asi
	.word 0xca42800b  ! 706: LDSW_R	ldsw	[%r10 + %r11], %r5
	.word 0x8143e06a  ! 707: MEMBAR	membar	#StoreLoad | #StoreStore | #MemIssue | #Sync 
	.word 0x86daa2dc  ! 708: SMULcc_I	smulcc 	%r10, 0x02dc, %r3
	.word 0x40000003  ! 709: CALL	call	disp30_3
	.word 0xc0baa920  ! 710: STDA_I	stda	%r0, [%r10 + 0x0920] %asi
	.word 0xc3eaa378  ! 711: PREFETCHA_I	prefetcha	[%r10, + 0x0378] %asi, #one_read
	.word 0xa922a3a0  ! 712: MULScc_I	mulscc 	%r10, 0x03a0, %r20
	.word 0xc882a48c  ! 714: LDUWA_I	lduwa	[%r10, + 0x048c] %asi, %r4
	.word 0xc40a800b  ! 715: LDUB_R	ldub	[%r10 + %r11], %r2
	.word 0x2c800001  ! 716: BNEG	bneg,a	<label_0x1>
	.word 0xd33aacc8  ! 717: STDF_I	std	%f9, [0x0cc8, %r10]
	.word 0xc9e2a00b  ! 718: CASA_R	casa	[%r10] %asi, %r11, %r4
	.word 0x936a800b  ! 719: SDIVX_R	sdivx	%r10, %r11, %r9
	.word 0x8adaab98  ! 720: SMULcc_I	smulcc 	%r10, 0x0b98, %r5
	.word 0x83da800b  ! 721: FLUSH_R	dis not found

	.word 0xc3e2900b  ! 722: CASA_I	casa	[%r10] 0x80, %r11, %r1
	.word 0xc282a72c  ! 723: LDUWA_I	lduwa	[%r10, + 0x072c] %asi, %r1
	.word 0x8143e027  ! 724: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #MemIssue 
	.word 0xd8f2900b  ! 725: STXA_R	stxa	%r12, [%r10 + %r11] 0x80
	.word 0x1c800001  ! 726: BPOS	bpos  	<label_0x1>
	.word 0x8143e034  ! 727: MEMBAR	membar	#LoadStore | #Lookaside | #MemIssue 
	.word 0x8143c000  ! 728: STBAR	stbar
	.word 0xcff2900b  ! 729: CASXA_I	casxa	[%r10] 0x80, %r11, %r7
	.word 0x89da800b  ! 730: FLUSH_R	dis not found

	.word 0x88fa800b  ! 731: SDIVcc_R	sdivcc 	%r10, %r11, %r4
	.word 0x32800003  ! 732: BNE	bne,a	<label_0x3>
	.word 0xa86a800b  ! 733: UDIVX_R	udivx 	%r10, %r11, %r20
	.word 0xce92a438  ! 734: LDUHA_I	lduha	[%r10, + 0x0438] %asi, %r7
	.word 0xc36a800b  ! 735: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x8143e01a  ! 736: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside 
	.word 0xcfe2a00b  ! 737: CASA_R	casa	[%r10] %asi, %r11, %r7
	.word 0xee4a800b  ! 739: LDSB_R	ldsb	[%r10 + %r11], %r23
	.word 0x8fa288ab  ! 740: FSUBs	fsubs	%f10, %f11, %f7
	.word 0xe81a800b  ! 741: LDD_R	ldd	[%r10 + %r11], %r20
	.word 0xcb3aad90  ! 742: STDF_I	std	%f5, [0x0d90, %r10]
	.word 0x8ad2a658  ! 743: UMULcc_I	umulcc 	%r10, 0x0658, %r5
	.word 0xc6ca900b  ! 744: LDSBA_R	ldsba	[%r10, %r11] 0x80, %r3
	.word 0xdcf2900b  ! 745: STXA_R	stxa	%r14, [%r10 + %r11] 0x80
	.word 0xe002800b  ! 746: LDUW_R	lduw	[%r10 + %r11], %r16
	.word 0xccea900b  ! 747: LDSTUBA_R	ldstuba	%r6, [%r10 + %r11] 0x80
	.word 0xc36aadf0  ! 748: PREFETCH_I	prefetch	[%r10 + 0x0df0], #one_read
	.word 0x8143e010  ! 749: MEMBAR	membar	#Lookaside 
	.word 0x2aca0003  ! 750: BRNZ	brnz,a,pt	%8,<label_0xa0003>
	.word 0xc4daa388  ! 751: LDXA_I	ldxa	[%r10, + 0x0388] %asi, %r2
	.word 0xdaaa900b  ! 752: STBA_R	stba	%r13, [%r10 + %r11] 0x80
	.word 0xcaa2900b  ! 753: STWA_R	stwa	%r5, [%r10 + %r11] 0x80
	.word 0x0a800003  ! 754: BCS	bcs  	<label_0x3>
	.word 0xc242a894  ! 755: LDSW_I	ldsw	[%r10 + 0x0894], %r1
	.word 0xcd3a800b  ! 756: STDF_R	std	%f6, [%r11, %r10]
	.word 0x8143c000  ! 757: STBAR	stbar
	.word 0x93da800b  ! 758: FLUSH_R	dis not found

	.word 0x8143c000  ! 759: STBAR	stbar
	.word 0x8472a3c8  ! 760: UDIV_I	udiv 	%r10, 0x03c8, %r2
	.word 0xceb2a290  ! 761: STHA_I	stha	%r7, [%r10 + 0x0290] %asi
	.word 0xc2f2a1f8  ! 762: STXA_I	stxa	%r1, [%r10 + 0x01f8] %asi
	.word 0xc8f2a968  ! 763: STXA_I	stxa	%r4, [%r10 + 0x0968] %asi
	.word 0x8143e039  ! 764: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside | #MemIssue 
	.word 0xdcba900b  ! 765: STDA_R	stda	%r14, [%r10 + %r11] 0x80
	.word 0x8143e059  ! 766: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside | #Sync 
	.word 0xfab2aa98  ! 767: STHA_I	stha	%r29, [%r10 + 0x0a98] %asi
	.word 0xc452800b  ! 768: LDSH_R	ldsh	[%r10 + %r11], %r2
	.word 0x9ddaabd4  ! 769: FLUSH_I	dis not found

	.word 0x91daae30  ! 770: FLUSH_I	dis not found

	.word 0xc26aad24  ! 771: LDSTUB_I	ldstub	%r1, [%r10 + 0x0d24]
	.word 0xceaaa2f4  ! 772: STBA_I	stba	%r7, [%r10 + 0x02f4] %asi
	.word 0xaad2800b  ! 773: UMULcc_R	umulcc 	%r10, %r11, %r21
	.word 0x8143c000  ! 774: STBAR	stbar
	.word 0x8143e021  ! 775: MEMBAR	membar	#LoadLoad | #MemIssue 
	.word 0xc86a800b  ! 776: LDSTUB_R	ldstub	%r4, [%r10 + %r11]
	.word 0x8143c000  ! 777: STBAR	stbar
	.word 0x40000003  ! 778: CALL	call	disp30_3
	.word 0x8bdaaee4  ! 779: FLUSH_I	dis not found

	.word 0x0cca0001  ! 780: BRGZ	brgz  ,pt	%8,<label_0xa0001>
	.word 0x0c800003  ! 781: BNEG	bneg  	<label_0x3>
	.word 0xc60a800b  ! 782: LDUB_R	ldub	[%r10 + %r11], %r3
	.word 0x8f6aad18  ! 783: SDIVX_I	sdivx	%r10, 0x0d18, %r7
	.word 0x8c7a800b  ! 784: SDIV_R	sdiv 	%r10, %r11, %r6
	.word 0x8ddaa99c  ! 785: FLUSH_I	dis not found

	.word 0xc3eaacc0  ! 786: PREFETCHA_I	prefetcha	[%r10, + 0x0cc0] %asi, #one_read
	.word 0x8afa800b  ! 787: SDIVcc_R	sdivcc 	%r10, %r11, %r5
	.word 0x8c52800b  ! 788: UMUL_R	umul 	%r10, %r11, %r6
	.word 0x8dda800b  ! 789: FLUSH_R	dis not found

	.word 0xce6aab88  ! 790: LDSTUB_I	ldstub	%r7, [%r10 + 0x0b88]
	.word 0x3a800003  ! 791: BCC	bcc,a	<label_0x3>
	.word 0x8143c000  ! 792: STBAR	stbar
	.word 0xa1daa2d0  ! 793: FLUSH_I	dis not found

	.word 0xbc72800b  ! 794: UDIV_R	udiv 	%r10, %r11, %r30
	.word 0x22c20003  ! 796: BRZ	brz,a,nt	%8,<label_0x20003>
	.word 0x8cfaa600  ! 797: SDIVcc_I	sdivcc 	%r10, 0x0600, %r6
	.word 0x2aca0001  ! 798: BRNZ	brnz,a,pt	%8,<label_0xa0001>
	.word 0xc922acfc  ! 799: STF_I	st	%f4, [0x0cfc, %r10]
	.word 0xc36a800b  ! 800: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0xcd3a800b  ! 801: STDF_R	std	%f6, [%r11, %r10]
	.word 0x8a52aa48  ! 802: UMUL_I	umul 	%r10, 0x0a48, %r5
	.word 0x85daa454  ! 803: FLUSH_I	dis not found

	.word 0x8adaa9e0  ! 804: SMULcc_I	smulcc 	%r10, 0x09e0, %r5
	.word 0x8143e05c  ! 805: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0x8bda800b  ! 806: FLUSH_R	dis not found

	.word 0x0aca0001  ! 807: BRNZ	brnz  ,pt	%8,<label_0xa0001>
	.word 0x87a289ab  ! 808: FDIVs	fdivs	%f10, %f11, %f3
	.word 0x84daabb4  ! 809: SMULcc_I	smulcc 	%r10, 0x0bb4, %r2
	.word 0xca6a800b  ! 810: LDSTUB_R	ldstub	%r5, [%r10 + %r11]
	.word 0xee82a748  ! 811: LDUWA_I	lduwa	[%r10, + 0x0748] %asi, %r23
	.word 0xe13a800b  ! 812: STDF_R	std	%f16, [%r11, %r10]
	.word 0xc47a800b  ! 813: SWAP_R	swap	%r2, [%r10 + %r11]
	.word 0xca82900b  ! 814: LDUWA_R	lduwa	[%r10, %r11] 0x80, %r5
	.word 0xc36aab30  ! 815: PREFETCH_I	prefetch	[%r10 + 0x0b30], #one_read
	.word 0x2ac20001  ! 816: BRNZ	brnz,a,nt	%8,<label_0x20001>
	.word 0x9dda800b  ! 818: FLUSH_R	dis not found

	.word 0xc922800b  ! 820: STF_R	st	%f4, [%r11, %r10]
	.word 0xafda800b  ! 821: FLUSH_R	dis not found

	.word 0x91daa9c8  ! 822: FLUSH_I	dis not found

	.word 0x8dda800b  ! 823: FLUSH_R	dis not found

	.word 0x8143c000  ! 825: STBAR	stbar
	.word 0xc882900b  ! 826: LDUWA_R	lduwa	[%r10, %r11] 0x80, %r4
	.word 0xcacaabac  ! 827: LDSBA_I	ldsba	[%r10, + 0x0bac] %asi, %r5
	.word 0x826a800b  ! 828: UDIVX_R	udivx 	%r10, %r11, %r1
	.word 0xf6aaa0ac  ! 829: STBA_I	stba	%r27, [%r10 + 0x00ac] %asi
	.word 0xde02800b  ! 830: LDUW_R	lduw	[%r10 + %r11], %r15
	.word 0x8ddaaef8  ! 831: FLUSH_I	dis not found

	.word 0xafa2892b  ! 832: FMULs	fmuls	%f10, %f11, %f23
	.word 0x8143e034  ! 833: MEMBAR	membar	#LoadStore | #Lookaside | #MemIssue 
	.word 0xc3ea900b  ! 834: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0xc812800b  ! 835: LDUH_R	lduh	[%r10 + %r11], %r4
	.word 0xc2b2aa70  ! 836: STHA_I	stha	%r1, [%r10 + 0x0a70] %asi
	.word 0xc602ab24  ! 838: LDUW_I	lduw	[%r10 + 0x0b24], %r3
	.word 0x8ddaad60  ! 840: FLUSH_I	dis not found

	.word 0x8fa2892b  ! 841: FMULs	fmuls	%f10, %f11, %f7
	.word 0xe602800b  ! 842: LDUW_R	lduw	[%r10 + %r11], %r19
	.word 0xcb3a800b  ! 843: STDF_R	std	%f5, [%r11, %r10]
	.word 0xd2aaad38  ! 844: STBA_I	stba	%r9, [%r10 + 0x0d38] %asi
	.word 0xda0a800b  ! 845: LDUB_R	ldub	[%r10 + %r11], %r13
	.word 0xca0a800b  ! 846: LDUB_R	ldub	[%r10 + %r11], %r5
	.word 0xe722800b  ! 847: STF_R	st	%f19, [%r11, %r10]
	.word 0xdcda900b  ! 848: LDXA_R	ldxa	[%r10, %r11] 0x80, %r14
	.word 0x85a2892b  ! 849: FMULs	fmuls	%f10, %f11, %f2
	.word 0xbbdaa110  ! 850: FLUSH_I	dis not found

	.word 0x2aca0003  ! 851: BRNZ	brnz,a,pt	%8,<label_0xa0003>
	.word 0xcca2900b  ! 852: STWA_R	stwa	%r6, [%r10 + %r11] 0x80
	.word 0x8143e074  ! 853: MEMBAR	membar	#LoadStore | #Lookaside | #MemIssue | #Sync 
	.word 0xd2da900b  ! 854: LDXA_R	ldxa	[%r10, %r11] 0x80, %r9
	.word 0xc6aaadbc  ! 855: STBA_I	stba	%r3, [%r10 + 0x0dbc] %asi
	.word 0x8a72a294  ! 856: UDIV_I	udiv 	%r10, 0x0294, %r5
	.word 0xbbdaadb0  ! 857: FLUSH_I	dis not found

	.word 0xadda800b  ! 858: FLUSH_R	dis not found

	.word 0xc3ea900b  ! 859: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0xec0a800b  ! 860: LDUB_R	ldub	[%r10 + %r11], %r22
	.word 0xd252add8  ! 861: LDSH_I	ldsh	[%r10 + 0x0dd8], %r9
	.word 0xc8daa990  ! 862: LDXA_I	ldxa	[%r10, + 0x0990] %asi, %r4
	.word 0x8bda800b  ! 863: FLUSH_R	dis not found

	.word 0x8e7a800b  ! 864: SDIV_R	sdiv 	%r10, %r11, %r7
	.word 0xc86a800b  ! 865: LDSTUB_R	ldstub	%r4, [%r10 + %r11]
	.word 0x8a4aa48c  ! 866: MULX_I	mulx 	%r10, 0x048c, %r5
	.word 0xd26a800b  ! 867: LDSTUB_R	ldstub	%r9, [%r10 + %r11]
	.word 0x82fa800b  ! 868: SDIVcc_R	sdivcc 	%r10, %r11, %r1
	.word 0xd2daa0e8  ! 871: LDXA_I	ldxa	[%r10, + 0x00e8] %asi, %r9
	.word 0xc46a800b  ! 872: LDSTUB_R	ldstub	%r2, [%r10 + %r11]
	.word 0xc3ea900b  ! 873: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0xe09a900b  ! 874: LDDA_R	ldda	[%r10, %r11] 0x80, %r16
	.word 0xd2f2900b  ! 875: STXA_R	stxa	%r9, [%r10 + %r11] 0x80
	.word 0xc26a800b  ! 876: LDSTUB_R	ldstub	%r1, [%r10 + %r11]
	.word 0xb3a2892b  ! 878: FMULs	fmuls	%f10, %f11, %f25
	.word 0xbf6a800b  ! 879: SDIVX_R	sdivx	%r10, %r11, %r31
	.word 0x8143e029  ! 880: MEMBAR	membar	#LoadLoad | #StoreStore | #MemIssue 
	.word 0x8e6a800b  ! 881: UDIVX_R	udivx 	%r10, %r11, %r7
	.word 0xb5a289ab  ! 882: FDIVs	fdivs	%f10, %f11, %f26
	.word 0xd13a800b  ! 883: STDF_R	std	%f8, [%r11, %r10]
	.word 0xcc7a800b  ! 885: SWAP_R	swap	%r6, [%r10 + %r11]
	.word 0x93da800b  ! 886: FLUSH_R	dis not found

	.word 0xfcd2a018  ! 887: LDSHA_I	ldsha	[%r10, + 0x0018] %asi, %r30
	.word 0xc36a800b  ! 888: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x907aad58  ! 889: SDIV_I	sdiv 	%r10, 0x0d58, %r8
	.word 0x91da800b  ! 890: FLUSH_R	dis not found

	.word 0xc33a800b  ! 891: STDF_R	std	%f1, [%r11, %r10]
	.word 0xccba900b  ! 892: STDA_R	stda	%r6, [%r10 + %r11] 0x80
	.word 0xfcfaa4fc  ! 894: SWAPA_I	swapa	%r30, [%r10 + 0x04fc] %asi
	.word 0xd292a3d4  ! 896: LDUHA_I	lduha	[%r10, + 0x03d4] %asi, %r9
	.word 0x8d6a800b  ! 897: SDIVX_R	sdivx	%r10, %r11, %r6
	.word 0xc412ac98  ! 898: LDUH_I	lduh	[%r10 + 0x0c98], %r2
	.word 0xd2fa900b  ! 899: SWAPA_R	swapa	%r9, [%r10 + %r11] 0x80
	.word 0xbaf2800b  ! 900: UDIVcc_R	udivcc 	%r10, %r11, %r29
	.word 0x22c20001  ! 901: BRZ	brz,a,nt	%8,<label_0x20001>
	.word 0x26800003  ! 902: BL	bl,a	<label_0x3>
	.word 0xc4aa900b  ! 903: STBA_R	stba	%r2, [%r10 + %r11] 0x80
	.word 0xc4baa5e0  ! 904: STDA_I	stda	%r2, [%r10 + 0x05e0] %asi
	.word 0xd252800b  ! 905: LDSH_R	ldsh	[%r10 + %r11], %r9
	.word 0xcaca900b  ! 906: LDSBA_R	ldsba	[%r10, %r11] 0x80, %r5
	.word 0xa9daabcc  ! 907: FLUSH_I	dis not found

	.word 0xca5a800b  ! 908: LDX_R	ldx	[%r10 + %r11], %r5
	.word 0x8bdaa748  ! 909: FLUSH_I	dis not found

	.word 0x8143e07a  ! 910: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0x99a288ab  ! 911: FSUBs	fsubs	%f10, %f11, %f12
	.word 0x8272800b  ! 912: UDIV_R	udiv 	%r10, %r11, %r1
	.word 0xcc42800b  ! 913: LDSW_R	ldsw	[%r10 + %r11], %r6
	.word 0xc8d2900b  ! 914: LDSHA_R	ldsha	[%r10, %r11] 0x80, %r4
	.word 0xa072abb4  ! 915: UDIV_I	udiv 	%r10, 0x0bb4, %r16
	.word 0xf092a5cc  ! 916: LDUHA_I	lduha	[%r10, + 0x05cc] %asi, %r24
	.word 0x8f6a800b  ! 917: SDIVX_R	sdivx	%r10, %r11, %r7
	.word 0xdcda900b  ! 918: LDXA_R	ldxa	[%r10, %r11] 0x80, %r14
	.word 0x32800001  ! 919: BNE	bne,a	<label_0x1>
	.word 0x9a7a800b  ! 920: SDIV_R	sdiv 	%r10, %r11, %r13
	.word 0x8da289ab  ! 921: FDIVs	fdivs	%f10, %f11, %f6
	.word 0xc3ea900b  ! 922: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0x8143e063  ! 924: MEMBAR	membar	#LoadLoad | #StoreLoad | #MemIssue | #Sync 
	.word 0x40000001  ! 926: CALL	call	disp30_1
	.word 0xb2faa714  ! 927: SDIVcc_I	sdivcc 	%r10, 0x0714, %r25
	.word 0xedf2900b  ! 928: CASXA_I	casxa	[%r10] 0x80, %r11, %r22
	.word 0x06800003  ! 930: BL	bl  	<label_0x3>
	.word 0x82fa800b  ! 931: SDIVcc_R	sdivcc 	%r10, %r11, %r1
	.word 0xcaa2a1cc  ! 932: STWA_I	stwa	%r5, [%r10 + 0x01cc] %asi
	.word 0x8872800b  ! 933: UDIV_R	udiv 	%r10, %r11, %r4
	.word 0xd2aa900b  ! 934: STBA_R	stba	%r9, [%r10 + %r11] 0x80
	.word 0xc6daa600  ! 935: LDXA_I	ldxa	[%r10, + 0x0600] %asi, %r3
	.word 0x8143c000  ! 936: STBAR	stbar
	.word 0x0c800001  ! 937: BNEG	bneg  	<label_0x1>
	.word 0xe93a800b  ! 938: STDF_R	std	%f20, [%r11, %r10]
	.word 0xc3eaa60c  ! 939: PREFETCHA_I	prefetcha	[%r10, + 0x060c] %asi, #one_read
	.word 0x83da800b  ! 940: FLUSH_R	dis not found

	.word 0xe1e2a00b  ! 941: CASA_R	casa	[%r10] %asi, %r11, %r16
	.word 0xd0fa900b  ! 942: SWAPA_R	swapa	%r8, [%r10 + %r11] 0x80
	.word 0xd292900b  ! 943: LDUHA_R	lduha	[%r10, %r11] 0x80, %r9
	.word 0xc9e2900b  ! 944: CASA_I	casa	[%r10] 0x80, %r11, %r4
	.word 0x8143c000  ! 945: STBAR	stbar
	.word 0x2cca0001  ! 946: BRGZ	brgz,a,pt	%8,<label_0xa0001>
	.word 0x89a288ab  ! 947: FSUBs	fsubs	%f10, %f11, %f4
	.word 0x8f6aa68c  ! 951: SDIVX_I	sdivx	%r10, 0x068c, %r7
	.word 0x90d2800b  ! 952: UMULcc_R	umulcc 	%r10, %r11, %r8
	.word 0x8143e059  ! 953: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside | #Sync 
	.word 0xd2f2a450  ! 954: STXA_I	stxa	%r9, [%r10 + 0x0450] %asi
	.word 0x89daa4d4  ! 955: FLUSH_I	dis not found

	.word 0xc892900b  ! 956: LDUHA_R	lduha	[%r10, %r11] 0x80, %r4
	.word 0xcad2900b  ! 957: LDSHA_R	ldsha	[%r10, %r11] 0x80, %r5
	.word 0xdefa900b  ! 958: SWAPA_R	swapa	%r15, [%r10 + %r11] 0x80
	.word 0x8143c000  ! 959: STBAR	stbar
	.word 0x38800001  ! 960: BGU	bgu,a	<label_0x1>
	.word 0x24c20001  ! 961: BRLEZ	brlez,a,nt	%8,<label_0x20001>
	.word 0xc452800b  ! 962: LDSH_R	ldsh	[%r10 + %r11], %r2
	.word 0xfa0a800b  ! 963: LDUB_R	ldub	[%r10 + %r11], %r29
	.word 0xc86aa9d0  ! 964: LDSTUB_I	ldstub	%r4, [%r10 + 0x09d0]
	.word 0x87da800b  ! 965: FLUSH_R	dis not found

	.word 0xc36a800b  ! 966: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x8143c000  ! 967: STBAR	stbar
	.word 0xf6c2900b  ! 968: LDSWA_R	ldswa	[%r10, %r11] 0x80, %r27
	.word 0x926a800b  ! 969: UDIVX_R	udivx 	%r10, %r11, %r9
	.word 0x8143e056  ! 970: MEMBAR	membar	#StoreLoad | #LoadStore | #Lookaside | #Sync 
	.word 0xf002a91c  ! 971: LDUW_I	lduw	[%r10 + 0x091c], %r24
	.word 0x867a800b  ! 972: SDIV_R	sdiv 	%r10, %r11, %r3
	.word 0xd13a800b  ! 973: STDF_R	std	%f8, [%r11, %r10]
	.word 0xe0ca900b  ! 974: LDSBA_R	ldsba	[%r10, %r11] 0x80, %r16
	.word 0xa1daa918  ! 975: FLUSH_I	dis not found

	.word 0xd2aa900b  ! 976: STBA_R	stba	%r9, [%r10 + %r11] 0x80
	.word 0x8143e02a  ! 978: MEMBAR	membar	#StoreLoad | #StoreStore | #MemIssue 
	.word 0xb7a288ab  ! 979: FSUBs	fsubs	%f10, %f11, %f27
	.word 0x8143c000  ! 980: STBAR	stbar
	.word 0xc6d2a5e8  ! 981: LDSHA_I	ldsha	[%r10, + 0x05e8] %asi, %r3
	.word 0x83daa1e0  ! 982: FLUSH_I	dis not found

	.word 0xb4f2800b  ! 983: UDIVcc_R	udivcc 	%r10, %r11, %r26
	.word 0x8ba289ab  ! 984: FDIVs	fdivs	%f10, %f11, %f5
	.word 0xd0b2aa60  ! 985: STHA_I	stha	%r8, [%r10 + 0x0a60] %asi
	.word 0xb5da800b  ! 986: FLUSH_R	dis not found

	.word 0xea92900b  ! 987: LDUHA_R	lduha	[%r10, %r11] 0x80, %r21
	.word 0xb0d2a3b0  ! 988: UMULcc_I	umulcc 	%r10, 0x03b0, %r24
	.word 0x8e6a800b  ! 989: UDIVX_R	udivx 	%r10, %r11, %r7
	.word 0x0cc20001  ! 990: BRGZ	brgz  ,nt	%8,<label_0x20001>
	.word 0xce92a6b8  ! 991: LDUHA_I	lduha	[%r10, + 0x06b8] %asi, %r7
	.word 0xca6a800b  ! 992: LDSTUB_R	ldstub	%r5, [%r10 + %r11]
	.word 0xd06a800b  ! 993: LDSTUB_R	ldstub	%r8, [%r10 + %r11]
	.word 0xce4aa1cc  ! 994: LDSB_I	ldsb	[%r10 + 0x01cc], %r7
	.word 0xf2fa900b  ! 995: SWAPA_R	swapa	%r25, [%r10 + %r11] 0x80
	.word 0x9fda800b  ! 996: FLUSH_R	dis not found

	.word 0xf4aaa5ec  ! 997: STBA_I	stba	%r26, [%r10 + 0x05ec] %asi
	.word 0xe4c2ae4c  ! 998: LDSWA_I	ldswa	[%r10, + 0x0e4c] %asi, %r18
	.word 0xd0aaae50  ! 999: STBA_I	stba	%r8, [%r10 + 0x0e50] %asi
	nop
	nop
	nop
        ta      T_GOOD_TRAP
th_main_3:
        setx  MAIN_BASE_DATA_VA, %r1, %r10
        setx  0x0000000000000d50, %g1, %r11
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
        setx  0x653244824866282d, %g1, %r0
        setx  0x197514cd24d9239f, %g1, %r1
        setx  0xb705c3aeda7e4560, %g1, %r2
        setx  0x184ced64a4a6ee39, %g1, %r3
        setx  0xec0249a582e74086, %g1, %r4
        setx  0xb6a108dfcd5a8cda, %g1, %r5
        setx  0x6cb9d98f206a38fd, %g1, %r6
        setx  0xa004ec92c47849eb, %g1, %r7
        setx  0x042600d8dcd9e20d, %g1, %r8
        setx  0xad5e61704af825df, %g1, %r9
        setx  0x8dbda4ca39a588de, %g1, %r12
        setx  0x9219978fa35856c9, %g1, %r13
        setx  0xf4ee28231e580d09, %g1, %r14
        setx  0xab31667ed34ad729, %g1, %r15
        setx  0x836d502e590eb343, %g1, %r16
        setx  0x4b71a922f89dea7c, %g1, %r17
        setx  0x554c9fae81ef886d, %g1, %r18
        setx  0x4ae5b5aab28419dd, %g1, %r19
        setx  0x007fdb5a48ffd07b, %g1, %r20
        setx  0xfd4c8ede73b78595, %g1, %r21
        setx  0x35fa99ba0fb45236, %g1, %r22
        setx  0x5306b62370a6ab0c, %g1, %r23
        setx  0xa889f11dbbd173ad, %g1, %r24
        setx  0xb77480db12a7726b, %g1, %r25
        setx  0x7aa7f57e71d9a41c, %g1, %r26
        setx  0x818449ecce9498e7, %g1, %r27
        setx  0xbd55a02c918a8626, %g1, %r28
        setx  0xd935fd539aa26cfd, %g1, %r29
        setx  0xae4030ed4ec2bb4e, %g1, %r30
        setx  0x54d4b54c2757b7ed, %g1, %r31
	.word 0xe082900b  ! 5: LDUWA_R	lduwa	[%r10, %r11] 0x80, %r16
	.word 0xf00aae24  ! 6: LDUB_I	ldub	[%r10 + 0x0e24], %r24
	.word 0xb5a289ab  ! 7: FDIVs	fdivs	%f10, %f11, %f26
	.word 0xd09a900b  ! 8: LDDA_R	ldda	[%r10, %r11] 0x80, %r8
	.word 0xc402800b  ! 9: LDUW_R	lduw	[%r10 + %r11], %r2
	.word 0xe2a2900b  ! 10: STWA_R	stwa	%r17, [%r10 + %r11] 0x80
	.word 0x82faa640  ! 11: SDIVcc_I	sdivcc 	%r10, 0x0640, %r1
	.word 0x8af2800b  ! 13: UDIVcc_R	udivcc 	%r10, %r11, %r5
	.word 0xf87aa874  ! 14: SWAP_I	swap	%r28, [%r10 + 0x0874]
	.word 0x1e800001  ! 15: BVC	bvc  	<label_0x1>
	.word 0x92d2afdc  ! 16: UMULcc_I	umulcc 	%r10, 0x0fdc, %r9
	.word 0xca52a344  ! 17: LDSH_I	ldsh	[%r10 + 0x0344], %r5
	.word 0x9dda800b  ! 18: FLUSH_R	dis not found

	.word 0x40000001  ! 19: CALL	call	disp30_1
	.word 0xdca2aa84  ! 20: STWA_I	stwa	%r14, [%r10 + 0x0a84] %asi
	.word 0xc36a800b  ! 21: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x8143e030  ! 22: MEMBAR	membar	#Lookaside | #MemIssue 
	.word 0xc8a2900b  ! 23: STWA_R	stwa	%r4, [%r10 + %r11] 0x80
	.word 0xcfe2900b  ! 24: CASA_I	casa	[%r10] 0x80, %r11, %r7
	.word 0xbd6a800b  ! 25: SDIVX_R	sdivx	%r10, %r11, %r30
	.word 0xe64aa734  ! 26: LDSB_I	ldsb	[%r10 + 0x0734], %r19
	.word 0xf0f2aee8  ! 27: STXA_I	stxa	%r24, [%r10 + 0x0ee8] %asi
	.word 0xcb3aaad8  ! 28: STDF_I	std	%f5, [0x0ad8, %r10]
	.word 0x8fda800b  ! 29: FLUSH_R	dis not found

	.word 0xba72ac30  ! 32: UDIV_I	udiv 	%r10, 0x0c30, %r29
	.word 0x0cca0003  ! 34: BRGZ	brgz  ,pt	%8,<label_0xa0003>
	.word 0x8143e027  ! 36: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #MemIssue 
	.word 0x83daa1b8  ! 37: FLUSH_I	dis not found

	.word 0xd33aade8  ! 38: STDF_I	std	%f9, [0x0de8, %r10]
	.word 0x8e4a800b  ! 39: MULX_R	mulx 	%r10, %r11, %r7
	.word 0x1c800001  ! 40: BPOS	bpos  	<label_0x1>
	.word 0x85a289ab  ! 41: FDIVs	fdivs	%f10, %f11, %f2
	.word 0xee0a800b  ! 42: LDUB_R	ldub	[%r10 + %r11], %r23
	.word 0xfbf2a00b  ! 43: CASXA_R	casxa	[%r10]%asi, %r11, %r29
	.word 0xecba900b  ! 44: STDA_R	stda	%r22, [%r10 + %r11] 0x80
	.word 0x925aa3c8  ! 45: SMUL_I	smul 	%r10, 0x03c8, %r9
	.word 0xc3ea900b  ! 46: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0xf4aaab70  ! 49: STBA_I	stba	%r26, [%r10 + 0x0b70] %asi
	.word 0xc6eaa9e4  ! 52: LDSTUBA_I	ldstuba	%r3, [%r10 + 0x09e4] %asi
	.word 0xc87a800b  ! 53: SWAP_R	swap	%r4, [%r10 + %r11]
	.word 0x88f2af0c  ! 54: UDIVcc_I	udivcc 	%r10, 0x0f0c, %r4
	.word 0x8143e00e  ! 56: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore 
	.word 0x9272800b  ! 57: UDIV_R	udiv 	%r10, %r11, %r9
	.word 0x896aab10  ! 58: SDIVX_I	sdivx	%r10, 0x0b10, %r4
	.word 0x10800003  ! 59: BA	ba  	<label_0x3>
	.word 0xc2c2a1cc  ! 60: LDSWA_I	ldswa	[%r10, + 0x01cc] %asi, %r1
	.word 0xe282900b  ! 61: LDUWA_R	lduwa	[%r10, %r11] 0x80, %r17
	.word 0xfc6a800b  ! 62: LDSTUB_R	ldstub	%r30, [%r10 + %r11]
	.word 0x9322800b  ! 63: MULScc_R	mulscc 	%r10, %r11, %r9
	.word 0x867a800b  ! 64: SDIV_R	sdiv 	%r10, %r11, %r3
	.word 0xede2a00b  ! 65: CASA_R	casa	[%r10] %asi, %r11, %r22
	.word 0xe042a2a8  ! 66: LDSW_I	ldsw	[%r10 + 0x02a8], %r16
	.word 0x8143e067  ! 67: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #MemIssue | #Sync 
	.word 0xd0c2900b  ! 68: LDSWA_R	ldswa	[%r10, %r11] 0x80, %r8
	.word 0xd812a2f4  ! 69: LDUH_I	lduh	[%r10 + 0x02f4], %r12
	.word 0x8143e076  ! 70: MEMBAR	membar	#StoreLoad | #LoadStore | #Lookaside | #MemIssue | #Sync 
	.word 0xcf3aa3c0  ! 71: STDF_I	std	%f7, [0x03c0, %r10]
	.word 0xbef2800b  ! 72: UDIVcc_R	udivcc 	%r10, %r11, %r31
	.word 0xc3eaac6c  ! 73: PREFETCHA_I	prefetcha	[%r10, + 0x0c6c] %asi, #one_read
	.word 0x2cc20001  ! 74: BRGZ	brgz,a,nt	%8,<label_0x20001>
	.word 0x93da800b  ! 75: FLUSH_R	dis not found

	.word 0xcbe2a00b  ! 76: CASA_R	casa	[%r10] %asi, %r11, %r5
	.word 0x8ef2a284  ! 77: UDIVcc_I	udivcc 	%r10, 0x0284, %r7
	.word 0x2c800003  ! 78: BNEG	bneg,a	<label_0x3>
	.word 0x36800001  ! 79: BGE	bge,a	<label_0x1>
	.word 0xcf22800b  ! 80: STF_R	st	%f7, [%r11, %r10]
	.word 0xc4eaa3e8  ! 81: LDSTUBA_I	ldstuba	%r2, [%r10 + 0x03e8] %asi
	.word 0x8143c000  ! 82: STBAR	stbar
	.word 0xc0baa1f0  ! 83: STDA_I	stda	%r0, [%r10 + 0x01f0] %asi
	.word 0x8143c000  ! 84: STBAR	stbar
	.word 0x22ca0003  ! 85: BRZ	brz,a,pt	%8,<label_0xa0003>
	.word 0x93a2892b  ! 86: FMULs	fmuls	%f10, %f11, %f9
	.word 0xb44a800b  ! 87: MULX_R	mulx 	%r10, %r11, %r26
	.word 0x92daa83c  ! 88: SMULcc_I	smulcc 	%r10, 0x083c, %r9
	.word 0x89daa708  ! 89: FLUSH_I	dis not found

	.word 0xe082900b  ! 90: LDUWA_R	lduwa	[%r10, %r11] 0x80, %r16
	.word 0x8143e017  ! 91: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside 
	.word 0x2a800003  ! 92: BCS	bcs,a	<label_0x3>
	.word 0xe202800b  ! 93: LDUW_R	lduw	[%r10 + %r11], %r17
	.word 0xc3e2a00b  ! 94: CASA_R	casa	[%r10] %asi, %r11, %r1
	.word 0x84da800b  ! 95: SMULcc_R	smulcc 	%r10, %r11, %r2
	.word 0x8143c000  ! 96: STBAR	stbar
	.word 0xc3eaa25c  ! 97: PREFETCHA_I	prefetcha	[%r10, + 0x025c] %asi, #one_read
	.word 0x8c4a800b  ! 99: MULX_R	mulx 	%r10, %r11, %r6
	.word 0x8143c000  ! 100: STBAR	stbar
	.word 0x8cda800b  ! 101: SMULcc_R	smulcc 	%r10, %r11, %r6
	.word 0xce12800b  ! 102: LDUH_R	lduh	[%r10 + %r11], %r7
	.word 0xdf3a800b  ! 103: STDF_R	std	%f15, [%r11, %r10]
	.word 0xce8a900b  ! 104: LDUBA_R	lduba	[%r10, %r11] 0x80, %r7
	.word 0x8143c000  ! 105: STBAR	stbar
	.word 0xf4ba900b  ! 106: STDA_R	stda	%r26, [%r10 + %r11] 0x80
	.word 0xd252800b  ! 107: LDSH_R	ldsh	[%r10 + %r11], %r9
	.word 0xc452aba8  ! 108: LDSH_I	ldsh	[%r10 + 0x0ba8], %r2
	.word 0x89da800b  ! 109: FLUSH_R	dis not found

	.word 0xfaca900b  ! 110: LDSBA_R	ldsba	[%r10, %r11] 0x80, %r29
	.word 0xce0a800b  ! 111: LDUB_R	ldub	[%r10 + %r11], %r7
	.word 0xf3e2a00b  ! 112: CASA_R	casa	[%r10] %asi, %r11, %r25
	.word 0x1a800003  ! 113: BCC	bcc  	<label_0x3>
	.word 0x99daa8d4  ! 114: FLUSH_I	dis not found

	.word 0xc33a800b  ! 115: STDF_R	std	%f1, [%r11, %r10]
	.word 0x8143c000  ! 116: STBAR	stbar
	.word 0xd26aa968  ! 117: LDSTUB_I	ldstub	%r9, [%r10 + 0x0968]
	.word 0xc36a800b  ! 118: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0xcaa2900b  ! 119: STWA_R	stwa	%r5, [%r10 + %r11] 0x80
	.word 0xafda800b  ! 120: FLUSH_R	dis not found

	.word 0xc522800b  ! 122: STF_R	st	%f2, [%r11, %r10]
	.word 0xbc5aa828  ! 123: SMUL_I	smul 	%r10, 0x0828, %r30
	.word 0xce0a800b  ! 124: LDUB_R	ldub	[%r10 + %r11], %r7
	.word 0xcc12aa60  ! 126: LDUH_I	lduh	[%r10 + 0x0a60], %r6
	.word 0xf042a320  ! 128: LDSW_I	ldsw	[%r10 + 0x0320], %r24
	.word 0xc86a800b  ! 129: LDSTUB_R	ldstub	%r4, [%r10 + %r11]
	.word 0x8143e061  ! 130: MEMBAR	membar	#LoadLoad | #MemIssue | #Sync 
	.word 0xf60aa5dc  ! 131: LDUB_I	ldub	[%r10 + 0x05dc], %r27
	.word 0xfc12a8b8  ! 132: LDUH_I	lduh	[%r10 + 0x08b8], %r30
	.word 0x92f2800b  ! 133: UDIVcc_R	udivcc 	%r10, %r11, %r9
	.word 0x8e72a6b8  ! 134: UDIV_I	udiv 	%r10, 0x06b8, %r7
	.word 0xc6b2900b  ! 135: STHA_R	stha	%r3, [%r10 + %r11] 0x80
	.word 0xc452800b  ! 136: LDSH_R	ldsh	[%r10 + %r11], %r2
	.word 0x8143e013  ! 137: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside 
	.word 0xc3ea900b  ! 138: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0xcccaaa70  ! 139: LDSBA_I	ldsba	[%r10, + 0x0a70] %asi, %r6
	.word 0x38800003  ! 141: BGU	bgu,a	<label_0x3>
	.word 0xd052800b  ! 142: LDSH_R	ldsh	[%r10 + %r11], %r8
	.word 0x84da800b  ! 143: SMULcc_R	smulcc 	%r10, %r11, %r2
	.word 0xd08a900b  ! 144: LDUBA_R	lduba	[%r10, %r11] 0x80, %r8
	.word 0xf882a280  ! 145: LDUWA_I	lduwa	[%r10, + 0x0280] %asi, %r28
	.word 0x8143c000  ! 146: STBAR	stbar
	.word 0xdefa900b  ! 147: SWAPA_R	swapa	%r15, [%r10 + %r11] 0x80
	.word 0xd13aa6d8  ! 148: STDF_I	std	%f8, [0x06d8, %r10]
	.word 0x2a800001  ! 149: BCS	bcs,a	<label_0x1>
	.word 0xcd22ad88  ! 150: STF_I	st	%f6, [0x0d88, %r10]
	.word 0xc3eaa670  ! 151: PREFETCHA_I	prefetcha	[%r10, + 0x0670] %asi, #one_read
	.word 0x8143e01b  ! 152: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Lookaside 
	.word 0x8143c000  ! 153: STBAR	stbar
	.word 0xd0b2a028  ! 154: STHA_I	stha	%r8, [%r10 + 0x0028] %asi
	.word 0x8143e03c  ! 155: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0xde92900b  ! 156: LDUHA_R	lduha	[%r10, %r11] 0x80, %r15
	.word 0xc8ba900b  ! 157: STDA_R	stda	%r4, [%r10 + %r11] 0x80
	.word 0xccc2ad48  ! 158: LDSWA_I	ldswa	[%r10, + 0x0d48] %asi, %r6
	.word 0x0a800001  ! 159: BCS	bcs  	<label_0x1>
	.word 0x8bdaaa2c  ! 160: FLUSH_I	dis not found

	.word 0xcc52ae88  ! 161: LDSH_I	ldsh	[%r10 + 0x0e88], %r6
	.word 0xc322800b  ! 162: STF_R	st	%f1, [%r11, %r10]
	.word 0xc692a9d4  ! 163: LDUHA_I	lduha	[%r10, + 0x09d4] %asi, %r3
	.word 0xbbdaadc8  ! 164: FLUSH_I	dis not found

	.word 0x884aabf0  ! 165: MULX_I	mulx 	%r10, 0x0bf0, %r4
	.word 0x3a800003  ! 166: BCC	bcc,a	<label_0x3>
	.word 0xc64aaf40  ! 167: LDSB_I	ldsb	[%r10 + 0x0f40], %r3
	.word 0x847aab80  ! 168: SDIV_I	sdiv 	%r10, 0x0b80, %r2
	.word 0x8143c000  ! 169: STBAR	stbar
	.word 0x8143c000  ! 170: STBAR	stbar
	.word 0x8252aee0  ! 171: UMUL_I	umul 	%r10, 0x0ee0, %r1
	.word 0xc3eaa9f4  ! 172: PREFETCHA_I	prefetcha	[%r10, + 0x09f4] %asi, #one_read
	.word 0xce0aaa84  ! 173: LDUB_I	ldub	[%r10 + 0x0a84], %r7
	.word 0xcca2900b  ! 174: STWA_R	stwa	%r6, [%r10 + %r11] 0x80
	.word 0x93a289ab  ! 175: FDIVs	fdivs	%f10, %f11, %f9
	.word 0xc8f2a2f8  ! 176: STXA_I	stxa	%r4, [%r10 + 0x02f8] %asi
	.word 0x9122abd4  ! 177: MULScc_I	mulscc 	%r10, 0x0bd4, %r8
	.word 0x8143c000  ! 178: STBAR	stbar
	.word 0xecfa900b  ! 179: SWAPA_R	swapa	%r22, [%r10 + %r11] 0x80
	.word 0xc4baa348  ! 180: STDA_I	stda	%r2, [%r10 + 0x0348] %asi
	.word 0x0a800001  ! 181: BCS	bcs  	<label_0x1>
	.word 0xd2fa900b  ! 182: SWAPA_R	swapa	%r9, [%r10 + %r11] 0x80
	.word 0x8143c000  ! 183: STBAR	stbar
	.word 0xd1f2a00b  ! 184: CASXA_R	casxa	[%r10]%asi, %r11, %r8
	.word 0x8143e063  ! 185: MEMBAR	membar	#LoadLoad | #StoreLoad | #MemIssue | #Sync 
	.word 0xc202a704  ! 186: LDUW_I	lduw	[%r10 + 0x0704], %r1
	.word 0xd1f2900b  ! 187: CASXA_I	casxa	[%r10] 0x80, %r11, %r8
	.word 0x91a289ab  ! 188: FDIVs	fdivs	%f10, %f11, %f8
	.word 0x10800001  ! 189: BA	ba  	<label_0x1>
	.word 0xc36aa3cc  ! 190: PREFETCH_I	prefetch	[%r10 + 0x03cc], #one_read
	.word 0x22800001  ! 191: BE	be,a	<label_0x1>
	.word 0xd24a800b  ! 192: LDSB_R	ldsb	[%r10 + %r11], %r9
	.word 0xc89aa910  ! 193: LDDA_I	ldda	[%r10, + 0x0910] %asi, %r4
	.word 0x93da800b  ! 194: FLUSH_R	dis not found

	.word 0xa2d2800b  ! 195: UMULcc_R	umulcc 	%r10, %r11, %r17
	.word 0x89da800b  ! 196: FLUSH_R	dis not found

	.word 0x91a288ab  ! 197: FSUBs	fsubs	%f10, %f11, %f8
	.word 0xc8aaaca4  ! 198: STBA_I	stba	%r4, [%r10 + 0x0ca4] %asi
	.word 0x1e800001  ! 199: BVC	bvc  	<label_0x1>
	.word 0x8143e04a  ! 200: MEMBAR	membar	#StoreLoad | #StoreStore | #Sync 
	.word 0xbda289ab  ! 201: FDIVs	fdivs	%f10, %f11, %f30
	.word 0xc41aa118  ! 202: LDD_I	ldd	[%r10 + 0x0118], %r2
	.word 0xcf3aa770  ! 203: STDF_I	std	%f7, [0x0770, %r10]
	.word 0xc36a800b  ! 204: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0xc2a2900b  ! 206: STWA_R	stwa	%r1, [%r10 + %r11] 0x80
	.word 0xc4f2a658  ! 207: STXA_I	stxa	%r2, [%r10 + 0x0658] %asi
	.word 0x8da2892b  ! 208: FMULs	fmuls	%f10, %f11, %f6
	.word 0xa2d2800b  ! 209: UMULcc_R	umulcc 	%r10, %r11, %r17
	.word 0xc68a900b  ! 210: LDUBA_R	lduba	[%r10, %r11] 0x80, %r3
	.word 0x8143e00e  ! 211: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore 
	.word 0xe1e2a00b  ! 212: CASA_R	casa	[%r10] %asi, %r11, %r16
	.word 0x984a800b  ! 213: MULX_R	mulx 	%r10, %r11, %r12
	.word 0x8143c000  ! 214: STBAR	stbar
	.word 0xd082900b  ! 215: LDUWA_R	lduwa	[%r10, %r11] 0x80, %r8
	.word 0xa7daabcc  ! 216: FLUSH_I	dis not found

	.word 0xd282a7f4  ! 217: LDUWA_I	lduwa	[%r10, + 0x07f4] %asi, %r9
	.word 0x8a72800b  ! 218: UDIV_R	udiv 	%r10, %r11, %r5
	.word 0x9ed2800b  ! 219: UMULcc_R	umulcc 	%r10, %r11, %r15
	.word 0xafdaa088  ! 220: FLUSH_I	dis not found

	.word 0xd00a800b  ! 221: LDUB_R	ldub	[%r10 + %r11], %r8
	.word 0xc20aa2ac  ! 222: LDUB_I	ldub	[%r10 + 0x02ac], %r1
	.word 0x9efaa1f4  ! 223: SDIVcc_I	sdivcc 	%r10, 0x01f4, %r15
	.word 0xd2a2a46c  ! 224: STWA_I	stwa	%r9, [%r10 + 0x046c] %asi
	.word 0xc3eaa4bc  ! 225: PREFETCHA_I	prefetcha	[%r10, + 0x04bc] %asi, #one_read
	.word 0xd8b2900b  ! 226: STHA_R	stha	%r12, [%r10 + %r11] 0x80
	.word 0x06c20001  ! 227: BRLZ	brlz  ,nt	%8,<label_0x20001>
	.word 0xcc12800b  ! 228: LDUH_R	lduh	[%r10 + %r11], %r6
	.word 0x8143e071  ! 229: MEMBAR	membar	#LoadLoad | #Lookaside | #MemIssue | #Sync 
	.word 0xc84aa798  ! 230: LDSB_I	ldsb	[%r10 + 0x0798], %r4
	.word 0xc33a800b  ! 231: STDF_R	std	%f1, [%r11, %r10]
	.word 0xd20aabd0  ! 232: LDUB_I	ldub	[%r10 + 0x0bd0], %r9
	.word 0x8143e001  ! 233: MEMBAR	membar	#LoadLoad 
	.word 0xce02800b  ! 234: LDUW_R	lduw	[%r10 + %r11], %r7
	.word 0xdc1a800b  ! 235: LDD_R	ldd	[%r10 + %r11], %r14
	.word 0x8c6aacb4  ! 236: UDIVX_I	udivx 	%r10, 0x0cb4, %r6
	.word 0xadda800b  ! 237: FLUSH_R	dis not found

	.word 0xead2a550  ! 238: LDSHA_I	ldsha	[%r10, + 0x0550] %asi, %r21
	.word 0xaddaaa5c  ! 239: FLUSH_I	dis not found

	.word 0xc8ca900b  ! 240: LDSBA_R	ldsba	[%r10, %r11] 0x80, %r4
	.word 0x8143e04b  ! 241: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Sync 
	.word 0xc36a800b  ! 242: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0xc81aa310  ! 243: LDD_I	ldd	[%r10 + 0x0310], %r4
	.word 0xc84aac88  ! 244: LDSB_I	ldsb	[%r10 + 0x0c88], %r4
	.word 0xc3f2a00b  ! 245: CASXA_R	casxa	[%r10]%asi, %r11, %r1
	.word 0x8722a3e4  ! 246: MULScc_I	mulscc 	%r10, 0x03e4, %r3
	.word 0x8143e021  ! 248: MEMBAR	membar	#LoadLoad | #MemIssue 
	.word 0xc60aa388  ! 250: LDUB_I	ldub	[%r10 + 0x0388], %r3
	.word 0x24800001  ! 251: BLE	ble,a	<label_0x1>
	.word 0xca92ad4c  ! 252: LDUHA_I	lduha	[%r10, + 0x0d4c] %asi, %r5
	.word 0x24800001  ! 253: BLE	ble,a	<label_0x1>
	.word 0xc2c2a10c  ! 254: LDSWA_I	ldswa	[%r10, + 0x010c] %asi, %r1
	.word 0x9122ab90  ! 255: MULScc_I	mulscc 	%r10, 0x0b90, %r8
	.word 0x8143e060  ! 256: MEMBAR	membar	#MemIssue | #Sync 
	.word 0x8143c000  ! 257: STBAR	stbar
	.word 0xc9f2a00b  ! 258: CASXA_R	casxa	[%r10]%asi, %r11, %r4
	.word 0xe0d2aeb4  ! 259: LDSHA_I	ldsha	[%r10, + 0x0eb4] %asi, %r16
	.word 0xccea900b  ! 260: LDSTUBA_R	ldstuba	%r6, [%r10 + %r11] 0x80
	.word 0x38800001  ! 261: BGU	bgu,a	<label_0x1>
	.word 0xc6fa900b  ! 262: SWAPA_R	swapa	%r3, [%r10 + %r11] 0x80
	.word 0xf2eaa1b0  ! 263: LDSTUBA_I	ldstuba	%r25, [%r10 + 0x01b0] %asi
	.word 0xc8ba900b  ! 264: STDA_R	stda	%r4, [%r10 + %r11] 0x80
	.word 0xc36a800b  ! 265: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0xe612a564  ! 266: LDUH_I	lduh	[%r10 + 0x0564], %r19
	.word 0xea4aa82c  ! 267: LDSB_I	ldsb	[%r10 + 0x082c], %r21
	.word 0x8143c000  ! 268: STBAR	stbar
	.word 0xcc1aa7f0  ! 269: LDD_I	ldd	[%r10 + 0x07f0], %r6
	.word 0x91da800b  ! 270: FLUSH_R	dis not found

	.word 0x8143c000  ! 271: STBAR	stbar
	.word 0x8252800b  ! 272: UMUL_R	umul 	%r10, %r11, %r1
	.word 0xda6a800b  ! 273: LDSTUB_R	ldstub	%r13, [%r10 + %r11]
	.word 0xceaaa430  ! 274: STBA_I	stba	%r7, [%r10 + 0x0430] %asi
	.word 0xe87aa594  ! 275: SWAP_I	swap	%r20, [%r10 + 0x0594]
	.word 0x26ca0001  ! 276: BRLZ	brlz,a,pt	%8,<label_0xa0001>
	.word 0x86d2800b  ! 277: UMULcc_R	umulcc 	%r10, %r11, %r3
	.word 0xc3eaa0dc  ! 278: PREFETCHA_I	prefetcha	[%r10, + 0x00dc] %asi, #one_read
	.word 0x827aa684  ! 279: SDIV_I	sdiv 	%r10, 0x0684, %r1
	.word 0x8143c000  ! 280: STBAR	stbar
	.word 0x8143e029  ! 281: MEMBAR	membar	#LoadLoad | #StoreStore | #MemIssue 
	.word 0x8143e06c  ! 282: MEMBAR	membar	#LoadStore | #StoreStore | #MemIssue | #Sync 
	.word 0xc612a198  ! 283: LDUH_I	lduh	[%r10 + 0x0198], %r3
	.word 0x2ec20001  ! 284: BRGEZ	brgez,a,nt	%8,<label_0x20001>
	.word 0x8472800b  ! 285: UDIV_R	udiv 	%r10, %r11, %r2
	.word 0x83daa358  ! 286: FLUSH_I	dis not found

	.word 0x905a800b  ! 287: SMUL_R	smul 	%r10, %r11, %r8
	.word 0x8a7a800b  ! 288: SDIV_R	sdiv 	%r10, %r11, %r5
	.word 0xc842800b  ! 289: LDSW_R	ldsw	[%r10 + %r11], %r4
	.word 0xd8aaa048  ! 290: STBA_I	stba	%r12, [%r10 + 0x0048] %asi
	.word 0xd0d2900b  ! 291: LDSHA_R	ldsha	[%r10, %r11] 0x80, %r8
	.word 0x40000001  ! 292: CALL	call	disp30_1
	.word 0xf06a800b  ! 293: LDSTUB_R	ldstub	%r24, [%r10 + %r11]
	.word 0xc89a900b  ! 294: LDDA_R	ldda	[%r10, %r11] 0x80, %r4
	.word 0x8143c000  ! 295: STBAR	stbar
	.word 0x84faa72c  ! 296: SDIVcc_I	sdivcc 	%r10, 0x072c, %r2
	.word 0x8143c000  ! 297: STBAR	stbar
	.word 0x90da800b  ! 298: SMULcc_R	smulcc 	%r10, %r11, %r8
	.word 0xc452800b  ! 299: LDSH_R	ldsh	[%r10 + %r11], %r2
	.word 0xccf2900b  ! 300: STXA_R	stxa	%r6, [%r10 + %r11] 0x80
	.word 0xd09a900b  ! 301: LDDA_R	ldda	[%r10, %r11] 0x80, %r8
	.word 0xe66aabd8  ! 302: LDSTUB_I	ldstub	%r19, [%r10 + 0x0bd8]
	.word 0xc9e2a00b  ! 303: CASA_R	casa	[%r10] %asi, %r11, %r4
	.word 0xa7da800b  ! 304: FLUSH_R	dis not found

	.word 0x91da800b  ! 305: FLUSH_R	dis not found

	.word 0xc3eaa1cc  ! 306: PREFETCHA_I	prefetcha	[%r10, + 0x01cc] %asi, #one_read
	.word 0x22c20003  ! 307: BRZ	brz,a,nt	%8,<label_0x20003>
	.word 0xd09a900b  ! 308: LDDA_R	ldda	[%r10, %r11] 0x80, %r8
	.word 0xaddaabf0  ! 309: FLUSH_I	dis not found

	.word 0x8143e043  ! 310: MEMBAR	membar	#LoadLoad | #StoreLoad | #Sync 
	.word 0x924aa5c0  ! 312: MULX_I	mulx 	%r10, 0x05c0, %r9
	.word 0x825aa5c8  ! 313: SMUL_I	smul 	%r10, 0x05c8, %r1
	.word 0xeeb2a870  ! 314: STHA_I	stha	%r23, [%r10 + 0x0870] %asi
	.word 0xc46aaf54  ! 315: LDSTUB_I	ldstub	%r2, [%r10 + 0x0f54]
	.word 0xd0baa328  ! 316: STDA_I	stda	%r8, [%r10 + 0x0328] %asi
	.word 0x8143c000  ! 317: STBAR	stbar
	.word 0xcd22a2c8  ! 318: STF_I	st	%f6, [0x02c8, %r10]
	.word 0x40000001  ! 319: CALL	call	disp30_1
	.word 0xbef2800b  ! 320: UDIVcc_R	udivcc 	%r10, %r11, %r31
	.word 0x40000001  ! 321: CALL	call	disp30_1
	.word 0xa4d2ad70  ! 322: UMULcc_I	umulcc 	%r10, 0x0d70, %r18
	.word 0x8eda800b  ! 323: SMULcc_R	smulcc 	%r10, %r11, %r7
	.word 0x9bdaa970  ! 324: FLUSH_I	dis not found

	.word 0x8d6aa1e4  ! 325: SDIVX_I	sdivx	%r10, 0x01e4, %r6
	.word 0xc36a800b  ! 326: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x8143c000  ! 327: STBAR	stbar
	.word 0x8143c000  ! 328: STBAR	stbar
	.word 0xc682900b  ! 329: LDUWA_R	lduwa	[%r10, %r11] 0x80, %r3
	.word 0xdaaa900b  ! 330: STBA_R	stba	%r13, [%r10 + %r11] 0x80
	.word 0xc2ea900b  ! 331: LDSTUBA_R	ldstuba	%r1, [%r10 + %r11] 0x80
	.word 0x04800001  ! 332: BLE	ble  	<label_0x1>
	.word 0x836aa45c  ! 333: SDIVX_I	sdivx	%r10, 0x045c, %r1
	.word 0x2ac20001  ! 334: BRNZ	brnz,a,nt	%8,<label_0x20001>
	.word 0xc2ea900b  ! 335: LDSTUBA_R	ldstuba	%r1, [%r10 + %r11] 0x80
	.word 0xda6aa684  ! 336: LDSTUB_I	ldstub	%r13, [%r10 + 0x0684]
	.word 0xba7aa768  ! 337: SDIV_I	sdiv 	%r10, 0x0768, %r29
	.word 0x8143e027  ! 338: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #MemIssue 
	.word 0xccc2a270  ! 339: LDSWA_I	ldswa	[%r10, + 0x0270] %asi, %r6
	.word 0x0e800003  ! 340: BVS	bvs  	<label_0x3>
	.word 0xc4c2af9c  ! 341: LDSWA_I	ldswa	[%r10, + 0x0f9c] %asi, %r2
	.word 0xb1a2892b  ! 342: FMULs	fmuls	%f10, %f11, %f24
	.word 0xecb2aa68  ! 343: STHA_I	stha	%r22, [%r10 + 0x0a68] %asi
	.word 0x8143e047  ! 344: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Sync 
	.word 0xe0d2900b  ! 345: LDSHA_R	ldsha	[%r10, %r11] 0x80, %r16
	.word 0xa9a2892b  ! 346: FMULs	fmuls	%f10, %f11, %f20
	.word 0x93da800b  ! 347: FLUSH_R	dis not found

	.word 0x2c800001  ! 348: BNEG	bneg,a	<label_0x1>
	.word 0xec42ad18  ! 349: LDSW_I	ldsw	[%r10 + 0x0d18], %r22
	.word 0x00800003  ! 350: BN	bn  	<label_0x3>
	.word 0x8d22a064  ! 351: MULScc_I	mulscc 	%r10, 0x0064, %r6
	.word 0x84f2800b  ! 352: UDIVcc_R	udivcc 	%r10, %r11, %r2
	.word 0xc36aa1c8  ! 353: PREFETCH_I	prefetch	[%r10 + 0x01c8], #one_read
	.word 0xd0f2900b  ! 354: STXA_R	stxa	%r8, [%r10 + %r11] 0x80
	.word 0x3e800001  ! 355: BVC	bvc,a	<label_0x1>
	.word 0xd0c2a3c0  ! 356: LDSWA_I	ldswa	[%r10, + 0x03c0] %asi, %r8
	.word 0x93a2892b  ! 358: FMULs	fmuls	%f10, %f11, %f9
	.word 0x22ca0001  ! 359: BRZ	brz,a,pt	%8,<label_0xa0001>
	.word 0x0cc20001  ! 360: BRGZ	brgz  ,nt	%8,<label_0x20001>
	.word 0x91da800b  ! 361: FLUSH_R	dis not found

	.word 0xeaeaa0cc  ! 362: LDSTUBA_I	ldstuba	%r21, [%r10 + 0x00cc] %asi
	.word 0xcd3aa700  ! 363: STDF_I	std	%f6, [0x0700, %r10]
	.word 0x884aad58  ! 364: MULX_I	mulx 	%r10, 0x0d58, %r4
	.word 0xf81aa620  ! 365: LDD_I	ldd	[%r10 + 0x0620], %r28
	.word 0xc46a800b  ! 366: LDSTUB_R	ldstub	%r2, [%r10 + %r11]
	.word 0xdc52a3e8  ! 367: LDSH_I	ldsh	[%r10 + 0x03e8], %r14
	.word 0x8143c000  ! 368: STBAR	stbar
	.word 0xc522a4e0  ! 369: STF_I	st	%f2, [0x04e0, %r10]
	.word 0xc36aac10  ! 370: PREFETCH_I	prefetch	[%r10 + 0x0c10], #one_read
	.word 0x1c800001  ! 371: BPOS	bpos  	<label_0x1>
	.word 0x24ca0001  ! 372: BRLEZ	brlez,a,pt	%8,<label_0xa0001>
	.word 0xe41a800b  ! 373: LDD_R	ldd	[%r10 + %r11], %r18
	.word 0xc4b2a324  ! 374: STHA_I	stha	%r2, [%r10 + 0x0324] %asi
	.word 0xdd3a800b  ! 375: STDF_R	std	%f14, [%r11, %r10]
	.word 0x9072800b  ! 376: UDIV_R	udiv 	%r10, %r11, %r8
	.word 0x8143e01d  ! 377: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside 
	.word 0xd01aad50  ! 378: LDD_I	ldd	[%r10 + 0x0d50], %r8
	.word 0xf4c2abe8  ! 379: LDSWA_I	ldswa	[%r10, + 0x0be8] %asi, %r26
	.word 0x8143e05c  ! 380: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0x2c800001  ! 381: BNEG	bneg,a	<label_0x1>
	.word 0xdf3aa390  ! 382: STDF_I	std	%f15, [0x0390, %r10]
	.word 0xd2d2900b  ! 383: LDSHA_R	ldsha	[%r10, %r11] 0x80, %r9
	.word 0xe20a800b  ! 384: LDUB_R	ldub	[%r10 + %r11], %r17
	.word 0x92f2a274  ! 385: UDIVcc_I	udivcc 	%r10, 0x0274, %r9
	.word 0xc36aad18  ! 386: PREFETCH_I	prefetch	[%r10 + 0x0d18], #one_read
	.word 0x0e800001  ! 387: BVS	bvs  	<label_0x1>
	.word 0x8143e025  ! 388: MEMBAR	membar	#LoadLoad | #LoadStore | #MemIssue 
	.word 0xc3f2a00b  ! 389: CASXA_R	casxa	[%r10]%asi, %r11, %r1
	.word 0xb3daacc4  ! 390: FLUSH_I	dis not found

	.word 0x876a800b  ! 391: SDIVX_R	sdivx	%r10, %r11, %r3
	.word 0x8e4a800b  ! 392: MULX_R	mulx 	%r10, %r11, %r7
	.word 0x8252800b  ! 393: UMUL_R	umul 	%r10, %r11, %r1
	.word 0xc5f2900b  ! 394: CASXA_I	casxa	[%r10] 0x80, %r11, %r2
	.word 0xa7da800b  ! 395: FLUSH_R	dis not found

	.word 0xfb22a3e8  ! 396: STF_I	st	%f29, [0x03e8, %r10]
	.word 0x93daa440  ! 397: FLUSH_I	dis not found

	.word 0x8143c000  ! 398: STBAR	stbar
	.word 0xd0baad28  ! 399: STDA_I	stda	%r8, [%r10 + 0x0d28] %asi
	.word 0x8143c000  ! 400: STBAR	stbar
	.word 0x9bda800b  ! 401: FLUSH_R	dis not found

	.word 0x26c20001  ! 402: BRLZ	brlz,a,nt	%8,<label_0x20001>
	.word 0x9272a210  ! 403: UDIV_I	udiv 	%r10, 0x0210, %r9
	.word 0xe01a800b  ! 404: LDD_R	ldd	[%r10 + %r11], %r16
	.word 0xc36aa9e8  ! 405: PREFETCH_I	prefetch	[%r10 + 0x09e8], #one_read
	.word 0x3c800001  ! 406: BPOS	bpos,a	<label_0x1>
	.word 0x936a800b  ! 407: SDIVX_R	sdivx	%r10, %r11, %r9
	.word 0x8b6aac94  ! 408: SDIVX_I	sdivx	%r10, 0x0c94, %r5
	.word 0x85a289ab  ! 409: FDIVs	fdivs	%f10, %f11, %f2
	.word 0x89a2892b  ! 410: FMULs	fmuls	%f10, %f11, %f4
	.word 0x8143c000  ! 412: STBAR	stbar
	.word 0xf65aa838  ! 413: LDX_I	ldx	[%r10 + 0x0838], %r27
	.word 0xc81a800b  ! 414: LDD_R	ldd	[%r10 + %r11], %r4
	.word 0xe8da900b  ! 415: LDXA_R	ldxa	[%r10, %r11] 0x80, %r20
	.word 0x9122a17c  ! 417: MULScc_I	mulscc 	%r10, 0x017c, %r8
	.word 0xc612ab30  ! 418: LDUH_I	lduh	[%r10 + 0x0b30], %r3
	.word 0xce02800b  ! 419: LDUW_R	lduw	[%r10 + %r11], %r7
	.word 0xc4eaa760  ! 420: LDSTUBA_I	ldstuba	%r2, [%r10 + 0x0760] %asi
	.word 0x1c800001  ! 421: BPOS	bpos  	<label_0x1>
	.word 0x85daa11c  ! 422: FLUSH_I	dis not found

	.word 0xd242afd4  ! 423: LDSW_I	ldsw	[%r10 + 0x0fd4], %r9
	.word 0xcb3aaa28  ! 424: STDF_I	std	%f5, [0x0a28, %r10]
	.word 0x9122800b  ! 425: MULScc_R	mulscc 	%r10, %r11, %r8
	.word 0x8e5aa100  ! 426: SMUL_I	smul 	%r10, 0x0100, %r7
	.word 0x84d2ac90  ! 427: UMULcc_I	umulcc 	%r10, 0x0c90, %r2
	.word 0x8143e070  ! 428: MEMBAR	membar	#Lookaside | #MemIssue | #Sync 
	.word 0x8bdaaf74  ! 429: FLUSH_I	dis not found

	.word 0xc66aa900  ! 430: LDSTUB_I	ldstub	%r3, [%r10 + 0x0900]
	.word 0xced2ab2c  ! 431: LDSHA_I	ldsha	[%r10, + 0x0b2c] %asi, %r7
	.word 0xc86aa760  ! 432: LDSTUB_I	ldstub	%r4, [%r10 + 0x0760]
	.word 0xc6b2900b  ! 433: STHA_R	stha	%r3, [%r10 + %r11] 0x80
	.word 0xcfe2900b  ! 434: CASA_I	casa	[%r10] 0x80, %r11, %r7
	.word 0x907a800b  ! 435: SDIV_R	sdiv 	%r10, %r11, %r8
	.word 0xa5da800b  ! 436: FLUSH_R	dis not found

	.word 0x1e800003  ! 437: BVC	bvc  	<label_0x3>
	.word 0x9a7a800b  ! 438: SDIV_R	sdiv 	%r10, %r11, %r13
	.word 0x826a800b  ! 439: UDIVX_R	udivx 	%r10, %r11, %r1
	.word 0x8c52800b  ! 440: UMUL_R	umul 	%r10, %r11, %r6
	.word 0x8bda800b  ! 441: FLUSH_R	dis not found

	.word 0xb852a664  ! 442: UMUL_I	umul 	%r10, 0x0664, %r28
	.word 0x8b6aa388  ! 443: SDIVX_I	sdivx	%r10, 0x0388, %r5
	.word 0xc3ea900b  ! 444: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0xc682a1b4  ! 445: LDUWA_I	lduwa	[%r10, + 0x01b4] %asi, %r3
	.word 0x91da800b  ! 446: FLUSH_R	dis not found

	.word 0xb2f2a8f8  ! 448: UDIVcc_I	udivcc 	%r10, 0x08f8, %r25
	.word 0x8143c000  ! 449: STBAR	stbar
	.word 0xbdda800b  ! 450: FLUSH_R	dis not found

	.word 0xe122800b  ! 451: STF_R	st	%f16, [%r11, %r10]
	.word 0x91daa0e8  ! 452: FLUSH_I	dis not found

	.word 0xaa5aaa30  ! 453: SMUL_I	smul 	%r10, 0x0a30, %r21
	.word 0x8143e025  ! 454: MEMBAR	membar	#LoadLoad | #LoadStore | #MemIssue 
	.word 0xd092900b  ! 457: LDUHA_R	lduha	[%r10, %r11] 0x80, %r8
	.word 0xd212800b  ! 458: LDUH_R	lduh	[%r10 + %r11], %r9
	.word 0xe8aaa21c  ! 459: STBA_I	stba	%r20, [%r10 + 0x021c] %asi
	.word 0x91daa964  ! 460: FLUSH_I	dis not found

	.word 0xc282a7e0  ! 461: LDUWA_I	lduwa	[%r10, + 0x07e0] %asi, %r1
	.word 0xce02800b  ! 462: LDUW_R	lduw	[%r10 + %r11], %r7
	.word 0x06c20001  ! 463: BRLZ	brlz  ,nt	%8,<label_0x20001>
	.word 0xc36aabf0  ! 464: PREFETCH_I	prefetch	[%r10 + 0x0bf0], #one_read
	.word 0xcaca900b  ! 465: LDSBA_R	ldsba	[%r10, %r11] 0x80, %r5
	.word 0x8143c000  ! 466: STBAR	stbar
	.word 0x0a800003  ! 467: BCS	bcs  	<label_0x3>
	.word 0xa25aa140  ! 468: SMUL_I	smul 	%r10, 0x0140, %r17
	.word 0xc7f2a00b  ! 469: CASXA_R	casxa	[%r10]%asi, %r11, %r3
	.word 0xbe72800b  ! 471: UDIV_R	udiv 	%r10, %r11, %r31
	.word 0xf0f2a140  ! 473: STXA_I	stxa	%r24, [%r10 + 0x0140] %asi
	.word 0xeaaaaa78  ! 474: STBA_I	stba	%r21, [%r10 + 0x0a78] %asi
	.word 0x846a800b  ! 475: UDIVX_R	udivx 	%r10, %r11, %r2
	.word 0x8fa2892b  ! 476: FMULs	fmuls	%f10, %f11, %f7
	.word 0xfcfaa1f4  ! 477: SWAPA_I	swapa	%r30, [%r10 + 0x01f4] %asi
	.word 0xc67a800b  ! 478: SWAP_R	swap	%r3, [%r10 + %r11]
	.word 0xca5aa3f0  ! 479: LDX_I	ldx	[%r10 + 0x03f0], %r5
	.word 0xc3eaa8b4  ! 480: PREFETCHA_I	prefetcha	[%r10, + 0x08b4] %asi, #one_read
	.word 0x8143c000  ! 481: STBAR	stbar
	.word 0xc33aa358  ! 482: STDF_I	std	%f1, [0x0358, %r10]
	.word 0x8143c000  ! 483: STBAR	stbar
	.word 0xccda900b  ! 484: LDXA_R	ldxa	[%r10, %r11] 0x80, %r6
	.word 0x8143e03f  ! 485: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0xa7da800b  ! 486: FLUSH_R	dis not found

	.word 0xf6b2900b  ! 487: STHA_R	stha	%r27, [%r10 + %r11] 0x80
	.word 0xc28a900b  ! 488: LDUBA_R	lduba	[%r10, %r11] 0x80, %r1
	.word 0xb07aa344  ! 489: SDIV_I	sdiv 	%r10, 0x0344, %r24
	.word 0xe5e2a00b  ! 490: CASA_R	casa	[%r10] %asi, %r11, %r18
	.word 0xa86aa3b0  ! 491: UDIVX_I	udivx 	%r10, 0x03b0, %r20
	.word 0x8143c000  ! 492: STBAR	stbar
	.word 0x8dda800b  ! 493: FLUSH_R	dis not found

	.word 0xcf22800b  ! 494: STF_R	st	%f7, [%r11, %r10]
	.word 0xdde2a00b  ! 495: CASA_R	casa	[%r10] %asi, %r11, %r14
	.word 0xd8caa228  ! 496: LDSBA_I	ldsba	[%r10, + 0x0228] %asi, %r12
	.word 0x04800003  ! 497: BLE	ble  	<label_0x3>
	.word 0xc7f2900b  ! 498: CASXA_I	casxa	[%r10] 0x80, %r11, %r3
	.word 0xc36a800b  ! 499: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0xe8daa528  ! 500: LDXA_I	ldxa	[%r10, + 0x0528] %asi, %r20
	.word 0xc8f2a780  ! 501: STXA_I	stxa	%r4, [%r10 + 0x0780] %asi
	.word 0xc41a800b  ! 502: LDD_R	ldd	[%r10 + %r11], %r2
	.word 0x844aad50  ! 503: MULX_I	mulx 	%r10, 0x0d50, %r2
	.word 0x30800001  ! 504: BA	ba,a	<label_0x1>
	.word 0xcaf2a950  ! 505: STXA_I	stxa	%r5, [%r10 + 0x0950] %asi
	.word 0xfc9aa970  ! 506: LDDA_I	ldda	[%r10, + 0x0970] %asi, %r30
	.word 0xcbf2900b  ! 507: CASXA_I	casxa	[%r10] 0x80, %r11, %r5
	.word 0xccca900b  ! 508: LDSBA_R	ldsba	[%r10, %r11] 0x80, %r6
	.word 0x85da800b  ! 509: FLUSH_R	dis not found

	.word 0xc6aa900b  ! 510: STBA_R	stba	%r3, [%r10 + %r11] 0x80
	.word 0x92faa77c  ! 511: SDIVcc_I	sdivcc 	%r10, 0x077c, %r9
	.word 0x85daa89c  ! 512: FLUSH_I	dis not found

	.word 0xc36aa8e4  ! 513: PREFETCH_I	prefetch	[%r10 + 0x08e4], #one_read
	.word 0xc88aa3fc  ! 514: LDUBA_I	lduba	[%r10, + 0x03fc] %asi, %r4
	.word 0xcc6a800b  ! 515: LDSTUB_R	ldstub	%r6, [%r10 + %r11]
	.word 0xcefaaa6c  ! 516: SWAPA_I	swapa	%r7, [%r10 + 0x0a6c] %asi
	.word 0x85da800b  ! 517: FLUSH_R	dis not found

	.word 0xc242800b  ! 518: LDSW_R	ldsw	[%r10 + %r11], %r1
	.word 0xb6fa800b  ! 519: SDIVcc_R	sdivcc 	%r10, %r11, %r27
	.word 0x26800003  ! 520: BL	bl,a	<label_0x3>
	.word 0xc292ab10  ! 521: LDUHA_I	lduha	[%r10, + 0x0b10] %asi, %r1
	.word 0xa722a984  ! 523: MULScc_I	mulscc 	%r10, 0x0984, %r19
	.word 0xcd3a800b  ! 525: STDF_R	std	%f6, [%r11, %r10]
	.word 0xdc42800b  ! 526: LDSW_R	ldsw	[%r10 + %r11], %r14
	.word 0x826aaf14  ! 527: UDIVX_I	udivx 	%r10, 0x0f14, %r1
	.word 0xc36a800b  ! 528: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0xb05aa8b4  ! 529: SMUL_I	smul 	%r10, 0x08b4, %r24
	.word 0xf4b2900b  ! 530: STHA_R	stha	%r26, [%r10 + %r11] 0x80
	.word 0x87a288ab  ! 531: FSUBs	fsubs	%f10, %f11, %f3
	.word 0x8fda800b  ! 532: FLUSH_R	dis not found

	.word 0xc212800b  ! 533: LDUH_R	lduh	[%r10 + %r11], %r1
	.word 0x8143c000  ! 534: STBAR	stbar
	.word 0xd0ba900b  ! 536: STDA_R	stda	%r8, [%r10 + %r11] 0x80
	.word 0x8d22afec  ! 537: MULScc_I	mulscc 	%r10, 0x0fec, %r6
	.word 0x8bdaa9a4  ! 538: FLUSH_I	dis not found

	.word 0xd892acc8  ! 539: LDUHA_I	lduha	[%r10, + 0x0cc8] %asi, %r12
	.word 0x92d2800b  ! 540: UMULcc_R	umulcc 	%r10, %r11, %r9
	.word 0x9cf2a0a8  ! 541: UDIVcc_I	udivcc 	%r10, 0x00a8, %r14
	.word 0xf492ab80  ! 542: LDUHA_I	lduha	[%r10, + 0x0b80] %asi, %r26
	.word 0xc6daa9d8  ! 543: LDXA_I	ldxa	[%r10, + 0x09d8] %asi, %r3
	.word 0xcc42800b  ! 544: LDSW_R	ldsw	[%r10 + %r11], %r6
	.word 0x9a4aa9a0  ! 545: MULX_I	mulx 	%r10, 0x09a0, %r13
	.word 0xc36a800b  ! 546: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0xf6d2900b  ! 548: LDSHA_R	ldsha	[%r10, %r11] 0x80, %r27
	.word 0x8c5aa74c  ! 549: SMUL_I	smul 	%r10, 0x074c, %r6
	.word 0x8143e06a  ! 550: MEMBAR	membar	#StoreLoad | #StoreStore | #MemIssue | #Sync 
	.word 0xd2ea900b  ! 551: LDSTUBA_R	ldstuba	%r9, [%r10 + %r11] 0x80
	.word 0x16800001  ! 553: BGE	bge  	<label_0x1>
	.word 0xccc2900b  ! 554: LDSWA_R	ldswa	[%r10, %r11] 0x80, %r6
	.word 0xae52800b  ! 555: UMUL_R	umul 	%r10, %r11, %r23
	.word 0xc3f2a00b  ! 556: CASXA_R	casxa	[%r10]%asi, %r11, %r1
	.word 0xa3da800b  ! 557: FLUSH_R	dis not found

	.word 0xa122800b  ! 558: MULScc_R	mulscc 	%r10, %r11, %r16
	.word 0xcf3a800b  ! 559: STDF_R	std	%f7, [%r11, %r10]
	.word 0x8143e03c  ! 560: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0xccfa900b  ! 561: SWAPA_R	swapa	%r6, [%r10 + %r11] 0x80
	.word 0xc36a800b  ! 562: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x82d2a6f8  ! 563: UMULcc_I	umulcc 	%r10, 0x06f8, %r1
	.word 0xf852800b  ! 564: LDSH_R	ldsh	[%r10 + %r11], %r28
	.word 0x93da800b  ! 565: FLUSH_R	dis not found

	.word 0xc26aa1dc  ! 566: LDSTUB_I	ldstub	%r1, [%r10 + 0x01dc]
	.word 0x845a800b  ! 567: SMUL_R	smul 	%r10, %r11, %r2
	.word 0x9b22a364  ! 569: MULScc_I	mulscc 	%r10, 0x0364, %r13
	.word 0x8143e06a  ! 570: MEMBAR	membar	#StoreLoad | #StoreStore | #MemIssue | #Sync 
	.word 0xfa0aa2bc  ! 571: LDUB_I	ldub	[%r10 + 0x02bc], %r29
	.word 0x88f2aa20  ! 572: UDIVcc_I	udivcc 	%r10, 0x0a20, %r4
	.word 0x04ca0003  ! 573: BRLEZ	brlez  ,pt	%8,<label_0xa0003>
	.word 0xd3f2900b  ! 574: CASXA_I	casxa	[%r10] 0x80, %r11, %r9
	.word 0x89a2892b  ! 575: FMULs	fmuls	%f10, %f11, %f4
	.word 0x85a288ab  ! 576: FSUBs	fsubs	%f10, %f11, %f2
	.word 0x8143e049  ! 577: MEMBAR	membar	#LoadLoad | #StoreStore | #Sync 
	.word 0xcceaad44  ! 578: LDSTUBA_I	ldstuba	%r6, [%r10 + 0x0d44] %asi
	.word 0x1a800001  ! 579: BCC	bcc  	<label_0x1>
	.word 0xd07a800b  ! 580: SWAP_R	swap	%r8, [%r10 + %r11]
	.word 0x86f2800b  ! 581: UDIVcc_R	udivcc 	%r10, %r11, %r3
	.word 0xc452aca8  ! 582: LDSH_I	ldsh	[%r10 + 0x0ca8], %r2
	.word 0x89da800b  ! 583: FLUSH_R	dis not found

	.word 0xc4ba900b  ! 584: STDA_R	stda	%r2, [%r10 + %r11] 0x80
	.word 0xca5aab18  ! 585: LDX_I	ldx	[%r10 + 0x0b18], %r5
	.word 0x91daa838  ! 586: FLUSH_I	dis not found

	.word 0x856aaaac  ! 587: SDIVX_I	sdivx	%r10, 0x0aac, %r2
	.word 0xca52800b  ! 588: LDSH_R	ldsh	[%r10 + %r11], %r5
	.word 0xb8da800b  ! 589: SMULcc_R	smulcc 	%r10, %r11, %r28
	.word 0xc24a800b  ! 590: LDSB_R	ldsb	[%r10 + %r11], %r1
	.word 0xc36aaa10  ! 591: PREFETCH_I	prefetch	[%r10 + 0x0a10], #one_read
	.word 0xb07a800b  ! 592: SDIV_R	sdiv 	%r10, %r11, %r24
	.word 0xc60a800b  ! 593: LDUB_R	ldub	[%r10 + %r11], %r3
	.word 0xd01a800b  ! 594: LDD_R	ldd	[%r10 + %r11], %r8
	.word 0xc20aa308  ! 595: LDUB_I	ldub	[%r10 + 0x0308], %r1
	.word 0xc88a900b  ! 596: LDUBA_R	lduba	[%r10, %r11] 0x80, %r4
	.word 0xf2fa900b  ! 597: SWAPA_R	swapa	%r25, [%r10 + %r11] 0x80
	.word 0x8b6aa864  ! 598: SDIVX_I	sdivx	%r10, 0x0864, %r5
	.word 0xfed2900b  ! 600: LDSHA_R	ldsha	[%r10, %r11] 0x80, %r31
	.word 0x8143c000  ! 601: STBAR	stbar
	.word 0xcf22800b  ! 602: STF_R	st	%f7, [%r11, %r10]
	.word 0xb522800b  ! 603: MULScc_R	mulscc 	%r10, %r11, %r26
	.word 0x8143c000  ! 604: STBAR	stbar
	.word 0x12800001  ! 605: BNE	bne  	<label_0x1>
	.word 0xc4d2900b  ! 606: LDSHA_R	ldsha	[%r10, %r11] 0x80, %r2
	.word 0x8a72800b  ! 607: UDIV_R	udiv 	%r10, %r11, %r5
	.word 0x90daadf0  ! 608: SMULcc_I	smulcc 	%r10, 0x0df0, %r8
	.word 0x927a800b  ! 609: SDIV_R	sdiv 	%r10, %r11, %r9
	.word 0xd27aaf64  ! 610: SWAP_I	swap	%r9, [%r10 + 0x0f64]
	.word 0x8472800b  ! 611: UDIV_R	udiv 	%r10, %r11, %r2
	.word 0xc36a800b  ! 612: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x36800001  ! 613: BGE	bge,a	<label_0x1>
	.word 0xc652800b  ! 614: LDSH_R	ldsh	[%r10 + %r11], %r3
	.word 0x87a2892b  ! 615: FMULs	fmuls	%f10, %f11, %f3
	.word 0xce7aad60  ! 616: SWAP_I	swap	%r7, [%r10 + 0x0d60]
	.word 0xd322a5bc  ! 617: STF_I	st	%f9, [0x05bc, %r10]
	.word 0xc4aaa7d0  ! 618: STBA_I	stba	%r2, [%r10 + 0x07d0] %asi
	.word 0xd0faa790  ! 619: SWAPA_I	swapa	%r8, [%r10 + 0x0790] %asi
	.word 0xaddaaa70  ! 620: FLUSH_I	dis not found

	.word 0x91a2882b  ! 621: FADDs	fadds	%f10, %f11, %f8
	.word 0xfc92ab90  ! 622: LDUHA_I	lduha	[%r10, + 0x0b90] %asi, %r30
	.word 0x9fdaa878  ! 623: FLUSH_I	dis not found

	.word 0x9252800b  ! 624: UMUL_R	umul 	%r10, %r11, %r9
	.word 0xcef2abf0  ! 625: STXA_I	stxa	%r7, [%r10 + 0x0bf0] %asi
	.word 0x8e5a800b  ! 626: SMUL_R	smul 	%r10, %r11, %r7
	.word 0x06800001  ! 627: BL	bl  	<label_0x1>
	.word 0xfa82900b  ! 628: LDUWA_R	lduwa	[%r10, %r11] 0x80, %r29
	.word 0xd8da900b  ! 629: LDXA_R	ldxa	[%r10, %r11] 0x80, %r12
	.word 0x04c20001  ! 630: BRLEZ	brlez  ,nt	%8,<label_0x20001>
	.word 0xc3eaa74c  ! 631: PREFETCHA_I	prefetcha	[%r10, + 0x074c] %asi, #one_read
	.word 0x8bdaa1c0  ! 632: FLUSH_I	dis not found

	.word 0xb5a289ab  ! 633: FDIVs	fdivs	%f10, %f11, %f26
	.word 0xcecaaff4  ! 634: LDSBA_I	ldsba	[%r10, + 0x0ff4] %asi, %r7
	.word 0xcf22a934  ! 635: STF_I	st	%f7, [0x0934, %r10]
	.word 0xcca2a1d8  ! 636: STWA_I	stwa	%r6, [%r10 + 0x01d8] %asi
	.word 0xc84aa570  ! 637: LDSB_I	ldsb	[%r10 + 0x0570], %r4
	.word 0xcf22800b  ! 638: STF_R	st	%f7, [%r11, %r10]
	.word 0x83daa220  ! 639: FLUSH_I	dis not found

	.word 0xf6b2900b  ! 640: STHA_R	stha	%r27, [%r10 + %r11] 0x80
	.word 0x8ef2abd0  ! 641: UDIVcc_I	udivcc 	%r10, 0x0bd0, %r7
	.word 0xc6aa900b  ! 642: STBA_R	stba	%r3, [%r10 + %r11] 0x80
	.word 0x8143e06f  ! 643: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #MemIssue | #Sync 
	.word 0x8a5aa704  ! 644: SMUL_I	smul 	%r10, 0x0704, %r5
	.word 0x8bdaa5a4  ! 645: FLUSH_I	dis not found

	.word 0xc3ea900b  ! 646: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0xcaa2ac2c  ! 647: STWA_I	stwa	%r5, [%r10 + 0x0c2c] %asi
	.word 0xcbe2900b  ! 648: CASA_I	casa	[%r10] 0x80, %r11, %r5
	.word 0xc0ba900b  ! 649: STDA_R	stda	%r0, [%r10 + %r11] 0x80
	.word 0xf41aa148  ! 650: LDD_I	ldd	[%r10 + 0x0148], %r26
	.word 0xecaaa110  ! 651: STBA_I	stba	%r22, [%r10 + 0x0110] %asi
	.word 0x93daaa5c  ! 653: FLUSH_I	dis not found

	.word 0xeb22800b  ! 654: STF_R	st	%f21, [%r11, %r10]
	.word 0x8af2ac14  ! 655: UDIVcc_I	udivcc 	%r10, 0x0c14, %r5
	.word 0xecba900b  ! 656: STDA_R	stda	%r22, [%r10 + %r11] 0x80
	.word 0xc6ea900b  ! 657: LDSTUBA_R	ldstuba	%r3, [%r10 + %r11] 0x80
	.word 0x92d2a2d8  ! 658: UMULcc_I	umulcc 	%r10, 0x02d8, %r9
	.word 0xbbdaa448  ! 659: FLUSH_I	dis not found

	.word 0xe6a2a9f4  ! 660: STWA_I	stwa	%r19, [%r10 + 0x09f4] %asi
	.word 0x90f2800b  ! 661: UDIVcc_R	udivcc 	%r10, %r11, %r8
	.word 0x26c20001  ! 662: BRLZ	brlz,a,nt	%8,<label_0x20001>
	.word 0x8143e044  ! 663: MEMBAR	membar	#LoadStore | #Sync 
	.word 0xc67aa414  ! 664: SWAP_I	swap	%r3, [%r10 + 0x0414]
	.word 0xa3da800b  ! 665: FLUSH_R	dis not found

	.word 0x8dda800b  ! 666: FLUSH_R	dis not found

	.word 0xc3f2900b  ! 667: CASXA_I	casxa	[%r10] 0x80, %r11, %r1
	.word 0x8143c000  ! 668: STBAR	stbar
	.word 0x06800003  ! 669: BL	bl  	<label_0x3>
	.word 0x20800003  ! 670: BN	bn,a	<label_0x3>
	.word 0x86da800b  ! 671: SMULcc_R	smulcc 	%r10, %r11, %r3
	.word 0x8252a8c0  ! 672: UMUL_I	umul 	%r10, 0x08c0, %r1
	.word 0xcb22a3b0  ! 673: STF_I	st	%f5, [0x03b0, %r10]
	.word 0xc802800b  ! 674: LDUW_R	lduw	[%r10 + %r11], %r4
	.word 0xc3ea900b  ! 675: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0xcfe2900b  ! 676: CASA_I	casa	[%r10] 0x80, %r11, %r7
	.word 0xc2b2a5c4  ! 677: STHA_I	stha	%r1, [%r10 + 0x05c4] %asi
	.word 0xbddaaae4  ! 678: FLUSH_I	dis not found

	.word 0xef3a800b  ! 679: STDF_R	std	%f23, [%r11, %r10]
	.word 0x85da800b  ! 680: FLUSH_R	dis not found

	.word 0x82f2800b  ! 681: UDIVcc_R	udivcc 	%r10, %r11, %r1
	.word 0x85a2892b  ! 682: FMULs	fmuls	%f10, %f11, %f2
	.word 0xccaa900b  ! 684: STBA_R	stba	%r6, [%r10 + %r11] 0x80
	.word 0x8143e07c  ! 685: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xb5da800b  ! 686: FLUSH_R	dis not found

	.word 0xc4b2a71c  ! 687: STHA_I	stha	%r2, [%r10 + 0x071c] %asi
	.word 0xc652a004  ! 688: LDSH_I	ldsh	[%r10 + 0x0004], %r3
	.word 0xd0b2900b  ! 689: STHA_R	stha	%r8, [%r10 + %r11] 0x80
	.word 0x8143e074  ! 690: MEMBAR	membar	#LoadStore | #Lookaside | #MemIssue | #Sync 
	.word 0xac5a800b  ! 691: SMUL_R	smul 	%r10, %r11, %r22
	.word 0x36800001  ! 692: BGE	bge,a	<label_0x1>
	.word 0xc3ea900b  ! 693: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0x8c6a800b  ! 694: UDIVX_R	udivx 	%r10, %r11, %r6
	.word 0xec42800b  ! 695: LDSW_R	ldsw	[%r10 + %r11], %r22
	.word 0xbcdaa5d8  ! 696: SMULcc_I	smulcc 	%r10, 0x05d8, %r30
	.word 0x8a4a800b  ! 697: MULX_R	mulx 	%r10, %r11, %r5
	.word 0x93a2892b  ! 699: FMULs	fmuls	%f10, %f11, %f9
	.word 0x8fda800b  ! 700: FLUSH_R	dis not found

	.word 0x85a289ab  ! 701: FDIVs	fdivs	%f10, %f11, %f2
	.word 0xc852a458  ! 702: LDSH_I	ldsh	[%r10 + 0x0458], %r4
	.word 0x8143c000  ! 704: STBAR	stbar
	.word 0xccbaaee0  ! 705: STDA_I	stda	%r6, [%r10 + 0x0ee0] %asi
	.word 0xce42800b  ! 706: LDSW_R	ldsw	[%r10 + %r11], %r7
	.word 0x8143e00c  ! 707: MEMBAR	membar	#LoadStore | #StoreStore 
	.word 0xa4daa370  ! 708: SMULcc_I	smulcc 	%r10, 0x0370, %r18
	.word 0x40000001  ! 709: CALL	call	disp30_1
	.word 0xd8baa528  ! 710: STDA_I	stda	%r12, [%r10 + 0x0528] %asi
	.word 0xc3eaa090  ! 711: PREFETCHA_I	prefetcha	[%r10, + 0x0090] %asi, #one_read
	.word 0x8f22a538  ! 712: MULScc_I	mulscc 	%r10, 0x0538, %r7
	.word 0xce82a00c  ! 714: LDUWA_I	lduwa	[%r10, + 0x000c] %asi, %r7
	.word 0xd00a800b  ! 715: LDUB_R	ldub	[%r10 + %r11], %r8
	.word 0x0c800001  ! 716: BNEG	bneg  	<label_0x1>
	.word 0xe33aa958  ! 717: STDF_I	std	%f17, [0x0958, %r10]
	.word 0xd1e2a00b  ! 718: CASA_R	casa	[%r10] %asi, %r11, %r8
	.word 0x936a800b  ! 719: SDIVX_R	sdivx	%r10, %r11, %r9
	.word 0x84daaf84  ! 720: SMULcc_I	smulcc 	%r10, 0x0f84, %r2
	.word 0x93da800b  ! 721: FLUSH_R	dis not found

	.word 0xcde2900b  ! 722: CASA_I	casa	[%r10] 0x80, %r11, %r6
	.word 0xd082a358  ! 723: LDUWA_I	lduwa	[%r10, + 0x0358] %asi, %r8
	.word 0x8143e030  ! 724: MEMBAR	membar	#Lookaside | #MemIssue 
	.word 0xcef2900b  ! 725: STXA_R	stxa	%r7, [%r10 + %r11] 0x80
	.word 0x3c800003  ! 726: BPOS	bpos,a	<label_0x3>
	.word 0x8143e000  ! 727: MEMBAR	membar	
	.word 0x8143c000  ! 728: STBAR	stbar
	.word 0xcdf2900b  ! 729: CASXA_I	casxa	[%r10] 0x80, %r11, %r6
	.word 0x89da800b  ! 730: FLUSH_R	dis not found

	.word 0x8cfa800b  ! 731: SDIVcc_R	sdivcc 	%r10, %r11, %r6
	.word 0x32800001  ! 732: BNE	bne,a	<label_0x1>
	.word 0x8c6a800b  ! 733: UDIVX_R	udivx 	%r10, %r11, %r6
	.word 0xce92a26c  ! 734: LDUHA_I	lduha	[%r10, + 0x026c] %asi, %r7
	.word 0xc36a800b  ! 735: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x8143e05c  ! 736: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0xd1e2a00b  ! 737: CASA_R	casa	[%r10] %asi, %r11, %r8
	.word 0xc44a800b  ! 739: LDSB_R	ldsb	[%r10 + %r11], %r2
	.word 0xa7a288ab  ! 740: FSUBs	fsubs	%f10, %f11, %f19
	.word 0xf41a800b  ! 741: LDD_R	ldd	[%r10 + %r11], %r26
	.word 0xeb3aa128  ! 742: STDF_I	std	%f21, [0x0128, %r10]
	.word 0x82d2a6f0  ! 743: UMULcc_I	umulcc 	%r10, 0x06f0, %r1
	.word 0xfaca900b  ! 744: LDSBA_R	ldsba	[%r10, %r11] 0x80, %r29
	.word 0xd0f2900b  ! 745: STXA_R	stxa	%r8, [%r10 + %r11] 0x80
	.word 0xde02800b  ! 746: LDUW_R	lduw	[%r10 + %r11], %r15
	.word 0xd8ea900b  ! 747: LDSTUBA_R	ldstuba	%r12, [%r10 + %r11] 0x80
	.word 0xc36aa8b4  ! 748: PREFETCH_I	prefetch	[%r10 + 0x08b4], #one_read
	.word 0x8143e036  ! 749: MEMBAR	membar	#StoreLoad | #LoadStore | #Lookaside | #MemIssue 
	.word 0x0aca0001  ! 750: BRNZ	brnz  ,pt	%8,<label_0xa0001>
	.word 0xdcdaa090  ! 751: LDXA_I	ldxa	[%r10, + 0x0090] %asi, %r14
	.word 0xc8aa900b  ! 752: STBA_R	stba	%r4, [%r10 + %r11] 0x80
	.word 0xfca2900b  ! 753: STWA_R	stwa	%r30, [%r10 + %r11] 0x80
	.word 0x2a800001  ! 754: BCS	bcs,a	<label_0x1>
	.word 0xc442a588  ! 755: LDSW_I	ldsw	[%r10 + 0x0588], %r2
	.word 0xe53a800b  ! 756: STDF_R	std	%f18, [%r11, %r10]
	.word 0x8143c000  ! 757: STBAR	stbar
	.word 0x87da800b  ! 758: FLUSH_R	dis not found

	.word 0x8143c000  ! 759: STBAR	stbar
	.word 0x8a72a9e0  ! 760: UDIV_I	udiv 	%r10, 0x09e0, %r5
	.word 0xf0b2a160  ! 761: STHA_I	stha	%r24, [%r10 + 0x0160] %asi
	.word 0xdef2a698  ! 762: STXA_I	stxa	%r15, [%r10 + 0x0698] %asi
	.word 0xd2f2ad20  ! 763: STXA_I	stxa	%r9, [%r10 + 0x0d20] %asi
	.word 0x8143e050  ! 764: MEMBAR	membar	#Lookaside | #Sync 
	.word 0xc4ba900b  ! 765: STDA_R	stda	%r2, [%r10 + %r11] 0x80
	.word 0x8143e034  ! 766: MEMBAR	membar	#LoadStore | #Lookaside | #MemIssue 
	.word 0xceb2a37c  ! 767: STHA_I	stha	%r7, [%r10 + 0x037c] %asi
	.word 0xde52800b  ! 768: LDSH_R	ldsh	[%r10 + %r11], %r15
	.word 0x8bdaa38c  ! 769: FLUSH_I	dis not found

	.word 0x85daaf18  ! 770: FLUSH_I	dis not found

	.word 0xf66aaad8  ! 771: LDSTUB_I	ldstub	%r27, [%r10 + 0x0ad8]
	.word 0xe2aaa73c  ! 772: STBA_I	stba	%r17, [%r10 + 0x073c] %asi
	.word 0x9ed2800b  ! 773: UMULcc_R	umulcc 	%r10, %r11, %r15
	.word 0x8143c000  ! 774: STBAR	stbar
	.word 0x8143e05f  ! 775: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0xf26a800b  ! 776: LDSTUB_R	ldstub	%r25, [%r10 + %r11]
	.word 0x8143c000  ! 777: STBAR	stbar
	.word 0x40000001  ! 778: CALL	call	disp30_1
	.word 0x8ddaa830  ! 779: FLUSH_I	dis not found

	.word 0x0cc20001  ! 780: BRGZ	brgz  ,nt	%8,<label_0x20001>
	.word 0x0c800001  ! 781: BNEG	bneg  	<label_0x1>
	.word 0xc80a800b  ! 782: LDUB_R	ldub	[%r10 + %r11], %r4
	.word 0x8b6aa308  ! 783: SDIVX_I	sdivx	%r10, 0x0308, %r5
	.word 0x8c7a800b  ! 784: SDIV_R	sdiv 	%r10, %r11, %r6
	.word 0xb1daae74  ! 785: FLUSH_I	dis not found

	.word 0xc3eaa1a8  ! 786: PREFETCHA_I	prefetcha	[%r10, + 0x01a8] %asi, #one_read
	.word 0x90fa800b  ! 787: SDIVcc_R	sdivcc 	%r10, %r11, %r8
	.word 0x8652800b  ! 788: UMUL_R	umul 	%r10, %r11, %r3
	.word 0x93da800b  ! 789: FLUSH_R	dis not found

	.word 0xea6aa2b4  ! 790: LDSTUB_I	ldstub	%r21, [%r10 + 0x02b4]
	.word 0x3a800001  ! 791: BCC	bcc,a	<label_0x1>
	.word 0x8143c000  ! 792: STBAR	stbar
	.word 0x8fdaa18c  ! 793: FLUSH_I	dis not found

	.word 0xba72800b  ! 794: UDIV_R	udiv 	%r10, %r11, %r29
	.word 0x22ca0001  ! 796: BRZ	brz,a,pt	%8,<label_0xa0001>
	.word 0x92faac60  ! 797: SDIVcc_I	sdivcc 	%r10, 0x0c60, %r9
	.word 0x2aca0003  ! 798: BRNZ	brnz,a,pt	%8,<label_0xa0003>
	.word 0xef22a670  ! 799: STF_I	st	%f23, [0x0670, %r10]
	.word 0xc36a800b  ! 800: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0xc93a800b  ! 801: STDF_R	std	%f4, [%r11, %r10]
	.word 0x8a52a0fc  ! 802: UMUL_I	umul 	%r10, 0x00fc, %r5
	.word 0x83daaefc  ! 803: FLUSH_I	dis not found

	.word 0x8adaaed0  ! 804: SMULcc_I	smulcc 	%r10, 0x0ed0, %r5
	.word 0x8143e061  ! 805: MEMBAR	membar	#LoadLoad | #MemIssue | #Sync 
	.word 0x8dda800b  ! 806: FLUSH_R	dis not found

	.word 0x2ac20001  ! 807: BRNZ	brnz,a,nt	%8,<label_0x20001>
	.word 0x93a289ab  ! 808: FDIVs	fdivs	%f10, %f11, %f9
	.word 0xaadaa78c  ! 809: SMULcc_I	smulcc 	%r10, 0x078c, %r21
	.word 0xe66a800b  ! 810: LDSTUB_R	ldstub	%r19, [%r10 + %r11]
	.word 0xd882aae8  ! 811: LDUWA_I	lduwa	[%r10, + 0x0ae8] %asi, %r12
	.word 0xc93a800b  ! 812: STDF_R	std	%f4, [%r11, %r10]
	.word 0xc27a800b  ! 813: SWAP_R	swap	%r1, [%r10 + %r11]
	.word 0xd282900b  ! 814: LDUWA_R	lduwa	[%r10, %r11] 0x80, %r9
	.word 0xc36aa5f4  ! 815: PREFETCH_I	prefetch	[%r10 + 0x05f4], #one_read
	.word 0x0ac20001  ! 816: BRNZ	brnz  ,nt	%8,<label_0x20001>
	.word 0xafda800b  ! 818: FLUSH_R	dis not found

	.word 0xc522800b  ! 820: STF_R	st	%f2, [%r11, %r10]
	.word 0x89da800b  ! 821: FLUSH_R	dis not found

	.word 0x8bdaa448  ! 822: FLUSH_I	dis not found

	.word 0x89da800b  ! 823: FLUSH_R	dis not found

	.word 0x8143c000  ! 825: STBAR	stbar
	.word 0xca82900b  ! 826: LDUWA_R	lduwa	[%r10, %r11] 0x80, %r5
	.word 0xc6caac8c  ! 827: LDSBA_I	ldsba	[%r10, + 0x0c8c] %asi, %r3
	.word 0x8c6a800b  ! 828: UDIVX_R	udivx 	%r10, %r11, %r6
	.word 0xc2aaa1f0  ! 829: STBA_I	stba	%r1, [%r10 + 0x01f0] %asi
	.word 0xc202800b  ! 830: LDUW_R	lduw	[%r10 + %r11], %r1
	.word 0x8fdaa290  ! 831: FLUSH_I	dis not found

	.word 0xbba2892b  ! 832: FMULs	fmuls	%f10, %f11, %f29
	.word 0x8143e05d  ! 833: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0xc3ea900b  ! 834: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0xca12800b  ! 835: LDUH_R	lduh	[%r10 + %r11], %r5
	.word 0xd8b2adb8  ! 836: STHA_I	stha	%r12, [%r10 + 0x0db8] %asi
	.word 0xf602a774  ! 838: LDUW_I	lduw	[%r10 + 0x0774], %r27
	.word 0x83daa62c  ! 840: FLUSH_I	dis not found

	.word 0x99a2892b  ! 841: FMULs	fmuls	%f10, %f11, %f12
	.word 0xf002800b  ! 842: LDUW_R	lduw	[%r10 + %r11], %r24
	.word 0xdf3a800b  ! 843: STDF_R	std	%f15, [%r11, %r10]
	.word 0xd2aaa864  ! 844: STBA_I	stba	%r9, [%r10 + 0x0864] %asi
	.word 0xce0a800b  ! 845: LDUB_R	ldub	[%r10 + %r11], %r7
	.word 0xd20a800b  ! 846: LDUB_R	ldub	[%r10 + %r11], %r9
	.word 0xe922800b  ! 847: STF_R	st	%f20, [%r11, %r10]
	.word 0xc8da900b  ! 848: LDXA_R	ldxa	[%r10, %r11] 0x80, %r4
	.word 0x91a2892b  ! 849: FMULs	fmuls	%f10, %f11, %f8
	.word 0x9bdaa0bc  ! 850: FLUSH_I	dis not found

	.word 0x0ac20001  ! 851: BRNZ	brnz  ,nt	%8,<label_0x20001>
	.word 0xd0a2900b  ! 852: STWA_R	stwa	%r8, [%r10 + %r11] 0x80
	.word 0x8143e046  ! 853: MEMBAR	membar	#StoreLoad | #LoadStore | #Sync 
	.word 0xf4da900b  ! 854: LDXA_R	ldxa	[%r10, %r11] 0x80, %r26
	.word 0xe0aaa63c  ! 855: STBA_I	stba	%r16, [%r10 + 0x063c] %asi
	.word 0x8872ab54  ! 856: UDIV_I	udiv 	%r10, 0x0b54, %r4
	.word 0x8ddaa078  ! 857: FLUSH_I	dis not found

	.word 0xbfda800b  ! 858: FLUSH_R	dis not found

	.word 0xc3ea900b  ! 859: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0xe40a800b  ! 860: LDUB_R	ldub	[%r10 + %r11], %r18
	.word 0xcc52aa54  ! 861: LDSH_I	ldsh	[%r10 + 0x0a54], %r6
	.word 0xf0daade8  ! 862: LDXA_I	ldxa	[%r10, + 0x0de8] %asi, %r24
	.word 0x8bda800b  ! 863: FLUSH_R	dis not found

	.word 0x907a800b  ! 864: SDIV_R	sdiv 	%r10, %r11, %r8
	.word 0xee6a800b  ! 865: LDSTUB_R	ldstub	%r23, [%r10 + %r11]
	.word 0x8a4aa010  ! 866: MULX_I	mulx 	%r10, 0x0010, %r5
	.word 0xce6a800b  ! 867: LDSTUB_R	ldstub	%r7, [%r10 + %r11]
	.word 0x86fa800b  ! 868: SDIVcc_R	sdivcc 	%r10, %r11, %r3
	.word 0xd8daa768  ! 871: LDXA_I	ldxa	[%r10, + 0x0768] %asi, %r12
	.word 0xd86a800b  ! 872: LDSTUB_R	ldstub	%r12, [%r10 + %r11]
	.word 0xc3ea900b  ! 873: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0xc89a900b  ! 874: LDDA_R	ldda	[%r10, %r11] 0x80, %r4
	.word 0xc8f2900b  ! 875: STXA_R	stxa	%r4, [%r10 + %r11] 0x80
	.word 0xf46a800b  ! 876: LDSTUB_R	ldstub	%r26, [%r10 + %r11]
	.word 0x8fa2892b  ! 878: FMULs	fmuls	%f10, %f11, %f7
	.word 0xab6a800b  ! 879: SDIVX_R	sdivx	%r10, %r11, %r21
	.word 0x8143e035  ! 880: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside | #MemIssue 
	.word 0x846a800b  ! 881: UDIVX_R	udivx 	%r10, %r11, %r2
	.word 0x89a289ab  ! 882: FDIVs	fdivs	%f10, %f11, %f4
	.word 0xdb3a800b  ! 883: STDF_R	std	%f13, [%r11, %r10]
	.word 0xd07a800b  ! 885: SWAP_R	swap	%r8, [%r10 + %r11]
	.word 0xadda800b  ! 886: FLUSH_R	dis not found

	.word 0xe2d2a3d8  ! 887: LDSHA_I	ldsha	[%r10, + 0x03d8] %asi, %r17
	.word 0xc36a800b  ! 888: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x8a7aa664  ! 889: SDIV_I	sdiv 	%r10, 0x0664, %r5
	.word 0x9fda800b  ! 890: FLUSH_R	dis not found

	.word 0xf33a800b  ! 891: STDF_R	std	%f25, [%r11, %r10]
	.word 0xc4ba900b  ! 892: STDA_R	stda	%r2, [%r10 + %r11] 0x80
	.word 0xccfaa5d0  ! 894: SWAPA_I	swapa	%r6, [%r10 + 0x05d0] %asi
	.word 0xd292a75c  ! 896: LDUHA_I	lduha	[%r10, + 0x075c] %asi, %r9
	.word 0x836a800b  ! 897: SDIVX_R	sdivx	%r10, %r11, %r1
	.word 0xc212ac04  ! 898: LDUH_I	lduh	[%r10 + 0x0c04], %r1
	.word 0xcefa900b  ! 899: SWAPA_R	swapa	%r7, [%r10 + %r11] 0x80
	.word 0x8af2800b  ! 900: UDIVcc_R	udivcc 	%r10, %r11, %r5
	.word 0x02ca0001  ! 901: BRZ	brz  ,pt	%8,<label_0xa0001>
	.word 0x26800001  ! 902: BL	bl,a	<label_0x1>
	.word 0xceaa900b  ! 903: STBA_R	stba	%r7, [%r10 + %r11] 0x80
	.word 0xccbaac08  ! 904: STDA_I	stda	%r6, [%r10 + 0x0c08] %asi
	.word 0xcc52800b  ! 905: LDSH_R	ldsh	[%r10 + %r11], %r6
	.word 0xd0ca900b  ! 906: LDSBA_R	ldsba	[%r10, %r11] 0x80, %r8
	.word 0x8ddaa590  ! 907: FLUSH_I	dis not found

	.word 0xc65a800b  ! 908: LDX_R	ldx	[%r10 + %r11], %r3
	.word 0xa3daa1c8  ! 909: FLUSH_I	dis not found

	.word 0x8143e015  ! 910: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside 
	.word 0x87a288ab  ! 911: FSUBs	fsubs	%f10, %f11, %f3
	.word 0xb472800b  ! 912: UDIV_R	udiv 	%r10, %r11, %r26
	.word 0xc442800b  ! 913: LDSW_R	ldsw	[%r10 + %r11], %r2
	.word 0xc6d2900b  ! 914: LDSHA_R	ldsha	[%r10, %r11] 0x80, %r3
	.word 0x8e72acf0  ! 915: UDIV_I	udiv 	%r10, 0x0cf0, %r7
	.word 0xca92af94  ! 916: LDUHA_I	lduha	[%r10, + 0x0f94] %asi, %r5
	.word 0x8b6a800b  ! 917: SDIVX_R	sdivx	%r10, %r11, %r5
	.word 0xceda900b  ! 918: LDXA_R	ldxa	[%r10, %r11] 0x80, %r7
	.word 0x12800003  ! 919: BNE	bne  	<label_0x3>
	.word 0x867a800b  ! 920: SDIV_R	sdiv 	%r10, %r11, %r3
	.word 0x83a289ab  ! 921: FDIVs	fdivs	%f10, %f11, %f1
	.word 0xc3ea900b  ! 922: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0x8143e06b  ! 924: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #MemIssue | #Sync 
	.word 0x40000001  ! 926: CALL	call	disp30_1
	.word 0xb8faa0c8  ! 927: SDIVcc_I	sdivcc 	%r10, 0x00c8, %r28
	.word 0xcbf2900b  ! 928: CASXA_I	casxa	[%r10] 0x80, %r11, %r5
	.word 0x26800003  ! 930: BL	bl,a	<label_0x3>
	.word 0xaefa800b  ! 931: SDIVcc_R	sdivcc 	%r10, %r11, %r23
	.word 0xcca2a6d8  ! 932: STWA_I	stwa	%r6, [%r10 + 0x06d8] %asi
	.word 0xa472800b  ! 933: UDIV_R	udiv 	%r10, %r11, %r18
	.word 0xc4aa900b  ! 934: STBA_R	stba	%r2, [%r10 + %r11] 0x80
	.word 0xd2daa870  ! 935: LDXA_I	ldxa	[%r10, + 0x0870] %asi, %r9
	.word 0x8143c000  ! 936: STBAR	stbar
	.word 0x0c800001  ! 937: BNEG	bneg  	<label_0x1>
	.word 0xd33a800b  ! 938: STDF_R	std	%f9, [%r11, %r10]
	.word 0xc3eaa77c  ! 939: PREFETCHA_I	prefetcha	[%r10, + 0x077c] %asi, #one_read
	.word 0x83da800b  ! 940: FLUSH_R	dis not found

	.word 0xc3e2a00b  ! 941: CASA_R	casa	[%r10] %asi, %r11, %r1
	.word 0xe6fa900b  ! 942: SWAPA_R	swapa	%r19, [%r10 + %r11] 0x80
	.word 0xfa92900b  ! 943: LDUHA_R	lduha	[%r10, %r11] 0x80, %r29
	.word 0xc9e2900b  ! 944: CASA_I	casa	[%r10] 0x80, %r11, %r4
	.word 0x8143c000  ! 945: STBAR	stbar
	.word 0x2cc20001  ! 946: BRGZ	brgz,a,nt	%8,<label_0x20001>
	.word 0xa5a288ab  ! 947: FSUBs	fsubs	%f10, %f11, %f18
	.word 0xa16aa998  ! 951: SDIVX_I	sdivx	%r10, 0x0998, %r16
	.word 0xb6d2800b  ! 952: UMULcc_R	umulcc 	%r10, %r11, %r27
	.word 0x8143e02f  ! 953: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #MemIssue 
	.word 0xd0f2a550  ! 954: STXA_I	stxa	%r8, [%r10 + 0x0550] %asi
	.word 0x83daaa9c  ! 955: FLUSH_I	dis not found

	.word 0xe092900b  ! 956: LDUHA_R	lduha	[%r10, %r11] 0x80, %r16
	.word 0xd2d2900b  ! 957: LDSHA_R	ldsha	[%r10, %r11] 0x80, %r9
	.word 0xcefa900b  ! 958: SWAPA_R	swapa	%r7, [%r10 + %r11] 0x80
	.word 0x8143c000  ! 959: STBAR	stbar
	.word 0x38800003  ! 960: BGU	bgu,a	<label_0x3>
	.word 0x04ca0001  ! 961: BRLEZ	brlez  ,pt	%8,<label_0xa0001>
	.word 0xc452800b  ! 962: LDSH_R	ldsh	[%r10 + %r11], %r2
	.word 0xcc0a800b  ! 963: LDUB_R	ldub	[%r10 + %r11], %r6
	.word 0xda6aa60c  ! 964: LDSTUB_I	ldstub	%r13, [%r10 + 0x060c]
	.word 0xb5da800b  ! 965: FLUSH_R	dis not found

	.word 0xc36a800b  ! 966: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x8143c000  ! 967: STBAR	stbar
	.word 0xd2c2900b  ! 968: LDSWA_R	ldswa	[%r10, %r11] 0x80, %r9
	.word 0x826a800b  ! 969: UDIVX_R	udivx 	%r10, %r11, %r1
	.word 0x8143e07e  ! 970: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xc202aa94  ! 971: LDUW_I	lduw	[%r10 + 0x0a94], %r1
	.word 0x827a800b  ! 972: SDIV_R	sdiv 	%r10, %r11, %r1
	.word 0xff3a800b  ! 973: STDF_R	std	%f31, [%r11, %r10]
	.word 0xc2ca900b  ! 974: LDSBA_R	ldsba	[%r10, %r11] 0x80, %r1
	.word 0xb1daac28  ! 975: FLUSH_I	dis not found

	.word 0xe4aa900b  ! 976: STBA_R	stba	%r18, [%r10 + %r11] 0x80
	.word 0x8143e03e  ! 978: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0x93a288ab  ! 979: FSUBs	fsubs	%f10, %f11, %f9
	.word 0x8143c000  ! 980: STBAR	stbar
	.word 0xc8d2a3f4  ! 981: LDSHA_I	ldsha	[%r10, + 0x03f4] %asi, %r4
	.word 0xb1daad0c  ! 982: FLUSH_I	dis not found

	.word 0xbaf2800b  ! 983: UDIVcc_R	udivcc 	%r10, %r11, %r29
	.word 0x9ba289ab  ! 984: FDIVs	fdivs	%f10, %f11, %f13
	.word 0xc2b2adb8  ! 985: STHA_I	stha	%r1, [%r10 + 0x0db8] %asi
	.word 0x8bda800b  ! 986: FLUSH_R	dis not found

	.word 0xfe92900b  ! 987: LDUHA_R	lduha	[%r10, %r11] 0x80, %r31
	.word 0xa4d2a328  ! 988: UMULcc_I	umulcc 	%r10, 0x0328, %r18
	.word 0x826a800b  ! 989: UDIVX_R	udivx 	%r10, %r11, %r1
	.word 0x2cc20003  ! 990: BRGZ	brgz,a,nt	%8,<label_0x20003>
	.word 0xf492a494  ! 991: LDUHA_I	lduha	[%r10, + 0x0494] %asi, %r26
	.word 0xea6a800b  ! 992: LDSTUB_R	ldstub	%r21, [%r10 + %r11]
	.word 0xc66a800b  ! 993: LDSTUB_R	ldstub	%r3, [%r10 + %r11]
	.word 0xf44aa0e0  ! 994: LDSB_I	ldsb	[%r10 + 0x00e0], %r26
	.word 0xf4fa900b  ! 995: SWAPA_R	swapa	%r26, [%r10 + %r11] 0x80
	.word 0xb7da800b  ! 996: FLUSH_R	dis not found

	.word 0xc4aaa544  ! 997: STBA_I	stba	%r2, [%r10 + 0x0544] %asi
	.word 0xe8c2a0dc  ! 998: LDSWA_I	ldswa	[%r10, + 0x00dc] %asi, %r20
	.word 0xf2aaaf88  ! 999: STBA_I	stba	%r25, [%r10 + 0x0f88] %asi
	nop
	nop
	nop
        ta      T_GOOD_TRAP

.data
	.word  0xd200d83e,0xc7e1db0a,0x8f84b6ad,0x5c53a957
	.word  0xd1def884,0xddb5d197,0xe13dda7c,0xc0bbeb04
	.word  0x1200de36,0x79365c5b,0x3ef4c7fb,0x3ba9b5e6
	.word  0x94325632,0x139ec409,0xb6cfc297,0x96efd23a
	.word  0x9328c8d9,0x4defeb6f,0xa6f49403,0x9ffb8682
	.word  0x58e3d5fd,0x570534e7,0xb6a9a501,0x22ffe0bd
	.word  0x6c7d42b6,0xc6240929,0x3ef00a84,0x36f6ca5a
	.word  0x5b43100c,0x3e50a750,0x4fe0070a,0x4ec94585
	.word  0x4688f559,0xca8d2dfd,0xc2e43840,0x990d0fa0
	.word  0x55e592ca,0xe58cf726,0x7cb4b85c,0x62984ee3
	.word  0x0973379b,0x85aaecf2,0x22cfdb15,0x2deda1b1
	.word  0x4375a62b,0x6ba85810,0xe8dc421a,0x29c238dc
	.word  0x4aa883cd,0xb5be46ca,0xb437b7d8,0x10a35eac
	.word  0xaeb250f5,0x5bcfd21c,0x05ef22e3,0xe52513ae
	.word  0x1d977e08,0x38ebebcf,0xeecdea0b,0x10b11f2a
	.word  0x6eddeb92,0x28807a62,0xabaa2389,0x1ffab585
	.word  0x64886132,0x21e1e4cb,0x23a50667,0xa8bdc131
	.word  0xc90b8835,0xf380619e,0xc785653d,0xa0259cbe
	.word  0x498212ef,0x32e23733,0xd31ee4a5,0x2299ce7c
	.word  0x4f1316f4,0xb2ec7db1,0xaeab21a7,0x41b144b9
	.word  0x44927f32,0x4b2459c3,0x4d625a43,0x288fe7fa
	.word  0xdcd5e216,0xaea388ee,0x5d32be93,0xfcd39f48
	.word  0x351aba19,0xf52f6cdd,0x2cac8bed,0x4befa3ce
	.word  0x2ed03f4a,0x62022793,0xf4dbb689,0x4c511c6b
	.word  0xcb07b0a1,0x3e8b62cd,0xb166aa1b,0xdaae26a1
	.word  0x03937650,0x7bee2f9c,0x6738059c,0x767ad504
	.word  0x270597f0,0xf6202ad4,0x76a69df3,0x0c429112
	.word  0x91dd00a1,0xd30e3014,0x137bdffc,0x9d990b7b
	.word  0x4d41e8a2,0x9a769fdb,0x399189eb,0xfedfa4b6
	.word  0x21818ed4,0x77dfd257,0xe4993cef,0x9aaf71b5
	.word  0x675f26e0,0x8b557c80,0x7aef6795,0x8d95645e
	.word  0x4d1b83d0,0xd4053bce,0xe51ff115,0x57d10d55
	.word  0x5bd3f79c,0xfa208097,0x4060d479,0xb4a70f49
	.word  0x4bf776d2,0x0ec6ad29,0xde792587,0xd86967c2
	.word  0x89358fec,0x21af5c1f,0x15d33bb2,0x6a4de6c1
	.word  0xa01bcbce,0xbd29847e,0x006744b5,0x7b125dd9
	.word  0xc7e972c6,0x53bc9c93,0xc1c6b08f,0xecd48b16
	.word  0x478a753a,0x4ac4f488,0x0a0ea6cf,0xbe4146d2
	.word  0xc494019a,0xf3d2b05f,0xe0174f67,0xacf6d8f9
	.word  0xbdee424c,0x1321bd5f,0xb39f1b19,0x9d9c3e11
	.word  0xeb8c76bc,0x6a93808c,0xdbf1f8e0,0x974b5c1f
	.word  0xfb8dc46f,0x32e51013,0x8f2f018a,0xa7951a39
	.word  0x48025c1f,0x0bf5b5db,0x3ae31eb5,0x6ad015a1
	.word  0x5e3ceb8b,0x6b941ad3,0xa39a4530,0x190814b0
	.word  0x83065b9e,0xc5447aca,0xbba9d5d9,0x6d89b0bc
	.word  0x3dcbd5a4,0x97b740c7,0x00d838f3,0xa196348d
	.word  0x045d5c0f,0x6d1c53c6,0x32209b95,0xf1c99960
	.word  0xde923280,0xd71f314f,0xbfeadae0,0xfa92cbb1
	.word  0x1a250743,0xe866ad59,0x1457f98e,0xb811ae17
	.word  0xc40b5819,0x0c9aeb13,0xe14b28df,0xf94d54e6
	.word  0x2d341c88,0x6fbd1dba,0x06e4b9fe,0x46c384ec
	.word  0x653277fb,0x7912c9d8,0x819ca0b8,0x2cf1003c
	.word  0x3501a0f0,0x120bb1c8,0x25696eba,0x633f2bb5
	.word  0xcea9f0c2,0xb7ca9914,0x506440b2,0xe459db61
	.word  0x0a81b1b1,0x5ea2e6b2,0x11066a1a,0x6120d6d3
	.word  0x63df588a,0xda03b23d,0xd342766b,0x2e2f5efb
	.word  0x1d062b1b,0xb542d7aa,0xb2af16c1,0x8ff40b9d
	.word  0x8d9543c1,0x299e068a,0xd36bb2d7,0x7613060b
	.word  0x05175c88,0xa6c463b9,0x248a0a2d,0x34f9448e
	.word  0x37076140,0x5ad3f818,0x865f1ab5,0x2fa8499e
	.word  0xcbae9945,0x9bb4320c,0xace390eb,0x7909cb4f
	.word  0xbed1339c,0x7331f501,0x559c6178,0x62709a68
	.word  0x90df627b,0x61433817,0x2762f3ac,0x44ce1847
	.word  0xbf50bc3d,0x1da9c94b,0x7e51c363,0xff327b6b
	.word  0xa4a8b79e,0x2cf620c8,0x7b621c60,0xc888e29c
	.word  0xdf1d565c,0x671fb29f,0xec14789a,0x0f4958eb
	.word  0xd17ac94b,0x00184e65,0xc0c8fe6c,0x8acd71d1
	.word  0xacb79edb,0x5f939f58,0xd78866d3,0xaebb9cf3
	.word  0x6fdd5cbc,0x9f0a07fd,0xe57081e1,0xe2c91c9c
	.word  0xe3c624be,0x2695c1f4,0x9bc27eab,0xe4cacb26
	.word  0x3afd44e3,0xe512ed47,0x462c7f31,0x64da7da0
	.word  0x85d2733e,0x0b3bfdd6,0x33629b22,0x59aeebad
	.word  0x26cdbfcb,0x8152dd9d,0x23f5ee67,0x4b982ddf
	.word  0x19d7e6e7,0x25b4c44b,0x6b3ac15a,0x251211ad
	.word  0xab8839a1,0xde23c006,0x4c74828b,0xecf39688
	.word  0x19f91cd6,0xd3eecf54,0x0346827e,0x3451c9c5
	.word  0x72823aca,0x50cd7905,0x83d2dd69,0x646a92dd
	.word  0x7fc01fce,0x15f32c1e,0x890b7ce8,0x4093fab7
	.word  0x23080f6c,0x8cf1d78a,0x8c5d2e31,0xe8db6bb4
	.word  0xc86fc8d7,0x78b39efc,0x3c43023d,0xd8c9b277
	.word  0x8a5d4fed,0x5b080045,0x1ec35908,0xc14e14d7
	.word  0x7bc6d0df,0x0eeb9e19,0x5e9b8561,0x7132ef84
	.word  0xebcdbf87,0x389a5f8b,0x0351e4e3,0x1a416c9e
	.word  0x976e5eb1,0x2d2d5924,0xc3c634f7,0x682bc48e
	.word  0xfe35e47d,0x73486668,0x3858026c,0x55f55939
	.word  0x6d61e86d,0xf08b3ce6,0x047cc0a5,0xbb09acb0
	.word  0x2f9f0a0b,0x412897e1,0x27c0a4cd,0x1af6aba4
	.word  0x66b9b53d,0xc5459edf,0x4806d461,0x642a14ce
	.word  0x95334c5f,0xa9366a25,0x15110301,0x7d0f9534
	.word  0xbf3ea951,0xe62e53d7,0x4becab9f,0x622f4652
	.word  0xe98540fa,0x208f75c0,0xfb515c47,0x0f692d84
	.word  0xbea31009,0x8da44d59,0xdc63be2b,0x8d7745a8
	.word  0xfebe2350,0x5d096eb2,0xd8c651fe,0xe6b0eff6
	.word  0x1149eb55,0x74db82fa,0xb1ec1efa,0x7f2bb738
	.word  0xc16a8074,0x8c0e6b8c,0xfddbfba3,0x3a0226f7
	.word  0x013f6441,0x6fb31601,0xc32150de,0xb86d18b8
	.word  0xa19ec01b,0xd46b1884,0xf5d60027,0xd6871190
	.word  0xb9da6011,0xe6359779,0xf0923705,0x3f6c614d
	.word  0x36993bd6,0x4f6f82ee,0xd734e81d,0x34ecf80a
	.word  0xc3c2bfb8,0xeab5f35e,0xa7650e24,0x3324d6e5
	.word  0x21747e16,0x8c99b49a,0xaabf5e39,0x3529a601
	.word  0xd13550f4,0x02a41d05,0x23a241ac,0xe8a18971
	.word  0x5d80abf0,0x952fe18a,0xe3a298a7,0x46851b2e
	.word  0xd93dbc2f,0xaa0bf122,0x643a9d10,0x9580a67f
	.word  0x5bf1cab0,0x4e6a566d,0x87dc4cc5,0xf4a50329
	.word  0x9e09964c,0x889d63f4,0xda6ccf75,0x1959067c
	.word  0xa7fa8775,0x746648aa,0x2f8ce0fb,0x4ba4b8c2
	.word  0xb4040533,0x904680f6,0x3b129b4a,0x77401023
	.word  0xfbd9c6f2,0x1eec6710,0x84d44c64,0xbae7b3b8
	.word  0x0d090948,0x5b98c23f,0xc7ec0a44,0x35294c9e
	.word  0x4ffb044e,0x7a8563d9,0xebf1a368,0x228c3a47
	.word  0x31ec7a6d,0x0b554b5f,0x112310c4,0x959c4a9a
	.word  0xa84c7bf2,0x513d25c9,0x6120cf0b,0xd3fd6817
	.word  0xe081e04b,0xf6b4a3bb,0xe684d01e,0x34201922
	.word  0xc16b0c94,0x11becf29,0xf17741d8,0x8d95f0ac
	.word  0x824e321a,0xbe74a16a,0xa74fc59a,0x8f2008ba
	.word  0x4374d7aa,0x1316c03d,0xd6d2c02a,0xe4ea8996
	.word  0x7a60fd2a,0xf11676c1,0x9dbd7511,0xd1b04940
	.word  0x7f75276c,0x9030ed92,0xdd0f6622,0xf101cf59
	.word  0xe96375d1,0xefa13a6b,0x59e74654,0x62537790
	.word  0xbba41e19,0x9d0f97c1,0x90b058e5,0xd519ebdb
	.word  0x9e195ba5,0x76212870,0x99009e75,0x3815e606
	.word  0xa60b6436,0x5200fbb9,0xda06f2ec,0x6bd4006c
	.word  0x50cdbd77,0x31f256d3,0x3cf90d93,0x6ab01d3e
	.word  0xed27f174,0xb28286d3,0x74c5b11e,0x59274254
	.word  0xd50aa570,0xce08131e,0x71a97025,0xd42ffa76
	.word  0x8f668e44,0x9d02794b,0xca087969,0x914364d9
	.word  0xe825455f,0xeb921efc,0x616eff3f,0x9057b37a
	.word  0x773a9d41,0x65604db8,0x8874082a,0x6f054548
	.word  0xa2d7d595,0x677bdb61,0x3a213dea,0x202a8e15
	.word  0x76d2e55c,0x37187d44,0xb64c5ee0,0x22cc559e
	.word  0x69a0b0aa,0xdb7cb217,0x3bc4e651,0xbadb5179
	.word  0x86d99130,0xdae2cb67,0xc48292d7,0x2f834e87
	.word  0xe7d96a34,0xdbd90bd7,0xb8a5e14e,0x6015e55b
	.word  0x2ef0c8ed,0xfb79217a,0x73c2a79c,0xdbef586c
	.word  0xe749884d,0xf41d91fe,0xa70c091c,0x5fe82d19
	.word  0xe9a47afc,0xd7ff81c9,0x756e7be2,0x276b912d
	.word  0xb5a57132,0x37d5fff4,0xd172e4c7,0xc1dd6fc5
	.word  0x424e948f,0x035cb6f7,0x4b9034de,0x2cbb7b46
	.word  0x59bb5e02,0xcfac4e50,0x5b599bf8,0xb72f6a38
	.word  0x7731c92d,0x3884c197,0xfd18fc37,0x27a4df2d
	.word  0xb67dd48d,0xac17a873,0x52ac4008,0x605bcea8
	.word  0xa238d171,0x97c0b499,0x167c59fe,0xeac90f79
	.word  0xadfb9bc0,0x4a3571aa,0x51c50654,0x6ad4cdd3
	.word  0xf8a7a2b7,0x0a829ca5,0xf321de2b,0x7899a951
	.word  0xafcb3f99,0x39e37847,0x4a07e1fd,0xee208fa8
	.word  0x6ec63cf7,0xaa1cc07c,0x09e8cc8f,0xc684400a
	.word  0x409f0176,0x087350c9,0xcb6838ba,0x5134731b
	.word  0x111131ed,0x7be1b961,0xa75fd631,0xc708a273
	.word  0x9952f9e6,0xf4f238c7,0xd34c5c11,0x14b5a4ca
	.word  0xbf6dbaa4,0x09cc55e0,0x829d9edd,0xb8015366
	.word  0xd140b2a6,0xbf015241,0x6615eb12,0x10c05035
	.word  0xc834cb2e,0xc32ea646,0x1b21aeda,0xdc9e115c
	.word  0x5c6f3490,0x180ea31e,0x7c650fbe,0x4fe2fac2
	.word  0x224ea767,0xd836bbd0,0xab84087d,0x9a8e9054
	.word  0x4927f833,0xcec95ee9,0x4fccd6df,0x3c800b83
	.word  0x7ec1ebf4,0x7c5185de,0x4320ff7e,0xf5aeac13
	.word  0x4dfd23ae,0x72aaa27a,0xa39c7e6a,0x163740e4
	.word  0x994f9c4b,0x630f11d9,0xddc727d7,0x814ca6be
	.word  0x1802a591,0x2d36f572,0x16f12710,0x83c671bb
	.word  0x5812e732,0xa4226037,0xc550b9b1,0x50a3e69f
	.word  0xefe69fd1,0x7780b004,0x91ca4d42,0xc9b4b6fc
	.word  0xc8308d1f,0xfc2e42aa,0x24f7dab8,0x58136977
	.word  0x399c1375,0x3ee62a58,0xa137c916,0x69d551ec
	.word  0x93925012,0x4db5af24,0x85064263,0x040ea556
	.word  0x75e00a24,0xbdc2ac1a,0x556fc67b,0x07a3b7fe
	.word  0x12a657ab,0x1e8e1269,0xe6eebff4,0x9fe83920
	.word  0x47ff4ef7,0x2b730761,0x9a7aa428,0x4e6360a7
	.word  0x2ac8038a,0x8a7d1a55,0x2f8f0bf1,0x3761400d
	.word  0x288df247,0xd0a3091e,0xdab087ac,0xb225cbef
	.word  0x5ec0f476,0xb7bdd938,0x52584550,0xb34bb553
	.word  0x0fb37036,0xcbdc35d0,0x3b5fc73f,0x1143c2bb
	.word  0xb44de4ee,0xe429ecae,0x4b5898fb,0x34e371ab
	.word  0x34d43316,0xd95cc8f2,0x50ff08a9,0xe2238458
	.word  0xefe70fab,0x14cca285,0x41a4e038,0x40803282
	.word  0x93ec39b3,0x2595f22e,0x371f6083,0x7be30560
	.word  0xd7148856,0x7e91ef4e,0x3270a863,0x80339db3
	.word  0x63ac795d,0x7268dfed,0x08c6e1ed,0x5ac5dd12
	.word  0x746a0560,0x8bb49b7e,0x5652a70c,0x89ba1330
	.word  0x3823dc71,0x29fd80d9,0x2e6d1d59,0xdd4c055d
	.word  0x09e2cbce,0x74ae0ae9,0x5db46690,0x690bffea
	.word  0x770196a1,0x3c461420,0x5c7833e8,0x405b3503
	.word  0x1b6a6ab1,0x933ddd6f,0xbcecd153,0x9718ed34
	.word  0xae350793,0x4ee4b91f,0x0a060b84,0x2c3650fb
	.word  0xb87d7a6d,0x73d20ca6,0xa4d724ff,0x29f2cb8b
	.word  0xc2088fd5,0x4964aea7,0x5715a711,0x30dbcc87
	.word  0xbb63ee96,0x6fa97c29,0x8bf740ac,0xd73fc05e
	.word  0x3524838c,0x6520b2d9,0xf89930fc,0x3772694f
	.word  0x9ba291b0,0xbfd63469,0xadfe26f7,0x46765512
	.word  0xdb714a7e,0xd9df9653,0x7199f432,0x23588c99
	.word  0xef4d4e45,0x1a7d2664,0x9f4932f3,0x8e2eeb28
	.word  0x203fe287,0xb2c561e5,0x0d3bee19,0xd9e08147
	.word  0x2483731b,0xb3665d33,0x23972b63,0xb003bde2
	.word  0xed5ae6a5,0x6a407f50,0x69bf09e9,0xf57d5e9c
	.word  0x999f0b85,0x9c9f23a9,0xe0f5b67a,0x34b83a9b
	.word  0xbe7e716a,0xef25b2f7,0x5b85d459,0x60029504
	.word  0x64363e66,0x68b9fe22,0xff1820cc,0xe51eb75e
	.word  0x51f4d7e7,0xf1fc0271,0x59a314e3,0x1e6d777e
	.word  0x14e970df,0xff7887b4,0xf3624164,0x5395a054
	.word  0x96f848d1,0xe55e89a1,0xdc10c129,0x14a091c9
	.word  0x1f949f9f,0xd642cf20,0xa0c2221e,0xea5066a9
	.word  0xf43b249c,0xdaab53a3,0x2bdec287,0xa1960019
	.word  0x547ba5f0,0x34c6d9eb,0x773d026a,0x6756371a
	.word  0xcead5675,0x45077be4,0xb7033530,0x5e355c18
	.word  0xcdd014a8,0x8c12560d,0x6f862f16,0x28d98e44
	.word  0xd06eb302,0xd008bdcd,0x4d5cee1e,0x76bcf323
	.word  0x16566dc7,0x1ef2fa34,0x60112ed4,0x9ddbce3f
	.word  0x585c517b,0xbcc45db9,0x99c515b9,0x57bcbe38
	.word  0x51cdd0d6,0x43b19c32,0x45813dd8,0x245b3b73
	.word  0xaad53484,0x1f69a32c,0xf6d6df6d,0x4b476df3
	.word  0xf58ec6f2,0x9e9bc4da,0x7db5e97c,0x0ec6b219
	.word  0x9e7f2673,0xb010e895,0x315a2004,0xb1e76e12
	.word  0x3cf6f0a7,0xd49211b0,0x0464970a,0x0a9cec1f
	.word  0x7b321ab0,0x14aaeeab,0xbced802d,0x7b513f5f
	.word  0xb439e70d,0x9c3590cd,0xaf9aedf9,0x00dde80f
	.word  0xb8b7ca46,0x54f01152,0x78af23e0,0x5428c820
	.word  0xd004b8dc,0x915442c8,0x65b6baa9,0x139526d7
	.word  0x95be53c1,0x5268241c,0xe5f367a8,0xb9b42cc3
	.word  0xb79f704c,0x04990c55,0xb728cbc6,0xd1569363
	.word  0x9afb09bd,0x8707baab,0xbe3848dc,0x8124e440
	.word  0x54e472d3,0x651ff9a2,0xbe474285,0xc49a111f
	.word  0x23359e7c,0x6ddfc5f0,0x5ffa71aa,0xfca5cd6a
	.word  0x0740f133,0x8b4128de,0x8bd68c3e,0x86fe7024
	.word  0x96441f9f,0xb11d75f8,0xe6e60c9b,0x05179e35
	.word  0x90a014ca,0xc31e41e9,0xc045cb8e,0xf1c463b2
	.word  0x94dd453d,0x550d50fd,0x0b7bdb48,0x9cd53688
	.word  0xa5f6968b,0x4609681f,0xa52cc57f,0x665a08c1
	.word  0x39dd179d,0x89ece7e5,0xf95d6f12,0x3a2f2920
	.word  0x30c5d585,0x808a9a5f,0x7b85bf90,0xdb462646
	.word  0xb1bcd53a,0x8786edf3,0xe576811e,0xb66a1bc9
	.word  0x11054035,0x22e35d7a,0x428459f8,0x3c15a118
	.word  0x1d9c5b93,0x643b0edd,0xfb9b4af7,0xe0e32efb
	.word  0xb56cb0c1,0x3b7089a5,0xa482e9cb,0x0aac97c0
	.word  0xd167c11a,0xfd144a67,0x44ceead5,0x67d34283
	.word  0x6fcd23ac,0x3664871d,0x434fc618,0xb845ddd7
	.word  0x376e54ca,0xd0a2395e,0xa735efba,0x5ae503c9
	.word  0x2e6d6219,0x9e0bf617,0x347ab812,0x73d3db5e
	.word  0x721aa39b,0xef2a5d32,0xe2af0347,0x8abd0b52
	.word  0x458932ac,0x7d460016,0x78a9ae6d,0x22286460
	.word  0xb4635364,0x07fdbf79,0xff3fd17f,0x40d7c646
	.word  0xcae08eb8,0x720ca081,0x84811255,0x027b6579
	.word  0xd01c5def,0xb65aea66,0xa9df8fa2,0x5e1dca74
	.word  0x9062c794,0xdd363bc9,0x9726ff3d,0x840b55ce
	.word  0xb84af97a,0x62699890,0xcba10f9a,0xd30e3892
	.word  0x0f8c34c5,0x60f1b829,0x3f8e638e,0x6a40e214
	.word  0x94fccbca,0xe5ef854e,0x1d232061,0x3e2e66fd
	.word  0xf54b4639,0x718355c5,0xa67b922d,0x62e2e5c6
	.word  0x479bc709,0x35d1f2b3,0x192a8f5e,0xcc00083a
	.word  0xd784ea76,0xd7f07afc,0x6bb6dad3,0xc1e086aa
	.word  0x85a254bb,0x0020a7ea,0x18477650,0x915bd419
	.word  0xc7c2c88f,0xa9487c22,0x5a4d5afa,0x633a3a7c
	.word  0x9709bf4c,0x6a04244b,0xd2276650,0xa3195162
	.word  0xca501dc8,0x38f32d4e,0xdc68cad0,0x6d5bcfb9
	.word  0xb7205196,0x70265b4f,0xc0925d1c,0x04a79e77
	.word  0x6c2125c6,0xceffd20b,0x69a9019a,0x50a7cab0
	.word  0xd96cb0c4,0x3ebdbfaf,0x1f42a0d8,0x3c3f777e

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
!! Rule   3 (line  130), Count:    75  inst_type            -> mul 
!! Rule   4 (line  130), Count:    86  inst_type            -> div 
!! Rule   5 (line  130), Count:    78  inst_type            -> fpop 
!! Rule   6 (line  130), Count:   101  inst_type            -> load 
!! Rule   7 (line  130), Count:    89  inst_type            -> asi_load 
!! Rule   8 (line  130), Count:    83  inst_type            -> asi_st 
!! Rule   9 (line  130), Count:    86  inst_type            -> br 
!! Rule  10 (line  130), Count:   101  inst_type            -> membar 
!! Rule  11 (line  130), Count:    93  inst_type            -> atomic 
!! Rule  12 (line  130), Count:    92  inst_type            -> flush 
!! Rule  13 (line  131), Count:   105  inst_type            -> prefetch 
!! Rule  14 (line  137), Count:    43  fpop                 -> st_fp 
!! Rule  15 (line  137), Count:    34  fpop                 -> arith_fp 
!! Rule  16 (line  140), Count:     5  mul                  -> tMULX_R 
!! Rule  17 (line  140), Count:     5  mul                  -> tMULX_I 
!! Rule  18 (line  140), Count:     5  mul                  -> tUMUL_R 
!! Rule  19 (line  140), Count:     3  mul                  -> tUMUL_I 
!! Rule  20 (line  140), Count:     3  mul                  -> tSMUL_R 
!! Rule  21 (line  140), Count:     8  mul                  -> tSMUL_I 
!! Rule  22 (line  140), Count:     6  mul                  -> tUMULcc_R 
!! Rule  23 (line  140), Count:     6  mul                  -> tUMULcc_I 
!! Rule  24 (line  140), Count:     6  mul                  -> tSMULcc_R 
!! Rule  25 (line  140), Count:     6  mul                  -> tSMULcc_I 
!! Rule  26 (line  140), Count:     3  mul                  -> tMULScc_R 
!! Rule  27 (line  140), Count:     8  mul                  -> tMULScc_I 
!! Rule  28 (line  143), Count:     5  div                  -> tUDIV_I 
!! Rule  29 (line  143), Count:     9  div                  -> tUDIV_R 
!! Rule  30 (line  143), Count:     4  div                  -> tSDIV_I 
!! Rule  31 (line  143), Count:     9  div                  -> tSDIV_R 
!! Rule  32 (line  143), Count:     6  div                  -> tSDIVX_R 
!! Rule  33 (line  143), Count:     8  div                  -> tSDIVX_I 
!! Rule  34 (line  143), Count:     7  div                  -> tUDIVX_R 
!! Rule  35 (line  143), Count:     2  div                  -> tUDIVX_I 
!! Rule  36 (line  143), Count:     7  div                  -> tUDIVcc_I 
!! Rule  37 (line  143), Count:     9  div                  -> tUDIVcc_R 
!! Rule  38 (line  143), Count:     5  div                  -> tSDIVcc_I 
!! Rule  39 (line  143), Count:     4  div                  -> tSDIVcc_R 
!! Rule  40 (line  146), Count:     2  load                 -> tLDSB_R 
!! Rule  41 (line  146), Count:     6  load                 -> tLDSB_I 
!! Rule  42 (line  146), Count:     9  load                 -> tLDSH_R 
!! Rule  43 (line  146), Count:     7  load                 -> tLDSH_I 
!! Rule  44 (line  146), Count:     6  load                 -> tLDSW_R 
!! Rule  45 (line  146), Count:     4  load                 -> tLDSW_I 
!! Rule  46 (line  146), Count:    11  load                 -> tLDUB_R 
!! Rule  47 (line  146), Count:     7  load                 -> tLDUB_I 
!! Rule  48 (line  146), Count:     4  load                 -> tLDUH_R 
!! Rule  49 (line  146), Count:     6  load                 -> tLDUH_I 
!! Rule  50 (line  146), Count:     8  load                 -> tLDUW_R 
!! Rule  51 (line  146), Count:     2  load                 -> tLDUW_I 
!! Rule  52 (line  146), Count:     0  load                 -> tLDX_R 
!! Rule  53 (line  146), Count:     3  load                 -> tLDX_I 
!! Rule  54 (line  146), Count:     6  load                 -> tLDD_R 
!! Rule  55 (line  146), Count:     5  load                 -> tLDD_I 
!! Rule  56 (line  149), Count:     6  asi_load             -> tLDSBA_R 
!! Rule  57 (line  149), Count:     3  asi_load             -> tLDSBA_I 
!! Rule  58 (line  149), Count:     7  asi_load             -> tLDSHA_R 
!! Rule  59 (line  149), Count:     4  asi_load             -> tLDSHA_I 
!! Rule  60 (line  149), Count:     2  asi_load             -> tLDSWA_R 
!! Rule  61 (line  149), Count:     7  asi_load             -> tLDSWA_I 
!! Rule  62 (line  149), Count:     4  asi_load             -> tLDUBA_R 
!! Rule  63 (line  149), Count:     0  asi_load             -> tLDUBA_I 
!! Rule  64 (line  149), Count:     4  asi_load             -> tLDUHA_R 
!! Rule  65 (line  149), Count:     9  asi_load             -> tLDUHA_I 
!! Rule  66 (line  149), Count:     7  asi_load             -> tLDUWA_R 
!! Rule  67 (line  149), Count:     6  asi_load             -> tLDUWA_I 
!! Rule  68 (line  149), Count:     5  asi_load             -> tLDXA_R 
!! Rule  69 (line  149), Count:     5  asi_load             -> tLDXA_I 
!! Rule  70 (line  149), Count:     4  asi_load             -> tLDDA_R 
!! Rule  71 (line  149), Count:     1  asi_load             -> tLDDA_I 
!! Rule  72 (line  152), Count:     7  asi_st               -> tSTBA_R 
!! Rule  73 (line  152), Count:    13  asi_st               -> tSTBA_I 
!! Rule  74 (line  152), Count:     6  asi_st               -> tSTHA_R 
!! Rule  75 (line  152), Count:     9  asi_st               -> tSTHA_I 
!! Rule  76 (line  152), Count:     6  asi_st               -> tSTWA_R 
!! Rule  77 (line  152), Count:     5  asi_st               -> tSTWA_I 
!! Rule  78 (line  152), Count:     4  asi_st               -> tSTXA_R 
!! Rule  79 (line  152), Count:     9  asi_st               -> tSTXA_I 
!! Rule  80 (line  152), Count:     9  asi_st               -> tSTDA_R 
!! Rule  81 (line  152), Count:     6  asi_st               -> tSTDA_I 
!! Rule  82 (line  155), Count:     2  br                   -> tBA 
!! Rule  83 (line  155), Count:     1  br                   -> tBN 
!! Rule  84 (line  155), Count:     2  br                   -> tBNE 
!! Rule  85 (line  155), Count:     1  br                   -> tBE 
!! Rule  87 (line  155), Count:     3  br                   -> tBLE 
!! Rule  88 (line  155), Count:     3  br                   -> tBGE 
!! Rule  89 (line  155), Count:     4  br                   -> tBL 
!! Rule  90 (line  155), Count:     2  br                   -> tBGU 
!! Rule  92 (line  156), Count:     3  br                   -> tBCC 
!! Rule  93 (line  156), Count:     5  br                   -> tBCS 
!! Rule  94 (line  156), Count:     4  br                   -> tBPOS 
!! Rule  95 (line  156), Count:     5  br                   -> tBNEG 
!! Rule  96 (line  156), Count:     3  br                   -> tBVC 
!! Rule  97 (line  156), Count:     1  br                   -> tBVS 
!! Rule  98 (line  156), Count:     4  br                   -> tBRZ 
!! Rule  99 (line  156), Count:     3  br                   -> tBRLEZ 
!! Rule 100 (line  157), Count:     4  br                   -> tBRLZ 
!! Rule 101 (line  157), Count:     5  br                   -> tBRNZ 
!! Rule 102 (line  157), Count:     5  br                   -> tBRGZ 
!! Rule 103 (line  157), Count:     0  br                   -> tBRGEZ 
!! Rule 104 (line  157), Count:     6  br                   -> tCALL 
!! Rule 105 (line  160), Count:    53  membar               -> tMEMBAR 
!! Rule 106 (line  160), Count:    47  membar               -> tSTBAR 
!! Rule 107 (line  163), Count:    11  atomic               -> tCASA_R 
!! Rule 108 (line  163), Count:     5  atomic               -> tCASA_I 
!! Rule 109 (line  163), Count:     7  atomic               -> tCASXA_R 
!! Rule 110 (line  163), Count:     7  atomic               -> tCASXA_I 
!! Rule 111 (line  163), Count:     5  atomic               -> tLDSTUBA_I 
!! Rule 112 (line  163), Count:     9  atomic               -> tLDSTUB_I 
!! Rule 113 (line  163), Count:    13  atomic               -> tLDSTUB_R 
!! Rule 114 (line  163), Count:     5  atomic               -> tLDSTUBA_R 
!! Rule 115 (line  163), Count:     4  atomic               -> tSWAP_I 
!! Rule 116 (line  163), Count:     4  atomic               -> tSWAP_R 
!! Rule 117 (line  163), Count:     3  atomic               -> tSWAPA_I 
!! Rule 118 (line  163), Count:     9  atomic               -> tSWAPA_R 
!! Rule 119 (line  166), Count:     9  st_fp                -> tSTF_R 
!! Rule 120 (line  166), Count:     7  st_fp                -> tSTF_I 
!! Rule 121 (line  166), Count:    10  st_fp                -> tSTDF_I 
!! Rule 122 (line  166), Count:    14  st_fp                -> tSTDF_R 
!! Rule 123 (line  169), Count:     0  arith_fp             -> tFADDs 
!! Rule 124 (line  169), Count:     6  arith_fp             -> tFSUBs 
!! Rule 125 (line  169), Count:    14  arith_fp             -> tFMULs 
!! Rule 126 (line  169), Count:    11  arith_fp             -> tFDIVs 
!! Rule 127 (line  172), Count:    25  prefetch             -> tPREFETCH_I 
!! Rule 128 (line  172), Count:    26  prefetch             -> tPREFETCH_R 
!! Rule 129 (line  172), Count:    25  prefetch             -> tPREFETCHA_I 
!! Rule 130 (line  172), Count:    26  prefetch             -> tPREFETCHA_R 
!! Rule 131 (line  175), Count:    43  flush                -> tFLUSH_I 
!! 
!!   257: Token tMULX_R	Count = 6
!!   258: Token tMULX_I	Count = 6
!!   259: Token tUMUL_R	Count = 6
!!   260: Token tUMUL_I	Count = 4
!!   261: Token tSMUL_R	Count = 4
!!   262: Token tSMUL_I	Count = 9
!!   263: Token tUMULcc_R	Count = 7
!!   264: Token tUMULcc_I	Count = 7
!!   265: Token tSMULcc_R	Count = 7
!!   266: Token tSMULcc_I	Count = 7
!!   267: Token tMULScc_R	Count = 4
!!   268: Token tMULScc_I	Count = 9
!!   269: Token tUDIV_I	Count = 6
!!   270: Token tUDIV_R	Count = 10
!!   271: Token tSDIV_I	Count = 5
!!   272: Token tSDIV_R	Count = 10
!!   273: Token tSDIVX_R	Count = 7
!!   274: Token tSDIVX_I	Count = 9
!!   275: Token tUDIVX_R	Count = 8
!!   276: Token tUDIVX_I	Count = 3
!!   277: Token tUDIVcc_I	Count = 8
!!   278: Token tUDIVcc_R	Count = 10
!!   279: Token tSDIVcc_I	Count = 6
!!   280: Token tSDIVcc_R	Count = 5
!!   281: Token tLDSB_R	Count = 3
!!   282: Token tLDSB_I	Count = 7
!!   283: Token tLDSH_R	Count = 10
!!   284: Token tLDSH_I	Count = 8
!!   285: Token tLDSW_R	Count = 7
!!   286: Token tLDSW_I	Count = 5
!!   287: Token tLDUB_R	Count = 12
!!   288: Token tLDUB_I	Count = 8
!!   289: Token tLDUH_R	Count = 5
!!   290: Token tLDUH_I	Count = 7
!!   291: Token tLDUW_R	Count = 9
!!   292: Token tLDUW_I	Count = 3
!!   293: Token tLDX_R	Count = 1
!!   294: Token tLDX_I	Count = 4
!!   295: Token tLDD_R	Count = 7
!!   296: Token tLDD_I	Count = 6
!!   297: Token tLDSBA_R	Count = 7
!!   298: Token tLDSBA_I	Count = 4
!!   299: Token tLDSHA_R	Count = 8
!!   300: Token tLDSHA_I	Count = 5
!!   301: Token tLDSWA_R	Count = 3
!!   302: Token tLDSWA_I	Count = 8
!!   303: Token tLDUBA_R	Count = 5
!!   304: Token tLDUBA_I	Count = 1
!!   305: Token tLDUHA_R	Count = 5
!!   306: Token tLDUHA_I	Count = 10
!!   307: Token tLDUWA_R	Count = 8
!!   308: Token tLDUWA_I	Count = 7
!!   309: Token tLDXA_R	Count = 6
!!   310: Token tLDXA_I	Count = 6
!!   311: Token tLDDA_R	Count = 5
!!   312: Token tLDDA_I	Count = 2
!!   313: Token tSTBA_R	Count = 8
!!   314: Token tSTBA_I	Count = 14
!!   315: Token tSTHA_R	Count = 7
!!   316: Token tSTHA_I	Count = 10
!!   317: Token tSTWA_R	Count = 7
!!   318: Token tSTWA_I	Count = 6
!!   319: Token tSTXA_R	Count = 5
!!   320: Token tSTXA_I	Count = 10
!!   321: Token tSTDA_R	Count = 10
!!   322: Token tSTDA_I	Count = 7
!!   323: Token tBA	Count = 3
!!   324: Token tBN	Count = 2
!!   325: Token tBNE	Count = 3
!!   326: Token tBE	Count = 2
!!   327: Token tBG	Count = 0
!!   328: Token tBLE	Count = 4
!!   329: Token tBGE	Count = 4
!!   330: Token tBL	Count = 5
!!   331: Token tBGU	Count = 3
!!   332: Token tBLEU	Count = 0
!!   333: Token tBCC	Count = 4
!!   334: Token tBCS	Count = 6
!!   335: Token tBPOS	Count = 5
!!   336: Token tBNEG	Count = 6
!!   337: Token tBVC	Count = 4
!!   338: Token tBVS	Count = 2
!!   339: Token tBRZ	Count = 5
!!   340: Token tBRLEZ	Count = 4
!!   341: Token tBRLZ	Count = 5
!!   342: Token tBRNZ	Count = 6
!!   343: Token tBRGZ	Count = 6
!!   344: Token tBRGEZ	Count = 1
!!   345: Token tCALL	Count = 7
!!   346: Token tMEMBAR	Count = 54
!!   347: Token tSTBAR	Count = 48
!!   348: Token tCASA_R	Count = 12
!!   349: Token tCASA_I	Count = 6
!!   350: Token tCASXA_R	Count = 8
!!   351: Token tCASXA_I	Count = 8
!!   352: Token tLDSTUBA_I	Count = 6
!!   353: Token tLDSTUB_I	Count = 10
!!   354: Token tLDSTUB_R	Count = 14
!!   355: Token tLDSTUBA_R	Count = 6
!!   356: Token tSWAP_I	Count = 5
!!   357: Token tSWAP_R	Count = 5
!!   358: Token tSWAPA_I	Count = 4
!!   359: Token tSWAPA_R	Count = 10
!!   360: Token tSTF_R	Count = 10
!!   361: Token tSTF_I	Count = 8
!!   362: Token tSTDF_I	Count = 11
!!   363: Token tSTDF_R	Count = 15
!!   364: Token tFADDs	Count = 1
!!   365: Token tFSUBs	Count = 7
!!   366: Token tFMULs	Count = 15
!!   367: Token tFDIVs	Count = 12
!!   368: Token tPREFETCH_I	Count = 26
!!   369: Token tPREFETCH_R	Count = 27
!!   370: Token tPREFETCHA_I	Count = 26
!!   371: Token tPREFETCHA_R	Count = 27
!!   372: Token tFLUSH_I	Count = 44
!!   373: Token tFLUSH_R	Count = 49
!! 
!! 
!! +++ finish +++

