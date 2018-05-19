// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: bug3753.s
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
   random seed:	282836914
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
        setx  0x0000000000000290, %g1, %r11
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
        setx  0x3fa1e6c020f67124, %g1, %r0
        setx  0xae3bddc5d29895a0, %g1, %r1
        setx  0x23b12a3f9d607eea, %g1, %r2
        setx  0x147f2fe147c11a8c, %g1, %r3
        setx  0x49a4557e697f47ca, %g1, %r4
        setx  0x24f4c625b2269e45, %g1, %r5
        setx  0x078b90d9af3a7c1c, %g1, %r6
        setx  0xb441d5c0980f0bc1, %g1, %r7
        setx  0x5c2b97e5250d3407, %g1, %r8
        setx  0x948dacf8613185a9, %g1, %r9
        setx  0x396150af8a2508e1, %g1, %r12
        setx  0x4fe3ba523dc5d875, %g1, %r13
        setx  0x83879e459e1052c8, %g1, %r14
        setx  0xcdb35554cd7a6e57, %g1, %r15
        setx  0x337eafa6c9cc419f, %g1, %r16
        setx  0xb89c03f451f7e02c, %g1, %r17
        setx  0x67ba8f16c88b268c, %g1, %r18
        setx  0xc302a982c324a898, %g1, %r19
        setx  0x30714602c0e3fd80, %g1, %r20
        setx  0xe97298a6d00c7029, %g1, %r21
        setx  0xbbe0fa900b0e5e5d, %g1, %r22
        setx  0x0060ae742193817c, %g1, %r23
        setx  0xd5034aaa43fbde6f, %g1, %r24
        setx  0x569333642c87def8, %g1, %r25
        setx  0xc4a1c754a3d76872, %g1, %r26
        setx  0x4f832c61d7823fc7, %g1, %r27
        setx  0xaee09f6ac4ab2e32, %g1, %r28
        setx  0x465269a2486670ce, %g1, %r29
        setx  0x12ecdd4a99ef58f4, %g1, %r30
        setx  0x6d53b17485a96857, %g1, %r31
	.word 0x84faac1c  ! 5: SDIVcc_I	sdivcc 	%r10, 0x0c1c, %r2
	.word 0x8143e06d  ! 7: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #MemIssue | #Sync 
	.word 0xed3aae08  ! 8: STDF_I	std	%f22, [0x0e08, %r10]
	stxa	%r28, [%r10 + %r11] 0x80	
	.word 0x8143e02e  ! 11: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #MemIssue 
	.word 0xc8eaa31c  ! 12: LDSTUBA_I	ldstuba	%r4, [%r10 + 0x031c] %asi
	.word 0xce02a320  ! 13: LDUW_I	lduw	[%r10 + 0x0320], %r7
	.word 0x8143e013  ! 14: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside 
	.word 0xcad2a66c  ! 15: LDSHA_I	ldsha	[%r10, + 0x066c] %asi, %r5
	.word 0x8b6aa5e8  ! 16: SDIVX_I	sdivx	%r10, 0x05e8, %r5
	.word 0xcc5a800b  ! 17: LDX_R	ldx	[%r10 + %r11], %r6
	.word 0xbc7a800b  ! 18: SDIV_R	sdiv 	%r10, %r11, %r30
	.word 0xe9f2a00b  ! 19: CASXA_R	casxa	[%r10]%asi, %r11, %r20
	.word 0x916a800b  ! 20: SDIVX_R	sdivx	%r10, %r11, %r8
	.word 0x8143c000  ! 21: STBAR	stbar
	.word 0xc89aacd0  ! 22: LDDA_I	ldda	[%r10, + 0x0cd0] %asi, %r4
	.word 0x8ddaa4e4  ! 23: FLUSH_I	dis not found

	.word 0xc6f2a508  ! 24: STXA_I	stxa	%r3, [%r10 + 0x0508] %asi
	.word 0xcb22800b  ! 25: STF_R	st	%f5, [%r11, %r10]
	.word 0xf1e2900b  ! 26: CASA_I	casa	[%r10] 0x80, %r11, %r24
	.word 0x8cd2800b  ! 27: UMULcc_R	umulcc 	%r10, %r11, %r6
	.word 0x87da800b  ! 28: FLUSH_R	dis not found

	.word 0xccb2a5a4  ! 29: STHA_I	stha	%r6, [%r10 + 0x05a4] %asi
	.word 0x9c5a800b  ! 30: SMUL_R	smul 	%r10, %r11, %r14
	.word 0xc36a800b  ! 31: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x8143c000  ! 33: STBAR	stbar
	.word 0x93da800b  ! 34: FLUSH_R	dis not found

	stxa	%r4, [%r10 + %r11] 0x80	
	.word 0xc7f2900b  ! 36: CASXA_I	casxa	[%r10] 0x80, %r11, %r3
	.word 0x82da800b  ! 37: SMULcc_R	smulcc 	%r10, %r11, %r1
	.word 0xd0a2a57c  ! 39: STWA_I	stwa	%r8, [%r10 + 0x057c] %asi
	.word 0xf922800b  ! 40: STF_R	st	%f28, [%r11, %r10]
	.word 0x0e800003  ! 41: BVS	bvs  	<label_0x3>
	.word 0x88d2a6a4  ! 42: UMULcc_I	umulcc 	%r10, 0x06a4, %r4
	.word 0xfcca900b  ! 44: LDSBA_R	ldsba	[%r10, %r11] 0x80, %r30
	.word 0xc252800b  ! 45: LDSH_R	ldsh	[%r10 + %r11], %r1
	.word 0xc6f2a478  ! 46: STXA_I	stxa	%r3, [%r10 + 0x0478] %asi
	.word 0x8a72800b  ! 47: UDIV_R	udiv 	%r10, %r11, %r5
	.word 0x18800001  ! 48: BGU	bgu  	<label_0x1>
	.word 0x8143e01a  ! 49: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside 
	.word 0xfef2a848  ! 50: STXA_I	stxa	%r31, [%r10 + 0x0848] %asi
	.word 0xdefaa9e4  ! 51: SWAPA_I	swapa	%r15, [%r10 + 0x09e4] %asi
	.word 0xc89aae98  ! 52: LDDA_I	ldda	[%r10, + 0x0e98] %asi, %r4
	.word 0xecf2900b  ! 53: STXA_R	stxa	%r22, [%r10 + %r11] 0x80
	.word 0xd812800b  ! 54: LDUH_R	lduh	[%r10 + %r11], %r12
	.word 0xf4ca900b  ! 55: LDSBA_R	ldsba	[%r10, %r11] 0x80, %r26
	.word 0x0ec20003  ! 56: BRGEZ	brgez  ,nt	%8,<label_0x20003>
	.word 0x8143e04f  ! 57: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #Sync 
	.word 0xd0aaa044  ! 58: STBA_I	stba	%r8, [%r10 + 0x0044] %asi
	.word 0x90faa3f4  ! 59: SDIVcc_I	sdivcc 	%r10, 0x03f4, %r8
	.word 0xc8daa1d8  ! 60: LDXA_I	ldxa	[%r10, + 0x01d8] %asi, %r4
	.word 0xc87a800b  ! 61: SWAP_R	swap	%r4, [%r10 + %r11]
	.word 0x8cfa800b  ! 62: SDIVcc_R	sdivcc 	%r10, %r11, %r6
	.word 0xc5f2a00b  ! 63: CASXA_R	casxa	[%r10]%asi, %r11, %r2
	.word 0x8cd2a3ac  ! 64: UMULcc_I	umulcc 	%r10, 0x03ac, %r6
	.word 0xa5daa860  ! 65: FLUSH_I	dis not found

	.word 0xfc9aad80  ! 66: LDDA_I	ldda	[%r10, + 0x0d80] %asi, %r30
	.word 0xe47a800b  ! 67: SWAP_R	swap	%r18, [%r10 + %r11]
	.word 0xcec2a5bc  ! 68: LDSWA_I	ldswa	[%r10, + 0x05bc] %asi, %r7
	.word 0x8322a188  ! 69: MULScc_I	mulscc 	%r10, 0x0188, %r1
	.word 0xafda800b  ! 70: FLUSH_R	dis not found

	.word 0x84d2800b  ! 71: UMULcc_R	umulcc 	%r10, %r11, %r2
	.word 0xd012800b  ! 72: LDUH_R	lduh	[%r10 + %r11], %r8
	.word 0x8143e065  ! 73: MEMBAR	membar	#LoadLoad | #LoadStore | #MemIssue | #Sync 
	stxa	%r16, [%r10 + 0x0578] %asi	
	.word 0xb25a800b  ! 75: SMUL_R	smul 	%r10, %r11, %r25
	.word 0x9c7aac44  ! 76: SDIV_I	sdiv 	%r10, 0x0c44, %r14
	.word 0x865a800b  ! 77: SMUL_R	smul 	%r10, %r11, %r3
	.word 0x2e800001  ! 78: BVS	bvs,a	<label_0x1>
	.word 0x2cca0003  ! 79: BRGZ	brgz,a,pt	%8,<label_0xa0003>
	.word 0x2c800001  ! 80: BNEG	bneg,a	<label_0x1>
	.word 0xc3eaaf50  ! 81: PREFETCHA_I	prefetcha	[%r10, + 0x0f50] %asi, #one_read
	stxa	%r2, [%r10 + %r11] 0x80	
	.word 0x8143c000  ! 83: STBAR	stbar
	.word 0x38800001  ! 84: BGU	bgu,a	<label_0x1>
	.word 0xa86aa29c  ! 85: UDIVX_I	udivx 	%r10, 0x029c, %r20
	.word 0xc202a024  ! 86: LDUW_I	lduw	[%r10 + 0x0024], %r1
	.word 0x8143c000  ! 87: STBAR	stbar
	.word 0x38800001  ! 88: BGU	bgu,a	<label_0x1>
	.word 0xc73aa2e8  ! 89: STDF_I	std	%f3, [0x02e8, %r10]
	.word 0xbfa289ab  ! 90: FDIVs	fdivs	%f10, %f11, %f31
	.word 0x28800001  ! 91: BLEU	bleu,a	<label_0x1>
	.word 0xa1daac8c  ! 92: FLUSH_I	dis not found

	.word 0xc322800b  ! 93: STF_R	st	%f1, [%r11, %r10]
	.word 0x93daa3d4  ! 94: FLUSH_I	dis not found

	.word 0x8143e018  ! 95: MEMBAR	membar	#StoreStore | #Lookaside 
	.word 0x8c6aa3c8  ! 96: UDIVX_I	udivx 	%r10, 0x03c8, %r6
	.word 0xb47a800b  ! 97: SDIV_R	sdiv 	%r10, %r11, %r26
	.word 0x8143c000  ! 98: STBAR	stbar
	.word 0xc6a2900b  ! 99: STWA_R	stwa	%r3, [%r10 + %r11] 0x80
	.word 0xc5f2a00b  ! 100: CASXA_R	casxa	[%r10]%asi, %r11, %r2
	.word 0x9fda800b  ! 101: FLUSH_R	dis not found

	.word 0xdef2900b  ! 102: STXA_R	stxa	%r15, [%r10 + %r11] 0x80
	.word 0xc252ad24  ! 103: LDSH_I	ldsh	[%r10 + 0x0d24], %r1
	.word 0xb3a289ab  ! 104: FDIVs	fdivs	%f10, %f11, %f25
	.word 0xc9f2a00b  ! 105: CASXA_R	casxa	[%r10]%asi, %r11, %r4
	.word 0xcdf2a00b  ! 106: CASXA_R	casxa	[%r10]%asi, %r11, %r6
	.word 0xa07aa64c  ! 107: SDIV_I	sdiv 	%r10, 0x064c, %r16
	.word 0xcaaa900b  ! 108: STBA_R	stba	%r5, [%r10 + %r11] 0x80
	.word 0xc36aa39c  ! 109: PREFETCH_I	prefetch	[%r10 + 0x039c], #one_read
	.word 0x20800001  ! 110: BN	bn,a	<label_0x1>
	.word 0x8bdaa854  ! 111: FLUSH_I	dis not found

	.word 0xca42a9e0  ! 112: LDSW_I	ldsw	[%r10 + 0x09e0], %r5
	.word 0x8ddaa6ac  ! 114: FLUSH_I	dis not found

	.word 0xf212800b  ! 115: LDUH_R	lduh	[%r10 + %r11], %r25
	.word 0x83a289ab  ! 116: FDIVs	fdivs	%f10, %f11, %f1
	stxa	%r2, [%r10 + %r11] 0x80	
	.word 0xcef2900b  ! 118: STXA_R	stxa	%r7, [%r10 + %r11] 0x80
	.word 0x8143e066  ! 119: MEMBAR	membar	#StoreLoad | #LoadStore | #MemIssue | #Sync 
	.word 0x12800003  ! 120: BNE	bne  	<label_0x3>
	.word 0xd2b2900b  ! 121: STHA_R	stha	%r9, [%r10 + %r11] 0x80
	.word 0x2c800003  ! 122: BNEG	bneg,a	<label_0x3>
	.word 0xc81aaec8  ! 123: LDD_I	ldd	[%r10 + 0x0ec8], %r4
	.word 0xf322800b  ! 124: STF_R	st	%f25, [%r11, %r10]
	.word 0x93da800b  ! 125: FLUSH_R	dis not found

	.word 0x85da800b  ! 126: FLUSH_R	dis not found

	.word 0xc202800b  ! 127: LDUW_R	lduw	[%r10 + %r11], %r1
	.word 0xc3eaa158  ! 128: PREFETCHA_I	prefetcha	[%r10, + 0x0158] %asi, #one_read
	.word 0xbfdaa9c8  ! 130: FLUSH_I	dis not found

	stxa	%r2, [%r10 + 0x0d58] %asi	
	.word 0xf5e2a00b  ! 132: CASA_R	casa	[%r10] %asi, %r11, %r26
	.word 0x8143c000  ! 133: STBAR	stbar
	.word 0xc882ac30  ! 134: LDUWA_I	lduwa	[%r10, + 0x0c30] %asi, %r4
	.word 0x8143e053  ! 135: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside | #Sync 
	.word 0x8143c000  ! 136: STBAR	stbar
	.word 0x8143e06c  ! 137: MEMBAR	membar	#LoadStore | #StoreStore | #MemIssue | #Sync 
	.word 0xa4d2800b  ! 138: UMULcc_R	umulcc 	%r10, %r11, %r18
	.word 0xced2900b  ! 140: LDSHA_R	ldsha	[%r10, %r11] 0x80, %r7
	.word 0x2ac20001  ! 141: BRNZ	brnz,a,nt	%8,<label_0x20001>
	.word 0x8722800b  ! 142: MULScc_R	mulscc 	%r10, %r11, %r3
	.word 0x8bda800b  ! 143: FLUSH_R	dis not found

	.word 0xaafaa7ec  ! 144: SDIVcc_I	sdivcc 	%r10, 0x07ec, %r21
	.word 0xccf2900b  ! 145: STXA_R	stxa	%r6, [%r10 + %r11] 0x80
	.word 0x93da800b  ! 146: FLUSH_R	dis not found

	.word 0x8fda800b  ! 147: FLUSH_R	dis not found

	.word 0x87daa934  ! 148: FLUSH_I	dis not found

	.word 0xceda900b  ! 149: LDXA_R	ldxa	[%r10, %r11] 0x80, %r7
	.word 0xe7e2900b  ! 150: CASA_I	casa	[%r10] 0x80, %r11, %r19
	.word 0x8652a6ac  ! 151: UMUL_I	umul 	%r10, 0x06ac, %r3
	.word 0x9252800b  ! 152: UMUL_R	umul 	%r10, %r11, %r9
	.word 0x887aa394  ! 153: SDIV_I	sdiv 	%r10, 0x0394, %r4
	.word 0xca8aa9cc  ! 154: LDUBA_I	lduba	[%r10, + 0x09cc] %asi, %r5
	.word 0x89a289ab  ! 155: FDIVs	fdivs	%f10, %f11, %f4
	.word 0x85da800b  ! 156: FLUSH_R	dis not found

	.word 0xc3eaa0e8  ! 157: PREFETCHA_I	prefetcha	[%r10, + 0x00e8] %asi, #one_read
	.word 0xf80aa8f0  ! 158: LDUB_I	ldub	[%r10 + 0x08f0], %r28
	.word 0x89a2882b  ! 159: FADDs	fadds	%f10, %f11, %f4
	.word 0xc8aa900b  ! 160: STBA_R	stba	%r4, [%r10 + %r11] 0x80
	.word 0x0e800001  ! 161: BVS	bvs  	<label_0x1>
	.word 0xc2b2900b  ! 162: STHA_R	stha	%r1, [%r10 + %r11] 0x80
	.word 0x936a800b  ! 163: SDIVX_R	sdivx	%r10, %r11, %r9
	.word 0x8143e01f  ! 164: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #Lookaside 
	.word 0x8452800b  ! 165: UMUL_R	umul 	%r10, %r11, %r2
	.word 0xc852aba0  ! 166: LDSH_I	ldsh	[%r10 + 0x0ba0], %r4
	.word 0x9252a930  ! 167: UMUL_I	umul 	%r10, 0x0930, %r9
	.word 0xd322ab08  ! 168: STF_I	st	%f9, [0x0b08, %r10]
	.word 0xeeda900b  ! 169: LDXA_R	ldxa	[%r10, %r11] 0x80, %r23
	.word 0xb4da800b  ! 170: SMULcc_R	smulcc 	%r10, %r11, %r26
	.word 0xfa92900b  ! 171: LDUHA_R	lduha	[%r10, %r11] 0x80, %r29
	.word 0x0cca0003  ! 172: BRGZ	brgz  ,pt	%8,<label_0xa0003>
	.word 0x2ec20001  ! 173: BRGEZ	brgez,a,nt	%8,<label_0x20001>
	.word 0xca02a8e4  ! 174: LDUW_I	lduw	[%r10 + 0x08e4], %r5
	.word 0xfc7a800b  ! 175: SWAP_R	swap	%r30, [%r10 + %r11]
	.word 0xc2aa900b  ! 176: STBA_R	stba	%r1, [%r10 + %r11] 0x80
	stxa	%r30, [%r10 + %r11] 0x80	
	.word 0xc81a800b  ! 178: LDD_R	ldd	[%r10 + %r11], %r4
	.word 0xc3ea900b  ! 179: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0xc2aaa978  ! 180: STBA_I	stba	%r1, [%r10 + 0x0978] %asi
	.word 0x83da800b  ! 181: FLUSH_R	dis not found

	.word 0x85da800b  ! 182: FLUSH_R	dis not found

	.word 0xce82900b  ! 183: LDUWA_R	lduwa	[%r10, %r11] 0x80, %r7
	.word 0xc4aa900b  ! 184: STBA_R	stba	%r2, [%r10 + %r11] 0x80
	.word 0xe722a06c  ! 185: STF_I	st	%f19, [0x006c, %r10]
	.word 0x8143e07c  ! 186: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xcd22a2ac  ! 187: STF_I	st	%f6, [0x02ac, %r10]
	.word 0x8143e01c  ! 188: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside 
	.word 0xb3daa520  ! 189: FLUSH_I	dis not found

	.word 0x28800001  ! 190: BLEU	bleu,a	<label_0x1>
	.word 0x8fdaa750  ! 191: FLUSH_I	dis not found

	.word 0xc8b2a530  ! 192: STHA_I	stha	%r4, [%r10 + 0x0530] %asi
	.word 0xc36aa71c  ! 193: PREFETCH_I	prefetch	[%r10 + 0x071c], #one_read
	.word 0xc3e2900b  ! 194: CASA_I	casa	[%r10] 0x80, %r11, %r1
	.word 0x87da800b  ! 195: FLUSH_R	dis not found

	.word 0xc4f2af40  ! 196: STXA_I	stxa	%r2, [%r10 + 0x0f40] %asi
	.word 0x85a2892b  ! 197: FMULs	fmuls	%f10, %f11, %f2
	.word 0xdf3aa4e8  ! 198: STDF_I	std	%f15, [0x04e8, %r10]
	.word 0xec9aa370  ! 199: LDDA_I	ldda	[%r10, + 0x0370] %asi, %r22
	.word 0xb45a800b  ! 200: SMUL_R	smul 	%r10, %r11, %r26
	.word 0xbfa288ab  ! 201: FSUBs	fsubs	%f10, %f11, %f31
	.word 0xc6fa900b  ! 202: SWAPA_R	swapa	%r3, [%r10 + %r11] 0x80
	.word 0x847aa118  ! 203: SDIV_I	sdiv 	%r10, 0x0118, %r2
	.word 0xcaaaa97c  ! 204: STBA_I	stba	%r5, [%r10 + 0x097c] %asi
	.word 0x8cdaae8c  ! 205: SMULcc_I	smulcc 	%r10, 0x0e8c, %r6
	.word 0x38800001  ! 206: BGU	bgu,a	<label_0x1>
	.word 0x87da800b  ! 207: FLUSH_R	dis not found

	.word 0x8f6aa7e4  ! 208: SDIVX_I	sdivx	%r10, 0x07e4, %r7
	.word 0xcbe2900b  ! 209: CASA_I	casa	[%r10] 0x80, %r11, %r5
	.word 0x8bdaa070  ! 210: FLUSH_I	dis not found

	.word 0xeb3a800b  ! 211: STDF_R	std	%f21, [%r11, %r10]
	.word 0x0e800003  ! 212: BVS	bvs  	<label_0x3>
	.word 0x925aae3c  ! 213: SMUL_I	smul 	%r10, 0x0e3c, %r9
	.word 0xc40a800b  ! 214: LDUB_R	ldub	[%r10 + %r11], %r2
	.word 0xc3ea900b  ! 215: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0xce0a800b  ! 216: LDUB_R	ldub	[%r10 + %r11], %r7
	.word 0x91a2892b  ! 217: FMULs	fmuls	%f10, %f11, %f8
	.word 0xc522800b  ! 218: STF_R	st	%f2, [%r11, %r10]
	.word 0xc8d2900b  ! 220: LDSHA_R	ldsha	[%r10, %r11] 0x80, %r4
	.word 0xc4aa900b  ! 221: STBA_R	stba	%r2, [%r10 + %r11] 0x80
	.word 0x8143e02a  ! 222: MEMBAR	membar	#StoreLoad | #StoreStore | #MemIssue 
	.word 0xbedaae30  ! 223: SMULcc_I	smulcc 	%r10, 0x0e30, %r31
	.word 0xc212ada0  ! 224: LDUH_I	lduh	[%r10 + 0x0da0], %r1
	.word 0x9052800b  ! 225: UMUL_R	umul 	%r10, %r11, %r8
	.word 0xd9f2a00b  ! 226: CASXA_R	casxa	[%r10]%asi, %r11, %r12
	.word 0x87daaa4c  ! 227: FLUSH_I	dis not found

	.word 0xc36aa934  ! 228: PREFETCH_I	prefetch	[%r10 + 0x0934], #one_read
	.word 0xb96a800b  ! 229: SDIVX_R	sdivx	%r10, %r11, %r28
	.word 0x8d22800b  ! 230: MULScc_R	mulscc 	%r10, %r11, %r6
	.word 0x89da800b  ! 231: FLUSH_R	dis not found

	.word 0xd242800b  ! 232: LDSW_R	ldsw	[%r10 + %r11], %r9
	.word 0x90f2800b  ! 233: UDIVcc_R	udivcc 	%r10, %r11, %r8
	.word 0xbda2882b  ! 234: FADDs	fadds	%f10, %f11, %f30
	.word 0x8fdaac88  ! 235: FLUSH_I	dis not found

	.word 0xf042aa40  ! 236: LDSW_I	ldsw	[%r10 + 0x0a40], %r24
	.word 0x91da800b  ! 237: FLUSH_R	dis not found

	.word 0x8143c000  ! 238: STBAR	stbar
	.word 0xc6b2900b  ! 239: STHA_R	stha	%r3, [%r10 + %r11] 0x80
	.word 0xc60aa018  ! 240: LDUB_I	ldub	[%r10 + 0x0018], %r3
	.word 0x3e800001  ! 241: BVC	bvc,a	<label_0x1>
	.word 0xce5aab70  ! 242: LDX_I	ldx	[%r10 + 0x0b70], %r7
	.word 0xcc1a800b  ! 243: LDD_R	ldd	[%r10 + %r11], %r6
	.word 0x8143e026  ! 244: MEMBAR	membar	#StoreLoad | #LoadStore | #MemIssue 
	.word 0xe402aea4  ! 245: LDUW_I	lduw	[%r10 + 0x0ea4], %r18
	.word 0xcf3aa588  ! 246: STDF_I	std	%f7, [0x0588, %r10]
	.word 0xd08aacf8  ! 247: LDUBA_I	lduba	[%r10, + 0x0cf8] %asi, %r8
	.word 0x987a800b  ! 248: SDIV_R	sdiv 	%r10, %r11, %r12
	.word 0xc6daa310  ! 249: LDXA_I	ldxa	[%r10, + 0x0310] %asi, %r3
	.word 0xc412800b  ! 250: LDUH_R	lduh	[%r10 + %r11], %r2
	.word 0xc3eaa25c  ! 251: PREFETCHA_I	prefetcha	[%r10, + 0x025c] %asi, #one_read
	.word 0x2e800003  ! 252: BVS	bvs,a	<label_0x3>
	.word 0x28800003  ! 253: BLEU	bleu,a	<label_0x3>
	.word 0x8143c000  ! 254: STBAR	stbar
	.word 0xc4c2900b  ! 255: LDSWA_R	ldswa	[%r10, %r11] 0x80, %r2
	.word 0xce02800b  ! 256: LDUW_R	lduw	[%r10 + %r11], %r7
	.word 0x14800001  ! 257: BG	bg  	<label_0x1>
	.word 0xf812acc0  ! 258: LDUH_I	lduh	[%r10 + 0x0cc0], %r28
	.word 0x34800001  ! 259: BG	bg,a	<label_0x1>
	.word 0xbd22800b  ! 260: MULScc_R	mulscc 	%r10, %r11, %r30
	.word 0x8143c000  ! 261: STBAR	stbar
	.word 0xc68a900b  ! 262: LDUBA_R	lduba	[%r10, %r11] 0x80, %r3
	.word 0xe4fa900b  ! 263: SWAPA_R	swapa	%r18, [%r10 + %r11] 0x80
	.word 0x99a2882b  ! 264: FADDs	fadds	%f10, %f11, %f12
	.word 0x22c20001  ! 265: BRZ	brz,a,nt	%8,<label_0x20001>
	.word 0x83daaa00  ! 266: FLUSH_I	dis not found

	.word 0xc36aacf4  ! 267: PREFETCH_I	prefetch	[%r10 + 0x0cf4], #one_read
	.word 0x864a800b  ! 268: MULX_R	mulx 	%r10, %r11, %r3
	.word 0xd1f2900b  ! 270: CASXA_I	casxa	[%r10] 0x80, %r11, %r8
	.word 0xc4f2900b  ! 271: STXA_R	stxa	%r2, [%r10 + %r11] 0x80
	.word 0xf66a800b  ! 272: LDSTUB_R	ldstub	%r27, [%r10 + %r11]
	.word 0xfeb2900b  ! 273: STHA_R	stha	%r31, [%r10 + %r11] 0x80
	.word 0xb56a800b  ! 274: SDIVX_R	sdivx	%r10, %r11, %r26
	.word 0x92f2800b  ! 275: UDIVcc_R	udivcc 	%r10, %r11, %r9
	.word 0x8652800b  ! 276: UMUL_R	umul 	%r10, %r11, %r3
	.word 0xc7e2900b  ! 277: CASA_I	casa	[%r10] 0x80, %r11, %r3
	.word 0xc202a810  ! 278: LDUW_I	lduw	[%r10 + 0x0810], %r1
	.word 0x2ac20001  ! 279: BRNZ	brnz,a,nt	%8,<label_0x20001>
	.word 0x87a2892b  ! 280: FMULs	fmuls	%f10, %f11, %f3
	.word 0xcdf2a00b  ! 281: CASXA_R	casxa	[%r10]%asi, %r11, %r6
	.word 0xc36aab9c  ! 282: PREFETCH_I	prefetch	[%r10 + 0x0b9c], #one_read
	.word 0xd05a800b  ! 283: LDX_R	ldx	[%r10 + %r11], %r8
	.word 0x0c800003  ! 284: BNEG	bneg  	<label_0x3>
	.word 0xc2eaa09c  ! 285: LDSTUBA_I	ldstuba	%r1, [%r10 + 0x009c] %asi
	.word 0xc802800b  ! 286: LDUW_R	lduw	[%r10 + %r11], %r4
	.word 0xd202ac68  ! 288: LDUW_I	lduw	[%r10 + 0x0c68], %r9
	.word 0xd0a2900b  ! 289: STWA_R	stwa	%r8, [%r10 + %r11] 0x80
	.word 0x92da800b  ! 290: SMULcc_R	smulcc 	%r10, %r11, %r9
	.word 0xd09aa710  ! 291: LDDA_I	ldda	[%r10, + 0x0710] %asi, %r8
	.word 0x8c6a800b  ! 293: UDIVX_R	udivx 	%r10, %r11, %r6
	.word 0xca02a99c  ! 294: LDUW_I	lduw	[%r10 + 0x099c], %r5
	.word 0x93a2892b  ! 296: FMULs	fmuls	%f10, %f11, %f9
	.word 0xc36aa524  ! 297: PREFETCH_I	prefetch	[%r10 + 0x0524], #one_read
	.word 0x8da288ab  ! 298: FSUBs	fsubs	%f10, %f11, %f6
	.word 0xd13aa6f8  ! 299: STDF_I	std	%f8, [0x06f8, %r10]
	.word 0x8adaa624  ! 300: SMULcc_I	smulcc 	%r10, 0x0624, %r5
	.word 0xd33a800b  ! 301: STDF_R	std	%f9, [%r11, %r10]
	.word 0x9e52a1bc  ! 302: UMUL_I	umul 	%r10, 0x01bc, %r15
	.word 0xf322800b  ! 303: STF_R	st	%f25, [%r11, %r10]
	.word 0xe41a800b  ! 304: LDD_R	ldd	[%r10 + %r11], %r18
	.word 0x8852ad14  ! 306: UMUL_I	umul 	%r10, 0x0d14, %r4
	.word 0x9e4aaebc  ! 307: MULX_I	mulx 	%r10, 0x0ebc, %r15
	.word 0x9252800b  ! 308: UMUL_R	umul 	%r10, %r11, %r9
	.word 0xccc2ab7c  ! 309: LDSWA_I	ldswa	[%r10, + 0x0b7c] %asi, %r6
	.word 0xe6c2ae1c  ! 310: LDSWA_I	ldswa	[%r10, + 0x0e1c] %asi, %r19
	.word 0xcde2a00b  ! 311: CASA_R	casa	[%r10] %asi, %r11, %r6
	.word 0x20800003  ! 312: BN	bn,a	<label_0x3>
	.word 0x884aa7c0  ! 313: MULX_I	mulx 	%r10, 0x07c0, %r4
	.word 0x8143c000  ! 314: STBAR	stbar
	.word 0x8143e006  ! 315: MEMBAR	membar	#StoreLoad | #LoadStore 
	.word 0x8fda800b  ! 316: FLUSH_R	dis not found

	.word 0xd20a800b  ! 317: LDUB_R	ldub	[%r10 + %r11], %r9
	.word 0xedf2900b  ! 318: CASXA_I	casxa	[%r10] 0x80, %r11, %r22
	.word 0xe46a800b  ! 319: LDSTUB_R	ldstub	%r18, [%r10 + %r11]
	.word 0xce92900b  ! 320: LDUHA_R	lduha	[%r10, %r11] 0x80, %r7
	.word 0x8143c000  ! 321: STBAR	stbar
	.word 0xec4a800b  ! 322: LDSB_R	ldsb	[%r10 + %r11], %r22
	.word 0x8143c000  ! 323: STBAR	stbar
	.word 0x8ba2882b  ! 324: FADDs	fadds	%f10, %f11, %f5
	.word 0xab6a800b  ! 325: SDIVX_R	sdivx	%r10, %r11, %r21
	.word 0x8143c000  ! 326: STBAR	stbar
	.word 0x04800001  ! 327: BLE	ble  	<label_0x1>
	.word 0x8fda800b  ! 328: FLUSH_R	dis not found

	.word 0x8143e013  ! 329: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside 
	.word 0xcfe2900b  ! 330: CASA_I	casa	[%r10] 0x80, %r11, %r7
	.word 0xcca2a8b8  ! 331: STWA_I	stwa	%r6, [%r10 + 0x08b8] %asi
	.word 0xc2d2900b  ! 332: LDSHA_R	ldsha	[%r10, %r11] 0x80, %r1
	.word 0xd8eaad54  ! 333: LDSTUBA_I	ldstuba	%r12, [%r10 + 0x0d54] %asi
	.word 0x82d2800b  ! 334: UMULcc_R	umulcc 	%r10, %r11, %r1
	.word 0x16800001  ! 335: BGE	bge  	<label_0x1>
	.word 0x8143e05a  ! 336: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside | #Sync 
	.word 0x24ca0001  ! 337: BRLEZ	brlez,a,pt	%8,<label_0xa0001>
	.word 0x34800001  ! 338: BG	bg,a	<label_0x1>
	.word 0xc8c2ae50  ! 339: LDSWA_I	ldswa	[%r10, + 0x0e50] %asi, %r4
	.word 0xdd3a800b  ! 340: STDF_R	std	%f14, [%r11, %r10]
	.word 0x8143e05a  ! 341: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside | #Sync 
	.word 0xb3a289ab  ! 342: FDIVs	fdivs	%f10, %f11, %f25
	.word 0xbfda800b  ! 343: FLUSH_R	dis not found

	.word 0xc36a800b  ! 344: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x90faa8ac  ! 345: SDIVcc_I	sdivcc 	%r10, 0x08ac, %r8
	.word 0x8143c000  ! 346: STBAR	stbar
	.word 0xa272a490  ! 347: UDIV_I	udiv 	%r10, 0x0490, %r17
	.word 0xc8da900b  ! 348: LDXA_R	ldxa	[%r10, %r11] 0x80, %r4
	.word 0x8cf2800b  ! 349: UDIVcc_R	udivcc 	%r10, %r11, %r6
	.word 0x8143c000  ! 350: STBAR	stbar
	.word 0x885aabe0  ! 351: SMUL_I	smul 	%r10, 0x0be0, %r4
	.word 0xe5e2a00b  ! 352: CASA_R	casa	[%r10] %asi, %r11, %r18
	.word 0x93daa6a4  ! 353: FLUSH_I	dis not found

	.word 0xc692afb0  ! 354: LDUHA_I	lduha	[%r10, + 0x0fb0] %asi, %r3
	.word 0x89da800b  ! 356: FLUSH_R	dis not found

	.word 0x8672a104  ! 357: UDIV_I	udiv 	%r10, 0x0104, %r3
	.word 0x836a800b  ! 358: SDIVX_R	sdivx	%r10, %r11, %r1
	.word 0xc4c2900b  ! 359: LDSWA_R	ldswa	[%r10, %r11] 0x80, %r2
	.word 0xa7da800b  ! 360: FLUSH_R	dis not found

	.word 0xc2da900b  ! 361: LDXA_R	ldxa	[%r10, %r11] 0x80, %r1
	.word 0xf3f2900b  ! 362: CASXA_I	casxa	[%r10] 0x80, %r11, %r25
	.word 0xcceaaa48  ! 363: LDSTUBA_I	ldstuba	%r6, [%r10 + 0x0a48] %asi
	.word 0xc9e2a00b  ! 364: CASA_R	casa	[%r10] %asi, %r11, %r4
	.word 0x9872abac  ! 365: UDIV_I	udiv 	%r10, 0x0bac, %r12
	.word 0x8143c000  ! 366: STBAR	stbar
	.word 0xf00aa1cc  ! 367: LDUB_I	ldub	[%r10 + 0x01cc], %r24
	.word 0xbe6aa5ac  ! 368: UDIVX_I	udivx 	%r10, 0x05ac, %r31
	.word 0xc46aafac  ! 369: LDSTUB_I	ldstub	%r2, [%r10 + 0x0fac]
	.word 0xc2c2a600  ! 370: LDSWA_I	ldswa	[%r10, + 0x0600] %asi, %r1
	.word 0xc40aa234  ! 371: LDUB_I	ldub	[%r10 + 0x0234], %r2
	.word 0x91a288ab  ! 372: FSUBs	fsubs	%f10, %f11, %f8
	.word 0xd2b2900b  ! 373: STHA_R	stha	%r9, [%r10 + %r11] 0x80
	.word 0x91a2892b  ! 374: FMULs	fmuls	%f10, %f11, %f8
	.word 0xf1f2a00b  ! 375: CASXA_R	casxa	[%r10]%asi, %r11, %r24
	.word 0xb27a800b  ! 376: SDIV_R	sdiv 	%r10, %r11, %r25
	.word 0xa7daafb0  ! 377: FLUSH_I	dis not found

	.word 0xb5daae8c  ! 378: FLUSH_I	dis not found

	.word 0xc3ea900b  ! 379: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0x38800001  ! 380: BGU	bgu,a	<label_0x1>
	.word 0x92d2800b  ! 381: UMULcc_R	umulcc 	%r10, %r11, %r9
	.word 0xc89aab08  ! 382: LDDA_I	ldda	[%r10, + 0x0b08] %asi, %r4
	.word 0x99da800b  ! 383: FLUSH_R	dis not found

	.word 0x8472800b  ! 384: UDIV_R	udiv 	%r10, %r11, %r2
	.word 0xceaa900b  ! 385: STBA_R	stba	%r7, [%r10 + %r11] 0x80
	.word 0xdc8aae08  ! 386: LDUBA_I	lduba	[%r10, + 0x0e08] %asi, %r14
	.word 0x02800003  ! 387: BE	be  	<label_0x3>
	.word 0x844aad24  ! 388: MULX_I	mulx 	%r10, 0x0d24, %r2
	.word 0x8ddaaa08  ! 389: FLUSH_I	dis not found

	.word 0xb4fa800b  ! 392: SDIVcc_R	sdivcc 	%r10, %r11, %r26
	.word 0xc36a800b  ! 393: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0xc81aa140  ! 394: LDD_I	ldd	[%r10 + 0x0140], %r4
	.word 0xc2caa6c4  ! 395: LDSBA_I	ldsba	[%r10, + 0x06c4] %asi, %r1
	.word 0x02ca0001  ! 396: BRZ	brz  ,pt	%8,<label_0xa0001>
	.word 0xf0b2900b  ! 397: STHA_R	stha	%r24, [%r10 + %r11] 0x80
	.word 0x8a72aa1c  ! 398: UDIV_I	udiv 	%r10, 0x0a1c, %r5
	.word 0xc4aa900b  ! 399: STBA_R	stba	%r2, [%r10 + %r11] 0x80
	.word 0x82daa678  ! 400: SMULcc_I	smulcc 	%r10, 0x0678, %r1
	.word 0xe13aacc0  ! 401: STDF_I	std	%f16, [0x0cc0, %r10]
	.word 0xc6d2ac3c  ! 402: LDSHA_I	ldsha	[%r10, + 0x0c3c] %asi, %r3
	.word 0x88da800b  ! 403: SMULcc_R	smulcc 	%r10, %r11, %r4
	.word 0xc8f2a860  ! 404: STXA_I	stxa	%r4, [%r10 + 0x0860] %asi
	.word 0xc36a800b  ! 405: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0xaada800b  ! 406: SMULcc_R	smulcc 	%r10, %r11, %r21
	.word 0x20800001  ! 407: BN	bn,a	<label_0x1>
	.word 0x896a800b  ! 408: SDIVX_R	sdivx	%r10, %r11, %r4
	.word 0xb3da800b  ! 409: FLUSH_R	dis not found

	.word 0x88f2800b  ! 410: UDIVcc_R	udivcc 	%r10, %r11, %r4
	.word 0x00800003  ! 412: BN	bn  	<label_0x3>
	.word 0x8143e076  ! 413: MEMBAR	membar	#StoreLoad | #LoadStore | #Lookaside | #MemIssue | #Sync 
	.word 0x8143e03c  ! 414: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0x90fa800b  ! 416: SDIVcc_R	sdivcc 	%r10, %r11, %r8
	.word 0x9fa288ab  ! 417: FSUBs	fsubs	%f10, %f11, %f15
	.word 0x8adaa9b4  ! 418: SMULcc_I	smulcc 	%r10, 0x09b4, %r5
	.word 0xb64aaeb4  ! 419: MULX_I	mulx 	%r10, 0x0eb4, %r27
	.word 0x8143c000  ! 420: STBAR	stbar
	.word 0xe442a0c0  ! 421: LDSW_I	ldsw	[%r10 + 0x00c0], %r18
	.word 0x9052800b  ! 422: UMUL_R	umul 	%r10, %r11, %r8
	.word 0xcb3a800b  ! 423: STDF_R	std	%f5, [%r11, %r10]
	.word 0x8c6aa878  ! 424: UDIVX_I	udivx 	%r10, 0x0878, %r6
	.word 0xc3f2900b  ! 425: CASXA_I	casxa	[%r10] 0x80, %r11, %r1
	.word 0x8e6a800b  ! 426: UDIVX_R	udivx 	%r10, %r11, %r7
	.word 0x24c20001  ! 427: BRLEZ	brlez,a,nt	%8,<label_0x20001>
	.word 0x2eca0001  ! 428: BRGEZ	brgez,a,pt	%8,<label_0xa0001>
	.word 0xcf22800b  ! 429: STF_R	st	%f7, [%r11, %r10]
	.word 0xcc6aa554  ! 430: LDSTUB_I	ldstub	%r6, [%r10 + 0x0554]
	.word 0x84fa800b  ! 431: SDIVcc_R	sdivcc 	%r10, %r11, %r2
	.word 0xe0daaa40  ! 432: LDXA_I	ldxa	[%r10, + 0x0a40] %asi, %r16
	.word 0x8143c000  ! 433: STBAR	stbar
	.word 0x93daaf98  ! 434: FLUSH_I	dis not found

	.word 0xcc8aa594  ! 435: LDUBA_I	lduba	[%r10, + 0x0594] %asi, %r6
	.word 0xce7a800b  ! 436: SWAP_R	swap	%r7, [%r10 + %r11]
	.word 0xc922800b  ! 437: STF_R	st	%f4, [%r11, %r10]
	.word 0xd3f2900b  ! 438: CASXA_I	casxa	[%r10] 0x80, %r11, %r9
	.word 0xc36a800b  ! 439: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x24800003  ! 440: BLE	ble,a	<label_0x3>
	.word 0xd0b2aa34  ! 441: STHA_I	stha	%r8, [%r10 + 0x0a34] %asi
	.word 0xf93aad80  ! 442: STDF_I	std	%f28, [0x0d80, %r10]
	.word 0x85a288ab  ! 444: FSUBs	fsubs	%f10, %f11, %f2
	.word 0x856a800b  ! 445: SDIVX_R	sdivx	%r10, %r11, %r2
	.word 0xd28aa6cc  ! 446: LDUBA_I	lduba	[%r10, + 0x06cc] %asi, %r9
	.word 0x8672a854  ! 447: UDIV_I	udiv 	%r10, 0x0854, %r3
	.word 0xb1a2892b  ! 448: FMULs	fmuls	%f10, %f11, %f24
	.word 0xc642a5bc  ! 450: LDSW_I	ldsw	[%r10 + 0x05bc], %r3
	.word 0x83a2892b  ! 451: FMULs	fmuls	%f10, %f11, %f1
	.word 0x8bdaa14c  ! 452: FLUSH_I	dis not found

	.word 0x8a4aa510  ! 453: MULX_I	mulx 	%r10, 0x0510, %r5
	.word 0xc8daa0c0  ! 454: LDXA_I	ldxa	[%r10, + 0x00c0] %asi, %r4
	.word 0xc6f2900b  ! 455: STXA_R	stxa	%r3, [%r10 + %r11] 0x80
	.word 0xbbda800b  ! 456: FLUSH_R	dis not found

	.word 0xc4eaafec  ! 457: LDSTUBA_I	ldstuba	%r2, [%r10 + 0x0fec] %asi
	.word 0x8ddaacd0  ! 458: FLUSH_I	dis not found

	.word 0x916a800b  ! 459: SDIVX_R	sdivx	%r10, %r11, %r8
	.word 0xc3eaa738  ! 460: PREFETCHA_I	prefetcha	[%r10, + 0x0738] %asi, #one_read
	.word 0xc4aa900b  ! 461: STBA_R	stba	%r2, [%r10 + %r11] 0x80
	.word 0x8ba2892b  ! 462: FMULs	fmuls	%f10, %f11, %f5
	.word 0xcbe2900b  ! 463: CASA_I	casa	[%r10] 0x80, %r11, %r5
	.word 0xd2ea900b  ! 464: LDSTUBA_R	ldstuba	%r9, [%r10 + %r11] 0x80
	.word 0x16800003  ! 465: BGE	bge  	<label_0x3>
	.word 0xc642800b  ! 466: LDSW_R	ldsw	[%r10 + %r11], %r3
	.word 0x907aa318  ! 467: SDIV_I	sdiv 	%r10, 0x0318, %r8
	.word 0xf6aaa234  ! 468: STBA_I	stba	%r27, [%r10 + 0x0234] %asi
	.word 0x84d2800b  ! 469: UMULcc_R	umulcc 	%r10, %r11, %r2
	.word 0xcefaad58  ! 470: SWAPA_I	swapa	%r7, [%r10 + 0x0d58] %asi
	.word 0x8af2a004  ! 471: UDIVcc_I	udivcc 	%r10, 0x0004, %r5
	.word 0x8143e01d  ! 472: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside 
	.word 0xc3eaabc8  ! 473: PREFETCHA_I	prefetcha	[%r10, + 0x0bc8] %asi, #one_read
	.word 0xc452a7b0  ! 474: LDSH_I	ldsh	[%r10 + 0x07b0], %r2
	.word 0x9e4a800b  ! 475: MULX_R	mulx 	%r10, %r11, %r15
	.word 0xce0aaee4  ! 476: LDUB_I	ldub	[%r10 + 0x0ee4], %r7
	.word 0x2cca0001  ! 477: BRGZ	brgz,a,pt	%8,<label_0xa0001>
	.word 0xcaa2900b  ! 478: STWA_R	stwa	%r5, [%r10 + %r11] 0x80
	.word 0xabda800b  ! 479: FLUSH_R	dis not found

	.word 0xc87a800b  ! 480: SWAP_R	swap	%r4, [%r10 + %r11]
	.word 0x8143c000  ! 481: STBAR	stbar
	.word 0xc242800b  ! 482: LDSW_R	ldsw	[%r10 + %r11], %r1
	.word 0xcaaaa030  ! 483: STBA_I	stba	%r5, [%r10 + 0x0030] %asi
	.word 0x0eca0003  ! 485: BRGEZ	brgez  ,pt	%8,<label_0xa0003>
	.word 0x84faa488  ! 486: SDIVcc_I	sdivcc 	%r10, 0x0488, %r2
	.word 0x90d2800b  ! 487: UMULcc_R	umulcc 	%r10, %r11, %r8
	.word 0x9ba2892b  ! 488: FMULs	fmuls	%f10, %f11, %f13
	.word 0xf44a800b  ! 489: LDSB_R	ldsb	[%r10 + %r11], %r26
	.word 0xc3ea900b  ! 490: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0xfa8aa690  ! 491: LDUBA_I	lduba	[%r10, + 0x0690] %asi, %r29
	.word 0x8143c000  ! 493: STBAR	stbar
	.word 0xcfe2900b  ! 494: CASA_I	casa	[%r10] 0x80, %r11, %r7
	.word 0x91da800b  ! 495: FLUSH_R	dis not found

	.word 0xdc5aafe0  ! 498: LDX_I	ldx	[%r10 + 0x0fe0], %r14
	.word 0xdf22afe8  ! 499: STF_I	st	%f15, [0x0fe8, %r10]
	.word 0x8143c000  ! 500: STBAR	stbar
	.word 0xc47a800b  ! 501: SWAP_R	swap	%r2, [%r10 + %r11]
	.word 0xccb2a67c  ! 502: STHA_I	stha	%r6, [%r10 + 0x067c] %asi
	.word 0x9da288ab  ! 503: FSUBs	fsubs	%f10, %f11, %f14
	.word 0xf4ca900b  ! 504: LDSBA_R	ldsba	[%r10, %r11] 0x80, %r26
	.word 0xc01aa2b8  ! 505: LDD_I	ldd	[%r10 + 0x02b8], %r0
	.word 0xe892ab30  ! 506: LDUHA_I	lduha	[%r10, + 0x0b30] %asi, %r20
	.word 0x24c20001  ! 507: BRLEZ	brlez,a,nt	%8,<label_0x20001>
	.word 0xc6faab8c  ! 508: SWAPA_I	swapa	%r3, [%r10 + 0x0b8c] %asi
	.word 0xc53a800b  ! 509: STDF_R	std	%f2, [%r11, %r10]
	.word 0xca42a818  ! 510: LDSW_I	ldsw	[%r10 + 0x0818], %r5
	.word 0x8143e02a  ! 511: MEMBAR	membar	#StoreLoad | #StoreStore | #MemIssue 
	.word 0xd26a800b  ! 512: LDSTUB_R	ldstub	%r9, [%r10 + %r11]
	.word 0x8d22ad6c  ! 513: MULScc_I	mulscc 	%r10, 0x0d6c, %r6
	.word 0xd9e2a00b  ! 514: CASA_R	casa	[%r10] %asi, %r11, %r12
	.word 0xc812ae08  ! 515: LDUH_I	lduh	[%r10 + 0x0e08], %r4
	.word 0x8143c000  ! 516: STBAR	stbar
	stxa	%r28, [%r10 + 0x0cc0] %asi	
	.word 0xd0aaade4  ! 518: STBA_I	stba	%r8, [%r10 + 0x0de4] %asi
	.word 0xce92aa6c  ! 519: LDUHA_I	lduha	[%r10, + 0x0a6c] %asi, %r7
	.word 0x8cda800b  ! 520: SMULcc_R	smulcc 	%r10, %r11, %r6
	.word 0xd0ca900b  ! 521: LDSBA_R	ldsba	[%r10, %r11] 0x80, %r8
	.word 0xc4aaa5d4  ! 522: STBA_I	stba	%r2, [%r10 + 0x05d4] %asi
	.word 0x86d2a5e0  ! 523: UMULcc_I	umulcc 	%r10, 0x05e0, %r3
	.word 0xc682a994  ! 524: LDUWA_I	lduwa	[%r10, + 0x0994] %asi, %r3
	.word 0x86d2ad78  ! 525: UMULcc_I	umulcc 	%r10, 0x0d78, %r3
	.word 0x8143e024  ! 526: MEMBAR	membar	#LoadStore | #MemIssue 
	.word 0x10800001  ! 527: BA	ba  	<label_0x1>
	.word 0xae5a800b  ! 528: SMUL_R	smul 	%r10, %r11, %r23
	.word 0xceeaa354  ! 529: LDSTUBA_I	ldstuba	%r7, [%r10 + 0x0354] %asi
	.word 0x8bda800b  ! 530: FLUSH_R	dis not found

	.word 0xf47aaa4c  ! 531: SWAP_I	swap	%r26, [%r10 + 0x0a4c]
	.word 0xc8eaa8fc  ! 532: LDSTUBA_I	ldstuba	%r4, [%r10 + 0x08fc] %asi
	.word 0x00800003  ! 533: BN	bn  	<label_0x3>
	.word 0xc8f2900b  ! 534: STXA_R	stxa	%r4, [%r10 + %r11] 0x80
	.word 0xc3eaaccc  ! 535: PREFETCHA_I	prefetcha	[%r10, + 0x0ccc] %asi, #one_read
	.word 0x916a800b  ! 537: SDIVX_R	sdivx	%r10, %r11, %r8
	.word 0xc4b2ad54  ! 538: STHA_I	stha	%r2, [%r10 + 0x0d54] %asi
	.word 0xc282900b  ! 539: LDUWA_R	lduwa	[%r10, %r11] 0x80, %r1
	.word 0xcef2a2f0  ! 540: STXA_I	stxa	%r7, [%r10 + 0x02f0] %asi
	.word 0x8fdaacec  ! 541: FLUSH_I	dis not found

	.word 0x89a288ab  ! 542: FSUBs	fsubs	%f10, %f11, %f4
	.word 0xd09aac30  ! 543: LDDA_I	ldda	[%r10, + 0x0c30] %asi, %r8
	.word 0xdc6a800b  ! 545: LDSTUB_R	ldstub	%r14, [%r10 + %r11]
	.word 0xd24aafc4  ! 546: LDSB_I	ldsb	[%r10 + 0x0fc4], %r9
	.word 0xc322a86c  ! 547: STF_I	st	%f1, [0x086c, %r10]
	.word 0x88d2a388  ! 548: UMULcc_I	umulcc 	%r10, 0x0388, %r4
	.word 0x85daa6f0  ! 549: FLUSH_I	dis not found

	.word 0xd0c2900b  ! 550: LDSWA_R	ldswa	[%r10, %r11] 0x80, %r8
	.word 0x0cca0003  ! 551: BRGZ	brgz  ,pt	%8,<label_0xa0003>
	.word 0x8ad2800b  ! 552: UMULcc_R	umulcc 	%r10, %r11, %r5
	.word 0x36800001  ! 553: BGE	bge,a	<label_0x1>
	.word 0x00800001  ! 554: BN	bn  	<label_0x1>
	.word 0xeeea900b  ! 555: LDSTUBA_R	ldstuba	%r23, [%r10 + %r11] 0x80
	.word 0x9c72800b  ! 556: UDIV_R	udiv 	%r10, %r11, %r14
	.word 0xf7e2a00b  ! 557: CASA_R	casa	[%r10] %asi, %r11, %r27
	.word 0xe6a2ad60  ! 558: STWA_I	stwa	%r19, [%r10 + 0x0d60] %asi
	.word 0xc2caa960  ! 559: LDSBA_I	ldsba	[%r10, + 0x0960] %asi, %r1
	.word 0x9122800b  ! 560: MULScc_R	mulscc 	%r10, %r11, %r8
	.word 0xc3eaab70  ! 561: PREFETCHA_I	prefetcha	[%r10, + 0x0b70] %asi, #one_read
	.word 0x83da800b  ! 562: FLUSH_R	dis not found

	.word 0xd922800b  ! 563: STF_R	st	%f12, [%r11, %r10]
	.word 0xc46aa5ac  ! 564: LDSTUB_I	ldstub	%r2, [%r10 + 0x05ac]
	.word 0xce82ad80  ! 565: LDUWA_I	lduwa	[%r10, + 0x0d80] %asi, %r7
	.word 0xc882ae34  ! 566: LDUWA_I	lduwa	[%r10, + 0x0e34] %asi, %r4
	.word 0x8143c000  ! 567: STBAR	stbar
	.word 0xc4caa7ec  ! 568: LDSBA_I	ldsba	[%r10, + 0x07ec] %asi, %r2
	.word 0xccf2a278  ! 569: STXA_I	stxa	%r6, [%r10 + 0x0278] %asi
	.word 0xc652a1b4  ! 570: LDSH_I	ldsh	[%r10 + 0x01b4], %r3
	.word 0x82faaefc  ! 571: SDIVcc_I	sdivcc 	%r10, 0x0efc, %r1
	.word 0x88da800b  ! 572: SMULcc_R	smulcc 	%r10, %r11, %r4
	.word 0x89daa0c8  ! 573: FLUSH_I	dis not found

	.word 0xd292a21c  ! 574: LDUHA_I	lduha	[%r10, + 0x021c] %asi, %r9
	.word 0xd09aaba8  ! 575: LDDA_I	ldda	[%r10, + 0x0ba8] %asi, %r8
	.word 0xf0fa900b  ! 576: SWAPA_R	swapa	%r24, [%r10 + %r11] 0x80
	.word 0x84d2a1a0  ! 577: UMULcc_I	umulcc 	%r10, 0x01a0, %r2
	.word 0xd00a800b  ! 578: LDUB_R	ldub	[%r10 + %r11], %r8
	.word 0xc8c2a2d8  ! 579: LDSWA_I	ldswa	[%r10, + 0x02d8] %asi, %r4
	.word 0xaefa800b  ! 580: SDIVcc_R	sdivcc 	%r10, %r11, %r23
	.word 0x89a2882b  ! 581: FADDs	fadds	%f10, %f11, %f4
	.word 0xe0b2900b  ! 582: STHA_R	stha	%r16, [%r10 + %r11] 0x80
	.word 0x8143e069  ! 583: MEMBAR	membar	#LoadLoad | #StoreStore | #MemIssue | #Sync 
	.word 0x885a800b  ! 584: SMUL_R	smul 	%r10, %r11, %r4
	.word 0x99a289ab  ! 585: FDIVs	fdivs	%f10, %f11, %f12
	.word 0x8322800b  ! 586: MULScc_R	mulscc 	%r10, %r11, %r1
	.word 0xc73a800b  ! 587: STDF_R	std	%f3, [%r11, %r10]
	.word 0x90d2800b  ! 588: UMULcc_R	umulcc 	%r10, %r11, %r8
	.word 0xccea900b  ! 589: LDSTUBA_R	ldstuba	%r6, [%r10 + %r11] 0x80
	.word 0xcab2900b  ! 590: STHA_R	stha	%r5, [%r10 + %r11] 0x80
	.word 0xce7aa774  ! 591: SWAP_I	swap	%r7, [%r10 + 0x0774]
	.word 0x8fa2882b  ! 592: FADDs	fadds	%f10, %f11, %f7
	.word 0xccc2a934  ! 593: LDSWA_I	ldswa	[%r10, + 0x0934] %asi, %r6
	.word 0xd882900b  ! 594: LDUWA_R	lduwa	[%r10, %r11] 0x80, %r12
	.word 0x8c7a800b  ! 595: SDIV_R	sdiv 	%r10, %r11, %r6
	.word 0x0aca0001  ! 596: BRNZ	brnz  ,pt	%8,<label_0xa0001>
	.word 0x3a800003  ! 597: BCC	bcc,a	<label_0x3>
	.word 0xc36a800b  ! 598: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x8143c000  ! 599: STBAR	stbar
	.word 0xd04a800b  ! 601: LDSB_R	ldsb	[%r10 + %r11], %r8
	.word 0x8143c000  ! 602: STBAR	stbar
	stxa	%r0, [%r10 + %r11] 0x80	
	.word 0x20800001  ! 605: BN	bn,a	<label_0x1>
	.word 0xa46aa85c  ! 606: UDIVX_I	udivx 	%r10, 0x085c, %r18
	.word 0x82d2a730  ! 607: UMULcc_I	umulcc 	%r10, 0x0730, %r1
	.word 0x8143c000  ! 609: STBAR	stbar
	.word 0xc28aaf5c  ! 610: LDUBA_I	lduba	[%r10, + 0x0f5c] %asi, %r1
	.word 0xcb3a800b  ! 611: STDF_R	std	%f5, [%r11, %r10]
	.word 0x84faa874  ! 612: SDIVcc_I	sdivcc 	%r10, 0x0874, %r2
	.word 0x87daa564  ! 613: FLUSH_I	dis not found

	.word 0xc46aa91c  ! 614: LDSTUB_I	ldstub	%r2, [%r10 + 0x091c]
	.word 0xa3a289ab  ! 615: FDIVs	fdivs	%f10, %f11, %f17
	.word 0xcd22a8b0  ! 616: STF_I	st	%f6, [0x08b0, %r10]
	.word 0xf8c2a29c  ! 617: LDSWA_I	ldswa	[%r10, + 0x029c] %asi, %r28
	.word 0xae72a658  ! 618: UDIV_I	udiv 	%r10, 0x0658, %r23
	.word 0x8143e03e  ! 619: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0x2eca0003  ! 620: BRGEZ	brgez,a,pt	%8,<label_0xa0003>
	.word 0xd252a8f0  ! 621: LDSH_I	ldsh	[%r10 + 0x08f0], %r9
	.word 0x82faa0dc  ! 622: SDIVcc_I	sdivcc 	%r10, 0x00dc, %r1
	.word 0xc3ea900b  ! 623: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0xc6ea900b  ! 624: LDSTUBA_R	ldstuba	%r3, [%r10 + %r11] 0x80
	.word 0x8872800b  ! 625: UDIV_R	udiv 	%r10, %r11, %r4
	.word 0xdde2a00b  ! 626: CASA_R	casa	[%r10] %asi, %r11, %r14
	.word 0x8272ad9c  ! 627: UDIV_I	udiv 	%r10, 0x0d9c, %r1
	.word 0xd0a2a9a0  ! 628: STWA_I	stwa	%r8, [%r10 + 0x09a0] %asi
	.word 0x04800001  ! 629: BLE	ble  	<label_0x1>
	.word 0x91daaab8  ! 631: FLUSH_I	dis not found

	.word 0x87a2882b  ! 632: FADDs	fadds	%f10, %f11, %f3
	.word 0xc212800b  ! 633: LDUH_R	lduh	[%r10 + %r11], %r1
	stxa	%r14, [%r10 + 0x0760] %asi	
	.word 0xd05aa118  ! 635: LDX_I	ldx	[%r10 + 0x0118], %r8
	.word 0x8fda800b  ! 636: FLUSH_R	dis not found

	.word 0xc3ea900b  ! 637: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0xd0da900b  ! 638: LDXA_R	ldxa	[%r10, %r11] 0x80, %r8
	.word 0xabdaabd4  ! 639: FLUSH_I	dis not found

	.word 0x14800001  ! 640: BG	bg  	<label_0x1>
	.word 0xf04a800b  ! 641: LDSB_R	ldsb	[%r10 + %r11], %r24
	.word 0x8143e053  ! 642: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside | #Sync 
	.word 0xcd3a800b  ! 643: STDF_R	std	%f6, [%r11, %r10]
	.word 0xea5aaaa8  ! 644: LDX_I	ldx	[%r10 + 0x0aa8], %r21
	.word 0xf7e2a00b  ! 645: CASA_R	casa	[%r10] %asi, %r11, %r27
	.word 0x04800003  ! 646: BLE	ble  	<label_0x3>
	.word 0xca8a900b  ! 647: LDUBA_R	lduba	[%r10, %r11] 0x80, %r5
	.word 0xcab2900b  ! 648: STHA_R	stha	%r5, [%r10 + %r11] 0x80
	.word 0xc24aa490  ! 649: LDSB_I	ldsb	[%r10 + 0x0490], %r1
	.word 0x86f2800b  ! 650: UDIVcc_R	udivcc 	%r10, %r11, %r3
	.word 0xc93a800b  ! 651: STDF_R	std	%f4, [%r11, %r10]
	.word 0x8143e04c  ! 652: MEMBAR	membar	#LoadStore | #StoreStore | #Sync 
	.word 0xdab2ae00  ! 653: STHA_I	stha	%r13, [%r10 + 0x0e00] %asi
	.word 0xcefaa814  ! 654: SWAPA_I	swapa	%r7, [%r10 + 0x0814] %asi
	.word 0x8143c000  ! 655: STBAR	stbar
	.word 0xec82a0e8  ! 656: LDUWA_I	lduwa	[%r10, + 0x00e8] %asi, %r22
	.word 0xca4aa0bc  ! 657: LDSB_I	ldsb	[%r10 + 0x00bc], %r5
	.word 0xcc92900b  ! 658: LDUHA_R	lduha	[%r10, %r11] 0x80, %r6
	.word 0x8143c000  ! 659: STBAR	stbar
	.word 0x87a2882b  ! 660: FADDs	fadds	%f10, %f11, %f3
	.word 0x26ca0001  ! 661: BRLZ	brlz,a,pt	%8,<label_0xa0001>
	.word 0x92f2800b  ! 662: UDIVcc_R	udivcc 	%r10, %r11, %r9
	.word 0x2cc20001  ! 663: BRGZ	brgz,a,nt	%8,<label_0x20001>
	.word 0x26c20001  ! 664: BRLZ	brlz,a,nt	%8,<label_0x20001>
	.word 0xbba2882b  ! 665: FADDs	fadds	%f10, %f11, %f29
	.word 0x30800003  ! 666: BA	ba,a	<label_0x3>
	.word 0x8bda800b  ! 667: FLUSH_R	dis not found

	.word 0xce42ae70  ! 668: LDSW_I	ldsw	[%r10 + 0x0e70], %r7
	.word 0x8ba2882b  ! 669: FADDs	fadds	%f10, %f11, %f5
	.word 0xf3f2a00b  ! 670: CASXA_R	casxa	[%r10]%asi, %r11, %r25
	.word 0xf6b2900b  ! 671: STHA_R	stha	%r27, [%r10 + %r11] 0x80
	.word 0xc36a800b  ! 672: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0xb9daaa38  ! 673: FLUSH_I	dis not found

	.word 0xcc42a62c  ! 674: LDSW_I	ldsw	[%r10 + 0x062c], %r6
	.word 0xa5daa64c  ! 675: FLUSH_I	dis not found

	.word 0x8272a5f8  ! 676: UDIV_I	udiv 	%r10, 0x05f8, %r1
	.word 0x8143e042  ! 677: MEMBAR	membar	#StoreLoad | #Sync 
	.word 0xc27aa618  ! 679: SWAP_I	swap	%r1, [%r10 + 0x0618]
	.word 0x1a800003  ! 680: BCC	bcc  	<label_0x3>
	.word 0xc602800b  ! 681: LDUW_R	lduw	[%r10 + %r11], %r3
	.word 0xb65a800b  ! 682: SMUL_R	smul 	%r10, %r11, %r27
	.word 0xccca900b  ! 683: LDSBA_R	ldsba	[%r10, %r11] 0x80, %r6
	.word 0xc5e2a00b  ! 684: CASA_R	casa	[%r10] %asi, %r11, %r2
	.word 0x8143e023  ! 685: MEMBAR	membar	#LoadLoad | #StoreLoad | #MemIssue 
	.word 0x02800001  ! 686: BE	be  	<label_0x1>
	.word 0x856a800b  ! 687: SDIVX_R	sdivx	%r10, %r11, %r2
	.word 0xb84aaf3c  ! 688: MULX_I	mulx 	%r10, 0x0f3c, %r28
	.word 0x30800003  ! 689: BA	ba,a	<label_0x3>
	.word 0xc09aaee0  ! 690: LDDA_I	ldda	[%r10, + 0x0ee0] %asi, %r0
	.word 0xc492a0c0  ! 691: LDUHA_I	lduha	[%r10, + 0x00c0] %asi, %r2
	.word 0xce42a094  ! 692: LDSW_I	ldsw	[%r10 + 0x0094], %r7
	.word 0xd9e2900b  ! 693: CASA_I	casa	[%r10] 0x80, %r11, %r12
	.word 0xb5daab24  ! 694: FLUSH_I	dis not found

	.word 0x8922800b  ! 695: MULScc_R	mulscc 	%r10, %r11, %r4
	.word 0xe492900b  ! 696: LDUHA_R	lduha	[%r10, %r11] 0x80, %r18
	.word 0xcb3aae00  ! 697: STDF_I	std	%f5, [0x0e00, %r10]
	.word 0xfa12800b  ! 698: LDUH_R	lduh	[%r10 + %r11], %r29
	.word 0x9272800b  ! 699: UDIV_R	udiv 	%r10, %r11, %r9
	.word 0x90f2abcc  ! 700: UDIVcc_I	udivcc 	%r10, 0x0bcc, %r8
	.word 0xcab2900b  ! 701: STHA_R	stha	%r5, [%r10 + %r11] 0x80
	.word 0xc36a800b  ! 702: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x04800003  ! 703: BLE	ble  	<label_0x3>
	.word 0x8143e00f  ! 704: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore 
	.word 0xcaea900b  ! 706: LDSTUBA_R	ldstuba	%r5, [%r10 + %r11] 0x80
	.word 0xb1da800b  ! 707: FLUSH_R	dis not found

	.word 0xf8f2a940  ! 708: STXA_I	stxa	%r28, [%r10 + 0x0940] %asi
	.word 0xd292a388  ! 709: LDUHA_I	lduha	[%r10, + 0x0388] %asi, %r9
	.word 0x85da800b  ! 710: FLUSH_R	dis not found

	.word 0x00800003  ! 711: BN	bn  	<label_0x3>
	.word 0x8143e023  ! 712: MEMBAR	membar	#LoadLoad | #StoreLoad | #MemIssue 
	.word 0x8143c000  ! 713: STBAR	stbar
	.word 0xc522800b  ! 714: STF_R	st	%f2, [%r11, %r10]
	.word 0xf802a0ac  ! 715: LDUW_I	lduw	[%r10 + 0x00ac], %r28
	.word 0xc36aa228  ! 716: PREFETCH_I	prefetch	[%r10 + 0x0228], #one_read
	.word 0xc53a800b  ! 717: STDF_R	std	%f2, [%r11, %r10]
	.word 0xc2eaa578  ! 718: LDSTUBA_I	ldstuba	%r1, [%r10 + 0x0578] %asi
	.word 0x9252800b  ! 719: UMUL_R	umul 	%r10, %r11, %r9
	.word 0xc6fa900b  ! 720: SWAPA_R	swapa	%r3, [%r10 + %r11] 0x80
	.word 0xfa02800b  ! 722: LDUW_R	lduw	[%r10 + %r11], %r29
	.word 0x8afa800b  ! 723: SDIVcc_R	sdivcc 	%r10, %r11, %r5
	.word 0x8a6aa570  ! 724: UDIVX_I	udivx 	%r10, 0x0570, %r5
	.word 0xf6f2900b  ! 725: STXA_R	stxa	%r27, [%r10 + %r11] 0x80
	.word 0x91daa8a4  ! 726: FLUSH_I	dis not found

	.word 0xb8faaa54  ! 727: SDIVcc_I	sdivcc 	%r10, 0x0a54, %r28
	.word 0x8e5aac70  ! 728: SMUL_I	smul 	%r10, 0x0c70, %r7
	.word 0xdcda900b  ! 729: LDXA_R	ldxa	[%r10, %r11] 0x80, %r14
	.word 0x04800001  ! 730: BLE	ble  	<label_0x1>
	.word 0xc7e2a00b  ! 731: CASA_R	casa	[%r10] %asi, %r11, %r3
	.word 0x88da800b  ! 732: SMULcc_R	smulcc 	%r10, %r11, %r4
	.word 0xc73a800b  ! 733: STDF_R	std	%f3, [%r11, %r10]
	.word 0x8143c000  ! 734: STBAR	stbar
	.word 0xc3eaaf64  ! 735: PREFETCHA_I	prefetcha	[%r10, + 0x0f64] %asi, #one_read
	.word 0x8fa2892b  ! 736: FMULs	fmuls	%f10, %f11, %f7
	.word 0xcaeaa504  ! 737: LDSTUBA_I	ldstuba	%r5, [%r10 + 0x0504] %asi
	.word 0xc4aa900b  ! 738: STBA_R	stba	%r2, [%r10 + %r11] 0x80
	.word 0x83daaf34  ! 739: FLUSH_I	dis not found

	.word 0xe0d2900b  ! 740: LDSHA_R	ldsha	[%r10, %r11] 0x80, %r16
	.word 0x82d2a0ec  ! 742: UMULcc_I	umulcc 	%r10, 0x00ec, %r1
	.word 0x8e7a800b  ! 743: SDIV_R	sdiv 	%r10, %r11, %r7
	.word 0xd8aa900b  ! 744: STBA_R	stba	%r12, [%r10 + %r11] 0x80
	.word 0x985a800b  ! 745: SMUL_R	smul 	%r10, %r11, %r12
	.word 0x85da800b  ! 746: FLUSH_R	dis not found

	.word 0x8143e06f  ! 747: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #MemIssue | #Sync 
	.word 0x9c5aaae8  ! 748: SMUL_I	smul 	%r10, 0x0ae8, %r14
	.word 0xc5e2900b  ! 749: CASA_I	casa	[%r10] 0x80, %r11, %r2
	.word 0xc73aab88  ! 750: STDF_I	std	%f3, [0x0b88, %r10]
	.word 0x90da800b  ! 751: SMULcc_R	smulcc 	%r10, %r11, %r8
	.word 0x827aa2f8  ! 752: SDIV_I	sdiv 	%r10, 0x02f8, %r1
	.word 0x85a2892b  ! 753: FMULs	fmuls	%f10, %f11, %f2
	.word 0x83daa400  ! 754: FLUSH_I	dis not found

	.word 0x87a2882b  ! 755: FADDs	fadds	%f10, %f11, %f3
	.word 0x34800003  ! 756: BG	bg,a	<label_0x3>
	.word 0x8143e003  ! 757: MEMBAR	membar	#LoadLoad | #StoreLoad 
	.word 0xc53aac58  ! 758: STDF_I	std	%f2, [0x0c58, %r10]
	.word 0x8e5aac30  ! 759: SMUL_I	smul 	%r10, 0x0c30, %r7
	.word 0x8143c000  ! 760: STBAR	stbar
	.word 0x8143c000  ! 761: STBAR	stbar
	.word 0xc202800b  ! 762: LDUW_R	lduw	[%r10 + %r11], %r1
	.word 0xb652800b  ! 763: UMUL_R	umul 	%r10, %r11, %r27
	.word 0xcde2900b  ! 764: CASA_I	casa	[%r10] 0x80, %r11, %r6
	.word 0x22800001  ! 765: BE	be,a	<label_0x1>
	.word 0x88faa7ac  ! 766: SDIVcc_I	sdivcc 	%r10, 0x07ac, %r4
	.word 0xc3eaadec  ! 767: PREFETCHA_I	prefetcha	[%r10, + 0x0dec] %asi, #one_read
	.word 0xa5daa050  ! 768: FLUSH_I	dis not found

	.word 0x22800003  ! 769: BE	be,a	<label_0x3>
	.word 0x8143c000  ! 770: STBAR	stbar
	stxa	%r8, [%r10 + %r11] 0x80	
	.word 0xd322ad54  ! 772: STF_I	st	%f9, [0x0d54, %r10]
	.word 0x8143e06c  ! 773: MEMBAR	membar	#LoadStore | #StoreStore | #MemIssue | #Sync 
	.word 0xc5f2900b  ! 774: CASXA_I	casxa	[%r10] 0x80, %r11, %r2
	.word 0xe49aab28  ! 775: LDDA_I	ldda	[%r10, + 0x0b28] %asi, %r18
	.word 0xb7daac00  ! 776: FLUSH_I	dis not found

	.word 0xc6a2900b  ! 777: STWA_R	stwa	%r3, [%r10 + %r11] 0x80
	.word 0xe0c2900b  ! 778: LDSWA_R	ldswa	[%r10, %r11] 0x80, %r16
	.word 0xd33aa7c8  ! 779: STDF_I	std	%f9, [0x07c8, %r10]
	.word 0xc3eaae44  ! 780: PREFETCHA_I	prefetcha	[%r10, + 0x0e44] %asi, #one_read
	.word 0xcdf2900b  ! 781: CASXA_I	casxa	[%r10] 0x80, %r11, %r6
	.word 0xafa289ab  ! 782: FDIVs	fdivs	%f10, %f11, %f23
	.word 0x14800003  ! 783: BG	bg  	<label_0x3>
	.word 0xa9a289ab  ! 784: FDIVs	fdivs	%f10, %f11, %f20
	.word 0xaa7a800b  ! 785: SDIV_R	sdiv 	%r10, %r11, %r21
	.word 0x824a800b  ! 787: MULX_R	mulx 	%r10, %r11, %r1
	.word 0x8143c000  ! 788: STBAR	stbar
	.word 0xcaa2a1c8  ! 789: STWA_I	stwa	%r5, [%r10 + 0x01c8] %asi
	.word 0xc88aa9fc  ! 790: LDUBA_I	lduba	[%r10, + 0x09fc] %asi, %r4
	.word 0xced2900b  ! 791: LDSHA_R	ldsha	[%r10, %r11] 0x80, %r7
	.word 0x02800001  ! 792: BE	be  	<label_0x1>
	.word 0x8143e064  ! 793: MEMBAR	membar	#LoadStore | #MemIssue | #Sync 
	.word 0xc2a2a584  ! 794: STWA_I	stwa	%r1, [%r10 + 0x0584] %asi
	.word 0x02ca0001  ! 795: BRZ	brz  ,pt	%8,<label_0xa0001>
	.word 0xb1a2892b  ! 796: FMULs	fmuls	%f10, %f11, %f24
	.word 0xa0d2800b  ! 797: UMULcc_R	umulcc 	%r10, %r11, %r16
	.word 0xc36a800b  ! 798: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x1e800001  ! 799: BVC	bvc  	<label_0x1>
	.word 0x84da800b  ! 800: SMULcc_R	smulcc 	%r10, %r11, %r2
	.word 0xa9da800b  ! 801: FLUSH_R	dis not found

	.word 0xc5e2a00b  ! 802: CASA_R	casa	[%r10] %asi, %r11, %r2
	.word 0x38800001  ! 803: BGU	bgu,a	<label_0x1>
	.word 0xfcdaa198  ! 804: LDXA_I	ldxa	[%r10, + 0x0198] %asi, %r30
	.word 0xb1da800b  ! 805: FLUSH_R	dis not found

	.word 0x8143c000  ! 806: STBAR	stbar
	.word 0x826a800b  ! 807: UDIVX_R	udivx 	%r10, %r11, %r1
	.word 0xd0b2900b  ! 808: STHA_R	stha	%r8, [%r10 + %r11] 0x80
	.word 0xca7aadfc  ! 809: SWAP_I	swap	%r5, [%r10 + 0x0dfc]
	.word 0xdcea900b  ! 810: LDSTUBA_R	ldstuba	%r14, [%r10 + %r11] 0x80
	.word 0x87da800b  ! 811: FLUSH_R	dis not found

	.word 0xea52800b  ! 812: LDSH_R	ldsh	[%r10 + %r11], %r21
	.word 0xcc02800b  ! 813: LDUW_R	lduw	[%r10 + %r11], %r6
	.word 0xa9daaa48  ! 814: FLUSH_I	dis not found

	.word 0x2ac20001  ! 815: BRNZ	brnz,a,nt	%8,<label_0x20001>
	.word 0xaada800b  ! 816: SMULcc_R	smulcc 	%r10, %r11, %r21
	.word 0xc49a900b  ! 817: LDDA_R	ldda	[%r10, %r11] 0x80, %r2
	.word 0xd1e2a00b  ! 818: CASA_R	casa	[%r10] %asi, %r11, %r8
	.word 0x8fda800b  ! 819: FLUSH_R	dis not found

	.word 0xc3ea900b  ! 820: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0x90f2ac7c  ! 821: UDIVcc_I	udivcc 	%r10, 0x0c7c, %r8
	.word 0x864aab60  ! 822: MULX_I	mulx 	%r10, 0x0b60, %r3
	.word 0x83da800b  ! 823: FLUSH_R	dis not found

	.word 0xca42a16c  ! 824: LDSW_I	ldsw	[%r10 + 0x016c], %r5
	.word 0xcc02af60  ! 825: LDUW_I	lduw	[%r10 + 0x0f60], %r6
	.word 0xcbf2900b  ! 826: CASXA_I	casxa	[%r10] 0x80, %r11, %r5
	.word 0x8143e02e  ! 827: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #MemIssue 
	.word 0x845aa4b4  ! 828: SMUL_I	smul 	%r10, 0x04b4, %r2
	.word 0xceb2900b  ! 829: STHA_R	stha	%r7, [%r10 + %r11] 0x80
	.word 0xac5aa028  ! 830: SMUL_I	smul 	%r10, 0x0028, %r22
	.word 0x8143c000  ! 831: STBAR	stbar
	stxa	%r4, [%r10 + %r11] 0x80	
	.word 0x83daaa74  ! 833: FLUSH_I	dis not found

	.word 0x0e800001  ! 834: BVS	bvs  	<label_0x1>
	.word 0x8143c000  ! 835: STBAR	stbar
	.word 0xdeb2a3c0  ! 836: STHA_I	stha	%r15, [%r10 + 0x03c0] %asi
	.word 0x925a800b  ! 837: SMUL_R	smul 	%r10, %r11, %r9
	.word 0xf682ad04  ! 838: LDUWA_I	lduwa	[%r10, + 0x0d04] %asi, %r27
	.word 0x8da2892b  ! 839: FMULs	fmuls	%f10, %f11, %f6
	.word 0xb9a2892b  ! 840: FMULs	fmuls	%f10, %f11, %f28
	.word 0xe692a774  ! 841: LDUHA_I	lduha	[%r10, + 0x0774] %asi, %r19
	.word 0x90d2800b  ! 842: UMULcc_R	umulcc 	%r10, %r11, %r8
	.word 0xcc12ad48  ! 843: LDUH_I	lduh	[%r10 + 0x0d48], %r6
	.word 0xb25aa7f4  ! 844: SMUL_I	smul 	%r10, 0x07f4, %r25
	.word 0xc28a900b  ! 845: LDUBA_R	lduba	[%r10, %r11] 0x80, %r1
	.word 0xc44aaa4c  ! 846: LDSB_I	ldsb	[%r10 + 0x0a4c], %r2
	.word 0x8cdaacfc  ! 847: SMULcc_I	smulcc 	%r10, 0x0cfc, %r6
	.word 0xc3eaa39c  ! 848: PREFETCHA_I	prefetcha	[%r10, + 0x039c] %asi, #one_read
	.word 0x8fdaae74  ! 849: FLUSH_I	dis not found

	.word 0xc73a800b  ! 850: STDF_R	std	%f3, [%r11, %r10]
	.word 0x18800003  ! 851: BGU	bgu  	<label_0x3>
	.word 0x8852800b  ! 853: UMUL_R	umul 	%r10, %r11, %r4
	.word 0x866aafa0  ! 854: UDIVX_I	udivx 	%r10, 0x0fa0, %r3
	.word 0x82f2800b  ! 855: UDIVcc_R	udivcc 	%r10, %r11, %r1
	.word 0xc8c2900b  ! 856: LDSWA_R	ldswa	[%r10, %r11] 0x80, %r4
	.word 0x8bdaad7c  ! 857: FLUSH_I	dis not found

	.word 0x8bdaa874  ! 858: FLUSH_I	dis not found

	stxa	%r22, [%r10 + 0x0de0] %asi	
	.word 0x04c20001  ! 860: BRLEZ	brlez  ,nt	%8,<label_0x20001>
	.word 0xa1a2892b  ! 861: FMULs	fmuls	%f10, %f11, %f16
	.word 0x84f2a0fc  ! 862: UDIVcc_I	udivcc 	%r10, 0x00fc, %r2
	.word 0xc86a800b  ! 863: LDSTUB_R	ldstub	%r4, [%r10 + %r11]
	.word 0xcc6aa5ec  ! 864: LDSTUB_I	ldstub	%r6, [%r10 + 0x05ec]
	.word 0xccb2900b  ! 865: STHA_R	stha	%r6, [%r10 + %r11] 0x80
	.word 0xc2d2a90c  ! 866: LDSHA_I	ldsha	[%r10, + 0x090c] %asi, %r1
	.word 0x1a800001  ! 867: BCC	bcc  	<label_0x1>
	.word 0x8143c000  ! 868: STBAR	stbar
	.word 0x90fa800b  ! 869: SDIVcc_R	sdivcc 	%r10, %r11, %r8
	.word 0xc2a2aeac  ! 870: STWA_I	stwa	%r1, [%r10 + 0x0eac] %asi
	.word 0xc53aa0c0  ! 871: STDF_I	std	%f2, [0x00c0, %r10]
	.word 0x8143e07b  ! 872: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0x8c72ae74  ! 873: UDIV_I	udiv 	%r10, 0x0e74, %r6
	.word 0x8143c000  ! 874: STBAR	stbar
	.word 0xccf2a0f8  ! 875: STXA_I	stxa	%r6, [%r10 + 0x00f8] %asi
	.word 0xfada900b  ! 876: LDXA_R	ldxa	[%r10, %r11] 0x80, %r29
	.word 0xd04a800b  ! 877: LDSB_R	ldsb	[%r10 + %r11], %r8
	.word 0xc36aaeb8  ! 878: PREFETCH_I	prefetch	[%r10 + 0x0eb8], #one_read
	.word 0xc612a330  ! 879: LDUH_I	lduh	[%r10 + 0x0330], %r3
	.word 0xba5a800b  ! 880: SMUL_R	smul 	%r10, %r11, %r29
	.word 0x8143c000  ! 881: STBAR	stbar
	.word 0x8fda800b  ! 882: FLUSH_R	dis not found

	.word 0x8ad2800b  ! 884: UMULcc_R	umulcc 	%r10, %r11, %r5
	.word 0xd01a800b  ! 885: LDD_R	ldd	[%r10 + %r11], %r8
	.word 0x9852800b  ! 886: UMUL_R	umul 	%r10, %r11, %r12
	.word 0x92d2800b  ! 887: UMULcc_R	umulcc 	%r10, %r11, %r9
	stxa	%r26, [%r10 + %r11] 0x80	
	.word 0x40000003  ! 890: CALL	call	disp30_3
	.word 0xf202ae78  ! 891: LDUW_I	lduw	[%r10 + 0x0e78], %r25
	.word 0xc36a800b  ! 892: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x83da800b  ! 893: FLUSH_R	dis not found

	.word 0x8e6a800b  ! 895: UDIVX_R	udivx 	%r10, %r11, %r7
	.word 0xce52800b  ! 896: LDSH_R	ldsh	[%r10 + %r11], %r7
	.word 0x8143e020  ! 897: MEMBAR	membar	#MemIssue 
	.word 0x86f2a2c0  ! 898: UDIVcc_I	udivcc 	%r10, 0x02c0, %r3
	.word 0x8143e023  ! 899: MEMBAR	membar	#LoadLoad | #StoreLoad | #MemIssue 
	.word 0xe9f2900b  ! 900: CASXA_I	casxa	[%r10] 0x80, %r11, %r20
	.word 0xfadaa840  ! 901: LDXA_I	ldxa	[%r10, + 0x0840] %asi, %r29
	.word 0x24800001  ! 902: BLE	ble,a	<label_0x1>
	.word 0x8143e01d  ! 903: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside 
	.word 0x0a800001  ! 904: BCS	bcs  	<label_0x1>
	.word 0xc3ea900b  ! 905: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0x86fa800b  ! 906: SDIVcc_R	sdivcc 	%r10, %r11, %r3
	.word 0x24800001  ! 907: BLE	ble,a	<label_0x1>
	.word 0x85a2892b  ! 908: FMULs	fmuls	%f10, %f11, %f2
	.word 0xe40aab28  ! 909: LDUB_I	ldub	[%r10 + 0x0b28], %r18
	.word 0xf0a2900b  ! 910: STWA_R	stwa	%r24, [%r10 + %r11] 0x80
	.word 0xe84a800b  ! 911: LDSB_R	ldsb	[%r10 + %r11], %r20
	.word 0x8143e046  ! 912: MEMBAR	membar	#StoreLoad | #LoadStore | #Sync 
	.word 0xba52800b  ! 913: UMUL_R	umul 	%r10, %r11, %r29
	.word 0x86fa800b  ! 914: SDIVcc_R	sdivcc 	%r10, %r11, %r3
	.word 0x90daa9e8  ! 915: SMULcc_I	smulcc 	%r10, 0x09e8, %r8
	.word 0x8b6a800b  ! 916: SDIVX_R	sdivx	%r10, %r11, %r5
	.word 0x8fa288ab  ! 917: FSUBs	fsubs	%f10, %f11, %f7
	.word 0x89a289ab  ! 918: FDIVs	fdivs	%f10, %f11, %f4
	.word 0xd2aa900b  ! 919: STBA_R	stba	%r9, [%r10 + %r11] 0x80
	.word 0x8852a264  ! 920: UMUL_I	umul 	%r10, 0x0264, %r4
	.word 0x00800001  ! 921: BN	bn  	<label_0x1>
	.word 0x9122adb8  ! 922: MULScc_I	mulscc 	%r10, 0x0db8, %r8
	.word 0x89a2892b  ! 923: FMULs	fmuls	%f10, %f11, %f4
	.word 0xe86aadd0  ! 924: LDSTUB_I	ldstub	%r20, [%r10 + 0x0dd0]
	.word 0xca6aa7d0  ! 925: LDSTUB_I	ldstub	%r5, [%r10 + 0x07d0]
	.word 0x8ddaa974  ! 926: FLUSH_I	dis not found

	.word 0xc852800b  ! 927: LDSH_R	ldsh	[%r10 + %r11], %r4
	.word 0xfe52800b  ! 928: LDSH_R	ldsh	[%r10 + %r11], %r31
	.word 0xd93aa020  ! 929: STDF_I	std	%f12, [0x0020, %r10]
	.word 0x84daa4dc  ! 930: SMULcc_I	smulcc 	%r10, 0x04dc, %r2
	.word 0xc33a800b  ! 931: STDF_R	std	%f1, [%r11, %r10]
	.word 0xa7da800b  ! 932: FLUSH_R	dis not found

	.word 0xc36aa0d4  ! 933: PREFETCH_I	prefetch	[%r10 + 0x00d4], #one_read
	.word 0x8143c000  ! 934: STBAR	stbar
	.word 0x9072a3a8  ! 935: UDIV_I	udiv 	%r10, 0x03a8, %r8
	.word 0x8a7aa9fc  ! 937: SDIV_I	sdiv 	%r10, 0x09fc, %r5
	.word 0xb2f2abc8  ! 938: UDIVcc_I	udivcc 	%r10, 0x0bc8, %r25
	.word 0x825aa77c  ! 939: SMUL_I	smul 	%r10, 0x077c, %r1
	.word 0xcccaafe4  ! 940: LDSBA_I	ldsba	[%r10, + 0x0fe4] %asi, %r6
	.word 0x8afa800b  ! 941: SDIVcc_R	sdivcc 	%r10, %r11, %r5
	.word 0xde92a1f0  ! 942: LDUHA_I	lduha	[%r10, + 0x01f0] %asi, %r15
	.word 0xe89a900b  ! 943: LDDA_R	ldda	[%r10, %r11] 0x80, %r20
	.word 0xce52800b  ! 944: LDSH_R	ldsh	[%r10 + %r11], %r7
	.word 0x89a2892b  ! 945: FMULs	fmuls	%f10, %f11, %f4
	.word 0xc6b2900b  ! 946: STHA_R	stha	%r3, [%r10 + %r11] 0x80
	.word 0x8ddaabe4  ! 947: FLUSH_I	dis not found

	.word 0x8143c000  ! 948: STBAR	stbar
	.word 0xc5e2a00b  ! 949: CASA_R	casa	[%r10] %asi, %r11, %r2
	.word 0xc27aa808  ! 950: SWAP_I	swap	%r1, [%r10 + 0x0808]
	.word 0x85a2892b  ! 951: FMULs	fmuls	%f10, %f11, %f2
	.word 0xdab2900b  ! 952: STHA_R	stha	%r13, [%r10 + %r11] 0x80
	.word 0xe53aa8c8  ! 953: STDF_I	std	%f18, [0x08c8, %r10]
	.word 0x8143c000  ! 954: STBAR	stbar
	.word 0xcea2a200  ! 955: STWA_I	stwa	%r7, [%r10 + 0x0200] %asi
	.word 0x85da800b  ! 956: FLUSH_R	dis not found

	.word 0x8143c000  ! 957: STBAR	stbar
	.word 0x24ca0001  ! 958: BRLEZ	brlez,a,pt	%8,<label_0xa0001>
	.word 0xd2f2900b  ! 959: STXA_R	stxa	%r9, [%r10 + %r11] 0x80
	.word 0xbba2882b  ! 960: FADDs	fadds	%f10, %f11, %f29
	.word 0xc53aa3e8  ! 961: STDF_I	std	%f2, [0x03e8, %r10]
	.word 0x8e7a800b  ! 962: SDIV_R	sdiv 	%r10, %r11, %r7
	.word 0x8dda800b  ! 963: FLUSH_R	dis not found

	.word 0x2a800001  ! 964: BCS	bcs,a	<label_0x1>
	.word 0xc36a800b  ! 965: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x8143c000  ! 967: STBAR	stbar
	.word 0x886aacf8  ! 968: UDIVX_I	udivx 	%r10, 0x0cf8, %r4
	.word 0x85daa78c  ! 969: FLUSH_I	dis not found

	.word 0xc6a2900b  ! 970: STWA_R	stwa	%r3, [%r10 + %r11] 0x80
	.word 0xd012a5b8  ! 971: LDUH_I	lduh	[%r10 + 0x05b8], %r8
	.word 0x91da800b  ! 972: FLUSH_R	dis not found

	.word 0x91a289ab  ! 973: FDIVs	fdivs	%f10, %f11, %f8
	.word 0xca7a800b  ! 974: SWAP_R	swap	%r5, [%r10 + %r11]
	.word 0xc45a800b  ! 975: LDX_R	ldx	[%r10 + %r11], %r2
	.word 0x2cca0001  ! 976: BRGZ	brgz,a,pt	%8,<label_0xa0001>
	.word 0xf882ad5c  ! 977: LDUWA_I	lduwa	[%r10, + 0x0d5c] %asi, %r28
	.word 0x40000001  ! 978: CALL	call	disp30_1
	.word 0x1c800001  ! 979: BPOS	bpos  	<label_0x1>
	.word 0xb6f2800b  ! 980: UDIVcc_R	udivcc 	%r10, %r11, %r27
	.word 0x87da800b  ! 981: FLUSH_R	dis not found

	.word 0xef3a800b  ! 982: STDF_R	std	%f23, [%r11, %r10]
	.word 0xf892900b  ! 983: LDUHA_R	lduha	[%r10, %r11] 0x80, %r28
	.word 0x93daaca4  ! 984: FLUSH_I	dis not found

	.word 0x8c6aa49c  ! 985: UDIVX_I	udivx 	%r10, 0x049c, %r6
	.word 0xc36a800b  ! 986: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x8922800b  ! 988: MULScc_R	mulscc 	%r10, %r11, %r4
	.word 0xd05aa400  ! 989: LDX_I	ldx	[%r10 + 0x0400], %r8
	.word 0xf28aa538  ! 990: LDUBA_I	lduba	[%r10, + 0x0538] %asi, %r25
	.word 0xd0c2900b  ! 991: LDSWA_R	ldswa	[%r10, %r11] 0x80, %r8
	.word 0x00800001  ! 993: BN	bn  	<label_0x1>
	.word 0xc93aa7c8  ! 994: STDF_I	std	%f4, [0x07c8, %r10]
	.word 0x36800001  ! 995: BGE	bge,a	<label_0x1>
	.word 0x38800001  ! 996: BGU	bgu,a	<label_0x1>
	.word 0xd0daa8c8  ! 997: LDXA_I	ldxa	[%r10, + 0x08c8] %asi, %r8
	.word 0x83da800b  ! 998: FLUSH_R	dis not found

	.word 0x8143c000  ! 999: STBAR	stbar
	nop
	nop
	nop
        ta      T_GOOD_TRAP
th_main_1:
        setx  MAIN_BASE_DATA_VA, %r1, %r10
        setx  0x0000000000000290, %g1, %r11
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
        setx  0x3fa1e6c020f67124, %g1, %r0
        setx  0xae3bddc5d29895a0, %g1, %r1
        setx  0x23b12a3f9d607eea, %g1, %r2
        setx  0x147f2fe147c11a8c, %g1, %r3
        setx  0x49a4557e697f47ca, %g1, %r4
        setx  0x24f4c625b2269e45, %g1, %r5
        setx  0x078b90d9af3a7c1c, %g1, %r6
        setx  0xb441d5c0980f0bc1, %g1, %r7
        setx  0x5c2b97e5250d3407, %g1, %r8
        setx  0x948dacf8613185a9, %g1, %r9
        setx  0x396150af8a2508e1, %g1, %r12
        setx  0x4fe3ba523dc5d875, %g1, %r13
        setx  0x83879e459e1052c8, %g1, %r14
        setx  0xcdb35554cd7a6e57, %g1, %r15
        setx  0x337eafa6c9cc419f, %g1, %r16
        setx  0xb89c03f451f7e02c, %g1, %r17
        setx  0x67ba8f16c88b268c, %g1, %r18
        setx  0xc302a982c324a898, %g1, %r19
        setx  0x30714602c0e3fd80, %g1, %r20
        setx  0xe97298a6d00c7029, %g1, %r21
        setx  0xbbe0fa900b0e5e5d, %g1, %r22
        setx  0x0060ae742193817c, %g1, %r23
        setx  0xd5034aaa43fbde6f, %g1, %r24
        setx  0x569333642c87def8, %g1, %r25
        setx  0xc4a1c754a3d76872, %g1, %r26
        setx  0x4f832c61d7823fc7, %g1, %r27
        setx  0xaee09f6ac4ab2e32, %g1, %r28
        setx  0x465269a2486670ce, %g1, %r29
        setx  0x12ecdd4a99ef58f4, %g1, %r30
        setx  0x6d53b17485a96857, %g1, %r31
	.word 0xa6faa628  ! 5: SDIVcc_I	sdivcc 	%r10, 0x0628, %r19
	.word 0x8143e028  ! 7: MEMBAR	membar	#StoreStore | #MemIssue 
	.word 0xdf3aacd0  ! 8: STDF_I	std	%f15, [0x0cd0, %r10]
	stxa	%r8, [%r10 + %r11] 0x80	
	.word 0x8143e003  ! 11: MEMBAR	membar	#LoadLoad | #StoreLoad 
	.word 0xd0eaaf18  ! 12: LDSTUBA_I	ldstuba	%r8, [%r10 + 0x0f18] %asi
	.word 0xce02a460  ! 13: LDUW_I	lduw	[%r10 + 0x0460], %r7
	.word 0x8143e051  ! 14: MEMBAR	membar	#LoadLoad | #Lookaside | #Sync 
	.word 0xd2d2addc  ! 15: LDSHA_I	ldsha	[%r10, + 0x0ddc] %asi, %r9
	.word 0x856aa30c  ! 16: SDIVX_I	sdivx	%r10, 0x030c, %r2
	.word 0xc65a800b  ! 17: LDX_R	ldx	[%r10 + %r11], %r3
	.word 0xbc7a800b  ! 18: SDIV_R	sdiv 	%r10, %r11, %r30
	.word 0xcff2a00b  ! 19: CASXA_R	casxa	[%r10]%asi, %r11, %r7
	.word 0x936a800b  ! 20: SDIVX_R	sdivx	%r10, %r11, %r9
	.word 0x8143c000  ! 21: STBAR	stbar
	.word 0xf89aa3b0  ! 22: LDDA_I	ldda	[%r10, + 0x03b0] %asi, %r28
	.word 0x89daa42c  ! 23: FLUSH_I	dis not found

	.word 0xccf2a640  ! 24: STXA_I	stxa	%r6, [%r10 + 0x0640] %asi
	.word 0xcf22800b  ! 25: STF_R	st	%f7, [%r11, %r10]
	.word 0xc5e2900b  ! 26: CASA_I	casa	[%r10] 0x80, %r11, %r2
	.word 0x86d2800b  ! 27: UMULcc_R	umulcc 	%r10, %r11, %r3
	.word 0xbfda800b  ! 28: FLUSH_R	dis not found

	.word 0xceb2af78  ! 29: STHA_I	stha	%r7, [%r10 + 0x0f78] %asi
	.word 0x825a800b  ! 30: SMUL_R	smul 	%r10, %r11, %r1
	.word 0xc36a800b  ! 31: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x8143c000  ! 33: STBAR	stbar
	.word 0x89da800b  ! 34: FLUSH_R	dis not found

	stxa	%r8, [%r10 + %r11] 0x80	
	.word 0xc5f2900b  ! 36: CASXA_I	casxa	[%r10] 0x80, %r11, %r2
	.word 0xbada800b  ! 37: SMULcc_R	smulcc 	%r10, %r11, %r29
	.word 0xdea2ab2c  ! 39: STWA_I	stwa	%r15, [%r10 + 0x0b2c] %asi
	.word 0xe922800b  ! 40: STF_R	st	%f20, [%r11, %r10]
	.word 0x0e800001  ! 41: BVS	bvs  	<label_0x1>
	.word 0xb2d2a394  ! 42: UMULcc_I	umulcc 	%r10, 0x0394, %r25
	.word 0xc8ca900b  ! 44: LDSBA_R	ldsba	[%r10, %r11] 0x80, %r4
	.word 0xd252800b  ! 45: LDSH_R	ldsh	[%r10 + %r11], %r9
	.word 0xc2f2a4b0  ! 46: STXA_I	stxa	%r1, [%r10 + 0x04b0] %asi
	.word 0x8c72800b  ! 47: UDIV_R	udiv 	%r10, %r11, %r6
	.word 0x18800003  ! 48: BGU	bgu  	<label_0x3>
	.word 0x8143e069  ! 49: MEMBAR	membar	#LoadLoad | #StoreStore | #MemIssue | #Sync 
	.word 0xc4f2a5f8  ! 50: STXA_I	stxa	%r2, [%r10 + 0x05f8] %asi
	.word 0xf4faa200  ! 51: SWAPA_I	swapa	%r26, [%r10 + 0x0200] %asi
	.word 0xe49aa5e8  ! 52: LDDA_I	ldda	[%r10, + 0x05e8] %asi, %r18
	.word 0xc2f2900b  ! 53: STXA_R	stxa	%r1, [%r10 + %r11] 0x80
	.word 0xf212800b  ! 54: LDUH_R	lduh	[%r10 + %r11], %r25
	.word 0xc2ca900b  ! 55: LDSBA_R	ldsba	[%r10, %r11] 0x80, %r1
	.word 0x2eca0001  ! 56: BRGEZ	brgez,a,pt	%8,<label_0xa0001>
	.word 0x8143e05b  ! 57: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Lookaside | #Sync 
	.word 0xdcaaa8e8  ! 58: STBA_I	stba	%r14, [%r10 + 0x08e8] %asi
	.word 0x88faa2b8  ! 59: SDIVcc_I	sdivcc 	%r10, 0x02b8, %r4
	.word 0xdadaa118  ! 60: LDXA_I	ldxa	[%r10, + 0x0118] %asi, %r13
	.word 0xd87a800b  ! 61: SWAP_R	swap	%r12, [%r10 + %r11]
	.word 0x88fa800b  ! 62: SDIVcc_R	sdivcc 	%r10, %r11, %r4
	.word 0xd3f2a00b  ! 63: CASXA_R	casxa	[%r10]%asi, %r11, %r9
	.word 0x82d2a074  ! 64: UMULcc_I	umulcc 	%r10, 0x0074, %r1
	.word 0x8ddaaa48  ! 65: FLUSH_I	dis not found

	.word 0xc89aa380  ! 66: LDDA_I	ldda	[%r10, + 0x0380] %asi, %r4
	.word 0xee7a800b  ! 67: SWAP_R	swap	%r23, [%r10 + %r11]
	.word 0xd0c2a6b0  ! 68: LDSWA_I	ldswa	[%r10, + 0x06b0] %asi, %r8
	.word 0x9122a560  ! 69: MULScc_I	mulscc 	%r10, 0x0560, %r8
	.word 0x83da800b  ! 70: FLUSH_R	dis not found

	.word 0x90d2800b  ! 71: UMULcc_R	umulcc 	%r10, %r11, %r8
	.word 0xce12800b  ! 72: LDUH_R	lduh	[%r10 + %r11], %r7
	.word 0x8143e06d  ! 73: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #MemIssue | #Sync 
	stxa	%r22, [%r10 + 0x0b18] %asi	
	.word 0x8a5a800b  ! 75: SMUL_R	smul 	%r10, %r11, %r5
	.word 0x827aa4a4  ! 76: SDIV_I	sdiv 	%r10, 0x04a4, %r1
	.word 0xb45a800b  ! 77: SMUL_R	smul 	%r10, %r11, %r26
	.word 0x0e800003  ! 78: BVS	bvs  	<label_0x3>
	.word 0x0cc20001  ! 79: BRGZ	brgz  ,nt	%8,<label_0x20001>
	.word 0x0c800001  ! 80: BNEG	bneg  	<label_0x1>
	.word 0xc3eaaab8  ! 81: PREFETCHA_I	prefetcha	[%r10, + 0x0ab8] %asi, #one_read
	stxa	%r2, [%r10 + %r11] 0x80	
	.word 0x8143c000  ! 83: STBAR	stbar
	.word 0x38800003  ! 84: BGU	bgu,a	<label_0x3>
	.word 0x8c6aabcc  ! 85: UDIVX_I	udivx 	%r10, 0x0bcc, %r6
	.word 0xcc02a1ec  ! 86: LDUW_I	lduw	[%r10 + 0x01ec], %r6
	.word 0x8143c000  ! 87: STBAR	stbar
	.word 0x18800003  ! 88: BGU	bgu  	<label_0x3>
	.word 0xe73aab88  ! 89: STDF_I	std	%f19, [0x0b88, %r10]
	.word 0x8da289ab  ! 90: FDIVs	fdivs	%f10, %f11, %f6
	.word 0x28800001  ! 91: BLEU	bleu,a	<label_0x1>
	.word 0x89daacd8  ! 92: FLUSH_I	dis not found

	.word 0xd122800b  ! 93: STF_R	st	%f8, [%r11, %r10]
	.word 0x8ddaa264  ! 94: FLUSH_I	dis not found

	.word 0x8143e07d  ! 95: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0x846aae64  ! 96: UDIVX_I	udivx 	%r10, 0x0e64, %r2
	.word 0x8c7a800b  ! 97: SDIV_R	sdiv 	%r10, %r11, %r6
	.word 0x8143c000  ! 98: STBAR	stbar
	.word 0xcaa2900b  ! 99: STWA_R	stwa	%r5, [%r10 + %r11] 0x80
	.word 0xcbf2a00b  ! 100: CASXA_R	casxa	[%r10]%asi, %r11, %r5
	.word 0x87da800b  ! 101: FLUSH_R	dis not found

	.word 0xe8f2900b  ! 102: STXA_R	stxa	%r20, [%r10 + %r11] 0x80
	.word 0xe452a74c  ! 103: LDSH_I	ldsh	[%r10 + 0x074c], %r18
	.word 0x8da289ab  ! 104: FDIVs	fdivs	%f10, %f11, %f6
	.word 0xc9f2a00b  ! 105: CASXA_R	casxa	[%r10]%asi, %r11, %r4
	.word 0xcbf2a00b  ! 106: CASXA_R	casxa	[%r10]%asi, %r11, %r5
	.word 0xbc7aa694  ! 107: SDIV_I	sdiv 	%r10, 0x0694, %r30
	.word 0xcaaa900b  ! 108: STBA_R	stba	%r5, [%r10 + %r11] 0x80
	.word 0xc36aaa9c  ! 109: PREFETCH_I	prefetch	[%r10 + 0x0a9c], #one_read
	.word 0x00800001  ! 110: BN	bn  	<label_0x1>
	.word 0x8bdaac10  ! 111: FLUSH_I	dis not found

	.word 0xda42af48  ! 112: LDSW_I	ldsw	[%r10 + 0x0f48], %r13
	.word 0xafdaabdc  ! 114: FLUSH_I	dis not found

	.word 0xfa12800b  ! 115: LDUH_R	lduh	[%r10 + %r11], %r29
	.word 0x83a289ab  ! 116: FDIVs	fdivs	%f10, %f11, %f1
	stxa	%r4, [%r10 + %r11] 0x80	
	.word 0xc6f2900b  ! 118: STXA_R	stxa	%r3, [%r10 + %r11] 0x80
	.word 0x8143e03d  ! 119: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0x32800001  ! 120: BNE	bne,a	<label_0x1>
	.word 0xd0b2900b  ! 121: STHA_R	stha	%r8, [%r10 + %r11] 0x80
	.word 0x2c800001  ! 122: BNEG	bneg,a	<label_0x1>
	.word 0xd01aac20  ! 123: LDD_I	ldd	[%r10 + 0x0c20], %r8
	.word 0xdf22800b  ! 124: STF_R	st	%f15, [%r11, %r10]
	.word 0x99da800b  ! 125: FLUSH_R	dis not found

	.word 0x99da800b  ! 126: FLUSH_R	dis not found

	.word 0xd202800b  ! 127: LDUW_R	lduw	[%r10 + %r11], %r9
	.word 0xc3eaa190  ! 128: PREFETCHA_I	prefetcha	[%r10, + 0x0190] %asi, #one_read
	.word 0x83daae80  ! 130: FLUSH_I	dis not found

	stxa	%r22, [%r10 + 0x0b40] %asi	
	.word 0xc7e2a00b  ! 132: CASA_R	casa	[%r10] %asi, %r11, %r3
	.word 0x8143c000  ! 133: STBAR	stbar
	.word 0xfa82ab40  ! 134: LDUWA_I	lduwa	[%r10, + 0x0b40] %asi, %r29
	.word 0x8143e007  ! 135: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore 
	.word 0x8143c000  ! 136: STBAR	stbar
	.word 0x8143e006  ! 137: MEMBAR	membar	#StoreLoad | #LoadStore 
	.word 0x86d2800b  ! 138: UMULcc_R	umulcc 	%r10, %r11, %r3
	.word 0xccd2900b  ! 140: LDSHA_R	ldsha	[%r10, %r11] 0x80, %r6
	.word 0x2aca0001  ! 141: BRNZ	brnz,a,pt	%8,<label_0xa0001>
	.word 0x8322800b  ! 142: MULScc_R	mulscc 	%r10, %r11, %r1
	.word 0xa1da800b  ! 143: FLUSH_R	dis not found

	.word 0xb0faafe8  ! 144: SDIVcc_I	sdivcc 	%r10, 0x0fe8, %r24
	.word 0xe4f2900b  ! 145: STXA_R	stxa	%r18, [%r10 + %r11] 0x80
	.word 0x91da800b  ! 146: FLUSH_R	dis not found

	.word 0x93da800b  ! 147: FLUSH_R	dis not found

	.word 0xa1daaee8  ! 148: FLUSH_I	dis not found

	.word 0xc2da900b  ! 149: LDXA_R	ldxa	[%r10, %r11] 0x80, %r1
	.word 0xcfe2900b  ! 150: CASA_I	casa	[%r10] 0x80, %r11, %r7
	.word 0x8252a1bc  ! 151: UMUL_I	umul 	%r10, 0x01bc, %r1
	.word 0x8452800b  ! 152: UMUL_R	umul 	%r10, %r11, %r2
	.word 0x827aa93c  ! 153: SDIV_I	sdiv 	%r10, 0x093c, %r1
	.word 0xc48aafcc  ! 154: LDUBA_I	lduba	[%r10, + 0x0fcc] %asi, %r2
	.word 0xa9a289ab  ! 155: FDIVs	fdivs	%f10, %f11, %f20
	.word 0x91da800b  ! 156: FLUSH_R	dis not found

	.word 0xc3eaa8e8  ! 157: PREFETCHA_I	prefetcha	[%r10, + 0x08e8] %asi, #one_read
	.word 0xd20aae88  ! 158: LDUB_I	ldub	[%r10 + 0x0e88], %r9
	.word 0x8da2882b  ! 159: FADDs	fadds	%f10, %f11, %f6
	.word 0xdaaa900b  ! 160: STBA_R	stba	%r13, [%r10 + %r11] 0x80
	.word 0x0e800001  ! 161: BVS	bvs  	<label_0x1>
	.word 0xd0b2900b  ! 162: STHA_R	stha	%r8, [%r10 + %r11] 0x80
	.word 0x8f6a800b  ! 163: SDIVX_R	sdivx	%r10, %r11, %r7
	.word 0x8143e079  ! 164: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0x8252800b  ! 165: UMUL_R	umul 	%r10, %r11, %r1
	.word 0xca52a8c4  ! 166: LDSH_I	ldsh	[%r10 + 0x08c4], %r5
	.word 0x8852a240  ! 167: UMUL_I	umul 	%r10, 0x0240, %r4
	.word 0xe122ae2c  ! 168: STF_I	st	%f16, [0x0e2c, %r10]
	.word 0xccda900b  ! 169: LDXA_R	ldxa	[%r10, %r11] 0x80, %r6
	.word 0xa0da800b  ! 170: SMULcc_R	smulcc 	%r10, %r11, %r16
	.word 0xce92900b  ! 171: LDUHA_R	lduha	[%r10, %r11] 0x80, %r7
	.word 0x0cc20003  ! 172: BRGZ	brgz  ,nt	%8,<label_0x20003>
	.word 0x0eca0001  ! 173: BRGEZ	brgez  ,pt	%8,<label_0xa0001>
	.word 0xca02a3d4  ! 174: LDUW_I	lduw	[%r10 + 0x03d4], %r5
	.word 0xe87a800b  ! 175: SWAP_R	swap	%r20, [%r10 + %r11]
	.word 0xf0aa900b  ! 176: STBA_R	stba	%r24, [%r10 + %r11] 0x80
	stxa	%r2, [%r10 + %r11] 0x80	
	.word 0xc81a800b  ! 178: LDD_R	ldd	[%r10 + %r11], %r4
	.word 0xc3ea900b  ! 179: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0xe2aaa308  ! 180: STBA_I	stba	%r17, [%r10 + 0x0308] %asi
	.word 0xb7da800b  ! 181: FLUSH_R	dis not found

	.word 0x8dda800b  ! 182: FLUSH_R	dis not found

	.word 0xfe82900b  ! 183: LDUWA_R	lduwa	[%r10, %r11] 0x80, %r31
	.word 0xc4aa900b  ! 184: STBA_R	stba	%r2, [%r10 + %r11] 0x80
	.word 0xc522a4b0  ! 185: STF_I	st	%f2, [0x04b0, %r10]
	.word 0x8143e000  ! 186: MEMBAR	membar	
	.word 0xc522a1b4  ! 187: STF_I	st	%f2, [0x01b4, %r10]
	.word 0x8143e031  ! 188: MEMBAR	membar	#LoadLoad | #Lookaside | #MemIssue 
	.word 0xb1daa0e8  ! 189: FLUSH_I	dis not found

	.word 0x28800001  ! 190: BLEU	bleu,a	<label_0x1>
	.word 0x83daa4d8  ! 191: FLUSH_I	dis not found

	.word 0xceb2a630  ! 192: STHA_I	stha	%r7, [%r10 + 0x0630] %asi
	.word 0xc36aa090  ! 193: PREFETCH_I	prefetch	[%r10 + 0x0090], #one_read
	.word 0xe5e2900b  ! 194: CASA_I	casa	[%r10] 0x80, %r11, %r18
	.word 0x89da800b  ! 195: FLUSH_R	dis not found

	.word 0xecf2a8d0  ! 196: STXA_I	stxa	%r22, [%r10 + 0x08d0] %asi
	.word 0x93a2892b  ! 197: FMULs	fmuls	%f10, %f11, %f9
	.word 0xc53aaaa8  ! 198: STDF_I	std	%f2, [0x0aa8, %r10]
	.word 0xc89aaea8  ! 199: LDDA_I	ldda	[%r10, + 0x0ea8] %asi, %r4
	.word 0xb85a800b  ! 200: SMUL_R	smul 	%r10, %r11, %r28
	.word 0x93a288ab  ! 201: FSUBs	fsubs	%f10, %f11, %f9
	.word 0xc2fa900b  ! 202: SWAPA_R	swapa	%r1, [%r10 + %r11] 0x80
	.word 0x907aad50  ! 203: SDIV_I	sdiv 	%r10, 0x0d50, %r8
	.word 0xceaaa060  ! 204: STBA_I	stba	%r7, [%r10 + 0x0060] %asi
	.word 0x82daa2d0  ! 205: SMULcc_I	smulcc 	%r10, 0x02d0, %r1
	.word 0x38800001  ! 206: BGU	bgu,a	<label_0x1>
	.word 0x93da800b  ! 207: FLUSH_R	dis not found

	.word 0xa36aa218  ! 208: SDIVX_I	sdivx	%r10, 0x0218, %r17
	.word 0xc9e2900b  ! 209: CASA_I	casa	[%r10] 0x80, %r11, %r4
	.word 0xbfdaac38  ! 210: FLUSH_I	dis not found

	.word 0xe53a800b  ! 211: STDF_R	std	%f18, [%r11, %r10]
	.word 0x2e800001  ! 212: BVS	bvs,a	<label_0x1>
	.word 0x8a5aa4d8  ! 213: SMUL_I	smul 	%r10, 0x04d8, %r5
	.word 0xd00a800b  ! 214: LDUB_R	ldub	[%r10 + %r11], %r8
	.word 0xc3ea900b  ! 215: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0xca0a800b  ! 216: LDUB_R	ldub	[%r10 + %r11], %r5
	.word 0xbda2892b  ! 217: FMULs	fmuls	%f10, %f11, %f30
	.word 0xdb22800b  ! 218: STF_R	st	%f13, [%r11, %r10]
	.word 0xc4d2900b  ! 220: LDSHA_R	ldsha	[%r10, %r11] 0x80, %r2
	.word 0xd0aa900b  ! 221: STBA_R	stba	%r8, [%r10 + %r11] 0x80
	.word 0x8143e006  ! 222: MEMBAR	membar	#StoreLoad | #LoadStore 
	.word 0xa2daa514  ! 223: SMULcc_I	smulcc 	%r10, 0x0514, %r17
	.word 0xc212a138  ! 224: LDUH_I	lduh	[%r10 + 0x0138], %r1
	.word 0x9052800b  ! 225: UMUL_R	umul 	%r10, %r11, %r8
	.word 0xc3f2a00b  ! 226: CASXA_R	casxa	[%r10]%asi, %r11, %r1
	.word 0xaddaaa58  ! 227: FLUSH_I	dis not found

	.word 0xc36aaa04  ! 228: PREFETCH_I	prefetch	[%r10 + 0x0a04], #one_read
	.word 0x996a800b  ! 229: SDIVX_R	sdivx	%r10, %r11, %r12
	.word 0x8322800b  ! 230: MULScc_R	mulscc 	%r10, %r11, %r1
	.word 0xbbda800b  ! 231: FLUSH_R	dis not found

	.word 0xd242800b  ! 232: LDSW_R	ldsw	[%r10 + %r11], %r9
	.word 0xb6f2800b  ! 233: UDIVcc_R	udivcc 	%r10, %r11, %r27
	.word 0xafa2882b  ! 234: FADDs	fadds	%f10, %f11, %f23
	.word 0x89daa9dc  ! 235: FLUSH_I	dis not found

	.word 0xc242ad88  ! 236: LDSW_I	ldsw	[%r10 + 0x0d88], %r1
	.word 0x8fda800b  ! 237: FLUSH_R	dis not found

	.word 0x8143c000  ! 238: STBAR	stbar
	.word 0xd2b2900b  ! 239: STHA_R	stha	%r9, [%r10 + %r11] 0x80
	.word 0xca0aabf8  ! 240: LDUB_I	ldub	[%r10 + 0x0bf8], %r5
	.word 0x1e800001  ! 241: BVC	bvc  	<label_0x1>
	.word 0xca5aa058  ! 242: LDX_I	ldx	[%r10 + 0x0058], %r5
	.word 0xc01a800b  ! 243: LDD_R	ldd	[%r10 + %r11], %r0
	.word 0x8143e008  ! 244: MEMBAR	membar	#StoreStore 
	.word 0xc202ab44  ! 245: LDUW_I	lduw	[%r10 + 0x0b44], %r1
	.word 0xe53aa708  ! 246: STDF_I	std	%f18, [0x0708, %r10]
	.word 0xca8aa334  ! 247: LDUBA_I	lduba	[%r10, + 0x0334] %asi, %r5
	.word 0x827a800b  ! 248: SDIV_R	sdiv 	%r10, %r11, %r1
	.word 0xd2daa6a0  ! 249: LDXA_I	ldxa	[%r10, + 0x06a0] %asi, %r9
	.word 0xec12800b  ! 250: LDUH_R	lduh	[%r10 + %r11], %r22
	.word 0xc3eaab20  ! 251: PREFETCHA_I	prefetcha	[%r10, + 0x0b20] %asi, #one_read
	.word 0x0e800003  ! 252: BVS	bvs  	<label_0x3>
	.word 0x28800003  ! 253: BLEU	bleu,a	<label_0x3>
	.word 0x8143c000  ! 254: STBAR	stbar
	.word 0xfac2900b  ! 255: LDSWA_R	ldswa	[%r10, %r11] 0x80, %r29
	.word 0xfa02800b  ! 256: LDUW_R	lduw	[%r10 + %r11], %r29
	.word 0x14800001  ! 257: BG	bg  	<label_0x1>
	.word 0xc612a854  ! 258: LDUH_I	lduh	[%r10 + 0x0854], %r3
	.word 0x34800003  ! 259: BG	bg,a	<label_0x3>
	.word 0x8922800b  ! 260: MULScc_R	mulscc 	%r10, %r11, %r4
	.word 0x8143c000  ! 261: STBAR	stbar
	.word 0xde8a900b  ! 262: LDUBA_R	lduba	[%r10, %r11] 0x80, %r15
	.word 0xcefa900b  ! 263: SWAPA_R	swapa	%r7, [%r10 + %r11] 0x80
	.word 0x85a2882b  ! 264: FADDs	fadds	%f10, %f11, %f2
	.word 0x02c20001  ! 265: BRZ	brz  ,nt	%8,<label_0x20001>
	.word 0x85daab5c  ! 266: FLUSH_I	dis not found

	.word 0xc36aac44  ! 267: PREFETCH_I	prefetch	[%r10 + 0x0c44], #one_read
	.word 0x924a800b  ! 268: MULX_R	mulx 	%r10, %r11, %r9
	.word 0xc3f2900b  ! 270: CASXA_I	casxa	[%r10] 0x80, %r11, %r1
	.word 0xcef2900b  ! 271: STXA_R	stxa	%r7, [%r10 + %r11] 0x80
	.word 0xea6a800b  ! 272: LDSTUB_R	ldstub	%r21, [%r10 + %r11]
	.word 0xe8b2900b  ! 273: STHA_R	stha	%r20, [%r10 + %r11] 0x80
	.word 0x8f6a800b  ! 274: SDIVX_R	sdivx	%r10, %r11, %r7
	.word 0x8ef2800b  ! 275: UDIVcc_R	udivcc 	%r10, %r11, %r7
	.word 0x9c52800b  ! 276: UMUL_R	umul 	%r10, %r11, %r14
	.word 0xe5e2900b  ! 277: CASA_I	casa	[%r10] 0x80, %r11, %r18
	.word 0xcc02a580  ! 278: LDUW_I	lduw	[%r10 + 0x0580], %r6
	.word 0x2aca0001  ! 279: BRNZ	brnz,a,pt	%8,<label_0xa0001>
	.word 0xa7a2892b  ! 280: FMULs	fmuls	%f10, %f11, %f19
	.word 0xc9f2a00b  ! 281: CASXA_R	casxa	[%r10]%asi, %r11, %r4
	.word 0xc36aab88  ! 282: PREFETCH_I	prefetch	[%r10 + 0x0b88], #one_read
	.word 0xd05a800b  ! 283: LDX_R	ldx	[%r10 + %r11], %r8
	.word 0x2c800003  ! 284: BNEG	bneg,a	<label_0x3>
	.word 0xc2eaae90  ! 285: LDSTUBA_I	ldstuba	%r1, [%r10 + 0x0e90] %asi
	.word 0xc402800b  ! 286: LDUW_R	lduw	[%r10 + %r11], %r2
	.word 0xee02a048  ! 288: LDUW_I	lduw	[%r10 + 0x0048], %r23
	.word 0xc2a2900b  ! 289: STWA_R	stwa	%r1, [%r10 + %r11] 0x80
	.word 0xb4da800b  ! 290: SMULcc_R	smulcc 	%r10, %r11, %r26
	.word 0xcc9aaf68  ! 291: LDDA_I	ldda	[%r10, + 0x0f68] %asi, %r6
	.word 0xb66a800b  ! 293: UDIVX_R	udivx 	%r10, %r11, %r27
	.word 0xc202a634  ! 294: LDUW_I	lduw	[%r10 + 0x0634], %r1
	.word 0xbba2892b  ! 296: FMULs	fmuls	%f10, %f11, %f29
	.word 0xc36aa6e8  ! 297: PREFETCH_I	prefetch	[%r10 + 0x06e8], #one_read
	.word 0x89a288ab  ! 298: FSUBs	fsubs	%f10, %f11, %f4
	.word 0xed3aa830  ! 299: STDF_I	std	%f22, [0x0830, %r10]
	.word 0x84daa438  ! 300: SMULcc_I	smulcc 	%r10, 0x0438, %r2
	.word 0xe13a800b  ! 301: STDF_R	std	%f16, [%r11, %r10]
	.word 0x9252a834  ! 302: UMUL_I	umul 	%r10, 0x0834, %r9
	.word 0xcd22800b  ! 303: STF_R	st	%f6, [%r11, %r10]
	.word 0xc81a800b  ! 304: LDD_R	ldd	[%r10 + %r11], %r4
	.word 0x8a52a9c0  ! 306: UMUL_I	umul 	%r10, 0x09c0, %r5
	.word 0xba4aae4c  ! 307: MULX_I	mulx 	%r10, 0x0e4c, %r29
	.word 0x8652800b  ! 308: UMUL_R	umul 	%r10, %r11, %r3
	.word 0xc4c2ae6c  ! 309: LDSWA_I	ldswa	[%r10, + 0x0e6c] %asi, %r2
	.word 0xc2c2a904  ! 310: LDSWA_I	ldswa	[%r10, + 0x0904] %asi, %r1
	.word 0xc7e2a00b  ! 311: CASA_R	casa	[%r10] %asi, %r11, %r3
	.word 0x00800001  ! 312: BN	bn  	<label_0x1>
	.word 0xa84aa550  ! 313: MULX_I	mulx 	%r10, 0x0550, %r20
	.word 0x8143c000  ! 314: STBAR	stbar
	.word 0x8143e03c  ! 315: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0xb1da800b  ! 316: FLUSH_R	dis not found

	.word 0xc60a800b  ! 317: LDUB_R	ldub	[%r10 + %r11], %r3
	.word 0xc7f2900b  ! 318: CASXA_I	casxa	[%r10] 0x80, %r11, %r3
	.word 0xea6a800b  ! 319: LDSTUB_R	ldstub	%r21, [%r10 + %r11]
	.word 0xce92900b  ! 320: LDUHA_R	lduha	[%r10, %r11] 0x80, %r7
	.word 0x8143c000  ! 321: STBAR	stbar
	.word 0xf64a800b  ! 322: LDSB_R	ldsb	[%r10 + %r11], %r27
	.word 0x8143c000  ! 323: STBAR	stbar
	.word 0xa9a2882b  ! 324: FADDs	fadds	%f10, %f11, %f20
	.word 0x836a800b  ! 325: SDIVX_R	sdivx	%r10, %r11, %r1
	.word 0x8143c000  ! 326: STBAR	stbar
	.word 0x04800003  ! 327: BLE	ble  	<label_0x3>
	.word 0x85da800b  ! 328: FLUSH_R	dis not found

	.word 0x8143e05a  ! 329: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside | #Sync 
	.word 0xcfe2900b  ! 330: CASA_I	casa	[%r10] 0x80, %r11, %r7
	.word 0xdaa2ac54  ! 331: STWA_I	stwa	%r13, [%r10 + 0x0c54] %asi
	.word 0xd2d2900b  ! 332: LDSHA_R	ldsha	[%r10, %r11] 0x80, %r9
	.word 0xceeaab64  ! 333: LDSTUBA_I	ldstuba	%r7, [%r10 + 0x0b64] %asi
	.word 0x8cd2800b  ! 334: UMULcc_R	umulcc 	%r10, %r11, %r6
	.word 0x36800001  ! 335: BGE	bge,a	<label_0x1>
	.word 0x8143e03d  ! 336: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0x24ca0001  ! 337: BRLEZ	brlez,a,pt	%8,<label_0xa0001>
	.word 0x34800003  ! 338: BG	bg,a	<label_0x3>
	.word 0xd2c2a70c  ! 339: LDSWA_I	ldswa	[%r10, + 0x070c] %asi, %r9
	.word 0xd93a800b  ! 340: STDF_R	std	%f12, [%r11, %r10]
	.word 0x8143e003  ! 341: MEMBAR	membar	#LoadLoad | #StoreLoad 
	.word 0xa1a289ab  ! 342: FDIVs	fdivs	%f10, %f11, %f16
	.word 0x8dda800b  ! 343: FLUSH_R	dis not found

	.word 0xc36a800b  ! 344: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x90faa16c  ! 345: SDIVcc_I	sdivcc 	%r10, 0x016c, %r8
	.word 0x8143c000  ! 346: STBAR	stbar
	.word 0xa472a03c  ! 347: UDIV_I	udiv 	%r10, 0x003c, %r18
	.word 0xceda900b  ! 348: LDXA_R	ldxa	[%r10, %r11] 0x80, %r7
	.word 0x88f2800b  ! 349: UDIVcc_R	udivcc 	%r10, %r11, %r4
	.word 0x8143c000  ! 350: STBAR	stbar
	.word 0x985aa3dc  ! 351: SMUL_I	smul 	%r10, 0x03dc, %r12
	.word 0xc5e2a00b  ! 352: CASA_R	casa	[%r10] %asi, %r11, %r2
	.word 0xa1daa11c  ! 353: FLUSH_I	dis not found

	.word 0xc692ad74  ! 354: LDUHA_I	lduha	[%r10, + 0x0d74] %asi, %r3
	.word 0x9dda800b  ! 356: FLUSH_R	dis not found

	.word 0x9072a59c  ! 357: UDIV_I	udiv 	%r10, 0x059c, %r8
	.word 0xbb6a800b  ! 358: SDIVX_R	sdivx	%r10, %r11, %r29
	.word 0xc8c2900b  ! 359: LDSWA_R	ldswa	[%r10, %r11] 0x80, %r4
	.word 0xb9da800b  ! 360: FLUSH_R	dis not found

	.word 0xfada900b  ! 361: LDXA_R	ldxa	[%r10, %r11] 0x80, %r29
	.word 0xedf2900b  ! 362: CASXA_I	casxa	[%r10] 0x80, %r11, %r22
	.word 0xc6eaad0c  ! 363: LDSTUBA_I	ldstuba	%r3, [%r10 + 0x0d0c] %asi
	.word 0xf7e2a00b  ! 364: CASA_R	casa	[%r10] %asi, %r11, %r27
	.word 0xba72af1c  ! 365: UDIV_I	udiv 	%r10, 0x0f1c, %r29
	.word 0x8143c000  ! 366: STBAR	stbar
	.word 0xc40aa13c  ! 367: LDUB_I	ldub	[%r10 + 0x013c], %r2
	.word 0xb46aafe0  ! 368: UDIVX_I	udivx 	%r10, 0x0fe0, %r26
	.word 0xc26aab8c  ! 369: LDSTUB_I	ldstub	%r1, [%r10 + 0x0b8c]
	.word 0xc4c2a958  ! 370: LDSWA_I	ldswa	[%r10, + 0x0958] %asi, %r2
	.word 0xd20aa954  ! 371: LDUB_I	ldub	[%r10 + 0x0954], %r9
	.word 0xada288ab  ! 372: FSUBs	fsubs	%f10, %f11, %f22
	.word 0xc8b2900b  ! 373: STHA_R	stha	%r4, [%r10 + %r11] 0x80
	.word 0x91a2892b  ! 374: FMULs	fmuls	%f10, %f11, %f8
	.word 0xebf2a00b  ! 375: CASXA_R	casxa	[%r10]%asi, %r11, %r21
	.word 0x9e7a800b  ! 376: SDIV_R	sdiv 	%r10, %r11, %r15
	.word 0xb9daa3dc  ! 377: FLUSH_I	dis not found

	.word 0x85daa8f0  ! 378: FLUSH_I	dis not found

	.word 0xc3ea900b  ! 379: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0x18800003  ! 380: BGU	bgu  	<label_0x3>
	.word 0xaad2800b  ! 381: UMULcc_R	umulcc 	%r10, %r11, %r21
	.word 0xf49aa060  ! 382: LDDA_I	ldda	[%r10, + 0x0060] %asi, %r26
	.word 0xa7da800b  ! 383: FLUSH_R	dis not found

	.word 0x8272800b  ! 384: UDIV_R	udiv 	%r10, %r11, %r1
	.word 0xeaaa900b  ! 385: STBA_R	stba	%r21, [%r10 + %r11] 0x80
	.word 0xd08aad9c  ! 386: LDUBA_I	lduba	[%r10, + 0x0d9c] %asi, %r8
	.word 0x22800003  ! 387: BE	be,a	<label_0x3>
	.word 0xb44aa1f4  ! 388: MULX_I	mulx 	%r10, 0x01f4, %r26
	.word 0x8bdaac0c  ! 389: FLUSH_I	dis not found

	.word 0x8afa800b  ! 392: SDIVcc_R	sdivcc 	%r10, %r11, %r5
	.word 0xc36a800b  ! 393: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0xc41aaa70  ! 394: LDD_I	ldd	[%r10 + 0x0a70], %r2
	.word 0xc2caa364  ! 395: LDSBA_I	ldsba	[%r10, + 0x0364] %asi, %r1
	.word 0x22ca0001  ! 396: BRZ	brz,a,pt	%8,<label_0xa0001>
	.word 0xd0b2900b  ! 397: STHA_R	stha	%r8, [%r10 + %r11] 0x80
	.word 0x9072a2ec  ! 398: UDIV_I	udiv 	%r10, 0x02ec, %r8
	.word 0xdcaa900b  ! 399: STBA_R	stba	%r14, [%r10 + %r11] 0x80
	.word 0x82daa500  ! 400: SMULcc_I	smulcc 	%r10, 0x0500, %r1
	.word 0xcb3aa830  ! 401: STDF_I	std	%f5, [0x0830, %r10]
	.word 0xd0d2ae50  ! 402: LDSHA_I	ldsha	[%r10, + 0x0e50] %asi, %r8
	.word 0xaeda800b  ! 403: SMULcc_R	smulcc 	%r10, %r11, %r23
	.word 0xccf2a828  ! 404: STXA_I	stxa	%r6, [%r10 + 0x0828] %asi
	.word 0xc36a800b  ! 405: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x88da800b  ! 406: SMULcc_R	smulcc 	%r10, %r11, %r4
	.word 0x00800001  ! 407: BN	bn  	<label_0x1>
	.word 0x8d6a800b  ! 408: SDIVX_R	sdivx	%r10, %r11, %r6
	.word 0x89da800b  ! 409: FLUSH_R	dis not found

	.word 0x82f2800b  ! 410: UDIVcc_R	udivcc 	%r10, %r11, %r1
	.word 0x20800001  ! 412: BN	bn,a	<label_0x1>
	.word 0x8143e00f  ! 413: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore 
	.word 0x8143e079  ! 414: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0x86fa800b  ! 416: SDIVcc_R	sdivcc 	%r10, %r11, %r3
	.word 0xb1a288ab  ! 417: FSUBs	fsubs	%f10, %f11, %f24
	.word 0x90daa0b4  ! 418: SMULcc_I	smulcc 	%r10, 0x00b4, %r8
	.word 0x9e4aa700  ! 419: MULX_I	mulx 	%r10, 0x0700, %r15
	.word 0x8143c000  ! 420: STBAR	stbar
	.word 0xfa42afe8  ! 421: LDSW_I	ldsw	[%r10 + 0x0fe8], %r29
	.word 0x8a52800b  ! 422: UMUL_R	umul 	%r10, %r11, %r5
	.word 0xc33a800b  ! 423: STDF_R	std	%f1, [%r11, %r10]
	.word 0x906aa5fc  ! 424: UDIVX_I	udivx 	%r10, 0x05fc, %r8
	.word 0xcbf2900b  ! 425: CASXA_I	casxa	[%r10] 0x80, %r11, %r5
	.word 0x926a800b  ! 426: UDIVX_R	udivx 	%r10, %r11, %r9
	.word 0x24c20001  ! 427: BRLEZ	brlez,a,nt	%8,<label_0x20001>
	.word 0x0ec20001  ! 428: BRGEZ	brgez  ,nt	%8,<label_0x20001>
	.word 0xcd22800b  ! 429: STF_R	st	%f6, [%r11, %r10]
	.word 0xca6aaeac  ! 430: LDSTUB_I	ldstub	%r5, [%r10 + 0x0eac]
	.word 0xa2fa800b  ! 431: SDIVcc_R	sdivcc 	%r10, %r11, %r17
	.word 0xcadaaa08  ! 432: LDXA_I	ldxa	[%r10, + 0x0a08] %asi, %r5
	.word 0x8143c000  ! 433: STBAR	stbar
	.word 0xb1daafd8  ! 434: FLUSH_I	dis not found

	.word 0xf48aa290  ! 435: LDUBA_I	lduba	[%r10, + 0x0290] %asi, %r26
	.word 0xd27a800b  ! 436: SWAP_R	swap	%r9, [%r10 + %r11]
	.word 0xe322800b  ! 437: STF_R	st	%f17, [%r11, %r10]
	.word 0xcff2900b  ! 438: CASXA_I	casxa	[%r10] 0x80, %r11, %r7
	.word 0xc36a800b  ! 439: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x04800001  ! 440: BLE	ble  	<label_0x1>
	.word 0xccb2a130  ! 441: STHA_I	stha	%r6, [%r10 + 0x0130] %asi
	.word 0xd33aafb0  ! 442: STDF_I	std	%f9, [0x0fb0, %r10]
	.word 0x8ba288ab  ! 444: FSUBs	fsubs	%f10, %f11, %f5
	.word 0xb76a800b  ! 445: SDIVX_R	sdivx	%r10, %r11, %r27
	.word 0xde8aa130  ! 446: LDUBA_I	lduba	[%r10, + 0x0130] %asi, %r15
	.word 0xa472ae98  ! 447: UDIV_I	udiv 	%r10, 0x0e98, %r18
	.word 0x9da2892b  ! 448: FMULs	fmuls	%f10, %f11, %f14
	.word 0xf842ad68  ! 450: LDSW_I	ldsw	[%r10 + 0x0d68], %r28
	.word 0x8da2892b  ! 451: FMULs	fmuls	%f10, %f11, %f6
	.word 0x87daaadc  ! 452: FLUSH_I	dis not found

	.word 0x8e4aa638  ! 453: MULX_I	mulx 	%r10, 0x0638, %r7
	.word 0xd8daa140  ! 454: LDXA_I	ldxa	[%r10, + 0x0140] %asi, %r12
	.word 0xe6f2900b  ! 455: STXA_R	stxa	%r19, [%r10 + %r11] 0x80
	.word 0xb1da800b  ! 456: FLUSH_R	dis not found

	.word 0xd0eaa790  ! 457: LDSTUBA_I	ldstuba	%r8, [%r10 + 0x0790] %asi
	.word 0x91daabc8  ! 458: FLUSH_I	dis not found

	.word 0x8d6a800b  ! 459: SDIVX_R	sdivx	%r10, %r11, %r6
	.word 0xc3eaad70  ! 460: PREFETCHA_I	prefetcha	[%r10, + 0x0d70] %asi, #one_read
	.word 0xceaa900b  ! 461: STBA_R	stba	%r7, [%r10 + %r11] 0x80
	.word 0x8fa2892b  ! 462: FMULs	fmuls	%f10, %f11, %f7
	.word 0xd3e2900b  ! 463: CASA_I	casa	[%r10] 0x80, %r11, %r9
	.word 0xc2ea900b  ! 464: LDSTUBA_R	ldstuba	%r1, [%r10 + %r11] 0x80
	.word 0x16800001  ! 465: BGE	bge  	<label_0x1>
	.word 0xc842800b  ! 466: LDSW_R	ldsw	[%r10 + %r11], %r4
	.word 0x927aa678  ! 467: SDIV_I	sdiv 	%r10, 0x0678, %r9
	.word 0xc6aaaa34  ! 468: STBA_I	stba	%r3, [%r10 + 0x0a34] %asi
	.word 0x9cd2800b  ! 469: UMULcc_R	umulcc 	%r10, %r11, %r14
	.word 0xc2faa510  ! 470: SWAPA_I	swapa	%r1, [%r10 + 0x0510] %asi
	.word 0xb2f2a43c  ! 471: UDIVcc_I	udivcc 	%r10, 0x043c, %r25
	.word 0x8143e06b  ! 472: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #MemIssue | #Sync 
	.word 0xc3eaa120  ! 473: PREFETCHA_I	prefetcha	[%r10, + 0x0120] %asi, #one_read
	.word 0xc652afa8  ! 474: LDSH_I	ldsh	[%r10 + 0x0fa8], %r3
	.word 0x884a800b  ! 475: MULX_R	mulx 	%r10, %r11, %r4
	.word 0xc40aa5f4  ! 476: LDUB_I	ldub	[%r10 + 0x05f4], %r2
	.word 0x2cc20003  ! 477: BRGZ	brgz,a,nt	%8,<label_0x20003>
	.word 0xd8a2900b  ! 478: STWA_R	stwa	%r12, [%r10 + %r11] 0x80
	.word 0x85da800b  ! 479: FLUSH_R	dis not found

	.word 0xe67a800b  ! 480: SWAP_R	swap	%r19, [%r10 + %r11]
	.word 0x8143c000  ! 481: STBAR	stbar
	.word 0xce42800b  ! 482: LDSW_R	ldsw	[%r10 + %r11], %r7
	.word 0xeeaaa9d0  ! 483: STBA_I	stba	%r23, [%r10 + 0x09d0] %asi
	.word 0x0ec20001  ! 485: BRGEZ	brgez  ,nt	%8,<label_0x20001>
	.word 0x8afaa5e4  ! 486: SDIVcc_I	sdivcc 	%r10, 0x05e4, %r5
	.word 0xbad2800b  ! 487: UMULcc_R	umulcc 	%r10, %r11, %r29
	.word 0x8da2892b  ! 488: FMULs	fmuls	%f10, %f11, %f6
	.word 0xf64a800b  ! 489: LDSB_R	ldsb	[%r10 + %r11], %r27
	.word 0xc3ea900b  ! 490: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0xc68aaf5c  ! 491: LDUBA_I	lduba	[%r10, + 0x0f5c] %asi, %r3
	.word 0x8143c000  ! 493: STBAR	stbar
	.word 0xc7e2900b  ! 494: CASA_I	casa	[%r10] 0x80, %r11, %r3
	.word 0x83da800b  ! 495: FLUSH_R	dis not found

	.word 0xca5aa118  ! 498: LDX_I	ldx	[%r10 + 0x0118], %r5
	.word 0xf722a104  ! 499: STF_I	st	%f27, [0x0104, %r10]
	.word 0x8143c000  ! 500: STBAR	stbar
	.word 0xc27a800b  ! 501: SWAP_R	swap	%r1, [%r10 + %r11]
	.word 0xc4b2ae58  ! 502: STHA_I	stha	%r2, [%r10 + 0x0e58] %asi
	.word 0x8fa288ab  ! 503: FSUBs	fsubs	%f10, %f11, %f7
	.word 0xccca900b  ! 504: LDSBA_R	ldsba	[%r10, %r11] 0x80, %r6
	.word 0xe81aaca0  ! 505: LDD_I	ldd	[%r10 + 0x0ca0], %r20
	.word 0xd892adb4  ! 506: LDUHA_I	lduha	[%r10, + 0x0db4] %asi, %r12
	.word 0x04c20001  ! 507: BRLEZ	brlez  ,nt	%8,<label_0x20001>
	.word 0xd2faaa08  ! 508: SWAPA_I	swapa	%r9, [%r10 + 0x0a08] %asi
	.word 0xdb3a800b  ! 509: STDF_R	std	%f13, [%r11, %r10]
	.word 0xc842ac80  ! 510: LDSW_I	ldsw	[%r10 + 0x0c80], %r4
	.word 0x8143e045  ! 511: MEMBAR	membar	#LoadLoad | #LoadStore | #Sync 
	.word 0xcc6a800b  ! 512: LDSTUB_R	ldstub	%r6, [%r10 + %r11]
	.word 0x8b22a800  ! 513: MULScc_I	mulscc 	%r10, 0x0800, %r5
	.word 0xcfe2a00b  ! 514: CASA_R	casa	[%r10] %asi, %r11, %r7
	.word 0xe012a3bc  ! 515: LDUH_I	lduh	[%r10 + 0x03bc], %r16
	.word 0x8143c000  ! 516: STBAR	stbar
	stxa	%r4, [%r10 + 0x0e68] %asi	
	.word 0xccaaa210  ! 518: STBA_I	stba	%r6, [%r10 + 0x0210] %asi
	.word 0xc692a1a8  ! 519: LDUHA_I	lduha	[%r10, + 0x01a8] %asi, %r3
	.word 0x90da800b  ! 520: SMULcc_R	smulcc 	%r10, %r11, %r8
	.word 0xdaca900b  ! 521: LDSBA_R	ldsba	[%r10, %r11] 0x80, %r13
	.word 0xc2aaa82c  ! 522: STBA_I	stba	%r1, [%r10 + 0x082c] %asi
	.word 0x82d2ad04  ! 523: UMULcc_I	umulcc 	%r10, 0x0d04, %r1
	.word 0xd282a790  ! 524: LDUWA_I	lduwa	[%r10, + 0x0790] %asi, %r9
	.word 0x98d2abec  ! 525: UMULcc_I	umulcc 	%r10, 0x0bec, %r12
	.word 0x8143e02c  ! 526: MEMBAR	membar	#LoadStore | #StoreStore | #MemIssue 
	.word 0x30800001  ! 527: BA	ba,a	<label_0x1>
	.word 0x8e5a800b  ! 528: SMUL_R	smul 	%r10, %r11, %r7
	.word 0xcceaa1a4  ! 529: LDSTUBA_I	ldstuba	%r6, [%r10 + 0x01a4] %asi
	.word 0xafda800b  ! 530: FLUSH_R	dis not found

	.word 0xd07aa1f8  ! 531: SWAP_I	swap	%r8, [%r10 + 0x01f8]
	.word 0xe2eaabac  ! 532: LDSTUBA_I	ldstuba	%r17, [%r10 + 0x0bac] %asi
	.word 0x20800001  ! 533: BN	bn,a	<label_0x1>
	.word 0xc2f2900b  ! 534: STXA_R	stxa	%r1, [%r10 + %r11] 0x80
	.word 0xc3eaab60  ! 535: PREFETCHA_I	prefetcha	[%r10, + 0x0b60] %asi, #one_read
	.word 0x936a800b  ! 537: SDIVX_R	sdivx	%r10, %r11, %r9
	.word 0xd2b2ab90  ! 538: STHA_I	stha	%r9, [%r10 + 0x0b90] %asi
	.word 0xf282900b  ! 539: LDUWA_R	lduwa	[%r10, %r11] 0x80, %r25
	.word 0xf8f2ae80  ! 540: STXA_I	stxa	%r28, [%r10 + 0x0e80] %asi
	.word 0x8fdaac94  ! 541: FLUSH_I	dis not found

	.word 0x87a288ab  ! 542: FSUBs	fsubs	%f10, %f11, %f3
	.word 0xc49aa048  ! 543: LDDA_I	ldda	[%r10, + 0x0048] %asi, %r2
	.word 0xc86a800b  ! 545: LDSTUB_R	ldstub	%r4, [%r10 + %r11]
	.word 0xca4aa02c  ! 546: LDSB_I	ldsb	[%r10 + 0x002c], %r5
	.word 0xc922a1b0  ! 547: STF_I	st	%f4, [0x01b0, %r10]
	.word 0xaed2a17c  ! 548: UMULcc_I	umulcc 	%r10, 0x017c, %r23
	.word 0x8ddaa064  ! 549: FLUSH_I	dis not found

	.word 0xc4c2900b  ! 550: LDSWA_R	ldswa	[%r10, %r11] 0x80, %r2
	.word 0x0cc20001  ! 551: BRGZ	brgz  ,nt	%8,<label_0x20001>
	.word 0x8ed2800b  ! 552: UMULcc_R	umulcc 	%r10, %r11, %r7
	.word 0x36800001  ! 553: BGE	bge,a	<label_0x1>
	.word 0x00800001  ! 554: BN	bn  	<label_0x1>
	.word 0xe8ea900b  ! 555: LDSTUBA_R	ldstuba	%r20, [%r10 + %r11] 0x80
	.word 0x8672800b  ! 556: UDIV_R	udiv 	%r10, %r11, %r3
	.word 0xd1e2a00b  ! 557: CASA_R	casa	[%r10] %asi, %r11, %r8
	.word 0xcaa2a3a8  ! 558: STWA_I	stwa	%r5, [%r10 + 0x03a8] %asi
	.word 0xe4caae74  ! 559: LDSBA_I	ldsba	[%r10, + 0x0e74] %asi, %r18
	.word 0x8522800b  ! 560: MULScc_R	mulscc 	%r10, %r11, %r2
	.word 0xc3eaa304  ! 561: PREFETCHA_I	prefetcha	[%r10, + 0x0304] %asi, #one_read
	.word 0x87da800b  ! 562: FLUSH_R	dis not found

	.word 0xc722800b  ! 563: STF_R	st	%f3, [%r11, %r10]
	.word 0xcc6aa100  ! 564: LDSTUB_I	ldstub	%r6, [%r10 + 0x0100]
	.word 0xfa82aaac  ! 565: LDUWA_I	lduwa	[%r10, + 0x0aac] %asi, %r29
	.word 0xcc82a36c  ! 566: LDUWA_I	lduwa	[%r10, + 0x036c] %asi, %r6
	.word 0x8143c000  ! 567: STBAR	stbar
	.word 0xd0caaebc  ! 568: LDSBA_I	ldsba	[%r10, + 0x0ebc] %asi, %r8
	.word 0xc6f2a238  ! 569: STXA_I	stxa	%r3, [%r10 + 0x0238] %asi
	.word 0xc652a3ec  ! 570: LDSH_I	ldsh	[%r10 + 0x03ec], %r3
	.word 0x8afaaf8c  ! 571: SDIVcc_I	sdivcc 	%r10, 0x0f8c, %r5
	.word 0x92da800b  ! 572: SMULcc_R	smulcc 	%r10, %r11, %r9
	.word 0xbbdaa238  ! 573: FLUSH_I	dis not found

	.word 0xd292a048  ! 574: LDUHA_I	lduha	[%r10, + 0x0048] %asi, %r9
	.word 0xcc9aa5f0  ! 575: LDDA_I	ldda	[%r10, + 0x05f0] %asi, %r6
	.word 0xe6fa900b  ! 576: SWAPA_R	swapa	%r19, [%r10 + %r11] 0x80
	.word 0x88d2a194  ! 577: UMULcc_I	umulcc 	%r10, 0x0194, %r4
	.word 0xc40a800b  ! 578: LDUB_R	ldub	[%r10 + %r11], %r2
	.word 0xe2c2ae54  ! 579: LDSWA_I	ldswa	[%r10, + 0x0e54] %asi, %r17
	.word 0xa6fa800b  ! 580: SDIVcc_R	sdivcc 	%r10, %r11, %r19
	.word 0x89a2882b  ! 581: FADDs	fadds	%f10, %f11, %f4
	.word 0xecb2900b  ! 582: STHA_R	stha	%r22, [%r10 + %r11] 0x80
	.word 0x8143e04c  ! 583: MEMBAR	membar	#LoadStore | #StoreStore | #Sync 
	.word 0x885a800b  ! 584: SMUL_R	smul 	%r10, %r11, %r4
	.word 0x85a289ab  ! 585: FDIVs	fdivs	%f10, %f11, %f2
	.word 0x9122800b  ! 586: MULScc_R	mulscc 	%r10, %r11, %r8
	.word 0xcd3a800b  ! 587: STDF_R	std	%f6, [%r11, %r10]
	.word 0x82d2800b  ! 588: UMULcc_R	umulcc 	%r10, %r11, %r1
	.word 0xccea900b  ! 589: LDSTUBA_R	ldstuba	%r6, [%r10 + %r11] 0x80
	.word 0xceb2900b  ! 590: STHA_R	stha	%r7, [%r10 + %r11] 0x80
	.word 0xd07aa6d8  ! 591: SWAP_I	swap	%r8, [%r10 + 0x06d8]
	.word 0x8fa2882b  ! 592: FADDs	fadds	%f10, %f11, %f7
	.word 0xe8c2a2f8  ! 593: LDSWA_I	ldswa	[%r10, + 0x02f8] %asi, %r20
	.word 0xce82900b  ! 594: LDUWA_R	lduwa	[%r10, %r11] 0x80, %r7
	.word 0xb67a800b  ! 595: SDIV_R	sdiv 	%r10, %r11, %r27
	.word 0x2ac20003  ! 596: BRNZ	brnz,a,nt	%8,<label_0x20003>
	.word 0x3a800001  ! 597: BCC	bcc,a	<label_0x1>
	.word 0xc36a800b  ! 598: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x8143c000  ! 599: STBAR	stbar
	.word 0xc64a800b  ! 601: LDSB_R	ldsb	[%r10 + %r11], %r3
	.word 0x8143c000  ! 602: STBAR	stbar
	stxa	%r0, [%r10 + %r11] 0x80	
	.word 0x00800003  ! 605: BN	bn  	<label_0x3>
	.word 0x886aa6f0  ! 606: UDIVX_I	udivx 	%r10, 0x06f0, %r4
	.word 0x9ad2af04  ! 607: UMULcc_I	umulcc 	%r10, 0x0f04, %r13
	.word 0x8143c000  ! 609: STBAR	stbar
	.word 0xc88aa28c  ! 610: LDUBA_I	lduba	[%r10, + 0x028c] %asi, %r4
	.word 0xc33a800b  ! 611: STDF_R	std	%f1, [%r11, %r10]
	.word 0x82faa990  ! 612: SDIVcc_I	sdivcc 	%r10, 0x0990, %r1
	.word 0x8ddaa14c  ! 613: FLUSH_I	dis not found

	.word 0xcc6aaec4  ! 614: LDSTUB_I	ldstub	%r6, [%r10 + 0x0ec4]
	.word 0x89a289ab  ! 615: FDIVs	fdivs	%f10, %f11, %f4
	.word 0xfd22a21c  ! 616: STF_I	st	%f30, [0x021c, %r10]
	.word 0xcec2a370  ! 617: LDSWA_I	ldswa	[%r10, + 0x0370] %asi, %r7
	.word 0x8c72a188  ! 618: UDIV_I	udiv 	%r10, 0x0188, %r6
	.word 0x8143e019  ! 619: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside 
	.word 0x2eca0001  ! 620: BRGEZ	brgez,a,pt	%8,<label_0xa0001>
	.word 0xc452a6a8  ! 621: LDSH_I	ldsh	[%r10 + 0x06a8], %r2
	.word 0x8cfaa61c  ! 622: SDIVcc_I	sdivcc 	%r10, 0x061c, %r6
	.word 0xc3ea900b  ! 623: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0xc2ea900b  ! 624: LDSTUBA_R	ldstuba	%r1, [%r10 + %r11] 0x80
	.word 0xa072800b  ! 625: UDIV_R	udiv 	%r10, %r11, %r16
	.word 0xe5e2a00b  ! 626: CASA_R	casa	[%r10] %asi, %r11, %r18
	.word 0x8e72a750  ! 627: UDIV_I	udiv 	%r10, 0x0750, %r7
	.word 0xdaa2ac18  ! 628: STWA_I	stwa	%r13, [%r10 + 0x0c18] %asi
	.word 0x24800001  ! 629: BLE	ble,a	<label_0x1>
	.word 0x93daa37c  ! 631: FLUSH_I	dis not found

	.word 0x91a2882b  ! 632: FADDs	fadds	%f10, %f11, %f8
	.word 0xf412800b  ! 633: LDUH_R	lduh	[%r10 + %r11], %r26
	stxa	%r6, [%r10 + 0x0fa8] %asi	
	.word 0xce5aa238  ! 635: LDX_I	ldx	[%r10 + 0x0238], %r7
	.word 0x89da800b  ! 636: FLUSH_R	dis not found

	.word 0xc3ea900b  ! 637: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0xd2da900b  ! 638: LDXA_R	ldxa	[%r10, %r11] 0x80, %r9
	.word 0xbddaaa68  ! 639: FLUSH_I	dis not found

	.word 0x34800001  ! 640: BG	bg,a	<label_0x1>
	.word 0xc44a800b  ! 641: LDSB_R	ldsb	[%r10 + %r11], %r2
	.word 0x8143e023  ! 642: MEMBAR	membar	#LoadLoad | #StoreLoad | #MemIssue 
	.word 0xdb3a800b  ! 643: STDF_R	std	%f13, [%r11, %r10]
	.word 0xf85aa478  ! 644: LDX_I	ldx	[%r10 + 0x0478], %r28
	.word 0xcbe2a00b  ! 645: CASA_R	casa	[%r10] %asi, %r11, %r5
	.word 0x24800003  ! 646: BLE	ble,a	<label_0x3>
	.word 0xc28a900b  ! 647: LDUBA_R	lduba	[%r10, %r11] 0x80, %r1
	.word 0xd0b2900b  ! 648: STHA_R	stha	%r8, [%r10 + %r11] 0x80
	.word 0xd24aa4a8  ! 649: LDSB_I	ldsb	[%r10 + 0x04a8], %r9
	.word 0xa4f2800b  ! 650: UDIVcc_R	udivcc 	%r10, %r11, %r18
	.word 0xcd3a800b  ! 651: STDF_R	std	%f6, [%r11, %r10]
	.word 0x8143e01a  ! 652: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside 
	.word 0xf8b2a064  ! 653: STHA_I	stha	%r28, [%r10 + 0x0064] %asi
	.word 0xc2faa008  ! 654: SWAPA_I	swapa	%r1, [%r10 + 0x0008] %asi
	.word 0x8143c000  ! 655: STBAR	stbar
	.word 0xec82aa48  ! 656: LDUWA_I	lduwa	[%r10, + 0x0a48] %asi, %r22
	.word 0xf04aac50  ! 657: LDSB_I	ldsb	[%r10 + 0x0c50], %r24
	.word 0xd292900b  ! 658: LDUHA_R	lduha	[%r10, %r11] 0x80, %r9
	.word 0x8143c000  ! 659: STBAR	stbar
	.word 0x8da2882b  ! 660: FADDs	fadds	%f10, %f11, %f6
	.word 0x26ca0001  ! 661: BRLZ	brlz,a,pt	%8,<label_0xa0001>
	.word 0x82f2800b  ! 662: UDIVcc_R	udivcc 	%r10, %r11, %r1
	.word 0x0cc20001  ! 663: BRGZ	brgz  ,nt	%8,<label_0x20001>
	.word 0x26c20001  ! 664: BRLZ	brlz,a,nt	%8,<label_0x20001>
	.word 0x93a2882b  ! 665: FADDs	fadds	%f10, %f11, %f9
	.word 0x30800001  ! 666: BA	ba,a	<label_0x1>
	.word 0x9fda800b  ! 667: FLUSH_R	dis not found

	.word 0xc442aaf0  ! 668: LDSW_I	ldsw	[%r10 + 0x0af0], %r2
	.word 0xafa2882b  ! 669: FADDs	fadds	%f10, %f11, %f23
	.word 0xdff2a00b  ! 670: CASXA_R	casxa	[%r10]%asi, %r11, %r15
	.word 0xd0b2900b  ! 671: STHA_R	stha	%r8, [%r10 + %r11] 0x80
	.word 0xc36a800b  ! 672: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x8ddaa844  ! 673: FLUSH_I	dis not found

	.word 0xc442acac  ! 674: LDSW_I	ldsw	[%r10 + 0x0cac], %r2
	.word 0x89daab84  ! 675: FLUSH_I	dis not found

	.word 0x9072a048  ! 676: UDIV_I	udiv 	%r10, 0x0048, %r8
	.word 0x8143e016  ! 677: MEMBAR	membar	#StoreLoad | #LoadStore | #Lookaside 
	.word 0xe47aaab0  ! 679: SWAP_I	swap	%r18, [%r10 + 0x0ab0]
	.word 0x1a800003  ! 680: BCC	bcc  	<label_0x3>
	.word 0xca02800b  ! 681: LDUW_R	lduw	[%r10 + %r11], %r5
	.word 0xa45a800b  ! 682: SMUL_R	smul 	%r10, %r11, %r18
	.word 0xd0ca900b  ! 683: LDSBA_R	ldsba	[%r10, %r11] 0x80, %r8
	.word 0xe1e2a00b  ! 684: CASA_R	casa	[%r10] %asi, %r11, %r16
	.word 0x8143e059  ! 685: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside | #Sync 
	.word 0x22800001  ! 686: BE	be,a	<label_0x1>
	.word 0x916a800b  ! 687: SDIVX_R	sdivx	%r10, %r11, %r8
	.word 0x904aa124  ! 688: MULX_I	mulx 	%r10, 0x0124, %r8
	.word 0x30800001  ! 689: BA	ba,a	<label_0x1>
	.word 0xc09aab60  ! 690: LDDA_I	ldda	[%r10, + 0x0b60] %asi, %r0
	.word 0xde92a494  ! 691: LDUHA_I	lduha	[%r10, + 0x0494] %asi, %r15
	.word 0xce42a63c  ! 692: LDSW_I	ldsw	[%r10 + 0x063c], %r7
	.word 0xe5e2900b  ! 693: CASA_I	casa	[%r10] 0x80, %r11, %r18
	.word 0x93daa424  ! 694: FLUSH_I	dis not found

	.word 0x8322800b  ! 695: MULScc_R	mulscc 	%r10, %r11, %r1
	.word 0xca92900b  ! 696: LDUHA_R	lduha	[%r10, %r11] 0x80, %r5
	.word 0xd13aa750  ! 697: STDF_I	std	%f8, [0x0750, %r10]
	.word 0xdc12800b  ! 698: LDUH_R	lduh	[%r10 + %r11], %r14
	.word 0x8c72800b  ! 699: UDIV_R	udiv 	%r10, %r11, %r6
	.word 0x9af2a05c  ! 700: UDIVcc_I	udivcc 	%r10, 0x005c, %r13
	.word 0xc2b2900b  ! 701: STHA_R	stha	%r1, [%r10 + %r11] 0x80
	.word 0xc36a800b  ! 702: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x24800001  ! 703: BLE	ble,a	<label_0x1>
	.word 0x8143e079  ! 704: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xd8ea900b  ! 706: LDSTUBA_R	ldstuba	%r12, [%r10 + %r11] 0x80
	.word 0xa9da800b  ! 707: FLUSH_R	dis not found

	.word 0xc6f2ac60  ! 708: STXA_I	stxa	%r3, [%r10 + 0x0c60] %asi
	.word 0xde92a348  ! 709: LDUHA_I	lduha	[%r10, + 0x0348] %asi, %r15
	.word 0xb1da800b  ! 710: FLUSH_R	dis not found

	.word 0x00800003  ! 711: BN	bn  	<label_0x3>
	.word 0x8143e030  ! 712: MEMBAR	membar	#Lookaside | #MemIssue 
	.word 0x8143c000  ! 713: STBAR	stbar
	.word 0xc922800b  ! 714: STF_R	st	%f4, [%r11, %r10]
	.word 0xf602a6fc  ! 715: LDUW_I	lduw	[%r10 + 0x06fc], %r27
	.word 0xc36aa1a0  ! 716: PREFETCH_I	prefetch	[%r10 + 0x01a0], #one_read
	.word 0xd93a800b  ! 717: STDF_R	std	%f12, [%r11, %r10]
	.word 0xf0eaa23c  ! 718: LDSTUBA_I	ldstuba	%r24, [%r10 + 0x023c] %asi
	.word 0x9052800b  ! 719: UMUL_R	umul 	%r10, %r11, %r8
	.word 0xd0fa900b  ! 720: SWAPA_R	swapa	%r8, [%r10 + %r11] 0x80
	.word 0xca02800b  ! 722: LDUW_R	lduw	[%r10 + %r11], %r5
	.word 0x8cfa800b  ! 723: SDIVcc_R	sdivcc 	%r10, %r11, %r6
	.word 0x926aab68  ! 724: UDIVX_I	udivx 	%r10, 0x0b68, %r9
	.word 0xcef2900b  ! 725: STXA_R	stxa	%r7, [%r10 + %r11] 0x80
	.word 0x85daaebc  ! 726: FLUSH_I	dis not found

	.word 0x84faa848  ! 727: SDIVcc_I	sdivcc 	%r10, 0x0848, %r2
	.word 0xb65aa2e4  ! 728: SMUL_I	smul 	%r10, 0x02e4, %r27
	.word 0xe2da900b  ! 729: LDXA_R	ldxa	[%r10, %r11] 0x80, %r17
	.word 0x24800001  ! 730: BLE	ble,a	<label_0x1>
	.word 0xc9e2a00b  ! 731: CASA_R	casa	[%r10] %asi, %r11, %r4
	.word 0xa8da800b  ! 732: SMULcc_R	smulcc 	%r10, %r11, %r20
	.word 0xdf3a800b  ! 733: STDF_R	std	%f15, [%r11, %r10]
	.word 0x8143c000  ! 734: STBAR	stbar
	.word 0xc3eaa728  ! 735: PREFETCHA_I	prefetcha	[%r10, + 0x0728] %asi, #one_read
	.word 0x83a2892b  ! 736: FMULs	fmuls	%f10, %f11, %f1
	.word 0xd2eaa914  ! 737: LDSTUBA_I	ldstuba	%r9, [%r10 + 0x0914] %asi
	.word 0xc8aa900b  ! 738: STBA_R	stba	%r4, [%r10 + %r11] 0x80
	.word 0x85daab80  ! 739: FLUSH_I	dis not found

	.word 0xd2d2900b  ! 740: LDSHA_R	ldsha	[%r10, %r11] 0x80, %r9
	.word 0xa0d2aaa4  ! 742: UMULcc_I	umulcc 	%r10, 0x0aa4, %r16
	.word 0x847a800b  ! 743: SDIV_R	sdiv 	%r10, %r11, %r2
	.word 0xf6aa900b  ! 744: STBA_R	stba	%r27, [%r10 + %r11] 0x80
	.word 0x925a800b  ! 745: SMUL_R	smul 	%r10, %r11, %r9
	.word 0xb3da800b  ! 746: FLUSH_R	dis not found

	.word 0x8143e05a  ! 747: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside | #Sync 
	.word 0x845aadb8  ! 748: SMUL_I	smul 	%r10, 0x0db8, %r2
	.word 0xc3e2900b  ! 749: CASA_I	casa	[%r10] 0x80, %r11, %r1
	.word 0xc73aae58  ! 750: STDF_I	std	%f3, [0x0e58, %r10]
	.word 0x92da800b  ! 751: SMULcc_R	smulcc 	%r10, %r11, %r9
	.word 0x8c7aafac  ! 752: SDIV_I	sdiv 	%r10, 0x0fac, %r6
	.word 0x85a2892b  ! 753: FMULs	fmuls	%f10, %f11, %f2
	.word 0xa1daa53c  ! 754: FLUSH_I	dis not found

	.word 0xbba2882b  ! 755: FADDs	fadds	%f10, %f11, %f29
	.word 0x34800001  ! 756: BG	bg,a	<label_0x1>
	.word 0x8143e062  ! 757: MEMBAR	membar	#StoreLoad | #MemIssue | #Sync 
	.word 0xcb3aae58  ! 758: STDF_I	std	%f5, [0x0e58, %r10]
	.word 0xa45aa364  ! 759: SMUL_I	smul 	%r10, 0x0364, %r18
	.word 0x8143c000  ! 760: STBAR	stbar
	.word 0x8143c000  ! 761: STBAR	stbar
	.word 0xce02800b  ! 762: LDUW_R	lduw	[%r10 + %r11], %r7
	.word 0xb452800b  ! 763: UMUL_R	umul 	%r10, %r11, %r26
	.word 0xe1e2900b  ! 764: CASA_I	casa	[%r10] 0x80, %r11, %r16
	.word 0x02800003  ! 765: BE	be  	<label_0x3>
	.word 0xbefaa244  ! 766: SDIVcc_I	sdivcc 	%r10, 0x0244, %r31
	.word 0xc3eaa8e4  ! 767: PREFETCHA_I	prefetcha	[%r10, + 0x08e4] %asi, #one_read
	.word 0xa3daae7c  ! 768: FLUSH_I	dis not found

	.word 0x22800003  ! 769: BE	be,a	<label_0x3>
	.word 0x8143c000  ! 770: STBAR	stbar
	stxa	%r6, [%r10 + %r11] 0x80	
	.word 0xd122a920  ! 772: STF_I	st	%f8, [0x0920, %r10]
	.word 0x8143e004  ! 773: MEMBAR	membar	#LoadStore 
	.word 0xdbf2900b  ! 774: CASXA_I	casxa	[%r10] 0x80, %r11, %r13
	.word 0xd09aa598  ! 775: LDDA_I	ldda	[%r10, + 0x0598] %asi, %r8
	.word 0x93daa4e8  ! 776: FLUSH_I	dis not found

	.word 0xc6a2900b  ! 777: STWA_R	stwa	%r3, [%r10 + %r11] 0x80
	.word 0xc4c2900b  ! 778: LDSWA_R	ldswa	[%r10, %r11] 0x80, %r2
	.word 0xe33aabf0  ! 779: STDF_I	std	%f17, [0x0bf0, %r10]
	.word 0xc3eaa5a8  ! 780: PREFETCHA_I	prefetcha	[%r10, + 0x05a8] %asi, #one_read
	.word 0xcdf2900b  ! 781: CASXA_I	casxa	[%r10] 0x80, %r11, %r6
	.word 0x83a289ab  ! 782: FDIVs	fdivs	%f10, %f11, %f1
	.word 0x34800001  ! 783: BG	bg,a	<label_0x1>
	.word 0x91a289ab  ! 784: FDIVs	fdivs	%f10, %f11, %f8
	.word 0x9e7a800b  ! 785: SDIV_R	sdiv 	%r10, %r11, %r15
	.word 0x824a800b  ! 787: MULX_R	mulx 	%r10, %r11, %r1
	.word 0x8143c000  ! 788: STBAR	stbar
	.word 0xc6a2ab24  ! 789: STWA_I	stwa	%r3, [%r10 + 0x0b24] %asi
	.word 0xcc8aa3e4  ! 790: LDUBA_I	lduba	[%r10, + 0x03e4] %asi, %r6
	.word 0xc2d2900b  ! 791: LDSHA_R	ldsha	[%r10, %r11] 0x80, %r1
	.word 0x22800001  ! 792: BE	be,a	<label_0x1>
	.word 0x8143e074  ! 793: MEMBAR	membar	#LoadStore | #Lookaside | #MemIssue | #Sync 
	.word 0xfca2a5b0  ! 794: STWA_I	stwa	%r30, [%r10 + 0x05b0] %asi
	.word 0x02c20001  ! 795: BRZ	brz  ,nt	%8,<label_0x20001>
	.word 0xbba2892b  ! 796: FMULs	fmuls	%f10, %f11, %f29
	.word 0xbcd2800b  ! 797: UMULcc_R	umulcc 	%r10, %r11, %r30
	.word 0xc36a800b  ! 798: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x3e800001  ! 799: BVC	bvc,a	<label_0x1>
	.word 0xaada800b  ! 800: SMULcc_R	smulcc 	%r10, %r11, %r21
	.word 0xbdda800b  ! 801: FLUSH_R	dis not found

	.word 0xcbe2a00b  ! 802: CASA_R	casa	[%r10] %asi, %r11, %r5
	.word 0x38800001  ! 803: BGU	bgu,a	<label_0x1>
	.word 0xc6daa848  ! 804: LDXA_I	ldxa	[%r10, + 0x0848] %asi, %r3
	.word 0x89da800b  ! 805: FLUSH_R	dis not found

	.word 0x8143c000  ! 806: STBAR	stbar
	.word 0x826a800b  ! 807: UDIVX_R	udivx 	%r10, %r11, %r1
	.word 0xc8b2900b  ! 808: STHA_R	stha	%r4, [%r10 + %r11] 0x80
	.word 0xc87aa884  ! 809: SWAP_I	swap	%r4, [%r10 + 0x0884]
	.word 0xe0ea900b  ! 810: LDSTUBA_R	ldstuba	%r16, [%r10 + %r11] 0x80
	.word 0x89da800b  ! 811: FLUSH_R	dis not found

	.word 0xc652800b  ! 812: LDSH_R	ldsh	[%r10 + %r11], %r3
	.word 0xca02800b  ! 813: LDUW_R	lduw	[%r10 + %r11], %r5
	.word 0x8bdaa038  ! 814: FLUSH_I	dis not found

	.word 0x2ac20003  ! 815: BRNZ	brnz,a,nt	%8,<label_0x20003>
	.word 0xa4da800b  ! 816: SMULcc_R	smulcc 	%r10, %r11, %r18
	.word 0xc49a900b  ! 817: LDDA_R	ldda	[%r10, %r11] 0x80, %r2
	.word 0xcde2a00b  ! 818: CASA_R	casa	[%r10] %asi, %r11, %r6
	.word 0xabda800b  ! 819: FLUSH_R	dis not found

	.word 0xc3ea900b  ! 820: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0x82f2a094  ! 821: UDIVcc_I	udivcc 	%r10, 0x0094, %r1
	.word 0x864aaa90  ! 822: MULX_I	mulx 	%r10, 0x0a90, %r3
	.word 0xa5da800b  ! 823: FLUSH_R	dis not found

	.word 0xc842a9d8  ! 824: LDSW_I	ldsw	[%r10 + 0x09d8], %r4
	.word 0xe402abb8  ! 825: LDUW_I	lduw	[%r10 + 0x0bb8], %r18
	.word 0xfbf2900b  ! 826: CASXA_I	casxa	[%r10] 0x80, %r11, %r29
	.word 0x8143e05a  ! 827: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside | #Sync 
	.word 0x825aa32c  ! 828: SMUL_I	smul 	%r10, 0x032c, %r1
	.word 0xc8b2900b  ! 829: STHA_R	stha	%r4, [%r10 + %r11] 0x80
	.word 0x905aa4c0  ! 830: SMUL_I	smul 	%r10, 0x04c0, %r8
	.word 0x8143c000  ! 831: STBAR	stbar
	stxa	%r4, [%r10 + %r11] 0x80	
	.word 0x83daa77c  ! 833: FLUSH_I	dis not found

	.word 0x2e800001  ! 834: BVS	bvs,a	<label_0x1>
	.word 0x8143c000  ! 835: STBAR	stbar
	.word 0xceb2a55c  ! 836: STHA_I	stha	%r7, [%r10 + 0x055c] %asi
	.word 0xa05a800b  ! 837: SMUL_R	smul 	%r10, %r11, %r16
	.word 0xc882a4c4  ! 838: LDUWA_I	lduwa	[%r10, + 0x04c4] %asi, %r4
	.word 0xaba2892b  ! 839: FMULs	fmuls	%f10, %f11, %f21
	.word 0x89a2892b  ! 840: FMULs	fmuls	%f10, %f11, %f4
	.word 0xce92a5b4  ! 841: LDUHA_I	lduha	[%r10, + 0x05b4] %asi, %r7
	.word 0x90d2800b  ! 842: UMULcc_R	umulcc 	%r10, %r11, %r8
	.word 0xc812ae70  ! 843: LDUH_I	lduh	[%r10 + 0x0e70], %r4
	.word 0x8a5aae14  ! 844: SMUL_I	smul 	%r10, 0x0e14, %r5
	.word 0xd08a900b  ! 845: LDUBA_R	lduba	[%r10, %r11] 0x80, %r8
	.word 0xd24aaa38  ! 846: LDSB_I	ldsb	[%r10 + 0x0a38], %r9
	.word 0x86daa698  ! 847: SMULcc_I	smulcc 	%r10, 0x0698, %r3
	.word 0xc3eaa8d4  ! 848: PREFETCHA_I	prefetcha	[%r10, + 0x08d4] %asi, #one_read
	.word 0x87daad3c  ! 849: FLUSH_I	dis not found

	.word 0xc73a800b  ! 850: STDF_R	std	%f3, [%r11, %r10]
	.word 0x18800003  ! 851: BGU	bgu  	<label_0x3>
	.word 0x8652800b  ! 853: UMUL_R	umul 	%r10, %r11, %r3
	.word 0x8c6aace4  ! 854: UDIVX_I	udivx 	%r10, 0x0ce4, %r6
	.word 0x82f2800b  ! 855: UDIVcc_R	udivcc 	%r10, %r11, %r1
	.word 0xc8c2900b  ! 856: LDSWA_R	ldswa	[%r10, %r11] 0x80, %r4
	.word 0xbbdaaa1c  ! 857: FLUSH_I	dis not found

	.word 0x8ddaafdc  ! 858: FLUSH_I	dis not found

	stxa	%r2, [%r10 + 0x0288] %asi	
	.word 0x24ca0003  ! 860: BRLEZ	brlez,a,pt	%8,<label_0xa0003>
	.word 0x89a2892b  ! 861: FMULs	fmuls	%f10, %f11, %f4
	.word 0x90f2ad24  ! 862: UDIVcc_I	udivcc 	%r10, 0x0d24, %r8
	.word 0xc86a800b  ! 863: LDSTUB_R	ldstub	%r4, [%r10 + %r11]
	.word 0xf06aab6c  ! 864: LDSTUB_I	ldstub	%r24, [%r10 + 0x0b6c]
	.word 0xe2b2900b  ! 865: STHA_R	stha	%r17, [%r10 + %r11] 0x80
	.word 0xded2a248  ! 866: LDSHA_I	ldsha	[%r10, + 0x0248] %asi, %r15
	.word 0x1a800003  ! 867: BCC	bcc  	<label_0x3>
	.word 0x8143c000  ! 868: STBAR	stbar
	.word 0xaafa800b  ! 869: SDIVcc_R	sdivcc 	%r10, %r11, %r21
	.word 0xeea2a5ac  ! 870: STWA_I	stwa	%r23, [%r10 + 0x05ac] %asi
	.word 0xc53aa020  ! 871: STDF_I	std	%f2, [0x0020, %r10]
	.word 0x8143e006  ! 872: MEMBAR	membar	#StoreLoad | #LoadStore 
	.word 0xa872a3cc  ! 873: UDIV_I	udiv 	%r10, 0x03cc, %r20
	.word 0x8143c000  ! 874: STBAR	stbar
	.word 0xf0f2aa80  ! 875: STXA_I	stxa	%r24, [%r10 + 0x0a80] %asi
	.word 0xcada900b  ! 876: LDXA_R	ldxa	[%r10, %r11] 0x80, %r5
	.word 0xf64a800b  ! 877: LDSB_R	ldsb	[%r10 + %r11], %r27
	.word 0xc36aa810  ! 878: PREFETCH_I	prefetch	[%r10 + 0x0810], #one_read
	.word 0xc612ab0c  ! 879: LDUH_I	lduh	[%r10 + 0x0b0c], %r3
	.word 0x845a800b  ! 880: SMUL_R	smul 	%r10, %r11, %r2
	.word 0x8143c000  ! 881: STBAR	stbar
	.word 0xa7da800b  ! 882: FLUSH_R	dis not found

	.word 0x8ad2800b  ! 884: UMULcc_R	umulcc 	%r10, %r11, %r5
	.word 0xdc1a800b  ! 885: LDD_R	ldd	[%r10 + %r11], %r14
	.word 0xbc52800b  ! 886: UMUL_R	umul 	%r10, %r11, %r30
	.word 0x82d2800b  ! 887: UMULcc_R	umulcc 	%r10, %r11, %r1
	stxa	%r6, [%r10 + %r11] 0x80	
	.word 0x40000001  ! 890: CALL	call	disp30_1
	.word 0xc202a2e8  ! 891: LDUW_I	lduw	[%r10 + 0x02e8], %r1
	.word 0xc36a800b  ! 892: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x83da800b  ! 893: FLUSH_R	dis not found

	.word 0x846a800b  ! 895: UDIVX_R	udivx 	%r10, %r11, %r2
	.word 0xcc52800b  ! 896: LDSH_R	ldsh	[%r10 + %r11], %r6
	.word 0x8143e07b  ! 897: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0x86f2a25c  ! 898: UDIVcc_I	udivcc 	%r10, 0x025c, %r3
	.word 0x8143e013  ! 899: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside 
	.word 0xd1f2900b  ! 900: CASXA_I	casxa	[%r10] 0x80, %r11, %r8
	.word 0xd2daa9c0  ! 901: LDXA_I	ldxa	[%r10, + 0x09c0] %asi, %r9
	.word 0x04800001  ! 902: BLE	ble  	<label_0x1>
	.word 0x8143e042  ! 903: MEMBAR	membar	#StoreLoad | #Sync 
	.word 0x2a800001  ! 904: BCS	bcs,a	<label_0x1>
	.word 0xc3ea900b  ! 905: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0x8efa800b  ! 906: SDIVcc_R	sdivcc 	%r10, %r11, %r7
	.word 0x24800001  ! 907: BLE	ble,a	<label_0x1>
	.word 0x91a2892b  ! 908: FMULs	fmuls	%f10, %f11, %f8
	.word 0xca0aa068  ! 909: LDUB_I	ldub	[%r10 + 0x0068], %r5
	.word 0xcca2900b  ! 910: STWA_R	stwa	%r6, [%r10 + %r11] 0x80
	.word 0xcc4a800b  ! 911: LDSB_R	ldsb	[%r10 + %r11], %r6
	.word 0x8143e073  ! 912: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside | #MemIssue | #Sync 
	.word 0xbc52800b  ! 913: UMUL_R	umul 	%r10, %r11, %r30
	.word 0x86fa800b  ! 914: SDIVcc_R	sdivcc 	%r10, %r11, %r3
	.word 0x92daacdc  ! 915: SMULcc_I	smulcc 	%r10, 0x0cdc, %r9
	.word 0x896a800b  ! 916: SDIVX_R	sdivx	%r10, %r11, %r4
	.word 0x89a288ab  ! 917: FSUBs	fsubs	%f10, %f11, %f4
	.word 0x91a289ab  ! 918: FDIVs	fdivs	%f10, %f11, %f8
	.word 0xc4aa900b  ! 919: STBA_R	stba	%r2, [%r10 + %r11] 0x80
	.word 0x9e52a77c  ! 920: UMUL_I	umul 	%r10, 0x077c, %r15
	.word 0x20800001  ! 921: BN	bn,a	<label_0x1>
	.word 0x8522ac2c  ! 922: MULScc_I	mulscc 	%r10, 0x0c2c, %r2
	.word 0x93a2892b  ! 923: FMULs	fmuls	%f10, %f11, %f9
	.word 0xc26aa80c  ! 924: LDSTUB_I	ldstub	%r1, [%r10 + 0x080c]
	.word 0xc46aa1a4  ! 925: LDSTUB_I	ldstub	%r2, [%r10 + 0x01a4]
	.word 0x83daab5c  ! 926: FLUSH_I	dis not found

	.word 0xf452800b  ! 927: LDSH_R	ldsh	[%r10 + %r11], %r26
	.word 0xd252800b  ! 928: LDSH_R	ldsh	[%r10 + %r11], %r9
	.word 0xcf3aaf98  ! 929: STDF_I	std	%f7, [0x0f98, %r10]
	.word 0x86daaa6c  ! 930: SMULcc_I	smulcc 	%r10, 0x0a6c, %r3
	.word 0xeb3a800b  ! 931: STDF_R	std	%f21, [%r11, %r10]
	.word 0xafda800b  ! 932: FLUSH_R	dis not found

	.word 0xc36aa94c  ! 933: PREFETCH_I	prefetch	[%r10 + 0x094c], #one_read
	.word 0x8143c000  ! 934: STBAR	stbar
	.word 0xae72adbc  ! 935: UDIV_I	udiv 	%r10, 0x0dbc, %r23
	.word 0x867aa5fc  ! 937: SDIV_I	sdiv 	%r10, 0x05fc, %r3
	.word 0x86f2afe4  ! 938: UDIVcc_I	udivcc 	%r10, 0x0fe4, %r3
	.word 0x8e5aaca4  ! 939: SMUL_I	smul 	%r10, 0x0ca4, %r7
	.word 0xcccaa608  ! 940: LDSBA_I	ldsba	[%r10, + 0x0608] %asi, %r6
	.word 0x84fa800b  ! 941: SDIVcc_R	sdivcc 	%r10, %r11, %r2
	.word 0xee92a0c0  ! 942: LDUHA_I	lduha	[%r10, + 0x00c0] %asi, %r23
	.word 0xc49a900b  ! 943: LDDA_R	ldda	[%r10, %r11] 0x80, %r2
	.word 0xc252800b  ! 944: LDSH_R	ldsh	[%r10 + %r11], %r1
	.word 0x87a2892b  ! 945: FMULs	fmuls	%f10, %f11, %f3
	.word 0xd0b2900b  ! 946: STHA_R	stha	%r8, [%r10 + %r11] 0x80
	.word 0xa7daaa6c  ! 947: FLUSH_I	dis not found

	.word 0x8143c000  ! 948: STBAR	stbar
	.word 0xc3e2a00b  ! 949: CASA_R	casa	[%r10] %asi, %r11, %r1
	.word 0xf07aa46c  ! 950: SWAP_I	swap	%r24, [%r10 + 0x046c]
	.word 0xb5a2892b  ! 951: FMULs	fmuls	%f10, %f11, %f26
	.word 0xc2b2900b  ! 952: STHA_R	stha	%r1, [%r10 + %r11] 0x80
	.word 0xcd3aad58  ! 953: STDF_I	std	%f6, [0x0d58, %r10]
	.word 0x8143c000  ! 954: STBAR	stbar
	.word 0xfaa2a088  ! 955: STWA_I	stwa	%r29, [%r10 + 0x0088] %asi
	.word 0xa5da800b  ! 956: FLUSH_R	dis not found

	.word 0x8143c000  ! 957: STBAR	stbar
	.word 0x24c20003  ! 958: BRLEZ	brlez,a,nt	%8,<label_0x20003>
	.word 0xc2f2900b  ! 959: STXA_R	stxa	%r1, [%r10 + %r11] 0x80
	.word 0x85a2882b  ! 960: FADDs	fadds	%f10, %f11, %f2
	.word 0xd33aa5e8  ! 961: STDF_I	std	%f9, [0x05e8, %r10]
	.word 0xa07a800b  ! 962: SDIV_R	sdiv 	%r10, %r11, %r16
	.word 0x87da800b  ! 963: FLUSH_R	dis not found

	.word 0x2a800001  ! 964: BCS	bcs,a	<label_0x1>
	.word 0xc36a800b  ! 965: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x8143c000  ! 967: STBAR	stbar
	.word 0xb26aa978  ! 968: UDIVX_I	udivx 	%r10, 0x0978, %r25
	.word 0x91daac94  ! 969: FLUSH_I	dis not found

	.word 0xc4a2900b  ! 970: STWA_R	stwa	%r2, [%r10 + %r11] 0x80
	.word 0xf612a7a0  ! 971: LDUH_I	lduh	[%r10 + 0x07a0], %r27
	.word 0xa7da800b  ! 972: FLUSH_R	dis not found

	.word 0x8fa289ab  ! 973: FDIVs	fdivs	%f10, %f11, %f7
	.word 0xc87a800b  ! 974: SWAP_R	swap	%r4, [%r10 + %r11]
	.word 0xdc5a800b  ! 975: LDX_R	ldx	[%r10 + %r11], %r14
	.word 0x0cc20001  ! 976: BRGZ	brgz  ,nt	%8,<label_0x20001>
	.word 0xd282aafc  ! 977: LDUWA_I	lduwa	[%r10, + 0x0afc] %asi, %r9
	.word 0x40000001  ! 978: CALL	call	disp30_1
	.word 0x1c800003  ! 979: BPOS	bpos  	<label_0x3>
	.word 0x90f2800b  ! 980: UDIVcc_R	udivcc 	%r10, %r11, %r8
	.word 0x8dda800b  ! 981: FLUSH_R	dis not found

	.word 0xc53a800b  ! 982: STDF_R	std	%f2, [%r11, %r10]
	.word 0xea92900b  ! 983: LDUHA_R	lduha	[%r10, %r11] 0x80, %r21
	.word 0x89daa7b0  ! 984: FLUSH_I	dis not found

	.word 0x8c6aa960  ! 985: UDIVX_I	udivx 	%r10, 0x0960, %r6
	.word 0xc36a800b  ! 986: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x9b22800b  ! 988: MULScc_R	mulscc 	%r10, %r11, %r13
	.word 0xd25aa9f0  ! 989: LDX_I	ldx	[%r10 + 0x09f0], %r9
	.word 0xe88aa64c  ! 990: LDUBA_I	lduba	[%r10, + 0x064c] %asi, %r20
	.word 0xc4c2900b  ! 991: LDSWA_R	ldswa	[%r10, %r11] 0x80, %r2
	.word 0x20800003  ! 993: BN	bn,a	<label_0x3>
	.word 0xc53aac20  ! 994: STDF_I	std	%f2, [0x0c20, %r10]
	.word 0x16800003  ! 995: BGE	bge  	<label_0x3>
	.word 0x18800001  ! 996: BGU	bgu  	<label_0x1>
	.word 0xd2daafe8  ! 997: LDXA_I	ldxa	[%r10, + 0x0fe8] %asi, %r9
	.word 0xa3da800b  ! 998: FLUSH_R	dis not found

	.word 0x8143c000  ! 999: STBAR	stbar
	nop
	nop
	nop
        ta      T_GOOD_TRAP
th_main_2:
        setx  MAIN_BASE_DATA_VA, %r1, %r10
        setx  0x0000000000000290, %g1, %r11
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
        setx  0x3fa1e6c020f67124, %g1, %r0
        setx  0xae3bddc5d29895a0, %g1, %r1
        setx  0x23b12a3f9d607eea, %g1, %r2
        setx  0x147f2fe147c11a8c, %g1, %r3
        setx  0x49a4557e697f47ca, %g1, %r4
        setx  0x24f4c625b2269e45, %g1, %r5
        setx  0x078b90d9af3a7c1c, %g1, %r6
        setx  0xb441d5c0980f0bc1, %g1, %r7
        setx  0x5c2b97e5250d3407, %g1, %r8
        setx  0x948dacf8613185a9, %g1, %r9
        setx  0x396150af8a2508e1, %g1, %r12
        setx  0x4fe3ba523dc5d875, %g1, %r13
        setx  0x83879e459e1052c8, %g1, %r14
        setx  0xcdb35554cd7a6e57, %g1, %r15
        setx  0x337eafa6c9cc419f, %g1, %r16
        setx  0xb89c03f451f7e02c, %g1, %r17
        setx  0x67ba8f16c88b268c, %g1, %r18
        setx  0xc302a982c324a898, %g1, %r19
        setx  0x30714602c0e3fd80, %g1, %r20
        setx  0xe97298a6d00c7029, %g1, %r21
        setx  0xbbe0fa900b0e5e5d, %g1, %r22
        setx  0x0060ae742193817c, %g1, %r23
        setx  0xd5034aaa43fbde6f, %g1, %r24
        setx  0x569333642c87def8, %g1, %r25
        setx  0xc4a1c754a3d76872, %g1, %r26
        setx  0x4f832c61d7823fc7, %g1, %r27
        setx  0xaee09f6ac4ab2e32, %g1, %r28
        setx  0x465269a2486670ce, %g1, %r29
        setx  0x12ecdd4a99ef58f4, %g1, %r30
        setx  0x6d53b17485a96857, %g1, %r31
	.word 0xa4faae40  ! 5: SDIVcc_I	sdivcc 	%r10, 0x0e40, %r18
	.word 0x8143e01a  ! 7: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside 
	.word 0xcb3aac70  ! 8: STDF_I	std	%f5, [0x0c70, %r10]
	stxa	%r18, [%r10 + %r11] 0x80	
	.word 0x8143e048  ! 11: MEMBAR	membar	#StoreStore | #Sync 
	.word 0xc4eaa980  ! 12: LDSTUBA_I	ldstuba	%r2, [%r10 + 0x0980] %asi
	.word 0xda02ace0  ! 13: LDUW_I	lduw	[%r10 + 0x0ce0], %r13
	.word 0x8143e03b  ! 14: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Lookaside | #MemIssue 
	.word 0xc2d2a298  ! 15: LDSHA_I	ldsha	[%r10, + 0x0298] %asi, %r1
	.word 0x876aa1b8  ! 16: SDIVX_I	sdivx	%r10, 0x01b8, %r3
	.word 0xdc5a800b  ! 17: LDX_R	ldx	[%r10 + %r11], %r14
	.word 0x847a800b  ! 18: SDIV_R	sdiv 	%r10, %r11, %r2
	.word 0xe7f2a00b  ! 19: CASXA_R	casxa	[%r10]%asi, %r11, %r19
	.word 0xab6a800b  ! 20: SDIVX_R	sdivx	%r10, %r11, %r21
	.word 0x8143c000  ! 21: STBAR	stbar
	.word 0xc49aaea8  ! 22: LDDA_I	ldda	[%r10, + 0x0ea8] %asi, %r2
	.word 0x91daa160  ! 23: FLUSH_I	dis not found

	.word 0xe2f2aa10  ! 24: STXA_I	stxa	%r17, [%r10 + 0x0a10] %asi
	.word 0xd122800b  ! 25: STF_R	st	%f8, [%r11, %r10]
	.word 0xd1e2900b  ! 26: CASA_I	casa	[%r10] 0x80, %r11, %r8
	.word 0x82d2800b  ! 27: UMULcc_R	umulcc 	%r10, %r11, %r1
	.word 0x89da800b  ! 28: FLUSH_R	dis not found

	.word 0xc6b2a02c  ! 29: STHA_I	stha	%r3, [%r10 + 0x002c] %asi
	.word 0x865a800b  ! 30: SMUL_R	smul 	%r10, %r11, %r3
	.word 0xc36a800b  ! 31: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x8143c000  ! 33: STBAR	stbar
	.word 0x9dda800b  ! 34: FLUSH_R	dis not found

	stxa	%r4, [%r10 + %r11] 0x80	
	.word 0xe7f2900b  ! 36: CASXA_I	casxa	[%r10] 0x80, %r11, %r19
	.word 0x82da800b  ! 37: SMULcc_R	smulcc 	%r10, %r11, %r1
	.word 0xc6a2a850  ! 39: STWA_I	stwa	%r3, [%r10 + 0x0850] %asi
	.word 0xcd22800b  ! 40: STF_R	st	%f6, [%r11, %r10]
	.word 0x2e800003  ! 41: BVS	bvs,a	<label_0x3>
	.word 0x88d2ac44  ! 42: UMULcc_I	umulcc 	%r10, 0x0c44, %r4
	.word 0xcaca900b  ! 44: LDSBA_R	ldsba	[%r10, %r11] 0x80, %r5
	.word 0xee52800b  ! 45: LDSH_R	ldsh	[%r10 + %r11], %r23
	.word 0xd2f2a238  ! 46: STXA_I	stxa	%r9, [%r10 + 0x0238] %asi
	.word 0xa672800b  ! 47: UDIV_R	udiv 	%r10, %r11, %r19
	.word 0x18800003  ! 48: BGU	bgu  	<label_0x3>
	.word 0x8143e03a  ! 49: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside | #MemIssue 
	.word 0xf6f2a258  ! 50: STXA_I	stxa	%r27, [%r10 + 0x0258] %asi
	.word 0xdafaa858  ! 51: SWAPA_I	swapa	%r13, [%r10 + 0x0858] %asi
	.word 0xf89aab48  ! 52: LDDA_I	ldda	[%r10, + 0x0b48] %asi, %r28
	.word 0xcef2900b  ! 53: STXA_R	stxa	%r7, [%r10 + %r11] 0x80
	.word 0xcc12800b  ! 54: LDUH_R	lduh	[%r10 + %r11], %r6
	.word 0xc2ca900b  ! 55: LDSBA_R	ldsba	[%r10, %r11] 0x80, %r1
	.word 0x0ec20001  ! 56: BRGEZ	brgez  ,nt	%8,<label_0x20001>
	.word 0x8143e004  ! 57: MEMBAR	membar	#LoadStore 
	.word 0xeaaaa540  ! 58: STBA_I	stba	%r21, [%r10 + 0x0540] %asi
	.word 0x84faaa4c  ! 59: SDIVcc_I	sdivcc 	%r10, 0x0a4c, %r2
	.word 0xc2daadc0  ! 60: LDXA_I	ldxa	[%r10, + 0x0dc0] %asi, %r1
	.word 0xc67a800b  ! 61: SWAP_R	swap	%r3, [%r10 + %r11]
	.word 0x86fa800b  ! 62: SDIVcc_R	sdivcc 	%r10, %r11, %r3
	.word 0xe9f2a00b  ! 63: CASXA_R	casxa	[%r10]%asi, %r11, %r20
	.word 0x8cd2ab08  ! 64: UMULcc_I	umulcc 	%r10, 0x0b08, %r6
	.word 0x8bdaa474  ! 65: FLUSH_I	dis not found

	.word 0xd09aa990  ! 66: LDDA_I	ldda	[%r10, + 0x0990] %asi, %r8
	.word 0xc47a800b  ! 67: SWAP_R	swap	%r2, [%r10 + %r11]
	.word 0xd2c2ac80  ! 68: LDSWA_I	ldswa	[%r10, + 0x0c80] %asi, %r9
	.word 0x8522a8f0  ! 69: MULScc_I	mulscc 	%r10, 0x08f0, %r2
	.word 0x8dda800b  ! 70: FLUSH_R	dis not found

	.word 0x84d2800b  ! 71: UMULcc_R	umulcc 	%r10, %r11, %r2
	.word 0xe012800b  ! 72: LDUH_R	lduh	[%r10 + %r11], %r16
	.word 0x8143e07b  ! 73: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Lookaside | #MemIssue | #Sync 
	stxa	%r0, [%r10 + 0x08e0] %asi	
	.word 0x905a800b  ! 75: SMUL_R	smul 	%r10, %r11, %r8
	.word 0x987aa52c  ! 76: SDIV_I	sdiv 	%r10, 0x052c, %r12
	.word 0xa05a800b  ! 77: SMUL_R	smul 	%r10, %r11, %r16
	.word 0x2e800001  ! 78: BVS	bvs,a	<label_0x1>
	.word 0x2cc20001  ! 79: BRGZ	brgz,a,nt	%8,<label_0x20001>
	.word 0x0c800001  ! 80: BNEG	bneg  	<label_0x1>
	.word 0xc3eaa0ac  ! 81: PREFETCHA_I	prefetcha	[%r10, + 0x00ac] %asi, #one_read
	stxa	%r8, [%r10 + %r11] 0x80	
	.word 0x8143c000  ! 83: STBAR	stbar
	.word 0x18800001  ! 84: BGU	bgu  	<label_0x1>
	.word 0xb46aa584  ! 85: UDIVX_I	udivx 	%r10, 0x0584, %r26
	.word 0xf202ae5c  ! 86: LDUW_I	lduw	[%r10 + 0x0e5c], %r25
	.word 0x8143c000  ! 87: STBAR	stbar
	.word 0x18800001  ! 88: BGU	bgu  	<label_0x1>
	.word 0xcd3aa4b0  ! 89: STDF_I	std	%f6, [0x04b0, %r10]
	.word 0xb1a289ab  ! 90: FDIVs	fdivs	%f10, %f11, %f24
	.word 0x28800003  ! 91: BLEU	bleu,a	<label_0x3>
	.word 0x83daa220  ! 92: FLUSH_I	dis not found

	.word 0xef22800b  ! 93: STF_R	st	%f23, [%r11, %r10]
	.word 0xa9daacd8  ! 94: FLUSH_I	dis not found

	.word 0x8143e031  ! 95: MEMBAR	membar	#LoadLoad | #Lookaside | #MemIssue 
	.word 0x8c6aae98  ! 96: UDIVX_I	udivx 	%r10, 0x0e98, %r6
	.word 0x927a800b  ! 97: SDIV_R	sdiv 	%r10, %r11, %r9
	.word 0x8143c000  ! 98: STBAR	stbar
	.word 0xe0a2900b  ! 99: STWA_R	stwa	%r16, [%r10 + %r11] 0x80
	.word 0xedf2a00b  ! 100: CASXA_R	casxa	[%r10]%asi, %r11, %r22
	.word 0x8dda800b  ! 101: FLUSH_R	dis not found

	.word 0xe4f2900b  ! 102: STXA_R	stxa	%r18, [%r10 + %r11] 0x80
	.word 0xc852a9c0  ! 103: LDSH_I	ldsh	[%r10 + 0x09c0], %r4
	.word 0x89a289ab  ! 104: FDIVs	fdivs	%f10, %f11, %f4
	.word 0xc7f2a00b  ! 105: CASXA_R	casxa	[%r10]%asi, %r11, %r3
	.word 0xdbf2a00b  ! 106: CASXA_R	casxa	[%r10]%asi, %r11, %r13
	.word 0xa07aadbc  ! 107: SDIV_I	sdiv 	%r10, 0x0dbc, %r16
	.word 0xceaa900b  ! 108: STBA_R	stba	%r7, [%r10 + %r11] 0x80
	.word 0xc36aa2ec  ! 109: PREFETCH_I	prefetch	[%r10 + 0x02ec], #one_read
	.word 0x00800001  ! 110: BN	bn  	<label_0x1>
	.word 0x85daa008  ! 111: FLUSH_I	dis not found

	.word 0xc442a3ec  ! 112: LDSW_I	ldsw	[%r10 + 0x03ec], %r2
	.word 0x83daad8c  ! 114: FLUSH_I	dis not found

	.word 0xd812800b  ! 115: LDUH_R	lduh	[%r10 + %r11], %r12
	.word 0x83a289ab  ! 116: FDIVs	fdivs	%f10, %f11, %f1
	stxa	%r8, [%r10 + %r11] 0x80	
	.word 0xcef2900b  ! 118: STXA_R	stxa	%r7, [%r10 + %r11] 0x80
	.word 0x8143e043  ! 119: MEMBAR	membar	#LoadLoad | #StoreLoad | #Sync 
	.word 0x32800001  ! 120: BNE	bne,a	<label_0x1>
	.word 0xc2b2900b  ! 121: STHA_R	stha	%r1, [%r10 + %r11] 0x80
	.word 0x2c800001  ! 122: BNEG	bneg,a	<label_0x1>
	.word 0xf01aa660  ! 123: LDD_I	ldd	[%r10 + 0x0660], %r24
	.word 0xc722800b  ! 124: STF_R	st	%f3, [%r11, %r10]
	.word 0x85da800b  ! 125: FLUSH_R	dis not found

	.word 0xb1da800b  ! 126: FLUSH_R	dis not found

	.word 0xc602800b  ! 127: LDUW_R	lduw	[%r10 + %r11], %r3
	.word 0xc3eaa228  ! 128: PREFETCHA_I	prefetcha	[%r10, + 0x0228] %asi, #one_read
	.word 0xb7daa570  ! 130: FLUSH_I	dis not found

	stxa	%r14, [%r10 + 0x0060] %asi	
	.word 0xf3e2a00b  ! 132: CASA_R	casa	[%r10] %asi, %r11, %r25
	.word 0x8143c000  ! 133: STBAR	stbar
	.word 0xd282afc4  ! 134: LDUWA_I	lduwa	[%r10, + 0x0fc4] %asi, %r9
	.word 0x8143e016  ! 135: MEMBAR	membar	#StoreLoad | #LoadStore | #Lookaside 
	.word 0x8143c000  ! 136: STBAR	stbar
	.word 0x8143e045  ! 137: MEMBAR	membar	#LoadLoad | #LoadStore | #Sync 
	.word 0x8cd2800b  ! 138: UMULcc_R	umulcc 	%r10, %r11, %r6
	.word 0xd2d2900b  ! 140: LDSHA_R	ldsha	[%r10, %r11] 0x80, %r9
	.word 0x2ac20003  ! 141: BRNZ	brnz,a,nt	%8,<label_0x20003>
	.word 0xb122800b  ! 142: MULScc_R	mulscc 	%r10, %r11, %r24
	.word 0x87da800b  ! 143: FLUSH_R	dis not found

	.word 0x92faa178  ! 144: SDIVcc_I	sdivcc 	%r10, 0x0178, %r9
	.word 0xf4f2900b  ! 145: STXA_R	stxa	%r26, [%r10 + %r11] 0x80
	.word 0x8fda800b  ! 146: FLUSH_R	dis not found

	.word 0x91da800b  ! 147: FLUSH_R	dis not found

	.word 0xabdaa3fc  ! 148: FLUSH_I	dis not found

	.word 0xceda900b  ! 149: LDXA_R	ldxa	[%r10, %r11] 0x80, %r7
	.word 0xc7e2900b  ! 150: CASA_I	casa	[%r10] 0x80, %r11, %r3
	.word 0x9a52a3d4  ! 151: UMUL_I	umul 	%r10, 0x03d4, %r13
	.word 0xb852800b  ! 152: UMUL_R	umul 	%r10, %r11, %r28
	.word 0xa87aaf7c  ! 153: SDIV_I	sdiv 	%r10, 0x0f7c, %r20
	.word 0xca8aa0d4  ! 154: LDUBA_I	lduba	[%r10, + 0x00d4] %asi, %r5
	.word 0xbfa289ab  ! 155: FDIVs	fdivs	%f10, %f11, %f31
	.word 0xb7da800b  ! 156: FLUSH_R	dis not found

	.word 0xc3eaa204  ! 157: PREFETCHA_I	prefetcha	[%r10, + 0x0204] %asi, #one_read
	.word 0xc40aa4d4  ! 158: LDUB_I	ldub	[%r10 + 0x04d4], %r2
	.word 0x9fa2882b  ! 159: FADDs	fadds	%f10, %f11, %f15
	.word 0xdaaa900b  ! 160: STBA_R	stba	%r13, [%r10 + %r11] 0x80
	.word 0x0e800003  ! 161: BVS	bvs  	<label_0x3>
	.word 0xd2b2900b  ! 162: STHA_R	stha	%r9, [%r10 + %r11] 0x80
	.word 0x8f6a800b  ! 163: SDIVX_R	sdivx	%r10, %r11, %r7
	.word 0x8143e044  ! 164: MEMBAR	membar	#LoadStore | #Sync 
	.word 0x8c52800b  ! 165: UMUL_R	umul 	%r10, %r11, %r6
	.word 0xc652a75c  ! 166: LDSH_I	ldsh	[%r10 + 0x075c], %r3
	.word 0xba52ac48  ! 167: UMUL_I	umul 	%r10, 0x0c48, %r29
	.word 0xd322aeb0  ! 168: STF_I	st	%f9, [0x0eb0, %r10]
	.word 0xc2da900b  ! 169: LDXA_R	ldxa	[%r10, %r11] 0x80, %r1
	.word 0xbcda800b  ! 170: SMULcc_R	smulcc 	%r10, %r11, %r30
	.word 0xca92900b  ! 171: LDUHA_R	lduha	[%r10, %r11] 0x80, %r5
	.word 0x0cc20003  ! 172: BRGZ	brgz  ,nt	%8,<label_0x20003>
	.word 0x2eca0001  ! 173: BRGEZ	brgez,a,pt	%8,<label_0xa0001>
	.word 0xc402a670  ! 174: LDUW_I	lduw	[%r10 + 0x0670], %r2
	.word 0xfc7a800b  ! 175: SWAP_R	swap	%r30, [%r10 + %r11]
	.word 0xc4aa900b  ! 176: STBA_R	stba	%r2, [%r10 + %r11] 0x80
	stxa	%r2, [%r10 + %r11] 0x80	
	.word 0xe81a800b  ! 178: LDD_R	ldd	[%r10 + %r11], %r20
	.word 0xc3ea900b  ! 179: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0xc8aaa550  ! 180: STBA_I	stba	%r4, [%r10 + 0x0550] %asi
	.word 0x8dda800b  ! 181: FLUSH_R	dis not found

	.word 0xa9da800b  ! 182: FLUSH_R	dis not found

	.word 0xc682900b  ! 183: LDUWA_R	lduwa	[%r10, %r11] 0x80, %r3
	.word 0xdeaa900b  ! 184: STBA_R	stba	%r15, [%r10 + %r11] 0x80
	.word 0xc322ae74  ! 185: STF_I	st	%f1, [0x0e74, %r10]
	.word 0x8143e009  ! 186: MEMBAR	membar	#LoadLoad | #StoreStore 
	.word 0xc722a86c  ! 187: STF_I	st	%f3, [0x086c, %r10]
	.word 0x8143e01e  ! 188: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside 
	.word 0xaddaabc4  ! 189: FLUSH_I	dis not found

	.word 0x28800001  ! 190: BLEU	bleu,a	<label_0x1>
	.word 0x83daacf0  ! 191: FLUSH_I	dis not found

	.word 0xe8b2a664  ! 192: STHA_I	stha	%r20, [%r10 + 0x0664] %asi
	.word 0xc36aae5c  ! 193: PREFETCH_I	prefetch	[%r10 + 0x0e5c], #one_read
	.word 0xc3e2900b  ! 194: CASA_I	casa	[%r10] 0x80, %r11, %r1
	.word 0xbfda800b  ! 195: FLUSH_R	dis not found

	.word 0xc4f2a8e8  ! 196: STXA_I	stxa	%r2, [%r10 + 0x08e8] %asi
	.word 0x85a2892b  ! 197: FMULs	fmuls	%f10, %f11, %f2
	.word 0xcd3aa878  ! 198: STDF_I	std	%f6, [0x0878, %r10]
	.word 0xd09aa868  ! 199: LDDA_I	ldda	[%r10, + 0x0868] %asi, %r8
	.word 0xa45a800b  ! 200: SMUL_R	smul 	%r10, %r11, %r18
	.word 0x85a288ab  ! 201: FSUBs	fsubs	%f10, %f11, %f2
	.word 0xcafa900b  ! 202: SWAPA_R	swapa	%r5, [%r10 + %r11] 0x80
	.word 0xa87aa258  ! 203: SDIV_I	sdiv 	%r10, 0x0258, %r20
	.word 0xd0aaaa00  ! 204: STBA_I	stba	%r8, [%r10 + 0x0a00] %asi
	.word 0x8cdaa4d4  ! 205: SMULcc_I	smulcc 	%r10, 0x04d4, %r6
	.word 0x38800001  ! 206: BGU	bgu,a	<label_0x1>
	.word 0x9dda800b  ! 207: FLUSH_R	dis not found

	.word 0x9f6aae48  ! 208: SDIVX_I	sdivx	%r10, 0x0e48, %r15
	.word 0xede2900b  ! 209: CASA_I	casa	[%r10] 0x80, %r11, %r22
	.word 0x87daa828  ! 210: FLUSH_I	dis not found

	.word 0xc73a800b  ! 211: STDF_R	std	%f3, [%r11, %r10]
	.word 0x2e800003  ! 212: BVS	bvs,a	<label_0x3>
	.word 0x865aa80c  ! 213: SMUL_I	smul 	%r10, 0x080c, %r3
	.word 0xc80a800b  ! 214: LDUB_R	ldub	[%r10 + %r11], %r4
	.word 0xc3ea900b  ! 215: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0xc80a800b  ! 216: LDUB_R	ldub	[%r10 + %r11], %r4
	.word 0x8da2892b  ! 217: FMULs	fmuls	%f10, %f11, %f6
	.word 0xe922800b  ! 218: STF_R	st	%f20, [%r11, %r10]
	.word 0xcad2900b  ! 220: LDSHA_R	ldsha	[%r10, %r11] 0x80, %r5
	.word 0xd8aa900b  ! 221: STBA_R	stba	%r12, [%r10 + %r11] 0x80
	.word 0x8143e04a  ! 222: MEMBAR	membar	#StoreLoad | #StoreStore | #Sync 
	.word 0x8cdaaec4  ! 223: SMULcc_I	smulcc 	%r10, 0x0ec4, %r6
	.word 0xe612a918  ! 224: LDUH_I	lduh	[%r10 + 0x0918], %r19
	.word 0xa452800b  ! 225: UMUL_R	umul 	%r10, %r11, %r18
	.word 0xc9f2a00b  ! 226: CASXA_R	casxa	[%r10]%asi, %r11, %r4
	.word 0x89daab58  ! 227: FLUSH_I	dis not found

	.word 0xc36aa608  ! 228: PREFETCH_I	prefetch	[%r10 + 0x0608], #one_read
	.word 0x916a800b  ! 229: SDIVX_R	sdivx	%r10, %r11, %r8
	.word 0xbb22800b  ! 230: MULScc_R	mulscc 	%r10, %r11, %r29
	.word 0x85da800b  ! 231: FLUSH_R	dis not found

	.word 0xc442800b  ! 232: LDSW_R	ldsw	[%r10 + %r11], %r2
	.word 0x82f2800b  ! 233: UDIVcc_R	udivcc 	%r10, %r11, %r1
	.word 0x83a2882b  ! 234: FADDs	fadds	%f10, %f11, %f1
	.word 0x85daad98  ! 235: FLUSH_I	dis not found

	.word 0xce42a6dc  ! 236: LDSW_I	ldsw	[%r10 + 0x06dc], %r7
	.word 0x89da800b  ! 237: FLUSH_R	dis not found

	.word 0x8143c000  ! 238: STBAR	stbar
	.word 0xcab2900b  ! 239: STHA_R	stha	%r5, [%r10 + %r11] 0x80
	.word 0xcc0aa430  ! 240: LDUB_I	ldub	[%r10 + 0x0430], %r6
	.word 0x3e800001  ! 241: BVC	bvc,a	<label_0x1>
	.word 0xe85aa348  ! 242: LDX_I	ldx	[%r10 + 0x0348], %r20
	.word 0xcc1a800b  ! 243: LDD_R	ldd	[%r10 + %r11], %r6
	.word 0x8143e069  ! 244: MEMBAR	membar	#LoadLoad | #StoreStore | #MemIssue | #Sync 
	.word 0xd202a294  ! 245: LDUW_I	lduw	[%r10 + 0x0294], %r9
	.word 0xdd3aa7b8  ! 246: STDF_I	std	%f14, [0x07b8, %r10]
	.word 0xe68aaf04  ! 247: LDUBA_I	lduba	[%r10, + 0x0f04] %asi, %r19
	.word 0x847a800b  ! 248: SDIV_R	sdiv 	%r10, %r11, %r2
	.word 0xcadaa370  ! 249: LDXA_I	ldxa	[%r10, + 0x0370] %asi, %r5
	.word 0xd212800b  ! 250: LDUH_R	lduh	[%r10 + %r11], %r9
	.word 0xc3eaa38c  ! 251: PREFETCHA_I	prefetcha	[%r10, + 0x038c] %asi, #one_read
	.word 0x2e800001  ! 252: BVS	bvs,a	<label_0x1>
	.word 0x08800001  ! 253: BLEU	bleu  	<label_0x1>
	.word 0x8143c000  ! 254: STBAR	stbar
	.word 0xcec2900b  ! 255: LDSWA_R	ldswa	[%r10, %r11] 0x80, %r7
	.word 0xcc02800b  ! 256: LDUW_R	lduw	[%r10 + %r11], %r6
	.word 0x14800003  ! 257: BG	bg  	<label_0x3>
	.word 0xce12a178  ! 258: LDUH_I	lduh	[%r10 + 0x0178], %r7
	.word 0x34800001  ! 259: BG	bg,a	<label_0x1>
	.word 0x9122800b  ! 260: MULScc_R	mulscc 	%r10, %r11, %r8
	.word 0x8143c000  ! 261: STBAR	stbar
	.word 0xfe8a900b  ! 262: LDUBA_R	lduba	[%r10, %r11] 0x80, %r31
	.word 0xccfa900b  ! 263: SWAPA_R	swapa	%r6, [%r10 + %r11] 0x80
	.word 0x9ba2882b  ! 264: FADDs	fadds	%f10, %f11, %f13
	.word 0x22ca0001  ! 265: BRZ	brz,a,pt	%8,<label_0xa0001>
	.word 0x8bdaad88  ! 266: FLUSH_I	dis not found

	.word 0xc36aa728  ! 267: PREFETCH_I	prefetch	[%r10 + 0x0728], #one_read
	.word 0x9a4a800b  ! 268: MULX_R	mulx 	%r10, %r11, %r13
	.word 0xeff2900b  ! 270: CASXA_I	casxa	[%r10] 0x80, %r11, %r23
	.word 0xc6f2900b  ! 271: STXA_R	stxa	%r3, [%r10 + %r11] 0x80
	.word 0xc86a800b  ! 272: LDSTUB_R	ldstub	%r4, [%r10 + %r11]
	.word 0xcab2900b  ! 273: STHA_R	stha	%r5, [%r10 + %r11] 0x80
	.word 0x916a800b  ! 274: SDIVX_R	sdivx	%r10, %r11, %r8
	.word 0x8ef2800b  ! 275: UDIVcc_R	udivcc 	%r10, %r11, %r7
	.word 0xa652800b  ! 276: UMUL_R	umul 	%r10, %r11, %r19
	.word 0xd1e2900b  ! 277: CASA_I	casa	[%r10] 0x80, %r11, %r8
	.word 0xc202a72c  ! 278: LDUW_I	lduw	[%r10 + 0x072c], %r1
	.word 0x2ac20001  ! 279: BRNZ	brnz,a,nt	%8,<label_0x20001>
	.word 0x83a2892b  ! 280: FMULs	fmuls	%f10, %f11, %f1
	.word 0xdbf2a00b  ! 281: CASXA_R	casxa	[%r10]%asi, %r11, %r13
	.word 0xc36aa15c  ! 282: PREFETCH_I	prefetch	[%r10 + 0x015c], #one_read
	.word 0xc85a800b  ! 283: LDX_R	ldx	[%r10 + %r11], %r4
	.word 0x2c800003  ! 284: BNEG	bneg,a	<label_0x3>
	.word 0xceeaa020  ! 285: LDSTUBA_I	ldstuba	%r7, [%r10 + 0x0020] %asi
	.word 0xca02800b  ! 286: LDUW_R	lduw	[%r10 + %r11], %r5
	.word 0xec02a16c  ! 288: LDUW_I	lduw	[%r10 + 0x016c], %r22
	.word 0xc6a2900b  ! 289: STWA_R	stwa	%r3, [%r10 + %r11] 0x80
	.word 0x86da800b  ! 290: SMULcc_R	smulcc 	%r10, %r11, %r3
	.word 0xcc9aa268  ! 291: LDDA_I	ldda	[%r10, + 0x0268] %asi, %r6
	.word 0x8c6a800b  ! 293: UDIVX_R	udivx 	%r10, %r11, %r6
	.word 0xc602ae5c  ! 294: LDUW_I	lduw	[%r10 + 0x0e5c], %r3
	.word 0x87a2892b  ! 296: FMULs	fmuls	%f10, %f11, %f3
	.word 0xc36aaef8  ! 297: PREFETCH_I	prefetch	[%r10 + 0x0ef8], #one_read
	.word 0x9fa288ab  ! 298: FSUBs	fsubs	%f10, %f11, %f15
	.word 0xf53aa0f8  ! 299: STDF_I	std	%f26, [0x00f8, %r10]
	.word 0x84daace8  ! 300: SMULcc_I	smulcc 	%r10, 0x0ce8, %r2
	.word 0xc73a800b  ! 301: STDF_R	std	%f3, [%r11, %r10]
	.word 0x9c52a208  ! 302: UMUL_I	umul 	%r10, 0x0208, %r14
	.word 0xcb22800b  ! 303: STF_R	st	%f5, [%r11, %r10]
	.word 0xc81a800b  ! 304: LDD_R	ldd	[%r10 + %r11], %r4
	.word 0xae52a008  ! 306: UMUL_I	umul 	%r10, 0x0008, %r23
	.word 0x924aa0e8  ! 307: MULX_I	mulx 	%r10, 0x00e8, %r9
	.word 0x8c52800b  ! 308: UMUL_R	umul 	%r10, %r11, %r6
	.word 0xecc2adf0  ! 309: LDSWA_I	ldswa	[%r10, + 0x0df0] %asi, %r22
	.word 0xe4c2a8b8  ! 310: LDSWA_I	ldswa	[%r10, + 0x08b8] %asi, %r18
	.word 0xf9e2a00b  ! 311: CASA_R	casa	[%r10] %asi, %r11, %r28
	.word 0x00800001  ! 312: BN	bn  	<label_0x1>
	.word 0x8a4aaf5c  ! 313: MULX_I	mulx 	%r10, 0x0f5c, %r5
	.word 0x8143c000  ! 314: STBAR	stbar
	.word 0x8143e047  ! 315: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Sync 
	.word 0xadda800b  ! 316: FLUSH_R	dis not found

	.word 0xde0a800b  ! 317: LDUB_R	ldub	[%r10 + %r11], %r15
	.word 0xf5f2900b  ! 318: CASXA_I	casxa	[%r10] 0x80, %r11, %r26
	.word 0xfc6a800b  ! 319: LDSTUB_R	ldstub	%r30, [%r10 + %r11]
	.word 0xc892900b  ! 320: LDUHA_R	lduha	[%r10, %r11] 0x80, %r4
	.word 0x8143c000  ! 321: STBAR	stbar
	.word 0xe44a800b  ! 322: LDSB_R	ldsb	[%r10 + %r11], %r18
	.word 0x8143c000  ! 323: STBAR	stbar
	.word 0x89a2882b  ! 324: FADDs	fadds	%f10, %f11, %f4
	.word 0x836a800b  ! 325: SDIVX_R	sdivx	%r10, %r11, %r1
	.word 0x8143c000  ! 326: STBAR	stbar
	.word 0x04800003  ! 327: BLE	ble  	<label_0x3>
	.word 0xbfda800b  ! 328: FLUSH_R	dis not found

	.word 0x8143e049  ! 329: MEMBAR	membar	#LoadLoad | #StoreStore | #Sync 
	.word 0xd1e2900b  ! 330: CASA_I	casa	[%r10] 0x80, %r11, %r8
	.word 0xd0a2a9e0  ! 331: STWA_I	stwa	%r8, [%r10 + 0x09e0] %asi
	.word 0xd2d2900b  ! 332: LDSHA_R	ldsha	[%r10, %r11] 0x80, %r9
	.word 0xfaeaab28  ! 333: LDSTUBA_I	ldstuba	%r29, [%r10 + 0x0b28] %asi
	.word 0x8cd2800b  ! 334: UMULcc_R	umulcc 	%r10, %r11, %r6
	.word 0x16800001  ! 335: BGE	bge  	<label_0x1>
	.word 0x8143e055  ! 336: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside | #Sync 
	.word 0x04c20001  ! 337: BRLEZ	brlez  ,nt	%8,<label_0x20001>
	.word 0x34800001  ! 338: BG	bg,a	<label_0x1>
	.word 0xccc2a178  ! 339: LDSWA_I	ldswa	[%r10, + 0x0178] %asi, %r6
	.word 0xcf3a800b  ! 340: STDF_R	std	%f7, [%r11, %r10]
	.word 0x8143e07a  ! 341: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0x9da289ab  ! 342: FDIVs	fdivs	%f10, %f11, %f14
	.word 0x8bda800b  ! 343: FLUSH_R	dis not found

	.word 0xc36a800b  ! 344: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x8afaac8c  ! 345: SDIVcc_I	sdivcc 	%r10, 0x0c8c, %r5
	.word 0x8143c000  ! 346: STBAR	stbar
	.word 0x9272a12c  ! 347: UDIV_I	udiv 	%r10, 0x012c, %r9
	.word 0xc2da900b  ! 348: LDXA_R	ldxa	[%r10, %r11] 0x80, %r1
	.word 0x92f2800b  ! 349: UDIVcc_R	udivcc 	%r10, %r11, %r9
	.word 0x8143c000  ! 350: STBAR	stbar
	.word 0x905aa3cc  ! 351: SMUL_I	smul 	%r10, 0x03cc, %r8
	.word 0xede2a00b  ! 352: CASA_R	casa	[%r10] %asi, %r11, %r22
	.word 0x93daa2e8  ! 353: FLUSH_I	dis not found

	.word 0xd092a87c  ! 354: LDUHA_I	lduha	[%r10, + 0x087c] %asi, %r8
	.word 0x8bda800b  ! 356: FLUSH_R	dis not found

	.word 0xa272a2bc  ! 357: UDIV_I	udiv 	%r10, 0x02bc, %r17
	.word 0xb96a800b  ! 358: SDIVX_R	sdivx	%r10, %r11, %r28
	.word 0xdac2900b  ! 359: LDSWA_R	ldswa	[%r10, %r11] 0x80, %r13
	.word 0x89da800b  ! 360: FLUSH_R	dis not found

	.word 0xf2da900b  ! 361: LDXA_R	ldxa	[%r10, %r11] 0x80, %r25
	.word 0xcff2900b  ! 362: CASXA_I	casxa	[%r10] 0x80, %r11, %r7
	.word 0xe6eaaec0  ! 363: LDSTUBA_I	ldstuba	%r19, [%r10 + 0x0ec0] %asi
	.word 0xc7e2a00b  ! 364: CASA_R	casa	[%r10] %asi, %r11, %r3
	.word 0x8e72a5fc  ! 365: UDIV_I	udiv 	%r10, 0x05fc, %r7
	.word 0x8143c000  ! 366: STBAR	stbar
	.word 0xda0aa000  ! 367: LDUB_I	ldub	[%r10 + 0x0000], %r13
	.word 0xa26aa5e8  ! 368: UDIVX_I	udivx 	%r10, 0x05e8, %r17
	.word 0xc26aab8c  ! 369: LDSTUB_I	ldstub	%r1, [%r10 + 0x0b8c]
	.word 0xd2c2ad24  ! 370: LDSWA_I	ldswa	[%r10, + 0x0d24] %asi, %r9
	.word 0xda0aa158  ! 371: LDUB_I	ldub	[%r10 + 0x0158], %r13
	.word 0xaba288ab  ! 372: FSUBs	fsubs	%f10, %f11, %f21
	.word 0xd2b2900b  ! 373: STHA_R	stha	%r9, [%r10 + %r11] 0x80
	.word 0x8da2892b  ! 374: FMULs	fmuls	%f10, %f11, %f6
	.word 0xc5f2a00b  ! 375: CASXA_R	casxa	[%r10]%asi, %r11, %r2
	.word 0x827a800b  ! 376: SDIV_R	sdiv 	%r10, %r11, %r1
	.word 0x85daae64  ! 377: FLUSH_I	dis not found

	.word 0xa1daa008  ! 378: FLUSH_I	dis not found

	.word 0xc3ea900b  ! 379: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0x18800001  ! 380: BGU	bgu  	<label_0x1>
	.word 0xbad2800b  ! 381: UMULcc_R	umulcc 	%r10, %r11, %r29
	.word 0xcc9aa388  ! 382: LDDA_I	ldda	[%r10, + 0x0388] %asi, %r6
	.word 0x85da800b  ! 383: FLUSH_R	dis not found

	.word 0x8c72800b  ! 384: UDIV_R	udiv 	%r10, %r11, %r6
	.word 0xe0aa900b  ! 385: STBA_R	stba	%r16, [%r10 + %r11] 0x80
	.word 0xc48aa7b0  ! 386: LDUBA_I	lduba	[%r10, + 0x07b0] %asi, %r2
	.word 0x02800001  ! 387: BE	be  	<label_0x1>
	.word 0x884aa684  ! 388: MULX_I	mulx 	%r10, 0x0684, %r4
	.word 0x85daaea4  ! 389: FLUSH_I	dis not found

	.word 0x86fa800b  ! 392: SDIVcc_R	sdivcc 	%r10, %r11, %r3
	.word 0xc36a800b  ! 393: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0xf81aa8a8  ! 394: LDD_I	ldd	[%r10 + 0x08a8], %r28
	.word 0xf4caa0f0  ! 395: LDSBA_I	ldsba	[%r10, + 0x00f0] %asi, %r26
	.word 0x02ca0001  ! 396: BRZ	brz  ,pt	%8,<label_0xa0001>
	.word 0xceb2900b  ! 397: STHA_R	stha	%r7, [%r10 + %r11] 0x80
	.word 0x9272a3e4  ! 398: UDIV_I	udiv 	%r10, 0x03e4, %r9
	.word 0xd8aa900b  ! 399: STBA_R	stba	%r12, [%r10 + %r11] 0x80
	.word 0x92daa3c8  ! 400: SMULcc_I	smulcc 	%r10, 0x03c8, %r9
	.word 0xd33aa110  ! 401: STDF_I	std	%f9, [0x0110, %r10]
	.word 0xd0d2aca4  ! 402: LDSHA_I	ldsha	[%r10, + 0x0ca4] %asi, %r8
	.word 0xa0da800b  ! 403: SMULcc_R	smulcc 	%r10, %r11, %r16
	.word 0xc4f2a5a8  ! 404: STXA_I	stxa	%r2, [%r10 + 0x05a8] %asi
	.word 0xc36a800b  ! 405: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0xaada800b  ! 406: SMULcc_R	smulcc 	%r10, %r11, %r21
	.word 0x00800001  ! 407: BN	bn  	<label_0x1>
	.word 0xbb6a800b  ! 408: SDIVX_R	sdivx	%r10, %r11, %r29
	.word 0x8fda800b  ! 409: FLUSH_R	dis not found

	.word 0x86f2800b  ! 410: UDIVcc_R	udivcc 	%r10, %r11, %r3
	.word 0x20800003  ! 412: BN	bn,a	<label_0x3>
	.word 0x8143e04c  ! 413: MEMBAR	membar	#LoadStore | #StoreStore | #Sync 
	.word 0x8143e04a  ! 414: MEMBAR	membar	#StoreLoad | #StoreStore | #Sync 
	.word 0xb2fa800b  ! 416: SDIVcc_R	sdivcc 	%r10, %r11, %r25
	.word 0x89a288ab  ! 417: FSUBs	fsubs	%f10, %f11, %f4
	.word 0x98daae14  ! 418: SMULcc_I	smulcc 	%r10, 0x0e14, %r12
	.word 0x884aa360  ! 419: MULX_I	mulx 	%r10, 0x0360, %r4
	.word 0x8143c000  ! 420: STBAR	stbar
	.word 0xea42a1d4  ! 421: LDSW_I	ldsw	[%r10 + 0x01d4], %r21
	.word 0x8652800b  ! 422: UMUL_R	umul 	%r10, %r11, %r3
	.word 0xcb3a800b  ! 423: STDF_R	std	%f5, [%r11, %r10]
	.word 0x8c6aa4e8  ! 424: UDIVX_I	udivx 	%r10, 0x04e8, %r6
	.word 0xcff2900b  ! 425: CASXA_I	casxa	[%r10] 0x80, %r11, %r7
	.word 0x8c6a800b  ! 426: UDIVX_R	udivx 	%r10, %r11, %r6
	.word 0x24c20001  ! 427: BRLEZ	brlez,a,nt	%8,<label_0x20001>
	.word 0x2eca0003  ! 428: BRGEZ	brgez,a,pt	%8,<label_0xa0003>
	.word 0xc522800b  ! 429: STF_R	st	%f2, [%r11, %r10]
	.word 0xc86aa3dc  ! 430: LDSTUB_I	ldstub	%r4, [%r10 + 0x03dc]
	.word 0x9efa800b  ! 431: SDIVcc_R	sdivcc 	%r10, %r11, %r15
	.word 0xe8daab60  ! 432: LDXA_I	ldxa	[%r10, + 0x0b60] %asi, %r20
	.word 0x8143c000  ! 433: STBAR	stbar
	.word 0x89daa37c  ! 434: FLUSH_I	dis not found

	.word 0xda8aa858  ! 435: LDUBA_I	lduba	[%r10, + 0x0858] %asi, %r13
	.word 0xce7a800b  ! 436: SWAP_R	swap	%r7, [%r10 + %r11]
	.word 0xc522800b  ! 437: STF_R	st	%f2, [%r11, %r10]
	.word 0xc3f2900b  ! 438: CASXA_I	casxa	[%r10] 0x80, %r11, %r1
	.word 0xc36a800b  ! 439: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x24800003  ! 440: BLE	ble,a	<label_0x3>
	.word 0xccb2a564  ! 441: STHA_I	stha	%r6, [%r10 + 0x0564] %asi
	.word 0xc53aaf50  ! 442: STDF_I	std	%f2, [0x0f50, %r10]
	.word 0x9fa288ab  ! 444: FSUBs	fsubs	%f10, %f11, %f15
	.word 0x936a800b  ! 445: SDIVX_R	sdivx	%r10, %r11, %r9
	.word 0xcc8aa864  ! 446: LDUBA_I	lduba	[%r10, + 0x0864] %asi, %r6
	.word 0x8872aa58  ! 447: UDIV_I	udiv 	%r10, 0x0a58, %r4
	.word 0xa3a2892b  ! 448: FMULs	fmuls	%f10, %f11, %f17
	.word 0xce42a27c  ! 450: LDSW_I	ldsw	[%r10 + 0x027c], %r7
	.word 0xb5a2892b  ! 451: FMULs	fmuls	%f10, %f11, %f26
	.word 0x87daa604  ! 452: FLUSH_I	dis not found

	.word 0x8c4aa424  ! 453: MULX_I	mulx 	%r10, 0x0424, %r6
	.word 0xfcdaa288  ! 454: LDXA_I	ldxa	[%r10, + 0x0288] %asi, %r30
	.word 0xe6f2900b  ! 455: STXA_R	stxa	%r19, [%r10 + %r11] 0x80
	.word 0x85da800b  ! 456: FLUSH_R	dis not found

	.word 0xcaeaa958  ! 457: LDSTUBA_I	ldstuba	%r5, [%r10 + 0x0958] %asi
	.word 0x87daa4a8  ! 458: FLUSH_I	dis not found

	.word 0x8d6a800b  ! 459: SDIVX_R	sdivx	%r10, %r11, %r6
	.word 0xc3eaa114  ! 460: PREFETCHA_I	prefetcha	[%r10, + 0x0114] %asi, #one_read
	.word 0xd2aa900b  ! 461: STBA_R	stba	%r9, [%r10 + %r11] 0x80
	.word 0xbfa2892b  ! 462: FMULs	fmuls	%f10, %f11, %f31
	.word 0xcde2900b  ! 463: CASA_I	casa	[%r10] 0x80, %r11, %r6
	.word 0xd2ea900b  ! 464: LDSTUBA_R	ldstuba	%r9, [%r10 + %r11] 0x80
	.word 0x16800001  ! 465: BGE	bge  	<label_0x1>
	.word 0xee42800b  ! 466: LDSW_R	ldsw	[%r10 + %r11], %r23
	.word 0x907aa880  ! 467: SDIV_I	sdiv 	%r10, 0x0880, %r8
	.word 0xc6aaa464  ! 468: STBA_I	stba	%r3, [%r10 + 0x0464] %asi
	.word 0xb8d2800b  ! 469: UMULcc_R	umulcc 	%r10, %r11, %r28
	.word 0xcefaa498  ! 470: SWAPA_I	swapa	%r7, [%r10 + 0x0498] %asi
	.word 0x9cf2ad70  ! 471: UDIVcc_I	udivcc 	%r10, 0x0d70, %r14
	.word 0x8143e033  ! 472: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside | #MemIssue 
	.word 0xc3eaa01c  ! 473: PREFETCHA_I	prefetcha	[%r10, + 0x001c] %asi, #one_read
	.word 0xc452ad94  ! 474: LDSH_I	ldsh	[%r10 + 0x0d94], %r2
	.word 0x824a800b  ! 475: MULX_R	mulx 	%r10, %r11, %r1
	.word 0xd20aa190  ! 476: LDUB_I	ldub	[%r10 + 0x0190], %r9
	.word 0x2cca0001  ! 477: BRGZ	brgz,a,pt	%8,<label_0xa0001>
	.word 0xdaa2900b  ! 478: STWA_R	stwa	%r13, [%r10 + %r11] 0x80
	.word 0x85da800b  ! 479: FLUSH_R	dis not found

	.word 0xce7a800b  ! 480: SWAP_R	swap	%r7, [%r10 + %r11]
	.word 0x8143c000  ! 481: STBAR	stbar
	.word 0xfc42800b  ! 482: LDSW_R	ldsw	[%r10 + %r11], %r30
	.word 0xfaaaa384  ! 483: STBA_I	stba	%r29, [%r10 + 0x0384] %asi
	.word 0x2ec20003  ! 485: BRGEZ	brgez,a,nt	%8,<label_0x20003>
	.word 0xacfaa3c4  ! 486: SDIVcc_I	sdivcc 	%r10, 0x03c4, %r22
	.word 0x8cd2800b  ! 487: UMULcc_R	umulcc 	%r10, %r11, %r6
	.word 0x9fa2892b  ! 488: FMULs	fmuls	%f10, %f11, %f15
	.word 0xd04a800b  ! 489: LDSB_R	ldsb	[%r10 + %r11], %r8
	.word 0xc3ea900b  ! 490: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0xf68aa060  ! 491: LDUBA_I	lduba	[%r10, + 0x0060] %asi, %r27
	.word 0x8143c000  ! 493: STBAR	stbar
	.word 0xc9e2900b  ! 494: CASA_I	casa	[%r10] 0x80, %r11, %r4
	.word 0xa7da800b  ! 495: FLUSH_R	dis not found

	.word 0xe65aa678  ! 498: LDX_I	ldx	[%r10 + 0x0678], %r19
	.word 0xd922ac58  ! 499: STF_I	st	%f12, [0x0c58, %r10]
	.word 0x8143c000  ! 500: STBAR	stbar
	.word 0xda7a800b  ! 501: SWAP_R	swap	%r13, [%r10 + %r11]
	.word 0xc6b2ab3c  ! 502: STHA_I	stha	%r3, [%r10 + 0x0b3c] %asi
	.word 0x89a288ab  ! 503: FSUBs	fsubs	%f10, %f11, %f4
	.word 0xc2ca900b  ! 504: LDSBA_R	ldsba	[%r10, %r11] 0x80, %r1
	.word 0xcc1aa040  ! 505: LDD_I	ldd	[%r10 + 0x0040], %r6
	.word 0xcc92a404  ! 506: LDUHA_I	lduha	[%r10, + 0x0404] %asi, %r6
	.word 0x24ca0001  ! 507: BRLEZ	brlez,a,pt	%8,<label_0xa0001>
	.word 0xc8faa964  ! 508: SWAPA_I	swapa	%r4, [%r10 + 0x0964] %asi
	.word 0xd13a800b  ! 509: STDF_R	std	%f8, [%r11, %r10]
	.word 0xd042a850  ! 510: LDSW_I	ldsw	[%r10 + 0x0850], %r8
	.word 0x8143e052  ! 511: MEMBAR	membar	#StoreLoad | #Lookaside | #Sync 
	.word 0xce6a800b  ! 512: LDSTUB_R	ldstub	%r7, [%r10 + %r11]
	.word 0x8322a194  ! 513: MULScc_I	mulscc 	%r10, 0x0194, %r1
	.word 0xc9e2a00b  ! 514: CASA_R	casa	[%r10] %asi, %r11, %r4
	.word 0xd212a248  ! 515: LDUH_I	lduh	[%r10 + 0x0248], %r9
	.word 0x8143c000  ! 516: STBAR	stbar
	stxa	%r2, [%r10 + 0x0620] %asi	
	.word 0xf6aaa224  ! 518: STBA_I	stba	%r27, [%r10 + 0x0224] %asi
	.word 0xc692a2d0  ! 519: LDUHA_I	lduha	[%r10, + 0x02d0] %asi, %r3
	.word 0x92da800b  ! 520: SMULcc_R	smulcc 	%r10, %r11, %r9
	.word 0xd8ca900b  ! 521: LDSBA_R	ldsba	[%r10, %r11] 0x80, %r12
	.word 0xcaaaa664  ! 522: STBA_I	stba	%r5, [%r10 + 0x0664] %asi
	.word 0xacd2a970  ! 523: UMULcc_I	umulcc 	%r10, 0x0970, %r22
	.word 0xf882a8d8  ! 524: LDUWA_I	lduwa	[%r10, + 0x08d8] %asi, %r28
	.word 0x8ed2aaa4  ! 525: UMULcc_I	umulcc 	%r10, 0x0aa4, %r7
	.word 0x8143e035  ! 526: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside | #MemIssue 
	.word 0x10800001  ! 527: BA	ba  	<label_0x1>
	.word 0x885a800b  ! 528: SMUL_R	smul 	%r10, %r11, %r4
	.word 0xceeaa00c  ! 529: LDSTUBA_I	ldstuba	%r7, [%r10 + 0x000c] %asi
	.word 0x8fda800b  ! 530: FLUSH_R	dis not found

	.word 0xfc7aa3e8  ! 531: SWAP_I	swap	%r30, [%r10 + 0x03e8]
	.word 0xcceaa4bc  ! 532: LDSTUBA_I	ldstuba	%r6, [%r10 + 0x04bc] %asi
	.word 0x20800001  ! 533: BN	bn,a	<label_0x1>
	.word 0xdcf2900b  ! 534: STXA_R	stxa	%r14, [%r10 + %r11] 0x80
	.word 0xc3eaa1a8  ! 535: PREFETCHA_I	prefetcha	[%r10, + 0x01a8] %asi, #one_read
	.word 0x8d6a800b  ! 537: SDIVX_R	sdivx	%r10, %r11, %r6
	.word 0xe2b2ac40  ! 538: STHA_I	stha	%r17, [%r10 + 0x0c40] %asi
	.word 0xe482900b  ! 539: LDUWA_R	lduwa	[%r10, %r11] 0x80, %r18
	.word 0xfef2a888  ! 540: STXA_I	stxa	%r31, [%r10 + 0x0888] %asi
	.word 0x83daa0bc  ! 541: FLUSH_I	dis not found

	.word 0xaba288ab  ! 542: FSUBs	fsubs	%f10, %f11, %f21
	.word 0xcc9aaa00  ! 543: LDDA_I	ldda	[%r10, + 0x0a00] %asi, %r6
	.word 0xc26a800b  ! 545: LDSTUB_R	ldstub	%r1, [%r10 + %r11]
	.word 0xca4aa084  ! 546: LDSB_I	ldsb	[%r10 + 0x0084], %r5
	.word 0xc322adb4  ! 547: STF_I	st	%f1, [0x0db4, %r10]
	.word 0x8ad2a630  ! 548: UMULcc_I	umulcc 	%r10, 0x0630, %r5
	.word 0x93daa430  ! 549: FLUSH_I	dis not found

	.word 0xe6c2900b  ! 550: LDSWA_R	ldswa	[%r10, %r11] 0x80, %r19
	.word 0x2cc20001  ! 551: BRGZ	brgz,a,nt	%8,<label_0x20001>
	.word 0x98d2800b  ! 552: UMULcc_R	umulcc 	%r10, %r11, %r12
	.word 0x36800001  ! 553: BGE	bge,a	<label_0x1>
	.word 0x00800003  ! 554: BN	bn  	<label_0x3>
	.word 0xc4ea900b  ! 555: LDSTUBA_R	ldstuba	%r2, [%r10 + %r11] 0x80
	.word 0x8e72800b  ! 556: UDIV_R	udiv 	%r10, %r11, %r7
	.word 0xc3e2a00b  ! 557: CASA_R	casa	[%r10] %asi, %r11, %r1
	.word 0xcea2a998  ! 558: STWA_I	stwa	%r7, [%r10 + 0x0998] %asi
	.word 0xc8caa094  ! 559: LDSBA_I	ldsba	[%r10, + 0x0094] %asi, %r4
	.word 0x8f22800b  ! 560: MULScc_R	mulscc 	%r10, %r11, %r7
	.word 0xc3eaafe4  ! 561: PREFETCHA_I	prefetcha	[%r10, + 0x0fe4] %asi, #one_read
	.word 0x89da800b  ! 562: FLUSH_R	dis not found

	.word 0xcf22800b  ! 563: STF_R	st	%f7, [%r11, %r10]
	.word 0xca6aa8b4  ! 564: LDSTUB_I	ldstub	%r5, [%r10 + 0x08b4]
	.word 0xc882a6fc  ! 565: LDUWA_I	lduwa	[%r10, + 0x06fc] %asi, %r4
	.word 0xc282a214  ! 566: LDUWA_I	lduwa	[%r10, + 0x0214] %asi, %r1
	.word 0x8143c000  ! 567: STBAR	stbar
	.word 0xc2caa3a0  ! 568: LDSBA_I	ldsba	[%r10, + 0x03a0] %asi, %r1
	.word 0xc8f2a600  ! 569: STXA_I	stxa	%r4, [%r10 + 0x0600] %asi
	.word 0xcc52a920  ! 570: LDSH_I	ldsh	[%r10 + 0x0920], %r6
	.word 0xa4faa5bc  ! 571: SDIVcc_I	sdivcc 	%r10, 0x05bc, %r18
	.word 0x92da800b  ! 572: SMULcc_R	smulcc 	%r10, %r11, %r9
	.word 0xa9daabb8  ! 573: FLUSH_I	dis not found

	.word 0xd292abc8  ! 574: LDUHA_I	lduha	[%r10, + 0x0bc8] %asi, %r9
	.word 0xc09aa300  ! 575: LDDA_I	ldda	[%r10, + 0x0300] %asi, %r0
	.word 0xe4fa900b  ! 576: SWAPA_R	swapa	%r18, [%r10 + %r11] 0x80
	.word 0x8ad2af04  ! 577: UMULcc_I	umulcc 	%r10, 0x0f04, %r5
	.word 0xc80a800b  ! 578: LDUB_R	ldub	[%r10 + %r11], %r4
	.word 0xd2c2afbc  ! 579: LDSWA_I	ldswa	[%r10, + 0x0fbc] %asi, %r9
	.word 0x88fa800b  ! 580: SDIVcc_R	sdivcc 	%r10, %r11, %r4
	.word 0x9da2882b  ! 581: FADDs	fadds	%f10, %f11, %f14
	.word 0xd8b2900b  ! 582: STHA_R	stha	%r12, [%r10 + %r11] 0x80
	.word 0x8143e05e  ! 583: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0xa05a800b  ! 584: SMUL_R	smul 	%r10, %r11, %r16
	.word 0x93a289ab  ! 585: FDIVs	fdivs	%f10, %f11, %f9
	.word 0x8d22800b  ! 586: MULScc_R	mulscc 	%r10, %r11, %r6
	.word 0xd33a800b  ! 587: STDF_R	std	%f9, [%r11, %r10]
	.word 0xa0d2800b  ! 588: UMULcc_R	umulcc 	%r10, %r11, %r16
	.word 0xc8ea900b  ! 589: LDSTUBA_R	ldstuba	%r4, [%r10 + %r11] 0x80
	.word 0xceb2900b  ! 590: STHA_R	stha	%r7, [%r10 + %r11] 0x80
	.word 0xf67aacfc  ! 591: SWAP_I	swap	%r27, [%r10 + 0x0cfc]
	.word 0x89a2882b  ! 592: FADDs	fadds	%f10, %f11, %f4
	.word 0xd0c2a158  ! 593: LDSWA_I	ldswa	[%r10, + 0x0158] %asi, %r8
	.word 0xfa82900b  ! 594: LDUWA_R	lduwa	[%r10, %r11] 0x80, %r29
	.word 0xa07a800b  ! 595: SDIV_R	sdiv 	%r10, %r11, %r16
	.word 0x2aca0003  ! 596: BRNZ	brnz,a,pt	%8,<label_0xa0003>
	.word 0x3a800003  ! 597: BCC	bcc,a	<label_0x3>
	.word 0xc36a800b  ! 598: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x8143c000  ! 599: STBAR	stbar
	.word 0xcc4a800b  ! 601: LDSB_R	ldsb	[%r10 + %r11], %r6
	.word 0x8143c000  ! 602: STBAR	stbar
	stxa	%r6, [%r10 + %r11] 0x80	
	.word 0x00800001  ! 605: BN	bn  	<label_0x1>
	.word 0x906aa7a0  ! 606: UDIVX_I	udivx 	%r10, 0x07a0, %r8
	.word 0x8ad2abb8  ! 607: UMULcc_I	umulcc 	%r10, 0x0bb8, %r5
	.word 0x8143c000  ! 609: STBAR	stbar
	.word 0xde8aaf3c  ! 610: LDUBA_I	lduba	[%r10, + 0x0f3c] %asi, %r15
	.word 0xe33a800b  ! 611: STDF_R	std	%f17, [%r11, %r10]
	.word 0xbafaaa80  ! 612: SDIVcc_I	sdivcc 	%r10, 0x0a80, %r29
	.word 0x85daa284  ! 613: FLUSH_I	dis not found

	.word 0xda6aa4cc  ! 614: LDSTUB_I	ldstub	%r13, [%r10 + 0x04cc]
	.word 0x83a289ab  ! 615: FDIVs	fdivs	%f10, %f11, %f1
	.word 0xe122a360  ! 616: STF_I	st	%f16, [0x0360, %r10]
	.word 0xcac2a880  ! 617: LDSWA_I	ldswa	[%r10, + 0x0880] %asi, %r5
	.word 0x9072accc  ! 618: UDIV_I	udiv 	%r10, 0x0ccc, %r8
	.word 0x8143e029  ! 619: MEMBAR	membar	#LoadLoad | #StoreStore | #MemIssue 
	.word 0x0ec20001  ! 620: BRGEZ	brgez  ,nt	%8,<label_0x20001>
	.word 0xee52a744  ! 621: LDSH_I	ldsh	[%r10 + 0x0744], %r23
	.word 0x8cfaab84  ! 622: SDIVcc_I	sdivcc 	%r10, 0x0b84, %r6
	.word 0xc3ea900b  ! 623: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0xf6ea900b  ! 624: LDSTUBA_R	ldstuba	%r27, [%r10 + %r11] 0x80
	.word 0x8272800b  ! 625: UDIV_R	udiv 	%r10, %r11, %r1
	.word 0xede2a00b  ! 626: CASA_R	casa	[%r10] %asi, %r11, %r22
	.word 0x8c72a198  ! 627: UDIV_I	udiv 	%r10, 0x0198, %r6
	.word 0xcea2a824  ! 628: STWA_I	stwa	%r7, [%r10 + 0x0824] %asi
	.word 0x04800003  ! 629: BLE	ble  	<label_0x3>
	.word 0x8bdaadc4  ! 631: FLUSH_I	dis not found

	.word 0x83a2882b  ! 632: FADDs	fadds	%f10, %f11, %f1
	.word 0xe212800b  ! 633: LDUH_R	lduh	[%r10 + %r11], %r17
	stxa	%r24, [%r10 + 0x03a8] %asi	
	.word 0xca5aae90  ! 635: LDX_I	ldx	[%r10 + 0x0e90], %r5
	.word 0x83da800b  ! 636: FLUSH_R	dis not found

	.word 0xc3ea900b  ! 637: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0xc6da900b  ! 638: LDXA_R	ldxa	[%r10, %r11] 0x80, %r3
	.word 0xaddaa758  ! 639: FLUSH_I	dis not found

	.word 0x34800001  ! 640: BG	bg,a	<label_0x1>
	.word 0xe64a800b  ! 641: LDSB_R	ldsb	[%r10 + %r11], %r19
	.word 0x8143e064  ! 642: MEMBAR	membar	#LoadStore | #MemIssue | #Sync 
	.word 0xc73a800b  ! 643: STDF_R	std	%f3, [%r11, %r10]
	.word 0xc45aa118  ! 644: LDX_I	ldx	[%r10 + 0x0118], %r2
	.word 0xc9e2a00b  ! 645: CASA_R	casa	[%r10] %asi, %r11, %r4
	.word 0x24800003  ! 646: BLE	ble,a	<label_0x3>
	.word 0xee8a900b  ! 647: LDUBA_R	lduba	[%r10, %r11] 0x80, %r23
	.word 0xc6b2900b  ! 648: STHA_R	stha	%r3, [%r10 + %r11] 0x80
	.word 0xd04aa1ac  ! 649: LDSB_I	ldsb	[%r10 + 0x01ac], %r8
	.word 0x86f2800b  ! 650: UDIVcc_R	udivcc 	%r10, %r11, %r3
	.word 0xc33a800b  ! 651: STDF_R	std	%f1, [%r11, %r10]
	.word 0x8143e034  ! 652: MEMBAR	membar	#LoadStore | #Lookaside | #MemIssue 
	.word 0xe8b2a630  ! 653: STHA_I	stha	%r20, [%r10 + 0x0630] %asi
	.word 0xf8faabfc  ! 654: SWAPA_I	swapa	%r28, [%r10 + 0x0bfc] %asi
	.word 0x8143c000  ! 655: STBAR	stbar
	.word 0xcc82ac48  ! 656: LDUWA_I	lduwa	[%r10, + 0x0c48] %asi, %r6
	.word 0xde4aacac  ! 657: LDSB_I	ldsb	[%r10 + 0x0cac], %r15
	.word 0xd092900b  ! 658: LDUHA_R	lduha	[%r10, %r11] 0x80, %r8
	.word 0x8143c000  ! 659: STBAR	stbar
	.word 0x91a2882b  ! 660: FADDs	fadds	%f10, %f11, %f8
	.word 0x26c20001  ! 661: BRLZ	brlz,a,nt	%8,<label_0x20001>
	.word 0xaef2800b  ! 662: UDIVcc_R	udivcc 	%r10, %r11, %r23
	.word 0x2cc20003  ! 663: BRGZ	brgz,a,nt	%8,<label_0x20003>
	.word 0x26ca0001  ! 664: BRLZ	brlz,a,pt	%8,<label_0xa0001>
	.word 0x9ba2882b  ! 665: FADDs	fadds	%f10, %f11, %f13
	.word 0x30800003  ! 666: BA	ba,a	<label_0x3>
	.word 0x93da800b  ! 667: FLUSH_R	dis not found

	.word 0xd042abe8  ! 668: LDSW_I	ldsw	[%r10 + 0x0be8], %r8
	.word 0x87a2882b  ! 669: FADDs	fadds	%f10, %f11, %f3
	.word 0xe9f2a00b  ! 670: CASXA_R	casxa	[%r10]%asi, %r11, %r20
	.word 0xeab2900b  ! 671: STHA_R	stha	%r21, [%r10 + %r11] 0x80
	.word 0xc36a800b  ! 672: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x91daa6ec  ! 673: FLUSH_I	dis not found

	.word 0xd842a81c  ! 674: LDSW_I	ldsw	[%r10 + 0x081c], %r12
	.word 0x91daacb0  ! 675: FLUSH_I	dis not found

	.word 0x8e72ab48  ! 676: UDIV_I	udiv 	%r10, 0x0b48, %r7
	.word 0x8143e018  ! 677: MEMBAR	membar	#StoreStore | #Lookaside 
	.word 0xd07aa80c  ! 679: SWAP_I	swap	%r8, [%r10 + 0x080c]
	.word 0x3a800001  ! 680: BCC	bcc,a	<label_0x1>
	.word 0xc202800b  ! 681: LDUW_R	lduw	[%r10 + %r11], %r1
	.word 0x905a800b  ! 682: SMUL_R	smul 	%r10, %r11, %r8
	.word 0xfeca900b  ! 683: LDSBA_R	ldsba	[%r10, %r11] 0x80, %r31
	.word 0xf1e2a00b  ! 684: CASA_R	casa	[%r10] %asi, %r11, %r24
	.word 0x8143e048  ! 685: MEMBAR	membar	#StoreStore | #Sync 
	.word 0x02800003  ! 686: BE	be  	<label_0x3>
	.word 0x836a800b  ! 687: SDIVX_R	sdivx	%r10, %r11, %r1
	.word 0x904aaeb8  ! 688: MULX_I	mulx 	%r10, 0x0eb8, %r8
	.word 0x30800001  ! 689: BA	ba,a	<label_0x1>
	.word 0xc49aaa90  ! 690: LDDA_I	ldda	[%r10, + 0x0a90] %asi, %r2
	.word 0xc692ab24  ! 691: LDUHA_I	lduha	[%r10, + 0x0b24] %asi, %r3
	.word 0xd242a300  ! 692: LDSW_I	ldsw	[%r10 + 0x0300], %r9
	.word 0xdde2900b  ! 693: CASA_I	casa	[%r10] 0x80, %r11, %r14
	.word 0x91daa72c  ! 694: FLUSH_I	dis not found

	.word 0x9d22800b  ! 695: MULScc_R	mulscc 	%r10, %r11, %r14
	.word 0xf692900b  ! 696: LDUHA_R	lduha	[%r10, %r11] 0x80, %r27
	.word 0xc73aaf90  ! 697: STDF_I	std	%f3, [0x0f90, %r10]
	.word 0xd212800b  ! 698: LDUH_R	lduh	[%r10 + %r11], %r9
	.word 0x8872800b  ! 699: UDIV_R	udiv 	%r10, %r11, %r4
	.word 0xacf2a8f0  ! 700: UDIVcc_I	udivcc 	%r10, 0x08f0, %r22
	.word 0xceb2900b  ! 701: STHA_R	stha	%r7, [%r10 + %r11] 0x80
	.word 0xc36a800b  ! 702: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x04800003  ! 703: BLE	ble  	<label_0x3>
	.word 0x8143e00d  ! 704: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore 
	.word 0xc6ea900b  ! 706: LDSTUBA_R	ldstuba	%r3, [%r10 + %r11] 0x80
	.word 0xa1da800b  ! 707: FLUSH_R	dis not found

	.word 0xd8f2a4e0  ! 708: STXA_I	stxa	%r12, [%r10 + 0x04e0] %asi
	.word 0xca92a750  ! 709: LDUHA_I	lduha	[%r10, + 0x0750] %asi, %r5
	.word 0xbfda800b  ! 710: FLUSH_R	dis not found

	.word 0x00800001  ! 711: BN	bn  	<label_0x1>
	.word 0x8143e071  ! 712: MEMBAR	membar	#LoadLoad | #Lookaside | #MemIssue | #Sync 
	.word 0x8143c000  ! 713: STBAR	stbar
	.word 0xcb22800b  ! 714: STF_R	st	%f5, [%r11, %r10]
	.word 0xca02aa40  ! 715: LDUW_I	lduw	[%r10 + 0x0a40], %r5
	.word 0xc36aa3ac  ! 716: PREFETCH_I	prefetch	[%r10 + 0x03ac], #one_read
	.word 0xed3a800b  ! 717: STDF_R	std	%f22, [%r11, %r10]
	.word 0xcaeaa924  ! 718: LDSTUBA_I	ldstuba	%r5, [%r10 + 0x0924] %asi
	.word 0x8852800b  ! 719: UMUL_R	umul 	%r10, %r11, %r4
	.word 0xccfa900b  ! 720: SWAPA_R	swapa	%r6, [%r10 + %r11] 0x80
	.word 0xce02800b  ! 722: LDUW_R	lduw	[%r10 + %r11], %r7
	.word 0x90fa800b  ! 723: SDIVcc_R	sdivcc 	%r10, %r11, %r8
	.word 0x926aaa60  ! 724: UDIVX_I	udivx 	%r10, 0x0a60, %r9
	.word 0xd0f2900b  ! 725: STXA_R	stxa	%r8, [%r10 + %r11] 0x80
	.word 0x89daace4  ! 726: FLUSH_I	dis not found

	.word 0xa8faa874  ! 727: SDIVcc_I	sdivcc 	%r10, 0x0874, %r20
	.word 0x865aaf7c  ! 728: SMUL_I	smul 	%r10, 0x0f7c, %r3
	.word 0xeada900b  ! 729: LDXA_R	ldxa	[%r10, %r11] 0x80, %r21
	.word 0x24800003  ! 730: BLE	ble,a	<label_0x3>
	.word 0xc7e2a00b  ! 731: CASA_R	casa	[%r10] %asi, %r11, %r3
	.word 0x88da800b  ! 732: SMULcc_R	smulcc 	%r10, %r11, %r4
	.word 0xc33a800b  ! 733: STDF_R	std	%f1, [%r11, %r10]
	.word 0x8143c000  ! 734: STBAR	stbar
	.word 0xc3eaa2cc  ! 735: PREFETCHA_I	prefetcha	[%r10, + 0x02cc] %asi, #one_read
	.word 0x87a2892b  ! 736: FMULs	fmuls	%f10, %f11, %f3
	.word 0xc2eaa974  ! 737: LDSTUBA_I	ldstuba	%r1, [%r10 + 0x0974] %asi
	.word 0xc2aa900b  ! 738: STBA_R	stba	%r1, [%r10 + %r11] 0x80
	.word 0x83daac54  ! 739: FLUSH_I	dis not found

	.word 0xced2900b  ! 740: LDSHA_R	ldsha	[%r10, %r11] 0x80, %r7
	.word 0x92d2a5ec  ! 742: UMULcc_I	umulcc 	%r10, 0x05ec, %r9
	.word 0x847a800b  ! 743: SDIV_R	sdiv 	%r10, %r11, %r2
	.word 0xceaa900b  ! 744: STBA_R	stba	%r7, [%r10 + %r11] 0x80
	.word 0x8a5a800b  ! 745: SMUL_R	smul 	%r10, %r11, %r5
	.word 0x87da800b  ! 746: FLUSH_R	dis not found

	.word 0x8143e020  ! 747: MEMBAR	membar	#MemIssue 
	.word 0x8a5aa9bc  ! 748: SMUL_I	smul 	%r10, 0x09bc, %r5
	.word 0xcfe2900b  ! 749: CASA_I	casa	[%r10] 0x80, %r11, %r7
	.word 0xf53aad40  ! 750: STDF_I	std	%f26, [0x0d40, %r10]
	.word 0x88da800b  ! 751: SMULcc_R	smulcc 	%r10, %r11, %r4
	.word 0x8a7aa520  ! 752: SDIV_I	sdiv 	%r10, 0x0520, %r5
	.word 0xada2892b  ! 753: FMULs	fmuls	%f10, %f11, %f22
	.word 0x83daa994  ! 754: FLUSH_I	dis not found

	.word 0x93a2882b  ! 755: FADDs	fadds	%f10, %f11, %f9
	.word 0x14800003  ! 756: BG	bg  	<label_0x3>
	.word 0x8143e06f  ! 757: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #MemIssue | #Sync 
	.word 0xe33aa4e0  ! 758: STDF_I	std	%f17, [0x04e0, %r10]
	.word 0x9a5aabe8  ! 759: SMUL_I	smul 	%r10, 0x0be8, %r13
	.word 0x8143c000  ! 760: STBAR	stbar
	.word 0x8143c000  ! 761: STBAR	stbar
	.word 0xc402800b  ! 762: LDUW_R	lduw	[%r10 + %r11], %r2
	.word 0x8452800b  ! 763: UMUL_R	umul 	%r10, %r11, %r2
	.word 0xcfe2900b  ! 764: CASA_I	casa	[%r10] 0x80, %r11, %r7
	.word 0x02800001  ! 765: BE	be  	<label_0x1>
	.word 0xb6faaef4  ! 766: SDIVcc_I	sdivcc 	%r10, 0x0ef4, %r27
	.word 0xc3eaa510  ! 767: PREFETCHA_I	prefetcha	[%r10, + 0x0510] %asi, #one_read
	.word 0xa1daa68c  ! 768: FLUSH_I	dis not found

	.word 0x02800001  ! 769: BE	be  	<label_0x1>
	.word 0x8143c000  ! 770: STBAR	stbar
	stxa	%r16, [%r10 + %r11] 0x80	
	.word 0xf522a3c4  ! 772: STF_I	st	%f26, [0x03c4, %r10]
	.word 0x8143e005  ! 773: MEMBAR	membar	#LoadLoad | #LoadStore 
	.word 0xc5f2900b  ! 774: CASXA_I	casxa	[%r10] 0x80, %r11, %r2
	.word 0xc49aa1b0  ! 775: LDDA_I	ldda	[%r10, + 0x01b0] %asi, %r2
	.word 0xa1daaf40  ! 776: FLUSH_I	dis not found

	.word 0xcea2900b  ! 777: STWA_R	stwa	%r7, [%r10 + %r11] 0x80
	.word 0xdcc2900b  ! 778: LDSWA_R	ldswa	[%r10, %r11] 0x80, %r14
	.word 0xcd3aa728  ! 779: STDF_I	std	%f6, [0x0728, %r10]
	.word 0xc3eaadf4  ! 780: PREFETCHA_I	prefetcha	[%r10, + 0x0df4] %asi, #one_read
	.word 0xcff2900b  ! 781: CASXA_I	casxa	[%r10] 0x80, %r11, %r7
	.word 0xb3a289ab  ! 782: FDIVs	fdivs	%f10, %f11, %f25
	.word 0x14800001  ! 783: BG	bg  	<label_0x1>
	.word 0xb7a289ab  ! 784: FDIVs	fdivs	%f10, %f11, %f27
	.word 0x907a800b  ! 785: SDIV_R	sdiv 	%r10, %r11, %r8
	.word 0xb04a800b  ! 787: MULX_R	mulx 	%r10, %r11, %r24
	.word 0x8143c000  ! 788: STBAR	stbar
	.word 0xd0a2a164  ! 789: STWA_I	stwa	%r8, [%r10 + 0x0164] %asi
	.word 0xcc8aa280  ! 790: LDUBA_I	lduba	[%r10, + 0x0280] %asi, %r6
	.word 0xc2d2900b  ! 791: LDSHA_R	ldsha	[%r10, %r11] 0x80, %r1
	.word 0x22800003  ! 792: BE	be,a	<label_0x3>
	.word 0x8143e021  ! 793: MEMBAR	membar	#LoadLoad | #MemIssue 
	.word 0xc4a2a838  ! 794: STWA_I	stwa	%r2, [%r10 + 0x0838] %asi
	.word 0x02c20003  ! 795: BRZ	brz  ,nt	%8,<label_0x20003>
	.word 0x91a2892b  ! 796: FMULs	fmuls	%f10, %f11, %f8
	.word 0x82d2800b  ! 797: UMULcc_R	umulcc 	%r10, %r11, %r1
	.word 0xc36a800b  ! 798: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x1e800001  ! 799: BVC	bvc  	<label_0x1>
	.word 0xacda800b  ! 800: SMULcc_R	smulcc 	%r10, %r11, %r22
	.word 0x93da800b  ! 801: FLUSH_R	dis not found

	.word 0xd1e2a00b  ! 802: CASA_R	casa	[%r10] %asi, %r11, %r8
	.word 0x18800001  ! 803: BGU	bgu  	<label_0x1>
	.word 0xcadaac90  ! 804: LDXA_I	ldxa	[%r10, + 0x0c90] %asi, %r5
	.word 0x83da800b  ! 805: FLUSH_R	dis not found

	.word 0x8143c000  ! 806: STBAR	stbar
	.word 0x8a6a800b  ! 807: UDIVX_R	udivx 	%r10, %r11, %r5
	.word 0xc2b2900b  ! 808: STHA_R	stha	%r1, [%r10 + %r11] 0x80
	.word 0xe67aaac0  ! 809: SWAP_I	swap	%r19, [%r10 + 0x0ac0]
	.word 0xcaea900b  ! 810: LDSTUBA_R	ldstuba	%r5, [%r10 + %r11] 0x80
	.word 0x93da800b  ! 811: FLUSH_R	dis not found

	.word 0xc452800b  ! 812: LDSH_R	ldsh	[%r10 + %r11], %r2
	.word 0xc802800b  ! 813: LDUW_R	lduw	[%r10 + %r11], %r4
	.word 0x87daaa60  ! 814: FLUSH_I	dis not found

	.word 0x2aca0001  ! 815: BRNZ	brnz,a,pt	%8,<label_0xa0001>
	.word 0x86da800b  ! 816: SMULcc_R	smulcc 	%r10, %r11, %r3
	.word 0xd09a900b  ! 817: LDDA_R	ldda	[%r10, %r11] 0x80, %r8
	.word 0xffe2a00b  ! 818: CASA_R	casa	[%r10] %asi, %r11, %r31
	.word 0x91da800b  ! 819: FLUSH_R	dis not found

	.word 0xc3ea900b  ! 820: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0xb2f2a378  ! 821: UDIVcc_I	udivcc 	%r10, 0x0378, %r25
	.word 0x924aae24  ! 822: MULX_I	mulx 	%r10, 0x0e24, %r9
	.word 0x87da800b  ! 823: FLUSH_R	dis not found

	.word 0xca42a0d0  ! 824: LDSW_I	ldsw	[%r10 + 0x00d0], %r5
	.word 0xd202ad0c  ! 825: LDUW_I	lduw	[%r10 + 0x0d0c], %r9
	.word 0xf1f2900b  ! 826: CASXA_I	casxa	[%r10] 0x80, %r11, %r24
	.word 0x8143e052  ! 827: MEMBAR	membar	#StoreLoad | #Lookaside | #Sync 
	.word 0xac5aadc4  ! 828: SMUL_I	smul 	%r10, 0x0dc4, %r22
	.word 0xc6b2900b  ! 829: STHA_R	stha	%r3, [%r10 + %r11] 0x80
	.word 0xb25aa7e0  ! 830: SMUL_I	smul 	%r10, 0x07e0, %r25
	.word 0x8143c000  ! 831: STBAR	stbar
	stxa	%r8, [%r10 + %r11] 0x80	
	.word 0x9ddaab4c  ! 833: FLUSH_I	dis not found

	.word 0x0e800001  ! 834: BVS	bvs  	<label_0x1>
	.word 0x8143c000  ! 835: STBAR	stbar
	.word 0xfab2ad64  ! 836: STHA_I	stha	%r29, [%r10 + 0x0d64] %asi
	.word 0x865a800b  ! 837: SMUL_R	smul 	%r10, %r11, %r3
	.word 0xd282a290  ! 838: LDUWA_I	lduwa	[%r10, + 0x0290] %asi, %r9
	.word 0xb9a2892b  ! 839: FMULs	fmuls	%f10, %f11, %f28
	.word 0x91a2892b  ! 840: FMULs	fmuls	%f10, %f11, %f8
	.word 0xd092a93c  ! 841: LDUHA_I	lduha	[%r10, + 0x093c] %asi, %r8
	.word 0x92d2800b  ! 842: UMULcc_R	umulcc 	%r10, %r11, %r9
	.word 0xc612a5c4  ! 843: LDUH_I	lduh	[%r10 + 0x05c4], %r3
	.word 0x825aa5c0  ! 844: SMUL_I	smul 	%r10, 0x05c0, %r1
	.word 0xca8a900b  ! 845: LDUBA_R	lduba	[%r10, %r11] 0x80, %r5
	.word 0xf44aac14  ! 846: LDSB_I	ldsb	[%r10 + 0x0c14], %r26
	.word 0xb2daa268  ! 847: SMULcc_I	smulcc 	%r10, 0x0268, %r25
	.word 0xc3eaa5d0  ! 848: PREFETCHA_I	prefetcha	[%r10, + 0x05d0] %asi, #one_read
	.word 0x89daa6b4  ! 849: FLUSH_I	dis not found

	.word 0xed3a800b  ! 850: STDF_R	std	%f22, [%r11, %r10]
	.word 0x38800001  ! 851: BGU	bgu,a	<label_0x1>
	.word 0xbe52800b  ! 853: UMUL_R	umul 	%r10, %r11, %r31
	.word 0x826aa55c  ! 854: UDIVX_I	udivx 	%r10, 0x055c, %r1
	.word 0x8cf2800b  ! 855: UDIVcc_R	udivcc 	%r10, %r11, %r6
	.word 0xc2c2900b  ! 856: LDSWA_R	ldswa	[%r10, %r11] 0x80, %r1
	.word 0x8fdaafd0  ! 857: FLUSH_I	dis not found

	.word 0xa9daa6f0  ! 858: FLUSH_I	dis not found

	stxa	%r2, [%r10 + 0x06d8] %asi	
	.word 0x24c20001  ! 860: BRLEZ	brlez,a,nt	%8,<label_0x20001>
	.word 0x89a2892b  ! 861: FMULs	fmuls	%f10, %f11, %f4
	.word 0x92f2af5c  ! 862: UDIVcc_I	udivcc 	%r10, 0x0f5c, %r9
	.word 0xcc6a800b  ! 863: LDSTUB_R	ldstub	%r6, [%r10 + %r11]
	.word 0xe06aaa08  ! 864: LDSTUB_I	ldstub	%r16, [%r10 + 0x0a08]
	.word 0xdcb2900b  ! 865: STHA_R	stha	%r14, [%r10 + %r11] 0x80
	.word 0xd2d2a5f0  ! 866: LDSHA_I	ldsha	[%r10, + 0x05f0] %asi, %r9
	.word 0x1a800003  ! 867: BCC	bcc  	<label_0x3>
	.word 0x8143c000  ! 868: STBAR	stbar
	.word 0xbcfa800b  ! 869: SDIVcc_R	sdivcc 	%r10, %r11, %r30
	.word 0xcea2a234  ! 870: STWA_I	stwa	%r7, [%r10 + 0x0234] %asi
	.word 0xed3aa968  ! 871: STDF_I	std	%f22, [0x0968, %r10]
	.word 0x8143e066  ! 872: MEMBAR	membar	#StoreLoad | #LoadStore | #MemIssue | #Sync 
	.word 0x8272a5e0  ! 873: UDIV_I	udiv 	%r10, 0x05e0, %r1
	.word 0x8143c000  ! 874: STBAR	stbar
	.word 0xc8f2a4f0  ! 875: STXA_I	stxa	%r4, [%r10 + 0x04f0] %asi
	.word 0xd2da900b  ! 876: LDXA_R	ldxa	[%r10, %r11] 0x80, %r9
	.word 0xca4a800b  ! 877: LDSB_R	ldsb	[%r10 + %r11], %r5
	.word 0xc36aad90  ! 878: PREFETCH_I	prefetch	[%r10 + 0x0d90], #one_read
	.word 0xd212a3b0  ! 879: LDUH_I	lduh	[%r10 + 0x03b0], %r9
	.word 0x8a5a800b  ! 880: SMUL_R	smul 	%r10, %r11, %r5
	.word 0x8143c000  ! 881: STBAR	stbar
	.word 0x91da800b  ! 882: FLUSH_R	dis not found

	.word 0x8cd2800b  ! 884: UMULcc_R	umulcc 	%r10, %r11, %r6
	.word 0xfc1a800b  ! 885: LDD_R	ldd	[%r10 + %r11], %r30
	.word 0x8e52800b  ! 886: UMUL_R	umul 	%r10, %r11, %r7
	.word 0xb8d2800b  ! 887: UMULcc_R	umulcc 	%r10, %r11, %r28
	stxa	%r4, [%r10 + %r11] 0x80	
	.word 0x40000001  ! 890: CALL	call	disp30_1
	.word 0xce02a824  ! 891: LDUW_I	lduw	[%r10 + 0x0824], %r7
	.word 0xc36a800b  ! 892: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x8fda800b  ! 893: FLUSH_R	dis not found

	.word 0x8c6a800b  ! 895: UDIVX_R	udivx 	%r10, %r11, %r6
	.word 0xc252800b  ! 896: LDSH_R	ldsh	[%r10 + %r11], %r1
	.word 0x8143e021  ! 897: MEMBAR	membar	#LoadLoad | #MemIssue 
	.word 0x84f2acec  ! 898: UDIVcc_I	udivcc 	%r10, 0x0cec, %r2
	.word 0x8143e017  ! 899: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside 
	.word 0xc5f2900b  ! 900: CASXA_I	casxa	[%r10] 0x80, %r11, %r2
	.word 0xc6daa2e0  ! 901: LDXA_I	ldxa	[%r10, + 0x02e0] %asi, %r3
	.word 0x04800003  ! 902: BLE	ble  	<label_0x3>
	.word 0x8143e040  ! 903: MEMBAR	membar	#Sync 
	.word 0x2a800003  ! 904: BCS	bcs,a	<label_0x3>
	.word 0xc3ea900b  ! 905: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0x8efa800b  ! 906: SDIVcc_R	sdivcc 	%r10, %r11, %r7
	.word 0x24800003  ! 907: BLE	ble,a	<label_0x3>
	.word 0x85a2892b  ! 908: FMULs	fmuls	%f10, %f11, %f2
	.word 0xf20aa874  ! 909: LDUB_I	ldub	[%r10 + 0x0874], %r25
	.word 0xe0a2900b  ! 910: STWA_R	stwa	%r16, [%r10 + %r11] 0x80
	.word 0xc64a800b  ! 911: LDSB_R	ldsb	[%r10 + %r11], %r3
	.word 0x8143e077  ! 912: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside | #MemIssue | #Sync 
	.word 0x8452800b  ! 913: UMUL_R	umul 	%r10, %r11, %r2
	.word 0x84fa800b  ! 914: SDIVcc_R	sdivcc 	%r10, %r11, %r2
	.word 0x8adaaa14  ! 915: SMULcc_I	smulcc 	%r10, 0x0a14, %r5
	.word 0x8f6a800b  ! 916: SDIVX_R	sdivx	%r10, %r11, %r7
	.word 0x8da288ab  ! 917: FSUBs	fsubs	%f10, %f11, %f6
	.word 0x93a289ab  ! 918: FDIVs	fdivs	%f10, %f11, %f9
	.word 0xeeaa900b  ! 919: STBA_R	stba	%r23, [%r10 + %r11] 0x80
	.word 0x8e52ae04  ! 920: UMUL_I	umul 	%r10, 0x0e04, %r7
	.word 0x20800003  ! 921: BN	bn,a	<label_0x3>
	.word 0x9d22a37c  ! 922: MULScc_I	mulscc 	%r10, 0x037c, %r14
	.word 0x87a2892b  ! 923: FMULs	fmuls	%f10, %f11, %f3
	.word 0xc26aaef0  ! 924: LDSTUB_I	ldstub	%r1, [%r10 + 0x0ef0]
	.word 0xd06aa3bc  ! 925: LDSTUB_I	ldstub	%r8, [%r10 + 0x03bc]
	.word 0x93daaa74  ! 926: FLUSH_I	dis not found

	.word 0xdc52800b  ! 927: LDSH_R	ldsh	[%r10 + %r11], %r14
	.word 0xcc52800b  ! 928: LDSH_R	ldsh	[%r10 + %r11], %r6
	.word 0xc73aa338  ! 929: STDF_I	std	%f3, [0x0338, %r10]
	.word 0x88daa020  ! 930: SMULcc_I	smulcc 	%r10, 0x0020, %r4
	.word 0xeb3a800b  ! 931: STDF_R	std	%f21, [%r11, %r10]
	.word 0xb1da800b  ! 932: FLUSH_R	dis not found

	.word 0xc36aafbc  ! 933: PREFETCH_I	prefetch	[%r10 + 0x0fbc], #one_read
	.word 0x8143c000  ! 934: STBAR	stbar
	.word 0x9072a0bc  ! 935: UDIV_I	udiv 	%r10, 0x00bc, %r8
	.word 0x8c7aa820  ! 937: SDIV_I	sdiv 	%r10, 0x0820, %r6
	.word 0xaef2ab58  ! 938: UDIVcc_I	udivcc 	%r10, 0x0b58, %r23
	.word 0x8c5aa7e4  ! 939: SMUL_I	smul 	%r10, 0x07e4, %r6
	.word 0xc4caaf1c  ! 940: LDSBA_I	ldsba	[%r10, + 0x0f1c] %asi, %r2
	.word 0xb8fa800b  ! 941: SDIVcc_R	sdivcc 	%r10, %r11, %r28
	.word 0xd292a200  ! 942: LDUHA_I	lduha	[%r10, + 0x0200] %asi, %r9
	.word 0xcc9a900b  ! 943: LDDA_R	ldda	[%r10, %r11] 0x80, %r6
	.word 0xcc52800b  ! 944: LDSH_R	ldsh	[%r10 + %r11], %r6
	.word 0xbda2892b  ! 945: FMULs	fmuls	%f10, %f11, %f30
	.word 0xf6b2900b  ! 946: STHA_R	stha	%r27, [%r10 + %r11] 0x80
	.word 0xaddaab20  ! 947: FLUSH_I	dis not found

	.word 0x8143c000  ! 948: STBAR	stbar
	.word 0xe1e2a00b  ! 949: CASA_R	casa	[%r10] %asi, %r11, %r16
	.word 0xcc7aa058  ! 950: SWAP_I	swap	%r6, [%r10 + 0x0058]
	.word 0x8ba2892b  ! 951: FMULs	fmuls	%f10, %f11, %f5
	.word 0xd8b2900b  ! 952: STHA_R	stha	%r12, [%r10 + %r11] 0x80
	.word 0xdd3aa730  ! 953: STDF_I	std	%f14, [0x0730, %r10]
	.word 0x8143c000  ! 954: STBAR	stbar
	.word 0xc6a2adc8  ! 955: STWA_I	stwa	%r3, [%r10 + 0x0dc8] %asi
	.word 0x89da800b  ! 956: FLUSH_R	dis not found

	.word 0x8143c000  ! 957: STBAR	stbar
	.word 0x24c20001  ! 958: BRLEZ	brlez,a,nt	%8,<label_0x20001>
	.word 0xcaf2900b  ! 959: STXA_R	stxa	%r5, [%r10 + %r11] 0x80
	.word 0xbda2882b  ! 960: FADDs	fadds	%f10, %f11, %f30
	.word 0xc53aaf60  ! 961: STDF_I	std	%f2, [0x0f60, %r10]
	.word 0xb27a800b  ! 962: SDIV_R	sdiv 	%r10, %r11, %r25
	.word 0x99da800b  ! 963: FLUSH_R	dis not found

	.word 0x2a800001  ! 964: BCS	bcs,a	<label_0x1>
	.word 0xc36a800b  ! 965: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x8143c000  ! 967: STBAR	stbar
	.word 0x8a6aa3c8  ! 968: UDIVX_I	udivx 	%r10, 0x03c8, %r5
	.word 0x8bdaad20  ! 969: FLUSH_I	dis not found

	.word 0xdaa2900b  ! 970: STWA_R	stwa	%r13, [%r10 + %r11] 0x80
	.word 0xe212a3d8  ! 971: LDUH_I	lduh	[%r10 + 0x03d8], %r17
	.word 0x91da800b  ! 972: FLUSH_R	dis not found

	.word 0x99a289ab  ! 973: FDIVs	fdivs	%f10, %f11, %f12
	.word 0xc47a800b  ! 974: SWAP_R	swap	%r2, [%r10 + %r11]
	.word 0xcc5a800b  ! 975: LDX_R	ldx	[%r10 + %r11], %r6
	.word 0x0cc20001  ! 976: BRGZ	brgz  ,nt	%8,<label_0x20001>
	.word 0xc282a4c8  ! 977: LDUWA_I	lduwa	[%r10, + 0x04c8] %asi, %r1
	.word 0x40000003  ! 978: CALL	call	disp30_3
	.word 0x3c800001  ! 979: BPOS	bpos,a	<label_0x1>
	.word 0x82f2800b  ! 980: UDIVcc_R	udivcc 	%r10, %r11, %r1
	.word 0x93da800b  ! 981: FLUSH_R	dis not found

	.word 0xc53a800b  ! 982: STDF_R	std	%f2, [%r11, %r10]
	.word 0xd892900b  ! 983: LDUHA_R	lduha	[%r10, %r11] 0x80, %r12
	.word 0x91daac74  ! 984: FLUSH_I	dis not found

	.word 0x8e6aa61c  ! 985: UDIVX_I	udivx 	%r10, 0x061c, %r7
	.word 0xc36a800b  ! 986: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x8722800b  ! 988: MULScc_R	mulscc 	%r10, %r11, %r3
	.word 0xd05aa7e8  ! 989: LDX_I	ldx	[%r10 + 0x07e8], %r8
	.word 0xc28aa2f8  ! 990: LDUBA_I	lduba	[%r10, + 0x02f8] %asi, %r1
	.word 0xfec2900b  ! 991: LDSWA_R	ldswa	[%r10, %r11] 0x80, %r31
	.word 0x00800003  ! 993: BN	bn  	<label_0x3>
	.word 0xd13aa340  ! 994: STDF_I	std	%f8, [0x0340, %r10]
	.word 0x16800003  ! 995: BGE	bge  	<label_0x3>
	.word 0x18800001  ! 996: BGU	bgu  	<label_0x1>
	.word 0xc8daa9b0  ! 997: LDXA_I	ldxa	[%r10, + 0x09b0] %asi, %r4
	.word 0x83da800b  ! 998: FLUSH_R	dis not found

	.word 0x8143c000  ! 999: STBAR	stbar
	nop
	nop
	nop
        ta      T_GOOD_TRAP
th_main_3:
        setx  MAIN_BASE_DATA_VA, %r1, %r10
        setx  0x0000000000000290, %g1, %r11
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
        setx  0x3fa1e6c020f67124, %g1, %r0
        setx  0xae3bddc5d29895a0, %g1, %r1
        setx  0x23b12a3f9d607eea, %g1, %r2
        setx  0x147f2fe147c11a8c, %g1, %r3
        setx  0x49a4557e697f47ca, %g1, %r4
        setx  0x24f4c625b2269e45, %g1, %r5
        setx  0x078b90d9af3a7c1c, %g1, %r6
        setx  0xb441d5c0980f0bc1, %g1, %r7
        setx  0x5c2b97e5250d3407, %g1, %r8
        setx  0x948dacf8613185a9, %g1, %r9
        setx  0x396150af8a2508e1, %g1, %r12
        setx  0x4fe3ba523dc5d875, %g1, %r13
        setx  0x83879e459e1052c8, %g1, %r14
        setx  0xcdb35554cd7a6e57, %g1, %r15
        setx  0x337eafa6c9cc419f, %g1, %r16
        setx  0xb89c03f451f7e02c, %g1, %r17
        setx  0x67ba8f16c88b268c, %g1, %r18
        setx  0xc302a982c324a898, %g1, %r19
        setx  0x30714602c0e3fd80, %g1, %r20
        setx  0xe97298a6d00c7029, %g1, %r21
        setx  0xbbe0fa900b0e5e5d, %g1, %r22
        setx  0x0060ae742193817c, %g1, %r23
        setx  0xd5034aaa43fbde6f, %g1, %r24
        setx  0x569333642c87def8, %g1, %r25
        setx  0xc4a1c754a3d76872, %g1, %r26
        setx  0x4f832c61d7823fc7, %g1, %r27
        setx  0xaee09f6ac4ab2e32, %g1, %r28
        setx  0x465269a2486670ce, %g1, %r29
        setx  0x12ecdd4a99ef58f4, %g1, %r30
        setx  0x6d53b17485a96857, %g1, %r31
	.word 0x8afaa744  ! 5: SDIVcc_I	sdivcc 	%r10, 0x0744, %r5
	.word 0x8143e03e  ! 7: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0xcf3aafd8  ! 8: STDF_I	std	%f7, [0x0fd8, %r10]
	stxa	%r20, [%r10 + %r11] 0x80	
	.word 0x8143e04f  ! 11: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #Sync 
	.word 0xc6eaa590  ! 12: LDSTUBA_I	ldstuba	%r3, [%r10 + 0x0590] %asi
	.word 0xf802a174  ! 13: LDUW_I	lduw	[%r10 + 0x0174], %r28
	.word 0x8143e035  ! 14: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside | #MemIssue 
	.word 0xf4d2a010  ! 15: LDSHA_I	ldsha	[%r10, + 0x0010] %asi, %r26
	.word 0x836aac74  ! 16: SDIVX_I	sdivx	%r10, 0x0c74, %r1
	.word 0xce5a800b  ! 17: LDX_R	ldx	[%r10 + %r11], %r7
	.word 0x907a800b  ! 18: SDIV_R	sdiv 	%r10, %r11, %r8
	.word 0xcdf2a00b  ! 19: CASXA_R	casxa	[%r10]%asi, %r11, %r6
	.word 0xa96a800b  ! 20: SDIVX_R	sdivx	%r10, %r11, %r20
	.word 0x8143c000  ! 21: STBAR	stbar
	.word 0xf09aa318  ! 22: LDDA_I	ldda	[%r10, + 0x0318] %asi, %r24
	.word 0xaddaa1cc  ! 23: FLUSH_I	dis not found

	.word 0xccf2a5d8  ! 24: STXA_I	stxa	%r6, [%r10 + 0x05d8] %asi
	.word 0xfb22800b  ! 25: STF_R	st	%f29, [%r11, %r10]
	.word 0xe1e2900b  ! 26: CASA_I	casa	[%r10] 0x80, %r11, %r16
	.word 0xbed2800b  ! 27: UMULcc_R	umulcc 	%r10, %r11, %r31
	.word 0x8dda800b  ! 28: FLUSH_R	dis not found

	.word 0xecb2ac90  ! 29: STHA_I	stha	%r22, [%r10 + 0x0c90] %asi
	.word 0x925a800b  ! 30: SMUL_R	smul 	%r10, %r11, %r9
	.word 0xc36a800b  ! 31: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x8143c000  ! 33: STBAR	stbar
	.word 0xb1da800b  ! 34: FLUSH_R	dis not found

	stxa	%r28, [%r10 + %r11] 0x80
	.word 0xf5f2900b  ! 36: CASXA_I	casxa	[%r10] 0x80, %r11, %r26
	.word 0x84da800b  ! 37: SMULcc_R	smulcc 	%r10, %r11, %r2
	.word 0xd2a2af14  ! 39: STWA_I	stwa	%r9, [%r10 + 0x0f14] %asi
	.word 0xef22800b  ! 40: STF_R	st	%f23, [%r11, %r10]
	.word 0x0e800001  ! 41: BVS	bvs  	<label_0x1>
	.word 0x90d2a880  ! 42: UMULcc_I	umulcc 	%r10, 0x0880, %r8
	.word 0xd2ca900b  ! 44: LDSBA_R	ldsba	[%r10, %r11] 0x80, %r9
	.word 0xce52800b  ! 45: LDSH_R	ldsh	[%r10 + %r11], %r7
	.word 0xcaf2a648  ! 46: STXA_I	stxa	%r5, [%r10 + 0x0648] %asi
	.word 0x8e72800b  ! 47: UDIV_R	udiv 	%r10, %r11, %r7
	.word 0x38800001  ! 48: BGU	bgu,a	<label_0x1>
	.word 0x8143e040  ! 49: MEMBAR	membar	#Sync 
	.word 0xc8f2a9a0  ! 50: STXA_I	stxa	%r4, [%r10 + 0x09a0] %asi
	.word 0xc6faaa20  ! 51: SWAPA_I	swapa	%r3, [%r10 + 0x0a20] %asi
	.word 0xcc9aaa98  ! 52: LDDA_I	ldda	[%r10, + 0x0a98] %asi, %r6
	.word 0xcef2900b  ! 53: STXA_R	stxa	%r7, [%r10 + %r11] 0x80
	.word 0xce12800b  ! 54: LDUH_R	lduh	[%r10 + %r11], %r7
	.word 0xf6ca900b  ! 55: LDSBA_R	ldsba	[%r10, %r11] 0x80, %r27
	.word 0x2ec20001  ! 56: BRGEZ	brgez,a,nt	%8,<label_0x20001>
	.word 0x8143e011  ! 57: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xd2aaa3b8  ! 58: STBA_I	stba	%r9, [%r10 + 0x03b8] %asi
	.word 0xa0faa0fc  ! 59: SDIVcc_I	sdivcc 	%r10, 0x00fc, %r16
	.word 0xc8daa010  ! 60: LDXA_I	ldxa	[%r10, + 0x0010] %asi, %r4
	.word 0xc27a800b  ! 61: SWAP_R	swap	%r1, [%r10 + %r11]
	.word 0x98fa800b  ! 62: SDIVcc_R	sdivcc 	%r10, %r11, %r12
	.word 0xdff2a00b  ! 63: CASXA_R	casxa	[%r10]%asi, %r11, %r15
	.word 0xb4d2a20c  ! 64: UMULcc_I	umulcc 	%r10, 0x020c, %r26
	.word 0xa5daa804  ! 65: FLUSH_I	dis not found

	.word 0xf89aa288  ! 66: LDDA_I	ldda	[%r10, + 0x0288] %asi, %r28
	.word 0xd07a800b  ! 67: SWAP_R	swap	%r8, [%r10 + %r11]
	.word 0xcac2a014  ! 68: LDSWA_I	ldswa	[%r10, + 0x0014] %asi, %r5
	.word 0xa322a864  ! 69: MULScc_I	mulscc 	%r10, 0x0864, %r17
	.word 0x8bda800b  ! 70: FLUSH_R	dis not found

	.word 0x92d2800b  ! 71: UMULcc_R	umulcc 	%r10, %r11, %r9
	.word 0xe412800b  ! 72: LDUH_R	lduh	[%r10 + %r11], %r18
	.word 0x8143e05e  ! 73: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside | #Sync 
	stxa	%r8, [%r10 + 0x0318] %asi
	.word 0xaa5a800b  ! 75: SMUL_R	smul 	%r10, %r11, %r21
	.word 0xb47aaaac  ! 76: SDIV_I	sdiv 	%r10, 0x0aac, %r26
	.word 0xae5a800b  ! 77: SMUL_R	smul 	%r10, %r11, %r23
	.word 0x0e800001  ! 78: BVS	bvs  	<label_0x1>
	.word 0x0cca0001  ! 79: BRGZ	brgz  ,pt	%8,<label_0xa0001>
	.word 0x2c800001  ! 80: BNEG	bneg,a	<label_0x1>
	.word 0xc3eaa4a4  ! 81: PREFETCHA_I	prefetcha	[%r10, + 0x04a4] %asi, #one_read
	stxa	%r24, [%r10 + %r11] 0x80
	.word 0x8143c000  ! 83: STBAR	stbar
	.word 0x38800001  ! 84: BGU	bgu,a	<label_0x1>
	.word 0xb46aabb0  ! 85: UDIVX_I	udivx 	%r10, 0x0bb0, %r26
	.word 0xc402afa8  ! 86: LDUW_I	lduw	[%r10 + 0x0fa8], %r2
	.word 0x8143c000  ! 87: STBAR	stbar
	.word 0x18800001  ! 88: BGU	bgu  	<label_0x1>
	.word 0xcb3aa108  ! 89: STDF_I	std	%f5, [0x0108, %r10]
	.word 0xb9a289ab  ! 90: FDIVs	fdivs	%f10, %f11, %f28
	.word 0x08800003  ! 91: BLEU	bleu  	<label_0x3>
	.word 0xa3daa910  ! 92: FLUSH_I	dis not found

	.word 0xcf22800b  ! 93: STF_R	st	%f7, [%r11, %r10]
	.word 0xafdaadbc  ! 94: FLUSH_I	dis not found

	.word 0x8143e05a  ! 95: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside | #Sync 
	.word 0x866aa4ac  ! 96: UDIVX_I	udivx 	%r10, 0x04ac, %r3
	.word 0xa67a800b  ! 97: SDIV_R	sdiv 	%r10, %r11, %r19
	.word 0x8143c000  ! 98: STBAR	stbar
	.word 0xf2a2900b  ! 99: STWA_R	stwa	%r25, [%r10 + %r11] 0x80
	.word 0xf1f2a00b  ! 100: CASXA_R	casxa	[%r10]%asi, %r11, %r24
	.word 0x91da800b  ! 101: FLUSH_R	dis not found

	.word 0xd0f2900b  ! 102: STXA_R	stxa	%r8, [%r10 + %r11] 0x80
	.word 0xcc52a244  ! 103: LDSH_I	ldsh	[%r10 + 0x0244], %r6
	.word 0x8da289ab  ! 104: FDIVs	fdivs	%f10, %f11, %f6
	.word 0xe1f2a00b  ! 105: CASXA_R	casxa	[%r10]%asi, %r11, %r16
	.word 0xe3f2a00b  ! 106: CASXA_R	casxa	[%r10]%asi, %r11, %r17
	.word 0x8a7aa0a4  ! 107: SDIV_I	sdiv 	%r10, 0x00a4, %r5
	.word 0xfcaa900b  ! 108: STBA_R	stba	%r30, [%r10 + %r11] 0x80
	.word 0xc36aa9ec  ! 109: PREFETCH_I	prefetch	[%r10 + 0x09ec], #one_read
	.word 0x00800003  ! 110: BN	bn  	<label_0x3>
	.word 0x93daa268  ! 111: FLUSH_I	dis not found

	.word 0xde42a8c8  ! 112: LDSW_I	ldsw	[%r10 + 0x08c8], %r15
	.word 0x87daad78  ! 114: FLUSH_I	dis not found

	.word 0xce12800b  ! 115: LDUH_R	lduh	[%r10 + %r11], %r7
	.word 0x93a289ab  ! 116: FDIVs	fdivs	%f10, %f11, %f9
	stxa	%r6, [%r10 + %r11] 0x80
	.word 0xcaf2900b  ! 118: STXA_R	stxa	%r5, [%r10 + %r11] 0x80
	.word 0x8143e018  ! 119: MEMBAR	membar	#StoreStore | #Lookaside 
	.word 0x32800001  ! 120: BNE	bne,a	<label_0x1>
	.word 0xe4b2900b  ! 121: STHA_R	stha	%r18, [%r10 + %r11] 0x80
	.word 0x0c800001  ! 122: BNEG	bneg  	<label_0x1>
	.word 0xd01aa598  ! 123: LDD_I	ldd	[%r10 + 0x0598], %r8
	.word 0xd122800b  ! 124: STF_R	st	%f8, [%r11, %r10]
	.word 0x87da800b  ! 125: FLUSH_R	dis not found

	.word 0xa1da800b  ! 126: FLUSH_R	dis not found

	.word 0xd202800b  ! 127: LDUW_R	lduw	[%r10 + %r11], %r9
	.word 0xc3eaabbc  ! 128: PREFETCHA_I	prefetcha	[%r10, + 0x0bbc] %asi, #one_read
	.word 0x8fdaafb4  ! 130: FLUSH_I	dis not found

	stxa	%r24, [%r10 + 0x0980] %asi
	.word 0xd3e2a00b  ! 132: CASA_R	casa	[%r10] %asi, %r11, %r9
	.word 0x8143c000  ! 133: STBAR	stbar
	.word 0xd282a7d4  ! 134: LDUWA_I	lduwa	[%r10, + 0x07d4] %asi, %r9
	.word 0x8143e03a  ! 135: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside | #MemIssue 
	.word 0x8143c000  ! 136: STBAR	stbar
	.word 0x8143e07a  ! 137: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0x92d2800b  ! 138: UMULcc_R	umulcc 	%r10, %r11, %r9
	.word 0xccd2900b  ! 140: LDSHA_R	ldsha	[%r10, %r11] 0x80, %r6
	.word 0x2aca0003  ! 141: BRNZ	brnz,a,pt	%8,<label_0xa0003>
	.word 0x8b22800b  ! 142: MULScc_R	mulscc 	%r10, %r11, %r5
	.word 0x85da800b  ! 143: FLUSH_R	dis not found

	.word 0x84faa51c  ! 144: SDIVcc_I	sdivcc 	%r10, 0x051c, %r2
	.word 0xccf2900b  ! 145: STXA_R	stxa	%r6, [%r10 + %r11] 0x80
	.word 0x93da800b  ! 146: FLUSH_R	dis not found

	.word 0x8fda800b  ! 147: FLUSH_R	dis not found

	.word 0x8fdaa62c  ! 148: FLUSH_I	dis not found

	.word 0xd2da900b  ! 149: LDXA_R	ldxa	[%r10, %r11] 0x80, %r9
	.word 0xe7e2900b  ! 150: CASA_I	casa	[%r10] 0x80, %r11, %r19
	.word 0x8252a854  ! 151: UMUL_I	umul 	%r10, 0x0854, %r1
	.word 0x8852800b  ! 152: UMUL_R	umul 	%r10, %r11, %r4
	.word 0xb07aa60c  ! 153: SDIV_I	sdiv 	%r10, 0x060c, %r24
	.word 0xdc8aaf44  ! 154: LDUBA_I	lduba	[%r10, + 0x0f44] %asi, %r14
	.word 0xbda289ab  ! 155: FDIVs	fdivs	%f10, %f11, %f30
	.word 0x83da800b  ! 156: FLUSH_R	dis not found

	.word 0xc3eaa320  ! 157: PREFETCHA_I	prefetcha	[%r10, + 0x0320] %asi, #one_read
	.word 0xc20aa294  ! 158: LDUB_I	ldub	[%r10 + 0x0294], %r1
	.word 0xb5a2882b  ! 159: FADDs	fadds	%f10, %f11, %f26
	.word 0xe0aa900b  ! 160: STBA_R	stba	%r16, [%r10 + %r11] 0x80
	.word 0x0e800001  ! 161: BVS	bvs  	<label_0x1>
	.word 0xceb2900b  ! 162: STHA_R	stha	%r7, [%r10 + %r11] 0x80
	.word 0x836a800b  ! 163: SDIVX_R	sdivx	%r10, %r11, %r1
	.word 0x8143e061  ! 164: MEMBAR	membar	#LoadLoad | #MemIssue | #Sync 
	.word 0x8852800b  ! 165: UMUL_R	umul 	%r10, %r11, %r4
	.word 0xf652a6d4  ! 166: LDSH_I	ldsh	[%r10 + 0x06d4], %r27
	.word 0x8652af24  ! 167: UMUL_I	umul 	%r10, 0x0f24, %r3
	.word 0xe522af18  ! 168: STF_I	st	%f18, [0x0f18, %r10]
	.word 0xc8da900b  ! 169: LDXA_R	ldxa	[%r10, %r11] 0x80, %r4
	.word 0x8ada800b  ! 170: SMULcc_R	smulcc 	%r10, %r11, %r5
	.word 0xd092900b  ! 171: LDUHA_R	lduha	[%r10, %r11] 0x80, %r8
	.word 0x2cc20001  ! 172: BRGZ	brgz,a,nt	%8,<label_0x20001>
	.word 0x2eca0001  ! 173: BRGEZ	brgez,a,pt	%8,<label_0xa0001>
	.word 0xd002ae08  ! 174: LDUW_I	lduw	[%r10 + 0x0e08], %r8
	.word 0xe27a800b  ! 175: SWAP_R	swap	%r17, [%r10 + %r11]
	.word 0xdeaa900b  ! 176: STBA_R	stba	%r15, [%r10 + %r11] 0x80
	stxa	%r0, [%r10 + %r11] 0x80
	.word 0xc41a800b  ! 178: LDD_R	ldd	[%r10 + %r11], %r2
	.word 0xc3ea900b  ! 179: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0xd2aaaef8  ! 180: STBA_I	stba	%r9, [%r10 + 0x0ef8] %asi
	.word 0x83da800b  ! 181: FLUSH_R	dis not found

	.word 0x89da800b  ! 182: FLUSH_R	dis not found

	.word 0xc282900b  ! 183: LDUWA_R	lduwa	[%r10, %r11] 0x80, %r1
	.word 0xccaa900b  ! 184: STBA_R	stba	%r6, [%r10 + %r11] 0x80
	.word 0xcf22aeb0  ! 185: STF_I	st	%f7, [0x0eb0, %r10]
	.word 0x8143e075  ! 186: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside | #MemIssue | #Sync 
	.word 0xcb22a4ec  ! 187: STF_I	st	%f5, [0x04ec, %r10]
	.word 0x8143e05b  ! 188: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Lookaside | #Sync 
	.word 0x8fdaa274  ! 189: FLUSH_I	dis not found

	.word 0x08800003  ! 190: BLEU	bleu  	<label_0x3>
	.word 0xa1daa600  ! 191: FLUSH_I	dis not found

	.word 0xccb2a4b0  ! 192: STHA_I	stha	%r6, [%r10 + 0x04b0] %asi
	.word 0xc36aa0a4  ! 193: PREFETCH_I	prefetch	[%r10 + 0x00a4], #one_read
	.word 0xcfe2900b  ! 194: CASA_I	casa	[%r10] 0x80, %r11, %r7
	.word 0x91da800b  ! 195: FLUSH_R	dis not found

	.word 0xe6f2a558  ! 196: STXA_I	stxa	%r19, [%r10 + 0x0558] %asi
	.word 0x87a2892b  ! 197: FMULs	fmuls	%f10, %f11, %f3
	.word 0xe13aa5c8  ! 198: STDF_I	std	%f16, [0x05c8, %r10]
	.word 0xc89aac28  ! 199: LDDA_I	ldda	[%r10, + 0x0c28] %asi, %r4
	.word 0x845a800b  ! 200: SMUL_R	smul 	%r10, %r11, %r2
	.word 0xbfa288ab  ! 201: FSUBs	fsubs	%f10, %f11, %f31
	.word 0xc6fa900b  ! 202: SWAPA_R	swapa	%r3, [%r10 + %r11] 0x80
	.word 0x907aa160  ! 203: SDIV_I	sdiv 	%r10, 0x0160, %r8
	.word 0xccaaafbc  ! 204: STBA_I	stba	%r6, [%r10 + 0x0fbc] %asi
	.word 0x8cdaa204  ! 205: SMULcc_I	smulcc 	%r10, 0x0204, %r6
	.word 0x18800001  ! 206: BGU	bgu  	<label_0x1>
	.word 0x89da800b  ! 207: FLUSH_R	dis not found

	.word 0x896aa1b4  ! 208: SDIVX_I	sdivx	%r10, 0x01b4, %r4
	.word 0xd3e2900b  ! 209: CASA_I	casa	[%r10] 0x80, %r11, %r9
	.word 0x93daacac  ! 210: FLUSH_I	dis not found

	.word 0xed3a800b  ! 211: STDF_R	std	%f22, [%r11, %r10]
	.word 0x0e800001  ! 212: BVS	bvs  	<label_0x1>
	.word 0x825aa608  ! 213: SMUL_I	smul 	%r10, 0x0608, %r1
	.word 0xca0a800b  ! 214: LDUB_R	ldub	[%r10 + %r11], %r5
	.word 0xc3ea900b  ! 215: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0xfa0a800b  ! 216: LDUB_R	ldub	[%r10 + %r11], %r29
	.word 0x93a2892b  ! 217: FMULs	fmuls	%f10, %f11, %f9
	.word 0xd122800b  ! 218: STF_R	st	%f8, [%r11, %r10]
	.word 0xe0d2900b  ! 220: LDSHA_R	ldsha	[%r10, %r11] 0x80, %r16
	.word 0xdeaa900b  ! 221: STBA_R	stba	%r15, [%r10 + %r11] 0x80
	.word 0x8143e075  ! 222: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside | #MemIssue | #Sync 
	.word 0x8edaa6e8  ! 223: SMULcc_I	smulcc 	%r10, 0x06e8, %r7
	.word 0xf812ad4c  ! 224: LDUH_I	lduh	[%r10 + 0x0d4c], %r28
	.word 0x8a52800b  ! 225: UMUL_R	umul 	%r10, %r11, %r5
	.word 0xd3f2a00b  ! 226: CASXA_R	casxa	[%r10]%asi, %r11, %r9
	.word 0x8ddaa2b0  ! 227: FLUSH_I	dis not found

	.word 0xc36aa5e4  ! 228: PREFETCH_I	prefetch	[%r10 + 0x05e4], #one_read
	.word 0x8f6a800b  ! 229: SDIVX_R	sdivx	%r10, %r11, %r7
	.word 0x9f22800b  ! 230: MULScc_R	mulscc 	%r10, %r11, %r15
	.word 0x83da800b  ! 231: FLUSH_R	dis not found

	.word 0xde42800b  ! 232: LDSW_R	ldsw	[%r10 + %r11], %r15
	.word 0x8cf2800b  ! 233: UDIVcc_R	udivcc 	%r10, %r11, %r6
	.word 0x83a2882b  ! 234: FADDs	fadds	%f10, %f11, %f1
	.word 0x91daa55c  ! 235: FLUSH_I	dis not found

	.word 0xc642a5fc  ! 236: LDSW_I	ldsw	[%r10 + 0x05fc], %r3
	.word 0x8dda800b  ! 237: FLUSH_R	dis not found

	.word 0x8143c000  ! 238: STBAR	stbar
	.word 0xc8b2900b  ! 239: STHA_R	stha	%r4, [%r10 + %r11] 0x80
	.word 0xe00aab84  ! 240: LDUB_I	ldub	[%r10 + 0x0b84], %r16
	.word 0x1e800001  ! 241: BVC	bvc  	<label_0x1>
	.word 0xf05aafa8  ! 242: LDX_I	ldx	[%r10 + 0x0fa8], %r24
	.word 0xc41a800b  ! 243: LDD_R	ldd	[%r10 + %r11], %r2
	.word 0x8143e007  ! 244: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore 
	.word 0xfe02a848  ! 245: LDUW_I	lduw	[%r10 + 0x0848], %r31
	.word 0xc53aaec0  ! 246: STDF_I	std	%f2, [0x0ec0, %r10]
	.word 0xc88aac64  ! 247: LDUBA_I	lduba	[%r10, + 0x0c64] %asi, %r4
	.word 0x8a7a800b  ! 248: SDIV_R	sdiv 	%r10, %r11, %r5
	.word 0xfadaae58  ! 249: LDXA_I	ldxa	[%r10, + 0x0e58] %asi, %r29
	.word 0xf812800b  ! 250: LDUH_R	lduh	[%r10 + %r11], %r28
	.word 0xc3eaab30  ! 251: PREFETCHA_I	prefetcha	[%r10, + 0x0b30] %asi, #one_read
	.word 0x0e800001  ! 252: BVS	bvs  	<label_0x1>
	.word 0x28800001  ! 253: BLEU	bleu,a	<label_0x1>
	.word 0x8143c000  ! 254: STBAR	stbar
	.word 0xc6c2900b  ! 255: LDSWA_R	ldswa	[%r10, %r11] 0x80, %r3
	.word 0xd002800b  ! 256: LDUW_R	lduw	[%r10 + %r11], %r8
	.word 0x34800001  ! 257: BG	bg,a	<label_0x1>
	.word 0xca12a534  ! 258: LDUH_I	lduh	[%r10 + 0x0534], %r5
	.word 0x14800001  ! 259: BG	bg  	<label_0x1>
	.word 0xa922800b  ! 260: MULScc_R	mulscc 	%r10, %r11, %r20
	.word 0x8143c000  ! 261: STBAR	stbar
	.word 0xea8a900b  ! 262: LDUBA_R	lduba	[%r10, %r11] 0x80, %r21
	.word 0xd0fa900b  ! 263: SWAPA_R	swapa	%r8, [%r10 + %r11] 0x80
	.word 0x87a2882b  ! 264: FADDs	fadds	%f10, %f11, %f3
	.word 0x02c20001  ! 265: BRZ	brz  ,nt	%8,<label_0x20001>
	.word 0x89daaee4  ! 266: FLUSH_I	dis not found

	.word 0xc36aa5f4  ! 267: PREFETCH_I	prefetch	[%r10 + 0x05f4], #one_read
	.word 0x8e4a800b  ! 268: MULX_R	mulx 	%r10, %r11, %r7
	.word 0xc7f2900b  ! 270: CASXA_I	casxa	[%r10] 0x80, %r11, %r3
	.word 0xd2f2900b  ! 271: STXA_R	stxa	%r9, [%r10 + %r11] 0x80
	.word 0xc26a800b  ! 272: LDSTUB_R	ldstub	%r1, [%r10 + %r11]
	.word 0xcab2900b  ! 273: STHA_R	stha	%r5, [%r10 + %r11] 0x80
	.word 0x836a800b  ! 274: SDIVX_R	sdivx	%r10, %r11, %r1
	.word 0x84f2800b  ! 275: UDIVcc_R	udivcc 	%r10, %r11, %r2
	.word 0x8252800b  ! 276: UMUL_R	umul 	%r10, %r11, %r1
	.word 0xc3e2900b  ! 277: CASA_I	casa	[%r10] 0x80, %r11, %r1
	.word 0xf802a0dc  ! 278: LDUW_I	lduw	[%r10 + 0x00dc], %r28
	.word 0x2aca0001  ! 279: BRNZ	brnz,a,pt	%8,<label_0xa0001>
	.word 0xa7a2892b  ! 280: FMULs	fmuls	%f10, %f11, %f19
	.word 0xedf2a00b  ! 281: CASXA_R	casxa	[%r10]%asi, %r11, %r22
	.word 0xc36aac40  ! 282: PREFETCH_I	prefetch	[%r10 + 0x0c40], #one_read
	.word 0xc65a800b  ! 283: LDX_R	ldx	[%r10 + %r11], %r3
	.word 0x2c800001  ! 284: BNEG	bneg,a	<label_0x1>
	.word 0xd0eaa4f8  ! 285: LDSTUBA_I	ldstuba	%r8, [%r10 + 0x04f8] %asi
	.word 0xe802800b  ! 286: LDUW_R	lduw	[%r10 + %r11], %r20
	.word 0xc802acac  ! 288: LDUW_I	lduw	[%r10 + 0x0cac], %r4
	.word 0xd2a2900b  ! 289: STWA_R	stwa	%r9, [%r10 + %r11] 0x80
	.word 0x86da800b  ! 290: SMULcc_R	smulcc 	%r10, %r11, %r3
	.word 0xc49aaaf8  ! 291: LDDA_I	ldda	[%r10, + 0x0af8] %asi, %r2
	.word 0x886a800b  ! 293: UDIVX_R	udivx 	%r10, %r11, %r4
	.word 0xc202ac74  ! 294: LDUW_I	lduw	[%r10 + 0x0c74], %r1
	.word 0x83a2892b  ! 296: FMULs	fmuls	%f10, %f11, %f1
	.word 0xc36aacec  ! 297: PREFETCH_I	prefetch	[%r10 + 0x0cec], #one_read
	.word 0x85a288ab  ! 298: FSUBs	fsubs	%f10, %f11, %f2
	.word 0xe93aadf8  ! 299: STDF_I	std	%f20, [0x0df8, %r10]
	.word 0xa4daa23c  ! 300: SMULcc_I	smulcc 	%r10, 0x023c, %r18
	.word 0xd13a800b  ! 301: STDF_R	std	%f8, [%r11, %r10]
	.word 0x9052a0b4  ! 302: UMUL_I	umul 	%r10, 0x00b4, %r8
	.word 0xcf22800b  ! 303: STF_R	st	%f7, [%r11, %r10]
	.word 0xc01a800b  ! 304: LDD_R	ldd	[%r10 + %r11], %r0
	.word 0x8e52a5f0  ! 306: UMUL_I	umul 	%r10, 0x05f0, %r7
	.word 0x924aa0ac  ! 307: MULX_I	mulx 	%r10, 0x00ac, %r9
	.word 0xa252800b  ! 308: UMUL_R	umul 	%r10, %r11, %r17
	.word 0xccc2acd0  ! 309: LDSWA_I	ldswa	[%r10, + 0x0cd0] %asi, %r6
	.word 0xd2c2a384  ! 310: LDSWA_I	ldswa	[%r10, + 0x0384] %asi, %r9
	.word 0xfde2a00b  ! 311: CASA_R	casa	[%r10] %asi, %r11, %r30
	.word 0x20800001  ! 312: BN	bn,a	<label_0x1>
	.word 0xb44aae48  ! 313: MULX_I	mulx 	%r10, 0x0e48, %r26
	.word 0x8143c000  ! 314: STBAR	stbar
	.word 0x8143e057  ! 315: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside | #Sync 
	.word 0x91da800b  ! 316: FLUSH_R	dis not found

	.word 0xea0a800b  ! 317: LDUB_R	ldub	[%r10 + %r11], %r21
	.word 0xe9f2900b  ! 318: CASXA_I	casxa	[%r10] 0x80, %r11, %r20
	.word 0xce6a800b  ! 319: LDSTUB_R	ldstub	%r7, [%r10 + %r11]
	.word 0xd092900b  ! 320: LDUHA_R	lduha	[%r10, %r11] 0x80, %r8
	.word 0x8143c000  ! 321: STBAR	stbar
	.word 0xfe4a800b  ! 322: LDSB_R	ldsb	[%r10 + %r11], %r31
	.word 0x8143c000  ! 323: STBAR	stbar
	.word 0x93a2882b  ! 324: FADDs	fadds	%f10, %f11, %f9
	.word 0x856a800b  ! 325: SDIVX_R	sdivx	%r10, %r11, %r2
	.word 0x8143c000  ! 326: STBAR	stbar
	.word 0x04800001  ! 327: BLE	ble  	<label_0x1>
	.word 0x89da800b  ! 328: FLUSH_R	dis not found

	.word 0x8143e01f  ! 329: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #Lookaside 
	.word 0xf7e2900b  ! 330: CASA_I	casa	[%r10] 0x80, %r11, %r27
	.word 0xcaa2aac0  ! 331: STWA_I	stwa	%r5, [%r10 + 0x0ac0] %asi
	.word 0xc2d2900b  ! 332: LDSHA_R	ldsha	[%r10, %r11] 0x80, %r1
	.word 0xc2eaa24c  ! 333: LDSTUBA_I	ldstuba	%r1, [%r10 + 0x024c] %asi
	.word 0x90d2800b  ! 334: UMULcc_R	umulcc 	%r10, %r11, %r8
	.word 0x16800001  ! 335: BGE	bge  	<label_0x1>
	.word 0x8143e060  ! 336: MEMBAR	membar	#MemIssue | #Sync 
	.word 0x24ca0001  ! 337: BRLEZ	brlez,a,pt	%8,<label_0xa0001>
	.word 0x14800003  ! 338: BG	bg  	<label_0x3>
	.word 0xc4c2af38  ! 339: LDSWA_I	ldswa	[%r10, + 0x0f38] %asi, %r2
	.word 0xcf3a800b  ! 340: STDF_R	std	%f7, [%r11, %r10]
	.word 0x8143e05c  ! 341: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0x8fa289ab  ! 342: FDIVs	fdivs	%f10, %f11, %f7
	.word 0x8dda800b  ! 343: FLUSH_R	dis not found

	.word 0xc36a800b  ! 344: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0xb4faaa74  ! 345: SDIVcc_I	sdivcc 	%r10, 0x0a74, %r26
	.word 0x8143c000  ! 346: STBAR	stbar
	.word 0x8672a6d4  ! 347: UDIV_I	udiv 	%r10, 0x06d4, %r3
	.word 0xd0da900b  ! 348: LDXA_R	ldxa	[%r10, %r11] 0x80, %r8
	.word 0x90f2800b  ! 349: UDIVcc_R	udivcc 	%r10, %r11, %r8
	.word 0x8143c000  ! 350: STBAR	stbar
	.word 0xa25aa5fc  ! 351: SMUL_I	smul 	%r10, 0x05fc, %r17
	.word 0xd9e2a00b  ! 352: CASA_R	casa	[%r10] %asi, %r11, %r12
	.word 0xaddaa648  ! 353: FLUSH_I	dis not found

	.word 0xf692a484  ! 354: LDUHA_I	lduha	[%r10, + 0x0484] %asi, %r27
	.word 0x8fda800b  ! 356: FLUSH_R	dis not found

	.word 0x8872a66c  ! 357: UDIV_I	udiv 	%r10, 0x066c, %r4
	.word 0x856a800b  ! 358: SDIVX_R	sdivx	%r10, %r11, %r2
	.word 0xcec2900b  ! 359: LDSWA_R	ldswa	[%r10, %r11] 0x80, %r7
	.word 0x9fda800b  ! 360: FLUSH_R	dis not found

	.word 0xc4da900b  ! 361: LDXA_R	ldxa	[%r10, %r11] 0x80, %r2
	.word 0xc9f2900b  ! 362: CASXA_I	casxa	[%r10] 0x80, %r11, %r4
	.word 0xd2eaa840  ! 363: LDSTUBA_I	ldstuba	%r9, [%r10 + 0x0840] %asi
	.word 0xf1e2a00b  ! 364: CASA_R	casa	[%r10] %asi, %r11, %r24
	.word 0x8e72a0b8  ! 365: UDIV_I	udiv 	%r10, 0x00b8, %r7
	.word 0x8143c000  ! 366: STBAR	stbar
	.word 0xc80aa914  ! 367: LDUB_I	ldub	[%r10 + 0x0914], %r4
	.word 0xac6aab28  ! 368: UDIVX_I	udivx 	%r10, 0x0b28, %r22
	.word 0xc26aa90c  ! 369: LDSTUB_I	ldstub	%r1, [%r10 + 0x090c]
	.word 0xfec2a480  ! 370: LDSWA_I	ldswa	[%r10, + 0x0480] %asi, %r31
	.word 0xfc0aa848  ! 371: LDUB_I	ldub	[%r10 + 0x0848], %r30
	.word 0x87a288ab  ! 372: FSUBs	fsubs	%f10, %f11, %f3
	.word 0xc8b2900b  ! 373: STHA_R	stha	%r4, [%r10 + %r11] 0x80
	.word 0x91a2892b  ! 374: FMULs	fmuls	%f10, %f11, %f8
	.word 0xcff2a00b  ! 375: CASXA_R	casxa	[%r10]%asi, %r11, %r7
	.word 0x887a800b  ! 376: SDIV_R	sdiv 	%r10, %r11, %r4
	.word 0x91daab4c  ! 377: FLUSH_I	dis not found

	.word 0xbfdaace4  ! 378: FLUSH_I	dis not found

	.word 0xc3ea900b  ! 379: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0x18800001  ! 380: BGU	bgu  	<label_0x1>
	.word 0x82d2800b  ! 381: UMULcc_R	umulcc 	%r10, %r11, %r1
	.word 0xc89aadb8  ! 382: LDDA_I	ldda	[%r10, + 0x0db8] %asi, %r4
	.word 0x8fda800b  ! 383: FLUSH_R	dis not found

	.word 0x8a72800b  ! 384: UDIV_R	udiv 	%r10, %r11, %r5
	.word 0xe0aa900b  ! 385: STBA_R	stba	%r16, [%r10 + %r11] 0x80
	.word 0xc88aac84  ! 386: LDUBA_I	lduba	[%r10, + 0x0c84] %asi, %r4
	.word 0x22800003  ! 387: BE	be,a	<label_0x3>
	.word 0x824aa730  ! 388: MULX_I	mulx 	%r10, 0x0730, %r1
	.word 0x8bdaaf84  ! 389: FLUSH_I	dis not found

	.word 0xaafa800b  ! 392: SDIVcc_R	sdivcc 	%r10, %r11, %r21
	.word 0xc36a800b  ! 393: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0xc41aaf90  ! 394: LDD_I	ldd	[%r10 + 0x0f90], %r2
	.word 0xc4caa9f0  ! 395: LDSBA_I	ldsba	[%r10, + 0x09f0] %asi, %r2
	.word 0x22c20001  ! 396: BRZ	brz,a,nt	%8,<label_0x20001>
	.word 0xceb2900b  ! 397: STHA_R	stha	%r7, [%r10 + %r11] 0x80
	.word 0x8e72ae0c  ! 398: UDIV_I	udiv 	%r10, 0x0e0c, %r7
	.word 0xccaa900b  ! 399: STBA_R	stba	%r6, [%r10 + %r11] 0x80
	.word 0x84daaea0  ! 400: SMULcc_I	smulcc 	%r10, 0x0ea0, %r2
	.word 0xe53aa458  ! 401: STDF_I	std	%f18, [0x0458, %r10]
	.word 0xced2a618  ! 402: LDSHA_I	ldsha	[%r10, + 0x0618] %asi, %r7
	.word 0x98da800b  ! 403: SMULcc_R	smulcc 	%r10, %r11, %r12
	.word 0xc2f2a370  ! 404: STXA_I	stxa	%r1, [%r10 + 0x0370] %asi
	.word 0xc36a800b  ! 405: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0xa2da800b  ! 406: SMULcc_R	smulcc 	%r10, %r11, %r17
	.word 0x20800003  ! 407: BN	bn,a	<label_0x3>
	.word 0xb36a800b  ! 408: SDIVX_R	sdivx	%r10, %r11, %r25
	.word 0x8bda800b  ! 409: FLUSH_R	dis not found

	.word 0x82f2800b  ! 410: UDIVcc_R	udivcc 	%r10, %r11, %r1
	.word 0x00800001  ! 412: BN	bn  	<label_0x1>
	.word 0x8143e042  ! 413: MEMBAR	membar	#StoreLoad | #Sync 
	.word 0x8143e073  ! 414: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside | #MemIssue | #Sync 
	.word 0x82fa800b  ! 416: SDIVcc_R	sdivcc 	%r10, %r11, %r1
	.word 0x89a288ab  ! 417: FSUBs	fsubs	%f10, %f11, %f4
	.word 0x82daac88  ! 418: SMULcc_I	smulcc 	%r10, 0x0c88, %r1
	.word 0x884aa540  ! 419: MULX_I	mulx 	%r10, 0x0540, %r4
	.word 0x8143c000  ! 420: STBAR	stbar
	.word 0xde42a334  ! 421: LDSW_I	ldsw	[%r10 + 0x0334], %r15
	.word 0xb852800b  ! 422: UMUL_R	umul 	%r10, %r11, %r28
	.word 0xf53a800b  ! 423: STDF_R	std	%f26, [%r11, %r10]
	.word 0x8a6aa290  ! 424: UDIVX_I	udivx 	%r10, 0x0290, %r5
	.word 0xfdf2900b  ! 425: CASXA_I	casxa	[%r10] 0x80, %r11, %r30
	.word 0x8e6a800b  ! 426: UDIVX_R	udivx 	%r10, %r11, %r7
	.word 0x04ca0001  ! 427: BRLEZ	brlez  ,pt	%8,<label_0xa0001>
	.word 0x0eca0001  ! 428: BRGEZ	brgez  ,pt	%8,<label_0xa0001>
	.word 0xc722800b  ! 429: STF_R	st	%f3, [%r11, %r10]
	.word 0xc66aa484  ! 430: LDSTUB_I	ldstub	%r3, [%r10 + 0x0484]
	.word 0x8cfa800b  ! 431: SDIVcc_R	sdivcc 	%r10, %r11, %r6
	.word 0xd0daa618  ! 432: LDXA_I	ldxa	[%r10, + 0x0618] %asi, %r8
	.word 0x8143c000  ! 433: STBAR	stbar
	.word 0x85daa610  ! 434: FLUSH_I	dis not found

	.word 0xc68aa4dc  ! 435: LDUBA_I	lduba	[%r10, + 0x04dc] %asi, %r3
	.word 0xd87a800b  ! 436: SWAP_R	swap	%r12, [%r10 + %r11]
	.word 0xe122800b  ! 437: STF_R	st	%f16, [%r11, %r10]
	.word 0xd1f2900b  ! 438: CASXA_I	casxa	[%r10] 0x80, %r11, %r8
	.word 0xc36a800b  ! 439: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x24800001  ! 440: BLE	ble,a	<label_0x1>
	.word 0xc2b2abe0  ! 441: STHA_I	stha	%r1, [%r10 + 0x0be0] %asi
	.word 0xd13aa658  ! 442: STDF_I	std	%f8, [0x0658, %r10]
	.word 0x91a288ab  ! 444: FSUBs	fsubs	%f10, %f11, %f8
	.word 0x896a800b  ! 445: SDIVX_R	sdivx	%r10, %r11, %r4
	.word 0xfc8aad44  ! 446: LDUBA_I	lduba	[%r10, + 0x0d44] %asi, %r30
	.word 0x8c72a6ac  ! 447: UDIV_I	udiv 	%r10, 0x06ac, %r6
	.word 0xb9a2892b  ! 448: FMULs	fmuls	%f10, %f11, %f28
	.word 0xe442ad20  ! 450: LDSW_I	ldsw	[%r10 + 0x0d20], %r18
	.word 0x91a2892b  ! 451: FMULs	fmuls	%f10, %f11, %f8
	.word 0xbbdaa2f0  ! 452: FLUSH_I	dis not found

	.word 0x844aaac4  ! 453: MULX_I	mulx 	%r10, 0x0ac4, %r2
	.word 0xccdaae18  ! 454: LDXA_I	ldxa	[%r10, + 0x0e18] %asi, %r6
	.word 0xd0f2900b  ! 455: STXA_R	stxa	%r8, [%r10 + %r11] 0x80
	.word 0xadda800b  ! 456: FLUSH_R	dis not found

	.word 0xfeeaafc8  ! 457: LDSTUBA_I	ldstuba	%r31, [%r10 + 0x0fc8] %asi
	.word 0x89daa4b4  ! 458: FLUSH_I	dis not found

	.word 0x836a800b  ! 459: SDIVX_R	sdivx	%r10, %r11, %r1
	.word 0xc3eaae90  ! 460: PREFETCHA_I	prefetcha	[%r10, + 0x0e90] %asi, #one_read
	.word 0xccaa900b  ! 461: STBA_R	stba	%r6, [%r10 + %r11] 0x80
	.word 0x8ba2892b  ! 462: FMULs	fmuls	%f10, %f11, %f5
	.word 0xcfe2900b  ! 463: CASA_I	casa	[%r10] 0x80, %r11, %r7
	.word 0xf0ea900b  ! 464: LDSTUBA_R	ldstuba	%r24, [%r10 + %r11] 0x80
	.word 0x16800001  ! 465: BGE	bge  	<label_0x1>
	.word 0xf442800b  ! 466: LDSW_R	ldsw	[%r10 + %r11], %r26
	.word 0xa07aa468  ! 467: SDIV_I	sdiv 	%r10, 0x0468, %r16
	.word 0xd2aaa378  ! 468: STBA_I	stba	%r9, [%r10 + 0x0378] %asi
	.word 0x8cd2800b  ! 469: UMULcc_R	umulcc 	%r10, %r11, %r6
	.word 0xc2faac60  ! 470: SWAPA_I	swapa	%r1, [%r10 + 0x0c60] %asi
	.word 0x98f2a574  ! 471: UDIVcc_I	udivcc 	%r10, 0x0574, %r12
	.word 0x8143e050  ! 472: MEMBAR	membar	#Lookaside | #Sync 
	.word 0xc3eaaa60  ! 473: PREFETCHA_I	prefetcha	[%r10, + 0x0a60] %asi, #one_read
	.word 0xcc52a728  ! 474: LDSH_I	ldsh	[%r10 + 0x0728], %r6
	.word 0x904a800b  ! 475: MULX_R	mulx 	%r10, %r11, %r8
	.word 0xc60aa1c8  ! 476: LDUB_I	ldub	[%r10 + 0x01c8], %r3
	.word 0x0cc20003  ! 477: BRGZ	brgz  ,nt	%8,<label_0x20003>
	.word 0xcea2900b  ! 478: STWA_R	stwa	%r7, [%r10 + %r11] 0x80
	.word 0xb7da800b  ! 479: FLUSH_R	dis not found

	.word 0xd07a800b  ! 480: SWAP_R	swap	%r8, [%r10 + %r11]
	.word 0x8143c000  ! 481: STBAR	stbar
	.word 0xc442800b  ! 482: LDSW_R	ldsw	[%r10 + %r11], %r2
	.word 0xd2aaa60c  ! 483: STBA_I	stba	%r9, [%r10 + 0x060c] %asi
	.word 0x2eca0003  ! 485: BRGEZ	brgez,a,pt	%8,<label_0xa0003>
	.word 0x92faafc8  ! 486: SDIVcc_I	sdivcc 	%r10, 0x0fc8, %r9
	.word 0x8cd2800b  ! 487: UMULcc_R	umulcc 	%r10, %r11, %r6
	.word 0x89a2892b  ! 488: FMULs	fmuls	%f10, %f11, %f4
	.word 0xea4a800b  ! 489: LDSB_R	ldsb	[%r10 + %r11], %r21
	.word 0xc3ea900b  ! 490: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0xf48aa7d0  ! 491: LDUBA_I	lduba	[%r10, + 0x07d0] %asi, %r26
	.word 0x8143c000  ! 493: STBAR	stbar
	.word 0xcbe2900b  ! 494: CASA_I	casa	[%r10] 0x80, %r11, %r5
	.word 0x8dda800b  ! 495: FLUSH_R	dis not found

	.word 0xca5aa088  ! 498: LDX_I	ldx	[%r10 + 0x0088], %r5
	.word 0xf322a44c  ! 499: STF_I	st	%f25, [0x044c, %r10]
	.word 0x8143c000  ! 500: STBAR	stbar
	.word 0xc67a800b  ! 501: SWAP_R	swap	%r3, [%r10 + %r11]
	.word 0xc6b2a55c  ! 502: STHA_I	stha	%r3, [%r10 + 0x055c] %asi
	.word 0x85a288ab  ! 503: FSUBs	fsubs	%f10, %f11, %f2
	.word 0xd2ca900b  ! 504: LDSBA_R	ldsba	[%r10, %r11] 0x80, %r9
	.word 0xc81aae00  ! 505: LDD_I	ldd	[%r10 + 0x0e00], %r4
	.word 0xc892a370  ! 506: LDUHA_I	lduha	[%r10, + 0x0370] %asi, %r4
	.word 0x04ca0001  ! 507: BRLEZ	brlez  ,pt	%8,<label_0xa0001>
	.word 0xfafaa72c  ! 508: SWAPA_I	swapa	%r29, [%r10 + 0x072c] %asi
	.word 0xcb3a800b  ! 509: STDF_R	std	%f5, [%r11, %r10]
	.word 0xc842a07c  ! 510: LDSW_I	ldsw	[%r10 + 0x007c], %r4
	.word 0x8143e02b  ! 511: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #MemIssue 
	.word 0xda6a800b  ! 512: LDSTUB_R	ldstub	%r13, [%r10 + %r11]
	.word 0x8d22ad1c  ! 513: MULScc_I	mulscc 	%r10, 0x0d1c, %r6
	.word 0xc5e2a00b  ! 514: CASA_R	casa	[%r10] %asi, %r11, %r2
	.word 0xc412ae50  ! 515: LDUH_I	lduh	[%r10 + 0x0e50], %r2
	.word 0x8143c000  ! 516: STBAR	stbar
	stxa	%r6, [%r10 + 0x0b40] %asi
	.word 0xc8aaa478  ! 518: STBA_I	stba	%r4, [%r10 + 0x0478] %asi
	.word 0xe092a830  ! 519: LDUHA_I	lduha	[%r10, + 0x0830] %asi, %r16
	.word 0xb0da800b  ! 520: SMULcc_R	smulcc 	%r10, %r11, %r24
	.word 0xc4ca900b  ! 521: LDSBA_R	ldsba	[%r10, %r11] 0x80, %r2
	.word 0xd0aaac6c  ! 522: STBA_I	stba	%r8, [%r10 + 0x0c6c] %asi
	.word 0xa0d2a6cc  ! 523: UMULcc_I	umulcc 	%r10, 0x06cc, %r16
	.word 0xc482a504  ! 524: LDUWA_I	lduwa	[%r10, + 0x0504] %asi, %r2
	.word 0x92d2ad48  ! 525: UMULcc_I	umulcc 	%r10, 0x0d48, %r9
	.word 0x8143e017  ! 526: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside 
	.word 0x30800001  ! 527: BA	ba,a	<label_0x1>
	.word 0x8e5a800b  ! 528: SMUL_R	smul 	%r10, %r11, %r7
	.word 0xc4eaa9bc  ! 529: LDSTUBA_I	ldstuba	%r2, [%r10 + 0x09bc] %asi
	.word 0x8fda800b  ! 530: FLUSH_R	dis not found

	.word 0xfc7aa464  ! 531: SWAP_I	swap	%r30, [%r10 + 0x0464]
	.word 0xc2eaaa80  ! 532: LDSTUBA_I	ldstuba	%r1, [%r10 + 0x0a80] %asi
	.word 0x20800001  ! 533: BN	bn,a	<label_0x1>
	.word 0xc6f2900b  ! 534: STXA_R	stxa	%r3, [%r10 + %r11] 0x80
	.word 0xc3eaa0c8  ! 535: PREFETCHA_I	prefetcha	[%r10, + 0x00c8] %asi, #one_read
	.word 0x836a800b  ! 537: SDIVX_R	sdivx	%r10, %r11, %r1
	.word 0xfeb2aab8  ! 538: STHA_I	stha	%r31, [%r10 + 0x0ab8] %asi
	.word 0xca82900b  ! 539: LDUWA_R	lduwa	[%r10, %r11] 0x80, %r5
	.word 0xd0f2af58  ! 540: STXA_I	stxa	%r8, [%r10 + 0x0f58] %asi
	.word 0xb7daa488  ! 541: FLUSH_I	dis not found

	.word 0x8fa288ab  ! 542: FSUBs	fsubs	%f10, %f11, %f7
	.word 0xc89aac40  ! 543: LDDA_I	ldda	[%r10, + 0x0c40] %asi, %r4
	.word 0xc66a800b  ! 545: LDSTUB_R	ldstub	%r3, [%r10 + %r11]
	.word 0xc64aa8e0  ! 546: LDSB_I	ldsb	[%r10 + 0x08e0], %r3
	.word 0xd322a4fc  ! 547: STF_I	st	%f9, [0x04fc, %r10]
	.word 0xa4d2aa10  ! 548: UMULcc_I	umulcc 	%r10, 0x0a10, %r18
	.word 0x8fdaa9e0  ! 549: FLUSH_I	dis not found

	.word 0xe2c2900b  ! 550: LDSWA_R	ldswa	[%r10, %r11] 0x80, %r17
	.word 0x0cca0003  ! 551: BRGZ	brgz  ,pt	%8,<label_0xa0003>
	.word 0xaed2800b  ! 552: UMULcc_R	umulcc 	%r10, %r11, %r23
	.word 0x36800003  ! 553: BGE	bge,a	<label_0x3>
	.word 0x00800001  ! 554: BN	bn  	<label_0x1>
	.word 0xceea900b  ! 555: LDSTUBA_R	ldstuba	%r7, [%r10 + %r11] 0x80
	.word 0x8872800b  ! 556: UDIV_R	udiv 	%r10, %r11, %r4
	.word 0xf1e2a00b  ! 557: CASA_R	casa	[%r10] %asi, %r11, %r24
	.word 0xc8a2a4e4  ! 558: STWA_I	stwa	%r4, [%r10 + 0x04e4] %asi
	.word 0xe6caa050  ! 559: LDSBA_I	ldsba	[%r10, + 0x0050] %asi, %r19
	.word 0x8922800b  ! 560: MULScc_R	mulscc 	%r10, %r11, %r4
	.word 0xc3eaa3ac  ! 561: PREFETCHA_I	prefetcha	[%r10, + 0x03ac] %asi, #one_read
	.word 0x91da800b  ! 562: FLUSH_R	dis not found

	.word 0xc722800b  ! 563: STF_R	st	%f3, [%r11, %r10]
	.word 0xc26aa4e4  ! 564: LDSTUB_I	ldstub	%r1, [%r10 + 0x04e4]
	.word 0xd282a338  ! 565: LDUWA_I	lduwa	[%r10, + 0x0338] %asi, %r9
	.word 0xca82a9f8  ! 566: LDUWA_I	lduwa	[%r10, + 0x09f8] %asi, %r5
	.word 0x8143c000  ! 567: STBAR	stbar
	.word 0xf4caa0d4  ! 568: LDSBA_I	ldsba	[%r10, + 0x00d4] %asi, %r26
	.word 0xc6f2a048  ! 569: STXA_I	stxa	%r3, [%r10 + 0x0048] %asi
	.word 0xc652ad1c  ! 570: LDSH_I	ldsh	[%r10 + 0x0d1c], %r3
	.word 0x8cfaaae4  ! 571: SDIVcc_I	sdivcc 	%r10, 0x0ae4, %r6
	.word 0x84da800b  ! 572: SMULcc_R	smulcc 	%r10, %r11, %r2
	.word 0x8fdaa47c  ! 573: FLUSH_I	dis not found

	.word 0xd292ac64  ! 574: LDUHA_I	lduha	[%r10, + 0x0c64] %asi, %r9
	.word 0xc49aafa0  ! 575: LDDA_I	ldda	[%r10, + 0x0fa0] %asi, %r2
	.word 0xc2fa900b  ! 576: SWAPA_R	swapa	%r1, [%r10 + %r11] 0x80
	.word 0x82d2af24  ! 577: UMULcc_I	umulcc 	%r10, 0x0f24, %r1
	.word 0xca0a800b  ! 578: LDUB_R	ldub	[%r10 + %r11], %r5
	.word 0xccc2a078  ! 579: LDSWA_I	ldswa	[%r10, + 0x0078] %asi, %r6
	.word 0x8afa800b  ! 580: SDIVcc_R	sdivcc 	%r10, %r11, %r5
	.word 0x83a2882b  ! 581: FADDs	fadds	%f10, %f11, %f1
	.word 0xc2b2900b  ! 582: STHA_R	stha	%r1, [%r10 + %r11] 0x80
	.word 0x8143e018  ! 583: MEMBAR	membar	#StoreStore | #Lookaside 
	.word 0xaa5a800b  ! 584: SMUL_R	smul 	%r10, %r11, %r21
	.word 0xbfa289ab  ! 585: FDIVs	fdivs	%f10, %f11, %f31
	.word 0x8d22800b  ! 586: MULScc_R	mulscc 	%r10, %r11, %r6
	.word 0xcd3a800b  ! 587: STDF_R	std	%f6, [%r11, %r10]
	.word 0xb6d2800b  ! 588: UMULcc_R	umulcc 	%r10, %r11, %r27
	.word 0xceea900b  ! 589: LDSTUBA_R	ldstuba	%r7, [%r10 + %r11] 0x80
	.word 0xd2b2900b  ! 590: STHA_R	stha	%r9, [%r10 + %r11] 0x80
	.word 0xc67aa39c  ! 591: SWAP_I	swap	%r3, [%r10 + 0x039c]
	.word 0xbba2882b  ! 592: FADDs	fadds	%f10, %f11, %f29
	.word 0xcac2aaa8  ! 593: LDSWA_I	ldswa	[%r10, + 0x0aa8] %asi, %r5
	.word 0xca82900b  ! 594: LDUWA_R	lduwa	[%r10, %r11] 0x80, %r5
	.word 0xa27a800b  ! 595: SDIV_R	sdiv 	%r10, %r11, %r17
	.word 0x2ac20003  ! 596: BRNZ	brnz,a,nt	%8,<label_0x20003>
	.word 0x3a800001  ! 597: BCC	bcc,a	<label_0x1>
	.word 0xc36a800b  ! 598: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x8143c000  ! 599: STBAR	stbar
	.word 0xca4a800b  ! 601: LDSB_R	ldsb	[%r10 + %r11], %r5
	.word 0x8143c000  ! 602: STBAR	stbar
	stxa	%r2, [%r10 + %r11] 0x80
	.word 0x20800001  ! 605: BN	bn,a	<label_0x1>
	.word 0x8a6aa38c  ! 606: UDIVX_I	udivx 	%r10, 0x038c, %r5
	.word 0x8ed2a008  ! 607: UMULcc_I	umulcc 	%r10, 0x0008, %r7
	.word 0x8143c000  ! 609: STBAR	stbar
	.word 0xc48aa9a8  ! 610: LDUBA_I	lduba	[%r10, + 0x09a8] %asi, %r2
	.word 0xcb3a800b  ! 611: STDF_R	std	%f5, [%r11, %r10]
	.word 0xaefaa5f4  ! 612: SDIVcc_I	sdivcc 	%r10, 0x05f4, %r23
	.word 0x8fdaa4a4  ! 613: FLUSH_I	dis not found

	.word 0xc46aa938  ! 614: LDSTUB_I	ldstub	%r2, [%r10 + 0x0938]
	.word 0xbfa289ab  ! 615: FDIVs	fdivs	%f10, %f11, %f31
	.word 0xfb22ab0c  ! 616: STF_I	st	%f29, [0x0b0c, %r10]
	.word 0xc8c2a8f4  ! 617: LDSWA_I	ldswa	[%r10, + 0x08f4] %asi, %r4
	.word 0x8c72a260  ! 618: UDIV_I	udiv 	%r10, 0x0260, %r6
	.word 0x8143e042  ! 619: MEMBAR	membar	#StoreLoad | #Sync 
	.word 0x0ec20003  ! 620: BRGEZ	brgez  ,nt	%8,<label_0x20003>
	.word 0xd052ad48  ! 621: LDSH_I	ldsh	[%r10 + 0x0d48], %r8
	.word 0x82faa5b0  ! 622: SDIVcc_I	sdivcc 	%r10, 0x05b0, %r1
	.word 0xc3ea900b  ! 623: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0xf6ea900b  ! 624: LDSTUBA_R	ldstuba	%r27, [%r10 + %r11] 0x80
	.word 0x8872800b  ! 625: UDIV_R	udiv 	%r10, %r11, %r4
	.word 0xc7e2a00b  ! 626: CASA_R	casa	[%r10] %asi, %r11, %r3
	.word 0xb272a228  ! 627: UDIV_I	udiv 	%r10, 0x0228, %r25
	.word 0xcaa2a35c  ! 628: STWA_I	stwa	%r5, [%r10 + 0x035c] %asi
	.word 0x04800001  ! 629: BLE	ble  	<label_0x1>
	.word 0xb3daa41c  ! 631: FLUSH_I	dis not found

	.word 0x9da2882b  ! 632: FADDs	fadds	%f10, %f11, %f14
	.word 0xd012800b  ! 633: LDUH_R	lduh	[%r10 + %r11], %r8
	stxa	%r4, [%r10 + 0x0608] %asi
	.word 0xcc5aadb0  ! 635: LDX_I	ldx	[%r10 + 0x0db0], %r6
	.word 0x89da800b  ! 636: FLUSH_R	dis not found

	.word 0xc3ea900b  ! 637: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0xc8da900b  ! 638: LDXA_R	ldxa	[%r10, %r11] 0x80, %r4
	.word 0x91daa470  ! 639: FLUSH_I	dis not found

	.word 0x14800003  ! 640: BG	bg  	<label_0x3>
	.word 0xc44a800b  ! 641: LDSB_R	ldsb	[%r10 + %r11], %r2
	.word 0x8143e05e  ! 642: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0xc73a800b  ! 643: STDF_R	std	%f3, [%r11, %r10]
	.word 0xca5aa170  ! 644: LDX_I	ldx	[%r10 + 0x0170], %r5
	.word 0xe5e2a00b  ! 645: CASA_R	casa	[%r10] %asi, %r11, %r18
	.word 0x24800003  ! 646: BLE	ble,a	<label_0x3>
	.word 0xd28a900b  ! 647: LDUBA_R	lduba	[%r10, %r11] 0x80, %r9
	.word 0xc6b2900b  ! 648: STHA_R	stha	%r3, [%r10 + %r11] 0x80
	.word 0xd84aa30c  ! 649: LDSB_I	ldsb	[%r10 + 0x030c], %r12
	.word 0x98f2800b  ! 650: UDIVcc_R	udivcc 	%r10, %r11, %r12
	.word 0xc33a800b  ! 651: STDF_R	std	%f1, [%r11, %r10]
	.word 0x8143e02f  ! 652: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #MemIssue 
	.word 0xd2b2a784  ! 653: STHA_I	stha	%r9, [%r10 + 0x0784] %asi
	.word 0xc4faafe0  ! 654: SWAPA_I	swapa	%r2, [%r10 + 0x0fe0] %asi
	.word 0x8143c000  ! 655: STBAR	stbar
	.word 0xcc82a944  ! 656: LDUWA_I	lduwa	[%r10, + 0x0944] %asi, %r6
	.word 0xce4aa4d8  ! 657: LDSB_I	ldsb	[%r10 + 0x04d8], %r7
	.word 0xc892900b  ! 658: LDUHA_R	lduha	[%r10, %r11] 0x80, %r4
	.word 0x8143c000  ! 659: STBAR	stbar
	.word 0xaba2882b  ! 660: FADDs	fadds	%f10, %f11, %f21
	.word 0x26c20001  ! 661: BRLZ	brlz,a,nt	%8,<label_0x20001>
	.word 0x8cf2800b  ! 662: UDIVcc_R	udivcc 	%r10, %r11, %r6
	.word 0x0cca0001  ! 663: BRGZ	brgz  ,pt	%8,<label_0xa0001>
	.word 0x06c20003  ! 664: BRLZ	brlz  ,nt	%8,<label_0x20003>
	.word 0x8da2882b  ! 665: FADDs	fadds	%f10, %f11, %f6
	.word 0x30800001  ! 666: BA	ba,a	<label_0x1>
	.word 0x8dda800b  ! 667: FLUSH_R	dis not found

	.word 0xd042a148  ! 668: LDSW_I	ldsw	[%r10 + 0x0148], %r8
	.word 0x8fa2882b  ! 669: FADDs	fadds	%f10, %f11, %f7
	.word 0xd3f2a00b  ! 670: CASXA_R	casxa	[%r10]%asi, %r11, %r9
	.word 0xc6b2900b  ! 671: STHA_R	stha	%r3, [%r10 + %r11] 0x80
	.word 0xc36a800b  ! 672: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x93daa0f4  ! 673: FLUSH_I	dis not found

	.word 0xc642ab8c  ! 674: LDSW_I	ldsw	[%r10 + 0x0b8c], %r3
	.word 0xaddaa6d0  ! 675: FLUSH_I	dis not found

	.word 0x9272a598  ! 676: UDIV_I	udiv 	%r10, 0x0598, %r9
	.word 0x8143e048  ! 677: MEMBAR	membar	#StoreStore | #Sync 
	.word 0xea7aad50  ! 679: SWAP_I	swap	%r21, [%r10 + 0x0d50]
	.word 0x1a800001  ! 680: BCC	bcc  	<label_0x1>
	.word 0xe402800b  ! 681: LDUW_R	lduw	[%r10 + %r11], %r18
	.word 0xac5a800b  ! 682: SMUL_R	smul 	%r10, %r11, %r22
	.word 0xf0ca900b  ! 683: LDSBA_R	ldsba	[%r10, %r11] 0x80, %r24
	.word 0xc5e2a00b  ! 684: CASA_R	casa	[%r10] %asi, %r11, %r2
	.word 0x8143e06c  ! 685: MEMBAR	membar	#LoadStore | #StoreStore | #MemIssue | #Sync 
	.word 0x22800001  ! 686: BE	be,a	<label_0x1>
	.word 0xbb6a800b  ! 687: SDIVX_R	sdivx	%r10, %r11, %r29
	.word 0xb04aaa30  ! 688: MULX_I	mulx 	%r10, 0x0a30, %r24
	.word 0x10800003  ! 689: BA	ba  	<label_0x3>
	.word 0xcc9aac68  ! 690: LDDA_I	ldda	[%r10, + 0x0c68] %asi, %r6
	.word 0xfa92ade8  ! 691: LDUHA_I	lduha	[%r10, + 0x0de8] %asi, %r29
	.word 0xd242a0a0  ! 692: LDSW_I	ldsw	[%r10 + 0x00a0], %r9
	.word 0xe7e2900b  ! 693: CASA_I	casa	[%r10] 0x80, %r11, %r19
	.word 0x87daaf44  ! 694: FLUSH_I	dis not found

	.word 0x9322800b  ! 695: MULScc_R	mulscc 	%r10, %r11, %r9
	.word 0xe692900b  ! 696: LDUHA_R	lduha	[%r10, %r11] 0x80, %r19
	.word 0xcd3aa920  ! 697: STDF_I	std	%f6, [0x0920, %r10]
	.word 0xe612800b  ! 698: LDUH_R	lduh	[%r10 + %r11], %r19
	.word 0x8472800b  ! 699: UDIV_R	udiv 	%r10, %r11, %r2
	.word 0x98f2aaa4  ! 700: UDIVcc_I	udivcc 	%r10, 0x0aa4, %r12
	.word 0xc8b2900b  ! 701: STHA_R	stha	%r4, [%r10 + %r11] 0x80
	.word 0xc36a800b  ! 702: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x04800001  ! 703: BLE	ble  	<label_0x1>
	.word 0x8143e03e  ! 704: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0xc2ea900b  ! 706: LDSTUBA_R	ldstuba	%r1, [%r10 + %r11] 0x80
	.word 0x99da800b  ! 707: FLUSH_R	dis not found

	.word 0xd0f2a158  ! 708: STXA_I	stxa	%r8, [%r10 + 0x0158] %asi
	.word 0xd292a610  ! 709: LDUHA_I	lduha	[%r10, + 0x0610] %asi, %r9
	.word 0x91da800b  ! 710: FLUSH_R	dis not found

	.word 0x20800001  ! 711: BN	bn,a	<label_0x1>
	.word 0x8143e013  ! 712: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside 
	.word 0x8143c000  ! 713: STBAR	stbar
	.word 0xcd22800b  ! 714: STF_R	st	%f6, [%r11, %r10]
	.word 0xd002aa10  ! 715: LDUW_I	lduw	[%r10 + 0x0a10], %r8
	.word 0xc36aabbc  ! 716: PREFETCH_I	prefetch	[%r10 + 0x0bbc], #one_read
	.word 0xff3a800b  ! 717: STDF_R	std	%f31, [%r11, %r10]
	.word 0xcaeaa2f4  ! 718: LDSTUBA_I	ldstuba	%r5, [%r10 + 0x02f4] %asi
	.word 0x8652800b  ! 719: UMUL_R	umul 	%r10, %r11, %r3
	.word 0xecfa900b  ! 720: SWAPA_R	swapa	%r22, [%r10 + %r11] 0x80
	.word 0xc802800b  ! 722: LDUW_R	lduw	[%r10 + %r11], %r4
	.word 0xaafa800b  ! 723: SDIVcc_R	sdivcc 	%r10, %r11, %r21
	.word 0x906aa0f4  ! 724: UDIVX_I	udivx 	%r10, 0x00f4, %r8
	.word 0xc2f2900b  ! 725: STXA_R	stxa	%r1, [%r10 + %r11] 0x80
	.word 0x83daab6c  ! 726: FLUSH_I	dis not found

	.word 0x8afaac4c  ! 727: SDIVcc_I	sdivcc 	%r10, 0x0c4c, %r5
	.word 0x825aae20  ! 728: SMUL_I	smul 	%r10, 0x0e20, %r1
	.word 0xccda900b  ! 729: LDXA_R	ldxa	[%r10, %r11] 0x80, %r6
	.word 0x24800003  ! 730: BLE	ble,a	<label_0x3>
	.word 0xc3e2a00b  ! 731: CASA_R	casa	[%r10] %asi, %r11, %r1
	.word 0x92da800b  ! 732: SMULcc_R	smulcc 	%r10, %r11, %r9
	.word 0xf93a800b  ! 733: STDF_R	std	%f28, [%r11, %r10]
	.word 0x8143c000  ! 734: STBAR	stbar
	.word 0xc3eaa350  ! 735: PREFETCHA_I	prefetcha	[%r10, + 0x0350] %asi, #one_read
	.word 0x8fa2892b  ! 736: FMULs	fmuls	%f10, %f11, %f7
	.word 0xd8eaae90  ! 737: LDSTUBA_I	ldstuba	%r12, [%r10 + 0x0e90] %asi
	.word 0xcaaa900b  ! 738: STBA_R	stba	%r5, [%r10 + %r11] 0x80
	.word 0xa1daa5e0  ! 739: FLUSH_I	dis not found

	.word 0xd2d2900b  ! 740: LDSHA_R	ldsha	[%r10, %r11] 0x80, %r9
	.word 0x86d2a79c  ! 742: UMULcc_I	umulcc 	%r10, 0x079c, %r3
	.word 0xaa7a800b  ! 743: SDIV_R	sdiv 	%r10, %r11, %r21
	.word 0xc8aa900b  ! 744: STBA_R	stba	%r4, [%r10 + %r11] 0x80
	.word 0x8a5a800b  ! 745: SMUL_R	smul 	%r10, %r11, %r5
	.word 0x8dda800b  ! 746: FLUSH_R	dis not found

	.word 0x8143e037  ! 747: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside | #MemIssue 
	.word 0x8c5aadc4  ! 748: SMUL_I	smul 	%r10, 0x0dc4, %r6
	.word 0xebe2900b  ! 749: CASA_I	casa	[%r10] 0x80, %r11, %r21
	.word 0xcb3aa018  ! 750: STDF_I	std	%f5, [0x0018, %r10]
	.word 0x86da800b  ! 751: SMULcc_R	smulcc 	%r10, %r11, %r3
	.word 0x8c7aae68  ! 752: SDIV_I	sdiv 	%r10, 0x0e68, %r6
	.word 0xa7a2892b  ! 753: FMULs	fmuls	%f10, %f11, %f19
	.word 0x85daac34  ! 754: FLUSH_I	dis not found

	.word 0xafa2882b  ! 755: FADDs	fadds	%f10, %f11, %f23
	.word 0x14800003  ! 756: BG	bg  	<label_0x3>
	.word 0x8143e038  ! 757: MEMBAR	membar	#StoreStore | #Lookaside | #MemIssue 
	.word 0xd13aa418  ! 758: STDF_I	std	%f8, [0x0418, %r10]
	.word 0x825aa920  ! 759: SMUL_I	smul 	%r10, 0x0920, %r1
	.word 0x8143c000  ! 760: STBAR	stbar
	.word 0x8143c000  ! 761: STBAR	stbar
	.word 0xf202800b  ! 762: LDUW_R	lduw	[%r10 + %r11], %r25
	.word 0x9252800b  ! 763: UMUL_R	umul 	%r10, %r11, %r9
	.word 0xebe2900b  ! 764: CASA_I	casa	[%r10] 0x80, %r11, %r21
	.word 0x22800003  ! 765: BE	be,a	<label_0x3>
	.word 0x8afaaac4  ! 766: SDIVcc_I	sdivcc 	%r10, 0x0ac4, %r5
	.word 0xc3eaa2a4  ! 767: PREFETCHA_I	prefetcha	[%r10, + 0x02a4] %asi, #one_read
	.word 0x83daa2b0  ! 768: FLUSH_I	dis not found

	.word 0x22800001  ! 769: BE	be,a	<label_0x1>
	.word 0x8143c000  ! 770: STBAR	stbar
	stxa	%r0, [%r10 + %r11] 0x80
	.word 0xcf22a4a8  ! 772: STF_I	st	%f7, [0x04a8, %r10]
	.word 0x8143e01a  ! 773: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside 
	.word 0xc5f2900b  ! 774: CASXA_I	casxa	[%r10] 0x80, %r11, %r2
	.word 0xe09aa928  ! 775: LDDA_I	ldda	[%r10, + 0x0928] %asi, %r16
	.word 0x83daaa18  ! 776: FLUSH_I	dis not found

	.word 0xe8a2900b  ! 777: STWA_R	stwa	%r20, [%r10 + %r11] 0x80
	.word 0xccc2900b  ! 778: LDSWA_R	ldswa	[%r10, %r11] 0x80, %r6
	.word 0xf93aa2d8  ! 779: STDF_I	std	%f28, [0x02d8, %r10]
	.word 0xc3eaa338  ! 780: PREFETCHA_I	prefetcha	[%r10, + 0x0338] %asi, #one_read
	.word 0xc9f2900b  ! 781: CASXA_I	casxa	[%r10] 0x80, %r11, %r4
	.word 0x8da289ab  ! 782: FDIVs	fdivs	%f10, %f11, %f6
	.word 0x14800001  ! 783: BG	bg  	<label_0x1>
	.word 0x9da289ab  ! 784: FDIVs	fdivs	%f10, %f11, %f14
	.word 0xa27a800b  ! 785: SDIV_R	sdiv 	%r10, %r11, %r17
	.word 0x824a800b  ! 787: MULX_R	mulx 	%r10, %r11, %r1
	.word 0x8143c000  ! 788: STBAR	stbar
	.word 0xe4a2a6f4  ! 789: STWA_I	stwa	%r18, [%r10 + 0x06f4] %asi
	.word 0xc88aa2dc  ! 790: LDUBA_I	lduba	[%r10, + 0x02dc] %asi, %r4
	.word 0xfad2900b  ! 791: LDSHA_R	ldsha	[%r10, %r11] 0x80, %r29
	.word 0x02800003  ! 792: BE	be  	<label_0x3>
	.word 0x8143e05d  ! 793: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0xd0a2a14c  ! 794: STWA_I	stwa	%r8, [%r10 + 0x014c] %asi
	.word 0x02c20003  ! 795: BRZ	brz  ,nt	%8,<label_0x20003>
	.word 0x91a2892b  ! 796: FMULs	fmuls	%f10, %f11, %f8
	.word 0x8ad2800b  ! 797: UMULcc_R	umulcc 	%r10, %r11, %r5
	.word 0xc36a800b  ! 798: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x1e800001  ! 799: BVC	bvc  	<label_0x1>
	.word 0x90da800b  ! 800: SMULcc_R	smulcc 	%r10, %r11, %r8
	.word 0xbdda800b  ! 801: FLUSH_R	dis not found

	.word 0xc7e2a00b  ! 802: CASA_R	casa	[%r10] %asi, %r11, %r3
	.word 0x18800001  ! 803: BGU	bgu  	<label_0x1>
	.word 0xc8daabe0  ! 804: LDXA_I	ldxa	[%r10, + 0x0be0] %asi, %r4
	.word 0x8dda800b  ! 805: FLUSH_R	dis not found

	.word 0x8143c000  ! 806: STBAR	stbar
	.word 0xaa6a800b  ! 807: UDIVX_R	udivx 	%r10, %r11, %r21
	.word 0xd2b2900b  ! 808: STHA_R	stha	%r9, [%r10 + %r11] 0x80
	.word 0xfa7aa9e4  ! 809: SWAP_I	swap	%r29, [%r10 + 0x09e4]
	.word 0xc8ea900b  ! 810: LDSTUBA_R	ldstuba	%r4, [%r10 + %r11] 0x80
	.word 0xafda800b  ! 811: FLUSH_R	dis not found

	.word 0xe852800b  ! 812: LDSH_R	ldsh	[%r10 + %r11], %r20
	.word 0xca02800b  ! 813: LDUW_R	lduw	[%r10 + %r11], %r5
	.word 0x85daa94c  ! 814: FLUSH_I	dis not found

	.word 0x2ac20001  ! 815: BRNZ	brnz,a,nt	%8,<label_0x20001>
	.word 0x8eda800b  ! 816: SMULcc_R	smulcc 	%r10, %r11, %r7
	.word 0xc49a900b  ! 817: LDDA_R	ldda	[%r10, %r11] 0x80, %r2
	.word 0xc7e2a00b  ! 818: CASA_R	casa	[%r10] %asi, %r11, %r3
	.word 0x83da800b  ! 819: FLUSH_R	dis not found

	.word 0xc3ea900b  ! 820: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0x9af2a114  ! 821: UDIVcc_I	udivcc 	%r10, 0x0114, %r13
	.word 0x864aa4c0  ! 822: MULX_I	mulx 	%r10, 0x04c0, %r3
	.word 0xb5da800b  ! 823: FLUSH_R	dis not found

	.word 0xce42ad20  ! 824: LDSW_I	ldsw	[%r10 + 0x0d20], %r7
	.word 0xec02a594  ! 825: LDUW_I	lduw	[%r10 + 0x0594], %r22
	.word 0xcff2900b  ! 826: CASXA_I	casxa	[%r10] 0x80, %r11, %r7
	.word 0x8143e065  ! 827: MEMBAR	membar	#LoadLoad | #LoadStore | #MemIssue | #Sync 
	.word 0x885aa2d4  ! 828: SMUL_I	smul 	%r10, 0x02d4, %r4
	.word 0xd0b2900b  ! 829: STHA_R	stha	%r8, [%r10 + %r11] 0x80
	.word 0x925aad40  ! 830: SMUL_I	smul 	%r10, 0x0d40, %r9
	.word 0x8143c000  ! 831: STBAR	stbar
	stxa	%r2, [%r10 + %r11] 0x80
	.word 0x8bdaae2c  ! 833: FLUSH_I	dis not found

	.word 0x0e800003  ! 834: BVS	bvs  	<label_0x3>
	.word 0x8143c000  ! 835: STBAR	stbar
	.word 0xc6b2a8b0  ! 836: STHA_I	stha	%r3, [%r10 + 0x08b0] %asi
	.word 0x8e5a800b  ! 837: SMUL_R	smul 	%r10, %r11, %r7
	.word 0xec82a280  ! 838: LDUWA_I	lduwa	[%r10, + 0x0280] %asi, %r22
	.word 0xb3a2892b  ! 839: FMULs	fmuls	%f10, %f11, %f25
	.word 0xa7a2892b  ! 840: FMULs	fmuls	%f10, %f11, %f19
	.word 0xc692ac74  ! 841: LDUHA_I	lduha	[%r10, + 0x0c74] %asi, %r3
	.word 0x92d2800b  ! 842: UMULcc_R	umulcc 	%r10, %r11, %r9
	.word 0xe012a148  ! 843: LDUH_I	lduh	[%r10 + 0x0148], %r16
	.word 0x8e5aa54c  ! 844: SMUL_I	smul 	%r10, 0x054c, %r7
	.word 0xea8a900b  ! 845: LDUBA_R	lduba	[%r10, %r11] 0x80, %r21
	.word 0xda4aa0cc  ! 846: LDSB_I	ldsb	[%r10 + 0x00cc], %r13
	.word 0x90daa3cc  ! 847: SMULcc_I	smulcc 	%r10, 0x03cc, %r8
	.word 0xc3eaa8bc  ! 848: PREFETCHA_I	prefetcha	[%r10, + 0x08bc] %asi, #one_read
	.word 0x8fdaabcc  ! 849: FLUSH_I	dis not found

	.word 0xe93a800b  ! 850: STDF_R	std	%f20, [%r11, %r10]
	.word 0x38800003  ! 851: BGU	bgu,a	<label_0x3>
	.word 0x8252800b  ! 853: UMUL_R	umul 	%r10, %r11, %r1
	.word 0x846aac24  ! 854: UDIVX_I	udivx 	%r10, 0x0c24, %r2
	.word 0x88f2800b  ! 855: UDIVcc_R	udivcc 	%r10, %r11, %r4
	.word 0xfac2900b  ! 856: LDSWA_R	ldswa	[%r10, %r11] 0x80, %r29
	.word 0x8bdaa5a4  ! 857: FLUSH_I	dis not found

	.word 0x89daad6c  ! 858: FLUSH_I	dis not found

	stxa	%r8, [%r10 + 0x0fc0] %asi
	.word 0x24ca0001  ! 860: BRLEZ	brlez,a,pt	%8,<label_0xa0001>
	.word 0x87a2892b  ! 861: FMULs	fmuls	%f10, %f11, %f3
	.word 0x8cf2aae0  ! 862: UDIVcc_I	udivcc 	%r10, 0x0ae0, %r6
	.word 0xcc6a800b  ! 863: LDSTUB_R	ldstub	%r6, [%r10 + %r11]
	.word 0xf26aa7a0  ! 864: LDSTUB_I	ldstub	%r25, [%r10 + 0x07a0]
	.word 0xccb2900b  ! 865: STHA_R	stha	%r6, [%r10 + %r11] 0x80
	.word 0xe2d2aad0  ! 866: LDSHA_I	ldsha	[%r10, + 0x0ad0] %asi, %r17
	.word 0x3a800001  ! 867: BCC	bcc,a	<label_0x1>
	.word 0x8143c000  ! 868: STBAR	stbar
	.word 0xb8fa800b  ! 869: SDIVcc_R	sdivcc 	%r10, %r11, %r28
	.word 0xe8a2a3f4  ! 870: STWA_I	stwa	%r20, [%r10 + 0x03f4] %asi
	.word 0xcb3aa500  ! 871: STDF_I	std	%f5, [0x0500, %r10]
	.word 0x8143e007  ! 872: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore 
	.word 0x8c72ac20  ! 873: UDIV_I	udiv 	%r10, 0x0c20, %r6
	.word 0x8143c000  ! 874: STBAR	stbar
	.word 0xdcf2a928  ! 875: STXA_I	stxa	%r14, [%r10 + 0x0928] %asi
	.word 0xd0da900b  ! 876: LDXA_R	ldxa	[%r10, %r11] 0x80, %r8
	.word 0xf64a800b  ! 877: LDSB_R	ldsb	[%r10 + %r11], %r27
	.word 0xc36aac7c  ! 878: PREFETCH_I	prefetch	[%r10 + 0x0c7c], #one_read
	.word 0xe212a9e8  ! 879: LDUH_I	lduh	[%r10 + 0x09e8], %r17
	.word 0xb85a800b  ! 880: SMUL_R	smul 	%r10, %r11, %r28
	.word 0x8143c000  ! 881: STBAR	stbar
	.word 0x8dda800b  ! 882: FLUSH_R	dis not found

	.word 0x8ad2800b  ! 884: UMULcc_R	umulcc 	%r10, %r11, %r5
	.word 0xcc1a800b  ! 885: LDD_R	ldd	[%r10 + %r11], %r6
	.word 0x9852800b  ! 886: UMUL_R	umul 	%r10, %r11, %r12
	.word 0x8cd2800b  ! 887: UMULcc_R	umulcc 	%r10, %r11, %r6
	stxa	%r28, [%r10 + %r11] 0x80
	.word 0x40000001  ! 890: CALL	call	disp30_1
	.word 0xd202aa20  ! 891: LDUW_I	lduw	[%r10 + 0x0a20], %r9
	.word 0xc36a800b  ! 892: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0xbdda800b  ! 893: FLUSH_R	dis not found

	.word 0xbe6a800b  ! 895: UDIVX_R	udivx 	%r10, %r11, %r31
	.word 0xd252800b  ! 896: LDSH_R	ldsh	[%r10 + %r11], %r9
	.word 0x8143e073  ! 897: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside | #MemIssue | #Sync 
	.word 0x86f2ad20  ! 898: UDIVcc_I	udivcc 	%r10, 0x0d20, %r3
	.word 0x8143e001  ! 899: MEMBAR	membar	#LoadLoad 
	.word 0xc9f2900b  ! 900: CASXA_I	casxa	[%r10] 0x80, %r11, %r4
	.word 0xc6daadd0  ! 901: LDXA_I	ldxa	[%r10, + 0x0dd0] %asi, %r3
	.word 0x24800001  ! 902: BLE	ble,a	<label_0x1>
	.word 0x8143e01c  ! 903: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside 
	.word 0x0a800001  ! 904: BCS	bcs  	<label_0x1>
	.word 0xc3ea900b  ! 905: PREFETCHA_R	prefetcha	[%r10, %r11] 0x80, #one_read
	.word 0x86fa800b  ! 906: SDIVcc_R	sdivcc 	%r10, %r11, %r3
	.word 0x24800003  ! 907: BLE	ble,a	<label_0x3>
	.word 0x8ba2892b  ! 908: FMULs	fmuls	%f10, %f11, %f5
	.word 0xce0aa650  ! 909: LDUB_I	ldub	[%r10 + 0x0650], %r7
	.word 0xc2a2900b  ! 910: STWA_R	stwa	%r1, [%r10 + %r11] 0x80
	.word 0xca4a800b  ! 911: LDSB_R	ldsb	[%r10 + %r11], %r5
	.word 0x8143e019  ! 912: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside 
	.word 0x9252800b  ! 913: UMUL_R	umul 	%r10, %r11, %r9
	.word 0x86fa800b  ! 914: SDIVcc_R	sdivcc 	%r10, %r11, %r3
	.word 0x8edaa4c4  ! 915: SMULcc_I	smulcc 	%r10, 0x04c4, %r7
	.word 0x8f6a800b  ! 916: SDIVX_R	sdivx	%r10, %r11, %r7
	.word 0x87a288ab  ! 917: FSUBs	fsubs	%f10, %f11, %f3
	.word 0x8da289ab  ! 918: FDIVs	fdivs	%f10, %f11, %f6
	.word 0xc6aa900b  ! 919: STBA_R	stba	%r3, [%r10 + %r11] 0x80
	.word 0x8c52a014  ! 920: UMUL_I	umul 	%r10, 0x0014, %r6
	.word 0x20800003  ! 921: BN	bn,a	<label_0x3>
	.word 0x8522a7d0  ! 922: MULScc_I	mulscc 	%r10, 0x07d0, %r2
	.word 0x83a2892b  ! 923: FMULs	fmuls	%f10, %f11, %f1
	.word 0xce6aa318  ! 924: LDSTUB_I	ldstub	%r7, [%r10 + 0x0318]
	.word 0xf06aa7ec  ! 925: LDSTUB_I	ldstub	%r24, [%r10 + 0x07ec]
	.word 0xafdaabac  ! 926: FLUSH_I	dis not found

	.word 0xfa52800b  ! 927: LDSH_R	ldsh	[%r10 + %r11], %r29
	.word 0xce52800b  ! 928: LDSH_R	ldsh	[%r10 + %r11], %r7
	.word 0xc33aa248  ! 929: STDF_I	std	%f1, [0x0248, %r10]
	.word 0x88daa930  ! 930: SMULcc_I	smulcc 	%r10, 0x0930, %r4
	.word 0xe13a800b  ! 931: STDF_R	std	%f16, [%r11, %r10]
	.word 0xb9da800b  ! 932: FLUSH_R	dis not found

	.word 0xc36aa1d8  ! 933: PREFETCH_I	prefetch	[%r10 + 0x01d8], #one_read
	.word 0x8143c000  ! 934: STBAR	stbar
	.word 0x9272a1c0  ! 935: UDIV_I	udiv 	%r10, 0x01c0, %r9
	.word 0xba7aabd0  ! 937: SDIV_I	sdiv 	%r10, 0x0bd0, %r29
	.word 0xa2f2a28c  ! 938: UDIVcc_I	udivcc 	%r10, 0x028c, %r17
	.word 0x885aafb4  ! 939: SMUL_I	smul 	%r10, 0x0fb4, %r4
	.word 0xd0caae3c  ! 940: LDSBA_I	ldsba	[%r10, + 0x0e3c] %asi, %r8
	.word 0xa6fa800b  ! 941: SDIVcc_R	sdivcc 	%r10, %r11, %r19
	.word 0xde92a9c4  ! 942: LDUHA_I	lduha	[%r10, + 0x09c4] %asi, %r15
	.word 0xc89a900b  ! 943: LDDA_R	ldda	[%r10, %r11] 0x80, %r4
	.word 0xc652800b  ! 944: LDSH_R	ldsh	[%r10 + %r11], %r3
	.word 0x8ba2892b  ! 945: FMULs	fmuls	%f10, %f11, %f5
	.word 0xdeb2900b  ! 946: STHA_R	stha	%r15, [%r10 + %r11] 0x80
	.word 0x99daa27c  ! 947: FLUSH_I	dis not found

	.word 0x8143c000  ! 948: STBAR	stbar
	.word 0xf5e2a00b  ! 949: CASA_R	casa	[%r10] %asi, %r11, %r26
	.word 0xfa7aa440  ! 950: SWAP_I	swap	%r29, [%r10 + 0x0440]
	.word 0x93a2892b  ! 951: FMULs	fmuls	%f10, %f11, %f9
	.word 0xf2b2900b  ! 952: STHA_R	stha	%r25, [%r10 + %r11] 0x80
	.word 0xd33aacc8  ! 953: STDF_I	std	%f9, [0x0cc8, %r10]
	.word 0x8143c000  ! 954: STBAR	stbar
	.word 0xf8a2a868  ! 955: STWA_I	stwa	%r28, [%r10 + 0x0868] %asi
	.word 0xb1da800b  ! 956: FLUSH_R	dis not found

	.word 0x8143c000  ! 957: STBAR	stbar
	.word 0x04ca0003  ! 958: BRLEZ	brlez  ,pt	%8,<label_0xa0003>
	.word 0xf8f2900b  ! 959: STXA_R	stxa	%r28, [%r10 + %r11] 0x80
	.word 0x99a2882b  ! 960: FADDs	fadds	%f10, %f11, %f12
	.word 0xc93aab20  ! 961: STDF_I	std	%f4, [0x0b20, %r10]
	.word 0x8e7a800b  ! 962: SDIV_R	sdiv 	%r10, %r11, %r7
	.word 0x91da800b  ! 963: FLUSH_R	dis not found

	.word 0x0a800003  ! 964: BCS	bcs  	<label_0x3>
	.word 0xc36a800b  ! 965: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x8143c000  ! 967: STBAR	stbar
	.word 0x8e6aa150  ! 968: UDIVX_I	udivx 	%r10, 0x0150, %r7
	.word 0x8ddaaebc  ! 969: FLUSH_I	dis not found

	.word 0xcea2900b  ! 970: STWA_R	stwa	%r7, [%r10 + %r11] 0x80
	.word 0xf212aca4  ! 971: LDUH_I	lduh	[%r10 + 0x0ca4], %r25
	.word 0xb3da800b  ! 972: FLUSH_R	dis not found

	.word 0xada289ab  ! 973: FDIVs	fdivs	%f10, %f11, %f22
	.word 0xe47a800b  ! 974: SWAP_R	swap	%r18, [%r10 + %r11]
	.word 0xcc5a800b  ! 975: LDX_R	ldx	[%r10 + %r11], %r6
	.word 0x2cc20003  ! 976: BRGZ	brgz,a,nt	%8,<label_0x20003>
	.word 0xea82a4f8  ! 977: LDUWA_I	lduwa	[%r10, + 0x04f8] %asi, %r21
	.word 0x40000003  ! 978: CALL	call	disp30_3
	.word 0x3c800001  ! 979: BPOS	bpos,a	<label_0x1>
	.word 0xb6f2800b  ! 980: UDIVcc_R	udivcc 	%r10, %r11, %r27
	.word 0xabda800b  ! 981: FLUSH_R	dis not found

	.word 0xf33a800b  ! 982: STDF_R	std	%f25, [%r11, %r10]
	.word 0xc492900b  ! 983: LDUHA_R	lduha	[%r10, %r11] 0x80, %r2
	.word 0x89daad60  ! 984: FLUSH_I	dis not found

	.word 0x906aad8c  ! 985: UDIVX_I	udivx 	%r10, 0x0d8c, %r8
	.word 0xc36a800b  ! 986: PREFETCH_R	prefetch	[%r10 + %r11], #one_read
	.word 0x8922800b  ! 988: MULScc_R	mulscc 	%r10, %r11, %r4
	.word 0xd05aa258  ! 989: LDX_I	ldx	[%r10 + 0x0258], %r8
	.word 0xfa8aa1c0  ! 990: LDUBA_I	lduba	[%r10, + 0x01c0] %asi, %r29
	.word 0xe8c2900b  ! 991: LDSWA_R	ldswa	[%r10, %r11] 0x80, %r20
	.word 0x00800001  ! 993: BN	bn  	<label_0x1>
	.word 0xd13aaf70  ! 994: STDF_I	std	%f8, [0x0f70, %r10]
	.word 0x36800001  ! 995: BGE	bge,a	<label_0x1>
	.word 0x38800001  ! 996: BGU	bgu,a	<label_0x1>
	.word 0xc2daa250  ! 997: LDXA_I	ldxa	[%r10, + 0x0250] %asi, %r1
	.word 0xb1da800b  ! 998: FLUSH_R	dis not found

	.word 0x8143c000  ! 999: STBAR	stbar
	nop
	nop
	nop
        ta      T_GOOD_TRAP

.data
	.word  0x6570677a,0x0f152303,0x311b6e9c,0x92d4f579
	.word  0x968e1219,0x0833ec95,0x90fa485d,0xb49dccdc
	.word  0x7aa7ff65,0x95933b7c,0x2131ce13,0x5455cf32
	.word  0x1ace32f7,0x866dd82b,0xb1a21469,0x99bc51ab
	.word  0xe6ce99a5,0xde6481fc,0x750d4108,0x708427a4
	.word  0x34af5baf,0x2d5749b5,0x0b450a3d,0x77e70b24
	.word  0xe8bb33c0,0xa589e8a6,0x5bd3f121,0xbfe9ed4f
	.word  0xdb7c80de,0x78924cde,0xcf92c6fb,0x31f56066
	.word  0x78b71e2f,0x286cbb9a,0xfdbf4cd6,0x827fe9fa
	.word  0xbb4d084e,0x2e205918,0x98d83f64,0x3b30f019
	.word  0x637d9cde,0x22bff514,0xe730c3d0,0x5105e18b
	.word  0xe925b80f,0x08ec10bd,0xfd57677a,0x1af7f1c6
	.word  0xd1378f92,0xba54b57d,0x294e4d8a,0x8059a3d1
	.word  0x8d368fe9,0x2e87b712,0x364ae71d,0x50324380
	.word  0x78f01e75,0xeb3fc8ba,0x52656527,0x8cc377d1
	.word  0x1d13f88c,0xc180d232,0xff4bf95b,0x059dde05
	.word  0x04ca6c23,0x4fc7398d,0xa5375c62,0xfff9d5b2
	.word  0x9695e2b6,0xb50217e7,0xc8088f62,0x24436978
	.word  0x547ee091,0x6fdbe21a,0xb2234a85,0x7255b1d6
	.word  0xd3e8121b,0x38736ba9,0x61be29e8,0xea9ad93e
	.word  0x4e85b2b3,0x10b27f9f,0xefdd7e50,0x2cf02844
	.word  0xbdb10e62,0xd5caa865,0x55336ab8,0x7b60e40d
	.word  0x5298be0f,0x776f07e3,0xba43986e,0xefa3ea3f
	.word  0x19644645,0x01c02089,0xf6994d7a,0x6cf38510
	.word  0xdfc58ed1,0xd8cfb3ea,0xa8159a8f,0xff6aab60
	.word  0xf1837b70,0x5ce61afd,0x0e37ee4e,0xcf4a9fa2
	.word  0x19cb026b,0x737e75cb,0x9971c663,0xb56e58c6
	.word  0x0ab75b02,0x05d06483,0x6c1819b1,0x5571fcdc
	.word  0x4fde9948,0x5e2fc6cf,0xdef77304,0x26db67ae
	.word  0xa67121db,0x89d72e5d,0x4fbfd87d,0xfc68063d
	.word  0xbca4ad38,0x0f58ed39,0xb03dc7af,0xcf8ab662
	.word  0x3ff31549,0xccbb8eb7,0xfd1533fc,0xef999c30
	.word  0x5fe4dd6e,0x14fddf82,0xbf53a4fb,0x82efeb95
	.word  0xe4dc18de,0x8fb7e3e5,0xd2eb8f40,0xf209c058
	.word  0x836d13a5,0x8abe8622,0x94d170f1,0x3d183419
	.word  0x604b0bb0,0x2fb1b3d2,0xb6c85def,0x08767c2d
	.word  0x5475f424,0x15949e52,0xb87ac05f,0x24b8e116
	.word  0x0941d9b8,0x0f7806d3,0xbd0e7854,0xc980364d
	.word  0xdfb9c718,0x46f09804,0x55f1a359,0xb6d08b18
	.word  0xf3a331c7,0xa31d5664,0x85efd7d9,0xa54a0443
	.word  0x0a0ba67d,0xd8e32288,0x85c4484d,0x3f5c396c
	.word  0x30b2dcba,0xd83738d7,0xb2285be5,0x5057ba3e
	.word  0x4ad4fe0b,0x0906adcd,0xa1b17a64,0xee074cf0
	.word  0xe5c25c03,0x40d23cbe,0x5681b810,0x04efe4cf
	.word  0xf1ae7379,0xdbb707aa,0xb984cfad,0xfb82de13
	.word  0x942bc8b3,0x36896522,0xb201d1bf,0x75902ae2
	.word  0x8f4d2b20,0x1725d66d,0xd7f6a2e0,0x1fd1a938
	.word  0x7be76b12,0xd19db3f8,0x68cdca16,0x332f08d0
	.word  0x219e0be8,0x9c425a97,0xf74225ea,0x98ee4b18
	.word  0x9afc70d0,0xf1fed25e,0xba23a68c,0x42bec6b6
	.word  0x4331fdc6,0x78f0838b,0x44c8df5b,0x537af1c5
	.word  0x90615500,0xb85f31f4,0xe259f215,0x80bcab71
	.word  0xd2e37042,0xb2055b30,0xc49a8f0a,0x7df53dc0
	.word  0x961bc8dd,0xceb13b82,0x40daea91,0xdcce4eeb
	.word  0xaaf8f339,0xc6d85489,0x8922d21a,0xa4b61255
	.word  0xa3e9e789,0x9271a0da,0xc336e5d8,0xf562da22
	.word  0xa291b917,0x726b04cb,0x5cd4fa52,0xd3e9f8db
	.word  0xc0b0a4f1,0x81230095,0x25684d79,0xfb73587d
	.word  0xdd7011ed,0x0c0d313a,0x3ac8817c,0x87585c95
	.word  0x0debc66a,0xec5bf4f0,0xb588458e,0x6bb1b6df
	.word  0x9aa30dbc,0xde5c30fa,0x63d790dd,0x76e77c01
	.word  0xd95d5917,0x40f4a1d3,0x347cd487,0x141b1ea5
	.word  0xa0358b5e,0xa8743137,0x79e3724e,0x02894476
	.word  0x8d100629,0x0b6e8a01,0xa80cd0bd,0x62ab4756
	.word  0xf572df18,0xd3db6c15,0x2cc02f98,0x0f39062a
	.word  0x57e94158,0xb1bf6bb5,0xb50d11ca,0xbd3616a4
	.word  0xf74a2ce6,0x00f4384f,0xbfb7f79c,0xc5f09c04
	.word  0x22766a3f,0xbe1a03f9,0xb149b88a,0xfbf271d8
	.word  0x51ec9d3c,0x1036e628,0xbac887ef,0x90a9a2f7
	.word  0x33a029ed,0xc95b35ec,0xaa1b0c41,0xccf0af56
	.word  0xd296fa06,0xc89e50af,0x19d6cdb6,0xda937fff
	.word  0x8ff17404,0x12dde422,0x32611fea,0x663b5b3b
	.word  0xc4e746ab,0x40e727fe,0xce41529d,0x17ca97c9
	.word  0xa5c31653,0x57e1c4ea,0xfd79aa72,0x30302ecf
	.word  0x5a41c715,0xc692827e,0x84f7b7b5,0x7d3b6cac
	.word  0x9189fabe,0x5bf4f990,0x3b5a2868,0x19684cf6
	.word  0xd0d626da,0xa8751591,0x2f07cfcd,0x7b86138b
	.word  0x29b87fa9,0x48e4c14f,0xa8e7cf9d,0x98ecff87
	.word  0x34f0c7e4,0xf5ed9841,0xc82f0c37,0x1766976f
	.word  0xad66e451,0x487b948b,0x637cf218,0x66a3dbc6
	.word  0x55359a37,0x5f1f2a87,0x4d504b6b,0x75dea000
	.word  0xe2bec19a,0x9a80c3c2,0xf59fffc0,0xecbfa474
	.word  0x09ccdc85,0x2f8f58fc,0xd91c5aa9,0x4d99aa27
	.word  0x72c4dc28,0x405d92a7,0x900771ad,0xa5812548
	.word  0x9c796c60,0xd795732a,0xc718d8fe,0x5b94190a
	.word  0x2f077d66,0x4851bbdf,0xa008197f,0x7a5fbef4
	.word  0x38cb0699,0x81913f62,0xf1d86a1c,0x9bf7ee4d
	.word  0xf3818357,0x1892c2c7,0x6d72844c,0xca30d35a
	.word  0x96ea9b93,0x1afbcfcc,0x32c64221,0x77814d87
	.word  0x892a7e7c,0x4180484a,0xaa32f22a,0x469615cc
	.word  0xdeb93611,0x313eae5b,0x4e629606,0xc9b29449
	.word  0x44f0856f,0x0abd536a,0x75e1a1ea,0xb768a2d1
	.word  0xf544aabf,0xf2b17464,0xf3136d07,0xfa19289d
	.word  0xd3c55fe3,0xe43d2381,0xabc28d3c,0x2d3e50ea
	.word  0x3935618f,0xcfb17f14,0x623fa6bc,0x95362c77
	.word  0x83b2fd22,0xca79b672,0xf39ba533,0x7d354875
	.word  0xe95758ed,0x9b414556,0x4de3d11a,0xcebb972e
	.word  0xd7fc8b20,0xd90877ad,0xeaf6c072,0x9365b0ac
	.word  0xd4e79f72,0xd7222fcb,0x0d72d554,0xbef3f02c
	.word  0xe3817147,0xaea05c7b,0xa6eb4bae,0xa6d2e5bb
	.word  0x1e74fea8,0xd2c6ece9,0xa3cfc93a,0x19b92645
	.word  0x44f9cb8d,0x398d0b90,0xef62ec5c,0x6c7e5f3f
	.word  0x2633d7ed,0x91ab14dd,0xc7a4f697,0x6a0b6308
	.word  0x8154cd5f,0xf118b0a2,0x443166c1,0x5ff55e96
	.word  0x3ef2a8c7,0xa511da0a,0x5fb98570,0xbedc8097
	.word  0xaea96102,0x6c568611,0xd3ac412e,0x417ca515
	.word  0xa8c312bf,0x5b3afb6d,0x3f81b1b5,0x6afba1f2
	.word  0x00d66061,0x9b9d8750,0x739ab663,0x4b421a22
	.word  0x6c73fc9b,0x13098512,0xa2e9ff52,0x3cbde151
	.word  0x0b1da792,0x013982ea,0xa6cce121,0xcb8e87b0
	.word  0x3f631f01,0xfae3b417,0x12696016,0x74261d07
	.word  0x3cf822e5,0x912297fa,0x7306f932,0x78515f40
	.word  0xa5c55f03,0xa70ff3eb,0xb4e88910,0x57721607
	.word  0x946a9565,0x9fcc73e9,0x63c6ad1f,0x12a971ed
	.word  0x2be98dec,0x02363977,0xd110f040,0xdb11a1d8
	.word  0x8b1b7c0b,0x281ce1ca,0xfb743a53,0xbac5da27
	.word  0x8854a7ef,0x03818a49,0x865b5457,0xe4de39dc
	.word  0x50476b24,0x06daa715,0x05b56218,0x5078b639
	.word  0x6fdc4bd5,0x514de780,0x5b6e7b38,0xd9fe922c
	.word  0x0cbc6c02,0x6a464ba3,0xe15cf7a7,0xdfda56e4
	.word  0x5a31f049,0xaec42954,0x9236c6b8,0x81aa150f
	.word  0x4a609d75,0x3ae5cb7b,0x413f9463,0x9336e71b
	.word  0xd18e57d5,0x74683177,0x2e9ec928,0x45490fd3
	.word  0xbdf7f2ad,0x370c9d3c,0x3b2ee9d3,0xe1506b4b
	.word  0x941187ff,0x41e1165f,0x10815825,0x4d178ff3
	.word  0x8812e06b,0x6b7d4ea7,0xb9d8ea91,0x44f2b3d5
	.word  0xf31582fb,0xf19b1383,0xbdaa4b4d,0x54419aba
	.word  0xd57a37b4,0xd681c51c,0xf857f902,0x4c2e8a0a
	.word  0x7820a0da,0x6e7120db,0x94662383,0x38bd7029
	.word  0x7510b203,0x28ac08a6,0x39067a9c,0xe51bc18c
	.word  0x36066a26,0x1b4ddbfe,0x73be7383,0x68c007cd
	.word  0x8bb28ea5,0x4a530c80,0x24b3d305,0x5e8e00b1
	.word  0x2a48513b,0xb6949439,0x78f42438,0xcf14f2ce
	.word  0xb9a54be5,0x5529eb66,0x3f28e705,0xd0aa5c66
	.word  0xfc4ed324,0x6df53f5d,0xe6e9e850,0x0dd952a6
	.word  0x684e4c29,0x970967d1,0x4e39cbdb,0xe177912e
	.word  0xe87489c5,0x689a48c4,0x5e1da65f,0x6026fb95
	.word  0x0719f9c4,0x752c4548,0xd678cf8f,0x8a0cc765
	.word  0xa4d949e6,0x11bbf99d,0xeb95907a,0x028b9ca6
	.word  0xe2b6be47,0x45cc4bc1,0x1fe4e604,0xdefe4f51
	.word  0xb31e5ee2,0xca9af929,0x897ccf43,0x1678fba1
	.word  0x7fc29389,0xec5b467f,0x3752e704,0x10f912ba
	.word  0x197bea23,0xcbd9f7d2,0x937ab2c6,0x7599bdd0
	.word  0x2613f508,0x2eb51a53,0x4906ecea,0x49ceacd7
	.word  0xc891647c,0x4664b6d5,0x13092558,0x783a63d7
	.word  0xc29ca5ba,0xba59a8d6,0x94f8a6b7,0x86188390
	.word  0x0a1a4202,0x2e5c9cf8,0x52a08332,0x124d43a7
	.word  0x8ae8aa62,0x1253dbf0,0x5a1609ea,0xa992f7c2
	.word  0x0c233910,0xdada4a60,0x43721234,0xc5d574ee
	.word  0x61387586,0x5dd1f1d3,0xdb7a49ff,0x556b50f4
	.word  0xbf6145af,0xff7ec4b2,0x2d77b338,0x4c530226
	.word  0x8b8cd2ec,0x647809a3,0xbc4280e7,0x636f1343
	.word  0x96b2e0cd,0x5ff11912,0xf9081cb5,0x018ad5f6
	.word  0x35a6809b,0xcc4e55af,0x9ea7d2b5,0x15b3fe30
	.word  0xe562ca8d,0x936713f2,0xf602e729,0x5f83e447
	.word  0x520981fa,0xecf02684,0x871c9808,0x7ca10952
	.word  0x8f4d89b9,0xf1ed7e05,0x5e6ee3a8,0x639fc964
	.word  0xa94ffdd5,0x789580c6,0xaa0506d9,0xc7305480
	.word  0x432e5bd0,0x085c40c7,0x8aedeab0,0x41360563
	.word  0x401f2c52,0xdba16073,0x0a8d4279,0x36b753cb
	.word  0x33f8bf90,0x36561b91,0x407f0e98,0xd4216294
	.word  0x42c5c843,0x2c61841b,0x59fa75c4,0xb40b3000
	.word  0x7025a5ba,0xb076c49f,0xc5f88f63,0x3baddd9a
	.word  0x35f602ed,0x9a6b5f02,0x88ec2b83,0xc92ba53d
	.word  0x32659dba,0xbe06148a,0xa46be801,0x958cd6bb
	.word  0xaf51df5e,0x4806a356,0xb293be27,0x7bca2eac
	.word  0x0bb9a9fb,0x412ff95e,0xa37c7d74,0x02bf0f27
	.word  0x89d1bd04,0x89f206f4,0xfea6a469,0x1f160f8f
	.word  0x4fb9e0eb,0xfd65191b,0x1ee95957,0xcc17b1db
	.word  0x7fa141ee,0xd29d5057,0x38737e0d,0xb8540fba
	.word  0x7d1921ec,0x552bae26,0x92fd6afd,0xfb372a0e
	.word  0xeb2f1ada,0x5b8b0141,0x00857ccb,0x25592529
	.word  0x287b9117,0xc6f34311,0xd7ac9a1d,0x844a4d97
	.word  0x144e87a4,0x6ed9f345,0x7de2a87b,0x36000022
	.word  0xcd7c8a8a,0xde447fed,0xa9d11b3a,0xe0c1c611
	.word  0xecc89546,0x89a8809a,0x438cedaf,0xc5831a14
	.word  0x825173cb,0x5aeb98a5,0x9bf83403,0xceb0e1a6
	.word  0x977700db,0xe5954905,0x0937cd77,0xcfafa359
	.word  0xe430ba23,0xd61f9d44,0x43591fd7,0x7ec3a290
	.word  0x8b439aed,0x5a9ffe65,0xf395e011,0x0262f5ed
	.word  0xc35af682,0xb413d78b,0x241a6f7e,0xc370ba93
	.word  0xea5b667b,0x7eee1708,0x46736c25,0x96800a23
	.word  0x18844e9f,0x3edcb5f0,0xb8c74265,0x3faa6bf8
	.word  0x69cc8ca3,0x8556c073,0x5e9e1b62,0x35db2a3e
	.word  0x6e64109b,0x1c9e9d70,0xc83208d5,0x08d2b6ef
	.word  0x4d7be5a1,0xaf7d6ad4,0x49cf9e8f,0x0c3a38d4
	.word  0x5e40964c,0xc9eb0b49,0x7afae3ce,0x28b294f6
	.word  0x3e1c1fd1,0x9afae2c2,0xa519caae,0x3a0fe6fe
	.word  0xa92117bc,0xa0f327b5,0x1ba4b789,0x2d68d4ad
	.word  0xd9f4488d,0x27b35aaa,0xdb6753b8,0xeb9146b9
	.word  0x3b84e17c,0xc3cab4d2,0xe736ce0e,0x53c761d3
	.word  0x3dfd4456,0x3563ba6e,0xe8dad6d2,0x03971372
	.word  0xedf0a097,0xb39b3a99,0x40647a47,0xbc4fbc55
	.word  0xd4b663db,0x1153e28f,0x92a0911a,0xf91f68ba
	.word  0x194f95a8,0x84b108fc,0x15d237c1,0xa51d346b
	.word  0xd9e91af6,0x177cd584,0xc1bb619b,0x256dbae1
	.word  0x488a378f,0xa9be3d21,0x5e97fa93,0xa2c692d7
	.word  0x88ab98f9,0xdfb69274,0x139cb91c,0x19ce6c3e
	.word  0xac23895c,0x9ad68e27,0x031567b7,0xa3cc3ae4
	.word  0x55cb28e1,0x3ee6ddf5,0x35650a81,0x13e4bc95
	.word  0xd4378f47,0xd2d8d8a1,0x405b1fd8,0x15ec11ce
	.word  0xa97f0f5e,0x856be28e,0x13601084,0x8cbf1558
	.word  0x1f891803,0xa2f236ab,0x1af6e308,0xf795f783
	.word  0xe09837cf,0x39b86e87,0xaa08b71d,0xa6f3f677
	.word  0xcb1af7fd,0x25e2230a,0x75fbecce,0xcbc37645
	.word  0x7168304d,0x7905e5c2,0x246bbb8a,0x13c86b97
	.word  0xeb1b3ade,0x733dcd36,0x1b33f0a3,0x646a0b07
	.word  0xabdc4030,0x4b3570df,0x8092c9ae,0x8183c782
	.word  0xd4761490,0xe0d634ed,0x71e24b7c,0x8a0f0308
	.word  0xde4d52d6,0xcecb0649,0xc691f634,0x9ec3f70d
	.word  0x220e214c,0x46d2e688,0x3fd10a0d,0xb300da08
	.word  0xc5e8761f,0xd8d24505,0x629cf609,0xdf141235
	.word  0xaad7cb5b,0x36a2ee05,0xa5317ed6,0xf07aa02c
	.word  0x7297884d,0x397f83f0,0x61d97172,0x73bfa246
	.word  0xfe85f51b,0x0a8d80f8,0xc382eb99,0x99850b9e
	.word  0xb0b8df89,0x1289019a,0xc7597377,0x37b3bc07
	.word  0x35fae0f1,0x1b3875bf,0x4b05312f,0x84b174f0
	.word  0xd7a43226,0x2b63af70,0x3594cf7a,0x52c2bafd
	.word  0xd2384e39,0x3184db8e,0x2fabac06,0x3b7fc121
	.word  0x327ae30a,0x4bf2fd0a,0x94ee4804,0x1e9994bc
	.word  0x2228adf4,0x137f3f18,0x9053366f,0x5a97d150
	.word  0x45e89399,0x7844ab82,0x458b2f8d,0x61b2dd5b
	.word  0xce4b2d2f,0x93535e5a,0x74ce0e10,0xbcc2ece2
	.word  0x66927f40,0x47bddc66,0xe3d285d6,0xb86724c7
	.word  0x157c10e5,0x0538a7e9,0xb1661dc2,0x7b1cc136
	.word  0x078f3396,0x23ad4de5,0xf78b2222,0xab107285
	.word  0x93f67384,0xbefec005,0x5d7b8cc9,0x79b93b57
	.word  0x6e81788a,0x706ff612,0xd0d1c203,0x51e53aa7
	.word  0xca5eacbd,0xd4a1cc12,0x009e89f2,0x91abf653
	.word  0xcea8c151,0x7f1c5879,0x5c5fddaf,0xde85b822
	.word  0xd9788805,0x435a344c,0xe7e97195,0x6f95319e
	.word  0x7493cdff,0x6472fa9a,0x400af11d,0xdc18aeb2
	.word  0xd1df8e4e,0x8edc1e91,0x6a75434e,0x59f32180
	.word  0x22b93cd9,0x04659ab6,0x25870717,0x2ab1da7d
	.word  0xc1bd7da7,0xe46ed491,0xb71c20f0,0xe3a96a04
	.word  0xb33567d5,0x49a4e074,0x415e9f97,0x311694a7
	.word  0x9ed3e164,0x39dca8d5,0x2e6ad443,0xe28200e8
	.word  0x6355945c,0x01f703e0,0x713b753c,0x15130d46
	.word  0x62bc13f3,0xbe95dc7d,0x240116b6,0x11546699
	.word  0xfc9cd65f,0xb488c12d,0xde4e38c4,0x6b2edb10
	.word  0x9bb52927,0x919267e9,0x2dacf6af,0x9c2e7448
	.word  0x020d843f,0xa32c4d37,0x0b17bb82,0x7f584bd2
	.word  0xb89508be,0x36a02e7f,0x21399091,0x62bf682f
	.word  0xf79c27a9,0xa6baaec7,0x3bd7d384,0x2228891c
	.word  0xc59f2236,0x6de4be42,0x5903b2cf,0x349a3dcf
	.word  0x759f7e27,0x0f023cd9,0x45baf328,0xa10a2f16
	.word  0x6b3c7501,0x178233ab,0x48fc3d2f,0x271bd810
	.word  0x06fe6f80,0xcdaf0f18,0xe69b8e52,0xc46302fd
	.word  0xad334e26,0x78ffc96b,0xe1d275ca,0x3c42274e
	.word  0x44adb074,0x8c4e7f16,0xa9f4bbc9,0x0148eac7
	.word  0x64482bec,0xecdf6b0e,0xe9bea2a2,0x15db512e
	.word  0xf079577c,0xca084554,0x0113badf,0x66198d40
	.word  0xf68e1c5f,0x1802426f,0xffc5fed3,0xd1f2dabc
	.word  0xf0496954,0xceecc58f,0xd5624c70,0x00228001
	.word  0x91cab9ee,0x8d52d2e8,0x6e78fffa,0xd194ac3e
	.word  0x307f0313,0x67a1088f,0x0e0975f9,0xf0800282

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
!! Rule   3 (line  130), Count:    94  inst_type            -> mul 
!! Rule   4 (line  130), Count:    90  inst_type            -> div 
!! Rule   5 (line  130), Count:    96  inst_type            -> fpop 
!! Rule   6 (line  130), Count:    88  inst_type            -> load 
!! Rule   7 (line  130), Count:    91  inst_type            -> asi_load 
!! Rule   8 (line  130), Count:    87  inst_type            -> asi_st 
!! Rule   9 (line  130), Count:    91  inst_type            -> br 
!! Rule  10 (line  130), Count:    89  inst_type            -> membar 
!! Rule  11 (line  130), Count:    90  inst_type            -> atomic 
!! Rule  12 (line  130), Count:    89  inst_type            -> flush 
!! Rule  13 (line  131), Count:    84  inst_type            -> prefetch 
!! Rule  14 (line  137), Count:    46  fpop                 -> st_fp 
!! Rule  15 (line  137), Count:    49  fpop                 -> arith_fp 
!! Rule  16 (line  140), Count:     2  mul                  -> tMULX_R 
!! Rule  17 (line  140), Count:     6  mul                  -> tMULX_I 
!! Rule  18 (line  140), Count:    10  mul                  -> tUMUL_R 
!! Rule  19 (line  140), Count:     4  mul                  -> tUMUL_I 
!! Rule  20 (line  140), Count:     9  mul                  -> tSMUL_R 
!! Rule  21 (line  140), Count:     8  mul                  -> tSMUL_I 
!! Rule  22 (line  140), Count:    12  mul                  -> tUMULcc_R 
!! Rule  23 (line  140), Count:     7  mul                  -> tUMULcc_I 
!! Rule  24 (line  140), Count:    10  mul                  -> tSMULcc_R 
!! Rule  25 (line  140), Count:     7  mul                  -> tSMULcc_I 
!! Rule  26 (line  140), Count:     6  mul                  -> tMULScc_R 
!! Rule  27 (line  140), Count:     2  mul                  -> tMULScc_I 
!! Rule  28 (line  143), Count:     9  div                  -> tUDIV_I 
!! Rule  29 (line  143), Count:     4  div                  -> tUDIV_R 
!! Rule  30 (line  143), Count:     6  div                  -> tSDIV_I 
!! Rule  31 (line  143), Count:     7  div                  -> tSDIV_R 
!! Rule  32 (line  143), Count:    11  div                  -> tSDIVX_R 
!! Rule  33 (line  143), Count:     1  div                  -> tSDIVX_I 
!! Rule  34 (line  143), Count:     3  div                  -> tUDIVX_R 
!! Rule  35 (line  143), Count:     8  div                  -> tUDIVX_I 
!! Rule  36 (line  143), Count:     5  div                  -> tUDIVcc_I 
!! Rule  37 (line  143), Count:     7  div                  -> tUDIVcc_R 
!! Rule  38 (line  143), Count:     9  div                  -> tSDIVcc_I 
!! Rule  39 (line  143), Count:     9  div                  -> tSDIVcc_R 
!! Rule  40 (line  146), Count:     5  load                 -> tLDSB_R 
!! Rule  41 (line  146), Count:     3  load                 -> tLDSB_I 
!! Rule  42 (line  146), Count:     5  load                 -> tLDSH_R 
!! Rule  43 (line  146), Count:     4  load                 -> tLDSH_I 
!! Rule  44 (line  146), Count:     2  load                 -> tLDSW_R 
!! Rule  45 (line  146), Count:     8  load                 -> tLDSW_I 
!! Rule  46 (line  146), Count:     3  load                 -> tLDUB_R 
!! Rule  47 (line  146), Count:     5  load                 -> tLDUB_I 
!! Rule  48 (line  146), Count:     6  load                 -> tLDUH_R 
!! Rule  49 (line  146), Count:     5  load                 -> tLDUH_I 
!! Rule  50 (line  146), Count:     6  load                 -> tLDUW_R 
!! Rule  51 (line  146), Count:     9  load                 -> tLDUW_I 
!! Rule  52 (line  146), Count:     2  load                 -> tLDX_R 
!! Rule  53 (line  146), Count:     4  load                 -> tLDX_I 
!! Rule  54 (line  146), Count:     3  load                 -> tLDD_R 
!! Rule  55 (line  146), Count:     3  load                 -> tLDD_I 
!! Rule  56 (line  149), Count:     4  asi_load             -> tLDSBA_R 
!! Rule  57 (line  149), Count:     3  asi_load             -> tLDSBA_I 
!! Rule  58 (line  149), Count:     4  asi_load             -> tLDSHA_R 
!! Rule  59 (line  149), Count:     2  asi_load             -> tLDSHA_I 
!! Rule  60 (line  149), Count:     5  asi_load             -> tLDSWA_R 
!! Rule  61 (line  149), Count:     7  asi_load             -> tLDSWA_I 
!! Rule  62 (line  149), Count:     2  asi_load             -> tLDUBA_R 
!! Rule  63 (line  149), Count:     8  asi_load             -> tLDUBA_I 
!! Rule  64 (line  149), Count:     4  asi_load             -> tLDUHA_R 
!! Rule  65 (line  149), Count:     7  asi_load             -> tLDUHA_I 
!! Rule  66 (line  149), Count:     2  asi_load             -> tLDUWA_R 
!! Rule  67 (line  149), Count:     6  asi_load             -> tLDUWA_I 
!! Rule  68 (line  149), Count:     6  asi_load             -> tLDXA_R 
!! Rule  69 (line  149), Count:     6  asi_load             -> tLDXA_I 
!! Rule  70 (line  149), Count:     1  asi_load             -> tLDDA_R 
!! Rule  71 (line  149), Count:     9  asi_load             -> tLDDA_I 
!! Rule  72 (line  152), Count:    10  asi_st               -> tSTBA_R 
!! Rule  73 (line  152), Count:     6  asi_st               -> tSTBA_I 
!! Rule  74 (line  152), Count:    15  asi_st               -> tSTHA_R 
!! Rule  75 (line  152), Count:     6  asi_st               -> tSTHA_I 
!! Rule  76 (line  152), Count:     5  asi_st               -> tSTWA_R 
!! Rule  77 (line  152), Count:     7  asi_st               -> tSTWA_I 
!! Rule  78 (line  152), Count:     8  asi_st               -> tSTXA_R 
!! Rule  79 (line  152), Count:     9  asi_st               -> tSTXA_I 
!! Rule  80 (line  152), Count:     8  asi_st               -> tSTDA_R 
!! Rule  81 (line  152), Count:     4  asi_st               -> tSTDA_I 
!! Rule  82 (line  155), Count:     2  br                   -> tBA 
!! Rule  83 (line  155), Count:     9  br                   -> tBN 
!! Rule  84 (line  155), Count:     0  br                   -> tBNE 
!! Rule  85 (line  155), Count:     4  br                   -> tBE 
!! Rule  86 (line  155), Count:     5  br                   -> tBG 
!! Rule  87 (line  155), Count:     7  br                   -> tBLE 
!! Rule  88 (line  155), Count:     3  br                   -> tBGE 
!! Rule  90 (line  155), Count:     7  br                   -> tBGU 
!! Rule  91 (line  155), Count:     2  br                   -> tBLEU 
!! Rule  92 (line  156), Count:     2  br                   -> tBCC 
!! Rule  93 (line  156), Count:     1  br                   -> tBCS 
!! Rule  94 (line  156), Count:     0  br                   -> tBPOS 
!! Rule  95 (line  156), Count:     2  br                   -> tBNEG 
!! Rule  96 (line  156), Count:     1  br                   -> tBVC 
!! Rule  97 (line  156), Count:     5  br                   -> tBVS 
!! Rule  98 (line  156), Count:     2  br                   -> tBRZ 
!! Rule  99 (line  156), Count:     4  br                   -> tBRLEZ 
!! Rule 100 (line  157), Count:     1  br                   -> tBRLZ 
!! Rule 101 (line  157), Count:     3  br                   -> tBRNZ 
!! Rule 102 (line  157), Count:     5  br                   -> tBRGZ 
!! Rule 103 (line  157), Count:     4  br                   -> tBRGEZ 
!! Rule 104 (line  157), Count:     1  br                   -> tCALL 
!! Rule 105 (line  160), Count:    41  membar               -> tMEMBAR 
!! Rule 106 (line  160), Count:    47  membar               -> tSTBAR 
!! Rule 107 (line  163), Count:    12  atomic               -> tCASA_R 
!! Rule 108 (line  163), Count:    10  atomic               -> tCASA_I 
!! Rule 109 (line  163), Count:     8  atomic               -> tCASXA_R 
!! Rule 110 (line  163), Count:     9  atomic               -> tCASXA_I 
!! Rule 111 (line  163), Count:     8  atomic               -> tLDSTUBA_I 
!! Rule 112 (line  163), Count:     6  atomic               -> tLDSTUB_I 
!! Rule 113 (line  163), Count:     4  atomic               -> tLDSTUB_R 
!! Rule 114 (line  163), Count:     5  atomic               -> tLDSTUBA_R 
!! Rule 115 (line  163), Count:     5  atomic               -> tSWAP_I 
!! Rule 116 (line  163), Count:     6  atomic               -> tSWAP_R 
!! Rule 117 (line  163), Count:     3  atomic               -> tSWAPA_I 
!! Rule 118 (line  163), Count:     3  atomic               -> tSWAPA_R 
!! Rule 119 (line  166), Count:     9  st_fp                -> tSTF_R 
!! Rule 120 (line  166), Count:     6  st_fp                -> tSTF_I 
!! Rule 121 (line  166), Count:    15  st_fp                -> tSTDF_I 
!! Rule 122 (line  166), Count:    13  st_fp                -> tSTDF_R 
!! Rule 123 (line  169), Count:    11  arith_fp             -> tFADDs 
!! Rule 124 (line  169), Count:     7  arith_fp             -> tFSUBs 
!! Rule 125 (line  169), Count:    18  arith_fp             -> tFMULs 
!! Rule 126 (line  169), Count:    10  arith_fp             -> tFDIVs 
!! Rule 127 (line  172), Count:    16  prefetch             -> tPREFETCH_I 
!! Rule 128 (line  172), Count:    21  prefetch             -> tPREFETCH_R 
!! Rule 129 (line  172), Count:    24  prefetch             -> tPREFETCHA_I 
!! Rule 130 (line  172), Count:    20  prefetch             -> tPREFETCHA_R 
!! Rule 131 (line  175), Count:    43  flush                -> tFLUSH_I 
!! 
!!   257: Token tMULX_R	Count = 3
!!   258: Token tMULX_I	Count = 7
!!   259: Token tUMUL_R	Count = 11
!!   260: Token tUMUL_I	Count = 5
!!   261: Token tSMUL_R	Count = 10
!!   262: Token tSMUL_I	Count = 9
!!   263: Token tUMULcc_R	Count = 13
!!   264: Token tUMULcc_I	Count = 8
!!   265: Token tSMULcc_R	Count = 11
!!   266: Token tSMULcc_I	Count = 8
!!   267: Token tMULScc_R	Count = 7
!!   268: Token tMULScc_I	Count = 3
!!   269: Token tUDIV_I	Count = 10
!!   270: Token tUDIV_R	Count = 5
!!   271: Token tSDIV_I	Count = 7
!!   272: Token tSDIV_R	Count = 8
!!   273: Token tSDIVX_R	Count = 12
!!   274: Token tSDIVX_I	Count = 2
!!   275: Token tUDIVX_R	Count = 4
!!   276: Token tUDIVX_I	Count = 9
!!   277: Token tUDIVcc_I	Count = 6
!!   278: Token tUDIVcc_R	Count = 8
!!   279: Token tSDIVcc_I	Count = 10
!!   280: Token tSDIVcc_R	Count = 10
!!   281: Token tLDSB_R	Count = 6
!!   282: Token tLDSB_I	Count = 4
!!   283: Token tLDSH_R	Count = 6
!!   284: Token tLDSH_I	Count = 5
!!   285: Token tLDSW_R	Count = 3
!!   286: Token tLDSW_I	Count = 9
!!   287: Token tLDUB_R	Count = 4
!!   288: Token tLDUB_I	Count = 6
!!   289: Token tLDUH_R	Count = 7
!!   290: Token tLDUH_I	Count = 6
!!   291: Token tLDUW_R	Count = 7
!!   292: Token tLDUW_I	Count = 10
!!   293: Token tLDX_R	Count = 3
!!   294: Token tLDX_I	Count = 5
!!   295: Token tLDD_R	Count = 4
!!   296: Token tLDD_I	Count = 4
!!   297: Token tLDSBA_R	Count = 5
!!   298: Token tLDSBA_I	Count = 4
!!   299: Token tLDSHA_R	Count = 5
!!   300: Token tLDSHA_I	Count = 3
!!   301: Token tLDSWA_R	Count = 6
!!   302: Token tLDSWA_I	Count = 8
!!   303: Token tLDUBA_R	Count = 3
!!   304: Token tLDUBA_I	Count = 9
!!   305: Token tLDUHA_R	Count = 5
!!   306: Token tLDUHA_I	Count = 8
!!   307: Token tLDUWA_R	Count = 3
!!   308: Token tLDUWA_I	Count = 7
!!   309: Token tLDXA_R	Count = 7
!!   310: Token tLDXA_I	Count = 7
!!   311: Token tLDDA_R	Count = 2
!!   312: Token tLDDA_I	Count = 10
!!   313: Token tSTBA_R	Count = 11
!!   314: Token tSTBA_I	Count = 7
!!   315: Token tSTHA_R	Count = 16
!!   316: Token tSTHA_I	Count = 7
!!   317: Token tSTWA_R	Count = 6
!!   318: Token tSTWA_I	Count = 8
!!   319: Token tSTXA_R	Count = 9
!!   320: Token tSTXA_I	Count = 10
!!   321: Token tSTDA_R	Count = 9
!!   322: Token tSTDA_I	Count = 5
!!   323: Token tBA	Count = 3
!!   324: Token tBN	Count = 10
!!   325: Token tBNE	Count = 1
!!   326: Token tBE	Count = 5
!!   327: Token tBG	Count = 6
!!   328: Token tBLE	Count = 8
!!   329: Token tBGE	Count = 4
!!   330: Token tBL	Count = 0
!!   331: Token tBGU	Count = 8
!!   332: Token tBLEU	Count = 3
!!   333: Token tBCC	Count = 3
!!   334: Token tBCS	Count = 2
!!   335: Token tBPOS	Count = 1
!!   336: Token tBNEG	Count = 3
!!   337: Token tBVC	Count = 2
!!   338: Token tBVS	Count = 6
!!   339: Token tBRZ	Count = 3
!!   340: Token tBRLEZ	Count = 5
!!   341: Token tBRLZ	Count = 2
!!   342: Token tBRNZ	Count = 4
!!   343: Token tBRGZ	Count = 6
!!   344: Token tBRGEZ	Count = 5
!!   345: Token tCALL	Count = 2
!!   346: Token tMEMBAR	Count = 42
!!   347: Token tSTBAR	Count = 48
!!   348: Token tCASA_R	Count = 13
!!   349: Token tCASA_I	Count = 11
!!   350: Token tCASXA_R	Count = 9
!!   351: Token tCASXA_I	Count = 10
!!   352: Token tLDSTUBA_I	Count = 9
!!   353: Token tLDSTUB_I	Count = 7
!!   354: Token tLDSTUB_R	Count = 5
!!   355: Token tLDSTUBA_R	Count = 6
!!   356: Token tSWAP_I	Count = 6
!!   357: Token tSWAP_R	Count = 7
!!   358: Token tSWAPA_I	Count = 4
!!   359: Token tSWAPA_R	Count = 4
!!   360: Token tSTF_R	Count = 10
!!   361: Token tSTF_I	Count = 7
!!   362: Token tSTDF_I	Count = 16
!!   363: Token tSTDF_R	Count = 14
!!   364: Token tFADDs	Count = 12
!!   365: Token tFSUBs	Count = 8
!!   366: Token tFMULs	Count = 19
!!   367: Token tFDIVs	Count = 11
!!   368: Token tPREFETCH_I	Count = 17
!!   369: Token tPREFETCH_R	Count = 22
!!   370: Token tPREFETCHA_I	Count = 25
!!   371: Token tPREFETCHA_R	Count = 21
!!   372: Token tFLUSH_I	Count = 44
!!   373: Token tFLUSH_R	Count = 46
!! 
!! 
!! +++ finish +++

