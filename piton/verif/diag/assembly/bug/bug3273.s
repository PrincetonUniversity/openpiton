// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: bug3273.s
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
   random seed:	369842529
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
        setx  0x00000000000003c0, %g1, %r9
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
        setx  0xbd696273fedf6c90, %g1, %r0
        setx  0xe8d6649551e37c84, %g1, %r1
        setx  0xdf6b87e26e0c4b52, %g1, %r2
        setx  0xf94534cceda72cdb, %g1, %r3
        setx  0xeefb77f7480087f3, %g1, %r4
        setx  0x6af854dfe787b70b, %g1, %r5
        setx  0x3a1d531104c18849, %g1, %r6
        setx  0xafd92014bd33e3f9, %g1, %r7
        setx  0xa15e677e1bcb622d, %g1, %r10
        setx  0xb0908cf1d1a66118, %g1, %r11
        setx  0xd5a70f3d83c794de, %g1, %r12
        setx  0xe29780e9e5cc9352, %g1, %r13
        setx  0xe2dc5b976f6546b2, %g1, %r14
        setx  0xdeaffc24314d9a11, %g1, %r15
        setx  0xb9fa2ced4e46c84e, %g1, %r16
        setx  0xbd8d1a98cb40ee2e, %g1, %r17
        setx  0x29a82aac6a6d028d, %g1, %r18
        setx  0x197b284f0827072d, %g1, %r19
        setx  0xdfa762bcf5aeeddb, %g1, %r20
        setx  0x29f146c955dc9fbe, %g1, %r21
        setx  0xb981826708ae5679, %g1, %r22
        setx  0x8b52e292ff7b2ecb, %g1, %r23
        setx  0xba5a1372fe1bf941, %g1, %r24
        setx  0x4444baacb21f3f52, %g1, %r25
        setx  0xaeeb6f1c721d02ea, %g1, %r26
        setx  0x1d5dc1a71a2ff003, %g1, %r27
        setx  0x34c814fdc2c39d7d, %g1, %r28
        setx  0x37e1bed39bb5d22e, %g1, %r29
        setx  0xdc841a7b638542ac, %g1, %r30
        setx  0x68d5da7d985de6fc, %g1, %r31
	.word 0x8c7229c0  ! 1: UDIV_I	udiv 	%r8, 0x09c0, %r6
	.word 0xdc320009  ! 3: STH_R	sth	%r14, [%r8 + %r9]
	.word 0xc4020009  ! 3: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0x12800002  ! 4: BNE	bne  	<label_0x2>
	.word 0x8143c000  ! 5: STBAR	stbar
	.word 0xdf2226fc  ! 6: STF_I	st	%f15, [0x06fc, %r8]
	.word 0xc68a1009  ! 7: LDUBA_R	lduba	[%r8, %r9] 0x80, %r3
	.word 0xdea224f8  ! 8: STWA_I	stwa	%r15, [%r8 + 0x04f8] %asi
	.word 0xe49a2778  ! 9: LDDA_I	ldda	[%r8, + 0x0778] %asi, %r18
	.word 0xd6720009  ! 11: STX_R	stx	%r11, [%r8 + %r9]
	.word 0xcc1a0009  ! 11: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xc4220009  ! 13: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc84a0009  ! 13: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0x84da0009  ! 14: SMULcc_R	smulcc 	%r8, %r9, %r2
	.word 0x00800001  ! 15: BN	bn  	<label_0x1>
	.word 0x884a2900  ! 16: MULX_I	mulx 	%r8, 0x0900, %r4
	.word 0xe09a1009  ! 17: LDDA_R	ldda	[%r8, %r9] 0x80, %r16
	.word 0xc8320009  ! 19: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xca120009  ! 19: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xc6b21009  ! 20: STHA_R	stha	%r3, [%r8 + %r9] 0x80
	.word 0xf8f222f8  ! 21: STXA_I	stxa	%r28, [%r8 + 0x02f8] %asi
	.word 0xcec22d44  ! 22: LDSWA_I	ldswa	[%r8, + 0x0d44] %asi, %r7
	.word 0xebe21009  ! 23: CASA_I	casa	[%r8] 0x80, %r9, %r21
	.word 0xd6da2160  ! 24: LDXA_I	ldxa	[%r8, + 0x0160] %asi, %r11
	.word 0xcac22a18  ! 25: LDSWA_I	ldswa	[%r8, + 0x0a18] %asi, %r5
	.word 0xc36a2050  ! 26: PREFETCH_I	prefetch	[%r8 + 0x0050], #one_read
	.word 0xcb020009  ! 27: LDF_R	ld	[%r8, %r9], %f5
	.word 0xccb22d78  ! 28: STHA_I	stha	%r6, [%r8 + 0x0d78] %asi
	.word 0xc3222554  ! 29: STF_I	st	%f1, [0x0554, %r8]
	.word 0xce922420  ! 30: LDUHA_I	lduha	[%r8, + 0x0420] %asi, %r7
	.word 0xa96a2a70  ! 31: SDIVX_I	sdivx	%r8, 0x0a70, %r20
	.word 0x8143e06d  ! 32: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #MemIssue | #Sync 
	.word 0xceaa2fe4  ! 33: STBA_I	stba	%r7, [%r8 + 0x0fe4] %asi
	.word 0x8c7a2bc4  ! 34: SDIV_I	sdiv 	%r8, 0x0bc4, %r6
	.word 0x87a20929  ! 35: FMULs	fmuls	%f8, %f9, %f3
	.word 0xc3ea24a8  ! 36: PREFETCHA_I	prefetcha	[%r8, + 0x04a8] %asi, #one_read
	.word 0x8143c000  ! 37: STBAR	stbar
	.word 0xc4320009  ! 39: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xe6020009  ! 39: LDUW_R	lduw	[%r8 + %r9], %r19
	.word 0xab220009  ! 40: MULScc_R	mulscc 	%r8, %r9, %r21
	.word 0xc3f21009  ! 41: CASXA_I	casxa	[%r8] 0x80, %r9, %r1
	.word 0xeeea2774  ! 42: LDSTUBA_I	ldstuba	%r23, [%r8 + 0x0774] %asi
	.word 0x9722295c  ! 43: MULScc_I	mulscc 	%r8, 0x095c, %r11
	.word 0x8143e021  ! 44: MEMBAR	membar	#LoadLoad | #MemIssue 
	.word 0x8143c000  ! 45: STBAR	stbar
	.word 0xeefa1009  ! 46: SWAPA_R	swapa	%r23, [%r8 + %r9] 0x80
	.word 0x8fa20929  ! 47: FMULs	fmuls	%f8, %f9, %f7
	.word 0xfd3a2240  ! 48: STDF_I	std	%f30, [0x0240, %r8]
	.word 0xceea2724  ! 49: LDSTUBA_I	ldstuba	%r7, [%r8 + 0x0724] %asi
	.word 0xb46a0009  ! 50: UDIVX_R	udivx 	%r8, %r9, %r26
	.word 0x8da209a9  ! 51: FDIVs	fdivs	%f8, %f9, %f6
	.word 0xc2320009  ! 53: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc44a0009  ! 53: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0x8143c000  ! 54: STBAR	stbar
	.word 0x85a20929  ! 55: FMULs	fmuls	%f8, %f9, %f2
	.word 0xea2a0009  ! 57: STB_R	stb	%r21, [%r8 + %r9]
	.word 0xc25a0009  ! 57: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0x8f6a25ec  ! 58: SDIVX_I	sdivx	%r8, 0x05ec, %r7
	.word 0xc3ea1009  ! 59: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x8ad2267c  ! 60: UMULcc_I	umulcc 	%r8, 0x067c, %r5
	.word 0xc9222514  ! 61: STF_I	st	%f4, [0x0514, %r8]
	.word 0x8143c000  ! 62: STBAR	stbar
	.word 0x8143e033  ! 63: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside | #MemIssue 
	.word 0xca6a0009  ! 64: LDSTUB_R	ldstub	%r5, [%r8 + %r9]
	.word 0xc6ea2310  ! 65: LDSTUBA_I	ldstuba	%r3, [%r8 + 0x0310] %asi
	.word 0x8143e072  ! 66: MEMBAR	membar	#StoreLoad | #Lookaside | #MemIssue | #Sync 
	.word 0xfff22009  ! 67: CASXA_R	casxa	[%r8]%asi, %r9, %r31
	.word 0xa6fa0009  ! 68: SDIVcc_R	sdivcc 	%r8, %r9, %r19
	.word 0xdc720009  ! 70: STX_R	stx	%r14, [%r8 + %r9]
	.word 0xce0a0009  ! 70: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0x826a2208  ! 71: UDIVX_I	udivx 	%r8, 0x0208, %r1
	.word 0x9b6a0009  ! 72: SDIVX_R	sdivx	%r8, %r9, %r13
	.word 0xe48a2ba8  ! 73: LDUBA_I	lduba	[%r8, + 0x0ba8] %asi, %r18
	.word 0xccb22428  ! 74: STHA_I	stha	%r6, [%r8 + 0x0428] %asi
	.word 0xc2aa1009  ! 75: STBA_R	stba	%r1, [%r8 + %r9] 0x80
	.word 0xf4220009  ! 77: STW_R	stw	%r26, [%r8 + %r9]
	.word 0xc41a0009  ! 77: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xc3ea1009  ! 78: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x8143e018  ! 79: MEMBAR	membar	#StoreStore | #Lookaside 
	.word 0xc7222934  ! 80: STF_I	st	%f3, [0x0934, %r8]
	.word 0xaf6a0009  ! 81: SDIVX_R	sdivx	%r8, %r9, %r23
	.word 0xe5020009  ! 82: LDF_R	ld	[%r8, %r9], %f18
	.word 0xc3ea1009  ! 83: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xca2a0009  ! 85: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xe4120009  ! 85: LDUH_R	lduh	[%r8 + %r9], %r18
	.word 0xce0a2b30  ! 86: LDUB_I	ldub	[%r8 + 0x0b30], %r7
	.word 0x86fa2d64  ! 87: SDIVcc_I	sdivcc 	%r8, 0x0d64, %r3
	.word 0xc42a0009  ! 89: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc8520009  ! 89: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xc8a21009  ! 90: STWA_R	stwa	%r4, [%r8 + %r9] 0x80
	.word 0x8143e044  ! 91: MEMBAR	membar	#LoadStore | #Sync 
	.word 0x8143c000  ! 92: STBAR	stbar
	.word 0x20800001  ! 93: BN	bn,a	<label_0x1>
	.word 0xce6a0009  ! 94: LDSTUB_R	ldstub	%r7, [%r8 + %r9]
	.word 0x8fa209a9  ! 95: FDIVs	fdivs	%f8, %f9, %f7
	.word 0xc4821009  ! 96: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r2
	.word 0xe6220009  ! 98: STW_R	stw	%r19, [%r8 + %r9]
	.word 0xc2020009  ! 98: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xccf21009  ! 99: STXA_R	stxa	%r6, [%r8 + %r9] 0x80
	.word 0xcf222a78  ! 100: STF_I	st	%f7, [0x0a78, %r8]
	.word 0xdc2a0009  ! 102: STB_R	stb	%r14, [%r8 + %r9]
	.word 0xee020009  ! 102: LDUW_R	lduw	[%r8 + %r9], %r23
	.word 0xf82a0009  ! 104: STB_R	stb	%r28, [%r8 + %r9]
	.word 0xe2020009  ! 104: LDUW_R	lduw	[%r8 + %r9], %r17
	.word 0xccea1009  ! 105: LDSTUBA_R	ldstuba	%r6, [%r8 + %r9] 0x80
	.word 0xc8da2290  ! 106: LDXA_I	ldxa	[%r8, + 0x0290] %asi, %r4
	.word 0x0aca0001  ! 107: BRNZ	brnz  ,pt	%8,<label_0xa0001>
	.word 0xce220009  ! 109: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc20a0009  ! 109: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xfa6a29ac  ! 110: LDSTUB_I	ldstub	%r29, [%r8 + 0x09ac]
	.word 0xc42a0009  ! 112: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xcb020009  ! 112: LDF_R	ld	[%r8, %r9], %f5
	.word 0xf6720009  ! 114: STX_R	stx	%r27, [%r8 + %r9]
	.word 0xc81a0009  ! 114: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xc0ba1009  ! 115: STDA_R	stda	%r0, [%r8 + %r9] 0x80
	.word 0xc22a0009  ! 117: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc6420009  ! 117: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0x84fa2778  ! 118: SDIVcc_I	sdivcc 	%r8, 0x0778, %r2
	.word 0xc36a22b0  ! 119: PREFETCH_I	prefetch	[%r8 + 0x02b0], #one_read
	.word 0x26800001  ! 120: BL	bl,a	<label_0x1>
	.word 0xedf21009  ! 121: CASXA_I	casxa	[%r8] 0x80, %r9, %r22
	.word 0xca520009  ! 122: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xd6d22c2c  ! 123: LDSHA_I	ldsha	[%r8, + 0x0c2c] %asi, %r11
	.word 0x8143e031  ! 124: MEMBAR	membar	#LoadLoad | #Lookaside | #MemIssue 
	.word 0xcc320009  ! 126: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xd6020009  ! 126: LDUW_R	lduw	[%r8 + %r9], %r11
	.word 0xea320009  ! 128: STH_R	sth	%r21, [%r8 + %r9]
	.word 0xcc120009  ! 128: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xfa5a2a78  ! 129: LDX_I	ldx	[%r8 + 0x0a78], %r29
	.word 0xfcf22448  ! 130: STXA_I	stxa	%r30, [%r8 + 0x0448] %asi
	.word 0xfea22114  ! 131: STWA_I	stwa	%r31, [%r8 + 0x0114] %asi
	.word 0xd86a0009  ! 132: LDSTUB_R	ldstub	%r12, [%r8 + %r9]
	.word 0xf4320009  ! 134: STH_R	sth	%r26, [%r8 + %r9]
	.word 0xca5a0009  ! 134: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0x14800002  ! 135: BG	bg  	<label_0x2>
	.word 0x2ec20001  ! 136: BRGEZ	brgez,a,nt	%8,<label_0x20001>
	.word 0xced21009  ! 137: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r7
	.word 0xc3ea1009  ! 138: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc36a2fc0  ! 139: PREFETCH_I	prefetch	[%r8 + 0x0fc0], #one_read
	.word 0x8a520009  ! 140: UMUL_R	umul 	%r8, %r9, %r5
	.word 0x86d22200  ! 141: UMULcc_I	umulcc 	%r8, 0x0200, %r3
	.word 0xc36a2764  ! 142: PREFETCH_I	prefetch	[%r8 + 0x0764], #one_read
	.word 0xba5a2e64  ! 143: SMUL_I	smul 	%r8, 0x0e64, %r29
	.word 0xe2220009  ! 145: STW_R	stw	%r17, [%r8 + %r9]
	.word 0xc64a0009  ! 145: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0x8c520009  ! 146: UMUL_R	umul 	%r8, %r9, %r6
	.word 0x8e7a2a18  ! 147: SDIV_I	sdiv 	%r8, 0x0a18, %r7
	.word 0xc3ea1009  ! 148: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xe84a28d0  ! 149: LDSB_I	ldsb	[%r8 + 0x08d0], %r20
	.word 0xcb222b64  ! 150: STF_I	st	%f5, [0x0b64, %r8]
	.word 0xc3ea1009  ! 151: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x8143c000  ! 152: STBAR	stbar
	.word 0x10800002  ! 153: BA	ba  	<label_0x2>
	.word 0x2e800001  ! 154: BVS	bvs,a	<label_0x1>
	.word 0x8ba209a9  ! 155: FDIVs	fdivs	%f8, %f9, %f5
	.word 0xec7a0009  ! 156: SWAP_R	swap	%r22, [%r8 + %r9]
	.word 0x8fa209a9  ! 157: FDIVs	fdivs	%f8, %f9, %f7
	.word 0xc2720009  ! 159: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xe8020009  ! 159: LDUW_R	lduw	[%r8 + %r9], %r20
	.word 0xf82a0009  ! 161: STB_R	stb	%r28, [%r8 + %r9]
	.word 0xe5020009  ! 161: LDF_R	ld	[%r8, %r9], %f18
	.word 0x8143c000  ! 162: STBAR	stbar
	.word 0xc2ca1009  ! 163: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r1
	.word 0xe0320009  ! 165: STH_R	sth	%r16, [%r8 + %r9]
	.word 0xe8020009  ! 165: LDUW_R	lduw	[%r8 + %r9], %r20
	.word 0xc3ea2fac  ! 166: PREFETCHA_I	prefetcha	[%r8, + 0x0fac] %asi, #one_read
	.word 0xbe720009  ! 167: UDIV_R	udiv 	%r8, %r9, %r31
	.word 0x82da27d8  ! 168: SMULcc_I	smulcc 	%r8, 0x07d8, %r1
	.word 0x32800001  ! 169: BNE	bne,a	<label_0x1>
	.word 0xf0822fa4  ! 170: LDUWA_I	lduwa	[%r8, + 0x0fa4] %asi, %r24
	.word 0xaaf20009  ! 171: UDIVcc_R	udivcc 	%r8, %r9, %r21
	.word 0xdff22009  ! 172: CASXA_R	casxa	[%r8]%asi, %r9, %r15
	.word 0x8143c000  ! 173: STBAR	stbar
	.word 0x18800001  ! 174: BGU	bgu  	<label_0x1>
	.word 0xd8ea2860  ! 175: LDSTUBA_I	ldstuba	%r12, [%r8 + 0x0860] %asi
	.word 0xc89a2420  ! 176: LDDA_I	ldda	[%r8, + 0x0420] %asi, %r4
	.word 0x8143e043  ! 177: MEMBAR	membar	#LoadLoad | #StoreLoad | #Sync 
	.word 0x85a20829  ! 178: FADDs	fadds	%f8, %f9, %f2
	.word 0xc3ea2460  ! 179: PREFETCHA_I	prefetcha	[%r8, + 0x0460] %asi, #one_read
	.word 0xc82a0009  ! 181: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xe7020009  ! 181: LDF_R	ld	[%r8, %r9], %f19
	.word 0xc8822420  ! 182: LDUWA_I	lduwa	[%r8, + 0x0420] %asi, %r4
	.word 0xc3ea23a0  ! 183: PREFETCHA_I	prefetcha	[%r8, + 0x03a0] %asi, #one_read
	.word 0xc8320009  ! 185: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc7020009  ! 185: LDF_R	ld	[%r8, %r9], %f3
	.word 0x8ba209a9  ! 186: FDIVs	fdivs	%f8, %f9, %f5
	.word 0x8b220009  ! 187: MULScc_R	mulscc 	%r8, %r9, %r5
	.word 0xce921009  ! 188: LDUHA_R	lduha	[%r8, %r9] 0x80, %r7
	.word 0xc42a0009  ! 190: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xec5a0009  ! 190: LDX_R	ldx	[%r8 + %r9], %r22
	.word 0xc80a0009  ! 191: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xce320009  ! 193: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xca120009  ! 193: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xfc2a0009  ! 195: STB_R	stb	%r30, [%r8 + %r9]
	.word 0xc20a0009  ! 195: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xbe520009  ! 196: UMUL_R	umul 	%r8, %r9, %r31
	.word 0x8d222cc0  ! 197: MULScc_I	mulscc 	%r8, 0x0cc0, %r6
	.word 0xf2f21009  ! 198: STXA_R	stxa	%r25, [%r8 + %r9] 0x80
	.word 0xd93a23e8  ! 199: STDF_I	std	%f12, [0x03e8, %r8]
	.word 0x10800001  ! 200: BA	ba  	<label_0x1>
	.word 0xc36a2b30  ! 201: PREFETCH_I	prefetch	[%r8 + 0x0b30], #one_read
	.word 0xe8a229a8  ! 202: STWA_I	stwa	%r20, [%r8 + 0x09a8] %asi
	.word 0xce120009  ! 203: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xcc1a0009  ! 204: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xe2522ac8  ! 205: LDSH_I	ldsh	[%r8 + 0x0ac8], %r17
	.word 0xcc7a2518  ! 206: SWAP_I	swap	%r6, [%r8 + 0x0518]
	.word 0xe82a0009  ! 208: STB_R	stb	%r20, [%r8 + %r9]
	.word 0xee420009  ! 208: LDSW_R	ldsw	[%r8 + %r9], %r23
	.word 0xf8aa24d0  ! 209: STBA_I	stba	%r28, [%r8 + 0x04d0] %asi
	.word 0xc36a2520  ! 210: PREFETCH_I	prefetch	[%r8 + 0x0520], #one_read
	.word 0x8143e061  ! 211: MEMBAR	membar	#LoadLoad | #MemIssue | #Sync 
	.word 0xcd3a0009  ! 213: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc8720009  ! 214: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc44a0009  ! 214: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0x8143c000  ! 215: STBAR	stbar
	.word 0x24c20001  ! 216: BRLEZ	brlez,a,nt	%8,<label_0x20001>
	.word 0xf4522740  ! 217: LDSH_I	ldsh	[%r8 + 0x0740], %r26
	.word 0x8a7a0009  ! 218: SDIV_R	sdiv 	%r8, %r9, %r5
	.word 0xe0ba2a10  ! 219: STDA_I	stda	%r16, [%r8 + 0x0a10] %asi
	.word 0xbc522748  ! 220: UMUL_I	umul 	%r8, 0x0748, %r30
	.word 0x02ca0001  ! 221: BRZ	brz  ,pt	%8,<label_0xa0001>
	.word 0x8a722468  ! 222: UDIV_I	udiv 	%r8, 0x0468, %r5
	.word 0xce8a1009  ! 223: LDUBA_R	lduba	[%r8, %r9] 0x80, %r7
	.word 0xcc6a2f74  ! 224: LDSTUB_I	ldstub	%r6, [%r8 + 0x0f74]
	.word 0xce720009  ! 226: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc2120009  ! 226: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xfea21009  ! 227: STWA_R	stwa	%r31, [%r8 + %r9] 0x80
	.word 0xde220009  ! 229: STW_R	stw	%r15, [%r8 + %r9]
	.word 0xcd1a0009  ! 229: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xca220009  ! 231: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc81a0009  ! 231: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xe46a0009  ! 232: LDSTUB_R	ldstub	%r18, [%r8 + %r9]
	.word 0xea7a0009  ! 233: SWAP_R	swap	%r21, [%r8 + %r9]
	.word 0xdaf22a50  ! 234: STXA_I	stxa	%r13, [%r8 + 0x0a50] %asi
	.word 0x89a20829  ! 235: FADDs	fadds	%f8, %f9, %f4
	.word 0x0aca0001  ! 236: BRNZ	brnz  ,pt	%8,<label_0xa0001>
	.word 0x85220009  ! 237: MULScc_R	mulscc 	%r8, %r9, %r2
	.word 0xc8320009  ! 239: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc91a0009  ! 239: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0x8143e031  ! 240: MEMBAR	membar	#LoadLoad | #Lookaside | #MemIssue 
	.word 0xff3a0009  ! 242: STDF_R	std	%f31, [%r9, %r8]
	.word 0xca720009  ! 243: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xd8120009  ! 243: LDUH_R	lduh	[%r8 + %r9], %r12
	.word 0xa1a209a9  ! 244: FDIVs	fdivs	%f8, %f9, %f16
	.word 0xdc5a0009  ! 245: LDX_R	ldx	[%r8 + %r9], %r14
	.word 0xc3ea1009  ! 246: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc2720009  ! 248: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xfe4a0009  ! 248: LDSB_R	ldsb	[%r8 + %r9], %r31
	.word 0x8143e025  ! 249: MEMBAR	membar	#LoadLoad | #LoadStore | #MemIssue 
	.word 0xa24a0009  ! 250: MULX_R	mulx 	%r8, %r9, %r17
	.word 0xccba1009  ! 251: STDA_R	stda	%r6, [%r8 + %r9] 0x80
	.word 0x84da0009  ! 252: SMULcc_R	smulcc 	%r8, %r9, %r2
	.word 0x8143c000  ! 253: STBAR	stbar
	.word 0xc4720009  ! 255: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xf25a0009  ! 255: LDX_R	ldx	[%r8 + %r9], %r25
	.word 0xf2b21009  ! 256: STHA_R	stha	%r25, [%r8 + %r9] 0x80
	.word 0xe4da2108  ! 257: LDXA_I	ldxa	[%r8, + 0x0108] %asi, %r18
	.word 0xc8ba2950  ! 258: STDA_I	stda	%r4, [%r8 + 0x0950] %asi
	.word 0xc7222634  ! 259: STF_I	st	%f3, [0x0634, %r8]
	.word 0x8a6a0009  ! 260: UDIVX_R	udivx 	%r8, %r9, %r5
	.word 0xc6220009  ! 262: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xce120009  ! 262: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xca921009  ! 263: LDUHA_R	lduha	[%r8, %r9] 0x80, %r5
	.word 0x84fa0009  ! 264: SDIVcc_R	sdivcc 	%r8, %r9, %r2
	.word 0xc2220009  ! 266: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc8520009  ! 266: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xcc220009  ! 268: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc24a0009  ! 268: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xc3ea2be0  ! 269: PREFETCHA_I	prefetcha	[%r8, + 0x0be0] %asi, #one_read
	.word 0xc2220009  ! 271: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xcc4a0009  ! 271: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xc6f22e78  ! 272: STXA_I	stxa	%r3, [%r8 + 0x0e78] %asi
	.word 0xc3ea1009  ! 273: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xce921009  ! 274: LDUHA_R	lduha	[%r8, %r9] 0x80, %r7
	.word 0xd6aa20a4  ! 275: STBA_I	stba	%r11, [%r8 + 0x00a4] %asi
	.word 0x8efa0009  ! 276: SDIVcc_R	sdivcc 	%r8, %r9, %r7
	.word 0xc36a0009  ! 277: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc92223c4  ! 278: STF_I	st	%f4, [0x03c4, %r8]
	.word 0xec9a1009  ! 279: LDDA_R	ldda	[%r8, %r9] 0x80, %r22
	.word 0xcd3a2e18  ! 280: STDF_I	std	%f6, [0x0e18, %r8]
	.word 0x8143c000  ! 281: STBAR	stbar
	.word 0xc36a2d00  ! 282: PREFETCH_I	prefetch	[%r8 + 0x0d00], #one_read
	.word 0xc3ea2f64  ! 283: PREFETCHA_I	prefetcha	[%r8, + 0x0f64] %asi, #one_read
	.word 0xe7222eb0  ! 284: STF_I	st	%f19, [0x0eb0, %r8]
	.word 0xe24225b8  ! 285: LDSW_I	ldsw	[%r8 + 0x05b8], %r17
	.word 0xcc320009  ! 287: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc65a0009  ! 287: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0x8f6a23a4  ! 288: SDIVX_I	sdivx	%r8, 0x03a4, %r7
	.word 0xc2220009  ! 290: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xea120009  ! 290: LDUH_R	lduh	[%r8 + %r9], %r21
	.word 0xcc821009  ! 291: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r6
	.word 0xee4a28b0  ! 292: LDSB_I	ldsb	[%r8 + 0x08b0], %r23
	.word 0xc7220009  ! 294: STF_R	st	%f3, [%r9, %r8]
	.word 0xc6720009  ! 295: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xe4420009  ! 295: LDSW_R	ldsw	[%r8 + %r9], %r18
	.word 0xc66a0009  ! 296: LDSTUB_R	ldstub	%r3, [%r8 + %r9]
	.word 0x865a23c0  ! 297: SMUL_I	smul 	%r8, 0x03c0, %r3
	.word 0xc3ea2894  ! 298: PREFETCHA_I	prefetcha	[%r8, + 0x0894] %asi, #one_read
	.word 0xc36a0009  ! 299: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0x8e6a0009  ! 300: UDIVX_R	udivx 	%r8, %r9, %r7
	.word 0xc0ba2000  ! 301: STDA_I	stda	%r0, [%r8 + 0x0000] %asi
	.word 0x884a0009  ! 302: MULX_R	mulx 	%r8, %r9, %r4
	.word 0xc8320009  ! 304: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc45a0009  ! 304: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xcc720009  ! 306: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xcc020009  ! 306: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xcc2a0009  ! 308: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xe41a0009  ! 308: LDD_R	ldd	[%r8 + %r9], %r18
	.word 0xc3ea1009  ! 309: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xd6c221f4  ! 310: LDSWA_I	ldswa	[%r8, + 0x01f4] %asi, %r11
	.word 0xed2226b8  ! 311: STF_I	st	%f22, [0x06b8, %r8]
	.word 0xc3ea1009  ! 312: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x38800002  ! 313: BGU	bgu,a	<label_0x2>
	.word 0xd4ba1009  ! 314: STDA_R	stda	%r10, [%r8 + %r9] 0x80
	.word 0xc36a2f34  ! 315: PREFETCH_I	prefetch	[%r8 + 0x0f34], #one_read
	.word 0xe8ea1009  ! 316: LDSTUBA_R	ldstuba	%r20, [%r8 + %r9] 0x80
	.word 0xc36a2ad4  ! 317: PREFETCH_I	prefetch	[%r8 + 0x0ad4], #one_read
	.word 0xca220009  ! 319: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc4520009  ! 319: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xf86a274c  ! 320: LDSTUB_I	ldstub	%r28, [%r8 + 0x074c]
	.word 0xc36a0009  ! 321: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0x8143e00b  ! 322: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore 
	.word 0x34800001  ! 323: BG	bg,a	<label_0x1>
	.word 0xf0821009  ! 324: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r24
	.word 0xc36a2324  ! 325: PREFETCH_I	prefetch	[%r8 + 0x0324], #one_read
	.word 0xce4a237c  ! 326: LDSB_I	ldsb	[%r8 + 0x037c], %r7
	.word 0x8143e034  ! 327: MEMBAR	membar	#LoadStore | #Lookaside | #MemIssue 
	.word 0x8ada2274  ! 328: SMULcc_I	smulcc 	%r8, 0x0274, %r5
	.word 0xcc5226bc  ! 329: LDSH_I	ldsh	[%r8 + 0x06bc], %r6
	.word 0xf82a0009  ! 331: STB_R	stb	%r28, [%r8 + %r9]
	.word 0xf2020009  ! 331: LDUW_R	lduw	[%r8 + %r9], %r25
	.word 0xa66a2244  ! 332: UDIVX_I	udivx 	%r8, 0x0244, %r19
	.word 0x02ca0001  ! 333: BRZ	brz  ,pt	%8,<label_0xa0001>
	.word 0xc4220009  ! 335: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xde020009  ! 335: LDUW_R	lduw	[%r8 + %r9], %r15
	.word 0xc85227bc  ! 336: LDSH_I	ldsh	[%r8 + 0x07bc], %r4
	.word 0xca122e50  ! 337: LDUH_I	lduh	[%r8 + 0x0e50], %r5
	.word 0xc7220009  ! 339: STF_R	st	%f3, [%r9, %r8]
	.word 0xcc720009  ! 340: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xfd020009  ! 340: LDF_R	ld	[%r8, %r9], %f30
	.word 0x8da20929  ! 341: FMULs	fmuls	%f8, %f9, %f6
	.word 0xc8ba28e8  ! 342: STDA_I	stda	%r4, [%r8 + 0x08e8] %asi
	.word 0xd88a1009  ! 343: LDUBA_R	lduba	[%r8, %r9] 0x80, %r12
	.word 0xc3ea1009  ! 344: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x26800001  ! 345: BL	bl,a	<label_0x1>
	.word 0xe4220009  ! 347: STW_R	stw	%r18, [%r8 + %r9]
	.word 0xe2520009  ! 347: LDSH_R	ldsh	[%r8 + %r9], %r17
	.word 0xc3ea22e4  ! 348: PREFETCHA_I	prefetcha	[%r8, + 0x02e4] %asi, #one_read
	.word 0xcc720009  ! 350: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xca0a0009  ! 350: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xc8f21009  ! 351: STXA_R	stxa	%r4, [%r8 + %r9] 0x80
	.word 0x8143e03d  ! 352: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0x2cca0001  ! 353: BRGZ	brgz,a,pt	%8,<label_0xa0001>
	.word 0xc3ea1009  ! 354: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xccba2d50  ! 355: STDA_I	stda	%r6, [%r8 + 0x0d50] %asi
	.word 0xcbe22009  ! 356: CASA_R	casa	[%r8] %asi, %r9, %r5
	.word 0x876a2ed0  ! 357: SDIVX_I	sdivx	%r8, 0x0ed0, %r3
	.word 0x8cfa289c  ! 358: SDIVcc_I	sdivcc 	%r8, 0x089c, %r6
	.word 0x8143c000  ! 359: STBAR	stbar
	.word 0xc322247c  ! 360: STF_I	st	%f1, [0x047c, %r8]
	.word 0xcaf21009  ! 361: STXA_R	stxa	%r5, [%r8 + %r9] 0x80
	.word 0xf2022474  ! 362: LDUW_I	lduw	[%r8 + 0x0474], %r25
	.word 0xc7f22009  ! 363: CASXA_R	casxa	[%r8]%asi, %r9, %r3
	.word 0xb4f20009  ! 364: UDIVcc_R	udivcc 	%r8, %r9, %r26
	.word 0xf0a22f00  ! 365: STWA_I	stwa	%r24, [%r8 + 0x0f00] %asi
	.word 0x8143c000  ! 366: STBAR	stbar
	.word 0x8c5a0009  ! 367: SMUL_R	smul 	%r8, %r9, %r6
	.word 0xe4020009  ! 368: LDUW_R	lduw	[%r8 + %r9], %r18
	.word 0xc4da2c68  ! 369: LDXA_I	ldxa	[%r8, + 0x0c68] %asi, %r2
	.word 0x8cf20009  ! 370: UDIVcc_R	udivcc 	%r8, %r9, %r6
	.word 0x3e800001  ! 371: BVC	bvc,a	<label_0x1>
	.word 0xce6a0009  ! 372: LDSTUB_R	ldstub	%r7, [%r8 + %r9]
	.word 0xc3ea2560  ! 373: PREFETCHA_I	prefetcha	[%r8, + 0x0560] %asi, #one_read
	.word 0x87220009  ! 374: MULScc_R	mulscc 	%r8, %r9, %r3
	.word 0xc3ea2ba0  ! 375: PREFETCHA_I	prefetcha	[%r8, + 0x0ba0] %asi, #one_read
	.word 0xca2a0009  ! 377: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xda4a0009  ! 377: LDSB_R	ldsb	[%r8 + %r9], %r13
	.word 0xc47a2868  ! 378: SWAP_I	swap	%r2, [%r8 + 0x0868]
	.word 0xc8522128  ! 379: LDSH_I	ldsh	[%r8 + 0x0128], %r4
	.word 0xc6720009  ! 381: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc8120009  ! 381: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xcc6a0009  ! 382: LDSTUB_R	ldstub	%r6, [%r8 + %r9]
	.word 0xc8522b70  ! 383: LDSH_I	ldsh	[%r8 + 0x0b70], %r4
	.word 0x14800002  ! 384: BG	bg  	<label_0x2>
	.word 0xc8ba1009  ! 385: STDA_R	stda	%r4, [%r8 + %r9] 0x80
	.word 0x884a2004  ! 386: MULX_I	mulx 	%r8, 0x0004, %r4
	.word 0xee2a0009  ! 388: STB_R	stb	%r23, [%r8 + %r9]
	.word 0xfc4a0009  ! 388: LDSB_R	ldsb	[%r8 + %r9], %r30
	.word 0xfc1a2ad0  ! 389: LDD_I	ldd	[%r8 + 0x0ad0], %r30
	.word 0xc3ea1009  ! 390: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc2822014  ! 391: LDUWA_I	lduwa	[%r8, + 0x0014] %asi, %r1
	.word 0xc2922d54  ! 392: LDUHA_I	lduha	[%r8, + 0x0d54] %asi, %r1
	.word 0x3a800001  ! 393: BCC	bcc,a	<label_0x1>
	.word 0xc6320009  ! 395: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xcc120009  ! 395: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0x84da0009  ! 396: SMULcc_R	smulcc 	%r8, %r9, %r2
	.word 0xd8fa2f8c  ! 397: SWAPA_I	swapa	%r12, [%r8 + 0x0f8c] %asi
	.word 0x8e4a0009  ! 398: MULX_R	mulx 	%r8, %r9, %r7
	.word 0xc67a27a0  ! 399: SWAP_I	swap	%r3, [%r8 + 0x07a0]
	.word 0xc22a0009  ! 401: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xeb020009  ! 401: LDF_R	ld	[%r8, %r9], %f21
	.word 0x36800001  ! 402: BGE	bge,a	<label_0x1>
	.word 0xcef222f0  ! 403: STXA_I	stxa	%r7, [%r8 + 0x02f0] %asi
	.word 0xccba2be8  ! 404: STDA_I	stda	%r6, [%r8 + 0x0be8] %asi
	.word 0x8e4a2af0  ! 405: MULX_I	mulx 	%r8, 0x0af0, %r7
	.word 0xd65a0009  ! 406: LDX_R	ldx	[%r8 + %r9], %r11
	.word 0xc6822130  ! 407: LDUWA_I	lduwa	[%r8, + 0x0130] %asi, %r3
	.word 0xc3ea1009  ! 408: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x892228d8  ! 409: MULScc_I	mulscc 	%r8, 0x08d8, %r4
	.word 0x85a20929  ! 410: FMULs	fmuls	%f8, %f9, %f2
	.word 0x8a7a2710  ! 411: SDIV_I	sdiv 	%r8, 0x0710, %r5
	.word 0x24800001  ! 412: BLE	ble,a	<label_0x1>
	.word 0x84d22748  ! 413: UMULcc_I	umulcc 	%r8, 0x0748, %r2
	.word 0xce7a0009  ! 414: SWAP_R	swap	%r7, [%r8 + %r9]
	.word 0x0a800001  ! 415: BCS	bcs  	<label_0x1>
	.word 0xed2225b4  ! 416: STF_I	st	%f22, [0x05b4, %r8]
	.word 0xca720009  ! 418: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xec0a0009  ! 418: LDUB_R	ldub	[%r8 + %r9], %r22
	.word 0xec220009  ! 420: STW_R	stw	%r22, [%r8 + %r9]
	.word 0xce520009  ! 420: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xc62a0009  ! 422: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xf64a0009  ! 422: LDSB_R	ldsb	[%r8 + %r9], %r27
	.word 0xac7223f0  ! 423: UDIV_I	udiv 	%r8, 0x03f0, %r22
	.word 0xcb3a2948  ! 424: STDF_I	std	%f5, [0x0948, %r8]
	.word 0x8143c000  ! 425: STBAR	stbar
	.word 0xa46a2f28  ! 426: UDIVX_I	udivx 	%r8, 0x0f28, %r18
	.word 0xc2d21009  ! 427: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r1
	.word 0xc4ba2f50  ! 428: STDA_I	stda	%r2, [%r8 + 0x0f50] %asi
	.word 0x22800001  ! 429: BE	be,a	<label_0x1>
	.word 0x22ca0001  ! 430: BRZ	brz,a,pt	%8,<label_0xa0001>
	.word 0x8a5a0009  ! 431: SMUL_R	smul 	%r8, %r9, %r5
	.word 0xc82a0009  ! 433: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc01a0009  ! 433: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0x2cc20001  ! 434: BRGZ	brgz,a,nt	%8,<label_0x20001>
	.word 0x3c800002  ! 435: BPOS	bpos,a	<label_0x2>
	.word 0xe53a28f0  ! 436: STDF_I	std	%f18, [0x08f0, %r8]
	.word 0xc36a0009  ! 437: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc84a27c8  ! 438: LDSB_I	ldsb	[%r8 + 0x07c8], %r4
	.word 0x82d20009  ! 439: UMULcc_R	umulcc 	%r8, %r9, %r1
	.word 0x8143e055  ! 440: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside | #Sync 
	.word 0xc8220009  ! 442: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc9020009  ! 442: LDF_R	ld	[%r8, %r9], %f4
	.word 0xda821009  ! 443: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r13
	.word 0xc93a0009  ! 445: STDF_R	std	%f4, [%r9, %r8]
	.word 0xca720009  ! 446: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc60a0009  ! 446: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xc86a2728  ! 447: LDSTUB_I	ldstub	%r4, [%r8 + 0x0728]
	.word 0xc72220c0  ! 448: STF_I	st	%f3, [0x00c0, %r8]
	.word 0xcf1a0009  ! 449: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xca220009  ! 451: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc31a0009  ! 451: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xc40a2a08  ! 452: LDUB_I	ldub	[%r8 + 0x0a08], %r2
	.word 0xc8aa2894  ! 453: STBA_I	stba	%r4, [%r8 + 0x0894] %asi
	.word 0xc6822494  ! 454: LDUWA_I	lduwa	[%r8, + 0x0494] %asi, %r3
	.word 0x8a520009  ! 455: UMUL_R	umul 	%r8, %r9, %r5
	.word 0xe4fa2388  ! 456: SWAPA_I	swapa	%r18, [%r8 + 0x0388] %asi
	.word 0x8143e05b  ! 457: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Lookaside | #Sync 
	.word 0x02800002  ! 458: BE	be  	<label_0x2>
	.word 0xc93a2300  ! 459: STDF_I	std	%f4, [0x0300, %r8]
	.word 0xc36a0009  ! 460: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc85a0009  ! 461: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0x8143c000  ! 462: STBAR	stbar
	.word 0xca4a2188  ! 463: LDSB_I	ldsb	[%r8 + 0x0188], %r5
	.word 0xc6420009  ! 464: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0x87a208a9  ! 465: FSUBs	fsubs	%f8, %f9, %f3
	.word 0xc3ea2d7c  ! 466: PREFETCHA_I	prefetcha	[%r8, + 0x0d7c] %asi, #one_read
	.word 0xc36a26f4  ! 467: PREFETCH_I	prefetch	[%r8 + 0x06f4], #one_read
	.word 0x845a0009  ! 468: SMUL_R	smul 	%r8, %r9, %r2
	.word 0xc2da22d8  ! 469: LDXA_I	ldxa	[%r8, + 0x02d8] %asi, %r1
	.word 0xfab21009  ! 470: STHA_R	stha	%r29, [%r8 + %r9] 0x80
	.word 0xc3ea2c9c  ! 471: PREFETCHA_I	prefetcha	[%r8, + 0x0c9c] %asi, #one_read
	.word 0xc4220009  ! 473: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xe9020009  ! 473: LDF_R	ld	[%r8, %r9], %f20
	.word 0xc6ea262c  ! 474: LDSTUBA_I	ldstuba	%r3, [%r8 + 0x062c] %asi
	.word 0x8143c000  ! 475: STBAR	stbar
	.word 0x8143c000  ! 476: STBAR	stbar
	.word 0x8143e045  ! 477: MEMBAR	membar	#LoadLoad | #LoadStore | #Sync 
	.word 0x84fa0009  ! 478: SDIVcc_R	sdivcc 	%r8, %r9, %r2
	.word 0xc3ea1009  ! 479: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc87a0009  ! 480: SWAP_R	swap	%r4, [%r8 + %r9]
	.word 0xe7220009  ! 482: STF_R	st	%f19, [%r9, %r8]
	.word 0xd6720009  ! 483: STX_R	stx	%r11, [%r8 + %r9]
	.word 0xc5020009  ! 483: LDF_R	ld	[%r8, %r9], %f2
	.word 0xc6320009  ! 485: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xe8020009  ! 485: LDUW_R	lduw	[%r8 + %r9], %r20
	.word 0xec220009  ! 487: STW_R	stw	%r22, [%r8 + %r9]
	.word 0xce520009  ! 487: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xcc1a0009  ! 488: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xcec21009  ! 489: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r7
	.word 0x8ed20009  ! 490: UMULcc_R	umulcc 	%r8, %r9, %r7
	.word 0xea320009  ! 492: STH_R	sth	%r21, [%r8 + %r9]
	.word 0xf81a0009  ! 492: LDD_R	ldd	[%r8 + %r9], %r28
	.word 0xfc6a0009  ! 493: LDSTUB_R	ldstub	%r30, [%r8 + %r9]
	.word 0xc8a21009  ! 494: STWA_R	stwa	%r4, [%r8 + %r9] 0x80
	.word 0xc8c21009  ! 495: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r4
	.word 0xe2822694  ! 496: LDUWA_I	lduwa	[%r8, + 0x0694] %asi, %r17
	.word 0x9eda0009  ! 497: SMULcc_R	smulcc 	%r8, %r9, %r15
	.word 0xc87a0009  ! 498: SWAP_R	swap	%r4, [%r8 + %r9]
	.word 0xc2aa25c8  ! 499: STBA_I	stba	%r1, [%r8 + 0x05c8] %asi
	.word 0xecea1009  ! 500: LDSTUBA_R	ldstuba	%r22, [%r8 + %r9] 0x80
	.word 0xe53a20a0  ! 501: STDF_I	std	%f18, [0x00a0, %r8]
	.word 0xc8420009  ! 502: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xcaf22fc0  ! 503: STXA_I	stxa	%r5, [%r8 + 0x0fc0] %asi
	.word 0x844a2f18  ! 504: MULX_I	mulx 	%r8, 0x0f18, %r2
	.word 0xcc7a2d7c  ! 505: SWAP_I	swap	%r6, [%r8 + 0x0d7c]
	.word 0xf1220009  ! 507: STF_R	st	%f24, [%r9, %r8]
	.word 0xe4720009  ! 508: STX_R	stx	%r18, [%r8 + %r9]
	.word 0xcc120009  ! 508: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0x2ec20001  ! 509: BRGEZ	brgez,a,nt	%8,<label_0x20001>
	.word 0x84520009  ! 510: UMUL_R	umul 	%r8, %r9, %r2
	.word 0xce320009  ! 512: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xe41a0009  ! 512: LDD_R	ldd	[%r8 + %r9], %r18
	.word 0xcf3a0009  ! 514: STDF_R	std	%f7, [%r9, %r8]
	.word 0xf2720009  ! 515: STX_R	stx	%r25, [%r8 + %r9]
	.word 0xcb020009  ! 515: LDF_R	ld	[%r8, %r9], %f5
	.word 0xccaa2064  ! 516: STBA_I	stba	%r6, [%r8 + 0x0064] %asi
	.word 0xce822ad0  ! 517: LDUWA_I	lduwa	[%r8, + 0x0ad0] %asi, %r7
	.word 0xc36a2514  ! 518: PREFETCH_I	prefetch	[%r8 + 0x0514], #one_read
	.word 0x84d223d4  ! 519: UMULcc_I	umulcc 	%r8, 0x03d4, %r2
	.word 0xc4fa25d4  ! 520: SWAPA_I	swapa	%r2, [%r8 + 0x05d4] %asi
	.word 0xcc1a0009  ! 521: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xe1e22009  ! 522: CASA_R	casa	[%r8] %asi, %r9, %r16
	.word 0x8143c000  ! 523: STBAR	stbar
	.word 0xc2320009  ! 525: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xf40a0009  ! 525: LDUB_R	ldub	[%r8 + %r9], %r26
	.word 0xccaa208c  ! 526: STBA_I	stba	%r6, [%r8 + 0x008c] %asi
	.word 0xe01a2d78  ! 527: LDD_I	ldd	[%r8 + 0x0d78], %r16
	.word 0xc8821009  ! 528: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r4
	.word 0x8f6a2eec  ! 529: SDIVX_I	sdivx	%r8, 0x0eec, %r7
	.word 0xca320009  ! 531: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xca5a0009  ! 531: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xc51a0009  ! 532: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xc85a2bf0  ! 533: LDX_I	ldx	[%r8 + 0x0bf0], %r4
	.word 0xb2720009  ! 534: UDIV_R	udiv 	%r8, %r9, %r25
	.word 0xf8220009  ! 536: STW_R	stw	%r28, [%r8 + %r9]
	.word 0xca420009  ! 536: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0x8143c000  ! 537: STBAR	stbar
	.word 0xec220009  ! 539: STW_R	stw	%r22, [%r8 + %r9]
	.word 0xd8420009  ! 539: LDSW_R	ldsw	[%r8 + %r9], %r12
	.word 0xc22a0009  ! 541: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xca420009  ! 541: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xcff22009  ! 542: CASXA_R	casxa	[%r8]%asi, %r9, %r7
	.word 0x8143e03f  ! 543: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0xa12226bc  ! 544: MULScc_I	mulscc 	%r8, 0x06bc, %r16
	.word 0x8ba208a9  ! 545: FSUBs	fsubs	%f8, %f9, %f5
	.word 0xc3ea2124  ! 546: PREFETCHA_I	prefetcha	[%r8, + 0x0124] %asi, #one_read
	.word 0xc3ea1009  ! 547: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc36a2684  ! 548: PREFETCH_I	prefetch	[%r8 + 0x0684], #one_read
	.word 0xc4120009  ! 549: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0x8143e029  ! 550: MEMBAR	membar	#LoadLoad | #StoreStore | #MemIssue 
	.word 0xcc822f04  ! 551: LDUWA_I	lduwa	[%r8, + 0x0f04] %asi, %r6
	.word 0xf9f21009  ! 552: CASXA_I	casxa	[%r8] 0x80, %r9, %r28
	.word 0x40000002  ! 553: CALL	call	disp30_2
	.word 0xea220009  ! 555: STW_R	stw	%r21, [%r8 + %r9]
	.word 0xf40a0009  ! 555: LDUB_R	ldub	[%r8 + %r9], %r26
	.word 0xccc22890  ! 556: LDSWA_I	ldswa	[%r8, + 0x0890] %asi, %r6
	.word 0xc36a2ee0  ! 557: PREFETCH_I	prefetch	[%r8 + 0x0ee0], #one_read
	.word 0xf6720009  ! 559: STX_R	stx	%r27, [%r8 + %r9]
	.word 0xcc420009  ! 559: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xfd3a2e60  ! 560: STDF_I	std	%f30, [0x0e60, %r8]
	.word 0x8143e052  ! 561: MEMBAR	membar	#StoreLoad | #Lookaside | #Sync 
	.word 0x82fa0009  ! 562: SDIVcc_R	sdivcc 	%r8, %r9, %r1
	.word 0x84522418  ! 563: UMUL_I	umul 	%r8, 0x0418, %r2
	.word 0xcc220009  ! 565: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xcc1a0009  ! 565: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xaba20829  ! 566: FADDs	fadds	%f8, %f9, %f21
	.word 0xc3e22009  ! 567: CASA_R	casa	[%r8] %asi, %r9, %r1
	.word 0xf2220009  ! 569: STW_R	stw	%r25, [%r8 + %r9]
	.word 0xc4020009  ! 569: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xc6220009  ! 571: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xce420009  ! 571: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xc3222680  ! 572: STF_I	st	%f1, [0x0680, %r8]
	.word 0xc3ea1009  ! 573: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xee220009  ! 575: STW_R	stw	%r23, [%r8 + %r9]
	.word 0xc6420009  ! 575: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xc36a2830  ! 576: PREFETCH_I	prefetch	[%r8 + 0x0830], #one_read
	.word 0x825a0009  ! 577: SMUL_R	smul 	%r8, %r9, %r1
	.word 0xc6a21009  ! 578: STWA_R	stwa	%r3, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 579: STBAR	stbar
	.word 0xcb222cd8  ! 580: STF_I	st	%f5, [0x0cd8, %r8]
	.word 0x24c20001  ! 581: BRLEZ	brlez,a,nt	%8,<label_0x20001>
	.word 0xcdf22009  ! 582: CASXA_R	casxa	[%r8]%asi, %r9, %r6
	.word 0xcc2a0009  ! 584: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc44a0009  ! 584: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xc3ea1009  ! 585: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x12800001  ! 586: BNE	bne  	<label_0x1>
	.word 0xc2120009  ! 587: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xcc320009  ! 589: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc2520009  ! 589: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xc26a0009  ! 590: LDSTUB_R	ldstub	%r1, [%r8 + %r9]
	.word 0xee6a0009  ! 591: LDSTUB_R	ldstub	%r23, [%r8 + %r9]
	.word 0x84f20009  ! 592: UDIVcc_R	udivcc 	%r8, %r9, %r2
	.word 0xc68a2700  ! 593: LDUBA_I	lduba	[%r8, + 0x0700] %asi, %r3
	.word 0xc6822c00  ! 594: LDUWA_I	lduwa	[%r8, + 0x0c00] %asi, %r3
	.word 0x8f222844  ! 595: MULScc_I	mulscc 	%r8, 0x0844, %r7
	.word 0x8143e078  ! 596: MEMBAR	membar	#StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xc4422b20  ! 597: LDSW_I	ldsw	[%r8 + 0x0b20], %r2
	.word 0xa3a20829  ! 598: FADDs	fadds	%f8, %f9, %f17
	.word 0xe1f22009  ! 599: CASXA_R	casxa	[%r8]%asi, %r9, %r16
	.word 0x8ba20829  ! 600: FADDs	fadds	%f8, %f9, %f5
	.word 0xc0ba1009  ! 601: STDA_R	stda	%r0, [%r8 + %r9] 0x80
	.word 0x0aca0001  ! 602: BRNZ	brnz  ,pt	%8,<label_0xa0001>
	.word 0xc6c2294c  ! 603: LDSWA_I	ldswa	[%r8, + 0x094c] %asi, %r3
	.word 0x8e520009  ! 604: UMUL_R	umul 	%r8, %r9, %r7
	.word 0x8143e006  ! 605: MEMBAR	membar	#StoreLoad | #LoadStore 
	.word 0xc48a2030  ! 606: LDUBA_I	lduba	[%r8, + 0x0030] %asi, %r2
	.word 0xc36a0009  ! 607: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xd9f22009  ! 608: CASXA_R	casxa	[%r8]%asi, %r9, %r12
	.word 0x8143e015  ! 609: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside 
	.word 0xc3ea259c  ! 610: PREFETCHA_I	prefetcha	[%r8, + 0x059c] %asi, #one_read
	.word 0xc36a2ff8  ! 611: PREFETCH_I	prefetch	[%r8 + 0x0ff8], #one_read
	.word 0xa47a2f64  ! 612: SDIV_I	sdiv 	%r8, 0x0f64, %r18
	.word 0xc6220009  ! 614: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xd85a0009  ! 614: LDX_R	ldx	[%r8 + %r9], %r12
	.word 0xc6a21009  ! 615: STWA_R	stwa	%r3, [%r8 + %r9] 0x80
	.word 0xcaa2235c  ! 616: STWA_I	stwa	%r5, [%r8 + 0x035c] %asi
	.word 0xc36a2f44  ! 617: PREFETCH_I	prefetch	[%r8 + 0x0f44], #one_read
	.word 0x8143c000  ! 618: STBAR	stbar
	.word 0xcefa1009  ! 619: SWAPA_R	swapa	%r7, [%r8 + %r9] 0x80
	.word 0xc3ea1009  ! 620: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x89220009  ! 621: MULScc_R	mulscc 	%r8, %r9, %r4
	.word 0xf6220009  ! 623: STW_R	stw	%r27, [%r8 + %r9]
	.word 0xca5a0009  ! 623: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xc66a225c  ! 624: LDSTUB_I	ldstub	%r3, [%r8 + 0x025c]
	.word 0xc3220009  ! 626: STF_R	st	%f1, [%r9, %r8]
	.word 0xfc720009  ! 627: STX_R	stx	%r30, [%r8 + %r9]
	.word 0xc6520009  ! 627: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0x86520009  ! 628: UMUL_R	umul 	%r8, %r9, %r3
	.word 0xc3ea2748  ! 629: PREFETCHA_I	prefetcha	[%r8, + 0x0748] %asi, #one_read
	.word 0x8cfa269c  ! 630: SDIVcc_I	sdivcc 	%r8, 0x069c, %r6
	.word 0xc2c21009  ! 631: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r1
	.word 0x896a27ac  ! 632: SDIVX_I	sdivx	%r8, 0x07ac, %r4
	.word 0xdb3a2070  ! 633: STDF_I	std	%f13, [0x0070, %r8]
	.word 0xc82a0009  ! 635: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xee420009  ! 635: LDSW_R	ldsw	[%r8 + %r9], %r23
	.word 0xe9222a50  ! 636: STF_I	st	%f20, [0x0a50, %r8]
	.word 0xc2922c50  ! 637: LDUHA_I	lduha	[%r8, + 0x0c50] %asi, %r1
	.word 0xccf21009  ! 638: STXA_R	stxa	%r6, [%r8 + %r9] 0x80
	.word 0xc3ea1009  ! 639: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc8ea2050  ! 640: LDSTUBA_I	ldstuba	%r4, [%r8 + 0x0050] %asi
	.word 0x88722c58  ! 641: UDIV_I	udiv 	%r8, 0x0c58, %r4
	.word 0xc4c22a00  ! 642: LDSWA_I	ldswa	[%r8, + 0x0a00] %asi, %r2
	.word 0xc36a2ffc  ! 643: PREFETCH_I	prefetch	[%r8 + 0x0ffc], #one_read
	.word 0xbcd22e28  ! 644: UMULcc_I	umulcc 	%r8, 0x0e28, %r30
	.word 0x83220009  ! 645: MULScc_R	mulscc 	%r8, %r9, %r1
	.word 0x38800001  ! 646: BGU	bgu,a	<label_0x1>
	.word 0xe33a0009  ! 648: STDF_R	std	%f17, [%r9, %r8]
	.word 0xcc720009  ! 649: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc01a0009  ! 649: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0xa16a2c9c  ! 650: SDIVX_I	sdivx	%r8, 0x0c9c, %r16
	.word 0x8e520009  ! 651: UMUL_R	umul 	%r8, %r9, %r7
	.word 0x82720009  ! 652: UDIV_R	udiv 	%r8, %r9, %r1
	.word 0x20800002  ! 653: BN	bn,a	<label_0x2>
	.word 0xce6a0009  ! 654: LDSTUB_R	ldstub	%r7, [%r8 + %r9]
	.word 0xc73a2d88  ! 655: STDF_I	std	%f3, [0x0d88, %r8]
	.word 0xcc220009  ! 657: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xdc120009  ! 657: LDUH_R	lduh	[%r8 + %r9], %r14
	.word 0x12800001  ! 658: BNE	bne  	<label_0x1>
	.word 0x864a0009  ! 659: MULX_R	mulx 	%r8, %r9, %r3
	.word 0xf0ba1009  ! 660: STDA_R	stda	%r24, [%r8 + %r9] 0x80
	.word 0xcc2a0009  ! 662: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xcf020009  ! 662: LDF_R	ld	[%r8, %r9], %f7
	.word 0xc9220009  ! 664: STF_R	st	%f4, [%r9, %r8]
	.word 0xc4720009  ! 665: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc84a0009  ! 665: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xb0720009  ! 666: UDIV_R	udiv 	%r8, %r9, %r24
	.word 0xb8d228dc  ! 667: UMULcc_I	umulcc 	%r8, 0x08dc, %r28
	.word 0xe7e22009  ! 668: CASA_R	casa	[%r8] %asi, %r9, %r19
	.word 0xc82a0009  ! 670: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc81a0009  ! 670: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x88720009  ! 671: UDIV_R	udiv 	%r8, %r9, %r4
	.word 0x2cca0001  ! 672: BRGZ	brgz,a,pt	%8,<label_0xa0001>
	.word 0xce2a0009  ! 674: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xf5020009  ! 674: LDF_R	ld	[%r8, %r9], %f26
	.word 0xc01a2490  ! 675: LDD_I	ldd	[%r8 + 0x0490], %r0
	.word 0xc36a0009  ! 676: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xe9022a68  ! 677: LDF_I	ld	[%r8, 0x0a68], %f20
	.word 0x28800001  ! 678: BLEU	bleu,a	<label_0x1>
	.word 0xf4ba2d60  ! 679: STDA_I	stda	%r26, [%r8 + 0x0d60] %asi
	.word 0x884a25e0  ! 680: MULX_I	mulx 	%r8, 0x05e0, %r4
	.word 0x8143e075  ! 681: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside | #MemIssue | #Sync 
	.word 0x83a20829  ! 682: FADDs	fadds	%f8, %f9, %f1
	.word 0xc67a2c24  ! 683: SWAP_I	swap	%r3, [%r8 + 0x0c24]
	.word 0x02ca0001  ! 684: BRZ	brz  ,pt	%8,<label_0xa0001>
	.word 0xaa7a0009  ! 685: SDIV_R	sdiv 	%r8, %r9, %r21
	.word 0xdec21009  ! 686: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r15
	.word 0xcb3a0009  ! 688: STDF_R	std	%f5, [%r9, %r8]
	.word 0xda720009  ! 689: STX_R	stx	%r13, [%r8 + %r9]
	.word 0xc31a0009  ! 689: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xe2720009  ! 691: STX_R	stx	%r17, [%r8 + %r9]
	.word 0xfc4a0009  ! 691: LDSB_R	ldsb	[%r8 + %r9], %r30
	.word 0xceb22d44  ! 692: STHA_I	stha	%r7, [%r8 + 0x0d44] %asi
	.word 0xce921009  ! 693: LDUHA_R	lduha	[%r8, %r9] 0x80, %r7
	.word 0x88da2a0c  ! 694: SMULcc_I	smulcc 	%r8, 0x0a0c, %r4
	.word 0x8143e067  ! 695: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #MemIssue | #Sync 
	.word 0x85a20829  ! 696: FADDs	fadds	%f8, %f9, %f2
	.word 0xc2ea22ac  ! 697: LDSTUBA_I	ldstuba	%r1, [%r8 + 0x02ac] %asi
	.word 0x866a2998  ! 698: UDIVX_I	udivx 	%r8, 0x0998, %r3
	.word 0xca220009  ! 700: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xec1a0009  ! 700: LDD_R	ldd	[%r8 + %r9], %r22
	.word 0xc3ea1009  ! 701: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xd8520009  ! 702: LDSH_R	ldsh	[%r8 + %r9], %r12
	.word 0x0a800002  ! 703: BCS	bcs  	<label_0x2>
	.word 0x8143c000  ! 704: STBAR	stbar
	.word 0xcaa22af4  ! 705: STWA_I	stwa	%r5, [%r8 + 0x0af4] %asi
	.word 0x2eca0001  ! 706: BRGEZ	brgez,a,pt	%8,<label_0xa0001>
	.word 0xca320009  ! 708: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xe4520009  ! 708: LDSH_R	ldsh	[%r8 + %r9], %r18
	.word 0xcb222e40  ! 709: STF_I	st	%f5, [0x0e40, %r8]
	.word 0x8cf229c0  ! 710: UDIVcc_I	udivcc 	%r8, 0x09c0, %r6
	.word 0xccfa2de0  ! 711: SWAPA_I	swapa	%r6, [%r8 + 0x0de0] %asi
	.word 0xb0fa2a10  ! 712: SDIVcc_I	sdivcc 	%r8, 0x0a10, %r24
	.word 0x9f220009  ! 713: MULScc_R	mulscc 	%r8, %r9, %r15
	.word 0x8143c000  ! 714: STBAR	stbar
	.word 0x8143c000  ! 715: STBAR	stbar
	.word 0x22800001  ! 716: BE	be,a	<label_0x1>
	.word 0xdd3a2230  ! 717: STDF_I	std	%f14, [0x0230, %r8]
	.word 0x8fa208a9  ! 718: FSUBs	fsubs	%f8, %f9, %f7
	.word 0x06800002  ! 719: BL	bl  	<label_0x2>
	.word 0x26ca0001  ! 720: BRLZ	brlz,a,pt	%8,<label_0xa0001>
	.word 0xc88a1009  ! 721: LDUBA_R	lduba	[%r8, %r9] 0x80, %r4
	.word 0xf6ca1009  ! 722: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r27
	.word 0xe5e22009  ! 723: CASA_R	casa	[%r8] %asi, %r9, %r18
	.word 0xca6a23b8  ! 724: LDSTUB_I	ldstub	%r5, [%r8 + 0x03b8]
	.word 0xde2a0009  ! 726: STB_R	stb	%r15, [%r8 + %r9]
	.word 0xcb1a0009  ! 726: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xdd222304  ! 727: STF_I	st	%f14, [0x0304, %r8]
	.word 0xf4ea1009  ! 728: LDSTUBA_R	ldstuba	%r26, [%r8 + %r9] 0x80
	.word 0xc3ea2b74  ! 729: PREFETCHA_I	prefetcha	[%r8, + 0x0b74] %asi, #one_read
	.word 0x8143c000  ! 730: STBAR	stbar
	.word 0xbcd225fc  ! 731: UMULcc_I	umulcc 	%r8, 0x05fc, %r30
	.word 0xfa522c8c  ! 732: LDSH_I	ldsh	[%r8 + 0x0c8c], %r29
	.word 0x8143e063  ! 733: MEMBAR	membar	#LoadLoad | #StoreLoad | #MemIssue | #Sync 
	.word 0x856a0009  ! 734: SDIVX_R	sdivx	%r8, %r9, %r2
	.word 0xf3220009  ! 736: STF_R	st	%f25, [%r9, %r8]
	.word 0xe0720009  ! 737: STX_R	stx	%r16, [%r8 + %r9]
	.word 0xcc0a0009  ! 737: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xc8220009  ! 739: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc60a0009  ! 739: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0x2e800002  ! 740: BVS	bvs,a	<label_0x2>
	.word 0x8cda2500  ! 741: SMULcc_I	smulcc 	%r8, 0x0500, %r6
	.word 0xc3220009  ! 743: STF_R	st	%f1, [%r9, %r8]
	.word 0xc4720009  ! 744: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xd6020009  ! 744: LDUW_R	lduw	[%r8 + %r9], %r11
	.word 0xc67a270c  ! 745: SWAP_I	swap	%r3, [%r8 + 0x070c]
	.word 0x86520009  ! 746: UMUL_R	umul 	%r8, %r9, %r3
	.word 0xcc2a0009  ! 748: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc8120009  ! 748: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xc36a2b74  ! 749: PREFETCH_I	prefetch	[%r8 + 0x0b74], #one_read
	.word 0x8143e02b  ! 750: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #MemIssue 
	.word 0xc3ea1009  ! 751: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x8c520009  ! 752: UMUL_R	umul 	%r8, %r9, %r6
	.word 0xe0220009  ! 754: STW_R	stw	%r16, [%r8 + %r9]
	.word 0xc6420009  ! 754: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xcb3a0009  ! 756: STDF_R	std	%f5, [%r9, %r8]
	.word 0xc2720009  ! 757: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xe04a0009  ! 757: LDSB_R	ldsb	[%r8 + %r9], %r16
	.word 0xe4b223c0  ! 758: STHA_I	stha	%r18, [%r8 + 0x03c0] %asi
	.word 0xc20a0009  ! 759: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xc20a28ec  ! 760: LDUB_I	ldub	[%r8 + 0x08ec], %r1
	.word 0xcca21009  ! 761: STWA_R	stwa	%r6, [%r8 + %r9] 0x80
	.word 0x06c20001  ! 762: BRLZ	brlz  ,nt	%8,<label_0x20001>
	.word 0xce220009  ! 764: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc4420009  ! 764: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xae7a0009  ! 765: SDIV_R	sdiv 	%r8, %r9, %r23
	.word 0x826a2ff0  ! 766: UDIVX_I	udivx 	%r8, 0x0ff0, %r1
	.word 0x32800002  ! 767: BNE	bne,a	<label_0x2>
	.word 0xf4a2278c  ! 768: STWA_I	stwa	%r26, [%r8 + 0x078c] %asi
	.word 0xc2821009  ! 769: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r1
	.word 0xc53a2238  ! 770: STDF_I	std	%f2, [0x0238, %r8]
	.word 0xcc2a0009  ! 772: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xcc0a0009  ! 772: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0x87a209a9  ! 773: FDIVs	fdivs	%f8, %f9, %f3
	.word 0xdd2226b8  ! 774: STF_I	st	%f14, [0x06b8, %r8]
	.word 0x0ec20001  ! 775: BRGEZ	brgez  ,nt	%8,<label_0x20001>
	.word 0x8143c000  ! 776: STBAR	stbar
	.word 0x825a2064  ! 777: SMUL_I	smul 	%r8, 0x0064, %r1
	.word 0xc6921009  ! 778: LDUHA_R	lduha	[%r8, %r9] 0x80, %r3
	.word 0xca0a0009  ! 779: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0x8cda2bf8  ! 780: SMULcc_I	smulcc 	%r8, 0x0bf8, %r6
	.word 0xc3ea2950  ! 781: PREFETCHA_I	prefetcha	[%r8, + 0x0950] %asi, #one_read
	.word 0x8143c000  ! 782: STBAR	stbar
	.word 0x825a0009  ! 783: SMUL_R	smul 	%r8, %r9, %r1
	.word 0xc4720009  ! 785: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc85a0009  ! 785: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xed3a2ef8  ! 786: STDF_I	std	%f22, [0x0ef8, %r8]
	.word 0x24c20001  ! 787: BRLEZ	brlez,a,nt	%8,<label_0x20001>
	.word 0xca220009  ! 789: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xda4a0009  ! 789: LDSB_R	ldsb	[%r8 + %r9], %r13
	.word 0x84720009  ! 790: UDIV_R	udiv 	%r8, %r9, %r2
	.word 0xc3ea2914  ! 791: PREFETCHA_I	prefetcha	[%r8, + 0x0914] %asi, #one_read
	.word 0xd49a2518  ! 792: LDDA_I	ldda	[%r8, + 0x0518] %asi, %r10
	.word 0x85a208a9  ! 793: FSUBs	fsubs	%f8, %f9, %f2
	.word 0x8143e04a  ! 794: MEMBAR	membar	#StoreLoad | #StoreStore | #Sync 
	.word 0xf0720009  ! 796: STX_R	stx	%r24, [%r8 + %r9]
	.word 0xd6020009  ! 796: LDUW_R	lduw	[%r8 + %r9], %r11
	.word 0xfc220009  ! 798: STW_R	stw	%r30, [%r8 + %r9]
	.word 0xc4020009  ! 798: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xc42a0009  ! 800: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xce120009  ! 800: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xc53a0009  ! 802: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc6720009  ! 803: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xce020009  ! 803: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xde4a0009  ! 804: LDSB_R	ldsb	[%r8 + %r9], %r15
	.word 0xc2220009  ! 806: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xce0a0009  ! 806: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xca320009  ! 808: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xea5a0009  ! 808: LDX_R	ldx	[%r8 + %r9], %r21
	.word 0xf0f21009  ! 809: STXA_R	stxa	%r24, [%r8 + %r9] 0x80
	.word 0xcab21009  ! 810: STHA_R	stha	%r5, [%r8 + %r9] 0x80
	.word 0xf2420009  ! 811: LDSW_R	ldsw	[%r8 + %r9], %r25
	.word 0xc8822fac  ! 812: LDUWA_I	lduwa	[%r8, + 0x0fac] %asi, %r4
	.word 0x836a2280  ! 813: SDIVX_I	sdivx	%r8, 0x0280, %r1
	.word 0xc9f21009  ! 814: CASXA_I	casxa	[%r8] 0x80, %r9, %r4
	.word 0xce220009  ! 816: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xda420009  ! 816: LDSW_R	ldsw	[%r8 + %r9], %r13
	.word 0xc8aa23ec  ! 817: STBA_I	stba	%r4, [%r8 + 0x03ec] %asi
	.word 0xc33a0009  ! 819: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc6720009  ! 820: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xcc1a0009  ! 820: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xf89a28d8  ! 821: LDDA_I	ldda	[%r8, + 0x08d8] %asi, %r28
	.word 0xb86a24c8  ! 822: UDIVX_I	udivx 	%r8, 0x04c8, %r28
	.word 0xce720009  ! 824: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xda4a0009  ! 824: LDSB_R	ldsb	[%r8 + %r9], %r13
	.word 0xc8220009  ! 826: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xca5a0009  ! 826: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0x0ac20001  ! 827: BRNZ	brnz  ,nt	%8,<label_0x20001>
	.word 0xc36a0009  ! 828: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc36a24d0  ! 829: PREFETCH_I	prefetch	[%r8 + 0x04d0], #one_read
	.word 0xcab22d60  ! 830: STHA_I	stha	%r5, [%r8 + 0x0d60] %asi
	.word 0xc81a2ce8  ! 831: LDD_I	ldd	[%r8 + 0x0ce8], %r4
	.word 0x86720009  ! 832: UDIV_R	udiv 	%r8, %r9, %r3
	.word 0x8143e058  ! 833: MEMBAR	membar	#StoreStore | #Lookaside | #Sync 
	.word 0x8d6a0009  ! 834: SDIVX_R	sdivx	%r8, %r9, %r6
	.word 0xccba1009  ! 835: STDA_R	stda	%r6, [%r8 + %r9] 0x80
	.word 0xb7a20929  ! 836: FMULs	fmuls	%f8, %f9, %f27
	.word 0xc2ca2180  ! 837: LDSBA_I	ldsba	[%r8, + 0x0180] %asi, %r1
	.word 0x98d226bc  ! 838: UMULcc_I	umulcc 	%r8, 0x06bc, %r12
	.word 0x02ca0001  ! 839: BRZ	brz  ,pt	%8,<label_0xa0001>
	.word 0x8e7a2b98  ! 840: SDIV_I	sdiv 	%r8, 0x0b98, %r7
	.word 0xe0c21009  ! 841: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r16
	.word 0x8143c000  ! 842: STBAR	stbar
	.word 0x26800002  ! 843: BL	bl,a	<label_0x2>
	.word 0xf13a2ce0  ! 844: STDF_I	std	%f24, [0x0ce0, %r8]
	.word 0xce220009  ! 846: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xcc520009  ! 846: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0x22c20001  ! 847: BRZ	brz,a,nt	%8,<label_0x20001>
	.word 0xf49a1009  ! 848: LDDA_R	ldda	[%r8, %r9] 0x80, %r26
	.word 0xcb220009  ! 850: STF_R	st	%f5, [%r9, %r8]
	.word 0xea720009  ! 851: STX_R	stx	%r21, [%r8 + %r9]
	.word 0xc7020009  ! 851: LDF_R	ld	[%r8, %r9], %f3
	.word 0xac7a2bc4  ! 852: SDIV_I	sdiv 	%r8, 0x0bc4, %r22
	.word 0x8ba20829  ! 853: FADDs	fadds	%f8, %f9, %f5
	.word 0xcf3a0009  ! 855: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc6720009  ! 856: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc24a0009  ! 856: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0x8143c000  ! 857: STBAR	stbar
	.word 0x8fa20929  ! 858: FMULs	fmuls	%f8, %f9, %f7
	.word 0x1a800001  ! 859: BCC	bcc  	<label_0x1>
	.word 0x04800002  ! 860: BLE	ble  	<label_0x2>
	.word 0xd67a2218  ! 861: SWAP_I	swap	%r11, [%r8 + 0x0218]
	.word 0x18800001  ! 862: BGU	bgu  	<label_0x1>
	.word 0xc3ea1009  ! 863: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc3ea288c  ! 864: PREFETCHA_I	prefetcha	[%r8, + 0x088c] %asi, #one_read
	.word 0x1e800002  ! 865: BVC	bvc  	<label_0x2>
	.word 0x3c800002  ! 866: BPOS	bpos,a	<label_0x2>
	.word 0xc36a2660  ! 867: PREFETCH_I	prefetch	[%r8 + 0x0660], #one_read
	.word 0xca320009  ! 869: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc81a0009  ! 869: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xfe320009  ! 871: STH_R	sth	%r31, [%r8 + %r9]
	.word 0xc41a0009  ! 871: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xc6da1009  ! 872: LDXA_R	ldxa	[%r8, %r9] 0x80, %r3
	.word 0xc3ea1009  ! 873: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x8143c000  ! 874: STBAR	stbar
	.word 0xe1f21009  ! 875: CASXA_I	casxa	[%r8] 0x80, %r9, %r16
	.word 0xcc8a2720  ! 876: LDUBA_I	lduba	[%r8, + 0x0720] %asi, %r6
	.word 0x8da20829  ! 877: FADDs	fadds	%f8, %f9, %f6
	.word 0xf3220009  ! 879: STF_R	st	%f25, [%r9, %r8]
	.word 0xfc720009  ! 880: STX_R	stx	%r30, [%r8 + %r9]
	.word 0xc8420009  ! 880: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0x40000001  ! 881: CALL	call	disp30_1
	.word 0xc8ba1009  ! 882: STDA_R	stda	%r4, [%r8 + %r9] 0x80
	.word 0x8143e040  ! 883: MEMBAR	membar	#Sync 
	.word 0xc82a0009  ! 885: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc45a0009  ! 885: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0x8143e04e  ! 886: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Sync 
	.word 0xa16a0009  ! 887: SDIVX_R	sdivx	%r8, %r9, %r16
	.word 0xcac22f1c  ! 888: LDSWA_I	ldswa	[%r8, + 0x0f1c] %asi, %r5
	.word 0xa47a0009  ! 889: SDIV_R	sdiv 	%r8, %r9, %r18
	.word 0xc8d21009  ! 890: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r4
	.word 0x8fa20829  ! 891: FADDs	fadds	%f8, %f9, %f7
	.word 0xc73a0009  ! 893: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc8720009  ! 894: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xca420009  ! 894: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xccea2d94  ! 895: LDSTUBA_I	ldstuba	%r6, [%r8 + 0x0d94] %asi
	.word 0x8ba20829  ! 896: FADDs	fadds	%f8, %f9, %f5
	.word 0xec821009  ! 897: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r22
	.word 0x8a4a2e6c  ! 898: MULX_I	mulx 	%r8, 0x0e6c, %r5
	.word 0xcc520009  ! 899: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xa24a0009  ! 900: MULX_R	mulx 	%r8, %r9, %r17
	.word 0x8143c000  ! 901: STBAR	stbar
	.word 0x85a20929  ! 902: FMULs	fmuls	%f8, %f9, %f2
	.word 0x85222710  ! 903: MULScc_I	mulscc 	%r8, 0x0710, %r2
	.word 0xc8a21009  ! 904: STWA_R	stwa	%r4, [%r8 + %r9] 0x80
	.word 0xf0320009  ! 906: STH_R	sth	%r24, [%r8 + %r9]
	.word 0xec420009  ! 906: LDSW_R	ldsw	[%r8 + %r9], %r22
	.word 0x8143c000  ! 907: STBAR	stbar
	.word 0xc36a2fa8  ! 908: PREFETCH_I	prefetch	[%r8 + 0x0fa8], #one_read
	.word 0xc6720009  ! 910: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xce520009  ! 910: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xc33a2fa8  ! 911: STDF_I	std	%f1, [0x0fa8, %r8]
	.word 0xc73a0009  ! 913: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc6720009  ! 914: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc41a0009  ! 914: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xf00a2428  ! 915: LDUB_I	ldub	[%r8 + 0x0428], %r24
	.word 0x846a2fb0  ! 916: UDIVX_I	udivx 	%r8, 0x0fb0, %r2
	.word 0xccca1009  ! 917: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r6
	.word 0xca220009  ! 919: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xfc520009  ! 919: LDSH_R	ldsh	[%r8 + %r9], %r30
	.word 0x87222a8c  ! 920: MULScc_I	mulscc 	%r8, 0x0a8c, %r3
	.word 0x30800002  ! 921: BA	ba,a	<label_0x2>
	.word 0x82f22448  ! 922: UDIVcc_I	udivcc 	%r8, 0x0448, %r1
	.word 0xad6a29bc  ! 923: SDIVX_I	sdivx	%r8, 0x09bc, %r22
	.word 0xce220009  ! 925: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xd8020009  ! 925: LDUW_R	lduw	[%r8 + %r9], %r12
	.word 0x88520009  ! 926: UMUL_R	umul 	%r8, %r9, %r4
	.word 0xcf3a0009  ! 928: STDF_R	std	%f7, [%r9, %r8]
	.word 0xe4720009  ! 929: STX_R	stx	%r18, [%r8 + %r9]
	.word 0xe4120009  ! 929: LDUH_R	lduh	[%r8 + %r9], %r18
	.word 0xfe8a2118  ! 930: LDUBA_I	lduba	[%r8, + 0x0118] %asi, %r31
	.word 0xaa520009  ! 931: UMUL_R	umul 	%r8, %r9, %r21
	.word 0xf66a0009  ! 932: LDSTUB_R	ldstub	%r27, [%r8 + %r9]
	.word 0xe72226e0  ! 933: STF_I	st	%f19, [0x06e0, %r8]
	.word 0xf8220009  ! 935: STW_R	stw	%r28, [%r8 + %r9]
	.word 0xc81a0009  ! 935: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x8143c000  ! 936: STBAR	stbar
	.word 0xca2a0009  ! 938: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc9020009  ! 938: LDF_R	ld	[%r8, %r9], %f4
	.word 0xc36a2c48  ! 939: PREFETCH_I	prefetch	[%r8 + 0x0c48], #one_read
	.word 0xcefa2fe8  ! 940: SWAPA_I	swapa	%r7, [%r8 + 0x0fe8] %asi
	.word 0xcf222994  ! 941: STF_I	st	%f7, [0x0994, %r8]
	.word 0xc6022b10  ! 942: LDUW_I	lduw	[%r8 + 0x0b10], %r3
	.word 0xe1220009  ! 944: STF_R	st	%f16, [%r9, %r8]
	.word 0xc6720009  ! 945: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xf9020009  ! 945: LDF_R	ld	[%r8, %r9], %f28
	.word 0xa85a29c8  ! 946: SMUL_I	smul 	%r8, 0x09c8, %r20
	.word 0xee4228fc  ! 947: LDSW_I	ldsw	[%r8 + 0x08fc], %r23
	.word 0xda7a0009  ! 948: SWAP_R	swap	%r13, [%r8 + %r9]
	.word 0xb2d20009  ! 949: UMULcc_R	umulcc 	%r8, %r9, %r25
	.word 0xcc320009  ! 951: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc25a0009  ! 951: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xcafa2a94  ! 952: SWAPA_I	swapa	%r5, [%r8 + 0x0a94] %asi
	.word 0x40000001  ! 953: CALL	call	disp30_1
	.word 0xc4122b94  ! 954: LDUH_I	lduh	[%r8 + 0x0b94], %r2
	.word 0xc6220009  ! 956: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xe5020009  ! 956: LDF_R	ld	[%r8, %r9], %f18
	.word 0xce7a0009  ! 957: SWAP_R	swap	%r7, [%r8 + %r9]
	.word 0xcc320009  ! 959: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xce020009  ! 959: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0x86fa0009  ! 960: SDIVcc_R	sdivcc 	%r8, %r9, %r3
	.word 0xc91a21b8  ! 961: LDDF_I	ldd	[%r8, 0x01b8], %f4
	.word 0xc4320009  ! 963: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc81a0009  ! 963: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xcfe21009  ! 964: CASA_I	casa	[%r8] 0x80, %r9, %r7
	.word 0x88d20009  ! 965: UMULcc_R	umulcc 	%r8, %r9, %r4
	.word 0xa52226dc  ! 966: MULScc_I	mulscc 	%r8, 0x06dc, %r18
	.word 0xa3222648  ! 967: MULScc_I	mulscc 	%r8, 0x0648, %r17
	.word 0xce320009  ! 969: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc80a0009  ! 969: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0x82720009  ! 970: UDIV_R	udiv 	%r8, %r9, %r1
	.word 0xfa720009  ! 972: STX_R	stx	%r29, [%r8 + %r9]
	.word 0xc31a0009  ! 972: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xc3ea2ecc  ! 973: PREFETCHA_I	prefetcha	[%r8, + 0x0ecc] %asi, #one_read
	.word 0xb2d20009  ! 974: UMULcc_R	umulcc 	%r8, %r9, %r25
	.word 0xc3ea2a88  ! 975: PREFETCHA_I	prefetcha	[%r8, + 0x0a88] %asi, #one_read
	.word 0x9afa0009  ! 976: SDIVcc_R	sdivcc 	%r8, %r9, %r13
	.word 0xc82a0009  ! 978: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xfc020009  ! 978: LDUW_R	lduw	[%r8 + %r9], %r30
	.word 0xfca225a8  ! 979: STWA_I	stwa	%r30, [%r8 + 0x05a8] %asi
	.word 0x8143e027  ! 980: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #MemIssue 
	.word 0x20800001  ! 981: BN	bn,a	<label_0x1>
	.word 0xc3ea1009  ! 982: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc4a22ba0  ! 983: STWA_I	stwa	%r2, [%r8 + 0x0ba0] %asi
	.word 0xcc220009  ! 985: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xcc520009  ! 985: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xf22a0009  ! 987: STB_R	stb	%r25, [%r8 + %r9]
	.word 0xc20a0009  ! 987: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xc4422880  ! 988: LDSW_I	ldsw	[%r8 + 0x0880], %r2
	.word 0xc62a0009  ! 990: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xe0120009  ! 990: LDUH_R	lduh	[%r8 + %r9], %r16
	.word 0xc2ea1009  ! 991: LDSTUBA_R	ldstuba	%r1, [%r8 + %r9] 0x80
	.word 0x8143e02f  ! 992: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #MemIssue 
	.word 0xb9a20829  ! 993: FADDs	fadds	%f8, %f9, %f28
	.word 0xfc720009  ! 995: STX_R	stx	%r30, [%r8 + %r9]
	.word 0xc80a0009  ! 995: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0x14800002  ! 996: BG	bg  	<label_0x2>
	.word 0xc8f21009  ! 997: STXA_R	stxa	%r4, [%r8 + %r9] 0x80
	.word 0xc8aa1009  ! 998: STBA_R	stba	%r4, [%r8 + %r9] 0x80
	.word 0xcdf22009  ! 999: CASXA_R	casxa	[%r8]%asi, %r9, %r6
	nop
	nop
	nop
        ta      T_GOOD_TRAP

th_main_1:
        setx  MAIN_BASE_DATA_VA, %r1, %r8
        setx  0x00000000000003c0, %g1, %r9
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
        setx  0xbd696273fedf6c90, %g1, %r0
        setx  0xe8d6649551e37c84, %g1, %r1
        setx  0xdf6b87e26e0c4b52, %g1, %r2
        setx  0xf94534cceda72cdb, %g1, %r3
        setx  0xeefb77f7480087f3, %g1, %r4
        setx  0x6af854dfe787b70b, %g1, %r5
        setx  0x3a1d531104c18849, %g1, %r6
        setx  0xafd92014bd33e3f9, %g1, %r7
        setx  0xa15e677e1bcb622d, %g1, %r10
        setx  0xb0908cf1d1a66118, %g1, %r11
        setx  0xd5a70f3d83c794de, %g1, %r12
        setx  0xe29780e9e5cc9352, %g1, %r13
        setx  0xe2dc5b976f6546b2, %g1, %r14
        setx  0xdeaffc24314d9a11, %g1, %r15
        setx  0xb9fa2ced4e46c84e, %g1, %r16
        setx  0xbd8d1a98cb40ee2e, %g1, %r17
        setx  0x29a82aac6a6d028d, %g1, %r18
        setx  0x197b284f0827072d, %g1, %r19
        setx  0xdfa762bcf5aeeddb, %g1, %r20
        setx  0x29f146c955dc9fbe, %g1, %r21
        setx  0xb981826708ae5679, %g1, %r22
        setx  0x8b52e292ff7b2ecb, %g1, %r23
        setx  0xba5a1372fe1bf941, %g1, %r24
        setx  0x4444baacb21f3f52, %g1, %r25
        setx  0xaeeb6f1c721d02ea, %g1, %r26
        setx  0x1d5dc1a71a2ff003, %g1, %r27
        setx  0x34c814fdc2c39d7d, %g1, %r28
        setx  0x37e1bed39bb5d22e, %g1, %r29
        setx  0xdc841a7b638542ac, %g1, %r30
        setx  0x68d5da7d985de6fc, %g1, %r31
	.word 0x88722918  ! 1: UDIV_I	udiv 	%r8, 0x0918, %r4
	.word 0xf6320009  ! 3: STH_R	sth	%r27, [%r8 + %r9]
	.word 0xce020009  ! 3: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0x12800001  ! 4: BNE	bne  	<label_0x1>
	.word 0x8143c000  ! 5: STBAR	stbar
	.word 0xc5222814  ! 6: STF_I	st	%f2, [0x0814, %r8]
	.word 0xd88a1009  ! 7: LDUBA_R	lduba	[%r8, %r9] 0x80, %r12
	.word 0xc6a225e0  ! 8: STWA_I	stwa	%r3, [%r8 + 0x05e0] %asi
	.word 0xd89a2d18  ! 9: LDDA_I	ldda	[%r8, + 0x0d18] %asi, %r12
	.word 0xf6720009  ! 11: STX_R	stx	%r27, [%r8 + %r9]
	.word 0xc01a0009  ! 11: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0xce220009  ! 13: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xca4a0009  ! 13: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0x8eda0009  ! 14: SMULcc_R	smulcc 	%r8, %r9, %r7
	.word 0x00800001  ! 15: BN	bn  	<label_0x1>
	.word 0x9c4a2724  ! 16: MULX_I	mulx 	%r8, 0x0724, %r14
	.word 0xe09a1009  ! 17: LDDA_R	ldda	[%r8, %r9] 0x80, %r16
	.word 0xca320009  ! 19: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xfa120009  ! 19: LDUH_R	lduh	[%r8 + %r9], %r29
	.word 0xc6b21009  ! 20: STHA_R	stha	%r3, [%r8 + %r9] 0x80
	.word 0xe2f222e8  ! 21: STXA_I	stxa	%r17, [%r8 + 0x02e8] %asi
	.word 0xfac22c68  ! 22: LDSWA_I	ldswa	[%r8, + 0x0c68] %asi, %r29
	.word 0xcde21009  ! 23: CASA_I	casa	[%r8] 0x80, %r9, %r6
	.word 0xe2da28d8  ! 24: LDXA_I	ldxa	[%r8, + 0x08d8] %asi, %r17
	.word 0xc2c22930  ! 25: LDSWA_I	ldswa	[%r8, + 0x0930] %asi, %r1
	.word 0xc36a2454  ! 26: PREFETCH_I	prefetch	[%r8 + 0x0454], #one_read
	.word 0xcf020009  ! 27: LDF_R	ld	[%r8, %r9], %f7
	.word 0xccb2223c  ! 28: STHA_I	stha	%r6, [%r8 + 0x023c] %asi
	.word 0xcb222308  ! 29: STF_I	st	%f5, [0x0308, %r8]
	.word 0xca922d20  ! 30: LDUHA_I	lduha	[%r8, + 0x0d20] %asi, %r5
	.word 0x896a291c  ! 31: SDIVX_I	sdivx	%r8, 0x091c, %r4
	.word 0x8143e075  ! 32: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside | #MemIssue | #Sync 
	.word 0xfcaa2af4  ! 33: STBA_I	stba	%r30, [%r8 + 0x0af4] %asi
	.word 0x8c7a2634  ! 34: SDIV_I	sdiv 	%r8, 0x0634, %r6
	.word 0x9ba20929  ! 35: FMULs	fmuls	%f8, %f9, %f13
	.word 0xc3ea263c  ! 36: PREFETCHA_I	prefetcha	[%r8, + 0x063c] %asi, #one_read
	.word 0x8143c000  ! 37: STBAR	stbar
	.word 0xc6320009  ! 39: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xca020009  ! 39: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0x89220009  ! 40: MULScc_R	mulscc 	%r8, %r9, %r4
	.word 0xc3f21009  ! 41: CASXA_I	casxa	[%r8] 0x80, %r9, %r1
	.word 0xc4ea208c  ! 42: LDSTUBA_I	ldstuba	%r2, [%r8 + 0x008c] %asi
	.word 0xa1222dac  ! 43: MULScc_I	mulscc 	%r8, 0x0dac, %r16
	.word 0x8143e00d  ! 44: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore 
	.word 0x8143c000  ! 45: STBAR	stbar
	.word 0xccfa1009  ! 46: SWAPA_R	swapa	%r6, [%r8 + %r9] 0x80
	.word 0x85a20929  ! 47: FMULs	fmuls	%f8, %f9, %f2
	.word 0xcd3a2608  ! 48: STDF_I	std	%f6, [0x0608, %r8]
	.word 0xccea2a44  ! 49: LDSTUBA_I	ldstuba	%r6, [%r8 + 0x0a44] %asi
	.word 0x866a0009  ! 50: UDIVX_R	udivx 	%r8, %r9, %r3
	.word 0x8fa209a9  ! 51: FDIVs	fdivs	%f8, %f9, %f7
	.word 0xc2320009  ! 53: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc84a0009  ! 53: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0x8143c000  ! 54: STBAR	stbar
	.word 0x89a20929  ! 55: FMULs	fmuls	%f8, %f9, %f4
	.word 0xd82a0009  ! 57: STB_R	stb	%r12, [%r8 + %r9]
	.word 0xc25a0009  ! 57: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0x856a2414  ! 58: SDIVX_I	sdivx	%r8, 0x0414, %r2
	.word 0xc3ea1009  ! 59: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x8ad2274c  ! 60: UMULcc_I	umulcc 	%r8, 0x074c, %r5
	.word 0xf9222cf4  ! 61: STF_I	st	%f28, [0x0cf4, %r8]
	.word 0x8143c000  ! 62: STBAR	stbar
	.word 0x8143e067  ! 63: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #MemIssue | #Sync 
	.word 0xcc6a0009  ! 64: LDSTUB_R	ldstub	%r6, [%r8 + %r9]
	.word 0xecea2364  ! 65: LDSTUBA_I	ldstuba	%r22, [%r8 + 0x0364] %asi
	.word 0x8143e052  ! 66: MEMBAR	membar	#StoreLoad | #Lookaside | #Sync 
	.word 0xd9f22009  ! 67: CASXA_R	casxa	[%r8]%asi, %r9, %r12
	.word 0x88fa0009  ! 68: SDIVcc_R	sdivcc 	%r8, %r9, %r4
	.word 0xd6720009  ! 70: STX_R	stx	%r11, [%r8 + %r9]
	.word 0xc40a0009  ! 70: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0x846a2f64  ! 71: UDIVX_I	udivx 	%r8, 0x0f64, %r2
	.word 0x856a0009  ! 72: SDIVX_R	sdivx	%r8, %r9, %r2
	.word 0xfe8a2874  ! 73: LDUBA_I	lduba	[%r8, + 0x0874] %asi, %r31
	.word 0xccb223e8  ! 74: STHA_I	stha	%r6, [%r8 + 0x03e8] %asi
	.word 0xc4aa1009  ! 75: STBA_R	stba	%r2, [%r8 + %r9] 0x80
	.word 0xe6220009  ! 77: STW_R	stw	%r19, [%r8 + %r9]
	.word 0xf01a0009  ! 77: LDD_R	ldd	[%r8 + %r9], %r24
	.word 0xc3ea1009  ! 78: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x8143e02f  ! 79: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #MemIssue 
	.word 0xe7222420  ! 80: STF_I	st	%f19, [0x0420, %r8]
	.word 0x836a0009  ! 81: SDIVX_R	sdivx	%r8, %r9, %r1
	.word 0xc7020009  ! 82: LDF_R	ld	[%r8, %r9], %f3
	.word 0xc3ea1009  ! 83: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xda2a0009  ! 85: STB_R	stb	%r13, [%r8 + %r9]
	.word 0xcc120009  ! 85: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xda0a2200  ! 86: LDUB_I	ldub	[%r8 + 0x0200], %r13
	.word 0x88fa2f38  ! 87: SDIVcc_I	sdivcc 	%r8, 0x0f38, %r4
	.word 0xd82a0009  ! 89: STB_R	stb	%r12, [%r8 + %r9]
	.word 0xd6520009  ! 89: LDSH_R	ldsh	[%r8 + %r9], %r11
	.word 0xd8a21009  ! 90: STWA_R	stwa	%r12, [%r8 + %r9] 0x80
	.word 0x8143e05b  ! 91: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Lookaside | #Sync 
	.word 0x8143c000  ! 92: STBAR	stbar
	.word 0x20800001  ! 93: BN	bn,a	<label_0x1>
	.word 0xc86a0009  ! 94: LDSTUB_R	ldstub	%r4, [%r8 + %r9]
	.word 0xbba209a9  ! 95: FDIVs	fdivs	%f8, %f9, %f29
	.word 0xfc821009  ! 96: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r30
	.word 0xca220009  ! 98: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc6020009  ! 98: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xc6f21009  ! 99: STXA_R	stxa	%r3, [%r8 + %r9] 0x80
	.word 0xc5222f24  ! 100: STF_I	st	%f2, [0x0f24, %r8]
	.word 0xf62a0009  ! 102: STB_R	stb	%r27, [%r8 + %r9]
	.word 0xc6020009  ! 102: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xc62a0009  ! 104: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xca020009  ! 104: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xc4ea1009  ! 105: LDSTUBA_R	ldstuba	%r2, [%r8 + %r9] 0x80
	.word 0xcada2ab0  ! 106: LDXA_I	ldxa	[%r8, + 0x0ab0] %asi, %r5
	.word 0x2ac20001  ! 107: BRNZ	brnz,a,nt	%8,<label_0x20001>
	.word 0xca220009  ! 109: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc40a0009  ! 109: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xc86a26e0  ! 110: LDSTUB_I	ldstub	%r4, [%r8 + 0x06e0]
	.word 0xc82a0009  ! 112: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xcb020009  ! 112: LDF_R	ld	[%r8, %r9], %f5
	.word 0xca720009  ! 114: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xcc1a0009  ! 114: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xdcba1009  ! 115: STDA_R	stda	%r14, [%r8 + %r9] 0x80
	.word 0xc62a0009  ! 117: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xce420009  ! 117: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xb6fa2e0c  ! 118: SDIVcc_I	sdivcc 	%r8, 0x0e0c, %r27
	.word 0xc36a2ec8  ! 119: PREFETCH_I	prefetch	[%r8 + 0x0ec8], #one_read
	.word 0x26800002  ! 120: BL	bl,a	<label_0x2>
	.word 0xc3f21009  ! 121: CASXA_I	casxa	[%r8] 0x80, %r9, %r1
	.word 0xf6520009  ! 122: LDSH_R	ldsh	[%r8 + %r9], %r27
	.word 0xcad2298c  ! 123: LDSHA_I	ldsha	[%r8, + 0x098c] %asi, %r5
	.word 0x8143e04d  ! 124: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Sync 
	.word 0xde320009  ! 126: STH_R	sth	%r15, [%r8 + %r9]
	.word 0xca020009  ! 126: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xc6320009  ! 128: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc4120009  ! 128: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xca5a2778  ! 129: LDX_I	ldx	[%r8 + 0x0778], %r5
	.word 0xc4f22d50  ! 130: STXA_I	stxa	%r2, [%r8 + 0x0d50] %asi
	.word 0xc4a2242c  ! 131: STWA_I	stwa	%r2, [%r8 + 0x042c] %asi
	.word 0xce6a0009  ! 132: LDSTUB_R	ldstub	%r7, [%r8 + %r9]
	.word 0xc2320009  ! 134: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xce5a0009  ! 134: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0x34800002  ! 135: BG	bg,a	<label_0x2>
	.word 0x2eca0001  ! 136: BRGEZ	brgez,a,pt	%8,<label_0xa0001>
	.word 0xcad21009  ! 137: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r5
	.word 0xc3ea1009  ! 138: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc36a2590  ! 139: PREFETCH_I	prefetch	[%r8 + 0x0590], #one_read
	.word 0x8a520009  ! 140: UMUL_R	umul 	%r8, %r9, %r5
	.word 0xb0d22db0  ! 141: UMULcc_I	umulcc 	%r8, 0x0db0, %r24
	.word 0xc36a2340  ! 142: PREFETCH_I	prefetch	[%r8 + 0x0340], #one_read
	.word 0x8a5a2aac  ! 143: SMUL_I	smul 	%r8, 0x0aac, %r5
	.word 0xca220009  ! 145: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc24a0009  ! 145: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xbe520009  ! 146: UMUL_R	umul 	%r8, %r9, %r31
	.word 0x867a2c2c  ! 147: SDIV_I	sdiv 	%r8, 0x0c2c, %r3
	.word 0xc3ea1009  ! 148: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xca4a29f8  ! 149: LDSB_I	ldsb	[%r8 + 0x09f8], %r5
	.word 0xcf2226f4  ! 150: STF_I	st	%f7, [0x06f4, %r8]
	.word 0xc3ea1009  ! 151: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x8143c000  ! 152: STBAR	stbar
	.word 0x10800001  ! 153: BA	ba  	<label_0x1>
	.word 0x0e800001  ! 154: BVS	bvs  	<label_0x1>
	.word 0x8da209a9  ! 155: FDIVs	fdivs	%f8, %f9, %f6
	.word 0xc87a0009  ! 156: SWAP_R	swap	%r4, [%r8 + %r9]
	.word 0xbda209a9  ! 157: FDIVs	fdivs	%f8, %f9, %f30
	.word 0xca720009  ! 159: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xf8020009  ! 159: LDUW_R	lduw	[%r8 + %r9], %r28
	.word 0xec2a0009  ! 161: STB_R	stb	%r22, [%r8 + %r9]
	.word 0xe1020009  ! 161: LDF_R	ld	[%r8, %r9], %f16
	.word 0x8143c000  ! 162: STBAR	stbar
	.word 0xc4ca1009  ! 163: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r2
	.word 0xc4320009  ! 165: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc4020009  ! 165: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xc3ea2368  ! 166: PREFETCHA_I	prefetcha	[%r8, + 0x0368] %asi, #one_read
	.word 0x88720009  ! 167: UDIV_R	udiv 	%r8, %r9, %r4
	.word 0x86da2814  ! 168: SMULcc_I	smulcc 	%r8, 0x0814, %r3
	.word 0x32800002  ! 169: BNE	bne,a	<label_0x2>
	.word 0xc68222f0  ! 170: LDUWA_I	lduwa	[%r8, + 0x02f0] %asi, %r3
	.word 0x86f20009  ! 171: UDIVcc_R	udivcc 	%r8, %r9, %r3
	.word 0xcbf22009  ! 172: CASXA_R	casxa	[%r8]%asi, %r9, %r5
	.word 0x8143c000  ! 173: STBAR	stbar
	.word 0x38800002  ! 174: BGU	bgu,a	<label_0x2>
	.word 0xc2ea2d10  ! 175: LDSTUBA_I	ldstuba	%r1, [%r8 + 0x0d10] %asi
	.word 0xc49a2e98  ! 176: LDDA_I	ldda	[%r8, + 0x0e98] %asi, %r2
	.word 0x8143e04d  ! 177: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Sync 
	.word 0x8fa20829  ! 178: FADDs	fadds	%f8, %f9, %f7
	.word 0xc3ea2468  ! 179: PREFETCHA_I	prefetcha	[%r8, + 0x0468] %asi, #one_read
	.word 0xf02a0009  ! 181: STB_R	stb	%r24, [%r8 + %r9]
	.word 0xf3020009  ! 181: LDF_R	ld	[%r8, %r9], %f25
	.word 0xc682261c  ! 182: LDUWA_I	lduwa	[%r8, + 0x061c] %asi, %r3
	.word 0xc3ea24c0  ! 183: PREFETCHA_I	prefetcha	[%r8, + 0x04c0] %asi, #one_read
	.word 0xc6320009  ! 185: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc5020009  ! 185: LDF_R	ld	[%r8, %r9], %f2
	.word 0x8ba209a9  ! 186: FDIVs	fdivs	%f8, %f9, %f5
	.word 0x8f220009  ! 187: MULScc_R	mulscc 	%r8, %r9, %r7
	.word 0xcc921009  ! 188: LDUHA_R	lduha	[%r8, %r9] 0x80, %r6
	.word 0xe42a0009  ! 190: STB_R	stb	%r18, [%r8 + %r9]
	.word 0xc65a0009  ! 190: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xce0a0009  ! 191: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xc4320009  ! 193: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xd6120009  ! 193: LDUH_R	lduh	[%r8 + %r9], %r11
	.word 0xc62a0009  ! 195: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xde0a0009  ! 195: LDUB_R	ldub	[%r8 + %r9], %r15
	.word 0x86520009  ! 196: UMUL_R	umul 	%r8, %r9, %r3
	.word 0x83222b20  ! 197: MULScc_I	mulscc 	%r8, 0x0b20, %r1
	.word 0xc2f21009  ! 198: STXA_R	stxa	%r1, [%r8 + %r9] 0x80
	.word 0xdf3a2b80  ! 199: STDF_I	std	%f15, [0x0b80, %r8]
	.word 0x30800001  ! 200: BA	ba,a	<label_0x1>
	.word 0xc36a2bf0  ! 201: PREFETCH_I	prefetch	[%r8 + 0x0bf0], #one_read
	.word 0xcea2228c  ! 202: STWA_I	stwa	%r7, [%r8 + 0x028c] %asi
	.word 0xce120009  ! 203: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xf41a0009  ! 204: LDD_R	ldd	[%r8 + %r9], %r26
	.word 0xc85226d0  ! 205: LDSH_I	ldsh	[%r8 + 0x06d0], %r4
	.word 0xc27a2a50  ! 206: SWAP_I	swap	%r1, [%r8 + 0x0a50]
	.word 0xdc2a0009  ! 208: STB_R	stb	%r14, [%r8 + %r9]
	.word 0xc2420009  ! 208: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xc2aa2620  ! 209: STBA_I	stba	%r1, [%r8 + 0x0620] %asi
	.word 0xc36a2688  ! 210: PREFETCH_I	prefetch	[%r8 + 0x0688], #one_read
	.word 0x8143e041  ! 211: MEMBAR	membar	#LoadLoad | #Sync 
	.word 0xcb3a0009  ! 213: STDF_R	std	%f5, [%r9, %r8]
	.word 0xc2720009  ! 214: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xce4a0009  ! 214: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0x8143c000  ! 215: STBAR	stbar
	.word 0x04ca0001  ! 216: BRLEZ	brlez  ,pt	%8,<label_0xa0001>
	.word 0xfe522e14  ! 217: LDSH_I	ldsh	[%r8 + 0x0e14], %r31
	.word 0xbc7a0009  ! 218: SDIV_R	sdiv 	%r8, %r9, %r30
	.word 0xd8ba2c10  ! 219: STDA_I	stda	%r12, [%r8 + 0x0c10] %asi
	.word 0x88522bd4  ! 220: UMUL_I	umul 	%r8, 0x0bd4, %r4
	.word 0x22ca0001  ! 221: BRZ	brz,a,pt	%8,<label_0xa0001>
	.word 0x88722a90  ! 222: UDIV_I	udiv 	%r8, 0x0a90, %r4
	.word 0xc28a1009  ! 223: LDUBA_R	lduba	[%r8, %r9] 0x80, %r1
	.word 0xdc6a2f48  ! 224: LDSTUB_I	ldstub	%r14, [%r8 + 0x0f48]
	.word 0xe0720009  ! 226: STX_R	stx	%r16, [%r8 + %r9]
	.word 0xfa120009  ! 226: LDUH_R	lduh	[%r8 + %r9], %r29
	.word 0xcea21009  ! 227: STWA_R	stwa	%r7, [%r8 + %r9] 0x80
	.word 0xc2220009  ! 229: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc51a0009  ! 229: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xf4220009  ! 231: STW_R	stw	%r26, [%r8 + %r9]
	.word 0xe81a0009  ! 231: LDD_R	ldd	[%r8 + %r9], %r20
	.word 0xca6a0009  ! 232: LDSTUB_R	ldstub	%r5, [%r8 + %r9]
	.word 0xc47a0009  ! 233: SWAP_R	swap	%r2, [%r8 + %r9]
	.word 0xc6f22210  ! 234: STXA_I	stxa	%r3, [%r8 + 0x0210] %asi
	.word 0xa1a20829  ! 235: FADDs	fadds	%f8, %f9, %f16
	.word 0x2ac20001  ! 236: BRNZ	brnz,a,nt	%8,<label_0x20001>
	.word 0x8b220009  ! 237: MULScc_R	mulscc 	%r8, %r9, %r5
	.word 0xf6320009  ! 239: STH_R	sth	%r27, [%r8 + %r9]
	.word 0xd71a0009  ! 239: LDDF_R	ldd	[%r8, %r9], %f11
	.word 0x8143e03d  ! 240: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0xcd3a0009  ! 242: STDF_R	std	%f6, [%r9, %r8]
	.word 0xfa720009  ! 243: STX_R	stx	%r29, [%r8 + %r9]
	.word 0xc6120009  ! 243: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0x85a209a9  ! 244: FDIVs	fdivs	%f8, %f9, %f2
	.word 0xf45a0009  ! 245: LDX_R	ldx	[%r8 + %r9], %r26
	.word 0xc3ea1009  ! 246: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xce720009  ! 248: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc44a0009  ! 248: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0x8143e03b  ! 249: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Lookaside | #MemIssue 
	.word 0x864a0009  ! 250: MULX_R	mulx 	%r8, %r9, %r3
	.word 0xdcba1009  ! 251: STDA_R	stda	%r14, [%r8 + %r9] 0x80
	.word 0x88da0009  ! 252: SMULcc_R	smulcc 	%r8, %r9, %r4
	.word 0x8143c000  ! 253: STBAR	stbar
	.word 0xc6720009  ! 255: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc45a0009  ! 255: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xceb21009  ! 256: STHA_R	stha	%r7, [%r8 + %r9] 0x80
	.word 0xc4da2270  ! 257: LDXA_I	ldxa	[%r8, + 0x0270] %asi, %r2
	.word 0xccba2d48  ! 258: STDA_I	stda	%r6, [%r8 + 0x0d48] %asi
	.word 0xff22245c  ! 259: STF_I	st	%f31, [0x045c, %r8]
	.word 0x8e6a0009  ! 260: UDIVX_R	udivx 	%r8, %r9, %r7
	.word 0xf6220009  ! 262: STW_R	stw	%r27, [%r8 + %r9]
	.word 0xec120009  ! 262: LDUH_R	lduh	[%r8 + %r9], %r22
	.word 0xc8921009  ! 263: LDUHA_R	lduha	[%r8, %r9] 0x80, %r4
	.word 0x8afa0009  ! 264: SDIVcc_R	sdivcc 	%r8, %r9, %r5
	.word 0xd6220009  ! 266: STW_R	stw	%r11, [%r8 + %r9]
	.word 0xd6520009  ! 266: LDSH_R	ldsh	[%r8 + %r9], %r11
	.word 0xce220009  ! 268: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xec4a0009  ! 268: LDSB_R	ldsb	[%r8 + %r9], %r22
	.word 0xc3ea2140  ! 269: PREFETCHA_I	prefetcha	[%r8, + 0x0140] %asi, #one_read
	.word 0xc2220009  ! 271: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xfa4a0009  ! 271: LDSB_R	ldsb	[%r8 + %r9], %r29
	.word 0xf0f220e8  ! 272: STXA_I	stxa	%r24, [%r8 + 0x00e8] %asi
	.word 0xc3ea1009  ! 273: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xee921009  ! 274: LDUHA_R	lduha	[%r8, %r9] 0x80, %r23
	.word 0xecaa2da0  ! 275: STBA_I	stba	%r22, [%r8 + 0x0da0] %asi
	.word 0x8efa0009  ! 276: SDIVcc_R	sdivcc 	%r8, %r9, %r7
	.word 0xc36a0009  ! 277: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xe9222da0  ! 278: STF_I	st	%f20, [0x0da0, %r8]
	.word 0xc89a1009  ! 279: LDDA_R	ldda	[%r8, %r9] 0x80, %r4
	.word 0xf93a24d0  ! 280: STDF_I	std	%f28, [0x04d0, %r8]
	.word 0x8143c000  ! 281: STBAR	stbar
	.word 0xc36a2498  ! 282: PREFETCH_I	prefetch	[%r8 + 0x0498], #one_read
	.word 0xc3ea2c74  ! 283: PREFETCHA_I	prefetcha	[%r8, + 0x0c74] %asi, #one_read
	.word 0xd9222858  ! 284: STF_I	st	%f12, [0x0858, %r8]
	.word 0xce422774  ! 285: LDSW_I	ldsw	[%r8 + 0x0774], %r7
	.word 0xcc320009  ! 287: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xfa5a0009  ! 287: LDX_R	ldx	[%r8 + %r9], %r29
	.word 0x9f6a2db4  ! 288: SDIVX_I	sdivx	%r8, 0x0db4, %r15
	.word 0xc6220009  ! 290: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xce120009  ! 290: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xe8821009  ! 291: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r20
	.word 0xce4a2254  ! 292: LDSB_I	ldsb	[%r8 + 0x0254], %r7
	.word 0xd9220009  ! 294: STF_R	st	%f12, [%r9, %r8]
	.word 0xde720009  ! 295: STX_R	stx	%r15, [%r8 + %r9]
	.word 0xc6420009  ! 295: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xcc6a0009  ! 296: LDSTUB_R	ldstub	%r6, [%r8 + %r9]
	.word 0xb05a224c  ! 297: SMUL_I	smul 	%r8, 0x024c, %r24
	.word 0xc3ea270c  ! 298: PREFETCHA_I	prefetcha	[%r8, + 0x070c] %asi, #one_read
	.word 0xc36a0009  ! 299: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0x9a6a0009  ! 300: UDIVX_R	udivx 	%r8, %r9, %r13
	.word 0xc4ba21d0  ! 301: STDA_I	stda	%r2, [%r8 + 0x01d0] %asi
	.word 0xae4a0009  ! 302: MULX_R	mulx 	%r8, %r9, %r23
	.word 0xca320009  ! 304: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xce5a0009  ! 304: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xc4720009  ! 306: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xca020009  ! 306: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xca2a0009  ! 308: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc81a0009  ! 308: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xc3ea1009  ! 309: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xecc22bd8  ! 310: LDSWA_I	ldswa	[%r8, + 0x0bd8] %asi, %r22
	.word 0xc3222654  ! 311: STF_I	st	%f1, [0x0654, %r8]
	.word 0xc3ea1009  ! 312: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x38800001  ! 313: BGU	bgu,a	<label_0x1>
	.word 0xc4ba1009  ! 314: STDA_R	stda	%r2, [%r8 + %r9] 0x80
	.word 0xc36a20a0  ! 315: PREFETCH_I	prefetch	[%r8 + 0x00a0], #one_read
	.word 0xc4ea1009  ! 316: LDSTUBA_R	ldstuba	%r2, [%r8 + %r9] 0x80
	.word 0xc36a2390  ! 317: PREFETCH_I	prefetch	[%r8 + 0x0390], #one_read
	.word 0xc8220009  ! 319: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xca520009  ! 319: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xc46a2e08  ! 320: LDSTUB_I	ldstub	%r2, [%r8 + 0x0e08]
	.word 0xc36a0009  ! 321: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0x8143e04f  ! 322: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #Sync 
	.word 0x14800002  ! 323: BG	bg  	<label_0x2>
	.word 0xc2821009  ! 324: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r1
	.word 0xc36a2c88  ! 325: PREFETCH_I	prefetch	[%r8 + 0x0c88], #one_read
	.word 0xca4a2ec8  ! 326: LDSB_I	ldsb	[%r8 + 0x0ec8], %r5
	.word 0x8143e061  ! 327: MEMBAR	membar	#LoadLoad | #MemIssue | #Sync 
	.word 0xb0da220c  ! 328: SMULcc_I	smulcc 	%r8, 0x020c, %r24
	.word 0xc6522a80  ! 329: LDSH_I	ldsh	[%r8 + 0x0a80], %r3
	.word 0xfa2a0009  ! 331: STB_R	stb	%r29, [%r8 + %r9]
	.word 0xf4020009  ! 331: LDUW_R	lduw	[%r8 + %r9], %r26
	.word 0x866a21b4  ! 332: UDIVX_I	udivx 	%r8, 0x01b4, %r3
	.word 0x02c20001  ! 333: BRZ	brz  ,nt	%8,<label_0x20001>
	.word 0xfa220009  ! 335: STW_R	stw	%r29, [%r8 + %r9]
	.word 0xca020009  ! 335: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xc25224fc  ! 336: LDSH_I	ldsh	[%r8 + 0x04fc], %r1
	.word 0xc612221c  ! 337: LDUH_I	lduh	[%r8 + 0x021c], %r3
	.word 0xcd220009  ! 339: STF_R	st	%f6, [%r9, %r8]
	.word 0xcc720009  ! 340: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xeb020009  ! 340: LDF_R	ld	[%r8, %r9], %f21
	.word 0x85a20929  ! 341: FMULs	fmuls	%f8, %f9, %f2
	.word 0xc8ba2410  ! 342: STDA_I	stda	%r4, [%r8 + 0x0410] %asi
	.word 0xea8a1009  ! 343: LDUBA_R	lduba	[%r8, %r9] 0x80, %r21
	.word 0xc3ea1009  ! 344: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x06800001  ! 345: BL	bl  	<label_0x1>
	.word 0xc4220009  ! 347: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xce520009  ! 347: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xc3ea2ee8  ! 348: PREFETCHA_I	prefetcha	[%r8, + 0x0ee8] %asi, #one_read
	.word 0xc2720009  ! 350: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xca0a0009  ! 350: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xccf21009  ! 351: STXA_R	stxa	%r6, [%r8 + %r9] 0x80
	.word 0x8143e003  ! 352: MEMBAR	membar	#LoadLoad | #StoreLoad 
	.word 0x2cc20001  ! 353: BRGZ	brgz,a,nt	%8,<label_0x20001>
	.word 0xc3ea1009  ! 354: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc4ba2930  ! 355: STDA_I	stda	%r2, [%r8 + 0x0930] %asi
	.word 0xc5e22009  ! 356: CASA_R	casa	[%r8] %asi, %r9, %r2
	.word 0xb76a29ac  ! 357: SDIVX_I	sdivx	%r8, 0x09ac, %r27
	.word 0xb4fa23ec  ! 358: SDIVcc_I	sdivcc 	%r8, 0x03ec, %r26
	.word 0x8143c000  ! 359: STBAR	stbar
	.word 0xcd222444  ! 360: STF_I	st	%f6, [0x0444, %r8]
	.word 0xcef21009  ! 361: STXA_R	stxa	%r7, [%r8 + %r9] 0x80
	.word 0xdc022bf0  ! 362: LDUW_I	lduw	[%r8 + 0x0bf0], %r14
	.word 0xfbf22009  ! 363: CASXA_R	casxa	[%r8]%asi, %r9, %r29
	.word 0x84f20009  ! 364: UDIVcc_R	udivcc 	%r8, %r9, %r2
	.word 0xc4a22db4  ! 365: STWA_I	stwa	%r2, [%r8 + 0x0db4] %asi
	.word 0x8143c000  ! 366: STBAR	stbar
	.word 0x9c5a0009  ! 367: SMUL_R	smul 	%r8, %r9, %r14
	.word 0xc4020009  ! 368: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xeada21b8  ! 369: LDXA_I	ldxa	[%r8, + 0x01b8] %asi, %r21
	.word 0x8af20009  ! 370: UDIVcc_R	udivcc 	%r8, %r9, %r5
	.word 0x3e800002  ! 371: BVC	bvc,a	<label_0x2>
	.word 0xc86a0009  ! 372: LDSTUB_R	ldstub	%r4, [%r8 + %r9]
	.word 0xc3ea2854  ! 373: PREFETCHA_I	prefetcha	[%r8, + 0x0854] %asi, #one_read
	.word 0x87220009  ! 374: MULScc_R	mulscc 	%r8, %r9, %r3
	.word 0xc3ea24a4  ! 375: PREFETCHA_I	prefetcha	[%r8, + 0x04a4] %asi, #one_read
	.word 0xc82a0009  ! 377: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xcc4a0009  ! 377: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xce7a2a18  ! 378: SWAP_I	swap	%r7, [%r8 + 0x0a18]
	.word 0xcc522fe4  ! 379: LDSH_I	ldsh	[%r8 + 0x0fe4], %r6
	.word 0xfe720009  ! 381: STX_R	stx	%r31, [%r8 + %r9]
	.word 0xc8120009  ! 381: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xea6a0009  ! 382: LDSTUB_R	ldstub	%r21, [%r8 + %r9]
	.word 0xe45222a0  ! 383: LDSH_I	ldsh	[%r8 + 0x02a0], %r18
	.word 0x34800001  ! 384: BG	bg,a	<label_0x1>
	.word 0xccba1009  ! 385: STDA_R	stda	%r6, [%r8 + %r9] 0x80
	.word 0x884a2d84  ! 386: MULX_I	mulx 	%r8, 0x0d84, %r4
	.word 0xc82a0009  ! 388: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc84a0009  ! 388: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xe01a2b70  ! 389: LDD_I	ldd	[%r8 + 0x0b70], %r16
	.word 0xc3ea1009  ! 390: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc2822a04  ! 391: LDUWA_I	lduwa	[%r8, + 0x0a04] %asi, %r1
	.word 0xc4922af0  ! 392: LDUHA_I	lduha	[%r8, + 0x0af0] %asi, %r2
	.word 0x3a800001  ! 393: BCC	bcc,a	<label_0x1>
	.word 0xc4320009  ! 395: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xca120009  ! 395: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xbeda0009  ! 396: SMULcc_R	smulcc 	%r8, %r9, %r31
	.word 0xcefa2cdc  ! 397: SWAPA_I	swapa	%r7, [%r8 + 0x0cdc] %asi
	.word 0x884a0009  ! 398: MULX_R	mulx 	%r8, %r9, %r4
	.word 0xd87a2688  ! 399: SWAP_I	swap	%r12, [%r8 + 0x0688]
	.word 0xce2a0009  ! 401: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xe9020009  ! 401: LDF_R	ld	[%r8, %r9], %f20
	.word 0x36800001  ! 402: BGE	bge,a	<label_0x1>
	.word 0xc4f22f88  ! 403: STXA_I	stxa	%r2, [%r8 + 0x0f88] %asi
	.word 0xccba21f8  ! 404: STDA_I	stda	%r6, [%r8 + 0x01f8] %asi
	.word 0x8a4a27a0  ! 405: MULX_I	mulx 	%r8, 0x07a0, %r5
	.word 0xca5a0009  ! 406: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xc6822604  ! 407: LDUWA_I	lduwa	[%r8, + 0x0604] %asi, %r3
	.word 0xc3ea1009  ! 408: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xaf222fb0  ! 409: MULScc_I	mulscc 	%r8, 0x0fb0, %r23
	.word 0x83a20929  ! 410: FMULs	fmuls	%f8, %f9, %f1
	.word 0x887a25a4  ! 411: SDIV_I	sdiv 	%r8, 0x05a4, %r4
	.word 0x04800001  ! 412: BLE	ble  	<label_0x1>
	.word 0xa2d22ae4  ! 413: UMULcc_I	umulcc 	%r8, 0x0ae4, %r17
	.word 0xe47a0009  ! 414: SWAP_R	swap	%r18, [%r8 + %r9]
	.word 0x0a800002  ! 415: BCS	bcs  	<label_0x2>
	.word 0xcf222508  ! 416: STF_I	st	%f7, [0x0508, %r8]
	.word 0xc8720009  ! 418: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xfc0a0009  ! 418: LDUB_R	ldub	[%r8 + %r9], %r30
	.word 0xc2220009  ! 420: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xe0520009  ! 420: LDSH_R	ldsh	[%r8 + %r9], %r16
	.word 0xec2a0009  ! 422: STB_R	stb	%r22, [%r8 + %r9]
	.word 0xc64a0009  ! 422: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xbe7222b0  ! 423: UDIV_I	udiv 	%r8, 0x02b0, %r31
	.word 0xcd3a2620  ! 424: STDF_I	std	%f6, [0x0620, %r8]
	.word 0x8143c000  ! 425: STBAR	stbar
	.word 0xb86a29b0  ! 426: UDIVX_I	udivx 	%r8, 0x09b0, %r28
	.word 0xe8d21009  ! 427: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r20
	.word 0xccba2b58  ! 428: STDA_I	stda	%r6, [%r8 + 0x0b58] %asi
	.word 0x02800001  ! 429: BE	be  	<label_0x1>
	.word 0x22c20001  ! 430: BRZ	brz,a,nt	%8,<label_0x20001>
	.word 0x8c5a0009  ! 431: SMUL_R	smul 	%r8, %r9, %r6
	.word 0xc62a0009  ! 433: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc41a0009  ! 433: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x2cc20001  ! 434: BRGZ	brgz,a,nt	%8,<label_0x20001>
	.word 0x1c800001  ! 435: BPOS	bpos  	<label_0x1>
	.word 0xcb3a25c0  ! 436: STDF_I	std	%f5, [0x05c0, %r8]
	.word 0xc36a0009  ! 437: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc64a2948  ! 438: LDSB_I	ldsb	[%r8 + 0x0948], %r3
	.word 0x8ad20009  ! 439: UMULcc_R	umulcc 	%r8, %r9, %r5
	.word 0x8143e015  ! 440: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside 
	.word 0xc2220009  ! 442: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc3020009  ! 442: LDF_R	ld	[%r8, %r9], %f1
	.word 0xc6821009  ! 443: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r3
	.word 0xc73a0009  ! 445: STDF_R	std	%f3, [%r9, %r8]
	.word 0xcc720009  ! 446: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xce0a0009  ! 446: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xee6a2698  ! 447: LDSTUB_I	ldstub	%r23, [%r8 + 0x0698]
	.word 0xdb222218  ! 448: STF_I	st	%f13, [0x0218, %r8]
	.word 0xcb1a0009  ! 449: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xf4220009  ! 451: STW_R	stw	%r26, [%r8 + %r9]
	.word 0xc51a0009  ! 451: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xc20a20b8  ! 452: LDUB_I	ldub	[%r8 + 0x00b8], %r1
	.word 0xc8aa2f10  ! 453: STBA_I	stba	%r4, [%r8 + 0x0f10] %asi
	.word 0xc4822474  ! 454: LDUWA_I	lduwa	[%r8, + 0x0474] %asi, %r2
	.word 0x8e520009  ! 455: UMUL_R	umul 	%r8, %r9, %r7
	.word 0xc6fa27f0  ! 456: SWAPA_I	swapa	%r3, [%r8 + 0x07f0] %asi
	.word 0x8143e036  ! 457: MEMBAR	membar	#StoreLoad | #LoadStore | #Lookaside | #MemIssue 
	.word 0x22800001  ! 458: BE	be,a	<label_0x1>
	.word 0xe53a2998  ! 459: STDF_I	std	%f18, [0x0998, %r8]
	.word 0xc36a0009  ! 460: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xcc5a0009  ! 461: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0x8143c000  ! 462: STBAR	stbar
	.word 0xc44a2fe4  ! 463: LDSB_I	ldsb	[%r8 + 0x0fe4], %r2
	.word 0xcc420009  ! 464: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0x83a208a9  ! 465: FSUBs	fsubs	%f8, %f9, %f1
	.word 0xc3ea2b90  ! 466: PREFETCHA_I	prefetcha	[%r8, + 0x0b90] %asi, #one_read
	.word 0xc36a24c0  ! 467: PREFETCH_I	prefetch	[%r8 + 0x04c0], #one_read
	.word 0x885a0009  ! 468: SMUL_R	smul 	%r8, %r9, %r4
	.word 0xc2da2868  ! 469: LDXA_I	ldxa	[%r8, + 0x0868] %asi, %r1
	.word 0xceb21009  ! 470: STHA_R	stha	%r7, [%r8 + %r9] 0x80
	.word 0xc3ea2ce4  ! 471: PREFETCHA_I	prefetcha	[%r8, + 0x0ce4] %asi, #one_read
	.word 0xec220009  ! 473: STW_R	stw	%r22, [%r8 + %r9]
	.word 0xf1020009  ! 473: LDF_R	ld	[%r8, %r9], %f24
	.word 0xccea2fb0  ! 474: LDSTUBA_I	ldstuba	%r6, [%r8 + 0x0fb0] %asi
	.word 0x8143c000  ! 475: STBAR	stbar
	.word 0x8143c000  ! 476: STBAR	stbar
	.word 0x8143e013  ! 477: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside 
	.word 0x82fa0009  ! 478: SDIVcc_R	sdivcc 	%r8, %r9, %r1
	.word 0xc3ea1009  ! 479: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc27a0009  ! 480: SWAP_R	swap	%r1, [%r8 + %r9]
	.word 0xc3220009  ! 482: STF_R	st	%f1, [%r9, %r8]
	.word 0xfc720009  ! 483: STX_R	stx	%r30, [%r8 + %r9]
	.word 0xcd020009  ! 483: LDF_R	ld	[%r8, %r9], %f6
	.word 0xe4320009  ! 485: STH_R	sth	%r18, [%r8 + %r9]
	.word 0xc6020009  ! 485: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xc4220009  ! 487: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc8520009  ! 487: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xc41a0009  ! 488: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xcac21009  ! 489: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r5
	.word 0x8cd20009  ! 490: UMULcc_R	umulcc 	%r8, %r9, %r6
	.word 0xf6320009  ! 492: STH_R	sth	%r27, [%r8 + %r9]
	.word 0xcc1a0009  ! 492: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xc46a0009  ! 493: LDSTUB_R	ldstub	%r2, [%r8 + %r9]
	.word 0xcea21009  ! 494: STWA_R	stwa	%r7, [%r8 + %r9] 0x80
	.word 0xcec21009  ! 495: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r7
	.word 0xc28229cc  ! 496: LDUWA_I	lduwa	[%r8, + 0x09cc] %asi, %r1
	.word 0x9ada0009  ! 497: SMULcc_R	smulcc 	%r8, %r9, %r13
	.word 0xce7a0009  ! 498: SWAP_R	swap	%r7, [%r8 + %r9]
	.word 0xc2aa238c  ! 499: STBA_I	stba	%r1, [%r8 + 0x038c] %asi
	.word 0xccea1009  ! 500: LDSTUBA_R	ldstuba	%r6, [%r8 + %r9] 0x80
	.word 0xcf3a2968  ! 501: STDF_I	std	%f7, [0x0968, %r8]
	.word 0xc4420009  ! 502: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xccf22cd0  ! 503: STXA_I	stxa	%r6, [%r8 + 0x0cd0] %asi
	.word 0xb84a290c  ! 504: MULX_I	mulx 	%r8, 0x090c, %r28
	.word 0xc87a2da8  ! 505: SWAP_I	swap	%r4, [%r8 + 0x0da8]
	.word 0xc5220009  ! 507: STF_R	st	%f2, [%r9, %r8]
	.word 0xcc720009  ! 508: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xdc120009  ! 508: LDUH_R	lduh	[%r8 + %r9], %r14
	.word 0x0eca0001  ! 509: BRGEZ	brgez  ,pt	%8,<label_0xa0001>
	.word 0x86520009  ! 510: UMUL_R	umul 	%r8, %r9, %r3
	.word 0xec320009  ! 512: STH_R	sth	%r22, [%r8 + %r9]
	.word 0xc41a0009  ! 512: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xc53a0009  ! 514: STDF_R	std	%f2, [%r9, %r8]
	.word 0xcc720009  ! 515: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xcd020009  ! 515: LDF_R	ld	[%r8, %r9], %f6
	.word 0xccaa24ac  ! 516: STBA_I	stba	%r6, [%r8 + 0x04ac] %asi
	.word 0xc6822e84  ! 517: LDUWA_I	lduwa	[%r8, + 0x0e84] %asi, %r3
	.word 0xc36a2fcc  ! 518: PREFETCH_I	prefetch	[%r8 + 0x0fcc], #one_read
	.word 0x8cd22e3c  ! 519: UMULcc_I	umulcc 	%r8, 0x0e3c, %r6
	.word 0xfefa2910  ! 520: SWAPA_I	swapa	%r31, [%r8 + 0x0910] %asi
	.word 0xcc1a0009  ! 521: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xcde22009  ! 522: CASA_R	casa	[%r8] %asi, %r9, %r6
	.word 0x8143c000  ! 523: STBAR	stbar
	.word 0xf0320009  ! 525: STH_R	sth	%r24, [%r8 + %r9]
	.word 0xca0a0009  ! 525: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xceaa2b6c  ! 526: STBA_I	stba	%r7, [%r8 + 0x0b6c] %asi
	.word 0xd81a2550  ! 527: LDD_I	ldd	[%r8 + 0x0550], %r12
	.word 0xfc821009  ! 528: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r30
	.word 0x856a2980  ! 529: SDIVX_I	sdivx	%r8, 0x0980, %r2
	.word 0xcc320009  ! 531: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc25a0009  ! 531: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xef1a0009  ! 532: LDDF_R	ldd	[%r8, %r9], %f23
	.word 0xec5a2f20  ! 533: LDX_I	ldx	[%r8 + 0x0f20], %r22
	.word 0x84720009  ! 534: UDIV_R	udiv 	%r8, %r9, %r2
	.word 0xc2220009  ! 536: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc2420009  ! 536: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0x8143c000  ! 537: STBAR	stbar
	.word 0xe4220009  ! 539: STW_R	stw	%r18, [%r8 + %r9]
	.word 0xc4420009  ! 539: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xc82a0009  ! 541: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc8420009  ! 541: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xcdf22009  ! 542: CASXA_R	casxa	[%r8]%asi, %r9, %r6
	.word 0x8143e07d  ! 543: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0x8f222204  ! 544: MULScc_I	mulscc 	%r8, 0x0204, %r7
	.word 0xa3a208a9  ! 545: FSUBs	fsubs	%f8, %f9, %f17
	.word 0xc3ea2120  ! 546: PREFETCHA_I	prefetcha	[%r8, + 0x0120] %asi, #one_read
	.word 0xc3ea1009  ! 547: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc36a27b8  ! 548: PREFETCH_I	prefetch	[%r8 + 0x07b8], #one_read
	.word 0xc6120009  ! 549: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0x8143e052  ! 550: MEMBAR	membar	#StoreLoad | #Lookaside | #Sync 
	.word 0xca822f94  ! 551: LDUWA_I	lduwa	[%r8, + 0x0f94] %asi, %r5
	.word 0xe1f21009  ! 552: CASXA_I	casxa	[%r8] 0x80, %r9, %r16
	.word 0x40000002  ! 553: CALL	call	disp30_2
	.word 0xfe220009  ! 555: STW_R	stw	%r31, [%r8 + %r9]
	.word 0xce0a0009  ! 555: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xc8c22f90  ! 556: LDSWA_I	ldswa	[%r8, + 0x0f90] %asi, %r4
	.word 0xc36a2924  ! 557: PREFETCH_I	prefetch	[%r8 + 0x0924], #one_read
	.word 0xe0720009  ! 559: STX_R	stx	%r16, [%r8 + %r9]
	.word 0xce420009  ! 559: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xc73a2f18  ! 560: STDF_I	std	%f3, [0x0f18, %r8]
	.word 0x8143e014  ! 561: MEMBAR	membar	#LoadStore | #Lookaside 
	.word 0x8cfa0009  ! 562: SDIVcc_R	sdivcc 	%r8, %r9, %r6
	.word 0xaa52247c  ! 563: UMUL_I	umul 	%r8, 0x047c, %r21
	.word 0xc4220009  ! 565: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xdc1a0009  ! 565: LDD_R	ldd	[%r8 + %r9], %r14
	.word 0x8da20829  ! 566: FADDs	fadds	%f8, %f9, %f6
	.word 0xc3e22009  ! 567: CASA_R	casa	[%r8] %asi, %r9, %r1
	.word 0xc4220009  ! 569: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc4020009  ! 569: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xcc220009  ! 571: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xec420009  ! 571: LDSW_R	ldsw	[%r8 + %r9], %r22
	.word 0xc7222b14  ! 572: STF_I	st	%f3, [0x0b14, %r8]
	.word 0xc3ea1009  ! 573: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc8220009  ! 575: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xfe420009  ! 575: LDSW_R	ldsw	[%r8 + %r9], %r31
	.word 0xc36a27f0  ! 576: PREFETCH_I	prefetch	[%r8 + 0x07f0], #one_read
	.word 0x8e5a0009  ! 577: SMUL_R	smul 	%r8, %r9, %r7
	.word 0xc8a21009  ! 578: STWA_R	stwa	%r4, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 579: STBAR	stbar
	.word 0xc3222f14  ! 580: STF_I	st	%f1, [0x0f14, %r8]
	.word 0x04c20001  ! 581: BRLEZ	brlez  ,nt	%8,<label_0x20001>
	.word 0xcdf22009  ! 582: CASXA_R	casxa	[%r8]%asi, %r9, %r6
	.word 0xc22a0009  ! 584: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xe64a0009  ! 584: LDSB_R	ldsb	[%r8 + %r9], %r19
	.word 0xc3ea1009  ! 585: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x32800001  ! 586: BNE	bne,a	<label_0x1>
	.word 0xc6120009  ! 587: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xe4320009  ! 589: STH_R	sth	%r18, [%r8 + %r9]
	.word 0xc6520009  ! 589: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xc46a0009  ! 590: LDSTUB_R	ldstub	%r2, [%r8 + %r9]
	.word 0xcc6a0009  ! 591: LDSTUB_R	ldstub	%r6, [%r8 + %r9]
	.word 0xaaf20009  ! 592: UDIVcc_R	udivcc 	%r8, %r9, %r21
	.word 0xfa8a20cc  ! 593: LDUBA_I	lduba	[%r8, + 0x00cc] %asi, %r29
	.word 0xca822abc  ! 594: LDUWA_I	lduwa	[%r8, + 0x0abc] %asi, %r5
	.word 0x872222e4  ! 595: MULScc_I	mulscc 	%r8, 0x02e4, %r3
	.word 0x8143e079  ! 596: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xc84221b8  ! 597: LDSW_I	ldsw	[%r8 + 0x01b8], %r4
	.word 0xb5a20829  ! 598: FADDs	fadds	%f8, %f9, %f26
	.word 0xf9f22009  ! 599: CASXA_R	casxa	[%r8]%asi, %r9, %r28
	.word 0x83a20829  ! 600: FADDs	fadds	%f8, %f9, %f1
	.word 0xc4ba1009  ! 601: STDA_R	stda	%r2, [%r8 + %r9] 0x80
	.word 0x0ac20001  ! 602: BRNZ	brnz  ,nt	%8,<label_0x20001>
	.word 0xe2c22374  ! 603: LDSWA_I	ldswa	[%r8, + 0x0374] %asi, %r17
	.word 0x84520009  ! 604: UMUL_R	umul 	%r8, %r9, %r2
	.word 0x8143e024  ! 605: MEMBAR	membar	#LoadStore | #MemIssue 
	.word 0xde8a22c0  ! 606: LDUBA_I	lduba	[%r8, + 0x02c0] %asi, %r15
	.word 0xc36a0009  ! 607: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xcbf22009  ! 608: CASXA_R	casxa	[%r8]%asi, %r9, %r5
	.word 0x8143e016  ! 609: MEMBAR	membar	#StoreLoad | #LoadStore | #Lookaside 
	.word 0xc3ea2978  ! 610: PREFETCHA_I	prefetcha	[%r8, + 0x0978] %asi, #one_read
	.word 0xc36a20b4  ! 611: PREFETCH_I	prefetch	[%r8 + 0x00b4], #one_read
	.word 0x867a2020  ! 612: SDIV_I	sdiv 	%r8, 0x0020, %r3
	.word 0xcc220009  ! 614: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc65a0009  ! 614: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xcea21009  ! 615: STWA_R	stwa	%r7, [%r8 + %r9] 0x80
	.word 0xeca2207c  ! 616: STWA_I	stwa	%r22, [%r8 + 0x007c] %asi
	.word 0xc36a2a78  ! 617: PREFETCH_I	prefetch	[%r8 + 0x0a78], #one_read
	.word 0x8143c000  ! 618: STBAR	stbar
	.word 0xc8fa1009  ! 619: SWAPA_R	swapa	%r4, [%r8 + %r9] 0x80
	.word 0xc3ea1009  ! 620: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x89220009  ! 621: MULScc_R	mulscc 	%r8, %r9, %r4
	.word 0xc2220009  ! 623: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc45a0009  ! 623: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xce6a2c58  ! 624: LDSTUB_I	ldstub	%r7, [%r8 + 0x0c58]
	.word 0xc7220009  ! 626: STF_R	st	%f3, [%r9, %r8]
	.word 0xce720009  ! 627: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc2520009  ! 627: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xa6520009  ! 628: UMUL_R	umul 	%r8, %r9, %r19
	.word 0xc3ea26a4  ! 629: PREFETCHA_I	prefetcha	[%r8, + 0x06a4] %asi, #one_read
	.word 0x8afa2598  ! 630: SDIVcc_I	sdivcc 	%r8, 0x0598, %r5
	.word 0xfac21009  ! 631: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r29
	.word 0x876a26c0  ! 632: SDIVX_I	sdivx	%r8, 0x06c0, %r3
	.word 0xfd3a26b0  ! 633: STDF_I	std	%f30, [0x06b0, %r8]
	.word 0xca2a0009  ! 635: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc6420009  ! 635: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xc7222468  ! 636: STF_I	st	%f3, [0x0468, %r8]
	.word 0xc6922ca0  ! 637: LDUHA_I	lduha	[%r8, + 0x0ca0] %asi, %r3
	.word 0xc6f21009  ! 638: STXA_R	stxa	%r3, [%r8 + %r9] 0x80
	.word 0xc3ea1009  ! 639: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xdcea293c  ! 640: LDSTUBA_I	ldstuba	%r14, [%r8 + 0x093c] %asi
	.word 0x88722514  ! 641: UDIV_I	udiv 	%r8, 0x0514, %r4
	.word 0xe2c2287c  ! 642: LDSWA_I	ldswa	[%r8, + 0x087c] %asi, %r17
	.word 0xc36a23b8  ! 643: PREFETCH_I	prefetch	[%r8 + 0x03b8], #one_read
	.word 0x82d22b00  ! 644: UMULcc_I	umulcc 	%r8, 0x0b00, %r1
	.word 0x9f220009  ! 645: MULScc_R	mulscc 	%r8, %r9, %r15
	.word 0x18800001  ! 646: BGU	bgu  	<label_0x1>
	.word 0xeb3a0009  ! 648: STDF_R	std	%f21, [%r9, %r8]
	.word 0xc8720009  ! 649: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc41a0009  ! 649: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x9b6a2e00  ! 650: SDIVX_I	sdivx	%r8, 0x0e00, %r13
	.word 0x86520009  ! 651: UMUL_R	umul 	%r8, %r9, %r3
	.word 0x8c720009  ! 652: UDIV_R	udiv 	%r8, %r9, %r6
	.word 0x00800001  ! 653: BN	bn  	<label_0x1>
	.word 0xc26a0009  ! 654: LDSTUB_R	ldstub	%r1, [%r8 + %r9]
	.word 0xcf3a2cc8  ! 655: STDF_I	std	%f7, [0x0cc8, %r8]
	.word 0xe4220009  ! 657: STW_R	stw	%r18, [%r8 + %r9]
	.word 0xc8120009  ! 657: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0x12800001  ! 658: BNE	bne  	<label_0x1>
	.word 0x824a0009  ! 659: MULX_R	mulx 	%r8, %r9, %r1
	.word 0xe0ba1009  ! 660: STDA_R	stda	%r16, [%r8 + %r9] 0x80
	.word 0xca2a0009  ! 662: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc9020009  ! 662: LDF_R	ld	[%r8, %r9], %f4
	.word 0xc7220009  ! 664: STF_R	st	%f3, [%r9, %r8]
	.word 0xc8720009  ! 665: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xfc4a0009  ! 665: LDSB_R	ldsb	[%r8 + %r9], %r30
	.word 0xa0720009  ! 666: UDIV_R	udiv 	%r8, %r9, %r16
	.word 0x8ad228a4  ! 667: UMULcc_I	umulcc 	%r8, 0x08a4, %r5
	.word 0xf7e22009  ! 668: CASA_R	casa	[%r8] %asi, %r9, %r27
	.word 0xf02a0009  ! 670: STB_R	stb	%r24, [%r8 + %r9]
	.word 0xc41a0009  ! 670: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x84720009  ! 671: UDIV_R	udiv 	%r8, %r9, %r2
	.word 0x2cca0001  ! 672: BRGZ	brgz,a,pt	%8,<label_0xa0001>
	.word 0xc22a0009  ! 674: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc5020009  ! 674: LDF_R	ld	[%r8, %r9], %f2
	.word 0xc41a2dd8  ! 675: LDD_I	ldd	[%r8 + 0x0dd8], %r2
	.word 0xc36a0009  ! 676: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc5022ca0  ! 677: LDF_I	ld	[%r8, 0x0ca0], %f2
	.word 0x28800001  ! 678: BLEU	bleu,a	<label_0x1>
	.word 0xc8ba2718  ! 679: STDA_I	stda	%r4, [%r8 + 0x0718] %asi
	.word 0x884a2ed4  ! 680: MULX_I	mulx 	%r8, 0x0ed4, %r4
	.word 0x8143e00f  ! 681: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore 
	.word 0xada20829  ! 682: FADDs	fadds	%f8, %f9, %f22
	.word 0xcc7a2ae0  ! 683: SWAP_I	swap	%r6, [%r8 + 0x0ae0]
	.word 0x22ca0001  ! 684: BRZ	brz,a,pt	%8,<label_0xa0001>
	.word 0xa47a0009  ! 685: SDIV_R	sdiv 	%r8, %r9, %r18
	.word 0xc6c21009  ! 686: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r3
	.word 0xc93a0009  ! 688: STDF_R	std	%f4, [%r9, %r8]
	.word 0xc8720009  ! 689: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xcb1a0009  ! 689: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xc8720009  ! 691: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xd64a0009  ! 691: LDSB_R	ldsb	[%r8 + %r9], %r11
	.word 0xccb229f8  ! 692: STHA_I	stha	%r6, [%r8 + 0x09f8] %asi
	.word 0xfe921009  ! 693: LDUHA_R	lduha	[%r8, %r9] 0x80, %r31
	.word 0x8eda26b0  ! 694: SMULcc_I	smulcc 	%r8, 0x06b0, %r7
	.word 0x8143e015  ! 695: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside 
	.word 0x85a20829  ! 696: FADDs	fadds	%f8, %f9, %f2
	.word 0xf8ea2abc  ! 697: LDSTUBA_I	ldstuba	%r28, [%r8 + 0x0abc] %asi
	.word 0x9a6a2224  ! 698: UDIVX_I	udivx 	%r8, 0x0224, %r13
	.word 0xcc220009  ! 700: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc81a0009  ! 700: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xc3ea1009  ! 701: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xd8520009  ! 702: LDSH_R	ldsh	[%r8 + %r9], %r12
	.word 0x0a800001  ! 703: BCS	bcs  	<label_0x1>
	.word 0x8143c000  ! 704: STBAR	stbar
	.word 0xc6a22ddc  ! 705: STWA_I	stwa	%r3, [%r8 + 0x0ddc] %asi
	.word 0x2ec20001  ! 706: BRGEZ	brgez,a,nt	%8,<label_0x20001>
	.word 0xec320009  ! 708: STH_R	sth	%r22, [%r8 + %r9]
	.word 0xcc520009  ! 708: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xc3222b60  ! 709: STF_I	st	%f1, [0x0b60, %r8]
	.word 0x82f22124  ! 710: UDIVcc_I	udivcc 	%r8, 0x0124, %r1
	.word 0xeefa246c  ! 711: SWAPA_I	swapa	%r23, [%r8 + 0x046c] %asi
	.word 0x8efa2f78  ! 712: SDIVcc_I	sdivcc 	%r8, 0x0f78, %r7
	.word 0xb5220009  ! 713: MULScc_R	mulscc 	%r8, %r9, %r26
	.word 0x8143c000  ! 714: STBAR	stbar
	.word 0x8143c000  ! 715: STBAR	stbar
	.word 0x22800002  ! 716: BE	be,a	<label_0x2>
	.word 0xed3a2e88  ! 717: STDF_I	std	%f22, [0x0e88, %r8]
	.word 0x89a208a9  ! 718: FSUBs	fsubs	%f8, %f9, %f4
	.word 0x26800001  ! 719: BL	bl,a	<label_0x1>
	.word 0x06ca0001  ! 720: BRLZ	brlz  ,pt	%8,<label_0xa0001>
	.word 0xee8a1009  ! 721: LDUBA_R	lduba	[%r8, %r9] 0x80, %r23
	.word 0xeeca1009  ! 722: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r23
	.word 0xcbe22009  ! 723: CASA_R	casa	[%r8] %asi, %r9, %r5
	.word 0xca6a2050  ! 724: LDSTUB_I	ldstub	%r5, [%r8 + 0x0050]
	.word 0xc22a0009  ! 726: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xdf1a0009  ! 726: LDDF_R	ldd	[%r8, %r9], %f15
	.word 0xf9222b60  ! 727: STF_I	st	%f28, [0x0b60, %r8]
	.word 0xc4ea1009  ! 728: LDSTUBA_R	ldstuba	%r2, [%r8 + %r9] 0x80
	.word 0xc3ea2bc8  ! 729: PREFETCHA_I	prefetcha	[%r8, + 0x0bc8] %asi, #one_read
	.word 0x8143c000  ! 730: STBAR	stbar
	.word 0x8cd227e8  ! 731: UMULcc_I	umulcc 	%r8, 0x07e8, %r6
	.word 0xe4522598  ! 732: LDSH_I	ldsh	[%r8 + 0x0598], %r18
	.word 0x8143e01f  ! 733: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #Lookaside 
	.word 0x9f6a0009  ! 734: SDIVX_R	sdivx	%r8, %r9, %r15
	.word 0xcf220009  ! 736: STF_R	st	%f7, [%r9, %r8]
	.word 0xd8720009  ! 737: STX_R	stx	%r12, [%r8 + %r9]
	.word 0xc60a0009  ! 737: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xd6220009  ! 739: STW_R	stw	%r11, [%r8 + %r9]
	.word 0xc20a0009  ! 739: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0x2e800002  ! 740: BVS	bvs,a	<label_0x2>
	.word 0x9eda2714  ! 741: SMULcc_I	smulcc 	%r8, 0x0714, %r15
	.word 0xc7220009  ! 743: STF_R	st	%f3, [%r9, %r8]
	.word 0xda720009  ! 744: STX_R	stx	%r13, [%r8 + %r9]
	.word 0xc2020009  ! 744: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xc87a2454  ! 745: SWAP_I	swap	%r4, [%r8 + 0x0454]
	.word 0x82520009  ! 746: UMUL_R	umul 	%r8, %r9, %r1
	.word 0xce2a0009  ! 748: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xca120009  ! 748: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xc36a2d3c  ! 749: PREFETCH_I	prefetch	[%r8 + 0x0d3c], #one_read
	.word 0x8143e05d  ! 750: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0xc3ea1009  ! 751: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x8c520009  ! 752: UMUL_R	umul 	%r8, %r9, %r6
	.word 0xca220009  ! 754: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xce420009  ! 754: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xfb3a0009  ! 756: STDF_R	std	%f29, [%r9, %r8]
	.word 0xca720009  ! 757: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xcc4a0009  ! 757: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xc2b22c1c  ! 758: STHA_I	stha	%r1, [%r8 + 0x0c1c] %asi
	.word 0xc40a0009  ! 759: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xcc0a271c  ! 760: LDUB_I	ldub	[%r8 + 0x071c], %r6
	.word 0xc4a21009  ! 761: STWA_R	stwa	%r2, [%r8 + %r9] 0x80
	.word 0x06ca0001  ! 762: BRLZ	brlz  ,pt	%8,<label_0xa0001>
	.word 0xf2220009  ! 764: STW_R	stw	%r25, [%r8 + %r9]
	.word 0xc6420009  ! 764: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0x847a0009  ! 765: SDIV_R	sdiv 	%r8, %r9, %r2
	.word 0x866a2ab8  ! 766: UDIVX_I	udivx 	%r8, 0x0ab8, %r3
	.word 0x12800001  ! 767: BNE	bne  	<label_0x1>
	.word 0xcea22040  ! 768: STWA_I	stwa	%r7, [%r8 + 0x0040] %asi
	.word 0xcc821009  ! 769: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r6
	.word 0xed3a2820  ! 770: STDF_I	std	%f22, [0x0820, %r8]
	.word 0xc62a0009  ! 772: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc20a0009  ! 772: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0x8ba209a9  ! 773: FDIVs	fdivs	%f8, %f9, %f5
	.word 0xfb22236c  ! 774: STF_I	st	%f29, [0x036c, %r8]
	.word 0x2ec20001  ! 775: BRGEZ	brgez,a,nt	%8,<label_0x20001>
	.word 0x8143c000  ! 776: STBAR	stbar
	.word 0x985a222c  ! 777: SMUL_I	smul 	%r8, 0x022c, %r12
	.word 0xfc921009  ! 778: LDUHA_R	lduha	[%r8, %r9] 0x80, %r30
	.word 0xfe0a0009  ! 779: LDUB_R	ldub	[%r8 + %r9], %r31
	.word 0x8ada2ccc  ! 780: SMULcc_I	smulcc 	%r8, 0x0ccc, %r5
	.word 0xc3ea21d4  ! 781: PREFETCHA_I	prefetcha	[%r8, + 0x01d4] %asi, #one_read
	.word 0x8143c000  ! 782: STBAR	stbar
	.word 0x9c5a0009  ! 783: SMUL_R	smul 	%r8, %r9, %r14
	.word 0xe4720009  ! 785: STX_R	stx	%r18, [%r8 + %r9]
	.word 0xce5a0009  ! 785: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xc93a2e98  ! 786: STDF_I	std	%f4, [0x0e98, %r8]
	.word 0x24ca0001  ! 787: BRLEZ	brlez,a,pt	%8,<label_0xa0001>
	.word 0xca220009  ! 789: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xca4a0009  ! 789: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xa6720009  ! 790: UDIV_R	udiv 	%r8, %r9, %r19
	.word 0xc3ea24a0  ! 791: PREFETCHA_I	prefetcha	[%r8, + 0x04a0] %asi, #one_read
	.word 0xc49a23a8  ! 792: LDDA_I	ldda	[%r8, + 0x03a8] %asi, %r2
	.word 0x8ba208a9  ! 793: FSUBs	fsubs	%f8, %f9, %f5
	.word 0x8143e02b  ! 794: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #MemIssue 
	.word 0xfc720009  ! 796: STX_R	stx	%r30, [%r8 + %r9]
	.word 0xc2020009  ! 796: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xc8220009  ! 798: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xce020009  ! 798: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xc22a0009  ! 800: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc2120009  ! 800: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xcd3a0009  ! 802: STDF_R	std	%f6, [%r9, %r8]
	.word 0xe8720009  ! 803: STX_R	stx	%r20, [%r8 + %r9]
	.word 0xc2020009  ! 803: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xce4a0009  ! 804: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xf2220009  ! 806: STW_R	stw	%r25, [%r8 + %r9]
	.word 0xda0a0009  ! 806: LDUB_R	ldub	[%r8 + %r9], %r13
	.word 0xc2320009  ! 808: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc25a0009  ! 808: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xc8f21009  ! 809: STXA_R	stxa	%r4, [%r8 + %r9] 0x80
	.word 0xfeb21009  ! 810: STHA_R	stha	%r31, [%r8 + %r9] 0x80
	.word 0xce420009  ! 811: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xc28228ac  ! 812: LDUWA_I	lduwa	[%r8, + 0x08ac] %asi, %r1
	.word 0xa76a2550  ! 813: SDIVX_I	sdivx	%r8, 0x0550, %r19
	.word 0xcdf21009  ! 814: CASXA_I	casxa	[%r8] 0x80, %r9, %r6
	.word 0xdc220009  ! 816: STW_R	stw	%r14, [%r8 + %r9]
	.word 0xc4420009  ! 816: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xfcaa2f58  ! 817: STBA_I	stba	%r30, [%r8 + 0x0f58] %asi
	.word 0xcb3a0009  ! 819: STDF_R	std	%f5, [%r9, %r8]
	.word 0xc4720009  ! 820: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc41a0009  ! 820: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xec9a2730  ! 821: LDDA_I	ldda	[%r8, + 0x0730] %asi, %r22
	.word 0xb66a2468  ! 822: UDIVX_I	udivx 	%r8, 0x0468, %r27
	.word 0xcc720009  ! 824: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xcc4a0009  ! 824: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xc2220009  ! 826: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc45a0009  ! 826: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0x0aca0001  ! 827: BRNZ	brnz  ,pt	%8,<label_0xa0001>
	.word 0xc36a0009  ! 828: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc36a2398  ! 829: PREFETCH_I	prefetch	[%r8 + 0x0398], #one_read
	.word 0xc6b22d18  ! 830: STHA_I	stha	%r3, [%r8 + 0x0d18] %asi
	.word 0xc01a23a8  ! 831: LDD_I	ldd	[%r8 + 0x03a8], %r0
	.word 0xba720009  ! 832: UDIV_R	udiv 	%r8, %r9, %r29
	.word 0x8143e024  ! 833: MEMBAR	membar	#LoadStore | #MemIssue 
	.word 0xad6a0009  ! 834: SDIVX_R	sdivx	%r8, %r9, %r22
	.word 0xc8ba1009  ! 835: STDA_R	stda	%r4, [%r8 + %r9] 0x80
	.word 0x83a20929  ! 836: FMULs	fmuls	%f8, %f9, %f1
	.word 0xceca26d4  ! 837: LDSBA_I	ldsba	[%r8, + 0x06d4] %asi, %r7
	.word 0x84d22b78  ! 838: UMULcc_I	umulcc 	%r8, 0x0b78, %r2
	.word 0x22c20001  ! 839: BRZ	brz,a,nt	%8,<label_0x20001>
	.word 0x827a2428  ! 840: SDIV_I	sdiv 	%r8, 0x0428, %r1
	.word 0xc8c21009  ! 841: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r4
	.word 0x8143c000  ! 842: STBAR	stbar
	.word 0x26800002  ! 843: BL	bl,a	<label_0x2>
	.word 0xe73a2e10  ! 844: STDF_I	std	%f19, [0x0e10, %r8]
	.word 0xc2220009  ! 846: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc2520009  ! 846: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0x02ca0001  ! 847: BRZ	brz  ,pt	%8,<label_0xa0001>
	.word 0xc49a1009  ! 848: LDDA_R	ldda	[%r8, %r9] 0x80, %r2
	.word 0xc9220009  ! 850: STF_R	st	%f4, [%r9, %r8]
	.word 0xdc720009  ! 851: STX_R	stx	%r14, [%r8 + %r9]
	.word 0xcf020009  ! 851: LDF_R	ld	[%r8, %r9], %f7
	.word 0x867a26d0  ! 852: SDIV_I	sdiv 	%r8, 0x06d0, %r3
	.word 0xa5a20829  ! 853: FADDs	fadds	%f8, %f9, %f18
	.word 0xcf3a0009  ! 855: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc6720009  ! 856: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xf04a0009  ! 856: LDSB_R	ldsb	[%r8 + %r9], %r24
	.word 0x8143c000  ! 857: STBAR	stbar
	.word 0x87a20929  ! 858: FMULs	fmuls	%f8, %f9, %f3
	.word 0x3a800002  ! 859: BCC	bcc,a	<label_0x2>
	.word 0x04800001  ! 860: BLE	ble  	<label_0x1>
	.word 0xc67a23dc  ! 861: SWAP_I	swap	%r3, [%r8 + 0x03dc]
	.word 0x38800001  ! 862: BGU	bgu,a	<label_0x1>
	.word 0xc3ea1009  ! 863: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc3ea22cc  ! 864: PREFETCHA_I	prefetcha	[%r8, + 0x02cc] %asi, #one_read
	.word 0x3e800001  ! 865: BVC	bvc,a	<label_0x1>
	.word 0x1c800002  ! 866: BPOS	bpos  	<label_0x2>
	.word 0xc36a2108  ! 867: PREFETCH_I	prefetch	[%r8 + 0x0108], #one_read
	.word 0xca320009  ! 869: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc81a0009  ! 869: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xcc320009  ! 871: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc81a0009  ! 871: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xdada1009  ! 872: LDXA_R	ldxa	[%r8, %r9] 0x80, %r13
	.word 0xc3ea1009  ! 873: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x8143c000  ! 874: STBAR	stbar
	.word 0xc7f21009  ! 875: CASXA_I	casxa	[%r8] 0x80, %r9, %r3
	.word 0xfa8a23ec  ! 876: LDUBA_I	lduba	[%r8, + 0x03ec] %asi, %r29
	.word 0x8ba20829  ! 877: FADDs	fadds	%f8, %f9, %f5
	.word 0xcd220009  ! 879: STF_R	st	%f6, [%r9, %r8]
	.word 0xc8720009  ! 880: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc6420009  ! 880: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0x40000001  ! 881: CALL	call	disp30_1
	.word 0xc8ba1009  ! 882: STDA_R	stda	%r4, [%r8 + %r9] 0x80
	.word 0x8143e022  ! 883: MEMBAR	membar	#StoreLoad | #MemIssue 
	.word 0xce2a0009  ! 885: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xf65a0009  ! 885: LDX_R	ldx	[%r8 + %r9], %r27
	.word 0x8143e047  ! 886: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Sync 
	.word 0x856a0009  ! 887: SDIVX_R	sdivx	%r8, %r9, %r2
	.word 0xc8c221b8  ! 888: LDSWA_I	ldswa	[%r8, + 0x01b8] %asi, %r4
	.word 0xaa7a0009  ! 889: SDIV_R	sdiv 	%r8, %r9, %r21
	.word 0xcad21009  ! 890: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r5
	.word 0x89a20829  ! 891: FADDs	fadds	%f8, %f9, %f4
	.word 0xcf3a0009  ! 893: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc4720009  ! 894: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc2420009  ! 894: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xc6ea2998  ! 895: LDSTUBA_I	ldstuba	%r3, [%r8 + 0x0998] %asi
	.word 0xafa20829  ! 896: FADDs	fadds	%f8, %f9, %f23
	.word 0xc6821009  ! 897: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r3
	.word 0xbe4a217c  ! 898: MULX_I	mulx 	%r8, 0x017c, %r31
	.word 0xc8520009  ! 899: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xb24a0009  ! 900: MULX_R	mulx 	%r8, %r9, %r25
	.word 0x8143c000  ! 901: STBAR	stbar
	.word 0x83a20929  ! 902: FMULs	fmuls	%f8, %f9, %f1
	.word 0x892220e4  ! 903: MULScc_I	mulscc 	%r8, 0x00e4, %r4
	.word 0xcaa21009  ! 904: STWA_R	stwa	%r5, [%r8 + %r9] 0x80
	.word 0xc8320009  ! 906: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xcc420009  ! 906: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0x8143c000  ! 907: STBAR	stbar
	.word 0xc36a2a88  ! 908: PREFETCH_I	prefetch	[%r8 + 0x0a88], #one_read
	.word 0xec720009  ! 910: STX_R	stx	%r22, [%r8 + %r9]
	.word 0xd8520009  ! 910: LDSH_R	ldsh	[%r8 + %r9], %r12
	.word 0xd73a2830  ! 911: STDF_I	std	%f11, [0x0830, %r8]
	.word 0xc93a0009  ! 913: STDF_R	std	%f4, [%r9, %r8]
	.word 0xec720009  ! 914: STX_R	stx	%r22, [%r8 + %r9]
	.word 0xf01a0009  ! 914: LDD_R	ldd	[%r8 + %r9], %r24
	.word 0xc60a2878  ! 915: LDUB_I	ldub	[%r8 + 0x0878], %r3
	.word 0x846a2cec  ! 916: UDIVX_I	udivx 	%r8, 0x0cec, %r2
	.word 0xcaca1009  ! 917: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r5
	.word 0xe6220009  ! 919: STW_R	stw	%r19, [%r8 + %r9]
	.word 0xd8520009  ! 919: LDSH_R	ldsh	[%r8 + %r9], %r12
	.word 0x87222754  ! 920: MULScc_I	mulscc 	%r8, 0x0754, %r3
	.word 0x10800002  ! 921: BA	ba  	<label_0x2>
	.word 0xbef22440  ! 922: UDIVcc_I	udivcc 	%r8, 0x0440, %r31
	.word 0x896a26d8  ! 923: SDIVX_I	sdivx	%r8, 0x06d8, %r4
	.word 0xc6220009  ! 925: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xe6020009  ! 925: LDUW_R	lduw	[%r8 + %r9], %r19
	.word 0x9a520009  ! 926: UMUL_R	umul 	%r8, %r9, %r13
	.word 0xcf3a0009  ! 928: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc8720009  ! 929: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xca120009  ! 929: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xc68a2e9c  ! 930: LDUBA_I	lduba	[%r8, + 0x0e9c] %asi, %r3
	.word 0xa0520009  ! 931: UMUL_R	umul 	%r8, %r9, %r16
	.word 0xea6a0009  ! 932: LDSTUB_R	ldstub	%r21, [%r8 + %r9]
	.word 0xc9222168  ! 933: STF_I	st	%f4, [0x0168, %r8]
	.word 0xd6220009  ! 935: STW_R	stw	%r11, [%r8 + %r9]
	.word 0xdc1a0009  ! 935: LDD_R	ldd	[%r8 + %r9], %r14
	.word 0x8143c000  ! 936: STBAR	stbar
	.word 0xc42a0009  ! 938: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xf9020009  ! 938: LDF_R	ld	[%r8, %r9], %f28
	.word 0xc36a2e94  ! 939: PREFETCH_I	prefetch	[%r8 + 0x0e94], #one_read
	.word 0xccfa2c84  ! 940: SWAPA_I	swapa	%r6, [%r8 + 0x0c84] %asi
	.word 0xd7222980  ! 941: STF_I	st	%f11, [0x0980, %r8]
	.word 0xe2022c20  ! 942: LDUW_I	lduw	[%r8 + 0x0c20], %r17
	.word 0xc7220009  ! 944: STF_R	st	%f3, [%r9, %r8]
	.word 0xc8720009  ! 945: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xdf020009  ! 945: LDF_R	ld	[%r8, %r9], %f15
	.word 0x8e5a2c50  ! 946: SMUL_I	smul 	%r8, 0x0c50, %r7
	.word 0xfc42236c  ! 947: LDSW_I	ldsw	[%r8 + 0x036c], %r30
	.word 0xc87a0009  ! 948: SWAP_R	swap	%r4, [%r8 + %r9]
	.word 0x82d20009  ! 949: UMULcc_R	umulcc 	%r8, %r9, %r1
	.word 0xce320009  ! 951: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xcc5a0009  ! 951: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xc6fa25dc  ! 952: SWAPA_I	swapa	%r3, [%r8 + 0x05dc] %asi
	.word 0x40000001  ! 953: CALL	call	disp30_1
	.word 0xd612221c  ! 954: LDUH_I	lduh	[%r8 + 0x021c], %r11
	.word 0xca220009  ! 956: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xf7020009  ! 956: LDF_R	ld	[%r8, %r9], %f27
	.word 0xca7a0009  ! 957: SWAP_R	swap	%r5, [%r8 + %r9]
	.word 0xc2320009  ! 959: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xdc020009  ! 959: LDUW_R	lduw	[%r8 + %r9], %r14
	.word 0x84fa0009  ! 960: SDIVcc_R	sdivcc 	%r8, %r9, %r2
	.word 0xcd1a2608  ! 961: LDDF_I	ldd	[%r8, 0x0608], %f6
	.word 0xc2320009  ! 963: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc01a0009  ! 963: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0xcde21009  ! 964: CASA_I	casa	[%r8] 0x80, %r9, %r6
	.word 0x8cd20009  ! 965: UMULcc_R	umulcc 	%r8, %r9, %r6
	.word 0x832222c8  ! 966: MULScc_I	mulscc 	%r8, 0x02c8, %r1
	.word 0xab222464  ! 967: MULScc_I	mulscc 	%r8, 0x0464, %r21
	.word 0xc2320009  ! 969: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xce0a0009  ! 969: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0x8c720009  ! 970: UDIV_R	udiv 	%r8, %r9, %r6
	.word 0xcc720009  ! 972: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc91a0009  ! 972: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xc3ea2318  ! 973: PREFETCHA_I	prefetcha	[%r8, + 0x0318] %asi, #one_read
	.word 0x86d20009  ! 974: UMULcc_R	umulcc 	%r8, %r9, %r3
	.word 0xc3ea279c  ! 975: PREFETCHA_I	prefetcha	[%r8, + 0x079c] %asi, #one_read
	.word 0xb6fa0009  ! 976: SDIVcc_R	sdivcc 	%r8, %r9, %r27
	.word 0xc62a0009  ! 978: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xf0020009  ! 978: LDUW_R	lduw	[%r8 + %r9], %r24
	.word 0xcea226c8  ! 979: STWA_I	stwa	%r7, [%r8 + 0x06c8] %asi
	.word 0x8143e03f  ! 980: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0x00800002  ! 981: BN	bn  	<label_0x2>
	.word 0xc3ea1009  ! 982: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc2a22d04  ! 983: STWA_I	stwa	%r1, [%r8 + 0x0d04] %asi
	.word 0xcc220009  ! 985: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xf0520009  ! 985: LDSH_R	ldsh	[%r8 + %r9], %r24
	.word 0xf62a0009  ! 987: STB_R	stb	%r27, [%r8 + %r9]
	.word 0xc20a0009  ! 987: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xca422afc  ! 988: LDSW_I	ldsw	[%r8 + 0x0afc], %r5
	.word 0xce2a0009  ! 990: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc4120009  ! 990: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xc4ea1009  ! 991: LDSTUBA_R	ldstuba	%r2, [%r8 + %r9] 0x80
	.word 0x8143e01d  ! 992: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside 
	.word 0x85a20829  ! 993: FADDs	fadds	%f8, %f9, %f2
	.word 0xcc720009  ! 995: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc40a0009  ! 995: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0x14800001  ! 996: BG	bg  	<label_0x1>
	.word 0xcaf21009  ! 997: STXA_R	stxa	%r5, [%r8 + %r9] 0x80
	.word 0xf2aa1009  ! 998: STBA_R	stba	%r25, [%r8 + %r9] 0x80
	.word 0xc9f22009  ! 999: CASXA_R	casxa	[%r8]%asi, %r9, %r4
	nop
	nop
	nop
        ta      T_GOOD_TRAP

th_main_2:
        setx  MAIN_BASE_DATA_VA, %r1, %r8
        setx  0x00000000000003c0, %g1, %r9
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
        setx  0xbd696273fedf6c90, %g1, %r0
        setx  0xe8d6649551e37c84, %g1, %r1
        setx  0xdf6b87e26e0c4b52, %g1, %r2
        setx  0xf94534cceda72cdb, %g1, %r3
        setx  0xeefb77f7480087f3, %g1, %r4
        setx  0x6af854dfe787b70b, %g1, %r5
        setx  0x3a1d531104c18849, %g1, %r6
        setx  0xafd92014bd33e3f9, %g1, %r7
        setx  0xa15e677e1bcb622d, %g1, %r10
        setx  0xb0908cf1d1a66118, %g1, %r11
        setx  0xd5a70f3d83c794de, %g1, %r12
        setx  0xe29780e9e5cc9352, %g1, %r13
        setx  0xe2dc5b976f6546b2, %g1, %r14
        setx  0xdeaffc24314d9a11, %g1, %r15
        setx  0xb9fa2ced4e46c84e, %g1, %r16
        setx  0xbd8d1a98cb40ee2e, %g1, %r17
        setx  0x29a82aac6a6d028d, %g1, %r18
        setx  0x197b284f0827072d, %g1, %r19
        setx  0xdfa762bcf5aeeddb, %g1, %r20
        setx  0x29f146c955dc9fbe, %g1, %r21
        setx  0xb981826708ae5679, %g1, %r22
        setx  0x8b52e292ff7b2ecb, %g1, %r23
        setx  0xba5a1372fe1bf941, %g1, %r24
        setx  0x4444baacb21f3f52, %g1, %r25
        setx  0xaeeb6f1c721d02ea, %g1, %r26
        setx  0x1d5dc1a71a2ff003, %g1, %r27
        setx  0x34c814fdc2c39d7d, %g1, %r28
        setx  0x37e1bed39bb5d22e, %g1, %r29
        setx  0xdc841a7b638542ac, %g1, %r30
        setx  0x68d5da7d985de6fc, %g1, %r31
	.word 0xa07225bc  ! 1: UDIV_I	udiv 	%r8, 0x05bc, %r16
	.word 0xea320009  ! 3: STH_R	sth	%r21, [%r8 + %r9]
	.word 0xc6020009  ! 3: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0x32800002  ! 4: BNE	bne,a	<label_0x2>
	.word 0x8143c000  ! 5: STBAR	stbar
	.word 0xc9222ee0  ! 6: STF_I	st	%f4, [0x0ee0, %r8]
	.word 0xf88a1009  ! 7: LDUBA_R	lduba	[%r8, %r9] 0x80, %r28
	.word 0xdea226f0  ! 8: STWA_I	stwa	%r15, [%r8 + 0x06f0] %asi
	.word 0xc89a2ac8  ! 9: LDDA_I	ldda	[%r8, + 0x0ac8] %asi, %r4
	.word 0xf8720009  ! 11: STX_R	stx	%r28, [%r8 + %r9]
	.word 0xcc1a0009  ! 11: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xec220009  ! 13: STW_R	stw	%r22, [%r8 + %r9]
	.word 0xcc4a0009  ! 13: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0x8eda0009  ! 14: SMULcc_R	smulcc 	%r8, %r9, %r7
	.word 0x00800001  ! 15: BN	bn  	<label_0x1>
	.word 0x824a26f0  ! 16: MULX_I	mulx 	%r8, 0x06f0, %r1
	.word 0xd49a1009  ! 17: LDDA_R	ldda	[%r8, %r9] 0x80, %r10
	.word 0xc2320009  ! 19: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc6120009  ! 19: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xc6b21009  ! 20: STHA_R	stha	%r3, [%r8 + %r9] 0x80
	.word 0xeaf22878  ! 21: STXA_I	stxa	%r21, [%r8 + 0x0878] %asi
	.word 0xc2c22a6c  ! 22: LDSWA_I	ldswa	[%r8, + 0x0a6c] %asi, %r1
	.word 0xd7e21009  ! 23: CASA_I	casa	[%r8] 0x80, %r9, %r11
	.word 0xe2da2800  ! 24: LDXA_I	ldxa	[%r8, + 0x0800] %asi, %r17
	.word 0xc2c22664  ! 25: LDSWA_I	ldswa	[%r8, + 0x0664] %asi, %r1
	.word 0xc36a2300  ! 26: PREFETCH_I	prefetch	[%r8 + 0x0300], #one_read
	.word 0xf7020009  ! 27: LDF_R	ld	[%r8, %r9], %f27
	.word 0xceb22d68  ! 28: STHA_I	stha	%r7, [%r8 + 0x0d68] %asi
	.word 0xd7222ec8  ! 29: STF_I	st	%f11, [0x0ec8, %r8]
	.word 0xca922334  ! 30: LDUHA_I	lduha	[%r8, + 0x0334] %asi, %r5
	.word 0x856a2440  ! 31: SDIVX_I	sdivx	%r8, 0x0440, %r2
	.word 0x8143e042  ! 32: MEMBAR	membar	#StoreLoad | #Sync 
	.word 0xe4aa2250  ! 33: STBA_I	stba	%r18, [%r8 + 0x0250] %asi
	.word 0x8a7a2728  ! 34: SDIV_I	sdiv 	%r8, 0x0728, %r5
	.word 0x83a20929  ! 35: FMULs	fmuls	%f8, %f9, %f1
	.word 0xc3ea297c  ! 36: PREFETCHA_I	prefetcha	[%r8, + 0x097c] %asi, #one_read
	.word 0x8143c000  ! 37: STBAR	stbar
	.word 0xc8320009  ! 39: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc8020009  ! 39: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xb1220009  ! 40: MULScc_R	mulscc 	%r8, %r9, %r24
	.word 0xc3f21009  ! 41: CASXA_I	casxa	[%r8] 0x80, %r9, %r1
	.word 0xc8ea22c8  ! 42: LDSTUBA_I	ldstuba	%r4, [%r8 + 0x02c8] %asi
	.word 0x8f222d44  ! 43: MULScc_I	mulscc 	%r8, 0x0d44, %r7
	.word 0x8143e03d  ! 44: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0x8143c000  ! 45: STBAR	stbar
	.word 0xccfa1009  ! 46: SWAPA_R	swapa	%r6, [%r8 + %r9] 0x80
	.word 0x8fa20929  ! 47: FMULs	fmuls	%f8, %f9, %f7
	.word 0xc93a2028  ! 48: STDF_I	std	%f4, [0x0028, %r8]
	.word 0xf8ea23d8  ! 49: LDSTUBA_I	ldstuba	%r28, [%r8 + 0x03d8] %asi
	.word 0xa86a0009  ! 50: UDIVX_R	udivx 	%r8, %r9, %r20
	.word 0xbda209a9  ! 51: FDIVs	fdivs	%f8, %f9, %f30
	.word 0xc6320009  ! 53: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc44a0009  ! 53: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0x8143c000  ! 54: STBAR	stbar
	.word 0x8ba20929  ! 55: FMULs	fmuls	%f8, %f9, %f5
	.word 0xc82a0009  ! 57: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xce5a0009  ! 57: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0x976a2f44  ! 58: SDIVX_I	sdivx	%r8, 0x0f44, %r11
	.word 0xc3ea1009  ! 59: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x8ad22320  ! 60: UMULcc_I	umulcc 	%r8, 0x0320, %r5
	.word 0xeb2221c0  ! 61: STF_I	st	%f21, [0x01c0, %r8]
	.word 0x8143c000  ! 62: STBAR	stbar
	.word 0x8143e04e  ! 63: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Sync 
	.word 0xda6a0009  ! 64: LDSTUB_R	ldstub	%r13, [%r8 + %r9]
	.word 0xccea2dec  ! 65: LDSTUBA_I	ldstuba	%r6, [%r8 + 0x0dec] %asi
	.word 0x8143e057  ! 66: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside | #Sync 
	.word 0xcbf22009  ! 67: CASXA_R	casxa	[%r8]%asi, %r9, %r5
	.word 0x86fa0009  ! 68: SDIVcc_R	sdivcc 	%r8, %r9, %r3
	.word 0xc2720009  ! 70: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xca0a0009  ! 70: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xb26a27b4  ! 71: UDIVX_I	udivx 	%r8, 0x07b4, %r25
	.word 0x876a0009  ! 72: SDIVX_R	sdivx	%r8, %r9, %r3
	.word 0xc48a226c  ! 73: LDUBA_I	lduba	[%r8, + 0x026c] %asi, %r2
	.word 0xc2b222cc  ! 74: STHA_I	stha	%r1, [%r8 + 0x02cc] %asi
	.word 0xccaa1009  ! 75: STBA_R	stba	%r6, [%r8 + %r9] 0x80
	.word 0xcc220009  ! 77: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc81a0009  ! 77: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xc3ea1009  ! 78: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x8143e02e  ! 79: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #MemIssue 
	.word 0xc9222fdc  ! 80: STF_I	st	%f4, [0x0fdc, %r8]
	.word 0x896a0009  ! 81: SDIVX_R	sdivx	%r8, %r9, %r4
	.word 0xcd020009  ! 82: LDF_R	ld	[%r8, %r9], %f6
	.word 0xc3ea1009  ! 83: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xd62a0009  ! 85: STB_R	stb	%r11, [%r8 + %r9]
	.word 0xec120009  ! 85: LDUH_R	lduh	[%r8 + %r9], %r22
	.word 0xf00a2290  ! 86: LDUB_I	ldub	[%r8 + 0x0290], %r24
	.word 0x86fa2ed8  ! 87: SDIVcc_I	sdivcc 	%r8, 0x0ed8, %r3
	.word 0xc62a0009  ! 89: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xdc520009  ! 89: LDSH_R	ldsh	[%r8 + %r9], %r14
	.word 0xc4a21009  ! 90: STWA_R	stwa	%r2, [%r8 + %r9] 0x80
	.word 0x8143e008  ! 91: MEMBAR	membar	#StoreStore 
	.word 0x8143c000  ! 92: STBAR	stbar
	.word 0x20800002  ! 93: BN	bn,a	<label_0x2>
	.word 0xc26a0009  ! 94: LDSTUB_R	ldstub	%r1, [%r8 + %r9]
	.word 0x99a209a9  ! 95: FDIVs	fdivs	%f8, %f9, %f12
	.word 0xf4821009  ! 96: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r26
	.word 0xcc220009  ! 98: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xe4020009  ! 98: LDUW_R	lduw	[%r8 + %r9], %r18
	.word 0xc4f21009  ! 99: STXA_R	stxa	%r2, [%r8 + %r9] 0x80
	.word 0xfd222dd0  ! 100: STF_I	st	%f30, [0x0dd0, %r8]
	.word 0xce2a0009  ! 102: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xda020009  ! 102: LDUW_R	lduw	[%r8 + %r9], %r13
	.word 0xce2a0009  ! 104: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xda020009  ! 104: LDUW_R	lduw	[%r8 + %r9], %r13
	.word 0xc6ea1009  ! 105: LDSTUBA_R	ldstuba	%r3, [%r8 + %r9] 0x80
	.word 0xceda2890  ! 106: LDXA_I	ldxa	[%r8, + 0x0890] %asi, %r7
	.word 0x2ac20001  ! 107: BRNZ	brnz,a,nt	%8,<label_0x20001>
	.word 0xce220009  ! 109: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xda0a0009  ! 109: LDUB_R	ldub	[%r8 + %r9], %r13
	.word 0xc46a24ec  ! 110: LDSTUB_I	ldstub	%r2, [%r8 + 0x04ec]
	.word 0xc22a0009  ! 112: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc7020009  ! 112: LDF_R	ld	[%r8, %r9], %f3
	.word 0xc6720009  ! 114: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xf41a0009  ! 114: LDD_R	ldd	[%r8 + %r9], %r26
	.word 0xc0ba1009  ! 115: STDA_R	stda	%r0, [%r8 + %r9] 0x80
	.word 0xfc2a0009  ! 117: STB_R	stb	%r30, [%r8 + %r9]
	.word 0xc4420009  ! 117: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xaafa208c  ! 118: SDIVcc_I	sdivcc 	%r8, 0x008c, %r21
	.word 0xc36a2acc  ! 119: PREFETCH_I	prefetch	[%r8 + 0x0acc], #one_read
	.word 0x06800001  ! 120: BL	bl  	<label_0x1>
	.word 0xedf21009  ! 121: CASXA_I	casxa	[%r8] 0x80, %r9, %r22
	.word 0xca520009  ! 122: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xccd22298  ! 123: LDSHA_I	ldsha	[%r8, + 0x0298] %asi, %r6
	.word 0x8143e018  ! 124: MEMBAR	membar	#StoreStore | #Lookaside 
	.word 0xca320009  ! 126: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc4020009  ! 126: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xde320009  ! 128: STH_R	sth	%r15, [%r8 + %r9]
	.word 0xc4120009  ! 128: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xc25a2820  ! 129: LDX_I	ldx	[%r8 + 0x0820], %r1
	.word 0xe0f22b40  ! 130: STXA_I	stxa	%r16, [%r8 + 0x0b40] %asi
	.word 0xf4a22608  ! 131: STWA_I	stwa	%r26, [%r8 + 0x0608] %asi
	.word 0xd86a0009  ! 132: LDSTUB_R	ldstub	%r12, [%r8 + %r9]
	.word 0xce320009  ! 134: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xdc5a0009  ! 134: LDX_R	ldx	[%r8 + %r9], %r14
	.word 0x14800001  ! 135: BG	bg  	<label_0x1>
	.word 0x0eca0001  ! 136: BRGEZ	brgez  ,pt	%8,<label_0xa0001>
	.word 0xccd21009  ! 137: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r6
	.word 0xc3ea1009  ! 138: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc36a2058  ! 139: PREFETCH_I	prefetch	[%r8 + 0x0058], #one_read
	.word 0x8e520009  ! 140: UMUL_R	umul 	%r8, %r9, %r7
	.word 0xb8d22724  ! 141: UMULcc_I	umulcc 	%r8, 0x0724, %r28
	.word 0xc36a2da4  ! 142: PREFETCH_I	prefetch	[%r8 + 0x0da4], #one_read
	.word 0x845a208c  ! 143: SMUL_I	smul 	%r8, 0x008c, %r2
	.word 0xcc220009  ! 145: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xca4a0009  ! 145: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xb2520009  ! 146: UMUL_R	umul 	%r8, %r9, %r25
	.word 0xb67a29b4  ! 147: SDIV_I	sdiv 	%r8, 0x09b4, %r27
	.word 0xc3ea1009  ! 148: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xce4a243c  ! 149: LDSB_I	ldsb	[%r8 + 0x043c], %r7
	.word 0xc3222894  ! 150: STF_I	st	%f1, [0x0894, %r8]
	.word 0xc3ea1009  ! 151: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x8143c000  ! 152: STBAR	stbar
	.word 0x10800002  ! 153: BA	ba  	<label_0x2>
	.word 0x2e800001  ! 154: BVS	bvs,a	<label_0x1>
	.word 0xb7a209a9  ! 155: FDIVs	fdivs	%f8, %f9, %f27
	.word 0xce7a0009  ! 156: SWAP_R	swap	%r7, [%r8 + %r9]
	.word 0x8ba209a9  ! 157: FDIVs	fdivs	%f8, %f9, %f5
	.word 0xd8720009  ! 159: STX_R	stx	%r12, [%r8 + %r9]
	.word 0xce020009  ! 159: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xce2a0009  ! 161: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xf7020009  ! 161: LDF_R	ld	[%r8, %r9], %f27
	.word 0x8143c000  ! 162: STBAR	stbar
	.word 0xccca1009  ! 163: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r6
	.word 0xea320009  ! 165: STH_R	sth	%r21, [%r8 + %r9]
	.word 0xc8020009  ! 165: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xc3ea2208  ! 166: PREFETCHA_I	prefetcha	[%r8, + 0x0208] %asi, #one_read
	.word 0x8a720009  ! 167: UDIV_R	udiv 	%r8, %r9, %r5
	.word 0x8eda2078  ! 168: SMULcc_I	smulcc 	%r8, 0x0078, %r7
	.word 0x12800001  ! 169: BNE	bne  	<label_0x1>
	.word 0xe8822658  ! 170: LDUWA_I	lduwa	[%r8, + 0x0658] %asi, %r20
	.word 0x86f20009  ! 171: UDIVcc_R	udivcc 	%r8, %r9, %r3
	.word 0xf5f22009  ! 172: CASXA_R	casxa	[%r8]%asi, %r9, %r26
	.word 0x8143c000  ! 173: STBAR	stbar
	.word 0x38800002  ! 174: BGU	bgu,a	<label_0x2>
	.word 0xc2ea21d4  ! 175: LDSTUBA_I	ldstuba	%r1, [%r8 + 0x01d4] %asi
	.word 0xc89a26c0  ! 176: LDDA_I	ldda	[%r8, + 0x06c0] %asi, %r4
	.word 0x8143e022  ! 177: MEMBAR	membar	#StoreLoad | #MemIssue 
	.word 0x8ba20829  ! 178: FADDs	fadds	%f8, %f9, %f5
	.word 0xc3ea2854  ! 179: PREFETCHA_I	prefetcha	[%r8, + 0x0854] %asi, #one_read
	.word 0xca2a0009  ! 181: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc3020009  ! 181: LDF_R	ld	[%r8, %r9], %f1
	.word 0xc8822784  ! 182: LDUWA_I	lduwa	[%r8, + 0x0784] %asi, %r4
	.word 0xc3ea2e88  ! 183: PREFETCHA_I	prefetcha	[%r8, + 0x0e88] %asi, #one_read
	.word 0xe6320009  ! 185: STH_R	sth	%r19, [%r8 + %r9]
	.word 0xc3020009  ! 185: LDF_R	ld	[%r8, %r9], %f1
	.word 0x87a209a9  ! 186: FDIVs	fdivs	%f8, %f9, %f3
	.word 0x89220009  ! 187: MULScc_R	mulscc 	%r8, %r9, %r4
	.word 0xf2921009  ! 188: LDUHA_R	lduha	[%r8, %r9] 0x80, %r25
	.word 0xce2a0009  ! 190: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xca5a0009  ! 190: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xc80a0009  ! 191: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xcc320009  ! 193: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xe0120009  ! 193: LDUH_R	lduh	[%r8 + %r9], %r16
	.word 0xc42a0009  ! 195: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc20a0009  ! 195: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0x82520009  ! 196: UMUL_R	umul 	%r8, %r9, %r1
	.word 0x87222798  ! 197: MULScc_I	mulscc 	%r8, 0x0798, %r3
	.word 0xc6f21009  ! 198: STXA_R	stxa	%r3, [%r8 + %r9] 0x80
	.word 0xcf3a2938  ! 199: STDF_I	std	%f7, [0x0938, %r8]
	.word 0x10800001  ! 200: BA	ba  	<label_0x1>
	.word 0xc36a2640  ! 201: PREFETCH_I	prefetch	[%r8 + 0x0640], #one_read
	.word 0xcea226fc  ! 202: STWA_I	stwa	%r7, [%r8 + 0x06fc] %asi
	.word 0xfa120009  ! 203: LDUH_R	lduh	[%r8 + %r9], %r29
	.word 0xcc1a0009  ! 204: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xc8522498  ! 205: LDSH_I	ldsh	[%r8 + 0x0498], %r4
	.word 0xc27a2760  ! 206: SWAP_I	swap	%r1, [%r8 + 0x0760]
	.word 0xc62a0009  ! 208: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc2420009  ! 208: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xdaaa2344  ! 209: STBA_I	stba	%r13, [%r8 + 0x0344] %asi
	.word 0xc36a28a0  ! 210: PREFETCH_I	prefetch	[%r8 + 0x08a0], #one_read
	.word 0x8143e007  ! 211: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore 
	.word 0xc73a0009  ! 213: STDF_R	std	%f3, [%r9, %r8]
	.word 0xe4720009  ! 214: STX_R	stx	%r18, [%r8 + %r9]
	.word 0xd84a0009  ! 214: LDSB_R	ldsb	[%r8 + %r9], %r12
	.word 0x8143c000  ! 215: STBAR	stbar
	.word 0x24ca0001  ! 216: BRLEZ	brlez,a,pt	%8,<label_0xa0001>
	.word 0xf45226f8  ! 217: LDSH_I	ldsh	[%r8 + 0x06f8], %r26
	.word 0x867a0009  ! 218: SDIV_R	sdiv 	%r8, %r9, %r3
	.word 0xf0ba20e0  ! 219: STDA_I	stda	%r24, [%r8 + 0x00e0] %asi
	.word 0xac5226a4  ! 220: UMUL_I	umul 	%r8, 0x06a4, %r22
	.word 0x22c20001  ! 221: BRZ	brz,a,nt	%8,<label_0x20001>
	.word 0xa8722e88  ! 222: UDIV_I	udiv 	%r8, 0x0e88, %r20
	.word 0xca8a1009  ! 223: LDUBA_R	lduba	[%r8, %r9] 0x80, %r5
	.word 0xf86a23cc  ! 224: LDSTUB_I	ldstub	%r28, [%r8 + 0x03cc]
	.word 0xc2720009  ! 226: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xce120009  ! 226: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xc8a21009  ! 227: STWA_R	stwa	%r4, [%r8 + %r9] 0x80
	.word 0xc8220009  ! 229: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xcb1a0009  ! 229: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xc4220009  ! 231: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xf41a0009  ! 231: LDD_R	ldd	[%r8 + %r9], %r26
	.word 0xc46a0009  ! 232: LDSTUB_R	ldstub	%r2, [%r8 + %r9]
	.word 0xd87a0009  ! 233: SWAP_R	swap	%r12, [%r8 + %r9]
	.word 0xc2f22010  ! 234: STXA_I	stxa	%r1, [%r8 + 0x0010] %asi
	.word 0x8da20829  ! 235: FADDs	fadds	%f8, %f9, %f6
	.word 0x0ac20001  ! 236: BRNZ	brnz  ,nt	%8,<label_0x20001>
	.word 0x85220009  ! 237: MULScc_R	mulscc 	%r8, %r9, %r2
	.word 0xce320009  ! 239: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xcd1a0009  ! 239: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0x8143e01e  ! 240: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside 
	.word 0xf33a0009  ! 242: STDF_R	std	%f25, [%r9, %r8]
	.word 0xc2720009  ! 243: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc2120009  ! 243: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0x85a209a9  ! 244: FDIVs	fdivs	%f8, %f9, %f2
	.word 0xfa5a0009  ! 245: LDX_R	ldx	[%r8 + %r9], %r29
	.word 0xc3ea1009  ! 246: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xd8720009  ! 248: STX_R	stx	%r12, [%r8 + %r9]
	.word 0xe64a0009  ! 248: LDSB_R	ldsb	[%r8 + %r9], %r19
	.word 0x8143e06a  ! 249: MEMBAR	membar	#StoreLoad | #StoreStore | #MemIssue | #Sync 
	.word 0x844a0009  ! 250: MULX_R	mulx 	%r8, %r9, %r2
	.word 0xf8ba1009  ! 251: STDA_R	stda	%r28, [%r8 + %r9] 0x80
	.word 0x82da0009  ! 252: SMULcc_R	smulcc 	%r8, %r9, %r1
	.word 0x8143c000  ! 253: STBAR	stbar
	.word 0xc4720009  ! 255: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xcc5a0009  ! 255: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xc8b21009  ! 256: STHA_R	stha	%r4, [%r8 + %r9] 0x80
	.word 0xd6da2258  ! 257: LDXA_I	ldxa	[%r8, + 0x0258] %asi, %r11
	.word 0xccba2118  ! 258: STDA_I	stda	%r6, [%r8 + 0x0118] %asi
	.word 0xe7222aa4  ! 259: STF_I	st	%f19, [0x0aa4, %r8]
	.word 0xb46a0009  ! 260: UDIVX_R	udivx 	%r8, %r9, %r26
	.word 0xc8220009  ! 262: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc8120009  ! 262: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xcc921009  ! 263: LDUHA_R	lduha	[%r8, %r9] 0x80, %r6
	.word 0x88fa0009  ! 264: SDIVcc_R	sdivcc 	%r8, %r9, %r4
	.word 0xc2220009  ! 266: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc6520009  ! 266: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xfe220009  ! 268: STW_R	stw	%r31, [%r8 + %r9]
	.word 0xca4a0009  ! 268: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xc3ea2b50  ! 269: PREFETCHA_I	prefetcha	[%r8, + 0x0b50] %asi, #one_read
	.word 0xe8220009  ! 271: STW_R	stw	%r20, [%r8 + %r9]
	.word 0xc64a0009  ! 271: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xc4f224b8  ! 272: STXA_I	stxa	%r2, [%r8 + 0x04b8] %asi
	.word 0xc3ea1009  ! 273: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc6921009  ! 274: LDUHA_R	lduha	[%r8, %r9] 0x80, %r3
	.word 0xceaa27cc  ! 275: STBA_I	stba	%r7, [%r8 + 0x07cc] %asi
	.word 0x84fa0009  ! 276: SDIVcc_R	sdivcc 	%r8, %r9, %r2
	.word 0xc36a0009  ! 277: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xcf222e10  ! 278: STF_I	st	%f7, [0x0e10, %r8]
	.word 0xe89a1009  ! 279: LDDA_R	ldda	[%r8, %r9] 0x80, %r20
	.word 0xc33a2410  ! 280: STDF_I	std	%f1, [0x0410, %r8]
	.word 0x8143c000  ! 281: STBAR	stbar
	.word 0xc36a25b0  ! 282: PREFETCH_I	prefetch	[%r8 + 0x05b0], #one_read
	.word 0xc3ea2610  ! 283: PREFETCHA_I	prefetcha	[%r8, + 0x0610] %asi, #one_read
	.word 0xcb22292c  ! 284: STF_I	st	%f5, [0x092c, %r8]
	.word 0xd6422998  ! 285: LDSW_I	ldsw	[%r8 + 0x0998], %r11
	.word 0xc4320009  ! 287: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xf45a0009  ! 287: LDX_R	ldx	[%r8 + %r9], %r26
	.word 0xb76a270c  ! 288: SDIVX_I	sdivx	%r8, 0x070c, %r27
	.word 0xc6220009  ! 290: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xf2120009  ! 290: LDUH_R	lduh	[%r8 + %r9], %r25
	.word 0xdc821009  ! 291: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r14
	.word 0xcc4a2490  ! 292: LDSB_I	ldsb	[%r8 + 0x0490], %r6
	.word 0xe9220009  ! 294: STF_R	st	%f20, [%r9, %r8]
	.word 0xca720009  ! 295: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xcc420009  ! 295: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xc26a0009  ! 296: LDSTUB_R	ldstub	%r1, [%r8 + %r9]
	.word 0x8e5a2314  ! 297: SMUL_I	smul 	%r8, 0x0314, %r7
	.word 0xc3ea24d0  ! 298: PREFETCHA_I	prefetcha	[%r8, + 0x04d0] %asi, #one_read
	.word 0xc36a0009  ! 299: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0x846a0009  ! 300: UDIVX_R	udivx 	%r8, %r9, %r2
	.word 0xc8ba2e88  ! 301: STDA_I	stda	%r4, [%r8 + 0x0e88] %asi
	.word 0x824a0009  ! 302: MULX_R	mulx 	%r8, %r9, %r1
	.word 0xcc320009  ! 304: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xca5a0009  ! 304: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xc4720009  ! 306: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xcc020009  ! 306: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xe42a0009  ! 308: STB_R	stb	%r18, [%r8 + %r9]
	.word 0xf41a0009  ! 308: LDD_R	ldd	[%r8 + %r9], %r26
	.word 0xc3ea1009  ! 309: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xe0c22100  ! 310: LDSWA_I	ldswa	[%r8, + 0x0100] %asi, %r16
	.word 0xc7222d5c  ! 311: STF_I	st	%f3, [0x0d5c, %r8]
	.word 0xc3ea1009  ! 312: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x38800001  ! 313: BGU	bgu,a	<label_0x1>
	.word 0xc4ba1009  ! 314: STDA_R	stda	%r2, [%r8 + %r9] 0x80
	.word 0xc36a2540  ! 315: PREFETCH_I	prefetch	[%r8 + 0x0540], #one_read
	.word 0xceea1009  ! 316: LDSTUBA_R	ldstuba	%r7, [%r8 + %r9] 0x80
	.word 0xc36a2994  ! 317: PREFETCH_I	prefetch	[%r8 + 0x0994], #one_read
	.word 0xc6220009  ! 319: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc6520009  ! 319: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xe26a2f40  ! 320: LDSTUB_I	ldstub	%r17, [%r8 + 0x0f40]
	.word 0xc36a0009  ! 321: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0x8143e05c  ! 322: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0x14800001  ! 323: BG	bg  	<label_0x1>
	.word 0xda821009  ! 324: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r13
	.word 0xc36a2668  ! 325: PREFETCH_I	prefetch	[%r8 + 0x0668], #one_read
	.word 0xce4a2c40  ! 326: LDSB_I	ldsb	[%r8 + 0x0c40], %r7
	.word 0x8143e020  ! 327: MEMBAR	membar	#MemIssue 
	.word 0x82da2f94  ! 328: SMULcc_I	smulcc 	%r8, 0x0f94, %r1
	.word 0xc4522bd4  ! 329: LDSH_I	ldsh	[%r8 + 0x0bd4], %r2
	.word 0xfe2a0009  ! 331: STB_R	stb	%r31, [%r8 + %r9]
	.word 0xee020009  ! 331: LDUW_R	lduw	[%r8 + %r9], %r23
	.word 0x886a2208  ! 332: UDIVX_I	udivx 	%r8, 0x0208, %r4
	.word 0x22c20001  ! 333: BRZ	brz,a,nt	%8,<label_0x20001>
	.word 0xca220009  ! 335: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc2020009  ! 335: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xce522c20  ! 336: LDSH_I	ldsh	[%r8 + 0x0c20], %r7
	.word 0xea122a20  ! 337: LDUH_I	lduh	[%r8 + 0x0a20], %r21
	.word 0xdb220009  ! 339: STF_R	st	%f13, [%r9, %r8]
	.word 0xca720009  ! 340: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xf5020009  ! 340: LDF_R	ld	[%r8, %r9], %f26
	.word 0x83a20929  ! 341: FMULs	fmuls	%f8, %f9, %f1
	.word 0xfcba2308  ! 342: STDA_I	stda	%r30, [%r8 + 0x0308] %asi
	.word 0xda8a1009  ! 343: LDUBA_R	lduba	[%r8, %r9] 0x80, %r13
	.word 0xc3ea1009  ! 344: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x26800002  ! 345: BL	bl,a	<label_0x2>
	.word 0xe6220009  ! 347: STW_R	stw	%r19, [%r8 + %r9]
	.word 0xe8520009  ! 347: LDSH_R	ldsh	[%r8 + %r9], %r20
	.word 0xc3ea2174  ! 348: PREFETCHA_I	prefetcha	[%r8, + 0x0174] %asi, #one_read
	.word 0xc2720009  ! 350: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc40a0009  ! 350: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xc8f21009  ! 351: STXA_R	stxa	%r4, [%r8 + %r9] 0x80
	.word 0x8143e048  ! 352: MEMBAR	membar	#StoreStore | #Sync 
	.word 0x0cc20001  ! 353: BRGZ	brgz  ,nt	%8,<label_0x20001>
	.word 0xc3ea1009  ! 354: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc8ba2008  ! 355: STDA_I	stda	%r4, [%r8 + 0x0008] %asi
	.word 0xc3e22009  ! 356: CASA_R	casa	[%r8] %asi, %r9, %r1
	.word 0x8b6a2b38  ! 357: SDIVX_I	sdivx	%r8, 0x0b38, %r5
	.word 0x86fa24c8  ! 358: SDIVcc_I	sdivcc 	%r8, 0x04c8, %r3
	.word 0x8143c000  ! 359: STBAR	stbar
	.word 0xcf22235c  ! 360: STF_I	st	%f7, [0x035c, %r8]
	.word 0xf0f21009  ! 361: STXA_R	stxa	%r24, [%r8 + %r9] 0x80
	.word 0xc8022598  ! 362: LDUW_I	lduw	[%r8 + 0x0598], %r4
	.word 0xe9f22009  ! 363: CASXA_R	casxa	[%r8]%asi, %r9, %r20
	.word 0x9cf20009  ! 364: UDIVcc_R	udivcc 	%r8, %r9, %r14
	.word 0xc4a2243c  ! 365: STWA_I	stwa	%r2, [%r8 + 0x043c] %asi
	.word 0x8143c000  ! 366: STBAR	stbar
	.word 0x8c5a0009  ! 367: SMUL_R	smul 	%r8, %r9, %r6
	.word 0xc6020009  ! 368: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xc8da25b8  ! 369: LDXA_I	ldxa	[%r8, + 0x05b8] %asi, %r4
	.word 0x82f20009  ! 370: UDIVcc_R	udivcc 	%r8, %r9, %r1
	.word 0x1e800001  ! 371: BVC	bvc  	<label_0x1>
	.word 0xee6a0009  ! 372: LDSTUB_R	ldstub	%r23, [%r8 + %r9]
	.word 0xc3ea2f30  ! 373: PREFETCHA_I	prefetcha	[%r8, + 0x0f30] %asi, #one_read
	.word 0x8b220009  ! 374: MULScc_R	mulscc 	%r8, %r9, %r5
	.word 0xc3ea2dcc  ! 375: PREFETCHA_I	prefetcha	[%r8, + 0x0dcc] %asi, #one_read
	.word 0xc22a0009  ! 377: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc64a0009  ! 377: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xf07a25c8  ! 378: SWAP_I	swap	%r24, [%r8 + 0x05c8]
	.word 0xce522c38  ! 379: LDSH_I	ldsh	[%r8 + 0x0c38], %r7
	.word 0xc8720009  ! 381: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc4120009  ! 381: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xfe6a0009  ! 382: LDSTUB_R	ldstub	%r31, [%r8 + %r9]
	.word 0xe8522650  ! 383: LDSH_I	ldsh	[%r8 + 0x0650], %r20
	.word 0x34800001  ! 384: BG	bg,a	<label_0x1>
	.word 0xc4ba1009  ! 385: STDA_R	stda	%r2, [%r8 + %r9] 0x80
	.word 0x8c4a2504  ! 386: MULX_I	mulx 	%r8, 0x0504, %r6
	.word 0xcc2a0009  ! 388: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc84a0009  ! 388: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xc81a2ed8  ! 389: LDD_I	ldd	[%r8 + 0x0ed8], %r4
	.word 0xc3ea1009  ! 390: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc2822f2c  ! 391: LDUWA_I	lduwa	[%r8, + 0x0f2c] %asi, %r1
	.word 0xcc922ac0  ! 392: LDUHA_I	lduha	[%r8, + 0x0ac0] %asi, %r6
	.word 0x3a800001  ! 393: BCC	bcc,a	<label_0x1>
	.word 0xd6320009  ! 395: STH_R	sth	%r11, [%r8 + %r9]
	.word 0xda120009  ! 395: LDUH_R	lduh	[%r8 + %r9], %r13
	.word 0x84da0009  ! 396: SMULcc_R	smulcc 	%r8, %r9, %r2
	.word 0xf2fa27fc  ! 397: SWAPA_I	swapa	%r25, [%r8 + 0x07fc] %asi
	.word 0x864a0009  ! 398: MULX_R	mulx 	%r8, %r9, %r3
	.word 0xe67a2d54  ! 399: SWAP_I	swap	%r19, [%r8 + 0x0d54]
	.word 0xc42a0009  ! 401: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xf3020009  ! 401: LDF_R	ld	[%r8, %r9], %f25
	.word 0x16800001  ! 402: BGE	bge  	<label_0x1>
	.word 0xeef22370  ! 403: STXA_I	stxa	%r23, [%r8 + 0x0370] %asi
	.word 0xccba20d8  ! 404: STDA_I	stda	%r6, [%r8 + 0x00d8] %asi
	.word 0xae4a2000  ! 405: MULX_I	mulx 	%r8, 0x0000, %r23
	.word 0xc85a0009  ! 406: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xc88226a8  ! 407: LDUWA_I	lduwa	[%r8, + 0x06a8] %asi, %r4
	.word 0xc3ea1009  ! 408: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x83222f00  ! 409: MULScc_I	mulscc 	%r8, 0x0f00, %r1
	.word 0x8fa20929  ! 410: FMULs	fmuls	%f8, %f9, %f7
	.word 0x867a25fc  ! 411: SDIV_I	sdiv 	%r8, 0x05fc, %r3
	.word 0x24800002  ! 412: BLE	ble,a	<label_0x2>
	.word 0xbad225e8  ! 413: UMULcc_I	umulcc 	%r8, 0x05e8, %r29
	.word 0xc87a0009  ! 414: SWAP_R	swap	%r4, [%r8 + %r9]
	.word 0x0a800001  ! 415: BCS	bcs  	<label_0x1>
	.word 0xc9222e2c  ! 416: STF_I	st	%f4, [0x0e2c, %r8]
	.word 0xf2720009  ! 418: STX_R	stx	%r25, [%r8 + %r9]
	.word 0xc80a0009  ! 418: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xca220009  ! 420: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc2520009  ! 420: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xdc2a0009  ! 422: STB_R	stb	%r14, [%r8 + %r9]
	.word 0xca4a0009  ! 422: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0x86722a38  ! 423: UDIV_I	udiv 	%r8, 0x0a38, %r3
	.word 0xc73a2ec8  ! 424: STDF_I	std	%f3, [0x0ec8, %r8]
	.word 0x8143c000  ! 425: STBAR	stbar
	.word 0x846a27a4  ! 426: UDIVX_I	udivx 	%r8, 0x07a4, %r2
	.word 0xf2d21009  ! 427: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r25
	.word 0xc0ba2980  ! 428: STDA_I	stda	%r0, [%r8 + 0x0980] %asi
	.word 0x22800001  ! 429: BE	be,a	<label_0x1>
	.word 0x02ca0001  ! 430: BRZ	brz  ,pt	%8,<label_0xa0001>
	.word 0x8a5a0009  ! 431: SMUL_R	smul 	%r8, %r9, %r5
	.word 0xc42a0009  ! 433: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xf41a0009  ! 433: LDD_R	ldd	[%r8 + %r9], %r26
	.word 0x0cc20001  ! 434: BRGZ	brgz  ,nt	%8,<label_0x20001>
	.word 0x1c800001  ! 435: BPOS	bpos  	<label_0x1>
	.word 0xcf3a2660  ! 436: STDF_I	std	%f7, [0x0660, %r8]
	.word 0xc36a0009  ! 437: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xec4a285c  ! 438: LDSB_I	ldsb	[%r8 + 0x085c], %r22
	.word 0x84d20009  ! 439: UMULcc_R	umulcc 	%r8, %r9, %r2
	.word 0x8143e07d  ! 440: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xc4220009  ! 442: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xef020009  ! 442: LDF_R	ld	[%r8, %r9], %f23
	.word 0xfe821009  ! 443: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r31
	.word 0xf33a0009  ! 445: STDF_R	std	%f25, [%r9, %r8]
	.word 0xfa720009  ! 446: STX_R	stx	%r29, [%r8 + %r9]
	.word 0xee0a0009  ! 446: LDUB_R	ldub	[%r8 + %r9], %r23
	.word 0xc66a2158  ! 447: LDSTUB_I	ldstub	%r3, [%r8 + 0x0158]
	.word 0xcf222fa4  ! 448: STF_I	st	%f7, [0x0fa4, %r8]
	.word 0xc51a0009  ! 449: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xca220009  ! 451: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc91a0009  ! 451: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xf60a2c68  ! 452: LDUB_I	ldub	[%r8 + 0x0c68], %r27
	.word 0xcaaa270c  ! 453: STBA_I	stba	%r5, [%r8 + 0x070c] %asi
	.word 0xc4822a4c  ! 454: LDUWA_I	lduwa	[%r8, + 0x0a4c] %asi, %r2
	.word 0x8e520009  ! 455: UMUL_R	umul 	%r8, %r9, %r7
	.word 0xccfa2f44  ! 456: SWAPA_I	swapa	%r6, [%r8 + 0x0f44] %asi
	.word 0x8143e068  ! 457: MEMBAR	membar	#StoreStore | #MemIssue | #Sync 
	.word 0x02800001  ! 458: BE	be  	<label_0x1>
	.word 0xe93a2d60  ! 459: STDF_I	std	%f20, [0x0d60, %r8]
	.word 0xc36a0009  ! 460: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc25a0009  ! 461: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0x8143c000  ! 462: STBAR	stbar
	.word 0xcc4a2494  ! 463: LDSB_I	ldsb	[%r8 + 0x0494], %r6
	.word 0xe4420009  ! 464: LDSW_R	ldsw	[%r8 + %r9], %r18
	.word 0x83a208a9  ! 465: FSUBs	fsubs	%f8, %f9, %f1
	.word 0xc3ea2840  ! 466: PREFETCHA_I	prefetcha	[%r8, + 0x0840] %asi, #one_read
	.word 0xc36a2a88  ! 467: PREFETCH_I	prefetch	[%r8 + 0x0a88], #one_read
	.word 0xb05a0009  ! 468: SMUL_R	smul 	%r8, %r9, %r24
	.word 0xc4da2750  ! 469: LDXA_I	ldxa	[%r8, + 0x0750] %asi, %r2
	.word 0xf6b21009  ! 470: STHA_R	stha	%r27, [%r8 + %r9] 0x80
	.word 0xc3ea29f0  ! 471: PREFETCHA_I	prefetcha	[%r8, + 0x09f0] %asi, #one_read
	.word 0xc4220009  ! 473: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xe7020009  ! 473: LDF_R	ld	[%r8, %r9], %f19
	.word 0xd6ea2018  ! 474: LDSTUBA_I	ldstuba	%r11, [%r8 + 0x0018] %asi
	.word 0x8143c000  ! 475: STBAR	stbar
	.word 0x8143c000  ! 476: STBAR	stbar
	.word 0x8143e008  ! 477: MEMBAR	membar	#StoreStore 
	.word 0xbefa0009  ! 478: SDIVcc_R	sdivcc 	%r8, %r9, %r31
	.word 0xc3ea1009  ! 479: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xcc7a0009  ! 480: SWAP_R	swap	%r6, [%r8 + %r9]
	.word 0xc3220009  ! 482: STF_R	st	%f1, [%r9, %r8]
	.word 0xc8720009  ! 483: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xf1020009  ! 483: LDF_R	ld	[%r8, %r9], %f24
	.word 0xca320009  ! 485: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xee020009  ! 485: LDUW_R	lduw	[%r8 + %r9], %r23
	.word 0xf4220009  ! 487: STW_R	stw	%r26, [%r8 + %r9]
	.word 0xd6520009  ! 487: LDSH_R	ldsh	[%r8 + %r9], %r11
	.word 0xc41a0009  ! 488: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xfec21009  ! 489: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r31
	.word 0x82d20009  ! 490: UMULcc_R	umulcc 	%r8, %r9, %r1
	.word 0xf2320009  ! 492: STH_R	sth	%r25, [%r8 + %r9]
	.word 0xfc1a0009  ! 492: LDD_R	ldd	[%r8 + %r9], %r30
	.word 0xca6a0009  ! 493: LDSTUB_R	ldstub	%r5, [%r8 + %r9]
	.word 0xeea21009  ! 494: STWA_R	stwa	%r23, [%r8 + %r9] 0x80
	.word 0xc2c21009  ! 495: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r1
	.word 0xc2822438  ! 496: LDUWA_I	lduwa	[%r8, + 0x0438] %asi, %r1
	.word 0xa2da0009  ! 497: SMULcc_R	smulcc 	%r8, %r9, %r17
	.word 0xc47a0009  ! 498: SWAP_R	swap	%r2, [%r8 + %r9]
	.word 0xc8aa2e20  ! 499: STBA_I	stba	%r4, [%r8 + 0x0e20] %asi
	.word 0xccea1009  ! 500: LDSTUBA_R	ldstuba	%r6, [%r8 + %r9] 0x80
	.word 0xf53a2d08  ! 501: STDF_I	std	%f26, [0x0d08, %r8]
	.word 0xcc420009  ! 502: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xc6f22268  ! 503: STXA_I	stxa	%r3, [%r8 + 0x0268] %asi
	.word 0xa04a2d24  ! 504: MULX_I	mulx 	%r8, 0x0d24, %r16
	.word 0xc27a2ea0  ! 505: SWAP_I	swap	%r1, [%r8 + 0x0ea0]
	.word 0xc5220009  ! 507: STF_R	st	%f2, [%r9, %r8]
	.word 0xc8720009  ! 508: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xcc120009  ! 508: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0x2eca0001  ! 509: BRGEZ	brgez,a,pt	%8,<label_0xa0001>
	.word 0xba520009  ! 510: UMUL_R	umul 	%r8, %r9, %r29
	.word 0xc2320009  ! 512: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc01a0009  ! 512: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0xc53a0009  ! 514: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc2720009  ! 515: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc7020009  ! 515: LDF_R	ld	[%r8, %r9], %f3
	.word 0xc6aa2eb8  ! 516: STBA_I	stba	%r3, [%r8 + 0x0eb8] %asi
	.word 0xec82279c  ! 517: LDUWA_I	lduwa	[%r8, + 0x079c] %asi, %r22
	.word 0xc36a2754  ! 518: PREFETCH_I	prefetch	[%r8 + 0x0754], #one_read
	.word 0x88d22dac  ! 519: UMULcc_I	umulcc 	%r8, 0x0dac, %r4
	.word 0xc2fa2e84  ! 520: SWAPA_I	swapa	%r1, [%r8 + 0x0e84] %asi
	.word 0xc81a0009  ! 521: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xc3e22009  ! 522: CASA_R	casa	[%r8] %asi, %r9, %r1
	.word 0x8143c000  ! 523: STBAR	stbar
	.word 0xc2320009  ! 525: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xea0a0009  ! 525: LDUB_R	ldub	[%r8 + %r9], %r21
	.word 0xcaaa21c8  ! 526: STBA_I	stba	%r5, [%r8 + 0x01c8] %asi
	.word 0xc01a2050  ! 527: LDD_I	ldd	[%r8 + 0x0050], %r0
	.word 0xca821009  ! 528: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r5
	.word 0x836a2fb8  ! 529: SDIVX_I	sdivx	%r8, 0x0fb8, %r1
	.word 0xe0320009  ! 531: STH_R	sth	%r16, [%r8 + %r9]
	.word 0xc65a0009  ! 531: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xcb1a0009  ! 532: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xfe5a2870  ! 533: LDX_I	ldx	[%r8 + 0x0870], %r31
	.word 0x88720009  ! 534: UDIV_R	udiv 	%r8, %r9, %r4
	.word 0xce220009  ! 536: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xca420009  ! 536: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0x8143c000  ! 537: STBAR	stbar
	.word 0xca220009  ! 539: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xdc420009  ! 539: LDSW_R	ldsw	[%r8 + %r9], %r14
	.word 0xde2a0009  ! 541: STB_R	stb	%r15, [%r8 + %r9]
	.word 0xcc420009  ! 541: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xc9f22009  ! 542: CASXA_R	casxa	[%r8]%asi, %r9, %r4
	.word 0x8143e027  ! 543: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #MemIssue 
	.word 0x9b22287c  ! 544: MULScc_I	mulscc 	%r8, 0x087c, %r13
	.word 0xb1a208a9  ! 545: FSUBs	fsubs	%f8, %f9, %f24
	.word 0xc3ea23bc  ! 546: PREFETCHA_I	prefetcha	[%r8, + 0x03bc] %asi, #one_read
	.word 0xc3ea1009  ! 547: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc36a2300  ! 548: PREFETCH_I	prefetch	[%r8 + 0x0300], #one_read
	.word 0xca120009  ! 549: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0x8143e06a  ! 550: MEMBAR	membar	#StoreLoad | #StoreStore | #MemIssue | #Sync 
	.word 0xc6822f70  ! 551: LDUWA_I	lduwa	[%r8, + 0x0f70] %asi, %r3
	.word 0xfdf21009  ! 552: CASXA_I	casxa	[%r8] 0x80, %r9, %r30
	.word 0x40000001  ! 553: CALL	call	disp30_1
	.word 0xc4220009  ! 555: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xda0a0009  ! 555: LDUB_R	ldub	[%r8 + %r9], %r13
	.word 0xe2c229c0  ! 556: LDSWA_I	ldswa	[%r8, + 0x09c0] %asi, %r17
	.word 0xc36a289c  ! 557: PREFETCH_I	prefetch	[%r8 + 0x089c], #one_read
	.word 0xf8720009  ! 559: STX_R	stx	%r28, [%r8 + %r9]
	.word 0xc4420009  ! 559: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xc73a2058  ! 560: STDF_I	std	%f3, [0x0058, %r8]
	.word 0x8143e077  ! 561: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside | #MemIssue | #Sync 
	.word 0x86fa0009  ! 562: SDIVcc_R	sdivcc 	%r8, %r9, %r3
	.word 0x82522958  ! 563: UMUL_I	umul 	%r8, 0x0958, %r1
	.word 0xc8220009  ! 565: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xd81a0009  ! 565: LDD_R	ldd	[%r8 + %r9], %r12
	.word 0x8fa20829  ! 566: FADDs	fadds	%f8, %f9, %f7
	.word 0xcfe22009  ! 567: CASA_R	casa	[%r8] %asi, %r9, %r7
	.word 0xda220009  ! 569: STW_R	stw	%r13, [%r8 + %r9]
	.word 0xee020009  ! 569: LDUW_R	lduw	[%r8 + %r9], %r23
	.word 0xc2220009  ! 571: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xca420009  ! 571: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xcd222ce0  ! 572: STF_I	st	%f6, [0x0ce0, %r8]
	.word 0xc3ea1009  ! 573: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc8220009  ! 575: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xca420009  ! 575: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xc36a24c8  ! 576: PREFETCH_I	prefetch	[%r8 + 0x04c8], #one_read
	.word 0x8e5a0009  ! 577: SMUL_R	smul 	%r8, %r9, %r7
	.word 0xc4a21009  ! 578: STWA_R	stwa	%r2, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 579: STBAR	stbar
	.word 0xc722274c  ! 580: STF_I	st	%f3, [0x074c, %r8]
	.word 0x24ca0001  ! 581: BRLEZ	brlez,a,pt	%8,<label_0xa0001>
	.word 0xc5f22009  ! 582: CASXA_R	casxa	[%r8]%asi, %r9, %r2
	.word 0xf82a0009  ! 584: STB_R	stb	%r28, [%r8 + %r9]
	.word 0xec4a0009  ! 584: LDSB_R	ldsb	[%r8 + %r9], %r22
	.word 0xc3ea1009  ! 585: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x32800001  ! 586: BNE	bne,a	<label_0x1>
	.word 0xc8120009  ! 587: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xe0320009  ! 589: STH_R	sth	%r16, [%r8 + %r9]
	.word 0xc6520009  ! 589: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xca6a0009  ! 590: LDSTUB_R	ldstub	%r5, [%r8 + %r9]
	.word 0xc46a0009  ! 591: LDSTUB_R	ldstub	%r2, [%r8 + %r9]
	.word 0x8ef20009  ! 592: UDIVcc_R	udivcc 	%r8, %r9, %r7
	.word 0xce8a2d00  ! 593: LDUBA_I	lduba	[%r8, + 0x0d00] %asi, %r7
	.word 0xca82226c  ! 594: LDUWA_I	lduwa	[%r8, + 0x026c] %asi, %r5
	.word 0x8f2225c0  ! 595: MULScc_I	mulscc 	%r8, 0x05c0, %r7
	.word 0x8143e051  ! 596: MEMBAR	membar	#LoadLoad | #Lookaside | #Sync 
	.word 0xf6422a94  ! 597: LDSW_I	ldsw	[%r8 + 0x0a94], %r27
	.word 0x9ba20829  ! 598: FADDs	fadds	%f8, %f9, %f13
	.word 0xc9f22009  ! 599: CASXA_R	casxa	[%r8]%asi, %r9, %r4
	.word 0x8fa20829  ! 600: FADDs	fadds	%f8, %f9, %f7
	.word 0xf8ba1009  ! 601: STDA_R	stda	%r28, [%r8 + %r9] 0x80
	.word 0x2aca0001  ! 602: BRNZ	brnz,a,pt	%8,<label_0xa0001>
	.word 0xc8c22b5c  ! 603: LDSWA_I	ldswa	[%r8, + 0x0b5c] %asi, %r4
	.word 0x84520009  ! 604: UMUL_R	umul 	%r8, %r9, %r2
	.word 0x8143e066  ! 605: MEMBAR	membar	#StoreLoad | #LoadStore | #MemIssue | #Sync 
	.word 0xc68a22dc  ! 606: LDUBA_I	lduba	[%r8, + 0x02dc] %asi, %r3
	.word 0xc36a0009  ! 607: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xebf22009  ! 608: CASXA_R	casxa	[%r8]%asi, %r9, %r21
	.word 0x8143e01d  ! 609: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside 
	.word 0xc3ea2c5c  ! 610: PREFETCHA_I	prefetcha	[%r8, + 0x0c5c] %asi, #one_read
	.word 0xc36a2540  ! 611: PREFETCH_I	prefetch	[%r8 + 0x0540], #one_read
	.word 0x847a2dc0  ! 612: SDIV_I	sdiv 	%r8, 0x0dc0, %r2
	.word 0xc4220009  ! 614: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc85a0009  ! 614: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xc4a21009  ! 615: STWA_R	stwa	%r2, [%r8 + %r9] 0x80
	.word 0xc8a22cb4  ! 616: STWA_I	stwa	%r4, [%r8 + 0x0cb4] %asi
	.word 0xc36a2448  ! 617: PREFETCH_I	prefetch	[%r8 + 0x0448], #one_read
	.word 0x8143c000  ! 618: STBAR	stbar
	.word 0xc4fa1009  ! 619: SWAPA_R	swapa	%r2, [%r8 + %r9] 0x80
	.word 0xc3ea1009  ! 620: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x89220009  ! 621: MULScc_R	mulscc 	%r8, %r9, %r4
	.word 0xc6220009  ! 623: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xfe5a0009  ! 623: LDX_R	ldx	[%r8 + %r9], %r31
	.word 0xca6a21f4  ! 624: LDSTUB_I	ldstub	%r5, [%r8 + 0x01f4]
	.word 0xc3220009  ! 626: STF_R	st	%f1, [%r9, %r8]
	.word 0xdc720009  ! 627: STX_R	stx	%r14, [%r8 + %r9]
	.word 0xc4520009  ! 627: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0x8e520009  ! 628: UMUL_R	umul 	%r8, %r9, %r7
	.word 0xc3ea2814  ! 629: PREFETCHA_I	prefetcha	[%r8, + 0x0814] %asi, #one_read
	.word 0x86fa24cc  ! 630: SDIVcc_I	sdivcc 	%r8, 0x04cc, %r3
	.word 0xc4c21009  ! 631: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r2
	.word 0x856a282c  ! 632: SDIVX_I	sdivx	%r8, 0x082c, %r2
	.word 0xe13a2ec8  ! 633: STDF_I	std	%f16, [0x0ec8, %r8]
	.word 0xc42a0009  ! 635: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xea420009  ! 635: LDSW_R	ldsw	[%r8 + %r9], %r21
	.word 0xc9222928  ! 636: STF_I	st	%f4, [0x0928, %r8]
	.word 0xc2922a84  ! 637: LDUHA_I	lduha	[%r8, + 0x0a84] %asi, %r1
	.word 0xcaf21009  ! 638: STXA_R	stxa	%r5, [%r8 + %r9] 0x80
	.word 0xc3ea1009  ! 639: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc2ea29b8  ! 640: LDSTUBA_I	ldstuba	%r1, [%r8 + 0x09b8] %asi
	.word 0x8472247c  ! 641: UDIV_I	udiv 	%r8, 0x047c, %r2
	.word 0xcec220f8  ! 642: LDSWA_I	ldswa	[%r8, + 0x00f8] %asi, %r7
	.word 0xc36a245c  ! 643: PREFETCH_I	prefetch	[%r8 + 0x045c], #one_read
	.word 0x8cd22e08  ! 644: UMULcc_I	umulcc 	%r8, 0x0e08, %r6
	.word 0x8b220009  ! 645: MULScc_R	mulscc 	%r8, %r9, %r5
	.word 0x18800001  ! 646: BGU	bgu  	<label_0x1>
	.word 0xdd3a0009  ! 648: STDF_R	std	%f14, [%r9, %r8]
	.word 0xce720009  ! 649: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc41a0009  ! 649: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x896a2a20  ! 650: SDIVX_I	sdivx	%r8, 0x0a20, %r4
	.word 0xba520009  ! 651: UMUL_R	umul 	%r8, %r9, %r29
	.word 0x8a720009  ! 652: UDIV_R	udiv 	%r8, %r9, %r5
	.word 0x00800001  ! 653: BN	bn  	<label_0x1>
	.word 0xcc6a0009  ! 654: LDSTUB_R	ldstub	%r6, [%r8 + %r9]
	.word 0xdb3a23f8  ! 655: STDF_I	std	%f13, [0x03f8, %r8]
	.word 0xce220009  ! 657: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc8120009  ! 657: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0x32800001  ! 658: BNE	bne,a	<label_0x1>
	.word 0x864a0009  ! 659: MULX_R	mulx 	%r8, %r9, %r3
	.word 0xe0ba1009  ! 660: STDA_R	stda	%r16, [%r8 + %r9] 0x80
	.word 0xc82a0009  ! 662: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc9020009  ! 662: LDF_R	ld	[%r8, %r9], %f4
	.word 0xc9220009  ! 664: STF_R	st	%f4, [%r9, %r8]
	.word 0xc4720009  ! 665: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc44a0009  ! 665: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0x8e720009  ! 666: UDIV_R	udiv 	%r8, %r9, %r7
	.word 0x9cd22cfc  ! 667: UMULcc_I	umulcc 	%r8, 0x0cfc, %r14
	.word 0xc7e22009  ! 668: CASA_R	casa	[%r8] %asi, %r9, %r3
	.word 0xca2a0009  ! 670: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc01a0009  ! 670: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0x88720009  ! 671: UDIV_R	udiv 	%r8, %r9, %r4
	.word 0x2cca0001  ! 672: BRGZ	brgz,a,pt	%8,<label_0xa0001>
	.word 0xe02a0009  ! 674: STB_R	stb	%r16, [%r8 + %r9]
	.word 0xc7020009  ! 674: LDF_R	ld	[%r8, %r9], %f3
	.word 0xe81a2c50  ! 675: LDD_I	ldd	[%r8 + 0x0c50], %r20
	.word 0xc36a0009  ! 676: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xcd0224ec  ! 677: LDF_I	ld	[%r8, 0x04ec], %f6
	.word 0x08800001  ! 678: BLEU	bleu  	<label_0x1>
	.word 0xc4ba2b18  ! 679: STDA_I	stda	%r2, [%r8 + 0x0b18] %asi
	.word 0xae4a225c  ! 680: MULX_I	mulx 	%r8, 0x025c, %r23
	.word 0x8143e030  ! 681: MEMBAR	membar	#Lookaside | #MemIssue 
	.word 0xb3a20829  ! 682: FADDs	fadds	%f8, %f9, %f25
	.word 0xf47a2948  ! 683: SWAP_I	swap	%r26, [%r8 + 0x0948]
	.word 0x02c20001  ! 684: BRZ	brz  ,nt	%8,<label_0x20001>
	.word 0x847a0009  ! 685: SDIV_R	sdiv 	%r8, %r9, %r2
	.word 0xf6c21009  ! 686: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r27
	.word 0xd93a0009  ! 688: STDF_R	std	%f12, [%r9, %r8]
	.word 0xf6720009  ! 689: STX_R	stx	%r27, [%r8 + %r9]
	.word 0xc51a0009  ! 689: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xca720009  ! 691: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xf24a0009  ! 691: LDSB_R	ldsb	[%r8 + %r9], %r25
	.word 0xc6b22bfc  ! 692: STHA_I	stha	%r3, [%r8 + 0x0bfc] %asi
	.word 0xc6921009  ! 693: LDUHA_R	lduha	[%r8, %r9] 0x80, %r3
	.word 0xbeda2efc  ! 694: SMULcc_I	smulcc 	%r8, 0x0efc, %r31
	.word 0x8143e04c  ! 695: MEMBAR	membar	#LoadStore | #StoreStore | #Sync 
	.word 0xa3a20829  ! 696: FADDs	fadds	%f8, %f9, %f17
	.word 0xd6ea2a20  ! 697: LDSTUBA_I	ldstuba	%r11, [%r8 + 0x0a20] %asi
	.word 0x8c6a2844  ! 698: UDIVX_I	udivx 	%r8, 0x0844, %r6
	.word 0xc8220009  ! 700: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc41a0009  ! 700: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xc3ea1009  ! 701: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xdc520009  ! 702: LDSH_R	ldsh	[%r8 + %r9], %r14
	.word 0x2a800002  ! 703: BCS	bcs,a	<label_0x2>
	.word 0x8143c000  ! 704: STBAR	stbar
	.word 0xc8a220f4  ! 705: STWA_I	stwa	%r4, [%r8 + 0x00f4] %asi
	.word 0x0eca0001  ! 706: BRGEZ	brgez  ,pt	%8,<label_0xa0001>
	.word 0xc8320009  ! 708: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xee520009  ! 708: LDSH_R	ldsh	[%r8 + %r9], %r23
	.word 0xc7222770  ! 709: STF_I	st	%f3, [0x0770, %r8]
	.word 0x82f22ff4  ! 710: UDIVcc_I	udivcc 	%r8, 0x0ff4, %r1
	.word 0xcafa2028  ! 711: SWAPA_I	swapa	%r5, [%r8 + 0x0028] %asi
	.word 0x86fa224c  ! 712: SDIVcc_I	sdivcc 	%r8, 0x024c, %r3
	.word 0x8f220009  ! 713: MULScc_R	mulscc 	%r8, %r9, %r7
	.word 0x8143c000  ! 714: STBAR	stbar
	.word 0x8143c000  ! 715: STBAR	stbar
	.word 0x02800002  ! 716: BE	be  	<label_0x2>
	.word 0xcb3a2f48  ! 717: STDF_I	std	%f5, [0x0f48, %r8]
	.word 0xb9a208a9  ! 718: FSUBs	fsubs	%f8, %f9, %f28
	.word 0x26800001  ! 719: BL	bl,a	<label_0x1>
	.word 0x06c20001  ! 720: BRLZ	brlz  ,nt	%8,<label_0x20001>
	.word 0xc88a1009  ! 721: LDUBA_R	lduba	[%r8, %r9] 0x80, %r4
	.word 0xeaca1009  ! 722: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r21
	.word 0xcbe22009  ! 723: CASA_R	casa	[%r8] %asi, %r9, %r5
	.word 0xc66a211c  ! 724: LDSTUB_I	ldstub	%r3, [%r8 + 0x011c]
	.word 0xc62a0009  ! 726: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xcd1a0009  ! 726: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xc72224c0  ! 727: STF_I	st	%f3, [0x04c0, %r8]
	.word 0xcaea1009  ! 728: LDSTUBA_R	ldstuba	%r5, [%r8 + %r9] 0x80
	.word 0xc3ea2730  ! 729: PREFETCHA_I	prefetcha	[%r8, + 0x0730] %asi, #one_read
	.word 0x8143c000  ! 730: STBAR	stbar
	.word 0xacd22f4c  ! 731: UMULcc_I	umulcc 	%r8, 0x0f4c, %r22
	.word 0xf45225e8  ! 732: LDSH_I	ldsh	[%r8 + 0x05e8], %r26
	.word 0x8143e00f  ! 733: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore 
	.word 0x856a0009  ! 734: SDIVX_R	sdivx	%r8, %r9, %r2
	.word 0xcf220009  ! 736: STF_R	st	%f7, [%r9, %r8]
	.word 0xce720009  ! 737: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xde0a0009  ! 737: LDUB_R	ldub	[%r8 + %r9], %r15
	.word 0xc4220009  ! 739: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc60a0009  ! 739: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0x0e800002  ! 740: BVS	bvs  	<label_0x2>
	.word 0xaada27ac  ! 741: SMULcc_I	smulcc 	%r8, 0x07ac, %r21
	.word 0xc7220009  ! 743: STF_R	st	%f3, [%r9, %r8]
	.word 0xcc720009  ! 744: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xfc020009  ! 744: LDUW_R	lduw	[%r8 + %r9], %r30
	.word 0xfe7a2e40  ! 745: SWAP_I	swap	%r31, [%r8 + 0x0e40]
	.word 0x8c520009  ! 746: UMUL_R	umul 	%r8, %r9, %r6
	.word 0xc22a0009  ! 748: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xcc120009  ! 748: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xc36a264c  ! 749: PREFETCH_I	prefetch	[%r8 + 0x064c], #one_read
	.word 0x8143e053  ! 750: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside | #Sync 
	.word 0xc3ea1009  ! 751: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x84520009  ! 752: UMUL_R	umul 	%r8, %r9, %r2
	.word 0xc4220009  ! 754: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc6420009  ! 754: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xcf3a0009  ! 756: STDF_R	std	%f7, [%r9, %r8]
	.word 0xce720009  ! 757: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xe04a0009  ! 757: LDSB_R	ldsb	[%r8 + %r9], %r16
	.word 0xccb22168  ! 758: STHA_I	stha	%r6, [%r8 + 0x0168] %asi
	.word 0xee0a0009  ! 759: LDUB_R	ldub	[%r8 + %r9], %r23
	.word 0xc80a2dac  ! 760: LDUB_I	ldub	[%r8 + 0x0dac], %r4
	.word 0xf8a21009  ! 761: STWA_R	stwa	%r28, [%r8 + %r9] 0x80
	.word 0x06ca0001  ! 762: BRLZ	brlz  ,pt	%8,<label_0xa0001>
	.word 0xde220009  ! 764: STW_R	stw	%r15, [%r8 + %r9]
	.word 0xca420009  ! 764: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0x887a0009  ! 765: SDIV_R	sdiv 	%r8, %r9, %r4
	.word 0xbc6a2ce4  ! 766: UDIVX_I	udivx 	%r8, 0x0ce4, %r30
	.word 0x32800001  ! 767: BNE	bne,a	<label_0x1>
	.word 0xc4a22ac8  ! 768: STWA_I	stwa	%r2, [%r8 + 0x0ac8] %asi
	.word 0xfc821009  ! 769: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r30
	.word 0xcd3a20c0  ! 770: STDF_I	std	%f6, [0x00c0, %r8]
	.word 0xfc2a0009  ! 772: STB_R	stb	%r30, [%r8 + %r9]
	.word 0xe40a0009  ! 772: LDUB_R	ldub	[%r8 + %r9], %r18
	.word 0x8da209a9  ! 773: FDIVs	fdivs	%f8, %f9, %f6
	.word 0xcf2229f0  ! 774: STF_I	st	%f7, [0x09f0, %r8]
	.word 0x2ec20001  ! 775: BRGEZ	brgez,a,nt	%8,<label_0x20001>
	.word 0x8143c000  ! 776: STBAR	stbar
	.word 0x885a2f9c  ! 777: SMUL_I	smul 	%r8, 0x0f9c, %r4
	.word 0xcc921009  ! 778: LDUHA_R	lduha	[%r8, %r9] 0x80, %r6
	.word 0xdc0a0009  ! 779: LDUB_R	ldub	[%r8 + %r9], %r14
	.word 0x84da2500  ! 780: SMULcc_I	smulcc 	%r8, 0x0500, %r2
	.word 0xc3ea2954  ! 781: PREFETCHA_I	prefetcha	[%r8, + 0x0954] %asi, #one_read
	.word 0x8143c000  ! 782: STBAR	stbar
	.word 0x8c5a0009  ! 783: SMUL_R	smul 	%r8, %r9, %r6
	.word 0xc4720009  ! 785: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xcc5a0009  ! 785: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xc73a22f0  ! 786: STDF_I	std	%f3, [0x02f0, %r8]
	.word 0x04ca0001  ! 787: BRLEZ	brlez  ,pt	%8,<label_0xa0001>
	.word 0xc2220009  ! 789: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xce4a0009  ! 789: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0x9c720009  ! 790: UDIV_R	udiv 	%r8, %r9, %r14
	.word 0xc3ea2038  ! 791: PREFETCHA_I	prefetcha	[%r8, + 0x0038] %asi, #one_read
	.word 0xc49a2ce0  ! 792: LDDA_I	ldda	[%r8, + 0x0ce0] %asi, %r2
	.word 0x85a208a9  ! 793: FSUBs	fsubs	%f8, %f9, %f2
	.word 0x8143e02f  ! 794: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #MemIssue 
	.word 0xc6720009  ! 796: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xcc020009  ! 796: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xc8220009  ! 798: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xfc020009  ! 798: LDUW_R	lduw	[%r8 + %r9], %r30
	.word 0xe62a0009  ! 800: STB_R	stb	%r19, [%r8 + %r9]
	.word 0xe2120009  ! 800: LDUH_R	lduh	[%r8 + %r9], %r17
	.word 0xdd3a0009  ! 802: STDF_R	std	%f14, [%r9, %r8]
	.word 0xf6720009  ! 803: STX_R	stx	%r27, [%r8 + %r9]
	.word 0xca020009  ! 803: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xc44a0009  ! 804: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xca220009  ! 806: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xca0a0009  ! 806: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xc8320009  ! 808: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xce5a0009  ! 808: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xc6f21009  ! 809: STXA_R	stxa	%r3, [%r8 + %r9] 0x80
	.word 0xc2b21009  ! 810: STHA_R	stha	%r1, [%r8 + %r9] 0x80
	.word 0xc4420009  ! 811: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xce8223c8  ! 812: LDUWA_I	lduwa	[%r8, + 0x03c8] %asi, %r7
	.word 0x8b6a28bc  ! 813: SDIVX_I	sdivx	%r8, 0x08bc, %r5
	.word 0xc9f21009  ! 814: CASXA_I	casxa	[%r8] 0x80, %r9, %r4
	.word 0xee220009  ! 816: STW_R	stw	%r23, [%r8 + %r9]
	.word 0xc6420009  ! 816: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xc6aa29dc  ! 817: STBA_I	stba	%r3, [%r8 + 0x09dc] %asi
	.word 0xcd3a0009  ! 819: STDF_R	std	%f6, [%r9, %r8]
	.word 0xdc720009  ! 820: STX_R	stx	%r14, [%r8 + %r9]
	.word 0xcc1a0009  ! 820: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xc09a2000  ! 821: LDDA_I	ldda	[%r8, + 0x0000] %asi, %r0
	.word 0xa46a2a1c  ! 822: UDIVX_I	udivx 	%r8, 0x0a1c, %r18
	.word 0xc6720009  ! 824: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc44a0009  ! 824: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xdc220009  ! 826: STW_R	stw	%r14, [%r8 + %r9]
	.word 0xca5a0009  ! 826: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0x0aca0001  ! 827: BRNZ	brnz  ,pt	%8,<label_0xa0001>
	.word 0xc36a0009  ! 828: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc36a2a70  ! 829: PREFETCH_I	prefetch	[%r8 + 0x0a70], #one_read
	.word 0xc4b2216c  ! 830: STHA_I	stha	%r2, [%r8 + 0x016c] %asi
	.word 0xc81a2bc8  ! 831: LDD_I	ldd	[%r8 + 0x0bc8], %r4
	.word 0x84720009  ! 832: UDIV_R	udiv 	%r8, %r9, %r2
	.word 0x8143e07b  ! 833: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0x896a0009  ! 834: SDIVX_R	sdivx	%r8, %r9, %r4
	.word 0xc4ba1009  ! 835: STDA_R	stda	%r2, [%r8 + %r9] 0x80
	.word 0x97a20929  ! 836: FMULs	fmuls	%f8, %f9, %f11
	.word 0xceca2f54  ! 837: LDSBA_I	ldsba	[%r8, + 0x0f54] %asi, %r7
	.word 0x98d222ac  ! 838: UMULcc_I	umulcc 	%r8, 0x02ac, %r12
	.word 0x02c20001  ! 839: BRZ	brz  ,nt	%8,<label_0x20001>
	.word 0x867a2f50  ! 840: SDIV_I	sdiv 	%r8, 0x0f50, %r3
	.word 0xfec21009  ! 841: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r31
	.word 0x8143c000  ! 842: STBAR	stbar
	.word 0x06800001  ! 843: BL	bl  	<label_0x1>
	.word 0xef3a2790  ! 844: STDF_I	std	%f23, [0x0790, %r8]
	.word 0xc6220009  ! 846: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xf8520009  ! 846: LDSH_R	ldsh	[%r8 + %r9], %r28
	.word 0x22ca0001  ! 847: BRZ	brz,a,pt	%8,<label_0xa0001>
	.word 0xcc9a1009  ! 848: LDDA_R	ldda	[%r8, %r9] 0x80, %r6
	.word 0xcd220009  ! 850: STF_R	st	%f6, [%r9, %r8]
	.word 0xc4720009  ! 851: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc7020009  ! 851: LDF_R	ld	[%r8, %r9], %f3
	.word 0xb67a2658  ! 852: SDIV_I	sdiv 	%r8, 0x0658, %r27
	.word 0x83a20829  ! 853: FADDs	fadds	%f8, %f9, %f1
	.word 0xdd3a0009  ! 855: STDF_R	std	%f14, [%r9, %r8]
	.word 0xca720009  ! 856: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc84a0009  ! 856: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0x8143c000  ! 857: STBAR	stbar
	.word 0x8da20929  ! 858: FMULs	fmuls	%f8, %f9, %f6
	.word 0x3a800002  ! 859: BCC	bcc,a	<label_0x2>
	.word 0x24800002  ! 860: BLE	ble,a	<label_0x2>
	.word 0xce7a202c  ! 861: SWAP_I	swap	%r7, [%r8 + 0x002c]
	.word 0x18800001  ! 862: BGU	bgu  	<label_0x1>
	.word 0xc3ea1009  ! 863: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc3ea211c  ! 864: PREFETCHA_I	prefetcha	[%r8, + 0x011c] %asi, #one_read
	.word 0x1e800001  ! 865: BVC	bvc  	<label_0x1>
	.word 0x1c800002  ! 866: BPOS	bpos  	<label_0x2>
	.word 0xc36a2f8c  ! 867: PREFETCH_I	prefetch	[%r8 + 0x0f8c], #one_read
	.word 0xce320009  ! 869: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xcc1a0009  ! 869: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xea320009  ! 871: STH_R	sth	%r21, [%r8 + %r9]
	.word 0xc81a0009  ! 871: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xc8da1009  ! 872: LDXA_R	ldxa	[%r8, %r9] 0x80, %r4
	.word 0xc3ea1009  ! 873: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x8143c000  ! 874: STBAR	stbar
	.word 0xfdf21009  ! 875: CASXA_I	casxa	[%r8] 0x80, %r9, %r30
	.word 0xf48a2aac  ! 876: LDUBA_I	lduba	[%r8, + 0x0aac] %asi, %r26
	.word 0x8da20829  ! 877: FADDs	fadds	%f8, %f9, %f6
	.word 0xf1220009  ! 879: STF_R	st	%f24, [%r9, %r8]
	.word 0xf4720009  ! 880: STX_R	stx	%r26, [%r8 + %r9]
	.word 0xc4420009  ! 880: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0x40000002  ! 881: CALL	call	disp30_2
	.word 0xccba1009  ! 882: STDA_R	stda	%r6, [%r8 + %r9] 0x80
	.word 0x8143e055  ! 883: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside | #Sync 
	.word 0xc22a0009  ! 885: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc65a0009  ! 885: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0x8143e044  ! 886: MEMBAR	membar	#LoadStore | #Sync 
	.word 0xb96a0009  ! 887: SDIVX_R	sdivx	%r8, %r9, %r28
	.word 0xdac22370  ! 888: LDSWA_I	ldswa	[%r8, + 0x0370] %asi, %r13
	.word 0x8e7a0009  ! 889: SDIV_R	sdiv 	%r8, %r9, %r7
	.word 0xf6d21009  ! 890: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r27
	.word 0x8da20829  ! 891: FADDs	fadds	%f8, %f9, %f6
	.word 0xfb3a0009  ! 893: STDF_R	std	%f29, [%r9, %r8]
	.word 0xd6720009  ! 894: STX_R	stx	%r11, [%r8 + %r9]
	.word 0xe8420009  ! 894: LDSW_R	ldsw	[%r8 + %r9], %r20
	.word 0xeaea2480  ! 895: LDSTUBA_I	ldstuba	%r21, [%r8 + 0x0480] %asi
	.word 0xa5a20829  ! 896: FADDs	fadds	%f8, %f9, %f18
	.word 0xd6821009  ! 897: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r11
	.word 0x9a4a2090  ! 898: MULX_I	mulx 	%r8, 0x0090, %r13
	.word 0xda520009  ! 899: LDSH_R	ldsh	[%r8 + %r9], %r13
	.word 0xb64a0009  ! 900: MULX_R	mulx 	%r8, %r9, %r27
	.word 0x8143c000  ! 901: STBAR	stbar
	.word 0x85a20929  ! 902: FMULs	fmuls	%f8, %f9, %f2
	.word 0x8d2229cc  ! 903: MULScc_I	mulscc 	%r8, 0x09cc, %r6
	.word 0xc4a21009  ! 904: STWA_R	stwa	%r2, [%r8 + %r9] 0x80
	.word 0xcc320009  ! 906: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc8420009  ! 906: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0x8143c000  ! 907: STBAR	stbar
	.word 0xc36a2e84  ! 908: PREFETCH_I	prefetch	[%r8 + 0x0e84], #one_read
	.word 0xc4720009  ! 910: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc8520009  ! 910: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xc53a2e88  ! 911: STDF_I	std	%f2, [0x0e88, %r8]
	.word 0xc53a0009  ! 913: STDF_R	std	%f2, [%r9, %r8]
	.word 0xce720009  ! 914: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xcc1a0009  ! 914: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xca0a2cec  ! 915: LDUB_I	ldub	[%r8 + 0x0cec], %r5
	.word 0x846a2384  ! 916: UDIVX_I	udivx 	%r8, 0x0384, %r2
	.word 0xcaca1009  ! 917: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r5
	.word 0xc4220009  ! 919: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc4520009  ! 919: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0x8d2224fc  ! 920: MULScc_I	mulscc 	%r8, 0x04fc, %r6
	.word 0x10800001  ! 921: BA	ba  	<label_0x1>
	.word 0x8ef22728  ! 922: UDIVcc_I	udivcc 	%r8, 0x0728, %r7
	.word 0xbf6a2fd0  ! 923: SDIVX_I	sdivx	%r8, 0x0fd0, %r31
	.word 0xea220009  ! 925: STW_R	stw	%r21, [%r8 + %r9]
	.word 0xca020009  ! 925: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xbe520009  ! 926: UMUL_R	umul 	%r8, %r9, %r31
	.word 0xcb3a0009  ! 928: STDF_R	std	%f5, [%r9, %r8]
	.word 0xca720009  ! 929: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xe0120009  ! 929: LDUH_R	lduh	[%r8 + %r9], %r16
	.word 0xce8a2788  ! 930: LDUBA_I	lduba	[%r8, + 0x0788] %asi, %r7
	.word 0x86520009  ! 931: UMUL_R	umul 	%r8, %r9, %r3
	.word 0xc86a0009  ! 932: LDSTUB_R	ldstub	%r4, [%r8 + %r9]
	.word 0xe3222d20  ! 933: STF_I	st	%f17, [0x0d20, %r8]
	.word 0xca220009  ! 935: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xd81a0009  ! 935: LDD_R	ldd	[%r8 + %r9], %r12
	.word 0x8143c000  ! 936: STBAR	stbar
	.word 0xce2a0009  ! 938: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xef020009  ! 938: LDF_R	ld	[%r8, %r9], %f23
	.word 0xc36a2b88  ! 939: PREFETCH_I	prefetch	[%r8 + 0x0b88], #one_read
	.word 0xccfa21f0  ! 940: SWAPA_I	swapa	%r6, [%r8 + 0x01f0] %asi
	.word 0xff222674  ! 941: STF_I	st	%f31, [0x0674, %r8]
	.word 0xf802276c  ! 942: LDUW_I	lduw	[%r8 + 0x076c], %r28
	.word 0xfd220009  ! 944: STF_R	st	%f30, [%r9, %r8]
	.word 0xca720009  ! 945: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc3020009  ! 945: LDF_R	ld	[%r8, %r9], %f1
	.word 0x965a2ed8  ! 946: SMUL_I	smul 	%r8, 0x0ed8, %r11
	.word 0xc6422904  ! 947: LDSW_I	ldsw	[%r8 + 0x0904], %r3
	.word 0xfa7a0009  ! 948: SWAP_R	swap	%r29, [%r8 + %r9]
	.word 0x8cd20009  ! 949: UMULcc_R	umulcc 	%r8, %r9, %r6
	.word 0xc2320009  ! 951: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc85a0009  ! 951: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xccfa289c  ! 952: SWAPA_I	swapa	%r6, [%r8 + 0x089c] %asi
	.word 0x40000001  ! 953: CALL	call	disp30_1
	.word 0xfe122524  ! 954: LDUH_I	lduh	[%r8 + 0x0524], %r31
	.word 0xc8220009  ! 956: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xe9020009  ! 956: LDF_R	ld	[%r8, %r9], %f20
	.word 0xdc7a0009  ! 957: SWAP_R	swap	%r14, [%r8 + %r9]
	.word 0xc6320009  ! 959: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xf2020009  ! 959: LDUW_R	lduw	[%r8 + %r9], %r25
	.word 0xa4fa0009  ! 960: SDIVcc_R	sdivcc 	%r8, %r9, %r18
	.word 0xc71a2510  ! 961: LDDF_I	ldd	[%r8, 0x0510], %f3
	.word 0xe4320009  ! 963: STH_R	sth	%r18, [%r8 + %r9]
	.word 0xfc1a0009  ! 963: LDD_R	ldd	[%r8 + %r9], %r30
	.word 0xc7e21009  ! 964: CASA_I	casa	[%r8] 0x80, %r9, %r3
	.word 0x84d20009  ! 965: UMULcc_R	umulcc 	%r8, %r9, %r2
	.word 0x8b222288  ! 966: MULScc_I	mulscc 	%r8, 0x0288, %r5
	.word 0x87222218  ! 967: MULScc_I	mulscc 	%r8, 0x0218, %r3
	.word 0xc8320009  ! 969: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc80a0009  ! 969: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0x88720009  ! 970: UDIV_R	udiv 	%r8, %r9, %r4
	.word 0xfe720009  ! 972: STX_R	stx	%r31, [%r8 + %r9]
	.word 0xc51a0009  ! 972: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xc3ea2970  ! 973: PREFETCHA_I	prefetcha	[%r8, + 0x0970] %asi, #one_read
	.word 0x88d20009  ! 974: UMULcc_R	umulcc 	%r8, %r9, %r4
	.word 0xc3ea21a0  ! 975: PREFETCHA_I	prefetcha	[%r8, + 0x01a0] %asi, #one_read
	.word 0xa4fa0009  ! 976: SDIVcc_R	sdivcc 	%r8, %r9, %r18
	.word 0xcc2a0009  ! 978: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xcc020009  ! 978: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xc4a22394  ! 979: STWA_I	stwa	%r2, [%r8 + 0x0394] %asi
	.word 0x8143e06a  ! 980: MEMBAR	membar	#StoreLoad | #StoreStore | #MemIssue | #Sync 
	.word 0x00800001  ! 981: BN	bn  	<label_0x1>
	.word 0xc3ea1009  ! 982: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xcca22b88  ! 983: STWA_I	stwa	%r6, [%r8 + 0x0b88] %asi
	.word 0xc4220009  ! 985: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xda520009  ! 985: LDSH_R	ldsh	[%r8 + %r9], %r13
	.word 0xca2a0009  ! 987: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xf40a0009  ! 987: LDUB_R	ldub	[%r8 + %r9], %r26
	.word 0xfc422c3c  ! 988: LDSW_I	ldsw	[%r8 + 0x0c3c], %r30
	.word 0xc42a0009  ! 990: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xcc120009  ! 990: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xfeea1009  ! 991: LDSTUBA_R	ldstuba	%r31, [%r8 + %r9] 0x80
	.word 0x8143e019  ! 992: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside 
	.word 0x85a20829  ! 993: FADDs	fadds	%f8, %f9, %f2
	.word 0xc6720009  ! 995: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc40a0009  ! 995: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0x14800002  ! 996: BG	bg  	<label_0x2>
	.word 0xc6f21009  ! 997: STXA_R	stxa	%r3, [%r8 + %r9] 0x80
	.word 0xccaa1009  ! 998: STBA_R	stba	%r6, [%r8 + %r9] 0x80
	.word 0xc5f22009  ! 999: CASXA_R	casxa	[%r8]%asi, %r9, %r2
	nop
	nop
	nop
        ta      T_GOOD_TRAP

th_main_3:
        setx  MAIN_BASE_DATA_VA, %r1, %r8
        setx  0x00000000000003c0, %g1, %r9
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
        setx  0xbd696273fedf6c90, %g1, %r0
        setx  0xe8d6649551e37c84, %g1, %r1
        setx  0xdf6b87e26e0c4b52, %g1, %r2
        setx  0xf94534cceda72cdb, %g1, %r3
        setx  0xeefb77f7480087f3, %g1, %r4
        setx  0x6af854dfe787b70b, %g1, %r5
        setx  0x3a1d531104c18849, %g1, %r6
        setx  0xafd92014bd33e3f9, %g1, %r7
        setx  0xa15e677e1bcb622d, %g1, %r10
        setx  0xb0908cf1d1a66118, %g1, %r11
        setx  0xd5a70f3d83c794de, %g1, %r12
        setx  0xe29780e9e5cc9352, %g1, %r13
        setx  0xe2dc5b976f6546b2, %g1, %r14
        setx  0xdeaffc24314d9a11, %g1, %r15
        setx  0xb9fa2ced4e46c84e, %g1, %r16
        setx  0xbd8d1a98cb40ee2e, %g1, %r17
        setx  0x29a82aac6a6d028d, %g1, %r18
        setx  0x197b284f0827072d, %g1, %r19
        setx  0xdfa762bcf5aeeddb, %g1, %r20
        setx  0x29f146c955dc9fbe, %g1, %r21
        setx  0xb981826708ae5679, %g1, %r22
        setx  0x8b52e292ff7b2ecb, %g1, %r23
        setx  0xba5a1372fe1bf941, %g1, %r24
        setx  0x4444baacb21f3f52, %g1, %r25
        setx  0xaeeb6f1c721d02ea, %g1, %r26
        setx  0x1d5dc1a71a2ff003, %g1, %r27
        setx  0x34c814fdc2c39d7d, %g1, %r28
        setx  0x37e1bed39bb5d22e, %g1, %r29
        setx  0xdc841a7b638542ac, %g1, %r30
        setx  0x68d5da7d985de6fc, %g1, %r31
	.word 0x8c7225dc  ! 1: UDIV_I	udiv 	%r8, 0x05dc, %r6
	.word 0xc6320009  ! 3: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc4020009  ! 3: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0x12800002  ! 4: BNE	bne  	<label_0x2>
	.word 0x8143c000  ! 5: STBAR	stbar
	.word 0xcf222cfc  ! 6: STF_I	st	%f7, [0x0cfc, %r8]
	.word 0xc28a1009  ! 7: LDUBA_R	lduba	[%r8, %r9] 0x80, %r1
	.word 0xcaa22794  ! 8: STWA_I	stwa	%r5, [%r8 + 0x0794] %asi
	.word 0xcc9a2490  ! 9: LDDA_I	ldda	[%r8, + 0x0490] %asi, %r6
	.word 0xc4720009  ! 11: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc41a0009  ! 11: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xc6220009  ! 13: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc24a0009  ! 13: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xa8da0009  ! 14: SMULcc_R	smulcc 	%r8, %r9, %r20
	.word 0x20800001  ! 15: BN	bn,a	<label_0x1>
	.word 0x884a2ad8  ! 16: MULX_I	mulx 	%r8, 0x0ad8, %r4
	.word 0xf49a1009  ! 17: LDDA_R	ldda	[%r8, %r9] 0x80, %r26
	.word 0xc6320009  ! 19: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc6120009  ! 19: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xe2b21009  ! 20: STHA_R	stha	%r17, [%r8 + %r9] 0x80
	.word 0xc8f228f0  ! 21: STXA_I	stxa	%r4, [%r8 + 0x08f0] %asi
	.word 0xcec225c4  ! 22: LDSWA_I	ldswa	[%r8, + 0x05c4] %asi, %r7
	.word 0xdfe21009  ! 23: CASA_I	casa	[%r8] 0x80, %r9, %r15
	.word 0xf6da2490  ! 24: LDXA_I	ldxa	[%r8, + 0x0490] %asi, %r27
	.word 0xfac22508  ! 25: LDSWA_I	ldswa	[%r8, + 0x0508] %asi, %r29
	.word 0xc36a24c4  ! 26: PREFETCH_I	prefetch	[%r8 + 0x04c4], #one_read
	.word 0xd7020009  ! 27: LDF_R	ld	[%r8, %r9], %f11
	.word 0xf2b22654  ! 28: STHA_I	stha	%r25, [%r8 + 0x0654] %asi
	.word 0xc3222b98  ! 29: STF_I	st	%f1, [0x0b98, %r8]
	.word 0xc4922990  ! 30: LDUHA_I	lduha	[%r8, + 0x0990] %asi, %r2
	.word 0xa36a2dc0  ! 31: SDIVX_I	sdivx	%r8, 0x0dc0, %r17
	.word 0x8143e04d  ! 32: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Sync 
	.word 0xf0aa27f8  ! 33: STBA_I	stba	%r24, [%r8 + 0x07f8] %asi
	.word 0x827a2f24  ! 34: SDIV_I	sdiv 	%r8, 0x0f24, %r1
	.word 0x83a20929  ! 35: FMULs	fmuls	%f8, %f9, %f1
	.word 0xc3ea2088  ! 36: PREFETCHA_I	prefetcha	[%r8, + 0x0088] %asi, #one_read
	.word 0x8143c000  ! 37: STBAR	stbar
	.word 0xcc320009  ! 39: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xcc020009  ! 39: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0x83220009  ! 40: MULScc_R	mulscc 	%r8, %r9, %r1
	.word 0xe9f21009  ! 41: CASXA_I	casxa	[%r8] 0x80, %r9, %r20
	.word 0xf2ea2a28  ! 42: LDSTUBA_I	ldstuba	%r25, [%r8 + 0x0a28] %asi
	.word 0xb122214c  ! 43: MULScc_I	mulscc 	%r8, 0x014c, %r24
	.word 0x8143e014  ! 44: MEMBAR	membar	#LoadStore | #Lookaside 
	.word 0x8143c000  ! 45: STBAR	stbar
	.word 0xcefa1009  ! 46: SWAPA_R	swapa	%r7, [%r8 + %r9] 0x80
	.word 0x9da20929  ! 47: FMULs	fmuls	%f8, %f9, %f14
	.word 0xc33a23f0  ! 48: STDF_I	std	%f1, [0x03f0, %r8]
	.word 0xc6ea2a00  ! 49: LDSTUBA_I	ldstuba	%r3, [%r8 + 0x0a00] %asi
	.word 0x886a0009  ! 50: UDIVX_R	udivx 	%r8, %r9, %r4
	.word 0x85a209a9  ! 51: FDIVs	fdivs	%f8, %f9, %f2
	.word 0xc8320009  ! 53: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc84a0009  ! 53: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0x8143c000  ! 54: STBAR	stbar
	.word 0xbba20929  ! 55: FMULs	fmuls	%f8, %f9, %f29
	.word 0xc42a0009  ! 57: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc85a0009  ! 57: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0x856a2c50  ! 58: SDIVX_I	sdivx	%r8, 0x0c50, %r2
	.word 0xc3ea1009  ! 59: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xa0d22670  ! 60: UMULcc_I	umulcc 	%r8, 0x0670, %r16
	.word 0xe3222cc8  ! 61: STF_I	st	%f17, [0x0cc8, %r8]
	.word 0x8143c000  ! 62: STBAR	stbar
	.word 0x8143e07d  ! 63: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xcc6a0009  ! 64: LDSTUB_R	ldstub	%r6, [%r8 + %r9]
	.word 0xceea2e34  ! 65: LDSTUBA_I	ldstuba	%r7, [%r8 + 0x0e34] %asi
	.word 0x8143e03d  ! 66: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0xc9f22009  ! 67: CASXA_R	casxa	[%r8]%asi, %r9, %r4
	.word 0xb4fa0009  ! 68: SDIVcc_R	sdivcc 	%r8, %r9, %r26
	.word 0xe8720009  ! 70: STX_R	stx	%r20, [%r8 + %r9]
	.word 0xce0a0009  ! 70: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0x886a2140  ! 71: UDIVX_I	udivx 	%r8, 0x0140, %r4
	.word 0x876a0009  ! 72: SDIVX_R	sdivx	%r8, %r9, %r3
	.word 0xca8a2048  ! 73: LDUBA_I	lduba	[%r8, + 0x0048] %asi, %r5
	.word 0xc4b22960  ! 74: STHA_I	stha	%r2, [%r8 + 0x0960] %asi
	.word 0xc6aa1009  ! 75: STBA_R	stba	%r3, [%r8 + %r9] 0x80
	.word 0xcc220009  ! 77: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xdc1a0009  ! 77: LDD_R	ldd	[%r8 + %r9], %r14
	.word 0xc3ea1009  ! 78: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x8143e032  ! 79: MEMBAR	membar	#StoreLoad | #Lookaside | #MemIssue 
	.word 0xc3222748  ! 80: STF_I	st	%f1, [0x0748, %r8]
	.word 0xb56a0009  ! 81: SDIVX_R	sdivx	%r8, %r9, %r26
	.word 0xcd020009  ! 82: LDF_R	ld	[%r8, %r9], %f6
	.word 0xc3ea1009  ! 83: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc22a0009  ! 85: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc2120009  ! 85: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xc60a25c8  ! 86: LDUB_I	ldub	[%r8 + 0x05c8], %r3
	.word 0xbcfa20cc  ! 87: SDIVcc_I	sdivcc 	%r8, 0x00cc, %r30
	.word 0xc62a0009  ! 89: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc6520009  ! 89: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xd6a21009  ! 90: STWA_R	stwa	%r11, [%r8 + %r9] 0x80
	.word 0x8143e015  ! 91: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside 
	.word 0x8143c000  ! 92: STBAR	stbar
	.word 0x00800002  ! 93: BN	bn  	<label_0x2>
	.word 0xf26a0009  ! 94: LDSTUB_R	ldstub	%r25, [%r8 + %r9]
	.word 0x8ba209a9  ! 95: FDIVs	fdivs	%f8, %f9, %f5
	.word 0xcc821009  ! 96: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r6
	.word 0xc8220009  ! 98: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xcc020009  ! 98: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xe2f21009  ! 99: STXA_R	stxa	%r17, [%r8 + %r9] 0x80
	.word 0xc9222a90  ! 100: STF_I	st	%f4, [0x0a90, %r8]
	.word 0xda2a0009  ! 102: STB_R	stb	%r13, [%r8 + %r9]
	.word 0xcc020009  ! 102: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xe82a0009  ! 104: STB_R	stb	%r20, [%r8 + %r9]
	.word 0xc8020009  ! 104: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xc4ea1009  ! 105: LDSTUBA_R	ldstuba	%r2, [%r8 + %r9] 0x80
	.word 0xc2da25b8  ! 106: LDXA_I	ldxa	[%r8, + 0x05b8] %asi, %r1
	.word 0x2ac20001  ! 107: BRNZ	brnz,a,nt	%8,<label_0x20001>
	.word 0xf2220009  ! 109: STW_R	stw	%r25, [%r8 + %r9]
	.word 0xc20a0009  ! 109: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xc46a2498  ! 110: LDSTUB_I	ldstub	%r2, [%r8 + 0x0498]
	.word 0xc22a0009  ! 112: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc9020009  ! 112: LDF_R	ld	[%r8, %r9], %f4
	.word 0xc6720009  ! 114: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc01a0009  ! 114: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0xfcba1009  ! 115: STDA_R	stda	%r30, [%r8 + %r9] 0x80
	.word 0xfe2a0009  ! 117: STB_R	stb	%r31, [%r8 + %r9]
	.word 0xf0420009  ! 117: LDSW_R	ldsw	[%r8 + %r9], %r24
	.word 0xb6fa2ab0  ! 118: SDIVcc_I	sdivcc 	%r8, 0x0ab0, %r27
	.word 0xc36a2934  ! 119: PREFETCH_I	prefetch	[%r8 + 0x0934], #one_read
	.word 0x06800001  ! 120: BL	bl  	<label_0x1>
	.word 0xeff21009  ! 121: CASXA_I	casxa	[%r8] 0x80, %r9, %r23
	.word 0xf8520009  ! 122: LDSH_R	ldsh	[%r8 + %r9], %r28
	.word 0xc6d22508  ! 123: LDSHA_I	ldsha	[%r8, + 0x0508] %asi, %r3
	.word 0x8143e016  ! 124: MEMBAR	membar	#StoreLoad | #LoadStore | #Lookaside 
	.word 0xc8320009  ! 126: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xca020009  ! 126: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xce320009  ! 128: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc8120009  ! 128: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xc25a29a0  ! 129: LDX_I	ldx	[%r8 + 0x09a0], %r1
	.word 0xc8f22bf8  ! 130: STXA_I	stxa	%r4, [%r8 + 0x0bf8] %asi
	.word 0xc6a22cb8  ! 131: STWA_I	stwa	%r3, [%r8 + 0x0cb8] %asi
	.word 0xc46a0009  ! 132: LDSTUB_R	ldstub	%r2, [%r8 + %r9]
	.word 0xca320009  ! 134: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc65a0009  ! 134: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0x34800002  ! 135: BG	bg,a	<label_0x2>
	.word 0x2ec20001  ! 136: BRGEZ	brgez,a,nt	%8,<label_0x20001>
	.word 0xc6d21009  ! 137: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r3
	.word 0xc3ea1009  ! 138: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc36a27a8  ! 139: PREFETCH_I	prefetch	[%r8 + 0x07a8], #one_read
	.word 0x8a520009  ! 140: UMUL_R	umul 	%r8, %r9, %r5
	.word 0x9ad22dfc  ! 141: UMULcc_I	umulcc 	%r8, 0x0dfc, %r13
	.word 0xc36a293c  ! 142: PREFETCH_I	prefetch	[%r8 + 0x093c], #one_read
	.word 0x8a5a2308  ! 143: SMUL_I	smul 	%r8, 0x0308, %r5
	.word 0xcc220009  ! 145: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xce4a0009  ! 145: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0x8e520009  ! 146: UMUL_R	umul 	%r8, %r9, %r7
	.word 0x847a2f38  ! 147: SDIV_I	sdiv 	%r8, 0x0f38, %r2
	.word 0xc3ea1009  ! 148: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xca4a2f88  ! 149: LDSB_I	ldsb	[%r8 + 0x0f88], %r5
	.word 0xcb222f0c  ! 150: STF_I	st	%f5, [0x0f0c, %r8]
	.word 0xc3ea1009  ! 151: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x8143c000  ! 152: STBAR	stbar
	.word 0x30800002  ! 153: BA	ba,a	<label_0x2>
	.word 0x0e800002  ! 154: BVS	bvs  	<label_0x2>
	.word 0x9ba209a9  ! 155: FDIVs	fdivs	%f8, %f9, %f13
	.word 0xc47a0009  ! 156: SWAP_R	swap	%r2, [%r8 + %r9]
	.word 0x8da209a9  ! 157: FDIVs	fdivs	%f8, %f9, %f6
	.word 0xc2720009  ! 159: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xcc020009  ! 159: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xfc2a0009  ! 161: STB_R	stb	%r30, [%r8 + %r9]
	.word 0xc3020009  ! 161: LDF_R	ld	[%r8, %r9], %f1
	.word 0x8143c000  ! 162: STBAR	stbar
	.word 0xcaca1009  ! 163: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r5
	.word 0xcc320009  ! 165: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xfa020009  ! 165: LDUW_R	lduw	[%r8 + %r9], %r29
	.word 0xc3ea2b90  ! 166: PREFETCHA_I	prefetcha	[%r8, + 0x0b90] %asi, #one_read
	.word 0xac720009  ! 167: UDIV_R	udiv 	%r8, %r9, %r22
	.word 0xb2da2608  ! 168: SMULcc_I	smulcc 	%r8, 0x0608, %r25
	.word 0x32800002  ! 169: BNE	bne,a	<label_0x2>
	.word 0xde822654  ! 170: LDUWA_I	lduwa	[%r8, + 0x0654] %asi, %r15
	.word 0xbaf20009  ! 171: UDIVcc_R	udivcc 	%r8, %r9, %r29
	.word 0xc7f22009  ! 172: CASXA_R	casxa	[%r8]%asi, %r9, %r3
	.word 0x8143c000  ! 173: STBAR	stbar
	.word 0x38800001  ! 174: BGU	bgu,a	<label_0x1>
	.word 0xc8ea2b10  ! 175: LDSTUBA_I	ldstuba	%r4, [%r8 + 0x0b10] %asi
	.word 0xf89a2048  ! 176: LDDA_I	ldda	[%r8, + 0x0048] %asi, %r28
	.word 0x8143e029  ! 177: MEMBAR	membar	#LoadLoad | #StoreStore | #MemIssue 
	.word 0x8ba20829  ! 178: FADDs	fadds	%f8, %f9, %f5
	.word 0xc3ea2f9c  ! 179: PREFETCHA_I	prefetcha	[%r8, + 0x0f9c] %asi, #one_read
	.word 0xce2a0009  ! 181: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xcd020009  ! 181: LDF_R	ld	[%r8, %r9], %f6
	.word 0xe28226b8  ! 182: LDUWA_I	lduwa	[%r8, + 0x06b8] %asi, %r17
	.word 0xc3ea26a8  ! 183: PREFETCHA_I	prefetcha	[%r8, + 0x06a8] %asi, #one_read
	.word 0xc8320009  ! 185: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc9020009  ! 185: LDF_R	ld	[%r8, %r9], %f4
	.word 0x89a209a9  ! 186: FDIVs	fdivs	%f8, %f9, %f4
	.word 0x89220009  ! 187: MULScc_R	mulscc 	%r8, %r9, %r4
	.word 0xca921009  ! 188: LDUHA_R	lduha	[%r8, %r9] 0x80, %r5
	.word 0xf42a0009  ! 190: STB_R	stb	%r26, [%r8 + %r9]
	.word 0xcc5a0009  ! 190: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xc60a0009  ! 191: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xcc320009  ! 193: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xf2120009  ! 193: LDUH_R	lduh	[%r8 + %r9], %r25
	.word 0xf22a0009  ! 195: STB_R	stb	%r25, [%r8 + %r9]
	.word 0xca0a0009  ! 195: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0x84520009  ! 196: UMUL_R	umul 	%r8, %r9, %r2
	.word 0x8d2224f4  ! 197: MULScc_I	mulscc 	%r8, 0x04f4, %r6
	.word 0xc2f21009  ! 198: STXA_R	stxa	%r1, [%r8 + %r9] 0x80
	.word 0xc93a2068  ! 199: STDF_I	std	%f4, [0x0068, %r8]
	.word 0x30800001  ! 200: BA	ba,a	<label_0x1>
	.word 0xc36a2604  ! 201: PREFETCH_I	prefetch	[%r8 + 0x0604], #one_read
	.word 0xfaa22eb8  ! 202: STWA_I	stwa	%r29, [%r8 + 0x0eb8] %asi
	.word 0xc2120009  ! 203: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xfc1a0009  ! 204: LDD_R	ldd	[%r8 + %r9], %r30
	.word 0xce5220f8  ! 205: LDSH_I	ldsh	[%r8 + 0x00f8], %r7
	.word 0xc47a2d50  ! 206: SWAP_I	swap	%r2, [%r8 + 0x0d50]
	.word 0xca2a0009  ! 208: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc4420009  ! 208: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xceaa2108  ! 209: STBA_I	stba	%r7, [%r8 + 0x0108] %asi
	.word 0xc36a2294  ! 210: PREFETCH_I	prefetch	[%r8 + 0x0294], #one_read
	.word 0x8143e068  ! 211: MEMBAR	membar	#StoreStore | #MemIssue | #Sync 
	.word 0xc53a0009  ! 213: STDF_R	std	%f2, [%r9, %r8]
	.word 0xcc720009  ! 214: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xcc4a0009  ! 214: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0x8143c000  ! 215: STBAR	stbar
	.word 0x04ca0001  ! 216: BRLEZ	brlez  ,pt	%8,<label_0xa0001>
	.word 0xc4522fac  ! 217: LDSH_I	ldsh	[%r8 + 0x0fac], %r2
	.word 0x8e7a0009  ! 218: SDIV_R	sdiv 	%r8, %r9, %r7
	.word 0xf0ba2808  ! 219: STDA_I	stda	%r24, [%r8 + 0x0808] %asi
	.word 0x88522580  ! 220: UMUL_I	umul 	%r8, 0x0580, %r4
	.word 0x22ca0001  ! 221: BRZ	brz,a,pt	%8,<label_0xa0001>
	.word 0x84722600  ! 222: UDIV_I	udiv 	%r8, 0x0600, %r2
	.word 0xce8a1009  ! 223: LDUBA_R	lduba	[%r8, %r9] 0x80, %r7
	.word 0xc66a21a8  ! 224: LDSTUB_I	ldstub	%r3, [%r8 + 0x01a8]
	.word 0xf0720009  ! 226: STX_R	stx	%r24, [%r8 + %r9]
	.word 0xee120009  ! 226: LDUH_R	lduh	[%r8 + %r9], %r23
	.word 0xcaa21009  ! 227: STWA_R	stwa	%r5, [%r8 + %r9] 0x80
	.word 0xc2220009  ! 229: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xcf1a0009  ! 229: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xe0220009  ! 231: STW_R	stw	%r16, [%r8 + %r9]
	.word 0xc41a0009  ! 231: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xce6a0009  ! 232: LDSTUB_R	ldstub	%r7, [%r8 + %r9]
	.word 0xec7a0009  ! 233: SWAP_R	swap	%r22, [%r8 + %r9]
	.word 0xcaf22d80  ! 234: STXA_I	stxa	%r5, [%r8 + 0x0d80] %asi
	.word 0x8ba20829  ! 235: FADDs	fadds	%f8, %f9, %f5
	.word 0x0aca0001  ! 236: BRNZ	brnz  ,pt	%8,<label_0xa0001>
	.word 0x8d220009  ! 237: MULScc_R	mulscc 	%r8, %r9, %r6
	.word 0xd8320009  ! 239: STH_R	sth	%r12, [%r8 + %r9]
	.word 0xc51a0009  ! 239: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0x8143e01e  ! 240: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside 
	.word 0xcd3a0009  ! 242: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc2720009  ! 243: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc4120009  ! 243: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0x89a209a9  ! 244: FDIVs	fdivs	%f8, %f9, %f4
	.word 0xca5a0009  ! 245: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xc3ea1009  ! 246: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xfe720009  ! 248: STX_R	stx	%r31, [%r8 + %r9]
	.word 0xe84a0009  ! 248: LDSB_R	ldsb	[%r8 + %r9], %r20
	.word 0x8143e07e  ! 249: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xae4a0009  ! 250: MULX_R	mulx 	%r8, %r9, %r23
	.word 0xc4ba1009  ! 251: STDA_R	stda	%r2, [%r8 + %r9] 0x80
	.word 0xacda0009  ! 252: SMULcc_R	smulcc 	%r8, %r9, %r22
	.word 0x8143c000  ! 253: STBAR	stbar
	.word 0xc8720009  ! 255: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xec5a0009  ! 255: LDX_R	ldx	[%r8 + %r9], %r22
	.word 0xc2b21009  ! 256: STHA_R	stha	%r1, [%r8 + %r9] 0x80
	.word 0xe6da2510  ! 257: LDXA_I	ldxa	[%r8, + 0x0510] %asi, %r19
	.word 0xc8ba2460  ! 258: STDA_I	stda	%r4, [%r8 + 0x0460] %asi
	.word 0xcd2228e4  ! 259: STF_I	st	%f6, [0x08e4, %r8]
	.word 0x826a0009  ! 260: UDIVX_R	udivx 	%r8, %r9, %r1
	.word 0xd6220009  ! 262: STW_R	stw	%r11, [%r8 + %r9]
	.word 0xc4120009  ! 262: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xca921009  ! 263: LDUHA_R	lduha	[%r8, %r9] 0x80, %r5
	.word 0x8efa0009  ! 264: SDIVcc_R	sdivcc 	%r8, %r9, %r7
	.word 0xf2220009  ! 266: STW_R	stw	%r25, [%r8 + %r9]
	.word 0xf6520009  ! 266: LDSH_R	ldsh	[%r8 + %r9], %r27
	.word 0xc2220009  ! 268: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xec4a0009  ! 268: LDSB_R	ldsb	[%r8 + %r9], %r22
	.word 0xc3ea26e8  ! 269: PREFETCHA_I	prefetcha	[%r8, + 0x06e8] %asi, #one_read
	.word 0xc4220009  ! 271: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xea4a0009  ! 271: LDSB_R	ldsb	[%r8 + %r9], %r21
	.word 0xccf22d78  ! 272: STXA_I	stxa	%r6, [%r8 + 0x0d78] %asi
	.word 0xc3ea1009  ! 273: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc2921009  ! 274: LDUHA_R	lduha	[%r8, %r9] 0x80, %r1
	.word 0xc4aa2350  ! 275: STBA_I	stba	%r2, [%r8 + 0x0350] %asi
	.word 0xa8fa0009  ! 276: SDIVcc_R	sdivcc 	%r8, %r9, %r20
	.word 0xc36a0009  ! 277: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc3222e50  ! 278: STF_I	st	%f1, [0x0e50, %r8]
	.word 0xc49a1009  ! 279: LDDA_R	ldda	[%r8, %r9] 0x80, %r2
	.word 0xcd3a2010  ! 280: STDF_I	std	%f6, [0x0010, %r8]
	.word 0x8143c000  ! 281: STBAR	stbar
	.word 0xc36a235c  ! 282: PREFETCH_I	prefetch	[%r8 + 0x035c], #one_read
	.word 0xc3ea259c  ! 283: PREFETCHA_I	prefetcha	[%r8, + 0x059c] %asi, #one_read
	.word 0xc92225b8  ! 284: STF_I	st	%f4, [0x05b8, %r8]
	.word 0xca42279c  ! 285: LDSW_I	ldsw	[%r8 + 0x079c], %r5
	.word 0xce320009  ! 287: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xf05a0009  ! 287: LDX_R	ldx	[%r8 + %r9], %r24
	.word 0x876a2f94  ! 288: SDIVX_I	sdivx	%r8, 0x0f94, %r3
	.word 0xfe220009  ! 290: STW_R	stw	%r31, [%r8 + %r9]
	.word 0xe8120009  ! 290: LDUH_R	lduh	[%r8 + %r9], %r20
	.word 0xea821009  ! 291: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r21
	.word 0xcc4a24d0  ! 292: LDSB_I	ldsb	[%r8 + 0x04d0], %r6
	.word 0xff220009  ! 294: STF_R	st	%f31, [%r9, %r8]
	.word 0xcc720009  ! 295: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xd6420009  ! 295: LDSW_R	ldsw	[%r8 + %r9], %r11
	.word 0xc26a0009  ! 296: LDSTUB_R	ldstub	%r1, [%r8 + %r9]
	.word 0x825a2a28  ! 297: SMUL_I	smul 	%r8, 0x0a28, %r1
	.word 0xc3ea2f64  ! 298: PREFETCHA_I	prefetcha	[%r8, + 0x0f64] %asi, #one_read
	.word 0xc36a0009  ! 299: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0x8a6a0009  ! 300: UDIVX_R	udivx 	%r8, %r9, %r5
	.word 0xccba2250  ! 301: STDA_I	stda	%r6, [%r8 + 0x0250] %asi
	.word 0xa64a0009  ! 302: MULX_R	mulx 	%r8, %r9, %r19
	.word 0xce320009  ! 304: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc45a0009  ! 304: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xce720009  ! 306: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xe4020009  ! 306: LDUW_R	lduw	[%r8 + %r9], %r18
	.word 0xf82a0009  ! 308: STB_R	stb	%r28, [%r8 + %r9]
	.word 0xf81a0009  ! 308: LDD_R	ldd	[%r8 + %r9], %r28
	.word 0xc3ea1009  ! 309: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc4c22f9c  ! 310: LDSWA_I	ldswa	[%r8, + 0x0f9c] %asi, %r2
	.word 0xcb22216c  ! 311: STF_I	st	%f5, [0x016c, %r8]
	.word 0xc3ea1009  ! 312: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x18800001  ! 313: BGU	bgu  	<label_0x1>
	.word 0xc8ba1009  ! 314: STDA_R	stda	%r4, [%r8 + %r9] 0x80
	.word 0xc36a2398  ! 315: PREFETCH_I	prefetch	[%r8 + 0x0398], #one_read
	.word 0xcaea1009  ! 316: LDSTUBA_R	ldstuba	%r5, [%r8 + %r9] 0x80
	.word 0xc36a25ac  ! 317: PREFETCH_I	prefetch	[%r8 + 0x05ac], #one_read
	.word 0xc8220009  ! 319: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc6520009  ! 319: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xc26a2770  ! 320: LDSTUB_I	ldstub	%r1, [%r8 + 0x0770]
	.word 0xc36a0009  ! 321: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0x8143e009  ! 322: MEMBAR	membar	#LoadLoad | #StoreStore 
	.word 0x14800002  ! 323: BG	bg  	<label_0x2>
	.word 0xf6821009  ! 324: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r27
	.word 0xc36a2be4  ! 325: PREFETCH_I	prefetch	[%r8 + 0x0be4], #one_read
	.word 0xca4a2a44  ! 326: LDSB_I	ldsb	[%r8 + 0x0a44], %r5
	.word 0x8143e00d  ! 327: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore 
	.word 0x84da2ee0  ! 328: SMULcc_I	smulcc 	%r8, 0x0ee0, %r2
	.word 0xce5222f4  ! 329: LDSH_I	ldsh	[%r8 + 0x02f4], %r7
	.word 0xc82a0009  ! 331: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc8020009  ! 331: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0x8e6a2a30  ! 332: UDIVX_I	udivx 	%r8, 0x0a30, %r7
	.word 0x22c20001  ! 333: BRZ	brz,a,nt	%8,<label_0x20001>
	.word 0xfe220009  ! 335: STW_R	stw	%r31, [%r8 + %r9]
	.word 0xce020009  ! 335: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xc2522070  ! 336: LDSH_I	ldsh	[%r8 + 0x0070], %r1
	.word 0xda122bc8  ! 337: LDUH_I	lduh	[%r8 + 0x0bc8], %r13
	.word 0xc5220009  ! 339: STF_R	st	%f2, [%r9, %r8]
	.word 0xe8720009  ! 340: STX_R	stx	%r20, [%r8 + %r9]
	.word 0xcb020009  ! 340: LDF_R	ld	[%r8, %r9], %f5
	.word 0x83a20929  ! 341: FMULs	fmuls	%f8, %f9, %f1
	.word 0xccba2fe8  ! 342: STDA_I	stda	%r6, [%r8 + 0x0fe8] %asi
	.word 0xf28a1009  ! 343: LDUBA_R	lduba	[%r8, %r9] 0x80, %r25
	.word 0xc3ea1009  ! 344: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x06800001  ! 345: BL	bl  	<label_0x1>
	.word 0xc8220009  ! 347: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc4520009  ! 347: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xc3ea279c  ! 348: PREFETCHA_I	prefetcha	[%r8, + 0x079c] %asi, #one_read
	.word 0xde720009  ! 350: STX_R	stx	%r15, [%r8 + %r9]
	.word 0xe40a0009  ! 350: LDUB_R	ldub	[%r8 + %r9], %r18
	.word 0xc4f21009  ! 351: STXA_R	stxa	%r2, [%r8 + %r9] 0x80
	.word 0x8143e03c  ! 352: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0x0cca0001  ! 353: BRGZ	brgz  ,pt	%8,<label_0xa0001>
	.word 0xc3ea1009  ! 354: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc4ba2870  ! 355: STDA_I	stda	%r2, [%r8 + 0x0870] %asi
	.word 0xcbe22009  ! 356: CASA_R	casa	[%r8] %asi, %r9, %r5
	.word 0x9d6a2904  ! 357: SDIVX_I	sdivx	%r8, 0x0904, %r14
	.word 0x88fa2754  ! 358: SDIVcc_I	sdivcc 	%r8, 0x0754, %r4
	.word 0x8143c000  ! 359: STBAR	stbar
	.word 0xf7222680  ! 360: STF_I	st	%f27, [0x0680, %r8]
	.word 0xc6f21009  ! 361: STXA_R	stxa	%r3, [%r8 + %r9] 0x80
	.word 0xc4022818  ! 362: LDUW_I	lduw	[%r8 + 0x0818], %r2
	.word 0xc7f22009  ! 363: CASXA_R	casxa	[%r8]%asi, %r9, %r3
	.word 0x8af20009  ! 364: UDIVcc_R	udivcc 	%r8, %r9, %r5
	.word 0xf0a22c74  ! 365: STWA_I	stwa	%r24, [%r8 + 0x0c74] %asi
	.word 0x8143c000  ! 366: STBAR	stbar
	.word 0x965a0009  ! 367: SMUL_R	smul 	%r8, %r9, %r11
	.word 0xda020009  ! 368: LDUW_R	lduw	[%r8 + %r9], %r13
	.word 0xc4da2558  ! 369: LDXA_I	ldxa	[%r8, + 0x0558] %asi, %r2
	.word 0x84f20009  ! 370: UDIVcc_R	udivcc 	%r8, %r9, %r2
	.word 0x3e800001  ! 371: BVC	bvc,a	<label_0x1>
	.word 0xc26a0009  ! 372: LDSTUB_R	ldstub	%r1, [%r8 + %r9]
	.word 0xc3ea2448  ! 373: PREFETCHA_I	prefetcha	[%r8, + 0x0448] %asi, #one_read
	.word 0x8f220009  ! 374: MULScc_R	mulscc 	%r8, %r9, %r7
	.word 0xc3ea241c  ! 375: PREFETCHA_I	prefetcha	[%r8, + 0x041c] %asi, #one_read
	.word 0xca2a0009  ! 377: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xca4a0009  ! 377: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xce7a2d2c  ! 378: SWAP_I	swap	%r7, [%r8 + 0x0d2c]
	.word 0xd852238c  ! 379: LDSH_I	ldsh	[%r8 + 0x038c], %r12
	.word 0xf2720009  ! 381: STX_R	stx	%r25, [%r8 + %r9]
	.word 0xc2120009  ! 381: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xe46a0009  ! 382: LDSTUB_R	ldstub	%r18, [%r8 + %r9]
	.word 0xc2522cd8  ! 383: LDSH_I	ldsh	[%r8 + 0x0cd8], %r1
	.word 0x14800001  ! 384: BG	bg  	<label_0x1>
	.word 0xe0ba1009  ! 385: STDA_R	stda	%r16, [%r8 + %r9] 0x80
	.word 0x844a2d10  ! 386: MULX_I	mulx 	%r8, 0x0d10, %r2
	.word 0xd62a0009  ! 388: STB_R	stb	%r11, [%r8 + %r9]
	.word 0xc44a0009  ! 388: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xc81a23f8  ! 389: LDD_I	ldd	[%r8 + 0x03f8], %r4
	.word 0xc3ea1009  ! 390: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xf28221f0  ! 391: LDUWA_I	lduwa	[%r8, + 0x01f0] %asi, %r25
	.word 0xc6922d34  ! 392: LDUHA_I	lduha	[%r8, + 0x0d34] %asi, %r3
	.word 0x1a800001  ! 393: BCC	bcc  	<label_0x1>
	.word 0xc4320009  ! 395: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc8120009  ! 395: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0x88da0009  ! 396: SMULcc_R	smulcc 	%r8, %r9, %r4
	.word 0xcefa284c  ! 397: SWAPA_I	swapa	%r7, [%r8 + 0x084c] %asi
	.word 0xa64a0009  ! 398: MULX_R	mulx 	%r8, %r9, %r19
	.word 0xec7a24cc  ! 399: SWAP_I	swap	%r22, [%r8 + 0x04cc]
	.word 0xca2a0009  ! 401: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xcd020009  ! 401: LDF_R	ld	[%r8, %r9], %f6
	.word 0x16800002  ! 402: BGE	bge  	<label_0x2>
	.word 0xf6f22b28  ! 403: STXA_I	stxa	%r27, [%r8 + 0x0b28] %asi
	.word 0xe0ba21a8  ! 404: STDA_I	stda	%r16, [%r8 + 0x01a8] %asi
	.word 0x864a28a4  ! 405: MULX_I	mulx 	%r8, 0x08a4, %r3
	.word 0xfe5a0009  ! 406: LDX_R	ldx	[%r8 + %r9], %r31
	.word 0xe6822b54  ! 407: LDUWA_I	lduwa	[%r8, + 0x0b54] %asi, %r19
	.word 0xc3ea1009  ! 408: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xb5222140  ! 409: MULScc_I	mulscc 	%r8, 0x0140, %r26
	.word 0x89a20929  ! 410: FMULs	fmuls	%f8, %f9, %f4
	.word 0x9a7a289c  ! 411: SDIV_I	sdiv 	%r8, 0x089c, %r13
	.word 0x24800001  ! 412: BLE	ble,a	<label_0x1>
	.word 0x82d2268c  ! 413: UMULcc_I	umulcc 	%r8, 0x068c, %r1
	.word 0xc67a0009  ! 414: SWAP_R	swap	%r3, [%r8 + %r9]
	.word 0x2a800002  ! 415: BCS	bcs,a	<label_0x2>
	.word 0xcd22245c  ! 416: STF_I	st	%f6, [0x045c, %r8]
	.word 0xf0720009  ! 418: STX_R	stx	%r24, [%r8 + %r9]
	.word 0xce0a0009  ! 418: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xc6220009  ! 420: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xca520009  ! 420: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xce2a0009  ! 422: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc24a0009  ! 422: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0x86722c4c  ! 423: UDIV_I	udiv 	%r8, 0x0c4c, %r3
	.word 0xcb3a28c8  ! 424: STDF_I	std	%f5, [0x08c8, %r8]
	.word 0x8143c000  ! 425: STBAR	stbar
	.word 0xa46a2950  ! 426: UDIVX_I	udivx 	%r8, 0x0950, %r18
	.word 0xc2d21009  ! 427: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r1
	.word 0xc8ba2540  ! 428: STDA_I	stda	%r4, [%r8 + 0x0540] %asi
	.word 0x02800002  ! 429: BE	be  	<label_0x2>
	.word 0x02ca0001  ! 430: BRZ	brz  ,pt	%8,<label_0xa0001>
	.word 0x8e5a0009  ! 431: SMUL_R	smul 	%r8, %r9, %r7
	.word 0xf22a0009  ! 433: STB_R	stb	%r25, [%r8 + %r9]
	.word 0xcc1a0009  ! 433: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0x0cca0001  ! 434: BRGZ	brgz  ,pt	%8,<label_0xa0001>
	.word 0x1c800001  ! 435: BPOS	bpos  	<label_0x1>
	.word 0xf93a2e80  ! 436: STDF_I	std	%f28, [0x0e80, %r8]
	.word 0xc36a0009  ! 437: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xcc4a24b4  ! 438: LDSB_I	ldsb	[%r8 + 0x04b4], %r6
	.word 0x88d20009  ! 439: UMULcc_R	umulcc 	%r8, %r9, %r4
	.word 0x8143e057  ! 440: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside | #Sync 
	.word 0xc2220009  ! 442: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc3020009  ! 442: LDF_R	ld	[%r8, %r9], %f1
	.word 0xe2821009  ! 443: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r17
	.word 0xfd3a0009  ! 445: STDF_R	std	%f30, [%r9, %r8]
	.word 0xca720009  ! 446: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xfa0a0009  ! 446: LDUB_R	ldub	[%r8 + %r9], %r29
	.word 0xca6a2274  ! 447: LDSTUB_I	ldstub	%r5, [%r8 + 0x0274]
	.word 0xc9222f58  ! 448: STF_I	st	%f4, [0x0f58, %r8]
	.word 0xcd1a0009  ! 449: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xc6220009  ! 451: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc71a0009  ! 451: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xf60a227c  ! 452: LDUB_I	ldub	[%r8 + 0x027c], %r27
	.word 0xeaaa2584  ! 453: STBA_I	stba	%r21, [%r8 + 0x0584] %asi
	.word 0xc8822b48  ! 454: LDUWA_I	lduwa	[%r8, + 0x0b48] %asi, %r4
	.word 0x8c520009  ! 455: UMUL_R	umul 	%r8, %r9, %r6
	.word 0xe8fa2164  ! 456: SWAPA_I	swapa	%r20, [%r8 + 0x0164] %asi
	.word 0x8143e029  ! 457: MEMBAR	membar	#LoadLoad | #StoreStore | #MemIssue 
	.word 0x22800001  ! 458: BE	be,a	<label_0x1>
	.word 0xc93a2988  ! 459: STDF_I	std	%f4, [0x0988, %r8]
	.word 0xc36a0009  ! 460: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xce5a0009  ! 461: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0x8143c000  ! 462: STBAR	stbar
	.word 0xf24a239c  ! 463: LDSB_I	ldsb	[%r8 + 0x039c], %r25
	.word 0xca420009  ! 464: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0x83a208a9  ! 465: FSUBs	fsubs	%f8, %f9, %f1
	.word 0xc3ea2450  ! 466: PREFETCHA_I	prefetcha	[%r8, + 0x0450] %asi, #one_read
	.word 0xc36a2adc  ! 467: PREFETCH_I	prefetch	[%r8 + 0x0adc], #one_read
	.word 0x8e5a0009  ! 468: SMUL_R	smul 	%r8, %r9, %r7
	.word 0xc4da2260  ! 469: LDXA_I	ldxa	[%r8, + 0x0260] %asi, %r2
	.word 0xc6b21009  ! 470: STHA_R	stha	%r3, [%r8 + %r9] 0x80
	.word 0xc3ea2b88  ! 471: PREFETCHA_I	prefetcha	[%r8, + 0x0b88] %asi, #one_read
	.word 0xc2220009  ! 473: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xcb020009  ! 473: LDF_R	ld	[%r8, %r9], %f5
	.word 0xe0ea2e28  ! 474: LDSTUBA_I	ldstuba	%r16, [%r8 + 0x0e28] %asi
	.word 0x8143c000  ! 475: STBAR	stbar
	.word 0x8143c000  ! 476: STBAR	stbar
	.word 0x8143e077  ! 477: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside | #MemIssue | #Sync 
	.word 0x88fa0009  ! 478: SDIVcc_R	sdivcc 	%r8, %r9, %r4
	.word 0xc3ea1009  ! 479: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc27a0009  ! 480: SWAP_R	swap	%r1, [%r8 + %r9]
	.word 0xc7220009  ! 482: STF_R	st	%f3, [%r9, %r8]
	.word 0xca720009  ! 483: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xcf020009  ! 483: LDF_R	ld	[%r8, %r9], %f7
	.word 0xd8320009  ! 485: STH_R	sth	%r12, [%r8 + %r9]
	.word 0xc4020009  ! 485: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xca220009  ! 487: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xce520009  ! 487: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xcc1a0009  ! 488: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xcac21009  ! 489: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r5
	.word 0x82d20009  ! 490: UMULcc_R	umulcc 	%r8, %r9, %r1
	.word 0xf6320009  ! 492: STH_R	sth	%r27, [%r8 + %r9]
	.word 0xf81a0009  ! 492: LDD_R	ldd	[%r8 + %r9], %r28
	.word 0xc26a0009  ! 493: LDSTUB_R	ldstub	%r1, [%r8 + %r9]
	.word 0xcca21009  ! 494: STWA_R	stwa	%r6, [%r8 + %r9] 0x80
	.word 0xccc21009  ! 495: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r6
	.word 0xd6822efc  ! 496: LDUWA_I	lduwa	[%r8, + 0x0efc] %asi, %r11
	.word 0x86da0009  ! 497: SMULcc_R	smulcc 	%r8, %r9, %r3
	.word 0xe47a0009  ! 498: SWAP_R	swap	%r18, [%r8 + %r9]
	.word 0xc4aa2174  ! 499: STBA_I	stba	%r2, [%r8 + 0x0174] %asi
	.word 0xc6ea1009  ! 500: LDSTUBA_R	ldstuba	%r3, [%r8 + %r9] 0x80
	.word 0xcf3a2850  ! 501: STDF_I	std	%f7, [0x0850, %r8]
	.word 0xcc420009  ! 502: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xccf22f80  ! 503: STXA_I	stxa	%r6, [%r8 + 0x0f80] %asi
	.word 0xb24a22e0  ! 504: MULX_I	mulx 	%r8, 0x02e0, %r25
	.word 0xce7a2148  ! 505: SWAP_I	swap	%r7, [%r8 + 0x0148]
	.word 0xcb220009  ! 507: STF_R	st	%f5, [%r9, %r8]
	.word 0xfa720009  ! 508: STX_R	stx	%r29, [%r8 + %r9]
	.word 0xca120009  ! 508: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0x0ec20001  ! 509: BRGEZ	brgez  ,nt	%8,<label_0x20001>
	.word 0xa4520009  ! 510: UMUL_R	umul 	%r8, %r9, %r18
	.word 0xc2320009  ! 512: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xf81a0009  ! 512: LDD_R	ldd	[%r8 + %r9], %r28
	.word 0xdd3a0009  ! 514: STDF_R	std	%f14, [%r9, %r8]
	.word 0xca720009  ! 515: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xdd020009  ! 515: LDF_R	ld	[%r8, %r9], %f14
	.word 0xe8aa2f4c  ! 516: STBA_I	stba	%r20, [%r8 + 0x0f4c] %asi
	.word 0xc2822140  ! 517: LDUWA_I	lduwa	[%r8, + 0x0140] %asi, %r1
	.word 0xc36a2c3c  ! 518: PREFETCH_I	prefetch	[%r8 + 0x0c3c], #one_read
	.word 0x8ad22728  ! 519: UMULcc_I	umulcc 	%r8, 0x0728, %r5
	.word 0xfcfa2b9c  ! 520: SWAPA_I	swapa	%r30, [%r8 + 0x0b9c] %asi
	.word 0xdc1a0009  ! 521: LDD_R	ldd	[%r8 + %r9], %r14
	.word 0xc5e22009  ! 522: CASA_R	casa	[%r8] %asi, %r9, %r2
	.word 0x8143c000  ! 523: STBAR	stbar
	.word 0xf4320009  ! 525: STH_R	sth	%r26, [%r8 + %r9]
	.word 0xc80a0009  ! 525: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xccaa29f8  ! 526: STBA_I	stba	%r6, [%r8 + 0x09f8] %asi
	.word 0xe81a2068  ! 527: LDD_I	ldd	[%r8 + 0x0068], %r20
	.word 0xda821009  ! 528: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r13
	.word 0xab6a2aec  ! 529: SDIVX_I	sdivx	%r8, 0x0aec, %r21
	.word 0xc6320009  ! 531: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc85a0009  ! 531: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xcb1a0009  ! 532: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xc25a2810  ! 533: LDX_I	ldx	[%r8 + 0x0810], %r1
	.word 0x88720009  ! 534: UDIV_R	udiv 	%r8, %r9, %r4
	.word 0xc8220009  ! 536: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc6420009  ! 536: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0x8143c000  ! 537: STBAR	stbar
	.word 0xca220009  ! 539: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xce420009  ! 539: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xce2a0009  ! 541: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc4420009  ! 541: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xcbf22009  ! 542: CASXA_R	casxa	[%r8]%asi, %r9, %r5
	.word 0x8143e01e  ! 543: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside 
	.word 0x8522286c  ! 544: MULScc_I	mulscc 	%r8, 0x086c, %r2
	.word 0x85a208a9  ! 545: FSUBs	fsubs	%f8, %f9, %f2
	.word 0xc3ea21f4  ! 546: PREFETCHA_I	prefetcha	[%r8, + 0x01f4] %asi, #one_read
	.word 0xc3ea1009  ! 547: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc36a2600  ! 548: PREFETCH_I	prefetch	[%r8 + 0x0600], #one_read
	.word 0xcc120009  ! 549: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0x8143e052  ! 550: MEMBAR	membar	#StoreLoad | #Lookaside | #Sync 
	.word 0xc6822484  ! 551: LDUWA_I	lduwa	[%r8, + 0x0484] %asi, %r3
	.word 0xc3f21009  ! 552: CASXA_I	casxa	[%r8] 0x80, %r9, %r1
	.word 0x40000001  ! 553: CALL	call	disp30_1
	.word 0xfe220009  ! 555: STW_R	stw	%r31, [%r8 + %r9]
	.word 0xee0a0009  ! 555: LDUB_R	ldub	[%r8 + %r9], %r23
	.word 0xe8c22098  ! 556: LDSWA_I	ldswa	[%r8, + 0x0098] %asi, %r20
	.word 0xc36a2898  ! 557: PREFETCH_I	prefetch	[%r8 + 0x0898], #one_read
	.word 0xcc720009  ! 559: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc8420009  ! 559: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xe53a2370  ! 560: STDF_I	std	%f18, [0x0370, %r8]
	.word 0x8143e00d  ! 561: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore 
	.word 0x8efa0009  ! 562: SDIVcc_R	sdivcc 	%r8, %r9, %r7
	.word 0x8e5227b4  ! 563: UMUL_I	umul 	%r8, 0x07b4, %r7
	.word 0xc2220009  ! 565: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xcc1a0009  ! 565: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0x83a20829  ! 566: FADDs	fadds	%f8, %f9, %f1
	.word 0xc5e22009  ! 567: CASA_R	casa	[%r8] %asi, %r9, %r2
	.word 0xc6220009  ! 569: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xec020009  ! 569: LDUW_R	lduw	[%r8 + %r9], %r22
	.word 0xce220009  ! 571: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xfc420009  ! 571: LDSW_R	ldsw	[%r8 + %r9], %r30
	.word 0xe72223c8  ! 572: STF_I	st	%f19, [0x03c8, %r8]
	.word 0xc3ea1009  ! 573: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xd8220009  ! 575: STW_R	stw	%r12, [%r8 + %r9]
	.word 0xe0420009  ! 575: LDSW_R	ldsw	[%r8 + %r9], %r16
	.word 0xc36a243c  ! 576: PREFETCH_I	prefetch	[%r8 + 0x043c], #one_read
	.word 0x8c5a0009  ! 577: SMUL_R	smul 	%r8, %r9, %r6
	.word 0xc2a21009  ! 578: STWA_R	stwa	%r1, [%r8 + %r9] 0x80
	.word 0x8143c000  ! 579: STBAR	stbar
	.word 0xc7222a20  ! 580: STF_I	st	%f3, [0x0a20, %r8]
	.word 0x24c20001  ! 581: BRLEZ	brlez,a,nt	%8,<label_0x20001>
	.word 0xc5f22009  ! 582: CASXA_R	casxa	[%r8]%asi, %r9, %r2
	.word 0xc42a0009  ! 584: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc64a0009  ! 584: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xc3ea1009  ! 585: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x32800001  ! 586: BNE	bne,a	<label_0x1>
	.word 0xc2120009  ! 587: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xe0320009  ! 589: STH_R	sth	%r16, [%r8 + %r9]
	.word 0xc6520009  ! 589: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xc26a0009  ! 590: LDSTUB_R	ldstub	%r1, [%r8 + %r9]
	.word 0xc46a0009  ! 591: LDSTUB_R	ldstub	%r2, [%r8 + %r9]
	.word 0xb6f20009  ! 592: UDIVcc_R	udivcc 	%r8, %r9, %r27
	.word 0xca8a2dbc  ! 593: LDUBA_I	lduba	[%r8, + 0x0dbc] %asi, %r5
	.word 0xdc82279c  ! 594: LDUWA_I	lduwa	[%r8, + 0x079c] %asi, %r14
	.word 0x832225c4  ! 595: MULScc_I	mulscc 	%r8, 0x05c4, %r1
	.word 0x8143e041  ! 596: MEMBAR	membar	#LoadLoad | #Sync 
	.word 0xcc422cf4  ! 597: LDSW_I	ldsw	[%r8 + 0x0cf4], %r6
	.word 0xbba20829  ! 598: FADDs	fadds	%f8, %f9, %f29
	.word 0xf1f22009  ! 599: CASXA_R	casxa	[%r8]%asi, %r9, %r24
	.word 0x8ba20829  ! 600: FADDs	fadds	%f8, %f9, %f5
	.word 0xc4ba1009  ! 601: STDA_R	stda	%r2, [%r8 + %r9] 0x80
	.word 0x2ac20001  ! 602: BRNZ	brnz,a,nt	%8,<label_0x20001>
	.word 0xccc2212c  ! 603: LDSWA_I	ldswa	[%r8, + 0x012c] %asi, %r6
	.word 0x8a520009  ! 604: UMUL_R	umul 	%r8, %r9, %r5
	.word 0x8143e070  ! 605: MEMBAR	membar	#Lookaside | #MemIssue | #Sync 
	.word 0xf68a234c  ! 606: LDUBA_I	lduba	[%r8, + 0x034c] %asi, %r27
	.word 0xc36a0009  ! 607: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xcdf22009  ! 608: CASXA_R	casxa	[%r8]%asi, %r9, %r6
	.word 0x8143e01e  ! 609: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside 
	.word 0xc3ea218c  ! 610: PREFETCHA_I	prefetcha	[%r8, + 0x018c] %asi, #one_read
	.word 0xc36a23e4  ! 611: PREFETCH_I	prefetch	[%r8 + 0x03e4], #one_read
	.word 0xb67a2498  ! 612: SDIV_I	sdiv 	%r8, 0x0498, %r27
	.word 0xc4220009  ! 614: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc45a0009  ! 614: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xcea21009  ! 615: STWA_R	stwa	%r7, [%r8 + %r9] 0x80
	.word 0xc2a22bfc  ! 616: STWA_I	stwa	%r1, [%r8 + 0x0bfc] %asi
	.word 0xc36a209c  ! 617: PREFETCH_I	prefetch	[%r8 + 0x009c], #one_read
	.word 0x8143c000  ! 618: STBAR	stbar
	.word 0xe0fa1009  ! 619: SWAPA_R	swapa	%r16, [%r8 + %r9] 0x80
	.word 0xc3ea1009  ! 620: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x89220009  ! 621: MULScc_R	mulscc 	%r8, %r9, %r4
	.word 0xce220009  ! 623: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xe05a0009  ! 623: LDX_R	ldx	[%r8 + %r9], %r16
	.word 0xca6a20f0  ! 624: LDSTUB_I	ldstub	%r5, [%r8 + 0x00f0]
	.word 0xcf220009  ! 626: STF_R	st	%f7, [%r9, %r8]
	.word 0xce720009  ! 627: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xee520009  ! 627: LDSH_R	ldsh	[%r8 + %r9], %r23
	.word 0xba520009  ! 628: UMUL_R	umul 	%r8, %r9, %r29
	.word 0xc3ea2330  ! 629: PREFETCHA_I	prefetcha	[%r8, + 0x0330] %asi, #one_read
	.word 0x82fa2cd8  ! 630: SDIVcc_I	sdivcc 	%r8, 0x0cd8, %r1
	.word 0xf2c21009  ! 631: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r25
	.word 0x856a29c4  ! 632: SDIVX_I	sdivx	%r8, 0x09c4, %r2
	.word 0xe33a2d28  ! 633: STDF_I	std	%f17, [0x0d28, %r8]
	.word 0xce2a0009  ! 635: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xcc420009  ! 635: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xcd2221ec  ! 636: STF_I	st	%f6, [0x01ec, %r8]
	.word 0xca922184  ! 637: LDUHA_I	lduha	[%r8, + 0x0184] %asi, %r5
	.word 0xcaf21009  ! 638: STXA_R	stxa	%r5, [%r8 + %r9] 0x80
	.word 0xc3ea1009  ! 639: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xceea2e1c  ! 640: LDSTUBA_I	ldstuba	%r7, [%r8 + 0x0e1c] %asi
	.word 0xaa722c94  ! 641: UDIV_I	udiv 	%r8, 0x0c94, %r21
	.word 0xc2c226a4  ! 642: LDSWA_I	ldswa	[%r8, + 0x06a4] %asi, %r1
	.word 0xc36a2060  ! 643: PREFETCH_I	prefetch	[%r8 + 0x0060], #one_read
	.word 0x84d222b4  ! 644: UMULcc_I	umulcc 	%r8, 0x02b4, %r2
	.word 0xa9220009  ! 645: MULScc_R	mulscc 	%r8, %r9, %r20
	.word 0x38800001  ! 646: BGU	bgu,a	<label_0x1>
	.word 0xcd3a0009  ! 648: STDF_R	std	%f6, [%r9, %r8]
	.word 0xf4720009  ! 649: STX_R	stx	%r26, [%r8 + %r9]
	.word 0xfc1a0009  ! 649: LDD_R	ldd	[%r8 + %r9], %r30
	.word 0xab6a25ec  ! 650: SDIVX_I	sdivx	%r8, 0x05ec, %r21
	.word 0xac520009  ! 651: UMUL_R	umul 	%r8, %r9, %r22
	.word 0x86720009  ! 652: UDIV_R	udiv 	%r8, %r9, %r3
	.word 0x20800002  ! 653: BN	bn,a	<label_0x2>
	.word 0xcc6a0009  ! 654: LDSTUB_R	ldstub	%r6, [%r8 + %r9]
	.word 0xe53a2ba8  ! 655: STDF_I	std	%f18, [0x0ba8, %r8]
	.word 0xc6220009  ! 657: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xe4120009  ! 657: LDUH_R	lduh	[%r8 + %r9], %r18
	.word 0x12800002  ! 658: BNE	bne  	<label_0x2>
	.word 0xb24a0009  ! 659: MULX_R	mulx 	%r8, %r9, %r25
	.word 0xe4ba1009  ! 660: STDA_R	stda	%r18, [%r8 + %r9] 0x80
	.word 0xe22a0009  ! 662: STB_R	stb	%r17, [%r8 + %r9]
	.word 0xfd020009  ! 662: LDF_R	ld	[%r8, %r9], %f30
	.word 0xcd220009  ! 664: STF_R	st	%f6, [%r9, %r8]
	.word 0xcc720009  ! 665: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xcc4a0009  ! 665: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xa2720009  ! 666: UDIV_R	udiv 	%r8, %r9, %r17
	.word 0xbad2277c  ! 667: UMULcc_I	umulcc 	%r8, 0x077c, %r29
	.word 0xcfe22009  ! 668: CASA_R	casa	[%r8] %asi, %r9, %r7
	.word 0xfe2a0009  ! 670: STB_R	stb	%r31, [%r8 + %r9]
	.word 0xdc1a0009  ! 670: LDD_R	ldd	[%r8 + %r9], %r14
	.word 0x8e720009  ! 671: UDIV_R	udiv 	%r8, %r9, %r7
	.word 0x2cca0001  ! 672: BRGZ	brgz,a,pt	%8,<label_0xa0001>
	.word 0xc82a0009  ! 674: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xcd020009  ! 674: LDF_R	ld	[%r8, %r9], %f6
	.word 0xec1a25c8  ! 675: LDD_I	ldd	[%r8 + 0x05c8], %r22
	.word 0xc36a0009  ! 676: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc70224c0  ! 677: LDF_I	ld	[%r8, 0x04c0], %f3
	.word 0x28800002  ! 678: BLEU	bleu,a	<label_0x2>
	.word 0xc8ba2e78  ! 679: STDA_I	stda	%r4, [%r8 + 0x0e78] %asi
	.word 0x864a26fc  ! 680: MULX_I	mulx 	%r8, 0x06fc, %r3
	.word 0x8143e064  ! 681: MEMBAR	membar	#LoadStore | #MemIssue | #Sync 
	.word 0x87a20829  ! 682: FADDs	fadds	%f8, %f9, %f3
	.word 0xec7a2244  ! 683: SWAP_I	swap	%r22, [%r8 + 0x0244]
	.word 0x02c20001  ! 684: BRZ	brz  ,nt	%8,<label_0x20001>
	.word 0x8a7a0009  ! 685: SDIV_R	sdiv 	%r8, %r9, %r5
	.word 0xc8c21009  ! 686: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r4
	.word 0xcf3a0009  ! 688: STDF_R	std	%f7, [%r9, %r8]
	.word 0xf6720009  ! 689: STX_R	stx	%r27, [%r8 + %r9]
	.word 0xe91a0009  ! 689: LDDF_R	ldd	[%r8, %r9], %f20
	.word 0xf2720009  ! 691: STX_R	stx	%r25, [%r8 + %r9]
	.word 0xc64a0009  ! 691: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xceb22b94  ! 692: STHA_I	stha	%r7, [%r8 + 0x0b94] %asi
	.word 0xcc921009  ! 693: LDUHA_R	lduha	[%r8, %r9] 0x80, %r6
	.word 0x82da2294  ! 694: SMULcc_I	smulcc 	%r8, 0x0294, %r1
	.word 0x8143e039  ! 695: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside | #MemIssue 
	.word 0x8da20829  ! 696: FADDs	fadds	%f8, %f9, %f6
	.word 0xc8ea2f7c  ! 697: LDSTUBA_I	ldstuba	%r4, [%r8 + 0x0f7c] %asi
	.word 0x8e6a2e14  ! 698: UDIVX_I	udivx 	%r8, 0x0e14, %r7
	.word 0xea220009  ! 700: STW_R	stw	%r21, [%r8 + %r9]
	.word 0xc81a0009  ! 700: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xc3ea1009  ! 701: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xd8520009  ! 702: LDSH_R	ldsh	[%r8 + %r9], %r12
	.word 0x2a800002  ! 703: BCS	bcs,a	<label_0x2>
	.word 0x8143c000  ! 704: STBAR	stbar
	.word 0xc6a22cb0  ! 705: STWA_I	stwa	%r3, [%r8 + 0x0cb0] %asi
	.word 0x0eca0001  ! 706: BRGEZ	brgez  ,pt	%8,<label_0xa0001>
	.word 0xde320009  ! 708: STH_R	sth	%r15, [%r8 + %r9]
	.word 0xd6520009  ! 708: LDSH_R	ldsh	[%r8 + %r9], %r11
	.word 0xc9222aac  ! 709: STF_I	st	%f4, [0x0aac, %r8]
	.word 0x86f22398  ! 710: UDIVcc_I	udivcc 	%r8, 0x0398, %r3
	.word 0xc4fa26cc  ! 711: SWAPA_I	swapa	%r2, [%r8 + 0x06cc] %asi
	.word 0x8efa265c  ! 712: SDIVcc_I	sdivcc 	%r8, 0x065c, %r7
	.word 0x89220009  ! 713: MULScc_R	mulscc 	%r8, %r9, %r4
	.word 0x8143c000  ! 714: STBAR	stbar
	.word 0x8143c000  ! 715: STBAR	stbar
	.word 0x22800001  ! 716: BE	be,a	<label_0x1>
	.word 0xcb3a2bd8  ! 717: STDF_I	std	%f5, [0x0bd8, %r8]
	.word 0x9da208a9  ! 718: FSUBs	fsubs	%f8, %f9, %f14
	.word 0x06800001  ! 719: BL	bl  	<label_0x1>
	.word 0x26ca0001  ! 720: BRLZ	brlz,a,pt	%8,<label_0xa0001>
	.word 0xca8a1009  ! 721: LDUBA_R	lduba	[%r8, %r9] 0x80, %r5
	.word 0xfcca1009  ! 722: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r30
	.word 0xc5e22009  ! 723: CASA_R	casa	[%r8] %asi, %r9, %r2
	.word 0xc46a26f8  ! 724: LDSTUB_I	ldstub	%r2, [%r8 + 0x06f8]
	.word 0xc62a0009  ! 726: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc91a0009  ! 726: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xc7222180  ! 727: STF_I	st	%f3, [0x0180, %r8]
	.word 0xe0ea1009  ! 728: LDSTUBA_R	ldstuba	%r16, [%r8 + %r9] 0x80
	.word 0xc3ea2e18  ! 729: PREFETCHA_I	prefetcha	[%r8, + 0x0e18] %asi, #one_read
	.word 0x8143c000  ! 730: STBAR	stbar
	.word 0xa2d22a28  ! 731: UMULcc_I	umulcc 	%r8, 0x0a28, %r17
	.word 0xf85224b0  ! 732: LDSH_I	ldsh	[%r8 + 0x04b0], %r28
	.word 0x8143e051  ! 733: MEMBAR	membar	#LoadLoad | #Lookaside | #Sync 
	.word 0x8f6a0009  ! 734: SDIVX_R	sdivx	%r8, %r9, %r7
	.word 0xc9220009  ! 736: STF_R	st	%f4, [%r9, %r8]
	.word 0xce720009  ! 737: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xde0a0009  ! 737: LDUB_R	ldub	[%r8 + %r9], %r15
	.word 0xca220009  ! 739: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc40a0009  ! 739: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0x2e800001  ! 740: BVS	bvs,a	<label_0x1>
	.word 0x86da20c4  ! 741: SMULcc_I	smulcc 	%r8, 0x00c4, %r3
	.word 0xcd220009  ! 743: STF_R	st	%f6, [%r9, %r8]
	.word 0xc6720009  ! 744: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xcc020009  ! 744: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xe07a213c  ! 745: SWAP_I	swap	%r16, [%r8 + 0x013c]
	.word 0xa2520009  ! 746: UMUL_R	umul 	%r8, %r9, %r17
	.word 0xe82a0009  ! 748: STB_R	stb	%r20, [%r8 + %r9]
	.word 0xe8120009  ! 748: LDUH_R	lduh	[%r8 + %r9], %r20
	.word 0xc36a2134  ! 749: PREFETCH_I	prefetch	[%r8 + 0x0134], #one_read
	.word 0x8143e006  ! 750: MEMBAR	membar	#StoreLoad | #LoadStore 
	.word 0xc3ea1009  ! 751: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x96520009  ! 752: UMUL_R	umul 	%r8, %r9, %r11
	.word 0xca220009  ! 754: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc2420009  ! 754: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xef3a0009  ! 756: STDF_R	std	%f23, [%r9, %r8]
	.word 0xcc720009  ! 757: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xce4a0009  ! 757: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xc2b22b54  ! 758: STHA_I	stha	%r1, [%r8 + 0x0b54] %asi
	.word 0xc60a0009  ! 759: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xee0a2458  ! 760: LDUB_I	ldub	[%r8 + 0x0458], %r23
	.word 0xd8a21009  ! 761: STWA_R	stwa	%r12, [%r8 + %r9] 0x80
	.word 0x26ca0001  ! 762: BRLZ	brlz,a,pt	%8,<label_0xa0001>
	.word 0xc8220009  ! 764: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xf2420009  ! 764: LDSW_R	ldsw	[%r8 + %r9], %r25
	.word 0x847a0009  ! 765: SDIV_R	sdiv 	%r8, %r9, %r2
	.word 0xb66a22d0  ! 766: UDIVX_I	udivx 	%r8, 0x02d0, %r27
	.word 0x12800001  ! 767: BNE	bne  	<label_0x1>
	.word 0xcea223d4  ! 768: STWA_I	stwa	%r7, [%r8 + 0x03d4] %asi
	.word 0xfc821009  ! 769: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r30
	.word 0xdd3a2140  ! 770: STDF_I	std	%f14, [0x0140, %r8]
	.word 0xe42a0009  ! 772: STB_R	stb	%r18, [%r8 + %r9]
	.word 0xce0a0009  ! 772: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xb1a209a9  ! 773: FDIVs	fdivs	%f8, %f9, %f24
	.word 0xf1222868  ! 774: STF_I	st	%f24, [0x0868, %r8]
	.word 0x0ec20001  ! 775: BRGEZ	brgez  ,nt	%8,<label_0x20001>
	.word 0x8143c000  ! 776: STBAR	stbar
	.word 0x8e5a2a50  ! 777: SMUL_I	smul 	%r8, 0x0a50, %r7
	.word 0xce921009  ! 778: LDUHA_R	lduha	[%r8, %r9] 0x80, %r7
	.word 0xec0a0009  ! 779: LDUB_R	ldub	[%r8 + %r9], %r22
	.word 0x86da2bfc  ! 780: SMULcc_I	smulcc 	%r8, 0x0bfc, %r3
	.word 0xc3ea22c4  ! 781: PREFETCHA_I	prefetcha	[%r8, + 0x02c4] %asi, #one_read
	.word 0x8143c000  ! 782: STBAR	stbar
	.word 0xbe5a0009  ! 783: SMUL_R	smul 	%r8, %r9, %r31
	.word 0xce720009  ! 785: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xe45a0009  ! 785: LDX_R	ldx	[%r8 + %r9], %r18
	.word 0xfd3a25b0  ! 786: STDF_I	std	%f30, [0x05b0, %r8]
	.word 0x24ca0001  ! 787: BRLEZ	brlez,a,pt	%8,<label_0xa0001>
	.word 0xc2220009  ! 789: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc44a0009  ! 789: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0x9a720009  ! 790: UDIV_R	udiv 	%r8, %r9, %r13
	.word 0xc3ea23b4  ! 791: PREFETCHA_I	prefetcha	[%r8, + 0x03b4] %asi, #one_read
	.word 0xd49a2910  ! 792: LDDA_I	ldda	[%r8, + 0x0910] %asi, %r10
	.word 0x8fa208a9  ! 793: FSUBs	fsubs	%f8, %f9, %f7
	.word 0x8143e07f  ! 794: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xdc720009  ! 796: STX_R	stx	%r14, [%r8 + %r9]
	.word 0xc8020009  ! 796: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xc8220009  ! 798: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xf2020009  ! 798: LDUW_R	lduw	[%r8 + %r9], %r25
	.word 0xc82a0009  ! 800: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xcc120009  ! 800: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xcd3a0009  ! 802: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc6720009  ! 803: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xf4020009  ! 803: LDUW_R	lduw	[%r8 + %r9], %r26
	.word 0xcc4a0009  ! 804: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xe6220009  ! 806: STW_R	stw	%r19, [%r8 + %r9]
	.word 0xf80a0009  ! 806: LDUB_R	ldub	[%r8 + %r9], %r28
	.word 0xdc320009  ! 808: STH_R	sth	%r14, [%r8 + %r9]
	.word 0xf45a0009  ! 808: LDX_R	ldx	[%r8 + %r9], %r26
	.word 0xc4f21009  ! 809: STXA_R	stxa	%r2, [%r8 + %r9] 0x80
	.word 0xccb21009  ! 810: STHA_R	stha	%r6, [%r8 + %r9] 0x80
	.word 0xc8420009  ! 811: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xc88229d4  ! 812: LDUWA_I	lduwa	[%r8, + 0x09d4] %asi, %r4
	.word 0x8f6a267c  ! 813: SDIVX_I	sdivx	%r8, 0x067c, %r7
	.word 0xfff21009  ! 814: CASXA_I	casxa	[%r8] 0x80, %r9, %r31
	.word 0xc2220009  ! 816: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xce420009  ! 816: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xcaaa2d04  ! 817: STBA_I	stba	%r5, [%r8 + 0x0d04] %asi
	.word 0xf73a0009  ! 819: STDF_R	std	%f27, [%r9, %r8]
	.word 0xca720009  ! 820: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc81a0009  ! 820: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xc89a20d0  ! 821: LDDA_I	ldda	[%r8, + 0x00d0] %asi, %r4
	.word 0x846a24a0  ! 822: UDIVX_I	udivx 	%r8, 0x04a0, %r2
	.word 0xcc720009  ! 824: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc24a0009  ! 824: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xcc220009  ! 826: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc85a0009  ! 826: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0x2ac20001  ! 827: BRNZ	brnz,a,nt	%8,<label_0x20001>
	.word 0xc36a0009  ! 828: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc36a2128  ! 829: PREFETCH_I	prefetch	[%r8 + 0x0128], #one_read
	.word 0xc4b22f58  ! 830: STHA_I	stha	%r2, [%r8 + 0x0f58] %asi
	.word 0xc01a28c8  ! 831: LDD_I	ldd	[%r8 + 0x08c8], %r0
	.word 0x82720009  ! 832: UDIV_R	udiv 	%r8, %r9, %r1
	.word 0x8143e053  ! 833: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside | #Sync 
	.word 0x8d6a0009  ! 834: SDIVX_R	sdivx	%r8, %r9, %r6
	.word 0xc8ba1009  ! 835: STDA_R	stda	%r4, [%r8 + %r9] 0x80
	.word 0x8fa20929  ! 836: FMULs	fmuls	%f8, %f9, %f7
	.word 0xceca2c8c  ! 837: LDSBA_I	ldsba	[%r8, + 0x0c8c] %asi, %r7
	.word 0x8cd221f8  ! 838: UMULcc_I	umulcc 	%r8, 0x01f8, %r6
	.word 0x02c20001  ! 839: BRZ	brz  ,nt	%8,<label_0x20001>
	.word 0xbe7a21fc  ! 840: SDIV_I	sdiv 	%r8, 0x01fc, %r31
	.word 0xc6c21009  ! 841: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r3
	.word 0x8143c000  ! 842: STBAR	stbar
	.word 0x06800001  ! 843: BL	bl  	<label_0x1>
	.word 0xe13a25e8  ! 844: STDF_I	std	%f16, [0x05e8, %r8]
	.word 0xc2220009  ! 846: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc4520009  ! 846: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0x02c20001  ! 847: BRZ	brz  ,nt	%8,<label_0x20001>
	.word 0xcc9a1009  ! 848: LDDA_R	ldda	[%r8, %r9] 0x80, %r6
	.word 0xcf220009  ! 850: STF_R	st	%f7, [%r9, %r8]
	.word 0xf4720009  ! 851: STX_R	stx	%r26, [%r8 + %r9]
	.word 0xed020009  ! 851: LDF_R	ld	[%r8, %r9], %f22
	.word 0xa47a2ebc  ! 852: SDIV_I	sdiv 	%r8, 0x0ebc, %r18
	.word 0xbfa20829  ! 853: FADDs	fadds	%f8, %f9, %f31
	.word 0xc93a0009  ! 855: STDF_R	std	%f4, [%r9, %r8]
	.word 0xc4720009  ! 856: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xde4a0009  ! 856: LDSB_R	ldsb	[%r8 + %r9], %r15
	.word 0x8143c000  ! 857: STBAR	stbar
	.word 0xbfa20929  ! 858: FMULs	fmuls	%f8, %f9, %f31
	.word 0x1a800001  ! 859: BCC	bcc  	<label_0x1>
	.word 0x04800002  ! 860: BLE	ble  	<label_0x2>
	.word 0xca7a20e8  ! 861: SWAP_I	swap	%r5, [%r8 + 0x00e8]
	.word 0x38800001  ! 862: BGU	bgu,a	<label_0x1>
	.word 0xc3ea1009  ! 863: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc3ea2b7c  ! 864: PREFETCHA_I	prefetcha	[%r8, + 0x0b7c] %asi, #one_read
	.word 0x1e800002  ! 865: BVC	bvc  	<label_0x2>
	.word 0x3c800001  ! 866: BPOS	bpos,a	<label_0x1>
	.word 0xc36a2644  ! 867: PREFETCH_I	prefetch	[%r8 + 0x0644], #one_read
	.word 0xe8320009  ! 869: STH_R	sth	%r20, [%r8 + %r9]
	.word 0xc01a0009  ! 869: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0xce320009  ! 871: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc01a0009  ! 871: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0xf6da1009  ! 872: LDXA_R	ldxa	[%r8, %r9] 0x80, %r27
	.word 0xc3ea1009  ! 873: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0x8143c000  ! 874: STBAR	stbar
	.word 0xc3f21009  ! 875: CASXA_I	casxa	[%r8] 0x80, %r9, %r1
	.word 0xce8a2ce8  ! 876: LDUBA_I	lduba	[%r8, + 0x0ce8] %asi, %r7
	.word 0x8ba20829  ! 877: FADDs	fadds	%f8, %f9, %f5
	.word 0xc9220009  ! 879: STF_R	st	%f4, [%r9, %r8]
	.word 0xc6720009  ! 880: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xe0420009  ! 880: LDSW_R	ldsw	[%r8 + %r9], %r16
	.word 0x40000002  ! 881: CALL	call	disp30_2
	.word 0xf0ba1009  ! 882: STDA_R	stda	%r24, [%r8 + %r9] 0x80
	.word 0x8143e009  ! 883: MEMBAR	membar	#LoadLoad | #StoreStore 
	.word 0xc82a0009  ! 885: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc85a0009  ! 885: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0x8143e06f  ! 886: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #MemIssue | #Sync 
	.word 0x856a0009  ! 887: SDIVX_R	sdivx	%r8, %r9, %r2
	.word 0xc4c22ee4  ! 888: LDSWA_I	ldswa	[%r8, + 0x0ee4] %asi, %r2
	.word 0xb87a0009  ! 889: SDIV_R	sdiv 	%r8, %r9, %r28
	.word 0xc8d21009  ! 890: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r4
	.word 0x83a20829  ! 891: FADDs	fadds	%f8, %f9, %f1
	.word 0xcb3a0009  ! 893: STDF_R	std	%f5, [%r9, %r8]
	.word 0xce720009  ! 894: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xca420009  ! 894: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xf0ea2a84  ! 895: LDSTUBA_I	ldstuba	%r24, [%r8 + 0x0a84] %asi
	.word 0x83a20829  ! 896: FADDs	fadds	%f8, %f9, %f1
	.word 0xc2821009  ! 897: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r1
	.word 0xb04a29d0  ! 898: MULX_I	mulx 	%r8, 0x09d0, %r24
	.word 0xca520009  ! 899: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0x844a0009  ! 900: MULX_R	mulx 	%r8, %r9, %r2
	.word 0x8143c000  ! 901: STBAR	stbar
	.word 0x8da20929  ! 902: FMULs	fmuls	%f8, %f9, %f6
	.word 0x8f222fd0  ! 903: MULScc_I	mulscc 	%r8, 0x0fd0, %r7
	.word 0xcea21009  ! 904: STWA_R	stwa	%r7, [%r8 + %r9] 0x80
	.word 0xc8320009  ! 906: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc4420009  ! 906: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0x8143c000  ! 907: STBAR	stbar
	.word 0xc36a23bc  ! 908: PREFETCH_I	prefetch	[%r8 + 0x03bc], #one_read
	.word 0xc4720009  ! 910: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc6520009  ! 910: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xe93a2218  ! 911: STDF_I	std	%f20, [0x0218, %r8]
	.word 0xf53a0009  ! 913: STDF_R	std	%f26, [%r9, %r8]
	.word 0xc4720009  ! 914: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc81a0009  ! 914: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xce0a2c64  ! 915: LDUB_I	ldub	[%r8 + 0x0c64], %r7
	.word 0x8c6a2430  ! 916: UDIVX_I	udivx 	%r8, 0x0430, %r6
	.word 0xccca1009  ! 917: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r6
	.word 0xc4220009  ! 919: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc8520009  ! 919: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xb9222f9c  ! 920: MULScc_I	mulscc 	%r8, 0x0f9c, %r28
	.word 0x10800001  ! 921: BA	ba  	<label_0x1>
	.word 0xbaf224a4  ! 922: UDIVcc_I	udivcc 	%r8, 0x04a4, %r29
	.word 0x876a2b28  ! 923: SDIVX_I	sdivx	%r8, 0x0b28, %r3
	.word 0xcc220009  ! 925: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xfa020009  ! 925: LDUW_R	lduw	[%r8 + %r9], %r29
	.word 0xb4520009  ! 926: UMUL_R	umul 	%r8, %r9, %r26
	.word 0xc73a0009  ! 928: STDF_R	std	%f3, [%r9, %r8]
	.word 0xf4720009  ! 929: STX_R	stx	%r26, [%r8 + %r9]
	.word 0xc4120009  ! 929: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xe88a2164  ! 930: LDUBA_I	lduba	[%r8, + 0x0164] %asi, %r20
	.word 0x86520009  ! 931: UMUL_R	umul 	%r8, %r9, %r3
	.word 0xc46a0009  ! 932: LDSTUB_R	ldstub	%r2, [%r8 + %r9]
	.word 0xcd2223a4  ! 933: STF_I	st	%f6, [0x03a4, %r8]
	.word 0xe0220009  ! 935: STW_R	stw	%r16, [%r8 + %r9]
	.word 0xc01a0009  ! 935: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0x8143c000  ! 936: STBAR	stbar
	.word 0xc22a0009  ! 938: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xcd020009  ! 938: LDF_R	ld	[%r8, %r9], %f6
	.word 0xc36a29cc  ! 939: PREFETCH_I	prefetch	[%r8 + 0x09cc], #one_read
	.word 0xcafa2ab0  ! 940: SWAPA_I	swapa	%r5, [%r8 + 0x0ab0] %asi
	.word 0xcb222690  ! 941: STF_I	st	%f5, [0x0690, %r8]
	.word 0xc6022cbc  ! 942: LDUW_I	lduw	[%r8 + 0x0cbc], %r3
	.word 0xfd220009  ! 944: STF_R	st	%f30, [%r9, %r8]
	.word 0xc6720009  ! 945: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc7020009  ! 945: LDF_R	ld	[%r8, %r9], %f3
	.word 0x845a2708  ! 946: SMUL_I	smul 	%r8, 0x0708, %r2
	.word 0xcc4225c4  ! 947: LDSW_I	ldsw	[%r8 + 0x05c4], %r6
	.word 0xfa7a0009  ! 948: SWAP_R	swap	%r29, [%r8 + %r9]
	.word 0xa8d20009  ! 949: UMULcc_R	umulcc 	%r8, %r9, %r20
	.word 0xcc320009  ! 951: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xfa5a0009  ! 951: LDX_R	ldx	[%r8 + %r9], %r29
	.word 0xcafa274c  ! 952: SWAPA_I	swapa	%r5, [%r8 + 0x074c] %asi
	.word 0x40000002  ! 953: CALL	call	disp30_2
	.word 0xda1226ac  ! 954: LDUH_I	lduh	[%r8 + 0x06ac], %r13
	.word 0xfc220009  ! 956: STW_R	stw	%r30, [%r8 + %r9]
	.word 0xe5020009  ! 956: LDF_R	ld	[%r8, %r9], %f18
	.word 0xce7a0009  ! 957: SWAP_R	swap	%r7, [%r8 + %r9]
	.word 0xc2320009  ! 959: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc2020009  ! 959: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0x84fa0009  ! 960: SDIVcc_R	sdivcc 	%r8, %r9, %r2
	.word 0xe11a20e0  ! 961: LDDF_I	ldd	[%r8, 0x00e0], %f16
	.word 0xfc320009  ! 963: STH_R	sth	%r30, [%r8 + %r9]
	.word 0xf41a0009  ! 963: LDD_R	ldd	[%r8 + %r9], %r26
	.word 0xc3e21009  ! 964: CASA_I	casa	[%r8] 0x80, %r9, %r1
	.word 0xbed20009  ! 965: UMULcc_R	umulcc 	%r8, %r9, %r31
	.word 0x832226a8  ! 966: MULScc_I	mulscc 	%r8, 0x06a8, %r1
	.word 0x83222230  ! 967: MULScc_I	mulscc 	%r8, 0x0230, %r1
	.word 0xec320009  ! 969: STH_R	sth	%r22, [%r8 + %r9]
	.word 0xdc0a0009  ! 969: LDUB_R	ldub	[%r8 + %r9], %r14
	.word 0x84720009  ! 970: UDIV_R	udiv 	%r8, %r9, %r2
	.word 0xea720009  ! 972: STX_R	stx	%r21, [%r8 + %r9]
	.word 0xe11a0009  ! 972: LDDF_R	ldd	[%r8, %r9], %f16
	.word 0xc3ea25c0  ! 973: PREFETCHA_I	prefetcha	[%r8, + 0x05c0] %asi, #one_read
	.word 0x82d20009  ! 974: UMULcc_R	umulcc 	%r8, %r9, %r1
	.word 0xc3ea2844  ! 975: PREFETCHA_I	prefetcha	[%r8, + 0x0844] %asi, #one_read
	.word 0xa2fa0009  ! 976: SDIVcc_R	sdivcc 	%r8, %r9, %r17
	.word 0xe82a0009  ! 978: STB_R	stb	%r20, [%r8 + %r9]
	.word 0xc8020009  ! 978: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xcaa221e0  ! 979: STWA_I	stwa	%r5, [%r8 + 0x01e0] %asi
	.word 0x8143e06f  ! 980: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #MemIssue | #Sync 
	.word 0x00800001  ! 981: BN	bn  	<label_0x1>
	.word 0xc3ea1009  ! 982: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xcca229a0  ! 983: STWA_I	stwa	%r6, [%r8 + 0x09a0] %asi
	.word 0xc8220009  ! 985: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xce520009  ! 985: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xc42a0009  ! 987: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc40a0009  ! 987: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xc6422fb0  ! 988: LDSW_I	ldsw	[%r8 + 0x0fb0], %r3
	.word 0xce2a0009  ! 990: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xfa120009  ! 990: LDUH_R	lduh	[%r8 + %r9], %r29
	.word 0xc6ea1009  ! 991: LDSTUBA_R	ldstuba	%r3, [%r8 + %r9] 0x80
	.word 0x8143e03c  ! 992: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0x83a20829  ! 993: FADDs	fadds	%f8, %f9, %f1
	.word 0xce720009  ! 995: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xe40a0009  ! 995: LDUB_R	ldub	[%r8 + %r9], %r18
	.word 0x34800001  ! 996: BG	bg,a	<label_0x1>
	.word 0xc8f21009  ! 997: STXA_R	stxa	%r4, [%r8 + %r9] 0x80
	.word 0xc4aa1009  ! 998: STBA_R	stba	%r2, [%r8 + %r9] 0x80
	.word 0xc3f22009  ! 999: CASXA_R	casxa	[%r8]%asi, %r9, %r1
	nop
	nop
	nop
        ta      T_GOOD_TRAP

.data
	.word  0xbb9c9c70,0xb6e9156a,0x81911963,0x50d94e7f
	.word  0x69cb95fb,0x0e23e032,0xacbb6cd4,0x0658d490
	.word  0xd6ef49e4,0x639ae34b,0x2fbfefcb,0x9243b3d0
	.word  0x59b474b5,0x9b4bdf00,0x9fe672cd,0x58df5774
	.word  0x03a5525a,0x0343f0b1,0xca634121,0x659f2d1c
	.word  0x271616ee,0x10ffea29,0x131e2557,0x7e4e6d82
	.word  0xce2b3ee7,0x15169695,0x1f0a4858,0x914a24c8
	.word  0x7b3e3c54,0xd457a250,0x5e5d3b8b,0x1587f75d
	.word  0xf11db7ee,0xe866d244,0x7090cbdf,0x45879c35
	.word  0xd0f84462,0x27e607a9,0x3f59eb34,0xd9776e00
	.word  0x8012fd5b,0x6a1938a7,0x5caaee1a,0xbf3c0de0
	.word  0x6d3d4d4b,0x4fd73eda,0x4b035ee8,0xd48ebd9b
	.word  0xe664be2c,0x19bec901,0x270bce6d,0x0600d650
	.word  0xdb1fe2e3,0x2c4c6012,0x2d2f2827,0x233d5623
	.word  0x198f0441,0xd927a440,0xbac58c91,0xf50ebf8e
	.word  0xee3351af,0xa147bef8,0x3f389785,0xef7aa8a8
	.word  0x2755c89a,0xd334e966,0xc36f61d4,0x69ef38ee
	.word  0x3da9f0d4,0x3ff7ad8b,0x7fedad9a,0xc52bd6d8
	.word  0x261fb89d,0x039da0d2,0xff82f858,0x087d0bab
	.word  0x1b4b5a4e,0x995ff97d,0xc1f627f4,0xcfb5d7d5
	.word  0xf14e3dbe,0x56c669d1,0x74d81fb6,0xae32b8ce
	.word  0x24579cc5,0x46a53ca4,0x5dd8e903,0x24139c7a
	.word  0x271bb481,0x21bdf553,0x8282f131,0x53478cdf
	.word  0x1d9cbffa,0xcd9a1492,0xa1b00226,0x8be5a801
	.word  0x6114a47b,0xdfe59453,0xee7ef82e,0x1b39aad0
	.word  0x8ea65fb2,0xc25d83db,0xe2ac847b,0x91b62602
	.word  0x71ac1f9e,0x92c83836,0xf04027a7,0x12a0e3da
	.word  0x14fb2e3b,0x2970ec7a,0xf19f1a31,0x0de9ff46
	.word  0x62cf3d53,0x0dde19d1,0x626b91d6,0x844e33f1
	.word  0x5726f19e,0x7bb35cf6,0xe729f035,0xa40fb34d
	.word  0x59c81449,0x2576f8c4,0xc9423cc6,0x26b699f6
	.word  0x156271d4,0x2070dc52,0x79b4bf27,0xb392f658
	.word  0x7546ccac,0xdfe480a8,0x10947f41,0xd5f9ecbd
	.word  0x3dded361,0x0cacb1f0,0x8ecfac59,0x25a40912
	.word  0x2dc4f341,0xd92b7d1c,0x627cac2e,0x461370d7
	.word  0x4fab4846,0xb7422f84,0x7615d2b4,0xb16db46a
	.word  0x32771770,0x44b5e17c,0x1d2a60b9,0x6874f42e
	.word  0x6a7c8b0a,0x71cc3cba,0x4553f951,0x1ce9ab3b
	.word  0xcef3f2fd,0x2cd15006,0xa9961110,0x4b2b811e
	.word  0xab2aed7d,0x8433b2e6,0x6ca22bbd,0x24775df5
	.word  0xa665bee4,0xdaa58f1e,0xf8b9fe3d,0xd55e7311
	.word  0x086be3ce,0xdd6e4a0f,0x4d2b2bc7,0x8b6c31ba
	.word  0x74a0c4f4,0xcf1f19bc,0xc0abfa6b,0xed816e1e
	.word  0x0a3746d5,0x61f7599d,0xa86a869d,0x528588dd
	.word  0xab397f8a,0x83480561,0x78ed88e3,0xad51ae9e
	.word  0x3d2d9c86,0x01c63c3b,0x1ebd3cbe,0x23192a38
	.word  0xc8a5dfa3,0xaeb48507,0x0e76e6fd,0x396d051f
	.word  0xd08131a8,0xfd5a12b1,0x80bb6b4b,0x3863e38e
	.word  0x7c4d268a,0x88613d06,0xc8332150,0x5c01bf03
	.word  0x0f6b46e8,0x4f862890,0xa5abc613,0x8dc4f5bc
	.word  0x771a1510,0x14c871cf,0xb8f8a2ff,0xdc9e4429
	.word  0x556ba470,0xacb72676,0x70ff5887,0x641d4dcc
	.word  0x06162658,0x797d500a,0x857fe827,0xbb5d52c7
	.word  0x10177db8,0xc74ad18f,0x78ff0bdd,0x7a35fa64
	.word  0x5d9c03a9,0xb5605227,0xece6c16f,0x1d88db14
	.word  0xde659dab,0xf6db3809,0x2017b8c8,0x64f8c9e0
	.word  0x925cee30,0x527c20b7,0xfe5aeeb4,0x8d54b774
	.word  0x0222a7df,0xccedde53,0x8602a3c4,0x06c64c83
	.word  0xaf5fa5cc,0xc8310357,0xb677ac25,0xe067fa7f
	.word  0x10d584e8,0x17d2e50b,0x1c7189d1,0x2f9dcfcf
	.word  0x31c86930,0xb8ee4794,0x1646c09e,0xd72d4c7e
	.word  0x1b5d476d,0x93fdb4f5,0xfba2ea39,0x0dabd160
	.word  0xb77cbd47,0xf1f874ab,0xe160119e,0x567b2555
	.word  0x12fdf952,0x503e9c9f,0x44d21100,0xae1855dd
	.word  0x7044af86,0xa599ae60,0x9e0ba940,0xfd0a4381
	.word  0xe902ea83,0xcfa182d7,0xbd55c301,0xf5b898e0
	.word  0x32f5c5ee,0x96315059,0x30156c13,0x034ec426
	.word  0x91257b2b,0xa30b3b3a,0xa9251664,0x4aa6f619
	.word  0x282dba7f,0x89848ee5,0x0252d39b,0x80896a18
	.word  0xe40a5b17,0x43a951ef,0x882e9a73,0x06533f32
	.word  0xacfe3ac4,0xed26ed5f,0x1dc05ced,0xcb952f72
	.word  0xbda493ce,0x2c431612,0x702ec40e,0x72caf90b
	.word  0xc29f5633,0xb855c748,0x45978cf8,0xfb613d5f
	.word  0x5fb2d345,0x15a85ca7,0xddabc5d6,0xb42b04e6
	.word  0x2bc44bc6,0x6a01acd4,0x0caf6660,0x90b6a0a3
	.word  0x9fb3658c,0xa9139147,0x1dc0fbab,0x9643c13a
	.word  0xb0adb9aa,0xbd4323fe,0x050363c1,0xfe704100
	.word  0xae0d4427,0x41059249,0xe799c8aa,0xa1d0c00c
	.word  0x14149507,0x454b32d5,0xb392e096,0x9b774090
	.word  0xcca340d6,0xc4eb46cc,0x1e44232e,0x47d13d19
	.word  0xb5bbc2a1,0x75c7069a,0x70556c8d,0x9a0c09f1
	.word  0x9f64e3cc,0xf13558de,0xf2769801,0x883ce088
	.word  0x1edb5ea1,0x235c75aa,0x0798a944,0xa736d47b
	.word  0x3345f486,0x6046100b,0x112ad59a,0x2e003dc2
	.word  0x4c7de201,0x4b3eb0b8,0x42005b7c,0xdd47f913
	.word  0xed627adf,0xf0e5c211,0xdd2b02c8,0x767f8fef
	.word  0xbca68e17,0x5b348727,0x4ed717e7,0x034d69e9
	.word  0xff9b927c,0x503eed33,0x28178576,0xacc1b574
	.word  0x63e2129f,0x94731841,0xbcd2f013,0x78777440
	.word  0xdb68ab8c,0xfccc9a11,0xc170944e,0x0b03def1
	.word  0x71c116b5,0xd70a5bd1,0xcbd16e35,0x6b3243ca
	.word  0x04a36b3f,0x037600c2,0x6a95ee0e,0x197633f7
	.word  0xb3e5f83b,0x00c93767,0x7d308b43,0xfa6bbdc9
	.word  0xab30c201,0x4b8c6a29,0xd3717134,0x925cc769
	.word  0x48ca7d9f,0xd56693dc,0x79ac0594,0xdac20097
	.word  0xab124f3a,0x927e5c7f,0x81ffae19,0xc9263e6a
	.word  0xf4839eb3,0x700b7bf9,0xc0cebff4,0xba9be32b
	.word  0xa68acbc1,0xee5b6743,0x29bc30d4,0xac4dbf1b
	.word  0xbebe059c,0xc9869be7,0x49e31656,0x7f63dfd2
	.word  0xb8814a2f,0xaddf21d0,0x2d77a8bc,0x421c8b62
	.word  0x0f30fcd1,0x6a4edd8f,0x1490cbb9,0x6d99e6aa
	.word  0x05a7c69a,0x8046357c,0x48519e38,0xcfedffee
	.word  0xc6056a49,0x7d5b8df7,0xe24c42ca,0xd7a5294f
	.word  0x2e5b0baf,0xea3fcfc3,0x90c177c6,0xf75d8f0a
	.word  0xdb623f0e,0xe1edd5fa,0x4a11dc6d,0xc3414bed
	.word  0x081e7bbf,0x38580a4e,0xe6f4de52,0x8501a854
	.word  0xdb59b919,0x26613897,0x1d50e5bf,0x6f6ba9a7
	.word  0x1f2ddea2,0x495fbed0,0xe9d5ee1d,0xb2b01ffb
	.word  0x78258f9c,0x68c4fd18,0xe72abb61,0x340ebd51
	.word  0x2d6a4431,0xefae2c72,0x685447c7,0x01542c23
	.word  0xd79ef59d,0xecc378ff,0x33a48d24,0xafcc8120
	.word  0x3499bf91,0xaac642f8,0x4140a98b,0x98270b35
	.word  0x98a33088,0xaf91c10c,0x98b273b7,0x14063757
	.word  0x8b3e752f,0xcb5581c4,0x9b50b851,0xf7e32a61
	.word  0x0034c95d,0xd74fbab8,0xcdf1a537,0x56df0c50
	.word  0xf12126ea,0xc8566913,0xf3826965,0x040720c8
	.word  0xa7661c08,0xed673888,0xcca8d6c7,0xee2eb033
	.word  0x970e9209,0x9f06940b,0xaf699e46,0x90337da2
	.word  0x769ad4f9,0xb0e84c19,0x13b6e9ae,0x92506f54
	.word  0x683ebb2e,0x58c1eff6,0x248ce528,0x0d3e9979
	.word  0xd38c13a0,0x5f101df7,0x8c0c8fe3,0x668b4ff2
	.word  0xa66efa72,0xadf9a22c,0x73faea54,0x1ae8cab0
	.word  0xbb1252a0,0xe0e6a607,0xc8704c86,0xec4016a8
	.word  0xaee3b0d9,0x29b6a046,0xaa615a99,0x2a1affc9
	.word  0x849586f8,0xe30d0ae8,0x5c43cd4e,0x15128105
	.word  0xaeeecd84,0xb7d37abd,0x01c30ce3,0x92239931
	.word  0x2fa5d9de,0xa1aa5791,0x63a8dc9f,0xdbcd876d
	.word  0xe915e13c,0xd08f6451,0x6aeeba2a,0xc3f4fa4a
	.word  0x3381404a,0x6926e880,0x9b1abece,0x963cc049
	.word  0x57802d5c,0x445b99a6,0xcb475f9f,0x4861c8c8
	.word  0x7c790b9d,0x7feb7502,0x1fd3811b,0xc4e3fe19
	.word  0x32677bb0,0x2c5466d9,0xa50018a9,0x6651f6b2
	.word  0x00e28663,0xe31c919d,0x01ec701e,0x6767755a
	.word  0x0b2cc141,0xac6a7a58,0x6280297a,0xd8846c6a
	.word  0xd99b67dc,0xc323a977,0x564215ab,0x21011ca5
	.word  0x3361a44d,0x4f57d3a9,0xa76a307a,0x6a3312d5
	.word  0x35ec5898,0x834a352d,0xdd54987a,0x0baed48e
	.word  0x655194df,0x4ac46b1a,0xff71b305,0x190f0609
	.word  0x8efc07ae,0xe108db83,0x0bff6fe9,0x1f413e50
	.word  0x529300e9,0xa899c01d,0xdbcb94be,0xd8d78608
	.word  0xa1ca6ca0,0x6b897ce2,0x13dc0b08,0xaadbb7a2
	.word  0x9dd94cd8,0xcd6fdb30,0xe3cf47f4,0x266474f0
	.word  0x4d9d9b8c,0x377e1a0b,0x477c3606,0xbe2fc0f0
	.word  0x7d10bd90,0x2e632c18,0xfd7b9d0e,0x2e3f7138
	.word  0xf3995f22,0x375eff79,0xc6316688,0x52ed00cf
	.word  0xb187743e,0x727752c6,0x543ff118,0xe13d7229
	.word  0x9cbb4214,0x442d2444,0xd32469f8,0x616a0ba1
	.word  0xd6684013,0x499ae70a,0x3dd7b5c5,0x5621d162
	.word  0x4fd2578e,0xa94a3060,0xb72fbae5,0xa7e14956
	.word  0x03d9e432,0xf2ac7a55,0xbc80d4a3,0x15ad0666
	.word  0x1d0a84d9,0x7d83d97f,0xb08b10e6,0xc98de6ed
	.word  0xcf5a2c8d,0xd6d7536d,0x57fbe0a9,0x4703a6cb
	.word  0x4d1323f1,0x6bfabbef,0x493b7d05,0x3e27e892
	.word  0xfa11ea44,0x617bd795,0x059c7306,0x6c2037bb
	.word  0xcda4eeec,0xec3a1915,0x49228913,0x19c58a8d
	.word  0x0f62fe4b,0xe7df1d88,0xc2eb3790,0xaccf58ff
	.word  0xacc2bff8,0x5a18cdd7,0x7920631c,0x5affe4c5
	.word  0xc2215b6f,0xf1502344,0x85faab5f,0xc3e07b29
	.word  0x9ddbc58d,0x8460f79a,0x34cfb07f,0x335df2d7
	.word  0x71d63d08,0x41c1b4e9,0x8a55a678,0xd078a159
	.word  0x71aec443,0x78c33a8b,0x6f3a66ea,0x3beb98ad
	.word  0x16b8b9ab,0x607f10ab,0xaf5a7354,0x60b83c14
	.word  0x3daed57b,0xf6803d07,0xd218452c,0x33b91a72
	.word  0xe1365d54,0x909d5654,0x471b7812,0x3948a8f2
	.word  0xab140ed5,0xfa52aa5a,0xdc38eed1,0x340f9a00
	.word  0x03f6cf5f,0xe72a0bd3,0xd5d17612,0x7553e7e8
	.word  0xde4a6fca,0x9762ec17,0xff26056d,0x15d1a098
	.word  0xc579b5f3,0xd32423ae,0xf514af57,0xdac02040
	.word  0x30e61069,0x33298002,0x89e080a1,0x92f9cb44
	.word  0x9dfc7784,0x4122cab2,0x5b2b7cd1,0x3a07cc1d
	.word  0x30f45a3f,0x5c3be621,0xd9c560c5,0xb586cb3b
	.word  0x8cb6fa09,0x796683d7,0x392b0b6c,0xe9448a64
	.word  0x8e9ea68d,0xe35b4b07,0x3218e6b3,0xae77525a
	.word  0x4b283f54,0x9e7d9b95,0xb47a8b21,0x05ee1b12
	.word  0xb659bcd2,0xa4a7da94,0x8162479c,0xa19bd7c2
	.word  0x263ed006,0x4bd2738b,0xf90a9d85,0xeef19fd4
	.word  0xe7856c0b,0xbd84b256,0x76880052,0x465df7b4
	.word  0x5215c72a,0x520a9756,0x2cf587bc,0x4f8335b2
	.word  0xc036ccb2,0xfd608cbe,0x29d3b823,0xcaa06936
	.word  0x0080a9c1,0x630bc0b9,0x2d512b80,0x34906513
	.word  0x85575e85,0xc2e59a41,0x77d09ffd,0x511c673d
	.word  0x5b7dc3b3,0x74a758c6,0xd48856b0,0x5d0344c5
	.word  0x0648e1d5,0xb168fbd2,0x5a633f0f,0xd3f47163
	.word  0xdb9f94c4,0x7b980ba8,0xc8f2e47d,0x1fe868c1
	.word  0x95800adf,0xd0ecbdc0,0xc77abdc0,0x8637e80d
	.word  0xa122df25,0x9da43982,0x6e00f205,0x9ba4731a
	.word  0xa057e95c,0x5eb86dd5,0x96db1251,0x492e171d
	.word  0x83e348e2,0xd0e28468,0x3072b5a9,0xb27a14d5
	.word  0x25bdb8ce,0x2d31f6c6,0x0bde6d91,0xa623d2d8
	.word  0xbfa49610,0x8c563186,0x90579f99,0xe3de4f1c
	.word  0x6180a17b,0xed3a33f8,0x4f47b6cd,0x3f8641b1
	.word  0xe922d328,0x318342e2,0x8203e0f9,0xf2ea49d3
	.word  0xaae99a07,0xc2c71608,0x91cea2b4,0xe6a87ba9
	.word  0x76598a3a,0x8fb35ddf,0x93d32fd0,0x7e928fda
	.word  0x22a18eae,0xefca0307,0x8adce0cb,0xeda99132
	.word  0xfa4551e8,0x66e18235,0x1eb6a44f,0xb98165bc
	.word  0xb49ff7e9,0xad404fb6,0x76ac5db4,0x2c85d613
	.word  0x0de972d3,0xe04a21f9,0xb42ec771,0x5a66cee0
	.word  0x93e7d469,0xfc0e7aa6,0xf5b57091,0xbd89b181
	.word  0x943385bc,0x00363de6,0x8142abb1,0x2134d13c
	.word  0x87bc6d26,0x2df1237a,0xf77adafa,0x2780eb38
	.word  0x6b0b01b5,0x63faa088,0x99ec3c26,0xad9888c5
	.word  0x6b44bc5b,0x2512b1c1,0xea40fb73,0xb309ee44
	.word  0x94baa9a3,0xa4e3dc7e,0x10f82bbf,0x5663dee6
	.word  0x0ed91a5b,0xfe2b6193,0x240c5b8a,0x4044d874
	.word  0xc1b78b78,0x6f4a1033,0x845ef1d8,0x37fe3ec1
	.word  0x4068951d,0xcb4af00e,0x4fa605ef,0xe1bab8f9
	.word  0xac4e4e2a,0x7e61d577,0x3629ae87,0x32dcbc9f
	.word  0x0ec16a54,0x6d2f2f70,0x348a722e,0x183bdec0
	.word  0xb89f272d,0xf96f0987,0x9c3b2802,0x56bb59f1
	.word  0xc08c553b,0x29cebef2,0x6552dd43,0x5d62fefb
	.word  0x42de19a5,0x25763f5f,0x1d7da1c4,0x214d356f
	.word  0xf3fbcffe,0x916526d2,0x9d70464d,0x5cdaee3b
	.word  0x2ec489dc,0xe9d7666e,0x2731531c,0x2aea1011
	.word  0x53cd8152,0xed1fa72c,0x607b0479,0x66e56ac8
	.word  0x0d03902f,0xccd07a8d,0xc6fd6b2d,0x5acf8c07
	.word  0xf6fddf55,0x1f90134d,0x7bfdb6ca,0xcbd611ef
	.word  0x742b7024,0xaa60d4a4,0x03512212,0xea0cc297
	.word  0x6fe076eb,0xc6ed3e69,0x510a4ad4,0x03c7c41b
	.word  0xcd9a6b65,0xd55b37e9,0xcade0428,0x25a7cd49
	.word  0xed2a6449,0x10091901,0xd4002398,0x6bb0fdda
	.word  0xfb533179,0xd2bb9fdc,0x7743f950,0xeef93b5b
	.word  0x23bd5db9,0x7eb61efa,0x68d86048,0xe90376e5
	.word  0x4a371559,0x06809d70,0x6bc73c94,0x352cb03c
	.word  0x3df4f196,0xc114d8b6,0x146a530a,0xde9f8370
	.word  0xd101fd6d,0xe527c2b1,0x627d4056,0xa9c1ede1
	.word  0x2cea5173,0xae2b48d8,0x5150ba35,0x019bcd5b
	.word  0xc120c5b3,0xaffc9d48,0x8c4dcfca,0x837450f8
	.word  0x2616b241,0x5ae460a9,0x6f424887,0x24f378d1
	.word  0x545c00c4,0x1ce7ba11,0x7b0ff792,0xe05e4455
	.word  0x5917e409,0x98bc77c9,0x6c33eafc,0x37cf600b
	.word  0x67b4a67b,0xdbbfdece,0x41a9f005,0x9c37c8ec
	.word  0xf5c3814a,0x405a897d,0x48a47a40,0xea8546f1
	.word  0x168dbdd4,0xcc9a6aa1,0x0d703442,0x810b23eb
	.word  0xa23b11f2,0x927a12b5,0xa19c1152,0x2dda6fe9
	.word  0xcb8ba4e5,0x4be6fc7b,0x1e9dc61d,0x767a678e
	.word  0xc15a484b,0x8f9249a5,0xf249839a,0x5dfa30b4
	.word  0x4a13e966,0xdeb1c9d2,0xd71458d7,0xd294f799
	.word  0xb9adf5d0,0xee7d3590,0x0a5f0ce3,0xf89de686
	.word  0x6f917371,0x8aca342a,0xfc46f165,0xcfe4d135
	.word  0x38070944,0x3ed2dd94,0x56b15cd3,0xf600158f
	.word  0x373bbc2f,0xe37f935f,0x66554285,0x3b8cff50
	.word  0x7c8f5e3d,0x3cc5d345,0x907a6577,0x930d00a7
	.word  0xcc92b6fd,0xc57ea073,0xa94e26ee,0xea563c08
	.word  0xd7b0aaef,0x36c096d4,0x18a06ea6,0x39ed0868
	.word  0x3a5df943,0x06faf1ae,0x6d9cfe26,0x73506586
	.word  0x3aa939f9,0xeda562f9,0x5ed36ce5,0xd1b693e3
	.word  0xd0c59224,0xde88a1d6,0xd0371e5f,0xb8a65116
	.word  0x2f4bfb39,0x46d9238a,0x32ec4d82,0xb083f651
	.word  0x70c98482,0x806ff9c3,0x93824aed,0x09bcf11d
	.word  0xdeb58a17,0x1ea28b07,0xbec0309b,0xdb2f8b3c
	.word  0x03b52fc1,0x129a411d,0xdb9c4929,0x399dcb22
	.word  0x47e1a3e1,0x064580ff,0x580dbacb,0x8c9204ea
	.word  0xd218a7cf,0x28805cc7,0x84ed8f96,0x26d37a06
	.word  0x62b0e706,0x6b44409a,0xc454b664,0x1158965e
	.word  0xf07a132f,0x7db05b71,0x528f2716,0xd5f6ee5e

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
!!# 
!!# th_main_1:
!!# !<<IJ>>include "th1.s"
!!# 	nop
!!# 	nop
!!# 	nop
!!#         ta      T_GOOD_TRAP
!!# 
!!# th_main_2:
!!# !<<IJ>>include "th2.s"
!!# 	nop
!!# 	nop
!!# 	nop
!!#         ta      T_GOOD_TRAP
!!# 
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
!! Rule   1 (line  117), Count:   975  inst_block           -> inst_type 
!! Rule   2 (line  118), Count:   975  inst_block           -> inst_block inst_type 
!! Rule   3 (line  121), Count:   301  inst_type            -> stb_raw 
!! Rule   4 (line  122), Count:   673  inst_type            -> lop 
!! Rule   5 (line  128), Count:   301  stb_raw              -> store_r load_r 
!! Rule   6 (line  134), Count:    71  lop                  -> mul 
!! Rule   7 (line  134), Count:    63  lop                  -> div 
!! Rule   8 (line  134), Count:    66  lop                  -> fpop 
!! Rule   9 (line  134), Count:    55  lop                  -> load 
!! Rule  10 (line  134), Count:    66  lop                  -> asi_load 
!! Rule  11 (line  134), Count:    63  lop                  -> asi_st 
!! Rule  12 (line  134), Count:    65  lop                  -> br 
!! Rule  13 (line  134), Count:    66  lop                  -> membar 
!! Rule  14 (line  134), Count:    72  lop                  -> atomic 
!! Rule  15 (line  134), Count:    77  lop                  -> prefetch 
!! Rule  16 (line  137), Count:    33  store_r              -> tSTB_R 
!! Rule  17 (line  137), Count:    28  store_r              -> tSTH_R 
!! Rule  18 (line  137), Count:    44  store_r              -> tSTW_R 
!! Rule  19 (line  137), Count:    42  store_r              -> tSTX_R 
!! Rule  22 (line  140), Count:    16  load_r               -> tLDSB_R 
!! Rule  23 (line  140), Count:    12  load_r               -> tLDSH_R 
!! Rule  24 (line  140), Count:    15  load_r               -> tLDSW_R 
!! Rule  25 (line  140), Count:    14  load_r               -> tLDUB_R 
!! Rule  26 (line  140), Count:    15  load_r               -> tLDUH_R 
!! Rule  27 (line  140), Count:    19  load_r               -> tLDUW_R 
!! Rule  28 (line  140), Count:    13  load_r               -> tLDX_R 
!! Rule  29 (line  140), Count:    17  load_r               -> tLDD_R 
!! Rule  30 (line  140), Count:    15  load_r               -> tLDF_R 
!! Rule  31 (line  140), Count:     5  load_r               -> tLDDF_R 
!! Rule  32 (line  143), Count:    35  fpop                 -> st_fp 
!! Rule  33 (line  143), Count:    30  fpop                 -> arith_fp 
!! Rule  34 (line  146), Count:     4  mul                  -> tMULX_R 
!! Rule  35 (line  146), Count:     5  mul                  -> tMULX_I 
!! Rule  36 (line  146), Count:    11  mul                  -> tUMUL_R 
!! Rule  37 (line  146), Count:     1  mul                  -> tUMUL_I 
!! Rule  38 (line  146), Count:     4  mul                  -> tSMUL_R 
!! Rule  39 (line  146), Count:     3  mul                  -> tSMUL_I 
!! Rule  40 (line  146), Count:     4  mul                  -> tUMULcc_R 
!! Rule  41 (line  146), Count:     7  mul                  -> tUMULcc_I 
!! Rule  42 (line  146), Count:     3  mul                  -> tSMULcc_R 
!! Rule  43 (line  146), Count:     4  mul                  -> tSMULcc_I 
!! Rule  44 (line  146), Count:     6  mul                  -> tMULScc_R 
!! Rule  45 (line  146), Count:     8  mul                  -> tMULScc_I 
!! Rule  46 (line  149), Count:     3  div                  -> tUDIV_I 
!! Rule  47 (line  149), Count:     7  div                  -> tUDIV_R 
!! Rule  48 (line  149), Count:     5  div                  -> tSDIV_I 
!! Rule  49 (line  149), Count:     3  div                  -> tSDIV_R 
!! Rule  50 (line  149), Count:     4  div                  -> tSDIVX_R 
!! Rule  51 (line  149), Count:     8  div                  -> tSDIVX_I 
!! Rule  52 (line  149), Count:     2  div                  -> tUDIVX_R 
!! Rule  53 (line  149), Count:     6  div                  -> tUDIVX_I 
!! Rule  54 (line  149), Count:     1  div                  -> tUDIVcc_I 
!! Rule  55 (line  149), Count:     3  div                  -> tUDIVcc_R 
!! Rule  56 (line  149), Count:     4  div                  -> tSDIVcc_I 
!! Rule  57 (line  149), Count:     6  div                  -> tSDIVcc_R 
!! Rule  58 (line  152), Count:     0  load                 -> tLDSB_R 
!! Rule  59 (line  152), Count:     4  load                 -> tLDSB_I 
!! Rule  60 (line  152), Count:     2  load                 -> tLDSH_R 
!! Rule  61 (line  152), Count:     6  load                 -> tLDSH_I 
!! Rule  62 (line  152), Count:     2  load                 -> tLDSW_R 
!! Rule  63 (line  152), Count:     3  load                 -> tLDSW_I 
!! Rule  64 (line  152), Count:     2  load                 -> tLDUB_R 
!! Rule  65 (line  152), Count:     3  load                 -> tLDUB_I 
!! Rule  66 (line  152), Count:     2  load                 -> tLDUH_R 
!! Rule  67 (line  152), Count:     1  load                 -> tLDUH_I 
!! Rule  68 (line  152), Count:     0  load                 -> tLDUW_R 
!! Rule  69 (line  152), Count:     1  load                 -> tLDUW_I 
!! Rule  70 (line  152), Count:     2  load                 -> tLDX_R 
!! Rule  71 (line  152), Count:     1  load                 -> tLDX_I 
!! Rule  72 (line  152), Count:     2  load                 -> tLDD_R 
!! Rule  73 (line  152), Count:     3  load                 -> tLDD_I 
!! Rule  74 (line  152), Count:     0  load                 -> tLDF_I 
!! Rule  75 (line  152), Count:     1  load                 -> tLDF_R 
!! Rule  76 (line  152), Count:     0  load                 -> tLDDF_I 
!! Rule  77 (line  152), Count:     1  load                 -> tLDDF_R 
!! Rule  78 (line  155), Count:     2  asi_load             -> tLDSBA_R 
!! Rule  79 (line  155), Count:     0  asi_load             -> tLDSBA_I 
!! Rule  80 (line  155), Count:     2  asi_load             -> tLDSHA_R 
!! Rule  81 (line  155), Count:     0  asi_load             -> tLDSHA_I 
!! Rule  82 (line  155), Count:     4  asi_load             -> tLDSWA_R 
!! Rule  83 (line  155), Count:     6  asi_load             -> tLDSWA_I 
!! Rule  84 (line  155), Count:     3  asi_load             -> tLDUBA_R 
!! Rule  85 (line  155), Count:     4  asi_load             -> tLDUBA_I 
!! Rule  86 (line  155), Count:     4  asi_load             -> tLDUHA_R 
!! Rule  87 (line  155), Count:     2  asi_load             -> tLDUHA_I 
!! Rule  88 (line  155), Count:     6  asi_load             -> tLDUWA_R 
!! Rule  89 (line  155), Count:     9  asi_load             -> tLDUWA_I 
!! Rule  90 (line  155), Count:     0  asi_load             -> tLDXA_R 
!! Rule  91 (line  155), Count:     4  asi_load             -> tLDXA_I 
!! Rule  92 (line  155), Count:     2  asi_load             -> tLDDA_R 
!! Rule  93 (line  155), Count:     3  asi_load             -> tLDDA_I 
!! Rule  94 (line  158), Count:     1  asi_st               -> tSTBA_R 
!! Rule  95 (line  158), Count:     7  asi_st               -> tSTBA_I 
!! Rule  96 (line  158), Count:     3  asi_st               -> tSTHA_R 
!! Rule  97 (line  158), Count:     4  asi_st               -> tSTHA_I 
!! Rule  98 (line  158), Count:     6  asi_st               -> tSTWA_R 
!! Rule  99 (line  158), Count:     8  asi_st               -> tSTWA_I 
!! Rule 100 (line  158), Count:     6  asi_st               -> tSTXA_R 
!! Rule 101 (line  158), Count:     5  asi_st               -> tSTXA_I 
!! Rule 102 (line  158), Count:     7  asi_st               -> tSTDA_R 
!! Rule 103 (line  158), Count:     7  asi_st               -> tSTDA_I 
!! Rule 104 (line  161), Count:     2  br                   -> tBA 
!! Rule 105 (line  161), Count:     3  br                   -> tBN 
!! Rule 106 (line  161), Count:     4  br                   -> tBNE 
!! Rule 107 (line  161), Count:     2  br                   -> tBE 
!! Rule 108 (line  161), Count:     3  br                   -> tBG 
!! Rule 109 (line  161), Count:     1  br                   -> tBLE 
!! Rule 110 (line  161), Count:     0  br                   -> tBGE 
!! Rule 111 (line  161), Count:     3  br                   -> tBL 
!! Rule 112 (line  161), Count:     3  br                   -> tBGU 
!! Rule 113 (line  161), Count:     0  br                   -> tBLEU 
!! Rule 114 (line  162), Count:     1  br                   -> tBCC 
!! Rule 115 (line  162), Count:     1  br                   -> tBCS 
!! Rule 116 (line  162), Count:     1  br                   -> tBPOS 
!! Rule 118 (line  162), Count:     1  br                   -> tBVC 
!! Rule 119 (line  162), Count:     1  br                   -> tBVS 
!! Rule 120 (line  162), Count:     5  br                   -> tBRZ 
!! Rule 121 (line  162), Count:     2  br                   -> tBRLEZ 
!! Rule 122 (line  163), Count:     1  br                   -> tBRLZ 
!! Rule 123 (line  163), Count:     3  br                   -> tBRNZ 
!! Rule 124 (line  163), Count:     2  br                   -> tBRGZ 
!! Rule 125 (line  163), Count:     3  br                   -> tBRGEZ 
!! Rule 126 (line  163), Count:     2  br                   -> tCALL 
!! Rule 127 (line  166), Count:    32  membar               -> tMEMBAR 
!! Rule 128 (line  166), Count:    33  membar               -> tSTBAR 
!! Rule 129 (line  169), Count:     4  atomic               -> tCASA_R 
!! Rule 130 (line  169), Count:     1  atomic               -> tCASA_I 
!! Rule 131 (line  169), Count:     7  atomic               -> tCASXA_R 
!! Rule 132 (line  169), Count:     4  atomic               -> tCASXA_I 
!! Rule 133 (line  169), Count:     7  atomic               -> tLDSTUBA_I 
!! Rule 134 (line  169), Count:     5  atomic               -> tLDSTUB_I 
!! Rule 135 (line  169), Count:    11  atomic               -> tLDSTUB_R 
!! Rule 136 (line  169), Count:     4  atomic               -> tLDSTUBA_R 
!! Rule 137 (line  169), Count:     6  atomic               -> tSWAP_I 
!! Rule 138 (line  169), Count:     6  atomic               -> tSWAP_R 
!! Rule 139 (line  169), Count:     5  atomic               -> tSWAPA_I 
!! Rule 140 (line  169), Count:     1  atomic               -> tSWAPA_R 
!! Rule 142 (line  172), Count:    20  st_fp                -> tSTF_I 
!! Rule 143 (line  172), Count:    14  st_fp                -> tSTDF_I 
!! Rule 145 (line  175), Count:    11  arith_fp             -> tFADDs 
!! Rule 146 (line  175), Count:     3  arith_fp             -> tFSUBs 
!! Rule 147 (line  175), Count:     7  arith_fp             -> tFMULs 
!! Rule 148 (line  175), Count:     6  arith_fp             -> tFDIVs 
!! Rule 149 (line  178), Count:    22  prefetch             -> tPREFETCH_I 
!! Rule 150 (line  178), Count:     7  prefetch             -> tPREFETCH_R 
!! Rule 151 (line  178), Count:    21  prefetch             -> tPREFETCHA_I 
!! 
!!   257: Token tSTB_R	Count = 34
!!   258: Token tSTH_R	Count = 29
!!   259: Token tSTW_R	Count = 45
!!   260: Token tSTX_R	Count = 43
!!   261: Token tSTF_R	Count = 11
!!   262: Token tSTDF_R	Count = 13
!!   263: Token tLDSB_R	Count = 18
!!   264: Token tLDSH_R	Count = 16
!!   265: Token tLDSW_R	Count = 19
!!   266: Token tLDUB_R	Count = 18
!!   267: Token tLDUH_R	Count = 19
!!   268: Token tLDUW_R	Count = 21
!!   269: Token tLDX_R	Count = 17
!!   270: Token tLDD_R	Count = 21
!!   271: Token tLDF_R	Count = 18
!!   272: Token tLDDF_R	Count = 8
!!   273: Token tMULX_R	Count = 5
!!   274: Token tMULX_I	Count = 6
!!   275: Token tUMUL_R	Count = 12
!!   276: Token tUMUL_I	Count = 2
!!   277: Token tSMUL_R	Count = 5
!!   278: Token tSMUL_I	Count = 4
!!   279: Token tUMULcc_R	Count = 5
!!   280: Token tUMULcc_I	Count = 8
!!   281: Token tSMULcc_R	Count = 4
!!   282: Token tSMULcc_I	Count = 5
!!   283: Token tMULScc_R	Count = 7
!!   284: Token tMULScc_I	Count = 9
!!   285: Token tUDIV_I	Count = 4
!!   286: Token tUDIV_R	Count = 8
!!   287: Token tSDIV_I	Count = 6
!!   288: Token tSDIV_R	Count = 4
!!   289: Token tSDIVX_R	Count = 5
!!   290: Token tSDIVX_I	Count = 9
!!   291: Token tUDIVX_R	Count = 3
!!   292: Token tUDIVX_I	Count = 7
!!   293: Token tUDIVcc_I	Count = 2
!!   294: Token tUDIVcc_R	Count = 4
!!   295: Token tSDIVcc_I	Count = 5
!!   296: Token tSDIVcc_R	Count = 7
!!   297: Token tLDSB_I	Count = 5
!!   298: Token tLDSH_I	Count = 7
!!   299: Token tLDSW_I	Count = 4
!!   300: Token tLDUB_I	Count = 4
!!   301: Token tLDUH_I	Count = 2
!!   302: Token tLDUW_I	Count = 2
!!   303: Token tLDX_I	Count = 2
!!   304: Token tLDD_I	Count = 4
!!   305: Token tLDF_I	Count = 1
!!   306: Token tLDDF_I	Count = 1
!!   307: Token tLDSBA_R	Count = 3
!!   308: Token tLDSBA_I	Count = 1
!!   309: Token tLDSHA_R	Count = 3
!!   310: Token tLDSHA_I	Count = 1
!!   311: Token tLDSWA_R	Count = 5
!!   312: Token tLDSWA_I	Count = 7
!!   313: Token tLDUBA_R	Count = 4
!!   314: Token tLDUBA_I	Count = 5
!!   315: Token tLDUHA_R	Count = 5
!!   316: Token tLDUHA_I	Count = 3
!!   317: Token tLDUWA_R	Count = 7
!!   318: Token tLDUWA_I	Count = 10
!!   319: Token tLDXA_R	Count = 1
!!   320: Token tLDXA_I	Count = 5
!!   321: Token tLDDA_R	Count = 3
!!   322: Token tLDDA_I	Count = 4
!!   323: Token tSTBA_R	Count = 2
!!   324: Token tSTBA_I	Count = 8
!!   325: Token tSTHA_R	Count = 4
!!   326: Token tSTHA_I	Count = 5
!!   327: Token tSTWA_R	Count = 7
!!   328: Token tSTWA_I	Count = 9
!!   329: Token tSTXA_R	Count = 7
!!   330: Token tSTXA_I	Count = 6
!!   331: Token tSTDA_R	Count = 8
!!   332: Token tSTDA_I	Count = 8
!!   333: Token tBA	Count = 3
!!   334: Token tBN	Count = 4
!!   335: Token tBNE	Count = 5
!!   336: Token tBE	Count = 3
!!   337: Token tBG	Count = 4
!!   338: Token tBLE	Count = 2
!!   339: Token tBGE	Count = 1
!!   340: Token tBL	Count = 4
!!   341: Token tBGU	Count = 4
!!   342: Token tBLEU	Count = 1
!!   343: Token tBCC	Count = 2
!!   344: Token tBCS	Count = 2
!!   345: Token tBPOS	Count = 2
!!   346: Token tBNEG	Count = 0
!!   347: Token tBVC	Count = 2
!!   348: Token tBVS	Count = 2
!!   349: Token tBRZ	Count = 6
!!   350: Token tBRLEZ	Count = 3
!!   351: Token tBRLZ	Count = 2
!!   352: Token tBRNZ	Count = 4
!!   353: Token tBRGZ	Count = 3
!!   354: Token tBRGEZ	Count = 4
!!   355: Token tCALL	Count = 3
!!   356: Token tMEMBAR	Count = 33
!!   357: Token tSTBAR	Count = 34
!!   358: Token tCASA_R	Count = 5
!!   359: Token tCASA_I	Count = 2
!!   360: Token tCASXA_R	Count = 8
!!   361: Token tCASXA_I	Count = 5
!!   362: Token tLDSTUBA_I	Count = 8
!!   363: Token tLDSTUB_I	Count = 6
!!   364: Token tLDSTUB_R	Count = 12
!!   365: Token tLDSTUBA_R	Count = 5
!!   366: Token tSWAP_I	Count = 7
!!   367: Token tSWAP_R	Count = 7
!!   368: Token tSWAPA_I	Count = 6
!!   369: Token tSWAPA_R	Count = 2
!!   370: Token tSTF_I	Count = 21
!!   371: Token tSTDF_I	Count = 15
!!   372: Token tFADDs	Count = 12
!!   373: Token tFSUBs	Count = 4
!!   374: Token tFMULs	Count = 8
!!   375: Token tFDIVs	Count = 7
!!   376: Token tPREFETCH_I	Count = 23
!!   377: Token tPREFETCH_R	Count = 8
!!   378: Token tPREFETCHA_I	Count = 22
!!   379: Token tPREFETCHA_R	Count = 25
!! 
!! 
!! +++ finish +++

